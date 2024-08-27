<template>
  <div class="d-flex align-items-center py-4  h-100">
    <main class="w-100 m-auto form-container">
      <form>
        <img src="" class="mb-4" height="57" width="72" alt="Logo"/>
        <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
        <div class="form-floating mb-3">
          <input type="email" class="form-control" id="floatingInput" placeholder="your-email@gmail.com"/>
          <label for="floatingInput">Email address</label>
        </div>
        <div class="form-floating mb-3">
          <input type="password" class="form-control" id="floatingPassword" placeholder="your-password"/>
          <label for="floatingPassword">Password</label>
        </div>
        <div class="form-check text-start my-3">
          <input type="checkbox" class="form-check-input" id="flexCheckDefault"/>
          <label class="form-check-label" for="flexCheckDefault">Remember me</label>
        </div>
          <button type="button" class="btn btn-primary w-100 py-2">Sign sssin</button>
      </form>
    </main>
  </div>
</template>

<script setup>

// Por enquanto, não há script necessário para essa parte do formulário.
</script>

<style scoped>
.form-container {
  max-width: 350px;
  padding: 1rem;
}

* {
  color: #464545;
}
</style>
