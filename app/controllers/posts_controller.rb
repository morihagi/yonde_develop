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

    attributes_to_copy = %i[
      residence_prefecture
      residence_city
      radio_name
      zip_code
      prefecture
      city
      other_address
      legal_name
      phone
    ]

    attributes_to_copy.each do |attribute|
      @post[attribute] = profile[attribute]
    end

    @post.user_id = current_user.id
  end

  def create
    @post = build_post

    if @post.save
      process_successful_save
    else
      process_failed_save
    end
  end

  def show; end

  def show_for_unregistered_user
    @post = last_post_for_unregistered_user
  end

  def edit
    profile = Profile.find_by(user_id: current_user.id)
    return unless profile.present?

    attributes_to_copy = %i[
      zip_code
      prefecture
      city
      other_address
      legal_name
      phone
    ]

    attributes_to_copy.each do |attribute|
      @post[attribute] = profile[attribute]
    end
  end

  def update
    if @post.update(post_params.merge(post_status: :draft))
      redirect_to @post, notice: t('defaults.message.updated', item: Post.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: Post.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, notice: t('defaults.message.deleted', item: Post.model_name.human)
  end

  # def bookmarks
  #   @q = current_user.bookmark_posts.ransack(params[:q])
  #   @bookmark_posts = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  # end

  def duplicate
    @duplicate_post = Post.new(@post.attributes.except('id', 'created_at', 'updated_at'))
    if @duplicate_post.save
      redirect_to posts_path, notice: t('defaults.message.duplicated', item: Post.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_duplicated', item: Post.model_name.human)
      render :index
    end
  end

  def update_status
    @post = Post.find(params[:id])
    @post.update(post_status: 'sent')
    render json: { status: 'success' }
  end

  private

  def post_params
    params.require(:post).permit(:prefecture, :city, :radio_name,
                                 :zip_code, :other_address, :legal_name, :phone, :body,
                                 :segment_id, :residence_prefecture, :residence_city, :post_status)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def last_post_for_unregistered_user
    unregistered_user = User.find(1)
    unregistered_user.posts.last
  end

  def build_post
    user = user_signed_in? ? current_user : User.find(1)
    user.posts.new(post_params)
  end

  def process_successful_save
    redirect_path = user_signed_in? ? post_path(@post) : show_for_guest_user_path
    redirect_to redirect_path, notice: t('defaults.message.created', item: Post.model_name.human)
  end

  def process_failed_save
    flash.now[:error] = t('defaults.message.not_created', item: Post.model_name.human)
    render :new, status: :unprocessable_entity
  end
end
