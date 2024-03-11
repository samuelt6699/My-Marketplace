import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import HomePage from './pages/HomePage';


function App() {
  return (
    <Router>
      
      <Routes> {/* Wrap your Route elements in a Routes component */}
        <Route path="/" element={<HomePage />} />
        {/* other route definitions */}
      </Routes>
    </Router>
  );
}

export default App;