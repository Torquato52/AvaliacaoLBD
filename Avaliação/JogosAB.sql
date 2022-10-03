--EXEC JogosPRO1

CREATE PROCEDURE JogosPRO1
as
BEGIN

	truncate table Jogos
	declare @TimA int
	declare @TimB int
	declare @data datetime
    SET @data = GETDATE()
	SELECT FORMAT(@data, 'dddd') AS Result
	
	while FORMAT(@data, 'dddd') NOT IN ('quarta-feira')
	begin
		SELECT @data
		set @data = DATEADD (DAY ,1, @data)
	end


	select * 
	into #tmp_gruposA
	from Grupos(nolock)
	where Grupo IN (char(65))
	
	select * 
	into #tmp_gruposB
	from Grupos(nolock)
	where Grupo IN (char(66))

	declare timA cursor for
	select CodigoTime from #tmp_gruposA
	declare timB cursor for
	select CodigoTime from #tmp_gruposB
	open timA
	open timB
	fetch next from timA into @TimA
	fetch next from timB into @TimB
	while @@FETCH_STATUS = 0
	begin
		
		insert into Jogos (CodigoTimeA, CodigoTimeB, DataJogo)
		VALUES (@TimA, @TimB, @data) 

		fetch next from timA into @TimA
		fetch next from timB into @TimB

	end
	close timA
	deallocate timA
		close timB
	deallocate timB

END
