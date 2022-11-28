create index ind_book_order on OrderBook(O_book)
create index ind_reader_order on OrderBook(O_reader)

create index ind_book_copy on Copies(C_book)

create index ind_book_list on ListBook(L_book)
create index ind_reader_list on ListBook (L_reader)
create index ind_order_list on ListBook (L_order)

create index ind_series_books on Books(B_series)
create index ind_olan_books on Books(B_Olanguage)
create index ind_tlan_books on Books(B_Tlanguage)
create index ind_pub_books on Books(B_Pubhouse)

create index ind_category on BookCategory (BC_category)
create index ind_book on BookCategory (BC_book)

create index ind_tel_pub on Telephones (T_pub)

create index ind_pub on PubCity (PC_pub)
create index ind_city on PubCity (PC_city)

create index ind_country on Cities (C_country)

create index ind_book_ba on BookAuthor (BA_book)
create index ind_author_ba on BookAuthor (BA_author)

create index ind_country_author on Authors (A_country)
