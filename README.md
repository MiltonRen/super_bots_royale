# README

rails new super_bots_royale --database=postgresql --css=tailwind --javascript=esbuild

rails g scaffold Arena name:string concluded:boolean

rails g scaffold Bot name:string element:string description:string move_name:string catchphrase:string catchphrase_lose:string attack:integer defense:integer speed:integer

rails g migration add_eden_stuff_to_bots image_task_id:string image_link:string

rails g migration add_fun_stats_to_bots luck:integer unicycle:integer

rails g model Participation bot:references arena:references item_holding:string is_alive:boolean is_winner:boolean

rails g migration add_started_to_arenas started:boolean

rails g model Tile arena:references item:string

rails g migration add_tile_to_participations tile:references

rails g migration add_number_to_tiles number:integer

rails g model BattleLog arena:references bot:references message:string

rails g migration add_stats_to_participation attack:integer defense:integer speed:integer luck:integer unicycle:integer

rails g migration make_battle_log_bot_empty_ok

rails g migration add_bg_to_tiles bg:string


CONTROLLER GOOD

  # BEGIN OF JOB
  def perform
    # @arena = Arena.find(arena_id)
    @participations = @arena.participations.where(is_alive: true).includes(:bot)
    @tiles = @arena.tiles

    @winners = []
    @tiles.each do |tile|
      opponents = @participations.filter {|p| p.tile == tile}
      if opponents.size > 1
        @winners << fight_to_the_last_one_standing(opponents)
      elsif opponents.first.present?
        @winners << opponents.first
      end
    end

    if @arena.battle_logs.count > 0 && @arena.battle_logs.count % 20 == 0 && @winners.count > 1
      lucky_ones = @winners.sample(2)
      bot_1 = lucky_ones.first.bot
      bot_2 = lucky_ones.second.bot

      broadcast(nil, "💣Sudden Duel! 🔥 #{bot_1.name} vs #{bot_2.name} 🔥")
      duel_winner = fight_to_the_last_one_standing(lucky_ones)
      loser = lucky_ones.detect {|p| p != duel_winner}
      @winners.reject {|p| p == loser}
    end

    if @winners.size == 1
      conclude_game(@winners.first)
      return
    end

    @winners.each do |participation|
      next_tile_number = participation.tile.neighbors.sample
      next_tile = @tiles.detect{|t| t.number == next_tile_number}
      participation.update!(tile: next_tile)
    end
    broadcast(nil, "End of turn! All alive bots moved one block")

    @winners.each do |participation|
      pickup = participation.tile.item
      if pickup.present?
        participation.tile.update!(item: nil)
        line = ""

        case pickup
        when "🍊"
          participation.update!(item_holding: pickup, defense: participation.defense + 100)
          line = "Defense + 100"
        when "🍌"
          participation.update!(item_holding: pickup, speed: participation.speed + 100)
          line = "Speed + 100"
        when "🔫"
          participation.update!(item_holding: pickup, attack: participation.attack + 100)
          line = "Attack + 100"
        when "🍄"
          participation.update!(item_holding: pickup, unicycle: participation.unicycle + 100)
          line = "Unicycle + 100"
        when "💰"
          participation.update!(item_holding: pickup, luck: participation.luck + 100)
          line = "Luck + 100"
        when "🎸"
          participation.update!(item_holding: pickup, defense: participation.defense + 50, speed: participation.speed + 50, attack: participation.attack + 50, unicycle: participation.unicycle + 50, luck: participation.luck + 50)
          line = "All Stats + 50"
        end

        broadcast(participation.bot, "I got #{pickup}! #{line}")
      end
    end
  end

  def fight_to_the_last_one_standing(participations)
    participations.each do |participation|
      bot = participation.bot
      bot_total_power = participation.additional_power + bot.power
      opponent_part = participations.excluding(participation).sample
      opponent = opponent_part.bot
      opponent_total_power = opponent_part.additional_power + opponent.power
      item_line = participation.item_holding.present? ? " The bot is holding item #{participation.item_holding}." : ""
      message = gpt_response("Come up with a Pokemon style one-line battle upodate for bot: #{bot.name}, which uses move: #{bot.move_name}. The total power of this bot is #{bot_total_power}, and the total power of the opponent is #{opponent_total_power}. The element of the bot is #{bot.element}, and the element of the opponent is #{opponent.element}.#{item_line} Produce some wacky words!")
      broadcast(participation.bot, message)
    end

    winner = participations.first
    highest_power = winner.additional_power + winner.bot.power
    participations.each do |participation|
      participation_power = participation.additional_power + participation.bot.power
      if participation_power > highest_power
        if rand(1..100) <= 90
          winner = participation
          highest_power = participation_power
        end
      end
    end

    participations.each do |participation|
      unless participation == winner
        participation.update!(is_alive: false)
        broadcast(participation.bot, "#{participation.bot.catchphrase_lose} -- I'm ded :(")
      end
    end

    broadcast(winner.bot, "#{winner.bot.catchphrase} -- Beat 'em all!")
    return winner
  end

  def conclude_game(participation)
    participation.update!(is_winner: true)
    @arena.update!(concluded: true)
    broadcast(nil, "The last bot standing -- #{participation.bot.name} won the game!")
    broadcast(participation.bot, participation.bot.catchphrase)
  end

  def broadcast(bot, message)
    BattleLog.create!(arena: @arena, bot: bot, message: message)
    @arena.broadcast_update
    sleep 0.5
  end

  # END OF JOB
  