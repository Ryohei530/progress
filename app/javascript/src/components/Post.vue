<template>
  <div>
    <div class="user">
      <div class="row">
        <div class="d-flex col-12 mb-3 justify-content-between flex-wrap">
          <div class="d-flex">
            <h2>つぶやき</h2>
            <div class="term ml-3">
              <!--<%= link_to  post_user_path(@user), class: "term-link" do %>-->
              <a href="" class="term-link">
                <button class="btn">つぶやき</button>
              </a>
              <!--<% end %>-->
              <!--<%= link_to  liked_posts_user_path(@user), class: "term-link" do %>-->
              <a href="" class="term-link">
                <button class="btn">いいねしたつぶやき</button>
              </a>
              <!--<% end %>-->
              <!--<%= link_to  root_path, class: "term-link" do %>-->
              <a href="/" class="term-link">
                <button class="btn"><i class="fas fa-plus"></i></button>
              </a>
              <!--<% end %>-->
            </div>
          </div>
          <tnav></tnav>
        </div>
      </div>
    </div>
      
    <template v-if="posts">
      <ol class="posts row">
        <post-item 
          v-for="(post, index) in posts"
          :key="post.id"
          :post="post"
          :post_images="post_images_array[index]"
          :commentCount="commentCount(post)"
        ></post-item>
        <!--<%= render partial: 'users/post', collection: @posts %>-->
      </ol>
      <!--<%= paginate @posts %>-->
    </template>
  </div>
</template>


<script>
  import Tnav from './Tnav';
  import PostItem from './PostItem';
  
  export default {
    data: function() {
      let stateData = this.$store.state.data;
      return {
        data: stateData,
        posts: stateData.posts,
        post_comments: stateData.post_comments,
        post_images_array: stateData.post_images_array,
      };
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