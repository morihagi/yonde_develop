module PostsHelper
  def post_status_badge(post)
    status_classes = {
      'draft' => 'badge text-bg-secondary',
      'sent' => 'badge bg-white text-red border'
    }

    status_class = status_classes[post.post_status]
    content_tag(:div, post.post_status_text, class: status_class) if status_class
  end

  def generate_email_body(post)
    email_body = ''

    if post.residence_prefecture.present? || post.residence_city.present?
      email_body += "在住: #{post.residence_prefecture}#{post.residence_city} \n"
    end

    if post.radio_name.present?
      email_body += "RN: #{post.radio_name}\n\n"
    end

    email_body += "#{post.body}\n\n"

    if post.zip_code.present?
      email_body += "郵便番号: #{post.zip_code}\n"
    end

    if post.prefecture.present? || post.city.present? || post.other_address.present?
      email_body += "住所: #{post.prefecture}#{post.city}#{post.other_address}\n"
    end

    if post.phone.present?
      email_body += "電話番号: #{post.phone}\n"
    end

    if post.legal_name.present?
      email_body += "名前: #{post.legal_name}\n"
    end

    email_body
  end
end
