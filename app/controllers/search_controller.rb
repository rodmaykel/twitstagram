class SearchController < ApplicationController
  def redirect
    if params[:query] != '' then
      redirect_to "/search/#{params['query']}"
    else
      redirect_to "/"
    end
  end

  def view
    if params[:query] then
      @groups = Group.where("name like ?", "%#{params[:query]}%").paginate(page: params[:page])
    else
      @groups = Group.all.paginate(page: params[:page])
    end
  end
end
