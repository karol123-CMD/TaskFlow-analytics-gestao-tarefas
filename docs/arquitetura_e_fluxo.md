# Arquitetura e fluxo de dados

Este documento explica a organização representada pelos arquivos do repositório. Ele não substitui a leitura dos scripts nem descreve uma integração automática em produção.

## Visão geral

O TaskFlow Analytics foi construído como um cenário de portfólio para acompanhamento de tarefas, SLA e produtividade. O Google Sheets funciona como camada operacional. A transferência de registros para o Supabase é feita por arquivos CSV; não há sincronização automática documentada.

No banco, a tabela entrada_tarefas_sheets atua como tabela de estágio. A tabela tarefas concentra os registros operacionais, relacionados a tabelas auxiliares como equipes, colaboradores, solicitantes, tipos, prioridades e status. A planilha disponibilizada no repositório apresenta os indicadores em tabelas e gráficos.

A aba Base_Historico foi preparada como possibilidade de evolução futura e não integra o fluxo atual descrito nos scripts.

## Ordem de leitura dos scripts

A sequência abaixo acompanha os nomes dos arquivos:

1. [01_criacao_tabelas.sql](../sql/01_criacao_tabelas.sql) — define as tabelas da estrutura relacional.
2. [02_tabela_entrada_sheets.sql](../sql/02_tabela_entrada_sheets.sql) — cria a tabela de entrada para os dados vindos da planilha.
3. [03_inserts_tabelas_auxiliares.sql](../sql/03_inserts_tabelas_auxiliares.sql) — prepara e insere registros de apoio usados pela estrutura.
4. [04_importacao_para_tarefas.sql](../sql/04_importacao_para_tarefas.sql) — carrega registros da etapa de entrada para a tabela principal de tarefas.
5. [05_query_detalhamento_verificacao.sql](../sql/05_query_detalhamento_verificacao.sql) — consulta os dados detalhados com atributos relacionados, útil para inspeção do resultado.

**Atenção ao script 03:** o arquivo começa com um comando TRUNCATE nas tabelas operacionais e auxiliares, com reinício de identidades e cascata. Execute-o somente em um ambiente de teste/dedicado e depois de conferir o conteúdo completo do script. Não o rode em uma base com dados que devam ser preservados.

## Leitura do dashboard

O dashboard organiza contagens de tarefas por status e dimensões operacionais, além de indicadores de SLA e tempo médio de conclusão. Também inclui recortes por equipe, colaborador, prioridade, tipo, solicitante e período. A [prévia visual](../images/Dashboard-final.jpeg) apresenta a composição atual.

Os resultados são descritivos do cenário fictício. A documentação não estabelece causalidade nem valida os indicadores para uso em uma operação real. Para reproduzir os números, é necessário usar a planilha e a base correspondentes e confirmar as definições adotadas para prazos, status e SLA.

## Materiais relacionados

- [README principal](../README.md) — resumo e navegação do projeto.
- [Planilha Excel](<../spreadsheets/TaskFlowAnalytics _Gestão de Tarefas, SLA e Produtividade.xlsx>) — indicadores e dashboard.
- [Relatório executivo em PDF](<../pdf/Projeto de Banco de Dados e Análise Operacional - TaskFlow Analytics.pdf>) — apresentação complementar.
- [Imagem da estrutura no Supabase](../images/Estrutura-supabase.jpeg).
