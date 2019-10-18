module Recording::Featurable
  def featured=(bool)
    if bool
      self.featured_at = DateTime.now
    else
      self.featured_at = nil
    end
  end
end