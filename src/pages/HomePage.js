import Header from "../components/Header";
import Marketplace from "./Addvertise";
import CategoriesHead from "./CategoriesHead";

import Products from "../components/Products";
const HomePage = () => {
  return (
    <div>
      <Header/>
      <CategoriesHead/>
      <Marketplace/>
      <Products/>
    </div>
  );
};

export default HomePage;