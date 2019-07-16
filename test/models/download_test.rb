# == Schema Information
#
# Table name: downloads
#
#  id           :integer          not null, primary key
#  recording_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string
#  uses         :integer          default(0)
#  url          :string
#

require 'test_helper'

class DownloadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
