( define
  ( tasks satellite-tasks )
  ( :task Get-9Image_prec
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
    )
    :precondition
    ( and
      ( not ( = ?goal_dir2 ?goal_dir1 ) )
      ( not ( = ?goal_dir3 ?goal_dir1 ) )
      ( not ( = ?goal_dir3 ?goal_dir2 ) )
      ( not ( = ?goal_dir4 ?goal_dir1 ) )
      ( not ( = ?goal_dir4 ?goal_dir2 ) )
      ( not ( = ?goal_dir4 ?goal_dir3 ) )
      ( not ( = ?goal_dir5 ?goal_dir1 ) )
      ( not ( = ?goal_dir5 ?goal_dir2 ) )
      ( not ( = ?goal_dir5 ?goal_dir3 ) )
      ( not ( = ?goal_dir5 ?goal_dir4 ) )
      ( not ( = ?goal_dir6 ?goal_dir1 ) )
      ( not ( = ?goal_dir6 ?goal_dir2 ) )
      ( not ( = ?goal_dir6 ?goal_dir3 ) )
      ( not ( = ?goal_dir6 ?goal_dir4 ) )
      ( not ( = ?goal_dir6 ?goal_dir5 ) )
      ( not ( = ?goal_dir7 ?goal_dir1 ) )
      ( not ( = ?goal_dir7 ?goal_dir2 ) )
      ( not ( = ?goal_dir7 ?goal_dir3 ) )
      ( not ( = ?goal_dir7 ?goal_dir4 ) )
      ( not ( = ?goal_dir7 ?goal_dir5 ) )
      ( not ( = ?goal_dir7 ?goal_dir6 ) )
      ( not ( = ?goal_dir8 ?goal_dir1 ) )
      ( not ( = ?goal_dir8 ?goal_dir2 ) )
      ( not ( = ?goal_dir8 ?goal_dir3 ) )
      ( not ( = ?goal_dir8 ?goal_dir4 ) )
      ( not ( = ?goal_dir8 ?goal_dir5 ) )
      ( not ( = ?goal_dir8 ?goal_dir6 ) )
      ( not ( = ?goal_dir8 ?goal_dir7 ) )
      ( not ( = ?goal_dir9 ?goal_dir1 ) )
      ( not ( = ?goal_dir9 ?goal_dir2 ) )
      ( not ( = ?goal_dir9 ?goal_dir3 ) )
      ( not ( = ?goal_dir9 ?goal_dir4 ) )
      ( not ( = ?goal_dir9 ?goal_dir5 ) )
      ( not ( = ?goal_dir9 ?goal_dir6 ) )
      ( not ( = ?goal_dir9 ?goal_dir7 ) )
      ( not ( = ?goal_dir9 ?goal_dir8 ) )
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
    )
  )
)
