-- ----------------------------
-- 1、部门表
-- ----------------------------
drop table if exists sys_organ;
create table sys_organ (
                           organ_id           bigint(20)      not null auto_increment    comment '部门id',
                           parent_id         bigint(20)      default 0                  comment '父部门id',
                           parent_ids         varchar(50)     default ''                 comment '祖级列表[]包裹 ',
                           organ_name         varchar(30)     default ''                 comment '部门名称',
                           sorted         int(4)          default 0                  comment '显示顺序',
                           deleted          tinyint(1)         default 0               comment '删除标志（0代表存在 1代表删除）',
                           create_time 	    datetime                                   comment '创建时间',
                           update_time       datetime                                   comment '更新时间',
                           primary key (organ_id)
) engine=innodb auto_increment=200 comment = '部门表';

-- ----------------------------
-- 初始化-部门表数据
-- ----------------------------
insert into sys_organ values(100,  0,   '[0]',          '若依科技',   0, 0,'2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_organ values(101,  100, '[0],[100]',      '深圳总公司', 1, 0,'2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_organ values(102,  100, '[0],[100]',      '长沙分公司', 2, 0,'2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_organ values(103,  101, '[0],[100],[101]',  '研发部门',   1, 0,'2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_organ values(104,  101, '[0],[100],[101]',  '市场部门',   2, 0,'2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_organ values(105,  101, '[0],[100],[101]',  '测试部门',   3, 0,'2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_organ values(106,  101, '[0],[100],[101]',  '财务部门',   4, 0,'2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_organ values(107,  101, '[0],[100],[101]',  '运维部门',   5, 0,'2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_organ values(108,  102, '[0],[100],[102]',  '市场部门',   1, 0,'2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_organ values(109,  102, '[0],[100],[102]',  '财务部门',   2, 0,'2018-03-16 11:33:00','2018-03-16 11:33:00');


-- ----------------------------
-- 2、用户信息表
-- ----------------------------
drop table if exists sys_user;
create table sys_user (
                          user_id           bigint(20)      not null auto_increment    comment '用户ID',
                          organ_id           bigint(20)      default null               comment '部门ID',
                          role_id   bigint(20) not null comment '角色ID',
                          user_name         varchar(30)     not null                   comment '用户账号',
                          nick_name         varchar(30)     not null                   comment '用户昵称',
                          email             varchar(50)     default ''                 comment '用户邮箱',
                          phone       varchar(11)     default ''                 comment '手机号码',
                          avatar            varchar(100)    default ''                 comment '头像地址',
                          password          varchar(100)    default ''                 comment '密码',
                          status            tinyint(1)         default 0                comment '帐号状态（0正常 1停用）',
                          deleted          tinyint(1)         default 0                comment '删除标志（0代表存在 2代表删除）',
                          create_time       datetime                                   comment '创建时间',
                          update_time       datetime                                   comment '更新时间',
                          remark            varchar(500)    default null               comment '备注',
                          primary key (user_id)
) engine=innodb auto_increment=100 comment = '用户信息表';

-- ----------------------------
-- 初始化-用户信息表数据
-- ----------------------------
insert into sys_user values(1,  103, 1, 'admin', '若依', 'ry@163.com', '15888888888', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2',0, 0,'2018-03-16 11:33:00','2018-03-16 11:33:00', '管理员');
insert into sys_user values(2,  105, 2, 'ry',    '若依', 'ry@qq.com',  '15666666666', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2',0, 0,'2018-03-16 11:33:00','2018-03-16 11:33:00', '测试员');



-- ----------------------------
-- 4、角色信息表
-- ----------------------------
drop table if exists sys_role;
create table sys_role (
                          role_id           bigint(20)      not null auto_increment    comment '角色ID',
                          role_name         varchar(30)     not null                   comment '角色名称',
                          role_key          varchar(100)    not null                   comment '角色权限字符串',
                          sorted         int(4)          not null                   comment '显示顺序',
                          data_scope        tinyint(1)         default 1                comment '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
                          deleted          tinyint(1)         default 0                comment '删除标志（0代表存在 1代表删除）',
                          create_time       datetime                                   comment '创建时间',
                          update_time       datetime                                   comment '更新时间',
                          primary key (role_id)
) engine=innodb auto_increment=100 comment = '角色信息表';

-- ----------------------------
-- 初始化-角色信息表数据
-- ----------------------------
insert into sys_role values(1, '管理员',   'admin',  1, 1, 0,'2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_role values(2, '普通角色', 'common', 2, 2, 0,'2018-03-16 11:33:00','2018-03-16 11:33:00');


-- ----------------------------
-- 5、菜单权限表
-- ----------------------------
drop table if exists sys_perms;
create table sys_perms (
                          perms_id           bigint(20)      not null auto_increment    comment '菜单ID',
                          perms_name         varchar(50)     not null                   comment '菜单名称',
                          parent_id         bigint(20)      default 0                  comment '父菜单ID',
                          sorted         int(4)          default 0                  comment '显示顺序',
                          path              varchar(200)    default ''                 comment '路由地址',
                          component         varchar(255)    default null               comment '组件路径',
                          is_frame          int(1)          default 1                  comment '是否为外链（0是 1否）',
                          perms_type         char(1)         default ''                 comment '菜单类型（M目录 C菜单 F按钮）',
                          visible           char(1)         default 0                  comment '菜单状态（0显示 1隐藏）',
                          deleted            char(1)         default 0                  comment '菜单状态（0正常 1停用）',
                          perms             varchar(100)    default null               comment '权限标识',
                          icon              varchar(100)    default '#'                comment '菜单图标',
                          create_by         varchar(64)     default ''                 comment '创建者',
                          update_by         varchar(64)     default ''                 comment '更新者',
                          primary key (perms_id)
) engine=innodb auto_increment=2000 comment = '菜单权限表';

-- ----------------------------
-- 初始化-菜单信息表数据
-- ----------------------------
-- 一级菜单
insert into sys_perms values('1', '系统管理', '0', '1', 'system',           null,   1, 'M', '0', '0', '', 'system',   '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('2', '系统监控', '0', '2', 'monitor',          null,   1, 'M', '0', '0', '', 'monitor','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('3', '系统工具', '0', '3', 'tool',             null,   1, 'M', '0', '0', '', 'tool',     '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('4', '若依官网', '0', '4', 'http://ruoyi.vip', null ,  0, 'M', '0', '0', '', 'guide',    '2018-03-16 11:33:00','2018-03-16 11:33:00');
-- 二级菜单
insert into sys_perms values('100',  '用户管理', '1',   '1', 'user',       'system/user/index',        1, 'C', '0', '0', 'system:user:list',        'user',          '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('101',  '角色管理', '1',   '2', 'role',       'system/role/index',        1, 'C', '0', '0', 'system:role:list',        'peoples',       '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('102',  '菜单管理', '1',   '3', 'menu',       'system/menu/index',        1, 'C', '0', '0', 'system:menu:list',        'tree-table',    '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('103',  '部门管理', '1',   '4', 'organ',       'system/organ/index',        1, 'C', '0', '0', 'system:organ:list',        'tree',          '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('104',  '岗位管理', '1',   '5', 'post',       'system/post/index',        1, 'C', '0', '0', 'system:post:list',        'post',          '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('105',  '字典管理', '1',   '6', 'dict',       'system/dict/index',        1, 'C', '0', '0', 'system:dict:list',        'dict',          '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('106',  '参数设置', '1',   '7', 'config',     'system/config/index',      1, 'C', '0', '0', 'system:config:list',      'edit',          '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('107',  '通知公告', '1',   '8', 'notice',     'system/notice/index',      1, 'C', '0', '0', 'system:notice:list',      'message',       '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('108',  '日志管理', '1',   '9', 'log',        'system/log/index',         1, 'M', '0', '0', '',                        'log',           '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('109',  '在线用户', '2',   '1', 'online',     'monitor/online/index',     1, 'C', '0', '0', 'monitor:online:list',     'online',        '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('110',  '定时任务', '2',   '2', 'job',        'monitor/job/index',        1, 'C', '0', '0', 'monitor:job:list',        'job',           '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('111',  '数据监控', '2',   '3', 'druid',      'monitor/druid/index',      1, 'C', '0', '0', 'monitor:druid:list',      'druid',         '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('112',  '服务监控', '2',   '4', 'server',     'monitor/server/index',     1, 'C', '0', '0', 'monitor:server:list',     'server',        '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('113',  '表单构建', '3',   '1', 'build',      'tool/build/index',         1 ,'C', '0', '0', 'tool:build:list',         'build',         '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('114',  '代码生成', '3',   '2', 'gen',        'tool/gen/index',           1, 'C', '0', '0', 'tool:gen:list',           'code',          '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('115',  '系统接口', '3',   '3', 'swagger',    'tool/swagger/index',       1, 'C', '0', '0', 'tool:swagger:list',       'swagger',       '2018-03-16 11:33:00','2018-03-16 11:33:00');
-- 三级菜单
insert into sys_perms values('500',  '操作日志', '108', '1', 'operlog',    'monitor/operlog/index',    1, 'C', '0', '0', 'monitor:operlog:list',    'form',          '2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('501',  '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', 1, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor',    '2018-03-16 11:33:00','2018-03-16 11:33:00');
-- 用户管理按钮
insert into sys_perms values('1001', '用户查询', '100', '1',  '','', 1, 'F', '0', '0', 'system:user:query',          '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1002', '用户新增', '100', '2',  '', '', 1, 'F', '0', '0', 'system:user:add',            '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1003', '用户修改', '100', '3',  '', '', 1, 'F', '0', '0', 'system:user:edit',           '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1004', '用户删除', '100', '4',  '', '', 1, 'F', '0', '0', 'system:user:remove',         '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1005', '用户导出', '100', '5',  '', '', 1, 'F', '0', '0', 'system:user:export',         '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1006', '用户导入', '100', '6',  '', '', 1, 'F', '0', '0', 'system:user:import',         '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1007', '重置密码', '100', '7',  '', '', 1, 'F', '0', '0', 'system:user:resetPwd',       '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
-- 角色管理按钮,
insert into sys_perms values('1008', '角色查询', '101', '1',  '', '', 1, 'F', '0', '0', 'system:role:query',          '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1009', '角色新增', '101', '2',  '', '', 1, 'F', '0', '0', 'system:role:add',            '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1010', '角色修改', '101', '3',  '', '', 1, 'F', '0', '0', 'system:role:edit',           '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1011', '角色删除', '101', '4',  '', '', 1, 'F', '0', '0', 'system:role:remove',         '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1012', '角色导出', '101', '5',  '', '', 1, 'F', '0', '0', 'system:role:export',         '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
-- 菜单管理按钮,
insert into sys_perms values('1013', '菜单查询', '102', '1',  '', '', 1, 'F', '0', '0', 'system:menu:query',          '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1014', '菜单新增', '102', '2',  '', '', 1, 'F', '0', '0', 'system:menu:add',            '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1015', '菜单修改', '102', '3',  '', '', 1, 'F', '0', '0', 'system:menu:edit',           '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1016', '菜单删除', '102', '4',  '', '', 1, 'F', '0', '0', 'system:menu:remove',         '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
-- 部门管理按钮
insert into sys_perms values('1017', '部门查询', '103', '1',  '', '', 1, 'F', '0', '0', 'system:organ:query',          '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1018', '部门新增', '103', '2',  '', '', 1, 'F', '0', '0', 'system:organ:add',            '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1019', '部门修改', '103', '3',  '', '', 1, 'F', '0', '0', 'system:organ:edit',           '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1020', '部门删除', '103', '4',  '', '', 1, 'F', '0', '0', 'system:organ:remove',         '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
-- 岗位管理按钮
insert into sys_perms values('1021', '岗位查询', '104', '1',  '', '', 1, 'F', '0', '0', 'system:post:query',          '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1022', '岗位新增', '104', '2',  '', '', 1, 'F', '0', '0', 'system:post:add',            '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1023', '岗位修改', '104', '3',  '', '', 1, 'F', '0', '0', 'system:post:edit',           '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1024', '岗位删除', '104', '4',  '', '', 1, 'F', '0', '0', 'system:post:remove',         '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1025', '岗位导出', '104', '5',  '', '', 1, 'F', '0', '0', 'system:post:export',         '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
-- 字典管理按钮
insert into sys_perms values('1026', '字典查询', '105', '1', '#', '', 1, 'F', '0', '0', 'system:dict:query',          '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1027', '字典新增', '105', '2', '#', '', 1, 'F', '0', '0', 'system:dict:add',            '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1028', '字典修改', '105', '3', '#', '', 1, 'F', '0', '0', 'system:dict:edit',           '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1029', '字典删除', '105', '4', '#', '', 1, 'F', '0', '0', 'system:dict:remove',         '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1030', '字典导出', '105', '5', '#', '', 1, 'F', '0', '0', 'system:dict:export',         '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
-- 参数设置按钮,
insert into sys_perms values('1031', '参数查询', '106', '1', '#', '', 1, 'F', '0', '0', 'system:config:query',        '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1032', '参数新增', '106', '2', '#', '', 1, 'F', '0', '0', 'system:config:add',          '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1033', '参数修改', '106', '3', '#', '', 1, 'F', '0', '0', 'system:config:edit',         '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1034', '参数删除', '106', '4', '#', '', 1, 'F', '0', '0', 'system:config:remove',       '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1035', '参数导出', '106', '5', '#', '', 1, 'F', '0', '0', 'system:config:export',       '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
-- 通知公告按钮,
insert into sys_perms values('1036', '公告查询', '107', '1', '#', '', 1, 'F', '0', '0', 'system:notice:query',        '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1037', '公告新增', '107', '2', '#', '', 1, 'F', '0', '0', 'system:notice:add',          '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1038', '公告修改', '107', '3', '#', '', 1, 'F', '0', '0', 'system:notice:edit',         '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1039', '公告删除', '107', '4', '#', '', 1, 'F', '0', '0', 'system:notice:remove',       '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
-- 操作日志按钮,
insert into sys_perms values('1040', '操作查询', '500', '1', '#', '', 1, 'F', '0', '0', 'monitor:operlog:query',      '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1041', '操作删除', '500', '2', '#', '', 1, 'F', '0', '0', 'monitor:operlog:remove',     '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1042', '日志导出', '500', '4', '#', '', 1, 'F', '0', '0', 'monitor:operlog:export',     '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
-- 登录日志按钮,
insert into sys_perms values('1043', '登录查询', '501', '1', '#', '', 1, 'F', '0', '0', 'monitor:logininfor:query',   '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1044', '登录删除', '501', '2', '#', '', 1, 'F', '0', '0', 'monitor:logininfor:remove',  '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1045', '日志导出', '501', '3', '#', '', 1, 'F', '0', '0', 'monitor:logininfor:export',  '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
-- 在线用户按钮,
insert into sys_perms values('1046', '在线查询', '109', '1', '#', '', 1, 'F', '0', '0', 'monitor:online:query',       '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1047', '批量强退', '109', '2', '#', '', 1, 'F', '0', '0', 'monitor:online:batchLogout', '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1048', '单条强退', '109', '3', '#', '', 1, 'F', '0', '0', 'monitor:online:forceLogout', '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
-- 定时任务按钮,
insert into sys_perms values('1049', '任务查询', '110', '1', '#', '', 1, 'F', '0', '0', 'monitor:job:query',          '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1050', '任务新增', '110', '2', '#', '', 1, 'F', '0', '0', 'monitor:job:add',            '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1051', '任务修改', '110', '3', '#', '', 1, 'F', '0', '0', 'monitor:job:edit',           '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1052', '任务删除', '110', '4', '#', '', 1, 'F', '0', '0', 'monitor:job:remove',         '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1053', '状态修改', '110', '5', '#', '', 1, 'F', '0', '0', 'monitor:job:changeStatus',   '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1054', '任务导出', '110', '7', '#', '', 1, 'F', '0', '0', 'monitor:job:export',         '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
-- 代码生成按钮,
insert into sys_perms values('1055', '生成查询', '114', '1', '#', '', 1, 'F', '0', '0', 'tool:gen:query',             '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1056', '生成修改', '114', '2', '#', '', 1, 'F', '0', '0', 'tool:gen:edit',              '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1057', '生成删除', '114', '3', '#', '', 1, 'F', '0', '0', 'tool:gen:remove',            '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1058', '导入代码', '114', '2', '#', '', 1, 'F', '0', '0', 'tool:gen:import',            '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1059', '预览代码', '114', '4', '#', '', 1, 'F', '0', '0', 'tool:gen:preview',           '#','2018-03-16 11:33:00','2018-03-16 11:33:00');
insert into sys_perms values('1060', '生成代码', '114', '5', '#', '', 1, 'F', '0', '0', 'tool:gen:code',              '#','2018-03-16 11:33:00','2018-03-16 11:33:00');



-- ----------------------------
-- 7、角色和菜单关联表  角色1-N菜单
-- ----------------------------
drop table if exists sys_role_perms;
create table sys_role_perms (
                               role_id   bigint(20) not null comment '角色ID',
                               perms_id   bigint(20) not null comment '菜单ID',
                               primary key(role_id, perms_id)
) engine=innodb comment = '角色和菜单关联表';

-- ----------------------------
-- 初始化-角色和菜单关联表数据
-- ----------------------------
insert into sys_role_perms values ('2', '1');
insert into sys_role_perms values ('2', '2');
insert into sys_role_perms values ('2', '3');
insert into sys_role_perms values ('2', '4');
insert into sys_role_perms values ('2', '100');
insert into sys_role_perms values ('2', '101');
insert into sys_role_perms values ('2', '102');
insert into sys_role_perms values ('2', '103');
insert into sys_role_perms values ('2', '104');
insert into sys_role_perms values ('2', '105');
insert into sys_role_perms values ('2', '106');
insert into sys_role_perms values ('2', '107');
insert into sys_role_perms values ('2', '108');
insert into sys_role_perms values ('2', '109');
insert into sys_role_perms values ('2', '110');
insert into sys_role_perms values ('2', '111');
insert into sys_role_perms values ('2', '112');
insert into sys_role_perms values ('2', '113');
insert into sys_role_perms values ('2', '114');
insert into sys_role_perms values ('2', '115');
insert into sys_role_perms values ('2', '500');
insert into sys_role_perms values ('2', '501');
insert into sys_role_perms values ('2', '1000');
insert into sys_role_perms values ('2', '1001');
insert into sys_role_perms values ('2', '1002');
insert into sys_role_perms values ('2', '1003');
insert into sys_role_perms values ('2', '1004');
insert into sys_role_perms values ('2', '1005');
insert into sys_role_perms values ('2', '1006');
insert into sys_role_perms values ('2', '1007');
insert into sys_role_perms values ('2', '1008');
insert into sys_role_perms values ('2', '1009');
insert into sys_role_perms values ('2', '1010');
insert into sys_role_perms values ('2', '1011');
insert into sys_role_perms values ('2', '1012');
insert into sys_role_perms values ('2', '1013');
insert into sys_role_perms values ('2', '1014');
insert into sys_role_perms values ('2', '1015');
insert into sys_role_perms values ('2', '1016');
insert into sys_role_perms values ('2', '1017');
insert into sys_role_perms values ('2', '1018');
insert into sys_role_perms values ('2', '1019');
insert into sys_role_perms values ('2', '1020');
insert into sys_role_perms values ('2', '1021');
insert into sys_role_perms values ('2', '1022');
insert into sys_role_perms values ('2', '1023');
insert into sys_role_perms values ('2', '1024');
insert into sys_role_perms values ('2', '1025');
insert into sys_role_perms values ('2', '1026');
insert into sys_role_perms values ('2', '1027');
insert into sys_role_perms values ('2', '1028');
insert into sys_role_perms values ('2', '1029');
insert into sys_role_perms values ('2', '1030');
insert into sys_role_perms values ('2', '1031');
insert into sys_role_perms values ('2', '1032');
insert into sys_role_perms values ('2', '1033');
insert into sys_role_perms values ('2', '1034');
insert into sys_role_perms values ('2', '1035');
insert into sys_role_perms values ('2', '1036');
insert into sys_role_perms values ('2', '1037');
insert into sys_role_perms values ('2', '1038');
insert into sys_role_perms values ('2', '1039');
insert into sys_role_perms values ('2', '1040');
insert into sys_role_perms values ('2', '1041');
insert into sys_role_perms values ('2', '1042');
insert into sys_role_perms values ('2', '1043');
insert into sys_role_perms values ('2', '1044');
insert into sys_role_perms values ('2', '1045');
insert into sys_role_perms values ('2', '1046');
insert into sys_role_perms values ('2', '1047');
insert into sys_role_perms values ('2', '1048');
insert into sys_role_perms values ('2', '1049');
insert into sys_role_perms values ('2', '1050');
insert into sys_role_perms values ('2', '1051');
insert into sys_role_perms values ('2', '1052');
insert into sys_role_perms values ('2', '1053');
insert into sys_role_perms values ('2', '1054');
insert into sys_role_perms values ('2', '1055');
insert into sys_role_perms values ('2', '1056');
insert into sys_role_perms values ('2', '1057');
insert into sys_role_perms values ('2', '1058');
insert into sys_role_perms values ('2', '1059');
insert into sys_role_perms values ('2', '1060');



