# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lady = Category.create(:name=>"レディース")

lady_tops = lady.children.create(:name=>"トップス")
lady_knit = lady.children.create(:name=>"ニット")
lady_jacket = lady.children.create(:name=>"コート/ジャケット")
lady_bottom = lady.children.create(:name=>"パンツ/ジーンズ")
lady_onepiece = lady.children.create(:name=>"ワンピース")
lady_skirt = lady.children.create(:name=>"スカート")
lady_shoes = lady.children.create(:name=>"シューズ")
lady_bag = lady.children.create(:name=>"バッグ")
lady_shirt = lady.children.create(:name=>"シャツ（ブラウス）")
lady_goods = lady.children.create(:name=>"ファッショングッズ")
lady_inner = lady.children.create(:name=>"インナー")
lady_accessory = lady.children.create(:name=>"アクセサリー")
lady_wallet = lady.children.create(:name=>"財布/小物")

lady_tops.children.create([{:name=>"スウェット"}, {:name=>"パーカー"}, {:name=>"ベアトップ"}, {:name=>"タートルネック"}, {:name=>"カットソー"}, {:name=>"ノースリーブ"}, {:name=>"タンクトップ"}, {:name=>"ポロシャツ"}, {:name=>"Tシャツ"}, {:name=>"アンサンブル/ツインセット"}, {:name=>"Uネックカットソー"}, {:name=>"Vネックカットソー"},{:name=>"その他"}])
lady_knit.children.create([{:name=>"カーディガン"}, {:name=>"ノースリーブニット/ベスト"}, {:name=>"ニットパーカー"},{:name=>"ニットタートル"}, {:name=>"ニットポンチョ"}, {:name=>"アンサンブル"}, {:name=>"長袖ニット"}, {:name=>"半袖ニット"}, {:name=>"5~9分袖ニット"}, {:name=>"ニットその他"}])
lady_jacket.children.create([{:name=>"ロングコート"}, {:name=>"ハーフコート"}, {:name=>"ショートコート"},{:name=>"ダッフルコート"}, {:name=>"ステンカラーコート"}, {:name=>"トレンチコート"}, {:name=>"ノーカラーコート"}, {:name=>"ライダース/レザージャケット"}, {:name=>"ダウンジャケット"}, {:name=>"デニムジャケット"}, {:name=>"ブルゾン"}, {:name=>"ナイロンジャケット"}, {:name=>"マウンテンパーカー"}, {:name=>"レインコート"}, {:name=>"チェスターコート"}, {:name=>"ミリタリージャケット"}, {:name=>"モッズコート"}, {:name=>"コートその他"}])
lady_bottom.children.create([{:name=>"フルレングス"}, {:name=>"ショートパンツ"}, {:name=>"クロップド/半端丈"},{:name=>"カーゴパンツ"}, {:name=>"サロペット/オールインワン"}, {:name=>"スキニーパンツ"}, {:name=>"ストレートデニム"}, {:name=>"ジーンズその他"}, {:name=>"チノパンツ"}, {:name=>"スラックス/ドレスパンツ"}, {:name=>"ハーフパンツ"}, {:name=>"スウェットパンツ"}, {:name=>"キュロット"}, {:name=>"ワイド/バギーパンツ"}, {:name=>"パンツその他"}])
lady_onepiece.children.create([{:name=>"シャツワンピース"}, {:name=>"ニットワンピース"}, {:name=>"チュニック"},{:name=>"キャミソールワンピース"}, {:name=>"ノースリーブワンピース"}, {:name=>"半袖ワンピース"}, {:name=>"ベアワンピース"}, {:name=>"オールインワン"}, {:name=>"ロングワンピース"}, {:name=>"ワンピースその他"}])
lady_skirt.children.create([{:name=>"フレアスカート"}, {:name=>"タイトスカート"}, {:name=>"プリーツスカート"},{:name=>"コクーンスカート"}, {:name=>"ロングスカート"}, {:name=>"ミニスカート"}, {:name=>"ジャンパースカート"}, {:name=>"デニムスカート"}, {:name=>"スカートその他"}])
lady_shoes.children.create([{:name=>"サンダル/ミュール"}, {:name=>"パンプス"}, {:name=>"スニーカー/スリッポン"},{:name=>"ドレスシューズ"}, {:name=>"フラット"}, {:name=>"ショートブーツ"}, {:name=>"ミドルブーツ"}, {:name=>"ロングブーツ"}, {:name=>"レインブーツ"}, {:name=>"バレイシューズ"}, {:name=>"シューケア/小物"}, {:name=>"ビーチサンダル"}, {:name=>"ムートンブーツ"}, {:name=>"モカシン"}, {:name=>"シューズその他"}])
lady_bag.children.create([{:name=>"トートバッグ"}, {:name=>"ショルダーバッグ"}, {:name=>"リュック/バックパック"},{:name=>"ボストンバッグ"}, {:name=>"ポーチ"}, {:name=>"クラッチバッグ"}, {:name=>"かごバッグ"}, {:name=>"パーティバッグ"}, {:name=>"キャリーバッグ"}, {:name=>"ハンドバッグ"}, {:name=>"ビジネスバッグ"}, {:name=>"ウエストポーチ"}, {:name=>"エコバッグ/サブバッグ"}, {:name=>"バッグその他"}])
lady_shirt.children.create([{:name=>"半袖シャツ"}, {:name=>"長袖シャツ"}, {:name=>"7分袖シャツ"},{:name=>"ノースリーブ/キャミソールシャツ"}, {:name=>"ワイシャツ"}, {:name=>"シャツ/ブラウスその他"}])
lady_goods.children.create([{:name=>"スカーフ/バンダナ"}, {:name=>"ストール"}, {:name=>"マフラー/スヌード"},{:name=>"手袋"}, {:name=>"ベルト"}, {:name=>"チャーム/キーチェーン"}, {:name=>"ソックス/靴下"}, {:name=>"ストラップ"}, {:name=>"腕時計"}, {:name=>"携帯ケース/アクセサリー"}, {:name=>"ハンカチ/タオル"}, {:name=>"ネクタイ/蝶ネクタイ"}, {:name=>"メガネ"}, {:name=>"サングラス"}, {:name=>"つけえり"}, {:name=>"サスペンダー"}, {:name=>"長傘"}, {:name=>"日傘/折りたたみ傘"}, {:name=>"イヤーマフ"}, {:name=>"ファッショングッズその他"}])
lady_inner.children.create([{:name=>"キャミソール"}, {:name=>"ガードル"}, {:name=>"スリップ"},{:name=>"ルームウェア/トップス"}, {:name=>"ルームウェア/ボトムス"}, {:name=>"インナーその他"}])
lady_accessory.children.create([{:name=>"リング"}, {:name=>"ブレスレット"}, {:name=>"アンクレット"},{:name=>"ネックレス"}, {:name=>"イヤリング"}, {:name=>"ピアス"}, {:name=>"ブローチ/コサージュ"}, {:name=>"アクセサリーその他"}])
lady_wallet.children.create([{:name=>"財布"}, {:name=>"革小物"}, {:name=>"パスケース/カードケース"},{:name=>"キーケース"}, {:name=>"財布/小物その他"}])

mens = Category.create(:name=>"メンズ")

mens_tops = mens.children.create(:name=>"トップス")
mens_knit = mens.children.create(:name=>"ニット")
mens_jacket = mens.children.create(:name=>"コート/ジャケット")
mens_bottom = mens.children.create(:name=>"パンツ/ジーンズ")
mens_onepiece = mens.children.create(:name=>"ワンピース")
mens_shoes = mens.children.create(:name=>"シューズ")
mens_bag = mens.children.create(:name=>"バッグ")
mens_shirt = mens.children.create(:name=>"シャツ（ブラウス）")
mens_goods = mens.children.create(:name=>"ファッショングッズ")
mens_inner = mens.children.create(:name=>"インナー")
mens_accessory = mens.children.create(:name=>"アクセサリー")
mens_wallet = mens.children.create(:name=>"財布/小物")

mens_tops.children.create([{:name=>"スウェット"}, {:name=>"パーカー"}, {:name=>"ベアトップ"}, {:name=>"タートルネック"}, {:name=>"カットソー"}, {:name=>"ノースリーブ"}, {:name=>"タンクトップ"}, {:name=>"ポロシャツ"}, {:name=>"Tシャツ"}, {:name=>"アンサンブル/ツインセット"}, {:name=>"Uネックカットソー"}, {:name=>"Vネックカットソー"},{:name=>"その他"}])
mens_knit.children.create([{:name=>"カーディガン"}, {:name=>"ノースリーブニット/ベスト"}, {:name=>"ニットパーカー"},{:name=>"ニットタートル"}, {:name=>"ニットポンチョ"}, {:name=>"アンサンブル"}, {:name=>"長袖ニット"}, {:name=>"半袖ニット"}, {:name=>"5~9分袖ニット"}, {:name=>"ニットその他"}])
mens_jacket.children.create([{:name=>"ロングコート"}, {:name=>"ハーフコート"}, {:name=>"ショートコート"},{:name=>"ダッフルコート"}, {:name=>"ステンカラーコート"}, {:name=>"トレンチコート"}, {:name=>"ノーカラーコート"}, {:name=>"ライダース/レザージャケット"}, {:name=>"ダウンジャケット"}, {:name=>"デニムジャケット"}, {:name=>"ブルゾン"}, {:name=>"ナイロンジャケット"}, {:name=>"マウンテンパーカー"}, {:name=>"レインコート"}, {:name=>"チェスターコート"}, {:name=>"ミリタリージャケット"}, {:name=>"モッズコート"}, {:name=>"コートその他"}])
mens_bottom.children.create([{:name=>"フルレングス"}, {:name=>"ショートパンツ"}, {:name=>"クロップド/半端丈"},{:name=>"カーゴパンツ"}, {:name=>"サロペット/オールインワン"}, {:name=>"スキニーパンツ"}, {:name=>"ストレートデニム"}, {:name=>"ジーンズその他"}, {:name=>"チノパンツ"}, {:name=>"スラックス/ドレスパンツ"}, {:name=>"ハーフパンツ"}, {:name=>"スウェットパンツ"}, {:name=>"ワイド/バギーパンツ"}, {:name=>"パンツその他"}])
mens_onepiece.children.create([{:name=>"シャツワンピース"}, {:name=>"ニットワンピース"}, {:name=>"チュニック"},{:name=>"キャミソールワンピース"}, {:name=>"ノースリーブワンピース"}, {:name=>"半袖ワンピース"}, {:name=>"ベアワンピース"}, {:name=>"オールインワン"}, {:name=>"ロングワンピース"}, {:name=>"ワンピースその他"}])
mens_shoes.children.create([{:name=>"スニーカー/スリッポン"},{:name=>"フラット"}, {:name=>"ショートブーツ"}, {:name=>"ミドルブーツ"}, {:name=>"ロングブーツ"}, {:name=>"レインブーツ"},{:name=>"シューケア/小物"}, {:name=>"ビーチサンダル"}, {:name=>"モカシン"}, {:name=>"シューズその他"}])
mens_bag.children.create([{:name=>"トートバッグ"}, {:name=>"ショルダーバッグ"}, {:name=>"リュック/バックパック"},{:name=>"ボストンバッグ"}, {:name=>"ポーチ"}, {:name=>"クラッチバッグ"}, {:name=>"かごバッグ"}, {:name=>"パーティバッグ"}, {:name=>"キャリーバッグ"}, {:name=>"ハンドバッグ"}, {:name=>"ビジネスバッグ"}, {:name=>"ウエストポーチ"}, {:name=>"エコバッグ/サブバッグ"}, {:name=>"バッグその他"}])
mens_shirt.children.create([{:name=>"半袖シャツ"}, {:name=>"長袖シャツ"}, {:name=>"7分袖シャツ"},{:name=>"ノースリーブ/キャミソールシャツ"}, {:name=>"ワイシャツ"}, {:name=>"シャツ/ブラウスその他"}])
mens_goods.children.create([{:name=>"スカーフ/バンダナ"}, {:name=>"ストール"}, {:name=>"マフラー/スヌード"},{:name=>"手袋"}, {:name=>"ベルト"}, {:name=>"チャーム/キーチェーン"}, {:name=>"ソックス/靴下"}, {:name=>"ストラップ"}, {:name=>"腕時計"}, {:name=>"携帯ケース/アクセサリー"}, {:name=>"ハンカチ/タオル"}, {:name=>"ネクタイ/蝶ネクタイ"}, {:name=>"メガネ"}, {:name=>"サングラス"}, {:name=>"サスペンダー"}, {:name=>"長傘"}, {:name=>"日傘/折りたたみ傘"}, {:name=>"イヤーマフ"}, {:name=>"ファッショングッズその他"}])
mens_inner.children.create([{:name=>"キャミソール"}, {:name=>"ガードル"}, {:name=>"スリップ"},{:name=>"ルームウェア/トップス"}, {:name=>"ルームウェア/ボトムス"}, {:name=>"インナーその他"}])
mens_accessory.children.create([{:name=>"リング"}, {:name=>"ブレスレット"}, {:name=>"アンクレット"},{:name=>"ネックレス"}, {:name=>"イヤリング"}, {:name=>"ピアス"}, {:name=>"ブローチ/コサージュ"}, {:name=>"アクセサリーその他"}])
mens_wallet.children.create([{:name=>"財布"}, {:name=>"革小物"}, {:name=>"パスケース/カードケース"},{:name=>"キーケース"}, {:name=>"財布/小物その他"}])
