Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    # get "/contact_url" => "contacts#contact_action"

#make first route, method, view for index (all contacts) - done
# make next route, method, view for show (individual contacts) - done
# make


    get "/contacts" => "contacts#index"
    get "/contacts/:id" => "contacts#show"
    post "/contacts" => "contacts#create"
    patch "contacts/:id" => "contacts#update"
    delete "contacts/:id" => "contacts#destroy"

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
  end
end
