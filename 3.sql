--3
select e.department_id 			-- получаем id департамента
from employee e 				-- из таблицы employee
group by e.department_id 		-- группируем по департаментам
having sum(e.salary)>=(  		-- где сумма зарплат больше или равна
	select max(sum) 			-- выбрать максимальную сумму из
	from (
		select sum(e.salary) as sum, e.department_id 	-- все суммы зарплат сотрудников
		from employee e 
		group by e.department_id						-- сгруппированные по отделам
			)
						);
						
		