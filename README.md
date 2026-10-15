![Banner de Hunter x Hunter](https://i0.wp.com/quintacapa.com.br/wp-content/uploads/2020/07/Hunter-x-Hunter-hunter-x-hunter-destaque.jpg?fit=1200%2C675&ssl=1)

# MyHxH (Hunter x Hunter) — Projeto Individual

> Projeto acadêmico em desenvolvimento | 1º semestre de Análise e Desenvolvimento de Sistemas (ADS)

## Sobre o projeto

Este projeto consiste no desenvolvimento de um site temático de **Hunter x Hunter (HxH)**, voltado para fãs do anime. A proposta é reunir informações e curiosidades sobre a obra e oferecer um **quiz de preferências**, no qual os usuários poderão compartilhar suas escolhas, como personagem, arco e integrante favorito da Trupe Fantasma.

As respostas registradas serão utilizadas para construir uma **dashboard coletiva**, com gráficos que representem as preferências dos participantes.

## Objetivo

Aplicar, na prática, os conteúdos estudados no primeiro semestre de ADS, principalmente desenvolvimento web, lógica de programação, banco de dados e integração entre frontend e backend.

## Como o sistema deverá funcionar

1. O usuário acessa o site e realiza seu cadastro ou login.
2. Ele responde ao quiz com suas preferências sobre Hunter x Hunter.
3. O frontend envia as respostas para a API desenvolvida com Node.js e Express.
4. A API processa as informações e as registra no MySQL.
5. A dashboard consulta os resultados por meio da API e apresenta os dados em gráficos com Chart.js.

## Como executar (configuração inicial)

Será necessário ter **Node.js** e acesso a um **servidor MySQL** configurado para o projeto. Na pasta principal da aplicação, os comandos previstos são:

```
npm install
npm start
```

O funcionamento desses comandos depende dos scripts definidos no `package.json`.


