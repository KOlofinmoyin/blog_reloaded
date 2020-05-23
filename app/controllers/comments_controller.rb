class CommentsController < ApplicationController
  # index, show, new, edit, create, update and destroy

  def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      redirect_to article_path(@article)
  end

  def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments
      @comment.destroy
      redirect_to articles_path
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
