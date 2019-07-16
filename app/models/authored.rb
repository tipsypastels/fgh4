module Authored
  extend ActiveSupport::Concern

  included do
    belongs_to :author,
      class_name: 'User',
      foreign_key: :user_id, 
      default: -> { Current.user }
  end

  def editable?
    # TODO contributors
    author == Current.user
  end
end