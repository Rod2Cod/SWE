<template>
  <main class="container mt-5">
    <h1 class="page-title">Modifica la Domanda</h1>

    <form v-if="!isLoading" @submit.prevent="submitForm">
      <div class="form-group">
        <label for="question">Domanda</label>
        <input
            type="text"
            id="question"
            v-model="question"
            placeholder="Modifica la domanda"
            required
        />
      </div>

      <div class="form-group">
        <label for="answer">Risposta</label>
        <textarea
            id="answer"
            v-model="expectedAnswer"
            placeholder="Modifica la risposta"
            required
        ></textarea>
      </div>

      <div class="button-container">
        <button type="submit" class="submit-btn">Salva Modifica</button>
        <button type="button" class="cancel-btn" @click="cancel">Annulla</button>
      </div>
    </form>

    <div class="d-flex justify-content-center mt-5" v-if="isLoading">
      <img class="loading" src="@/assets/loading.svg">
    </div>
  </main>
</template>

<script>

import axios from "axios";

export default {
  name: "ModificaDomanda",
  data() {
    return {
      id: this.$route.params.id,
      question: "",
      expectedAnswer: "",
      isLoading: false, // Per simulare il caricamento dei dati
    };
  },
  mounted() {
    this.loadQuestion();
  },
  methods: {
    async loadQuestion() {


      this.isLoading = true;
      try {
        const res = await axios.get(`/domande/${this.id}`);

        this.question = res.data.domanda;
        this.expectedAnswer = res.data.risposta;
        this.isLoading = false;
      } catch (error) {
        console.error("Errore durante il caricamento:", error);
        this.$router.push("/questions");
      }
    },

    async submitForm() {

      if (!this.payload.domanda || !this.payload.risposta) {
        alert("Compila entrambi i campi.");
        return;
      }

      try {
        await axios.put(`/domande/${this.id}`, this.payload);
        this.$router.push("/questions");
      } catch (error) {
        console.error("Errore durante il salvataggio:", error);
      }
    },
    cancel() {
      this.$router.push("/questions")
    },
  },
  computed: {
    payload() {
      return {
        domanda: this.question.trim(),
        risposta: this.expectedAnswer.trim()
      };
    }
  },
};
</script>

<style scoped>
.container {
  max-width: 600px;
  margin: auto;
  padding: 20px;
  background-color: #222;
  border-radius: 10px;
}

h1 {
  text-align: center;
  margin-bottom: 20px;
  color: white;
}

.loading-text {
  text-align: center;
  color: white;
  font-size: 18px;
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
  color: white;
}

input,
textarea {
  width: 100%;
  padding: 10px;
  border-radius: 5px;
  border: 1px solid #444;
  background-color: #333;
  color: white;
}

textarea {
  resize: none;
  height: 100px;
}

.button-container {
  display: flex;
  justify-content: center;
  gap: 10px;
  margin-top: 20px;
}

.submit-btn {
  background-color: white;
  color: black;
  padding: 12px 20px;
  font-size: 16px;
  border-radius: 5px;
  border: 1px solid black;
  cursor: pointer;
  transition: 0.3s;
}

.submit-btn:hover {
  background-color: #ddd;
}

.cancel-btn {
  background-color: #e74c3c;
  color: white;
  padding: 12px 20px;
  font-size: 16px;
  border-radius: 5px;
  border: none;
  cursor: pointer;
  transition: 0.3s;
}

.cancel-btn:hover {
  background-color: #c0392b;
}
</style>
