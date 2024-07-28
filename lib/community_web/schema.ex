defmodule CommunityWeb.Schema do
  use Absinthe.Schema
  alias CommunityWeb.Graphql.Middlewares.HandleChangesetErrors, as: HCE

  import_types CommunityWeb.Graphql.Operations.Types
  import_types CommunityWeb.Graphql.Operations.Queries
  import_types CommunityWeb.Graphql.Operations.Mutations
  import_types CommunityWeb.Graphql.Operations.Subscriptions

  query do
    import_fields :post_queries
    import_fields :user_queries
    import_fields :link_queries
  end

  mutation do
    import_fields :post_mutations
    import_fields :user_mutations
    import_fields :link_mutations
  end

  subscription do
    import_fields :post_subscriptions
  end

  def middleware(middleware, _field, %{identifier: :mutation}) do
    middleware ++ [HCE]
  end

  def middleware(middleware, _field, _object) do
    middleware
  end
end
