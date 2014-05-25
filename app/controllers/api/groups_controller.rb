class Api::GroupsController < Api::ApisController
  
  def initialize
    @errors = Hash.new
    @errors[:group_not_found] =  { error_code: 404, error_message: "Group not found" }
  end

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
    begin
      @group = Group.find(params[:id])
      @subjects = @group.subjects
      @tweets = @group.tweets.paginate(page: params[:page])
      @photos = @group.photos.paginate(page: params[:page])
      @json = @group.as_json
      @json[:subjects] = @subjects
      @json[:tweets] = @tweets
      @json[:photos] = @photos
      respond_to do |format|
        format.json { render json: @json }
      end
    rescue
      respond_to do |format|
        format.json { render json: @errors[:group_not_found] , status: 404 }
      end
    end
  end

  def subjects
    begin      
      @group = Group.find(params[:id]);
      @subjects = @group.subjects
      @json = { total: @subjects.count, subjects: @subjects }
      respond_to do |format|
        format.json { render json: @json }
      end
      rescue
      respond_to do |format|
        format.json { render json: @errors[:group_not_found] , status: 404 }
      end
    end
  end

  def tweets
    begin
      @group = Group.find(params[:id]);
      @tweets = @group.tweets.paginate(page: params[:page])
      @json = { total: @tweets.total_entries, tweets: @tweets }
      respond_to do |format|
        format.json { render json: @json }
      end
      rescue
      respond_to do |format|
        format.json { render json: @errors[:group_not_found] , status: 404 }
      end
    end
  end

  def photos
    begin
      @group = Group.find(params[:id]);
      @photos = @group.photos.paginate(page: params[:page])
      @json = { total: @photos.total_entries, photos: @photos }
      respond_to do |format|
        format.json { render json: @json }
      end
      rescue
      respond_to do |format|
        format.json { render json: @errors[:group_not_found] , status: 404 }
      end
    end
  end

end

