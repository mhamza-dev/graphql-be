# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Community.Repo.insert!(%Community.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Community.News.Link
alias Community.Accounts.User
alias Community.Blogs.Post
alias Community.Repo

links = [
  %Link{url: "http://graphql.org/", description: "The Best Query Language"},
  %Link{url: "http://dev.apollodata.com/", description: "Awesome GraphQL Client"}
]

users = [
  %User{full_name: "Hamza Rehmani", email: "hamza.rehmani@invozone.dev"},
  %User{full_name: "Faizan Anwar", email: "faizan.anwar@invozone.dev"},
  %User{full_name: "Usama Asghar", email: "usama.asghar@invozone.dev"}
]

posts = [
  %Post{
    text: "Understanding Elixir Pattern Matching",
    body:
      "Pattern matching is a powerful feature in Elixir that allows you to destructure data and match specific patterns. It is used extensively in function definitions, case expressions, and more."
  },
  %Post{
    text: "Getting Started with Phoenix Framework",
    body:
      "Phoenix is a web development framework written in Elixir. It is known for its high performance and productivity, and it provides a great toolset for building scalable web applications."
  },
  %Post{
    text: "An Introduction to GraphQL",
    body:
      "GraphQL is a query language for APIs and a runtime for executing those queries. It allows clients to request exactly the data they need and nothing more, making it more efficient than traditional REST APIs."
  },
  %Post{
    text: "Building Real-Time Applications with LiveView",
    body:
      "LiveView is a library for Phoenix that allows you to build real-time, interactive web applications without writing JavaScript. It leverages the power of Elixir and the Phoenix framework to handle real-time updates over WebSockets."
  },
  %Post{
    text: "Concurrent Programming in Elixir",
    body:
      "Elixir provides robust tools for concurrent programming, thanks to the Erlang VM. This post explores how to leverage processes, message passing, and OTP to build highly concurrent applications."
  }
]

Enum.each(links, fn link ->
  Repo.insert!(link)
end)

users_ids =
  Enum.map(
    users,
    fn user ->
      user = Repo.insert!(user)
      user.id
    end
  )

Enum.each(posts, fn post ->
  Repo.insert!(Map.put(post, :user_id, Enum.random(users_ids)))
end)
