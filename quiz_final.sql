/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : quiz_final

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-04-15 00:05:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2018_04_13_193236_create_questions_table', '2');
INSERT INTO `migrations` VALUES ('4', '2018_04_13_201148_create_quizzes_table', '3');
INSERT INTO `migrations` VALUES ('5', '2018_04_14_040629_create_options_table', '3');
INSERT INTO `migrations` VALUES ('6', '2018_04_14_053554_create_quize_questions_table', '4');
INSERT INTO `migrations` VALUES ('7', '2018_04_14_064000_create_quiz_results_table', '5');
INSERT INTO `migrations` VALUES ('8', '2018_04_14_064154_create_quiz_result_answers_table', '5');

-- ----------------------------
-- Table structure for `options`
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL DEFAULT '0',
  `option` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_order` int(11) NOT NULL DEFAULT '0',
  `trash` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES ('1', '1', 'Tubby', '1', '0', null, null);
INSERT INTO `options` VALUES ('2', '1', 'Stodge', '2', '0', null, null);
INSERT INTO `options` VALUES ('3', '1', 'Helium Bat', '3', '0', null, null);
INSERT INTO `options` VALUES ('4', '1', 'Stumpy', '4', '0', null, null);
INSERT INTO `options` VALUES ('5', '2', 'Canada', '1', '0', null, null);
INSERT INTO `options` VALUES ('6', '2', 'Sri Lanka', '2', '0', null, null);
INSERT INTO `options` VALUES ('7', '2', 'Zimbabwe', '3', '0', null, null);
INSERT INTO `options` VALUES ('8', '2', 'East Africa', '4', '0', null, null);
INSERT INTO `options` VALUES ('9', '3', 'Two', '1', '0', null, null);
INSERT INTO `options` VALUES ('10', '3', 'Three', '2', '0', null, null);
INSERT INTO `options` VALUES ('11', '3', 'Four', '3', '0', null, null);
INSERT INTO `options` VALUES ('12', '3', 'Eight', '4', '0', null, null);
INSERT INTO `options` VALUES ('13', '4', 'Glamorgan', '1', '0', null, null);
INSERT INTO `options` VALUES ('14', '4', 'Leicestershire', '2', '0', null, null);
INSERT INTO `options` VALUES ('15', '4', 'Gloucestershire', '3', '0', null, null);
INSERT INTO `options` VALUES ('16', '4', 'Lancashire', '4', '0', null, null);
INSERT INTO `options` VALUES ('17', '5', 'Geet Sethi', '1', '0', null, null);
INSERT INTO `options` VALUES ('18', '5', 'Wilson Jones', '2', '0', null, null);
INSERT INTO `options` VALUES ('19', '5', 'Michael Ferreira', '3', '0', null, null);
INSERT INTO `options` VALUES ('20', '5', 'Manoj Kothari', '4', '0', null, null);
INSERT INTO `options` VALUES ('21', '6', 'M.L.Valsamma', '1', '0', null, null);
INSERT INTO `options` VALUES ('22', '6', 'P.T.Usha', '2', '0', null, null);
INSERT INTO `options` VALUES ('23', '6', 'Kamaljit Sandhu', '3', '0', null, null);
INSERT INTO `options` VALUES ('24', '6', 'K.Malleshwari', '4', '0', null, null);
INSERT INTO `options` VALUES ('25', '7', 'Oxygen', '1', '0', null, null);
INSERT INTO `options` VALUES ('26', '7', 'Hydrogen sulphide', '2', '0', null, null);
INSERT INTO `options` VALUES ('27', '7', 'Carbon dioxide', '3', '0', null, null);
INSERT INTO `options` VALUES ('28', '7', 'Nitrogen', '4', '0', null, null);
INSERT INTO `options` VALUES ('29', '8', 'Phosphorous', '1', '0', null, null);
INSERT INTO `options` VALUES ('30', '8', 'Bromine', '2', '0', null, null);
INSERT INTO `options` VALUES ('31', '8', 'Chlorine', '3', '0', null, null);
INSERT INTO `options` VALUES ('32', '8', 'Helium', '4', '0', null, null);
INSERT INTO `options` VALUES ('33', '9', 'copper', '1', '0', null, null);
INSERT INTO `options` VALUES ('34', '9', 'magnesium', '2', '0', null, null);
INSERT INTO `options` VALUES ('35', '9', 'iron', '3', '0', null, null);
INSERT INTO `options` VALUES ('36', '9', 'calcium', '4', '0', null, null);
INSERT INTO `options` VALUES ('37', '10', 'copper', '1', '0', null, null);
INSERT INTO `options` VALUES ('38', '10', 'magnesium', '2', '0', null, null);
INSERT INTO `options` VALUES ('39', '10', 'iron', '3', '0', null, null);
INSERT INTO `options` VALUES ('40', '10', 'calcium', '4', '0', null, null);
INSERT INTO `options` VALUES ('41', '11', 'copper', '1', '0', null, null);
INSERT INTO `options` VALUES ('42', '11', 'calcium', '2', '0', null, null);
INSERT INTO `options` VALUES ('43', '11', 'iron', '3', '0', null, null);
INSERT INTO `options` VALUES ('44', '11', 'magnesium', '4', '0', null, null);
INSERT INTO `options` VALUES ('45', '12', 'Ganga', '1', '0', null, null);
INSERT INTO `options` VALUES ('46', '12', 'Cauvery', '2', '0', null, null);
INSERT INTO `options` VALUES ('47', '12', 'Narmada', '3', '0', null, null);
INSERT INTO `options` VALUES ('48', '12', 'Godavari', '4', '0', null, null);
INSERT INTO `options` VALUES ('49', '13', '45', '1', '0', null, null);
INSERT INTO `options` VALUES ('50', '13', '65', '2', '0', null, null);
INSERT INTO `options` VALUES ('51', '13', '35', '3', '0', null, null);
INSERT INTO `options` VALUES ('52', '13', '25', '4', '0', null, null);
INSERT INTO `options` VALUES ('53', '14', 'north of Tropic of Cancer', '1', '0', null, null);
INSERT INTO `options` VALUES ('54', '14', 'south of the Equator', '2', '0', null, null);
INSERT INTO `options` VALUES ('55', '14', 'south of the Capricorn', '3', '0', null, null);
INSERT INTO `options` VALUES ('56', '14', 'north of the Equator', '4', '0', null, null);
INSERT INTO `options` VALUES ('57', '15', 'the Palghat gap', '1', '0', null, null);
INSERT INTO `options` VALUES ('58', '15', 'the Bhorghat pass', '2', '0', null, null);
INSERT INTO `options` VALUES ('59', '15', 'the Thalgat pass', '3', '0', null, null);
INSERT INTO `options` VALUES ('60', '15', 'the Bolan pass', '4', '0', null, null);
INSERT INTO `options` VALUES ('61', '16', 'Hazaribag and Singbhum of Bihar', '1', '0', null, null);
INSERT INTO `options` VALUES ('62', '16', 'Khetri and Daribo areas of Rajasthan', '2', '0', null, null);
INSERT INTO `options` VALUES ('63', '16', 'Anantapur in Andhra Pradesh', '3', '0', null, null);
INSERT INTO `options` VALUES ('64', '16', 'Siwaliks in Uttar Pradesh and in Karnataka', '4', '0', null, null);
INSERT INTO `options` VALUES ('65', '17', '1757', '1', '0', null, null);
INSERT INTO `options` VALUES ('66', '17', '1782', '2', '0', null, null);
INSERT INTO `options` VALUES ('67', '17', '1748', '3', '0', null, null);
INSERT INTO `options` VALUES ('68', '17', '1764', '4', '0', null, null);
INSERT INTO `options` VALUES ('69', '18', 'Sutlej and Beas', '1', '0', null, null);
INSERT INTO `options` VALUES ('70', '18', 'Jhelum and Chenab', '2', '0', null, null);
INSERT INTO `options` VALUES ('71', '18', 'Ravi and Chenab', '3', '0', null, null);
INSERT INTO `options` VALUES ('72', '18', 'Ganga and Yamuna', '4', '0', null, null);
INSERT INTO `options` VALUES ('73', '19', 'military affairs', '1', '0', null, null);
INSERT INTO `options` VALUES ('74', '19', 'the state treasury', '2', '0', null, null);
INSERT INTO `options` VALUES ('75', '19', 'the royal household', '3', '0', null, null);
INSERT INTO `options` VALUES ('76', '19', 'the land revenue system', '4', '0', null, null);
INSERT INTO `options` VALUES ('77', '20', 'Buddhists', '1', '0', null, null);
INSERT INTO `options` VALUES ('78', '20', 'Hindus', '2', '0', null, null);
INSERT INTO `options` VALUES ('79', '20', 'Jains', '3', '0', null, null);
INSERT INTO `options` VALUES ('80', '20', 'None of the above', '4', '0', null, null);
INSERT INTO `options` VALUES ('81', '21', 'Nirvana', '1', '0', null, null);
INSERT INTO `options` VALUES ('82', '21', 'Sangha', '2', '0', null, null);
INSERT INTO `options` VALUES ('83', '21', 'Buddha', '3', '0', null, null);
INSERT INTO `options` VALUES ('84', '21', 'Dhamma', '4', '0', null, null);

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `questions`
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trash` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('1', 'Former Australian captain Mark Taylor has had several nicknames over his playing career. Which of the following was NOT one of them?', '4', '0', '2018-04-14 17:59:06', '2018-04-14 17:59:06');
INSERT INTO `questions` VALUES ('2', 'Which was the 1st non Test playing country to beat India in an international match?', '2', '0', '2018-04-14 17:59:33', '2018-04-14 17:59:33');
INSERT INTO `questions` VALUES ('3', 'Track and field star Carl Lewis won how many gold medals at the 1984 Olympic games?', '3', '0', '2018-04-14 17:59:54', '2018-04-14 17:59:54');
INSERT INTO `questions` VALUES ('4', 'Which county did Ravi Shastri play for?', '1', '0', '2018-04-14 18:00:21', '2018-04-14 18:00:21');
INSERT INTO `questions` VALUES ('5', 'Who was the first Indian to win the World Amateur Billiards title?', '2', '0', '2018-04-14 18:00:42', '2018-04-14 18:00:42');
INSERT INTO `questions` VALUES ('6', 'Who is the first Indian woman to win an Asian Games gold in 400m run?', '3', '0', '2018-04-14 18:01:04', '2018-04-14 18:01:04');
INSERT INTO `questions` VALUES ('7', 'Brass gets discoloured in air because of the presence of which of the following gases in air?', '2', '0', '2018-04-14 18:01:31', '2018-04-14 18:01:31');
INSERT INTO `questions` VALUES ('8', 'Which of the following is a non metal that remains liquid at room temperature?', '2', '0', '2018-04-14 18:01:49', '2018-04-14 18:01:49');
INSERT INTO `questions` VALUES ('9', 'Chlorophyll is a naturally occurring chelate compound in which central metal is', '2', '0', '2018-04-14 18:02:09', '2018-04-14 18:02:09');
INSERT INTO `questions` VALUES ('10', 'Chlorophyll is a naturally occurring chelate compound in which central metal is', '2', '0', '2018-04-14 18:02:27', '2018-04-14 18:02:27');
INSERT INTO `questions` VALUES ('11', 'Chlorophyll is a naturally occurring chelate compound in which central metal is', '4', '0', '2018-04-14 18:03:06', '2018-04-14 18:03:06');
INSERT INTO `questions` VALUES ('12', 'The Paithan (Jayakwadi) Hydro-electric project, completed with the help of Japan, is on the river', '4', '0', '2018-04-14 18:03:26', '2018-04-14 18:03:26');
INSERT INTO `questions` VALUES ('13', 'The percentage of irrigated land in India is about', '3', '0', '2018-04-14 18:03:46', '2018-04-14 18:03:46');
INSERT INTO `questions` VALUES ('14', 'The southernmost point of peninsular India, that is, Kanyakumari, is', '4', '0', '2018-04-14 18:04:07', '2018-04-14 18:04:07');
INSERT INTO `questions` VALUES ('15', 'The pass located at the southern end of the Nilgiri Hills in south India is called', '1', '0', '2018-04-14 18:04:25', '2018-04-14 18:04:25');
INSERT INTO `questions` VALUES ('16', 'The principal copper deposits of India lie in which of the following places?', '1', '0', '2018-04-14 18:04:47', '2018-04-14 18:04:47');
INSERT INTO `questions` VALUES ('17', 'The Battle of Plassey was fought in', '1', '0', '2018-04-14 18:05:10', '2018-04-14 18:05:10');
INSERT INTO `questions` VALUES ('18', 'The territory of Porus who offered strong resistance to Alexander was situated between the rivers of', '2', '0', '2018-04-14 18:05:30', '2018-04-14 18:05:30');
INSERT INTO `questions` VALUES ('19', 'Under Akbar, the Mir Bakshi was required to look after', '1', '0', '2018-04-14 18:05:53', '2018-04-14 18:05:53');
INSERT INTO `questions` VALUES ('20', 'Tripitakas are sacred books of', '1', '0', '2018-04-14 18:06:13', '2018-04-14 18:06:13');
INSERT INTO `questions` VALUES ('21', 'The trident-shaped symbol of Buddhism does not represent', '1', '0', '2018-04-14 18:06:31', '2018-04-14 18:06:31');

-- ----------------------------
-- Table structure for `quize_questions`
-- ----------------------------
DROP TABLE IF EXISTS `quize_questions`;
CREATE TABLE `quize_questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) NOT NULL DEFAULT '0',
  `question_id` int(11) NOT NULL DEFAULT '0',
  `trash` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of quize_questions
-- ----------------------------
INSERT INTO `quize_questions` VALUES ('1', '1', '1', '0', null, null);
INSERT INTO `quize_questions` VALUES ('2', '1', '2', '0', null, null);
INSERT INTO `quize_questions` VALUES ('3', '1', '3', '0', null, null);
INSERT INTO `quize_questions` VALUES ('4', '1', '4', '0', null, null);
INSERT INTO `quize_questions` VALUES ('5', '1', '5', '0', null, null);
INSERT INTO `quize_questions` VALUES ('6', '1', '6', '0', null, null);
INSERT INTO `quize_questions` VALUES ('7', '2', '7', '0', null, null);
INSERT INTO `quize_questions` VALUES ('8', '2', '8', '0', null, null);
INSERT INTO `quize_questions` VALUES ('9', '2', '9', '0', null, null);
INSERT INTO `quize_questions` VALUES ('10', '2', '10', '0', null, null);
INSERT INTO `quize_questions` VALUES ('11', '2', '11', '0', null, null);
INSERT INTO `quize_questions` VALUES ('12', '3', '12', '0', null, null);
INSERT INTO `quize_questions` VALUES ('13', '3', '13', '0', null, null);
INSERT INTO `quize_questions` VALUES ('14', '3', '14', '0', null, null);
INSERT INTO `quize_questions` VALUES ('15', '3', '15', '0', null, null);
INSERT INTO `quize_questions` VALUES ('16', '3', '16', '0', null, null);
INSERT INTO `quize_questions` VALUES ('17', '4', '17', '0', null, null);
INSERT INTO `quize_questions` VALUES ('18', '4', '18', '0', null, null);
INSERT INTO `quize_questions` VALUES ('19', '4', '19', '0', null, null);
INSERT INTO `quize_questions` VALUES ('20', '4', '20', '0', null, null);
INSERT INTO `quize_questions` VALUES ('21', '4', '21', '0', null, null);

-- ----------------------------
-- Table structure for `quizzes`
-- ----------------------------
DROP TABLE IF EXISTS `quizzes`;
CREATE TABLE `quizzes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_questions` int(11) DEFAULT NULL,
  `time_limit` int(11) DEFAULT NULL,
  `trash` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of quizzes
-- ----------------------------
INSERT INTO `quizzes` VALUES ('1', 'Sports Quiz', '6', '10', '0', '2018-04-14 18:27:32', '2018-04-14 18:27:32');
INSERT INTO `quizzes` VALUES ('2', 'Science Quiz', '5', '20', '0', '2018-04-14 18:28:59', '2018-04-14 18:28:59');
INSERT INTO `quizzes` VALUES ('3', 'Geography Quiz', '5', '5', '0', '2018-04-14 18:30:11', '2018-04-14 18:30:11');
INSERT INTO `quizzes` VALUES ('4', 'History Quiz', '5', '30', '0', '2018-04-14 18:31:01', '2018-04-14 18:31:01');

-- ----------------------------
-- Table structure for `quiz_results`
-- ----------------------------
DROP TABLE IF EXISTS `quiz_results`;
CREATE TABLE `quiz_results` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trash` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of quiz_results
-- ----------------------------

-- ----------------------------
-- Table structure for `quiz_result_answers`
-- ----------------------------
DROP TABLE IF EXISTS `quiz_result_answers`;
CREATE TABLE `quiz_result_answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT '0',
  `quiz_id` int(11) NOT NULL DEFAULT '0',
  `question_id` int(11) DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `option_answer` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of quiz_result_answers
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Admin', 'admin@gmail.com', '$2y$10$OzxVjKB3aohx.2zUWpxb2.LVb/atdMybUcNgHnqKAL6rvEjBg7VC2', 'WOJgguFGkGA1B0v5pIp0wO9a2Lc1nZ50bcOuCOVChbvp8071WIy46IaHr3x3', '2018-04-13 19:31:37', '2018-04-13 19:31:37');
