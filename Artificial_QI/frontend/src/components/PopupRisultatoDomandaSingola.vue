<!-- components/DomandaPopup.vue -->
<template>
  <div class="popup-overlay">
    <div class="popup-content">
      <span class="close-button" @click="$emit('close')">✖</span>
      <p><strong>Domanda:</strong> {{ domanda.domanda }}</p>
      <p><strong>Risposta Attesa:</strong> {{ domanda.risposta }}</p>
      <p><strong>Risposta del LLM:</strong> {{ domanda.rispostaLLM }}</p>
      <p><strong>Punteggio:</strong> {{ parseFloat((domanda.score * 10).toFixed(2)) }}/10</p>
      <div v-if="domanda.metriche && Object.keys(domanda.metriche).length">
        <p><strong>Metriche:</strong></p>
        <ul>
          <li v-for="(val, name) in domanda.metriche" :key="name">
            <strong>{{ name }}:</strong> {{ Number(val.toPrecision(2)) }}
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'DomandaPopup',
  props: {
    domanda: Object
  },
  mounted() {
    console.log(this.domanda)
  }
};
</script>

<style scoped>

.popup-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: rgba(0, 0, 0, 0.8);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999; /* molto alto per stare sopra tutto */
}

.popup-content {
  background: #222;
  padding: 25px;
  border-radius: 12px;
  width: 90%;
  max-width: 600px;
  color: white;
  position: relative;
  box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
  max-height: 90vh;
  overflow-y: auto;
}

.close-button {
  position: absolute;
  top: 12px;
  right: 15px;
  cursor: pointer;
  font-size: 1.4rem;
  color: #fff;
  background: none;
  border: none;
}

</style>
