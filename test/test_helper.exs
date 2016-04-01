ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Trello.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Trello.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Trello.Repo)

