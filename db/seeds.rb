# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User
User.create!(
  [
    {
      email: 'jonny@gmail.com',
      password: 'jonny1234',
      nickname: '波乗りJonny',
      lastname: 'Naminori',
      firstname: 'Jonny',
      lastname_kana: 'ナミノリ',
      firstname_kana: 'ジョニー',
      birthday_year: '2000',
      birthday_month: '1',
      birthday_day: '1',
      phonenumber: '09012345678'
    },
    {
      email: 'samurai@gmail.com',
      password: 'samurai2345',
      nickname: 'さすらいの侍',
      lastname: 'Sasurai',
      firstname: 'Samurai',
      lastname_kana: 'サスライ',
      firstname_kana: 'サムライ',
      birthday_year: '1992',
      birthday_month: '3',
      birthday_day: '3',
      phonenumber: '08033333333'
    },
    {
      email: 'omochi@gmail.com',
      password: 'omochi3456',
      nickname: 'お餅にはおしるこ',
      lastname: 'oshiruko',
      firstname: 'omochi',
      lastname_kana: 'オシルコ',
      firstname_kana: 'オモチ',
      birthday_year: '1993',
      birthday_month: '5',
      birthday_day: '18',
      phonenumber: '08055555555'
    }
  ]
)

Address.create!(
  [
    {
      lastname: 'Naminori',
      firstname: 'Jonny',
      lastname_kana: 'ナミノリ',
      firstname_kana: 'ジョニー',
      postcode:       "123-4567",
      prefectures:    "神奈川",
      city:           "横浜市緑区",
      street_num:     "青山5-1-1",
      building:       "柳ビル103",
      home_call_num:  "09000000000",
      user_id:         "1"
    },
    {
      lastname: 'Sasurai',
      firstname: 'Samurai',
      lastname_kana: 'サスライ',
      firstname_kana: 'サムライ',
      postcode:       "123-4567",
      prefectures:    "神奈川",
      city:           "横浜市緑区",
      street_num:     "青山5-1-1",
      building:       "柳ビル103",
      home_call_num:  "09000000099",
      user_id:         "2"
    },
    {
      lastname: 'oshiruko',
      firstname: 'omochi',
      lastname_kana: 'オシルコ',
      firstname_kana: 'オモチ',
      postcode:       "123-4567",
      prefectures:    "神奈川",
      city:           "横浜市緑区",
      street_num:     "青山5-1-1",
      building:       "柳ビル103",
      home_call_num:  "09000009999",
      user_id:         "3"
    }
  ]
)


# # ブランド レディース
Brand.create!(
  [
    {
      name: 'グッチ'
    },
    {
      name: 'シャネル'
    }
  ]
)

# # ブランド メンズ
Brand.create!(
  [
    {
      name: 'ナイキ'
    },
    {
      name: 'プーマ'
    }
  ]
)

# # ブランド ベビー・キッズ
Brand.create!(
  [
    {
      name: '西松屋'
    }
  ]
)

# # ブランド インテリア・住まい・小物
Brand.create!(
  [
    {
      name: 'イケア'
    },
    {
      name: '無印用品'
    }
  ]
)

# # 本・音楽・ゲーム
Brand.create!(
  [
    {
      name: 'ニンテンドー'
    },
    {
      name: 'カドカワ文庫'
    }

  ]
)

# # おもちゃ・ホビー・グッズ
Brand.create!(
  [
    {
      name: 'タカラトミー'
    }
  ]
)

# # ブランド コスメ・香水・美容
Brand.create!(
  [
    {
      name: 'クロエ'
    },
    {
      name: 'Dior'
    }
  ]
)

# # ブランド 家電・スマホ・カメラ
Brand.create!(
  [
    {
      name: 'Apple'
    },
    {
      name: 'パナソニック'
    }
  ]
)

# # ブランド スポーツ・レジャー
Brand.create!(
  [
    {
      name: 'アディダス'
    },
    {
      name: 'バタフライ'
    }
  ]
)

# # ハンドメイド
Brand.create!(
  [
    {
      name: 'ワクワクハンド'
    }
  ]
)

# # チケット
Brand.create!(
  [
    {
      name: '大黒屋'
    },
    {
      name: 'ワクワクチケット'
    }
  ]
)

# # 自動車・オートバイ
Brand.create!(
  [
    {
      name: 'スズキ'
    },
    {
      name: 'スペースワールド'
    }
  ]
)

# # その他
Brand.create!(
  [
    {
      name: 'ディズニー'
    },
    {
      name: 'ネスレ'
    }
  ]
)

# 親カテゴリー
lady = Category.create(name: "レディース")
man = Category.create(name: "メンズ")
baby = Category.create(name: "ベビー・キッズ")
home = Category.create(name: "インテリア・住まい・小物")
book = Category.create(name: "本・音楽・ゲーム")
hobby = Category.create(name: "おもちゃ・ホビー・グッズ")
beauty = Category.create(name: "コスメ・香水・美容")
mech = Category.create(name: "家電・スマホ・カメラ")
sport = Category.create(name: "スポーツ・レジャー")
handmade = Category.create(name: "ハンドメイド")
ticket = Category.create(name: "チケット")
mobil = Category.create(name: "自動車・オートバイ")
other = Category.create(name: "その他")

# レディースの子カテゴリ
lady_tops = lady.children.create(name: "トップス")
lady_jacket = lady.children.create(name: "ジャケット/アウター")
lady_pants = lady.children.create(name: "パンツ")
lady_skirt = lady.children.create(name: "スカート")
lady_onepiece = lady.children.create(name: "ワンピース")
lady_other = lady.children.create(name: "その他")
# レディースの孫カテゴリ
lady_tops.children.create([{ name: "Tシャツ/カットソー(半袖/袖なし)" }, { name: "Tシャツ/カットソー(七分/長袖)" }, { name: "シャツ/ブラウス(半袖/袖なし)" }, { name: "シャツ/ブラウス(七分/長袖)" }, { name: "ポロシャツ" }, { name: "キャミソール" }, { name: "タンクトップ" }, { name: "ホルターネック" }, { name: "ニット/セーター" }, { name: "チュニック" }, { name: "カーディガン/ボレロ" }, { name: "アンサンブル" }, { name: "ベスト/ジレ" }, { name: "パーカー" }, { name: "トレーナー/スウェット" }, { name: "ベアトップ/チューブトップ" }, { name: "ジャージ" }, { name: "その他" }])
lady_jacket.children.create([{ name: "テーラードジャケット" }, { name: "ノーカラージャケット" }, { name: "Gジャン/デニムジャケット" }, { name: "レザージャケット" }, { name: "ダウンジャケット" }, { name: "ライダースジャケット" }, { name: "ミリタリージャケット" }, { name: "ダウンベスト" }, { name: "ジャンパー/ブルゾン" }, { name: "ポンチョ" }, { name: "ロングコート" }, { name: "トレンチコート" }, { name: "ダッフルコート" }, { name: "ピーコート" }, { name: "チェスターコート" }, { name: "モッズコート" }, { name: "スタジャン" }, { name: "毛皮/ファーコート" }, { name: "スプリングコート" }, { name: "スカジャン" }, { name: "その他" }])
lady_pants.children.create([{ name: "デニム/ジーンズ" }, { name: "ショートパンツ" }, { name: "カジュアルパンツ" }, { name: "ハーフパンツ" }, { name: "チノパン" }, { name: "ワークパンツ/カーゴパンツ" }, { name: "クロップドパンツ" }, { name: "サロペット/オーバーオール" }, { name: "オールインワン" }, { name: "サルエルパンツ" }, { name: "ガウチョパンツ" }, { name: "その他" }])
lady_skirt.children.create([{ name: "ミニスカート" }, { name: "ひざ丈スカート" }, { name: "ロングスカート" }, { name: "キュロット" }, { name: "その他" }])
lady_onepiece.children.create([{ name: "ミニワンピース" }, { name: "ひざ丈ワンピース" }, { name: "ロングワンピース" }, { name: "その他" }])
lady_other.children.create([{ name: "スカートスーツ上下" }, { name: "パンツスーツ上下" }, { name: "ドレス" }, { name: "パーティーバッグ" }, { name: "シューズ" }, { name: "ウェディング" }])

# メンズの子カテゴリ
man_tops = man.children.create(name: "トップス")
man_jacket = man.children.create(name: "ジャケット/アウター")
man_pants = man.children.create(name: "パンツ")
man_suits = man.children.create(name: "スーツ")
man_other = man.children.create(name: "その他")
# メンズの孫カテゴリ
man_tops.children.create([{ name: "トップス" }, { name: "アウター" }, { name: "パンツ" }, { name: "おくるみ" }, { name: "下着/肌着" }, { name: "パジャマ" }, { name: "ロンパース" }, { name: "その他" }])
man_jacket.children.create([{ name: "コート" }, { name: "ジャケット/上着" }, { name: "トップス(Tシャツ/カットソー)" }, { name: "トップス(トレーナー)" }, { name: "トップス(チュニック)" }, { name: "トップス(タンクトップ)" }, { name: "トップス(その他)" }])
man_pants.children.create([{ name: "デニム/ジーンズ" }, { name: "ショートパンツ" }, { name: "カジュアルパンツ" }, { name: "ハーフパンツ" }, { name: "チノパン" }, { name: "ワークパンツ/カーゴパンツ" }, { name: "クロップドパンツ" }, { name: "サロペット/オーバーオール" }, { name: "オールインワン" }, { name: "サルエルパンツ" }, { name: "ガウチョパンツ" }, { name: "その他" }])
man_suits.children.create([{ name: "パンツ" }, { name: "セットアップ" }, { name: "パジャマ" }, { name: "フォーマル/ドレス" }, { name: "和服" }, { name: "浴衣" }, { name: "甚平" }, { name: "水着" }, { name: "その他" }])
man_other.children.create([{ name: "スニーカー" }, { name: "サンダル" }, { name: "ブーツ" }, { name: "長靴" }, { name: "靴下/スパッツ" }, { name: "帽子" }, { name: "エプロン" }, { name: "サスペンダー" }, { name: "タイツ" }, { name: "ハンカチ" }, { name: "バンダナ" }, { name: "ベルト" }, { name: "マフラー" }, { name: "傘" }, { name: "手袋" }, { name: "スタイ" }, { name: "バッグ" }, { name: "その他" }])

# ベビーの子カテゴリ
baby_girl = baby.children.create(name: "ベビー服(女の子用)")
baby_boy = baby.children.create(name: "ベビー服(男の子用)")
baby_item = baby.children.create(name: "子ども用ファッション小物")
baby_toilet = baby.children.create(name: "おむつ/トイレ/バス")
baby_other = baby.children.create(name: "その他")
# ベビーの孫カテゴリ
baby_girl.children.create([{ name: "コート" }, { name: "ジャケット/上着" }, { name: "トップス(Tシャツ/カットソー)" }, { name: "トップス(トレーナー)" }, { name: "トップス(その他)" }, { name: "ボトムス" }, { name: "パジャマ" }, { name: "その他" }])
baby_boy.children.create([{ name: "コート" }, { name: "ジャケット/上着" }, { name: "トップス(Tシャツ/カットソー)" }, { name: "トップス(トレーナー)" }, { name: "トップス(その他)" }, { name: "ボトムス" }, { name: "パジャマ" }, { name: "その他" }])
baby_item.children.create([{ name: "おふろのおもちゃ" }, { name: "がらがら" }, { name: "オルゴール" }, { name: "ベビージム" }, { name: "手押し車/カタカタ" }, { name: "知育玩具" }, { name: "その他" }])
baby_toilet.children.create([{ name: "おむつ用品" }, { name: "おまる/補助便座" }, { name: "トレーニングパンツ" }, { name: "ベビーバス" }, { name: "お風呂用品" }, { name: "その他" }])
baby_other.children.create([{ name: "お宮参り用品" }, { name: "お食い初め用品" }, { name: "アルバム" }, { name: "手形/足形" }, { name: "その他" }])

# 家庭用品の子カテゴリ
home_kitchen = home.children.create(name: "キッチン/食器")
home_bed = home.children.create(name: "ベッド/マットレス")
home_sofa = home.children.create(name: "ソファ/ソファベッド")
home_chair = home.children.create(name: "椅子/チェア")
home_table = home.children.create(name: "机/テーブル")
home_other = home.children.create(name: "その他")
# 家庭用品の孫カテゴリ
home_kitchen.children.create([{ name: "食器" }, { name: "調理器具" }, { name: "収納/キッチン雑貨" }, { name: "弁当用品" }, { name: "カトラリー(スプーン等)" }, { name: "テーブル用品" }, { name: "容器" }, { name: "エプロン" }, { name: "アルコールグッズ" }, { name: "浄水機" }, { name: "その他" }])
home_bed.children.create([{ name: "セミシングルベッド" }, { name: "シングルベッド" }, { name: "セミダブルベッド" }, { name: "ダブルベッド" }, { name: "ワイドダブルベッド" }, { name: "クイーンベッド" }, { name: "キングベッド" }, { name: "脚付きマットレスベッド" }, { name: "マットレス" }, { name: "すのこベッド" }, { name: "ロフトベッド/システムベッド" }, { name: "簡易ベッド/折りたたみベッド" }, { name: "収納付き" }, { name: "その他" }])
home_sofa.children.create([{ name: "ソファセット" }, { name: "シングルソファ" }, { name: "ラブソファ" }, { name: "トリプルソファ" }, { name: "オットマン" }, { name: "コーナーソファ" }, { name: "ビーズソファ/クッションソファ" }, { name: "ローソファ/フロアソファ" }, { name: "ソファベッド" }, { name: "応接セット" }, { name: "ソファカバー" }, { name: "リクライニングソファ" }, { name: "その他" }])
home_chair.children.create([{ name: "一般" }, { name: "スツール" }, { name: "ダイニングチェア" }, { name: "ハイバックチェア" }, { name: "ロッキングチェア" }, { name: "座椅子" }, { name: "折り畳みイス" }, { name: "デスクチェア" }, { name: "その他" }])
home_table.children.create([{ name: "こたつ" }, { name: "カウンターテーブル" }, { name: "サイドテーブル" }, { name: "センターテーブル" }, { name: "ダイニングテーブル" }, { name: "座卓/ちゃぶ台" }, { name: "アウトドア用" }, { name: "パソコン用" }, { name: "事務机/学習机" }, { name: "その他" }])
home_other.children.create([{ name: "正月" }, { name: "成人式" }, { name: "バレンタインデー" }, { name: "ひな祭り" }, { name: "子どもの日" }, { name: "母の日" }, { name: "父の日" }, { name: "サマーギフト/お中元" }, { name: "夏/夏休み" }, { name: "ハロウィン" }, { name: "敬老の日" }, { name: "七五三" }, { name: "お歳暮" }, { name: "クリスマス" }, { name: "冬一般" }, { name: "その他" }])

# 本の子カテゴリ
book_book = book.children.create(name: "本")
book_manga = book.children.create(name: "漫画")
book_cd = book.children.create(name: "CD")
book_game = book.children.create(name: "テレビゲーム")
# 本の孫カテゴリ
book_book.children.create([{ name: "文学/小説" }, { name: "人文/社会" }, { name: "ノンフィクション/教養" }, { name: "地図/旅行ガイド" }, { name: "ビジネス/経済" }, { name: "健康/医学" }, { name: "コンピュータ/IT" }, { name: "趣味/スポーツ/実用" }, { name: "住まい/暮らし/子育て" }, { name: "アート/エンタメ" }, { name: "洋書" }, { name: "絵本" }, { name: "参考書" }, { name: "その他" }])
book_manga.children.create([{ name: "全巻セット" }, { name: "少年漫画" }, { name: "少女漫画" }, { name: "青年漫画" }, { name: "女性漫画" }, { name: "同人誌" }, { name: "その他" }])
book_cd.children.create([{ name: "邦楽" }, { name: "洋楽" }, { name: "アニメ" }, { name: "クラシック" }, { name: "K-POP/アジア" }, { name: "キッズ/ファミリー" }, { name: "その他" }])
book_game.children.create([{ name: "家庭用ゲーム本体" }, { name: "家庭用ゲームソフト" }, { name: "携帯用ゲーム本体" }, { name: "携帯用ゲームソフト" }, { name: "PCゲーム" }, { name: "その他" }])

# 趣味の子カテゴリ
hobby_toy = hobby.children.create(name: "おもちゃ")
hobby_card = hobby.children.create(name: "トレーディングカード")
hobby_figure = hobby.children.create(name: "フィギュア")
hobby_instrument = hobby.children.create(name: "楽器/器材")
hobby_other = hobby.children.create(name: "その他")
# 趣味の孫カテゴリ
hobby_toy.children.create([{ name: "キャラクターグッズ" }, { name: "ぬいぐるみ" }, { name: "小物/アクセサリー" }, { name: "模型/プラモデル" }, { name: "ミニカー" }, { name: "トイラジコン" }, { name: "プラモデル" }, { name: "ホビーラジコン" }, { name: "鉄道模型" }, { name: "その他" }])
hobby_card.children.create([{ name: "遊戯王" }, { name: "マジック：ザ・ギャザリング" }, { name: "ポケモンカードゲーム" }, { name: "デュエルマスターズ" }, { name: "バトルスピリッツ" }, { name: "プリパラ" }, { name: "アイカツ" }, { name: "カードファイト!!ヴァンガード" }, { name: "ヴァイスシュヴァルツ" }, { name: "プロ野球オーナーズリーグ" }, { name: "ベースボールヒーローズ" }, { name: "ドラゴンボール" }, { name: "スリーブ" }, { name: "その他" }])
hobby_figure.children.create([{ name: "コミック/アニメ" }, { name: "特撮" }, { name: "ゲームキャラクター" }, { name: "SF/ファンタジー/ホラー" }, { name: "アメコミ" }, { name: "スポーツ" }, { name: "ミリタリー" }, { name: "その他" }])
hobby_instrument.children.create([{ name: "エレキギター" }, { name: "アコースティックギター" }, { name: "ベース" }, { name: "エフェクター" }, { name: "アンプ" }, { name: "弦楽器" }, { name: "管楽器" }, { name: "鍵盤楽器" }, { name: "打楽器" }, { name: "和楽器" }, { name: "楽譜/スコア" }, { name: "レコーディング/PA機器" }, { name: "DJ機器" }, { name: "DTM/DAW" }, { name: "その他" }])
hobby_other.children.create([{ name: "トランプ/UNO" }, { name: "カルタ/百人一首" }, { name: "ダーツ" }, { name: "ビリヤード" }, { name: "麻雀" }, { name: "パズル/ジグソーパズル" }, { name: "囲碁/将棋" }, { name: "オセロ/チェス" }, { name: "人生ゲーム" }, { name: "野球/サッカーゲーム" }, { name: "スポーツ" }, { name: "三輪車/乗り物" }, { name: "ヨーヨー" }, { name: "模型製作用品" }, { name: "鉄道" }, { name: "航空機" }, { name: "アマチュア無線" }, { name: "パチンコ/パチスロ" }, { name: "その他" }])

# 美容の子カテゴリ
beauty_base = beauty.children.create(name: "ベースメイク")
beauty_makeup = beauty.children.create(name: "メイクアップ")
beauty_other = beauty.children.create(name: "その他")
# 美容の孫カテゴリ
beauty_base.children.create([{ name: "ファンデーション" }, { name: "化粧下地" }, { name: "コントロールカラー" }, { name: "BBクリーム" }, { name: "CCクリーム" }, { name: "コンシーラー" }, { name: "フェイスパウダー" }, { name: "トライアルセット/サンプル" }, { name: "その他" }])
beauty_makeup.children.create([{ name: "アイシャドウ" }, { name: "口紅" }, { name: "リップグロス" }, { name: "リップライナー" }, { name: "チーク" }, { name: "フェイスカラー" }, { name: "マスカラ" }, { name: "アイライナー" }, { name: "つけまつげ" }, { name: "アイブロウペンシル" }, { name: "パウダーアイブロウ" }, { name: "眉マスカラ" }, { name: "トライアルセット/サンプル" }, { name: "メイク道具/化粧小物" }, { name: "美顔用品/美顔ローラー" }, { name: "その他" }])
beauty_other.children.create([{ name: "健康用品" }, { name: "看護/介護用品" }, { name: "救急/衛生用品" }, { name: "その他" }])

# 機械の子カテゴリ
mech_phone = mech.children.create(name: "スマートフォン/携帯電話")
mech_pc = mech.children.create(name: "PC/タブレット")
mech_camera = mech.children.create(name: "カメラ")
mech_other = mech.children.create(name: "その他")
# 機械の孫カテゴリ
mech_phone.children.create([{ name: "スマートフォン本体" }, { name: "バッテリー/充電器" }, { name: "携帯電話本体" }, { name: "PHS本体" }, { name: "その他" }])
mech_pc.children.create([{ name: "タブレット" }, { name: "ノートPC" }, { name: "デスクトップ型PC" }, { name: "ディスプレイ" }, { name: "電子ブックリーダー" }, { name: "PC周辺機器" }, { name: "PCパーツ" }, { name: "その他" }])
mech_camera.children.create([{ name: "デジタルカメラ" }, { name: "ビデオカメラ" }, { name: "レンズ(単焦点)" }, { name: "レンズ(ズーム)" }, { name: "フィルムカメラ" }, { name: "防犯カメラ" }, { name: "その他" }])
mech_other.children.create([{ name: "ポータブルプレーヤー" }, { name: "イヤフォン" }, { name: "ヘッドフォン" }, { name: "アンプ" }, { name: "スピーカー" }, { name: "ケーブル/シールド" }, { name: "ラジオ" }, { name: "その他" }])

# スポーツの子カテゴリ
sport_fishing = sport.children.create(name: "フィッシング")
sport_training = sport.children.create(name: "トレーニング/エクササイズ")
sport_soccer = sport.children.create(name: "サッカー/フットサル")
sport_other = sport.children.create(name: "その他")
# スポーツの孫カテゴリ
sport_fishing.children.create([{ name: "ロッド" }, { name: "リール" }, { name: "ルアー用品" }, { name: "ウエア" }, { name: "釣り糸/ライン" }, { name: "その他" }])
sport_training.children.create([{ name: "ランニング" }, { name: "ウォーキング" }, { name: "ヨガ" }, { name: "トレーニング用品" }, { name: "その他" }])
sport_soccer.children.create([{ name: "ウェア" }, { name: "シューズ" }, { name: "ボール" }, { name: "アクセサリー" }, { name: "記念グッズ" }, { name: "応援グッズ" }, { name: "その他" }])
sport_other.children.create([{ name: "ダンス/バレエ" }, { name: "サーフィン" }, { name: "バスケットボール" }, { name: "バドミントン" }, { name: "バレーボール" }, { name: "スケートボード" }, { name: "陸上競技" }, { name: "ラグビー" }, { name: "アメリカンフットボール" }, { name: "ボクシング" }, { name: "ボウリング" }, { name: "その他" }])

# ハンドメイドの子カテゴリ
handmade_item = handmade.children.create(name: "ファッション/小物")
handmade_accessory = handmade.children.create(name: "アクセサリー/時計")
handmade_interior = handmade.children.create(name: "日用品/インテリア")
handmade_other = handmade.children.create(name: "その他")
# ハンドメイドの孫カテゴリ
handmade_item.children.create([{ name: "ピアス" }, { name: "イヤリング" }, { name: "ネックレス" }, { name: "ブレスレット" }, { name: "リング" }, { name: "チャーム" }, { name: "ヘアゴム" }, { name: "アンクレット" }, { name: "その他" }])
handmade_accessory.children.create([{ name: "アクセサリー(男性用)" }, { name: "時計(女性用)" }, { name: "時計(男性用)" }, { name: "その他" }])
handmade_interior.children.create([{ name: "クラフト/布製品" }, { name: "おもちゃ/人形" }, { name: "その他" }])
handmade_other.children.create([{ name: "バッグ(女性用)" }, { name: "バッグ(男性用)" }, { name: "財布(女性用)" }, { name: "財布(男性用)" }, { name: "ファッション雑貨" }, { name: "その他" }])

# チケットの子カテゴリ
ticket_music = ticket.children.create(name: "音楽")
ticket_sport = ticket.children.create(name: "スポーツ")
ticket_show = ticket.children.create(name: "演劇/芸能")
ticket_other = ticket.children.create(name: "その他")
# チケットの孫カテゴリ
ticket_music.children.create([{ name: "男性アイドル" }, { name: "女性アイドル" }, { name: "韓流" }, { name: "国内アーティスト" }, { name: "海外アーティスト" }, { name: "音楽フェス" }, { name: "声優/アニメ" }, { name: "その他" }])
ticket_sport.children.create([{ name: "サッカー" }, { name: "野球" }, { name: "テニス" }, { name: "格闘技/プロレス" }, { name: "相撲/武道" }, { name: "ゴルフ" }, { name: "バレーボール" }, { name: "バスケットボール" }, { name: "モータースポーツ" }, { name: "ウィンタースポーツ" }, { name: "その他" }])
ticket_show.children.create([{ name: "ミュージカル" }, { name: "演劇" }, { name: "伝統芸能" }, { name: "落語" }, { name: "お笑い" }, { name: "オペラ" }, { name: "サーカス" }, { name: "バレエ" }, { name: "その他" }])
ticket_other.children.create([{ name: "ショッピング" }, { name: "レストラン/食事券" }, { name: "フード/ドリンク券" }, { name: "宿泊券" }, { name: "その他" }])

# 自動車の子カテゴリ
mobil_car = mobil.children.create(name: "自動車本体")
mobil_carpart = mobil.children.create(name: "自動車アクセサリー")
mobil_bike = mobil.children.create(name: "オートバイ車体")
mobil_other = mobil.children.create(name: "その他")
# 自動車の孫カテゴリ
mobil_car.children.create([{ name: "国内自動車本体" }, { name: "外国自動車本体" }, { name: "タイヤ/ホイールセット" }, { name: "タイヤ" }, { name: "ホイール" }, { name: "その他" }])
mobil_carpart.children.create([{ name: "車内アクセサリー" }, { name: "カーナビ" }, { name: "カーオーディオ" }, { name: "車外アクセサリー" }, { name: "メンテナンス用品" }, { name: "チャイルドシート" }, { name: "ドライブレコーダー" }, { name: "レーダー探知機" }, { name: "カタログ/マニュアル" }, { name: "セキュリティ" }, { name: "ETC" }, { name: "その他" }])
mobil_bike.children.create([{ name: "国内車本体" }, { name: "外国車本体" }, { name: "タイヤ" }, { name: "マフラー" }, { name: "エンジン、冷却装置" }, { name: "外国オートバイ用パーツ" }, { name: "その他" }])
mobil_other.children.create([{ name: "ヘルメット/シールド" }, { name: "バイクウエア/装備" }, { name: "アクセサリー" }, { name: "メンテナンス" }, { name: "カタログ/マニュアル" }, { name: "その他" }])

# その他の子カテゴリ
other_matome = other.children.create(name: "まとめ売り")
other_food = other.children.create(name: "食品")
other_drink = other.children.create(name: "飲料/酒")
other_other = other.children.create(name: "その他")
# その他の孫カテゴリ
other_matome.children.create([{ name: "ペットフード" }, { name: "犬用品" }, { name: "猫用品" }, { name: "魚用品/水草" }, { name: "小動物用品" }, { name: "爬虫類/両生類用品" }, { name: "かご/おり" }, { name: "鳥用品" }, { name: "虫類用品" }, { name: "その他" }])
other_food.children.create([{ name: "菓子" }, { name: "米" }, { name: "野菜" }, { name: "果物" }, { name: "調味料" }, { name: "魚介類(加工食品)" }, { name: "肉類(加工食品)" }, { name: "その他 加工食品" }, { name: "その他" }])
other_drink.children.create([{ name: "コーヒー" }, { name: "ソフトドリンク" }, { name: "ミネラルウォーター" }, { name: "茶" }, { name: "ウイスキー" }, { name: "ワイン" }, { name: "ブランデー" }, { name: "焼酎" }, { name: "日本酒" }, { name: "ビール、発泡酒" }, { name: "その他" }])
other_other.children.create([{ name: "オフィス用品一般" }, { name: "オフィス家具" }, { name: "店舗用品" }, { name: "OA機器" }, { name: "ラッピング/包装" }, { name: "その他" }])

# アイテム レディース
Item.create!(
  [
    {
      name: 'シャネルセール品３点',
      price: '15000',
      usage_status: '新品',
      description: 'お買い得！シャネルのおしゃれアイテム３点セット',
      selling_status: '出品中',
      delivery_fee: '100',
      delivery_way: 'Fmarket便',
      delivery_area: '埼玉県',
      shipping_date: '20191109',
      user_id: '1',
      brand_id: '2',
      category_id: '80',
      payment_status: '支払済'
    },
    {
      name: 'カビゴン着ぐるみ',
      price: '3500',
      usage_status: '新品',
      description: 'カビゴンを着て美味しいものを食べに行こう',
      selling_status: '売却済み',
      delivery_fee: '100',
      delivery_way: 'Fmarket便',
      delivery_area: '東京都',
      shipping_date: '20191110',
      user_id: '1',
      brand_id: '7',
      category_id: '80',
      payment_status: '支払済'
    },
    {
      name: 'グッチTシャツ',
      price: '3500',
      usage_status: '新品',
      description: 'ヤングでトレンディなTシャツ',
      selling_status: '売却済み',
      delivery_fee: '100',
      delivery_way: 'Fmarket便',
      delivery_area: '徳島県',
      shipping_date: '20191224',
      user_id: '1',
      brand_id: '1',
      category_id: '20',
      payment_status: '支払済'
    }

  ]
)

# アイテム メンズ
Item.create!(
  [
    {
      name: '黄金に輝く胸筋',
      price: '50000',
      usage_status: '新品',
      description: 'まるで太陽のように輝く筋肉。今だけセール中',
      selling_status: '出品中',
      delivery_fee: '2000',
      delivery_way: 'Fmarket便',
      delivery_area: '東京都',
      shipping_date: '20191108',
      user_id: '2',
      brand_id: '3',
      category_id: '144',
      payment_status: '支払済'

    },
    {
      name: 'ブラウンニット',
      price: '12000',
      usage_status: '新品',
      description: 'この季節に一押しのニット。彼女とのデートでも好印象',
      selling_status: '出品中',
      delivery_fee: '2000',
      delivery_way: 'Fmarket便',
      delivery_area: '東京都',
      shipping_date: '20191108',
      user_id: '2',
      brand_id: '4',
      category_id: '91',
      payment_status: '支払済'

    },
    {
      name: 'イケてるトレンチコート',
      price: '15000',
      usage_status: '新品',
      description: 'ビジネスもクールにこなせる旬のトレンチコート',
      selling_status: '出品中',
      delivery_fee: '2000',
      delivery_way: '普通郵便',
      delivery_area: '島根県',
      shipping_date: '20191111',
      user_id: '3',
      brand_id: '6',
      category_id: '99',
      payment_status: '支払済'

    }

  ]
)

# アイテム キッズ・ベイビー
Item.create!(
  [
    {
      name: 'ボスベイビーと遊べる券',
      price: '2000',
      usage_status: '新品',
      description: 'あのボスベイビーがあなたの元にやってくる',
      selling_status: '取引中',
      delivery_fee: '10',
      delivery_way: '普通郵便',
      delivery_area: '東京都',
      shipping_date: '20190819',
      user_id: '3',
      brand_id: '19',
      category_id: '183',
      payment_status: '未払い'

    },
    {
      name: 'ギフトにもGoodよだれかけ',
      price: '3000',
      usage_status: '新品',
      description: 'おしゃれなよだれかけ',
      selling_status: '取引中',
      delivery_fee: '10',
      delivery_way: '普通郵便',
      delivery_area: '東京都',
      shipping_date: '20190819',
      user_id: '3',
      brand_id: '5',
      category_id: '183',
      payment_status: '未払い'

    }

  ]
)

# インテリア・住まい・小物
Item.create!(
  [
    {
      name: '流れるアンモナイト型シンク',
      price: '12000',
      usage_status: '中古',
      description: '旧石器時代のアンモナイトの造形をモデルとしたデザインシンク',
      selling_status: '取引中',
      delivery_fee: '10',
      delivery_way: '普通郵便',
      delivery_area: '鹿児島県',
      shipping_date: '20190818',
      user_id: '1',
      brand_id: '20',
      category_id: '262',
      payment_status: '支払済'

    },
    {
      name: 'アップルメモパッド',
      price: '1200',
      usage_status: '新品',
      description: 'かのリンゴ型メモ',
      selling_status: '取引中',
      delivery_fee: '10',
      delivery_way: '普通郵便',
      delivery_area: '鹿児島県',
      shipping_date: '20190818',
      user_id: '1',
      brand_id: '13',
      category_id: '262',
      payment_status: '支払済'

    }

  ]
)

# 本・音楽・ゲーム
Item.create!(
  [
    {
      name: '安心引きこもりライフ',
      price: '800',
      usage_status: '中古',
      description: '現代人必読の一冊。家にこもってこそ見える人生もある',
      selling_status: '出品中',
      delivery_fee: '10',
      delivery_way: 'Fmarket便',
      delivery_area: '沖縄県',
      shipping_date: '20190818',
      user_id: '2',
      brand_id: '9',
      category_id: '279',
      payment_status: '支払済'
    },
    {
      name: 'マッチョでポン！',
      price: '1500',
      usage_status: '中古',
      description: '筋肉を育てよう！筋肉育成ゲーム',
      selling_status: '出品中',
      delivery_fee: '100',
      delivery_way: 'Fmarket便',
      delivery_area: '長崎県',
      shipping_date: '20190818',
      user_id: '2',
      brand_id: '10',
      category_id: '296',
      payment_status: '支払済'
    },
    {
      name: 'ゲームキューブカセットのみ',
      price: '500',
      usage_status: '中古',
      description: '懐かしのゲームキューブ',
      selling_status: '出品中',
      delivery_fee: '100',
      delivery_way: 'Fmarket便',
      delivery_area: '長崎県',
      shipping_date: '20190818',
      user_id: '2',
      brand_id: '15',
      category_id: '296',
      payment_status: '支払済'
    }

  ]
)

# おもちゃ・ホビー・グッズ
Item.create!(
  [
    {
      name: 'ゲロゲロな卵の黄身',
      price: '1300',
      usage_status: '新品',
      description: 'あなたのストレスも黄身と一緒に流しちゃいます',
      selling_status: '出品中',
      delivery_fee: '300',
      delivery_way: 'Fmarket便',
      delivery_area: '北海道',
      shipping_date: '20191010',
      user_id: '3',
      brand_id: '10',
      category_id: '308',
      payment_status: '支払済'
    }
  ]
)

# コスメ・香水・美容
Item.create!(
  [
    {
      name: 'フリーザのような美肌に！ドラゴンボールフェイスパック',
      price: '300',
      usage_status: '中古',
      description: 'これであなたもフリーザのような美肌になれる',
      selling_status: '出品中',
      delivery_fee: '50',
      delivery_way: 'Fmarket便',
      delivery_area: '北海道',
      shipping_date: '20191105',
      user_id: '2',
      brand_id: '15',
      category_id: '403',
      payment_status: '支払済'
    },
    {
      name: 'クロエ香水',
      price: '5000',
      usage_status: '新規',
      description: 'フレンチで大人な香りを',
      selling_status: '出品中',
      delivery_fee: '50',
      delivery_way: 'Fmarket便',
      delivery_area: '北海道',
      shipping_date: '20191105',
      user_id: '2',
      brand_id: '11',
      category_id: '403',
      payment_status: '支払済'
    }

  ]
)

# 家電・スマホ・カメラ
Item.create!(
  [
    {
      name: 'ピザ生成機',
      price: '5000',
      usage_status: '新品',
      description: '窯焼きピザ顔負けのふっくらピザが焼けます',
      selling_status: '売却済み',
      delivery_fee: '300',
      delivery_way: 'Fmarket便',
      delivery_area: '大阪府',
      shipping_date: '20191009',
      user_id: '2',
      brand_id: '14',
      category_id: '435',
      payment_status: '支払済'
    }
  ]
)

# スポーツ・レジャー
Item.create!(
  [
    {
      name: 'おしるこプロテイン',
      price: '1050',
      usage_status: '新品',
      description: 'お餅は炭水化物なので摂取NG。甘いおしるこ風味のプロテインで筋肉ムキムキになろう',
      selling_status: '出品停止',
      delivery_fee: '300',
      delivery_way: 'Fmarket便',
      delivery_area: '大阪府',
      shipping_date: '20191009',
      user_id: '3',
      brand_id: '23',
      category_id: '469',
      payment_status: '支払済'
    },
    {
      name: 'バタフライ卓球ラケット',
      price: '2050',
      usage_status: '新品',
      description: '老舗卓球メーカーのラケット',
      selling_status: '出品停止',
      delivery_fee: '300',
      delivery_way: 'Fmarket便',
      delivery_area: '大阪府',
      shipping_date: '20191009',
      user_id: '3',
      brand_id: '15',
      category_id: '469',
      payment_status: '支払済'
    },
    {
      name: 'AJIDESUTシャツ',
      price: '1500',
      usage_status: '新品',
      description: 'アジなTシャツ',
      selling_status: '出品中',
      delivery_fee: '300',
      delivery_way: 'Fmarket便',
      delivery_area: '大阪府',
      shipping_date: '20191009',
      user_id: '3',
      brand_id: '15',
      category_id: '451',
      payment_status: '支払済'
    }

  ]
)

# ハンドメイド
Item.create!(
  [
    {
      name: 'ハンドメイドキーホルダーおじさん',
      price: '550',
      usage_status: '中古',
      description: '手作りのおじさん',
      selling_status: '出品停止',
      delivery_fee: '300',
      delivery_way: 'Fmarket便',
      delivery_area: '奈良県',
      shipping_date: '20191001',
      user_id: '1',
      brand_id: '17',
      category_id: '495',
      payment_status: '支払済'
    },
    {
      name: 'ハンドメイドJAPANグッズ',
      price: '15000',
      usage_status: '新品',
      description: 'これぞニッポン。メイドインジャパン',
      selling_status: '売却済み',
      delivery_fee: '2000',
      delivery_way: 'Fmarket便',
      delivery_area: '京都府',
      shipping_date: '20190810',
      user_id: '2',
      brand_id: '17',
      category_id: '495',
      payment_status: '未払い'
    }
  ]
)

# チケット
Item.create!(
  [
    {
      name: '関取トークショーチケット',
      price: '1800',
      usage_status: '新品',
      description: '相撲をみに行こう',
      selling_status: '売却済み',
      delivery_fee: '100',
      delivery_way: '普通郵便',
      delivery_area: '京都府',
      shipping_date: '20190815',
      user_id: '2',
      brand_id: '18',
      category_id: '532',
      payment_status: '支払済'
    },
    {
      name: 'ディズニーランドチケット',
      price: '5000',
      usage_status: '新品',
      description: '夢の国に行こう！',
      selling_status: '売却済み',
      delivery_fee: '100',
      delivery_way: '普通郵便',
      delivery_area: '京都府',
      shipping_date: '20190815',
      user_id: '2',
      brand_id: '22',
      category_id: '532',
      payment_status: '支払済'
    }

  ]
)

# 自動車・オートバイ
Item.create!(
  [
    {
      name: '走行速度300km デススター',
      price: '3000000',
      usage_status: '中古',
      description: '惑星を一撃で吹き飛ばすほどの強い威力に要注意',
      selling_status: '売却済み',
      delivery_fee: '100',
      delivery_way: '普通郵便',
      delivery_area: '広島県',
      shipping_date: '20190710',
      user_id: '1',
      brand_id: '15',
      category_id: '555',
      payment_status: '支払済'
    },
    {
      name: 'ミレニアムファルコン',
      price: '5000000',
      usage_status: '中古',
      description: '初期シリーズ',
      selling_status: '売却済み',
      delivery_fee: '100',
      delivery_way: '普通郵便',
      delivery_area: '広島県',
      shipping_date: '20190710',
      user_id: '1',
      brand_id: '21',
      category_id: '537',
      payment_status: '支払済'
    },
    {
      name: 'セール中！宇宙の仲間たち',
      price: '5000',
      usage_status: '中古',
      description: 'あの仲間たちが登場！',
      selling_status: '売却済み',
      delivery_fee: '100',
      delivery_way: '普通郵便',
      delivery_area: '広島県',
      shipping_date: '20190710',
      user_id: '1',
      brand_id: '21',
      category_id: '567',
      payment_status: '支払済'
    },
    {
      name: '惑星間をひとっ飛び！未確認生命体',
      price: '200000',
      usage_status: '中古',
      description: '惑星間ドライブはいかが',
      selling_status: '売却済み',
      delivery_fee: '100',
      delivery_way: '普通郵便',
      delivery_area: '広島県',
      shipping_date: '20190710',
      user_id: '1',
      brand_id: '15',
      category_id: '567',
      payment_status: '支払済'
    }

  ]
)

# その他
Item.create!(
  [
    {
      name: 'スペイン産オレンジハニー',
      price: '450',
      usage_status: '新品',
      description: '地中海のあまみ。',
      selling_status: '売却済み',
      delivery_fee: '100',
      delivery_way: '普通郵便',
      delivery_area: '広島県',
      shipping_date: '20190710',
      user_id: '1',
      brand_id: '23',
      category_id: '607',
      payment_status: '支払済'
    }
  ]
)

Image.create!(
  [
    {
      # シャネルセール品３点
      image: 'https://image.interior-book.jp/article/original/56619.jpg',
      item_id: '1'
    },
    {
      # カビゴン着ぐるみ
      image: 'https://shop.r10s.jp/wigland/cabinet/110717/szj18-tmy-061.jpg',
      item_id: '2'
    },
    {
      # グッチTシャツ
      image: 'https://i.pinimg.com/736x/06/58/e4/0658e4e5b54e2f5768c9dc2e9ca08487.jpg',
      item_id: '3'
    },

    {
      # 黄金に輝く胸筋
      image: 'https://monde.jp/blog/wp-content/uploads/2018/09/toop-5.jpg',
      item_id: '4'
    },
    {
      # ブラウンニット
      image: 'https://www.wearstand.com/upload/save_image/ps_5166405_505_m.jpg',
      item_id: '5'
    },
    {
      #イケてるトレンチコート
      image: 'https://im.uniqlo.com/images/jp/pc/goods/419981/item/32_419981.jpg',
      item_id: '6'
    },

    {
      # ボスベイビー
      image: 'https://bossbaby.jp/news/wp-content/uploads/sites/42/2018/04/bb_cg_Boss_Baby_05_RGB-%E3%82%B3%E3%83%94%E3%83%BC.jpg',
      item_id: '7'
    },

    {
      # ギフトにもGoodよだれかけ
      image: 'https://marlmarl-cdn.azureedge.net/pub/assets/img/model/macaron/macaron-3_mauve/macaron-3_mauve-m1.jpg',
      item_id: '8'
    },

    {
      # 流れるアンモナイト型シンク
      image: 'http://livedoor.blogimg.jp/hamusoku/imgs/f/0/f014ad2e.jpg',
      item_id: '9'
    },
    {
      # アップルメモパッド
      image: 'http://www.neverlandclub.jp/images/e2/e2688/image.jpg',
      item_id: '10'
    },

    {
      # 安心引きこもりライフ
      image: 'https://up.gc-img.net/post_img_web/2014/05/InEKjVpSmGvrmFE',
      item_id: '11'
    },
    {
      # マッチョでぽん
      image: 'http://blog-imgs-95.fc2.com/h/i/t/hitoikigame/macho_main.jpg',
      item_id: '12'
    },
    {
      # ゲームキューブカセット
      image: 'https://image.biccamera.com/img/00000001994940_A01.jpg?sr.dw=320&sr.dh=320&sr.jqh=60&sr.mat=1',
      item_id: '13'
    },

    {
      # ゲロゲロ卵の黄身
      image: 'https://img2.bgxcdn.com/thumb/view/oaupload/banggood/images/73/4A/53a93389-1091-2feb-c03b-d3909ecc7ca6.jpg',
      item_id: '14'
    },
    {
      # フリーザのような美肌に！ドラゴンボールフェイスパック
      image: 'https://shop35-makeshop.akamaized.net/shopimages/isshindo/000000000051.jpg',
      item_id: '15'
    },

    {
      # クロエ香水
      image: 'http://www.happiness-d.com/img/goods/L/kuroeo-doparufamu%20EPS75ml_l.jpg',
      item_id: '16'
    },

    {
      # ピザ機
      image: 'http://ure.pia.co.jp/mwimgs/9/3/-/img_93cf494da83a05a87813ebc9bbf2100157735.jpg',
      item_id: '17'
    },
    {
      # おしるこプロテイン
      image: 'https://cdn-ak.f.st-hatena.com/images/fotolife/s/ssachiko/20180120/20180120185647.jpg',
      item_id: '18'
    },
    {
      # バタフライラケット
      image: 'https://tshop.r10s.jp/arhua/cabinet/2016/04c/16720_1.jpg?fitin=300:300',
      item_id: '19'
    },
    {
      # ajidesuシャツ
      image: ' https://auctions.afimg.jp/item_data/image/20110324/yahoo/b/b119144780.1.jpg',
      item_id: '20'
    },

    {
      # おじさんキーホルダー
      image: 'https://media-01.creema.net/user/1543965/exhibits/3315665/0_18ef12f2ff05ba2cb05eac25c91d52a7_583x585.jpg',
      item_id: '21'
    },
    {
      # ジャパングッズ
      image: 'https://s3-ap-northeast-1.amazonaws.com/hmj-fes-production/users/creation_1s/000/012/671/original/d00042d2-1784-44c3-a7c2-63cbe81527c120181213-4-4nvbdn.jpg?1544686864',
      item_id: '22'
    },
    {
      # 関取トークショー
      image: 'https://s3-ap-northeast-1.amazonaws.com/welltool/officials/offi290/spaces/spce288/arti3944_1_1570123069.jpg',
      item_id: '23'
    },
    {
      # ディズニーチケット
      image: 'https://c05.castel.jp/picture?url=https%3A%2F%2Fcastel.jp%2Fimg%2Fup%2Fpicture_39386.jpg',
      item_id: '24'
    },

    {
      # 走行速度300km デススター
      image: 'https://wired.jp/wp-content/uploads/2012/12/death-star-660x448.jpg',
      item_id: '25'
    },
    {
      # ミレニアムファルコン
      image: 'https://cache.ymall.jp/webcom/item/multiimage/300/7657888012_001.jpg',
      item_id: '26'
    },
    {
      # セール中！宇宙の仲間たち
      image: 'https://shop.daigo.co.jp/wp-content/uploads/post/26858/S3709.jpg',
      item_id: '27'
    },
    {
      # 惑星間をひとっ飛び未確認生命体
      image: 'https://img.sirabee.com/wp-content/uploads/2019/09/GettyImages-1054137738.jpg',
      item_id: '28'
    },

    {
      # スパイン産オレンジハニー
      image: 'http://www.tullys.co.jp/menu/uploads/orangehoney_191015.jpg',
      item_id: '29'
    }

  ]
)

# Likeテーブル

Like.create!(
  [
    {
      user_id: '1',
      item_id: '4'
    },
    {
      user_id: '1',
      item_id: '11'
    },
    {
      user_id: '1',
      item_id: '12'
    },
    {
      user_id: '1',
      item_id: '23'
    }

  ]
)
