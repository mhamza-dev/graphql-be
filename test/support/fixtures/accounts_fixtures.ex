defmodule Community.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Community.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "test@example.com",
        full_name: "some full_name"
      })
      |> Community.Accounts.create_user()

    user
  end
end
