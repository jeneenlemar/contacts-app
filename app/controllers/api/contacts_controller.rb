class Api::ContactsController < ApplicationController

  # def contact_action
  #   @contact = Contact.first

  #   render "contact.json.jb"
    
  # end
  def index

    @contacts = current_user.contacts

    #search any contact with specific first name
    #contact 

    if params[:select]
      @contacts = @contacts.where("first_name iLIKE ? OR last_name iLIKE ? or middle_name iLIKE ? or email iLIKE ?", "#{params[:select]}, #{params[:select]}, #{params[:select]}, #{params[:select]}")
    end

# default option
    # @contacts = @contact.order(:id)

    


    render "index.json.jb"
  end

  def show
    # @contact = Contact.first
    @contact = Contact.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create

    # coordinates = Geocoder.coordinates(params[:address])

    @contact = Contact.new(
      first_name: params["first_name"],
      middle_name: params["middle_name"],
      last_name: params["last_name"],
      # latitude: coordinates[0],
      # longitude: coordinates[1],
      email: params["email"],
      phone_number: params["phone_number"],
      bio: params["bio"],
      user_id: current_user.id
      )


    #happy path
    if @contact.save

      render "show.json.jb"

    #sad path
    else

      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def update
    @contact = Contact.find_by(id: params[:id])

    #from class


    if params[:address]
      coordinates = Geocoder.coordinates(params[:address])
      @contact.longitude = coordinates[1] || @contact.longitude
      @contact.latitude = coordinates[0] || @contact.latitude
    end

    # if params[:address]
    #   coordinates = Geocoder.coordinates(params[:address])
    #   @contact.longitude = coordinates[1] || @contact.longitude
    #   @contact.latitude = coordinates[0] || @contact.latitude
    # end
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.bio = params[:bio] || @contact.bio

    #happy path
    if @contact.save

      render "show.json.jb"

    #sad path
    else

      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def destroy
    @contact = Contact.find_by(id: params["id"])
    @contact.destroy
    render json: {message: "item successfully deleted"}
  end



# def path_error_handle
#   if contact.save

  
# end









end
