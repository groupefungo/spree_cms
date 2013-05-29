Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  mount Spree::Core::Engine => "/"
end
