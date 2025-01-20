import {useState} from 'react'
import React from 'react';
import { Routes, Route, Link } from 'react-router-dom';
import '@/assets/App.css'
import Home from '@/views/Home'
import Questions from '@/views/Questions'
import AddQuestion from "@/views/AddQuestion.jsx";

function App() {
    const [count, setCount] = useState(0)




    return (
        <div>
            <nav>
                <Link to="/">Home</Link> | <Link to="/questions">Questions</Link>
            </nav>

            <Routes>
                <Route path="/" element={<Home/>}/>
                <Route path="/questions" element={<Questions/>}/>
                <Route path="/addquestion" element={<AddQuestion/>}/>
            </Routes>
        </div>
    )
}

export default App
