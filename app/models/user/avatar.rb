module User::Avatar
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers
  
  included do
    has_one_attached :avatar
    after_create :set_default_avatar
  end
  
  def avatar_path
    if avatar.attached?
      rails_blob_path(avatar, disposition: 'attachment', only_path: true) 
    end
  end
  
  private
  
  DEFAULT_AVATAR_PATH = Rails.root.join('app/assets/images/default_avatar.jpg')

  def set_default_avatar(force: false)
    return if avatar.attached? && !force
    avatar.attach(io: File.open(DEFAULT_AVATAR_PATH), filename: 'avatar.jpg')
  end
end