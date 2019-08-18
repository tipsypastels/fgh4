module Recording::Replyable
  extend ActiveSupport::Concern

  included do
    has_many :replies
  end
end