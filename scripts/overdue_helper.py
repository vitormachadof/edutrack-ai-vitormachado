"""
Helper to compute overdue subject IDs for authenticated users.

This module provides utilities for identifying which subjects have overdue
academic tasks where overdue is defined as: due_date < today and status != "completed"
"""

from datetime import datetime
from typing import List, Dict


def get_overdue_subject_ids(academic_tasks: List[Dict]) -> List[int]:
    """
    Compute overdue subject IDs from a list of academic tasks.
    
    Overdue tasks are defined as tasks where:
    - due_date is in the past (before today)
    - status is NOT "completed"
    
    Args:
        academic_tasks: List of academic task records with 'subject_id', 'due_date', and 'status' fields
        
    Returns:
        Sorted list of unique subject IDs that have at least one overdue task
    """
    today = datetime.now().date()
    overdue_subject_ids = set()
    
    for task in academic_tasks:
        # Parse due_date - handle both string and datetime formats
        due_date = task.get("due_date")
        if due_date is None:
            continue
            
        if isinstance(due_date, str):
            try:
                due_date = datetime.fromisoformat(due_date).date()
            except (ValueError, TypeError):
                continue
        elif isinstance(due_date, datetime):
            due_date = due_date.date()
        else:
            continue
        
        # Get status, normalize to lowercase
        status = str(task.get("status", "")).lower().strip()
        subject_id = task.get("subject_id")
        
        # Determine if task is overdue
        is_overdue = due_date < today
        is_not_completed = status != "completed"
        
        # Add to set if both conditions are met
        if is_overdue and is_not_completed and subject_id is not None:
            overdue_subject_ids.add(int(subject_id))
    
    # Return sorted list of unique IDs
    return sorted(list(overdue_subject_ids))


if __name__ == "__main__":
    # Example usage
    sample_tasks = [
        {
            "subject_id": 1,
            "due_date": "2026-05-20",
            "status": "pending"
        },
        {
            "subject_id": 2,
            "due_date": "2026-05-25",
            "status": "completed"
        },
        {
            "subject_id": 1,
            "due_date": "2026-06-10",
            "status": "pending"
        },
        {
            "subject_id": 3,
            "due_date": "2026-05-28",
            "status": "in_progress"
        }
    ]
    
    result = get_overdue_subject_ids(sample_tasks)
    print(f"Overdue subject IDs: {result}")
    # Expected: [1, 3] (subject 1 and 3 have overdue tasks, 2 is completed)
