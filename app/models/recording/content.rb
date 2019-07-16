module Recording::Content
  extend ActiveSupport::Concern

  included do
    has_rich_text :content
    before_validation :create_default_content, on: :create

    validates :content,
      presence: true,
      allow_blank: false
  end

  private

  DEFAULT_MESSAGES = {
    text: "You can replace this with your TERM's FIELD!",
    gallery: "You can replace this text with images for your TERM's FIELD! Try dragging and dropping images into the editor.",
  }

  FIELD_SEPARATOR = '<br>'

  def create_default_content(force: false)
    return if content.present? && !force

    self.content = default_content_items.map do |title, type|
      title = title.to_s
      message = DEFAULT_MESSAGES[type]
        .gsub('FIELD', title)
        .gsub('TERM', term)

      <<~HTML
        <h1>#{title.titlecase}</h1>
        <div>#{message}</div>
      HTML
    end.join(FIELD_SEPARATOR)
  end
end