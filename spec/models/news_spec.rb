# == Schema Information
#
# Table name: replies
#
#  id           :integer          not null, primary key
#  ancestry     :string
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recording_id :integer
#  user_id      :integer
#
# Indexes
#
#  index_replies_on_ancestry  (ancestry)
#

# this is an STI of Reply so we don't need to redo tests for that
# just handle some of its unique behavior

require 'rails_helper'

RSpec.describe News, type: :model do
  fixtures :user, :recording

  context "who is allowed to post it" do
    it "raises an error when posted to a recording" do
      Current.user = user(:larry)
      recording = recording(:gnosis)

      expect { recording.replies.create!(type: 'News', content: 'fake and gay') }.to raise_error(News::NotAllowedToPostNewsError)
    end

    it "doesnt raise an error if you have access to modify the recording" do
      Current.user = user(:dakota)
      recording = recording(:gnosis)

      expect { recording.replies.create!(type: 'News', content: 'dragons talk now!') }.to_not raise_error
    end
  end
end
