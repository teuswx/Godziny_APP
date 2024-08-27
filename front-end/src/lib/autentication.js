import axios from "axios";

const loginGeral = {}

async function autenticacaoGlobal(email, senha) {  
    try {
        const loginDTO = {
            email: email,
            senha: senha
        };
        const response = await axios.post("http://localhost:8080/auth/login", loginDTO);
        loginGeral.data = response.data;
        loginGeral.status = response.status;
        loginGeral.headers = response.headers;
    } catch (error) {
        console.error("Erro ao buscar dados:", error);
        throw error; // Lança o erro para ser tratado por quem chamar o método
    }
}
console.log(loginGeral)
export default {
    loginGeral,
    autenticacaoGlobal
}