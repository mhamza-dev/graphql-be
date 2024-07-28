defmodule CommunityWeb.Graphql.Resolvers.News.LinkResolvers do
  alias Community.News
  alias Community.News.Link

  def all_links(_args, _info) do
    {:ok, News.list_links()}
  end

  def get_link(%{id: id}, _info) do
    {:ok, News.get_link!(id)}
  end

  def create_link(args, _info) do
    case News.create_link(args) do
      {:ok, link} ->
        {:ok, link}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def update_link(%{id: id} = args, _info) do
    with %Link{} = link <- News.get_link!(id),
         {:ok, link} <- News.update_link(link, Map.drop(args, [:id])) do
      {:ok, link}
    else
      nil ->
        {:error, "Link Not Found by this ID"}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def delete_link(%{id: id}, _info) do
    with %Link{} = link <- News.get_link!(id),
         {:ok, link} <- News.delete_link(link) do
      {:ok, link}
    else
      nil ->
        {:error, "Link Not Found by this ID"}
    end
  end
end
