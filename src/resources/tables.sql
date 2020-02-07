CREATE TABLE `Departement` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(50)
);

CREATE TABLE `User` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `mail` varchar(80),
  `pseudo` varchar(80),
  `password` varchar(120),
  `salt` varchar(3),
  `departement_id` int,
  `num_tel` varchar(10),
  `ville` varchar(100)
);

CREATE TABLE `Annonce` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `departement_id` int,
  `ville` varchar(100),
  `description` blob,
  `titre` varchar(150),
  `prix` double,
  `user_id` int,
  `creation_date` datetime,
  `categorie_id` int,
  `closed` boolean
);

CREATE TABLE `Categorie` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(100)
);

CREATE TABLE `Images` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `url` varchar(200),
  `annonce_id` int,
  `ordre` int
);

ALTER TABLE `User` ADD FOREIGN KEY (`departement_id`) REFERENCES `Departement` (`id`);

ALTER TABLE `Annonce` ADD FOREIGN KEY (`departement_id`) REFERENCES `Departement` (`id`);

ALTER TABLE `Annonce` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);

ALTER TABLE `Annonce` ADD FOREIGN KEY (`categorie_id`) REFERENCES `Categorie` (`id`);

ALTER TABLE `Images` ADD FOREIGN KEY (`annonce_id`) REFERENCES `Annonce` (`id`);
