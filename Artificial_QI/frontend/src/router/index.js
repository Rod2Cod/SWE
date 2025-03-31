import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import DomandeView from "@/views/DomandeView.vue";
import TestView from "@/views/TestView.vue";
import AggiungiDomanda from "@/views/AggiungiDomanda.vue";
import ModificaDomanda from "@/views/ModificaDomanda.vue";
import HistoryView from "@/views/HistoryView.vue";
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
      component: AggiungiDomanda,
    },
    {
      path: '/editquestion/:id',
      name: 'editquestion',
      component: ModificaDomanda,
    },
    {
      path: '/test',
      name: 'tests',
      component: TestView,
    },
    {
      path: '/history',
      name: 'history',
      component: HistoryView,
    },
    {
      path: '/testresult/:id',
      name: 'TestResult',
      component: TestResultView,
    },


  ],
})

export default router
