class EdenClient < ApplicationClient
  ApplicationClient::Response::PARSER["application/json"] = ->(response) { JSON.parse(response.body, object_class: nil) }

  EDEN_KEY = Rails.application.credentials.dig(:eden, :key)
  EDEN_SECRET = Rails.application.credentials.dig(:eden, :secret)
  CONCEPT_ID = "65ab6d1cd5a89a5e71a61f56".freeze

  def authorization_header
    { "X-Api-Key" => EDEN_KEY, "X-Api-Secret" => EDEN_SECRET }
  end

  def create_with_concept(prompt)
    response = post "https://api.eden.art/tasks/create", body: <<~BODY
      {
        "generatorName": "create",
        "config": {
          "text_input": "#{prompt}",
          "lora": "#{CONCEPT_ID}"
        }
      }
    BODY

    (response.code == "200") ? response.parsed_body.dig("taskId") : nil
  end

  def getImage(task_id)
    response = get "https://api.eden.art/tasks/#{task_id}"
    if response.parsed_body.dig("task", "status") == "completed"
      response.parsed_body.dig("task", "creation", "thumbnail")
    end
  end
end
