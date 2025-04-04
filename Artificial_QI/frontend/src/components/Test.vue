<script>

import axios from "axios";
import DomandaPopup from "@/components/PopupRisultatoDomandaSingola.vue";


export default {
  name: "Test",
  props: {
    test: Object,
  },
  components: {
    DomandaPopup,
  },
  methods: {
    async risultatoSingolaDomanda(id) {
      try {

        const response =  await axios.get('/risultatiDomanda/' + id);

        this.domandaSelezionata = response.data;
        this.showPopup = true;

      } catch (error) {
        this.showPopup = false;
        console.error("Errore durante il recupero della domanda:", error);
      }


    },
    closePopup() {
      this.showPopup = false;
      this.domandaSelezionata = null;
    }
  },
  data() {
    return {
      domandaSelezionata: null,
      showPopup: false,
    };
  },
  mounted() {

  }
};


</script>

<template>
  <div class="test-card">
    <h2 class="test-title">Test del {{ test.dataEsecuzione }}</h2>

    <p class="test-info"><strong>Modello LLM:</strong> {{ test.llmUsed }}</p>
    <p class="test-info"><strong>Punteggio Totale:</strong> {{ parseFloat((test.score * 10).toFixed(2)) }}/10</p>

    <h3 class="section-title">Risultati del Test</h3>
    <div class="question-list">
      <div v-for="(question, index) in test.risultatiDomande" :key="index" class="question-item" @click="risultatoSingolaDomanda(question.id)">
        <p class="question-text"><strong>Domanda:</strong> {{ question.domanda }}</p>
        <p class="question-text" ><strong>Punteggio:</strong> {{ parseFloat((question.score * 10).toFixed(2)) }}</p>
      </div>
    </div>
  </div>


  <DomandaPopup
      v-if="showPopup"
      :domanda="domandaSelezionata"
      @close="closePopup"
  />
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

.question-text{
  color: #ddd;
  font-size: 1rem;
  margin-bottom: 5px;
}
</style>
