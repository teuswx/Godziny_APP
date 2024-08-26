CREATE DATABASE IF NOT EXISTS godziny_bd; --cria o database que vamos usar no python
CREATE EXTENSION IF NOT EXISTS "uuid-ossp"; --adiciona o tipo UUID no postgree

--cria a tabela curso para cadastro 
CREATE TABLE curso (
    sigla VARCHAR(30) PRIMARY KEY,
    nome VARCHAR NOT NULL,
    carga_horaria_complementar INT NOT NULL
);

--cria a tabela usuário que será usada para professores e alunos
CREATE TABLE usuario (
    matricula SERIAL PRIMARY KEY,
    curso_id VARCHAR(30) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    administrador BOOLEAN NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES curso(sigla)
);

--cria a tabela categoria
CREATE TABLE categoria (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    curso_id varchar(30) NOT NULL,
    horar_multiplicador FLOAT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    horas_maximas INT NOT NULL,
    descricao VARCHAR(500),
    FOREIGN KEY (curso_id) REFERENCES curso(sigla)
);

--cria a tabela arquivo
CREATE TABLE arquivo (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    nome VARCHAR NOT NULL,
    tipo VARCHAR NOT NULL
);

--cria a tabela atividade
CREATE TABLE atividade (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    usuario_id INT NOT NULL,
    categoria_id UUID NOT NULL,
    titulo VARCHAR(500) NOT NULL,
    data TIMESTAMPTZ NOT NULL,
    status VARCHAR,
    arquivo_id UUID,
    carga_horaria DECIMAL,
    comentario VARCHAR(500) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(matricula),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id),
    FOREIGN KEY (arquivo_id) REFERENCES arquivo(id) 
);








