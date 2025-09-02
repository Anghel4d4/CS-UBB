import { useState } from 'react';
import './ConfigForm.css';

function ConfigForm() {
    const [positions, setPositions] = useState('');
    const [loading,   setLoading] = useState(false);
    const [message,   setMessage] = useState('');
    const [error,     setError]   = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError('');
        setMessage('');

        // --- SIMPLE VALIDATION: split on commas, check count + numericity ---
        const parts = positions.split(',');
        if (parts.length !== 5 || parts.some(p => isNaN(Number(p.trim())))) {
            setError('Please enter exactly 5 numbers, e.g. "1,2,3,4,5".');
            return;
        }

        setLoading(true);
        try {
            const res = await fetch('http://localhost:1234/api/config', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ positions }),
            });
            if (!res.ok) throw new Error(res.status);
            const data = await res.json();
            setMessage(`Saved! ID: ${data.id}`);
            setPositions('');
        } catch (err) {
            setError(`Save failed: ${err.message}`);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="config-form-container">
            <h2 className="config-form-title">Add Game Configuration</h2>
            <form onSubmit={handleSubmit}>
                <label htmlFor="positions">Positions:</label>
                <textarea
                    id="positions"
                    rows="4"
                    value={positions}
                    onChange={e => setPositions(e.target.value)}
                    placeholder="e.g. 1,2,3,4,5"
                    required
                />
                <button type="submit" disabled={loading}>
                    {loading ? 'Saving…' : 'Save Configuration'}
                </button>
            </form>

            {error   && <div className="error-message">{error}</div>}
            {message && <div className="success-message">{message}</div>}
        </div>
    );
}


export default ConfigForm;
