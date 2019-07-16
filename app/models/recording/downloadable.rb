module Recording::Downloadable
  extend ActiveSupport::Concern

  included do
    has_many :downloads
    accepts_nested_attributes_for :downloads, allow_destroy: true
  end
end