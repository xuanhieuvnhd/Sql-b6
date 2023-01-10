use `chapter6`;
create table class(
                      classID int not null primary key auto_increment,
                      className nvarchar(255) not null ,
                      startDate datetime not null ,
                      status bit
);
create table students(
                         studentsId int not null primary key auto_increment,
                         studentsName nvarchar(30) not null ,
                         address nvarchar(50),
                         phone varchar(20),
                         status bit ,
                         classID int not null
);
create table subject(
                        subID int not null primary key auto_increment,
                        subName nvarchar(30) not null ,
                        credit tinyint not null check (credit >=1 ) default 1,
                        status bit default 1
);
create table mark(
                     markId int not null primary key auto_increment,
                     subID int not null unique ,
                     studentsId int not null unique ,
                     mark float default 0 check (mark between 0 and 100 ),
                     examTimes tinyint default 1
);
alter table students
    add foreign key (classID) references class(classID);
alter table mark
    add foreign key (subID) references mark(subID);
alter table mark
    add foreign key (studentsId) references mark(studentsId);
alter table students
    modify status bit default 1;
insert into class(className, startDate, status) VALUE ('A1',20/12/2008,1),
    ('A2',22/12/2008,1);
insert into students(studentsName, address, phone, status, classID) VALUE
    ('hung','ha noi',091233321,1,1),('hoa','hai phong',1,1),
    ('manh','hcm',01223421,0,2);
insert into subject ( subName, credit, status)
values ('CF',5,1),('C',6,1),('HDJ',5,1);
insert into mark( subID, studentsId, mark, examTimes) VALUE
    (1,1,8,1),(1,2,10,2);