<!-- ---------------------------------------------------------------------- -->
<!-- HTML                                                                   -->
<!-- ---------------------------------------------------------------------- -->
<!-- Componente Principal -->
<template>
  <div class="container py-4">
    <div class="row">
      <div class="col">
        <h2 class="text-secondary">Atividades</h2>
      </div>

      <div class="col m-2">
        <div class="text-end">
          <!-- Button trigger modal -->
          <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#atividadePopup"
            @click="showPopup">
            Adicionar atividade
          </button>
          <AdicionarAtividade @atividade-adicionada="atualizarAtividades" />
        </div>
      </div>
    </div>

    <div class="h-100 p-5 bg-light border rounded-3">
      <form class="row justify-content-end">
        <div class="col-auto">
          <label class="text-secondary">Pesquisar tarefa</label>
          <input type="text" class="form-control" placeholder="Pesquisar">
        </div>
        <div class="col-auto">
          <label class="text-secondary">Ativo</label>
          <select class="form-select form-select" aria-label="Small select example">
            <option selected disabled>Selecionar</option>
            <option value="1">categorias</option>
            <option value="2">cursos</option>
            <option value="3">usuarios</option>
          </select>
        </div>
      </form>

      <!-- Listagem das atividades -->
      <div class="row mt-3">
        <!--Se não houver atividades (atividades.length === 0), exibe a mensagem "Não há atividades cadastradas!".-->
        <div class="col" v-if="atividades.length === 0">
          <div class="row text-center">
            <div class="col">
              <h5>Não há atividades cadastradas!</h5>
            </div>
          </div>
        </div>
        <!--Caso contrário, mapeia cada atividade para um componente AtividadeComuns.-->
        <div class="col" v-else>
          <div class="row">
            <div class="col-3 p-3 mt" v-for="(atividade, index) in atividades" :key="index">
              <AtividadeComuns data-bs-toggle="modal" data-bs-target="#exampleModal" v-bind="atividade" />
            </div>
          </div>
        </div>
      </div>
      <!-- Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              ...
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
          </div>
        </div>
      </div>
      <div class="row mt-5 justify-content-end">
        <div class="col-auto">
          <PaginacaoComuns />
        </div>
      </div>
    </div>
  </div>
</template>

<!-- ---------------------------------------------------------------------- -->
<!-- JavaScript                                                             -->
<!-- ---------------------------------------------------------------------- -->
<script setup>
import PaginacaoComuns from '@/components/PaginacaoComuns.vue';
import AdicionarAtividade from '@/components/AdicionarAtividade.vue';
import AtividadeComuns from '@/components/AtividadeComuns.vue';
import { ref, onMounted } from 'vue';
import { Modal } from 'bootstrap';


const myModal = ref(null);
const atividades = ref([]);

onMounted(() => {
  //Inicializa o modal do Bootstrap quando o componente é montado.
  myModal.value = new Modal(document.getElementById('atividadePopup'));

  // Carregar atividades do localStorage se disponíveis  e atualiza a variável atividades.
  const storedAtividades = localStorage.getItem('atividades');
  if (storedAtividades) {
    atividades.value = JSON.parse(storedAtividades);
  }
});

//Exibe o modal quando o botão "Adicionar atividade" é clicado.
const showPopup = () => {
  if (myModal.value) {
    myModal.value.show();
  }
};

const atualizarAtividades = (novaAtividade) => {
  //Adiciona a nova atividade ao array atividades.
  atividades.value.push(novaAtividade);
  //Atualiza o localStorage com as atividades atuais.
  localStorage.setItem('atividades', JSON.stringify(atividades.value));
};
</script>

<!-- ---------------------------------------------------------------------- -->
<!-- CSS                                                                    -->
<!-- ---------------------------------------------------------------------- -->
<style scoped>
* {
  color: #464545;
}
</style>
