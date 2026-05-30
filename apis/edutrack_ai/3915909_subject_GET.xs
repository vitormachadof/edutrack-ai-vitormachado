// Query all subject records
query subject verb=GET {
  api_group = "edutrack-ai"

  input {
  }

  stack {
    db.query subject {
      return = {type: "list"}
    } as $subject
  }

  response = $subject
}