# README

rails new super_bots_royale --database=postgresql --css=tailwind --javascript=esbuild

rails g scaffold Arena name:string concluded:boolean

rails g scaffold Bot name:string element:string description:string move_name:string catchphrase:string catchphrase_lose:string attack:integer defense:integer speed:integer

rails g migration BotArena bot:references arena:references tile:references item:string alive:boolean winner:boolean

rails g migration Tile arena:references item:string

