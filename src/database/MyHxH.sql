CREATE DATABASE MyHxH;

USE MyHxH;

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE comunidade_post (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_usuario INT NOT NULL,
    mensagem VARCHAR(250),
    categoria VARCHAR(20) NOT NULL,
    spoiler BOOLEAN NOT NULL DEFAULT FALSE,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chCategoria 
        CHECK (categoria IN('Discussão', 'Teorias', 'Curiosidades', 'Memes')),
    FOREIGN KEY (fk_usuario)
        REFERENCES usuario(id)
);

CREATE TABLE comunidade_imagem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_post INT NOT NULL,
    caminho VARCHAR(250) NOT NULL,
    FOREIGN KEY (fk_post)
        REFERENCES comunidade_post(id)
);

CREATE TABLE pergunta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    enunciado VARCHAR(255) NOT NULL,
    ordem_exibicao INT NOT NULL UNIQUE,
    ativa BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE resposta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    resposta VARCHAR(45),
    fk_pergunta INT NOT NULL,
    fk_usuario INT NOT NULL,
    respondido_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_usuario)
        REFERENCES usuario(id),
    FOREIGN KEY (fk_pergunta)
        REFERENCES pergunta(id)
);

INSERT INTO pergunta (id, enunciado, ordem_exibicao) VALUES
(1, 'Qual é o seu personagem favorito?', 1),
(2, 'Qual é o seu arco favorito?', 2),
(3, 'Quem é seu integrante favorito da Trupe Fantasma?', 3);

SELECT * FROM usuario;
SELECT * FROM resposta;
SELECT * FROM pergunta;



CREATE VIEW respostas AS
SELECT
	TRUNCATE(COUNT(*) / 3, 0) 'Participantes'
FROM resposta;



CREATE VIEW personagens AS
SELECT
	resposta 'personagem', 
    COUNT(resposta) 'respostas'
FROM resposta
WHERE resposta IN ('Gon', 'Killua', 'Kurapika', 'Netero', 'Hisoka', 'Meruem')
GROUP BY resposta;

CREATE VIEW arcos AS
SELECT
	resposta 'arco', 
    COUNT(resposta) 'respostas'
FROM resposta
WHERE resposta IN ('exame-hunter', 'torre-celestial', 'yorknew-city', 'greed-island', 'formigas-quimera', 'eleicao')
GROUP BY resposta;

CREATE VIEW trupe AS
SELECT
	resposta 'personagem', 
    COUNT(resposta) 'respostas'
FROM resposta
WHERE resposta IN ('Chrollo', 'Feitan', 'Machi', 'Nobunaga', 'Shizuku', 'Phinks')
GROUP BY resposta;

-- --------------------------- --
-- PERSONAGEM MAIS VOTADO DO QUIZ --


CREATE VIEW personagem_favorito AS
SELECT 
	*
FROM personagens
ORDER BY respostas DESC 
LIMIT 1;

-- --------------------------- --
-- ARCO MAIS VOTADO DO QUIZ --


CREATE VIEW arco_favorito AS
SELECT 
	*
FROM arcos
ORDER BY respostas DESC 
LIMIT 1;

-- --------------------------- --
-- MEMBRO MAIS VOTADO DA TRUPE --

CREATE VIEW trupe_favorito AS
SELECT 
	*
FROM trupe
ORDER BY respostas DESC 
LIMIT 1;

SELECT * FROM trupe_favorito;