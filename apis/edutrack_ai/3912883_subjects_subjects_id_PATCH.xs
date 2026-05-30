// Edit subjects record
query "subjects/{subjects_id}" verb=PATCH {
  api_group = "edutrack-ai"

  input {
    int subjects_id? filters=min:1
    text name?
    text description?
    int credits?
    text semester?
    text status?
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
      error = "You do not have permission to modify this subject."
    }
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch "" {
      field_name = "id"
      field_value = $input.subjects_id
      data = {
        name       : $input.name
        description: $input.description
        credits    : $input.credits
        semester   : $input.semester
        status     : $input.status
        updated_at : "now"
      }
    } as $subjects
  }

  response = $subjects
}