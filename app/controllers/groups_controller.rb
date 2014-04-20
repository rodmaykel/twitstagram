class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = "Group added"
      redirect_to "/admin/groups/#{@group.id}"
    else
      @errors = @group.errors
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
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
    @groups = Group.paginate(page: params[:page])
  end

  private
    def group_params
      params.require(:group).permit(:name, :description, :category, :photo)
    end
end
