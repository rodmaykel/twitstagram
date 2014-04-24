class StaticPagesController < ApplicationController
  def home
    @groups = Group.get_recent
  end

  def about
  end

  def contact
  end

  def tnc
  end

  def admin
  end

end

