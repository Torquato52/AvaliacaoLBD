--EXEC JogosPRO2

ALTER PROCEDURE JogosPRO2
as
BEGIN
	declare @TimeC int
	declare @TimeD int
	declare @data datetime
    SET @data = GETDATE()
	SELECT FORMAT(@data, 'dddd') AS Result
	
	while FORMAT(@data, 'dddd') NOT IN ('domingo')
	begin
		SELECT @data
		set @data = DATEADD (DAY ,1, @data)
	end
	
	select * 
	into #tmp_gruposA
	from Grupos(nolock)
	where Grupo IN (char(67))
	
	select * 
	into #tmp_gruposB
	from Grupos(nolock)
	where Grupo IN (char(68))

	declare timC cursor for
	select CodigoTime from #tmp_gruposA
	declare timD cursor for
	select CodigoTime from #tmp_gruposB
	open timC
	open timD
	fetch next from timC into @TimeC
	fetch next from timD into @TimeD
	while @@FETCH_STATUS = 0
	begin
		insert into Jogos (CodigoTimeA, CodigoTimeB, DataJogo)
		VALUES (@TimeC, @TimeD,@data) 

		fetch next from timC into @TimeC
		fetch next from timD into @TimeD

	end
	close timC
	deallocate timC
	close timD
	deallocate timD

END