( define ( domain satellite )
  ( :requirements :strips :typing :equality :htn )
  ( :types direction instrument mode satellite )
  ( :predicates
    ( on_board ?i - instrument ?s - satellite )
    ( supports ?i - instrument ?m - mode )
    ( pointing ?s - satellite ?d - direction )
    ( power_avail ?s - satellite )
    ( power_on ?i - instrument )
    ( calibrated ?i - instrument )
    ( not_calibrated ?i - instrument )
    ( have_image ?d - direction ?m - mode )
    ( calibration_target ?i - instrument ?d - direction )
  )

  ( :action !TURN_TO
    :parameters
    (
      ?s - satellite
      ?d_new - direction
      ?d_prev - direction
    )
    :precondition
    ( and
      ( pointing ?s ?d_prev )
      ( not ( = ?d_new ?d_prev ) )
    )
    :effect
    ( and
      ( pointing ?s ?d_new )
      ( not ( pointing ?s ?d_prev ) )
    )
  )

  ( :action !SWITCH_ON
    :parameters
    (
      ?i - instrument
      ?s - satellite
    )
    :precondition
    ( and
      ( on_board ?i ?s )
      ( power_avail ?s )
    )
    :effect
    ( and
      ( power_on ?i )
      ( not_calibrated ?i )
      ( not ( calibrated ?i ) )
      ( not ( power_avail ?s ) )
    )
  )

  ( :action !SWITCH_OFF
    :parameters
    (
      ?i - instrument
      ?s - satellite
    )
    :precondition
    ( and
      ( on_board ?i ?s )
      ( power_on ?i )
    )
    :effect
    ( and
      ( power_avail ?s )
      ( not ( power_on ?i ) )
    )
  )

  ( :action !CALIBRATE
    :parameters
    (
      ?s - satellite
      ?i - instrument
      ?d - direction
    )
    :precondition
    ( and
      ( on_board ?i ?s )
      ( calibration_target ?i ?d )
      ( pointing ?s ?d )
      ( power_on ?i )
      ( not_calibrated ?i )
    )
    :effect
    ( and 
      ( calibrated ?i )
      ( not ( not_calibrated ?i ) )
    )
  )

  ( :action !TAKE_IMAGE
    :parameters
    (
      ?s - satellite
      ?d - direction
      ?i - instrument
      ?m - mode
    )
    :precondition
    ( and 
      ( calibrated ?i )
      ( on_board ?i ?s )
      ( supports ?i ?m )
      ( power_on ?i )
      ( pointing ?s ?d )
      ( power_on ?i )
    )
    :effect
    ( and
      ( have_image ?d ?m )
    )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - direction
      ?goal_mode - mode
    )
    :precondition
    ( and 
      ( HAVE_IMAGE ?goal_dir ?goal_mode ) 
    )
    :subtasks
    (  )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - direction
      ?goal_mode - mode
    )
    :vars
    (
      ?using_inst - instrument
      ?using_sat - satellite
    )
    :precondition
    ( and
      ( calibrated ?using_inst )
      ( on_board ?using_inst ?using_sat )
      ( supports ?using_inst ?goal_mode )
      ( power_on ?using_inst )
      ( pointing ?using_sat ?goal_dir )
    )
    :subtasks
    ( 
      ( !TAKE_IMAGE ?using_sat ?goal_dir ?using_inst ?goal_mode )
    )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - direction
      ?goal_mode - mode
    )
    :vars
    (
      ?using_inst - instrument
      ?using_sat - satellite
      ?old_dir - direction
    )
    :precondition
    ( and
      ( calibrated ?using_inst )
      ( on_board ?using_inst ?using_sat )
      ( supports ?using_inst ?goal_mode )
      ( power_on ?using_inst )
      ( pointing ?using_sat ?old_dir )
      ( not ( = ?old_dir ?goal_dir ) )
    )
    :subtasks
    ( 
      ( !TURN_TO ?using_sat ?goal_dir ?old_dir )
      ( GET_IMAGE ?goal_dir ?goal_mode )
    )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - direction
      ?goal_mode - mode
    )
    :vars
    (
      ?using_inst - instrument
      ?using_sat - satellite
      ?calib_dir - direction
    )
    :precondition
    ( and
      ( not_calibrated ?using_inst )
      ( on_board ?using_inst ?using_sat )
      ( supports ?using_inst ?goal_mode )
      ( power_on ?using_inst )
      ( pointing ?using_sat ?calib_dir )
      ( calibration_target ?using_inst ?calib_dir )
    )
    :subtasks
    ( 
      ( !CALIBRATE ?using_sat ?using_inst ?calib_dir )
      ( GET_IMAGE ?goal_dir ?goal_mode )
    )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - direction
      ?goal_mode - mode
    )
    :vars
    (
      ?using_inst - instrument
      ?using_sat - satellite
      ?calib_dir - direction
      ?old_dir - direction
    )
    :precondition
    ( and
      ( not_calibrated ?using_inst )
      ( on_board ?using_inst ?using_sat )
      ( supports ?using_inst ?goal_mode )
      ( power_on ?using_inst )
      ( pointing ?using_sat ?old_dir )
      ( calibration_target ?using_inst ?calib_dir )
      ( not ( = ?old_dir ?calib_dir ) )
    )
    :subtasks
    ( 
      ( !TURN_TO ?using_sat ?calib_dir ?old_dir )
      ( GET_IMAGE ?goal_dir ?goal_mode )
    )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - direction
      ?goal_mode - mode
    )
    :vars
    (
      ?using_inst - instrument
      ?using_sat - satellite
    )
    :precondition
    ( and
      ( on_board ?using_inst ?using_sat )
      ( supports ?using_inst ?goal_mode )
      ( power_avail ?using_sat )
    )
    :subtasks
    ( 
      ( !SWITCH_ON ?using_inst ?using_sat )
      ( GET_IMAGE ?goal_dir ?goal_mode )
    )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - direction
      ?goal_mode - mode
    )
    :vars
    (
      ?using_inst - instrument
      ?using_sat - satellite
      ?old_inst - instrument
    )
    :precondition
    ( and
      ( on_board ?using_inst ?using_sat )
      ( supports ?using_inst ?goal_mode )
      ( on_board ?old_inst ?using_sat )
      ( power_on ?old_inst )
      ( not ( = ?old_inst ?using_inst ) )
    )
    :subtasks
    ( 
      ( !SWITCH_OFF ?old_inst ?using_sat )
      ( GET_IMAGE ?goal_dir ?goal_mode )
    )
  )


  ( :method Get-1Image
    :parameters
    (
      ?dir0 - direction
      ?mode0 - mode
    )
    :precondition
    (
    )
    :subtasks
    (
      ( Get_Image ?dir0 ?mode0 )
    )
  )
  ( :method Get-2Image
    :parameters
    (
      ?dir0 - direction
      ?mode0 - mode
      ?dir1 - direction
      ?mode1 - mode
    )
    :precondition
    (
    )
    :subtasks
    (
      ( Get_Image ?dir0 ?mode0 )
      ( Get_Image ?dir1 ?mode1 )
    )
  )
  ( :method Get-3Image
    :parameters
    (
      ?dir0 - direction
      ?mode0 - mode
      ?dir1 - direction
      ?mode1 - mode
      ?dir2 - direction
      ?mode2 - mode
    )
    :precondition
    (
    )
    :subtasks
    (
      ( Get_Image ?dir0 ?mode0 )
      ( Get_Image ?dir1 ?mode1 )
      ( Get_Image ?dir2 ?mode2 )
    )
  )
  ( :method Get-4Image
    :parameters
    (
      ?dir0 - direction
      ?mode0 - mode
      ?dir1 - direction
      ?mode1 - mode
      ?dir2 - direction
      ?mode2 - mode
      ?dir3 - direction
      ?mode3 - mode
    )
    :precondition
    (
    )
    :subtasks
    (
      ( Get_Image ?dir0 ?mode0 )
      ( Get_Image ?dir1 ?mode1 )
      ( Get_Image ?dir2 ?mode2 )
      ( Get_Image ?dir3 ?mode3 )
    )
  )
  ( :method Get-5Image
    :parameters
    (
      ?dir0 - direction
      ?mode0 - mode
      ?dir1 - direction
      ?mode1 - mode
      ?dir2 - direction
      ?mode2 - mode
      ?dir3 - direction
      ?mode3 - mode
      ?dir4 - direction
      ?mode4 - mode
    )
    :precondition
    (
    )
    :subtasks
    (
      ( Get_Image ?dir0 ?mode0 )
      ( Get_Image ?dir1 ?mode1 )
      ( Get_Image ?dir2 ?mode2 )
      ( Get_Image ?dir3 ?mode3 )
      ( Get_Image ?dir4 ?mode4 )
    )
  )
  ( :method Get-6Image
    :parameters
    (
      ?dir0 - direction
      ?mode0 - mode
      ?dir1 - direction
      ?mode1 - mode
      ?dir2 - direction
      ?mode2 - mode
      ?dir3 - direction
      ?mode3 - mode
      ?dir4 - direction
      ?mode4 - mode
      ?dir5 - direction
      ?mode5 - mode
    )
    :precondition
    (
    )
    :subtasks
    (
      ( Get_Image ?dir0 ?mode0 )
      ( Get_Image ?dir1 ?mode1 )
      ( Get_Image ?dir2 ?mode2 )
      ( Get_Image ?dir3 ?mode3 )
      ( Get_Image ?dir4 ?mode4 )
      ( Get_Image ?dir5 ?mode5 )
    )
  )
  ( :method Get-7Image
    :parameters
    (
      ?dir0 - direction
      ?mode0 - mode
      ?dir1 - direction
      ?mode1 - mode
      ?dir2 - direction
      ?mode2 - mode
      ?dir3 - direction
      ?mode3 - mode
      ?dir4 - direction
      ?mode4 - mode
      ?dir5 - direction
      ?mode5 - mode
      ?dir6 - direction
      ?mode6 - mode
    )
    :precondition
    (
    )
    :subtasks
    (
      ( Get_Image ?dir0 ?mode0 )
      ( Get_Image ?dir1 ?mode1 )
      ( Get_Image ?dir2 ?mode2 )
      ( Get_Image ?dir3 ?mode3 )
      ( Get_Image ?dir4 ?mode4 )
      ( Get_Image ?dir5 ?mode5 )
      ( Get_Image ?dir6 ?mode6 )
    )
  )
  ( :method Get-8Image
    :parameters
    (
      ?dir0 - direction
      ?mode0 - mode
      ?dir1 - direction
      ?mode1 - mode
      ?dir2 - direction
      ?mode2 - mode
      ?dir3 - direction
      ?mode3 - mode
      ?dir4 - direction
      ?mode4 - mode
      ?dir5 - direction
      ?mode5 - mode
      ?dir6 - direction
      ?mode6 - mode
      ?dir7 - direction
      ?mode7 - mode
    )
    :precondition
    (
    )
    :subtasks
    (
      ( Get_Image ?dir0 ?mode0 )
      ( Get_Image ?dir1 ?mode1 )
      ( Get_Image ?dir2 ?mode2 )
      ( Get_Image ?dir3 ?mode3 )
      ( Get_Image ?dir4 ?mode4 )
      ( Get_Image ?dir5 ?mode5 )
      ( Get_Image ?dir6 ?mode6 )
      ( Get_Image ?dir7 ?mode7 )
    )
  )
  ( :method Get-9Image
    :parameters
    (
      ?dir0 - direction
      ?mode0 - mode
      ?dir1 - direction
      ?mode1 - mode
      ?dir2 - direction
      ?mode2 - mode
      ?dir3 - direction
      ?mode3 - mode
      ?dir4 - direction
      ?mode4 - mode
      ?dir5 - direction
      ?mode5 - mode
      ?dir6 - direction
      ?mode6 - mode
      ?dir7 - direction
      ?mode7 - mode
      ?dir8 - direction
      ?mode8 - mode
    )
    :precondition
    (
    )
    :subtasks
    (
      ( Get_Image ?dir0 ?mode0 )
      ( Get_Image ?dir1 ?mode1 )
      ( Get_Image ?dir2 ?mode2 )
      ( Get_Image ?dir3 ?mode3 )
      ( Get_Image ?dir4 ?mode4 )
      ( Get_Image ?dir5 ?mode5 )
      ( Get_Image ?dir6 ?mode6 )
      ( Get_Image ?dir7 ?mode7 )
      ( Get_Image ?dir8 ?mode8 )
    )
  )
  ( :method Get-10Image
    :parameters
    (
      ?dir0 - direction
      ?mode0 - mode
      ?dir1 - direction
      ?mode1 - mode
      ?dir2 - direction
      ?mode2 - mode
      ?dir3 - direction
      ?mode3 - mode
      ?dir4 - direction
      ?mode4 - mode
      ?dir5 - direction
      ?mode5 - mode
      ?dir6 - direction
      ?mode6 - mode
      ?dir7 - direction
      ?mode7 - mode
      ?dir8 - direction
      ?mode8 - mode
      ?dir9 - direction
      ?mode9 - mode
    )
    :precondition
    (
    )
    :subtasks
    (
      ( Get_Image ?dir0 ?mode0 )
      ( Get_Image ?dir1 ?mode1 )
      ( Get_Image ?dir2 ?mode2 )
      ( Get_Image ?dir3 ?mode3 )
      ( Get_Image ?dir4 ?mode4 )
      ( Get_Image ?dir5 ?mode5 )
      ( Get_Image ?dir6 ?mode6 )
      ( Get_Image ?dir7 ?mode7 )
      ( Get_Image ?dir8 ?mode8 )
      ( Get_Image ?dir9 ?mode9 )
    )
  )
  ( :method Get-11Image
    :parameters
    (
      ?dir0 - direction
      ?mode0 - mode
      ?dir1 - direction
      ?mode1 - mode
      ?dir2 - direction
      ?mode2 - mode
      ?dir3 - direction
      ?mode3 - mode
      ?dir4 - direction
      ?mode4 - mode
      ?dir5 - direction
      ?mode5 - mode
      ?dir6 - direction
      ?mode6 - mode
      ?dir7 - direction
      ?mode7 - mode
      ?dir8 - direction
      ?mode8 - mode
      ?dir9 - direction
      ?mode9 - mode
      ?dir10 - direction
      ?mode10 - mode
    )
    :precondition
    (
    )
    :subtasks
    (
      ( Get_Image ?dir0 ?mode0 )
      ( Get_Image ?dir1 ?mode1 )
      ( Get_Image ?dir2 ?mode2 )
      ( Get_Image ?dir3 ?mode3 )
      ( Get_Image ?dir4 ?mode4 )
      ( Get_Image ?dir5 ?mode5 )
      ( Get_Image ?dir6 ?mode6 )
      ( Get_Image ?dir7 ?mode7 )
      ( Get_Image ?dir8 ?mode8 )
      ( Get_Image ?dir9 ?mode9 )
      ( Get_Image ?dir10 ?mode10 )
    )
  )
  ( :method Get-12Image
    :parameters
    (
      ?dir0 - direction
      ?mode0 - mode
      ?dir1 - direction
      ?mode1 - mode
      ?dir2 - direction
      ?mode2 - mode
      ?dir3 - direction
      ?mode3 - mode
      ?dir4 - direction
      ?mode4 - mode
      ?dir5 - direction
      ?mode5 - mode
      ?dir6 - direction
      ?mode6 - mode
      ?dir7 - direction
      ?mode7 - mode
      ?dir8 - direction
      ?mode8 - mode
      ?dir9 - direction
      ?mode9 - mode
      ?dir10 - direction
      ?mode10 - mode
      ?dir11 - direction
      ?mode11 - mode
    )
    :precondition
    (
    )
    :subtasks
    (
      ( Get_Image ?dir0 ?mode0 )
      ( Get_Image ?dir1 ?mode1 )
      ( Get_Image ?dir2 ?mode2 )
      ( Get_Image ?dir3 ?mode3 )
      ( Get_Image ?dir4 ?mode4 )
      ( Get_Image ?dir5 ?mode5 )
      ( Get_Image ?dir6 ?mode6 )
      ( Get_Image ?dir7 ?mode7 )
      ( Get_Image ?dir8 ?mode8 )
      ( Get_Image ?dir9 ?mode9 )
      ( Get_Image ?dir10 ?mode10 )
      ( Get_Image ?dir11 ?mode11 )
    )
  )
  ( :method Get-13Image
    :parameters
    (
      ?dir0 - direction
      ?mode0 - mode
      ?dir1 - direction
      ?mode1 - mode
      ?dir2 - direction
      ?mode2 - mode
      ?dir3 - direction
      ?mode3 - mode
      ?dir4 - direction
      ?mode4 - mode
      ?dir5 - direction
      ?mode5 - mode
      ?dir6 - direction
      ?mode6 - mode
      ?dir7 - direction
      ?mode7 - mode
      ?dir8 - direction
      ?mode8 - mode
      ?dir9 - direction
      ?mode9 - mode
      ?dir10 - direction
      ?mode10 - mode
      ?dir11 - direction
      ?mode11 - mode
      ?dir12 - direction
      ?mode12 - mode
    )
    :precondition
    (
    )
    :subtasks
    (
      ( Get_Image ?dir0 ?mode0 )
      ( Get_Image ?dir1 ?mode1 )
      ( Get_Image ?dir2 ?mode2 )
      ( Get_Image ?dir3 ?mode3 )
      ( Get_Image ?dir4 ?mode4 )
      ( Get_Image ?dir5 ?mode5 )
      ( Get_Image ?dir6 ?mode6 )
      ( Get_Image ?dir7 ?mode7 )
      ( Get_Image ?dir8 ?mode8 )
      ( Get_Image ?dir9 ?mode9 )
      ( Get_Image ?dir10 ?mode10 )
      ( Get_Image ?dir11 ?mode11 )
      ( Get_Image ?dir12 ?mode12 )
    )
  )
  ( :method Get-14Image
    :parameters
    (
      ?dir0 - direction
      ?mode0 - mode
      ?dir1 - direction
      ?mode1 - mode
      ?dir2 - direction
      ?mode2 - mode
      ?dir3 - direction
      ?mode3 - mode
      ?dir4 - direction
      ?mode4 - mode
      ?dir5 - direction
      ?mode5 - mode
      ?dir6 - direction
      ?mode6 - mode
      ?dir7 - direction
      ?mode7 - mode
      ?dir8 - direction
      ?mode8 - mode
      ?dir9 - direction
      ?mode9 - mode
      ?dir10 - direction
      ?mode10 - mode
      ?dir11 - direction
      ?mode11 - mode
      ?dir12 - direction
      ?mode12 - mode
      ?dir13 - direction
      ?mode13 - mode
    )
    :precondition
    (
    )
    :subtasks
    (
      ( Get_Image ?dir0 ?mode0 )
      ( Get_Image ?dir1 ?mode1 )
      ( Get_Image ?dir2 ?mode2 )
      ( Get_Image ?dir3 ?mode3 )
      ( Get_Image ?dir4 ?mode4 )
      ( Get_Image ?dir5 ?mode5 )
      ( Get_Image ?dir6 ?mode6 )
      ( Get_Image ?dir7 ?mode7 )
      ( Get_Image ?dir8 ?mode8 )
      ( Get_Image ?dir9 ?mode9 )
      ( Get_Image ?dir10 ?mode10 )
      ( Get_Image ?dir11 ?mode11 )
      ( Get_Image ?dir12 ?mode12 )
      ( Get_Image ?dir13 ?mode13 )
    )
  )
  ( :method Get-15Image
    :parameters
    (
      ?dir0 - direction
      ?mode0 - mode
      ?dir1 - direction
      ?mode1 - mode
      ?dir2 - direction
      ?mode2 - mode
      ?dir3 - direction
      ?mode3 - mode
      ?dir4 - direction
      ?mode4 - mode
      ?dir5 - direction
      ?mode5 - mode
      ?dir6 - direction
      ?mode6 - mode
      ?dir7 - direction
      ?mode7 - mode
      ?dir8 - direction
      ?mode8 - mode
      ?dir9 - direction
      ?mode9 - mode
      ?dir10 - direction
      ?mode10 - mode
      ?dir11 - direction
      ?mode11 - mode
      ?dir12 - direction
      ?mode12 - mode
      ?dir13 - direction
      ?mode13 - mode
      ?dir14 - direction
      ?mode14 - mode
    )
    :precondition
    (
    )
    :subtasks
    (
      ( Get_Image ?dir0 ?mode0 )
      ( Get_Image ?dir1 ?mode1 )
      ( Get_Image ?dir2 ?mode2 )
      ( Get_Image ?dir3 ?mode3 )
      ( Get_Image ?dir4 ?mode4 )
      ( Get_Image ?dir5 ?mode5 )
      ( Get_Image ?dir6 ?mode6 )
      ( Get_Image ?dir7 ?mode7 )
      ( Get_Image ?dir8 ?mode8 )
      ( Get_Image ?dir9 ?mode9 )
      ( Get_Image ?dir10 ?mode10 )
      ( Get_Image ?dir11 ?mode11 )
      ( Get_Image ?dir12 ?mode12 )
      ( Get_Image ?dir13 ?mode13 )
      ( Get_Image ?dir14 ?mode14 )
    )
  )
)