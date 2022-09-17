( define
  ( tasks satellite-tasks )
  ( :task Get-1Image_prec
    :parameters
    (
      ?goal_dir1 - direction
      ?goal_mode1 - mode
    )
    :precondition
    ( and
    )
    :effect
    ( and
      ( have_image ?goal_dir1 ?goal_mode1 )
    )
  )
  ( :task Get-2Image_prec
    :parameters
    (
      ?goal_dir1 - direction
      ?goal_mode1 - mode
      ?goal_dir2 - direction
      ?goal_mode2 - mode
    )
    :precondition
    ( and
      ( not ( = ?goal_dir2 ?goal_dir1 ) )
    )
    :effect
    ( and
      ( have_image ?goal_dir1 ?goal_mode1 )
      ( have_image ?goal_dir2 ?goal_mode2 )
    )
  )
)
