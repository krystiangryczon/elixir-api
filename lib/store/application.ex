defmodule Store.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Store.Worker.start_link(arg)
      # {Store.Worker, arg}
      Store.Repo,
      {Plug.Cowboy, scheme: :http, plug: Store.Router, port: 8080}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Store.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
