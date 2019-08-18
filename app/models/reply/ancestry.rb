module Reply::Ancestry
  extend ActiveSupport::Concern

  included do
    has_ancestry
  end
end