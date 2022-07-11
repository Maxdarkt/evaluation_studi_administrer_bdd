-- Tourneux Maxence - Evaluation administrer une BDD
-- DATABASE : `cinema`

-- |------------------------------|------------------------------| --
-- create table and insert data
-- |------------------------------|------------------------------| --

-- Structure of the table `Cinemas`
CREATE TABLE IF NOT EXISTS `Cinemas`(
	`id_cinema` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`name_cinema` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `postal` VARCHAR(255) NOT NULL,
  `user_id` INT(11) NOT NULL
);

-- Data of the table `Cinemas`
INSERT INTO `Cinemas` (`id_cinema`, `name_cinema`, `address`, `city`, `postal`, `user_id`) VALUES 
(NULL, "Pathé Annecy", "7 avenue de Brogny", "Annecy", "74000", 2),
(NULL, "Les Nemours", "2 place sainte-clair", "Annecy", "74000", 3),
(NULL, "La Turbine", "3 rue des Tisserands", "Annecy", "74000", 4),
(NULL, "Mikado", "2 place de l'Annapurna", "Annecy", "74000", 5);

-- Structure of the table `Users`
CREATE TABLE IF NOT EXISTS `Users`(
	`id_user` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`login` VARCHAR(255) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	`role` VARCHAR(255) NOT NULL,
  `cinema_id` INT(11) DEFAULT NULL
);

-- Data of the table `Users`
INSERT INTO `Users` (`id_user`, `login`, `password`, `role`, `cinema_id`) VALUES 
(NULL, "admin@cinemas.com", "$2a$10$mZUVyK.OCk9nYDpwcv95yeiuSWA192W3zNOdHuhe1U8PHXxdl4oxy", 50, NULL),
-- BCRYPT hash 10
-- Admin2022!
(NULL, "Mathieu@pathe-annecy@fr", "$2a$10$9JP/7p.aIU5G10/bcR/ihe7Uroue4gkDsfxG1HUfJNTzpqUqtFgdi", 40, 1),
-- Mat2022!
(NULL, "Cecile@les-nemours.fr", "$2a$10$e6yB4iAqaCFObqvMw8SWIuMRBsiQ7IikmcvgRqM70LE9cahH.xJ1q", 40, 2),
-- Cec2022!
(NULL, "Justine@la-turbine.fr", "$2a$10$Zmb8yw.XBGCweeaRsKM3semXTDlrjR1hdFMkgjboHWV8ItDHNnY36", 40, 3),
-- Jus2022!
(NULL, "Alex@mikado.fr", "$2a$10$4MjmcyvL10DmUcCDR22umelJ/y5Z9JHYkNBxxwnhGH2HTiVIAFNga", 40, 4);
-- Ale2022!


-- Structure of the table `Rooms`
CREATE TABLE IF NOT EXISTS `Rooms`(
	`id_room` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`name_room` VARCHAR(255) NOT NULL,
	`seats_room` SMALLINT(1) NOT NULL,
	`cinema_id` INT(11) NOT NULL
);

-- Data of the table `Rooms`
INSERT INTO `Rooms` (`id_room`, `name_room`, `seats_room`, `cinema_id`) VALUES 
(NULL, 1, 255, 1),
(NULL, 2, 135, 1),
(NULL, 3, 100, 1),
(NULL, 4, 65, 1),
(NULL, 1, 242, 2),
(NULL, 2, 155, 2),
(NULL, 3, 70, 2),
(NULL, 1, 280, 3),
(NULL, 2, 280, 3),
(NULL, 3, 125, 3),
(NULL, 4, 90, 3),
(NULL, 1, 150, 4),
(NULL, 2, 120, 4),
(NULL, 3, 45, 4);

-- Structure of the table `Movies`
CREATE TABLE IF NOT EXISTS `Movies`(
	`id_movie` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`name_movie` VARCHAR(100) NOT NULL,
	`type_movie` VARCHAR(50) NOT NULL,
  `synopsis` TEXT(1500) NOT NULL,
	`duration` SMALLINT(1) NOT NULL,
	`rooms_id` VARCHAR(255) NOT NULL
);

-- Data of the table `Movies`
INSERT INTO `Movies` (`id_movie`, `name_movie`, `type_movie`, `synopsis`, `duration`, `rooms_id`) VALUES 
(
  NULL, 
  "Irréductible", 
  "Comédie", 
  "Vincent Peltier, paisible employé aux « Eaux et forêts » à Limoges, est incité à démissionner à cause d'une révision des effectifs, ce qu'il souhaite le moins du monde. Une inspectrice trop zélée décide de le muter dans les pires endroits au monde pour le pousser à renoncer. Elle l'envoie donc au Groenland pour protéger les chercheurs d'une base scientifique contre les attaques d'ours. Et on n'en est qu'aux dix premières minutes du film. On vous laisse imaginer la suite", 
  86, 
  "1,2,8,12"
),
(
  NULL, 
  "Jurassic World : Le Monde d'après", 
  "SF/Action", 
  "Quatre ans après la destruction de Isla Nublar. Les dinosaures font désormais partie du quotidien de l'humanité entière. Un équilibre fragile qui va remettre en question la domination de l'espèce humaine maintenant qu'elle doit partager son espace avec les créatures les plus féroces que l'histoire ait jamais connues...", 
  146, 
  "2,4,10,13"
),
(
  NULL,
  "Top Gun : Maverick", 
  "Action", 
  "Après avoir été l'un des meilleurs pilotes de chasse de la Marine américaine pendant plus de trente ans, Pete Maverick Mitchell continue à repousser ses limites en tant que pilote d'essai. Il refuse de monter en grade, car cela l'obligerait à renoncer à voler. Il est chargé de former un détachement de jeunes diplômés de l'école Top Gun pour une mission spéciale qu'aucun pilote n'aurait jamais imaginée. Lors de cette mission, Maverick rencontre le lieutenant Bradley Rooster Bradshaw, le fils de son défunt ami, le navigateur Nick Goose Bradshaw. Face à un avenir incertain, hanté par ses fantômes, Maverick va devoir affronter ses pires cauchemars au cours d'une mission qui exigera les plus grands des sacrifices.", 
  131, 
  "1,2,8,9,12,13"
),
(
  NULL, 
  "Le Ballon d'OR", 
  "Comédie", 
  "Bandian habite le petit village guinéen de Makono, perdu au fond de la forêt. Il n’a pas 13 ans....", 
  90, 
  "5, 14" 
);

-- Structure of the table `Schedules`
CREATE TABLE IF NOT EXISTS `Schedules`(
  `id_schedule` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`room_id` INT(11) NOT NULL,
	`movie_id` INT(11) NOT NULL,
  `hour_id` INT(11) NOT NULL
);

-- Data of the table `Schedules`
INSERT INTO `Schedules` (`id_schedule`, `room_id`, `movie_id`, `hour_id`) VALUES 
(NULL, 1, 1, 2),
(NULL, 1, 1, 6),
(NULL, 1, 2, 5),
(NULL, 2, 2, 1),
(NULL, 2, 2, 3),
(NULL, 7, 3, 4),
(NULL, 8, 1, 2),
(NULL, 8, 1, 6),
(NULL, 8, 2, 5),
(NULL, 9, 4, 1),
(NULL, 9, 4, 2),
(NULL, 14, 3, 4),
(NULL, 14, 3, 6);

-- Structure of the table `Hours`
CREATE TABLE IF NOT EXISTS `Hours`(
	`id_hour` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`start_hour` VARCHAR(100) NOT NULL,
  `cinema_id` INT(11) NOT NULL
);

-- Data of the table `Hours`
INSERT INTO `Hours` (`id_hour`, `start_hour`, `cinema_id`) VALUES 
(NULL, "11:00", 1),
(NULL, "14:00", 1),
(NULL, "16:00", 1),
(NULL, "18:00", 1),
(NULL, "20:00", 1),
(NULL, "22:00", 1),
(NULL, "11:30", 2),
(NULL, "14:30", 2),
(NULL, "18:30", 2),
(NULL, "20:30", 2),
(NULL, "11:30", 3),
(NULL, "14:15", 3),
(NULL, "16:30", 3),
(NULL, "18:00", 3),
(NULL, "20:30", 3),
(NULL, "22:00", 3),
(NULL, "11:00", 4),
(NULL, "14:30", 4),
(NULL, "16:00", 4),
(NULL, "18:30", 4),
(NULL, "20:30", 4),
(NULL, "22:30", 4),

-- Structure of the table `Prices`
CREATE TABLE IF NOT EXISTS `Prices`(
	`id_price` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`Full_price` SMALLINT(1) DEFAULT NULL,
	`student` SMALLINT(1) DEFAULT NULL,
	`Under_14` SMALLINT(1) DEFAULT NULL,
  `cinema_id` INT(11) NOT NULL
);

-- Data of the table `Prices`
INSERT INTO `Prices` (`id_price`, `Full_price`, `student`, `Under_14`,`cinema_id`) VALUES 
(NULL, 920, 760, 590, 1),
(NULL, 920, NULL, 590, 2),
(NULL, 920, 760, 590, 3),
(NULL, 920, 760, 590, 4);

-- Structure of the table `Booking`
CREATE TABLE IF NOT EXISTS `Booking`(
	`id_booking` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`schedule_id` INT(11) NOT NULL,
	`user_id` INT(11) NOT NULL
);

-- Data of the table `Booking`
INSERT INTO `Booking` (`id_booking`, `schedule_id`, `user_id`) VALUES 
(NULL, 4, 1),
(NULL, 1, 2),
(NULL, 2, 3),
(NULL, 3, 4),
(NULL, 3, 5);

-- |------------------------------|------------------------------| --
-- Asociations
-- |------------------------------|------------------------------| --

-- Association OneToMany Rooms -> Cinemas
ALTER TABLE `Rooms` ADD CONSTRAINT `FK_ROOMS_CINEMAS` FOREIGN KEY (`cinema_id`) REFERENCES `Cinemas`(`id_cinema`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Association OneToMany Users -> Cinemas
ALTER TABLE `Users` 
  ADD CONSTRAINT `FK_USERS_CINEMAS` FOREIGN KEY (`cinema_id`) REFERENCES `Cinemas`(`id_cinema`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD UNIQUE KEY `USERS_LOGIN_UNIQUE` (`login`);

-- Association OneToMany Prices -> Cinemas
ALTER TABLE `Prices` ADD CONSTRAINT `FK_PRICES_CINEMAS` FOREIGN KEY (`cinema_id`) REFERENCES `Cinemas`(`id_cinema`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Association OneToMany Hours -> Cinemas
ALTER TABLE `Hours` ADD CONSTRAINT `FK_HOURS_CINEMAS` FOREIGN KEY (`cinema_id`) REFERENCES `Cinemas`(`id_cinema`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Association ManyToMany Schedules -> Rooms + Movies + Hours
ALTER TABLE `Schedules` 
  ADD CONSTRAINT `FK_SCHEDULES_ROOMS` FOREIGN KEY (`room_id`) REFERENCES `Rooms`(`id_room`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_SCHEDULES_HOURS` FOREIGN KEY (`hour_id`) REFERENCES `Hours`(`id_hour`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_SCHEDULES_MOVIES` FOREIGN KEY (`movie_id`) REFERENCES `Movies`(`id_movie`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Association ManyToMany Booking -> Schedules + Users + Cinemas
ALTER TABLE `Booking` 
  ADD CONSTRAINT `FK_BOOKING_SCHEDULES` FOREIGN KEY (`schedule_id`) REFERENCES `Schedules`(`id_schedule`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_BOOKING_USERS` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- |------------------------------|------------------------------| --
-- Backup && Restore
-- |------------------------------|------------------------------| --

-- backup database
-- mysqldump -h 127.0.0.1 -u root -p cinema > ~/Téléchargements/backup_cinema.sql

-- Import database
-- mysql -h 127.0.0.1 -u root -p cinema < ~/Téléchargements/backup_cinema.sql