class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to "/admin/groups/#{@group.id}"; 
    else
      @errors = @group.errors
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private

    def group_params
      params.require(:group).permit(:name, :description, :category, :photo)
    end
end
