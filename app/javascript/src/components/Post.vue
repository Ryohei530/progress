<template>
  <div>
    <div class="user">
      <div class="row">
        <div class="d-flex col-12 mb-3 justify-content-between flex-wrap">
          <div class="d-flex">
            <h2>つぶやき</h2>
            <div class="term ml-3">
              <router-link to="/post" class="term-link">
                <button class="btn">つぶやき</button>
              </router-link>
              <router-link to="/liked_post" class="term-link">
                <button class="btn">いいねしたつぶやき</button>
              </router-link>
              <a href="/posts" class="term-link">
                <button class="btn"><i class="fas fa-plus"></i></button>
              </a>
            </div>
          </div>
          <tnav></tnav>
        </div>
      </div>
    </div>
      
    <template v-if="posts[0]">
      <ol class="posts row">
        <post-item 
          v-for="(post, index) in posts"
          :key="post.id"
          :post="post"
          :post_images="post_images_array[index]"
          :commentCount="commentCount(post)"
        ></post-item>
      </ol>
      <!--<%= paginate @posts %>-->
    </template>
    <template v-else>
      <div class="posts row">
        <div class="col-xl-6 mb-3">
          <div class="card mb-4">
            <div class="card-body">
              <p>つぶやきがありません</p>
            </div>
          </div>
        </div>
      </div>
    </template>
  </div>
</template>


<script>
  import Tnav from './Tnav';
  import PostItem from './PostItem';
  import { mapGetters } from 'vuex';
  
  export default {
    data: function() {
      return {
      };
    },
    computed:{
      ...mapGetters([
        'data',
        'posts', 
        'post_comments',
        'post_images_array',
      ]),
    },
    methods: {
      commentCount(post) {
        let postComments = this.post_comments.filter(comment => comment.post_id === post.id);
        return postComments.length;
      },
    },
    components: {
      Tnav,
      PostItem
    }
  };
</script>