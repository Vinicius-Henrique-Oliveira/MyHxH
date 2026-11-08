var database = require("../database/config");

function cadastrar(idUsuario, personagem, arco, trupe) {

    var instrucaoPost = `
        INSERT INTO resposta (resposta, fk_pergunta, fk_usuario)
        VALUES ('${personagem}', ${1}, ${idUsuario}),
        ('${arco}', ${2}, ${idUsuario}),
        ('${trupe}', ${3}, ${idUsuario});
    `;

    return database.executar(instrucaoPost);

}


module.exports = {
    cadastrar
};
