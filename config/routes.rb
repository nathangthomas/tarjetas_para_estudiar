Rails.application.routes.draw do

  resources :decks do
     resources :cards do
       get :flop
       post :flop
     end
     resources :study, only: [:index, :show]
   end
end
