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

### Refactor and Implement Presenter Pattern with Draper

user.html.erb before refactor and implementing presenter pattern

![Before Draper](app/assets/images/rails_views_before_user-show.png)

user.html.erb after refactor and implementing presenter pattern

![After Draper](app/assets/images/rails_views_after_user-show.png)
