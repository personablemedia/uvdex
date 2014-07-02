UvdV1::Application.routes.draw do
	root to: "pages#home"
	namespace :api do
		namespace :v1 do
			resources :vehicles, only: [:index, :show]
		end
	end
end
