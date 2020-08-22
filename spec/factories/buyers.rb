FactoryBot.define do
  factory :buyer do
    company_name {"株式会社ファーム"}
    kana_company_name {"カブシキガイシャファーム"}
    sequence(:email) { |n| "testfarm#{n}@example.com"}
    password {"password"}
  end
end
