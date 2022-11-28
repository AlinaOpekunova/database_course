--Пользователи:
--Читатель – reader 
--Сотрудник отдела комплектации – staff
--Сотрудник по работе с читателями – librarian

--Таблицы
grant select on Readers to staff
grant select, insert, update on Readers to librarian

grant select, insert, update on ListBook to librarian

grant select, insert, update on OrderBook to librarian

grant select on Category to reader
grant select, insert, update on Category to staff
grant select on Category to librarian

grant select on BookCategory to reader
grant select, insert, update on BookCategory to staff
grant select on BookCategory to librarian

grant select on Series to reader
grant select, insert, update on Series to staff
grant select on Series to librarian

grant select on Books to reader
grant select, insert, update on Books to staff
grant select on Books to librarian

grant select, insert, update on Languages to staff

grant select, insert, update on Copies to reader
grant select on Copies to librarian

grant select on Telephones

grant select on PubHouses to reader
grant select, insert, update on PubHouses to staff
grant select on PubHouses to librarian

grant select on BookAuthor to reader
grant select, insert, update on BookAuthor to staff
grant select on BookAuthor to librarian

grant select, insert, update on PubCity to staff

grant select on Countries to reader
grant select, insert, update on Countries to staff
grant select on Countries to librarian

grant select, insert, update on Cities to staff

grant select on Authors to reader
grant select, insert, update on Authors to staff
grant select on Authors to librarian

--Представления
grant select on my_infomation to reader
grant select on my_orders to reader
grant select on my_list to reader
grant select on bcategory to reader
grant select on bseries to reader
grant select on bauthor to reader
grant select on curr_books to reader
grant select on curr_books to librarian
grant select on curr_debtors to librarian
grant select on curr_num_book to librarian
grant select on copies_books to librarian
