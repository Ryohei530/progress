<template>
  <v-app>
    <Practice></Practice>
    <Sample></Sample>
  </v-app> 
</template>


<script>
import Practice from 'src/components/Practice';
import Sample from 'src/components/Sample';

export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  },
  components: {
    Practice,
    Sample
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
