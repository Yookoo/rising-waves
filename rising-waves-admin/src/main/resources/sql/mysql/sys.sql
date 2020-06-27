/*
 Navicat Premium Data Transfer

 Source Server         : local-mysql
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : rising-waves

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 26/06/2020 17:07:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS sys_permission;
CREATE TABLE sys_permission (
  id bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  perms_name varchar(50) NOT NULL COMMENT '权限名称',
  perms varchar(100) DEFAULT NULL COMMENT '权限标识',
  parent_id bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  sorted int(4) DEFAULT '0' COMMENT '显示顺序',
  path varchar(200) DEFAULT '' COMMENT '路由地址',
  component varchar(255) DEFAULT NULL COMMENT '组件路径',
  external_link tinyint(1) DEFAULT '0' COMMENT '是否为外链（0是 1否）',
  perms_type tinyint(2) DEFAULT '0' COMMENT '权限类型（0 未知 1菜单 2按钮 3 目录）',
  visible tinyint(1) DEFAULT '0' COMMENT '显示状态（1显示 0隐藏）',
  deleted tinyint(1) DEFAULT '0' COMMENT '权限状态（0正常 1删除）',
  icon varchar(100) DEFAULT '#' COMMENT '菜单图标',
  create_by varchar(64) DEFAULT '' COMMENT '创建者',
  create_time datetime DEFAULT NULL COMMENT '创建时间',
  update_by varchar(64) DEFAULT '' COMMENT '更新者',
  update_time datetime DEFAULT NULL COMMENT '更新时间',
  remark varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (id) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
BEGIN;
INSERT INTO sys_permission VALUES (1, '系统管理', 'system', 0, 1, 'system', NULL, 1, 3, 0, 0, '', 'admin', NULL, 'ry', NULL, '系统管理目录');
INSERT INTO sys_permission VALUES (2, '系统监控', 'monitor', 0, 2, 'monitor', NULL, 1, 3, 0, 0, '', 'admin', NULL, 'ry', NULL, '系统监控目录');
INSERT INTO sys_permission VALUES (3, '系统工具', 'tool', 0, 3, 'tool', NULL, 1, 3, 0, 0, '', 'admin', NULL, 'ry', NULL, '系统工具目录');
INSERT INTO sys_permission VALUES (4, '若依官网', 'guide', 0, 4, 'http://ruoyi.vip', NULL, 0, 3, 0, 0, '', 'admin', NULL, 'ry', NULL, '若依官网地址');
INSERT INTO sys_permission VALUES (100, '用户管理', 'system:user:list', 1, 1, 'user', 'system/user/index', 1, 1, 0, 0, 'user', 'admin', NULL, 'ry', NULL, '用户管理菜单');
INSERT INTO sys_permission VALUES (101, '角色管理', 'system:role:list', 1, 2, 'role', 'system/role/index', 1, 1, 0, 0, 'peoples', 'admin', NULL, 'ry', NULL, '角色管理菜单');
INSERT INTO sys_permission VALUES (102, '菜单管理', 'system:menu:list', 1, 3, 'menu', 'system/menu/index', 1, 1, 0, 0, 'tree-table', 'admin', NULL, 'ry', NULL, '菜单管理菜单');
INSERT INTO sys_permission VALUES (103, '部门管理', 'system:dept:list', 1, 4, 'dept', 'system/dept/index', 1, 1, 0, 0, 'tree', 'admin', NULL, 'ry', NULL, '部门管理菜单');
INSERT INTO sys_permission VALUES (104, '岗位管理', 'system:post:list', 1, 5, 'post', 'system/post/index', 1, 1, 0, 0, 'post', 'admin', NULL, 'ry', NULL, '岗位管理菜单');
INSERT INTO sys_permission VALUES (105, '字典管理', 'system:dict:list', 1, 6, 'dict', 'system/dict/index', 1, 1, 0, 0, 'dict', 'admin', NULL, 'ry', NULL, '字典管理菜单');
INSERT INTO sys_permission VALUES (106, '参数设置', 'system:config:list', 1, 7, 'config', 'system/config/index', 1, 1, 0, 0, 'edit', 'admin', NULL, 'ry', NULL, '参数设置菜单');
INSERT INTO sys_permission VALUES (107, '通知公告', 'system:notice:list', 1, 8, 'notice', 'system/notice/index', 1, 1, 0, 0, 'message', 'admin', NULL, 'ry', NULL, '通知公告菜单');
INSERT INTO sys_permission VALUES (108, '日志管理', '', 1, 9, 'log', 'system/log/index', 1, 3, 0, 0, 'log', 'admin', NULL, 'ry', NULL, '日志管理菜单');
INSERT INTO sys_permission VALUES (109, '在线用户', 'monitor:online:list', 2, 1, 'online', 'monitor/online/index', 1, 1, 0, 0, 'online', 'admin', NULL, 'ry', NULL, '在线用户菜单');
INSERT INTO sys_permission VALUES (110, '定时任务', 'monitor:job:list', 2, 2, 'job', 'monitor/job/index', 1, 1, 0, 0, 'job', 'admin', NULL, 'ry', NULL, '定时任务菜单');
INSERT INTO sys_permission VALUES (111, '数据监控', 'monitor:druid:list', 2, 3, 'druid', 'monitor/druid/index', 1, 1, 0, 0, 'druid', 'admin', NULL, 'ry', NULL, '数据监控菜单');
INSERT INTO sys_permission VALUES (112, '服务监控', 'monitor:server:list', 2, 4, 'server', 'monitor/server/index', 1, 1, 0, 0, 'server', 'admin', NULL, 'ry', NULL, '服务监控菜单');
INSERT INTO sys_permission VALUES (113, '表单构建', 'tool:build:list', 3, 1, 'build', 'tool/build/index', 1, 1, 0, 0, 'build', 'admin', NULL, 'ry', NULL, '表单构建菜单');
INSERT INTO sys_permission VALUES (114, '代码生成', 'tool:gen:list', 3, 2, 'gen', 'tool/gen/index', 1, 1, 0, 0, 'code', 'admin', NULL, 'ry', NULL, '代码生成菜单');
INSERT INTO sys_permission VALUES (115, '系统接口', 'tool:swagger:list', 3, 3, 'swagger', 'tool/swagger/index', 1, 1, 0, 0, 'swagger', 'admin', NULL, 'ry', NULL, '系统接口菜单');
INSERT INTO sys_permission VALUES (500, '操作日志', 'monitor:operlog:list', 108, 1, 'operlog', 'monitor/operlog/index', 1, 1, 0, 0, 'form', 'admin', NULL, 'ry', NULL, '操作日志菜单');
INSERT INTO sys_permission VALUES (501, '登录日志', 'monitor:logininfor:list', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 1, 0, 0, 'logininfor', 'admin', NULL, 'ry', NULL, '登录日志菜单');
INSERT INTO sys_permission VALUES (1001, '用户查询', 'system:user:query', 100, 1, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1002, '用户新增', 'system:user:add', 100, 2, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1003, '用户修改', 'system:user:edit', 100, 3, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1004, '用户删除', 'system:user:remove', 100, 4, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1005, '用户导出', 'system:user:export', 100, 5, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1006, '用户导入', 'system:user:import', 100, 6, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1007, '重置密码', 'system:user:resetPwd', 100, 7, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1008, '角色查询', 'system:role:query', 101, 1, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1009, '角色新增', 'system:role:add', 101, 2, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1010, '角色修改', 'system:role:edit', 101, 3, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1011, '角色删除', 'system:role:remove', 101, 4, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1012, '角色导出', 'system:role:export', 101, 5, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1013, '菜单查询', 'system:menu:query', 102, 1, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1014, '菜单新增', 'system:menu:add', 102, 2, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1015, '菜单修改', 'system:menu:edit', 102, 3, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1016, '菜单删除', 'system:menu:remove', 102, 4, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1017, '部门查询', 'system:dept:query', 103, 1, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1018, '部门新增', 'system:dept:add', 103, 2, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1019, '部门修改', 'system:dept:edit', 103, 3, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1020, '部门删除', 'system:dept:remove', 103, 4, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1021, '岗位查询', 'system:post:query', 104, 1, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1022, '岗位新增', 'system:post:add', 104, 2, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1023, '岗位修改', 'system:post:edit', 104, 3, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1024, '岗位删除', 'system:post:remove', 104, 4, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1025, '岗位导出', 'system:post:export', 104, 5, '', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1026, '字典查询', 'system:dict:query', 105, 1, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1027, '字典新增', 'system:dict:add', 105, 2, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1028, '字典修改', 'system:dict:edit', 105, 3, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1029, '字典删除', 'system:dict:remove', 105, 4, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1030, '字典导出', 'system:dict:export', 105, 5, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1031, '参数查询', 'system:config:query', 106, 1, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1032, '参数新增', 'system:config:add', 106, 2, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1033, '参数修改', 'system:config:edit', 106, 3, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1034, '参数删除', 'system:config:remove', 106, 4, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1035, '参数导出', 'system:config:export', 106, 5, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1036, '公告查询', 'system:notice:query', 107, 1, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1037, '公告新增', 'system:notice:add', 107, 2, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1038, '公告修改', 'system:notice:edit', 107, 3, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1039, '公告删除', 'system:notice:remove', 107, 4, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1040, '操作查询', 'monitor:operlog:query', 500, 1, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1041, '操作删除', 'monitor:operlog:remove', 500, 2, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1042, '日志导出', 'monitor:operlog:export', 500, 4, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1043, '登录查询', 'monitor:logininfor:query', 501, 1, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1044, '登录删除', 'monitor:logininfor:remove', 501, 2, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1045, '日志导出', 'monitor:logininfor:export', 501, 3, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1046, '在线查询', 'monitor:online:query', 109, 1, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1047, '批量强退', 'monitor:online:batchLogout', 109, 2, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1048, '单条强退', 'monitor:online:forceLogout', 109, 3, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1049, '任务查询', 'monitor:job:query', 110, 1, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1050, '任务新增', 'monitor:job:add', 110, 2, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1051, '任务修改', 'monitor:job:edit', 110, 3, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1052, '任务删除', 'monitor:job:remove', 110, 4, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1053, '状态修改', 'monitor:job:changeStatus', 110, 5, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1054, '任务导出', 'monitor:job:export', 110, 7, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1055, '生成查询', 'tool:gen:query', 114, 1, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1056, '生成修改', 'tool:gen:edit', 114, 2, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1057, '生成删除', 'tool:gen:remove', 114, 3, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1058, '导入代码', 'tool:gen:import', 114, 2, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1059, '预览代码', 'tool:gen:preview', 114, 4, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
INSERT INTO sys_permission VALUES (1060, '生成代码', 'tool:gen:code', 114, 5, '#', '', 1, 2, 0, 0, '#', 'admin', NULL, 'ry', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role (
  id bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  role_name varchar(30) NOT NULL COMMENT '角色名称',
  role_key varchar(100) NOT NULL COMMENT '角色权限字符串',
  sorted int(4) NOT NULL COMMENT '显示顺序',
  data_scope int(4) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  deleted tinyint(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  create_by varchar(64) DEFAULT '' COMMENT '创建者',
  create_time datetime DEFAULT NULL COMMENT '创建时间',
  update_by varchar(64) DEFAULT '' COMMENT '更新者',
  update_time datetime DEFAULT NULL COMMENT '更新时间',
  remark varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (id) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO sys_role VALUES (1, '管理员', 'admin', 1, 1, 0, 'admin', NULL, 'ry', NULL, '管理员');
INSERT INTO sys_role VALUES (2, '普通角色', 'common', 2, 2, 0, 'admin', NULL, 'ry', NULL, '普通角色');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_perms
-- ----------------------------
DROP TABLE IF EXISTS sys_role_perms;
CREATE TABLE sys_role_perms (
  role_id bigint(20) NOT NULL COMMENT '角色ID',
  menu_id bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (role_id,menu_id) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_perms
-- ----------------------------
BEGIN;
INSERT INTO sys_role_perms VALUES (2, 1);
INSERT INTO sys_role_perms VALUES (2, 2);
INSERT INTO sys_role_perms VALUES (2, 3);
INSERT INTO sys_role_perms VALUES (2, 4);
INSERT INTO sys_role_perms VALUES (2, 100);
INSERT INTO sys_role_perms VALUES (2, 101);
INSERT INTO sys_role_perms VALUES (2, 102);
INSERT INTO sys_role_perms VALUES (2, 103);
INSERT INTO sys_role_perms VALUES (2, 104);
INSERT INTO sys_role_perms VALUES (2, 105);
INSERT INTO sys_role_perms VALUES (2, 106);
INSERT INTO sys_role_perms VALUES (2, 107);
INSERT INTO sys_role_perms VALUES (2, 108);
INSERT INTO sys_role_perms VALUES (2, 109);
INSERT INTO sys_role_perms VALUES (2, 110);
INSERT INTO sys_role_perms VALUES (2, 111);
INSERT INTO sys_role_perms VALUES (2, 112);
INSERT INTO sys_role_perms VALUES (2, 113);
INSERT INTO sys_role_perms VALUES (2, 114);
INSERT INTO sys_role_perms VALUES (2, 115);
INSERT INTO sys_role_perms VALUES (2, 500);
INSERT INTO sys_role_perms VALUES (2, 501);
INSERT INTO sys_role_perms VALUES (2, 1000);
INSERT INTO sys_role_perms VALUES (2, 1001);
INSERT INTO sys_role_perms VALUES (2, 1002);
INSERT INTO sys_role_perms VALUES (2, 1003);
INSERT INTO sys_role_perms VALUES (2, 1004);
INSERT INTO sys_role_perms VALUES (2, 1005);
INSERT INTO sys_role_perms VALUES (2, 1006);
INSERT INTO sys_role_perms VALUES (2, 1007);
INSERT INTO sys_role_perms VALUES (2, 1008);
INSERT INTO sys_role_perms VALUES (2, 1009);
INSERT INTO sys_role_perms VALUES (2, 1010);
INSERT INTO sys_role_perms VALUES (2, 1011);
INSERT INTO sys_role_perms VALUES (2, 1012);
INSERT INTO sys_role_perms VALUES (2, 1013);
INSERT INTO sys_role_perms VALUES (2, 1014);
INSERT INTO sys_role_perms VALUES (2, 1015);
INSERT INTO sys_role_perms VALUES (2, 1016);
INSERT INTO sys_role_perms VALUES (2, 1017);
INSERT INTO sys_role_perms VALUES (2, 1018);
INSERT INTO sys_role_perms VALUES (2, 1019);
INSERT INTO sys_role_perms VALUES (2, 1020);
INSERT INTO sys_role_perms VALUES (2, 1021);
INSERT INTO sys_role_perms VALUES (2, 1022);
INSERT INTO sys_role_perms VALUES (2, 1023);
INSERT INTO sys_role_perms VALUES (2, 1024);
INSERT INTO sys_role_perms VALUES (2, 1025);
INSERT INTO sys_role_perms VALUES (2, 1026);
INSERT INTO sys_role_perms VALUES (2, 1027);
INSERT INTO sys_role_perms VALUES (2, 1028);
INSERT INTO sys_role_perms VALUES (2, 1029);
INSERT INTO sys_role_perms VALUES (2, 1030);
INSERT INTO sys_role_perms VALUES (2, 1031);
INSERT INTO sys_role_perms VALUES (2, 1032);
INSERT INTO sys_role_perms VALUES (2, 1033);
INSERT INTO sys_role_perms VALUES (2, 1034);
INSERT INTO sys_role_perms VALUES (2, 1035);
INSERT INTO sys_role_perms VALUES (2, 1036);
INSERT INTO sys_role_perms VALUES (2, 1037);
INSERT INTO sys_role_perms VALUES (2, 1038);
INSERT INTO sys_role_perms VALUES (2, 1039);
INSERT INTO sys_role_perms VALUES (2, 1040);
INSERT INTO sys_role_perms VALUES (2, 1041);
INSERT INTO sys_role_perms VALUES (2, 1042);
INSERT INTO sys_role_perms VALUES (2, 1043);
INSERT INTO sys_role_perms VALUES (2, 1044);
INSERT INTO sys_role_perms VALUES (2, 1045);
INSERT INTO sys_role_perms VALUES (2, 1046);
INSERT INTO sys_role_perms VALUES (2, 1047);
INSERT INTO sys_role_perms VALUES (2, 1048);
INSERT INTO sys_role_perms VALUES (2, 1049);
INSERT INTO sys_role_perms VALUES (2, 1050);
INSERT INTO sys_role_perms VALUES (2, 1051);
INSERT INTO sys_role_perms VALUES (2, 1052);
INSERT INTO sys_role_perms VALUES (2, 1053);
INSERT INTO sys_role_perms VALUES (2, 1054);
INSERT INTO sys_role_perms VALUES (2, 1055);
INSERT INTO sys_role_perms VALUES (2, 1056);
INSERT INTO sys_role_perms VALUES (2, 1057);
INSERT INTO sys_role_perms VALUES (2, 1058);
INSERT INTO sys_role_perms VALUES (2, 1059);
INSERT INTO sys_role_perms VALUES (2, 1060);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
  id bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  dept_id bigint(20) DEFAULT NULL COMMENT '部门ID',
  user_name varchar(30) NOT NULL COMMENT '用户账号',
  nick_name varchar(30) NOT NULL COMMENT '用户昵称',
  user_type tinyint(2) DEFAULT '0' COMMENT '用户类型 (0系统用户）',
  email varchar(50) DEFAULT '' COMMENT '用户邮箱',
  telephone varchar(11) DEFAULT '' COMMENT '手机号码',
  sex tinyint(2) DEFAULT '0' COMMENT '用户性别（0未知 1男 2女）',
  avatar varchar(100) DEFAULT '' COMMENT '头像地址',
  password varchar(100) DEFAULT '' COMMENT '密码',
  status tinyint(2) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  deleted tinyint(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  login_ip varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  login_time datetime DEFAULT NULL COMMENT '最后登陆时间',
  create_by varchar(64) DEFAULT '' COMMENT '创建者',
  create_time datetime DEFAULT NULL COMMENT '创建时间',
  update_by varchar(64) DEFAULT '' COMMENT '更新者',
  update_time datetime DEFAULT NULL COMMENT '更新时间',
  remark varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (id) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO sys_user VALUES (1, 103, 'admin', '若依', 0, 'ry@163.com', '15888888888', 1, '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', 0, 0, '127.0.0.1', NULL, 'admin', NULL, 'ry', NULL, '管理员');
INSERT INTO sys_user VALUES (2, 105, 'ry', '若依', 0, 'ry@qq.com', '15666666666', 1, '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', 0, 0, '127.0.0.1', NULL, 'admin', NULL, 'ry', NULL, '测试员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS sys_user_role;
CREATE TABLE sys_user_role (
  user_id bigint(20) NOT NULL COMMENT '用户ID',
  role_id bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (user_id,role_id) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO sys_user_role VALUES (1, 1);
INSERT INTO sys_user_role VALUES (2, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
