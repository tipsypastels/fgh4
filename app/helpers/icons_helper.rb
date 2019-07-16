module IconsHelper
  def fa(icon, group = 'fas', **opts)
    opts[:class] = "#{group} fa-#{icon} #{opts[:class]}"
    tag.i(**opts)
  end
end