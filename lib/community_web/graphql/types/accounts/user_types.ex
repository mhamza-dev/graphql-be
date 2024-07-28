defmodule CommunityWeb.Graphql.Types.Accounts.UserTypes do
  use Absinthe.Schema.Notation

  object :user do
    field :id, non_null(:id)
    field :full_name, non_null(:string)
    field :email, non_null(:string)
  end

  object :user_post do
    field :id, non_null(:id)
    field :full_name, non_null(:string)
    field :email, non_null(:string)
    field :posts, list_of(:post)
  end
end
