class Api::GroupsController < Api::ApisController
  
  def index
    if ((params[:q]) && (params[:category]))
      @groups = Group.where(["category LIKE ? AND name LIKE ?", params[:category], "%#{params[:q]}%"]).paginate(page: params[:page])
    elsif (params[:q]) 
      @groups = Group.where(["name LIKE ?", "%#{params[:q]}%"]).paginate(page: params[:page])
    elsif (params[:category])
      @groups = Group.where(["category LIKE ?", params[:category]]).paginate(page: params[:page])
    else
      @groups = Group.all().paginate(page: params[:page])
    end
    @json = { groups: @groups, total: @groups.total_entries };
    respond_to do |format|
      format.json { render json: @json }
    end
  end

  def show
    @group = Group.find(params[:id]);
    @subjects = @group.subjects.paginate(page: params[:page])
    @tweets = @group.tweets.paginate(page: params[:page])
    @photos = @group.photos.paginate(page: params[:page])
  end

  def subjects
    @group = Group.find(params[:id]);
    @subjects = @group.subjects.paginate(page: params[:page])
    @json = { total: @subjects.total_entries, subjects: @subjects }
    respond_to do |format|
      format.json { render json: @json }
    end
  end

  def tweets
    @group = Group.find(params[:id]);
    @tweets = @group.tweets.paginate(page: params[:page])
    @json = { total: @tweets.total_entries, tweets: @tweets }
    respond_to do |format|
      format.json { render json: @json }
    end
  end

  def photos
    @group = Group.find(params[:id]);
    @photos = @group.photos.paginate(page: params[:page])
    @json = { total: @photos.total_entries, photos: @photos }
    respond_to do |format|
      format.json { render json: @json }
    end
  end

end

