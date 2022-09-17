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
      ?auto_111050 - DIRECTION
      ?auto_111051 - MODE
    )
    :vars
    (
      ?auto_111052 - INSTRUMENT
      ?auto_111053 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_111052 ) ( ON_BOARD ?auto_111052 ?auto_111053 ) ( SUPPORTS ?auto_111052 ?auto_111051 ) ( POWER_ON ?auto_111052 ) ( POINTING ?auto_111053 ?auto_111050 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_111053 ?auto_111050 ?auto_111052 ?auto_111051 )
      ( GET-1IMAGE-VERIFY ?auto_111050 ?auto_111051 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_111078 - DIRECTION
      ?auto_111079 - MODE
    )
    :vars
    (
      ?auto_111080 - INSTRUMENT
      ?auto_111081 - SATELLITE
      ?auto_111082 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_111080 ) ( ON_BOARD ?auto_111080 ?auto_111081 ) ( SUPPORTS ?auto_111080 ?auto_111079 ) ( POWER_ON ?auto_111080 ) ( POINTING ?auto_111081 ?auto_111082 ) ( not ( = ?auto_111078 ?auto_111082 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_111081 ?auto_111078 ?auto_111082 )
      ( GET-1IMAGE ?auto_111078 ?auto_111079 )
      ( GET-1IMAGE-VERIFY ?auto_111078 ?auto_111079 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_111110 - DIRECTION
      ?auto_111111 - MODE
    )
    :vars
    (
      ?auto_111113 - INSTRUMENT
      ?auto_111112 - SATELLITE
      ?auto_111114 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111113 ?auto_111112 ) ( SUPPORTS ?auto_111113 ?auto_111111 ) ( POWER_ON ?auto_111113 ) ( POINTING ?auto_111112 ?auto_111114 ) ( not ( = ?auto_111110 ?auto_111114 ) ) ( CALIBRATION_TARGET ?auto_111113 ?auto_111114 ) ( NOT_CALIBRATED ?auto_111113 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_111112 ?auto_111113 ?auto_111114 )
      ( GET-1IMAGE ?auto_111110 ?auto_111111 )
      ( GET-1IMAGE-VERIFY ?auto_111110 ?auto_111111 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_111142 - DIRECTION
      ?auto_111143 - MODE
    )
    :vars
    (
      ?auto_111146 - INSTRUMENT
      ?auto_111144 - SATELLITE
      ?auto_111145 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111146 ?auto_111144 ) ( SUPPORTS ?auto_111146 ?auto_111143 ) ( POINTING ?auto_111144 ?auto_111145 ) ( not ( = ?auto_111142 ?auto_111145 ) ) ( CALIBRATION_TARGET ?auto_111146 ?auto_111145 ) ( POWER_AVAIL ?auto_111144 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_111146 ?auto_111144 )
      ( GET-1IMAGE ?auto_111142 ?auto_111143 )
      ( GET-1IMAGE-VERIFY ?auto_111142 ?auto_111143 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_111174 - DIRECTION
      ?auto_111175 - MODE
    )
    :vars
    (
      ?auto_111178 - INSTRUMENT
      ?auto_111176 - SATELLITE
      ?auto_111177 - DIRECTION
      ?auto_111179 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111178 ?auto_111176 ) ( SUPPORTS ?auto_111178 ?auto_111175 ) ( not ( = ?auto_111174 ?auto_111177 ) ) ( CALIBRATION_TARGET ?auto_111178 ?auto_111177 ) ( POWER_AVAIL ?auto_111176 ) ( POINTING ?auto_111176 ?auto_111179 ) ( not ( = ?auto_111177 ?auto_111179 ) ) ( not ( = ?auto_111174 ?auto_111179 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_111176 ?auto_111177 ?auto_111179 )
      ( GET-1IMAGE ?auto_111174 ?auto_111175 )
      ( GET-1IMAGE-VERIFY ?auto_111174 ?auto_111175 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_111391 - DIRECTION
      ?auto_111392 - MODE
      ?auto_111393 - DIRECTION
      ?auto_111390 - MODE
    )
    :vars
    (
      ?auto_111395 - INSTRUMENT
      ?auto_111394 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_111393 ?auto_111391 ) ) ( CALIBRATED ?auto_111395 ) ( ON_BOARD ?auto_111395 ?auto_111394 ) ( SUPPORTS ?auto_111395 ?auto_111390 ) ( POWER_ON ?auto_111395 ) ( POINTING ?auto_111394 ?auto_111393 ) ( HAVE_IMAGE ?auto_111391 ?auto_111392 ) ( not ( = ?auto_111392 ?auto_111390 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111393 ?auto_111390 )
      ( GET-2IMAGE-VERIFY ?auto_111391 ?auto_111392 ?auto_111393 ?auto_111390 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_111397 - DIRECTION
      ?auto_111398 - MODE
      ?auto_111399 - DIRECTION
      ?auto_111396 - MODE
    )
    :vars
    (
      ?auto_111401 - INSTRUMENT
      ?auto_111400 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_111399 ?auto_111397 ) ) ( CALIBRATED ?auto_111401 ) ( ON_BOARD ?auto_111401 ?auto_111400 ) ( SUPPORTS ?auto_111401 ?auto_111398 ) ( POWER_ON ?auto_111401 ) ( POINTING ?auto_111400 ?auto_111397 ) ( HAVE_IMAGE ?auto_111399 ?auto_111396 ) ( not ( = ?auto_111398 ?auto_111396 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111397 ?auto_111398 )
      ( GET-2IMAGE-VERIFY ?auto_111397 ?auto_111398 ?auto_111399 ?auto_111396 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_111620 - DIRECTION
      ?auto_111621 - MODE
      ?auto_111622 - DIRECTION
      ?auto_111619 - MODE
    )
    :vars
    (
      ?auto_111625 - INSTRUMENT
      ?auto_111623 - SATELLITE
      ?auto_111624 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_111622 ?auto_111620 ) ) ( CALIBRATED ?auto_111625 ) ( ON_BOARD ?auto_111625 ?auto_111623 ) ( SUPPORTS ?auto_111625 ?auto_111619 ) ( POWER_ON ?auto_111625 ) ( POINTING ?auto_111623 ?auto_111624 ) ( not ( = ?auto_111622 ?auto_111624 ) ) ( HAVE_IMAGE ?auto_111620 ?auto_111621 ) ( not ( = ?auto_111620 ?auto_111624 ) ) ( not ( = ?auto_111621 ?auto_111619 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111622 ?auto_111619 )
      ( GET-2IMAGE-VERIFY ?auto_111620 ?auto_111621 ?auto_111622 ?auto_111619 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_111627 - DIRECTION
      ?auto_111628 - MODE
      ?auto_111629 - DIRECTION
      ?auto_111626 - MODE
    )
    :vars
    (
      ?auto_111630 - INSTRUMENT
      ?auto_111632 - SATELLITE
      ?auto_111631 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_111629 ?auto_111627 ) ) ( CALIBRATED ?auto_111630 ) ( ON_BOARD ?auto_111630 ?auto_111632 ) ( SUPPORTS ?auto_111630 ?auto_111628 ) ( POWER_ON ?auto_111630 ) ( POINTING ?auto_111632 ?auto_111631 ) ( not ( = ?auto_111627 ?auto_111631 ) ) ( HAVE_IMAGE ?auto_111629 ?auto_111626 ) ( not ( = ?auto_111629 ?auto_111631 ) ) ( not ( = ?auto_111626 ?auto_111628 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111629 ?auto_111626 ?auto_111627 ?auto_111628 )
      ( GET-2IMAGE-VERIFY ?auto_111627 ?auto_111628 ?auto_111629 ?auto_111626 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_111874 - DIRECTION
      ?auto_111875 - MODE
    )
    :vars
    (
      ?auto_111880 - DIRECTION
      ?auto_111876 - INSTRUMENT
      ?auto_111879 - SATELLITE
      ?auto_111878 - DIRECTION
      ?auto_111877 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_111874 ?auto_111880 ) ) ( ON_BOARD ?auto_111876 ?auto_111879 ) ( SUPPORTS ?auto_111876 ?auto_111875 ) ( POWER_ON ?auto_111876 ) ( POINTING ?auto_111879 ?auto_111878 ) ( not ( = ?auto_111874 ?auto_111878 ) ) ( HAVE_IMAGE ?auto_111880 ?auto_111877 ) ( not ( = ?auto_111880 ?auto_111878 ) ) ( not ( = ?auto_111877 ?auto_111875 ) ) ( CALIBRATION_TARGET ?auto_111876 ?auto_111878 ) ( NOT_CALIBRATED ?auto_111876 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_111879 ?auto_111876 ?auto_111878 )
      ( GET-2IMAGE ?auto_111880 ?auto_111877 ?auto_111874 ?auto_111875 )
      ( GET-1IMAGE-VERIFY ?auto_111874 ?auto_111875 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_111882 - DIRECTION
      ?auto_111883 - MODE
      ?auto_111884 - DIRECTION
      ?auto_111881 - MODE
    )
    :vars
    (
      ?auto_111885 - INSTRUMENT
      ?auto_111886 - SATELLITE
      ?auto_111887 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_111884 ?auto_111882 ) ) ( ON_BOARD ?auto_111885 ?auto_111886 ) ( SUPPORTS ?auto_111885 ?auto_111881 ) ( POWER_ON ?auto_111885 ) ( POINTING ?auto_111886 ?auto_111887 ) ( not ( = ?auto_111884 ?auto_111887 ) ) ( HAVE_IMAGE ?auto_111882 ?auto_111883 ) ( not ( = ?auto_111882 ?auto_111887 ) ) ( not ( = ?auto_111883 ?auto_111881 ) ) ( CALIBRATION_TARGET ?auto_111885 ?auto_111887 ) ( NOT_CALIBRATED ?auto_111885 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111884 ?auto_111881 )
      ( GET-2IMAGE-VERIFY ?auto_111882 ?auto_111883 ?auto_111884 ?auto_111881 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_111889 - DIRECTION
      ?auto_111890 - MODE
      ?auto_111891 - DIRECTION
      ?auto_111888 - MODE
    )
    :vars
    (
      ?auto_111894 - INSTRUMENT
      ?auto_111892 - SATELLITE
      ?auto_111893 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_111891 ?auto_111889 ) ) ( ON_BOARD ?auto_111894 ?auto_111892 ) ( SUPPORTS ?auto_111894 ?auto_111890 ) ( POWER_ON ?auto_111894 ) ( POINTING ?auto_111892 ?auto_111893 ) ( not ( = ?auto_111889 ?auto_111893 ) ) ( HAVE_IMAGE ?auto_111891 ?auto_111888 ) ( not ( = ?auto_111891 ?auto_111893 ) ) ( not ( = ?auto_111888 ?auto_111890 ) ) ( CALIBRATION_TARGET ?auto_111894 ?auto_111893 ) ( NOT_CALIBRATED ?auto_111894 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111891 ?auto_111888 ?auto_111889 ?auto_111890 )
      ( GET-2IMAGE-VERIFY ?auto_111889 ?auto_111890 ?auto_111891 ?auto_111888 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_112136 - DIRECTION
      ?auto_112137 - MODE
    )
    :vars
    (
      ?auto_112139 - DIRECTION
      ?auto_112142 - INSTRUMENT
      ?auto_112140 - SATELLITE
      ?auto_112141 - DIRECTION
      ?auto_112138 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_112136 ?auto_112139 ) ) ( ON_BOARD ?auto_112142 ?auto_112140 ) ( SUPPORTS ?auto_112142 ?auto_112137 ) ( POINTING ?auto_112140 ?auto_112141 ) ( not ( = ?auto_112136 ?auto_112141 ) ) ( HAVE_IMAGE ?auto_112139 ?auto_112138 ) ( not ( = ?auto_112139 ?auto_112141 ) ) ( not ( = ?auto_112138 ?auto_112137 ) ) ( CALIBRATION_TARGET ?auto_112142 ?auto_112141 ) ( POWER_AVAIL ?auto_112140 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_112142 ?auto_112140 )
      ( GET-2IMAGE ?auto_112139 ?auto_112138 ?auto_112136 ?auto_112137 )
      ( GET-1IMAGE-VERIFY ?auto_112136 ?auto_112137 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112144 - DIRECTION
      ?auto_112145 - MODE
      ?auto_112146 - DIRECTION
      ?auto_112143 - MODE
    )
    :vars
    (
      ?auto_112147 - INSTRUMENT
      ?auto_112149 - SATELLITE
      ?auto_112148 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_112146 ?auto_112144 ) ) ( ON_BOARD ?auto_112147 ?auto_112149 ) ( SUPPORTS ?auto_112147 ?auto_112143 ) ( POINTING ?auto_112149 ?auto_112148 ) ( not ( = ?auto_112146 ?auto_112148 ) ) ( HAVE_IMAGE ?auto_112144 ?auto_112145 ) ( not ( = ?auto_112144 ?auto_112148 ) ) ( not ( = ?auto_112145 ?auto_112143 ) ) ( CALIBRATION_TARGET ?auto_112147 ?auto_112148 ) ( POWER_AVAIL ?auto_112149 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_112146 ?auto_112143 )
      ( GET-2IMAGE-VERIFY ?auto_112144 ?auto_112145 ?auto_112146 ?auto_112143 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112151 - DIRECTION
      ?auto_112152 - MODE
      ?auto_112153 - DIRECTION
      ?auto_112150 - MODE
    )
    :vars
    (
      ?auto_112156 - INSTRUMENT
      ?auto_112155 - SATELLITE
      ?auto_112154 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_112153 ?auto_112151 ) ) ( ON_BOARD ?auto_112156 ?auto_112155 ) ( SUPPORTS ?auto_112156 ?auto_112152 ) ( POINTING ?auto_112155 ?auto_112154 ) ( not ( = ?auto_112151 ?auto_112154 ) ) ( HAVE_IMAGE ?auto_112153 ?auto_112150 ) ( not ( = ?auto_112153 ?auto_112154 ) ) ( not ( = ?auto_112150 ?auto_112152 ) ) ( CALIBRATION_TARGET ?auto_112156 ?auto_112154 ) ( POWER_AVAIL ?auto_112155 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112153 ?auto_112150 ?auto_112151 ?auto_112152 )
      ( GET-2IMAGE-VERIFY ?auto_112151 ?auto_112152 ?auto_112153 ?auto_112150 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_112398 - DIRECTION
      ?auto_112399 - MODE
    )
    :vars
    (
      ?auto_112403 - DIRECTION
      ?auto_112402 - INSTRUMENT
      ?auto_112401 - SATELLITE
      ?auto_112400 - DIRECTION
      ?auto_112404 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_112398 ?auto_112403 ) ) ( ON_BOARD ?auto_112402 ?auto_112401 ) ( SUPPORTS ?auto_112402 ?auto_112399 ) ( not ( = ?auto_112398 ?auto_112400 ) ) ( HAVE_IMAGE ?auto_112403 ?auto_112404 ) ( not ( = ?auto_112403 ?auto_112400 ) ) ( not ( = ?auto_112404 ?auto_112399 ) ) ( CALIBRATION_TARGET ?auto_112402 ?auto_112400 ) ( POWER_AVAIL ?auto_112401 ) ( POINTING ?auto_112401 ?auto_112403 ) )
    :subtasks
    ( ( !TURN_TO ?auto_112401 ?auto_112400 ?auto_112403 )
      ( GET-2IMAGE ?auto_112403 ?auto_112404 ?auto_112398 ?auto_112399 )
      ( GET-1IMAGE-VERIFY ?auto_112398 ?auto_112399 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112406 - DIRECTION
      ?auto_112407 - MODE
      ?auto_112408 - DIRECTION
      ?auto_112405 - MODE
    )
    :vars
    (
      ?auto_112410 - INSTRUMENT
      ?auto_112409 - SATELLITE
      ?auto_112411 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_112408 ?auto_112406 ) ) ( ON_BOARD ?auto_112410 ?auto_112409 ) ( SUPPORTS ?auto_112410 ?auto_112405 ) ( not ( = ?auto_112408 ?auto_112411 ) ) ( HAVE_IMAGE ?auto_112406 ?auto_112407 ) ( not ( = ?auto_112406 ?auto_112411 ) ) ( not ( = ?auto_112407 ?auto_112405 ) ) ( CALIBRATION_TARGET ?auto_112410 ?auto_112411 ) ( POWER_AVAIL ?auto_112409 ) ( POINTING ?auto_112409 ?auto_112406 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_112408 ?auto_112405 )
      ( GET-2IMAGE-VERIFY ?auto_112406 ?auto_112407 ?auto_112408 ?auto_112405 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112413 - DIRECTION
      ?auto_112414 - MODE
      ?auto_112415 - DIRECTION
      ?auto_112412 - MODE
    )
    :vars
    (
      ?auto_112416 - INSTRUMENT
      ?auto_112418 - SATELLITE
      ?auto_112417 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_112415 ?auto_112413 ) ) ( ON_BOARD ?auto_112416 ?auto_112418 ) ( SUPPORTS ?auto_112416 ?auto_112414 ) ( not ( = ?auto_112413 ?auto_112417 ) ) ( HAVE_IMAGE ?auto_112415 ?auto_112412 ) ( not ( = ?auto_112415 ?auto_112417 ) ) ( not ( = ?auto_112412 ?auto_112414 ) ) ( CALIBRATION_TARGET ?auto_112416 ?auto_112417 ) ( POWER_AVAIL ?auto_112418 ) ( POINTING ?auto_112418 ?auto_112415 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112415 ?auto_112412 ?auto_112413 ?auto_112414 )
      ( GET-2IMAGE-VERIFY ?auto_112413 ?auto_112414 ?auto_112415 ?auto_112412 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_112660 - DIRECTION
      ?auto_112661 - MODE
    )
    :vars
    (
      ?auto_112665 - DIRECTION
      ?auto_112663 - INSTRUMENT
      ?auto_112666 - SATELLITE
      ?auto_112664 - DIRECTION
      ?auto_112662 - MODE
      ?auto_112667 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_112660 ?auto_112665 ) ) ( ON_BOARD ?auto_112663 ?auto_112666 ) ( SUPPORTS ?auto_112663 ?auto_112661 ) ( not ( = ?auto_112660 ?auto_112664 ) ) ( HAVE_IMAGE ?auto_112665 ?auto_112662 ) ( not ( = ?auto_112665 ?auto_112664 ) ) ( not ( = ?auto_112662 ?auto_112661 ) ) ( CALIBRATION_TARGET ?auto_112663 ?auto_112664 ) ( POINTING ?auto_112666 ?auto_112665 ) ( ON_BOARD ?auto_112667 ?auto_112666 ) ( POWER_ON ?auto_112667 ) ( not ( = ?auto_112663 ?auto_112667 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_112667 ?auto_112666 )
      ( GET-2IMAGE ?auto_112665 ?auto_112662 ?auto_112660 ?auto_112661 )
      ( GET-1IMAGE-VERIFY ?auto_112660 ?auto_112661 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112669 - DIRECTION
      ?auto_112670 - MODE
      ?auto_112671 - DIRECTION
      ?auto_112668 - MODE
    )
    :vars
    (
      ?auto_112672 - INSTRUMENT
      ?auto_112673 - SATELLITE
      ?auto_112675 - DIRECTION
      ?auto_112674 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_112671 ?auto_112669 ) ) ( ON_BOARD ?auto_112672 ?auto_112673 ) ( SUPPORTS ?auto_112672 ?auto_112668 ) ( not ( = ?auto_112671 ?auto_112675 ) ) ( HAVE_IMAGE ?auto_112669 ?auto_112670 ) ( not ( = ?auto_112669 ?auto_112675 ) ) ( not ( = ?auto_112670 ?auto_112668 ) ) ( CALIBRATION_TARGET ?auto_112672 ?auto_112675 ) ( POINTING ?auto_112673 ?auto_112669 ) ( ON_BOARD ?auto_112674 ?auto_112673 ) ( POWER_ON ?auto_112674 ) ( not ( = ?auto_112672 ?auto_112674 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_112671 ?auto_112668 )
      ( GET-2IMAGE-VERIFY ?auto_112669 ?auto_112670 ?auto_112671 ?auto_112668 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112677 - DIRECTION
      ?auto_112678 - MODE
      ?auto_112679 - DIRECTION
      ?auto_112676 - MODE
    )
    :vars
    (
      ?auto_112683 - INSTRUMENT
      ?auto_112682 - SATELLITE
      ?auto_112681 - DIRECTION
      ?auto_112680 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_112679 ?auto_112677 ) ) ( ON_BOARD ?auto_112683 ?auto_112682 ) ( SUPPORTS ?auto_112683 ?auto_112678 ) ( not ( = ?auto_112677 ?auto_112681 ) ) ( HAVE_IMAGE ?auto_112679 ?auto_112676 ) ( not ( = ?auto_112679 ?auto_112681 ) ) ( not ( = ?auto_112676 ?auto_112678 ) ) ( CALIBRATION_TARGET ?auto_112683 ?auto_112681 ) ( POINTING ?auto_112682 ?auto_112679 ) ( ON_BOARD ?auto_112680 ?auto_112682 ) ( POWER_ON ?auto_112680 ) ( not ( = ?auto_112683 ?auto_112680 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112679 ?auto_112676 ?auto_112677 ?auto_112678 )
      ( GET-2IMAGE-VERIFY ?auto_112677 ?auto_112678 ?auto_112679 ?auto_112676 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_112948 - DIRECTION
      ?auto_112949 - MODE
    )
    :vars
    (
      ?auto_112950 - DIRECTION
      ?auto_112955 - INSTRUMENT
      ?auto_112953 - SATELLITE
      ?auto_112952 - DIRECTION
      ?auto_112954 - MODE
      ?auto_112951 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_112948 ?auto_112950 ) ) ( ON_BOARD ?auto_112955 ?auto_112953 ) ( SUPPORTS ?auto_112955 ?auto_112949 ) ( not ( = ?auto_112948 ?auto_112952 ) ) ( not ( = ?auto_112950 ?auto_112952 ) ) ( not ( = ?auto_112954 ?auto_112949 ) ) ( CALIBRATION_TARGET ?auto_112955 ?auto_112952 ) ( POINTING ?auto_112953 ?auto_112950 ) ( ON_BOARD ?auto_112951 ?auto_112953 ) ( POWER_ON ?auto_112951 ) ( not ( = ?auto_112955 ?auto_112951 ) ) ( CALIBRATED ?auto_112951 ) ( SUPPORTS ?auto_112951 ?auto_112954 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_112950 ?auto_112954 )
      ( GET-2IMAGE ?auto_112950 ?auto_112954 ?auto_112948 ?auto_112949 )
      ( GET-1IMAGE-VERIFY ?auto_112948 ?auto_112949 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112957 - DIRECTION
      ?auto_112958 - MODE
      ?auto_112959 - DIRECTION
      ?auto_112956 - MODE
    )
    :vars
    (
      ?auto_112962 - INSTRUMENT
      ?auto_112960 - SATELLITE
      ?auto_112961 - DIRECTION
      ?auto_112963 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_112959 ?auto_112957 ) ) ( ON_BOARD ?auto_112962 ?auto_112960 ) ( SUPPORTS ?auto_112962 ?auto_112956 ) ( not ( = ?auto_112959 ?auto_112961 ) ) ( not ( = ?auto_112957 ?auto_112961 ) ) ( not ( = ?auto_112958 ?auto_112956 ) ) ( CALIBRATION_TARGET ?auto_112962 ?auto_112961 ) ( POINTING ?auto_112960 ?auto_112957 ) ( ON_BOARD ?auto_112963 ?auto_112960 ) ( POWER_ON ?auto_112963 ) ( not ( = ?auto_112962 ?auto_112963 ) ) ( CALIBRATED ?auto_112963 ) ( SUPPORTS ?auto_112963 ?auto_112958 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_112959 ?auto_112956 )
      ( GET-2IMAGE-VERIFY ?auto_112957 ?auto_112958 ?auto_112959 ?auto_112956 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112965 - DIRECTION
      ?auto_112966 - MODE
      ?auto_112967 - DIRECTION
      ?auto_112964 - MODE
    )
    :vars
    (
      ?auto_112969 - INSTRUMENT
      ?auto_112971 - SATELLITE
      ?auto_112970 - DIRECTION
      ?auto_112968 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_112967 ?auto_112965 ) ) ( ON_BOARD ?auto_112969 ?auto_112971 ) ( SUPPORTS ?auto_112969 ?auto_112966 ) ( not ( = ?auto_112965 ?auto_112970 ) ) ( not ( = ?auto_112967 ?auto_112970 ) ) ( not ( = ?auto_112964 ?auto_112966 ) ) ( CALIBRATION_TARGET ?auto_112969 ?auto_112970 ) ( POINTING ?auto_112971 ?auto_112967 ) ( ON_BOARD ?auto_112968 ?auto_112971 ) ( POWER_ON ?auto_112968 ) ( not ( = ?auto_112969 ?auto_112968 ) ) ( CALIBRATED ?auto_112968 ) ( SUPPORTS ?auto_112968 ?auto_112964 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112967 ?auto_112964 ?auto_112965 ?auto_112966 )
      ( GET-2IMAGE-VERIFY ?auto_112965 ?auto_112966 ?auto_112967 ?auto_112964 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_113236 - DIRECTION
      ?auto_113237 - MODE
    )
    :vars
    (
      ?auto_113238 - DIRECTION
      ?auto_113240 - INSTRUMENT
      ?auto_113243 - SATELLITE
      ?auto_113242 - DIRECTION
      ?auto_113241 - MODE
      ?auto_113239 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_113236 ?auto_113238 ) ) ( ON_BOARD ?auto_113240 ?auto_113243 ) ( SUPPORTS ?auto_113240 ?auto_113237 ) ( not ( = ?auto_113236 ?auto_113242 ) ) ( not ( = ?auto_113238 ?auto_113242 ) ) ( not ( = ?auto_113241 ?auto_113237 ) ) ( CALIBRATION_TARGET ?auto_113240 ?auto_113242 ) ( ON_BOARD ?auto_113239 ?auto_113243 ) ( POWER_ON ?auto_113239 ) ( not ( = ?auto_113240 ?auto_113239 ) ) ( CALIBRATED ?auto_113239 ) ( SUPPORTS ?auto_113239 ?auto_113241 ) ( POINTING ?auto_113243 ?auto_113242 ) )
    :subtasks
    ( ( !TURN_TO ?auto_113243 ?auto_113238 ?auto_113242 )
      ( GET-2IMAGE ?auto_113238 ?auto_113241 ?auto_113236 ?auto_113237 )
      ( GET-1IMAGE-VERIFY ?auto_113236 ?auto_113237 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_113245 - DIRECTION
      ?auto_113246 - MODE
      ?auto_113247 - DIRECTION
      ?auto_113244 - MODE
    )
    :vars
    (
      ?auto_113250 - INSTRUMENT
      ?auto_113248 - SATELLITE
      ?auto_113251 - DIRECTION
      ?auto_113249 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_113247 ?auto_113245 ) ) ( ON_BOARD ?auto_113250 ?auto_113248 ) ( SUPPORTS ?auto_113250 ?auto_113244 ) ( not ( = ?auto_113247 ?auto_113251 ) ) ( not ( = ?auto_113245 ?auto_113251 ) ) ( not ( = ?auto_113246 ?auto_113244 ) ) ( CALIBRATION_TARGET ?auto_113250 ?auto_113251 ) ( ON_BOARD ?auto_113249 ?auto_113248 ) ( POWER_ON ?auto_113249 ) ( not ( = ?auto_113250 ?auto_113249 ) ) ( CALIBRATED ?auto_113249 ) ( SUPPORTS ?auto_113249 ?auto_113246 ) ( POINTING ?auto_113248 ?auto_113251 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_113247 ?auto_113244 )
      ( GET-2IMAGE-VERIFY ?auto_113245 ?auto_113246 ?auto_113247 ?auto_113244 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_113253 - DIRECTION
      ?auto_113254 - MODE
      ?auto_113255 - DIRECTION
      ?auto_113252 - MODE
    )
    :vars
    (
      ?auto_113257 - INSTRUMENT
      ?auto_113258 - SATELLITE
      ?auto_113256 - DIRECTION
      ?auto_113259 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_113255 ?auto_113253 ) ) ( ON_BOARD ?auto_113257 ?auto_113258 ) ( SUPPORTS ?auto_113257 ?auto_113254 ) ( not ( = ?auto_113253 ?auto_113256 ) ) ( not ( = ?auto_113255 ?auto_113256 ) ) ( not ( = ?auto_113252 ?auto_113254 ) ) ( CALIBRATION_TARGET ?auto_113257 ?auto_113256 ) ( ON_BOARD ?auto_113259 ?auto_113258 ) ( POWER_ON ?auto_113259 ) ( not ( = ?auto_113257 ?auto_113259 ) ) ( CALIBRATED ?auto_113259 ) ( SUPPORTS ?auto_113259 ?auto_113252 ) ( POINTING ?auto_113258 ?auto_113256 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_113255 ?auto_113252 ?auto_113253 ?auto_113254 )
      ( GET-2IMAGE-VERIFY ?auto_113253 ?auto_113254 ?auto_113255 ?auto_113252 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_113524 - DIRECTION
      ?auto_113525 - MODE
    )
    :vars
    (
      ?auto_113530 - DIRECTION
      ?auto_113527 - INSTRUMENT
      ?auto_113528 - SATELLITE
      ?auto_113526 - DIRECTION
      ?auto_113529 - MODE
      ?auto_113531 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_113524 ?auto_113530 ) ) ( ON_BOARD ?auto_113527 ?auto_113528 ) ( SUPPORTS ?auto_113527 ?auto_113525 ) ( not ( = ?auto_113524 ?auto_113526 ) ) ( not ( = ?auto_113530 ?auto_113526 ) ) ( not ( = ?auto_113529 ?auto_113525 ) ) ( CALIBRATION_TARGET ?auto_113527 ?auto_113526 ) ( ON_BOARD ?auto_113531 ?auto_113528 ) ( POWER_ON ?auto_113531 ) ( not ( = ?auto_113527 ?auto_113531 ) ) ( SUPPORTS ?auto_113531 ?auto_113529 ) ( POINTING ?auto_113528 ?auto_113526 ) ( CALIBRATION_TARGET ?auto_113531 ?auto_113526 ) ( NOT_CALIBRATED ?auto_113531 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_113528 ?auto_113531 ?auto_113526 )
      ( GET-2IMAGE ?auto_113530 ?auto_113529 ?auto_113524 ?auto_113525 )
      ( GET-1IMAGE-VERIFY ?auto_113524 ?auto_113525 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_113533 - DIRECTION
      ?auto_113534 - MODE
      ?auto_113535 - DIRECTION
      ?auto_113532 - MODE
    )
    :vars
    (
      ?auto_113538 - INSTRUMENT
      ?auto_113536 - SATELLITE
      ?auto_113537 - DIRECTION
      ?auto_113539 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_113535 ?auto_113533 ) ) ( ON_BOARD ?auto_113538 ?auto_113536 ) ( SUPPORTS ?auto_113538 ?auto_113532 ) ( not ( = ?auto_113535 ?auto_113537 ) ) ( not ( = ?auto_113533 ?auto_113537 ) ) ( not ( = ?auto_113534 ?auto_113532 ) ) ( CALIBRATION_TARGET ?auto_113538 ?auto_113537 ) ( ON_BOARD ?auto_113539 ?auto_113536 ) ( POWER_ON ?auto_113539 ) ( not ( = ?auto_113538 ?auto_113539 ) ) ( SUPPORTS ?auto_113539 ?auto_113534 ) ( POINTING ?auto_113536 ?auto_113537 ) ( CALIBRATION_TARGET ?auto_113539 ?auto_113537 ) ( NOT_CALIBRATED ?auto_113539 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_113535 ?auto_113532 )
      ( GET-2IMAGE-VERIFY ?auto_113533 ?auto_113534 ?auto_113535 ?auto_113532 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_113541 - DIRECTION
      ?auto_113542 - MODE
      ?auto_113543 - DIRECTION
      ?auto_113540 - MODE
    )
    :vars
    (
      ?auto_113546 - INSTRUMENT
      ?auto_113544 - SATELLITE
      ?auto_113545 - DIRECTION
      ?auto_113547 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_113543 ?auto_113541 ) ) ( ON_BOARD ?auto_113546 ?auto_113544 ) ( SUPPORTS ?auto_113546 ?auto_113542 ) ( not ( = ?auto_113541 ?auto_113545 ) ) ( not ( = ?auto_113543 ?auto_113545 ) ) ( not ( = ?auto_113540 ?auto_113542 ) ) ( CALIBRATION_TARGET ?auto_113546 ?auto_113545 ) ( ON_BOARD ?auto_113547 ?auto_113544 ) ( POWER_ON ?auto_113547 ) ( not ( = ?auto_113546 ?auto_113547 ) ) ( SUPPORTS ?auto_113547 ?auto_113540 ) ( POINTING ?auto_113544 ?auto_113545 ) ( CALIBRATION_TARGET ?auto_113547 ?auto_113545 ) ( NOT_CALIBRATED ?auto_113547 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_113543 ?auto_113540 ?auto_113541 ?auto_113542 )
      ( GET-2IMAGE-VERIFY ?auto_113541 ?auto_113542 ?auto_113543 ?auto_113540 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_115034 - DIRECTION
      ?auto_115035 - MODE
      ?auto_115036 - DIRECTION
      ?auto_115033 - MODE
      ?auto_115038 - DIRECTION
      ?auto_115037 - MODE
    )
    :vars
    (
      ?auto_115039 - INSTRUMENT
      ?auto_115040 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_115036 ?auto_115034 ) ) ( not ( = ?auto_115038 ?auto_115034 ) ) ( not ( = ?auto_115038 ?auto_115036 ) ) ( CALIBRATED ?auto_115039 ) ( ON_BOARD ?auto_115039 ?auto_115040 ) ( SUPPORTS ?auto_115039 ?auto_115037 ) ( POWER_ON ?auto_115039 ) ( POINTING ?auto_115040 ?auto_115038 ) ( HAVE_IMAGE ?auto_115034 ?auto_115035 ) ( HAVE_IMAGE ?auto_115036 ?auto_115033 ) ( not ( = ?auto_115035 ?auto_115033 ) ) ( not ( = ?auto_115035 ?auto_115037 ) ) ( not ( = ?auto_115033 ?auto_115037 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_115038 ?auto_115037 )
      ( GET-3IMAGE-VERIFY ?auto_115034 ?auto_115035 ?auto_115036 ?auto_115033 ?auto_115038 ?auto_115037 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_115050 - DIRECTION
      ?auto_115051 - MODE
      ?auto_115052 - DIRECTION
      ?auto_115049 - MODE
      ?auto_115054 - DIRECTION
      ?auto_115053 - MODE
    )
    :vars
    (
      ?auto_115055 - INSTRUMENT
      ?auto_115056 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_115052 ?auto_115050 ) ) ( not ( = ?auto_115054 ?auto_115050 ) ) ( not ( = ?auto_115054 ?auto_115052 ) ) ( CALIBRATED ?auto_115055 ) ( ON_BOARD ?auto_115055 ?auto_115056 ) ( SUPPORTS ?auto_115055 ?auto_115049 ) ( POWER_ON ?auto_115055 ) ( POINTING ?auto_115056 ?auto_115052 ) ( HAVE_IMAGE ?auto_115050 ?auto_115051 ) ( HAVE_IMAGE ?auto_115054 ?auto_115053 ) ( not ( = ?auto_115051 ?auto_115049 ) ) ( not ( = ?auto_115051 ?auto_115053 ) ) ( not ( = ?auto_115049 ?auto_115053 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_115052 ?auto_115049 )
      ( GET-3IMAGE-VERIFY ?auto_115050 ?auto_115051 ?auto_115052 ?auto_115049 ?auto_115054 ?auto_115053 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_115110 - DIRECTION
      ?auto_115111 - MODE
      ?auto_115112 - DIRECTION
      ?auto_115109 - MODE
      ?auto_115114 - DIRECTION
      ?auto_115113 - MODE
    )
    :vars
    (
      ?auto_115115 - INSTRUMENT
      ?auto_115116 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_115112 ?auto_115110 ) ) ( not ( = ?auto_115114 ?auto_115110 ) ) ( not ( = ?auto_115114 ?auto_115112 ) ) ( CALIBRATED ?auto_115115 ) ( ON_BOARD ?auto_115115 ?auto_115116 ) ( SUPPORTS ?auto_115115 ?auto_115111 ) ( POWER_ON ?auto_115115 ) ( POINTING ?auto_115116 ?auto_115110 ) ( HAVE_IMAGE ?auto_115112 ?auto_115109 ) ( HAVE_IMAGE ?auto_115114 ?auto_115113 ) ( not ( = ?auto_115111 ?auto_115109 ) ) ( not ( = ?auto_115111 ?auto_115113 ) ) ( not ( = ?auto_115109 ?auto_115113 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_115110 ?auto_115111 )
      ( GET-3IMAGE-VERIFY ?auto_115110 ?auto_115111 ?auto_115112 ?auto_115109 ?auto_115114 ?auto_115113 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_115867 - DIRECTION
      ?auto_115868 - MODE
      ?auto_115869 - DIRECTION
      ?auto_115866 - MODE
      ?auto_115871 - DIRECTION
      ?auto_115870 - MODE
    )
    :vars
    (
      ?auto_115874 - INSTRUMENT
      ?auto_115873 - SATELLITE
      ?auto_115872 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_115869 ?auto_115867 ) ) ( not ( = ?auto_115871 ?auto_115867 ) ) ( not ( = ?auto_115871 ?auto_115869 ) ) ( CALIBRATED ?auto_115874 ) ( ON_BOARD ?auto_115874 ?auto_115873 ) ( SUPPORTS ?auto_115874 ?auto_115870 ) ( POWER_ON ?auto_115874 ) ( POINTING ?auto_115873 ?auto_115872 ) ( not ( = ?auto_115871 ?auto_115872 ) ) ( HAVE_IMAGE ?auto_115867 ?auto_115868 ) ( not ( = ?auto_115867 ?auto_115872 ) ) ( not ( = ?auto_115868 ?auto_115870 ) ) ( HAVE_IMAGE ?auto_115869 ?auto_115866 ) ( not ( = ?auto_115868 ?auto_115866 ) ) ( not ( = ?auto_115869 ?auto_115872 ) ) ( not ( = ?auto_115866 ?auto_115870 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115867 ?auto_115868 ?auto_115871 ?auto_115870 )
      ( GET-3IMAGE-VERIFY ?auto_115867 ?auto_115868 ?auto_115869 ?auto_115866 ?auto_115871 ?auto_115870 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_115885 - DIRECTION
      ?auto_115886 - MODE
      ?auto_115887 - DIRECTION
      ?auto_115884 - MODE
      ?auto_115889 - DIRECTION
      ?auto_115888 - MODE
    )
    :vars
    (
      ?auto_115892 - INSTRUMENT
      ?auto_115891 - SATELLITE
      ?auto_115890 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_115887 ?auto_115885 ) ) ( not ( = ?auto_115889 ?auto_115885 ) ) ( not ( = ?auto_115889 ?auto_115887 ) ) ( CALIBRATED ?auto_115892 ) ( ON_BOARD ?auto_115892 ?auto_115891 ) ( SUPPORTS ?auto_115892 ?auto_115884 ) ( POWER_ON ?auto_115892 ) ( POINTING ?auto_115891 ?auto_115890 ) ( not ( = ?auto_115887 ?auto_115890 ) ) ( HAVE_IMAGE ?auto_115885 ?auto_115886 ) ( not ( = ?auto_115885 ?auto_115890 ) ) ( not ( = ?auto_115886 ?auto_115884 ) ) ( HAVE_IMAGE ?auto_115889 ?auto_115888 ) ( not ( = ?auto_115886 ?auto_115888 ) ) ( not ( = ?auto_115884 ?auto_115888 ) ) ( not ( = ?auto_115889 ?auto_115890 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115885 ?auto_115886 ?auto_115887 ?auto_115884 )
      ( GET-3IMAGE-VERIFY ?auto_115885 ?auto_115886 ?auto_115887 ?auto_115884 ?auto_115889 ?auto_115888 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_115957 - DIRECTION
      ?auto_115958 - MODE
      ?auto_115959 - DIRECTION
      ?auto_115956 - MODE
      ?auto_115961 - DIRECTION
      ?auto_115960 - MODE
    )
    :vars
    (
      ?auto_115964 - INSTRUMENT
      ?auto_115963 - SATELLITE
      ?auto_115962 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_115959 ?auto_115957 ) ) ( not ( = ?auto_115961 ?auto_115957 ) ) ( not ( = ?auto_115961 ?auto_115959 ) ) ( CALIBRATED ?auto_115964 ) ( ON_BOARD ?auto_115964 ?auto_115963 ) ( SUPPORTS ?auto_115964 ?auto_115958 ) ( POWER_ON ?auto_115964 ) ( POINTING ?auto_115963 ?auto_115962 ) ( not ( = ?auto_115957 ?auto_115962 ) ) ( HAVE_IMAGE ?auto_115959 ?auto_115956 ) ( not ( = ?auto_115959 ?auto_115962 ) ) ( not ( = ?auto_115956 ?auto_115958 ) ) ( HAVE_IMAGE ?auto_115961 ?auto_115960 ) ( not ( = ?auto_115958 ?auto_115960 ) ) ( not ( = ?auto_115956 ?auto_115960 ) ) ( not ( = ?auto_115961 ?auto_115962 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115959 ?auto_115956 ?auto_115957 ?auto_115958 )
      ( GET-3IMAGE-VERIFY ?auto_115957 ?auto_115958 ?auto_115959 ?auto_115956 ?auto_115961 ?auto_115960 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_116826 - DIRECTION
      ?auto_116827 - MODE
      ?auto_116828 - DIRECTION
      ?auto_116825 - MODE
      ?auto_116830 - DIRECTION
      ?auto_116829 - MODE
    )
    :vars
    (
      ?auto_116831 - INSTRUMENT
      ?auto_116832 - SATELLITE
      ?auto_116833 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_116828 ?auto_116826 ) ) ( not ( = ?auto_116830 ?auto_116826 ) ) ( not ( = ?auto_116830 ?auto_116828 ) ) ( ON_BOARD ?auto_116831 ?auto_116832 ) ( SUPPORTS ?auto_116831 ?auto_116829 ) ( POWER_ON ?auto_116831 ) ( POINTING ?auto_116832 ?auto_116833 ) ( not ( = ?auto_116830 ?auto_116833 ) ) ( HAVE_IMAGE ?auto_116826 ?auto_116827 ) ( not ( = ?auto_116826 ?auto_116833 ) ) ( not ( = ?auto_116827 ?auto_116829 ) ) ( CALIBRATION_TARGET ?auto_116831 ?auto_116833 ) ( NOT_CALIBRATED ?auto_116831 ) ( HAVE_IMAGE ?auto_116828 ?auto_116825 ) ( not ( = ?auto_116827 ?auto_116825 ) ) ( not ( = ?auto_116828 ?auto_116833 ) ) ( not ( = ?auto_116825 ?auto_116829 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116826 ?auto_116827 ?auto_116830 ?auto_116829 )
      ( GET-3IMAGE-VERIFY ?auto_116826 ?auto_116827 ?auto_116828 ?auto_116825 ?auto_116830 ?auto_116829 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_116844 - DIRECTION
      ?auto_116845 - MODE
      ?auto_116846 - DIRECTION
      ?auto_116843 - MODE
      ?auto_116848 - DIRECTION
      ?auto_116847 - MODE
    )
    :vars
    (
      ?auto_116849 - INSTRUMENT
      ?auto_116850 - SATELLITE
      ?auto_116851 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_116846 ?auto_116844 ) ) ( not ( = ?auto_116848 ?auto_116844 ) ) ( not ( = ?auto_116848 ?auto_116846 ) ) ( ON_BOARD ?auto_116849 ?auto_116850 ) ( SUPPORTS ?auto_116849 ?auto_116843 ) ( POWER_ON ?auto_116849 ) ( POINTING ?auto_116850 ?auto_116851 ) ( not ( = ?auto_116846 ?auto_116851 ) ) ( HAVE_IMAGE ?auto_116844 ?auto_116845 ) ( not ( = ?auto_116844 ?auto_116851 ) ) ( not ( = ?auto_116845 ?auto_116843 ) ) ( CALIBRATION_TARGET ?auto_116849 ?auto_116851 ) ( NOT_CALIBRATED ?auto_116849 ) ( HAVE_IMAGE ?auto_116848 ?auto_116847 ) ( not ( = ?auto_116845 ?auto_116847 ) ) ( not ( = ?auto_116843 ?auto_116847 ) ) ( not ( = ?auto_116848 ?auto_116851 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116844 ?auto_116845 ?auto_116846 ?auto_116843 )
      ( GET-3IMAGE-VERIFY ?auto_116844 ?auto_116845 ?auto_116846 ?auto_116843 ?auto_116848 ?auto_116847 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_116916 - DIRECTION
      ?auto_116917 - MODE
      ?auto_116918 - DIRECTION
      ?auto_116915 - MODE
      ?auto_116920 - DIRECTION
      ?auto_116919 - MODE
    )
    :vars
    (
      ?auto_116921 - INSTRUMENT
      ?auto_116922 - SATELLITE
      ?auto_116923 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_116918 ?auto_116916 ) ) ( not ( = ?auto_116920 ?auto_116916 ) ) ( not ( = ?auto_116920 ?auto_116918 ) ) ( ON_BOARD ?auto_116921 ?auto_116922 ) ( SUPPORTS ?auto_116921 ?auto_116917 ) ( POWER_ON ?auto_116921 ) ( POINTING ?auto_116922 ?auto_116923 ) ( not ( = ?auto_116916 ?auto_116923 ) ) ( HAVE_IMAGE ?auto_116918 ?auto_116915 ) ( not ( = ?auto_116918 ?auto_116923 ) ) ( not ( = ?auto_116915 ?auto_116917 ) ) ( CALIBRATION_TARGET ?auto_116921 ?auto_116923 ) ( NOT_CALIBRATED ?auto_116921 ) ( HAVE_IMAGE ?auto_116920 ?auto_116919 ) ( not ( = ?auto_116917 ?auto_116919 ) ) ( not ( = ?auto_116915 ?auto_116919 ) ) ( not ( = ?auto_116920 ?auto_116923 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116918 ?auto_116915 ?auto_116916 ?auto_116917 )
      ( GET-3IMAGE-VERIFY ?auto_116916 ?auto_116917 ?auto_116918 ?auto_116915 ?auto_116920 ?auto_116919 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_117785 - DIRECTION
      ?auto_117786 - MODE
      ?auto_117787 - DIRECTION
      ?auto_117784 - MODE
      ?auto_117789 - DIRECTION
      ?auto_117788 - MODE
    )
    :vars
    (
      ?auto_117792 - INSTRUMENT
      ?auto_117791 - SATELLITE
      ?auto_117790 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_117787 ?auto_117785 ) ) ( not ( = ?auto_117789 ?auto_117785 ) ) ( not ( = ?auto_117789 ?auto_117787 ) ) ( ON_BOARD ?auto_117792 ?auto_117791 ) ( SUPPORTS ?auto_117792 ?auto_117788 ) ( POINTING ?auto_117791 ?auto_117790 ) ( not ( = ?auto_117789 ?auto_117790 ) ) ( HAVE_IMAGE ?auto_117785 ?auto_117786 ) ( not ( = ?auto_117785 ?auto_117790 ) ) ( not ( = ?auto_117786 ?auto_117788 ) ) ( CALIBRATION_TARGET ?auto_117792 ?auto_117790 ) ( POWER_AVAIL ?auto_117791 ) ( HAVE_IMAGE ?auto_117787 ?auto_117784 ) ( not ( = ?auto_117786 ?auto_117784 ) ) ( not ( = ?auto_117787 ?auto_117790 ) ) ( not ( = ?auto_117784 ?auto_117788 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117785 ?auto_117786 ?auto_117789 ?auto_117788 )
      ( GET-3IMAGE-VERIFY ?auto_117785 ?auto_117786 ?auto_117787 ?auto_117784 ?auto_117789 ?auto_117788 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_117803 - DIRECTION
      ?auto_117804 - MODE
      ?auto_117805 - DIRECTION
      ?auto_117802 - MODE
      ?auto_117807 - DIRECTION
      ?auto_117806 - MODE
    )
    :vars
    (
      ?auto_117810 - INSTRUMENT
      ?auto_117809 - SATELLITE
      ?auto_117808 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_117805 ?auto_117803 ) ) ( not ( = ?auto_117807 ?auto_117803 ) ) ( not ( = ?auto_117807 ?auto_117805 ) ) ( ON_BOARD ?auto_117810 ?auto_117809 ) ( SUPPORTS ?auto_117810 ?auto_117802 ) ( POINTING ?auto_117809 ?auto_117808 ) ( not ( = ?auto_117805 ?auto_117808 ) ) ( HAVE_IMAGE ?auto_117803 ?auto_117804 ) ( not ( = ?auto_117803 ?auto_117808 ) ) ( not ( = ?auto_117804 ?auto_117802 ) ) ( CALIBRATION_TARGET ?auto_117810 ?auto_117808 ) ( POWER_AVAIL ?auto_117809 ) ( HAVE_IMAGE ?auto_117807 ?auto_117806 ) ( not ( = ?auto_117804 ?auto_117806 ) ) ( not ( = ?auto_117802 ?auto_117806 ) ) ( not ( = ?auto_117807 ?auto_117808 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117803 ?auto_117804 ?auto_117805 ?auto_117802 )
      ( GET-3IMAGE-VERIFY ?auto_117803 ?auto_117804 ?auto_117805 ?auto_117802 ?auto_117807 ?auto_117806 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_117875 - DIRECTION
      ?auto_117876 - MODE
      ?auto_117877 - DIRECTION
      ?auto_117874 - MODE
      ?auto_117879 - DIRECTION
      ?auto_117878 - MODE
    )
    :vars
    (
      ?auto_117882 - INSTRUMENT
      ?auto_117881 - SATELLITE
      ?auto_117880 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_117877 ?auto_117875 ) ) ( not ( = ?auto_117879 ?auto_117875 ) ) ( not ( = ?auto_117879 ?auto_117877 ) ) ( ON_BOARD ?auto_117882 ?auto_117881 ) ( SUPPORTS ?auto_117882 ?auto_117876 ) ( POINTING ?auto_117881 ?auto_117880 ) ( not ( = ?auto_117875 ?auto_117880 ) ) ( HAVE_IMAGE ?auto_117877 ?auto_117874 ) ( not ( = ?auto_117877 ?auto_117880 ) ) ( not ( = ?auto_117874 ?auto_117876 ) ) ( CALIBRATION_TARGET ?auto_117882 ?auto_117880 ) ( POWER_AVAIL ?auto_117881 ) ( HAVE_IMAGE ?auto_117879 ?auto_117878 ) ( not ( = ?auto_117876 ?auto_117878 ) ) ( not ( = ?auto_117874 ?auto_117878 ) ) ( not ( = ?auto_117879 ?auto_117880 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117877 ?auto_117874 ?auto_117875 ?auto_117876 )
      ( GET-3IMAGE-VERIFY ?auto_117875 ?auto_117876 ?auto_117877 ?auto_117874 ?auto_117879 ?auto_117878 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_118696 - DIRECTION
      ?auto_118697 - MODE
    )
    :vars
    (
      ?auto_118700 - DIRECTION
      ?auto_118702 - INSTRUMENT
      ?auto_118699 - SATELLITE
      ?auto_118698 - DIRECTION
      ?auto_118701 - MODE
      ?auto_118703 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_118696 ?auto_118700 ) ) ( ON_BOARD ?auto_118702 ?auto_118699 ) ( SUPPORTS ?auto_118702 ?auto_118697 ) ( not ( = ?auto_118696 ?auto_118698 ) ) ( HAVE_IMAGE ?auto_118700 ?auto_118701 ) ( not ( = ?auto_118700 ?auto_118698 ) ) ( not ( = ?auto_118701 ?auto_118697 ) ) ( CALIBRATION_TARGET ?auto_118702 ?auto_118698 ) ( POWER_AVAIL ?auto_118699 ) ( POINTING ?auto_118699 ?auto_118703 ) ( not ( = ?auto_118698 ?auto_118703 ) ) ( not ( = ?auto_118696 ?auto_118703 ) ) ( not ( = ?auto_118700 ?auto_118703 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_118699 ?auto_118698 ?auto_118703 )
      ( GET-2IMAGE ?auto_118700 ?auto_118701 ?auto_118696 ?auto_118697 )
      ( GET-1IMAGE-VERIFY ?auto_118696 ?auto_118697 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_118705 - DIRECTION
      ?auto_118706 - MODE
      ?auto_118707 - DIRECTION
      ?auto_118704 - MODE
    )
    :vars
    (
      ?auto_118711 - INSTRUMENT
      ?auto_118708 - SATELLITE
      ?auto_118710 - DIRECTION
      ?auto_118709 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_118707 ?auto_118705 ) ) ( ON_BOARD ?auto_118711 ?auto_118708 ) ( SUPPORTS ?auto_118711 ?auto_118704 ) ( not ( = ?auto_118707 ?auto_118710 ) ) ( HAVE_IMAGE ?auto_118705 ?auto_118706 ) ( not ( = ?auto_118705 ?auto_118710 ) ) ( not ( = ?auto_118706 ?auto_118704 ) ) ( CALIBRATION_TARGET ?auto_118711 ?auto_118710 ) ( POWER_AVAIL ?auto_118708 ) ( POINTING ?auto_118708 ?auto_118709 ) ( not ( = ?auto_118710 ?auto_118709 ) ) ( not ( = ?auto_118707 ?auto_118709 ) ) ( not ( = ?auto_118705 ?auto_118709 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_118707 ?auto_118704 )
      ( GET-2IMAGE-VERIFY ?auto_118705 ?auto_118706 ?auto_118707 ?auto_118704 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_118713 - DIRECTION
      ?auto_118714 - MODE
      ?auto_118715 - DIRECTION
      ?auto_118712 - MODE
    )
    :vars
    (
      ?auto_118716 - DIRECTION
      ?auto_118720 - INSTRUMENT
      ?auto_118719 - SATELLITE
      ?auto_118718 - DIRECTION
      ?auto_118717 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_118715 ?auto_118713 ) ) ( not ( = ?auto_118715 ?auto_118716 ) ) ( ON_BOARD ?auto_118720 ?auto_118719 ) ( SUPPORTS ?auto_118720 ?auto_118712 ) ( not ( = ?auto_118715 ?auto_118718 ) ) ( HAVE_IMAGE ?auto_118716 ?auto_118717 ) ( not ( = ?auto_118716 ?auto_118718 ) ) ( not ( = ?auto_118717 ?auto_118712 ) ) ( CALIBRATION_TARGET ?auto_118720 ?auto_118718 ) ( POWER_AVAIL ?auto_118719 ) ( POINTING ?auto_118719 ?auto_118713 ) ( not ( = ?auto_118718 ?auto_118713 ) ) ( not ( = ?auto_118716 ?auto_118713 ) ) ( HAVE_IMAGE ?auto_118713 ?auto_118714 ) ( not ( = ?auto_118714 ?auto_118712 ) ) ( not ( = ?auto_118714 ?auto_118717 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118716 ?auto_118717 ?auto_118715 ?auto_118712 )
      ( GET-2IMAGE-VERIFY ?auto_118713 ?auto_118714 ?auto_118715 ?auto_118712 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_118722 - DIRECTION
      ?auto_118723 - MODE
      ?auto_118724 - DIRECTION
      ?auto_118721 - MODE
    )
    :vars
    (
      ?auto_118727 - INSTRUMENT
      ?auto_118726 - SATELLITE
      ?auto_118725 - DIRECTION
      ?auto_118728 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_118724 ?auto_118722 ) ) ( ON_BOARD ?auto_118727 ?auto_118726 ) ( SUPPORTS ?auto_118727 ?auto_118723 ) ( not ( = ?auto_118722 ?auto_118725 ) ) ( HAVE_IMAGE ?auto_118724 ?auto_118721 ) ( not ( = ?auto_118724 ?auto_118725 ) ) ( not ( = ?auto_118721 ?auto_118723 ) ) ( CALIBRATION_TARGET ?auto_118727 ?auto_118725 ) ( POWER_AVAIL ?auto_118726 ) ( POINTING ?auto_118726 ?auto_118728 ) ( not ( = ?auto_118725 ?auto_118728 ) ) ( not ( = ?auto_118722 ?auto_118728 ) ) ( not ( = ?auto_118724 ?auto_118728 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118724 ?auto_118721 ?auto_118722 ?auto_118723 )
      ( GET-2IMAGE-VERIFY ?auto_118722 ?auto_118723 ?auto_118724 ?auto_118721 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_118730 - DIRECTION
      ?auto_118731 - MODE
      ?auto_118732 - DIRECTION
      ?auto_118729 - MODE
    )
    :vars
    (
      ?auto_118733 - DIRECTION
      ?auto_118737 - INSTRUMENT
      ?auto_118736 - SATELLITE
      ?auto_118735 - DIRECTION
      ?auto_118734 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_118732 ?auto_118730 ) ) ( not ( = ?auto_118730 ?auto_118733 ) ) ( ON_BOARD ?auto_118737 ?auto_118736 ) ( SUPPORTS ?auto_118737 ?auto_118731 ) ( not ( = ?auto_118730 ?auto_118735 ) ) ( HAVE_IMAGE ?auto_118733 ?auto_118734 ) ( not ( = ?auto_118733 ?auto_118735 ) ) ( not ( = ?auto_118734 ?auto_118731 ) ) ( CALIBRATION_TARGET ?auto_118737 ?auto_118735 ) ( POWER_AVAIL ?auto_118736 ) ( POINTING ?auto_118736 ?auto_118732 ) ( not ( = ?auto_118735 ?auto_118732 ) ) ( not ( = ?auto_118733 ?auto_118732 ) ) ( HAVE_IMAGE ?auto_118732 ?auto_118729 ) ( not ( = ?auto_118731 ?auto_118729 ) ) ( not ( = ?auto_118729 ?auto_118734 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118733 ?auto_118734 ?auto_118730 ?auto_118731 )
      ( GET-2IMAGE-VERIFY ?auto_118730 ?auto_118731 ?auto_118732 ?auto_118729 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118759 - DIRECTION
      ?auto_118760 - MODE
      ?auto_118761 - DIRECTION
      ?auto_118758 - MODE
      ?auto_118763 - DIRECTION
      ?auto_118762 - MODE
    )
    :vars
    (
      ?auto_118766 - INSTRUMENT
      ?auto_118765 - SATELLITE
      ?auto_118764 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_118761 ?auto_118759 ) ) ( not ( = ?auto_118763 ?auto_118759 ) ) ( not ( = ?auto_118763 ?auto_118761 ) ) ( ON_BOARD ?auto_118766 ?auto_118765 ) ( SUPPORTS ?auto_118766 ?auto_118762 ) ( not ( = ?auto_118763 ?auto_118764 ) ) ( HAVE_IMAGE ?auto_118759 ?auto_118760 ) ( not ( = ?auto_118759 ?auto_118764 ) ) ( not ( = ?auto_118760 ?auto_118762 ) ) ( CALIBRATION_TARGET ?auto_118766 ?auto_118764 ) ( POWER_AVAIL ?auto_118765 ) ( POINTING ?auto_118765 ?auto_118761 ) ( not ( = ?auto_118764 ?auto_118761 ) ) ( HAVE_IMAGE ?auto_118761 ?auto_118758 ) ( not ( = ?auto_118760 ?auto_118758 ) ) ( not ( = ?auto_118758 ?auto_118762 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118759 ?auto_118760 ?auto_118763 ?auto_118762 )
      ( GET-3IMAGE-VERIFY ?auto_118759 ?auto_118760 ?auto_118761 ?auto_118758 ?auto_118763 ?auto_118762 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118778 - DIRECTION
      ?auto_118779 - MODE
      ?auto_118780 - DIRECTION
      ?auto_118777 - MODE
      ?auto_118782 - DIRECTION
      ?auto_118781 - MODE
    )
    :vars
    (
      ?auto_118785 - INSTRUMENT
      ?auto_118784 - SATELLITE
      ?auto_118783 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_118780 ?auto_118778 ) ) ( not ( = ?auto_118782 ?auto_118778 ) ) ( not ( = ?auto_118782 ?auto_118780 ) ) ( ON_BOARD ?auto_118785 ?auto_118784 ) ( SUPPORTS ?auto_118785 ?auto_118777 ) ( not ( = ?auto_118780 ?auto_118783 ) ) ( HAVE_IMAGE ?auto_118778 ?auto_118779 ) ( not ( = ?auto_118778 ?auto_118783 ) ) ( not ( = ?auto_118779 ?auto_118777 ) ) ( CALIBRATION_TARGET ?auto_118785 ?auto_118783 ) ( POWER_AVAIL ?auto_118784 ) ( POINTING ?auto_118784 ?auto_118782 ) ( not ( = ?auto_118783 ?auto_118782 ) ) ( HAVE_IMAGE ?auto_118782 ?auto_118781 ) ( not ( = ?auto_118779 ?auto_118781 ) ) ( not ( = ?auto_118777 ?auto_118781 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118778 ?auto_118779 ?auto_118780 ?auto_118777 )
      ( GET-3IMAGE-VERIFY ?auto_118778 ?auto_118779 ?auto_118780 ?auto_118777 ?auto_118782 ?auto_118781 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118797 - DIRECTION
      ?auto_118798 - MODE
      ?auto_118799 - DIRECTION
      ?auto_118796 - MODE
      ?auto_118801 - DIRECTION
      ?auto_118800 - MODE
    )
    :vars
    (
      ?auto_118804 - INSTRUMENT
      ?auto_118803 - SATELLITE
      ?auto_118802 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_118799 ?auto_118797 ) ) ( not ( = ?auto_118801 ?auto_118797 ) ) ( not ( = ?auto_118801 ?auto_118799 ) ) ( ON_BOARD ?auto_118804 ?auto_118803 ) ( SUPPORTS ?auto_118804 ?auto_118800 ) ( not ( = ?auto_118801 ?auto_118802 ) ) ( HAVE_IMAGE ?auto_118799 ?auto_118796 ) ( not ( = ?auto_118799 ?auto_118802 ) ) ( not ( = ?auto_118796 ?auto_118800 ) ) ( CALIBRATION_TARGET ?auto_118804 ?auto_118802 ) ( POWER_AVAIL ?auto_118803 ) ( POINTING ?auto_118803 ?auto_118797 ) ( not ( = ?auto_118802 ?auto_118797 ) ) ( HAVE_IMAGE ?auto_118797 ?auto_118798 ) ( not ( = ?auto_118798 ?auto_118796 ) ) ( not ( = ?auto_118798 ?auto_118800 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118799 ?auto_118796 ?auto_118801 ?auto_118800 )
      ( GET-3IMAGE-VERIFY ?auto_118797 ?auto_118798 ?auto_118799 ?auto_118796 ?auto_118801 ?auto_118800 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118817 - DIRECTION
      ?auto_118818 - MODE
      ?auto_118819 - DIRECTION
      ?auto_118816 - MODE
      ?auto_118821 - DIRECTION
      ?auto_118820 - MODE
    )
    :vars
    (
      ?auto_118824 - INSTRUMENT
      ?auto_118823 - SATELLITE
      ?auto_118822 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_118819 ?auto_118817 ) ) ( not ( = ?auto_118821 ?auto_118817 ) ) ( not ( = ?auto_118821 ?auto_118819 ) ) ( ON_BOARD ?auto_118824 ?auto_118823 ) ( SUPPORTS ?auto_118824 ?auto_118816 ) ( not ( = ?auto_118819 ?auto_118822 ) ) ( HAVE_IMAGE ?auto_118821 ?auto_118820 ) ( not ( = ?auto_118821 ?auto_118822 ) ) ( not ( = ?auto_118820 ?auto_118816 ) ) ( CALIBRATION_TARGET ?auto_118824 ?auto_118822 ) ( POWER_AVAIL ?auto_118823 ) ( POINTING ?auto_118823 ?auto_118817 ) ( not ( = ?auto_118822 ?auto_118817 ) ) ( HAVE_IMAGE ?auto_118817 ?auto_118818 ) ( not ( = ?auto_118818 ?auto_118816 ) ) ( not ( = ?auto_118818 ?auto_118820 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118821 ?auto_118820 ?auto_118819 ?auto_118816 )
      ( GET-3IMAGE-VERIFY ?auto_118817 ?auto_118818 ?auto_118819 ?auto_118816 ?auto_118821 ?auto_118820 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118858 - DIRECTION
      ?auto_118859 - MODE
      ?auto_118860 - DIRECTION
      ?auto_118857 - MODE
      ?auto_118862 - DIRECTION
      ?auto_118861 - MODE
    )
    :vars
    (
      ?auto_118865 - INSTRUMENT
      ?auto_118864 - SATELLITE
      ?auto_118863 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_118860 ?auto_118858 ) ) ( not ( = ?auto_118862 ?auto_118858 ) ) ( not ( = ?auto_118862 ?auto_118860 ) ) ( ON_BOARD ?auto_118865 ?auto_118864 ) ( SUPPORTS ?auto_118865 ?auto_118859 ) ( not ( = ?auto_118858 ?auto_118863 ) ) ( HAVE_IMAGE ?auto_118860 ?auto_118857 ) ( not ( = ?auto_118860 ?auto_118863 ) ) ( not ( = ?auto_118857 ?auto_118859 ) ) ( CALIBRATION_TARGET ?auto_118865 ?auto_118863 ) ( POWER_AVAIL ?auto_118864 ) ( POINTING ?auto_118864 ?auto_118862 ) ( not ( = ?auto_118863 ?auto_118862 ) ) ( HAVE_IMAGE ?auto_118862 ?auto_118861 ) ( not ( = ?auto_118859 ?auto_118861 ) ) ( not ( = ?auto_118857 ?auto_118861 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118860 ?auto_118857 ?auto_118858 ?auto_118859 )
      ( GET-3IMAGE-VERIFY ?auto_118858 ?auto_118859 ?auto_118860 ?auto_118857 ?auto_118862 ?auto_118861 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118877 - DIRECTION
      ?auto_118878 - MODE
      ?auto_118879 - DIRECTION
      ?auto_118876 - MODE
      ?auto_118881 - DIRECTION
      ?auto_118880 - MODE
    )
    :vars
    (
      ?auto_118884 - INSTRUMENT
      ?auto_118883 - SATELLITE
      ?auto_118882 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_118879 ?auto_118877 ) ) ( not ( = ?auto_118881 ?auto_118877 ) ) ( not ( = ?auto_118881 ?auto_118879 ) ) ( ON_BOARD ?auto_118884 ?auto_118883 ) ( SUPPORTS ?auto_118884 ?auto_118878 ) ( not ( = ?auto_118877 ?auto_118882 ) ) ( HAVE_IMAGE ?auto_118881 ?auto_118880 ) ( not ( = ?auto_118881 ?auto_118882 ) ) ( not ( = ?auto_118880 ?auto_118878 ) ) ( CALIBRATION_TARGET ?auto_118884 ?auto_118882 ) ( POWER_AVAIL ?auto_118883 ) ( POINTING ?auto_118883 ?auto_118879 ) ( not ( = ?auto_118882 ?auto_118879 ) ) ( HAVE_IMAGE ?auto_118879 ?auto_118876 ) ( not ( = ?auto_118878 ?auto_118876 ) ) ( not ( = ?auto_118876 ?auto_118880 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118881 ?auto_118880 ?auto_118877 ?auto_118878 )
      ( GET-3IMAGE-VERIFY ?auto_118877 ?auto_118878 ?auto_118879 ?auto_118876 ?auto_118881 ?auto_118880 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_119700 - DIRECTION
      ?auto_119701 - MODE
    )
    :vars
    (
      ?auto_119702 - DIRECTION
      ?auto_119706 - INSTRUMENT
      ?auto_119705 - SATELLITE
      ?auto_119704 - DIRECTION
      ?auto_119703 - MODE
      ?auto_119707 - DIRECTION
      ?auto_119708 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_119700 ?auto_119702 ) ) ( ON_BOARD ?auto_119706 ?auto_119705 ) ( SUPPORTS ?auto_119706 ?auto_119701 ) ( not ( = ?auto_119700 ?auto_119704 ) ) ( HAVE_IMAGE ?auto_119702 ?auto_119703 ) ( not ( = ?auto_119702 ?auto_119704 ) ) ( not ( = ?auto_119703 ?auto_119701 ) ) ( CALIBRATION_TARGET ?auto_119706 ?auto_119704 ) ( POINTING ?auto_119705 ?auto_119707 ) ( not ( = ?auto_119704 ?auto_119707 ) ) ( not ( = ?auto_119700 ?auto_119707 ) ) ( not ( = ?auto_119702 ?auto_119707 ) ) ( ON_BOARD ?auto_119708 ?auto_119705 ) ( POWER_ON ?auto_119708 ) ( not ( = ?auto_119706 ?auto_119708 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_119708 ?auto_119705 )
      ( GET-2IMAGE ?auto_119702 ?auto_119703 ?auto_119700 ?auto_119701 )
      ( GET-1IMAGE-VERIFY ?auto_119700 ?auto_119701 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_119710 - DIRECTION
      ?auto_119711 - MODE
      ?auto_119712 - DIRECTION
      ?auto_119709 - MODE
    )
    :vars
    (
      ?auto_119716 - INSTRUMENT
      ?auto_119717 - SATELLITE
      ?auto_119713 - DIRECTION
      ?auto_119714 - DIRECTION
      ?auto_119715 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_119712 ?auto_119710 ) ) ( ON_BOARD ?auto_119716 ?auto_119717 ) ( SUPPORTS ?auto_119716 ?auto_119709 ) ( not ( = ?auto_119712 ?auto_119713 ) ) ( HAVE_IMAGE ?auto_119710 ?auto_119711 ) ( not ( = ?auto_119710 ?auto_119713 ) ) ( not ( = ?auto_119711 ?auto_119709 ) ) ( CALIBRATION_TARGET ?auto_119716 ?auto_119713 ) ( POINTING ?auto_119717 ?auto_119714 ) ( not ( = ?auto_119713 ?auto_119714 ) ) ( not ( = ?auto_119712 ?auto_119714 ) ) ( not ( = ?auto_119710 ?auto_119714 ) ) ( ON_BOARD ?auto_119715 ?auto_119717 ) ( POWER_ON ?auto_119715 ) ( not ( = ?auto_119716 ?auto_119715 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_119712 ?auto_119709 )
      ( GET-2IMAGE-VERIFY ?auto_119710 ?auto_119711 ?auto_119712 ?auto_119709 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_119719 - DIRECTION
      ?auto_119720 - MODE
      ?auto_119721 - DIRECTION
      ?auto_119718 - MODE
    )
    :vars
    (
      ?auto_119725 - DIRECTION
      ?auto_119723 - INSTRUMENT
      ?auto_119727 - SATELLITE
      ?auto_119722 - DIRECTION
      ?auto_119726 - MODE
      ?auto_119724 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_119721 ?auto_119719 ) ) ( not ( = ?auto_119721 ?auto_119725 ) ) ( ON_BOARD ?auto_119723 ?auto_119727 ) ( SUPPORTS ?auto_119723 ?auto_119718 ) ( not ( = ?auto_119721 ?auto_119722 ) ) ( HAVE_IMAGE ?auto_119725 ?auto_119726 ) ( not ( = ?auto_119725 ?auto_119722 ) ) ( not ( = ?auto_119726 ?auto_119718 ) ) ( CALIBRATION_TARGET ?auto_119723 ?auto_119722 ) ( POINTING ?auto_119727 ?auto_119719 ) ( not ( = ?auto_119722 ?auto_119719 ) ) ( not ( = ?auto_119725 ?auto_119719 ) ) ( ON_BOARD ?auto_119724 ?auto_119727 ) ( POWER_ON ?auto_119724 ) ( not ( = ?auto_119723 ?auto_119724 ) ) ( HAVE_IMAGE ?auto_119719 ?auto_119720 ) ( not ( = ?auto_119720 ?auto_119718 ) ) ( not ( = ?auto_119720 ?auto_119726 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119725 ?auto_119726 ?auto_119721 ?auto_119718 )
      ( GET-2IMAGE-VERIFY ?auto_119719 ?auto_119720 ?auto_119721 ?auto_119718 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_119729 - DIRECTION
      ?auto_119730 - MODE
      ?auto_119731 - DIRECTION
      ?auto_119728 - MODE
    )
    :vars
    (
      ?auto_119733 - INSTRUMENT
      ?auto_119736 - SATELLITE
      ?auto_119732 - DIRECTION
      ?auto_119735 - DIRECTION
      ?auto_119734 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_119731 ?auto_119729 ) ) ( ON_BOARD ?auto_119733 ?auto_119736 ) ( SUPPORTS ?auto_119733 ?auto_119730 ) ( not ( = ?auto_119729 ?auto_119732 ) ) ( HAVE_IMAGE ?auto_119731 ?auto_119728 ) ( not ( = ?auto_119731 ?auto_119732 ) ) ( not ( = ?auto_119728 ?auto_119730 ) ) ( CALIBRATION_TARGET ?auto_119733 ?auto_119732 ) ( POINTING ?auto_119736 ?auto_119735 ) ( not ( = ?auto_119732 ?auto_119735 ) ) ( not ( = ?auto_119729 ?auto_119735 ) ) ( not ( = ?auto_119731 ?auto_119735 ) ) ( ON_BOARD ?auto_119734 ?auto_119736 ) ( POWER_ON ?auto_119734 ) ( not ( = ?auto_119733 ?auto_119734 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119731 ?auto_119728 ?auto_119729 ?auto_119730 )
      ( GET-2IMAGE-VERIFY ?auto_119729 ?auto_119730 ?auto_119731 ?auto_119728 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_119738 - DIRECTION
      ?auto_119739 - MODE
      ?auto_119740 - DIRECTION
      ?auto_119737 - MODE
    )
    :vars
    (
      ?auto_119744 - DIRECTION
      ?auto_119742 - INSTRUMENT
      ?auto_119746 - SATELLITE
      ?auto_119741 - DIRECTION
      ?auto_119745 - MODE
      ?auto_119743 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_119740 ?auto_119738 ) ) ( not ( = ?auto_119738 ?auto_119744 ) ) ( ON_BOARD ?auto_119742 ?auto_119746 ) ( SUPPORTS ?auto_119742 ?auto_119739 ) ( not ( = ?auto_119738 ?auto_119741 ) ) ( HAVE_IMAGE ?auto_119744 ?auto_119745 ) ( not ( = ?auto_119744 ?auto_119741 ) ) ( not ( = ?auto_119745 ?auto_119739 ) ) ( CALIBRATION_TARGET ?auto_119742 ?auto_119741 ) ( POINTING ?auto_119746 ?auto_119740 ) ( not ( = ?auto_119741 ?auto_119740 ) ) ( not ( = ?auto_119744 ?auto_119740 ) ) ( ON_BOARD ?auto_119743 ?auto_119746 ) ( POWER_ON ?auto_119743 ) ( not ( = ?auto_119742 ?auto_119743 ) ) ( HAVE_IMAGE ?auto_119740 ?auto_119737 ) ( not ( = ?auto_119739 ?auto_119737 ) ) ( not ( = ?auto_119737 ?auto_119745 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119744 ?auto_119745 ?auto_119738 ?auto_119739 )
      ( GET-2IMAGE-VERIFY ?auto_119738 ?auto_119739 ?auto_119740 ?auto_119737 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119770 - DIRECTION
      ?auto_119771 - MODE
      ?auto_119772 - DIRECTION
      ?auto_119769 - MODE
      ?auto_119774 - DIRECTION
      ?auto_119773 - MODE
    )
    :vars
    (
      ?auto_119776 - INSTRUMENT
      ?auto_119778 - SATELLITE
      ?auto_119775 - DIRECTION
      ?auto_119777 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_119772 ?auto_119770 ) ) ( not ( = ?auto_119774 ?auto_119770 ) ) ( not ( = ?auto_119774 ?auto_119772 ) ) ( ON_BOARD ?auto_119776 ?auto_119778 ) ( SUPPORTS ?auto_119776 ?auto_119773 ) ( not ( = ?auto_119774 ?auto_119775 ) ) ( HAVE_IMAGE ?auto_119770 ?auto_119771 ) ( not ( = ?auto_119770 ?auto_119775 ) ) ( not ( = ?auto_119771 ?auto_119773 ) ) ( CALIBRATION_TARGET ?auto_119776 ?auto_119775 ) ( POINTING ?auto_119778 ?auto_119772 ) ( not ( = ?auto_119775 ?auto_119772 ) ) ( ON_BOARD ?auto_119777 ?auto_119778 ) ( POWER_ON ?auto_119777 ) ( not ( = ?auto_119776 ?auto_119777 ) ) ( HAVE_IMAGE ?auto_119772 ?auto_119769 ) ( not ( = ?auto_119771 ?auto_119769 ) ) ( not ( = ?auto_119769 ?auto_119773 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119770 ?auto_119771 ?auto_119774 ?auto_119773 )
      ( GET-3IMAGE-VERIFY ?auto_119770 ?auto_119771 ?auto_119772 ?auto_119769 ?auto_119774 ?auto_119773 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119791 - DIRECTION
      ?auto_119792 - MODE
      ?auto_119793 - DIRECTION
      ?auto_119790 - MODE
      ?auto_119795 - DIRECTION
      ?auto_119794 - MODE
    )
    :vars
    (
      ?auto_119797 - INSTRUMENT
      ?auto_119799 - SATELLITE
      ?auto_119796 - DIRECTION
      ?auto_119798 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_119793 ?auto_119791 ) ) ( not ( = ?auto_119795 ?auto_119791 ) ) ( not ( = ?auto_119795 ?auto_119793 ) ) ( ON_BOARD ?auto_119797 ?auto_119799 ) ( SUPPORTS ?auto_119797 ?auto_119790 ) ( not ( = ?auto_119793 ?auto_119796 ) ) ( HAVE_IMAGE ?auto_119791 ?auto_119792 ) ( not ( = ?auto_119791 ?auto_119796 ) ) ( not ( = ?auto_119792 ?auto_119790 ) ) ( CALIBRATION_TARGET ?auto_119797 ?auto_119796 ) ( POINTING ?auto_119799 ?auto_119795 ) ( not ( = ?auto_119796 ?auto_119795 ) ) ( ON_BOARD ?auto_119798 ?auto_119799 ) ( POWER_ON ?auto_119798 ) ( not ( = ?auto_119797 ?auto_119798 ) ) ( HAVE_IMAGE ?auto_119795 ?auto_119794 ) ( not ( = ?auto_119792 ?auto_119794 ) ) ( not ( = ?auto_119790 ?auto_119794 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119791 ?auto_119792 ?auto_119793 ?auto_119790 )
      ( GET-3IMAGE-VERIFY ?auto_119791 ?auto_119792 ?auto_119793 ?auto_119790 ?auto_119795 ?auto_119794 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119812 - DIRECTION
      ?auto_119813 - MODE
      ?auto_119814 - DIRECTION
      ?auto_119811 - MODE
      ?auto_119816 - DIRECTION
      ?auto_119815 - MODE
    )
    :vars
    (
      ?auto_119818 - INSTRUMENT
      ?auto_119820 - SATELLITE
      ?auto_119817 - DIRECTION
      ?auto_119819 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_119814 ?auto_119812 ) ) ( not ( = ?auto_119816 ?auto_119812 ) ) ( not ( = ?auto_119816 ?auto_119814 ) ) ( ON_BOARD ?auto_119818 ?auto_119820 ) ( SUPPORTS ?auto_119818 ?auto_119815 ) ( not ( = ?auto_119816 ?auto_119817 ) ) ( HAVE_IMAGE ?auto_119814 ?auto_119811 ) ( not ( = ?auto_119814 ?auto_119817 ) ) ( not ( = ?auto_119811 ?auto_119815 ) ) ( CALIBRATION_TARGET ?auto_119818 ?auto_119817 ) ( POINTING ?auto_119820 ?auto_119812 ) ( not ( = ?auto_119817 ?auto_119812 ) ) ( ON_BOARD ?auto_119819 ?auto_119820 ) ( POWER_ON ?auto_119819 ) ( not ( = ?auto_119818 ?auto_119819 ) ) ( HAVE_IMAGE ?auto_119812 ?auto_119813 ) ( not ( = ?auto_119813 ?auto_119811 ) ) ( not ( = ?auto_119813 ?auto_119815 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119814 ?auto_119811 ?auto_119816 ?auto_119815 )
      ( GET-3IMAGE-VERIFY ?auto_119812 ?auto_119813 ?auto_119814 ?auto_119811 ?auto_119816 ?auto_119815 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119834 - DIRECTION
      ?auto_119835 - MODE
      ?auto_119836 - DIRECTION
      ?auto_119833 - MODE
      ?auto_119838 - DIRECTION
      ?auto_119837 - MODE
    )
    :vars
    (
      ?auto_119840 - INSTRUMENT
      ?auto_119842 - SATELLITE
      ?auto_119839 - DIRECTION
      ?auto_119841 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_119836 ?auto_119834 ) ) ( not ( = ?auto_119838 ?auto_119834 ) ) ( not ( = ?auto_119838 ?auto_119836 ) ) ( ON_BOARD ?auto_119840 ?auto_119842 ) ( SUPPORTS ?auto_119840 ?auto_119833 ) ( not ( = ?auto_119836 ?auto_119839 ) ) ( HAVE_IMAGE ?auto_119838 ?auto_119837 ) ( not ( = ?auto_119838 ?auto_119839 ) ) ( not ( = ?auto_119837 ?auto_119833 ) ) ( CALIBRATION_TARGET ?auto_119840 ?auto_119839 ) ( POINTING ?auto_119842 ?auto_119834 ) ( not ( = ?auto_119839 ?auto_119834 ) ) ( ON_BOARD ?auto_119841 ?auto_119842 ) ( POWER_ON ?auto_119841 ) ( not ( = ?auto_119840 ?auto_119841 ) ) ( HAVE_IMAGE ?auto_119834 ?auto_119835 ) ( not ( = ?auto_119835 ?auto_119833 ) ) ( not ( = ?auto_119835 ?auto_119837 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119838 ?auto_119837 ?auto_119836 ?auto_119833 )
      ( GET-3IMAGE-VERIFY ?auto_119834 ?auto_119835 ?auto_119836 ?auto_119833 ?auto_119838 ?auto_119837 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119879 - DIRECTION
      ?auto_119880 - MODE
      ?auto_119881 - DIRECTION
      ?auto_119878 - MODE
      ?auto_119883 - DIRECTION
      ?auto_119882 - MODE
    )
    :vars
    (
      ?auto_119885 - INSTRUMENT
      ?auto_119887 - SATELLITE
      ?auto_119884 - DIRECTION
      ?auto_119886 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_119881 ?auto_119879 ) ) ( not ( = ?auto_119883 ?auto_119879 ) ) ( not ( = ?auto_119883 ?auto_119881 ) ) ( ON_BOARD ?auto_119885 ?auto_119887 ) ( SUPPORTS ?auto_119885 ?auto_119880 ) ( not ( = ?auto_119879 ?auto_119884 ) ) ( HAVE_IMAGE ?auto_119881 ?auto_119878 ) ( not ( = ?auto_119881 ?auto_119884 ) ) ( not ( = ?auto_119878 ?auto_119880 ) ) ( CALIBRATION_TARGET ?auto_119885 ?auto_119884 ) ( POINTING ?auto_119887 ?auto_119883 ) ( not ( = ?auto_119884 ?auto_119883 ) ) ( ON_BOARD ?auto_119886 ?auto_119887 ) ( POWER_ON ?auto_119886 ) ( not ( = ?auto_119885 ?auto_119886 ) ) ( HAVE_IMAGE ?auto_119883 ?auto_119882 ) ( not ( = ?auto_119880 ?auto_119882 ) ) ( not ( = ?auto_119878 ?auto_119882 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119881 ?auto_119878 ?auto_119879 ?auto_119880 )
      ( GET-3IMAGE-VERIFY ?auto_119879 ?auto_119880 ?auto_119881 ?auto_119878 ?auto_119883 ?auto_119882 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119900 - DIRECTION
      ?auto_119901 - MODE
      ?auto_119902 - DIRECTION
      ?auto_119899 - MODE
      ?auto_119904 - DIRECTION
      ?auto_119903 - MODE
    )
    :vars
    (
      ?auto_119906 - INSTRUMENT
      ?auto_119908 - SATELLITE
      ?auto_119905 - DIRECTION
      ?auto_119907 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_119902 ?auto_119900 ) ) ( not ( = ?auto_119904 ?auto_119900 ) ) ( not ( = ?auto_119904 ?auto_119902 ) ) ( ON_BOARD ?auto_119906 ?auto_119908 ) ( SUPPORTS ?auto_119906 ?auto_119901 ) ( not ( = ?auto_119900 ?auto_119905 ) ) ( HAVE_IMAGE ?auto_119904 ?auto_119903 ) ( not ( = ?auto_119904 ?auto_119905 ) ) ( not ( = ?auto_119903 ?auto_119901 ) ) ( CALIBRATION_TARGET ?auto_119906 ?auto_119905 ) ( POINTING ?auto_119908 ?auto_119902 ) ( not ( = ?auto_119905 ?auto_119902 ) ) ( ON_BOARD ?auto_119907 ?auto_119908 ) ( POWER_ON ?auto_119907 ) ( not ( = ?auto_119906 ?auto_119907 ) ) ( HAVE_IMAGE ?auto_119902 ?auto_119899 ) ( not ( = ?auto_119901 ?auto_119899 ) ) ( not ( = ?auto_119899 ?auto_119903 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119904 ?auto_119903 ?auto_119900 ?auto_119901 )
      ( GET-3IMAGE-VERIFY ?auto_119900 ?auto_119901 ?auto_119902 ?auto_119899 ?auto_119904 ?auto_119903 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_121871 - DIRECTION
      ?auto_121872 - MODE
    )
    :vars
    (
      ?auto_121873 - DIRECTION
      ?auto_121875 - INSTRUMENT
      ?auto_121879 - SATELLITE
      ?auto_121876 - DIRECTION
      ?auto_121878 - MODE
      ?auto_121877 - DIRECTION
      ?auto_121874 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_121871 ?auto_121873 ) ) ( ON_BOARD ?auto_121875 ?auto_121879 ) ( SUPPORTS ?auto_121875 ?auto_121872 ) ( not ( = ?auto_121871 ?auto_121876 ) ) ( HAVE_IMAGE ?auto_121873 ?auto_121878 ) ( not ( = ?auto_121873 ?auto_121876 ) ) ( not ( = ?auto_121878 ?auto_121872 ) ) ( CALIBRATION_TARGET ?auto_121875 ?auto_121876 ) ( not ( = ?auto_121876 ?auto_121877 ) ) ( not ( = ?auto_121871 ?auto_121877 ) ) ( not ( = ?auto_121873 ?auto_121877 ) ) ( ON_BOARD ?auto_121874 ?auto_121879 ) ( POWER_ON ?auto_121874 ) ( not ( = ?auto_121875 ?auto_121874 ) ) ( POINTING ?auto_121879 ?auto_121876 ) )
    :subtasks
    ( ( !TURN_TO ?auto_121879 ?auto_121877 ?auto_121876 )
      ( GET-2IMAGE ?auto_121873 ?auto_121878 ?auto_121871 ?auto_121872 )
      ( GET-1IMAGE-VERIFY ?auto_121871 ?auto_121872 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_121881 - DIRECTION
      ?auto_121882 - MODE
      ?auto_121883 - DIRECTION
      ?auto_121880 - MODE
    )
    :vars
    (
      ?auto_121888 - INSTRUMENT
      ?auto_121884 - SATELLITE
      ?auto_121885 - DIRECTION
      ?auto_121886 - DIRECTION
      ?auto_121887 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_121883 ?auto_121881 ) ) ( ON_BOARD ?auto_121888 ?auto_121884 ) ( SUPPORTS ?auto_121888 ?auto_121880 ) ( not ( = ?auto_121883 ?auto_121885 ) ) ( HAVE_IMAGE ?auto_121881 ?auto_121882 ) ( not ( = ?auto_121881 ?auto_121885 ) ) ( not ( = ?auto_121882 ?auto_121880 ) ) ( CALIBRATION_TARGET ?auto_121888 ?auto_121885 ) ( not ( = ?auto_121885 ?auto_121886 ) ) ( not ( = ?auto_121883 ?auto_121886 ) ) ( not ( = ?auto_121881 ?auto_121886 ) ) ( ON_BOARD ?auto_121887 ?auto_121884 ) ( POWER_ON ?auto_121887 ) ( not ( = ?auto_121888 ?auto_121887 ) ) ( POINTING ?auto_121884 ?auto_121885 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_121883 ?auto_121880 )
      ( GET-2IMAGE-VERIFY ?auto_121881 ?auto_121882 ?auto_121883 ?auto_121880 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_121900 - DIRECTION
      ?auto_121901 - MODE
      ?auto_121902 - DIRECTION
      ?auto_121899 - MODE
    )
    :vars
    (
      ?auto_121904 - INSTRUMENT
      ?auto_121906 - SATELLITE
      ?auto_121907 - DIRECTION
      ?auto_121905 - DIRECTION
      ?auto_121903 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_121902 ?auto_121900 ) ) ( ON_BOARD ?auto_121904 ?auto_121906 ) ( SUPPORTS ?auto_121904 ?auto_121901 ) ( not ( = ?auto_121900 ?auto_121907 ) ) ( HAVE_IMAGE ?auto_121902 ?auto_121899 ) ( not ( = ?auto_121902 ?auto_121907 ) ) ( not ( = ?auto_121899 ?auto_121901 ) ) ( CALIBRATION_TARGET ?auto_121904 ?auto_121907 ) ( not ( = ?auto_121907 ?auto_121905 ) ) ( not ( = ?auto_121900 ?auto_121905 ) ) ( not ( = ?auto_121902 ?auto_121905 ) ) ( ON_BOARD ?auto_121903 ?auto_121906 ) ( POWER_ON ?auto_121903 ) ( not ( = ?auto_121904 ?auto_121903 ) ) ( POINTING ?auto_121906 ?auto_121907 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_121902 ?auto_121899 ?auto_121900 ?auto_121901 )
      ( GET-2IMAGE-VERIFY ?auto_121900 ?auto_121901 ?auto_121902 ?auto_121899 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_134203 - DIRECTION
      ?auto_134204 - MODE
      ?auto_134205 - DIRECTION
      ?auto_134202 - MODE
      ?auto_134207 - DIRECTION
      ?auto_134206 - MODE
      ?auto_134208 - DIRECTION
      ?auto_134209 - MODE
    )
    :vars
    (
      ?auto_134211 - INSTRUMENT
      ?auto_134210 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_134205 ?auto_134203 ) ) ( not ( = ?auto_134207 ?auto_134203 ) ) ( not ( = ?auto_134207 ?auto_134205 ) ) ( not ( = ?auto_134208 ?auto_134203 ) ) ( not ( = ?auto_134208 ?auto_134205 ) ) ( not ( = ?auto_134208 ?auto_134207 ) ) ( CALIBRATED ?auto_134211 ) ( ON_BOARD ?auto_134211 ?auto_134210 ) ( SUPPORTS ?auto_134211 ?auto_134209 ) ( POWER_ON ?auto_134211 ) ( POINTING ?auto_134210 ?auto_134208 ) ( HAVE_IMAGE ?auto_134203 ?auto_134204 ) ( HAVE_IMAGE ?auto_134205 ?auto_134202 ) ( HAVE_IMAGE ?auto_134207 ?auto_134206 ) ( not ( = ?auto_134204 ?auto_134202 ) ) ( not ( = ?auto_134204 ?auto_134206 ) ) ( not ( = ?auto_134204 ?auto_134209 ) ) ( not ( = ?auto_134202 ?auto_134206 ) ) ( not ( = ?auto_134202 ?auto_134209 ) ) ( not ( = ?auto_134206 ?auto_134209 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_134208 ?auto_134209 )
      ( GET-4IMAGE-VERIFY ?auto_134203 ?auto_134204 ?auto_134205 ?auto_134202 ?auto_134207 ?auto_134206 ?auto_134208 ?auto_134209 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_134233 - DIRECTION
      ?auto_134234 - MODE
      ?auto_134235 - DIRECTION
      ?auto_134232 - MODE
      ?auto_134237 - DIRECTION
      ?auto_134236 - MODE
      ?auto_134238 - DIRECTION
      ?auto_134239 - MODE
    )
    :vars
    (
      ?auto_134241 - INSTRUMENT
      ?auto_134240 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_134235 ?auto_134233 ) ) ( not ( = ?auto_134237 ?auto_134233 ) ) ( not ( = ?auto_134237 ?auto_134235 ) ) ( not ( = ?auto_134238 ?auto_134233 ) ) ( not ( = ?auto_134238 ?auto_134235 ) ) ( not ( = ?auto_134238 ?auto_134237 ) ) ( CALIBRATED ?auto_134241 ) ( ON_BOARD ?auto_134241 ?auto_134240 ) ( SUPPORTS ?auto_134241 ?auto_134236 ) ( POWER_ON ?auto_134241 ) ( POINTING ?auto_134240 ?auto_134237 ) ( HAVE_IMAGE ?auto_134233 ?auto_134234 ) ( HAVE_IMAGE ?auto_134235 ?auto_134232 ) ( HAVE_IMAGE ?auto_134238 ?auto_134239 ) ( not ( = ?auto_134234 ?auto_134232 ) ) ( not ( = ?auto_134234 ?auto_134236 ) ) ( not ( = ?auto_134234 ?auto_134239 ) ) ( not ( = ?auto_134232 ?auto_134236 ) ) ( not ( = ?auto_134232 ?auto_134239 ) ) ( not ( = ?auto_134236 ?auto_134239 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_134237 ?auto_134236 )
      ( GET-4IMAGE-VERIFY ?auto_134233 ?auto_134234 ?auto_134235 ?auto_134232 ?auto_134237 ?auto_134236 ?auto_134238 ?auto_134239 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_134379 - DIRECTION
      ?auto_134380 - MODE
      ?auto_134381 - DIRECTION
      ?auto_134378 - MODE
      ?auto_134383 - DIRECTION
      ?auto_134382 - MODE
      ?auto_134384 - DIRECTION
      ?auto_134385 - MODE
    )
    :vars
    (
      ?auto_134387 - INSTRUMENT
      ?auto_134386 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_134381 ?auto_134379 ) ) ( not ( = ?auto_134383 ?auto_134379 ) ) ( not ( = ?auto_134383 ?auto_134381 ) ) ( not ( = ?auto_134384 ?auto_134379 ) ) ( not ( = ?auto_134384 ?auto_134381 ) ) ( not ( = ?auto_134384 ?auto_134383 ) ) ( CALIBRATED ?auto_134387 ) ( ON_BOARD ?auto_134387 ?auto_134386 ) ( SUPPORTS ?auto_134387 ?auto_134378 ) ( POWER_ON ?auto_134387 ) ( POINTING ?auto_134386 ?auto_134381 ) ( HAVE_IMAGE ?auto_134379 ?auto_134380 ) ( HAVE_IMAGE ?auto_134383 ?auto_134382 ) ( HAVE_IMAGE ?auto_134384 ?auto_134385 ) ( not ( = ?auto_134380 ?auto_134378 ) ) ( not ( = ?auto_134380 ?auto_134382 ) ) ( not ( = ?auto_134380 ?auto_134385 ) ) ( not ( = ?auto_134378 ?auto_134382 ) ) ( not ( = ?auto_134378 ?auto_134385 ) ) ( not ( = ?auto_134382 ?auto_134385 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_134381 ?auto_134378 )
      ( GET-4IMAGE-VERIFY ?auto_134379 ?auto_134380 ?auto_134381 ?auto_134378 ?auto_134383 ?auto_134382 ?auto_134384 ?auto_134385 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_135253 - DIRECTION
      ?auto_135254 - MODE
      ?auto_135255 - DIRECTION
      ?auto_135252 - MODE
      ?auto_135257 - DIRECTION
      ?auto_135256 - MODE
      ?auto_135258 - DIRECTION
      ?auto_135259 - MODE
    )
    :vars
    (
      ?auto_135261 - INSTRUMENT
      ?auto_135260 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_135255 ?auto_135253 ) ) ( not ( = ?auto_135257 ?auto_135253 ) ) ( not ( = ?auto_135257 ?auto_135255 ) ) ( not ( = ?auto_135258 ?auto_135253 ) ) ( not ( = ?auto_135258 ?auto_135255 ) ) ( not ( = ?auto_135258 ?auto_135257 ) ) ( CALIBRATED ?auto_135261 ) ( ON_BOARD ?auto_135261 ?auto_135260 ) ( SUPPORTS ?auto_135261 ?auto_135254 ) ( POWER_ON ?auto_135261 ) ( POINTING ?auto_135260 ?auto_135253 ) ( HAVE_IMAGE ?auto_135255 ?auto_135252 ) ( HAVE_IMAGE ?auto_135257 ?auto_135256 ) ( HAVE_IMAGE ?auto_135258 ?auto_135259 ) ( not ( = ?auto_135254 ?auto_135252 ) ) ( not ( = ?auto_135254 ?auto_135256 ) ) ( not ( = ?auto_135254 ?auto_135259 ) ) ( not ( = ?auto_135252 ?auto_135256 ) ) ( not ( = ?auto_135252 ?auto_135259 ) ) ( not ( = ?auto_135256 ?auto_135259 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_135253 ?auto_135254 )
      ( GET-4IMAGE-VERIFY ?auto_135253 ?auto_135254 ?auto_135255 ?auto_135252 ?auto_135257 ?auto_135256 ?auto_135258 ?auto_135259 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_136280 - DIRECTION
      ?auto_136281 - MODE
      ?auto_136282 - DIRECTION
      ?auto_136279 - MODE
      ?auto_136284 - DIRECTION
      ?auto_136283 - MODE
      ?auto_136285 - DIRECTION
      ?auto_136286 - MODE
    )
    :vars
    (
      ?auto_136288 - INSTRUMENT
      ?auto_136287 - SATELLITE
      ?auto_136289 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_136282 ?auto_136280 ) ) ( not ( = ?auto_136284 ?auto_136280 ) ) ( not ( = ?auto_136284 ?auto_136282 ) ) ( not ( = ?auto_136285 ?auto_136280 ) ) ( not ( = ?auto_136285 ?auto_136282 ) ) ( not ( = ?auto_136285 ?auto_136284 ) ) ( CALIBRATED ?auto_136288 ) ( ON_BOARD ?auto_136288 ?auto_136287 ) ( SUPPORTS ?auto_136288 ?auto_136286 ) ( POWER_ON ?auto_136288 ) ( POINTING ?auto_136287 ?auto_136289 ) ( not ( = ?auto_136285 ?auto_136289 ) ) ( HAVE_IMAGE ?auto_136280 ?auto_136281 ) ( not ( = ?auto_136280 ?auto_136289 ) ) ( not ( = ?auto_136281 ?auto_136286 ) ) ( HAVE_IMAGE ?auto_136282 ?auto_136279 ) ( HAVE_IMAGE ?auto_136284 ?auto_136283 ) ( not ( = ?auto_136281 ?auto_136279 ) ) ( not ( = ?auto_136281 ?auto_136283 ) ) ( not ( = ?auto_136282 ?auto_136289 ) ) ( not ( = ?auto_136279 ?auto_136283 ) ) ( not ( = ?auto_136279 ?auto_136286 ) ) ( not ( = ?auto_136284 ?auto_136289 ) ) ( not ( = ?auto_136283 ?auto_136286 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_136280 ?auto_136281 ?auto_136285 ?auto_136286 )
      ( GET-4IMAGE-VERIFY ?auto_136280 ?auto_136281 ?auto_136282 ?auto_136279 ?auto_136284 ?auto_136283 ?auto_136285 ?auto_136286 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_136313 - DIRECTION
      ?auto_136314 - MODE
      ?auto_136315 - DIRECTION
      ?auto_136312 - MODE
      ?auto_136317 - DIRECTION
      ?auto_136316 - MODE
      ?auto_136318 - DIRECTION
      ?auto_136319 - MODE
    )
    :vars
    (
      ?auto_136321 - INSTRUMENT
      ?auto_136320 - SATELLITE
      ?auto_136322 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_136315 ?auto_136313 ) ) ( not ( = ?auto_136317 ?auto_136313 ) ) ( not ( = ?auto_136317 ?auto_136315 ) ) ( not ( = ?auto_136318 ?auto_136313 ) ) ( not ( = ?auto_136318 ?auto_136315 ) ) ( not ( = ?auto_136318 ?auto_136317 ) ) ( CALIBRATED ?auto_136321 ) ( ON_BOARD ?auto_136321 ?auto_136320 ) ( SUPPORTS ?auto_136321 ?auto_136316 ) ( POWER_ON ?auto_136321 ) ( POINTING ?auto_136320 ?auto_136322 ) ( not ( = ?auto_136317 ?auto_136322 ) ) ( HAVE_IMAGE ?auto_136313 ?auto_136314 ) ( not ( = ?auto_136313 ?auto_136322 ) ) ( not ( = ?auto_136314 ?auto_136316 ) ) ( HAVE_IMAGE ?auto_136315 ?auto_136312 ) ( HAVE_IMAGE ?auto_136318 ?auto_136319 ) ( not ( = ?auto_136314 ?auto_136312 ) ) ( not ( = ?auto_136314 ?auto_136319 ) ) ( not ( = ?auto_136315 ?auto_136322 ) ) ( not ( = ?auto_136312 ?auto_136316 ) ) ( not ( = ?auto_136312 ?auto_136319 ) ) ( not ( = ?auto_136316 ?auto_136319 ) ) ( not ( = ?auto_136318 ?auto_136322 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_136313 ?auto_136314 ?auto_136317 ?auto_136316 )
      ( GET-4IMAGE-VERIFY ?auto_136313 ?auto_136314 ?auto_136315 ?auto_136312 ?auto_136317 ?auto_136316 ?auto_136318 ?auto_136319 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_136472 - DIRECTION
      ?auto_136473 - MODE
      ?auto_136474 - DIRECTION
      ?auto_136471 - MODE
      ?auto_136476 - DIRECTION
      ?auto_136475 - MODE
      ?auto_136477 - DIRECTION
      ?auto_136478 - MODE
    )
    :vars
    (
      ?auto_136480 - INSTRUMENT
      ?auto_136479 - SATELLITE
      ?auto_136481 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_136474 ?auto_136472 ) ) ( not ( = ?auto_136476 ?auto_136472 ) ) ( not ( = ?auto_136476 ?auto_136474 ) ) ( not ( = ?auto_136477 ?auto_136472 ) ) ( not ( = ?auto_136477 ?auto_136474 ) ) ( not ( = ?auto_136477 ?auto_136476 ) ) ( CALIBRATED ?auto_136480 ) ( ON_BOARD ?auto_136480 ?auto_136479 ) ( SUPPORTS ?auto_136480 ?auto_136471 ) ( POWER_ON ?auto_136480 ) ( POINTING ?auto_136479 ?auto_136481 ) ( not ( = ?auto_136474 ?auto_136481 ) ) ( HAVE_IMAGE ?auto_136472 ?auto_136473 ) ( not ( = ?auto_136472 ?auto_136481 ) ) ( not ( = ?auto_136473 ?auto_136471 ) ) ( HAVE_IMAGE ?auto_136476 ?auto_136475 ) ( HAVE_IMAGE ?auto_136477 ?auto_136478 ) ( not ( = ?auto_136473 ?auto_136475 ) ) ( not ( = ?auto_136473 ?auto_136478 ) ) ( not ( = ?auto_136471 ?auto_136475 ) ) ( not ( = ?auto_136471 ?auto_136478 ) ) ( not ( = ?auto_136476 ?auto_136481 ) ) ( not ( = ?auto_136475 ?auto_136478 ) ) ( not ( = ?auto_136477 ?auto_136481 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_136472 ?auto_136473 ?auto_136474 ?auto_136471 )
      ( GET-4IMAGE-VERIFY ?auto_136472 ?auto_136473 ?auto_136474 ?auto_136471 ?auto_136476 ?auto_136475 ?auto_136477 ?auto_136478 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_137499 - DIRECTION
      ?auto_137500 - MODE
      ?auto_137501 - DIRECTION
      ?auto_137498 - MODE
      ?auto_137503 - DIRECTION
      ?auto_137502 - MODE
      ?auto_137504 - DIRECTION
      ?auto_137505 - MODE
    )
    :vars
    (
      ?auto_137507 - INSTRUMENT
      ?auto_137506 - SATELLITE
      ?auto_137508 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_137501 ?auto_137499 ) ) ( not ( = ?auto_137503 ?auto_137499 ) ) ( not ( = ?auto_137503 ?auto_137501 ) ) ( not ( = ?auto_137504 ?auto_137499 ) ) ( not ( = ?auto_137504 ?auto_137501 ) ) ( not ( = ?auto_137504 ?auto_137503 ) ) ( CALIBRATED ?auto_137507 ) ( ON_BOARD ?auto_137507 ?auto_137506 ) ( SUPPORTS ?auto_137507 ?auto_137500 ) ( POWER_ON ?auto_137507 ) ( POINTING ?auto_137506 ?auto_137508 ) ( not ( = ?auto_137499 ?auto_137508 ) ) ( HAVE_IMAGE ?auto_137501 ?auto_137498 ) ( not ( = ?auto_137501 ?auto_137508 ) ) ( not ( = ?auto_137498 ?auto_137500 ) ) ( HAVE_IMAGE ?auto_137503 ?auto_137502 ) ( HAVE_IMAGE ?auto_137504 ?auto_137505 ) ( not ( = ?auto_137500 ?auto_137502 ) ) ( not ( = ?auto_137500 ?auto_137505 ) ) ( not ( = ?auto_137498 ?auto_137502 ) ) ( not ( = ?auto_137498 ?auto_137505 ) ) ( not ( = ?auto_137503 ?auto_137508 ) ) ( not ( = ?auto_137502 ?auto_137505 ) ) ( not ( = ?auto_137504 ?auto_137508 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_137501 ?auto_137498 ?auto_137499 ?auto_137500 )
      ( GET-4IMAGE-VERIFY ?auto_137499 ?auto_137500 ?auto_137501 ?auto_137498 ?auto_137503 ?auto_137502 ?auto_137504 ?auto_137505 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_138635 - DIRECTION
      ?auto_138636 - MODE
      ?auto_138637 - DIRECTION
      ?auto_138634 - MODE
      ?auto_138639 - DIRECTION
      ?auto_138638 - MODE
      ?auto_138640 - DIRECTION
      ?auto_138641 - MODE
    )
    :vars
    (
      ?auto_138644 - INSTRUMENT
      ?auto_138643 - SATELLITE
      ?auto_138642 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_138637 ?auto_138635 ) ) ( not ( = ?auto_138639 ?auto_138635 ) ) ( not ( = ?auto_138639 ?auto_138637 ) ) ( not ( = ?auto_138640 ?auto_138635 ) ) ( not ( = ?auto_138640 ?auto_138637 ) ) ( not ( = ?auto_138640 ?auto_138639 ) ) ( ON_BOARD ?auto_138644 ?auto_138643 ) ( SUPPORTS ?auto_138644 ?auto_138641 ) ( POWER_ON ?auto_138644 ) ( POINTING ?auto_138643 ?auto_138642 ) ( not ( = ?auto_138640 ?auto_138642 ) ) ( HAVE_IMAGE ?auto_138635 ?auto_138636 ) ( not ( = ?auto_138635 ?auto_138642 ) ) ( not ( = ?auto_138636 ?auto_138641 ) ) ( CALIBRATION_TARGET ?auto_138644 ?auto_138642 ) ( NOT_CALIBRATED ?auto_138644 ) ( HAVE_IMAGE ?auto_138637 ?auto_138634 ) ( HAVE_IMAGE ?auto_138639 ?auto_138638 ) ( not ( = ?auto_138636 ?auto_138634 ) ) ( not ( = ?auto_138636 ?auto_138638 ) ) ( not ( = ?auto_138637 ?auto_138642 ) ) ( not ( = ?auto_138634 ?auto_138638 ) ) ( not ( = ?auto_138634 ?auto_138641 ) ) ( not ( = ?auto_138639 ?auto_138642 ) ) ( not ( = ?auto_138638 ?auto_138641 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_138635 ?auto_138636 ?auto_138640 ?auto_138641 )
      ( GET-4IMAGE-VERIFY ?auto_138635 ?auto_138636 ?auto_138637 ?auto_138634 ?auto_138639 ?auto_138638 ?auto_138640 ?auto_138641 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_138668 - DIRECTION
      ?auto_138669 - MODE
      ?auto_138670 - DIRECTION
      ?auto_138667 - MODE
      ?auto_138672 - DIRECTION
      ?auto_138671 - MODE
      ?auto_138673 - DIRECTION
      ?auto_138674 - MODE
    )
    :vars
    (
      ?auto_138677 - INSTRUMENT
      ?auto_138676 - SATELLITE
      ?auto_138675 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_138670 ?auto_138668 ) ) ( not ( = ?auto_138672 ?auto_138668 ) ) ( not ( = ?auto_138672 ?auto_138670 ) ) ( not ( = ?auto_138673 ?auto_138668 ) ) ( not ( = ?auto_138673 ?auto_138670 ) ) ( not ( = ?auto_138673 ?auto_138672 ) ) ( ON_BOARD ?auto_138677 ?auto_138676 ) ( SUPPORTS ?auto_138677 ?auto_138671 ) ( POWER_ON ?auto_138677 ) ( POINTING ?auto_138676 ?auto_138675 ) ( not ( = ?auto_138672 ?auto_138675 ) ) ( HAVE_IMAGE ?auto_138668 ?auto_138669 ) ( not ( = ?auto_138668 ?auto_138675 ) ) ( not ( = ?auto_138669 ?auto_138671 ) ) ( CALIBRATION_TARGET ?auto_138677 ?auto_138675 ) ( NOT_CALIBRATED ?auto_138677 ) ( HAVE_IMAGE ?auto_138670 ?auto_138667 ) ( HAVE_IMAGE ?auto_138673 ?auto_138674 ) ( not ( = ?auto_138669 ?auto_138667 ) ) ( not ( = ?auto_138669 ?auto_138674 ) ) ( not ( = ?auto_138670 ?auto_138675 ) ) ( not ( = ?auto_138667 ?auto_138671 ) ) ( not ( = ?auto_138667 ?auto_138674 ) ) ( not ( = ?auto_138671 ?auto_138674 ) ) ( not ( = ?auto_138673 ?auto_138675 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_138668 ?auto_138669 ?auto_138672 ?auto_138671 )
      ( GET-4IMAGE-VERIFY ?auto_138668 ?auto_138669 ?auto_138670 ?auto_138667 ?auto_138672 ?auto_138671 ?auto_138673 ?auto_138674 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_138827 - DIRECTION
      ?auto_138828 - MODE
      ?auto_138829 - DIRECTION
      ?auto_138826 - MODE
      ?auto_138831 - DIRECTION
      ?auto_138830 - MODE
      ?auto_138832 - DIRECTION
      ?auto_138833 - MODE
    )
    :vars
    (
      ?auto_138836 - INSTRUMENT
      ?auto_138835 - SATELLITE
      ?auto_138834 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_138829 ?auto_138827 ) ) ( not ( = ?auto_138831 ?auto_138827 ) ) ( not ( = ?auto_138831 ?auto_138829 ) ) ( not ( = ?auto_138832 ?auto_138827 ) ) ( not ( = ?auto_138832 ?auto_138829 ) ) ( not ( = ?auto_138832 ?auto_138831 ) ) ( ON_BOARD ?auto_138836 ?auto_138835 ) ( SUPPORTS ?auto_138836 ?auto_138826 ) ( POWER_ON ?auto_138836 ) ( POINTING ?auto_138835 ?auto_138834 ) ( not ( = ?auto_138829 ?auto_138834 ) ) ( HAVE_IMAGE ?auto_138827 ?auto_138828 ) ( not ( = ?auto_138827 ?auto_138834 ) ) ( not ( = ?auto_138828 ?auto_138826 ) ) ( CALIBRATION_TARGET ?auto_138836 ?auto_138834 ) ( NOT_CALIBRATED ?auto_138836 ) ( HAVE_IMAGE ?auto_138831 ?auto_138830 ) ( HAVE_IMAGE ?auto_138832 ?auto_138833 ) ( not ( = ?auto_138828 ?auto_138830 ) ) ( not ( = ?auto_138828 ?auto_138833 ) ) ( not ( = ?auto_138826 ?auto_138830 ) ) ( not ( = ?auto_138826 ?auto_138833 ) ) ( not ( = ?auto_138831 ?auto_138834 ) ) ( not ( = ?auto_138830 ?auto_138833 ) ) ( not ( = ?auto_138832 ?auto_138834 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_138827 ?auto_138828 ?auto_138829 ?auto_138826 )
      ( GET-4IMAGE-VERIFY ?auto_138827 ?auto_138828 ?auto_138829 ?auto_138826 ?auto_138831 ?auto_138830 ?auto_138832 ?auto_138833 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_139854 - DIRECTION
      ?auto_139855 - MODE
      ?auto_139856 - DIRECTION
      ?auto_139853 - MODE
      ?auto_139858 - DIRECTION
      ?auto_139857 - MODE
      ?auto_139859 - DIRECTION
      ?auto_139860 - MODE
    )
    :vars
    (
      ?auto_139863 - INSTRUMENT
      ?auto_139862 - SATELLITE
      ?auto_139861 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_139856 ?auto_139854 ) ) ( not ( = ?auto_139858 ?auto_139854 ) ) ( not ( = ?auto_139858 ?auto_139856 ) ) ( not ( = ?auto_139859 ?auto_139854 ) ) ( not ( = ?auto_139859 ?auto_139856 ) ) ( not ( = ?auto_139859 ?auto_139858 ) ) ( ON_BOARD ?auto_139863 ?auto_139862 ) ( SUPPORTS ?auto_139863 ?auto_139855 ) ( POWER_ON ?auto_139863 ) ( POINTING ?auto_139862 ?auto_139861 ) ( not ( = ?auto_139854 ?auto_139861 ) ) ( HAVE_IMAGE ?auto_139856 ?auto_139853 ) ( not ( = ?auto_139856 ?auto_139861 ) ) ( not ( = ?auto_139853 ?auto_139855 ) ) ( CALIBRATION_TARGET ?auto_139863 ?auto_139861 ) ( NOT_CALIBRATED ?auto_139863 ) ( HAVE_IMAGE ?auto_139858 ?auto_139857 ) ( HAVE_IMAGE ?auto_139859 ?auto_139860 ) ( not ( = ?auto_139855 ?auto_139857 ) ) ( not ( = ?auto_139855 ?auto_139860 ) ) ( not ( = ?auto_139853 ?auto_139857 ) ) ( not ( = ?auto_139853 ?auto_139860 ) ) ( not ( = ?auto_139858 ?auto_139861 ) ) ( not ( = ?auto_139857 ?auto_139860 ) ) ( not ( = ?auto_139859 ?auto_139861 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_139856 ?auto_139853 ?auto_139854 ?auto_139855 )
      ( GET-4IMAGE-VERIFY ?auto_139854 ?auto_139855 ?auto_139856 ?auto_139853 ?auto_139858 ?auto_139857 ?auto_139859 ?auto_139860 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_140990 - DIRECTION
      ?auto_140991 - MODE
      ?auto_140992 - DIRECTION
      ?auto_140989 - MODE
      ?auto_140994 - DIRECTION
      ?auto_140993 - MODE
      ?auto_140995 - DIRECTION
      ?auto_140996 - MODE
    )
    :vars
    (
      ?auto_140998 - INSTRUMENT
      ?auto_140997 - SATELLITE
      ?auto_140999 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_140992 ?auto_140990 ) ) ( not ( = ?auto_140994 ?auto_140990 ) ) ( not ( = ?auto_140994 ?auto_140992 ) ) ( not ( = ?auto_140995 ?auto_140990 ) ) ( not ( = ?auto_140995 ?auto_140992 ) ) ( not ( = ?auto_140995 ?auto_140994 ) ) ( ON_BOARD ?auto_140998 ?auto_140997 ) ( SUPPORTS ?auto_140998 ?auto_140996 ) ( POINTING ?auto_140997 ?auto_140999 ) ( not ( = ?auto_140995 ?auto_140999 ) ) ( HAVE_IMAGE ?auto_140990 ?auto_140991 ) ( not ( = ?auto_140990 ?auto_140999 ) ) ( not ( = ?auto_140991 ?auto_140996 ) ) ( CALIBRATION_TARGET ?auto_140998 ?auto_140999 ) ( POWER_AVAIL ?auto_140997 ) ( HAVE_IMAGE ?auto_140992 ?auto_140989 ) ( HAVE_IMAGE ?auto_140994 ?auto_140993 ) ( not ( = ?auto_140991 ?auto_140989 ) ) ( not ( = ?auto_140991 ?auto_140993 ) ) ( not ( = ?auto_140992 ?auto_140999 ) ) ( not ( = ?auto_140989 ?auto_140993 ) ) ( not ( = ?auto_140989 ?auto_140996 ) ) ( not ( = ?auto_140994 ?auto_140999 ) ) ( not ( = ?auto_140993 ?auto_140996 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_140990 ?auto_140991 ?auto_140995 ?auto_140996 )
      ( GET-4IMAGE-VERIFY ?auto_140990 ?auto_140991 ?auto_140992 ?auto_140989 ?auto_140994 ?auto_140993 ?auto_140995 ?auto_140996 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_141023 - DIRECTION
      ?auto_141024 - MODE
      ?auto_141025 - DIRECTION
      ?auto_141022 - MODE
      ?auto_141027 - DIRECTION
      ?auto_141026 - MODE
      ?auto_141028 - DIRECTION
      ?auto_141029 - MODE
    )
    :vars
    (
      ?auto_141031 - INSTRUMENT
      ?auto_141030 - SATELLITE
      ?auto_141032 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_141025 ?auto_141023 ) ) ( not ( = ?auto_141027 ?auto_141023 ) ) ( not ( = ?auto_141027 ?auto_141025 ) ) ( not ( = ?auto_141028 ?auto_141023 ) ) ( not ( = ?auto_141028 ?auto_141025 ) ) ( not ( = ?auto_141028 ?auto_141027 ) ) ( ON_BOARD ?auto_141031 ?auto_141030 ) ( SUPPORTS ?auto_141031 ?auto_141026 ) ( POINTING ?auto_141030 ?auto_141032 ) ( not ( = ?auto_141027 ?auto_141032 ) ) ( HAVE_IMAGE ?auto_141023 ?auto_141024 ) ( not ( = ?auto_141023 ?auto_141032 ) ) ( not ( = ?auto_141024 ?auto_141026 ) ) ( CALIBRATION_TARGET ?auto_141031 ?auto_141032 ) ( POWER_AVAIL ?auto_141030 ) ( HAVE_IMAGE ?auto_141025 ?auto_141022 ) ( HAVE_IMAGE ?auto_141028 ?auto_141029 ) ( not ( = ?auto_141024 ?auto_141022 ) ) ( not ( = ?auto_141024 ?auto_141029 ) ) ( not ( = ?auto_141025 ?auto_141032 ) ) ( not ( = ?auto_141022 ?auto_141026 ) ) ( not ( = ?auto_141022 ?auto_141029 ) ) ( not ( = ?auto_141026 ?auto_141029 ) ) ( not ( = ?auto_141028 ?auto_141032 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_141023 ?auto_141024 ?auto_141027 ?auto_141026 )
      ( GET-4IMAGE-VERIFY ?auto_141023 ?auto_141024 ?auto_141025 ?auto_141022 ?auto_141027 ?auto_141026 ?auto_141028 ?auto_141029 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_141182 - DIRECTION
      ?auto_141183 - MODE
      ?auto_141184 - DIRECTION
      ?auto_141181 - MODE
      ?auto_141186 - DIRECTION
      ?auto_141185 - MODE
      ?auto_141187 - DIRECTION
      ?auto_141188 - MODE
    )
    :vars
    (
      ?auto_141190 - INSTRUMENT
      ?auto_141189 - SATELLITE
      ?auto_141191 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_141184 ?auto_141182 ) ) ( not ( = ?auto_141186 ?auto_141182 ) ) ( not ( = ?auto_141186 ?auto_141184 ) ) ( not ( = ?auto_141187 ?auto_141182 ) ) ( not ( = ?auto_141187 ?auto_141184 ) ) ( not ( = ?auto_141187 ?auto_141186 ) ) ( ON_BOARD ?auto_141190 ?auto_141189 ) ( SUPPORTS ?auto_141190 ?auto_141181 ) ( POINTING ?auto_141189 ?auto_141191 ) ( not ( = ?auto_141184 ?auto_141191 ) ) ( HAVE_IMAGE ?auto_141182 ?auto_141183 ) ( not ( = ?auto_141182 ?auto_141191 ) ) ( not ( = ?auto_141183 ?auto_141181 ) ) ( CALIBRATION_TARGET ?auto_141190 ?auto_141191 ) ( POWER_AVAIL ?auto_141189 ) ( HAVE_IMAGE ?auto_141186 ?auto_141185 ) ( HAVE_IMAGE ?auto_141187 ?auto_141188 ) ( not ( = ?auto_141183 ?auto_141185 ) ) ( not ( = ?auto_141183 ?auto_141188 ) ) ( not ( = ?auto_141181 ?auto_141185 ) ) ( not ( = ?auto_141181 ?auto_141188 ) ) ( not ( = ?auto_141186 ?auto_141191 ) ) ( not ( = ?auto_141185 ?auto_141188 ) ) ( not ( = ?auto_141187 ?auto_141191 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_141182 ?auto_141183 ?auto_141184 ?auto_141181 )
      ( GET-4IMAGE-VERIFY ?auto_141182 ?auto_141183 ?auto_141184 ?auto_141181 ?auto_141186 ?auto_141185 ?auto_141187 ?auto_141188 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_142209 - DIRECTION
      ?auto_142210 - MODE
      ?auto_142211 - DIRECTION
      ?auto_142208 - MODE
      ?auto_142213 - DIRECTION
      ?auto_142212 - MODE
      ?auto_142214 - DIRECTION
      ?auto_142215 - MODE
    )
    :vars
    (
      ?auto_142217 - INSTRUMENT
      ?auto_142216 - SATELLITE
      ?auto_142218 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_142211 ?auto_142209 ) ) ( not ( = ?auto_142213 ?auto_142209 ) ) ( not ( = ?auto_142213 ?auto_142211 ) ) ( not ( = ?auto_142214 ?auto_142209 ) ) ( not ( = ?auto_142214 ?auto_142211 ) ) ( not ( = ?auto_142214 ?auto_142213 ) ) ( ON_BOARD ?auto_142217 ?auto_142216 ) ( SUPPORTS ?auto_142217 ?auto_142210 ) ( POINTING ?auto_142216 ?auto_142218 ) ( not ( = ?auto_142209 ?auto_142218 ) ) ( HAVE_IMAGE ?auto_142211 ?auto_142208 ) ( not ( = ?auto_142211 ?auto_142218 ) ) ( not ( = ?auto_142208 ?auto_142210 ) ) ( CALIBRATION_TARGET ?auto_142217 ?auto_142218 ) ( POWER_AVAIL ?auto_142216 ) ( HAVE_IMAGE ?auto_142213 ?auto_142212 ) ( HAVE_IMAGE ?auto_142214 ?auto_142215 ) ( not ( = ?auto_142210 ?auto_142212 ) ) ( not ( = ?auto_142210 ?auto_142215 ) ) ( not ( = ?auto_142208 ?auto_142212 ) ) ( not ( = ?auto_142208 ?auto_142215 ) ) ( not ( = ?auto_142213 ?auto_142218 ) ) ( not ( = ?auto_142212 ?auto_142215 ) ) ( not ( = ?auto_142214 ?auto_142218 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142211 ?auto_142208 ?auto_142209 ?auto_142210 )
      ( GET-4IMAGE-VERIFY ?auto_142209 ?auto_142210 ?auto_142211 ?auto_142208 ?auto_142213 ?auto_142212 ?auto_142214 ?auto_142215 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_142956 - DIRECTION
      ?auto_142957 - MODE
      ?auto_142958 - DIRECTION
      ?auto_142955 - MODE
      ?auto_142960 - DIRECTION
      ?auto_142959 - MODE
    )
    :vars
    (
      ?auto_142961 - INSTRUMENT
      ?auto_142963 - SATELLITE
      ?auto_142964 - DIRECTION
      ?auto_142962 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_142958 ?auto_142956 ) ) ( not ( = ?auto_142960 ?auto_142956 ) ) ( not ( = ?auto_142960 ?auto_142958 ) ) ( ON_BOARD ?auto_142961 ?auto_142963 ) ( SUPPORTS ?auto_142961 ?auto_142959 ) ( not ( = ?auto_142960 ?auto_142964 ) ) ( HAVE_IMAGE ?auto_142956 ?auto_142957 ) ( not ( = ?auto_142956 ?auto_142964 ) ) ( not ( = ?auto_142957 ?auto_142959 ) ) ( CALIBRATION_TARGET ?auto_142961 ?auto_142964 ) ( POWER_AVAIL ?auto_142963 ) ( POINTING ?auto_142963 ?auto_142962 ) ( not ( = ?auto_142964 ?auto_142962 ) ) ( not ( = ?auto_142960 ?auto_142962 ) ) ( not ( = ?auto_142956 ?auto_142962 ) ) ( HAVE_IMAGE ?auto_142958 ?auto_142955 ) ( not ( = ?auto_142957 ?auto_142955 ) ) ( not ( = ?auto_142958 ?auto_142964 ) ) ( not ( = ?auto_142958 ?auto_142962 ) ) ( not ( = ?auto_142955 ?auto_142959 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142956 ?auto_142957 ?auto_142960 ?auto_142959 )
      ( GET-3IMAGE-VERIFY ?auto_142956 ?auto_142957 ?auto_142958 ?auto_142955 ?auto_142960 ?auto_142959 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_142985 - DIRECTION
      ?auto_142986 - MODE
      ?auto_142987 - DIRECTION
      ?auto_142984 - MODE
      ?auto_142989 - DIRECTION
      ?auto_142988 - MODE
    )
    :vars
    (
      ?auto_142990 - INSTRUMENT
      ?auto_142992 - SATELLITE
      ?auto_142993 - DIRECTION
      ?auto_142991 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_142987 ?auto_142985 ) ) ( not ( = ?auto_142989 ?auto_142985 ) ) ( not ( = ?auto_142989 ?auto_142987 ) ) ( ON_BOARD ?auto_142990 ?auto_142992 ) ( SUPPORTS ?auto_142990 ?auto_142984 ) ( not ( = ?auto_142987 ?auto_142993 ) ) ( HAVE_IMAGE ?auto_142985 ?auto_142986 ) ( not ( = ?auto_142985 ?auto_142993 ) ) ( not ( = ?auto_142986 ?auto_142984 ) ) ( CALIBRATION_TARGET ?auto_142990 ?auto_142993 ) ( POWER_AVAIL ?auto_142992 ) ( POINTING ?auto_142992 ?auto_142991 ) ( not ( = ?auto_142993 ?auto_142991 ) ) ( not ( = ?auto_142987 ?auto_142991 ) ) ( not ( = ?auto_142985 ?auto_142991 ) ) ( HAVE_IMAGE ?auto_142989 ?auto_142988 ) ( not ( = ?auto_142986 ?auto_142988 ) ) ( not ( = ?auto_142984 ?auto_142988 ) ) ( not ( = ?auto_142989 ?auto_142993 ) ) ( not ( = ?auto_142989 ?auto_142991 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142985 ?auto_142986 ?auto_142987 ?auto_142984 )
      ( GET-3IMAGE-VERIFY ?auto_142985 ?auto_142986 ?auto_142987 ?auto_142984 ?auto_142989 ?auto_142988 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_143147 - DIRECTION
      ?auto_143148 - MODE
      ?auto_143149 - DIRECTION
      ?auto_143146 - MODE
      ?auto_143151 - DIRECTION
      ?auto_143150 - MODE
    )
    :vars
    (
      ?auto_143152 - INSTRUMENT
      ?auto_143154 - SATELLITE
      ?auto_143155 - DIRECTION
      ?auto_143153 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_143149 ?auto_143147 ) ) ( not ( = ?auto_143151 ?auto_143147 ) ) ( not ( = ?auto_143151 ?auto_143149 ) ) ( ON_BOARD ?auto_143152 ?auto_143154 ) ( SUPPORTS ?auto_143152 ?auto_143148 ) ( not ( = ?auto_143147 ?auto_143155 ) ) ( HAVE_IMAGE ?auto_143149 ?auto_143146 ) ( not ( = ?auto_143149 ?auto_143155 ) ) ( not ( = ?auto_143146 ?auto_143148 ) ) ( CALIBRATION_TARGET ?auto_143152 ?auto_143155 ) ( POWER_AVAIL ?auto_143154 ) ( POINTING ?auto_143154 ?auto_143153 ) ( not ( = ?auto_143155 ?auto_143153 ) ) ( not ( = ?auto_143147 ?auto_143153 ) ) ( not ( = ?auto_143149 ?auto_143153 ) ) ( HAVE_IMAGE ?auto_143151 ?auto_143150 ) ( not ( = ?auto_143148 ?auto_143150 ) ) ( not ( = ?auto_143146 ?auto_143150 ) ) ( not ( = ?auto_143151 ?auto_143155 ) ) ( not ( = ?auto_143151 ?auto_143153 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143149 ?auto_143146 ?auto_143147 ?auto_143148 )
      ( GET-3IMAGE-VERIFY ?auto_143147 ?auto_143148 ?auto_143149 ?auto_143146 ?auto_143151 ?auto_143150 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143400 - DIRECTION
      ?auto_143401 - MODE
      ?auto_143402 - DIRECTION
      ?auto_143399 - MODE
      ?auto_143404 - DIRECTION
      ?auto_143403 - MODE
      ?auto_143405 - DIRECTION
      ?auto_143406 - MODE
    )
    :vars
    (
      ?auto_143407 - INSTRUMENT
      ?auto_143408 - SATELLITE
      ?auto_143409 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_143402 ?auto_143400 ) ) ( not ( = ?auto_143404 ?auto_143400 ) ) ( not ( = ?auto_143404 ?auto_143402 ) ) ( not ( = ?auto_143405 ?auto_143400 ) ) ( not ( = ?auto_143405 ?auto_143402 ) ) ( not ( = ?auto_143405 ?auto_143404 ) ) ( ON_BOARD ?auto_143407 ?auto_143408 ) ( SUPPORTS ?auto_143407 ?auto_143406 ) ( not ( = ?auto_143405 ?auto_143409 ) ) ( HAVE_IMAGE ?auto_143400 ?auto_143401 ) ( not ( = ?auto_143400 ?auto_143409 ) ) ( not ( = ?auto_143401 ?auto_143406 ) ) ( CALIBRATION_TARGET ?auto_143407 ?auto_143409 ) ( POWER_AVAIL ?auto_143408 ) ( POINTING ?auto_143408 ?auto_143404 ) ( not ( = ?auto_143409 ?auto_143404 ) ) ( HAVE_IMAGE ?auto_143402 ?auto_143399 ) ( HAVE_IMAGE ?auto_143404 ?auto_143403 ) ( not ( = ?auto_143401 ?auto_143399 ) ) ( not ( = ?auto_143401 ?auto_143403 ) ) ( not ( = ?auto_143402 ?auto_143409 ) ) ( not ( = ?auto_143399 ?auto_143403 ) ) ( not ( = ?auto_143399 ?auto_143406 ) ) ( not ( = ?auto_143403 ?auto_143406 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143400 ?auto_143401 ?auto_143405 ?auto_143406 )
      ( GET-4IMAGE-VERIFY ?auto_143400 ?auto_143401 ?auto_143402 ?auto_143399 ?auto_143404 ?auto_143403 ?auto_143405 ?auto_143406 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143435 - DIRECTION
      ?auto_143436 - MODE
      ?auto_143437 - DIRECTION
      ?auto_143434 - MODE
      ?auto_143439 - DIRECTION
      ?auto_143438 - MODE
      ?auto_143440 - DIRECTION
      ?auto_143441 - MODE
    )
    :vars
    (
      ?auto_143442 - INSTRUMENT
      ?auto_143443 - SATELLITE
      ?auto_143444 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_143437 ?auto_143435 ) ) ( not ( = ?auto_143439 ?auto_143435 ) ) ( not ( = ?auto_143439 ?auto_143437 ) ) ( not ( = ?auto_143440 ?auto_143435 ) ) ( not ( = ?auto_143440 ?auto_143437 ) ) ( not ( = ?auto_143440 ?auto_143439 ) ) ( ON_BOARD ?auto_143442 ?auto_143443 ) ( SUPPORTS ?auto_143442 ?auto_143438 ) ( not ( = ?auto_143439 ?auto_143444 ) ) ( HAVE_IMAGE ?auto_143435 ?auto_143436 ) ( not ( = ?auto_143435 ?auto_143444 ) ) ( not ( = ?auto_143436 ?auto_143438 ) ) ( CALIBRATION_TARGET ?auto_143442 ?auto_143444 ) ( POWER_AVAIL ?auto_143443 ) ( POINTING ?auto_143443 ?auto_143440 ) ( not ( = ?auto_143444 ?auto_143440 ) ) ( HAVE_IMAGE ?auto_143437 ?auto_143434 ) ( HAVE_IMAGE ?auto_143440 ?auto_143441 ) ( not ( = ?auto_143436 ?auto_143434 ) ) ( not ( = ?auto_143436 ?auto_143441 ) ) ( not ( = ?auto_143437 ?auto_143444 ) ) ( not ( = ?auto_143434 ?auto_143438 ) ) ( not ( = ?auto_143434 ?auto_143441 ) ) ( not ( = ?auto_143438 ?auto_143441 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143435 ?auto_143436 ?auto_143439 ?auto_143438 )
      ( GET-4IMAGE-VERIFY ?auto_143435 ?auto_143436 ?auto_143437 ?auto_143434 ?auto_143439 ?auto_143438 ?auto_143440 ?auto_143441 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143469 - DIRECTION
      ?auto_143470 - MODE
      ?auto_143471 - DIRECTION
      ?auto_143468 - MODE
      ?auto_143473 - DIRECTION
      ?auto_143472 - MODE
      ?auto_143474 - DIRECTION
      ?auto_143475 - MODE
    )
    :vars
    (
      ?auto_143476 - INSTRUMENT
      ?auto_143477 - SATELLITE
      ?auto_143478 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_143471 ?auto_143469 ) ) ( not ( = ?auto_143473 ?auto_143469 ) ) ( not ( = ?auto_143473 ?auto_143471 ) ) ( not ( = ?auto_143474 ?auto_143469 ) ) ( not ( = ?auto_143474 ?auto_143471 ) ) ( not ( = ?auto_143474 ?auto_143473 ) ) ( ON_BOARD ?auto_143476 ?auto_143477 ) ( SUPPORTS ?auto_143476 ?auto_143475 ) ( not ( = ?auto_143474 ?auto_143478 ) ) ( HAVE_IMAGE ?auto_143469 ?auto_143470 ) ( not ( = ?auto_143469 ?auto_143478 ) ) ( not ( = ?auto_143470 ?auto_143475 ) ) ( CALIBRATION_TARGET ?auto_143476 ?auto_143478 ) ( POWER_AVAIL ?auto_143477 ) ( POINTING ?auto_143477 ?auto_143471 ) ( not ( = ?auto_143478 ?auto_143471 ) ) ( HAVE_IMAGE ?auto_143471 ?auto_143468 ) ( HAVE_IMAGE ?auto_143473 ?auto_143472 ) ( not ( = ?auto_143470 ?auto_143468 ) ) ( not ( = ?auto_143470 ?auto_143472 ) ) ( not ( = ?auto_143468 ?auto_143472 ) ) ( not ( = ?auto_143468 ?auto_143475 ) ) ( not ( = ?auto_143473 ?auto_143478 ) ) ( not ( = ?auto_143472 ?auto_143475 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143469 ?auto_143470 ?auto_143474 ?auto_143475 )
      ( GET-4IMAGE-VERIFY ?auto_143469 ?auto_143470 ?auto_143471 ?auto_143468 ?auto_143473 ?auto_143472 ?auto_143474 ?auto_143475 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143502 - DIRECTION
      ?auto_143503 - MODE
      ?auto_143504 - DIRECTION
      ?auto_143501 - MODE
      ?auto_143506 - DIRECTION
      ?auto_143505 - MODE
      ?auto_143507 - DIRECTION
      ?auto_143508 - MODE
    )
    :vars
    (
      ?auto_143509 - INSTRUMENT
      ?auto_143510 - SATELLITE
      ?auto_143511 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_143504 ?auto_143502 ) ) ( not ( = ?auto_143506 ?auto_143502 ) ) ( not ( = ?auto_143506 ?auto_143504 ) ) ( not ( = ?auto_143507 ?auto_143502 ) ) ( not ( = ?auto_143507 ?auto_143504 ) ) ( not ( = ?auto_143507 ?auto_143506 ) ) ( ON_BOARD ?auto_143509 ?auto_143510 ) ( SUPPORTS ?auto_143509 ?auto_143505 ) ( not ( = ?auto_143506 ?auto_143511 ) ) ( HAVE_IMAGE ?auto_143502 ?auto_143503 ) ( not ( = ?auto_143502 ?auto_143511 ) ) ( not ( = ?auto_143503 ?auto_143505 ) ) ( CALIBRATION_TARGET ?auto_143509 ?auto_143511 ) ( POWER_AVAIL ?auto_143510 ) ( POINTING ?auto_143510 ?auto_143504 ) ( not ( = ?auto_143511 ?auto_143504 ) ) ( HAVE_IMAGE ?auto_143504 ?auto_143501 ) ( HAVE_IMAGE ?auto_143507 ?auto_143508 ) ( not ( = ?auto_143503 ?auto_143501 ) ) ( not ( = ?auto_143503 ?auto_143508 ) ) ( not ( = ?auto_143501 ?auto_143505 ) ) ( not ( = ?auto_143501 ?auto_143508 ) ) ( not ( = ?auto_143505 ?auto_143508 ) ) ( not ( = ?auto_143507 ?auto_143511 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143502 ?auto_143503 ?auto_143506 ?auto_143505 )
      ( GET-4IMAGE-VERIFY ?auto_143502 ?auto_143503 ?auto_143504 ?auto_143501 ?auto_143506 ?auto_143505 ?auto_143507 ?auto_143508 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143606 - DIRECTION
      ?auto_143607 - MODE
      ?auto_143608 - DIRECTION
      ?auto_143605 - MODE
      ?auto_143610 - DIRECTION
      ?auto_143609 - MODE
      ?auto_143611 - DIRECTION
      ?auto_143612 - MODE
    )
    :vars
    (
      ?auto_143613 - INSTRUMENT
      ?auto_143614 - SATELLITE
      ?auto_143615 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_143608 ?auto_143606 ) ) ( not ( = ?auto_143610 ?auto_143606 ) ) ( not ( = ?auto_143610 ?auto_143608 ) ) ( not ( = ?auto_143611 ?auto_143606 ) ) ( not ( = ?auto_143611 ?auto_143608 ) ) ( not ( = ?auto_143611 ?auto_143610 ) ) ( ON_BOARD ?auto_143613 ?auto_143614 ) ( SUPPORTS ?auto_143613 ?auto_143605 ) ( not ( = ?auto_143608 ?auto_143615 ) ) ( HAVE_IMAGE ?auto_143606 ?auto_143607 ) ( not ( = ?auto_143606 ?auto_143615 ) ) ( not ( = ?auto_143607 ?auto_143605 ) ) ( CALIBRATION_TARGET ?auto_143613 ?auto_143615 ) ( POWER_AVAIL ?auto_143614 ) ( POINTING ?auto_143614 ?auto_143611 ) ( not ( = ?auto_143615 ?auto_143611 ) ) ( HAVE_IMAGE ?auto_143610 ?auto_143609 ) ( HAVE_IMAGE ?auto_143611 ?auto_143612 ) ( not ( = ?auto_143607 ?auto_143609 ) ) ( not ( = ?auto_143607 ?auto_143612 ) ) ( not ( = ?auto_143605 ?auto_143609 ) ) ( not ( = ?auto_143605 ?auto_143612 ) ) ( not ( = ?auto_143610 ?auto_143615 ) ) ( not ( = ?auto_143609 ?auto_143612 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143606 ?auto_143607 ?auto_143608 ?auto_143605 )
      ( GET-4IMAGE-VERIFY ?auto_143606 ?auto_143607 ?auto_143608 ?auto_143605 ?auto_143610 ?auto_143609 ?auto_143611 ?auto_143612 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143640 - DIRECTION
      ?auto_143641 - MODE
      ?auto_143642 - DIRECTION
      ?auto_143639 - MODE
      ?auto_143644 - DIRECTION
      ?auto_143643 - MODE
      ?auto_143645 - DIRECTION
      ?auto_143646 - MODE
    )
    :vars
    (
      ?auto_143647 - INSTRUMENT
      ?auto_143648 - SATELLITE
      ?auto_143649 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_143642 ?auto_143640 ) ) ( not ( = ?auto_143644 ?auto_143640 ) ) ( not ( = ?auto_143644 ?auto_143642 ) ) ( not ( = ?auto_143645 ?auto_143640 ) ) ( not ( = ?auto_143645 ?auto_143642 ) ) ( not ( = ?auto_143645 ?auto_143644 ) ) ( ON_BOARD ?auto_143647 ?auto_143648 ) ( SUPPORTS ?auto_143647 ?auto_143639 ) ( not ( = ?auto_143642 ?auto_143649 ) ) ( HAVE_IMAGE ?auto_143640 ?auto_143641 ) ( not ( = ?auto_143640 ?auto_143649 ) ) ( not ( = ?auto_143641 ?auto_143639 ) ) ( CALIBRATION_TARGET ?auto_143647 ?auto_143649 ) ( POWER_AVAIL ?auto_143648 ) ( POINTING ?auto_143648 ?auto_143644 ) ( not ( = ?auto_143649 ?auto_143644 ) ) ( HAVE_IMAGE ?auto_143644 ?auto_143643 ) ( HAVE_IMAGE ?auto_143645 ?auto_143646 ) ( not ( = ?auto_143641 ?auto_143643 ) ) ( not ( = ?auto_143641 ?auto_143646 ) ) ( not ( = ?auto_143639 ?auto_143643 ) ) ( not ( = ?auto_143639 ?auto_143646 ) ) ( not ( = ?auto_143643 ?auto_143646 ) ) ( not ( = ?auto_143645 ?auto_143649 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143640 ?auto_143641 ?auto_143642 ?auto_143639 )
      ( GET-4IMAGE-VERIFY ?auto_143640 ?auto_143641 ?auto_143642 ?auto_143639 ?auto_143644 ?auto_143643 ?auto_143645 ?auto_143646 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144177 - DIRECTION
      ?auto_144178 - MODE
      ?auto_144179 - DIRECTION
      ?auto_144176 - MODE
      ?auto_144181 - DIRECTION
      ?auto_144180 - MODE
      ?auto_144182 - DIRECTION
      ?auto_144183 - MODE
    )
    :vars
    (
      ?auto_144184 - INSTRUMENT
      ?auto_144185 - SATELLITE
      ?auto_144186 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_144179 ?auto_144177 ) ) ( not ( = ?auto_144181 ?auto_144177 ) ) ( not ( = ?auto_144181 ?auto_144179 ) ) ( not ( = ?auto_144182 ?auto_144177 ) ) ( not ( = ?auto_144182 ?auto_144179 ) ) ( not ( = ?auto_144182 ?auto_144181 ) ) ( ON_BOARD ?auto_144184 ?auto_144185 ) ( SUPPORTS ?auto_144184 ?auto_144183 ) ( not ( = ?auto_144182 ?auto_144186 ) ) ( HAVE_IMAGE ?auto_144179 ?auto_144176 ) ( not ( = ?auto_144179 ?auto_144186 ) ) ( not ( = ?auto_144176 ?auto_144183 ) ) ( CALIBRATION_TARGET ?auto_144184 ?auto_144186 ) ( POWER_AVAIL ?auto_144185 ) ( POINTING ?auto_144185 ?auto_144177 ) ( not ( = ?auto_144186 ?auto_144177 ) ) ( HAVE_IMAGE ?auto_144177 ?auto_144178 ) ( HAVE_IMAGE ?auto_144181 ?auto_144180 ) ( not ( = ?auto_144178 ?auto_144176 ) ) ( not ( = ?auto_144178 ?auto_144180 ) ) ( not ( = ?auto_144178 ?auto_144183 ) ) ( not ( = ?auto_144176 ?auto_144180 ) ) ( not ( = ?auto_144181 ?auto_144186 ) ) ( not ( = ?auto_144180 ?auto_144183 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144179 ?auto_144176 ?auto_144182 ?auto_144183 )
      ( GET-4IMAGE-VERIFY ?auto_144177 ?auto_144178 ?auto_144179 ?auto_144176 ?auto_144181 ?auto_144180 ?auto_144182 ?auto_144183 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144210 - DIRECTION
      ?auto_144211 - MODE
      ?auto_144212 - DIRECTION
      ?auto_144209 - MODE
      ?auto_144214 - DIRECTION
      ?auto_144213 - MODE
      ?auto_144215 - DIRECTION
      ?auto_144216 - MODE
    )
    :vars
    (
      ?auto_144217 - INSTRUMENT
      ?auto_144218 - SATELLITE
      ?auto_144219 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_144212 ?auto_144210 ) ) ( not ( = ?auto_144214 ?auto_144210 ) ) ( not ( = ?auto_144214 ?auto_144212 ) ) ( not ( = ?auto_144215 ?auto_144210 ) ) ( not ( = ?auto_144215 ?auto_144212 ) ) ( not ( = ?auto_144215 ?auto_144214 ) ) ( ON_BOARD ?auto_144217 ?auto_144218 ) ( SUPPORTS ?auto_144217 ?auto_144213 ) ( not ( = ?auto_144214 ?auto_144219 ) ) ( HAVE_IMAGE ?auto_144212 ?auto_144209 ) ( not ( = ?auto_144212 ?auto_144219 ) ) ( not ( = ?auto_144209 ?auto_144213 ) ) ( CALIBRATION_TARGET ?auto_144217 ?auto_144219 ) ( POWER_AVAIL ?auto_144218 ) ( POINTING ?auto_144218 ?auto_144210 ) ( not ( = ?auto_144219 ?auto_144210 ) ) ( HAVE_IMAGE ?auto_144210 ?auto_144211 ) ( HAVE_IMAGE ?auto_144215 ?auto_144216 ) ( not ( = ?auto_144211 ?auto_144209 ) ) ( not ( = ?auto_144211 ?auto_144213 ) ) ( not ( = ?auto_144211 ?auto_144216 ) ) ( not ( = ?auto_144209 ?auto_144216 ) ) ( not ( = ?auto_144213 ?auto_144216 ) ) ( not ( = ?auto_144215 ?auto_144219 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144212 ?auto_144209 ?auto_144214 ?auto_144213 )
      ( GET-4IMAGE-VERIFY ?auto_144210 ?auto_144211 ?auto_144212 ?auto_144209 ?auto_144214 ?auto_144213 ?auto_144215 ?auto_144216 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144422 - DIRECTION
      ?auto_144423 - MODE
      ?auto_144424 - DIRECTION
      ?auto_144421 - MODE
      ?auto_144426 - DIRECTION
      ?auto_144425 - MODE
      ?auto_144427 - DIRECTION
      ?auto_144428 - MODE
    )
    :vars
    (
      ?auto_144429 - INSTRUMENT
      ?auto_144430 - SATELLITE
      ?auto_144431 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_144424 ?auto_144422 ) ) ( not ( = ?auto_144426 ?auto_144422 ) ) ( not ( = ?auto_144426 ?auto_144424 ) ) ( not ( = ?auto_144427 ?auto_144422 ) ) ( not ( = ?auto_144427 ?auto_144424 ) ) ( not ( = ?auto_144427 ?auto_144426 ) ) ( ON_BOARD ?auto_144429 ?auto_144430 ) ( SUPPORTS ?auto_144429 ?auto_144421 ) ( not ( = ?auto_144424 ?auto_144431 ) ) ( HAVE_IMAGE ?auto_144426 ?auto_144425 ) ( not ( = ?auto_144426 ?auto_144431 ) ) ( not ( = ?auto_144425 ?auto_144421 ) ) ( CALIBRATION_TARGET ?auto_144429 ?auto_144431 ) ( POWER_AVAIL ?auto_144430 ) ( POINTING ?auto_144430 ?auto_144422 ) ( not ( = ?auto_144431 ?auto_144422 ) ) ( HAVE_IMAGE ?auto_144422 ?auto_144423 ) ( HAVE_IMAGE ?auto_144427 ?auto_144428 ) ( not ( = ?auto_144423 ?auto_144421 ) ) ( not ( = ?auto_144423 ?auto_144425 ) ) ( not ( = ?auto_144423 ?auto_144428 ) ) ( not ( = ?auto_144421 ?auto_144428 ) ) ( not ( = ?auto_144425 ?auto_144428 ) ) ( not ( = ?auto_144427 ?auto_144431 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144426 ?auto_144425 ?auto_144424 ?auto_144421 )
      ( GET-4IMAGE-VERIFY ?auto_144422 ?auto_144423 ?auto_144424 ?auto_144421 ?auto_144426 ?auto_144425 ?auto_144427 ?auto_144428 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144673 - DIRECTION
      ?auto_144674 - MODE
      ?auto_144675 - DIRECTION
      ?auto_144672 - MODE
      ?auto_144677 - DIRECTION
      ?auto_144676 - MODE
      ?auto_144678 - DIRECTION
      ?auto_144679 - MODE
    )
    :vars
    (
      ?auto_144680 - INSTRUMENT
      ?auto_144681 - SATELLITE
      ?auto_144682 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_144675 ?auto_144673 ) ) ( not ( = ?auto_144677 ?auto_144673 ) ) ( not ( = ?auto_144677 ?auto_144675 ) ) ( not ( = ?auto_144678 ?auto_144673 ) ) ( not ( = ?auto_144678 ?auto_144675 ) ) ( not ( = ?auto_144678 ?auto_144677 ) ) ( ON_BOARD ?auto_144680 ?auto_144681 ) ( SUPPORTS ?auto_144680 ?auto_144674 ) ( not ( = ?auto_144673 ?auto_144682 ) ) ( HAVE_IMAGE ?auto_144675 ?auto_144672 ) ( not ( = ?auto_144675 ?auto_144682 ) ) ( not ( = ?auto_144672 ?auto_144674 ) ) ( CALIBRATION_TARGET ?auto_144680 ?auto_144682 ) ( POWER_AVAIL ?auto_144681 ) ( POINTING ?auto_144681 ?auto_144678 ) ( not ( = ?auto_144682 ?auto_144678 ) ) ( HAVE_IMAGE ?auto_144677 ?auto_144676 ) ( HAVE_IMAGE ?auto_144678 ?auto_144679 ) ( not ( = ?auto_144674 ?auto_144676 ) ) ( not ( = ?auto_144674 ?auto_144679 ) ) ( not ( = ?auto_144672 ?auto_144676 ) ) ( not ( = ?auto_144672 ?auto_144679 ) ) ( not ( = ?auto_144677 ?auto_144682 ) ) ( not ( = ?auto_144676 ?auto_144679 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144675 ?auto_144672 ?auto_144673 ?auto_144674 )
      ( GET-4IMAGE-VERIFY ?auto_144673 ?auto_144674 ?auto_144675 ?auto_144672 ?auto_144677 ?auto_144676 ?auto_144678 ?auto_144679 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144707 - DIRECTION
      ?auto_144708 - MODE
      ?auto_144709 - DIRECTION
      ?auto_144706 - MODE
      ?auto_144711 - DIRECTION
      ?auto_144710 - MODE
      ?auto_144712 - DIRECTION
      ?auto_144713 - MODE
    )
    :vars
    (
      ?auto_144714 - INSTRUMENT
      ?auto_144715 - SATELLITE
      ?auto_144716 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_144709 ?auto_144707 ) ) ( not ( = ?auto_144711 ?auto_144707 ) ) ( not ( = ?auto_144711 ?auto_144709 ) ) ( not ( = ?auto_144712 ?auto_144707 ) ) ( not ( = ?auto_144712 ?auto_144709 ) ) ( not ( = ?auto_144712 ?auto_144711 ) ) ( ON_BOARD ?auto_144714 ?auto_144715 ) ( SUPPORTS ?auto_144714 ?auto_144708 ) ( not ( = ?auto_144707 ?auto_144716 ) ) ( HAVE_IMAGE ?auto_144709 ?auto_144706 ) ( not ( = ?auto_144709 ?auto_144716 ) ) ( not ( = ?auto_144706 ?auto_144708 ) ) ( CALIBRATION_TARGET ?auto_144714 ?auto_144716 ) ( POWER_AVAIL ?auto_144715 ) ( POINTING ?auto_144715 ?auto_144711 ) ( not ( = ?auto_144716 ?auto_144711 ) ) ( HAVE_IMAGE ?auto_144711 ?auto_144710 ) ( HAVE_IMAGE ?auto_144712 ?auto_144713 ) ( not ( = ?auto_144708 ?auto_144710 ) ) ( not ( = ?auto_144708 ?auto_144713 ) ) ( not ( = ?auto_144706 ?auto_144710 ) ) ( not ( = ?auto_144706 ?auto_144713 ) ) ( not ( = ?auto_144710 ?auto_144713 ) ) ( not ( = ?auto_144712 ?auto_144716 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144709 ?auto_144706 ?auto_144707 ?auto_144708 )
      ( GET-4IMAGE-VERIFY ?auto_144707 ?auto_144708 ?auto_144709 ?auto_144706 ?auto_144711 ?auto_144710 ?auto_144712 ?auto_144713 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144995 - DIRECTION
      ?auto_144996 - MODE
      ?auto_144997 - DIRECTION
      ?auto_144994 - MODE
      ?auto_144999 - DIRECTION
      ?auto_144998 - MODE
      ?auto_145000 - DIRECTION
      ?auto_145001 - MODE
    )
    :vars
    (
      ?auto_145002 - INSTRUMENT
      ?auto_145003 - SATELLITE
      ?auto_145004 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_144997 ?auto_144995 ) ) ( not ( = ?auto_144999 ?auto_144995 ) ) ( not ( = ?auto_144999 ?auto_144997 ) ) ( not ( = ?auto_145000 ?auto_144995 ) ) ( not ( = ?auto_145000 ?auto_144997 ) ) ( not ( = ?auto_145000 ?auto_144999 ) ) ( ON_BOARD ?auto_145002 ?auto_145003 ) ( SUPPORTS ?auto_145002 ?auto_144996 ) ( not ( = ?auto_144995 ?auto_145004 ) ) ( HAVE_IMAGE ?auto_144999 ?auto_144998 ) ( not ( = ?auto_144999 ?auto_145004 ) ) ( not ( = ?auto_144998 ?auto_144996 ) ) ( CALIBRATION_TARGET ?auto_145002 ?auto_145004 ) ( POWER_AVAIL ?auto_145003 ) ( POINTING ?auto_145003 ?auto_144997 ) ( not ( = ?auto_145004 ?auto_144997 ) ) ( HAVE_IMAGE ?auto_144997 ?auto_144994 ) ( HAVE_IMAGE ?auto_145000 ?auto_145001 ) ( not ( = ?auto_144996 ?auto_144994 ) ) ( not ( = ?auto_144996 ?auto_145001 ) ) ( not ( = ?auto_144994 ?auto_144998 ) ) ( not ( = ?auto_144994 ?auto_145001 ) ) ( not ( = ?auto_144998 ?auto_145001 ) ) ( not ( = ?auto_145000 ?auto_145004 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144999 ?auto_144998 ?auto_144995 ?auto_144996 )
      ( GET-4IMAGE-VERIFY ?auto_144995 ?auto_144996 ?auto_144997 ?auto_144994 ?auto_144999 ?auto_144998 ?auto_145000 ?auto_145001 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_145455 - DIRECTION
      ?auto_145456 - MODE
      ?auto_145457 - DIRECTION
      ?auto_145454 - MODE
      ?auto_145459 - DIRECTION
      ?auto_145458 - MODE
    )
    :vars
    (
      ?auto_145460 - INSTRUMENT
      ?auto_145463 - SATELLITE
      ?auto_145461 - DIRECTION
      ?auto_145462 - DIRECTION
      ?auto_145464 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_145457 ?auto_145455 ) ) ( not ( = ?auto_145459 ?auto_145455 ) ) ( not ( = ?auto_145459 ?auto_145457 ) ) ( ON_BOARD ?auto_145460 ?auto_145463 ) ( SUPPORTS ?auto_145460 ?auto_145458 ) ( not ( = ?auto_145459 ?auto_145461 ) ) ( HAVE_IMAGE ?auto_145455 ?auto_145456 ) ( not ( = ?auto_145455 ?auto_145461 ) ) ( not ( = ?auto_145456 ?auto_145458 ) ) ( CALIBRATION_TARGET ?auto_145460 ?auto_145461 ) ( POINTING ?auto_145463 ?auto_145462 ) ( not ( = ?auto_145461 ?auto_145462 ) ) ( not ( = ?auto_145459 ?auto_145462 ) ) ( not ( = ?auto_145455 ?auto_145462 ) ) ( ON_BOARD ?auto_145464 ?auto_145463 ) ( POWER_ON ?auto_145464 ) ( not ( = ?auto_145460 ?auto_145464 ) ) ( HAVE_IMAGE ?auto_145457 ?auto_145454 ) ( not ( = ?auto_145456 ?auto_145454 ) ) ( not ( = ?auto_145457 ?auto_145461 ) ) ( not ( = ?auto_145457 ?auto_145462 ) ) ( not ( = ?auto_145454 ?auto_145458 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145455 ?auto_145456 ?auto_145459 ?auto_145458 )
      ( GET-3IMAGE-VERIFY ?auto_145455 ?auto_145456 ?auto_145457 ?auto_145454 ?auto_145459 ?auto_145458 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_145487 - DIRECTION
      ?auto_145488 - MODE
      ?auto_145489 - DIRECTION
      ?auto_145486 - MODE
      ?auto_145491 - DIRECTION
      ?auto_145490 - MODE
    )
    :vars
    (
      ?auto_145492 - INSTRUMENT
      ?auto_145495 - SATELLITE
      ?auto_145493 - DIRECTION
      ?auto_145494 - DIRECTION
      ?auto_145496 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_145489 ?auto_145487 ) ) ( not ( = ?auto_145491 ?auto_145487 ) ) ( not ( = ?auto_145491 ?auto_145489 ) ) ( ON_BOARD ?auto_145492 ?auto_145495 ) ( SUPPORTS ?auto_145492 ?auto_145486 ) ( not ( = ?auto_145489 ?auto_145493 ) ) ( HAVE_IMAGE ?auto_145487 ?auto_145488 ) ( not ( = ?auto_145487 ?auto_145493 ) ) ( not ( = ?auto_145488 ?auto_145486 ) ) ( CALIBRATION_TARGET ?auto_145492 ?auto_145493 ) ( POINTING ?auto_145495 ?auto_145494 ) ( not ( = ?auto_145493 ?auto_145494 ) ) ( not ( = ?auto_145489 ?auto_145494 ) ) ( not ( = ?auto_145487 ?auto_145494 ) ) ( ON_BOARD ?auto_145496 ?auto_145495 ) ( POWER_ON ?auto_145496 ) ( not ( = ?auto_145492 ?auto_145496 ) ) ( HAVE_IMAGE ?auto_145491 ?auto_145490 ) ( not ( = ?auto_145488 ?auto_145490 ) ) ( not ( = ?auto_145486 ?auto_145490 ) ) ( not ( = ?auto_145491 ?auto_145493 ) ) ( not ( = ?auto_145491 ?auto_145494 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145487 ?auto_145488 ?auto_145489 ?auto_145486 )
      ( GET-3IMAGE-VERIFY ?auto_145487 ?auto_145488 ?auto_145489 ?auto_145486 ?auto_145491 ?auto_145490 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_145661 - DIRECTION
      ?auto_145662 - MODE
      ?auto_145663 - DIRECTION
      ?auto_145660 - MODE
      ?auto_145665 - DIRECTION
      ?auto_145664 - MODE
    )
    :vars
    (
      ?auto_145666 - INSTRUMENT
      ?auto_145669 - SATELLITE
      ?auto_145667 - DIRECTION
      ?auto_145668 - DIRECTION
      ?auto_145670 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_145663 ?auto_145661 ) ) ( not ( = ?auto_145665 ?auto_145661 ) ) ( not ( = ?auto_145665 ?auto_145663 ) ) ( ON_BOARD ?auto_145666 ?auto_145669 ) ( SUPPORTS ?auto_145666 ?auto_145662 ) ( not ( = ?auto_145661 ?auto_145667 ) ) ( HAVE_IMAGE ?auto_145663 ?auto_145660 ) ( not ( = ?auto_145663 ?auto_145667 ) ) ( not ( = ?auto_145660 ?auto_145662 ) ) ( CALIBRATION_TARGET ?auto_145666 ?auto_145667 ) ( POINTING ?auto_145669 ?auto_145668 ) ( not ( = ?auto_145667 ?auto_145668 ) ) ( not ( = ?auto_145661 ?auto_145668 ) ) ( not ( = ?auto_145663 ?auto_145668 ) ) ( ON_BOARD ?auto_145670 ?auto_145669 ) ( POWER_ON ?auto_145670 ) ( not ( = ?auto_145666 ?auto_145670 ) ) ( HAVE_IMAGE ?auto_145665 ?auto_145664 ) ( not ( = ?auto_145662 ?auto_145664 ) ) ( not ( = ?auto_145660 ?auto_145664 ) ) ( not ( = ?auto_145665 ?auto_145667 ) ) ( not ( = ?auto_145665 ?auto_145668 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145663 ?auto_145660 ?auto_145661 ?auto_145662 )
      ( GET-3IMAGE-VERIFY ?auto_145661 ?auto_145662 ?auto_145663 ?auto_145660 ?auto_145665 ?auto_145664 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_145935 - DIRECTION
      ?auto_145936 - MODE
      ?auto_145937 - DIRECTION
      ?auto_145934 - MODE
      ?auto_145939 - DIRECTION
      ?auto_145938 - MODE
      ?auto_145940 - DIRECTION
      ?auto_145941 - MODE
    )
    :vars
    (
      ?auto_145942 - INSTRUMENT
      ?auto_145944 - SATELLITE
      ?auto_145943 - DIRECTION
      ?auto_145945 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_145937 ?auto_145935 ) ) ( not ( = ?auto_145939 ?auto_145935 ) ) ( not ( = ?auto_145939 ?auto_145937 ) ) ( not ( = ?auto_145940 ?auto_145935 ) ) ( not ( = ?auto_145940 ?auto_145937 ) ) ( not ( = ?auto_145940 ?auto_145939 ) ) ( ON_BOARD ?auto_145942 ?auto_145944 ) ( SUPPORTS ?auto_145942 ?auto_145941 ) ( not ( = ?auto_145940 ?auto_145943 ) ) ( HAVE_IMAGE ?auto_145935 ?auto_145936 ) ( not ( = ?auto_145935 ?auto_145943 ) ) ( not ( = ?auto_145936 ?auto_145941 ) ) ( CALIBRATION_TARGET ?auto_145942 ?auto_145943 ) ( POINTING ?auto_145944 ?auto_145939 ) ( not ( = ?auto_145943 ?auto_145939 ) ) ( ON_BOARD ?auto_145945 ?auto_145944 ) ( POWER_ON ?auto_145945 ) ( not ( = ?auto_145942 ?auto_145945 ) ) ( HAVE_IMAGE ?auto_145937 ?auto_145934 ) ( HAVE_IMAGE ?auto_145939 ?auto_145938 ) ( not ( = ?auto_145936 ?auto_145934 ) ) ( not ( = ?auto_145936 ?auto_145938 ) ) ( not ( = ?auto_145937 ?auto_145943 ) ) ( not ( = ?auto_145934 ?auto_145938 ) ) ( not ( = ?auto_145934 ?auto_145941 ) ) ( not ( = ?auto_145938 ?auto_145941 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145935 ?auto_145936 ?auto_145940 ?auto_145941 )
      ( GET-4IMAGE-VERIFY ?auto_145935 ?auto_145936 ?auto_145937 ?auto_145934 ?auto_145939 ?auto_145938 ?auto_145940 ?auto_145941 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_145973 - DIRECTION
      ?auto_145974 - MODE
      ?auto_145975 - DIRECTION
      ?auto_145972 - MODE
      ?auto_145977 - DIRECTION
      ?auto_145976 - MODE
      ?auto_145978 - DIRECTION
      ?auto_145979 - MODE
    )
    :vars
    (
      ?auto_145980 - INSTRUMENT
      ?auto_145982 - SATELLITE
      ?auto_145981 - DIRECTION
      ?auto_145983 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_145975 ?auto_145973 ) ) ( not ( = ?auto_145977 ?auto_145973 ) ) ( not ( = ?auto_145977 ?auto_145975 ) ) ( not ( = ?auto_145978 ?auto_145973 ) ) ( not ( = ?auto_145978 ?auto_145975 ) ) ( not ( = ?auto_145978 ?auto_145977 ) ) ( ON_BOARD ?auto_145980 ?auto_145982 ) ( SUPPORTS ?auto_145980 ?auto_145976 ) ( not ( = ?auto_145977 ?auto_145981 ) ) ( HAVE_IMAGE ?auto_145973 ?auto_145974 ) ( not ( = ?auto_145973 ?auto_145981 ) ) ( not ( = ?auto_145974 ?auto_145976 ) ) ( CALIBRATION_TARGET ?auto_145980 ?auto_145981 ) ( POINTING ?auto_145982 ?auto_145978 ) ( not ( = ?auto_145981 ?auto_145978 ) ) ( ON_BOARD ?auto_145983 ?auto_145982 ) ( POWER_ON ?auto_145983 ) ( not ( = ?auto_145980 ?auto_145983 ) ) ( HAVE_IMAGE ?auto_145975 ?auto_145972 ) ( HAVE_IMAGE ?auto_145978 ?auto_145979 ) ( not ( = ?auto_145974 ?auto_145972 ) ) ( not ( = ?auto_145974 ?auto_145979 ) ) ( not ( = ?auto_145975 ?auto_145981 ) ) ( not ( = ?auto_145972 ?auto_145976 ) ) ( not ( = ?auto_145972 ?auto_145979 ) ) ( not ( = ?auto_145976 ?auto_145979 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145973 ?auto_145974 ?auto_145977 ?auto_145976 )
      ( GET-4IMAGE-VERIFY ?auto_145973 ?auto_145974 ?auto_145975 ?auto_145972 ?auto_145977 ?auto_145976 ?auto_145978 ?auto_145979 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146010 - DIRECTION
      ?auto_146011 - MODE
      ?auto_146012 - DIRECTION
      ?auto_146009 - MODE
      ?auto_146014 - DIRECTION
      ?auto_146013 - MODE
      ?auto_146015 - DIRECTION
      ?auto_146016 - MODE
    )
    :vars
    (
      ?auto_146017 - INSTRUMENT
      ?auto_146019 - SATELLITE
      ?auto_146018 - DIRECTION
      ?auto_146020 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_146012 ?auto_146010 ) ) ( not ( = ?auto_146014 ?auto_146010 ) ) ( not ( = ?auto_146014 ?auto_146012 ) ) ( not ( = ?auto_146015 ?auto_146010 ) ) ( not ( = ?auto_146015 ?auto_146012 ) ) ( not ( = ?auto_146015 ?auto_146014 ) ) ( ON_BOARD ?auto_146017 ?auto_146019 ) ( SUPPORTS ?auto_146017 ?auto_146016 ) ( not ( = ?auto_146015 ?auto_146018 ) ) ( HAVE_IMAGE ?auto_146010 ?auto_146011 ) ( not ( = ?auto_146010 ?auto_146018 ) ) ( not ( = ?auto_146011 ?auto_146016 ) ) ( CALIBRATION_TARGET ?auto_146017 ?auto_146018 ) ( POINTING ?auto_146019 ?auto_146012 ) ( not ( = ?auto_146018 ?auto_146012 ) ) ( ON_BOARD ?auto_146020 ?auto_146019 ) ( POWER_ON ?auto_146020 ) ( not ( = ?auto_146017 ?auto_146020 ) ) ( HAVE_IMAGE ?auto_146012 ?auto_146009 ) ( HAVE_IMAGE ?auto_146014 ?auto_146013 ) ( not ( = ?auto_146011 ?auto_146009 ) ) ( not ( = ?auto_146011 ?auto_146013 ) ) ( not ( = ?auto_146009 ?auto_146013 ) ) ( not ( = ?auto_146009 ?auto_146016 ) ) ( not ( = ?auto_146014 ?auto_146018 ) ) ( not ( = ?auto_146013 ?auto_146016 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146010 ?auto_146011 ?auto_146015 ?auto_146016 )
      ( GET-4IMAGE-VERIFY ?auto_146010 ?auto_146011 ?auto_146012 ?auto_146009 ?auto_146014 ?auto_146013 ?auto_146015 ?auto_146016 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146046 - DIRECTION
      ?auto_146047 - MODE
      ?auto_146048 - DIRECTION
      ?auto_146045 - MODE
      ?auto_146050 - DIRECTION
      ?auto_146049 - MODE
      ?auto_146051 - DIRECTION
      ?auto_146052 - MODE
    )
    :vars
    (
      ?auto_146053 - INSTRUMENT
      ?auto_146055 - SATELLITE
      ?auto_146054 - DIRECTION
      ?auto_146056 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_146048 ?auto_146046 ) ) ( not ( = ?auto_146050 ?auto_146046 ) ) ( not ( = ?auto_146050 ?auto_146048 ) ) ( not ( = ?auto_146051 ?auto_146046 ) ) ( not ( = ?auto_146051 ?auto_146048 ) ) ( not ( = ?auto_146051 ?auto_146050 ) ) ( ON_BOARD ?auto_146053 ?auto_146055 ) ( SUPPORTS ?auto_146053 ?auto_146049 ) ( not ( = ?auto_146050 ?auto_146054 ) ) ( HAVE_IMAGE ?auto_146046 ?auto_146047 ) ( not ( = ?auto_146046 ?auto_146054 ) ) ( not ( = ?auto_146047 ?auto_146049 ) ) ( CALIBRATION_TARGET ?auto_146053 ?auto_146054 ) ( POINTING ?auto_146055 ?auto_146048 ) ( not ( = ?auto_146054 ?auto_146048 ) ) ( ON_BOARD ?auto_146056 ?auto_146055 ) ( POWER_ON ?auto_146056 ) ( not ( = ?auto_146053 ?auto_146056 ) ) ( HAVE_IMAGE ?auto_146048 ?auto_146045 ) ( HAVE_IMAGE ?auto_146051 ?auto_146052 ) ( not ( = ?auto_146047 ?auto_146045 ) ) ( not ( = ?auto_146047 ?auto_146052 ) ) ( not ( = ?auto_146045 ?auto_146049 ) ) ( not ( = ?auto_146045 ?auto_146052 ) ) ( not ( = ?auto_146049 ?auto_146052 ) ) ( not ( = ?auto_146051 ?auto_146054 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146046 ?auto_146047 ?auto_146050 ?auto_146049 )
      ( GET-4IMAGE-VERIFY ?auto_146046 ?auto_146047 ?auto_146048 ?auto_146045 ?auto_146050 ?auto_146049 ?auto_146051 ?auto_146052 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146159 - DIRECTION
      ?auto_146160 - MODE
      ?auto_146161 - DIRECTION
      ?auto_146158 - MODE
      ?auto_146163 - DIRECTION
      ?auto_146162 - MODE
      ?auto_146164 - DIRECTION
      ?auto_146165 - MODE
    )
    :vars
    (
      ?auto_146166 - INSTRUMENT
      ?auto_146168 - SATELLITE
      ?auto_146167 - DIRECTION
      ?auto_146169 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_146161 ?auto_146159 ) ) ( not ( = ?auto_146163 ?auto_146159 ) ) ( not ( = ?auto_146163 ?auto_146161 ) ) ( not ( = ?auto_146164 ?auto_146159 ) ) ( not ( = ?auto_146164 ?auto_146161 ) ) ( not ( = ?auto_146164 ?auto_146163 ) ) ( ON_BOARD ?auto_146166 ?auto_146168 ) ( SUPPORTS ?auto_146166 ?auto_146158 ) ( not ( = ?auto_146161 ?auto_146167 ) ) ( HAVE_IMAGE ?auto_146159 ?auto_146160 ) ( not ( = ?auto_146159 ?auto_146167 ) ) ( not ( = ?auto_146160 ?auto_146158 ) ) ( CALIBRATION_TARGET ?auto_146166 ?auto_146167 ) ( POINTING ?auto_146168 ?auto_146164 ) ( not ( = ?auto_146167 ?auto_146164 ) ) ( ON_BOARD ?auto_146169 ?auto_146168 ) ( POWER_ON ?auto_146169 ) ( not ( = ?auto_146166 ?auto_146169 ) ) ( HAVE_IMAGE ?auto_146163 ?auto_146162 ) ( HAVE_IMAGE ?auto_146164 ?auto_146165 ) ( not ( = ?auto_146160 ?auto_146162 ) ) ( not ( = ?auto_146160 ?auto_146165 ) ) ( not ( = ?auto_146158 ?auto_146162 ) ) ( not ( = ?auto_146158 ?auto_146165 ) ) ( not ( = ?auto_146163 ?auto_146167 ) ) ( not ( = ?auto_146162 ?auto_146165 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146159 ?auto_146160 ?auto_146161 ?auto_146158 )
      ( GET-4IMAGE-VERIFY ?auto_146159 ?auto_146160 ?auto_146161 ?auto_146158 ?auto_146163 ?auto_146162 ?auto_146164 ?auto_146165 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146196 - DIRECTION
      ?auto_146197 - MODE
      ?auto_146198 - DIRECTION
      ?auto_146195 - MODE
      ?auto_146200 - DIRECTION
      ?auto_146199 - MODE
      ?auto_146201 - DIRECTION
      ?auto_146202 - MODE
    )
    :vars
    (
      ?auto_146203 - INSTRUMENT
      ?auto_146205 - SATELLITE
      ?auto_146204 - DIRECTION
      ?auto_146206 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_146198 ?auto_146196 ) ) ( not ( = ?auto_146200 ?auto_146196 ) ) ( not ( = ?auto_146200 ?auto_146198 ) ) ( not ( = ?auto_146201 ?auto_146196 ) ) ( not ( = ?auto_146201 ?auto_146198 ) ) ( not ( = ?auto_146201 ?auto_146200 ) ) ( ON_BOARD ?auto_146203 ?auto_146205 ) ( SUPPORTS ?auto_146203 ?auto_146195 ) ( not ( = ?auto_146198 ?auto_146204 ) ) ( HAVE_IMAGE ?auto_146196 ?auto_146197 ) ( not ( = ?auto_146196 ?auto_146204 ) ) ( not ( = ?auto_146197 ?auto_146195 ) ) ( CALIBRATION_TARGET ?auto_146203 ?auto_146204 ) ( POINTING ?auto_146205 ?auto_146200 ) ( not ( = ?auto_146204 ?auto_146200 ) ) ( ON_BOARD ?auto_146206 ?auto_146205 ) ( POWER_ON ?auto_146206 ) ( not ( = ?auto_146203 ?auto_146206 ) ) ( HAVE_IMAGE ?auto_146200 ?auto_146199 ) ( HAVE_IMAGE ?auto_146201 ?auto_146202 ) ( not ( = ?auto_146197 ?auto_146199 ) ) ( not ( = ?auto_146197 ?auto_146202 ) ) ( not ( = ?auto_146195 ?auto_146199 ) ) ( not ( = ?auto_146195 ?auto_146202 ) ) ( not ( = ?auto_146199 ?auto_146202 ) ) ( not ( = ?auto_146201 ?auto_146204 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146196 ?auto_146197 ?auto_146198 ?auto_146195 )
      ( GET-4IMAGE-VERIFY ?auto_146196 ?auto_146197 ?auto_146198 ?auto_146195 ?auto_146200 ?auto_146199 ?auto_146201 ?auto_146202 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146772 - DIRECTION
      ?auto_146773 - MODE
      ?auto_146774 - DIRECTION
      ?auto_146771 - MODE
      ?auto_146776 - DIRECTION
      ?auto_146775 - MODE
      ?auto_146777 - DIRECTION
      ?auto_146778 - MODE
    )
    :vars
    (
      ?auto_146779 - INSTRUMENT
      ?auto_146781 - SATELLITE
      ?auto_146780 - DIRECTION
      ?auto_146782 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_146774 ?auto_146772 ) ) ( not ( = ?auto_146776 ?auto_146772 ) ) ( not ( = ?auto_146776 ?auto_146774 ) ) ( not ( = ?auto_146777 ?auto_146772 ) ) ( not ( = ?auto_146777 ?auto_146774 ) ) ( not ( = ?auto_146777 ?auto_146776 ) ) ( ON_BOARD ?auto_146779 ?auto_146781 ) ( SUPPORTS ?auto_146779 ?auto_146778 ) ( not ( = ?auto_146777 ?auto_146780 ) ) ( HAVE_IMAGE ?auto_146774 ?auto_146771 ) ( not ( = ?auto_146774 ?auto_146780 ) ) ( not ( = ?auto_146771 ?auto_146778 ) ) ( CALIBRATION_TARGET ?auto_146779 ?auto_146780 ) ( POINTING ?auto_146781 ?auto_146772 ) ( not ( = ?auto_146780 ?auto_146772 ) ) ( ON_BOARD ?auto_146782 ?auto_146781 ) ( POWER_ON ?auto_146782 ) ( not ( = ?auto_146779 ?auto_146782 ) ) ( HAVE_IMAGE ?auto_146772 ?auto_146773 ) ( HAVE_IMAGE ?auto_146776 ?auto_146775 ) ( not ( = ?auto_146773 ?auto_146771 ) ) ( not ( = ?auto_146773 ?auto_146775 ) ) ( not ( = ?auto_146773 ?auto_146778 ) ) ( not ( = ?auto_146771 ?auto_146775 ) ) ( not ( = ?auto_146776 ?auto_146780 ) ) ( not ( = ?auto_146775 ?auto_146778 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146774 ?auto_146771 ?auto_146777 ?auto_146778 )
      ( GET-4IMAGE-VERIFY ?auto_146772 ?auto_146773 ?auto_146774 ?auto_146771 ?auto_146776 ?auto_146775 ?auto_146777 ?auto_146778 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146808 - DIRECTION
      ?auto_146809 - MODE
      ?auto_146810 - DIRECTION
      ?auto_146807 - MODE
      ?auto_146812 - DIRECTION
      ?auto_146811 - MODE
      ?auto_146813 - DIRECTION
      ?auto_146814 - MODE
    )
    :vars
    (
      ?auto_146815 - INSTRUMENT
      ?auto_146817 - SATELLITE
      ?auto_146816 - DIRECTION
      ?auto_146818 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_146810 ?auto_146808 ) ) ( not ( = ?auto_146812 ?auto_146808 ) ) ( not ( = ?auto_146812 ?auto_146810 ) ) ( not ( = ?auto_146813 ?auto_146808 ) ) ( not ( = ?auto_146813 ?auto_146810 ) ) ( not ( = ?auto_146813 ?auto_146812 ) ) ( ON_BOARD ?auto_146815 ?auto_146817 ) ( SUPPORTS ?auto_146815 ?auto_146811 ) ( not ( = ?auto_146812 ?auto_146816 ) ) ( HAVE_IMAGE ?auto_146810 ?auto_146807 ) ( not ( = ?auto_146810 ?auto_146816 ) ) ( not ( = ?auto_146807 ?auto_146811 ) ) ( CALIBRATION_TARGET ?auto_146815 ?auto_146816 ) ( POINTING ?auto_146817 ?auto_146808 ) ( not ( = ?auto_146816 ?auto_146808 ) ) ( ON_BOARD ?auto_146818 ?auto_146817 ) ( POWER_ON ?auto_146818 ) ( not ( = ?auto_146815 ?auto_146818 ) ) ( HAVE_IMAGE ?auto_146808 ?auto_146809 ) ( HAVE_IMAGE ?auto_146813 ?auto_146814 ) ( not ( = ?auto_146809 ?auto_146807 ) ) ( not ( = ?auto_146809 ?auto_146811 ) ) ( not ( = ?auto_146809 ?auto_146814 ) ) ( not ( = ?auto_146807 ?auto_146814 ) ) ( not ( = ?auto_146811 ?auto_146814 ) ) ( not ( = ?auto_146813 ?auto_146816 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146810 ?auto_146807 ?auto_146812 ?auto_146811 )
      ( GET-4IMAGE-VERIFY ?auto_146808 ?auto_146809 ?auto_146810 ?auto_146807 ?auto_146812 ?auto_146811 ?auto_146813 ?auto_146814 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_147036 - DIRECTION
      ?auto_147037 - MODE
      ?auto_147038 - DIRECTION
      ?auto_147035 - MODE
      ?auto_147040 - DIRECTION
      ?auto_147039 - MODE
      ?auto_147041 - DIRECTION
      ?auto_147042 - MODE
    )
    :vars
    (
      ?auto_147043 - INSTRUMENT
      ?auto_147045 - SATELLITE
      ?auto_147044 - DIRECTION
      ?auto_147046 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_147038 ?auto_147036 ) ) ( not ( = ?auto_147040 ?auto_147036 ) ) ( not ( = ?auto_147040 ?auto_147038 ) ) ( not ( = ?auto_147041 ?auto_147036 ) ) ( not ( = ?auto_147041 ?auto_147038 ) ) ( not ( = ?auto_147041 ?auto_147040 ) ) ( ON_BOARD ?auto_147043 ?auto_147045 ) ( SUPPORTS ?auto_147043 ?auto_147035 ) ( not ( = ?auto_147038 ?auto_147044 ) ) ( HAVE_IMAGE ?auto_147040 ?auto_147039 ) ( not ( = ?auto_147040 ?auto_147044 ) ) ( not ( = ?auto_147039 ?auto_147035 ) ) ( CALIBRATION_TARGET ?auto_147043 ?auto_147044 ) ( POINTING ?auto_147045 ?auto_147036 ) ( not ( = ?auto_147044 ?auto_147036 ) ) ( ON_BOARD ?auto_147046 ?auto_147045 ) ( POWER_ON ?auto_147046 ) ( not ( = ?auto_147043 ?auto_147046 ) ) ( HAVE_IMAGE ?auto_147036 ?auto_147037 ) ( HAVE_IMAGE ?auto_147041 ?auto_147042 ) ( not ( = ?auto_147037 ?auto_147035 ) ) ( not ( = ?auto_147037 ?auto_147039 ) ) ( not ( = ?auto_147037 ?auto_147042 ) ) ( not ( = ?auto_147035 ?auto_147042 ) ) ( not ( = ?auto_147039 ?auto_147042 ) ) ( not ( = ?auto_147041 ?auto_147044 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_147040 ?auto_147039 ?auto_147038 ?auto_147035 )
      ( GET-4IMAGE-VERIFY ?auto_147036 ?auto_147037 ?auto_147038 ?auto_147035 ?auto_147040 ?auto_147039 ?auto_147041 ?auto_147042 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_147307 - DIRECTION
      ?auto_147308 - MODE
      ?auto_147309 - DIRECTION
      ?auto_147306 - MODE
      ?auto_147311 - DIRECTION
      ?auto_147310 - MODE
      ?auto_147312 - DIRECTION
      ?auto_147313 - MODE
    )
    :vars
    (
      ?auto_147314 - INSTRUMENT
      ?auto_147316 - SATELLITE
      ?auto_147315 - DIRECTION
      ?auto_147317 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_147309 ?auto_147307 ) ) ( not ( = ?auto_147311 ?auto_147307 ) ) ( not ( = ?auto_147311 ?auto_147309 ) ) ( not ( = ?auto_147312 ?auto_147307 ) ) ( not ( = ?auto_147312 ?auto_147309 ) ) ( not ( = ?auto_147312 ?auto_147311 ) ) ( ON_BOARD ?auto_147314 ?auto_147316 ) ( SUPPORTS ?auto_147314 ?auto_147308 ) ( not ( = ?auto_147307 ?auto_147315 ) ) ( HAVE_IMAGE ?auto_147309 ?auto_147306 ) ( not ( = ?auto_147309 ?auto_147315 ) ) ( not ( = ?auto_147306 ?auto_147308 ) ) ( CALIBRATION_TARGET ?auto_147314 ?auto_147315 ) ( POINTING ?auto_147316 ?auto_147312 ) ( not ( = ?auto_147315 ?auto_147312 ) ) ( ON_BOARD ?auto_147317 ?auto_147316 ) ( POWER_ON ?auto_147317 ) ( not ( = ?auto_147314 ?auto_147317 ) ) ( HAVE_IMAGE ?auto_147311 ?auto_147310 ) ( HAVE_IMAGE ?auto_147312 ?auto_147313 ) ( not ( = ?auto_147308 ?auto_147310 ) ) ( not ( = ?auto_147308 ?auto_147313 ) ) ( not ( = ?auto_147306 ?auto_147310 ) ) ( not ( = ?auto_147306 ?auto_147313 ) ) ( not ( = ?auto_147311 ?auto_147315 ) ) ( not ( = ?auto_147310 ?auto_147313 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_147309 ?auto_147306 ?auto_147307 ?auto_147308 )
      ( GET-4IMAGE-VERIFY ?auto_147307 ?auto_147308 ?auto_147309 ?auto_147306 ?auto_147311 ?auto_147310 ?auto_147312 ?auto_147313 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_147344 - DIRECTION
      ?auto_147345 - MODE
      ?auto_147346 - DIRECTION
      ?auto_147343 - MODE
      ?auto_147348 - DIRECTION
      ?auto_147347 - MODE
      ?auto_147349 - DIRECTION
      ?auto_147350 - MODE
    )
    :vars
    (
      ?auto_147351 - INSTRUMENT
      ?auto_147353 - SATELLITE
      ?auto_147352 - DIRECTION
      ?auto_147354 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_147346 ?auto_147344 ) ) ( not ( = ?auto_147348 ?auto_147344 ) ) ( not ( = ?auto_147348 ?auto_147346 ) ) ( not ( = ?auto_147349 ?auto_147344 ) ) ( not ( = ?auto_147349 ?auto_147346 ) ) ( not ( = ?auto_147349 ?auto_147348 ) ) ( ON_BOARD ?auto_147351 ?auto_147353 ) ( SUPPORTS ?auto_147351 ?auto_147345 ) ( not ( = ?auto_147344 ?auto_147352 ) ) ( HAVE_IMAGE ?auto_147346 ?auto_147343 ) ( not ( = ?auto_147346 ?auto_147352 ) ) ( not ( = ?auto_147343 ?auto_147345 ) ) ( CALIBRATION_TARGET ?auto_147351 ?auto_147352 ) ( POINTING ?auto_147353 ?auto_147348 ) ( not ( = ?auto_147352 ?auto_147348 ) ) ( ON_BOARD ?auto_147354 ?auto_147353 ) ( POWER_ON ?auto_147354 ) ( not ( = ?auto_147351 ?auto_147354 ) ) ( HAVE_IMAGE ?auto_147348 ?auto_147347 ) ( HAVE_IMAGE ?auto_147349 ?auto_147350 ) ( not ( = ?auto_147345 ?auto_147347 ) ) ( not ( = ?auto_147345 ?auto_147350 ) ) ( not ( = ?auto_147343 ?auto_147347 ) ) ( not ( = ?auto_147343 ?auto_147350 ) ) ( not ( = ?auto_147347 ?auto_147350 ) ) ( not ( = ?auto_147349 ?auto_147352 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_147346 ?auto_147343 ?auto_147344 ?auto_147345 )
      ( GET-4IMAGE-VERIFY ?auto_147344 ?auto_147345 ?auto_147346 ?auto_147343 ?auto_147348 ?auto_147347 ?auto_147349 ?auto_147350 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_147654 - DIRECTION
      ?auto_147655 - MODE
      ?auto_147656 - DIRECTION
      ?auto_147653 - MODE
      ?auto_147658 - DIRECTION
      ?auto_147657 - MODE
      ?auto_147659 - DIRECTION
      ?auto_147660 - MODE
    )
    :vars
    (
      ?auto_147661 - INSTRUMENT
      ?auto_147663 - SATELLITE
      ?auto_147662 - DIRECTION
      ?auto_147664 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_147656 ?auto_147654 ) ) ( not ( = ?auto_147658 ?auto_147654 ) ) ( not ( = ?auto_147658 ?auto_147656 ) ) ( not ( = ?auto_147659 ?auto_147654 ) ) ( not ( = ?auto_147659 ?auto_147656 ) ) ( not ( = ?auto_147659 ?auto_147658 ) ) ( ON_BOARD ?auto_147661 ?auto_147663 ) ( SUPPORTS ?auto_147661 ?auto_147655 ) ( not ( = ?auto_147654 ?auto_147662 ) ) ( HAVE_IMAGE ?auto_147658 ?auto_147657 ) ( not ( = ?auto_147658 ?auto_147662 ) ) ( not ( = ?auto_147657 ?auto_147655 ) ) ( CALIBRATION_TARGET ?auto_147661 ?auto_147662 ) ( POINTING ?auto_147663 ?auto_147656 ) ( not ( = ?auto_147662 ?auto_147656 ) ) ( ON_BOARD ?auto_147664 ?auto_147663 ) ( POWER_ON ?auto_147664 ) ( not ( = ?auto_147661 ?auto_147664 ) ) ( HAVE_IMAGE ?auto_147656 ?auto_147653 ) ( HAVE_IMAGE ?auto_147659 ?auto_147660 ) ( not ( = ?auto_147655 ?auto_147653 ) ) ( not ( = ?auto_147655 ?auto_147660 ) ) ( not ( = ?auto_147653 ?auto_147657 ) ) ( not ( = ?auto_147653 ?auto_147660 ) ) ( not ( = ?auto_147657 ?auto_147660 ) ) ( not ( = ?auto_147659 ?auto_147662 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_147658 ?auto_147657 ?auto_147654 ?auto_147655 )
      ( GET-4IMAGE-VERIFY ?auto_147654 ?auto_147655 ?auto_147656 ?auto_147653 ?auto_147658 ?auto_147657 ?auto_147659 ?auto_147660 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_153658 - DIRECTION
      ?auto_153659 - MODE
      ?auto_153660 - DIRECTION
      ?auto_153657 - MODE
      ?auto_153662 - DIRECTION
      ?auto_153661 - MODE
    )
    :vars
    (
      ?auto_153666 - INSTRUMENT
      ?auto_153665 - SATELLITE
      ?auto_153664 - DIRECTION
      ?auto_153663 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_153660 ?auto_153658 ) ) ( not ( = ?auto_153662 ?auto_153658 ) ) ( not ( = ?auto_153662 ?auto_153660 ) ) ( ON_BOARD ?auto_153666 ?auto_153665 ) ( SUPPORTS ?auto_153666 ?auto_153661 ) ( not ( = ?auto_153662 ?auto_153664 ) ) ( HAVE_IMAGE ?auto_153658 ?auto_153659 ) ( not ( = ?auto_153658 ?auto_153664 ) ) ( not ( = ?auto_153659 ?auto_153661 ) ) ( CALIBRATION_TARGET ?auto_153666 ?auto_153664 ) ( not ( = ?auto_153664 ?auto_153660 ) ) ( ON_BOARD ?auto_153663 ?auto_153665 ) ( POWER_ON ?auto_153663 ) ( not ( = ?auto_153666 ?auto_153663 ) ) ( POINTING ?auto_153665 ?auto_153664 ) ( HAVE_IMAGE ?auto_153660 ?auto_153657 ) ( not ( = ?auto_153659 ?auto_153657 ) ) ( not ( = ?auto_153657 ?auto_153661 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153658 ?auto_153659 ?auto_153662 ?auto_153661 )
      ( GET-3IMAGE-VERIFY ?auto_153658 ?auto_153659 ?auto_153660 ?auto_153657 ?auto_153662 ?auto_153661 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_153690 - DIRECTION
      ?auto_153691 - MODE
      ?auto_153692 - DIRECTION
      ?auto_153689 - MODE
      ?auto_153694 - DIRECTION
      ?auto_153693 - MODE
    )
    :vars
    (
      ?auto_153698 - INSTRUMENT
      ?auto_153697 - SATELLITE
      ?auto_153696 - DIRECTION
      ?auto_153695 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_153692 ?auto_153690 ) ) ( not ( = ?auto_153694 ?auto_153690 ) ) ( not ( = ?auto_153694 ?auto_153692 ) ) ( ON_BOARD ?auto_153698 ?auto_153697 ) ( SUPPORTS ?auto_153698 ?auto_153689 ) ( not ( = ?auto_153692 ?auto_153696 ) ) ( HAVE_IMAGE ?auto_153690 ?auto_153691 ) ( not ( = ?auto_153690 ?auto_153696 ) ) ( not ( = ?auto_153691 ?auto_153689 ) ) ( CALIBRATION_TARGET ?auto_153698 ?auto_153696 ) ( not ( = ?auto_153696 ?auto_153694 ) ) ( ON_BOARD ?auto_153695 ?auto_153697 ) ( POWER_ON ?auto_153695 ) ( not ( = ?auto_153698 ?auto_153695 ) ) ( POINTING ?auto_153697 ?auto_153696 ) ( HAVE_IMAGE ?auto_153694 ?auto_153693 ) ( not ( = ?auto_153691 ?auto_153693 ) ) ( not ( = ?auto_153689 ?auto_153693 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153690 ?auto_153691 ?auto_153692 ?auto_153689 )
      ( GET-3IMAGE-VERIFY ?auto_153690 ?auto_153691 ?auto_153692 ?auto_153689 ?auto_153694 ?auto_153693 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_150949 - DIRECTION
      ?auto_150950 - MODE
      ?auto_150951 - DIRECTION
      ?auto_150948 - MODE
      ?auto_150953 - DIRECTION
      ?auto_150952 - MODE
    )
    :vars
    (
      ?auto_150955 - INSTRUMENT
      ?auto_150954 - SATELLITE
      ?auto_150958 - DIRECTION
      ?auto_150956 - DIRECTION
      ?auto_150957 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_150951 ?auto_150949 ) ) ( not ( = ?auto_150953 ?auto_150949 ) ) ( not ( = ?auto_150953 ?auto_150951 ) ) ( ON_BOARD ?auto_150955 ?auto_150954 ) ( SUPPORTS ?auto_150955 ?auto_150952 ) ( not ( = ?auto_150953 ?auto_150958 ) ) ( HAVE_IMAGE ?auto_150951 ?auto_150948 ) ( not ( = ?auto_150951 ?auto_150958 ) ) ( not ( = ?auto_150948 ?auto_150952 ) ) ( CALIBRATION_TARGET ?auto_150955 ?auto_150958 ) ( not ( = ?auto_150958 ?auto_150956 ) ) ( not ( = ?auto_150953 ?auto_150956 ) ) ( not ( = ?auto_150951 ?auto_150956 ) ) ( ON_BOARD ?auto_150957 ?auto_150954 ) ( POWER_ON ?auto_150957 ) ( not ( = ?auto_150955 ?auto_150957 ) ) ( POINTING ?auto_150954 ?auto_150958 ) ( HAVE_IMAGE ?auto_150949 ?auto_150950 ) ( not ( = ?auto_150949 ?auto_150958 ) ) ( not ( = ?auto_150949 ?auto_150956 ) ) ( not ( = ?auto_150950 ?auto_150948 ) ) ( not ( = ?auto_150950 ?auto_150952 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_150951 ?auto_150948 ?auto_150953 ?auto_150952 )
      ( GET-3IMAGE-VERIFY ?auto_150949 ?auto_150950 ?auto_150951 ?auto_150948 ?auto_150953 ?auto_150952 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_150985 - DIRECTION
      ?auto_150986 - MODE
      ?auto_150987 - DIRECTION
      ?auto_150984 - MODE
      ?auto_150989 - DIRECTION
      ?auto_150988 - MODE
    )
    :vars
    (
      ?auto_150991 - INSTRUMENT
      ?auto_150990 - SATELLITE
      ?auto_150994 - DIRECTION
      ?auto_150992 - DIRECTION
      ?auto_150993 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_150987 ?auto_150985 ) ) ( not ( = ?auto_150989 ?auto_150985 ) ) ( not ( = ?auto_150989 ?auto_150987 ) ) ( ON_BOARD ?auto_150991 ?auto_150990 ) ( SUPPORTS ?auto_150991 ?auto_150984 ) ( not ( = ?auto_150987 ?auto_150994 ) ) ( HAVE_IMAGE ?auto_150989 ?auto_150988 ) ( not ( = ?auto_150989 ?auto_150994 ) ) ( not ( = ?auto_150988 ?auto_150984 ) ) ( CALIBRATION_TARGET ?auto_150991 ?auto_150994 ) ( not ( = ?auto_150994 ?auto_150992 ) ) ( not ( = ?auto_150987 ?auto_150992 ) ) ( not ( = ?auto_150989 ?auto_150992 ) ) ( ON_BOARD ?auto_150993 ?auto_150990 ) ( POWER_ON ?auto_150993 ) ( not ( = ?auto_150991 ?auto_150993 ) ) ( POINTING ?auto_150990 ?auto_150994 ) ( HAVE_IMAGE ?auto_150985 ?auto_150986 ) ( not ( = ?auto_150985 ?auto_150994 ) ) ( not ( = ?auto_150985 ?auto_150992 ) ) ( not ( = ?auto_150986 ?auto_150984 ) ) ( not ( = ?auto_150986 ?auto_150988 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_150989 ?auto_150988 ?auto_150987 ?auto_150984 )
      ( GET-3IMAGE-VERIFY ?auto_150985 ?auto_150986 ?auto_150987 ?auto_150984 ?auto_150989 ?auto_150988 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_153890 - DIRECTION
      ?auto_153891 - MODE
      ?auto_153892 - DIRECTION
      ?auto_153889 - MODE
      ?auto_153894 - DIRECTION
      ?auto_153893 - MODE
    )
    :vars
    (
      ?auto_153898 - INSTRUMENT
      ?auto_153897 - SATELLITE
      ?auto_153896 - DIRECTION
      ?auto_153895 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_153892 ?auto_153890 ) ) ( not ( = ?auto_153894 ?auto_153890 ) ) ( not ( = ?auto_153894 ?auto_153892 ) ) ( ON_BOARD ?auto_153898 ?auto_153897 ) ( SUPPORTS ?auto_153898 ?auto_153891 ) ( not ( = ?auto_153890 ?auto_153896 ) ) ( HAVE_IMAGE ?auto_153892 ?auto_153889 ) ( not ( = ?auto_153892 ?auto_153896 ) ) ( not ( = ?auto_153889 ?auto_153891 ) ) ( CALIBRATION_TARGET ?auto_153898 ?auto_153896 ) ( not ( = ?auto_153896 ?auto_153894 ) ) ( ON_BOARD ?auto_153895 ?auto_153897 ) ( POWER_ON ?auto_153895 ) ( not ( = ?auto_153898 ?auto_153895 ) ) ( POINTING ?auto_153897 ?auto_153896 ) ( HAVE_IMAGE ?auto_153894 ?auto_153893 ) ( not ( = ?auto_153891 ?auto_153893 ) ) ( not ( = ?auto_153889 ?auto_153893 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153892 ?auto_153889 ?auto_153890 ?auto_153891 )
      ( GET-3IMAGE-VERIFY ?auto_153890 ?auto_153891 ?auto_153892 ?auto_153889 ?auto_153894 ?auto_153893 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_151157 - DIRECTION
      ?auto_151158 - MODE
      ?auto_151159 - DIRECTION
      ?auto_151156 - MODE
      ?auto_151161 - DIRECTION
      ?auto_151160 - MODE
    )
    :vars
    (
      ?auto_151163 - INSTRUMENT
      ?auto_151162 - SATELLITE
      ?auto_151166 - DIRECTION
      ?auto_151164 - DIRECTION
      ?auto_151165 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_151159 ?auto_151157 ) ) ( not ( = ?auto_151161 ?auto_151157 ) ) ( not ( = ?auto_151161 ?auto_151159 ) ) ( ON_BOARD ?auto_151163 ?auto_151162 ) ( SUPPORTS ?auto_151163 ?auto_151158 ) ( not ( = ?auto_151157 ?auto_151166 ) ) ( HAVE_IMAGE ?auto_151161 ?auto_151160 ) ( not ( = ?auto_151161 ?auto_151166 ) ) ( not ( = ?auto_151160 ?auto_151158 ) ) ( CALIBRATION_TARGET ?auto_151163 ?auto_151166 ) ( not ( = ?auto_151166 ?auto_151164 ) ) ( not ( = ?auto_151157 ?auto_151164 ) ) ( not ( = ?auto_151161 ?auto_151164 ) ) ( ON_BOARD ?auto_151165 ?auto_151162 ) ( POWER_ON ?auto_151165 ) ( not ( = ?auto_151163 ?auto_151165 ) ) ( POINTING ?auto_151162 ?auto_151166 ) ( HAVE_IMAGE ?auto_151159 ?auto_151156 ) ( not ( = ?auto_151158 ?auto_151156 ) ) ( not ( = ?auto_151159 ?auto_151166 ) ) ( not ( = ?auto_151159 ?auto_151164 ) ) ( not ( = ?auto_151156 ?auto_151160 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_151161 ?auto_151160 ?auto_151157 ?auto_151158 )
      ( GET-3IMAGE-VERIFY ?auto_151157 ?auto_151158 ?auto_151159 ?auto_151156 ?auto_151161 ?auto_151160 ) )
  )

)

