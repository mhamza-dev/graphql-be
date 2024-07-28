defmodule CommunityWeb.Graphql.Operations.Subscriptions do
  use Absinthe.Schema.Notation

  import_types CommunityWeb.Graphql.Subscriptions.Blogs.PostSubscriptions
end
