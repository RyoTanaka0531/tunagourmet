FactoryBot.define do
  factory :producer do
    company_name {"farm"}
    kana_company_name {"ファーム"}
    sequence(:email) { |n| "testfarm#{n}@example.com"}
    password {"password"}
  end
end