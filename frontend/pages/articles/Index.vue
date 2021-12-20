<template>
  <div id="index">
    <App>
      <h1>Index page</h1>
      <p>You can use Vue.js, Bulma, FontAwesome on Rails.</p>
      <img src="../../images/mark_sumi.png">
    </App>
  </div>
</template>

<style lang="scss">
p {
  color: red;
}
h1 {
  font-size: 30px;
}
img {
  width: 100%;
}
</style>

<script>
import App from '../../components/App'
export default {
  components: {
    App
  }
}
</script>
