FactoryBot.define do
  factory :comment do
    user
    post
    text { 'This is a comment' }
  end
end
