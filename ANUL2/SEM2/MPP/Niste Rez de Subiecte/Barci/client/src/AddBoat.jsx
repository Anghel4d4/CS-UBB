import { useState } from 'react';
import './App.css';

function AddBoat() {
    const [position1, setPosition1] = useState('');
    const [position2, setPosition2] = useState('');
    const [position3, setPosition3] = useState('');
    const [message, setMessage] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();
        const boat = { position1, position2, position3 };

        try {
            const response = await fetch('http://localhost:1234/api/games/boat', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(boat),
            });

            if (response.ok) {
                setMessage('Boat added successfully!');
            } else {
                const errorText = await response.text();
                setMessage(`Error: ${errorText}`);
            }
        } catch (error) {
            setMessage(`Error: ${error.message}`);
        }
    };

    return (
        <div className="add-boat">
            <h2>Add a Boat</h2>
            <form onSubmit={handleSubmit}>
                <div>
                    <label>Position 1:</label>
                    <input
                        type="text"
                        value={position1}
                        onChange={(e) => setPosition1(e.target.value)}
                        placeholder="(row,column)"
                        required
                    />
                </div>
                <div>
                    <label>Position 2:</label>
                    <input
                        type="text"
                        value={position2}
                        onChange={(e) => setPosition2(e.target.value)}
                        placeholder="(row,column)"
                        required
                    />
                </div>
                <div>
                    <label>Position 3:</label>
                    <input
                        type="text"
                        value={position3}
                        onChange={(e) => setPosition3(e.target.value)}
                        placeholder="(row,column)"
                        required
                    />
                </div>
                <button type="submit">Add Boat</button>
            </form>
            {message && <p className="message">{message}</p>}
        </div>
    );
}

export default AddBoat;