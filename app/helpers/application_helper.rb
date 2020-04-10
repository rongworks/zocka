module ApplicationHelper
  def icon_link(icon, link, options = {method: :get})
    content_tag :span do
    link_to link, options do
      "<i class='fas fa-#{icon}'></i>".html_safe
       end
     end
  end
end
