SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


CREATE TABLE IF NOT EXISTS A_choices (
  A_choice tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS B_choices (
  B_choice tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Cars (
  car_ID smallint(5) unsigned NOT NULL,
  car_age tinyint(3) unsigned NOT NULL,
  car_value enum('a','b','c','d','e','f','g','h','i') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Customers (
  customer_ID mediumint(8) unsigned NOT NULL,
  `time` time NOT NULL,
  geography_ID smallint(5) unsigned NOT NULL,
  car_ID smallint(5) unsigned NOT NULL,
  family_ID smallint(5) unsigned NOT NULL,
  risk_factor tinyint(3) unsigned DEFAULT NULL,
  A tinyint(3) unsigned NOT NULL,
  B tinyint(3) unsigned NOT NULL,
  C tinyint(3) unsigned NOT NULL,
  D tinyint(3) unsigned NOT NULL,
  E tinyint(3) unsigned NOT NULL,
  F tinyint(3) unsigned NOT NULL,
  G tinyint(3) unsigned NOT NULL,
  cost smallint(5) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS C_choices (
  C_choice tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS D_choices (
  D_choice tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS E_choices (
  E_choice tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Families (
  family_ID smallint(5) unsigned NOT NULL,
  group_size tinyint(3) unsigned NOT NULL,
  age_oldest tinyint(3) unsigned NOT NULL,
  age_youngest tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS F_choices (
  F_choice tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Geography (
  geography_ID smallint(5) unsigned NOT NULL,
  state enum('AL','AR','CO','CT','DC','DE','FL','GA','IA','ID','IN','KS','KY','MD','ME','MO','MS','MT','ND','NE','NH','NM','NV','NY','OH','OK','OR','PA','RI','SD','TN','UT','WA','WI','WV','WY') NOT NULL,
  location smallint(5) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS G_choices (
  G_choice tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Homeowner (
  customer_ID mediumint(8) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Married (
  customer_ID mediumint(8) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS Previous (
  customer_ID mediumint(8) unsigned NOT NULL,
  C_previous tinyint(3) unsigned NOT NULL,
  duration_previous tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS ShoppingPoints (
  customer_ID mediumint(8) unsigned NOT NULL,
  shopping_pt tinyint(10) unsigned NOT NULL,
  `time` time NOT NULL,
  A tinyint(3) unsigned NOT NULL,
  B tinyint(3) unsigned NOT NULL,
  C tinyint(3) unsigned NOT NULL,
  D tinyint(3) unsigned NOT NULL,
  E tinyint(3) unsigned NOT NULL,
  F tinyint(3) unsigned NOT NULL,
  G tinyint(3) unsigned NOT NULL,
  cost smallint(5) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE A_choices
 ADD PRIMARY KEY (A_choice);

ALTER TABLE B_choices
 ADD PRIMARY KEY (B_choice);

ALTER TABLE Cars
 ADD UNIQUE KEY car_ID (car_ID);

ALTER TABLE Customers
 ADD PRIMARY KEY (customer_ID), ADD KEY C (C), ADD KEY A (A), ADD KEY B (B), ADD KEY D (D), ADD KEY E (E), ADD KEY F (F), ADD KEY G (G), ADD KEY Geography_ID (geography_ID), ADD KEY Geography_ID_2 (geography_ID), ADD KEY car_ID (car_ID), ADD KEY family_ID (family_ID);

ALTER TABLE C_choices
 ADD PRIMARY KEY (C_choice);

ALTER TABLE D_choices
 ADD PRIMARY KEY (D_choice);

ALTER TABLE E_choices
 ADD PRIMARY KEY (E_choice);

ALTER TABLE Families
 ADD UNIQUE KEY family_ID (family_ID);

ALTER TABLE F_choices
 ADD PRIMARY KEY (F_choice);

ALTER TABLE Geography
 ADD UNIQUE KEY Geography_ID (geography_ID);

ALTER TABLE G_choices
 ADD PRIMARY KEY (G_choice);

ALTER TABLE Homeowner
 ADD PRIMARY KEY (customer_ID);

ALTER TABLE Married
 ADD PRIMARY KEY (customer_ID);

ALTER TABLE Previous
 ADD PRIMARY KEY (customer_ID), ADD KEY C_previous (C_previous);

ALTER TABLE ShoppingPoints
 ADD PRIMARY KEY (customer_ID,shopping_pt), ADD KEY C (C), ADD KEY A (A), ADD KEY B (B), ADD KEY D (D), ADD KEY E (E), ADD KEY F (F), ADD KEY G (G);


ALTER TABLE Customers
ADD CONSTRAINT Customers_ibfk_11 FOREIGN KEY (family_ID) REFERENCES Families (family_ID),
ADD CONSTRAINT Customers_ibfk_10 FOREIGN KEY (car_ID) REFERENCES Cars (car_ID),
ADD CONSTRAINT Customers_ibfk_2 FOREIGN KEY (A) REFERENCES A_choices (A_choice),
ADD CONSTRAINT Customers_ibfk_3 FOREIGN KEY (B) REFERENCES B_choices (B_choice),
ADD CONSTRAINT Customers_ibfk_4 FOREIGN KEY (C) REFERENCES C_choices (C_choice),
ADD CONSTRAINT Customers_ibfk_5 FOREIGN KEY (D) REFERENCES D_choices (D_choice),
ADD CONSTRAINT Customers_ibfk_6 FOREIGN KEY (E) REFERENCES E_choices (E_choice),
ADD CONSTRAINT Customers_ibfk_7 FOREIGN KEY (F) REFERENCES F_choices (F_choice),
ADD CONSTRAINT Customers_ibfk_8 FOREIGN KEY (G) REFERENCES G_choices (G_choice),
ADD CONSTRAINT Customers_ibfk_9 FOREIGN KEY (geography_ID) REFERENCES Geography (geography_ID);

ALTER TABLE Homeowner
ADD CONSTRAINT Homeowner_ibfk_1 FOREIGN KEY (customer_ID) REFERENCES Customers (customer_ID);

ALTER TABLE Married
ADD CONSTRAINT Married_ibfk_1 FOREIGN KEY (customer_ID) REFERENCES Customers (customer_ID);

ALTER TABLE Previous
ADD CONSTRAINT Previous_ibfk_2 FOREIGN KEY (customer_ID) REFERENCES Customers (customer_ID),
ADD CONSTRAINT Previous_ibfk_1 FOREIGN KEY (C_previous) REFERENCES C_choices (C_choice);

ALTER TABLE ShoppingPoints
ADD CONSTRAINT ShoppingPoints_ibfk_2 FOREIGN KEY (C) REFERENCES C_choices (C_choice),
ADD CONSTRAINT ShoppingPoints_ibfk_3 FOREIGN KEY (A) REFERENCES A_choices (A_choice),
ADD CONSTRAINT ShoppingPoints_ibfk_4 FOREIGN KEY (B) REFERENCES B_choices (B_choice),
ADD CONSTRAINT ShoppingPoints_ibfk_5 FOREIGN KEY (D) REFERENCES D_choices (D_choice),
ADD CONSTRAINT ShoppingPoints_ibfk_6 FOREIGN KEY (E) REFERENCES E_choices (E_choice),
ADD CONSTRAINT ShoppingPoints_ibfk_7 FOREIGN KEY (F) REFERENCES F_choices (F_choice),
ADD CONSTRAINT ShoppingPoints_ibfk_8 FOREIGN KEY (G) REFERENCES G_choices (G_choice),
ADD CONSTRAINT ShoppingPoints_ibfk_9 FOREIGN KEY (customer_ID) REFERENCES Customers (customer_ID);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
