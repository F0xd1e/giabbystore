/************************************
	PROJECT GIABBY
		Francesco Abate
        Giannandrea Vicidomini
        Luigi Pasetti
        
	TABLE FILE
		Crea le tabelle del database.
        ATTENZIONE: È NECESSARIO ESEGUIRE QUESTO FILE PER PRIMO!
        Prima di procedere con la creazione delle tabelle, assicurarsi che il database sia vuoto.
			Nel caso non lo sia, eseguire il RESET FILE.
************************************/

USE dbgiabby;

CREATE TABLE Utente (
	username varchar(20) primary key,
    password varchar(20) not null,
    nome varchar(20) not null,
    cognome varchar(20) not null,
    indirizzo varchar(40) not null,
    città varchar(30) not null,
    cap char(5) not null,
    nazione varchar(20) not null,
    cellulare varchar(20) not null,
    email varchar(40) not null,
    isAdmin boolean not null, /*isAdmin è un flag che indica se l'utente X è un admin*/
    /*se isAdmin è posto a true significa che l'utente X potrà usufruire di tutte le funzioni da admin*/
    canAccess boolean not null /*canAccess è un flag che indica se l'utente X può accedere al sito*/
    /*se canAccess è posto a false significa che l'utente X è stato eliminato dalla piattaforma*/
); 

CREATE TABLE Prodotto (
	codiceProdotto char(10) primary key,
    titolo varchar(30) not null,
    descrizione varchar(500) not null,
    tipologia varchar(30) not null,
    prezzo decimal(7,2) not null, /*ESEMPIO PREZZO: XXXXX,YY*/
    disponibilita decimal(3) not null, /*RANGE DISPONIBILITÀ: 0 to 999*/
    spedizione decimal(2) not null, /*RANGE GIORNI SPEDIZIONE: 1 to 99*/
    imgPath varchar(100) not null
);

/*Il carrello per poter esistere dovrà poter contenere un utente (chi acquista) ed un oggetto*/
CREATE TABLE Carrello (
	utente varchar(20),
    prodotto char(10),
    foreign key (utente) references Utente(username)
		on update cascade
        on delete cascade,
	foreign key (prodotto) references Prodotto(codiceProdotto)
		on update cascade
        on delete cascade,
	primary key(utente, prodotto)
);

CREATE TABLE Pagamento (
	codiceCarta char(16) primary key,
    dataScadenza date not null,
    nome varchar(20) not null,
    cognome varchar(20) not null,
    utente varchar(20) not null,
    foreign key (utente) references Utente(username)
		on update cascade
        on delete cascade
);

CREATE TABLE Ordine (
	codiceOrdine char(10) primary key,
    dataOrdine date not null,
    dataArrivo date not null, /*La data di arrivo viene ricavata in base ai giorni della spedizione massima tra i prodotti scelti*/
    prezzoSpedizione decimal(4,2) not null, /*La spedizione costerà 0 se il prezzo totale è > 50 euro*/
    prezzoTotale decimal(9,2) not null, /*ESEMPIO PREZZO: XXXXXXX,YY ricavato dal totale dei prodotti acquistati*/
    codicePagamento char(16) not null,
    utente varchar(20) not null,
    foreign key (utente) references Utente(username)
		on update cascade
        on delete cascade
);

/*Riferimento è una tabella che collega l'ordine con i prodotti acquistati e viceversa*/
CREATE TABLE Riferimento (
	codice char(10), /*Codice dell'ordine*/
    prodotto char(10), /*Codice del prodotto*/
    foreign key (codice) references Ordine(codiceOrdine)
		on update cascade
        on delete cascade,
	foreign key (prodotto) references Prodotto(codiceProdotto)
		on update cascade
        on delete cascade,
	primary key(codice, prodotto)
);