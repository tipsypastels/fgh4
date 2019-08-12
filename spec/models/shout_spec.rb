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

require 'rails_helper'

RSpec.describe Shout, type: :model do
  fixtures :user

  before do
    Current.user = user(:dakota)
  end

  context "the active shout" do
    it "is nil if no shouts exist" do
      Shout.destroy_all
      expect(Shout.active).to eq(nil)
    end

    it "is the latest shout created otherwise" do
      shout = Shout.create!(content: 'hello world')      
      expect(Shout.active).to eq(shout)
    end

    it "becomes possible to make a new shout after #{Shout::MIN_TIME_ACTIVE}" do
      shout = Shout.create!(content: 'hello world')
      expect(Shout.available?).to eq(false)

      travel Shout::MIN_TIME_ACTIVE

      expect(Shout.available?).to eq(true)
    end

    it "raises an error if creating a shout when not available" do
      shout = Shout.create!(content: 'hello world')
      expect { Shout.create!(content: 'goodbye world') }.to raise_error(Shout::NotAvailableError)
    end

    it "does not raise an error if you wait #{Shout::MIN_TIME_ACTIVE}" do
      shout = Shout.create!(content: 'hello world')

      travel Shout::MIN_TIME_ACTIVE

      expect { Shout.create!(content: 'goodbye world') }.to_not raise_error
    end

    it "can be bumped after #{Shout::MIN_TIME_ACTIVE} if there is no active shout" do
      shout = Shout.create!(content: 'hello world')

      travel Shout::MIN_TIME_ACTIVE

      expect(Shout.available?).to eq(true)
      expect { shout.bump! }.to_not raise_error
      expect(Shout.available?).to eq(false)
    end

    it "cannot be bumped if there is an ongoing shout" do
      shout = Shout.create!(content: 'hello world')

      travel Shout::MIN_TIME_ACTIVE

      new_shout = Shout.create!(content: 'goodbye world')
      
      expect(Shout.available?).to eq(false)
      expect { shout.bump! }.to raise_error(Shout::NotAvailableError)
    end

    it "can be dismissed" do
      shout = Shout.create!(content: 'hello world')
      expect(Shout.show?).to eq(true)

      Current.user.update(shout_dismissed_at: Time.current)
      expect(Shout.show?).to eq(false)
    end

    it "will un-dismiss if a new shout is created after the dismissal" do
      shout = Shout.create!(content: 'hello world')
      Current.user.update(shout_dismissed_at: Time.current)
      expect(Shout.show?).to eq(false)

      travel Shout::MIN_TIME_ACTIVE

      new_shout = Shout.create!(content: 'goodbye world')
      expect(Shout.show?).to eq(true)
    end

    it "will un-dismiss if an old shout is bumped" do
      shout = Shout.create!(content: 'hello world')
      Current.user.update(shout_dismissed_at: Time.current)

      travel Shout::MIN_TIME_ACTIVE

      shout.bump!
      expect(Shout.show?).to eq(true)
    end
  end
end
