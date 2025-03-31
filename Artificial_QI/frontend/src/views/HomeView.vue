<template>
  <main class="container">

    <section class="hero">
      <div class="hero-overlay"></div>
      <div class="hero-content">
        <h1>Artifial QI</h1>
        <p>Valutiamo l'intelligenza artificiale, un confronto tra ciò che dice e ciò che ci aspettiamo.</p>
        <button class="cta-btn" @click="goToQuestion()">Scopri di più</button>
      </div>
    </section>

    <section class="features">
      <h2>Come funziona?</h2>
      <div class="features-grid">
        <div class="feature-card">
          <IonIcon :icon="chatbubblesOutline" class="feature-icon"></IonIcon>
          <h3>Analizza le Risposte</h3>
          <p>Il sistema confronta le risposte dei modelli LLM con le risposte attese.</p>
        </div>

        <div class="feature-card">
          <IonIcon :icon="analyticsOutline" class="feature-icon"></IonIcon>
          <h3>Valutazione Intelligente</h3>
          <p>Usiamo metriche avanzate per assegnare un punteggio alla qualità delle risposte.</p>
        </div>

        <div class="feature-card">
          <IonIcon :icon="trophyOutline" class="feature-icon"></IonIcon>
          <h3>Ottimizzazione</h3>
          <p>Fornisci feedback per migliorare le prestazioni dei modelli AI.</p>
        </div>
      </div>
    </section>
  </main>
</template>

<script>
import { IonIcon } from "@ionic/vue";
import { chatbubblesOutline, analyticsOutline, trophyOutline } from "ionicons/icons";

export default {
  name: "HomeView",
  components: {
    IonIcon
  },
  data() {
    return {
      chatbubblesOutline,
      analyticsOutline,
      trophyOutline
    };
  },
  methods: {
    goToQuestion() {
      this.$router.push("/questions");
    }
  }
};


</script>

<style scoped>

.container {
  max-width: 1200px;
  margin: auto;
  padding: 20px;
  text-align: center;
}

.hero {
  position: relative;
  width: 100%;
  height: 400px;
  background: url('@/assets/homeBg.webp') no-repeat center center/cover;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  border-radius: 30px;

}

.hero-overlay {
  position: absolute;
  border-radius: 30px;
  width: 100%;
  height: 100%;
  background: linear-gradient(to bottom, rgba(0, 0, 0, 0.7) 20%, rgba(0, 0, 0, 0.4) 50%, rgba(0, 0, 0, 0.7) 100%);
}

.hero-content {
  position: relative;
  z-index: 1;
  text-align: center;
}

.hero h1 {
  font-size: 2.8rem;
  text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
}

.hero p {
  font-size: 1.2rem;
  margin: 15px 0;
  text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
}

.cta-btn {
  background-color: white;
  color: black;
  padding: 12px 20px;
  font-size: 16px;
  border-radius: 5px;
  border: none;
  cursor: pointer;
  transition: 0.3s;
}

.cta-btn:hover {
  background-color: #ddd;
}

.features {
  padding: 50px 0;
}

.features h2 {
  font-size: 2rem;
  margin-bottom: 30px;
  color: #ffffff;
}

.features-grid {
  display: flex;
  justify-content: center;
  gap: 20px;
}

.feature-card {
  background: #222;
  padding: 20px;
  border-radius: 10px;
  text-align: center;
  width: 250px;
}

.feature-icon {
  font-size: 40px;
  color: #4CAF50;
  margin-bottom: 10px;
}

.feature-card h3 {
  font-size: 1.5rem;
  color: #ffffff;
}

.feature-card p {
  font-size: 1rem;
  color: #ccc;
}

.cta-section h2 {
  font-size: 2rem;
  margin-bottom: 20px;
  color: #ffffff;
}
</style>
