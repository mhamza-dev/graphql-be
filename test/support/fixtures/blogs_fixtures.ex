defmodule Community.BlogsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Community.Blogs` context.
  """

  alias Community.AccountsFixtures
  alias Community.Repo

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        text: "some text",
        user_id: AccountsFixtures.user_fixture().id
      })
      |> Community.Blogs.create_post()

    post
    |> Repo.preload(:user)
  end
end
