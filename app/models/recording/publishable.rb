module Recording::Publishable
  extend ActiveSupport::Concern

  included do
    scope :published, -> {
      where.not(published_at: nil)
    }
  end

  def published?
    published_at.present?
  end

  def publish!
    update! published_at: Time.now
  end

  def published=(value)
    if value && value.to_i != 0
      self.published_at = Time.now
    else
      self.published_at = nil
    end
  end
end