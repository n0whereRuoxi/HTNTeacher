( define
  ( tasks satellite-tasks )
  ( :task Get-4Image_prec
    :parameters
    (
      ?goal_dir1 - direction
      ?goal_mode1 - mode
      ?goal_dir2 - direction
      ?goal_mode2 - mode
      ?goal_dir3 - direction
      ?goal_mode3 - mode
      ?goal_dir4 - direction
      ?goal_mode4 - mode
    )
    :precondition
    ( and
      ( not ( = ?goal_dir2 ?goal_dir1 ) )
      ( not ( = ?goal_dir3 ?goal_dir1 ) )
      ( not ( = ?goal_dir3 ?goal_dir2 ) )
      ( not ( = ?goal_dir4 ?goal_dir1 ) )
      ( not ( = ?goal_dir4 ?goal_dir2 ) )
      ( not ( = ?goal_dir4 ?goal_dir3 ) )
    )
    :effect
    ( and
      ( have_image ?goal_dir1 ?goal_mode1 )
      ( have_image ?goal_dir2 ?goal_mode2 )
      ( have_image ?goal_dir3 ?goal_mode3 )
      ( have_image ?goal_dir4 ?goal_mode4 )
    )
  )
)
