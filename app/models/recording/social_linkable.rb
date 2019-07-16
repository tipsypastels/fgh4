module Recording::SocialLinkable
  LINK_FIELDS = %i|github discord pokecomm|

  def any_links?
    LINK_FIELDS.any? { |f| self[f].present? }
  end
end