/*
Navicat MySQL Data Transfer

Source Server         : 115.31.17.5
Source Server Version : 50721
Source Host           : 118.31.17.5:3306
Source Database       : stock_store

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-01-23 15:00:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for area_classified
-- ----------------------------
DROP TABLE IF EXISTS `area_classified`;
CREATE TABLE `area_classified` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `area` varchar(50) DEFAULT NULL COMMENT '地域名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for cashflow_data
-- ----------------------------
DROP TABLE IF EXISTS `cashflow_data`;
CREATE TABLE `cashflow_data` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `cf_sales` double DEFAULT NULL COMMENT '经营现金净流量对销售收入比率',
  `rateofreturn` double DEFAULT NULL COMMENT '资产的经营现金流量回报率',
  `cf_nm` double DEFAULT NULL COMMENT '经营现金净流量与净利润的比率',
  `cf_liabilities` double DEFAULT NULL COMMENT '经营现金净流量对负债比率',
  `cashflowratio` double DEFAULT NULL COMMENT '现金流量比率'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for concept_classified
-- ----------------------------
DROP TABLE IF EXISTS `concept_classified`;
CREATE TABLE `concept_classified` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `c_name` varchar(50) DEFAULT NULL COMMENT '概念名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for day_boxoffice
-- ----------------------------
DROP TABLE IF EXISTS `day_boxoffice`;
CREATE TABLE `day_boxoffice` (
  `Irank` int(11) DEFAULT NULL COMMENT '排名',
  `MovieName` varchar(255) DEFAULT NULL COMMENT '影片名',
  `WomIndex` double DEFAULT NULL COMMENT '口碑指数',
  `avgboxoffice` double DEFAULT NULL COMMENT '平均票价',
  `avgshowcount` int(11) DEFAULT NULL COMMENT '场均人次',
  `box_pro` double DEFAULT NULL COMMENT '月度占比',
  `boxoffice` double DEFAULT NULL COMMENT '单月票房(万)',
  `days` int(11) DEFAULT NULL COMMENT '月内天数',
  `releaseTime` datetime DEFAULT NULL COMMENT '上映日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for debtpaying_data
-- ----------------------------
DROP TABLE IF EXISTS `debtpaying_data`;
CREATE TABLE `debtpaying_data` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `currentratio` double DEFAULT NULL COMMENT '流动比率',
  `quickratio` double DEFAULT NULL COMMENT '速动比率',
  `cashratio` double DEFAULT NULL COMMENT '现金比率',
  `icratio` double DEFAULT NULL COMMENT '利息支付倍数',
  `sheqratio` double DEFAULT NULL COMMENT '股东权益比率',
  `adratio` double DEFAULT NULL COMMENT '股东权益增长率'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for gem_classified
-- ----------------------------
DROP TABLE IF EXISTS `gem_classified`;
CREATE TABLE `gem_classified` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for get_hs300s
-- ----------------------------
DROP TABLE IF EXISTS `get_hs300s`;
CREATE TABLE `get_hs300s` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `weight` double DEFAULT NULL COMMENT '权重'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for get_suspended
-- ----------------------------
DROP TABLE IF EXISTS `get_suspended`;
CREATE TABLE `get_suspended` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '股票名称',
  `oDate` datetime DEFAULT NULL COMMENT '上市日期',
  `tDate` datetime DEFAULT NULL COMMENT '终止上市日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for get_sz50s
-- ----------------------------
DROP TABLE IF EXISTS `get_sz50s`;
CREATE TABLE `get_sz50s` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for get_terminated
-- ----------------------------
DROP TABLE IF EXISTS `get_terminated`;
CREATE TABLE `get_terminated` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '股票名称',
  `oDate` datetime DEFAULT NULL COMMENT '上市日期',
  `tDate` datetime DEFAULT NULL COMMENT '终止上市日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for get_zz500s
-- ----------------------------
DROP TABLE IF EXISTS `get_zz500s`;
CREATE TABLE `get_zz500s` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '股票名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for growth_data
-- ----------------------------
DROP TABLE IF EXISTS `growth_data`;
CREATE TABLE `growth_data` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `mbrg` double DEFAULT NULL COMMENT '主营业务收入增长率(%)',
  `nprg` double DEFAULT NULL COMMENT '净利润增长率(%)',
  `nav` double DEFAULT NULL COMMENT '净资产增长率',
  `targ` double DEFAULT NULL COMMENT '总资产增长率',
  `epsg` double DEFAULT NULL COMMENT '每股收益增长率',
  `seg` double DEFAULT NULL COMMENT '股东权益增长率'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for industry_classified
-- ----------------------------
DROP TABLE IF EXISTS `industry_classified`;
CREATE TABLE `industry_classified` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `c_name` varchar(50) DEFAULT NULL COMMENT '行业名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for k_data
-- ----------------------------
DROP TABLE IF EXISTS `k_data`;
CREATE TABLE `k_data` (
  `code` int(11) DEFAULT NULL COMMENT '证券代码',
  `date` datetime DEFAULT NULL COMMENT 'YYYY-MM-DD ',
  `open` double DEFAULT NULL COMMENT '开盘价',
  `clode` double DEFAULT NULL COMMENT '收盘价',
  `high` double DEFAULT NULL COMMENT '最高价',
  `low` double DEFAULT NULL COMMENT '最低价',
  `volume` double DEFAULT NULL COMMENT '成交量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for operation_data
-- ----------------------------
DROP TABLE IF EXISTS `operation_data`;
CREATE TABLE `operation_data` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `arturnover` double DEFAULT NULL COMMENT '应收账款周转率(次)',
  `arturndays` double DEFAULT NULL COMMENT '应收账款周转天数(天)',
  `inventory_turnover` double DEFAULT NULL COMMENT '存货周转率(次)',
  `inventory_days` double DEFAULT NULL COMMENT '存货周转天数(天)',
  `currentasset_turnover` double DEFAULT NULL COMMENT '流动资产周转率(次)',
  `currentasset_days` double DEFAULT NULL COMMENT '流动资产周转天数(天)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for profit_data
-- ----------------------------
DROP TABLE IF EXISTS `profit_data`;
CREATE TABLE `profit_data` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `roe` double DEFAULT NULL COMMENT '净资产收益率(%)',
  `net_profit_ratio` double DEFAULT NULL COMMENT '净利率(%)',
  `gross_profit_rate` double DEFAULT NULL COMMENT '毛利率(%)',
  `net_profits` double DEFAULT NULL COMMENT '净利润(万元)',
  `esp` double DEFAULT NULL COMMENT '每股收益',
  `business_income` double DEFAULT NULL COMMENT '营业收入(百万元)',
  `bips` double DEFAULT NULL COMMENT '每股主营业务收入(元)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for realtime_boxoffice
-- ----------------------------
DROP TABLE IF EXISTS `realtime_boxoffice`;
CREATE TABLE `realtime_boxoffice` (
  `BoxOffice` double DEFAULT NULL COMMENT '实时票房（万）',
  `Irank` int(11) DEFAULT NULL COMMENT '排名',
  `MovieName` varchar(255) DEFAULT NULL COMMENT '影片名',
  `boxPer` double DEFAULT NULL COMMENT '票房占比 （%）',
  `movieDay` int(11) DEFAULT NULL COMMENT '上映天数',
  `sumBoxOffice` double DEFAULT NULL COMMENT '累计票房（万）',
  `time` datetime DEFAULT NULL COMMENT '数据获取时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for report_data
-- ----------------------------
DROP TABLE IF EXISTS `report_data`;
CREATE TABLE `report_data` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `esp` double DEFAULT NULL COMMENT '每股收益同比(%)',
  `eps_yoy` double DEFAULT NULL,
  `bvps` double DEFAULT NULL COMMENT '每股净资产',
  `roe` double DEFAULT NULL COMMENT '净资产收益率(%)',
  `epcf` double DEFAULT NULL COMMENT '每股现金流量(元)',
  `net_profits` double DEFAULT NULL COMMENT '净利润(万元)',
  `profits_yoy` double DEFAULT NULL COMMENT '净利润同比(%)',
  `distrib` varchar(255) DEFAULT NULL COMMENT '分配方案',
  `report_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发布日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for st_classified
-- ----------------------------
DROP TABLE IF EXISTS `st_classified`;
CREATE TABLE `st_classified` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for stock_basics
-- ----------------------------
DROP TABLE IF EXISTS `stock_basics`;
CREATE TABLE `stock_basics` (
  `code` int(11) DEFAULT NULL COMMENT '代码',
  `name` varchar(50) DEFAULT NULL,
  `industry` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `pe` double DEFAULT NULL,
  `outstanding` double DEFAULT NULL COMMENT '流通股本(亿)',
  `totals` double DEFAULT NULL COMMENT '总股本(亿)',
  `totalAssets` double DEFAULT NULL COMMENT '总资产(万)',
  `liquidAssets` double DEFAULT NULL COMMENT '流动资产',
  `fixedAssets` double DEFAULT NULL COMMENT '固定资产',
  `reserved` double DEFAULT NULL COMMENT '公积金',
  `reservedPerShare` double DEFAULT NULL COMMENT '每股公积金',
  `esp` double DEFAULT NULL COMMENT '每股收益',
  `bvps` double DEFAULT NULL COMMENT '每股净资',
  `pb` double DEFAULT NULL COMMENT '市净率',
  `timeToMarket` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上市日期',
  `undp` double DEFAULT NULL COMMENT '未分利润',
  `perundp` double DEFAULT NULL COMMENT '每股未分配',
  `rev` double DEFAULT NULL COMMENT '收入同比(%)',
  `profit` double DEFAULT NULL COMMENT '利润同比(%)',
  `gpr` double DEFAULT NULL COMMENT '毛利率(%)',
  `npr` double DEFAULT NULL COMMENT '净利润率(%)',
  `holders` int(11) DEFAULT NULL COMMENT '股东人数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
SET FOREIGN_KEY_CHECKS=1;
