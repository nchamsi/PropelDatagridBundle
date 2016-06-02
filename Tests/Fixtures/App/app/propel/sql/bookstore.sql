
# This is a fix for InnoDB in MySQL >= 4.1.x
# It "suspends judgement" for fkey relationships until are tables are set.
SET FOREIGN_KEY_CHECKS = 0;

-- ---------------------------------------------------------------------
-- book
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Book Id',
    `title` VARCHAR(255) NOT NULL COMMENT 'Book Title',
    `isbn` VARCHAR(24) NOT NULL COMMENT 'ISBN Number',
    `price` FLOAT COMMENT 'Price of the book.',
    `publisher_id` INTEGER COMMENT 'Foreign Key Publisher',
    `author_id` INTEGER COMMENT 'Foreign Key Author',
    PRIMARY KEY (`id`),
    INDEX `book_fi_35872e` (`publisher_id`),
    INDEX `book_fi_ea464c` (`author_id`),
    CONSTRAINT `book_fk_35872e`
        FOREIGN KEY (`publisher_id`)
        REFERENCES `publisher` (`id`)
        ON DELETE SET NULL,
    CONSTRAINT `book_fk_ea464c`
        FOREIGN KEY (`author_id`)
        REFERENCES `author` (`id`)
        ON UPDATE CASCADE
        ON DELETE SET NULL
) ENGINE=InnoDB COMMENT='Book Table';

-- ---------------------------------------------------------------------
-- publisher
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `publisher`;

CREATE TABLE `publisher`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Publisher Id',
    `name` VARCHAR(128) DEFAULT 'Penguin' NOT NULL COMMENT 'Publisher Name',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT='Publisher Table';

-- ---------------------------------------------------------------------
-- author
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `author`;

CREATE TABLE `author`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Author Id',
    `first_name` VARCHAR(128) NOT NULL COMMENT 'First Name',
    `last_name` VARCHAR(128) NOT NULL COMMENT 'Last Name',
    `email` VARCHAR(128) COMMENT 'E-Mail Address',
    `age` INTEGER COMMENT 'The authors age',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT='Author Table';

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
