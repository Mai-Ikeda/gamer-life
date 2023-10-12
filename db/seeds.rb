# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: 'admin@test', password: 'admintest')

user1 = Customer.find_or_create_by!(email: "user1@xxx") do |customer|
  customer.user_name = "User1"
  customer.password = "password"
  customer.like_game = "アクション、アドベンチャーゲームが好きです。"
end

user2 = Customer.find_or_create_by!(email: "user2@xxx") do |customer|
  customer.user_name = "User2"
  customer.password = "password"
  customer.like_game = "シミュレーションゲームにはまっています。"
end

Impression.create!(
  [
    {
      customer_id: 2,
      genre_id: 1,
      title: "ポケットモンスター緑",
      body: "私が初めてプレイしたゲームです。最初のジムリーダーに勝てなくて何度も挑戦したのはいい思い出です。",
      rate: 4,
      status: 0,
    }
  ]
)

Genre.create!(
  [
    {
      name: "アクション",
      is_active: true,
    },
    {
      name: "アドベンチャー",
      is_active: true,
    },
    {
      name: "シミュレーション",
      is_active: true,
    },
    {
      name: "RPG",
      is_active: true,
    },
    {
      name: "シューティング",
      is_active: true,
    },
    {
      name: "レーシング",
      is_active: true,
    },
    {
      name: "その他",
      is_active: true,
    }
  ]
)