class UsersController < ApplicationController
  def show
    @products = Product.all
    @users = User.all
    @user = current_user
  end

  def edit  
  end

  def update
    if current_user.update(user_params)
      redirect_to users_show_path, notice: "Seu perfil foi atualizado com sucesso"
    else
      render :edit
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :phone, :email, :address, :avatar)
  end

end
