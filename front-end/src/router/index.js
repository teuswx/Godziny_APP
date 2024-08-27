import { createRouter, createWebHistory } from 'vue-router'
import LoginView from '@/views/LoginView.vue'

const routes = [
  {
    path: '/',
    name: 'login',
    component: LoginView
  },
  {
  path: '/perfil',
    name: 'perfil',
    component: () => import('@/views/ProfileView.vue')
  },
  {
  path: '/dashboard',
    name: 'dashboard',
    component: () => import('../views/DashBoardView.vue')
  },
  {
  path: '/atividade',
    name: 'atividade',
    component: () => import('../views/PesquisarAtividade.vue')
  },
  {
    path: '/categorias',
    name: 'categorias',
    component: () => import('../views/CategoriasView.vue')
  },
  {
    path: '/usuarios',
    name: 'usuarios',
    component: () => import('../views/UsuariosView.vue')
  },
  {
    path: '/cursos',
    name: 'cursos',
    component: () => import('../views/CursosView.vue')
  }

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
