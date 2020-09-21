drop schema if exists college cascade;

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

-- 4. Заполнить БД данными:
-- вставляем записи в таблицу "Цикловая комиссия":
insert into COMM_LECT values('ЕН','комиссия естественно-научных дисциплин');
insert into COMM_LECT values('ОГСЭ','комиссия гумнитарных и социально-экономических дисциплин');
insert into COMM_LECT values('ОТД','комиссия общетехнических дисциплин');
insert into COMM_LECT values('ИСП','комиссия специальности 09.02.07');
insert into COMM_LECT values('АДМ','комиссия специальности 09.02.06');
insert into COMM_LECT values('ОДЛ','комиссия специальности 38.02.03');
insert into COMM_LECT values('БК','комиссия специальности 38.02.01');
-- проверяем записи в таблице "Цикловая комиссия":
select * from COMM_LECT;
-- вставляем записи в таблицу "Преподаватель":
insert into LECTURER values('002201','Смирнова','Ирина','Петровна','ЕН');
insert into LECTURER values('003002','Миронов','Павел','Юрьевич','ЕН');
insert into LECTURER values('004013','Гришин','Евгений','Сергеевич','ЕН');
insert into LECTURER values('001204','Сергеева','Ольга','Ивановна','ЕН');
insert into LECTURER values('001105','Емец','Татьяна','Ивановна','ЕН');
insert into LECTURER values('002112','Игнатьева','Татьяна','Павловна','ОГСЭ');
insert into LECTURER values('000123','Миронов','Алексей','Николаевич','ОГСЭ');
insert into LECTURER values('000234','Иванова','Вера','Николаевна','ОГСЭ');
insert into LECTURER values('012202','Истомин','Валерий','Евгеньевич','ОГСЭ');
insert into LECTURER values('001301','Антонова','Алла','Андреевна','ИСП');
insert into LECTURER values('002401','Шохин','Сергей','Викторович','БК');
insert into LECTURER values('004531','Литвинова','Лариса','Петровна','ОДЛ');
insert into LECTURER values('004671','Григорьев','Виктор','Владимирович','ОТД');
insert into LECTURER values('005341','Иванов','Александр','Павлович','ИСП');
insert into LECTURER values('005671','Минина','Ксения','Егоровна','ОТД');
-- проверяем записи в таблице "Преподаватель":
select * from LECTURER;
-- вставляем записи в таблицу "Сотрудник":
insert into EMPLOYEE values('002201/1995','002201','Женский','05.03.1961','01.09.2014','высшее','4614','650699','г. Долгопрудный, ул. Московское ш., д. 55 к. 2 кв. 44','+7 (926) 110-44-68');
insert into EMPLOYEE values('003002/2012','003002','Мужской','25.07.1970','01.09.2012','высшее','4614','663959','г. Дмитров, ул. Космонавтов, д. 2 кв. 58','+7 (925) 312-21-40');
insert into EMPLOYEE values('004013/2010','004013','Мужской','05.12.1977','01.09.2010','высшее','5314','449975','г. Химки ул. Совхозная, д. 27 кв. 32','+7 (903) 260-23-65');
insert into EMPLOYEE values('001204/2017','001204','Женский','12.02.1972','01.09.2017','высшее','4614','680910','г. Лобня, ул. Чайковского, д. 10 кв. 38','+7 (916) 234-85-69');
insert into EMPLOYEE values('001105/2018','001105','Женский','16.02.1971','01.09.2018','высшее','8214','622705','г. Долгопрудный, ул. Дирижабельная, д. 26 кв. 35','+7 (926) 166-75-33');
insert into EMPLOYEE values('002112/2014','002112','Женский','30.05.1986','01.09.1996','высшее','4614','725287','г. Москва, ул. Милашенкова, д.8 кв. 25','+7 (903) 210-36-98');
insert into EMPLOYEE values('000123/2012','000123','Мужской','30.07.1988','01.09.2012','высшее','4614','681053','г. Долгопрудный, Институтский пер. д. 8 кв.9','+7 (925) 166-75-33');
insert into EMPLOYEE values('000234/2012','000234','Женский','15.03.1961','01.09.2012','высшее','4614','524748','г. Долгопрудный, ул. Ак. Лаврентьева д. 25 кв. 102','+7 (926) 145-19-81');
insert into EMPLOYEE values('002201/2019','002201','Мужской','23.10.1994','01.09.2019','высшее','4614','657062','г. Лобня, ул. 9-й квартал, д. 13 кв. 37 ','+7 (916) 136-28-94');
insert into EMPLOYEE values('001301/2015','001301','Женский','24.01.1980','01.09.2015','высшее','4614','444583','п. Марфино, ул. Зелёная, д. 7а кв. 41','+7 (926) 377-45-92');
insert into EMPLOYEE values('002401/2019','002401','Мужской','14.08.1987','01.09.2019','высшее','4614','650804','г. Долгопрудный, ул. Театральная, д. 8 кв. 16','+7 (925) 423-64-81');
insert into EMPLOYEE values('004531/2019','004531','Женский','26.04.1995','01.09.2019','высшее','4614','580946','г. Долгопрудный, ул. Советская д. 5 кв. 2','+7 (903) 211-87-90');
insert into EMPLOYEE values('004671/2014','004671','Мужской','30.09.1970','01.09.2014','среднее проф.','4514','89971','г. Лобня, ул. Дружбы, д. 4 кв. 4','+7 (916) 424-61-08');
insert into EMPLOYEE values('005341/2019','005341','Мужской','19.06.1985','01.09.2019','высшее','4614','525569','г. Лобня, ул. Молодёжная дом 4 корп. Б кв. 51','+7 (926) 163-75-35');
insert into EMPLOYEE values('005671/2019','005671','Женский','28.09.1984','01.09.2019','неполное высшее','4514','547241','г. Дмитров, ул. Космонавтов, д. 21 кв. 96','+7 (925) 312-75-56');
-- проверяем записи в таблице "Сотрудник":
select * from EMPLOYEE;
-- вставляем записи в таблицу "Дисциплина":
insert into ACADEMIC_SUB values('ОДБ.01','Русский язык (в том числе "Родной язык")');
insert into ACADEMIC_SUB values('ОДБ.02','Литература');
insert into ACADEMIC_SUB values('ОДБ.03','Иностранный язык');
insert into ACADEMIC_SUB values('ОДБ.04','Математика');
insert into ACADEMIC_SUB values('ОДБ.05','История');
insert into ACADEMIC_SUB values('ОДБ.06','Физическая культура');
insert into ACADEMIC_SUB values('ОДБ.07','Основы безопасности жизнедеятельности');
insert into ACADEMIC_SUB values('ОДБ.08','Астрономия');
insert into ACADEMIC_SUB values('ОДП.01','Информатика');
insert into ACADEMIC_SUB values('ОДП.02','Физика');
insert into ACADEMIC_SUB values('ОДП.03','Химия');
insert into ACADEMIC_SUB values('ОДБ.09','Обществознание (включая экономику и право)');
-- проверяем записи в таблице "Дисциплина":
select * from ACADEMIC_SUB;
-- вставляем записи в таблицу "Группа":
insert into STUD_GROUP values('ИСП-2-1','очная форма', '01.09.2019', '30.06.2023');
insert into STUD_GROUP values('ИСП-1-2','очная форма', '01.09.2020', '30.06.2024');
insert into STUD_GROUP values('ИСП-1-3','очная форма', '01.09.2020', '30.06.2024');
insert into STUD_GROUP values('АДМ-1-1','очная форма', '01.09.2020', '30.06.2024');
-- проверяем записи в таблице "Группа":
select * from STUD_GROUP;
-- вставляем записи в таблицу связи "Преподаватель-Дисциплина":
insert into LECTURER_X_ACADEM_SUB values('1','ОДБ.01','002112');
insert into LECTURER_X_ACADEM_SUB values('2','ОДБ.02','000123');
insert into LECTURER_X_ACADEM_SUB values('3','ОДБ.03','000234');
insert into LECTURER_X_ACADEM_SUB values('4','ОДБ.04','002201');
insert into LECTURER_X_ACADEM_SUB values('5','ОДБ.05','002201');
insert into LECTURER_X_ACADEM_SUB values('6','ОДБ.06','005341');
insert into LECTURER_X_ACADEM_SUB values('7','ОДБ.07','002112');
insert into LECTURER_X_ACADEM_SUB values('8','ОДБ.08','000123');
insert into LECTURER_X_ACADEM_SUB values('9','ОДБ.09','002201');
insert into LECTURER_X_ACADEM_SUB values('10','ОДП.01','003002');
insert into LECTURER_X_ACADEM_SUB values('11','ОДП.02','004013');
insert into LECTURER_X_ACADEM_SUB values('12','ОДП.03','001204');
insert into LECTURER_X_ACADEM_SUB values('4','ОДБ.04','001105');
-- проверяем записи в таблице связи "Преподаватель-Дисциплина":
select * from LECTURER_X_ACADEM_SUB;
-- вставляем записи в таблицу "Студент":
insert into STUDENT values('123455/2019','Андреева','Алиса','Владимировна','АДМ-1-1');
insert into STUDENT values('123456/2019','Безлюдько','Маргарита','Игоревна','АДМ-1-1');
insert into STUDENT values('123457/2019','Белоусов','Илья','Александрович','АДМ-1-1');
insert into STUDENT values('123458/2019','Бельтюков','Александр','Дмитриевич','АДМ-1-1');
insert into STUDENT values('123459/2019','Билоус','Дмитрий','Юрьевич','АДМ-1-1');
insert into STUDENT values('123460/2019','Гайдаков','Александр','Вадимович','АДМ-1-1');
insert into STUDENT values('123461/2019','Гарин','Денис','Алексеевич','АДМ-1-1');
insert into STUDENT values('123462/2019','Гришин','Ярослав','Алексеевич','АДМ-1-1');
insert into STUDENT values('123463/2019','Иванов','Михаил','Игоревич','АДМ-1-1');
insert into STUDENT values('123464/2019','Ковтунов','Дмитрий','Александрович','АДМ-1-1');
insert into STUDENT values('123465/2019','Ковылин','Максим','Александрович','АДМ-1-1');
insert into STUDENT values('123466/2019','Кочетков','Дмитрий','Сергеевич','АДМ-1-1');
insert into STUDENT values('123467/2019','Мальцев','Станислав','Денисович','АДМ-1-1');
insert into STUDENT values('123468/2019','Муминов','Иброхим','Ахрорович','АДМ-1-1');
insert into STUDENT values('123469/2019','Наумов','Николай','Владимирович','АДМ-1-1');
insert into STUDENT values('123470/2019','Нестеренко','Владислав','Дмитриевич','АДМ-1-1');
insert into STUDENT values('123471/2019','Парфилькин','Михаил','Юрьевич','АДМ-1-1');
insert into STUDENT values('123472/2019','Середюк','Даниил','Владимирович','АДМ-1-1');
insert into STUDENT values('123473/2019','Славнов','Артур','Валерьевич','АДМ-1-1');
insert into STUDENT values('123474/2019','Солнцев','Кирилл','Евгеньевич','АДМ-1-1');
insert into STUDENT values('123475/2019','Сорокин','Константин','Александрович','АДМ-1-1');
insert into STUDENT values ('123476/2019','Тонкопий','Илья','Андреевич','АДМ-1-1');
insert into STUDENT values('123477/2019','Федоров','Святослав','Павлович','АДМ-1-1');
insert into STUDENT values('123478/2019','Шаймин','Константин','Александрович','АДМ-1-1');
insert into STUDENT values('123479/2019','Юманов','Степан','Владимирович','АДМ-1-1');
-- проверяем записи в таблице "Студент":
select * from STUDENT;
-- вставляем записи в таблицу "Сведения о студенте":
insert into ADD_INFO_STUD values('123455','123455/2019','женский','28.08.2004','4614', '680910','г. Долгопрудный, ул. Ак. Лаврентьева д. 23 кв. 45','89858247746');
insert into ADD_INFO_STUD values('123456','123456/2019','женский','07.07.2004','4616','227659','г. Долгопрудный, ул. Циолковского, д. 34 кв. 83','89777881804');
insert into ADD_INFO_STUD values('123457','123457/2019','мужской','06.11.2004','4614','552773','Дмитровский р-н, пос. Останкино, ул. Дорожная, д. 13 а','89164963906');
insert into ADD_INFO_STUD values('123458','123458/2019','мужской','06.01.2005','5615','303482','г. Долгопрудный, ул. Молодежная, д. 4 кв. 122','89167727798');
insert into ADD_INFO_STUD values('123459','123459/2019','мужской','31.05.2004','4614','665978','Дмитровский р-н, п. Некрасовский, ул. Ушакова, д. 22 кв. 44','89998233443');
insert into ADD_INFO_STUD values('123460','123460/2019','мужской','15.05.2004','4613','321284','Дмитровский р-н, п. Некрасовский, ул. Полевая, д. 57','89266611076');
insert into ADD_INFO_STUD values('123461','123461/2019','мужской','18.06.2004','2814','322593','Дмитровский р-н, пос. Деденево, ул. Заречная, д. 3 кв. 10','89685405636');
insert into ADD_INFO_STUD values('123462','123462/2019','мужской','05.01.2001','4614','435406','г. Долгопрудный, Лихачевский пр-т, д. 68 к. 1 кв. 15','89773818407');
insert into ADD_INFO_STUD values('123463','123463/2019','мужской','25.07.2004','4617','565567','г. Долгопрудный, м-н Павельцево, Нефтянников, д. 14 кв. 15','89164812574');
insert into ADD_INFO_STUD values('123464','123464/2019','мужской','02.09.2004','4614','650670','г. Лобня, ул. Чайковского, д. 25 кв. 181','89771295596');
insert into ADD_INFO_STUD values('123465','123465/2019','мужской','14.11.2004','4614','624795','г. Лобня, ул. Космонавтов, д. 7 кв. 31','89688117726');
insert into ADD_INFO_STUD values('123466','123466/2019','мужской','26.03.2005','4614','631274','г. Долгопрудный, ул. Ак. Лаврентьева, д. 10 кв. 13','89269973124');
insert into ADD_INFO_STUD values('123467','123467/2019','мужской','07.06.2004','4515','093388','г. Долгопрудный, Лихачевский пр-т, д. 66 кв. 310','89858519930');
insert into ADD_INFO_STUD values('123468','123468/2019','мужской','27.03.2003','4614','552119','г. Химки, ул. Парковая д. 12 кв. 40','89266206760');
insert into ADD_INFO_STUD values('123469','123469/2019','мужской','18.12.2004','4614','681500','Мытищинский р-н, с. Марфино, ул. Санаторная, д. 1 кв. 7','89776051203');
insert into ADD_INFO_STUD values('123470','123470/2019','мужской','29.06.2003','4613','262762','г. Лобня, ул. Ленина, д. 16 кв. 76','89772642289');
insert into ADD_INFO_STUD values('123471','123471/2019','мужской','21.07.2004','4614','525403','г. Лобня, ул. Авиационная, д. 8 кв. 12','89162497613');
insert into ADD_INFO_STUD values('123472','123472/2019','мужской','21.05.2004','4613','321240','Дмитровский р-н, пос. Деденево, ул. Заречная, д. 7 кв.19','89175865429');
insert into ADD_INFO_STUD values('123473','123473/2019','мужской','18.01.2004','1713','315340','Владимирская обл., п. Вольдинский, Новосемёновская д. 22 кв. 29','89165802025');
insert into ADD_INFO_STUD values('123474','123474/2019','мужской','14.07.2004','4614','581948','г. Яхрома, ул. Ленина, д. 30а, кв. 25','89687608935');
insert into ADD_INFO_STUD values('123475','123475/2019','мужской','20.12.2004','4614','786085','г. Лобня, ул. 9-ый кв., д. 1 кв. 18','89099878549');
insert into ADD_INFO_STUD values('123476','123476/2019','мужской','21.02.2004','5313','401003','г. Долгопрудный, ул. Октябрьская, д. 2/8 кв. 23','89164265897');
insert into ADD_INFO_STUD values('123477','123477/2019','мужской','05.04.2004','4613','320876','Дмитровский р-н, пос. Останкино, ул. Дорожная, д. 19 кв. 8','89858247656');
insert into ADD_INFO_STUD values('123478','123478/2019','мужской','04.08.2004','9714','117285','Мытищинский р-н, д. Аббакумово, СНТ "Лесная полянка" ул. Лесная 110','89777881815');
insert into ADD_INFO_STUD values('123479','123479/2019','мужской','18.11.2004','4614','816868','г. Дмитров, ДЗФС, д. 27 кв. 23','89164963906');
-- проверяем записи в таблице "Сведения о студенте":
select * from ADD_INFO_STUD;
-- вставляем записи в таблицу "Оценки":
insert into GRADE values('1','123455/2019','15.06.2019','2','4','экзамен','5');
insert into GRADE values('2','123456/2019','15.06.2019','2','4','экзамен','3');
insert into GRADE values('3','123457/2019','15.06.2019','2','4','экзамен','3');
insert into GRADE values('4','123458/2019','15.06.2019','2','4','экзамен','4');
insert into GRADE values('5','123459/2019','15.06.2019','2','4','экзамен','4');
insert into GRADE values('6','123460/2019','15.06.2019','2','4','экзамен','4');
insert into GRADE values('7','123461/2019','15.06.2019','2','4','экзамен','0');
insert into GRADE values('8','123462/2019','15.06.2019','2','4','экзамен','4');
insert into GRADE values('9','123463/2019','15.06.2019','2','4','экзамен','2');
insert into GRADE values('10','123464/2019','15.06.2019','2','4','экзамен','4');
insert into GRADE values('11','123465/2019','15.06.2019','2','4','экзамен','5');
insert into GRADE values('12','123466/2019','15.06.2019','2','4','экзамен','4');
insert into GRADE values('13','123467/2019','15.06.2019','2','4','экзамен','4');
insert into GRADE values('14','123468/2019','15.06.2019','2','4','экзамен','2');
insert into GRADE values('15','123469/2019','15.06.2019','2','4','экзамен','4');
insert into GRADE values('16','123470/2019','15.06.2019','2','4','экзамен','3');
insert into GRADE values('17','123471/2019','15.06.2019','2','4','экзамен','4');
insert into GRADE values('18','123472/2019','15.06.2019','2','4','экзамен','4');
insert into GRADE values('19','123473/2019','15.06.2019','2','4','экзамен','4');
insert into GRADE values('20','123474/2019','15.06.2019','2','4','экзамен','3');
insert into GRADE values('21','123475/2019','15.06.2019','2','4','экзамен','5');
insert into GRADE values('21','123476/2019','15.06.2019','2','4','экзамен','4');
insert into GRADE values('23','123477/2019','15.06.2019','2','4','экзамен','0');
insert into GRADE values('24','123478/2019','15.06.2019','2','4','экзамен','3');
insert into GRADE values('25','123479/2019','15.06.2019','2','4','экзамен','5');
-- проверяем записи в таблице "Оценка":
select * from GRADE;

-- 5. Сформулировать 5 смысловых запросов к БД. Написать их на SQL.
---- 1. Найдем количество оценок "отлично":
select count(grade_numb) as "Количество_отлично"
    from GRADE where grade_numb = '5'
;
---- 2. Найдём средний балл за экзамен:
select avg(grade_numb) as "Средний_балл"
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
    order by lecturer_surnm, lecturer_nm,lecturer_middle_nm
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

-- 7. Создать по 1 представлению на каждую таблицу. В представлениях должен быть
-- реализован механизм маскирования личных (секретных) данных и скрытия технических
-- полей (суррогатных ключей и т.п.)
-- Подсказка: Список “секретных” атрибутов определяется студентом. Если, например,
-- номер банковской карты пользователя – секретный, вместо реального номера при запросе
-- из представления должна выводиться заглушка, например ‘555947******8424’. При этом
-- хранимые данные не должны меняться.
---- создаём представление таблицы "Преподаватель":
create view v_LECTURER as
    select *
        from LECTURER;
---- пытаемся замаскировать персональный номер преподавателя:
---- НЕ РАБОТАЕТ!!!!?????
alter view v_LECTURER
alter column lecturer_id add masked with (function = 'partial(1,"*****",0)');
-- удаляем представление для очередной безуспешной попытки справиться с заданием:
drop view v_LECTURER;

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


