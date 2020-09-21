-- 6. Написать CRUD-запрос (подсказка: 4 запроса) к двум любым таблицам БД.
-- 6.1. посмотрим таблицу "Группа":
select * from STUD_GROUP;
-- изменим структуру таблицы "Группа", добавив колонку "Куратор":
alter table STUD_GROUP add column curator varchar(20);
select * from STUD_GROUP;
-- заполним колонку "Куратор":
update STUD_GROUP set curator='Смирнова И.П.' where group_id in ('ИСП-1-2','ИСП-1-3');
update STUD_GROUP set curator='Миронов П.Ю.' where group_id = 'ИСП-2-1';
update STUD_GROUP set curator='Гришин Е.С.' where group_id = 'АДМ-1-1';
select * from STUD_GROUP;
-- изменим одно из значений:
update STUD_GROUP set curator='Сергеева О.И.' where curator = 'Гришин Е.С.';
select * from STUD_GROUP;
-- удалим колонку "Куратор":
alter table STUD_GROUP drop column curator;
select * from STUD_GROUP;

-- 6.2. посмотрим структуру дополнительной таблицы "Успеваемость":
select * from PROGRESS;
-- добавим в таблицу "Успеваемость" колонку "Оценка":
alter table PROGRESS add column grade_numb_copy smallint;
select * from PROGRESS;
-- заполним таблицу "успеваемость", скопировав значения столбцов из таблицы "Оценка":
insert into PROGRESS (progress_id, grade_id, grade_numb_copy)
    select grade_id, grade_id, grade_numb from GRADE;
select * from PROGRESS;
-- добавим в таблицу "Успеваемость" колонку "Комментарий":
alter table PROGRESS add column comment varchar(20);
-- удалим из таблицы столбец "Код записи":
alter table PROGRESS drop column progress_id;
-- проверяем результат предыдущих действий:
select * from PROGRESS;
-- заполняем значения поля "Комментарий":
update PROGRESS set comment='успевает' where grade_numb_copy in ('3','4','5');
update PROGRESS set comment='не успевает' where grade_numb_copy in ('2','0');
-- проверяем результат заполнения поля "Комментарий":
select * from PROGRESS;
-- изменяем значения поля "Комментарий":
update PROGRESS set comment='не явился' where grade_numb_copy ='0';
-- проверяем результат:
select * from PROGRESS;
-- удалим из таблицы строку с не явкой:
delete from PROGRESS where grade_numb_copy = '0';
-- проверяем результат удаления строки из таблицы
select * from PROGRESS;
-- очищаем таблицу:
truncate PROGRESS;
-- удаляем таблицу:
drop table PROGRESS;