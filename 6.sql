--6
--удаляем обычных сотрудников
delete from Employee e -- удаляем обычных сотрудников
where 		 
e.department_id=(select d.id from department d where d.name='QA')	-- где департамент равен QA
and e.id != (Select chief_id from Employee where e.department_id = (select d.id from department d where d.name='QA')); -- и сотрудник не является шефом этого департамента

-- удаляем шефа (последнего сотрудника в департаменте)
delete from Employee e -- удаляем всех сотрудников
where e.department_id=(select d.id from department d where d.name='QA');	-- где департамент равен QA

-- удаляем департамент
Delete from Department d 
where d.id = (select d.id from department d where d.name='QA');

commit;