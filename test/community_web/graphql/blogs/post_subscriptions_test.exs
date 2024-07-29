defmodule CommunityWeb.GraphQl.Blog.PostSubscriptionsTest do
  use CommunityWeb.SubscriptionCase

  import Community.AccountsFixtures

  describe "post_created" do
    @create_post """
    mutation($input: CreatePostInput!) {
      createPost(input: $input) {
        id
        text
      }
    }
    """

    @post_created """
    subscription {
      postCreated {
        id
        text
      }
    }
    """

    test "returns post when created" do
      socket = create_socket()
      # Subscribe to a post creation
      subscription_id = subscribe(socket, @post_created)
      user = user_fixture()
      post_params = %{text: "valid title", body: "valid body", user_id: user.id}

      # Trigger the subscription by creating a post
      gql_post(%{
        query: @create_post,
        variables: %{"input" => post_params}
      })

      # Check if something has been pushed to the given subscription
      assert_push "subscription:data", %{result: result, subscriptionId: ^subscription_id}

      # Pattern match the result
      assert %{
               data: %{
                 "postCreated" => %{
                   "id" => _,
                   "text" => text
                 }
               }
             } = result

      assert post_params.text == text

      # Ensure that no other pushes were sent
      refute_push "subscription:data", %{}
    end
  end
end
