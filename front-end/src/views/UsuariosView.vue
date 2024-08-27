<!-- ---------------------------------------------------------------------- -->
<!-- HTML                                                                   -->
<!-- ---------------------------------------------------------------------- -->
<template>
        <div class="container py-4">
        <div class="row">
            <div class="col">
                <h2 class="text-secondary">Novo usuário</h2>
            </div>
            <div class="h-100 p-5 bg-light border rounded-3">
                <form>
                    <div class="mb-3">
                        <label for="username" class="form-label">Nome</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="username"
                                aria-describedby="usernameHelp" required minlength="3" maxlength="100">
                        </div>
                        <div class="form-text">Mínimo de 3 caracteres e máximo de 100 caracteres.</div>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <div class="input-group">
                            <input type="email" class="form-control" id="email"
                                aria-describedby="emailHelp" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Senha</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="password" required>
                        </div>
                    </div>
                    <div class="col-auto mb-3">
                        <label>Tipo de Usuário</label>
                        <select class="form-select" aria-label="Tipo de Usuário" v-model="userType" required>
                            <option selected disabled>Selecionar</option>
                            <option value="aluno">Aluno</option>
                            <option value="admin">Administrador/Professor</option>
                        </select>
                    </div>
                    <div class="col-auto mb-3">
                        <label>Curso</label>
                        <select class="form-select" aria-label="Curso" id="courseSelect" :disabled="userType !== 'aluno'" required>
                            <option selected disabled>Selecionar</option>
                            <option value="computacao">Computação</option>
                            <option value="mecatronica">Mecatrônica</option>
                        </select>
                    </div>
                    <div class="row">
                        <div class="col d-flex justify-content-end">
                            <button type="submit" class="btn btn-primary text-white">Adicionar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<!-- ---------------------------------------------------------------------- -->
<!-- JavaScript                                                             -->
<!-- ---------------------------------------------------------------------- -->
<script setup>
import { ref } from 'vue';

const userType = ref('');

</script>

<!-- ---------------------------------------------------------------------- -->
<!-- CSS                                                                    -->
<!-- ---------------------------------------------------------------------- -->
<style scoped>
* {
    color: #464545;
}
</style>