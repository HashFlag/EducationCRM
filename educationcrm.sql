-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2020-02-20 13:46:28
-- 服务器版本： 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `educationcrm`
--

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add 校区', 7, 'add_branch'),
(26, 'Can change 校区', 7, 'change_branch'),
(27, 'Can delete 校区', 7, 'delete_branch'),
(28, 'Can view 校区', 7, 'view_branch'),
(29, 'Can add 班级', 8, 'add_classlist'),
(30, 'Can change 班级', 8, 'change_classlist'),
(31, 'Can delete 班级', 8, 'delete_classlist'),
(32, 'Can view 班级', 8, 'view_classlist'),
(33, 'Can add 课程表', 9, 'add_course'),
(34, 'Can change 课程表', 9, 'change_course'),
(35, 'Can delete 课程表', 9, 'delete_course'),
(36, 'Can view 课程表', 9, 'view_course'),
(37, 'Can add 客户表', 10, 'add_customer'),
(38, 'Can change 客户表', 10, 'change_customer'),
(39, 'Can delete 客户表', 10, 'delete_customer'),
(40, 'Can view 客户表', 10, 'view_customer'),
(41, 'Can add menu', 11, 'add_menu'),
(42, 'Can change menu', 11, 'change_menu'),
(43, 'Can delete menu', 11, 'delete_menu'),
(44, 'Can view menu', 11, 'view_menu'),
(45, 'Can add 标签', 12, 'add_tag'),
(46, 'Can change 标签', 12, 'change_tag'),
(47, 'Can delete 标签', 12, 'delete_tag'),
(48, 'Can view 标签', 12, 'view_tag'),
(49, 'Can add user profile', 13, 'add_userprofile'),
(50, 'Can change user profile', 13, 'change_userprofile'),
(51, 'Can delete user profile', 13, 'delete_userprofile'),
(52, 'Can view user profile', 13, 'view_userprofile'),
(53, 'Can add role', 14, 'add_role'),
(54, 'Can change role', 14, 'change_role'),
(55, 'Can delete role', 14, 'delete_role'),
(56, 'Can view role', 14, 'view_role'),
(57, 'Can add payment', 15, 'add_payment'),
(58, 'Can change payment', 15, 'change_payment'),
(59, 'Can delete payment', 15, 'delete_payment'),
(60, 'Can view payment', 15, 'view_payment'),
(61, 'Can add enrollment', 16, 'add_enrollment'),
(62, 'Can change enrollment', 16, 'change_enrollment'),
(63, 'Can delete enrollment', 16, 'delete_enrollment'),
(64, 'Can view enrollment', 16, 'view_enrollment'),
(65, 'Can add 客户跟进记录', 17, 'add_customerfollowup'),
(66, 'Can change 客户跟进记录', 17, 'change_customerfollowup'),
(67, 'Can delete 客户跟进记录', 17, 'delete_customerfollowup'),
(68, 'Can view 客户跟进记录', 17, 'view_customerfollowup'),
(69, 'Can add course record', 18, 'add_courserecord'),
(70, 'Can change course record', 18, 'change_courserecord'),
(71, 'Can delete course record', 18, 'delete_courserecord'),
(72, 'Can view course record', 18, 'view_courserecord'),
(73, 'Can add study record', 19, 'add_studyrecord'),
(74, 'Can change study record', 19, 'change_studyrecord'),
(75, 'Can delete study record', 19, 'delete_studyrecord'),
(76, 'Can view study record', 19, 'view_studyrecord'),
(77, 'Can add contract template', 20, 'add_contracttemplate'),
(78, 'Can change contract template', 20, 'change_contracttemplate'),
(79, 'Can delete contract template', 20, 'delete_contracttemplate'),
(80, 'Can view contract template', 20, 'view_contracttemplate');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$180000$FQHgI7uBNURe$MvPZzE4yeAfa45zVNjLyDNX1sFXrHppJoy603dYmLVc=', '2020-02-14 06:58:13.685945', 1, 'admin', '', '', '', 1, 1, '2020-02-14 06:57:13.224907');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `crm_branch`
--

CREATE TABLE `crm_branch` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `addr` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_branch`
--

INSERT INTO `crm_branch` (`id`, `name`, `addr`) VALUES
(1, '上海校区', '上海市'),
(2, '北京校区', '北京市'),
(3, '深圳校区', '深圳市'),
(4, '成都校区', '成都市');

-- --------------------------------------------------------

--
-- 表的结构 `crm_classlist`
--

CREATE TABLE `crm_classlist` (
  `id` int(11) NOT NULL,
  `class_type` smallint(6) NOT NULL,
  `semester` smallint(5) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `contract_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_classlist`
--

INSERT INTO `crm_classlist` (`id`, `class_type`, `semester`, `start_date`, `end_date`, `branch_id`, `course_id`, `contract_id`) VALUES
(1, 0, 4, '2020-02-14', '2020-10-31', 4, 1, 1),
(2, 0, 4, '2020-02-14', '2020-10-30', 4, 2, 1),
(3, 0, 3, '2020-02-14', '2020-10-30', 3, 2, 1),
(4, 0, 3, '2020-02-14', '2020-10-30', 3, 3, 1),
(5, 2, 2, '2020-02-14', '2020-10-30', 2, 4, 1),
(6, 2, 1, '2020-02-14', '2020-10-30', 1, 5, 1),
(7, 1, 5, '2020-02-20', '2020-12-31', 4, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `crm_classlist_teacher`
--

CREATE TABLE `crm_classlist_teacher` (
  `id` int(11) NOT NULL,
  `classlist_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_classlist_teacher`
--

INSERT INTO `crm_classlist_teacher` (`id`, `classlist_id`, `userprofile_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 1),
(6, 6, 2),
(7, 7, 1);

-- --------------------------------------------------------

--
-- 表的结构 `crm_contracttemplate`
--

CREATE TABLE `crm_contracttemplate` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `template` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_contracttemplate`
--

INSERT INTO `crm_contracttemplate` (`id`, `name`, `template`) VALUES
(1, '技术学习合同', '技术合同\r\n\r\n   甲方（用人单位）名称：_____Education_____\r\n\r\n　　法定代表人：______________ ；委托代理人：_______________\r\n\r\n　　乙方（劳动者）姓名：____{stu_name}____；性别：____________\r\n\r\n　　部门：_____________________；职位：__________________\r\n\r\n　　出生年月：__________________；家庭地址：_______________\r\n\r\n　　身份证号码：_______________； 电话：______{stu_phone}______\r\n\r\n　　根据甲乙双方签署的劳动合同的有关规定，为进一步明确双方的权利和义务，经双方平等协商，同意签订本协议，并共同遵守执行下列条款：\r\n\r\n　　一、甲方的责任、权利、义务：\r\n\r\n　　1、根据工作需要，自 年 月 日至 年 月 日，乙方在 进行有关 （方面）的学习与培训，为期 天。\r\n\r\n　　2、甲方为乙方提供学习（培训）费用预计人民币 元。\r\n\r\n　　3、甲方保证乙方在学习与培训期间享受如下待遇：\r\n\r\n　　（1）________________________________；\r\n\r\n　　（2）________________________________；\r\n\r\n　　（3）________________________________；\r\n\r\n　　4、 甲方有权对乙方的学习情况进行检查监督，并对乙方在学习培训中的不良表现进行惩处。\r\n\r\n　　5、 甲方有权要求乙方自当期劳动合同终止日起必须为甲方服务 年，即自 年 月 日起至 年 月 日止。服务期内，如乙方违反培训协议，应将甲方支付的学习培训费用及违约金按“未履行月数/服务期月数”的比例退还。\r\n\r\n　　二、乙方的责任、权利、义务：\r\n\r\n　　1、学习与培训期间，自觉遵章守纪，努力学习，完成培训任务。\r\n\r\n　　2、若乙方因个人原因未能完成培训任务，乙方须自己出资参加相同培训一次，并作为记录记入年底绩效考核中。\r\n\r\n　　3、一经签订本培训协议，将严格按照培训协议规定的年限为公司服务。乙方无论以何种原因离开公司，将依的相关规定支付相应的培训费用和违约金后，方可办理离职手续。\r\n\r\n　　4、乙方学习培训期满，应将毕业证/合格证交人力资源本部审核。如果成绩不合格，应将甲方支付的学费按比例退还甲方。乙方一次退还有困难的，甲方斟情从其月总收入中扣除。\r\n\r\n　　三、双方约定的其它事宜：\r\n\r\n　　（1）___________________________；\r\n\r\n　　（2）___________________________；\r\n\r\n　　（3）___________________________；\r\n\r\n　　四、本协议作为甲乙双方签订的劳动合同的补充文件，与合同正本具有同样的法律效力。五、甲乙双方在履行本协议发生争议时，可由甲乙双方协商解决。若双方不能协商解决的，双方根据上海市有关法规提请劳动争议仲裁，必要时将通过法律途径解决。\r\n\r\n　　六、本协议一式两份，甲乙双方各执一份，自签字之日起生效。\r\n\r\n　　甲方（签字） 　　乙方（签字）{stu_name}\r\n\r\n　　年 月 日 　　年 月 日\r\n\r\n　　培训后请填：实际培训费用为人民币 {stu_money} 元，违约金 500 元。\r\n\r\n　　财务（签字） 　　乙方（签字）{stu_name}\r\n\r\n　　年 月 日 　　年 月 日');

-- --------------------------------------------------------

--
-- 表的结构 `crm_course`
--

CREATE TABLE `crm_course` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `price` smallint(5) UNSIGNED NOT NULL,
  `period` smallint(5) UNSIGNED NOT NULL,
  `outline` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_course`
--

INSERT INTO `crm_course` (`id`, `name`, `price`, `period`, `outline`) VALUES
(1, 'python', 12000, 8, 'python全栈'),
(2, 'java', 12000, 8, 'java全栈'),
(3, '.NET', 10000, 8, '.NET微软用户界面开发'),
(4, 'C/C++', 12000, 10, 'C/C++开发'),
(5, '设计模式', 6000, 2, '设计模式基础');

-- --------------------------------------------------------

--
-- 表的结构 `crm_courserecord`
--

CREATE TABLE `crm_courserecord` (
  `id` int(11) NOT NULL,
  `day_num` smallint(5) UNSIGNED NOT NULL,
  `has_homework` tinyint(1) NOT NULL,
  `homework_title` varchar(128) DEFAULT NULL,
  `homework_content` longtext,
  `outline` longtext,
  `date` datetime(6) NOT NULL,
  `from_class_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_courserecord`
--

INSERT INTO `crm_courserecord` (`id`, `day_num`, `has_homework`, `homework_title`, `homework_content`, `outline`, `date`, `from_class_id`, `teacher_id`) VALUES
(1, 1, 1, 'faafd', 'Python之禅\r\n\r\n 1 Beautiful is better than ugly.\r\n 2 # 优美胜于丑陋（Python以编写优美的代码为目标）\r\n 3 Explicit is better than implicit.\r\n 4 # 明了胜于晦涩（优美的代码应当是明了的，命名规范，风格相似） \r\n 5 Simple is better than complex.\r\n 6 # 简洁胜于复杂（优美的代码应当是简洁的，不要有复杂的内部实现） \r\n 7 Complex is better than complicated.\r\n 8 # 复杂胜于凌乱（如果复杂不可避免，那代码间也不能有难懂的关系，要保持接口简洁）\r\n 9 Flat is better than nested.\r\n10 # 扁平胜于嵌套（优美的代码应当是扁平的，不能有太多的嵌套） \r\n11 Sparse is better than dense.\r\n12 # 间隔胜于紧凑（优美的代码有适当的间隔，不要奢望一行代码解决问题） \r\n13 Readability counts.\r\n14 # 可读性很重要（优美的代码是可读的） \r\n15 Special cases aren\'t special enough to break the rules.\r\n16 Although practicality beats purity.\r\n17 # 即便假借特例的实用性之名，也不可违背这些规则（这些规则至高无上） \r\n18 Errors should never pass silently.\r\n19 Unless explicitly silenced.\r\n20 # 不要包容所有错误，除非你确定需要这样做（精准地捕获异常，不写except:pass风格的代码） \r\n21 In the face of ambiguity, refuse the temptation to guess.\r\n22 # 当存在多种可能，不要尝试去猜测 \r\n23 There should be one-- and preferably only one --obvious way to do it.\r\n24 # 而是尽量找一种，最好是唯一一种明显的解决方案（如果不确定，就用穷举法） \r\n25 Although that way may not be obvious at first unless you\'re Dutch.\r\n26 # 虽然这并不容易，因为你不是 Python 之父（这里的Dutch是指Guido）\r\n27 Now is better than never.\r\n28 Although never is often better than *right* now.\r\n29 # 做也许好过不做，但不假思索就动手还不如不做（动手之前要细思量）\r\n30 If the implementation is hard to explain, it\'s a bad idea.\r\n31 If the implementation is easy to explain, it may be a good idea.\r\n32 # 如果你无法向人描述你的方案，那肯定不是一个好方案；反之亦然（方案测评标准） \r\n33 Namespaces are one honking great idea -- let\'s do more of those!\r\n34 # 命名空间是一种绝妙的理念，我们应当多加利用（倡导与号召）', 'python 风格指南和PEP8规范', '2020-02-14 12:28:31.752116', 1, 1),
(2, 6, 1, 'qqewrqewr', 'wqerqwrqwr', 'qwerqwrqw', '2020-02-14 12:28:43.889754', 5, 2),
(3, 2, 1, 'qqewrqewr', 'asdasdasdas', 'dasdasdasd', '2020-02-19 03:14:49.627251', 2, 3),
(4, 3, 1, 'sdf', 'afasfadsfa', 'sadfasfas', '2020-02-19 06:52:57.377033', 6, 3),
(5, 5, 1, 'sdf', 'asfasfsadf', 'sadfasdfas', '2020-02-19 06:54:18.246303', 4, 3),
(6, 4, 1, 'sdf', 'ewqrqwr', 'wqrqwerqwre', '2020-02-20 01:31:26.905970', 3, 1),
(7, 2, 1, 'ewrtwertrwe', 'erwtwertewt', 'errtwertwet', '2020-02-20 03:07:43.352607', 1, 1),
(8, 3, 1, 'fdagadgsdf', 'dfgfdsgdsfgdfgdsg', 'dsfgdsfgdfgdsgsd', '2020-02-20 03:09:49.235041', 1, 1),
(9, 4, 1, 'sdgsdg', 'dfgsdfgf', 'sdfgsdfgdsg', '2020-02-20 03:09:58.596343', 1, 1),
(10, 5, 1, 'dfgsdfgds', 'fdsgsdgfsd', 'dsfgsdfgsdg', '2020-02-20 03:10:10.103057', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `crm_customer`
--

CREATE TABLE `crm_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `qq` varchar(64) NOT NULL,
  `qq_name` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `source` smallint(6) NOT NULL,
  `referral_from` varchar(64) DEFAULT NULL,
  `content` longtext NOT NULL,
  `status` smallint(6) NOT NULL,
  `memo` longtext,
  `date` datetime(6) NOT NULL,
  `consult_course_id` int(11) NOT NULL,
  `consultant_id` int(11) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `id_num` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_customer`
--

INSERT INTO `crm_customer` (`id`, `name`, `qq`, `qq_name`, `phone`, `source`, `referral_from`, `content`, `status`, `memo`, `date`, `consult_course_id`, `consultant_id`, `email`, `id_num`) VALUES
(1, '茉黎', '456789', '黎儿', '15044487971', 1, '1234567892', '上帝发誓', 0, '撒旦发生发生', '2020-02-14 12:25:55.477686', 1, 2, '1293143636@qq.com', NULL),
(2, '莉莉', '9876543210', '懒洋洋', '17767962833', 7, '1878205504', '阿斯顿发大水地方', 0, '啊手动阀沙发反对', '2020-02-14 12:26:32.348320', 2, 2, NULL, NULL),
(3, '导致', '976543210', '小黎儿', '15044487972', 1, '1878205506', '士大夫石帆胜丰', 0, '啊打发十分大师傅十分', '2020-02-18 01:10:59.005449', 1, 2, 'eric@163.com', '1245'),
(4, '安博会', '12567890', '老王', '15044487973', 5, '45288545', 'sdfasdfasfasfasf', 0, 'asfdafdasfasdf', '2020-02-20 01:40:52.214964', 1, 1, '2862944038@qq.com', '124567'),
(5, '是机会', '9638527410', '老罗', '15044487974', 1, '45288545', 'asfasdfasdfas', 0, 'asfasfasfdasfaf', '2020-02-20 01:41:33.478309', 1, 1, '2862944038@qq.com', '12456766');

-- --------------------------------------------------------

--
-- 表的结构 `crm_customerfollowup`
--

CREATE TABLE `crm_customerfollowup` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `intention` smallint(6) NOT NULL,
  `date` datetime(6) NOT NULL,
  `consultant_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_customerfollowup`
--

INSERT INTO `crm_customerfollowup` (`id`, `content`, `intention`, `date`, `consultant_id`, `customer_id`) VALUES
(1, '啊手动阀沙发啊手动阀沙发', 0, '2020-02-14 12:27:17.448537', 1, 1),
(2, '萨法沙发沙发', 1, '2020-02-14 12:27:27.286444', 2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `crm_customer_tags`
--

CREATE TABLE `crm_customer_tags` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_customer_tags`
--

INSERT INTO `crm_customer_tags` (`id`, `customer_id`, `tag_id`) VALUES
(1, 1, 3),
(2, 1, 7),
(3, 2, 6),
(4, 2, 7),
(6, 3, 7),
(5, 3, 10),
(8, 4, 3),
(9, 4, 4),
(7, 4, 10),
(10, 5, 8),
(11, 5, 9);

-- --------------------------------------------------------

--
-- 表的结构 `crm_enrollment`
--

CREATE TABLE `crm_enrollment` (
  `id` int(11) NOT NULL,
  `contract_aggred` tinyint(1) NOT NULL,
  `contract_approved` tinyint(1) NOT NULL,
  `date` datetime(6) NOT NULL,
  `consultant_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `enrolled_class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_enrollment`
--

INSERT INTO `crm_enrollment` (`id`, `contract_aggred`, `contract_approved`, `date`, `consultant_id`, `customer_id`, `enrolled_class_id`) VALUES
(52, 1, 1, '2020-02-20 02:01:36.179883', 1, 1, 1),
(54, 1, 1, '2020-02-20 02:02:43.758039', 1, 2, 1),
(56, 1, 1, '2020-02-20 02:03:20.265998', 1, 3, 1),
(58, 1, 1, '2020-02-20 02:03:59.039361', 1, 4, 1),
(60, 1, 1, '2020-02-20 02:04:33.451985', 1, 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `crm_menu`
--

CREATE TABLE `crm_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `url_type` smallint(6) NOT NULL,
  `url_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_menu`
--

INSERT INTO `crm_menu` (`id`, `name`, `url_type`, `url_name`) VALUES
(3, '销售首页', 0, 'sales_index'),
(4, '客户库', 1, '/king_admin/crm/customer/'),
(5, '我的课程', 0, 'stu_my_class');

-- --------------------------------------------------------

--
-- 表的结构 `crm_payment`
--

CREATE TABLE `crm_payment` (
  `id` int(11) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `date` datetime(6) NOT NULL,
  `consultant_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_payment`
--

INSERT INTO `crm_payment` (`id`, `amount`, `date`, `consultant_id`, `course_id`, `customer_id`) VALUES
(29, 10000, '2020-02-20 02:07:48.821667', 1, 1, 1),
(30, 10000, '2020-02-20 02:08:03.290132', 1, 1, 2),
(31, 10000, '2020-02-20 02:08:17.299158', 1, 1, 3),
(32, 10000, '2020-02-20 02:08:37.155064', 1, 1, 4),
(33, 10000, '2020-02-20 02:08:47.344016', 1, 1, 5);

-- --------------------------------------------------------

--
-- 表的结构 `crm_role`
--

CREATE TABLE `crm_role` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_role`
--

INSERT INTO `crm_role` (`id`, `name`) VALUES
(3, 'Boss'),
(2, '学生'),
(1, '销售');

-- --------------------------------------------------------

--
-- 表的结构 `crm_role_menus`
--

CREATE TABLE `crm_role_menus` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_role_menus`
--

INSERT INTO `crm_role_menus` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 3),
(3, 1, 4),
(4, 2, 5),
(5, 3, 3),
(6, 3, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- 表的结构 `crm_studyrecord`
--

CREATE TABLE `crm_studyrecord` (
  `id` int(11) NOT NULL,
  `attendance` smallint(6) NOT NULL,
  `score` smallint(6) NOT NULL,
  `memo` longtext NOT NULL,
  `date` date NOT NULL,
  `course_record_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_studyrecord`
--

INSERT INTO `crm_studyrecord` (`id`, `attendance`, `score`, `memo`, `date`, `course_record_id`, `student_id`) VALUES
(14, 0, 90, '', '2020-02-20', 1, 52),
(15, 0, 85, '', '2020-02-20', 1, 54),
(16, 0, 80, '', '2020-02-20', 1, 56),
(17, 0, 70, '', '2020-02-20', 1, 58),
(18, 0, 60, '', '2020-02-20', 1, 60),
(20, 0, 80, '', '2020-02-20', 7, 52),
(21, 0, 40, '', '2020-02-20', 7, 54),
(22, 0, 85, '', '2020-02-20', 7, 56),
(23, 0, 80, '', '2020-02-20', 7, 58),
(24, 0, 60, '', '2020-02-20', 7, 60),
(25, 0, 40, '', '2020-02-20', 8, 52),
(26, 0, 80, '', '2020-02-20', 8, 54),
(27, 0, 90, '', '2020-02-20', 8, 56),
(28, 0, 85, '', '2020-02-20', 8, 58),
(29, 0, 70, '', '2020-02-20', 8, 60),
(30, 0, 60, '', '2020-02-20', 9, 52),
(31, 0, 80, '', '2020-02-20', 9, 54),
(32, 0, 85, '', '2020-02-20', 9, 56),
(33, 0, 80, '', '2020-02-20', 9, 58),
(34, 0, 100, '', '2020-02-20', 9, 60),
(35, 0, 60, '', '2020-02-20', 10, 52),
(36, 0, 85, '', '2020-02-20', 10, 54),
(37, 0, 80, '', '2020-02-20', 10, 56),
(38, 0, 70, '', '2020-02-20', 10, 58),
(39, 0, 100, '', '2020-02-20', 10, 60);

-- --------------------------------------------------------

--
-- 表的结构 `crm_tag`
--

CREATE TABLE `crm_tag` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_tag`
--

INSERT INTO `crm_tag` (`id`, `name`) VALUES
(5, 'ff很符合的风格和'),
(10, '他幼年童年头发'),
(7, '他那天和肉体和'),
(3, '但是广泛大使馆'),
(4, '大锅饭大概'),
(6, '热热部分的'),
(8, '热特热和液体'),
(9, '观光用途的'),
(1, '阿斯蒂'),
(2, '阿斯顿发生发生');

-- --------------------------------------------------------

--
-- 表的结构 `crm_userprofile`
--

CREATE TABLE `crm_userprofile` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `stu_account_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_userprofile`
--

INSERT INTO `crm_userprofile` (`id`, `password`, `last_login`, `email`, `name`, `is_active`, `is_admin`, `is_superuser`, `stu_account_id`) VALUES
(1, 'pbkdf2_sha256$180000$iI4PHjNde1CD$Txlw4KeUJdMNh30aWc2RbAENPFLLwCHicnMVynFSR6I=', '2020-02-20 10:35:34.017847', 'admin@163.com', 'admin', 1, 1, 0, NULL),
(2, 'pbkdf2_sha256$180000$E8HPhq600P5g$2uSwRQHEKGhFtqnmGohwPYlevsyZrq6znw1KyWHlhOo=', '2020-02-15 12:20:28.672029', 'eric@163.com', 'eric', 1, 1, 0, NULL),
(3, 'pbkdf2_sha256$180000$4Uje9kC05smx$dmSpyWa05l9yYTHex9ejavUjDGgnJhcLtbPhykW9Mso=', '2020-02-20 10:36:35.018039', 'jack@163.com', 'jack', 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `crm_userprofile_groups`
--

CREATE TABLE `crm_userprofile_groups` (
  `id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `crm_userprofile_roles`
--

CREATE TABLE `crm_userprofile_roles` (
  `id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_userprofile_roles`
--

INSERT INTO `crm_userprofile_roles` (`id`, `userprofile_id`, `role_id`) VALUES
(1, 1, 1),
(5, 2, 2),
(8, 3, 2);

-- --------------------------------------------------------

--
-- 表的结构 `crm_userprofile_user_permissions`
--

CREATE TABLE `crm_userprofile_user_permissions` (
  `id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-02-14 08:11:22.061171', '2', 'eric@163.com', 1, '[{\"added\": {}}]', 13, 1),
(2, '2020-02-14 11:56:52.717297', '1', 'sales', 1, '[{\"added\": {}}]', 11, 1),
(3, '2020-02-14 11:57:23.136024', '1', '销售首页', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 11, 1),
(4, '2020-02-14 11:57:44.647565', '2', '学生', 1, '[{\"added\": {}}]', 11, 1),
(5, '2020-02-14 12:00:39.035167', '3', 'sales', 1, '[{\"added\": {}}]', 11, 1),
(6, '2020-02-14 12:00:51.452419', '2', '学生', 3, '', 11, 1),
(7, '2020-02-14 12:00:51.590885', '1', '销售首页', 3, '', 11, 1),
(8, '2020-02-14 12:01:11.390930', '4', 'customer_list', 1, '[{\"added\": {}}]', 11, 1),
(9, '2020-02-14 12:01:30.504954', '1', '销售首页', 1, '[{\"added\": {}}]', 14, 1),
(10, '2020-02-14 12:01:40.923219', '2', '学生', 1, '[{\"added\": {}}]', 14, 1),
(11, '2020-02-14 12:08:51.381799', '3', '销售首页', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 11, 1),
(12, '2020-02-14 12:10:15.885118', '4', '客户库', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 11, 1),
(13, '2020-02-14 12:10:27.160894', '5', '学生首页', 1, '[{\"added\": {}}]', 11, 1),
(14, '2020-02-14 12:10:52.328967', '1', '销售', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Menus\"]}}]', 14, 1),
(15, '2020-02-14 12:11:01.660682', '2', '学生', 2, '[{\"changed\": {\"fields\": [\"Menus\"]}}]', 14, 1),
(16, '2020-02-14 12:12:02.516154', '3', 'Boss', 1, '[{\"added\": {}}]', 14, 1),
(17, '2020-02-14 12:16:59.640468', '1', '阿斯蒂', 1, '[{\"added\": {}}]', 12, 1),
(18, '2020-02-14 12:17:03.793719', '2', '阿斯顿发生发生', 1, '[{\"added\": {}}]', 12, 1),
(19, '2020-02-14 12:17:06.042304', '3', '但是广泛大使馆', 1, '[{\"added\": {}}]', 12, 1),
(20, '2020-02-14 12:17:07.928890', '4', '大锅饭大概', 1, '[{\"added\": {}}]', 12, 1),
(21, '2020-02-14 12:17:10.076706', '5', 'ff很符合的风格和', 1, '[{\"added\": {}}]', 12, 1),
(22, '2020-02-14 12:17:12.885168', '6', '热热部分的', 1, '[{\"added\": {}}]', 12, 1),
(23, '2020-02-14 12:17:15.393751', '7', '他那天和肉体和', 1, '[{\"added\": {}}]', 12, 1),
(24, '2020-02-14 12:17:18.020514', '8', '热特热和液体', 1, '[{\"added\": {}}]', 12, 1),
(25, '2020-02-14 12:17:21.018794', '9', '观光用途的', 1, '[{\"added\": {}}]', 12, 1),
(26, '2020-02-14 12:17:25.251531', '10', '他幼年童年头发', 1, '[{\"added\": {}}]', 12, 1),
(27, '2020-02-14 12:17:45.862479', '1', '上海校区', 1, '[{\"added\": {}}]', 7, 1),
(28, '2020-02-14 12:17:53.014839', '2', '北京校区', 1, '[{\"added\": {}}]', 7, 1),
(29, '2020-02-14 12:17:59.786790', '3', '深圳校区', 1, '[{\"added\": {}}]', 7, 1),
(30, '2020-02-14 12:18:13.789726', '4', '成都校区', 1, '[{\"added\": {}}]', 7, 1),
(31, '2020-02-14 12:19:18.628768', '1', 'python', 1, '[{\"added\": {}}]', 9, 1),
(32, '2020-02-14 12:19:46.782548', '2', 'java', 1, '[{\"added\": {}}]', 9, 1),
(33, '2020-02-14 12:20:30.211915', '3', '.NET', 1, '[{\"added\": {}}]', 9, 1),
(34, '2020-02-14 12:21:08.982133', '4', 'C/C++', 1, '[{\"added\": {}}]', 9, 1),
(35, '2020-02-14 12:21:37.763192', '5', '设计模式', 1, '[{\"added\": {}}]', 9, 1),
(36, '2020-02-14 12:22:18.449702', '1', '成都校区 python 1', 1, '[{\"added\": {}}]', 8, 1),
(37, '2020-02-14 12:23:14.815856', '2', '成都校区 java 1', 1, '[{\"added\": {}}]', 8, 1),
(38, '2020-02-14 12:23:38.740046', '3', '深圳校区 java 1', 1, '[{\"added\": {}}]', 8, 1),
(39, '2020-02-14 12:23:57.867617', '4', '深圳校区 .NET 1', 1, '[{\"added\": {}}]', 8, 1),
(40, '2020-02-14 12:24:21.177054', '5', '北京校区 C/C++ 1', 1, '[{\"added\": {}}]', 8, 1),
(41, '2020-02-14 12:24:37.043233', '6', '上海校区 设计模式 1', 1, '[{\"added\": {}}]', 8, 1),
(42, '2020-02-14 12:25:55.600746', '1', '<1234567890 茉黎啦>', 1, '[{\"added\": {}}]', 10, 1),
(43, '2020-02-14 12:26:34.268597', '2', '<9876543210 茉黎黎>', 1, '[{\"added\": {}}]', 10, 1),
(44, '2020-02-14 12:27:18.789420', '1', '<1234567890 : 0>', 1, '[{\"added\": {}}]', 17, 1),
(45, '2020-02-14 12:27:27.293538', '2', '<9876543210 : 1>', 1, '[{\"added\": {}}]', 17, 1),
(46, '2020-02-14 12:27:53.566274', '1', '<1234567890 茉黎啦> 上海校区 设计模式 1', 1, '[{\"added\": {}}]', 16, 1),
(47, '2020-02-14 12:28:02.693100', '2', '<9876543210 茉黎黎> 成都校区 java 1', 1, '[{\"added\": {}}]', 16, 1),
(48, '2020-02-14 12:28:31.794000', '1', '成都校区 python 1 1', 1, '[{\"added\": {}}]', 18, 1),
(49, '2020-02-14 12:28:43.892682', '2', '北京校区 C/C++ 1 1', 1, '[{\"added\": {}}]', 18, 1),
(50, '2020-02-14 12:29:07.919370', '1', '<1234567890 茉黎啦> 上海校区 设计模式 1 成都校区 python 1 1 100', 1, '[{\"added\": {}}]', 19, 1),
(51, '2020-02-14 12:29:19.778598', '2', '<9876543210 茉黎黎> 成都校区 java 1 北京校区 C/C++ 1 1 90', 1, '[{\"added\": {}}]', 19, 1),
(52, '2020-02-14 12:29:46.882819', '1', '<1234567890 茉黎啦> 500', 1, '[{\"added\": {}}]', 15, 1),
(53, '2020-02-14 12:29:53.745747', '2', '<9876543210 茉黎黎> 500', 1, '[{\"added\": {}}]', 15, 1),
(54, '2020-02-15 01:39:34.805532', '2', 'eric@163.com', 2, '[{\"changed\": {\"fields\": [\"Is admin\"]}}]', 13, 1),
(55, '2020-02-15 02:36:01.635256', '3', 'jack@163.com', 1, '[{\"added\": {}}]', 13, 1),
(56, '2020-02-15 02:36:33.756412', '3', 'jack@163.com', 2, '[{\"changed\": {\"fields\": [\"Is admin\"]}}]', 13, 1),
(57, '2020-02-15 08:28:38.286650', '1', 'admin@163.com', 2, '[{\"changed\": {\"fields\": [\"Roles\"]}}]', 13, 1),
(60, '2020-02-15 12:16:28.295261', '1', 'admin@163.com', 2, '[{\"changed\": {\"fields\": [\"Roles\"]}}]', 13, 1),
(61, '2020-02-15 12:16:37.699175', '1', 'admin@163.com', 2, '[{\"changed\": {\"fields\": [\"Roles\"]}}]', 13, 1),
(62, '2020-02-15 12:16:45.457993', '2', 'eric@163.com', 2, '[{\"changed\": {\"fields\": [\"Roles\"]}}]', 13, 1),
(63, '2020-02-15 12:16:52.842072', '3', 'jack@163.com', 2, '[{\"changed\": {\"fields\": [\"Roles\"]}}]', 13, 1),
(64, '2020-02-17 03:42:39.155236', '1', '技术学习合同', 1, '[{\"added\": {}}]', 20, 1),
(65, '2020-02-17 03:45:38.174969', '1', '技术学习合同', 2, '[{\"changed\": {\"fields\": [\"Template\"]}}]', 20, 1),
(66, '2020-02-17 03:54:15.005602', '1', '成都校区 python 1', 2, '[{\"changed\": {\"fields\": [\"Contract\"]}}]', 8, 1),
(67, '2020-02-17 05:48:03.527899', '1', '技术学习合同', 2, '[{\"changed\": {\"fields\": [\"Template\"]}}]', 20, 1),
(68, '2020-02-17 06:09:41.707473', '1', '技术学习合同', 2, '[{\"changed\": {\"fields\": [\"Template\"]}}]', 20, 1),
(69, '2020-02-17 06:10:44.042062', '1', '技术学习合同', 2, '[{\"changed\": {\"fields\": [\"Template\"]}}]', 20, 1),
(70, '2020-02-17 06:42:41.285927', '1', '技术学习合同', 2, '[]', 20, 1),
(71, '2020-02-17 06:43:24.589166', '1', '技术学习合同', 2, '[{\"changed\": {\"fields\": [\"Template\"]}}]', 20, 1),
(72, '2020-02-17 06:43:44.555627', '1', '技术学习合同', 2, '[{\"changed\": {\"fields\": [\"Template\"]}}]', 20, 1),
(73, '2020-02-17 06:44:01.191330', '1', '技术学习合同', 2, '[{\"changed\": {\"fields\": [\"Template\"]}}]', 20, 1),
(74, '2020-02-17 06:44:19.953249', '1', '技术学习合同', 2, '[{\"changed\": {\"fields\": [\"Template\"]}}]', 20, 1),
(75, '2020-02-18 02:13:58.250805', '3', '<456789 茉黎啦> 成都校区 python 1', 2, '[{\"changed\": {\"fields\": [\"\\u5b66\\u5458\\u5df2\\u540c\\u610f\\u5408\\u540c\\u6761\\u6b3e\"]}}]', 16, 1),
(76, '2020-02-18 06:19:17.891816', '3', '<456789 茉黎啦> 成都校区 python 1', 2, '[{\"changed\": {\"fields\": [\"\\u5b66\\u5458\\u5df2\\u540c\\u610f\\u5408\\u540c\\u6761\\u6b3e\"]}}]', 16, 1),
(77, '2020-02-19 03:14:49.667362', '3', '成都校区 java 1 2', 1, '[{\"added\": {}}]', 18, 1),
(78, '2020-02-19 05:50:56.003929', '1', '<456789 茉黎啦> 上海校区 设计模式 1 成都校区 python 1 1 100', 3, '', 19, 1),
(79, '2020-02-19 05:50:56.063386', '3', '<9876543210 茉黎黎> 成都校区 java 1 成都校区 java 1 2 0', 3, '', 19, 1),
(80, '2020-02-19 05:50:56.120875', '2', '<9876543210 茉黎黎> 成都校区 java 1 北京校区 C/C++ 1 1 90', 3, '', 19, 1),
(81, '2020-02-19 05:50:56.167693', '11', '<456789 茉黎啦> 成都校区 python 1 成都校区 python 1 1 0', 3, '', 19, 1),
(82, '2020-02-19 05:50:56.202900', '4', '<456789 茉黎啦> 成都校区 java 1 成都校区 java 1 2 0', 3, '', 19, 1),
(83, '2020-02-19 05:50:56.227516', '6', '<456789 茉黎啦> 北京校区 C/C++ 1 北京校区 C/C++ 1 1 0', 3, '', 19, 1),
(84, '2020-02-19 05:50:56.296888', '12', '<9876543210 茉黎黎> 成都校区 python 1 成都校区 python 1 1 0', 3, '', 19, 1),
(85, '2020-02-19 05:50:56.332094', '13', '<976543210 茉黎儿> 成都校区 python 1 成都校区 python 1 1 0', 3, '', 19, 1),
(86, '2020-02-19 05:50:56.368328', '5', '<976543210 茉黎儿> 成都校区 java 1 成都校区 java 1 2 0', 3, '', 19, 1),
(87, '2020-02-19 06:02:08.331503', '16', '<456789 茉黎啦> 成都校区 python 1 成都校区 python 1 1 0', 3, '', 19, 1),
(88, '2020-02-19 06:02:08.388154', '15', '<456789 茉黎啦> 北京校区 C/C++ 1 北京校区 C/C++ 1 1 0', 3, '', 19, 1),
(89, '2020-02-19 06:02:08.424110', '14', '<9876543210 茉黎黎> 成都校区 java 1 成都校区 java 1 2 0', 3, '', 19, 1),
(90, '2020-02-19 10:43:22.856118', '1', 'admin@163.com', 2, '[{\"changed\": {\"fields\": [\"Roles\"]}}]', 13, 1),
(91, '2020-02-19 10:43:29.142849', '1', 'admin@163.com', 2, '[{\"changed\": {\"fields\": [\"Roles\"]}}]', 13, 1),
(92, '2020-02-19 10:44:06.416000', '3', 'jack@163.com', 2, '[{\"changed\": {\"fields\": [\"Roles\"]}}]', 13, 1),
(95, '2020-02-19 11:58:29.188530', '5', '学生首页', 2, '[{\"changed\": {\"fields\": [\"Url name\"]}}]', 11, 1),
(97, '2020-02-19 12:17:50.123263', '5', '我的课程', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 11, 1),
(98, '2020-02-19 12:22:30.757096', '1', '销售', 2, '[{\"changed\": {\"fields\": [\"Menus\"]}}]', 14, 1),
(99, '2020-02-19 13:32:43.664020', '3', 'jack@163.com', 2, '[{\"changed\": {\"fields\": [\"\\u5173\\u8054\\u5b66\\u5458\\u8d26\\u53f7\"]}}]', 13, 1),
(100, '2020-02-19 13:37:07.936975', '3', '<456789 茉黎啦> 10000', 2, '[{\"changed\": {\"fields\": [\"\\u6240\\u62a5\\u8bfe\\u7a0b\"]}}]', 15, 1),
(101, '2020-02-19 13:37:17.683049', '3', '<456789 茉黎啦> 10000', 2, '[{\"changed\": {\"fields\": [\"\\u6240\\u62a5\\u8bfe\\u7a0b\"]}}]', 15, 1),
(102, '2020-02-19 13:37:24.690184', '3', '<456789 茉黎啦> 10000', 2, '[{\"changed\": {\"fields\": [\"\\u6240\\u62a5\\u8bfe\\u7a0b\"]}}]', 15, 1),
(103, '2020-02-19 13:39:43.088515', '1', 'admin@163.com', 2, '[]', 13, 1),
(104, '2020-02-19 13:40:23.607923', '1', '销售', 2, '[{\"changed\": {\"fields\": [\"Menus\"]}}]', 14, 1),
(106, '2020-02-19 13:42:42.385306', '3', 'jack@163.com', 2, '[{\"changed\": {\"fields\": [\"\\u5173\\u8054\\u5b66\\u5458\\u8d26\\u53f7\"]}}]', 13, 1),
(108, '2020-02-20 01:22:49.443257', '30', '<456789 茉黎啦> 北京校区 C/C++ 1 北京校区 C/C++ 1 1 100', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(109, '2020-02-20 01:22:49.603574', '31', '<9876543210 茉黎黎> 成都校区 java 1 成都校区 java 1 2 85', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(110, '2020-02-20 01:22:49.731797', '35', '<456789 茉黎啦> 上海校区 设计模式 1 上海校区 设计模式 1 3 80', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(111, '2020-02-20 01:22:49.826758', '36', '<9876543210 茉黎黎> 深圳校区 .NET 1 深圳校区 .NET 1 5 80', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(112, '2020-02-20 01:24:51.259560', '4', '<976543210 茉黎儿> 500', 1, '[{\"added\": {}}]', 15, 1),
(113, '2020-02-20 01:25:18.169589', '5', '<9876543210 茉黎黎> 500', 1, '[{\"added\": {}}]', 15, 1),
(114, '2020-02-20 01:25:24.981105', '6', '<976543210 茉黎儿> 500', 1, '[{\"added\": {}}]', 15, 1),
(115, '2020-02-20 01:26:11.871971', '29', '<456789 茉黎啦> 成都校区 python 1 成都校区 python 1 1 100', 3, '', 19, 1),
(116, '2020-02-20 01:26:11.931730', '30', '<456789 茉黎啦> 北京校区 C/C++ 1 北京校区 C/C++ 1 1 100', 3, '', 19, 1),
(117, '2020-02-20 01:26:11.967576', '31', '<9876543210 茉黎黎> 成都校区 java 1 成都校区 java 1 2 85', 3, '', 19, 1),
(118, '2020-02-20 01:26:12.003575', '35', '<456789 茉黎啦> 上海校区 设计模式 1 上海校区 设计模式 1 3 80', 3, '', 19, 1),
(119, '2020-02-20 01:26:12.039180', '36', '<9876543210 茉黎黎> 深圳校区 .NET 1 深圳校区 .NET 1 5 80', 3, '', 19, 1),
(120, '2020-02-20 01:31:26.922500', '6', '深圳校区 java 1 4', 1, '[{\"added\": {}}]', 18, 1),
(121, '2020-02-20 01:31:35.836233', '2', '北京校区 C/C++ 1 6', 2, '[{\"changed\": {\"fields\": [\"\\u7b2c\\u51e0\\u8282(\\u5929)\"]}}]', 18, 1),
(122, '2020-02-20 01:32:03.965693', '41', '<456789 茉黎啦> 成都校区 python 1 成都校区 python 1 1 0', 3, '', 19, 1),
(123, '2020-02-20 01:32:04.022328', '42', '<456789 茉黎啦> 北京校区 C/C++ 1 北京校区 C/C++ 1 6 0', 3, '', 19, 1),
(124, '2020-02-20 01:32:04.080846', '43', '<9876543210 茉黎黎> 成都校区 java 1 成都校区 java 1 2 0', 3, '', 19, 1),
(125, '2020-02-20 01:32:04.116020', '44', '<456789 茉黎啦> 上海校区 设计模式 1 上海校区 设计模式 1 3 0', 3, '', 19, 1),
(126, '2020-02-20 01:32:04.152120', '45', '<9876543210 茉黎黎> 深圳校区 .NET 1 深圳校区 .NET 1 5 0', 3, '', 19, 1),
(127, '2020-02-20 01:32:50.638475', '5', '北京校区 C/C++ 2', 2, '[{\"changed\": {\"fields\": [\"\\u5b66\\u671f\"]}}]', 8, 1),
(128, '2020-02-20 01:32:58.199812', '4', '深圳校区 .NET 3', 2, '[{\"changed\": {\"fields\": [\"\\u5b66\\u671f\"]}}]', 8, 1),
(129, '2020-02-20 01:33:05.173514', '3', '深圳校区 java 3', 2, '[{\"changed\": {\"fields\": [\"\\u5b66\\u671f\"]}}]', 8, 1),
(130, '2020-02-20 01:33:10.262528', '2', '成都校区 java 4', 2, '[{\"changed\": {\"fields\": [\"\\u5b66\\u671f\"]}}]', 8, 1),
(131, '2020-02-20 01:33:15.545259', '1', '成都校区 python 4', 2, '[{\"changed\": {\"fields\": [\"\\u5b66\\u671f\"]}}]', 8, 1),
(132, '2020-02-20 01:35:01.881517', '7', '<456789 茉黎啦> 500', 1, '[{\"added\": {}}]', 15, 1),
(133, '2020-02-20 01:35:13.031518', '8', '<456789 茉黎啦> 500', 1, '[{\"added\": {}}]', 15, 1),
(134, '2020-02-20 01:35:18.102095', '9', '<456789 茉黎啦> 500', 1, '[{\"added\": {}}]', 15, 1),
(135, '2020-02-20 01:35:23.949727', '10', '<456789 茉黎啦> 500', 1, '[{\"added\": {}}]', 15, 1),
(136, '2020-02-20 01:35:29.995347', '11', '<456789 茉黎啦> 500', 1, '[{\"added\": {}}]', 15, 1),
(137, '2020-02-20 01:35:36.481347', '12', '<9876543210 茉黎黎> 500', 1, '[{\"added\": {}}]', 15, 1),
(138, '2020-02-20 01:35:42.793596', '13', '<9876543210 茉黎黎> 500', 1, '[{\"added\": {}}]', 15, 1),
(139, '2020-02-20 01:35:48.574493', '14', '<9876543210 茉黎黎> 500', 1, '[{\"added\": {}}]', 15, 1),
(140, '2020-02-20 01:35:55.600518', '15', '<9876543210 茉黎黎> 500', 1, '[{\"added\": {}}]', 15, 1),
(141, '2020-02-20 01:36:00.667939', '16', '<976543210 茉黎儿> 500', 1, '[{\"added\": {}}]', 15, 1),
(142, '2020-02-20 01:36:05.955042', '17', '<976543210 茉黎儿> 500', 1, '[{\"added\": {}}]', 15, 1),
(143, '2020-02-20 01:36:10.638802', '18', '<976543210 茉黎儿> 500', 1, '[{\"added\": {}}]', 15, 1),
(144, '2020-02-20 01:36:15.362721', '19', '<976543210 茉黎儿> 500', 1, '[{\"added\": {}}]', 15, 1),
(145, '2020-02-20 01:36:19.951319', '20', '<976543210 茉黎儿> 500', 1, '[{\"added\": {}}]', 15, 1),
(146, '2020-02-20 01:39:16.241868', '16', '<976543210 茉黎儿> 500', 2, '[{\"changed\": {\"fields\": [\"Consultant\"]}}]', 15, 1),
(147, '2020-02-20 01:40:52.588832', '4', '<12567890 学asd>', 1, '[{\"added\": {}}]', 10, 1),
(148, '2020-02-20 01:41:35.437681', '5', '<9638527410 asffsf>', 1, '[{\"added\": {}}]', 10, 1),
(149, '2020-02-20 01:43:21.537436', '42', '<12567890 学asd> 成都校区 python 4', 1, '[{\"added\": {}}]', 16, 1),
(150, '2020-02-20 01:43:33.111087', '43', '<9638527410 asffsf> 成都校区 python 4', 1, '[{\"added\": {}}]', 16, 1),
(151, '2020-02-20 01:43:47.721853', '21', '<12567890 学asd> 500', 1, '[{\"added\": {}}]', 15, 1),
(152, '2020-02-20 01:43:52.728477', '22', '<9638527410 asffsf> 500', 1, '[{\"added\": {}}]', 15, 1),
(153, '2020-02-20 01:44:19.707935', '1', '成都校区 python 4 2', 2, '[{\"changed\": {\"fields\": [\"\\u7b2c\\u51e0\\u8282(\\u5929)\"]}}]', 18, 1),
(154, '2020-02-20 01:44:45.641139', '46', '<456789 茉黎啦> 成都校区 python 4 成都校区 python 4 2 0', 3, '', 19, 1),
(155, '2020-02-20 01:44:45.766250', '47', '<456789 茉黎啦> 北京校区 C/C++ 2 北京校区 C/C++ 2 6 0', 3, '', 19, 1),
(156, '2020-02-20 01:44:45.817262', '48', '<9876543210 茉黎黎> 成都校区 java 4 成都校区 java 4 2 0', 3, '', 19, 1),
(157, '2020-02-20 01:44:45.875050', '49', '<456789 茉黎啦> 上海校区 设计模式 1 上海校区 设计模式 1 3 0', 3, '', 19, 1),
(158, '2020-02-20 01:44:45.900169', '50', '<9876543210 茉黎黎> 深圳校区 .NET 3 深圳校区 .NET 3 5 0', 3, '', 19, 1),
(159, '2020-02-20 01:44:45.947011', '51', '<456789 茉黎啦> 深圳校区 java 3 深圳校区 java 3 4 0', 3, '', 19, 1),
(160, '2020-02-20 01:45:52.873556', '41', '<976543210 茉黎儿> 成都校区 java 4', 2, '[{\"changed\": {\"fields\": [\"\\u5b66\\u5458\\u5df2\\u540c\\u610f\\u5408\\u540c\\u6761\\u6b3e\", \"\\u5408\\u540c\\u5df2\\u5ba1\\u6838\"]}}]', 16, 1),
(161, '2020-02-20 01:45:59.518723', '39', '<976543210 茉黎儿> 成都校区 python 4', 2, '[{\"changed\": {\"fields\": [\"\\u5b66\\u5458\\u5df2\\u540c\\u610f\\u5408\\u540c\\u6761\\u6b3e\", \"\\u5408\\u540c\\u5df2\\u5ba1\\u6838\"]}}]', 16, 1),
(162, '2020-02-20 01:46:04.956236', '37', '<456789 茉黎啦> 深圳校区 .NET 3', 2, '[{\"changed\": {\"fields\": [\"\\u5b66\\u5458\\u5df2\\u540c\\u610f\\u5408\\u540c\\u6761\\u6b3e\", \"\\u5408\\u540c\\u5df2\\u5ba1\\u6838\"]}}]', 16, 1),
(163, '2020-02-20 01:46:10.795885', '35', '<9876543210 茉黎黎> 深圳校区 .NET 3', 2, '[{\"changed\": {\"fields\": [\"\\u5b66\\u5458\\u5df2\\u540c\\u610f\\u5408\\u540c\\u6761\\u6b3e\", \"\\u5408\\u540c\\u5df2\\u5ba1\\u6838\"]}}]', 16, 1),
(164, '2020-02-20 01:46:16.563665', '32', '<9876543210 茉黎黎> 深圳校区 java 3', 2, '[{\"changed\": {\"fields\": [\"\\u5b66\\u5458\\u5df2\\u540c\\u610f\\u5408\\u540c\\u6761\\u6b3e\", \"\\u5408\\u540c\\u5df2\\u5ba1\\u6838\"]}}]', 16, 1),
(165, '2020-02-20 01:46:23.133561', '29', '<9876543210 茉黎黎> 北京校区 C/C++ 2', 2, '[{\"changed\": {\"fields\": [\"\\u5b66\\u5458\\u5df2\\u540c\\u610f\\u5408\\u540c\\u6761\\u6b3e\", \"\\u5408\\u540c\\u5df2\\u5ba1\\u6838\"]}}]', 16, 1),
(166, '2020-02-20 01:46:31.566008', '26', '<9876543210 茉黎黎> 成都校区 python 4', 2, '[{\"changed\": {\"fields\": [\"\\u5408\\u540c\\u5df2\\u5ba1\\u6838\"]}}]', 16, 1),
(167, '2020-02-20 01:46:40.034709', '25', '<456789 茉黎啦> 北京校区 C/C++ 2', 2, '[{\"changed\": {\"fields\": [\"\\u5b66\\u5458\\u5df2\\u540c\\u610f\\u5408\\u540c\\u6761\\u6b3e\", \"\\u5408\\u540c\\u5df2\\u5ba1\\u6838\"]}}]', 16, 1),
(168, '2020-02-20 01:46:44.048879', '1', '<456789 茉黎啦> 上海校区 设计模式 1', 2, '[]', 16, 1),
(169, '2020-02-20 01:46:48.402694', '2', '<9876543210 茉黎黎> 成都校区 java 4', 2, '[]', 16, 1),
(170, '2020-02-20 01:46:53.322919', '3', '<456789 茉黎啦> 成都校区 python 4', 2, '[]', 16, 1),
(171, '2020-02-20 01:46:58.898836', '10', '<456789 茉黎啦> 深圳校区 java 3', 2, '[{\"changed\": {\"fields\": [\"\\u5b66\\u5458\\u5df2\\u540c\\u610f\\u5408\\u540c\\u6761\\u6b3e\", \"\\u5408\\u540c\\u5df2\\u5ba1\\u6838\"]}}]', 16, 1),
(172, '2020-02-20 01:47:04.847578', '10', '<456789 茉黎啦> 深圳校区 java 3', 2, '[]', 16, 1),
(173, '2020-02-20 01:47:09.758609', '25', '<456789 茉黎啦> 北京校区 C/C++ 2', 2, '[]', 16, 1),
(174, '2020-02-20 01:47:15.224185', '26', '<9876543210 茉黎黎> 成都校区 python 4', 2, '[]', 16, 1),
(175, '2020-02-20 01:47:21.286353', '32', '<9876543210 茉黎黎> 深圳校区 java 3', 2, '[]', 16, 1),
(176, '2020-02-20 01:47:37.713117', '54', '<456789 茉黎啦> 成都校区 python 4 成都校区 python 4 2 0', 3, '', 19, 1),
(177, '2020-02-20 01:50:39.749159', '55', '<456789 茉黎啦> 成都校区 python 4 成都校区 python 4 2 0', 3, '', 19, 1),
(178, '2020-02-20 01:50:39.803964', '56', '<456789 茉黎啦> 北京校区 C/C++ 2 北京校区 C/C++ 2 6 0', 3, '', 19, 1),
(179, '2020-02-20 01:50:39.839678', '58', '<9876543210 茉黎黎> 成都校区 java 4 成都校区 java 4 2 0', 3, '', 19, 1),
(180, '2020-02-20 01:50:39.875460', '59', '<456789 茉黎啦> 上海校区 设计模式 1 上海校区 设计模式 1 3 0', 3, '', 19, 1),
(181, '2020-02-20 01:50:39.911188', '60', '<9876543210 茉黎黎> 深圳校区 .NET 3 深圳校区 .NET 3 5 0', 3, '', 19, 1),
(182, '2020-02-20 01:50:40.076340', '61', '<456789 茉黎啦> 深圳校区 java 3 深圳校区 java 3 4 0', 3, '', 19, 1),
(183, '2020-02-20 01:50:57.170768', '22', '<9638527410 asffsf> 500', 3, '', 15, 1),
(184, '2020-02-20 01:50:57.315279', '21', '<12567890 学asd> 500', 3, '', 15, 1),
(185, '2020-02-20 01:50:57.340639', '20', '<976543210 茉黎儿> 500', 3, '', 15, 1),
(186, '2020-02-20 01:50:57.375772', '19', '<976543210 茉黎儿> 500', 3, '', 15, 1),
(187, '2020-02-20 01:50:57.422614', '18', '<976543210 茉黎儿> 500', 3, '', 15, 1),
(188, '2020-02-20 01:50:57.458740', '17', '<976543210 茉黎儿> 500', 3, '', 15, 1),
(189, '2020-02-20 01:50:57.516301', '16', '<976543210 茉黎儿> 500', 3, '', 15, 1),
(190, '2020-02-20 01:50:57.723946', '15', '<9876543210 茉黎黎> 500', 3, '', 15, 1),
(191, '2020-02-20 01:50:57.784061', '14', '<9876543210 茉黎黎> 500', 3, '', 15, 1),
(192, '2020-02-20 01:50:57.844403', '13', '<9876543210 茉黎黎> 500', 3, '', 15, 1),
(193, '2020-02-20 01:50:57.902559', '12', '<9876543210 茉黎黎> 500', 3, '', 15, 1),
(194, '2020-02-20 01:50:57.938090', '11', '<456789 茉黎啦> 500', 3, '', 15, 1),
(195, '2020-02-20 01:50:57.973951', '10', '<456789 茉黎啦> 500', 3, '', 15, 1),
(196, '2020-02-20 01:50:57.998376', '9', '<456789 茉黎啦> 500', 3, '', 15, 1),
(197, '2020-02-20 01:50:58.023301', '8', '<456789 茉黎啦> 500', 3, '', 15, 1),
(198, '2020-02-20 01:50:58.059182', '7', '<456789 茉黎啦> 500', 3, '', 15, 1),
(199, '2020-02-20 01:50:58.083219', '6', '<976543210 茉黎儿> 500', 3, '', 15, 1),
(200, '2020-02-20 01:50:58.130275', '5', '<9876543210 茉黎黎> 500', 3, '', 15, 1),
(201, '2020-02-20 01:50:58.199702', '4', '<976543210 茉黎儿> 500', 3, '', 15, 1),
(202, '2020-02-20 01:50:58.246179', '3', '<456789 茉黎啦> 10000', 3, '', 15, 1),
(203, '2020-02-20 01:50:58.282288', '2', '<9876543210 茉黎黎> 500', 3, '', 15, 1),
(204, '2020-02-20 01:50:58.306363', '1', '<456789 茉黎啦> 500', 3, '', 15, 1),
(205, '2020-02-20 01:51:30.956743', '7', '成都校区 .NET 5', 1, '[{\"added\": {}}]', 8, 1),
(206, '2020-02-20 01:51:38.227630', '2', '成都校区 java 4', 2, '[{\"changed\": {\"fields\": [\"Contract\"]}}]', 8, 1),
(207, '2020-02-20 01:51:43.250516', '3', '深圳校区 java 3', 2, '[{\"changed\": {\"fields\": [\"Contract\"]}}]', 8, 1),
(208, '2020-02-20 01:51:48.212790', '7', '成都校区 .NET 5', 2, '[]', 8, 1),
(209, '2020-02-20 01:51:52.466733', '6', '上海校区 设计模式 1', 2, '[{\"changed\": {\"fields\": [\"Contract\"]}}]', 8, 1),
(210, '2020-02-20 01:51:56.960927', '5', '北京校区 C/C++ 2', 2, '[{\"changed\": {\"fields\": [\"Contract\"]}}]', 8, 1),
(211, '2020-02-20 01:52:01.463087', '4', '深圳校区 .NET 3', 2, '[{\"changed\": {\"fields\": [\"Contract\"]}}]', 8, 1),
(212, '2020-02-20 01:52:06.482677', '3', '深圳校区 java 3', 2, '[]', 8, 1),
(213, '2020-02-20 01:52:10.210233', '2', '成都校区 java 4', 2, '[]', 8, 1),
(214, '2020-02-20 01:52:35.048679', '43', '<9638527410 asffsf> 成都校区 python 4', 3, '', 16, 1),
(215, '2020-02-20 01:52:35.192868', '42', '<12567890 学asd> 成都校区 python 4', 3, '', 16, 1),
(216, '2020-02-20 01:52:35.238774', '41', '<976543210 茉黎儿> 成都校区 java 4', 3, '', 16, 1),
(217, '2020-02-20 01:52:35.274657', '39', '<976543210 茉黎儿> 成都校区 python 4', 3, '', 16, 1),
(218, '2020-02-20 01:52:35.321534', '37', '<456789 茉黎啦> 深圳校区 .NET 3', 3, '', 16, 1),
(219, '2020-02-20 01:52:35.357083', '35', '<9876543210 茉黎黎> 深圳校区 .NET 3', 3, '', 16, 1),
(220, '2020-02-20 01:52:35.415220', '32', '<9876543210 茉黎黎> 深圳校区 java 3', 3, '', 16, 1),
(221, '2020-02-20 01:52:35.451182', '29', '<9876543210 茉黎黎> 北京校区 C/C++ 2', 3, '', 16, 1),
(222, '2020-02-20 01:52:35.486283', '26', '<9876543210 茉黎黎> 成都校区 python 4', 3, '', 16, 1),
(223, '2020-02-20 01:52:35.533737', '25', '<456789 茉黎啦> 北京校区 C/C++ 2', 3, '', 16, 1),
(224, '2020-02-20 01:52:35.569355', '10', '<456789 茉黎啦> 深圳校区 java 3', 3, '', 16, 1),
(225, '2020-02-20 01:52:35.616163', '6', '<456789 茉黎啦> 成都校区 java 4', 3, '', 16, 1),
(226, '2020-02-20 01:52:35.651866', '3', '<456789 茉黎啦> 成都校区 python 4', 3, '', 16, 1),
(227, '2020-02-20 01:52:35.709956', '2', '<9876543210 茉黎黎> 成都校区 java 4', 3, '', 16, 1),
(228, '2020-02-20 01:52:35.745386', '1', '<456789 茉黎啦> 上海校区 设计模式 1', 3, '', 16, 1),
(229, '2020-02-20 01:52:56.713208', '2', '<9876543210 莉莉>', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 10, 1),
(230, '2020-02-20 01:53:05.739075', '1', '<456789 茉黎>', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 10, 1),
(231, '2020-02-20 01:53:20.813148', '3', '<976543210 导致>', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 10, 1),
(232, '2020-02-20 01:53:33.976969', '4', '<12567890 安博会>', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 10, 1),
(233, '2020-02-20 01:53:53.391948', '5', '<9638527410 是机会>', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 10, 1),
(234, '2020-02-20 01:54:03.822443', '1', '<456789 茉黎>', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(235, '2020-02-20 01:54:29.188402', '44', '<456789 茉黎> 成都校区 python 4', 1, '[{\"added\": {}}]', 16, 1),
(236, '2020-02-20 01:54:35.620443', '45', '<9876543210 莉莉> 成都校区 python 4', 1, '[{\"added\": {}}]', 16, 1),
(237, '2020-02-20 01:54:41.734252', '46', '<976543210 导致> 成都校区 python 4', 1, '[{\"added\": {}}]', 16, 1),
(238, '2020-02-20 01:54:47.863779', '47', '<12567890 安博会> 成都校区 python 4', 1, '[{\"added\": {}}]', 16, 1),
(239, '2020-02-20 01:54:55.321129', '48', '<9638527410 是机会> 成都校区 python 4', 1, '[{\"added\": {}}]', 16, 1),
(240, '2020-02-20 01:55:08.526780', '23', '<456789 茉黎> 500', 1, '[{\"added\": {}}]', 15, 1),
(241, '2020-02-20 01:55:14.439878', '24', '<9876543210 莉莉> 500', 1, '[{\"added\": {}}]', 15, 1),
(242, '2020-02-20 01:55:19.016641', '25', '<976543210 导致> 500', 1, '[{\"added\": {}}]', 15, 1),
(243, '2020-02-20 01:55:23.332806', '26', '<12567890 安博会> 500', 1, '[{\"added\": {}}]', 15, 1),
(244, '2020-02-20 01:55:28.936818', '27', '<9638527410 是机会> 500', 1, '[{\"added\": {}}]', 15, 1),
(245, '2020-02-20 01:55:58.261069', '1', '<456789 茉黎>', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(246, '2020-02-20 01:55:58.377640', '2', '<9876543210 莉莉>', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(247, '2020-02-20 01:55:58.493149', '3', '<976543210 导致>', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(248, '2020-02-20 01:55:58.634087', '4', '<12567890 安博会>', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(249, '2020-02-20 01:55:58.727719', '5', '<9638527410 是机会>', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(250, '2020-02-20 01:57:08.869839', '62', '<456789 茉黎> 成都校区 python 4 成都校区 python 4 2 0', 3, '', 19, 1),
(251, '2020-02-20 01:58:26.841260', '1', '<456789 茉黎>', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(252, '2020-02-20 01:58:26.935505', '2', '<9876543210 莉莉>', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(253, '2020-02-20 01:58:27.062372', '3', '<976543210 导致>', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(254, '2020-02-20 01:58:27.144348', '4', '<12567890 安博会>', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(255, '2020-02-20 01:58:27.216878', '5', '<9638527410 是机会>', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(256, '2020-02-20 02:00:09.994114', '48', '<9638527410 是机会> 成都校区 python 4', 3, '', 16, 1),
(257, '2020-02-20 02:00:10.133700', '47', '<12567890 安博会> 成都校区 python 4', 3, '', 16, 1),
(258, '2020-02-20 02:00:10.191278', '46', '<976543210 导致> 成都校区 python 4', 3, '', 16, 1),
(259, '2020-02-20 02:00:10.238135', '45', '<9876543210 莉莉> 成都校区 python 4', 3, '', 16, 1),
(260, '2020-02-20 02:00:10.307410', '44', '<456789 茉黎> 成都校区 python 4', 3, '', 16, 1),
(261, '2020-02-20 02:00:24.394042', '28', '<456789 茉黎> 10000', 3, '', 15, 1),
(262, '2020-02-20 02:00:24.636803', '27', '<9638527410 是机会> 500', 3, '', 15, 1),
(263, '2020-02-20 02:00:24.672795', '26', '<12567890 安博会> 500', 3, '', 15, 1),
(264, '2020-02-20 02:00:24.697324', '25', '<976543210 导致> 500', 3, '', 15, 1),
(265, '2020-02-20 02:00:24.893596', '24', '<9876543210 莉莉> 500', 3, '', 15, 1),
(266, '2020-02-20 02:00:24.962886', '23', '<456789 茉黎> 500', 3, '', 15, 1),
(267, '2020-02-20 02:01:01.589400', '1', '<456789 茉黎>', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(268, '2020-02-20 02:14:13.512594', '64', '<456789 茉黎> 成都校区 python 4 成都校区 python 4 2 0', 3, '', 19, 1),
(269, '2020-02-20 02:14:39.908094', '1', '成都校区 python 4 1', 2, '[{\"changed\": {\"fields\": [\"\\u7b2c\\u51e0\\u8282(\\u5929)\"]}}]', 18, 1),
(270, '2020-02-20 02:20:04.771532', '65', '<456789 茉黎> 成都校区 python 4 成都校区 python 4 1 0', 3, '', 19, 1),
(271, '2020-02-20 02:22:24.803094', '66', '<456789 茉黎> 成都校区 python 4 成都校区 python 4 1 0', 3, '', 19, 1),
(272, '2020-02-20 02:45:48.621517', '1', '<456789 茉黎> 成都校区 python 4 成都校区 python 4 1 0', 3, '', 19, 1),
(273, '2020-02-20 03:06:58.981502', '14', '<456789 茉黎> 成都校区 python 4 成都校区 python 4 1 90', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(274, '2020-02-20 03:06:59.231190', '15', '<9876543210 莉莉> 成都校区 python 4 成都校区 python 4 1 85', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(275, '2020-02-20 03:06:59.323800', '16', '<976543210 导致> 成都校区 python 4 成都校区 python 4 1 80', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(276, '2020-02-20 03:06:59.463629', '17', '<12567890 安博会> 成都校区 python 4 成都校区 python 4 1 70', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(277, '2020-02-20 03:06:59.591027', '18', '<9638527410 是机会> 成都校区 python 4 成都校区 python 4 1 60', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(278, '2020-02-20 03:07:17.341242', '1', '成都校区 python 4 2', 2, '[{\"changed\": {\"fields\": [\"\\u7b2c\\u51e0\\u8282(\\u5929)\", \"Homework title\", \"Homework content\", \"Outline\"]}}]', 18, 1),
(279, '2020-02-20 03:07:30.949848', '1', '成都校区 python 4 1', 2, '[{\"changed\": {\"fields\": [\"\\u7b2c\\u51e0\\u8282(\\u5929)\"]}}]', 18, 1),
(280, '2020-02-20 03:07:43.479626', '7', '成都校区 python 4 2', 1, '[{\"added\": {}}]', 18, 1),
(281, '2020-02-20 03:08:56.460499', '19', '<9638527410 是机会> 成都校区 python 4 成都校区 python 4 2 0', 3, '', 19, 1),
(282, '2020-02-20 03:09:24.639267', '20', '<456789 茉黎> 成都校区 python 4 成都校区 python 4 2 80', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(283, '2020-02-20 03:09:24.778378', '21', '<9876543210 莉莉> 成都校区 python 4 成都校区 python 4 2 40', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(284, '2020-02-20 03:09:24.885347', '22', '<976543210 导致> 成都校区 python 4 成都校区 python 4 2 85', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(285, '2020-02-20 03:09:24.988175', '23', '<12567890 安博会> 成都校区 python 4 成都校区 python 4 2 80', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(286, '2020-02-20 03:09:25.082196', '24', '<9638527410 是机会> 成都校区 python 4 成都校区 python 4 2 60', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(287, '2020-02-20 03:09:49.346801', '8', '成都校区 python 4 3', 1, '[{\"added\": {}}]', 18, 1),
(288, '2020-02-20 03:09:58.696601', '9', '成都校区 python 4 4', 1, '[{\"added\": {}}]', 18, 1),
(289, '2020-02-20 03:10:10.105990', '10', '成都校区 python 4 5', 1, '[{\"added\": {}}]', 18, 1),
(290, '2020-02-20 03:10:42.405397', '35', '<456789 茉黎> 成都校区 python 4 成都校区 python 4 5 60', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(291, '2020-02-20 03:10:42.522610', '36', '<9876543210 莉莉> 成都校区 python 4 成都校区 python 4 5 85', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(292, '2020-02-20 03:10:42.791475', '37', '<976543210 导致> 成都校区 python 4 成都校区 python 4 5 80', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(293, '2020-02-20 03:10:42.906803', '38', '<12567890 安博会> 成都校区 python 4 成都校区 python 4 5 70', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(294, '2020-02-20 03:10:43.012404', '39', '<9638527410 是机会> 成都校区 python 4 成都校区 python 4 5 100', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(295, '2020-02-20 03:10:59.067880', '30', '<456789 茉黎> 成都校区 python 4 成都校区 python 4 4 60', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(296, '2020-02-20 03:10:59.250188', '31', '<9876543210 莉莉> 成都校区 python 4 成都校区 python 4 4 80', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(297, '2020-02-20 03:10:59.366736', '32', '<976543210 导致> 成都校区 python 4 成都校区 python 4 4 85', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(298, '2020-02-20 03:10:59.550814', '33', '<12567890 安博会> 成都校区 python 4 成都校区 python 4 4 80', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(299, '2020-02-20 03:10:59.682574', '34', '<9638527410 是机会> 成都校区 python 4 成都校区 python 4 4 100', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(300, '2020-02-20 03:11:12.186508', '25', '<456789 茉黎> 成都校区 python 4 成都校区 python 4 3 40', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(301, '2020-02-20 03:11:12.279691', '26', '<9876543210 莉莉> 成都校区 python 4 成都校区 python 4 3 80', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(302, '2020-02-20 03:11:12.408619', '27', '<976543210 导致> 成都校区 python 4 成都校区 python 4 3 90', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(303, '2020-02-20 03:11:12.711690', '28', '<12567890 安博会> 成都校区 python 4 成都校区 python 4 3 85', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(304, '2020-02-20 03:11:12.847803', '29', '<9638527410 是机会> 成都校区 python 4 成都校区 python 4 3 70', 2, '[{\"changed\": {\"fields\": [\"Score\"]}}]', 19, 1),
(306, '2020-02-20 10:36:13.129441', '1', '成都校区 python 4 1', 2, '[{\"changed\": {\"fields\": [\"Homework content\", \"Outline\"]}}]', 18, 1);

-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'crm', 'branch'),
(8, 'crm', 'classlist'),
(20, 'crm', 'contracttemplate'),
(9, 'crm', 'course'),
(18, 'crm', 'courserecord'),
(10, 'crm', 'customer'),
(17, 'crm', 'customerfollowup'),
(16, 'crm', 'enrollment'),
(11, 'crm', 'menu'),
(15, 'crm', 'payment'),
(14, 'crm', 'role'),
(19, 'crm', 'studyrecord'),
(12, 'crm', 'tag'),
(13, 'crm', 'userprofile'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- 表的结构 `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-02-14 06:45:05.354379'),
(2, 'auth', '0001_initial', '2020-02-14 06:45:06.776316'),
(3, 'admin', '0001_initial', '2020-02-14 06:45:16.340834'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-02-14 06:45:19.855689'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-02-14 06:45:19.955390'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-02-14 06:45:21.320743'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-02-14 06:45:22.153805'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-02-14 06:45:23.245238'),
(9, 'auth', '0004_alter_user_username_opts', '2020-02-14 06:45:23.372117'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-02-14 06:45:23.870802'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-02-14 06:45:23.937860'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-02-14 06:45:23.991538'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-02-14 06:45:24.839813'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-02-14 06:45:25.900965'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-02-14 06:45:26.883158'),
(16, 'auth', '0011_update_proxy_permissions', '2020-02-14 06:45:26.925094'),
(17, 'crm', '0001_initial', '2020-02-14 06:45:32.975228'),
(18, 'sessions', '0001_initial', '2020-02-14 06:45:59.557183'),
(19, 'crm', '0002_auto_20200214_1450', '2020-02-14 06:50:54.331619'),
(20, 'crm', '0003_auto_20200214_1544', '2020-02-14 07:44:15.401603'),
(21, 'crm', '0004_userprofile_roles', '2020-02-14 12:40:28.462229'),
(22, 'crm', '0005_remove_userprofile_roles', '2020-02-14 12:43:25.865762'),
(23, 'crm', '0006_auto_20200215_1020', '2020-02-15 02:20:50.632765'),
(24, 'crm', '0007_userprofile_roles', '2020-02-15 08:26:12.184653'),
(25, 'crm', '0008_auto_20200217_1109', '2020-02-17 03:10:06.579871'),
(26, 'crm', '0009_auto_20200217_1139', '2020-02-17 03:40:07.266931'),
(27, 'crm', '0010_auto_20200219_2103', '2020-02-19 13:03:52.458374');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('12utqk58nng88e2kpzxnr6h0euludkxk', 'MjkwYzJkZjVlMTc3OWVjZTIzMmQ5NzEyYTFmYzg0YTYyNzBjZjNhZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMTlmMTVhNjc0NTJhNjgyYTVhNjRhYTE0OTlkYjVhOWY3N2VmNmE3In0=', '2020-03-02 01:54:40.274931'),
('6bdxe9d1jyoc7u16l45drqza2tjxinuw', 'MjkwYzJkZjVlMTc3OWVjZTIzMmQ5NzEyYTFmYzg0YTYyNzBjZjNhZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMTlmMTVhNjc0NTJhNjgyYTVhNjRhYTE0OTlkYjVhOWY3N2VmNmE3In0=', '2020-03-05 01:22:37.883332'),
('6ssmfplb2uox1wbmg91rrhkg0edjqv7i', 'MjkwYzJkZjVlMTc3OWVjZTIzMmQ5NzEyYTFmYzg0YTYyNzBjZjNhZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMTlmMTVhNjc0NTJhNjgyYTVhNjRhYTE0OTlkYjVhOWY3N2VmNmE3In0=', '2020-03-05 02:24:32.179029'),
('f9yhie4mkblapwcirysi34nt1kk421ic', 'MjkwYzJkZjVlMTc3OWVjZTIzMmQ5NzEyYTFmYzg0YTYyNzBjZjNhZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMTlmMTVhNjc0NTJhNjgyYTVhNjRhYTE0OTlkYjVhOWY3N2VmNmE3In0=', '2020-03-04 13:40:48.925202'),
('uzojngghby39ehet2fkb15t52uegbpia', 'YWJkNWEzNDBiZGJjZGVlY2RiMjVjZjZkNTIxZWZmZjFiNDBjN2UyZTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMDk5Mzg4YTk4YzgyMTU2MWY0MTdlZDA1ZmQwMDJlMGEzYWNhMzI2In0=', '2020-03-05 06:53:10.960842'),
('vqe76dl96hhqnk87u6b2nlj8wieqp2qs', 'YWJkNWEzNDBiZGJjZGVlY2RiMjVjZjZkNTIxZWZmZjFiNDBjN2UyZTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMDk5Mzg4YTk4YzgyMTU2MWY0MTdlZDA1ZmQwMDJlMGEzYWNhMzI2In0=', '2020-03-05 10:36:35.098079');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `crm_branch`
--
ALTER TABLE `crm_branch`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `crm_classlist`
--
ALTER TABLE `crm_classlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crm_classlist_branch_id_course_id_semester_82c1a6a6_uniq` (`branch_id`,`course_id`,`semester`),
  ADD KEY `crm_classlist_course_id_8a4c36de_fk_crm_course_id` (`course_id`),
  ADD KEY `crm_classlist_contract_id_99c5c1b3_fk_crm_contracttemplate_id` (`contract_id`);

--
-- Indexes for table `crm_classlist_teacher`
--
ALTER TABLE `crm_classlist_teacher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crm_classlist_teacher_classlist_id_userprofile_id_5c3641d3_uniq` (`classlist_id`,`userprofile_id`),
  ADD KEY `crm_classlist_teache_userprofile_id_53a21bf2_fk_crm_userp` (`userprofile_id`);

--
-- Indexes for table `crm_contracttemplate`
--
ALTER TABLE `crm_contracttemplate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `crm_course`
--
ALTER TABLE `crm_course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `crm_courserecord`
--
ALTER TABLE `crm_courserecord`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crm_courserecord_from_class_id_day_num_4a38bdfe_uniq` (`from_class_id`,`day_num`),
  ADD KEY `crm_courserecord_teacher_id_3ace9808_fk_crm_userprofile_id` (`teacher_id`);

--
-- Indexes for table `crm_customer`
--
ALTER TABLE `crm_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `qq` (`qq`),
  ADD KEY `crm_customer_consult_course_id_62aafa42_fk_crm_course_id` (`consult_course_id`),
  ADD KEY `crm_customer_consultant_id_11f5298a_fk_crm_userprofile_id` (`consultant_id`);

--
-- Indexes for table `crm_customerfollowup`
--
ALTER TABLE `crm_customerfollowup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_customerfollowup_consultant_id_f64b5970_fk_crm_userp` (`consultant_id`),
  ADD KEY `crm_customerfollowup_customer_id_16ca1a28_fk_crm_customer_id` (`customer_id`);

--
-- Indexes for table `crm_customer_tags`
--
ALTER TABLE `crm_customer_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crm_customer_tags_customer_id_tag_id_2f3e4566_uniq` (`customer_id`,`tag_id`),
  ADD KEY `crm_customer_tags_tag_id_3dbac3dd_fk_crm_tag_id` (`tag_id`);

--
-- Indexes for table `crm_enrollment`
--
ALTER TABLE `crm_enrollment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crm_enrollment_customer_id_enrolled_class_id_4589de06_uniq` (`customer_id`,`enrolled_class_id`),
  ADD KEY `crm_enrollment_consultant_id_17808eee_fk_crm_userprofile_id` (`consultant_id`),
  ADD KEY `crm_enrollment_enrolled_class_id_7ea2b50c_fk_crm_classlist_id` (`enrolled_class_id`);

--
-- Indexes for table `crm_menu`
--
ALTER TABLE `crm_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_payment`
--
ALTER TABLE `crm_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_payment_consultant_id_dadfc95b_fk_crm_userprofile_id` (`consultant_id`),
  ADD KEY `crm_payment_course_id_99bfc342_fk_crm_course_id` (`course_id`),
  ADD KEY `crm_payment_customer_id_edbd2a4a_fk_crm_customer_id` (`customer_id`);

--
-- Indexes for table `crm_role`
--
ALTER TABLE `crm_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `crm_role_menus`
--
ALTER TABLE `crm_role_menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crm_role_menus_role_id_menu_id_955dcb97_uniq` (`role_id`,`menu_id`),
  ADD KEY `crm_role_menus_menu_id_f3321925_fk_crm_menu_id` (`menu_id`);

--
-- Indexes for table `crm_studyrecord`
--
ALTER TABLE `crm_studyrecord`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crm_studyrecord_student_id_course_record_id_24d12464_uniq` (`student_id`,`course_record_id`),
  ADD KEY `crm_studyrecord_course_record_id_e3601e93_fk_crm_courserecord_id` (`course_record_id`);

--
-- Indexes for table `crm_tag`
--
ALTER TABLE `crm_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `crm_userprofile`
--
ALTER TABLE `crm_userprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `crm_userprofile_stu_account_id_6b6915c2_fk_crm_customer_id` (`stu_account_id`);

--
-- Indexes for table `crm_userprofile_groups`
--
ALTER TABLE `crm_userprofile_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crm_userprofile_groups_userprofile_id_group_id_3639bc47_uniq` (`userprofile_id`,`group_id`),
  ADD KEY `crm_userprofile_groups_group_id_50fd12ae_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `crm_userprofile_roles`
--
ALTER TABLE `crm_userprofile_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crm_userprofile_roles_userprofile_id_role_id_cee8b0c7_uniq` (`userprofile_id`,`role_id`),
  ADD KEY `crm_userprofile_roles_role_id_33eee41d_fk_crm_role_id` (`role_id`);

--
-- Indexes for table `crm_userprofile_user_permissions`
--
ALTER TABLE `crm_userprofile_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crm_userprofile_user_per_userprofile_id_permissio_d2888764_uniq` (`userprofile_id`,`permission_id`),
  ADD KEY `crm_userprofile_user_permission_id_28bdda74_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- 使用表AUTO_INCREMENT `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `crm_branch`
--
ALTER TABLE `crm_branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `crm_classlist`
--
ALTER TABLE `crm_classlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `crm_classlist_teacher`
--
ALTER TABLE `crm_classlist_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `crm_contracttemplate`
--
ALTER TABLE `crm_contracttemplate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `crm_course`
--
ALTER TABLE `crm_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `crm_courserecord`
--
ALTER TABLE `crm_courserecord`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `crm_customer`
--
ALTER TABLE `crm_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `crm_customerfollowup`
--
ALTER TABLE `crm_customerfollowup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `crm_customer_tags`
--
ALTER TABLE `crm_customer_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `crm_enrollment`
--
ALTER TABLE `crm_enrollment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- 使用表AUTO_INCREMENT `crm_menu`
--
ALTER TABLE `crm_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `crm_payment`
--
ALTER TABLE `crm_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- 使用表AUTO_INCREMENT `crm_role`
--
ALTER TABLE `crm_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `crm_role_menus`
--
ALTER TABLE `crm_role_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `crm_studyrecord`
--
ALTER TABLE `crm_studyrecord`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- 使用表AUTO_INCREMENT `crm_tag`
--
ALTER TABLE `crm_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `crm_userprofile`
--
ALTER TABLE `crm_userprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `crm_userprofile_groups`
--
ALTER TABLE `crm_userprofile_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `crm_userprofile_roles`
--
ALTER TABLE `crm_userprofile_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `crm_userprofile_user_permissions`
--
ALTER TABLE `crm_userprofile_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- 使用表AUTO_INCREMENT `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- 限制导出的表
--

--
-- 限制表 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- 限制表 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `crm_classlist`
--
ALTER TABLE `crm_classlist`
  ADD CONSTRAINT `crm_classlist_branch_id_26374f76_fk_crm_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `crm_branch` (`id`),
  ADD CONSTRAINT `crm_classlist_contract_id_99c5c1b3_fk_crm_contracttemplate_id` FOREIGN KEY (`contract_id`) REFERENCES `crm_contracttemplate` (`id`),
  ADD CONSTRAINT `crm_classlist_course_id_8a4c36de_fk_crm_course_id` FOREIGN KEY (`course_id`) REFERENCES `crm_course` (`id`);

--
-- 限制表 `crm_classlist_teacher`
--
ALTER TABLE `crm_classlist_teacher`
  ADD CONSTRAINT `crm_classlist_teache_userprofile_id_53a21bf2_fk_crm_userp` FOREIGN KEY (`userprofile_id`) REFERENCES `crm_userprofile` (`id`),
  ADD CONSTRAINT `crm_classlist_teacher_classlist_id_da5bb671_fk_crm_classlist_id` FOREIGN KEY (`classlist_id`) REFERENCES `crm_classlist` (`id`);

--
-- 限制表 `crm_courserecord`
--
ALTER TABLE `crm_courserecord`
  ADD CONSTRAINT `crm_courserecord_from_class_id_4408a85a_fk_crm_classlist_id` FOREIGN KEY (`from_class_id`) REFERENCES `crm_classlist` (`id`),
  ADD CONSTRAINT `crm_courserecord_teacher_id_3ace9808_fk_crm_userprofile_id` FOREIGN KEY (`teacher_id`) REFERENCES `crm_userprofile` (`id`);

--
-- 限制表 `crm_customer`
--
ALTER TABLE `crm_customer`
  ADD CONSTRAINT `crm_customer_consult_course_id_62aafa42_fk_crm_course_id` FOREIGN KEY (`consult_course_id`) REFERENCES `crm_course` (`id`),
  ADD CONSTRAINT `crm_customer_consultant_id_11f5298a_fk_crm_userprofile_id` FOREIGN KEY (`consultant_id`) REFERENCES `crm_userprofile` (`id`);

--
-- 限制表 `crm_customerfollowup`
--
ALTER TABLE `crm_customerfollowup`
  ADD CONSTRAINT `crm_customerfollowup_consultant_id_f64b5970_fk_crm_userp` FOREIGN KEY (`consultant_id`) REFERENCES `crm_userprofile` (`id`),
  ADD CONSTRAINT `crm_customerfollowup_customer_id_16ca1a28_fk_crm_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `crm_customer` (`id`);

--
-- 限制表 `crm_customer_tags`
--
ALTER TABLE `crm_customer_tags`
  ADD CONSTRAINT `crm_customer_tags_customer_id_cb3e3b39_fk_crm_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `crm_customer` (`id`),
  ADD CONSTRAINT `crm_customer_tags_tag_id_3dbac3dd_fk_crm_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `crm_tag` (`id`);

--
-- 限制表 `crm_enrollment`
--
ALTER TABLE `crm_enrollment`
  ADD CONSTRAINT `crm_enrollment_consultant_id_17808eee_fk_crm_userprofile_id` FOREIGN KEY (`consultant_id`) REFERENCES `crm_userprofile` (`id`),
  ADD CONSTRAINT `crm_enrollment_customer_id_4e9336cf_fk_crm_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `crm_customer` (`id`),
  ADD CONSTRAINT `crm_enrollment_enrolled_class_id_7ea2b50c_fk_crm_classlist_id` FOREIGN KEY (`enrolled_class_id`) REFERENCES `crm_classlist` (`id`);

--
-- 限制表 `crm_payment`
--
ALTER TABLE `crm_payment`
  ADD CONSTRAINT `crm_payment_consultant_id_dadfc95b_fk_crm_userprofile_id` FOREIGN KEY (`consultant_id`) REFERENCES `crm_userprofile` (`id`),
  ADD CONSTRAINT `crm_payment_course_id_99bfc342_fk_crm_course_id` FOREIGN KEY (`course_id`) REFERENCES `crm_course` (`id`),
  ADD CONSTRAINT `crm_payment_customer_id_edbd2a4a_fk_crm_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `crm_customer` (`id`);

--
-- 限制表 `crm_role_menus`
--
ALTER TABLE `crm_role_menus`
  ADD CONSTRAINT `crm_role_menus_menu_id_f3321925_fk_crm_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `crm_menu` (`id`),
  ADD CONSTRAINT `crm_role_menus_role_id_d8dd6bc2_fk_crm_role_id` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`);

--
-- 限制表 `crm_studyrecord`
--
ALTER TABLE `crm_studyrecord`
  ADD CONSTRAINT `crm_studyrecord_course_record_id_e3601e93_fk_crm_courserecord_id` FOREIGN KEY (`course_record_id`) REFERENCES `crm_courserecord` (`id`),
  ADD CONSTRAINT `crm_studyrecord_student_id_18b0c323_fk_crm_enrollment_id` FOREIGN KEY (`student_id`) REFERENCES `crm_enrollment` (`id`);

--
-- 限制表 `crm_userprofile`
--
ALTER TABLE `crm_userprofile`
  ADD CONSTRAINT `crm_userprofile_stu_account_id_6b6915c2_fk_crm_customer_id` FOREIGN KEY (`stu_account_id`) REFERENCES `crm_customer` (`id`);

--
-- 限制表 `crm_userprofile_groups`
--
ALTER TABLE `crm_userprofile_groups`
  ADD CONSTRAINT `crm_userprofile_grou_userprofile_id_c8440cbf_fk_crm_userp` FOREIGN KEY (`userprofile_id`) REFERENCES `crm_userprofile` (`id`),
  ADD CONSTRAINT `crm_userprofile_groups_group_id_50fd12ae_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- 限制表 `crm_userprofile_roles`
--
ALTER TABLE `crm_userprofile_roles`
  ADD CONSTRAINT `crm_userprofile_role_userprofile_id_39ea736f_fk_crm_userp` FOREIGN KEY (`userprofile_id`) REFERENCES `crm_userprofile` (`id`),
  ADD CONSTRAINT `crm_userprofile_roles_role_id_33eee41d_fk_crm_role_id` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`);

--
-- 限制表 `crm_userprofile_user_permissions`
--
ALTER TABLE `crm_userprofile_user_permissions`
  ADD CONSTRAINT `crm_userprofile_user_permission_id_28bdda74_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `crm_userprofile_user_userprofile_id_566784f9_fk_crm_userp` FOREIGN KEY (`userprofile_id`) REFERENCES `crm_userprofile` (`id`);

--
-- 限制表 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
