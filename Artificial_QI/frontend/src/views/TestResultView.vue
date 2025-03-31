
<template>
  <main class="container py-4">
  <div class="header mb-4">
    <h1 class="page-title">Risultato Test</h1>

    <Test :test="test"></Test>
  </div>
  </main>
</template>

<script>
import Test from "@/components/Test.vue";
import axios from "axios";

export default {
  name: "TestResultView",
  components: {Test},
  mounted() {
    this.loadTest();
  },
  data() {
    return {
      id: this.$route.params.id,
      test: {
        id: 1,
        date: new Date().toISOString().split("T")[0],
        llmUsed: "GPT-4",
        score: 85,
        questions: [
          {
            text: "Quanto fa 2 + 2?",
            expectedAnswer: "Il risultato di 2 + 2 è 4.",
            llmResponse: "4",
            score: 10,
            metrics: {
              TER: 0.2,
              BLEU: 6.7,
              METEOR: 0.72
            }
          },
          {
            text: "Qual è la capitale d'Italia?",
            expectedAnswer: "La capitale d'Italia è Roma.",
            llmResponse: "Roma",
            score: 10,
            metrics: {
              TER: 0.2,
              BLEU: 6.7,
              METEOR: 0.72
            }
          }
        ],
      },
    };
  },
  methods: {
    formatDate(dateISO) {
      return new Date(dateISO).toLocaleDateString();
    },
    async loadTest() {
      try {
        //const response = await axios.get(`/risultatiDomanda/${this.id}`);
        //console.log(response.data);
        //this.test = response.data.test;
      } catch (error) {
        console.error("Error loading test data:", error);
      }

    }
  }
}
</script>


<style scoped>

</style>