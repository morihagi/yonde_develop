class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ new create show ]
  before_action :set_post, only: %i[edit update destroy]

  def index
    @search = current_user.posts.includes([segment: :program]).ransack(params[:q])
    @posts = @search.result.order(created_at: :desc).page(params[:page])
  end

  def new
    profile = Profile.find_by(user_id: current_user.id)

    if profile.present?
      @post = Post.new(
        email_for_post: current_user.email,
        prefecture: profile.prefecture,
        city: profile.city,
        radio_name: profile.radio_name,
        zip_code: profile.zip_code,
        other_address: profile.other_address,
        legal_name: profile.legal_name,
        phone: profile.phone,
        user_id: current_user.id
      )
    end
  end

  def create
      @post = current_user.posts.new(post_params) if user_signed_in?

    if @post.save
      redirect_to post_path(@post), notice: t('defaults.message.created', item: Post.model_name.human)
    else
      flash.now[:alert] = t('defaults.message.not_created', item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: t('defaults.message.updated', item: Post.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Post.model_name.human)
      render :edit
    end
  end

  def post_send
    
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, succes: t('defaults.message.deleted', item: Post.model_name.human)
  end

  def bookmarks
    @q = current_user.bookmark_posts.ransack(params[:q])
    @bookmark_posts = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  private

  def post_params
    params.require(:post).permit(:email_for_post, :prefecture, :city, :radio_name, :zip_code, :other_address, :legal_name, :phone, :body, :segment_id)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
