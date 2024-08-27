<template>
  <div class="card">
      <ul class="list-group list-group-flush">
          <li class="list-group-item"><strong>Título:</strong> {{ tituloAtividade }}</li>
          <li class="list-group-item"><strong>Categoria:</strong> {{ categoriaAtividade }}</li>
          <li class="list-group-item"><strong>Arquivo:</strong> {{ fileName }}</li>
          <li class="list-group-item"><strong>Data e Hora:</strong> {{ formattedDataHora }}</li>
          <li class="list-group-item"><strong>Status:</strong> {{ statusAtividade }}</li>
      </ul>
  </div>
</template>

<script setup>
import { defineProps, computed } from 'vue';

// Recebe os valores via props enviados pelo componente pai
const props = defineProps({
tituloAtividade: {
  type: String,
  required: true
},
categoriaAtividade: {
  type: String,
  required: true
},
file: {
  type: Object, // Use Object para aceitar File
  required: true
},
dataHora: {
  type: [String, Date], // Aceita String ou Date
  required: true
},
statusAtividade: {
  type: String,
  required: true
},
});

// Computed para extrair o nome do arquivo
const fileName = computed(() => {
return props.file ? props.file.name : 'Nenhum arquivo selecionado';
});

// Computed para formatar a data e hora
const formattedDataHora = computed(() => {
if (!props.dataHora) return 'Data e hora não especificadas';
const date = new Date(props.dataHora);
return date.toLocaleString(); // Formata a data e hora conforme as configurações locais
});
</script>

<style scoped>
.card {
margin: 1rem;
}
.list-group-item {
font-size: 1rem;
}
</style>
