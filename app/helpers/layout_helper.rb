module LayoutHelper
  def outside_of_container
   # TODO 
  end
  
  def dropdown_link_to(name, path)
    tag.li link_to(name, path, class: 'block py-2 px-4 hover:bg-gray-100')
  end

  def media(sm:, md:, display: :block)
    <<~HTML.html_safe
      <div class="#{display} md:hidden">
        #{sm}
      </div>

      <div class="hidden md:#{display}">
        #{md}
      </div>
    HTML
  end
end