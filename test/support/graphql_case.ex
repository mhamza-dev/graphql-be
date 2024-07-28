defmodule CommunityWeb.GraphQlCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use CommunityWeb.ConnCase

      import CommunityWeb.GraphQlHelpers
    end
  end
end
