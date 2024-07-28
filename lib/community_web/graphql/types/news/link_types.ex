defmodule CommunityWeb.Graphql.Types.News.LinkTypes do
  use Absinthe.Schema.Notation

  object :link do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :description, non_null(:string)
  end
end
