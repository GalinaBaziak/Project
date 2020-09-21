-- 3. Написать DDL-скрипты для создания пустой БД:
-- Создание БД "КОЛЛЕДЖ"
create schema if not exists college;
-- создаём таблицу "Цикловая комиссия":
create table college.COMM_LECT (
    comm_lect_id VARCHAR(4)
    , comm_lect_nm VARCHAR(80)
);
-- создаём таблицу "Преподаватель":
create table college.LECTURER (
    lecturer_id VARCHAR(6)
    , lecturer_surnm VARCHAR(20)
    , lecturer_nm VARCHAR(20)
    , lecturer_middle_nm VARCHAR(20)
    , comm_lect_id VARCHAR(4)
);
-- создаём дополнительную таблицу "Сотрудник":
create table college.EMPLOYEE (
    employee_id VARCHAR(11)
    , lecturer_id VARCHAR(6)
    , sex VARCHAR(10)
    , birth_dt date
    , emloym_dt date
    , edu_level VARCHAR(50)
    , passport_series VARCHAR(4)
    , passport_no VARCHAR(6)
    , address VARCHAR(100)
    , telephon_no VARCHAR(20)
);
-- создаём таблицу "Дисциплина":
create table college.ACADEMIC_SUB (
    academic_sub_id VARCHAR(7)
    , academic_sub_nm VARCHAR(50)
);
-- создаём таблицу связи "Преподаватель-Дисциплина":
create table college.LECTURER_X_ACADEM_SUB (
    lect_x_academ_sub_id INT
    , academic_sub_id VARCHAR(7)
    , lecturer_id VARCHAR(11)
);
-- создаём таблицу "Студент":
create table college.STUDENT (
    student_id VARCHAR(11)
    , student_surnm VARCHAR(20)
    , student_nm VARCHAR(20)
    , student_middle_nm VARCHAR(20)
    , group_id VARCHAR(10)
);
-- создаём дополнительную таблицу "Сведения о студенте":
create table college.ADD_INFO_STUD (
    add_info_stud_id INT
    , student_id VARCHAR(11)
    , sex VARCHAR(10)
    , birth_dt DATE
    , passport_series INT
    , passport_no INT
    , address VARCHAR(150)
    , telephon_no VARCHAR(20)
);
-- создаём таблицу "Группа":
create table college.STUD_GROUP (
    group_id VARCHAR(10)
    , mode_study VARCHAR(20)
    , begin_dt DATE
    , end_dt DATE
);
-- создаём таблицу "Оценка":
create table college.GRADE (
    grade_id INT
    , student_id VARCHAR(11)
    , grade_dt DATE
    , semester SMALLINT
    , lec_academ_sub_id INT
    , type_control VARCHAR(20)
    , grade_numb SMALLINT
);
-- создаём дополнительную таблицу "Успеваемость":
create table college.PROGRESS (
    progress_id INT
    , grade_id INT
);

select *
from information_schema.tables
    where table_schema = 'college';
SET search_path = college, public;
