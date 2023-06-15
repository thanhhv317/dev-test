create database school_management;

use school_management;

CREATE TABLE school_levels (
     id int auto_increment primary key ,
     name varchar(255) not null,
     num_of_school_year int
);

CREATE TABLE schools (
    id int auto_increment primary key ,
    name varchar(255) not null,
    address varchar(255) not null,
    school_principal_id int not null,
    school_level_id int not null,
    created_at timestamp default current_timestamp                             null,
    updated_at timestamp default current_timestamp on update current_timestamp null
);

CREATE TABLE classes (
    id int auto_increment primary key ,
    name varchar(255) not null,
    school_id int not null,
    school_level_id int not null,
    created_at timestamp default current_timestamp                             null,
    updated_at timestamp default current_timestamp on update current_timestamp null
);

CREATE TABLE teachers (
    id int auto_increment primary key ,
    name varchar(255) not null,
    school_id int,
    created_at timestamp default current_timestamp                             null,
    updated_at timestamp default current_timestamp on update current_timestamp null
);

CREATE TABLE subjects (
    id int auto_increment primary key ,
    name varchar(255) not null,
    created_at    timestamp default current_timestamp null
);

CREATE TABLE teacher_subjects (
    teacher_id int not null,
    subject_id int not null,
    created_at    timestamp default current_timestamp null,
    primary key (teacher_id, subject_id),
    index (subject_id)
);


CREATE TABLE students (
    id int auto_increment primary key ,
    name varchar(255) not null,
    class_id int not null,
    created_at timestamp default current_timestamp                             null,
    updated_at timestamp default current_timestamp on update current_timestamp null,
    index (class_id)
);

CREATE TABLE transcript (
    id int auto_increment primary key ,
    subject_id int not null,
    score int not null,
    type int not null,
    coefficient int not null,
    student_id int not null,
    school_year DATE not null,
    created_at timestamp default current_timestamp                             null,
    updated_at timestamp default current_timestamp on update current_timestamp null,
    index(subject_id)
);


-- insert database

INSERT INTO school_levels VALUES (1, "Cấp 1", 5);
INSERT INTO school_levels VALUES (2, "Cấp 2", 4);
INSERT INTO school_levels VALUES (3, "Cấp 3", 3);

INSERT INTO schools VALUES(1, "Trường Tiểu học Nguyễn Văn A", "Tân Bình, HCM", 1, 1,null,null);
INSERT INTO schools VALUES(2, "Trường THCS Nguyễn Văn B", "Tân Bình, HCM", 3, 2,null,null);
INSERT INTO schools VALUES(3, "Trường THPT Nguyễn Văn C", "Tân Bình, HCM", 5, 3,null,null);

INSERT INTO classes VALUES(1, "Lop 1", 1, 1, null, null);
INSERT INTO classes VALUES(2, "Lop 2", 1, 1, null, null);
INSERT INTO classes VALUES(3, "Lop 3", 1, 1, null, null);
INSERT INTO classes VALUES(4, "Lop 4", 1, 1, null, null);
INSERT INTO classes VALUES(5, "Lop 5", 1, 1, null, null);
INSERT INTO classes VALUES(6, "Lop 6", 2, 2, null, null);
INSERT INTO classes VALUES(7, "Lop 7", 2, 2, null, null);
INSERT INTO classes VALUES(8, "Lop 8", 2, 2, null, null);
INSERT INTO classes VALUES(9, "Lop 9", 2, 2, null, null);
INSERT INTO classes VALUES(10, "Lop 10", 3, 3, null, null);
INSERT INTO classes VALUES(11, "Lop 11", 3, 3, null, null);
INSERT INTO classes VALUES(12, "Lop 12", 3, 3, null, null);

INSERT INTO teachers VALUES (1, "Nguyễn Thị Một", 1, null, null);
INSERT INTO teachers VALUES (2, "Nguyễn Thị Hai", 1, null, null);
INSERT INTO teachers VALUES (3, "Hoàng Văn Ba", 2, null, null);
INSERT INTO teachers VALUES (4, "Hoàng Văn Tư", 2, null, null);
INSERT INTO teachers VALUES (5, "Nguyễn Thị Năm", 3, null, null);
INSERT INTO teachers VALUES (6, "Nguyễn Thị Sáu", 3, null, null);

INSERT INTO subjects VALUES (1, "Ngữ văn", null);
INSERT INTO subjects VALUES (2, "Toán", null);
INSERT INTO subjects VALUES (3, "Tiếng Anh", null);

INSERT INTO teacher_subjects VALUES(2,1, null);
INSERT INTO teacher_subjects VALUES(2,2, null);
INSERT INTO teacher_subjects VALUES(2,3, null);
INSERT INTO teacher_subjects VALUES(4,1, null);
INSERT INTO teacher_subjects VALUES(4,2, null);
INSERT INTO teacher_subjects VALUES(4,3, null);
INSERT INTO teacher_subjects VALUES(6,1, null);
INSERT INTO teacher_subjects VALUES(6,2, null);
INSERT INTO teacher_subjects VALUES(6,3, null);

INSERT INTO students VALUES (1, "Nguyễn Văn Tèo", 5, '2023-06-15 10:00:00','2023-06-15 10:00:00');
INSERT INTO students VALUES (2, "Nguyễn Văn Tí", 5, '2023-06-15 10:00:00','2023-06-15 10:00:00');
INSERT INTO students VALUES (3, "Nguyễn Văn Kha", 5, '2023-06-15 10:00:00','2023-06-15 10:00:00');
INSERT INTO students VALUES (4, "Nguyễn Văn Tuấn", 5, '2023-06-15 10:00:00','2023-06-15 10:00:00');

INSERT INTO transcript VALUES (1,1,9,0,1, 1, "2023-04-15",'2023-06-15 10:00:00','2023-06-15 10:00:00');
INSERT INTO transcript VALUES (2,2,9,2,2,1, "2023-04-15",'2023-06-15 10:00:00','2023-06-15 10:00:00');
INSERT INTO transcript VALUES (3,3,9,3,3,1, "2023-04-15",'2023-06-15 10:00:00','2023-06-15 10:00:00');
INSERT INTO transcript VALUES (4,1,7,2,2,2, "2023-04-15",'2023-06-15 10:00:00','2023-06-15 10:00:00');
INSERT INTO transcript VALUES (5,2,7,0,1,2, "2023-04-15",'2023-06-15 10:00:00','2023-06-15 10:00:00');
INSERT INTO transcript VALUES (6,3,9,3,3,2, "2023-04-15",'2023-06-15 10:00:00','2023-06-15 10:00:00');

