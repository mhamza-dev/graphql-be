defmodule CommunityWeb.GraphQl.Blog.PostQueriesTest do
  use CommunityWeb.GraphQlCase

  import Community.BlogsFixtures

  describe "get_post" do
    @get_post """
    query($id: ID!) {
      getPost(id: $id) {
        id
        text
        body
      }
    }
    """

    test "returns post when found" do
      post = post_fixture()

      assert %{
               "data" => %{
                 "getPost" => %{
                   "id" => to_string(post.id),
                   "text" => post.text,
                   "body" => post.body
                 }
               }
             } ==
               gql_post(%{
                 query: @get_post,
                 variables: %{"id" => post.id}
               })
    end

    test "returns 'not_found' error when missing" do
      assert %{
               "data" => nil,
               "errors" => [%{"message" => "Post Not Found by this ID"}]
             } =
               gql_post(%{
                 query: @get_post,
                 variables: %{"id" => -1}
               })
    end
  end
end
