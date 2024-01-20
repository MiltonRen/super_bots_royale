module Gptable
  extend ActiveSupport::Concern

  def gpt_response(message)
    messages = [{role: "system", content: message}]

    response = OpenAI::Client.new.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: messages,
        temperature: 1.0,
        n: 1,
      }
    )

    response.dig("choices").first.dig("message", "content")
  end
end
