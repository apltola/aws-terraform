<script>
  import { Router, Route, Link } from 'svelte-navigator';
  import Header from './components/Header.svelte';
  import Home from './views/Home.svelte';
</script>

<Router>
  <Header />

  <main>
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
    flex: 1;
  }
</style>
