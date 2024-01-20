class GenerateImageJob < ApplicationJob
  queue_as :default

  def perform(bot_id)
    @bot = Bot.find(bot_id)
    task_id = EdenClient.new.create_with_concept(
      "Battle figure named #{@bot.name}; element #{@bot.element}; description: #{@bot.description}; Solid background with color of #{@bot.element}; 3D; MINIMALISTIC AND CUTE;"
    )
    @bot.update!(image_task_id: task_id)
  end
end
