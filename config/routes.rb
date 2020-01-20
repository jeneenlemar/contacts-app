Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    # get "/contact_url" => "contacts#contact_action"

#make first route, method, view for index (all contacts) - done
# make next route, method, view for show (individual contacts)


    get "/contacts" => "contacts#index"
    get "/contacts/:id" => "contacts#show"


  end
end
