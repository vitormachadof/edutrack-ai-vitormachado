// Delete subjects record.
query "subjects/{subjects_id}" verb=DELETE {
  api_group = "edutrack-ai"

  input {
    int subjects_id? filters=min:1
  }

  stack {
    db.get "" {
      field_name = "id"
      field_value = $input.subjects_id
    } as $subject
  
    precondition ($subject != null) {
      error_type = "notfound"
      error = "Subject not found."
    }
  
    precondition () {
      error_type = "forbidden"
      error = "You do not have permission to delete this subject."
    }
  
    db.del "" {
      field_name = "id"
      field_value = $input.subjects_id
    }
  }

  response = null
}