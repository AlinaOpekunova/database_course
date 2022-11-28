--Представления для читателя (только его личные данных, информация о забронированных и взятых им книгах)

CREATE OR REPLACE VIEW my_infomation AS
SELECT * FROM Readers
WHERE R_number=’номер чит.билета’;

CREATE OR REPLACE VIEW my_orders AS
SELECT * FROM OrderBook
WHERE O_reader=’номер чит.билета’;

CREATE OR REPLACE VIEW my_list AS
SELECT * FROM ListBook
WHERE L_reader=’номер чит.билета’;

-- Список книг определенной тематики
CREATE OR REPLACE VIEW bcategory AS
SELECT bc.bc_category, b.*
FROM BookCategory bc, Books b
WHERE bc.BC_book=B_code;

-- Список книг определенной по серии
CREATE OR REPLACE VIEW bseries AS
SELECT b.*
FROM Books b, Series s
WHERE s_name=B_series;

-- Список книг определенного автора
CREATE OR REPLACE VIEW bauthor AS
SELECT books.*
FROM Books, Authors, BookAuthor
WHERE ba_book=b_code AND ba_author=a_ID; 

-- Список книг в наличии на текущий момент
CREATE OR REPLACE VIEW curr_books AS
SELECT *
FROM Books
WHERE b_code NOT IN(SELECT l_book FROM ListBook WHERE L_enddate IS NULL);
Комментарий: когда книга выдана, дата возврата не указана, она указывается в момент возврата

--Список читателей, которые взяли книги в определенный период (например, за текущий месяц) и еще не вернули их
CREATE OR REPLACE VIEW curr_debtors AS
SELECT r.* 
FROM Readers r,ListBook l
WHERE r.r_number=l.l_reader AND (CURRENT_DATE-l_startdate)<31 AND (L_enddate IS NULL)

--Определение количества книг, взятых определенным читателем и еще не возвращенных на момент запроса
CREATE OR REPLACE VIEW curr_num_books AS
SELECT COUNT(l_book) AS "количество взятых книг", r_number, r_surname, r_name, r_fname, r_sex, r_born, r_telephone, r_mail, r_address, r_pasport 
FROM Readers r,ListBook l
WHERE r.r_number=l.l_reader AND (L_enddate IS NULL)
GROUP BY r_number, r_surname, r_name, r_fname, r_sex, r_born, r_telephone, r_mail, r_address, r_pasport 

--Получение числа доступных экземпляров книг 
CREATE OR REPLACE VIEW сopies_books AS
SELECT booklist.num AS "количество доступных экземпляров",b1.* 
FROM books b1,
(SELECT c_book, COUNT(c_num) AS num FROM Copies c
WHERE c_num NOT IN(SELECT l_book FROM ListBook WHERE L_enddate IS NULL) 
GROUP BY c_book) as booklist
WHERE b1.b_code=booklist.c_book;
