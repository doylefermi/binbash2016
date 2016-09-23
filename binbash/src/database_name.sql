-- MySQL dump 10.16  Distrib 10.1.17-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	10.1.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add question',8,'add_question'),(23,'Can change question',8,'change_question'),(24,'Can delete question',8,'delete_question'),(25,'Can add task state',9,'add_taskmeta'),(26,'Can change task state',9,'change_taskmeta'),(27,'Can delete task state',9,'delete_taskmeta'),(28,'Can add saved group result',10,'add_tasksetmeta'),(29,'Can change saved group result',10,'change_tasksetmeta'),(30,'Can delete saved group result',10,'delete_tasksetmeta'),(31,'Can add interval',11,'add_intervalschedule'),(32,'Can change interval',11,'change_intervalschedule'),(33,'Can delete interval',11,'delete_intervalschedule'),(34,'Can add crontab',12,'add_crontabschedule'),(35,'Can change crontab',12,'change_crontabschedule'),(36,'Can delete crontab',12,'delete_crontabschedule'),(37,'Can add periodic tasks',13,'add_periodictasks'),(38,'Can change periodic tasks',13,'change_periodictasks'),(39,'Can delete periodic tasks',13,'delete_periodictasks'),(40,'Can add periodic task',14,'add_periodictask'),(41,'Can change periodic task',14,'change_periodictask'),(42,'Can delete periodic task',14,'delete_periodictask'),(43,'Can add worker',15,'add_workerstate'),(44,'Can change worker',15,'change_workerstate'),(45,'Can delete worker',15,'delete_workerstate'),(46,'Can add task',16,'add_taskstate'),(47,'Can change task',16,'change_taskstate'),(48,'Can delete task',16,'delete_taskstate'),(49,'Can add queue',17,'add_queue'),(50,'Can change queue',17,'change_queue'),(51,'Can delete queue',17,'delete_queue'),(52,'Can add message',18,'add_message'),(53,'Can change message',18,'change_message'),(54,'Can delete message',18,'delete_message');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$qfjnkj7SBRT5$k62OFXDBN2sLM5A4Iprkp0jFaY5jACKevvDFL78TctU=','2016-09-21 07:50:34.365729',1,'nimda','','','',1,1,'2016-09-21 07:48:34.720836');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bashbin_question`
--

DROP TABLE IF EXISTS `bashbin_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bashbin_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `question_timestamp` datetime(6) NOT NULL,
  `intro_to_level` longtext,
  `intro_to_question` longtext,
  `ls_cmd` longtext,
  `cat_of_question` longtext,
  `cat_of_file` longtext,
  `cat_of_testcase` longtext,
  `answer_md5` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bashbin_question`
--

LOCK TABLES `bashbin_question` WRITE;
/*!40000 ALTER TABLE `bashbin_question` DISABLE KEYS */;
INSERT INTO `bashbin_question` VALUES (1,1,1,'2016-09-21 08:28:17.648182',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Your task is to write a bash script that echos an input string. Assume that the input string is available as a command line argument.\n            Example:\n 		INPUT: Hello World\n                OUTPUT: Hello World\n\n','','Hello world\n','91735773a0dd29718942bfbf5e74a084\n'),(2,2,1,'2016-09-21 08:28:17.721224',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Your task is to write a bash script that echos the count of even numbers present in the range  1 to n. You are required to enter the value of n.\n            Example:\n                INPUT: 10\n                OUTPUT: 5\n\n','','10\n','4f6480045839af6ab7f29b801e7e06d4\n'),(3,3,1,'2016-09-21 08:28:17.765150',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Given n numbers, your task is to print the average of those numbers. You are required to enter the value of n.\n            Example:\n                INPUT: 3 4 5 6\n                OUTPUT: 5\n\n','','3 \n4 \n5 \n6\n','4480f03c3c3b8ea95236d1abe280a687\n'),(4,4,1,'2016-09-21 08:28:17.809574',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Your task is to compute the following function for any given positive number. The task should be implemented using a recursive function. The number must be entered at runtime.\r\n	f(0) = 1, f(1) = 2, f(n) = f(n-1) * f(n-2)\r\n	Example:\r\n                INPUT: 4\r\n                OUTPUT: 8\r\n\r\n','','4','f191b46dc0ce5ff0b970414b0c547ce1\n'),(5,5,1,'2016-09-21 08:28:17.853620',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Your task is to write a bash script to convert the given time in 24 hr clock to 12 hr clock. The time in 24 hr clock must follow the format HH:MM. The time in 12 hr clock must follow the format HH:MM AM/PM.\n		Example:\n			INPUT: 13:15\n			OUTPUT: 01:15 PM\n\n','','13:15','da147897a8db023dadc52deaa611f1fb\n'),(6,1,2,'2016-09-21 08:28:17.898462',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Welcome to Level 2\nIt seems that there has been an abduction. The abduction of some prominent programmers has some connection to this new “closed programming world”.\nThe abduction happened at the annual ---- conference. A document was recovered from the scene. \n\nThe document is a piece of paper torn out of a magazine article. There appears to be some hidden data in it. To recover it you must write a bash script that collects all capital letters in the text and prints it out. The document can be found in the file ‘file.txt’. Remember the script must work for any text. Assume that the input file is available as a command line argument. \n    Example:\n        INPUT : All Good Things Come To An End.\n        OUTPUT : AGTCTAE\n\n','','file.txt\n',''),(7,2,2,'2016-09-21 08:28:17.932878',NULL,NULL,'question.txt testcase.txt answer.sh file.txt',' The recovered data does not make any sense. It seems to be encoded. Your task is write a bash script to decode the data in the file ‘file.txt’. The data appears to be encoded using Atbash cipher. The resulting output must be in lowercase. Assume that the input file is available as a command line argument.\n    Example: \n        INPUT : AGTCTAE\n        OUTPUT : ztgxgzv\n\n','','file.txt\n',''),(8,3,2,'2016-09-21 08:28:17.965935',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','The data still seems meaningless. Your task is to write a bash script that retrieves the character that occurs after every 2 consecutive vowels. The resulting letters may form a meaningful word. The input may be found in the file ‘file.txt’. Assume that the input file is available as a command line argument.\n    Example:\n        INPUT : adjdnaehskdsksiodsdnsoedjkneas\n        OUTPUT :hdds\n','hgtfoeyhgytfaeesjksailhvjhuolvtfvheuodmdmeawhbhfiopddkdeiadmkdoigdndkhiaehssjoas\n','file.txt\n',''),(9,4,2,'2016-09-21 08:28:18.009761',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Congratulations! You have uncovered a clue ‘YELLOW PAGES’. Let\'s take a look at the yellow pages. Your task is to write a bash script that retrieves all mobile numbers present in yellow pages and convert it as follows ABCDEFGHIJ →  +91-ABC-DEF-GHIJ. Remember that the phone numbers must be valid numbers issued in India. The data in yellow pages can be found in the file ‘file.txt’. Assume that the input file is available as a command line argument.\n        Example:\n            INPUT : 9946789045            \n	    OUTPUT : +91-994-678-9045\n\n','29669841046\n73661073347\n2869264\n24893160959\n5566446\n51199510910122\n28027561576232\n569575727712312\n489210160751\n41850718303\n19774226624122\n4449554378132\n648799411193\n4588122846123\n55613459823\n153525894162\n1574908492732\n7078719461832\n5638104377932\n692015723231\n867328583922\n36866916123\n57564045423\n56002812898123213232\n33075943899\n2182923213\n133309\n25467660464\n24342444\n575702840\n2323233236663646886\n99406275072\n767164556568\n53071867670\n97095112567565\n499129498777\n13564320441\n834019\n4631485654688043\n893744650965\n31077456462654\n8833378172754645645\n57914169632\n4592\n3859975\n361729174320\n725465597409072\n771782\n981632\n33172\n409984656564255\n565464579091458732\n028467\n60705557676688\n656588402982081\n1828743\n30343531\n627588\n5654625105109405\n622545654654725797\n90251967341546546\n42702104218\n77357\n2081156554107472\n58217\n0490858\n32269\n8949399\n25787922261571\n5254525661260\n9596693\n38729058559\n8326676662819348\n47315656040\n4116475014\n4952534726776701\n4906679\n769602\n1367587594732\n63126983900\n4431676761636584\n72527934767676599\n802983347526765756\n223598943356756467\n830882\n98179263407\n46025866771175\n134962959\n612179049686\n122332443773\n6941949109557\n528052089195676576756\n82102457560\n31410514055676576\n7915068953976\n37856875565765\n501903910727657\n21192660623657\n52093244336765765765\n566226137687657\n81805018882657\n618933764006576\n190004\n308673\n53091288408\n3707938\n2304380\n6766133418\n57185978586\n47487146\n5573067273338\n6576767103631231\n3442387547110\n2111431295151\n695317017381\n42766202744\n83668385132\n3744973329416\n193920861031\n119857152646\n893715903156\n1417204003416\n795814574062\n52807573356\n22963631281\n27485734816163\n32927509591\n7508231679616\n21829579996\n694172073\n45306019987\n1931183971\n19394929395\n72890428818\n147272987357\n885837208063\n361513879\n42211857521\n6890601780\n50022008767\n87245136309\n37075973106\n73763815143\n7992060644\n8540225999\n87280826818\n595847061661\n1116570819\n9555589481013\n732885778419\n35817921464\n31788212516\n936823566746\n945815151831\n361829305112\n185524330504\n3670528882\n71687187562\n83710649266\n15975334730\n535738411251\n10800466705\n96755966907\n489552401\n794497330537\n61968117175\n9901302152\n666463770353\n42392977255\n73048649212\n3183963689\n64695637254\n9687431930\n98136262563\n10124363877\n49051905267\n1882173282\n648622602\n8396420015\n48924603758\n21151756878\n452052389558\n27372244981\n921695571570\n599733956291\n7604771369\n837174207\n3878575314\n33015822162\n81834541333\n68034512737\n7188655946938\n5811279256415\n786602676507\n2639990699\n7456009192\n81255630136\n3511540344\n284516547\n437157201133\n15911530775\n43829281515\n555945\n532606532181669561\n637829891444\n\n5156535323\n79401621565454245\n8045248\n761666320\n49761518153\n18180175543\n3452934344291408\n278710448146\n8387911513423\n7342598072343\n610069176044\n51872915919343\n55950240395343432434\n59469748065432\n870697775104\n24261789579234\n5681217222232\n77048756989423\n243882454134234\n288481757703\n855551562984\n89882049570324\n22511375617234\n9750781027323423\n65547989462423\n648650941654\n89933179368324\n7447762934423\n42318591773432\n312150228264324\n127238232\n67369808759\n191259404423404\n6157967821023\n58587237591423\n78542497116432\n94489857754432432\n46841790259423\n359854504814\n31510563138324\n5825966360423\n3851069308143\n115232200114\n62254684988324\n258110915072343243434324\n1570772216723\n560904363373423\n17356750650\n695970336563\n251765523474324234\n7374338271123\n77217688363432\n263840172904\n810974364313\n376208693003\n5241129134343\n8927971804843\n5822292520832\n1769676021932\n24622342115324\n71729569809432423\n20969464337\n1045093088432\n45998139956432\n69054182258234\n8830739727432\n56228043163234\n20071060028432\n214039118342\n2835233455823\n93873386573342\n82260428395423\n741485902854665657\n4583811115165\n86325532722\n92945415160657\n6108198857167\n1600476546057\n104121438616\n958025015775565465657\n5157035091657\n31535693939\n7222836307766\n1567241814476\n87250371524765765\n2421035080565\n2126899938776\n520849430677\n330142685406\n73488679919765\n96719018746\n5250061865857\n2662082\n22066123815\n4225966677635\n82503717865752\n3330627727265766765\n537829289376766\n640512498117\n4272858244265\n64759206506765\n87885735583765\n2622300782566\n5289806000286576767\n93803954695\n55013509576\n6792188196067\n83812881517657\n6056199528556\n85092425390765\n6322139795676\n787054946626\n407307322075\n5764148041365767657657657658657657657\n8291688362165765\n2840350985765\n39773295297\n11509451627657\n737872449266765\n38917832234765\n185072164127\n4261971720965\n31067507529765\n885786640167\n8733214463465\n82383200876765\n223426714007\n12381589819657\n118228511865\n80000544804767657678787876\n27454578018\n321508361917\n9712786524187\n45592164497\n207018888498\n9404903817\n547985387281\n457815784067\n5555902820287\n87066603348\n383168237667\n955420894008\n453603144417\n35114753046\n56017290982\n86109712582\n119521947537\n22412218498\n14254056336\n30477088647756\n130610362747\n33582413352567\n351391209956\n7445359633876\n4018938694876\n996649859747\n453573026696\n4589881987776\n574862994197\n195098649496\n690862713447\n39734836965657\n1796945598667\n458792692286\n1150948375967\n3511647959065\n69942055546\n1501305132076\n34326093411\n856791689857\n54242657946\n574018258246\n1549803496967\n737562956576775\n7397318516275\n5201168116267\n29651220183\n81984860146\n41369502235\n2561874896667\n46611377899\n7893443898767\n948631669967\n829937785097\n5305756252267\n90275001992\n26490830781\n39419269071\n9030449367\n66414148297\n57386588632\n46390868722\n87072982023577777777777777775777\n2040252781767\n2555742788565765\n3974318058765\n215280812967\n975938098765432794867\n221724\n2073179\n2298900639\n2015585260\n2887767994\n6231743770\n733891200\n914747618318862186191\n860584054\n5862857082\n4816643525\n4661143488\n8457036770\n271522572\n3740111917\n62417761691912294970\n534177516\n4932122333\n3422274407\n8765087112\n2183765138\n77287016\n270519596288652350024\n453806456\n1969905588\n1673988591\n5855328120\n19672303\n9861412045878245232\n4738728002\n705608447\n65776279\n37430718836\n8304666223\n7178686567\n99125598727488329315\n4722438703\n7625885605\n6179604434\n34281043812\n85891730716\n8831524421\n1202372871\n1196242171\n6176825366\n201823198\n46450390855194451726\n5615056425\n2956240101\n3719743064\n978236858\n3265727203\n4716952140\n5265392113\n8370090844459925913\n2520797929\n9965302320\n1935400042\n1861333138\n4680490616\n552017461\n5364705648\n787173068347754102664\n99379500186\n4518662797565656\n2524363581956\n29907977977546\n44296401777546\n11468343862546\n18077481595546\n21751627145546\n9781624098854\n6668466569654\n485747913065\n50698564523654\n60894735397654\n19750796166654\n82229552314654\n7632018067865\n117273055196\n32160260795\n12149809\n9946789045\n89130298538\n39241140447\n96648105051\n2537068917\n3556420792870\n12807790303867\n79525710806867\n35583752961876\n951955292798768678\n2049171436278\n60042866023768\n7440970293076\n99250673045876\n9708695053387\n33311792058876\n79031071951876\n928711978928\n43696867779768\n642186129007\n140674485\n1986846900\n5982675734\n8567\n10601097010\n649002118746586762765\n1198451551\n4904259448\n3379773382\n9348737256\n81309808361\n3902146563\n6750424280\n3653642051\n2270067659\n6181337775\n0329231191824410663\n9292360347\n1052967892\n8212774713\n93984787867900589\n50120437415876\n6766093387787\n1513632373387\n98482154875878\n94504751785787\n884080145768\n735426119957876\n57312292998867876\n271050981898\n561534008247\n73869096207876\n4127228820867\n444181851918\n35375332270678\n48466827190768\n1412403794267\n66883978611867\n474778394398\n87468826767\n6302180285187\n835328137158\n21676939553768\n5144839420967867\n769411740128\n84211786999678\n51725909085678\n870499783247\n10392112244876\n678186615678\n3875612672978\n1229520368378\n189385605477\n50819496338867\n7124555329087\n498918145688809064\n605494903935\n8568831669045\n64191737937\n74533966564\n335500593\n8686230369\n5677497355\n5595356433\n42453518489\n1812064599\n5039261331\n393041610\n5603490074\n91070063\n55740759345\n6635287832980591375553\n7457748871\n3641150718\n6835354960\n8420242001\n3456647464\n7375656512\n1061752390\n3197760479\n3449014332\n8054658059\n869601973\n6165666122\n291480440\n7765499776\n8318897202\n60162603806\n8508446546\n253562026\n5192430811\n17075626555\n65230\n456883884958359\n8486481509\n37184683227\n26894328043\n9648574608\n58861270209\n8951533481\n22118239846\n52791705373\n745993620\n49087445841\n15190528387\n81416363709\n3228540893\n55745227979\n89165293684\n98382527381\n9993607010\n30463908960\n67932725732552\n219585272035\n4680456212053\n4735222540285535\n7588869653954\n61448679938533\n3109936577\n2734924571353\n63585381007219068\n342581239929\n207120403970\n6021662115368\n465463488750\n570416818583383535338\n355741587243\n6222410678953\n3455266394\n82258411794\n3436312670\n4484543161\n2226508465\n3641395514\n753118427\n39996649\n19526363073\n295575623850\n2195335193\n32428061781\n455128991338\n3499747851635\n1461169909\n4427101875\n766232910\n242726649198\n804542406121\n5723124104\n441116026\n5250584903\n528255109\n90037201285\n85428602898038\n80182524115067\n523602482227\n53377841884\n96967902162\n511849586\n3059004508\n80751658185\n4471988558239\n4425590482747\n4225251718\n3288006719\n2462536181\n9422225645\n3874943\n11525588568613\n5712882828889978\n12443044744\n1931791315585\n3249779867824\n14129276806\n745826130\n4427481476\n7452670066\n7006702774\n2613736\n9874455494538\n7139843794952\n3117924770374\n12323015474770\n456588619874\n4184363802917\n20183166836741\n5222783475671\n5752948244871\n88944993638\n7700378190\n349564061744141741\n81113911234\n8318323755\n452300134254\n710578834784714\n66902151241\n2640100725124\n380228916314\n1168180388874174\n14751815758\n7930784427\n6250257299\n4277955865\n1284578956\n14646441459\n40742910574137\n75851248280\n2771018237\n8919900514\n936934648\n1501547798\n5286527232\n1283808651\n355354655421\n248655817275\n935755502350\n6153556525826139\n8758611260985\n837169631848\n60861311744528\n65786941599285\n172621701282\n158547714422\n518041876215\n971305837522\n23932210617\n8397456264028\n55950696387528\n83021665127542\n797130217538852\n767819468\n3249637780482\n112393940428\n52885425328828\n6590686958774\n177567562132\n9473377826\n3871690470\n6744312107\n6394293758\n8762541\n6748347538\n68142784132\n46520027926759082263\n20129030898282\n8456995491685\n13496237074285\n278564160822\n771198432\n20642234\n9541419725999\n154845870529\n1130880619\n6553158808\n188177681114\n4877913001525\n48946538027\n9608932007\n1869328714\n67643952\n9074069038\n405794846483\n76662817171879\n60830031235\n29361605\n8007172003\n71953109635\n3842184841114\n590197178898\n8357090220\n526092974\n3600331496\n29580128577985\n67331327428899\n914033897\n4574078206\n1895071489\n3098746993\n2246181892122\n994953877015\n69054926260\n7003682656\n8288802814\n4359259058\n88016445206916\n7030360858294\n6136015112\n44404349\n9858069920\n254207512889737\n37395706165528\n990630966\n41795950796\n715814492266\n38884033828289\n72500697684428\n9497634202\n8033046017524\n9757400171482\n8316040326552\n37441217045\n3171246373752\n8902773061\n8346529393\n2510521506\n586071239\n483881495\n8932239288\n93951363229\n6702540979808\n56330284507075\n8933045\n6331150735\n955706564870\n7681829144150\n9649208441434\n3196114328\n4654081679\n964564660\n5385982174\n25625564553\n25167910737\n32964906657\n19384447242\n66728831284\n76765373555\n17488172840\n11764119772\n65013719729\n6818471202\n380623086\n5146786327\n223703616622\n1520550658989\n3384414270437\n916181356133\n173206599\n5094784475\n400152539109519\n157625024988\n6700319981840\n1653295734925\n52835116024248\n36446167265252288484182\n54824468767841\n9416372447548218542584814\n669964810328\n4562618357\n45350316804\n1858782727\n295319860\n776442554\n9053260\n2222307287\n742518674497\n65892842112904\n827207284\n353764785\n3746469658\n28512560928974\n3934482844154\n9774248128418\n8265351787417\n461857748498528\n110665767\n270078423\n899032\n67836780626\n3645854176930994\n7885416289819\n682509237787\n2875545345688\n64422450\n6270176839\n8968177326\n199930259697\n2260415641924\n460642097\n974520622\n406882010356\n23521228419577\n7170234978488\n619079966731\n95429705671\n2929128888\n5924086536\n844311080\n20903360561\n24540099318\n576841552895\n9497030349896\n186705994142\n8810747099\n214474476\n7776722826\n10239058\n2522725839\n8252806377\n818115213613\n720980841872244\n702205121417\n764310317\n5699382850\n155013969\n42390325749\n432998895810\n57839931841318\n1829172100145\n99373297522141\n437077857\n6711487848\n105886604\n6174509044\n2422209512\n197268326\n251892147646\n969868547627\n75341820713\n6990780540\n2025195992\n61364987\n1541748890\n4856596353636\n25841238656358\n9295999168\n862340958\n891711936665\n59654122100115\n35821878287\n519009240\n8574382473\n4781526822236\n8808861115\n8440395667\n5444144733\n4996154666029\n188041873838\n8444215097\n968377238\n9402624661\n755272636\n613581992577\n9252929851295\n9302810930240\n925054979\n6604759956\n29612575961508\n7979892801848\n5824268589\n8521954712\n679150461\n7628158948\n61451203114\n7304132358947\n65630264679\n127398392894\n9055062978\n8007868170970\n46113963323\n4577811519802\n6087566504151188\n4636185702918\n10644155219\n103955225692\n2250192373081\n1269191222828418\n6455868507181\n1563017719681\n683435854471181819181818\n3493115263\n1500458559\n26361985313\n4610514191\n525176713\n371083840\n434012360957\n4115055720472\n9214767912\n8778681899\n172147542\n9233289410\n937727893\n18591782644\n5289305347892\n48099255315\n666\n46439112268\n5833824560354\n6400608237477\n4676998082238\n3787557431824\n3686218099281\n5610422918128\n21988504\n88104269571\n','file.txt\n',''),(10,5,2,'2016-09-21 08:28:18.043530',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Looks like you have just uncovered a conversation between X and Y. There seems to be a secret algorithm embedded in their conversation. Your task is write a script that prints out the algorithm. It is written such that the message written at 01:00 is Step 1, the one at 02:00 is Step 2 and so on. The conversation can be found in ‘file.txt’. Assume that the input file is entered as a command line argument. Also assume that there can be a maximum of 20 steps.\n        \n	Example:\n            INPUT :\n            2/11/2014, 12:22 PM - John: Hi Stacy\n	    12/11/2014, 12:22 PM - John: :)\n	    13/11/2014, 1:00 AM - John: How are you?\n            13/11/2014, 1:59 AM - John: Are u home?\n	    13/11/2014, 2:00 AM - Stacy: Hi John\n	    13/11/2014, 2:10 AM - Stacy: yeah I am good	\n            13/11/2014, 2:15 AM - Stacy: and home too\n            13/11/2014, 3:00 PM - John: ok\n            16/11/2014, 3:14 PM - Stacy: how are you?\n                \n            OUTPUT :\n            Step 1: How are you?\n            Step 2: Hi John\n            Step 3: ok\n\n','2/11/2014, 12:22 PM - John: Hi Stacy\n12/11/2014, 12:22 PM - John: :)\n13/11/2014, 2:00 AM - John: How are you?\n13/11/2014, 2:59 AM - John: Are u home?\n13/11/2014, 8:00 AM - Stacy: Hi John\n13/11/2014, 8:10 AM - Stacy: yeah I am good\n13/11/2014, 8:10 AM - Stacy: and home too\n13/11/2014, 9:00 PM - John: ok\n16/11/2014, 4:14 PM - Stacy: how are you?\n16/11/2014, 4:16 PM - John: I am good too\n16/11/2014, 4:16 PM - John: See u tmrw at work\n16/11/2014, 4:16 PM - John: :)\n16/11/2014, 4:24 PM - Stacy: yeah ok\n','file.txt\n',''),(11,1,3,'2016-09-21 08:28:18.076938',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Questions closed.\nWill be available shortly.\n','','',''),(12,2,3,'2016-09-21 08:28:18.109618',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Questions closed.\nWill be available shortly.\n','','',''),(13,3,3,'2016-09-21 08:28:18.143048',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Questions closed.\nWill be available shortly.\n','','',''),(14,4,3,'2016-09-21 08:28:18.176943',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Questions closed.\nWill be available shortly.\n','','',''),(15,5,3,'2016-09-21 08:28:18.210405',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Questions closed.\nWill be available shortly.\n','','',''),(16,1,4,'2016-09-21 08:28:18.243995',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Questions closed.\nWill be available shortly.\n','','',''),(17,2,4,'2016-09-21 08:28:18.277276',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Questions closed.\nWill be available shortly.\n','','',''),(18,3,4,'2016-09-21 08:28:18.310202',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Questions closed.\nWill be available shortly.\n','','',''),(19,4,4,'2016-09-21 08:28:18.354854',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Questions closed.\nWill be available shortly.\n','','',''),(20,5,4,'2016-09-21 08:28:18.388395',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Questions closed.\nWill be available shortly.\n','','',''),(21,1,5,'2016-09-21 08:28:18.421651',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Questions closed.\nWill be available shortly.\n','','',''),(22,2,5,'2016-09-21 08:28:18.455253',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Questions closed.\nWill be available shortly.\n','','',''),(23,3,5,'2016-09-21 08:28:18.500068',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Questions closed.\nWill be available shortly.\n','','',''),(24,4,5,'2016-09-21 08:28:18.543916',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Questions closed.\nWill be available shortly.\n','','',''),(25,5,5,'2016-09-21 08:28:18.577547',NULL,NULL,'question.txt testcase.txt answer.sh file.txt','Questions closed.\nWill be available shortly.\n','','','');
/*!40000 ALTER TABLE `bashbin_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bashbin_user`
--

DROP TABLE IF EXISTS `bashbin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bashbin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(1000) NOT NULL,
  `question` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `last_correct_submit_timestamp` datetime(6) NOT NULL,
  `cat_of_answer` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bashbin_user`
--

LOCK TABLES `bashbin_user` WRITE;
/*!40000 ALTER TABLE `bashbin_user` DISABLE KEYS */;
INSERT INTO `bashbin_user` VALUES (1,'user1',2,1,'2016-09-21 08:12:20.169416','/home/haxorware/final/binbash_new/binbash/src/bashbin/Bash/Level1/Question1/answer.sh'),(2,'user2',2,1,'2016-09-21 08:14:10.382988','');
/*!40000 ALTER TABLE `bashbin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_taskmeta`
--

DROP TABLE IF EXISTS `celery_taskmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_662f707d` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_taskmeta`
--

LOCK TABLES `celery_taskmeta` WRITE;
/*!40000 ALTER TABLE `celery_taskmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_taskmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_tasksetmeta`
--

DROP TABLE IF EXISTS `celery_tasksetmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_662f707d` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'bashbin','question'),(7,'bashbin','user'),(5,'contenttypes','contenttype'),(12,'djcelery','crontabschedule'),(11,'djcelery','intervalschedule'),(14,'djcelery','periodictask'),(13,'djcelery','periodictasks'),(9,'djcelery','taskmeta'),(10,'djcelery','tasksetmeta'),(16,'djcelery','taskstate'),(15,'djcelery','workerstate'),(18,'kombu_transport_django','message'),(17,'kombu_transport_django','queue'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-09-21 07:47:44.254491'),(2,'auth','0001_initial','2016-09-21 07:47:52.212797'),(3,'admin','0001_initial','2016-09-21 07:47:54.019890'),(4,'admin','0002_logentry_remove_auto_add','2016-09-21 07:47:54.120900'),(5,'contenttypes','0002_remove_content_type_name','2016-09-21 07:47:55.113053'),(6,'auth','0002_alter_permission_name_max_length','2016-09-21 07:47:55.827176'),(7,'auth','0003_alter_user_email_max_length','2016-09-21 07:47:56.529002'),(8,'auth','0004_alter_user_username_opts','2016-09-21 07:47:56.572998'),(9,'auth','0005_alter_user_last_login_null','2016-09-21 07:47:57.097387'),(10,'auth','0006_require_contenttypes_0002','2016-09-21 07:47:57.152948'),(11,'auth','0007_alter_validators_add_error_messages','2016-09-21 07:47:57.222293'),(12,'djcelery','0001_initial','2016-09-21 07:48:04.331711'),(13,'kombu_transport_django','0001_initial','2016-09-21 07:48:06.784785'),(14,'sessions','0001_initial','2016-09-21 07:48:07.352848');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4g5xekoibumsotii004vfgn5r4rgfo90','NzNjYTAxMjE5YmFmZDIwNWQyNzJmYjI5NzExY2E4MjFjYTVmOWYzOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjI2OWI0OTM4MzA0NmUyMmZiOTFhOWI3ZjIzYzViZTMyZmRiZGY4MzEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-10-05 07:50:34.499105');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_crontabschedule`
--

DROP TABLE IF EXISTS `djcelery_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_crontabschedule`
--

LOCK TABLES `djcelery_crontabschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_intervalschedule`
--

DROP TABLE IF EXISTS `djcelery_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_intervalschedule`
--

LOCK TABLES `djcelery_intervalschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictask`
--

DROP TABLE IF EXISTS `djcelery_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcelery_peri_crontab_id_75609bab_fk_djcelery_crontabschedule_id` (`crontab_id`),
  KEY `djcelery_pe_interval_id_b426ab02_fk_djcelery_intervalschedule_id` (`interval_id`),
  CONSTRAINT `djcelery_pe_interval_id_b426ab02_fk_djcelery_intervalschedule_id` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`),
  CONSTRAINT `djcelery_peri_crontab_id_75609bab_fk_djcelery_crontabschedule_id` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictask`
--

LOCK TABLES `djcelery_periodictask` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictasks`
--

DROP TABLE IF EXISTS `djcelery_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictasks`
--

LOCK TABLES `djcelery_periodictasks` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_taskstate`
--

DROP TABLE IF EXISTS `djcelery_taskstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime(6) NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime(6) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_9ed39e2e` (`state`),
  KEY `djcelery_taskstate_b068931c` (`name`),
  KEY `djcelery_taskstate_863bb2ee` (`tstamp`),
  KEY `djcelery_taskstate_662f707d` (`hidden`),
  KEY `djcelery_taskstate_ce77e6ef` (`worker_id`),
  CONSTRAINT `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_taskstate`
--

LOCK TABLES `djcelery_taskstate` WRITE;
/*!40000 ALTER TABLE `djcelery_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_workerstate`
--

DROP TABLE IF EXISTS `djcelery_workerstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_f129901a` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_workerstate`
--

LOCK TABLES `djcelery_workerstate` WRITE;
/*!40000 ALTER TABLE `djcelery_workerstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_workerstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djkombu_message`
--

DROP TABLE IF EXISTS `djkombu_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djkombu_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visible` tinyint(1) NOT NULL,
  `sent_at` datetime(6) DEFAULT NULL,
  `payload` longtext NOT NULL,
  `queue_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djkombu_message_46cf0e59` (`visible`),
  KEY `djkombu_message_df2f2974` (`sent_at`),
  KEY `djkombu_message_75249aa1` (`queue_id`),
  CONSTRAINT `djkombu_message_queue_id_38d205a7_fk_djkombu_queue_id` FOREIGN KEY (`queue_id`) REFERENCES `djkombu_queue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djkombu_message`
--

LOCK TABLES `djkombu_message` WRITE;
/*!40000 ALTER TABLE `djkombu_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `djkombu_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djkombu_queue`
--

DROP TABLE IF EXISTS `djkombu_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djkombu_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djkombu_queue`
--

LOCK TABLES `djkombu_queue` WRITE;
/*!40000 ALTER TABLE `djkombu_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `djkombu_queue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-21 14:14:02
