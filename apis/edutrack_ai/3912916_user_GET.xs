// Query all User records
query user verb=GET {
  api_group = "edutrack-ai"

  input {
  }

  stack {
    db.query "" {
      return = {type: "list"}
    } as $user
  }

  response = $user
}