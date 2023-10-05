require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#sidebar_link_to' do
    it 'returns a sidebar link with active class if the current page matches the path' do
      allow(helper).to receive(:current_page?).with('/posts').and_return(true)
      link = helper.sidebar_link_to('/posts', '📮', '投稿メール一覧')
      expect(link).to have_css('a.active')
    end

    it 'returns a sidebar link without active class if the current page does not match the path' do
      allow(helper).to receive(:current_page?).with('/profile').and_return(false)
      link = helper.sidebar_link_to('/profile', '🎧', 'リスナー情報')
      expect(link).not_to have_css('a.active')
    end
  end

  describe '#bootstrap_alert' do
    it 'returns the corresponding Bootstrap alert class for a given key' do
      expect(helper.bootstrap_alert('notice')).to eq('success')
      expect(helper.bootstrap_alert('alert')).to eq('warning')
      expect(helper.bootstrap_alert('error')).to eq('danger')
    end
  end

  describe '#page_title' do
    it 'returns the page title with the base title and explanation' do
      expect(helper.page_title('マイページ')).to eq('マイページ | YONDE')
    end

    it 'returns the base title with explanation if no page title is provided' do
      expect(helper.page_title).to eq('YONDE')
    end
  end

  describe '#modals' do
    it 'returns an array of modal details' do
      modals = helper.modals
      expect(modals).to be_an(Array)
      expect(modals.first).to be_a(Hash)
      expect(modals.first.keys).to contain_exactly('target', 'title', 'type')
    end
  end

  describe '#flash_message_details' do
    it 'returns details for the "notice" flash message' do
      details = helper.flash_message_details('notice')
      expect(details).to eq(['bg-success-subtle', 'text-success', '✅', 'Success'])
    end

    it 'returns details for the "error" flash message' do
      details = helper.flash_message_details('error')
      expect(details).to eq(['bg-danger-subtle', 'text-danger', '🚨', 'Error'])
    end

    it 'returns details for an unknown flash message type' do
      details = helper.flash_message_details('unknown')
      expect(details).to eq(['bg-warning-subtle', 'text-warning', '💡', 'Hint'])
    end
  end
end
