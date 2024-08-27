from dash import dcc, callback, Output, Input, html
import dash_mantine_components as dmc
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
import psycopg2
from dash import Dash

try:
    conn = psycopg2.connect(
        dbname="godziny-db",
        user="postgres",
        password="root",
        host="localhost",
        port="5432"
    )
    print("Conexão ao PostgreSQL bem-sucedida")
except UnicodeDecodeError as e:
    print(f"Erro de decodificação: {e}")

# Função para executar consultas e retornar resultados como DataFrame
def executar_consulta(query, params=None):
    if conn:
        try:
            with conn.cursor() as cursor:
                cursor.execute(query, params)  # Passe params como tupla
                colnames = [desc[0] for desc in cursor.description]
                resultados = cursor.fetchall()
                return pd.DataFrame(resultados, columns=colnames)
        except psycopg2.Error as e:
            print("Erro ao executar a consulta:", e)
    return pd.DataFrame()


app = Dash(__name__, suppress_callback_exceptions=True)

# Consultas SQL
queries = {
    "REJEITADA": """
        SELECT u.nome, ROUND(SUM(a.carga_horaria * ct.horas_multiplicador)::numeric, 2) AS horas_totais
        FROM tb_atividade AS a
        JOIN tb_usuario AS u ON u.matricula = a.usuario_id
        JOIN tb_categoria AS ct ON ct.id = a.categoria_id
        WHERE a.status = 'REJEITADA' 
        GROUP BY u.nome
        ORDER BY u.nome;
    """,
    "APROVADA": """
        SELECT u.nome, SUM(a.carga_horaria * ct.horas_multiplicador) AS horas_totais
        FROM tb_atividade AS a
        JOIN tb_usuario AS u ON u.matricula = a.usuario_id
        JOIN tb_categoria AS ct ON ct.id = a.categoria_id
        WHERE a.status = 'APROVADA' 
        GROUP BY u.nome
        ORDER BY u.nome;
    """
}

queries_atividades = {
    "Atividades":"""
    SELECT 
        u.nome, 
        a.titulo AS atividade_titulo,
        a.carga_horaria AS atividade_carga_horaria,
        c.nome AS categoria_nome,
        c.horas_multiplicador AS categoria_horar_multiplicador,
        c.porcentagem_horas_maximas AS categoria_horas_maximas,
        cu.carga_horaria_complementar AS curso_hora,
        a.status AS status,
        (a.carga_horaria * c.horas_multiplicador::FLOAT) AS horas_feitas,
        (c.porcentagem_horas_maximas * cu.carga_horaria_complementar) AS horas_max
    FROM 
        tb_usuario AS u
    JOIN 
        tb_atividade AS a ON u.matricula = a.usuario_id
    JOIN 
        tb_categoria AS c ON a.categoria_id = c.id
    JOIN 
        tb_curso AS cu ON c.curso_id = cu.id
    WHERE 
        u.matricula = %s;
    """
}

queries_categoria = {
    "Categoria": """
    SELECT 
        u.nome, 
        c.nome AS categoria_nome,
        a.status AS status,
        ROUND(SUM(a.carga_horaria * c.horas_multiplicador)::numeric, 2) AS horas_feitas,
        ROUND((c.porcentagem_horas_maximas * cu.carga_horaria_complementar)::numeric, 2) AS horas_max
    FROM 
        tb_usuario AS u
    JOIN 
        tb_atividade AS a ON u.matricula = a.usuario_id
    JOIN 
        tb_categoria AS c ON a.categoria_id = c.id
    JOIN 
        tb_curso AS cu ON c.curso_id = cu.id
    WHERE 
        u.matricula = %s
    GROUP BY 
        u.nome, c.nome, a.status, horas_max;
        
    """
}


app.layout = html.Div([
    dcc.Location(id='url', refresh=False),
    dcc.Dropdown(
        options=[
            {'label': 'Rejeitada', 'value': 'REJEITADA'},
            {'label': 'Aprovada', 'value': 'APROVADA'}
        ],
        id='status-dropdown',
        value='REJEITADA'
    ),
    html.Div(id='graphs-container')
])

@app.callback(
    Output('graphs-container', 'children'),
    Input('status-dropdown', 'value'),
    Input('url', 'search')
)
def render_graphs(selected_status, search):
    search_params = {}
    for item in search.lstrip('?').split("&"):
        if "=" in item:
            key, value = item.split("=", 1)
            search_params[key] = value

    try:
        matricula = int(search_params.get('matricula', 0))
    except ValueError:
        matricula = 0 

    tipo_usuario = search_params.get('tipo', 'default_tipo')

    if tipo_usuario == 'ADM':
        # Gráfico para usuários do tipo ADM
        
        # Gráfico para horas
        query = queries.get(selected_status, "")
        df = executar_consulta(query, (matricula,)) if query else pd.DataFrame()

        if df.empty:
            fig_categoria = px.bar(x=[], y=[], title=f'Nenhum dado disponível para {selected_status}')
        else:
            fig_categoria = px.bar(df, x='nome', y='horas_totais', title=f'Horas Totais {selected_status}')
            fig_categoria.update_layout(xaxis_title='Nome', yaxis_title='Horas Totais')

        return dcc.Graph(id='categoria-bar-chart', figure=fig_categoria)
    else:
        # Gráfico de categorias (horas feitas vs. horas máximas)
        df_categoria = executar_consulta(queries_categoria['Categoria'], (matricula,))
        if not df_categoria.empty:
            fig_categoria = go.Figure()
            fig_categoria.add_trace(go.Bar(
                x=df_categoria['categoria_nome'], 
                y=df_categoria['horas_feitas'], 
                name='Horas Feitas',
                marker=dict(color='#0099ff')
            ))
            fig_categoria.add_trace(go.Bar(
                x=df_categoria['categoria_nome'], 
                y=df_categoria['horas_max'], 
                name='Horas Máximas',
                marker=dict(color='#404040')
            ))
            fig_categoria.update_layout(
                title_text='Horas Totais por Categoria',
                height=400,
                barmode='group',
                xaxis_title='Categoria',
                yaxis_title='Horas'
            )
        else:
            fig_categoria = go.Figure()
            fig_categoria.update_layout(
                title_text='Nenhum dado disponível para categorias',
                height=400
            )

        # Gráfico de atividades em porcentagem (tempo feito vs. não feito)
        df_atividades = executar_consulta(queries_atividades['Atividades'], (matricula,))
        if not df_atividades.empty:
            df_atividades['porcentagem_feitas'] = (df_atividades['horas_feitas'] / df_atividades['horas_max'] * 100).fillna(0)
            df_atividades['porcentagem_nao_feitas'] = df_atividades.apply(
                lambda row: 0 if row['porcentagem_feitas'] > 100 else 100 - row['porcentagem_feitas'],
                axis=1
            )

            categories = df_atividades['categoria_nome']
            feitas = df_atividades['porcentagem_feitas']
            nao_feitas = df_atividades['porcentagem_nao_feitas']
            atividades = df_atividades['atividade_titulo']

            fig_atividades = go.Figure()
            fig_atividades.add_trace(go.Bar(
                y=categories,
                x=feitas,
                name='Feitas',
                orientation='h',
                marker=dict(color='rgba(38, 24, 74, 0.8)'),
                text=atividades,
                texttemplate='%{text}',
                textposition='inside',
                hoverinfo='x+text'
            ))
            fig_atividades.add_trace(go.Bar(
                y=categories,
                x=nao_feitas,
                name='Não Feitas',
                orientation='h',
                marker=dict(color='rgba(190, 192, 213, 1)'),
                text=[''] * len(categories),
                hoverinfo='x'
            ))
            fig_atividades.update_layout(
                barmode='stack',
                xaxis=dict(
                    title='Porcentagem (%)'
                ),
                yaxis_title='Categoria',
                title='Tempo Feito e Não Feito por Categoria',
                height=400
            )
        else:
            fig_atividades = go.Figure()
            fig_atividades.update_layout(
                title_text='Nenhum dado disponível para atividades',
                height=400
            )
            
        return [
            dcc.Graph(id='categoria-bar-chart', figure=fig_categoria),
            dcc.Graph(id='atividades-bar-chart', figure=fig_atividades)
        ]

if __name__ == '__main__':
    app.run_server(debug=True)