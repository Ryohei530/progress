<template v-if="data.goal.aim && data.monthly_goal">
  <div class="col-12 col-md-10 col-lg-8 mb-5">
    <li id="goal-<%= goal.id %>" class="card">
      <div class="card-body d-flex flex-column">
        <div class="card-wrap">
          <div class="card-avatar">
            <router-link to="/">
              <img :src="data.avatar_url60" alt="" class="_rounded">
            </router-link>
          </div>
          <span class="card-user">
            <router-link to="/">
              {{ user.name }}
            </router-link>
          </span>
        </div>
        <a :href="`goals/${goal.id}`" class="card-link">
          <div class="card-inner">
            <div class="card-content">
              <div class="aim">
                <p class="aim-tit"><i class="far fa-calendar-alt"></i> 期間</p>
                <p class="aim-txt">{{ goal.term_start }} 〜 {{ goal.term_end }}</p>
                <p class="aim-tit"><i class="far fa-flag"></i> 目的、得たい結果</p>
                <p class="aim-txt" v-html="$sanitize(textFormat(goal.aim))"></p>
                <p class="aim-tit"><i class="far fa-chart-bar"></i> 目標数値、指標</p>
                <p class="aim-txt" v-html="$sanitize(textFormat(goal.indicator))"></p>
                <p class="aim-tit"><i class="fas fa-crosshairs"></i> １ヶ月間の目的</p>
                <p class="aim-txt">{{ data.monthly_goal.monthly_aim }}</p>
                <p class="aim-tit"><i class="fas fa-tachometer-alt"></i> １ヶ月間の目標数値、指標</p>
                <p class="aim-txt">{{ data.monthly_goal.monthly_indicator }}</p>
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
        <div class="card-box mt-auto">
          <div class="row">
            <div class="col d-flex align-items-center">
              <span class="card-timestamp">
                <i class="far fa-clock"></i>
                {{ goal.created_at | moment }}
              </span>
              <template v-if="currentUser()">
                <a 
                  :href="`/goals/${goal.id}/edit`"  
                  class="card-dlt dlt-card-#{goal.id} btn btn-outline-success btn-sm"
                  rel="nofollow"
                >
                  編集
                </a>
              </template>
            </div>
            <div class="col d-flex justify-content-end align-items-center">
              <div class="card-comment">
                <a :href="`goals/${goal.id}`">
                  <i class="far fa-comment"></i>
                </a>
              </div>
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
    data() {
      return {
      };
    },
    computed: {
      ...mapGetters([
        'data',
        'user', 
        'goal',
        'monthly_actions',
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