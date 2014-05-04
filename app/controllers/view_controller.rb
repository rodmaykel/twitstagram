class ViewController < ApplicationController
  def view
    @group = Group.find(params[:id]);
  end

  def tweets
    @group = Group.find(params[:id]);
    @tweets = @group.tweets
  end

  def photos
    @group = Group.find(params[:id]);
    @photos = @group.photos
  end

  def subjects
    @group = Group.find(params[:id]);
    @subjects = @group.subjects
  end    

end

