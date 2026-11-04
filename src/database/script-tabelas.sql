-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE MyHxH;

USE MyHxH;

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pergunta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    enunciado VARCHAR(255) NOT NULL,
    ordem_exibicao INT NOT NULL UNIQUE,
    ativa BOOLEAN NOT NULL DEFAULT TRUE
);


CREATE TABLE alternativa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_pergunta INT NOT NULL,
    texto VARCHAR(120) NOT NULL,
    ordem_exibicao INT NOT NULL,
    FOREIGN KEY (fk_pergunta)
        REFERENCES pergunta(id)
);

CREATE TABLE resposta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_usuario INT NOT NULL,
    fk_alternativa INT NOT NULL,
    respondido_em TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_usuario)
        REFERENCES usuario(id),
    FOREIGN KEY (fk_alternativa)
        REFERENCES alternativa(id)
);


-- Perguntas iniciais
INSERT INTO pergunta (id, enunciado, ordem_exibicao) VALUES
(1, 'Qual é o seu protagonista favorito?', 1),
(2, 'Qual é o seu arco favorito?', 2),
(3, 'Quem é seu integrante favorito da Trupe Fantasma?', 3);


INSERT INTO alternativa (id, fk_pergunta, texto, ordem_exibicao) VALUES
(1, 1, 'Gon Freecss', 1),
(2, 1, 'Killua Zoldyck', 2),
(3, 1, 'Kurapika', 3),
(4, 1, 'Leorio Paradinight', 4),
(5, 2, 'Exame Hunter', 1),
(6, 2, 'Yorknew City', 2),
(7, 2, 'Greed Island', 3),
(8, 2, 'Formigas Quimera', 4),
(9, 3, 'Chrollo Lucilfer', 1),
(10, 3, 'Feitan Portor', 2),
(11, 3, 'Machi Komacine', 3),
(12, 3, 'Shizuku Murasaki', 4);
