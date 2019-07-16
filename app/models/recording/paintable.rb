module Recording::Paintable
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  included do
    has_one_attached :avatar
    has_one_attached :banner
  end

  def avatar_path
    if avatar.attached?
      rails_blob_path(avatar, disposition: 'attachment', only_path: true) 
    end
  end

  def banner_path
    if banner.attached?
      rails_blob_path(banner, disposition: 'attachment', only_path: true) 
    end
  end
end