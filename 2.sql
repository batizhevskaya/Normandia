--2 
select e.department_id -- получаем id департамента
from employee e -- из таблицы employee
group by e.department_id -- группируем по департаментам
having count(e.id)<=3; -- и записи, где сотрудников меньше или равно 3