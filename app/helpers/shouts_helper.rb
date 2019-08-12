module ShoutsHelper
  def active_shout_expires_in
    distance_of_time_in_words(Time.current, Shout.active.shouted_at + Shout::MIN_TIME_ACTIVE)
  end
end