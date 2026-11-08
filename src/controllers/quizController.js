var quizModel = require("../models/quizModel");

function cadastrar(req, res) {

    const personagem = req.body.personagem;
    const arco = req.body.arco;
    const trupe = req.body.trupe;

    quizModel.cadastrar(personagem, arco, trupe)
        .then(function (resultado) {
            res.json(resultado);
        })
        .catch(function(erro) {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    cadastrar
};