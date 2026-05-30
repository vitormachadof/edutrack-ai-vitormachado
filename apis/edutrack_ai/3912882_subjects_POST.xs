// Create subject record for the authenticated user
// Create a new subject for the authenticated user
query subjects verb=POST {
  api_group = "edutrack-ai"
  auth = "user"

  input {
    // Subject name
    text name? filters=trim
  
    // Subject description
    text descricao? filters=trim
  }

  stack {
    db.add subject {
      data = {
        created_at: "now"
        user_id   : $auth.id
        name      : $input.name
        descricao : $input.descricao
      }
    } as $subject
  }

  response = $subject
}