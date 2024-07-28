defmodule CommunityWeb.Graphql.Types.Blogs.PostTypes do
  use Absinthe.Schema.Notation

  alias CommunityWeb.Graphql.Resolvers.Accounts.UserResolvers, as: UR

  object :post do
    field :id, non_null(:id)
    field :text, non_null(:string)
    field :body, non_null(:string)
    field :user, :user, resolve: &UR.get_user/3
  end
end
