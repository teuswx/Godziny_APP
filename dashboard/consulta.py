# Importando as bibliotecas necessárias
from dash import dcc, callback, Output, Input, html  # Componentes do Dash
import dash_mantine_components as dmc  # Componentes adicionais do Dash (se necessário)
import pandas as pd  # Manipulação de dados
import plotly.express as px  # Gráficos simples
import plotly.graph_objects as go  # Gráficos mais complexos
import psycopg2  # Conexão com o PostgreSQL
from dash import Dash  # Aplicação Dash

# =======================
# Conexão com o banco de dados PostgreSQL
# =======================
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

# =======================
# Função para executar consultas SQL
# =======================
def executar_consulta(query, params=None):
    if conn:
        try:
            with conn.cursor() as cursor:
                cursor.execute(query, params)  # Executa a consulta com parâmetros
                colnames = [desc[0] for desc in cursor.description]  # Obtém os nomes das colunas
                resultados = cursor.fetchall()  # Obtém todos os resultados
                return pd.DataFrame(resultados, columns=colnames)  # Retorna como DataFrame
        except psycopg2.Error as e:
            print("Erro ao executar a consulta:", e)
    return pd.DataFrame()

# =======================
# Definição das consultas SQL
# =======================

# Consultas SQL para os status 'APROVADA'
queries_combined = {
    "COMBINADO": """
        SELECT 
            u.nome,
            ROUND(COALESCE(SUM(a.carga_horaria * ct.horas_multiplicador), 0)) AS horas_totais,
            cu.carga_horaria_complementar AS horas_max
        FROM tb_usuario AS u
        JOIN tb_atividade AS a ON u.matricula = a.usuario_id AND a.status = 'APROVADA'
        JOIN tb_categoria AS ct ON ct.id = a.categoria_id
        JOIN tb_curso AS cu ON cu.id = u.curso_id
        GROUP BY u.nome, horas_max
        ORDER BY u.nome;
    """
}

# Consulta SQL para obter atividades por usuário
queries_atividades = {
    "Atividades": """
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

# Consulta SQL para obter categorias por usuário
queries_categoria = {
    "Categoria": """
        SELECT 
        u.nome, 
        c.nome AS categoria_nome,
        ROUND(SUM(a.carga_horaria * c.horas_multiplicador)::numeric, 2) AS horas_feitas,
        MAX(ROUND((c.porcentagem_horas_maximas * cu.carga_horaria_complementar)::numeric, 2)) AS horas_max
    FROM 
        tb_usuario AS u
    JOIN 
        tb_atividade AS a ON u.matricula = a.usuario_id
    JOIN 
        tb_categoria AS c ON a.categoria_id = c.id
    JOIN 
        tb_curso AS cu ON c.curso_id = cu.id
    WHERE 
        u.matricula = %s AND a.status = 'APROVADA'
    GROUP BY 
        u.nome, c.nome;
    """
}

# =======================
# Inicialização da aplicação Dash
# =======================
app = Dash(__name__, suppress_callback_exceptions=True)

# =======================
# Definição do layout da aplicação
# =======================
app.layout = html.Div([
    dcc.Location(id='url', refresh=False),  # Componente para acesso à URL
    html.Div(id='graphs-container')  # Contêiner para os gráficos
])


# =======================
# Callback para atualizar os gráficos com base nas entradas
# =======================
@app.callback(
    Output('graphs-container', 'children'),
    Input('url', 'search')
)
def render_graphs(search):
    search_params = {}
    for item in search.lstrip('?').split("&"):
        if "=" in item:
            key, value = item.split("=", 1)
            search_params[key] = value

    tipo_usuario = search_params.get('tipo', 'default_tipo')
    matricula = search_params.get('matricula', 'default_matricula')
    nome_usuario = search_params.get('nome', 'default_nome').replace('%20', " ")
    
    matricula = search_params.get('matricula', None)
    if tipo_usuario == 'ADM':
        df_combined = executar_consulta(queries_combined['COMBINADO'])

        if df_combined.empty:
            fig_categoria = px.bar(x=[], y=[], title='Nenhum dado disponível')
        else:
            fig_categoria = go.Figure()
            fig_categoria.add_trace(go.Bar(
                x=df_combined['nome'],
                y=df_combined['horas_max'],
                name='Horas Totais',
                marker=dict(color='#404040')
            ))
            fig_categoria.add_trace(go.Bar(
                x=df_combined['nome'],
                y=df_combined['horas_totais'],
                name='Horas Aprovadas',
                marker=dict(color='#0099ff')
            ))
            fig_categoria.update_layout(
                title='Horas Aprovadas e Totais por Aluno',
                barmode='overlay',
                xaxis_title='Aluno',
                yaxis_title='Horas Totais',
                height=800
            )

        return dcc.Graph(id='categoria-bar-chart', figure=fig_categoria)
    
    else:
        # Caso o usuário não seja do tipo 'ADM'

        # Gráfico de categorias (horas feitas vs. horas máximas)
        df_categoria = executar_consulta(queries_categoria['Categoria'], (matricula,))
        if not df_categoria.empty:
            fig_categoria = go.Figure()
            
            # Adiciona a barra para horas máximas (cinza)
            fig_categoria.add_trace(go.Bar(
                x=df_categoria['categoria_nome'], 
                y=df_categoria['horas_max'], 
                name='Horas Máximas',
                marker=dict(color='#404040'),
            ))
            
            # Adiciona a barra para horas feitas (azul)
            fig_categoria.add_trace(go.Bar(
                x=df_categoria['categoria_nome'], 
                y=df_categoria['horas_feitas'], 
                name='Horas Feitas',
                marker=dict(color='#0099ff'),
            ))
            
            fig_categoria.update_layout(
                title_text=f'Horas Totais por Categoria do {nome_usuario}',
                height=800,
                barmode='overlay',  # Usa 'overlay' para sobrepor as barras
                xaxis_title='Categoria',
                yaxis_title='Horas'
            )
        else:
            fig_categoria = go.Figure()
            fig_categoria.update_layout(
                title_text='Nenhum dado disponível para categorias',
                height=800
            )
            
        # Retorna os gráficos para o layout
        return [
            dcc.Graph(id='categoria-bar-chart', figure=fig_categoria)
        ]

# =======================
# Execução da aplicação
# =======================
if __name__ == '__main__':
    app.run_server(debug=True)
