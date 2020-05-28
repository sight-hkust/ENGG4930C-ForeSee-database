# ENGG4930C(SIGHT) ForeSee Database Structure

HKUST Spring 2020, Hong Kong Eye Health Tracking Application

## Introduction

ForeSee is an application for tracking of eye health metrics such as myopia. This repository contains the structure of database for the project. Database can be created in any MySQL environment but in order to be compatible with the [ForeSee API](https://github.com/DoguD/ENGG4930C-ForeSee-api) it needs to be created in an [AWS RDS](https://aws.amazon.com/rds/).

## Getting Started

1. Create an AWS MySQL RDS instance. [Documentation](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CreateDBInstance.html)
2. After creating the RDS instance take note of **Endpoint**, **Database Username**, **Database Password**, and **Database Name** (*innodb* by default). You need to write them in the [`rdsconfig.py` file of the API](https://github.com/DoguD/ENGG4930C-ForeSee-api#getting-started).
3. Connect to your database using a software like [MySQL Workbench](https://www.mysql.com/products/workbench/) or [DataGrip](https://www.jetbrains.com/datagrip/).
4. Run the SQL [create_tables.sql](https://github.com/DoguD/ENGG4930C-ForeSee-database/blob/master/create_tables.sql)
```sql
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

```
This will create all the needed tables for the application and the API to work.
