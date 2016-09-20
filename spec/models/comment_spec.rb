require "rails_helper"

RSpec.describe Comment, type: :model do

  describe "Associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :product}
  end

end
