import { useState, useEffect } from 'react'
import './App.css'

function PathUpdateForm() {
    const [configs, setConfigs] = useState([]);
    const [selectedConfig, setSelectedConfig] = useState(null);
    const [formData, setFormData] = useState({
        oldRow: '',
        oldCol: '',
        newRow: '',
        newCol: ''
    });
    const [message, setMessage] = useState('');
    const [isLoading, setIsLoading] = useState(false);

    // Load all configurations on component mount
    useEffect(() => {
        fetchConfigurations();
    }, []);

    const fetchConfigurations = async () => {
        setIsLoading(true);
        try {
            const response = await fetch('/api/configs');
            if (response.ok) {
                const data = await response.json();
                setConfigs(data);
                setMessage('Configurations loaded successfully');
            } else {
                setMessage('Failed to load configurations');
            }
        } catch (error) {
            setMessage(`Error: ${error.message}`);
        } finally {
            setIsLoading(false);
        }
    };

    const fetchConfig = async (configId) => {
        setIsLoading(true);
        try {
            const response = await fetch(`/api/path/${configId}`);
            if (response.ok) {
                const config = await response.json();
                setSelectedConfig(config);
                setMessage(`Configuration ${configId} loaded`);
            } else {
                setMessage(`Failed to load configuration ${configId}`);
            }
        } catch (error) {
            setMessage(`Error: ${error.message}`);
        } finally {
            setIsLoading(false);
        }
    };

    const handleConfigSelect = (configId) => {
        fetchConfig(configId);
    };

    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({
            ...prev,
            [name]: value
        }));
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        if (!selectedConfig) {
            setMessage('Please select a configuration first');
            return;
        }

        setIsLoading(true);
        try {
            const response = await fetch(`/api/path/${selectedConfig.id}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    oldRow: parseInt(formData.oldRow),
                    oldCol: parseInt(formData.oldCol),
                    newRow: parseInt(formData.newRow),
                    newCol: parseInt(formData.newCol)
                })
            });

            if (response.ok) {
                setMessage('Position updated successfully');
                // Refresh the configuration to show updated obstacles
                fetchConfig(selectedConfig.id);
            } else {
                const errorText = await response.text();
                setMessage(`Failed to update position: ${errorText}`);
            }
        } catch (error) {
            setMessage(`Error: ${error.message}`);
        } finally {
            setIsLoading(false);
        }
    };

    const formatObstacles = (obstaclesJson) => {
        try {
            const obstacles = JSON.parse(obstaclesJson);
            return obstacles.map(pos => `[${pos[0]},${pos[1]}]`).join(', ');
            // eslint-disable-next-line no-unused-vars
        } catch (error) {
            return obstaclesJson;
        }
    };

    return (
        <div className="container">
            <h1>Path Configuration Editor</h1>

            <div className="configs-section">
                <h2>Available Configurations</h2>
                {isLoading && <p>Loading...</p>}

                {configs.length === 0 ? (
                    <p>No configurations found</p>
                ) : (
                    <div className="config-list">
                        {configs.map(config => (
                            <button
                                key={config.id}
                                onClick={() => handleConfigSelect(config.id)}
                                className={selectedConfig?.id === config.id ? 'selected' : ''}
                            >
                                Config #{config.id}
                            </button>
                        ))}
                    </div>
                )}
            </div>

            {selectedConfig && (
                <div className="selected-config">
                    <h2>Configuration #{selectedConfig.id}</h2>
                    <div className="config-details">
                        <p><strong>Created:</strong> {selectedConfig.createdAt}</p>
                        <p><strong>Obstacles:</strong> {formatObstacles(selectedConfig.obstacles)}</p>
                    </div>

                    <h3>Update Obstacle Position</h3>
                    <form onSubmit={handleSubmit}>
                        <div className="form-group">
                            <h4>Old Position</h4>
                            <div className="input-row">
                                <label>
                                    Row:
                                    <input
                                        type="number"
                                        name="oldRow"
                                        value={formData.oldRow}
                                        onChange={handleInputChange}
                                        required
                                    />
                                </label>
                                <label>
                                    Column:
                                    <input
                                        type="number"
                                        name="oldCol"
                                        value={formData.oldCol}
                                        onChange={handleInputChange}
                                        required
                                    />
                                </label>
                            </div>
                        </div>

                        <div className="form-group">
                            <h4>New Position</h4>
                            <div className="input-row">
                                <label>
                                    Row:
                                    <input
                                        type="number"
                                        name="newRow"
                                        value={formData.newRow}
                                        onChange={handleInputChange}
                                        required
                                    />
                                </label>
                                <label>
                                    Column:
                                    <input
                                        type="number"
                                        name="newCol"
                                        value={formData.newCol}
                                        onChange={handleInputChange}
                                        required
                                    />
                                </label>
                            </div>
                        </div>

                        <button type="submit" disabled={isLoading}>
                            {isLoading ? 'Updating...' : 'Update Position'}
                        </button>
                    </form>
                </div>
            )}

            {message && <div className="message">{message}</div>}
        </div>
    );
}

export default PathUpdateForm;