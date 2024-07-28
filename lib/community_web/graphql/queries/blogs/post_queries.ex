defmodule CommunityWeb.Graphql.Queries.Blogs.PostQueries do
  use Absinthe.Schema.Notation
  alias CommunityWeb.Graphql.Resolvers.Blogs.PostResolvers, as: PR

  object :post_queries do
    @desc """
     Get Post by ID
    """
    field :get_post, non_null(:post) do
      arg :id, non_null(:id)

      resolve &PR.get_post/2
    end

    @desc """
     List of all Posts
    """

    field :all_posts, list_of(:post) do
      resolve(&PR.all_posts/2)
    end
  end
end
