<template>
  <div class="question-card">
    <IonIcon :icon="pencilOutline" class="edit-icon" @click="editQuestion"></IonIcon>
    <h2 class="question-title">{{ question }}</h2>
    <p class="expected-answer">{{ expectedAnswer }}</p>
  </div>
</template>

<script>
import { IonIcon } from "@ionic/vue";
import { pencilOutline } from "ionicons/icons";


export default {
  name: "Question",
  components: {
    IonIcon
  },
  props: {
    id: Number,
    question: String,
    expectedAnswer: String
  },
  data() {
    return {
      pencilOutline
    };
  },
  methods: {
    editQuestion() {
      console.log( this.id);
      this.$router.push(`/editquestion/${this.id}`);
    }
  }
};
</script>



<style scoped>
.question-card {
  position: relative;
  border-radius: 8px;
  padding: 15px;
  margin-bottom: 15px;
  background-color: var(--color-background-soft);
  color: var(--color-text);
}

.question-title {
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 10px;
  color: var(--color-heading);
}

.expected-answer {
  font-size: 1rem;
  color: var(--color-text);
  font-style: italic;
}

.edit-icon {
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 20px;
  cursor: pointer;
  color: var(--color-heading);
  transition: 0.3s;
}

.edit-icon:hover {
  color: var(--ion-color-primary);
}
</style>
