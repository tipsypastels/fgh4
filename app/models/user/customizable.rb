module User::Customizable
  extend ActiveSupport::Concern

  included do
    has_rich_text :biography
  end
end