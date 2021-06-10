require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:user)
  end
end