DROP DATABASE IF EXISTS `training`;

CREATE DATABASE `training` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

USE `training`;

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`
(
    `id`             int(20)                                                       NOT NULL AUTO_INCREMENT,
    `name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `identification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `sex`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `phone_number`   varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `address`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    PRIMARY KEY (`id`),
    KEY `customer_idx1_name` (`name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='客户表';

-- ----------------------------
-- Records of customer
-- ----------------------------
BEGIN;
INSERT INTO `customer`
VALUES (1, 'tom', 'tom', 'male', '17034642999', '天津市河东区海河东路218号');
INSERT INTO `customer`
VALUES (2, 'jerry', 'jerry', 'female', '17034642990', '天津市河东区海河东路119号');
COMMIT;


DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`
(
    `id`       int(20)                                                       NOT NULL AUTO_INCREMENT,
    `name`     varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `price`    decimal(20, 2)                                                NOT NULL,
    `stock`    int(20)                                                       NOT NULL,
    `supplier` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    PRIMARY KEY (`id`),
    KEY `product_idx1_name` (`name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='产品表';

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product`
VALUES (1, '苹果', 10, 10000, '农贸公司');
INSERT INTO `product`
VALUES (2, '香蕉', 20, 5000, '果园农场');
COMMIT;

DROP TABLE IF EXISTS `order_order`;
CREATE TABLE `order_order`
(
    `id`            int(20)                                                       NOT NULL AUTO_INCREMENT,
    `customer_id`   int(20)                                                       NOT NULL,
    `customer_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `amount`        decimal(20, 2)                                                NOT NULL,
    `order_time`    datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `flag`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `address`       varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    PRIMARY KEY (`id`),
    KEY `order_idx1_customer_id` (`customer_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='订单表';

DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`
(
    `id`            int(20)                                                       NOT NULL AUTO_INCREMENT,
    `order_id`      int(20)                                                       NOT NULL,
    `product_id`    int(20)                                                       NOT NULL,
    `product_name`  varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `product_price` decimal(20, 2)                                                NOT NULL,
    `quantity`      int(20)                                                       NOT NULL,
    `amount`        decimal(20, 2)                                                NOT NULL,
    PRIMARY KEY (`id`),
    KEY `order_item_idx1_order_id` (`order_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC COMMENT ='订单项表';

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `order_order`
VALUES (1, 1, 'tom', 80, now(), '1', '天津市河东区海河东路218号');
INSERT INTO `order_item`
VALUES (1, 1, 1, '苹果', 10, 2, 20);
INSERT INTO `order_item`
VALUES (2, 1, 2, '香蕉', 20, 3, 60);
COMMIT;