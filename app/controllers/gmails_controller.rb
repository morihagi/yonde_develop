class GmailsController < ApplicationController
  before_action :set_post

  require 'mail'
  require 'google/apis/gmail_v1'
  require 'google/api_client/client_secrets.rb'
  require 'googleauth'

  # Gmailの下書きボックスに投稿メールを送る
  def post_draft
    # Initialize the API
    gmail = Google::Apis::GmailV1::GmailService.new
    gmail.authorization = google_secret.to_authorization
    gmail.authorization.refresh!

    draft = Google::Apis::GmailV1::Draft.new
    message = Google::Apis::GmailV1::Message.new

    mail = Mail.new
    mail.from    = @post.email_for_post
    mail.to      = @post.segment.program.email
    mail.subject = @post.segment.segment_title_for_email
    mail.body    = @post.body

    message.raw = mail.to_s
    draft.message = message

    gmail.create_user_draft('me', draft, options: {authorization: current_user.tokens.last.access_token})
    @post.update(post_status: 'gmail_draft')
    redirect_to posts_path, notice: '投稿メールをGmailの下書きボックスに保存しました'
  end

  # Gmailから番組に投稿メールを送る(Gmailの送信ボックスにも保存される)
  def post_send
    # Initialize the API
    gmail = Google::Apis::GmailV1::GmailService.new
    gmail.authorization = google_secret.to_authorization
    gmail.authorization.refresh!

    draft = Google::Apis::GmailV1::Draft.new
    message = Google::Apis::GmailV1::Message.new

    mail = Mail.new
    mail.from    = @post.email_for_post
    mail.to      = ENV['OFFICIAL_E_MAIL']
    mail.subject = @post.segment.segment_title_for_email
    mail.body    = @post.body

    message.raw = mail.to_s
    draft.message = message

    gmail.send_user_message('me', message, options: { authorization: Token.last.access_token })
    @post.update(post_status: 'gmail_sent')
    redirect_to posts_path, notice: '投稿メールを番組に送りました'
  end

  private

  def set_post
    @post = current_user.posts.find(params[:post_id])
  end

  def google_secret
    scope = 'https://www.googleapis.com/auth/gmail.compose'

    Google::APIClient::ClientSecrets.new(
      { "web" =>
        { "access_token" => current_user.tokens.last.access_token,
          "refresh_token" => current_user.tokens.last.refresh_token,
          "client_id" => ENV['GOOGLE_CLIENT_ID'],
          "client_secret" => ENV['GOOGLE_CLIENT_SECRET'],
          "scope" => scope
        }
      }
    )
  end
end
