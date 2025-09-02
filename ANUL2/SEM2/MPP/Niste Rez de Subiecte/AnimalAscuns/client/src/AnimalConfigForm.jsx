// AnimalConfigForm.jsx
import { useState } from "react"
import "./AnimalConfigForm.css"

export default function AnimalConfigForm() {
    const [formData, setFormData] = useState({
        row: "", column: "", animalName: "", imageUrl: ""
    })
    const [status, setStatus] = useState("")

    const handleSubmit = async (e) => {
        e.preventDefault()
        setStatus("")
        try {
            const res = await fetch("http://localhost:1234/api/configurations", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    row: parseInt(formData.row),
                    column: parseInt(formData.column),
                    animalName: formData.animalName,
                    imageUrl: formData.imageUrl
                })
            })
            if (res.ok) {
                const id = await res.json()
                setStatus(`Created! ID: ${id}`)
                setFormData({ row: "", column: "", animalName: "", imageUrl: "" })
            } else {
                setStatus("Failed to create")
            }
        } catch {
            setStatus("Network error")
        }
    }

    return (
        <div className="form-container">
            <h1 className="form-title">Configuration</h1>
            <form className="form" onSubmit={handleSubmit}>
                <div className="form-group">
                    <label>Row</label>
                    <input
                        type="number"
                        value={formData.row}
                        onChange={e => setFormData({ ...formData, row: e.target.value })}
                        required
                    />
                </div>
                <div className="form-group">
                    <label>Column</label>
                    <input
                        type="number"
                        value={formData.column}
                        onChange={e => setFormData({ ...formData, column: e.target.value })}
                        required
                    />
                </div>
                <div className="form-group">
                    <label>Animal Name</label>
                    <input
                        type="text"
                        value={formData.animalName}
                        onChange={e => setFormData({ ...formData, animalName: e.target.value })}
                        required
                    />
                </div>
                <div className="form-group">
                    <label>Image URL</label>
                    <input
                        type="url"
                        value={formData.imageUrl}
                        onChange={e => setFormData({ ...formData, imageUrl: e.target.value })}
                        required
                    />
                </div>
                <button type="submit" className="form-button">Submit</button>
            </form>
            {status && (
                <p className={`status ${status.startsWith("Created") ? "success" : "error"}`}>
                    {status}
                </p>
            )}
        </div>
    )
}
