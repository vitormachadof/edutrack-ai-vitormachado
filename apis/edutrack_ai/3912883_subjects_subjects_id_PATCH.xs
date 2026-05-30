// Update a subject record owned by the authenticated user
// Update a specific subject owned by the authenticated user
query "subjects/{subject_id}" verb=PATCH {
  api_group = "edutrack-ai"
  auth = "user"

  input {
    int subject_id? filters=min:1
    dblink {
      table = "subject"
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
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
  
    var $patch_data {
      value = `$input|pick:($raw_input|keys)`
        |filter_null
        |filter_empty_text
        |unpick:["user_id", "subject_id"]
    }
  
    db.patch subject {
      field_name = "id"
      field_value = $input.subject_id
      data = $patch_data
    } as $subject
  }

  response = $subject
}