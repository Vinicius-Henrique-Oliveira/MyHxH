var database = require("../database/config");

function publicar(idUsuario, mensagem, categoria, spoiler, fotos) {
    
    var spoilerBanco = 0;

    if (spoiler == true || spoiler == 'true') {
        spoilerBanco = 1;
    } else {
        spoilerBanco = 0;
    }

    var instrucaoPost = `
        INSERT INTO comunidade_post (fk_usuario, mensagem, categoria, spoiler)
        VALUES (${idUsuario}, '${mensagem}', '${categoria}', ${spoilerBanco});
    `;

    return database.executar(instrucaoPost)
        .then(function (resultadoPost) {

            var idPost = resultadoPost.insertId;

            if (!fotos || fotos.length == 0) {
                return resultadoPost;
            }

        var insertsImagens = [];

        for (let i = 0; i < fotos.length; i++) {
            var foto = fotos[i];

            var instrucaoImagem = `
                INSERT INTO comunidade_imagem (fk_post, caminho)
                VALUES (${idPost}, '${foto.filename}');
            `;

            insertsImagens.push(database.executar(instrucaoImagem));
        }

        return Promise.all(insertsImagens)
            .then(function () {
            return resultadoPost;
        });
        });
}

function listar() {
    var instrucaoSql = `
        SELECT
            p.id AS idPost,
            u.nome,
            p.mensagem,
            p.categoria,
            p.spoiler,
            p.criado_em,
            GROUP_CONCAT(i.caminho SEPARATOR '||') AS imagens
        FROM comunidade_post p
        JOIN usuario u
            ON p.fk_usuario = u.id
        LEFT JOIN comunidade_imagem i
            ON i.fk_post = p.id
        GROUP BY p.id
        ORDER BY p.criado_em DESC;
    `;

    return database.executar(instrucaoSql);
}

module.exports = {
    publicar,
    listar
};
