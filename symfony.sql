-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Sty 2017, 14:21
-- Wersja serwera: 10.1.16-MariaDB
-- Wersja PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `symfony`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `thread_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ancestors` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `depth` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `state` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `comment`
--

INSERT INTO `comment` (`id`, `thread_id`, `body`, `ancestors`, `depth`, `created_at`, `state`, `author_id`, `score`) VALUES
(1, '4', 'Fajny film, polecam.', '', 0, '2017-01-08 14:17:35', 0, 1, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `director` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `writer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `producer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `premiere` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `length` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `film`
--

INSERT INTO `film` (`id`, `title`, `subtitle`, `description`, `image`, `director`, `writer`, `producer`, `premiere`, `length`, `date`, `updated_at`) VALUES
(1, 'Król Lew', 'The Lion King', 'W lwiej rodzinie królewskiej rodzi się następca tronu, Simba. Mufasa - jego ojciec uczy go wielu rzeczy, będąc dla niego autorytetem. Jednak pewnego dnia Mufasa umiera, a jego syn zostaje niesłusznie posądzony o zbrodnię, a następnie wygnany z królestwa. Okazuje się, że tron, należący się Simbie, obejmuje Skaza - brat zmarłego króla. Po kilku latach Simba spotyka przyjaciółkę z dzieciństwa Nalę i dowiaduje się od niej, że królestwo upada. Wraz z nią i dwójką nowych przyjaciół - Timonem i Pumbą - wyrusza z chęcią zemsty na Skazie.', '5871951e9b230.jpg', 'Rob Minkoff, Roger Allers', 'Jonathan Roberts, Linda Woolverton, Irene Mecchi', 'USA', '26 sierpnia 2011 (Polska), 15 czerwca 1994 (świat)', 89, '2017-01-08 11:20:00', '2017-01-08 02:25:50'),
(2, 'Doktor Strange', 'Doctor Strange', 'Chirurg Stephen Strange, który utracił władzę w rękach, wyrusza do Tybetu, aby poddać się szkoleniu dającemu nadzieję na wyzdrowienie.', '5871974ccedb6.jpg', 'Scott Derrickson', 'Jon Spaihts, C. Robert Cargill, Scott Derrickson', 'USA', '26 października 2016 (Polska), 20 października 2016 (świat)', 115, '2017-01-08 07:29:00', '2017-01-08 02:35:08'),
(3, 'X-Men Geneza: Wolverine', 'X-Men Origins: Wolverine', 'Pierwszy z nowej serii widowiskowych filmów akcji, ukazujący korzenie najsłynniejszego z X-Menów tajemniczego Wolverine''a, który postanawia wyjaśnić zagadkę swego pochodzenia. Film opowiada historię Wolverine''a przed przygodami w X-Men. W filmie są ukazane sceny pokazane w samej Trylogii, ale także Wojna wietnamska, w której brał udział również Szablo zębny. Dowiadujemy się więcej o przeszłości Logana: o jego rodzinie, stosunkach z bratem, wojennych bitwach i współpracy z pułkownikiem Strykerem, a także miłości życia przyszłego X-Mana.', '58719868056a5.jpg', 'Gavin Hood', 'David Benioff, Skip Woods', 'USA', '30 kwietnia 2009 (Polska), 8 kwietnia 2009 (świat)', 107, '2017-01-08 11:35:00', '2017-01-08 02:39:52'),
(4, 'Assassin''s Creed', NULL, 'Dzięki przełomowej technologii Callum Lynch doświadcza przygód swojego przodka, asasyna Aguilara, żyjącego w XV-wiecznej Hiszpanii. Wkrótce podejmuje walkę z potężnymi templariuszami.', '58719a5d8b7aa.jpg', 'Justin Kurzel', 'Michael Lesslie, Bill Collage, Adam Cooper', 'Francja, USA, Wielka Brytania', '6 stycznia 2017 (Polska), 14 grudnia 2016 (świat)', 108, '2017-01-08 15:45:00', '2017-01-08 02:48:13'),
(5, 'Deadpool', NULL, 'Były żołnierz oddziałów specjalnych zostaje poddany niebezpiecznemu eksperymentowi. Niebawem uwalnia swoje alter ego i rozpoczyna polowanie na człowieka, który niemal zniszczył jego życie.', '58719b2fbe581.jpg', 'Tim Miller', 'Rhett Reese, Paul Wernick', 'Kanada, USA', '12 lutego 2016 (Polska), 21 stycznia 2016 (świat)', 108, '2017-01-08 06:49:00', '2017-01-08 02:51:43'),
(6, 'Zwierzogród', 'Zootopia', 'Nick Bajer – żyjący z drobnych przekrętów szczwany lis, i Judy Hops – pierwszy w historii królik zatrudniony w policji, łączą siły, by rozwiązać pewną kryminalną zagadkę.', '58719c311191d.png', 'Byron Howard, Rich Moore', 'Jared Bush, Phil Johnston', 'USA', '19 lutego 2016 (Polska), 10 lutego 2016 (świat)', 108, '2017-01-08 05:53:00', '2017-01-08 02:56:01'),
(7, 'Hobbit: Niezwykła podróż', 'The Hobbit: An Unexpected Journey', 'Hobbit Bilbo Baggins wyrusza w niebezpieczną podroż, by wraz z czarodziejem Gandalfem i trzynastoma krasnoludami pokonać smoka Smauga.', '58719d0411888.jpg', 'Peter Jackson', 'Guillermo del Toro, Peter Jackson, Fran Walsh, Philippa Boyens', 'Nowa Zelandia, USA', '25 grudnia 2012 (Polska), 28 listopada 2012 (świat)', 169, '2017-01-08 06:57:00', '2017-01-08 02:59:32'),
(8, 'Sherlock Holmes', NULL, 'Najsłynniejszy detektyw Sherlock Holmes z nieodłącznym przyjacielem dr. Watsonem szukają sprawcy rytualnych morderstw.', '58719da469fcd.jpg', 'Guy Ritchie', 'Michael Robert Johnson,Simon Kinberg, Anthony Peckham', 'Niemcy, USA', '15 stycznia 2010 (Polska), 24 grudnia 2009 (świat)', 128, '2017-01-08 03:00:00', '2017-01-08 03:02:12'),
(9, 'Kraina lodu', 'Frozen', 'Kiedy posiadająca moc kontroli nad śniegiem i lodem Elsa sprowadza srogą zimę na swoje królestwo, Anna wyrusza w podróż, aby odszukać siostrę oraz zakończyć pogodowe anomalie.', '58719e9c39414.jpg', 'Chris Buck, Jennifer Lee', 'Jennifer Lee', 'USA', '29 listopada 2013 (Polska), 17 listopada 2013 (świat)', 108, '2017-01-08 01:03:00', '2017-01-08 03:06:20'),
(10, 'Batman v Superman', 'Batman v Superman: Dawn of Justice', 'W obliczu wielkiego zagrożenia Batman niechętnie łączy siły z Supermanem. Poza herosami do walki staje także wojownicza Wonder Woman.', '58723a826c90e.jpg', 'Zack Snyder', 'Chris Terrio, David S. Goyer', 'USA', '1 kwietnia 2016 (Polska), 12 marca 2016 (świat)', 151, '2017-01-08 14:09:00', '2017-01-08 14:11:30'),
(11, 'Avengers: Czas Ultrona', 'Avengers: Age of Ultron', 'Najpotężniejsi bohaterowie na Ziemi łączą swoje siły, aby zniszczyć Ultrona.', '58723ba4a25fb.jpg', 'Joss Whedon', 'Joss Whedon', 'USA', '7 maja 2015 (Polska), 13 kwietnia 2015 (świat)', 141, '2017-01-08 14:13:00', '2017-01-08 14:16:20');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `film_genre`
--

CREATE TABLE `film_genre` (
  `film_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `film_genre`
--

INSERT INTO `film_genre` (`film_id`, `genre_id`) VALUES
(1, 2),
(1, 11),
(2, 12),
(2, 25),
(3, 1),
(3, 27),
(4, 25),
(5, 1),
(5, 15),
(5, 27),
(6, 2),
(6, 15),
(6, 25),
(7, 12),
(7, 25),
(8, 20),
(8, 25),
(9, 2),
(9, 11),
(9, 22),
(9, 25),
(10, 1),
(10, 27),
(11, 1),
(11, 27);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `film_link`
--

CREATE TABLE `film_link` (
  `film_id` int(11) NOT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `film_link`
--

INSERT INTO `film_link` (`film_id`, `link_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(5, 8),
(6, 9),
(7, 10),
(8, 11),
(9, 12),
(10, 13),
(11, 14);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `fos_user`
--

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(1, 'lukasz', 'lukasz', 'ilukasz@hotmail.com', 'ilukasz@hotmail.com', 1, NULL, '$2y$13$Hu4OnjvPIYhy.FmIO0f0CufSRTBrOrCradaXu03LiuDMo0avcbg0O', '2017-01-08 14:08:55', NULL, NULL, 'a:0:{}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Akcja'),
(2, 'Animacja'),
(3, 'Anime'),
(4, 'Biograficzny'),
(5, 'Dokumentalny'),
(6, 'Dramat'),
(7, 'Dramat historyczny'),
(8, 'Edukacyjny'),
(9, 'Erotyczny'),
(10, 'Etiuda'),
(11, 'Familijny'),
(12, 'Fantasy'),
(13, 'Historyczny'),
(14, 'Horror'),
(15, 'Komedia'),
(16, 'Komedia kryminalna'),
(17, 'Komedia obycz.'),
(18, 'Komedia rom.'),
(19, 'Krótkometrażowy'),
(20, 'Kryminał'),
(21, 'Melodramat'),
(22, 'Musical'),
(23, 'Muzyczny'),
(24, 'Niemy'),
(25, 'Przygodowy'),
(26, 'Romans'),
(27, 'Sci-fi'),
(28, 'Sportowy'),
(29, 'Thriller'),
(30, 'Western'),
(31, 'Wojenny');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `link`
--

CREATE TABLE `link` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(512) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `link`
--

INSERT INTO `link` (`id`, `name`, `url`) VALUES
(1, 'Youtube', 'https://www.youtube.com/embed/q7dmfHcdXf4'),
(2, 'AnyFiles', 'http://anyfiles.pl/w.jsp?v=98942,0,default,false,true,640,360'),
(3, 'Youtube', 'https://www.youtube.com/embed/MWRUNTLisPo'),
(4, 'Vimeo', 'https://player.vimeo.com/video/197671155'),
(5, 'Youtube', 'https://www.youtube.com/embed/XtLZZE76aPQ'),
(6, 'vShare', 'https://vshare.io/v/f0db09e/width-740/height-400/'),
(7, 'Youtube', 'https://www.youtube.com/embed/gfJVoF5ko1Y'),
(8, 'Youtube', 'https://www.youtube.com/embed/Ap7TEHsxl50'),
(9, 'Youtube', 'https://www.youtube.com/embed/GxLXGoEFc8Q'),
(10, 'Youtube', 'https://www.youtube.com/embed/y3FbVC0wvEw'),
(11, 'Youtube', 'https://www.youtube.com/embed/fFZJEDwAQjQ'),
(12, 'Youtube', 'https://www.youtube.com/embed/vaXLj9O0vlE'),
(13, 'Youtube', 'https://www.youtube.com/embed/oLfVA5VJ_Vk'),
(14, 'Youtube', 'https://www.youtube.com/embed/r7R0ovtv7HI');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `description`) VALUES
(1, 'Keyboard', '19.99', 'Ergonomic and stylish!'),
(2, 'ddsdsd', '19.99', 'Ergonomic and stylish!'),
(3, 'Keyboard', '19.99', 'Ergonomic and stylish!'),
(4, 'Keyboard', '19.99', 'Ergonomic and stylish!'),
(5, 'Keyboard', '19.99', 'Ergonomic and stylish!'),
(6, 'Keyboard', '19.99', 'Ergonomic and stylish!'),
(7, 'Keyboard', '19.99', 'Ergonomic and stylish!'),
(8, 'Keyboard', '19.99', 'Ergonomic and stylish!');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `thread`
--

CREATE TABLE `thread` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_commentable` tinyint(1) NOT NULL,
  `num_comments` int(11) NOT NULL,
  `last_comment_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `thread`
--

INSERT INTO `thread` (`id`, `permalink`, `is_commentable`, `num_comments`, `last_comment_at`) VALUES
('1', 'http://localhost/video/web/app_dev.php/video/1', 1, 0, NULL),
('10', 'http://localhost/video/web/app_dev.php/video/10', 1, 0, NULL),
('11', 'http://localhost/video/web/app_dev.php/video/11', 1, 0, NULL),
('2', 'http://localhost/video/web/app_dev.php/video/2', 1, 0, NULL),
('3', 'http://localhost/video/web/app_dev.php/video/3', 1, 0, NULL),
('4', 'http://localhost/video/web/app_dev.php/video/4', 1, 1, '2017-01-08 14:17:35'),
('5', 'http://localhost/video/web/app_dev.php/video/5', 1, 0, NULL),
('6', 'http://localhost/video/web/app_dev.php/video/6', 1, 0, NULL),
('7', 'http://localhost/video/web/app_dev.php/video/7', 1, 0, NULL),
('8', 'http://localhost/video/web/app_dev.php/video/8', 1, 0, NULL),
('9', 'http://localhost/video/web/app_dev.php/video/9', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vote`
--

CREATE TABLE `vote` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `value` int(11) NOT NULL,
  `voter_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526CE2904019` (`thread_id`),
  ADD KEY `IDX_9474526CF675F31B` (`author_id`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `film_genre`
--
ALTER TABLE `film_genre`
  ADD PRIMARY KEY (`film_id`,`genre_id`),
  ADD KEY `IDX_1A3CCDA84296D31F` (`genre_id`);

--
-- Indexes for table `film_link`
--
ALTER TABLE `film_link`
  ADD PRIMARY KEY (`film_id`,`link_id`),
  ADD KEY `IDX_530373F2567F5183` (`film_id`),
  ADD KEY `IDX_530373F2ADA40271` (`link_id`);

--
-- Indexes for table `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5A108564F8697D13` (`comment_id`),
  ADD KEY `IDX_5A108564EBB4B8AD` (`voter_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT dla tabeli `fos_user`
--
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT dla tabeli `link`
--
ALTER TABLE `link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT dla tabeli `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT dla tabeli `vote`
--
ALTER TABLE `vote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526CE2904019` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`),
  ADD CONSTRAINT `FK_9474526CF675F31B` FOREIGN KEY (`author_id`) REFERENCES `fos_user` (`id`);

--
-- Ograniczenia dla tabeli `film_genre`
--
ALTER TABLE `film_genre`
  ADD CONSTRAINT `film_genre_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `film_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);

--
-- Ograniczenia dla tabeli `film_link`
--
ALTER TABLE `film_link`
  ADD CONSTRAINT `FK_530373F2567F5183` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `FK_530373F2ADA40271` FOREIGN KEY (`link_id`) REFERENCES `link` (`id`);

--
-- Ograniczenia dla tabeli `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `FK_5A108564EBB4B8AD` FOREIGN KEY (`voter_id`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_5A108564F8697D13` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
