export default {
  created() {
    
  },
  methods: {
    textFormat(value) {
      return value.replace(/\n/g, '<br/>');
    },
  },
};