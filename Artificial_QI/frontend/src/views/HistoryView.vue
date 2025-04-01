<template>
  <main class="container py-4">
    <div class="header mb-4">
      <h1 class="page-title">Storico Test</h1>
    </div>

    <div class="row g-3">
      <div
          class="col-12 col-md-6"
          v-for="test in tests"
          :key="test.id"
          @click="vaiAlDettaglio(test.id)"
      >
        <div class="test-card p-3 shadow-sm h-100">
          <p><strong>Data:</strong> {{ formatDate(test.dataEsecuzione) }}</p>
          <p><strong>Score:</strong> {{ test.score }}/10</p>
          <p><strong>LLM:</strong> {{ test.LLM }}</p>
        </div>
      </div>
    </div>

    <div class="d-flex justify-content-center mt-5" v-if="isLoading">
      <img class="loading" src="@/assets/loading.svg">
    </div>

    <div class="d-flex justify-content-center mt-5" v-if="!isLoading && tests.length === 0">
      <h2>Nessuna test eseguito</h2>
    </div>
  </main>
</template>

<script>
import axios from "axios";

export default {
  name: "HistoryView",
  data() {
    return {
      tests: [],
      isLoading: false,
    };
  },
  mounted() {
    this.caricaStorico();
  },
  methods: {
    async caricaStorico() {
      try {
        this.isLoading = true;
        const response = await axios.get('/risultati'); // Da adattare al backend reale
        this.tests = response.data;
        console.log('Storico test:', this.tests);
        this.isLoading = false;

      } catch (error) {
        this.isLoading = false;
        console.error('Errore nel recupero dello storico:', error);
      }
    },
    formatDate(dataISO) {
      return new Date(dataISO).toLocaleDateString();
    },
    vaiAlDettaglio(testId) {
      this.$router.push({name: 'TestResult', params: {id: testId}});
    },
  },
};
</script>

<style scoped>
.container {
  max-width: 900px;
  margin: auto;
}

.test-card {
  background-color: #1f1f1f;
  border-radius: 12px;
  border: 1px solid #333;
  color: #f5f5f5;
  cursor: pointer;
  transition: transform 0.2s, box-shadow 0.2s;
}

.test-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
  background-color: #2a2a2a;
}

.page-title {
  color: #ffffff;
  font-size: 28px;
  font-weight: bold;
  text-align: center;
}

h2 {
  color: #ffffff;
  font-size: 20px;
  text-align: center;
}
</style>
