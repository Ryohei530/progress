<template>
  <div>
    <div v-text="message"></div>
  </div>
</template>

<script>
  export default {
    created() {
      console.log("Hello Vue")
    },
    data: () => {
      return {
        message: "Hello World Vue Index"
      }
    },
  }
</script>