Rails.application.routes.draw do

  devise_for :users
        # new_user_session GET    /users/sign_in(.:format)        devise/sessions#new
            # user_session POST   /users/sign_in(.:format)        devise/sessions#create
    # destroy_user_session DELETE /users/sign_out(.:format)       devise/sessions#destroy
       # new_user_password GET    /users/password/new(.:format)   devise/passwords#new
      # edit_user_password GET    /users/password/edit(.:format)  devise/passwords#edit
           # user_password PATCH  /users/password(.:format)       devise/passwords#update
                         # PUT    /users/password(.:format)       devise/passwords#update
                         # POST   /users/password(.:format)       devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)         devise/registrations#cancel
   # new_user_registration GET    /users/sign_up(.:format)        devise/registrations#new
  # edit_user_registration GET    /users/edit(.:format)           devise/registrations#edit
       # user_registration PATCH  /users(.:format)                devise/registrations#update
                         # PUT    /users(.:format)                devise/registrations#update
                         # DELETE /users(.:format)                devise/registrations#destroy
                         # POST   /users(.:format)                devise/registrations#create


  resources :users, param: :current_user, except: [:new, :create, :destroy]
      #   users GET    /users(.:format)                     users#index
    # edit_user GET    /users/:current_user/edit(.:format)  users#edit
        #  user GET    /users/:current_user(.:format)       users#show
            #   PATCH  /users/:current_user(.:format)       users#update
            #   PUT    /users/:current_user(.:format)       users#update

end
