-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_14
-- ------------------------------------------------------
-- Server version   10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'aut',1),(2,'dignissimos',2),(3,'velit',3),(4,'et',4),(5,'ea',5);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_members`
--

DROP TABLE IF EXISTS `community_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) unsigned NOT NULL,
  `name_community` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `member_id` (`member_id`),
  KEY `name_community` (`name_community`),
  CONSTRAINT `community_members_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `users` (`id`),
  CONSTRAINT `community_members_ibfk_2` FOREIGN KEY (`name_community`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_members`
--

LOCK TABLES `community_members` WRITE;
/*!40000 ALTER TABLE `community_members` DISABLE KEYS */;
INSERT INTO `community_members` VALUES (12,3,4),(15,9,5),(16,9,3),(17,7,1),(18,8,1),(19,1,4),(20,3,3);
/*!40000 ALTER TABLE `community_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_post`
--

DROP TABLE IF EXISTS `community_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_name_community` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_name_community` (`to_name_community`),
  CONSTRAINT `community_post_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `community_post_ibfk_2` FOREIGN KEY (`to_name_community`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_post`
--

LOCK TABLES `community_post` WRITE;
/*!40000 ALTER TABLE `community_post` DISABLE KEYS */;
INSERT INTO `community_post` VALUES (23,6,1,'Alice soon began talking again. \'Dinah\'ll miss me very much of a tree a few minutes to see you again, you dear old thing!\' said the Caterpillar. \'Well, perhaps your feelings may be different,\' said.','1992-11-28 21:27:19'),(25,8,1,'Mock Turtle persisted. \'How COULD he turn them out with his nose, and broke to pieces against one of the window, and on both sides at once. \'Give your evidence,\' said the Mock Turtle went on.','2005-12-24 07:43:32'),(28,8,5,'Then again--\"BEFORE SHE HAD THIS FIT--\" you never even introduced to a shriek, \'and just as well say,\' added the Dormouse. \'Don\'t talk nonsense,\' said Alice hastily; \'but I\'m not the smallest idea.','1989-10-09 09:54:54'),(30,8,3,'Duchess sneezed occasionally; and as the whole party look so grave and anxious.) Alice could hear the name of the hall; but, alas! the little door into that lovely garden. First, however, she waited.','1983-10-14 21:38:49'),(31,7,4,'Caterpillar. \'Is that all?\' said the Hatter, and he wasn\'t going to begin with,\' the Mock Turtle, and to stand on their slates, when the White Rabbit read out, at the great wonder is, that I\'m.','2005-05-23 16:27:22'),(32,4,2,'Duck and a crash of broken glass. \'What a funny watch!\' she remarked. \'There isn\'t any,\' said the Duchess, \'and that\'s the jury, and the moon, and memory, and muchness--you know you say pig, or.','1982-07-12 19:32:37'),(38,2,2,'Mock Turtle with a little startled by seeing the Cheshire Cat, she was now, and she went on to the Queen, who was passing at the Cat\'s head with great emphasis, looking hard at Alice as she spoke,.','1991-01-14 21:28:39'),(39,3,2,'Mock Turtle said: \'I\'m too stiff. And the Eaglet bent down its head to feel a little hot tea upon its nose. The Dormouse shook its head impatiently, and said, very gravely, \'I think, you ought to be.','2005-11-06 11:22:17'),(40,5,1,'Duchess; \'and most of \'em do.\' \'I don\'t think they play at all fairly,\' Alice began, in a natural way again. \'I wonder how many hours a day is very confusing.\' \'It isn\'t,\' said the Mouse, in a.','1979-11-26 00:27:49');
/*!40000 ALTER TABLE `community_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `friend_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `friend_id` (`friend_id`),
  CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `connections_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
INSERT INTO `connections` VALUES (1,1,8),(2,2,4),(3,3,5),(4,4,6),(5,5,3),(6,6,9),(7,7,8),(8,8,5),(9,9,4),(10,10,1),(11,11,4),(12,12,3),(13,13,4),(14,14,8),(15,15,8);
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,4,'declined','2016-04-13 23:46:15','2020-09-18 14:57:34'),(1,8,'unfriended','1975-03-12 07:49:39','2008-02-29 23:26:37'),(1,9,'approved','2014-03-27 12:36:05','1983-01-02 08:09:02'),(4,2,'unfriended','1998-03-19 22:29:24','1996-07-05 12:34:06'),(4,3,'requested','1989-10-15 10:54:40','1987-06-03 17:24:52'),(6,5,'approved','2007-06-18 06:22:49','1970-11-16 00:33:17'),(6,10,'requested','1992-12-09 07:52:51','2001-10-27 14:11:53'),(7,1,'approved','2016-01-06 03:15:51','1983-08-10 00:15:00'),(9,6,'requested','1974-08-12 13:39:55','1993-11-14 21:13:28'),(9,7,'approved','1979-10-08 21:57:24','1976-07-13 04:44:14');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `likes_fk` (`media_id`),
  KEY `likes_fk_1` (`user_id`),
  CONSTRAINT `likes_fk` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `likes_fk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (21,4,7,'1982-12-21 18:48:35'),(22,8,3,'2004-11-23 13:42:44'),(23,3,6,'2008-02-15 00:50:13'),(27,1,1,'2007-03-14 01:48:09'),(28,9,9,'2002-06-19 13:52:09'),(29,4,2,'1982-07-06 10:27:07'),(30,9,2,'2013-12-18 22:53:28'),(32,7,2,'2003-07-16 03:16:46'),(33,7,3,'1995-10-01 05:14:35'),(34,1,2,'1985-01-31 12:56:14'),(36,9,5,'2017-05-06 19:35:58'),(38,6,3,'1976-04-25 04:11:26'),(39,3,2,'1997-11-03 11:06:52'),(40,9,3,'2004-07-07 04:13:43');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Voluptatem repellat pariatur voluptatem hic. Repellat voluptatem neque et soluta saepe asperiores. Dicta quod dolorem molestiae aut corrupti numquam. Eligendi doloremque dicta possimus in esse et. Cumque rerum vero eos qui eos commodi tempore.','laudantium',684868495,NULL,'2007-11-05 17:58:27','2007-01-14 06:17:46'),(2,2,2,'Cum perspiciatis iusto nihil neque. Maxime aut cupiditate incidunt. Rerum ut et ipsum deleniti. Ipsam vel quibusdam accusantium aperiam exercitationem illum est nobis.','numquam',8902576,NULL,'2009-11-27 17:36:41','1987-11-04 07:42:52'),(3,3,3,'Aut qui quasi eum at. Ab reiciendis ullam omnis quia animi. Dolores soluta dolorum ab dicta optio laborum illo assumenda.','officiis',9347041,NULL,'2008-02-08 07:50:50','2002-07-02 14:23:20'),(4,4,4,'Ex illo ipsum omnis occaecati odio et. Praesentium veniam nostrum fugit sit. Cum alias ut assumenda officia nostrum hic non quia. Perspiciatis in rerum enim.','temporibus',2568559,NULL,'2010-11-05 06:33:27','2012-08-17 13:39:30'),(5,5,5,'Velit ut nihil sit consectetur rerum deserunt. Eum voluptas illum quos rerum quas aut. Porro hic sequi pariatur est sapiente. Debitis aut debitis laudantium non qui totam nam. Enim harum facere ut.','hic',8048144,NULL,'1979-10-24 10:24:52','2005-05-19 11:42:53'),(6,1,6,'Natus ea id est quae blanditiis amet. Voluptatem et earum vero totam et. Debitis quae eveniet aut minima qui non doloremque. Expedita corporis architecto eligendi ab vel.','nesciunt',130,NULL,'1988-04-25 20:20:10','2016-01-09 09:11:22'),(7,2,7,'Molestiae atque labore mollitia error maiores quo illum nihil. Ut hic et illo exercitationem. Recusandae debitis corporis consequuntur nesciunt totam et.','dolorem',0,NULL,'1974-01-13 13:30:49','2000-02-15 05:58:09'),(8,3,8,'Veritatis nobis sint voluptatem enim et neque corrupti voluptatem. Sunt officiis doloremque sit sit fuga. Qui repellendus iure in necessitatibus rem quae. Quidem inventore quis quia odio est esse.','est',7231245,NULL,'1992-02-29 15:51:27','2001-03-28 01:25:28'),(9,4,9,'Omnis iste voluptas voluptas voluptas veniam minima quidem. Voluptate molestiae temporibus nostrum nostrum assumenda. Aut autem id ab quis.','qui',1454625,NULL,'2018-12-06 16:25:34','2022-01-26 08:15:16'),(10,5,10,'Voluptatem ullam accusamus saepe aspernatur eligendi. Nemo et impedit veniam voluptas est sint doloremque. Repellendus odit tenetur corporis ipsa maxime hic et.','nemo',842964,NULL,'1977-08-25 23:07:04','2012-10-13 14:23:13'),(11,1,11,'Autem non iure qui est eos consectetur dolore eum. Iure non qui perferendis laborum. Dolore deleniti ipsa quibusdam illo ut tempore enim. Provident eum ducimus voluptas suscipit qui.','possimus',0,NULL,'1997-03-17 18:41:52','2000-03-18 09:53:10'),(12,2,12,'Rerum ut laborum odit est. Esse sunt quo aut sequi eaque laborum. Eum similique omnis vero aliquam omnis.','laboriosam',27242266,NULL,'2009-11-10 16:04:58','1970-11-16 16:16:23'),(13,3,13,'Est quibusdam possimus necessitatibus consequatur. Ut nihil enim recusandae ut. Et quasi quidem et. Aut architecto rerum esse id. Velit est qui facilis veritatis id libero.','officiis',50,NULL,'2012-09-23 03:16:41','2003-09-08 17:39:47'),(14,4,14,'Consectetur consequatur sapiente sit ex ut nostrum. Nobis et nobis culpa excepturi aut incidunt quas. Aut eius repellat nesciunt eos aut molestiae commodi necessitatibus. Consequatur beatae harum nostrum voluptatem ad autem rem. Suscipit quam aut dolorem optio ea repellendus delectus.','dolores',13028437,NULL,'1990-05-03 19:47:05','1997-09-14 19:33:25'),(15,5,15,'In architecto ipsam nihil iste. Occaecati impedit minima cum aut consectetur qui. Maiores quasi officiis et tempore. Harum earum consequuntur minus corrupti est tenetur iusto.','iste',4,NULL,'1993-08-14 03:37:33','1986-11-02 22:42:15');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'repellat','1977-11-25 07:51:08','1991-10-06 11:38:15'),(2,'ab','1971-09-14 09:19:04','1971-01-10 01:09:06'),(3,'temporibus','1990-12-22 12:43:55','2014-10-08 15:55:14'),(4,'accusantium','1977-10-31 09:52:40','2019-08-09 20:34:08'),(5,'rerum','1994-01-28 17:51:41','2010-10-02 16:57:50');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES 
    (1,2,1,'I am! But I\'d better take him his fan and two or three of her sharp little chin. \'I\'ve a right to think,\' said Alice more boldly: \'you know you\'re growing too.\' \'Yes, but some crumbs must have been.','2097-05-08 11:42:15'),
    (2,2,5,'Caterpillar. \'Well, perhaps you haven\'t found it so VERY remarkable in that; nor did Alice think it so quickly that the Gryphon at the door began sneezing all at once. \'Give your evidence,\' the King.','1999-05-01 02:27:39'),
    (3,10,3,'CHAPTER III. A Caucus-Race and a piece of it in large letters. It was so much at this, she came suddenly upon an open place, with a yelp of delight, and rushed at the other, and making quite a large.','1988-09-15 15:46:44'),
    (4,3,4,'Hatter. \'He won\'t stand beating. Now, if you hold it too long; and that makes you forget to talk. I can\'t get out again. The rabbit-hole went straight on like a snout than a pig, my dear,\' said.','1990-05-31 06:39:21'),
    (5,5,15,'ME, and told me you had been wandering, when a cry of \'The trial\'s beginning!\' was heard in the same tone, exactly as if she could not think of what work it would be wasting our breath.\" \"I\'ll be.','1990-06-03 19:00:03'),
    (6,8,6,'Besides, SHE\'S she, and I\'m sure she\'s the best plan.\' It sounded an excellent opportunity for croqueting one of the fact. \'I keep them to be a lesson to you how it was talking in a low, weak voice..','2002-03-21 21:36:00'),
    (7,7,9,'I\'m somebody else\"--but, oh dear!\' cried Alice again, in a dreamy sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then hurried on, Alice started to her head, and she felt sure it.','1971-10-18 03:18:15'),
    (8,4,8,'The door led right into it. \'That\'s very important,\' the King sharply. \'Do you take me for a baby: altogether Alice did not like to be done, I wonder?\' As she said to itself \'The Duchess! The.','2025-10-19 05:48:50'),
    (9,10,9,'Yet you balanced an eel on the slate. \'Herald, read the accusation!\' said the Queen put on her spectacles, and began to feel which way it was all about, and make out exactly what they WILL do next!.','1989-08-19 14:30:53'),
    (10,5,10,'And the moral of that is--\"Oh, \'tis love, that makes people hot-tempered,\' she went on all the time he was obliged to have it explained,\' said the March Hare. \'He denies it,\' said the Gryphon..','1971-11-28 14:00:58'),
    (11,11,3,'Cat in a voice of the party went back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid gloves in one hand and a fan! Quick, now!\' And Alice was beginning very.','1979-03-28 18:54:34'),
    (12,7,12,'But she went nearer to watch them, and was just saying to herself, \'to be going messages for a great thistle, to keep back the wandering hair that curled all over crumbs.\' \'You\'re wrong about the.','2030-11-03 20:45:09'),
    (13,13,5,'Mary Ann, and be turned out of sight: \'but it seems to like her, down here, and I\'m I, and--oh dear, how puzzling it all came different!\' the Mock Turtle would be offended again. \'Mine is a long.','1981-03-06 04:09:51'),
    (14,12,14,'Alice thought over all she could for sneezing. There was nothing so VERY much out of the window, and some \'unimportant.\' Alice could hear him sighing as if it thought that SOMEBODY ought to tell its.','1973-09-12 09:40:33'),
    (15,9,15,'An obstacle that came between Him, and ourselves, and it. Don\'t let him know she liked them best, For this must be Mabel after all, and I shall be punished for it now, I suppose, by being drowned in.','2000-07-02 17:23:00');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'ad',1),(2,'alias',2),(3,'ad',3),(4,'laborum',4),(5,'consectetur',5),(6,'autem',6),(7,'dolor',7),(8,'animi',8),(9,'nostrum',9),(10,'quis',10),(11,'dolorum',11),(12,'itaque',12),(13,'modi',13),(14,'enim',14),(15,'eos',15);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  KEY `profile_fk_1` (`photo_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `profile_fk_1` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES 
    (1,'f','1995-05-20',1,'1974-03-01 00:27:00','South'),
    (2,'m','2019-12-06',2,'1990-08-13 08:53:36','Lake'),
    (3,'m','1975-05-11',3,'1998-09-16 04:40:31','New'),
    (4,'f','1982-12-14',4,'2007-11-07 20:30:32','West'),
    (5,'m','1973-02-12',5,'2013-02-26 11:31:32','North'),
    (6,'m','2021-01-29',6,'2002-01-16 00:30:38','East'),
    (7,'m','2004-02-18',7,'1982-12-13 01:50:33','North'),
    (8,'f','1987-03-19',8,'1983-12-30 07:32:26','Port'),
    (9,'m','1982-03-06',9,'1971-04-25 13:39:16','East'),
    (10,'m','1981-09-19',10,'1990-12-29 17:20:28','Port'),
    (11,'m','2015-08-10',11,'1996-07-30 03:58:43','Lake'),
    (12,'f','1999-09-10',12,'1978-07-10 05:29:57','North'),
    (13,'f','2012-08-28',13,'2010-05-30 20:22:43','East'),
    (14,'m','1981-12-09',14,'2014-09-15 08:05:00','East'),
    (15,'f','2009-01-20',15,'1971-10-10 08:11:53','Port');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES 
    (1,'Nat','Gutmann','jeanne61@yahoo.com','gvkv',526196973),
    (2,'Parker','Reichel','astrid.cole@yahoo.com','hlln',542624156),
    (3,'Elian','Dibbert','ericka.wolf@gmail.com','acjw',533813722),
    (4,'Nat','Gibson','tony.senger@gmail.com','npzr',542629856),
    (5,'Genevieve','Brown','qbraun@yahoo.com','zdyi',544002941),
    (6,'Anastacio','Stracke','nwitting@hotmail.com','aqtl',521783394),
    (7,'Elvera','Dach','vaughn06@yahoo.com','xkdt',538152406),
    (8,'Jeremy','VonRueden','muhammad.jones@gmail.com','nlem',531925601),
    (9,'Joanie','Cummings','wisoky.leo@hotmail.com','oezz',538959457),
    (10,'Nat','Armstrong','bernard.schimmel@yahoo.com','rqyi',542599082),
    (11,'Rossie','Hansen','sanford28@hotmail.com','qcdy',528374108),
    (12,'Melany','Gibson','dovie90@hotmail.com','ydue',547779046),
    (13,'Gabriella','Ritchie','candace33@yahoo.com','eeqe',522010623),
    (14,'N','O\'Conner','friesen.vivianne@yahoo.com','vcff',532840250),
    (15,'Nya','Mante','nrunolfsdottir@gmail.com','ubmu',547121587);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,5),(2,4),(3,2),(4,3),(5,3),(6,5),(7,4),(8,2),(10,3),(12,3),(14,4),(15,2);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-07 11:34:57
