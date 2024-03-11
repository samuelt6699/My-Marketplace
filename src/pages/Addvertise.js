import React from 'react';
import './add.css'

const Marketplace = () => {
  return (
    <>
   
      {/* Ad banner section */}
      <div className="ad-banner">
   
        <div className="ad-container">
          {/* Link wrapping the image */}
          <a href="https://link-to-promotion.com" target="_blank" rel="noopener noreferrer">
            <img src="download.jpg" alt="Ad" style={{ height: '100%', width: 'auto' }} />
          </a>
        </div>
      </div>
      {/* Rest of your page content */}
    </>
  );
};

export default Marketplace;