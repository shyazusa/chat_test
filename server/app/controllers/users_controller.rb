class UsersController < ApplicationController
  def create
    r = User.register(
      user_params[:name],
      user_params[:email],
      user_params[:password]
    )

    if !r.success?
      error_response r.errs, :unprocessable_entity
      return
    end
    render json: {}, status: :ok
  end

  private

  def user_params
    params.permit :name, :email, :password
  end
end
