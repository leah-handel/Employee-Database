-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "department_number" VARCHAR(10)   NOT NULL,
    "department_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "department_number"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "employee_number" VARCHAR(10)   NOT NULL,
    "title_id" VARCHAR(10)   NOT NULL,
    "dob" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(10)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_number"
     )
);

CREATE TABLE "department_manager" (
    "department_number" VARCHAR(10)   NOT NULL,
    "employee_number" VARCHAR(10)   NOT NULL,
    PRIMARY KEY ("employee_number")
);

CREATE TABLE "department_employee" (
    "employee_number" VARCHAR(10)   NOT NULL,
    "department_number" VARCHAR(10)   NOT NULL,
    PRIMARY KEY("employee_number","department_number")
);

CREATE TABLE "salaries" (
    "employee_number" VARCHAR(10)   NOT NULL,
    "salary" INT   NOT NULL,
    PRIMARY KEY ("employee_number")
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_title_id" FOREIGN KEY("title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_department_number" FOREIGN KEY("department_number")
REFERENCES "departments" ("department_number");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_department_number" FOREIGN KEY("department_number")
REFERENCES "departments" ("department_number");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

