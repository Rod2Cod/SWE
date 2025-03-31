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
          <p><strong>Data:</strong> {{ formatDate(test.data) }}</p>
          <p><strong>Score:</strong> {{ test.score }}/10</p>
          <p><strong>LLM:</strong> {{ test.llm }}</p>
          <p><strong>Nome Set:</strong> {{ test.nomeSet }}</p>
        </div>
      </div>
    </div>

    <p v-if="tests.length === 0" class="mt-4 text-white">Nessun test completato trovato.</p>
  </main>
</template>

<script>
export default {
  name: "HistoryView",
  data() {
    return {
      tests: [],
    };
  },
  mounted() {
    this.caricaStorico();
  },
  methods: {
    async caricaStorico() {
      try {
        const response = await fetch('/api/test/history'); // Da adattare al backend reale
        const data = await response.json();
        this.tests = data;
      } catch (error) {
        this.tests = [
          { id: 1, data: "2025-03-26T18:30:00.000Z", score: 8.6, llm: "OLLama 3", nomeSet: "All" },
          { id: 2, data: "2025-03-27T10:00:00.000Z", score: 10, llm: "GPT-4", nomeSet: "All" }
        ]
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
</style>
