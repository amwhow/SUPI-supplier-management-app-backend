class UsersController < ApplicationController
  
  def create
    @user = User.create(user_params)
    if @user.save
      # auth_token = Knock::AuthToken.new payload: {sub: @user.id}
      # render json: {user_name: @user.user_name, jwt: auth_token.token}, 
      render status: :created
    else
      # render json: @user.errors, status: :unprocessable_entity
      render status: :bad_request
    end
  end

  def sign_in
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      # auth_token = Knock::AuthToken.new payload: {sub: @user.id}
      render status: 200
      # json: {user_name: @user.user_name, jwt: auth_token.token}, 
    else
      render json: {error: "Incorrect email or password"}, status: 404
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :company_name)
    # , :logo
  end
end
