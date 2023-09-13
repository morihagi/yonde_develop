module ApplicationHelper
  def sidebar_link_to(path, emoji, text)
    classes = %w[my-1 nav-link text-white]
    classes << 'active' if current_page?(path)

    link_to(path, class: classes) do
      tag.span(class: 'me-2') { emoji } + tag.span { text }
    end
  end

  def icon(icon_name)
    tag.i(class: ['bi', "bi-#{icon_name}"])
  end

  def turbo_stream_flash
    turbo_stream.update 'flashes', partial: 'flash'
  end

  def bootstrap_alert(key)
    case key
    when 'notice'
      'success'
    when 'alert'
      'warning'
    when 'error'
      'danger'
    end
  end

  def turbo_stream_flash
    turbo_stream.append "flashes", partial: "flash"
  end

  def page_title(page_title = '')
    base_title = 'YONDE'

    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def modals
    [
      { 'target' => '#termsModal', 'title' => t('modals.terms.title'), 'type' => 'terms' },
      { 'target' => '#privacyPolicyModal', 'title' => t('modals.privacy_policy.title'), 'type' => 'privacy_policy' },
      { 'target' => '#developerModal', 'title' => t('modals.developer.title'), 'type' => 'developer' },
      { 'target' => '#contactModal', 'title' => t('modals.contact.title'), 'type' => 'contact' }
    ]
  end
end
