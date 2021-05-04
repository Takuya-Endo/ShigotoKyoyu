Rails.application.routes.draw do

  get 'teams/index'
  get 'teams/show'
  get 'teams/new'
  get 'teams/create'
  get 'teams/edit'
  get 'teams/update'
  get 'teams/destroy'
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

  root to: 'events#index'
  resources :events, only: [:new]
    # new_event GET    /events/new(.:format)  events#new

  get '/appointments/complete' => 'appointments#complete'
  resources :appointments, except: [:index]
        #  appointments POST   /appointments(.:format)           appointments#create
    #   new_appointment GET    /appointments/new(.:format)       appointments#new
    #  edit_appointment GET    /appointments/:id/edit(.:format)  appointments#edit
        #   appointment GET    /appointments/:id(.:format)       appointments#show
                    #   PATCH  /appointments/:id(.:format)       appointments#update
                    #   PUT    /appointments/:id(.:format)       appointments#update
                    #   DELETE /appointments/:id(.:format)       appointments#destroy

  get '/meetings/complete' => 'meetings#complete'
  resources :meetings, except: [:index]
        #  meetings POST   /meetings(.:format)           meetings#create
    #   new_meeting GET    /meetings/new(.:format)       meetings#new
    #  edit_meeting GET    /meetings/:id/edit(.:format)  meetings#edit
        #   meeting GET    /meetings/:id(.:format)       meetings#show
                #   PATCH  /meetings/:id(.:format)       meetings#update
                #   PUT    /meetings/:id(.:format)       meetings#update
                #   DELETE /meetings/:id(.:format)       meetings#destroy

  get '/meetings/complete' => 'meetings#complete'
  resources :tasks, except: [:index]
       #  tasks POST   /tasks(.:format)           tasks#create
    #  new_task GET    /tasks/new(.:format)       tasks#new
    # edit_task GET    /tasks/:id/edit(.:format)  tasks#edit
        #  task GET    /tasks/:id(.:format)       tasks#show
            #   PATCH  /tasks/:id(.:format)       tasks#update
            #   PUT    /tasks/:id(.:format)       tasks#update
            #   DELETE /tasks/:id(.:format)       tasks#destroy

  get 'homes/about'

  resources :teams
        # teams GET    /teams(.:format)           teams#index
            #   POST   /teams(.:format)           teams#create
    #  new_team GET    /teams/new(.:format)       teams#new
    # edit_team GET    /teams/:id/edit(.:format)  teams#edit
        #  team GET    /teams/:id(.:format)       teams#show
            #   PATCH  /teams/:id(.:format)       teams#update
            #   PUT    /teams/:id(.:format)       teams#update
            #   DELETE /teams/:id(.:format)       teams#destroy

end
