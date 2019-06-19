use dbgiabby;

/*
	INSERIMENTO DEGLI UTENTI
*/
insert into Utente values ("frekkanzer", "qwerty123!", "Francesco", "Abate", "via Luigi Ferrara, 26", "Cava de' Tirreni", "84013", "Italia", "3930967821", "abatefrancesco98@gmail.com", true, true);
insert into Utente values ("gabrael", "pastrocchi", "Gabriele", "Abate", "via Luigi Ferrara, 26", "Cava de' Tirreni", "84013", "Italia", "39348654211", "abategabriele01@gmail.com", false, true);
insert into Utente values ("lambojet", "grotta2000", "Vincenzo", "Lamberti", "via dei Pini, 23", "Cava de' Tirreni", "84013", "Italia", "39312151577", "vinslamberti@gmail.com", false, true);
insert into Utente values ("dadealfa", "betagamma", "Davide", "Alfieri", "piazza Duccio 18", "Cava de' Tirreni", "84013", "Italia", "33947845411", "dadealfa98@gmail.com", false, true);
insert into Utente values ("giannolo", "andreolo", "Giannandrea", "Vicidomini", "via dei Rossi 44", "Nocera Inferiore", "84013", "Italia", "3319861458", "giannandreavicidomini@gmail.com", true, true);

/*
	INSERIMENTO DEI PRODOTTI
*/
insert into Prodotto values ("PRD0000001", "Nintendo 3DS XL", "Portabe console", "Console", 100.80, 125, 8, "./images/product_3ds.png");
insert into Prodotto values ("PRD0000002", "Sony PlayStation 2", "Home console ", "Console", 100.60, 142, 8, "./images/product_ps2.png");
insert into Prodotto values ("PRD0000003", "Nintendo Switch", "Portable console", "Console", 300.00, 87, 7, "./images/product_switch.png");
insert into Prodotto values ("PRD0000004", "Huawei Honor", "Huauwei smartphone", "Smartphone", 400.99, 74, 10, "./images/product_honor.png");
insert into Prodotto values ("PRD0000005", "IPhone X 64GB", "IPhone smartphone", "Smartphone", 999.0, 147, 10, "./images/product_iphone.png");
insert into Prodotto values ("PRD0000006", "OnePlus 7 64GB", "OnePlus smartphone", "Smartphone", 700.0, 86, 6, "./images/product_oneplus.png");
insert into Prodotto values ("PRD0000007", "Televisore LG043256", "LG television for all kind of uses", "Television",2000.0, 74, 10, "./images/product_tvlg.png");
insert into Prodotto values ("PRD0000008", "Televisore Samsung L408393", "Samsung panel with crisp visuals", "Television", 2100.00, 147, 10, "./images/product_tvsamsung.png");
insert into Prodotto values ("PRD0000009", "Televisore Philips R405548", "Philips television with OLED technology", "Television", 3045.90, 86, 6, "./images/product_tvphilips.png");
insert into Prodotto values ("PRD0000010", "Hitachi Wand", "Handheld massager for all kind of uses", "Miscellaneous", 250.50, 74, 10, "./images/product_hitachi.png");

/*
	INSERIMENTO DEI CARRELLI
*/
insert into Carrello values ("frekkanzer", "PRD0000001");
insert into Carrello values ("frekkanzer", "PRD0000004");
insert into Carrello values ("frekkanzer", "PRD0000006");
insert into Carrello values ("lambojet", "PRD0000001");
insert into Carrello values ("lambojet", "PRD0000005");
insert into Carrello values ("dadealfa", "PRD0000003");
insert into Carrello values ("giannolo", "PRD0000002");
insert into Carrello values ("giannolo", "PRD0000006");

/*
	INSERIMENTO PAGAMENTI
*/
insert into Pagamento values ("4524662514568945", "2021-02-05", "Francesco", "Abate", "frekkanzer");
insert into Pagamento values ("4781654561862522", "2021-05-15", "Vincenzo", "Lamberti", "lambojet");
insert into Pagamento values ("7419153232143281", "2021-08-21", "Davide", "Alfieri", "dadealfa");
insert into Pagamento values ("8948623156862352", "2021-02-18", "Giannandrea", "Vicidomini", "giannolo");

