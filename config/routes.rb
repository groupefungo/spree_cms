Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :cms_sections
  end
end