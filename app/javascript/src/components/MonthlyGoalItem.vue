<template>
  <div class="col-md-10 col-xl-6 mb-3 justify-content-center">
    <li id="`goal-${monthly_goal.id}`" class="card mb-3">
      <div class="card-body">
        <div class="card-wrap">
          <div class="card-avatar">
            <router-link to="/">
              <img :src="data.avatar_url60" alt="" class="_rounded">
            </router-link>
          </div>
          <span class="card-user">
            <router-link to="/">{{ user.name }}</router-link>
          </span>
        </div>
        <a :href="`/monthly_goals/${monthly_goal.id}`" class="card-link">
          <div class="card-inner">
            <div class="card-content">
              <div class="aim">
                <p class="aim-tit"><i class="far fa-calendar-alt"></i> 期間</p>
                <p class="aim-txt">{{ monthly_goal.term_start }} 〜 {{ monthly_goal.term_end }}</p>
                <p class="aim-tit"><i class="fas fa-crosshairs"></i>１ヶ月間の目的</p>
                <p class="aim-txt">{{ monthly_goal.monthly_aim }}</p>
                <p class="aim-tit"><i class="fas fa-tachometer-alt"></i>１ヶ月間の目標数値、指標</p>
                <p class="aim-txt">{{ monthly_goal.monthly_indicator }}</p>
              </div>
              <div class="action">
                <p class="action-tit"><i class="fas fa-clipboard-list"></i> 1ヶ月間のアクション</p>
                <ul class="action-list">
                  <template v-for="m_act in monthly_actions">
                    <li class="action-item">
                      <div class="action-inner">
                        <div class="action-wrap">
                          {{ m_act.content }}
                        </div>
                        <div class="action-box">
                          {{ m_act.number }}
                        </div>
                      </div>
                    </li>
                  </template>
                </ul>
              </div>
            </div>
          </div>
        </a>
        <div class="card-box">
          <div class="row">
            <div class="col d-flex align-items-center">
              <span class="card-timestamp">
                <i class="far fa-clock"></i>
                {{ monthly_goal.created_at | moment }}
              </span>
              <template v-if="currentUser()">
                <a 
                  :href="`/monthly_goals/${monthly_goal.id}`"  
                  class="card-dlt dlt-card-#{goal.id} btn btn-outline-danger btn-sm"
                  data-confirm="本当に削除しますか？"
                  data-method="delete"
                  rel="nofollow"
                >
                  削除
                </a>
                <a 
                  :href="`/monthly_goals/${monthly_goal.id}/edit`"
                  class="card-edit btn btn-outline-success btn-sm"
                >
                  編集
                </a>
              </template>
            </div>
          </div>
        </div>
      </div>
    </li>
  </div>
</template>

<script>
  import moment from 'moment';
  import { mapGetters } from 'vuex';
  
  export default {
    moment,
    props: ['monthly_goal', 'monthly_actions'],
    data() {
      return {
        
      };
    },
    computed: {
      ...mapGetters([
        'data',
        'user', 
        'current_user',
      ]),
    },
    methods: {
      currentUser() {
        if (this.current_user) {
          return  this.user.id === this.current_user.id;
        } else {
          return false;
        }
      }
    },
    filters: {
      moment: function(date) {
        moment.locale("ja");
        return moment(date).fromNow();
      },
    },
  };
</script>