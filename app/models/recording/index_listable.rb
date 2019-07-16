module Recording::IndexListable
  extend ActiveSupport::Concern

  included do
    scope :on_index, -> params {
      published
        .of_type(params[:type])
        .order(updated_at: :desc)
        .includes(:author)
    }
  end
end