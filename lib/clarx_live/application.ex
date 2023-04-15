defmodule ClarxLive.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ClarxLiveWeb.Telemetry,
      # Start the Ecto repository
      ClarxLive.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ClarxLive.PubSub},
      # Start Finch
      {Finch, name: ClarxLive.Finch},
      # Start the Endpoint (http/https)
      ClarxLiveWeb.Endpoint
      # Start a worker by calling: ClarxLive.Worker.start_link(arg)
      # {ClarxLive.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ClarxLive.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ClarxLiveWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
