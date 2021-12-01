# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require './db/content'

# users
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
rumi = User.create!(name: "るみ",
             email: "rumi@example.com",
             password: "012345",
             password_confirmation: "012345",
             )
hiro = User.create!(name: "ひろき",
             email: "hiroki@example.com",
             password: "012345",
             password_confirmation: "012345",
             )
yama = User.create!(name: "やまはる",
             email: "yamaharu@example.com",
             password: "012345",
             password_confirmation: "012345",
             )
             
93.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@example.com"
  password = "012345"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

<<<<<<< HEAD
# avatars
brian.avatar.attach(io: File.open('./app/assets/images/brian.jpg'), filename: 'brian.png', content_type: 'image/jpg')
guest.avatar.attach(io: File.open('./app/assets/images/user.png'), filename: 'user.png', content_type: 'image/png')
mary.avatar.attach(io: File.open('./app/assets/images/cat.jpeg'), filename: 'cat.jpeg', content_type: 'image/jpeg')
naru.avatar.attach(io: File.open('./app/assets/images/dog.jpeg'), filename: 'dog.jpeg', content_type: 'image/jpeg')
rumi.avatar.attach(io: File.open('./app/assets/images/rumi.jpeg'), filename: 'rumi.jpeg', content_type: 'image/jpeg')
hiro.avatar.attach(io: File.open('./app/assets/images/boy.png'), filename: 'boy.png', content_type: 'image/png')
yama.avatar.attach(io: File.open('./app/assets/images/girl.png'), filename: 'girl.png', content_type: 'image/png')

User.all.offset(7).each do |user|
  user.avatar.attach(io: File.open('./app/assets/images/user.png'), filename: 'user.png', content_type: 'image/png')
end

# posts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem::sentence(word_count: 5)
  users.each { |user| user.posts.create!(content: content) }
end

# monthly_goals

brian.monthly_goals.create!(
  monthly_aim: "基礎を固める",
  monthly_indicator: "次のTOEICで400点達成
    基礎テスト8割",
  term_start: Date.today.prev_day(31),
  term_end: Date.today,
  goal_actions_attributes: [
    {
      content: "単語1500個覚える",
      number: 1500,
    },
    {
      content: "日記30ページ (1日1ページ)",
      number: 30,
      
    },
  ]
)

guest.monthly_goals.create!(
  monthly_aim: "月間の目的、得たい結果を書きます",
  monthly_indicator: "その目的が達成できたか判別できる
  定量的な数値や指標、行動あるいは
  その目的達成に近づけそうな指標を書きます",
  term_start: Date.today.prev_day(20),
  term_end: Date.today.next_day(10),
  goal_actions_attributes: [
    {
      content: "目標を達成するためのアクション",
      number: 100,
    },
    {
      content: "シャドーイング30時間",
      number: 30,
    },
  ]
)

mary.monthly_goals.create!(
  monthly_aim: "考えずに反射的に話せるようになる",
  monthly_indicator: "スピーキング系のトレーニングの合計時間が90時間、
  月終わりのレッスンで会話の合間が5秒以上止まることが1度もない",
  term_start: Date.today.prev_day(20),
  term_end: Date.today.next_day(10),
  goal_actions_attributes: [
    {
      content: "動画日記60時間",
      number: 60,
    },
    {
      content: "シャドーイング30時間",
      number: 30,
    },
  ]
)

naru.monthly_goals.create!(
  monthly_aim: "毎日英語を勉強する習慣をつける",
  monthly_indicator: "日記合計30ページと単語帳30ページをマストで達成する",
  term_start: Date.today.prev_day(20),
  term_end: Date.today.next_day(10),
  goal_actions_attributes: [
    {
      content: "単語帳30ページ",
      number: 30,
    },
    {
      content: "日記30ページ",
      number: 30,
    },
  ]
)

rumi.monthly_goals.create!(
  monthly_aim: "語彙力を強化する",
  monthly_indicator: "最低でも新しく覚えた表現が1000個",
  term_start: Date.today.prev_day(20),
  term_end: Date.today.next_day(10),
  goal_actions_attributes: [
    {
      content: "金フレ150ページ",
      number: 150,
    },
    {
      content: "Vintage60ページ",
      number: 60,
    },
  ]
)

hiro.monthly_goals.create!(
  monthly_aim: "発音を改善する",
  monthly_indicator: "発音テストで外国人3人の先生全員から合格をもらう",
  term_start: Date.today.prev_day(20),
  term_end: Date.today.next_day(10),
  goal_actions_attributes: [
    {
      content: "リピーティング 60時間",
      number: 60,
    },
    {
      content: "発音の教材終わらせる(300ページ)",
      number: 300,
    },
  ]
)

yama.monthly_goals.create!(
  monthly_aim: "旅行の際に空港やお店で困らないレベルになる",
  monthly_indicator: "洋画5本見ることと表現100個覚えることを達成する",
  term_start: Date.today.prev_day(20),
  term_end: Date.today.next_day(10),
  goal_actions_attributes: [
    {
      content: "洋画５本",
      number: 5,
    },
    {
      content: "シチェーション別の英会話表現集30ページ",
      number: 30,
    },
  ]
)


User.all.offset(7).each do |user|
  user.monthly_goals.create!(
    monthly_aim: "基礎を固める",
    monthly_indicator: "次のTOEICで400点達成
    基礎テスト8割",
    term_start: Date.today,
    term_end: Date.today.next_month,
    goal_actions_attributes: [
      content: "単語1500個覚える",
      number: 1500,
    ]
  )
end

# Reports

30.times do |n|
  brian.reports.create!(
    content: "テストじゃぜぇ",
    created_at: Time.current.days_ago(30 - n),
    monthly_goal_id: brian.monthly_goals.first.id,
    r_days: 1 + n,
    report_actions_attributes: [
      { number: 30 },
      { number: 1 },
    ]
  )
end

20.times do |n|
  User.second.reports.create!(
    content: "テスト",
    created_at: Time.current.days_ago(20 - n),
    monthly_goal_id: User.second.monthly_goals.first.id,
    r_days: 1 + n,
    report_actions_attributes: [
      { number: 3 },
      { number: 1 },
    ]
  )
end

15.times do |n|
  User.third.reports.create!(
    content: "レポートです",
    created_at: Time.current.days_ago(15 - n),
    monthly_goal_id: User.third.monthly_goals.first.id,
    r_days: 1 + n,
    report_actions_attributes: [
      { number: 1 },
      { number: 1 },
    ]
  )
end

10.times do |n|
  User.find(4).reports.create!(
    content: "今日はいい感じかも",
    created_at: Time.current.days_ago(10 - n),
    monthly_goal_id: User.find(4).monthly_goals.first.id,
    r_days: 1 + n,
    report_actions_attributes: [
      { number: 1 },
      { number: 1 },
    ]
  )
end

5.times do |n|
  User.find(5).reports.create!(
    content: "今日の報告",
    created_at: Time.current.days_ago(5 - n),
    monthly_goal_id: User.find(5).monthly_goals.first.id,
    r_days: 1 + n,
    report_actions_attributes: [
      { number: 4 },
      { number: 1 },
    ]
  )
end

3.times do |n|
  User.find(6).reports.create!(
    content: "スピーキングが難しいです",
    created_at: Time.current.days_ago(3 - n),
    monthly_goal_id: User.find(6).monthly_goals.first.id,
    r_days: 1 + n,
    report_actions_attributes: [
      { number: 1 },
      { number: 3 },
    ]
  )
end

2.times do |n|
  User.find(7).reports.create!(
    content: "外国人の友達ができました",
    created_at: Time.current.days_ago(2 - n),
    monthly_goal_id: User.find(7).monthly_goals.first.id,
    r_days: 1 + n,
    report_actions_attributes: [
      { number: 1 },
      { number: 1 },
    ]
  )
end

User.all.offset(7).each do |user|
  user.reports.create!(
    content: "テストでございます",
    monthly_goal_id: user.monthly_goals.first.id,
    r_days: 1,
    report_actions_attributes: [
      number: 100
    ]
  )
end

# User.limit(7).each do |user|
#   user.reports.create!(
#     content: "テストじゃぜぇ",
#     monthly_goal_id: user.monthly_goals.first.id,
#     r_days: user.reports.first.r_days + 1,
#     report_actions_attributes: [
#       number: 100
#     ]
#   )
# end


brian.reports.create!(
  content: "いい感じで継続ができてます",
  monthly_goal_id: brian.monthly_goals.first.id,
  r_days: brian.reports.first.r_days + 1,
  report_actions_attributes: [
    { number: 45 },
    { number: 1 },
  ]
)

User.second.reports.create!(
  content: "その日の気付きや反省を書きます",
  monthly_goal_id: User.second.monthly_goals.first.id,
  r_days: User.second.reports.first.r_days + 1,
  report_actions_attributes: [
    { number: 3 },
    { number: 1 },
  ]
)

User.third.reports.create!(
  content: "今日は集中できました",
  monthly_goal_id: User.third.monthly_goals.first.id,
  r_days: User.third.reports.first.r_days + 1,
  report_actions_attributes: [
    { number: 1 },
    { number: 1 },
  ]
)

User.find(4).reports.create!(
  content: "毎日やるのが当たり前になって来た気がします！",
  monthly_goal_id: User.find(4).monthly_goals.first.id,
  r_days: User.find(4).reports.first.r_days + 1,
  report_actions_attributes: [
    { number: 1 },
    { number: 1 },
  ]
)

User.find(5).reports.create!(
  content: "イディオムが難しい・・・",
  monthly_goal_id: User.find(5).monthly_goals.first.id,
  r_days: User.find(5).reports.first.r_days + 1,
  report_actions_attributes: [
    { number: 4 },
    { number: 1 },
  ]
)

User.find(6).reports.create!(
  content: "とりあえず3日続いたけど、これから継続できるか心配・・・",
  monthly_goal_id: User.find(6).monthly_goals.first.id,
  r_days: User.find(6).reports.first.r_days + 1,
  report_actions_attributes: [
    { number: 1 },
    { number: 3 },
  ]
)

User.find(7).reports.create!(
  content: "聞き取りがなかなか苦手です。自分が出せる音を増やしていかないとダメですね",
  monthly_goal_id: User.find(7).monthly_goals.first.id,
  r_days: User.find(7).reports.first.r_days + 1,
  report_actions_attributes: [
    { number: 1 },
    { number: 1 },
  ]
)

# Running_days

brian.running_days.create!(
  start_date: Date.today.days_ago(30),
  date: Date.today.days_ago(30),
  created_at: Time.current.days_ago(30),
  s_or_c: false,
  r_days: 1,
)

30.times do |n|
  brian.running_days.create!(
    start_date: Date.today.days_ago(30),
    date: Date.today.days_ago(29 - n),
    created_at: Time.current.days_ago(29 - n),
    s_or_c: true,
    r_days: 2 + n,
  )
end

User.second.running_days.create!(
  start_date: Date.today.days_ago(20),
  date: Date.today.days_ago(20),
  created_at: Time.current.days_ago(20),
  s_or_c: false,
  r_days: 1,
)

20.times do |n|
  User.second.running_days.create!(
    start_date: Date.today.days_ago(20),
    date: Date.today.days_ago(19 - n),
    created_at: Time.current.days_ago(19 - n),
    s_or_c: true,
    r_days: 2 + n,
  )
end

User.third.running_days.create!(
  start_date: Date.today.days_ago(15),
  date: Date.today.days_ago(15),
  created_at: Time.current.days_ago(15),
  s_or_c: false,
  r_days: 1,
)

15.times do |n|
  User.third.running_days.create!(
    start_date: Date.today.days_ago(15),
    date: Date.today.days_ago(14 - n),
    created_at: Time.current.days_ago(14 - n),
    s_or_c: true,
    r_days: 2 + n,
  )
end


User.find(4).running_days.create!(
  start_date: Date.today.days_ago(10),
  date: Date.today.days_ago(10),
  created_at: Time.current.days_ago(10),
  s_or_c: false,
  r_days: 1,
)

10.times do |n|
  User.find(4).running_days.create!(
    start_date: Date.today.days_ago(10),
    date: Date.today.days_ago(9 - n),
    created_at: Time.current.days_ago(9- n),
    s_or_c: true,
    r_days: 2 + n,
  )
end

User.find(5).running_days.create!(
  start_date: Date.today.days_ago(5),
  date: Date.today.days_ago(5),
  created_at: Time.current.days_ago(5),
  s_or_c: false,
  r_days: 1,
)

5.times do |n|
  User.find(5).running_days.create!(
    start_date: Date.today.days_ago(5),
    date: Date.today.days_ago(4 - n),
    created_at: Time.current.days_ago(4 - n),
    s_or_c: true,
    r_days: 2 + n,
  )
end

User.find(6).running_days.create!(
  start_date: Date.today.days_ago(3),
  date: Date.today.days_ago(3),
  created_at: Time.current.days_ago(3),
  s_or_c: false,
  r_days: 1,
)

3.times do |n|
  User.find(6).running_days.create!(
    start_date: Date.today.days_ago(3),
    date: Date.today.days_ago(2 - n),
    created_at: Time.current.days_ago(2 - n),
    s_or_c: true,
    r_days: 2 + n,
  )
end

User.find(7).running_days.create!(
  start_date: Date.today.days_ago(2),
  date: Date.today.days_ago(2),
  created_at: Time.current.days_ago(2),
  s_or_c: false,
  r_days: 1,
)

2.times do |n|
  User.find(7).running_days.create!(
    start_date: Date.today.days_ago(2),
    date: Date.today.days_ago(1 - n),
    created_at: Time.current.days_ago(1 - n),
    s_or_c: true,
    r_days: 2,
  )
end

# User.limit(7).each do |user|
#   user.running_days.create!(
#     start_date: user.running_days.last.start_date,
#     date: Date.today,
#     s_or_c: true,
#     r_days: user.running_days.last.r_days + 1,
#   )
# end

User.all.offset(7).each do |user|
  user.running_days.create!(
    start_date: Date.today,
    date: Date.today,
    s_or_c: false,
    r_days: 1,
  )
end

# goals

brian.create_goal!(
  aim: "自分の武器になるスキル。
海外で商談、交渉、営業ができるレベルの英会話力",
  indicator: "TOEIC900 
TOEFL 100
動画日記累計時間 5400分
英会話レッスン 90回",
  term_start: Date.today.prev_day(31),
  term_end: Date.today.prev_day(31).next_month(6)
  )
  
guest.create_goal!(
  aim: "目的を書きます",
  indicator: "その目的を達成するために必要な行動、
  行動の数値、その他得たいゴールに近づいているか
  を評価できる指標を書きます",
  term_start: Date.today.prev_day(20),
  term_end: Date.today.prev_day(20).next_month(6)
  )
  
mary.create_goal!(
  aim: "キャビンアテンダントになる！",
  indicator: "TOEIC750 
英会話レッスン 60回
英単語3000個覚える
シャドーイング合計180時間",

  term_start: Date.today.prev_day(20),
  term_end: Date.today.prev_day(20).next_month(6)
  )
  
naru.create_goal!(
  aim: "資格が欲しい！",
  indicator: "TOEIC600",
  term_start: Date.today.prev_day(20),
  term_end: Date.today.prev_day(20).next_month(6)
  )

rumi.create_goal!(
  aim: "海外で働く、海外拠点配属をもぎ取る",
  indicator: "TOEFL IBT 80点",
  term_start: Date.today.prev_day(20),
  term_end: Date.today.prev_day(20).next_month(6)
  )

hiro.create_goal!(
  aim: "自分の強みを作る",
  indicator: "IELTS7.0
  TOEIC900",
  term_start: Date.today.prev_day(20),
  term_end: Date.today.prev_day(20).next_month(6)
  )
  
yama.create_goal!(
  aim: "海外旅行を楽しめるようになりたい",
  indicator: "TOEIC600",
  term_start: Date.today.prev_day(20),
  term_end: Date.today.prev_day(20).next_month(6)
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

# posts

brian.posts.create!(
  content: "よろしく〜"
)

guest.posts.create!(
  content: "よろしくお願いします"
)

guest.posts.first.images.attach(
  {
    io: File.open('./app/assets/images/cat.jpeg'), 
    filename: 'cat.jpeg', 
    content_type: 'image/jpeg'
  },
  {
    io: File.open('./app/assets/images/english.jpeg'), 
    filename: 'english.jpeg', 
    content_type: 'image/jpeg'
  }
)

mary.posts.create!(
  content: "メアリーです！よろしく〜"
)

naru.posts.create!(
  content: "明日試験だ・・・　ヤバめ"
)

rumi.posts.create!(
  content: "バイト終わった！　今から英語頑張ります(^-^)b"
)

hiro.posts.create!(
  content: "Rodyがライブやるらしいんだけど誰か一緒に行きません？"
)

yama.posts.create!(
  content: "昨日Simonが奢ってくれた笑 「you made my day! thanks」だって笑"
)

# tags

tag_name = [
  "日記",
  "リピーティング",
  "オーバーラッピング",
  "動画日記",
  "アウトプット", # 5
  "自主練",
  "場所",
  "英会話カフェ",
  "ミートアップ",
  "HUB", # 10
  "ゴールデン街",
  "YouTube",
  "Netflix",
  "継続",
  "CD", # 15
  "続かない",
  "工夫",
  "習慣",
  "Podcast",
  "英語",  # 20
  "単語", 
  "英単語", 
  "暗記", 
  "英会話", 
  "シャドーイング",  # 25
  "スピーキング",
  "発音", # 27
  "単語帳",
  "金フレ",
  "TOEIC", # 30
  "時間配分",
  "ネタ切れ",
  "両立",
  "時間",
  "レッスン", # 35
]

tag_name.each do |name|
  Tag.create!(name: name)
end

# article

article1 = guest.articles.create!(
  title: "一人でもできるアウトプット法",
  content: @art_content1
)

article2 = brian.articles.create!(
  title: "日本で英語を話せる場所ってどこ？",
  content: @art_content2
)

article3 = yama.articles.create!(
  title: "どのように工夫したら続けられるの！？",
  content: @art_content3
)

article4 = hiro.articles.create!(
  title: "Youtubeやってみたんだけど続かない・・・",
  content: @art_content4
)

article5 = rumi.articles.create!(
  title: "シャドーイングとは？",
  content: "シャドーイングとはテキストを見ずに、音声を後から追いかけるように真似をするトレーニング法です"
)

# article tags

6.times do |n|
  article1.article_tags.create!(tag_id: 1 + n )
end

5.times do |n|
  article2.article_tags.create!(tag_id: 7 + n )
end

4.times do |n|
  article3.article_tags.create!(tag_id: 12 + n )
end

4.times do |n|
  article4.article_tags.create!(tag_id: 16 + n )
end

7.times do |n|
  article5.article_tags.create!(tag_id: 20 + n )
end

2.times do |n|
  article4.article_tags.create!(tag_id: 12 + n )
end


# board

board = brian.boards.create!(
  title: "単語が覚えられません",
  content: "単語がなかなか覚えられません。何かコツとかありませんか？"
)

board2 = hiro.boards.create!(
  title: "発音が苦手です",
  content: "上手く発音ができません。コツがあれば教えていただきたいです"
)

board3 = guest.boards.create!(
  title: "おすすめの単語帳とかってありますか？",
  content: "TOEICの金フレを終わらせたところなのですが、新しい単語帳を何にしようか迷っています...
良い教材ご存知の方がいらっしゃいましたら教えていただけますと幸いですm(_ _)m"
)

board4 = yama.boards.create!(
  title: "TOEICの時間配分が上手くいかない",
  content: "いつも大問7の途中で時間切れになってしまいます汗
今まで時間内に解き終わったことがなく悩んでいます...
解く順番って大切なんですかね？時間内に終わらせるために意識してることがあればお聞きしたいです！"
)

board5 = rumi.boards.create!(
  title: "日記のネタが思いつかない",
  content: "毎日英語日記を書いていると何を書こうか結構悩みます笑
みなさんネタ切れになった時ってどうされていますか？"
)

board6 = rumi.boards.create!(
  title: "大学や他の活動との両立が難しい",
  content: "将来、英語を使って仕事がしてみたいので勉強を始めたのですが
ゼミやバイト、就活との両立が難しいなと感じています...

時間がないっていうのは言い訳になってしまうかもしれないのですが、
みなさんはどのように英語に割く時間を作っていますか？
何かアドバイスいただけると嬉しいです"
)

board7 = naru.boards.create!(
  title: "毎回のレッスンで意識していることってありますか？",
  content: "レッスンを受ける上で、意識しておいたほうが良いことって何かありますか？
せっかく外国人の先生と話す機会なので、１回１回を大事にしたいと思っています"
)

mary.board_comments.create!(
  board_id: 1,
  content: "具体例をいくつか見てどういった文脈で使われる単語なのかイメージをを頭に入れると覚えやすくなりますよ！"
)

guest.board_comments.create!(
  board_id: 6,
  content: "僕だったら1日の中で物理的にどれくらい時間が取れるかをまず探しますね。 その日にやらないといけないことを紙でもアプリでもなんでも良いんですけどスケジュールに埋めて、その日の予定を可視化させると英語に使える時間が見つかると思います〜"
)

rumi.board_comments.create!(
  board_id: 6,
  content: "なるほど！！　その日の予定を可視化させれば、なんとなく過ごしてしまう時間を減らせそうですね！　ありがとうございました(^-^)"
)

board.board_tags.create!(tag_id: 20 )

3.times do |n|
  board.board_tags.create!(tag_id: 24 + n )
end

board2.board_tags.create!(tag_id: 27)

3.times do |n|
  board3.board_tags.create!(tag_id: 28 + n )
end

2.times do |n|
  board4.board_tags.create!(tag_id: 30 + n )
end

board5.board_tags.create!(tag_id: 1)
board5.board_tags.create!(tag_id: 32)

2.times do |n|
  board6.board_tags.create!(tag_id: 33 + n )
end

board7.board_tags.create!(tag_id: 35)

# User.all.each do |user|
#   user.running_days.create!(
#     start_date: Date.today,
#     date: Date.today,
#     s_or_c: false,
#     r_days: 1,
#   )
# end