class ArticlesController < ApplicationController
  # index, show, new, edit, create, update and destroy

  def index
      @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_details)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
      @article = Article.find(params[:id])

      if @article.update(article_details)
          redirect_to @article
        else
          render 'edit'
      end
  end

  def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to articles_path
  end

  private
  def article_details
    params.require(:article).permit(:title, :text)
  end

end
