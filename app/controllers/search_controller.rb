class SearchController < ApplicationController
  def redirect
    if params[:query] != '' then
      redirect_to "/search/#{params['query']}"
    else
      redirect_to "/"
    end
  end

  def view
    @groups = Group.where("name like ?", "%#{params[:query]}%").paginate(page: params[:page])
  end
end
