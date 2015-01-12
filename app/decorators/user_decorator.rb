class UserDecorator < Draper::Decorator
  delegate_all
  # decorates :user
  def avatar
   site_link h.image_tag("avatars/#{avatar_name}", class: "avatar") 
  end

  def website
     if model.url.present? 
       h.link_to model.url, model.url 
     else 
      h.content_tag :span, "None given", class: "none"
     end 
  end

  def linked_name
   site_link(model.full_name.present? ? model.full_name : model.username) 
  end

  private

  def avatar_name
    if model.avatar_image_name.present?
      model.avatar_image_name
    else
      "default.png"
    end
  end

  def site_link(content)
   h.link_to_if model.url.present?, content, model.url 
    
  end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
