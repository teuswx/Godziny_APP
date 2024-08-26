select * from usuario;
select * from atividade;
select * from arquivo;
select * from categoria;
select * from curso;

--soma da carga horária pela categoria
select 
	ct.nome,
	a.status,
	a.carga_horaria,
	ct.horar_multiplicador,
	(a.carga_horaria * ct.horar_multiplicador) as horas_totais
from atividade a
join categoria AS ct ON ct.id = a.categoria_id

--soma da carga horária pela categoria de horas pendentes
select 
	ct.nome,
	a.status,
	sum(a.carga_horaria * ct.horar_multiplicador) as horas_totais
from atividade a
join categoria AS ct ON ct.id = a.categoria_id
where status = 'Em Andamento'
group by ct.nome, a.status
order by ct.nome, a.status;

--atividades por usuario
select 
	u.nome,
	a.titulo,
	sum(a.carga_horaria * ct.horar_multiplicador) as horas_totais
from atividade a
join usuario AS u ON u.matricula = a.usuario_id
join categoria AS ct ON ct.id = a.categoria_id
group by u.nome, a.titulo
order by u.nome, a.titulo;

--atividades PENDENTE por usuario
select 
	u.nome,
	a.titulo,
	sum(a.carga_horaria * ct.horar_multiplicador) as horas_totais
from atividade a
join usuario AS u ON u.matricula = a.usuario_id
join categoria AS ct ON ct.id = a.categoria_id
where a.status = 'Em Andamento'
group by u.nome, a.titulo
order by u.nome, a.titulo;
