CREATE TABLE Hotel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    stars INT CHECK (stars BETWEEN 1 AND 5),
    descriptions TEXT
);

CREATE TABLE Room (
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    hotelId INT,
    FOREIGN KEY (hotelId) REFERENCES Hotel(id) ON DELETE CASCADE
);

CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'Agent', 'Visiteur') NOT NULL
);
