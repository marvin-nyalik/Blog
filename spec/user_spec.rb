require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Michael Owen', bio: 'Mike bio', photo: 'some link', postsCounter: 12) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postsCounter should allow valid values' do
    subject.postsCounter = -2
    expect(subject).to_not be_valid
  end
end
