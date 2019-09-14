module User::Roles
  extend ActiveSupport::Concern

  included do
    has_many :roles do
      def primary
        sort.first unless empty?
      end
    end
  end

  def name_color
    roles.primary&.color
  end

  def role?(name)
    roles.find_by(name: name)
  end
end