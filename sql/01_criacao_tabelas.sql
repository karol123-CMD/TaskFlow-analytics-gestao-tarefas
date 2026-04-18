create table equipes (
  id_equipe bigint generated always as identity primary key,
  nome_equipe text not null unique,
  status_equipe text not null check (status_equipe in ('Ativa', 'Inativa'))
);

create table colaboradores (
  id_colaborador bigint generated always as identity primary key,
  nome_colaborador text not null,
  email text not null unique,
  cargo text not null,
  status_colaborador text not null check (status_colaborador in ('Ativo', 'Inativo')),
  id_equipe bigint not null,
  constraint fk_colaborador_equipe
    foreign key (id_equipe) references equipes(id_equipe)
);

create table solicitantes (
  id_solicitante bigint generated always as identity primary key,
  nome_solicitante text not null,
  area_solicitante text not null,
  email text not null unique,
  status_solicitante text not null check (status_solicitante in ('Ativo', 'Inativo'))
);

create table tipos_tarefa (
  id_tipo_tarefa bigint generated always as identity primary key,
  nome_tipo_tarefa text not null unique,
  descricao_tipo text not null,
  sla_horas integer not null check (sla_horas > 0),
  status_tipo text not null check (status_tipo in ('Ativo', 'Inativo'))
);

create table prioridades (
  id_prioridade bigint generated always as identity primary key,
  nome_prioridade text not null unique,
  peso_prioridade integer not null check (peso_prioridade > 0)
);

create table status_tarefa (
  id_status bigint generated always as identity primary key,
  nome_status text not null unique,
  ordem_status integer not null check (ordem_status > 0)
);

create table tarefas (
  id_tarefa bigint generated always as identity primary key,
  titulo_tarefa text not null,
  descricao_tarefa text not null,
  data_abertura timestamp not null default current_timestamp,
  prazo_entrega timestamp not null,
  data_conclusao timestamp,
  id_tipo_tarefa bigint not null,
  id_prioridade bigint not null,
  id_status bigint not null,
  id_solicitante bigint not null,
  id_colaborador_responsavel bigint not null,
  observacao_final text,
  constraint chk_data_conclusao
    check (data_conclusao is null or data_conclusao >= data_abertura),
  constraint fk_tarefa_tipo
    foreign key (id_tipo_tarefa) references tipos_tarefa(id_tipo_tarefa),
  constraint fk_tarefa_prioridade
    foreign key (id_prioridade) references prioridades(id_prioridade),
  constraint fk_tarefa_status
    foreign key (id_status) references status_tarefa(id_status),
  constraint fk_tarefa_solicitante
    foreign key (id_solicitante) references solicitantes(id_solicitante),
  constraint fk_tarefa_responsavel
    foreign key (id_colaborador_responsavel) references colaboradores(id_colaborador)
);

