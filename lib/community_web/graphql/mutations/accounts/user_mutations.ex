defmodule CommunityWeb.Graphql.Mutations.Accounts.UserMutations do
  use Absinthe.Schema.Notation

  alias CommunityWeb.Graphql.Resolvers.Accounts.UserResolvers, as: UR

  input_object :create_user_input do
    field :email, non_null(:string)
    field :full_name, non_null(:string)
  end

  input_object :update_user_input do
    field :id, non_null(:id)
    field :email, :string
    field :full_name, :string
  end

  object :user_mutations do
    @desc "Create a new user"
    field :create_user, :user do
      arg :input, :create_user_input

      resolve &UR.create_user/2
    end

    @desc "Update the user"
    field :update_user, :user do
      arg :input, :update_user_input

      resolve &UR.update_user/2
    end

    @desc "delete the user"
    field :delete_user, :user do
      arg :id, non_null(:id)
      resolve &UR.delete_user/2
    end
  end
end
