FactoryBot.define do
  factory :user do
    name { 'John' }
    photo { 'Image' }
    bio { 'This is a sample bio.' }
    postsCounter { 0 }
  end
end
