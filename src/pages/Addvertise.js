import React from 'react';
import './add.css';

const Marketplace = () => {
  return (
    <div className="ad-start">
      <div className="ad-container left">
        <div className="ad-box">
          <a href="destination-url" target="_blank" rel="noopener noreferrer">
            <img src="Machzoirim.jpg" alt="Left Ad" />
          </a>
        </div>
      </div>
      <div className="ad-container right">
        <div className="ad-box">
          <a href="destination-url" target="_blank" rel="noopener noreferrer">
            <img src="megila.webp" alt="Right Ad" />
          </a>
        </div>
      </div>
    </div>
   
   
  );
};


export default Marketplace;