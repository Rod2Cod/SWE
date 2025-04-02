<template>
  <main class="container">
    <h1 class="page-title">Esegui un Test</h1>

    <div class="spacer"></div>

    <button v-if="!testStarted && !testCompleted" class="start-btn" @click="startTest">
      Inizia Test
    </button>

    <div v-if="testStarted && !testCompleted" class="progress-container">
      <p>Test in esecuzione... ({{ progress }}%)</p>
      <div class="progress-bar">
        <div class="progress-fill" :style="{ width: progress + '%' }"></div>
      </div>
    </div>

    <div v-if="testCompleted" class="test-results">
      <h2 class="results-title">Test Completato!</h2>
      <button class="start-btn" @click="goToResult">
        Vai al risultato!
      </button>
    </div>
  </main>
</template>

<script>
import axios from "axios"; // Assicurati che axios sia installato

export default {
  name: "TestView",
  data() {
    return {
      testStarted: false,
      testCompleted: false,
      progress: 0,
      id: null,
      pollingInterval: null,
    };
  },
  methods: {
    async checkTestStatus() {
      try {
        // Simulazione richiesta API per lo stato test
        /*
        const response = await axios.get(`/api/test/status`);
        const data = response.data;
        this.id = data.id;
        this.progress = data.progress;
        this.testStarted = data.started;
        this.testCompleted = data.completed;
        */

        // DEMO - simula risposta iniziale
        const data = {
          id: "demo123",
          progress: 0,
          started: false,
          completed: false,
        };

        this.id = data.id;
        this.progress = data.progress;
        this.testStarted = data.started;
        this.testCompleted = data.completed;

        if (this.testStarted && !this.testCompleted) {
          this.startPolling();
        }

      } catch (error) {
        console.error("Errore nel recupero dello stato del test", error);
      }
    },

    async startPolling() {
      const response = await axios.post(`/executeTest`);
      console.log(response)

    },

    async pollTestProgress() {
      try {
        // Simulazione richiesta API di avanzamento test

        const response = await axios.post(`/executeTest`);
        /*
        const data = response.data;
        this.progress = data.progress;
        this.testCompleted = data.completed;
        */

        // DEMO - simulazione avanzamento
        if (this.progress < 100) {
          this.progress += 10;
        } else {
          this.testCompleted = true;
          clearInterval(this.pollingInterval);
        }

      } catch (error) {
        console.error("Errore durante il polling del test", error);
        clearInterval(this.pollingInterval);
      }
    },

    async startTest() {
      this.testStarted = true;
      this.testCompleted = false;
      this.progress = 0;

      // Simulazione richiesta API per iniziare il test
      /*
      const response = await axios.post(`/api/test/start`);
      this.id = response.data.id;
      */

      this.id = "demo123"; // DEMO ID
      this.startPolling();
    },

    goToResult() {
      this.$router.push({name: "TestResult", params: {id: this.id}});
    },
  },
  mounted() {
    this.checkTestStatus();
  },
  beforeUnmount() {
    if (this.pollingInterval) clearInterval(this.pollingInterval);
  }
};
</script>

<style scoped>
.container {
  max-width: 800px;
  margin: auto;
  padding: 20px;
  text-align: center;
}

.page-title {
  font-size: 2.5rem;
  font-weight: bold;
  color: white;
}

.spacer {
  height: 40px;
}

.start-btn {
  background-color: white;
  color: black;
  font-size: 1.2rem;
  padding: 12px 20px;
  border-radius: 8px;
  border: none;
  cursor: pointer;
  transition: 0.3s;
}

.start-btn:hover {
  background-color: #ddd;
}

.progress-container {
  margin-top: 30px;
}

.progress-container p {
  font-size: 1.1rem;
  font-weight: bold;
  color: white;
}

.progress-bar {
  width: 100%;
  height: 20px;
  background: #4c4c4c;
  border-radius: 10px;
  overflow: hidden;
  margin-top: 10px;
}

.progress-fill {
  height: 100%;
  background: #ffffff;
  transition: width 0.3s ease-in-out;
}

.test-results {
  margin-top: 50px;
  padding: 20px;

  border-radius: 10px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.results-title {
  font-size: 1.8rem;
  font-weight: bold;
  color: white;
  margin-bottom: 20px;
}
</style>
