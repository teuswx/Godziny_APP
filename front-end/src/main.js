import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import 'aos/dist/aos.css'; // Importa o CSS do AOS
import AOS from 'aos';
import VueSweetalert2 from 'vue-sweetalert2';


// Importa o CSS do Bootstrap
import 'bootstrap/dist/css/bootstrap.min.css';
// Importa o JavaScript do Bootstrap
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'sweetalert2/dist/sweetalert2.min.css';
// Importa o CSS principal
import '../src/assets/main.css';

// Inicializa o AOS
AOS.init({
    duration: 1200, // Duração da animação
    easing: 'ease-in-out', // Tipo de easing
    once: true // Anima apenas uma vez
});

// Cria a instância do aplicativo Vue e configura os plugins
const app = createApp(App);
app.use(router);
app.use(VueSweetalert2);
app.mount('#app');
