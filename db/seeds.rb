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
    address: "伊那市12-34",
    hp: "http://localhost:3000",
    description: "高級レストラン(フレンチ.イタリアン)系向けの専用野菜を販売しています。オーガニック野菜にも力を入れております",
    prefecture_id: 20
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
    address: "品川区23-456",
    hp: "http://localhost:3000",
    description: "主に銀座、赤坂で高級レストランを展開しております。オーガニック野菜を使った料理を提供しております。",
    industory_id: 1,
    prefecture_id: 13
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

industories = ["飲食店", "小売店", "総合商社", "食品メーカー", "卸売", "その他"]
industories.each do |industory|
    Industory.create!(name: industory)
end

prefectures = ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県","福島県", "茨城県", "栃木県",
                "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県", "富山県", "石川県",
                "福井県", "山梨県", "長野県", "岐阜都", "静岡県", "愛知県", "三重県", "滋賀県",
                "京都府", "大阪府", "兵庫県", "奈良都", "和歌山県", "鳥取県", "島根県", "岡山県",
                "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県",
                "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"]
prefectures.each do |prefecture|
    Prefecture.create!(name: prefecture)
end