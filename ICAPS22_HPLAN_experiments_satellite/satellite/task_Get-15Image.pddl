( define
  ( tasks satellite-tasks )
  ( :task Get-15Image
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
      ?goal_dir5 - direction
      ?goal_mode5 - mode
      ?goal_dir6 - direction
      ?goal_mode6 - mode
      ?goal_dir7 - direction
      ?goal_mode7 - mode
      ?goal_dir8 - direction
      ?goal_mode8 - mode
      ?goal_dir9 - direction
      ?goal_mode9 - mode
      ?goal_dir10 - direction
      ?goal_mode10 - mode
      ?goal_dir11 - direction
      ?goal_mode11 - mode
      ?goal_dir12 - direction
      ?goal_mode12 - mode
      ?goal_dir13 - direction
      ?goal_mode13 - mode
      ?goal_dir14 - direction
      ?goal_mode14 - mode
      ?goal_dir15 - direction
      ?goal_mode15 - mode
    )
    :precondition
    (
    )
    :effect
    ( and
      ( have_image ?goal_dir1 ?goal_mode1 )
      ( have_image ?goal_dir2 ?goal_mode2 )
      ( have_image ?goal_dir3 ?goal_mode3 )
      ( have_image ?goal_dir4 ?goal_mode4 )
      ( have_image ?goal_dir5 ?goal_mode5 )
      ( have_image ?goal_dir6 ?goal_mode6 )
      ( have_image ?goal_dir7 ?goal_mode7 )
      ( have_image ?goal_dir8 ?goal_mode8 )
      ( have_image ?goal_dir9 ?goal_mode9 )
      ( have_image ?goal_dir10 ?goal_mode10 )
      ( have_image ?goal_dir11 ?goal_mode11 )
      ( have_image ?goal_dir12 ?goal_mode12 )
      ( have_image ?goal_dir13 ?goal_mode13 )
      ( have_image ?goal_dir14 ?goal_mode14 )
      ( have_image ?goal_dir15 ?goal_mode15 )
    )
  )
)
