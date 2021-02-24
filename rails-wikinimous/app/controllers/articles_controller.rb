class ArticlesController < ApplicationController
  before_action :set_articles, only: %i[index show]
  before_action :set_article, only: %i[edit update destroy]

  def index; end

  def new
    @article = Article.new # needed to instantiate the form_for
  end

  def create
    @article = Article.new(article_params)
    @article.save

    # no need for app/views/articles/create.html.erb
    redirect_to article_path(@article)
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit; end

  def update
    @article.update(article_params)

    # no need for app/views/articles/update.html.erb
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy

    # no need for app/views/articles/destroy.html.erb
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :details)
  end

  def set_articles
    @articles = Article.all
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
