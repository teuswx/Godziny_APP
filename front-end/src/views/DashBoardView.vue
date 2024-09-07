<template>
    <div>
      <!-- Título principal do dashboard -->
      <h1>DASHBOARD</h1>
      
      <!-- Subtítulo com o nome do usuário -->
      <h3>Bem vindo {{ nomeUsuario }}</h3>
  
      <!-- Iframe que carrega o dashboard -->
      <iframe id="dashboard" :src="dashboardUrl" width="100%" height="800px"></iframe>
    </div>
  </template>
  
  <script setup>
  import { computed } from 'vue';
  import auth from '../lib/autentication';
  
  // Computa a URL do iframe com base na matrícula do usuário
  const dashboardUrl = computed(() => {
      return `http://127.0.0.1:8050?matricula=${auth.loginGeral.data.usuario.matricula}&tipo=${auth.loginGeral.data.usuario.tipo}&nome=${auth.loginGeral.data.usuario.nome}`;
  });
  
  // Nome do usuário, utilizado no subtítulo
  const nomeUsuario = computed(() => auth.loginGeral.data.usuario.nome);
  </script>
  
  <style scoped>
  /* Estilo para o título e subtítulo */
  h1, h3 {
    color: #333;  /* Cor cinza escuro */
  }
  
  /* Opcional: Centralizar o texto */
  h1 {
    text-align: center;
    font-size: 2em;
    margin-bottom: 20px;
  }
  
  h3 {
    text-align: center;
    margin-bottom: 40px;
    color: #555;  /* Cor cinza suave */
  }
  </style>
  