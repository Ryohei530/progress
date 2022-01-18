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
              <a href="/" class="term-link">
                <button class="btn"><i class="fas fa-plus"></i></button>
              </a>
            </div>
          </div>
          <tnav></tnav>
        </div>
      </div>
    </div>
      
    <template v-if="liked_posts">
      <ol class="posts row">
        <post-item 
          v-for="(post, index) in liked_posts"
          :key="post.id"
          :post="post"
          :user_id="post.user_id"
          :user_obj="userObj(post)"
          :post_images="liked_post_images_array[index]"
          :commentCount="commentCount(post)"
        ></post-item>
      </ol>
      <!--<%= paginate @posts %>-->
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
        'liked_posts',
        'post_comments',
        'liked_post_users_obj',
        'liked_post_images_array',
      ]),
    },
    methods: {
      commentCount(post) {
        let postComments = this.post_comments.filter(comment => comment.post_id === post.id);
        return postComments.length;
      },
      userObj(post) {
        let userObj = this.liked_post_users_obj.filter(user => user.id === post.user_id);
        return userObj.shift();
      },
    },
    components: {
      Tnav,
      PostItem
    }
  };
</script>