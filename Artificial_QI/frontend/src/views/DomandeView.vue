<template>
  <main class="container">
    <div class="header">
      <h1 class="page-title">Domande</h1>
      <div class="buttons">
        <button class="add-btn"  v-if="!isDeleting" @click="goToAddQuestion">
          <IonIcon :icon="addOutline"></IonIcon> Aggiungi
        </button>



        <template v-if="isDeleting">
          <button class="confirm-delete-btn" @click="confirmDelete">
            <IonIcon :icon="trashOutline"></IonIcon> Conferma Eliminazione
          </button>
          <button class="cancel-btn"  @click="cancelDeleteMode">
            <IonIcon :icon="closeOutline"></IonIcon> Annulla
          </button>
        </template>

        <button v-else-if="!isDeleting && questions.length !== 0" class="delete-btn" @click="startDeleteMode">
          <IonIcon :icon="trashOutline"></IonIcon> Elimina
        </button>
      </div>
    </div>

    <div class="d-flex justify-content-center mt-5" v-if="isLoading">
      <img class="loading" src="@/assets/loading.svg">
    </div>

    <div class="d-flex justify-content-center mt-5" v-if="questions.length === 0 && !isLoading">
      <h2>Nessuna domanda inserita!</h2>
    </div>

    <div class="questions-list" v-if="!isLoading">
      <div v-for="question in questions" :key="question.id" class="question-container">
        <input
            v-if="isDeleting"
            type="checkbox"
            class="question-checkbox"
            :value="question.id"
            @change="toggleSelection(question.id)"
        />
        <div class="question-box">
          <Domanda :question="question.domanda" :expectedAnswer="question.risposta" :id="question.id" />
        </div>
      </div>
    </div>
  </main>
</template>

<script>
import Domanda from "@/components/Domanda.vue";
import axios from "axios";
import { IonIcon } from "@ionic/vue";
import { addOutline, trashOutline, closeOutline } from "ionicons/icons";


export default {
  name: "QuestionsView",
  components: { Domanda, IonIcon },
  data() {
    return {
      addOutline,
      trashOutline,
      closeOutline,
      questions: [],
      isDeleting: false,
      isLoading: false,
      selectedQuestions: []
    };
  },
  mounted() {
    this.loadQuestions();
  },
  methods: {
    async loadQuestions() {
      this.isLoading = true;
      try {
        const response = await axios.get("/domande");
        this.questions = response.data;
        this.questions.sort((a, b) => b.id - a.id);
        this.isLoading = false;
      } catch (error) {
        console.error("Errore nel recuperare le domande:", error);
      }
    },
    goToAddQuestion() {
      this.$router.push("/addquestion");
    },
    startDeleteMode() {
      this.isDeleting = true;
      this.selectedQuestions = [];
    },
    cancelDeleteMode() {
      this.isDeleting = false;
      this.selectedQuestions = [];
    },
    toggleSelection(id) {
      if (this.selectedQuestions.includes(id)) {
        this.selectedQuestions = this.selectedQuestions.filter(qId => qId !== id);
      } else {
        this.selectedQuestions.push(id);
      }
    },
    async confirmDelete() {
      if (this.selectedQuestions.length === 0) {
        alert("Seleziona almeno una domanda da eliminare.");
        return;
      }

      if (confirm(`Sei sicuro di voler eliminare ${this.selectedQuestions.length} domanda(e)?`)) {
        try {
          await axios.delete("/domande/delete", { data: { ids: this.selectedQuestions } });
          this.questions = this.questions.filter(q => !this.selectedQuestions.includes(q.id));
          this.cancelDeleteMode();
        } catch (error) {
          console.error("Errore durante l'eliminazione:", error);
        }
      }
    }
  }
};
</script>


<style scoped>
.container {
  max-width: 800px;
  margin: auto;
  padding: 20px;
}

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
}

.buttons {
  display: flex;
  gap: 10px;
}

button {
  display: flex;
  align-items: center;
  gap: 5px;
  font-size: 16px;
  padding: 8px 12px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
}

.add-btn {
  background-color: #4CAF50;
  color: white;
}

.delete-btn {
  background-color: #e74c3c;
  color: white;
}

.confirm-delete-btn {
  background-color: #d9534f;
  color: white;
}

.cancel-btn {
  background-color: #777;
  color: white;
}

ion-icon {
  font-size: 20px;
}

h2 {
  color: #dfdfdf;
  font-size: 20px;
  text-align: center;
}


.question-container {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-top: 10px;
}

.question-box {
  flex-grow: 1;
  background-color: #222;
  padding: 15px;
  border-radius: 10px;
  min-height: 80px;
  width: 100%;
  box-sizing: border-box;
  border: 1px solid var(--color-border);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}


.question-checkbox {
  transform: scale(1.3);
  cursor: pointer;
}



</style>
