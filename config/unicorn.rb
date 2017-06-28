worker_processes 2
working_directory "/home/anime/anime_report2/current" #appと同じ階層を指定

timeout 3600


listen "/var/run/unicorn/anime_report2.sock"
pid "/var/run/unicorn/anime_report2.pid"


stderr_path "/home/anime/anime_report2/current/log/unicorn.log"
stdout_path "/home/anime/anime_report2/current/log/unicorn.log"


preload_app true