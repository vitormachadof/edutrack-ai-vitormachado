// Get a subject record owned by the authenticated user
query "subjects/{subject_id}" verb=GET {
  api_group = "edutrack-ai"
  description = "Retrieve a specific subject owned by the authenticated user"
  auth = "user"

  input {
    int subject_id? filters=min:1
  }

  stack {
    db.get subject {
      field_name = "id"
      field_value = $input.subject_id
    } as $subject

    precondition ($subject != null) {
      error_type = "notfound"
      error = "Not Found."
    }

    precondition ($subject.user_id == $auth.id) {
      error_type = "accessdenied"
      error = "Forbidden."
    }
  }

  response = $subject
}