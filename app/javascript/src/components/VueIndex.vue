<template>
  <div>
    <div v-text="message"></div>
    <div class="text-center">
      <v-btn
        rounded
        color="primary"
        dark
      >
        Rounded Button
      </v-btn>
    </div>
    <v-row justify="space-around">
      <v-time-picker
        v-model="time"
        :allowed-hours="allowedHours"
        :allowed-minutes="allowedMinutes"
        class="mt-4"
        format="24hr"
        scrollable
        min="9:30"
        max="22:15"
      ></v-time-picker>
      <v-time-picker
        v-model="timeStep"
        :allowed-minutes="allowedStep"
        class="mt-4"
        format="24hr"
      ></v-time-picker>
    </v-row>
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