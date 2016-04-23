class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(model_params)

    if @user.save
      flash[:notice] = 'User successfully created!'
      redirect_to @user
    else
      flash.now[:error] = 'Failed to create user!'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @grams = @user.grams.page(params[:page]).per(5)
  end

  private

    def model_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
