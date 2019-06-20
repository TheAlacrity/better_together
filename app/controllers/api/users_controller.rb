class Api::UsersController < ApplicationController
  
  def index
    @users = User.all
    render 'index.json.jbuilder'
  end

  def create
    @user = User.new(
                     username: params[:username],
                     email: params[:email],
                     # password: params[:password],
                     # password_confirmation: params[:password_confirmation],
                     about: params[:about],
                     age: params[:age],
                     gender: params[:gender],
                     looking_for_gender: params[:looking_for_gender],
                     looking_for_role: params[:looking_for_role]
                     )
    @user.save
    render 'show.json.jbuilder'
  end

  def show
    @user = User.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @user = User.find[params[:id]]

    @user.username = params[:username] || @user.username
    @user.email = params[:email] || @user.email
    # @user.password = params[:password] || @user.password
    # @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation
    @user.about = params[:about] || @user.about
    @user.age = params[:age] || @user.age
    @user.gender = params[:gender] || @user.gender
    @user.looking_for_gender = params[:looking_for_gender] || @user.looking_for_gender
    @user.looking_for_role = params[:looking_for_role] || @user.looking_for_role

    @user.save
    render 'show.json.jbuilder'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {message: "Successfully destroyed user."}
  end
end
