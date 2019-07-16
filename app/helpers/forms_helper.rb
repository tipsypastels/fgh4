module FormsHelper
  def fgh_form(**opts, &block)
    form_with(**opts.reverse_merge(builder: FghFormBuilder), &block)
  end
end
