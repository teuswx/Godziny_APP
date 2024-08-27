<template>
   <iframe id="dashboard" :src="dashboardUrl" width="100%" height="800px"></iframe>
</template>

<script setup>
import { computed } from 'vue';
import auth from '../lib/autentication';

// Computa a URL do iframe com base na matrícula do usuário
const dashboardUrl = computed(() => {
    return `http://127.0.0.1:8050?matricula=${auth.loginGeral.data.usuario.matricula}&tipo=${auth.loginGeral.data.usuario.tipo}`;
});
</script>

<style scoped>
</style>
