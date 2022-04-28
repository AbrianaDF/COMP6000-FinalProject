
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `BusinessDirectory`
--
CREATE DATABASE `businessDirectory` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `businessDirectory`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
                                       `email` varchar(100) NOT NULL,
                                       `password` varchar(100) NOT NULL,
                                       PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `businesses`
--

CREATE TABLE IF NOT EXISTS `businesses` (
                                            `name` varchar(100) NOT NULL,
                                            `owner` varchar(100) NOT NULL,
                                            `description` varchar(200) NOT NULL,
                                            `phone` varchar(20) NOT NULL,
                                            `website` varchar(100) NOT NULL,
                                            `email` varchar(100) NOT NULL,
                                            PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `businesses`
--

CREATE TABLE IF NOT EXISTS `admins` (
                                        `email` varchar(100) NOT NULL,
                                        `password` varchar(100) NOT NULL,
                                        PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;