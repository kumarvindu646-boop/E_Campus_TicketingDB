CREATE DATABASE IF NOT EXISTS E_Campus_Ticketing;
USE E_Campus_Ticketing;

-- user table — uaer can be (student, hostel admin, college official)
CREATE TABLE users (
    user_id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    full_name       VARCHAR(150)  NOT NULL,
    email           VARCHAR(150)  NOT NULL UNIQUE,
    phone           VARCHAR(15),
    password_hash   VARCHAR(255)  NOT NULL,
    role            ENUM('student', 'hostel_admin', 'college_official', 'director') NOT NULL,
    is_active       BOOLEAN       DEFAULT TRUE,
    created_at      TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--Department fields 

CREATE TABLE departments (
    department_id   INT AUTO_INCREMENT PRIMARY KEY,
    dept_name        VARCHAR(100) NOT NULL,
    dept_code        VARCHAR(20)  UNIQUE
);
--For Student Details 
CREATE TABLE students (
    student_enrol_id      BIGINT PRIMARY KEY,                
    roll_no         VARCHAR(30)  NOT NULL UNIQUE,
    semester        TINYINT,
    batch_year      YEAR,
    is_hosteller    BOOLEAN DEFAULT FALSE,
    hostel_reg_id       INT NULL,
    room_num         INT NULL,
    student_phone  VARCHAR(15),
    guardian_name   VARCHAR(150),
    guardian_phone  VARCHAR(15),
    FOREIGN KEY (student_id)    REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- official extended profile (hostel admin OR college staf)
CREATE TABLE staff (
    staff_id        BIGINT PRIMARY KEY,             
    designation     VARCHAR(100),                      
    department_id   INT NULL,                         
    hostel_id       INT NULL,                             
    employee_id   VARCHAR(30) UNIQUE,
    FOREIGN KEY (staff_id)      REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
