class FghFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper
  include IconsHelper

  def rich_text_area(name, **opts)
    super(name, **opts.reverse_merge(
      data: { controller: 'mentions', target: 'mentions.field' }
    ))
  end

  def fancy_text_field(field, name = field, field_method: :text_field, **opts)
    icon = opts.delete(:icon)
    icon_html =
      if icon.is_a?(String) && icon.start_with?('http')
        # very pc specific but i doubt i'll use this for anything else. eh. maybe revisit in future
        <<~HTML
          <div style="width: 36px; height: 36px; background-image: url(#{icon}); background-position: -8px -9px; background-size: 145%;"></div>
        HTML
      elsif icon
        fa(*icon)
      end

    footnote = opts.delete(:footnote)
    footnote_html =
      if footnote
        <<~HTML
          <div class="text-xs font-semibold">#{footnote}</div>
        HTML
      end

    <<~HTML.html_safe
      <div class="flex border-4 rounded p-2 items-centered #{opts.delete(:class)}">
      <div class="text-4xl text-gray-700 mr-4 flex flex-col justify-center">
        #{icon_html}
      </div>

      <div class="flex-1">
        #{label(field, name, class: 'block font-semibold')}
        #{send(field_method, field, class: 'block w-full py-1 px-2 rounded', **opts)}

        #{footnote_html}
      </div>
    </div>
    HTML
  end

  def submit(*args, **opts)
    super(*args, **opts.reverse_merge(class: 'btn btn-primary'))
  end
end