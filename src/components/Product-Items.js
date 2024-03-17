import React from 'react';
import '../static/Products.css';

const Product = () => {
  return (
    <li className="productItem">
      <div className="productImage">
        <img className="image" alt="Product Name" src="megila.webp" />
      </div>
      <div>
        <div>מגילה האלטערס פאר פורים</div>
        <div>Product Description</div>
        <div><b>$59.81</b></div>
        <div className="plus">+</div>
        <div><b>1</b></div>
        <div className="minus">-</div>
      </div>
    </li>
  );
};

export default Product;