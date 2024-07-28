defmodule CommunityWeb.Graphql.Queries.News.LinkQueries do
  use Absinthe.Schema.Notation
  alias CommunityWeb.Graphql.Resolvers.News.LinkResolvers, as: LR

  object :link_queries do
    @desc """
     List of all Links
    """

    field :all_links, list_of(:link) do
      resolve(&LR.all_links/2)
    end

    @desc """
     Get Link by ID
    """

    field :get_link, :link do
      arg :id, non_null(:id)
      resolve(&LR.get_link/2)
    end
  end
end
