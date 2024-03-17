import React from 'react';
import './add.css';

const Marketplace = () => (
  <>
    <div className="ad-start">
      <div className="ad-container left">
        <a href="destination-url" target="_blank" rel="noopener noreferrer">
          <img src="Machzoirim.jpg" alt="Left Ad" />
        </a>
      </div>
      <h1 className="ad-heading">You Can Place Your Ad Here Below</h1>
      <div className="ad-container right">
        <a href="destination-url" target="_blank" rel="noopener noreferrer">
          <img src="Machzoirim.jpg" alt="Right Ad" />
        </a>
      </div>
    </div>
  </>
);

export default Marketplace;


/*import React from 'react';
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
      <h1 style={{width : " 35rem", textAlign : "center"}} >You Can Place Youe Ad Here Bellow </h1>
      <div className="ad-container right">
        <div className="ad-box">
          <a href="destination-url" target="_blank" rel="noopener noreferrer">
            <img src="Machzoirim.jpg" alt="Right Ad" />
          </a>
        </div>
      </div>
    </div>
   
   
  );
};


export default Marketplace;*/