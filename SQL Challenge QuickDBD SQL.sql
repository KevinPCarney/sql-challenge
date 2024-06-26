﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ZFhxHR
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" varchar(5)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    "last_updated" timestamp   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" integer   NOT NULL,
    "emp_title" varchar(5)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "sex" varchar(5)   NOT NULL,
    "hire_date" timestamp   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar(5)   NOT NULL,
    "title" varchar(50)   NOT NULL,
    "last_updated" timestamp   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "salaries" (
    "id" serial   NOT NULL,
    "emp_no" integer   NOT NULL,
    "salary" float   NOT NULL,
    "last_updated" timestamp   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "dept_manager" (
    "id" serial   NOT NULL,
    "dept_no" varchar(5)   NOT NULL,
    "emp_no" integer   NOT NULL,
    "last_updated" timestamp   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "id","dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "id" serial   NOT NULL,
    "emp_no" integer   NOT NULL,
    "dept_no" varchar(5)   NOT NULL,
    "last_updated" timestamp   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

