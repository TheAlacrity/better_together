class Api::HangoutsController < ApplicationController
  before_action :authenticate_user

  def index
    @hangouts = Hangout.all
    render 'index.json.jbuilder'
  end

  def create
    if current_user
      @hangout = Hangout.find_or_create_by(name: params[:name]) do |hangout|
        hangout.name = params[:name]
        hangout.address = params[:address]
        hangout.category_id = params[:category_id]
      end


      # connect user with this hangout by creating user_hangout
      @user_hangout = UserHangout.create(
                                        user_id: current_user.id,
                                        hangout_id: @hangout.id
                                        )

      if @hangout.save
        render 'show.json.jbuilder'
      else
        render json: { errors: @hangout.errors.full_messages }, status: :uprocessable_entity
      end

    else
      render json: {message: "You must be logged in to search or create a hangout."}
    end
  end

  def show
    if current_user
      @hangout = Hangout.find(params[:id])
      render 'show.json.jbuilder'
    else
      render json: {message: "You must be logged in to search or create a hangout."}
    end
  end

  def update
    if current_user
      @hangout = Hangout.find(params[:id])

      @hangout.name = params[:name] || @hangout.name
      @hangout.address = params[:address] || @hangout.address
      @hangout.category_id = params[:category_id] || @hangout.category_id


      if @hangout.save
        render 'show.json.jbuilder'
      else
        render json: { message: @hangout.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {message: "You must be logged in to search or create a hangout."}
    end
  end

  def destroy
    if current_user
      @hangout = Hangout.find(params[:id])
      @hangout.destroy
      render json: { message: "Successfully destroyed hangout #{@hangout.name} with id #{@hangout.id}"}
    else
      render json: {message: "You must be logged in to search or create a hangout."}
    end
  end
end
