<script>
  import { Router, Route } from 'svelte-navigator';
  import Header from './components/Header.svelte';
  import Home from './views/Home.svelte';

  let shouldBlur = false;
  function handleMenuToggled(event) {
    shouldBlur = event.detail.menuIsOpen;
  }
</script>

<Router>
  <Header on:menutoggled={handleMenuToggled} />

  <main
    style={`filter: blur(${shouldBlur ? '1rem' : '0'}); pointer-events: ${
      shouldBlur ? 'none' : 'all'
    }`}
  >
    <Route path="/">
      <Home />
    </Route>

    <Route path="about">
      <h1>About</h1>
      <p>This is a Svelte app</p>
    </Route>
  </main>
</Router>

<style>
  main {
    padding-top: 2em;
    flex: 1;
    transition: all ease-in-out 200ms;
  }
</style>
