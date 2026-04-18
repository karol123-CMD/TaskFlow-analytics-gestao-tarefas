begin;

truncate table tarefas, colaboradores, solicitantes, tipos_tarefa, prioridades, status_tarefa, equipes restart identity cascade;

insert into equipes (nome_equipe, status_equipe) values
('Comercial', 'Ativa'),
('Financeiro', 'Ativa'),
('Cadastro', 'Ativa'),
('Operações', 'Ativa');

insert into colaboradores (nome_colaborador, email, cargo, status_colaborador, id_equipe) values
('Ana Martins', 'ana.martins@flowdesk.com', 'Analista Comercial', 'Ativo', 1),
('Bruno Lopes', 'bruno.lopes@flowdesk.com', 'Assistente Comercial', 'Ativo', 1),
('Camila Souza', 'camila.souza@flowdesk.com', 'Analista Financeira', 'Ativo', 2),
('Diego Rocha', 'diego.rocha@flowdesk.com', 'Assistente Financeiro', 'Ativo', 2),
('Fernanda Lima', 'fernanda.lima@flowdesk.com', 'Analista de Cadastro', 'Ativo', 3),
('Gustavo Almeida', 'gustavo.almeida@flowdesk.com', 'Assistente de Cadastro', 'Ativo', 3),
('Helena Costa', 'helena.costa@flowdesk.com', 'Analista de Operações', 'Ativo', 4),
('Igor Mendes', 'igor.mendes@flowdesk.com', 'Assistente de Operações', 'Ativo', 4);

insert into solicitantes (nome_solicitante, area_solicitante, email, status_solicitante) values
('Juliana Prado', 'Comercial', 'juliana.prado@flowdesk.com', 'Ativo'),
('Larissa Nunes', 'Financeiro', 'larissa.nunes@flowdesk.com', 'Ativo'),
('Marcelo Vieira', 'Diretoria', 'marcelo.vieira@flowdesk.com', 'Ativo'),
('Paula Reis', 'Cadastro', 'paula.reis@flowdesk.com', 'Ativo'),
('Renato Sales', 'Operações', 'renato.sales@flowdesk.com', 'Ativo'),
('Sofia Barreto', 'Suporte', 'sofia.barreto@flowdesk.com', 'Ativo');

insert into tipos_tarefa (nome_tipo_tarefa, descricao_tipo, sla_horas, status_tipo) values
('Cadastro de cliente', 'Inclusão de novo cliente com validação cadastral e comercial.', 24, 'Ativo'),
('Atualização cadastral', 'Correção ou atualização de dados cadastrais de clientes.', 24, 'Ativo'),
('Conferência financeira', 'Validação de pendências, cobranças e movimentações financeiras.', 48, 'Ativo'),
('Ajuste de pedido', 'Correção de divergências em pedidos já lançados.', 24, 'Ativo'),
('Emissão de relatório', 'Geração de relatórios operacionais e gerenciais.', 72, 'Ativo'),
('Revisão contratual', 'Análise e ajuste de cláusulas e dados contratuais.', 72, 'Ativo'),
('Tratativa de pendência', 'Resolução de inconsistências e bloqueios entre áreas.', 48, 'Ativo');

insert into prioridades (nome_prioridade, peso_prioridade) values
('Baixa', 1),
('Média', 2),
('Alta', 3),
('Crítica', 4);

insert into status_tarefa (nome_status, ordem_status) values
('Aberta', 1),
('Em andamento', 2),
('Aguardando retorno', 3),
('Concluída', 4),
('Cancelada', 5);

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
) values
('Cadastrar cliente Mercantil Aurora', 'Cadastro inicial do cliente com conferência de documentos e dados comerciais.', '2026-01-06 08:30:00', '2026-01-07 08:30:00', '2026-01-06 17:10:00', 1, 3, 4, 1, 5, 'Cadastro concluído dentro do prazo.'),
('Atualizar cadastro do cliente Supermix Bahia', 'Correção de telefone, e-mail financeiro e endereço de cobrança.', '2026-01-07 10:00:00', '2026-01-08 10:00:00', '2026-01-09 14:20:00', 2, 2, 4, 4, 6, 'Concluída com atraso por necessidade de confirmação documental.'),
('Conferir pendência financeira do cliente Alfa Tech', 'Analisar divergência entre baixa bancária e registro interno.', '2026-01-08 09:30:00', '2026-01-10 09:30:00', '2026-01-09 16:45:00', 3, 3, 4, 2, 3, 'Pendência regularizada dentro do SLA.'),
('Ajustar pedido 45218 do cliente Bom Preço', 'Correção de quantidade lançada e atualização do valor final do pedido.', '2026-01-10 11:00:00', '2026-01-11 11:00:00', '2026-01-10 17:25:00', 4, 3, 4, 5, 1, 'Ajuste concluído no mesmo dia.'),
('Emitir relatório comercial da semana 02', 'Consolidar volume de demandas comerciais abertas e concluídas.', '2026-01-12 08:00:00', '2026-01-15 08:00:00', '2026-01-14 11:50:00', 5, 2, 4, 3, 7, 'Relatório entregue à diretoria.'),
('Revisar contrato da Rede Litoral', 'Revisão de cláusulas comerciais e datas de vigência.', '2026-01-13 09:20:00', '2026-01-16 09:20:00', '2026-01-18 10:00:00', 6, 3, 4, 1, 2, 'Concluída com atraso por necessidade de validação comercial.'),
('Tratar pendência de cadastro duplicado', 'Analisar possível duplicidade entre registros do cliente Serra Norte.', '2026-02-02 08:40:00', '2026-02-04 08:40:00', '2026-02-04 14:00:00', 7, 3, 4, 6, 8, 'Registros unificados com sucesso.'),
('Cadastrar cliente Atacado Imperial', 'Cadastro comercial e fiscal de novo cliente para início de operação.', '2026-02-03 10:10:00', '2026-02-04 10:10:00', null, 1, 4, 5, 1, 5, 'Demanda cancelada pelo solicitante antes da conclusão.'),
('Atualizar cadastro da Comercial Nogueira', 'Ajustar dados fiscais e atualizar nome fantasia.', '2026-02-05 09:15:00', '2026-02-06 09:15:00', '2026-02-05 16:30:00', 2, 1, 4, 4, 6, 'Atualização realizada no mesmo dia.'),
('Conferir baixa financeira do cliente Central Norte', 'Validar pagamento compensado e ausência de baixa no sistema.', '2026-02-08 08:30:00', '2026-02-10 08:30:00', '2026-02-11 13:40:00', 3, 4, 4, 2, 4, 'Concluída com atraso devido à demora no retorno bancário.'),
('Ajustar pedido 45490 com divergência fiscal', 'Correção de CFOP e revisão de valores do pedido.', '2026-02-10 10:00:00', '2026-02-11 10:00:00', '2026-02-11 09:15:00', 4, 3, 4, 5, 1, 'Ajuste concluído dentro do prazo.'),
('Emitir relatório mensal de SLA', 'Consolidar tarefas concluídas dentro e fora do SLA.', '2026-02-12 08:00:00', '2026-02-15 08:00:00', '2026-02-14 15:10:00', 5, 2, 4, 3, 7, 'Relatório validado pela gestão.'),
('Revisar contrato do cliente Horizonte Distribuição', 'Ajustar cláusula de reajuste anual e prazo de renovação.', '2026-03-02 09:00:00', '2026-03-05 09:00:00', null, 6, 3, 3, 1, 2, null),
('Tratar pendência de documentação do cliente Serra Azul', 'Validar documentos pendentes para liberação do cadastro.', '2026-03-04 10:20:00', '2026-03-06 10:20:00', '2026-03-07 11:00:00', 7, 3, 4, 6, 8, 'Concluída com atraso por espera de documentação complementar.'),
('Cadastrar cliente Nova Era Distribuição', 'Cadastro comercial e financeiro para início de relacionamento.', '2026-03-05 08:10:00', '2026-03-06 08:10:00', '2026-03-05 17:00:00', 1, 3, 4, 1, 5, 'Cadastro aprovado e liberado.'),
('Conferir reembolso do cliente Costa Sul', 'Analisar divergência entre comprovante e sistema financeiro.', '2026-03-08 09:40:00', '2026-03-10 09:40:00', '2026-03-09 16:20:00', 3, 2, 4, 2, 3, 'Reembolso confirmado sem inconsistência adicional.'),
('Emitir relatório de produtividade por equipe', 'Consolidar volume de tarefas concluídas por equipe no mês.', '2026-03-10 08:30:00', '2026-03-13 08:30:00', '2026-03-12 12:15:00', 5, 2, 4, 3, 7, 'Relatório final compartilhado com lideranças.'),
('Atualizar cadastro do cliente Vale Forte', 'Correção de razão social e endereço principal.', '2026-03-12 11:10:00', '2026-03-13 11:10:00', '2026-03-12 17:45:00', 2, 1, 4, 4, 6, 'Atualização concluída no mesmo dia.'),
('Ajustar pedido 46118 do cliente Nordeste Center', 'Retirar item indevido e recalcular valor total do pedido.', '2026-04-03 09:00:00', '2026-04-04 09:00:00', '2026-04-05 10:10:00', 4, 3, 4, 5, 1, 'Concluída com atraso de um dia útil.'),
('Tratar aprovação financeira do cliente Via Norte', 'Aguardar retorno da diretoria para liberação de condição especial.', '2026-04-04 10:30:00', '2026-04-06 10:30:00', null, 7, 4, 3, 3, 4, null),
('Revisar contrato do cliente Nova Linha', 'Analisar atualização de cláusulas comerciais e vigência.', '2026-04-06 09:20:00', '2026-04-09 09:20:00', null, 6, 2, 2, 1, 2, null),
('Cadastrar cliente Padrão Mix', 'Cadastro comercial com dados fiscais e financeiros validados.', '2026-04-07 08:40:00', '2026-04-08 08:40:00', '2026-04-07 16:00:00', 1, 3, 4, 1, 5, 'Cadastro finalizado sem pendências.'),
('Conferir boleto do cliente Horizonte Log', 'Validar título vencido e retorno de compensação bancária.', '2026-04-09 10:00:00', '2026-04-11 10:00:00', null, 3, 3, 1, 2, 3, null),
('Emitir relatório de tarefas em atraso', 'Consolidar demandas fora do prazo para alinhamento gerencial.', '2026-04-10 08:00:00', '2026-04-13 08:00:00', '2026-04-13 15:20:00', 5, 2, 4, 3, 7, 'Relatório concluído no prazo.'),
('Atualizar cadastro do cliente Mercantil Capital', 'Revisar telefone, e-mail financeiro e inscrição estadual.', '2026-04-11 09:10:00', '2026-04-12 09:10:00', null, 2, 1, 1, 4, 6, null),
('Tratar pendência fiscal do cliente Serra Azul', 'Resolver inconsistência entre cadastro e documento fiscal enviado.', '2026-04-11 10:20:00', '2026-04-13 10:20:00', null, 7, 3, 2, 6, 8, null),
('Ajustar pedido 46145 por duplicidade de itens', 'Remover item duplicado e recalcular total do pedido.', '2026-04-12 08:50:00', '2026-04-13 08:50:00', '2026-04-12 16:40:00', 4, 3, 4, 5, 1, 'Correção concluída no mesmo dia.'),
('Emitir relatório de carteira comercial', 'Gerar consolidado de demandas da carteira da equipe comercial.', '2026-04-13 09:00:00', '2026-04-16 09:00:00', null, 5, 1, 1, 3, 7, null),
('Atualizar cadastro do cliente Horizonte Comercial', 'Corrigir telefone principal, e-mail financeiro e endereço de cobrança.', '2026-04-14 08:20:00', '2026-04-15 08:20:00', '2026-04-14 16:40:00', 2, 2, 4, 4, 6, 'Atualização concluída dentro do prazo.'),
('Conferir cobrança pendente do cliente Boa Vista', 'Validar diferença entre título vencido e baixa informada no sistema.', '2026-04-14 09:10:00', '2026-04-16 09:10:00', '2026-04-17 10:30:00', 3, 3, 4, 2, 3, 'Concluída com atraso por dependência de retorno bancário.'),
('Ajustar pedido 46188 do cliente Via Bahia', 'Revisar item lançado com quantidade superior à solicitada.', '2026-04-14 10:00:00', '2026-04-15 10:00:00', null, 4, 3, 1, 5, 1, null),
('Emitir relatório semanal de operações', 'Consolidar tarefas abertas, concluídas e atrasadas da equipe de operações.', '2026-04-15 08:00:00', '2026-04-18 08:00:00', '2026-04-17 14:15:00', 5, 2, 4, 3, 7, 'Relatório entregue à liderança.'),
('Revisar contrato do cliente Norte Sul Atacado', 'Analisar cláusula de reajuste e vigência contratual.', '2026-04-15 09:30:00', '2026-04-18 09:30:00', null, 6, 3, 2, 1, 2, null),
('Tratar pendência documental do cliente Via Mix', 'Aguardar envio de comprovante de endereço para validação cadastral.', '2026-04-15 10:10:00', '2026-04-17 10:10:00', null, 7, 3, 3, 6, 8, null),
('Cadastrar cliente Rede Premium Distribuição', 'Incluir novo cliente na base com validação cadastral e comercial.', '2026-04-16 08:40:00', '2026-04-17 08:40:00', '2026-04-16 17:05:00', 1, 4, 4, 1, 5, 'Cliente liberado para início de operação.'),
('Atualizar cadastro do cliente Litoral Atacado', 'Corrigir inscrição estadual e e-mail fiscal.', '2026-04-16 09:20:00', '2026-04-17 09:20:00', '2026-04-18 11:00:00', 2, 1, 4, 4, 6, 'Concluída com atraso por necessidade de conferência fiscal.'),
('Conferir reembolso do cliente Max Center', 'Validar diferença entre comprovante e baixa no sistema financeiro.', '2026-04-17 08:50:00', '2026-04-19 08:50:00', null, 3, 2, 1, 2, 4, null),
('Emitir relatório de backlog de abril', 'Consolidar demandas em aberto para alinhamento gerencial.', '2026-04-17 09:40:00', '2026-04-20 09:40:00', '2026-04-19 15:30:00', 5, 1, 4, 3, 7, 'Relatório finalizado e compartilhado.'),
('Ajustar pedido 46214 do cliente Casa Forte', 'Corrigir valor unitário e recalcular total do pedido.', '2026-04-18 08:10:00', '2026-04-19 08:10:00', '2026-04-18 16:00:00', 4, 3, 4, 5, 1, 'Ajuste concluído no mesmo dia.'),
('Revisar contrato do cliente Alto Giro', 'Analisar reajuste comercial solicitado pela área de vendas.', '2026-04-18 10:00:00', '2026-04-21 10:00:00', null, 6, 1, 5, 1, 2, 'Demanda cancelada pelo solicitante.'),
('Tratar pendência fiscal do cliente Sol Poente', 'Resolver divergência entre cadastro e nota fiscal emitida.', '2026-04-20 08:30:00', '2026-04-22 08:30:00', '2026-04-21 17:20:00', 7, 4, 4, 6, 8, 'Pendência fiscal regularizada.'),
('Cadastrar cliente Distribuidora Porto', 'Cadastro inicial com validação de documentos comerciais.', '2026-04-21 09:00:00', '2026-04-22 09:00:00', null, 1, 3, 2, 1, 5, null),
('Atualizar cadastro do cliente Mercantil União', 'Corrigir dados fiscais e contato de cobrança.', '2026-04-21 10:20:00', '2026-04-22 10:20:00', null, 2, 2, 1, 4, 6, null),
('Conferir baixa financeira do cliente Forte Mix', 'Validar compensação bancária não refletida no contas a receber.', '2026-04-22 08:40:00', '2026-04-24 08:40:00', '2026-04-23 16:15:00', 3, 3, 4, 2, 4, 'Baixa confirmada e regularizada.'),
('Emitir relatório financeiro quinzenal', 'Consolidar pendências e tratativas da área financeira.', '2026-04-22 09:30:00', '2026-04-25 09:30:00', null, 5, 2, 2, 3, 7, null),
('Ajustar pedido 46255 do cliente Nordeste Log', 'Revisar valor total após remoção de item cancelado.', '2026-04-23 08:20:00', '2026-04-24 08:20:00', '2026-04-25 10:00:00', 4, 4, 4, 5, 1, 'Concluída com atraso por revisão fiscal.'),
('Tratar pendência de limite comercial do cliente Delta', 'Aguardar aprovação da diretoria para aumento de limite.', '2026-04-23 09:50:00', '2026-04-25 09:50:00', null, 7, 4, 3, 3, 3, null),
('Cadastrar cliente Comercial Vitória', 'Cadastro completo com dados comerciais e financeiros.', '2026-04-24 08:30:00', '2026-04-25 08:30:00', '2026-04-24 17:15:00', 1, 3, 4, 1, 5, 'Cadastro concluído no prazo.'),
('Revisar contrato do cliente Atak Sul', 'Atualizar cláusulas de renovação automática.', '2026-04-24 10:10:00', '2026-04-27 10:10:00', '2026-04-26 16:40:00', 6, 2, 4, 1, 2, 'Revisão contratual concluída dentro do prazo.'),
('Atualizar cadastro do cliente Master Bahia', 'Corrigir regime tributário e contato principal.', '2026-04-27 08:50:00', '2026-04-28 08:50:00', '2026-04-27 15:40:00', 2, 1, 4, 4, 6, 'Atualização concluída sem pendências.'),
('Conferir boleto do cliente Nova Compra', 'Analisar cobrança vencida com comprovante parcial de pagamento.', '2026-04-27 10:30:00', '2026-04-29 10:30:00', null, 3, 3, 2, 2, 3, null),
('Emitir relatório mensal de maio', 'Gerar consolidado de tarefas abertas, concluídas e SLA do mês.', '2026-05-04 08:00:00', '2026-05-07 08:00:00', null, 5, 1, 1, 3, 7, null),
('Ajustar pedido 46302 do cliente Aurora Sul', 'Revisar desconto aplicado e corrigir valor final do pedido.', '2026-05-05 09:10:00', '2026-05-06 09:10:00', '2026-05-05 17:20:00', 4, 3, 4, 5, 1, 'Ajuste concluído dentro do prazo.'),
('Tratar pendência de integração cadastral', 'Resolver inconsistência entre base comercial e base cadastral.', '2026-05-05 10:00:00', '2026-05-07 10:00:00', '2026-05-08 11:30:00', 7, 3, 4, 6, 8, 'Concluída com atraso por necessidade de alinhamento entre áreas.'),
('Cadastrar cliente Mercado Serrano', 'Cadastro solicitado pela área comercial para início de operação.', '2026-05-06 08:40:00', '2026-05-07 08:40:00', null, 1, 2, 5, 1, 5, 'Demanda cancelada por desistência comercial.'),
('Revisar contrato do cliente Prime Center', 'Avaliar prazo de renovação e cláusulas de rescisão.', '2026-05-06 09:50:00', '2026-05-09 09:50:00', null, 6, 3, 1, 1, 2, null),
('Conferir divergência financeira do cliente Leste Distribuição', 'Validar lançamento em duplicidade no contas a receber.', '2026-05-07 08:20:00', '2026-05-09 08:20:00', '2026-05-08 16:50:00', 3, 2, 4, 2, 4, 'Divergência corrigida dentro do prazo.'),
('Emitir relatório de SLA por equipe', 'Consolidar percentual de cumprimento de SLA por equipe operacional.', '2026-05-07 09:40:00', '2026-05-10 09:40:00', '2026-05-09 13:30:00', 5, 2, 4, 3, 7, 'Relatório entregue com comparativo entre equipes.'),
('Atualizar cadastro do cliente Rede Capital', 'Revisar endereço fiscal e e-mail de cobrança.', '2026-05-08 10:10:00', '2026-05-09 10:10:00', null, 2, 1, 1, 4, 6, null),
('Tratar pendência de cadastro do cliente Vale Norte', 'Resolver inconsistência em documentos enviados para cadastro.', '2026-05-08 11:00:00', '2026-05-10 11:00:00', null, 7, 3, 2, 6, 8, null),
('Cadastrar cliente Atacado Horizonte', 'Cadastro completo para ativação comercial e financeira.', '2026-05-11 08:30:00', '2026-05-12 08:30:00', '2026-05-11 16:30:00', 1, 3, 4, 1, 5, 'Cadastro concluído sem restrições.'),
('Revisar contrato do cliente Vitória Center', 'Ajustar cláusula de reajuste semestral e condições comerciais.', '2026-05-11 09:20:00', '2026-05-14 09:20:00', null, 6, 2, 2, 1, 2, null),
('Emitir relatório de produtividade individual', 'Consolidar tarefas concluídas por colaborador no período.', '2026-05-12 08:00:00', '2026-05-15 08:00:00', null, 5, 1, 1, 3, 7, null);

commit;
