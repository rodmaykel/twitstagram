class SubjectsController < ApplicationController
  
  def create
    @group = Group.find(params[:id])
    @subject = @group.subjects.build(subject_params)
    if @subject.save
      flash[:success] = 'Subject added'
      redirect_to "/admin/groups/#{@group.id}"
    else
      @errors = @subject.errors
      render 'groups/show'
    end
  end


  private
    def subject_params
      params.require(:subject).permit(:name, :twitter, :instagram, :photo)
    end
end