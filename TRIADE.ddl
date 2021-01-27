-- *********************************************
-- * SQL MySQL generation                      
-- *--------------------------------------------
-- * DB-MAIN version: 9.3.0              
-- * Generator date: Feb 16 2016              
-- * Generation date: Mon May 30 16:00:48 2016 
-- * LUN file: C:\Users\feroc\reddragonrepo\schema-er.lun 
-- * Schema: triade_log/1-1 
-- ********************************************* 


-- Database Section
-- ________________ 

create database triade_log;
use triade_log;


-- Tables Section
-- _____________ 

create table AFFILIAZIONE (
     cod_affiliazione int(4) not null,
     data_af date not null,
     numero_affiliandi int(15) not null,
     luogo varchar(20) not null,
     animale_sacrificato varchar(20) not null,
     nome_mafioso_capo_incenso varchar(20) default 'NULL',
     cod_triade int(4) not null,
     constraint IDAFFILIAZIONE_ID primary key (cod_affiliazione));

create table AZIONE_MILITARE (
     tipo varchar(20) not null,
     cod_azione_militare int(4) not null,
     data_am date not null,
     esito varchar(20) not null,
     nome_mafioso_palo_rosso varchar(20) default 'NULL',
     constraint IDAZIONE_MILITARE_ID primary key (cod_azione_militare));

create table AZIONE_MILITARE_ALLEATO_TRIADE (
     cod_triade int(4) not null,
     cod_azione_militare int(4) not null,
     constraint IDAZIONE_MILITARE_ALLEATO_TRIADE primary key (cod_triade, cod_azione_militare));

create table AZIONE_MILITARE_NEMICO_TRIADE (
     cod_triade int(4) not null,
     cod_azione_militare int(4) not null,
     constraint IDAZIONE_MILITARE_NEMICO_TRIADE primary key (cod_triade, cod_azione_militare));

create table BILANCIO (
     entrate int(15) not null,
     uscite int(15) not null,
     anno int(4) not null,
     cod_triade int(4) not null,
     nome_mafioso_ventaglio_carta_bianco varchar(20) not null,
     constraint IDBILANCIO_ID primary key (anno, cod_triade));

create table CAPO_DRAGONE (
     nome_mafioso varchar(20) not null,
     cod_triade int(4) not null,
     codice_fiscale varchar(16) not null,
     data_di_nascita date not null,
     nome varchar(20) not null,
     cognome varchar(20) not null,
     cod_affiliazione int(4) not null,
     constraint IDCAPO_DRAGONE_ID primary key (nome_mafioso));

create table CORRUZIONE (
     verso_chi varchar(20) not null,
     motivazione varchar(20) not null,
     importo int(15) not null,
     mese int(2) not null,
     anno int(4) not null,
     cod_triade int(4) not null,
     nome_mafioso_soldato varchar(20) not null,
     constraint IDCORRUZIONE primary key (verso_chi, motivazione, mese, anno, cod_triade));

create table INCARICATO (
     nome_mafioso varchar(20) not null,
     ventaglio_di_carta_bianco_che_consiglia varchar(20) default 'NULL',
     vanguardia_che_coaudiuva varchar(20) default 'NULL',
     vice_capo_montagna_che_controlla varchar(20) default 'NULL',
     ruolo varchar(20) not null,
     codice_fiscale varchar(16) not null,
     data_di_nascita date not null,
     nome varchar(20) not null,
     cognome varchar(20) not null,
     cod_triade int(4) not null,
     nome_mafioso_capo_dragone varchar(20) not null,
     palo_rosso_che_collega varchar(20) default 'NULL',
     cod_affiliazione int(4) not null,
     constraint IDINCARICATO primary key (nome_mafioso));

create table LANTERNA_BLU (
     nome_mafioso varchar(20) not null,
     codice_fiscale varchar(16) not null,
     data_di_nascita date not null,
     nome varchar(20) not null,
     cognome varchar(20) not null,
     nome_mafioso_capo_dragone varchar(20) default 'NULL',
     cod_triade int(4) not null,
     constraint IDLANTERNA primary key (nome_mafioso));

create table PIZZO (
     importo int(15) not null,
     attivita_commerciale varchar(20) not null,
     nome_mafioso_lanterna_blu varchar(20) not null,
     constraint IDPIZZO_ID primary key (importo, attivita_commerciale));

create table PIZZO_SALDO_PIZZI_MENSILE (
     importo int(15) not null,
     attivita_commerciale varchar(20) not null,
     mese int(2) not null,
     constraint IDPIZZO_SALDO_PIZZI_MENSILE primary key (importo, attivita_commerciale, mese));

create table PROSTITUTA (
     nome_prostituta varchar(20) not null,
     locazione varchar(20) not null,
     mese int(2) not null,
     nome_mafioso_soldato varchar(20) not null,
     constraint IDPROSTITUTA primary key (nome_prostituta));

create table PROSTITUZIONE (
     locazione varchar(20) not null,
     mese int(2) not null,
     importo int(15) not null,
     anno int(4) not null,
     cod_triade int(4) not null,
     constraint IDPROSTITUZIONE primary key (locazione, mese, anno, cod_triade));

create table SALDO_PIZZI_MENSILE (
     mese int(2) not null,
     importo int(4) not null,
     anno int(4) not null,
     cod_triade int(4) not null,
     constraint IDSALDO_PIZZI_MENSILE primary key (mese, anno, cod_triade));

create table SOLDATO  (
     nome_mafioso varchar(20) not null,
     codice_fiscale varchar(16) not null,
     data_di_nascita date not null,
     nome varchar(20) not null,
     cognome varchar(20) not null,
     cod_triade int(4) not null,
     nome_mafioso_capo_dragone varchar(20),
     cod_affiliazione int(4) not null,
     constraint IDSOLDATO  primary key (nome_mafioso));

create table SOLDATO_AZIONE_MILITARE (
     nome_mafioso_soldato varchar(20) not null,
     cod_azione_militare int(4) not null,
     constraint IDSOLDATO_AZIONE_MILITARE primary key (nome_mafioso_soldato, cod_azione_militare));

create table SPACCIO (
     locazione varchar(20) not null,
     mese int(2) not null,
     tipo_droga varchar(20) not null,
     importo int(15) not null,
     anno int(4) not null,
     cod_triade int(4) not null,
     nome_mafioso_soldato varchar(20) not null,
     constraint IDSPACCIO primary key (locazione, mese, tipo_droga, anno, cod_triade));

create table TRAFFICO_ILLEGALE (
     tipo_merce varchar(20) not null,
     importo int(15) not null,
     quantita int(15) not null,
     tipo_vendita_acquisto varchar(20) not null,
     compratore_venditore varchar(20) not null,
     mese int(2) not null,
     anno int(4) not null,
     cod_triade int(4) not null,
     nome_mafioso_soldato varchar(20) not null,
     constraint IDTRAFFICO_ILLEGALE primary key (tipo_merce, tipo_vendita_acquisto, compratore_venditore, mese, anno, cod_triade));

create table TRIADE (
     citta varchar(20) not null,
     cod_triade int(4) not null,
     nome varchar(20) not null,
     data_fondazione date not null,
     numero_affiliati int(15) not null,
     constraint IDTRIADE_ID primary key (cod_triade));


-- Constraints Section
-- ___________________ 

-- Not implemented
-- alter table AFFILIAZIONE add constraint IDAFFILIAZIONE_CHK
--     check(exists(select * from SOLDATO 
--                  where SOLDATO .cod_affiliazione = cod_affiliazione)); 

-- Not implemented
-- alter table AFFILIAZIONE add constraint IDAFFILIAZIONE_CHK
--     check(exists(select * from CAPO_DRAGONE
--                  where CAPO_DRAGONE.cod_affiliazione = cod_affiliazione)); 

-- Not implemented
-- alter table AFFILIAZIONE add constraint IDAFFILIAZIONE_CHK
--     check(exists(select * from INCARICATO
--                  where INCARICATO.cod_affiliazione = cod_affiliazione)); 

alter table AFFILIAZIONE add constraint FKAFFIL_TRIADE
     foreign key (cod_triade)
     references TRIADE (cod_triade);

-- Not implemented
-- alter table AZIONE_MILITARE add constraint IDAZIONE_MILITARE_CHK
--     check(exists(select * from SOLDATO_AZIONE_MILITARE
--                  where SOLDATO_AZIONE_MILITARE.cod_azione_militare = cod_azione_militare)); 

-- Not implemented
-- alter table AZIONE_MILITARE add constraint IDAZIONE_MILITARE_CHK
--     check(exists(select * from AZIONE_MILITARE_NEMICO_TRIADE
--                  where AZIONE_MILITARE_NEMICO_TRIADE.cod_azione_militare = cod_azione_militare)); 

alter table AZIONE_MILITARE add constraint FKPALO_ROSSO_GESTISCE_AZMIL
     foreign key (nome_mafioso_palo_rosso)
     references INCARICATO (nome_mafioso);

alter table AZIONE_MILITARE_ALLEATO_TRIADE add constraint FKALL_AZI
     foreign key (cod_azione_militare)
     references AZIONE_MILITARE (cod_azione_militare);

alter table AZIONE_MILITARE_ALLEATO_TRIADE add constraint FKALL_TRI
     foreign key (cod_triade)
     references TRIADE (cod_triade);

alter table AZIONE_MILITARE_NEMICO_TRIADE add constraint FKNEM_AZI
     foreign key (cod_azione_militare)
     references AZIONE_MILITARE (cod_azione_militare);

alter table AZIONE_MILITARE_NEMICO_TRIADE add constraint FKNEM_TRI
     foreign key (cod_triade)
     references TRIADE (cod_triade);

alter table BILANCIO add constraint FKGESTIONE_BY_VENTA
     foreign key (nome_mafioso_ventaglio_carta_bianco)
     references INCARICATO (nome_mafioso);

alter table BILANCIO add constraint FKBILANCIO_DI_TRIADE
     foreign key (cod_triade)
     references TRIADE (cod_triade);

-- Not implemented
-- alter table BILANCIO add constraint IDBILANCIO_CHK
--     check(exists(select * from PROSTITUZIONE
--                  where PROSTITUZIONE.anno = anno and PROSTITUZIONE.cod_triade = cod_triade)); 

-- Not implemented
-- alter table BILANCIO add constraint IDBILANCIO_CHK
--     check(exists(select * from CORRUZIONE
--                  where CORRUZIONE.anno = anno and CORRUZIONE.cod_triade = cod_triade)); 

-- Not implemented
-- alter table BILANCIO add constraint IDBILANCIO_CHK
--     check(exists(select * from SPACCIO
--                  where SPACCIO.anno = anno and SPACCIO.cod_triade = cod_triade)); 

-- Not implemented
-- alter table BILANCIO add constraint IDBILANCIO_CHK
--     check(exists(select * from TRAFFICO_ILLEGALE
--                  where TRAFFICO_ILLEGALE.anno = anno and TRAFFICO_ILLEGALE.cod_triade = cod_triade)); 

-- Not implemented
-- alter table BILANCIO add constraint IDBILANCIO_CHK
--     check(exists(select * from SALDO_PIZZI_MENSILE
--                  where SALDO_PIZZI_MENSILE.anno = anno and SALDO_PIZZI_MENSILE.cod_triade = cod_triade)); 

-- Not implemented
-- alter table CAPO_DRAGONE add constraint IDCAPO_DRAGONE_CHK
--     check(exists(select * from INCARICATO
--                  where INCARICATO.nome_mafioso_capo_dragone = nome_mafioso)); 

alter table CAPO_DRAGONE add constraint FKCAP_DRAG_ASSOCIAZIONE_TRIADE
     foreign key (cod_triade)
     references TRIADE (cod_triade);

alter table CAPO_DRAGONE add constraint FKCAPO_DRAG_AFFILIAZIONE
     foreign key (cod_affiliazione)
     references AFFILIAZIONE (cod_affiliazione);

alter table CORRUZIONE add constraint FKCORRUZ_USCITA
     foreign key (anno, cod_triade)
     references BILANCIO (anno, cod_triade);

alter table CORRUZIONE add constraint FKR_3
     foreign key (nome_mafioso_soldato)
     references SOLDATO  (nome_mafioso);

alter table INCARICATO add constraint FKINC_ASSOCIAZIONE_TRIADE
     foreign key (cod_triade)
     references TRIADE (cod_triade);

alter table INCARICATO add constraint FKINCA_CONTROLLED_CAP_DRAG
     foreign key (nome_mafioso_capo_dragone)
     references CAPO_DRAGONE (nome_mafioso);

alter table INCARICATO add constraint FKINCARICATO_AFFILIAZIONE
     foreign key (cod_affiliazione)
     references AFFILIAZIONE (cod_affiliazione);

alter table LANTERNA_BLU add constraint FCAPDRAG_COMANDANTE
     foreign key (nome_mafioso_capo_dragone)
     references CAPO_DRAGONE (nome_mafioso);

alter table LANTERNA_BLU add constraint FKTRIADE_ASSOCIATA
     foreign key (cod_triade)
     references TRIADE (cod_triade);

-- Not implemented
-- alter table PIZZO add constraint IDPIZZO_CHK
--     check(exists(select * from PIZZO_SALDO_PIZZI_MENSILE
--                  where PIZZO_SALDO_PIZZI_MENSILE.importo = importo and PIZZO_SALDO_PIZZI_MENSILE.attivita_commerciale = attivita_commerciale)); 

alter table PIZZO add constraint FKRISCOSSIONE_BY_LANTER
     foreign key (nome_mafioso_lanterna_blu)
     references LANTERNA_BLU (nome_mafioso);

alter table PIZZO_SALDO_PIZZI_MENSILE add constraint FKCOM_PIZ
     foreign key (importo, attivita_commerciale)
     references PIZZO (importo, attivita_commerciale);

alter table PROSTITUTA add constraint FKSOLDATO_CHE_GUARDIA_PROSTIT
     foreign key (nome_mafioso_soldato)
     references SOLDATO  (nome_mafioso);

alter table PROSTITUZIONE add constraint FKPROSTITUZ_ENTRATA_BILA
     foreign key (anno, cod_triade)
     references BILANCIO (anno, cod_triade);

alter table SALDO_PIZZI_MENSILE add constraint FKSAL_PIZ_MENS_ENTRATA  
     foreign key (anno, cod_triade)
     references BILANCIO (anno, cod_triade);

alter table SOLDATO  add constraint FKSOLDA_ASS_TRIAD
     foreign key (cod_triade)
     references TRIADE (cod_triade);

alter table SOLDATO  add constraint FKSOLDAT_COMAND_BY_CAPO_DRAG
     foreign key (nome_mafioso_capo_dragone)
     references CAPO_DRAGONE (nome_mafioso);

alter table SOLDATO  add constraint FKSOLDATO_AFFILIAZIONE
     foreign key (cod_affiliazione)
     references AFFILIAZIONE (cod_affiliazione);

alter table SOLDATO_AZIONE_MILITARE add constraint FKSOL_PARTE_DI_AZIONE_MIL
     foreign key (nome_mafioso_soldato)
     references SOLDATO  (nome_mafioso);

alter table SOLDATO_AZIONE_MILITARE add constraint FKSOL_COMBATTE_PIU_AZION
     foreign key (cod_azione_militare)
     references AZIONE_MILITARE (cod_azione_militare);

alter table SPACCIO add constraint FKSPACC_ENTRATA 
     foreign key (anno, cod_triade)
     references BILANCIO (anno, cod_triade);

alter table SPACCIO add constraint FKR_2
     foreign key (nome_mafioso_soldato)
     references SOLDATO  (nome_mafioso);

alter table TRAFFICO_ILLEGALE add constraint FKENTRATA
     foreign key (anno, cod_triade)
     references BILANCIO (anno, cod_triade);

alter table TRAFFICO_ILLEGALE add constraint FKSOLDAT_TRAFF_ILL
     foreign key (nome_mafioso_soldato)
     references SOLDATO  (nome_mafioso);

-- Not implemented
-- alter table TRIADE add constraint IDTRIADE_CHK
--     check(exists(select * from INCARICATO
--                  where INCARICATO.cod_triade = cod_triade)); 

-- Not implemented
-- alter table TRIADE add constraint IDTRIADE_CHK
--     check(exists(select * from BILANCIO
--                  where BILANCIO.cod_triade = cod_triade)); 

-- Not implemented
-- alter table TRIADE add constraint IDTRIADE_CHK
--     check(exists(select * from CAPO_DRAGONE
--                  where CAPO_DRAGONE.cod_triade = cod_triade)); 


-- Index Section
-- _____________ 

