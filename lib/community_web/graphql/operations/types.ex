defmodule CommunityWeb.Graphql.Operations.Types do
  use Absinthe.Schema.Notation

  import_types CommunityWeb.Graphql.Types.News.LinkTypes
  import_types CommunityWeb.Graphql.Types.Accounts.UserTypes
  import_types CommunityWeb.Graphql.Types.Blogs.PostTypes
end
