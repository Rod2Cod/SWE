<template>
  <main class="container">
    <h1 class="page-title">Esegui un Test</h1>

    <div class="spacer"></div>

    <button v-if="!testStarted && !testCompleted && !startingTest" class="start-btn" @click="startTest">
      Inizia Test
    </button>

    <p v-if="error" class="error-message">Errore nell'avvio del test!</p>

    <div class="starting-test d-flex flex-column align-items-center justify-content-center mt-5" v-if="startingTest">
      <img class="loading mb-3" src="@/assets/loading.svg" alt="Loading spinner">
      <h3 class="text-white">Avvio Test...</h3>
    </div>

    <div v-if="testStarted && !testCompleted" class="progress-container">
      <p>Test in esecuzione... ({{ progress.toFixed(1) }}%)</p>
      <div class="progress-bar">
        <div class="progress-fill" :style="{ width: progress + '%' }"></div>
      </div>
    </div>

    <div v-if="testCompleted" class="test-results">
      <h2 class="results-title">Test Completato!</h2>
      <button class="start-btn" @click="goToResult">
        Vai al risultato!
      </button>
      <button class="secondary-btn mt-3" @click="startTest">
        Esegui un altro test
      </button>
    </div>
  </main>
</template>

<script>
import axios from "axios";
import { globalState } from "@/globalState";

export default {
  name: "TestView",
  data() {
    return {
      startingTest: false,
      testStarted: false,
      testCompleted: false,
      progress: 0,
      id: null,
      pollingInterval: null,
      in_progress: "",
      error: false,
    };
  },
  methods: {
    async checkTestStatus() {
      try {
        const response = await axios.get(`/status`);
        const data = response.data;

        console.log(data)

        this.in_progress = data.in_progress;

        if (data.in_progress) {
          this.testStarted = true;
          this.progress = data.percentage;
        } else if (data.percentage === 100) {
          this.testCompleted = true;
          this.testStarted = false;
          this.id = data.id_risultato;
          clearInterval(this.pollingInterval);
        } else if (data.in_progress === false && data.percentage === 100) {
          this.testStarted = false;
          this.testCompleted = false;
        }

      } catch (error) {
        console.error("Errore nel recupero dello stato del test", error);
      }
    },
    async startTest() {
      globalState.vResult = false;
      this.startingTest = true;
      this.testCompleted = false;
      this.id = null;
      this.error = false;

      const response = await axios.post(`/executeTest`);

      if (response.status === 200) {

        this.startingTest = false;
        this.testStarted = true;
        this.pollingInterval = setInterval(this.checkTestStatus, 1000);


      } else {
        this.startingTest = false;
        this.error = true;
        console.log("Errore durante l'esecuzione del test");
      }

    },

    goToResult() {

      globalState.vResult = false;
      console.log(globalState.vResult);
      this.$router.push({name: "TestResult", params: {id: this.id}});
    },
  },
  async mounted() {
      const response = await axios.get(`/status`);

      const status = response.data;

      if (status.in_progress) {
        this.testStarted = true;
        this.progress = status.percentage;
        this.pollingInterval = setInterval(this.checkTestStatus, 1000);
      } else if (status.in_progress && status.percentage === 100 && globalState.vResult) {
        this.testCompleted = true;
        globalState.vResult = false;
      }
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

.error-message {
  color: red;
  margin-top: 10px;
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
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

.results-title {
  font-size: 1.8rem;
  font-weight: bold;
  color: white;
  margin-bottom: 20px;
}

.secondary-btn {
  background-color: transparent;
  border: 2px solid white;
  color: white;
  font-size: 1rem;
  padding: 8px 16px;
  border-radius: 6px;
  cursor: pointer;
  transition: 0.3s;
}

.secondary-btn:hover {
  background-color: rgba(255, 255, 255, 0.1);
}
</style>
