class RolesController < ApplicationController
  before_action :set_role, only: [:edit, :update, :destroy]
  
  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def edit
  end

  def create
    @role = Role.new(role_params)

    if @role.save
      redirect_to "/master/index?utf8=✓&pilihan=Data Role", notice: "Role was successfully created."
    else
      render :new
    end
  end

  def update
    if @role.update(role_params)
      redirect_to "/master/index?utf8=✓&pilihan=Data Role", notice: "Role was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @role.destroy
    redirect_to roles_path, notice: "Role was successfully destroyed."
  end

  private

  def set_role
    @role = Role.find_by(id: params[:id])
  end

  def role_params
    params.require(:role).permit(:name, permissions_attributes: {})
  end

end
