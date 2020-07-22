--7
--отключаем ключи в Employee
ALTER TABLE	Employee NOCHECK CONSTRAINT ALL;

--отключаем ключи в Department							
ALTER TABLE	Department NOCHECK CONSTRAINT ALL;

-- обновляем сотрудников департамента
update employee e set e.department_id=999 where e.department_id=(select d.id from department d where d.name='QA');

--обновляем id в Department
update Department d set d.id = 999 where d.name='QA'; 

--включаем ключи в Employee
ALTER TABLE	Employee CHECK CONSTRAINT ALL;

--включаем ключи в Department							
ALTER TABLE	Department CHECK CONSTRAINT ALL;
 
commit;