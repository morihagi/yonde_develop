class GmailsController < ApplicationController
  before_action :set_post
  before_action :get_new_token

  require 'mail'
  require 'google/apis/gmail_v1'

  # Gmailの下書きボックスに投稿メールを送る
  def post_draft
    # Initialize the API
    gmail = Google::Apis::GmailV1::GmailService.new
    draft = Google::Apis::GmailV1::Draft.new
    message = Google::Apis::GmailV1::Message.new

    mail = Mail.new
    mail.from    = @post.email_for_post
    mail.to      = @post.segment.program.email
    mail.subject = @post.segment.segment_title_for_email
    mail.body    = @post.body

    message.raw = mail.to_s
    draft.message = message

    gmail.create_user_draft('me', draft, options: { authorization: current_user.tokens.last.access_token} )
    @post.update(post_status: 'gmail_draft')
    redirect_to posts_path, notice: '投稿メールをGmailの下書きボックスに保存しました'
  end

  # Gmailから番組に投稿メールを送る(Gmailの送信ボックスにも保存される)
  def post_send
    # Initialize the API
    gmail = Google::Apis::GmailV1::GmailService.new
    draft = Google::Apis::GmailV1::Draft.new
    message = Google::Apis::GmailV1::Message.new

    mail = Mail.new
    mail.from    = @post.email_for_post
    mail.to      = ENV['OFFICIAL_E_MAIL']
    mail.subject = @post.segment.segment_title_for_email
    mail.body    = @post.body

    message.raw = mail.to_s
    draft.message = message

    gmail.send_user_message('me', message, options: { authorization: current_user.tokens.last.access_token } )
    @post.update(post_status: 'gmail_sent')
    redirect_to posts_path, notice: '投稿メールを番組に送りました'
  end

  private

  def set_post
    @post = current_user.posts.find(params[:post_id])
  end

  def token_params
    params.require(:token).permit(:access_token, :expires_at)
  end

  def get_new_token
    token = Token.find_by(user_id: current_user.id)
    token.fresh_token
  end
end
