class Api::ContactsController < ApplicationController

  # def contact_action
  #   @contact = Contact.first

  #   render "contact.json.jb"
    
  # end
  def index
    @contacts = Contact.all
    render "index.json.jb"
  end

  def show
    # @contact = Contact.first
    @contact = Contact.find_by(id: params[:id])
    render "show.json.jb"
  end











end
