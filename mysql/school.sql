/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3300
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3300
 Source Schema         : school

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 15/02/2023 16:05:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `html` int NULL DEFAULT NULL,
  `css` int NULL DEFAULT NULL,
  `js` int NULL DEFAULT NULL,
  `class` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (1, '2023/2/11', 'zcy', 1, 1, 1, 'A');
INSERT INTO `history` VALUES (2, '2023/2/12', 'zcy', 1, 1, 1, 'A');
INSERT INTO `history` VALUES (3, '2023/2/13', 'zcy', 2, 2, 3, 'A');
INSERT INTO `history` VALUES (4, '2023/2/13', 'sk', 1, 1, 1, 'B');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int NOT NULL,
  `sex` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `class` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `register` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '未注册',
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'http://localhost:8080/img/avatar1.be35a761.png',
  `fontfamily` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `theme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `html` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '未完成',
  `css` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '未完成',
  `js` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '未完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (1, 'zcy', 23, '男', 'A', '13283848488', '老师', 'zcyycz', 'qwe123456', '已注册', 'http://localhost:8080/img/avatar2.23bebfd2.png', '仿宋', '粉色', '黑色', 'http://localhost:8080/img/loginbg4.6ccb7a1e.png', '未完成', '未完成', '未完成');
INSERT INTO `test` VALUES (3, 'ww', 20, '女', 'B', '13929992020', '学生', 'qqqwww', 'qqqwww', '已注册', 'http://localhost:8080/img/avatar10.b6ed4505.png', '微软雅黑', '紫色', '黑色', '/img/loginbg1.d73501f8.png', '未完成', '未完成', '未完成');
INSERT INTO `test` VALUES (11, 'zz', 22, '女', 'B', '13223234534', '学生', 'wwwqqq', 'wwwqqq', '已注册', 'http://localhost:8080/img/avatar8.c6f3d34b.png', '宋体', '粉色', '粉红色', '/img/loginbg1.d73501f8.png', '未完成', '未完成', '未完成');
INSERT INTO `test` VALUES (15, 'vv', 25, '男', 'B', '13235335467', '学生', 'wwwwww', 'wwwwww', '已注册', NULL, NULL, NULL, NULL, NULL, '未完成', '未完成', '未完成');
INSERT INTO `test` VALUES (16, 'xx', 26, '女', 'B', '13455677899', '学生', '打开的那', 'qqq0909', '已注册', NULL, NULL, NULL, NULL, NULL, '未完成', '未完成', '未完成');
INSERT INTO `test` VALUES (17, 'bb', 26, '女', 'C', '13578777770', '学生', 'dasjk', 'ccc111', '已注册', NULL, NULL, NULL, NULL, NULL, '未完成', '未完成', '未完成');
INSERT INTO `test` VALUES (18, 'sk', 28, '男', 'B', '13523293848', '老师', 'aaabbb', 'aaabbb', '已注册', NULL, NULL, NULL, NULL, NULL, '未完成', '未完成', '未完成');
INSERT INTO `test` VALUES (19, 'sk', 28, '男', 'C', '13523293848', '老师', 'eeeeee', 'eeeeee', '已注册', '/img/avatar1.a35a2b11.png', '微软雅黑', '紫色', '黑色', '/img/loginbg1.d73501f8.png', '未完成', '未完成', '未完成');
INSERT INTO `test` VALUES (35, 'nn', 25, '女', 'B', '13274737757', '学生', NULL, NULL, '未注册', NULL, NULL, NULL, NULL, NULL, '未完成', '未完成', '未完成');
INSERT INTO `test` VALUES (46, 'zs', 28, '男', 'A', '13283848488', '学生', 'qqqqqq', 'qqqqqq', '已注册', '/img/avatar1.a35a2b11.png', '微软雅黑', '青色', '黑色', '/img/loginbg1.d73501f8.png', '未完成', '未完成', '未完成');
INSERT INTO `test` VALUES (47, 'ww', 20, '女', 'A', '13929992020', '学生', NULL, NULL, '未注册', NULL, NULL, NULL, NULL, NULL, '未完成', '未完成', '未完成');
INSERT INTO `test` VALUES (48, 'zz', 22, '女', 'B', '13223234534', '学生', 'dhasdj', 'gg22h3', '已注册', NULL, NULL, NULL, NULL, NULL, '未完成', '未完成', '未完成');
INSERT INTO `test` VALUES (49, 'cc', 24, '女', 'C', '17372737222', '学生', NULL, NULL, '未注册', NULL, NULL, NULL, NULL, NULL, '未完成', '未完成', '未完成');
INSERT INTO `test` VALUES (50, 'vv', 25, '男', 'B', '13235335467', '学生', NULL, NULL, '未注册', NULL, NULL, NULL, NULL, NULL, '未完成', '未完成', '未完成');

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `optionA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `optionB` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `optionC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `optionD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `answer` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `number` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES (1, '在下列的 HTML 中，哪个是最大的标题？', '<h6>', '<head>', '<heading>', '<h1>', 'D', 'html', 1);
INSERT INTO `title` VALUES (2, '在下列的 HTML 中，哪个可以添加背景颜色？', '<body color=\"yellow\">', '<background>yellow</background>', '<body bgcolor=\"yellow\">', 'null', 'C', 'html', 1);
INSERT INTO `title` VALUES (3, '如何制作电子邮件链接？', '<a href=\"xxx@yyy\">', '<mail href=\"xxx@yyy\">', '<a href=\"mailto:xxx@yyy\">', '<mail>xxx@yyy</mail>', 'C', 'html', 1);
INSERT INTO `title` VALUES (4, '以下选项中，哪个全部都是表格标签？', '<table><head><tfoot>', '<table><tr><td>', '<table><tr><tt>', '<thead><body><tr>', 'B', 'html', 1);
INSERT INTO `title` VALUES (5, ' 请选择可以使单元格中的内容进行左对齐的正确 HTML 标签：', '<td align=\"left\">', '<td valign=\"left\">', '<td leftalign>', '<tdleft>', 'A', 'html', 1);
INSERT INTO `title` VALUES (6, '如何产生带有圆点列表符号的列表？', '<dl>', '<list>', '<ol>', '<ul>', 'D', 'html', 2);
INSERT INTO `title` VALUES (7, '在下列的 HTML 中，哪个可以产生复选框？', '<input type=\"check\">', '<checkbox>', '<input type=\"checkbox\">', '<check>', 'C', 'html', 2);
INSERT INTO `title` VALUES (8, '在html中，样式表按照应用方式可以分为三种类型，其中不包括：', '内嵌样式表', '行内样式表', '外部样式表文件', '类样式表', 'D', 'html', 2);
INSERT INTO `title` VALUES (9, '在HTML中，可以使用（ ）标记向网页中插入GIF动画文件', '<FORM>', '<BODY>', '<TABLE>', '<IMG>', 'D', 'html', 2);
INSERT INTO `title` VALUES (10, '在HTML上，将表单中INPUT元素的TYPE属性值设置为（ ）时，用于创建重置按钮。', 'reset ', 'set ', 'button ', 'image', 'A', 'html', 2);
INSERT INTO `title` VALUES (11, '在制作HTML页面时，页面的布局技术主要分为：', '框架布局', '表格布局', 'DIV层布局', '以上全部选项', 'D', 'html', 3);
INSERT INTO `title` VALUES (12, '在HTML中，以下关于CSS样式中文本属性的说法，错误的是：', 'font-size用来设置文本的字体大小', 'font-family用来设置文本的字体类型', 'color用来设置文本的颜色', 'ext-align用来设置文本的字体形状', 'D', 'html', 3);
INSERT INTO `title` VALUES (13, '以下说法正确的是：', '<P>标签必须以</P>标签结束', ' <BR>标签必须以</BR>标签结束', '<TITLE>标签应该以</TITLE>标签结束', '<FONT>标签不能在<PRE>标签中使用', 'C', 'html', 3);
INSERT INTO `title` VALUES (14, '关于下列代码片段的说法中，正确的是：<HR size= \"5\" color=\"#0000FF\" width=\"50%\">', 'size是指水平线的长度', 'size是指水平线的宽度', 'width是指水平线的宽度', 'width是指水平线的高度', 'B', 'html', 3);
INSERT INTO `title` VALUES (15, ' 以下说法正确的是：', ' <A>标签是页面链接标签，只能用来链接到其他页面', '<A>标签是页面链接标签，只能用来链接到本页面的其他位置', '<A>标签的src属性用于指定要链接的地址', '<A>标签的href属性用于指定要链接的地址', 'D', 'html', 3);
INSERT INTO `title` VALUES (16, 'CSS 指的是？', 'Computer Style Sheets', 'Cascading Style Sheets', 'Creative Style Sheets', 'Colorful Style Sheets', 'B', 'css', 1);
INSERT INTO `title` VALUES (17, '在以下的 HTML 中，哪个是正确引用外部样式表的方法？', '<style src=\"mystyle.css\">', '<link rel=\"stylesheet\" type=\"text/css\" href=\"mystyle.css\">', '<stylesheet>mystyle.css</stylesheet>', 'null', 'B', 'css', 1);
INSERT INTO `title` VALUES (18, '在 HTML 文档中，引用外部样式表的正确位置是？', '文档的末尾', '文档的顶部', '<body>部分', '<head>部分', 'D', 'css', 1);
INSERT INTO `title` VALUES (19, '下列哪个选项的 CSS 语法是正确的？', 'body:color=black', '{body:color=black(body}', 'body {color: black}', '{body;color:black}', 'C', 'css', 1);
INSERT INTO `title` VALUES (20, '如何在 CSS 文件中插入注释？', '// this is a comment', '// this is a comment //', '/* this is a comment */', '\' this is a comment', 'C', 'css', 1);
INSERT INTO `title` VALUES (21, '如何为所有的 <h1> 元素添加背景颜色？', 'h1.all {background-color:#FFFFFF}', 'h1 {background-color:#FFFFFF}', 'all.h1 {background-color:#FFFFFF}', 'null', 'B', 'css', 2);
INSERT INTO `title` VALUES (22, '如何显示没有下划线的超链接？', 'a {text-decoration:none}', 'a {text-decoration:no underline}', 'a {underline:none}', 'a {decoration:no underline}', 'A', 'css', 2);
INSERT INTO `title` VALUES (23, '如何使文本以大写字母开头？', 'text-transform:capitalize', '无法通过 CSS 来实现', 'text-transform:uppercase', 'null', 'A', 'css', 2);
INSERT INTO `title` VALUES (24, '如何显示这样一个边框：上边框 10 像素、下边框 5 像素、左边框 20 像素、右边框 1 像素？', 'border-width:10px 5px 20px 1px', 'border-width:10px 20px 5px 1px', 'border-width:5px 20px 10px 1px', 'border-width:10px 1px 5px 20px', 'D', 'css', 2);
INSERT INTO `title` VALUES (25, '如何产生带有正方形项目的列表？', 'list-type: square', 'type: 2', 'type: square', 'list-style-type: square', 'D', 'css', 2);
INSERT INTO `title` VALUES (26, '如何使用 CSS3 强制换行？', 'word-wrap: break-word;', 'text-wrap: break-word;', 'text-wrap: force;', 'text-width: set;', 'A', 'css', 3);
INSERT INTO `title` VALUES (27, '如何使用 CSS3 旋转对象？', 'object-rotation: 30deg;', 'transform: rotate(30deg);', 'rotate-object: 30deg;', 'transform: rotate-30deg-clockwise;', 'B', 'css', 3);
INSERT INTO `title` VALUES (28, '.如果 border-radius 设置为 0 会发生什么？', ' 这个角将呈水平曲线', ' 这个角是正方形的', '这个角将垂直弯曲', '这个角将消失', 'B', 'css', 3);
INSERT INTO `title` VALUES (29, '要使 CSS3属性在较老的 Mozilla Firefox 浏览器上工作，需要哪个前缀？', '-webkit-', '-moz-', '-o-', '-gecko-', 'B', 'css', 3);
INSERT INTO `title` VALUES (30, '关于css 浮动正确的是？', '允许其他元素包围一个元素', '元素可以推到左边或右边', '元素可以推到左边或右边', '元素可以被推向任何方向', 'C', 'css', 3);
INSERT INTO `title` VALUES (31, '如果函数无明确的返回值，或调用了没有参数的return语句，那么它真正返回的值是：', 'null', '-1', '0', 'undefined', 'D', 'js', 1);
INSERT INTO `title` VALUES (32, '有关this运算符说法不正确的是', 'this运算符总是指向当前的对象。', '在JS中，由于JS的动态性，this的指向在运行时才确定。', 'this关键字在Javascript中和执行环境，而非声明环境有关。', '通过早期绑定可以实现对this的高度复用。', 'A', 'js', 1);
INSERT INTO `title` VALUES (33, '如下代码，会弹出来是什么 var num1=“1” ;var num2=1 alert(num1-num2);', '0', '11', '1+1', '报错', 'A', 'js', 1);
INSERT INTO `title` VALUES (34, '在JS中，“1555”+3的运行结果是：', '1558', '1558', '15553', '1553', 'C', 'js', 1);
INSERT INTO `title` VALUES (35, '下列变量名合法的是：', '5show', 'return', '$user', 'var', 'C', 'js', 1);
INSERT INTO `title` VALUES (36, 'typeof null 检测出来的数据类型是：', 'null', 'number', 'object', 'undefined', 'C', 'js', 2);
INSERT INTO `title` VALUES (37, 'parseInt(“12a”)的结果是：', 'NaN', '12a', '0', '12', 'D', 'js', 2);
INSERT INTO `title` VALUES (38, '下列的哪一个表达式将返回假：', '!(3<=1)', '(4>=4)&&(5<=2)', '2<3', '(2<3)||(3<2)', 'B', 'js', 2);
INSERT INTO `title` VALUES (39, '关于循环下列说法正确的是：', 'while循环至少会运行一次', 'do…while循环至少会运行一次', 'for循环至少会运行一次', 'switch循环至少会运行一次', 'B', 'js', 2);
INSERT INTO `title` VALUES (40, '如下代码，会弹出来是什么 var a; alert(a);', '报错', 'a is not define', 'undefined', '0', 'C', 'js', 2);
INSERT INTO `title` VALUES (41, 'JavaScript的组成不包括：', 'ECMAScript', 'DOM', 'BOM', 'document', 'D', 'js', 3);
INSERT INTO `title` VALUES (42, '下列表达式结果为false的是：', ' !\"\"', '!{}', '!undefined', '!!5', 'B', 'js', 3);
INSERT INTO `title` VALUES (43, '下列哪个对象表示浏览器窗口，并可用于检索关于该窗口状态的信息：', 'document', 'window', 'frames', 'navigator', 'B', 'js', 3);
INSERT INTO `title` VALUES (44, '下列哪个对象表示给定浏览器窗口中的html文档，用于检索关于文档的信息：', 'document', 'window', 'screen', 'history', 'A', 'js', 3);
INSERT INTO `title` VALUES (45, '事件处理程序可用于在用户单击按钮时执行函数：', 'onSubmit', 'onClick', 'onChange', 'onExit', 'B', 'js', 3);

SET FOREIGN_KEY_CHECKS = 1;
