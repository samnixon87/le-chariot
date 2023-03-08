class Openai < ApplicationRecord
  response = client.chat(
    parameters: {
      model: "gpt-3.5-turbo", # Required.
      messages: [{ role: "user", content: "Hello!"}], # Required.
      temperature: 0.7,
    })
  puts response.dig("choices", 0, "message", "content")
  # => "Hello! How may I assist you today?"
end
