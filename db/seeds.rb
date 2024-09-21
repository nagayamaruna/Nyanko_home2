# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test1 = User.find_or_initialize_by(email: "test@test")
if test1.new_record?
  test1.name = "testさん"
  test1.password = "imoimo"
  test1.save!
end

post1 = Nyankogram.find_or_initialize_by(post_body: "kawaii?")
if post1.new_record?
  #post1.post_images.attache
end


Tag.create([
    { name: '雑種' },
    { name: 'キジトラ' },
    { name: '茶トラ' },
    { name: 'キジ白' },
    { name: '白黒' },
    { name: '黒サビ' },
    { name: 'アメリカンショートヘア' },
    { name: 'エキゾチックショートヘア'},
    { name: 'サイベリアン'},
    { name: 'スコティッシュフォールド'},
    { name: 'シャム'},
    { name: 'ベンガル'},
    { name: 'マンチカン'},
    { name: 'ミヌエット'},
    { name: 'メインクーン'},
    { name: 'ラグドール'},
    { name: 'ロシアンブルー'},
    { name: 'ブリティッシュ'},
    { name: 'ペルシャ'},
    { name: 'その他'},
    ])