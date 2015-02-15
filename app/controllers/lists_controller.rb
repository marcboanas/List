class ListsController < ApplicationController
  before_action :correct_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
  def index
    @user_lists = @user.user_lists.paginate(page: params[:page])
  end
  
  def show
    @user_list = UserList.find(params[:id])
  end
  
  def new
    @user_list = UserList.new
  end
  
  def create
    @user_list = @user.user_lists.build(list_params)
    if @user_list.save
      flash[:success] = "List created"
      redirect_to user_list_path(@user, @user_list)
    else
      render 'new'
    end
  end
  
  def edit
    @user_list = UserList.find(params[:id])
  end
  
  def update
    @user_list = UserList.find(params[:id])
    if @user_list.update_attributes(list_params)
      flash[:success] = "List updated"
      redirect_to user_list_path(@user, @user_list)
    else
      render 'edit'
    end
  end
  
  def destroy
    @user_list = UserList.find(params[:id])
    if @user_list.destroy
      flash[:sucess] = "List deleted"
      redirect_to user_lists_path(@user)
    else
      flash[:danger] = "List could not be deleted"
      redirect_to request.referrer || root_url
    end
  end
  
  private
  
  def list_params
    params.require(:user_list).permit(:title)
  end
  
  def correct_user
    @user = User.find(params[:user_id])
    redirect_to root_url unless current_user?(@user) || current_user.admin?
  end
end
