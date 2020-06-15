class ArticlesController < ApplicationController
  # load_and_authorize_resource
  before_action :set_article, only: [:show, :edit, :update, :destroy, :bookmark]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  def bookmark
    puts params

    puts "0000000000000000000000000000000000"
    i = 0

    puts current_user.profile.bookmarks.count

    if current_user.profile.bookmarks.count == 0
      Bookmark.create!(profile_id: current_user.profile.id, article_id: params[:id])
    else
      current_user.profile.bookmarks.each do |book|
        puts book.article_id
        if book.article_id == params[:id].to_i
          i = i + 1
        end
      end
      if i == 0
        Bookmark.create!(profile_id: current_user.profile.id, article_id: params[:id])
      else
        Bookmark.find_by(article_id: params[:id].to_i).destroy
      end
    end

    puts i


    respond_to do |format|
      #format.html { redirect_to article_path(@article) }
      format.json { render :show, status: :created, location: @article }
    end
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:header, :content, :cover)
    end
end
