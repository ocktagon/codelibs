-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'questions'
-- 
-- ---

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `question_name` VARCHAR(500) NULL DEFAULT NULL,
  `answer_id` INTEGER NULL DEFAULT NULL,
  `style` INTEGER(50) NULL DEFAULT NULL,
  `difficulty` INTEGER(50) NULL DEFAULT NULL,
  `challenge_id` INTEGER(50) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'users'
-- 
-- ---

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` INTEGER(50) NULL AUTO_INCREMENT DEFAULT NULL,
  `first_name` MEDIUMTEXT(50) NULL DEFAULT 'NOT NULL',
  `last_name` MEDIUMTEXT(50) NULL DEFAULT NULL,
  `username` VARCHAR(50) NULL DEFAULT NULL,
  `password` VARCHAR(50) NULL DEFAULT NULL,
  `created_at` DATETIME(50) NULL DEFAULT NULL,
  `updated_at` DATETIME(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'scores'
-- 
-- ---

DROP TABLE IF EXISTS `scores`;

CREATE TABLE `scores` (
  `id` INTEGER(50) NULL AUTO_INCREMENT DEFAULT NULL,
  `challenge_id` INTEGER(50) NULL DEFAULT NULL,
  `count_correct` INTEGER(50) NULL DEFAULT NULL,
  `count_questions` INTEGER(50) NULL DEFAULT NULL,
  `challenge_date` DATETIME NULL DEFAULT NULL,
  `user_id` INTEGER(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'challenges'
-- 
-- ---

DROP TABLE IF EXISTS `challenges`;

CREATE TABLE `challenges` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `challenge_name` VARCHAR(250) NULL DEFAULT NULL,
  `user_id` INTEGER(50) NULL DEFAULT NULL,
  `created_at` DATETIME(50) NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'answers'
-- 
-- ---

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `answer` VARCHAR(250) NULL DEFAULT NULL,
  `question_id` INTEGER(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `questions` ADD FOREIGN KEY (challenge_id) REFERENCES `challenges` (`id`);
ALTER TABLE `scores` ADD FOREIGN KEY (challenge_id) REFERENCES `challenges` (`id`);
ALTER TABLE `scores` ADD FOREIGN KEY (user_id) REFERENCES `users` (`id`);
ALTER TABLE `answers` ADD FOREIGN KEY (question_id) REFERENCES `questions` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `questions` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `scores` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `challenges` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `answers` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `questions` (`id`,`question_name`,`answer_id`,`style`,`difficulty`,`challenge_id`,`created_at`,`updated_at`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `users` (`id`,`first_name`,`last_name`,`username`,`password`,`created_at`,`updated_at`) VALUES
-- ('','','','','','','');
-- INSERT INTO `scores` (`id`,`challenge_id`,`count_correct`,`count_questions`,`challenge_date`,`user_id`) VALUES
-- ('','','','','','');
-- INSERT INTO `challenges` (`id`,`challenge_name`,`user_id`,`created_at`,`updated_at`) VALUES
-- ('','','','','');
-- INSERT INTO `answers` (`id`,`answer`,`question_id`) VALUES
-- ('','','');

