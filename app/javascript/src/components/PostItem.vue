<template>
  <div class="col-xl-6 mb-3">
    <li :id="`post-${post.id}`" class="card mb-4">
      <div class="card-body">
        <div v-if="user_id" class="card-wrap d-flex">
          <div class="card-avatar">
            <router-link to="/">
              <img :src="user_obj.image_url" alt="" class="_rounded">
            </router-link>
          </div>
          <div class="card-title">
            <router-link to="/">{{ user_obj.name }}</router-link>
          </div>
        </div>
        <div v-else class="card-wrap d-flex">
          <div class="card-avatar">
            <router-link to="/">
              <img :src="data.avatar_url60" alt="" class="_rounded">
            </router-link>
          </div>
          <div class="card-title">
            <router-link to="/">{{ user.name }}</router-link>
          </div>
        </div>
        <a :href="`/posts/${post.id}`" class="card-link" :class="`card-link-${post.id}`">
          <div class="card-inner">
            <div class="card-text" v-html="$sanitize(textFormat(post.content))"></div>
            <div class="images">
              <template v-if="post_images">
                <div class="row">
                  <template v-for="image in post_images">
                    <div class="col-6">
                      <img :src="image" alt="">
                    </div>
                  </template>
                </div>
              </template>
            </div>
          </div>
        </a>
        <div class="card-box">
          <div class="row">
            <div class="col d-flex">
              <span class="card-timestamp">
                {{ post.created_at | moment }}
              </span>
            </div>
            <div class="col d-flex justify-content-end">
              <div class="card-comment">
                <a href="`/posts/${post.id}`">
                  <i class="far fa-comment"></i>
                  <span>{{ commentCount }}</span>
                </a>
              </div>
              <post-likes :post="post"></post-likes>
            </div>
          </div>
        </div>
      </div>
    </li>
  </div>
</template>

<script>
  import moment from 'moment';
  import PostLikes from './PostLikes';
  import { mapGetters } from 'vuex';
  
  export default {
    moment,
    props: ['post', 'post_images', 'commentCount','user_id', 'user_obj'],
    data() {
      return {

      };
    },
    computed:{
      ...mapGetters([
        'data',
        'user', 
        'current_user',
      ]),
    },
    filters: {
      moment: function(date) {
        moment.locale("ja");
        return moment(date).fromNow();
      },
    },
    methods: {

    },
    components: {
      PostLikes,
    },
  };
</script>

