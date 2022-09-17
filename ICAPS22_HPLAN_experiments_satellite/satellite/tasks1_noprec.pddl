( define
  ( tasks satellite-tasks )
  ( :task Get-1Image
    :parameters
    (
      ?goal_dir1 - direction
      ?goal_mode1 - mode
    )
    :precondition
    (
    )
    :effect
    ( and
      ( have_image ?goal_dir1 ?goal_mode1 )
    )
  )
)
