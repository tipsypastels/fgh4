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

class Comment < Reply
end
