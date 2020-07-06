FactoryBot.define do
  factory :comment do
    body { 'this is an awesome comment' }
    association :user, factory: :user
    association :article, factory: :user
  end
end
