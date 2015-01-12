RailsViews::Application.routes.draw do
  resources :users

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    resources :products
    root to: 'users#index'
  end
  get '/readme', :to => redirect('/README.md')
  get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  get '', to: redirect("/#{I18n.default_locale}")
end
