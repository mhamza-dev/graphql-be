defmodule CommunityWeb.Graphql.Resolvers.Blogs.PostResolvers do
  alias Community.Blogs
  alias Community.Blogs.Post

  def all_posts(_args, _info) do
    {:ok, Blogs.list_posts()}
  end

  def get_post(%{id: id}, _info) do
    with %Post{} = post <- Blogs.get_post(id) do
      {:ok, post}
    else
      _ ->
        {:error, "Post Not Found by this ID"}
    end
  end

  def create_post(%{input: args}, _info) do
    case Blogs.create_post(args) do
      {:ok, post} ->
        {:ok, post}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def update_post(%{input: %{id: id} = args}, _info) do
    with %Post{} = post <- Blogs.get_post(id),
         {:ok, post} <- Blogs.update_post(post, Map.drop(args, [:id])) do
      {:ok, post}
    else
      nil ->
        {:error, "Post Not Found by this ID"}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def delete_post(%{id: id}, _info) do
    with %Post{} = post <- Blogs.get_post(id),
         {:ok, post} <- Blogs.delete_post(post) do
      {:ok, post}
    else
      nil ->
        {:error, "Post Not Found by this ID"}
    end
  end
end
