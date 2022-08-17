require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user exits' do
    it "user name is not empty" do
      user = User.create({ name: "Tutorial" })
      expect(user.name).to eq "Tutorial"
    end
  end
end
