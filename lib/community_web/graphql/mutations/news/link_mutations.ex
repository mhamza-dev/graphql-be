defmodule CommunityWeb.Graphql.Mutations.News.LinkMutations do
  use Absinthe.Schema.Notation

  alias CommunityWeb.Graphql.Resolvers.News.LinkResolvers, as: LR

  object :link_mutations do
    @desc "Create a new link"
    field :create_link, :link do
      arg :url, non_null(:string)
      arg :description, non_null(:string)

      resolve &LR.create_link/2
    end

    @desc "update the link"
    field :update_link, :link do
      arg :id, non_null(:id)
      arg :url, :string
      arg :description, :string

      resolve &LR.update_link/2
    end

    @desc "delete the link"
    field :delete_link, :link do
      arg :id, non_null(:id)

      resolve &LR.delete_link/2
    end
  end
end
