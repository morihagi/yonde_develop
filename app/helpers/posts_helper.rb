module PostsHelper
  def post_status_badge(post)
    status_classes = {
      'draft' => 'badge text-bg-secondary',
      'gmail_draft' => 'badge text-bg-success',
      'gmail_sent' => 'badge text-bg-warning',
      'archived' => 'badge bg-white text-red border '
    }

    status_class = status_classes[post.post_status]
    content_tag(:div, post.post_status_text, class: status_class) if status_class
  end
end
