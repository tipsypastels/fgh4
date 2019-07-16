module LayoutHelper
  def outside_of_container
   # TODO 
  end
  
  def dropdown_link_to(name, path)
    tag.li link_to(name, path, class: 'block py-2 px-4 hover:bg-gray-100')
  end
end