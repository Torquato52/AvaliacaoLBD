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
VALUES ('Botafogo-SP', 'Riber�o Preto', 'Santa Cruz')
		,('Corinthians', 'S�o Paulo', 'Neo quimica Arena')
		,('Ferrovi�ria', 'Araraquara', 'Fonte luminosa')
		,('Guarani', 'Campinas', 'Brinco de Ouro')
		,('Inter de Limeira', 'Limeira', 'Limeir�o')
		,('ituano', 'Itu', 'Novelll j�nior')
		,('Mirassol', 'Mirassol', 'Jos� Maria de Campos Maia')
		,('Novorizontino', 'Novo horizonte', 'Jorge Ismael de Biasi')
		,('Palmeiras', 'S�o Paulo', 'Allianz Parque')
		,('Ponte Preta', 'Campinas', 'Mois�s Lucarelll')
		,('Red Bull Bragantino', 'Santo andr�', 'Nabi abi Chedid')
		,('Santo Andr�', 'Santo Andr�', 'Bruno Jos� Daniel')
		,('Santos', 'Santos', 'Vila Belmiro')
		,('S�o Bento', 'Sorocaba', 'Walter Ribeiro')
		,('S�o Caetano', 'S�o Caetano do Sul', 'Anacietto Campanella')
		,('S�o Paulo', 'S�o Paulo', 'Morumbi')