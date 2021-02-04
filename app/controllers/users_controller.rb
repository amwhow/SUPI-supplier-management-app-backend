class UsersController < ApplicationController
  
  def create
    @user = User.create(user_params)
    if @user.save
      auth_token = Knock::AuthToken.new payload: {sub: @user.id}
      render json: {user_name: @user.user_name, jwt: auth_token.token}, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def sign_in
    @user = User.find_by_email(params[:auth][:email])
    if @user && @user.authenticate(params[:auth][:password])
      auth_token = Knock::AuthToken.new payload: {sub: @user.id}
      render json: {user_name: @user.user_name, jwt: auth_token.token}, status: 200
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
