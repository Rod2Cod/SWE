import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap';


import axios from 'axios'
axios.defaults.baseURL = 'http://localhost:5000'
//axios.defaults.baseURL = 'http://backend:5000'

const app = createApp(App)

app.config.globalProperties.$vResult = "view"



app.use(router)
app.mount('#app')
