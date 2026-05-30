// Add subject record
query subject verb=POST {
  api_group = "edutrack-ai"

  input {
    dblink {
      table = "subject"
    }
  }

  stack {
    db.add subject {
      data = {created_at: "now"}
    } as $subject
  }

  response = $subject
}