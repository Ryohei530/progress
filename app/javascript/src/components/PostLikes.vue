<template>
  <div class="card-like">
    <template v-if="current_user">
      <template v-if="isLiked">
        <span @click="deleteLike()">
          <i class="fas fa-heart"></i>
          {{ count }}
        </span>
      </template>
      <template v-else>
        <span @click="registerLike()">
          <i class="far fa-heart"></i>
          {{ count }}
        </span>
      </template>
    </template>
    <template v-else>
      <span>
        <i class="far fa-heart"></i>
        {{ count }}
      </span>
    </template>
  </div>
</template>

<script>
  import axios from 'axios';
  import { csrfToken } from 'rails-ujs';
// CSRFトークンの取得とリクエストヘッダへの設定をしてくれます
  axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken();
  
  export default {
    data() {
      return{
        current_user: this.$store.state.data.current_user,
        post: this.$store.state.data.post,
        likeCount: 0,
        like: null
      };
    },
    computed: {
      count() {
        return this.likeCount;
      },
      isLiked() {
        return this.like;
      },
    },
    methods: {
      fetchLike: async function() {
        const res = await axios.get(`/api/posts/${this.post.id}/post_likes`);
        // if (res.status !== 200) {
        //   // エラー処理
        // }
        return res.data;
      },
      registerLike: async function() {
        const res = await axios.post(`/api/posts/${this.post.id}/post_likes`);
        // if (res.status !== 201) {
        //   // エラー処理
        // }
        this.fetchLike().then(result => {
          this.likeCount = result.count;
          this.like = result.like;
        });
      },
      deleteLike: async function() {
        console.log(this.like.id)
        const res = await axios.delete(`/api/posts/${this.post.id}/post_likes/${this.like.id}`);
        // if (res.status !== 200) {
        //   // エラー処理
        // }
        this.fetchLike().then(result => {
          this.likeCount = result.count;
          this.like = null;
        });
      },
    },
    mounted() {
      this.fetchLike().then(result => {
        this.likeCount = result.count;
        this.like = result.like;
      });
      console.log(this.isLiked);
    }
    
  };
</script>