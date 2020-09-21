-- 5. Сформулировать 5 смысловых запросов к БД. Написать их на SQL.
---- 1. Найдем количество оценок "отлично":
select count(grade_numb) as COUNT_5
    , avg(grade_numb) as AVG_GRADE
    from GRADE where grade_numb = '5'
;
---- 2. Найдём средний балл за экзамен:
select avg(grade_numb) as AVG_GRADE
    from GRADE
;
---- 3. Выведем Имя,Отчество и фамилию преподавателей,
-- входящих с состав комиссии естественно-научных дисциплин:
select distinct comm_lect_id
    , lecturer_surnm
    , lecturer_nm
    , lecturer_middle_nm
    from LECTURER
    group by comm_lect_id, lecturer_surnm, lecturer_nm, lecturer_middle_nm
    having comm_lect_id = 'ЕН'
    order by lecturer_middle_nm, lecturer_nm,lecturer_surnm
;
---- 4. Найдём ФИО студенток:
select distinct stud.student_surnm
    , stud.student_nm
    , stud.student_middle_nm
    from STUDENT as stud
    inner join ADD_INFO_STUD as stud_info
        on stud.student_id = stud_info.student_id
        and stud_info.sex = 'женский'
    --group by stud.student_surnm, stud.student_nm, stud.student_middle_nm
    --order by stud.student_surnm, stud.student_nm, stud.student_middle_nm
;
---- 5. Выведем фамилии всех преподавателей математики в алфавитном порядке:
select distinct lect.lecturer_surnm
    from LECTURER as lect
    inner join LECTURER_X_ACADEM_SUB as LECT_ACAD_S
        on LECT_ACAD_S.lecturer_id = lect.lecturer_id
        and LECT_ACAD_S.academic_sub_id = 'ОДБ.04'
    group by lect.lecturer_surnm
    order by lect.lecturer_surnm asc
;
