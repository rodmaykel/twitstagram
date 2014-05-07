class Admin::GroupsController < ApplicationController

  def create
    @group = Group.new(group_params)
    @groups = Group.paginate(page: params[:page])
    if @group.save
      flash[:success] = "Group added"
      redirect_to "/admin/groups/#{@group.id}"
    else
      @errors = @group.errors
      render 'index'
    end
  end

  def show
    @group = Group.find(params[:id])
    @subjects = @group.subjects.paginate(page: params[:page])
    @subject = Subject.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:success] = "Group updated"
      redirect_to "/admin/groups/#{@group.id}"
    else
      @errors = @group.errors
      render 'edit'
    end
  end

  def index
    @group = Group.new
    @groups = Group.paginate(page: params[:page])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:success] = 'Delete success'
    redirect_to "/admin/groups"
  end

  private
    def group_params
      params.require(:group).permit(:name, :description, :category, :photo)
    end
end
