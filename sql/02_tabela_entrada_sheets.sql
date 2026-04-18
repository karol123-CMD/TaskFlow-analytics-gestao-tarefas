drop table if exists entrada_tarefas_sheets;

create table entrada_tarefas_sheets (
  id_entrada bigint generated always as identity primary key,
  titulo_tarefa text,
  descricao_tarefa text,
  data_abertura text,
  prazo_entrega text,
  tipo_tarefa text,
  prioridade text,
  status text,
  solicitante text,
  area_solicitante text,
  colaborador_responsavel text,
  equipe text,
  observacao_final text,
  data_importacao timestamp not null default current_timestamp
);
