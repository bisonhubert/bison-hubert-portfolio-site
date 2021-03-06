class ArticlesController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.friendly.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.friendly.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.friendly.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.friendly.find(params[:id])
    @article.destroy

    redirect_to blog_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :image, :summary)
    end
end
