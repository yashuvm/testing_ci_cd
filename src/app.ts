import express from "express";

const app = express();

const PORT = 3000;

app.get("/", (req, res) => {
    res.json({
        message: "Hello from Node + TypeScript"
    });
});

app.get("/health", (req, res) => {
    res.status(200).json({ message: "Everything is good"})
});


app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});