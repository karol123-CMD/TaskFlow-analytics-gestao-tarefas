insert into tarefas (
  titulo_tarefa,
  descricao_tarefa,
  data_abertura,
  prazo_entrega,
  data_conclusao,
  id_tipo_tarefa,
  id_prioridade,
  id_status,
  id_solicitante,
  id_colaborador_responsavel,
  observacao_final
)
select
  trim(ets.titulo_tarefa),
  trim(ets.descricao_tarefa),

  case
    when ets.data_abertura ~ '^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$'
      then ets.data_abertura::timestamp
    when ets.data_abertura ~ '^\d{2}/\d{2}/\d{4} \d{2}:\d{2}:\d{2}$'
      then to_timestamp(ets.data_abertura, 'DD/MM/YYYY HH24:MI:SS')
    when ets.data_abertura ~ '^\d{2}/\d{2}/\d{4} \d{2}:\d{2}$'
      then to_timestamp(ets.data_abertura, 'DD/MM/YYYY HH24:MI')
    else null
  end as data_abertura,

  case
    when ets.prazo_entrega ~ '^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$'
      then ets.prazo_entrega::timestamp
    when ets.prazo_entrega ~ '^\d{2}/\d{2}/\d{4} \d{2}:\d{2}:\d{2}$'
      then to_timestamp(ets.prazo_entrega, 'DD/MM/YYYY HH24:MI:SS')
    when ets.prazo_entrega ~ '^\d{2}/\d{2}/\d{4} \d{2}:\d{2}$'
      then to_timestamp(ets.prazo_entrega, 'DD/MM/YYYY HH24:MI')
    else null
  end as prazo_entrega,

  null as data_conclusao,
  tt.id_tipo_tarefa,
  p.id_prioridade,
  st.id_status,
  s.id_solicitante,
  c.id_colaborador,
  nullif(trim(ets.observacao_final), '')
from entrada_tarefas_sheets ets
join tipos_tarefa tt
  on trim(lower(ets.tipo_tarefa)) = trim(lower(tt.nome_tipo_tarefa))
join prioridades p
  on trim(lower(ets.prioridade)) = trim(lower(p.nome_prioridade))
join status_tarefa st
  on trim(lower(ets.status)) = trim(lower(st.nome_status))
join solicitantes s
  on trim(lower(ets.solicitante)) = trim(lower(s.nome_solicitante))
 and trim(lower(ets.area_solicitante)) = trim(lower(s.area_solicitante))
join colaboradores c
  on trim(lower(ets.colaborador_responsavel)) = trim(lower(c.nome_colaborador))
join equipes e
  on trim(lower(ets.equipe)) = trim(lower(e.nome_equipe))
 and c.id_equipe = e.id_equipe
where coalesce(trim(ets.titulo_tarefa), '') <> ''
  and coalesce(trim(ets.descricao_tarefa), '') <> ''
  and coalesce(trim(ets.data_abertura), '') <> ''
  and coalesce(trim(ets.prazo_entrega), '') <> '';
