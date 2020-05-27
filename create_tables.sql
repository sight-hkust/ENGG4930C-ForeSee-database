create table fs__data
(
    id               int auto_increment
        primary key,
    right_eye_myopia varchar(45) null,
    left_eye_myopia  varchar(45) null,
    year             varchar(4)  null,
    month            varchar(5)  null,
    user_id          int         null
);

create table fs__patient_doctor
(
    id          int auto_increment
        primary key,
    user_id     int         not null,
    doctor_id   int         not null,
    create_date varchar(45) null
);

create table fs__professionals
(
    id           int auto_increment
        primary key,
    email        varchar(45) not null,
    password     varchar(45) not null,
    phone_number varchar(45) null
);

create table fs__questions
(
    id           int auto_increment
        primary key,
    question     varchar(500) null,
    email        varchar(30)  null,
    is_private   tinyint(1)   null,
    sharing_data tinyint(1)   null
);

create table fs__users
(
    id           int auto_increment
        primary key,
    email        varchar(255)                        not null,
    password     varchar(32)                         not null,
    real_name    varchar(16)                         not null,
    create_time  timestamp default CURRENT_TIMESTAMP null,
    birthday     timestamp                           null,
    phone_number varchar(15)                         null,
    is_parent    tinyint   default 0                 not null
);

