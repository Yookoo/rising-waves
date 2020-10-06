SET MODE MYSQL;

-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: rising-waves
-- ------------------------------------------------------
-- Server version	5.7.21
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,ANSI' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table cms_article
--

DROP TABLE IF EXISTS cms_article;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE cms_article (
  id bigint(64) unsigned  AUTO_INCREMENT PRIMARY KEY ,
  category_id bigint(64) NOT NULL ,
  title varchar(255) NOT NULL ,
  link varchar(255) DEFAULT NULL ,
  color varchar(50) DEFAULT NULL ,
  image varchar(255) DEFAULT NULL ,
  keywords varchar(255) DEFAULT NULL ,
  description varchar(255) DEFAULT NULL ,
  weight int(11) DEFAULT 0 ,
  weight_date datetime DEFAULT NULL ,
  hits int(11) DEFAULT 0 ,
  posid varchar(10) DEFAULT NULL ,
  custom_content_view varchar(255) DEFAULT NULL ,
    "view_config" text COMMENT '视图配置',
  create_by varchar(64) DEFAULT NULL ,
  create_time datetime DEFAULT NULL ,
  update_by varchar(64) DEFAULT NULL ,
  update_time datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
  remarks varchar(255) DEFAULT NULL ,
  deleted tinyint(1)  unsigned   NOT NULL DEFAULT 0 ,
  status tinyint(1) unsigned    DEFAULT 1 ,
  copyfrom varchar(255) DEFAULT NULL ,
  relation varchar(255) DEFAULT NULL ,
  allow_comment tinyint(1) DEFAULT NULL ,
  content_id bigint(64) DEFAULT NULL,
  KEY "cms_article_create_by" ("create_by"),
  KEY "cms_article_title" ("title"),
  KEY "cms_article_keywords" ("keywords"),
  KEY "cms_article_del_flag" ("deleted"),
  KEY "cms_article_weight" ("weight"),
  KEY "cms_article_update_date" ("update_time"),
  KEY "cms_article_category_id" ("category_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table "cms_article_data"
--

DROP TABLE IF EXISTS "cms_article_data";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "cms_article_data" (
  "id" bigint(64) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '编号',
  "content" text COMMENT '文章内容'
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "cms_category"
--

DROP TABLE IF EXISTS "cms_category";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "cms_category" (
  "id" bigint(64) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '编号',
  "parent_id" bigint(64) NOT NULL COMMENT '父级编号',
  "parent_ids" varchar(2000) DEFAULT NULL COMMENT '所有父级编号',
  "tree_level" int(4) DEFAULT NULL COMMENT '层次级别',
  "tree_leaf" tinyint(1) DEFAULT NULL COMMENT '是否是最末级（1是、0不是）',
  "site_id" bigint(64) DEFAULT '1' COMMENT '站点编号',
  "office_id" bigint(64) DEFAULT NULL COMMENT '归属机构',
  "module" varchar(20) DEFAULT NULL COMMENT '栏目模块',
  "name" varchar(100) NOT NULL COMMENT '栏目名称',
  "image" varchar(255) DEFAULT NULL COMMENT '栏目图片',
  "href" varchar(255) DEFAULT NULL COMMENT '链接',
  "target" varchar(20) DEFAULT NULL COMMENT '目标',
  "description" varchar(255) DEFAULT NULL COMMENT '描述',
  "keywords" varchar(255) DEFAULT NULL COMMENT '关键字',
  "sort" int(11) DEFAULT '30' COMMENT '排序（升序）',
  "in_menu" tinyint(1) DEFAULT '1' COMMENT '是否在导航中显示',
  "in_list" tinyint(1) DEFAULT '1' COMMENT '是否在分类页中显示列表',
  "show_modes" tinyint(2) DEFAULT '0' COMMENT '展现方式',
  "allow_comment" tinyint(1) DEFAULT NULL COMMENT '是否允许评论',
  "is_audit" tinyint(1) DEFAULT NULL COMMENT '是否需要审核',
  "custom_list_view" varchar(255) DEFAULT NULL COMMENT '自定义列表视图',
  "custom_content_view" varchar(255) DEFAULT NULL COMMENT '自定义内容视图',
  	  "view_config" text COMMENT '视图配置',

  "create_by" varchar(64) DEFAULT NULL COMMENT '创建者',
  "create_time" datetime DEFAULT NULL COMMENT '创建时间',
  "update_by" varchar(64) DEFAULT NULL COMMENT '更新者',
  "update_time" datetime DEFAULT NULL COMMENT '更新时间',
  "remarks" varchar(255) DEFAULT NULL COMMENT '备注信息',
  "deleted" tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  KEY "cms_category_parent_id" ("parent_id"),
  KEY "cms_category_module" ("module"),
  KEY "cms_category_name" ("name"),
  KEY "cms_category_sort" ("sort"),
  KEY "cms_category_del_flag" ("deleted"),
  KEY "cms_category_office_id" ("office_id"),
  KEY "cms_category_site_id" ("site_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "cms_comment"
--

DROP TABLE IF EXISTS "cms_comment";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "cms_comment" (
  "id" bigint(64) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '编号' ,
  "category_id" bigint(64) NOT NULL COMMENT '栏目编号',
  "content_id" bigint(64) NOT NULL COMMENT '栏目内容的编号',
  "title" varchar(255) DEFAULT NULL COMMENT '栏目内容的标题',
  "content" varchar(255) DEFAULT NULL COMMENT '评论内容',
  "name" varchar(100) DEFAULT NULL COMMENT '评论姓名',
  "ip" varchar(100) DEFAULT NULL COMMENT '评论IP',
  "audit_user_id" varchar(64) DEFAULT NULL COMMENT '审核人',
  "audit_time" datetime DEFAULT NULL COMMENT '审核时间',
  "create_by" varchar(64) DEFAULT NULL COMMENT '创建者',
  "create_time" datetime DEFAULT NULL COMMENT '创建时间',
  "update_by" varchar(64) DEFAULT NULL COMMENT '更新者',
  "update_time" datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  "remarks" varchar(255) DEFAULT NULL COMMENT '备注信息',
  "deleted" tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记(1删除1发布2审核)',
  KEY "cms_comment_category_id" ("category_id"),
  KEY "cms_comment_content_id" ("content_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: rising-waves
-- ------------------------------------------------------
-- Server version	5.7.21
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,ANSI' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table "cms_article"
--

/*!40000 ALTER TABLE "cms_article" DISABLE KEYS */;
INSERT INTO "cms_article" VALUES (1,3,'文章标题标题标题标题','','green','','关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,',null,','','','1','2020-02-18 11:08:01','1','2020-02-18 11:08:11',NULL,1,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (2,3,'首页文章','','red','/jeesite_war_exploded/userfiles/1/_thumbs/images/cms/article/2020/02/Robby%20McCullough%20%202019-05-04%2006-54-36.jpg','关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,15,',1,2,','frontViewArticle','','1','2013-05-27 08:00:00','1','2020-02-18 11:17:29',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (3,3,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (4,3,'文章标题标题标题标题',NULL,'green',NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (5,3,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (6,3,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (7,4,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (8,4,'文章标题标题标题标题',NULL,'blue',NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (9,4,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (10,4,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (11,5,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (12,5,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (13,5,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (14,7,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 00:00:00','admin','2013-05-27 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (15,7,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (16,7,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (17,7,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (18,8,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (19,8,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (20,8,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (21,8,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (22,9,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (23,9,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (24,9,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (25,9,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (26,9,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (27,11,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (28,11,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (29,11,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (30,11,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (31,11,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (32,12,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (33,12,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (34,12,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (35,12,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (36,12,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (37,13,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (38,13,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (39,13,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (40,13,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (41,14,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (42,14,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (43,14,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (44,14,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (45,14,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (46,15,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (47,15,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (48,15,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (49,16,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (50,17,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (51,17,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (52,26,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "cms_article" VALUES (53,26,'文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2','摘要又称概要、内容提要，意思是摘录要点或摘录下来的要点。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。',0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE "cms_article" ENABLE KEYS */;

--
-- Dumping data for table "cms_article_data"
--

/*!40000 ALTER TABLE "cms_article_data" DISABLE KEYS */;
INSERT INTO "cms_article_data" VALUES (1,'<p>\r\n	文章内容内容内容内容</p>');
INSERT INTO "cms_article_data" VALUES (2,'<p>\r\n	文章内容内容内容<img alt=\"\" src=\"/jeesite_war_exploded/userfiles/1/images/cms/article/2020/02/Robby%20McCullough%20%202019-05-04%2006-54-36.jpg\" style=\"width: 1024px; height: 683px;\" />内容</p>');
INSERT INTO "cms_article_data" VALUES (3,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (4,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (5,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (6,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (7,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (8,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (9,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (10,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (11,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (12,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (13,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (14,'<p>文章内容内容内容内容</p>\r\n');
INSERT INTO "cms_article_data" VALUES (15,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (16,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (17,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (18,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (19,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (20,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (21,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (22,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (23,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (24,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (25,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (26,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (27,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (28,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (29,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (30,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (31,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (32,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (33,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (34,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (35,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (36,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (37,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (38,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (39,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (40,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (41,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (42,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (43,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (44,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (45,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (46,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (47,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (48,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (49,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (50,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (51,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (52,'文章内容内容内容内容');
INSERT INTO "cms_article_data" VALUES (53,'文章内容内容内容内容');
/*!40000 ALTER TABLE "cms_article_data" ENABLE KEYS */;

--
-- Dumping data for table "cms_category"
--

/*!40000 ALTER TABLE "cms_category" DISABLE KEYS */;
INSERT INTO "cms_category" VALUES (1,0,'0,',0,0,0,1,NULL,'顶级栏目',NULL,NULL,NULL,NULL,NULL,0,1,1,0,0,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (2,1,'0,1,',1,0,1,3,'article','组织机构','icon-list',NULL,NULL,NULL,NULL,10,1,1,0,0,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (3,2,'0,1,2,',2,1,1,3,'article','网站简介','icon-list',NULL,NULL,NULL,NULL,30,1,1,0,0,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (4,2,'0,1,2,',2,1,1,3,'article','内部机构','icon-list',NULL,NULL,NULL,NULL,40,1,1,0,0,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (5,2,'0,1,2,',2,1,1,3,'article','地方机构','icon-list',NULL,NULL,NULL,NULL,50,1,1,0,0,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,1);
INSERT INTO "cms_category" VALUES (6,1,'0,1,',1,0,1,3,'article','质量检验','icon-list',NULL,NULL,NULL,NULL,20,1,1,1,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (7,6,'0,1,6,',2,1,1,3,'article','产品质量','icon-list',NULL,NULL,NULL,NULL,30,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (8,6,'0,1,6,',2,1,1,3,'article','技术质量','icon-list',NULL,NULL,NULL,NULL,40,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (9,6,'0,1,6,',2,1,1,3,'article','工程质量','icon-list',NULL,NULL,NULL,NULL,50,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (10,1,'0,1,',1,0,1,4,'article','软件介绍','icon-list','','','','',20,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','542af910c05d4de2aa9e78d857efbfaf','2020-02-26 09:57:07','',0);
INSERT INTO "cms_category" VALUES (11,10,'0,1,10,',2,1,1,4,'article','网络工具','icon-list',NULL,NULL,NULL,NULL,30,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (12,10,'0,1,10,',2,1,1,4,'article','浏览工具','icon-list',NULL,NULL,NULL,NULL,40,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (13,10,'0,1,10,',2,1,1,4,'article','浏览辅助','icon-list',NULL,NULL,NULL,NULL,50,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (14,10,'0,1,10,',2,1,1,4,'article','网络优化','icon-list',NULL,NULL,NULL,NULL,50,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (15,10,'0,1,10,',2,1,1,4,'article','邮件处理','icon-list',NULL,NULL,NULL,NULL,50,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (16,10,'0,1,10,',2,1,1,4,'article','下载工具','icon-list',NULL,NULL,NULL,NULL,50,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (17,10,'0,1,10,',2,1,1,4,'article','搜索工具','icon-list',NULL,NULL,NULL,NULL,50,1,1,2,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (18,1,'0,1,',1,0,1,5,'link','友情链接','icon-list',NULL,NULL,NULL,NULL,90,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (19,18,'0,1,18,',2,1,1,5,'link','常用网站','icon-list',NULL,NULL,NULL,NULL,50,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (20,18,'0,1,18,',2,1,1,5,'link','门户网站','icon-list',NULL,NULL,NULL,NULL,50,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (21,18,'0,1,18,',2,1,1,5,'link','购物网站','icon-list',NULL,NULL,NULL,NULL,50,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (22,18,'0,1,18,',2,1,1,5,'link','交友社区','icon-list',NULL,NULL,NULL,NULL,50,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (23,18,'0,1,18,',2,1,1,5,'link','音乐视频','icon-list',NULL,NULL,NULL,NULL,50,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,0);
INSERT INTO "cms_category" VALUES (24,1,'0,1,',1,1,1,6,'link','百度一下','icon-list','https://www.baidu.com/','_blank','','',90,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','542af910c05d4de2aa9e78d857efbfaf','2020-02-26 16:55:15','',0);
INSERT INTO "cms_category" VALUES (25,1,'0,1,',1,1,1,6,'link','全文检索','icon-list','/search','','','',90,0,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','542af910c05d4de2aa9e78d857efbfaf','2020-02-26 16:01:00','',1);
INSERT INTO "cms_category" VALUES (26,1,'0,1,',1,1,2,6,'article','测试栏目','icon-list',NULL,NULL,NULL,NULL,90,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,1);
INSERT INTO "cms_category" VALUES (27,1,'0,1,',1,1,1,6,'article','公共留言','icon-list','/guestbook','','','',90,1,1,0,1,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','542af910c05d4de2aa9e78d857efbfaf','2020-02-26 16:01:09','',1);
/*!40000 ALTER TABLE "cms_category" ENABLE KEYS */;

--
-- Dumping data for table "cms_comment"
--

