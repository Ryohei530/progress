<template>
  <div class="col-md-10 col-xl-6 mb-3 justify-content-center">
    <li id="goal-<%= monthly_goal.id %>" class="card mb-3">
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
        <router-link to="/monthly_goal" class="card-link">
          <div class="card-inner">
            <div class="card-content">
              <div class="aim">
                <p class="aim-tit"><i class="far fa-calendar-alt"></i> 期間</p>
                <p class="aim-txt">{{ data.monthly_goal.term_start }} 〜 {{ data.monthly_goal.term_end }}</p>
                <p class="aim-tit"><i class="fas fa-crosshairs"></i>１ヶ月間の目的</p>
                <p class="aim-txt">{{ data.monthly_goal.monthly_aim }}</p>
                <p class="aim-tit"><i class="fas fa-tachometer-alt"></i>１ヶ月間の目標数値、指標</p>
                <p class="aim-txt">{{ data.monthly_goal.monthly_indicator }}</p>
              </div>
              <div class="action">
                <p class="action-tit"><i class="fas fa-clipboard-list"></i> 1ヶ月間のアクション</p>
                <ul class="action-list">
                  <!--<% monthly_goal.goal_actions.each do |action| %>-->
                  <!--  <li class="action-item">-->
                  <!--    <div class="action-inner">-->
                  <!--      <div class="action-wrap">-->
                  <!--        <%= action.content %>-->
                  <!--      </div>-->
                  <!--      <div class="action-box">-->
                  <!--        <%= action.number %> / <%= action.number %>-->
                  <!--      </div>-->
                  <!--    </div>-->
                  <!--  </li>-->
                  <!--<% end %>-->
                </ul>
              </div>
            </div>
          </div>
        </router-link>
        <div class="card-box">
          <div class="row">
            <div class="col d-flex align-items-center">
              <span class="card-timestamp">
                <i class="far fa-clock"></i>
                <!--<%= time_ago_in_words(monthly_goal.created_at) %>前-->
              </span>
              <!--<template v-if="data.user.id === data.current_user.id">-->
              <!--  <a href="" data-method="delete"></a>-->
              <!--</template>-->
              <!--<% if current_user?(monthly_goal.user) %>-->
              <!--  <%= link_to "削除", monthly_goal, method: :delete,-->
              <!--                            data: { confirm: "本当に削除しますか？" },-->
              <!--                            class: "card-dlt dlt-card-#{monthly_goal.id} btn btn-outline-danger btn-sm" %>-->
              <!--  <%= link_to "編集", edit_monthly_goal_path(monthly_goal.user), class: 'card-edit btn btn-outline-success btn-sm' %>-->
              <!--<% end %>-->
            </div>
          </div>
        </div>
      </div>
    </li>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        data: this.$store.state.data,
        user: this.$store.state.user
      }
    }
  }
</script>