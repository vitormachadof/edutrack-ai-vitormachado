// Query all subjects records
query subjects verb=GET {
  api_group = "edutrack-ai"

  input {
  }

  stack {
    db.query "" {
      return = {type: "list"}
    } as $subjects
  }

  response = $subjects
}