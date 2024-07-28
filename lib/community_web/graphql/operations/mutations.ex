defmodule CommunityWeb.Graphql.Operations.Mutations do
  use Absinthe.Schema.Notation

  import_types CommunityWeb.Graphql.Mutations.News.LinkMutations
  import_types CommunityWeb.Graphql.Mutations.Accounts.UserMutations
  import_types CommunityWeb.Graphql.Mutations.Blogs.PostMutations
end
