class GroupController < ApplicationController
  def view
    @group = Group.find(params[:id]);
    @subjects = @group.subjects
  end

  def tweets
    @group = Group.find(params[:id]);
    @tweets = @group.tweets.paginate(page: params[:page])
  end

  def photos
    @group = Group.find(params[:id]);
    @photos = @group.photos.paginate(page: params[:page])
  end

end

