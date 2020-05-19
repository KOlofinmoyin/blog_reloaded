class ArticlesController < ApplicationController
  # index, show, new, edit, create, update and destroy

  def index
      @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new

  end

  def create
    @article = Article.new(article_details)
    @article.save
    redirect_to @article
  end

  private
  def article_details
    params.require(:article).permit(:title, :text)
  end

end
