<!-- ---------------------------------------------------------------------- -->
<!-- HTML                                                                   -->
<!-- ---------------------------------------------------------------------- -->
<template>
  <!--Estrutura básica de uma classe modal, dentro dela se encontra um formulário com seus respectivos campos.
    Cada campo está ligado a uma variável do Vue usando v-model. Quando o formulário é submetido, ele chama a 
    função adicionarAtividade definida no script. O modificador prevent no evento submit impede a recarga da página.-->

  <div class="modal fade" id="atividadePopup" tabindex="-1" aria-labelledby="atividadePopupLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="atividadePopupLabel">Adicionar Atividade</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body text-start">
          <form @submit.prevent="adicionarAtividade">
            <div class="mb-3">
              <label for="sigla" class="form-label">Título da Atividade</label>
              <input type="text" id="sigla" v-model="tituloAtividade" class="form-control" required>
            </div>
            <div class="mb-3">
              <label for="nome" class="form-label">Categoria da Atividade </label>
              <select class="form-select form-select" aria-label="Small select example" v-model="categoriaAtividade">
                <option selected disabled>Selecionar</option>
                <option value="1">categorias</option>
                <option value="2">cursos</option>
                <option value="3">usuarios</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="formFile" class="form-label">Escolher arquivo</label>
              <input class="form-control" type="file" id="formFile"  @change=mudancaArquivo>
            </div>
            <div class="mb-3">
                <label for="dataHora" class="form-label">Data e Hora</label>
                <input type="datetime-local" id="dataHora" class="form-control" name="dataHora"  v-model="dataHora" required>
            </div>
            <div class="mb-3">
              <label for="sigla" class="form-label">Status da Atividade</label>
              <input type="text" id="sigla" v-model="statusAtividade" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Adicionar</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
  
  <!-- ---------------------------------------------------------------------- -->
  <!-- JavaScript                                                             -->
  <!-- ---------------------------------------------------------------------- -->
  <script setup>
  import { ref, defineEmits } from 'vue';
  import { Modal } from 'bootstrap';
  
  const tituloAtividade = ref('');
  const categoriaAtividade = ref('');
  const file = ref(null);
  const dataHora = ref(null);
  const statusAtividade = ref('');


  /* defineEmits é usado para definir um evento customizado chamado atividade-adicionada. Este evento será.
  emitido quando uma nova atividade for adicionada.*/
  const emit = defineEmits(['atividade-adicionada']);
  

  const mudancaArquivo = (event) =>{
    const selectedFile = event.target.files[0];
    if(selectedFile){
      file.value = selectedFile;
    }
  }
  const adicionarAtividade = () => {
    //Cria um novo objeto novaAtividade usando os valores dos campos do formulário.
    const novaAtividade = {
      tituloAtividade: tituloAtividade.value,
      categoriaAtividade: categoriaAtividade.value,
      file: file.value,
      dataHora: dataHora.value,
      statusAtividade: statusAtividade.value
    };
  console.log(novaAtividade);
    // Emite o evento atividade-adicionada com o novo objeto.
    emit('atividade-adicionada', novaAtividade);
  
    // Fechar o modal após adicionar.
    const modalElement = document.getElementById('atividadePopup');
    const modal = Modal.getInstance(modalElement) || new Modal(modalElement);
    modal.hide();
  
    // Limpar campos.
    tituloAtividade.value = '';
    categoriaAtividade.value = '';
    file.value = null;
    dataHora.value = null;
    statusAtividade.value = '';
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
  