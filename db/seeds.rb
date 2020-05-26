# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'test@test.com',
    password: 'testtest'
    )

Producer.create!(
    name: "山田花子",
    kana_name: "ヤマダハナコ",
    company_name: "山田オーガニック",
    kana_company_name: "ヤマダオーガニック",
    email: "producer@gmail.com",
    password: "aaaaaa",
    phone_number: "08012345678",
    postcode: "1234567",
    address: "長野県伊那市12-34",
    hp: "http://localhost:3000",
    description: "高級レストラン(フレンチ.イタリアン)系向けの専用野菜を販売しています。オーガニック野菜にも力を入れております"
)
Buyer.create!(
    name: "田中太朗",
    kana_name: "タナカタロウ",
    company_name: "株式会社グルメニア",
    kana_company_name: "カブシキガイシャグルメニア",
    email: "buyer@gmail.com",
    password: "bbbbbb",
    phone_number: "0312345678",
    postcode: "7654321",
    address: "東京都品川区23-456",
    hp: "http://localhost:3000",
    description: "主に銀座、赤坂で高級レストランを展開しております。オーガニック野菜を使った料理を提供しております。"
)


Category.create!(
    [
        {
            name: "野菜"
        },
        {
            name: "肉類"
        },
        {
            name: "魚介類"
        },
        {
            name: "卵・乳製品"
        },
        {
            name: "米・穀類"
        }
    ]
)
Product.create!(
    name: "人参",
    price: 350,
    timing: "12月〜2月",
    description: "人参です",
    producer_id: 1,
    category_id: 1
    )