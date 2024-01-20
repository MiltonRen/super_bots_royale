unless Rails.env.test?
  OpenAI.configure do |config|
    config.access_token = Rails.application.credentials.dig(:openai, :access_token)
    config.organization_id = Rails.application.credentials.dig(:openai, :organization_id)
  end
end
