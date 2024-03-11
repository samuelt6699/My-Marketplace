import { Link } from 'react-router-dom';
import styles from './Categories.module.css';
const CategoriesHead = ()=>{
  return <div>
    <header>
      <div className={styles.Categories}>
      <div className={styles.Category}><Link to="/">Hello World</Link></div>
      <div className={styles.Category}><Link to="/">Hello World</Link></div>
      <div className={styles.Category}><Link to="/">Hello World</Link></div>
      <div className={styles.Category}><Link to="/">Hello World</Link></div>
      <div className={styles.Category}><Link to="/">Hello World</Link></div>
      <div className={styles.Category}><Link to="/">Hello World</Link></div>
      <div className={styles.Category}><Link to="/">Hello World</Link></div>
      <div className={styles.Category}><Link to="/">Hello World</Link></div>
      <div className={styles.Category}><Link to="/">Hello World</Link></div>
      <div className={styles.Category}><Link to="/">Hello World</Link></div>
      <div className={styles.Category}><Link to="/">Hello World</Link></div>
     

      </div>
    </header>
  </div>
}
export default CategoriesHead;