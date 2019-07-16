module Recording::Named
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :name, use: :slugged

    validates :name, presence: true
  end

  def slug=(slug)
    super(no_pokemon_prefix(slug))
  end

  private

  def no_pokemon_prefix(slug)
    slug.sub(/^pokemon[-_ ]/, '') if slug
  end
end