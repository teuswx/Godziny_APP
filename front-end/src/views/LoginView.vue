<template>
  <AlertaComuns :msgError="msgError" class="alert-comuns" v-if="alertaLogin" data-aos="fade-down" data-aos-duration="300"/>
  <div class="d-flex align-items-center py-4 h-100">
    <main class="w-100 m-auto form-container">
      <form>
        <div class="row mb-4">
          <div class="col-12 d-flex justify-content-center">
            <img src="../assets/godfinal.png" class="mb-4" height="80" width="110" alt="Logo" />
          </div>
          <div class="col-12 d-flex justify-content-center">
            <label >Godziny APP</label >
          </div>
        </div>

        <div class="row h-100 p-3 bg-light border rounded-3">
          <div class="col">
            <h1 class="h4 mb-3 fw-normal">Entrar no sistema</h1>
            <div class="form-floating mb-3">
              <input type="email" class="form-control" id="floatingInput" placeholder="your-email@gmail.com"
                v-model="email" required />
              <label for="floatingInput">Email</label>
            </div>
            <div class="form-floating mb-3">
              <input type="password" class="form-control" id="floatingPassword" placeholder="your-password"
                v-model="senha" required />
              <label for="floatingPassword">Senha</label>
            </div>
            <div class="form-check text-start my-3">
              <input type="checkbox" class="form-check-input" id="flexCheckDefault" />
              <label class="form-check-label" for="flexCheckDefault">Lembrar senha</label>
            </div>
              <button type="button" :disabled="estadoBotao" class="btn btn-primary w-100 py-2 text-white"
                @click=" fazerLogin();">Entrar</button>
          </div>
        </div>
      </form>
    </main>
  </div>
</template>

<script setup>
import { ref, defineEmits, watch} from 'vue';
import { useRouter } from 'vue-router'; // Importar o roteador
import auth from '../lib/autentication';
import AlertaComuns from '@/components/AlertaComuns.vue';

// Lógica para fazer a requisição do backend e definir os valores do objeto como login geral
const email = ref('');
const senha = ref('');
const alertaLogin = ref(false)
const router = useRouter();
const msgError = ref('');
const estadoBotao = ref(true);

// Observa as mudanças nos campos de email e senha para habilitar/desabilitar o botão
watch([email, senha], () => {
  estadoBotao.value = !email.value || !senha.value;
});

const fazerLogin = async () => {
  try {
    let loginResponse = await auth.autenticacaoGlobal(email.value, senha.value);
    console.log('Login bem-sucedido:', loginResponse);
    router.push({ name: 'perfil' });
    toggleActive();
    // Lógica adicional após login bem-sucedido
  } catch (error) {
    console.error('Erro ao fazer login:', error.response.status);
    msgError.value = error.response.data.detail;
    //Altera a exibição do componente de Alerta 
    alertaLogin.value = true
    setTimeout(() => {
      alertaLogin.value = false;
    }, 3000);
    // Lógica para tratar o erro
  }
};

// Estado para controlar o ativo
const isActive = ref(false);

// Emitir evento para o pai
const emit = defineEmits(['update-is-active']);
const toggleActive = () => {
  isActive.value = !isActive.value;
  emit('update-is-active', isActive.value);
};
</script>

<style scoped>
.form-container {
  max-width: 370px;
  padding: 1rem;
}
.alert-comuns{
  position: fixed;

}

* {
  color: #464545;
}
</style>
