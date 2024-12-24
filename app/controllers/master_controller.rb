class MasterController < ApplicationController
  def index
    @roles = Role.all.order("CREATED_AT ASC")
    @users = User.all.order("CREATED_AT ASC")
    @employees = Employee.all.order("CREATED_AT DESC")
    @divisions = Division.all.order("CREATED_AT DESC")
    @activities = Activity.all.order("CREATED_AT DESC")
    @departements = Department.all.order("CREATED_AT DESC")
    @disiplines = Disipline.all.order("CREATED_AT DESC")
    @positions = Position.all.order("CREATED_AT DESC")
    @projects = Project.all.order("CREATED_AT DESC")
    @team_projects = TeamProject.all.order("CREATED_AT DESC")
    @inventories = Inventory.all.order("CREATED_AT DESC")
    @items = Item.all.order("CREATED_AT DESC")
  end
end
