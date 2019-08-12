module Recording::Types
  extend ActiveSupport::Concern

  LIST = %w|Game Tutorial Resource|

  def self.count
    LIST.count
  end

  included do
    scope :of_type, -> type {
      if Recording.type?(type)
        where(type: type.classify)
      else
        all
      end
    }

    Recording::Types::LIST.each do |type|
      scope type.downcase.pluralize, -> {
        of_type(type)
      }
    end

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