class GmailsController < ApplicationController
  before_action :set_post

  require 'mail'
  require 'google/apis/gmail_v1'

  # Gmailの下書きボックスに投稿メールを送る
  def post_draft
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

    gmail.create_user_draft('me', draft, options: {authorization: Token.last.access_token})
    redirect_to posts_path, notice: '投稿メールをGmailの下書きボックスに保存しました'
  end

  # Gmailから番組に投稿メールを送る
  # Gmailの送信ボックスにも保存される
  def post_send
    gmail = Google::Apis::GmailV1::GmailService.new
    draft = Google::Apis::GmailV1::Draft.new
    message = Google::Apis::GmailV1::Message.new

    mail = Mail.new
    mail.from    = current_user.posts.email_for_post
    mail.to      = ENV['OFFICIAL_E_MAIL']
    mail.subject = post.segment.segment_title_for_email
    mail.body    = 'this is the body'

    message.raw = mail.to_s
    draft.message = message

    gmail.send_user_message('me', message, options: { authorization: Token.last.access_token })
    redirect_to posts_path, notice: '投稿メールを番組に送りました'
  end

  private

  def set_post
    @post = current_user.posts.find(params[:post_id])
  end
end
