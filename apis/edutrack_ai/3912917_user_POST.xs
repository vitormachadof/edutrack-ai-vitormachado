// Add User record
query user verb=POST {
  api_group = "edutrack-ai"

  input {
    dblink {
      table = ""
    }
  }

  stack {
    db.add "" {
      data = {created_at: "now"}
    } as $user
  }

  response = $user
}