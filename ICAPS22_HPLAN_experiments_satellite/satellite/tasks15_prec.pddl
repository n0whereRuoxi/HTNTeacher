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
  ( :task Get-3Image_prec
    :parameters
    (
      ?goal_dir1 - direction
      ?goal_mode1 - mode
      ?goal_dir2 - direction
      ?goal_mode2 - mode
      ?goal_dir3 - direction
      ?goal_mode3 - mode
    )
    :precondition
    ( and
      ( not ( = ?goal_dir2 ?goal_dir1 ) )
      ( not ( = ?goal_dir3 ?goal_dir1 ) )
      ( not ( = ?goal_dir3 ?goal_dir2 ) )
    )
    :effect
    ( and
      ( have_image ?goal_dir1 ?goal_mode1 )
      ( have_image ?goal_dir2 ?goal_mode2 )
      ( have_image ?goal_dir3 ?goal_mode3 )
    )
  )
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
  ( :task Get-5Image_prec
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
    )
    :effect
    ( and
      ( have_image ?goal_dir1 ?goal_mode1 )
      ( have_image ?goal_dir2 ?goal_mode2 )
      ( have_image ?goal_dir3 ?goal_mode3 )
      ( have_image ?goal_dir4 ?goal_mode4 )
      ( have_image ?goal_dir5 ?goal_mode5 )
    )
  )
  ( :task Get-6Image_prec
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
    )
    :effect
    ( and
      ( have_image ?goal_dir1 ?goal_mode1 )
      ( have_image ?goal_dir2 ?goal_mode2 )
      ( have_image ?goal_dir3 ?goal_mode3 )
      ( have_image ?goal_dir4 ?goal_mode4 )
      ( have_image ?goal_dir5 ?goal_mode5 )
      ( have_image ?goal_dir6 ?goal_mode6 )
    )
  )
  ( :task Get-7Image_prec
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
    )
  )
  ( :task Get-8Image_prec
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
    )
  )
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
  ( :task Get-10Image_prec
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
      ( not ( = ?goal_dir10 ?goal_dir1 ) )
      ( not ( = ?goal_dir10 ?goal_dir2 ) )
      ( not ( = ?goal_dir10 ?goal_dir3 ) )
      ( not ( = ?goal_dir10 ?goal_dir4 ) )
      ( not ( = ?goal_dir10 ?goal_dir5 ) )
      ( not ( = ?goal_dir10 ?goal_dir6 ) )
      ( not ( = ?goal_dir10 ?goal_dir7 ) )
      ( not ( = ?goal_dir10 ?goal_dir8 ) )
      ( not ( = ?goal_dir10 ?goal_dir9 ) )
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
    )
  )
  ( :task Get-11Image_prec
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
      ( not ( = ?goal_dir10 ?goal_dir1 ) )
      ( not ( = ?goal_dir10 ?goal_dir2 ) )
      ( not ( = ?goal_dir10 ?goal_dir3 ) )
      ( not ( = ?goal_dir10 ?goal_dir4 ) )
      ( not ( = ?goal_dir10 ?goal_dir5 ) )
      ( not ( = ?goal_dir10 ?goal_dir6 ) )
      ( not ( = ?goal_dir10 ?goal_dir7 ) )
      ( not ( = ?goal_dir10 ?goal_dir8 ) )
      ( not ( = ?goal_dir10 ?goal_dir9 ) )
      ( not ( = ?goal_dir11 ?goal_dir1 ) )
      ( not ( = ?goal_dir11 ?goal_dir2 ) )
      ( not ( = ?goal_dir11 ?goal_dir3 ) )
      ( not ( = ?goal_dir11 ?goal_dir4 ) )
      ( not ( = ?goal_dir11 ?goal_dir5 ) )
      ( not ( = ?goal_dir11 ?goal_dir6 ) )
      ( not ( = ?goal_dir11 ?goal_dir7 ) )
      ( not ( = ?goal_dir11 ?goal_dir8 ) )
      ( not ( = ?goal_dir11 ?goal_dir9 ) )
      ( not ( = ?goal_dir11 ?goal_dir10 ) )
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
    )
  )
  ( :task Get-12Image_prec
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
      ( not ( = ?goal_dir10 ?goal_dir1 ) )
      ( not ( = ?goal_dir10 ?goal_dir2 ) )
      ( not ( = ?goal_dir10 ?goal_dir3 ) )
      ( not ( = ?goal_dir10 ?goal_dir4 ) )
      ( not ( = ?goal_dir10 ?goal_dir5 ) )
      ( not ( = ?goal_dir10 ?goal_dir6 ) )
      ( not ( = ?goal_dir10 ?goal_dir7 ) )
      ( not ( = ?goal_dir10 ?goal_dir8 ) )
      ( not ( = ?goal_dir10 ?goal_dir9 ) )
      ( not ( = ?goal_dir11 ?goal_dir1 ) )
      ( not ( = ?goal_dir11 ?goal_dir2 ) )
      ( not ( = ?goal_dir11 ?goal_dir3 ) )
      ( not ( = ?goal_dir11 ?goal_dir4 ) )
      ( not ( = ?goal_dir11 ?goal_dir5 ) )
      ( not ( = ?goal_dir11 ?goal_dir6 ) )
      ( not ( = ?goal_dir11 ?goal_dir7 ) )
      ( not ( = ?goal_dir11 ?goal_dir8 ) )
      ( not ( = ?goal_dir11 ?goal_dir9 ) )
      ( not ( = ?goal_dir11 ?goal_dir10 ) )
      ( not ( = ?goal_dir12 ?goal_dir1 ) )
      ( not ( = ?goal_dir12 ?goal_dir2 ) )
      ( not ( = ?goal_dir12 ?goal_dir3 ) )
      ( not ( = ?goal_dir12 ?goal_dir4 ) )
      ( not ( = ?goal_dir12 ?goal_dir5 ) )
      ( not ( = ?goal_dir12 ?goal_dir6 ) )
      ( not ( = ?goal_dir12 ?goal_dir7 ) )
      ( not ( = ?goal_dir12 ?goal_dir8 ) )
      ( not ( = ?goal_dir12 ?goal_dir9 ) )
      ( not ( = ?goal_dir12 ?goal_dir10 ) )
      ( not ( = ?goal_dir12 ?goal_dir11 ) )
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
    )
  )
  ( :task Get-13Image_prec
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
      ( not ( = ?goal_dir10 ?goal_dir1 ) )
      ( not ( = ?goal_dir10 ?goal_dir2 ) )
      ( not ( = ?goal_dir10 ?goal_dir3 ) )
      ( not ( = ?goal_dir10 ?goal_dir4 ) )
      ( not ( = ?goal_dir10 ?goal_dir5 ) )
      ( not ( = ?goal_dir10 ?goal_dir6 ) )
      ( not ( = ?goal_dir10 ?goal_dir7 ) )
      ( not ( = ?goal_dir10 ?goal_dir8 ) )
      ( not ( = ?goal_dir10 ?goal_dir9 ) )
      ( not ( = ?goal_dir11 ?goal_dir1 ) )
      ( not ( = ?goal_dir11 ?goal_dir2 ) )
      ( not ( = ?goal_dir11 ?goal_dir3 ) )
      ( not ( = ?goal_dir11 ?goal_dir4 ) )
      ( not ( = ?goal_dir11 ?goal_dir5 ) )
      ( not ( = ?goal_dir11 ?goal_dir6 ) )
      ( not ( = ?goal_dir11 ?goal_dir7 ) )
      ( not ( = ?goal_dir11 ?goal_dir8 ) )
      ( not ( = ?goal_dir11 ?goal_dir9 ) )
      ( not ( = ?goal_dir11 ?goal_dir10 ) )
      ( not ( = ?goal_dir12 ?goal_dir1 ) )
      ( not ( = ?goal_dir12 ?goal_dir2 ) )
      ( not ( = ?goal_dir12 ?goal_dir3 ) )
      ( not ( = ?goal_dir12 ?goal_dir4 ) )
      ( not ( = ?goal_dir12 ?goal_dir5 ) )
      ( not ( = ?goal_dir12 ?goal_dir6 ) )
      ( not ( = ?goal_dir12 ?goal_dir7 ) )
      ( not ( = ?goal_dir12 ?goal_dir8 ) )
      ( not ( = ?goal_dir12 ?goal_dir9 ) )
      ( not ( = ?goal_dir12 ?goal_dir10 ) )
      ( not ( = ?goal_dir12 ?goal_dir11 ) )
      ( not ( = ?goal_dir13 ?goal_dir1 ) )
      ( not ( = ?goal_dir13 ?goal_dir2 ) )
      ( not ( = ?goal_dir13 ?goal_dir3 ) )
      ( not ( = ?goal_dir13 ?goal_dir4 ) )
      ( not ( = ?goal_dir13 ?goal_dir5 ) )
      ( not ( = ?goal_dir13 ?goal_dir6 ) )
      ( not ( = ?goal_dir13 ?goal_dir7 ) )
      ( not ( = ?goal_dir13 ?goal_dir8 ) )
      ( not ( = ?goal_dir13 ?goal_dir9 ) )
      ( not ( = ?goal_dir13 ?goal_dir10 ) )
      ( not ( = ?goal_dir13 ?goal_dir11 ) )
      ( not ( = ?goal_dir13 ?goal_dir12 ) )
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
    )
  )
  ( :task Get-14Image_prec
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
      ( not ( = ?goal_dir10 ?goal_dir1 ) )
      ( not ( = ?goal_dir10 ?goal_dir2 ) )
      ( not ( = ?goal_dir10 ?goal_dir3 ) )
      ( not ( = ?goal_dir10 ?goal_dir4 ) )
      ( not ( = ?goal_dir10 ?goal_dir5 ) )
      ( not ( = ?goal_dir10 ?goal_dir6 ) )
      ( not ( = ?goal_dir10 ?goal_dir7 ) )
      ( not ( = ?goal_dir10 ?goal_dir8 ) )
      ( not ( = ?goal_dir10 ?goal_dir9 ) )
      ( not ( = ?goal_dir11 ?goal_dir1 ) )
      ( not ( = ?goal_dir11 ?goal_dir2 ) )
      ( not ( = ?goal_dir11 ?goal_dir3 ) )
      ( not ( = ?goal_dir11 ?goal_dir4 ) )
      ( not ( = ?goal_dir11 ?goal_dir5 ) )
      ( not ( = ?goal_dir11 ?goal_dir6 ) )
      ( not ( = ?goal_dir11 ?goal_dir7 ) )
      ( not ( = ?goal_dir11 ?goal_dir8 ) )
      ( not ( = ?goal_dir11 ?goal_dir9 ) )
      ( not ( = ?goal_dir11 ?goal_dir10 ) )
      ( not ( = ?goal_dir12 ?goal_dir1 ) )
      ( not ( = ?goal_dir12 ?goal_dir2 ) )
      ( not ( = ?goal_dir12 ?goal_dir3 ) )
      ( not ( = ?goal_dir12 ?goal_dir4 ) )
      ( not ( = ?goal_dir12 ?goal_dir5 ) )
      ( not ( = ?goal_dir12 ?goal_dir6 ) )
      ( not ( = ?goal_dir12 ?goal_dir7 ) )
      ( not ( = ?goal_dir12 ?goal_dir8 ) )
      ( not ( = ?goal_dir12 ?goal_dir9 ) )
      ( not ( = ?goal_dir12 ?goal_dir10 ) )
      ( not ( = ?goal_dir12 ?goal_dir11 ) )
      ( not ( = ?goal_dir13 ?goal_dir1 ) )
      ( not ( = ?goal_dir13 ?goal_dir2 ) )
      ( not ( = ?goal_dir13 ?goal_dir3 ) )
      ( not ( = ?goal_dir13 ?goal_dir4 ) )
      ( not ( = ?goal_dir13 ?goal_dir5 ) )
      ( not ( = ?goal_dir13 ?goal_dir6 ) )
      ( not ( = ?goal_dir13 ?goal_dir7 ) )
      ( not ( = ?goal_dir13 ?goal_dir8 ) )
      ( not ( = ?goal_dir13 ?goal_dir9 ) )
      ( not ( = ?goal_dir13 ?goal_dir10 ) )
      ( not ( = ?goal_dir13 ?goal_dir11 ) )
      ( not ( = ?goal_dir13 ?goal_dir12 ) )
      ( not ( = ?goal_dir14 ?goal_dir1 ) )
      ( not ( = ?goal_dir14 ?goal_dir2 ) )
      ( not ( = ?goal_dir14 ?goal_dir3 ) )
      ( not ( = ?goal_dir14 ?goal_dir4 ) )
      ( not ( = ?goal_dir14 ?goal_dir5 ) )
      ( not ( = ?goal_dir14 ?goal_dir6 ) )
      ( not ( = ?goal_dir14 ?goal_dir7 ) )
      ( not ( = ?goal_dir14 ?goal_dir8 ) )
      ( not ( = ?goal_dir14 ?goal_dir9 ) )
      ( not ( = ?goal_dir14 ?goal_dir10 ) )
      ( not ( = ?goal_dir14 ?goal_dir11 ) )
      ( not ( = ?goal_dir14 ?goal_dir12 ) )
      ( not ( = ?goal_dir14 ?goal_dir13 ) )
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
    )
  )
  ( :task Get-15Image_prec
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
      ( not ( = ?goal_dir10 ?goal_dir1 ) )
      ( not ( = ?goal_dir10 ?goal_dir2 ) )
      ( not ( = ?goal_dir10 ?goal_dir3 ) )
      ( not ( = ?goal_dir10 ?goal_dir4 ) )
      ( not ( = ?goal_dir10 ?goal_dir5 ) )
      ( not ( = ?goal_dir10 ?goal_dir6 ) )
      ( not ( = ?goal_dir10 ?goal_dir7 ) )
      ( not ( = ?goal_dir10 ?goal_dir8 ) )
      ( not ( = ?goal_dir10 ?goal_dir9 ) )
      ( not ( = ?goal_dir11 ?goal_dir1 ) )
      ( not ( = ?goal_dir11 ?goal_dir2 ) )
      ( not ( = ?goal_dir11 ?goal_dir3 ) )
      ( not ( = ?goal_dir11 ?goal_dir4 ) )
      ( not ( = ?goal_dir11 ?goal_dir5 ) )
      ( not ( = ?goal_dir11 ?goal_dir6 ) )
      ( not ( = ?goal_dir11 ?goal_dir7 ) )
      ( not ( = ?goal_dir11 ?goal_dir8 ) )
      ( not ( = ?goal_dir11 ?goal_dir9 ) )
      ( not ( = ?goal_dir11 ?goal_dir10 ) )
      ( not ( = ?goal_dir12 ?goal_dir1 ) )
      ( not ( = ?goal_dir12 ?goal_dir2 ) )
      ( not ( = ?goal_dir12 ?goal_dir3 ) )
      ( not ( = ?goal_dir12 ?goal_dir4 ) )
      ( not ( = ?goal_dir12 ?goal_dir5 ) )
      ( not ( = ?goal_dir12 ?goal_dir6 ) )
      ( not ( = ?goal_dir12 ?goal_dir7 ) )
      ( not ( = ?goal_dir12 ?goal_dir8 ) )
      ( not ( = ?goal_dir12 ?goal_dir9 ) )
      ( not ( = ?goal_dir12 ?goal_dir10 ) )
      ( not ( = ?goal_dir12 ?goal_dir11 ) )
      ( not ( = ?goal_dir13 ?goal_dir1 ) )
      ( not ( = ?goal_dir13 ?goal_dir2 ) )
      ( not ( = ?goal_dir13 ?goal_dir3 ) )
      ( not ( = ?goal_dir13 ?goal_dir4 ) )
      ( not ( = ?goal_dir13 ?goal_dir5 ) )
      ( not ( = ?goal_dir13 ?goal_dir6 ) )
      ( not ( = ?goal_dir13 ?goal_dir7 ) )
      ( not ( = ?goal_dir13 ?goal_dir8 ) )
      ( not ( = ?goal_dir13 ?goal_dir9 ) )
      ( not ( = ?goal_dir13 ?goal_dir10 ) )
      ( not ( = ?goal_dir13 ?goal_dir11 ) )
      ( not ( = ?goal_dir13 ?goal_dir12 ) )
      ( not ( = ?goal_dir14 ?goal_dir1 ) )
      ( not ( = ?goal_dir14 ?goal_dir2 ) )
      ( not ( = ?goal_dir14 ?goal_dir3 ) )
      ( not ( = ?goal_dir14 ?goal_dir4 ) )
      ( not ( = ?goal_dir14 ?goal_dir5 ) )
      ( not ( = ?goal_dir14 ?goal_dir6 ) )
      ( not ( = ?goal_dir14 ?goal_dir7 ) )
      ( not ( = ?goal_dir14 ?goal_dir8 ) )
      ( not ( = ?goal_dir14 ?goal_dir9 ) )
      ( not ( = ?goal_dir14 ?goal_dir10 ) )
      ( not ( = ?goal_dir14 ?goal_dir11 ) )
      ( not ( = ?goal_dir14 ?goal_dir12 ) )
      ( not ( = ?goal_dir14 ?goal_dir13 ) )
      ( not ( = ?goal_dir15 ?goal_dir1 ) )
      ( not ( = ?goal_dir15 ?goal_dir2 ) )
      ( not ( = ?goal_dir15 ?goal_dir3 ) )
      ( not ( = ?goal_dir15 ?goal_dir4 ) )
      ( not ( = ?goal_dir15 ?goal_dir5 ) )
      ( not ( = ?goal_dir15 ?goal_dir6 ) )
      ( not ( = ?goal_dir15 ?goal_dir7 ) )
      ( not ( = ?goal_dir15 ?goal_dir8 ) )
      ( not ( = ?goal_dir15 ?goal_dir9 ) )
      ( not ( = ?goal_dir15 ?goal_dir10 ) )
      ( not ( = ?goal_dir15 ?goal_dir11 ) )
      ( not ( = ?goal_dir15 ?goal_dir12 ) )
      ( not ( = ?goal_dir15 ?goal_dir13 ) )
      ( not ( = ?goal_dir15 ?goal_dir14 ) )
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