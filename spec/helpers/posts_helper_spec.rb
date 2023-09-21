require 'rails_helper'

RSpec.describe PostsHelper, type: :helper do
  describe '#post_status_badge' do
    it 'returns a badge for "draft" post status' do
      post = double(post_status: 'draft', post_status_text: 'Draft')
      badge = helper.post_status_badge(post)
      expect(badge).to include('badge text-bg-secondary')
      expect(badge).to include('Draft')
    end

    it 'returns a badge for "sent" post status' do
      post = double(post_status: 'sent', post_status_text: 'Sent')
      badge = helper.post_status_badge(post)
      expect(badge).to include('badge bg-white text-red border')
      expect(badge).to include('Sent')
    end

    it 'returns nil for an unknown post status' do
      post = double(post_status: 'unknown', post_status_text: 'Unknown')
      badge = helper.post_status_badge(post)
      expect(badge).to be_nil
    end
  end

  describe '#generate_email_body' do
    it 'generates the email body with all available information' do
      post = double(
        residence_prefecture: 'Tokyo',
        residence_city: 'Shinjuku',
        radio_name: 'My Radio',
        body: 'Post Body',
        zip_code: '123-4567',
        prefecture: 'Osaka',
        city: 'Namba',
        other_address: 'Address',
        phone: '123-456-7890',
        legal_name: 'John Doe'
      )

      expected_body = <<~BODY
        在住: TokyoShinjuku
        RN: My Radio

        Post Body

        郵便番号: 123-4567
        住所: OsakaNambaAddress
        電話番号: 123-456-7890
        名前: John Doe

      BODY

      email_body = helper.generate_email_body(post)
      expect(email_body).to eq(expected_body.strip + "\n")
    end

    it 'generates the email body with minimal information' do
      post = double(
        body: 'Post Body',
        residence_prefecture: nil,
        residence_city: nil,
        radio_name: nil,
        zip_code: nil,
        prefecture: nil,
        city: nil,
        other_address: nil,
        phone: nil,
        legal_name: nil
      )

      expected_body = 'Post Body'
      email_body = helper.generate_email_body(post)
      expect(email_body).to eq(expected_body + "\n\n")
    end
  end
end
