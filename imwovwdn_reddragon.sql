-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: mysql.netsons.com:3306
-- Generato il: Giu 19, 2016 alle 23:32
-- Versione del server: 10.0.25-MariaDB
-- Versione PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `imwovwdn_reddragon`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `AFFILIAZIONE`
--

CREATE TABLE IF NOT EXISTS `AFFILIAZIONE` (
  `cod_affiliazione` int(4) NOT NULL,
  `data_af` date NOT NULL,
  `numero_affiliandi` int(15) NOT NULL,
  `luogo` varchar(20) NOT NULL,
  `animale_sacrificato` varchar(20) NOT NULL,
  `nome_mafioso_capo_incenso` varchar(20) DEFAULT NULL,
  `cod_triade` int(4) NOT NULL,
  PRIMARY KEY (`cod_affiliazione`),
  KEY `FKAFFIL_TRIADE` (`cod_triade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `AFFILIAZIONE`
--

INSERT INTO `AFFILIAZIONE` (`cod_affiliazione`, `data_af`, `numero_affiliandi`, `luogo`, `animale_sacrificato`, `nome_mafioso_capo_incenso`, `cod_triade`) VALUES
(8, '2001-05-12', 4, 'Guilin', 'Airone argentato', NULL, 405),
(42, '1990-11-11', 3, 'Velletri', 'Agnello', NULL, 267),
(144, '2002-02-15', 4, 'Youndan', 'Tigre della Malesia', NULL, 405),
(188, '2000-12-12', 3, 'ANCONA', 'tacchino', 'Sankuss', 405),
(322, '2000-09-20', 2, 'Madrid', 'capra', NULL, 436),
(323, '1940-04-07', 1, 'Viterbo', 'Serpente', NULL, 267),
(328, '1986-06-13', 1, 'Fori Imperiali', 'cinghiale', 'Bullyboy', 267),
(360, '2004-05-23', 2, 'Gallignano', 'Faina', 'Burny', 992),
(371, '1960-12-30', 1, 'Portonovo', 'Medusa', NULL, 992),
(457, '2008-04-12', 2, 'Fiumicino', 'Salamandra', 'Bullyboy', 267),
(502, '1999-12-31', 2, 'Plaza de toros', 'toro', NULL, 436),
(609, '2001-11-12', 4, 'roma', 'anatra', 'Sankuss', 405),
(689, '1999-04-13', 4, 'Capo di monte', 'pecora', NULL, 992),
(748, '2000-03-20', 8, 'Pechino', 'Tonno pinna rossa', NULL, 405),
(762, '1995-09-18', 2, 'Frosinone', 'Pulcino', 'Bullyboy', 267),
(802, '1980-06-30', 1, 'Barcellona', 'Elefante', NULL, 436),
(869, '2000-01-12', 5, 'Pechino', 'Gnu', NULL, 405),
(923, '1978-08-19', 1, 'Passetto', 'Cane', NULL, 992);

-- --------------------------------------------------------

--
-- Struttura della tabella `AZIONE_MILITARE`
--

CREATE TABLE IF NOT EXISTS `AZIONE_MILITARE` (
  `cod_azione_militare` int(4) NOT NULL,
  `data_am` date NOT NULL,
  `esito` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_azione_militare`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `AZIONE_MILITARE`
--

INSERT INTO `AZIONE_MILITARE` (`cod_azione_militare`, `data_am`, `esito`) VALUES
(110, '2008-02-11', 'successo'),
(794, '2010-07-12', 'successo');

-- --------------------------------------------------------

--
-- Struttura della tabella `AZIONE_MILITARE_TRIADE`
--

CREATE TABLE IF NOT EXISTS `AZIONE_MILITARE_TRIADE` (
  `cod_triade` int(4) NOT NULL,
  `cod_azione_militare` int(4) NOT NULL,
  `nome_mafioso_palo_rosso` varchar(20) DEFAULT NULL,
  `attaccante_difensore` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_triade`,`cod_azione_militare`),
  KEY `FKPALO_ROSSO_GESTISCE_AZMILALL` (`nome_mafioso_palo_rosso`),
  KEY `FKALL_AZI` (`cod_azione_militare`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `AZIONE_MILITARE_TRIADE`
--

INSERT INTO `AZIONE_MILITARE_TRIADE` (`cod_triade`, `cod_azione_militare`, `nome_mafioso_palo_rosso`, `attaccante_difensore`) VALUES
(267, 110, 'Stecca quadra', 'attaccante'),
(267, 794, 'Stecca quadra', 'attaccante'),
(405, 110, NULL, 'difensore'),
(405, 794, NULL, 'attaccante'),
(436, 794, 'Aristide', 'difensore'),
(992, 110, NULL, 'attaccante'),
(992, 794, NULL, 'attaccante');

-- --------------------------------------------------------

--
-- Struttura della tabella `BILANCIO`
--

CREATE TABLE IF NOT EXISTS `BILANCIO` (
  `entrate` int(15) NOT NULL,
  `uscite` int(15) NOT NULL,
  `anno` int(4) NOT NULL,
  `cod_triade` int(4) NOT NULL,
  `nome_mafioso_ventaglio_carta_bianco` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`anno`,`cod_triade`),
  KEY `FKBILANCIO_DI_TRIADE` (`cod_triade`),
  KEY `FKVENTA_BILANCIO` (`nome_mafioso_ventaglio_carta_bianco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `BILANCIO`
--

INSERT INTO `BILANCIO` (`entrate`, `uscite`, `anno`, `cod_triade`, `nome_mafioso_ventaglio_carta_bianco`) VALUES
(500, 800, 2014, 267, 'Specchio Rotto'),
(1000, 400, 2015, 267, 'Specchio Rotto'),
(500, 500, 2015, 436, NULL),
(700, 200, 2016, 267, 'Specchio Rotto'),
(400, 500, 2016, 405, NULL),
(900, 0, 2016, 436, 'Figaro');

-- --------------------------------------------------------

--
-- Struttura della tabella `CAPO_DRAGONE`
--

CREATE TABLE IF NOT EXISTS `CAPO_DRAGONE` (
  `nome_mafioso` varchar(20) NOT NULL,
  `cod_triade` int(4) NOT NULL,
  `codice_fiscale` varchar(16) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `cod_affiliazione` int(4) DEFAULT NULL,
  PRIMARY KEY (`nome_mafioso`),
  KEY `FKCAP_DRAG_ASSOCIAZIONE_TRIADE` (`cod_triade`),
  KEY `FKCAPO_DRAG_AFFILIAZIONE` (`cod_affiliazione`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `CAPO_DRAGONE`
--

INSERT INTO `CAPO_DRAGONE` (`nome_mafioso`, `cod_triade`, `codice_fiscale`, `data_di_nascita`, `nome`, `cognome`, `cod_affiliazione`) VALUES
('El toro', 436, 'egbetbeteg', '1979-04-13', 'Pablo', 'Fernandez', 502),
('Frankie Wolf', 267, 'frnkwlf23242r', '1970-11-11', 'Francesco', 'De Santis', 42),
('Robert Chol', 992, 'rgvwrgwg', '1940-11-11', 'Roberto', 'Cholesky', 371),
('Testardo', 405, 'TSSA32AS5DA6D82O', '1955-01-18', 'Youn', 'Ling', 869);

-- --------------------------------------------------------

--
-- Struttura della tabella `CORRUZIONE`
--

CREATE TABLE IF NOT EXISTS `CORRUZIONE` (
  `verso_chi` varchar(20) NOT NULL,
  `motivazione` varchar(20) NOT NULL,
  `importo` int(15) NOT NULL,
  `mese` int(2) NOT NULL,
  `anno` int(4) NOT NULL,
  `cod_triade` int(4) NOT NULL,
  `nome_mafioso_soldato` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`verso_chi`,`motivazione`,`mese`,`anno`,`cod_triade`),
  KEY `FKCORRUZ_USCITA` (`anno`,`cod_triade`),
  KEY `FKR_3` (`nome_mafioso_soldato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `CORRUZIONE`
--

INSERT INTO `CORRUZIONE` (`verso_chi`, `motivazione`, `importo`, `mese`, `anno`, `cod_triade`, `nome_mafioso_soldato`) VALUES
('Den Xiao Ping', 'Servigi per lavori p', 500, 3, 2014, 267, 'Romax'),
('Ditta lavori edili', 'spese di convincimen', 400, 3, 2015, 267, 'Romax');

-- --------------------------------------------------------

--
-- Struttura della tabella `INCARICATO`
--

CREATE TABLE IF NOT EXISTS `INCARICATO` (
  `nome_mafioso` varchar(20) NOT NULL,
  `ventaglio_di_carta_bianco_che_consiglia` varchar(20) DEFAULT 'NULL',
  `vanguardia_che_coadiuva` varchar(20) DEFAULT 'NULL',
  `vice_capo_montagna_che_controlla` varchar(20) DEFAULT 'NULL',
  `ruolo` varchar(40) NOT NULL,
  `codice_fiscale` varchar(16) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `cod_triade` int(4) NOT NULL,
  `nome_mafioso_capo_dragone` varchar(20) NOT NULL,
  `sandalo_di_paglia_che_collega` varchar(20) DEFAULT 'NULL',
  `cod_affiliazione` int(4) NOT NULL,
  PRIMARY KEY (`nome_mafioso`),
  KEY `FKINC_VENTAGLIO_CONSIGLIA` (`ventaglio_di_carta_bianco_che_consiglia`),
  KEY `FKINC_VANGUARDIA_COADIUVA` (`vanguardia_che_coadiuva`),
  KEY `FKINC_VICE_CONTROLLA` (`vice_capo_montagna_che_controlla`),
  KEY `FKINC_SANDALO_COLLEGA` (`sandalo_di_paglia_che_collega`),
  KEY `FKINC_ASSOCIAZIONE_TRIADE` (`cod_triade`),
  KEY `FKINCA_CONTROLLED_CAP_DRAG` (`nome_mafioso_capo_dragone`),
  KEY `FKINCARICATO_AFFILIAZIONE` (`cod_affiliazione`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `INCARICATO`
--

INSERT INTO `INCARICATO` (`nome_mafioso`, `ventaglio_di_carta_bianco_che_consiglia`, `vanguardia_che_coadiuva`, `vice_capo_montagna_che_controlla`, `ruolo`, `codice_fiscale`, `data_di_nascita`, `nome`, `cognome`, `cod_triade`, `nome_mafioso_capo_dragone`, `sandalo_di_paglia_che_collega`, `cod_affiliazione`) VALUES
('Aristide', NULL, NULL, NULL, 'palo_rosso', 'betetane', '1983-02-17', 'Juan', 'Gutierrez', 436, 'El toro', NULL, 322),
('Bullyboy', 'Specchio Rotto', 'Yhangze', 'Johnny Stecchini', 'capo_incenso', 'BLBYB4353', '1980-11-11', 'Marco', 'Viti', 267, 'Frankie Wolf', NULL, 42),
('Burny', NULL, 'Hughes', 'Molly', 'capo_incenso', 'eensenqhryn', '1985-10-25', 'Romano', 'Eschilo', 992, 'Robert Chol', NULL, 689),
('Figaro', NULL, NULL, NULL, 'ventaglio_di_carta_bianco', 'rynrmtmt', '1991-04-06', 'Pasqual', 'Monfort', 436, 'El toro', NULL, 322),
('Hughes', NULL, NULL, 'Molly', 'vanguardia', 'betebeebtet', '1990-04-23', 'Tiziano', 'Paolo', 992, 'Robert Chol', NULL, 689),
('Johnny Stecchini', 'Specchio Rotto', NULL, NULL, 'vice_capo_montagna', 'JHNFHH37737', '1980-08-11', 'Giovanni', 'Girolamo', 267, 'Frankie Wolf', NULL, 323),
('Molly', NULL, NULL, NULL, 'vice_capo_montagna', 'wrbwrbw', '1963-11-11', 'Aurelio', 'Frassino', 992, 'Robert Chol', NULL, 923),
('PiedeTonfo', NULL, NULL, NULL, 'sandalo_di_paglia', 'PTRFW2324G2', '1970-05-14', 'Mirco', 'Sora', 267, 'Frankie Wolf', NULL, 762),
('SkyCraper', NULL, NULL, NULL, 'sandalo_di_paglia', 'veebeobne', '1995-09-18', 'Patrizio', 'Josefi', 992, 'Robert Chol', NULL, 360),
('Spaccatores', NULL, NULL, 'Spacchiusino', 'vanguardia', 'FPIYZT38T44H131J', '1978-06-05', 'Fizzippo', 'Ynamura', 405, 'Testardo', NULL, 188),
('Spacchiusino', NULL, NULL, NULL, 'vice_capo_montagna', 'BSNHJH78C46F287B', '1985-09-09', 'Bonsak', 'Namahoto', 405, 'Testardo', NULL, 748),
('Specchio Rotto', NULL, NULL, NULL, 'ventaglio_di_carta_bianco', 'swgwggrw', '1967-07-16', 'Franco', 'Reti', 267, 'Frankie Wolf', 'PiedeTonfo', 762),
('Stecca quadra', NULL, NULL, NULL, 'palo_rosso', 'stdewrtwwf32', '1958-03-21', 'Paolo', 'Bersaglio', 267, 'Frankie Wolf', 'PiedeTonfo', 328),
('Yhangze', 'Specchio Rotto', NULL, 'Johnny Stecchini', 'vanguardia', 'lurheuu3883', '1960-02-23', 'Federico', 'Bruni', 267, 'Frankie Wolf', NULL, 42);

-- --------------------------------------------------------

--
-- Struttura della tabella `LANTERNA_BLU`
--

CREATE TABLE IF NOT EXISTS `LANTERNA_BLU` (
  `nome_mafioso` varchar(20) NOT NULL,
  `codice_fiscale` varchar(16) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `nome_mafioso_capo_dragone` varchar(20) DEFAULT 'NULL',
  `cod_triade` int(4) NOT NULL,
  PRIMARY KEY (`nome_mafioso`),
  KEY `FCAPDRAG_COMANDANTE` (`nome_mafioso_capo_dragone`),
  KEY `FKTRIADE_ASSOCIATA` (`cod_triade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `LANTERNA_BLU`
--

INSERT INTO `LANTERNA_BLU` (`nome_mafioso`, `codice_fiscale`, `data_di_nascita`, `nome`, `cognome`, `nome_mafioso_capo_dragone`, `cod_triade`) VALUES
('Caballo', 'EBET', '2000-02-23', 'Camilo', 'Fuegos', 'El toro', 436),
('el ingles', 'enrsyjrsym', '2002-02-12', 'Jonathan', 'Smith', 'El toro', 436),
('guerrero', 'fwrgetbetw', '1989-12-11', 'Eddy', 'Santos', 'El toro', 436),
('Jazzy boy', 'fjhwfhwfwf', '2001-08-12', 'Ugo', 'Bengo', 'Frankie Wolf', 267),
('Kiriku', 'CZZTFW46E12C542F', '1991-10-02', 'Cinzao', 'Zontfu', 'Testardo', 405),
('Piskello', 'CPIXRM56H70F187A', '1994-01-11', 'Cipaho', 'Ixing', 'Testardo', 405),
('Poler toy', 'fwrgwrwrbwr', '2002-01-11', 'Bruno', 'Aspa', 'Frankie Wolf', 267),
('Sandro', 'fwrwvrwadvw', '1980-07-11', 'Alessandro', 'Frolli', 'Testardo', 405);

-- --------------------------------------------------------

--
-- Struttura della tabella `PIZZO`
--

CREATE TABLE IF NOT EXISTS `PIZZO` (
  `importo` int(15) NOT NULL,
  `attivita_commerciale` varchar(20) NOT NULL,
  `nome_mafioso_lanterna_blu` varchar(20) DEFAULT NULL,
  `mese` int(2) NOT NULL,
  `anno` int(4) NOT NULL,
  `cod_triade` int(4) NOT NULL,
  PRIMARY KEY (`attivita_commerciale`,`mese`,`anno`),
  KEY `FKRISCOSSIONE_BY_LANTER` (`nome_mafioso_lanterna_blu`),
  KEY `FKPIZZO_SALDO_PIZZI_MENSILE` (`mese`,`anno`,`cod_triade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `PIZZO`
--

INSERT INTO `PIZZO` (`importo`, `attivita_commerciale`, `nome_mafioso_lanterna_blu`, `mese`, `anno`, `cod_triade`) VALUES
(100, 'Corrida de verano', 'el ingles', 6, 2016, 436),
(300, 'Edicola lotto', 'Jazzy boy', 11, 2016, 267),
(50, 'mostra van gogh', 'Jazzy boy', 2, 2014, 267),
(500, 'Paso de gibilterra', 'guerrero', 8, 2016, 436),
(150, 'pizzeria lo cascio', 'Poler toy', 2, 2014, 267);

-- --------------------------------------------------------

--
-- Struttura della tabella `PROSTITUTA`
--

CREATE TABLE IF NOT EXISTS `PROSTITUTA` (
  `nome_prostituta` varchar(20) NOT NULL,
  `nome_mafioso_soldato` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nome_prostituta`),
  KEY `FKSOLDATO_CHE_GUARDIA_PROSTIT` (`nome_mafioso_soldato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `PROSTITUTA`
--

INSERT INTO `PROSTITUTA` (`nome_prostituta`, `nome_mafioso_soldato`) VALUES
('Isadora', 'el fuego'),
('Fernanda', 'Re del Raket'),
('Elsa', 'Romax'),
('Jacoba', 'Romax'),
('Janna', 'Yango');

-- --------------------------------------------------------

--
-- Struttura della tabella `PROSTITUTA_PROSTITUZIONE`
--

CREATE TABLE IF NOT EXISTS `PROSTITUTA_PROSTITUZIONE` (
  `nome_prostituta` varchar(20) NOT NULL,
  `locazione` varchar(20) NOT NULL,
  `mese` int(2) NOT NULL,
  `anno` int(4) NOT NULL,
  `cod_triade` int(4) NOT NULL,
  PRIMARY KEY (`nome_prostituta`,`locazione`,`mese`,`anno`,`cod_triade`),
  KEY `FKPROSTITUT_PROSTITUZ_PROSTITUTA` (`nome_prostituta`),
  KEY `FKPROSTITUT_PROSTITUZ_PROSTITUZIONE` (`locazione`,`mese`,`anno`,`cod_triade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `PROSTITUTA_PROSTITUZIONE`
--

INSERT INTO `PROSTITUTA_PROSTITUZIONE` (`nome_prostituta`, `locazione`, `mese`, `anno`, `cod_triade`) VALUES
('Elsa', 'Tor bella monaca', 3, 2016, 267),
('Isadora', 'Suborgos de madrid', 2, 2016, 436);

-- --------------------------------------------------------

--
-- Struttura della tabella `PROSTITUZIONE`
--

CREATE TABLE IF NOT EXISTS `PROSTITUZIONE` (
  `locazione` varchar(20) NOT NULL,
  `mese` int(2) NOT NULL,
  `importo` int(15) NOT NULL,
  `anno` int(4) NOT NULL,
  `cod_triade` int(4) NOT NULL,
  PRIMARY KEY (`locazione`,`mese`,`anno`,`cod_triade`),
  KEY `FKPROSTITUZ_ENTRATA_BILA` (`anno`,`cod_triade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `PROSTITUZIONE`
--

INSERT INTO `PROSTITUZIONE` (`locazione`, `mese`, `importo`, `anno`, `cod_triade`) VALUES
('Suborgos de madrid', 2, 300, 2016, 436),
('Tor bella monaca', 3, 400, 2016, 267);

-- --------------------------------------------------------

--
-- Struttura della tabella `SALDO_PIZZI_MENSILE`
--

CREATE TABLE IF NOT EXISTS `SALDO_PIZZI_MENSILE` (
  `mese` int(2) NOT NULL,
  `importo` int(4) NOT NULL,
  `anno` int(4) NOT NULL,
  `cod_triade` int(4) NOT NULL,
  PRIMARY KEY (`mese`,`anno`,`cod_triade`),
  KEY `FKSAL_PIZ_MENS_ENTRATA` (`anno`,`cod_triade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `SALDO_PIZZI_MENSILE`
--

INSERT INTO `SALDO_PIZZI_MENSILE` (`mese`, `importo`, `anno`, `cod_triade`) VALUES
(2, 200, 2014, 267),
(6, 100, 2016, 436),
(8, 500, 2016, 436),
(11, 300, 2016, 267);

-- --------------------------------------------------------

--
-- Struttura della tabella `SOLDATO`
--

CREATE TABLE IF NOT EXISTS `SOLDATO` (
  `nome_mafioso` varchar(20) NOT NULL,
  `codice_fiscale` varchar(16) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `cod_triade` int(4) NOT NULL,
  `nome_mafioso_capo_dragone` varchar(20) DEFAULT NULL,
  `cod_affiliazione` int(4) DEFAULT NULL,
  PRIMARY KEY (`nome_mafioso`),
  KEY `FKSOLDA_ASS_TRIAD` (`cod_triade`),
  KEY `FKSOLDAT_COMAND_BY_CAPO_DRAG` (`nome_mafioso_capo_dragone`),
  KEY `FKSOLDATO_AFFILIAZIONE` (`cod_affiliazione`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `SOLDATO`
--

INSERT INTO `SOLDATO` (`nome_mafioso`, `codice_fiscale`, `data_di_nascita`, `nome`, `cognome`, `cod_triade`, `nome_mafioso_capo_dragone`, `cod_affiliazione`) VALUES
('Angel de sangue', 'betenetn', '1976-06-05', 'Angel', 'Mariano', 436, 'El toro', 502),
('el fuego', 'ernrsyrsm', '1975-04-23', 'Adrian', 'Santos', 436, 'El toro', 802),
('Lo spagnolo', 'FTHJZM52M51Z503U', '1990-09-05', 'Faltulio', 'Horente', 405, 'Testardo', 144),
('Noyz', 'BSCMDR97S30F644G', '1983-02-13', 'Bisconk', 'Cimmuri', 405, 'Testardo', 869),
('Pengo', 'betbetb', '1992-04-21', 'Pan', 'Solo', 992, 'Robert Chol', 689),
('Re del Raket', 'GGVVPB56L14B894X', '1981-05-30', 'Girgan', 'Vipep', 405, 'Testardo', 748),
('Ripperinho', 'SFHJKF35T13I943U', '1992-11-13', 'Sinfu', 'Hijanke', 405, 'Testardo', 748),
('Romax', 'wwrwrwr', '2000-05-14', 'Pietro', 'Argento', 267, 'Frankie Wolf', 457),
('Romitos', 'rgethethe', '2000-12-13', 'Alcamo', 'Giroslo', 267, 'Frankie Wolf', 457),
('Sancho', 'rwbetbebt', '1992-03-30', 'Fen', 'Ha', 992, 'Robert Chol', 689),
('Yango', 'rhwhetjej', '1999-02-21', 'Den', 'Xiao', 992, 'Robert Chol', 360);

-- --------------------------------------------------------

--
-- Struttura della tabella `SOLDATO_AZIONE_MILITARE`
--

CREATE TABLE IF NOT EXISTS `SOLDATO_AZIONE_MILITARE` (
  `nome_mafioso_soldato` varchar(20) NOT NULL,
  `cod_azione_militare` int(4) NOT NULL,
  PRIMARY KEY (`nome_mafioso_soldato`,`cod_azione_militare`),
  KEY `FKSOL_COMBATTE_PIU_AZION` (`cod_azione_militare`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `SOLDATO_AZIONE_MILITARE`
--

INSERT INTO `SOLDATO_AZIONE_MILITARE` (`nome_mafioso_soldato`, `cod_azione_militare`) VALUES
('el fuego', 794),
('Noyz', 110),
('Noyz', 794),
('Pengo', 110),
('Pengo', 794),
('Re del Raket', 110),
('Re del Raket', 794),
('Ripperinho', 110),
('Romax', 110),
('Romax', 794),
('Romitos', 110),
('Romitos', 794),
('Sancho', 794),
('Yango', 110);

-- --------------------------------------------------------

--
-- Struttura della tabella `SPACCIO`
--

CREATE TABLE IF NOT EXISTS `SPACCIO` (
  `locazione` varchar(20) NOT NULL,
  `mese` int(2) NOT NULL,
  `tipo_droga` varchar(20) NOT NULL,
  `importo` int(15) NOT NULL,
  `anno` int(4) NOT NULL,
  `cod_triade` int(4) NOT NULL,
  `nome_mafioso_soldato` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`locazione`,`mese`,`tipo_droga`,`anno`,`cod_triade`),
  KEY `FKSPACC_ENTRATA` (`anno`,`cod_triade`),
  KEY `FKR_2` (`nome_mafioso_soldato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `SPACCIO`
--

INSERT INTO `SPACCIO` (`locazione`, `mese`, `tipo_droga`, `importo`, `anno`, `cod_triade`, `nome_mafioso_soldato`) VALUES
('Ciampino', 7, 'krokodil', 300, 2014, 267, 'Romax'),
('Sevilla', 3, 'marijuana', 500, 2015, 436, 'el fuego'),
('Shangai', 5, 'lsd', 400, 2016, 405, 'Ripperinho'),
('Tuscolana', 9, 'Popper', 600, 2015, 267, 'Romax');

-- --------------------------------------------------------

--
-- Struttura della tabella `TRAFFICO_ILLEGALE`
--

CREATE TABLE IF NOT EXISTS `TRAFFICO_ILLEGALE` (
  `tipo_merce` varchar(20) NOT NULL,
  `importo` int(15) NOT NULL,
  `quantita` int(15) NOT NULL,
  `tipo_vendita_acquisto` varchar(20) NOT NULL,
  `compratore_venditore` varchar(20) NOT NULL,
  `mese` int(2) NOT NULL,
  `anno` int(4) NOT NULL,
  `cod_triade` int(4) NOT NULL,
  `nome_mafioso_soldato` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tipo_merce`,`tipo_vendita_acquisto`,`compratore_venditore`,`mese`,`anno`,`cod_triade`),
  KEY `FKENTRATA` (`anno`,`cod_triade`),
  KEY `FKSOLDAT_TRAFF_ILL` (`nome_mafioso_soldato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `TRAFFICO_ILLEGALE`
--

INSERT INTO `TRAFFICO_ILLEGALE` (`tipo_merce`, `importo`, `quantita`, `tipo_vendita_acquisto`, `compratore_venditore`, `mese`, `anno`, `cod_triade`, `nome_mafioso_soldato`) VALUES
('Animali', 300, 4, 'acquisto', 'White house', 6, 2014, 267, 'Romitos'),
('esseri umani', 500, 5, 'acquisto', 'Stato francese', 8, 2015, 436, 'el fuego'),
('fuochi_artificiali', 500, 5, 'acquisto', 'Partito comunista', 2, 2016, 405, 'Re del Raket'),
('Sigarette', 400, 7, 'vendita', 'Comune di Roma', 4, 2015, 267, 'Romitos');

-- --------------------------------------------------------

--
-- Struttura della tabella `TRIADE`
--

CREATE TABLE IF NOT EXISTS `TRIADE` (
  `citta` varchar(20) NOT NULL,
  `cod_triade` int(4) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `data_fondazione` date NOT NULL,
  `numero_affiliati` int(15) NOT NULL,
  PRIMARY KEY (`cod_triade`),
  UNIQUE KEY `nome_2` (`nome`),
  KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `TRIADE`
--

INSERT INTO `TRIADE` (`citta`, `cod_triade`, `nome`, `data_fondazione`, `numero_affiliati`) VALUES
('Roma', 267, 'Lupo Nero', '1970-11-11', 9),
('Pechino', 405, 'Teste rotte', '2000-01-02', 8),
('Granada', 436, 'Paellas Calientes', '1960-07-21', 5),
('Ancona', 992, 'Taglia Gole', '1900-11-11', 8);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `AFFILIAZIONE`
--
ALTER TABLE `AFFILIAZIONE`
  ADD CONSTRAINT `FKAFFIL_TRIADE` FOREIGN KEY (`cod_triade`) REFERENCES `TRIADE` (`cod_triade`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `AZIONE_MILITARE_TRIADE`
--
ALTER TABLE `AZIONE_MILITARE_TRIADE`
  ADD CONSTRAINT `FKALL_AZI` FOREIGN KEY (`cod_azione_militare`) REFERENCES `AZIONE_MILITARE` (`cod_azione_militare`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKALL_TRI` FOREIGN KEY (`cod_triade`) REFERENCES `TRIADE` (`cod_triade`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKPALO_ROSSO_GESTISCE_AZMILALL` FOREIGN KEY (`nome_mafioso_palo_rosso`) REFERENCES `INCARICATO` (`nome_mafioso`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `BILANCIO`
--
ALTER TABLE `BILANCIO`
  ADD CONSTRAINT `FKBILANCIO_DI_TRIADE` FOREIGN KEY (`cod_triade`) REFERENCES `TRIADE` (`cod_triade`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKVENTA_BILANCIO` FOREIGN KEY (`nome_mafioso_ventaglio_carta_bianco`) REFERENCES `INCARICATO` (`nome_mafioso`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `CAPO_DRAGONE`
--
ALTER TABLE `CAPO_DRAGONE`
  ADD CONSTRAINT `FKCAPO_DRAG_AFFILIAZIONE` FOREIGN KEY (`cod_affiliazione`) REFERENCES `AFFILIAZIONE` (`cod_affiliazione`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FKCAP_DRAG_ASSOCIAZIONE_TRIADE` FOREIGN KEY (`cod_triade`) REFERENCES `TRIADE` (`cod_triade`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `CORRUZIONE`
--
ALTER TABLE `CORRUZIONE`
  ADD CONSTRAINT `FKCORRUZ_USCITA` FOREIGN KEY (`anno`, `cod_triade`) REFERENCES `BILANCIO` (`anno`, `cod_triade`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKR_3` FOREIGN KEY (`nome_mafioso_soldato`) REFERENCES `SOLDATO` (`nome_mafioso`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `INCARICATO`
--
ALTER TABLE `INCARICATO`
  ADD CONSTRAINT `FKINCARICATO_AFFILIAZIONE` FOREIGN KEY (`cod_affiliazione`) REFERENCES `AFFILIAZIONE` (`cod_affiliazione`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKINCA_CONTROLLED_CAP_DRAG` FOREIGN KEY (`nome_mafioso_capo_dragone`) REFERENCES `CAPO_DRAGONE` (`nome_mafioso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKINC_ASSOCIAZIONE_TRIADE` FOREIGN KEY (`cod_triade`) REFERENCES `TRIADE` (`cod_triade`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKINC_SANDALO_COLLEGA` FOREIGN KEY (`sandalo_di_paglia_che_collega`) REFERENCES `INCARICATO` (`nome_mafioso`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FKINC_VANGUARDIA_COADIUVA` FOREIGN KEY (`vanguardia_che_coadiuva`) REFERENCES `INCARICATO` (`nome_mafioso`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FKINC_VENTAGLIO_CONSIGLIA` FOREIGN KEY (`ventaglio_di_carta_bianco_che_consiglia`) REFERENCES `INCARICATO` (`nome_mafioso`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FKINC_VICE_CONTROLLA` FOREIGN KEY (`vice_capo_montagna_che_controlla`) REFERENCES `INCARICATO` (`nome_mafioso`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `LANTERNA_BLU`
--
ALTER TABLE `LANTERNA_BLU`
  ADD CONSTRAINT `FCAPDRAG_COMANDANTE` FOREIGN KEY (`nome_mafioso_capo_dragone`) REFERENCES `CAPO_DRAGONE` (`nome_mafioso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKTRIADE_ASSOCIATA` FOREIGN KEY (`cod_triade`) REFERENCES `TRIADE` (`cod_triade`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `PIZZO`
--
ALTER TABLE `PIZZO`
  ADD CONSTRAINT `FKPIZZO_SALDO_PIZZI_MENSILE` FOREIGN KEY (`mese`, `anno`, `cod_triade`) REFERENCES `SALDO_PIZZI_MENSILE` (`mese`, `anno`, `cod_triade`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKRISCOSSIONE_BY_LANTER` FOREIGN KEY (`nome_mafioso_lanterna_blu`) REFERENCES `LANTERNA_BLU` (`nome_mafioso`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `PROSTITUTA`
--
ALTER TABLE `PROSTITUTA`
  ADD CONSTRAINT `FKSOLDATO_CHE_GUARDIA_PROSTIT` FOREIGN KEY (`nome_mafioso_soldato`) REFERENCES `SOLDATO` (`nome_mafioso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `PROSTITUTA_PROSTITUZIONE`
--
ALTER TABLE `PROSTITUTA_PROSTITUZIONE`
  ADD CONSTRAINT `FKPROSTITUT_PROSTITUZ_PROSTITUTA` FOREIGN KEY (`nome_prostituta`) REFERENCES `PROSTITUTA` (`nome_prostituta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKPROSTITUT_PROSTITUZ_PROSTITUZIONE` FOREIGN KEY (`locazione`, `mese`, `anno`, `cod_triade`) REFERENCES `PROSTITUZIONE` (`locazione`, `mese`, `anno`, `cod_triade`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `PROSTITUZIONE`
--
ALTER TABLE `PROSTITUZIONE`
  ADD CONSTRAINT `FKPROSTITUZ_ENTRATA_BILA` FOREIGN KEY (`anno`, `cod_triade`) REFERENCES `BILANCIO` (`anno`, `cod_triade`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `SALDO_PIZZI_MENSILE`
--
ALTER TABLE `SALDO_PIZZI_MENSILE`
  ADD CONSTRAINT `FKSAL_PIZ_MENS_ENTRATA` FOREIGN KEY (`anno`, `cod_triade`) REFERENCES `BILANCIO` (`anno`, `cod_triade`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `SOLDATO`
--
ALTER TABLE `SOLDATO`
  ADD CONSTRAINT `FKSOLDATO_AFFILIAZIONE` FOREIGN KEY (`cod_affiliazione`) REFERENCES `AFFILIAZIONE` (`cod_affiliazione`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FKSOLDAT_COMAND_BY_CAPO_DRAG` FOREIGN KEY (`nome_mafioso_capo_dragone`) REFERENCES `CAPO_DRAGONE` (`nome_mafioso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKSOLDA_ASS_TRIAD` FOREIGN KEY (`cod_triade`) REFERENCES `TRIADE` (`cod_triade`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `SOLDATO_AZIONE_MILITARE`
--
ALTER TABLE `SOLDATO_AZIONE_MILITARE`
  ADD CONSTRAINT `FKSOL_COMBATTE_PIU_AZION` FOREIGN KEY (`cod_azione_militare`) REFERENCES `AZIONE_MILITARE` (`cod_azione_militare`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKSOL_PARTE_DI_AZIONE_MIL` FOREIGN KEY (`nome_mafioso_soldato`) REFERENCES `SOLDATO` (`nome_mafioso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `SPACCIO`
--
ALTER TABLE `SPACCIO`
  ADD CONSTRAINT `FKR_2` FOREIGN KEY (`nome_mafioso_soldato`) REFERENCES `SOLDATO` (`nome_mafioso`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FKSPACC_ENTRATA` FOREIGN KEY (`anno`, `cod_triade`) REFERENCES `BILANCIO` (`anno`, `cod_triade`) ON DELETE CASCADE;

--
-- Limiti per la tabella `TRAFFICO_ILLEGALE`
--
ALTER TABLE `TRAFFICO_ILLEGALE`
  ADD CONSTRAINT `FKENTRATA` FOREIGN KEY (`anno`, `cod_triade`) REFERENCES `BILANCIO` (`anno`, `cod_triade`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKSOLDAT_TRAFF_ILL` FOREIGN KEY (`nome_mafioso_soldato`) REFERENCES `SOLDATO` (`nome_mafioso`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
