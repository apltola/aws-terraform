<script>
  import svelteLogo from '../assets/svelte.svg';

  let response;

  async function fetchSomething() {
    const res = await fetch('/api/users').then((r) => r.json());
    response = res;
    console.log('res', res);
  }
</script>

<div>
  <a href="https://vitejs.dev" target="_blank" rel="noreferrer">
    <img src="/vite.svg" class="logo" alt="Vite Logo" />
  </a>
  <a href="https://svelte.dev" target="_blank" rel="noreferrer">
    <img src={svelteLogo} class="logo svelte" alt="Svelte Logo" />
  </a>
</div>
<h1>Jopas jotain</h1>
<button on:click={fetchSomething}> fetch data from api </button>
{#if response}
  <pre>
    {JSON.stringify(response, null, 2)}
  </pre>
{/if}

<style>
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
    white-space: normal;
  }
</style>
