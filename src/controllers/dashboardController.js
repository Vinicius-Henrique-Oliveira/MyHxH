var dashboardModel = require("../models/dashboardModel");


function dados(req, res) {
    Promise.all([
        dashboardModel.total_respostas(),
        dashboardModel.favorito_personagem(),
        dashboardModel.favorito_arco(),
        dashboardModel.favorito_trupe(),
        dashboardModel.all_personagens(),
        dashboardModel.all_arcos(),
        dashboardModel.all_trupe(),
        dashboardModel.porcentagem_personagem(),
        dashboardModel.porcentagem_arco(),
        dashboardModel.porcentagem_trupe(),
    ]).then(function (respostas) {
        res.json({
            total_respostas: respostas[0],
            favorito_personagem: respostas[1],
            favorito_arco: respostas[2],
            favorito_trupe: respostas[3],
            all_personagens: respostas[4],
            all_arcos: respostas[5],
            all_trupe: respostas[6],
            porcentagem_personagem: respostas[7],
            porcentagem_arco: respostas[8],
            porcentagem_trupe: respostas[9]
        });

    }).catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    dados
};