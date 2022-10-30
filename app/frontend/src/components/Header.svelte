<script>
  import { createEventDispatcher } from 'svelte';
  import Icon from 'svelte-icons-pack/Icon.svelte';
  import FaSolidBars from 'svelte-icons-pack/fa/FaSolidBars';
  import FaSolidTimes from 'svelte-icons-pack/fa/FaSolidTimes';
  import { fly } from 'svelte/transition';

  const dispatch = createEventDispatcher();
  let menuIsOpen = false;

  function toggleMenu() {
    menuIsOpen = !menuIsOpen;
    dispatch('menutoggled', {
      menuIsOpen,
    });
  }
</script>

<header>
  <nav class="nav">
    <div class="menu-toggle-container">
      <button class="menu-toggle" on:click={toggleMenu}>
        <Icon
          src={menuIsOpen ? FaSolidTimes : FaSolidBars}
          size="32"
          color="rgba(255, 255, 255, 0.87)"
        />
        <span style="padding-left:.5em;">Menu</span>
      </button>
    </div>
    {#if menuIsOpen}
      <button class="menu-link" transition:fly={{ x: 100, duration: 350 }}>
        <a href="/" class="link">Home</a>
      </button>
    {/if}
    {#if menuIsOpen}
      <button
        class="menu-link"
        transition:fly={{ x: 100, duration: 350, delay: 100 }}
      >
        <a href="/about">About</a>
      </button>
    {/if}
  </nav>
</header>

<style>
  header {
    position: relative;
    height: 60px;
  }

  .nav {
    position: absolute;
    top: 0;
    right: 0;
    z-index: 1;
    padding: 0.5em;
  }

  nav .menu-link {
    display: flex;
    align-items: stretch;
    margin-bottom: 0.5em;
    padding: 0;
    width: 10em;
    height: 3em;
  }

  nav button a {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    color: white;
  }

  .menu-toggle-container {
    display: flex;
    justify-content: flex-end;
    padding-bottom: 0.5em;
  }

  .menu-toggle {
    flex-grow: 0;
    padding: 0;
    display: flex;
    place-items: center;
    background-color: transparent;
    border-radius: 0;
    padding: 2px;
    color: inherit;
    font-size: 18px;
  }
</style>
