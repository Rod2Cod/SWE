
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
      test: {},
    };
  },
  methods: {
    formatDate(dateISO) {
      return new Date(dateISO).toLocaleDateString();
    },
    async loadTest() {
      try {
        const response = await axios.get(`/risultati/${this.id}`);
        this.test = response.data;
        console.log(this.test.risultatiDomande)

      } catch (error) {
        console.error("Error loading test data:", error);
      }

    }
  }
}
</script>


<style scoped>

</style>