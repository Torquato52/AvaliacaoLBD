--EXEC Divisao

ALTER PROCEDURE Divisao
AS 
begin

	
	TRUNCATE TABLE Grupos

	select * 
	into #tmp_times
	from Times(nolock)
	
	declare @cont int = 0
	declare @i int = 1
	declare @codigo_time int
	declare @NomeTime varchar
	
	declare res_tim cursor for
	select CodigoTime, NomeTime from #tmp_times 
	where NomeTime IN ('São Paulo', 'Palmeiras', 'Corinthians', 'Santos')
	order by newid()
	open res_tim
	fetch next from res_tim into @codigo_time, @NomeTime
	while @i <= 4
	begin
		
		insert into Grupos
		VALUES (CHAR(64+ @i), @codigo_time)
		set @i = @i+ 1
		fetch next from res_tim into @codigo_time, @NomeTime
	end
	close res_tim
	deallocate res_tim


	declare c_grupos cursor for
	select CodigoTime, NomeTime from #tmp_times 
	where NomeTime NOT IN ('São Paulo', 'Palmeiras', 'Corinthians', 'Santos')
	order by NEWID() 
	open c_grupos
	
	fetch next from c_grupos into @codigo_time, @NomeTime
	while @@FETCH_STATUS = 0
	begin
		
		insert into Grupos
		select
		case when (@cont)/3 >= 1 then
		
		case when (@cont)/3+1 = 2 then 'B'
		when (@cont)/3+1 = 3 then 'C'
		else 'D' 
		end
		
		else 'A'

	end, @codigo_time
		set @cont = @cont + 1
		fetch next from c_grupos into @codigo_time, @NomeTime

	end
		
	close c_grupos
	deallocate c_grupos

end