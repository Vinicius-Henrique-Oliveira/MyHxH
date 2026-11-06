var express = require("express");
var router = express.Router();

var upload = require("../config/configUpload");
var comunidadeController = require("../controllers/comunidadeController");

router.post("/publicar/:idUsuario", upload.array("fotos", 4), function (req, res) {
    comunidadeController.publicar(req, res);
});

router.get("/listar", function(req, res) {
    comunidadeController.listar(req, res)
})

module.exports = router;