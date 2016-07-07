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

Habitus.Repo.insert!(User.changeset %User{}, %{
    display_name: "crodeheaver",
    first_name: "Colby",
    last_name: "Rodeheaver",
    email: "carodeheaver@gmail.com",
    password: "notagoodpassword",
    password_confirmation: "notagoodpassword"
  })

Habitus.Repo.insert!(User.changeset %User{}, %{
    display_name: "nbland",
    first_name: "Nathan",
    last_name: "Bland",
    email: "nbland@gmail.com",
    password: "notagoodpassword",
    password_confirmation: "notagoodpassword"
  })
  
Habitus.Repo.insert!(User.changeset %User{}, %{
    display_name: "kwade",
    first_name: "Keith",
    last_name: "Wade",
    email: "kwade@gmail.com",
    password: "notagoodpassword",
    password_confirmation: "notagoodpassword"
  })


Habitus.Repo.insert!(%Page{
    title: "About Me",
    content: "This is a new Page",
    alias: "about-me",
    user_id: 1
  })
Habitus.Repo.insert!(%Page{
    title: "Contact Me",
    content: "This is a new Page",
    alias: "contact-me",
    user_id: 1
  })
Habitus.Repo.insert!(%Page{
    title: "Checking to See If Nathan Reads These",
    content: "This is a new Page",
    alias: "checking-to-see-if-nathan-reads-these",
    user_id: 1
  })
Habitus.Repo.insert!(%Page{
    title: "My Name is Nathan",
    content: "This is a new Page",
    alias: "my-name-is-nathan",
    user_id: 2
  })
Habitus.Repo.insert!(%Page{
    title: "And I'm Awesome",
    content: "This is a new Page",
    alias: "and-im-awesome",
    user_id: 2
  })
Habitus.Repo.insert!(%Page{
    title: "The Keifer",
    content: "This is a new Page",
    alias: "the-keifer",
    user_id: 3
  })
  
Habitus.Repo.insert!(%Tag{
    content: "new stuff",
    page_id: 1
  })
Habitus.Repo.insert!(%Tag{
    content: "new stuff",
    page_id: 2
  }
Habitus.Repo.insert!(%Tag{
    content: "new stuff",
    page_id: 3
  })
Habitus.Repo.insert!(%Tag{
    content: "new stuff",
    page_id: 4
  })
Habitus.Repo.insert!(%Tag{
    content: "new stuff",
    page_id: 5
  })
Habitus.Repo.insert!(%Tag{
    content: "new stuff",
    page_id: 6
  })