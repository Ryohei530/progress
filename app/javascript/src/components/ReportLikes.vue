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
      <p v-show="hoverFlag" class="require-like">いいねするにはログインが必要です</p>
      <span @mouseover="mouseOverAction" @mouseleave="mouseLeaveAction">
        <i class="far fa-heart"></i>
        {{ count }}
      </span>
    </template>
  </div>
</template>

<script>
  import axios from 'axios';
  import { mapGetters } from 'vuex';
  import { csrfToken } from 'rails-ujs';
// CSRFトークンの取得とリクエストヘッダへの設定
  axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken();
  
  export default {
    props: ['report'],
    data() {
      return{
        // report: this.$store.state.data.report,
        likeCount: 0,
        like: null,
        hoverFlag: false,
      };
    },
    computed: {
      ...mapGetters([
        'data',
        'current_user',
      ]),
      count() {
        return this.likeCount;
      },
      isLiked() {
        return this.like;
      },
    },
    methods: {
      fetchLike: async function() {
        const res = await axios.get(`/api/reports/${this.report.id}/report_likes`);
        // if (res.status !== 200) {
        //   // エラー処理
        // }
        return res.data;
      },
      registerLike: async function() {
        const res = await axios.post(`/api/reports/${this.report.id}/report_likes`);
        // if (res.status !== 201) {
        //   // エラー処理
        // }
        this.fetchLike().then(result => {
          this.likeCount = result.count;
          this.like = result.like;
        });
      },
      deleteLike: async function() {
        const res = await axios.delete(`/api/reports/${this.report.id}/report_likes/${this.like.id}`);
        // if (res.status !== 200) {
        //   // エラー処理
        // }
        this.fetchLike().then(result => {
          this.likeCount = result.count;
          this.like = null;
        });
      },
      mouseOverAction() {
        this.hoverFlag = true;
      },
      mouseLeaveAction() {
        this.hoverFlag = false;
      }
    },
    mounted() {
      this.fetchLike().then(result => {
        this.likeCount = result.count;
        // this.$emit("like-count", result.count);
        this.like = result.like;
      });
    }
    
  };
</script>

<style scoped>
  .require-like {
    position: absolute;
    top: 25px;
    left: -20px;
    background-color: rgba(74, 69, 69 ,0.2);
    width: 280px;
  }
  .reports .card-like{
    margin-right: 0;
  }
  .card-like span {
    color: #EC406C;
    cursor: pointer;
  }
</style>