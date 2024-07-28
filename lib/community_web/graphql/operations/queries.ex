defmodule CommunityWeb.Graphql.Operations.Queries do
  use Absinthe.Schema.Notation

  import_types CommunityWeb.Graphql.Queries.News.LinkQueries
  import_types CommunityWeb.Graphql.Queries.Accounts.UserQueries
  import_types CommunityWeb.Graphql.Queries.Blogs.PostQueries
end
