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
        <!--<%= link_to(goal, class: "card-link") do %>-->
          <div class="card-inner">
            <div class="card-content">
              <div class="aim">
                <p class="aim-tit"><i class="far fa-calendar-alt"></i> 期間</p>
                <p class="aim-txt">{{ data.goal.term_start }} 〜 {{ data.goal.term_end }}</p>
                <p class="aim-tit"><i class="far fa-flag"></i> 目的、得たい結果</p>
                <!--<%= simple_format(goal.aim, class: "aim-txt") %>-->
                <p class="aim-tit"><i class="far fa-chart-bar"></i> 目標数値、指標</p>
                <!--<%= simple_format(goal.indicator, class: "aim-txt") %>-->
                <p class="aim-tit"><i class="fas fa-crosshairs"></i> １ヶ月間の目的</p>
                <p class="aim-txt">{{ data.monthly_goal.monthly_aim }}</p>
                <p class="aim-tit"><i class="fas fa-tachometer-alt"></i> １ヶ月間の目標数値、指標</p>
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
        <!--<% end %>-->
        <div class="card-box mt-auto">
          <div class="row">
            <div class="col d-flex align-items-center">
              <span class="card-timestamp">
                <i class="far fa-clock"></i>
                <!--<%= time_ago_in_words(goal.created_at) %>前-->
              </span>
              <!--<% if current_user?(goal.user) %>-->
              <!--  <%= link_to "削除", goal, method: :delete,-->
              <!--                            data: { confirm: "本当に削除しますか？" },-->
              <!--                            class: "card-dlt dlt-card-#{goal.id} btn btn-outline-danger btn-sm" %>-->
              <!--<% end %>-->
            </div>
            <div class="col d-flex justify-content-end align-items-center">
              <div class="card-comment">
                <!--<%= link_to goal do %>-->
                  <i class="far fa-comment"></i>
                <!--<% end %>-->
              </div>
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