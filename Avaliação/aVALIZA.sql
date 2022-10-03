CREATE DATABASE Futebol

use Futebol
go
CREATE TABLE Times(
			CodigoTime INT PRIMARY KEY IDENTITY(1,1)
			,NomeTime VARCHAR (20) NOT NULL
			,Cidade VARCHAR(20) NOT NULL
			,Estadio VARCHAR(40) NOT NULL
)

CREATE TABLE Grupos(
			Grupo char
			,CodigoTime INT FOREIGN KEY REFERENCES Times(CodigoTime)
)

CREATE TABLE Jogos(
			CodigoTimeA INT FOREIGN KEY REFERENCES Times(CodigoTime)
			,CodigoTimeB INT FOREIGN KEY REFERENCES Times(CodigoTime)
			,GolsTimeA INT 
			,GolsTimeB INT 
			,DataJogo SMALLDATETIME
)

INSERT INTO Times(NomeTime, Cidade, Estadio)
VALUES ('Botafogo-SP', 'Riberão Preto', 'Santa Cruz')
		,('Corinthians', 'São Paulo', 'Neo quimica Arena')
		,('Ferroviária', 'Araraquara', 'Fonte luminosa')
		,('Guarani', 'Campinas', 'Brinco de Ouro')
		,('Inter de Limeira', 'Limeira', 'Limeirão')
		,('ituano', 'Itu', 'Novelll júnior')
		,('Mirassol', 'Mirassol', 'José Maria de Campos Maia')
		,('Novorizontino', 'Novo horizonte', 'Jorge Ismael de Biasi')
		,('Palmeiras', 'São Paulo', 'Allianz Parque')
		,('Ponte Preta', 'Campinas', 'Moisés Lucarelll')
		,('Red Bull Bragantino', 'Santo andré', 'Nabi abi Chedid')
		,('Santo André', 'Santo André', 'Bruno José Daniel')
		,('Santos', 'Santos', 'Vila Belmiro')
		,('São Bento', 'Sorocaba', 'Walter Ribeiro')
		,('São Caetano', 'São Caetano do Sul', 'Anacietto Campanella')
		,('São Paulo', 'São Paulo', 'Morumbi')