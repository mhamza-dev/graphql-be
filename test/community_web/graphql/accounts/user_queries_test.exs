defmodule CommunityWeb.GraphQl.Accounts.UserQueriesTest do
  use CommunityWeb.GraphQlCase

  import Community.AccountsFixtures

  describe "get_user" do
    @get_user """
    query($id: ID!) {
      getUser(id: $id) {
        id
        email
        full_name
      }
    }
    """

    test "returns user when found" do
      user = user_fixture()

      assert %{
               "data" => %{
                 "getUser" => %{
                   "id" => to_string(user.id),
                   "email" => user.email,
                   "full_name" => user.full_name
                 }
               }
             } ==
               gql_post(%{
                 query: @get_user,
                 variables: %{"id" => user.id}
               })
    end

    test "returns 'not_found' error when missing" do
      assert %{
               "data" => %{"getUser" => nil},
               "errors" => [%{"message" => "User ID: -1 not found."}]
             } =
               gql_post(%{
                 query: @get_user,
                 variables: %{"id" => -1}
               })
    end
  end
end
