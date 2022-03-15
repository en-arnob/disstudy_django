BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "account_account" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"email"	varchar(60) NOT NULL UNIQUE,
	"username"	varchar(30) NOT NULL UNIQUE,
	"classid"	varchar(10) NOT NULL,
	"date_joined"	datetime NOT NULL,
	"last_login"	datetime NOT NULL,
	"is_admin"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_superuser"	bool NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "account_account"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "app_discussion" (
	"id"	integer NOT NULL,
	"title"	varchar(100) NOT NULL,
	"post"	text NOT NULL,
	"date"	datetime NOT NULL,
	"author_id"	integer NOT NULL,
	"classcode"	varchar(10) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("author_id") REFERENCES "account_account"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "django_migrations" VALUES (1,'account','0001_initial','2020-06-25 16:31:32.548115');
INSERT INTO "django_migrations" VALUES (2,'contenttypes','0001_initial','2020-06-25 16:31:32.554523');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2020-06-25 16:31:32.559241');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2020-06-25 16:31:32.566337');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2020-06-25 16:31:32.573351');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2020-06-25 16:31:32.587118');
INSERT INTO "django_migrations" VALUES (7,'auth','0001_initial','2020-06-25 16:31:32.602461');
INSERT INTO "django_migrations" VALUES (8,'auth','0002_alter_permission_name_max_length','2020-06-25 16:31:32.612680');
INSERT INTO "django_migrations" VALUES (9,'auth','0003_alter_user_email_max_length','2020-06-25 16:31:32.619008');
INSERT INTO "django_migrations" VALUES (10,'auth','0004_alter_user_username_opts','2020-06-25 16:31:32.641513');
INSERT INTO "django_migrations" VALUES (11,'auth','0005_alter_user_last_login_null','2020-06-25 16:31:32.647413');
INSERT INTO "django_migrations" VALUES (12,'auth','0006_require_contenttypes_0002','2020-06-25 16:31:32.649525');
INSERT INTO "django_migrations" VALUES (13,'auth','0007_alter_validators_add_error_messages','2020-06-25 16:31:32.655426');
INSERT INTO "django_migrations" VALUES (14,'auth','0008_alter_user_username_max_length','2020-06-25 16:31:32.660998');
INSERT INTO "django_migrations" VALUES (15,'auth','0009_alter_user_last_name_max_length','2020-06-25 16:31:32.666645');
INSERT INTO "django_migrations" VALUES (16,'auth','0010_alter_group_name_max_length','2020-06-25 16:31:32.673371');
INSERT INTO "django_migrations" VALUES (17,'auth','0011_update_proxy_permissions','2020-06-25 16:31:32.681229');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2020-06-25 16:31:32.684656');
INSERT INTO "django_migrations" VALUES (19,'app','0001_initial','2020-06-25 18:34:39.815912');
INSERT INTO "django_migrations" VALUES (20,'app','0002_discussion_classcode','2020-10-16 19:03:11.627847');
INSERT INTO "django_migrations" VALUES (21,'auth','0012_alter_user_first_name_max_length','2020-10-16 19:03:11.635909');
INSERT INTO "django_migrations" VALUES (22,'app','0003_auto_20201016_2031','2020-10-16 20:31:45.006583');
INSERT INTO "django_migrations" VALUES (23,'app','0004_auto_20201016_2046','2020-10-16 20:46:57.612415');
INSERT INTO "account_account" VALUES (1,'pbkdf2_sha256$216000$aJgem6aM91Wm$0A6tTby1CB1IemMTUiPdgKgDjIWPIXuKNhD9HbEOc/I=','khalid_arnob@outlook.com','arnob','secfx','2020-06-25 16:33:10.018834','2020-10-16 21:27:55.624189',1,1,1,1);
INSERT INTO "account_account" VALUES (10,'pbkdf2_sha256$180000$Z9yrO8HXtvYH$CPYOFbAxoO9nKbky5CuxfgHCc7mU5mrfbNeiOVIujz8=','tahsin15-10624@diu.edu.bd','tasin','secfx','2020-06-27 20:32:38.205335','2020-06-27 20:32:44.561185',0,1,0,0);
INSERT INTO "account_account" VALUES (11,'pbkdf2_sha256$180000$IHhay8FIONnb$7pG0JlSFgFz2tl53Be4kmO5YGtzdGHr1r0vHjbVgT5U=','shakil@female.com','shakil','secf','2020-06-27 20:35:24.886790','2020-06-27 20:35:29.106954',0,1,0,0);
INSERT INTO "account_account" VALUES (12,'pbkdf2_sha256$180000$u4W6Y4IZbYz7$wXyQ0/Dep6qmSdWYHR9WSpQOs59Us9TOw3XB7QkN7wk=','lebu@female.com','lemon','secf','2020-06-27 20:38:05.429303','2020-06-27 20:39:37.430934',0,1,0,0);
INSERT INTO "account_account" VALUES (13,'pbkdf2_sha256$180000$XiycZ08S6DRm$ilbWhc3UMna0WmJw1BwEFDrV0gsMet08FrG02KnEs6c=','shuvo@female.com','arshuvo','secfx','2020-06-27 20:41:08.238170','2020-06-27 20:41:20.886541',0,1,0,0);
INSERT INTO "account_account" VALUES (14,'pbkdf2_sha256$216000$1MNQl2OfKUrq$lM/lYW+45r5dxC475UItqSk2CuYUKvJyC5jwRNk8LLs=','arnoob@xx.com','khalid_arnob','sec_f','2020-10-16 16:34:48.583082','2020-10-16 16:34:51.584203',0,1,0,0);
INSERT INTO "account_account" VALUES (15,'pbkdf2_sha256$216000$fO8ZV6p8AGky$9tPA9akH1UMvoFv+YL6quVl+PFpS2h4zeCxtS36Dd2E=','kala@sexy.com','taskin','secb','2020-10-16 21:27:18.218274','2020-10-16 21:29:13.542277',0,1,0,0);
INSERT INTO "django_admin_log" VALUES (1,'2020-06-25 18:36:33.753707','1','Version 2 Check | arnob','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (2,'2020-06-25 18:52:24.530485','2','horraaaayyyy | arnob','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (3,'2020-06-26 10:24:21.513816','3','Posted by NewUser | NewUser','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2020-06-26 10:25:25.355391','3','Posted by NewUser | NewUser','',7,1,3);
INSERT INTO "django_admin_log" VALUES (5,'2020-06-26 10:28:42.744131','4','Posted by tk47bd | tasin','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (6,'2020-06-26 10:29:04.928870','4','who cares | tasin','[{"changed": {"fields": ["Title"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (7,'2020-06-26 10:32:27.592989','4','lemon','',6,1,3);
INSERT INTO "django_admin_log" VALUES (8,'2020-06-26 10:38:03.435936','5','lemon','',6,1,3);
INSERT INTO "django_admin_log" VALUES (9,'2020-06-26 14:56:02.048045','5','Tomorrow Class off | arshuvo','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (10,'2020-06-27 20:28:41.735022','6','fegr | arnob','',7,1,3);
INSERT INTO "django_admin_log" VALUES (11,'2020-06-27 20:28:41.736905','5','Tomorrow Class off | arshuvo','',7,1,3);
INSERT INTO "django_admin_log" VALUES (12,'2020-06-27 20:28:41.739092','4','who cares | tasin','',7,1,3);
INSERT INTO "django_admin_log" VALUES (13,'2020-06-27 20:28:41.740739','2','horraaaayyyy | arnob','',7,1,3);
INSERT INTO "django_admin_log" VALUES (14,'2020-06-27 20:28:41.742173','1','Version 2 Check | arnob','',7,1,3);
INSERT INTO "django_admin_log" VALUES (15,'2020-06-27 20:31:27.194071','9','rafi','',6,1,3);
INSERT INTO "django_admin_log" VALUES (16,'2020-06-27 20:31:27.195661','8','lemon9','',6,1,3);
INSERT INTO "django_admin_log" VALUES (17,'2020-06-27 20:31:27.197015','7','arshuvo','',6,1,3);
INSERT INTO "django_admin_log" VALUES (18,'2020-06-27 20:31:27.198231','6','lebu','',6,1,3);
INSERT INTO "django_admin_log" VALUES (19,'2020-06-27 20:31:27.199669','3','tasin','',6,1,3);
INSERT INTO "django_admin_log" VALUES (20,'2020-06-27 20:31:27.201393','2','NewUser','',6,1,3);
INSERT INTO "django_admin_log" VALUES (21,'2020-06-27 20:46:24.552378','12','shuvo cr posting | arshuvo','',7,1,3);
INSERT INTO "django_admin_log" VALUES (22,'2020-06-27 20:46:24.553993','11','ami lebu | lemon','',7,1,3);
INSERT INTO "django_admin_log" VALUES (23,'2020-06-27 20:46:24.556153','10','Kagi lebu posting | lemon','',7,1,3);
INSERT INTO "django_admin_log" VALUES (24,'2020-06-27 20:46:24.557723','9','Hi I''m mota shakil | shakil','',7,1,3);
INSERT INTO "django_admin_log" VALUES (25,'2020-06-27 20:46:24.558948','8','Hey there | tasin','',7,1,3);
INSERT INTO "django_admin_log" VALUES (26,'2020-06-27 20:49:23.489957','13','OS: Last class note needed | tasin','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (27,'2020-06-27 20:51:32.645663','14','Class hobe na class hobe na | arshuvo','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (28,'2020-06-27 20:53:46.602522','15','Another test | shakil','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (29,'2020-06-27 20:54:00.995854','14','Class hobe na class hobe na | lemon','[{"changed": {"fields": ["Author"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (30,'2020-06-28 15:23:17.692075','16','Tomorrow Class off | arnob','',7,1,3);
INSERT INTO "django_admin_log" VALUES (31,'2020-10-16 19:09:26.492820','1','arnob','[{"changed": {"fields": ["Classid"]}}]',6,1,2);
INSERT INTO "django_admin_log" VALUES (32,'2020-10-16 20:15:06.755774','10','tasin','[{"changed": {"fields": ["Classid"]}}]',6,1,2);
INSERT INTO "django_admin_log" VALUES (33,'2020-10-16 20:22:40.932540','19','greh | arnob','',7,1,3);
INSERT INTO "django_admin_log" VALUES (34,'2020-10-16 20:22:40.935186','18','neww | arnob','',7,1,3);
INSERT INTO "django_admin_log" VALUES (35,'2020-10-16 20:22:40.936621','17','hello | khalid_arnob','',7,1,3);
INSERT INTO "django_admin_log" VALUES (36,'2020-10-16 20:22:40.937905','15','Another test | shakil','',7,1,3);
INSERT INTO "django_admin_log" VALUES (37,'2020-10-16 20:22:40.939285','14','Class hobe na class hobe na | lemon','',7,1,3);
INSERT INTO "django_admin_log" VALUES (38,'2020-10-16 20:22:40.941179','13','OS: Last class note needed | tasin','',7,1,3);
INSERT INTO "django_admin_log" VALUES (39,'2020-10-16 20:22:40.942455','7','Test 123 | arnob','',7,1,3);
INSERT INTO "django_admin_log" VALUES (40,'2020-10-16 20:23:40.230440','21','hello | tasin','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (41,'2020-10-16 20:23:54.148933','22','fyuu | shakil','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (42,'2020-10-16 20:40:30.949537','23','check | arshuvo','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (43,'2020-10-16 20:40:40.947027','13','arshuvo','[{"changed": {"fields": ["Classid"]}}]',6,1,2);
INSERT INTO "django_admin_log" VALUES (44,'2020-10-16 20:45:10.427657','1','arnob','[{"changed": {"fields": ["Classid"]}}]',6,1,2);
INSERT INTO "django_admin_log" VALUES (45,'2020-10-16 20:45:21.433495','20','hello | arnob','[{"changed": {"fields": ["Classid"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (46,'2020-10-16 21:24:21.827990','27','checccccck | tasin','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (47,'2020-10-16 21:28:38.478444','29','Good Night | shakil','[{"added": {}}]',7,1,1);
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (5,'sessions','session');
INSERT INTO "django_content_type" VALUES (6,'account','account');
INSERT INTO "django_content_type" VALUES (7,'app','discussion');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (14,4,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (15,4,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (16,4,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (17,5,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (18,5,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (19,5,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (20,5,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (21,6,'add_account','Can add account');
INSERT INTO "auth_permission" VALUES (22,6,'change_account','Can change account');
INSERT INTO "auth_permission" VALUES (23,6,'delete_account','Can delete account');
INSERT INTO "auth_permission" VALUES (24,6,'view_account','Can view account');
INSERT INTO "auth_permission" VALUES (25,7,'add_discussion','Can add discussion');
INSERT INTO "auth_permission" VALUES (26,7,'change_discussion','Can change discussion');
INSERT INTO "auth_permission" VALUES (27,7,'delete_discussion','Can delete discussion');
INSERT INTO "auth_permission" VALUES (28,7,'view_discussion','Can view discussion');
INSERT INTO "django_session" VALUES ('883oo8fp1uk9ml58qefu97jsntt7ar7h','NDIyMDI3OWRlYjE5ODA1Yjg4MTk5NjU1N2IxNGMxY2Q0N2EyMmM1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MjhlNDg5Njk2MmM2M2UyZTZhZDFmYWNmNDE1ZjczMTRmOGE0NmM1In0=','2020-07-10 10:16:09.952551');
INSERT INTO "django_session" VALUES ('5khbowa70tjqrizjotfexq9svb3hp4fc','.eJxVjDsOwjAQRO_iGlm2iX-U9JzB2vWucQA5UpxUiLuTSCmgG817M2-RYF1qWjvPaSRxEdqK02-JkJ_cdkIPaPdJ5qkt84hyV-RBu7xNxK_r4f4dVOh1W4dCYHNwJtjoUVnnlYKzARMZUSvNPIRIUAITQrRgfdGq0JaGgl478fkCCxU4bg:1kTXHl:z6NbZ_HVMrx5W6E_kr6xkAqr0zMt88Ldis4ud8zxxN4','2020-10-30 21:29:13.545162');
INSERT INTO "app_discussion" VALUES (20,'hello','deggrg','2020-10-16 20:23:15',1,'secfx');
INSERT INTO "app_discussion" VALUES (21,'hello','avfhtjt','2020-10-16 20:22:42',10,'secf');
INSERT INTO "app_discussion" VALUES (22,'fyuu','egregher','2020-10-16 20:23:45',11,'secf');
INSERT INTO "app_discussion" VALUES (23,'check','ewknkjgr','2020-10-16 20:40:17',13,'secfx');
INSERT INTO "app_discussion" VALUES (24,'greh','htdtygjg','2020-10-16 20:45:57.190567',1,'secfx');
INSERT INTO "app_discussion" VALUES (25,'hello','cghdhgv','2020-10-16 21:01:07.477782',1,'secfx');
INSERT INTO "app_discussion" VALUES (26,'vjhcfhgchj','mvjhvv','2020-10-16 21:02:42.924304',1,'secfx');
INSERT INTO "app_discussion" VALUES (27,'checccccck','mndvfmhdsg','2020-10-16 21:24:00',10,'secfx');
INSERT INTO "app_discussion" VALUES (28,'Hello B','Good Morning','2020-10-16 21:27:41.507572',15,'secb');
INSERT INTO "app_discussion" VALUES (29,'Good Night','fuck','2020-10-16 21:28:18',11,'secb');
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "app_discussion_author_id_2fe20617" ON "app_discussion" (
	"author_id"
);
COMMIT;
