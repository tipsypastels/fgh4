module Recording::Types
  extend ActiveSupport::Concern

  LIST = %w|Game Tutorial Resource|

  included do
    scope :of_type, -> type {
      if Recording.type?(type)
        where(type: type.classify)
      else
        all
      end
    }

    validates :type,
      presence: true,
      inclusion: { in: Recording::Types::LIST }
  end

  class_methods do
    def type?(type)
      type&.classify.in?(LIST)
    end
  end
end