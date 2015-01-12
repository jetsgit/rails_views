class UserDecorator < Draper::Decorator
  delegate_all

  def member_since
    model.created_at.strftime("%B %e, %Y")
  end

  def avatar
   site_link h.image_tag("avatars/#{avatar_name}", class: "avatar") 
  end

  def website
     handle_empty model.url do
       h.link_to model.url, model.url 
     end 
  end

  def linked_name
   site_link(model.full_name.present? ? model.full_name : model.username) 
  end

  def twitter
    handle_empty model.twitter_name do
      h.link_to model.twitter_name, "http://twitter.com/#{model.twitter_name}" 
    end 
  end

  def bio
    handle_empty model.bio do
      h.content_tag :span, (h.markdown model.bio), class: "user_bio"
    end

  end

  private

  def handle_empty(value)
    if value.present?
      yield
    else
      h.content_tag :span, "None given", class: "none"
    end
  end
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
