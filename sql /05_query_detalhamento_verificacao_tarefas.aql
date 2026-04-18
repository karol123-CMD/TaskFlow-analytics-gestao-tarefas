select
    t.id_tarefa,
    t.titulo_tarefa,
    tt.nome_tipo_tarefa,
    p.nome_prioridade,
    st.nome_status,
    s.nome_solicitante,
    s.area_solicitante,
    c.nome_colaborador as responsavel,
    e.nome_equipe
from tarefas t
join tipos_tarefa tt
    on t.id_tipo_tarefa = tt.id_tipo_tarefa
join prioridades p
    on t.id_prioridade = p.id_prioridade
join status_tarefa st
    on t.id_status = st.id_status
join solicitantes s
    on t.id_solicitante = s.id_solicitante
join colaboradores c
    on t.id_colaborador_responsavel = c.id_colaborador
join equipes e
    on c.id_equipe = e.id_equipe
order by t.id_tarefa;
