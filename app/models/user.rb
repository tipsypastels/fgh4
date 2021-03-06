# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  age                    :decimal(, )
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  gender                 :decimal(, )
#  location               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  shout_dismissed_at     :datetime
#  username               :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

class User < ApplicationRecord
  include Avatar, Customizable, Identity, Mentionable, Roles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recordings, dependent: :destroy
  has_many :featured_recordings, -> { where.not(featured_at: nil).order(featured_at: :desc) }, 
    class_name: 'Recording', 
    inverse_of: :author

  %w|Game Tutorial Resource|.each do |recording|
    has_many recording.downcase.pluralize.to_sym, -> { where type: recording },
      class_name: 'Recording',
      inverse_of: :author
  end

  has_many :replies, dependent: :destroy
  has_many :shouts, dependent: :destroy

  def mentionable_name
    username
  end
end
