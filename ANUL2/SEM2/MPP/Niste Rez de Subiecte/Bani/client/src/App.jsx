// client/src/App.jsx
import { useState } from 'react'
import './App.css'
import ConfigForm from './ConfigForm'

function App() {
    return (
        <div className="container">
            <header>
                <h1>Game Configuration Tool</h1>
            </header>
            <main>
                <ConfigForm />
            </main>
        </div>
    )
}

export default App