import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import styles from './Header.module.css';

const Header = () => {
  const [searchItem, setSearchItem] = useState('');

  const handleSearchChange = (e) => {
    setSearchItem(e.target.value);
  };

  const handleSearchSubmit = (e) => {
    e.preventDefault();
    // You would typically handle the search term here, perhaps redirecting to a search page or filtering products
    console.log(`Searching for: ${searchItem}`);
  };
  
  return (
    <header className={styles.header}>
      <div className={styles.logo}>
        <Link to="/HomePage">MyMarketplace</Link>
      </div>
    
      <div className={styles.searchBar}>
        <form onSubmit={handleSearchSubmit}>
          <input
            type="text"
              value={searchItem}
            onChange={handleSearchChange}
            placeholder="Search for products..."
          />
          <button type="submit">Search</button>
        </form>
      </div>
      
      <div className={styles.userActions}>
        <Link to="/about">About Us</Link>
        <Link to="/contact">Contact</Link>
        <Link to="/cart">Cart</Link>
        <Link to="/account">Account</Link>
      </div>
    </header>
  );
};

export default Header;