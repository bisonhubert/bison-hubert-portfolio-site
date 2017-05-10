class StaticPagesController < ApplicationController
  def home
    render 'home'
  end

  def about
    render 'about'
  end

  def portfolio
    render 'portfolio'
  end

  def resume
  end
end
