class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create show_for_unregistered_user]
  before_action :set_post, only: %i[show edit update destroy duplicate]

  def index
    @search = current_user.posts.includes([:segment]).ransack(params[:q])
    @posts = @search.result.order(created_at: :desc).page(params[:page])
  end

  def new
    @post = Post.new

    return unless user_signed_in?

    profile = Profile.find_by(user_id: current_user.id)
    return unless profile.present?

    @post.prefecture = profile.prefecture
    @post.city = profile.city
    @post.radio_name = profile.radio_name
    @post.zip_code = profile.zip_code
    @post.other_address = profile.other_address
    @post.legal_name = profile.legal_name
    @post.phone = profile.phone
    @post.user_id = current_user.id
    @post.residence_prefecture = profile.residence_prefecture
    @post.residence_city = profile.residence_city
  end

  def create
    if user_signed_in?
      @post = current_user.posts.new(post_params)

      if @post.save
        redirect_to post_path(@post), notice: t('defaults.message.created', item: Post.model_name.human)
      else
        flash.now[:alert] = t('defaults.message.not_created', item: Post.model_name.human)
        render :new, status: :unprocessable_entity
      end

    else
      unregistered_user = User.find(1)
      @post = unregistered_user.posts.new(post_params)

      if @post.save
        redirect_to show_for_guest_user_path, notice: t('defaults.message.created', item: Post.model_name.human)
      else
        flash.now[:alert] = t('defaults.message.not_created', item: Post.model_name.human)
        render :new, status: :unprocessable_entity
      end
    end
  end

  def show; end

  def show_for_unregistered_user
    @post = get_last_post_for_unregistered_user
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

  def destroy
    @post.destroy!
    redirect_to posts_path, succes: t('defaults.message.deleted', item: Post.model_name.human)
  end

  def bookmarks
    @q = current_user.bookmark_posts.ransack(params[:q])
    @bookmark_posts = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def duplicate
    @duplicate_post = Post.new(@post.attributes.except("id", "created_at", "updated_at"))
    if @duplicate_post.save
      redirect_to posts_path, success: t('defaults.message.deleted', item: Post.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Post.model_name.human)
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:prefecture, :city, :radio_name, :zip_code, :other_address, :legal_name, :phone, :body, :segment_id, :residence_prefecture, :residence_city)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def get_last_post_for_unregistered_user
    unregistered_user = User.find(1)
    unregistered_user.posts.last
  end
end
