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
