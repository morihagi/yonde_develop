Program.create!(
  email: 'ado@allnightnippon.com',
  program: 'Adoのオールナイトニッポン',
  personality: 'Ado',
  day: 'mon',
  starting_time: '25:00',
  image_url: 'https://www.allnightnippon.com/wp/assets/uploads/2023/03/Ado_ANN_HP.jpg',
  official_site:'https://www.allnightnippon.com/ado/'
)

Segment.create!(
  segment_title: 'Adoレナリン',
  segment_title_for_email: 'Adoレナリン',
  instruction:'リスナーの皆さんのAdoレナリンが爆発した瞬間を送ってもらうコーナーです。

  メールの書き方は…
  「　××　Adoレナリン･･･　〇〇！　」でお願いします。

  例えば
  ・「えっ、17時までいけんの！？」　　Adoレナリン･･･　　ランチ！！
  ・「えっ、キャンドゥーだって！！」　Adoレナリン･･･　　ずっと何できるんだろうと思ってた近所の空き店舗！',
  official_site_instruction: 'https://www.allnightnippon.com/ado/#:~:text=%E3%80%8CAdo%E3%83%AC%E3%83%8A%E3%83%AA%E3%83%B3%E3%80%8D,%E3%83%AA%E3%83%B3%E3%80%80%E3%80%8D%E3%81%A7%E3%81%8A%E9%A1%98%E3%81%84%E3%81%97%E3%81%BE%E3%81%99',
  default_sentence:'××　Adoレナリン･･･　〇〇！',
  program_id: 1
)

Program.create!(
  email: 'haruko@allnightnippon.com',
  program: '緑黄色社会・長屋晴子のオールナイトニッポンX',
  personality: '緑黄色社会・長屋晴子',
  day: 'tue',
  starting_time: '24:00',
  image_url: 'https://www.allnightnippon.com/wp/assets/uploads/2022/03/6f3c03a6c863bcbce7432bee29cbaf50.jpg',
  official_site:'https://www.allnightnippon.com/haruko/'
)

Segment.create!(
  segment_title: '永久不滅の作り方～長屋晴子の友達の壁～',
  segment_title_for_email: '友達の壁',
  novelty_goods: '友情証明書',
  instruction:'友達になる壁がちょっとだけ高くて独特な長屋晴子。
  自分の友達になる条件をチェックするため、長屋晴子の友達の壁を超えるような、あなたのアピールポイントを送ってください。

  例えば…
  ●スーパーのレジ待ちをしている時、前のお客さんの買い物かごに入っている食材から、その日のメニューを想像して、「酢豚はお肉が固くなりやすいから気をつけて」と笑顔で優しく的確なアドバイスをすることができます。長屋さん、どうですか？
  ●テレビとハードディスクレコーダーなどの配線ができます。IKEAやニトリの家具も、余裕で組み立てられます。たまに、コードやネジが余ってることがあるけど、笑ってすごせる寛大な心を持っています。どうですか？

  こんな感じであなたのアピールポイントを送ってください。どうやらこの壁は分厚くて高いらしい…。',
  official_site_instruction: 'https://www.allnightnippon.com/haruko/#:~:text=%E6%B0%B8%E4%B9%85%E4%B8%8D%E6%BB%85%E3%81%AE,%E3%81%8A%E9%80%81%E3%82%8A%E3%81%97%E3%81%BE%E3%81%99%E3%80%82',
  program_id: 2
)

User.create!(
  email: 'example@sample.com',
  password: 'password12',
  password_confirmation: 'password12',
  agreement: true
)

Profile.create!(
  user_id: 1,
  legal_name: 'はぎはら',
  prefecture: '東京都',
  city: '千代田区',
  other_address: '有楽町1-9-3',
  phone: '03-3287-1111',
  radio_name: 'サンプル',
  zip_code: '0000006'
)

30.times do
  Post.create!(
    email_for_post: 'example@sample.com',
    prefecture: Faker::Address.state,
    city: Faker::Address.city,
    radio_name: Faker::Name.name,
    zip_code: Faker::Number.between(from: 100, to: 999),
    other_address: Faker::Address.street_address,
    legal_name: Faker::Name.name,
    favorite_status: 'unlike',
    post_status: 'draft',
    body: Faker::Lorem.paragraph(sentence_count: 5),
    user_id: 1,
    segment_id: 1
  )
end
