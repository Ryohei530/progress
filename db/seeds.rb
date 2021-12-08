# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
brian = User.create!(name: "brian",
             email: "brian@example.com",
             password: "012345",
             password_confirmation: "012345",
             admin: true)
             
guest = User.create!(name: "ゲスト",
             email: "guest@example.com",
             password: "012345",
             password_confirmation: "012345",
             )
mary = User.create!(name: "メアリー",
             email: "mary@example.com",
             password: "012345",
             password_confirmation: "012345",
             )
             
naru = User.create!(name: "ナルホド",
             email: "naru@example.com",
             password: "012345",
             password_confirmation: "012345",
             )
             
96.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@example.com"
  password = "012345"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

User.all.each do |user|
  user.avatar.attach(io: File.open('./app/assets/images/user.png'), filename: 'user.png', content_type: 'image/png')
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem::sentence(word_count: 5)
  users.each { |user| user.posts.create!(content: content) }
end

User.all.each do |user|
  user.monthly_goals.create!(
    monthly_aim: "基礎を固める",
    monthly_indicator: "単語300個",
    term_start: Date.today,
    term_end: Date.today.next_month,
    goal_actions_attributes: [
      content: "単語1500",
      number: 1500,
    ]
  )
end

# Reports

20.times do |n|
  brian.reports.create!(
    content: "テストじゃぜぇ",
    created_at: Time.current.days_ago(20 - n),
    monthly_goal_id: brian.monthly_goals.first.id,
    r_days: 1 + n,
    report_actions_attributes: [
      number: 100
    ]
  )
end

10.times do |n|
  User.second.reports.create!(
    content: "テストじゃぜぇ",
    created_at: Time.current.days_ago(10 - n),
    monthly_goal_id: User.second.monthly_goals.first.id,
    r_days: 1 + n,
    report_actions_attributes: [
      number: 100
    ]
  )
end

5.times do |n|
  User.third.reports.create!(
    content: "テストじゃぜぇ",
    created_at: Time.current.days_ago(5 - n),
    monthly_goal_id: User.third.monthly_goals.first.id,
    r_days: 1 + n,
    report_actions_attributes: [
      number: 100
    ]
  )
end

3.times do |n|
  User.find(4).reports.create!(
    content: "テストじゃぜぇ",
    created_at: Time.current.days_ago(3 - n),
    monthly_goal_id: User.find(4).monthly_goals.first.id,
    r_days: 1 + n,
    report_actions_attributes: [
      number: 100
    ]
  )
end

2.times do |n|
  User.find(5).reports.create!(
    content: "テストじゃぜぇ",
    created_at: Time.current.days_ago(2 - n),
    monthly_goal_id: User.find(5).monthly_goals.first.id,
    r_days: 1 + n,
    report_actions_attributes: [
      number: 100
    ]
  )
end

User.limit(5).each do |user|
  user.reports.create!(
    content: "テストじゃぜぇ",
    monthly_goal_id: user.monthly_goals.first.id,
    r_days: user.reports.first.r_days + 1,
    report_actions_attributes: [
      number: 100
    ]
  )
end

User.all.offset(5).each do |user|
  user.reports.create!(
    content: "テストじゃぜぇ",
    monthly_goal_id: user.monthly_goals.first.id,
    r_days: 1,
    report_actions_attributes: [
      number: 100
    ]
  )
end

# Running_days

brian.running_days.create!(
  start_date: Date.today.days_ago(20),
  date: Date.today.days_ago(20),
  s_or_c: false,
  r_days: 1,
)

19.times do |n|
  brian.running_days.create!(
    start_date: Date.today.days_ago(20),
    date: Date.today.days_ago(19 - n),
    s_or_c: true,
    r_days: 2 + n,
  )
end

User.second.running_days.create!(
  start_date: Date.today.days_ago(10),
  date: Date.today.days_ago(10),
  s_or_c: false,
  r_days: 1,
)

9.times do |n|
  User.second.running_days.create!(
    start_date: Date.today.days_ago(10),
    date: Date.today.days_ago(9 - n),
    s_or_c: true,
    r_days: 2 + n,
  )
end

User.third.running_days.create!(
  start_date: Date.today.days_ago(5),
  date: Date.today.days_ago(5),
  s_or_c: false,
  r_days: 1,
)

4.times do |n|
  User.third.running_days.create!(
    start_date: Date.today.days_ago(5),
    date: Date.today.days_ago(4 - n),
    s_or_c: true,
    r_days: 2 + n,
  )
end

User.find(4).running_days.create!(
  start_date: Date.today.days_ago(3),
  date: Date.today.days_ago(3),
  s_or_c: false,
  r_days: 1,
)

2.times do |n|
  User.find(4).running_days.create!(
    start_date: Date.today.days_ago(3),
    date: Date.today.days_ago(2 - n),
    s_or_c: true,
    r_days: 2 + n,
  )
end

User.find(5).running_days.create!(
  start_date: Date.today.days_ago(2),
  date: Date.today.days_ago(2),
  s_or_c: false,
  r_days: 1,
)

User.find(5).running_days.create!(
  start_date: Date.today.days_ago(2),
  date: Date.today.days_ago(1),
  s_or_c: false,
  r_days: 2,
)

User.limit(5).each do |user|
  user.running_days.create!(
    start_date: user.running_days.last.start_date,
    date: Date.today,
    s_or_c: true,
    r_days: user.running_days.last.r_days + 1,
  )
end

User.all.offset(5).each do |user|
  user.running_days.create!(
    start_date: Date.today,
    date: Date.today,
    s_or_c: false,
    r_days: 1,
  )
end


brian.create_goal!(
  aim: "自分の武器になるスキル。
海外で商談、交渉、営業ができるレベルの英会話力",
  indicator: "TOEIC900 
TOEFL 100
動画日記累計時間 5400分
英会話レッスン 90回",
  term_start: Date.today,
  term_end: Date.today.next_month(6)
  )
  
guest.create_goal!(
  aim: "目的を書きましょう",
  indicator: "その目的を達成するために必要な行動、
  行動の数値、その他得たいゴールに近づいているか
  を評価できる指標を書きましょう",
  term_start: Date.today,
  term_end: Date.today.next_month(6)
  )
  
mary.create_goal!(
  aim: "キャビンアテンダントになる！",
  indicator: "TOEIC750 
英会話レッスン 60回
英単語3000個覚える
シャドーイング合計180時間",

  term_start: Date.today,
  term_end: Date.today.next_month(6)
  )
  
naru.create_goal!(
  aim: "資格が欲しい！",
  indicator: "TOEIC600",
  term_start: Date.today,
  term_end: Date.today.next_month(6)
  )
  
# user.monthly_goals.create!(
#   monthly_aim: "基礎を固める",
#   monthly_indicator: "単語300個",
#   term_start: Date.today,
#   term_end: Date.today.next_month,
#   goal_actions_attributes: [
#     content: "単語1500",
#     number: 1500,
#   ]
# )

# user.reports.create!(
#   content: "テストじゃぜぇ",
#   report_actions_attributes: [
#     number: 100
#   ]
# )

brian.posts.create!(
  content: "よろしく〜"
)

guest.posts.create!(
  content: "よろしくお願いします"
)

mary.posts.create!(
  content: "メアリーです！よろしく〜"
)

naru.posts.create!(
  content: "異議あり！"
)


tag_name = ["英語", "単語", "英単語", "暗記", "英会話", "シャドーイング", "スピーキング"]

tag_name.each do |name|
  Tag.create!(name: name)
end

article = brian.articles.create!(
  title: "シャドーイングとは？",
  content: "シャドーイングとはテキストを見ずに、音声を後から追いかけるように真似をするトレーニング法です"
)

4.times do |n|
  article.article_tags.create!(tag_id: 1 + n )
end

# tag [
#   "ナダル",
#   "ナダエボ",
#   "ユルサヘンデー",
#   "藤崎マーケット"
#   ]

board = brian.boards.create!(
  title: "単語が覚えられません",
  content: "単語がなかなか覚えられません。何かコツとかありませんか？"
)

mary.board_comments.create!(
  board_id: 1,
  content: "具体例をいくつか見てどういった文脈で使われる単語なのかイメージをを頭に入れると覚えやすくなりますよ！"
)

board.board_tags.create!(tag_id: 1 )

3.times do |n|
  board.board_tags.create!(tag_id: 5 + n )
end

# User.all.each do |user|
#   user.running_days.create!(
#     start_date: Date.today,
#     date: Date.today,
#     s_or_c: false,
#     r_days: 1,
#   )
# end