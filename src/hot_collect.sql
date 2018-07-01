-- --------------------------------------------------------
-- 主机:                           121.42.169.78
-- 服务器版本:                        5.6.27 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  8.2.0.4675
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 collect 的数据库结构
DROP DATABASE IF EXISTS `collect`;
CREATE DATABASE IF NOT EXISTS `collect` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `collect`;


-- 导出  表 collect.collectLink 结构
DROP TABLE IF EXISTS `collectLink`;
CREATE TABLE IF NOT EXISTS `collectLink` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pid` varchar(50) DEFAULT '0',
  `sequence` int(10) DEFAULT '0',
  `url` varchar(500) DEFAULT NULL,
  `remark` text,
  `userId` varchar(50) DEFAULT NULL,
  `createTime` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏的链接';

-- 正在导出表  collect.collectLink 的数据：~159 rows (大约)
DELETE FROM `collectLink`;
/*!40000 ALTER TABLE `collectLink` DISABLE KEYS */;
INSERT INTO `collectLink` (`id`, `name`, `pid`, `sequence`, `url`, `remark`, `userId`, `createTime`) VALUES
	('674908112439873536', 'w3c school', '674820323560001536', 12, 'http://www.w3school.com.cn/index.html', '在 w3school，你可以找到你所需要的所有的网站建设教程。\r\n\r\n从基础的 HTML 到 CSS，乃至进阶的XML、SQL、JS、PHP 和 ASP.NET。', '2', 1449745607849),
	('675135464100990976', '在线API文档', '674820323560001536', 1, 'http://tool.oschina.net/apidocs', '常用API文档索引', '2', 1449799812709),
	('675137303567536128', 'EasyUI 在线实例', '675141284276604928', 2, 'http://www.jeasyui.net/demo/557.html', 'EasyUI Demo 在线实例', '2', 0),
	('675145356295671808', '数据表格（DataGrid）', '675141284276604928', 12, 'http://www.cnblogs.com/Philoo/archive/2011/11/16/jeasyui_api_datagrid.html', 'DataGrid  数据表格', '2', 1449802171192),
	('675145995998334976', 'layer弹窗官网', '674821983871045632', 12, 'http://layer.layui.com/', 'Layer是一款近年来口碑极佳的web弹层组件，她具备全方位的解决方案，致力于服务各水平段的开发人员，您的页面会轻松地拥有丰富友好的操作体验。', '2', 1449802323709),
	('675146892572758016', 'LinkButton', '675141284276604928', 1, 'http://demo.jb51.net/js/jquery_easyui/index.htm#', 'LinkButton【链接按钮】', '2', 1449802537469),
	('675147161612193792', 'Highcharts中文网', '674821983871045632', 1, 'http://www.hcharts.cn/', 'Highcharts:功能强大、开源、美观、图表丰富、兼容绝大多数浏览器的纯js图表库', '2', 1449802601613),
	('675147785145815040', 'JSTL 核心标签库', '674820323560001536', 12, 'www.zi-han.net/case/easyui/form.html', 'JSTL 核心标签库标签共有13个，功能上分为4类：\r\n1.表达式控制标签：out、set、remove、catch\r\n2.流程控制标签：if、choose、when、otherwise\r\n3.循环标签：forEach、forTokens\r\n4.URL操作标签：import、url、redirect', '2', 1449802750275),
	('675148106064596992', 'Menu and Button', '675141284276604928', 12, 'www.zi-han.net/case/easyui/form.html', '菜单和按钮(Menu and Button)', '2', 1449802826788),
	('675148422524833792', 'MySQL API', '674820323560001536', 1, 'http://www.runoob.com/mysql/mysql-using-sequences.html', 'MySQL 中文API', '2', 1449802902238),
	('675148633036951552', '百度地图API', '674820323560001536', 12, 'http://developer.baidu.com/map/jsdemo.htm#a3_1', '百度地图API使用', '2', 1449802952428),
	('675148933323952128', 'Git廖雪峰教程', '674821400057483264', 12, 'http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000', '史上最浅显易懂的Git教程！\r\n为什么要编写这个教程？因为我在学习Git的过程中，买过书，也在网上Google了一堆Git相关的文章和教程，但令人失望的是，这些教程不是难得令人发指，就是简单得一笔带过，或者，只支离破碎地介绍Git的某几个命令，还有直接从Git手册粘贴帮助文档的，总之，初学者很难找到一个由浅入深，学完后能立刻上手的Git教程。', '2', 1449803024022),
	('675149248601395200', ' JFinal 学习笔记', '675149296445820928', 12, 'http://blog.csdn.net/zhaols11/article/details/21154741', 'JFinal 学习笔记一(config route配置,controller配置) ', '2', 0),
	('675149695571595264', ' [pdf文件] jfinal中文手册 ', '675149296445820928', 12, 'http://download.csdn.net/detail/u011252354/7086195', '中文最新jfinal版本，中文教程，详细，有示例演示的', '2', 1449803205756),
	('675150115467563008', 'AngularJS API', '674821983871045632', 12, 'http://www.runoob.com/angularjs/angularjs-intro.html', 'AngularJS 是一个 JavaScript 框架。它可通过 <script> 标签添加到 HTML 页面。\r\nAngularJS 通过 指令 扩展了 HTML，且通过 表达式 绑定数据到 HTML。', '2', 1449803305867),
	('675150354098294784', 'validatebox 扩展验证方法', '675141284276604928', 13, 'http://www.shaoqun.com/a/56793.aspx', 'JQueryEasyUI validatebox自带了几种自带的验证方法，比如非空、邮箱、异步、字符长短等验证方式，但是这些远远满足不了我们自己的使用，先整理了一些扩展方法，使其验证方式更为丰富！', '2', 1449803362761),
	('675150669342183424', 'Class.forName、.class(属性)、getClass()的区别', '675149296445820928', 13, 'http://blog.sina.com.cn/s/blog_7ffb8dd5010127ix.html', 'Java中反射机制和Class.forName、实例对象.class(属性)、实例对象getClass()的区别', '2', 1449803437921),
	('675150887483740160', 'RunJS - 在线编辑', '674821983871045632', 12, 'http://runjs.cn/', 'RunJS - 在线编辑、展示、分享、交流你的 JavaScript 代码', '2', 1449803489930),
	('675151186768302080', 'Python菜鸟教程', '674820323560001536', 13, 'http://www.runoob.com/python/python-intro.html', 'Python 是一个高层次的结合了解释性、编译性、互动性和面向对象的脚本语言。\r\nPython 的设计具有很强的可读性，相比其他语言经常使用英文关键字，其他语言的一些标点符号，它具有比其他语言更有特色语法结构。\r\n    Python 是一种解释型语言： 这意味着开发过程中没有了编译这个环节。类似于PHP和Perl语言。\r\n    Python 是交互式语言： 这意味着，您可以在一个Python提示符，直接互动执行写你的程序。\r\n    Python 是面向对象语言: 这意味着Python支持面向对象的风格或代码封装在对象的编程技术。\r\n    Python 是初学者的语言：Python 对初级程序员而言，是一种伟大的语言，它支持广泛的应用程序开发，从简单的文字处理到 WWW 浏览器再到游戏。\r\n', '2', 1449803561285),
	('675151578767953920', 'Bootstrap 教程', '675141345605718016', 13, 'http://www.runoob.com/bootstrap/bootstrap-tutorial.html', 'Bootstrap，来自 Twitter，是目前最受欢迎的前端框架。Bootstrap 是基于 HTML、CSS、JAVASCRIPT 的，它简洁灵活，使得 Web 开发更加快捷。\r\n本教程将向您讲解 Bootstrap 框架的基础，通过学习这些内容，您将可以轻松地创建 Web 项目。教程被分为 Bootstrap 基本结构、Bootstrap CSS、Bootstrap 布局组件和 Bootstrap 插件几个部分。每个部分都包含了与该主题相关的简单有用的实例。', '2', 1449803654745),
	('675152003621588992', 'jTemplates模板', '675152771321827328', 14, 'http://www.cnblogs.com/mahaisong/archive/2011/04/28/2031315.html', '它是一个基于jQuery开发的javascript模板引擎。它主要的作用如下：\r\n1. 通过JavaScript获取JSON形式的数据；\r\n2. 获取一个HTML模板，与数据相结合，生成页面HTML', '2', 0),
	('675153487381794816', 'jTemplates 学习使用笔记', '675152771321827328', 14, 'http://www.cnblogs.com/gotoschool/archive/2013/03/11/2954135.html', '最近需要开发一套网站平台，顺应网络发展的潮流，也是为了程序猿更好的偷懒，使用JQuery的jTemplates模版开发给我们节约了很多时间，也写一篇文章记录下对该技术的学习。知识点在网上都有了，就是理顺下如何运用，变成自己的知识。\r\n\r\njTemplates的官方网：http://jtemplates.tpython.com', '2', 1449804109794),
	('675153971362533376', 'jquery.validate', '674821983871045632', 14, 'http://zfy421.iteye.com/blog/1404797', 'jquery.validate 的使用方法 - 程序猿 - ITeye技术网站', '2', 1449804225184),
	('675154212291743744', '十种常见的排序算法，面试算法必考', '675154090036170752', 13, 'http://www.educity.cn/zk/1122650.html', '十种常见的排序算法，面试算法必考', '2', 1449804282626),
	('675154542706429952', '鸟哥的 Linux 私房菜', '674823862122319872', 14, 'http://vbird.dic.ksu.edu.tw/linux_basic/linux_basic.php', '底下的几篇文章是学习Linux的基础文件，这些文件是基础中的基础，如果您能将其中的文件都看完并且消化过，那么未来在管理 Linux主机以及架设网站方面，就能够达到『事半功倍』的成效，请不要忽略这部份了！否则，再怎么讨论都是枉然的啦！^_^。 因为Linux的数据非常的多，每份数据彼此的相关性都很强，要单独的一项一项讲解并不容易， 所以底下的文件该怎么看呢？建议先按照顺序将内容大致浏览过一次，看不懂的地方也可以先略过不要紧。 全部看完之后，再从头开始『仔细』的实际操作过一遍，那应该就能够进入Linux的世界啰～\r\n', '2', 1449804361403),
	('675155290857017344', 'TOMCAT起步内存溢出问题', '675155341872336896', 14, 'http://blog.sina.com.cn/s/blog_766ea7410102v019.html', 'TOMCAT起步内存溢出问题Exception in thread ""http-bio-8080"-exec-6& [此博文包含图片] ', '2', 0),
	('675155906169802752', ' jTemplates用法 ', '675152771321827328', 15, 'http://www.360doc.com/content/11/0818/11/1108510_141374710.shtml', '1.通过JS获取JSON形式的数据；\r\n2.获取一个HTML模板，与数据相结合，生成页面HTML。 ', '2', 1449804686478),
	('675156460514185216', 'Fedora Core 4 Release 安装手记', '674821731386527744', 15, 'http://linux.chinaunix.net/techdoc/system/2008/12/22/1054286.shtml', 'Fedora Core 4 Release 安装手记\r\n刚刚下载完FC4，安装完了，现在把我安装的大体经过写一下，仅供参考。', '2', 1449804818644),
	('675156670409740288', 'validatebox 验证集合', '675141284276604928', 15, 'http://www.cnblogs.com/zhxhdean/archive/2011/09/21/2184153.html', 'easyui validatebox 验证集合 - BarneyZhang - 博客园', '2', 1449804868687),
	('675156857370841088', 'Easy ui 处理显示时间问题', '675141284276604928', 15, 'http://www.cnblogs.com/yhyjy/archive/2013/01/31/2887515.html', '由于easy ui问题 在处理时间问题 不是很好 所以碰见这个时间格式化问题很棘手 \r\n\r\n新手在用easy ui 时碰见了 会出现"/Date(1359624681687)/“ 这种问题 好 不多说 上代码', '2', 1449804913262),
	('675157081774493696', 'eclipse 反应慢 优化', '674821731386527744', 15, 'http://www.cnblogs.com/yhyjy/archive/2013/01/31/2887515.html', 'eclipse 反应慢 优化 - 记录技术点点之路 - ITeye技术网站', '2', 1449804966764),
	('675157460025217024', 'CSDN下载频道', '674820746681389056', 16, 'http://download.csdn.net/', 'CSDN下载频道', '2', 1449805056946),
	('675157734257201152', '在线测试平台 | Highcharts中文网', '675157833016283136', 16, 'http://www.hcharts.cn/test/index.php?from=demo&p=99', '在线测试平台 | Highcharts中文网', '2', 0),
	('675158254426394624', 'beanfactory和factorybean异同', '675149296445820928', 16, 'http://chenzehe.iteye.com/blog/1481476', 'beanfactory和factorybean异同', '2', 1449805246346),
	('675158409426898944', 'Hashmap实现原理', '675149296445820928', 16, 'http://www.cnblogs.com/xwdreamer/archive/2012/05/14/2499339.html', '0.参考文献：\r\nhash算法 (hashmap 实现原理)\r\nJava实现的散列表', '2', 1449805283301),
	('675158584102883328', '分享一百多套开发视频教程的下载地址', '674820746681389056', 16, 'http://www.cnblogs.com/xingfuzzhd/archive/2013/11/20/3434408.html', '分享一百多套开发视频教程的下载地址1. 北京圣思Java培训教学视频(资源共享网)\r\n2.Lucene/WebService/SVN/Ant/SpringMVC视频(学习资料库网)\r\n3.JUnit和Ant视频教程(VeryCD社区)\r\n4.《张孝祥JAVA视频教程》完整版[RMVB](东西网)\r\n5.历经5年锤炼(史上最适合初学者入门的Java基础视频)(传智播客)\r\n6.30天轻松掌握JavaWeb视频(传智播客)\r\n。。。。。。。。。。。。。。', '2', 1449805324947),
	('675158892300341248', '王道论坛', '674820746681389056', 16, 'http://www.cskaoyan.com/search.php?searchid=86&orderby=lastpost&ascdesc=desc&searchsubmit=yes', '王道论坛，考研计算机网站', '2', 1449805398427),
	('675159144482869248', '开源中国', '674820746681389056', 16, 'http://www.oschina.net/', '开源中国，', '2', 1449805458552),
	('675159390873063424', 'git@OSC', '674820746681389056', 16, 'http://git.oschina.net/', ' Beyond Coding , Social Collaboration\r\n不只是编码，我们更注重社会化协作！ ', '2', 1449805517296),
	('675159947687890944', 'AngularJS视频教程', '674821983871045632', 17, 'http://down.51cto.com/zt/5851', 'AngularJS是为了克服HTML在构建应用上的不足而设计的。Egghead.io 出品的AngularJS视频，从零开始学习，这套视频在youtube有，现在下载过来分享给大家一起学习，AngularJS确实值得学习，有很多思想可以参考。', '2', 1449805650051),
	('675160077581291520', 'github', '674820746681389056', 17, 'https://github.com/', 'github', '2', 1449805681020),
	('675160750393790464', 'MD5加密解密', '674821731386527744', 17, 'http://pmd5.com/#', 'MD5加密解密', '2', 1449805841431),
	('675161342319136768', 'stack overflow', '674820746681389056', 17, 'http://stackoverflow.com/', 'Stack Overflow是一个与程序相关的IT技术问答网站。用户可以在网站免费提交问题，浏览问题，索引相关内容，在创建主页的时候使用简单的HTML。', '2', 1449805982557),
	('675161726303473664', '网易邮箱', '674820787856871424', 17, 'http://mail.163.com/#return', 'bingyi7987@163.com\r\n网易邮箱', '2', 0),
	('675162942878126080', 'Dict海词词典', '674821731386527744', 17, 'http://dict.cn/', '海词词典，一个在线词典网站', '2', 1449806364160),
	('675163561407942656', '百灵企业邮箱', '674820962809679872', 1, 'http://mail.centling.com/', '百灵企业邮箱', '2', 0),
	('675164535790899200', '协同办公平台', '674820962809679872', 1, 'http://192.168.206.166:7890/oa/modules/portal/portalService.do?fromNavigation=true&toPage=', '协同办公平台 - 魏申鹏(青岛百灵信息科技有限公司)', '2', 1449806743940),
	('675164654045106176', 'Wiki Dashboard', '674820962809679872', 1, 'http://135.252.137.29/dashboard/', 'Wiki Dashboard', '2', 1449806772134),
	('675164945154969600', 'My Dashboard | Review Board', '674820962809679872', 1, 'http://135.252.137.12/dashboard/', 'My Dashboard | Review Board', '2', 1449806841540),
	('675165091280326656', '远程蓝领定制化系统', '674820962809679872', 1, 'http://58.64.204.70:8080/bluecollar/r/login', '远程蓝领定制化系统', '2', 1449806876379),
	('675165204199378944', '南光会议会展管理及智能营销系统', '674820962809679872', 1, 'http://www.namkwong.org:8081/r/admin/index', '南光会议会展管理及智能营销系统', '2', 1449806903301),
	('675165319861506048', 'TYOMS', '674820962809679872', 1, 'http://115.29.48.131/', 'TYOMS', '2', 1449806930877),
	('675165430767292416', '蓝领定制化系统', '674820962809679872', 1, 'http://localhost:8080/bluecollar/r/login', '蓝领定制化系统', '2', 1449806957319),
	('675165704617594880', 'Java反射机制深入研究', '675149296445820928', 17, 'http://www.cnblogs.com/linjiqin/archive/2011/02/13/1953198.html', 'Java反射是Java语言的一个很重要的特征，它使得Java具体了“动态性”。\r\n在Java运行时环境中，对于任意一个类，能否知道这个类有哪些属性和方法？对于任意一个对象，能否调用它的任意一个方法？答案是肯定的。这种动态获取类的信息以及动态调用对象的方法的功能来自于Java语言的反射（Reflection）机制。\r\nJava反射机制主要提供了以下功能：\r\n在运行时判断任意一个对象所属的类。\r\n在运行时构造任意一个类的对象。\r\n在运行时判断任意一个类所具有的成员变量和方法。\r\n在运行时调用任意一个对象的方法。', '2', 1449807022610),
	('675165852068352000', '淘宝网 - 淘！我喜欢', '674821216418271232', 1, 'http://www.taobao.com/', '淘宝网 - 淘！我喜欢', '2', 1449807057765),
	('675165957022420992', '海天PT @ 山东科技大学', '674821216418271232', 1, 'http://www.taobao.com/', '海天PT @ 山东科技大学', '2', 1449807082788),
	('675166146617544704', '大街网_预见新自己', '674821274614239232', 1, 'http://www.dajie.com/home', '大街网_预见新自己！ - 魏申鹏', '2', 1449807127991),
	('675166955287744512', '大街网-我投递的职位 - dajie.com', '674821274614239232', 1, 'http://job.dajie.com/job/apply?from=notice_jobapply_feedback&noticeId=152382605#company', '大街网-我投递的职位 - dajie.com', '2', 1449807320793),
	('675167061906952192', '企业反馈', '674820962809679872', 1, 'http://i.zhaopin.com/PositionRecord/jobpostrecord/allmsg', '企业反馈', '2', 1449807346213),
	('675167151845412864', '青岛人力资源和社会保障局', '674820962809679872', 1, 'http://www.qdhrss.gov.cn/pages/wsbs/syzp/index.html', '青岛人力资源和社会保障局', '2', 1449807367656),
	('675167246888341504', 'Message Center--My51job--个人服务', '674820962809679872', 1, 'http://my.51job.com/my/95923266/My_Pmc.php?303125004', 'Message Center--My51job--个人服务', '2', 1449807390316),
	('675167388265746432', '我的首页_猎聘网:Liepin.com', '674820962809679872', 1, 'http://c.liepin.com/?time=1429015654410', '我的首页_猎聘网:Liepin.com', '2', 1449807424023),
	('675167496726253568', '51翻墙代理', '674821731386527744', 1, 'https://51fanqiang.com/', '51翻墙代理', '2', 1449807449882),
	('675167675864977408', 'oschina / git-osc - 代码托管 ', '674820746681389056', 1, 'https://git.oschina.net/oschina/git-osc/wikis/%E5%B8%AE%E5%8A%A9#ssh-keys', '帮助 · oschina / git-osc - 代码托管 - 开源中国社区', '2', 1449807492592),
	('675167807209607168', 'Git部署如何用呀？ - 开源中国社区', '674821400057483264', 1, 'http://www.oschina.net/question/1780671_162829?sort=time', 'Git部署如何用呀？ - 开源中国社区', '2', 1449807523907),
	('675185591415083008', 'windows下git bash显示中文 ', '674821400057483264', 1, 'http://blog.csdn.net/self001/article/details/7337182', 'windows下git bash显示中文 ', '2', 1449811763992),
	('675186075869777920', 'yuyishenlan 代码托管 ', '674821400057483264', 17, 'https://git.oschina.net/yuyishenlan/ssh_frame/tree/master', 'yuyishenlan / ssh_frame - 代码托管 - 开源中国社区', '2', 1449811879495),
	('675186207705141248', '个人blog或wiki的搭建', '674821400057483264', 1, 'http://droidcat.bitbucket.org/2015/05/26/blog-or-wiki.html', '个人blog或wiki的搭建——jekyll+markdown+git+github', '2', 1449811910927),
	('675186495769939968', ' CharacterEncodingFilter类 ', '675161873640984576', 18, 'http://blog.csdn.net/heidan2006/article/details/3075730', '很简单很实用的一个过滤器，当前台JSP页面和JAVA代码中使用了不同的字符集进行编码的时候就会出现表单提交的数据或者上传/下载中文名称文件出现乱码的问题，那这个类就可以出场了', '2', 1449811979607),
	('675186650351013888', 'StrutsPrepareAndExecuteFilter的作用', '675161873640984576', 18, 'http://blog.sina.com.cn/s/blog_6ac4c6cb010190ml.html', 'FilterDispatcher是早期struts2的过滤器，后期的都用StrutsPrepareAndExecuteFilter了，如 2.1.6、2.1.8。StrutsPrepareAndExecuteFilter名字已经很能说明问题了，prepare与execute，前者表示准备，可以说是指filter中的init方法，即配制的导入；后者表示进行过滤，指doFilter方法，即将request请求，转发给对应的 action去处理。', '2', 1449812016462),
	('675186769540550656', ' ContextLoaderListener作用详解 ', '675161873640984576', 18, 'http://blog.csdn.net/ysughw/article/details/8992322', 'ContextLoaderListener监听器的作用就是启动Web容器时，自动装配ApplicationContext的配置信息。因为它实现了ServletContextListener这个接口，在web.xml配置这个监听器，启动容器时，就会默认执行它实现的方法。至于ApplicationContext.xml这个配置文件部署在哪，如何配置多个xml文件，书上都没怎么详细说明。现在的方法就是查看它的API文档。在ContextLoaderListener中关联了ContextLoader这个类，所以整个加载配置过程由ContextLoader来完成。看看它的API说明。', '2', 1449812044879),
	('675186959978729472', 'OpenSessionInViewFilter 原理', '675161873640984576', 18, 'http://blog.sina.com.cn/s/blog_5f9beca40101cnu6.html', 'OpenSessionInView在每次Request请求的时候都打开一个Session放在ThreadLocal里面，该Session在Request期间一直可以使用，当View应用层的逻辑结束后，即filterChain.doFilter(request, response);完成后才会通过OpenSessionInViewFilter的closeSession方法关闭session。OpenSessionInViewFilter调用流程: request->open session并开始transaction->controller->View->结束transaction并close session.', '2', 1449812090283),
	('675187271368052736', 'OpenSessionInViewFilter原理', '675161873640984576', 18, 'http://sunshengleissl126.lofter.com/post/1cc7caf7_4d8187b', 'OpenSessionInViewFilter原理以及为什么要用OpenSessionInViewFilter\r\nstruts2 里面OpenSessionInViewFilter\r\n一定要写在最上面 下面有讲解', '2', 1449812164524),
	('675187406147817472', ' Spring中配置数据源的4种形式 ', '675161873640984576', 18, 'http://blog.csdn.net/orclight/article/details/8616103', '不管采用何种持久化技术，都需要定义数据源。Spring中提供了4种不同形式的数据源配置方式：\r\nspring自带的数据源(DriverManagerDataSource)，DBCP数据源，C3P0数据源,JNDI数据源。', '2', 1449812196658),
	('675187525291216896', 'hibernate session-factory 各种参数配置', '675161873640984576', 18, 'http://blog.knowsky.com/189568.htm', 'hibernate session-factory 各种参数配置', '2', 1449812225064),
	('675187679784210432', ' Hibernate中SessionFactory配置 ', '675161873640984576', 18, 'blog.csdn.net/adverse/article/details/1541221', 'SessionFactory配置\r\n因为Hibernate被设计为可以在许多不同环境下工作，所以它有很多配置参数。幸运的是，大部分都已经有默认值了，Hibernate发行包中还附带有示例的hibernate.properties文件，它演示了一些可变的参数。一般你只需要把这个文件放到你的classpath，配置一下即可。 ', '2', 1449812261898),
	('675187917462835200', 'Struts2中的struts.multipart.saveDir的配置', '675161873640984576', 18, 'http://mossad.iteye.com/blog/1522905', 'Struts2中的struts.multipart.saveDir主要是用来设置上传文件的临时存放地址，而这个参数设置方法的不同对应的地址也不同。', '2', 0),
	('675188034119012352', 'Spring3核心技术之事务管理机制 ', '675161873640984576', 18, 'http://blog.csdn.net/edward0830ly/article/details/8703123', 'Spring提供了许多内置事务管理器实现，常用的有以下几种： \r\n\r\n    DataSourceTransactionManager：位于org.springframework.jdbc.datasource包中，数据源事务管理器，提供对单个javax.sql.DataSource事务管理，用于Spring JDBC抽象框架、iBATIS框架的事务管理；\r\n    HibernateTransactionManager：位于org.springframework.orm.hibernate3或者hibernate4包中，提供对单个org.hibernate.SessionFactory事务支持，用于集成Hibernate框架时的事务管理；该事务管理器只支持Hibernate3+版本，且Spring3.0+版本只支持Hibernate 3.2+版本；\r\n    JtaTransactionManager：位于org.springframework.transaction.jta包中，提供对分布式事务管理的支持，并将事务管理委托给Java EE应用服务器事务管理器；', '2', 1449812346378),
	('675188167577571328', ' redis的java客户端jedis 2.1.0版本使用备忘 ', '674823928019030016', 18, 'http://blog.csdn.net/iterjpnic/article/details/8101496', '工作中要使用redis作为cache server，目前应用是SSH架构，redis官方推荐的java客户端jedis，这里记录我使用过程中的问题和解决办法，jedis版本是2.1.0。', '2', 1449812378197),
	('675188799067787264', 'Struts 2中的constant详解', '675161873640984576', 18, 'http://bhw1015.iteye.com/blog/1258441', '通过对这些属性的配置，可以改变Struts 2 框架的一些默认行为，这些配置可以在struts.xml文件中完成，也可以在struts.properties文件中完成。\r\n', '2', 1449812528756),
	('675189098075525120', 'hibernate generator class="" id详解 (转)', '675161873640984576', 18, 'http://www.cnblogs.com/gywbg/archive/2012/04/22/2464951.html', 'hibernate generator class="" id详解 (转)', '2', 1449812600045),
	('675189343735910400', 'Ehcache 详细解读', '675161873640984576', 18, 'http://raychase.iteye.com/blog/1545906', 'Ehcache 是现在最流行的纯Java开源缓存框架，配置简单、结构清晰、功能强大，最初知道它，是从Hibernate的缓存开始的。网上中文的EhCache材料以简单介绍和配置方法居多，如果你有这方面的问题，请自行google；对于API，官网上介绍已经非常清楚，请参见官网；但是很少见到特性说明和对实现原理的分析，因此在这篇文章里面，我会详细介绍和分析EhCache的特性，加上一些自己的理解和思考，希望对缓存感兴趣的朋友有所收获。', '2', 1449812658615),
	('675189464481533952', '基于按annotation的hibernate主键生成策略', '675161873640984576', 18, 'http://blog.sina.com.cn/s/blog_55bba7c10100f2oh.html', '自定义主键生成策略，由@GenericGenerator实现。\r\nhibernate在JPA的基础上进行了扩展，可以用一下方式引入hibernate独有的主键生成策略，就是通过@GenericGenerator加入的。', '2', 1449812687403),
	('675189676423909376', ' 【SSH进阶之路】实现Spring框架', '675161873640984576', 18, 'http://blog.csdn.net/jiuqiyuliang/article/details/44114763', ' 【SSH进阶之路】一步步重构容器实现Spring框架——从一个简单的容器开始(八)\r\n     【SSH进阶之路】一步步重构容器实现Spring框架——解决容器对组件的“侵入式”管理的两种方案--主动查找和控制反转(九)\r\n     【SSH进阶之路】一步步重构容器实现Spring框架——配置文件+反射实现IoC容器(十)\r\n     【SSH进阶之路】一步步重构容器实现Spring框架——彻底封装，实现简单灵活的Spring框架(十一)（已更新）', '2', 1449812737934),
	('675189789942747136', 'hibernate one-to-many many-to-one 双向注解', '675161873640984576', 18, 'http://www.cnblogs.com/fancyzero/archive/2012/06/10/hibernate-many-to-one_one-to-many-annotation.html', 'hibernate one-to-many many-to-one 双向注解', '2', 1449812764999),
	('675189883312148480', ' Hibernate 实体类注解 ', '675161873640984576', 18, 'http://blog.csdn.net/sleeping_/article/details/6584141', ' Hibernate 实体类注解 ', '2', 1449812787260),
	('675189999251099648', 'Struts2 拦截器详细配置过程', '675161873640984576', 18, 'http://www.blogjava.net/zzzlyr/archive/2009/10/12/297998.html', 'Struts2 拦截器详细配置过程', '2', 1449812814902),
	('675190130688004096', 'Hibernate事务全面介绍', '675161873640984576', 18, 'http://developer.51cto.com/art/200909/153614.htm', 'Hibernate有很多值得学习的地方，这里我们主要介绍Hibernate事务，包括介绍在sessionFactory.openSession()中，Hibernate会初始化数据库连接等方面。\r\n\r\nHibernate是JDBC的轻量级封装，本身并不具备事务管理能力。在事务管理层，Hibernate将其委托给底层的JDBC或者JTA，以实现事务管理和调度功能。\r\n\r\nHibernate事务处理机制基于JDBC Transaction.', '2', 1449812846239),
	('675190436255633408', '搭建Spring MVC3.0', '674821477425614848', 19, 'http://aokunsang.iteye.com/blog/1279322', '  附件中的项目，有网友说有问题，我给删除掉了，以免误导大众。这里只是做个抛砖引玉，了解下springmvc的搭建流程即可、建议使用maven管理jar包，方便实用。\r\n     简单写一个搭建Spring MVC3.0的流程(以Spring3.0.5为列)，数据库交互使用SpringJdbcTemplate，附件有项目（没有jar包）', '2', 1449812919092),
	('675190666392899584', 'Spring MVC 3.0 深入及对注解的详细讲解 ', '674821477425614848', 19, 'http://blog.csdn.net/jzhf2012/article/details/8463783', '核心原理\r\n1.       用户发送请求给服务器。url：user.do\r\n2.       服务器收到请求。发现Dispatchservlet可以处理。于是调用DispatchServlet。\r\n3.       DispatchServlet内部，通过HandleMapping检查这个url有没有对应的Controller。如果有，则调用Controller。\r\n4、    Control开始执行\r\n5.       Controller执行完毕后，如果返回字符串，则ViewResolver将字符串转化成相应的视图对象；如果返回ModelAndView对象，该对象本身就包含了视图对象信息。\r\n6.       DispatchServlet将执视图对象中的数据，输出给服务器。\r\n7.       服务器将数据输出给客户端。', '2', 1449812973961),
	('675190799490748416', ' Java 学习笔记09：Spring搭建MVC WEB项目 ', '674821477425614848', 19, 'http://blog.csdn.net/initphp/article/details/8208349', ' Java 学习笔记09：Spring搭建MVC WEB项目 ', '2', 1449813005694),
	('675191010795589632', 'Spring MVC入门基础项目环境搭建', '674821477425614848', 19, 'http://my.oschina.net/ukapollo/blog/201278?fromerr=MU46Wpn4', 'Spring MVC入门基础项目环境搭建 ==（源码地址：http://git.oschina.net/ukapollo/springmvc）\r\nspring\r\n本文章知道简单的能够搭建Sping MVC环境进行代码基础开发。', '2', 1449813056073),
	('675191330783236096', '注解式控制器开发详解', '674821477425614848', 19, 'http://sishuok.com/forum/blogPost/list/6988.html', ' Spring2.5之前，我们都是通过实现Controller接口或其实现来定义我们的处理器类。已经@Deprecated，建议不再使用了\r\nSpring2.5引入注解式处理器支持，通过@Controller 和 @RequestMapping注解定义我们的处理器类。并且提供了一组强大的注解：\r\n@Controller：用于标识是处理器类；\r\n@RequestMapping：请求到处理器功能方法的映射规则；\r\n@RequestParam：请求参数到处理器功能处理方法的方法参数上的绑定；\r\n@ModelAttribute：请求参数到命令对象的绑定；\r\n@SessionAttributes：用于声明session级别存储的属性，放置在处理器类上，通常列出模型属性（如@ModelAttribute）对应的名称，则这些属性会透明的保存到session中；\r\n@InitBinder：自定义数据绑定注册支持，用于将请求参数转换到命令对象属性的对应类型； ', '2', 0),
	('675231375317667840', 'spring错误汇总 ', '674821477425614848', 19, 'http://blog.csdn.net/chrp99/article/details/8943035', '在学习spring过程中遇见了种种不同的异常错误，这里做了一下总结，希望遇见类似错误的同学们共勉一下。 ', '2', 1449822679725),
	('675231533937856512', 'SpringMVC深度探险（一） SpringMVC前传 ', '674821477425614848', 19, 'http://blog.csdn.net/goalstar/article/details/7627715', '在我们熟知的建立在三层结构（表示层、业务逻辑层、持久层）基础之上的J2EE应用程序开发之中，表示层的解决方案最多。因为在表示层自身的知识触角很多，需要解决的问题也不少，这也就难免造成与之对应的解决方案层出不穷。 \r\n\r\n笔者在很多讨论中经常可以看到类似“某某框架已死”，或者“某某框架已经足以打败所有其他的框架”的言论。事实上，每一种解决方案都有着自身独有的存在价值和历史背景。如果单单从某一个方面或者某几个方面去看一个框架，那么评论难免有失偏颇。 \r\n\r\n所以，整个系列的第一篇文章，我们脱开SpringMVC框架本身，把SpringMVC放到一个更大的知识体系范围之中，讲一讲整个Web开发领域、尤其是MVC框架的发展历程。正如“认识历史才能看清未来”，当我们能够正确审视整个MVC框架的发展历程，也就能够分析它的发展趋势，并且站在一个更高的高度来对所有的解决方案进行评价。 ', '2', 1449822717543),
	('675231678981083136', 'Spring MVC数据绑定大全', '674821477425614848', 19, 'http://www.cnblogs.com/xd502djj/archive/2013/08/08/3245485.html', '刚开始用spring mvc 做web开发时,经常会不知道如何合适绑定页面数据.用惯struts2的朋友更认为spring mvc 绑定数据不如struts2方便(本人最开始也是这么认为),经过一段时间的应用和测试,总结出以下几种情况,希望对刚接触spring mvc 的朋友有所帮助.', '2', 1449822752124),
	('675231804524990464', 'SpringMVC之类型转换Converter ', '674821477425614848', 19, 'http://blog.csdn.net/renhui999/article/details/9837897', ' 在以往我们需要SpringMVC为我们自动进行类型转换的时候都是用的PropertyEditor。通过PropertyEditor的setAsText()方法我们可以实现字符串向特定类型的转换。但是这里有一个限制是它只支持从String类型转为其他类型。在Spring3中引入了一个Converter接口，它支持从一个Object转为另一个Object。除了Converter接口之外，实现ConverterFactory接口和GenericConverter接口也可以实现我们自己的类型转换逻辑。', '2', 1449822782056),
	('675231959399665664', 'springmvc 定时器', '674821477425614848', 19, 'http://blog.csdn.net/xiao_wgs69/article/details/11269391', 'springmvc 定时器', '2', 1449822818981),
	('675232081474883584', 'springMVC定时任务设置', '674821477425614848', 19, 'http://my.oschina.net/u/927151/blog/326697?fromerr=yXMaWhJ5', ' springMVC定时任务设置(工作中用到的一种，欢迎补充)', '2', 1449822848086),
	('675232206054100992', 'SpringMVC框架使用注解执行定时任务', '674821477425614848', 19, 'http://wuzhuti.cn/850.html', '在项目开发过程中，免不了会有一些定时任务。今天就给大家一个SpringMVC框架中利用注解的方式执行定时任务的示例代码', '2', 1449822877788),
	('675232340838060032', 'SpringMVC同名参数绑定问题', '674821477425614848', 19, 'http://segmentfault.com/a/1190000002923372', '今天在使用SpringMVC接收参数的时候，碰到个同名参数绑定的问题，参考了好几篇文章才解决问题，所以自己在这里总结一下。', '2', 1449822909923),
	('675232469380894720', 'Spring+Spring MVC+Hibernate jar包', '674821477425614848', 19, 'http://www.oschina.net/question/1017739_153948?fromerr=SS12HDRT', '配置Spring+Spring MVC+Hibernate需要哪些jar包', '2', 1449822940570),
	('675232623722893312', 'SpringMVC学习系列（9） 之 实现注解式权限验证', '674821477425614848', 19, 'http://www.cnblogs.com/liukemng/p/3751338.html', '对大部分系统来说都需要权限管理来决定不同用户可以看到哪些内容，那么如何在Spring MVC中实现权限验证呢？当然我们可以继续使用servlet中的过滤器Filter来实现。但借助于Spring MVC中的action拦截器我们可以实现注解式的权限验证', '2', 1449822977368),
	('675234508219486208', ' 深入浅出MyBatis-快速入门 ', '675233829690150912', 20, 'http://blog.csdn.net/hupanfeng/article/details/9068003', 'MyBatis的前身叫iBatis，本是apache的一个开源项目, 2010年这个项目由apache software foundation 迁移到了google code，并且改名为MyBatis。MyBatis是支持普通SQL查询，存储过程和高级映射的优秀持久层框架。MyBatis消除了几乎所有的JDBC代码和参数的手工设置以及结果集的检索。MyBatis使用简单的XML或注解用于配置和原始映射，将接口和Java的POJOs（Plan Old Java Objects，普通的Java对象）映射成数据库中的记录。', '2', 1449823426667),
	('675234740277743616', ' Jetty和tomcat的比较 ', '675155341872336896', 19, 'http://blog.csdn.net/classicbear/article/details/6968930', 'Jetty和tomcat的比较', '2', 1449823481994),
	('675235051377659904', 'myBatis入门例子', '675233829690150912', 20, 'http://yancc.iteye.com/blog/983815', '1，本文采用的Mybatis框架版本为： mybatis-3.0.4.jar\r\n2， 以持久化一个简单的User bean为例 ', '2', 1449823556166),
	('675236752767717376', 'MyBatis入门学习（一） ', '675233829690150912', 20, 'http://blog.csdn.net/huzheaccp/article/details/7399124/', '所需要jar包：mybatis-3.x.x.jar 、如果需要和spring整合，还需要加入相关的包', '2', 1449823961809),
	('675236950671757312', 'mybatis实战教程之三:实现数据的增删改查', '675233829690150912', 20, 'http://blog.csdn.net/kutejava/article/details/9164353#t2', '前面已经讲到用接口的方式编程。如果不一致就会出错,这一章主要在上一讲基于接口编程的基础上完成如下事情:\r\n1. 用 mybatis 查询数据，包括列表\r\n2. 用 mybatis 增加数据\r\n3. 用 mybatis 更新数据.\r\n4. 用 mybatis 删除数据.', '2', 1449824008993),
	('675237115939917824', 'Struts2 中result type属性说明', '675233829690150912', 20, 'http://www.cnblogs.com/shihujiang/archive/2012/06/10/2543911.html', 'Struts2 中result type属性说明', '2', 1449824048396),
	('675237502021406720', 'FreeMark语法简介 ', '674821983871045632', 20, 'http://blog.csdn.net/zijingwj/article/details/5845898', '一．Freemarker简介\r\n二．环境搭建与配置\r\n三．常用语法\r\n四．与Struts结合\r\n五．生成Html页面', '2', 1449824140445),
	('675237659609796608', 'Mapper XML 文件', '675233829690150912', 20, 'http://mybatis.org/mybatis-3/zh/sqlmap-xml.html', 'MyBatis 的真正强大在于它的映射语句，也是它的魔力所在。由于它的异常强大，映射器的 XML 文件就显得相对简单。如果拿它跟具有相同功能的 JDBC 代码进行对比，你会立即发现省掉了将近 95% 的代码。MyBatis 就是针对 SQL 构建的，并且比普通的方法做的更好。', '2', 1449824178017),
	('675237820192919552', 'mybatis关系映射之一对多和多对一', '675233829690150912', 20, 'http://www.mamicode.com/info-detail-188913.html', '标签：style   blog   http   os   io   使用   java   ar   for  ', '2', 1449824216303),
	('675237933573345280', '深入浅出MyBatis-MapperBuilder', '675233829690150912', 20, 'http://blog.csdn.net/hupanfeng/article/details/9098453', '上一章节说道，解析mybatis的配置文件的最后一步是解析mapper元素。每个mapper元素对应一个mapper配置文件，这一章节就来讲讲这个mapper配置文件是如何解析的。', '2', 1449824243335),
	('675238117845897216', 'MyBatis主键生成策略总结（转）', '675233829690150912', 20, 'http://bioubiou.iteye.com/blog/1886557', '在使用MyBatis做持久层时，insert语句默认是不返回记录的主键值，而是返回插入的记录条数；如果业务层需要得到记录的主键时，可以通过配置的方式来完成这个功能\r\n', '2', 1449824287269),
	('675238320233648128', 'MyBatis魔法堂：ResultMap详解', '675233829690150912', 20, 'http://www.cnblogs.com/fsjohnhuang/p/4076592.html', '  MyBatis是基于“数据库结构不可控”的思想建立的，也就是我们希望数据库遵循第三范式或BCNF，但实际事与愿违，那么结果集映射就是MyBatis为我们提供这种理想与现实间转换的手段了，而resultMap就是结果集映射的配置标签了。', '2', 1449824335522),
	('675238466770046976', '使用spring+Mybatis 注解无效 ', '675233829690150912', 20, 'http://ask.csdn.net/questions/188055', '使用spring+Mybatis，使用spring注解，一直报空指针异常，各位麻烦看看', '2', 1449824370459),
	('675238584021815296', 'Mybatis源码学习(一)-整体框架理解', '675233829690150912', 20, 'http://my.oschina.net/u/1458864/blog/293659?fromerr=UIEBSRTo', '初始化Mybatis，所有的配置都在Configuration对象中 使用Mybatis，从SqlSessionFactory工厂中获取SqlSession，从Configuration对象中获取mapper对象，并返回结果 Mybatis在加载mapper的时候对mapper接口的注解进行解析 重要的几个包：io、session、builder、mapper（annotations、binding）、executor', '2', 1449824398414),
	('675238742277099520', 'mybatis入门教程之错误收集', '675233829690150912', 20, 'http://my.oschina.net/KingPan/blog/277424?fromerr=VHLK2Ebf', 'mybatis入门教程之错误收集', '2', 1449824436145),
	('675239012834873344', ' 如何用Maven创建web项目（具体步骤） ', '675238871730098176', 21, 'http://blog.csdn.net/chuyuqing/article/details/28879477', '使用eclipse插件创建一个web project', '2', 1449824500651),
	('675239329790038016', 'Maven入门教程', '675238871730098176', 21, 'http://wentao365.iteye.com/blog/903396', 'Maven是一个采用纯Java编写的开 源项目管理工具。Maven采用了一种被称之为project object model (POM)概念来管理项目，所有的项目配置信息都被定义在一个叫做POM.xml的文件中，通过该文件，Maven可以管理项目的整个声明周期，包括编 译，构建，测试，发布，报告等等。目前Apache下绝大多数项目都已经采用Maven进行管理。而Maven本身还支持多种插件，可以方便更灵活的控制 项目。', '2', 1449824576219),
	('675239520744116224', '学习maven的使用', '675238871730098176', 21, 'http://fluagen.blog.51cto.com/146595/40086/', '早就知道maven 在java 项目的管理方面名声显赫，于是就想着学习掌握之，于是查阅了大量文档。发现这些文档的作者都是java 的大腕，大多都是站在掌握了一定maven 基础的角度上进行介绍，让我这初学者看的云里雾里不知所云。于是又去查看maven 的官方网站，总算是有所了解，但一旦动手实际操作却又雾里看花。唉，没办法，就只有一遍一遍的动手尝试，经过种\r\n种磨难总算是有一点眉目了。', '2', 1449824621746),
	('675239913448411136', 'The central Repository search engine', '675238871730098176', 21, 'http://search.maven.org/#search|ga|1|MySQL', 'The central Repository search engine', '2', 1449824715374),
	('675240780301996032', '一篇很全面的freemarker教程', '675240002451542016', 22, 'http://blog.csdn.net/fhx007/article/details/7902040', 'FreeMarker的模板文件并不比HTML页面复杂多少,FreeMarker模板文件主要由如下4个部分组成:\r\n1,文本:直接输出的部分 。。。', '2', 1449824922048),
	('675241198662848512', 'Myeclipse安装SVN详细图解', '675241340170276864', 23, 'http://blog.sina.com.cn/s/blog_77cb836301018opq.html', 'Myeclipse安装SVN详细图解，SVN版本控制搭建基本步骤', '2', 0),
	('675241885975056384', '阿里云Ubuntu系统搭建SVN服务器', '675241340170276864', 23, 'http://git.devzeng.com/blog/aliyun-ubuntu-svn-server.html', '近期入手了一台阿里云（阿里云是国内优秀的云计算服务提供商，属于阿里巴巴旗下）的云服务器（Ubuntu系统）打算用来做WEB API的服务器，另外为了便于对数据和相关文档的管理需要在服务器上搭建SVN服务器，本文主要是用于记录如何搭建SVN服务器以及在搭建过程中遇到的一些问题。', '2', 1449825185661),
	('675242043806715904', 'CENTOS环境下安装SVN并且同步更新', '674824704753799168', 24, 'http://www.xtaylor.com/centos-svn.html', '近期在阿里云的ESC下安装的WEB环境LNMP，并且需要安装SVN服务，并且要实现站点的同步更新，在网上查看了些资料，记录下来', '2', 1449825223291),
	('675242373160243200', 'js date函数  ', '675242223964655616', 24, 'http://blog.163.com/very_apple/blog/static/2775923620108811722575/', '\r\n       \r\n\r\n下载LOFTER客户端\r\n\r\nDate 对象用于处理日期和时间。\r\n创建 Date 对象的语法：\r\nvar myDate=new Date()\r\nDate 对象会自动把当前日期和时间保存为其初始值。\r\n参数形式有以下５种：   new Date("month dd,yyyy hh:mm:ss");', '2', 1449825301815),
	('675242593004687360', 'js日期时间函数(经典＋完善＋实用)', '675242223964655616', 24, 'http://www.cnblogs.com/bicabo/archive/2010/12/17/1909430.html', 'bicabo\r\njs日期时间函数(经典＋完善＋实用)\r\n\r\n日期时间脚本库方法列表\r\nDate.prototype.isLeapYear 判断闰年\r\nDate.prototype.Format 日期格式化\r\nDate.prototype.DateAdd 日期计算\r\nDate.prototype.DateDiff 比较日期差\r\nDate.prototype.toString 日期转字符串\r\nDate.prototype.toArray 日期分割为数组\r\nDate.prototype.DatePart 取日期的部分信息\r\nDate.prototype.MaxDayOfDate 取日期所在月的最大天数\r\nDate.prototype.WeekNumOfYear 判断日期所在年的第几周\r\nStringToDate 字符串转日期型\r\nIsValidDate 验证日期有效性\r\nCheckDateTime 完整日期时间检查\r\ndaysBetween 日期天数差', '2', 1449825354230),
	('675242794868150272', 'js string 转 int 注意的问题', '675242223964655616', 24, 'http://blog.csdn.net/leidengyan/article/details/5503594', 'javascript——js string 转 int 注意的问题——parseInt ', '2', 1449825402358),
	('675243045364568064', '正则表达式30分钟入门教程', '675242900774326272', 24, 'http://www.cnblogs.com/deerchao/archive/2006/08/24/zhengzhe30fengzhongjiaocheng.html', '\r\n    如果你没有正则表达式的基础，请跟着教程“一步步来”。请不要大概地扫两眼就说看不懂——以这种态度我写成什么样你也看不懂。当我告诉你这是“30分钟入门教程”时，请不要试图在30秒内入门。\r\n\r\n    事实是，我身边有个才接触电脑，对操作都不是很熟练的人通过自己学习这篇教程，最后都能在文章采集系统中使用正则表达式完成任务。而且，他写的表达式中，还使用了“零宽断言”等“高级”技术。\r\n\r\n    所以，如果你能具体地说明你的问题，我很愿意帮助你。但是如果你概括地说看不懂，那不是我的问题。\r\n    欢迎转载，但请声明作者以及来源。\r\n', '2', 1449825462081),
	('675243155939004416', '常用正则表达式', '675242900774326272', 24, 'http://www.williamlong.info/archives/433.html', '正则表达式（Regular Expression，在代码中常简写为regex、regexp或RE）是计算机科学的一个概念。正则表达式使用单个字符串来描述、匹配一系列符合某个句法规则的字符串。在很多文本编辑器里，正则表达式通常被用来检索、替换那些符合某个模式的文本。许多程序设计语言都支持利用正则表达式进行字符串操作。在很多文本编辑器里，正则表达式通常被用来检索、替换那些符合某个模式的文本。', '2', 1449825488444),
	('675243467814866944', ' SpringMVC+ajaxfileupload文件上传返回json', '674821477425614848', 24, 'http://www.oschina.net/question/107380_151555?fromerr=dbHZ8VYZ', ' SpringMVC+ajaxfileupload文件上传返回json下载？请大神指导！\r\n\r\n利用ajaxfileupload文件上传，后台处理springmvc 返回json，但是提示下载json ', '2', 1449825562801),
	('675243636362973184', 'SpringMVC结合ajaxfileupload.js实现文件无刷新上传 ', '674821477425614848', 24, 'http://www.open-open.com/lib/view/open1379579369943.html', 'SpringMVC结合ajaxfileupload.js实现文件无刷新上传 ', '2', 1449825602986),
	('675243920430600192', 'SpringMVC多文件上传，使用的MultipartFile', '674821477425614848', 24, 'http://blog.csdn.net/swingpyzf/article/details/20230865', '基本的SpringMVC的搭建在我的上一篇文章里已经写过了，这篇文章主要说明一下如何使用SpringMVC进行表单上的文件上传以及多个文件同时上传的步骤\r\nSpringMVC 基础教程 框架分析：http://blog.csdn.net/swingpyzf/article/details/8885459\r\nSpringMVC 基础教程 简单入门实例：http://blog.csdn.net/swingpyzf/article/details/8904205\r\n文件上传项目的源码下载地址：http://download.csdn.net/detail/swingpyzf/6979915', '2', 1449825670713),
	('675244495356432384', 'Java实现切图功能', '675149296445820928', 24, 'http://www.what21.com/programming/java/java-gui/image-cut.html', 'JDK1.6开发，将原图片按宽度和高度切成若干个图片进行保存。', '2', 1449825807786),
	('675244917097893888', 'Redis 教程 API', '674823928019030016', 25, 'http://www.runoob.com/redis/redis-tutorial.html', 'REmote DIctionary Server(Redis) 是一个由Salvatore Sanfilippo写的key-value存储系统。\r\n\r\nRedis是一个开源的使用ANSI C语言编写、遵守BSD协议、支持网络、可基于内存亦可持久化的日志型、Key-Value数据库，并提供多种语言的API。\r\n\r\n它通常被称为数据结构服务器，因为值（value）可以是 字符串(String), 哈希(Map), 列表(list), 集合(sets) 和 有序集合(sorted sets)等类型。', '2', 1449825908337),
	('675245053966422016', 'Redis的简介与安装', '674823928019030016', 25, 'http://www.cnblogs.com/mbailing/p/3899965.html', 'Redis是一个key-value存储系统。和Memcached类似，它支持存储的value类型相对更多，包括string(字符串)、list(链表)、set(集合)、zset(sorted set --有序集合)和hash（哈希类型）。这些数据类型都支持push/pop、add/remove及取交集并集和差集及更丰富的操作，而且这些操作都是原子性的。在此基础上，redis支持各种不同方式的排序。与memcached一样，为了保证效率，数据都是缓存在内存中。区别的是redis会周期性的把更新的数据写入磁盘或者把修改操作写入追加的记录文 件，并且在此基础上实现了master-slave(主从)同步。', '2', 1449825940969),
	('675245340521271296', ' linux tar.gz zip 解压缩 压缩命令 ', '674823862122319872', 25, 'http://blog.csdn.net/mmllkkjj/article/details/6768294', ' linux tar.gz zip 解压缩 压缩命令 ', '2', 1449826009289),
	('675245493151993856', 'Ubuntu 12.10 安装 jdk-7u10-linux-x64.tar.gz', '674823862122319872', 25, 'http://www.linuxidc.com/Linux/2012-12/76532.htm', '在Ubuntu 12.10下安装 jdk-7u10-linux-x64.tar.gz\r\n总的原则：将jdk-7u10-linux-x64.tar.gz压缩包解压至/usr/lib/jdk，设置jdk环境变量并将其修改为系统默认的jdk', '2', 1449826045679),
	('675245624534372352', 'Linux下tomcat7安装详细教程', '674823862122319872', 25, 'http://www.webkfa.com/one12/w407.html', 'Linux下tomcat7安装详细教程 ', '2', 1449826077003),
	('675245773079842816', '主机windows无法访问虚拟机Linux中tomcat服务', '674823862122319872', 25, 'http://www.07net01.com/program/326150.html', '  在wmware中安装Linux后安装好数据库，JDK及tomcat后启动服务，虚拟机中可以访问，但是主机却无法访问，但是同时主机和虚拟机之间可以ping的通。  网上查阅资料后  第一种解决方法是关闭虚拟机中的防火墙服务。桌面--管理--安全级别与防火墙，将防火墙设置为：disable即可。或用root登录后，执行  service iptables stop --停止  service iptables start --启动', '2', 1449826112419),
	('675245893527670784', 'Redhat中安装JDK', '674823862122319872', 25, 'http://www.linuxidc.com/Linux/2013-09/90674.htm', '本文选择在VMware虚拟机上的RedHat6中安装JDK', '2', 1449826141136),
	('675246042500960256', 'RedHat5.8下RPM包方式安装MySQL5.6', '674823862122319872', 25, 'http://www.xuebuyuan.com/2081898.html', 'RedHat5.8下RPM包方式安装MySQL5.6', '2', 1449826176654),
	('675246198927527936', 'Access denied for user', '674823862122319872', 25, 'http://blog.csdn.net/qq160816/article/details/7722680', '错误描述: Mysql中添加用户之后可能出现登录时提示ERROR 1045 (28000): Access denied for user的错误.删除user.user中值为NULL的,或更新NULL为test 1)delete from user where user is NULL 2)update user set user=‘test‘ where user is NULL.意外的情况: 如果上述方法没有效果,依然出现空用户,则可以利用图形化用户client删除. ', '2', 1449826213949),
	('675246291390959616', 'Linux下查看MySQL的安装路径', '674823862122319872', 25, 'http://www.linuxidc.com/Linux/2012-08/69398.htm', 'Linux下查看mysql、apache是否安装,并卸载。', '2', 1449826235994),
	('675246601660403712', 'redhat 6下的mysql怎么登陆？', '674823862122319872', 25, 'http://zhidao.baidu.com/link?url=Ge3El-ZjER3D_UlNZS-oSKCTjeMiWWI6dVnCQhumayOm10qd2uwZNKmpmqz-PnxHmHvoNsHZS087jxlGAJr8xK', '刚安装mysql后，输入mysql，显示ERROR 1045 ', '2', 1449826309968),
	('675246959514226688', 'Access denied for user (using password: YES)', '674823862122319872', 25, 'http://bbs.csdn.net/topics/350026612/', '装了mysql后,不知道什么时候执行了一次mysqladmin...的命令,\r\n再连接数据库就出现了这种问题了:\r\nAccess denied for user   (using password: YES)', '2', 1449826395287),
	('675247089470541824', 'RedHat 配置Java开发环境', '674823862122319872', 25, 'http://www.linuxidc.com/Linux/2010-12/30604.htm', 'RedHat 配置Java开发环境', '2', 1449826426271),
	('675247486230728704', '5种调优Java NIO和NIO.2的方式', '674824664115187712', 26, 'http://www.importnew.com/2000.html', 'Java NIO(New Input/Output)——新的输入/输出API包——是2002年引入到J2SE 1.4里的。Java NIO的目标是提高Java平台上的I/O密集型任务的性能。过了十年，很多Java开发者还是不知道怎么充分利用NIO，更少的人知道在Java SE 7里引入了更新的输入/输出 API（NIO.2）。这篇教程展示了5个在Java编程的一些常见场景里使用NIO和NIO.2包的简单示例', '2', 1449826520866),
	('675247674970214400', 'Java NIO系列教程 ', '674824664115187712', 26, 'http://ifeve.com/overview/', 'Java NIO系列教程（一） Java NIO 概述', '2', 1449826565865),
	('675247801097129984', 'Java NIO 系列教程   ', '674824664115187712', 26, 'http://www.iteye.com/magazines/132-Java-NIO', 'Java NIO（New IO）是从Java 1.4版本开始引入的一个新的IO API，可以替代标准的Java IO API。本系列教程将有助于你学习和理解Java NIO。感谢并发编程网的翻译和投递。', '2', 1449826595936),
	('675247921570123776', 'Java NIO原理图文分析及代码实现', '674824664115187712', 26, 'http://weixiaolu.iteye.com/blog/1479656', '最近在分析hadoop的RPC(Remote Procedure Call Protocol ，远程过程调用协议，它是一种通过网络从远程计算机程序上请求服务，而不需要了解底层网络技术的协议。可以参考：http://baike.baidu.com/view/32726.htm ）机制时，发现hadoop的RPC机制的实现主要用到了两个技术：动态代理（动态代理可以参考博客：http://weixiaolu.iteye.com/blog/1477774 ）和java NIO。为了能够正确地分析hadoop的RPC源码，我觉得很有必要先研究一下java NIO的原理和具体实现', '2', 1449826624659),
	('675248100482355200', 'Centos下开启mysql远程连接管理', '674824704753799168', 27, 'http://blog.sina.com.cn/s/blog_9e30636601019hhr.html', '新安装的MySQL是默认不开户远程访问权限的，也就不能外部连接MySQL。这样对想远程调用MySQL的数据很不方便。下面我们来看下如何设置允许远程连接MySQL数据库。', '2', 1449826667315),
	('675248265540800512', ' 阿里云 帐号登录', '674824704753799168', 27, 'https://account.aliyun.com/login/login.htm', ' 阿里云 帐号登录', '2', 1449826706668),
	('675248435263311872', '微信公众平台', '674820746681389056', 27, 'https://mp.weixin.qq.com/', '微信公众平台', '2', 1449826747133),
	('676271184249229312', ' 微信授权登陆接入第三方App（步骤总结）Android', '676268796914307072', 28, 'http://blog.csdn.net/qq247890212/article/details/40822481', '这几天开发要用到微信授权的功能，所以就研究了一下。可是微信开放平台接入指南里有几个地方写的不清不楚。在此总结一下，以便需要的人。\r\n很多微信公众平台的应用如果移植到app上的话就需要微信授权登陆了。', '2', 1450070589493),
	('676271453959753728', ' 微信OAuth授权获取用户OpenId-JAVA(个人经验)', '676268796914307072', 27, 'http://www.sxt.cn/u/1094/blog/918', ' http://mp.weixin.qq.com/wiki这个是官网的接口文档\r\n微信授权获取用户openid-JAVA ', '2', 1450070653797),
	('676271627746545664', '微信公众平台开发教程 ----网页授权获取用户基本信息', '676268796914307072', 28, 'http://www.cnblogs.com/zyw-205520/p/3581088.html', '　　　OAuth是一个开放协议，允许用户让第三方应用以安全且标准的方式获取该用户在某一网站、移动或桌面应用上存储的私密的资源（如用户个人信息、照片、视频、联系人列表），而无需将用户名和密码提供给第三方应用。\r\n\r\nOAuth 2.0是OAuth协议的下一版本，但不向后兼容OAuth 1.0。 OAuth 2.0关注客户端开发者的简易性，同时为Web应用，桌面应用和手机，和起居室设备提供专门的认证流程。\r\n\r\n　　　　OAuth允许用户提供一个令牌，而不是用户名和密码来访问他们存放在特定服务提供者的数据。每一个令牌授权一个特定的网站（例如，视频编辑网站)在特定的时段（例如，接下来的2小时内）内访问特定的资源（例如仅仅是某一相册中的视频）。这样，OAuth允许用户授权第三方网站访问他们存储在另外的服务提供者上的信息，而不需要分享他们的访问许可或他们数据的所有内容。（来自于网络）', '2', 1450070695232),
	('676671570399334400', '微信开发者平台', '676268796914307072', 28, 'http://open.weixin.com/forum.php', '微信开发者平台', '2', 1450166048990);
/*!40000 ALTER TABLE `collectLink` ENABLE KEYS */;


-- 导出  表 collect.linkType 结构
DROP TABLE IF EXISTS `linkType`;
CREATE TABLE IF NOT EXISTS `linkType` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pid` varchar(50) DEFAULT '0',
  `level` int(4) DEFAULT '0',
  `sort` int(4) DEFAULT '0',
  `userId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类';

-- 正在导出表  collect.linkType 的数据：~37 rows (大约)
DELETE FROM `linkType`;
/*!40000 ALTER TABLE `linkType` DISABLE KEYS */;
INSERT INTO `linkType` (`id`, `name`, `pid`, `level`, `sort`, `userId`) VALUES
	('674820323560001536', 'API', '0', 1, 0, '2'),
	('674820666570182656', 'Study文档', '0', 1, 0, '2'),
	('674820746681389056', '开发网站', '0', 1, 0, '2'),
	('674820787856871424', '公司', '0', 1, 0, '2'),
	('674820876285382656', '图片处理', '0', 1, 0, '2'),
	('674820962809679872', '百灵', '674820787856871424', 2, 0, '2'),
	('674821170478059520', '源码参考', '0', 1, 0, '2'),
	('674821216418271232', 'freetime', '0', 1, 0, '2'),
	('674821274614239232', '招聘', '674820787856871424', 2, 0, '2'),
	('674821400057483264', 'GIT', '674821731386527744', 2, 0, '2'),
	('674821477425614848', 'springmvc', '674820666570182656', 1, 0, '2'),
	('674821554294624256', 'mybatis', '674820666570182656', 2, 0, '2'),
	('674821608942211072', 'maven', '674820666570182656', 2, 0, '2'),
	('674821669440851968', 'freemarker', '674820666570182656', 2, 0, '2'),
	('674821731386527744', '开发工具', '0', 1, 0, '2'),
	('674821983871045632', '前端文档', '0', 1, 0, '2'),
	('674822096848818176', '正则表达式', '674820666570182656', 2, 0, '2'),
	('674823862122319872', 'linux', '0', 1, 0, '2'),
	('674823928019030016', 'redis', '674821731386527744', 2, 0, '2'),
	('674824664115187712', 'JAVA NIO', '674820666570182656', 2, 0, '2'),
	('674824704753799168', '阿里云', '0', 1, 0, '2'),
	('675141284276604928', 'easyui', '674821983871045632', 2, 0, '2'),
	('675141345605718016', 'bootstrap', '674821983871045632', 2, 0, '2'),
	('675149296445820928', 'Java', '674820666570182656', 2, 0, '2'),
	('675152771321827328', 'jTemplates', '674820666570182656', 2, 0, '2'),
	('675154090036170752', '面试题', '674820787856871424', 2, 0, '2'),
	('675155341872336896', 'tomcat', '674820666570182656', 2, 0, '2'),
	('675157833016283136', 'highchart', '674821983871045632', 2, 0, '2'),
	('675160904106643456', 'AngularJS', '674821983871045632', 2, 0, '2'),
	('675161873640984576', 'SSH', '0', 1, 0, '2'),
	('675233829690150912', 'mybatis', '0', 1, 0, '2'),
	('675238871730098176', 'maven', '674821731386527744', 2, 0, '2'),
	('675240002451542016', 'freemarker', '674820666570182656', 2, 0, '2'),
	('675241340170276864', 'SVN', '674821731386527744', 2, 0, '2'),
	('675242223964655616', 'JQuery', '674821983871045632', 2, 0, '2'),
	('675242900774326272', '正则表达式', '674821983871045632', 2, 0, '2'),
	('676268796914307072', '微信', '0', 1, 0, '2');
/*!40000 ALTER TABLE `linkType` ENABLE KEYS */;


-- 导出  表 collect.user 结构
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(50) NOT NULL,
  `userName` varchar(50) DEFAULT NULL COMMENT '名称',
  `mobile` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT '0' COMMENT '状态',
  `type` int(11) DEFAULT '0' COMMENT '0普通，1负责人',
  `loginTime` bigint(20) DEFAULT '0' COMMENT '登录时间',
  `createTime` bigint(20) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员';

-- 正在导出表  collect.user 的数据：~2 rows (大约)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `userName`, `mobile`, `password`, `state`, `type`, `loginTime`, `createTime`) VALUES
	('1', 'root', 'root', 'C4CA4238A0B923820DCC509A6F75849B', 1, -1, 1449551432608, 0),
	('2', 'chris', '15201139290', 'C4CA4238A0B923820DCC509A6F75849B', 1, 1, 1450166023745, 1449207880993);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
