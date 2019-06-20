use dbgiabby;

/*
	INSERIMENTO DEGLI UTENTI
*/
insert into Utente values ("userTest", "Password1", "Name", "Surname", "My Address, 1", "City", "11111", "Nation", "3930967821", "usertest@gmail.com", FALSE, TRUE);
insert into Utente values ("adminTest", "Password1", "Name", "Surname", "My Address, 1", "City", "11111", "Nation", "3930967821", "admintest@gmail.com", TRUE, TRUE);

/*
	INSERIMENTO DEI PRODOTTI
*/
insert into Prodotto (titolo, descrizione, tipologia, prezzo, disponibilita, spedizione, imgPath)
	values ("Nintendo 3DS XL", "Portabe console", "Console", 100.80, 125, 8, "./images/product_3ds.png");
insert into Prodotto (titolo, descrizione, tipologia, prezzo, disponibilita, spedizione, imgPath)
	values ("Sony PlayStation 2", "Home console ", "Console", 100.60, 142, 8, "./images/product_ps2.png");
insert into Prodotto (titolo, descrizione, tipologia, prezzo, disponibilita, spedizione, imgPath)
	values ("Nintendo Switch", "Portable console", "Console", 300.00, 87, 7, "./images/product_switch.png");
insert into Prodotto (titolo, descrizione, tipologia, prezzo, disponibilita, spedizione, imgPath)
	values ("Huawei Honor", "Huauwei smartphone", "Smartphone", 400.99, 74, 10, "./images/product_honor.png");
insert into Prodotto (titolo, descrizione, tipologia, prezzo, disponibilita, spedizione, imgPath)
	values ("IPhone X 64GB", "IPhone smartphone", "Smartphone", 999.0, 147, 10, "./images/product_iphone.png");
insert into Prodotto (titolo, descrizione, tipologia, prezzo, disponibilita, spedizione, imgPath)
	values ("OnePlus 7 64GB", "OnePlus smartphone", "Smartphone", 700.0, 86, 6, "./images/product_oneplus.png");
insert into Prodotto (titolo, descrizione, tipologia, prezzo, disponibilita, spedizione, imgPath)
	values ("Televisore LG043256", "LG television for all kind of uses", "Television",2000.0, 74, 10, "./images/product_tvlg.png");
insert into Prodotto (titolo, descrizione, tipologia, prezzo, disponibilita, spedizione, imgPath)
	values ("Televisore Samsung L408393", "Samsung panel with crisp visuals", "Television", 2100.00, 147, 10, "./images/product_tvsamsung.png");
insert into Prodotto (titolo, descrizione, tipologia, prezzo, disponibilita, spedizione, imgPath)
	values ("Televisore Philips R405548", "Philips television with OLED technology", "Television", 3045.90, 86, 6, "./images/product_tvphilips.png");
insert into Prodotto (titolo, descrizione, tipologia, prezzo, disponibilita, spedizione, imgPath)
	values ("Hitachi Wand", "Handheld massager for all kind of uses", "Miscellaneous", 250.50, 74, 10, "./images/product_hitachi.png");