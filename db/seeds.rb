# coding utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# テストデータ
# 10.times do |number|
#   Thank.create(
#                   from_member_id: number + 1,
#                   to_member_id: 10 - number
#   )
# end

# CommunityCommentの中間テーブル
20.times do |number|
  CommunityComment.create(
    comment: "say hello! for #{number} times",
    member_id: number % 4 + 1,
    community_id: number % 3 + 1
  )
end

# MembersCommunityの中間テーブル
10.times do |number|
  MembersCommunity.create(
    member_id: number + 2,
    community_id: number % 3 + 1
  )
end

# MembersDepartmentsの中間テーブル
10.times do |number|
  MembersDepartment.create(
    member_id: number + 1,
    department_id: number % 3 + 1
  )
end

# MembersCommunityの中間テーブル
10.times do |number|
  MembersCommunity.create(
    member_id: number + 1,
    community_id: number % 3 + 1
  )
end

AdminUser.create(
  email: 'rejob.aramaki@gmail.com',
  password: 'jun910')

=begin
# profile_image:"#{number}.jpeg",
# ユーザーデータの作成
# deviseの仕様でpasswordでも入る
10.times do |number|
  Member.create(
    name: "#{number}-member",
    kana: "#{number}-kana",
    # image:"#{number}.jpeg",
    email: "sample#{number}@rejob.co.jp",
    chatwork_id: number + 1,
    birthday: "1992-09-0#{number}",
    indoor_call: "090-3213-083#{number}",
    profile_message: "you are #{number} rejob member!",
    entry_year: "2015-09-0#{number}",
    hobby: "#{number}-like!",
    job: "#{number}-working",
    password: "#{number + 1}123456789",
    main_department_id: number % 3 + 1
  )
end
=end

10.times do |number|
  MemberMessage.create(
    message: "Thank you for #{number} times!",
    from_member_id: 1,
    to_member_id: number + 1,
    message_icon_id: number % 4 + 1
  )
end
# テロップの作成
100.times do |number|
  News.create(
    title: "#{number}-title!",
    content: "Hello the world! for #{number} times.",
    member_id: 1,
    department_id: 1
  )
end

# 本番データの調整
Member.create(
  name: '藤田真維',
  kana: 'ふじたまい',
  email: 'fujita@rejob.co.jp',
  chatwork_id: 'fujitamai',
  birthday: '1992-05-15',
  indoor_call: '',
  profile_message: '飲むの食べるの大好きです。',
  entry_year: '2015-04-01',
  hobby: '食べる、飲む',
  main_department_id: 1,
  job: '',
  password: '1234'
)

Member.create(
  name: '縄田愛美',
  kana: 'なわだめぐみ',
  email: 'nawada@rejob.co.jp',
  chatwork_id: '',
  birthday: '1992-07-19',
  indoor_call: '',
  profile_message: '笑うの大好きです。',
  entry_year: '2015-04-01',
  hobby: '海外旅行',
  main_department_id: 1,
  job: '',
  password: '1234'
)

Member.create(
  name: '後藤裕太',
  kana: 'ごとうゆうた',
  # image:"GOTOU.jpg",
  email: 'goto@rejob.co.jp',
  chatwork_id: 'you.goto.510',
  birthday: '1992/09/05',
  indoor_call: '',
  profile_message: '料理やります。',
  entry_year: '2015-04-01',
  hobby: '料理',
  main_department_id: 1,
  job: '',
  password: '1234'
)

Member.create(
  name: '宮口奨平',
  kana: 'みやぐちしょうへい',
  # image:"MIYAGUCHI.jpg",
  email: 'miyaguchi@rejob.co.jp',
  chatwork_id: 'miyaguchishohei',
  birthday: '1991-08-29',
  indoor_call: '',
  profile_message: '元気に頑張ります',
  entry_year: '2015',
  hobby: 'ギター',
  main_department_id: 1,
  job: '',
  password: '1234'
)

Member.create(
  name: '鄭由美',
  kana: 'ていゆみ',
  # image:"TEI.jpg",
  email: 'tei@rejob.co.jp',
  chatwork_id: 'teiyumi',
  birthday: '1992-08-24',
  indoor_call: '',
  profile_message: '化粧品好きです',
  entry_year: '2015-04-01',
  hobby: '飲むこと',
  main_department_id: 1,
  job: '',
  password: '1234'
)

Member.create(
  name: '吉田奈津美',
  kana: 'よしだなつみ',
  # image:"YOSHIDA.N.jpg",
  email: 'yoshida@rejob.co.jp',
  chatwork_id: 'natsumi_y',
  birthday: '1991-12-12',
  indoor_call: '',
  profile_message: 'くしゃみと笑い声が大きい人が吉田です！',
  entry_year: '2014-04-01',
  hobby: '旅行',
  main_department_id: 1,
  job: '',
  password: '1234'
)

Member.create(
  name: '上田康平',
  kana: 'うえだこうへい',
  # image:"UEDA.K.jpg",
  email: 'ueda_kohei@rejob.co.jp',
  chatwork_id: 'uedakohei',
  birthday: '1992-06-29',
  indoor_call: '',
  profile_message: 'パソコン得意です。',
  entry_year: '2015-04-01',
  hobby: '映画鑑賞',
  main_department_id: 1,
  job: '',
  password: '1234'
)

Member.create(
  name: '鈴木一平',
  kana: 'すずきいっぺい',
  # image:"SUZUKI.jpg",
  email: 'suzuki@rejob.co.jp',
  chatwork_id: '',
  birthday: '1986-02-23',
  indoor_call: '360',
  profile_message: '',
  entry_year: '',
  hobby: '',
  main_department_id: 1,
  job: '代表取締役',
  password: '1234'
)

Member.create(
  name: '長南岳彦',
  kana: 'ちょうなんたけひこ',
  # image:"CHONAN.jpg",
  email: 'chonan@rejob.co.jp',
  chatwork_id: 'tchonan',
  birthday: '1981-09-24',
  indoor_call: '359',
  profile_message: "入社ベースでは現リジョブメンバーの中で一番の古株になりますが、
  気持ちはまだまだ一番若いつもりでいます。モットーはいつ人生を終えても後悔しないこと＝生涯現役。",
  entry_year: '2007-08-01',
  hobby: "身体を動かすことが好きで、ジムに加えて月に1回ほど草野球に参加中。
  ローカル列車での旅行、ディープな居酒屋巡りも好きです。水滸伝、キングダム、ワンピース、サラリーマン金太郎などの漫画もたまに読んでいます。",
  main_department_id: 1,
  job: '役員',
  password: '1234'
)

Member.create(
  name: '植田美保',
  kana: 'うえだみほ',
  # image:"UEDA.jpg",
  email: 'ueda@rejob.co.jp',
  chatwork_id: '',
  birthday: '1987-10-14',
  indoor_call: '616',
  profile_message: '',
  entry_year: '2009-04-01',
  hobby: 'プール・音楽・お酒・食器鑑賞',
  main_department_id: 1,
  job: '世界のより多くの方に「日本が誇る技術とサービス」を伝える',
  password: '1234'
)

Member.create(
  name: '赤羽順子',
  kana: 'あかはねじゅんこ',
  # image:"AKAHANE.jpg",
  email: 'akahane@rejob.co.jp',
  chatwork_id: '',
  birthday: '0212',
  indoor_call: '512',
  profile_message: 'ちっちゃいモンスター',
  entry_year: '',
  hobby: '',
  main_department_id: 1,
  job: 'クライアント支援',
  password: '1234'
)

# 部署データの作成
Department.create(name: '役員')
Department.create(name: '社長室')
Department.create(name: 'CSV推進室')

Department.create(name: 'コーポレート推進室')
Department.create(name: '総務人事部')
Department.create(name: '債務管理部')

Department.create(name: '財務管理部')
Department.create(name: '売上管理部')
Department.create(name: '法人営業Div')

Department.create(name: 'リテール営業Div')
Department.create(name: 'クライアント支援Div')
MainDepartment.create(name: 'リクルーティングDiv')

Department.create(name: 'WebマーケティングDiv')
Department.create(name: 'リアルマーケティングDiv')
Department.create(name: 'FAURA編集部')

Department.create(name: 'エンジニアUNIT')
Department.create(name: 'デザインUNIT')
Department.create(name: 'カイゼンPJT')

Department.create(name: 'リニューアルPJT')
Department.create(name: '介護事業Div')

# Main Departmentの作成
MainDepartment.create(name: '役員')
MainDepartment.create(name: '社長室')
MainDepartment.create(name: 'CSV推進室')

MainDepartment.create(name: 'コーポレイト推進室')
MainDepartment.create(name: '総務人事部')
MainDepartment.create(name: '債務管理部')

MainDepartment.create(name: '財務管理部')
MainDepartment.create(name: '売上管理部')
MainDepartment.create(name: '法人営業Div')

MainDepartment.create(name: 'リテール営業Div')
MainDepartment.create(name: 'クライアント支援Div')
MainDepartment.create(name: 'リクルーティングDiv')

MainDepartment.create(name: 'WebマーケティングDiv')
MainDepartment.create(name: 'リアルマーケティングDiv')
MainDepartment.create(name: 'FAURA編集部')

MainDepartment.create(name: 'エンジニアUNIT')
MainDepartment.create(name: 'デザインUNIT')
MainDepartment.create(name: 'カイゼンPJT')

MainDepartment.create(name: 'リニューアルPJT')

# コミュニティデータの作成
Community.create(
  name: '日本酒の会',
  member_id: 1,
  description: '日本酒おいしいですよ！'
)
Community.create(
  name: 'フットサル部',
  member_id: 1,
  description: 'フットサル無しでは、生きていけませんよ！'
)
Community.create(
  name: 'きっかけ委員',
  member_id: 1,
  description: '部署を超えて、世代を超えて、仕事の話や趣味の話などが個々にできる場のきっかけ作りを企画しております。'
)
Community.create(
  name: 'ヘルスケア部',
  member_id: 1,
  description: 'ジムだけに特に事務の方、積極的にご参加ください！'
)
Community.create(
  name: 'さくらBar',
  member_id: 1,
  description: '部署を超えて、世代を超えて、仕事の話や趣味の話などが個々にできる場のきっかけ作りを企画しております。 '
)
Community.create(
  name: '咲くラボ',
  member_id: 1,
  description: 'みなさんで楽しくご一緒にお勉強しましょう'
)

MessageIcon.create(
  category: 'ありがとう！',
  icon: 'mdi-action-favorite'
)

MessageIcon.create(
  category: 'がんばったね',
  icon: 'mdi-action-thumb-up'
)

MessageIcon.create(
  category: 'お疲れさま',
  icon: 'mdi-action-face-unlock'
)

MessageIcon.create(
  category: 'がんばれ',
  icon: 'mdi-social-whatshot'
)

Medium.create(name:'Rejob Wall')
Medium.create(name:'Faura')
Medium.create(name:'Rejobコーポレート')
Medium.create(name:'社内報')


location = [
"北海道",
"青森県",
"岩手県",
"宮城県",
"秋田県",
"山形県",
"福島県",
"茨城県",
"栃木県",
"群馬県",
"埼玉県",
"千葉県",
"東京都",
"神奈川県",
"新潟県",
"富山県",
"石川県",
"福井県",
"山梨県",
"長野県",
"岐阜県",
"静岡県",
"愛知県",
"三重県",
"滋賀県",
"京都府",
"大阪府",
"兵庫県",
"奈良県",
"和歌山県",
"鳥取県",
"島根県",
"岡山県",
"広島県",
"山口県",
"徳島県",
"香川県",
"愛媛県",
"高知県",
"福岡県",
"佐賀県",
"長崎県",
"熊本県",
"大分県",
"宮崎県",
"鹿児島県",
"沖縄県"
]
location.size.times do |number|
  Prefecture.create(name:location[number])
end

employment_status = [
  '正社員',
  '契約社員',
  '業務委託',
  '役員',
  'アルバイト',
  'インターン'
]

employment_status.size.times do |number|
  EmploymentStatus.create(name:employment_status[number])
end

# コミュニティデータの作成
Event.create(
  name: '日本酒の会',
  community_id: 1,
  member_id: 1,
  description: '日本酒おいしいですよ！'
)
Event.create(
  name: 'フットサル部',
  community_id: 1,
  member_id: 1,

  description: 'フットサル無しでは、生きていけませんよ！'
)
Event.create(
  name: 'きっかけ委員',
  community_id: 1,
  member_id: 1,

  description: '部署を超えて、世代を超えて、仕事の話や趣味の話などが個々にできる場のきっかけ作りを企画しております。'
)
Event.create(
  name: 'ヘルスケア部',
  community_id: 1,
  member_id: 1,

  description: 'ジムだけに特に事務の方、積極的にご参加ください！'
)
Event.create(
  name: 'さくらBar',
  community_id: 1,
  member_id: 1,

  description: '部署を超えて、世代を超えて、仕事の話や趣味の話などが個々にできる場のきっかけ作りを企画しております。 '
)
Event.create(
  name: '咲くラボ',
  community_id: 1,
  member_id: 1,

  description: 'みなさんで楽しくご一緒にお勉強しましょう'
)
10.times do |number|
  MembersEvent.create(
    member_id: number + 1,
    event_id: number % 3 + 1
  )
end
