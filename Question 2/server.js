const express = require('express');
const mysql = require('mysql2');
const app = express();

app.use(express.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'yourpassword',
    database: 'student_portal'
});

db.connect(err => {
    if (err) throw err;
    console.log('MySQL Connected...');
});

// Create Student
app.post('/students', (req, res) => {
    const { Name, Email, Age } = req.body;
    db.query('INSERT INTO Students (Name, Email, Age) VALUES (?, ?, ?)', [Name, Email, Age], (err, result) => {
        if (err) throw err;
        res.send('Student added successfully!');
    });
});

// Read Students
app.get('/students', (req, res) => {
    db.query('SELECT * FROM Students', (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Update Student
app.put('/students/:id', (req, res) => {
    const { Name, Email, Age } = req.body;
    db.query('UPDATE Students SET Name=?, Email=?, Age=? WHERE StudentID=?', [Name, Email, Age, req.params.id], (err, result) => {
        if (err) throw err;
        res.send('Student updated successfully!');
    });
});

// Delete Student
app.delete('/students/:id', (req, res) => {
    db.query('DELETE FROM Students WHERE StudentID=?', [req.params.id], (err, result) => {
        if (err) throw err;
        res.send('Student deleted successfully!');
    });
});

app.listen(3000, () => console.log('Server running on port 3000'));
