-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mysteamdb
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `close_friends`
--

DROP TABLE IF EXISTS `close_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `close_friends` (
  `user_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`follower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å¥½å‹è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `close_friends`
--

LOCK TABLES `close_friends` WRITE;
/*!40000 ALTER TABLE `close_friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `close_friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_orders`
--

DROP TABLE IF EXISTS `game_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_orders` (
  `owner_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `order_id` varchar(45) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `cur_version` varchar(20) DEFAULT NULL,
  `buy_date` date DEFAULT NULL,
  `cost` double DEFAULT '0',
  PRIMARY KEY (`owner_id`,`game_id`),
  KEY `game_orders_games_game_id_fk` (`game_id`),
  CONSTRAINT `game_orders_games_game_id_fk` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`),
  CONSTRAINT `game_orders_users_user_id_fk` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_orders`
--

LOCK TABLES `game_orders` WRITE;
/*!40000 ALTER TABLE `game_orders` DISABLE KEYS */;
INSERT INTO `game_orders` VALUES (2,1,3,NULL,2,'v1.0','2017-12-28',0);
/*!40000 ALTER TABLE `game_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_name` varchar(45) NOT NULL,
  `developer` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `version` varchar(20) NOT NULL,
  `state` smallint(5) unsigned NOT NULL DEFAULT '3',
  `on_sale_date` date NOT NULL,
  `cover` blob,
  `introduction` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `games_users_user_id_fk` (`developer`),
  CONSTRAINT `games_users_user_id_fk` FOREIGN KEY (`developer`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='æ¸¸æˆå•†å“è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'æ‰«é›·',1,'ç›Šæ™º',10,'v1.0',0,'2017-12-27',NULL,NULL),(2,'æˆ‘è‡ªå·±',2,'ç›Šæ™º',20,'v1.0',0,'2018-01-07','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\È\0\0\0\È\0\0\0­X®ž\0\0€\0IDATx\Ú\ì\Ýç·­Uu?ðó:ÿ@2ò*#y‘_z\ÆHÔŒd\ÄczbL4\ÅhŠ±%j,1\Æ\rh4°4A¤X@•z\á6.½J¸p©J¹eÿög=\çûœ¹\×Ý§\0\"\Èflö¹»<\ÏZ³~\ç\\sÍµ°k×®mk}\îÜ¹³=ýýð\Ão\Ûÿý·½ù\Ío\Þv\ÓM7m›L&\ÛÉµ\ËsçŽ\Ûv\ìØ±\í´\ÓN\ÛöÁ~pÛ¥—^\Ú\î¿\Ò|öÀ´±^{\íµ\Û\î¿ÿþGu\ï\íÛ·t-\\\×5\Ï<ó\Ìm\çwÞ¶­[·¶ñy~ÿû\ß\ßö\ÐCµûû¾÷¼\æ\ß\èx\Ë-·´\ß}\å+_i\Ïo}\ë[\Û6nÜ¸\íž{\îi\×\Ïoòý\ï}\ï{m\Þwë®»n\Û[\ßú\ÖmŸþô§·mÙ²e\Û\æÍ›·r\Ê)\Û.º\è¢\Ý\î\çy\ï½÷n;ýôÓ·x\â‰Û®¸\âŠmW_}u{\ïÁ\Üv\Ã\r7´1üñ\íZ\è”yºV?\ï\Ý|ó\Í\Û6lØ°mýúõ\ã\Óø]m\\×¸3fÏ­·o\Ývûí··÷\"[Þ¿\ï¾û\Ú\ï6m\Ú\Ôhr\É%—l»ë®»\Æûú.zº\Ç\ç>÷¹m_þò—\Û÷\Ã\ãð(´©|z4Ï…\éÿ&ô\é1%ð\ä_ÿõ_\'^xa{o:ˆÉ£¹Ö¼k¯ôy»\Ï\Î]“)\á&\ïÿû\'gžu\ædJüe—÷w\î\Ü1™\nñdÊ¸É¶m\Û&S\Æ\Ï|g\é{;\Ç\çr÷Ÿ¿½N5™*\Ü\ä\ÜsÏ|ó›ßœ\\s\Í5“©ð¶\ïù\Îö\Û\'Siß«\×\Ïß¾;\ÎÉ—¾ô¥\Éq\Ç79\çœs\Z]§LŸL™>\Ùþðöö\Ý\Ü\Ïo¦\Ìo\×3gÿö÷Á<y\Ç;\Þ1\å\ÅE“\Ë.»l2¬\ÉTA&SÁj\ß\Ëws-÷œ*À\ä\ßø\Æ\ä\Ö[om\ã˜*\ÈdªP“©’M¦\n:¹ó\Î;\Û\Ø3—:\ïúú\ï|grò\É\'·9L•¤=]gÝºu“«®ºª]\Û3c\r\î¸\ãŽ\Æ÷\É\Ü|\Ç5\Ý]§\n\Ú\æ‚gS#2™*Zû\Ü\Ãw§†ar\Ì1\ÇL9\ä&‡÷\ïþ™{¬&Kky.<\Zžjþ\ä?þ\ã?&Ÿø\Ä\'F\á4ð=¡ k¹?\â~ô£}ôÑ“©…nB³\ÒoŒÀˆë¯¿~\Þ\éoÂ˜\Ò\\¦lª<÷B\Ð+ŒWß›Z\Í&HS/6ŠA\é\êwB\Ìv/z?Bƒ©x\à\äð\ÃoBp\ÒI\'5šz?¿\É\ï\ÂðŒ=\Ât\ÆgL^óš\×L¾þõ¯7\" S\Ï\Ð–òT÷0?\ÂL°÷\Ýw\ß\ÝÕ½½ñ\Å·1\×ñº_\î\ë\Õ\Óý¯¼ò\Ê\ÉG1ù\ìg?Û”{jõ\Ç\ç\\\ÐÆƒ.\î9	­ÝƒAñ\Ä\ÃJ³üMiÑ…~û\Û\ßn\n1õª\íZ\Æâ‰Ž”ñ€˜u\ÔQ\Ïõ>UIV²\Ô\ÕZTÈ›\Þô¦f‰\ê`\ê\ïò\ïu¼ödv\Ð\Õ\Z™8+Q­Ž!BŒ¹úÐ‡š¢¸\\ý^®S›õ!0˜KV\Ä+f˜o¼±)HeX„e\Ç\Ô#`ø\å—_>9ûì³›uû\îw¿;\nóŽ\íKŠW\çX…Ü¿	\ÌÆ´9 \åù\çŸ\ß,þ.6…«gM3.JŠû\í·_S|ó#¨\èCP\êüò:…TM˜(÷\n6\áú\Â¾0ù\â¿\Ø_¯ò%(ÿ&””\ã3ŸùLó^””G§œ\Ú\Óu§P¯\Ñu«—\Ï|ÐŽ2{s\æç¾·\Ýv\Û\äk_û\Ú\äSŸúTS÷u\Í*W”œ¡ù\Ø\Ç>Ö”3÷«r‘kÆ¸¬Å¨/L–yDK« yp\áo|\ã›\Å\é™V”U\à>c\Å*“\ëÀ\ÂO\0ô\é\ïz! !x\Û\Û\ÞÖ„ª`Ç’r~T\âQ\"ž2¦-s£·|÷–\ÆT*÷\Ïõ\Â\0ß»\âŠ\Ë2Š22a\×\ÎqŒa@52‚;\Ý&{\ï½w³Ø”rü\×ýWó™\çhx&»{Cs\á}þó?ÿ³A\Z:Åš\â¤Œ!‚\î\ß›waõy)\ß=å”“§P\è\ÊöYÆš\ï\ÇX\Õ9°\à~û\ÉO~²ÝŸBn\Þ|q£\ß4.a–\ïø·ù1P½\Ò£dÌ¾K\è\Í)\Â[&;\á„&‡vX~2È_ø\äal§žz\ê\ä]\ïzWSzÿ®r™9T­öXVA*±¢„¹\ï|\ç;\'·\Ýz\Ûn\Z\Zb!YW\×[±Ê´*D÷\Üsw³$ˆT®zxù¿ÿû¿›\Õ2–\n„À>G i\àÜ¼h\Ñ\Ç¾\'³€\î¼NI\àZwË–‹›\Õõý(½×Œ¯\Z”~\Ü\Ã\ß;š SŒ·¿ý\íM)Ü“’Px\'L›\ç*­½G^õªW5\ë\ê:„’°N\×&l½P²¾ K6¼ªF¨Ž;˜¿\n*ZŠýXjFŠbž7}\Ý<õ\Â³Œ\É+£\ÐÆ±kV\\\Ó\Øc=¶}¯7p‘)\ÞÆ¸yGÞ‰Bš§1F¹#·\îII(q oõŒ\ás\èüˆ¤º\Ó\n\Üø\roxC³P}ÀZ1.#\0\Ü<l^\ë,\r\æóþ\ÞŸÿü\ç\ÛýµÂ–z\0\ÑÀ©§\Ú<YU\nß¥ˆˆœ¸\Äg\ÃA-Œzè¡‡\ÓX¸K/½¤}^½\êv\íœñJ½+ÿþ÷hôx\Ý\ë^\×`!¢h¬¹Dk…¯Þ³òBb\"´\0“^ÿú\×7CÃƒ2ž}^(–¿\Ò\Æ|ÿ{\íµ\×\ä\È#lV8J]!i\ïA0NguVSŽƒ:¨y\ä\n©È†Ws»\è¢õ\í\ßþ¦´¼\Ä<\Ø\èÚ”Ž<Q8ü\åmj2¢Z{óµ|\n„«JU‘\ïº\ß\'ökF \Ãw\ÉzD©•\é!–~\à˜|ø\Ãn7¨#i\æ› °[·\Þ1QüÐ±\ä!ÇwnkJ\Åm\Î\Ã\Ý˜AÀ\\¿*M\r3\ædjXWÙ‡·?\\\à\Îö\æ!X!–+®šRð6\ësó½ö\ÚkšU\ä	§ªPU‹¿œ÷ T‡vø\äŸÿùŸ$!X”\Ã<(;«\è~êŠg0ùÎ˜¼P„„ òØ’¡agatHT\ÚœùD5´z\ï{\Þ\Û<\ÏA\è)\'¸Æ²¾eÓ¢ <S3bI ³y\Û>ø&;\Æ~.\Ô\á\ß\æy\ÈTI\ÐoŒƒò\Æû%ô@\ç7¿ùÍ“}ö\ÙgÌ–m\ß>ð-\ãy\Ô\n¸fJ_û\Ú\×NÎ¿\àü™¸¤\Õ\à\áD\Âf{5–›Œ;¬PaO8\áÄ©òÜ¿›•‰{}\ë[\ß\Úp:¯T=L\î\ï\à=V¾\æ•z\ÏE`y\r\n‰ùÆ†\Ð³q\ã¦q\Þ\îƒQU¡««®™<sŸ!µû`›ó¾û\î;ù«¿ú«É¡‡\ÚÆƒ6„Mp\r\Ü?3\áÿ\Þ÷\î-võœ\Õ;»® ž\×a\Í	‡±³–\ÆÏ²Ö¸\'t1\'\Æ\â«_ý\ê(<ƒ‡|hFQjvÈ½’\à™\"h„ý’K¶´¹1x\"P\Zc¡,øil”\Ý;^|^\n K¸{HAú>ùb\\÷\Ýwoó¼ÿó?ÿ\Ó~\ã¾\æ/˜xQÉ£,\ÆÁ	\r\î¸c\ëL<ò˜¤\n•¬\Î{\ßû\Þf¹²~`\Z/(Ü¤\Å\ãxx•¨+’\Â`ºI÷Á”\ëPP\â\å/y#x¼Fµ\à5‡N\èY¢*¸¦\">†¹/eÁ@GJ²Â¯\Äu¢\nl`U\ï5\âi\Ì÷mo{{‹/\Z€”ƒ°a\Ø\Ýw\ß5“4¨¼j\"X\æ\Ä1B„*8_lô‘|¤Ý³OBx€h’`9P£‡Ñ¹žQd\×i\ÄH\Ö\Z\Î=\ïÜ¦0šhhNñ ¼	%±6…\Ä[¿¥H½b\äA¸ñ%©f0TŒ\ÄöÀxQŸ32\ÆJC[§\r\rû\Ô6²,!Kh\ì\Ê\Î/\êØ–A\êx†W¾ò•\rOV\ï\ÂrÁ4\ß+CMU\ã}¤g\à\Ó\",\Ãh\æWa\ÝóE/zQƒ\"U9\æ\å\åŽ\0zÖŒ•‡ø†57FJ‡)¼Œƒ\n¦­¼õ\é\äª\Ôùœ°¼îµ¯›¼\â¯˜|ýô¯7\å X¬>¦bz,÷¨I‡\\—û\í{\Þóž1ó¾X#\à‰a o…W\Úi_?mfA·Z\Ð0bxr\Þy\çO>þñOþ\í\ßþ­\Å,[¶\\\Òø\Ék •\ë\Þr\Ë\ÍÍ°0Ž®O		.ƒö\Ù#>\Û<\Ø\'|\Ã\r7\Îð·BH\ÞJz[‚Áõ(•µ<w?™\Ê\Ð:±”\0\î16`?T€\ÆøZ\rW<¦ëš‹ß¸f`Ÿ¥­c[VA*\ÑFó \Ñ\ÎÖƒFb¢ n&m@ò\í„ð®»\î\ÞMCý\çú\Òw \Ów\Ü9sƒ\ÇŸñb‰6©‡÷ª©>J\Ærq\Ï\Õ\n$«\æl\Ûvg³f\É\ÂEP1V{T«¸=B\É¼\ä%/iA4…`½\â9¸zA.K^•w\Þ=¢°BóÎŒ¥\àõŸñJŠÏŠ\Î$\ÇIh\Ìû»ß½efAw\Æ.\Â`\Âe¬\Æ\rÂ˜\Â3%cd,þv]ƒ÷’6¦ôd„g\ä\r<\å[P`J\ÝW*Ty `d(0G|õ«_ÝŒsbñÃƒ>0\ÎÁX\ÝO\âAL…¸8W!p\îE‘-± ¯¼\ì\×\îB£!V‚c\Ü\Õ\Ô\á\0½\îoZo2„2Þ…\Õ\çQ¸K\îº\Ï\Î\ä\æ~or C\Írø›²™ð_þ\å_Žð«}¾s\×L\Z2ÊŠX„4¨ðÁ@™×„Y•S4\'×©Vg9lÚ§v+q½2û·;y\ßû\Þ\×p9\åðü[;ò>\á\Zòû«\Þ\'´fD\Ðcý\æ\Ã\nþ†Fc\ï\'6«ñ¡’¹òL\Êz^@	\Å[\ÆJ U:Ró¼¯\Þ\ÕW_\Óh˜\Ô,\ÅkJhl”‚‚ˆd\Ô<Á Z\Ð/^’š9Ë‚\'\ïÀ8C#lœz\É ¿\Å7\nD±mÀ­ZJ:z\àƒË°TC\Ñ/-¬\Zƒ$cc\ÐoùÏ·4\ËQa…W\ÖC^£²xÅ‚ƒ¬\\p|Oöâ‹·Lþý\ßÿ½¤º\\“»\ì\ÒËš\ÅõŒg\n4«\×aQ0‘+g!ª\Å0.D\ã\âú˜Æ‚cp-\Ã\à•ª\×\\	úT¼%4^\×~ñ‹_Ü”€Ç¢°¼(ˆI\àªI¼±’‚D˜\åø—ù—6Gô\å-’^e\é	jþ<˜\ÂGÀúô8„ n£\Ð?’m\Ë*8\Åð7a<ö\ØcšÀ[`d@/±\É\×Ný\Ú\ä¤Oj^\Íû	\Ú\ÑdR\ÂR•4cb\Ø(™ùQT†Í¼\Äp®7z\ï\í¿\"\Ì\äò\ÔSOk\ß5Wt‚hÀ\æ>–Ë«\ïò\Æ\ë\×oùQ­WA2„%`\Ç\ÂÌ¤²¢-h§$ñ¬\Ù[\Þò–¦¥“/Wƒ\Ð\ÜrU\0‚K˜¹\í¼\àMÀ*v\ík£@<ž\Ã=~h)(¿\ì²K\æ\Ätó@|J}T]µ—Z^Ž.\ßòŸ=ü³“¿ø‹¿h%”‚P`°±Ë¾±²­_¼[m¡Š€ÿ\Ó?ý\Ó\ä\ïÿþ\ï\Ôn\ÈQ~VttÏ¾þˆV½\Zµšš¦“Pó\äxGð)7…ÀJ\í¾\Þ•\\“òP*P\ÑwOú\ÒI\r²žüÕ“\ÇUýºX\È+\áQ…\à5[šR<wP9+ò\ï~÷»Û³•u%J\á!\Çsðj\æò²—½¬ÁNrCß‡<¤\ï@\ì~\íoUˆ\×\Îú¥\0,?\"&B\èzpÀ\áH\Ø¯jd¸\n_Lôa]ª2±\Æ,\ã+^ñò\É;\ÞùŽ1\ÍZ‹÷r]‚N1b\Üp”×š	KH\06RÌ«¥ó Ò²J²«¬»,zts|\ÐÁM0<	\rK\èž´¦¦\ëZ\ÍJU„\íwDñ+\ËGI\\›R\ÆVø\êû\âß‹\ÂG*ký!”Œ (\ÖxOŒF\è\Ü\ïˆ\Ï\Ñ\æˆO–\âð\Øæˆž\ßþö\ÙC<ô•¯Ž+\ÜÆ˜R¿\á]ú5u[\å,\Â	¢’!\Ê\è:<‰¿yf|Þ½B{\ç\"}¸›<q\Ñ7›\'1§d­z¾š£ep»\Z;CE†/,g-	÷8½k¤©¼G*c)’rkÞ¤.®üÀš2ˆ\\aK+&y\á‹^8ºVnµ÷>¾\ë·ð.f\æPRz,Å–µxý\ë\ßÐ˜µÞ¬i\Ñ\Z WA&`Y§ð{†¸b\ã%0”S),üV% ŸW\Î_«ˆ«\ÂP<‚\ïÚ¼\Ä\å—_Ñ”‚\Ð\r–ys‹AÐ¼Æ†Qz\ã\Çe\Êf²\Å\àx\åIÝƒr¤š˜\×ó=8ºR0\Þ\\2\ßaAõúqý[\ßúvS@YÌº`ñ=\ï³\êh\å{J÷q~3f\ÅP\\º¹)/l®\ásM\ãVù¢\à‡~XË®¡\äKl\Â÷¥ú\â#.\Ô~5~E\ÂJÀ£Y‹\0J«F	 \Å	2cŠw\ÇlõoM¡er2\\\Ü|›If5¹|L™·(\é»‘b¦j5©P0QX\æI0)®v^¦§¦–«gIù{\\t\çxP®œ…K¡ «\Ís \r¬ZK:·Þ—%}\éK_Ú¬¶\ë2„\Ð|>„~5¥‰6\æNH}NyÑ†õ÷¥C_ô§hhN)†\Ûã›2,xL(£\Ì<aˆ‹ù\á%t\Ô^\r^nýXC<\èÀö™˜±‡«\áŸyòú”IÜ˜XD“\êG\Ûy\åPCnn<D1(É¿Ž•\ßI~\Öù¾˜”òñ4ù|\Õ4¯\Æ\ÓÜ¤W“Sgmx‚ƒ€P@7+\Ûçº³°\æo®–q\ï}þü\Ïÿ¼•,Ô¸$µJYX\â\Ö4\Äñ^ð*!\" 7\ÊQ\×jzv^e-Xt_\'\äoVõ¯ÿú¯[°G9\Ü\ÃsXd\Ð\'\Ön¥¬Ø¼uL¥x®A@­6¬6\"d‚/­I‘ú\rU\Æ)H¥ \Ö3RŽ’rtJ—B>—\0z×Š\Ñ—)SÝ”\åß”IFÌµR\Ëº2œ\ÆXÕ¼É¢G\á\åðµÎƒ²k\ã\"{Æ‚ž¸jlŒS_	^•…lQ(P\ß{\çŸA«< ð¹w5H\æ\â\Ú\æU+\"VTBñ¿ÿû¿M\ê\0\ì\â]L–\0²&±\\óÜ¯xðJRm\É~eÐ„Œp¸w\Ö:vìœ­¾ô=gMk6pQ\Þ“X“&L}z¹Â©”Td\Õß¼Y\Z„ò™÷1)0\ëjŒ\Z\Å@BE\éY¾”ùýJA¿ù\äú¬<\ïi–_*4/‚NñxN\n’•\æ\n]1¼c@\Ì?B{\æg6¯cñ|J\ë»ƒ‰*\nð$KcCŠ\ÆRL4Mj\ÊÍ²›0ž$cÑ¤b\Ñ,¨ \ZÏºB\Îø ¥\'%\É8yp(\Õójö\âEyI3±3y\Ã3\È\"JR\ãŽÁ\Þ|ó\î\ëSscÁ¤\Ä\0˜Á*Á“\íó¤û²óª…u¥9„a%“ÁÖŒ\n\"°\Ì\É\Ê\Ôk¥ºt€\'Œ\Ú{ˆÏ“/\ËËŠ»F­“ªkõoA¨Y0BŠQ)£‰ò+\æý\Ã?üC»ªh1\ãø©Kg•Y¾Ìd«UŒ†.\ì!„‘\â%[Å‚ú7\ë2\áƒ{Uc”{ò\Ò\ì\Õoü^L„F‘3fBKeÀd)\\ñG2|›þ6øÏ‹\rs7\ÞZm\ë;\î\ÉØ£\Ü\îMñ­\Íy\Ç\ÎÝ ¡W\Ù0Ï‹¦Ê˜\n_„\'3æ½œr„\Öx…G\æ\ZA9÷w\×d¬N&œaTvó ý~ƒhœ|>x\ë†Ü”\0]z<\ê÷d\Ô2\ï:ðŠ3Y\Z\Â\Ìb\ÕE„Wg\ÄC¥L¤®„feRr»\ržl¸Y%\ïŠ«g\êwõ»\äŒ\ßxˆb\Ä:†ñU9(µ ð²\ÌÉ²>–U\ÎbgM+®%ml¾[P\Î\0\r¥$xžà±†\Æ\æ=ôG¯\Ñú.^Þ¸x´\È~\î(xo‚‡\ÙEˆ×„9;#\ëÞ–ð\ï¶\Ûnoóõ;‰˜ºY)¼f.»ü²1VJŠ\×ï¼’—\Ôd\ÕbÂª \Þ\ÃO\É¿\'°<6\Ö\Ùh–Ø®/Ï¯<F/IŠ@lsvþ\æoþff\Ý(\Z=\Ð5{if \Ö\Ì\Â\Û6\Íóƒ,¦]wÝµM@\\½R÷3¯8n^–\"Brö\Ùç´¼>(PƒT\ØøOÿôOv\ì\Ë\ØÀc†F	€U~\å\ä \åð^\î—2ò¾ \Ñ+HÎž!0Ÿy\ë,\Þ\ÇXe”ƒ\"`BE9dóa­ýJ\ÌU\áÃ¼\rh\ÉX{Ü±-U\Ìh¤¶)p%{’,º§uƒ>•þ\é)„¢ h –9m:>Š‹n\Ãõ.lŠB	½GY›‘†6yz\×aµ­qöV5[\àI\æˆN„¿*EG(£8\Ä|Ÿ\ç\í÷\ç)x\ã\Äkž‡G¡ ¡|\èKrB‡7û9V1‘{˜;9ñZ—.ð•‡¢ 5S¶\Ð¨[o\ßÚ°kŒLXg®\Ûg©uKv\îZu:B$“\Ì\ÎÁ\êU$²¹¥\Æ^™›„¹\â\Ê+Z›\â‚0f-\ã9qª&hˆø\Ù:[±tõ|i@ž\ÑH­§\ßSJ‚ãš«eª\ë\ØR»\åú®•òõ¤Kaþ\ìtt\rt\å[-wVý\ÍS\ã!¥</œ*E6.¡g²V ’kö[†\í\ÅW4£\åz,¯¹+5ßµkùú±›nºq\ÜQ˜LV<Škð\0\Æ\Ñ\n»\ìddÁœ8ð€†XxôMÖ”1\ãQ\è\Z\Ë\Ì+º\n\ZoZ,´\Ü2^\ÝyTp+\Ú\ÈGßºp½\Ð/\Âa—†\Ù\Ó\0cb\Ü[„/[)WKg&Èµº\ÍR\Ö\â\É\\	û¢Æº-3A…z\Ï\Þ\ï™\ìµ÷P\Çel©­©r*ð&˜Œ(\\¶k$;V\ëžB\\ÿ–\Ù\á’Sl—¬FdLµ\\¬±;—ö_„v„	<´8\ÆR€´\Ìq¯\ì\Ó\ÎøxF\noúµ%.L-S Ú†¦\×>\ÜHy\Ì-|\Ïw¬&†ahpA(\Ó%„K\n¹Ÿw5\Ù\ÈBaõ\î\Éú\ä£i<®`úò÷lOò$Œq½\r\Ókž5U©\Ù\ë½\'\Z’w\r\Þ\Ä8\ÈW\Í~QP^˜ý\Îõ\ßg€vI\ÖE\Z\Ä\n¡3@–C Žð„7U¨ý…~µ|9š&x…hù\ÌÀax©¸d\ê‚¢S\Í\ä\ïMo|\Ó\ä\Ð\Ãm¥`D\rT«÷ño«\é\î}\æ™g5«™\ìW\r\â#´±\Ö\ÉZ„˜h„\r\ã\ÉÀ*J\Ö7SX)[w²\ÆÂ¶\Ð,¨¥ˆ3h#0GB\nj€;ý\Â-E\â}	”ñ)G	DÛ¸a\ã¬\×÷T¿\äZ\Þ\Ï\ÞVZQ¢ƒ§=ÑªO‹/÷¸÷\Þ{š’»~<a\Öm\Î?ÿ¼6>\Ê7\ê\Çö0_™\'(*\åò[ŸbPÁ{-~\\®TÈ¼(˜º¿Š–\ÐW`\î^‘ò‡Ž2‘‘ƒ…¾\ÙÀX\Æ\ì¯\0}hU´\nQ_ž±œ‚\ä\\¬\ë\Õ4;ÿ\èþ¨#\ÊËq	RKN)\\\n\Ëú\"T¦\ß\'B€³£\r\ã\Ò\å‚5\ï]|…Œ˜Às\Êe{]³„–ðôÓ¿1–\Ô\ÏË/·¿&\×\'\Ð\Êl¬ø³\ìU1Ü›‡ \Ô\×\\suƒƒ\èE±\Í9k?·\Ã\Í…±ñY¤\Óh\"p|° epF\Ï	…\Ôñ~û\í\ß~[›\\ô¥\Ë=ð\È8£(\È0\'Š²¡Á\ë¡w\Õwf`mU2Ghy\Z\ã0.QLÂ³˜‡øA°žLf¦ûE\à\Ècg\î\î}\î¹\ç4ºù,¿\ã¹v þBuo~\Èr”\\ ÿ´©µ\é3óv½­ô\à‘XL8¯ö,‚)mIE\Ø\Zxœ³&\0öo\Ê!\Û h}òYM©b.…\ç¢	[õz}ƒ‡jCŒ\Ä(P¬Á\"ñ\0¯\á=ŠW3c«\ío®–œ‘¦¥Ü„t«1\åu\èLxõ(¨_?\í\ë\r‹§¸\ÎúP¬\Ü,yOD1²W]ü(\Ð=\äS‡4\á7\Ü\Óu\ÚV×©1d‘AU‚”VM} ^\r\×Jž’ò{¿hèž„O¼\è¾\nKgŠw.\í0ñyK\ß3oóCwŠ\í\ZdÂ‚p\ÊlzoÔ£\"ü¢\é-P;¡P\Ú\×O\å2\Ù+¢1Þ¦ 5S„0,\Z\Ë\Â\Ú^Ï¥\r\ï\ÛwÛ›![MAž5„¬þÆ’zƒ’\Ù\ÑXÍ¤“QaY^ó\Ú\×4/D\Ñjö%÷¿ù–›› SLªØ³/}®1Ò\r\ãóB!1Nµh\Z\nT:Ô´v_­ZkÐ¸{ð…rDP³\Î\á~¼¨XŠ\'°?>˜”#}^­¤‹J™ý.\×;çœ³\Ûü³¼6¡²³‘\Ò\àƒl+Œ·”\'pª/\ÅY®~l~2|Nñ\Òþ§*	ƒEAñ\ÂT˜˜¬_²z¼†q§\n€\Â0˜‚{7k:º_¨®\íª}\Ïx‘ \Ê\Ãsº¨…\æ0\ã\ê{5@E ô%„¸øšUª˜½¦\ÖVS.R*³®„Â£\âV³–e ^öpgE\ì\ã5ÀÁh4¾Â€K¶\\\Òj~\Ã\ë\Ü\æí–¬A¹\ß\Ë\Õóf\Ùú\éIð\à`œÚ¼D_6\ß”\ÃJvzYi|@0)3¦3¬&:±<C®CQ³øW«™	Ø…”ŒG’µÁl\×Ìž\rÊ–\Í[”œ\âÀô\î÷oœ1µ¬K\r\ç¥_\×\Ò\Ü \ß#;„:z\ÍÊ™«\à¿k\æ¯ÒŒe§\Ü\æ{Á\ëš0ªÐ‡X“GDG²A@ýZ\\Ï›4oðûd¨ªQ¥8ÿøÿ8*…ä¡Œq¡\Ç\áH¸dVú•>}:¯s\àr³œŸMC\îCY\Óx‰l)ˆMð„\È~k!fT\ØBp¥a\ßÿ¾÷7\Ë\ÎÅ•öµN»\å\Þ33“r\ì¿ÿ\'› ±^“‘IZ¬& Õ“\ä¾\Ùy™\ÕZŒðo‚\Ê2zJ†P€d®jm…Â´ZP7”•\\\Ú\ÒÛ„Ž2À\ê”Ü¸cµ?Q\ßa<XhBh\Îi\æ\Ý{Š\ÑK\î\Ú9W\à–›\Ò\èó\Äý$=Œ¥O\ç\Ú\æ\ÎS2„\ÖÌ†ŒÜ…MaXvSlô\ã³±šCA\æ_«ºk+X\åI Èƒ»¿@~¡¦ESŒÇ½ z‚\é\Z”\×µð­¶1Üœe«›\èyV ×‰g2\ÈI&\ÆJª\æQ„º‚K™¸n\ß\Øe³\ß5Â·\É\îBL\áÀ*û\ß1„\Õ\â\ÆUÀ®¹\æjÖ´z‘\Zt~±X˜!fÈ¿+\ìñ4\á\ÍZD\Ñ|F\Ø\ÕnaüW¿zò\Ô2Ÿ;–¨¤4o\ÄrjQy½\ãŽ:\É\'\Õ\Ýg#\Ó3`\Þþ‹•²•p(¤*Hb#1ƒ\0M­©\Ì\ëª?ô;¬ÁF–r‘J\Ï82®6\â9£CºZì‘¯2\Â@¦:\Ü=y÷s/ô[˜M\×\îh	M\í­\î`½l\r\0j³®Õ‚t7\å+^9`–º+“¥Js¹º\É\Ò)Áø“?ù“f1j\ïZžŽ\æ³.`HÍ¶\ÌkœÝ»óôò²PÇ“Qž­ª¬ZN³Zš³\Þ\Ëdˆxž\Ò\Ø\Å<³¿ÝƒöýŸz\èGYñ#IŒ\Ä{h”\ë>4\Î*|¼á¡€h\Í8}\æ3C-/U; ôM³Ž0¯\ÊJ\nÒ \î4ø†j\áb\ÖBü\Û\\ÀÀld\ê„A1fPÌ·\'¤¥Š§s“g(y\"žCJ\ZJ§\Í\Õ\Ö\áÀ,\Ð2k|m®/Š)³–2h\ÃB\rriµ²\nÄ\×\È\0!5pN_\Ù~s¹\Ëþÿc\æ\Z\0‹]»=z\ïiM\Ô2!e\Ïy\Îsš{\Í\æ£lŒB ´Á©û\è#Du›e\ß+‰\×\",,$TQc#\Ø\ÉNUx¹–ý¾\Ç=»\Ï	B˜ \ro\Â2b|š©õe\Ù\Í\æ\ßxÁjÖµ›\àf]\à\0\á\Ã\\›W‘%C›\ïó\á–\Z¥(°;%ksšÌ¦§û-\Ç}\à½\ÖX$4Î‚a[‡S½CuoE vM\ã#˜ø\Î\Ó\äH¿GCü\Ó\Ö#:²%l\êF½•\ÆÉ€g ®›\åo\ã\æ\á\Üg¯½ön±\ÎB%’$À­Ù™Ö­ýÁu¦l™¥¯50+­$»‘\0;)JÙˆ¿z\Ñ_½Xk[\Ï\ÔD™\ïðÛ¿ýÛ(©ðu=®\ÌAÈ¾\ãy\Ç6ô-]\êŽ=~õ\ÔJy\ëò©f\Ù0¦öÊ­qV\ï\æ¹rfAAAñ\Ë\ÑG¾1wÊŽ@^¡f\×jò£þmnÜ«Š”&\â¼\Z&\ë\ãI!¡¿YD\ÖV-]\Ò\á=¬/UÆ–\Å\ÉZ®¿š\rýÁ\Â^A²Š\Ï\0ƒ–©Š\èk\ÖÜŸw\0w\Ò\ÐOÙ¿]”øD9\ÒÀ\âUx…:¿\å{	\ìj|\03õ\ëadÀ¢5\ãM¾\ÂxY“£>T»©-®u}#[-=ô3Mh)Ê¼\nÊ™\Ê\à]Kª›q…ù.L\r\Ö\Ðd–$™ª”Zû7Ë¨xñw÷w›\Zî·½\ZQ”-T+4o\á¯/L\Ð\Ë[\Èüp\×eóC$\nU-\Ä\ìk\Õj`¿\Ðü\rÇš\ã€gø“Îƒ”Ã¸\n`1Wö;\ÆÂ“W%@0³`‘§«©tÞ“÷ (Î½(‰9P˜\æ¥œ™‡\ÏS“&~ƒdÀ†vBG4c\ÆÂƒ¶x`\ÌÙ²\Úg‹ú\í\Ê5PÏ‚e-=q-ð)\å2Ë¥\ÄÍ—AÍŽ\Êx3\Î8³)WóÈ…`ú­Í½\çŒd¤Ó¼{^³tP§%«\Å7ˆ%Uf0,NmMk\ås\Ì&\èVë®¬y\Í\ê\Ä1šUÆ¼¸1Ìµ¤Ï¢øw2Q\éxgb‚ŸÿùŸo–°Á½\éõX}ð‡•<\éqû<¯QÓ¢ˆ\ng\êB‚\Ø\É\í\"\ïYóó«5u«\Ûd=\í‡@\"04Œ%€b,\Â\Zô\Ý/}\é¤ö^¬mÊ¸@3Lª{¹»¤=\ÅtiZÁS /Eøu\×\Ð]}f­‹`%ƒ&\Å\ÌP|ñ‹\ÇM¯óõ6Ö¬\æS ´ÊºL\í`\Ã×¤IªE¾\èY¡ \à¸\\{/døoŒYH\Í>wc%Kh@¾öµS?û­\á½«K§\ãô¦µ£~\Æ\Âó3À`=ƒ¹€±E«c©j\Ï$\Ý7¦4š›3øú=ó–<0CMSrø&Ö˜¤\Ég±/;û\\\Ë\ä\æg~¦)A,A Xrpsýi¤0¯»z\Ö?²B\ë=\Ìey2\n\ëÁ\Í]‹\åÁVZøƒÿ\íKDe•\Ð.1%¬ FP@\ÆÇ“õò\Þ)S\ï@1j‹‚ˆ>h\æ}­\ïVøj\î}‚v$6¯<\Öm·\Ý:\Â4^\ÂgbÀ\ïÀ\×]·î‚¶hÈ“¹®LA\"øx€þ~ƒgõ`Zb^+§\Æ,\æ@\Æ\Âu(}C*\ËÀr\n‘Ž#R\Õ V2a<¥, \ë2D‡z\Øx\æI¿H8s°\Óö%CJ\éñi\ì\ÖYjº$fx\Ð\ç=\ïy“?û³?›,`dò\Éc\Ãbù·Ïšpå˜’\rüb\Ì,\í\Úý,!Š\"˜\Ì_ø\Â\Å@uK\ÜT¬Æ›ù\\\ì‘L\Z¡yÝ”`¬F.\ï–ZT\ÎOÀ;)e†€õ%œ0î°Ÿ\ä°ñº«uý®k>)„\Ô*k\Æ\n:\n\Ð1\á\È#jV“`¤F©1{1‹\ÑgŸý\í\æ\rüÆ«\ïð\Æ\n’Uƒ\ã3¥0\â@ýss\è§\ë\ã•ï§« òs÷¦ü\ÆFñ\ÄG \Ðr‹»ýiañ”÷\Ü}O£A$35-]c$y0‚Ž‡7m\ëÃŒ¼e¬–\Ë6\ÉH\â‘\Ø\"{\é=yóQ\nb,®Ažð\Z\È\Ò@\åcß”#H‚3–š\Õô9S\É\ì\ïü\Î\ïLh!â¦¾(\î\ãeZh!\ê÷\×4\ê¼\Õ\×d$\äªm%p\ïýc«6\Ì\äÁ\î½÷¾\Ñ*a\æ¯üÊ¯4«\ë7&¦QDUŽ\Z\Ø\æD©\ê\Ï\Â<\ÄvmžbðR\ÙR¹™@µf¾\æz\Û\ÇØŠpñ\Ù·ƒT)­\ÈÞ‹\áx²\Í3õVCe\ëùMa¹ó´\ë$t¾\Ëòº¶1[‹ª«÷\Æ&\ÞhŽ\Ç{%<1\Ã) kŸ\Ôez[\Ýró-»¢9/™Q!d„[~»K‹GÍ¥›Ö·•õÝ‹\ÆVE\ÃÜ1\'jõmFP\É>‘\Ú¬µ\Zúö·\Ú\ïy~\Êúó´¼R²™u\é¡\Z\ëj4\å\ÄOš\éœ\ã;ø	€ö¿õ[¿5Y!\ár‚ÿ³3\ÌX1]÷\êöý®\æUõf¢¬2M$@Y”R\Z|mn\n\â~±\Èp¯\ØÀ=Y&”4\ím\ê®Àj|ž8ñF„£©\0e(‡6.¼.\Z­¥ðR\ê\Ó\Ø\Äˆˆ˜¬\ÙPb¾qÜ§ž2\ï,\Üy¶\Æ`AgvôUXg\Æ\ì\ÚU¨A\èqÖ™g5\ï\á\Þ_þò—š²±¼`R…À}X=ú\Ã0\ç\Åsýµ(1\ÊÒ‘‘d\"ûl”Ø©\ßYÈˆ\ÈD™Û¼±%…Zð+Ê•8FU°û2‰M\ÐC¦\rúÀ»z’\Ä\Ô^o½õ¶&©R\ÏoÌ‡Ìy0kÁ\ä²\èG\ë9\íõ\r\Ðdj\ï¥>=\Ø\çÓ«5B \n‘~Fˆ¢œƒµ‹ %¦	üŸP$Jš^\Î\Ñ\ë—€0‡\Ý\Ôs´\Í+k<$·‰°\à”\à‹\ÒÎ¬¨v\ë9ý\ê{É‚d7a‚O\ÛY[ùG\"gwð\Ò4!\ç“\ÏSF†\"0¢*/•ó\r}\Æû° ®MX’z_\î”\áy]\ÕûØ±f¦\æzc†\æ\î‹?\èŒuñ\Ñ=ñ t¨½²À!Ù·ê©«‚0¬¼‡wma:\ÄX—,¶¤ú\Ï\æu\Ñ\Ò+ƒ\'\ÃZKžú>ul:Ð·\ß¿dôÿð\'.BH›\Ò{	~N_©>\ÞXi9¿B\Â!ž@\ïazV¬½\'ë“¬‘‰¾ø\Å\×,\ÂRN¼\ï¯:\ÛrrH\Ûñ€i©\é=¿§\é*N@1Òœ¤\Å\\ñ˜\Ë=RñY½#…\ÇXA\"¦dwa\Ê:-u\Ê( vso-\ë\nr_®¸\'lýö·¿m¬QËž|\Ê\îþbœ(\É\Ð\âsÃ¸\àº\ÚZ\Åc}ô……\î/.1.^µV;\ßsÏ½3\ÇC\çhh\ÆMúú½Z®\ÂC\Èt\ÖöAi†öS%E˜®‡·	¼{c=\ïa<Œv\íÏ‹O\Z\Ä\" ˜\æ&&\Âz€@0ÐªÇ¢«/®Û\àüx)ùe“½×¼D\ê¯B÷\'\\0hJÒŸ©\ß\Ãab„4L\ÉÙ„ ƒy—`±.”s\ß}?2v\Ù[Žx}|\ã~Y\Æ\ÊA\ÉYÉµ­\\³™”1h\É#:¼†Áa€úû¥´†pcˆ\ë\\|ùðL\Ü\à\ZÒ£¼Pú\ân,D´\Û\\m\ãÖžV’¬+[ŽB;‡V­\ä\n\ê>uqZ\Æ8ö¼¶H7OA¢$øÀ¥»\rf¥xq-\nBn@]ô\Ýx\Îu~\ã7~c²`D˜\ÜH€\ÓZ­µ\ëy¿\âo‚#c!¸¦­¼	¥±0\æ~\î›\ÆRÁð\áH\Åî¼†tþ&pÒ”mó\Íb\å.…c\ÉmVpY\îÚ¾Áe\r]-•›~],#–mŸ\ÆhnÖ…(…$\Â\Ë_þ\ÏM)(:fñŽŽ¶\î¯\é¾b#F‚0>BE©Y¯\íýZN“\Çs%5ŒÁ\Ù¿\Òqb{J9ú>T\æ%\ã‰6ŒB;®\í\Üs[\0œ†\é\Ðb\ì2j\è”\Òóy\n‚¾ø•j\äº\â\Z[œ2ôð*~y†ª¯Ÿ[iuºp¬¥\Ñ6ƒe‘z!ùj„\çÒ¹\îtB¯k}Ÿ\Ý\åÒƒ5Hch¹ß˜ý 43û–Ý‹5`k‚\Å\Ê\Ó\âº\ë°Zi1ƒ ”(™-Š\"¿or‚eóñd}(Ÿ\ë&eZ›9¬¤ „Œ—ñ „\ëù|AÑŠ\à}ô\Ú\Z„\ßTË\ÚÎ¸7¼Ë¥Ëº\È\ì¯¹òHijN¼7¡Šð$•\àñ5\àÕœ\çm7x<¤W’\ì\Æ4?Êž\ãšÍ©ö&\ÜšB\î® L>ü\á}šLŒ\n²)­„¯I€³±\É5ÝƒÒ‘±þ˜ð•h\ÔqJO\ÒfˆQt.\ËB43¾°ø„`,VÜ±s, [¼ª…_¯|Õ«7\×?\Ü\â	\Zž.\î\"\Ñ\Ø\ßÿý\ß(\Èjv…9µ\â”u!D¼\r/\â}DD¨\àü$·ªP\Þ#\nŸ\Ö;«YX–B¤Þ‰—\ãz“\åÊ†\ãHS·º½˜°ð~ó¡}°y\ç™\å\íO>\å\ä™f\Ô`\nz¸\Ë)ö\Êø|‡2¸dÈ²Æ\ÃQŸ\ÈG¿] &LŒ‹÷ƒBrlÂ\å\Û4\Í-l¯Zöd†•\Ôu\Þø‰<\r¹M“k(…W˜×“m\ÞCx!û•“¿bd9\n\åPnDY°O~rÿÉ¿½þ\ßÆŽ\éµ\ì¹\æÆ—\Ã\íÕ¢°\è/û\ç—5÷…Ù²\â(GNG¥4°£•SP¨v6©e\Ø\Ù\Ìu\Þ\Ôukõ\Éú´]„S\ÉN¼”{»¯‰\Z‚e}Mó\ÖeŽâ§³Fún±\Ü2*Œ\Æ! …É‘\0\Æ5T°nh™†÷”®¦9µUŒ‘\ÂEc\âQÒ†\È\Ø?)ÿHF*•”fÀñf¬\\\Ë?ž1H_\ë~±\Þ\Æ	¢:2¸\Ã\Âð\ÐD‚u\æE³yi^ó‡^AjCº$’@^<±@š®õbÀþ4Û•xÇ°º.\ã\Ëó‰½]‹7ZÀPÿ E¯|\å+š»\é½AŠÛ’¯_\Íõ¶n%\ç\ßÒ©i9c\ï‹œE3‚´\Ô@Xj¸½\ÉUA†*\ÞKšEN\ÛM‚EðrXf\ê™ÜƒPþñÿqóP}{\Õyýyó·kóvË˜(5‚³,u1@ƒA\è\ÆZb¦\ï‹I\Ò`W\ÆõDk‚#Ð¦ž\â01	¥\äµrNx\è\ÌK‚”ô\Ê+¯S¦–\íüD\çË­|W#)†Mf\Ï\\s\"x”\Ýc\Æ\Ð~\å\Zzó\Ô\ÙÀV•#\Í-Ta =Kf\Ó!a”‚Vƒ˜\è\ÌP1°¹ñ\â3/y,\äø\\˜\Zc\ï\Úv\×\Ì>n¯g€&_\à–Kÿy$ž \0§vj[\04ˆ¤ý\Ø@­}¤]}m‘´g\Z<P0B\Éb\"kküˆ“@\rÀ4•À„*Õ¬óòþý‘\Î\Æ%\Ðþ\Í\ßü\Íxr0@@ÿ”!\Û?Á¬ÍŒá”ˆõŸÀ¡\ÔZ¥Cy\êž\Ò\Í0™¹(\Ã-·|·aójY)\ì[\ßö\Öv-|ª;õ\Ìû\î{\î~\\bG«0½vW\ä5Yz4’\åJÀ.˜\Îjú<«\ÎÀ‘\É$$\n\Ô\×ô‰\îø\Ö\é\ë\Å\ëÖ”úJ¥C®‡o®Á¦Eo´€YqM	\ë\n+\ÈCC	\nèµ’©x\Ï\rYT\Ê\Åz\ÐÆ¬¸OúZQ)\Ù~Kµ\ì&\Ê\Zg\n\âØ¸V\ÄJgB\ÃÙ† QzW\Õ=\Ëu7¡ b ‰r°^\Æ\È\"Ku\ÌÀhÌ£„i\"–ž²j9Ý–B‚õ\×\æ\í[O?®\Ú(\ÃwÌ™2‚¤¬\æúõµ$„û\à\Çj½\0ž0\åXl?KžRœHE¾\Ò<%\Èh‹~\Ë\Å©ÿ\ëÄ¹1ù7YG%<\ÜÏ¿)!\ÃH\ærl\Ûj[\ÄJx™¦u\äô_ Do|\ã\ÚY\ÙM¤\Â\0¥”c¥,V6\nÅº‚M9Çš\0›°›³\Ô\Ïþó\ÑÒŒ ®\Ì\×Å³¯}\í”6ÊŠHÀfa3G†ŒG²\á%[pûLK¿?\Ä}d‘SR\'\Å\'E œp3+~\î¹\çµû\åT)qˆ”ÀZ¸·œRT¦¥Ž\íA´JÇ–t-Át\Þg\È\\­³t©pø¿€Wó7$\í›6\ÔcŒ\Ä“X,f\Üör\n‚žb\ß\É~]-+¼tM<p-†\Øõý[b\0<ËºLh´Ü˜“a¤y\"Áuð]•÷AP\â¦õ*»\êê«š ‹%¸³\Õž*b$Õ§n&2W<H\ß²	ØŽ\í\ã\Úmf\rRæºˆq\ÕUWŽ°\n¶ \Úb$k.UXûó\ÎKEûŒu\ã\Ý\Ò1sYk¯9™)s\î\ç\ß`£ŒS\ê\È\æ\â»Re°\ßaœøMR\n\ÎHQþ\ìŽisú\Ñ\ÕW_Õ¼Çºu6^É’\Õc\"~ V\æfNµ+¥\ê Løy\ä¬õô1ŒyS¨À\Ê\Z‡T‚×¼.e\Ã3‚.C]€\à\Ùf±¼JÆ• —^]‡’Yð]\0)0&-r²˜•:\Z˜Œ†®¬¶i?ZÉ¥‚&N\È[VyHðü{¿÷{\Í*\×\rM\Ùr›.{„€E\à*	\á\Ñ\ã•\'Qó„©{BxqŽÀ\ç\ë\íz\å \\ £5¸Ÿ‚]~ùe3]A,Á´˜¦?±ª¯)ªnX¹»Y©ÀA‚’\äew/\ÊÀ[°|ypù„)\ë6,\í\ÌK5ÀZrýO¤\Æ\ÛE°kó‹@\ÛÍ™\"\Ö^AdÂ²„\ÌðšÃ¶\ÛMc=W\âœ\Ä3ä·û\Æ\ØA\è¹R×“¬«Q0\ã\ZRé—¶,›\ë,ä¬Žja\ïº\ë\îö\ä§}µ\æJ\ë ”\0Ÿ\àMÁ¸W\àM²S0©\ÌzRQbœl\Ø#\Ívœ\ím,®\Öøô÷¥õ¬O\ÖQú¶¢µœAÌPšg\Ê\ÔÏ›*`\íÂ±,b\Ö\\b@Œ\Ã}¼\æ¦x\×\Ã(FÁ«L›C:\ÂS°Îµsä²¹¡uöI«U\é}ö\Ýgr\Ý\â¹OR»km¨°šQ{¤Aþ<Y\rR\Ê\ì\ëŽÂ¤¥Í\àóÚŒo-ŒqEoq e¢ 5\Íñ\Ã)fÌ’…XLö=Š\Ó\Ëw-\Øj£\ßûž÷Ž«õ<¶@Sj“¿¯¾úšq9žß¼yÓššse’˜\r\êHO\ÒHŒ\'Ô„\ã—~\é—ZZ7[{³9+\ç¦ª¬\0\ïL6G \'&õ\ç3\×W!Œ(„³.Y\ã(‡{¸®1P¨\àd1\rA6g¯q?ú‘¶¬\Èþû\ï\×,A\Ç\à}\è\Ãc—qŒ„—y\"ße“š•©a\ÅxK^\nCÁ†4§ó$ð\æ\ÈÓ¦9¥c`Œ\íj¶\ê=\Ö\"\à\Ë}§V)÷ôZŽ\ßý™óö¨‹CtsL¯z\ÝñV,BAúS\Ê<ðWÒˆ¼Œ1È†\Ù\à¼3\r•\à?ÏŒ„\Ýx}üBÿºû´\ï\á+™r\Ük5b~¶\åÔ²…œ\èNûô\n¬A—y\Õ/§L\Ì6H‚E€¿n¬\Æ\êñ›­‹õŒ¯›&\Å,½1&`gQB$\ï[Œ£ Zhf\Ït„X\Âcfk/x\ØM\Íb™/¸\ÃÁÆ„\Ûx\'ÿ¾©§‹‰\×\Ò@[6¤\ã\å0\Ó\Ó\ïycK)<&S¯\ÃÁ5\Ã~oFÂ˜\ÓnS\æ\íöÛ†f}\0DE‰\0¯Y`\í›J¬µÂ¡ß«½Ò¹.žØ™\ãžó¬[\æ\ÕR)K·pZ\ã†#tG;\Ïy=\0\Ì=ý†k¹|Cöù\ç„04\'o9¾‹ŽŒXÎƒa\ìR\å;³mz\çŽñÒœÒ›\ÂG~»|–\Å@74\ÂŸcúZ¬T¶2š«\Î=/,M~ý\×½1½ž3‚@Zhzá²¾&Ÿz+“\ÌÞ€45VP\Æ\âó,\ÙF\ÚwLSÂœÚ†£ož59\æ\Øc\ZZbÞ’\ë°Ô”\Êo,\Èa\Ü+Ó¡i€\ï\çr\ß3\Î4<\à<¥d\Ø\'Þ«\Ù5*x‡u&£A7<!T„$\'N­U\ë\î\Þ\Æ\äœ\Êl^žþf”Ðœ\Òóz¬2Yð¾1¤ƒ9û7ºQZñ¢`7q¤1U¨•žÇ¼¯4nj¯\\•9¨Vg18ûð…a\É}uk/„ð3Š\ßü\æY30ÐŽü\å´1\Æ\×õ’\ÅÃ…*Üˆo\"\Ù†$»µ–q“\ãwA\r\ã	<o\Ä\Ò#z\ÊDj{\Ð\ì÷{J%€®\Çum\ÝzÇ˜µ2q\Ê#\Ðs”\Í\'ž\é\Ç\ê\Z”\Â|Œ\'-i`|Ó½X(‡gµ¬\é@cM¿S«¹ò:\\3w¿~;r\ßW«ßžÊ˜ðZµš• t\ÙÓ©F^\r\n\Í3`\èK˜s8\ç\äô6oP¢\êyüpš\ã\Æû3\èCðŒ\íL\n\ÃC2zÉ¿yR¼“|pm>ú\ì\Þ%ñÁªƒY5Uƒ\áZ<þ‡Q’4¹ˆ,Ä‹\Ã\å=´y5µ ô€qLâ¾©ƒkf{//1dþø²xuûí·q\ÃXJVaÞ™ó\Ê\"Ô¾{\ÐA\Úl¾§	Ä‚ \Ë°°5\ëab­²Cí¬³Îœ\n\Ê÷\Æ\æ\Â\Ê,²\0Q\ÄF¼÷jû–*˜„D¢”>\ÇW/\'P\'\ä©\è\×N\\_Œú¥K	Á\0%=½\ç³¡V÷\ìV¿´\Ø8\Û÷‡y\Æ\Ð\È^ñn”ÿ¢õ=jû\ì\ÕZ¤*JA)d\ZgðÖ cI™†\ã\Îi\Ê\0JR*FŠ¢\ä87)¥|~\ÏÓ¸\ÆE\ë—\ÎP§„\â\Õý\æ1üÂ—.OôP\åÀ?‡\ÕO7þ³~\ç|\Äy±TbŠ\äzi&\ÞñŒ…EŒÀD¹8Z\×\çÜ·÷s\ÉMR\Âì·¬;B\èP24jö2\Ä\n\Ö=à¼‚Œ\ß!H1“BÅ‚\æ8`½z1¬¶\í&Y\'\ÄR\ÆB ¸1²p\Ï}d?¤1cYK\Ê%^\çS<cby1”ò¥glZý˜kˆ¹b»\àöZÜ—\ÍP\èb\áÁ\Ê:\ì\Z²7\éÜ±Z+kZYoq|N†oµö¡%~7F)CJo­Î“VGŒ\Z¹ÁŸS\'qACÿ¯/\Õ\Çd€\\\Èn¦\ÃbM¿\ã\ï’{Œv²W­SJ\Ù@\åzxÊ¨0XxL\È\Ôó\")\Ã\Ï\á±Õ£ó,­Dh±n\\KG…\ìNº°\Òp9Á§ß³\Ü÷¾E<\ÖÁby\r†\æ¢e´`\×!e·~¾	\Â\â}k73D_(±	¨¿ÖŠ\Íþ0‚$K¥\ì¼\Ê.F–\âº…•d¦m†§£z_\Ö$¡#à¾›\ÞWI\ç¢¯dn>\'9Ù¨z\0@ \ïùù‰Y\êB™9\Ô\0}¥Rt\Ín½õ»Mi\Ñ\\=Ð˜\'\'°”\Ù5y¥ŠúR˜þ<ö\n\Ë	Œn0¼\ÎA<µ	%#Ay•\ÈºCu[q\à¦\ìŠG®«¹\è–Ã†³\Ý94Ã±¥¥ý	vv5J¢\ß¯\ZÞ‹•ú½úA/‡v\è¸Á.\Õ‰¥ŠVRƒ§Ýµã¼’’¸\Ä,ù\×C\Ø\Ý(ýMi5B&=‡(¹\æƒSFb\"¢°µ¸0¤³_ˆ+ƒZñ\0}\ï\Ü\n«(…M÷\Ï\åþ	´e±˜0N\ÂÃ­c€øƒ5§$‹\ÐûùŸqõE›\ÆAaA&!”\ãð\Ãû\ä¢\ÕmS+\\÷ˆ	–\ÄqO¿e8b5³S·\\*w€®¶ñd\Èñò—¿¢-\Ð>\ãÏ˜üÚ¯ýZ{ò\ÄRªVŸ0(­ýzÇ¼N6u-Â =\ZPI\Ê ›¡#¬,þ\Ø>vQû(+ƒ%;‰\'\å]\ïz÷Ô¨\í\Õ~\Ã;7yØ¼iô¬›³š r*¯­£\àAj¹\ZŠ“&\rýö\rtö{t ˆ\é\ÝvÖ½¾nj\å\\RK4ª%©\Âx\ßÔ‚\ÂÜ„»Þ’±\" öN#\\\Ü\"	þ¦\Ý\Ü!\ì˜\à6÷Jó±”\Ç†U\é¦$¿BªŒ£(\äüÁ´\ëš\âE`^¥\ÔFARE\Í#Y–‡p3\Z)Im–q¥B7)\Û\à{s!\Ðð·\Òÿ3\Î<£YTtbq+4L£\ë4œx\ã›\Þ\Ø,Zj\ÏŒ2\Ë\'ö1IR\æ\îC\é(7Ë‹v<Eˆ~\á~aò£?ú£“ŸþéŸžü\Ü\Ïý\Ü\äÙ¿õ\ì¦0Ÿø\Ä\Ç\Ûµ\ß%\Ùw©\Õ1P\èŠV”?­\Ø2aG÷löª}‡¥\ÒhüCw|\âAx¡d0µª\ë+®/i¥*\æs˜\ë’1ð‹!\êwDB5<\åL¸\æARX–<ŒA ZHÖŸQÿ¦™ö\ï\Ü0“ñaµl¾bE|g€J[\Z‘²\Ý{\Ùâ˜º¦d¡0\Ä\Ñ`ñlÆ¥xc3j›ÔŒ“\åR\ÉK˜k–€.e$ˆ\nú±\Æ\ÃS`˜„¡\0	\Ý\Ë{~ƒ \Ì\ßž\æÔ®Ai\àiŒs`f\Z‡²˜X9½ü\ÖXlš\Z`\Þ\Â5\Ò9ñµ¯{mS<\ãI\æ\Ç8³\ëm%R•%\Ú\Ó…02ˆxŽ\',,ê°º`	¯«\í\ëÿøO~ög¶U(0\Z„4|¬-túÈžw\ÜyG£ý>¥\ÖdÅ›ü>Í›ø‹‚d\ÌoÝ·\î,¬F#©dŸƒŒûN\ãX<\"\à“{e„\ï\'x\ï7]¹IÝ¡¹0\ä´7Ž{X\ÑtR¬¦v;ºlúšoX1J“µ\r8ß‚œ\ÌK\Zw\ï»p=\á\ÎzIÎ™KgÃœ›Œ…\É\Ón\×\ë\ÏL¬\ç;€A\â–‰\å&\ì\î\å\ÈnF\é?\ÐJp\ÎCð‚\ä\'RxÂQŒ0Fó(„Û“ugun¼\á\Æö»¶\É\æä¯¶ø4`¥)u\Ö\ZÀß¯{@R\ÊO¹Œ\Ç|ü^\ì\æ}\nAð¬\Çg¯\äE\ÂüD{O‹%÷wm^P4J˜Ó‘g¢_ý\Õ_mûb<\â\'~bòÿ~\æÿMžû\Ü\ç6X„\çu,½‚ð¦i\Øg\å<»<³~A¶ ^³\î†4ö\Ç2&I-•º_Ô­­¬÷¬{\ï\\ƒR×‚Vô\à]\ï\ÚB*²œÃ\ê˜†¼ô\â9\àS\\»\Ã\â-½»s\×X\ç?¯c6R€Ú‹È“\æ³L2aI°<=\ìÂ»ù\æ[š\Ë¢À†Zâž¸È‰W®aÍƒ\àöòò[“W[6¤n\â¸t89vHcS2ÿ–*\Îh\â%\Þl\n\Ïh\Ü\Ü``¥ðž,\Ì\Ç>6t÷ûVd8…=R\äh`Nñv”\Î8À¢¤²Ñ²\Ðe—x»Ç°ðD†nY\Ã\àd°Ö²b\îq\Î\ÙçŒ§f\rÇž-u>\á	;%1n1 ¿Ý‡\Ñçµ½óSO\è}¦?öc?6ù‘ù‘\æYÀð3\Ï<«­ü\×x,ý•Á+FB¥\\WÄ“¡@õm•€2\\\ÉN5E\Ø8\Ûx®\îO¯M\éüÍ˜\É\0‚X\ÇMa\Ë%[\Æ\ïP^…bÖ­\ÝQnÞ¸k\"d!&\êi\Ö\Ó\Û\ï=öê·„!+\Ý\Ù\ìB\ØÀ4\ÚL¸	‰÷£ˆ\×_\Ý\Ø\î&GL\×k³nI˜E\ÃÌ±9ñŽ\ÙRr\ÔQ–>©AJxe\ÙÁ\n7)»\Ñ‹gÜ”N\Ç,Šj~C\É\Ä-\æ\Å}«\ÕM\Þ;F%\'\'¨xJKúâ¸šô X M ”1	ò\Ñ?øoŒq¥Cbú\ÂÁÿ\æb\ÆOa\Ì\Ö\à{\Æ\0ñ¨\æGAŽ9\æ\ØV5MP\Éuúø©Ÿú©¦,\ÏzÖ³\ã•O´9â‡–£”‹°f°*‡ñRÖ¼Yò\É\Òf+´\ÈV\Û\ì>­^£Ö¤\Õ\Ø9\ë\æ1¨<E*¨\ã}Œ3ûLú\Ø\r\ïŒ;äš‚\Ô\í‘þ–\î$4«a]\Ì—£\n\0¨Y\Æ ¢³„‚\Ö–KG\ÔzˆJµlY B S\Ôó(ˆ³ð\Å\àFð+g›ñÔ–Q\éy4\Ê(}\'C”.‹ˆ‰I\0y4ŠH!‚\Ù%Œlð=µyeµ\ÕoŸìŠ¹ñ¼ýÂ•w³]Ó¼\\šÁQs…jøù¢Ç–L+\×7\Ïozšgšª\åA€Xkl\Ì\Æú€RŒa\n4²ÀE[X[\Òd\\¬‚\é„þ\îw½»ñ\É÷\Ðr$t­§ò\ZºUúP`\è\Åõ\Ó\è:ýðÛ¡h1\Ê3@\â•€\Ò\àO\È{ˆ#½ô@¨\ÞF|\ãû½\Ç\åm+Ò¦ \ÑÀ\àhÅW³T„Ç…ª;\"¬)s÷·\ìÁ„ƒyVRT\ÌÙ¾}\ÇL\Ã`u\"+\Å\å\Õrnam \Íb±jV\é)¢\Õö´¸\ÜTŽþŠ…ñ¾û§®	a	vA\n\Æú`\ë{<d,w\ê™ÌgðJqÌµB…Z-»š‚˜\'‹I8eþÀ­\ìP$\Æh\ìñ´kQz,eÏŠ?L\0š ž\"00Y·ah¼RV\â4~CSž$%/\Ï|\æ3\'?ù“?\Ù2aøª0l\Ðx€ÁolBN«§\àº\ÉTea0iþ †Š·OE7²—m\Ó\æ\Ó´í§¹xLF¡s\rûž\È\à$z\nCxÀAi\á•vbaX0m„@úÔ¡#`Nö¥#R\ÈXIÿ¦ YA­J\ç;,*Á$˜‡a©\ç\ïX\ÐJ\çb|¼S>\Ö*DYÂ­K­ø1\ÚX&\Ì\ç]¤úXlŸq»>¿ÿþûÆ±š»ñ\Ï[\'¨\í„\Ò2i¥‡{ˆ;(;\Ï\Í3QN÷0ža#\×\åË®ô¥5Ã˜\ntdœo>9(\Çw)x\Êf¼\É\ï,v@¿uL\ÑV\Z†Æ„ŸÁA¨\á—ù—\Û\Zˆfw²H”b(Y\Ú\ä\Ä\è5•…j y8\n}„?\Ã&±¡öŠg	¿`\Ê\Ä 3*‡~XSZôdpÀrŠ–ñ\×*\n\"C\éXÁ>“õÁ\r‹Õ£‚˜¤\å\0X½.ø-\×\ØùöÛ·\Î}\n\ë‹_\Òº•]\ÂX½k’\à\Í\ï{l%öHõfˆ\ÅB$¯\Ìg\í‰µ[\ê4¸Tñ™\ÌÕ€S7Œ;\Ò\ì\ç\Î\ßmóf±	’÷@9øVqÒ—ZðŒ`™S ¥\ëökC}q\âZZ_\\PBŠs\ÄG\é\Í‹Y`[MA\âa8û7ˆ\å\Ú,»{ÙºÛŸ\ÊUk\âjÓŒdÀj\áa­\ÐM	¿$\0º\Ù\Õ	¢Ù®š^e÷“\Ç0Æ²’\ä \Z]hƒN{ ú}JŽßª·\ÅGŒA§\áµqÈš‰c$U\Ä©N*\á}R\ä>µZÀ|ý†w\n\ßZš\ÌÀ\Ù\ÅW\Û\èN\Ó•}\ßaÍ¹\çù\Þùœ\ßJ\Ê\Ã\àlkL\ßÖ¾›\ÞU‹m5M„¢Qœ\ßPƒr\Äð¼¾”\Ù\Ø0“lCjó€Š‡Á7„òB\Ïj¿[ß”Ž@!\"ºF ¤„¥%\Ë$\Ô{“\å„8°Œ‰\å#)`L+f5oT«\n\Ò /uT<‡9	PY\á´aMª<[\æiŠeE¿f\Õ\ê\áœþMId\ïR¦ù,\nÂ€\å\0!rP\Ï?‘µCw4¨\×\ÄŒ“v?\à€›\'a\ì\Â[¿a\Ð\È0\âz)‡oq\éTéŒ‘\Ç\ã˜¿}&†¦¼x\àWë‹•m‰\àE]¼™‡ŸUØºa[\r/9džA&©\ÖG]:\r\ìX‰+¯º²\átøŽ\Û#\\·v\Ç7S\0!¹\ØTÿö–˜e•Mƒù\Ò\â\ß\Ò\Æ\nÈ\n\Ä=]¯n¸1gp†—\È^û\ìT\Ä<cD(V†GI/.cp]Ö¬n\"\ë×‰–k\Ó9¯Å¦´\"\Z‰û\Ð\Äô\0\á²À•\ã\ëVS:†\Úð;{}Üƒå–½b¬Rþ\ÍjýY\"\ÉVj‹NU)À¥Ÿ\Z\Ç\âb^Qª¥\ï©[ˆE\Êk§u±„$ÁP´i<WÆ\çó;iÿj\èj—IOùA\Öÿxó¿7%¬\Ý]7i^lä„©<8Ÿ‡¿\Ã\é¦_lñü»\îƒ\è³1`‹\ÔZ„Šû;rSÖ g\ÌÃ‡”/\çj\Ô\ãŸs&xyD<ø2Ù„L€@! \ÅÀ/ù+“Z°ù\â\Í\r\ë~ù+_n\no\'œxB³¬´WgúvPƒ÷ß¶6A @ƒ‚º,­\ßùŽ,‹Lù#\\õpG\Û4Á5\ã\Ò\Ýc£<U’¥µhz\æf\Õþ´©…5B€É¸b\Ôê„¾9!N\Ñg]{¨Uµø,\ÑÁ[¥þ\Íwtc\Éw\È\0e¨‹G“A%[©øEg(\ásG~nLû\'JL‘En†+þðžr0Ø_i\ïJò1„\â\Ë\ZG3\"–b\èü#M\ÎXæ”˜\Ôó¥+þ%”,o4\áe$\ÓiZ]û°B{v“H\Ñ\Zˆ¬¾¸®{J‹Œ&\Û\ï£8ù\äSšr°*aN“\Î=\ï\Ü\Éa\Ó@\róM’GwB\èþP@Ê‹øœ¢Ãƒ>Ô¼¢l\"‚\n¼\ÌúE…s[\Z89ôµ6MX\îÁK¿‚”/\"°\×.6jÀÀ•Ò»kQº\Êý\àôú¬­LÝ§?ó\é\æm‡$\ÄýsF­p\Ñ\Ø,°ù~²[Q\0\Ø?Á0\ãC\ØÑ¼e°6,-\ì©b0_ñj¶^§\n\Âo|†¾\ä†óMÈ·\\<³bÜ¼€’\Ü0Š\Ã\\®j\nµ÷{ön<L<YIŸcs\àÁ\Î9\ç\Ü´DÁA³„	H0„+Ë±_ý\ÆüY\àz£¹‘fmµl \âprxú;õX7\Ýtó\È\0ž†»£ùð¦:¨d\Ò\êJ¹jTY#Jˆi\ÌŠw\Éa\\m~‡ó–\Æ\ï·,(Ed5\\\Ï÷XAcFt\ÐÇ¸³n’MP}‘\Þ#}02•5\ã±\Ì?	‹s@«¡x4\Äµø5\×^3z.¸œ\å¼êª«gö¬T\åªó¶iR8/Mµµ:k]b‚\ÛI¹»c2E^r\ÞGv\æp\Î¸*\ã\ì\\t\íV%=}\Ü5dbgdŸ¥„Y1®\áø¶·6\r\Ý|\å+_)\05&÷\Íb\áBŽ8\Ë$&Q\×j\à‰0„…•aUØ²\0µ[a˜)ø%ô´\ÝM\ã“&uM\ÄI7<\nAkŠŸ¼L˜—B(\n\É \"€wi¥“€\r4\Â|Jƒ~\';†xOX\áž’\Ça}ö›*ƒ“ŽXxž\'žµ\Ïðh„œÊ‰U„ƒòFA\Ò\î†\Å~,^ªŽµz\Ð0\Û	r\ì4ea8\ê‰\Ç\Õ\Ô\'Zù^\íQ•\Â\Êx\Ûnñ=\ÝMÀ,|ªB¸\ì²\ËG:+|\ÏB/ñ\n:ð \ÃJÞ°ð‰!-4Ìª<Ya\àxd™4-	®E\Æxt5V\nS“R\Æ\ê>£‚\ä1\èd‚;+\Å4YDIŒ¡\ÔÀ\ï²w¤n\Íõ7o,ƒ\Ïa*Ã­s‘0!a\'ô$›Zr-®P\ÐN€0+BXs\Ìrpf\Ýy\Ç \Åk„üüQM\0X/)¯\Ñ,\ìC·\rAšA#¨µ\Z¿û›%ÄœšU«³Z\Zv\Þ#ÅŒ‰HþO\Â\âž{\ïyL\nR7¹µx\ï\á\í\íY+rSV\ÃrÆƒW½\ÓF©\ß7^\×\Ã$cRN²´-v©Dd\È(-ð\ÈDö‚+\Ð\Íû\Â\×5‚\Ïxþ\âW\n\ã\ß,{\áñ™’€\Õ\éš³\Î9<½i\ÈÀ\àÝ¾õöVC\ç5žv==Å˜!:\Í\"¨·~÷Ö™•\Ù*ì´‘`f5–€ª5\èy\Ç»‰\ÏÒ›ˆµ:\å]\ÔöuœÁR’”9#B\ÅÜˆ\Â\Ñê”„øh’¢Ä¤ù\ê\Þe\×\àeß†\ï\Z/\â\ìn8“Ò‡*%,`\"\ïfÌ©)“‘ÁŒ¢\ä	|\×\Ú\Ìb%!Œ\æ\ã^Q¾\Ôaw\ê\Ü‹‚Tx4Sñ;\Ù5\Óq2\ç>¢#%tŒ	ƒÅôkWh@¸†Xoý¨ \ÉnåµžR›F\éÇ–.&`lø‡§Œ\ï\ï™”i\ÖP\Û(ùw‚ñƒ¿i*\Îpƒ\É9P)µZ\âŸtÁ¡l)yJÂ‰Œ\n’\Ìpp\Ë=sÛ£pI¬nbŸù¾\à<¥?.m\Ø\Æx\ØX \Æ}e½\âX”d\ÅM\Ö\ç¼G\àÜ“¹·bz\Ö>MðW›X#(¸Hø*þL‚ -kX%ó	\äˆA@œ\äô­\Ô\"xŽ.\î‹\à¶\î‘S†¡E¶Øº\Ïj\è2n¬š<þG\Ô\ëSt#x\Æ\ÈÀ¥AƒÏ†s\ì•Âœ?“M\ÊZI”\"ý«j=”˜!GóQ2t\Åÿ7O÷%ø9^-/O;õ´†vð˜P\ãó\ï”\Ïd[.\ÙaÔ’¬q†aLó\ÈFIKœñ\î¦ ˜M\Ó8\à“3B*¼\"\ä¬\\\Ê>®¿\îúVRPñZ70D¿Ü” x±\áCÿ–`A(¡÷ ¨,˜\r<ðhV\Ì\n\ë~û\íß®“ò\çZs\åû”Ï½Ó™/„£Ò–³¤¸kFŠ›NÑ¥\Ï)«“aO=\Ò4\Ì\"0Ir¸Nœª\Þô‰\ê¿[KhXy^ÿ!p]cxz%\È3Ù®Z\î\Ï\æ\ìú2‡ õÀ\ËM\ã¾\r–=gŠˆ\ÏõV\ÙUé’½ðE\r½X½\'ƒ9St\ÝÚ¡$-z&4M\íV\Ê\Ý!\Æ2t6V²\n\íŒ\n‚!Á\ä}ö\"\Â*óc°¬[k,0\Åô\ê hs\ß_\Õ\ï\Ý4{\Ñ=`0¼\ïS,9BJ(§2\ê$¢\É\Þ3Xî’…\Å\âb?ÿù£‘S®\ëƒPð¼ù\Ô\Ó`k5g¶ðò0òõUÁó\n\ãÊ£ yA\Þ$U{\ê\ãó\ÜY+¨	¥9ª@\Ä}¢\É\éD\n¾OK ì«¿{\n9ý{K\Ù;_; Ö‚\ÑÀ§÷¾÷Z¢\Çõy\06ðýÁ[{\èU\n«ó²=\Ø\Ù\å\âQ²§Š\Ø\Æ.\Æ+It£\Ä\Ùsð<\éÐ\ÖÙ\æ‘ÎŒ©” 0>ŸQBÀJœ>\Ð:.-\ß\'<b†º˜¨[³Œ¦\Z \"3\å(\r!Â¨›¡0ñ^\Ïb°„2A,7šKÀ\Óù=p½”\ìg_\È<AHÁ¼CŒ\Z„b Ë„ð^A¶¬r\ï©Ç7\Þ\ÐO]4‹3ö\Ú?\ìÿBA–\Ë\Òõ\ršò7½k\ìQ•\Å\Zþ@|\å1Ïº\ã°%^¦†\Ï-\ãcINðŒ·(\\\ÐB\âŽ–\î\Ç3AŠ}-\Æ\Ä+1ŠQŸ\ÑN­¹L5ú¨ VKgñ¾l‚€šT2U& jWºG\é7ÀH6Ç‡ À\n³\0Y0°ƒQV\áSƒ\ä»0ÿóž÷¼&\ä™bH\ÍQ\àZ\ÄFa=«\à› ‹‚\è©×©;Ðªig\è}\â\ã\ã8k\Ñ\Z«vðÁ‡´q»W¾§O“¥\0<+g\Ñ,\n\ÂhÛ³\Ò9#·÷¨i\á\Ú-¿?”(F\\\Â\ë-õ\Î]?\î&Œ‚1²d~Œ˜+¾Œ‚dA\Ï\ïMz #<ƒœ\ÅjÐ‹PP˜’\â¿ø…qf\ØRœª^J‡·1\Æ9a-F’²P¢q¡0–P\ÝGKº}iñŒ\"øB\ì@s¹ÁJ `=s\Ðó‚u4k #•Ul\Âúº×¾®e›rN5ocH¢ý,¯ E—ŒD\à(—n\Ùó.#\ÞÅ­V·_ÿFŒlE­\Ì\Æ8©>\Ï\î¿ÿ{m|\â¯\å\Îg|´\ë\Ä\Þø†™®Qtµ\\©£\å\ã¥ \ãžÿ‡Þ­V+%)óVÜ!\rC\ë\Ä}Œ4w|<\è\àƒ\Z—\ÊÛ—\àH©ˆ5\ÈÀ¯¬U\à‘\Æ*¡lRûÇŸp|\ã+\ãCŽjGM• W$òšždd\r<k±ü\Ö{3»öj–\Æ@­°\Ç\Â\çx,\î®ï˜	\Z9.¾\ì\Z:\n–h9\âÒ¶,VVR˜š“\Ñ\ÐI\ÃgC®ýšrzVâŠœ’3\Ï9\ç\ìö\Ö(+\ê9%*‡I\ç5ý¶We\Î9C¢ K…¨{úÏ›¯td\Ò\Í\Í\Û\Þ3tºL1\áÿ\Å	Ró¶Z¯\Ôo¸BA\n•\rumqÝº1\Âòdr\Äû¨›ð8iªM˜Á\\Ê¡27\r%³\Æh\ÅPV¿§({\íõ\ß\r\"‘YTÆ\ÜE\ÐZK£(˜\ÇPR>\×9h\n\Ýðz¬\æ\rK\ÍK¿ž{\ç;\ß1\æÁ	<\èÆµoV2I½¦\Å%·K\Û\Ó\ç—÷\0)(#,ø’—üÝ¨h„D­UZö  \Å\"øp(+ž\æ\Ç¤n\â\çiŒ‰%A¼dF(«1eû¦¿\Íx\×,§\Ä\Âkª}\Í×¼\\¬ðx(¥\ç³_<•Ù¦<\ï\\\Ãÿ«\Çr-N{¯y`xt}I\Û\Ð\á|Éƒ§|9®\Å\Ç{L\Ë\Æ+\Ô\î\íþ\Æ+†1;)žñb\Ô>«\È(Ÿz\êim]Œ\Â\È0®¼\nå“’f\ì)O²V\ä”\ì$“%›!\ÅX6¹\éÆ›Z&)\r³jx‘–û\ÆQ˜g?û\Ù\ÍB÷›…¤\Îs\í@ñ69·šk…)	¼\Ô.%IÁ\"\ï3\Zp&\Çz§ô@©Iš2ô ¿O9\åk\Í\"§#kA)™ó|‚m\×A(%ó”\nD\Ë\æ/c¡<¬Wª¸iL\Ú\ÓV4G\Õ\ÕF\ÆBaê†´”3IW•\ÄsŒ$oŒG„•e\Ç?/y\Z(\Ìñd0-Jd#\Æ;¨\Ã5rþe¥k}ñ‹Ççµ_ñyK:÷eSY\Ä\Ë\ÈxÎ£I\Ë[†\Õo\Æ…‰A\â†j°ê‚˜\'˜6Q\ß#Äªm\r®–¢xš$,À\à\êO$H6\Ä (he\ß@2cˆZÇ–\Å\Ê\Íý>1¬SP\ni!‘\Â\åŠY‡\Øb\Ø\ÚúU\Ýx\Ã\Ød\0A¸M.™õ`YøÒ—¼´)O†\Ì3Á}\Ö*(²§\n\æó®\éØ’n\ëI\Z-ÿ œƒþh\àYþ\Ý6\Ä]uu\ãC	tP\Ê\éb|ÿ1\ÞaSú‘®+<9\Þ1v©#Œ°óü$\ào´„TÒŒšl¶v@‹\Æ/c3Ÿ\á5ù&‹3\nB»\Ý888š…yž¬;kfb„”ö‚\0µQ¿\Ý${\Í\ï¸ck›!\ÌY„ÉŠfY	\Û3s¤˜Á\Ó H\è|\ßû\ß\×\âŠGYeÁ²©>.{\é0\Ç\Û÷\\«\Ö¥É²gðjövÀ\Éð¬\äw^w\ãeÑŽ\Û6PhO·L)(-‘ 0÷wßº\Ë\ïÉ¦ ý\î\Ê\ìù` ²Ï¾n\îE\Í\Ü\Ñd\â\ÅA\ìœ\Í\"F\ìû8\ËJ2\Æ\Ùj£Íƒ¤<BñZd\Ù\ç\Æ\ç¼Í¨ .\Â\â\Ò\ÎZ¨\èGpw•%|V\ÜÂ\Ò\Þ\à¸420˜t/\Åxtˆ\È\ÞŸ\Ñf\Þ\Â:¥\â\Ò\Ä54Ÿ ¨²o{ûp\êh6\ÐÀ‡\ÖRRÅ›U\Úd¦`úþPž~Á«ß™G¡À0žª~VûK\r\Ö\í¡{\êÁ\èV«fÒŒ?}ŠŸŒ\n²Ü‚£µtœLû\Ù~nµ#KŒ`vò>\ßù\rt“½\æ<L¼\èšbSŽ\îO-9M$¤¨Žb¡µÚ™\Æ,µA\ç‡.fP°pºP\ëp`¶*fB˜`›Ð²Ê”®–GgB\îe5”UpM‹9i\Zœz*†\å\Î1\\”„²Rº¤\í\ê¢¼š\Ä@ÿ\Ìy|ýöØ¤TYœôh\ê?G`^Ðœ÷t,\à\Þb\Ä,T¥&,s™\×l\î\É\0¯ú‡9¥:ûòž>9”trŒ/ÁO\å¹°VV«ŒAbž†r0\Î\ÉB1<\â\n\Þ\ÔN\×\Æz?²K†²H˜#\Ä|2)÷qW„\Ú\ç9\Â\ÙJ8k|C`)\Z·G	|\Ï:YðAa\ZHE\à¥ð(\Ø\"õ=…Uuº\ß\Ù}	+‹\ÏMg§X;R`q¡§OOŽ\ÏÉ®eóýÆžþÂµ\ê5ý¿x.PlOikµù±¡¤>+»óN®7ö\'Ûƒ\'fõ¡r±\Ò\éXóª¤ñ%\è$±k\è(\r\ìú’>9ü&e;J…$|Ð™€R5uÎ°û\r$\Â×®>MAz’\í.\ä\æ9-”r€²ÕºQ(\å ôv¦7VoU²s‘‡r}+ò¼\Âp°Ê–±×’8‡\æ\×}\È96›dQ\Ü3Á\Þj}£–\Û\'‘½ýÁ6õd\\Ž\Ù\Ó\n\Â\âñ\"u7\æS\éa\Ìd.\ÉV…¿sSöùg)xy†“¡®u{wÞ¹­¥|\ÑQ¬X+8x1Gv«úœÔ ƒ¸ƒwƒ&wg„f\çÜŠ\ìÎ¹\ä\Ù){EKÝ º7¿œ{M\ê´öÜ­\\v€ƒD„\ÎÉ·,Âÿ\r”¢õQ‚lŠò7HB\É`Y–…\Ò=–\ÝvUQús„\ØZ\nËµ§¡ZS™—z^øS\íaNY´\ÃÏµ´Dš\×0DFRŠ\ÞZW­ÿ1\Ö\ßBqvI\Î(dô¡\"ª\ßõ\ÊyH¦ò¸\Å \Z¢UeN5\ÝZ\à\Ù\Å)MNe\í	K\ÝÄƒ±\×]w\íXº-ð¦lQ¢j)¸;ƒ°·õŽ¡§.oC\àY€\Ôþ‹]”›\Ô\ëd\ëz(–t‹@a\Ò	\ä\Ñ0®\ß:Û¯{¤+øjÇŸ=\ÒzPÌ­§\Ú#«\Õd\'\ÎV36µš<|‘y\Ëff7\"žn0˜‚¤ ´Vƒ@\ä—\\“-r^“1d¿*tDºQ\ï\â\ÙIg06O	Xˆõ\Â«ža\"¿ýý6X–v~Ù„›o¹y·•V\×÷S<!sµÿþûMa\ÓI\Í¦-W*˜2ñlÑ­õ<¬„ûðD&\Ü\ÂòH!Vm?TãŒ=1Z \èž¸ZÒ¡z§š’/°9Ø¾\Ï,®Ä›þ\Ð&›%^?d]›N„—\âðN\ì\ê;)’qŸ\Ü\×VSº‹Ž§HYy[ŸÂ«T\ÏJ¯\n¨i_]A\ÇdJz)ñ{1\é\ìW³E\àÁ;\É(XI‡Iý›‚ b´4a;½²\ç¼V\ìRÀ´+mXd3Æª$k…B•ˆIW\Éø5\Î6¶\Õz?šDO\n9Y—\'sJw¥l#šF\éY\ìu-e-u\ë)\ë)ý\ï;)\\›ô‡+\åw\ä†L1F„r\Õ\æxdŠÑ–>\ÎFªQAj\Ó0‚-Kx/\Ûc	°•o\Z–\Ã\r³ eÒ‚x1\ÊK8¯®}\Ô\ãÀ@6Kñp¤l–\ßZw\äMŠ\è3A|ºµG9ü\r’ù\\\æ\âÀh¯”$~¼Ÿq.\'hµ\\»?oo¦¯î®3\í7k·=¥ ‹\Ê\nÒ—j¬–:}2\Å µ·ÁZ\çR\ÑG=ÿ0‹gÈ©\Øº$j\ê¸6¤\æö\Ù\ç\Ã\r&ƒò\ÉxfAœ|“)qJ\Ïß…z!\n ;DY\î¿\ïþ±D~´ƒ+\í\ê›\0\íZ\nl?ý\éÏ´v\Þ\ÖÎŒ—!¬ò°øb5ü¬2¡\Ë~òÀ\'J”,U\Ö:R6-;& ~Y·î‚¦l9&Àod\"\àÈ¤~	\Â	Ì²\"\ïsŠ\è\ß\Ìy§·ö‡\Ò\Ä\î©\Ú\å€\Ê4¨q[ÿ|2g²ö\äøñ’$\ì\á&;}S\n¯¾\Ës¤…=\ím$\ËE6Ÿ³¥zTxFËžs\Øn\Ë\Å[\Æó<,\ì\Õ\rUqy´ür\n&\Ó\Ð\ãFA=AX,8E™.kŸZ*“$0`m¶q.¶™Ü¸¡µe1\ÄB„§³e\"hÆš\ã\Äd\ã,.Q÷•#W\È\Èû}®\ë–\ÅÌ¾\Ì;‹Œ{ú‘F|2<	\Ò\ç)\È<\ØñÃ¬ x\"Q\Ãs@%^ú‡\Í$Z¶\ïh†—<ü	\Íø®»`\ÝŒ\æU(‡{\Îd±jºQŽ\Ø\ßW\àú®d›R_»\í\ÉX	–eh2P[ð§q2\Å!\Ø4™\ÉS\ÚÌ’\ç¼	—­¼&\î\ÝQ 0\Êj\é_¼\àM­|Öh^\Óf”¶0dL”$G¾QróbM(…2¯V£õÀƒ»)\È\ãi\ÉÑ†\ç\Ó38e;ó\Î\'¯ñ\ÒS->y4\Ê\æ!\áCŽrl­¬G:¤#Ä¸’µ\Z§^ýwšœ¨\ê¨\ç\æZMA– ¾\Ï\Ò;¡©`ddk\ï³ióhi½²þ¼Ž\ï÷M&\Ö2¤K)œÏ¬mP8\Ý)\â©|·J9	E±z\n—úºnj©]pn¯½÷jØ±65\Îký~V\Ú\Ï;\ï\ÜvoñJN=ò7£°Ï¾û4ƒ\Ðz\×.fAžˆò÷\Öy6\î\æAzI¹ÎžŒžŒ^¥î•—ý#Ü tSBC\ïC\r\ä—1c§*÷&€\ï\Õ\ê\éÑƒ úa‡\Ö,)§Eê³Ÿ=¼y‹Ð‚Gð{\í´G@y‰6\ç@’\ÚÃ•»&\ÌHK\ÓU¢®V\æˆhOV=\ç\æÕ¶–žL\ï/\à\é{i5Z»¯/ñÊ¦\Ò‹¢ó&¬uv°Nvôûµ\Ä\Ý\Î”¯À}¤\ë	R\ÕK\Ôû&–«}dŸ\ì\Êñhhš\ã6¼¢›u5Æ­¯ ö\Äwr	=\à³q=—†q†T¬€lóvn.pO\ê›ÀL\"4<‡÷`z7QO/¨&tY,s1ƒ#¬¾/¦\ÈF©V¢qß½Í¢[‰§µÜœ™§\àªf\Z(‘In\Þ|q»N\Î,¯g\\\çt \ã0)¹o}û[3gE\Ì\î\rYj&q\ÖWª‡I\Ö,5\æa\Ð\Ç[PX9«Â\ËÁ¨x\'ó\ZI­ªx¤°µÆ„Y³\ÊŒ?ô«^D*˜,Õ¾CIª¡hV\Î%}r \Ðn1\Å`\Åp]h\ï_qÅ°Š«]’¤,=|/=\Æ\Õ\Õú–«¯¹ºA6ðŠ¦\'ƒÅ\Õ33JD°-\0º¶iÆƒ¤ü\âÑŒ™‚\ä;õX°x•x¿£˜mŸûbcmr†H(\ÝÆŸH\á]­-5\áß±ó)g\Ìó\Æ}\Í\ÛJ‰‰þ”\n\áeG\è”\ÏG¦¤û\É%\Ä\Â@2€\é}œ\ë3\Þ\Ù8—>Y}*z`È¤XÈ\ÑÁŸ´|$@R`bAqÅ¿V¿½OK}F\Èò¸çž»[:\Í5ü†\à\ÑRl\Ë\î½:ñô„õ=«ž”j\éŒÁõc	\n=A¶\ìg®GY7\áß°q\\\\L\é<¥°µ\Éu:2!Ÿ\èÂƒô½Ÿ*JR·\Ìüe—Yª­™ò\í%j‚…¼\ÈV‚W©³ŠaÎ˜È€õ8²\Û7Ÿ=ˆu‹k¯¹¶i«\Ìq7´@\Â\æ,º…™dZÀ¬w¼ý\í\í\\l‚(\è®\'ƒn\×\ãü4\ÊÑ¼®™\ÊÕš÷\ç\î®2A«šžª\Þý\Ô\îeL,Cê·†>W[\Æ3µ[¼rÁ‹v›`‚¡\r\Ð\î=dXð_»º<‘«Ì©š®)Ê§ª‚,\ç!\æm\Ó]\îYW\ÉÑq\ÇCÉ¥¬m\àkÎˆgT\ÃxEF\Édz1\ÌkB¾@xe˜d±xU¶\Ù\Ûšrð‰@\æ\Ç\â[ižL•\ïd\Ø\ï(\å\È’\à˜\ïy\æ»u\ÂHpJÐ•˜˜º¡Pq8ü\Ñß‚l^(‡\Ù+\ÑXjN½©)\"o•V@9-7¬k\ßx˜<\n8õ‰LI0¡–»ÿ_´ùy¢ \Örk%Å™\çEd\'Á\ï¬Ó¥ñ6Y`É©\åƒ\Ú\×\ÌNdž\áL‹ª~‹pS\ë\èœ\ÄÓº\r~ü\ã\rZ\É\êd\ÏH“Á²\Ü\Ö>‚0¿\ã\ï˜|\ïûCð~Û­·µ`8p\Å5PC¸ûNUx	A8Á7\è\î’Nˆ œÆµ­‡(]\Ä\âe¬­ð.õ\Ø_\ßa%(O”A\×ð÷p$´¿}Q\Ø\Ó\Ý×²š^\Î;>â©ª )SbXr^Ô“‘¨\Õ\ÕËµ=­©oq#/Tð\È	ÁiªÍ˜:Ó²nÒ‚x,\n\'\êû}²‚\ï\Â\à	Av1\î*\ÅsÍºz?\0d‘I\"\Äp\è“R‰/º°A¤h%·\Æz¾Á˜o`•³\Ï\ÚH€PwÜ‡\àð	ºm¢Ÿ\ä\×\r¬BmD½—Øƒ‚·\r6õ\ì	\×L{LJ\âo^\Î\Ê{\Íf<QzdÄŽ;&OµG\ß9$rZ\ã9D\Â8ú›Q”0’\Ý\ÃÿmwmO­ü›|f·«¾\ã††}®aÍŽ@8d&JKdV\Ù|\n\ç\í?i\n\â\Ö3\Ò‡ Uwo,kPµKˆy^°¦¥,˜\çfˆqô\Ñ_K?²’I\ê&¥VcsÓ\r¥x/-8	5w	¦\å@Ð‰·K1>yÀ\'\'ŸþÔ§Ç²¿\ãqB 4GN‹\'²I‹2e?@múd/\ÉøAy\Ô\ØÊ²Bx!>Ydý\É4#.`¬ðŽ¥\Ê_ \0ð\ZJÀ;²š,ª\ï&–\ÚB\rP:‡>eÿH\ê³MH)k*\Ë%\r:¸\Â\Õ$X¬U­\Ä\\ÌA1[o\rBªW&+\Ø\Ï \àºü\Û\ïY1IV\äGÝµsfG_¼¬‚\ÜvN]\rA‡K”\Ò3N‚N¹£¼\â\"Vz÷\"*hGi[¬²iö°zd\Û\é\ß8½UœtÒ‰O™\Õ\ê´õ²”\"Žcû\ÂŽ\r§•lñ\08Ÿ‘Á^¼ƒV\Þý\ß\ïnºb	?ü\'\ä&^8µ}>\Çs\×\"wiŠ\á{\îONñ¾9v[I§~=\Ù\éU÷g^	ž\ï\ÐF–<\ÙAu\Ê\Ûi÷k_óÚ±½kp&BI@µlH™\ÙÔ²k)w\rŠ\å\Üöt´\Ð\'\Ë^ùªW6\åq_JÁ«\Ô…\'\ã¼\ï>	\Ðy¤z\ÒT~\èÖšdó¬Vü\æúËKþ\Ã^õX•„l\á1^ªA{±n²ŠC3òó\Æs=¤\æ)‡0€a–\'\Ã¤f%f	De\ë\é\Æi\ÙT[òZCÂˆ•¼ø®û\Ë+\ì\Éi©À\Û\Í¼&\à3iQi\Ù\ì´\ã\îhf-ú\â\Î\Ã5\à\Ä`ÁŠ»£Á&\æ\Ôs\ØM\È½GA”Â¤SÞ©\Ø\Ô\Äz…H\ëRVÈ¿¹ì”­$¦\éÏ®8û\ìsZ*›\"‚Ž\Ëu\ÛxZI[i	~C1V\rn\ÄSƒFN$b\ì=²xöª\ê¦H\×^{\Ý\Ì*xjPOVð9eDb\ÚmÎƒyß–‰¹\ÖÀÊ…z“¾\Ô:‚K¹;7V“\Å#xH\ÈY\ã\\$\ìšZ€úÀŸ‚¤E¿Bš\0\å\éÒŠ\Ó5X\ï	ªL\Ú\Ùx®c¢R\Ói\èc\Óx±R\Ê|¯ß™XWÛ³nb|CAÛ3\Ð\ïi/²g‚ôü-H\Ñslô\æ\Åð¬=\å€VG‚H¼G\Z\Öjš\é’ô\ÉöYˆˆ$³\ä3‰!2Á¨RŽµòq¡Zñþ$\Ôh\ìW^\Ñ,7W%\æH{QB\Ë\r\Ê8À0¼\0*„\È)¨‘…æ…’\æ\í¸hø\Ñ_8zr\ÄçŽ˜*\È]£\Åq“OðDWN\Ç\ã: X	ELÏ¶}\Æ\ÇÛ‚±Z¿~\Ãú1\rE‰±\Þ#VB\È,\Ü=­{&Ha\Ðö¡T„\Ì§¯›\\6`Pß™3ø™=>\ìýö\ßo²nj¼Ä¤Õ˜×†/kÍ2’ä€‚È°B4\î\ÅkQŽ\Ú\Ïw98±–k\ÍY·¥\Ò87¦\ápz\àIq‰þ\ró³ð\ÉsR¦õ\rÓš‰\ÏÇ–š“\Ù\n\Ì\í;†\rDGù¹l\Õzk\â\Â\ÎMr›8VŸ+\Îa9 š\ï\å|‰lŠ\ê÷\äuð*C#õ7ôu½tj\å\îŸIO®¥\ÑÀÓ\ÕÓ¼u‘¯¥ca>IÂ¤Êšg!_\Ç{L‹c£ýõ\êb³ß‘‰l\Ñ\à©ô1y©OÖ¬ +•\äÆ‚0EöJ\Æ!usJ\Ãe\Ê\\Áû\ÉR\åF¤\á\ÌM[Œ\"X¯AðŒû\åÁ4©Zp\ÂNøo±¥Y®X\à\ïû:\Âg\ÃBƒ<\Ì\Þ{\íÝ”2­JkQcþN#Æ‹ø,Y\Ú÷iÙ³4–¥$\Ð\nYs°«²!HaÿO\î\ßøH¾j \å”€Ll\ÙrI3\è/þÛ¿m\ÔûEß¹f-ü\\Xiñª?Z\Ã\é\Ú\Ä9Gôš\0¸¥\à¯ˆ™ =yoA°];xô\nŠ¥­K&!Þ‘\ÍHý¥\0‡d#\Ö	S„a\Å¼¸G¡­š&«1¯\ê7›µx)ó¡¤õ8‚§\ãñƒ^Z²£\ÖÚ†Ó¿6\Çc_{\í5\ã\"ôJ|\àaÀp\n\"“\Ö]“r$ó•Mgk-\çYXið\Õ\Ý\Z\Çd\Ã\Ã`¤U	Aü\ß|`L§Õ…¡¬bô‘G9S\×j*‹Fi ¢\ÈHY‹Ig÷¦lÆ¥E\ÐG|n„Y¤ ®\å;\Ë)HK	^<\ì=‘Á‚YYœÚ½þ©Võƒ½ žŸpK\ÐG\ã\ß<9MlU\æ=jI\èF“–)F\â˜ÄµIAúš®N£·ZµK)B`ù©©E\ï/H\Õ¯>\ä\à™Se{˜%Ð¢HY[\Éû„¤#\è”\Ô“|6\â²>\é²\Èðº\Ëó2)GYIA’\î\å}”\Ñ\'Mº÷i/òøyK—_~Y3NŠQ\ÓuF¢Ef±®U¬$\Ð\â`DZ_ÿk)‰—“tI¶v­\Ó+*HM©™€›\ÖbCƒ1(B:M\\\Ð€%NPœ²c\Z\ÞC¹x,Þ…2\"N­¾$¼2ù\È#\Z-}úË !…\è\ËfI ¬¦ YQOmˆ.ú¾õ±\Ù\ÙSlŸ\Æ„‚\ì\ZÚ‰\â\Ù`õñýÅ’Œk¿y¹\ä!\Ë)N(‡J\é\Ôo\Õ\æ€k\å\å\ÂjY‡À ‚¦_n\Ùñ7HALŽ\Å\Î\ÑUý¢P“»\Î\Ì\à\êq\Â9F\Ø÷-B\Ö}\ëÙŸ\â:“‚Ôš+\Ê\àý4q0.k6\â\nP#+·u?û¦E%¶7”K7ùœXõd;§\ã\Éò€r|·u4(`K\nŠ÷Õ¶}\Ý”\ã7ô\áZ:\ã€h}ƒò~w\âcŽA28\éOû9|2H\é¨m§_rO:¿\ÂJ8‘å¯‹=uUNLûžmw.•žó(<+/\Ë³<\éZ\Â\ê(•\ÌSb¯9·¦v«‚ôû\Ùý[\à\Ï\n¹Ÿ+–\ë\ÏQú±\ç \ÉnP†‰Œ‰E¤d\ë	fy\Ä#\ä)\È\ËÀ}(\ÆúAYú­\æ±b«\ân‚-[we±\Î,µ\0šK£Å½±Æ²Ž\éS†Šf[ó\è1Õ˜Ÿ·ITt]dYÂ½“/\'\È^)Ž€}\ØM¸¡	º”/‹B‰\ê¶\Ü4‚ð;\ç&~±j\ëwâœ¬´\ïé–£O?–d,\Ûx\Â\ÈII\é\ßwß½»\Å}ñ\â±9	ŸÀ*©bõZ\Òõ\ê«1\ÜD\0E\0³¹\ÝCI‡\à\\\â9\ÏyN›`…hUAr´š\ïJ\ß\Õ.¾œ\è”Ÿ=>¼˜û–ðž\0\Zœ\ãM(HÒ´\ÉB\Ù\é\È\\{\íu\í;JTfóL”\"J›\Â\ÅZÀ(\È\çr²F$\íûôc\Ïf±x\Þÿx}Bž#\Ã\çyœ\ìRµ|@žr¦\ÅjK\Ú,Wtº\Ç\Ä\ß(–µž‘*\å`ög=\ëY-£•\Ï¸À¥ò\ãKZ\æ	Æ¬\Ûs<[CQ\Ö\ÂmR€L’€J\é\Å\Å\Ò7ˆ´X:’s´A*+¨I\íZ\ÝG¸ZR²\î\Âu\ã\ÚLž\ë\Ö-\Å)æ•’\ê´²o?.ÿ\éÇžS4e\éƒ\Z\Ð=k`ýŠ·…\ä@+rm$øf\ÔÀ}U”L\Û^\Å,V29”£6nð€õ_õ\êWµ5u4vü\Õõ‹”«§P•HUo6Nõ»\nS¹&ø\àÿ\ì\Ýö\Û\Ä;)Slòýo~ó¬¦<<J¡^úÒ—4\Âg‰Ò’\Z“dWb<—¿\Ý_ø5À\ÃMm.O\Ç!{VAq\Ú\Ï\â)¯Ÿ\æóòlÉ¨™Oò™}\ÄvpHeO4¿XQAò¤¥\ÖöBµE<¢E\çI(HöøFûA²(A#€&S{\ÕlkC\n\Òý.k\Æ@À•¶ðQ8\ÊA˜7–.Š\êq@-\Þ\Ê\" <J‰¬\âIºto2Y¥*NŽ~ \Ô\î‘ÙžFOð“\Ñ\Â?Ò®‰1”B¦4;U\çeU«RU\á¿ÿþïµ¤Mê®´\ÉMõ\ÇÍƒÔ¼¿E˜\îƒS«\\»ûS‚÷g?û\Ù\Í\ÃL1I*&s|ë™»q)ƒÄªƒQ5•œ¿ý\Öz‡	ú˜$®˜\á¬y$> (;1…÷À+\n!fJaJ\ãn)\ãjªW\ç”\Ú\î41“5«ñM\ÙJÀ>\Óül\Ç\Îš ~µ\Æ\Þó\Z\Â\ÍC%;v,e.\Ó\Z*\Ç¬$\Ø}‹Ñ¤Š¥ù%nx!Æ±?)\êqó qk4TÆª?\è\Å\Z\È3ŸùÌ¶jI\Ø\à?‚˜ß²¸—^vi‹ƒ›gmc\Z¥³8$ˆO®U÷\\K\Ð\Î}\"F\ZU\×ýñ\0,½¡¬kø\\Y~š7À»¾\ë\ï\êAú–¥Q>\Ï\ÜSFM\é\ã\æS\Âý\Ã\âAfÎž\ï\Zÿ\Þ>S–^k ¼¢¨\n\n\á­¯(£¸\Ú\"Þ¼®&®Á0[\\”Ä±\'(›ø7ˆ\ÕW;\æ]©\Ï+­ö\Ü\ç>·Yh\Â\ÍE‚ZI±\Z%õJA”¬K	÷\í\×È‡§\âm·-mn!øî£´$Õ¹v¦\"W¤,\nú7\Ëo-dC¸¼\àM\Ø\Ól.×˜§ ñ(6e™\Ó!Ÿ:¤}Ïœ•\Ã\×s(~˜R³ó\ÎqŒL¨\Ð%°<-yp£\ãF\ÒR]ÀJð¤ùZZõ‡y¸\Ä \î€N@\êÚ¤\áq\Ëb\ÕZ,A.\ï\ÍRõ\äZƒ#|a° \r<™®(„>5úi\ÑC€³\ï¼\Ö}ù<[s	jZ\Û{lùXKñwR¼K\n²i\ì‘%a™`RŠ‹¼Jz€\Õþ¼}ùIRÂ®ŸöA\Ö_(‹\ìšs%\êþýF©‹w<£(*r/iW›ˆ‡®‚ñ}?²oƒE¾_3¦«\ÝWy•\ÖB@~ò—þf›‚ônNP]O ªŸ³ÎŽˆN\ëNÿ+ D2Sµ“ˆ÷s˜{+\ë\ÞuDe	B¿uaP\r\ãó\\¿n\Ø\ÏBHf/‹-¸\æÀ\Âdñ°*HU’t<IrA°¦y¦c\ên\Ì¦¤*ait	ý¡t2‚Œ´\âq\ZF\Ø\ãAV\Ê>õ\Ç\Ôy¤?¹°\ß9f\íqSž<ƒB¾ºc0ŸqR¯¬tl ÖµÐ…p\×LEõ\"VQ•\rÄº³J)Z\ä’_ð/h„µ©¦V\äÖ…¾(!gÅŒù-oùV\ÆÀû(C@È¤vû3F¢ Qºôh’¡K#oc¹j\nùj<ò\Ãô xI\á«p€d‘,\ÒI\Ø@\ä/Ñœ§\à5x`ý²–$o\Ü{§¹\n\Ò\Å|d	R8\äa‡«¿ko·\ÇÍƒ\Ìl‡\\ðl’\étW\ËC¤_Á#û·;.[r\ï1@!—]{¹V;\Ì\ç°\Ã\Úu²°\ÒÁ±\È\Z)E°N\ëŸL”\ïŠQ€\×þW\î\r\ã*•“0Q,#€÷[¿©\n1¯\â7ž‰z\Å\Ë_\Ñh¡t†w4¿\Z¸öÙ¹§Òƒ€JbJ jZŠŸñK\Öxj((±aË\ÍOŒ§\äWÞ¤.8G”­\ÖYr^·xòGfŒ‰rª\Ì\âóc5\\«£2™\Ðsc	\Ô\ëgb\ëYM‡š‚5\Â\ËN`O>ù”ñÈ·l`±(\ÈÚ¸Vb\ßUB\"\ãÁ<ÿù\Ïo%.\éüño\ë29>®z•\Ä<\Æo·a\á\áI(Kð\Îú\â9ªW¹xó€©y0\Âñ‘)LH—Œ\Z`§¯f\rŸŒÆ€·0–šA“\É\Ì+^C\ä@<\"þL´¥09\Õ÷Q{¯];g’H®En(	CMF)[m<²G¤–¢×@“ƒ7û@‰\ëT°Hó{VY/+A1ÁM£iÞƒ5©\çƒó&\àX\ÆJoÚ´y\Z–¢!8&DAdAœcLŽtN±#+W\×;\ÒiOq\æR¯ Sö¡gm……\ë%\à”-a0ÄœS_\â\ÕVJO•ô@	ð*\Çñ\Í\Û\á\Ä\Æ\rD\ÇC^[EÆžh^\Ï\n‘\â‡@-ê¼µ—=ª »\ç·\æ\Ç\Ô#Ã†8\äò¶FÁúo\ÝzG[W¥\Ù,·G)R^N˜\áy©\ã[÷°#X*paZBx\ÕUW¶\ßPš+¯¼ª	®lÙ±\Ç\Ó2I\â™\\Sm\î†~ÀI\ÓV/Onñ `–M6ªŒS’Á\ïjy|\ß(Ù³´ò{L±Y¬fNR/´Ö­O&ˆU­rMRŒoß±[³‹ôn¶ž&\ËT«\Âi’`^Œ|\Üq\Ç6X0\Öó\n{TAzKÁj\È@%½™\ÏA*’T\ê°2Œ\Õ D4œb°\ì^)V,wL•ŠW!¬©³JV–e<i]£6¢®\ÍÀŒ-™³\Äc5\Ã\Â3\Ù&\ã\Æ=[›\Éwjµ\ï\èE6lû$0#eõ94(\ÂñT„Y\Õ`\Öõ\È\Â\Ëw\ìœi\í\ÃÁó¢×Òƒôq^`ž8H¶R–¬¦¤×…\Â\Ê\àžu³“\ÏXT?k%$–Z%\ä[¦\Â\Å\n,V<\Ç\r\ÜzÛ­-õ\Çý&°&ˆ<·,¸£,‚t•›)utJZ/c\Ï\ä;9¤\î$Œ ³\à\å\ÉqÁ¹w¯ 5\æI~?	\0A;CÀH˜gË¼\íš<\åb\åšV\Å\é{‰\Õ6³hÕª¹\Û\Ó>Z‰J_\çK/¹´ñQ\'“º/\éqÒ£\0ý\Ùp½’T€9¤vWl\Â?µ\îJÎ³\ÐS,cq\'}´\Ä5\\o\Z3\Òø­¬„p^Aœ3ô>\Ú2B\'`=©ª½Pƒù\n›jq£\Ø\Æ\Ø,(\æ^\æ\âEežYi/}®˜6*y\Í\á1·n½}·#\Å\æm\í\ßûAO\ï¦~ª\ïtXA•|\Ê@S\Ð:\í¡­\ë\ãc‰#÷\Ïx\Æ\äÌ³\Îe\á±n“^óB\áZÎ•ƒ1y%)=Æ”\ÓnqŒZ,+ó\é^\Âr[%\ç\"”i\à&h½(‘8GP=À A\àÁ´(H­6µ²\'>«\ë}‘bÒ¼^O<ñ„\è½úÕ¯jÁ·ûŠK²b\Å\è$\×Lû\Óÿ\ßÞ½üHV_w\0\Þ‰A\â!\Ä\ÄCBH#!@H#ˆX€,V±„œÃ‰³Œ·™,\ãMœ˜Y8òƒ,\âXŽ€00`\Å\n`²0QÀn‹!b˜™ž©ô\ç\ßÛ§~s«úUU\Óu¥«®\î®Ç­\ßý\×÷|\Ï9\ß}þù\î»zŸÄ¦n¦*\È\í|Šýluf‘kxý~y,PØ¸{ö:rPl<òHßš*=°\" »=b	­\Õ=£ý\á\ã\Ü¼>£\ßS7,·q\èÐ¡ÎJ:\n¡\â¢I.	\Ä\Ä9þTŒ\ß_ýÜº(b¦\Zl&,ôqFH‹qÉ d\\%(\Ë\Ö\åFX\Úb«¸bcj\Å8ñ\ÈB\n\Þ3””+™B`ZX¸º&\çòU³ßµN\Üwøüó\ã}Z\ãB\ël]¹\Ñi\Ç3Ïƒ7€J”QlóXË¹	È™Ó›þ&˜\Í\"T8\Ø\"BŠP5Rµ&M£\Å\Ç{¬\01’l\í7¿ù\ç\ÝFeF±rñª¬Öª]”Í©C¿™Ö¡U5û“øCŽ†•#,>—e´ðU°\ê™R^¯ón\æ2\n\Óõe<‡\å\ÔY.j\Û]¿\í¾Âˆ9Y\àŸ }\'\Å\å\ä[G.5\å\Æ}]\Ä$_P;¥›n&\n>÷R6&\í`C±™]í ¡\Å(/m|~?I{_\ËRØ˜\Ùxn€\ÊB\è MÐŠMªú›]¬Q¢e¤{Fš<\ÔüH\çf•.•À˜eÜ…üµ>?2dAj\0Œ @\ÛX7\Îuƒ¬]C\Z¢\r¶û]8b™ÅœB­\ÇISq.1\ë\Ë#\0€ ±my‹â¯¹&n;7}^Ÿ1W+&\×\"òýi\\Z%w\é\Û5ž¹n“\Ø4Ä¢qg,,¡m\Âýø÷wÚˆð8¹+‚\à@Án­\ÕBu\ã\Åv-µ›b\ê\é†\ÇR´\Ì\Þ!\á\È{$™˜\ÞX¥f’‹À\0 ƒ\r6\r-\Ü\ïr\ê\ÔÉ¾mhuYYÿLp¢ôx€\ÉT\Þ@\n\î¦\Í_\ÙkŽ\Ægu\Â\ë\Úk¹	H\Û\Ö1e”\æQW„‰I÷u\î–ø\Â&”\ëø\ÉO\Úi\Ùt6d,*3Ž\\(@÷<MÁ\äL~ýc\í.‡K1„¼}qk;\×\ìx[$UÇ²Mkƒúi1È‘ŠJ\\Å n6\á\Äs\'­\Õ?_b\ÜODAñUøo¾\ë8‰;¶¤\á¹\ß0\'fYD™€÷C´XÓ…s±v«]ªöKò\æ\r·,\0?‘€~¸4´,WŠ•8zt¼Y¹XMŒÂ‡euP\Þ=\'½®H\rx‡\×Ë°»–÷\Þ{ÿ¬þú\ëG&ò¹\Ñ-\Ídšõ¨V¤Ö¨´„\Ç\"š¤…û!6a=\Å+a ¶#Ë†r-*¶,j?\Ë5qq«q_xZA)/¨\ÄÄ¶\Zq\ÞÂ½µ\×þ\ÏgFûÅš\":]Klr\É\"?ôcü×±Kóv·ø\Ü5\Ï\×p³T0Z„ÀÁµ,wVö—ö	\'NØ¬Q9R\Êv_\ßRvr¶EX±*´\ê¸\Ïð\ßwn—(+)6K)@E¸Nž<\ÑÏ·¨\Ù\ä\î9§×—F·\Z™L\0\02Q*D\Ü\å>\Ñ\è\Ë,÷òP\Òÿy\ßÁ¼\Ó5‹\Äô	TiM›Ý¦·ˆòr%´”j\Ü\éð^@\nAš\Ô1\ß6“ \Ø{nUCmœ±Ò›]ô…U­\Ð—œ³ Ó—–\Û¢|\â‰\':(TŒ•Ž.5w2”À]¦K\Ö&>óX¢.³\ç	¿8„¥O.ócC¨d\ï\ík«\ìkN›²‘\æ ?n‰\à$š\Æo6\èNnÓ°6\Ü-Œ\Þûï¿¿{ŸPÍ·\ÒRiI’¬|«q¬sd¢’p;\î\ÔNÎ–\×UÝ‘þa \ã§”?ýú\×;%B„¨‚\Þ\nÍ¹ˆY\Ú\Þiu€¦$\ë\ÓO?=zù\â\à²ö™¤\ØN^mad\ÅE,dµ\" @R\Îª8cø¬,A\à—C·l\Zš	Z‚ª\Â\ró\Èn7\ß|s÷\Ü\âeAÒ¹‘vNbp\\*ú\ëÞ’T\ä<]¬\êjM K\ì’\Ç\\M\Ü.ñ˜!0\Ö\npÁú\ÕiK-Yp\ÙBÑ®­\Íh[,@‘%Ïµ¬=\êÏ¦\Ï^¥[‡M\nÎµT)³µ!PTX|+&\Ú–#\éŠò¿ý—£þ\Ã»\×\Û@( D+½d\Ú\ÂeyO\Â\ÈR\Ðt°–ÁÀ{Z/\ß\nJ á¶±6\ËbsI4¢à°˜,\ÓwnK–—]ò;\Ä1§ÁŒ\0\0¼IDATK‡D1ˆ²‚Ë¸žXSki_¥\Ë\çycAB=T3ƒ4Œ`¢ƒ·„\àöEi—u·!;60«!^q\Ø’P·\ß~{\ÏT®S\È\Zÿ\ä\Z,Œ+ Àüü\Ä\ç]N¢jü¶\Û\É<¤\r\Þ+·«\nJr(P>”O¯I ƒûõò?¿|V\áQ\Ë\å\Z‚¼·;Àr«û9„\"±r„›\ÂÂ¤\Ât{,‚J\ÑvSEwŸ÷\Å\×\âªOŽ}\Òñµ¸™%h1!HV“¬hJñBšs§ø•AM\älB–&a\íŒ÷¡šp–\Ã\Í\ã\ï\Ó0i=dQ½O¬¶}\ÞAû \rÁ\Æ)QvEó\Ê\åð\áÃ£\Ç¼[7þ¾kJŠµ¬‚E\Õ\ÊW7‹ku¤ôv[µ[&G,i&ý~—´ú¥H½)P\'–\ã¾û\î\ë,\0sœa 6‚f\Ó(%rŸ‡•tp»h|7AWùL\Þj\Ùú\Ì\Þ\ßxanŠ÷­¹\Â\"«\ß\Ç!om\Ø\Ë’6n‰eI0ŸB#x‡þ\É\Ê?ö\èc}C=\nÆ¦¬\Ãgª]T½|ÖE\ãB‹A\\\Ï<â€\äAjŸ{Yg\Ì\ì\ã<\ÈdA?¸ë®»º*<VD1¿/Bû`À\Ê	„¦\ÓÆ±óz7Áÿl\Ü.ñL4Eº£L›–1\Óü|7¯MÊ‰I,l\åc\Õù!\Ë@\Ñ5‘Y³ò©AQ&À\"b (bYðž¬«õI\ç˜ MAü\rS8,?GH–‰`\Õ\Â,…T\î/A\Ù\×\Ò64v\Ø\à`^7S‡´›\Âs¹=6=Šy¶©	‘ÍÁ \ã\î†t1\nŠø¤-n‹j\"lrLp§œ™lobc\Ë.K@*}¥¥²pk\ç\È\Z\Ã@ù$Yµ6±>õ\ÔSkJ±d-\Û9}ób¼7\ËE‚D!_‹v±ºó\Ôú\\¬\äeHvK‡\à\Ú\àSq›Ï°™\ÂuBO  \á(q)\Ü\è\Ìa-hP›\Ýó¿÷\Â÷ººò\ÙP\Ýt–´l³õôòÑ™³0}B˜d\â2c‘ŒªK¢\Ø;\ïüjsŒ]i¯:v¿&-Ž\Çxn\â5HE$K/\æƒ_Ri\Í9¢„î±¬Mu)\Çð¾ö}\ÒnT|(.MŽ_U\Ê±	M˜ŽŠ`Y\ÉÄ¸Q\Ð\n\è!l6†÷Á\äô{\Ì6 å“ºy|õ¶Ö¾þ\Î4«c¨ù‰y\çH¶“Xœ¨‚Lw•bU&`\ã7ß˜\àƒ…iËºRF„%e\Í@Â²UŒ\ÐÂ¹C•|õwJM\Ü\çžû\îR¡\çz# \ç…\ÉÅ‡G\äø\Å/þµ\ïp\è†ÙˆY`1\06¦$\æR’ŒOñ¥Ó”z9!D*ø$\Çm‡FƒFB¦¦]²r\èWø\Ñ\Çõ\îKh)\ç\Â\ÅJ¹oM(¶£”-°q„¹6‘\ÆS‚\n\ì\ÍnDµ™¡ˆ„)­@‡¤º\ÉÓ‚|\ÂZe\íÓ§y™˜úYó\"p.\Å\Åj\ËIi0Œ^\Zµ¢	ò\Ñ,F\è\Ô\\¢­\ï\É\×eEË€:NSÊ¡„¡†K¾%%¦.öh<\ÕJÀ.HnY¹\Ë\ÔóY©rœ\å\æ\Å\ê$ñXGË¥<\Ù\ë)%\î¨xEY4k\n*÷±À\ÖF¬gm+l<TƒAq0÷‰\å§L”œ\ï³\å—& Y,¾=Sÿ\ì³\Ïv™V›º¥£@`¾ó¿\î~‡ˆp¹Ü´!sÎŠx´&Á;ô\ä¥|©Óˆ-š\Å=£\å\ÂÕ™¥œü\èñ†=\ÚQð—- A\Ò\Úâµ©‚Pkð	X[L!\Ö+¹¥?ÿ—ŸwŠ\ë[ñ­Ž#gÍ•¤#o\é\Õ\Éc·…B³\æ\ÚQ\\,¾8’5ò\Ù)Š\ê\îû\éõ•€l7P·P4÷£>\Úe\ËÝ„@¹}Ÿ£\ç73óBh·4˜«(\rG\ÓÉˆ†¸p‹1¼&%¿\ÕE€|¢Yýa\ë€\È\Z‹,\êmb\r&]$k\á\Ê/³‰­¹XMbqþ´~”a\"\Ü1Ÿ»+\×ô£úQ—‹’¬”\ã\ËÂ§ƒX©·û81gPÄ•€l]°qÁµ?üpw³Ü¨¡N\èn±ÀzM¹©™FU\áX¯\á2q³\Ò>7\Ã\Æö?g\rÞ’M\Ç\"®3ß§%¼w-c–™(ly[³¤\Æ(®5£ |64Ø—…q­j<W»\ëW·*aºÚ•·\ß\êb‚U\r\ÂeÙ¸ ±\Ôm€s\É4>¯$¥–`F¢„7+M\ã\ÚZl¨‹j;›[\ÐM“ÿüø\Ä\È\è*X\\\Ö\Âók`\î3c\î«&ó¹’k6ºU\â\É{\Ø(Ë¤T\Ø‚F@ýž\à$\án\Î=5  µgU_*½>Ù¾§…pY\\–Gl\ÖvŽi{9\Ë-\Í\"‘~\å¤\Õm›+\Äz¨÷ÀŸ„§³\nH:uÞ½†õH}hšl Y\æýÄ‰“ƒT“¶)‚\Í¨³Ú»çžži²6|ù YÙ´Aˆ\æ\é‚Í² ³¯4›•_|€­Œ€õÀ ³\Üml6tÿft®¹}^÷øô™/E\Ó\î¹\nH‹‰&\Æ_Ð \Ý$;>+2\"s=„¥³cý¹.€\'Ta„\î–d×ºpðRgµ·7¼¾\ÎApYª£GÏžFµ\ìû¬®*cFð\Û¨Ÿ…¶“±v\rÖ‚ø+.\Ö\êX’€´\àk`N³±„B°O=C«e\Ö\ÖþØ¹$‰£•\"»©«\Ã\í#\0>•\Ã]P\Î\î0Ÿ<\Z;3\Õk[\Ósu\ÖüK‡\ÈùÀtT †õ\ç\â‚\×\Å!{`³=Â¹zñEû{~>Ÿp\àY!B²\Ú\Îwùª\Åj@¸\Ä!Ü \íŒž% m\Ë|?ù\á™\çÞŽ5bG`ø\ß,Z,\ZHP¤s) uJFF€tý\î ôˆ\íÁ·+9\Òo´\Óct\ík`@¢øð#Á\âGý\ïY}hÓš…¶“Á\Õ\âC·´\íÝ¸XÝµœœöDHi\×\êN«—h}l–D¿B«\ç‚\Ì\Ø\Æ-A®<\æ\Êri\åq5%Å­T£Á2g\\\Ä\êX’€T\Ü\Ûýý\Û/\Ù\r\Êq“$–ø¿\\› C¡ŸT« |øO\înpP®ZÃ°[­&¯¨&6Mø]\ÕZ\Ì:¸´\ÎŸw£‡žA®X…UŠ\É\Ô\Ùd\Í(M1ˆs#\ÐV²C-Z‹8ŒN\æÝ¦·©¢…«\æŽh÷\àƒvAýHƒS\ëƒw(š* \'OLT5¾ù\æë©¹¡\ÞOCsRdòY¼¡šs\ÅV[%÷\æpUX8\Ð.K)|õ\Õ\×ú\ïW”\Å\â\æ\â™\ÍB¦V\Ç‚ô WLú\'Ÿ\ë§\árG\Üðm \Ü:\ì2›\îƒþ»kL€TY¦C½˜†>¿\Õú­e¨\Â:\ÉÓ¼uslUHT7‘\ç²@‚\âðžzò\à\ÛoM0n\ç‰V\Õ\æ•w•+k}ë˜¸\Ðú\ë\'\æ|\ïý÷\Î\"¾y‹}¤\×úó‹\Ø¿GV7Y\î‰\ê¯/\â.bž·!T\áB\Ê\ÔNd\Í\Âý\'>\çô\æ\è/Á®|MCj©\ì\"ÐªiR2¹Kó9P®¯Q¡jV„ñˆV]Ÿ´\èBóV2g«6rsS\Å\éiU)	\ã\Ü\ÉMp©™E\"Ü‰ 1O\ÛL<W€\Ð&Ë¶\Óg«\"[\â‘>øm—#i³\à‹¦£\ÔþZ\â¸–H~¯/k€\éü\ÐCuPz\ZH\ïôû¯d—kQ\é\å\Ê<µ\ëIC†$\Ü&n\Äh<9Wñ”É‡¿\Û}‘}\æZ\êl’¡\\\Z†\rw®\è»+•÷\äNŠGl\Ö\×^û÷®3}÷6\ïbªVSM¨ü\ØYGRWk—rg\×\Ö~\ïî»V\Â1ÿd\Ã\íX?U Ò\Çh\å¬B«Íª\Ö:v\ì\Ó.c.‘¢”?©¤\Ã\ÝXžpÚ´±dC¨\"+z\n…¶k=†,‰kö™´x­6?±¨>¿„Ø 2S3=?+ù°\Æ_~Ê¨\ß{\ï½]¬W;5®,È‚¤º1Ùn˜BZ:\ë\Ð\Ø`®\Õ\Ï~ör?\Ão¯7\ÇkY+Ÿ/\ëÍ’\Ô\rR…\Ä\è`q\Èx®ûö§\ÌµJœ]\ç\ÎÓª\Â1\Î\à\é%™?/ø\ÆuK	\Í\ï¬e¨.¡$,£šŽ\n\Õ/²\ã\ÉWB@†ˆm5ÿ‘þ¨¸4\Ôþ°v\Ö\ë*z‚{•M<4ñµ6UØ®ð°ñ\ÉkB¬}­3	(°“	³\Ó\\-\ß\ç\Ýÿz·/\Ñr‰j°=»šp\Ãu\ê›4™Èš³\ZU\í{\"u\Þy\ç=dZN\'>šrg.phÿd“a¿òRwI\ÖE•„SL\ãF¶pk}^…[‚\à´Áô\Û9À›qmj_¨ö\Ç\ÐD\Îf\Û+zS³ðüZ=ý¬¢ñw\ÒøÁk^}õ•2\Ã\äõ‰)XT\ã÷C)w…d\r¹”mN\Ç\áõ^\Ñj…j% »–M½Em¯\"1È¯·èµ¸È¿\nœ\'¢\Ñ07j«kT£\Î\å\à>\Ô&\Ï\íaS€C\Ña\êH°\Ý\nJµª\ÖÁ†N<2\Ô\ïwZö}³\ÔöWµm\Õ \ëc•9C\íS¼\ÕwH¯bù\ïUô¬Ž=\n¡H€ç ©‘ø\0qœ²1§ù´-[­D/LgNºv[\Ýt®“®\Z6þP§Ž\êsƒŸeùk—\Å\Ýh\Ð6Ðµ\Ù\Ä6}-ù\Ñ7;bc­ßª›Iš‘\×^÷›ÿg\ïiÿgžyfôƒü]\ßBu;lƒž(º>n’!V#Ì®7\ë°:v\éb¹¡‰$\èûôÿ>\í\è\Õ\Æd@§\ç\ì¥\æ`ˆæ±—\nCnžG¨.Óž\ëy\ßÿ\Û\ï÷\ëö\êjµ\Ý>’D\ÌFßŽ€\ÄBˆ1B\Ùq\ÊþÀÕŒ[gù%\å¯Ýµ(›!A©ß¯z\0\ÅZUE±:v) A;\ìADn½õ\Ö\Ñõ\×_?ú\Ú×¾\Öej\Ñ\ÕY\äCˆ\Ò\ï66-”\à\'7\È\æAC¡Áü”éµ¹=‡E\Ú\Í\ßL\×Õ˜A\Ò\Ñ\ç\ÌB±BH‹µÁ\Ý^`f–¯taY\ëXè¾¿\Õ[\Ó„@qCa}\Û\ÙúŠ!ª\Ë;d‰‡š¼U\"Õ«\ë¼-dh“´î‡Br\ÕUW80ºò\Ê+GW\\q\Å\è\Â/]zé¥£n¸at\Ï=÷tI)¥ŸŠuŒW“¨bm¸O>ùdwzÁò<\\\"\ÌS\ÅRr$™{g\ãG\ÓO;\Ü\\\×%\Çb®u\çm÷½ Y>\Ç&\Þ\ë\ä\ÕvGò)´Šôµ\æM\Ýy;:\ZN™\0\\Ÿ2e\rß”\Ïr\Û\Æ\Û’i]§]se>¬¯¯‹»Š€\Ðô\ê\r®¾ú\êN8¶s^pÁý9\í9_|q\'\\\íº\ë®\ë,\Ó\Ýw\ß\ÝuB\Ñc–@‚f\Í~°‰Ò¿·\Â\Çr?þñO:–ö÷	@+\Ö\ï€8)ö^‹<\Ò\Ê4ó\Ä\Çôô#\Óo\Ó.”0%\àö½”\Ïfd‹\èºZˆ½ö ];–k\Ôj!\ÚL\Ù,—*»B²]Ašö¿‹.ºht\Í5\×tÓ¥:\ÔY\"š•0\Ø|¬?]I‹¦¿MMK»\Ë,\Ûxq5\\&ð\ï8\ØÞœ\ËN0\ÒB¸$\ÊcT	@5\ïÿöý	\ÖZ¬\Õq¤š\áh\\7\ë\àÁƒ+E\ã\Ï[ü\Í{\ç\Õ\êø{û\\®w\Î@n›\ÌóB\çžÝ©~zë‡¿¾±a±`k\Âsž\ÂQ\á\ãt¦\çjq%)¹Q\á±\Õ.0…¬&”-ùœJK\ïAŒw\êÜºXºD*¼ñ\Æ{mn\Ã\Ö\Í<¯3\ï\Ûþ\í²\Ë.\ë?¯~fžK`	\Ìw\Ü1úÆŸ}£³,6[6\é\\ü\î†\ëž\Þ*¾™Gl’\Ñ\n®I[¿¯^X\×\Ç\×ô\á‡ÿÓµ\êÑ•DüÕ‚Cý¨VÇ’d¨y˜ö1\Üÿ@¿y# {µ\"³\â•öo>«~¾\Ó\ß/¹\ä’	\Ã\\}ð\ê\ÑM7\Ý\Ô×·sc*¹0M\Ì.\å\â,\n½©\È\ÒDu}S8\" \Êc\ÛÊµ\Æ\æ\ËÔ¹ð¼MW\ätW5‡\Î €\ÎF´1#$ó\Ö\Ýj-E\ëŠ\åq„¦Ü‹\Æ\ÂDxn»í¶Ž\Ègó¥c6¨\Z\êEP%\Ó\\¯0 s=‚y™mEf‰E\ê\ä¤v’oE±V\ÇdZ«›\nýÑ¼ ZÂ±(A\Øm\Ð>„\rYž/¼htùe—w4o¾=¯CE\åM2\Ó{Z yœÕšTT-Ÿ	MC\Ñó¶º¸m«\Ï!Ë´¨kþ*Ÿ¦ý#7Ÿ,(\ß	œ»\ß\Î\Ì\å—_\Þ\Å0P0.·+LV\Ôþ~\ï^žYÎ†Kl\'\Ô&¨ l\ÉÀ€\"C<¶Õ¹D™e^˜xCQ®½öÚ‰ ü|±K…%dMn¹\å–>#.‰\Ën¨VÉZ¡RF¬Gk!Vôs\äb?~|­=74\ÚÚ†/¼ö\â‹/®mø\îk›jmC8\Ö66\ÙÚ†€t¿ŸO\ç†`t\×\íôxü].YÛ°&k\\;|øð\Úó\Ï?¿ö\Ê+¯¬mX”µ\Ï>ûlmh]\æ}úœx¨[\ïcÇŽ­mX´n\ÍýmCP»ÿ;=\î?¾œk[\ãóÀJG¬Ž\Õ1ýø\ÒMÆœX§\\®\0\0\0\0IEND®B`‚',NULL);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_on_applying`
--

DROP TABLE IF EXISTS `games_on_applying`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games_on_applying` (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_name` varchar(45) NOT NULL,
  `developer` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `price` double DEFAULT '0',
  `version` varchar(20) DEFAULT NULL,
  `state` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cover` blob,
  `introduction` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `games_on_applying_users_user_id_fk` (`developer`),
  CONSTRAINT `games_on_applying_users_user_id_fk` FOREIGN KEY (`developer`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_on_applying`
--

LOCK TABLES `games_on_applying` WRITE;
/*!40000 ALTER TABLE `games_on_applying` DISABLE KEYS */;
INSERT INTO `games_on_applying` VALUES (8,'å•¦å•¦å•¦',1,'åŠ¨ä½œ',9.9,'v1.0',0,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0d\0\0\0p\â•T\0\0*]IDATx\Ú\Õ\Ýi°\\U\Õ7ð‹\Ã\Ë*\ËzŸõ:TùÁ\Òò‹–Vi9•#È£‚‚ó€#(*8ˆ2…Q@EfI£	„1@nBHH @?ý\Û}ÿ\'»Oú\Þ\Ü\ÃNu\ÝN÷\é}ö^\ã­µ÷>CO=õT§ýzò\É\';Ú©§žÚ¹\âŠ+\ÊûA×Œõ™\æ·Ó¦O\ëû½¶v\íE‹wÿ®\íÔ­ÝŸv\ß}÷u®¾ú\êÎ½÷\Þ[>[½zuù<c¼\ãŽ;:Ó¦M\ë\\t\ÑE{—\ß\Ûôó\Øc•÷+V¬\è\ì·\ßþeË–u®¼ò\Ê\æ^~ÿ·¿ý­óŸÿü§ôy\Þy\çun¾ù\æf\ëÖ­+\×ýû\ßÿ.÷\î,\\¸°Œ9\ã¾óŽ;›9¯Zµªs\Ã\r7tnº\é¦f\ì~s\Ægt\Ö=¹®\× ºÕ¯!´_Úƒ>\Øùñ\Ü>Ÿh›	™@\Í\Ìx s\Øa‡5\É÷\Ú?þñ\ÎO<\ÑLú\á‡\îÁ;\Í5<òH!ô7\Î\ïcX~£a\Â_þò—\Î\ÙgŸ]ú,\×<\Ù/T;\í´Sa\Z‚cnš¾,XÐ™3g¸0\æñ\Çï›Ÿ\æû\ßÿþ÷\å\ï¼yó:\×]w]a`\Úý÷\ß\ßY²dIŸP]z\é¥e\\+W®¾µ¥k¯½¶)\îS\Ó,¯¡º3D\ÊD~úÓŸ¢¤Smñ\â\Å\rƒÒ™¿iB¹‰¶û\î»÷õ\ë¥]r\É%…YioZØ¹õ\Ö[K_!\Êððœ\"mikÖ¬)c\ÈØ´\ßü\æ7/¼°s\Î9\çt\Î:\ë¬õL\ëþ{ò©\Þu\Ç{l¹\É?ÿüóûBX0\éö\Ûok~›û‡a‡zhW\âo.’nL\×_}\ç–[n\é\ÓP\Ú¦„‘ý\ë_‹u¸ûî»›\Ï.¸\à‚Â˜\Ð=\ÚB\ëcH.0“‰\Ähÿûß»ƒÿWó\"eP³f\Íê»–\ÄN:µù,ý’°[o»µ¹\ß5\×\\\Óù×¿þÕ¹\çž{Š9xô\ÑÕ™3g©¥\Õ\ï3±•+\î|\ã\ß(›<yr\çOúS\ÃôšPˆ´\çž{\íÀ&/\r-}ºO~§\Ä;è ƒJs\ç\Î\íj\é]f\Ü\ÐÕ’¹\å·m“¹\×oö*s¨??\æ˜c#k­4\ß}ö\Þg„ùu_k\ÆfH&õ½\ï}¯HZI\ru®=ô\ÐCEJrc\ïgÏ¾¾\é\Ã\0¾ù\Íon q·\Ýv[£¶\Z\é\Ô»Ž	\é»¶·üaôüù7v¶\ß~û\ÂD\ÚqðÁ—\ÏW¯~´Ï¬j;\ì°C±ÿÍ¬\Õ\Ä:÷\Üs›ñEó0‡E8ú\è£;{\ï½w÷·w–\Ïü~þüùy7\Î+\ã?é¤“Š&…™|\r=ðÀ;w\ÝuWs&‹\É\ÇÀGºó\Êõ\æû\Û\ßþ¶o<µv\rµ?0€£Ž:ª¹34H\Ê^t\Ñ\Å}\×\ï¿ÿþ£\Õ>û\Ù\Ï\ÂF3ü%ñ4,Í€\ØDô_÷W;\Ý\Ú\Ï0=_þò—;÷ÿ\çþBP\Ò\ß _ü\â3ftþù\Ï–±\Óø4Ÿ…ñµ/¼ó\Î;;¿ü\å/‹exô\ÑG\ËgLw\ÜqE§œ;¥˜ó­ðÃ™\éK_*>,‚½t\é\Ò\Îw¾ó\â£j\ZÛ¾û\î\Ûg2Ï¡¶\Ê\ì²\ë.Í—:\Î\Ä‰±2˜š0_|q\Ãý\Ü‘\Î<ó\ÌæšŸÿü\ç\Å˜`|T[º\Û\Úuò\É\'w~ò“Ÿ&\Zÿ´\Ön|\nGn,ˆ-ŠÖv\Úiü†)ý\îw¿Û€\r€fÊ”žoòÒ§þ0\Ç{\Z\Ú\Ö8Ž\ßw\Ç\×3õk×¬m\Ì\ã~û\í\×p2§hj\í{û\Â\Ü\ì³\Ï>\Íÿ\ÃEž2e\Êð\Õ q;Žw\ëÿÝº\Ï.\Ç4qP\áÙ³gw~ô£5\Ò\ÜFwiù½‰`2\"l{c\Ò*Ä¥±õŸù\Ìg\n\Ã1ƒ«…Á\ØüÚ™žp\Â	E£˜T\æ‡&\Ó*>\n=ôq\î”sKú÷ÿø‘4&\í\È#,~„©Ì¸2\'÷%H\Þ|\Ï5µ­]·vC†œr\Ê)z#´œ~úé…¨µóËHm\Ô\ÓÄ8âˆ¾°¹A &\Íù\ïº\ëû\ÌRmÚ¼\Øç C9¤sø\á‡TF(˜\ÇvsÿÁö\ÛoW€Çœ9sºˆð–\Â\È\Z|ü\á(\×#{¿\Ç{ŸÀ\á_vÙ¥I“&x«]u\ÕU\ÅD»7‚÷\Öpq\ÌSF$;÷õû8 \Ì÷üó/(þ¤¦ƒùœþ\ß;—_~y\ç×¿þu\ßw\ßúÖ·ú\0UC~ø\Ã6“dR\Ø[\Ég\á,‡\Ï&‚\Æiû\Ø\Çú8óAZ´ŽN\\S÷—\Ð\"¾&¶qŒÖ§\Þ1=µV ‚k_ü\â»¦gv1´pÑ¢E…¡iL?\ÄGÎ¸lFqÜ®C`ŒŠ\Ð\Ïô\é\Óß–xsn\ì2SŽ?þø>†­ò9\æð%mM\ÇT>eÚ´\é\å\Þi\Ì\ÖÔ©ÿ\Øe!\àÿø\Çò^\ÇÈ™\åÆ‘\Äð¼ó\Î-‹Jf‘t­x\â‰\å»]w\Ýu\é‡\ÄñI.“AkAÔ˜Å¶ó\×ö\Úk¯BpL …Ì›\ßp\Êi„‘™$B\Æ0#RCS’š\â30ö`(K-\Î\\˜¬i]z`º{\'+ ¿\\C°4÷O)~{—]\Ö3¤IsÌ¸¢@\ØG]ULƒŒ¨\ÃzÍ¨ü\Ç\Î;¯\é\ä\ãÿxŸ\ZRw$}\Ú\Î;\ï\Ü>\×p\è]Mc¢8^&…Pðm$˜@±a§þµ˜\ÄÆŒô·\Ûn»õEô\'Ÿ|J\ç\êî¸˜\rþ0ñ‰yjDÙƒø\ëÿ\àƒ\rñ;\Ú\â\ZºÖ€“O9¹“„š?ªýEL=¡O€J\Ø\ã\ßš†dbù\ç\â\Øw\×mMú\rÇ¬‘œZ1•j‚Ž¤ò?øÁð”i1¹Ú‡h€\èyû\í·¢dLµVøÍš57†$Á˜Á7pÌ¤˜‰L£K–\ÜRúœ\ßõ‹‚=\×  \ÆCk\é~«V=2`¾kŠ\à›hÖ‰ùs\ãk26šgü‚bšpZ\n\×h,‚H8b–\Ñcõz6\Zõ\ÉO~r|\Ü6\"\Ù\\ÿù/|¾AQ¤ƒ\âð¿þõ¯÷¥#€f³j§®™\ì§?ý\é\"\á\×Ì¼¦ñ?ñ\íf²Pñƒ~½H¯¾ú\ÓQMrQ\ÐÉ—~©þÁŒŸ¹¼¤@õ½\Ëo\×û·5 8 D\ÌÙ…^ÐŒ¯\Î\Ï\Ñ\"qŠ¾\Ý\'&¿¦!Ÿ\Èr¤}©\ëûjD;”d‚ `PQ\Ò#ù¾n¿úÕ¯J\Ç&-‘–Š\Èx›m·\é,¿gyó\Ý1\Ç\ÓHU{?ö\Ø\ê\n\Ørfª–\î¨{m.©>t\Â\"óJBx\àÁ\Æ¥}ÿû\ß/¾E\\A&O>»³t\Ù\ÒB\\ú’K¦öi_}Ÿºa¨x…vA |c\Ý\r»ú\ê«\n\áC`·û0G`þü\ç?óQCQ%\êþ»\ßý®\Ï	µcA”\æ\Æ	nh	\éD¤÷¼\ç=%FÑ–/_\Þù\Å\Ï±A~ª\î“V2S&‘\à³µg2\î!ú\Å4¦’\Ï!L\é\Ï“¢1§oûÛ…\É&Ì¶#( €‰>KpÚ¤\Æ;ƒ¢/aö03´Jc&MÚ¿h,´*¹È·\ÕY‚:%$iÌ•ùSc²p¥\Ý|óMù\ÔÄˆ\Ê!°ö™\Ï~¦±‡\É\àn½õ\ÖM$\ÍN3]\í¦\î\ïŸøDñ$²ª‘K»±·ü&¢\Ý0(\Íu‘jRy\àA–ï¡œÚ™·}\\[\0µU¬*Œ\Öb&#Q›4ó†	\0 s\áE6\É\Ïv\ì\Ä\Z%„€\nÁ|\è­À^h£Nw/^¼¨/U\\P¢qòÙ“‹­gj?ÀT}ðƒ\ì!­®ô\í9\Õð¯ž\ìW¾ò•‚¨¨lž ±\Í8eŠLA’\È{\àÿ”Ü”müuuO>Ln\n\Ä\Zººž‘º\Ï\ì\Ù\×uQ×´b2\ê\Ò@\ÍãŠ†¸?\í¬ý›ñ¾¥K—m\Ùo¿};\ç{^¤­\Í[ÿ^¹ 2‰8”ž¬\è†ô\ë	\Ý&ŒkMŠ\ÊB©–ùû²—½¬AûOÚ¿\ÏÔŒ\å\è1“JcF˜\ßN„&\Èþ\Ó>Ltoø²\Ë.+\Â\ÄTqÖ‰À\Èc=®H4B.\ëú^fxu!<m<ò\È?3\éZ&ƒ\Öø\ë\Ñ\Ò\'Ö¬¯[\0\îEó	kQ3\âƒ0	¸9õ²¿/Ÿõ˜.´±§\0\ï}\ï{;C2grYð;$\Ñ\Î3…˜\ì·¸«V=\ÚH#¿\ç\Çü…¨u:Ä½6i‹Z3Ák™Ô³º~!˜5\åTv\Zóù1\ZT›]ÀcúôK‹$B<­|¨0còY“\Ú\Z\ä\'\"\04\îø\ãO(–¢FR˜5ûú\Ù\Å/˜ŸT\Ñv\Üq\Ç\âü}¯¸¥\ZyðÁõ%\ë@1Ÿ\çý\ç>÷¹\ÎPœ‹›³qVuq¨\ÆÑ°3t\ÅF.]º¤‰¶¥%ù¦ü\Î@\Ãp\ÏDh…\'30H\ïY\Þ¤\ãh	³\ÉN{_£À\ÄO\0†\Üá€®†‡\çLñ\×H/\ïk¸kœLj>\ÓoI¡t5… Ä‡¥_\ÉBc¥•„ó\Äÿ\\\ÐW\êCµ\ÕIÁ*,­\'DC¤S¨U\"\ê6ô\Ë{\×p<ˆ!!a¸p\á‚&:¦\r¹y\î/G\Zsˆ54­¥,3H2óÁ7A\"\Ò\êî›€+„¤-ˆÃŒ¥bI+®é‚…n˜\ÓERƒøxš~5¥[ÿ7¾hk\ÝXaCHÂ¬aTb¯š®41\Ðø\Ù\Ï~\Ö‚\\t\Âù\áü †DB˜\\%}\×wU\× ™7N3P¸¾\é5\×\\]\Þ\ëWÿ)\ïd€\íDa\Z\Ø+\Ý\"D%\rù­˜\ÑL„ý\Å`’*D\Û@\î\Ôh\í§\Ò9\ÑVƒšo|\r-\Õ\'sÙ†\è\ÒIh\âû\Ôb¼gšS‡i#8yÀ\äü\ê(‡¸Ô¥Áü§\Ö&Žøý]$sO©\Üa\"D‚`$7U¸\\;£K0¦Ê€HSV~|\êSŸ\ê3iõ½hŸ¨š_“Î®«Œ±\ÛÐˆs\àW\\yEqøLf`(´ƒ–™\Û=wß³Ii/‰2i%‚…\è3g^\Ó\ÕÜ“ú~’\Çd\Ñ\"€A\ÌC˜¾öµ¯\r4›\ÆÈ¢\Ð|\Ðw:AÐ¤\Z\âO\Úù£\"y{ô\r@H4\×\ßñŽw4¶4ŽûÆ‘|‘IPI\Äd~>ô¡õõYû\r00’ÇŸ‘\Z\ÒNûø¦3\Ï8³ )L\à\ä™P©Köô´\ÓO+\×d•\Èc?\Öy&\Z“kN„\æ¼\ÛÁa/g¶¤\ÌÛµœº\n)\Ë@\ÛkS[\Ó\ZS\Ì(	“:·g¡\Äa*\\´\Ýv\Û5„r\0‰õÁŽº–}wÓ|\ä#n_\Ò ¤_¿‰¾ù\rVŽ‰\ã»\ÅýM\\ÀB\æÀœ\ÞqÇe\áÅ (yS›9d!F€\Ü)\È\ÕB2§+\æ\ï=¿Àä¹¶^«P/=2v¹±\âÔ¥\ÒVtcR\Z\Ôö	&/»)•7…¢\'\Ö4µ|ù\å3\Ê\à\Ù\\`!k§dVÓŸ¿\Ûm·}\Éÿ\Ð8 EÞ“üÑš\ï’\á%Pð>a\Ü4iÉ’ž¹\Z-\Zß”\Æ,š\é\'X2\ÙuŠŸ°\Ð‚\Z\r!ŒüœL&ô\Ä$\ízÎ‚óK3”$™x\Â\äö\Ø\ãW£:9‘u\â–W¼\âM(\èº\áôõ\".X°°@\Ç§jø®~î³Ÿ+„c/¸ð‚bªHž\È\Ù5(¨3†\Ò\ã\å\Èi\ï¶Rw\ÇB\ÊL\Z²ŠvŠ7}¶±fŽIÁ#¶§N¬H60—¤w\Ýô\"¤´\ßÿ\Û\ë\ÝJuô€IE1f(De#\ÅõÚ©ºŸ\Ì	\r\áp!¡¬KJ4hYœ¿ÿý\ïo„e\0€\åB_rq‘6f	ñ\Ý\Ãý€¶\Ùf›®£þM\ç\Ê+¯*¦\ÂuÆ˜˜dÅŠû\Z\rHºÄ˜h’Ø§j‚ž0òö\Ý^ú¢mþ²ÿ\êÿ|%€ XN¾Žor£	üC½@°\à+\×\ÜÑ„•g¹+Tµr\åƒ})!÷ƒ\àdÄ‡²úŽ*1WõÂ±ºö€P€tÄ¶\ÛnÛ¹çž»\ßAz¤A\ÂLša‚ˆ\Z¸š\03ø¦Œô &8Èf<¤ŠDa4\"Va§›B”AI\Â4~)\æEôm,400\Ç%C0r_\ãc“J\Í>kR3Gðž@\ê“1¤·\äur¹g½ôUœ‚Y¨\ëK\Å0\Í\rR˜ŠD§¦í†–\Ù\\}õ5M”ž	©…L\Âí¬¾H?>¿CŠ \nR]1k\ÌRV0Ö¦0\0q}/\Í\Â\Ù\'\ÞH)Kp¡ «0£,…\'R\nÁ!j´hP\ÃP‚ˆQˆ¥ß«®ººÜŸY&p|cÀsiœL¥GÓ›ºÿ?®+T~•\Ä\ä\î2F\ÌŽ\Üs¨®÷\×+\éOC0a#\ÑÊ \á¸$ù¶\ÕV[õ1ƒ†¼\ï}\ï+\ÌZ¸ð¦BÒˆ\È|ƒÉ°»Ðˆ{P\áÔ­c£q\Ê9S\Êð‘¸B´s§4U½¶¶ek\Ö<\Ñ5\ËJžŠ\É|\ç;\ß\Ùyõ«_]\Æuøa‡÷\Ýo\ZBT´Ð¿û\Æ7f}\í¹ç¯‹Yg-¬ž×¥-f\ËLœ\ß1\ëh^¯ˆ\áJ\Åp\îÜžZ¹8†\ë’c­^\â„‚8G“J½‚—\×\"Au£~KÒ¼‚ \Ï\à²Üˆ‰3xš\Ã~‹À-R;ú˜£\Ë$“¿š\ÕÕ¤”ý6i\n\ã!½\Ì\Æ \'.U¡‘jfVŒÕ¸d^ø\Âv^û\Ú×–÷„ª†‡”\Ì;%\0\éò4ˆ‹À x¶/$\ï\åÅ¿1\Ïñƒ\Ìb\Z“\Å,†Ì™sC³µ\Þ_\áÅ¾e9‹Š%L\á©3S\ÇÊ¾\'Ç“t~ñ…/|¡˜\nÒ«>\è,®	\ÙX*Nœô\î´\ÓwŠ¶@`\É\"çšº\Ñ&‚iùŽ‹K1d\Ù\Òe…aúÊŠLcrO,ÁLhrhh¨³\å–[u®¸üŠ¦Ÿøˆ©\êe´ˆI«\Ä ‹€^\0\ÑÏ»aC\ÆlÅ¯º6©ø¡ü°\Þ\ÏQ¯ Iô\r\â•Q]\Å1\ã*b\ÕN\Ø+\æBýž|òI\Åôˆ¿õgjH¦¤Ø•R #3\n‰Œ\Ö0\×8™<5u~¨Í´z“\Ó­¦e\Ì\Äõ\á¸I\Þy\ç…\nN/}\éK;¯ùÿ¯iL¬ñ÷’‡7˜\Za\ÏY\ÙBKhlÖˆu\Ö\ß\n\Ã1o\éZ#«ø	hÌ–9ó£…!8n\ÒÁ\ÇuqtL]!LÁÙš„\ØüA½ŽJÌu³&1¯¬ü›\Ûø‘|˜7\ê1ž,uu¯\Ä0Om¸˜3¤9\î\Ï\Ù*\ë\Ö\0\Å\\:\è\àFK8vZ“\Årˆ)\Ê7V‚@\È\ã[\ßúÖ®†P\Ì{üd–?¹†–c‚\ïš-·Ü²ü\Í]~úô\Z™Å„¥ô|D¯ô<„$¶.–¤r˜r¦\ÂIY°p\ßòÎ´K§) \áOgy×§`ly0ûW¿úÕ¢®s\ç\Î+\å¦N½¤\\k\Â\ãc˜û‹ƒ‚\Ö Yö\ß\ÞúU7fÓ‹V`J\Ò3ƒbÀfZ)\ÍŸÙ®R&† D\æÁ<+M\ÓX\Ò}ýõs\Ê[\ÒMN 8oófºš$§¹nÁøÐ‚f½f[Ga¨h€A-õ\Ö3DÀq\ædý\"·\ëŠý›?Ac\ZN,õ±šXÅ€LhÖµ3\Ë\r§þcjñv“I\Äx‹ù’ý|\ìñ\rü\Ðh	\Êd²\Þ)5¨¦N\ïš\Ûýöß¯º\ZYúkN„#)•,^´x$\è\×,\æ\à\ë\Ð 9\ìðÃºº¼˜6L•bŽ|Gc|¾¨û* q wr‚Cü\É\ÌD\") r\Ù[\Ô\ÕK\Ù__`¤	‘ôhQ’…&b\Ïfû?\é\0 \Z\æ\Ìû0u^w‚»t\íù	]Hj¹ed´(i\î\æS\Û2_\é’\ã\Ì)&«®\Ñ\î^ºd¸\Ð\à\Ì3\Ï(\æ‘\ÄÏš5³Y\á‚1´\Ã8\ÌÑ˜	º†_³•zc\î²H‚eHHA\Ë\Ë.\\ÿaÿó³Y’*gI[X3J@×³ƒó‹3”. ¥)Ö°‹®IlCº˜v\Ö¿ ò™<´\Æùq|™h½.v´šgž‚&\×^%3Z^j\íkû–\å0;\Æ^½,E\Ï/@X¹2N™\à0«,F°4´!\èÍœù*\Ú\ÆÒ ˜\î\Ú ´d\Ö\r©sAQY\ì\í\"š\ÒL6ˆ\Û~\ÌáŠ²A\Ì\Ä 1Â\"@!0 I¤\Âg^$)’­n˜[›«±ˆ\ë;R˜-\ÑY\Ê\Ô.°·!.­5.ZlŒ\×^;«#4H*\Äx	ôa‚œ3\Ã|C„‹u@+¿\ËJ~>) hú\È>~f¯Ñ …0$\ÜûðG>Ü—Of˜9Scctaš´\n”„aYš\Ú\Û<³¸²H‚.K2\ëÀ“]õûv\ág,`¬‰Ì³>w¬\Öx\Õÿê®-\è¢\ÂlG€-º¹\äôXó\Â8Ž\Ú{°ÿo|cñ©‚\áw½\ë]\Ín3\Z\Äz\â¬\×Jüf…!k×®\ëþg=fumfb\r;^\ë˜$(\Âô¶\ÛlÛ¨®\ßx\ã¼BXv\áI\Z\éÿOûPgeØ´8°<‹\ÆSf•Zª}Ý¦´‚\Ä_\Ó,¡­S\äl\æ\ÌY%by¡\á	)f\Ð\Z…\ÏõAf¢A`ÒŸ})Ì´ñ&\í‚\Ñ\æf\Åd13\Ùe›\"TT¨&L\Ì\Â-‹o) @ðûž{\îQ>gª ªCý]\éCò<\Ä\06•Ÿ2¨x¢)Yl–œ)\Ê\núñ4R#\Í\ítÍ¦\Ô\ÑÛ‹£k¨-6š\Óõº\ÄO}ƒ„3Gœ?n€Â–cÆ•l\0\ë\ÂlKC%KÌ¤eMÀ‰&\Ô-Œ¶„HASüÉ»\ßý\îBP(‹ý\ìô\ÂR¨™7²ý+9ƒ\áðD·*k´\Ã\×v\èüøG½A\Ó\"\ß\n\îFkY\íb\ì@Æ³\ÑÚ¾ì®»\înNk\íC¨\Ð&\á\Î1\Z|G\Ö\ïúø\0|\Ïz\ì<2nsöy\ÌtÑ,§R©a³…u\Æ7¥\ÆT\âH\ä›\Þô¦¢šb°‘\Ô`€›SU\×\"®`j´F\0\ê½\êD4$¶\ØXIð¦T\'²4()Ä®ýk\îJ£¬\äiP²¹À\0\íIb’°Ü¬\à,IN*+\Õý(\ïsL©³›l&MPlà¸†=\Ç&I,\â3Ä­·\"´\ë½`\æô­\Ë\Zm\Öv\Û}·¾À\î\ÙbH\Ý/\r\È\Z\âz}@\â–€p&\Çô\'»‹I\ÐgRUMƒÀ\nC\Ø_Cp-bû’&u~dÿu{\Ñ5u{û\Û\ß^ª‡!ð1\ïSuk\åG=™z+uú\ÞX\Û\ãW{lr|SóRomk²ö9Y\Ú¡cVŸ\ì)D\Û\Zþ†03b5\ÌšD\î?¼²r4&\ç>%‚W(R÷&-˜ª&Á\è\ä\Ëm\Õ\çbHûdœ¬Jod& \îx5…E$uP*ŸK\çž\ïXlk\Ãtƒ‡²®)‘\"‰nG\çy½e «ø$\ËD£ƒ‹)ÍŠb­\ìƒ\à\êCeIU³\'d$SPo}\ÛXK™ø¹\Ò\ã,[Ä«c i=A¡Sö#j\Ö>û\ì\Ý0#²& a{G’9s1H Y\îþ³T\ÕjŒ9©oû-jØµ½œ\Õ\â•Ÿp\Âñò\åþI’X„BÀ\çuk\×õ\Õ,2\Éñ˜Ymý»‘ü¢2.\æ	n»õ¶&1›$eÃZ\ä—ø†zŸ\Ó4i!u‰38x°¤£%Å]‰À~„Ï±w\Ä\ËJ\r\Î\Í`&O>«\\G‹²±\'ê¾±tI»Y&\Ô^\ç4ž|\Ö3\í\è5ó‹yK“Y\àŸƒ\Ð8óz\èHÒ¦E\'—$X+sÞ”\0·\Å½Š\ß`1&+¿•AO=\í\Ô\âKR\Ò\Ä\Ì2(¦\Ñ\ï(Å¢Mi´³}ô_¶C<«\Ì\è<5¦F¦ö’X$\Å0\"Ÿœfd\r†dV}\àŠ<«O:\èÀ\â‚Ô—q±\ëÚ‡\ßYÓ•-\0F2\'˜0l\áõœ\á\Î\Üy½$#”rsW\0’>©7jN´¹÷ \ÂÕ³‹Œvh\ëS-²)GmSUp\×þz\ÈA,ì»‰%™Õ‡;\î¸SI¡€\ÂI`ž£4\ê4µh]\æ7«QD\åœ?A‚eKsTž\ÏªWy\ë­Ê¨W`l\Ê\"\èv\Þ\é¹`\È\ÆLYÍ”l\ì‘~º\âŠ\Ë\Ë2\Ô^pj\ßy2…!¤5\Ë\ì©zŽÜ£Pö\à*Ž2?œ|}B\Z†I–±Ý’on®—„d¾\Î>\ç\ì˜+\×\Ñ\ZÚ¡ð£¶^¯À˜h\Ë\á›Ïµ37\Þ{ï»·D\íI›\Ô[:\ê Z ˆ6P–õ_¬Hry†fiŽ\Ä\à)\ç#\\H\Ç\Ï9{Ÿ\Ê\\!F÷_\"ûr,\ÒÁ‡”\è?\Ù\Ýó/8¿l\æ3vùÁ.\ÍI\nú\Ê*\Æz\å\æ\Ü\ê3y/½ô²ô‰\á˜v´“He0¥I\ÉBhA8“+dúC³\Ú\ä\re=n\Â\ÄøLý7Ç©2O\Çsl§ûS‹g“%~ðÁ•\Ý¶{9\Å3«\ÙQÐš„`¦ŒqRðydB·Wnîƒ†JY’»Ëº°½Šð2\É\íua·,C,KT\ï\î\ê;³\Î1\Ù#ˆ\Øg~òJDŸx\â_6PµƒY¿‰Sdºp\áü2\àƒ>s\êL#-š3r6¯A2o—^:ýy£!™3# {v­	\Ó\Ï<1\Óõ\Ú\èºb,`\äÛ»©\Z†\Ô\è ŽQ Â“`ŽH?\Z˜â‰¥K–ö1\Äb¸º\âˆq²¾H¾Ž>ªwJhª†\îq\É%w™r\æúõW\Ïbzºf‹\Ï`Qì³¼\ï¾\Å\ç\ÖY†úÀsÎ™R„QPœ »}:^£!uZ Y_P-›i\ê}ˆ™\Õ\ãuðe¯	›“G!(ƒ„&H‡c9hU÷\"elm\Ö\æi§q\ÐB…;î¸½n2u\ã[øS%n‚˜\ÞFO¶C`cN‡É±\Z£f\î\" Oµ†0?ADŽ\Ã0Sø%N\Ê\Ýà²¢‘³‹\í\Ý\Ü5¤n²·„É¼\êõu‰ó¡“\'hlŸû2!‘\Îl\Õ·>:6µò ‡ú¼­…6)ñ˜+fK¿Ùœ\r\É\" \0£À\È\çS3?>Ui/}Õ Q¹Á,&¬Q\ÕF\rÉž\êrõ1}ˆ\Ç\ä$;œNiGJ¯´…‚$\\\Ë\Äù?\ÇN—ª#\Ë4o¸\áú2X\é™\ì\Ú}>5\à¦mÖ£\Ù¾\ï~ûZ\ÔkyGk5$;sUú,\"øÀ>\Ð\\ƒ˜.(*XŸ‰«ž¿Â—dõ\âð\Ü\á’\Ù\Üu\×]Šv\í°\ÃW{ûðFö f/\"fÎ˜qyÑ¾±j(›[\ãØ9‡+G¨k!¥vT¯A›C\êc2¤I¤Ö“¿\ï\í¸\Z.ö²\æ0Ä 0HÏ€AŽ]\Åh\ç\Ör‚KJJ¥\çG0²lÿ\êj\nŸe\àa´tü\Ã\Ñz\Ø\Êh\rX©\Ë\ÎužK\Ë\Ù.í³º6Ê¡>t\Ë{ª–•vœ&½’&ÙˆªŽúÁlªt(¥I”zçœö¦dY‰º«œ\Ö\ÙˆZž‹\Ö\ÞüJh>%(£\Ñd¸vŠ½\ÍPUM¦z<`e G$WÅ”p\ê˜\0\Úf¿v{\Ó$\ç-ù>a\æMn+L¡1†)ªPU˜’—\ß`¾\äŠ÷ÿ× p}Oó$\\%s=2¯’uÑŒvr³Î¯©j\Öj\'l² ¤Zc\Âü%9½½7ô¶2MÊµda|/‘8§ÙœcpˆNr0%‹™}¦\Ø7»«q¹Ç¦¯žNƒŽ BD7@\ÇKD€¨‚&Ÿ÷øš\Ç2$mÒ¤\Z3!†\Ôu\Õu\ào{\Ç\"ù,¥ê¨§Ÿ~Fó;I6„‰B\\©·#6\ÈK;rf!¦€‰´\Èƒº\Â4Œ\åO¢y¶\Ô\Èq\ç\ÏUŒ’\Å\à3¶\ßý•Q},\âX¬C&5-llüøz)K\Ä\å -\nÁ &¦\Çõ¢ò,°–û\ÊahË–õ\Öe%‚\Ï)>Ñ”lðdž@\Älk.\'Pw\ï\éüM]u\Û\Ô4ý\Ó\Î_­{²>}¼\Ô\Æ[7¡e\í§\"Œ‹!\ígrdòõsEr\Ø#©—6w}Ž\Øg\Ï;\ï\ïM¶8&+M>\Ì1\ãµOa™\' ÀõÍ£!F\"x\ÌU€\Ðzh\å@§ùl´¬.©OÔ…0«<\Ç*Š\Õg+žú\×Sn’iOZc\ï“`\ä!Z\ÔP\ÌÁ´@J\ÙA”3s´FŸS|\Â¦¡÷h‰ƒKñŠ\ÉNŒ\â{L¶p¢Þ—W)ûL›²±\ç¾õ£76\ÖP0\Ö)z£2d¬&H\ÌyO\àÞ¡‡R²—›l§R/\Â<	&9\î\Þ!‹7`no§koS\åðˆ\ß\ÈÁ_`/‰y¥®’ÓŸ™¹úhg«bˆ›H›˜\ßD\Ö\'a;a\rK}¥\ç|uÏªb\ÛI¸\ì®Í¢›Ä¡\ÄK\Ú\Õ?\êgüEŠ\Û\Âr²N\"õ\Ä\"óG–\åg\âøQä†ž\ÍZº³½\ÌñsÐ¾Eƒõc3\ÆÛ²qvB>d<\ê—å¸˜1\ÐPE°qž†b\Çù\ÉaÝº\ìÖI‚\Ñ’\á‘\Ør,`ý7\ïHò?¤\Öb\ïú¤¶ ±v›ºF«>Ñš ðoc–,M\Ô=£\Z2ˆ1\ã0L©gQ»s±ZP¨öÁÏ°³ƒ\nÿ•Kòj\ÑfFû³š14…“ºo«Ÿ|\Óv¬OÇ€ñ\Ì,¿8\è\Ü\Äñ´<4`B‘úD)’·/$[¶ˆ„ \0ð\ÊW¾r\Ô\ßc\"-q\Êi}R\Û\Æ^Åµ\ã»\ä\Õ@n{ú˜Ëº®ýtüK4Ž°	s\è\ÍD†zd\ß\ÓfH\íSœ‚l«@){&RÈ·;7)\çö©Î’“É…õ’\×5„‹!1Yµ\Ö\ä7\â–Þ¶ºC\Ë\Ø>¹\Í\'ûžÒ®EŒg}U]÷ ñ›\Â\ÜhiO=+qD,f -\Éó•²dˆT\åh\Øöb6\ËL\ëCe²©4[\áÆ£-m“\Ö,{/\æAes\ç\ï\î\\žg\"\ÛZŸò0Z	u,”Y?ya¢þ#!Ò±÷\Ü$†\ÔDµÿ#\'sò¤ž\r\Ï\ÒP÷\ä\Ë,&®Wa€urÒ€ù„\äµ&ÄŒJ{\ìŽo\ê\ÅE½‡L2­6Ñ€\è\íCŽ·\îQ§;Qšxb\í3\ï\ÔsƒÕ«+[\ÚrÔ‘2¦š[ž\Å\Ä`²d£(õ\Ö[o\ëchžºY#\ZöY¾+\áD´#©\Ó/\ëM\àp1gÆ–£\Ñ9hYXß·¡s}\ÌxZ\ï|—ùOKC<`\ígHŠø6†¦\ä\Ê13´!\Ë\\8~L‘œ\ãc\êõÀ¢õz³gZ:?^\'\ßö/9U»~™\å,+Ÿ‰\'8~•¼\Ý~º[‰iŒ½FB\ÒD|­\Ù\Õ5h“\Î3Ù†6…ÛšC\ê\'Zš°xDÖ·t\ï#=»)¨‹\ÉÂœú\0´˜-¶:)\Z\ro\Ì\á·\ß\äEX<f©}>˜1b˜¥K\ÌiŽaŠÝŸ‹ló\ÐDT®†¬o{\Û\Ûú6šd}vÕ«.\âLë²Ÿ\'8V°þ”K m}\Çx’W›!9\Èþ{¥…$K=\äxÔŒ\ïs°Ck\\©“xþ\Ê\ïSùz\" ¯|\Òô£\r<OA\ÓWœdûA\ï$‘SN¬1Q\Ó5\È\Çpî’ „È¾•œ1¹¹µq\ç²J=`$\íL\ÒÚØ³l4\ë¹\ÆJ+-Y»þÔ¡ºSgm\å‰rªPÃ”\áMc\æò\r9’ƒO¶v³eH4Ä³d\ÙZuqf¨¶©¢öœýôDu\àþh‘¯vüñ\Ç5©Ž:h\Ì_÷Ê£\ê\å¸6¦õoô“\åM¶\nH\å*3</\É]\×\ÕÅª,\n\á–/¿w\Ì\nZûY$ù¨œóI68£}\Ýú\Ã\ÔÂ”‰0$ñ³\Ç\'ñm¨\ïmo}[ól‘\âž|1¤\ÞØðõ³l5\ê?\Ö^ôÚ¡×¿\Ë	:£n\ÂHY\ä\Ô\ã\Ç‡µg\á„úƒr\ê>\ÅPIea{r\ÝóË‡hR#Ù°˜\Ï.»l\Æù¢AOÈ“{ò[„\nR\ë1v„!~¼ñI¢uþ\Î=²\ê£\Þ3\îðœ¶°l¶	¢Š½÷·^[\Ôv\ÂQû\ÑÊ©\"Ni›/\ÏCOF–Îšum\ßr¡6s<Kk¸|\Þ\Ó$A«ÏðVC\ïÜ‹©z\Ö	ÀÍš!umAD»±5¤m3Ep¥4Û–DÅ¬U\Ò\Öûª\å%Â—¯jû“D\éþ2o@9«­¶Ú²!ö G\Ò\"\×n.[ FeH˜Áñ½\å-oi\Ø\Ô1©´™\n.¶4SzG\í\Í\ì1axNŸ\Ï`:XNL\Ú_ý¢\Ö\à:°«\Ë\æ:‘r\ìsÆ6QdcJ_¿^ò’—t^óš\×t\Þð†7t^õªWu^þò——g\à¾\îu¯\ë|ô£-\ÎRúA\Z¢>CW\ß\àfý\ÐIÍ¢†úÀ\ã)\ç\Ù\æsFüDR-9Á\nº¬[—qÛ¦q\ÐsF6+†Ô™\×¿ø\Å0d¢¯7¿ù\Í%³ªö^ú3²¤AO\äij!œƒµø‰ < Až*š¦?Ÿ¶Éª!ž£ ž©1^\â¿\à/hÞ¿\èE/\Ú\àûÿùÿSŠWµy\ä\á‡\'TŸh¯FoLâ£«šG‡÷\ÇN\ë:Ï§6T¯\0\Ì\à?ÿù\Ï7D\Üb‹-&¤5Sò{¯úó-¶xAs –£\'\í\É\íÕ®[\ØW’ô~LT|FûL’\Íù5\ÔN8„\æéš©ñ¾^ÿú\×\'\Ã\"7…)9ü2\'$\Ôf÷ùÂ„>†¤¶\ì?\n2½\'±[Jž6£øûL½\êþ¼W‡WsP\êmÊœ|!¾B`e?\Ï\ç\×ÿ\Åg+f&\ËT\"\0\0\0\0IEND®B`‚','æµ‹è¯•ï¼');
/*!40000 ALTER TABLE `games_on_applying` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewer_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `rev_date` date NOT NULL,
  `content` varchar(280) NOT NULL,
  `score` smallint(6) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `new_reviews_users_user_id_fk` (`reviewer_id`),
  KEY `new_reviews_games_game_id_fk` (`game_id`),
  CONSTRAINT `new_reviews_games_game_id_fk` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`),
  CONSTRAINT `new_reviews_users_user_id_fk` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,2,1,'2017-12-28','æˆ‘è§‰å¾—å¾ˆæ£’ï¼',5,'v1.0');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(12) NOT NULL,
  `password` varchar(12) NOT NULL,
  `authority` int(11) NOT NULL DEFAULT '1',
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `balance` double NOT NULL,
  `company` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `account_UNIQUE` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'wisetim','wisetim',0,1,0,'zjut'),(2,'lalala','lalala',1,1,0,'zjut');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-08 14:53:28
