defmodule CommunityWeb.Graphql.Queries.Accounts.UserQueries do
  use Absinthe.Schema.Notation
  alias CommunityWeb.Graphql.Resolvers.Accounts.UserResolvers, as: UR

  object :user_queries do
    @desc """
      Fetch list of all Users
    """
    field :all_users, list_of(:user) do
      resolve(&UR.all_users/2)
    end

    @desc """
     Get User and It's related Post by ID
    """

    field :get_user, :user_post do
      arg :id, non_null(:id)
      resolve(&UR.get_user/2)
    end
  end
end
