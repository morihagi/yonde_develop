module PostsHelper
  def post_status_badge(post)
    status_classes = {
      'draft' => 'badge text-bg-secondary',
      'sent' => 'badge text-bg-light border'
    }

    status_class = status_classes[post.post_status]
    content_tag(:div, post.post_status_text, class: status_class) if status_class
  end

  def generate_email_body(post)
    email_body = ''

    email_body += generate_residence_info(post)
    email_body += generate_radio_name(post)
    email_body += "#{post.body}\n\n"
    email_body += generate_address_info(post)
    email_body += generate_contact_info(post)

    email_body
  end

  def generate_residence_info(post)
    if post.residence_prefecture.present? || post.residence_city.present?
      "在住: #{post.residence_prefecture}#{post.residence_city}\n"
    else
      ''
    end
  end

  def generate_radio_name(post)
    if post.radio_name.present?
      "RN: #{post.radio_name}\n\n"
    else
      ''
    end
  end

  def generate_address_info(post)
    address_info = ''

    if post.zip_code.present?
      address_info += "郵便番号: #{post.zip_code}\n"
    end

    if post.prefecture.present? || post.city.present? || post.other_address.present?
      address_info += "住所: #{post.prefecture}#{post.city}#{post.other_address}\n"
    end

    address_info
  end

  def generate_contact_info(post)
    contact_info = ''

    if post.phone.present?
      contact_info += "電話番号: #{post.phone}\n"
    end

    if post.legal_name.present?
      contact_info += "名前: #{post.legal_name}\n"
    end

    contact_info
  end
end
