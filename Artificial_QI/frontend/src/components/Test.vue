<script>
export default {
  name: "Test",
  props: {
    test: Object,
  },
  methods: {
    risultatoSingolaDomanda(id) {
      console.log("QUII")
    },
  },
  mounted() {

  }
};


/*

<div v-for="(question, index) in test.questions" :key="index" class="question-item">
        <p class="question-text"><strong>Domanda:</strong> {{ question.text }}</p>
        <p class="expected-answer"><strong>Risposta Attesa:</strong> {{ question.expectedAnswer }}</p>
        <p class="llm-response"><strong>Risposta del LLM:</strong> {{ question.llmResponse }}</p>
        <p class="score"><strong>Punteggio:</strong> {{ question.score }}</p>
        <div v-if="question.metrics && Object.keys(question.metrics).length" class="question-metrics">
          <p class="metric-title">Metriche:</p>
          <ul class="metrics-list">
            <li v-for="(val, metricName) in question.metrics" :key="metricName">
              <strong>{{ metricName }}:</strong> {{ val }}
            </li>
          </ul>
        </div>
      </div>

 */
</script>

<template>
  <div class="test-card">
    <h2 class="test-title">Test del {{ test.dataEsecuzione }}</h2>

    <p class="test-info"><strong>Modello LLM:</strong> {{ test.llmUsed }}</p>
    <p class="test-info"><strong>Punteggio Totale:</strong> {{ test.score }}/10</p>

    <h3 class="section-title">Risultati del Test</h3>
    <div class="question-list">
      <div v-for="(question, index) in test.risultatiDomande" :key="index" class="question-item" @click="risultatoSingolaDomanda">
        <p class="question-text"><strong>Domanda:</strong> {{ question.domanda }}</p>
        <p class="question-text"><strong>Punteggio:</strong> {{ question.score }}</p>
      </div>
    </div>
  </div>
</template>

<style scoped>
.test-card {
  background-color: #222;
  padding: 20px;
  border-radius: 10px;
}

.test-title {
  font-size: 1.5rem;
  font-weight: bold;
  color: white;
  margin-bottom: 10px;
}

.section-title {
  font-size: 1.3rem;
  font-weight: bold;
  margin-top: 20px;
  color: white;
}

.test-info {
  font-size: 1rem;
  color: #ccc;
  margin-bottom: 5px;
}

.question-list {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.question-item {
  padding: 15px;
  border-radius: 8px;
  background: #333;
}

.question-text,
.expected-answer,
.llm-response,
.score {
  color: #ddd;
  font-size: 1rem;
  margin-bottom: 5px;
}

/* METRICHE */
.question-metrics {
  margin-top: 10px;
}

.metric-title {
  color: #aaa;
  font-weight: 600;
  margin-bottom: 5px;
}

.metrics-list {
  list-style: none;
  padding-left: 0;
  color: #f0f0f0;
}

.metrics-list li {
  margin-bottom: 4px;
  font-size: 0.95rem;
}
</style>
