defmodule CommunityWeb.GraphQl.Accounts.UserMutationTest do
  use CommunityWeb.GraphQlCase

  import Community.AccountsFixtures

  describe "create_user" do
    @create_user """
    mutation($input: CreateUserInput!) {
      createUser(input: $input) {
        id
        email
        fullName
      }
    }
    """

    test "creates user when input is valid" do
      variables = %{
        "input" => %{
          "email" => "dummy@example.com",
          "full_name" => "Dummy User"
        }
      }

      assert %{
               "data" => %{
                 "createUser" => %{
                   "id" => _,
                   "email" => email,
                   "fullName" => full_name
                 }
               }
             } =
               gql_post(%{
                 query: @create_user,
                 variables: variables
               })

      assert "Dummy User" == full_name
      assert "dummy@example.com" == email
    end

    test "returns error when input is invalid" do
      variables = %{
        "input" => %{
          "email" => "dummy@example.com",
          "full_name" => "No"
        }
      }

      assert %{
               "data" => %{"createUser" => nil},
               "errors" => [
                 %{
                   "message" => "should be at least 3 character(s)",
                   "details" => %{"field" => ["full_name"]}
                 }
               ]
             } =
               gql_post(%{
                 query: @create_user,
                 variables: variables
               })
    end
  end

  describe "update_user" do
    @update_user """
    mutation($input: UpdateUserInput!) {
      updateUser(input: $input) {
        id
        email
        fullName
      }
    }
    """

    test "updates user when input is valid" do
      user = user_fixture()

      variables = %{
        "input" => %{
          "id" => user.id,
          "full_name" => "Updated User"
        }
      }

      assert %{
               "data" => %{
                 "updateUser" => %{
                   "id" => id,
                   "email" => email,
                   "fullName" => full_name
                 }
               }
             } =
               gql_post(%{
                 query: @update_user,
                 variables: variables
               })

      assert "Updated User" == full_name
      assert user.email == email
      assert to_string(user.id) == id
    end

    test "returns error when input is invalid" do
      user = user_fixture()

      variables = %{
        "input" => %{
          "id" => user.id,
          "full_name" => "No"
        }
      }

      assert %{
               "data" => %{"updateUser" => nil},
               "errors" => [
                 %{
                   "message" => "should be at least 3 character(s)",
                   "details" => %{"field" => ["full_name"]}
                 }
               ]
             } =
               gql_post(%{
                 query: @update_user,
                 variables: variables
               })
    end
  end
end
