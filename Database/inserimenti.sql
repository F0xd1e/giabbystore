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
insert into Prodotto values ("PRD0000001", "GTX 1050 4GB", "Una splendida GTX 1050 da 4GB con frequenze che non fregano a nessuno", "Schede video", 120.80, 125, 8, "./productImages/gtx1050.jpg");
insert into Prodotto values ("PRD0000002", "GTX 1060 6GB", "Una splendida GTX 1060 molto veloce", "Schede video", 180.60, 142, 8, "./productImages/gtx1060.jpg");
insert into Prodotto values ("PRD0000003", "GTX 1080 4GB", "Una splendida GTX 1080 da 4GB che regge il 4K", "Schede video", 250.00, 87, 7, "./productImages/gtx1080.jpg");
insert into Prodotto values ("PRD0000004", "Intel i3 5100", "Un i3 molto potente, o forse no", "Processori", 85.90, 74, 10, "./productImages/i35100.jpg");
insert into Prodotto values ("PRD0000005", "Intel i5 4200", "Wow, un i5 di quarta generazione", "Processori", 210.00, 147, 10, "./productImages/i54200.jpg");
insert into Prodotto values ("PRD0000006", "HyperX RAM DDR4 8GB", "Più GB hai e meglio è", "RAM", 56.70, 86, 6, "./productImages/hxram8gb.jpg");

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

