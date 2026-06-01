// Search subjects by name or overdue status
query subjects_search verb=GET {
  api_group = "edutrack-ai"
  auth = "user"

  input {
    text q?
    text show_overdue?
  }

  stack {
    db.query subject {
      where = $db.subject.user_id == $auth.id
      return = {type: "list"}
    } as $all_subjects
  
    db.query academic_tasks {
      where = $db.academic_tasks.user_id == $auth.id
      return = {type: "list"}
    } as $all_tasks
  
    var $overdue_ids {
      value = $all_tasks
        |filter:"return $this.due_date && $this.due_date < 'now' && $this.status != 'completed'"
        |map:"return $this.subject_id;"
        |unique
    }
  
    var $final_result {
      value = $all_subjects
    }
  
    conditional {
      if ($input.q != null && ($input.show_overdue == null || $input.show_overdue == "false")) {
        var $final_result {
          value = $all_subjects
            |filter:"return $this.name|icontains:" ~ $input.q ~ ";"
        }
      }
    }
  
    conditional {
      if ($input.q == null && $input.show_overdue == "true") {
        var $final_result {
          value = $all_subjects
            |filter:"return $overdue_ids|contains:$this.id;"
        }
      }
    }
  
    conditional {
      if ($input.q != null && $input.show_overdue == "true") {
        var $by_name {
          value = $all_subjects
            |filter:"return $this.name|icontains:" ~ $input.q ~ ";"
        }
      
        var $by_overdue {
          value = $all_subjects
            |filter:"return $overdue_ids|contains:$this.id;"
        }
      
        var $final_result {
          value = ($by_name ~ $by_overdue)|unique
        }
      }
    }
  }

  response = $final_result
}