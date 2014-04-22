class ViewController < ApplicationController
  def view
    @group = Group.find(params[:id]);
  end
end

