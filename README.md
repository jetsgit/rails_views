Rails Views: Simple Form, I18n, Presenter Pattern, and Template Inheritance
===========================================================================

### Streamlining your Rails Views.

#### Requirements

* Ruby version:  2.1.0
* Rails: 4.0.2
* Gems:  Draper, RedCarpet, SimpleForm, sqlite3

### Simple Form

Simple form allows you to streamline your views by making it incredibly
easy to implement complex forms.

#### Install

Add ``` gem 'simple_form' ``` to your Gemfile
Run ``` rails g simple_form:install ```

### Before using Simple Form

![Before using Simple Form](app/assets/images/rails_views_before_changing_fields.png)

### After using Simple Form

![After using Simple Form](app/assets/images/rails_views_after_simple_form.png)

### I18n Implementation

English Lanuage

![English I18n](app/assets/images/rails_views_I18n_browser_en.png)

Jetski Language

![Jetski Language](app/assets/images/rails_views_I18n_jetski.png)

### Refactor and Implement Presenter/Decorator  Pattern with Draper

user/show.html.erb before refactor and implementing presenter pattern

![Before Draper](app/assets/images/rails_views_before_user-show.png)

user/show.html.erb after refactor and implementing presenter pattern

![After Draper](app/assets/images/rails_views_after_user-show.png)

#### decorator.rb

```ruby
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
```
