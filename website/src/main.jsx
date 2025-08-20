import { render } from 'preact'
import './index.css'
import { App } from './page.jsx'
import { Navbar } from "./components/navbar"
import { Footer } from './components/footer.jsx'
render(  
<>
    <Navbar />
    <App />
    <Footer />
</>,
    
    document.getElementById('app'))
