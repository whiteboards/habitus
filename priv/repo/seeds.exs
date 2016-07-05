# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Habitus.Repo.insert!(%Habitus.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Habitus.User
alias Habitus.Page
alias Habitus.Tag
alias Habtitus.Comment

Habitus.Repo.insert!(%User{
    display_name: "crodeheaver",
    first_name: "Colby",
    last_name: "Rodeheaver",
    email: "carodeheaver@gmail.com",
    encrypted_password: "notagoodpassword"
  })
  
  Habitus.Repo.insert!(%User{
    display_name: "nbland",
    first_name: "Nathan",
    last_name: "Bland",
    email: "nbland@gmail.com",
    encrypted_password: "notagoodpassword"
  })
  
  Habitus.Repo.insert!(%User{
    display_name: "kwade",
    first_name: "Keith",
    last_name: "Wade",
    email: "kwade@gmail.com",
    encrypted_password: "notagoodpassword"
  })


Habitus.Repo.insert!(%Page{
    title: "New Post",
    content: "This is a new Post",
    user_id: 1
  })
Habitus.Repo.insert!(%Page{
    title: "New Post",
    content: "This is a new Post",
    user_id: 1
  })
Habitus.Repo.insert!(%Page{
    title: "New Post",
    content: "This is a new Post",
    user_id: 1
  })
Habitus.Repo.insert!(%Page{
    title: "New Post",
    content: "This is a new Post",
    user_id: 2
  })
Habitus.Repo.insert!(%Page{
    title: "New Post",
    content: "This is a new Post",
    user_id: 2
  })
Habitus.Repo.insert!(%Page{
    title: "New Post",
    content: "This is a new Post",
    user_id: 3
  })