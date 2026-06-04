// src/App.tsx

import './App.css';

function App() {
  return (
    <div className="container">
      <h1>Blue-Green Deployment Active</h1>
      
      {/* The Blue Deployment Indicator */}
      <div className="box blue-deployment">
        <p>CURRENT VERSION: GREENN</p>
      </div>

      <footer className="footer">
        <p>Designed by Atunde Peter</p>
      </footer>
    </div>
  );
}

export default App;