class Api::UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :update, :destroy]

  def index
    search_by_current_user = params[:by_user]
    limit_results = params[:limit]

    @users = User.all

    if search_by_current_user == "true" && limit_results
      @users = current_user.search_by_preferences.order(id: :asc).limit(limit_results)
    elsif search_by_current_user == "true"
      @users = current_user.search_by_preferences
    end

    render 'index.json.jbuilder'
  end

  def create
    @user = User.new(
                     username: params[:username],
                     email: params[:email],
                     first_name: params[:first_name],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation],
                     about: params[:about],
                     age: params[:age],
                     gender: params[:gender],
                     looking_for_gender: params[:looking_for_gender],
                     looking_for_role: params[:looking_for_role]
                     )
    if @user.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @user = User.find(params[:id])

    if current_user.id == @user.id
      @user.username = params[:username] || @user.username
      @user.first_name = params[:first_name] || @user.first_name
      @user.email = params[:email] || @user.email
      @user.about = params[:about] || @user.about
      @user.age = params[:age] || @user.age
      @user.gender = params[:gender] || @user.gender
      @user.looking_for_gender = params[:looking_for_gender] || @user.looking_for_gender
      @user.looking_for_role = params[:looking_for_role] || @user.looking_for_role

      if @user.save
        render 'show.json.jbuilder'
      else
        render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
      end

    else
      render json: {message: "You don't have permission to update another user."}
    end
  end

  def destroy
    @user = User.find(params[:id])

    if current_user.id == @user.id
      @user.destroy
      render json: {message: "Successfully destroyed user."}
    else
      render json: {message: "You don't have permission to delete another user."}
    end
  end
end
