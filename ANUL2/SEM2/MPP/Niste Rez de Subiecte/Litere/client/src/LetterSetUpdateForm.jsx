import React, { useState } from 'react';

function LetterSetUpdateForm() {
    const [id, setId] = useState('');
    const [letter1, setLetter1] = useState('');
    const [value1, setValue1] = useState('');
    const [letter2, setLetter2] = useState('');
    const [value2, setValue2] = useState('');
    const [letter3, setLetter3] = useState('');
    const [value3, setValue3] = useState('');
    const [letter4, setLetter4] = useState('');
    const [value4, setValue4] = useState('');
    const [message, setMessage] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();

        // Validate input
        const letters = [letter1, letter2, letter3, letter4];
        const values = [value1, value2, value3, value4];
        if (new Set(letters).size !== 4) {
            setMessage('Letters must be distinct.');
            return;
        }
        if (values.some(v => v < 1 || v > 10)) {
            setMessage('Values must be between 1 and 10.');
            return;
        }

        const data = {
            letter1, value1, letter2, value2, letter3, value3, letter4, value4
        };

        try {
            const response = await fetch(`/api/letter-sets/${id}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data),
            });

            if (response.ok) {
                const result = await response.json();
                setMessage(`Letter set ${id} updated successfully: ${JSON.stringify(result)}`);
            } else {
                setMessage(`Error: ${response.statusText}`);
            }
        } catch (error) {
            setMessage(`Network error: ${error.message}`);
        }
    };

    return (
        <div>
            <h2>Update Letter Set</h2>
            <form onSubmit={handleSubmit}>
                <div>
                    <label>Letter Set ID:</label>
                    <input
                        type="number"
                        value={id}
                        onChange={(e) => setId(e.target.value)}
                        required
                    />
                </div>
                <div>
                    <label>Letter 1:</label>
                    <input
                        type="text"
                        maxLength="1"
                        value={letter1}
                        onChange={(e) => setLetter1(e.target.value.toUpperCase())}
                        required
                    />
                    <input
                        type="number"
                        value={value1}
                        onChange={(e) => setValue1(e.target.value)}
                        required
                    />
                </div>
                <div>
                    <label>Letter 2:</label>
                    <input
                        type="text"
                        maxLength="1"
                        value={letter2}
                        onChange={(e) => setLetter2(e.target.value.toUpperCase())}
                        required
                    />
                    <input
                        type="number"
                        value={value2}
                        onChange={(e) => setValue2(e.target.value)}
                        required
                    />
                </div>
                <div>
                    <label>Letter 3:</label>
                    <input
                        type="text"
                        maxLength="1"
                        value={letter3}
                        onChange={(e) => setLetter3(e.target.value.toUpperCase())}
                        required
                    />
                    <input
                        type="number"
                        value={value3}
                        onChange={(e) => setValue3(e.target.value)}
                        required
                    />
                </div>
                <div>
                    <label>Letter 4:</label>
                    <input
                        type="text"
                        maxLength="1"
                        value={letter4}
                        onChange={(e) => setLetter4(e.target.value.toUpperCase())}
                        required
                    />
                    <input
                        type="number"
                        value={value4}
                        onChange={(e) => setValue4(e.target.value)}
                        required
                    />
                </div>
                <button type="submit">Update</button>
            </form>
            {message && <p>{message}</p>}
        </div>
    );
}

export default LetterSetUpdateForm;