class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def show
    authorize(@user)
  end

  def new
    @user = User.new
    authorize(@user)
  end

  def edit
    authorize(@user)
  end

  def create
    @user = User.new(permitted_attributes(User))
    authorize(@user)

    if @user.save
      redirect_to(@user, notice: t('controllers.users.created'))
    else
      render(:new)
    end
  end

  def update
    authorize(@user)

    if @user.update(user_params)
      redirect_to(@user, notice: t('controllers.users.updated'))
    else
      render(:edit)
    end
  end

  def destroy
    authorize(@user)
    @user.destroy
    redirect_to(index_path, notice: t('controllers.users.destroyed'))
  end

  def debtors_report
    @users = User.debtors
    authorize(@users)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(policy(@user).permitted_attributes)
  end
end
