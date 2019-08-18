module RepliesHelper
  def reply_tree_for(replies, recording)
    replies.includes(:author).map do |reply|
      rp('replies/reply', reply: reply, children: reply.children, recording: recording)
    end.join.html_safe
  end
end