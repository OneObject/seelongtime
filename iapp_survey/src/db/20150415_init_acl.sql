INSERT INTO acl_resource(id,pid,name,weight) VALUES(0,-1,'资源权限树',0);  

INSERT INTO acl_resource(id,pid,name,weight) VALUES(100,0,'调研管理',100); 
INSERT INTO acl_resource(id,pid,name,weight) VALUES(110,100,'调研活动管理',110); 
INSERT INTO acl_resource(id,pid,name,weight) VALUES(120,100,'调研问卷管理',120); 

INSERT INTO acl_resource(id,pid,name,weight) VALUES(700,0,'系统管理',700);        
INSERT INTO acl_resource(id,pid,name,weight) VALUES(710,700,'用户管理',710);            
INSERT INTO acl_resource(id,pid,name,weight) VALUES(720,700,'用户组管理',720);        
INSERT INTO acl_resource(id,pid,name,weight) VALUES(730,700,'组织管理',730);        
INSERT INTO acl_resource(id,pid,name,weight) VALUES(740,700,'职级管理',740);        
INSERT INTO acl_resource(id,pid,name,weight) VALUES(750,700,'企业配置',750);            
INSERT INTO acl_resource(id,pid,name,weight) VALUES(100000,700,'权限管理',100000);
