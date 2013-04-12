-- --------------
-- 0用户访问记录表
-- --------------
drop table if exist Record;
create table Record
(
 	ID int(4) not null primary key,
 	UserID int(4) not null,
 	LoginDate timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	LoginTime timestamp  not null 
)engine=innodb default charset=utf8 collate=utf8_bin;
-- --------------
-- 1工作量化表
-- --------------
drop table if exist Quantify;
create table Quantify
(
 	ID int(4) not null primary key auto_increment,
 	Name varchar(50) not null
)engine=innodb default charset=utf8 collate=utf8_bin;

-- ---------------------
-- 2批次表
-- ---------------------
drop table if exist LabManageBatcher;
create table LabManageBatcher
(
	ID int(4) not null primary key auto_increment,
	Year varchar(4) not null,
	Semester varchar(4) not null,
	Status char(1) not null
 )engine=innodb default charset=utf8 collate=utf8_bin;
 
-- -----------------------
-- 3量化信息表
-- -------------------------
drop table if exist QuantizationInfo;
create table QuantizationInfo
(
	ID int(4) not null primary key auto_increment,
	QuantifyID int(4) not null,
	Standard int(4) not null,
	Unit varchar(20) not null,
	BatcherID int(4) not null,
	constraint FKQI_Q foreign key(QuantifyID) references Quantify(ID),
	constraint FKQI_B foreign key(BatcherID) references LabManageBatcher(ID)
)engine=innodb default charset=utf8 collate=utf8_bin;
-- -----
--- 4管理员表
--- ----------
drop table if exist User;
create table User
(
	ID int(4) not null primary key auto_increment,
	UserName varchar(20) not null,
	Password varchar(20) not null,
	Role char(1) not null default 1,-- 管理员分管理员之管理员与一般管理员（0为总管理员，1为实验室管理员）
	Name varchar(50) not null,-- 真实的名字
	WorkNum varchar(20) not null,-- 工作号
	Type char(1) not null,-- 类型 半坐班等 
	Status char(1) not null-- 管理员的状态信息（0为启用，1为停用）
)engine=innodb default charset=utf8 collate=utf8_bin;
-- --------------
-- 5实验室信息表
-- -----------------
drop table if exist LabInfo;
create table LabInfo
(
	ID int(4) not null primary key auto_increment,
	LabName varchar(50) not null,
	Doorplate varchar(50) not null,-- 实验室的门牌
	LabIntro text not null,-- 实验室介绍
	LabArea int(4) not null,-- 实验室的面积
	Type char(1) not null -- 1机房，2机房实验室，3纯实验室
)engine=innodb default charset=utf8 collate=utf8_bin;
-- ---------------------
-- 6实验室与管理员多对多关系
-- ---------------------
drop table if exist LabToAdmin;
create table LabToAdmin
(
	ID int(4) not null primary key auto_increment,
	LabID int(4) not null,
	AdminID int(4) not null,
	BatcherID int(4) not null,
	constraint FKLTA_Lab foreign key(LabID) references LabInfo(ID),
	constraint FKLTA_Admin foreign key(AdminID) references User(ID),
	constraint FKLTA_Batcher foreign key(BatcheriD) references LabManageBatcher(ID) 
)engine=innodb default charset=utf8 collate=utf8_bin;

-- --------------
-- 7实验课教师
-- ----------
drop table if exist CourseTeacher;
create table CourseTeacher
(
	ID int(4) not null primary key auto_increment,
	TeacherName varchar(20) not null
)engine=innodb default charset=utf8 collate=utf8_bin;

-- -----------------
-- 8实验课
-- ------------------
drop table if exist Course;
create table Course
(
	ID int(4) not null primary key auto_increment,
	StudentClass varchar(50) not null,
	TeacherID int(4) not null,
	StudyTime varchar(10) not null, -- 学时
	Type char(1) not null,-- 1设备，2软件
	BatcherID int(4) not null,
	constraint FKC_Batcher foreign key(BatcherID) references LabManageBatcher(ID),
	constraint FKC_CT foreign key(TeacherID) references CourseTeacher(ID)
)engine=innodb default charset=utf8 collate=utf8_bin;

-- ---------------------
-- 9实验课安排
-- ---------------------
drop table if exist LabToCourse;
create table LabToCourse
(
	ID int(4) not null primary key auto_increment,
	CourseID int(4) not null,
	LabID int(4) not null,
	BatcherID int(4) not null,
	constraint FKLTC_CID foreign key(CourseID) references Course(ID),
	constraint FKLTC_BID foreign key(BatcherID) references LabManageBatcher(ID),
	constraint FKLTC_LID foreign key(LabID) references LabInfo(ID)
)engine=innodb default charset=utf8 collate=utf8_bin;
-- --------------------------
-- 10实验室常规工作量
-- ------------------------
drop table if exist LabRegularWorkload;
create table LabRegularWorkload
(
	ID int(4) not null primary key auto_increment,
	LabID int(4) not null,
	QuantizationID int(4) not null,
	BatcherID int(4) not null,
	Description text not null,
	constraint FKLRW_LID foreign key(LabID) references LabInfo(ID),
	constraint FKLRW_QID foreign key(QuantizationID) references QuantizationInfo(ID),
	constraint FKLRW_BID foreign key(BatcherID) references LabManageBatcher(ID)
)engine=innodb default charset=utf8 collate=utf8_bin;
-- ----------------------
-- 11实验室开放工作量
-- ------------------------
drop table if exist LabOpenWorkload;
create table LabOpenWorkload
(
	ID int(4) not null primary key auto_increment,
	QuantizationID int(4) not null,
	LabID int(4) not null,
	OpenContent text not null,
	AttendStudentNum int(4) not null,
	OpenTime datetime not null,
	BatcherID int(4) not null,
	constraint FKLOW_QID foreign key(QuantizationID) references QuantizationInfo(ID),
	constraint FKLOW_LID foreign key(LabID) references LabInfo(ID),
	constraint FKLOW_BID foreign key(BatcherID) references LabManageBatcher(ID)
)engine=innodb default charset=utf8 collate=utf8_bin;

-- ------------------------
-- 12设备借用工作量
-- -----------------------
drop table if exist EquipBorrowWorkload;
create table EquipBorrowWorkload
(
	ID int(4) not null primary key auto_increment,
	Administrator int(4) not null,
	QuantizationID int(4) not null,
	EquipmentName varchar(50) not null,
	BorrowTime datetime not null,
	BatcherID int(4) not null,
	constraint FKEBW_Admin foreign key(Administrator) references User(ID),
	constraint FKEBW_QID foreign key(QuantizationID) references QuantizationInfo(ID),
	constraint FKEBW_BID foreign key(BatcherID) references LabManageBatcher(ID) 
)engine=innodb default charset=utf8 collate=utf8_bin;

-- ----------------------
-- 13设备维护工作量
-- -----------------------
drop table if exist EquipFixWorkload;
create table EquipFixWorkload
(
	ID int(4) not null primary key auto_increment,
	Administrator int(4) not null,
	QuantizationID int(4)  not null,
	BreakdownDesc text not null, -- 故障的描述信息
	FixType char(1)  not null default '1', -- 1自修，2外修
	BatcherID int(4) not null,
	Fixtime datetime not null,
	constraint FKEFW_Admin foreign key(Administrator) references User(ID),
	constraint FKEFW_QID foreign key(QuantizationID) references QuantizationInfo(ID),
	constraint FKEFW_BID foreign key(BatcherID) references LabManageBatcher(ID)
)engine=innodb default charset=utf8 collate=utf8_bin;

alter table user  add unique(UserName);
alter table LabRegularWorkload drop foreign key FKLRW_BID;
alter table LabRegularWorkload drop index FKLRW_BID;
alter table LabRegularWorkload drop foreign key FKLRW_LID;
alter table LabRegularWorkload drop index FKLRW_LID;
alter table LabRegularWorkload drop column BatcherID;
alter table LabRegularWorkload drop column LabID;
alter table LabRegularWorkload add column LabToAdminID int(4) not null;
alter table LabRegularWorkload add constraint FKLRW_LTAID foreign key(LabToAdminID) references LabToAdmin(ID);
alter table LabRegularWorkload add column SubmitTime timestamp not null default NOW();
alter table EquipBorrowWorkload add column BorrowMan varchar(30) not null;
alter table LabOpenWorkload drop FOREIGN KEY FKLOW_BID;
alter table LabOpenWorkload drop FOREIGN KEY FKLOW_LID;
alter table LabOpenWorkload drop index FKLOW_BID;
alter table LabOpenWorkload drop index FKLOW_LID;
alter table LabOpenWorkload drop column LabID;
alter table LabOpenWorkload drop column BatcherID;
alter table LabOpenWorkload add column LabToAdminID int(4) not null;
alter table LabOpenWorkload add constraint FKLOW_LTAID foreign key(LabToAdminID) references LabToAdmin(ID);
create table DutyWorkload
(
	ID int(4) not null primary key auto_increment,
	Administrator int(4) not null,
	QuantizationID int(4) not null,
	BatcherID int(4) not null,
	Times int(4) not null,
	Type char(1) not null default '1',
	Description text not null,
	constraint FKWK_UID foreign key(Administrator) references User(ID),
	constraint FKWK_QID foreign key(QuantizationID) references QuantizationInfo(ID),
	constraint FKWK_BID foreign key(BatcherID) references LabManageBatcher(ID)
)
-- ------------------------
-- 13实验室课程信息
-- -----------------------
drop table if exist CourseInfo;
create table CourseInfo
(
	courseID varchar(4) not null primary key,
	courseName varchar(50) not null,
	labName varchar(50) not null,
	teacherName varchar(50) not null,
	software not null,
	weektime varchar(4) not null, 
	
)engine=innodb default charset=utf8 collate=utf8_bin;
alter table Course add column LabID int(4) not null ;
alter table Course add constraint FK_LAB foreign key(LabID) references LabInfo(ID);
alter table Quantify add column Type char(2) not null default '0';
create view QuantizationInfoMix 
as
	select qui.ID,qui.QuantifyID,qui.Standard,qui.Unit,qui.BatcherID,qu.Name as QuantifyName,qu.Type as QuantifyType from QuantizationInfo as qui left join Quantify as qu on qui.QuantifyID=qu.ID;
alter table QuantizationInfo add constraint unique_batcher_quan unique(QuantifyID,BatcherID);
-- ----------------------------
-- 实验室的课程常规工作量
-- -----------------------------
create table LabCourseWorkload
(
	ID int(4) not null primary key auto_increment,
	LabToAdminID int(4) not null,
	QuantizationID int(4) not null,
	SubmitTime timestamp not null,
	CourseID int(4) not null,
	constraint FK_lcw_lta  foreign key(LabToAdminID) references LabToAdmin(ID),
	constraint FK_lcw_quaninfo  foreign key(QuantizationID) references QuantizationInfo(ID),
	constraint FK_lcw_course foreign key(CourseID) references Course(ID)
)engine=innodb default charset=utf8 collate=utf8_bin;
alter table LabCourseWorkload add constraint unqiue_lta_quan_course unique(LabToAdminID,QuantizationID,CourseID);
alter table LabRegularWorkload add constraint unqiue_lta_regular unique(LabToAdminID,QuantizationID);
alter table LabOpenWorkload add constraint unqiue_lta_open unique(LabToAdminID,QuantizationID);
alter table EquipBorrowWorkload add constraint unqiue_borrow_batcher unique(BatcherID,QuantizationID);
alter table EquipFixWorkload add constraint unqiue_fix_batcher unique(BatcherID,QuantizationID);
alter table DutyWorkload add constraint unqiue_duty_batcher unique(BatcherID,QuantizationID);
alter table DutyWorkload add column SubmitTime timestamp not null;