Rails.application.routes.draw do
  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end
  
    get "/user/annonces/:user_id" => 'annonces#show_my_annonces', as: 'user_annonces'

  # Below for all other routes:
  devise_for :users
  resources :annonces
  resources :categories
  resources :users
  root "layouts#index"
end