-- 8. Создать 2 сложных представления (с джойном)
---- Созданим представлнение с полным списком преподавателей, поля ФИО объединим,
---- дополнительно выведем код цикловой комиссии и дополнительные сведения:
---- дата рождения, пол и образование:
create view v_LECTURER_1 as
    select lect.lecturer_surnm || ' ' || lect.lecturer_nm
            || ' ' || lect.lecturer_middle_nm as "Фамилия_Имя_Отчество"
            , lect.comm_lect_id as "Цикловая_комиссия"
            , emp.birth_dt as "Дата_рождения"
            , emp.sex as "Пол"
            , emp.edu_level as "Образование"
        from LECTURER lect
            left join EMPLOYEE emp
                on lect.lecturer_id = emp.lecturer_id
;
select * from v_LECTURER_1;

drop view v_LECTURER_1;

-- Созданим представлнение со списком студентом, получивших на экзамене 4 или 5:
create view v_STUDENT_1 as
    select stud.student_surnm || ' ' || stud.student_nm
            || ' ' || stud.student_middle_nm as "Фамилия_Имя_Отчество_студента"
            , gr.grade_numb as "Оценка_4_5"
    from STUDENT stud
    left join GRADE gr
            on stud.student_id = gr.student_id
            group by stud.student_surnm || ' ' || stud.student_nm
            || ' ' || stud.student_middle_nm, gr.grade_numb
            having gr.grade_numb in ('4','5')
            order by stud.student_surnm || ' ' || stud.student_nm
            || ' ' || stud.student_middle_nm, gr.grade_numb
;
select * from v_STUDENT_1;
drop view v_STUDENT_1;

