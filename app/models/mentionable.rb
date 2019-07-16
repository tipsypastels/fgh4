module Mentionable
  extend ActiveSupport::Concern

  included do
    include ActionText::Attachable
    
    acts_as_api
  
    api_accessible :mention do |t|
      t.add :attachable_sgid, as: :sgid
      t.add :mentionable_name
      t.add :mentionable_content, as: :content
    end
  end

  def mentionable_name
    name
  end

  def mentionable_content
    locals = {}
    locals[mentionable_local_var] = self

    ApplicationController.renderer.render(
      partial: to_trix_content_attachment_partial_path,
      locals: locals,
    )
  end

  private

  def mentionable_local_var
    self.class.table_name
      .singularize
      .to_sym
  end
end