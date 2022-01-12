<template>
  <router-view></router-view>
</template>


<script>
import Practice from 'src/components/Practice';
import Sample from 'src/components/Sample';

export default {
  data: function () {
    return {
      message: "Hello Vue!",
    };
  },
  computed: {
    
  },
  methods: {
    
  },
  components: {
    Practice,
    Sample,
  }
}
</script>