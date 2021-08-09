class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new

  end

  def edit 
    @article = Article.find(params[:id])
  end

  def create
    @create_article = Article.new(params.require(:article).permit(:title, :description))
    
    if @create_article.save
      flash[:notice] = "Article was created successfully"
      redirect_to article_path(@create_article) # or use only @create_article (shortcut)
    else
      render "new"
    end  
  end

  def update 
    @update_article = Article.find(params[:id])
    if @update_article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully"
      redirect_to @update_article
    else
      render "edit"
    end
  end
end