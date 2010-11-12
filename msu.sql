-- --------------------------------------------------------     
--  `url`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `url`;

CREATE TABLE url (
   id  INTEGER PRIMARY KEY,
   long_url VARCHAR(250) NOT NULL,
   sexy_url VARCHAR(30) NOT NULL
);
