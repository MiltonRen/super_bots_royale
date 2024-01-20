# README

rails new super_bots_royale --database=postgresql --css=tailwind --javascript=esbuild

rails g scaffold Arena name:string concluded:boolean

rails g scaffold Bot name:string element:string description:string move_name:string catchphrase:string catchphrase_lose:string attack:integer defense:integer speed:integer

rails g migration add_eden_stuff_to_bots image_task_id:string image_link:string
rails g migration add_fun_stats_to_bots luck:integer unicycle:integer

rails g model Participation bot:references arena:references item_holding:string is_alive:boolean is_winner:boolean

rails g migration add_started_to_arenas started:boolean

TODO:

rails g model Tile arena:references item:string
rails g migration add_tile_to_participations tile:references
