CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(13) UNIQUE,
    Available BOOLEAN DEFAULT TRUE
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    JoinDate DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    LoanDate DATE DEFAULT CURRENT_DATE,
    ReturnDate DATE NULL,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Books (Title, Author, ISBN) VALUES 
('Twisted Love', 'Ana Huang', '9780349434285'),
('Twisted Games', 'Ana Huang', '9780349434315'),
('Twisted Hate', 'Ana Huang', '9780349434339'),
('Twisted Lies', 'Ana Huang', '9780349434360');

INSERT INTO Members (Name, Email, Phone) VALUES 
('Alice Johnson', 'alice@example.com', '1234567890'),
('Bob Smith', 'bob@example.com', '9876543210');
