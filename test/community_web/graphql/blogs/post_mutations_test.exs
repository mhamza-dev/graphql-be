defmodule CommunityWeb.GraphQl.Blog.PostMutationTest do
  use CommunityWeb.GraphQlCase

  import Community.AccountsFixtures
  import Community.BlogsFixtures

  describe "create_post" do
    @create_post """
    mutation($input: CreatePostInput!) {
      createPost(input: $input) {
        id
        text
        user {
          id
          email
        }
      }
    }
    """

    test "creates post when input is valid" do
      user = user_fixture()

      variables = %{
        "input" => %{
          "text" => "valid text",
          "body" => "valid body",
          "userId" => user.id
        }
      }

      assert %{
               "data" => %{
                 "createPost" => %{
                   "id" => _,
                   "text" => "valid text",
                   "user" => %{
                     "id" => user_id,
                     "email" => user_email
                   }
                 }
               }
             } =
               gql_post(%{
                 query: @create_post,
                 variables: variables
               })

      assert to_string(user.id) == user_id
      assert user.email == user_email
    end

    test "returns error when input is invalid" do
      user = user_fixture()

      variables = %{
        "input" => %{
          "text" => "bad",
          "body" => "valid body",
          "userId" => user.id
        }
      }

      assert %{
               "data" => %{"createPost" => nil},
               "errors" => [
                 %{
                   "message" => "should be at least 4 character(s)",
                   "details" => %{"field" => ["text"]}
                 }
               ]
             } =
               gql_post(%{
                 query: @create_post,
                 variables: variables
               })
    end
  end

  describe "update_post" do
    @update_post """
    mutation($input: UpdatePostInput!) {
      updatePost(input: $input) {
        id
        text
        user {
          id
          email
        }
      }
    }
    """

    test "updates post when input is valid" do
      post = post_fixture()

      variables = %{
        "input" => %{
          "id" => post.id,
          "text" => "updated text",
          "body" => "updated body"
        }
      }

      assert %{
               "data" => %{
                 "updatePost" => %{
                   "id" => id,
                   "text" => "updated text",
                   "user" => %{
                     "id" => _user_id,
                     "email" => _user_email
                   }
                 }
               }
             } =
               gql_post(%{
                 query: @update_post,
                 variables: variables
               })

      assert to_string(post.id) == id
    end

    test "returns error when input is invalid" do
      post = post_fixture()

      variables = %{
        "input" => %{
          "id" => post.id,
          "text" => "bad",
          "body" => "updated body"
        }
      }

      assert %{
               "data" => %{"updatePost" => nil},
               "errors" => [
                 %{
                   "message" => "should be at least 4 character(s)",
                   "details" => %{"field" => ["text"]}
                 }
               ]
             } =
               gql_post(%{
                 query: @update_post,
                 variables: variables
               })
    end
  end
end
