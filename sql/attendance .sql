-- --------------
-- 0�û����ʼ�¼��
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
-- 1����������
-- --------------
drop table if exist Quantify;
create table Quantify
(
 	ID int(4) not null primary key auto_increment,
 	Name varchar(50) not null
)engine=innodb default charset=utf8 collate=utf8_bin;

-- ---------------------
-- 2���α�
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
-- 3������Ϣ��
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
--- 4����Ա��
--- ----------
drop table if exist User;
create table User
(
	ID int(4) not null primary key auto_increment,
	UserName varchar(20) not null,
	Password varchar(20) not null,
	Role char(1) not null default 1,-- ����Ա�ֹ���Ա֮����Ա��һ�����Ա��0Ϊ�ܹ���Ա��1Ϊʵ���ҹ���Ա��
	Name varchar(50) not null,-- ��ʵ������
	WorkNum varchar(20) not null,-- ������
	Type char(1) not null,-- ���� ������� 
	Status char(1) not null-- ����Ա��״̬��Ϣ��0Ϊ���ã�1Ϊͣ�ã�
)engine=innodb default charset=utf8 collate=utf8_bin;
-- --------------
-- 5ʵ������Ϣ��
-- -----------------
drop table if exist LabInfo;
create table LabInfo
(
	ID int(4) not null primary key auto_increment,
	LabName varchar(50) not null,
	Doorplate varchar(50) not null,-- ʵ���ҵ�����
	LabIntro text not null,-- ʵ���ҽ���
	LabArea int(4) not null,-- ʵ���ҵ����
	Type char(1) not null -- 1������2����ʵ���ң�3��ʵ����
)engine=innodb default charset=utf8 collate=utf8_bin;
-- ---------------------
-- 6ʵ���������Ա��Զ��ϵ
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
-- 7ʵ��ν�ʦ
-- ----------
drop table if exist CourseTeacher;
create table CourseTeacher
(
	ID int(4) not null primary key auto_increment,
	TeacherName varchar(20) not null
)engine=innodb default charset=utf8 collate=utf8_bin;

-- -----------------
-- 8ʵ���
-- ------------------
drop table if exist Course;
create table Course
(
	ID int(4) not null primary key auto_increment,
	StudentClass varchar(50) not null,
	TeacherID int(4) not null,
	StudyTime varchar(10) not null, -- ѧʱ
	Type char(1) not null,-- 1�豸��2���
	BatcherID int(4) not null,
	constraint FKC_Batcher foreign key(BatcherID) references LabManageBatcher(ID),
	constraint FKC_CT foreign key(TeacherID) references CourseTeacher(ID)
)engine=innodb default charset=utf8 collate=utf8_bin;

-- ---------------------
-- 9ʵ��ΰ���
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
-- 10ʵ���ҳ��湤����
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
-- 11ʵ���ҿ��Ź�����
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
-- 12�豸���ù�����
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
-- 13�豸ά��������
-- -----------------------
drop table if exist EquipFixWorkload;
create table EquipFixWorkload
(
	ID int(4) not null primary key auto_increment,
	Administrator int(4) not null,
	QuantizationID int(4)  not null,
	BreakdownDesc text not null, -- ���ϵ�������Ϣ
	FixType char(1)  not null default '1', -- 1���ޣ�2����
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
-- 13ʵ���ҿγ���Ϣ
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
-- ʵ���ҵĿγ̳��湤����
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