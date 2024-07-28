defmodule CommunityWeb.Graphql.Resolvers.Accounts.UserResolvers do
  alias Community.Accounts, as: A
  alias Community.Accounts.User, as: User

  def all_users(_args, _info) do
    {:ok, A.list_users()}
  end

  def get_user(%{id: id}, _info) do
    case A.get_user(id) do
      nil ->
        {:error, "User ID: #{id} not found."}

      user ->
        {:ok, user}
    end
  end

  def get_user(%{user_id: user_id}, _args, _resolution) do
    {:ok, A.get_user(user_id)}
  end

  def create_user(%{input: args}, _info) do
    case A.create_user(args) do
      {:ok, user} ->
        {:ok, user}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def update_user(%{input: %{id: id} = args}, _info) do
    with %User{} = user <- A.get_user!(id), {:ok, user} <- A.update_user(user, args) do
      {:ok, user}
    else
      nil ->
        {:error, "User ID: #{id} not found."}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def delete_user(%{id: id}, _info) do
    with {:ok, post} <- A.delete_user(id) do
      {:ok, post}
    else
      _ -> {:error, "Failed to delete tag"}
    end
  end
end
