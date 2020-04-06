Rails.application.routes.draw do
  resources :menu_items
  resources :menus do
    post "/activate", :to => "menus#activate", :as => "activate"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
