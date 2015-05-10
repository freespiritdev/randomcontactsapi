class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render json: @contacts, status: :ok
  end

  def show
    render json: @contact
    
  end

  def destroy
    @contact.destroy

    head :no_content
  end

  def update
    if @contact.update(contact_params)
      head :no_content
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def create
    @contact = Contact.new(param[:contact])

    if @contact.save
      render json: @contact, status: :created
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end
end