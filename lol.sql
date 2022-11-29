-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 15. Apr 2019 um 10:58
-- Server-Version: 5.6.43
-- PHP-Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `sajtigpsve`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admin`
--

CREATE TABLE `admin` (
  `adminid` int(10) UNSIGNED NOT NULL,
  `username` text NOT NULL,
  `pinadmin` text CHARACTER SET utf8 NOT NULL,
  `password` text NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `email` text NOT NULL,
  `notes` text NOT NULL,
  `status` text NOT NULL,
  `lastlogin` text NOT NULL,
  `lastip` text NOT NULL,
  `lasthost` text NOT NULL,
  `access` text NOT NULL,
  `chaton` int(11) NOT NULL DEFAULT '1',
  `reminderon` int(11) NOT NULL DEFAULT '1',
  `signature` text NOT NULL,
  `lastactivity` int(11) NOT NULL,
  `lastpage` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `admin`
--

INSERT INTO `admin` (`adminid`, `username`, `pinadmin`, `password`, `firstname`, `lastname`, `email`, `notes`, `status`, `lastlogin`, `lastip`, `lasthost`, `access`, `chaton`, `reminderon`, `signature`, `lastactivity`, `lastpage`) VALUES
(1, 'root', '15111996', 'e5683c3beedaccd9a1dd3a179cbcdd8e7c214684', 'Tomislav', 'Zivkovic', 'tomislav1996@gmail.com', '', 'Active', '15.04.2019. 10:50', '62.216.206.58', 'ppp-62-216-206-58.dynamic.mnet-online.de', 'Super', 1, 1, '', 1555318228, './?page=client_info&id=3'),
(2, 'Djomla', '24319', 'cc1cabf83be36b483b0bfa22d61f3fb26ec2e0f1', 'Djomla', 'Veljkovic', 'djomla.veljkovic@gmail.com', '', 'Active', '24.03.2019. 21:01', '178.20.206.8', '178.20.206.8', 'Super', 1, 1, '', 1553458185, './?page=client_info&id=3');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admin_activity`
--

CREATE TABLE `admin_activity` (
  `activityid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `page` varchar(32) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `admin_activity`
--

INSERT INTO `admin_activity` (`activityid`, `adminid`, `page`, `time`) VALUES
(1517, 1, 'page=ticket&id=688', 1552652454),
(1518, 1, 'page=ticket&id=689', 1552659210),
(1519, 3, 'page=ticket&id=2', 1552779759),
(1520, 3, 'page=ticket&id=3', 1552779790),
(1521, 1, 'page=ticket&id=3', 1552780706),
(1522, 1, 'page=ticket&id=2', 1552780722),
(1523, 1, 'page=ticket&id=1', 1552780746),
(1524, 1, 'page=ticket&id=4', 1552849868),
(1525, 1, 'page=ticket&id=6', 1553989655),
(1526, 1, 'page=ticket&id=7', 1553199369),
(1527, 1, 'page=ticket&id=8', 1553967419),
(1528, 1, 'page=ticket&id=11', 1553988534),
(1529, 1, 'page=ticket&id=9', 1553989644),
(1530, 1, 'page=ticket&id=12', 1553989084),
(1531, 1, 'page=ticket&id=13', 1553989604),
(1532, 1, 'page=ticket&id=5', 1553989669),
(1533, 1, 'page=ticket&id=17', 1553990112),
(1534, 1, 'page=ticket&id=37', 1553996021),
(1535, 1, 'page=ticket&id=39', 1553996090),
(1536, 1, 'page=ticket&id=49', 1554217860),
(1537, 1, 'page=ticket&id=48', 1554217732);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admin_perms`
--

CREATE TABLE `admin_perms` (
  `permid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `game` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `admin_perms`
--

INSERT INTO `admin_perms` (`permid`, `adminid`, `game`) VALUES
(62, 42, 'Counter-Strike 1.6'),
(63, 3, 'Counter-Strike 1.6'),
(64, 3, 'GTA San Andreas'),
(65, 3, 'Minecraft'),
(66, 3, 'TS3'),
(67, 1, 'Counter-Strike 1.6'),
(68, 1, 'GTA San Andreas'),
(69, 1, 'Minecraft'),
(70, 1, 'TS3'),
(71, 1, 'Counter-Strike 1.6'),
(72, 1, 'GTA San Andreas'),
(73, 1, 'Minecraft'),
(74, 1, 'TS3');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bans`
--

CREATE TABLE `bans` (
  `banid` int(11) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `expires` int(11) NOT NULL,
  `uniquecookie` varchar(32) NOT NULL,
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `bans`
--

INSERT INTO `bans` (`banid`, `ip`, `expires`, `uniquecookie`, `message`) VALUES
(1, '79.226.23.44', 1874794835, '', 'Smarac');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `billing_account`
--

CREATE TABLE `billing_account` (
  `aid` int(11) NOT NULL,
  `name` text NOT NULL,
  `details` text NOT NULL,
  `accountinfo` text NOT NULL,
  `titlelang` varchar(64) NOT NULL,
  `bankname` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `billing_account`
--

INSERT INTO `billing_account` (`aid`, `name`, `details`, `accountinfo`, `titlelang`, `bankname`) VALUES
(6, 'PayPal', 'paypal@dunav-hosting.com', 'Strong Hosting\r\npaypal@dunav-hosting.com', 'PAYPAL', 'PAYPAL.com'),
(1, 'Srbija', '275001051654359385', 'Uplatilac: <strong>{firstname} {lastname}</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>Mladen Veljkovic</strong>\r\nIznos: <strong>{price}</strong>\r\nRacun primaoca: <strong>115-0381631733569-39</strong>\r\nPoziv na broj: <strong>{clientid}</strong>\r\nBanka: bilo koja', 'TEKUCI RACUN', 'Societe Generali'),
(18, 'Bosna i Hercegovina', '1941190983102168', 'Uplatilac: <strong>{firstname} {lastname}</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>Mirza Spahic</strong>\r\nIznos: <strong>{price}</strong>\r\nRacun primaoca: <strong>5352748233652715</strong>\r\nPoziv na broj: <strong>{clientid}</strong>', 'TEKUCI RACUN', 'Banka'),
(19, 'Crna Gora', '535-0500200107252-93', 'Uplatilac: <strong>{firstname} {lastname}</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>COMING SOON</strong>\r\nIznos: <strong>{price}</strong>\r\nRacun primaoca: <strong>COMING SOON</strong>\r\nPoziv na broj: <strong>{clientid}</strong>\r\nBanka: Prva banka Crne Gore.', 'TEKUCI RACUN', 'Prva banka Crne Gore'),
(20, 'Hrvatska', 'HR1423400093209956472', 'Uplatilac: <strong>{firstname} {lastname}</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>COMING SOON</strong>\r\nIznos: <strong>{price}</strong>\r\nRacun primatelja / IBAN: <strong>COMING SOON</strong>\r\nPoziv na broj: <strong>{clientid}</strong>\r\nSwift: COMING SOON\r\nBanka: COMING SOON', 'TEKUCI RACUN', 'Privredna banka Zagreb'),
(21, 'PaySafe Card', 'nesa580@yahoo.com', 'Code : ', 'Skrill', 'Skrill.com'),
(22, 'Makedonija', '535-0500200107252-93', 'Uplatilac: <strong>{firstname} {lastname}</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>COMING SOON</strong>\r\nIznos: <strong>{price}</strong>\r\nRacun primaoca: <strong>COMING SOON</strong>\r\nPoziv na broj: <strong>{clientid}</strong>\r\nBanka: COMING SOON', 'TEKUCI RACUN', 'Izvozna i Kreditna Banka');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `billing_currency`
--

CREATE TABLE `billing_currency` (
  `cid` int(11) NOT NULL,
  `multiply` double NOT NULL DEFAULT '1',
  `name` text NOT NULL,
  `sign` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `billing_currency`
--

INSERT INTO `billing_currency` (`cid`, `multiply`, `name`, `sign`) VALUES
(1, 1, 'Eura', '&euro;'),
(7, 123, 'Dinara', 'din'),
(18, 2, 'Konvertibilna marka', 'KM'),
(20, 8, 'Kuna', 'kn'),
(22, 60, 'Denara', 'Ð´ÐµÐ½');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `billing_log`
--

CREATE TABLE `billing_log` (
  `logid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `text` text NOT NULL,
  `adminid` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `billing_log`
--

INSERT INTO `billing_log` (`logid`, `clientid`, `text`, `adminid`, `time`) VALUES
(1, 2, 'Obrisana uplata od 120.048 din (Staro stanje: 5.976 &euro;, Novo: 5 &euro;)', 1, 1554217712),
(2, 2, 'Dodata uplata <a href=\"./?page=billing_payment&id=4\">#4</a> u iznosu od 10 &euro; (10 &euro;) na racun Srbija (Staro stanje: 5 &euro;, Novo: 15 &euro;)', 1, 1554217949),
(3, 2, 'Promenjen status uplate <a href=\"./?page=billing_payment&id=4\">#4</a> na \"Leglo\"', 1, 1554217968),
(4, 2, 'Promenjen status uplate <a href=\"./?page=billing_payment&id=4\">#4</a> na \"Neprovereno\"', 1, 1554217989),
(5, 2, 'Promenjen status uplate <a href=\"./?page=billing_payment&id=4\">#4</a> na \"Neprovereno\"', 1, 1554217990),
(6, 2, 'Obrisana uplata od 10 &euro; (Staro stanje: 15 &euro;, Novo: 5 &euro;)', 1, 1554218013),
(7, 2, 'Dodata uplata <a href=\"./?page=billing_payment&id=5\">#5</a> u iznosu od 10 &euro; (10 &euro;) na racun Bosna i Hercegovina (Staro stanje: 5 &euro;, Novo: 15 &euro;)', 1, 1554218074),
(8, 2, 'Promenjen status uplate <a href=\"./?page=billing_payment&id=5\">#5</a> na \"Leglo\"', 1, 1554218095);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `billing_payment`
--

CREATE TABLE `billing_payment` (
  `paymentid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `currencyid` int(11) NOT NULL,
  `money` double NOT NULL DEFAULT '0',
  `moreinfo` text NOT NULL,
  `payee` varchar(64) NOT NULL,
  `date` varchar(32) NOT NULL,
  `napomena` text NOT NULL,
  `log` text NOT NULL,
  `adminname` text NOT NULL,
  `adminid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `processed` int(11) NOT NULL DEFAULT '0' COMMENT '0 - not checked, 1 - success, 2 - fail',
  `processedadminid` int(11) NOT NULL DEFAULT '0',
  `hidden` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `billing_payment`
--

INSERT INTO `billing_payment` (`paymentid`, `clientid`, `accountid`, `currencyid`, `money`, `moreinfo`, `payee`, `date`, `napomena`, `log`, `adminname`, `adminid`, `time`, `processed`, `processedadminid`, `hidden`) VALUES
(5, 2, 18, 1, 10, '111111', 'tomislavzivkovic', '02.04.2019.', '', 'Dodata uplata <a href=\"./?page=billing_payment&id=5\">#5</a> u iznosu od 10 &euro; (10 &euro;) na racun Bosna i Hercegovina (Staro stanje: 5 &euro;, Novo: 15 &euro;)', 'Tomislav Zivkovic', 1, 1554218074, 1, 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `box`
--

CREATE TABLE `box` (
  `boxid` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `skraceno` text NOT NULL,
  `location` text NOT NULL,
  `ip` text NOT NULL,
  `login` text NOT NULL,
  `password` text NOT NULL,
  `ftpport` text NOT NULL,
  `sshport` text NOT NULL,
  `ostype` text NOT NULL,
  `homedir` varchar(64) NOT NULL DEFAULT '/opt/sell',
  `cost` text NOT NULL,
  `notes` text NOT NULL,
  `ftp` text NOT NULL,
  `ssh` text NOT NULL,
  `load` text NOT NULL,
  `idle` text NOT NULL,
  `passive` text NOT NULL,
  `stuff` text NOT NULL,
  `backupstart` int(11) NOT NULL,
  `backupend` int(11) NOT NULL,
  `zabranaplugins` int(11) NOT NULL DEFAULT '0',
  `zabranamods` int(11) NOT NULL DEFAULT '0',
  `billingzarada` double NOT NULL DEFAULT '0',
  `billingmogucipromet` double NOT NULL DEFAULT '0',
  `loads` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `box`
--

INSERT INTO `box` (`boxid`, `name`, `skraceno`, `location`, `ip`, `login`, `password`, `ftpport`, `sshport`, `ostype`, `homedir`, `cost`, `notes`, `ftp`, `ssh`, `load`, `idle`, `passive`, `stuff`, `backupstart`, `backupend`, `zabranaplugins`, `zabranamods`, `billingzarada`, `billingmogucipromet`, `loads`) VALUES
(1, 'Dedicated (GAME)', 'Dedi', 'Frankfurt', '5.230.130.172', 'root', 'dG9tb2Nhcg==', '21', '1511', 'Linux', '/home', '50', '', 'Online', 'Online', '~', '~', 'On', 'a:2:{s:10:\"cpupicture\";s:0:\"\";s:11:\"eth0picture\";s:0:\"\";}', 1552515192, 0, 0, 0, 0, 0, ''),
(2, 'FDL/TS3 Masina', 'FDL', 'Frankfurt', '167.86.74.115', 'root', 'dG9tb2Nhcg==', '21', '1511', 'Linux', '/var/www/html/fdl', '100', '', 'Online', 'Online', '~', '~', 'On', 'a:2:{s:10:\"cpupicture\";s:0:\"\";s:11:\"eth0picture\";s:0:\"\";}', 0, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cache`
--

CREATE TABLE `cache` (
  `cacheid` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `data` varchar(1024) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `cache`
--

INSERT INTO `cache` (`cacheid`, `type`, `data`, `time`) VALUES
(1, 'stats', '{\"refresh\":\"yes\",\"servers\":\"\",\"members\":\"\",\"players\":\"\",\"allplayers\":\"\"}', 1447237687);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `chat`
--

CREATE TABLE `chat` (
  `msgid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `message` text NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `chat`
--

INSERT INTO `chat` (`msgid`, `adminid`, `message`, `time`) VALUES
(283, 1, 'Helo', 1552781105),
(284, 3, 'hi', 1552783395),
(285, 1, 'hehe', 1553962741),
(286, 1, 'hehe', 1553962752);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `client`
--

CREATE TABLE `client` (
  `clientid` int(10) UNSIGNED NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `notes` text NOT NULL,
  `status` text NOT NULL,
  `lastlogin` datetime NOT NULL,
  `lastip` text NOT NULL,
  `lasthost` text NOT NULL,
  `company` text NOT NULL,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `postcode` text NOT NULL,
  `country` text NOT NULL,
  `phone` text NOT NULL,
  `created` date DEFAULT NULL,
  `reseller` int(11) NOT NULL DEFAULT '0',
  `trusted` int(11) NOT NULL DEFAULT '0',
  `resellerconfig` text NOT NULL,
  `auth` varchar(64) NOT NULL,
  `passtoken` varchar(32) NOT NULL,
  `pin` varchar(5) NOT NULL,
  `price` double NOT NULL DEFAULT '100',
  `currency` int(11) NOT NULL DEFAULT '0',
  `subscribed` int(11) NOT NULL DEFAULT '0',
  `stanje` double NOT NULL DEFAULT '0',
  `billingnotes` text NOT NULL,
  `lastboost` int(11) NOT NULL,
  `zabranasupport` int(11) NOT NULL,
  `zabranatransfer` int(11) NOT NULL DEFAULT '1',
  `updated_at` int(11) NOT NULL,
  `fbid` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `client`
--

INSERT INTO `client` (`clientid`, `email`, `password`, `firstname`, `lastname`, `notes`, `status`, `lastlogin`, `lastip`, `lasthost`, `company`, `address1`, `address2`, `city`, `state`, `postcode`, `country`, `phone`, `created`, `reseller`, `trusted`, `resellerconfig`, `auth`, `passtoken`, `pin`, `price`, `currency`, `subscribed`, `stanje`, `billingnotes`, `lastboost`, `zabranasupport`, `zabranatransfer`, `updated_at`, `fbid`) VALUES
(1, 'demo', 'demo', 'Strong', 'Demo', 'Demo Nalog demo@dunav-hosting.com', 'Active', '2019-04-14 13:04:09', '46.19.230.8', '46.19.230.8', '', '-----', '', '-----', '', '-----', '1', '', '2019-03-13', 0, 0, '', '', '', '00000', 100, 1, 0, 0, '', 0, 0, 0, 0, ''),
(2, 'tomislav1996@gmail.com', '1996', 'Tomislav', 'Zivkovic', 'Novi GH-Korisnik! Prvi E-Mail tomislav1996@gmail.com', 'Active', '2019-04-07 19:54:30', '62.216.206.58', 'ppp-62-216-206-58.dynamic.mnet-online.de', '', 'Petrarcastr', '', 'Munchen', '', '80933', '1', '17698654226', '2019-03-13', 0, 0, '', '173e9fe8b05581d18d029287fec78be8627796efffb6d4e08c81517671ea1b1d', '', '15111', 100, 1, 0, 15, '', 0, 0, 0, 0, ''),
(3, 'djomla.veljkovic@gmail.com', 'bagdala123', 'Djomla', 'Veljkovic', 'Novi GH-Korisnik! Prvi E-Mail djomla.veljkovic@gmail.com', 'Active', '2019-04-13 17:06:43', '178.20.206.8', '178.20.206.8', '', 'Krusevac', '', 'Krusevac', '', '37000', '1', '', '2019-03-14', 0, 0, '', '', '23cc6930ded78e2c7fd6d6654a286b67', '99699', 100, 1, 0, 0, '', 0, 0, 1, 0, ''),
(10, 'madhouse1338@gmail.com', 'vane123', 'Vane', 'Trajkov', '-Prvi mail: madhouse1338@gmail.com', 'Active', '2019-03-23 20:51:10', '79.224.203.251', 'p4FE0CBFB.dip0.t-ipconnect.de', '', 'Nemam', '', 'Strumica', '', '12324', '1', '21232111', '2019-03-21', 0, 0, '', '', '', '97211', 100, 1, 0, 100, '', 0, 0, 0, 0, ''),
(5, 'aaa', 'hcSur9t2NA', 'Mirza', 'Spahic', '-Prvi mail: spahicmirza997@gmail.com', 'Active', '2019-03-16 14:02:39', '141.170.193.137', '141.170.193.137', '', 'test', '', 'test', '', 'test', '1', 'test', '2019-03-16', 0, 0, '', '', '27f08a9f1f8d7c180a1cc503fcea13ab', '12313', 100, 0, 0, 0, '', 0, 0, 1, 0, ''),
(12, 'spahicmirza997@gmail.com', 'fo8ckHBU8t', 'test', 'test', '-Prvi mail: spahicmirza997@gmail.com', 'Active', '2019-03-29 22:17:13', '141.170.193.137', '141.170.193.137', '', 'ttt', '', 'ttt', '', 'ttt', '4', 'ttt', '2019-03-29', 0, 0, '', '', 'e5303b0cfffea770401a1bd6519233a8', '12345', 100, 0, 0, 0, '', 0, 0, 1, 0, ''),
(7, '145@gmail.com', 'VTD6GzrBkF', 'adam', 'czbg', '-Prvi mail: 145@gmail.com', 'Active', '0000-00-00 00:00:00', '~', '~', '', '', '', '', '', '', 'RS', '', '2019-03-19', 0, 0, '', '', '', '', 100, 0, 0, 0, '', 0, 0, 1, 0, ''),
(8, 'roksandaalizoti97@gmail.com', 'vwp45IvePX', 'Roksanda', 'Alizoti', '-Prvi mail: roksandaalizoti97@gmail.com', 'Active', '2019-03-21 22:31:04', '80.110.121.138', '80-110-121-138.cgn.dynamic.surfer.at', '', 'jedan312', '', 'tirana', '', '11550', '5', '0604690326093', '2019-03-19', 0, 0, '', '', '', '12367', 100, 22, 0, 0, '', 0, 0, 1, 0, ''),
(11, 'jovanbebacgmitrovic@gmail.com', 'munempicko', 'Jovan', 'Gmitrovic', '-Prvi mail: jovanbebacgmitrovic@gmail.com', 'Active', '2019-03-24 21:09:50', '178.20.206.8', '178.20.206.8', '', 'Pirot', '', 'Pirot', '', '14257', '1', '', '2019-03-24', 0, 0, '', '', '', '87698', 100, 1, 0, 0, '', 0, 0, 1, 0, ''),
(13, 'carmine@xanior.de', 'jHPrPrcgHm', 'Theresia', 'Becker', '-Prvi mail: carmine@xanior.de', 'Active', '0000-00-00 00:00:00', '~', '~', '', '', '', '', '', '', 'RS', '', '2019-03-30', 0, 0, '', '', '', '', 100, 1, 0, 0, '', 0, 0, 1, 0, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `config`
--

CREATE TABLE `config` (
  `setting` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `value2` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `config`
--

INSERT INTO `config` (`setting`, `value`, `value2`) VALUES
('lastcronrun', '31.12.2016. u 13:24', ''),
('panelname', 'Strong Hosting', ''),
('systemurl', 'http://dunav-hosting.com', ''),
('key', '9tDMwQDNykDO0QTM6k2OiUGdhR2ajVGajJiO5ozc7ISet9iYpx2LiozN6M3OikncvR3YlJXakRWasFmd\nioDNxozc7ISNwIjL4YTMucDOx4yNzIiO0EjOztjIwlGZpxWY2JiO3ozc7Iycy5yayFGazJXZil3YuwWZ\nuFGcnxycy5yayFGazJXZil3YuwWZuFGcn5yd3dnI6UDN6M3Oi4Wah12bkRWasFmdioTMxozc7ISZtlGV\ngUmbPJiO4ozc7ISZsNWejdmbpxGbpJmI6ITM6M3OicmbpRmbhJnQg8mT9cmbphGdl12bzxHO5kTPn5Wa\noRXbvNnI6QzM6M3OiMnbvlGdw92ZpZmbvNmI6MTM6M3OiIXZ2VmTioTN6M3OiUGdhRWZ1RGd4VmbioTM\nxozc7ICMxAjMtYTL5IiO4ozc7ISZ0FGZnVmciozN6M3OiU2cuV2YpxEIkVGdp1Was5WViozNxozc7ISZ\ntFmb0NWdk9mcwJiOxEjOztjI0IiOxozc7ICZpR3Y1R2byBnI6kjOztjIt92YuwWZuFGc0ZWa3NHQ0J3b\nwBXdzJiOyIjOztjIslWYtVmI6UjOztjIyV2cVBCZlJXZ0NXanVmUioTNxozc7ISZtFmbkVmclR3cpdWZ\nyJiO0EjOztjIlZXa0NWQiojN6M3OiMXd0FGdzJiO2ozc7pzMxoTYba01f09b71f5d9660a3dd65f2f26\n6d62da8a2c0099f575b594acb6f42054533c', ''),
('panelversion', '1.6.1', ''),
('template', 'default', ''),
('country', 'US', ''),
('country', 'US', ''),
('lastcsupdatetime', '1288059375', ''),
('preporukatxt', '', ''),
('defaultcss', 'body{\r\n	background: #0099cc url(slike/bg.png) repeat-x;\r\n	text-align: left;\r\n	font: 13px Arial;\r\n	color: #333;\r\n	margin: 0;\r\n	padding: 0;\r\n}\r\nbody a, body a:link, body a:visited, body a:active{\r\n	color: #000;\r\n	text-decoration: underline;\r\n}\r\nbody a:hover{\r\n	color: #000;\r\n	text-decoration: none;\r\n}\r\nh1{\r\n	color: #6699ff;\r\n	text-shadow: 2px 2px 2px #000;\r\n}\r\n#header{\r\n	width: 900px;\r\n}\r\n.logici{\r\n	width: 300px;\r\n	height: 120px;\r\n	text-align: center;\r\n	float: left;\r\n	display: block;\r\n}\r\n#meni{\r\n	width: 600px;\r\n	text-align: center;\r\n	background-color: #fff;\r\n	-moz-border-radius-bottomright: 20px; \r\n	-moz-border-radius-bottomleft: 20px;\r\n	-webkit-border-bottom-left-radius: 20px;\r\n	-webkit-border-bottom-right-radius: 20px;\r\n	height: 120px;\r\n	float: left;\r\n}\r\n.tiket{\r\n	font-size: 25px;\r\n	float: left;\r\n}\r\n.datum{\r\n	font-size: 19px;\r\n	color: #666;\r\n	float: left;\r\n	margin: 7px 0 0 10px;\r\n}\r\n#container{\r\n	width: 900px;\r\n	margin: auto;\r\n}\r\n.form{\r\n	color: #6699ff;\r\n	border: 1px solid #6699ff;\r\n	background-color: #fff;\r\n	width: 200px;\r\n	height: 20px;\r\n	font-size: 14px;\r\n	-webkit-transition-duration:.6s;\r\n	-webkit-transition-timing-function:ease-out;\r\n	-moz-transition-duration:.6s;\r\n	-moz-transition-timing-function:ease-out;\r\n}\r\n.msg{\r\n	color: #6699ff;\r\n	border: 1px solid #6699ff;\r\n	background-color: #fff;\r\n	font-size: 14px;\r\n	-webkit-transition-duration:.6s;\r\n	-webkit-transition-timing-function:ease-out;\r\n	-moz-transition-duration:.6s;\r\n	-moz-transition-timing-function:ease-out;\r\n}\r\n.form:hover, .msg:hover {\r\n	border: 1px solid #333;\r\n	background-color: #fff;\r\n	color: #333;\r\n	-webkit-transition-duration:.15s;\r\n	-webkit-transition-timing-function: ease-in;\r\n	-moz-transition-duration:.15s;\r\n	-moz-transition-timing-function: ease-in;\r\n}\r\n.form:focus, .msg:focus {\r\n	border: 1px solid #333;\r\n	background-color: #fff;\r\n	color: #333;\r\n	-webkit-transition-duration:.15s;\r\n	-webkit-transition-timing-function: ease-in;\r\n	-moz-transition-duration:.15s;\r\n	-moz-transition-timing-function: ease-in;\r\n}\r\n#gore{\r\n	width: 900px;\r\n	height: 70px;\r\n	background-color: #fff;\r\n	margin: 10px 0 0 0;\r\n	-moz-border-radius-topright: 20px; \r\n	-moz-border-radius-topleft: 20px;\r\n	-webkit-border-top-left-radius: 20px;\r\n	-webkit-border-top-right-radius: 20px;\r\n}\r\n#sreda{\r\n	width: 820px;\r\n	background-color: #fff;\r\n	padding: 0 40px 0 40px;\r\n}\r\n#dole{\r\n	width: 900px;\r\n	height: 70px;\r\n	background-color: #fff;\r\n	-moz-border-radius-bottomright: 20px; \r\n	-moz-border-radius-bottomleft: 20px;\r\n	-webkit-border-bottom-left-radius: 20px;\r\n	-webkit-border-bottom-right-radius: 20px;\r\n}\r\n.naslov{\r\n	width: 850px;\r\n	border-top: 1px #666 solid;\r\n	border-left: 1px #666 solid;\r\n	border-right: 1px #666 solid;\r\n	background-color: #ccc;\r\n	padding-left: 10px;\r\n	margin-top: 10px;\r\n}\r\n.poruka{\r\n	width: 840px;\r\n	border: 1px #666 solid;\r\n	background-color: #eee;\r\n	padding: 10px;\r\n}	\r\n.poruka1{\r\n	width: 840px;\r\n	border: 1px #666 solid;\r\n	background-color: #ccc;\r\n	padding: 10px;\r\n}\r\n.table{\r\n	border: 1px #666 solid;\r\n	text-align: center;\r\n	background-color: #ccc;\r\n}\r\n.clear{\r\n	line-height: 0;\r\n	clear: both;\r\n	font: 0;\r\n}\r\n.dugme{\r\n	border-top: 1px solid #ffffff; \r\n	background: #6699ff; \r\n	background: -webkit-gradient(linear, left top, left bottom, from(#004F75), to(#0099cc)); \r\n	background: -moz-linear-gradient(top, #004F75, #0099cc); \r\n	-webkit-transition-duration:.6s;\r\n	-webkit-transition-timing-function:ease-out;\r\n	-moz-transition-duration:.6s;\r\n	-moz-transition-timing-function:ease-out;\r\n	padding: 4px 8px; \r\n	-webkit-border-radius: 10px; \r\n	-moz-border-radius: 10px; \r\n	border-radius: 10px; \r\n	-webkit-box-shadow: rgba(0,0,0,1) 0 1px 0; \r\n	-moz-box-shadow: rgba(0,0,0,1) 0 1px 0; \r\n	box-shadow: rgba(0,0,0,1) 0 1px 0; \r\n	text-shadow: rgba(0,0,0,.4) 0 1px 0; \r\n	color: #ffffff; \r\n	font-size: 13px; \r\n	font-family: Helvetica, Arial, Sans-Serif; \r\n	text-decoration: none; \r\n	vertical-align: middle; \r\n} \r\n.dugme:hover{ \r\n	border-top-color: #fff; \r\n	background: #333; \r\n	color: #ffffff; \r\n	-webkit-transition-duration:.15s;\r\n	-webkit-transition-timing-function: ease-in;\r\n	-moz-transition-duration:.15s;\r\n	-moz-transition-timing-function: ease-in;\r\n} \r\n.dugme:active{ \r\n	border-top-color: #fff; \r\n	background: #333;\r\n	-webkit-transition-duration:.15s;\r\n	-webkit-transition-timing-function: ease-in;\r\n	-moz-transition-duration:.15s;\r\n	-moz-transition-timing-function: ease-in;\r\n}\r\n.button {\r\n	overflow: visible;\r\n	width: auto;\r\n	text-decoration: none;\r\n	background-color: #dff4ff;\r\n	border: 1px solid #333;\r\n	cursor: pointer;\r\n	line-height: 130%;\r\n	color: #333333;\r\n	font-weight: bold;\r\n	-webkit-border-radius: 12px;\r\n	-moz-border-radius: 12px;\r\n	margin-right: 5px;\r\n	padding: 3px 10px 4px 10px;\r\n	-webkit-transition-duration:.6s;\r\n	-webkit-transition-timing-function:ease-out;\r\n	-moz-transition-duration:.6s;\r\n	-moz-transition-timing-function:ease-out;\r\n}\r\n.button:hover {\r\n	background-color:#6699ff;\r\n	border:1px solid #A7CEDF;\r\n	color:#336699;\r\n	-webkit-transition-duration:.15s;\r\n	-webkit-transition-timing-function: ease-in;\r\n	-moz-transition-duration:.15s;\r\n	-moz-transition-timing-function: ease-in;\r\n}\r\n.button:active {\r\n	background-color:#6299c5;\r\n	border:1px solid #6299c5;\r\n	color:#fff;\r\n	-webkit-transition-duration:.15s;\r\n	-webkit-transition-timing-function: ease-in;\r\n	-moz-transition-duration:.15s;\r\n	-moz-transition-timing-function: ease-in;\r\n}\r\n.green {\r\n	color:#529214;\r\n}\r\n.green:hover {\r\n	background-color:#E9EFD1;\r\n	border:1px solid #AACF81;\r\n	color:#529214;\r\n	-webkit-transition-duration:.15s;\r\n	-webkit-transition-timing-function: ease-in;\r\n	-moz-transition-duration:.15s;\r\n	-moz-transition-timing-function: ease-in;\r\n}\r\n.green:active {\r\n	background-color:#529214;\r\n	border:1px solid #529214;\r\n	color:#fff;\r\n	-webkit-transition-duration:.15s;\r\n	-webkit-transition-timing-function: ease-in;\r\n	-moz-transition-duration:.15s;\r\n	-moz-transition-timing-function: ease-in;\r\n}\r\n.blue {\r\n	color:#0A49A9;\r\n}\r\n.blue:hover {\r\n	color:#0A49A9;\r\n	-webkit-transition-duration:.15s;\r\n	-webkit-transition-timing-function: ease-in;\r\n	-moz-transition-duration:.15s;\r\n	-moz-transition-timing-function: ease-in;\r\n}\r\n.blue:active {\r\n	color:#fff;\r\n	-webkit-transition-duration:.15s;\r\n	-webkit-transition-timing-function: ease-in;\r\n	-moz-transition-duration:.15s;\r\n	-moz-transition-timing-function: ease-in;\r\n}\r\n.red {\r\n	color:#d12f19;\r\n}\r\n.red:hover {\r\n	background-color:#fbe3e4;\r\n	border:1px solid #EF959B;\r\n	color:#d12f19;\r\n	-webkit-transition-duration:.15s;\r\n	-webkit-transition-timing-function: ease-in;\r\n	-moz-transition-duration:.15s;\r\n	-moz-transition-timing-function: ease-in;\r\n}\r\n.red:active {\r\n	background-color:#d12f19;\r\n	border:1px solid #d12f19;\r\n	color:#fff;\r\n	-webkit-transition-duration:.15s;\r\n	-webkit-transition-timing-function: ease-in;\r\n	-moz-transition-duration:.15s;\r\n	-moz-transition-timing-function: ease-in;\r\n}\r\n.start {\r\n	padding:6px 10px 4px 36px;\r\n	background-image: url(slike/play.png);\r\n	background-repeat: no-repeat;\r\n	background-position: 8px center;\r\n}\r\n.stop {\r\n	padding:6px 10px 4px 36px;\r\n	background-image: url(slike/stop.png);\r\n	background-repeat: no-repeat;\r\n	background-position: 8px center;\r\n}\r\n.restart {\r\n	padding:6px 10px 4px 36px;\r\n	background-image: url(slike/refresh.png);\r\n	background-repeat: no-repeat;\r\n	background-position: 8px center;\r\n}\r\n\r\n#infobox {\r\n	color: #999999\r\n	margin: 0px 2px 10px;\r\n	padding: 5px 5px 5px 50px;\r\n	border: 2px solid #bb0000;\r\n	background: #ffffff url(slike/info.png) no-repeat 10px;\r\n	-moz-border-radius: 20px; \r\n	-moz-border-radius: 20px;\r\n	-webkit-border-radius: 20px;\r\n	-webkit-border-radius: 20px;\r\n}\r\n\r\n/*\r\nSupport tickets tabele\r\n*/\r\n.tabela {\r\n	background-color: #CCCCCC;\r\n}\r\n.tabela th {\r\n	font-weight: bold;\r\n	text-align: center;\r\n	background-color: #555555;\r\n	color: #FBDF02;\r\n}\r\n.tabela th a {\r\n	color: #fffeee;\r\n}\r\n.tabela td {\r\n	background-color: #121212;\r\n	text-align: center;\r\n	color: #000000;\r\n}\r\n\r\n.tabela .Admin td {\r\n	background-color: #EEF4FB;\r\n}\r\n.tabela .Client td {\r\n	background-color: #FFFFDD;\r\n}\r\n.tabela .Tinfo td {\r\n	background-color: #FFFFEE;\r\n}\r\n\r\n\r\n/* TABLES */\r\n\r\n\r\n	table#server-list{ width: 815px; border: 1px #333 solid; background-color: #ccc; margin: 10px 0 0 0; padding: 10px; text-align: center;}\r\n	\r\n	\r\n	table#server-list th, table.player-list th{ background: #6699ff; color: #333; font: normal 13px/26px \"Trebuchet MS\", Arial, sans-serif;}\r\n	table#server-list tr.even td.td-a{ background: #9EBFFF; padding: 5px;}\r\n	table#server-list tr.even td.td-b{ background: #9EBFFF; padding: 5px;} \r\n	table#server-list tr.odd td.td-a{ background: #CADBFF; padding: 5px;}\r\n	table#server-list tr.odd td.td-b{ background: #CADBFF; padding: 5px;}\r\n	\r\n		table#server-list tr.even{ background: #9EBFFF; padding: 5px;  }\r\n	table#server-list tr.even td.td-a{background: #9EBFFF; padding: 5px; }\r\n	table#server-list tr.even td.td-b{ background: #9EBFFF; padding: 5px;} \r\n	table#server-list tr.odd{ background: #CADBFF; padding: 5px;}	\r\n	', ''),
('defaultcurrency', '1', ''),
('billingsettings', 'a:4:{s:12:\"danpredistek\";s:1:\"5\";s:13:\"mailpredistek\";s:1:\"8\";s:20:\"danposleisteksuspend\";s:1:\"5\";s:21:\"mailposleisteksuspend\";s:1:\"7\";}', ''),
('tostxt', '<pre>Uslovi koriscenja<br /><br />1. Osnove<br />1.1 Sledeci uslovi se odnose na poslovne odnose izmedju Minex Automat DOO, u daljem tekstu \"Cyber Shark\" i korisnika usluga, u daljem tekstu \"korisnik\".<br />2. Pojmovi<br />2.1 Game Server je udaljen server koji se koristi od strane klijenta video igre u svrsi igranja \"multiplayer\" video igara preko interneta.<br />2.2 Dedicated server je fizicki server, racunar, lociran u posebnim prostorijama stalno povezan na internet.<br />2.3 VPS (Virtual Private Server) je virtualizovani deo dedicated servera iste funkcionalnosti kao i dedicated server, s tim sto se korisniku dodeljuje deo resursa.<br />3. Korisnicki odnos<br />3.1 Korisnik moze postati svako fizicko ili pravno lice starije od 13 godina koje prihvati uslove koriscenja usluga i popuni naruzbenicu za odabranu uslugu i uplatom od strane korisnika navedenog iznosa za odabranu uslugu.<br />3.2 U zavisnosti od prirode usluge, korisniku moze biti zatrazena kopija/slika licne karte ili drugog dokumenta radi provere identiteta.<br />3.3 Cyber Shark je duzan da aktivira uslugu najkasnije u roku od 3 radna dana nakon sto je potvrdjena uplata od strane korisnika.<br />3.4 Korisnik je duzan da prilozi validan dokaz o uplati za narucenu uslugu pre aktivacije usluge.<br />3.5 Ukoliko dodje do krsenja uslova koriscenja, Cyber Shark zadrzava pravo da raskine korisnicki odnos uz povracaj novca za preostalo vreme koriscenja usluge.<br />3.6 Ukoliko korisnik koristi bilo kakve fizicke ili druge pretnje, psuje ili vredja bilo kojoj osnovi clanove podrske, Cyber Shark zadrzava pravo da suspenduje uslugu korisnku na odredjeno vreme a ne vise od 48h.<br />3.7 Korisnik je duzan da postuje vreme isteka usluge, a ukoliko zeli da otkaze uslugu, korisnik je duzan da obavesti Cyber Shark najkasnije 3 dana pre isteka pretplate.<br />4. Game Serveri<br />4.1 Prilikom aktivacije usluge, korisnik dobija adresu game servera koja sluzi za identifikaciju istog na internetu i njegovo koriscenje.<br />4.2 Adresa servera ostaje u vlasnistvu Cyber Shark-a, a korisnik je moze koristiti dok traje korisnicki odnos.<br />4.3 Ukoliko nakon 7 dana od isteka pretplate na game server korisnik ne obnovi uslugu, gubi pravo na dalje koriscenje adrese servera.<br />4.4 Cyber Shark se obavezuje da ce obezbediti fizicke servere i potrebne resurse za neometan rad game servera.<br />4.5 Korisniku ce biti omogucena kontrola svog game servera putem korisnickog panela za koji ce dobiti podatke nakon aktiviranja usluge.<br />4.6 Korisnik ima pravo da vrsi modifikacije svog game servera po zelji i potrebi.<br />4.7 Cyber Shark ne snosi odgovornost ukoliko dodje do smetnji u radu game servera usled pogresne modifikacije od strane korisnika, ali putem podrske ce korisniku biti omoguceno popravljanje nastalih problema.<br />4.8 Ukoliko modifikuje svoj game server tako da ugrozava neometan rad ostalih game servera na istom fizickom serveru, Cyber Shark zadrzava pravo da suspenduje game server i upozori korisnika.<br />4.9 Svi game serveri dolaze sa predefinisanim podesavanjima kao i dodatnim reklamama/promocijama koje korisnim moze sam ukloniti ili zatraziti uklanjanje od strane podrske.<br />5. Dedicated serveri i VPS<br />5.1 Cyber Shark se obavezuje da obezbedi neometan rad servera kao i dostupnost 99% vremena na godisnjem nivou.<br />5.2 Korisnik je sam odgovoran za bezbednost svog servera, a ukoliko dodje do kompromitovanja sistema, korisniku je na raspolaganju podrska u vidu reinstalacije sistema ili moguceg ispravljanja gresaka.<br />5.3 Na serverima je zabranjeno hostovanje ilegalnog sadrzaja, pornografskog materijala i materijala podloznog autorskim pravima.<br />5.4 Zabranjeno je pokretanje stetnih alata koji ugrozavaju ostale korisnike mreze, alata za skeniranje mreze, proxy servisa i slicno.<br />5.5 Zadrzavamo pravo ukidanja usluge ukoliko dodje do krsenja uslova koriscenja, bez nadoknade.<br />5.6 Ukoliko dodje do prijave zloupotrebe, korisnik je duzan da odgovori na obavestenje u roku od 48 sati.<br />6. Integritet podataka<br />6.1 Korisnik je duzan da vrsi \"backup\" svojih podataka. U slucaju gubitka podataka, Cyber Shark ne snosi odgovornost za nastalu stetu.<br />6.2 Korisnik je odgovoran za cuvanje svojih login podataka za kontrolni panel kao i podataka za pristup svom serveru. Ukoliko dodje do neautorizovanog pristupa, korisnik mora da obavesti Cyber Shark. Korisnik je odgovoran ukoliko dodje do zloupotrebe njegovog naloga njegovom greskom.<br />7 Privatnost<br />7.1 Cyber Shark prikuplja e-mail adrese svojih klijenata primarno radi komunikacije i obavestavanja. Cyber Shark nikada nece otkrivati podatke svojih korisnika trecem licu.<br />7.2 Licni podaci se prikupljaju iskljucivo radi identifikacije korisnika i koriste radi naplate usluga.<br />7.3 Prekidanjem korisnickog odnosa, klijent moze zatraziti brisanje njegovih informacija iz Cyber Shark korisnickog sistema.<br />8. Odgovornost<br />8.1 Cyber Shark nije odgovoran za stetu ili gubitke podataka nastalu tehnickim problemima van svog domasaja i uticaja.<br />8.2 Korisnik je direktno odgovoran ukoliko dodje do krsenja stave 5.3 ili 5.4 uslova koriscenja.</pre>', ''),
('tostime', '0', ''),
('backupscript', 'rm -rf /backup/files/{masina}/ &&\r\nrm -rf /backup/main/{masina}/ &&\r\nrsync -azlpEog --rsh=ssh {masina}:/opt/ /backup/files/{masina}/ &&\r\nrsync -azlpEog --rsh=ssh {masina}:/etc/passwd /backup/main/{masina}/ &&\r\nrsync -azlpEog --rsh=ssh {masina}:/etc/passwd- /backup/main/{masina}/ &&\r\nrsync -azlpEog --rsh=ssh {masina}:/etc/shadow /backup/main/{masina}/ &&\r\nrsync -azlpEog --rsh=ssh {masina}:/etc/shadow- /backup/main/{masina}/ &&\r\nwget \"www.cybershark.rs\" &&\r\nrm -f potvrda.php* &&\r\nexit', ''),
('newsletterEmail', '', 'Test newsletter,  pro :)');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `coupons`
--

CREATE TABLE `coupons` (
  `cid` int(11) NOT NULL,
  `coupon` varchar(12) NOT NULL,
  `remaining` int(11) NOT NULL DEFAULT '0',
  `popust` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `drzave`
--

CREATE TABLE `drzave` (
  `did` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `drzave`
--

INSERT INTO `drzave` (`did`, `naziv`) VALUES
(1, 'Srbija'),
(2, 'Crna Gora'),
(3, 'Hrvatska'),
(4, 'Bosna i Hercegovina'),
(5, 'Makedonija');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `emailtemp`
--

CREATE TABLE `emailtemp` (
  `emailtempid` int(11) NOT NULL,
  `naziv` varchar(32) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `bcc` text NOT NULL,
  `subject` text NOT NULL,
  `template` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `emailtemp`
--

INSERT INTO `emailtemp` (`emailtempid`, `naziv`, `name`, `email`, `bcc`, `subject`, `template`) VALUES
(1, 'Game Panel & Server Info', 'Strong-Hosting', 'noreply@dunav-hosting.com', '', 'Game Panel & Server Info', 'Pozdrav {firstname}\r\n\r\nOvo je VaÅ¡ nalog za prijavljivanje na Strong-Hosting Game Panel:\r\n\r\nEmail: {email}\r\nÅ ifra: {password}\r\n\r\nGame Panel link:\r\nwww.dunav-hosting.com\r\n\r\nSrdaÄan pozdrav\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n\r\n---ENGLISH---\r\n\r\nHello {firstname}\r\n\r\nThis is your account login for Strong-Hosting GamePanel:\r\n\r\nEmail Address: {email}\r\nPassword: {password}\r\n\r\nGame Panel link:\r\nwww.dunav-hosting.com\r\n\r\nGreeting.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com'),
(14, 'Your order for new game server', 'Strong-Hosting', 'noreply@dunav-hosting.com', '', 'PorudÅ¾bina novog servera', 'PoÅ¡tovani <strong>{firstname} {lastname}</strong>,\r\n\r\nkontaktiramo Vas u vezi VaÅ¡e porudÅ¾bine <strong>{gamename}</strong> game servera sa <strong>{slots}</strong> slotova(slota) na <strong>{location}</strong> lokaciji.\r\nDa bi VaÅ¡ server bio aktiviran potrebno je da uplatite sumu navedenu ispod i poÅ¡aljete nam sliku overene uplatnice.\r\nMoÅ¾ete koritstiti i elektronsko plaÄ‡anje.\r\n\r\nIznos za uplatu: <strong>{price} {currency}</strong>.\r\n{paymentinfo}\r\n\r\nNakon uplate ulogujte se na Game Panel na adresi www.dunav-hosting.com i na stranici\r\nservera pronaÄ‘ite VaÅ¡u porudÅ¾benicu i kliknite na dugme podigni server.\r\nPopunite obrazac i VaÅ¡ server Ä‡e biti aktiviran ubrzo nakon toga a najviÅ¡e za 24h.\r\n\r\nSrdaÄan pozdrav.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n\r\n---ENGLISH---\r\n\r\nHello <strong>{firstname} {lastname}</strong>,\r\n\r\nYou ordered <strong>{gamename}</strong> server with <strong>{slots}</strong> slots on location <strong>{location}</strong>.\r\n\r\nNext step is to write this info down or print it and go to post office or bank to make a payment for <strong>{price} {currency}</strong>. \r\nYou can also use online banking.\r\n\r\n{paymentinfo}\r\n\r\nWhen you pay in bank, you will get a receipt and you need to take a picture of it or scan it.\r\nThen go to www.dunav-hosting.com and click SERVERS and you will have an option SEND REQUEST\r\nThere you will enter server name and upload picture of payment and when you finish you will get server as soon as possible.\r\n\r\nGreeting.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n'),
(7, 'Server suspended', 'Strong-Hosting', 'noreply@dunav-hosting.com', '', 'Server suspended', 'Pozdrav {firstname}\r\n\r\nVas server {ip}:{port} je suspendovan zato sto nije placen u roku od 5 dana nakog datuma isteka.\r\n\r\nAko ne zelite vise da placate vas server, ignorisite ovaj email.\r\n\r\nAko ste uplatili server putem banke i niste poslali dokaz o izvrsenju uplate (slika uplatnice), posaljite sto pre, zasto sto ce server imati status neplacenog i bice posle odredjenog roka izbrisan iz nase baze.\r\n\r\nAko imate bilo kakvih pitanja, ne oklevajte, slobodno otvorite support ticket.\r\n\r\nHvala :)\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com'),
(3, 'Game Panel & Server Info', 'Strong-Hosting', 'noreply@dunav-hosting.com', '', 'Informacije za Game Panel i servere', 'PoÅ¡tovani {firstname},\r\n\r\nDostavljamo Vam podatke za prijavu na Strong-Hosting Game Panel:\r\n\r\nEmail Adresa: {email}\r\nÅ ifra: {password}\r\n\r\nGame Panel link:\r\nwww.dunav-hosting.com\r\n\r\nMoÅ¾ete koristiti VaÅ¡ Game Panel nalog za restartovanje servera ili upotrebu WebFTP-a za direktan pristup fajlovima na serveru, dodavanje novih mapa, promene podeÅ¡avanja, instaliranje plugin-a i modova.\r\nAko naiÄ‘ete na bilo kakav problem imate opciju podrÅ¡ka gde moÅ¾ete otvoriti novi tiket i saÄekati nekog iz podrÅ¡ke da Vam reÅ¡i problem.\r\n\r\nSrdaÄan pozdrav.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n\r\n---ENGLISH---\r\n\r\nHello {firstname},\r\n\r\nHere is your Game Panel account login info:\r\n\r\nEmail Address: {email}\r\nPassword: {password}\r\n\r\nGame Panel link:\r\nwww.dunav-hosting.com\r\n\r\nYou can use Game Panel for restarting server when needed, if something goes wrong etc. You can use WebFTP for direct access to servers files, add maps, change settings, install plugins and mods and many more.\r\nIf you encounter any problems, you have Support section where you can open ticket and wait for someone from Support to help you with your problem.\r\n\r\nGreeting.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com'),
(4, 'Game Panel Info', 'Strong-Hosting', 'noreply@dunav-hosting.com', '', 'Game Panel Info', 'PoÅ¡tovani {firstname},\r\n\r\nDostavljamo Vam podatke za prijavu na Strong-Hosting Game Panel:\r\n\r\nEmail: {email}\r\nÅ ifra: {password}\r\n\r\nGame Panel link: www.dunav-hosting.com\r\n\r\nMoÅ¾ete koristiti VaÅ¡ Game Panel nalog za restartovanje servera ili upotrebu WebFTP-a za direktan pristup fajlovima na serveru, dodavanje novih mapa, promene podeÅ¡avanja, instaliranje plugin-a i modova.\r\nAko naiÄ‘ete na bilo kakav problem imate opciju podrÅ¡ka gde moÅ¾ete otvoriti novi tiket i saÄekati nekog iz podrÅ¡ke da Vam reÅ¡i problem.\r\n\r\nSrdaÄan pozdrav.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n\r\n---ENGLISH---\r\n\r\nHello {firstname}\r\n\r\nHere is your Game Panel account login info:\r\n\r\nEmail Address: {email}\r\nPassword: {password}\r\n\r\nGame Panel Link: www.dunav-hosting.com\r\n\r\nYou can use Game Panel for restarting server when needed, if something goes wrong etc. You can use WebFTP for direct access to servers files, add maps, change settings, install plugins and mods and many more.\r\nIf you encounter any problems, you have Support section where you can open ticket and wait for someone from Support to help you with your problem.\r\n\r\nGreeting.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com'),
(5, 'Game Panel & Server Info', 'Strong-Hosting', 'noreply@dunav-hosting.com', '', 'Game Panel & Server Info', 'Pozdrav {firstname}\r\n\r\nEvo vaÅ¡ih podataka za prijavu na Strong-Hosting Game Panel:\r\n\r\nEmail Addresa: {email}\r\nÅ ifra: {password}\r\n\r\nGame Panel link:\r\nwww.dunav-hosting.com\r\n\r\nMoÅ¾ete koristiti VaÅ¡ Game Panel za restartovanje servera , ili upotrebu WebFTP-a za direktan pristup fajlovima na serveru,dodavanje novih mapa, promene podeÅ¡avanja, instaliranje plugin-a i modova\r\nAko naiÄ‘ete na bilo kakav problem imate opciju podrÅ¡ke gde moÅ¾ete otvoriti novi tiket i saÄekati nekog iz podrÅ¡ke da Vam reÅ¡i problem.\r\n\r\nSrdaÄan pozdrav.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n\r\n---ENGLISH---\r\n\r\nHello {firstname}\r\n\r\nHere is your Game Panel account login info:\r\n\r\nEmail Address: {email}\r\nPassword: {password}\r\n\r\nGame Panel link:\r\nwww.dunav-hosting.com\r\n\r\nYou can use Game Panel for restarting server when needed, if something goes wrong etc. You can use WebFTP for direct access to servers files, add maps, change settings, install plugins and mods and many more.\r\nIf you encounter any problems, you have Support section where you can open ticket and wait for someone from Support to help you with your problem.\r\n\r\nGrettings.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com'),
(8, 'Info about expired server', 'Strong-Hosting', 'noreply@dunav-hosting.com', '', 'Server istice', 'Hello {firstname},\r\n\r\nWe inform you that following servers:\r\n{serverlist}\r\nExpire in {istek} days, and if you do not pay within 5 days after expiration, servers will be suspended by panel.\r\n\r\nIf you want to keep servers, you need to extend it in your game panel using paypal payment or bank account. If you pay on bank account here is our bank account info so pay, take a picture of receipt and go to game panel, billing and add payment. \r\n\r\nGreetings.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n'),
(9, 'You have new server in your Evo ', 'Strong-Hosting', 'noreply@dunav-hosting.com', '', 'Imate novi server na vaÅ¡em Strong Hosting Game Panelu', 'Pozdrav {firstname}\r\n\r\nUpravo smo instalirali server na VaÅ¡ Game Panel nalog.\r\nIP Adresa: {ip}:{port}\r\n\r\nKoristite VaÅ¡e podatke da se prijavite na  www.dunav-hosting.com da biste bili u moguÄnosti da kontroliÅ¡ete VaÅ¡ server.\r\nU sluÄaju da zaboravite vaÅ¡e podatke:\r\nEmail Adresa: {email}\r\nÅ ifra: {password}\r\n\r\nSrdaÄan pozdrav\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n\r\n---ENGLISH---\r\n\r\nHello {firstname}\r\n\r\nWe have just installed new server on your account :)\r\nIP Address: {ip}:{port}\r\n\r\nUse your details to login at www.dunav-hosting.com to control your server.\r\n\r\nIn case you forgot, your game panel login details are:\r\nEmail Address: {email}\r\nPassword: {password}\r\n\r\nThanks\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com'),
(10, 'You have new server in your Evo ', 'Strong-Hosting', 'noreply@dunav-hosting.com', '', 'Imate novi server na vaÅ¡em Strong Hosting Game Panelu', 'Pozdrav {firstname}\r\n\r\nUpravo smo instalirali server na VaÅ¡ Game Panel nalog.\r\nIP Adresa: {ip}:{port}\r\n\r\nKoristite VaÅ¡e podatke da se prijavite na  www.dunav-hosting.com da biste bili u moguÄnosti da kontroliÅ¡ete VaÅ¡ server.\r\nU sluÄaju da zaboravite vaÅ¡e podatke:\r\nEmail: {email}\r\nÅ ifra: {password}\r\n\r\nSrdaÄan pozdrav.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n\r\n---ENGLISH---\r\n\r\nHello {firstname}\r\n\r\nWe have just installed new server on your account :)\r\nIP Address: {ip}:{port}\r\n\r\nUse your details to login at www.dunav-hosting.com to control your server.\r\n\r\nIn case you forgot, your game panel login details are:\r\nEmail Address: {email}\r\nPassword: {password}\r\n\r\nGreetings.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com'),
(11, 'Rejected payment', 'Strong-Hosting', 'noreply@dunav-hosting.com', '', 'Odbijena uplata', 'Pozdrav {firstname}\r\n\r\nObaveÅ¡tenje da je vaÅ¡a uplata: {iznos} {valuta} odbijena.\r\n\r\nRazlozi za odbijanje uplate:\r\n1) Uplata nije legla na naÅ¡ bankovni raÄun duÅ¾e od 3 dana.\r\n2) Poslali ste sliku stare uplatnice koja je bila koriÅ¡Ä‡ena pre.\r\n3) Poslali ste nejasnu sliku uplatnice na kojoj se ne vide podatci.\r\n4) Poslali ste ureÄ‘enu sliku sa prepravljenim datumom.\r\n5) Probali ste da dobijete viÅ¡e servera sa jednom uplatom i sada ste izgubili pravo na bilo koji server bez moguÄ‡nosti povratka novca.\r\n\r\nThis payment will be mark as false in your billing and if a server was extended with it, expiration day will go back.\r\n\r\nNe odgovarajte na ovaj mail,jer on nece stiÄ‡i nigde.\r\n\r\n\r\nSrdaÄan pozdrav.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n\r\n---ENGLISH---\r\n\r\nHello {firstname}\r\n\r\nThis is info that your payment for {iznos} {valuta} is rejected.\r\n\r\nReason for payment refusal can be one of the following:\r\n1) Payment is not on our bank account in 3 days.\r\n2) You sent old picture of payment that is already used and can not be used again.\r\n3) You sent very bad picture and we can not read it or verify it.\r\n4) You send modified picture with false data.\r\n5) You tried to get more servers with one payment and you lose the right to get any server and no refund is possible.\r\n\r\nThis payment will be mark as false in your billing and if a server was extended with it, expiration day will go back.\r\n\r\nDo not answer to this mail.\r\n\r\n\r\nThanks for understanding.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com'),
(12, 'Server unsuspended', 'Strong-Hosting', 'noreply@dunav-hosting.com', '', 'Server unsuspended', 'PoÅ¡tovani {firstname},\r\n\r\nUpravo smo aktivirali VaÅ¡ server: {ip}:{port} :)\r\n\r\nHvala Vam na poverenju.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n\r\n---ENGLISH---\r\n\r\nHello {firstname},\r\n\r\nWe have just activated your server: {ip}:{port}\r\n\r\nThank you for your continued support and for the confidence that you have placed in us.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com'),
(13, 'There was action on your server', 'Strong-Hosting', 'noreply@dunav-hosting.com', '', 'There was action on your server', 'Hello {firstname}\r\n\r\nOn your server {ip}:{port} action was executed: \"{akcija}\" via game panel.\r\nAction was executed on IP address {userip}.\r\nIf you did not execute this action please check whom did you give password and change it.\r\n\r\nIf you do not want these actions to come to your e-mail you can turn them off in game panel in Profile\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `finance_archive`
--

CREATE TABLE `finance_archive` (
  `aid` int(11) NOT NULL,
  `data` text NOT NULL,
  `date` varchar(32) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `finance_troskovi`
--

CREATE TABLE `finance_troskovi` (
  `tid` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `money` double NOT NULL,
  `opis` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `game`
--

CREATE TABLE `game` (
  `gameid` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `game` text NOT NULL,
  `shortname` varchar(12) NOT NULL,
  `query` text NOT NULL,
  `priority` text NOT NULL,
  `slots` text NOT NULL,
  `type` text NOT NULL,
  `cfg1name` text NOT NULL,
  `cfg1` text NOT NULL,
  `cfg1edit` text NOT NULL,
  `cfg2name` text NOT NULL,
  `cfg2` text NOT NULL,
  `cfg2edit` text NOT NULL,
  `cfg3name` text NOT NULL,
  `cfg3` text NOT NULL,
  `cfg3edit` text NOT NULL,
  `cfg4name` text NOT NULL,
  `cfg4` text NOT NULL,
  `cfg4edit` text NOT NULL,
  `cfg5name` text NOT NULL,
  `cfg5` text NOT NULL,
  `cfg5edit` text NOT NULL,
  `cfg6name` text NOT NULL,
  `cfg6` text NOT NULL,
  `cfg6edit` text NOT NULL,
  `cfg7name` text NOT NULL,
  `cfg7` text NOT NULL,
  `cfg7edit` text NOT NULL,
  `cfg8name` text NOT NULL,
  `cfg8` text NOT NULL,
  `cfg8edit` text NOT NULL,
  `mapcfg` varchar(5) NOT NULL,
  `startline` text NOT NULL,
  `gamedir` text NOT NULL,
  `port` text NOT NULL,
  `status` text NOT NULL,
  `qryport` text NOT NULL,
  `icon` varchar(128) NOT NULL,
  `updatepath` text NOT NULL,
  `price` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `game`
--

INSERT INTO `game` (`gameid`, `name`, `game`, `shortname`, `query`, `priority`, `slots`, `type`, `cfg1name`, `cfg1`, `cfg1edit`, `cfg2name`, `cfg2`, `cfg2edit`, `cfg3name`, `cfg3`, `cfg3edit`, `cfg4name`, `cfg4`, `cfg4edit`, `cfg5name`, `cfg5`, `cfg5edit`, `cfg6name`, `cfg6`, `cfg6edit`, `cfg7name`, `cfg7`, `cfg7edit`, `cfg8name`, `cfg8`, `cfg8edit`, `mapcfg`, `startline`, `gamedir`, `port`, `status`, `qryport`, `icon`, `updatepath`, `price`) VALUES
(46, 'FDL New by dunav-hosting.com', 'FDL', '', 'none', 'None', '1', 'Public', 'Link', 'http://fdl.dunav-hosting.com/fdl/IMEUSERA', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '/home/gamefiles/fdl', '1', 'Active', '', '', '', '2.5'),
(2, 'CS 1.6 New by dunav-hosting.com', 'Counter-Strike 1.6', 'cs', 'none', 'None', '32', 'Public', 'Tick Rate', '333', '', 'Ping Boost', '0', '', 'Server Config', 'server.cfg', '', 'Start Map', 'de_dust2', 'on', 'Local IP', '10.3.1.2/10.4.1.2 (Ostaviti jedan)', '', '', '', '', '', '', '', '', '', '', 'cfg4', './hlds_run -game cstrike +ip {cfg5} -pingboost {cfg2} +maxplayers {slots} +sys_ticrate {cfg1} +servercfgfile {cfg3} +mapchangecfgfile {cfg3} +map {cfg4} -port {port} -sport {cfg6}', '/home/gamefiles/cs', '27015', 'Active', '', 'slike/games/game-cs.png', '', '0.75'),
(1, 'CSS Orangebox', 'CS: S - OrangeBox', 'css', 'none', 'None', '64', 'Public', 'Map', 'de_dust2', 'on', 'FPS Max', '0', '', 'Tic Rate', '67', '', 'Server Config', 'server.cfg', '', 'TV Enable', '0', '', 'TV Max Clients', '2', '', 'TV Port', '29020', '', '', '', '', 'cfg1', 'cd css && ./srcds_run -game cstrike -ip {ip} -port {port} -maxplayers {slots} -tickrate {cfg3} +fps_max {cfg2} +map {cfg1} +servercfgfile {cfg4} +tv_enable {cfg5} +tv_maxclients {cfg6} +tv_port {cfg7}', '/home/blanko/css', '27070', 'Inactive', '', 'slike/games/game-css.png', '/home/games/update/css', '0.5'),
(4, 'TF2 Server', 'Team Fortress 2', '', 'none', 'None', '32', 'Public', 'Tick Rate', '66', '', 'Map', 'ctf_2fort', 'on', 'Server Config', 'server.cfg', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'cfg2', 'cd orangebox && ./srcds_run -game tf -ip {ip} -port {port} -maxplayers {slots} -tickrate {cfg1} +map {cfg2} +servercfgfile {cfg3} -nohltv', '/home/blanko/tf2', '27020', 'Inactive', '', '', '', '0.5'),
(7, 'HLTV Server p48', 'HLTV protocol 48', '', 'none', 'None', '255', 'Public', 'IP CW Servera', '217.26.75.218', 'on', 'Port CW Servera', '29999', 'on', 'Rcon CW Servera', 'rcon123', 'on', 'Password CW servera', '123', 'on', 'Pass HLTV Servera', 'pass123', 'on', '', '', '', '', '', '', '', '', '', '', '#!/bin/bash\r\nexport LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH\r\n./hltv -ip {ip} -port {port} +connect {cfg1}:{cfg2} +maxclients {slots} +adminpassword {cfg3} +serverpassword {cfg4} +adminpassword {cfg5}', '/home/games/cs/hltv48', '27020', 'Inactive', '', '', '', '0.05'),
(8, 'COD4 Server', 'Call of Duty 4', 'cod4', 'none', 'None', '32', 'Public', 'Server Config', 'server.cfg', 'on', 'Map', 'mp_vacant', 'on', 'Punkbuster', '1', 'on', 'Rcon Password', 'chang3m3', 'on', 'Game Mod', '', '', '', '', '', '', '', '', '', '', '', 'cfg2', './cod4_lnxded +set dedicated 2 +set net_ip {ip} +set net_port {port} +set sv_maxclients {slots} +exec {cfg1} +map {cfg2} +set sv_punkbuster {cfg3} +set rcon_password {cfg4}', '/home/gamefiles/cod4', '28960', 'Active', '', 'slike/games/game-cod4.png', '', '0.5'),
(10, 'COD2 Server', 'Call of Duty 2', 'cod2', 'none', 'None', '32', 'Public', 'Server Config', 'server.cfg', '', 'Map', 'mp_toujane', 'on', 'Punkbuster', '1', 'on', 'Rcon Password', 'chang3m3', 'on', 'Mod', '', '', '', '', '', '', '', '', '', '', '', 'cfg2', './cod2_lnxded +set net_ip {ip} +set net_port {port} +set sv_maxclients {slots} +exec {cfg1} +map {cfg2} +set sv_punkbuster {cfg3} +set rcon_Password {cfg4}', '/home/games/cod2_13', '28960', 'Inactive', '', 'slike/games/game-cod2.png', '/home/games/update/cod2_13', '0.5'),
(12, 'SA:MP New by dunav-hosting.com', 'GTA San Andreas', 'samp', 'none', 'None', '200', 'Public', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', './samp03svr', '/home/gamefiles/samp', '7777', 'Active', '', 'slike/games/game-samp.png', '', '0.2'),
(13, 'TeamSpeak 3 By dunav-hosting.com', 'TS3', 'ts3', 'ts3', 'None', '100', 'Public', 'sid', '', '', 'srvadmin_pw', '', 'on', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', './ts3server_startscript.sh voice_ip={ip} filetransfer_ip={ip} query_ip={ip} default_voice_port={port}', '/home/teamspeak3-server_linux_amd64', '9987', 'Active', '10011', '', '', '0.1'),
(25, 'CSS Server p7', 'Counter-Strike: Source p7', 'css', 'none', 'None', '32', 'Public', 'Tick Rate', '66', '', 'FPS Max', '0', '', 'Map', 'de_dust2', 'on', 'Server Config', 'server.cfg', '', 'TV Enable', '0', 'on', 'TV Max Clients', '0', 'on', 'TV Port', '29999', '', '', '', '', 'cfg3', './srcds_run -game cstrike -ip {ip} -port {port} -maxplayers {slots} -tickrate {cfg1} +fps_max {cfg2} +map {cfg3} +servercfgfile {cfg4} +tv_enable {cfg5} +tv_maxclients {cfg6} +tv_port {cfg7}', '/home/games/cssold', '27020', 'Inactive', '', 'slike/games/game-css.png', '/home/games/update/cssold', '0.5'),
(26, 'Left 4 Dead 2', 'Left4Dead 2', 'l4d2', 'none', 'None', '8', 'Public', 'Tick Rate', '66', '', 'Map', 'c2m1_highway', 'on', 'Server Config', 'server.cfg', 'on', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'cfg2', 'cd left4dead2 && ./srcds_run -game left4dead2 -ip {ip} -port {port} -maxplayers {slots} -tickrate {cfg1} +map {cfg2} +servercfgfile {cfg3} -nohltv', '/home/blanko/l4d2', '27020', 'Active', '', '', '', '1.4'),
(28, 'Battlefield 2', 'Battlefield 2', 'bf2', 'none', 'None', '64', 'Public', 'Mod', 'bf2', 'on', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', './start.sh +game bf2 +modPath mods/{cfg1} +maxPlayers {slots} +port {port}', '/home/blanko/bf2', '16567', 'Inactive', '', '', '', '0.7'),
(30, 'Minecraft New by dunav-hosting.com', 'Minecraft', 'minecraft', 'none', 'None', '120', 'Public', 'RAM allocation', '1G', '', 'Port', '26030', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'java -Xincgc -Xmx{cfg1} -jar minecraft.jar nogui --port {cfg2}', '/home/gamefiles/mc', '26030', 'Active', '', 'slike/games/game-mc.png', '', '0.07'),
(33, 'CSPromod', 'CSPromod', 'csp', 'none', 'None', '32', 'Public', 'Tick Rate', '67', '', 'FPS Max', '0', '', 'Map', 'csp_dust2', 'on', 'Server Config', 'server.cfg', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'cd orangebox && ./srcds_run -game cspromod -ip {ip} -port {port} -maxplayers {slots} -tickrate {cfg1} +fps_max {cfg2} +map {cfg3} +servercfgfile {cfg4}', '/home/games/cspromod', '27050', 'Inactive', 'cfg3', '', '/home/games/update/cspromod', '0.5'),
(35, 'Left 4 Dead', 'Left4Dead', 'l4d', 'none', 'None', '8', 'Public', 'Map', 'l4d_hospital05_rooftop', 'on', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'cd l4d && ./srcds_run -game left4dead +hostip {ip} +hostport {port} +clientport 27006 -nohltv +exec server.cfg +map {cfg1}', '/home/blanko/l4d', '28020', 'Inactive', '', '', '', '1'),
(32, 'Team Speak 3 Master Server', 'TS3 Master Server', 'ts3', 'ts3', 'None', '500', 'Public', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', './ts3server_minimal_runscript.sh', '/home/teamspeak3-server_linux_amd64', '9987', 'Active', '10011', '', '', '0.1'),
(37, 'CS:GO', 'Counter-Strike: Global Offensive', 'csgo', 'none', 'None', '64', 'Public', 'Game Type', '0', 'on', 'Game Mode', '0', 'on', 'Map Group', 'mg_allclassic', 'on', 'Map', 'de_dust2', 'on', 'TV Enable', '0', 'on', 'TV Max Clients', '2', 'on', 'TV Port', '29020', 'on', 'Tick', '64', '', '', './srcds_run -game csgo -ip {ip} -port {port} -console -usercon +game_type {cfg1} +game_mode {cfg2} +sv_pure 1 +map {cfg4} +mapgroup {cfg3} -tickrate {cfg8}  -maxplayers_override {slots} +tv_enable {cfg5} +tv_maxclients {cfg6} +tv_port {cfg7} +sv_setsteamaccount {token} -net_port_try 1', '/home/gamefiles/csgo/linkovi/csgoblanko', '27020', 'Inactive', '', '', '/home/games/update/csgo', '0.5'),
(39, 'CS 1.6 New by dunav-hosting.com CW', 'Counter-Strike 1.6', 'cs', 'none', 'None', '12', 'Public', 'Tick Rate', '500', '', 'Ping Boost', '1', '', 'Server Config', 'server.cfg', '', 'Start Map', 'de_dust2', 'on', 'Local IP', '10.3.1.2/10.4.1.2 (Ostaviti jedan)', '', '', '', '', '', '', '', '', '', '', 'cfg4', './hlds_run -game cstrike +ip {ip} -pingboost {cfg2} +maxplayers {slots} +sys_ticrate {cfg1} +servercfgfile {cfg3} +mapchangecfgfile {cfg3} +map {cfg4} -port {port}', '/home/gamefiles/cw', '27015', 'Active', '', '', '', '0.75'),
(40, 'CS:GO Steam - 2016', 'Counter-Strike: Global Offensive', '', 'none', 'None', '64', 'Public', 'Game Type', '0', 'on', 'Game Mode', '0', 'on', 'Map Group', 'mg_allclassic', 'on', 'Map', 'de_dust2', 'on', 'Token', '', 'on', 'Tick', '64', '', 'TV Enable', '0', 'on', 'TV Port', '29026', 'on', '', './srcds_run -game csgo -ip {ip} -port {port} -console -usercon +game_type {cfg1} +game_mode {cfg2} +sv_pure 1 +map {cfg4} +mapgroup {cfg3} -tickrate {cfg6}  -maxplayers_override {slots} +sv_setsteamaccount {cfg5} -net_port_try 1 -tv_enable {cfg7} -tv_port {cfg8} -nohltv', '/home/gamefiles/csgo_links', '28020', 'Active', '', '', '', '0.6');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `game_cfg`
--

CREATE TABLE `game_cfg` (
  `cfgid` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `game_cfg`
--

INSERT INTO `game_cfg` (`cfgid`, `name`, `description`) VALUES
(1, 'hostname', '_CFG_HOSTNAME'),
(2, 'sv_password', '_CFG_SV_PASSWORD'),
(3, 'rcon_password', '_CFG_RCON_PASSWORD'),
(4, 'mp_friendlyfire', '_CFG_MP_FRIENDLYFIRE'),
(5, 'sv_gravity', '_CFG_SV_GRAVITY'),
(6, 'mp_freezetime', '_CFG_MY_FREEZETIME'),
(7, 'mp_startmoney', '_CFG_MY_STARTMONEY'),
(8, 'mp_timelimit', '_CFG_MP_TIMELIMIT'),
(9, 'mp_maxrounds', '_CFG_MP_MAXROUNDS'),
(10, 'mp_buytime', '_CFG_MP_BUYTIME'),
(11, 'amx_show_activity', '_CFG_AMX_SHOW_ACTIVITY'),
(12, 'set sv_hostname', '_CFG_HOSTNAME');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `game_cfg_file`
--

CREATE TABLE `game_cfg_file` (
  `fileid` int(11) NOT NULL,
  `game` varchar(32) NOT NULL,
  `path` varchar(64) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `game_cfg_file`
--

INSERT INTO `game_cfg_file` (`fileid`, `game`, `path`, `filename`, `active`, `order`) VALUES
(1, 'Counter-Strike 1.6', '/cstrike/', 'server.cfg', 1, 0),
(3, 'Call of Duty 2', '/main/', 'server.cfg', 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ip`
--

CREATE TABLE `ip` (
  `ipid` int(10) UNSIGNED NOT NULL,
  `boxid` int(10) UNSIGNED NOT NULL,
  `ip` text NOT NULL,
  `usage` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `ip`
--

INSERT INTO `ip` (`ipid`, `boxid`, `ip`, `usage`) VALUES
(1, 1, '5.230.130.172', 'Game Servers'),
(2, 2, '167.86.74.115', 'Game Servers');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `korisnici`
--

CREATE TABLE `korisnici` (
  `id` int(11) UNSIGNED NOT NULL,
  `korisnicko` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `zadnjaip` varchar(100) NOT NULL DEFAULT '',
  `zadnjaipmoja` varchar(100) NOT NULL DEFAULT '',
  `ipcheck` int(1) NOT NULL DEFAULT '0',
  `registrovan` int(11) NOT NULL,
  `zadnji_login` int(11) NOT NULL DEFAULT '0',
  `komentara` int(11) NOT NULL DEFAULT '0',
  `admin` enum('nista','admin') NOT NULL DEFAULT 'nista',
  `zadnji_post` int(11) NOT NULL DEFAULT '0',
  `odobrenje` tinyint(2) NOT NULL DEFAULT '1',
  `slika` int(11) DEFAULT '0',
  `avatar` varchar(11) NOT NULL,
  `akcija` int(11) DEFAULT NULL,
  `info` text NOT NULL,
  `banned` int(11) NOT NULL DEFAULT '0',
  `banned_expire` int(11) NOT NULL,
  `is_banned` tinyint(1) NOT NULL,
  `who_banned` varchar(250) DEFAULT NULL,
  `zadnji_reset` varchar(250) DEFAULT NULL,
  `banned_reason` varchar(255) NOT NULL,
  `bodova` int(11) NOT NULL DEFAULT '0',
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `nagradjen` tinyint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `korisnici_nagrada`
--

CREATE TABLE `korisnici_nagrada` (
  `korisnik_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `bodova` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ld`
--

CREATE TABLE `ld` (
  `vrsta` enum('normala') NOT NULL,
  `kad` int(11) NOT NULL,
  `od_id` int(11) NOT NULL DEFAULT '2',
  `ip` varchar(255) NOT NULL,
  `kolko` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `log`
--

CREATE TABLE `log` (
  `logid` int(10) UNSIGNED NOT NULL,
  `clientid` int(10) UNSIGNED NOT NULL,
  `serverid` int(10) UNSIGNED NOT NULL,
  `boxid` int(10) UNSIGNED NOT NULL,
  `adminid` int(11) NOT NULL,
  `message` text NOT NULL,
  `name` text NOT NULL,
  `ip` text NOT NULL,
  `uniquecookie` varchar(32) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `log`
--

INSERT INTO `log` (`logid`, `clientid`, `serverid`, `boxid`, `adminid`, `message`, `name`, `ip`, `uniquecookie`, `timestamp`) VALUES
(1, 2, 27, 0, 0, 'Server Added: <a href=\"serversummary.php?id=27\">test</a> to <a href=\"clientsummary.php?id=2\">Tomislav Zivkovic</a> (Order)', 'Tomislav', '178.209.6.24', '68d61be5ad8609cd686cfcb3504ce2db', '2019-04-02 14:52:13'),
(2, 2, 0, 0, 1, 'Client Edited: <a href=\"clientsummary.php?id=2\">Tomislav Zivkovic</a> (Admin)', 'Tomislav Zivkovic', '178.209.6.24', '68d61be5ad8609cd686cfcb3504ce2db', '2019-04-02 14:53:13'),
(3, 2, 0, 0, 1, 'Client Edited: <a href=\"clientsummary.php?id=2\">Tomislav Zivkovic</a> (Admin)', 'Tomislav Zivkovic', '178.209.6.24', '68d61be5ad8609cd686cfcb3504ce2db', '2019-04-02 14:57:48'),
(4, 2, 0, 0, 1, 'Payment (0.976 din) removed from: <a href=\"clientsummary.php?id=2\">Tomislav Zivkovic</a> (Admin)', 'Tomislav Zivkovic', '62.216.206.58', '2ee485bd69cea3e82a0408147f0e22d2', '2019-04-02 15:08:32'),
(5, 3, 18, 1, 1, 'Server Restarted: <a href=\"serversummary.php?id=18\">Revolution Gaming |24/7|</a> (Admin)', 'Tomislav Zivkovic', '178.209.6.24', '68d61be5ad8609cd686cfcb3504ce2db', '2019-04-02 15:09:25'),
(6, 2, 27, 0, 1, 'Server Deleted: test on <a href=\"boxsummary.php?id=\"></a> from <a href=\"clientsummary.php?id=2\">Tomislav Zivkovic</a>', 'Tomislav Zivkovic', '62.216.206.58', '2ee485bd69cea3e82a0408147f0e22d2', '2019-04-02 15:09:56'),
(7, 2, 0, 0, 1, 'New payment 10 &euro; for: <a href=\"clientsummary.php?id=2\">Tomislav Zivkovic</a> (Admin)', 'Tomislav Zivkovic', '62.216.206.58', '2ee485bd69cea3e82a0408147f0e22d2', '2019-04-02 15:12:29'),
(8, 2, 0, 0, 1, 'Payment (10 &euro;) removed from: <a href=\"clientsummary.php?id=2\">Tomislav Zivkovic</a> (Admin)', 'Tomislav Zivkovic', '62.216.206.58', '2ee485bd69cea3e82a0408147f0e22d2', '2019-04-02 15:13:33'),
(9, 2, 0, 0, 1, 'New payment 10 &euro; for: <a href=\"clientsummary.php?id=2\">Tomislav Zivkovic</a> (Admin)', 'Tomislav Zivkovic', '62.216.206.58', '2ee485bd69cea3e82a0408147f0e22d2', '2019-04-02 15:14:34'),
(10, 3, 18, 1, 0, 'Server Restarted: <a href=\"serversummary.php?id=18\">Revolution Gaming |24/7|</a> (Client)', 'Djomla Veljkovic', '178.20.206.8', '714866307a73b9c65d7a27d2b4c5ded3', '2019-04-05 10:49:13'),
(11, 3, 18, 1, 0, 'Server Restarted: <a href=\"serversummary.php?id=18\">Revolution Gaming |24/7|</a> (Client)', 'Djomla Veljkovic', '178.20.206.8', '714866307a73b9c65d7a27d2b4c5ded3', '2019-04-05 10:56:16');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logerror`
--

CREATE TABLE `logerror` (
  `logid` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `uniquecookie` varchar(32) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logip`
--

CREATE TABLE `logip` (
  `logid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL,
  `hostname` text NOT NULL,
  `uniquecookie` text NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `logip`
--

INSERT INTO `logip` (`logid`, `clientid`, `adminid`, `ip`, `hostname`, `uniquecookie`, `time`) VALUES
(1, 1, 0, '62.216.206.58', 'ppp-62-216-206-58.dynamic.mnet-online.de', '10595cc027eb12318f2d34d0c2da044d', 1554213961),
(2, 1, 0, '5.39.85.81', 'crawl05.lp.007ac9.net', '', 1554214354),
(3, 2, 0, '178.209.6.24', '178.209.6.24', '68d61be5ad8609cd686cfcb3504ce2db', 1554214481),
(4, 1, 0, '178.209.6.24', '178.209.6.24', '68d61be5ad8609cd686cfcb3504ce2db', 1554214486),
(5, 2, 0, '178.209.6.24', '178.209.6.24', '68d61be5ad8609cd686cfcb3504ce2db', 1554216210),
(6, 2, 0, '178.209.6.24', '178.209.6.24', 'dfd11e43a4936ed589d607eb68ac2492', 1554216335),
(7, 2, 0, '178.209.6.24', '178.209.6.24', '68d61be5ad8609cd686cfcb3504ce2db', 1554216689),
(8, 1, 0, '178.209.6.24', '178.209.6.24', '68d61be5ad8609cd686cfcb3504ce2db', 1554217350),
(9, 2, 0, '178.209.6.24', '178.209.6.24', '68d61be5ad8609cd686cfcb3504ce2db', 1554217443),
(10, 2, 0, '62.216.206.58', 'ppp-62-216-206-58.dynamic.mnet-online.de', '2ee485bd69cea3e82a0408147f0e22d2', 1554217556),
(11, 1, 0, '87.116.177.74', '87.116.177.74', '042edaf8829d234eedd57526c7ff98df', 1554220795),
(12, 2, 0, '62.216.206.58', 'ppp-62-216-206-58.dynamic.mnet-online.de', '2ee485bd69cea3e82a0408147f0e22d2', 1554220864),
(13, 1, 0, '87.116.177.74', '87.116.177.74', '042edaf8829d234eedd57526c7ff98df', 1554226021),
(14, 1, 0, '87.116.177.74', '87.116.177.74', '042edaf8829d234eedd57526c7ff98df', 1554233280),
(15, 1, 0, '87.116.177.74', '87.116.177.74', '042edaf8829d234eedd57526c7ff98df', 1554299992),
(16, 2, 0, '62.216.206.58', 'ppp-62-216-206-58.dynamic.mnet-online.de', '2ee485bd69cea3e82a0408147f0e22d2', 1554313683),
(17, 1, 0, '87.116.177.74', '87.116.177.74', '042edaf8829d234eedd57526c7ff98df', 1554319636),
(18, 1, 0, '54.36.148.202', 'ip-54-36-148-202.a.ahrefs.com', '', 1554332624),
(19, 1, 0, '193.217.189.172', 'm193-217-189-172.cust.tele2.hr', '97273170338a6cac85bfe317d223dc11', 1554391115),
(20, 1, 0, '178.20.206.8', '178.20.206.8', '01717a489c7431b34443294bc4b009c0', 1554392220),
(21, 3, 0, '80.187.116.15', 'tmo-116-15.customers.d1-online.com', '1c9122ccfeffd6abad8c2bc86be77e39', 1554392976),
(22, 1, 0, '80.187.116.15', 'tmo-116-15.customers.d1-online.com', '1c9122ccfeffd6abad8c2bc86be77e39', 1554393102),
(23, 1, 0, '87.116.177.74', '87.116.177.74', '4156db7676e205d5da690e6d3d9f271d', 1554395931),
(24, 3, 0, '178.20.206.8', '178.20.206.8', '714866307a73b9c65d7a27d2b4c5ded3', 1554457244),
(25, 2, 0, '178.209.6.24', '178.209.6.24', '68d61be5ad8609cd686cfcb3504ce2db', 1554475157),
(26, 1, 0, '178.209.6.24', '178.209.6.24', '68d61be5ad8609cd686cfcb3504ce2db', 1554475165),
(27, 1, 0, '178.221.84.53', '178-221-84-53.dynamic.isp.telekom.rs', 'e3d4e49054c06014acb59d4971c03d2b', 1554551524),
(28, 2, 0, '62.216.206.58', 'ppp-62-216-206-58.dynamic.mnet-online.de', '2ee485bd69cea3e82a0408147f0e22d2', 1554564669),
(29, 1, 0, '178.221.84.53', '178-221-84-53.dynamic.isp.telekom.rs', 'e3d4e49054c06014acb59d4971c03d2b', 1554576139),
(30, 2, 0, '62.216.206.58', 'ppp-62-216-206-58.dynamic.mnet-online.de', '2ee485bd69cea3e82a0408147f0e22d2', 1554659670),
(31, 1, 0, '178.209.6.24', '178.209.6.24', '68d61be5ad8609cd686cfcb3504ce2db', 1554666867),
(32, 3, 0, '185.37.27.17', '185-37-27-17.dynamic.vipmobile.rs', 'f8cf10d8595d07d47bdd10bbf733adbc', 1554728578),
(33, 3, 0, '77.243.31.80', '77-243-31-80.dynamic.vipmobile.rs', 'f8cf10d8595d07d47bdd10bbf733adbc', 1554740679),
(34, 1, 0, '87.116.179.209', '87.116.179.209', '042edaf8829d234eedd57526c7ff98df', 1554761712),
(35, 3, 0, '77.243.29.198', '77-243-29-198.dynamic.vipmobile.rs', 'fcd789158456cae057dd70f1be10f88a', 1554820744),
(36, 3, 0, '95.86.57.74', '95.86.57.74', '32505f3f07dc5a522eeb24288b1b1927', 1554821717),
(37, 3, 0, '79.226.13.106', 'p4FE20D6A.dip0.t-ipconnect.de', '1c9122ccfeffd6abad8c2bc86be77e39', 1554831331),
(38, 3, 0, '185.37.26.131', '185-37-26-131.dynamic.vipmobile.rs', 'fcd789158456cae057dd70f1be10f88a', 1554899007),
(39, 3, 0, '185.37.26.131', '185-37-26-131.dynamic.vipmobile.rs', 'fcd789158456cae057dd70f1be10f88a', 1554902751),
(40, 1, 0, '80.110.121.150', '80-110-121-150.cgn.dynamic.surfer.at', '6d6184aa926403ef2b36fa3660f662a0', 1554940444),
(41, 1, 0, '37.187.56.81', 'crawl17.lp.007ac9.net', '', 1555150938),
(42, 3, 0, '178.20.206.8', '178.20.206.8', '57dab00d462f2dcaa7693a3822a0f557', 1555168003),
(43, 1, 0, '79.126.141.83', '79.126.141.83', '87fd2f7bf4032071432bd5b9204bb45c', 1555178012),
(44, 1, 0, '80.110.121.150', '80-110-121-150.cgn.dynamic.surfer.at', '6d6184aa926403ef2b36fa3660f662a0', 1555186958),
(45, 1, 0, '87.116.179.209', '87.116.179.209', '042edaf8829d234eedd57526c7ff98df', 1555191643),
(46, 1, 0, '38.77.216.7', '38.77.216.7', '', 1555227047),
(47, 1, 0, '46.19.230.8', '46.19.230.8', '36b5f437072544ccd04c7d0f6acb3fc7', 1555239849);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mail`
--

CREATE TABLE `mail` (
  `id` int(11) NOT NULL,
  `fromname` varchar(256) NOT NULL,
  `fromemail` varchar(256) NOT NULL,
  `subject` varchar(256) NOT NULL,
  `body` text NOT NULL,
  `date` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `message`
--

CREATE TABLE `message` (
  `messageid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `message`
--

INSERT INTO `message` (`messageid`, `clientid`, `subject`, `message`, `time`) VALUES
(1271, 0, 'Panel', 'Dobrodosli u svoj GamePanel\r\n\r\nGamePanel je u fazi Beta \r\n\r\nZa svaki bag kontaktirajte nas ili posaljite poruku na admin@dunav-hosting.com', 1553893078);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `newsletter`
--

CREATE TABLE `newsletter` (
  `nid` int(11) NOT NULL,
  `email` varchar(32) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `newsletter`
--

INSERT INTO `newsletter` (`nid`, `email`, `time`) VALUES
(1, 'skendzic.mladen@yahoo.co.uk', 1461422745),
(2, 'jedoksicdjordje99@gmail.com', 1461678225),
(3, 'sandraleopard70@gmail.com', 1462204771),
(4, 'giannakisp007@hotmail.com', 1462722462),
(5, 'c1868142@trbvn.com', 1462794007),
(6, 'aleksandrapanov@hotmail.com', 1462986648),
(7, 'fisnik-boy07@hotmail.com', 1463049390),
(8, 'Babahcg@gmail.com', 1463054503),
(9, 'i36517@trbvo.com', 1463134952),
(10, 'frocraslef@thraml.com', 1463135064),
(11, 'praberahop@thraml.com', 1463135188),
(12, 'sample@email.tst', 1463891035),
(13, 'aleksandar.blalal@rdc.co.me', 1464705410),
(14, 'radovanresavac@gmail.com', 1465641242),
(15, 'martin_ilievski2000@hotmail.com', 1465759468),
(16, 'boskoski.don@gmail.com', 1465759476),
(17, 'gkalagkala@icloud.com', 1468941540),
(18, 'pedjablazer@gmail.com', 1469667325),
(19, 'mdt.lutovac@gmail.com', 1469816849),
(20, 'Silasilic12@gmail.com', 1472845652),
(21, 'Jovanovicsgoran@gmail.com', 1474522424),
(22, 'srkiamet@gmail.com', 1476301781),
(23, 'vanjaizpetarpan@gmail.com', 1479411522),
(24, 'Sarssars@gmail.com', 1481734936),
(25, 'sheikhmamunkhaled@yahoo.com', 1482516917),
(26, 'Metal4ever876@gmail.com', 1482680995);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `online`
--

CREATE TABLE `online` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `logged` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `idle` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(255) NOT NULL,
  `guest` tinyint(1) UNSIGNED NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `orders`
--

CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `serverid` int(11) NOT NULL,
  `gameid` int(11) NOT NULL,
  `couponid` int(11) NOT NULL DEFAULT '0',
  `refid` int(11) NOT NULL,
  `method` varchar(32) NOT NULL,
  `slots` int(11) NOT NULL,
  `price` float(5,2) NOT NULL,
  `text` text NOT NULL,
  `uplatnice` text NOT NULL,
  `body` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` int(11) NOT NULL,
  `transactionId` int(11) NOT NULL DEFAULT '0',
  `modid` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `orders`
--

INSERT INTO `orders` (`orderid`, `clientid`, `serverid`, `gameid`, `couponid`, `refid`, `method`, `slots`, `price`, `text`, `uplatnice`, `body`, `ip`, `time`, `transactionId`, `modid`) VALUES
(8, 8, 15, 11, 0, 0, '', 91, 0.00, 'Lite - Germany, Frankfurt -- Team Speak 3 -- 91 slots -- 0 din -- Default<br /><br /><b>NAPOMENA KLIJENTA:</b><br />test\n    <br /><b>Iznos uplate:</b> 0\n    <br /><b>Uplatilac:</b> 0\n    <br /><b>Datum uplate:</b> 0\n    <br /><b>Uplatnice:</b> 0\n    ', '', 'PoÅ¡tovani <strong>Roksanda Alizoti</strong>,\r\n\r\nkontaktiramo Vas u vezi VaÅ¡e porudÅ¾bine <strong>Team Speak 3</strong> game servera sa <strong>91</strong> slotova(slota) na <strong>Lite - Germany, Frankfurt</strong> lokaciji.\r\nDa bi VaÅ¡ server bio aktiviran potrebno je da uplatite sumu navedenu ispod i poÅ¡aljete nam sliku overene uplatnice.\r\nMoÅ¾ete koritstiti i elektronsko plaÄ‡anje.\r\n\r\nIznos za uplatu: <strong>0 din</strong>.\r\nUplatilac: <strong>Roksanda Alizoti</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>Mladen Veljkovic</strong>\r\nIznos: <strong>0 din</strong>\r\nRacun primaoca: <strong>115-0381631733569-39</strong>\r\nPoziv na broj: <strong>19-8-003</strong>\r\nBanka: bilo koja\r\n\r\nNakon uplate ulogujte se na Game Panel na adresi www.dunav-hosting.com i na stranici\r\nservera pronaÄ‘ite VaÅ¡u porudÅ¾benicu i kliknite na dugme podigni server.\r\nPopunite obrazac i VaÅ¡ server Ä‡e biti aktiviran ubrzo nakon toga a najviÅ¡e za 24h.\r\n\r\nSrdaÄan pozdrav.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n\r\n---ENGLISH---\r\n\r\nHello <strong>Roksanda Alizoti</strong>,\r\n\r\nYou ordered <strong>Team Speak 3</strong> server with <strong>91</strong> slots on location <strong>Lite - Germany, Frankfurt</strong>.\r\n\r\nNext step is to write this info down or print it and go to post office or bank to make a payment for <strong>0 din</strong>. \r\nYou can also use online banking.\r\n\r\nUplatilac: <strong>Roksanda Alizoti</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>Mladen Veljkovic</strong>\r\nIznos: <strong>0 din</strong>\r\nRacun primaoca: <strong>115-0381631733569-39</strong>\r\nPoziv na broj: <strong>19-8-003</strong>\r\nBanka: bilo koja\r\n\r\nWhen you pay in bank, you will get a receipt and you need to take a picture of it or scan it.\r\nThen go to www.dunav-hosting.com and click SERVERS and you will have an option SEND REQUEST\r\nThere you will enter server name and upload picture of payment and when you finish you will get server as soon as possible.\r\n\r\nGreeting.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n', '80.110.121.138', 1553034633, 0, 0),
(6, 2, 14, 7, 0, 0, '', 12, 450.00, 'Lite - Germany, Frankfurt -- Counter Strike 1.6 Clan War -- 12 slots -- 450 din -- Clan War<br /><br /><b>NAPOMENA KLIJENTA:</b><br />awdsw\n    <br /><b>Iznos uplate:</b> 15\n    <br /><b>Uplatilac:</b> awadw aww\n    <br /><b>Datum uplate:</b> 17.03.2019\n    <br /><b>Uplatnice:</b> asdww\n    ', '', 'PoÅ¡tovani <strong>Tomislav Zivkovic</strong>,\r\n\r\nkontaktiramo Vas u vezi VaÅ¡e porudÅ¾bine <strong>Counter Strike 1.6 Clan War</strong> game servera sa <strong>12</strong> slotova(slota) na <strong>Lite - Germany, Frankfurt</strong> lokaciji.\r\nDa bi VaÅ¡ server bio aktiviran potrebno je da uplatite sumu navedenu ispod i poÅ¡aljete nam sliku overene uplatnice.\r\nMoÅ¾ete koritstiti i elektronsko plaÄ‡anje.\r\n\r\nIznos za uplatu: <strong>450 din</strong>.\r\nUplatilac: <strong>Tomislav Zivkovic</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>Mladen Veljkovic</strong>\r\nIznos: <strong>450 din</strong>\r\nRacun primaoca: <strong>115-0381631733569-39</strong>\r\nPoziv na broj: <strong>17-2-003</strong>\r\nBanka: bilo koja\r\n\r\nNakon uplate ulogujte se na Game Panel na adresi www.dunav-hosting.com i na stranici\r\nservera pronaÄ‘ite VaÅ¡u porudÅ¾benicu i kliknite na dugme podigni server.\r\nPopunite obrazac i VaÅ¡ server Ä‡e biti aktiviran ubrzo nakon toga a najviÅ¡e za 24h.\r\n\r\nSrdaÄan pozdrav.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n\r\n---ENGLISH---\r\n\r\nHello <strong>Tomislav Zivkovic</strong>,\r\n\r\nYou ordered <strong>Counter Strike 1.6 Clan War</strong> server with <strong>12</strong> slots on location <strong>Lite - Germany, Frankfurt</strong>.\r\n\r\nNext step is to write this info down or print it and go to post office or bank to make a payment for <strong>450 din</strong>. \r\nYou can also use online banking.\r\n\r\nUplatilac: <strong>Tomislav Zivkovic</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>Mladen Veljkovic</strong>\r\nIznos: <strong>450 din</strong>\r\nRacun primaoca: <strong>115-0381631733569-39</strong>\r\nPoziv na broj: <strong>17-2-003</strong>\r\nBanka: bilo koja\r\n\r\nWhen you pay in bank, you will get a receipt and you need to take a picture of it or scan it.\r\nThen go to www.dunav-hosting.com and click SERVERS and you will have an option SEND REQUEST\r\nThere you will enter server name and upload picture of payment and when you finish you will get server as soon as possible.\r\n\r\nGreeting.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n', '79.224.207.188', 1552847577, 0, 0),
(12, 2, 27, 1, 0, 0, '', 30, 999.99, 'Lite - Germany, Frankfurt -- Counter-Strike 1.6 -- 30 slots -- 1125 din -- Public\n    <br /><b>Iznos uplate:</b> 10\n    <br /><b>Uplatilac:</b> te te\n    <br /><b>Datum uplate:</b> tete\n    <br /><b>Uplatnice:</b> teet\n    ', '', 'PoÅ¡tovani <strong>Tomislav Zivkovic</strong>,\r\n\r\nkontaktiramo Vas u vezi VaÅ¡e porudÅ¾bine <strong>Counter-Strike 1.6</strong> game servera sa <strong>30</strong> slotova(slota) na <strong>Lite - Germany, Frankfurt</strong> lokaciji.\r\nDa bi VaÅ¡ server bio aktiviran potrebno je da uplatite sumu navedenu ispod i poÅ¡aljete nam sliku overene uplatnice.\r\nMoÅ¾ete koritstiti i elektronsko plaÄ‡anje.\r\n\r\nIznos za uplatu: <strong>1125 din</strong>.\r\nUplatilac: <strong>Tomislav Zivkovic</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>Mladen Veljkovic</strong>\r\nIznos: <strong>1125 din</strong>\r\nRacun primaoca: <strong>115-0381631733569-39</strong>\r\nPoziv na broj: <strong>2-2-004</strong>\r\nBanka: bilo koja\r\n\r\nNakon uplate ulogujte se na Game Panel na adresi www.dunav-hosting.com i na stranici\r\nservera pronaÄ‘ite VaÅ¡u porudÅ¾benicu i kliknite na dugme podigni server.\r\nPopunite obrazac i VaÅ¡ server Ä‡e biti aktiviran ubrzo nakon toga a najviÅ¡e za 24h.\r\n\r\nSrdaÄan pozdrav.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n\r\n---ENGLISH---\r\n\r\nHello <strong>Tomislav Zivkovic</strong>,\r\n\r\nYou ordered <strong>Counter-Strike 1.6</strong> server with <strong>30</strong> slots on location <strong>Lite - Germany, Frankfurt</strong>.\r\n\r\nNext step is to write this info down or print it and go to post office or bank to make a payment for <strong>1125 din</strong>. \r\nYou can also use online banking.\r\n\r\nUplatilac: <strong>Tomislav Zivkovic</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>Mladen Veljkovic</strong>\r\nIznos: <strong>1125 din</strong>\r\nRacun primaoca: <strong>115-0381631733569-39</strong>\r\nPoziv na broj: <strong>2-2-004</strong>\r\nBanka: bilo koja\r\n\r\nWhen you pay in bank, you will get a receipt and you need to take a picture of it or scan it.\r\nThen go to www.dunav-hosting.com and click SERVERS and you will have an option SEND REQUEST\r\nThere you will enter server name and upload picture of payment and when you finish you will get server as soon as possible.\r\n\r\nGreeting.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n', '178.209.6.24', 1554216703, 0, 0),
(10, 10, 16, 11, 0, 0, '', 31, 0.00, 'Lite - Germany, Frankfurt -- Team Speak 3 -- 31 slots -- 0 din -- Default<br /><br /><b>NAPOMENA KLIJENTA:</b><br />1232\n    <br /><b>Iznos uplate:</b> 15\n    <br /><b>Uplatilac:</b> Vane Trajkov\n    <br /><b>Datum uplate:</b> 22.03.2019\n    <br /><b>Uplatnice:</b> ASDASW\n    ', '', 'PoÅ¡tovani <strong>Vane Trajkov</strong>,\r\n\r\nkontaktiramo Vas u vezi VaÅ¡e porudÅ¾bine <strong>Team Speak 3</strong> game servera sa <strong>31</strong> slotova(slota) na <strong>Lite - Germany, Frankfurt</strong> lokaciji.\r\nDa bi VaÅ¡ server bio aktiviran potrebno je da uplatite sumu navedenu ispod i poÅ¡aljete nam sliku overene uplatnice.\r\nMoÅ¾ete koritstiti i elektronsko plaÄ‡anje.\r\n\r\nIznos za uplatu: <strong>0 din</strong>.\r\nUplatilac: <strong>Vane Trajkov</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>Mladen Veljkovic</strong>\r\nIznos: <strong>0 din</strong>\r\nRacun primaoca: <strong>115-0381631733569-39</strong>\r\nPoziv na broj: <strong>22-10-003</strong>\r\nBanka: bilo koja\r\n\r\nNakon uplate ulogujte se na Game Panel na adresi www.dunav-hosting.com i na stranici\r\nservera pronaÄ‘ite VaÅ¡u porudÅ¾benicu i kliknite na dugme podigni server.\r\nPopunite obrazac i VaÅ¡ server Ä‡e biti aktiviran ubrzo nakon toga a najviÅ¡e za 24h.\r\n\r\nSrdaÄan pozdrav.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n\r\n---ENGLISH---\r\n\r\nHello <strong>Vane Trajkov</strong>,\r\n\r\nYou ordered <strong>Team Speak 3</strong> server with <strong>31</strong> slots on location <strong>Lite - Germany, Frankfurt</strong>.\r\n\r\nNext step is to write this info down or print it and go to post office or bank to make a payment for <strong>0 din</strong>. \r\nYou can also use online banking.\r\n\r\nUplatilac: <strong>Vane Trajkov</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>Mladen Veljkovic</strong>\r\nIznos: <strong>0 din</strong>\r\nRacun primaoca: <strong>115-0381631733569-39</strong>\r\nPoziv na broj: <strong>22-10-003</strong>\r\nBanka: bilo koja\r\n\r\nWhen you pay in bank, you will get a receipt and you need to take a picture of it or scan it.\r\nThen go to www.dunav-hosting.com and click SERVERS and you will have an option SEND REQUEST\r\nThere you will enter server name and upload picture of payment and when you finish you will get server as soon as possible.\r\n\r\nGreeting.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n', '79.226.23.44', 1553263783, 0, 0),
(11, 10, 17, 1, 0, 0, '', 12, 999.99, 'Lite - Germany, Frankfurt -- Counter-Strike 1.6 -- 12 slots -- 2430 din --<strong>Izabran ugovor od 6 meseci</strong> -- Public<br /><br /><b>NAPOMENA KLIJENTA:</b><br />asdw\n    <br /><b>Iznos uplate:</b> 15\n    <br /><b>Uplatilac:</b> Vane Trajkov\n    <br /><b>Datum uplate:</b> 22.03.2019\n    <br /><b>Uplatnice:</b> asdww\n    ', '', 'PoÅ¡tovani <strong>Vane Trajkov</strong>,\r\n\r\nkontaktiramo Vas u vezi VaÅ¡e porudÅ¾bine <strong>Counter-Strike 1.6</strong> game servera sa <strong>12</strong> slotova(slota) na <strong>Lite - Germany, Frankfurt</strong> lokaciji.\r\nDa bi VaÅ¡ server bio aktiviran potrebno je da uplatite sumu navedenu ispod i poÅ¡aljete nam sliku overene uplatnice.\r\nMoÅ¾ete koritstiti i elektronsko plaÄ‡anje.\r\n\r\nIznos za uplatu: <strong>2430 din</strong>.\r\nUplatilac: <strong>Vane Trajkov</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>Mladen Veljkovic</strong>\r\nIznos: <strong>2430 din</strong>\r\nRacun primaoca: <strong>115-0381631733569-39</strong>\r\nPoziv na broj: <strong>22-10-003</strong>\r\nBanka: bilo koja\r\n\r\nNakon uplate ulogujte se na Game Panel na adresi www.dunav-hosting.com i na stranici\r\nservera pronaÄ‘ite VaÅ¡u porudÅ¾benicu i kliknite na dugme podigni server.\r\nPopunite obrazac i VaÅ¡ server Ä‡e biti aktiviran ubrzo nakon toga a najviÅ¡e za 24h.\r\n\r\nSrdaÄan pozdrav.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n\r\n---ENGLISH---\r\n\r\nHello <strong>Vane Trajkov</strong>,\r\n\r\nYou ordered <strong>Counter-Strike 1.6</strong> server with <strong>12</strong> slots on location <strong>Lite - Germany, Frankfurt</strong>.\r\n\r\nNext step is to write this info down or print it and go to post office or bank to make a payment for <strong>2430 din</strong>. \r\nYou can also use online banking.\r\n\r\nUplatilac: <strong>Vane Trajkov</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>Mladen Veljkovic</strong>\r\nIznos: <strong>2430 din</strong>\r\nRacun primaoca: <strong>115-0381631733569-39</strong>\r\nPoziv na broj: <strong>22-10-003</strong>\r\nBanka: bilo koja\r\n\r\nWhen you pay in bank, you will get a receipt and you need to take a picture of it or scan it.\r\nThen go to www.dunav-hosting.com and click SERVERS and you will have an option SEND REQUEST\r\nThere you will enter server name and upload picture of payment and when you finish you will get server as soon as possible.\r\n\r\nGreeting.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n', '79.226.23.44', 1553270997, 0, 0),
(13, 2, 0, 1, 0, 0, '', 32, 999.99, 'Lite - Germany, Frankfurt -- Counter-Strike 1.6 -- 32 slots -- 1200 din', '', 'PoÅ¡tovani <strong>Tomislav Zivkovic</strong>,\r\n\r\nkontaktiramo Vas u vezi VaÅ¡e porudÅ¾bine <strong>Counter-Strike 1.6</strong> game servera sa <strong>32</strong> slotova(slota) na <strong>Lite - Germany, Frankfurt</strong> lokaciji.\r\nDa bi VaÅ¡ server bio aktiviran potrebno je da uplatite sumu navedenu ispod i poÅ¡aljete nam sliku overene uplatnice.\r\nMoÅ¾ete koritstiti i elektronsko plaÄ‡anje.\r\n\r\nIznos za uplatu: <strong>1200 din</strong>.\r\nUplatilac: <strong>Tomislav Zivkovic</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>Mladen Veljkovic</strong>\r\nIznos: <strong>1200 din</strong>\r\nRacun primaoca: <strong>115-0381631733569-39</strong>\r\nPoziv na broj: <strong>2-2-004</strong>\r\nBanka: bilo koja\r\n\r\nNakon uplate ulogujte se na Game Panel na adresi www.dunav-hosting.com i na stranici\r\nservera pronaÄ‘ite VaÅ¡u porudÅ¾benicu i kliknite na dugme podigni server.\r\nPopunite obrazac i VaÅ¡ server Ä‡e biti aktiviran ubrzo nakon toga a najviÅ¡e za 24h.\r\n\r\nSrdaÄan pozdrav.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n\r\n---ENGLISH---\r\n\r\nHello <strong>Tomislav Zivkovic</strong>,\r\n\r\nYou ordered <strong>Counter-Strike 1.6</strong> server with <strong>32</strong> slots on location <strong>Lite - Germany, Frankfurt</strong>.\r\n\r\nNext step is to write this info down or print it and go to post office or bank to make a payment for <strong>1200 din</strong>. \r\nYou can also use online banking.\r\n\r\nUplatilac: <strong>Tomislav Zivkovic</strong>\r\nSvrha uplate: <strong>Internet usluga</strong>\r\nPrimalac: <strong>Mladen Veljkovic</strong>\r\nIznos: <strong>1200 din</strong>\r\nRacun primaoca: <strong>115-0381631733569-39</strong>\r\nPoziv na broj: <strong>2-2-004</strong>\r\nBanka: bilo koja\r\n\r\nWhen you pay in bank, you will get a receipt and you need to take a picture of it or scan it.\r\nThen go to www.dunav-hosting.com and click SERVERS and you will have an option SEND REQUEST\r\nThere you will enter server name and upload picture of payment and when you finish you will get server as soon as possible.\r\n\r\nGreeting.\r\n\r\n- Strong-Hosting\r\n- www.dunav-hosting.com\r\n', '178.209.6.24', 1554216815, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order_country`
--

CREATE TABLE `order_country` (
  `countryid` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `currency` varchar(32) NOT NULL,
  `odnos` varchar(32) NOT NULL,
  `racunid` int(11) NOT NULL,
  `aid` int(11) NOT NULL COMMENT 'Novi racun iz billing_account za novi panel i sajt',
  `disabled` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `order_country`
--

INSERT INTO `order_country` (`countryid`, `name`, `currency`, `odnos`, `racunid`, `aid`, `disabled`) VALUES
(1, 'Srbija', 'din', '100', 1, 1, 0),
(19, 'Crna Gora', 'EUR', '1', 19, 19, 0),
(18, 'Bosna i Hercegovina', 'KM', '2', 18, 18, 0),
(17, 'Republika Srpska', 'KM', '2', 18, 18, 0),
(20, 'Hrvatska', 'kn', '8', 20, 20, 0),
(22, 'Makedonija', 'Ð´ÐµÐ½', '60', 22, 22, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order_games`
--

CREATE TABLE `order_games` (
  `gameid` int(11) NOT NULL,
  `panelgameid` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `order` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `slotprice` varchar(32) NOT NULL,
  `minslots` int(11) NOT NULL,
  `maxslots` int(11) NOT NULL,
  `slotincrement` int(11) NOT NULL DEFAULT '2',
  `sameprice` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `order_games`
--

INSERT INTO `order_games` (`gameid`, `panelgameid`, `name`, `order`, `active`, `slotprice`, `minslots`, `maxslots`, `slotincrement`, `sameprice`) VALUES
(9, 29, 'Counter Strike 1.6 EPS', 2, 0, '0.5', 12, 14, 2, 1),
(10, 30, 'Minecraft', 17, 1, '0.29', 8, 120, 8, 0),
(11, 13, 'Team Speak 3', 1, 1, '0.1', 1, 100, 10, 0),
(12, 34, 'Call of Duty Modern Warfare 3', 10, 0, '0.6', 12, 32, 2, 0),
(6, 12, 'San Andreas Multiplayer', 16, 1, '0.2', 50, 200, 50, 0),
(7, 39, 'Counter Strike 1.6 Clan War', 2, 1, '0.375', 12, 14, 2, 0),
(8, 25, 'Counter Strike Source Protocol 7', 4, 0, '0.25', 12, 64, 2, 0),
(3, 10, 'Call of Duty 2', 7, 0, '0.25', 12, 32, 2, 0),
(4, 8, 'Call of Duty 4', 8, 0, '0.25', 12, 64, 2, 0),
(5, 23, 'Half-Life', 14, 0, '0.25', 12, 32, 2, 0),
(1, 2, 'Counter-Strike 1.6', 1, 1, '0.375', 12, 32, 2, 0),
(2, 1, 'Counter Strike Source Orangebox', 3, 0, '0.25', 12, 64, 2, 0),
(13, 4, 'Team Fortress 2', 19, 0, '0.5', 12, 32, 2, 0),
(14, 26, 'Left 4 Dead 2', 20, 0, '0.5', 8, 8, 2, 0),
(15, 37, 'Counter Strike Global Offensive', 4, 0, '0.5', 12, 32, 2, 0),
(16, 33, 'Counter Strike Promod', 6, 0, '0.5', 12, 32, 2, 0),
(17, 46, 'FDL', 6, 1, '2.5', 1, 1, 2, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order_game_mods`
--

CREATE TABLE `order_game_mods` (
  `modid` int(11) NOT NULL,
  `gameid` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `order_game_mods`
--

INSERT INTO `order_game_mods` (`modid`, `gameid`, `name`) VALUES
(1, 1, 'Public'),
(21, 8, 'Public'),
(3, 2, 'Public'),
(4, 3, 'Public'),
(5, 4, 'Public'),
(6, 2, 'War'),
(7, 3, 'War'),
(8, 4, 'War'),
(9, 1, 'DeathMatch'),
(10, 1, 'GunGame'),
(11, 1, 'DeathRun'),
(12, 1, 'Zombie - Biohazard'),
(13, 1, 'Surf'),
(14, 1, 'HnS'),
(15, 1, 'Knife'),
(16, 1, 'Paintball'),
(17, 1, 'AWP'),
(18, 5, 'Default'),
(19, 6, 'Default'),
(20, 7, 'Clan War'),
(22, 8, 'War'),
(23, 1, 'Zombie Plague'),
(24, 1, 'CoD mod'),
(25, 1, 'Jailbreak'),
(26, 1, 'KZ mod'),
(27, 1, 'Superhero'),
(29, 30, 'Spigot'),
(30, 30, 'Bukkit');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order_location`
--

CREATE TABLE `order_location` (
  `locationid` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `priceMultiply` float NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `order_location`
--

INSERT INTO `order_location` (`locationid`, `name`, `priceMultiply`) VALUES
(1, 'Lite - Germany, Frankfurt', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order_racun`
--

CREATE TABLE `order_racun` (
  `racunid` int(11) NOT NULL,
  `primalac` varchar(100) NOT NULL,
  `brojracuna` varchar(100) NOT NULL,
  `link` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `order_racun`
--

INSERT INTO `order_racun` (`racunid`, `primalac`, `brojracuna`, `link`) VALUES
(1, 'Mladen Veljkovic', '115-0381631733569-39', 'http://dunav-hosting.com/uplatnica'),
(2, 'Mirza Spahic', '5352748233652715', 'http://dunav-hosting.com/uplatnica'),
(3, 'COMING SOON', 'COMING SOON', 'COMING SOON'),
(4, 'COMING SOON', 'COMING SOON', 'COMING SOON'),
(5, 'COMING SOON', 'COMING SOON', 'COMING SOON');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `passwordresetrequests`
--

CREATE TABLE `passwordresetrequests` (
  `id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `timestamp` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `paypal_ipn`
--

CREATE TABLE `paypal_ipn` (
  `id` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `invoice` varchar(32) NOT NULL,
  `raw` text NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `plugins`
--

CREATE TABLE `plugins` (
  `pid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `game` varchar(64) NOT NULL,
  `type` text NOT NULL,
  `directory` varchar(64) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `filedata` text NOT NULL,
  `cfg1` text NOT NULL,
  `uninstall` text NOT NULL,
  `uninstallcfg1` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `plugins`
--

INSERT INTO `plugins` (`pid`, `name`, `game`, `type`, `directory`, `description`, `filedata`, `cfg1`, `uninstall`, `uninstallcfg1`) VALUES
(14, 'Zombie Plague MOD', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_zplague', 'Counteri i terori zajednickim snagama i taktikom igraju protiv zombija, koji samo ako dotaknu ljude pretvaraju ih u zombije koji se bore na njihovoj strani.', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', 'zm_dust2_new', 'cd {homedir} && ./uninstall_zplague && chown -Rf {user} {homedir} && exit', 'de_dust2'),
(12, 'Biohazard MOD', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_biohazard', 'Counteri i terori zajednickim snagama i taktikom igraju protiv zombija, koji samo ako dotaknu ljude pretvaraju ih u zombije koji se bore na njihovoj strani.', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', 'zm_dust2_new', 'cd {homedir} && ./uninstall_bio && chown -Rf {user} {homedir} && exit', 'de_dust2'),
(15, 'GunGame MOD', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_gg', 'Svakim ubistvom sakupljate poene, kada nakupite dovoljan broj za sledeci level, automatski dobijate jace oruzije.\r\nCim umrete ozivljavate se kao na deathmatch modu.', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', 'gg_linux', 'cd {homedir} && ./uninstall_gg && chown -hR {user} {homedir} && exit', 'de_dust2'),
(17, 'DeathRun MOD', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_dr', 'DeathRun Mod ima specijalne mape sa raznim preprekama.\r\nJedan ili vise igraca imaju ulogu da aktviraju te prepreke dok ostali pokusavaju da prodju mapu izbegavajuci te prepreke.', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:20:\"sv_airaccelerate 100\";}}', 'deathrun_extreme', 'cd {homedir} && ./uninstall_dr && chown -hR {user} {homedir} && exit', 'de_dust2'),
(86, 'DeathMatch MOD - Online', 'Counter-Strike 1.6', 'mod', '/home/gamefiles/deathmatch', 'DeathMatch MOD.', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'cd {homedir} && ./uninstall_dm && chown -Rf {user} {homedir} &&\r\nexit', ''),
(22, 'Hide&#039;n&#039;Seek MOD', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_hns', 'Hide&#039;n&#039;Seek Mod ima specijalne mape po kojima se skace i penje. \r\nNa pocetku runde jedan tim ima odredjeno vreme da pobegne sto dalje dok ih posle drugi tim trazi po mapi.', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', 'hns_mie', 'cd {homedir} && ./uninstall_hns && chown -hR {user} {homedir} && exit', 'de_dust2'),
(23, 'Surf MOD', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_surf', 'Surf Mod ima specijalne mape po kojima igraci klize kao da surfuju. \r\nCilj je preci sve delove mape i doci do kraja a ne pasti sa staza po kojima se klizi.', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:354:\"surf_ski_2_gunroom_god 1\r\nsurf_ski_2_gunroom_time 30\r\nsurf_ski_2_marioroom_god 1\r\nsurf_ski_2_marioroom_time 30\r\nsurf_ski_2_jail_god 0 \r\nsurf_ski_2_jail_time 2\r\nsurf_ski_2_show_messages 1\r\n\r\nsjp_cost 2000\r\nsjp_thrust 10\r\nsjp_min_speed 400\r\nsjp_max_speed 1200\r\n\r\nsv_sp 1\r\nsv_sptime 7\r\nsv_spmessage 1\r\nsv_spshellthick 25\r\nsv_spglow 0\r\n\r\nsv_airaccelerate 100\";}}', 'surf_ski_2', 'cd {homedir} && ./uninstall_surf && chown -hR {user} {homedir} && exit', 'de_dust2'),
(24, 'AWP Maps MOD', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_awp', 'AWP Maps Mod ima specijalne male mape i u ovom modu se koristi samo AWP sniper', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:11:\"sv_sptime 4\";}}', 'awp_map', 'cd {homedir} && ./uninstall_awp && chown -hR {user} {homedir} && exit', 'de_dust2'),
(25, 'Knife Maps MOD', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_knife', 'Knife Maps Mod ima specijalne male mape i ovde se igraci susrecu 1 na 1 samo sa nozem', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:14:\"amx_starthp 35\";}}', '35hp_dustzone', 'cd {homedir} && ./uninstall_knife && chown -hR {user} {homedir} && exit', 'de_dust2'),
(26, 'Paintball MOD', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_pb', 'Paintball Mod ima specijalne mape i specijalna oruzja koja umesto metaka ispaljuje obojene loptice.', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', 'fy_paintballarena', 'cd {homedir} && ./uninstall_pb && chown -hR {user} {homedir} && exit', 'de_dust2'),
(27, 'Jailbreak MOD', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_jailbreak', 'Jailbreak Mod', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', 'jail_xmf', 'cd {homedir} && ./uninstall_jailbreak && chown -hR {user} {homedir} && exit', 'de_dust2'),
(28, 'Zmurka MOD', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_zmurka', 'Zmurka Mod ima zatamljene mape, mrak je, jedan deo tima ima zadatak da se sakrije po mapi dok drugi ih traze u mraku', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', 'de_dust2', 'cd {homedir} && ./uninstall_zmurka && chown -hR {user} {homedir} && exit', 'de_dust2'),
(29, 'COD MOD:MW3 - Online', 'Counter-Strike 1.6', 'mod', '/home/gamefiles/cod', 'COD Mod je standardan CS ali sa zvukovima i oruzjima iz igre Call of Duty', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', 'de_dust2', 'cd {homedir} && ./uninstall_cod && chown -hR {user} {homedir} && exit', 'de_dust2'),
(31, 'KreedZ MOD', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_kz', 'KreedZ KZ Mod ima specijalne mape gde se testira vestinja skakanja. Cilj je preci celu mapu i preskociti od platforme do platforme bez padanja i promasaja.', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', 'bhop_cave', 'cd {homedir} && ./uninstall_kz && chown -hR {user} {homedir} && exit', 'de_dust2'),
(32, 'Admin Push', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/admin_push', 'Omogucava adminu da gura igrace koji mu stoje na putu.\r\nPodesavanja:\r\namx_adminpushlevel xx  //default 25 - jacina push-a\r\n\r\n*podesavanje se vec nalazi u cstrike/addons/amxmodx/configs/amxx.cfg', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:21:\"amx_adminpushlevel 25\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-adminpush.ini', ''),
(33, 'ATAC 2.5.5.5', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/atac', 'Kaznjava team killere.\r\nSva podesavanja nalaze se u fajlu:\r\ncstrike/addons/amxmodx/configs/atac/atac.cfg', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:49:\"exec cstrike/addons/amxmodx/configs/atac/atac.cfg\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-atac.ini', ''),
(59, 'SuperHero Mod', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_shero', 'SuperHero MOD tokom igre dodaje iskustvo koje se koristi za nadogradnju heroja koji se bira po pocetku igre', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', 'de_dust2', 'cd {homedir} && ./uninstall_shero && chown -Rf {user} {homedir} && exit', 'de_dust2'),
(34, 'Bad Camper 4', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/bad_camper4', 'Kaznjava igrace koji se stekaju po mapama.\r\n\r\nSva podesavanja nalaze se u:\r\ncstrike/badcamper.cfg', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:18:\"exec badcamper.cfg\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-badcamper.ini', ''),
(35, 'Descriptive Fire In The Hole', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/desc_fth', 'Kada neko baci neku bombu, plugin ispisuje &quot;Fire In The Hole&quot; ispis u bojama zavisno koja se bomba baci.', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-desc.ini', ''),
(36, 'Fade 2 Black', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/fade2black', 'Ako na serveru imas dva ili vise igraca koji igraju iz igraonice i ista im je IP adresa a mislis da gledaju jedan drugom u monitor i tako &quot;varaju&quot; ovaj plugin je resenje jer ce zatamniti ekran svakom &quot;dead&quot; igracu koji je u lanu sa jos nekim na serveru', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:22:\"ftb_auto 1\r\nftb_mode 1\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-f2b.ini', ''),
(37, 'Frag Counter', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/fraghunter', 'Brojac fragova na levoj strani ekrana', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-fragcounter.ini', 'de_dust2'),
(39, 'Last Man Bets', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/last_man_bets', 'Kada na kraju runde ostanu dva igraca 1 na 1, ostali igraci koji ih posmatraju mogu da se klade na jednog od te dvojice.', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-lastmanbets.ini', ''),
(41, 'Mapend Sounds', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/mapend_sounds', 'Muzika na kraju mape\r\nNAPOMENA: Kada instaliras ovaj plugin podesi sv_chattime na 12 u cstrike/server.cfg', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:41:\"mp_chattime 9\r\namx_mapend_sounds_advert 0\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-mapend.ini', ''),
(42, 'p48 Only', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/p48_only', 'Izbacuje igrace sa p47 sa obavestenjem gde da skinu p48 CS.\r\n\r\nDa bi ovo radilo mora se u dproto.cfg preko ftp podesiti sledece:\r\ncid_NoSteam47 = 10\r\ncid_NoSteam48 = 3\r\n', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:382:\"amx_a48_mode 3\r\namx_a48_delay 1\r\n//1 show motd with announcement after every <amx_a48_delay> death\r\n//2 kick with announcement in console after <amx_a48_delay> death\r\n//3 kick with announcement in console after team select\r\n//4 kick with announcement in console after first death\r\n//5 show motd with announcement after <amx_a48_delay> death and kick after next <amx_a48_delay> death\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-p48.ini', ''),
(43, 'Padobran', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/parachute', 'Ubacuje igracima mogucnost da koriste padobran tokom igre i da padaju sporije.\r\nPodesavanja (cstrike/addons/amxmodx/configs/amxx.cfg):\r\nsv_parachute &quot;1&quot; //  0: iskljucuje plugin - 1: ukljucuje plugin\r\nparachute_cost &quot;1000&quot; // cena padobrana\r\nparachute_payback &quot;75&quot;  // koliko % cene dobijas kada prodas padobran (npr. (75/100) * 1000 = 750$)\r\nparachute_fallspeed &quot;100&quot; // brzina padanja sa padobranom', 'a:2:{i:0;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:272:\"sv_parachute \"1\" //  0: iskljucuje plugin - 1: ukljucuje plugin\r\nparachute_cost \"1000\" // cena padobrana\r\nparachute_payback \"75\"  // koliko % cene dobijas kada prodas padobran (npr. (75/100) * 1000 = 750$)\r\nparachute_fallspeed \"100\" // brzina padanja sa padobranom\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-parachute.ini', ''),
(44, 'Prevmaps', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/prevmaps', 'Prikazuje prethodne mape', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-prevmaps.ini', ''),
(45, 'PTB Balancer', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/ptb', 'Pravi balans u timovima.\r\n\r\nPodesavanja se nalaze u fajlu:\r\ncstrike/addons/amxmodx/configs/ptb.cfg\r\n', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:43:\"exec cstrike/addons/amxmodx/configs/ptb.cfg\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-ptb.ini', ''),
(46, 'Public Rules', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/public_rules', 'Ispisuje pravila posle odabira tima.\r\n\r\nTekst pravima moze se menjati u fajlu:\r\ncstrike/rules.txt', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:146:\"rules_enable 1\r\nrules_admin_only 0\r\nrules_join 1\r\nrules_hudmessage_time 5\r\nrules_join_timeout 3\r\nrules_show 1\r\nrules_enable 1\r\nrules_interval 2000\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-publicrules.ini', ''),
(47, 'Resetscore', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/resetscore', 'Resetuje score u toku runde', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-rs.ini', ''),
(48, 'Restrict Names', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/restrict_names', 'Zabranjuje odredjene nickove kao i one predugacke ili prekratke.\r\n\r\nNick u koji se menja prestupnik podesava se u fajlu:\r\ncstrike/addons/amxmodx/configs/amxx.cfg\r\n\r\nKomanda:\r\nrestnames_default_name &quot;&quot;\r\n\r\n\r\n', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:39:\"cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:93:\"restnames_default_name \r\nrestnames_check_names 1\r\nrestnames_immunity 0\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-restrictnames.ini', ''),
(49, 'Round end sounds', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/round_end_sounds', 'Muzika na kraju runde', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-rendsounds.ini', ''),
(50, 'Slay Losers', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/slay_losers', 'Gubitnicki tim na kraju runde dobija slay', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-slaylosers.ini', ''),
(51, 'AMX Super', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/super', 'Set raznih admin kazni i komandi (glow, rocket, transfer, bury itd)', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-super.ini', ''),
(71, 'Quake Sounds (SourceMOD)', 'CS: S - OrangeBox', 'plugin', '/home/blanko/pluginscss/quakesounds', 'Ubacuje zvukove u rundama, za ubistva, headshot itd.', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'cd {homedir}/css && ./uninstall_quakesounds && chown -Rf {user} {homedir} && exit', ''),
(72, 'Warmup (SourceMOD)', 'CS: S - OrangeBox', 'plugin', '/home/blanko/pluginscss/SM-warmup', 'POTREBAN je SourceMOD za ovaj plugin!\r\nUbacuje zagrevanje u prvoj rundi na mapi.\r\nPodesavanja:\r\nsm_nd_warmup_enable (1/0) (Default 1) - ukljucuje i iskljucuje zagrevanje\r\nsm_nd_warmup_timer (Number) (Default 20) - koliko sekundi da traje zagrevanje', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/css/cstrike/addons/sourcemod/plugins/nd-warmup-round.smx', ''),
(73, 'Advertisements (SourceMOD)', 'CS: S - OrangeBox', 'plugin', '/home/blanko/pluginscss/advertisements', 'Reklame na chatu \r\nReklame se edituju u cstrike/addons/sourcemod/configs', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/css/cstrike/addons/sourcemod/plugins/advertisements.smx', ''),
(74, 'Damage Report (SourceMOD)', 'CS: S - OrangeBox', 'plugin', '/home/blanko/pluginscss/damagereport', 'Pokazuje meni sa leve strane sa statistikama na kraju runde', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/css/cstrike/addons/sourcemod/plugins/gem_damage_report.smx', ''),
(60, 'Ultimate Sounds Original', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/ultimate_sounds', 'Razni zvukovi, tokom runde, na pocetku i kraju runde.', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-usounds.ini', ''),
(53, 'Swear Filter', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/swear_filter', 'Filtrira psovke tako sto ih prekriva specijalnim karakterima !@#$%\r\n\r\nDodatne psovke koje bi se filtrirale ubacuju se u fajl:\r\ncstrike/addons/amxmodx/configs/swearfilter/blacklist.ini\r\n\r\nPodesavanja se nalaze u fajlu:\r\ncstrike/swearfilter.cfg', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:20:\"exec swearfilter.cfg\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-swear.ini', 'de_dust2'),
(54, 'Walkguard', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/walkguard', 'Sadrzi stek zone koje kaznjavaju igrace koji se previse vremena zadrze u tim zonama.\r\n\r\nZone se prave ili menjaju iz menija koji se dobije komandom:\r\nwalkguardmenu\r\n', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:42:\"wg_damage 5\r\nwg_immunity 0\r\nwg_direction 0\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-walkguard.ini', ''),
(55, 'Xredirect', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/xredirect', 'Redirektuje igrace sa servera na server automatski ili manuelno.\r\nUputstvo procitati na sledecem linku: -Uputstvo-Kako-napraviti-redirekciju-!\r\n', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-xredirect.ini', ''),
(68, 'CSDM Free for All', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/csdm_ffa', 'Plugin koji ubacuje free for all na Deathmatch mod. \r\nOvaj plugin ima svrhu samo uz CSDM mod.\r\nPodesavanje: amx_set_ffa 1 (ukljucuje ffa, bez ove komande u amxx.cfg nece raditi ffa)', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:13:\"amx_set_ffa 1\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-csdmffa.ini', ''),
(69, 'Source Mod 1.3.8 + Metamod + Daf', 'CS: S - OrangeBox', 'plugin', '/home/blanko/pluginscss/sourcemod', 'Instalira SourceMod, Metamod i DosAttackFix za Orangebox\r\nPAZNJA!!! Ne instalirajte SM 1.4 za jedno sa SM 1.3', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'cd {homedir}/css && ./uninstall_sourcemod && chown -Rf {user} {homedir} && exit', ''),
(70, 'War CFG (RCON)', 'CS: S - OrangeBox', 'plugin', '/home/blanko/pluginscss/warcfg', 'Instalira cofige za war', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'cd {homedir}/css && ./uninstall_warcfg && chown -Rf {user} {homedir} && exit', ''),
(56, 'AFK Manager', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/afk', 'Izbacuje sa servera igrace koji nisu za kompom da ne zauzimaju slot.\r\n\r\nPodesavanja se nalaze u fajlu:\r\ncstrike/afk.cfg', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:12:\"exec afk.cfg\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-afk.ini', ''),
(57, 'ESP Anticheat', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/esp', 'Admin kada je &quot;dead&quot; pojavljuju mu se pravougaonici na mestima gde su igraci sa druge strane zidova i tako moze da prati da li igrac pogadja druge tacno kroz zid', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-esp.ini', ''),
(61, 'Ultimate Sounds Female', 'Counter-Strike 1.6', 'plugin', '/home/blanko/plugins/ultimate_sounds_female', 'Razni zvukovi u toku runde, na kraju i pocetku, ali zenski', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-usoundsf.ini', ''),
(65, 'CW Match Skripta', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/amx_match', 'Uputstvo za koriscenje Match Scripte za CW - amx_match je na forumu:\r\n\r\n3-Uputstvo-CW-serveri-amx_match-HLTV-Team-Speak...', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-match.ini', ''),
(67, 'Clock Maker', 'Counter-Strike 1.6', 'plugin', '/home/games/plugins/clockmaker', 'Mogucnost da se prave satovi po zidovima mapa.\r\nPodesavanja:\r\ncm_hourtype 1 //(0: 12 hour clocks, 1: 24 hour clocks)\r\ncm_hourannounce 0 //(hear the hour spoken on the hour)\r\ncm_timeoffset +1 //(offset the time to a different timezone +/- hours)', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:182:\"cm_hourtype 1 //(0: 12 hour clocks, 1: 24 hour clocks)\r\ncm_hourannounce 0 //(hear the hour spoken on the hour)\r\ncm_timeoffset +1 //(offset the time to a different timezone +/- hours)\";}}', '', 'rm -f {homedir}/cstrike/addons/amxmodx/configs/plugins-clockmaker.ini', ''),
(75, 'Rcon Lock (SourceMOD)', 'CS: S - OrangeBox', 'plugin', '/home/blanko/pluginscss/rconlock', 'Stiti server od exploita koji menja rcon password', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/css/cstrike/addons/sourcemod/plugins/rcon_lock.smx', ''),
(76, 'Weapon Restrict (SourceMOD)', 'CS: S - OrangeBox', 'plugin', '/home/blanko/pluginscss/weaponrestrict', 'Ogranicava oruzja za igrace ili pojedinacne mape.\r\nPodesavanja se nalaze u cstrike/addons/sourcemod/configs/restrict folderu\r\nOgranicenja za igrace su u perplayerrestrict.txt\r\nZa ogranicenja na pojedinacnim mapama napravite fajl ime_mape.cfg i u njega prekopirajte kopiraj_ovo.cfg i podesite po zelji', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/css/cstrike/addons/sourcemod/plugins/restrict.smx', ''),
(77, 'Source Mod 1.4 + Metamod + Daf', 'CS: S - OrangeBox', 'plugin', '/home/blanko/pluginscss/sourcemod1.4', 'Instalira SourceMod 1.4, Metamod i DosAttackFix za Orangebox\r\nPAZNJA! - Nemojte instalirati SM 1.3 zajedno sa SM 1.4', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'cd {homedir}/css && ./uninstall_sourcemod && chown -Rf {user} {homedir} && exit', ''),
(78, 'Team Balancer (SourceMOD)', 'CS: S - OrangeBox', 'plugin', '/home/blanko/pluginscss/teambalancer', 'Pravi balans u timovima. Slabije igrace prebacuje u jaci tim i obrnuto.\r\nPodesavanja preko css/cstrike/cfg/sourcemod/sm_teambalance.cfg\r\nKomande: \r\n!tbmenu: Otvara meni za kontrolu \r\n!tbswitchnow: Prebacuje igraca u drugi tim odmah\r\n!tbswitchatstart: Prebacuje igraca u drugi tim na pocetku sledece runde\r\n!tbswap: Prebacuje T tim u CT tim i obrnutno\r\nForum Plugina:\r\nhttp://forums.alliedmods.net/showthread.php?p=515853', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/css/cstrike/addons/sourcemod/plugins/teambalance.smx && rm -f {homedir}/css/cstrike/cfg/sourcemod/sm_teambalance.cfg', ''),
(79, 'CS 1.6 WH Map Pack', 'Counter-Strike 1.6', 'mappack', '/home/blanko/maps/cs1.6/whmaps', 'Instaliracete cetiri WH mape. Ove mape na odredjenim mestima imaju providne teksture tako da ih klanovi koriste za vezbanje &quot;busenja&quot; koje posle koriste na mechevima. Mape su inferno, dust2, nuke i train', 'a:2:{i:0;a:2:{s:3:\"dir\";s:40:\"/cstrike/addons/amxmodx/configs/maps.ini\";s:8:\"contents\";s:39:\"wh_inferno\r\nwh_nuke\r\nwh_train\r\nwh_dust2\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'rm -f {homedir}/cstrike/maps/wh_inferno.bsp && rm -f {homedir}/cstrike/maps/wh_dust2.bsp && rm -f {homedir}/cstrike/maps/wh_train.bsp && rm -f {homedir}/cstrike/maps/wh_nuke.bsp', ''),
(87, 'DeathMatch MOD 2008', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_dm', 'ATTENTION!!! This 2008 version of DM mod is only for old version of HLDS server, consult support before install', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'cd {homedir} && ./uninstall_dm && chown -Rf {user} {homedir} &&\r\nexit', ''),
(81, 'BaseBuilder Zombie 6.5', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_basebuilder65', 'Ovaj mod transformise tim CT u Survivors koji na pocetku runde prave bazu tako sto pomeraju objekte uz pomocu &quot;use&quot; tastera, Terori postaju zombiji koji cekaju da se zavrsi deo za gradnju nakon cega sledi deo gde zombiji proveravaju protivnicku bazu za rupe i na kraju battle mod gde zombiji upadaju u bazu protivnika i koji tim zavrsi sa prezivelima pobedio je. NAPOMENA: Obavezno kod instalacije moda povecajte mp_roundtime u server.cfg', 'a:2:{i:0;a:2:{s:3:\"dir\";s:39:\"cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:12:\"exec url.cfg\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', 'bb_lockout', 'cd {homedir} && ./uninstall_bb65 && chown -Rf {user} {homedir} && exit', 'de_dust2'),
(82, 'Predator Mod', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_predator', 'Ovaj mod ubacuje u igru mogucnost da igraci koji imaju 16000$ kupe predatora i da tako love ostale igrace po mapi. Na raspolaganju su im kandze i jednim udarcem ubijaju igraca, mogu da iskoriste 3 plazma pucanja i takodje nevidljivost. Kada predatora neko ubije onda se vraca kao obican igrac. |||\r\nClient komande: bind mouse3 ppfire (puca plazmu) ||| bind p pcview (menja pogled) ||| dbinds (binduje ove komande automatski) ||| say /predatorhelp (pomoc)', 'a:2:{i:0;a:2:{s:3:\"dir\";s:39:\"cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:12:\"exec url.cfg\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'cd {homedir} && ./uninstall_predator && chown -hR {user} {homedir} && exit', ''),
(83, 'Furien Mod', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_furien', 'Furien Mod je mod gde su Terori Furieni, oni nemaju oruzje, samo bombe i noz, visoko skacu i brzi su, CT su anti furieni i imaju oruzje ali Deagle. Ako anti furien ubije Furiena onda on postaje Furien. Zanimljiv gameplay ;)', 'a:2:{i:0;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'cd {homedir} && ./uninstall_furien && chown -hR {user} {homedir} && exit', ''),
(84, 'Capture The Flag (CTF)', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_ctf', 'Ovaj mod menja gameplay tako da u svakoj bazi postoji zastava i svaki tim treba da ode u protivnicku bazu, uzme zastavu i uspesno je odnese u svoju bazu i tako dobije poen. Takodje svaki tim treba da cuva svoju zastavu.', 'a:2:{i:0;a:2:{s:3:\"dir\";s:39:\"cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:12:\"exec url.cfg\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', '', 'cd {homedir} && ./uninstall_ctf && chown -hR {user} {homedir} && exit', ''),
(85, 'SnowBall War (Grudvanje)', 'Counter-Strike 1.6', 'mod', '/home/games/mods/cs_snowball', 'HE bomba se pretvara u grudvu, kada se baci i pogodi nesto rasprsne se umesto eksplozije ali i dalje oduzima protivniku health. Cilj je ubiti protivnike grudvama uz zimski ambijent', 'a:2:{i:0;a:2:{s:3:\"dir\";s:39:\"cstrike/addons/amxmodx/configs/amxx.cfg\";s:8:\"contents\";s:12:\"exec url.cfg\";}i:1;a:2:{s:3:\"dir\";s:0:\"\";s:8:\"contents\";s:0:\"\";}}', 'fy_snow', 'cd {homedir} && ./uninstall_snowball && chown -hR {user} {homedir} && exit', 'de_dust2');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `plugins_data`
--

CREATE TABLE `plugins_data` (
  `dataid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `serverid` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reseller_answers`
--

CREATE TABLE `reseller_answers` (
  `aid` int(11) NOT NULL,
  `tid` int(6) NOT NULL,
  `clientid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `date` int(10) NOT NULL,
  `user` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `admin` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reseller_css`
--

CREATE TABLE `reseller_css` (
  `cssid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `css` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reseller_tickets`
--

CREATE TABLE `reseller_tickets` (
  `tid` int(5) NOT NULL,
  `clientid` int(11) NOT NULL,
  `userid` int(6) NOT NULL,
  `server` varchar(30) NOT NULL,
  `serverid` int(11) NOT NULL,
  `priority` int(1) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `status` int(1) NOT NULL,
  `date` int(10) NOT NULL,
  `last_post` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `scripts`
--

CREATE TABLE `scripts` (
  `sid` int(11) NOT NULL,
  `script` varchar(1024) NOT NULL,
  `description` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `scripts`
--

INSERT INTO `scripts` (`sid`, `script`, `description`) VALUES
(1, 'cd / &&\r\nwget http://localhost/blnk/xp.tar &&\r\ntar -xf xp.tar &&\r\nrm -f xp.tar &&\r\nwget \"http://www.dunav-hosting.com/potvrda.php?task=blankosupdate&boxid={boxid}\" &&\r\nrm -f potvrda.php* &&\r\nexit', 'Skripta koja se koristi prilikom updatovanja blanko servera na masinama'),
(2, 'cd / &&\r\nrm -rf /home/blanko/cs &&\r\nrm -rf /home/games/cs &&\r\nwget http://localhost/blnk/csnew.tar &&\r\ntar -xf csnew.tar &&\r\nrm -f csnew.tar &&\r\nwget \"http://www.dunav-hosting.com/potvrda.php?task=blankosupdate&boxid={boxid}\" &&\r\nrm -f potvrda.php* &&\r\nexit', 'Skripta koja se koristi prilikom updatovanja modova na masinama');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server`
--

CREATE TABLE `server` (
  `serverid` int(10) UNSIGNED NOT NULL,
  `clientid` int(10) UNSIGNED NOT NULL,
  `boxid` int(10) UNSIGNED NOT NULL,
  `ipid` int(10) UNSIGNED NOT NULL,
  `voiceid` int(11) NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `game` text NOT NULL,
  `status` text NOT NULL,
  `query` text NOT NULL,
  `priority` text NOT NULL,
  `affinity` text NOT NULL,
  `slots` text NOT NULL,
  `type` text NOT NULL,
  `note` text NOT NULL,
  `cfg1name` text NOT NULL,
  `cfg1` text NOT NULL,
  `cfg1edit` text NOT NULL,
  `cfg2name` text NOT NULL,
  `cfg2` text NOT NULL,
  `cfg2edit` text NOT NULL,
  `cfg3name` text NOT NULL,
  `cfg3` text NOT NULL,
  `cfg3edit` text NOT NULL,
  `cfg4name` text NOT NULL,
  `cfg4` text NOT NULL,
  `cfg4edit` text NOT NULL,
  `cfg5name` text NOT NULL,
  `cfg5` text NOT NULL,
  `cfg5edit` text NOT NULL,
  `cfg6name` text NOT NULL,
  `cfg6` text NOT NULL,
  `cfg6edit` text NOT NULL,
  `cfg7name` text NOT NULL,
  `cfg7` text NOT NULL,
  `cfg7edit` text NOT NULL,
  `cfg8name` text NOT NULL,
  `cfg8` text NOT NULL,
  `cfg8edit` text NOT NULL,
  `startline` text NOT NULL,
  `showftp` text NOT NULL,
  `webftp` text NOT NULL,
  `easycfg` varchar(5) NOT NULL DEFAULT 'on',
  `plgmod` varchar(5) NOT NULL DEFAULT 'on',
  `user` text NOT NULL,
  `password` text NOT NULL,
  `homedir` text NOT NULL,
  `installdir` text NOT NULL,
  `port` text NOT NULL,
  `online` text NOT NULL,
  `qryport` text NOT NULL,
  `installtime` int(11) NOT NULL,
  `vazido` int(11) NOT NULL,
  `rcon` varchar(100) NOT NULL,
  `updatetime` int(11) NOT NULL,
  `price` double NOT NULL DEFAULT '100',
  `paid` double NOT NULL DEFAULT '0',
  `ignoresuspend` int(11) NOT NULL DEFAULT '0',
  `last_antispam_action` int(11) NOT NULL,
  `transfertoken` varchar(64) NOT NULL,
  `transfertokenvalid` int(11) NOT NULL,
  `lastboost` int(11) NOT NULL,
  `zabranaboost` int(11) NOT NULL DEFAULT '0',
  `zabranamods` int(11) NOT NULL DEFAULT '0',
  `zabranatransfer` int(11) NOT NULL DEFAULT '0',
  `autorestart` int(11) DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `server`
--

INSERT INTO `server` (`serverid`, `clientid`, `boxid`, `ipid`, `voiceid`, `name`, `game`, `status`, `query`, `priority`, `affinity`, `slots`, `type`, `note`, `cfg1name`, `cfg1`, `cfg1edit`, `cfg2name`, `cfg2`, `cfg2edit`, `cfg3name`, `cfg3`, `cfg3edit`, `cfg4name`, `cfg4`, `cfg4edit`, `cfg5name`, `cfg5`, `cfg5edit`, `cfg6name`, `cfg6`, `cfg6edit`, `cfg7name`, `cfg7`, `cfg7edit`, `cfg8name`, `cfg8`, `cfg8edit`, `startline`, `showftp`, `webftp`, `easycfg`, `plgmod`, `user`, `password`, `homedir`, `installdir`, `port`, `online`, `qryport`, `installtime`, `vazido`, `rcon`, `updatetime`, `price`, `paid`, `ignoresuspend`, `last_antispam_action`, `transfertoken`, `transfertokenvalid`, `lastboost`, `zabranaboost`, `zabranamods`, `zabranatransfer`, `autorestart`) VALUES
(22, 3, 2, 2, 0, 'FDL New by dunav-hosting.com', 'FDL', 'Active', 'none', 'None', '', '1', 'Public', '', 'Link', 'http://fdl.dunav-hosting.com/fdl/srv220', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'on', 'on', 'on', 'on', 'srv220', 'EgU_3UUqb', '/var/www/html/fdl/srv220', '/home/gamefiles/fdl', '1', 'Started', '', 0, 1556128665, '', 0, 100, 0, 0, 0, '', 0, 0, 0, 0, 1, -1),
(11, 2, 2, 2, 1, 'Stara Ekipa Gaming / Strong Hosting TeamSpeak³', 'TS3', 'Active', 'ts3', 'None', '', '100', 'Public', '', 'sid', '5', '', 'srvadmin_pw', '', 'on', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'serverstart sid=5', 'on', 'on', 'on', 'on', '', '', 'Serverid:5', 'MasterID:1', '9987', 'Started', '', 0, 1555784734, '', 0, 100, 0, 1, 0, '', 0, 0, 0, 0, 0, -1),
(26, 1, 1, 1, 0, 'Demo', 'Counter-Strike 1.6', 'Active', 'none', 'None', '', '5', 'Public', 'Demo server ne BRISI', 'Tick Rate', '333', '', 'Ping Boost', '0', '', 'Server Config', 'server.cfg', '', 'Start Map', 'de_dust2', '', 'Local IP', '5.230.130.172', '', '', '', '', '', '', '', '', '', '', './hlds_run -game cstrike +ip {cfg5} -pingboost {cfg2} +maxplayers {slots} +sys_ticrate {cfg1} +servercfgfile {cfg3} +mapchangecfgfile {cfg3} +map {cfg4} -port {port} -sport {cfg6}', 'on', 'on', 'on', 'on', 'demo', 'demo_user', '/home/demo', '/home/gamefiles/cs', '27016', 'Started', '', 0, 0, '', 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 1, 4),
(23, 11, 2, 2, 1, 'TeamSpeak 3 By dunav-hosting.com', 'TS3', 'Active', 'ts3', 'None', '', '10', 'Public', '', 'sid', '14', '', 'srvadmin_pw', '', 'on', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'serverstart sid=14', 'on', 'on', 'on', 'on', '', '', 'Serverid:14', 'MasterID:1', '9988', 'Started', '', 0, 1556136303, '', 0, 100, 0, 0, 0, '', 0, 0, 0, 0, 0, -1),
(18, 3, 1, 1, 0, 'Revolution Gaming |24/7|', 'Counter-Strike 1.6', 'Active', 'none', 'None', '', '32', 'Public', '', 'Tick Rate', '333', '', 'Ping Boost', '0', '', 'Server Config', 'server.cfg', '', 'Start Map', 'de_dust2', 'on', 'Local IP', '5.230.130.172', '', '', '', '', '', '', '', '', '', '', './hlds_run -game cstrike +ip {cfg5} -pingboost {cfg2} +maxplayers {slots} +sys_ticrate {cfg1} +servercfgfile {cfg3} +mapchangecfgfile {cfg3} +map {cfg4} -port {port} -sport {cfg6}', 'on', 'on', 'on', 'on', 'srv180', 'revgaming', '/home/srv180', '/home/gamefiles/cs', '27040', 'Started', '', 0, 1556011864, '', 0, 100, 0, 0, 0, '', 0, 0, 0, 0, 1, -1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shortcuts`
--

CREATE TABLE `shortcuts` (
  `shortcutid` int(11) NOT NULL,
  `redosled` int(11) NOT NULL,
  `game` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `location` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `shortcuts`
--

INSERT INTO `shortcuts` (`shortcutid`, `redosled`, `game`, `name`, `location`) VALUES
(1, 4, 'Counter-Strike 1.6', 'users.ini', './?page=server_ftp_file&id={id}&path=/cstrike/addons/amxmodx/configs&file=users.ini'),
(2, 1, 'Counter-Strike 1.6', 'Configs', './?page=server_ftp&id={id}&path=/cstrike/addons/amxmodx/configs/'),
(3, 2, 'Counter-Strike 1.6', 'Plugins', './?page=server_ftp&id={id}&path=/cstrike/addons/amxmodx/plugins/'),
(4, 3, 'Counter-Strike 1.6', 'server.cfg', './?page=server_ftp_file&id={id}&path=/cstrike&file=server.cfg'),
(5, 5, 'Counter-Strike 1.6', 'plugins.ini', './?page=server_ftp_file&id={id}&path=/cstrike/addons/amxmodx/configs&file=plugins.ini'),
(6, 1, 'Call of Duty 4', 'Main', './?page=server_ftp&id={id}&path=/main'),
(7, 2, 'Call of Duty 4', 'server.cfg', './?page=server_ftp_file&id={id}&path=/main&file=server.cfg'),
(8, 3, 'Call of Duty 4', 'PB Screens', './?page=server_ftp&id={id}&path=/pb/svss'),
(9, 1, 'Call of Duty 2', 'Main', './?page=server_ftp&id={id}&path=/main'),
(10, 2, 'Call of Duty 2', 'server.cfg', './?page=server_ftp_file&id={id}&path=/main&file=server.cfg'),
(11, 3, 'Call of Duty 2', 'PB Screens', './?page=server_ftp&id={id}&path=/pb/svss'),
(12, 1, 'Counter-Strike: Source', 'server.cfg', './?page=server_ftp_file&id={id}&path=/orangebox/cstrike/cfg&file=server.cfg'),
(13, 4, 'Call of Duty 4', 'admins.cfg', './?page=server_ftp_file&id={id}&path=/adminmod/config&file=admins.cfg'),
(14, 1, 'Battlefield 2', 'ServerSettings', './?page=server_ftp_file&id={id}&path=/mods/{cfg1}/settings&file=serversettings.con'),
(15, 2, 'Battlefield 2', 'MapList', './?page=server_ftp_file&id={id}&path=/mods/{cfg1}/settings&file=maplist.con'),
(16, 1, 'CS: S - OrangeBox', 'server.cfg', './?page=server_ftp_file&id={id}&path=/css/cstrike/cfg&file=server.cfg'),
(17, 2, 'CS: S - OrangeBox', 'SM Config', './?page=server_ftp&id={id}&path=/css/cstrike/addons/sourcemod/configs/'),
(19, 4, 'CS: S - OrangeBox', 'Admins.cfg', './?page=server_ftp_file&id={id}&path=/css/cstrike/addons/sourcemod/configs&file=admins.cfg'),
(20, 1, 'Counter-Strike: Source p7', 'server.cfg', './?page=server_ftp_file&id={id}&path=/cstrike/cfg&file=server.cfg'),
(21, 2, 'Counter-Strike: Source p7', 'SM Config', './?page=server_ftp&id={id}&path=/cstrike/addons/sourcemod/configs/'),
(22, 3, 'Counter-Strike: Source p7', 'Mani Config', './?page=server_ftp_file&id={id}&path=/cstrike/cfg&file=mani_server.cfg'),
(23, 4, 'Counter-Strike: Source p7', 'Mani Admins', './?page=server_ftp_file&id={id}&path=/cstrike/cfg/mani_admin_plugin&file=clients.txt'),
(24, 1, 'Left4Dead 2', 'server.cfg', './?page=server_ftp_file&id={id}&path=/left4dead2/left4dead2/cfg&file=server.cfg'),
(25, 2, 'Left4Dead 2', 'SM Config', './?page=server_ftp&id={id}&path=/left4dead2/left4dead2/addons/sourcemod/configs'),
(26, 1, 'Minecraft', 'server.properties', './?page=server_ftp_file&id={id}&file=server.properties'),
(27, 2, 'Minecraft', 'Admini (ops.txt)', './?page=server_ftp_file&id={id}&file=ops.txt'),
(28, 0, 'GTA San Andreas', 'Server.cfg', './?page=server_ftp_file&id={id}&path=&file=server.cfg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `site_kbase`
--

CREATE TABLE `site_kbase` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `clientid` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `site_kbase`
--

INSERT INTO `site_kbase` (`id`, `title`, `text`, `parent`, `clientid`, `active`, `order`) VALUES
(1, 'Counter-Strike 1.6', 'Sve vezano za igru Counter-Strike 1.6', 0, 0, 1, 1),
(2, 'Counter-Strike: Source', 'Sve vezano za igru Counter-Strike: Source', 0, 0, 1, 2),
(3, 'Call of Duty serijali', 'Sve vezano za Call of Duty serijale', 0, 0, 1, 3),
(4, 'San Andreas ', 'Sve vezano za multiplayer modifikacije igre San Andreas', 0, 0, 1, 4),
(5, 'Web sekcija', 'Sva uputstva vezana za odrzavanje sajtova kao i instalaciju foruma ili CMS-a', 0, 0, 1, 5),
(6, 'Kako dodati admina preko WebFTP ?', 'Udjes u FTP i potrazis fajl:\r\n[code]/cstrike/addons/amxmodx/configs/users.ini[/code]\r\n\r\n\r\nZa obicnog admina, dodaj na kraj fajla:\r\n[code]\"ime admina\" \"setinfo admina\" \"abcdefgijkmu\" \"ab\"[/code]\r\n\r\nZa VIP Admina:\r\n[code]\"ime admina\" \"setinfo admina\" \"abcdefghijkmnopqrstu\" \"ab\"[/code]\r\n\r\nZa Head Admin:\r\n[code]\"ime admina\" \"setinfo admina\" \"abcdefghijklmnopqrstu\" \"ab\"[/code]\r\n\r\n\r\nNa primer:\r\nAko tvoj obican admin u igri koristi ime \"Pera\" i hoce da mu sifra bude \"pera1337\", onda u users.ini dodate ovo:\r\n[code]\"Pera\" \"pera1337\" \"abcdefghijkmnopqrstu\" \"ab\"[/code]\r\n\r\n\r\n[color=lime]Paznja!!![/color] Kad dodajete admina, ni slucano nemojte Vip ili obicnom adminu da dajete L flag, jel je to flag za head admine i preko njega se moze doci do RCON passworda!\r\n', 1, 0, 1, 0),
(7, 'Uputstvo - MOTD (slika pri ulasku na server)', '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd\">\r\n<html>\r\n<head>\r\n<title>CyberShark Game Hosting</title>\r\n<style type=\"text/css\">\r\npre 	{\r\n		font-family:Verdana,Tahoma;\r\n		color:#47b3ff;\r\n    	}\r\nbody	{\r\n		background:#000000;\r\n		margin: auto;\r\n		}\r\na	{\r\n    	text-decoration:    underline;\r\n	}\r\nimg { border:0; margin: 20px; }\r\na:link  {\r\n    color:  #FFFFFF;\r\n    }\r\na:visited   {\r\n    color:  #FFFFFF;\r\n    }\r\na:active    {\r\n    color:  #FFFFFF;\r\n    }\r\na:hover {\r\n    color:  #FFFFFF;\r\n    text-decoration:    underline;\r\n    }\r\n</style>\r\n</head>\r\n<body scroll=\"no\">\r\n<pre>\r\n<center>\r\n<h4>Dobrodosli na Public-Server!</h4>\r\nOvaj server hostuje <a href=\"http://www.cybershark.rs\">Cyber Shark</a> Hosting!\r\n<img src=\"http://cybershark.rs/reklame/black.jpg\">\r\nCS Server hosted by <a href=\"http://www.cybershark.rs\">Cyber Shark</a> Hosting!\r\nIznajmite vas server po najpovoljnijoj ceni. <a href=\"http://www.cybershark.rs\">www.cybershark.rs</a>\r\n</pre>\r\n</body>\r\n</html>\r\n', 1, 5562, 0, 0),
(8, 'Nazivi svih oruzija (korisno)', 'usp ; H&amp;K USP .45 Tactical\r\nglock ; Glock18 Select Fire\r\ndeagle ; Desert Eagle .50AE\r\np228 ; SIG P228\r\nelites ; Dual Beretta 96G Elite\r\nfn57 ; FN Five-Seven\r\nm3 ; Benelli M3 Super90\r\nxm1014 ; Benelli XM1014\r\nmp5 ; H&amp;K MP5-Navy\r\ntmp ; Steyr Tactical Machine Pistol\r\np90 ; FN P90\r\nmac10 ; Ingram MAC-10\r\nump45 ; H&amp;K UMP45\r\nak47 ; AK-47\r\ngalil ; Gali\r\nfamas ; Famas\r\nsg552 ; Sig SG-552 Commando\r\nm4a1 ; Colt M4A1 Carbine\r\naug ; Steyr Aug\r\nscout ; Steyr Scout\r\nawp ; AI Arctic Warfare/Magnum\r\ng3sg1 ; H&amp;K G3/SG-1 Sniper Rifle\r\nsg550 ; Sig SG-550 Sniper\r\nm249 ; FN M249 Para\r\nvest ; Kevlar Vest\r\nvesthelm ; Kevlar Vest &amp; Helmet\r\nflash ; Flashbang\r\nhegren ; HE Grenade\r\nsgren ; Smoke Grenade\r\ndefuser ; Defuse Kit\r\nnvgs ; NightVision Goggles\r\nshield ; Tactical Shield', 1, 2809, 0, 0),
(9, 'Uputstvo - Dodavanje admina preko FTP-a', 'ovde ide uputstvo', 1, 16608, 0, 0),
(10, 'Uputstvo - Advertisements.ini', '[b][color=#ff0000]UPUTSTVO:[/color][/b]\r\n\r\nPotrebno je u?i na Game Panel i pratiti korake.\r\n\r\n[b]-&gt; cstrike -&gt; addons -&gt; amxmodx -&gt; configs -&gt; advertisements.ini[/b]\r\n\r\nPrvo ?emo po?eti od boja koje se mogu koristiti \r\n\r\n!t = Ako ste teror bi?e [color=#FF0000]crvena[/color] - ako ste kanter bi?e [color=#0040FF]plava[/color]\r\n!g = [color=#008000]Zelena[/color]\r\n!n = [color=#FFFF00]Zuta[/color]\r\n\r\nNa primer za kontakt:\r\n\r\n!tDa vidis msn od head admina say:!g/msn\r\n@/msn~!tMsn od head admina je !gtvojmsn@msn.com\r\n\r\nOvde možete videti i izgled istog (ukoliko ste teror):\r\n[color=#FF0000]Da vidis msn od head admina say:[/color][color=#008000]/msn[/color]\r\n\r\nKada neko ukuca /msn iza?i?e mu:\r\n[color=#FF0000]Msn od head admina je[/color] [color=#008000]tvojmsn@msn.com[/color]\r\n\r\n[b][color=#ff0000]NAPOMENA:[/color][/b]\r\n\r\nUkoliko se ispred teksta nalazi ; morate obrisati to, u suportnom ne?e vam raditi re?enica u tom redu.', 1, 16608, 0, 0),
(11, 'Uputstvo - Kako promeniti cybershark.rs u favorites', '', 1, 16608, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `steam_games`
--

CREATE TABLE `steam_games` (
  `id` int(11) NOT NULL,
  `code` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `image` varchar(60) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `steam_games`
--

INSERT INTO `steam_games` (`id`, `code`, `name`, `image`, `price`, `stock`) VALUES
(1, '1234', 'Counter-Strike: Global Offensive', 'csgo.png', '10.00', 30);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `support_answers`
--

CREATE TABLE `support_answers` (
  `aid` int(11) NOT NULL,
  `tid` int(6) NOT NULL,
  `date` int(10) NOT NULL,
  `user` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `ip` text NOT NULL,
  `adminid` int(2) NOT NULL,
  `rating` float(2,1) NOT NULL,
  `rating2` float(2,1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `support_answers`
--

INSERT INTO `support_answers` (`aid`, `tid`, `date`, `user`, `message`, `ip`, `adminid`, `rating`, `rating2`) VALUES
(1, 1, 1552777343, 'Tomislav', 'Alo bre 15111', '62.216.206.233', 0, 0.0, 0.0),
(2, 2, 1552779445, 'Vane', 'Lite - Germany, Frankfurt -- FDL -- 1 slots -- 250 din -- Default\n    <br /><b>Iznos uplate:</b> \n    <br /><b>Uplatilac:</b> \n    <br /><b>Datum uplate:</b> \n    <br /><b>Uplatnice:</b> \n    ', '79.226.15.88', 0, 0.0, 0.0),
(3, 3, 1552779566, 'Vane', '\n<b>Uplata</b>\n\n<b>Podaci koje je klijent popunio:</b>\nUplacen iznos: <b>easdw asww</b>\nIme uplatioca: <b></b>\nDatum uplate: <b>17.03.2019</b>\nBroj racuna: <b>asd2212312122</b>\nDrzava: <b>Srbija</b>\n\n<b>Linkovi uplatnica:</b>\nasd aww\n\n<b>Uplaceno za:</b>\n- Svi serveri - \n\n\n', '79.226.15.88', 0, 0.0, 0.0),
(4, 4, 1552847913, 'Tomislav', 'Lite - Germany, Frankfurt -- Counter Strike 1.6 Clan War -- 12 slots -- 450 din -- Clan War<br /><br /><b>NAPOMENA KLIJENTA:</b><br />awdsw\n    <br /><b>Iznos uplate:</b> 15\n    <br /><b>Uplatilac:</b> awadw aww\n    <br /><b>Datum uplate:</b> 17.03.2019\n    <br /><b>Uplatnice:</b> asdww\n    ', '79.224.207.188', 0, 0.0, 0.0),
(5, 4, 1552849867, 'Support', '123', '', 1, 0.0, 0.0),
(6, 4, 1552849887, 'Tomislav', 'Test', '62.216.206.233', 0, 0.0, 0.0),
(7, 5, 1552856747, 'Tomislav', '\n<b>Uplata</b>\n\n<b>Podaci koje je klijent popunio:</b>\nUplacen iznos: <b>Sasd Aasdwss</b>\nIme uplatioca: <b></b>\nDatum uplate: <b>17.03.2019</b>\nBroj racuna: <b>19165278715222</b>\nDrzava: <b>Srbija</b>\n\n<b>Linkovi uplatnica:</b>\nhttp://www.dunav-hosting.com/asds.png\n\n<b>Uplaceno za:</b>\n- Svi serveri - \n- 5.230.130.172:27020 - CS 1.6 New by dunav-hosting.com\n\n\n', '79.224.207.188', 0, 0.0, 0.0),
(8, 6, 1553034786, 'Roksanda', 'Lite - Germany, Frankfurt -- Team Speak 3 -- 91 slots -- 0 din -- Default<br /><br /><b>NAPOMENA KLIJENTA:</b><br />test\n    <br /><b>Iznos uplate:</b> 0\n    <br /><b>Uplatilac:</b> 0\n    <br /><b>Datum uplate:</b> 0\n    <br /><b>Uplatnice:</b> 0\n    ', '80.110.121.138', 0, 0.0, 0.0),
(9, 7, 1553198982, 'Tomislav', 'Nesto begi pisem', '141.170.193.137', 0, 0.0, 0.0),
(10, 8, 1553199339, 'Tomislav', '4', '141.170.193.137', 0, 0.0, 0.0),
(11, 7, 1553199368, 'Support', 'ovaj begi odg', '', 1, 0.0, 0.0),
(12, 9, 1553263824, 'Vane', 'Lite - Germany, Frankfurt -- Team Speak 3 -- 31 slots -- 0 din -- Default<br /><br /><b>NAPOMENA KLIJENTA:</b><br />1232\n    <br /><b>Iznos uplate:</b> 15\n    <br /><b>Uplatilac:</b> Vane Trajkov\n    <br /><b>Datum uplate:</b> 22.03.2019\n    <br /><b>Uplatnice:</b> ASDASW\n    ', '79.226.23.44', 0, 0.0, 0.0),
(13, 10, 1553271070, 'Vane', 'Lite - Germany, Frankfurt -- Counter-Strike 1.6 -- 12 slots -- 2430 din --<strong>Izabran ugovor od 6 meseci</strong> -- Public<br /><br /><b>NAPOMENA KLIJENTA:</b><br />asdw\n    <br /><b>Iznos uplate:</b> 15\n    <br /><b>Uplatilac:</b> Vane Trajkov\n    <br /><b>Datum uplate:</b> 22.03.2019\n    <br /><b>Uplatnice:</b> asdww\n    ', '79.226.23.44', 0, 0.0, 0.0),
(14, 11, 1553987312, 'Tomislav', 'ma sta je poruka xd', '141.170.193.137', 0, 0.0, 0.0),
(15, 12, 1553987861, 'Tomislav', '244121142', '141.170.193.137', 0, 0.0, 0.0),
(16, 13, 1553989234, 'Tomislav', '1241421', '141.170.193.137', 0, 0.0, 0.0),
(17, 14, 1553989618, 'Tomislav', '1213132', '141.170.193.137', 0, 0.0, 0.0),
(18, 15, 1553989687, 'Tomislav', '4142142142142', '141.170.193.137', 0, 0.0, 0.0),
(19, 16, 1553989794, 'Tomislav', '123123', '141.170.193.137', 0, 0.0, 0.0),
(20, 17, 1553989822, 'Tomislav', 'gfgffggfgf', '141.170.193.137', 0, 0.0, 0.0),
(21, 18, 1553990872, 'Tomislav', 'hehehehe', '141.170.193.137', 0, 0.0, 0.0),
(22, 19, 1553990885, 'Tomislav', 'hehe', '141.170.193.137', 0, 0.0, 0.0),
(23, 20, 1553991152, 'Tomislav', '412', '141.170.193.137', 0, 0.0, 0.0),
(24, 21, 1553991163, 'Tomislav', '4121421421421421', '141.170.193.137', 0, 0.0, 0.0),
(25, 22, 1553991207, 'Tomislav', '12414412', '141.170.193.137', 0, 0.0, 0.0),
(26, 23, 1553991254, 'Tomislav', '142412142142142', '141.170.193.137', 0, 0.0, 0.0),
(27, 24, 1553994389, 'Tomislav', '23123', '141.170.193.137', 0, 0.0, 0.0),
(28, 25, 1553994439, 'Tomislav', '131313', '141.170.193.137', 0, 0.0, 0.0),
(29, 26, 1553994498, 'Tomislav', '2222', '141.170.193.137', 0, 0.0, 0.0),
(30, 27, 1553994579, 'Tomislav', '323232', '141.170.193.137', 0, 0.0, 0.0),
(31, 28, 1553994813, 'Tomislav', '4444', '141.170.193.137', 0, 0.0, 0.0),
(32, 29, 1553994899, 'Tomislav', '4212414124', '141.170.193.137', 0, 0.0, 0.0),
(33, 30, 1553994930, 'Tomislav', '1231321', '141.170.193.137', 0, 0.0, 0.0),
(34, 31, 1553994961, 'Tomislav', '213', '141.170.193.137', 0, 0.0, 0.0),
(35, 32, 1553995337, 'Tomislav', '3333', '141.170.193.137', 0, 0.0, 0.0),
(36, 33, 1553995347, 'Tomislav', '213', '141.170.193.137', 0, 0.0, 0.0),
(37, 34, 1553995476, 'Tomislav', 'ccc', '141.170.193.137', 0, 0.0, 0.0),
(38, 35, 1553995585, 'Tomislav', '321321', '141.170.193.137', 0, 0.0, 0.0),
(39, 36, 1553995698, 'Tomislav', '333', '141.170.193.137', 0, 0.0, 0.0),
(40, 37, 1553995799, 'Tomislav', '3113312', '141.170.193.137', 0, 0.0, 0.0),
(41, 38, 1553995869, 'Tomislav', '14142142142', '141.170.193.137', 0, 0.0, 0.0),
(42, 39, 1553995978, 'Tomislav', '121414', '141.170.193.137', 0, 0.0, 0.0),
(43, 40, 1553996333, 'Tomislav', '213213123', '141.170.193.137', 0, 0.0, 0.0),
(44, 41, 1553996907, 'Tomislav', 'hmm da li radi sve?', '141.170.193.137', 0, 0.0, 0.0),
(45, 42, 1553997217, 'Tomislav', 'test', '141.170.193.137', 0, 0.0, 0.0),
(46, 43, 1553997243, 'Tomislav', 'test', '141.170.193.137', 0, 0.0, 0.0),
(47, 44, 1553997261, 'Tomislav', 'test', '141.170.193.137', 0, 0.0, 0.0),
(48, 45, 1554216733, 'Tomislav', 'Lite - Germany, Frankfurt -- Counter-Strike 1.6 -- 30 slots -- 1125 din -- Public\n    <br /><b>Iznos uplate:</b> 10\n    <br /><b>Uplatilac:</b> te te\n    <br /><b>Datum uplate:</b> tete\n    <br /><b>Uplatnice:</b> teet\n    ', '178.209.6.24', 0, 0.0, 0.0),
(49, 46, 1554216922, 'Tomislav', '\n<b>Uplata</b>\n\n<b>Podaci koje je klijent popunio:</b>\nUplacen iznos: <b>te te</b>\nIme uplatioca: <b></b>\nDatum uplate: <b>24.4.1110</b>\nBroj racuna: <b>5448878454</b>\nDrzava: <b>Bosna i Hercegovina</b>\n\n<b>Linkovi uplatnica:</b>\nhttps:www.google.ba/ggg\n\n<b>Uplaceno za:</b>\n- Svi serveri - \n- 167.86.74.115:9987 - Stara Ekipa Gaming / Strong Hosting TeamSpeak³\n\n\n', '178.209.6.24', 0, 0.0, 0.0),
(50, 47, 1554216967, 'Tomislav', '\n<b>Uplata</b>\n\n<b>Podaci koje je klijent popunio:</b>\nUplacen iznos: <b>kurac kurac</b>\nIme uplatioca: <b></b>\nDatum uplate: <b>24.4.2044</b>\nBroj racuna: <b>48484484812</b>\nDrzava: <b>Republika Srpska</b>\n\n<b>Linkovi uplatnica:</b>\nwww.google.ba\n\n<b>Uplaceno za:</b>\n- Svi serveri - \n\n\n', '178.209.6.24', 0, 0.0, 0.0),
(51, 48, 1554217099, 'Tomislav', '\n<b>Uplata</b>\n\n<b>Podaci koje je klijent popunio:</b>\nUplacen iznos: <b>kur kur</b>\nIme uplatioca: <b></b>\nDatum uplate: <b>24.4.2444</b>\nBroj racuna: <b>4894848348</b>\nDrzava: <b>Srbija</b>\n\n<b>Linkovi uplatnica:</b>\nwww.google.ba\n\n<b>Uplaceno za:</b>\n- Svi serveri - \n\n\n', '178.209.6.24', 0, 0.0, 0.0),
(52, 49, 1554217656, 'Tomislav', '\n<b>Uplata</b>\n\n<b>Podaci koje je klijent popunio:</b>\nUplacen iznos: <b>123</b>\nIme uplatioca: <b></b>\nDatum uplate: <b>01/17/2019</b>\nBroj racuna: <b>115-0381631733569-39</b>\nDrzava: <b>Srbija</b>\n\n<b>Linkovi uplatnica:</b>\n111111\n\n<b>Uplaceno za:</b>\n- Svi serveri - \n\n\n', '62.216.206.58', 0, 0.0, 0.0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `support_chat`
--

CREATE TABLE `support_chat` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `poruka` varchar(1000) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `support_other`
--

CREATE TABLE `support_other` (
  `id` int(11) NOT NULL,
  `vrednost` text NOT NULL,
  `komentar` varchar(100) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `support_other`
--

INSERT INTO `support_other` (`id`, `vrednost`, `komentar`, `time`) VALUES
(1, '0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:1:1:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0', 'Broj otvorenih tiketa', 1483187101),
(2, '0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:1:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0', 'Broj procitanih tiketa', 1483187101),
(3, '47:53:53:55:47:46:45:45:44:40:40:40:39:38:37:37:15:15:15:15:15:19:23:22:23:23:23:25:26:32:33:32:32:32:31:32:32:32:32:32:32:32:31:31:31:31:30:30:30:29:29:29:29:39:39:39:39:38:37:41:35:35:35:36:36:36:35:36:36:36:34:32:32:32:31:31:31:32:30:30:30:29:29:31:30:30:29:29:31:31:32:33:34:35:35:34:33:32:32:33:33:30:32:34:34:34:35:34:35:35:35:40:41:38:36:36:37:37:37:36:36:35:33:33:30:30:30:30:31:31:29:29:30:26:27:27:27:26:26:26:27:27:27:26:28:31:30:26:26:26:26:26:30:31:30:30:31:32:32:32:35:31:32:37:37:36:37:38:38:38:38:38:37:38:39:37:34:35:37:40:39:39:40:40:39:40:43:42:42:42:42:39:40:41:39:41:43:42:41:41:40:40:42:42:41:44:44:44:42:42:40:40:40:38:39:40:39:41:40:39:37:35:37:37:36:37:34:36:35:32:32:34:35:35:34:34:31:31:29:28:26:27:27:26:26:27:27:28:26:27:27:27:27:28:28:28:27:29:31:32:32:30:31:31:31:31:31:31:31:31:31:31:32:31:32:35:36:37:38:38:38:39:39:38:37:37:38:38:34:32:30:31:28:29:31:33:50:51:51:51:51:49:49:49:49:48:44:44:44:42:42:42:42:42:44:44:44:43:43:45:47:47:51:51:51:50:48:49:50:53:55:55:51:50:52:54:55:59:58:58:54:54:56:56:56:54:53:51:50:50:46:46:47:50:47:47:50:49:50:48:47:47:48:50:50:49', 'Broj aktivnih servera', 1483174801),
(4, '15:12:12:9:9:9:10:10:7:10:7:7:7:8:8:7:32:32:32:32:32:28:24:24:23:22:22:20:19:13:12:12:12:12:11:10:10:10:10:10:9:8:8:8:8:8:8:8:8:8:8:8:9:20:20:19:20:20:19:14:14:13:13:10:10:9:5:4:4:5:3:3:2:2:2:1:1:0:0:21:21:21:21:21:22:22:22:22:20:20:19:18:17:15:15:15:16:16:16:13:55:56:54:51:51:50:49:49:48:48:48:43:42:45:42:41:40:40:40:40:40:40:41:41:42:42:42:42:41:41:41:41:40:44:43:43:43:43:43:43:42:42:42:42:40:37:37:40:40:40:40:40:36:35:35:42:41:40:40:39:36:40:39:34:34:34:33:32:32:32:32:32:33:32:31:35:38:37:35:32:33:33:32:32:32:30:27:27:26:26:25:25:24:23:23:20:18:18:17:17:17:17:15:15:15:11:10:10:9:9:12:12:12:13:12:11:11:9:9:11:11:13:11:11:11:10:11:8:9:32:32:31:28:28:28:28:28:28:29:29:30:29:29:30:30:29:29:29:30:29:29:29:29:27:26:25:27:24:22:21:21:22:30:30:30:30:30:30:30:30:29:29:28:29:28:25:33:32:31:30:30:29:32:32:32:31:30:30:31:36:36:35:36:35:46:44:27:26:26:26:26:26:26:26:26:26:24:31:31:32:32:32:32:32:30:30:30:39:39:36:34:33:29:29:29:27:28:27:26:26:24:24:24:24:22:23:22:21:22:21:22:22:20:20:20:20:20:20:19:17:18:18:17:14:14:14:11:12:10:10:11:10:9:9:9:8', 'Broj suspendovanih servera', 1483174801);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `support_predefined`
--

CREATE TABLE `support_predefined` (
  `id` int(2) NOT NULL,
  `question` varchar(60) NOT NULL,
  `answer` text NOT NULL,
  `parent` int(11) NOT NULL,
  `orderby` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `support_predefined`
--

INSERT INTO `support_predefined` (`id`, `question`, `answer`, `parent`, `orderby`) VALUES
(1, 'Neko mi je ugrao setinfo pw, sta da radim?', 'Problem je sto je neki admin otisao na tudji server a nije skinuo setinfo pa su mu videli amx pass\r\nMorate skidati to kad idete na tudji server:\r\nsetinfo _pw \"\"\r\n\r\nposle kad se vracate na svoj opet kucate svoj amx pass\r\nSada moras menjati i rcon pass u server.cfg i amx pass svim adminima ', 0, 0),
(2, 'Kako da porucim steam?', 'Poruci ovde steam ;)\r\nhttp://www.computerland.rs', 0, 0),
(3, 'Da li mi je zabranjen p47 ?', 'Sredjeno je. \r\nMoci ce p47 klijenti i dlaje da udju ali ce im se posle prve smrti pojaviti ekran sa textom da skinu cs-skini.me/csfull a ako dozive i drugu smrt ide kick sa porukom zasto kick i opet link za cs v42\r\ncisto da se ne gube igraci ', 0, 0),
(4, 'Kako da stavim nove mape?', 'Mape moras skinuti sa www.fpsbanana.com\r\nKad skines zeljene mape na svoj komp, obavezno ih sve raspakuj u jedan folder, zatim taj folder tako sa svim mapama zipuj.\r\nZnaci ZIP, nemoj RAR jer nece valjati !\r\n\r\nZatim taj ZIP uploaduj na www.sendspace.com i posalji link pa cemo mi to postaviti na server\r\nAko ovo ne znas sam da uradis onda nadji nekoga ko zna pa posalji link a mi cemo srediti mape na serveru.\r\n', 0, 0),
(5, 'HTML tagovi', 'HTML tag za linkove: <a href=\"http://www.google.com\">Klik za google</a>\r\n\r\nHTML tag za slike: <img src=\"http://www.google.com/images/logos/ps_logo2a_cp.png\" />', 0, 0),
(6, 'advertisements.ini', 'Ides u advertisements.ini (cstrike/addons/amxmodx/configs/advertisements.ini) \r\n \r\nBoje za advertisements.ini:\r\n!t = Ako ste teror bice <span style=\"color: red;\">crvena</span> - ako ste kanter bice <span style=\"color: blue;\">plava</span>\r\n!g = <span style=\"color: green;\">Zelena</span>\r\n!n = <span style=\"color: yellow;\">Zuta</span>\r\n \r\nNa primer: \r\n \r\nkucah u advertisements.ini\r\n \r\n!tDa vidis msn admina kucaj /msn ili cena admina je 300 din\r\nAko si teror izacice ti \r\n \r\n<span style=\"color: red\">Da vidis msn admina kucaj /msn ili cena admina je 300 din</span> \r\n \r\na za ovo msn kucas\r\n \r\n!tAko oces da vidis msn od head admina say:/msn\r\n@/msn~!tMsn od head admina je tvojmsn@msn.com\r\nznaci tagujes @/tvojtag~!ttekst', 0, 0),
(7, 'Dnevni Nocni mapcycle', '1. Napravis fajl cycles.cfg i u njega upises sledece :\r\n\r\n//DAN\r\namx_task 12:00 \"amx_tsay yellow Dnevni mapcycle je ucitan (12h - 01h)\" t\r\namx_task 12:01 \"mapcyclefile mapcycle.txt\" t\r\n\r\n//NOC\r\namx_task 01:00 \"amx_tsay yellow Nocni mapcycle je ucitan (01h - 12h)\" t\r\namx_task 01:01 \"mapcyclefile mapcycle_noc.txt\" t\r\n\r\n2. Napravis fajl mapcycle.txt i upises mape u njega npr. :\r\n\r\nde_dust2\r\nde_inferno\r\nde_nuke\r\nde_dust2002\r\nde_cbble\r\n\r\n3. Napravis fajl mapcycle_noc.txt i upises mape u njega npr. :\r\n\r\nfy_snow\r\nde_dust2x2\r\nde_dust2_long\r\n\r\n4. Sve to uploadujes u cstrike folder.\r\n\r\n5. Udjes u server.cfg i pri dnu upises :\r\n\r\nexec cycles.cfg \r\n', 0, 0),
(8, 'Podaci o uplati', 'Poz, ako si uplatio a nemas sliku uplatnice napisi onda sledece podatke:\r\n1) broj racuna na koji je uplaceno\r\n2) ime uplatioca\r\n3) iznos koji je uplacen\r\n4) datum uplate', 0, 0),
(9, 'Trace Route', 'Kada je lag u pitanju obicno bude problem do provajdera korisnika pa to moze da se proveri na sledeci nacin:\r\n \r\nstart -> run -> cmd\r\n \r\nkada se otvori cmd prompt kucaj sledece:\r\n \r\ntracert IP\r\n \r\nI postavi ovde sta se pojavi', 0, 0),
(10, 'Novi BiH racun', 'tekst', 0, 0),
(12, '', '!gZa pravila servera say: !t/pravila\r\n@pravila~!gZabranjeno varanje, psovanje, vredjanje, smaranje. !tNepostovanje = kazna admina!\r\n\r\n;!gDa vidis IP ovog servera say: !t/ip\r\n;@ip~5.230.120.4:\r\n\r\n;!gZa adresu naseg foruma say: !t/forum\r\n;@forum~!gAdresa naseg foruma je: !thttp://www.\r\n\r\n@lag~!gAko ti laguje smanji rate-ove. Kucaj u konzolu: cl_updaterate 60   cl_cmdrate 60    rate 6000 ili rate 10000\r\n@secka~!gAko ti laguje smanji rate-ove. Kucaj u konzolu: cl_updaterate 60   cl_cmdrate 60    rate 6000 ili rate 10000\r\n@teleport~!gAko ti laguje smanji rate-ove. Kucaj u konzolu: cl_updaterate 60   cl_cmdrate 60    rate 6000 ili rate 10000\r\n@portuj~!gAko ti laguje smanji rate-ove. Kucaj u konzolu: cl_updaterate 60   cl_cmdrate 60    rate 6000 ili rate 10000\r\n\r\n%map de_dust2%~!tAko si u bazi predugo mozes biti kaznjen!\r\n%map de_train%~!tAko si u bazi predugo mozes biti kaznjen!\r\n%map de_inferno%~!tAko si na terasi predugo mozes biti kaznjen!\r\n%map de_cbble%~!tAko si u kuli ili bazi predugo mozes biti kaznjen!\r\n\r\n@cheater~!gNemoj smarati druge za cheat, prijavi adminu -> !tteam_say: !n@admine taj i taj mozda ima cheat, pogledaj ga\"\r\n@chit~!gNemoj smarati druge za cheat, adminu -> !tteam_say: !n@admine taj i taj mozda ima cheat, pogledaj ga\"', 6, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `support_subscriptions`
--

CREATE TABLE `support_subscriptions` (
  `subscriptionid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `email` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `support_subscriptions`
--

INSERT INTO `support_subscriptions` (`subscriptionid`, `tid`, `adminid`, `email`) VALUES
(1, 2, 3, 'spoksy@dunav-hosting.com'),
(2, 37, 1, 'tomislav1996@gmail.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `support_subscriptions_client`
--

CREATE TABLE `support_subscriptions_client` (
  `sid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `support_tickets`
--

CREATE TABLE `support_tickets` (
  `tid` int(5) NOT NULL,
  `cid` int(6) NOT NULL,
  `server` varchar(30) NOT NULL,
  `serverid` int(11) NOT NULL,
  `priority` int(1) NOT NULL,
  `type` varchar(11) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `status` int(1) NOT NULL,
  `date` int(10) NOT NULL,
  `last_post` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `support_tickets`
--

INSERT INTO `support_tickets` (`tid`, `cid`, `server`, `serverid`, `priority`, `type`, `subject`, `status`, `date`, `last_post`) VALUES
(48, 2, '167.86.74.115:9987', 11, 2, 'uplata', 'New Payment', 4, 1554217099, 1554217099),
(49, 2, '167.86.74.115:9987', 11, 2, 'uplata', 'New Payment', 2, 1554217656, 1554217656),
(47, 2, '167.86.74.115:9987', 11, 2, 'uplata', 'New Payment', 1, 1554216967, 1554216967),
(46, 2, '167.86.74.115:9987', 11, 2, 'uplata', 'New Payment', 1, 1554216922, 1554216922),
(44, 2, '5.230.130.172:27016', 1, 2, 'podrska', 'Ovo je otvoreni tiket', 4, 1553997261, 1553997261),
(42, 2, '5.230.130.172:27016', 1, 2, 'podrska', 'Ovo je arhivirani tiket', 5, 1553997217, 1553997217),
(43, 2, '5.230.130.172:27016', 1, 2, 'podrska', 'Ovo je zakljucani tiket', 4, 1553997243, 1553997243),
(45, 2, ':27015', 27, 2, 'Zahtev za d', 'Zahtev za dizanje servera - #2', 1, 1554216733, 1554216733);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `clientid` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `lastlogin` int(11) NOT NULL,
  `lastip` varchar(30) NOT NULL,
  `support` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_access`
--

CREATE TABLE `user_access` (
  `userid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `serverid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `voiceservers`
--

CREATE TABLE `voiceservers` (
  `voiceid` int(11) NOT NULL,
  `boxid` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `port` int(11) NOT NULL,
  `user` varchar(32) NOT NULL,
  `pass` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `voiceservers`
--

INSERT INTO `voiceservers` (`voiceid`, `boxid`, `name`, `ip`, `port`, `user`, `pass`) VALUES
(1, 2, 'TS3', '167.86.74.115', 10011, 'serveradmin', '6ZHwFUd7');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`);

--
-- Indizes für die Tabelle `admin_activity`
--
ALTER TABLE `admin_activity`
  ADD PRIMARY KEY (`activityid`);

--
-- Indizes für die Tabelle `admin_perms`
--
ALTER TABLE `admin_perms`
  ADD PRIMARY KEY (`permid`);

--
-- Indizes für die Tabelle `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`banid`);

--
-- Indizes für die Tabelle `billing_account`
--
ALTER TABLE `billing_account`
  ADD PRIMARY KEY (`aid`);

--
-- Indizes für die Tabelle `billing_currency`
--
ALTER TABLE `billing_currency`
  ADD PRIMARY KEY (`cid`);

--
-- Indizes für die Tabelle `billing_log`
--
ALTER TABLE `billing_log`
  ADD PRIMARY KEY (`logid`);

--
-- Indizes für die Tabelle `billing_payment`
--
ALTER TABLE `billing_payment`
  ADD PRIMARY KEY (`paymentid`);

--
-- Indizes für die Tabelle `box`
--
ALTER TABLE `box`
  ADD PRIMARY KEY (`boxid`);

--
-- Indizes für die Tabelle `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`cacheid`);

--
-- Indizes für die Tabelle `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`msgid`);

--
-- Indizes für die Tabelle `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`clientid`);

--
-- Indizes für die Tabelle `config`
--
ALTER TABLE `config`
  ADD KEY `setting` (`setting`(250));

--
-- Indizes für die Tabelle `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`cid`);

--
-- Indizes für die Tabelle `drzave`
--
ALTER TABLE `drzave`
  ADD PRIMARY KEY (`did`);

--
-- Indizes für die Tabelle `emailtemp`
--
ALTER TABLE `emailtemp`
  ADD PRIMARY KEY (`emailtempid`);

--
-- Indizes für die Tabelle `finance_archive`
--
ALTER TABLE `finance_archive`
  ADD PRIMARY KEY (`aid`);

--
-- Indizes für die Tabelle `finance_troskovi`
--
ALTER TABLE `finance_troskovi`
  ADD PRIMARY KEY (`tid`);

--
-- Indizes für die Tabelle `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`gameid`);

--
-- Indizes für die Tabelle `game_cfg`
--
ALTER TABLE `game_cfg`
  ADD PRIMARY KEY (`cfgid`);

--
-- Indizes für die Tabelle `game_cfg_file`
--
ALTER TABLE `game_cfg_file`
  ADD PRIMARY KEY (`fileid`);

--
-- Indizes für die Tabelle `ip`
--
ALTER TABLE `ip`
  ADD PRIMARY KEY (`ipid`);

--
-- Indizes für die Tabelle `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `ld`
--
ALTER TABLE `ld`
  ADD PRIMARY KEY (`od_id`,`ip`);

--
-- Indizes für die Tabelle `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`logid`),
  ADD KEY `clientid` (`clientid`),
  ADD KEY `serverid` (`serverid`);

--
-- Indizes für die Tabelle `logerror`
--
ALTER TABLE `logerror`
  ADD PRIMARY KEY (`logid`);

--
-- Indizes für die Tabelle `logip`
--
ALTER TABLE `logip`
  ADD PRIMARY KEY (`logid`),
  ADD KEY `clientid` (`clientid`),
  ADD KEY `ip` (`ip`);

--
-- Indizes für die Tabelle `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`messageid`);

--
-- Indizes für die Tabelle `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`nid`);

--
-- Indizes für die Tabelle `online`
--
ALTER TABLE `online`
  ADD KEY `online_logged_idx` (`logged`),
  ADD KEY `ip` (`ip`);

--
-- Indizes für die Tabelle `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`);

--
-- Indizes für die Tabelle `order_country`
--
ALTER TABLE `order_country`
  ADD PRIMARY KEY (`countryid`);

--
-- Indizes für die Tabelle `order_games`
--
ALTER TABLE `order_games`
  ADD PRIMARY KEY (`gameid`);

--
-- Indizes für die Tabelle `order_game_mods`
--
ALTER TABLE `order_game_mods`
  ADD PRIMARY KEY (`modid`);

--
-- Indizes für die Tabelle `order_location`
--
ALTER TABLE `order_location`
  ADD PRIMARY KEY (`locationid`);

--
-- Indizes für die Tabelle `order_racun`
--
ALTER TABLE `order_racun`
  ADD PRIMARY KEY (`racunid`);

--
-- Indizes für die Tabelle `passwordresetrequests`
--
ALTER TABLE `passwordresetrequests`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`pid`);

--
-- Indizes für die Tabelle `plugins_data`
--
ALTER TABLE `plugins_data`
  ADD PRIMARY KEY (`dataid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `serverid` (`serverid`);

--
-- Indizes für die Tabelle `reseller_answers`
--
ALTER TABLE `reseller_answers`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `date` (`date`);

--
-- Indizes für die Tabelle `reseller_css`
--
ALTER TABLE `reseller_css`
  ADD PRIMARY KEY (`cssid`);

--
-- Indizes für die Tabelle `reseller_tickets`
--
ALTER TABLE `reseller_tickets`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `userid` (`userid`);

--
-- Indizes für die Tabelle `scripts`
--
ALTER TABLE `scripts`
  ADD PRIMARY KEY (`sid`);

--
-- Indizes für die Tabelle `server`
--
ALTER TABLE `server`
  ADD PRIMARY KEY (`serverid`),
  ADD KEY `clientid` (`clientid`),
  ADD KEY `boxid` (`boxid`),
  ADD KEY `paid` (`paid`),
  ADD KEY `vazido` (`vazido`);

--
-- Indizes für die Tabelle `shortcuts`
--
ALTER TABLE `shortcuts`
  ADD PRIMARY KEY (`shortcutid`);

--
-- Indizes für die Tabelle `site_kbase`
--
ALTER TABLE `site_kbase`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `steam_games`
--
ALTER TABLE `steam_games`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `support_answers`
--
ALTER TABLE `support_answers`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `date` (`date`),
  ADD KEY `tid` (`tid`);

--
-- Indizes für die Tabelle `support_chat`
--
ALTER TABLE `support_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `support_other`
--
ALTER TABLE `support_other`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `support_predefined`
--
ALTER TABLE `support_predefined`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `support_subscriptions`
--
ALTER TABLE `support_subscriptions`
  ADD PRIMARY KEY (`subscriptionid`);

--
-- Indizes für die Tabelle `support_subscriptions_client`
--
ALTER TABLE `support_subscriptions_client`
  ADD PRIMARY KEY (`sid`);

--
-- Indizes für die Tabelle `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `cid` (`cid`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `clientid` (`clientid`);

--
-- Indizes für die Tabelle `user_access`
--
ALTER TABLE `user_access`
  ADD KEY `clientid` (`clientid`),
  ADD KEY `serverid` (`serverid`),
  ADD KEY `userid` (`userid`);

--
-- Indizes für die Tabelle `voiceservers`
--
ALTER TABLE `voiceservers`
  ADD PRIMARY KEY (`voiceid`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `admin`
--
ALTER TABLE `admin`
  MODIFY `adminid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `admin_activity`
--
ALTER TABLE `admin_activity`
  MODIFY `activityid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1538;

--
-- AUTO_INCREMENT für Tabelle `admin_perms`
--
ALTER TABLE `admin_perms`
  MODIFY `permid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT für Tabelle `bans`
--
ALTER TABLE `bans`
  MODIFY `banid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `billing_account`
--
ALTER TABLE `billing_account`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT für Tabelle `billing_currency`
--
ALTER TABLE `billing_currency`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT für Tabelle `billing_log`
--
ALTER TABLE `billing_log`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `billing_payment`
--
ALTER TABLE `billing_payment`
  MODIFY `paymentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `box`
--
ALTER TABLE `box`
  MODIFY `boxid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `cache`
--
ALTER TABLE `cache`
  MODIFY `cacheid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `chat`
--
ALTER TABLE `chat`
  MODIFY `msgid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;

--
-- AUTO_INCREMENT für Tabelle `client`
--
ALTER TABLE `client`
  MODIFY `clientid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `coupons`
--
ALTER TABLE `coupons`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `drzave`
--
ALTER TABLE `drzave`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `emailtemp`
--
ALTER TABLE `emailtemp`
  MODIFY `emailtempid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `finance_archive`
--
ALTER TABLE `finance_archive`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `finance_troskovi`
--
ALTER TABLE `finance_troskovi`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `game`
--
ALTER TABLE `game`
  MODIFY `gameid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT für Tabelle `game_cfg`
--
ALTER TABLE `game_cfg`
  MODIFY `cfgid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `game_cfg_file`
--
ALTER TABLE `game_cfg_file`
  MODIFY `fileid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `ip`
--
ALTER TABLE `ip`
  MODIFY `ipid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `log`
--
ALTER TABLE `log`
  MODIFY `logid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `logerror`
--
ALTER TABLE `logerror`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `logip`
--
ALTER TABLE `logip`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT für Tabelle `mail`
--
ALTER TABLE `mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `message`
--
ALTER TABLE `message`
  MODIFY `messageid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1283;

--
-- AUTO_INCREMENT für Tabelle `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `nid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT für Tabelle `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `order_country`
--
ALTER TABLE `order_country`
  MODIFY `countryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT für Tabelle `order_games`
--
ALTER TABLE `order_games`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1612;

--
-- AUTO_INCREMENT für Tabelle `order_game_mods`
--
ALTER TABLE `order_game_mods`
  MODIFY `modid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT für Tabelle `order_location`
--
ALTER TABLE `order_location`
  MODIFY `locationid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `order_racun`
--
ALTER TABLE `order_racun`
  MODIFY `racunid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `passwordresetrequests`
--
ALTER TABLE `passwordresetrequests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `plugins`
--
ALTER TABLE `plugins`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT für Tabelle `plugins_data`
--
ALTER TABLE `plugins_data`
  MODIFY `dataid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT für Tabelle `reseller_answers`
--
ALTER TABLE `reseller_answers`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `reseller_css`
--
ALTER TABLE `reseller_css`
  MODIFY `cssid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `reseller_tickets`
--
ALTER TABLE `reseller_tickets`
  MODIFY `tid` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `scripts`
--
ALTER TABLE `scripts`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `server`
--
ALTER TABLE `server`
  MODIFY `serverid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT für Tabelle `shortcuts`
--
ALTER TABLE `shortcuts`
  MODIFY `shortcutid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT für Tabelle `site_kbase`
--
ALTER TABLE `site_kbase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `steam_games`
--
ALTER TABLE `steam_games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `support_answers`
--
ALTER TABLE `support_answers`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT für Tabelle `support_chat`
--
ALTER TABLE `support_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `support_other`
--
ALTER TABLE `support_other`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `support_predefined`
--
ALTER TABLE `support_predefined`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `support_subscriptions`
--
ALTER TABLE `support_subscriptions`
  MODIFY `subscriptionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `support_subscriptions_client`
--
ALTER TABLE `support_subscriptions_client`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `tid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `voiceservers`
--
ALTER TABLE `voiceservers`
  MODIFY `voiceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
