-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2017 at 09:33 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `entertainmentnownew`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SubscriptionProcedure` ()  BEGIN

	DECLARE Row_Count INT;
	DECLARE SubscriptionID_1 INT; 
	Declare Customerid_v varchar(20);
	Declare SubscriptionStartDate_v Date;
	DECLARE Total_Used_Days_v varchar(20);
	 Declare SubscriptionType_v varchar(20); 
	 Declare SubscriptionStatus_v varchar(20);
	DECLARE Price_v int;

	DECLARE cur1 Cursor for SELECT 
		Customerid,
		SubscriptionStartDate,
		Total_Used_Days,
		SubscriptionType, 
		SubscriptionStatus,
		Price 
		   
		
		FROM Subscriptiondet;
		
		

		OPEN cur1;
		SET SubscriptionID_1=0;

		SELECT FOUND_ROWS() INTO Row_Count;

		loop1: LOOP
			FETCH cur1 INTO Customerid_v,SubscriptionStartDate_v,Total_Used_Days_v,SubscriptionType_v,SubscriptionStatus_v,Price_v;
			
	
			SET Total_Used_Days_v=0;
			SET SubscriptionType_v=0;
			SET SubscriptionStatus_v=0;

		
			SET Total_Used_Days_v = DATEDIFF(CURDATE(),SubscriptionStartDate_v);
			

			IF Total_Used_Days_v > 14 THEN 
			set SubscriptionType_v = "Deactivate" ;
			ELSE set SubscriptionType_v = "Activate";
			END IF;

			IF SubscriptionType_v  = "Deactivate" THEN 
			set SubscriptionStatus_v = "Payment Reqired"; 
			ELSE set SubscriptionStatus_v = "Free Trail";
			END IF;
			

			SET SubscriptionID_1 = SubscriptionID_1+1;

	INSERT INTO Subscriptiondetails(SubscriptionID, Customerid, SubscriptionStartDate,Total_Used_Days, SubscriptionType, SubscriptionStatus, Price)
	VALUES (SubscriptionID_1,Customerid_v,SubscriptionStartDate_v, Total_Used_Days_v,SubscriptionType_v,SubscriptionStatus_v,Price_v);

			IF Row_Count = SubscriptionID_1 THEN
				LEAVE loop1;
			END IF;

		END LOOP;

		CLOSE cur1 ;

		SELECT * FROM Subscriptiondetails;
	END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `moviesdata`
--

CREATE TABLE `moviesdata` (
  `MovieID` varchar(10) NOT NULL,
  `SubscriptionID` int(11) NOT NULL,
  `MovieName` varchar(50) NOT NULL,
  `ReleaseDate` date NOT NULL,
  `Releaseday` varchar(20) DEFAULT NULL,
  `Genre1` varchar(20) DEFAULT NULL,
  `Genre2` varchar(20) DEFAULT NULL,
  `Productionhouse` varchar(50) DEFAULT NULL,
  `Budget` int(11) DEFAULT NULL,
  `Likes` int(11) DEFAULT NULL,
  `Dislikes` int(11) DEFAULT NULL,
  `IMDBRating` decimal(5,2) DEFAULT NULL,
  `Cat_IMDBRating` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `moviesdata`
--

INSERT INTO `moviesdata` (`MovieID`, `SubscriptionID`, `MovieName`, `ReleaseDate`, `Releaseday`, `Genre1`, `Genre2`, `Productionhouse`, `Budget`, `Likes`, `Dislikes`, `IMDBRating`, `Cat_IMDBRating`) VALUES
('1', 1, 'Batman v Superman: Dawn of Justice ?', '2016-03-25', 'Friday', 'Action ', 'Adventure', 'Warner Bros. Pictures', 250000000, 433738, 17192, '6.90', 'Average'),
('10', 55, 'Ghostbusters ?', '2016-07-15', 'Friday', 'Action ', 'Comedy', 'Sony Pictures Entertainment', 144000000, 297676, 1044125, '5.40', 'Average'),
('11', 4, 'Gods of Egypt ?', '2016-02-26', 'Friday', 'Action ', 'Adventure', 'Movie Clip Trailers', 140000000, 64283, 14916, '5.50', 'Average'),
('12', 4, 'The BFG ?', '2016-07-01', 'Friday', 'Adventure', 'Family', 'Disney Movie Trailers', 140000000, 52147, 52147, '6.40', 'Average'),
('13', 5, 'Jason Bourne ?', '2016-07-29', 'Friday', 'Action ', 'Thriller', 'Universal Pictures', 120000000, 48947, 2183, '6.70', 'Average'),
('14', 6, 'The Huntsman: Winters War ?', '2016-04-22', 'Friday', 'Action ', 'Adventure', 'Universal Pictures', 115000000, 22581, 931, '6.10', 'Average'),
('15', 7, 'Allegiant ?', '2016-03-18', 'Friday', 'Action ', 'Adventure', 'The Divergent Series', 110000000, 32538, 823, '5.70', 'Average'),
('16', 7, 'Ben-Hur ?', '2016-08-19', 'Friday', 'Adventure', 'Drama', 'Paramount Pictures', 100000000, 7766, 8380, '5.70', 'Average'),
('17', 7, 'Now You See Me 2 ?', '2016-06-10', 'Friday', 'Action ', 'Adventure', 'Lionsgate Movie', 90000000, 67608, 1304, '6.50', 'Average'),
('18', 55, 'The Secret Life of Pets ?', '2016-07-08', 'Friday', 'Animation', 'Comedy', 'Illumination', 75000000, 16145, 1174, '6.60', 'Average'),
('19', 8, 'The Angry Birds Movie ?', '2016-05-20', 'Friday', 'Action ', 'Animation', 'Sony Pictures Entertainment', 73000000, 35425, 4856, '6.30', 'Average'),
('2', 1, 'Captain America: Civil War ?', '2016-05-06', 'Friday', 'Action ', 'Adventure', 'Marvel Entertainment', 250000000, 638789, 13945, '7.90', 'Good'),
('20', 8, 'The Finest Hours ?', '2016-01-29', 'Friday', 'Action ', 'Drama', 'Disney Movie Trailers', 80000000, 7976, 529, '6.80', 'Average'),
('21', 55, 'London Has Fallen ?', '2016-03-04', 'Friday', 'Action ', 'Crime', 'Lionsgate Movie', 60000000, 33553, 3014, '5.90', 'Average'),
('22', 9, 'Deadpool ?', '2016-02-12', 'Friday', 'Action ', 'Adventure', '20th Century Fox', 58000000, 102228, 3116, '8.00', 'Good'),
('23', 9, 'Central Intelligence ?', '2016-06-10', 'Friday', 'Action ', 'Comedy', 'Warner Bros. Pictures', 50000000, 38247, 1179, '6.30', 'Average'),
('24', 9, '13 Hours ?', '2016-01-12', 'Friday', 'Action ', 'Drama', 'Paramount Pictures', 50000000, 9549, 1376, '7.30', 'Good'),
('25', 9, 'Free State of Jones ?', '2016-06-24', 'Friday', 'Action ', 'Biography', 'Movie Clip Trailers', 50000000, 11533, 489, '6.90', 'Average'),
('26', 9, 'Zoolander 2 ?', '2016-02-12', 'Friday', 'Comedy', 'NA', 'Paramount Pictures', 50000000, 82580, 5189, '4.80', 'Below Average'),
('27', 55, 'The Infiltrator ?', '2016-07-13', 'Friday', 'Biography ', 'Crime', 'Warner Bros. Pictures', 25000000, 9000, 290, '7.10', 'Good'),
('28', 9, 'The Conjuring 2 ?', '2016-08-30', 'Friday', 'Horror ', 'Mystery', 'Warner Bros. Pictures', 40000000, 78281, 3804, '7.40', 'Good'),
('29', 9, 'Ride Along 2 ?', '2016-01-15', 'Friday', 'Action ', 'Comedy', 'Universal Pictures', 40000000, 45486, 1843, '5.90', 'Average'),
('3', 55, 'The Legend of Tarzan ?', '2016-07-01', 'Friday', 'Action ', 'Adventure', 'Warner Bros. Pictures', 180000000, 122871, 6548, '6.30', 'Average'),
('30', 9, 'The 5th Wave ?', '2016-02-22', 'Friday', 'Action ', 'Adventure', 'Sony Pictures Entertainment', 38000000, 40047, 2397, '5.20', 'Average'),
('31', 9, 'How to Be Single ?', '2016-02-12', 'Friday', 'Comedy', 'Romance', 'Warner Bros. Pictures', 38000000, 18795, 1539, '6.10', 'Average'),
('32', 9, 'Neighbors 2: Sorority Rising ?', '2016-05-20', 'Friday', 'Comedy', 'NA', 'Universal Pictures', 35000000, 103270, 5014, '5.70', 'Average'),
('33', 10, 'Sausage Party ?', '2016-08-12', 'Friday', 'Adventure', 'Animation', 'Sony Pictures Entertainment', 19000000, 159569, 13914, '6.30', 'Average'),
('34', 10, 'The Boss ?', '2016-04-08', 'Friday', 'Comedy', 'NA', 'Universal Pictures', 29000000, 5079, 799, '5.40', 'Average'),
('35', 10, 'Florence Foster Jenkins ?', '2016-08-12', 'Friday', 'Biography ', 'Comedy', 'patheuk', 29000000, 1508, 60, '6.90', 'Average'),
('36', 11, 'Pride and Prejudice and Zombies ?', '2016-01-21', 'Friday', 'Action ', 'Horror', 'Sony Pictures Entertainment', 28000000, 7841, 1506, '5.80', 'Average'),
('37', 11, 'Money Monster ?', '2016-05-13', 'Friday', 'Crime', 'Drama', 'Sony Pictures Entertainment', 27000000, 6978, 711, '6.50', 'Average'),
('38', 11, 'Hail, Caesar! ?', '2016-02-05', 'Friday', 'Comedy', 'Mystery', 'Universal Pictures', 22000000, 21301, 1880, '6.30', 'Average'),
('39', 12, 'Me Before You ?', '2016-06-03', 'Friday', 'Drama', 'Romance', 'Warner Bros. Pictures', 20000000, 35735, 355, '7.40', 'Good'),
('4', 2, 'X-Men: Apocalypse ?', '2016-05-27', 'Friday', 'Action ', 'Adventure', '20th Century Fox', 178000000, 277320, 17835, '7.10', 'Good'),
('40', 12, 'Bad Moms ?', '2016-07-29', 'Friday', 'Comedy', 'NA', 'STX Entertainment', 20000000, 911, 126, '6.20', 'Average'),
('41', 13, 'Risen ?', '2016-02-19', 'Friday', 'Action ', 'Adventure', 'Sony Pictures Entertainment', 20000000, 5650, 694, '6.30', 'Average'),
('42', 13, 'Nerve ?', '2016-07-27', 'Friday', 'Adventure', 'Crime', 'Lionsgate Movie', 20000000, 29102, 1117, '6.60', 'Average'),
('43', 14, 'Triple 9 ?', '2016-02-26', 'Friday', 'Action ', 'Crime', 'Open Road Films', 20000000, 722, 82, '6.30', 'Average'),
('44', 14, 'Hands of Stone ?', '2016-09-15', 'Friday', 'Action ', 'Biography', 'The Weinstien Company', 20000000, 1951, 140, '6.60', 'Average'),
('45', 15, 'Fight Valley ?', '2016-07-22', 'Friday', 'Action ', 'Drama', 'Movie Clip Trailers', 27000000, 175, 158, '3.00', 'Below Average'),
('46', 15, 'Indignation ?', '2016-11-03', 'Friday', 'Drama', 'NA', 'NA', 1000000, 27000, 713, '6.90', 'Average'),
('47', 16, 'My Big Fat Greek Wedding 2 ?', '2016-03-25', 'Friday', 'Comedy', 'Family', 'Universal Pictures', 18000000, 6900, 353, '6.00', 'Average'),
('48', 16, 'Midnight Special ?', '2016-02-16', 'Friday', 'Adventure', 'Drama', 'Warner Bros. Pictures', 18000000, 5343, 394, '6.70', 'Average'),
('49', 17, 'I Am Wrath ?', '2016-04-21', 'Friday', 'Action ', 'Crime', 'Fresh', 18000000, 1643, 278, '5.30', 'Average'),
('5', 2, 'Suicide Squad ?', '2016-08-05', 'Friday', 'Action ', 'Adventure', 'Warner Bros. Pictures', 175000000, 636491, 18622, '6.30', 'Average'),
('50', 17, 'The Young Messiah ?', '2016-03-11', 'Friday', 'Drama', 'NA', 'Universal Pictures', 18500000, 0, 0, '5.50', 'Average'),
('51', 18, 'Keanu ?', '2016-04-29', 'Friday', 'Action ', 'Comedy', 'Warner Bros. Pictures', 15000000, 8106, 350, '6.30', 'Average'),
('52', 18, 'Miracles from Heaven ?', '2016-03-16', 'Friday', 'Drama', 'NA', 'Sony Pictures Entertainment', 13000000, 26883, 1344, '7.00', 'Good'),
('53', 19, 'The Shallows ?', '2016-06-24', 'Friday', 'Drama', 'Horror', 'Sony Pictures Entertainment', 17000000, 58353, 7291, '6.40', 'Average'),
('54', 19, 'Operation Chromite ?', '2016-08-12', 'Friday', 'Action ', 'Drama', 'Movie Clip Trailers', 12620000, 631, 43, '6.20', 'Average'),
('55', 20, 'Dirty Grandpa ?', '2016-01-22', 'Friday', 'Comedy', 'NA', 'Lionsgate Movie', 11500000, 37265, 2217, '6.00', 'Average'),
('56', 20, 'Misconduct ?', '2016-02-05', 'Friday', 'Drama', 'Thriller', 'Lionsgate Movie', 11000000, 575, 30, '5.30', 'Average'),
('57', 22, 'The Purge: Election Year ?', '2016-07-01', 'Friday', 'Action ', 'Horror', 'Universal Pictures', 10000000, 30959, 2029, '6.00', 'Average'),
('58', 22, 'The Boy', '2016-01-22', 'Friday', 'Horror ', 'Mystery', 'Universal Pictures', 10000000, 40675, 2355, '6.00', 'Average'),
('59', 22, 'Petes Dragon ?', '2016-08-12', 'Friday', 'Adventure', 'Family', 'Disney Movie Trailers', 65000000, 24781, 2241, '6.80', 'Average'),
('6', 2, 'The Jungle Book ?', '2016-04-15', 'Friday', 'Adventure', 'Drama', 'Disney Movie Trailers', 175000000, 86281, 4453, '7.50', 'Good'),
('60', 23, 'The Forest', '2016-01-08', 'Friday', 'Horror ', 'Mystery', 'MTV', 10000000, 12529, 2221, '4.80', 'Below Average'),
('61', 23, 'The Wailing ?', '2016-06-03', 'Friday', 'Fantasy ', 'Horror', 'NA', 1000000, 2000, 108, '7.50', 'Good'),
('62', 23, 'Kicks ?', '2016-09-09', 'Friday', 'Adventure', 'NA', 'NA', 1000000, 1000, 37, '6.00', 'Average'),
('63', 24, 'Mr. Church ?', '2016-09-16', 'Friday', 'Drama', 'NA', 'Cinelou Films', 8000000, 620, 29, '7.70', 'Good'),
('64', 25, 'Code of Honor ?', '2016-05-06', 'Friday', 'Action ', 'NA', 'Lionsgate Movie', 8000000, 424, 163, '4.30', 'Below Average'),
('65', 25, 'The Neon Demon ?', '2016-06-24', 'Friday', 'Horror ', 'Thriller', 'Amazon Studios', 7000000, 352, 31, '6.30', 'Average'),
('66', 26, 'Two Lovers and a Bear ?', '2016-12-16', 'Friday', 'Drama', 'Romance', 'Movie Clip Trailers', 8700000, 3257, 231, '6.30', 'Average'),
('67', 27, '10 Cloverfield Lane ?', '2016-03-11', 'Friday', 'Drama', 'Horror', 'Paramount Pictures', 15000000, 24356, 942, '7.20', 'Good'),
('68', 32, 'Lights Out ?', '2016-06-22', 'Friday', 'Horror ', 'NA', 'Warner Bros. Pictures', 4900000, 54664, 2971, '6.40', 'Average'),
('69', 32, 'Race ?', '2016-02-19', 'Friday', 'Biography ', 'Drama', 'Zero Media', 25000000, 1835, 354, '7.10', 'Good'),
('7', 2, 'Independence Day: Resurgence ?', '2016-06-24', 'Friday', 'Action ', 'Adventure', '20th Century Fox', 165000000, 92189, 5827, '5.30', 'Average'),
('70', 32, 'Fifty Shades of Black ?', '2016-01-29', 'Friday', 'Comedy', 'NA', 'Movie Clip Trailers', 5000000, 83670, 5758, '3.50', 'Below Average'),
('71', 28, 'The Perfect Match ?', '2016-03-11', 'Friday', 'Comedy', 'Romance', 'Movie Clip Trailers', 5000000, 14104, 1969, '4.80', 'Below Average'),
('72', 28, 'Yoga Hosers ?', '2016-09-02', 'Friday', 'Comedy', 'Fantasy', 'NA', 5000000, 4000, 2000, '4.30', 'Below Average'),
('73', 41, 'Airlift ?', '2016-01-22', 'Friday', 'Action ', 'Drama', 'T-Series', 4400000, 42692, 1898, '8.20', 'Good'),
('74', 41, 'The Veil ?', '2016-01-19', 'Friday', 'Horror ', 'NA', 'NA', 4000000, 213, 34, '4.70', 'Below Average'),
('75', 41, 'The Masked Saint ?', '2016-01-22', 'Friday', 'Action ', 'Biography', 'The Masked Saint', 3500000, 337, 81, '4.70', 'Below Average'),
('76', 42, 'Compadres ?', '2016-03-31', 'Friday', 'Action ', 'Comedy', 'Fresh', 3000000, 156, 13, '4.70', 'Below Average'),
('77', 42, 'Antibirth ?', '2016-09-02', 'Friday', 'Horror ', 'NA', 'IFC Films', 3500000, 587, 67, '4.80', 'Below Average'),
('78', 43, 'A Beginners Guide to Snuff ?', '2016-03-04', 'Friday', 'Comedy', 'Horror', 'NA', 700000, 5, 0, '8.60', 'Good'),
('79', 43, 'Cabin Fever ?', '2016-05-13', 'Friday', 'Horror ', 'NA', 'Movie Clip Trailers', 1500000, 2444, 925, '3.70', 'Below Average'),
('8', 3, 'Godzilla Resurgence ?', '2016-07-29', 'Friday', 'Action ', 'Adventure', 'Zero Media', 150000000, 13434, 1175, '7.00', 'Good'),
('80', 45, 'Kickboxer: Vengeance ?', '2016-09-02', 'Friday', 'Action ', 'NA', 'NA', 17000000, 10000, 543, '4.90', 'Below Average'),
('81', 45, 'The Dog Lover ?', '2016-07-08', 'Friday', 'Drama', 'NA', 'Fresh', 2000000, 205, 63, '4.80', 'Below Average'),
('82', 45, 'Gods Not Dead 2 ?', '2016-04-01', 'Friday', 'Drama', 'NA', 'Movie Clip Trailers', 5000000, 18323, 16734, '4.20', 'Below Average'),
('83', 46, 'Irreplaceable ?', '2016-03-23', 'Friday', 'Comedy', 'Drama', 'NA', 600000, 7, 0, '6.60', 'Average'),
('84', 46, 'Fight to the Finish ?', '2016-02-02', 'Friday', 'Action ', 'Romance', 'Lionsgate Movie', 150000, 0, 0, '4.00', 'Below Average'),
('85', 67, 'Alleluia! The Devils Carnival ?', '2016-03-29', 'Friday', 'Horror ', 'Musical', 'NA', 1200000, 479, 36, '7.20', 'Good'),
('86', 67, 'Rodeo Girl ?', '2016-01-05', 'Friday', 'Family', 'NA', 'NA', 500000, 0, 0, '5.60', 'Average'),
('87', 67, 'The Little Ponderosa Zoo ?', '2016-05-12', 'Friday', 'Family', 'NA', 'NA', 2500000, 7, 4, '5.50', 'Average'),
('88', 56, 'The Birth of a Nation ?', '2016-10-07', 'Friday', 'Biography ', 'Drama', 'Fox Search Light', 8500000, 7020, 1297, '6.20', 'Average'),
('9', 3, 'Warcraft ?', '2016-06-10', 'Friday', 'Action ', 'Adventure', 'Legendary', 160000000, 127227, 6448, '7.00', 'Good');

-- --------------------------------------------------------

--
-- Table structure for table `playinformation`
--

CREATE TABLE `playinformation` (
  `MovieID` varchar(20) NOT NULL,
  `Customerid` int(11) NOT NULL,
  `PlayedDate` date NOT NULL,
  `PlayedTIme` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playinformation`
--

INSERT INTO `playinformation` (`MovieID`, `Customerid`, `PlayedDate`, `PlayedTIme`) VALUES
('1', 100, '2017-10-06', '44:28:00'),
('10', 154, '2017-10-10', '10:40:00'),
('11', 110, '2017-10-07', '11:18:00'),
('12', 111, '2017-10-04', '46:09:00'),
('13', 112, '2017-10-15', '58:34:00'),
('14', 113, '2017-09-30', '50:53:00'),
('15', 114, '2017-10-04', '58:23:00'),
('16', 115, '2017-09-26', '06:04:00'),
('17', 116, '2017-10-04', '36:40:00'),
('18', 117, '2017-10-02', '07:53:00'),
('19', 154, '2017-10-05', '15:49:00'),
('2', 156, '2017-10-10', '11:19:00'),
('20', 154, '2017-09-29', '03:34:00'),
('21', 154, '2017-09-25', '17:05:00'),
('22', 154, '2017-10-05', '32:33:00'),
('23', 122, '2017-10-03', '29:49:00'),
('24', 123, '2017-09-27', '21:24:00'),
('25', 124, '2017-09-29', '06:07:00'),
('26', 125, '2017-10-13', '05:10:00'),
('27', 126, '2017-09-25', '16:50:00'),
('28', 127, '2017-10-09', '01:31:00'),
('29', 128, '2017-10-13', '41:33:00'),
('3', 156, '2017-10-14', '43:33:00'),
('30', 129, '2017-09-28', '49:15:00'),
('31', 130, '2017-10-06', '56:42:00'),
('32', 131, '2017-09-29', '59:27:00'),
('33', 132, '2017-10-07', '34:43:00'),
('34', 133, '2017-09-25', '50:46:00'),
('35', 156, '2017-10-02', '15:31:00'),
('36', 156, '2017-10-11', '51:09:00'),
('37', 156, '2017-09-29', '40:56:00'),
('38', 156, '2017-10-14', '26:54:00'),
('39', 138, '2017-10-09', '00:44:00'),
('4', 156, '2017-10-08', '56:18:00'),
('40', 139, '2017-10-08', '24:54:00'),
('41', 140, '2017-09-25', '38:52:00'),
('42', 141, '2017-09-26', '40:01:00'),
('43', 142, '2017-10-04', '58:25:00'),
('44', 143, '2017-10-11', '35:36:00'),
('45', 144, '2017-10-07', '06:11:00'),
('46', 145, '2017-10-14', '35:37:00'),
('47', 146, '2017-09-30', '32:18:00'),
('48', 147, '2017-10-12', '06:21:00'),
('49', 148, '2017-09-30', '46:00:00'),
('5', 104, '2017-10-14', '45:07:00'),
('50', 149, '2017-10-13', '24:06:00'),
('51', 150, '2017-10-05', '12:08:00'),
('52', 151, '2017-10-02', '41:28:00'),
('53', 152, '2017-10-09', '43:54:00'),
('54', 153, '2017-09-28', '37:57:00'),
('55', 154, '2017-10-14', '30:17:00'),
('56', 155, '2017-09-29', '24:53:00'),
('57', 156, '2017-10-06', '20:51:00'),
('58', 157, '2017-10-09', '55:55:00'),
('59', 158, '2017-09-26', '22:05:00'),
('6', 105, '2017-10-13', '03:19:00'),
('60', 159, '2017-10-02', '19:02:00'),
('61', 160, '2017-10-09', '33:07:00'),
('62', 161, '2017-10-04', '45:20:00'),
('63', 162, '2017-10-04', '51:01:00'),
('64', 163, '2017-09-28', '39:56:00'),
('65', 164, '2017-10-12', '54:03:00'),
('66', 165, '2017-10-02', '28:01:00'),
('67', 166, '2017-09-29', '06:15:00'),
('68', 167, '2017-09-25', '29:53:00'),
('69', 168, '2017-10-08', '38:38:00'),
('7', 106, '2017-10-11', '57:00:00'),
('70', 169, '2017-09-27', '07:43:00'),
('71', 170, '2017-10-11', '31:11:00'),
('72', 171, '2017-10-06', '02:44:00'),
('73', 172, '2017-09-27', '59:09:00'),
('74', 173, '2017-10-06', '18:59:00'),
('75', 174, '2017-09-25', '27:10:00'),
('76', 175, '2017-10-03', '53:01:00'),
('77', 176, '2017-10-11', '47:44:00'),
('78', 177, '2017-10-13', '18:45:00'),
('79', 178, '2017-10-08', '33:17:00'),
('8', 154, '2017-09-30', '49:17:00'),
('80', 179, '2017-09-30', '33:54:00'),
('81', 180, '2017-10-05', '55:53:00'),
('82', 181, '2017-10-13', '51:15:00'),
('83', 182, '2017-10-05', '16:28:00'),
('84', 182, '2017-10-14', '57:57:00'),
('85', 182, '2017-09-30', '02:38:00'),
('86', 182, '2017-09-26', '30:11:00'),
('87', 186, '2017-09-26', '58:33:00'),
('88', 187, '2017-10-08', '31:00:00'),
('9', 154, '2017-10-07', '55:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptiondet`
--

CREATE TABLE `subscriptiondet` (
  `CustomerID` varchar(20) NOT NULL,
  `SubscriptionStartDate` date NOT NULL,
  `Total_Used_Days` varchar(20) DEFAULT NULL,
  `SubscriptionType` varchar(20) DEFAULT NULL,
  `SubscriptionStatus` varchar(20) DEFAULT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscriptiondet`
--

INSERT INTO `subscriptiondet` (`CustomerID`, `SubscriptionStartDate`, `Total_Used_Days`, `SubscriptionType`, `SubscriptionStatus`, `Price`) VALUES
('100', '2017-10-06', '', '', '', 87),
('101', '2017-10-10', '', '', '', 15),
('102', '2017-10-14', '', '', '', 70),
('103', '2017-10-08', '', '', '', 2),
('104', '2017-10-14', '', '', '', 6),
('105', '2017-10-13', '', '', '', 95),
('106', '2017-10-11', '', '', '', 93),
('107', '2017-09-30', '', '', '', 9),
('108', '2017-10-07', '', '', '', 54),
('109', '2017-10-10', '', '', '', 72),
('110', '2017-10-07', '', '', '', 77),
('111', '2017-10-04', '', '', '', 62),
('112', '2017-10-15', '', '', '', 49),
('113', '2017-09-30', '', '', '', 15),
('114', '2017-10-04', '', '', '', 35),
('115', '2017-09-26', '', '', '', 22),
('116', '2017-10-04', '', '', '', 16),
('117', '2017-10-02', '', '', '', 37),
('118', '2017-10-05', '', '', '', 14),
('119', '2017-09-29', '', '', '', 29),
('120', '2017-09-25', '', '', '', 0),
('121', '2017-10-05', '', '', '', 53),
('122', '2017-10-03', '', '', '', 21),
('123', '2017-09-27', '', '', '', 78),
('124', '2017-09-29', '', '', '', 1),
('125', '2017-10-13', '', '', '', 78),
('126', '2017-09-25', '', '', '', 61),
('127', '2017-10-09', '', '', '', 31),
('128', '2017-10-13', '', '', '', 78),
('129', '2017-09-28', '', '', '', 31),
('130', '2017-10-06', '', '', '', 95),
('131', '2017-09-29', '', '', '', 96),
('132', '2017-10-07', '', '', '', 31),
('133', '2017-09-25', '', '', '', 35),
('134', '2017-10-02', '', '', '', 18),
('135', '2017-10-11', '', '', '', 90),
('136', '2017-09-29', '', '', '', 68),
('137', '2017-10-14', '', '', '', 17),
('138', '2017-10-09', '', '', '', 96),
('139', '2017-10-08', '', '', '', 22),
('140', '2017-09-25', '', '', '', 75),
('141', '2017-09-26', '', '', '', 11),
('142', '2017-10-04', '', '', '', 73),
('143', '2017-10-11', '', '', '', 30),
('144', '2017-10-07', '', '', '', 70),
('145', '2017-10-14', '', '', '', 30),
('146', '2017-09-30', '', '', '', 91),
('147', '2017-10-12', '', '', '', 8),
('148', '2017-09-30', '', '', '', 3),
('149', '2017-10-13', '', '', '', 10),
('150', '2017-10-05', '', '', '', 24),
('151', '2017-10-02', '', '', '', 27),
('152', '2017-10-09', '', '', '', 40),
('153', '2017-09-28', '', '', '', 7),
('154', '2017-10-14', '', '', '', 10),
('155', '2017-09-29', '', '', '', 88),
('156', '2017-10-06', '', '', '', 65),
('157', '2017-10-09', '', '', '', 53),
('158', '2017-09-26', '', '', '', 44),
('159', '2017-10-02', '', '', '', 16),
('160', '2017-10-09', '', '', '', 27),
('161', '2017-10-04', '', '', '', 65),
('162', '2017-10-04', '', '', '', 53),
('163', '2017-09-28', '', '', '', 98),
('164', '2017-10-12', '', '', '', 70),
('165', '2017-10-02', '', '', '', 54),
('166', '2017-09-29', '', '', '', 38),
('167', '2017-09-25', '', '', '', 67),
('168', '2017-10-08', '', '', '', 67),
('169', '2017-09-27', '', '', '', 27),
('170', '2017-10-11', '', '', '', 72),
('171', '2017-10-06', '', '', '', 77),
('172', '2017-09-27', '', '', '', 59),
('173', '2017-10-06', '', '', '', 36),
('174', '2017-09-25', '', '', '', 72),
('175', '2017-10-03', '', '', '', 8),
('176', '2017-10-11', '', '', '', 34),
('177', '2017-10-13', '', '', '', 80),
('178', '2017-10-08', '', '', '', 48),
('179', '2017-09-30', '', '', '', 77),
('180', '2017-10-05', '', '', '', 46),
('181', '2017-10-13', '', '', '', 97),
('182', '2017-10-05', '', '', '', 71),
('183', '2017-10-14', '', '', '', 61),
('184', '2017-09-30', '', '', '', 6),
('185', '2017-09-26', '', '', '', 62),
('186', '2017-09-26', '', '', '', 12),
('187', '2017-10-08', '', '', '', 30),
('188', '2017-10-04', '', '', '', 63),
('189', '2017-10-08', '', '', '', 42),
('190', '2017-10-07', '', '', '', 56),
('191', '2017-10-13', '', '', '', 37),
('192', '2017-10-07', '', '', '', 27),
('193', '2017-10-06', '', '', '', 48),
('194', '2017-09-29', '', '', '', 27),
('195', '2017-10-13', '', '', '', 55),
('196', '2017-10-14', '', '', '', 86),
('197', '2017-10-06', '', '', '', 46),
('198', '2017-10-12', '', '', '', 11),
('199', '2017-10-01', '', '', '', 21);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptiondetails`
--

CREATE TABLE `subscriptiondetails` (
  `SubscriptionID` int(11) NOT NULL,
  `Customerid` int(11) NOT NULL,
  `SubscriptionStartDate` date NOT NULL,
  `Total_Used_Days` varchar(20) DEFAULT NULL,
  `SubscriptionType` varchar(20) DEFAULT NULL,
  `SubscriptionStatus` varchar(20) DEFAULT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscriptiondetails`
--

INSERT INTO `subscriptiondetails` (`SubscriptionID`, `Customerid`, `SubscriptionStartDate`, `Total_Used_Days`, `SubscriptionType`, `SubscriptionStatus`, `Price`) VALUES
(1, 100, '2017-10-06', '7', 'Activate', 'Free Trail', 87),
(2, 101, '2017-10-10', '3', 'Activate', 'Free Trail', 15),
(3, 102, '2017-10-14', '-1', 'Activate', 'Free Trail', 70),
(4, 103, '2017-10-08', '5', 'Activate', 'Free Trail', 2),
(5, 104, '2017-10-14', '-1', 'Activate', 'Free Trail', 6),
(6, 105, '2017-10-13', '0', 'Activate', 'Free Trail', 95),
(7, 106, '2017-10-11', '2', 'Activate', 'Free Trail', 93),
(8, 107, '2017-09-30', '13', 'Activate', 'Free Trail', 9),
(9, 108, '2017-10-07', '6', 'Activate', 'Free Trail', 54),
(10, 109, '2017-10-10', '3', 'Activate', 'Free Trail', 72),
(11, 110, '2017-10-07', '6', 'Activate', 'Free Trail', 77),
(12, 111, '2017-10-04', '9', 'Activate', 'Free Trail', 62),
(13, 112, '2017-10-15', '-2', 'Activate', 'Free Trail', 49),
(14, 113, '2017-09-30', '13', 'Activate', 'Free Trail', 15),
(15, 114, '2017-10-04', '9', 'Activate', 'Free Trail', 35),
(16, 115, '2017-09-26', '17', 'Deactivate', 'Payment Reqired', 22),
(17, 116, '2017-10-04', '9', 'Activate', 'Free Trail', 16),
(18, 117, '2017-10-02', '11', 'Activate', 'Free Trail', 37),
(19, 118, '2017-10-05', '8', 'Activate', 'Free Trail', 14),
(20, 119, '2017-09-29', '14', 'Activate', 'Free Trail', 29),
(21, 120, '2017-09-25', '18', 'Deactivate', 'Payment Reqired', 0),
(22, 121, '2017-10-05', '8', 'Activate', 'Free Trail', 53),
(23, 122, '2017-10-03', '10', 'Activate', 'Free Trail', 21),
(24, 123, '2017-09-27', '16', 'Deactivate', 'Payment Reqired', 78),
(25, 124, '2017-09-29', '14', 'Activate', 'Free Trail', 1),
(26, 125, '2017-10-13', '0', 'Activate', 'Free Trail', 78),
(27, 126, '2017-09-25', '18', 'Deactivate', 'Payment Reqired', 61),
(28, 127, '2017-10-09', '4', 'Activate', 'Free Trail', 31),
(29, 128, '2017-10-13', '0', 'Activate', 'Free Trail', 78),
(30, 129, '2017-09-28', '15', 'Deactivate', 'Payment Reqired', 31),
(31, 130, '2017-10-06', '7', 'Activate', 'Free Trail', 95),
(32, 131, '2017-09-29', '14', 'Activate', 'Free Trail', 96),
(33, 132, '2017-10-07', '6', 'Activate', 'Free Trail', 31),
(34, 133, '2017-09-25', '18', 'Deactivate', 'Payment Reqired', 35),
(35, 134, '2017-10-02', '11', 'Activate', 'Free Trail', 18),
(36, 135, '2017-10-11', '2', 'Activate', 'Free Trail', 90),
(37, 136, '2017-09-29', '14', 'Activate', 'Free Trail', 68),
(38, 137, '2017-10-14', '-1', 'Activate', 'Free Trail', 17),
(39, 138, '2017-10-09', '4', 'Activate', 'Free Trail', 96),
(40, 139, '2017-10-08', '5', 'Activate', 'Free Trail', 22),
(41, 140, '2017-09-25', '18', 'Deactivate', 'Payment Reqired', 75),
(42, 141, '2017-09-26', '17', 'Deactivate', 'Payment Reqired', 11),
(43, 142, '2017-10-04', '9', 'Activate', 'Free Trail', 73),
(44, 143, '2017-10-11', '2', 'Activate', 'Free Trail', 30),
(45, 144, '2017-10-07', '6', 'Activate', 'Free Trail', 70),
(46, 145, '2017-10-14', '-1', 'Activate', 'Free Trail', 30),
(47, 146, '2017-09-30', '13', 'Activate', 'Free Trail', 91),
(48, 147, '2017-10-12', '1', 'Activate', 'Free Trail', 8),
(49, 148, '2017-09-30', '13', 'Activate', 'Free Trail', 3),
(50, 149, '2017-10-13', '0', 'Activate', 'Free Trail', 10),
(51, 150, '2017-10-05', '8', 'Activate', 'Free Trail', 24),
(52, 151, '2017-10-02', '11', 'Activate', 'Free Trail', 27),
(53, 152, '2017-10-09', '4', 'Activate', 'Free Trail', 40),
(54, 153, '2017-09-28', '15', 'Deactivate', 'Payment Reqired', 7),
(55, 154, '2017-10-14', '-1', 'Activate', 'Free Trail', 10),
(56, 155, '2017-09-29', '14', 'Activate', 'Free Trail', 88),
(57, 156, '2017-10-06', '7', 'Activate', 'Free Trail', 65),
(58, 157, '2017-10-09', '4', 'Activate', 'Free Trail', 53),
(59, 158, '2017-09-26', '17', 'Deactivate', 'Payment Reqired', 44),
(60, 159, '2017-10-02', '11', 'Activate', 'Free Trail', 16),
(61, 160, '2017-10-09', '4', 'Activate', 'Free Trail', 27),
(62, 161, '2017-10-04', '9', 'Activate', 'Free Trail', 65),
(63, 162, '2017-10-04', '9', 'Activate', 'Free Trail', 53),
(64, 163, '2017-09-28', '15', 'Deactivate', 'Payment Reqired', 98),
(65, 164, '2017-10-12', '1', 'Activate', 'Free Trail', 70),
(66, 165, '2017-10-02', '11', 'Activate', 'Free Trail', 54),
(67, 166, '2017-09-29', '14', 'Activate', 'Free Trail', 38),
(68, 167, '2017-09-25', '18', 'Deactivate', 'Payment Reqired', 67),
(69, 168, '2017-10-08', '5', 'Activate', 'Free Trail', 67),
(70, 169, '2017-09-27', '16', 'Deactivate', 'Payment Reqired', 27),
(71, 170, '2017-10-11', '2', 'Activate', 'Free Trail', 72),
(72, 171, '2017-10-06', '7', 'Activate', 'Free Trail', 77),
(73, 172, '2017-09-27', '16', 'Deactivate', 'Payment Reqired', 59),
(74, 173, '2017-10-06', '7', 'Activate', 'Free Trail', 36),
(75, 174, '2017-09-25', '18', 'Deactivate', 'Payment Reqired', 72),
(76, 175, '2017-10-03', '10', 'Activate', 'Free Trail', 8),
(77, 176, '2017-10-11', '2', 'Activate', 'Free Trail', 34),
(78, 177, '2017-10-13', '0', 'Activate', 'Free Trail', 80),
(79, 178, '2017-10-08', '5', 'Activate', 'Free Trail', 48),
(80, 179, '2017-09-30', '13', 'Activate', 'Free Trail', 77),
(81, 180, '2017-10-05', '8', 'Activate', 'Free Trail', 46),
(82, 181, '2017-10-13', '0', 'Activate', 'Free Trail', 97),
(83, 182, '2017-10-05', '8', 'Activate', 'Free Trail', 71),
(84, 183, '2017-10-14', '-1', 'Activate', 'Free Trail', 61),
(85, 184, '2017-09-30', '13', 'Activate', 'Free Trail', 6),
(86, 185, '2017-09-26', '17', 'Deactivate', 'Payment Reqired', 62),
(87, 186, '2017-09-26', '17', 'Deactivate', 'Payment Reqired', 12),
(88, 187, '2017-10-08', '5', 'Activate', 'Free Trail', 30),
(89, 188, '2017-10-04', '9', 'Activate', 'Free Trail', 63),
(90, 189, '2017-10-08', '5', 'Activate', 'Free Trail', 42),
(91, 190, '2017-10-07', '6', 'Activate', 'Free Trail', 56),
(92, 191, '2017-10-13', '0', 'Activate', 'Free Trail', 37),
(93, 192, '2017-10-07', '6', 'Activate', 'Free Trail', 27),
(94, 193, '2017-10-06', '7', 'Activate', 'Free Trail', 48),
(95, 194, '2017-09-29', '14', 'Activate', 'Free Trail', 27),
(96, 195, '2017-10-13', '0', 'Activate', 'Free Trail', 55),
(97, 196, '2017-10-14', '-1', 'Activate', 'Free Trail', 86),
(98, 197, '2017-10-06', '7', 'Activate', 'Free Trail', 46),
(99, 198, '2017-10-12', '1', 'Activate', 'Free Trail', 11),
(100, 199, '2017-10-01', '12', 'Activate', 'Free Trail', 21);

-- --------------------------------------------------------

--
-- Table structure for table `userinformation`
--

CREATE TABLE `userinformation` (
  `Customerid` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `UserPhoneNumber` varchar(100) DEFAULT NULL,
  `UserAddress` varchar(255) DEFAULT NULL,
  `UserEmail` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userinformation`
--

INSERT INTO `userinformation` (`Customerid`, `Name`, `UserPhoneNumber`, `UserAddress`, `UserEmail`, `City`) VALUES
(100, 'Audra', '1-355-161-4787', 'Ap #161-3730 In Av.', 'risus@mollisDuis.org', 'Castello dell\'Acqua'),
(101, 'Xerxes', '1-530-163-5683', 'Ap #726-8822 Malesuada. Ave', 'iaculis.nec.eleifend@litoratorquent.edu', 'Redlands'),
(102, 'Zorita', '1-159-601-3710', '3724 Cum St.', 'tincidunt.adipiscing.Mauris@Quisqueornare.co.uk', 'Ichalkaranji'),
(103, 'Thor', '1-556-682-6523', 'Ap #723-1154 Vulputate Av.', 'ipsum@duiCum.net', 'Mores'),
(104, 'Aretha', '1-517-255-2357', 'P.O. Box 441, 8874 Mi St.', 'mollis.Integer@turpisegestas.edu', 'Lavoir'),
(105, 'Candace', '1-222-988-1002', '541-9763 Ut St.', 'aliquet.diam@feugiatplacerat.ca', 'Ottawa-Carleton'),
(106, 'Hedwig', '1-906-236-2968', '1776 Natoque Rd.', 'pede.Nunc@Integer.net', 'Galvarino'),
(107, 'Basia', '1-320-217-1639', '2529 Congue, Avenue', 'aliquam.enim@enimnislelementum.net', 'Laja'),
(108, 'Maxwell', '1-800-863-6519', 'Ap #566-4647 Leo. Ave', 'id.libero.Donec@tinciduntadipiscing.edu', 'Shipshaw'),
(109, 'Melvin', '1-225-990-4246', '183-4649 Sit Av.', 'tristique.senectus@malesuada.ca', 'Borgomasino'),
(110, 'Brynne', '1-448-974-8694', 'P.O. Box 784, 5901 Nonummy Ave', 'libero@ornareplaceratorci.com', 'Newyork city'),
(111, 'Irene', '1-412-352-2923', 'P.O. Box 356, 5323 Egestas. St.', 'pede.et.risus@nec.co.uk', 'Newyork city'),
(112, 'Drew', '1-391-312-1407', 'P.O. Box 481, 5435 Lacinia. Av.', 'facilisis.facilisis@consectetuer.edu', 'Newyork city'),
(113, 'Fay', '1-491-472-7885', 'Ap #116-7738 Risus. Road', 'euismod@metuseuerat.ca', 'Newyork city'),
(114, 'Judah', '1-100-310-2316', 'Ap #695-1813 Ornare, Rd.', 'sapien.Cras@nunc.ca', 'Newyork city'),
(115, 'Kamal', '1-413-857-1582', '567-9947 Et Rd.', 'pharetra.sed.hendrerit@orci.com', 'Newyork city'),
(116, 'Miranda', '1-789-116-7552', 'Ap #683-8750 Vestibulum. Road', 'eu.enim.Etiam@Loremipsum.com', 'Newyork city'),
(117, 'Cheryl', '1-562-162-1263', '772-9685 Ac Rd.', 'vel.convallis.in@sagittisplacerat.co.uk', 'Newyork city'),
(118, 'Solomon', '1-306-182-1927', 'Ap #463-6489 Adipiscing, St.', 'sit.amet.risus@urnaUt.co.uk', 'Newyork city'),
(119, 'Declan', '1-853-290-2950', 'P.O. Box 146, 3321 Sed Rd.', 'non.luctus.sit@luctuslobortis.com', 'Newyork city'),
(120, 'Mikayla', '1-225-135-6949', '5169 Vitae, Road', 'Ut.sagittis.lobortis@Sednecmetus.co.uk', 'Newyork city'),
(121, 'Camden', '1-550-275-3233', 'Ap #917-7870 Donec Rd.', 'nulla@luctussit.net', 'Newyork city'),
(122, 'Sasha', '1-254-256-5265', 'Ap #939-9070 Neque Rd.', 'magna.Praesent.interdum@eu.ca', 'Newyork city'),
(123, 'Malachi', '1-350-113-6417', 'P.O. Box 512, 6857 Nonummy Av.', 'a.sollicitudin.orci@Pellentesqueut.co.uk', 'Newyork city'),
(124, 'Kevyn', '1-211-931-7164', 'P.O. Box 603, 8099 Dui, Av.', 'varius.Nam.porttitor@et.org', 'Newyork city'),
(125, 'Erin', '1-926-579-4629', 'P.O. Box 330, 7467 Malesuada Rd.', 'fringilla.purus@sem.ca', 'Newyork city'),
(126, 'Kieran', '1-636-660-8221', '435-203 Consequat Road', 'vel.venenatis.vel@odio.org', 'Newyork city'),
(127, 'Leila', '1-820-238-3748', '5996 Curabitur Rd.', 'ornare.In@lectusNullamsuscipit.edu', 'Newyork city'),
(128, 'Ginger', '1-577-761-8672', '256-6541 Curae; Rd.', 'turpis.egestas@ultricesposuerecubilia.org', 'Newyork city'),
(129, 'Duncan', '1-912-222-2957', 'Ap #743-564 Mauris Av.', 'lobortis.quis.pede@adipiscinglacus.org', 'Newyork city'),
(130, 'Tiger', '1-637-647-9450', 'P.O. Box 617, 9017 Nulla Street', 'velit.eget@sociis.com', 'Newyork city'),
(131, 'Damon', '1-579-317-1496', 'P.O. Box 993, 1541 Morbi St.', 'sagittis.felis.Donec@auctorvitae.com', 'Newyork city'),
(132, 'Oren', '1-519-521-5893', '7630 Felis Avenue', 'luctus@perinceptos.org', 'Newyork city'),
(133, 'Deacon', '1-534-265-6489', 'P.O. Box 270, 6031 Imperdiet St.', 'vitae.risus@utmiDuis.org', 'Newyork city'),
(134, 'Camden', '1-417-247-5400', '768-6037 Luctus St.', 'Aenean.sed.pede@tellus.com', 'Newyork city'),
(135, 'Garth', '1-944-509-7775', 'P.O. Box 697, 7152 Cursus Road', 'Suspendisse@eleifend.co.uk', 'Newyork city'),
(136, 'Fiona', '1-677-922-5606', '2864 Auctor Ave', 'luctus.et@dictumsapien.org', 'Florida'),
(137, 'Ginger', '1-573-115-9547', '428 Rhoncus Rd.', 'eget.odio.Aliquam@CuraeDonectincidunt.edu', 'Florida'),
(138, 'Erasmus', '1-808-537-6700', '4155 Nulla. Ave', 'nibh.sit.amet@rutrummagnaCras.co.uk', 'Florida'),
(139, 'Audrey', '1-778-520-0631', '677 Nulla Avenue', 'gravida@adipiscingelit.com', 'Florida'),
(140, 'Uta', '1-704-158-5116', 'Ap #131-2016 Nulla. Road', 'tempus.lorem@metus.ca', 'Florida'),
(141, 'Baxter', '1-562-504-2090', 'Ap #264-3604 Diam Rd.', 'tortor.at.risus@anteblanditviverra.org', 'Florida'),
(142, 'Rashad', '1-564-573-9626', 'P.O. Box 861, 1506 Mattis. Street', 'amet.nulla@facilisiSedneque.com', 'Florida'),
(143, 'Emery', '1-227-858-8161', 'Ap #663-9683 Mi Av.', 'id.enim.Curabitur@NuncmaurisMorbi.ca', 'Florida'),
(144, 'Xanthus', '1-974-893-4152', '716-2806 Non Road', 'lorem.tristique.aliquet@quis.edu', 'Florida'),
(145, 'Ori', '1-301-639-0870', 'Ap #586-3926 Aliquet Av.', 'placerat.orci.lacus@etmagnis.org', 'Florida'),
(146, 'Richard', '1-772-846-8276', 'P.O. Box 271, 1636 Aliquam, Road', 'dapibus.rutrum@lacusCras.co.uk', 'Florida'),
(147, 'Sophia', '1-297-829-3552', 'Ap #112-6073 Orci Rd.', 'Cras@aliquetliberoInteger.edu', 'Florida'),
(148, 'Lee', '1-741-291-3060', 'P.O. Box 896, 9125 Purus Ave', 'ante@Donecegestas.co.uk', 'Florida'),
(149, 'Sacha', '1-411-772-6178', 'Ap #901-587 Ridiculus Street', 'Aliquam.ornare.libero@nequeNullamnisl.edu', 'Florida'),
(150, 'Richard', '1-746-362-3024', 'Ap #347-2322 Vitae Ave', 'Quisque@mauris.net', 'Florida'),
(151, 'Mariam', '1-257-640-1122', 'P.O. Box 947, 6651 Molestie Ave', 'risus.Donec@magnaLoremipsum.org', 'Florida'),
(152, 'Lael', '1-366-963-8469', '583-9359 Elit. St.', 'massa.rutrum@imperdiet.com', 'Florida'),
(153, 'Cyrus', '1-172-230-8063', 'Ap #430-1229 Cum Rd.', 'cursus.et.eros@Utsemperpretium.ca', 'Florida'),
(154, 'Scotty', '1-524-581-6646', '700-4904 Elementum, Avenue', 'molestie.arcu@velitPellentesqueultricies.com', 'Florida'),
(155, 'Mira', '1-948-978-6570', '812-7316 Lorem Avenue', 'diam.dictum.sapien@luctusCurabitur.ca', 'Florida'),
(156, 'Aline', '1-998-948-3525', 'Ap #548-3543 Sodales Av.', 'Curae.Donec.tincidunt@metus.com', 'Florida'),
(157, 'Hanae', '1-115-439-7053', '831-8502 Ullamcorper, Road', 'est.tempor.bibendum@tacitisociosqu.edu', 'Florida'),
(158, 'Kelly', '1-338-356-0849', 'P.O. Box 172, 1286 Senectus Road', 'dictum@fringillamilacinia.com', 'Florida'),
(159, 'Wynter', '1-660-726-2218', 'P.O. Box 387, 6962 Augue Street', 'dui@dictumPhasellusin.co.uk', 'Florida'),
(160, 'Lana', '1-451-348-5268', 'Ap #493-2009 Arcu. Av.', 'velit.Cras@sodales.com', 'Florida'),
(161, 'Burke', '1-947-553-3615', '9468 Mollis Avenue', 'purus.ac.tellus@Quisquetinciduntpede.org', 'Florida'),
(162, 'Quinn', '1-704-216-7649', '2785 Odio Rd.', 'tellus.imperdiet.non@purusinmolestie.edu', 'Florida'),
(163, 'Xanthus', '1-414-368-4876', '3191 Luctus Road', 'Donec.dignissim@nequeseddictum.org', 'Florida'),
(164, 'Florence', '1-667-612-8860', 'Ap #607-1178 Eu Road', 'sem.magna.nec@Mauris.ca', 'Florida'),
(165, 'Octavia', '1-420-903-1985', 'Ap #261-2555 Mi Ave', 'lectus@Maecenas.co.uk', 'Florida'),
(166, 'Shana', '1-948-501-1222', 'P.O. Box 515, 6714 Egestas Rd.', 'egestas.Aliquam.nec@magnaaneque.net', 'Florida'),
(167, 'Danielle', '1-558-630-7798', 'Ap #974-316 Sed Road', 'lorem@odioAliquamvulputate.net', 'Florida'),
(168, 'Claire', '1-967-674-8747', 'Ap #394-1844 Et, St.', 'felis.ullamcorper@risus.net', 'Florida'),
(169, 'Victoria', '1-834-132-8519', 'P.O. Box 543, 9424 Faucibus St.', 'eget@faucibus.co.uk', 'Florida'),
(170, 'Gavin', '1-801-559-5717', 'Ap #688-7291 Felis. St.', 'erat.Etiam.vestibulum@hendreritnequeIn.net', 'Florida'),
(171, 'Tana', '1-371-249-6073', '164-1382 Nunc Rd.', 'nisi.Aenean@scelerisquenequesed.org', 'Florida'),
(172, 'Lynn', '1-930-675-7703', 'Ap #422-8093 Nullam Rd.', 'et.euismod.et@scelerisqueduiSuspendisse.co.uk', 'Florida'),
(173, 'Trevor', '1-437-798-5702', 'Ap #146-7111 Ac St.', 'sed.consequat.auctor@sagittis.edu', 'Florida'),
(174, 'Mira', '1-411-390-4915', '146-5670 Gravida. St.', 'magnis.dis.parturient@Nuncmauris.co.uk', 'Florida'),
(175, 'Tarik', '1-624-888-2416', '7850 Ante. Road', 'sed@rutrumloremac.edu', 'Florida'),
(176, 'Xanthus', '1-808-103-2530', 'Ap #996-8987 Diam Street', 'mauris@Maurisnon.org', 'Florida'),
(177, 'Rashad', '1-179-133-6232', '1429 Dolor. Av.', 'laoreet.libero.et@ipsumnonarcu.ca', 'Florida'),
(178, 'Bryar', '1-188-758-9149', '996 Tincidunt Avenue', 'convallis@quis.co.uk', 'Florida'),
(179, 'Drew', '1-866-524-2478', '4254 Quis, Street', 'nec@tristiqueneque.org', 'Florida'),
(180, 'Judah', '1-131-923-9051', 'P.O. Box 867, 9032 Tellus. Rd.', 'a.mi.fringilla@Phasellusataugue.edu', 'Florida'),
(181, 'Yoshio', '1-233-602-9702', '628-496 Posuere St.', 'Nullam.suscipit.est@cursuseteros.net', 'Florida'),
(182, 'Odysseus', '1-729-107-8130', '999-1188 Quam. Rd.', 'ante.Maecenas@nulla.edu', 'Florida'),
(183, 'Adrian', '1-937-261-9859', '7306 Faucibus St.', 'id.ante.Nunc@Maecenas.edu', 'Florida'),
(184, 'Rebekah', '1-695-905-0665', 'Ap #423-1400 Odio Rd.', 'Duis.dignissim@imperdietnecleo.com', 'Florida'),
(185, 'Lester', '1-208-628-6449', 'P.O. Box 846, 9010 Enim. Rd.', 'Donec.fringilla.Donec@duinec.co.uk', 'Florida'),
(186, 'Patience', '1-705-615-9434', '980 Non, St.', 'montes.nascetur.ridiculus@dolor.org', 'Florida'),
(187, 'Imani', '1-311-234-7417', 'P.O. Box 728, 1472 Eros St.', 'a.odio@mauris.org', 'Florida'),
(188, 'Thor', '1-559-244-1371', 'Ap #623-7354 Risus. Av.', 'a@enimconsequat.ca', 'Florida'),
(189, 'Cameron', '1-308-132-6025', 'Ap #794-1441 Et Road', 'sem@massalobortis.ca', 'Okpoko'),
(190, 'Keegan', '1-613-413-8348', '4807 Nec, Avenue', 'Etiam.gravida@mollisnon.ca', 'Allahabad'),
(191, 'Beck', '1-795-279-5685', '9106 Sem. Rd.', 'luctus.vulputate@neque.ca', 'Solre-sur-Sambre'),
(192, 'Sylvester', '1-233-656-7588', '922-4634 Pellentesque Rd.', 'vitae.aliquam@faucibuslectusa.net', 'Rionero in Vulture'),
(193, 'Noble', '1-890-176-5415', 'P.O. Box 568, 1451 Mauris Av.', 'non@ipsumdolor.org', 'Oostkerke'),
(194, 'Dawn', '1-415-816-4057', '335-7430 Sociis Ave', 'mauris.Suspendisse.aliquet@non.com', 'Puqueldón'),
(195, 'Quinn', '1-532-875-8753', '297-5867 Penatibus Street', 'sagittis.felis.Donec@fermentum.net', 'Salihli'),
(196, 'Bevis', '1-267-514-1058', 'Ap #825-314 Leo. Rd.', 'amet@auctor.ca', 'Bünyan'),
(197, 'Thor', '1-137-126-4239', 'P.O. Box 721, 4787 Viverra. Av.', 'ligula.eu@pedeultrices.ca', 'Pietrasanta'),
(198, 'Clementine', '1-507-163-8249', '5839 Aenean Ave', 'Morbi.quis.urna@pretiumetrutrum.net', 'Ortonovo'),
(199, 'Winter', '1-747-461-8295', 'P.O. Box 133, 2035 Nullam Rd.', 'ante.lectus.convallis@porttitortellus.net', 'Quemchi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moviesdata`
--
ALTER TABLE `moviesdata`
  ADD PRIMARY KEY (`MovieID`),
  ADD KEY `fk_Subscriptiondetails1` (`SubscriptionID`);

--
-- Indexes for table `playinformation`
--
ALTER TABLE `playinformation`
  ADD PRIMARY KEY (`MovieID`),
  ADD KEY `fk_userinformation1` (`Customerid`);

--
-- Indexes for table `subscriptiondet`
--
ALTER TABLE `subscriptiondet`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `subscriptiondetails`
--
ALTER TABLE `subscriptiondetails`
  ADD PRIMARY KEY (`SubscriptionID`),
  ADD KEY `fk_userinformation` (`Customerid`);

--
-- Indexes for table `userinformation`
--
ALTER TABLE `userinformation`
  ADD PRIMARY KEY (`Customerid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `moviesdata`
--
ALTER TABLE `moviesdata`
  ADD CONSTRAINT `fk_Subscriptiondetails1` FOREIGN KEY (`SubscriptionID`) REFERENCES `subscriptiondetails` (`SubscriptionID`);

--
-- Constraints for table `playinformation`
--
ALTER TABLE `playinformation`
  ADD CONSTRAINT `fk_userinformation1` FOREIGN KEY (`Customerid`) REFERENCES `userinformation` (`Customerid`);

--
-- Constraints for table `subscriptiondetails`
--
ALTER TABLE `subscriptiondetails`
  ADD CONSTRAINT `fk_userinformation` FOREIGN KEY (`Customerid`) REFERENCES `userinformation` (`Customerid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
