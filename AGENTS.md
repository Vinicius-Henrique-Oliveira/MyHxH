# AGENTS.md

## Visão geral

Este é um projeto individual de primeiro semestre de Análise e Desenvolvimento de Sistemas (ADS).
O projeto é um site temático de Hunter x Hunter (HxH) para fãs do anime, com:

- Páginas com informações e curiosidades sobre a obra;
- Cadastro e login de usuários;
- Quiz de preferências (não necessariamente de respostas certas ou erradas), com perguntas sobre personagem favorito, arco favorito, integrante favorito da Trupe Fantasma e outras preferências;
- Dashboard coletiva com gráficos que apresentam a distribuição das respostas registradas no banco de dados.

## Tecnologias

Tecnologias utilizadas no nosso projeto:

- Frontend: HTML, CSS e JavaScript puro.
- Gráficos: Chart.js.
- Backend e API: Node.js e Express.js.
- Banco de dados: MySQL.
- Pacotes de apoio já previstos: CORS e Dotenv.
- Desenvolvimento local: Nodemon.

## Comandos

Nossos comandos são relacionados ao Node.js, sendo eles:

- npm install
- npm start
- npm run dev

## Arquitetura

Arquivo principal - app.js
Diretório frontend - /public
Diretório Rotas - src/routes/
Diretório Validações - /src/controllers
Diretório Query - /src/models

## Padrões de desenvolvimento

- Utilizar const por padrão na aplicação e let no HTML;
- Padrão de nomenclatura para arquivos, funções e variáveis, seguindo o projeto existente;
- Utilizar camelCase para variáveis e funções;
- Criar funções de fácil entendimento e manutenção;
- Priorizar soluções simples e de acordo com as tecnologias utilizadas;
- Utilizar elementos semânticos;
- Manter a estilização em arquivo CSS externo.

## Cuidados e restrições

- Não excluir ou modificar as rotas existentes sem autorização;
- Não apagar tabelas, registros ou estruturas sem autorização;
- Não expor qualquer tipo de credencial;
- Não adicionar tecnologias sem necessidade;
- Não utilizar dados fictícios na Dashboard;
- Não reescrever arquivos inteiros quando uma pequena/média alteração for suficiente;
- A Dashboard deve utilizar respostas reais consultadas no MySQL, nunca estatísticas fixas inventadas no código;
- Preservar ao máximo o estilo e a organização do código existente.


## Regra geral: 

Antes de implementar uma alteração, siga as tecnologias, arquitetura, convenções e restrições descritas neste documento. Caso alguma informação esteja ausente, analise o código existente e siga os padrões já adotados no projeto.
