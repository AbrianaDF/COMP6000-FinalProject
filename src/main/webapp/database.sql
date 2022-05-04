
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `BusinessDirectory`
--
CREATE DATABASE `businessdirectory` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `businessdirectory`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
                                       `user_id` int(10) NOT NULL AUTO_INCREMENT,
                                       `fname` varchar(50) NOT NULL,
                                       `lname` varchar(50) NOT NULL,
                                       `username` varchar(50) NOT NULL,
                                       `password` varchar(50) NOT NULL,
                                       `is_admin` tinyint(1) NOT NULL,
                                       PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

--
-- Table structure for table `businesses`
--

CREATE TABLE IF NOT EXISTS `businesses` (
                                            `business_id` int(10) NOT NULL AUTO_INCREMENT,
                                            `name` varchar(100) NOT NULL,
                                            `user_id` int(10) NOT NULL,
                                            `description` varchar(200) NOT NULL,
                                            `phone` varchar(20) NOT NULL,
                                            `website` varchar(100) NOT NULL,
                                            `is_pending` tinyint(1) NOT NULL,
                                            PRIMARY KEY (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

--
-- Adding sample data into `users`
--

INSERT INTO `users` (fname, lname, username, password, is_admin) VALUES (
                                                                         'Bree',
                                                                         'F',
                                                                         'test',
                                                                         'admin',
                                                                         1
                                                                        );

INSERT INTO `users` (fname, lname, username, password, is_admin) VALUES (
                                                                            'John',
                                                                            'Patterson',
                                                                            'john',
                                                                            'test',
                                                                            0
                                                                        );

INSERT INTO `users` (fname, lname, username, password, is_admin) VALUES (
                                                                            'Whitney',
                                                                            'Brown',
                                                                            'whit',
                                                                            'test',
                                                                            0
                                                                        );

INSERT INTO `users` (fname, lname, username, password, is_admin) VALUES (
                                                                            'Shea',
                                                                            'Jones',
                                                                            'shea',
                                                                            'test',
                                                                            0
                                                                        );

--
-- Adding sample data into `businesses`
--

INSERT INTO `businesses` (name, user_id, description, phone, website, is_pending) VALUES (
                                                                                               'Big John\'s Shoe Paradise',
                                                                                               2,
                                                                                               'Stay up to date with the latest shoes',
                                                                                               '(227)346-3657',
                                                                                               'www.shoeparadise.com',
                                                                                               0
                                                                                              );

INSERT INTO `businesses` (name, user_id, description, phone, website, is_pending) VALUES (
                                                                                                  'Get Fit with Whit',
                                                                                                  3,
                                                                                                  'Whether it''s getting in shape for a big event or shedding a few pandemic pounds, I''m the girl for the job!',
                                                                                                  '(224)123-4657',
                                                                                                  'www.fitnesswithwhit.com',
                                                                                                  0
                                                                                              );

INSERT INTO `businesses` (name, user_id, description, phone, website, is_pending) VALUES (
                                                                                                  'Shea''s Kitchen',
                                                                                                  4,
                                                                                                  'Food to feed the soul and the belly! Southern soul food cooking is our specialty',
                                                                                                  '(263)123-4567',
                                                                                                  'www.sheaskitchen.com',
                                                                                                  0
                                                                                              );