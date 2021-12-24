<template>
  <div>
    <p>app.vue</p>
  </div>
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