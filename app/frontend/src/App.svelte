<script>
  import Icon from 'svelte-icons-pack/Icon.svelte';
  import FaSolidBars from "svelte-icons-pack/fa/FaSolidBars";
  import FaSolidTimes from "svelte-icons-pack/fa/FaSolidTimes";
  import { fly } from 'svelte/transition'
  import svelteLogo from './assets/svelte.svg'
  import Counter from './components/Counter.svelte'

  let menuIsOpen = false
  let response

  async function fetchSomething() {
    const res = await fetch('/api/users').then(r => r.json())
    response = res
    console.log('res', res)
  }

  function toggleMenu() {
    menuIsOpen = !menuIsOpen
  }
</script>

<nav class="nav">
  <div style="display:flex;justify-content:flex-end;padding-bottom:.5em;">
    <button
      class="menu-toggle"
      on:click={toggleMenu}
      >
      <Icon src={menuIsOpen ? FaSolidTimes : FaSolidBars} size="32" color="rgba(255, 255, 255, 0.87)" />
      <span style="padding-left:.5em;">Menu</span>
    </button>
  </div>
  {#if menuIsOpen}
    <button
      class="menu-link"
      transition:fly="{{ x: 100, duration: 350}}"
      >
      Link 1
    </button>
  {/if}
  {#if menuIsOpen}
    <button
      class="menu-link"
      transition:fly="{{ x: 100, duration: 350, delay: 100}}"
      >
      Link 2
    </button>
  {/if}
</nav>

<main>
  <div>
    <a href="https://vitejs.dev" target="_blank" rel="noreferrer">
      <img src="/vite.svg" class="logo" alt="Vite Logo" />
    </a>
    <a href="https://svelte.dev" target="_blank" rel="noreferrer">
      <img src={svelteLogo} class="logo svelte" alt="Svelte Logo" />
    </a>
  </div>
  <h1>Jopas jotain</h1>

  <div class="card">
    <Counter />
  </div>
  <button on:click={fetchSomething}>
    fetch data from api
  </button>

  {#if response}
    <pre>
      {JSON.stringify(response, null, 2)}
    </pre>
  {/if}
</main>

<style>
  .nav {
    position: absolute;
    top: 0;
    right: 0;
    padding: .5em;
  }

  nav button {
    display: block;
    margin-bottom: .5em;
  }

  .menu-toggle {
    padding: 0;
    display: flex;
    place-items: center;
    background-color: transparent;
    border-radius: 0;
    padding: 2px;
    color: inherit;
    font-size: 18px;
  }

  .logo {
    height: 6em;
    padding: 1.5em;
    will-change: filter;
  }

  .logo:hover {
    filter: drop-shadow(0 0 2em #646cffaa);
  }

  .logo.svelte:hover {
    filter: drop-shadow(0 0 2em #ff3e00aa);
  }

  pre {
    text-align: center;
  }
</style>
