/*
 Navicat Premium Dump SQL

 Source Server         : homesys@homework
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : home_healthcare

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 08/12/2024 10:23:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for complaint_expert
-- ----------------------------
DROP TABLE IF EXISTS `complaint_expert`;
CREATE TABLE `complaint_expert`  (
  `solve_id` int NOT NULL AUTO_INCREMENT,
  `expert_id` int NOT NULL COMMENT '处理人',
  `com_id` int NULL DEFAULT NULL COMMENT '投诉表',
  `solve_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `solve` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '处理办法',
  `is_solve` tinyint(1) NULL DEFAULT 0 COMMENT '是否解决',
  PRIMARY KEY (`solve_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of complaint_expert
-- ----------------------------
INSERT INTO `complaint_expert` VALUES (1, 1, 1, '2024-11-29 11:19:43', '已与用户沟通，承诺改进服务态度。', 1);
INSERT INTO `complaint_expert` VALUES (2, 2, 2, '2024-11-29 11:19:43', '提供了更详细的诊断报告，并安排了跟进电话。', 1);
INSERT INTO `complaint_expert` VALUES (3, 3, 3, '2024-11-29 11:19:43', '安排了另一位专家进行二次诊断，以提供更准确的建议。', 0);
INSERT INTO `complaint_expert` VALUES (4, 4, 4, '2024-11-29 11:19:43', '已调整回复流程，确保及时响应。', 1);
INSERT INTO `complaint_expert` VALUES (5, 5, 5, '2024-11-29 11:19:43', '已提供第二意见，并与用户讨论了治疗方案的疑虑。', 1);

-- ----------------------------
-- Table structure for complaint_user
-- ----------------------------
DROP TABLE IF EXISTS `complaint_user`;
CREATE TABLE `complaint_user`  (
  `com_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `expert_id` int NULL DEFAULT NULL COMMENT '投诉对象',
  `com_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `com_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '投诉内容',
  PRIMARY KEY (`com_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `expert_id`(`expert_id` ASC) USING BTREE,
  CONSTRAINT `complaint_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `complaint_user_ibfk_2` FOREIGN KEY (`expert_id`) REFERENCES `expert` (`expert_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of complaint_user
-- ----------------------------
INSERT INTO `complaint_user` VALUES (1, 1, 2, '2024-05-01 15:20:00', '我对专家的服务态度不满意，感觉没有得到应有的尊重。');
INSERT INTO `complaint_user` VALUES (2, 3, 4, '2024-11-29 11:15:33', '专家给出的诊断结果不够详细，我对我的病情还是有很多疑问。');
INSERT INTO `complaint_user` VALUES (3, 5, 1, '2024-11-29 11:15:33', '我认为专家的回答不够专业，希望得到更准确的医疗建议。');
INSERT INTO `complaint_user` VALUES (4, 1, 5, '2024-12-02 19:45:26', '专家没有按时回复我的问题，导致我错过了治疗的最佳时机。');
INSERT INTO `complaint_user` VALUES (5, 4, 3, '2024-11-29 11:15:33', '我对专家推荐的治疗方案有疑虑，希望得到第二意见。');

-- ----------------------------
-- Table structure for cur_female
-- ----------------------------
DROP TABLE IF EXISTS `cur_female`;
CREATE TABLE `cur_female`  (
  `fe_id` int NOT NULL AUTO_INCREMENT,
  `fe_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fe_sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fe_pro` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`fe_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cur_female
-- ----------------------------
INSERT INTO `cur_female` VALUES (1, '李医生', '女', '外科专家');
INSERT INTO `cur_female` VALUES (2, '赵医生', '女', '眼科专家');

-- ----------------------------
-- Table structure for cur_male
-- ----------------------------
DROP TABLE IF EXISTS `cur_male`;
CREATE TABLE `cur_male`  (
  `m_id` int NOT NULL AUTO_INCREMENT,
  `m_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `m_sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `m_pro` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`m_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cur_male
-- ----------------------------
INSERT INTO `cur_male` VALUES (1, '陈医生', '男', '内科专家');
INSERT INTO `cur_male` VALUES (2, '王医生', '男', '儿科专家');
INSERT INTO `cur_male` VALUES (3, '孙医生', '男', '心脏科专家');

-- ----------------------------
-- Table structure for expert
-- ----------------------------
DROP TABLE IF EXISTS `expert`;
CREATE TABLE `expert`  (
  `expert_id` int NOT NULL AUTO_INCREMENT,
  `expert_password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expert_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expert_age` int NULL DEFAULT NULL,
  `expert_sex` tinyint(1) NULL DEFAULT NULL,
  `expert_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Professional_honor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业证书',
  PRIMARY KEY (`expert_id`) USING BTREE,
  CONSTRAINT `expert_chk_1` CHECK (`expert_sex` in (0,1))
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expert
-- ----------------------------
INSERT INTO `expert` VALUES (1, '123', '陈医生', 45, 1, '13900001112', '内科专家');
INSERT INTO `expert` VALUES (2, '123', '李医生', 38, 0, '13800002233', '外科专家');
INSERT INTO `expert` VALUES (3, '123', '王医生', 52, 1, '13700003344', '儿科专家');
INSERT INTO `expert` VALUES (4, '123', '赵医生', 40, 0, '13600004455', '眼科专家');
INSERT INTO `expert` VALUES (5, '123', '孙医生', 48, 1, '13500005566', '心脏科专家');

-- ----------------------------
-- Table structure for expert_role
-- ----------------------------
DROP TABLE IF EXISTS `expert_role`;
CREATE TABLE `expert_role`  (
  `role_id` int NOT NULL,
  `expert_id` int NOT NULL,
  PRIMARY KEY (`expert_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id` ASC) USING BTREE,
  CONSTRAINT `expert_role_ibfk_1` FOREIGN KEY (`expert_id`) REFERENCES `expert` (`expert_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `expert_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expert_role
-- ----------------------------
INSERT INTO `expert_role` VALUES (1, 1);
INSERT INTO `expert_role` VALUES (2, 2);
INSERT INTO `expert_role` VALUES (3, 3);
INSERT INTO `expert_role` VALUES (4, 4);
INSERT INTO `expert_role` VALUES (5, 5);

-- ----------------------------
-- Table structure for health_expert
-- ----------------------------
DROP TABLE IF EXISTS `health_expert`;
CREATE TABLE `health_expert`  (
  `answer_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `expert_id` int NOT NULL,
  `answer_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `answer_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`answer_id`) USING BTREE,
  INDEX `question_id`(`question_id` ASC) USING BTREE,
  INDEX `expert_id`(`expert_id` ASC) USING BTREE,
  CONSTRAINT `health_expert_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `health_user` (`question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `health_expert_ibfk_2` FOREIGN KEY (`expert_id`) REFERENCES `expert` (`expert_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of health_expert
-- ----------------------------
INSERT INTO `health_expert` VALUES (1, 1, 1, '2024-11-29 11:13:33', '降低胆固醇可以通过食用富含纤维的食物，如燕麦、水果和蔬菜，同时减少饱和脂肪的摄入。');
INSERT INTO `health_expert` VALUES (2, 2, 2, '2024-11-29 11:13:33', '对于初学者，建议从每周三次的有氧运动开始，比如快走、游泳或骑自行车，每次30分钟。');
INSERT INTO `health_expert` VALUES (3, 3, 3, '2024-11-29 11:13:33', '改善睡眠质量可以尝试在睡前进行放松活动，如阅读或冥想，同时保持睡眠环境安静和黑暗。');
INSERT INTO `health_expert` VALUES (4, 4, 4, '2024-11-29 11:13:33', '在选择复合维生素时，建议咨询医生或营养师，以确保适合您的营养需求。');
INSERT INTO `health_expert` VALUES (5, 5, 5, '2024-11-29 11:13:33', '缓解工作压力可以尝试时间管理技巧，如设定优先级和休息时间，同时保持积极的生活态度。');

-- ----------------------------
-- Table structure for health_user
-- ----------------------------
DROP TABLE IF EXISTS `health_user`;
CREATE TABLE `health_user`  (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `question_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `question_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '问题名字',
  `question_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `question_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '问题文本',
  `choice_expert` int NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `health_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `health_user_chk_1` CHECK (`question_type` in (_utf8mb4'公开',_utf8mb4'私有'))
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of health_user
-- ----------------------------
INSERT INTO `health_user` VALUES (1, 1, '2024-11-29 11:10:29', '饮食建议', '公开', '请问有哪些食物可以帮助降低胆固醇？', NULL);
INSERT INTO `health_user` VALUES (2, 2, '2024-12-02 20:07:59', '运动计划', '私有', '我想制定一个适合初学者的健身计划，能给我一些建议吗？', 3);
INSERT INTO `health_user` VALUES (3, 3, '2024-12-02 20:11:13', '睡眠问题', '私有', '最近经常失眠，有什么好的方法可以改善睡眠质量？', 5);
INSERT INTO `health_user` VALUES (4, 4, '2024-12-02 20:08:02', '营养补充', '私有', '我正在考虑服用复合维生素，你有什么建议吗？', 1);
INSERT INTO `health_user` VALUES (5, 5, '2024-11-29 11:10:29', '心理健康', '公开', '最近工作压力大，如何有效缓解压力和焦虑？', NULL);

-- ----------------------------
-- Table structure for report_expert
-- ----------------------------
DROP TABLE IF EXISTS `report_expert`;
CREATE TABLE `report_expert`  (
  `ereport_id` int NOT NULL AUTO_INCREMENT,
  `expert_id` int NOT NULL,
  `ureport_id` int NOT NULL,
  `treat_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `result` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '诊断结果',
  `discribe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '病情描述',
  PRIMARY KEY (`ereport_id`) USING BTREE,
  INDEX `expert_id`(`expert_id` ASC) USING BTREE,
  INDEX `ureport_id`(`ureport_id` ASC) USING BTREE,
  CONSTRAINT `report_expert_ibfk_1` FOREIGN KEY (`expert_id`) REFERENCES `expert` (`expert_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `report_expert_ibfk_2` FOREIGN KEY (`ureport_id`) REFERENCES `report_user` (`ureport_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_expert
-- ----------------------------
INSERT INTO `report_expert` VALUES (1, 1, 1, '2024-11-29 11:05:17', '普通感冒', '患者报告轻微头痛和低烧，建议休息和多饮水。');
INSERT INTO `report_expert` VALUES (2, 2, 2, '2024-11-29 11:05:17', '急性胃炎', '患者胃部不适，恶心，建议做进一步的胃部检查。');
INSERT INTO `report_expert` VALUES (3, 3, 3, '2024-11-29 11:05:17', '支气管炎', '患者持续咳嗽，有绿色痰液，建议使用抗生素治疗。');
INSERT INTO `report_expert` VALUES (4, 4, 4, '2024-11-29 11:05:17', '神经压迫', '右手麻木，可能是神经压迫，建议进行神经传导检查。');
INSERT INTO `report_expert` VALUES (5, 5, 5, '2024-11-29 11:05:17', '视力问题', '视力模糊，建议进行全面的眼科检查和视力矫正。');

-- ----------------------------
-- Table structure for report_user
-- ----------------------------
DROP TABLE IF EXISTS `report_user`;
CREATE TABLE `report_user`  (
  `ureport_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `report_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '症状描述',
  `degree` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '严重程度',
  PRIMARY KEY (`ureport_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `report_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_user
-- ----------------------------
INSERT INTO `report_user` VALUES (1, 1, '2024-11-29 11:01:58', '轻微头痛，伴有低烧。', '轻微');
INSERT INTO `report_user` VALUES (2, 2, '2024-11-29 11:01:58', '胃部不适，感觉恶心。', '中等');
INSERT INTO `report_user` VALUES (3, 3, '2024-11-29 11:01:58', '持续咳嗽，有绿色痰液。', '严重');
INSERT INTO `report_user` VALUES (4, 4, '2024-12-02 20:36:19', '右手麻木，持续时间约30分钟。', '中等');
INSERT INTO `report_user` VALUES (5, 5, '2024-11-29 11:01:58', '视力模糊，伴有间歇性失焦。', '严重');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '扮演角色',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '保健顾问');
INSERT INTO `role` VALUES (2, '治疗师');
INSERT INTO `role` VALUES (3, '全科医生');
INSERT INTO `role` VALUES (4, '专家');
INSERT INTO `role` VALUES (5, '临床医生');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `test_id` int NOT NULL AUTO_INCREMENT,
  `test_condition` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '自测条件',
  `test_process` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '自测过程',
  `test_tool` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '自测工具',
  `test_method` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '自测方式',
  PRIMARY KEY (`test_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (1, '过敏症状', '皮肤针刺测试，可见结果', 'MyAllergyTest套件', '皮肤针刺，观察反应');
INSERT INTO `test` VALUES (2, '血糖、蛋白、pH值（尿三项）及十项其他尿液诊断化学组', '将Uri-Strip K试纸浸入尿液中，观察结果', 'Uri-Strip K试纸', '试纸浸入尿液，观察颜色变化');
INSERT INTO `test` VALUES (3, '大肠癌隐血筛查', '将EZ DETECT™测试垫放置在马桶中，与排便一起使用，观察结果', 'EZ DETECT™测试垫', '测试垫放置马桶，观察颜色变化');
INSERT INTO `test` VALUES (4, '乳腺癌自我检查', '使用AWARE™减少手指与乳腺组织之间的摩擦，提高早期发现异常或肿块的可能性', 'AWARE™乳腺自检垫和套件', '自我检查，减少摩擦，提高检测率');
INSERT INTO `test` VALUES (5, '前列腺癌PSA筛查', '皮肤针刺测试，可见结果', 'LANDMARK', '皮肤针刺，观察反应');
INSERT INTO `test` VALUES (6, '贫血', '皮肤针刺，可见结果', 'BioSafe®血红蛋白仪', '皮肤针刺，观察血液颜色和浓度');
INSERT INTO `test` VALUES (7, '糖尿病', '皮肤针刺，可见结果', 'CHEMCARD™糖尿病测试', '皮肤针刺，观察血糖水平');
INSERT INTO `test` VALUES (8, '胆固醇高', '皮肤针刺，可见结果', 'VENTURE™家用胆固醇测试', '皮肤针刺，观察胆固醇水平');
INSERT INTO `test` VALUES (9, '艾滋病毒', '皮肤针刺测试，可见结果', 'Home Access®', '皮肤针刺，观察反应');
INSERT INTO `test` VALUES (10, '丙型肝炎', '皮肤针刺测试，可见结果', 'Home Access®', '皮肤针刺，观察反应');
INSERT INTO `test` VALUES (11, '流感', '鼻咽拭子标本，送至病理学家', 'QuickVue', '鼻咽拭子，邮寄至实验室');
INSERT INTO `test` VALUES (12, '甲状腺问题', '皮肤针刺，可见结果', 'Landmark Diagnostics', '皮肤针刺，观察甲状腺激素水平');
INSERT INTO `test` VALUES (13, '肾脏疾病', '邮寄尿液样本至病理学家', 'FlexSite At Home Kidney Screen', '邮寄尿液样本，进行检测');
INSERT INTO `test` VALUES (14, '皮肤癌', '使用Visiderm透明片记录痣的变化', 'Visiderm皮肤监测系统', '透明片记录，比较痣的变化');
INSERT INTO `test` VALUES (15, '骨质疏松症关键骨标志物', '邮寄尿液样本至病理学家', 'Osteo Check', '邮寄尿液样本，进行检测');
INSERT INTO `test` VALUES (16, '激素平衡', '邮寄唾液样本至病理学家', 'Female Check', '邮寄唾液样本，进行激素水平检测');
INSERT INTO `test` VALUES (17, '矿物质和毒素', '邮寄头发样本至病理学家', 'Body Balance矿物检查', '邮寄头发样本，进行矿物质和毒素检测');
INSERT INTO `test` VALUES (18, '肺癌', '邮寄家庭空气样本至病理学家', 'Radon Home Test Kit', '邮寄家庭空气样本，进行检测');
INSERT INTO `test` VALUES (19, '心脏病', '皮肤针刺，邮寄至病理学家', 'CRP', '皮肤针刺，邮寄血液样本');
INSERT INTO `test` VALUES (20, '中耳炎急性感染', '使用EarCheck EC-2耳部监测器，观察结果', 'EarCheck EC-2', '耳部监测，观察颜色变化');
INSERT INTO `test` VALUES (21, '遗传健康风险', '皮肤针刺，邮寄至病理学家', 'DNA Premium Home DNA Test', '皮肤针刺，邮寄血液样本');
INSERT INTO `test` VALUES (22, '肝癌', '皮肤针刺，可见结果', 'Digital Bio Disc', '皮肤针刺，观察结果');
INSERT INTO `test` VALUES (23, '各种癌症', '邮寄血液样本至病理学家', 'Cancersafe®test', '邮寄血液样本，进行检测');
INSERT INTO `test` VALUES (24, '卵巢癌', '邮寄血液样本至病理学家', 'OvPlex™', '邮寄血液样本，进行检测');
INSERT INTO `test` VALUES (25, '膀胱癌', '尿液检测，可见结果', 'BTA stat test', '尿液滴在测试垫上，观察颜色变化');

-- ----------------------------
-- Table structure for test_expert
-- ----------------------------
DROP TABLE IF EXISTS `test_expert`;
CREATE TABLE `test_expert`  (
  `etest_id` int NOT NULL AUTO_INCREMENT,
  `utest_id` int NOT NULL,
  `expert_id` int NOT NULL,
  `etest_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `etest_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '诊断结果',
  `etest_treat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '推荐治疗',
  `etest_survey` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '进一步检查',
  PRIMARY KEY (`etest_id`) USING BTREE,
  INDEX `utest_id`(`utest_id` ASC) USING BTREE,
  INDEX `expert_id`(`expert_id` ASC) USING BTREE,
  CONSTRAINT `test_expert_ibfk_1` FOREIGN KEY (`utest_id`) REFERENCES `test_user` (`utest_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `test_expert_ibfk_2` FOREIGN KEY (`expert_id`) REFERENCES `expert` (`expert_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_expert
-- ----------------------------
INSERT INTO `test_expert` VALUES (1, 1, 1, '2024-11-29 10:59:10', '根据血糖测试结果，目前无糖尿病迹象。', '无需特别治疗，建议保持健康饮食习惯。', '建议每半年进行一次血糖测试。');
INSERT INTO `test_expert` VALUES (2, 2, 2, '2024-11-29 10:59:10', '尿蛋白阳性，可能是肾脏功能问题。', '建议减少蛋白质摄入，并进行进一步的肾功能检查。', '建议尽快进行血液和尿液的肾功能检查。');
INSERT INTO `test_expert` VALUES (3, 3, 3, '2024-11-29 10:59:10', '血压正常，无高血压迹象。', '无需治疗，继续保持健康生活方式。', '建议每年进行一次心血管健康检查。');
INSERT INTO `test_expert` VALUES (4, 4, 4, '2024-11-29 10:59:10', '胆固醇水平偏高，有心血管疾病风险。', '建议采用低胆固醇饮食，并增加运动量。', '建议进行血脂全套检查，包括LDL和HDL。');
INSERT INTO `test_expert` VALUES (5, 5, 5, '2024-11-29 10:59:10', '根据乳腺自检结果，未发现异常。', '无需特别治疗，建议定期进行乳腺自检。', '建议每年进行一次专业的乳腺检查。');

-- ----------------------------
-- Table structure for test_user
-- ----------------------------
DROP TABLE IF EXISTS `test_user`;
CREATE TABLE `test_user`  (
  `utest_id` int NOT NULL AUTO_INCREMENT,
  `test_id` int NOT NULL,
  `user_id` int NOT NULL,
  `result_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '自测数据',
  `result_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `result` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`utest_id`) USING BTREE,
  INDEX `test_id`(`test_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `test_user_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `test_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `test_user_chk_1` CHECK (`result` in (_utf8mb4'阴',_utf8mb4'阳'))
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_user
-- ----------------------------
INSERT INTO `test_user` VALUES (1, 5, 4, '流感病毒：未检测到', '2024-11-29 10:41:11', '阴');
INSERT INTO `test_user` VALUES (2, 1, 1, '皮肤出现红肿，瘙痒明显', '2024-11-29 10:43:17', '阳');
INSERT INTO `test_user` VALUES (3, 2, 2, '尿液pH值偏酸，颜色正常', '2024-11-29 10:43:17', '阴');
INSERT INTO `test_user` VALUES (4, 3, 3, '隐血测试未见异常', '2024-11-29 10:43:17', '阴');
INSERT INTO `test_user` VALUES (5, 4, 1, '乳腺自检未发现异常肿块', '2024-11-29 10:43:17', '阴');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_age` int NULL DEFAULT NULL,
  `user_sex` tinyint NULL DEFAULT NULL,
  `user_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_allergic` tinyint(1) NULL DEFAULT 0 COMMENT '是否过敏，0为无，1为有',
  `medical_history` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '既往病史',
  `current_treatment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '当前治疗情况',
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `user_chk_1` CHECK (`user_sex` in (0,1))
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zhangsan', '张三', 19, 1, '12345678901', 0, '无', '就诊吃药');
INSERT INTO `user` VALUES (2, '123', '李四', 22, 0, '12345678901', 1, '花粉过敏', '定期复查');
INSERT INTO `user` VALUES (3, 'wangwu', '王五', 28, 1, '12345678901', 1, '无', '无');
INSERT INTO `user` VALUES (4, '123', '孙七', 31, 0, '44455566677', 1, '青霉素过敏', '正在接受抗生素治疗');
INSERT INTO `user` VALUES (5, '123', '王十一', 21, 0, '1122334455', 0, '无', '正在接受物理治疗');

-- ----------------------------
-- Table structure for user_pwd
-- ----------------------------
DROP TABLE IF EXISTS `user_pwd`;
CREATE TABLE `user_pwd`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `old_pwd` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `new_pwd` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_pwd
-- ----------------------------
INSERT INTO `user_pwd` VALUES (1, 1, '张三', '123', 'zhangsan');
INSERT INTO `user_pwd` VALUES (4, 3, '王五', '123', 'wangwu');

-- ----------------------------
-- View structure for view_diagnosis_detail
-- ----------------------------
DROP VIEW IF EXISTS `view_diagnosis_detail`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_diagnosis_detail` AS select `report_user`.`ureport_id` AS `ureport_id`,`user`.`username` AS `username`,`report_user`.`report_time` AS `report_time`,`report_user`.`detail` AS `detail`,`expert`.`expert_name` AS `expert_name`,`report_expert`.`result` AS `result`,`report_user`.`degree` AS `degree`,`report_expert`.`treat_time` AS `treat_time`,`report_expert`.`discribe` AS `discribe` from (((`report_user` join `user` on((`report_user`.`user_id` = `user`.`user_id`))) join `report_expert` on((`report_user`.`ureport_id` = `report_expert`.`ureport_id`))) join `expert` on((`report_expert`.`expert_id` = `expert`.`expert_id`)));

-- ----------------------------
-- View structure for view_expert_detail
-- ----------------------------
DROP VIEW IF EXISTS `view_expert_detail`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_expert_detail` AS select `expert`.`expert_id` AS `ID`,`expert`.`expert_name` AS `expert_name`,`expert`.`expert_age` AS `expert_age`,`expert`.`expert_phone` AS `expert_phone`,`expert`.`Professional_honor` AS `Professional_honor`,`role`.`role_name` AS `role_name` from ((`expert` join `expert_role` on((`expert`.`expert_id` = `expert_role`.`expert_id`))) join `role` on((`expert_role`.`role_id` = `role`.`role_id`)));

-- ----------------------------
-- Procedure structure for cur_sex
-- ----------------------------
DROP PROCEDURE IF EXISTS `cur_sex`;
delimiter ;;

;;
delimiter ;

-- ----------------------------
-- Procedure structure for date_treat
-- ----------------------------
DROP PROCEDURE IF EXISTS `date_treat`;
delimiter ;;

;;
delimiter ;

-- ----------------------------
-- Function structure for fun_count_com
-- ----------------------------
DROP FUNCTION IF EXISTS `fun_count_com`;
delimiter ;;

;;
delimiter ;

-- ----------------------------
-- Procedure structure for list_open_questions
-- ----------------------------
DROP PROCEDURE IF EXISTS `list_open_questions`;
delimiter ;;

;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user
-- ----------------------------
DROP TRIGGER IF EXISTS `limit_age`;
delimiter ;;
CREATE TRIGGER `limit_age` BEFORE INSERT ON `user` FOR EACH ROW BEGIN 
  IF new.user_age <18 THEN
    SIGNAL SQLSTATE '45000' SET message_text ='不允许18岁以下家庭用户注册';
  END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user
-- ----------------------------
DROP TRIGGER IF EXISTS `record_pwd`;
delimiter ;;
CREATE TRIGGER `record_pwd` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
  IF new.user_password IS NOT NULL THEN
    INSERT INTO user_pwd (user_id, `name`, old_pwd, new_pwd) 
      VALUES (old.user_id, old.username,old.user_password,new.user_password);
  ELSE
    SIGNAL SQLSTATE '45000' SET message_text = '修改密码失败';
  END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
