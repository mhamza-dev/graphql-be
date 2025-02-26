defmodule Community.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CommunityWeb.Telemetry,
      Community.Repo,
      {DNSCluster, query: Application.get_env(:community, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Community.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Community.Finch},
      # Start a worker by calling: Community.Worker.start_link(arg)
      # {Community.Worker, arg},
      # Start to serve requests, typically the last entry
      CommunityWeb.Endpoint,
      {Absinthe.Subscription, CommunityWeb.Endpoint}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Community.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CommunityWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
