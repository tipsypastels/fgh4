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

class News < Reply
  before_create :raise_error_unless_allowed_to_post_news

  private

  NotAllowedToPostNewsError = Class.new(NotImplementedError)

  def raise_error_unless_allowed_to_post_news
    raise NotAllowedToPostNewsError unless recording.editable?
  end
end
