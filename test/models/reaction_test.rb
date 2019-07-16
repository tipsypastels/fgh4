# == Schema Information
#
# Table name: reactions
#
#  id             :integer          not null, primary key
#  reactable_type :string
#  reactable_id   :integer
#  emoji          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#

require 'test_helper'

class ReactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
