# == Schema Information
#
# Table name: shouts
#
#  id         :integer          not null, primary key
#  link       :string
#  shouted_at :datetime
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Shout < ApplicationRecord
  MIN_TIME_ACTIVE = 6.hours

  NotAvailableError = Class.new(ArgumentError)

  class << self
    def show?
      active && !dismissed?
    end

    def active
      order(shouted_at: :desc).limit(1).take
    end
  
    def available?
      !active || expired?
    end

    private

    def dismissed?
      return false unless Current.user&.shout_dismissed_at
      return true unless active
      Current.user.shout_dismissed_at >= active.shouted_at
    end

    def expired?
      ((Time.current - active.shouted_at) / 1.hour).round.hours >= MIN_TIME_ACTIVE
    end
  end

  before_create { raise NotAvailableError unless Shout.available? }
  after_create { update shouted_at: created_at }

  has_rich_text :content
  belongs_to :user, default: -> { Current.user }

  validates :content, presence: true

  def bump!
    raise NotAvailableError unless bumpable?
    update shouted_at: Time.current
  end

  def bump
    bump!
    true
  rescue NotAvailableError
    false
  end

  def active?
    Shout.active == self
  end

  def bumpable?
    Shout.available?
  end
end