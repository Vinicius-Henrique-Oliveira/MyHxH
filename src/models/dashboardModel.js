var database = require("../database/config");


function all_personagens() {
    var instrucaoSql = `
        SELECT * from personagens;
    `;

    return database.executar(instrucaoSql);
}

function all_arcos() {
    var instrucaoSql = `
        SELECT * from arcos;
    `;

    return database.executar(instrucaoSql);
}

function all_trupe() {
    var instrucaoSql = `
        SELECT * from trupe;
    `;

    return database.executar(instrucaoSql);
}

function total_respostas() {
    var instrucaoSql = `
        SELECT * from respostas;
    `;

    return database.executar(instrucaoSql);
}

function favorito_personagem() {
    var instrucaoSql = `
        SELECT * from personagem_favorito;
    `;

    return database.executar(instrucaoSql);
}

function favorito_arco() {
    var instrucaoSql = `
        SELECT * from arco_favorito;
    `;

    return database.executar(instrucaoSql);
}

function favorito_trupe() {
    var instrucaoSql = `
        SELECT * from trupe_favorito;
    `;

    return database.executar(instrucaoSql);
}

module.exports = {
    total_respostas,
    favorito_personagem,
    favorito_arco,
    favorito_trupe,
    all_personagens,
    all_arcos,
    all_trupe
};
