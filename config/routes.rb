Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :cms_sections do
      resources :cms_contents
    end
  end
end

SpreeCms::Engine.routes.prepend do
  mount Ckeditor::Engine => '/ckeditor'
end

