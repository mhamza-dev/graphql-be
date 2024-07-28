defmodule CommunityWeb.Graphql.Mutations.Blogs.PostMutations do
  use Absinthe.Schema.Notation

  alias CommunityWeb.Graphql.Resolvers.Blogs.PostResolvers, as: PR

  input_object :create_post_input do
    field :text, non_null(:string)
    field :body, non_null(:string)
    field :user_id, non_null(:id)
  end

  input_object :update_post_input do
    field :id, non_null(:id)
    field :text, :string
    field :body, :string
    field :user_id, :id
  end

  object :post_mutations do
    @desc "Create a new post"
    field :create_post, :post do
      arg :input, :create_post_input
      resolve &PR.create_post/2
    end

    @desc "update the post"
    field :update_post, :post do
      arg :input, :update_post_input
      resolve &PR.update_post/2
    end

    @desc "delete the post"
    field :delete_post, :post do
      arg :id, non_null(:id)
      resolve &PR.delete_post/2
    end
  end
end
