/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : huaqi_zixun

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2019-07-12 14:10:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lee_comments
-- ----------------------------
DROP TABLE IF EXISTS `lee_comments`;
CREATE TABLE `lee_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(10) unsigned DEFAULT NULL COMMENT '主题id',
  `topic_type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '1为课程，2为集会，3为商品',
  `content` text COMMENT '评论内容',
  `from_uid` int(10) unsigned DEFAULT NULL COMMENT '评论者id，一般为会员表的id',
  `nickname` varchar(60) DEFAULT NULL COMMENT '冗余用户昵称',
  `thumb_img` varchar(255) DEFAULT NULL COMMENT '冗余用户头像',
  `is_top` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶评论，1为置顶，0为不置顶',
  `is_hot` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否为热评，1为热评',
  `like_num` int(5) unsigned DEFAULT '0' COMMENT '评论被点赞的次数',
  `reply_num` int(5) unsigned DEFAULT '0' COMMENT '评论被回复的次数',
  `is_reply` tinyint(2) unsigned DEFAULT '0' COMMENT '是否回复',
  `status` tinyint(2) unsigned NOT NULL COMMENT '评论状态，-1为删除，0为待审核，1为已发布',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`) USING BTREE,
  KEY `topic_type` (`topic_type`) USING BTREE,
  KEY `from_id` (`from_uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lee_comments
-- ----------------------------
INSERT INTO `lee_comments` VALUES ('6', '2', '1', '<p>测试回复Comments</p>', '1', null, null, '0', '0', '5', '1', '0', '0', '1556437595');
INSERT INTO `lee_comments` VALUES ('7', '2', '1', '<p>测试回复</p>', '1', null, null, '0', '0', '6', '1', '0', '1', '1556437696');
INSERT INTO `lee_comments` VALUES ('8', '2', '1', '<p>广告费</p>', '1', null, null, '0', '0', '11', '3', '0', '1', '1556437791');
INSERT INTO `lee_comments` VALUES ('9', '2', '1', '<p>发给对方</p>', '1', 'admin', '空', '0', '0', '20', '0', '0', '1', '1556437914');
INSERT INTO `lee_comments` VALUES ('10', '2', '1', '<p>jk.h.</p>', '1', 'admin', '空', '0', '0', '1', '0', '0', '1', '1556437956');
INSERT INTO `lee_comments` VALUES ('11', '1', '1', '<p>测试回复comments</p>', '1', 'admin', '空', '0', '0', '1', '0', '0', '1', '1556438081');
INSERT INTO `lee_comments` VALUES ('12', '1', '1', '<p>测试回复comments</p>', '1', 'admin', '空', '0', '0', '1', '0', '0', '1', '1556438105');
INSERT INTO `lee_comments` VALUES ('13', '3', '1', '<p>可以</p>', '1', 'admin', '空', '0', '0', '1', '1', '0', '1', '1556438731');
INSERT INTO `lee_comments` VALUES ('14', '3', '1', '<p>能</p>', '1', 'admin', '空', '0', '0', '2', '1', '0', '1', '1556438767');
INSERT INTO `lee_comments` VALUES ('15', '3', '1', '<p>能</p>', '1', 'admin', '空', '0', '0', '1', '2', '0', '1', '1556438781');
INSERT INTO `lee_comments` VALUES ('16', '3', '1', '<p>可以</p>', '1', 'admin', '空', '0', '0', '1', '0', '0', '1', '1556438862');
INSERT INTO `lee_comments` VALUES ('17', '3', '1', '<p>可以</p>', '1', 'admin', '空', '0', '0', '1', '0', '0', '1', '1556438892');
INSERT INTO `lee_comments` VALUES ('18', '3', '1', '<p>可以拉</p>', '1', 'admin', '空', '0', '0', '1', '0', '0', '1', '1556438942');
INSERT INTO `lee_comments` VALUES ('19', '4', '1', '<p>回答内容测试</p>', '1', 'admin', '空', '0', '0', '1', '9', '0', '1', '1556446067');
INSERT INTO `lee_comments` VALUES ('20', '2', '1', '<p>测试回复&nbsp;</p><table class=\"layui-table\" width=\"1139\" style=\"width: 998px;\"><tbody><tr style=\"transition: all 0.3s ease 0s;\" class=\"firstRow\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-color: rgb(226, 226, 226); position: relative; min-height: 20px; line-height: 20px;\">测试问题2</td></tr></tbody></table><p><br/></p>', '1', 'admin', '空', '0', '0', '2', '0', '0', '1', '1556446672');
INSERT INTO `lee_comments` VALUES ('21', '5', '1', '<h1 class=\"mod-title post-title\">《复联 4》在 Pornhub 的搜索量创下新高，最受欢迎的角色是……</h1><p><a target=\"_blank\" class=\"uclink\" href=\"https://www.tepintehui.com/u/1593\">爱范儿</a>\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em>04月26日 15:36</em>\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p><br/></p><p class=\"post-cover delay-mod\"><br/></p><p><img class=\"alignnone size-full wp-image-1204498\" src=\"/ueditor/php/upload/image/20190429/1556501857346620.jpg\" alt=\"\" width=\"1300\" height=\"650\"/><span class=\"fznmlbd\">ITVjYzY1MjgyOWY4MmM=</span></p><p>截至发稿前<span class=\"fznmlbd\">MDAwMDAwMDAwMHqNjtCP3LyVgaCZqrOKkGi8tbGi</span>，《复联 4》在中国的票房已经将近 13 亿<span class=\"fznmlbd\">KjVjYzY1MjgyOWY5YzE=</span>，随着周末到来<span class=\"fznmlbd\">XjVjYzY1MjgyOWY5Y2Y=</span>，这部漫威电影的票房可能又会迎来一轮暴涨<span class=\"fznmlbd\">JTVjYzY1MjgyOWZjOTU=</span>。<span class=\"fznmlbd\">6e9b5a88a48969601b40071d4681081e3e48bf02</span></p><p><img class=\"size-full wp-image-1204496 aligncenter\" src=\"/ueditor/php/upload/image/20190429/1556501857724440.jpg\" alt=\"\" width=\"690\" height=\"388\"/><span class=\"fznmlbd\">ITVjYzY1MjgyOWY4NGE=</span></p><p style=\"text-align: center;\">▲4 月 25 日晚上 8 点《复联 4》国内票房已经突破 10 亿<span class=\"fznmlbd\">a19cd610b49c6d6b87750323e6667460</span></p><p>目前《复联 4》已经在全球 25 个国家和地区上映<span class=\"fznmlbd\">MDAwMDAwMDAwMHmNjtCP3LyVgaCZqrOKkGi9pami</span>，并在多个市场创下影史首日记录<span class=\"fznmlbd\">8fe2e673c78a9dc5cb6a0ac5e955c15d17381f4b</span>。在《复联 4》引爆全球后<span class=\"fznmlbd\">QDVjYzY1MjgyOWY5ZWI=</span>，这部电影在全球最大的其中一家色情网站 Pornhub 上的搜索量也创下新高<span class=\"fznmlbd\">cd1a501f3ecf4fd1c13c3f1d1509d55e2c6178fc</span>。<span class=\"fznmlbd\">MDAwMDAwMDAwMHp9jtCP3LyVgaCZqrOKkGextcui</span></p><p>在互联网时代<span class=\"fznmlbd\">MDAwMDAwMDAwMHmzjtCP3LyVgaCZqrOKkGi9uLGi</span>，每一个热点的更迭都会通过网络平台流量的涨跌来体现<span class=\"fznmlbd\">MDAwMDAwMDAwMHqNjtCP3LyVgaCZqrOKkGi9zq2i</span>，而作为一个年访问量达到 335 亿次的色情网站<span class=\"fznmlbd\">0f1c522b55a1a528d7917d32aa5a508fef6dc5bd</span>，Pornhub 也成了一个互联网热点的风向标<span class=\"fznmlbd\">dcc695a11bea8659ffd4b6e20d063ef1</span>。<span class=\"fznmlbd\">JjVjYzY1MjgyOWY4NmY=</span></p><p>去年《复联 3》首映两天内<span class=\"fznmlbd\">MDAwMDAwMDAwMHqNjtCP3LyVgaCZqrOKkZuwta2i</span>，片中角色在 Pornhub 上的搜索量就激增 356%<span class=\"fznmlbd\">MDAwMDAwMDAwMH6QhtCEzLjdg3p7Zr6ghZ682KGi</span>。但这跟《复联 4》比起来根本不算什么<span class=\"fznmlbd\">MDAwMDAwMDAwMHqNjtCP3LyVgaCZqrOKkZuwy6mi</span>，这几天Pornhub 用户的搜索「复联」的次数比起 4 月 16 日一度暴涨 2921%<span class=\"fznmlbd\">MDAwMDAwMDAwMHmzjtCP3LyVgaCZqrOKkZuwzrGi</span>，仅「复仇者联盟」这一关键词最近 7 天比平常的搜索次数多出 200 万次<span class=\"fznmlbd\">b92a07b7e2226c658938f4a2c02abdba0016fa3b</span>。<span class=\"fznmlbd\">MDAwMDAwMDAwMH6QhtCEzLjdg3p7Zr6dnmewoqGi</span></p><p><img class=\"size-full wp-image-1204495 aligncenter\" src=\"/ueditor/php/upload/image/20190429/1556501858943428.png\" alt=\"\" width=\"620\" height=\"755\"/><span class=\"fznmlbd\">QDVjYzY1MjgyOWY4OTg=</span></p><p>跟去年一样<span class=\"fznmlbd\">JTVjYzY1MjgyOWZhNDU=</span>， Pornhub 这次也统计了网站上最受欢迎的十个《复联 4》角色<span class=\"fznmlbd\">XjVjYzY1MjgyOWZhNTM=</span>，但结果跟去年的《复联 3》不太一样<span class=\"fznmlbd\">3ab2d1ebcfb1e78b5d8178369c1a924514cb205a</span>。<span class=\"fznmlbd\">MDAwMDAwMDAwMHqjjtCP3LyVgaCZqrOKkGeyuKmi</span></p><p><img class=\"size-full wp-image-1204494 aligncenter\" src=\"/ueditor/php/upload/image/20190429/1556501858452264.png\" alt=\"\" width=\"620\" height=\"732\"/></p><p>【转载声明】作者：爱范儿，链接：https://www.tepintehui.com/detail/123426?ce，来源：特品特惠，著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</p><p><br/></p>', '1', 'admin', '空', '0', '0', '2', '0', '0', '1', '1556501861');
INSERT INTO `lee_comments` VALUES ('22', '5', '1', '<p>测试回复数量</p>', '1', 'admin', '空', '0', '0', '1', '1', '0', '1', '1556507525');
INSERT INTO `lee_comments` VALUES ('23', '6', '1', '<p>的点点滴滴</p>', '1', 'admin', '空', '0', '0', '0', '0', '0', '1', '1556508413');
INSERT INTO `lee_comments` VALUES ('24', '8', '1', '<p>测试回答1</p>', '1', 'admin', '空', '0', '0', '1', '0', '0', '1', '1556508437');
INSERT INTO `lee_comments` VALUES ('25', '8', '1', '<p>测试回答2</p>', '1', 'admin', '空', '0', '0', '0', '0', '0', '1', '1556508445');
INSERT INTO `lee_comments` VALUES ('26', '8', '1', '<p>测试回答3</p>', '1', 'admin', '空', '0', '0', '1', '1', '0', '1', '1556508449');
INSERT INTO `lee_comments` VALUES ('27', '8', '1', '<p>测试回答4</p>', '1', 'admin', '空', '0', '0', '0', '1', '0', '1', '1556508453');
INSERT INTO `lee_comments` VALUES ('28', '8', '1', '<p>测试回答5</p>', '1', 'admin', '空', '0', '0', '0', '0', '0', '1', '1556508458');
INSERT INTO `lee_comments` VALUES ('29', '8', '1', '<p>测试回答6</p>', '1', 'admin', '空', '0', '0', '0', '1', '0', '1', '1556508462');
INSERT INTO `lee_comments` VALUES ('30', '7', '1', '<p>点赞拉&nbsp;</p>', '1', 'admin', '空', '0', '0', '1', '3', '0', '1', '1556532453');
INSERT INTO `lee_comments` VALUES ('31', '9', '1', '<p>一级回复 <span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.33);\">最新测试问题</span></p>', '1', 'admin', '空', '0', '0', '0', '0', '0', '1', '1556610744');
INSERT INTO `lee_comments` VALUES ('32', '9', '1', '<p>一级回复2&nbsp;<span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.33);\">最新测试问题</span></p>', '1', 'admin', '空', '0', '0', '0', '2', '0', '1', '1556610756');
INSERT INTO `lee_comments` VALUES ('33', '4', '1', '<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.33);\">1级&nbsp; 回答内容测试</span></p>', '1', 'admin', '空', '0', '0', '0', '1', '0', '1', '1556611854');
INSERT INTO `lee_comments` VALUES ('34', '9', '1', '<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.89);\">一级回复3&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.33);\">最新测试问题</span></p>', '1', 'admin', '空', '0', '0', '0', '1', '0', '1', '1556612142');
INSERT INTO `lee_comments` VALUES ('35', '9', '1', '<table class=\"layui-table\" width=\"1139\" style=\"width: 998px;\"><tbody><tr style=\"transition: all 0.3s ease 0s;\" class=\"firstRow\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-color: rgb(226, 226, 226); position: relative; min-height: 20px; line-height: 20px;\">最新测试问题 楼层&nbsp;&nbsp;</td></tr></tbody></table><p><br/></p>', '1', 'admin', '空', '0', '0', '1', '1', '0', '1', '1556613214');
INSERT INTO `lee_comments` VALUES ('36', '9', '1', '<table class=\"layui-table\" width=\"1699\" style=\"width: 998px;\"><tbody><tr style=\"transition: all 0.3s ease 0s; background-color: rgb(242, 242, 242) !important;\" class=\"firstRow\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-color: rgb(226, 226, 226); position: relative; min-height: 20px; line-height: 20px;\">一级&nbsp; 1&nbsp; 回复&nbsp; admin888添加</td></tr></tbody></table><p><br/></p>', '13', 'admin888', '空', '0', '0', '1', '0', '0', '1', '1556618490');
INSERT INTO `lee_comments` VALUES ('37', '10', '1', '<p>等你你你方法</p>', '15', '测试组长', '空', '0', '0', '16', '1', '0', '1', '1557047663');
INSERT INTO `lee_comments` VALUES ('38', '10', '1', '<p>多多的</p>', '15', '测试组长', '空', '0', '0', '0', '1', '0', '1', '1557048251');
INSERT INTO `lee_comments` VALUES ('39', '10', '1', '<p>和妇女们废话吗</p>', '15', '测试组长', '空', '0', '0', '0', '0', '0', '1', '1557049057');
INSERT INTO `lee_comments` VALUES ('40', '10', '1', '<p>反反复复</p>', '15', '测试组长', '空', '0', '0', '0', '0', '0', '1', '1557049565');
INSERT INTO `lee_comments` VALUES ('41', '10', '1', '<p>发v备份</p>', '15', '测试组长', '空', '0', '0', '0', '0', '0', '1', '1557049632');
INSERT INTO `lee_comments` VALUES ('42', '10', '1', '<p>发布vdfb</p>', '15', '测试组长', '空', '0', '0', '1', '1', '0', '1', '1557049641');

-- ----------------------------
-- Table structure for lee_comments_reply
-- ----------------------------
DROP TABLE IF EXISTS `lee_comments_reply`;
CREATE TABLE `lee_comments_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) unsigned DEFAULT NULL COMMENT '评论id',
  `reply_type` tinyint(2) unsigned DEFAULT '1' COMMENT '1为回复评论，2为回复别人的回复',
  `reply_id` int(10) unsigned DEFAULT NULL COMMENT '回复目标id，reply_type为1时，是comment_id，reply_type为2时为回复表的id',
  `content` text COMMENT '回复内容',
  `to_uid` int(10) unsigned DEFAULT NULL COMMENT '回复目标id',
  `from_uid` int(10) unsigned DEFAULT NULL COMMENT '回复用户id',
  `from_thumb_img` varchar(255) DEFAULT NULL COMMENT '回复者的头像',
  `from_nickname` varchar(50) DEFAULT NULL COMMENT '回复者的昵称',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '评论时间',
  `to_nickname` varchar(50) DEFAULT NULL COMMENT '冗余回复对象的昵称',
  `is_author` tinyint(2) unsigned DEFAULT NULL COMMENT '0为普通回复，1为后台管理员回复',
  `like_num` int(5) unsigned DEFAULT '0' COMMENT '评论被点赞的次数',
  `reply_num` int(5) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`) USING BTREE,
  KEY `from_uid` (`from_uid`) USING BTREE,
  KEY `to_uid` (`to_uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lee_comments_reply
-- ----------------------------
INSERT INTO `lee_comments_reply` VALUES ('1', '4', '1', '19', '<p>回复 回答内容</p>', '1', '1', '空', 'admin', '1556589650', 'admin', '0', '0', null);
INSERT INTO `lee_comments_reply` VALUES ('2', '4', '1', '19', '<p>测试回答内容2</p>', '1', '1', '空', 'admin', '1556591011', 'admin', '0', '0', null);
INSERT INTO `lee_comments_reply` VALUES ('3', '4', '1', '19', '<p>测试回答内容3</p>', '1', '1', '空', 'admin', '1556591019', 'admin', '0', '0', null);
INSERT INTO `lee_comments_reply` VALUES ('4', '4', '1', '19', '<p>测试回答内容4</p>', '1', '1', '空', 'admin', '1556591023', 'admin', '0', '0', null);
INSERT INTO `lee_comments_reply` VALUES ('5', '4', '1', '19', '<p>测试回答内容5</p>', '1', '1', '空', 'admin', '1556591028', 'admin', '0', '0', null);
INSERT INTO `lee_comments_reply` VALUES ('6', '4', '1', '19', '<p>测试回答内容6</p>', '1', '1', '空', 'admin', '1556591033', 'admin', '0', '0', '1');
INSERT INTO `lee_comments_reply` VALUES ('7', '4', '1', '19', '<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">回复 回答内容7</span></p>', '1', '1', '空', 'admin', '1556593749', 'admin', '0', null, '1');
INSERT INTO `lee_comments_reply` VALUES ('8', '4', '1', '19', '<table class=\"layui-table\" width=\"1139\" style=\"width: 998px;\"><tbody><tr style=\"transition: all 0.3s ease 0s; background-color: rgb(242, 242, 242) !important;\" class=\"firstRow\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-color: rgb(226, 226, 226); position: relative; min-height: 20px; line-height: 20px;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><span style=\"background-color: rgb(255, 255, 255);\">回复 回答内容8</span></p></td></tr></tbody></table><p><br/></p>', '1', '1', '空', 'admin', '1556594186', 'admin', '0', '1', '3');
INSERT INTO `lee_comments_reply` VALUES ('9', '4', '2', '8', '<p>二级回复&nbsp;&nbsp;<span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">回复 回答内容8</span></p>', '1', '1', '空', 'admin', '1556594950', 'admin', '0', '1', '0');
INSERT INTO `lee_comments_reply` VALUES ('10', '4', '2', '8', '<p>二级回复&nbsp;&nbsp;<span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">回复 回答内容8</span></p>', '1', '1', '空', 'admin', '1556595269', 'admin', '0', '1', '0');
INSERT INTO `lee_comments_reply` VALUES ('11', '4', '2', '7', '<p>二级回复 回答内容7</p>', '1', '1', '空', 'admin', '1556595643', 'admin', '0', '0', '0');
INSERT INTO `lee_comments_reply` VALUES ('12', '4', '1', '19', '<p>回复 回答内容9</p>', '1', '1', '空', 'admin', '1556595664', 'admin', '0', '1', '0');
INSERT INTO `lee_comments_reply` VALUES ('13', '4', '2', '8', '<p>三级 回复&nbsp; 回答内容8</p>', '1', '1', '空', 'admin', '1556602295', 'admin', '0', '1', '1');
INSERT INTO `lee_comments_reply` VALUES ('14', '4', '2', '8', '<p>三级回复 回答内容8 2</p>', '1', '1', '空', 'admin', '1556602344', 'admin', '0', '1', '1');
INSERT INTO `lee_comments_reply` VALUES ('15', '4', '2', '14', '<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.106);\">四级回复&nbsp; <span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.89);\">三级</span>级回复 回答内容8 2</span></p>', '1', '1', '空', 'admin', '1556605172', 'admin', '0', '1', '2');
INSERT INTO `lee_comments_reply` VALUES ('16', '4', '2', '15', '<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.106);\">五级回复11111&nbsp;&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.89);\">三级</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.106);\">级回复 回答内容8 2</span></p>', '1', '1', '空', 'admin', '1556607782', 'admin', '0', '1', '0');
INSERT INTO `lee_comments_reply` VALUES ('17', '4', '2', '15', '<p>五级回复222222&nbsp; &nbsp;<span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.106);\">四级回复&nbsp;&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.89);\">三级</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.106);\">级回复 回答内容8 2</span></p>', '1', '1', '空', 'admin', '1556607810', 'admin', '0', '1', '0');
INSERT INTO `lee_comments_reply` VALUES ('18', '4', '2', '6', '<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(242, 242, 242);\">二级回复1&nbsp; 测试回答内容6</span></p>', '1', '1', '空', 'admin', '1556608122', 'admin', '0', '0', '0');
INSERT INTO `lee_comments_reply` VALUES ('19', '4', '1', '33', '<p>2级&nbsp; 回复<span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.33);\">1级&nbsp; 回答内容测试</span></p>', '1', '1', '空', 'admin', '1556611877', 'admin', '0', '1', '0');
INSERT INTO `lee_comments_reply` VALUES ('20', '9', '1', '34', '<table class=\"layui-table\" width=\"1139\" style=\"width: 998px;\"><tbody><tr style=\"transition: all 0.3s ease 0s;\" class=\"firstRow\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-color: rgb(226, 226, 226); position: relative; min-height: 20px; line-height: 20px;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><span style=\"background-color: rgba(242, 242, 242, 0.89);\">二级回复 1&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.89);\">一级回复3&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.33);\">最新测试问题</span><span style=\"background-color: rgba(242, 242, 242, 0.33);\"></span></p></td></tr></tbody></table><p><br/></p>', '1', '1', '空', 'admin', '1556612233', 'admin', '0', '0', '0');
INSERT INTO `lee_comments_reply` VALUES ('21', '9', '1', '32', '<p>二级回复 2&nbsp;<span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">二级回复&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.33);\">最新测试问题</span></p>', '1', '1', '空', 'admin', '1556612294', 'admin', '0', '0', '0');
INSERT INTO `lee_comments_reply` VALUES ('22', '9', '1', '32', '<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">二级回复 3&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">一级回复2&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.33);\">最新测试问题</span></p>', '1', '1', '空', 'admin', '1556612383', 'admin', '0', '0', '1');
INSERT INTO `lee_comments_reply` VALUES ('23', '9', '2', '22', '<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">三级回复&nbsp; 1&nbsp; 二级回复 3&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">一级回复2&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgba(242, 242, 242, 0.33);\">最新测试问题</span></p>', '1', '1', '空', 'admin', '1556612409', 'admin', '0', '0', '0');
INSERT INTO `lee_comments_reply` VALUES ('24', '4', '2', '13', '<p>四级回复&nbsp;<span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(242, 242, 242);\">三级 回复&nbsp; 回答内容8</span></p>', '1', '1', '空', 'admin', '1556612863', 'admin', '0', '0', '0');
INSERT INTO `lee_comments_reply` VALUES ('25', '9', '1', '35', '<table class=\"layui-table\" width=\"1699\" style=\"width: 998px;\"><tbody><tr style=\"transition: all 0.3s ease 0s; background-color: rgb(242, 242, 242) !important;\" class=\"firstRow\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-color: rgb(226, 226, 226); position: relative; min-height: 20px; line-height: 20px;\">测试admin888添加</td></tr></tbody></table><p><br/></p>', '1', '13', '空', 'admin888', '1556618517', 'admin', '0', '1', '0');
INSERT INTO `lee_comments_reply` VALUES ('26', '10', '1', '37', '<p>哈哈哈</p>', '15', '15', '空', '测试组长', '1557047756', '测试组长', '0', '2', '1');
INSERT INTO `lee_comments_reply` VALUES ('27', '10', '2', '26', '<p>发含苞待放能不对你</p>', '15', '15', '空', '测试组长', '1557048076', '测试组长', '0', '1', '1');
INSERT INTO `lee_comments_reply` VALUES ('28', '10', '1', '38', '<p>发发发</p>', '15', '15', '空', '测试组长', '1557049046', '测试组长', '0', '0', '0');
INSERT INTO `lee_comments_reply` VALUES ('29', '10', '2', '27', '<p>和煤化工玫瑰花吗</p>', '15', '15', '空', '测试组长', '1557049074', '测试组长', '0', '0', '1');
INSERT INTO `lee_comments_reply` VALUES ('30', '10', '2', '29', '<p>和每个和每个</p>', '15', '15', '空', '测试组长', '1557049132', '测试组长', '0', '0', '3');
INSERT INTO `lee_comments_reply` VALUES ('31', '10', '2', '30', '<p>发给你发给你</p>', '15', '15', '空', '测试组长', '1557049166', '测试组长', '0', '0', '0');
INSERT INTO `lee_comments_reply` VALUES ('32', '10', '2', '30', '<p>发给你家发麻你</p>', '15', '15', '空', '测试组长', '1557049300', '测试组长', '0', '0', '0');
INSERT INTO `lee_comments_reply` VALUES ('33', '10', '2', '30', '<p>地方吧换地方</p>', '15', '15', '空', '测试组长', '1557049544', '测试组长', '0', '0', '0');
INSERT INTO `lee_comments_reply` VALUES ('34', '10', '1', '42', '<p>GV吧吧v</p>', '15', '15', '空', '测试组长', '1557050343', '测试组长', '0', '0', '0');

-- ----------------------------
-- Table structure for lee_config
-- ----------------------------
DROP TABLE IF EXISTS `lee_config`;
CREATE TABLE `lee_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config` text COMMENT '配置信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='配置信息';

-- ----------------------------
-- Records of lee_config
-- ----------------------------
INSERT INTO `lee_config` VALUES ('2', '{\"title\":\"Lee\'s BLOG\",\"logo\":\"logo\\/logo.jpg\",\"keyword\":\"Lee\'s Blog\",\"desc\":\"技术笔记，爱好分享\",\"phone\":\"13693331169\",\"address\":\"北京 ▪ 朝阳\",\"email\":\"leehuadao@163.com\",\"author\":\"Lee\",\"state\":\"1\",\"closeinfo\":\"网站维护中，请稍后重试！\"}');

-- ----------------------------
-- Table structure for lee_introduction
-- ----------------------------
DROP TABLE IF EXISTS `lee_introduction`;
CREATE TABLE `lee_introduction` (
  `iid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iname` varchar(255) NOT NULL,
  `ifile` text NOT NULL,
  `content` text NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `add_time` varchar(255) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lee_introduction
-- ----------------------------
INSERT INTO `lee_introduction` VALUES ('16', '今日头条各地区政策', '', '<p>兰州30、吉林30、海南30、扬州30、黑龙江30、宁夏30、辽宁25、新疆25、安徽20、常州21、内蒙10、贵州26、湖南25、天津20、河北本地10</p>', null, '1560826567', '16');
INSERT INTO `lee_introduction` VALUES ('17', '今日头条禁投行业', '', '<p>禁投行业 &nbsp; &nbsp;</p><p>今日头条竞品类、社交类、金融、众筹、涉毒、违法集邮票品、违法书刊、影视剧、代考代写论文、枪支弹药及其他武器、 &nbsp; &nbsp;</p><p>危险物品、高危安防设备、警用和军用设备、管制刀具、国家保护野生动植物、博彩、非法所得物、烟草制品、流通人民币 &nbsp; &nbsp;</p><p>妨害交通安全秩序的产品、侵犯他人知识产权的产品、偷逃税款产品、非法接入信号产品、非法套现、非法网络相关、 &nbsp; &nbsp;</p><p>侵犯他人隐私的器材、窃取他人财产权益的产品、邪教组织类、宗教类、其他违法违规的产品或服务、收账类、境外社团 &nbsp; &nbsp;</p><p>增高产品及服务、 &nbsp; &nbsp;</p><p><br/></p>', null, '1560826647', '16');
INSERT INTO `lee_introduction` VALUES ('18', '今日头条普通化妆品资质要求', '', '<p>普通化妆品： &nbsp; &nbsp;1.生产方《化妆品生产许可证》 &nbsp; &nbsp;</p><p>2.代生产合同或经销证明。 &nbsp; &nbsp;</p><p>3、国产非特殊用途化妆品食药监查询截图 &nbsp; &nbsp;</p><p>4、如果涉及进口化妆品，需要补充提供国务院食药监行政部门备案登记即《进口（非）特殊用途化妆品备案凭证》 &nbsp; &nbsp;</p><p>5、提供产品外包装图片照片，需清晰体现产品品牌信息、化妆品产品名称、批件编号、生产方公司名称 &nbsp; &nbsp;</p><p>6、商标证。 &nbsp; &nbsp;</p><p><br/></p>', null, '1560826876', '16');
INSERT INTO `lee_introduction` VALUES ('19', '今日头条特殊化妆品资质要求', '', '<p>特殊化妆品 &nbsp; &nbsp;（育发类、染发类、烫发类、脱毛类、美乳类、健美类、除臭类、祛斑类和防晒类）； &nbsp; &nbsp;</p><p>1、生产方《化妆品生产许可证》 &nbsp; &nbsp;</p><p>2、代生产合同或经销证明 &nbsp; &nbsp;</p><p>3、《国产特殊用途化妆品行政许可批件》（可在食药监总局网站查询） &nbsp; &nbsp;</p><p>4、如果涉及进口化妆品，需要补充提供国务院食药监行政部门登记备案以及《进口特殊用途化妆品行政许可批件》 &nbsp; &nbsp;</p><p>5、提供产品外包装图片照片、需清晰体现产品品牌信息。化妆品产品名称、批件编号、生产方公司名称 &nbsp; &nbsp;</p><p>6、商标证 &nbsp; &nbsp;</p><p><br/></p>', null, '1560826896', '16');
INSERT INTO `lee_introduction` VALUES ('20', '今日头条招商加盟行业资质要求', '', '<p>招商加盟 &nbsp; &nbsp;1、公司背景：包括公司简介、官网、业务范围、注册资本、信用情况。 &nbsp; &nbsp;</p><p>2、广告主主体证件：营业执照 &nbsp; &nbsp;</p><p>3、需提供加盟具体品牌，如为广告主自有品牌需提供《商标注册证》；如非广告主自有品牌需提供《商标注册证》及商标全国独家授权书。 &nbsp; &nbsp;</p><p>4、加盟店面实体店照片（最少3家以上）或3份加盟合同（需加盟商与广告主签署） &nbsp; &nbsp;</p><p>5、不接受招商联展平台投放。如U88等招商联展网站、 &nbsp; &nbsp;</p><p>6、招商加盟需先满足对应行业资质要求 &nbsp; &nbsp;</p><p>7、不接受金融类客户、医疗类、线上棋牌类等高危客户招商加盟投放。 &nbsp; &nbsp;</p><p><br/></p>', null, '1560826916', '16');
INSERT INTO `lee_introduction` VALUES ('21', '今日头条酒类行业资质要求', '', '<p>酒类 &nbsp; &nbsp;1、广告主《食品经营许可证》 &nbsp; &nbsp;</p><p>2、生产商的《酒类生产许可证》或《全国工业产品生产许可证》（含酒类） &nbsp; &nbsp;</p><p>3、经国家规定或认可的省辖市以上食品质量检测机构出具的该酒符合质量标准的检验证明。 &nbsp; &nbsp;</p><p>4、非广告主生产需提供经销授权或委托生产合同 &nbsp; &nbsp;</p><p>5、涉及进口酒类需提供《报关单》及《检验检疫证明》 &nbsp; &nbsp;</p><p><br/></p>', null, '1560826934', '16');
INSERT INTO `lee_introduction` VALUES ('22', '腾讯系广告  效果类和品牌类区分', '', '<p>一级行业 &nbsp; &nbsp;二级行业 &nbsp; &nbsp;效果or品牌 &nbsp; &nbsp;</p><p>电商平台 &nbsp; &nbsp;N/A &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>电商平台 &nbsp; &nbsp;综合电商 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>电商平台 &nbsp; &nbsp;返利平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>电商平台 &nbsp; &nbsp;电商导购 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>招商加盟服务 &nbsp; &nbsp;N/A &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>招商加盟服务 &nbsp; &nbsp;美容减肥加盟 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>招商加盟服务 &nbsp; &nbsp;餐饮服务加盟 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>招商加盟服务 &nbsp; &nbsp;教育培训加盟 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>招商加盟服务 &nbsp; &nbsp;成人用品加盟 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>招商加盟服务 &nbsp; &nbsp;医药保健加盟 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>招商加盟服务 &nbsp; &nbsp;汽车产品加盟 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>招商加盟服务 &nbsp; &nbsp;招商加盟（平台类） &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>招商加盟服务 &nbsp; &nbsp;生活服务加盟 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>招商加盟服务 &nbsp; &nbsp;养殖加盟 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>招商加盟服务 &nbsp; &nbsp;服饰礼品加盟 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>婚恋 &nbsp; &nbsp;N/A &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>婚恋 &nbsp; &nbsp;婚恋交友 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>婚恋 &nbsp; &nbsp;婚庆服务 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>婚恋 &nbsp; &nbsp;婚纱摄影 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>婚恋 &nbsp; &nbsp;婚纱礼服 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>教育 &nbsp; &nbsp;N/A &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>教育 &nbsp; &nbsp;学历教育机构 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>教育 &nbsp; &nbsp;学历教育平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>教育 &nbsp; &nbsp;非学历教育平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>教育 &nbsp; &nbsp;基础教育（非学历机构） &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>教育 &nbsp; &nbsp;职业教育（非学历机构） &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>教育 &nbsp; &nbsp;语言培训（非学历机构） &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>教育 &nbsp; &nbsp;学历培训（非学历机构） &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>教育 &nbsp; &nbsp;才艺培训 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>教育 &nbsp; &nbsp;教学辅助工具 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>教育 &nbsp; &nbsp;留学出国 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>教育 &nbsp; &nbsp;早期教育 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;N/A &nbsp; &nbsp;N/A &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;基金 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;证券 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;银行服务 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;保险 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;贵金属 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;典当 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;担保 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;P2P网贷平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;投资咨询 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;信托 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;资产管理 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;标准金融 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;大宗商品交易/现货 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;金融综合线上平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;信用卡 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;第三方支付 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;小额贷款 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;汽车金融 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;期货期权 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;外汇 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;征信机构 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;商业保理 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>金融 &nbsp; &nbsp;金融辅助工具 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>旅游 &nbsp; &nbsp;N/A &nbsp; &nbsp;N/A &nbsp; &nbsp;</p><p>旅游 &nbsp; &nbsp;酒店住宿 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>旅游 &nbsp; &nbsp;旅行社 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>旅游 &nbsp; &nbsp;景点/景区门票 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>旅游 &nbsp; &nbsp;OTA线上平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>旅游 &nbsp; &nbsp;旅游局 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>护肤彩妆 &nbsp; &nbsp;N/A &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>护肤彩妆 &nbsp; &nbsp;非特殊用途化妆品-保养护肤 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>护肤彩妆 &nbsp; &nbsp;非特殊用途化妆品-美发护发 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>护肤彩妆 &nbsp; &nbsp;非特殊用途化妆品-香水 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>护肤彩妆 &nbsp; &nbsp;非特殊用途化妆品-彩妆 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>护肤彩妆 &nbsp; &nbsp;特殊用途化妆品 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>护肤彩妆 &nbsp; &nbsp;美容工具 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>护肤彩妆 &nbsp; &nbsp;护肤彩妆线上平台 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>食品 &nbsp; &nbsp;N/A &nbsp; &nbsp;N/A &nbsp; &nbsp;</p><p>食品 &nbsp; &nbsp;休闲食品 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>食品 &nbsp; &nbsp;粮油调味速食 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>食品 &nbsp; &nbsp;饮品 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>食品 &nbsp; &nbsp;生鲜 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>食品 &nbsp; &nbsp;酒水 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>食品 &nbsp; &nbsp;食品线上平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>箱包 &nbsp; &nbsp;N/A &nbsp; &nbsp;N/A &nbsp; &nbsp;</p><p>箱包 &nbsp; &nbsp;女包 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>箱包 &nbsp; &nbsp;男包 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>箱包 &nbsp; &nbsp;功能箱包 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>箱包 &nbsp; &nbsp;箱包线上平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>运动户外 &nbsp; &nbsp;N/A &nbsp; &nbsp;N/A &nbsp; &nbsp;</p><p>运动户外 &nbsp; &nbsp;户外装备 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>运动户外 &nbsp; &nbsp;健身器械 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>运动户外 &nbsp; &nbsp;体育用品 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>运动户外 &nbsp; &nbsp;运动户外线上平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>珠宝钟表 &nbsp; &nbsp;N/A &nbsp; &nbsp;N/A &nbsp; &nbsp;</p><p>珠宝钟表 &nbsp; &nbsp;珠宝 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>珠宝钟表 &nbsp; &nbsp;钟表 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>珠宝钟表 &nbsp; &nbsp;珠宝钟表线上平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;N/A &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;保健用品 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;保健食品 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;美容减肥保健用品 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;美容减肥保健食品 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;特殊保健品 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;医疗线上平台 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;健康资讯平台 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;医疗科室 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;心理健康 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;药品交易 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;药品生产研发 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;药品信息 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;医疗器械生产 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;医疗器械销售 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;假肢生产装配 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;美容整形机构 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>医疗健康 &nbsp; &nbsp;体检机构 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;N/A &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;策划咨询 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;对公代理服务 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;财务税务 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;出国服务 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;调查 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;拍卖 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;公关 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;配音 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;翻译 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;布景会展 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;招聘猎头 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;营销机构 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;印刷 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;广告包装 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>商务服务 &nbsp; &nbsp;建站服务 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>亲子 &nbsp; &nbsp;N/A &nbsp; &nbsp;N/A &nbsp; &nbsp;</p><p>亲子 &nbsp; &nbsp;育儿社区（孕期/胎教/优生） &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>亲子 &nbsp; &nbsp;童装童鞋 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>亲子 &nbsp; &nbsp;母婴用品 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>亲子 &nbsp; &nbsp;婴幼儿食品 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>亲子 &nbsp; &nbsp;孕期护理 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>亲子 &nbsp; &nbsp;亲子线上平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>亲子 &nbsp; &nbsp;儿童用品 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;N/A &nbsp; &nbsp;N/A &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;家政服务 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;餐饮美食 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;美容美发 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;运动健身 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;休闲娱乐 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;演出票务 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;卡券消费 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;百货商店 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;开锁 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;物流服务 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;物业服务 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;生活服务线上平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;爱好收藏 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;乐器 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;鲜花植物 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;宠物/宠物周边 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;摄影写真 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;出行服务 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;出行票务预订 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;搬家 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;占卜起名 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>生活服务 &nbsp; &nbsp;非汽车交易 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>法律服务 &nbsp; &nbsp;N/A &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>法律服务 &nbsp; &nbsp;司法鉴定 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>法律服务 &nbsp; &nbsp;律师事务所 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>法律服务 &nbsp; &nbsp;公证 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>房地产 &nbsp; &nbsp;N/A &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>房地产 &nbsp; &nbsp;房地产开发商 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>房地产 &nbsp; &nbsp;房地产个人交易租赁 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>房地产 &nbsp; &nbsp;房地产中介 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>房地产 &nbsp; &nbsp;房地产线上平台 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>交通运输 &nbsp; &nbsp;N/A &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>交通运输 &nbsp; &nbsp;航空服务 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>交通运输 &nbsp; &nbsp;铁路服务 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>交通运输 &nbsp; &nbsp;公路服务 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>交通运输 &nbsp; &nbsp;水路服务 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>节能环保 &nbsp; &nbsp;N/A &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>节能环保 &nbsp; &nbsp;污染处理 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>节能环保 &nbsp; &nbsp;废旧回收 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>节能环保 &nbsp; &nbsp;节能设备 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>节能环保 &nbsp; &nbsp;环保设备 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>节能环保 &nbsp; &nbsp;环境评测 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>安全安保 &nbsp; &nbsp;N/A &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>安全安保 &nbsp; &nbsp;防盗报警 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>安全安保 &nbsp; &nbsp;保安安保 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>安全安保 &nbsp; &nbsp;警用装备 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>安全安保 &nbsp; &nbsp;门禁考勤 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>安全安保 &nbsp; &nbsp;交通消防 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>家居装修建材 &nbsp; &nbsp;N/A &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>家居装修建材 &nbsp; &nbsp;家装建材 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>家居装修建材 &nbsp; &nbsp;家具 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>家居装修建材 &nbsp; &nbsp;家居饰品 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>家居装修建材 &nbsp; &nbsp;家纺 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>家居装修建材 &nbsp; &nbsp;装修与设计 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>家居装修建材 &nbsp; &nbsp;家具建材线上平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>通讯虚拟 &nbsp; &nbsp;N/A &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>通讯虚拟 &nbsp; &nbsp;通信运营商 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>通讯虚拟 &nbsp; &nbsp;游戏充值 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>通讯虚拟 &nbsp; &nbsp;增值服务 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>通讯虚拟 &nbsp; &nbsp;通信设备 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>日用百货 &nbsp; &nbsp;N/A &nbsp; &nbsp;N/A &nbsp; &nbsp;</p><p>日用百货 &nbsp; &nbsp;家居日用 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>日用百货 &nbsp; &nbsp;厨具 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>日用百货 &nbsp; &nbsp;洗护用具 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>日用百货 &nbsp; &nbsp;女性护理 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>日用百货 &nbsp; &nbsp;日用百货线上平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>日用百货 &nbsp; &nbsp;休闲玩具 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>日用百货 &nbsp; &nbsp;成人用品 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>彩票 &nbsp; &nbsp;N/A &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>彩票 &nbsp; &nbsp;彩票 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>机构协会 &nbsp; &nbsp;N/A &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>机构协会 &nbsp; &nbsp;境内政府机关 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>机构协会 &nbsp; &nbsp;协会团体 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>机构协会 &nbsp; &nbsp;公益 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>机构协会 &nbsp; &nbsp;境外政府组织 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>网站门户 &nbsp; &nbsp;N/A &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>网站门户 &nbsp; &nbsp;新闻门户资讯社区 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>汽车 &nbsp; &nbsp;N/A &nbsp; &nbsp;N/A &nbsp; &nbsp;</p><p>汽车 &nbsp; &nbsp;汽车线上平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>汽车 &nbsp; &nbsp;车辆养护 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>汽车 &nbsp; &nbsp;汽车用品 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>汽车 &nbsp; &nbsp;汽车厂商 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>汽车 &nbsp; &nbsp;二手车经营 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>汽车 &nbsp; &nbsp;驾校 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>汽车 &nbsp; &nbsp;汽车-4S店/经销商 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>软件应用 &nbsp; &nbsp;N/A &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>软件应用 &nbsp; &nbsp;办公软件 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>软件应用 &nbsp; &nbsp;系统软件 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>软件应用 &nbsp; &nbsp;影音娱乐阅读 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>软件应用 &nbsp; &nbsp;摄影摄像 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>软件应用 &nbsp; &nbsp;天气日历 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>软件应用 &nbsp; &nbsp;社交 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>软件应用 &nbsp; &nbsp;网络电话 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>软件应用 &nbsp; &nbsp;网络直播 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>软件应用 &nbsp; &nbsp;地图导航 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>软件应用 &nbsp; &nbsp;体育健康 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;N/A &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;角色扮演 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;策略 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;体育 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;棋牌 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;音乐 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;模拟经营 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;休闲 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;益智 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;射击 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;养成 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;格斗 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;冒险 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;卡牌 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;竞速 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;综合游戏平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>游戏 &nbsp; &nbsp;MOBA &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>服饰鞋帽 &nbsp; &nbsp;N/A &nbsp; &nbsp;N/A &nbsp; &nbsp;</p><p>服饰鞋帽 &nbsp; &nbsp;女装 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>服饰鞋帽 &nbsp; &nbsp;男装 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>服饰鞋帽 &nbsp; &nbsp;贴身内衣 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>服饰鞋帽 &nbsp; &nbsp;家居服饰 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>服饰鞋帽 &nbsp; &nbsp;服装配饰 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>服饰鞋帽 &nbsp; &nbsp;鞋类 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>服饰鞋帽 &nbsp; &nbsp;袜类 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>服饰鞋帽 &nbsp; &nbsp;帽类 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>服饰鞋帽 &nbsp; &nbsp;服饰鞋帽原料 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>服饰鞋帽 &nbsp; &nbsp;服饰鞋帽线上平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>工业工程 &nbsp; &nbsp;N/A &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>工业工程 &nbsp; &nbsp;能源化工 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>工业工程 &nbsp; &nbsp;机械设备 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>工业工程 &nbsp; &nbsp;电子电工 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>农林牧渔 &nbsp; &nbsp;N/A &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>农林牧渔 &nbsp; &nbsp;兽医兽药 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>农林牧渔 &nbsp; &nbsp;农药化肥 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>农林牧渔 &nbsp; &nbsp;种植养殖 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>农林牧渔 &nbsp; &nbsp;园林景观 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>出版传媒 &nbsp; &nbsp;N/A &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>出版传媒 &nbsp; &nbsp;书籍杂志 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>出版传媒 &nbsp; &nbsp;音像影视 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>出版传媒 &nbsp; &nbsp;电视电台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>数码家电 &nbsp; &nbsp;N/A &nbsp; &nbsp;N/A &nbsp; &nbsp;</p><p>数码家电 &nbsp; &nbsp;电脑 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>数码家电 &nbsp; &nbsp;手机 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>数码家电 &nbsp; &nbsp;摄影摄像设备 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>数码家电 &nbsp; &nbsp;数码配件 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>数码家电 &nbsp; &nbsp;影音设备 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>数码家电 &nbsp; &nbsp;办公设备 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>数码家电 &nbsp; &nbsp;电子教育 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>数码家电 &nbsp; &nbsp;智能设备 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>数码家电 &nbsp; &nbsp;大家电 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>数码家电 &nbsp; &nbsp;生活电器 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>数码家电 &nbsp; &nbsp;数码家电线上平台 &nbsp; &nbsp;效果 &nbsp; &nbsp;</p><p>数码家电 &nbsp; &nbsp;电子游戏设备 &nbsp; &nbsp;品牌 &nbsp; &nbsp;</p><p>金融：基金，证券，典当，P2P网贷平台，投资咨询，资产管理，标准金融，大宗商品交易/现货，金融综合线上平台，信用卡，小额贷款，汽车金融为效果二级行业，其他为品牌二级行业<br/>旅游：景点/景区门票，旅游局为品牌二级行业，其他为效果二级行业<br/>食品：生鲜，食品线上平台为效果二级行业，其他为品牌二级行业<br/>运动户外：运动户外线上平台为效果二级行业，其他为品牌二级行业<br/>珠宝钟表：珠宝钟表线上平台为效果二级行业，其他为品牌二级行业<br/>亲子：亲子线上平台为效果二级行业，其他为品牌二级行业<br/>生活服务：百货商店为品牌二级行业，其他为效果二级行业<br/>家居装修建材：装修与设计，家具建材线上平台为效果二级行业，其他为品牌二级行业<br/>日用百货：日用百货线上平台为效果二级行业，其他为品牌二级行业<br/>汽车：汽车线上平台，二手车经营，驾校为效果二级行业，其他为品牌二级行业<br/>服饰鞋帽：服饰鞋帽线上平台为效果二级行业，其他为品牌二级行业<br/>数码家电：数码家电线上平台为效果二级行业，其他为品牌二级行业<br/> &nbsp; &nbsp;</p><p><br/></p>', null, '1560827025', '16');
INSERT INTO `lee_introduction` VALUES ('23', '今日头条小说行业资质要求', '', '<p>在线小说（包括PC端、APP端、公众号等）：</p><p>现调整行业资质要求：</p><p>a.《增值电信业务经营许可证》b.《网络文化经营许可证》或《网络出版服务许可证》（b项二者其一即可）</p><p>【划重点】：</p><p>1、不再接受《出版物经营许可证》，原因详见百科：https://baike.baidu.com/item/%E5%87%BA%E7%89%88%E7%89%A9%E7%BB%8F%E8%90%A5%E8%AE%B8%E5%8F%AF%E8%AF%81/4213991?fr=aladdin</p><p>2、需具备《增值电信业务经营许可证》</p><p>3、请及时同步客户补充提交相关资质，如6.3日（下周一）下班前未提供，将关户处理。</p><p>附；当前行业资质要求：</p><p>《互联网出版许可证》或《网络出版服务许可证》或《出版物经营许可证》（三者其一）</p><p><br/></p>', null, '1560929041', '16');
INSERT INTO `lee_introduction` VALUES ('24', '今日头条酒店行业所需资质', '', '<p>营业执照+公共场所卫生许可证</p>', null, '1561598404', '16');

-- ----------------------------
-- Table structure for lee_like
-- ----------------------------
DROP TABLE IF EXISTS `lee_like`;
CREATE TABLE `lee_like` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `com_id` int(10) unsigned DEFAULT NULL,
  `reply_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lee_like
-- ----------------------------
INSERT INTO `lee_like` VALUES ('1', '1', '21', '0');
INSERT INTO `lee_like` VALUES ('2', '1', '6', '0');
INSERT INTO `lee_like` VALUES ('3', '1', '14', '0');
INSERT INTO `lee_like` VALUES ('4', '1', '13', '0');
INSERT INTO `lee_like` VALUES ('5', '1', '12', '0');
INSERT INTO `lee_like` VALUES ('6', '1', '15', '0');
INSERT INTO `lee_like` VALUES ('7', '1', '7', '0');
INSERT INTO `lee_like` VALUES ('8', '1', '8', '0');
INSERT INTO `lee_like` VALUES ('9', '1', '9', '0');
INSERT INTO `lee_like` VALUES ('10', '1', '10', '0');
INSERT INTO `lee_like` VALUES ('11', '1', '16', '0');
INSERT INTO `lee_like` VALUES ('12', '1', '17', '0');
INSERT INTO `lee_like` VALUES ('13', '1', '18', '0');
INSERT INTO `lee_like` VALUES ('14', '1', '20', '0');
INSERT INTO `lee_like` VALUES ('15', '1', '19', '0');
INSERT INTO `lee_like` VALUES ('16', '1', '11', '0');
INSERT INTO `lee_like` VALUES ('17', '1', '22', '0');
INSERT INTO `lee_like` VALUES ('18', '1', '26', '0');
INSERT INTO `lee_like` VALUES ('19', '1', '24', '0');
INSERT INTO `lee_like` VALUES ('20', '1', '30', '0');
INSERT INTO `lee_like` VALUES ('21', '1', '0', '8');
INSERT INTO `lee_like` VALUES ('22', '1', '0', '14');
INSERT INTO `lee_like` VALUES ('23', '1', '0', '15');
INSERT INTO `lee_like` VALUES ('24', '1', '0', '12');
INSERT INTO `lee_like` VALUES ('25', '1', '0', '17');
INSERT INTO `lee_like` VALUES ('26', '1', '0', '16');
INSERT INTO `lee_like` VALUES ('27', '1', '0', '10');
INSERT INTO `lee_like` VALUES ('28', '1', '0', '13');
INSERT INTO `lee_like` VALUES ('29', '1', '0', '9');
INSERT INTO `lee_like` VALUES ('30', '1', '0', '25');
INSERT INTO `lee_like` VALUES ('31', '1', '35', '0');
INSERT INTO `lee_like` VALUES ('32', '1', '36', '0');
INSERT INTO `lee_like` VALUES ('33', '15', '37', null);
INSERT INTO `lee_like` VALUES ('34', '15', null, '26');
INSERT INTO `lee_like` VALUES ('35', '15', null, '27');
INSERT INTO `lee_like` VALUES ('36', '15', null, '19');
INSERT INTO `lee_like` VALUES ('37', '1', '42', null);

-- ----------------------------
-- Table structure for lee_loginlog
-- ----------------------------
DROP TABLE IF EXISTS `lee_loginlog`;
CREATE TABLE `lee_loginlog` (
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `ip` char(15) DEFAULT '' COMMENT '登录ip',
  `logintime` int(10) DEFAULT '0' COMMENT '登录时间',
  `msg` varchar(80) DEFAULT NULL COMMENT '登录信息'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员日志表';

-- ----------------------------
-- Records of lee_loginlog
-- ----------------------------
INSERT INTO `lee_loginlog` VALUES ('1', '58.132.177.60', '1562835776', '登录成功');
INSERT INTO `lee_loginlog` VALUES ('1', '58.132.177.60', '1562222564', '登录成功');
INSERT INTO `lee_loginlog` VALUES ('1', '58.132.177.60', '1562910125', '登录成功');
INSERT INTO `lee_loginlog` VALUES ('19', '58.132.177.60', '1562815991', '登录成功');
INSERT INTO `lee_loginlog` VALUES ('13', '127.0.0.1', '1557019906', '登录成功');
INSERT INTO `lee_loginlog` VALUES ('15', '127.0.0.1', '1557039348', '登录成功');
INSERT INTO `lee_loginlog` VALUES ('1', '58.132.177.60', '1562221872', '登录成功');

-- ----------------------------
-- Table structure for lee_manager
-- ----------------------------
DROP TABLE IF EXISTS `lee_manager`;
CREATE TABLE `lee_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `account` varchar(50) NOT NULL COMMENT '管理账号',
  `password` varchar(32) NOT NULL COMMENT '管理员密码',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账号状态 0：锁定，1：正常',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  KEY `account` (`account`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lee_manager
-- ----------------------------
INSERT INTO `lee_manager` VALUES ('1', 'admin', '7fef6171469e80d32c0559f88b377245', '1', '0');
INSERT INTO `lee_manager` VALUES ('13', 'admin888', '7fef6171469e80d32c0559f88b377245', '1', '0');
INSERT INTO `lee_manager` VALUES ('14', 'lee', '21232f297a57a5a743894a0e4a801fc3', '1', '0');
INSERT INTO `lee_manager` VALUES ('15', '测试组长', 'cc17c30cd111c7215fc8f51f8790e0e1', '1', '0');
INSERT INTO `lee_manager` VALUES ('16', 'liu001', '02c9cea559cdb8cb8701556ec51f5bf4', '1', '0');
INSERT INTO `lee_manager` VALUES ('17', 'yangguang', '229a634ddb515a16319f53053da29812', '1', '0');
INSERT INTO `lee_manager` VALUES ('18', 'zmj', '4297f44b13955235245b2497399d7a93', '1', '0');
INSERT INTO `lee_manager` VALUES ('19', 'xiao2019', 'dfc4d31f04a80a79e331051581e17486', '1', '0');

-- ----------------------------
-- Table structure for lee_permission
-- ----------------------------
DROP TABLE IF EXISTS `lee_permission`;
CREATE TABLE `lee_permission` (
  `ps_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `ps_name` varchar(20) NOT NULL COMMENT '权限名称',
  `ps_pid` smallint(6) unsigned NOT NULL COMMENT '父id',
  `ps_c` varchar(32) NOT NULL DEFAULT '' COMMENT '控制器',
  `ps_a` varchar(32) NOT NULL DEFAULT '' COMMENT '操作方法',
  `ps_level` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '权限等级',
  PRIMARY KEY (`ps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of lee_permission
-- ----------------------------
INSERT INTO `lee_permission` VALUES ('101', '内容管理', '0', '', '', '0');
INSERT INTO `lee_permission` VALUES ('102', '栏目管理', '0', '', '', '0');
INSERT INTO `lee_permission` VALUES ('103', '轮播图管理', '0', '', '', '0');
INSERT INTO `lee_permission` VALUES ('104', '内容列表', '101', 'article', 'index', '0');
INSERT INTO `lee_permission` VALUES ('105', '添加文章', '101', 'article', 'add', '0');
INSERT INTO `lee_permission` VALUES ('106', '栏目列表', '102', 'category', 'index', '0');
INSERT INTO `lee_permission` VALUES ('107', '添加栏目', '102', 'category', 'add', '0');
INSERT INTO `lee_permission` VALUES ('108', '轮播图列表', '103', 'banner', 'index', '0');
INSERT INTO `lee_permission` VALUES ('109', '添加轮播图', '103', 'banner', 'add', '0');

-- ----------------------------
-- Table structure for lee_pics
-- ----------------------------
DROP TABLE IF EXISTS `lee_pics`;
CREATE TABLE `lee_pics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL COMMENT '内容id',
  `pic` varchar(100) DEFAULT NULL COMMENT '图片地址',
  `sort` int(11) DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COMMENT='内容图片';

-- ----------------------------
-- Records of lee_pics
-- ----------------------------
INSERT INTO `lee_pics` VALUES ('1', '4', 'uploads\\20171106\\95f9bda45f921c211e45dd46efa8bc02.png', '10');
INSERT INTO `lee_pics` VALUES ('2', '4', 'uploads\\20171106\\b49a4b6efdedff256cd9846789ab50bc.png', '10');
INSERT INTO `lee_pics` VALUES ('164', '12', 'uploads\\20190505\\132d0f432df9f712dc4ff3f49a4d082a.docx', '10');
INSERT INTO `lee_pics` VALUES ('163', '12', 'uploads\\20190505\\0dd0c125e037e20e7cba5173ac775ca7.jpg', '10');
INSERT INTO `lee_pics` VALUES ('65', '30', 'uploads\\20180928\\73341aa651d20c731f62f9e9ca92989b.jpg', '10');
INSERT INTO `lee_pics` VALUES ('32', '30', 'uploads\\20171226\\c417b5251a72b67d9b4e72f764dad246.jpg', '10');
INSERT INTO `lee_pics` VALUES ('33', '31', 'uploads\\20171226\\c089d60b8b802621ba0a08eddbc15dcd.jpg', '10');
INSERT INTO `lee_pics` VALUES ('34', '32', 'uploads\\20171226\\bf8f4cf7c19a394cd8b0e5bc1cc16ebd.jpg', '10');
INSERT INTO `lee_pics` VALUES ('35', '33', 'uploads\\20171226\\e003ea23931651b6ffbf3e0429ab7fb3.jpg', '10');
INSERT INTO `lee_pics` VALUES ('36', '34', 'uploads\\20171226\\d6dfc7a6b10ab9ea741ba1de6cc24cce.jpg', '10');
INSERT INTO `lee_pics` VALUES ('37', '35', 'uploads\\20171226\\76406e0549a9823cb922bc37667b3f5e.jpg', '10');
INSERT INTO `lee_pics` VALUES ('38', '36', 'uploads\\20171226\\f25f5b11776abdf1ed0a03a2bbf010b9.jpg', '10');
INSERT INTO `lee_pics` VALUES ('39', '37', 'uploads\\20171226\\62ec62526c5d52c5adc1879b7b36c404.jpg', '10');
INSERT INTO `lee_pics` VALUES ('40', '38', 'uploads\\20171226\\bf63c8177ed9ed9f477fd5a36f2cd3af.jpg', '10');
INSERT INTO `lee_pics` VALUES ('41', '39', 'uploads\\20171226\\fa419c6fa7da2613cf007edccd884cda.jpg', '10');
INSERT INTO `lee_pics` VALUES ('42', '40', 'uploads\\20171226\\55c646020059bd68bd9803ca9c964d45.jpg', '10');
INSERT INTO `lee_pics` VALUES ('43', '41', 'uploads\\20171226\\1b8be621ff3be09d89d0dc358b7ca0ef.jpg', '10');
INSERT INTO `lee_pics` VALUES ('44', '42', 'uploads\\20171226\\64a01972cf535c95a256be5760b7e86a.jpg', '10');
INSERT INTO `lee_pics` VALUES ('45', '43', 'uploads\\20171226\\fd49a044b814ea930ca02f2feddc254b.jpg', '10');
INSERT INTO `lee_pics` VALUES ('77', '44', 'uploads\\20181105\\15d43ced5ea433bf516c69d21faef028.jpg', '10');
INSERT INTO `lee_pics` VALUES ('78', '45', 'uploads\\20181105\\7c598a8882ced6236193af66c099e412.jpg', '10');
INSERT INTO `lee_pics` VALUES ('79', '46', 'uploads\\20181105\\d6b3071adb49e06c18c40ca919c42a2e.jpg', '10');
INSERT INTO `lee_pics` VALUES ('80', '47', 'uploads\\20181105\\525631a1c94c294d4d1c245a92f20336.jpg', '10');
INSERT INTO `lee_pics` VALUES ('52', '48', 'uploads\\20171227\\2e6c4b9eed93963f21af0be41f604a39.jpg', '10');
INSERT INTO `lee_pics` VALUES ('53', '49', 'uploads\\20171227\\0d5d434873d07caa5b4ba39517ad2501.jpg', '10');
INSERT INTO `lee_pics` VALUES ('54', '50', 'uploads\\20180102\\db3e59c73172cf991ac665854e8d4de0.jpg', '10');
INSERT INTO `lee_pics` VALUES ('55', '51', 'uploads\\20180102\\1fbe5f7344efdf5c48bc89997d190b90.jpg', '10');
INSERT INTO `lee_pics` VALUES ('56', '52', 'uploads\\20180102\\f4d48dfbc9069558eba98b1aca94b15d.jpg', '10');
INSERT INTO `lee_pics` VALUES ('57', '53', 'uploads\\20180102\\dc8c5ffce43dc84bd75416af7164f9af.jpg', '10');
INSERT INTO `lee_pics` VALUES ('58', '54', 'uploads\\20180102\\14e64e0e697c1a5980c1f41d3fe46104.jpg', '10');
INSERT INTO `lee_pics` VALUES ('59', '55', 'uploads\\20180102\\30c20cb182ee1b8b5a2cf536644e13c7.jpg', '10');
INSERT INTO `lee_pics` VALUES ('60', '56', 'uploads\\20180102\\c805edb63f4b71805774a59f6d7a0125.jpg', '10');
INSERT INTO `lee_pics` VALUES ('61', '57', 'uploads\\20180102\\359e3fa63ac24bea2d0916681c4f02cd.jpg', '10');
INSERT INTO `lee_pics` VALUES ('62', '58', 'uploads\\20180102\\6d193707e81247fbe8675a1b2f613f92.jpg', '10');
INSERT INTO `lee_pics` VALUES ('63', '59', 'uploads\\20180102\\5e9efd83cd1db91ad75260211dd6c7c3.png', '10');
INSERT INTO `lee_pics` VALUES ('64', '60', 'uploads\\20180102\\44ae605b536ab38cdb9ae63ef8760d75.jpg', '10');
INSERT INTO `lee_pics` VALUES ('116', '83', 'uploads\\20181122\\87d80a328f1ada52c670f1c9a23ca51b.jpg', '10');
INSERT INTO `lee_pics` VALUES ('111', '74', 'uploads\\20181121\\0d7522ef865dfaadaa2240f162883980.jpg', '10');
INSERT INTO `lee_pics` VALUES ('72', '67', 'uploads\\20181105\\25a5cac87162305b8301dc55af458bc8.jpg', '10');
INSERT INTO `lee_pics` VALUES ('74', '68', 'uploads\\20181105\\70270ab03aa13819cca312bb768ba965.jpg', '10');
INSERT INTO `lee_pics` VALUES ('75', '69', 'uploads\\20181105\\baf9f0c3bcbed123735cb996f421dd07.jpg', '10');
INSERT INTO `lee_pics` VALUES ('76', '70', 'uploads\\20181105\\6050db06742a29f494d6b8fa8eadecc6.jpg', '10');
INSERT INTO `lee_pics` VALUES ('83', '71', 'uploads\\20181105\\a9776722c0eb8d488e1db8155896cd4b.jpg', '10');
INSERT INTO `lee_pics` VALUES ('115', '72', 'uploads\\20181122\\4ddc67ffb4fe50ebc643547cc2066fa9.jpg', '10');
INSERT INTO `lee_pics` VALUES ('109', '73', 'uploads\\20181121\\3d0de7ead0562c0c096f292ef8f9d990.jpg', '10');
INSERT INTO `lee_pics` VALUES ('119', '64', 'uploads\\20181122\\fdf03bdc6d37ec99a107d942b9c12574.png', '10');
INSERT INTO `lee_pics` VALUES ('106', '82', 'uploads\\20181121\\1b0f50ee6036add0d475db435bcf9447.jpg', '10');
INSERT INTO `lee_pics` VALUES ('90', '75', 'uploads\\20181107\\2cd2f0504b5c7cbd34d65f0ed1213116.jpg', '10');
INSERT INTO `lee_pics` VALUES ('91', '76', 'uploads\\20181107\\63f42d28910d747178aa665441cd5665.jpg', '10');
INSERT INTO `lee_pics` VALUES ('107', '77', 'uploads\\20181121\\fa9b8414fafca3ebe0202a65d6ca2595.png', '10');
INSERT INTO `lee_pics` VALUES ('93', '75', 'uploads\\20181107\\cc184d4a349c816ecab1120a1aff09c3.jpg', '10');
INSERT INTO `lee_pics` VALUES ('97', '80', 'uploads\\20181121\\210822bd477931d72c0013d06e9b153e.jpg', '10');
INSERT INTO `lee_pics` VALUES ('98', '78', 'uploads\\20181121\\09c7f9ed0be488cc38b57170f02e7e47.jpg', '10');
INSERT INTO `lee_pics` VALUES ('99', '81', 'uploads\\20181121\\0ace7c8ca838df995832d87a97697481.jpg', '10');
INSERT INTO `lee_pics` VALUES ('121', '65', 'uploads\\20181122\\5849fcf05a68c8018c0028e488d70544.jpg', '10');
INSERT INTO `lee_pics` VALUES ('118', '84', 'uploads\\20181122\\ace7b55422e85565bdd9e99419682a91.jpg', '10');
INSERT INTO `lee_pics` VALUES ('120', '89', 'uploads\\20181122\\4766a78861fafc98e9a021eaf8af3657.jpg', '10');
INSERT INTO `lee_pics` VALUES ('122', '88', 'uploads\\20181122\\e1142a03e0e3298f117b71916c3ccf07.jpg', '10');
INSERT INTO `lee_pics` VALUES ('128', '91', 'uploads\\20181122\\9e75b8b32800e5cf0556bfee1867c3b1.jpg', '10');
INSERT INTO `lee_pics` VALUES ('125', '65', 'uploads\\20181122\\2fb36b480c84f24d39d9eaed75805a3c.png', '10');
INSERT INTO `lee_pics` VALUES ('126', '65', 'uploads\\20181122\\bf90b352902202aee92955fa83c304fc.jpg', '10');
INSERT INTO `lee_pics` VALUES ('127', '65', 'uploads\\20181122\\e934c0ee77b94a2cf0b66047c155e10b.png', '10');
INSERT INTO `lee_pics` VALUES ('159', '10', 'uploads\\20190430\\d53d668ab44aab0ef4933e7f9541f44d.docx', '10');
INSERT INTO `lee_pics` VALUES ('140', '9', 'uploads\\20190426\\1686464342776fea949e69ce58d25b3d.png', '10');
INSERT INTO `lee_pics` VALUES ('133', '8', 'uploads\\20190424\\8989c826cbde70a2d543d010d998826e.docx', '10');
INSERT INTO `lee_pics` VALUES ('134', '8', 'uploads\\20190424\\1af26f71defb4297ffc857ca30e53ce7.docx', '10');
INSERT INTO `lee_pics` VALUES ('158', '10', 'uploads\\20190430\\04387fcf6a1ca9ef12ea3b04fbc0f188.png', '10');
INSERT INTO `lee_pics` VALUES ('157', '10', 'uploads\\20190430\\ed827e8b56798ed61da336c7c458bd3e.jpeg', '10');
INSERT INTO `lee_pics` VALUES ('156', '10', 'uploads\\20190430\\45723376055a08de12263df35e108995.docx', '10');
INSERT INTO `lee_pics` VALUES ('154', '10', 'uploads\\20190430\\0da9e8b8e8efac7488389d06ee640be9.docx', '10');
INSERT INTO `lee_pics` VALUES ('160', '10', 'uploads\\20190430\\2ba7dede0b0066f6e3db44e156a04383.png', '10');
INSERT INTO `lee_pics` VALUES ('161', '11', 'uploads\\20190430\\a89872c57fa194bb2a993465608369e1.jpeg', '10');
INSERT INTO `lee_pics` VALUES ('162', '12', 'uploads\\20190430\\31292f6fc23a2f11c910039a50d794a5.png', '10');
INSERT INTO `lee_pics` VALUES ('167', '13', 'uploads\\20190505\\1ad3e6101dc4483c85d0f2d2cf930cc0.jpeg', '10');
INSERT INTO `lee_pics` VALUES ('168', '13', 'uploads\\20190505\\8cd7bf282ef2cb1b55662fb02b9a2835.docx', '10');
INSERT INTO `lee_pics` VALUES ('169', '14', 'uploads\\20190505\\2cb29cb26bceb94f39693184bbc593d7.jpeg', '10');
INSERT INTO `lee_pics` VALUES ('171', '14', 'uploads\\20190505\\6175b48a7481ca56a95ad51f44fb23a9.pdf', '10');

-- ----------------------------
-- Table structure for lee_questions
-- ----------------------------
DROP TABLE IF EXISTS `lee_questions`;
CREATE TABLE `lee_questions` (
  `qid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL,
  `rid` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `reply_num` int(10) unsigned NOT NULL DEFAULT '0',
  `remark` text NOT NULL,
  `add_time` varchar(255) NOT NULL,
  `reply_time` varchar(255) DEFAULT NULL,
  `is_reply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lee_questions
-- ----------------------------

-- ----------------------------
-- Table structure for lee_role
-- ----------------------------
DROP TABLE IF EXISTS `lee_role`;
CREATE TABLE `lee_role` (
  `role_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `role_ps_ids` varchar(128) NOT NULL DEFAULT '' COMMENT '权限ids,1,2,5',
  `role_ps_ca` text COMMENT '控制器-操作,控制器-操作,控制器-操作',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lee_role
-- ----------------------------
INSERT INTO `lee_role` VALUES ('20', '主管', '101,104,105', 'article-index,article-add');
INSERT INTO `lee_role` VALUES ('21', '经理', '101,104,105,102,106,107', 'article-index,article-add,category-index,category-add');

-- ----------------------------
-- Table structure for lee_toutiao
-- ----------------------------
DROP TABLE IF EXISTS `lee_toutiao`;
CREATE TABLE `lee_toutiao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sell_num` varchar(255) NOT NULL,
  `add_time` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `goods_img` varchar(255) DEFAULT NULL,
  `market_price` int(10) unsigned DEFAULT NULL,
  `discount_price` int(10) unsigned DEFAULT NULL,
  `sku_max_price` int(10) unsigned DEFAULT NULL,
  `sku_min_price` int(10) unsigned DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_sale` tinyint(1) unsigned DEFAULT '1',
  `is_check` tinyint(1) unsigned DEFAULT '1',
  `shop_name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lee_toutiao
-- ----------------------------
INSERT INTO `lee_toutiao` VALUES ('13', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', '1561096898', '1562816110', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', '1', '1', null, null);
INSERT INTO `lee_toutiao` VALUES ('14', '3331993226658903605', '中华国学经典合集全套 白话文注释译文', '爆卖3.5万件', '1561097125', '1561422616', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FsEVZsW5dX6ZNEj4hwVHFwHKDlVtwww673-673', '198000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3331993226658903605&origin_type=1', '1', '1', null, null);
INSERT INTO `lee_toutiao` VALUES ('15', '3342245824754266554', '中华上下五千年精装全八册 中华历史图书普及读本', '爆卖3000+件', '1561097304', '1562226097', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FmWob6FDdfKT-x8604TDqGzTda9twww600-600', '138000', '22800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3342245824754266554&origin_type=1&tt_project_id=6', '1', '1', null, null);
INSERT INTO `lee_toutiao` VALUES ('16', '3345200618422806450', '正版包邮  中华成语大会 全8册', '热卖700+件', '1561097401', '1562222576', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fr-RNhIeiULZgY3K5wKE3k1Bgiu4www800-800', '26800', '13900', '13900', '13900', 'https://haohuo.jinritemai.com/views/product/item?id=3345200618422806450&origin_type=1&tt_project_id=6', '1', '1', null, null);
INSERT INTO `lee_toutiao` VALUES ('17', '3336140541594358510', '别输在情绪上，自我管理，沟通技巧，情绪管理大全', '爆卖3.7万件', '1561194842', '1561422617', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fu4n9CL53-yqz7J3CkuAfXDrcQfTwww600-600', '36000', '9800', '9800', '9800', 'https://haohuo.jinritemai.com/views/product/item?id=3336140541594358510&origin_type=1&tt_project_id=6', '1', '1', null, null);
INSERT INTO `lee_toutiao` VALUES ('18', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖8.9万件', '1561229647', '1562910165', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', '1', '1', '朝之辉专卖店', '厦门朝之辉贸易有限公司');
INSERT INTO `lee_toutiao` VALUES ('19', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖8万件', '1561605670', '1561605869', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', '1', '1', '朝之辉专卖店', '厦门朝之辉贸易有限公司');
INSERT INTO `lee_toutiao` VALUES ('20', '3350051923570126077', '【给孩子的暑假礼物 69元10册】成长励志系列', '爆卖2.1万件', '1562816064', '1562816064', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FqTztfjtZFnboNNHcJt9UwmEVRKdwww800-800', '0', '6900', '6900', '6900', 'https://haohuo.jinritemai.com/views/product/item?id=3350051923570126077', '1', '1', '际杭商贸', '杭州际杭商贸有限公司');
INSERT INTO `lee_toutiao` VALUES ('21', '3354618543344886851', '【99元22册】中华国学经典全套白话文注释译文', '爆卖1.6万件', '1562816096', '1562816096', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fn55NGWddeGYBgHGDmjA4dUiimu1www-', '22000', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3354618543344886851', '1', '1', '际杭商贸', '杭州际杭商贸有限公司');
INSERT INTO `lee_toutiao` VALUES ('22', '3351326918980026397', '【99元10册】识人用人管人和人际交往提高情商', '爆卖8.4万件', '1562816102', '1562816102', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fr77Xj3KB3uA4eCxURZPT24plPSkwww800-800', '39800', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3351326918980026397', '1', '1', '汉客电商', '东莞市汉客电子商务有限公司');
INSERT INTO `lee_toutiao` VALUES ('23', '3353765090393460030', '【强者大全集12册】职场励志人生哲学', '爆卖2.2万件', '1562816107', '1562816107', 'https://sf6-ttcdn-tos.pstatp.com/obj/temai/FsUGpjEWeLQ91QQwVndmDo7z8P4Vwww847-754', '39800', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3353765090393460030', '1', '1', '汉客电商', '东莞市汉客电子商务有限公司');
INSERT INTO `lee_toutiao` VALUES ('25', '3351904044548521371', '【班主任推荐】成长励志课外书3-14岁儿童读物', '爆卖13.6万件', '1562816150', '1562816150', 'https://sf6-ttcdn-tos.pstatp.com/obj/temai/FrfiBn_HVNvDA6v9U_x6gByn5xkjwww800-800', '15900', '6900', '6900', '6900', 'https://haohuo.jinritemai.com/views/product/item?id=3351904044548521371', '1', '1', '北觅专营店', '苏州北觅服饰有限公司');
INSERT INTO `lee_toutiao` VALUES ('26', '3348516958093076202', '【成长励志】17-14岁课外读物，10本仅69', '爆卖23.4万件', '1562816159', '1562816159', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FpmDv_uiYlS4u1JOD8Ld60cLiLuPwww800-800', '0', '6900', '6900', '6900', 'https://haohuo.jinritemai.com/views/product/item?id=3348516958093076202', '1', '1', ' 北京卓鑫阁文化发展有限公司 ', '北京卓鑫阁文化发展有限公司');
INSERT INTO `lee_toutiao` VALUES ('27', '3351112829976619988', '【攻心术与谋略】成功可以很简单，强者法则', '爆卖20.5万件', '1562816169', '1562816169', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FrpCAjVzN6qeEjIa8xf4CFV4BNF3www600-600', '57600', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3351112829976619988', '1', '1', '一图图书', '北京一图图书有限公司');
INSERT INTO `lee_toutiao` VALUES ('28', '3353923499524784335', '【国学典萃全套】22册精美装订，无障碍阅读版本', '爆卖2.3万件', '1562816179', '1562816179', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fmn5U8YKZFoI5iaQWj7Bv_1TCE8ewww800-800', '0', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3353923499524784335', '1', '1', '顺尔和文库百货', '河南顺尔和商贸有限公司');
INSERT INTO `lee_toutiao` VALUES ('29', '3354470822239685536', '【1折起】中华国学经典精粹  全52册包邮', '热卖400+件', '1562816185', '1562910153', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fiys_ryBf7p-sQ_lgfVGvCf_ojN2www800-800', '298000', '19800', '29800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3354470822239685536', '1', '1', '文贤阁图书', '北京文贤阁图书有限公司');

-- ----------------------------
-- Table structure for lee_toutiaolog
-- ----------------------------
DROP TABLE IF EXISTS `lee_toutiaolog`;
CREATE TABLE `lee_toutiaolog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sell_num` varchar(255) NOT NULL,
  `add_time` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `goods_img` varchar(255) DEFAULT NULL,
  `market_price` int(10) unsigned DEFAULT NULL,
  `discount_price` int(10) unsigned DEFAULT NULL,
  `sku_max_price` int(10) unsigned DEFAULT NULL,
  `sku_min_price` int(10) unsigned DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lee_toutiaolog
-- ----------------------------
INSERT INTO `lee_toutiaolog` VALUES ('1', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', '1560916409', '1560999837', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('13', '3351709074516535495', '365西瓜酱豆纯手农家自制香辣豆酱调味料夹馍下饭河南特产', '爆卖2000+件', null, '1561012928', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FtD5PqERU3CdUzeT_a4PteT0eh1Jwww600-600', '3650', '2680', '2680', '2680', 'https://haohuo.jinritemai.com/views/product/item2?id=3351709074516535495&fxg_req_id=3352022181843485947&origin_type=0&origin_id=0&new_source_type=85&new_source_id=0&source_type=85&source_id=0&come_from=0', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('14', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1561012959', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('15', '3351709074516535495', '365西瓜酱豆纯手农家自制香辣豆酱调味料夹馍下饭河南特产', '爆卖2000+件', null, '1561012959', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FtD5PqERU3CdUzeT_a4PteT0eh1Jwww600-600', '3650', '2680', '2680', '2680', 'https://haohuo.jinritemai.com/views/product/item2?id=3351709074516535495&fxg_req_id=3352022181843485947&origin_type=0&origin_id=0&new_source_type=85&new_source_id=0&source_type=85&source_id=0&come_from=0', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('16', '3351709074516535495', '365西瓜酱豆纯手农家自制香辣豆酱调味料夹馍下饭河南特产', '爆卖2000+件', null, '1561012959', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FtD5PqERU3CdUzeT_a4PteT0eh1Jwww600-600', '3650', '2680', '2680', '2680', 'https://haohuo.jinritemai.com/views/product/item2?id=3351709074516535495&fxg_req_id=3352022181843485947&origin_type=0&origin_id=0&new_source_type=85&new_source_id=0&source_type=85&source_id=0&come_from=0', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('17', '3351709074516535495', '365西瓜酱豆纯手农家自制香辣豆酱调味料夹馍下饭河南特产', '爆卖2000+件', null, '1561012960', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FtD5PqERU3CdUzeT_a4PteT0eh1Jwww600-600', '3650', '2680', '2680', '2680', 'https://haohuo.jinritemai.com/views/product/item2?id=3351709074516535495&fxg_req_id=3352022181843485947&origin_type=0&origin_id=0&new_source_type=85&new_source_id=0&source_type=85&source_id=0&come_from=0', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('18', '3351709074516535495', '365西瓜酱豆纯手农家自制香辣豆酱调味料夹馍下饭河南特产', '爆卖2000+件', '1561013574', '1561013574', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FtD5PqERU3CdUzeT_a4PteT0eh1Jwww600-600', '3650', '2680', '2680', '2680', 'https://haohuo.jinritemai.com/views/product/item2?id=3351709074516535495&fxg_req_id=3352022181843485947&origin_type=0&origin_id=0&new_source_type=85&new_source_id=0&source_type=85&source_id=0&come_from=0', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('19', '3351709074516535495', '365西瓜酱豆纯手农家自制香辣豆酱调味料夹馍下饭河南特产', '爆卖2000+件', '1561013578', '1561013578', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FtD5PqERU3CdUzeT_a4PteT0eh1Jwww600-600', '3650', '2680', '2680', '2680', 'https://haohuo.jinritemai.com/views/product/item2?id=3351709074516535495&fxg_req_id=3352022181843485947&origin_type=0&origin_id=0&new_source_type=85&new_source_id=0&source_type=85&source_id=0&come_from=0', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('20', '3351709074516535495', '365西瓜酱豆纯手农家自制香辣豆酱调味料夹馍下饭河南特产', '爆卖2000+件', null, '1561015057', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FtD5PqERU3CdUzeT_a4PteT0eh1Jwww600-600', '3650', '2680', '2680', '2680', 'https://haohuo.jinritemai.com/views/product/item2?id=3351709074516535495&fxg_req_id=3352022181843485947&origin_type=0&origin_id=0&new_source_type=85&new_source_id=0&source_type=85&source_id=0&come_from=0', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('21', '3351709074516535495', '365西瓜酱豆纯手农家自制香辣豆酱调味料夹馍下饭河南特产', '爆卖2000+件', null, '1561015060', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FtD5PqERU3CdUzeT_a4PteT0eh1Jwww600-600', '3650', '2680', '2680', '2680', 'https://haohuo.jinritemai.com/views/product/item2?id=3351709074516535495&fxg_req_id=3352022181843485947&origin_type=0&origin_id=0&new_source_type=85&new_source_id=0&source_type=85&source_id=0&come_from=0', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('22', '3351709074516535495', '365西瓜酱豆纯手农家自制香辣豆酱调味料夹馍下饭河南特产', '爆卖2000+件', null, '1561015063', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FtD5PqERU3CdUzeT_a4PteT0eh1Jwww600-600', '3650', '2680', '2680', '2680', 'https://haohuo.jinritemai.com/views/product/item2?id=3351709074516535495&fxg_req_id=3352022181843485947&origin_type=0&origin_id=0&new_source_type=85&new_source_id=0&source_type=85&source_id=0&come_from=0', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('23', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1561019407', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('24', '3351709074516535495', '365西瓜酱豆纯手农家自制香辣豆酱调味料夹馍下饭河南特产', '爆卖2000+件', null, '1561019408', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FtD5PqERU3CdUzeT_a4PteT0eh1Jwww600-600', '3650', '2680', '2680', '2680', 'https://haohuo.jinritemai.com/views/product/item2?id=3351709074516535495&fxg_req_id=3352022181843485947&origin_type=0&origin_id=0&new_source_type=85&new_source_id=0&source_type=85&source_id=0&come_from=0', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('25', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', '1561096898', '1561096898', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('26', '3331993226658903605', '中华国学经典合集全套 白话文注释译文', '爆卖3.5万件', '1561097125', '1561097125', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FsEVZsW5dX6ZNEj4hwVHFwHKDlVtwww673-673', '198000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3331993226658903605&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('27', '3342245824754266554', '中华上下五千年精装全八册 中华历史图书普及读本', '爆卖2000+件', '1561097304', '1561097304', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FmWob6FDdfKT-x8604TDqGzTda9twww600-600', '138000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3342245824754266554&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('28', '3345200618422806450', '正版包邮  中华成语大会 全8册', '热卖600+件', '1561097401', '1561097401', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fr-RNhIeiULZgY3K5wKE3k1Bgiu4www800-800', '26800', '13900', '13900', '13900', 'https://haohuo.jinritemai.com/views/product/item?id=3345200618422806450&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('29', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1561105816', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('30', '3331993226658903605', '中华国学经典合集全套 白话文注释译文', '爆卖3.5万件', null, '1561105816', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FsEVZsW5dX6ZNEj4hwVHFwHKDlVtwww673-673', '198000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3331993226658903605&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('31', '3342245824754266554', '中华上下五千年精装全八册 中华历史图书普及读本', '爆卖2000+件', null, '1561105816', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FmWob6FDdfKT-x8604TDqGzTda9twww600-600', '138000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3342245824754266554&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('32', '3345200618422806450', '正版包邮  中华成语大会 全8册', '热卖600+件', null, '1561105816', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fr-RNhIeiULZgY3K5wKE3k1Bgiu4www800-800', '26800', '13900', '13900', '13900', 'https://haohuo.jinritemai.com/views/product/item?id=3345200618422806450&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('33', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1561134616', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('34', '3331993226658903605', '中华国学经典合集全套 白话文注释译文', '爆卖3.5万件', null, '1561134616', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FsEVZsW5dX6ZNEj4hwVHFwHKDlVtwww673-673', '198000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3331993226658903605&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('35', '3342245824754266554', '中华上下五千年精装全八册 中华历史图书普及读本', '爆卖2000+件', null, '1561134616', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FmWob6FDdfKT-x8604TDqGzTda9twww600-600', '138000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3342245824754266554&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('36', '3345200618422806450', '正版包邮  中华成语大会 全8册', '热卖600+件', null, '1561134616', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fr-RNhIeiULZgY3K5wKE3k1Bgiu4www800-800', '26800', '13900', '13900', '13900', 'https://haohuo.jinritemai.com/views/product/item?id=3345200618422806450&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('37', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1561163415', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('38', '3331993226658903605', '中华国学经典合集全套 白话文注释译文', '爆卖3.5万件', null, '1561163416', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FsEVZsW5dX6ZNEj4hwVHFwHKDlVtwww673-673', '198000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3331993226658903605&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('39', '3342245824754266554', '中华上下五千年精装全八册 中华历史图书普及读本', '爆卖2000+件', null, '1561163416', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FmWob6FDdfKT-x8604TDqGzTda9twww600-600', '138000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3342245824754266554&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('40', '3345200618422806450', '正版包邮  中华成语大会 全8册', '热卖600+件', null, '1561163416', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fr-RNhIeiULZgY3K5wKE3k1Bgiu4www800-800', '26800', '13900', '13900', '13900', 'https://haohuo.jinritemai.com/views/product/item?id=3345200618422806450&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('41', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1561192216', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('42', '3331993226658903605', '中华国学经典合集全套 白话文注释译文', '爆卖3.5万件', null, '1561192216', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FsEVZsW5dX6ZNEj4hwVHFwHKDlVtwww673-673', '198000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3331993226658903605&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('43', '3342245824754266554', '中华上下五千年精装全八册 中华历史图书普及读本', '爆卖2000+件', null, '1561192216', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FmWob6FDdfKT-x8604TDqGzTda9twww600-600', '138000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3342245824754266554&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('44', '3345200618422806450', '正版包邮  中华成语大会 全8册', '热卖600+件', null, '1561192217', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fr-RNhIeiULZgY3K5wKE3k1Bgiu4www800-800', '26800', '13900', '13900', '13900', 'https://haohuo.jinritemai.com/views/product/item?id=3345200618422806450&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('45', '3336140541594358510', '别输在情绪上，自我管理，沟通技巧，情绪管理大全', '爆卖3.7万件', '1561194842', '1561194842', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fu4n9CL53-yqz7J3CkuAfXDrcQfTwww600-600', '36000', '9800', '9800', '9800', 'https://haohuo.jinritemai.com/views/product/item?id=3336140541594358510&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('46', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1561221016', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('47', '3331993226658903605', '中华国学经典合集全套 白话文注释译文', '爆卖3.5万件', null, '1561221017', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FsEVZsW5dX6ZNEj4hwVHFwHKDlVtwww673-673', '198000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3331993226658903605&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('48', '3342245824754266554', '中华上下五千年精装全八册 中华历史图书普及读本', '爆卖2000+件', null, '1561221017', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FmWob6FDdfKT-x8604TDqGzTda9twww600-600', '138000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3342245824754266554&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('49', '3345200618422806450', '正版包邮  中华成语大会 全8册', '热卖600+件', null, '1561221017', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fr-RNhIeiULZgY3K5wKE3k1Bgiu4www800-800', '26800', '13900', '13900', '13900', 'https://haohuo.jinritemai.com/views/product/item?id=3345200618422806450&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('50', '3336140541594358510', '别输在情绪上，自我管理，沟通技巧，情绪管理大全', '爆卖3.7万件', null, '1561221017', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fu4n9CL53-yqz7J3CkuAfXDrcQfTwww600-600', '36000', '9800', '9800', '9800', 'https://haohuo.jinritemai.com/views/product/item?id=3336140541594358510&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('51', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖7万件', '1561229647', '1561229647', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('52', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1561249814', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('53', '3331993226658903605', '中华国学经典合集全套 白话文注释译文', '爆卖3.5万件', null, '1561249815', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FsEVZsW5dX6ZNEj4hwVHFwHKDlVtwww673-673', '198000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3331993226658903605&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('54', '3342245824754266554', '中华上下五千年精装全八册 中华历史图书普及读本', '爆卖2000+件', null, '1561249815', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FmWob6FDdfKT-x8604TDqGzTda9twww600-600', '138000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3342245824754266554&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('55', '3345200618422806450', '正版包邮  中华成语大会 全8册', '热卖600+件', null, '1561249815', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fr-RNhIeiULZgY3K5wKE3k1Bgiu4www800-800', '26800', '13900', '13900', '13900', 'https://haohuo.jinritemai.com/views/product/item?id=3345200618422806450&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('56', '3336140541594358510', '别输在情绪上，自我管理，沟通技巧，情绪管理大全', '爆卖3.8万件', null, '1561249815', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fu4n9CL53-yqz7J3CkuAfXDrcQfTwww600-600', '36000', '9800', '9800', '9800', 'https://haohuo.jinritemai.com/views/product/item?id=3336140541594358510&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('57', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖7万件', null, '1561249816', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('58', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1561278616', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('59', '3331993226658903605', '中华国学经典合集全套 白话文注释译文', '爆卖3.5万件', null, '1561278616', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FsEVZsW5dX6ZNEj4hwVHFwHKDlVtwww673-673', '198000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3331993226658903605&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('60', '3342245824754266554', '中华上下五千年精装全八册 中华历史图书普及读本', '爆卖2000+件', null, '1561278617', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FmWob6FDdfKT-x8604TDqGzTda9twww600-600', '138000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3342245824754266554&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('61', '3345200618422806450', '正版包邮  中华成语大会 全8册', '热卖600+件', null, '1561278617', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fr-RNhIeiULZgY3K5wKE3k1Bgiu4www800-800', '26800', '13900', '13900', '13900', 'https://haohuo.jinritemai.com/views/product/item?id=3345200618422806450&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('62', '3336140541594358510', '别输在情绪上，自我管理，沟通技巧，情绪管理大全', '爆卖4万件', null, '1561278617', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fu4n9CL53-yqz7J3CkuAfXDrcQfTwww600-600', '36000', '9800', '9800', '9800', 'https://haohuo.jinritemai.com/views/product/item?id=3336140541594358510&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('63', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖7.1万件', null, '1561278617', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('64', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1561307415', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('65', '3331993226658903605', '中华国学经典合集全套 白话文注释译文', '爆卖3.5万件', null, '1561307415', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FsEVZsW5dX6ZNEj4hwVHFwHKDlVtwww673-673', '198000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3331993226658903605&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('66', '3342245824754266554', '中华上下五千年精装全八册 中华历史图书普及读本', '爆卖2000+件', null, '1561307415', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FmWob6FDdfKT-x8604TDqGzTda9twww600-600', '138000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3342245824754266554&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('67', '3345200618422806450', '正版包邮  中华成语大会 全8册', '热卖700+件', null, '1561307415', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fr-RNhIeiULZgY3K5wKE3k1Bgiu4www800-800', '26800', '13900', '13900', '13900', 'https://haohuo.jinritemai.com/views/product/item?id=3345200618422806450&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('68', '3336140541594358510', '别输在情绪上，自我管理，沟通技巧，情绪管理大全', '爆卖4.2万件', null, '1561307416', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fu4n9CL53-yqz7J3CkuAfXDrcQfTwww600-600', '36000', '9800', '9800', '9800', 'https://haohuo.jinritemai.com/views/product/item?id=3336140541594358510&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('69', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖7.3万件', null, '1561307416', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('70', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1561336215', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('71', '3331993226658903605', '中华国学经典合集全套 白话文注释译文', '爆卖3.5万件', null, '1561336216', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FsEVZsW5dX6ZNEj4hwVHFwHKDlVtwww673-673', '198000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3331993226658903605&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('72', '3342245824754266554', '中华上下五千年精装全八册 中华历史图书普及读本', '爆卖2000+件', null, '1561336216', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FmWob6FDdfKT-x8604TDqGzTda9twww600-600', '138000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3342245824754266554&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('73', '3345200618422806450', '正版包邮  中华成语大会 全8册', '热卖700+件', null, '1561336216', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fr-RNhIeiULZgY3K5wKE3k1Bgiu4www800-800', '26800', '13900', '13900', '13900', 'https://haohuo.jinritemai.com/views/product/item?id=3345200618422806450&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('74', '3336140541594358510', '别输在情绪上，自我管理，沟通技巧，情绪管理大全', '爆卖4.3万件', null, '1561336216', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fu4n9CL53-yqz7J3CkuAfXDrcQfTwww600-600', '36000', '9800', '9800', '9800', 'https://haohuo.jinritemai.com/views/product/item?id=3336140541594358510&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('75', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖7.4万件', null, '1561336217', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('76', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1561365015', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('77', '3331993226658903605', '中华国学经典合集全套 白话文注释译文', '爆卖3.5万件', null, '1561365016', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FsEVZsW5dX6ZNEj4hwVHFwHKDlVtwww673-673', '198000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3331993226658903605&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('78', '3342245824754266554', '中华上下五千年精装全八册 中华历史图书普及读本', '爆卖3000+件', null, '1561365016', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FmWob6FDdfKT-x8604TDqGzTda9twww600-600', '138000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3342245824754266554&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('79', '3345200618422806450', '正版包邮  中华成语大会 全8册', '热卖700+件', null, '1561365016', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fr-RNhIeiULZgY3K5wKE3k1Bgiu4www800-800', '26800', '13900', '13900', '13900', 'https://haohuo.jinritemai.com/views/product/item?id=3345200618422806450&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('80', '3336140541594358510', '别输在情绪上，自我管理，沟通技巧，情绪管理大全', '爆卖4.5万件', null, '1561365017', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fu4n9CL53-yqz7J3CkuAfXDrcQfTwww600-600', '36000', '9800', '9800', '9800', 'https://haohuo.jinritemai.com/views/product/item?id=3336140541594358510&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('81', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖7.6万件', null, '1561365017', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('82', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖7.6万件', null, '1561369716', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('83', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1561393814', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('84', '3331993226658903605', '中华国学经典合集全套 白话文注释译文', '爆卖3.5万件', null, '1561393814', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FsEVZsW5dX6ZNEj4hwVHFwHKDlVtwww673-673', '198000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3331993226658903605&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('85', '3342245824754266554', '中华上下五千年精装全八册 中华历史图书普及读本', '爆卖3000+件', null, '1561393815', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FmWob6FDdfKT-x8604TDqGzTda9twww600-600', '138000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3342245824754266554&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('86', '3345200618422806450', '正版包邮  中华成语大会 全8册', '热卖700+件', null, '1561393815', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fr-RNhIeiULZgY3K5wKE3k1Bgiu4www800-800', '26800', '13900', '13900', '13900', 'https://haohuo.jinritemai.com/views/product/item?id=3345200618422806450&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('87', '3336140541594358510', '别输在情绪上，自我管理，沟通技巧，情绪管理大全', '爆卖4.6万件', null, '1561393815', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fu4n9CL53-yqz7J3CkuAfXDrcQfTwww600-600', '36000', '9800', '9800', '9800', 'https://haohuo.jinritemai.com/views/product/item?id=3336140541594358510&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('88', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖7.6万件', null, '1561393815', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('89', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1561422616', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('90', '3331993226658903605', '中华国学经典合集全套 白话文注释译文', '爆卖3.5万件', null, '1561422616', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FsEVZsW5dX6ZNEj4hwVHFwHKDlVtwww673-673', '198000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3331993226658903605&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('91', '3342245824754266554', '中华上下五千年精装全八册 中华历史图书普及读本', '爆卖3000+件', null, '1561422617', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FmWob6FDdfKT-x8604TDqGzTda9twww600-600', '138000', '19800', '19800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3342245824754266554&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('92', '3345200618422806450', '正版包邮  中华成语大会 全8册', '热卖700+件', null, '1561422617', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fr-RNhIeiULZgY3K5wKE3k1Bgiu4www800-800', '26800', '13900', '13900', '13900', 'https://haohuo.jinritemai.com/views/product/item?id=3345200618422806450&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('93', '3336140541594358510', '别输在情绪上，自我管理，沟通技巧，情绪管理大全', '爆卖4.7万件', null, '1561422617', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fu4n9CL53-yqz7J3CkuAfXDrcQfTwww600-600', '36000', '9800', '9800', '9800', 'https://haohuo.jinritemai.com/views/product/item?id=3336140541594358510&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('94', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖7.7万件', null, '1561422617', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('95', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖8万件', null, '1561600764', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('96', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖8万件', '1561605670', '1561605670', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('97', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖8万件', null, '1561605843', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('98', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖8万件', null, '1561605869', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('99', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖8万件', null, '1561605875', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('100', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖8万件', null, '1561606041', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('101', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖8万件', null, '1561606673', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('102', '3345200618422806450', '正版包邮  中华成语大会 全8册', '热卖700+件', null, '1562222576', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fr-RNhIeiULZgY3K5wKE3k1Bgiu4www800-800', '26800', '13900', '13900', '13900', 'https://haohuo.jinritemai.com/views/product/item?id=3345200618422806450&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('103', '3342245824754266554', '中华上下五千年精装全八册 中华历史图书普及读本', '爆卖3000+件', null, '1562226097', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FmWob6FDdfKT-x8604TDqGzTda9twww600-600', '138000', '22800', '22800', '22800', 'https://haohuo.jinritemai.com/views/product/item?id=3342245824754266554&origin_type=1&tt_project_id=6', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('104', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1562816035', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('105', '3350051923570126077', '【给孩子的暑假礼物 69元10册】成长励志系列', '爆卖2.1万件', '1562816064', '1562816064', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FqTztfjtZFnboNNHcJt9UwmEVRKdwww800-800', '0', '6900', '6900', '6900', 'https://haohuo.jinritemai.com/views/product/item?id=3350051923570126077', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('106', '3354618543344886851', '【99元22册】中华国学经典全套白话文注释译文', '爆卖1.6万件', '1562816096', '1562816096', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fn55NGWddeGYBgHGDmjA4dUiimu1www-', '22000', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3354618543344886851', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('107', '3351326918980026397', '【99元10册】识人用人管人和人际交往提高情商', '爆卖8.4万件', '1562816102', '1562816102', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fr77Xj3KB3uA4eCxURZPT24plPSkwww800-800', '39800', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3351326918980026397', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('108', '3353765090393460030', '【强者大全集12册】职场励志人生哲学', '爆卖2.2万件', '1562816107', '1562816107', 'https://sf6-ttcdn-tos.pstatp.com/obj/temai/FsUGpjEWeLQ91QQwVndmDo7z8P4Vwww847-754', '39800', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3353765090393460030', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('109', '3332297447790751650', '全五册墨菲定律格局思维博弈微表情微反应心理学', '爆卖3000+件', null, '1562816110', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FiCoS-bP2DFOk3oU_HmkCk2moO7zwww600-600', '19900', '18800', '18800', '18800', 'https://haohuo.jinritemai.com/views/product/item?id=3332297447790751650&origin_type=1', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('110', '3353765090393460030', '【强者大全集12册】职场励志人生哲学', '爆卖2.2万件', '1562816125', '1562816125', 'https://sf6-ttcdn-tos.pstatp.com/obj/temai/FsUGpjEWeLQ91QQwVndmDo7z8P4Vwww847-754', '39800', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3353765090393460030', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('111', '3351904044548521371', '【班主任推荐】成长励志课外书3-14岁儿童读物', '爆卖13.6万件', '1562816150', '1562816150', 'https://sf6-ttcdn-tos.pstatp.com/obj/temai/FrfiBn_HVNvDA6v9U_x6gByn5xkjwww800-800', '15900', '6900', '6900', '6900', 'https://haohuo.jinritemai.com/views/product/item?id=3351904044548521371', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('112', '3348516958093076202', '【成长励志】17-14岁课外读物，10本仅69', '爆卖23.4万件', '1562816159', '1562816159', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FpmDv_uiYlS4u1JOD8Ld60cLiLuPwww800-800', '0', '6900', '6900', '6900', 'https://haohuo.jinritemai.com/views/product/item?id=3348516958093076202', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('113', '3351112829976619988', '【攻心术与谋略】成功可以很简单，强者法则', '爆卖20.5万件', '1562816169', '1562816169', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/FrpCAjVzN6qeEjIa8xf4CFV4BNF3www600-600', '57600', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3351112829976619988', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('114', '3353923499524784335', '【国学典萃全套】22册精美装订，无障碍阅读版本', '爆卖2.3万件', '1562816179', '1562816179', 'https://sf1-ttcdn-tos.pstatp.com/obj/temai/Fmn5U8YKZFoI5iaQWj7Bv_1TCE8ewww800-800', '0', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3353923499524784335', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('115', '3354470822239685536', '【1折起】中华国学经典精粹  全52册包邮', '热卖300+件', '1562816185', '1562816185', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fiys_ryBf7p-sQ_lgfVGvCf_ojN2www800-800', '298000', '19800', '29800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3354470822239685536', null, null);
INSERT INTO `lee_toutiaolog` VALUES ('116', '3354470822239685536', '【1折起】中华国学经典精粹  全52册包邮', '热卖400+件', null, '1562910153', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/Fiys_ryBf7p-sQ_lgfVGvCf_ojN2www800-800', '298000', '19800', '29800', '19800', 'https://haohuo.jinritemai.com/views/product/item?id=3354470822239685536', '北京文贤阁图书有限公司', '文贤阁图书');
INSERT INTO `lee_toutiaolog` VALUES ('117', '3348187538404812381', '【正版3折】东方旷世奇书+西方实用心理学全十册', '爆卖8.9万件', null, '1562910165', 'https://sf3-ttcdn-tos.pstatp.com/obj/temai/FuLXZ3T8vPr4JNlULa8NYeENYHTWwww600-600', '57500', '9900', '9900', '9900', 'https://haohuo.jinritemai.com/views/product/item?id=3348187538404812381&origin_type=1&tt_project_id=6', '厦门朝之辉贸易有限公司', '朝之辉专卖店');

-- ----------------------------
-- Table structure for lee_typelink
-- ----------------------------
DROP TABLE IF EXISTS `lee_typelink`;
CREATE TABLE `lee_typelink` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort` smallint(5) unsigned NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lee_typelink
-- ----------------------------
INSERT INTO `lee_typelink` VALUES ('1', '百度', 'https://www.baidu.com/', '500', '1', '1606752000');
INSERT INTO `lee_typelink` VALUES ('2', 'Nike', 'https://store.nike.com', '500', '1', '1577808000');

-- ----------------------------
-- Table structure for lee_viewslog
-- ----------------------------
DROP TABLE IF EXISTS `lee_viewslog`;
CREATE TABLE `lee_viewslog` (
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `viewtime` int(10) DEFAULT NULL COMMENT '浏览时间',
  `viewip` varchar(15) DEFAULT NULL COMMENT 'ip地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='浏览日志';

-- ----------------------------
-- Records of lee_viewslog
-- ----------------------------
INSERT INTO `lee_viewslog` VALUES ('56', '1538965831', '127.0.0.1');
