import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import DomandeView from "@/views/DomandeView.vue";
import TestView from "@/views/TestView.vue";
import AggiungiDomandaView from "@/views/AggiungiDomandaView.vue";
import ModificaDomandaView from "@/views/ModificaDomandaView.vue";
import StoricoView from "@/views/StoricoView.vue";
import TestResultView from "@/views/TestResultView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
    },
    {
      path: '/questions',
      name: 'questions',
      component: DomandeView,
    },
    {
      path: '/addquestion',
      name: 'addquestion',
      component: AggiungiDomandaView,
    },
    {
      path: '/editquestion/:id',
      name: 'editquestion',
      component: ModificaDomandaView,
    },
    {
      path: '/test',
      name: 'tests',
      component: TestView,
    },
    {
      path: '/history',
      name: 'history',
      component: StoricoView,
    },
    {
      path: '/testresult/:id',
      name: 'TestResult',
      component: TestResultView,
    },


  ],
})

export default router
