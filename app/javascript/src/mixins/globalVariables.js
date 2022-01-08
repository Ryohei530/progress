export default {
  created() {
    console.log('mixins here!');
  },
  methods: {
    textFormat(value) {
      return value.replace(/\n/g, '<br/>');
    },
  },
};