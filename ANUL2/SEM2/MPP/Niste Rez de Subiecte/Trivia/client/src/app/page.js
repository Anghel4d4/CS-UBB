"use client";

import { useState } from "react";
import styles from "./page.module.css";

export default function Home() {
  const [id, setId] = useState("");
  const [text, setText] = useState("");
  const [correctAnswer, setCorrectAnswer] = useState("");
  const [difficultyLevel, setDifficultyLevel] = useState("");
  const [message, setMessage] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    const requestBody = {
      text: text || undefined,
      correctAnswer: correctAnswer || undefined,
      difficultyLevel: difficultyLevel ? parseInt(difficultyLevel, 10) : undefined,
    };

    try {
      const response = await fetch(`http://localhost:1234/api/questions/${id}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(requestBody),
      });

      if (response.ok) {
        setMessage("Intrebare actualizata cu succes");
      } else {
        setMessage(`Eroare: ${response.statusText}`);
      }
    } catch (error) {
      setMessage(`Eroare: ${error instanceof Error ? error.message : "Eroare necunoscuta"}`);
    }
  };

  return (
      <div className={styles.container}>
        <h1 className={styles.title}>Update Question</h1>
        <form onSubmit={handleSubmit} className={styles.form}>
          <div className={styles.formGroup}>
            <label htmlFor="id">Question ID</label>
            <input
                type="number"
                id="id"
                value={id}
                onChange={(e) => setId(e.target.value)}
                required
            />
          </div>
          <div className={styles.formGroup}>
            <label htmlFor="text">Text</label>
            <input
                type="text"
                id="text"
                value={text}
                onChange={(e) => setText(e.target.value)}
            />
          </div>
          <div className={styles.formGroup}>
            <label htmlFor="correctAnswer">Correct Answer</label>
            <input
                type="text"
                id="correctAnswer"
                value={correctAnswer}
                onChange={(e) => setCorrectAnswer(e.target.value)}
            />
          </div>
          <div className={styles.formGroup}>
            <label htmlFor="difficultyLevel">Difficulty Level (1-3)</label>
            <input
                type="number"
                id="difficultyLevel"
                value={difficultyLevel}
                onChange={(e) => setDifficultyLevel(e.target.value)}
                min="1"
                max="3"
            />
          </div>
          <button type="submit" className={styles.submitButton}>
            Update Question
          </button>
          {message && <p className={styles.message}>{message}</p>}
        </form>
      </div>
  );
}