( define ( domain satellite )
  ( :requirements :strips :typing :equality :htn )
  ( :types direction instrument mode satellite )
  ( :predicates
    ( ON_BOARD ?i - INSTRUMENT ?s - SATELLITE )
    ( SUPPORTS ?i - INSTRUMENT ?m - MODE )
    ( POINTING ?s - SATELLITE ?d - DIRECTION )
    ( POWER_AVAIL ?s - SATELLITE )
    ( POWER_ON ?i - INSTRUMENT )
    ( CALIBRATED ?i - INSTRUMENT )
    ( NOT_CALIBRATED ?i - INSTRUMENT )
    ( HAVE_IMAGE ?d - DIRECTION ?m - MODE )
    ( CALIBRATION_TARGET ?i - INSTRUMENT ?d - DIRECTION )
  )
  ( :action !TURN_TO
    :parameters
    (
      ?s - SATELLITE
      ?d_new - DIRECTION
      ?d_prev - DIRECTION
    )
    :precondition
    ( and ( POINTING ?s ?d_prev ) ( not ( = ?d_new ?d_prev ) ) )
    :effect
    ( and ( POINTING ?s ?d_new ) ( not ( POINTING ?s ?d_prev ) ) )
  )
  ( :action !SWITCH_ON
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_AVAIL ?s ) )
    :effect
    ( and ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) ( not ( CALIBRATED ?i ) ) ( not ( POWER_AVAIL ?s ) ) )
  )
  ( :action !SWITCH_OFF
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_ON ?i ) )
    :effect
    ( and ( POWER_AVAIL ?s ) ( not ( POWER_ON ?i ) ) )
  )
  ( :action !CALIBRATE
    :parameters
    (
      ?s - SATELLITE
      ?i - INSTRUMENT
      ?d - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( CALIBRATION_TARGET ?i ?d ) ( POINTING ?s ?d ) ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) )
    :effect
    ( and ( CALIBRATED ?i ) ( not ( NOT_CALIBRATED ?i ) ) )
  )
  ( :action !TAKE_IMAGE
    :parameters
    (
      ?s - SATELLITE
      ?d - DIRECTION
      ?i - INSTRUMENT
      ?m - MODE
    )
    :precondition
    ( and ( CALIBRATED ?i ) ( ON_BOARD ?i ?s ) ( SUPPORTS ?i ?m ) ( POWER_ON ?i ) ( POINTING ?s ?d ) ( POWER_ON ?i ) )
    :effect
    ( and ( HAVE_IMAGE ?d ?m ) )
  )
  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - DIRECTION
      ?goal_mode - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir ?goal_mode ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) )
    :subtasks
    (  )
  )

  ( :method GET-2IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) )
    :subtasks
    (  )
  )

  ( :method GET-3IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
      ?goal_dir3 - DIRECTION
      ?goal_mode3 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) )
    :subtasks
    (  )
  )

  ( :method GET-4IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
      ?goal_dir3 - DIRECTION
      ?goal_mode3 - MODE
      ?goal_dir4 - DIRECTION
      ?goal_mode4 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) ( HAVE_IMAGE ?goal_dir4 ?goal_mode4 ) )
    :subtasks
    (  )
  )

  ( :method GET-5IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
      ?goal_dir3 - DIRECTION
      ?goal_mode3 - MODE
      ?goal_dir4 - DIRECTION
      ?goal_mode4 - MODE
      ?goal_dir5 - DIRECTION
      ?goal_mode5 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) ( HAVE_IMAGE ?goal_dir4 ?goal_mode4 ) ( HAVE_IMAGE ?goal_dir5 ?goal_mode5 ) )
    :subtasks
    (  )
  )

  ( :method GET-6IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
      ?goal_dir3 - DIRECTION
      ?goal_mode3 - MODE
      ?goal_dir4 - DIRECTION
      ?goal_mode4 - MODE
      ?goal_dir5 - DIRECTION
      ?goal_mode5 - MODE
      ?goal_dir6 - DIRECTION
      ?goal_mode6 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) ( HAVE_IMAGE ?goal_dir4 ?goal_mode4 ) ( HAVE_IMAGE ?goal_dir5 ?goal_mode5 ) ( HAVE_IMAGE ?goal_dir6 ?goal_mode6 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_369632 - DIRECTION
      ?auto_369633 - MODE
    )
    :vars
    (
      ?auto_369634 - INSTRUMENT
      ?auto_369635 - SATELLITE
      ?auto_369636 - DIRECTION
      ?auto_369637 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_369634 ?auto_369635 ) ( SUPPORTS ?auto_369634 ?auto_369633 ) ( not ( = ?auto_369632 ?auto_369636 ) ) ( CALIBRATION_TARGET ?auto_369634 ?auto_369636 ) ( POWER_AVAIL ?auto_369635 ) ( POINTING ?auto_369635 ?auto_369637 ) ( not ( = ?auto_369636 ?auto_369637 ) ) ( not ( = ?auto_369632 ?auto_369637 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_369635 ?auto_369636 ?auto_369637 )
      ( !SWITCH_ON ?auto_369634 ?auto_369635 )
      ( !CALIBRATE ?auto_369635 ?auto_369634 ?auto_369636 )
      ( !TURN_TO ?auto_369635 ?auto_369632 ?auto_369636 )
      ( !TAKE_IMAGE ?auto_369635 ?auto_369632 ?auto_369634 ?auto_369633 )
      ( GET-1IMAGE-VERIFY ?auto_369632 ?auto_369633 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_369640 - DIRECTION
      ?auto_369641 - MODE
    )
    :vars
    (
      ?auto_369642 - INSTRUMENT
      ?auto_369643 - SATELLITE
      ?auto_369644 - DIRECTION
      ?auto_369645 - DIRECTION
      ?auto_369646 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_369642 ?auto_369643 ) ( SUPPORTS ?auto_369642 ?auto_369641 ) ( not ( = ?auto_369640 ?auto_369644 ) ) ( CALIBRATION_TARGET ?auto_369642 ?auto_369644 ) ( POINTING ?auto_369643 ?auto_369645 ) ( not ( = ?auto_369644 ?auto_369645 ) ) ( ON_BOARD ?auto_369646 ?auto_369643 ) ( POWER_ON ?auto_369646 ) ( not ( = ?auto_369640 ?auto_369645 ) ) ( not ( = ?auto_369642 ?auto_369646 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_369646 ?auto_369643 )
      ( !TURN_TO ?auto_369643 ?auto_369644 ?auto_369645 )
      ( !SWITCH_ON ?auto_369642 ?auto_369643 )
      ( !CALIBRATE ?auto_369643 ?auto_369642 ?auto_369644 )
      ( !TURN_TO ?auto_369643 ?auto_369640 ?auto_369644 )
      ( !TAKE_IMAGE ?auto_369643 ?auto_369640 ?auto_369642 ?auto_369641 )
      ( GET-1IMAGE-VERIFY ?auto_369640 ?auto_369641 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_369659 - DIRECTION
      ?auto_369660 - MODE
      ?auto_369662 - DIRECTION
      ?auto_369661 - MODE
    )
    :vars
    (
      ?auto_369665 - INSTRUMENT
      ?auto_369663 - SATELLITE
      ?auto_369666 - DIRECTION
      ?auto_369664 - INSTRUMENT
      ?auto_369667 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_369662 ?auto_369659 ) ) ( ON_BOARD ?auto_369665 ?auto_369663 ) ( SUPPORTS ?auto_369665 ?auto_369661 ) ( not ( = ?auto_369662 ?auto_369666 ) ) ( CALIBRATION_TARGET ?auto_369665 ?auto_369666 ) ( not ( = ?auto_369666 ?auto_369659 ) ) ( ON_BOARD ?auto_369664 ?auto_369663 ) ( not ( = ?auto_369665 ?auto_369664 ) ) ( SUPPORTS ?auto_369664 ?auto_369660 ) ( CALIBRATION_TARGET ?auto_369664 ?auto_369666 ) ( POWER_AVAIL ?auto_369663 ) ( POINTING ?auto_369663 ?auto_369667 ) ( not ( = ?auto_369666 ?auto_369667 ) ) ( not ( = ?auto_369659 ?auto_369667 ) ) ( not ( = ?auto_369660 ?auto_369661 ) ) ( not ( = ?auto_369662 ?auto_369667 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_369659 ?auto_369660 )
      ( GET-1IMAGE ?auto_369662 ?auto_369661 )
      ( GET-2IMAGE-VERIFY ?auto_369659 ?auto_369660 ?auto_369662 ?auto_369661 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_369820 - DIRECTION
      ?auto_369821 - MODE
      ?auto_369823 - DIRECTION
      ?auto_369822 - MODE
      ?auto_369824 - DIRECTION
      ?auto_369825 - MODE
    )
    :vars
    (
      ?auto_369826 - INSTRUMENT
      ?auto_369828 - SATELLITE
      ?auto_369829 - DIRECTION
      ?auto_369827 - INSTRUMENT
      ?auto_369830 - INSTRUMENT
      ?auto_369831 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_369823 ?auto_369820 ) ) ( not ( = ?auto_369824 ?auto_369820 ) ) ( not ( = ?auto_369824 ?auto_369823 ) ) ( ON_BOARD ?auto_369826 ?auto_369828 ) ( SUPPORTS ?auto_369826 ?auto_369825 ) ( not ( = ?auto_369824 ?auto_369829 ) ) ( CALIBRATION_TARGET ?auto_369826 ?auto_369829 ) ( not ( = ?auto_369829 ?auto_369823 ) ) ( ON_BOARD ?auto_369827 ?auto_369828 ) ( not ( = ?auto_369826 ?auto_369827 ) ) ( SUPPORTS ?auto_369827 ?auto_369822 ) ( CALIBRATION_TARGET ?auto_369827 ?auto_369829 ) ( not ( = ?auto_369829 ?auto_369820 ) ) ( ON_BOARD ?auto_369830 ?auto_369828 ) ( not ( = ?auto_369827 ?auto_369830 ) ) ( SUPPORTS ?auto_369830 ?auto_369821 ) ( CALIBRATION_TARGET ?auto_369830 ?auto_369829 ) ( POWER_AVAIL ?auto_369828 ) ( POINTING ?auto_369828 ?auto_369831 ) ( not ( = ?auto_369829 ?auto_369831 ) ) ( not ( = ?auto_369820 ?auto_369831 ) ) ( not ( = ?auto_369821 ?auto_369822 ) ) ( not ( = ?auto_369823 ?auto_369831 ) ) ( not ( = ?auto_369821 ?auto_369825 ) ) ( not ( = ?auto_369822 ?auto_369825 ) ) ( not ( = ?auto_369824 ?auto_369831 ) ) ( not ( = ?auto_369826 ?auto_369830 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_369820 ?auto_369821 ?auto_369823 ?auto_369822 )
      ( GET-1IMAGE ?auto_369824 ?auto_369825 )
      ( GET-3IMAGE-VERIFY ?auto_369820 ?auto_369821 ?auto_369823 ?auto_369822 ?auto_369824 ?auto_369825 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_371600 - DIRECTION
      ?auto_371601 - MODE
      ?auto_371603 - DIRECTION
      ?auto_371602 - MODE
      ?auto_371604 - DIRECTION
      ?auto_371605 - MODE
      ?auto_371606 - DIRECTION
      ?auto_371607 - MODE
    )
    :vars
    (
      ?auto_371608 - INSTRUMENT
      ?auto_371610 - SATELLITE
      ?auto_371611 - DIRECTION
      ?auto_371609 - INSTRUMENT
      ?auto_371613 - INSTRUMENT
      ?auto_371612 - INSTRUMENT
      ?auto_371614 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_371603 ?auto_371600 ) ) ( not ( = ?auto_371604 ?auto_371600 ) ) ( not ( = ?auto_371604 ?auto_371603 ) ) ( not ( = ?auto_371606 ?auto_371600 ) ) ( not ( = ?auto_371606 ?auto_371603 ) ) ( not ( = ?auto_371606 ?auto_371604 ) ) ( ON_BOARD ?auto_371608 ?auto_371610 ) ( SUPPORTS ?auto_371608 ?auto_371607 ) ( not ( = ?auto_371606 ?auto_371611 ) ) ( CALIBRATION_TARGET ?auto_371608 ?auto_371611 ) ( not ( = ?auto_371611 ?auto_371604 ) ) ( ON_BOARD ?auto_371609 ?auto_371610 ) ( not ( = ?auto_371608 ?auto_371609 ) ) ( SUPPORTS ?auto_371609 ?auto_371605 ) ( CALIBRATION_TARGET ?auto_371609 ?auto_371611 ) ( not ( = ?auto_371611 ?auto_371603 ) ) ( ON_BOARD ?auto_371613 ?auto_371610 ) ( not ( = ?auto_371609 ?auto_371613 ) ) ( SUPPORTS ?auto_371613 ?auto_371602 ) ( CALIBRATION_TARGET ?auto_371613 ?auto_371611 ) ( not ( = ?auto_371611 ?auto_371600 ) ) ( ON_BOARD ?auto_371612 ?auto_371610 ) ( not ( = ?auto_371613 ?auto_371612 ) ) ( SUPPORTS ?auto_371612 ?auto_371601 ) ( CALIBRATION_TARGET ?auto_371612 ?auto_371611 ) ( POWER_AVAIL ?auto_371610 ) ( POINTING ?auto_371610 ?auto_371614 ) ( not ( = ?auto_371611 ?auto_371614 ) ) ( not ( = ?auto_371600 ?auto_371614 ) ) ( not ( = ?auto_371601 ?auto_371602 ) ) ( not ( = ?auto_371603 ?auto_371614 ) ) ( not ( = ?auto_371601 ?auto_371605 ) ) ( not ( = ?auto_371602 ?auto_371605 ) ) ( not ( = ?auto_371604 ?auto_371614 ) ) ( not ( = ?auto_371609 ?auto_371612 ) ) ( not ( = ?auto_371601 ?auto_371607 ) ) ( not ( = ?auto_371602 ?auto_371607 ) ) ( not ( = ?auto_371605 ?auto_371607 ) ) ( not ( = ?auto_371606 ?auto_371614 ) ) ( not ( = ?auto_371608 ?auto_371613 ) ) ( not ( = ?auto_371608 ?auto_371612 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_371600 ?auto_371601 ?auto_371603 ?auto_371602 ?auto_371604 ?auto_371605 )
      ( GET-1IMAGE ?auto_371606 ?auto_371607 )
      ( GET-4IMAGE-VERIFY ?auto_371600 ?auto_371601 ?auto_371603 ?auto_371602 ?auto_371604 ?auto_371605 ?auto_371606 ?auto_371607 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_397074 - DIRECTION
      ?auto_397075 - MODE
      ?auto_397077 - DIRECTION
      ?auto_397076 - MODE
      ?auto_397078 - DIRECTION
      ?auto_397079 - MODE
      ?auto_397080 - DIRECTION
      ?auto_397081 - MODE
      ?auto_397083 - DIRECTION
      ?auto_397082 - MODE
    )
    :vars
    (
      ?auto_397084 - INSTRUMENT
      ?auto_397087 - SATELLITE
      ?auto_397086 - DIRECTION
      ?auto_397085 - INSTRUMENT
      ?auto_397089 - INSTRUMENT
      ?auto_397090 - INSTRUMENT
      ?auto_397091 - INSTRUMENT
      ?auto_397088 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_397077 ?auto_397074 ) ) ( not ( = ?auto_397078 ?auto_397074 ) ) ( not ( = ?auto_397078 ?auto_397077 ) ) ( not ( = ?auto_397080 ?auto_397074 ) ) ( not ( = ?auto_397080 ?auto_397077 ) ) ( not ( = ?auto_397080 ?auto_397078 ) ) ( not ( = ?auto_397083 ?auto_397074 ) ) ( not ( = ?auto_397083 ?auto_397077 ) ) ( not ( = ?auto_397083 ?auto_397078 ) ) ( not ( = ?auto_397083 ?auto_397080 ) ) ( ON_BOARD ?auto_397084 ?auto_397087 ) ( SUPPORTS ?auto_397084 ?auto_397082 ) ( not ( = ?auto_397083 ?auto_397086 ) ) ( CALIBRATION_TARGET ?auto_397084 ?auto_397086 ) ( not ( = ?auto_397086 ?auto_397080 ) ) ( ON_BOARD ?auto_397085 ?auto_397087 ) ( not ( = ?auto_397084 ?auto_397085 ) ) ( SUPPORTS ?auto_397085 ?auto_397081 ) ( CALIBRATION_TARGET ?auto_397085 ?auto_397086 ) ( not ( = ?auto_397086 ?auto_397078 ) ) ( ON_BOARD ?auto_397089 ?auto_397087 ) ( not ( = ?auto_397085 ?auto_397089 ) ) ( SUPPORTS ?auto_397089 ?auto_397079 ) ( CALIBRATION_TARGET ?auto_397089 ?auto_397086 ) ( not ( = ?auto_397086 ?auto_397077 ) ) ( ON_BOARD ?auto_397090 ?auto_397087 ) ( not ( = ?auto_397089 ?auto_397090 ) ) ( SUPPORTS ?auto_397090 ?auto_397076 ) ( CALIBRATION_TARGET ?auto_397090 ?auto_397086 ) ( not ( = ?auto_397086 ?auto_397074 ) ) ( ON_BOARD ?auto_397091 ?auto_397087 ) ( not ( = ?auto_397090 ?auto_397091 ) ) ( SUPPORTS ?auto_397091 ?auto_397075 ) ( CALIBRATION_TARGET ?auto_397091 ?auto_397086 ) ( POWER_AVAIL ?auto_397087 ) ( POINTING ?auto_397087 ?auto_397088 ) ( not ( = ?auto_397086 ?auto_397088 ) ) ( not ( = ?auto_397074 ?auto_397088 ) ) ( not ( = ?auto_397075 ?auto_397076 ) ) ( not ( = ?auto_397077 ?auto_397088 ) ) ( not ( = ?auto_397075 ?auto_397079 ) ) ( not ( = ?auto_397076 ?auto_397079 ) ) ( not ( = ?auto_397078 ?auto_397088 ) ) ( not ( = ?auto_397089 ?auto_397091 ) ) ( not ( = ?auto_397075 ?auto_397081 ) ) ( not ( = ?auto_397076 ?auto_397081 ) ) ( not ( = ?auto_397079 ?auto_397081 ) ) ( not ( = ?auto_397080 ?auto_397088 ) ) ( not ( = ?auto_397085 ?auto_397090 ) ) ( not ( = ?auto_397085 ?auto_397091 ) ) ( not ( = ?auto_397075 ?auto_397082 ) ) ( not ( = ?auto_397076 ?auto_397082 ) ) ( not ( = ?auto_397079 ?auto_397082 ) ) ( not ( = ?auto_397081 ?auto_397082 ) ) ( not ( = ?auto_397083 ?auto_397088 ) ) ( not ( = ?auto_397084 ?auto_397089 ) ) ( not ( = ?auto_397084 ?auto_397090 ) ) ( not ( = ?auto_397084 ?auto_397091 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_397074 ?auto_397075 ?auto_397077 ?auto_397076 ?auto_397078 ?auto_397079 ?auto_397080 ?auto_397081 )
      ( GET-1IMAGE ?auto_397083 ?auto_397082 )
      ( GET-5IMAGE-VERIFY ?auto_397074 ?auto_397075 ?auto_397077 ?auto_397076 ?auto_397078 ?auto_397079 ?auto_397080 ?auto_397081 ?auto_397083 ?auto_397082 ) )
  )

  ( :method GET-6IMAGE
    :parameters
    (
      ?auto_833299 - DIRECTION
      ?auto_833300 - MODE
      ?auto_833302 - DIRECTION
      ?auto_833301 - MODE
      ?auto_833303 - DIRECTION
      ?auto_833304 - MODE
      ?auto_833305 - DIRECTION
      ?auto_833306 - MODE
      ?auto_833308 - DIRECTION
      ?auto_833307 - MODE
      ?auto_833309 - DIRECTION
      ?auto_833310 - MODE
    )
    :vars
    (
      ?auto_833311 - INSTRUMENT
      ?auto_833314 - SATELLITE
      ?auto_833313 - DIRECTION
      ?auto_833312 - INSTRUMENT
      ?auto_833318 - INSTRUMENT
      ?auto_833315 - INSTRUMENT
      ?auto_833316 - INSTRUMENT
      ?auto_833317 - INSTRUMENT
      ?auto_833319 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_833302 ?auto_833299 ) ) ( not ( = ?auto_833303 ?auto_833299 ) ) ( not ( = ?auto_833303 ?auto_833302 ) ) ( not ( = ?auto_833305 ?auto_833299 ) ) ( not ( = ?auto_833305 ?auto_833302 ) ) ( not ( = ?auto_833305 ?auto_833303 ) ) ( not ( = ?auto_833308 ?auto_833299 ) ) ( not ( = ?auto_833308 ?auto_833302 ) ) ( not ( = ?auto_833308 ?auto_833303 ) ) ( not ( = ?auto_833308 ?auto_833305 ) ) ( not ( = ?auto_833309 ?auto_833299 ) ) ( not ( = ?auto_833309 ?auto_833302 ) ) ( not ( = ?auto_833309 ?auto_833303 ) ) ( not ( = ?auto_833309 ?auto_833305 ) ) ( not ( = ?auto_833309 ?auto_833308 ) ) ( ON_BOARD ?auto_833311 ?auto_833314 ) ( SUPPORTS ?auto_833311 ?auto_833310 ) ( not ( = ?auto_833309 ?auto_833313 ) ) ( CALIBRATION_TARGET ?auto_833311 ?auto_833313 ) ( not ( = ?auto_833313 ?auto_833308 ) ) ( ON_BOARD ?auto_833312 ?auto_833314 ) ( not ( = ?auto_833311 ?auto_833312 ) ) ( SUPPORTS ?auto_833312 ?auto_833307 ) ( CALIBRATION_TARGET ?auto_833312 ?auto_833313 ) ( not ( = ?auto_833313 ?auto_833305 ) ) ( ON_BOARD ?auto_833318 ?auto_833314 ) ( not ( = ?auto_833312 ?auto_833318 ) ) ( SUPPORTS ?auto_833318 ?auto_833306 ) ( CALIBRATION_TARGET ?auto_833318 ?auto_833313 ) ( not ( = ?auto_833313 ?auto_833303 ) ) ( ON_BOARD ?auto_833315 ?auto_833314 ) ( not ( = ?auto_833318 ?auto_833315 ) ) ( SUPPORTS ?auto_833315 ?auto_833304 ) ( CALIBRATION_TARGET ?auto_833315 ?auto_833313 ) ( not ( = ?auto_833313 ?auto_833302 ) ) ( ON_BOARD ?auto_833316 ?auto_833314 ) ( not ( = ?auto_833315 ?auto_833316 ) ) ( SUPPORTS ?auto_833316 ?auto_833301 ) ( CALIBRATION_TARGET ?auto_833316 ?auto_833313 ) ( not ( = ?auto_833313 ?auto_833299 ) ) ( ON_BOARD ?auto_833317 ?auto_833314 ) ( not ( = ?auto_833316 ?auto_833317 ) ) ( SUPPORTS ?auto_833317 ?auto_833300 ) ( CALIBRATION_TARGET ?auto_833317 ?auto_833313 ) ( POWER_AVAIL ?auto_833314 ) ( POINTING ?auto_833314 ?auto_833319 ) ( not ( = ?auto_833313 ?auto_833319 ) ) ( not ( = ?auto_833299 ?auto_833319 ) ) ( not ( = ?auto_833300 ?auto_833301 ) ) ( not ( = ?auto_833302 ?auto_833319 ) ) ( not ( = ?auto_833300 ?auto_833304 ) ) ( not ( = ?auto_833301 ?auto_833304 ) ) ( not ( = ?auto_833303 ?auto_833319 ) ) ( not ( = ?auto_833315 ?auto_833317 ) ) ( not ( = ?auto_833300 ?auto_833306 ) ) ( not ( = ?auto_833301 ?auto_833306 ) ) ( not ( = ?auto_833304 ?auto_833306 ) ) ( not ( = ?auto_833305 ?auto_833319 ) ) ( not ( = ?auto_833318 ?auto_833316 ) ) ( not ( = ?auto_833318 ?auto_833317 ) ) ( not ( = ?auto_833300 ?auto_833307 ) ) ( not ( = ?auto_833301 ?auto_833307 ) ) ( not ( = ?auto_833304 ?auto_833307 ) ) ( not ( = ?auto_833306 ?auto_833307 ) ) ( not ( = ?auto_833308 ?auto_833319 ) ) ( not ( = ?auto_833312 ?auto_833315 ) ) ( not ( = ?auto_833312 ?auto_833316 ) ) ( not ( = ?auto_833312 ?auto_833317 ) ) ( not ( = ?auto_833300 ?auto_833310 ) ) ( not ( = ?auto_833301 ?auto_833310 ) ) ( not ( = ?auto_833304 ?auto_833310 ) ) ( not ( = ?auto_833306 ?auto_833310 ) ) ( not ( = ?auto_833307 ?auto_833310 ) ) ( not ( = ?auto_833309 ?auto_833319 ) ) ( not ( = ?auto_833311 ?auto_833318 ) ) ( not ( = ?auto_833311 ?auto_833315 ) ) ( not ( = ?auto_833311 ?auto_833316 ) ) ( not ( = ?auto_833311 ?auto_833317 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_833299 ?auto_833300 ?auto_833302 ?auto_833301 ?auto_833303 ?auto_833304 ?auto_833305 ?auto_833306 ?auto_833308 ?auto_833307 )
      ( GET-1IMAGE ?auto_833309 ?auto_833310 )
      ( GET-6IMAGE-VERIFY ?auto_833299 ?auto_833300 ?auto_833302 ?auto_833301 ?auto_833303 ?auto_833304 ?auto_833305 ?auto_833306 ?auto_833308 ?auto_833307 ?auto_833309 ?auto_833310 ) )
  )

)

