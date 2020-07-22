--5
-- ВСПОМОГАТЕЛЬНЫЙ ЗАПРОС select d.id from department d where d.name='QA' -- выбираем ID созданного департамента (доп запрос)

-- Добавление 1го сотрудника
INSERT INTO employee (department_id,name,salary) 		-- вставляем все кроме id (первичный ключ) и шефа (т.к. не знаем айди)
VALUES ((select d.id from department d where d.name='QA'),'Mort',5);
-- Добавление 2го сотрудника
INSERT INTO employee (department_id,name,salary) 		-- вставляем все кроме id (первичный ключ) и шефа (т.к. не знаем айди)
VALUES ((select d.id from department d where d.name='QA'),'Vasya',15);
-- Добавление 3го сотрудника
INSERT INTO employee (department_id,name,salary) 		-- вставляем все кроме id (первичный ключ) и шефа (т.к. не знаем айди)
VALUES ((select d.id from department d where d.name='QA'),'Gena',25);
-- Добавление шефа
INSERT INTO employee (department_id,name,salary) 		-- вставляем все кроме id (первичный ключ) и шефа (т.к. не знаем айди)
VALUES ((select d.id from department d where d.name='QA'),'Boss',35);

-- ВСПОМОГАТЕЛЬНЫЙ ЗАПРОС select e.id from employee where e.name='Boss' and e.department_id=(select d.id from department d where d.name='QA') -- получаем id сотрудника, который будет шефом

-- обновление сотрудников
update employee 																									-- обновляем айди шефа
set chief_id=(																						
select e.id from employee where e.name='Boss' and e.department_id=(select d.id from department d where d.name='QA') -- получаем id сотрудника который будет шефом
			) 
where e.department_id=(select d.id from department d where d.name='QA') and e.name!='Boss'; 							-- у сотрудников, которые не являются шефом


commit;								