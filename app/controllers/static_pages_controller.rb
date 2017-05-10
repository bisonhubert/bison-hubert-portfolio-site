class StaticPagesController < ApplicationController
  def home
    render html: 'Home'
  end

  def about
    render html: 'About'
  end

  def portfolio
    render html: 'Portfolio'
  end
end
