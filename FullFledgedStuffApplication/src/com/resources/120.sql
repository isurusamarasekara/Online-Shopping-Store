CREATE DATABASE `full_fledged_stuff_application` /*!40100 DEFAULT CHARACTER SET utf8 */;

CREATE TABLE `registered_user_details` (
  `userId` int(11) NOT NULL,
  `prefix` varchar(6) NOT NULL,
  `fName` varchar(45) NOT NULL,
  `lName` varchar(45) NOT NULL,
  `birthDate` date DEFAULT NULL,
  `addLine1` varchar(45) NOT NULL,
  `addLine2` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `district` varchar(45) DEFAULT NULL,
  `state_Province` varchar(45) NOT NULL,
  `zip` int(11) NOT NULL,
  `country` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `registered_user_credentials` (
  `userId` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `question01` varchar(70) NOT NULL,
  `answer01` varchar(40) NOT NULL,
  `question02` varchar(70) NOT NULL,
  `answer02` varchar(40) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  CONSTRAINT `user_cre_FK1` FOREIGN KEY (`userId`) REFERENCES `registered_user_details` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `registered_admin_details` (
  `adminId` char(6) NOT NULL,
  `prefixAdmin` varchar(6) NOT NULL,
  `fnameAdmin` varchar(45) NOT NULL,
  `lnameAdmin` varchar(45) NOT NULL,
  PRIMARY KEY (`adminId`),
  UNIQUE KEY `adminId_UNIQUE` (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `registered_admin_credentials` (
  `adminId` char(6) NOT NULL,
  `adminUserName` varchar(45) NOT NULL,
  `adminPassword` varchar(45) NOT NULL,
  PRIMARY KEY (`adminId`),
  UNIQUE KEY `adminId_UNIQUE` (`adminId`),
  UNIQUE KEY `adminUserName_UNIQUE` (`adminUserName`),
  CONSTRAINT `admin_cre_FK1` FOREIGN KEY (`adminId`) REFERENCES `registered_admin_details` (`adminId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `items` (
  `itemId` char(8) NOT NULL,
  `priorityLvl` int(11) NOT NULL,
  `itemName` varchar(300) NOT NULL,
  `itemPicUrl` varchar(300) NOT NULL,
  `specifics` varchar(300) NOT NULL,
  `description` varchar(400) NOT NULL,
  `category` varchar(20) NOT NULL,
  `unitPrice` double NOT NULL,
  `qtyAvailable` int(11) NOT NULL,
  `associates` varchar(300) NOT NULL,
  PRIMARY KEY (`itemId`),
  UNIQUE KEY `itemId_UNIQUE` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `book` (
  `bookID` char(8) NOT NULL,
  `author` varchar(100) NOT NULL,
  `genre` varchar(45) NOT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`bookID`),
  UNIQUE KEY `bookID_UNIQUE` (`bookID`),
  CONSTRAINT `book_FK1` FOREIGN KEY (`bookID`) REFERENCES `items` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `art` (
  `artId` char(8) NOT NULL,
  PRIMARY KEY (`artId`),
  UNIQUE KEY `artId_UNIQUE` (`artId`),
  CONSTRAINT `art_FK1` FOREIGN KEY (`artId`) REFERENCES `items` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `deals` (
  `dealsId` char(8) NOT NULL,
  PRIMARY KEY (`dealsId`),
  UNIQUE KEY `dealsId_UNIQUE` (`dealsId`),
  CONSTRAINT `deals_FK1` FOREIGN KEY (`dealsId`) REFERENCES `items` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `electronics` (
  `electronicsId` char(8) NOT NULL,
  PRIMARY KEY (`electronicsId`),
  UNIQUE KEY `electronicsId_UNIQUE` (`electronicsId`),
  CONSTRAINT `electronics_FK1` FOREIGN KEY (`electronicsId`) REFERENCES `items` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fashion` (
  `fashionId` char(8) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`fashionId`),
  UNIQUE KEY `idfashion_UNIQUE` (`fashionId`),
  CONSTRAINT `fashion_FK1` FOREIGN KEY (`fashionId`) REFERENCES `items` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `home_garden` (
  `home_gardenId` char(8) NOT NULL,
  PRIMARY KEY (`home_gardenId`),
  UNIQUE KEY `home_gardenId_UNIQUE` (`home_gardenId`),
  CONSTRAINT `home_garden_FK1` FOREIGN KEY (`home_gardenId`) REFERENCES `items` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `motor` (
  `motorId` char(8) NOT NULL,
  PRIMARY KEY (`motorId`),
  UNIQUE KEY `motorId_UNIQUE` (`motorId`),
  CONSTRAINT `motor_FK1` FOREIGN KEY (`motorId`) REFERENCES `items` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sport` (
  `sportId` char(8) NOT NULL,
  PRIMARY KEY (`sportId`),
  UNIQUE KEY `sportId_UNIQUE` (`sportId`),
  CONSTRAINT `sport_FK1` FOREIGN KEY (`sportId`) REFERENCES `items` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stationary` (
  `stationaryId` char(8) NOT NULL,
  `distributor` varchar(45) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`stationaryId`),
  UNIQUE KEY `stationaryId_UNIQUE` (`stationaryId`),
  CONSTRAINT `stationary_FK1` FOREIGN KEY (`stationaryId`) REFERENCES `items` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `watches` (
  `watchesId` char(8) NOT NULL,
  PRIMARY KEY (`watchesId`),
  UNIQUE KEY `watchesId_UNIQUE` (`watchesId`),
  CONSTRAINT `watches_FK1` FOREIGN KEY (`watchesId`) REFERENCES `items` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `orders` (
  `userId` int(11) NOT NULL,
  `itemId` char(8) NOT NULL,
  `orderId` char(8) NOT NULL,
  `quantity` int(11) NOT NULL,
  `orderTotal` double NOT NULL,
  `orderDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(45) NOT NULL DEFAULT 'pending',
  `addLine1` varchar(45) NOT NULL,
  `addLine2` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `district` varchar(45) DEFAULT NULL,
  `state_province` varchar(45) NOT NULL,
  `zip` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`userId`,`itemId`,`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* registered_user_details table */

INSERT INTO `full_fledged_stuff_application`.`registered_user_details` (`userId`, `prefix`, `fName`, `lName`, `birthDate`, `addLine1`, `addLine2`, `city`, `district`, `state_Province`, `zip`, `country`, `email`)
VALUES(1, 'Mr.', 'Isuru', 'Samarasekara', NULL, '83/2 Piliyandala Road,', '', 'Maharagama', 'Colombo', 'Western Province', 10280, 'Sri Lanka', 'isurusamarasekara@gmail.com');

INSERT INTO `full_fledged_stuff_application`.`registered_user_details` (`userId`, `prefix`, `fName`, `lName`, `birthDate`, `addLine1`, `addLine2`, `city`, `district`, `state_Province`, `zip`, `country`, `email`)
VALUES(3, 'Mr.', 'Chathurka', 'Vishmantha', NULL, 'wb', '', 'Homagama', 'Colombo', 'Western Province', 10280, 'Sri Lanka', 'chathurkavish@gmail.com');

INSERT INTO `full_fledged_stuff_application`.`registered_user_details` (`userId`, `prefix`, `fName`, `lName`, `birthDate`, `addLine1`, `addLine2`, `city`, `district`, `state_Province`, `zip`, `country`, `email`)
VALUES(2, 'Mrs.', 'Keshani', 'Bogahawatte', NULL, '8 Wanatha Road,', '', 'Maharagama', 'Colombo', 'Western Province', 10280, 'Sri Lanka', 'kbogahawatte@gmail.com');



/* registered_user_credentials table */

INSERT INTO `full_fledged_stuff_application`.`registered_user_credentials` (`userId`, `username`, `password`, `question01`, `answer01`, `question02`, `answer02`)
VALUES
(1, 'karawalaya', 'okok', 'What is my nick name?', 'Karawalaya', 'What is my ambition?', 'Astronaut');

INSERT INTO `full_fledged_stuff_application`.`registered_user_credentials` (`userId`, `username`, `password`, `question01`, `answer01`, `question02`, `answer02`)
VALUES
(2, 'keshi', 'keshi', 'What is my favorite color ?', 'peach', 'Where do i live ?', 'Maharagama');

INSERT INTO `full_fledged_stuff_application`.`registered_user_credentials` (`userId`, `username`, `password`, `question01`, `answer01`, `question02`, `answer02`)
VALUES
(3, 'vishmantha', 'charthurka', 'What is my favorite color ?', 'red', 'Who is my girlfriend', 'Vinu');



/* registered_admin_details table */

INSERT INTO `full_fledged_stuff_application`.`registered_admin_details` (`adminId`, `prefixAdmin`, `fnameAdmin`, `lnameAdmin`)
VALUES('IT0001', 'Mr.', 'Isuru', 'Samarasekara');



/* registered_admin_credentials table */

INSERT INTO `full_fledged_stuff_application`.`registered_admin_credentials` (`adminId`, `adminUserName`, `adminPassword`)
VALUES ('IT0001', 'dananjaya', 'dana');



/* items table */

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('ARBR0001', 28, 'Acrylic Paint Brushes', 'Imgs/ProductsImgs/Arts/paintBrushes.jpg', 'Acrylic Nylon Paint Brushes', '12pc Red Pearl Wooden Acrylic Artist Oil Watercolor Painting Nylon Paint Brushes', 'art', 780, 7, 'arts essentials brush');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('AROP0001', 31, 'Graduate Oil Paint Set 10 Piece', 'Imgs/ProductsImgs/Arts/oilPaint.jpg', 'Daler-Rowney Graduate Oil Colour Selection Set', 'Contains 10 basic colors in 38 ml (1.3 oz) tubes including: Titanium White, Lemon Yellow, Cadmium Red, Crimson Primary Red, Ultramarine, Sap Green, Yellow Ochre, Burnt Umber, Burnt Sienna, and Ivory Black.', 'art', 1190, 4, 'arts essentials paint');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('ARPT0001', 26, 'Original Oil Painting Iris Flower', 'Imgs/ProductsImgs/Arts/irisFlower.jpg', 'FLower Paintings', 'Iris Trio By Stanton of New Orleans 30x30 Gallery Wrapped', 'art', 8500, 1, 'arts paintings flower');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('ARPT0002', 27, 'Original Garden Arts Oil Painting', 'Imgs/ProductsImgs/Arts/gardenPainting.jpg', 'Garden Painting', 'Original Garden Art by KFox', 'art', 7500, 2, 'arts paintings flower');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKAD0001', 11, 'Five on a Tresure Island', 'Imgs/ProductsImgs/Books/BKAD (Book Adventure)/Five-On-A-Treasure-Island.jpg', '15th Edition (2003), Soft Cover', 'Five on a Treasure Island is a popular children\'s book by Enid Blyton. It is the first book in The Famous Five series. The first edition of the book was illustrated by Eileen Soper.', 'book', 600, 4, 'book books mystery adventure fiction children enid blyton');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKAD0003', 25, 'Robinson Crusoe', 'Imgs/ProductsImgs/Books/BKAD (Book Adventure)/Robinson Crusoe.jpg', '3rd edition', 'Robinson Crusoe is a novel by Daniel Defoe, first published on 25 April 1719. The first edition credited the work\'s protagonist Robinson Crusoe as its author, leading many readers to believe he was a', 'book', 900, 9, 'book books drama daniel defoe');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKCF0001', 13, 'The Universe in a Nutshell', 'Imgs/ProductsImgs/Books/BKCF (Book Coffee Table)/The-Universe-In-A-Nutshell.jpg', '5th Edition (2010), Hard Cover', 'The Universe in a Nutshell is a 2001 book about theoretical physics by Stephen Hawking.[1][2] It is generally considered a sequel and was created to update the public concerning developments since the multi-million-copy bestseller A Brief History of Time published in 1988.', 'book', 2100, 3, 'book books cofee table stephen hawking');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKCM0001', 15, 'Diary of a Wimpy Kid: The Ugly Truth', 'Imgs/ProductsImgs/Books/BKCM (Book Comedy)/Diary-of-a-Wimpy-Kid-The-Ugly-Truth.jpg', '3rd Edition (2015), Hard Cover', 'Diary of a Wimpy Kid: The Ugly Truth is a 2010 bestselling children\'s fiction book by American author and cartoonist Jeff Kinney and is the fifth book in the Diary of a Wimpy Kid series.', 'book', 1600, 3, 'book books humor fiction comedy jeff kinney');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKNV0001', 1, 'Harry Potter and the Half-Blood Prince', 'Imgs/ProductsImgs/Books/BKNV (Book Novel)/harry-potter-and-the-half-blood-prince.jpg', '4th Edition (2007), Hard Cover', 'Harry Potter and the Half-Blood Prince is a fantasy novel written by British author J. K. Rowling and the sixth and penultimate novel in the Harry Potter series.', 'book', 1645.45, 6, 'book books novel fantasy fiction drama mystery thriller j k rowling');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKNV0002', 10, 'Harry Potter and the Prisoner of Azkaban', 'Imgs/ProductsImgs/Books/BKNV (Book Novel)/harry-potter-and-the-prisoner-of-azkaban.jpg', '7th Edition (2015), Hard Cover', 'Harry Potter and the Prisoner of Azkaban is a fantasy novel written by British author J. K. Rowling and the third in the Harry Potter series.', 'book', 1500, 2, 'book books novel fantasy fiction drama mystery thriller j k rowling');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKNV0003', 4, 'The Da Vinci Code', 'Imgs/ProductsImgs/Books/BKNV (Book Novel)/the-da-vinci-code.jpg', '3rd Edition (2008), Hard Cover', 'The Da Vinci Code is a 2003 mystery thriller novel by Dan Brown. It follows \"symbologist\" Robert Langdon and cryptologist Sophie Neveu after a murder in the Louvre Museum in Paris causes them to become involved in a battle between the Priory of Sion and Opus Dei over the possibility of Jesus Christ having been a companion to Mary Magdalene.', 'book', 1450, 9, 'book books thriller mystery dan brown');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKNV0004', 3, 'A Clash of Kings', 'Imgs/ProductsImgs/Books/BKNV (Book Novel)/A-Clash-Of-Kings.jpg', '5th Edition (2005), Hard Cover', 'A Clash of Kings is the second novel in A Song of Ice and Fire, an epic fantasy series by American author George R. R. Martin expected to consist of seven volumes.', 'book', 1800, 11, 'book books high fantasy novel george r r martin');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKNV0005', 9, 'Harry Potter and the Order of the Phoenix', 'Imgs/ProductsImgs/Books/BKNV (Book Novel)/harry-potter-and-the-order-of-the-phoenix.jpg', '4th Edition (2009), Hard Cover', 'Harry Potter and the Order of the Phoenix is a fantasy novel written by J. K. Rowling and the fifth novel in the Harry Potter series.', 'book', 1400, 5, 'book books novel fantasy fiction drama mystery thriller j k rowling');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKNV0006', 7, 'Harry Potter and the Deathly Hallows', 'Imgs/ProductsImgs/Books/BKNV (Book Novel)/harry-potter-and-the-deathly-hallows.jpg', '4th Edition (2013), Hard Cover', 'Harry Potter and the Deathly Hallows is a fantasy novel written by British author J. K. Rowling and the seventh and final novel of the Harry Potter series.', 'book', 1800, 6, 'book books novel fantasy fiction drama mystery thriller j k rowling');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKNV0007', 6, 'Digital Fortress', 'Imgs/ProductsImgs/Books/BKNV (Book Novel)/Digital-Fortress.jpg', '8th Edition (2014), Soft Cover', 'Digital Fortress is a techno-thriller novel written by American author Dan Brown and published in 1998 by St. Martin\'s Press.', 'book', 1300, 1, 'book books thriller mystery dan brown');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKNV0008', 14, 'A Thousand Splendid Suns', 'Imgs/ProductsImgs/Books/BKNV (Book Novel)/A-Thousand-Splendid-Suns.jpg', '3rd Edition (2013), Soft Cover', 'A Thousand Splendid Suns is a 2007 novel by Afghan-American author Khaled Hosseini. It is his second, following his bestselling 2003 debut, The Kite Runner.', 'book', 1200, 2, 'book books novel fiction khaled hosseini');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKNV0009', 32, 'Sing You Home', 'Imgs\\ProductsImgs\\Books\\BKNV (Book Novel)\\Sing You Home.jpg', '5th Edition', 'Sing You Home is a novel by American novelist Jodi Picoult. It was released on March 1, 2011, and tells the story of a lesbian fighting for the right to use frozen embryos created by her and her ex-husband.', 'book', 1100.23, 5, 'book books novel fiction Lesbian literature  domestic fiction jodi picoult');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKNV0010', 33, 'The Shadow Land', 'Imgs\\ProductsImgs\\Books\\BKNV (Book Novel)\\Shadowland.jpg', '2nd Edition', 'Soon after arriving in Bulgaria a young American helps an elderly couple into a taxi - and realises too late that she has accidentally kept one of their bags.', 'book', 950.65, 8, 'book books novel fiction fantasy novel elizabeth kostova');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKNV0011', 19, 'Change of Heart', 'Imgs\\ProductsImgs\\Books\\BKNV (Book Novel)\\ChangeofHeart-LCYW-EN-ScR-1E.png', '3rd Edition', 'Change of Heart is a novel by Jodi Picoult published in 2008.', 'book', 1095, 7, 'book books novel fiction drama jodi picoult');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKNV0012', 34, 'Underworld', 'Imgs\\ProductsImgs\\Books\\BKNV (Book Novel)\\underworld.jpg', '8th Edition', 'Underworld is a novel published in 1997 by Don DeLillo. It was nominated for the National Book Award, was a best-seller, and is one of DeLillo\'s better-known novels. Underworld continues to receive general acclaim from literary critics.', 'book', 800, 2, 'book books novel fiction postmodern literature don deLillo');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKNV0013', 22, 'Abandon', 'Imgs/ProductsImgs/Books/BKNV (Book Novel)/Abandon.jpg', '3rd edition', 'Last year, 17-year-old Pierce died - just for a moment. And when she was in the space between life and death, she met John: tall dark and terrifying, it\'s his job to usher souls from one realm to the next.', 'book', 1000, 7, 'book books novel fiction drama meg cabot');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKNV0014', 17, 'The Kite Runner', 'Imgs\\ProductsImgs\\Books\\BKNV (Book Novel)\\Kite Runner.jpeg', '6th Edition', 'The Kite Runner is the first novel by Afghan-American author Khaled Hosseini. Published in 2003 by Riverhead Books, it tells the story of Amir, a young boy from the Wazir Akbar Khan district of Kabul, whose closest friend is Hassan.', 'book', 956.56, 6, 'book books novel fiction drama historical khaled hosseini');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKRM0001', 5, 'Message in a Bottle', 'Imgs/ProductsImgs/Books/BKRM (Book Romance)/message-in-a-bottle.jpeg', '2nd Edition (2000), Soft Cover', 'Message in a Bottle is the second romance novel written by American author Nicholas Sparks. The story, which explores the romance theme of love after grief, is set in the mid-late 1990s, then-contemporary Wilmington, North Carolina.', 'book', 1400, 6, 'book books fiction romance novel nicholas sparks');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('BKRM0002', 12, 'Dear John', 'Imgs/ProductsImgs/Books/BKRM (Book Romance)/Dear-John.jpg', '4th Edition (2016), Soft Cover', 'Dear John is a romance novel by American writer Nicholas Sparks released in 2006. Its plot is an adaptation to present day\'s American culture of three plays Marius, Fanny and César, called la Trilogie Marseillaise written by French author Marcel Pagnol c. 1930. It was on the New York Times bestseller list in 2007.', 'book', 1450, 2, 'book books fiction romance novel nicholas sparks');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('FSDN0001', 16, 'LICC Denim, Ladies', 'Imgs/ProductsImgs/Fashion/LICC-Denim-Ladies.jpg', 'Variety of Colours, Different Sizes', 'LICC is a leading denims manufacturer and a distributor. Variety of Colours are available.', 'fashion', 3000, 10, 'fashion denim licc style');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('HFPL0002', 24, 'Ceramic Flower Pots 5 Piece Set', 'Imgs\\ProductsImgs\\HomeGarden\\ceramicpots.jpg', 'Ceramic Pots', 'Ceramic Flower Pot Metal Rack Garden Plant Succulent Display Stand Holder Decor', 'home_garden', 1150, 6, 'homegarden ceramic pots');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('HGPL0001', 23, 'Artificial Bush Plant', 'Imgs/ProductsImgs/HomeGarden/bushPlant.jpg', 'Artificial Fern Foliage Bush Plant ', 'Green Large Plastic Lifelike Artificial Fern Foliage Bush Plants Indoor/Outdoor', 'home_garden', 290, 5, 'homegarden artificial plant');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('HGWH0001', 8, 'Artificial Garden Wall Decoration', 'Imgs/ProductsImgs/HomeGarden/wallhanging.jpg', 'Artificail Wall Decoration', 'Artificial Fake Hanging Vine plant leaves garland Home Garden Wall Decoration', 'home_garden', 300, 2, 'homegarden outside walldecoration');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('HGWH0002', 20, 'Artifical Flower Hanging Party Decoration', 'Imgs/ProductsImgs/HomeGarden/partywallhanging.jpg', 'Artificial Wall Decoration', 'Artificial Wisteria String Vine Ratta Silk Flower Hanging Party Decoration', 'home_garden', 850, 2, 'homegarden party walldecoration');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('MRSP0001', 29, 'Black LCD TFT Monitor Screen', 'Imgs\\ProductsImgs\\Motor\\monitor.JPG', 'Black LCD TEF Monitor Screen', '4.3 Inch Black LCD TFT Monitor Screen for Car SUV Backup Camera Display Fold New', 'motor', 4000, 3, 'motor essentials monitor');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('MRSP0002', 30, 'Motor Car Repair Kit', 'Imgs\\ProductsImgs\\Motor\\toolKIt.jpg', '12pcs Motor Car Repair Kit', '12pcs Motor Car Tubeless Tire Tyre Puncture Plug Quick Repair Kit Tool Essential', 'motor', 390, 5, 'motor essentails repairkit');

INSERT INTO `full_fledged_stuff_application`.`items`
(`itemId`, `priorityLvl`, `itemName`, `itemPicUrl`, `specifics`, `description`, `category`, `unitPrice`, `qtyAvailable`,`associates`)
VALUES ('STCR0001', 2, 'Atlas CR Book', 'Imgs/ProductsImgs/Stationary/Atlas-CR-Exercise-Book.jpg', 'Single Ruled, 160pgs, Premium', 'Atlas, Cr, Single Ruled, Exercise Book of 160 pages. 60gsm (premium).', 'stationary', 210, 4, 'stationary exercise cr atlas');



/*book table*/

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKAD0001', 'Enid Blyton', 'Mystery, Adventure Fiction', 'BOOK ADVENTURE');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKAD0003', 'Daniel Defoe', 'Mystery, Techno Thriller', 'BOOK ADVENTURE');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKCF0001', 'Stephen Hawking', 'Coffee Table Book', 'BOOK COFEE TABLE');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKCM0001', 'Jeff Kinney ', 'Humor Fiction Comedy', 'BOOK COMEDY');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKNV0001', 'J. K. Rowling', 'Fantasy Fiction', 'BOOK NOVEL');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKNV0002', 'J. K. Rowling', 'Fantasy Fiction', 'BOOK NOVEL');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKNV0003', 'Dan Brown', 'Mystery Thriller Novel', 'BOOK NOVEL');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKNV0004', 'George R. R. Martin', 'Political High Fantasy Fiction', 'BOOK NOVEL');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKNV0005', 'J. K. Rowling', 'Fantasy Fiction', 'BOOK NOVEL');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKNV0006', 'J. K. Rowling', 'Fantasy Fiction', 'BOOK NOVEL');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKNV0007', 'Dan Brown', 'Mystery Techno Thriller', 'BOOK NOVEL');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKNV0008', 'Khaled Hosseini', 'Novel Fiction', 'BOOK NOVEL');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKNV0009', 'Jodi Picoult', 'Fiction Lesbian Literature Domestic Fiction', 'BOOK NOVEL');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKNV0010', 'Elizabeth Kostova', 'Fantasy Novel', 'BOOK NOVEL');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKNV0011', 'Jodi Picoult', 'Fiction', 'BOOK NOVEL');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKNV0012', 'Don DeLillo', 'Novel Fiction Postmodern Literature', 'BOOK NOVEL');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKNV0013', 'Meg Cabot', 'Romance Novel', 'BOOK NOVEL');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKNV0014', 'Khaled Hosseini', 'Historical Fiction', 'BOOK NOVEL');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKRM0001', 'Nicholas Sparks', 'Romance Novel', 'BOOK ROMANCE');

INSERT INTO `full_fledged_stuff_application`.`book`
(`bookID`, `author`, `genre`, `type`)
VALUES ('BKRM0002', 'Nicholas Sparks', 'Romance Novel', 'BOOK ROMANCE');



/*art table*/

INSERT INTO `full_fledged_stuff_application`.`art` (`artId`)
VALUES('ARBR0001');

INSERT INTO `full_fledged_stuff_application`.`art` (`artId`)
VALUES('AROP0001');

INSERT INTO `full_fledged_stuff_application`.`art` (`artId`)
VALUES('ARPT0001');

INSERT INTO `full_fledged_stuff_application`.`art` (`artId`)
VALUES('ARPT0002');



/*fashion table*/

INSERT INTO `full_fledged_stuff_application`.`fashion` (`fashionId`, `type`)
VALUES('FSDN0001', 'FASHION DENIM');



/*home_garden table*/

INSERT INTO `full_fledged_stuff_application`.`home_garden` (`home_gardenId`)
VALUES('HFPL0002');

INSERT INTO `full_fledged_stuff_application`.`home_garden` (`home_gardenId`)
VALUES('HGPL0001');

INSERT INTO `full_fledged_stuff_application`.`home_garden` (`home_gardenId`)
VALUES('HGWH0001');

INSERT INTO `full_fledged_stuff_application`.`home_garden` (`home_gardenId`)
VALUES('HGWH0002');



/*motor table*/

INSERT INTO `full_fledged_stuff_application`.`motor` (`motorId`)
VALUES('MRSP0001');

INSERT INTO `full_fledged_stuff_application`.`motor` (`motorId`)
VALUES('MRSP0002');



/*stationary table*/

INSERT INTO `full_fledged_stuff_application`.`stationary` (`stationaryId`, `distributor`, `type`)
VALUES('STCR0001', 'Atlas', 'STATIONARY CR');



/*orders table*/

INSERT INTO `full_fledged_stuff_application`.`orders`
(`userId`, `itemId`, `orderId`, `quantity`, `orderTotal`, `orderDateTime`, `status`, `addLine1`, `addLine2`, `city`, `district`, `state_province`, `zip`, `country`)
VALUES
(1, 'BKCF0001', 'ORAA0002', 2, 4200, '2018-05-18 08:25:36', 'pending', '83/2 Piliyandala Road,', NULL, 'Maharagama', 'Colombo', 'Western Province', '10280', 'Sri Lanka');

INSERT INTO `full_fledged_stuff_application`.`orders`
(`userId`, `itemId`, `orderId`, `quantity`, `orderTotal`, `orderDateTime`, `status`, `addLine1`, `addLine2`, `city`, `district`, `state_province`, `zip`, `country`)
VALUES
(1, 'BKCF0001', 'ORAA0003', 1, 2100, '2018-05-19 00:00:00', 'pending', '83/2 Piliyandala Road,', NULL, 'Maharagama', 'Colombo', 'Western Province', '10280', 'Sri Lanka');

INSERT INTO `full_fledged_stuff_application`.`orders`
(`userId`, `itemId`, `orderId`, `quantity`, `orderTotal`, `orderDateTime`, `status`, `addLine1`, `addLine2`, `city`, `district`, `state_province`, `zip`, `country`)
VALUES
(1, 'BKNV0001', 'ORAA0001', 1, 1645.45, '2018-05-17 09:20:40', 'pending', '83/2 Piliyandala Road,', '', 'Maharagama', 'Colombo', 'Western Province', '10280', 'Sri Lanka');

INSERT INTO `full_fledged_stuff_application`.`orders`
(`userId`, `itemId`, `orderId`, `quantity`, `orderTotal`, `orderDateTime`, `status`, `addLine1`, `addLine2`, `city`, `district`, `state_province`, `zip`, `country`)
VALUES
(1, 'BKNV0001', 'ORAA0004', 1, 1645.45, '2018-05-20 09:03:01', 'pending', '83/2 Piliyandala Road,', '', 'Maharagama', 'Colombo', 'Western Province', '10280', 'Sri Lanka');

INSERT INTO `full_fledged_stuff_application`.`orders`
(`userId`, `itemId`, `orderId`, `quantity`, `orderTotal`, `orderDateTime`, `status`, `addLine1`, `addLine2`, `city`, `district`, `state_province`, `zip`, `country`)
VALUES
(1, 'BKNV0004', 'ORAA0001', 2, 3600, '2018-05-17 09:20:40', 'sent', '83/2 Piliyandala Road,', '', 'Maharagama', 'Colombo', 'Western Province', '10280', 'Sri Lanka');

INSERT INTO `full_fledged_stuff_application`.`orders`
(`userId`, `itemId`, `orderId`, `quantity`, `orderTotal`, `orderDateTime`, `status`, `addLine1`, `addLine2`, `city`, `district`, `state_province`, `zip`, `country`)
VALUES
(1, 'BKNV0004', 'ORAA0004', 2, 3600, '2018-05-20 09:03:01', 'pending', '83/2 Piliyandala Road,', '', 'Maharagama', 'Colombo', 'Western Province', '10280', 'Sri Lanka');
