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

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_357230 - DIRECTION
      ?auto_357231 - MODE
    )
    :vars
    (
      ?auto_357232 - INSTRUMENT
      ?auto_357233 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_357232 ) ( ON_BOARD ?auto_357232 ?auto_357233 ) ( SUPPORTS ?auto_357232 ?auto_357231 ) ( POWER_ON ?auto_357232 ) ( POINTING ?auto_357233 ?auto_357230 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_357233 ?auto_357230 ?auto_357232 ?auto_357231 )
      ( GET-1IMAGE-VERIFY ?auto_357230 ?auto_357231 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_357258 - DIRECTION
      ?auto_357259 - MODE
    )
    :vars
    (
      ?auto_357261 - INSTRUMENT
      ?auto_357260 - SATELLITE
      ?auto_357262 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_357261 ) ( ON_BOARD ?auto_357261 ?auto_357260 ) ( SUPPORTS ?auto_357261 ?auto_357259 ) ( POWER_ON ?auto_357261 ) ( POINTING ?auto_357260 ?auto_357262 ) ( not ( = ?auto_357258 ?auto_357262 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_357260 ?auto_357258 ?auto_357262 )
      ( GET-1IMAGE ?auto_357258 ?auto_357259 )
      ( GET-1IMAGE-VERIFY ?auto_357258 ?auto_357259 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_357290 - DIRECTION
      ?auto_357291 - MODE
    )
    :vars
    (
      ?auto_357293 - INSTRUMENT
      ?auto_357292 - SATELLITE
      ?auto_357294 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357293 ?auto_357292 ) ( SUPPORTS ?auto_357293 ?auto_357291 ) ( POWER_ON ?auto_357293 ) ( POINTING ?auto_357292 ?auto_357294 ) ( not ( = ?auto_357290 ?auto_357294 ) ) ( CALIBRATION_TARGET ?auto_357293 ?auto_357294 ) ( NOT_CALIBRATED ?auto_357293 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_357292 ?auto_357293 ?auto_357294 )
      ( GET-1IMAGE ?auto_357290 ?auto_357291 )
      ( GET-1IMAGE-VERIFY ?auto_357290 ?auto_357291 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_357322 - DIRECTION
      ?auto_357323 - MODE
    )
    :vars
    (
      ?auto_357326 - INSTRUMENT
      ?auto_357324 - SATELLITE
      ?auto_357325 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357326 ?auto_357324 ) ( SUPPORTS ?auto_357326 ?auto_357323 ) ( POINTING ?auto_357324 ?auto_357325 ) ( not ( = ?auto_357322 ?auto_357325 ) ) ( CALIBRATION_TARGET ?auto_357326 ?auto_357325 ) ( POWER_AVAIL ?auto_357324 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_357326 ?auto_357324 )
      ( GET-1IMAGE ?auto_357322 ?auto_357323 )
      ( GET-1IMAGE-VERIFY ?auto_357322 ?auto_357323 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_357354 - DIRECTION
      ?auto_357355 - MODE
    )
    :vars
    (
      ?auto_357357 - INSTRUMENT
      ?auto_357356 - SATELLITE
      ?auto_357358 - DIRECTION
      ?auto_357359 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357357 ?auto_357356 ) ( SUPPORTS ?auto_357357 ?auto_357355 ) ( not ( = ?auto_357354 ?auto_357358 ) ) ( CALIBRATION_TARGET ?auto_357357 ?auto_357358 ) ( POWER_AVAIL ?auto_357356 ) ( POINTING ?auto_357356 ?auto_357359 ) ( not ( = ?auto_357358 ?auto_357359 ) ) ( not ( = ?auto_357354 ?auto_357359 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_357356 ?auto_357358 ?auto_357359 )
      ( GET-1IMAGE ?auto_357354 ?auto_357355 )
      ( GET-1IMAGE-VERIFY ?auto_357354 ?auto_357355 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_357571 - DIRECTION
      ?auto_357572 - MODE
      ?auto_357573 - DIRECTION
      ?auto_357570 - MODE
    )
    :vars
    (
      ?auto_357575 - INSTRUMENT
      ?auto_357574 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_357573 ?auto_357571 ) ) ( CALIBRATED ?auto_357575 ) ( ON_BOARD ?auto_357575 ?auto_357574 ) ( SUPPORTS ?auto_357575 ?auto_357570 ) ( POWER_ON ?auto_357575 ) ( POINTING ?auto_357574 ?auto_357573 ) ( HAVE_IMAGE ?auto_357571 ?auto_357572 ) ( not ( = ?auto_357572 ?auto_357570 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_357573 ?auto_357570 )
      ( GET-2IMAGE-VERIFY ?auto_357571 ?auto_357572 ?auto_357573 ?auto_357570 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_357577 - DIRECTION
      ?auto_357578 - MODE
      ?auto_357579 - DIRECTION
      ?auto_357576 - MODE
    )
    :vars
    (
      ?auto_357581 - INSTRUMENT
      ?auto_357580 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_357579 ?auto_357577 ) ) ( CALIBRATED ?auto_357581 ) ( ON_BOARD ?auto_357581 ?auto_357580 ) ( SUPPORTS ?auto_357581 ?auto_357578 ) ( POWER_ON ?auto_357581 ) ( POINTING ?auto_357580 ?auto_357577 ) ( HAVE_IMAGE ?auto_357579 ?auto_357576 ) ( not ( = ?auto_357578 ?auto_357576 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_357577 ?auto_357578 )
      ( GET-2IMAGE-VERIFY ?auto_357577 ?auto_357578 ?auto_357579 ?auto_357576 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_357800 - DIRECTION
      ?auto_357801 - MODE
      ?auto_357802 - DIRECTION
      ?auto_357799 - MODE
    )
    :vars
    (
      ?auto_357805 - INSTRUMENT
      ?auto_357803 - SATELLITE
      ?auto_357804 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_357802 ?auto_357800 ) ) ( CALIBRATED ?auto_357805 ) ( ON_BOARD ?auto_357805 ?auto_357803 ) ( SUPPORTS ?auto_357805 ?auto_357799 ) ( POWER_ON ?auto_357805 ) ( POINTING ?auto_357803 ?auto_357804 ) ( not ( = ?auto_357802 ?auto_357804 ) ) ( HAVE_IMAGE ?auto_357800 ?auto_357801 ) ( not ( = ?auto_357800 ?auto_357804 ) ) ( not ( = ?auto_357801 ?auto_357799 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_357802 ?auto_357799 )
      ( GET-2IMAGE-VERIFY ?auto_357800 ?auto_357801 ?auto_357802 ?auto_357799 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_357807 - DIRECTION
      ?auto_357808 - MODE
      ?auto_357809 - DIRECTION
      ?auto_357806 - MODE
    )
    :vars
    (
      ?auto_357810 - INSTRUMENT
      ?auto_357812 - SATELLITE
      ?auto_357811 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_357809 ?auto_357807 ) ) ( CALIBRATED ?auto_357810 ) ( ON_BOARD ?auto_357810 ?auto_357812 ) ( SUPPORTS ?auto_357810 ?auto_357808 ) ( POWER_ON ?auto_357810 ) ( POINTING ?auto_357812 ?auto_357811 ) ( not ( = ?auto_357807 ?auto_357811 ) ) ( HAVE_IMAGE ?auto_357809 ?auto_357806 ) ( not ( = ?auto_357809 ?auto_357811 ) ) ( not ( = ?auto_357806 ?auto_357808 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357809 ?auto_357806 ?auto_357807 ?auto_357808 )
      ( GET-2IMAGE-VERIFY ?auto_357807 ?auto_357808 ?auto_357809 ?auto_357806 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_358054 - DIRECTION
      ?auto_358055 - MODE
    )
    :vars
    (
      ?auto_358058 - DIRECTION
      ?auto_358057 - INSTRUMENT
      ?auto_358060 - SATELLITE
      ?auto_358059 - DIRECTION
      ?auto_358056 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_358054 ?auto_358058 ) ) ( ON_BOARD ?auto_358057 ?auto_358060 ) ( SUPPORTS ?auto_358057 ?auto_358055 ) ( POWER_ON ?auto_358057 ) ( POINTING ?auto_358060 ?auto_358059 ) ( not ( = ?auto_358054 ?auto_358059 ) ) ( HAVE_IMAGE ?auto_358058 ?auto_358056 ) ( not ( = ?auto_358058 ?auto_358059 ) ) ( not ( = ?auto_358056 ?auto_358055 ) ) ( CALIBRATION_TARGET ?auto_358057 ?auto_358059 ) ( NOT_CALIBRATED ?auto_358057 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_358060 ?auto_358057 ?auto_358059 )
      ( GET-2IMAGE ?auto_358058 ?auto_358056 ?auto_358054 ?auto_358055 )
      ( GET-1IMAGE-VERIFY ?auto_358054 ?auto_358055 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_358062 - DIRECTION
      ?auto_358063 - MODE
      ?auto_358064 - DIRECTION
      ?auto_358061 - MODE
    )
    :vars
    (
      ?auto_358066 - INSTRUMENT
      ?auto_358065 - SATELLITE
      ?auto_358067 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_358064 ?auto_358062 ) ) ( ON_BOARD ?auto_358066 ?auto_358065 ) ( SUPPORTS ?auto_358066 ?auto_358061 ) ( POWER_ON ?auto_358066 ) ( POINTING ?auto_358065 ?auto_358067 ) ( not ( = ?auto_358064 ?auto_358067 ) ) ( HAVE_IMAGE ?auto_358062 ?auto_358063 ) ( not ( = ?auto_358062 ?auto_358067 ) ) ( not ( = ?auto_358063 ?auto_358061 ) ) ( CALIBRATION_TARGET ?auto_358066 ?auto_358067 ) ( NOT_CALIBRATED ?auto_358066 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_358064 ?auto_358061 )
      ( GET-2IMAGE-VERIFY ?auto_358062 ?auto_358063 ?auto_358064 ?auto_358061 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_358069 - DIRECTION
      ?auto_358070 - MODE
      ?auto_358071 - DIRECTION
      ?auto_358068 - MODE
    )
    :vars
    (
      ?auto_358072 - INSTRUMENT
      ?auto_358074 - SATELLITE
      ?auto_358073 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_358071 ?auto_358069 ) ) ( ON_BOARD ?auto_358072 ?auto_358074 ) ( SUPPORTS ?auto_358072 ?auto_358070 ) ( POWER_ON ?auto_358072 ) ( POINTING ?auto_358074 ?auto_358073 ) ( not ( = ?auto_358069 ?auto_358073 ) ) ( HAVE_IMAGE ?auto_358071 ?auto_358068 ) ( not ( = ?auto_358071 ?auto_358073 ) ) ( not ( = ?auto_358068 ?auto_358070 ) ) ( CALIBRATION_TARGET ?auto_358072 ?auto_358073 ) ( NOT_CALIBRATED ?auto_358072 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358071 ?auto_358068 ?auto_358069 ?auto_358070 )
      ( GET-2IMAGE-VERIFY ?auto_358069 ?auto_358070 ?auto_358071 ?auto_358068 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_358316 - DIRECTION
      ?auto_358317 - MODE
    )
    :vars
    (
      ?auto_358318 - DIRECTION
      ?auto_358320 - INSTRUMENT
      ?auto_358322 - SATELLITE
      ?auto_358321 - DIRECTION
      ?auto_358319 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_358316 ?auto_358318 ) ) ( ON_BOARD ?auto_358320 ?auto_358322 ) ( SUPPORTS ?auto_358320 ?auto_358317 ) ( POINTING ?auto_358322 ?auto_358321 ) ( not ( = ?auto_358316 ?auto_358321 ) ) ( HAVE_IMAGE ?auto_358318 ?auto_358319 ) ( not ( = ?auto_358318 ?auto_358321 ) ) ( not ( = ?auto_358319 ?auto_358317 ) ) ( CALIBRATION_TARGET ?auto_358320 ?auto_358321 ) ( POWER_AVAIL ?auto_358322 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_358320 ?auto_358322 )
      ( GET-2IMAGE ?auto_358318 ?auto_358319 ?auto_358316 ?auto_358317 )
      ( GET-1IMAGE-VERIFY ?auto_358316 ?auto_358317 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_358324 - DIRECTION
      ?auto_358325 - MODE
      ?auto_358326 - DIRECTION
      ?auto_358323 - MODE
    )
    :vars
    (
      ?auto_358327 - INSTRUMENT
      ?auto_358328 - SATELLITE
      ?auto_358329 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_358326 ?auto_358324 ) ) ( ON_BOARD ?auto_358327 ?auto_358328 ) ( SUPPORTS ?auto_358327 ?auto_358323 ) ( POINTING ?auto_358328 ?auto_358329 ) ( not ( = ?auto_358326 ?auto_358329 ) ) ( HAVE_IMAGE ?auto_358324 ?auto_358325 ) ( not ( = ?auto_358324 ?auto_358329 ) ) ( not ( = ?auto_358325 ?auto_358323 ) ) ( CALIBRATION_TARGET ?auto_358327 ?auto_358329 ) ( POWER_AVAIL ?auto_358328 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_358326 ?auto_358323 )
      ( GET-2IMAGE-VERIFY ?auto_358324 ?auto_358325 ?auto_358326 ?auto_358323 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_358331 - DIRECTION
      ?auto_358332 - MODE
      ?auto_358333 - DIRECTION
      ?auto_358330 - MODE
    )
    :vars
    (
      ?auto_358334 - INSTRUMENT
      ?auto_358335 - SATELLITE
      ?auto_358336 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_358333 ?auto_358331 ) ) ( ON_BOARD ?auto_358334 ?auto_358335 ) ( SUPPORTS ?auto_358334 ?auto_358332 ) ( POINTING ?auto_358335 ?auto_358336 ) ( not ( = ?auto_358331 ?auto_358336 ) ) ( HAVE_IMAGE ?auto_358333 ?auto_358330 ) ( not ( = ?auto_358333 ?auto_358336 ) ) ( not ( = ?auto_358330 ?auto_358332 ) ) ( CALIBRATION_TARGET ?auto_358334 ?auto_358336 ) ( POWER_AVAIL ?auto_358335 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358333 ?auto_358330 ?auto_358331 ?auto_358332 )
      ( GET-2IMAGE-VERIFY ?auto_358331 ?auto_358332 ?auto_358333 ?auto_358330 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_358578 - DIRECTION
      ?auto_358579 - MODE
    )
    :vars
    (
      ?auto_358580 - DIRECTION
      ?auto_358581 - INSTRUMENT
      ?auto_358583 - SATELLITE
      ?auto_358584 - DIRECTION
      ?auto_358582 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_358578 ?auto_358580 ) ) ( ON_BOARD ?auto_358581 ?auto_358583 ) ( SUPPORTS ?auto_358581 ?auto_358579 ) ( not ( = ?auto_358578 ?auto_358584 ) ) ( HAVE_IMAGE ?auto_358580 ?auto_358582 ) ( not ( = ?auto_358580 ?auto_358584 ) ) ( not ( = ?auto_358582 ?auto_358579 ) ) ( CALIBRATION_TARGET ?auto_358581 ?auto_358584 ) ( POWER_AVAIL ?auto_358583 ) ( POINTING ?auto_358583 ?auto_358580 ) )
    :subtasks
    ( ( !TURN_TO ?auto_358583 ?auto_358584 ?auto_358580 )
      ( GET-2IMAGE ?auto_358580 ?auto_358582 ?auto_358578 ?auto_358579 )
      ( GET-1IMAGE-VERIFY ?auto_358578 ?auto_358579 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_358586 - DIRECTION
      ?auto_358587 - MODE
      ?auto_358588 - DIRECTION
      ?auto_358585 - MODE
    )
    :vars
    (
      ?auto_358590 - INSTRUMENT
      ?auto_358591 - SATELLITE
      ?auto_358589 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_358588 ?auto_358586 ) ) ( ON_BOARD ?auto_358590 ?auto_358591 ) ( SUPPORTS ?auto_358590 ?auto_358585 ) ( not ( = ?auto_358588 ?auto_358589 ) ) ( HAVE_IMAGE ?auto_358586 ?auto_358587 ) ( not ( = ?auto_358586 ?auto_358589 ) ) ( not ( = ?auto_358587 ?auto_358585 ) ) ( CALIBRATION_TARGET ?auto_358590 ?auto_358589 ) ( POWER_AVAIL ?auto_358591 ) ( POINTING ?auto_358591 ?auto_358586 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_358588 ?auto_358585 )
      ( GET-2IMAGE-VERIFY ?auto_358586 ?auto_358587 ?auto_358588 ?auto_358585 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_358593 - DIRECTION
      ?auto_358594 - MODE
      ?auto_358595 - DIRECTION
      ?auto_358592 - MODE
    )
    :vars
    (
      ?auto_358597 - INSTRUMENT
      ?auto_358596 - SATELLITE
      ?auto_358598 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_358595 ?auto_358593 ) ) ( ON_BOARD ?auto_358597 ?auto_358596 ) ( SUPPORTS ?auto_358597 ?auto_358594 ) ( not ( = ?auto_358593 ?auto_358598 ) ) ( HAVE_IMAGE ?auto_358595 ?auto_358592 ) ( not ( = ?auto_358595 ?auto_358598 ) ) ( not ( = ?auto_358592 ?auto_358594 ) ) ( CALIBRATION_TARGET ?auto_358597 ?auto_358598 ) ( POWER_AVAIL ?auto_358596 ) ( POINTING ?auto_358596 ?auto_358595 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358595 ?auto_358592 ?auto_358593 ?auto_358594 )
      ( GET-2IMAGE-VERIFY ?auto_358593 ?auto_358594 ?auto_358595 ?auto_358592 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_358840 - DIRECTION
      ?auto_358841 - MODE
    )
    :vars
    (
      ?auto_358846 - DIRECTION
      ?auto_358843 - INSTRUMENT
      ?auto_358842 - SATELLITE
      ?auto_358845 - DIRECTION
      ?auto_358844 - MODE
      ?auto_358847 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_358840 ?auto_358846 ) ) ( ON_BOARD ?auto_358843 ?auto_358842 ) ( SUPPORTS ?auto_358843 ?auto_358841 ) ( not ( = ?auto_358840 ?auto_358845 ) ) ( HAVE_IMAGE ?auto_358846 ?auto_358844 ) ( not ( = ?auto_358846 ?auto_358845 ) ) ( not ( = ?auto_358844 ?auto_358841 ) ) ( CALIBRATION_TARGET ?auto_358843 ?auto_358845 ) ( POINTING ?auto_358842 ?auto_358846 ) ( ON_BOARD ?auto_358847 ?auto_358842 ) ( POWER_ON ?auto_358847 ) ( not ( = ?auto_358843 ?auto_358847 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_358847 ?auto_358842 )
      ( GET-2IMAGE ?auto_358846 ?auto_358844 ?auto_358840 ?auto_358841 )
      ( GET-1IMAGE-VERIFY ?auto_358840 ?auto_358841 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_358849 - DIRECTION
      ?auto_358850 - MODE
      ?auto_358851 - DIRECTION
      ?auto_358848 - MODE
    )
    :vars
    (
      ?auto_358855 - INSTRUMENT
      ?auto_358854 - SATELLITE
      ?auto_358853 - DIRECTION
      ?auto_358852 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_358851 ?auto_358849 ) ) ( ON_BOARD ?auto_358855 ?auto_358854 ) ( SUPPORTS ?auto_358855 ?auto_358848 ) ( not ( = ?auto_358851 ?auto_358853 ) ) ( HAVE_IMAGE ?auto_358849 ?auto_358850 ) ( not ( = ?auto_358849 ?auto_358853 ) ) ( not ( = ?auto_358850 ?auto_358848 ) ) ( CALIBRATION_TARGET ?auto_358855 ?auto_358853 ) ( POINTING ?auto_358854 ?auto_358849 ) ( ON_BOARD ?auto_358852 ?auto_358854 ) ( POWER_ON ?auto_358852 ) ( not ( = ?auto_358855 ?auto_358852 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_358851 ?auto_358848 )
      ( GET-2IMAGE-VERIFY ?auto_358849 ?auto_358850 ?auto_358851 ?auto_358848 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_358857 - DIRECTION
      ?auto_358858 - MODE
      ?auto_358859 - DIRECTION
      ?auto_358856 - MODE
    )
    :vars
    (
      ?auto_358860 - INSTRUMENT
      ?auto_358863 - SATELLITE
      ?auto_358862 - DIRECTION
      ?auto_358861 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_358859 ?auto_358857 ) ) ( ON_BOARD ?auto_358860 ?auto_358863 ) ( SUPPORTS ?auto_358860 ?auto_358858 ) ( not ( = ?auto_358857 ?auto_358862 ) ) ( HAVE_IMAGE ?auto_358859 ?auto_358856 ) ( not ( = ?auto_358859 ?auto_358862 ) ) ( not ( = ?auto_358856 ?auto_358858 ) ) ( CALIBRATION_TARGET ?auto_358860 ?auto_358862 ) ( POINTING ?auto_358863 ?auto_358859 ) ( ON_BOARD ?auto_358861 ?auto_358863 ) ( POWER_ON ?auto_358861 ) ( not ( = ?auto_358860 ?auto_358861 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358859 ?auto_358856 ?auto_358857 ?auto_358858 )
      ( GET-2IMAGE-VERIFY ?auto_358857 ?auto_358858 ?auto_358859 ?auto_358856 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_359128 - DIRECTION
      ?auto_359129 - MODE
    )
    :vars
    (
      ?auto_359133 - DIRECTION
      ?auto_359130 - INSTRUMENT
      ?auto_359135 - SATELLITE
      ?auto_359134 - DIRECTION
      ?auto_359132 - MODE
      ?auto_359131 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_359128 ?auto_359133 ) ) ( ON_BOARD ?auto_359130 ?auto_359135 ) ( SUPPORTS ?auto_359130 ?auto_359129 ) ( not ( = ?auto_359128 ?auto_359134 ) ) ( not ( = ?auto_359133 ?auto_359134 ) ) ( not ( = ?auto_359132 ?auto_359129 ) ) ( CALIBRATION_TARGET ?auto_359130 ?auto_359134 ) ( POINTING ?auto_359135 ?auto_359133 ) ( ON_BOARD ?auto_359131 ?auto_359135 ) ( POWER_ON ?auto_359131 ) ( not ( = ?auto_359130 ?auto_359131 ) ) ( CALIBRATED ?auto_359131 ) ( SUPPORTS ?auto_359131 ?auto_359132 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_359133 ?auto_359132 )
      ( GET-2IMAGE ?auto_359133 ?auto_359132 ?auto_359128 ?auto_359129 )
      ( GET-1IMAGE-VERIFY ?auto_359128 ?auto_359129 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_359137 - DIRECTION
      ?auto_359138 - MODE
      ?auto_359139 - DIRECTION
      ?auto_359136 - MODE
    )
    :vars
    (
      ?auto_359141 - INSTRUMENT
      ?auto_359140 - SATELLITE
      ?auto_359142 - DIRECTION
      ?auto_359143 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_359139 ?auto_359137 ) ) ( ON_BOARD ?auto_359141 ?auto_359140 ) ( SUPPORTS ?auto_359141 ?auto_359136 ) ( not ( = ?auto_359139 ?auto_359142 ) ) ( not ( = ?auto_359137 ?auto_359142 ) ) ( not ( = ?auto_359138 ?auto_359136 ) ) ( CALIBRATION_TARGET ?auto_359141 ?auto_359142 ) ( POINTING ?auto_359140 ?auto_359137 ) ( ON_BOARD ?auto_359143 ?auto_359140 ) ( POWER_ON ?auto_359143 ) ( not ( = ?auto_359141 ?auto_359143 ) ) ( CALIBRATED ?auto_359143 ) ( SUPPORTS ?auto_359143 ?auto_359138 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_359139 ?auto_359136 )
      ( GET-2IMAGE-VERIFY ?auto_359137 ?auto_359138 ?auto_359139 ?auto_359136 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_359145 - DIRECTION
      ?auto_359146 - MODE
      ?auto_359147 - DIRECTION
      ?auto_359144 - MODE
    )
    :vars
    (
      ?auto_359151 - INSTRUMENT
      ?auto_359149 - SATELLITE
      ?auto_359148 - DIRECTION
      ?auto_359150 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_359147 ?auto_359145 ) ) ( ON_BOARD ?auto_359151 ?auto_359149 ) ( SUPPORTS ?auto_359151 ?auto_359146 ) ( not ( = ?auto_359145 ?auto_359148 ) ) ( not ( = ?auto_359147 ?auto_359148 ) ) ( not ( = ?auto_359144 ?auto_359146 ) ) ( CALIBRATION_TARGET ?auto_359151 ?auto_359148 ) ( POINTING ?auto_359149 ?auto_359147 ) ( ON_BOARD ?auto_359150 ?auto_359149 ) ( POWER_ON ?auto_359150 ) ( not ( = ?auto_359151 ?auto_359150 ) ) ( CALIBRATED ?auto_359150 ) ( SUPPORTS ?auto_359150 ?auto_359144 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_359147 ?auto_359144 ?auto_359145 ?auto_359146 )
      ( GET-2IMAGE-VERIFY ?auto_359145 ?auto_359146 ?auto_359147 ?auto_359144 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_359416 - DIRECTION
      ?auto_359417 - MODE
    )
    :vars
    (
      ?auto_359420 - DIRECTION
      ?auto_359422 - INSTRUMENT
      ?auto_359419 - SATELLITE
      ?auto_359418 - DIRECTION
      ?auto_359423 - MODE
      ?auto_359421 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_359416 ?auto_359420 ) ) ( ON_BOARD ?auto_359422 ?auto_359419 ) ( SUPPORTS ?auto_359422 ?auto_359417 ) ( not ( = ?auto_359416 ?auto_359418 ) ) ( not ( = ?auto_359420 ?auto_359418 ) ) ( not ( = ?auto_359423 ?auto_359417 ) ) ( CALIBRATION_TARGET ?auto_359422 ?auto_359418 ) ( ON_BOARD ?auto_359421 ?auto_359419 ) ( POWER_ON ?auto_359421 ) ( not ( = ?auto_359422 ?auto_359421 ) ) ( CALIBRATED ?auto_359421 ) ( SUPPORTS ?auto_359421 ?auto_359423 ) ( POINTING ?auto_359419 ?auto_359418 ) )
    :subtasks
    ( ( !TURN_TO ?auto_359419 ?auto_359420 ?auto_359418 )
      ( GET-2IMAGE ?auto_359420 ?auto_359423 ?auto_359416 ?auto_359417 )
      ( GET-1IMAGE-VERIFY ?auto_359416 ?auto_359417 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_359425 - DIRECTION
      ?auto_359426 - MODE
      ?auto_359427 - DIRECTION
      ?auto_359424 - MODE
    )
    :vars
    (
      ?auto_359428 - INSTRUMENT
      ?auto_359429 - SATELLITE
      ?auto_359430 - DIRECTION
      ?auto_359431 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_359427 ?auto_359425 ) ) ( ON_BOARD ?auto_359428 ?auto_359429 ) ( SUPPORTS ?auto_359428 ?auto_359424 ) ( not ( = ?auto_359427 ?auto_359430 ) ) ( not ( = ?auto_359425 ?auto_359430 ) ) ( not ( = ?auto_359426 ?auto_359424 ) ) ( CALIBRATION_TARGET ?auto_359428 ?auto_359430 ) ( ON_BOARD ?auto_359431 ?auto_359429 ) ( POWER_ON ?auto_359431 ) ( not ( = ?auto_359428 ?auto_359431 ) ) ( CALIBRATED ?auto_359431 ) ( SUPPORTS ?auto_359431 ?auto_359426 ) ( POINTING ?auto_359429 ?auto_359430 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_359427 ?auto_359424 )
      ( GET-2IMAGE-VERIFY ?auto_359425 ?auto_359426 ?auto_359427 ?auto_359424 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_359433 - DIRECTION
      ?auto_359434 - MODE
      ?auto_359435 - DIRECTION
      ?auto_359432 - MODE
    )
    :vars
    (
      ?auto_359439 - INSTRUMENT
      ?auto_359436 - SATELLITE
      ?auto_359437 - DIRECTION
      ?auto_359438 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_359435 ?auto_359433 ) ) ( ON_BOARD ?auto_359439 ?auto_359436 ) ( SUPPORTS ?auto_359439 ?auto_359434 ) ( not ( = ?auto_359433 ?auto_359437 ) ) ( not ( = ?auto_359435 ?auto_359437 ) ) ( not ( = ?auto_359432 ?auto_359434 ) ) ( CALIBRATION_TARGET ?auto_359439 ?auto_359437 ) ( ON_BOARD ?auto_359438 ?auto_359436 ) ( POWER_ON ?auto_359438 ) ( not ( = ?auto_359439 ?auto_359438 ) ) ( CALIBRATED ?auto_359438 ) ( SUPPORTS ?auto_359438 ?auto_359432 ) ( POINTING ?auto_359436 ?auto_359437 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_359435 ?auto_359432 ?auto_359433 ?auto_359434 )
      ( GET-2IMAGE-VERIFY ?auto_359433 ?auto_359434 ?auto_359435 ?auto_359432 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_359704 - DIRECTION
      ?auto_359705 - MODE
    )
    :vars
    (
      ?auto_359709 - DIRECTION
      ?auto_359710 - INSTRUMENT
      ?auto_359706 - SATELLITE
      ?auto_359707 - DIRECTION
      ?auto_359711 - MODE
      ?auto_359708 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_359704 ?auto_359709 ) ) ( ON_BOARD ?auto_359710 ?auto_359706 ) ( SUPPORTS ?auto_359710 ?auto_359705 ) ( not ( = ?auto_359704 ?auto_359707 ) ) ( not ( = ?auto_359709 ?auto_359707 ) ) ( not ( = ?auto_359711 ?auto_359705 ) ) ( CALIBRATION_TARGET ?auto_359710 ?auto_359707 ) ( ON_BOARD ?auto_359708 ?auto_359706 ) ( POWER_ON ?auto_359708 ) ( not ( = ?auto_359710 ?auto_359708 ) ) ( SUPPORTS ?auto_359708 ?auto_359711 ) ( POINTING ?auto_359706 ?auto_359707 ) ( CALIBRATION_TARGET ?auto_359708 ?auto_359707 ) ( NOT_CALIBRATED ?auto_359708 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_359706 ?auto_359708 ?auto_359707 )
      ( GET-2IMAGE ?auto_359709 ?auto_359711 ?auto_359704 ?auto_359705 )
      ( GET-1IMAGE-VERIFY ?auto_359704 ?auto_359705 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_359713 - DIRECTION
      ?auto_359714 - MODE
      ?auto_359715 - DIRECTION
      ?auto_359712 - MODE
    )
    :vars
    (
      ?auto_359716 - INSTRUMENT
      ?auto_359717 - SATELLITE
      ?auto_359719 - DIRECTION
      ?auto_359718 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_359715 ?auto_359713 ) ) ( ON_BOARD ?auto_359716 ?auto_359717 ) ( SUPPORTS ?auto_359716 ?auto_359712 ) ( not ( = ?auto_359715 ?auto_359719 ) ) ( not ( = ?auto_359713 ?auto_359719 ) ) ( not ( = ?auto_359714 ?auto_359712 ) ) ( CALIBRATION_TARGET ?auto_359716 ?auto_359719 ) ( ON_BOARD ?auto_359718 ?auto_359717 ) ( POWER_ON ?auto_359718 ) ( not ( = ?auto_359716 ?auto_359718 ) ) ( SUPPORTS ?auto_359718 ?auto_359714 ) ( POINTING ?auto_359717 ?auto_359719 ) ( CALIBRATION_TARGET ?auto_359718 ?auto_359719 ) ( NOT_CALIBRATED ?auto_359718 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_359715 ?auto_359712 )
      ( GET-2IMAGE-VERIFY ?auto_359713 ?auto_359714 ?auto_359715 ?auto_359712 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_359721 - DIRECTION
      ?auto_359722 - MODE
      ?auto_359723 - DIRECTION
      ?auto_359720 - MODE
    )
    :vars
    (
      ?auto_359725 - INSTRUMENT
      ?auto_359726 - SATELLITE
      ?auto_359724 - DIRECTION
      ?auto_359727 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_359723 ?auto_359721 ) ) ( ON_BOARD ?auto_359725 ?auto_359726 ) ( SUPPORTS ?auto_359725 ?auto_359722 ) ( not ( = ?auto_359721 ?auto_359724 ) ) ( not ( = ?auto_359723 ?auto_359724 ) ) ( not ( = ?auto_359720 ?auto_359722 ) ) ( CALIBRATION_TARGET ?auto_359725 ?auto_359724 ) ( ON_BOARD ?auto_359727 ?auto_359726 ) ( POWER_ON ?auto_359727 ) ( not ( = ?auto_359725 ?auto_359727 ) ) ( SUPPORTS ?auto_359727 ?auto_359720 ) ( POINTING ?auto_359726 ?auto_359724 ) ( CALIBRATION_TARGET ?auto_359727 ?auto_359724 ) ( NOT_CALIBRATED ?auto_359727 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_359723 ?auto_359720 ?auto_359721 ?auto_359722 )
      ( GET-2IMAGE-VERIFY ?auto_359721 ?auto_359722 ?auto_359723 ?auto_359720 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_361214 - DIRECTION
      ?auto_361215 - MODE
      ?auto_361216 - DIRECTION
      ?auto_361213 - MODE
      ?auto_361218 - DIRECTION
      ?auto_361217 - MODE
    )
    :vars
    (
      ?auto_361220 - INSTRUMENT
      ?auto_361219 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_361216 ?auto_361214 ) ) ( not ( = ?auto_361218 ?auto_361214 ) ) ( not ( = ?auto_361218 ?auto_361216 ) ) ( CALIBRATED ?auto_361220 ) ( ON_BOARD ?auto_361220 ?auto_361219 ) ( SUPPORTS ?auto_361220 ?auto_361217 ) ( POWER_ON ?auto_361220 ) ( POINTING ?auto_361219 ?auto_361218 ) ( HAVE_IMAGE ?auto_361214 ?auto_361215 ) ( HAVE_IMAGE ?auto_361216 ?auto_361213 ) ( not ( = ?auto_361215 ?auto_361213 ) ) ( not ( = ?auto_361215 ?auto_361217 ) ) ( not ( = ?auto_361213 ?auto_361217 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_361218 ?auto_361217 )
      ( GET-3IMAGE-VERIFY ?auto_361214 ?auto_361215 ?auto_361216 ?auto_361213 ?auto_361218 ?auto_361217 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_361230 - DIRECTION
      ?auto_361231 - MODE
      ?auto_361232 - DIRECTION
      ?auto_361229 - MODE
      ?auto_361234 - DIRECTION
      ?auto_361233 - MODE
    )
    :vars
    (
      ?auto_361236 - INSTRUMENT
      ?auto_361235 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_361232 ?auto_361230 ) ) ( not ( = ?auto_361234 ?auto_361230 ) ) ( not ( = ?auto_361234 ?auto_361232 ) ) ( CALIBRATED ?auto_361236 ) ( ON_BOARD ?auto_361236 ?auto_361235 ) ( SUPPORTS ?auto_361236 ?auto_361229 ) ( POWER_ON ?auto_361236 ) ( POINTING ?auto_361235 ?auto_361232 ) ( HAVE_IMAGE ?auto_361230 ?auto_361231 ) ( HAVE_IMAGE ?auto_361234 ?auto_361233 ) ( not ( = ?auto_361231 ?auto_361229 ) ) ( not ( = ?auto_361231 ?auto_361233 ) ) ( not ( = ?auto_361229 ?auto_361233 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_361232 ?auto_361229 )
      ( GET-3IMAGE-VERIFY ?auto_361230 ?auto_361231 ?auto_361232 ?auto_361229 ?auto_361234 ?auto_361233 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_361290 - DIRECTION
      ?auto_361291 - MODE
      ?auto_361292 - DIRECTION
      ?auto_361289 - MODE
      ?auto_361294 - DIRECTION
      ?auto_361293 - MODE
    )
    :vars
    (
      ?auto_361296 - INSTRUMENT
      ?auto_361295 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_361292 ?auto_361290 ) ) ( not ( = ?auto_361294 ?auto_361290 ) ) ( not ( = ?auto_361294 ?auto_361292 ) ) ( CALIBRATED ?auto_361296 ) ( ON_BOARD ?auto_361296 ?auto_361295 ) ( SUPPORTS ?auto_361296 ?auto_361291 ) ( POWER_ON ?auto_361296 ) ( POINTING ?auto_361295 ?auto_361290 ) ( HAVE_IMAGE ?auto_361292 ?auto_361289 ) ( HAVE_IMAGE ?auto_361294 ?auto_361293 ) ( not ( = ?auto_361291 ?auto_361289 ) ) ( not ( = ?auto_361291 ?auto_361293 ) ) ( not ( = ?auto_361289 ?auto_361293 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_361290 ?auto_361291 )
      ( GET-3IMAGE-VERIFY ?auto_361290 ?auto_361291 ?auto_361292 ?auto_361289 ?auto_361294 ?auto_361293 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_362047 - DIRECTION
      ?auto_362048 - MODE
      ?auto_362049 - DIRECTION
      ?auto_362046 - MODE
      ?auto_362051 - DIRECTION
      ?auto_362050 - MODE
    )
    :vars
    (
      ?auto_362052 - INSTRUMENT
      ?auto_362053 - SATELLITE
      ?auto_362054 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_362049 ?auto_362047 ) ) ( not ( = ?auto_362051 ?auto_362047 ) ) ( not ( = ?auto_362051 ?auto_362049 ) ) ( CALIBRATED ?auto_362052 ) ( ON_BOARD ?auto_362052 ?auto_362053 ) ( SUPPORTS ?auto_362052 ?auto_362050 ) ( POWER_ON ?auto_362052 ) ( POINTING ?auto_362053 ?auto_362054 ) ( not ( = ?auto_362051 ?auto_362054 ) ) ( HAVE_IMAGE ?auto_362047 ?auto_362048 ) ( not ( = ?auto_362047 ?auto_362054 ) ) ( not ( = ?auto_362048 ?auto_362050 ) ) ( HAVE_IMAGE ?auto_362049 ?auto_362046 ) ( not ( = ?auto_362048 ?auto_362046 ) ) ( not ( = ?auto_362049 ?auto_362054 ) ) ( not ( = ?auto_362046 ?auto_362050 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362047 ?auto_362048 ?auto_362051 ?auto_362050 )
      ( GET-3IMAGE-VERIFY ?auto_362047 ?auto_362048 ?auto_362049 ?auto_362046 ?auto_362051 ?auto_362050 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_362065 - DIRECTION
      ?auto_362066 - MODE
      ?auto_362067 - DIRECTION
      ?auto_362064 - MODE
      ?auto_362069 - DIRECTION
      ?auto_362068 - MODE
    )
    :vars
    (
      ?auto_362070 - INSTRUMENT
      ?auto_362071 - SATELLITE
      ?auto_362072 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_362067 ?auto_362065 ) ) ( not ( = ?auto_362069 ?auto_362065 ) ) ( not ( = ?auto_362069 ?auto_362067 ) ) ( CALIBRATED ?auto_362070 ) ( ON_BOARD ?auto_362070 ?auto_362071 ) ( SUPPORTS ?auto_362070 ?auto_362064 ) ( POWER_ON ?auto_362070 ) ( POINTING ?auto_362071 ?auto_362072 ) ( not ( = ?auto_362067 ?auto_362072 ) ) ( HAVE_IMAGE ?auto_362065 ?auto_362066 ) ( not ( = ?auto_362065 ?auto_362072 ) ) ( not ( = ?auto_362066 ?auto_362064 ) ) ( HAVE_IMAGE ?auto_362069 ?auto_362068 ) ( not ( = ?auto_362066 ?auto_362068 ) ) ( not ( = ?auto_362064 ?auto_362068 ) ) ( not ( = ?auto_362069 ?auto_362072 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362065 ?auto_362066 ?auto_362067 ?auto_362064 )
      ( GET-3IMAGE-VERIFY ?auto_362065 ?auto_362066 ?auto_362067 ?auto_362064 ?auto_362069 ?auto_362068 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_362137 - DIRECTION
      ?auto_362138 - MODE
      ?auto_362139 - DIRECTION
      ?auto_362136 - MODE
      ?auto_362141 - DIRECTION
      ?auto_362140 - MODE
    )
    :vars
    (
      ?auto_362142 - INSTRUMENT
      ?auto_362143 - SATELLITE
      ?auto_362144 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_362139 ?auto_362137 ) ) ( not ( = ?auto_362141 ?auto_362137 ) ) ( not ( = ?auto_362141 ?auto_362139 ) ) ( CALIBRATED ?auto_362142 ) ( ON_BOARD ?auto_362142 ?auto_362143 ) ( SUPPORTS ?auto_362142 ?auto_362138 ) ( POWER_ON ?auto_362142 ) ( POINTING ?auto_362143 ?auto_362144 ) ( not ( = ?auto_362137 ?auto_362144 ) ) ( HAVE_IMAGE ?auto_362139 ?auto_362136 ) ( not ( = ?auto_362139 ?auto_362144 ) ) ( not ( = ?auto_362136 ?auto_362138 ) ) ( HAVE_IMAGE ?auto_362141 ?auto_362140 ) ( not ( = ?auto_362138 ?auto_362140 ) ) ( not ( = ?auto_362136 ?auto_362140 ) ) ( not ( = ?auto_362141 ?auto_362144 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362139 ?auto_362136 ?auto_362137 ?auto_362138 )
      ( GET-3IMAGE-VERIFY ?auto_362137 ?auto_362138 ?auto_362139 ?auto_362136 ?auto_362141 ?auto_362140 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_363006 - DIRECTION
      ?auto_363007 - MODE
      ?auto_363008 - DIRECTION
      ?auto_363005 - MODE
      ?auto_363010 - DIRECTION
      ?auto_363009 - MODE
    )
    :vars
    (
      ?auto_363013 - INSTRUMENT
      ?auto_363012 - SATELLITE
      ?auto_363011 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_363008 ?auto_363006 ) ) ( not ( = ?auto_363010 ?auto_363006 ) ) ( not ( = ?auto_363010 ?auto_363008 ) ) ( ON_BOARD ?auto_363013 ?auto_363012 ) ( SUPPORTS ?auto_363013 ?auto_363009 ) ( POWER_ON ?auto_363013 ) ( POINTING ?auto_363012 ?auto_363011 ) ( not ( = ?auto_363010 ?auto_363011 ) ) ( HAVE_IMAGE ?auto_363006 ?auto_363007 ) ( not ( = ?auto_363006 ?auto_363011 ) ) ( not ( = ?auto_363007 ?auto_363009 ) ) ( CALIBRATION_TARGET ?auto_363013 ?auto_363011 ) ( NOT_CALIBRATED ?auto_363013 ) ( HAVE_IMAGE ?auto_363008 ?auto_363005 ) ( not ( = ?auto_363007 ?auto_363005 ) ) ( not ( = ?auto_363008 ?auto_363011 ) ) ( not ( = ?auto_363005 ?auto_363009 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363006 ?auto_363007 ?auto_363010 ?auto_363009 )
      ( GET-3IMAGE-VERIFY ?auto_363006 ?auto_363007 ?auto_363008 ?auto_363005 ?auto_363010 ?auto_363009 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_363024 - DIRECTION
      ?auto_363025 - MODE
      ?auto_363026 - DIRECTION
      ?auto_363023 - MODE
      ?auto_363028 - DIRECTION
      ?auto_363027 - MODE
    )
    :vars
    (
      ?auto_363031 - INSTRUMENT
      ?auto_363030 - SATELLITE
      ?auto_363029 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_363026 ?auto_363024 ) ) ( not ( = ?auto_363028 ?auto_363024 ) ) ( not ( = ?auto_363028 ?auto_363026 ) ) ( ON_BOARD ?auto_363031 ?auto_363030 ) ( SUPPORTS ?auto_363031 ?auto_363023 ) ( POWER_ON ?auto_363031 ) ( POINTING ?auto_363030 ?auto_363029 ) ( not ( = ?auto_363026 ?auto_363029 ) ) ( HAVE_IMAGE ?auto_363024 ?auto_363025 ) ( not ( = ?auto_363024 ?auto_363029 ) ) ( not ( = ?auto_363025 ?auto_363023 ) ) ( CALIBRATION_TARGET ?auto_363031 ?auto_363029 ) ( NOT_CALIBRATED ?auto_363031 ) ( HAVE_IMAGE ?auto_363028 ?auto_363027 ) ( not ( = ?auto_363025 ?auto_363027 ) ) ( not ( = ?auto_363023 ?auto_363027 ) ) ( not ( = ?auto_363028 ?auto_363029 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363024 ?auto_363025 ?auto_363026 ?auto_363023 )
      ( GET-3IMAGE-VERIFY ?auto_363024 ?auto_363025 ?auto_363026 ?auto_363023 ?auto_363028 ?auto_363027 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_363096 - DIRECTION
      ?auto_363097 - MODE
      ?auto_363098 - DIRECTION
      ?auto_363095 - MODE
      ?auto_363100 - DIRECTION
      ?auto_363099 - MODE
    )
    :vars
    (
      ?auto_363103 - INSTRUMENT
      ?auto_363102 - SATELLITE
      ?auto_363101 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_363098 ?auto_363096 ) ) ( not ( = ?auto_363100 ?auto_363096 ) ) ( not ( = ?auto_363100 ?auto_363098 ) ) ( ON_BOARD ?auto_363103 ?auto_363102 ) ( SUPPORTS ?auto_363103 ?auto_363097 ) ( POWER_ON ?auto_363103 ) ( POINTING ?auto_363102 ?auto_363101 ) ( not ( = ?auto_363096 ?auto_363101 ) ) ( HAVE_IMAGE ?auto_363098 ?auto_363095 ) ( not ( = ?auto_363098 ?auto_363101 ) ) ( not ( = ?auto_363095 ?auto_363097 ) ) ( CALIBRATION_TARGET ?auto_363103 ?auto_363101 ) ( NOT_CALIBRATED ?auto_363103 ) ( HAVE_IMAGE ?auto_363100 ?auto_363099 ) ( not ( = ?auto_363097 ?auto_363099 ) ) ( not ( = ?auto_363095 ?auto_363099 ) ) ( not ( = ?auto_363100 ?auto_363101 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363098 ?auto_363095 ?auto_363096 ?auto_363097 )
      ( GET-3IMAGE-VERIFY ?auto_363096 ?auto_363097 ?auto_363098 ?auto_363095 ?auto_363100 ?auto_363099 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_363965 - DIRECTION
      ?auto_363966 - MODE
      ?auto_363967 - DIRECTION
      ?auto_363964 - MODE
      ?auto_363969 - DIRECTION
      ?auto_363968 - MODE
    )
    :vars
    (
      ?auto_363972 - INSTRUMENT
      ?auto_363970 - SATELLITE
      ?auto_363971 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_363967 ?auto_363965 ) ) ( not ( = ?auto_363969 ?auto_363965 ) ) ( not ( = ?auto_363969 ?auto_363967 ) ) ( ON_BOARD ?auto_363972 ?auto_363970 ) ( SUPPORTS ?auto_363972 ?auto_363968 ) ( POINTING ?auto_363970 ?auto_363971 ) ( not ( = ?auto_363969 ?auto_363971 ) ) ( HAVE_IMAGE ?auto_363965 ?auto_363966 ) ( not ( = ?auto_363965 ?auto_363971 ) ) ( not ( = ?auto_363966 ?auto_363968 ) ) ( CALIBRATION_TARGET ?auto_363972 ?auto_363971 ) ( POWER_AVAIL ?auto_363970 ) ( HAVE_IMAGE ?auto_363967 ?auto_363964 ) ( not ( = ?auto_363966 ?auto_363964 ) ) ( not ( = ?auto_363967 ?auto_363971 ) ) ( not ( = ?auto_363964 ?auto_363968 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363965 ?auto_363966 ?auto_363969 ?auto_363968 )
      ( GET-3IMAGE-VERIFY ?auto_363965 ?auto_363966 ?auto_363967 ?auto_363964 ?auto_363969 ?auto_363968 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_363983 - DIRECTION
      ?auto_363984 - MODE
      ?auto_363985 - DIRECTION
      ?auto_363982 - MODE
      ?auto_363987 - DIRECTION
      ?auto_363986 - MODE
    )
    :vars
    (
      ?auto_363990 - INSTRUMENT
      ?auto_363988 - SATELLITE
      ?auto_363989 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_363985 ?auto_363983 ) ) ( not ( = ?auto_363987 ?auto_363983 ) ) ( not ( = ?auto_363987 ?auto_363985 ) ) ( ON_BOARD ?auto_363990 ?auto_363988 ) ( SUPPORTS ?auto_363990 ?auto_363982 ) ( POINTING ?auto_363988 ?auto_363989 ) ( not ( = ?auto_363985 ?auto_363989 ) ) ( HAVE_IMAGE ?auto_363983 ?auto_363984 ) ( not ( = ?auto_363983 ?auto_363989 ) ) ( not ( = ?auto_363984 ?auto_363982 ) ) ( CALIBRATION_TARGET ?auto_363990 ?auto_363989 ) ( POWER_AVAIL ?auto_363988 ) ( HAVE_IMAGE ?auto_363987 ?auto_363986 ) ( not ( = ?auto_363984 ?auto_363986 ) ) ( not ( = ?auto_363982 ?auto_363986 ) ) ( not ( = ?auto_363987 ?auto_363989 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363983 ?auto_363984 ?auto_363985 ?auto_363982 )
      ( GET-3IMAGE-VERIFY ?auto_363983 ?auto_363984 ?auto_363985 ?auto_363982 ?auto_363987 ?auto_363986 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364055 - DIRECTION
      ?auto_364056 - MODE
      ?auto_364057 - DIRECTION
      ?auto_364054 - MODE
      ?auto_364059 - DIRECTION
      ?auto_364058 - MODE
    )
    :vars
    (
      ?auto_364062 - INSTRUMENT
      ?auto_364060 - SATELLITE
      ?auto_364061 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_364057 ?auto_364055 ) ) ( not ( = ?auto_364059 ?auto_364055 ) ) ( not ( = ?auto_364059 ?auto_364057 ) ) ( ON_BOARD ?auto_364062 ?auto_364060 ) ( SUPPORTS ?auto_364062 ?auto_364056 ) ( POINTING ?auto_364060 ?auto_364061 ) ( not ( = ?auto_364055 ?auto_364061 ) ) ( HAVE_IMAGE ?auto_364057 ?auto_364054 ) ( not ( = ?auto_364057 ?auto_364061 ) ) ( not ( = ?auto_364054 ?auto_364056 ) ) ( CALIBRATION_TARGET ?auto_364062 ?auto_364061 ) ( POWER_AVAIL ?auto_364060 ) ( HAVE_IMAGE ?auto_364059 ?auto_364058 ) ( not ( = ?auto_364056 ?auto_364058 ) ) ( not ( = ?auto_364054 ?auto_364058 ) ) ( not ( = ?auto_364059 ?auto_364061 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364057 ?auto_364054 ?auto_364055 ?auto_364056 )
      ( GET-3IMAGE-VERIFY ?auto_364055 ?auto_364056 ?auto_364057 ?auto_364054 ?auto_364059 ?auto_364058 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_364876 - DIRECTION
      ?auto_364877 - MODE
    )
    :vars
    (
      ?auto_364881 - DIRECTION
      ?auto_364882 - INSTRUMENT
      ?auto_364878 - SATELLITE
      ?auto_364880 - DIRECTION
      ?auto_364879 - MODE
      ?auto_364883 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_364876 ?auto_364881 ) ) ( ON_BOARD ?auto_364882 ?auto_364878 ) ( SUPPORTS ?auto_364882 ?auto_364877 ) ( not ( = ?auto_364876 ?auto_364880 ) ) ( HAVE_IMAGE ?auto_364881 ?auto_364879 ) ( not ( = ?auto_364881 ?auto_364880 ) ) ( not ( = ?auto_364879 ?auto_364877 ) ) ( CALIBRATION_TARGET ?auto_364882 ?auto_364880 ) ( POWER_AVAIL ?auto_364878 ) ( POINTING ?auto_364878 ?auto_364883 ) ( not ( = ?auto_364880 ?auto_364883 ) ) ( not ( = ?auto_364876 ?auto_364883 ) ) ( not ( = ?auto_364881 ?auto_364883 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_364878 ?auto_364880 ?auto_364883 )
      ( GET-2IMAGE ?auto_364881 ?auto_364879 ?auto_364876 ?auto_364877 )
      ( GET-1IMAGE-VERIFY ?auto_364876 ?auto_364877 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_364885 - DIRECTION
      ?auto_364886 - MODE
      ?auto_364887 - DIRECTION
      ?auto_364884 - MODE
    )
    :vars
    (
      ?auto_364890 - INSTRUMENT
      ?auto_364889 - SATELLITE
      ?auto_364891 - DIRECTION
      ?auto_364888 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_364887 ?auto_364885 ) ) ( ON_BOARD ?auto_364890 ?auto_364889 ) ( SUPPORTS ?auto_364890 ?auto_364884 ) ( not ( = ?auto_364887 ?auto_364891 ) ) ( HAVE_IMAGE ?auto_364885 ?auto_364886 ) ( not ( = ?auto_364885 ?auto_364891 ) ) ( not ( = ?auto_364886 ?auto_364884 ) ) ( CALIBRATION_TARGET ?auto_364890 ?auto_364891 ) ( POWER_AVAIL ?auto_364889 ) ( POINTING ?auto_364889 ?auto_364888 ) ( not ( = ?auto_364891 ?auto_364888 ) ) ( not ( = ?auto_364887 ?auto_364888 ) ) ( not ( = ?auto_364885 ?auto_364888 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_364887 ?auto_364884 )
      ( GET-2IMAGE-VERIFY ?auto_364885 ?auto_364886 ?auto_364887 ?auto_364884 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_364893 - DIRECTION
      ?auto_364894 - MODE
      ?auto_364895 - DIRECTION
      ?auto_364892 - MODE
    )
    :vars
    (
      ?auto_364900 - DIRECTION
      ?auto_364899 - INSTRUMENT
      ?auto_364896 - SATELLITE
      ?auto_364898 - DIRECTION
      ?auto_364897 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_364895 ?auto_364893 ) ) ( not ( = ?auto_364895 ?auto_364900 ) ) ( ON_BOARD ?auto_364899 ?auto_364896 ) ( SUPPORTS ?auto_364899 ?auto_364892 ) ( not ( = ?auto_364895 ?auto_364898 ) ) ( HAVE_IMAGE ?auto_364900 ?auto_364897 ) ( not ( = ?auto_364900 ?auto_364898 ) ) ( not ( = ?auto_364897 ?auto_364892 ) ) ( CALIBRATION_TARGET ?auto_364899 ?auto_364898 ) ( POWER_AVAIL ?auto_364896 ) ( POINTING ?auto_364896 ?auto_364893 ) ( not ( = ?auto_364898 ?auto_364893 ) ) ( not ( = ?auto_364900 ?auto_364893 ) ) ( HAVE_IMAGE ?auto_364893 ?auto_364894 ) ( not ( = ?auto_364894 ?auto_364892 ) ) ( not ( = ?auto_364894 ?auto_364897 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364900 ?auto_364897 ?auto_364895 ?auto_364892 )
      ( GET-2IMAGE-VERIFY ?auto_364893 ?auto_364894 ?auto_364895 ?auto_364892 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_364902 - DIRECTION
      ?auto_364903 - MODE
      ?auto_364904 - DIRECTION
      ?auto_364901 - MODE
    )
    :vars
    (
      ?auto_364908 - INSTRUMENT
      ?auto_364905 - SATELLITE
      ?auto_364906 - DIRECTION
      ?auto_364907 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_364904 ?auto_364902 ) ) ( ON_BOARD ?auto_364908 ?auto_364905 ) ( SUPPORTS ?auto_364908 ?auto_364903 ) ( not ( = ?auto_364902 ?auto_364906 ) ) ( HAVE_IMAGE ?auto_364904 ?auto_364901 ) ( not ( = ?auto_364904 ?auto_364906 ) ) ( not ( = ?auto_364901 ?auto_364903 ) ) ( CALIBRATION_TARGET ?auto_364908 ?auto_364906 ) ( POWER_AVAIL ?auto_364905 ) ( POINTING ?auto_364905 ?auto_364907 ) ( not ( = ?auto_364906 ?auto_364907 ) ) ( not ( = ?auto_364902 ?auto_364907 ) ) ( not ( = ?auto_364904 ?auto_364907 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364904 ?auto_364901 ?auto_364902 ?auto_364903 )
      ( GET-2IMAGE-VERIFY ?auto_364902 ?auto_364903 ?auto_364904 ?auto_364901 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_364910 - DIRECTION
      ?auto_364911 - MODE
      ?auto_364912 - DIRECTION
      ?auto_364909 - MODE
    )
    :vars
    (
      ?auto_364917 - DIRECTION
      ?auto_364916 - INSTRUMENT
      ?auto_364913 - SATELLITE
      ?auto_364915 - DIRECTION
      ?auto_364914 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_364912 ?auto_364910 ) ) ( not ( = ?auto_364910 ?auto_364917 ) ) ( ON_BOARD ?auto_364916 ?auto_364913 ) ( SUPPORTS ?auto_364916 ?auto_364911 ) ( not ( = ?auto_364910 ?auto_364915 ) ) ( HAVE_IMAGE ?auto_364917 ?auto_364914 ) ( not ( = ?auto_364917 ?auto_364915 ) ) ( not ( = ?auto_364914 ?auto_364911 ) ) ( CALIBRATION_TARGET ?auto_364916 ?auto_364915 ) ( POWER_AVAIL ?auto_364913 ) ( POINTING ?auto_364913 ?auto_364912 ) ( not ( = ?auto_364915 ?auto_364912 ) ) ( not ( = ?auto_364917 ?auto_364912 ) ) ( HAVE_IMAGE ?auto_364912 ?auto_364909 ) ( not ( = ?auto_364911 ?auto_364909 ) ) ( not ( = ?auto_364909 ?auto_364914 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364917 ?auto_364914 ?auto_364910 ?auto_364911 )
      ( GET-2IMAGE-VERIFY ?auto_364910 ?auto_364911 ?auto_364912 ?auto_364909 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364939 - DIRECTION
      ?auto_364940 - MODE
      ?auto_364941 - DIRECTION
      ?auto_364938 - MODE
      ?auto_364943 - DIRECTION
      ?auto_364942 - MODE
    )
    :vars
    (
      ?auto_364946 - INSTRUMENT
      ?auto_364944 - SATELLITE
      ?auto_364945 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_364941 ?auto_364939 ) ) ( not ( = ?auto_364943 ?auto_364939 ) ) ( not ( = ?auto_364943 ?auto_364941 ) ) ( ON_BOARD ?auto_364946 ?auto_364944 ) ( SUPPORTS ?auto_364946 ?auto_364942 ) ( not ( = ?auto_364943 ?auto_364945 ) ) ( HAVE_IMAGE ?auto_364939 ?auto_364940 ) ( not ( = ?auto_364939 ?auto_364945 ) ) ( not ( = ?auto_364940 ?auto_364942 ) ) ( CALIBRATION_TARGET ?auto_364946 ?auto_364945 ) ( POWER_AVAIL ?auto_364944 ) ( POINTING ?auto_364944 ?auto_364941 ) ( not ( = ?auto_364945 ?auto_364941 ) ) ( HAVE_IMAGE ?auto_364941 ?auto_364938 ) ( not ( = ?auto_364940 ?auto_364938 ) ) ( not ( = ?auto_364938 ?auto_364942 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364939 ?auto_364940 ?auto_364943 ?auto_364942 )
      ( GET-3IMAGE-VERIFY ?auto_364939 ?auto_364940 ?auto_364941 ?auto_364938 ?auto_364943 ?auto_364942 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364958 - DIRECTION
      ?auto_364959 - MODE
      ?auto_364960 - DIRECTION
      ?auto_364957 - MODE
      ?auto_364962 - DIRECTION
      ?auto_364961 - MODE
    )
    :vars
    (
      ?auto_364965 - INSTRUMENT
      ?auto_364963 - SATELLITE
      ?auto_364964 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_364960 ?auto_364958 ) ) ( not ( = ?auto_364962 ?auto_364958 ) ) ( not ( = ?auto_364962 ?auto_364960 ) ) ( ON_BOARD ?auto_364965 ?auto_364963 ) ( SUPPORTS ?auto_364965 ?auto_364957 ) ( not ( = ?auto_364960 ?auto_364964 ) ) ( HAVE_IMAGE ?auto_364958 ?auto_364959 ) ( not ( = ?auto_364958 ?auto_364964 ) ) ( not ( = ?auto_364959 ?auto_364957 ) ) ( CALIBRATION_TARGET ?auto_364965 ?auto_364964 ) ( POWER_AVAIL ?auto_364963 ) ( POINTING ?auto_364963 ?auto_364962 ) ( not ( = ?auto_364964 ?auto_364962 ) ) ( HAVE_IMAGE ?auto_364962 ?auto_364961 ) ( not ( = ?auto_364959 ?auto_364961 ) ) ( not ( = ?auto_364957 ?auto_364961 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364958 ?auto_364959 ?auto_364960 ?auto_364957 )
      ( GET-3IMAGE-VERIFY ?auto_364958 ?auto_364959 ?auto_364960 ?auto_364957 ?auto_364962 ?auto_364961 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364977 - DIRECTION
      ?auto_364978 - MODE
      ?auto_364979 - DIRECTION
      ?auto_364976 - MODE
      ?auto_364981 - DIRECTION
      ?auto_364980 - MODE
    )
    :vars
    (
      ?auto_364984 - INSTRUMENT
      ?auto_364982 - SATELLITE
      ?auto_364983 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_364979 ?auto_364977 ) ) ( not ( = ?auto_364981 ?auto_364977 ) ) ( not ( = ?auto_364981 ?auto_364979 ) ) ( ON_BOARD ?auto_364984 ?auto_364982 ) ( SUPPORTS ?auto_364984 ?auto_364980 ) ( not ( = ?auto_364981 ?auto_364983 ) ) ( HAVE_IMAGE ?auto_364979 ?auto_364976 ) ( not ( = ?auto_364979 ?auto_364983 ) ) ( not ( = ?auto_364976 ?auto_364980 ) ) ( CALIBRATION_TARGET ?auto_364984 ?auto_364983 ) ( POWER_AVAIL ?auto_364982 ) ( POINTING ?auto_364982 ?auto_364977 ) ( not ( = ?auto_364983 ?auto_364977 ) ) ( HAVE_IMAGE ?auto_364977 ?auto_364978 ) ( not ( = ?auto_364978 ?auto_364976 ) ) ( not ( = ?auto_364978 ?auto_364980 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364979 ?auto_364976 ?auto_364981 ?auto_364980 )
      ( GET-3IMAGE-VERIFY ?auto_364977 ?auto_364978 ?auto_364979 ?auto_364976 ?auto_364981 ?auto_364980 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364997 - DIRECTION
      ?auto_364998 - MODE
      ?auto_364999 - DIRECTION
      ?auto_364996 - MODE
      ?auto_365001 - DIRECTION
      ?auto_365000 - MODE
    )
    :vars
    (
      ?auto_365004 - INSTRUMENT
      ?auto_365002 - SATELLITE
      ?auto_365003 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_364999 ?auto_364997 ) ) ( not ( = ?auto_365001 ?auto_364997 ) ) ( not ( = ?auto_365001 ?auto_364999 ) ) ( ON_BOARD ?auto_365004 ?auto_365002 ) ( SUPPORTS ?auto_365004 ?auto_364996 ) ( not ( = ?auto_364999 ?auto_365003 ) ) ( HAVE_IMAGE ?auto_365001 ?auto_365000 ) ( not ( = ?auto_365001 ?auto_365003 ) ) ( not ( = ?auto_365000 ?auto_364996 ) ) ( CALIBRATION_TARGET ?auto_365004 ?auto_365003 ) ( POWER_AVAIL ?auto_365002 ) ( POINTING ?auto_365002 ?auto_364997 ) ( not ( = ?auto_365003 ?auto_364997 ) ) ( HAVE_IMAGE ?auto_364997 ?auto_364998 ) ( not ( = ?auto_364998 ?auto_364996 ) ) ( not ( = ?auto_364998 ?auto_365000 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365001 ?auto_365000 ?auto_364999 ?auto_364996 )
      ( GET-3IMAGE-VERIFY ?auto_364997 ?auto_364998 ?auto_364999 ?auto_364996 ?auto_365001 ?auto_365000 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365038 - DIRECTION
      ?auto_365039 - MODE
      ?auto_365040 - DIRECTION
      ?auto_365037 - MODE
      ?auto_365042 - DIRECTION
      ?auto_365041 - MODE
    )
    :vars
    (
      ?auto_365045 - INSTRUMENT
      ?auto_365043 - SATELLITE
      ?auto_365044 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_365040 ?auto_365038 ) ) ( not ( = ?auto_365042 ?auto_365038 ) ) ( not ( = ?auto_365042 ?auto_365040 ) ) ( ON_BOARD ?auto_365045 ?auto_365043 ) ( SUPPORTS ?auto_365045 ?auto_365039 ) ( not ( = ?auto_365038 ?auto_365044 ) ) ( HAVE_IMAGE ?auto_365040 ?auto_365037 ) ( not ( = ?auto_365040 ?auto_365044 ) ) ( not ( = ?auto_365037 ?auto_365039 ) ) ( CALIBRATION_TARGET ?auto_365045 ?auto_365044 ) ( POWER_AVAIL ?auto_365043 ) ( POINTING ?auto_365043 ?auto_365042 ) ( not ( = ?auto_365044 ?auto_365042 ) ) ( HAVE_IMAGE ?auto_365042 ?auto_365041 ) ( not ( = ?auto_365039 ?auto_365041 ) ) ( not ( = ?auto_365037 ?auto_365041 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365040 ?auto_365037 ?auto_365038 ?auto_365039 )
      ( GET-3IMAGE-VERIFY ?auto_365038 ?auto_365039 ?auto_365040 ?auto_365037 ?auto_365042 ?auto_365041 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365057 - DIRECTION
      ?auto_365058 - MODE
      ?auto_365059 - DIRECTION
      ?auto_365056 - MODE
      ?auto_365061 - DIRECTION
      ?auto_365060 - MODE
    )
    :vars
    (
      ?auto_365064 - INSTRUMENT
      ?auto_365062 - SATELLITE
      ?auto_365063 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_365059 ?auto_365057 ) ) ( not ( = ?auto_365061 ?auto_365057 ) ) ( not ( = ?auto_365061 ?auto_365059 ) ) ( ON_BOARD ?auto_365064 ?auto_365062 ) ( SUPPORTS ?auto_365064 ?auto_365058 ) ( not ( = ?auto_365057 ?auto_365063 ) ) ( HAVE_IMAGE ?auto_365061 ?auto_365060 ) ( not ( = ?auto_365061 ?auto_365063 ) ) ( not ( = ?auto_365060 ?auto_365058 ) ) ( CALIBRATION_TARGET ?auto_365064 ?auto_365063 ) ( POWER_AVAIL ?auto_365062 ) ( POINTING ?auto_365062 ?auto_365059 ) ( not ( = ?auto_365063 ?auto_365059 ) ) ( HAVE_IMAGE ?auto_365059 ?auto_365056 ) ( not ( = ?auto_365058 ?auto_365056 ) ) ( not ( = ?auto_365056 ?auto_365060 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365061 ?auto_365060 ?auto_365057 ?auto_365058 )
      ( GET-3IMAGE-VERIFY ?auto_365057 ?auto_365058 ?auto_365059 ?auto_365056 ?auto_365061 ?auto_365060 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_365880 - DIRECTION
      ?auto_365881 - MODE
    )
    :vars
    (
      ?auto_365887 - DIRECTION
      ?auto_365886 - INSTRUMENT
      ?auto_365882 - SATELLITE
      ?auto_365884 - DIRECTION
      ?auto_365883 - MODE
      ?auto_365885 - DIRECTION
      ?auto_365888 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_365880 ?auto_365887 ) ) ( ON_BOARD ?auto_365886 ?auto_365882 ) ( SUPPORTS ?auto_365886 ?auto_365881 ) ( not ( = ?auto_365880 ?auto_365884 ) ) ( HAVE_IMAGE ?auto_365887 ?auto_365883 ) ( not ( = ?auto_365887 ?auto_365884 ) ) ( not ( = ?auto_365883 ?auto_365881 ) ) ( CALIBRATION_TARGET ?auto_365886 ?auto_365884 ) ( POINTING ?auto_365882 ?auto_365885 ) ( not ( = ?auto_365884 ?auto_365885 ) ) ( not ( = ?auto_365880 ?auto_365885 ) ) ( not ( = ?auto_365887 ?auto_365885 ) ) ( ON_BOARD ?auto_365888 ?auto_365882 ) ( POWER_ON ?auto_365888 ) ( not ( = ?auto_365886 ?auto_365888 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_365888 ?auto_365882 )
      ( GET-2IMAGE ?auto_365887 ?auto_365883 ?auto_365880 ?auto_365881 )
      ( GET-1IMAGE-VERIFY ?auto_365880 ?auto_365881 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_365890 - DIRECTION
      ?auto_365891 - MODE
      ?auto_365892 - DIRECTION
      ?auto_365889 - MODE
    )
    :vars
    (
      ?auto_365893 - INSTRUMENT
      ?auto_365896 - SATELLITE
      ?auto_365894 - DIRECTION
      ?auto_365897 - DIRECTION
      ?auto_365895 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_365892 ?auto_365890 ) ) ( ON_BOARD ?auto_365893 ?auto_365896 ) ( SUPPORTS ?auto_365893 ?auto_365889 ) ( not ( = ?auto_365892 ?auto_365894 ) ) ( HAVE_IMAGE ?auto_365890 ?auto_365891 ) ( not ( = ?auto_365890 ?auto_365894 ) ) ( not ( = ?auto_365891 ?auto_365889 ) ) ( CALIBRATION_TARGET ?auto_365893 ?auto_365894 ) ( POINTING ?auto_365896 ?auto_365897 ) ( not ( = ?auto_365894 ?auto_365897 ) ) ( not ( = ?auto_365892 ?auto_365897 ) ) ( not ( = ?auto_365890 ?auto_365897 ) ) ( ON_BOARD ?auto_365895 ?auto_365896 ) ( POWER_ON ?auto_365895 ) ( not ( = ?auto_365893 ?auto_365895 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_365892 ?auto_365889 )
      ( GET-2IMAGE-VERIFY ?auto_365890 ?auto_365891 ?auto_365892 ?auto_365889 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_365899 - DIRECTION
      ?auto_365900 - MODE
      ?auto_365901 - DIRECTION
      ?auto_365898 - MODE
    )
    :vars
    (
      ?auto_365902 - DIRECTION
      ?auto_365905 - INSTRUMENT
      ?auto_365904 - SATELLITE
      ?auto_365903 - DIRECTION
      ?auto_365907 - MODE
      ?auto_365906 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_365901 ?auto_365899 ) ) ( not ( = ?auto_365901 ?auto_365902 ) ) ( ON_BOARD ?auto_365905 ?auto_365904 ) ( SUPPORTS ?auto_365905 ?auto_365898 ) ( not ( = ?auto_365901 ?auto_365903 ) ) ( HAVE_IMAGE ?auto_365902 ?auto_365907 ) ( not ( = ?auto_365902 ?auto_365903 ) ) ( not ( = ?auto_365907 ?auto_365898 ) ) ( CALIBRATION_TARGET ?auto_365905 ?auto_365903 ) ( POINTING ?auto_365904 ?auto_365899 ) ( not ( = ?auto_365903 ?auto_365899 ) ) ( not ( = ?auto_365902 ?auto_365899 ) ) ( ON_BOARD ?auto_365906 ?auto_365904 ) ( POWER_ON ?auto_365906 ) ( not ( = ?auto_365905 ?auto_365906 ) ) ( HAVE_IMAGE ?auto_365899 ?auto_365900 ) ( not ( = ?auto_365900 ?auto_365898 ) ) ( not ( = ?auto_365900 ?auto_365907 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365902 ?auto_365907 ?auto_365901 ?auto_365898 )
      ( GET-2IMAGE-VERIFY ?auto_365899 ?auto_365900 ?auto_365901 ?auto_365898 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_365909 - DIRECTION
      ?auto_365910 - MODE
      ?auto_365911 - DIRECTION
      ?auto_365908 - MODE
    )
    :vars
    (
      ?auto_365914 - INSTRUMENT
      ?auto_365913 - SATELLITE
      ?auto_365912 - DIRECTION
      ?auto_365916 - DIRECTION
      ?auto_365915 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_365911 ?auto_365909 ) ) ( ON_BOARD ?auto_365914 ?auto_365913 ) ( SUPPORTS ?auto_365914 ?auto_365910 ) ( not ( = ?auto_365909 ?auto_365912 ) ) ( HAVE_IMAGE ?auto_365911 ?auto_365908 ) ( not ( = ?auto_365911 ?auto_365912 ) ) ( not ( = ?auto_365908 ?auto_365910 ) ) ( CALIBRATION_TARGET ?auto_365914 ?auto_365912 ) ( POINTING ?auto_365913 ?auto_365916 ) ( not ( = ?auto_365912 ?auto_365916 ) ) ( not ( = ?auto_365909 ?auto_365916 ) ) ( not ( = ?auto_365911 ?auto_365916 ) ) ( ON_BOARD ?auto_365915 ?auto_365913 ) ( POWER_ON ?auto_365915 ) ( not ( = ?auto_365914 ?auto_365915 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365911 ?auto_365908 ?auto_365909 ?auto_365910 )
      ( GET-2IMAGE-VERIFY ?auto_365909 ?auto_365910 ?auto_365911 ?auto_365908 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_365918 - DIRECTION
      ?auto_365919 - MODE
      ?auto_365920 - DIRECTION
      ?auto_365917 - MODE
    )
    :vars
    (
      ?auto_365921 - DIRECTION
      ?auto_365924 - INSTRUMENT
      ?auto_365923 - SATELLITE
      ?auto_365922 - DIRECTION
      ?auto_365926 - MODE
      ?auto_365925 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_365920 ?auto_365918 ) ) ( not ( = ?auto_365918 ?auto_365921 ) ) ( ON_BOARD ?auto_365924 ?auto_365923 ) ( SUPPORTS ?auto_365924 ?auto_365919 ) ( not ( = ?auto_365918 ?auto_365922 ) ) ( HAVE_IMAGE ?auto_365921 ?auto_365926 ) ( not ( = ?auto_365921 ?auto_365922 ) ) ( not ( = ?auto_365926 ?auto_365919 ) ) ( CALIBRATION_TARGET ?auto_365924 ?auto_365922 ) ( POINTING ?auto_365923 ?auto_365920 ) ( not ( = ?auto_365922 ?auto_365920 ) ) ( not ( = ?auto_365921 ?auto_365920 ) ) ( ON_BOARD ?auto_365925 ?auto_365923 ) ( POWER_ON ?auto_365925 ) ( not ( = ?auto_365924 ?auto_365925 ) ) ( HAVE_IMAGE ?auto_365920 ?auto_365917 ) ( not ( = ?auto_365919 ?auto_365917 ) ) ( not ( = ?auto_365917 ?auto_365926 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365921 ?auto_365926 ?auto_365918 ?auto_365919 )
      ( GET-2IMAGE-VERIFY ?auto_365918 ?auto_365919 ?auto_365920 ?auto_365917 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365950 - DIRECTION
      ?auto_365951 - MODE
      ?auto_365952 - DIRECTION
      ?auto_365949 - MODE
      ?auto_365954 - DIRECTION
      ?auto_365953 - MODE
    )
    :vars
    (
      ?auto_365957 - INSTRUMENT
      ?auto_365956 - SATELLITE
      ?auto_365955 - DIRECTION
      ?auto_365958 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_365952 ?auto_365950 ) ) ( not ( = ?auto_365954 ?auto_365950 ) ) ( not ( = ?auto_365954 ?auto_365952 ) ) ( ON_BOARD ?auto_365957 ?auto_365956 ) ( SUPPORTS ?auto_365957 ?auto_365953 ) ( not ( = ?auto_365954 ?auto_365955 ) ) ( HAVE_IMAGE ?auto_365950 ?auto_365951 ) ( not ( = ?auto_365950 ?auto_365955 ) ) ( not ( = ?auto_365951 ?auto_365953 ) ) ( CALIBRATION_TARGET ?auto_365957 ?auto_365955 ) ( POINTING ?auto_365956 ?auto_365952 ) ( not ( = ?auto_365955 ?auto_365952 ) ) ( ON_BOARD ?auto_365958 ?auto_365956 ) ( POWER_ON ?auto_365958 ) ( not ( = ?auto_365957 ?auto_365958 ) ) ( HAVE_IMAGE ?auto_365952 ?auto_365949 ) ( not ( = ?auto_365951 ?auto_365949 ) ) ( not ( = ?auto_365949 ?auto_365953 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365950 ?auto_365951 ?auto_365954 ?auto_365953 )
      ( GET-3IMAGE-VERIFY ?auto_365950 ?auto_365951 ?auto_365952 ?auto_365949 ?auto_365954 ?auto_365953 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365971 - DIRECTION
      ?auto_365972 - MODE
      ?auto_365973 - DIRECTION
      ?auto_365970 - MODE
      ?auto_365975 - DIRECTION
      ?auto_365974 - MODE
    )
    :vars
    (
      ?auto_365978 - INSTRUMENT
      ?auto_365977 - SATELLITE
      ?auto_365976 - DIRECTION
      ?auto_365979 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_365973 ?auto_365971 ) ) ( not ( = ?auto_365975 ?auto_365971 ) ) ( not ( = ?auto_365975 ?auto_365973 ) ) ( ON_BOARD ?auto_365978 ?auto_365977 ) ( SUPPORTS ?auto_365978 ?auto_365970 ) ( not ( = ?auto_365973 ?auto_365976 ) ) ( HAVE_IMAGE ?auto_365971 ?auto_365972 ) ( not ( = ?auto_365971 ?auto_365976 ) ) ( not ( = ?auto_365972 ?auto_365970 ) ) ( CALIBRATION_TARGET ?auto_365978 ?auto_365976 ) ( POINTING ?auto_365977 ?auto_365975 ) ( not ( = ?auto_365976 ?auto_365975 ) ) ( ON_BOARD ?auto_365979 ?auto_365977 ) ( POWER_ON ?auto_365979 ) ( not ( = ?auto_365978 ?auto_365979 ) ) ( HAVE_IMAGE ?auto_365975 ?auto_365974 ) ( not ( = ?auto_365972 ?auto_365974 ) ) ( not ( = ?auto_365970 ?auto_365974 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365971 ?auto_365972 ?auto_365973 ?auto_365970 )
      ( GET-3IMAGE-VERIFY ?auto_365971 ?auto_365972 ?auto_365973 ?auto_365970 ?auto_365975 ?auto_365974 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365992 - DIRECTION
      ?auto_365993 - MODE
      ?auto_365994 - DIRECTION
      ?auto_365991 - MODE
      ?auto_365996 - DIRECTION
      ?auto_365995 - MODE
    )
    :vars
    (
      ?auto_365999 - INSTRUMENT
      ?auto_365998 - SATELLITE
      ?auto_365997 - DIRECTION
      ?auto_366000 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_365994 ?auto_365992 ) ) ( not ( = ?auto_365996 ?auto_365992 ) ) ( not ( = ?auto_365996 ?auto_365994 ) ) ( ON_BOARD ?auto_365999 ?auto_365998 ) ( SUPPORTS ?auto_365999 ?auto_365995 ) ( not ( = ?auto_365996 ?auto_365997 ) ) ( HAVE_IMAGE ?auto_365994 ?auto_365991 ) ( not ( = ?auto_365994 ?auto_365997 ) ) ( not ( = ?auto_365991 ?auto_365995 ) ) ( CALIBRATION_TARGET ?auto_365999 ?auto_365997 ) ( POINTING ?auto_365998 ?auto_365992 ) ( not ( = ?auto_365997 ?auto_365992 ) ) ( ON_BOARD ?auto_366000 ?auto_365998 ) ( POWER_ON ?auto_366000 ) ( not ( = ?auto_365999 ?auto_366000 ) ) ( HAVE_IMAGE ?auto_365992 ?auto_365993 ) ( not ( = ?auto_365993 ?auto_365991 ) ) ( not ( = ?auto_365993 ?auto_365995 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365994 ?auto_365991 ?auto_365996 ?auto_365995 )
      ( GET-3IMAGE-VERIFY ?auto_365992 ?auto_365993 ?auto_365994 ?auto_365991 ?auto_365996 ?auto_365995 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_366014 - DIRECTION
      ?auto_366015 - MODE
      ?auto_366016 - DIRECTION
      ?auto_366013 - MODE
      ?auto_366018 - DIRECTION
      ?auto_366017 - MODE
    )
    :vars
    (
      ?auto_366021 - INSTRUMENT
      ?auto_366020 - SATELLITE
      ?auto_366019 - DIRECTION
      ?auto_366022 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_366016 ?auto_366014 ) ) ( not ( = ?auto_366018 ?auto_366014 ) ) ( not ( = ?auto_366018 ?auto_366016 ) ) ( ON_BOARD ?auto_366021 ?auto_366020 ) ( SUPPORTS ?auto_366021 ?auto_366013 ) ( not ( = ?auto_366016 ?auto_366019 ) ) ( HAVE_IMAGE ?auto_366018 ?auto_366017 ) ( not ( = ?auto_366018 ?auto_366019 ) ) ( not ( = ?auto_366017 ?auto_366013 ) ) ( CALIBRATION_TARGET ?auto_366021 ?auto_366019 ) ( POINTING ?auto_366020 ?auto_366014 ) ( not ( = ?auto_366019 ?auto_366014 ) ) ( ON_BOARD ?auto_366022 ?auto_366020 ) ( POWER_ON ?auto_366022 ) ( not ( = ?auto_366021 ?auto_366022 ) ) ( HAVE_IMAGE ?auto_366014 ?auto_366015 ) ( not ( = ?auto_366015 ?auto_366013 ) ) ( not ( = ?auto_366015 ?auto_366017 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_366018 ?auto_366017 ?auto_366016 ?auto_366013 )
      ( GET-3IMAGE-VERIFY ?auto_366014 ?auto_366015 ?auto_366016 ?auto_366013 ?auto_366018 ?auto_366017 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_366059 - DIRECTION
      ?auto_366060 - MODE
      ?auto_366061 - DIRECTION
      ?auto_366058 - MODE
      ?auto_366063 - DIRECTION
      ?auto_366062 - MODE
    )
    :vars
    (
      ?auto_366066 - INSTRUMENT
      ?auto_366065 - SATELLITE
      ?auto_366064 - DIRECTION
      ?auto_366067 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_366061 ?auto_366059 ) ) ( not ( = ?auto_366063 ?auto_366059 ) ) ( not ( = ?auto_366063 ?auto_366061 ) ) ( ON_BOARD ?auto_366066 ?auto_366065 ) ( SUPPORTS ?auto_366066 ?auto_366060 ) ( not ( = ?auto_366059 ?auto_366064 ) ) ( HAVE_IMAGE ?auto_366061 ?auto_366058 ) ( not ( = ?auto_366061 ?auto_366064 ) ) ( not ( = ?auto_366058 ?auto_366060 ) ) ( CALIBRATION_TARGET ?auto_366066 ?auto_366064 ) ( POINTING ?auto_366065 ?auto_366063 ) ( not ( = ?auto_366064 ?auto_366063 ) ) ( ON_BOARD ?auto_366067 ?auto_366065 ) ( POWER_ON ?auto_366067 ) ( not ( = ?auto_366066 ?auto_366067 ) ) ( HAVE_IMAGE ?auto_366063 ?auto_366062 ) ( not ( = ?auto_366060 ?auto_366062 ) ) ( not ( = ?auto_366058 ?auto_366062 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_366061 ?auto_366058 ?auto_366059 ?auto_366060 )
      ( GET-3IMAGE-VERIFY ?auto_366059 ?auto_366060 ?auto_366061 ?auto_366058 ?auto_366063 ?auto_366062 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_366080 - DIRECTION
      ?auto_366081 - MODE
      ?auto_366082 - DIRECTION
      ?auto_366079 - MODE
      ?auto_366084 - DIRECTION
      ?auto_366083 - MODE
    )
    :vars
    (
      ?auto_366087 - INSTRUMENT
      ?auto_366086 - SATELLITE
      ?auto_366085 - DIRECTION
      ?auto_366088 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_366082 ?auto_366080 ) ) ( not ( = ?auto_366084 ?auto_366080 ) ) ( not ( = ?auto_366084 ?auto_366082 ) ) ( ON_BOARD ?auto_366087 ?auto_366086 ) ( SUPPORTS ?auto_366087 ?auto_366081 ) ( not ( = ?auto_366080 ?auto_366085 ) ) ( HAVE_IMAGE ?auto_366084 ?auto_366083 ) ( not ( = ?auto_366084 ?auto_366085 ) ) ( not ( = ?auto_366083 ?auto_366081 ) ) ( CALIBRATION_TARGET ?auto_366087 ?auto_366085 ) ( POINTING ?auto_366086 ?auto_366082 ) ( not ( = ?auto_366085 ?auto_366082 ) ) ( ON_BOARD ?auto_366088 ?auto_366086 ) ( POWER_ON ?auto_366088 ) ( not ( = ?auto_366087 ?auto_366088 ) ) ( HAVE_IMAGE ?auto_366082 ?auto_366079 ) ( not ( = ?auto_366081 ?auto_366079 ) ) ( not ( = ?auto_366079 ?auto_366083 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_366084 ?auto_366083 ?auto_366080 ?auto_366081 )
      ( GET-3IMAGE-VERIFY ?auto_366080 ?auto_366081 ?auto_366082 ?auto_366079 ?auto_366084 ?auto_366083 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_368051 - DIRECTION
      ?auto_368052 - MODE
    )
    :vars
    (
      ?auto_368058 - DIRECTION
      ?auto_368055 - INSTRUMENT
      ?auto_368056 - SATELLITE
      ?auto_368057 - DIRECTION
      ?auto_368054 - MODE
      ?auto_368053 - DIRECTION
      ?auto_368059 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_368051 ?auto_368058 ) ) ( ON_BOARD ?auto_368055 ?auto_368056 ) ( SUPPORTS ?auto_368055 ?auto_368052 ) ( not ( = ?auto_368051 ?auto_368057 ) ) ( HAVE_IMAGE ?auto_368058 ?auto_368054 ) ( not ( = ?auto_368058 ?auto_368057 ) ) ( not ( = ?auto_368054 ?auto_368052 ) ) ( CALIBRATION_TARGET ?auto_368055 ?auto_368057 ) ( not ( = ?auto_368057 ?auto_368053 ) ) ( not ( = ?auto_368051 ?auto_368053 ) ) ( not ( = ?auto_368058 ?auto_368053 ) ) ( ON_BOARD ?auto_368059 ?auto_368056 ) ( POWER_ON ?auto_368059 ) ( not ( = ?auto_368055 ?auto_368059 ) ) ( POINTING ?auto_368056 ?auto_368057 ) )
    :subtasks
    ( ( !TURN_TO ?auto_368056 ?auto_368053 ?auto_368057 )
      ( GET-2IMAGE ?auto_368058 ?auto_368054 ?auto_368051 ?auto_368052 )
      ( GET-1IMAGE-VERIFY ?auto_368051 ?auto_368052 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_368061 - DIRECTION
      ?auto_368062 - MODE
      ?auto_368063 - DIRECTION
      ?auto_368060 - MODE
    )
    :vars
    (
      ?auto_368067 - INSTRUMENT
      ?auto_368068 - SATELLITE
      ?auto_368064 - DIRECTION
      ?auto_368066 - DIRECTION
      ?auto_368065 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_368063 ?auto_368061 ) ) ( ON_BOARD ?auto_368067 ?auto_368068 ) ( SUPPORTS ?auto_368067 ?auto_368060 ) ( not ( = ?auto_368063 ?auto_368064 ) ) ( HAVE_IMAGE ?auto_368061 ?auto_368062 ) ( not ( = ?auto_368061 ?auto_368064 ) ) ( not ( = ?auto_368062 ?auto_368060 ) ) ( CALIBRATION_TARGET ?auto_368067 ?auto_368064 ) ( not ( = ?auto_368064 ?auto_368066 ) ) ( not ( = ?auto_368063 ?auto_368066 ) ) ( not ( = ?auto_368061 ?auto_368066 ) ) ( ON_BOARD ?auto_368065 ?auto_368068 ) ( POWER_ON ?auto_368065 ) ( not ( = ?auto_368067 ?auto_368065 ) ) ( POINTING ?auto_368068 ?auto_368064 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_368063 ?auto_368060 )
      ( GET-2IMAGE-VERIFY ?auto_368061 ?auto_368062 ?auto_368063 ?auto_368060 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_368080 - DIRECTION
      ?auto_368081 - MODE
      ?auto_368082 - DIRECTION
      ?auto_368079 - MODE
    )
    :vars
    (
      ?auto_368084 - INSTRUMENT
      ?auto_368085 - SATELLITE
      ?auto_368083 - DIRECTION
      ?auto_368086 - DIRECTION
      ?auto_368087 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_368082 ?auto_368080 ) ) ( ON_BOARD ?auto_368084 ?auto_368085 ) ( SUPPORTS ?auto_368084 ?auto_368081 ) ( not ( = ?auto_368080 ?auto_368083 ) ) ( HAVE_IMAGE ?auto_368082 ?auto_368079 ) ( not ( = ?auto_368082 ?auto_368083 ) ) ( not ( = ?auto_368079 ?auto_368081 ) ) ( CALIBRATION_TARGET ?auto_368084 ?auto_368083 ) ( not ( = ?auto_368083 ?auto_368086 ) ) ( not ( = ?auto_368080 ?auto_368086 ) ) ( not ( = ?auto_368082 ?auto_368086 ) ) ( ON_BOARD ?auto_368087 ?auto_368085 ) ( POWER_ON ?auto_368087 ) ( not ( = ?auto_368084 ?auto_368087 ) ) ( POINTING ?auto_368085 ?auto_368083 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_368082 ?auto_368079 ?auto_368080 ?auto_368081 )
      ( GET-2IMAGE-VERIFY ?auto_368080 ?auto_368081 ?auto_368082 ?auto_368079 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_380383 - DIRECTION
      ?auto_380384 - MODE
      ?auto_380385 - DIRECTION
      ?auto_380382 - MODE
      ?auto_380387 - DIRECTION
      ?auto_380386 - MODE
      ?auto_380388 - DIRECTION
      ?auto_380389 - MODE
    )
    :vars
    (
      ?auto_380390 - INSTRUMENT
      ?auto_380391 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_380385 ?auto_380383 ) ) ( not ( = ?auto_380387 ?auto_380383 ) ) ( not ( = ?auto_380387 ?auto_380385 ) ) ( not ( = ?auto_380388 ?auto_380383 ) ) ( not ( = ?auto_380388 ?auto_380385 ) ) ( not ( = ?auto_380388 ?auto_380387 ) ) ( CALIBRATED ?auto_380390 ) ( ON_BOARD ?auto_380390 ?auto_380391 ) ( SUPPORTS ?auto_380390 ?auto_380389 ) ( POWER_ON ?auto_380390 ) ( POINTING ?auto_380391 ?auto_380388 ) ( HAVE_IMAGE ?auto_380383 ?auto_380384 ) ( HAVE_IMAGE ?auto_380385 ?auto_380382 ) ( HAVE_IMAGE ?auto_380387 ?auto_380386 ) ( not ( = ?auto_380384 ?auto_380382 ) ) ( not ( = ?auto_380384 ?auto_380386 ) ) ( not ( = ?auto_380384 ?auto_380389 ) ) ( not ( = ?auto_380382 ?auto_380386 ) ) ( not ( = ?auto_380382 ?auto_380389 ) ) ( not ( = ?auto_380386 ?auto_380389 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_380388 ?auto_380389 )
      ( GET-4IMAGE-VERIFY ?auto_380383 ?auto_380384 ?auto_380385 ?auto_380382 ?auto_380387 ?auto_380386 ?auto_380388 ?auto_380389 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_380413 - DIRECTION
      ?auto_380414 - MODE
      ?auto_380415 - DIRECTION
      ?auto_380412 - MODE
      ?auto_380417 - DIRECTION
      ?auto_380416 - MODE
      ?auto_380418 - DIRECTION
      ?auto_380419 - MODE
    )
    :vars
    (
      ?auto_380420 - INSTRUMENT
      ?auto_380421 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_380415 ?auto_380413 ) ) ( not ( = ?auto_380417 ?auto_380413 ) ) ( not ( = ?auto_380417 ?auto_380415 ) ) ( not ( = ?auto_380418 ?auto_380413 ) ) ( not ( = ?auto_380418 ?auto_380415 ) ) ( not ( = ?auto_380418 ?auto_380417 ) ) ( CALIBRATED ?auto_380420 ) ( ON_BOARD ?auto_380420 ?auto_380421 ) ( SUPPORTS ?auto_380420 ?auto_380416 ) ( POWER_ON ?auto_380420 ) ( POINTING ?auto_380421 ?auto_380417 ) ( HAVE_IMAGE ?auto_380413 ?auto_380414 ) ( HAVE_IMAGE ?auto_380415 ?auto_380412 ) ( HAVE_IMAGE ?auto_380418 ?auto_380419 ) ( not ( = ?auto_380414 ?auto_380412 ) ) ( not ( = ?auto_380414 ?auto_380416 ) ) ( not ( = ?auto_380414 ?auto_380419 ) ) ( not ( = ?auto_380412 ?auto_380416 ) ) ( not ( = ?auto_380412 ?auto_380419 ) ) ( not ( = ?auto_380416 ?auto_380419 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_380417 ?auto_380416 )
      ( GET-4IMAGE-VERIFY ?auto_380413 ?auto_380414 ?auto_380415 ?auto_380412 ?auto_380417 ?auto_380416 ?auto_380418 ?auto_380419 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_380559 - DIRECTION
      ?auto_380560 - MODE
      ?auto_380561 - DIRECTION
      ?auto_380558 - MODE
      ?auto_380563 - DIRECTION
      ?auto_380562 - MODE
      ?auto_380564 - DIRECTION
      ?auto_380565 - MODE
    )
    :vars
    (
      ?auto_380566 - INSTRUMENT
      ?auto_380567 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_380561 ?auto_380559 ) ) ( not ( = ?auto_380563 ?auto_380559 ) ) ( not ( = ?auto_380563 ?auto_380561 ) ) ( not ( = ?auto_380564 ?auto_380559 ) ) ( not ( = ?auto_380564 ?auto_380561 ) ) ( not ( = ?auto_380564 ?auto_380563 ) ) ( CALIBRATED ?auto_380566 ) ( ON_BOARD ?auto_380566 ?auto_380567 ) ( SUPPORTS ?auto_380566 ?auto_380558 ) ( POWER_ON ?auto_380566 ) ( POINTING ?auto_380567 ?auto_380561 ) ( HAVE_IMAGE ?auto_380559 ?auto_380560 ) ( HAVE_IMAGE ?auto_380563 ?auto_380562 ) ( HAVE_IMAGE ?auto_380564 ?auto_380565 ) ( not ( = ?auto_380560 ?auto_380558 ) ) ( not ( = ?auto_380560 ?auto_380562 ) ) ( not ( = ?auto_380560 ?auto_380565 ) ) ( not ( = ?auto_380558 ?auto_380562 ) ) ( not ( = ?auto_380558 ?auto_380565 ) ) ( not ( = ?auto_380562 ?auto_380565 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_380561 ?auto_380558 )
      ( GET-4IMAGE-VERIFY ?auto_380559 ?auto_380560 ?auto_380561 ?auto_380558 ?auto_380563 ?auto_380562 ?auto_380564 ?auto_380565 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_381433 - DIRECTION
      ?auto_381434 - MODE
      ?auto_381435 - DIRECTION
      ?auto_381432 - MODE
      ?auto_381437 - DIRECTION
      ?auto_381436 - MODE
      ?auto_381438 - DIRECTION
      ?auto_381439 - MODE
    )
    :vars
    (
      ?auto_381440 - INSTRUMENT
      ?auto_381441 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_381435 ?auto_381433 ) ) ( not ( = ?auto_381437 ?auto_381433 ) ) ( not ( = ?auto_381437 ?auto_381435 ) ) ( not ( = ?auto_381438 ?auto_381433 ) ) ( not ( = ?auto_381438 ?auto_381435 ) ) ( not ( = ?auto_381438 ?auto_381437 ) ) ( CALIBRATED ?auto_381440 ) ( ON_BOARD ?auto_381440 ?auto_381441 ) ( SUPPORTS ?auto_381440 ?auto_381434 ) ( POWER_ON ?auto_381440 ) ( POINTING ?auto_381441 ?auto_381433 ) ( HAVE_IMAGE ?auto_381435 ?auto_381432 ) ( HAVE_IMAGE ?auto_381437 ?auto_381436 ) ( HAVE_IMAGE ?auto_381438 ?auto_381439 ) ( not ( = ?auto_381434 ?auto_381432 ) ) ( not ( = ?auto_381434 ?auto_381436 ) ) ( not ( = ?auto_381434 ?auto_381439 ) ) ( not ( = ?auto_381432 ?auto_381436 ) ) ( not ( = ?auto_381432 ?auto_381439 ) ) ( not ( = ?auto_381436 ?auto_381439 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_381433 ?auto_381434 )
      ( GET-4IMAGE-VERIFY ?auto_381433 ?auto_381434 ?auto_381435 ?auto_381432 ?auto_381437 ?auto_381436 ?auto_381438 ?auto_381439 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_382460 - DIRECTION
      ?auto_382461 - MODE
      ?auto_382462 - DIRECTION
      ?auto_382459 - MODE
      ?auto_382464 - DIRECTION
      ?auto_382463 - MODE
      ?auto_382465 - DIRECTION
      ?auto_382466 - MODE
    )
    :vars
    (
      ?auto_382467 - INSTRUMENT
      ?auto_382468 - SATELLITE
      ?auto_382469 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_382462 ?auto_382460 ) ) ( not ( = ?auto_382464 ?auto_382460 ) ) ( not ( = ?auto_382464 ?auto_382462 ) ) ( not ( = ?auto_382465 ?auto_382460 ) ) ( not ( = ?auto_382465 ?auto_382462 ) ) ( not ( = ?auto_382465 ?auto_382464 ) ) ( CALIBRATED ?auto_382467 ) ( ON_BOARD ?auto_382467 ?auto_382468 ) ( SUPPORTS ?auto_382467 ?auto_382466 ) ( POWER_ON ?auto_382467 ) ( POINTING ?auto_382468 ?auto_382469 ) ( not ( = ?auto_382465 ?auto_382469 ) ) ( HAVE_IMAGE ?auto_382460 ?auto_382461 ) ( not ( = ?auto_382460 ?auto_382469 ) ) ( not ( = ?auto_382461 ?auto_382466 ) ) ( HAVE_IMAGE ?auto_382462 ?auto_382459 ) ( HAVE_IMAGE ?auto_382464 ?auto_382463 ) ( not ( = ?auto_382461 ?auto_382459 ) ) ( not ( = ?auto_382461 ?auto_382463 ) ) ( not ( = ?auto_382462 ?auto_382469 ) ) ( not ( = ?auto_382459 ?auto_382463 ) ) ( not ( = ?auto_382459 ?auto_382466 ) ) ( not ( = ?auto_382464 ?auto_382469 ) ) ( not ( = ?auto_382463 ?auto_382466 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_382460 ?auto_382461 ?auto_382465 ?auto_382466 )
      ( GET-4IMAGE-VERIFY ?auto_382460 ?auto_382461 ?auto_382462 ?auto_382459 ?auto_382464 ?auto_382463 ?auto_382465 ?auto_382466 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_382493 - DIRECTION
      ?auto_382494 - MODE
      ?auto_382495 - DIRECTION
      ?auto_382492 - MODE
      ?auto_382497 - DIRECTION
      ?auto_382496 - MODE
      ?auto_382498 - DIRECTION
      ?auto_382499 - MODE
    )
    :vars
    (
      ?auto_382500 - INSTRUMENT
      ?auto_382501 - SATELLITE
      ?auto_382502 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_382495 ?auto_382493 ) ) ( not ( = ?auto_382497 ?auto_382493 ) ) ( not ( = ?auto_382497 ?auto_382495 ) ) ( not ( = ?auto_382498 ?auto_382493 ) ) ( not ( = ?auto_382498 ?auto_382495 ) ) ( not ( = ?auto_382498 ?auto_382497 ) ) ( CALIBRATED ?auto_382500 ) ( ON_BOARD ?auto_382500 ?auto_382501 ) ( SUPPORTS ?auto_382500 ?auto_382496 ) ( POWER_ON ?auto_382500 ) ( POINTING ?auto_382501 ?auto_382502 ) ( not ( = ?auto_382497 ?auto_382502 ) ) ( HAVE_IMAGE ?auto_382493 ?auto_382494 ) ( not ( = ?auto_382493 ?auto_382502 ) ) ( not ( = ?auto_382494 ?auto_382496 ) ) ( HAVE_IMAGE ?auto_382495 ?auto_382492 ) ( HAVE_IMAGE ?auto_382498 ?auto_382499 ) ( not ( = ?auto_382494 ?auto_382492 ) ) ( not ( = ?auto_382494 ?auto_382499 ) ) ( not ( = ?auto_382495 ?auto_382502 ) ) ( not ( = ?auto_382492 ?auto_382496 ) ) ( not ( = ?auto_382492 ?auto_382499 ) ) ( not ( = ?auto_382496 ?auto_382499 ) ) ( not ( = ?auto_382498 ?auto_382502 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_382493 ?auto_382494 ?auto_382497 ?auto_382496 )
      ( GET-4IMAGE-VERIFY ?auto_382493 ?auto_382494 ?auto_382495 ?auto_382492 ?auto_382497 ?auto_382496 ?auto_382498 ?auto_382499 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_382652 - DIRECTION
      ?auto_382653 - MODE
      ?auto_382654 - DIRECTION
      ?auto_382651 - MODE
      ?auto_382656 - DIRECTION
      ?auto_382655 - MODE
      ?auto_382657 - DIRECTION
      ?auto_382658 - MODE
    )
    :vars
    (
      ?auto_382659 - INSTRUMENT
      ?auto_382660 - SATELLITE
      ?auto_382661 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_382654 ?auto_382652 ) ) ( not ( = ?auto_382656 ?auto_382652 ) ) ( not ( = ?auto_382656 ?auto_382654 ) ) ( not ( = ?auto_382657 ?auto_382652 ) ) ( not ( = ?auto_382657 ?auto_382654 ) ) ( not ( = ?auto_382657 ?auto_382656 ) ) ( CALIBRATED ?auto_382659 ) ( ON_BOARD ?auto_382659 ?auto_382660 ) ( SUPPORTS ?auto_382659 ?auto_382651 ) ( POWER_ON ?auto_382659 ) ( POINTING ?auto_382660 ?auto_382661 ) ( not ( = ?auto_382654 ?auto_382661 ) ) ( HAVE_IMAGE ?auto_382652 ?auto_382653 ) ( not ( = ?auto_382652 ?auto_382661 ) ) ( not ( = ?auto_382653 ?auto_382651 ) ) ( HAVE_IMAGE ?auto_382656 ?auto_382655 ) ( HAVE_IMAGE ?auto_382657 ?auto_382658 ) ( not ( = ?auto_382653 ?auto_382655 ) ) ( not ( = ?auto_382653 ?auto_382658 ) ) ( not ( = ?auto_382651 ?auto_382655 ) ) ( not ( = ?auto_382651 ?auto_382658 ) ) ( not ( = ?auto_382656 ?auto_382661 ) ) ( not ( = ?auto_382655 ?auto_382658 ) ) ( not ( = ?auto_382657 ?auto_382661 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_382652 ?auto_382653 ?auto_382654 ?auto_382651 )
      ( GET-4IMAGE-VERIFY ?auto_382652 ?auto_382653 ?auto_382654 ?auto_382651 ?auto_382656 ?auto_382655 ?auto_382657 ?auto_382658 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_383679 - DIRECTION
      ?auto_383680 - MODE
      ?auto_383681 - DIRECTION
      ?auto_383678 - MODE
      ?auto_383683 - DIRECTION
      ?auto_383682 - MODE
      ?auto_383684 - DIRECTION
      ?auto_383685 - MODE
    )
    :vars
    (
      ?auto_383686 - INSTRUMENT
      ?auto_383687 - SATELLITE
      ?auto_383688 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_383681 ?auto_383679 ) ) ( not ( = ?auto_383683 ?auto_383679 ) ) ( not ( = ?auto_383683 ?auto_383681 ) ) ( not ( = ?auto_383684 ?auto_383679 ) ) ( not ( = ?auto_383684 ?auto_383681 ) ) ( not ( = ?auto_383684 ?auto_383683 ) ) ( CALIBRATED ?auto_383686 ) ( ON_BOARD ?auto_383686 ?auto_383687 ) ( SUPPORTS ?auto_383686 ?auto_383680 ) ( POWER_ON ?auto_383686 ) ( POINTING ?auto_383687 ?auto_383688 ) ( not ( = ?auto_383679 ?auto_383688 ) ) ( HAVE_IMAGE ?auto_383681 ?auto_383678 ) ( not ( = ?auto_383681 ?auto_383688 ) ) ( not ( = ?auto_383678 ?auto_383680 ) ) ( HAVE_IMAGE ?auto_383683 ?auto_383682 ) ( HAVE_IMAGE ?auto_383684 ?auto_383685 ) ( not ( = ?auto_383680 ?auto_383682 ) ) ( not ( = ?auto_383680 ?auto_383685 ) ) ( not ( = ?auto_383678 ?auto_383682 ) ) ( not ( = ?auto_383678 ?auto_383685 ) ) ( not ( = ?auto_383683 ?auto_383688 ) ) ( not ( = ?auto_383682 ?auto_383685 ) ) ( not ( = ?auto_383684 ?auto_383688 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_383681 ?auto_383678 ?auto_383679 ?auto_383680 )
      ( GET-4IMAGE-VERIFY ?auto_383679 ?auto_383680 ?auto_383681 ?auto_383678 ?auto_383683 ?auto_383682 ?auto_383684 ?auto_383685 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_384815 - DIRECTION
      ?auto_384816 - MODE
      ?auto_384817 - DIRECTION
      ?auto_384814 - MODE
      ?auto_384819 - DIRECTION
      ?auto_384818 - MODE
      ?auto_384820 - DIRECTION
      ?auto_384821 - MODE
    )
    :vars
    (
      ?auto_384822 - INSTRUMENT
      ?auto_384823 - SATELLITE
      ?auto_384824 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_384817 ?auto_384815 ) ) ( not ( = ?auto_384819 ?auto_384815 ) ) ( not ( = ?auto_384819 ?auto_384817 ) ) ( not ( = ?auto_384820 ?auto_384815 ) ) ( not ( = ?auto_384820 ?auto_384817 ) ) ( not ( = ?auto_384820 ?auto_384819 ) ) ( ON_BOARD ?auto_384822 ?auto_384823 ) ( SUPPORTS ?auto_384822 ?auto_384821 ) ( POWER_ON ?auto_384822 ) ( POINTING ?auto_384823 ?auto_384824 ) ( not ( = ?auto_384820 ?auto_384824 ) ) ( HAVE_IMAGE ?auto_384815 ?auto_384816 ) ( not ( = ?auto_384815 ?auto_384824 ) ) ( not ( = ?auto_384816 ?auto_384821 ) ) ( CALIBRATION_TARGET ?auto_384822 ?auto_384824 ) ( NOT_CALIBRATED ?auto_384822 ) ( HAVE_IMAGE ?auto_384817 ?auto_384814 ) ( HAVE_IMAGE ?auto_384819 ?auto_384818 ) ( not ( = ?auto_384816 ?auto_384814 ) ) ( not ( = ?auto_384816 ?auto_384818 ) ) ( not ( = ?auto_384817 ?auto_384824 ) ) ( not ( = ?auto_384814 ?auto_384818 ) ) ( not ( = ?auto_384814 ?auto_384821 ) ) ( not ( = ?auto_384819 ?auto_384824 ) ) ( not ( = ?auto_384818 ?auto_384821 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_384815 ?auto_384816 ?auto_384820 ?auto_384821 )
      ( GET-4IMAGE-VERIFY ?auto_384815 ?auto_384816 ?auto_384817 ?auto_384814 ?auto_384819 ?auto_384818 ?auto_384820 ?auto_384821 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_384848 - DIRECTION
      ?auto_384849 - MODE
      ?auto_384850 - DIRECTION
      ?auto_384847 - MODE
      ?auto_384852 - DIRECTION
      ?auto_384851 - MODE
      ?auto_384853 - DIRECTION
      ?auto_384854 - MODE
    )
    :vars
    (
      ?auto_384855 - INSTRUMENT
      ?auto_384856 - SATELLITE
      ?auto_384857 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_384850 ?auto_384848 ) ) ( not ( = ?auto_384852 ?auto_384848 ) ) ( not ( = ?auto_384852 ?auto_384850 ) ) ( not ( = ?auto_384853 ?auto_384848 ) ) ( not ( = ?auto_384853 ?auto_384850 ) ) ( not ( = ?auto_384853 ?auto_384852 ) ) ( ON_BOARD ?auto_384855 ?auto_384856 ) ( SUPPORTS ?auto_384855 ?auto_384851 ) ( POWER_ON ?auto_384855 ) ( POINTING ?auto_384856 ?auto_384857 ) ( not ( = ?auto_384852 ?auto_384857 ) ) ( HAVE_IMAGE ?auto_384848 ?auto_384849 ) ( not ( = ?auto_384848 ?auto_384857 ) ) ( not ( = ?auto_384849 ?auto_384851 ) ) ( CALIBRATION_TARGET ?auto_384855 ?auto_384857 ) ( NOT_CALIBRATED ?auto_384855 ) ( HAVE_IMAGE ?auto_384850 ?auto_384847 ) ( HAVE_IMAGE ?auto_384853 ?auto_384854 ) ( not ( = ?auto_384849 ?auto_384847 ) ) ( not ( = ?auto_384849 ?auto_384854 ) ) ( not ( = ?auto_384850 ?auto_384857 ) ) ( not ( = ?auto_384847 ?auto_384851 ) ) ( not ( = ?auto_384847 ?auto_384854 ) ) ( not ( = ?auto_384851 ?auto_384854 ) ) ( not ( = ?auto_384853 ?auto_384857 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_384848 ?auto_384849 ?auto_384852 ?auto_384851 )
      ( GET-4IMAGE-VERIFY ?auto_384848 ?auto_384849 ?auto_384850 ?auto_384847 ?auto_384852 ?auto_384851 ?auto_384853 ?auto_384854 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_385007 - DIRECTION
      ?auto_385008 - MODE
      ?auto_385009 - DIRECTION
      ?auto_385006 - MODE
      ?auto_385011 - DIRECTION
      ?auto_385010 - MODE
      ?auto_385012 - DIRECTION
      ?auto_385013 - MODE
    )
    :vars
    (
      ?auto_385014 - INSTRUMENT
      ?auto_385015 - SATELLITE
      ?auto_385016 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_385009 ?auto_385007 ) ) ( not ( = ?auto_385011 ?auto_385007 ) ) ( not ( = ?auto_385011 ?auto_385009 ) ) ( not ( = ?auto_385012 ?auto_385007 ) ) ( not ( = ?auto_385012 ?auto_385009 ) ) ( not ( = ?auto_385012 ?auto_385011 ) ) ( ON_BOARD ?auto_385014 ?auto_385015 ) ( SUPPORTS ?auto_385014 ?auto_385006 ) ( POWER_ON ?auto_385014 ) ( POINTING ?auto_385015 ?auto_385016 ) ( not ( = ?auto_385009 ?auto_385016 ) ) ( HAVE_IMAGE ?auto_385007 ?auto_385008 ) ( not ( = ?auto_385007 ?auto_385016 ) ) ( not ( = ?auto_385008 ?auto_385006 ) ) ( CALIBRATION_TARGET ?auto_385014 ?auto_385016 ) ( NOT_CALIBRATED ?auto_385014 ) ( HAVE_IMAGE ?auto_385011 ?auto_385010 ) ( HAVE_IMAGE ?auto_385012 ?auto_385013 ) ( not ( = ?auto_385008 ?auto_385010 ) ) ( not ( = ?auto_385008 ?auto_385013 ) ) ( not ( = ?auto_385006 ?auto_385010 ) ) ( not ( = ?auto_385006 ?auto_385013 ) ) ( not ( = ?auto_385011 ?auto_385016 ) ) ( not ( = ?auto_385010 ?auto_385013 ) ) ( not ( = ?auto_385012 ?auto_385016 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_385007 ?auto_385008 ?auto_385009 ?auto_385006 )
      ( GET-4IMAGE-VERIFY ?auto_385007 ?auto_385008 ?auto_385009 ?auto_385006 ?auto_385011 ?auto_385010 ?auto_385012 ?auto_385013 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_386034 - DIRECTION
      ?auto_386035 - MODE
      ?auto_386036 - DIRECTION
      ?auto_386033 - MODE
      ?auto_386038 - DIRECTION
      ?auto_386037 - MODE
      ?auto_386039 - DIRECTION
      ?auto_386040 - MODE
    )
    :vars
    (
      ?auto_386041 - INSTRUMENT
      ?auto_386042 - SATELLITE
      ?auto_386043 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_386036 ?auto_386034 ) ) ( not ( = ?auto_386038 ?auto_386034 ) ) ( not ( = ?auto_386038 ?auto_386036 ) ) ( not ( = ?auto_386039 ?auto_386034 ) ) ( not ( = ?auto_386039 ?auto_386036 ) ) ( not ( = ?auto_386039 ?auto_386038 ) ) ( ON_BOARD ?auto_386041 ?auto_386042 ) ( SUPPORTS ?auto_386041 ?auto_386035 ) ( POWER_ON ?auto_386041 ) ( POINTING ?auto_386042 ?auto_386043 ) ( not ( = ?auto_386034 ?auto_386043 ) ) ( HAVE_IMAGE ?auto_386036 ?auto_386033 ) ( not ( = ?auto_386036 ?auto_386043 ) ) ( not ( = ?auto_386033 ?auto_386035 ) ) ( CALIBRATION_TARGET ?auto_386041 ?auto_386043 ) ( NOT_CALIBRATED ?auto_386041 ) ( HAVE_IMAGE ?auto_386038 ?auto_386037 ) ( HAVE_IMAGE ?auto_386039 ?auto_386040 ) ( not ( = ?auto_386035 ?auto_386037 ) ) ( not ( = ?auto_386035 ?auto_386040 ) ) ( not ( = ?auto_386033 ?auto_386037 ) ) ( not ( = ?auto_386033 ?auto_386040 ) ) ( not ( = ?auto_386038 ?auto_386043 ) ) ( not ( = ?auto_386037 ?auto_386040 ) ) ( not ( = ?auto_386039 ?auto_386043 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_386036 ?auto_386033 ?auto_386034 ?auto_386035 )
      ( GET-4IMAGE-VERIFY ?auto_386034 ?auto_386035 ?auto_386036 ?auto_386033 ?auto_386038 ?auto_386037 ?auto_386039 ?auto_386040 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_387170 - DIRECTION
      ?auto_387171 - MODE
      ?auto_387172 - DIRECTION
      ?auto_387169 - MODE
      ?auto_387174 - DIRECTION
      ?auto_387173 - MODE
      ?auto_387175 - DIRECTION
      ?auto_387176 - MODE
    )
    :vars
    (
      ?auto_387177 - INSTRUMENT
      ?auto_387178 - SATELLITE
      ?auto_387179 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_387172 ?auto_387170 ) ) ( not ( = ?auto_387174 ?auto_387170 ) ) ( not ( = ?auto_387174 ?auto_387172 ) ) ( not ( = ?auto_387175 ?auto_387170 ) ) ( not ( = ?auto_387175 ?auto_387172 ) ) ( not ( = ?auto_387175 ?auto_387174 ) ) ( ON_BOARD ?auto_387177 ?auto_387178 ) ( SUPPORTS ?auto_387177 ?auto_387176 ) ( POINTING ?auto_387178 ?auto_387179 ) ( not ( = ?auto_387175 ?auto_387179 ) ) ( HAVE_IMAGE ?auto_387170 ?auto_387171 ) ( not ( = ?auto_387170 ?auto_387179 ) ) ( not ( = ?auto_387171 ?auto_387176 ) ) ( CALIBRATION_TARGET ?auto_387177 ?auto_387179 ) ( POWER_AVAIL ?auto_387178 ) ( HAVE_IMAGE ?auto_387172 ?auto_387169 ) ( HAVE_IMAGE ?auto_387174 ?auto_387173 ) ( not ( = ?auto_387171 ?auto_387169 ) ) ( not ( = ?auto_387171 ?auto_387173 ) ) ( not ( = ?auto_387172 ?auto_387179 ) ) ( not ( = ?auto_387169 ?auto_387173 ) ) ( not ( = ?auto_387169 ?auto_387176 ) ) ( not ( = ?auto_387174 ?auto_387179 ) ) ( not ( = ?auto_387173 ?auto_387176 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_387170 ?auto_387171 ?auto_387175 ?auto_387176 )
      ( GET-4IMAGE-VERIFY ?auto_387170 ?auto_387171 ?auto_387172 ?auto_387169 ?auto_387174 ?auto_387173 ?auto_387175 ?auto_387176 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_387203 - DIRECTION
      ?auto_387204 - MODE
      ?auto_387205 - DIRECTION
      ?auto_387202 - MODE
      ?auto_387207 - DIRECTION
      ?auto_387206 - MODE
      ?auto_387208 - DIRECTION
      ?auto_387209 - MODE
    )
    :vars
    (
      ?auto_387210 - INSTRUMENT
      ?auto_387211 - SATELLITE
      ?auto_387212 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_387205 ?auto_387203 ) ) ( not ( = ?auto_387207 ?auto_387203 ) ) ( not ( = ?auto_387207 ?auto_387205 ) ) ( not ( = ?auto_387208 ?auto_387203 ) ) ( not ( = ?auto_387208 ?auto_387205 ) ) ( not ( = ?auto_387208 ?auto_387207 ) ) ( ON_BOARD ?auto_387210 ?auto_387211 ) ( SUPPORTS ?auto_387210 ?auto_387206 ) ( POINTING ?auto_387211 ?auto_387212 ) ( not ( = ?auto_387207 ?auto_387212 ) ) ( HAVE_IMAGE ?auto_387203 ?auto_387204 ) ( not ( = ?auto_387203 ?auto_387212 ) ) ( not ( = ?auto_387204 ?auto_387206 ) ) ( CALIBRATION_TARGET ?auto_387210 ?auto_387212 ) ( POWER_AVAIL ?auto_387211 ) ( HAVE_IMAGE ?auto_387205 ?auto_387202 ) ( HAVE_IMAGE ?auto_387208 ?auto_387209 ) ( not ( = ?auto_387204 ?auto_387202 ) ) ( not ( = ?auto_387204 ?auto_387209 ) ) ( not ( = ?auto_387205 ?auto_387212 ) ) ( not ( = ?auto_387202 ?auto_387206 ) ) ( not ( = ?auto_387202 ?auto_387209 ) ) ( not ( = ?auto_387206 ?auto_387209 ) ) ( not ( = ?auto_387208 ?auto_387212 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_387203 ?auto_387204 ?auto_387207 ?auto_387206 )
      ( GET-4IMAGE-VERIFY ?auto_387203 ?auto_387204 ?auto_387205 ?auto_387202 ?auto_387207 ?auto_387206 ?auto_387208 ?auto_387209 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_387362 - DIRECTION
      ?auto_387363 - MODE
      ?auto_387364 - DIRECTION
      ?auto_387361 - MODE
      ?auto_387366 - DIRECTION
      ?auto_387365 - MODE
      ?auto_387367 - DIRECTION
      ?auto_387368 - MODE
    )
    :vars
    (
      ?auto_387369 - INSTRUMENT
      ?auto_387370 - SATELLITE
      ?auto_387371 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_387364 ?auto_387362 ) ) ( not ( = ?auto_387366 ?auto_387362 ) ) ( not ( = ?auto_387366 ?auto_387364 ) ) ( not ( = ?auto_387367 ?auto_387362 ) ) ( not ( = ?auto_387367 ?auto_387364 ) ) ( not ( = ?auto_387367 ?auto_387366 ) ) ( ON_BOARD ?auto_387369 ?auto_387370 ) ( SUPPORTS ?auto_387369 ?auto_387361 ) ( POINTING ?auto_387370 ?auto_387371 ) ( not ( = ?auto_387364 ?auto_387371 ) ) ( HAVE_IMAGE ?auto_387362 ?auto_387363 ) ( not ( = ?auto_387362 ?auto_387371 ) ) ( not ( = ?auto_387363 ?auto_387361 ) ) ( CALIBRATION_TARGET ?auto_387369 ?auto_387371 ) ( POWER_AVAIL ?auto_387370 ) ( HAVE_IMAGE ?auto_387366 ?auto_387365 ) ( HAVE_IMAGE ?auto_387367 ?auto_387368 ) ( not ( = ?auto_387363 ?auto_387365 ) ) ( not ( = ?auto_387363 ?auto_387368 ) ) ( not ( = ?auto_387361 ?auto_387365 ) ) ( not ( = ?auto_387361 ?auto_387368 ) ) ( not ( = ?auto_387366 ?auto_387371 ) ) ( not ( = ?auto_387365 ?auto_387368 ) ) ( not ( = ?auto_387367 ?auto_387371 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_387362 ?auto_387363 ?auto_387364 ?auto_387361 )
      ( GET-4IMAGE-VERIFY ?auto_387362 ?auto_387363 ?auto_387364 ?auto_387361 ?auto_387366 ?auto_387365 ?auto_387367 ?auto_387368 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_388389 - DIRECTION
      ?auto_388390 - MODE
      ?auto_388391 - DIRECTION
      ?auto_388388 - MODE
      ?auto_388393 - DIRECTION
      ?auto_388392 - MODE
      ?auto_388394 - DIRECTION
      ?auto_388395 - MODE
    )
    :vars
    (
      ?auto_388396 - INSTRUMENT
      ?auto_388397 - SATELLITE
      ?auto_388398 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_388391 ?auto_388389 ) ) ( not ( = ?auto_388393 ?auto_388389 ) ) ( not ( = ?auto_388393 ?auto_388391 ) ) ( not ( = ?auto_388394 ?auto_388389 ) ) ( not ( = ?auto_388394 ?auto_388391 ) ) ( not ( = ?auto_388394 ?auto_388393 ) ) ( ON_BOARD ?auto_388396 ?auto_388397 ) ( SUPPORTS ?auto_388396 ?auto_388390 ) ( POINTING ?auto_388397 ?auto_388398 ) ( not ( = ?auto_388389 ?auto_388398 ) ) ( HAVE_IMAGE ?auto_388391 ?auto_388388 ) ( not ( = ?auto_388391 ?auto_388398 ) ) ( not ( = ?auto_388388 ?auto_388390 ) ) ( CALIBRATION_TARGET ?auto_388396 ?auto_388398 ) ( POWER_AVAIL ?auto_388397 ) ( HAVE_IMAGE ?auto_388393 ?auto_388392 ) ( HAVE_IMAGE ?auto_388394 ?auto_388395 ) ( not ( = ?auto_388390 ?auto_388392 ) ) ( not ( = ?auto_388390 ?auto_388395 ) ) ( not ( = ?auto_388388 ?auto_388392 ) ) ( not ( = ?auto_388388 ?auto_388395 ) ) ( not ( = ?auto_388393 ?auto_388398 ) ) ( not ( = ?auto_388392 ?auto_388395 ) ) ( not ( = ?auto_388394 ?auto_388398 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388391 ?auto_388388 ?auto_388389 ?auto_388390 )
      ( GET-4IMAGE-VERIFY ?auto_388389 ?auto_388390 ?auto_388391 ?auto_388388 ?auto_388393 ?auto_388392 ?auto_388394 ?auto_388395 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_389136 - DIRECTION
      ?auto_389137 - MODE
      ?auto_389138 - DIRECTION
      ?auto_389135 - MODE
      ?auto_389140 - DIRECTION
      ?auto_389139 - MODE
    )
    :vars
    (
      ?auto_389144 - INSTRUMENT
      ?auto_389142 - SATELLITE
      ?auto_389141 - DIRECTION
      ?auto_389143 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_389138 ?auto_389136 ) ) ( not ( = ?auto_389140 ?auto_389136 ) ) ( not ( = ?auto_389140 ?auto_389138 ) ) ( ON_BOARD ?auto_389144 ?auto_389142 ) ( SUPPORTS ?auto_389144 ?auto_389139 ) ( not ( = ?auto_389140 ?auto_389141 ) ) ( HAVE_IMAGE ?auto_389136 ?auto_389137 ) ( not ( = ?auto_389136 ?auto_389141 ) ) ( not ( = ?auto_389137 ?auto_389139 ) ) ( CALIBRATION_TARGET ?auto_389144 ?auto_389141 ) ( POWER_AVAIL ?auto_389142 ) ( POINTING ?auto_389142 ?auto_389143 ) ( not ( = ?auto_389141 ?auto_389143 ) ) ( not ( = ?auto_389140 ?auto_389143 ) ) ( not ( = ?auto_389136 ?auto_389143 ) ) ( HAVE_IMAGE ?auto_389138 ?auto_389135 ) ( not ( = ?auto_389137 ?auto_389135 ) ) ( not ( = ?auto_389138 ?auto_389141 ) ) ( not ( = ?auto_389138 ?auto_389143 ) ) ( not ( = ?auto_389135 ?auto_389139 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389136 ?auto_389137 ?auto_389140 ?auto_389139 )
      ( GET-3IMAGE-VERIFY ?auto_389136 ?auto_389137 ?auto_389138 ?auto_389135 ?auto_389140 ?auto_389139 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_389165 - DIRECTION
      ?auto_389166 - MODE
      ?auto_389167 - DIRECTION
      ?auto_389164 - MODE
      ?auto_389169 - DIRECTION
      ?auto_389168 - MODE
    )
    :vars
    (
      ?auto_389173 - INSTRUMENT
      ?auto_389171 - SATELLITE
      ?auto_389170 - DIRECTION
      ?auto_389172 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_389167 ?auto_389165 ) ) ( not ( = ?auto_389169 ?auto_389165 ) ) ( not ( = ?auto_389169 ?auto_389167 ) ) ( ON_BOARD ?auto_389173 ?auto_389171 ) ( SUPPORTS ?auto_389173 ?auto_389164 ) ( not ( = ?auto_389167 ?auto_389170 ) ) ( HAVE_IMAGE ?auto_389165 ?auto_389166 ) ( not ( = ?auto_389165 ?auto_389170 ) ) ( not ( = ?auto_389166 ?auto_389164 ) ) ( CALIBRATION_TARGET ?auto_389173 ?auto_389170 ) ( POWER_AVAIL ?auto_389171 ) ( POINTING ?auto_389171 ?auto_389172 ) ( not ( = ?auto_389170 ?auto_389172 ) ) ( not ( = ?auto_389167 ?auto_389172 ) ) ( not ( = ?auto_389165 ?auto_389172 ) ) ( HAVE_IMAGE ?auto_389169 ?auto_389168 ) ( not ( = ?auto_389166 ?auto_389168 ) ) ( not ( = ?auto_389164 ?auto_389168 ) ) ( not ( = ?auto_389169 ?auto_389170 ) ) ( not ( = ?auto_389169 ?auto_389172 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389165 ?auto_389166 ?auto_389167 ?auto_389164 )
      ( GET-3IMAGE-VERIFY ?auto_389165 ?auto_389166 ?auto_389167 ?auto_389164 ?auto_389169 ?auto_389168 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_389327 - DIRECTION
      ?auto_389328 - MODE
      ?auto_389329 - DIRECTION
      ?auto_389326 - MODE
      ?auto_389331 - DIRECTION
      ?auto_389330 - MODE
    )
    :vars
    (
      ?auto_389335 - INSTRUMENT
      ?auto_389333 - SATELLITE
      ?auto_389332 - DIRECTION
      ?auto_389334 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_389329 ?auto_389327 ) ) ( not ( = ?auto_389331 ?auto_389327 ) ) ( not ( = ?auto_389331 ?auto_389329 ) ) ( ON_BOARD ?auto_389335 ?auto_389333 ) ( SUPPORTS ?auto_389335 ?auto_389328 ) ( not ( = ?auto_389327 ?auto_389332 ) ) ( HAVE_IMAGE ?auto_389329 ?auto_389326 ) ( not ( = ?auto_389329 ?auto_389332 ) ) ( not ( = ?auto_389326 ?auto_389328 ) ) ( CALIBRATION_TARGET ?auto_389335 ?auto_389332 ) ( POWER_AVAIL ?auto_389333 ) ( POINTING ?auto_389333 ?auto_389334 ) ( not ( = ?auto_389332 ?auto_389334 ) ) ( not ( = ?auto_389327 ?auto_389334 ) ) ( not ( = ?auto_389329 ?auto_389334 ) ) ( HAVE_IMAGE ?auto_389331 ?auto_389330 ) ( not ( = ?auto_389328 ?auto_389330 ) ) ( not ( = ?auto_389326 ?auto_389330 ) ) ( not ( = ?auto_389331 ?auto_389332 ) ) ( not ( = ?auto_389331 ?auto_389334 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389329 ?auto_389326 ?auto_389327 ?auto_389328 )
      ( GET-3IMAGE-VERIFY ?auto_389327 ?auto_389328 ?auto_389329 ?auto_389326 ?auto_389331 ?auto_389330 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389580 - DIRECTION
      ?auto_389581 - MODE
      ?auto_389582 - DIRECTION
      ?auto_389579 - MODE
      ?auto_389584 - DIRECTION
      ?auto_389583 - MODE
      ?auto_389585 - DIRECTION
      ?auto_389586 - MODE
    )
    :vars
    (
      ?auto_389589 - INSTRUMENT
      ?auto_389588 - SATELLITE
      ?auto_389587 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_389582 ?auto_389580 ) ) ( not ( = ?auto_389584 ?auto_389580 ) ) ( not ( = ?auto_389584 ?auto_389582 ) ) ( not ( = ?auto_389585 ?auto_389580 ) ) ( not ( = ?auto_389585 ?auto_389582 ) ) ( not ( = ?auto_389585 ?auto_389584 ) ) ( ON_BOARD ?auto_389589 ?auto_389588 ) ( SUPPORTS ?auto_389589 ?auto_389586 ) ( not ( = ?auto_389585 ?auto_389587 ) ) ( HAVE_IMAGE ?auto_389580 ?auto_389581 ) ( not ( = ?auto_389580 ?auto_389587 ) ) ( not ( = ?auto_389581 ?auto_389586 ) ) ( CALIBRATION_TARGET ?auto_389589 ?auto_389587 ) ( POWER_AVAIL ?auto_389588 ) ( POINTING ?auto_389588 ?auto_389584 ) ( not ( = ?auto_389587 ?auto_389584 ) ) ( HAVE_IMAGE ?auto_389582 ?auto_389579 ) ( HAVE_IMAGE ?auto_389584 ?auto_389583 ) ( not ( = ?auto_389581 ?auto_389579 ) ) ( not ( = ?auto_389581 ?auto_389583 ) ) ( not ( = ?auto_389582 ?auto_389587 ) ) ( not ( = ?auto_389579 ?auto_389583 ) ) ( not ( = ?auto_389579 ?auto_389586 ) ) ( not ( = ?auto_389583 ?auto_389586 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389580 ?auto_389581 ?auto_389585 ?auto_389586 )
      ( GET-4IMAGE-VERIFY ?auto_389580 ?auto_389581 ?auto_389582 ?auto_389579 ?auto_389584 ?auto_389583 ?auto_389585 ?auto_389586 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389615 - DIRECTION
      ?auto_389616 - MODE
      ?auto_389617 - DIRECTION
      ?auto_389614 - MODE
      ?auto_389619 - DIRECTION
      ?auto_389618 - MODE
      ?auto_389620 - DIRECTION
      ?auto_389621 - MODE
    )
    :vars
    (
      ?auto_389624 - INSTRUMENT
      ?auto_389623 - SATELLITE
      ?auto_389622 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_389617 ?auto_389615 ) ) ( not ( = ?auto_389619 ?auto_389615 ) ) ( not ( = ?auto_389619 ?auto_389617 ) ) ( not ( = ?auto_389620 ?auto_389615 ) ) ( not ( = ?auto_389620 ?auto_389617 ) ) ( not ( = ?auto_389620 ?auto_389619 ) ) ( ON_BOARD ?auto_389624 ?auto_389623 ) ( SUPPORTS ?auto_389624 ?auto_389618 ) ( not ( = ?auto_389619 ?auto_389622 ) ) ( HAVE_IMAGE ?auto_389615 ?auto_389616 ) ( not ( = ?auto_389615 ?auto_389622 ) ) ( not ( = ?auto_389616 ?auto_389618 ) ) ( CALIBRATION_TARGET ?auto_389624 ?auto_389622 ) ( POWER_AVAIL ?auto_389623 ) ( POINTING ?auto_389623 ?auto_389620 ) ( not ( = ?auto_389622 ?auto_389620 ) ) ( HAVE_IMAGE ?auto_389617 ?auto_389614 ) ( HAVE_IMAGE ?auto_389620 ?auto_389621 ) ( not ( = ?auto_389616 ?auto_389614 ) ) ( not ( = ?auto_389616 ?auto_389621 ) ) ( not ( = ?auto_389617 ?auto_389622 ) ) ( not ( = ?auto_389614 ?auto_389618 ) ) ( not ( = ?auto_389614 ?auto_389621 ) ) ( not ( = ?auto_389618 ?auto_389621 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389615 ?auto_389616 ?auto_389619 ?auto_389618 )
      ( GET-4IMAGE-VERIFY ?auto_389615 ?auto_389616 ?auto_389617 ?auto_389614 ?auto_389619 ?auto_389618 ?auto_389620 ?auto_389621 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389649 - DIRECTION
      ?auto_389650 - MODE
      ?auto_389651 - DIRECTION
      ?auto_389648 - MODE
      ?auto_389653 - DIRECTION
      ?auto_389652 - MODE
      ?auto_389654 - DIRECTION
      ?auto_389655 - MODE
    )
    :vars
    (
      ?auto_389658 - INSTRUMENT
      ?auto_389657 - SATELLITE
      ?auto_389656 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_389651 ?auto_389649 ) ) ( not ( = ?auto_389653 ?auto_389649 ) ) ( not ( = ?auto_389653 ?auto_389651 ) ) ( not ( = ?auto_389654 ?auto_389649 ) ) ( not ( = ?auto_389654 ?auto_389651 ) ) ( not ( = ?auto_389654 ?auto_389653 ) ) ( ON_BOARD ?auto_389658 ?auto_389657 ) ( SUPPORTS ?auto_389658 ?auto_389655 ) ( not ( = ?auto_389654 ?auto_389656 ) ) ( HAVE_IMAGE ?auto_389649 ?auto_389650 ) ( not ( = ?auto_389649 ?auto_389656 ) ) ( not ( = ?auto_389650 ?auto_389655 ) ) ( CALIBRATION_TARGET ?auto_389658 ?auto_389656 ) ( POWER_AVAIL ?auto_389657 ) ( POINTING ?auto_389657 ?auto_389651 ) ( not ( = ?auto_389656 ?auto_389651 ) ) ( HAVE_IMAGE ?auto_389651 ?auto_389648 ) ( HAVE_IMAGE ?auto_389653 ?auto_389652 ) ( not ( = ?auto_389650 ?auto_389648 ) ) ( not ( = ?auto_389650 ?auto_389652 ) ) ( not ( = ?auto_389648 ?auto_389652 ) ) ( not ( = ?auto_389648 ?auto_389655 ) ) ( not ( = ?auto_389653 ?auto_389656 ) ) ( not ( = ?auto_389652 ?auto_389655 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389649 ?auto_389650 ?auto_389654 ?auto_389655 )
      ( GET-4IMAGE-VERIFY ?auto_389649 ?auto_389650 ?auto_389651 ?auto_389648 ?auto_389653 ?auto_389652 ?auto_389654 ?auto_389655 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389682 - DIRECTION
      ?auto_389683 - MODE
      ?auto_389684 - DIRECTION
      ?auto_389681 - MODE
      ?auto_389686 - DIRECTION
      ?auto_389685 - MODE
      ?auto_389687 - DIRECTION
      ?auto_389688 - MODE
    )
    :vars
    (
      ?auto_389691 - INSTRUMENT
      ?auto_389690 - SATELLITE
      ?auto_389689 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_389684 ?auto_389682 ) ) ( not ( = ?auto_389686 ?auto_389682 ) ) ( not ( = ?auto_389686 ?auto_389684 ) ) ( not ( = ?auto_389687 ?auto_389682 ) ) ( not ( = ?auto_389687 ?auto_389684 ) ) ( not ( = ?auto_389687 ?auto_389686 ) ) ( ON_BOARD ?auto_389691 ?auto_389690 ) ( SUPPORTS ?auto_389691 ?auto_389685 ) ( not ( = ?auto_389686 ?auto_389689 ) ) ( HAVE_IMAGE ?auto_389682 ?auto_389683 ) ( not ( = ?auto_389682 ?auto_389689 ) ) ( not ( = ?auto_389683 ?auto_389685 ) ) ( CALIBRATION_TARGET ?auto_389691 ?auto_389689 ) ( POWER_AVAIL ?auto_389690 ) ( POINTING ?auto_389690 ?auto_389684 ) ( not ( = ?auto_389689 ?auto_389684 ) ) ( HAVE_IMAGE ?auto_389684 ?auto_389681 ) ( HAVE_IMAGE ?auto_389687 ?auto_389688 ) ( not ( = ?auto_389683 ?auto_389681 ) ) ( not ( = ?auto_389683 ?auto_389688 ) ) ( not ( = ?auto_389681 ?auto_389685 ) ) ( not ( = ?auto_389681 ?auto_389688 ) ) ( not ( = ?auto_389685 ?auto_389688 ) ) ( not ( = ?auto_389687 ?auto_389689 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389682 ?auto_389683 ?auto_389686 ?auto_389685 )
      ( GET-4IMAGE-VERIFY ?auto_389682 ?auto_389683 ?auto_389684 ?auto_389681 ?auto_389686 ?auto_389685 ?auto_389687 ?auto_389688 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389786 - DIRECTION
      ?auto_389787 - MODE
      ?auto_389788 - DIRECTION
      ?auto_389785 - MODE
      ?auto_389790 - DIRECTION
      ?auto_389789 - MODE
      ?auto_389791 - DIRECTION
      ?auto_389792 - MODE
    )
    :vars
    (
      ?auto_389795 - INSTRUMENT
      ?auto_389794 - SATELLITE
      ?auto_389793 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_389788 ?auto_389786 ) ) ( not ( = ?auto_389790 ?auto_389786 ) ) ( not ( = ?auto_389790 ?auto_389788 ) ) ( not ( = ?auto_389791 ?auto_389786 ) ) ( not ( = ?auto_389791 ?auto_389788 ) ) ( not ( = ?auto_389791 ?auto_389790 ) ) ( ON_BOARD ?auto_389795 ?auto_389794 ) ( SUPPORTS ?auto_389795 ?auto_389785 ) ( not ( = ?auto_389788 ?auto_389793 ) ) ( HAVE_IMAGE ?auto_389786 ?auto_389787 ) ( not ( = ?auto_389786 ?auto_389793 ) ) ( not ( = ?auto_389787 ?auto_389785 ) ) ( CALIBRATION_TARGET ?auto_389795 ?auto_389793 ) ( POWER_AVAIL ?auto_389794 ) ( POINTING ?auto_389794 ?auto_389791 ) ( not ( = ?auto_389793 ?auto_389791 ) ) ( HAVE_IMAGE ?auto_389790 ?auto_389789 ) ( HAVE_IMAGE ?auto_389791 ?auto_389792 ) ( not ( = ?auto_389787 ?auto_389789 ) ) ( not ( = ?auto_389787 ?auto_389792 ) ) ( not ( = ?auto_389785 ?auto_389789 ) ) ( not ( = ?auto_389785 ?auto_389792 ) ) ( not ( = ?auto_389790 ?auto_389793 ) ) ( not ( = ?auto_389789 ?auto_389792 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389786 ?auto_389787 ?auto_389788 ?auto_389785 )
      ( GET-4IMAGE-VERIFY ?auto_389786 ?auto_389787 ?auto_389788 ?auto_389785 ?auto_389790 ?auto_389789 ?auto_389791 ?auto_389792 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389820 - DIRECTION
      ?auto_389821 - MODE
      ?auto_389822 - DIRECTION
      ?auto_389819 - MODE
      ?auto_389824 - DIRECTION
      ?auto_389823 - MODE
      ?auto_389825 - DIRECTION
      ?auto_389826 - MODE
    )
    :vars
    (
      ?auto_389829 - INSTRUMENT
      ?auto_389828 - SATELLITE
      ?auto_389827 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_389822 ?auto_389820 ) ) ( not ( = ?auto_389824 ?auto_389820 ) ) ( not ( = ?auto_389824 ?auto_389822 ) ) ( not ( = ?auto_389825 ?auto_389820 ) ) ( not ( = ?auto_389825 ?auto_389822 ) ) ( not ( = ?auto_389825 ?auto_389824 ) ) ( ON_BOARD ?auto_389829 ?auto_389828 ) ( SUPPORTS ?auto_389829 ?auto_389819 ) ( not ( = ?auto_389822 ?auto_389827 ) ) ( HAVE_IMAGE ?auto_389820 ?auto_389821 ) ( not ( = ?auto_389820 ?auto_389827 ) ) ( not ( = ?auto_389821 ?auto_389819 ) ) ( CALIBRATION_TARGET ?auto_389829 ?auto_389827 ) ( POWER_AVAIL ?auto_389828 ) ( POINTING ?auto_389828 ?auto_389824 ) ( not ( = ?auto_389827 ?auto_389824 ) ) ( HAVE_IMAGE ?auto_389824 ?auto_389823 ) ( HAVE_IMAGE ?auto_389825 ?auto_389826 ) ( not ( = ?auto_389821 ?auto_389823 ) ) ( not ( = ?auto_389821 ?auto_389826 ) ) ( not ( = ?auto_389819 ?auto_389823 ) ) ( not ( = ?auto_389819 ?auto_389826 ) ) ( not ( = ?auto_389823 ?auto_389826 ) ) ( not ( = ?auto_389825 ?auto_389827 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389820 ?auto_389821 ?auto_389822 ?auto_389819 )
      ( GET-4IMAGE-VERIFY ?auto_389820 ?auto_389821 ?auto_389822 ?auto_389819 ?auto_389824 ?auto_389823 ?auto_389825 ?auto_389826 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390357 - DIRECTION
      ?auto_390358 - MODE
      ?auto_390359 - DIRECTION
      ?auto_390356 - MODE
      ?auto_390361 - DIRECTION
      ?auto_390360 - MODE
      ?auto_390362 - DIRECTION
      ?auto_390363 - MODE
    )
    :vars
    (
      ?auto_390366 - INSTRUMENT
      ?auto_390365 - SATELLITE
      ?auto_390364 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_390359 ?auto_390357 ) ) ( not ( = ?auto_390361 ?auto_390357 ) ) ( not ( = ?auto_390361 ?auto_390359 ) ) ( not ( = ?auto_390362 ?auto_390357 ) ) ( not ( = ?auto_390362 ?auto_390359 ) ) ( not ( = ?auto_390362 ?auto_390361 ) ) ( ON_BOARD ?auto_390366 ?auto_390365 ) ( SUPPORTS ?auto_390366 ?auto_390363 ) ( not ( = ?auto_390362 ?auto_390364 ) ) ( HAVE_IMAGE ?auto_390359 ?auto_390356 ) ( not ( = ?auto_390359 ?auto_390364 ) ) ( not ( = ?auto_390356 ?auto_390363 ) ) ( CALIBRATION_TARGET ?auto_390366 ?auto_390364 ) ( POWER_AVAIL ?auto_390365 ) ( POINTING ?auto_390365 ?auto_390357 ) ( not ( = ?auto_390364 ?auto_390357 ) ) ( HAVE_IMAGE ?auto_390357 ?auto_390358 ) ( HAVE_IMAGE ?auto_390361 ?auto_390360 ) ( not ( = ?auto_390358 ?auto_390356 ) ) ( not ( = ?auto_390358 ?auto_390360 ) ) ( not ( = ?auto_390358 ?auto_390363 ) ) ( not ( = ?auto_390356 ?auto_390360 ) ) ( not ( = ?auto_390361 ?auto_390364 ) ) ( not ( = ?auto_390360 ?auto_390363 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390359 ?auto_390356 ?auto_390362 ?auto_390363 )
      ( GET-4IMAGE-VERIFY ?auto_390357 ?auto_390358 ?auto_390359 ?auto_390356 ?auto_390361 ?auto_390360 ?auto_390362 ?auto_390363 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390390 - DIRECTION
      ?auto_390391 - MODE
      ?auto_390392 - DIRECTION
      ?auto_390389 - MODE
      ?auto_390394 - DIRECTION
      ?auto_390393 - MODE
      ?auto_390395 - DIRECTION
      ?auto_390396 - MODE
    )
    :vars
    (
      ?auto_390399 - INSTRUMENT
      ?auto_390398 - SATELLITE
      ?auto_390397 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_390392 ?auto_390390 ) ) ( not ( = ?auto_390394 ?auto_390390 ) ) ( not ( = ?auto_390394 ?auto_390392 ) ) ( not ( = ?auto_390395 ?auto_390390 ) ) ( not ( = ?auto_390395 ?auto_390392 ) ) ( not ( = ?auto_390395 ?auto_390394 ) ) ( ON_BOARD ?auto_390399 ?auto_390398 ) ( SUPPORTS ?auto_390399 ?auto_390393 ) ( not ( = ?auto_390394 ?auto_390397 ) ) ( HAVE_IMAGE ?auto_390392 ?auto_390389 ) ( not ( = ?auto_390392 ?auto_390397 ) ) ( not ( = ?auto_390389 ?auto_390393 ) ) ( CALIBRATION_TARGET ?auto_390399 ?auto_390397 ) ( POWER_AVAIL ?auto_390398 ) ( POINTING ?auto_390398 ?auto_390390 ) ( not ( = ?auto_390397 ?auto_390390 ) ) ( HAVE_IMAGE ?auto_390390 ?auto_390391 ) ( HAVE_IMAGE ?auto_390395 ?auto_390396 ) ( not ( = ?auto_390391 ?auto_390389 ) ) ( not ( = ?auto_390391 ?auto_390393 ) ) ( not ( = ?auto_390391 ?auto_390396 ) ) ( not ( = ?auto_390389 ?auto_390396 ) ) ( not ( = ?auto_390393 ?auto_390396 ) ) ( not ( = ?auto_390395 ?auto_390397 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390392 ?auto_390389 ?auto_390394 ?auto_390393 )
      ( GET-4IMAGE-VERIFY ?auto_390390 ?auto_390391 ?auto_390392 ?auto_390389 ?auto_390394 ?auto_390393 ?auto_390395 ?auto_390396 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390602 - DIRECTION
      ?auto_390603 - MODE
      ?auto_390604 - DIRECTION
      ?auto_390601 - MODE
      ?auto_390606 - DIRECTION
      ?auto_390605 - MODE
      ?auto_390607 - DIRECTION
      ?auto_390608 - MODE
    )
    :vars
    (
      ?auto_390611 - INSTRUMENT
      ?auto_390610 - SATELLITE
      ?auto_390609 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_390604 ?auto_390602 ) ) ( not ( = ?auto_390606 ?auto_390602 ) ) ( not ( = ?auto_390606 ?auto_390604 ) ) ( not ( = ?auto_390607 ?auto_390602 ) ) ( not ( = ?auto_390607 ?auto_390604 ) ) ( not ( = ?auto_390607 ?auto_390606 ) ) ( ON_BOARD ?auto_390611 ?auto_390610 ) ( SUPPORTS ?auto_390611 ?auto_390601 ) ( not ( = ?auto_390604 ?auto_390609 ) ) ( HAVE_IMAGE ?auto_390606 ?auto_390605 ) ( not ( = ?auto_390606 ?auto_390609 ) ) ( not ( = ?auto_390605 ?auto_390601 ) ) ( CALIBRATION_TARGET ?auto_390611 ?auto_390609 ) ( POWER_AVAIL ?auto_390610 ) ( POINTING ?auto_390610 ?auto_390602 ) ( not ( = ?auto_390609 ?auto_390602 ) ) ( HAVE_IMAGE ?auto_390602 ?auto_390603 ) ( HAVE_IMAGE ?auto_390607 ?auto_390608 ) ( not ( = ?auto_390603 ?auto_390601 ) ) ( not ( = ?auto_390603 ?auto_390605 ) ) ( not ( = ?auto_390603 ?auto_390608 ) ) ( not ( = ?auto_390601 ?auto_390608 ) ) ( not ( = ?auto_390605 ?auto_390608 ) ) ( not ( = ?auto_390607 ?auto_390609 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390606 ?auto_390605 ?auto_390604 ?auto_390601 )
      ( GET-4IMAGE-VERIFY ?auto_390602 ?auto_390603 ?auto_390604 ?auto_390601 ?auto_390606 ?auto_390605 ?auto_390607 ?auto_390608 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390853 - DIRECTION
      ?auto_390854 - MODE
      ?auto_390855 - DIRECTION
      ?auto_390852 - MODE
      ?auto_390857 - DIRECTION
      ?auto_390856 - MODE
      ?auto_390858 - DIRECTION
      ?auto_390859 - MODE
    )
    :vars
    (
      ?auto_390862 - INSTRUMENT
      ?auto_390861 - SATELLITE
      ?auto_390860 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_390855 ?auto_390853 ) ) ( not ( = ?auto_390857 ?auto_390853 ) ) ( not ( = ?auto_390857 ?auto_390855 ) ) ( not ( = ?auto_390858 ?auto_390853 ) ) ( not ( = ?auto_390858 ?auto_390855 ) ) ( not ( = ?auto_390858 ?auto_390857 ) ) ( ON_BOARD ?auto_390862 ?auto_390861 ) ( SUPPORTS ?auto_390862 ?auto_390854 ) ( not ( = ?auto_390853 ?auto_390860 ) ) ( HAVE_IMAGE ?auto_390855 ?auto_390852 ) ( not ( = ?auto_390855 ?auto_390860 ) ) ( not ( = ?auto_390852 ?auto_390854 ) ) ( CALIBRATION_TARGET ?auto_390862 ?auto_390860 ) ( POWER_AVAIL ?auto_390861 ) ( POINTING ?auto_390861 ?auto_390858 ) ( not ( = ?auto_390860 ?auto_390858 ) ) ( HAVE_IMAGE ?auto_390857 ?auto_390856 ) ( HAVE_IMAGE ?auto_390858 ?auto_390859 ) ( not ( = ?auto_390854 ?auto_390856 ) ) ( not ( = ?auto_390854 ?auto_390859 ) ) ( not ( = ?auto_390852 ?auto_390856 ) ) ( not ( = ?auto_390852 ?auto_390859 ) ) ( not ( = ?auto_390857 ?auto_390860 ) ) ( not ( = ?auto_390856 ?auto_390859 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390855 ?auto_390852 ?auto_390853 ?auto_390854 )
      ( GET-4IMAGE-VERIFY ?auto_390853 ?auto_390854 ?auto_390855 ?auto_390852 ?auto_390857 ?auto_390856 ?auto_390858 ?auto_390859 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390887 - DIRECTION
      ?auto_390888 - MODE
      ?auto_390889 - DIRECTION
      ?auto_390886 - MODE
      ?auto_390891 - DIRECTION
      ?auto_390890 - MODE
      ?auto_390892 - DIRECTION
      ?auto_390893 - MODE
    )
    :vars
    (
      ?auto_390896 - INSTRUMENT
      ?auto_390895 - SATELLITE
      ?auto_390894 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_390889 ?auto_390887 ) ) ( not ( = ?auto_390891 ?auto_390887 ) ) ( not ( = ?auto_390891 ?auto_390889 ) ) ( not ( = ?auto_390892 ?auto_390887 ) ) ( not ( = ?auto_390892 ?auto_390889 ) ) ( not ( = ?auto_390892 ?auto_390891 ) ) ( ON_BOARD ?auto_390896 ?auto_390895 ) ( SUPPORTS ?auto_390896 ?auto_390888 ) ( not ( = ?auto_390887 ?auto_390894 ) ) ( HAVE_IMAGE ?auto_390889 ?auto_390886 ) ( not ( = ?auto_390889 ?auto_390894 ) ) ( not ( = ?auto_390886 ?auto_390888 ) ) ( CALIBRATION_TARGET ?auto_390896 ?auto_390894 ) ( POWER_AVAIL ?auto_390895 ) ( POINTING ?auto_390895 ?auto_390891 ) ( not ( = ?auto_390894 ?auto_390891 ) ) ( HAVE_IMAGE ?auto_390891 ?auto_390890 ) ( HAVE_IMAGE ?auto_390892 ?auto_390893 ) ( not ( = ?auto_390888 ?auto_390890 ) ) ( not ( = ?auto_390888 ?auto_390893 ) ) ( not ( = ?auto_390886 ?auto_390890 ) ) ( not ( = ?auto_390886 ?auto_390893 ) ) ( not ( = ?auto_390890 ?auto_390893 ) ) ( not ( = ?auto_390892 ?auto_390894 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390889 ?auto_390886 ?auto_390887 ?auto_390888 )
      ( GET-4IMAGE-VERIFY ?auto_390887 ?auto_390888 ?auto_390889 ?auto_390886 ?auto_390891 ?auto_390890 ?auto_390892 ?auto_390893 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391175 - DIRECTION
      ?auto_391176 - MODE
      ?auto_391177 - DIRECTION
      ?auto_391174 - MODE
      ?auto_391179 - DIRECTION
      ?auto_391178 - MODE
      ?auto_391180 - DIRECTION
      ?auto_391181 - MODE
    )
    :vars
    (
      ?auto_391184 - INSTRUMENT
      ?auto_391183 - SATELLITE
      ?auto_391182 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_391177 ?auto_391175 ) ) ( not ( = ?auto_391179 ?auto_391175 ) ) ( not ( = ?auto_391179 ?auto_391177 ) ) ( not ( = ?auto_391180 ?auto_391175 ) ) ( not ( = ?auto_391180 ?auto_391177 ) ) ( not ( = ?auto_391180 ?auto_391179 ) ) ( ON_BOARD ?auto_391184 ?auto_391183 ) ( SUPPORTS ?auto_391184 ?auto_391176 ) ( not ( = ?auto_391175 ?auto_391182 ) ) ( HAVE_IMAGE ?auto_391179 ?auto_391178 ) ( not ( = ?auto_391179 ?auto_391182 ) ) ( not ( = ?auto_391178 ?auto_391176 ) ) ( CALIBRATION_TARGET ?auto_391184 ?auto_391182 ) ( POWER_AVAIL ?auto_391183 ) ( POINTING ?auto_391183 ?auto_391177 ) ( not ( = ?auto_391182 ?auto_391177 ) ) ( HAVE_IMAGE ?auto_391177 ?auto_391174 ) ( HAVE_IMAGE ?auto_391180 ?auto_391181 ) ( not ( = ?auto_391176 ?auto_391174 ) ) ( not ( = ?auto_391176 ?auto_391181 ) ) ( not ( = ?auto_391174 ?auto_391178 ) ) ( not ( = ?auto_391174 ?auto_391181 ) ) ( not ( = ?auto_391178 ?auto_391181 ) ) ( not ( = ?auto_391180 ?auto_391182 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391179 ?auto_391178 ?auto_391175 ?auto_391176 )
      ( GET-4IMAGE-VERIFY ?auto_391175 ?auto_391176 ?auto_391177 ?auto_391174 ?auto_391179 ?auto_391178 ?auto_391180 ?auto_391181 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_391635 - DIRECTION
      ?auto_391636 - MODE
      ?auto_391637 - DIRECTION
      ?auto_391634 - MODE
      ?auto_391639 - DIRECTION
      ?auto_391638 - MODE
    )
    :vars
    (
      ?auto_391643 - INSTRUMENT
      ?auto_391641 - SATELLITE
      ?auto_391640 - DIRECTION
      ?auto_391644 - DIRECTION
      ?auto_391642 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_391637 ?auto_391635 ) ) ( not ( = ?auto_391639 ?auto_391635 ) ) ( not ( = ?auto_391639 ?auto_391637 ) ) ( ON_BOARD ?auto_391643 ?auto_391641 ) ( SUPPORTS ?auto_391643 ?auto_391638 ) ( not ( = ?auto_391639 ?auto_391640 ) ) ( HAVE_IMAGE ?auto_391635 ?auto_391636 ) ( not ( = ?auto_391635 ?auto_391640 ) ) ( not ( = ?auto_391636 ?auto_391638 ) ) ( CALIBRATION_TARGET ?auto_391643 ?auto_391640 ) ( POINTING ?auto_391641 ?auto_391644 ) ( not ( = ?auto_391640 ?auto_391644 ) ) ( not ( = ?auto_391639 ?auto_391644 ) ) ( not ( = ?auto_391635 ?auto_391644 ) ) ( ON_BOARD ?auto_391642 ?auto_391641 ) ( POWER_ON ?auto_391642 ) ( not ( = ?auto_391643 ?auto_391642 ) ) ( HAVE_IMAGE ?auto_391637 ?auto_391634 ) ( not ( = ?auto_391636 ?auto_391634 ) ) ( not ( = ?auto_391637 ?auto_391640 ) ) ( not ( = ?auto_391637 ?auto_391644 ) ) ( not ( = ?auto_391634 ?auto_391638 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391635 ?auto_391636 ?auto_391639 ?auto_391638 )
      ( GET-3IMAGE-VERIFY ?auto_391635 ?auto_391636 ?auto_391637 ?auto_391634 ?auto_391639 ?auto_391638 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_391667 - DIRECTION
      ?auto_391668 - MODE
      ?auto_391669 - DIRECTION
      ?auto_391666 - MODE
      ?auto_391671 - DIRECTION
      ?auto_391670 - MODE
    )
    :vars
    (
      ?auto_391675 - INSTRUMENT
      ?auto_391673 - SATELLITE
      ?auto_391672 - DIRECTION
      ?auto_391676 - DIRECTION
      ?auto_391674 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_391669 ?auto_391667 ) ) ( not ( = ?auto_391671 ?auto_391667 ) ) ( not ( = ?auto_391671 ?auto_391669 ) ) ( ON_BOARD ?auto_391675 ?auto_391673 ) ( SUPPORTS ?auto_391675 ?auto_391666 ) ( not ( = ?auto_391669 ?auto_391672 ) ) ( HAVE_IMAGE ?auto_391667 ?auto_391668 ) ( not ( = ?auto_391667 ?auto_391672 ) ) ( not ( = ?auto_391668 ?auto_391666 ) ) ( CALIBRATION_TARGET ?auto_391675 ?auto_391672 ) ( POINTING ?auto_391673 ?auto_391676 ) ( not ( = ?auto_391672 ?auto_391676 ) ) ( not ( = ?auto_391669 ?auto_391676 ) ) ( not ( = ?auto_391667 ?auto_391676 ) ) ( ON_BOARD ?auto_391674 ?auto_391673 ) ( POWER_ON ?auto_391674 ) ( not ( = ?auto_391675 ?auto_391674 ) ) ( HAVE_IMAGE ?auto_391671 ?auto_391670 ) ( not ( = ?auto_391668 ?auto_391670 ) ) ( not ( = ?auto_391666 ?auto_391670 ) ) ( not ( = ?auto_391671 ?auto_391672 ) ) ( not ( = ?auto_391671 ?auto_391676 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391667 ?auto_391668 ?auto_391669 ?auto_391666 )
      ( GET-3IMAGE-VERIFY ?auto_391667 ?auto_391668 ?auto_391669 ?auto_391666 ?auto_391671 ?auto_391670 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_391841 - DIRECTION
      ?auto_391842 - MODE
      ?auto_391843 - DIRECTION
      ?auto_391840 - MODE
      ?auto_391845 - DIRECTION
      ?auto_391844 - MODE
    )
    :vars
    (
      ?auto_391849 - INSTRUMENT
      ?auto_391847 - SATELLITE
      ?auto_391846 - DIRECTION
      ?auto_391850 - DIRECTION
      ?auto_391848 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_391843 ?auto_391841 ) ) ( not ( = ?auto_391845 ?auto_391841 ) ) ( not ( = ?auto_391845 ?auto_391843 ) ) ( ON_BOARD ?auto_391849 ?auto_391847 ) ( SUPPORTS ?auto_391849 ?auto_391842 ) ( not ( = ?auto_391841 ?auto_391846 ) ) ( HAVE_IMAGE ?auto_391843 ?auto_391840 ) ( not ( = ?auto_391843 ?auto_391846 ) ) ( not ( = ?auto_391840 ?auto_391842 ) ) ( CALIBRATION_TARGET ?auto_391849 ?auto_391846 ) ( POINTING ?auto_391847 ?auto_391850 ) ( not ( = ?auto_391846 ?auto_391850 ) ) ( not ( = ?auto_391841 ?auto_391850 ) ) ( not ( = ?auto_391843 ?auto_391850 ) ) ( ON_BOARD ?auto_391848 ?auto_391847 ) ( POWER_ON ?auto_391848 ) ( not ( = ?auto_391849 ?auto_391848 ) ) ( HAVE_IMAGE ?auto_391845 ?auto_391844 ) ( not ( = ?auto_391842 ?auto_391844 ) ) ( not ( = ?auto_391840 ?auto_391844 ) ) ( not ( = ?auto_391845 ?auto_391846 ) ) ( not ( = ?auto_391845 ?auto_391850 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391843 ?auto_391840 ?auto_391841 ?auto_391842 )
      ( GET-3IMAGE-VERIFY ?auto_391841 ?auto_391842 ?auto_391843 ?auto_391840 ?auto_391845 ?auto_391844 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392115 - DIRECTION
      ?auto_392116 - MODE
      ?auto_392117 - DIRECTION
      ?auto_392114 - MODE
      ?auto_392119 - DIRECTION
      ?auto_392118 - MODE
      ?auto_392120 - DIRECTION
      ?auto_392121 - MODE
    )
    :vars
    (
      ?auto_392125 - INSTRUMENT
      ?auto_392123 - SATELLITE
      ?auto_392122 - DIRECTION
      ?auto_392124 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_392117 ?auto_392115 ) ) ( not ( = ?auto_392119 ?auto_392115 ) ) ( not ( = ?auto_392119 ?auto_392117 ) ) ( not ( = ?auto_392120 ?auto_392115 ) ) ( not ( = ?auto_392120 ?auto_392117 ) ) ( not ( = ?auto_392120 ?auto_392119 ) ) ( ON_BOARD ?auto_392125 ?auto_392123 ) ( SUPPORTS ?auto_392125 ?auto_392121 ) ( not ( = ?auto_392120 ?auto_392122 ) ) ( HAVE_IMAGE ?auto_392115 ?auto_392116 ) ( not ( = ?auto_392115 ?auto_392122 ) ) ( not ( = ?auto_392116 ?auto_392121 ) ) ( CALIBRATION_TARGET ?auto_392125 ?auto_392122 ) ( POINTING ?auto_392123 ?auto_392119 ) ( not ( = ?auto_392122 ?auto_392119 ) ) ( ON_BOARD ?auto_392124 ?auto_392123 ) ( POWER_ON ?auto_392124 ) ( not ( = ?auto_392125 ?auto_392124 ) ) ( HAVE_IMAGE ?auto_392117 ?auto_392114 ) ( HAVE_IMAGE ?auto_392119 ?auto_392118 ) ( not ( = ?auto_392116 ?auto_392114 ) ) ( not ( = ?auto_392116 ?auto_392118 ) ) ( not ( = ?auto_392117 ?auto_392122 ) ) ( not ( = ?auto_392114 ?auto_392118 ) ) ( not ( = ?auto_392114 ?auto_392121 ) ) ( not ( = ?auto_392118 ?auto_392121 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392115 ?auto_392116 ?auto_392120 ?auto_392121 )
      ( GET-4IMAGE-VERIFY ?auto_392115 ?auto_392116 ?auto_392117 ?auto_392114 ?auto_392119 ?auto_392118 ?auto_392120 ?auto_392121 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392153 - DIRECTION
      ?auto_392154 - MODE
      ?auto_392155 - DIRECTION
      ?auto_392152 - MODE
      ?auto_392157 - DIRECTION
      ?auto_392156 - MODE
      ?auto_392158 - DIRECTION
      ?auto_392159 - MODE
    )
    :vars
    (
      ?auto_392163 - INSTRUMENT
      ?auto_392161 - SATELLITE
      ?auto_392160 - DIRECTION
      ?auto_392162 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_392155 ?auto_392153 ) ) ( not ( = ?auto_392157 ?auto_392153 ) ) ( not ( = ?auto_392157 ?auto_392155 ) ) ( not ( = ?auto_392158 ?auto_392153 ) ) ( not ( = ?auto_392158 ?auto_392155 ) ) ( not ( = ?auto_392158 ?auto_392157 ) ) ( ON_BOARD ?auto_392163 ?auto_392161 ) ( SUPPORTS ?auto_392163 ?auto_392156 ) ( not ( = ?auto_392157 ?auto_392160 ) ) ( HAVE_IMAGE ?auto_392153 ?auto_392154 ) ( not ( = ?auto_392153 ?auto_392160 ) ) ( not ( = ?auto_392154 ?auto_392156 ) ) ( CALIBRATION_TARGET ?auto_392163 ?auto_392160 ) ( POINTING ?auto_392161 ?auto_392158 ) ( not ( = ?auto_392160 ?auto_392158 ) ) ( ON_BOARD ?auto_392162 ?auto_392161 ) ( POWER_ON ?auto_392162 ) ( not ( = ?auto_392163 ?auto_392162 ) ) ( HAVE_IMAGE ?auto_392155 ?auto_392152 ) ( HAVE_IMAGE ?auto_392158 ?auto_392159 ) ( not ( = ?auto_392154 ?auto_392152 ) ) ( not ( = ?auto_392154 ?auto_392159 ) ) ( not ( = ?auto_392155 ?auto_392160 ) ) ( not ( = ?auto_392152 ?auto_392156 ) ) ( not ( = ?auto_392152 ?auto_392159 ) ) ( not ( = ?auto_392156 ?auto_392159 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392153 ?auto_392154 ?auto_392157 ?auto_392156 )
      ( GET-4IMAGE-VERIFY ?auto_392153 ?auto_392154 ?auto_392155 ?auto_392152 ?auto_392157 ?auto_392156 ?auto_392158 ?auto_392159 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392190 - DIRECTION
      ?auto_392191 - MODE
      ?auto_392192 - DIRECTION
      ?auto_392189 - MODE
      ?auto_392194 - DIRECTION
      ?auto_392193 - MODE
      ?auto_392195 - DIRECTION
      ?auto_392196 - MODE
    )
    :vars
    (
      ?auto_392200 - INSTRUMENT
      ?auto_392198 - SATELLITE
      ?auto_392197 - DIRECTION
      ?auto_392199 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_392192 ?auto_392190 ) ) ( not ( = ?auto_392194 ?auto_392190 ) ) ( not ( = ?auto_392194 ?auto_392192 ) ) ( not ( = ?auto_392195 ?auto_392190 ) ) ( not ( = ?auto_392195 ?auto_392192 ) ) ( not ( = ?auto_392195 ?auto_392194 ) ) ( ON_BOARD ?auto_392200 ?auto_392198 ) ( SUPPORTS ?auto_392200 ?auto_392196 ) ( not ( = ?auto_392195 ?auto_392197 ) ) ( HAVE_IMAGE ?auto_392190 ?auto_392191 ) ( not ( = ?auto_392190 ?auto_392197 ) ) ( not ( = ?auto_392191 ?auto_392196 ) ) ( CALIBRATION_TARGET ?auto_392200 ?auto_392197 ) ( POINTING ?auto_392198 ?auto_392192 ) ( not ( = ?auto_392197 ?auto_392192 ) ) ( ON_BOARD ?auto_392199 ?auto_392198 ) ( POWER_ON ?auto_392199 ) ( not ( = ?auto_392200 ?auto_392199 ) ) ( HAVE_IMAGE ?auto_392192 ?auto_392189 ) ( HAVE_IMAGE ?auto_392194 ?auto_392193 ) ( not ( = ?auto_392191 ?auto_392189 ) ) ( not ( = ?auto_392191 ?auto_392193 ) ) ( not ( = ?auto_392189 ?auto_392193 ) ) ( not ( = ?auto_392189 ?auto_392196 ) ) ( not ( = ?auto_392194 ?auto_392197 ) ) ( not ( = ?auto_392193 ?auto_392196 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392190 ?auto_392191 ?auto_392195 ?auto_392196 )
      ( GET-4IMAGE-VERIFY ?auto_392190 ?auto_392191 ?auto_392192 ?auto_392189 ?auto_392194 ?auto_392193 ?auto_392195 ?auto_392196 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392226 - DIRECTION
      ?auto_392227 - MODE
      ?auto_392228 - DIRECTION
      ?auto_392225 - MODE
      ?auto_392230 - DIRECTION
      ?auto_392229 - MODE
      ?auto_392231 - DIRECTION
      ?auto_392232 - MODE
    )
    :vars
    (
      ?auto_392236 - INSTRUMENT
      ?auto_392234 - SATELLITE
      ?auto_392233 - DIRECTION
      ?auto_392235 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_392228 ?auto_392226 ) ) ( not ( = ?auto_392230 ?auto_392226 ) ) ( not ( = ?auto_392230 ?auto_392228 ) ) ( not ( = ?auto_392231 ?auto_392226 ) ) ( not ( = ?auto_392231 ?auto_392228 ) ) ( not ( = ?auto_392231 ?auto_392230 ) ) ( ON_BOARD ?auto_392236 ?auto_392234 ) ( SUPPORTS ?auto_392236 ?auto_392229 ) ( not ( = ?auto_392230 ?auto_392233 ) ) ( HAVE_IMAGE ?auto_392226 ?auto_392227 ) ( not ( = ?auto_392226 ?auto_392233 ) ) ( not ( = ?auto_392227 ?auto_392229 ) ) ( CALIBRATION_TARGET ?auto_392236 ?auto_392233 ) ( POINTING ?auto_392234 ?auto_392228 ) ( not ( = ?auto_392233 ?auto_392228 ) ) ( ON_BOARD ?auto_392235 ?auto_392234 ) ( POWER_ON ?auto_392235 ) ( not ( = ?auto_392236 ?auto_392235 ) ) ( HAVE_IMAGE ?auto_392228 ?auto_392225 ) ( HAVE_IMAGE ?auto_392231 ?auto_392232 ) ( not ( = ?auto_392227 ?auto_392225 ) ) ( not ( = ?auto_392227 ?auto_392232 ) ) ( not ( = ?auto_392225 ?auto_392229 ) ) ( not ( = ?auto_392225 ?auto_392232 ) ) ( not ( = ?auto_392229 ?auto_392232 ) ) ( not ( = ?auto_392231 ?auto_392233 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392226 ?auto_392227 ?auto_392230 ?auto_392229 )
      ( GET-4IMAGE-VERIFY ?auto_392226 ?auto_392227 ?auto_392228 ?auto_392225 ?auto_392230 ?auto_392229 ?auto_392231 ?auto_392232 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392339 - DIRECTION
      ?auto_392340 - MODE
      ?auto_392341 - DIRECTION
      ?auto_392338 - MODE
      ?auto_392343 - DIRECTION
      ?auto_392342 - MODE
      ?auto_392344 - DIRECTION
      ?auto_392345 - MODE
    )
    :vars
    (
      ?auto_392349 - INSTRUMENT
      ?auto_392347 - SATELLITE
      ?auto_392346 - DIRECTION
      ?auto_392348 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_392341 ?auto_392339 ) ) ( not ( = ?auto_392343 ?auto_392339 ) ) ( not ( = ?auto_392343 ?auto_392341 ) ) ( not ( = ?auto_392344 ?auto_392339 ) ) ( not ( = ?auto_392344 ?auto_392341 ) ) ( not ( = ?auto_392344 ?auto_392343 ) ) ( ON_BOARD ?auto_392349 ?auto_392347 ) ( SUPPORTS ?auto_392349 ?auto_392338 ) ( not ( = ?auto_392341 ?auto_392346 ) ) ( HAVE_IMAGE ?auto_392339 ?auto_392340 ) ( not ( = ?auto_392339 ?auto_392346 ) ) ( not ( = ?auto_392340 ?auto_392338 ) ) ( CALIBRATION_TARGET ?auto_392349 ?auto_392346 ) ( POINTING ?auto_392347 ?auto_392344 ) ( not ( = ?auto_392346 ?auto_392344 ) ) ( ON_BOARD ?auto_392348 ?auto_392347 ) ( POWER_ON ?auto_392348 ) ( not ( = ?auto_392349 ?auto_392348 ) ) ( HAVE_IMAGE ?auto_392343 ?auto_392342 ) ( HAVE_IMAGE ?auto_392344 ?auto_392345 ) ( not ( = ?auto_392340 ?auto_392342 ) ) ( not ( = ?auto_392340 ?auto_392345 ) ) ( not ( = ?auto_392338 ?auto_392342 ) ) ( not ( = ?auto_392338 ?auto_392345 ) ) ( not ( = ?auto_392343 ?auto_392346 ) ) ( not ( = ?auto_392342 ?auto_392345 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392339 ?auto_392340 ?auto_392341 ?auto_392338 )
      ( GET-4IMAGE-VERIFY ?auto_392339 ?auto_392340 ?auto_392341 ?auto_392338 ?auto_392343 ?auto_392342 ?auto_392344 ?auto_392345 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392376 - DIRECTION
      ?auto_392377 - MODE
      ?auto_392378 - DIRECTION
      ?auto_392375 - MODE
      ?auto_392380 - DIRECTION
      ?auto_392379 - MODE
      ?auto_392381 - DIRECTION
      ?auto_392382 - MODE
    )
    :vars
    (
      ?auto_392386 - INSTRUMENT
      ?auto_392384 - SATELLITE
      ?auto_392383 - DIRECTION
      ?auto_392385 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_392378 ?auto_392376 ) ) ( not ( = ?auto_392380 ?auto_392376 ) ) ( not ( = ?auto_392380 ?auto_392378 ) ) ( not ( = ?auto_392381 ?auto_392376 ) ) ( not ( = ?auto_392381 ?auto_392378 ) ) ( not ( = ?auto_392381 ?auto_392380 ) ) ( ON_BOARD ?auto_392386 ?auto_392384 ) ( SUPPORTS ?auto_392386 ?auto_392375 ) ( not ( = ?auto_392378 ?auto_392383 ) ) ( HAVE_IMAGE ?auto_392376 ?auto_392377 ) ( not ( = ?auto_392376 ?auto_392383 ) ) ( not ( = ?auto_392377 ?auto_392375 ) ) ( CALIBRATION_TARGET ?auto_392386 ?auto_392383 ) ( POINTING ?auto_392384 ?auto_392380 ) ( not ( = ?auto_392383 ?auto_392380 ) ) ( ON_BOARD ?auto_392385 ?auto_392384 ) ( POWER_ON ?auto_392385 ) ( not ( = ?auto_392386 ?auto_392385 ) ) ( HAVE_IMAGE ?auto_392380 ?auto_392379 ) ( HAVE_IMAGE ?auto_392381 ?auto_392382 ) ( not ( = ?auto_392377 ?auto_392379 ) ) ( not ( = ?auto_392377 ?auto_392382 ) ) ( not ( = ?auto_392375 ?auto_392379 ) ) ( not ( = ?auto_392375 ?auto_392382 ) ) ( not ( = ?auto_392379 ?auto_392382 ) ) ( not ( = ?auto_392381 ?auto_392383 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392376 ?auto_392377 ?auto_392378 ?auto_392375 )
      ( GET-4IMAGE-VERIFY ?auto_392376 ?auto_392377 ?auto_392378 ?auto_392375 ?auto_392380 ?auto_392379 ?auto_392381 ?auto_392382 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392952 - DIRECTION
      ?auto_392953 - MODE
      ?auto_392954 - DIRECTION
      ?auto_392951 - MODE
      ?auto_392956 - DIRECTION
      ?auto_392955 - MODE
      ?auto_392957 - DIRECTION
      ?auto_392958 - MODE
    )
    :vars
    (
      ?auto_392962 - INSTRUMENT
      ?auto_392960 - SATELLITE
      ?auto_392959 - DIRECTION
      ?auto_392961 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_392954 ?auto_392952 ) ) ( not ( = ?auto_392956 ?auto_392952 ) ) ( not ( = ?auto_392956 ?auto_392954 ) ) ( not ( = ?auto_392957 ?auto_392952 ) ) ( not ( = ?auto_392957 ?auto_392954 ) ) ( not ( = ?auto_392957 ?auto_392956 ) ) ( ON_BOARD ?auto_392962 ?auto_392960 ) ( SUPPORTS ?auto_392962 ?auto_392958 ) ( not ( = ?auto_392957 ?auto_392959 ) ) ( HAVE_IMAGE ?auto_392954 ?auto_392951 ) ( not ( = ?auto_392954 ?auto_392959 ) ) ( not ( = ?auto_392951 ?auto_392958 ) ) ( CALIBRATION_TARGET ?auto_392962 ?auto_392959 ) ( POINTING ?auto_392960 ?auto_392952 ) ( not ( = ?auto_392959 ?auto_392952 ) ) ( ON_BOARD ?auto_392961 ?auto_392960 ) ( POWER_ON ?auto_392961 ) ( not ( = ?auto_392962 ?auto_392961 ) ) ( HAVE_IMAGE ?auto_392952 ?auto_392953 ) ( HAVE_IMAGE ?auto_392956 ?auto_392955 ) ( not ( = ?auto_392953 ?auto_392951 ) ) ( not ( = ?auto_392953 ?auto_392955 ) ) ( not ( = ?auto_392953 ?auto_392958 ) ) ( not ( = ?auto_392951 ?auto_392955 ) ) ( not ( = ?auto_392956 ?auto_392959 ) ) ( not ( = ?auto_392955 ?auto_392958 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392954 ?auto_392951 ?auto_392957 ?auto_392958 )
      ( GET-4IMAGE-VERIFY ?auto_392952 ?auto_392953 ?auto_392954 ?auto_392951 ?auto_392956 ?auto_392955 ?auto_392957 ?auto_392958 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392988 - DIRECTION
      ?auto_392989 - MODE
      ?auto_392990 - DIRECTION
      ?auto_392987 - MODE
      ?auto_392992 - DIRECTION
      ?auto_392991 - MODE
      ?auto_392993 - DIRECTION
      ?auto_392994 - MODE
    )
    :vars
    (
      ?auto_392998 - INSTRUMENT
      ?auto_392996 - SATELLITE
      ?auto_392995 - DIRECTION
      ?auto_392997 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_392990 ?auto_392988 ) ) ( not ( = ?auto_392992 ?auto_392988 ) ) ( not ( = ?auto_392992 ?auto_392990 ) ) ( not ( = ?auto_392993 ?auto_392988 ) ) ( not ( = ?auto_392993 ?auto_392990 ) ) ( not ( = ?auto_392993 ?auto_392992 ) ) ( ON_BOARD ?auto_392998 ?auto_392996 ) ( SUPPORTS ?auto_392998 ?auto_392991 ) ( not ( = ?auto_392992 ?auto_392995 ) ) ( HAVE_IMAGE ?auto_392990 ?auto_392987 ) ( not ( = ?auto_392990 ?auto_392995 ) ) ( not ( = ?auto_392987 ?auto_392991 ) ) ( CALIBRATION_TARGET ?auto_392998 ?auto_392995 ) ( POINTING ?auto_392996 ?auto_392988 ) ( not ( = ?auto_392995 ?auto_392988 ) ) ( ON_BOARD ?auto_392997 ?auto_392996 ) ( POWER_ON ?auto_392997 ) ( not ( = ?auto_392998 ?auto_392997 ) ) ( HAVE_IMAGE ?auto_392988 ?auto_392989 ) ( HAVE_IMAGE ?auto_392993 ?auto_392994 ) ( not ( = ?auto_392989 ?auto_392987 ) ) ( not ( = ?auto_392989 ?auto_392991 ) ) ( not ( = ?auto_392989 ?auto_392994 ) ) ( not ( = ?auto_392987 ?auto_392994 ) ) ( not ( = ?auto_392991 ?auto_392994 ) ) ( not ( = ?auto_392993 ?auto_392995 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392990 ?auto_392987 ?auto_392992 ?auto_392991 )
      ( GET-4IMAGE-VERIFY ?auto_392988 ?auto_392989 ?auto_392990 ?auto_392987 ?auto_392992 ?auto_392991 ?auto_392993 ?auto_392994 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_393216 - DIRECTION
      ?auto_393217 - MODE
      ?auto_393218 - DIRECTION
      ?auto_393215 - MODE
      ?auto_393220 - DIRECTION
      ?auto_393219 - MODE
      ?auto_393221 - DIRECTION
      ?auto_393222 - MODE
    )
    :vars
    (
      ?auto_393226 - INSTRUMENT
      ?auto_393224 - SATELLITE
      ?auto_393223 - DIRECTION
      ?auto_393225 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_393218 ?auto_393216 ) ) ( not ( = ?auto_393220 ?auto_393216 ) ) ( not ( = ?auto_393220 ?auto_393218 ) ) ( not ( = ?auto_393221 ?auto_393216 ) ) ( not ( = ?auto_393221 ?auto_393218 ) ) ( not ( = ?auto_393221 ?auto_393220 ) ) ( ON_BOARD ?auto_393226 ?auto_393224 ) ( SUPPORTS ?auto_393226 ?auto_393215 ) ( not ( = ?auto_393218 ?auto_393223 ) ) ( HAVE_IMAGE ?auto_393220 ?auto_393219 ) ( not ( = ?auto_393220 ?auto_393223 ) ) ( not ( = ?auto_393219 ?auto_393215 ) ) ( CALIBRATION_TARGET ?auto_393226 ?auto_393223 ) ( POINTING ?auto_393224 ?auto_393216 ) ( not ( = ?auto_393223 ?auto_393216 ) ) ( ON_BOARD ?auto_393225 ?auto_393224 ) ( POWER_ON ?auto_393225 ) ( not ( = ?auto_393226 ?auto_393225 ) ) ( HAVE_IMAGE ?auto_393216 ?auto_393217 ) ( HAVE_IMAGE ?auto_393221 ?auto_393222 ) ( not ( = ?auto_393217 ?auto_393215 ) ) ( not ( = ?auto_393217 ?auto_393219 ) ) ( not ( = ?auto_393217 ?auto_393222 ) ) ( not ( = ?auto_393215 ?auto_393222 ) ) ( not ( = ?auto_393219 ?auto_393222 ) ) ( not ( = ?auto_393221 ?auto_393223 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_393220 ?auto_393219 ?auto_393218 ?auto_393215 )
      ( GET-4IMAGE-VERIFY ?auto_393216 ?auto_393217 ?auto_393218 ?auto_393215 ?auto_393220 ?auto_393219 ?auto_393221 ?auto_393222 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_393487 - DIRECTION
      ?auto_393488 - MODE
      ?auto_393489 - DIRECTION
      ?auto_393486 - MODE
      ?auto_393491 - DIRECTION
      ?auto_393490 - MODE
      ?auto_393492 - DIRECTION
      ?auto_393493 - MODE
    )
    :vars
    (
      ?auto_393497 - INSTRUMENT
      ?auto_393495 - SATELLITE
      ?auto_393494 - DIRECTION
      ?auto_393496 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_393489 ?auto_393487 ) ) ( not ( = ?auto_393491 ?auto_393487 ) ) ( not ( = ?auto_393491 ?auto_393489 ) ) ( not ( = ?auto_393492 ?auto_393487 ) ) ( not ( = ?auto_393492 ?auto_393489 ) ) ( not ( = ?auto_393492 ?auto_393491 ) ) ( ON_BOARD ?auto_393497 ?auto_393495 ) ( SUPPORTS ?auto_393497 ?auto_393488 ) ( not ( = ?auto_393487 ?auto_393494 ) ) ( HAVE_IMAGE ?auto_393489 ?auto_393486 ) ( not ( = ?auto_393489 ?auto_393494 ) ) ( not ( = ?auto_393486 ?auto_393488 ) ) ( CALIBRATION_TARGET ?auto_393497 ?auto_393494 ) ( POINTING ?auto_393495 ?auto_393492 ) ( not ( = ?auto_393494 ?auto_393492 ) ) ( ON_BOARD ?auto_393496 ?auto_393495 ) ( POWER_ON ?auto_393496 ) ( not ( = ?auto_393497 ?auto_393496 ) ) ( HAVE_IMAGE ?auto_393491 ?auto_393490 ) ( HAVE_IMAGE ?auto_393492 ?auto_393493 ) ( not ( = ?auto_393488 ?auto_393490 ) ) ( not ( = ?auto_393488 ?auto_393493 ) ) ( not ( = ?auto_393486 ?auto_393490 ) ) ( not ( = ?auto_393486 ?auto_393493 ) ) ( not ( = ?auto_393491 ?auto_393494 ) ) ( not ( = ?auto_393490 ?auto_393493 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_393489 ?auto_393486 ?auto_393487 ?auto_393488 )
      ( GET-4IMAGE-VERIFY ?auto_393487 ?auto_393488 ?auto_393489 ?auto_393486 ?auto_393491 ?auto_393490 ?auto_393492 ?auto_393493 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_393524 - DIRECTION
      ?auto_393525 - MODE
      ?auto_393526 - DIRECTION
      ?auto_393523 - MODE
      ?auto_393528 - DIRECTION
      ?auto_393527 - MODE
      ?auto_393529 - DIRECTION
      ?auto_393530 - MODE
    )
    :vars
    (
      ?auto_393534 - INSTRUMENT
      ?auto_393532 - SATELLITE
      ?auto_393531 - DIRECTION
      ?auto_393533 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_393526 ?auto_393524 ) ) ( not ( = ?auto_393528 ?auto_393524 ) ) ( not ( = ?auto_393528 ?auto_393526 ) ) ( not ( = ?auto_393529 ?auto_393524 ) ) ( not ( = ?auto_393529 ?auto_393526 ) ) ( not ( = ?auto_393529 ?auto_393528 ) ) ( ON_BOARD ?auto_393534 ?auto_393532 ) ( SUPPORTS ?auto_393534 ?auto_393525 ) ( not ( = ?auto_393524 ?auto_393531 ) ) ( HAVE_IMAGE ?auto_393526 ?auto_393523 ) ( not ( = ?auto_393526 ?auto_393531 ) ) ( not ( = ?auto_393523 ?auto_393525 ) ) ( CALIBRATION_TARGET ?auto_393534 ?auto_393531 ) ( POINTING ?auto_393532 ?auto_393528 ) ( not ( = ?auto_393531 ?auto_393528 ) ) ( ON_BOARD ?auto_393533 ?auto_393532 ) ( POWER_ON ?auto_393533 ) ( not ( = ?auto_393534 ?auto_393533 ) ) ( HAVE_IMAGE ?auto_393528 ?auto_393527 ) ( HAVE_IMAGE ?auto_393529 ?auto_393530 ) ( not ( = ?auto_393525 ?auto_393527 ) ) ( not ( = ?auto_393525 ?auto_393530 ) ) ( not ( = ?auto_393523 ?auto_393527 ) ) ( not ( = ?auto_393523 ?auto_393530 ) ) ( not ( = ?auto_393527 ?auto_393530 ) ) ( not ( = ?auto_393529 ?auto_393531 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_393526 ?auto_393523 ?auto_393524 ?auto_393525 )
      ( GET-4IMAGE-VERIFY ?auto_393524 ?auto_393525 ?auto_393526 ?auto_393523 ?auto_393528 ?auto_393527 ?auto_393529 ?auto_393530 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_393834 - DIRECTION
      ?auto_393835 - MODE
      ?auto_393836 - DIRECTION
      ?auto_393833 - MODE
      ?auto_393838 - DIRECTION
      ?auto_393837 - MODE
      ?auto_393839 - DIRECTION
      ?auto_393840 - MODE
    )
    :vars
    (
      ?auto_393844 - INSTRUMENT
      ?auto_393842 - SATELLITE
      ?auto_393841 - DIRECTION
      ?auto_393843 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_393836 ?auto_393834 ) ) ( not ( = ?auto_393838 ?auto_393834 ) ) ( not ( = ?auto_393838 ?auto_393836 ) ) ( not ( = ?auto_393839 ?auto_393834 ) ) ( not ( = ?auto_393839 ?auto_393836 ) ) ( not ( = ?auto_393839 ?auto_393838 ) ) ( ON_BOARD ?auto_393844 ?auto_393842 ) ( SUPPORTS ?auto_393844 ?auto_393835 ) ( not ( = ?auto_393834 ?auto_393841 ) ) ( HAVE_IMAGE ?auto_393838 ?auto_393837 ) ( not ( = ?auto_393838 ?auto_393841 ) ) ( not ( = ?auto_393837 ?auto_393835 ) ) ( CALIBRATION_TARGET ?auto_393844 ?auto_393841 ) ( POINTING ?auto_393842 ?auto_393836 ) ( not ( = ?auto_393841 ?auto_393836 ) ) ( ON_BOARD ?auto_393843 ?auto_393842 ) ( POWER_ON ?auto_393843 ) ( not ( = ?auto_393844 ?auto_393843 ) ) ( HAVE_IMAGE ?auto_393836 ?auto_393833 ) ( HAVE_IMAGE ?auto_393839 ?auto_393840 ) ( not ( = ?auto_393835 ?auto_393833 ) ) ( not ( = ?auto_393835 ?auto_393840 ) ) ( not ( = ?auto_393833 ?auto_393837 ) ) ( not ( = ?auto_393833 ?auto_393840 ) ) ( not ( = ?auto_393837 ?auto_393840 ) ) ( not ( = ?auto_393839 ?auto_393841 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_393838 ?auto_393837 ?auto_393834 ?auto_393835 )
      ( GET-4IMAGE-VERIFY ?auto_393834 ?auto_393835 ?auto_393836 ?auto_393833 ?auto_393838 ?auto_393837 ?auto_393839 ?auto_393840 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_399838 - DIRECTION
      ?auto_399839 - MODE
      ?auto_399840 - DIRECTION
      ?auto_399837 - MODE
      ?auto_399842 - DIRECTION
      ?auto_399841 - MODE
    )
    :vars
    (
      ?auto_399844 - INSTRUMENT
      ?auto_399845 - SATELLITE
      ?auto_399843 - DIRECTION
      ?auto_399846 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_399840 ?auto_399838 ) ) ( not ( = ?auto_399842 ?auto_399838 ) ) ( not ( = ?auto_399842 ?auto_399840 ) ) ( ON_BOARD ?auto_399844 ?auto_399845 ) ( SUPPORTS ?auto_399844 ?auto_399841 ) ( not ( = ?auto_399842 ?auto_399843 ) ) ( HAVE_IMAGE ?auto_399838 ?auto_399839 ) ( not ( = ?auto_399838 ?auto_399843 ) ) ( not ( = ?auto_399839 ?auto_399841 ) ) ( CALIBRATION_TARGET ?auto_399844 ?auto_399843 ) ( not ( = ?auto_399843 ?auto_399840 ) ) ( ON_BOARD ?auto_399846 ?auto_399845 ) ( POWER_ON ?auto_399846 ) ( not ( = ?auto_399844 ?auto_399846 ) ) ( POINTING ?auto_399845 ?auto_399843 ) ( HAVE_IMAGE ?auto_399840 ?auto_399837 ) ( not ( = ?auto_399839 ?auto_399837 ) ) ( not ( = ?auto_399837 ?auto_399841 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399838 ?auto_399839 ?auto_399842 ?auto_399841 )
      ( GET-3IMAGE-VERIFY ?auto_399838 ?auto_399839 ?auto_399840 ?auto_399837 ?auto_399842 ?auto_399841 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_399870 - DIRECTION
      ?auto_399871 - MODE
      ?auto_399872 - DIRECTION
      ?auto_399869 - MODE
      ?auto_399874 - DIRECTION
      ?auto_399873 - MODE
    )
    :vars
    (
      ?auto_399876 - INSTRUMENT
      ?auto_399877 - SATELLITE
      ?auto_399875 - DIRECTION
      ?auto_399878 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_399872 ?auto_399870 ) ) ( not ( = ?auto_399874 ?auto_399870 ) ) ( not ( = ?auto_399874 ?auto_399872 ) ) ( ON_BOARD ?auto_399876 ?auto_399877 ) ( SUPPORTS ?auto_399876 ?auto_399869 ) ( not ( = ?auto_399872 ?auto_399875 ) ) ( HAVE_IMAGE ?auto_399870 ?auto_399871 ) ( not ( = ?auto_399870 ?auto_399875 ) ) ( not ( = ?auto_399871 ?auto_399869 ) ) ( CALIBRATION_TARGET ?auto_399876 ?auto_399875 ) ( not ( = ?auto_399875 ?auto_399874 ) ) ( ON_BOARD ?auto_399878 ?auto_399877 ) ( POWER_ON ?auto_399878 ) ( not ( = ?auto_399876 ?auto_399878 ) ) ( POINTING ?auto_399877 ?auto_399875 ) ( HAVE_IMAGE ?auto_399874 ?auto_399873 ) ( not ( = ?auto_399871 ?auto_399873 ) ) ( not ( = ?auto_399869 ?auto_399873 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399870 ?auto_399871 ?auto_399872 ?auto_399869 )
      ( GET-3IMAGE-VERIFY ?auto_399870 ?auto_399871 ?auto_399872 ?auto_399869 ?auto_399874 ?auto_399873 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_397129 - DIRECTION
      ?auto_397130 - MODE
      ?auto_397131 - DIRECTION
      ?auto_397128 - MODE
      ?auto_397133 - DIRECTION
      ?auto_397132 - MODE
    )
    :vars
    (
      ?auto_397138 - INSTRUMENT
      ?auto_397136 - SATELLITE
      ?auto_397134 - DIRECTION
      ?auto_397137 - DIRECTION
      ?auto_397135 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_397131 ?auto_397129 ) ) ( not ( = ?auto_397133 ?auto_397129 ) ) ( not ( = ?auto_397133 ?auto_397131 ) ) ( ON_BOARD ?auto_397138 ?auto_397136 ) ( SUPPORTS ?auto_397138 ?auto_397132 ) ( not ( = ?auto_397133 ?auto_397134 ) ) ( HAVE_IMAGE ?auto_397131 ?auto_397128 ) ( not ( = ?auto_397131 ?auto_397134 ) ) ( not ( = ?auto_397128 ?auto_397132 ) ) ( CALIBRATION_TARGET ?auto_397138 ?auto_397134 ) ( not ( = ?auto_397134 ?auto_397137 ) ) ( not ( = ?auto_397133 ?auto_397137 ) ) ( not ( = ?auto_397131 ?auto_397137 ) ) ( ON_BOARD ?auto_397135 ?auto_397136 ) ( POWER_ON ?auto_397135 ) ( not ( = ?auto_397138 ?auto_397135 ) ) ( POINTING ?auto_397136 ?auto_397134 ) ( HAVE_IMAGE ?auto_397129 ?auto_397130 ) ( not ( = ?auto_397129 ?auto_397134 ) ) ( not ( = ?auto_397129 ?auto_397137 ) ) ( not ( = ?auto_397130 ?auto_397128 ) ) ( not ( = ?auto_397130 ?auto_397132 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_397131 ?auto_397128 ?auto_397133 ?auto_397132 )
      ( GET-3IMAGE-VERIFY ?auto_397129 ?auto_397130 ?auto_397131 ?auto_397128 ?auto_397133 ?auto_397132 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_397165 - DIRECTION
      ?auto_397166 - MODE
      ?auto_397167 - DIRECTION
      ?auto_397164 - MODE
      ?auto_397169 - DIRECTION
      ?auto_397168 - MODE
    )
    :vars
    (
      ?auto_397174 - INSTRUMENT
      ?auto_397172 - SATELLITE
      ?auto_397170 - DIRECTION
      ?auto_397173 - DIRECTION
      ?auto_397171 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_397167 ?auto_397165 ) ) ( not ( = ?auto_397169 ?auto_397165 ) ) ( not ( = ?auto_397169 ?auto_397167 ) ) ( ON_BOARD ?auto_397174 ?auto_397172 ) ( SUPPORTS ?auto_397174 ?auto_397164 ) ( not ( = ?auto_397167 ?auto_397170 ) ) ( HAVE_IMAGE ?auto_397169 ?auto_397168 ) ( not ( = ?auto_397169 ?auto_397170 ) ) ( not ( = ?auto_397168 ?auto_397164 ) ) ( CALIBRATION_TARGET ?auto_397174 ?auto_397170 ) ( not ( = ?auto_397170 ?auto_397173 ) ) ( not ( = ?auto_397167 ?auto_397173 ) ) ( not ( = ?auto_397169 ?auto_397173 ) ) ( ON_BOARD ?auto_397171 ?auto_397172 ) ( POWER_ON ?auto_397171 ) ( not ( = ?auto_397174 ?auto_397171 ) ) ( POINTING ?auto_397172 ?auto_397170 ) ( HAVE_IMAGE ?auto_397165 ?auto_397166 ) ( not ( = ?auto_397165 ?auto_397170 ) ) ( not ( = ?auto_397165 ?auto_397173 ) ) ( not ( = ?auto_397166 ?auto_397164 ) ) ( not ( = ?auto_397166 ?auto_397168 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_397169 ?auto_397168 ?auto_397167 ?auto_397164 )
      ( GET-3IMAGE-VERIFY ?auto_397165 ?auto_397166 ?auto_397167 ?auto_397164 ?auto_397169 ?auto_397168 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_400070 - DIRECTION
      ?auto_400071 - MODE
      ?auto_400072 - DIRECTION
      ?auto_400069 - MODE
      ?auto_400074 - DIRECTION
      ?auto_400073 - MODE
    )
    :vars
    (
      ?auto_400076 - INSTRUMENT
      ?auto_400077 - SATELLITE
      ?auto_400075 - DIRECTION
      ?auto_400078 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_400072 ?auto_400070 ) ) ( not ( = ?auto_400074 ?auto_400070 ) ) ( not ( = ?auto_400074 ?auto_400072 ) ) ( ON_BOARD ?auto_400076 ?auto_400077 ) ( SUPPORTS ?auto_400076 ?auto_400071 ) ( not ( = ?auto_400070 ?auto_400075 ) ) ( HAVE_IMAGE ?auto_400072 ?auto_400069 ) ( not ( = ?auto_400072 ?auto_400075 ) ) ( not ( = ?auto_400069 ?auto_400071 ) ) ( CALIBRATION_TARGET ?auto_400076 ?auto_400075 ) ( not ( = ?auto_400075 ?auto_400074 ) ) ( ON_BOARD ?auto_400078 ?auto_400077 ) ( POWER_ON ?auto_400078 ) ( not ( = ?auto_400076 ?auto_400078 ) ) ( POINTING ?auto_400077 ?auto_400075 ) ( HAVE_IMAGE ?auto_400074 ?auto_400073 ) ( not ( = ?auto_400071 ?auto_400073 ) ) ( not ( = ?auto_400069 ?auto_400073 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_400072 ?auto_400069 ?auto_400070 ?auto_400071 )
      ( GET-3IMAGE-VERIFY ?auto_400070 ?auto_400071 ?auto_400072 ?auto_400069 ?auto_400074 ?auto_400073 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_397337 - DIRECTION
      ?auto_397338 - MODE
      ?auto_397339 - DIRECTION
      ?auto_397336 - MODE
      ?auto_397341 - DIRECTION
      ?auto_397340 - MODE
    )
    :vars
    (
      ?auto_397346 - INSTRUMENT
      ?auto_397344 - SATELLITE
      ?auto_397342 - DIRECTION
      ?auto_397345 - DIRECTION
      ?auto_397343 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_397339 ?auto_397337 ) ) ( not ( = ?auto_397341 ?auto_397337 ) ) ( not ( = ?auto_397341 ?auto_397339 ) ) ( ON_BOARD ?auto_397346 ?auto_397344 ) ( SUPPORTS ?auto_397346 ?auto_397338 ) ( not ( = ?auto_397337 ?auto_397342 ) ) ( HAVE_IMAGE ?auto_397341 ?auto_397340 ) ( not ( = ?auto_397341 ?auto_397342 ) ) ( not ( = ?auto_397340 ?auto_397338 ) ) ( CALIBRATION_TARGET ?auto_397346 ?auto_397342 ) ( not ( = ?auto_397342 ?auto_397345 ) ) ( not ( = ?auto_397337 ?auto_397345 ) ) ( not ( = ?auto_397341 ?auto_397345 ) ) ( ON_BOARD ?auto_397343 ?auto_397344 ) ( POWER_ON ?auto_397343 ) ( not ( = ?auto_397346 ?auto_397343 ) ) ( POINTING ?auto_397344 ?auto_397342 ) ( HAVE_IMAGE ?auto_397339 ?auto_397336 ) ( not ( = ?auto_397338 ?auto_397336 ) ) ( not ( = ?auto_397339 ?auto_397342 ) ) ( not ( = ?auto_397339 ?auto_397345 ) ) ( not ( = ?auto_397336 ?auto_397340 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_397341 ?auto_397340 ?auto_397337 ?auto_397338 )
      ( GET-3IMAGE-VERIFY ?auto_397337 ?auto_397338 ?auto_397339 ?auto_397336 ?auto_397341 ?auto_397340 ) )
  )

)

