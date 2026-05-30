// Query subjects owned by the authenticated user
query subjects verb=GET {
  api_group = "edutrack-ai"
  description = "List subjects belonging to the authenticated user"
  auth = "user"

  input {
  }

  stack {
    db.query subject {
      where = $db.subject.user_id == $auth.id
      return = {type: "list"}
    } as $subjects
  }

  response = $subjects
}