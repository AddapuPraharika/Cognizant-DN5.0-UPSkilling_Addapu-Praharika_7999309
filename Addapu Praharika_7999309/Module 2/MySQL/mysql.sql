-- =========================================
-- CREATE DATABASE
-- =========================================
CREATE DATABASE EventPortal;
USE EventPortal;

-- =========================================
-- TABLES
-- =========================================

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL
);

CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    city VARCHAR(100) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    status ENUM('upcoming','completed','cancelled'),
    organizer_id INT,
    FOREIGN KEY (organizer_id) REFERENCES Users(user_id)
);

CREATE TABLE Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    title VARCHAR(200) NOT NULL,
    speaker_name VARCHAR(100) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    registration_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    feedback_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

CREATE TABLE Resources (
    resource_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    resource_type ENUM('pdf','image','link'),
    resource_url VARCHAR(255) NOT NULL,
    uploaded_at DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- =========================================
-- SAMPLE DATA
-- =========================================

INSERT INTO Users VALUES
(1,'Praharika','praharika@gmail.com','Hyderabad','2025-01-10'),
(2,'Pravasthi','pravasthi@gmail.com','Hyderabad','2025-01-15'),
(3,'Sathwika','sathwika@gmail.com','Bangalore','2025-01-20'),
(4,'Riya','riya@gmail.com','Chennai','2025-02-01'),
(5,'Chinni','chinni@gmail.com','Hyderabad','2025-02-10');

INSERT INTO Events VALUES
(1,'AI & ML Summit',
'AI and Machine Learning Conference',
'Hyderabad',
'2026-07-15 09:00:00',
'2026-07-15 17:00:00',
'upcoming',
1),

(2,'Women Tech Workshop',
'Technology workshop for students',
'Hyderabad',
'2026-05-20 10:00:00',
'2026-05-20 16:00:00',
'completed',
2),

(3,'Python Bootcamp',
'Hands-on Python programming training',
'Bangalore',
'2026-08-05 09:00:00',
'2026-08-05 18:00:00',
'upcoming',
3);

INSERT INTO Sessions VALUES
(1,1,'Future of AI',
'Praharika',
'2026-07-15 09:00:00',
'2026-07-15 10:30:00'),

(2,1,'Machine Learning Trends',
'Pravasthi',
'2026-07-15 11:00:00',
'2026-07-15 12:30:00'),

(3,2,'Women in Technology',
'Sathwika',
'2026-05-20 10:00:00',
'2026-05-20 11:30:00'),

(4,3,'Python for Beginners',
'Riya',
'2026-08-05 09:00:00',
'2026-08-05 11:00:00');

INSERT INTO Registrations VALUES
(1,1,1,'2026-06-01'),
(2,2,1,'2026-06-02'),
(3,3,2,'2026-05-01'),
(4,4,2,'2026-05-03'),
(5,5,3,'2026-07-01');

INSERT INTO Feedback VALUES
(1,3,2,5,'Excellent workshop and useful sessions.','2026-05-21'),
(2,4,2,4,'Very informative and engaging.','2026-05-21'),
(3,2,1,4,'Great AI discussions.','2026-07-16');

INSERT INTO Resources VALUES
(1,1,'pdf',
'https://eventportal.com/resources/ai_ml_agenda.pdf',
'2026-06-15 10:00:00'),

(2,2,'image',
'https://eventportal.com/resources/women_tech_poster.jpg',
'2026-04-20 09:00:00'),

(3,3,'link',
'https://eventportal.com/resources/python_docs',
'2026-07-25 15:00:00');

-- =========================================
-- TASK 1
-- User Upcoming Events
-- =========================================
SELECT u.full_name,e.title,e.city,e.start_date
FROM Users u
JOIN Registrations r ON u.user_id=r.user_id
JOIN Events e ON r.event_id=e.event_id
WHERE e.status='upcoming'
AND u.city=e.city
ORDER BY e.start_date;

-- =========================================
-- TASK 2
-- Top Rated Events
-- =========================================
SELECT e.title,AVG(f.rating) avg_rating
FROM Events e
JOIN Feedback f ON e.event_id=f.event_id
GROUP BY e.event_id,e.title
HAVING COUNT(f.feedback_id)>=1
ORDER BY avg_rating DESC;

-- =========================================
-- TASK 3
-- Inactive Users
-- =========================================
SELECT *
FROM Users
WHERE user_id NOT IN
(
SELECT DISTINCT user_id
FROM Registrations
WHERE registration_date >= CURDATE()-INTERVAL 90 DAY
);

-- =========================================
-- TASK 4
-- Peak Session Hours
-- =========================================
SELECT e.title,COUNT(*) total_sessions
FROM Events e
JOIN Sessions s ON e.event_id=s.event_id
WHERE HOUR(s.start_time) BETWEEN 10 AND 12
GROUP BY e.title;

-- =========================================
-- TASK 5
-- Most Active Cities
-- =========================================
SELECT e.city,
COUNT(DISTINCT r.user_id) registrations
FROM Registrations r
JOIN Events e ON r.event_id=e.event_id
GROUP BY e.city
ORDER BY registrations DESC
LIMIT 5;

-- =========================================
-- TASK 6
-- Event Resource Summary
-- =========================================
SELECT e.title,
COUNT(r.resource_id) total_resources
FROM Events e
LEFT JOIN Resources r
ON e.event_id=r.event_id
GROUP BY e.title;

-- =========================================
-- TASK 7
-- Low Feedback Alerts
-- =========================================
SELECT u.full_name,
f.comments,
e.title
FROM Feedback f
JOIN Users u ON f.user_id=u.user_id
JOIN Events e ON f.event_id=e.event_id
WHERE f.rating<3;

-- =========================================
-- TASK 8
-- Sessions per Upcoming Event
-- =========================================
SELECT e.title,
COUNT(s.session_id) session_count
FROM Events e
LEFT JOIN Sessions s
ON e.event_id=s.event_id
WHERE e.status='upcoming'
GROUP BY e.title;

-- =========================================
-- TASK 9
-- Organizer Event Summary
-- =========================================
SELECT u.full_name,
e.status,
COUNT(*) total_events
FROM Users u
JOIN Events e
ON u.user_id=e.organizer_id
GROUP BY u.full_name,e.status;

-- =========================================
-- TASK 10
-- Feedback Gap
-- =========================================
SELECT e.title
FROM Events e
JOIN Registrations r
ON e.event_id=r.event_id
LEFT JOIN Feedback f
ON e.event_id=f.event_id
GROUP BY e.title
HAVING COUNT(f.feedback_id)=0;

-- =========================================
-- TASK 11
-- Daily New User Count
-- =========================================
SELECT registration_date,
COUNT(*) users_count
FROM Users
GROUP BY registration_date;

-- =========================================
-- TASK 12
-- Event with Maximum Sessions
-- =========================================
SELECT e.title,
COUNT(s.session_id) total_sessions
FROM Events e
JOIN Sessions s
ON e.event_id=s.event_id
GROUP BY e.title
ORDER BY total_sessions DESC
LIMIT 1;

-- =========================================
-- TASK 13
-- Average Rating per City
-- =========================================
SELECT e.city,
AVG(f.rating) avg_rating
FROM Events e
JOIN Feedback f
ON e.event_id=f.event_id
GROUP BY e.city;

-- =========================================
-- TASK 14
-- Most Registered Events
-- =========================================
SELECT e.title,
COUNT(r.registration_id) registrations
FROM Events e
JOIN Registrations r
ON e.event_id=r.event_id
GROUP BY e.title
ORDER BY registrations DESC
LIMIT 3;

-- =========================================
-- TASK 15
-- Event Session Time Conflict
-- =========================================
SELECT s1.event_id,
s1.title,
s2.title
FROM Sessions s1
JOIN Sessions s2
ON s1.event_id=s2.event_id
AND s1.session_id<s2.session_id
AND s1.end_time>s2.start_time;

-- =========================================
-- TASK 16
-- Unregistered Active Users
-- =========================================
SELECT *
FROM Users
WHERE registration_date>=CURDATE()-INTERVAL 30 DAY
AND user_id NOT IN
(
SELECT user_id
FROM Registrations
);

-- =========================================
-- TASK 17
-- Multi Session Speakers
-- =========================================
SELECT speaker_name,
COUNT(*) total_sessions
FROM Sessions
GROUP BY speaker_name
HAVING COUNT(*)>1;

-- =========================================
-- TASK 18
-- Resource Availability Check
-- =========================================
SELECT e.title
FROM Events e
LEFT JOIN Resources r
ON e.event_id=r.event_id
WHERE r.resource_id IS NULL;

-- =========================================
-- TASK 19
-- Completed Events with Feedback Summary
-- =========================================
SELECT e.title,
COUNT(DISTINCT r.registration_id) registrations,
AVG(f.rating) avg_rating
FROM Events e
LEFT JOIN Registrations r
ON e.event_id=r.event_id
LEFT JOIN Feedback f
ON e.event_id=f.event_id
WHERE e.status='completed'
GROUP BY e.title;

-- =========================================
-- TASK 20
-- User Engagement Index
-- =========================================
SELECT u.full_name,
COUNT(DISTINCT r.event_id) events_attended,
COUNT(DISTINCT f.feedback_id) feedbacks
FROM Users u
LEFT JOIN Registrations r
ON u.user_id=r.user_id
LEFT JOIN Feedback f
ON u.user_id=f.user_id
GROUP BY u.full_name;

-- =========================================
-- TASK 21
-- Top Feedback Providers
-- =========================================
SELECT u.full_name,
COUNT(f.feedback_id) total_feedbacks
FROM Users u
JOIN Feedback f
ON u.user_id=f.user_id
GROUP BY u.full_name
ORDER BY total_feedbacks DESC
LIMIT 5;

-- =========================================
-- TASK 22
-- Duplicate Registrations Check
-- =========================================
SELECT user_id,
event_id,
COUNT(*) duplicates
FROM Registrations
GROUP BY user_id,event_id
HAVING COUNT(*)>1;

-- =========================================
-- TASK 23
-- Registration Trends
-- =========================================
SELECT YEAR(registration_date) yr,
MONTH(registration_date) mn,
COUNT(*) registrations
FROM Registrations
GROUP BY YEAR(registration_date),
MONTH(registration_date);

-- =========================================
-- TASK 24
-- Average Session Duration per Event
-- =========================================
SELECT e.title,
AVG(TIMESTAMPDIFF(MINUTE,
s.start_time,
s.end_time)) avg_duration
FROM Events e
JOIN Sessions s
ON e.event_id=s.event_id
GROUP BY e.title;

-- =========================================
-- TASK 25
-- Events Without Sessions
-- =========================================
SELECT e.title
FROM Events e
LEFT JOIN Sessions s
ON e.event_id=s.event_id
WHERE s.session_id IS NULL;

-- =========================================
-- DISPLAY TABLE DATA
-- =========================================
SELECT * FROM Users;
SELECT * FROM Events;
SELECT * FROM Sessions;
SELECT * FROM Registrations;
SELECT * FROM Feedback;
SELECT * FROM Resources;