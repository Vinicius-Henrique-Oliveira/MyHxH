var comunidadeModel = require("../models/comunidadeModel");

function publicar(req, res) {
    const idUsuario = req.params.idUsuario;
    const mensagem = req.body.mensagem;
    const categoria = req.body.categoria;
    const spoiler = req.body.spoiler;
    const fotos = req.files;

    if (!idUsuario) {

        return res.status(403).send("O id do usuário está indefinido!");

    } else if (!mensagem) {

        return res.status(400).send("A mensagem está indefinida!");

    } else if (!categoria) {

        return res.status(400).send("A categoria está indefinida!");

    }

    comunidadeModel.publicar(idUsuario, mensagem, categoria, spoiler, fotos)
        .then(function (resultado) {
            res.json(resultado);
        })
        .catch(function(erro) {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function listar(req, res) {
    comunidadeModel.listar()
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!");
            }
        })
        .catch(function (erro) {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    publicar,
    listar
};