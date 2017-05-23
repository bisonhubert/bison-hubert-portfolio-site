class StaticPagesController < ApplicationController
  def home
    render 'home'
  end

  def about
    render 'about'
  end

  def under_construction
    render 'under_construction'
  end
end
