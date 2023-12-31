module ApplicationHelper
  def sidebar_link_to(path, emoji, text)
    classes = %w[my-1 nav-link text-white]
    classes << 'active' if current_page?(path)

    link_to(path, class: classes) do
      tag.span(class: 'me-2') { emoji } + tag.span { text }
    end
  end

  def bootstrap_alert(key)
    {
      'notice' => 'success',
      'alert' => 'warning',
      'error' => 'danger'
    }[key]
  end

  def page_title(page_title = '')
    base_title = 'YONDE'

    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def modals
    [
      { 'target' => '#termsModal', 'title' => t('modals.terms.title'), 'type' => 'terms' },
      { 'target' => '#privacyPolicyModal', 'title' => t('modals.privacy_policy.title'), 'type' => 'privacy_policy' },
      { 'target' => '#developerModal', 'title' => t('modals.developer.title'), 'type' => 'developer' },
      { 'target' => '#contactModal', 'title' => t('modals.contact.title'), 'type' => 'contact' }
    ]
  end

  def flash_message_details(message_type)
    case message_type
    when 'notice'
      ['bg-success-subtle', 'text-success', '✅', 'Success']
    when 'error'
      ['bg-danger-subtle', 'text-danger', '🚨', 'Error']
    else
      ['bg-warning-subtle', 'text-warning', '💡', 'Hint']
    end
  end
end
