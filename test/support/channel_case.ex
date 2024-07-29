defmodule CommunityWeb.ChannelCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with channels
      import Phoenix.ChannelTest
      import CommunityWeb.ChannelCase

      # The default endpoint for testing
      @endpoint CommunityWeb.Endpoint
    end
  end

  setup tags do
    Community.DataCase.setup_sandbox(tags)
    :ok
  end
end
