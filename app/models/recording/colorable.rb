module Recording::Colorable
  extend ActiveSupport::Concern

  included do
    serialize :color, Color

    validates :color,
      presence: true,
      format: { with: /#[0-9a-fA-F]{6}/ }

    before_validation :set_default_color, on: :create
  end
  
  def colorable_class_name
    lightness = color.light? ? 'light' : 'dark'
    "recording--colorized-#{lightness}"
  end

  private

  DEFAULT_COLORS = %w|
    #EC6363
    #ff912b
    #FFAD33
    #15aa70
    #009de6
    #156eC1
    #ff7cb3
    #bb50e5
  |

  def set_default_color(force: false)
    return if color && !force
    self.color = DEFAULT_COLORS.sample
  end
end