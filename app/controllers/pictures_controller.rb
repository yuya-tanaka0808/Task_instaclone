class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :current_user
  before_action :logged_in?
  before_action :authenticate_user
  before_action :check_user, only: [:edit,:update,:destroy]
  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  # GET /pictures/new
  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = current_user.pictures.build(picture_params)
    respond_to do |format|
      if @picture.save
        format.html { redirect_to pictures_path, notice: '投稿しました' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: "投稿を編集しました" }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: '投稿を削除しました' }
      format.json { head :no_content }
    end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    @picture.id = params[:id]
    render :new if @picture.invalid?
  end



  private
    # Use callbacks to share common setup or constraints between actions.
  def set_picture
    @picture = Picture.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def picture_params
    params.require(:picture).permit(:id, :image, :image_cache,:user_id,:title,:content)
  end

end
