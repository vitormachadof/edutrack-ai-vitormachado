// Add subjects record
query subjects verb=POST {
  api_group = "edutrack-ai"

  input {
    dblink {
      table = ""
    }
  }

  stack {
    db.add "" {
      data = {created_at: "now"}
    } as $subjects
  }

  response = $subjects
}