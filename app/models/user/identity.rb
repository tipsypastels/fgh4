module User::Identity
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :username

    validates :username, 
      presence: true, 
      format: { with: /\A[^\s!#$%^&*()（）=+;:'"\[\]\{\}|\\\/<>?,]+\z/ },
      length: { maximum: 50 },
      uniqueness: { case_sensitive: false }
  end
end