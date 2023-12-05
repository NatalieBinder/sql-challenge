CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
     "emp_no" INT  NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

-- Import data into tables
COPY titles("title_id", "title")
FROM 'C:\Users\ladyp\bootcamp\hwk\sql-challenge\EmployeeSQL\temp\titles.csv'
DELIMITER ',' 
CSV HEADER;

COPY salaries("emp_no", "salary")
FROM 'C:\Users\ladyp\bootcamp\hwk\sql-challenge\EmployeeSQL\data\salaries.csv'
DELIMITER ',' 
CSV HEADER;

COPY employees("emp_no" , "emp_title_id" , "birth_date" , "first_name" , "last_name" , "sex" , "hire_date" )
FROM 'C:\Users\ladyp\bootcamp\hwk\sql-challenge\EmployeeSQL\data\employees.csv'
DELIMITER ',' 
CSV HEADER;

COPY departments("dept_no", "dept_name")
FROM 'C:\Users\ladyp\bootcamp\hwk\sql-challenge\EmployeeSQL\data\departments.csv'
DELIMITER ',' 
CSV HEADER;

COPY dept_manager("dept_no", "emp_no" )
FROM 'C:\Users\ladyp\bootcamp\hwk\sql-challenge\EmployeeSQL\data\dept_manager.csv'
DELIMITER ',' 
CSV HEADER;

COPY dept_emp("emp_no", "dept_no")
FROM 'C:\Users\ladyp\bootcamp\hwk\sql-challenge\EmployeeSQL\data\dept_emp.csv' 
DELIMITER ',' 
CSV HEADER;



ALTER TABLE "employees" 
ADD CONSTRAINT "fk_employees_emp_title_id" 
FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_manager" 
ADD CONSTRAINT "fk_dept_manager_emp_no" 
FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" 
ADD CONSTRAINT "fk_dept_manager_dept_no" 
FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_emp" 
ADD CONSTRAINT "fk_dept_emp_emp_no" 
FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" 
ADD CONSTRAINT "fk_dept_emp_dept_no" 
FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" 
ADD CONSTRAINT "fk_salaries_emp_no" 
FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");
