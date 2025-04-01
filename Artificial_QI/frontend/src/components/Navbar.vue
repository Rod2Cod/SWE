<script>
export default {
  name: "Navbar",
  data() {
    return {
      routes: [
        { name: "Home", path: "/" },
        { name: "Domande", path: "/questions" },
        { name: "Test", path: "/test" },
        { name: "History", path: "/history" },
      ],
      isCollapsed: true
    };
  },
  methods: {
    toggleMenu() {
      this.isCollapsed = !this.isCollapsed;
    },
    closeMenu() {
      this.isCollapsed = true; // Chiude il menu quando si clicca un link
    }
  }
};
</script>

<template>
  <nav class="navbar">
    <div class="container">
      <!-- Logo -->
      <RouterLink to="/" class="logo-container">
        <img src="@/assets/logo.webp" alt="Artifial QI logo" class="logo" />
        <span class="brand-name">Artificial QI</span>
      </RouterLink>

      <!-- Hamburger menu -->
      <button class="hamburger" @click="toggleMenu">
        <span :class="{'open': !isCollapsed}"></span>
        <span :class="{'open': !isCollapsed}"></span>
        <span :class="{'open': !isCollapsed}"></span>
      </button>

      <!-- Links -->
      <ul class="nav-links" :class="{'show': !isCollapsed}">
        <li v-for="route in routes" :key="route.path">
          <RouterLink class="nav-item" :to="route.path" @click="closeMenu">
            {{ route.name }}
          </RouterLink>
        </li>
      </ul>
    </div>
  </nav>
</template>

<style scoped>
.navbar {
  background-color: #111;
  padding: 15px 20px;
  position: relative;
  width: 100%;
  display: flex;
  justify-content: center;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
  z-index: 1000;
}

.container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 90%;
  max-width: 1200px;
}

.logo-container {
  display: flex;
  align-items: center;
  gap: 10px;
  text-decoration: none;
  color: white;
}

.logo {
  height: 55px;
}

.brand-name {
  font-size: 1.3rem;
  font-weight: bold;
}

.nav-links {
  display: flex;
  gap: 20px;
  list-style: none;
  padding: 0;
  margin: 0;
}

.nav-item {
  text-decoration: none;
  color: #ddd;
  font-size: 1rem;
  transition: 0.3s;
}

.nav-item:hover {
  color: white;
}

/* Hamburger */
.hamburger {
  display: none;
  flex-direction: column;
  gap: 5px;
  cursor: pointer;
  background: none;
  border: none;
}

.hamburger span {
  display: block;
  width: 25px;
  height: 3px;
  background: white;
  transition: 0.3s;
}

.hamburger .open:nth-child(1) {
  transform: rotate(45deg) translate(5px, 5px);
}
.hamburger .open:nth-child(2) {
  opacity: 0;
}
.hamburger .open:nth-child(3) {
  transform: rotate(-45deg) translate(5px, -5px);
}

@media (max-width: 768px) {
  .hamburger {
    display: flex;
  }

  .nav-links {
    position: absolute;
    top: 60px;
    right: 0;
    background: #111;
    width: 100%;
    flex-direction: column;
    align-items: center;
    padding: 20px 0;
    display: none;
  }

  .nav-links.show {
    display: flex;
  }
}
</style>
