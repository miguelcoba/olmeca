# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Olmeca.Repo.insert!(%Olmeca.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# admin user
admin = Olmeca.Repo.insert!(%Olmeca.User{name: "admin", email: "admin@olmeca", is_admin: true})
# attrs = %{provider: "identity", token: Comeonin.Bcrypt.hashpwsalt("secret")}
attrs = %{provider: "identity", uid: "admin@olmeca", token: "$2b$12$UStWApVQH0BtJSq6y4vaQefsPc7O/R2xgXgRAISbMy7LbjdLfaI4y"}
authorizations = Ecto.build_assoc(admin, :authorizations, attrs)
Olmeca.Repo.insert!(authorizations)