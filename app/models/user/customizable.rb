module User::Customizable
  extend ActiveSupport::Concern

  included do
    has_rich_text :biography

    enum gender: {
      female:      0,
      male:        1,
      non_binary:  2,
      genderfluid: 3,
      other:       4,
    }
  end
end