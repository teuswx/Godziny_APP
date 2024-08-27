<!-- ---------------------------------------------------------------------- -->
<!-- HTML                                                                   -->
<!-- ---------------------------------------------------------------------- -->
<template>
  <div class="d-flex align-items-center py-4  h-100">
    <main class="w-100 m-auto form-container">
      <form>
        <h1 class="h3 mb-3 fw-normal text-center">Atualizar Dados</h1>
        <div class="form-floating mb-3">
          <input type="password" class="form-control" id="floatingInput" v-model="novaSenha" />
          <label for="floatingInput">Nova senha</label>
        </div>
        <div class="form-floating mb-3">
          <input type="password" class="form-control" id="floatingPassword" v-model="confirmarNovaSenha" />
          <label for="floatingPassword">Confirmar senha</label>
        </div>
        <RouterLink to="/perfil">
          <button type="button" class="btn btn-primary w-100 py-2 text-white" @click="confirmarMudancas">Confirmar
            Mudanças</button>
        </RouterLink>
      </form>
    </main>
  </div>
</template>

<!-- ---------------------------------------------------------------------- -->
<!-- JavaScript                                                             -->
<!-- ---------------------------------------------------------------------- -->
<script setup>
import { ref } from 'vue';
import axios from "axios";
import auth from '../lib/autentication';
const novaSenha = ref('');
const confirmarNovaSenha = ref('');


const confirmarMudancas = async () => {
  if (novaSenha.value === confirmarNovaSenha.value) {
    try {
      const createdAt = new Date(auth.loginGeral.data.usuario.createdAt);
      console.log(createdAt)
      const updateDTO = {
        matricula: auth.loginGeral.data.usuario.matricula,
        cursoSigla: auth.loginGeral.data.usuario.curso.sigla,
        nome: auth.loginGeral.data.usuario.nome,
        email: auth.loginGeral.data.usuario.email,
        senha: novaSenha.value,
        tipo: auth.loginGeral.data.usuario.tipo,
        createdAt: createdAt.toISOString(), // Usando toISOString para formato ISO
      };

      console.log(updateDTO)
      const response = await axios.put(
        `http://localhost:8080/usuario/${auth.loginGeral.data.usuario.matricula}`,
        updateDTO,
        {
          headers: {
            Authorization: `Bearer ${auth.loginGeral.data.token}`
          }
        }
      );
      console.log('atualização realizado com sucesso', response)

      novaSenha.value = '';
      confirmarNovaSenha.value = '';

    } catch (error) {
      console.error("Erro ao buscar dados:", error);
      throw error; // Lança o erro para ser tratado por quem chamar o método
    }
  } else {
    console.log('Erro na confirmação da senha');
  }
}


</script>

<!-- ---------------------------------------------------------------------- -->
<!-- CSS                                                                    -->
<!-- ---------------------------------------------------------------------- -->
<style scoped>
.form-container {
  max-width: 350px;
  padding: 1rem;
}

* {
  color: #464545;
}
</style>
