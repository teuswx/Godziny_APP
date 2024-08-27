<!-- ---------------------------------------------------------------------- -->
<!-- HTML                                                                   -->
<!-- ---------------------------------------------------------------------- -->
<template>
    <div class="container py-4">
        <div class="row">
            <div class="col">
                <h2 class="text-secondary">Novo curso</h2>
            </div>
            <div class="h-100 p-5 bg-light border rounded-3">
                <div class="mb-3">
                    <label for="basic-url" class="form-label">Sigla do Curso</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="basic-url"
                            aria-describedby="basic-addon3 basic-addon4">
                    </div>
                </div>
                <div class="mb-3">
                    <label for="basic-url" class="form-label">Nome</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="basic-url"
                            aria-describedby="basic-addon3 basic-addon4">
                    </div>
                </div>
                <div class="mb-3">
                    <label for="basic-url" class="form-label">Carga Horária Complementar Exigida</label>
                    <div class="input-group">
                        <input type="text" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="col d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary text-white">Adicionar</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</template>

<!-- ---------------------------------------------------------------------- -->
<!-- JavaScript                                                             -->
<!-- ---------------------------------------------------------------------- -->
<script setup>
</script>

<!-- ---------------------------------------------------------------------- -->
<!-- CSS                                                                    -->
<!-- ---------------------------------------------------------------------- -->
<style scoped>
* {
    color: #464545;
}
</style>