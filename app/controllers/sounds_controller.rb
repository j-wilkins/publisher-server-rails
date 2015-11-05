class SoundsController < ApplicationController
  before_action :set_sound, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    if signed_in?
      @posts = Sound.paginate(page: params[:page]).all
    else
      @posts = Sound.visible.paginate(page: params[:page]).all
    end
  end

  def show
  end

  def new
    @post = Sound.new
  end

  def edit
  end

  def create
    @post = Sound.new(sound_params)

    if @post.save
      save_tags(@post, sound_params)
      redirect_to @post.path, notice: "Sound was successfully created."
    else
      render :new
    end
  end

  def update
    if @post.update(sound_params)
      save_tags(@post, sound_params)
      redirect_to @post.path, notice: "Sound was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    delete_tags(@post)
    @post.destroy
    redirect_to sounds_url, notice: "Sound was successfully destroyed."
  end

  private

  def set_sound
    @post = Sound.where(slug: params[:slug]).first
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def sound_params
    params.require(:sound).permit(:title, :subtitle, :content, :slug, :in_reply_to,
      :tags, :published_at, :private, :image_url, :duration, :captured_at, :enclosure_url)
  end
end
