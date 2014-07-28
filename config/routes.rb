UvdV1::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
	root to: "pages#home"
	namespace :api do
		namespace :v1 do
			resources :vehicles, only: [:index, :show]
		end
	end
end
