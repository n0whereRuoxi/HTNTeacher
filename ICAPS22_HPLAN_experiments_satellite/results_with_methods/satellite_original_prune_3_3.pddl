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

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18258 - DIRECTION
      ?auto_18259 - MODE
    )
    :vars
    (
      ?auto_18260 - INSTRUMENT
      ?auto_18261 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_18260 ) ( ON_BOARD ?auto_18260 ?auto_18261 ) ( SUPPORTS ?auto_18260 ?auto_18259 ) ( POWER_ON ?auto_18260 ) ( POINTING ?auto_18261 ?auto_18258 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_18261 ?auto_18258 ?auto_18260 ?auto_18259 )
      ( GET-1IMAGE-VERIFY ?auto_18258 ?auto_18259 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18276 - DIRECTION
      ?auto_18277 - MODE
    )
    :vars
    (
      ?auto_18278 - INSTRUMENT
      ?auto_18279 - SATELLITE
      ?auto_18280 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_18278 ) ( ON_BOARD ?auto_18278 ?auto_18279 ) ( SUPPORTS ?auto_18278 ?auto_18277 ) ( POWER_ON ?auto_18278 ) ( POINTING ?auto_18279 ?auto_18280 ) ( not ( = ?auto_18276 ?auto_18280 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_18279 ?auto_18276 ?auto_18280 )
      ( GET-1IMAGE ?auto_18276 ?auto_18277 )
      ( GET-1IMAGE-VERIFY ?auto_18276 ?auto_18277 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18297 - DIRECTION
      ?auto_18298 - MODE
    )
    :vars
    (
      ?auto_18300 - INSTRUMENT
      ?auto_18299 - SATELLITE
      ?auto_18301 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18300 ?auto_18299 ) ( SUPPORTS ?auto_18300 ?auto_18298 ) ( POWER_ON ?auto_18300 ) ( POINTING ?auto_18299 ?auto_18301 ) ( not ( = ?auto_18297 ?auto_18301 ) ) ( CALIBRATION_TARGET ?auto_18300 ?auto_18301 ) ( NOT_CALIBRATED ?auto_18300 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_18299 ?auto_18300 ?auto_18301 )
      ( GET-1IMAGE ?auto_18297 ?auto_18298 )
      ( GET-1IMAGE-VERIFY ?auto_18297 ?auto_18298 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18318 - DIRECTION
      ?auto_18319 - MODE
    )
    :vars
    (
      ?auto_18320 - INSTRUMENT
      ?auto_18321 - SATELLITE
      ?auto_18322 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18320 ?auto_18321 ) ( SUPPORTS ?auto_18320 ?auto_18319 ) ( POINTING ?auto_18321 ?auto_18322 ) ( not ( = ?auto_18318 ?auto_18322 ) ) ( CALIBRATION_TARGET ?auto_18320 ?auto_18322 ) ( POWER_AVAIL ?auto_18321 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_18320 ?auto_18321 )
      ( GET-1IMAGE ?auto_18318 ?auto_18319 )
      ( GET-1IMAGE-VERIFY ?auto_18318 ?auto_18319 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18339 - DIRECTION
      ?auto_18340 - MODE
    )
    :vars
    (
      ?auto_18341 - INSTRUMENT
      ?auto_18343 - SATELLITE
      ?auto_18342 - DIRECTION
      ?auto_18344 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18341 ?auto_18343 ) ( SUPPORTS ?auto_18341 ?auto_18340 ) ( not ( = ?auto_18339 ?auto_18342 ) ) ( CALIBRATION_TARGET ?auto_18341 ?auto_18342 ) ( POWER_AVAIL ?auto_18343 ) ( POINTING ?auto_18343 ?auto_18344 ) ( not ( = ?auto_18342 ?auto_18344 ) ) ( not ( = ?auto_18339 ?auto_18344 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_18343 ?auto_18342 ?auto_18344 )
      ( GET-1IMAGE ?auto_18339 ?auto_18340 )
      ( GET-1IMAGE-VERIFY ?auto_18339 ?auto_18340 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18424 - DIRECTION
      ?auto_18425 - MODE
      ?auto_18426 - DIRECTION
      ?auto_18423 - MODE
    )
    :vars
    (
      ?auto_18428 - INSTRUMENT
      ?auto_18427 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_18426 ?auto_18424 ) ) ( CALIBRATED ?auto_18428 ) ( ON_BOARD ?auto_18428 ?auto_18427 ) ( SUPPORTS ?auto_18428 ?auto_18423 ) ( POWER_ON ?auto_18428 ) ( POINTING ?auto_18427 ?auto_18426 ) ( HAVE_IMAGE ?auto_18424 ?auto_18425 ) ( not ( = ?auto_18425 ?auto_18423 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18426 ?auto_18423 )
      ( GET-2IMAGE-VERIFY ?auto_18424 ?auto_18425 ?auto_18426 ?auto_18423 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18430 - DIRECTION
      ?auto_18431 - MODE
      ?auto_18432 - DIRECTION
      ?auto_18429 - MODE
    )
    :vars
    (
      ?auto_18434 - INSTRUMENT
      ?auto_18433 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_18432 ?auto_18430 ) ) ( CALIBRATED ?auto_18434 ) ( ON_BOARD ?auto_18434 ?auto_18433 ) ( SUPPORTS ?auto_18434 ?auto_18431 ) ( POWER_ON ?auto_18434 ) ( POINTING ?auto_18433 ?auto_18430 ) ( HAVE_IMAGE ?auto_18432 ?auto_18429 ) ( not ( = ?auto_18431 ?auto_18429 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18430 ?auto_18431 )
      ( GET-2IMAGE-VERIFY ?auto_18430 ?auto_18431 ?auto_18432 ?auto_18429 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18503 - DIRECTION
      ?auto_18504 - MODE
      ?auto_18505 - DIRECTION
      ?auto_18502 - MODE
    )
    :vars
    (
      ?auto_18508 - INSTRUMENT
      ?auto_18506 - SATELLITE
      ?auto_18507 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_18505 ?auto_18503 ) ) ( CALIBRATED ?auto_18508 ) ( ON_BOARD ?auto_18508 ?auto_18506 ) ( SUPPORTS ?auto_18508 ?auto_18502 ) ( POWER_ON ?auto_18508 ) ( POINTING ?auto_18506 ?auto_18507 ) ( not ( = ?auto_18505 ?auto_18507 ) ) ( HAVE_IMAGE ?auto_18503 ?auto_18504 ) ( not ( = ?auto_18503 ?auto_18507 ) ) ( not ( = ?auto_18504 ?auto_18502 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18505 ?auto_18502 )
      ( GET-2IMAGE-VERIFY ?auto_18503 ?auto_18504 ?auto_18505 ?auto_18502 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18510 - DIRECTION
      ?auto_18511 - MODE
      ?auto_18512 - DIRECTION
      ?auto_18509 - MODE
    )
    :vars
    (
      ?auto_18513 - INSTRUMENT
      ?auto_18514 - SATELLITE
      ?auto_18515 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_18512 ?auto_18510 ) ) ( CALIBRATED ?auto_18513 ) ( ON_BOARD ?auto_18513 ?auto_18514 ) ( SUPPORTS ?auto_18513 ?auto_18511 ) ( POWER_ON ?auto_18513 ) ( POINTING ?auto_18514 ?auto_18515 ) ( not ( = ?auto_18510 ?auto_18515 ) ) ( HAVE_IMAGE ?auto_18512 ?auto_18509 ) ( not ( = ?auto_18512 ?auto_18515 ) ) ( not ( = ?auto_18509 ?auto_18511 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18512 ?auto_18509 ?auto_18510 ?auto_18511 )
      ( GET-2IMAGE-VERIFY ?auto_18510 ?auto_18511 ?auto_18512 ?auto_18509 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18590 - DIRECTION
      ?auto_18591 - MODE
    )
    :vars
    (
      ?auto_18596 - DIRECTION
      ?auto_18592 - INSTRUMENT
      ?auto_18594 - SATELLITE
      ?auto_18595 - DIRECTION
      ?auto_18593 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_18590 ?auto_18596 ) ) ( ON_BOARD ?auto_18592 ?auto_18594 ) ( SUPPORTS ?auto_18592 ?auto_18591 ) ( POWER_ON ?auto_18592 ) ( POINTING ?auto_18594 ?auto_18595 ) ( not ( = ?auto_18590 ?auto_18595 ) ) ( HAVE_IMAGE ?auto_18596 ?auto_18593 ) ( not ( = ?auto_18596 ?auto_18595 ) ) ( not ( = ?auto_18593 ?auto_18591 ) ) ( CALIBRATION_TARGET ?auto_18592 ?auto_18595 ) ( NOT_CALIBRATED ?auto_18592 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_18594 ?auto_18592 ?auto_18595 )
      ( GET-2IMAGE ?auto_18596 ?auto_18593 ?auto_18590 ?auto_18591 )
      ( GET-1IMAGE-VERIFY ?auto_18590 ?auto_18591 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18598 - DIRECTION
      ?auto_18599 - MODE
      ?auto_18600 - DIRECTION
      ?auto_18597 - MODE
    )
    :vars
    (
      ?auto_18602 - INSTRUMENT
      ?auto_18603 - SATELLITE
      ?auto_18601 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_18600 ?auto_18598 ) ) ( ON_BOARD ?auto_18602 ?auto_18603 ) ( SUPPORTS ?auto_18602 ?auto_18597 ) ( POWER_ON ?auto_18602 ) ( POINTING ?auto_18603 ?auto_18601 ) ( not ( = ?auto_18600 ?auto_18601 ) ) ( HAVE_IMAGE ?auto_18598 ?auto_18599 ) ( not ( = ?auto_18598 ?auto_18601 ) ) ( not ( = ?auto_18599 ?auto_18597 ) ) ( CALIBRATION_TARGET ?auto_18602 ?auto_18601 ) ( NOT_CALIBRATED ?auto_18602 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18600 ?auto_18597 )
      ( GET-2IMAGE-VERIFY ?auto_18598 ?auto_18599 ?auto_18600 ?auto_18597 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18605 - DIRECTION
      ?auto_18606 - MODE
      ?auto_18607 - DIRECTION
      ?auto_18604 - MODE
    )
    :vars
    (
      ?auto_18610 - INSTRUMENT
      ?auto_18608 - SATELLITE
      ?auto_18609 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_18607 ?auto_18605 ) ) ( ON_BOARD ?auto_18610 ?auto_18608 ) ( SUPPORTS ?auto_18610 ?auto_18606 ) ( POWER_ON ?auto_18610 ) ( POINTING ?auto_18608 ?auto_18609 ) ( not ( = ?auto_18605 ?auto_18609 ) ) ( HAVE_IMAGE ?auto_18607 ?auto_18604 ) ( not ( = ?auto_18607 ?auto_18609 ) ) ( not ( = ?auto_18604 ?auto_18606 ) ) ( CALIBRATION_TARGET ?auto_18610 ?auto_18609 ) ( NOT_CALIBRATED ?auto_18610 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18607 ?auto_18604 ?auto_18605 ?auto_18606 )
      ( GET-2IMAGE-VERIFY ?auto_18605 ?auto_18606 ?auto_18607 ?auto_18604 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18685 - DIRECTION
      ?auto_18686 - MODE
    )
    :vars
    (
      ?auto_18689 - DIRECTION
      ?auto_18691 - INSTRUMENT
      ?auto_18688 - SATELLITE
      ?auto_18690 - DIRECTION
      ?auto_18687 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_18685 ?auto_18689 ) ) ( ON_BOARD ?auto_18691 ?auto_18688 ) ( SUPPORTS ?auto_18691 ?auto_18686 ) ( POINTING ?auto_18688 ?auto_18690 ) ( not ( = ?auto_18685 ?auto_18690 ) ) ( HAVE_IMAGE ?auto_18689 ?auto_18687 ) ( not ( = ?auto_18689 ?auto_18690 ) ) ( not ( = ?auto_18687 ?auto_18686 ) ) ( CALIBRATION_TARGET ?auto_18691 ?auto_18690 ) ( POWER_AVAIL ?auto_18688 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_18691 ?auto_18688 )
      ( GET-2IMAGE ?auto_18689 ?auto_18687 ?auto_18685 ?auto_18686 )
      ( GET-1IMAGE-VERIFY ?auto_18685 ?auto_18686 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18693 - DIRECTION
      ?auto_18694 - MODE
      ?auto_18695 - DIRECTION
      ?auto_18692 - MODE
    )
    :vars
    (
      ?auto_18696 - INSTRUMENT
      ?auto_18698 - SATELLITE
      ?auto_18697 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_18695 ?auto_18693 ) ) ( ON_BOARD ?auto_18696 ?auto_18698 ) ( SUPPORTS ?auto_18696 ?auto_18692 ) ( POINTING ?auto_18698 ?auto_18697 ) ( not ( = ?auto_18695 ?auto_18697 ) ) ( HAVE_IMAGE ?auto_18693 ?auto_18694 ) ( not ( = ?auto_18693 ?auto_18697 ) ) ( not ( = ?auto_18694 ?auto_18692 ) ) ( CALIBRATION_TARGET ?auto_18696 ?auto_18697 ) ( POWER_AVAIL ?auto_18698 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18695 ?auto_18692 )
      ( GET-2IMAGE-VERIFY ?auto_18693 ?auto_18694 ?auto_18695 ?auto_18692 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18700 - DIRECTION
      ?auto_18701 - MODE
      ?auto_18702 - DIRECTION
      ?auto_18699 - MODE
    )
    :vars
    (
      ?auto_18704 - INSTRUMENT
      ?auto_18705 - SATELLITE
      ?auto_18703 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_18702 ?auto_18700 ) ) ( ON_BOARD ?auto_18704 ?auto_18705 ) ( SUPPORTS ?auto_18704 ?auto_18701 ) ( POINTING ?auto_18705 ?auto_18703 ) ( not ( = ?auto_18700 ?auto_18703 ) ) ( HAVE_IMAGE ?auto_18702 ?auto_18699 ) ( not ( = ?auto_18702 ?auto_18703 ) ) ( not ( = ?auto_18699 ?auto_18701 ) ) ( CALIBRATION_TARGET ?auto_18704 ?auto_18703 ) ( POWER_AVAIL ?auto_18705 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18702 ?auto_18699 ?auto_18700 ?auto_18701 )
      ( GET-2IMAGE-VERIFY ?auto_18700 ?auto_18701 ?auto_18702 ?auto_18699 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18780 - DIRECTION
      ?auto_18781 - MODE
    )
    :vars
    (
      ?auto_18782 - DIRECTION
      ?auto_18785 - INSTRUMENT
      ?auto_18786 - SATELLITE
      ?auto_18784 - DIRECTION
      ?auto_18783 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_18780 ?auto_18782 ) ) ( ON_BOARD ?auto_18785 ?auto_18786 ) ( SUPPORTS ?auto_18785 ?auto_18781 ) ( not ( = ?auto_18780 ?auto_18784 ) ) ( HAVE_IMAGE ?auto_18782 ?auto_18783 ) ( not ( = ?auto_18782 ?auto_18784 ) ) ( not ( = ?auto_18783 ?auto_18781 ) ) ( CALIBRATION_TARGET ?auto_18785 ?auto_18784 ) ( POWER_AVAIL ?auto_18786 ) ( POINTING ?auto_18786 ?auto_18782 ) )
    :subtasks
    ( ( !TURN_TO ?auto_18786 ?auto_18784 ?auto_18782 )
      ( GET-2IMAGE ?auto_18782 ?auto_18783 ?auto_18780 ?auto_18781 )
      ( GET-1IMAGE-VERIFY ?auto_18780 ?auto_18781 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18788 - DIRECTION
      ?auto_18789 - MODE
      ?auto_18790 - DIRECTION
      ?auto_18787 - MODE
    )
    :vars
    (
      ?auto_18792 - INSTRUMENT
      ?auto_18791 - SATELLITE
      ?auto_18793 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_18790 ?auto_18788 ) ) ( ON_BOARD ?auto_18792 ?auto_18791 ) ( SUPPORTS ?auto_18792 ?auto_18787 ) ( not ( = ?auto_18790 ?auto_18793 ) ) ( HAVE_IMAGE ?auto_18788 ?auto_18789 ) ( not ( = ?auto_18788 ?auto_18793 ) ) ( not ( = ?auto_18789 ?auto_18787 ) ) ( CALIBRATION_TARGET ?auto_18792 ?auto_18793 ) ( POWER_AVAIL ?auto_18791 ) ( POINTING ?auto_18791 ?auto_18788 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18790 ?auto_18787 )
      ( GET-2IMAGE-VERIFY ?auto_18788 ?auto_18789 ?auto_18790 ?auto_18787 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18795 - DIRECTION
      ?auto_18796 - MODE
      ?auto_18797 - DIRECTION
      ?auto_18794 - MODE
    )
    :vars
    (
      ?auto_18799 - INSTRUMENT
      ?auto_18800 - SATELLITE
      ?auto_18798 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_18797 ?auto_18795 ) ) ( ON_BOARD ?auto_18799 ?auto_18800 ) ( SUPPORTS ?auto_18799 ?auto_18796 ) ( not ( = ?auto_18795 ?auto_18798 ) ) ( HAVE_IMAGE ?auto_18797 ?auto_18794 ) ( not ( = ?auto_18797 ?auto_18798 ) ) ( not ( = ?auto_18794 ?auto_18796 ) ) ( CALIBRATION_TARGET ?auto_18799 ?auto_18798 ) ( POWER_AVAIL ?auto_18800 ) ( POINTING ?auto_18800 ?auto_18797 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18797 ?auto_18794 ?auto_18795 ?auto_18796 )
      ( GET-2IMAGE-VERIFY ?auto_18795 ?auto_18796 ?auto_18797 ?auto_18794 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18875 - DIRECTION
      ?auto_18876 - MODE
    )
    :vars
    (
      ?auto_18878 - DIRECTION
      ?auto_18879 - INSTRUMENT
      ?auto_18881 - SATELLITE
      ?auto_18877 - DIRECTION
      ?auto_18880 - MODE
      ?auto_18882 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18875 ?auto_18878 ) ) ( ON_BOARD ?auto_18879 ?auto_18881 ) ( SUPPORTS ?auto_18879 ?auto_18876 ) ( not ( = ?auto_18875 ?auto_18877 ) ) ( HAVE_IMAGE ?auto_18878 ?auto_18880 ) ( not ( = ?auto_18878 ?auto_18877 ) ) ( not ( = ?auto_18880 ?auto_18876 ) ) ( CALIBRATION_TARGET ?auto_18879 ?auto_18877 ) ( POINTING ?auto_18881 ?auto_18878 ) ( ON_BOARD ?auto_18882 ?auto_18881 ) ( POWER_ON ?auto_18882 ) ( not ( = ?auto_18879 ?auto_18882 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_18882 ?auto_18881 )
      ( GET-2IMAGE ?auto_18878 ?auto_18880 ?auto_18875 ?auto_18876 )
      ( GET-1IMAGE-VERIFY ?auto_18875 ?auto_18876 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18884 - DIRECTION
      ?auto_18885 - MODE
      ?auto_18886 - DIRECTION
      ?auto_18883 - MODE
    )
    :vars
    (
      ?auto_18890 - INSTRUMENT
      ?auto_18889 - SATELLITE
      ?auto_18887 - DIRECTION
      ?auto_18888 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18886 ?auto_18884 ) ) ( ON_BOARD ?auto_18890 ?auto_18889 ) ( SUPPORTS ?auto_18890 ?auto_18883 ) ( not ( = ?auto_18886 ?auto_18887 ) ) ( HAVE_IMAGE ?auto_18884 ?auto_18885 ) ( not ( = ?auto_18884 ?auto_18887 ) ) ( not ( = ?auto_18885 ?auto_18883 ) ) ( CALIBRATION_TARGET ?auto_18890 ?auto_18887 ) ( POINTING ?auto_18889 ?auto_18884 ) ( ON_BOARD ?auto_18888 ?auto_18889 ) ( POWER_ON ?auto_18888 ) ( not ( = ?auto_18890 ?auto_18888 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18886 ?auto_18883 )
      ( GET-2IMAGE-VERIFY ?auto_18884 ?auto_18885 ?auto_18886 ?auto_18883 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18892 - DIRECTION
      ?auto_18893 - MODE
      ?auto_18894 - DIRECTION
      ?auto_18891 - MODE
    )
    :vars
    (
      ?auto_18895 - INSTRUMENT
      ?auto_18897 - SATELLITE
      ?auto_18898 - DIRECTION
      ?auto_18896 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18894 ?auto_18892 ) ) ( ON_BOARD ?auto_18895 ?auto_18897 ) ( SUPPORTS ?auto_18895 ?auto_18893 ) ( not ( = ?auto_18892 ?auto_18898 ) ) ( HAVE_IMAGE ?auto_18894 ?auto_18891 ) ( not ( = ?auto_18894 ?auto_18898 ) ) ( not ( = ?auto_18891 ?auto_18893 ) ) ( CALIBRATION_TARGET ?auto_18895 ?auto_18898 ) ( POINTING ?auto_18897 ?auto_18894 ) ( ON_BOARD ?auto_18896 ?auto_18897 ) ( POWER_ON ?auto_18896 ) ( not ( = ?auto_18895 ?auto_18896 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18894 ?auto_18891 ?auto_18892 ?auto_18893 )
      ( GET-2IMAGE-VERIFY ?auto_18892 ?auto_18893 ?auto_18894 ?auto_18891 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18981 - DIRECTION
      ?auto_18982 - MODE
    )
    :vars
    (
      ?auto_18986 - DIRECTION
      ?auto_18983 - INSTRUMENT
      ?auto_18985 - SATELLITE
      ?auto_18988 - DIRECTION
      ?auto_18987 - MODE
      ?auto_18984 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18981 ?auto_18986 ) ) ( ON_BOARD ?auto_18983 ?auto_18985 ) ( SUPPORTS ?auto_18983 ?auto_18982 ) ( not ( = ?auto_18981 ?auto_18988 ) ) ( not ( = ?auto_18986 ?auto_18988 ) ) ( not ( = ?auto_18987 ?auto_18982 ) ) ( CALIBRATION_TARGET ?auto_18983 ?auto_18988 ) ( POINTING ?auto_18985 ?auto_18986 ) ( ON_BOARD ?auto_18984 ?auto_18985 ) ( POWER_ON ?auto_18984 ) ( not ( = ?auto_18983 ?auto_18984 ) ) ( CALIBRATED ?auto_18984 ) ( SUPPORTS ?auto_18984 ?auto_18987 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18986 ?auto_18987 )
      ( GET-2IMAGE ?auto_18986 ?auto_18987 ?auto_18981 ?auto_18982 )
      ( GET-1IMAGE-VERIFY ?auto_18981 ?auto_18982 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18990 - DIRECTION
      ?auto_18991 - MODE
      ?auto_18992 - DIRECTION
      ?auto_18989 - MODE
    )
    :vars
    (
      ?auto_18993 - INSTRUMENT
      ?auto_18995 - SATELLITE
      ?auto_18996 - DIRECTION
      ?auto_18994 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18992 ?auto_18990 ) ) ( ON_BOARD ?auto_18993 ?auto_18995 ) ( SUPPORTS ?auto_18993 ?auto_18989 ) ( not ( = ?auto_18992 ?auto_18996 ) ) ( not ( = ?auto_18990 ?auto_18996 ) ) ( not ( = ?auto_18991 ?auto_18989 ) ) ( CALIBRATION_TARGET ?auto_18993 ?auto_18996 ) ( POINTING ?auto_18995 ?auto_18990 ) ( ON_BOARD ?auto_18994 ?auto_18995 ) ( POWER_ON ?auto_18994 ) ( not ( = ?auto_18993 ?auto_18994 ) ) ( CALIBRATED ?auto_18994 ) ( SUPPORTS ?auto_18994 ?auto_18991 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18992 ?auto_18989 )
      ( GET-2IMAGE-VERIFY ?auto_18990 ?auto_18991 ?auto_18992 ?auto_18989 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18998 - DIRECTION
      ?auto_18999 - MODE
      ?auto_19000 - DIRECTION
      ?auto_18997 - MODE
    )
    :vars
    (
      ?auto_19001 - INSTRUMENT
      ?auto_19003 - SATELLITE
      ?auto_19002 - DIRECTION
      ?auto_19004 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19000 ?auto_18998 ) ) ( ON_BOARD ?auto_19001 ?auto_19003 ) ( SUPPORTS ?auto_19001 ?auto_18999 ) ( not ( = ?auto_18998 ?auto_19002 ) ) ( not ( = ?auto_19000 ?auto_19002 ) ) ( not ( = ?auto_18997 ?auto_18999 ) ) ( CALIBRATION_TARGET ?auto_19001 ?auto_19002 ) ( POINTING ?auto_19003 ?auto_19000 ) ( ON_BOARD ?auto_19004 ?auto_19003 ) ( POWER_ON ?auto_19004 ) ( not ( = ?auto_19001 ?auto_19004 ) ) ( CALIBRATED ?auto_19004 ) ( SUPPORTS ?auto_19004 ?auto_18997 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19000 ?auto_18997 ?auto_18998 ?auto_18999 )
      ( GET-2IMAGE-VERIFY ?auto_18998 ?auto_18999 ?auto_19000 ?auto_18997 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_19087 - DIRECTION
      ?auto_19088 - MODE
    )
    :vars
    (
      ?auto_19090 - DIRECTION
      ?auto_19091 - INSTRUMENT
      ?auto_19093 - SATELLITE
      ?auto_19092 - DIRECTION
      ?auto_19089 - MODE
      ?auto_19094 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19087 ?auto_19090 ) ) ( ON_BOARD ?auto_19091 ?auto_19093 ) ( SUPPORTS ?auto_19091 ?auto_19088 ) ( not ( = ?auto_19087 ?auto_19092 ) ) ( not ( = ?auto_19090 ?auto_19092 ) ) ( not ( = ?auto_19089 ?auto_19088 ) ) ( CALIBRATION_TARGET ?auto_19091 ?auto_19092 ) ( ON_BOARD ?auto_19094 ?auto_19093 ) ( POWER_ON ?auto_19094 ) ( not ( = ?auto_19091 ?auto_19094 ) ) ( CALIBRATED ?auto_19094 ) ( SUPPORTS ?auto_19094 ?auto_19089 ) ( POINTING ?auto_19093 ?auto_19092 ) )
    :subtasks
    ( ( !TURN_TO ?auto_19093 ?auto_19090 ?auto_19092 )
      ( GET-2IMAGE ?auto_19090 ?auto_19089 ?auto_19087 ?auto_19088 )
      ( GET-1IMAGE-VERIFY ?auto_19087 ?auto_19088 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19096 - DIRECTION
      ?auto_19097 - MODE
      ?auto_19098 - DIRECTION
      ?auto_19095 - MODE
    )
    :vars
    (
      ?auto_19102 - INSTRUMENT
      ?auto_19099 - SATELLITE
      ?auto_19101 - DIRECTION
      ?auto_19100 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19098 ?auto_19096 ) ) ( ON_BOARD ?auto_19102 ?auto_19099 ) ( SUPPORTS ?auto_19102 ?auto_19095 ) ( not ( = ?auto_19098 ?auto_19101 ) ) ( not ( = ?auto_19096 ?auto_19101 ) ) ( not ( = ?auto_19097 ?auto_19095 ) ) ( CALIBRATION_TARGET ?auto_19102 ?auto_19101 ) ( ON_BOARD ?auto_19100 ?auto_19099 ) ( POWER_ON ?auto_19100 ) ( not ( = ?auto_19102 ?auto_19100 ) ) ( CALIBRATED ?auto_19100 ) ( SUPPORTS ?auto_19100 ?auto_19097 ) ( POINTING ?auto_19099 ?auto_19101 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_19098 ?auto_19095 )
      ( GET-2IMAGE-VERIFY ?auto_19096 ?auto_19097 ?auto_19098 ?auto_19095 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19104 - DIRECTION
      ?auto_19105 - MODE
      ?auto_19106 - DIRECTION
      ?auto_19103 - MODE
    )
    :vars
    (
      ?auto_19107 - INSTRUMENT
      ?auto_19109 - SATELLITE
      ?auto_19108 - DIRECTION
      ?auto_19110 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19106 ?auto_19104 ) ) ( ON_BOARD ?auto_19107 ?auto_19109 ) ( SUPPORTS ?auto_19107 ?auto_19105 ) ( not ( = ?auto_19104 ?auto_19108 ) ) ( not ( = ?auto_19106 ?auto_19108 ) ) ( not ( = ?auto_19103 ?auto_19105 ) ) ( CALIBRATION_TARGET ?auto_19107 ?auto_19108 ) ( ON_BOARD ?auto_19110 ?auto_19109 ) ( POWER_ON ?auto_19110 ) ( not ( = ?auto_19107 ?auto_19110 ) ) ( CALIBRATED ?auto_19110 ) ( SUPPORTS ?auto_19110 ?auto_19103 ) ( POINTING ?auto_19109 ?auto_19108 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19106 ?auto_19103 ?auto_19104 ?auto_19105 )
      ( GET-2IMAGE-VERIFY ?auto_19104 ?auto_19105 ?auto_19106 ?auto_19103 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_19193 - DIRECTION
      ?auto_19194 - MODE
    )
    :vars
    (
      ?auto_19198 - DIRECTION
      ?auto_19195 - INSTRUMENT
      ?auto_19197 - SATELLITE
      ?auto_19196 - DIRECTION
      ?auto_19200 - MODE
      ?auto_19199 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19193 ?auto_19198 ) ) ( ON_BOARD ?auto_19195 ?auto_19197 ) ( SUPPORTS ?auto_19195 ?auto_19194 ) ( not ( = ?auto_19193 ?auto_19196 ) ) ( not ( = ?auto_19198 ?auto_19196 ) ) ( not ( = ?auto_19200 ?auto_19194 ) ) ( CALIBRATION_TARGET ?auto_19195 ?auto_19196 ) ( ON_BOARD ?auto_19199 ?auto_19197 ) ( POWER_ON ?auto_19199 ) ( not ( = ?auto_19195 ?auto_19199 ) ) ( SUPPORTS ?auto_19199 ?auto_19200 ) ( POINTING ?auto_19197 ?auto_19196 ) ( CALIBRATION_TARGET ?auto_19199 ?auto_19196 ) ( NOT_CALIBRATED ?auto_19199 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_19197 ?auto_19199 ?auto_19196 )
      ( GET-2IMAGE ?auto_19198 ?auto_19200 ?auto_19193 ?auto_19194 )
      ( GET-1IMAGE-VERIFY ?auto_19193 ?auto_19194 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19202 - DIRECTION
      ?auto_19203 - MODE
      ?auto_19204 - DIRECTION
      ?auto_19201 - MODE
    )
    :vars
    (
      ?auto_19207 - INSTRUMENT
      ?auto_19205 - SATELLITE
      ?auto_19208 - DIRECTION
      ?auto_19206 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19204 ?auto_19202 ) ) ( ON_BOARD ?auto_19207 ?auto_19205 ) ( SUPPORTS ?auto_19207 ?auto_19201 ) ( not ( = ?auto_19204 ?auto_19208 ) ) ( not ( = ?auto_19202 ?auto_19208 ) ) ( not ( = ?auto_19203 ?auto_19201 ) ) ( CALIBRATION_TARGET ?auto_19207 ?auto_19208 ) ( ON_BOARD ?auto_19206 ?auto_19205 ) ( POWER_ON ?auto_19206 ) ( not ( = ?auto_19207 ?auto_19206 ) ) ( SUPPORTS ?auto_19206 ?auto_19203 ) ( POINTING ?auto_19205 ?auto_19208 ) ( CALIBRATION_TARGET ?auto_19206 ?auto_19208 ) ( NOT_CALIBRATED ?auto_19206 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_19204 ?auto_19201 )
      ( GET-2IMAGE-VERIFY ?auto_19202 ?auto_19203 ?auto_19204 ?auto_19201 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19210 - DIRECTION
      ?auto_19211 - MODE
      ?auto_19212 - DIRECTION
      ?auto_19209 - MODE
    )
    :vars
    (
      ?auto_19216 - INSTRUMENT
      ?auto_19215 - SATELLITE
      ?auto_19214 - DIRECTION
      ?auto_19213 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19212 ?auto_19210 ) ) ( ON_BOARD ?auto_19216 ?auto_19215 ) ( SUPPORTS ?auto_19216 ?auto_19211 ) ( not ( = ?auto_19210 ?auto_19214 ) ) ( not ( = ?auto_19212 ?auto_19214 ) ) ( not ( = ?auto_19209 ?auto_19211 ) ) ( CALIBRATION_TARGET ?auto_19216 ?auto_19214 ) ( ON_BOARD ?auto_19213 ?auto_19215 ) ( POWER_ON ?auto_19213 ) ( not ( = ?auto_19216 ?auto_19213 ) ) ( SUPPORTS ?auto_19213 ?auto_19209 ) ( POINTING ?auto_19215 ?auto_19214 ) ( CALIBRATION_TARGET ?auto_19213 ?auto_19214 ) ( NOT_CALIBRATED ?auto_19213 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19212 ?auto_19209 ?auto_19210 ?auto_19211 )
      ( GET-2IMAGE-VERIFY ?auto_19210 ?auto_19211 ?auto_19212 ?auto_19209 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19656 - DIRECTION
      ?auto_19657 - MODE
      ?auto_19658 - DIRECTION
      ?auto_19655 - MODE
      ?auto_19660 - DIRECTION
      ?auto_19659 - MODE
    )
    :vars
    (
      ?auto_19661 - INSTRUMENT
      ?auto_19662 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_19658 ?auto_19656 ) ) ( not ( = ?auto_19660 ?auto_19656 ) ) ( not ( = ?auto_19660 ?auto_19658 ) ) ( CALIBRATED ?auto_19661 ) ( ON_BOARD ?auto_19661 ?auto_19662 ) ( SUPPORTS ?auto_19661 ?auto_19659 ) ( POWER_ON ?auto_19661 ) ( POINTING ?auto_19662 ?auto_19660 ) ( HAVE_IMAGE ?auto_19656 ?auto_19657 ) ( HAVE_IMAGE ?auto_19658 ?auto_19655 ) ( not ( = ?auto_19657 ?auto_19655 ) ) ( not ( = ?auto_19657 ?auto_19659 ) ) ( not ( = ?auto_19655 ?auto_19659 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_19660 ?auto_19659 )
      ( GET-3IMAGE-VERIFY ?auto_19656 ?auto_19657 ?auto_19658 ?auto_19655 ?auto_19660 ?auto_19659 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19672 - DIRECTION
      ?auto_19673 - MODE
      ?auto_19674 - DIRECTION
      ?auto_19671 - MODE
      ?auto_19676 - DIRECTION
      ?auto_19675 - MODE
    )
    :vars
    (
      ?auto_19677 - INSTRUMENT
      ?auto_19678 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_19674 ?auto_19672 ) ) ( not ( = ?auto_19676 ?auto_19672 ) ) ( not ( = ?auto_19676 ?auto_19674 ) ) ( CALIBRATED ?auto_19677 ) ( ON_BOARD ?auto_19677 ?auto_19678 ) ( SUPPORTS ?auto_19677 ?auto_19671 ) ( POWER_ON ?auto_19677 ) ( POINTING ?auto_19678 ?auto_19674 ) ( HAVE_IMAGE ?auto_19672 ?auto_19673 ) ( HAVE_IMAGE ?auto_19676 ?auto_19675 ) ( not ( = ?auto_19673 ?auto_19671 ) ) ( not ( = ?auto_19673 ?auto_19675 ) ) ( not ( = ?auto_19671 ?auto_19675 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_19674 ?auto_19671 )
      ( GET-3IMAGE-VERIFY ?auto_19672 ?auto_19673 ?auto_19674 ?auto_19671 ?auto_19676 ?auto_19675 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19732 - DIRECTION
      ?auto_19733 - MODE
      ?auto_19734 - DIRECTION
      ?auto_19731 - MODE
      ?auto_19736 - DIRECTION
      ?auto_19735 - MODE
    )
    :vars
    (
      ?auto_19737 - INSTRUMENT
      ?auto_19738 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_19734 ?auto_19732 ) ) ( not ( = ?auto_19736 ?auto_19732 ) ) ( not ( = ?auto_19736 ?auto_19734 ) ) ( CALIBRATED ?auto_19737 ) ( ON_BOARD ?auto_19737 ?auto_19738 ) ( SUPPORTS ?auto_19737 ?auto_19733 ) ( POWER_ON ?auto_19737 ) ( POINTING ?auto_19738 ?auto_19732 ) ( HAVE_IMAGE ?auto_19734 ?auto_19731 ) ( HAVE_IMAGE ?auto_19736 ?auto_19735 ) ( not ( = ?auto_19733 ?auto_19731 ) ) ( not ( = ?auto_19733 ?auto_19735 ) ) ( not ( = ?auto_19731 ?auto_19735 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_19732 ?auto_19733 )
      ( GET-3IMAGE-VERIFY ?auto_19732 ?auto_19733 ?auto_19734 ?auto_19731 ?auto_19736 ?auto_19735 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19839 - DIRECTION
      ?auto_19840 - MODE
      ?auto_19841 - DIRECTION
      ?auto_19838 - MODE
      ?auto_19843 - DIRECTION
      ?auto_19842 - MODE
    )
    :vars
    (
      ?auto_19845 - INSTRUMENT
      ?auto_19846 - SATELLITE
      ?auto_19844 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_19841 ?auto_19839 ) ) ( not ( = ?auto_19843 ?auto_19839 ) ) ( not ( = ?auto_19843 ?auto_19841 ) ) ( CALIBRATED ?auto_19845 ) ( ON_BOARD ?auto_19845 ?auto_19846 ) ( SUPPORTS ?auto_19845 ?auto_19842 ) ( POWER_ON ?auto_19845 ) ( POINTING ?auto_19846 ?auto_19844 ) ( not ( = ?auto_19843 ?auto_19844 ) ) ( HAVE_IMAGE ?auto_19839 ?auto_19840 ) ( not ( = ?auto_19839 ?auto_19844 ) ) ( not ( = ?auto_19840 ?auto_19842 ) ) ( HAVE_IMAGE ?auto_19841 ?auto_19838 ) ( not ( = ?auto_19840 ?auto_19838 ) ) ( not ( = ?auto_19841 ?auto_19844 ) ) ( not ( = ?auto_19838 ?auto_19842 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19839 ?auto_19840 ?auto_19843 ?auto_19842 )
      ( GET-3IMAGE-VERIFY ?auto_19839 ?auto_19840 ?auto_19841 ?auto_19838 ?auto_19843 ?auto_19842 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19857 - DIRECTION
      ?auto_19858 - MODE
      ?auto_19859 - DIRECTION
      ?auto_19856 - MODE
      ?auto_19861 - DIRECTION
      ?auto_19860 - MODE
    )
    :vars
    (
      ?auto_19863 - INSTRUMENT
      ?auto_19864 - SATELLITE
      ?auto_19862 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_19859 ?auto_19857 ) ) ( not ( = ?auto_19861 ?auto_19857 ) ) ( not ( = ?auto_19861 ?auto_19859 ) ) ( CALIBRATED ?auto_19863 ) ( ON_BOARD ?auto_19863 ?auto_19864 ) ( SUPPORTS ?auto_19863 ?auto_19856 ) ( POWER_ON ?auto_19863 ) ( POINTING ?auto_19864 ?auto_19862 ) ( not ( = ?auto_19859 ?auto_19862 ) ) ( HAVE_IMAGE ?auto_19857 ?auto_19858 ) ( not ( = ?auto_19857 ?auto_19862 ) ) ( not ( = ?auto_19858 ?auto_19856 ) ) ( HAVE_IMAGE ?auto_19861 ?auto_19860 ) ( not ( = ?auto_19858 ?auto_19860 ) ) ( not ( = ?auto_19856 ?auto_19860 ) ) ( not ( = ?auto_19861 ?auto_19862 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19857 ?auto_19858 ?auto_19859 ?auto_19856 )
      ( GET-3IMAGE-VERIFY ?auto_19857 ?auto_19858 ?auto_19859 ?auto_19856 ?auto_19861 ?auto_19860 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19929 - DIRECTION
      ?auto_19930 - MODE
      ?auto_19931 - DIRECTION
      ?auto_19928 - MODE
      ?auto_19933 - DIRECTION
      ?auto_19932 - MODE
    )
    :vars
    (
      ?auto_19935 - INSTRUMENT
      ?auto_19936 - SATELLITE
      ?auto_19934 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_19931 ?auto_19929 ) ) ( not ( = ?auto_19933 ?auto_19929 ) ) ( not ( = ?auto_19933 ?auto_19931 ) ) ( CALIBRATED ?auto_19935 ) ( ON_BOARD ?auto_19935 ?auto_19936 ) ( SUPPORTS ?auto_19935 ?auto_19930 ) ( POWER_ON ?auto_19935 ) ( POINTING ?auto_19936 ?auto_19934 ) ( not ( = ?auto_19929 ?auto_19934 ) ) ( HAVE_IMAGE ?auto_19931 ?auto_19928 ) ( not ( = ?auto_19931 ?auto_19934 ) ) ( not ( = ?auto_19928 ?auto_19930 ) ) ( HAVE_IMAGE ?auto_19933 ?auto_19932 ) ( not ( = ?auto_19930 ?auto_19932 ) ) ( not ( = ?auto_19928 ?auto_19932 ) ) ( not ( = ?auto_19933 ?auto_19934 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19931 ?auto_19928 ?auto_19929 ?auto_19930 )
      ( GET-3IMAGE-VERIFY ?auto_19929 ?auto_19930 ?auto_19931 ?auto_19928 ?auto_19933 ?auto_19932 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20053 - DIRECTION
      ?auto_20054 - MODE
      ?auto_20055 - DIRECTION
      ?auto_20052 - MODE
      ?auto_20057 - DIRECTION
      ?auto_20056 - MODE
    )
    :vars
    (
      ?auto_20060 - INSTRUMENT
      ?auto_20059 - SATELLITE
      ?auto_20058 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20055 ?auto_20053 ) ) ( not ( = ?auto_20057 ?auto_20053 ) ) ( not ( = ?auto_20057 ?auto_20055 ) ) ( ON_BOARD ?auto_20060 ?auto_20059 ) ( SUPPORTS ?auto_20060 ?auto_20056 ) ( POWER_ON ?auto_20060 ) ( POINTING ?auto_20059 ?auto_20058 ) ( not ( = ?auto_20057 ?auto_20058 ) ) ( HAVE_IMAGE ?auto_20053 ?auto_20054 ) ( not ( = ?auto_20053 ?auto_20058 ) ) ( not ( = ?auto_20054 ?auto_20056 ) ) ( CALIBRATION_TARGET ?auto_20060 ?auto_20058 ) ( NOT_CALIBRATED ?auto_20060 ) ( HAVE_IMAGE ?auto_20055 ?auto_20052 ) ( not ( = ?auto_20054 ?auto_20052 ) ) ( not ( = ?auto_20055 ?auto_20058 ) ) ( not ( = ?auto_20052 ?auto_20056 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20053 ?auto_20054 ?auto_20057 ?auto_20056 )
      ( GET-3IMAGE-VERIFY ?auto_20053 ?auto_20054 ?auto_20055 ?auto_20052 ?auto_20057 ?auto_20056 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20071 - DIRECTION
      ?auto_20072 - MODE
      ?auto_20073 - DIRECTION
      ?auto_20070 - MODE
      ?auto_20075 - DIRECTION
      ?auto_20074 - MODE
    )
    :vars
    (
      ?auto_20078 - INSTRUMENT
      ?auto_20077 - SATELLITE
      ?auto_20076 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20073 ?auto_20071 ) ) ( not ( = ?auto_20075 ?auto_20071 ) ) ( not ( = ?auto_20075 ?auto_20073 ) ) ( ON_BOARD ?auto_20078 ?auto_20077 ) ( SUPPORTS ?auto_20078 ?auto_20070 ) ( POWER_ON ?auto_20078 ) ( POINTING ?auto_20077 ?auto_20076 ) ( not ( = ?auto_20073 ?auto_20076 ) ) ( HAVE_IMAGE ?auto_20071 ?auto_20072 ) ( not ( = ?auto_20071 ?auto_20076 ) ) ( not ( = ?auto_20072 ?auto_20070 ) ) ( CALIBRATION_TARGET ?auto_20078 ?auto_20076 ) ( NOT_CALIBRATED ?auto_20078 ) ( HAVE_IMAGE ?auto_20075 ?auto_20074 ) ( not ( = ?auto_20072 ?auto_20074 ) ) ( not ( = ?auto_20070 ?auto_20074 ) ) ( not ( = ?auto_20075 ?auto_20076 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20071 ?auto_20072 ?auto_20073 ?auto_20070 )
      ( GET-3IMAGE-VERIFY ?auto_20071 ?auto_20072 ?auto_20073 ?auto_20070 ?auto_20075 ?auto_20074 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20143 - DIRECTION
      ?auto_20144 - MODE
      ?auto_20145 - DIRECTION
      ?auto_20142 - MODE
      ?auto_20147 - DIRECTION
      ?auto_20146 - MODE
    )
    :vars
    (
      ?auto_20150 - INSTRUMENT
      ?auto_20149 - SATELLITE
      ?auto_20148 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20145 ?auto_20143 ) ) ( not ( = ?auto_20147 ?auto_20143 ) ) ( not ( = ?auto_20147 ?auto_20145 ) ) ( ON_BOARD ?auto_20150 ?auto_20149 ) ( SUPPORTS ?auto_20150 ?auto_20144 ) ( POWER_ON ?auto_20150 ) ( POINTING ?auto_20149 ?auto_20148 ) ( not ( = ?auto_20143 ?auto_20148 ) ) ( HAVE_IMAGE ?auto_20145 ?auto_20142 ) ( not ( = ?auto_20145 ?auto_20148 ) ) ( not ( = ?auto_20142 ?auto_20144 ) ) ( CALIBRATION_TARGET ?auto_20150 ?auto_20148 ) ( NOT_CALIBRATED ?auto_20150 ) ( HAVE_IMAGE ?auto_20147 ?auto_20146 ) ( not ( = ?auto_20144 ?auto_20146 ) ) ( not ( = ?auto_20142 ?auto_20146 ) ) ( not ( = ?auto_20147 ?auto_20148 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20145 ?auto_20142 ?auto_20143 ?auto_20144 )
      ( GET-3IMAGE-VERIFY ?auto_20143 ?auto_20144 ?auto_20145 ?auto_20142 ?auto_20147 ?auto_20146 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20267 - DIRECTION
      ?auto_20268 - MODE
      ?auto_20269 - DIRECTION
      ?auto_20266 - MODE
      ?auto_20271 - DIRECTION
      ?auto_20270 - MODE
    )
    :vars
    (
      ?auto_20274 - INSTRUMENT
      ?auto_20273 - SATELLITE
      ?auto_20272 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20269 ?auto_20267 ) ) ( not ( = ?auto_20271 ?auto_20267 ) ) ( not ( = ?auto_20271 ?auto_20269 ) ) ( ON_BOARD ?auto_20274 ?auto_20273 ) ( SUPPORTS ?auto_20274 ?auto_20270 ) ( POINTING ?auto_20273 ?auto_20272 ) ( not ( = ?auto_20271 ?auto_20272 ) ) ( HAVE_IMAGE ?auto_20267 ?auto_20268 ) ( not ( = ?auto_20267 ?auto_20272 ) ) ( not ( = ?auto_20268 ?auto_20270 ) ) ( CALIBRATION_TARGET ?auto_20274 ?auto_20272 ) ( POWER_AVAIL ?auto_20273 ) ( HAVE_IMAGE ?auto_20269 ?auto_20266 ) ( not ( = ?auto_20268 ?auto_20266 ) ) ( not ( = ?auto_20269 ?auto_20272 ) ) ( not ( = ?auto_20266 ?auto_20270 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20267 ?auto_20268 ?auto_20271 ?auto_20270 )
      ( GET-3IMAGE-VERIFY ?auto_20267 ?auto_20268 ?auto_20269 ?auto_20266 ?auto_20271 ?auto_20270 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20285 - DIRECTION
      ?auto_20286 - MODE
      ?auto_20287 - DIRECTION
      ?auto_20284 - MODE
      ?auto_20289 - DIRECTION
      ?auto_20288 - MODE
    )
    :vars
    (
      ?auto_20292 - INSTRUMENT
      ?auto_20291 - SATELLITE
      ?auto_20290 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20287 ?auto_20285 ) ) ( not ( = ?auto_20289 ?auto_20285 ) ) ( not ( = ?auto_20289 ?auto_20287 ) ) ( ON_BOARD ?auto_20292 ?auto_20291 ) ( SUPPORTS ?auto_20292 ?auto_20284 ) ( POINTING ?auto_20291 ?auto_20290 ) ( not ( = ?auto_20287 ?auto_20290 ) ) ( HAVE_IMAGE ?auto_20285 ?auto_20286 ) ( not ( = ?auto_20285 ?auto_20290 ) ) ( not ( = ?auto_20286 ?auto_20284 ) ) ( CALIBRATION_TARGET ?auto_20292 ?auto_20290 ) ( POWER_AVAIL ?auto_20291 ) ( HAVE_IMAGE ?auto_20289 ?auto_20288 ) ( not ( = ?auto_20286 ?auto_20288 ) ) ( not ( = ?auto_20284 ?auto_20288 ) ) ( not ( = ?auto_20289 ?auto_20290 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20285 ?auto_20286 ?auto_20287 ?auto_20284 )
      ( GET-3IMAGE-VERIFY ?auto_20285 ?auto_20286 ?auto_20287 ?auto_20284 ?auto_20289 ?auto_20288 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20357 - DIRECTION
      ?auto_20358 - MODE
      ?auto_20359 - DIRECTION
      ?auto_20356 - MODE
      ?auto_20361 - DIRECTION
      ?auto_20360 - MODE
    )
    :vars
    (
      ?auto_20364 - INSTRUMENT
      ?auto_20363 - SATELLITE
      ?auto_20362 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20359 ?auto_20357 ) ) ( not ( = ?auto_20361 ?auto_20357 ) ) ( not ( = ?auto_20361 ?auto_20359 ) ) ( ON_BOARD ?auto_20364 ?auto_20363 ) ( SUPPORTS ?auto_20364 ?auto_20358 ) ( POINTING ?auto_20363 ?auto_20362 ) ( not ( = ?auto_20357 ?auto_20362 ) ) ( HAVE_IMAGE ?auto_20359 ?auto_20356 ) ( not ( = ?auto_20359 ?auto_20362 ) ) ( not ( = ?auto_20356 ?auto_20358 ) ) ( CALIBRATION_TARGET ?auto_20364 ?auto_20362 ) ( POWER_AVAIL ?auto_20363 ) ( HAVE_IMAGE ?auto_20361 ?auto_20360 ) ( not ( = ?auto_20358 ?auto_20360 ) ) ( not ( = ?auto_20356 ?auto_20360 ) ) ( not ( = ?auto_20361 ?auto_20362 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20359 ?auto_20356 ?auto_20357 ?auto_20358 )
      ( GET-3IMAGE-VERIFY ?auto_20357 ?auto_20358 ?auto_20359 ?auto_20356 ?auto_20361 ?auto_20360 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20433 - DIRECTION
      ?auto_20434 - MODE
    )
    :vars
    (
      ?auto_20437 - DIRECTION
      ?auto_20438 - INSTRUMENT
      ?auto_20436 - SATELLITE
      ?auto_20435 - DIRECTION
      ?auto_20439 - MODE
      ?auto_20440 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20433 ?auto_20437 ) ) ( ON_BOARD ?auto_20438 ?auto_20436 ) ( SUPPORTS ?auto_20438 ?auto_20434 ) ( not ( = ?auto_20433 ?auto_20435 ) ) ( HAVE_IMAGE ?auto_20437 ?auto_20439 ) ( not ( = ?auto_20437 ?auto_20435 ) ) ( not ( = ?auto_20439 ?auto_20434 ) ) ( CALIBRATION_TARGET ?auto_20438 ?auto_20435 ) ( POWER_AVAIL ?auto_20436 ) ( POINTING ?auto_20436 ?auto_20440 ) ( not ( = ?auto_20435 ?auto_20440 ) ) ( not ( = ?auto_20433 ?auto_20440 ) ) ( not ( = ?auto_20437 ?auto_20440 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_20436 ?auto_20435 ?auto_20440 )
      ( GET-2IMAGE ?auto_20437 ?auto_20439 ?auto_20433 ?auto_20434 )
      ( GET-1IMAGE-VERIFY ?auto_20433 ?auto_20434 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20442 - DIRECTION
      ?auto_20443 - MODE
      ?auto_20444 - DIRECTION
      ?auto_20441 - MODE
    )
    :vars
    (
      ?auto_20446 - INSTRUMENT
      ?auto_20447 - SATELLITE
      ?auto_20445 - DIRECTION
      ?auto_20448 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20444 ?auto_20442 ) ) ( ON_BOARD ?auto_20446 ?auto_20447 ) ( SUPPORTS ?auto_20446 ?auto_20441 ) ( not ( = ?auto_20444 ?auto_20445 ) ) ( HAVE_IMAGE ?auto_20442 ?auto_20443 ) ( not ( = ?auto_20442 ?auto_20445 ) ) ( not ( = ?auto_20443 ?auto_20441 ) ) ( CALIBRATION_TARGET ?auto_20446 ?auto_20445 ) ( POWER_AVAIL ?auto_20447 ) ( POINTING ?auto_20447 ?auto_20448 ) ( not ( = ?auto_20445 ?auto_20448 ) ) ( not ( = ?auto_20444 ?auto_20448 ) ) ( not ( = ?auto_20442 ?auto_20448 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_20444 ?auto_20441 )
      ( GET-2IMAGE-VERIFY ?auto_20442 ?auto_20443 ?auto_20444 ?auto_20441 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20450 - DIRECTION
      ?auto_20451 - MODE
      ?auto_20452 - DIRECTION
      ?auto_20449 - MODE
    )
    :vars
    (
      ?auto_20456 - DIRECTION
      ?auto_20455 - INSTRUMENT
      ?auto_20453 - SATELLITE
      ?auto_20454 - DIRECTION
      ?auto_20457 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_20452 ?auto_20450 ) ) ( not ( = ?auto_20452 ?auto_20456 ) ) ( ON_BOARD ?auto_20455 ?auto_20453 ) ( SUPPORTS ?auto_20455 ?auto_20449 ) ( not ( = ?auto_20452 ?auto_20454 ) ) ( HAVE_IMAGE ?auto_20456 ?auto_20457 ) ( not ( = ?auto_20456 ?auto_20454 ) ) ( not ( = ?auto_20457 ?auto_20449 ) ) ( CALIBRATION_TARGET ?auto_20455 ?auto_20454 ) ( POWER_AVAIL ?auto_20453 ) ( POINTING ?auto_20453 ?auto_20450 ) ( not ( = ?auto_20454 ?auto_20450 ) ) ( not ( = ?auto_20456 ?auto_20450 ) ) ( HAVE_IMAGE ?auto_20450 ?auto_20451 ) ( not ( = ?auto_20451 ?auto_20449 ) ) ( not ( = ?auto_20451 ?auto_20457 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20456 ?auto_20457 ?auto_20452 ?auto_20449 )
      ( GET-2IMAGE-VERIFY ?auto_20450 ?auto_20451 ?auto_20452 ?auto_20449 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20459 - DIRECTION
      ?auto_20460 - MODE
      ?auto_20461 - DIRECTION
      ?auto_20458 - MODE
    )
    :vars
    (
      ?auto_20465 - INSTRUMENT
      ?auto_20463 - SATELLITE
      ?auto_20464 - DIRECTION
      ?auto_20462 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20461 ?auto_20459 ) ) ( ON_BOARD ?auto_20465 ?auto_20463 ) ( SUPPORTS ?auto_20465 ?auto_20460 ) ( not ( = ?auto_20459 ?auto_20464 ) ) ( HAVE_IMAGE ?auto_20461 ?auto_20458 ) ( not ( = ?auto_20461 ?auto_20464 ) ) ( not ( = ?auto_20458 ?auto_20460 ) ) ( CALIBRATION_TARGET ?auto_20465 ?auto_20464 ) ( POWER_AVAIL ?auto_20463 ) ( POINTING ?auto_20463 ?auto_20462 ) ( not ( = ?auto_20464 ?auto_20462 ) ) ( not ( = ?auto_20459 ?auto_20462 ) ) ( not ( = ?auto_20461 ?auto_20462 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20461 ?auto_20458 ?auto_20459 ?auto_20460 )
      ( GET-2IMAGE-VERIFY ?auto_20459 ?auto_20460 ?auto_20461 ?auto_20458 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20467 - DIRECTION
      ?auto_20468 - MODE
      ?auto_20469 - DIRECTION
      ?auto_20466 - MODE
    )
    :vars
    (
      ?auto_20473 - DIRECTION
      ?auto_20472 - INSTRUMENT
      ?auto_20470 - SATELLITE
      ?auto_20471 - DIRECTION
      ?auto_20474 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_20469 ?auto_20467 ) ) ( not ( = ?auto_20467 ?auto_20473 ) ) ( ON_BOARD ?auto_20472 ?auto_20470 ) ( SUPPORTS ?auto_20472 ?auto_20468 ) ( not ( = ?auto_20467 ?auto_20471 ) ) ( HAVE_IMAGE ?auto_20473 ?auto_20474 ) ( not ( = ?auto_20473 ?auto_20471 ) ) ( not ( = ?auto_20474 ?auto_20468 ) ) ( CALIBRATION_TARGET ?auto_20472 ?auto_20471 ) ( POWER_AVAIL ?auto_20470 ) ( POINTING ?auto_20470 ?auto_20469 ) ( not ( = ?auto_20471 ?auto_20469 ) ) ( not ( = ?auto_20473 ?auto_20469 ) ) ( HAVE_IMAGE ?auto_20469 ?auto_20466 ) ( not ( = ?auto_20468 ?auto_20466 ) ) ( not ( = ?auto_20466 ?auto_20474 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20473 ?auto_20474 ?auto_20467 ?auto_20468 )
      ( GET-2IMAGE-VERIFY ?auto_20467 ?auto_20468 ?auto_20469 ?auto_20466 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20496 - DIRECTION
      ?auto_20497 - MODE
      ?auto_20498 - DIRECTION
      ?auto_20495 - MODE
      ?auto_20500 - DIRECTION
      ?auto_20499 - MODE
    )
    :vars
    (
      ?auto_20503 - INSTRUMENT
      ?auto_20501 - SATELLITE
      ?auto_20502 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20498 ?auto_20496 ) ) ( not ( = ?auto_20500 ?auto_20496 ) ) ( not ( = ?auto_20500 ?auto_20498 ) ) ( ON_BOARD ?auto_20503 ?auto_20501 ) ( SUPPORTS ?auto_20503 ?auto_20499 ) ( not ( = ?auto_20500 ?auto_20502 ) ) ( HAVE_IMAGE ?auto_20496 ?auto_20497 ) ( not ( = ?auto_20496 ?auto_20502 ) ) ( not ( = ?auto_20497 ?auto_20499 ) ) ( CALIBRATION_TARGET ?auto_20503 ?auto_20502 ) ( POWER_AVAIL ?auto_20501 ) ( POINTING ?auto_20501 ?auto_20498 ) ( not ( = ?auto_20502 ?auto_20498 ) ) ( HAVE_IMAGE ?auto_20498 ?auto_20495 ) ( not ( = ?auto_20497 ?auto_20495 ) ) ( not ( = ?auto_20495 ?auto_20499 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20496 ?auto_20497 ?auto_20500 ?auto_20499 )
      ( GET-3IMAGE-VERIFY ?auto_20496 ?auto_20497 ?auto_20498 ?auto_20495 ?auto_20500 ?auto_20499 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20515 - DIRECTION
      ?auto_20516 - MODE
      ?auto_20517 - DIRECTION
      ?auto_20514 - MODE
      ?auto_20519 - DIRECTION
      ?auto_20518 - MODE
    )
    :vars
    (
      ?auto_20522 - INSTRUMENT
      ?auto_20520 - SATELLITE
      ?auto_20521 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20517 ?auto_20515 ) ) ( not ( = ?auto_20519 ?auto_20515 ) ) ( not ( = ?auto_20519 ?auto_20517 ) ) ( ON_BOARD ?auto_20522 ?auto_20520 ) ( SUPPORTS ?auto_20522 ?auto_20514 ) ( not ( = ?auto_20517 ?auto_20521 ) ) ( HAVE_IMAGE ?auto_20515 ?auto_20516 ) ( not ( = ?auto_20515 ?auto_20521 ) ) ( not ( = ?auto_20516 ?auto_20514 ) ) ( CALIBRATION_TARGET ?auto_20522 ?auto_20521 ) ( POWER_AVAIL ?auto_20520 ) ( POINTING ?auto_20520 ?auto_20519 ) ( not ( = ?auto_20521 ?auto_20519 ) ) ( HAVE_IMAGE ?auto_20519 ?auto_20518 ) ( not ( = ?auto_20516 ?auto_20518 ) ) ( not ( = ?auto_20514 ?auto_20518 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20515 ?auto_20516 ?auto_20517 ?auto_20514 )
      ( GET-3IMAGE-VERIFY ?auto_20515 ?auto_20516 ?auto_20517 ?auto_20514 ?auto_20519 ?auto_20518 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20534 - DIRECTION
      ?auto_20535 - MODE
      ?auto_20536 - DIRECTION
      ?auto_20533 - MODE
      ?auto_20538 - DIRECTION
      ?auto_20537 - MODE
    )
    :vars
    (
      ?auto_20541 - INSTRUMENT
      ?auto_20539 - SATELLITE
      ?auto_20540 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20536 ?auto_20534 ) ) ( not ( = ?auto_20538 ?auto_20534 ) ) ( not ( = ?auto_20538 ?auto_20536 ) ) ( ON_BOARD ?auto_20541 ?auto_20539 ) ( SUPPORTS ?auto_20541 ?auto_20537 ) ( not ( = ?auto_20538 ?auto_20540 ) ) ( HAVE_IMAGE ?auto_20536 ?auto_20533 ) ( not ( = ?auto_20536 ?auto_20540 ) ) ( not ( = ?auto_20533 ?auto_20537 ) ) ( CALIBRATION_TARGET ?auto_20541 ?auto_20540 ) ( POWER_AVAIL ?auto_20539 ) ( POINTING ?auto_20539 ?auto_20534 ) ( not ( = ?auto_20540 ?auto_20534 ) ) ( HAVE_IMAGE ?auto_20534 ?auto_20535 ) ( not ( = ?auto_20535 ?auto_20533 ) ) ( not ( = ?auto_20535 ?auto_20537 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20536 ?auto_20533 ?auto_20538 ?auto_20537 )
      ( GET-3IMAGE-VERIFY ?auto_20534 ?auto_20535 ?auto_20536 ?auto_20533 ?auto_20538 ?auto_20537 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20554 - DIRECTION
      ?auto_20555 - MODE
      ?auto_20556 - DIRECTION
      ?auto_20553 - MODE
      ?auto_20558 - DIRECTION
      ?auto_20557 - MODE
    )
    :vars
    (
      ?auto_20561 - INSTRUMENT
      ?auto_20559 - SATELLITE
      ?auto_20560 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20556 ?auto_20554 ) ) ( not ( = ?auto_20558 ?auto_20554 ) ) ( not ( = ?auto_20558 ?auto_20556 ) ) ( ON_BOARD ?auto_20561 ?auto_20559 ) ( SUPPORTS ?auto_20561 ?auto_20553 ) ( not ( = ?auto_20556 ?auto_20560 ) ) ( HAVE_IMAGE ?auto_20558 ?auto_20557 ) ( not ( = ?auto_20558 ?auto_20560 ) ) ( not ( = ?auto_20557 ?auto_20553 ) ) ( CALIBRATION_TARGET ?auto_20561 ?auto_20560 ) ( POWER_AVAIL ?auto_20559 ) ( POINTING ?auto_20559 ?auto_20554 ) ( not ( = ?auto_20560 ?auto_20554 ) ) ( HAVE_IMAGE ?auto_20554 ?auto_20555 ) ( not ( = ?auto_20555 ?auto_20553 ) ) ( not ( = ?auto_20555 ?auto_20557 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20558 ?auto_20557 ?auto_20556 ?auto_20553 )
      ( GET-3IMAGE-VERIFY ?auto_20554 ?auto_20555 ?auto_20556 ?auto_20553 ?auto_20558 ?auto_20557 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20595 - DIRECTION
      ?auto_20596 - MODE
      ?auto_20597 - DIRECTION
      ?auto_20594 - MODE
      ?auto_20599 - DIRECTION
      ?auto_20598 - MODE
    )
    :vars
    (
      ?auto_20602 - INSTRUMENT
      ?auto_20600 - SATELLITE
      ?auto_20601 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20597 ?auto_20595 ) ) ( not ( = ?auto_20599 ?auto_20595 ) ) ( not ( = ?auto_20599 ?auto_20597 ) ) ( ON_BOARD ?auto_20602 ?auto_20600 ) ( SUPPORTS ?auto_20602 ?auto_20596 ) ( not ( = ?auto_20595 ?auto_20601 ) ) ( HAVE_IMAGE ?auto_20597 ?auto_20594 ) ( not ( = ?auto_20597 ?auto_20601 ) ) ( not ( = ?auto_20594 ?auto_20596 ) ) ( CALIBRATION_TARGET ?auto_20602 ?auto_20601 ) ( POWER_AVAIL ?auto_20600 ) ( POINTING ?auto_20600 ?auto_20599 ) ( not ( = ?auto_20601 ?auto_20599 ) ) ( HAVE_IMAGE ?auto_20599 ?auto_20598 ) ( not ( = ?auto_20596 ?auto_20598 ) ) ( not ( = ?auto_20594 ?auto_20598 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20597 ?auto_20594 ?auto_20595 ?auto_20596 )
      ( GET-3IMAGE-VERIFY ?auto_20595 ?auto_20596 ?auto_20597 ?auto_20594 ?auto_20599 ?auto_20598 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20614 - DIRECTION
      ?auto_20615 - MODE
      ?auto_20616 - DIRECTION
      ?auto_20613 - MODE
      ?auto_20618 - DIRECTION
      ?auto_20617 - MODE
    )
    :vars
    (
      ?auto_20621 - INSTRUMENT
      ?auto_20619 - SATELLITE
      ?auto_20620 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20616 ?auto_20614 ) ) ( not ( = ?auto_20618 ?auto_20614 ) ) ( not ( = ?auto_20618 ?auto_20616 ) ) ( ON_BOARD ?auto_20621 ?auto_20619 ) ( SUPPORTS ?auto_20621 ?auto_20615 ) ( not ( = ?auto_20614 ?auto_20620 ) ) ( HAVE_IMAGE ?auto_20618 ?auto_20617 ) ( not ( = ?auto_20618 ?auto_20620 ) ) ( not ( = ?auto_20617 ?auto_20615 ) ) ( CALIBRATION_TARGET ?auto_20621 ?auto_20620 ) ( POWER_AVAIL ?auto_20619 ) ( POINTING ?auto_20619 ?auto_20616 ) ( not ( = ?auto_20620 ?auto_20616 ) ) ( HAVE_IMAGE ?auto_20616 ?auto_20613 ) ( not ( = ?auto_20615 ?auto_20613 ) ) ( not ( = ?auto_20613 ?auto_20617 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20618 ?auto_20617 ?auto_20614 ?auto_20615 )
      ( GET-3IMAGE-VERIFY ?auto_20614 ?auto_20615 ?auto_20616 ?auto_20613 ?auto_20618 ?auto_20617 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20677 - DIRECTION
      ?auto_20678 - MODE
    )
    :vars
    (
      ?auto_20683 - DIRECTION
      ?auto_20682 - INSTRUMENT
      ?auto_20680 - SATELLITE
      ?auto_20681 - DIRECTION
      ?auto_20684 - MODE
      ?auto_20679 - DIRECTION
      ?auto_20685 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_20677 ?auto_20683 ) ) ( ON_BOARD ?auto_20682 ?auto_20680 ) ( SUPPORTS ?auto_20682 ?auto_20678 ) ( not ( = ?auto_20677 ?auto_20681 ) ) ( HAVE_IMAGE ?auto_20683 ?auto_20684 ) ( not ( = ?auto_20683 ?auto_20681 ) ) ( not ( = ?auto_20684 ?auto_20678 ) ) ( CALIBRATION_TARGET ?auto_20682 ?auto_20681 ) ( POINTING ?auto_20680 ?auto_20679 ) ( not ( = ?auto_20681 ?auto_20679 ) ) ( not ( = ?auto_20677 ?auto_20679 ) ) ( not ( = ?auto_20683 ?auto_20679 ) ) ( ON_BOARD ?auto_20685 ?auto_20680 ) ( POWER_ON ?auto_20685 ) ( not ( = ?auto_20682 ?auto_20685 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_20685 ?auto_20680 )
      ( GET-2IMAGE ?auto_20683 ?auto_20684 ?auto_20677 ?auto_20678 )
      ( GET-1IMAGE-VERIFY ?auto_20677 ?auto_20678 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20687 - DIRECTION
      ?auto_20688 - MODE
      ?auto_20689 - DIRECTION
      ?auto_20686 - MODE
    )
    :vars
    (
      ?auto_20691 - INSTRUMENT
      ?auto_20692 - SATELLITE
      ?auto_20693 - DIRECTION
      ?auto_20690 - DIRECTION
      ?auto_20694 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_20689 ?auto_20687 ) ) ( ON_BOARD ?auto_20691 ?auto_20692 ) ( SUPPORTS ?auto_20691 ?auto_20686 ) ( not ( = ?auto_20689 ?auto_20693 ) ) ( HAVE_IMAGE ?auto_20687 ?auto_20688 ) ( not ( = ?auto_20687 ?auto_20693 ) ) ( not ( = ?auto_20688 ?auto_20686 ) ) ( CALIBRATION_TARGET ?auto_20691 ?auto_20693 ) ( POINTING ?auto_20692 ?auto_20690 ) ( not ( = ?auto_20693 ?auto_20690 ) ) ( not ( = ?auto_20689 ?auto_20690 ) ) ( not ( = ?auto_20687 ?auto_20690 ) ) ( ON_BOARD ?auto_20694 ?auto_20692 ) ( POWER_ON ?auto_20694 ) ( not ( = ?auto_20691 ?auto_20694 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_20689 ?auto_20686 )
      ( GET-2IMAGE-VERIFY ?auto_20687 ?auto_20688 ?auto_20689 ?auto_20686 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20696 - DIRECTION
      ?auto_20697 - MODE
      ?auto_20698 - DIRECTION
      ?auto_20695 - MODE
    )
    :vars
    (
      ?auto_20702 - DIRECTION
      ?auto_20699 - INSTRUMENT
      ?auto_20703 - SATELLITE
      ?auto_20704 - DIRECTION
      ?auto_20701 - MODE
      ?auto_20700 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_20698 ?auto_20696 ) ) ( not ( = ?auto_20698 ?auto_20702 ) ) ( ON_BOARD ?auto_20699 ?auto_20703 ) ( SUPPORTS ?auto_20699 ?auto_20695 ) ( not ( = ?auto_20698 ?auto_20704 ) ) ( HAVE_IMAGE ?auto_20702 ?auto_20701 ) ( not ( = ?auto_20702 ?auto_20704 ) ) ( not ( = ?auto_20701 ?auto_20695 ) ) ( CALIBRATION_TARGET ?auto_20699 ?auto_20704 ) ( POINTING ?auto_20703 ?auto_20696 ) ( not ( = ?auto_20704 ?auto_20696 ) ) ( not ( = ?auto_20702 ?auto_20696 ) ) ( ON_BOARD ?auto_20700 ?auto_20703 ) ( POWER_ON ?auto_20700 ) ( not ( = ?auto_20699 ?auto_20700 ) ) ( HAVE_IMAGE ?auto_20696 ?auto_20697 ) ( not ( = ?auto_20697 ?auto_20695 ) ) ( not ( = ?auto_20697 ?auto_20701 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20702 ?auto_20701 ?auto_20698 ?auto_20695 )
      ( GET-2IMAGE-VERIFY ?auto_20696 ?auto_20697 ?auto_20698 ?auto_20695 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20706 - DIRECTION
      ?auto_20707 - MODE
      ?auto_20708 - DIRECTION
      ?auto_20705 - MODE
    )
    :vars
    (
      ?auto_20709 - INSTRUMENT
      ?auto_20712 - SATELLITE
      ?auto_20713 - DIRECTION
      ?auto_20711 - DIRECTION
      ?auto_20710 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_20708 ?auto_20706 ) ) ( ON_BOARD ?auto_20709 ?auto_20712 ) ( SUPPORTS ?auto_20709 ?auto_20707 ) ( not ( = ?auto_20706 ?auto_20713 ) ) ( HAVE_IMAGE ?auto_20708 ?auto_20705 ) ( not ( = ?auto_20708 ?auto_20713 ) ) ( not ( = ?auto_20705 ?auto_20707 ) ) ( CALIBRATION_TARGET ?auto_20709 ?auto_20713 ) ( POINTING ?auto_20712 ?auto_20711 ) ( not ( = ?auto_20713 ?auto_20711 ) ) ( not ( = ?auto_20706 ?auto_20711 ) ) ( not ( = ?auto_20708 ?auto_20711 ) ) ( ON_BOARD ?auto_20710 ?auto_20712 ) ( POWER_ON ?auto_20710 ) ( not ( = ?auto_20709 ?auto_20710 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20708 ?auto_20705 ?auto_20706 ?auto_20707 )
      ( GET-2IMAGE-VERIFY ?auto_20706 ?auto_20707 ?auto_20708 ?auto_20705 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20715 - DIRECTION
      ?auto_20716 - MODE
      ?auto_20717 - DIRECTION
      ?auto_20714 - MODE
    )
    :vars
    (
      ?auto_20721 - DIRECTION
      ?auto_20718 - INSTRUMENT
      ?auto_20722 - SATELLITE
      ?auto_20723 - DIRECTION
      ?auto_20720 - MODE
      ?auto_20719 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_20717 ?auto_20715 ) ) ( not ( = ?auto_20715 ?auto_20721 ) ) ( ON_BOARD ?auto_20718 ?auto_20722 ) ( SUPPORTS ?auto_20718 ?auto_20716 ) ( not ( = ?auto_20715 ?auto_20723 ) ) ( HAVE_IMAGE ?auto_20721 ?auto_20720 ) ( not ( = ?auto_20721 ?auto_20723 ) ) ( not ( = ?auto_20720 ?auto_20716 ) ) ( CALIBRATION_TARGET ?auto_20718 ?auto_20723 ) ( POINTING ?auto_20722 ?auto_20717 ) ( not ( = ?auto_20723 ?auto_20717 ) ) ( not ( = ?auto_20721 ?auto_20717 ) ) ( ON_BOARD ?auto_20719 ?auto_20722 ) ( POWER_ON ?auto_20719 ) ( not ( = ?auto_20718 ?auto_20719 ) ) ( HAVE_IMAGE ?auto_20717 ?auto_20714 ) ( not ( = ?auto_20716 ?auto_20714 ) ) ( not ( = ?auto_20714 ?auto_20720 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20721 ?auto_20720 ?auto_20715 ?auto_20716 )
      ( GET-2IMAGE-VERIFY ?auto_20715 ?auto_20716 ?auto_20717 ?auto_20714 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20747 - DIRECTION
      ?auto_20748 - MODE
      ?auto_20749 - DIRECTION
      ?auto_20746 - MODE
      ?auto_20751 - DIRECTION
      ?auto_20750 - MODE
    )
    :vars
    (
      ?auto_20752 - INSTRUMENT
      ?auto_20754 - SATELLITE
      ?auto_20755 - DIRECTION
      ?auto_20753 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_20749 ?auto_20747 ) ) ( not ( = ?auto_20751 ?auto_20747 ) ) ( not ( = ?auto_20751 ?auto_20749 ) ) ( ON_BOARD ?auto_20752 ?auto_20754 ) ( SUPPORTS ?auto_20752 ?auto_20750 ) ( not ( = ?auto_20751 ?auto_20755 ) ) ( HAVE_IMAGE ?auto_20747 ?auto_20748 ) ( not ( = ?auto_20747 ?auto_20755 ) ) ( not ( = ?auto_20748 ?auto_20750 ) ) ( CALIBRATION_TARGET ?auto_20752 ?auto_20755 ) ( POINTING ?auto_20754 ?auto_20749 ) ( not ( = ?auto_20755 ?auto_20749 ) ) ( ON_BOARD ?auto_20753 ?auto_20754 ) ( POWER_ON ?auto_20753 ) ( not ( = ?auto_20752 ?auto_20753 ) ) ( HAVE_IMAGE ?auto_20749 ?auto_20746 ) ( not ( = ?auto_20748 ?auto_20746 ) ) ( not ( = ?auto_20746 ?auto_20750 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20747 ?auto_20748 ?auto_20751 ?auto_20750 )
      ( GET-3IMAGE-VERIFY ?auto_20747 ?auto_20748 ?auto_20749 ?auto_20746 ?auto_20751 ?auto_20750 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20768 - DIRECTION
      ?auto_20769 - MODE
      ?auto_20770 - DIRECTION
      ?auto_20767 - MODE
      ?auto_20772 - DIRECTION
      ?auto_20771 - MODE
    )
    :vars
    (
      ?auto_20773 - INSTRUMENT
      ?auto_20775 - SATELLITE
      ?auto_20776 - DIRECTION
      ?auto_20774 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_20770 ?auto_20768 ) ) ( not ( = ?auto_20772 ?auto_20768 ) ) ( not ( = ?auto_20772 ?auto_20770 ) ) ( ON_BOARD ?auto_20773 ?auto_20775 ) ( SUPPORTS ?auto_20773 ?auto_20767 ) ( not ( = ?auto_20770 ?auto_20776 ) ) ( HAVE_IMAGE ?auto_20768 ?auto_20769 ) ( not ( = ?auto_20768 ?auto_20776 ) ) ( not ( = ?auto_20769 ?auto_20767 ) ) ( CALIBRATION_TARGET ?auto_20773 ?auto_20776 ) ( POINTING ?auto_20775 ?auto_20772 ) ( not ( = ?auto_20776 ?auto_20772 ) ) ( ON_BOARD ?auto_20774 ?auto_20775 ) ( POWER_ON ?auto_20774 ) ( not ( = ?auto_20773 ?auto_20774 ) ) ( HAVE_IMAGE ?auto_20772 ?auto_20771 ) ( not ( = ?auto_20769 ?auto_20771 ) ) ( not ( = ?auto_20767 ?auto_20771 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20768 ?auto_20769 ?auto_20770 ?auto_20767 )
      ( GET-3IMAGE-VERIFY ?auto_20768 ?auto_20769 ?auto_20770 ?auto_20767 ?auto_20772 ?auto_20771 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20789 - DIRECTION
      ?auto_20790 - MODE
      ?auto_20791 - DIRECTION
      ?auto_20788 - MODE
      ?auto_20793 - DIRECTION
      ?auto_20792 - MODE
    )
    :vars
    (
      ?auto_20794 - INSTRUMENT
      ?auto_20796 - SATELLITE
      ?auto_20797 - DIRECTION
      ?auto_20795 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_20791 ?auto_20789 ) ) ( not ( = ?auto_20793 ?auto_20789 ) ) ( not ( = ?auto_20793 ?auto_20791 ) ) ( ON_BOARD ?auto_20794 ?auto_20796 ) ( SUPPORTS ?auto_20794 ?auto_20792 ) ( not ( = ?auto_20793 ?auto_20797 ) ) ( HAVE_IMAGE ?auto_20791 ?auto_20788 ) ( not ( = ?auto_20791 ?auto_20797 ) ) ( not ( = ?auto_20788 ?auto_20792 ) ) ( CALIBRATION_TARGET ?auto_20794 ?auto_20797 ) ( POINTING ?auto_20796 ?auto_20789 ) ( not ( = ?auto_20797 ?auto_20789 ) ) ( ON_BOARD ?auto_20795 ?auto_20796 ) ( POWER_ON ?auto_20795 ) ( not ( = ?auto_20794 ?auto_20795 ) ) ( HAVE_IMAGE ?auto_20789 ?auto_20790 ) ( not ( = ?auto_20790 ?auto_20788 ) ) ( not ( = ?auto_20790 ?auto_20792 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20791 ?auto_20788 ?auto_20793 ?auto_20792 )
      ( GET-3IMAGE-VERIFY ?auto_20789 ?auto_20790 ?auto_20791 ?auto_20788 ?auto_20793 ?auto_20792 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20811 - DIRECTION
      ?auto_20812 - MODE
      ?auto_20813 - DIRECTION
      ?auto_20810 - MODE
      ?auto_20815 - DIRECTION
      ?auto_20814 - MODE
    )
    :vars
    (
      ?auto_20816 - INSTRUMENT
      ?auto_20818 - SATELLITE
      ?auto_20819 - DIRECTION
      ?auto_20817 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_20813 ?auto_20811 ) ) ( not ( = ?auto_20815 ?auto_20811 ) ) ( not ( = ?auto_20815 ?auto_20813 ) ) ( ON_BOARD ?auto_20816 ?auto_20818 ) ( SUPPORTS ?auto_20816 ?auto_20810 ) ( not ( = ?auto_20813 ?auto_20819 ) ) ( HAVE_IMAGE ?auto_20815 ?auto_20814 ) ( not ( = ?auto_20815 ?auto_20819 ) ) ( not ( = ?auto_20814 ?auto_20810 ) ) ( CALIBRATION_TARGET ?auto_20816 ?auto_20819 ) ( POINTING ?auto_20818 ?auto_20811 ) ( not ( = ?auto_20819 ?auto_20811 ) ) ( ON_BOARD ?auto_20817 ?auto_20818 ) ( POWER_ON ?auto_20817 ) ( not ( = ?auto_20816 ?auto_20817 ) ) ( HAVE_IMAGE ?auto_20811 ?auto_20812 ) ( not ( = ?auto_20812 ?auto_20810 ) ) ( not ( = ?auto_20812 ?auto_20814 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20815 ?auto_20814 ?auto_20813 ?auto_20810 )
      ( GET-3IMAGE-VERIFY ?auto_20811 ?auto_20812 ?auto_20813 ?auto_20810 ?auto_20815 ?auto_20814 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20856 - DIRECTION
      ?auto_20857 - MODE
      ?auto_20858 - DIRECTION
      ?auto_20855 - MODE
      ?auto_20860 - DIRECTION
      ?auto_20859 - MODE
    )
    :vars
    (
      ?auto_20861 - INSTRUMENT
      ?auto_20863 - SATELLITE
      ?auto_20864 - DIRECTION
      ?auto_20862 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_20858 ?auto_20856 ) ) ( not ( = ?auto_20860 ?auto_20856 ) ) ( not ( = ?auto_20860 ?auto_20858 ) ) ( ON_BOARD ?auto_20861 ?auto_20863 ) ( SUPPORTS ?auto_20861 ?auto_20857 ) ( not ( = ?auto_20856 ?auto_20864 ) ) ( HAVE_IMAGE ?auto_20858 ?auto_20855 ) ( not ( = ?auto_20858 ?auto_20864 ) ) ( not ( = ?auto_20855 ?auto_20857 ) ) ( CALIBRATION_TARGET ?auto_20861 ?auto_20864 ) ( POINTING ?auto_20863 ?auto_20860 ) ( not ( = ?auto_20864 ?auto_20860 ) ) ( ON_BOARD ?auto_20862 ?auto_20863 ) ( POWER_ON ?auto_20862 ) ( not ( = ?auto_20861 ?auto_20862 ) ) ( HAVE_IMAGE ?auto_20860 ?auto_20859 ) ( not ( = ?auto_20857 ?auto_20859 ) ) ( not ( = ?auto_20855 ?auto_20859 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20858 ?auto_20855 ?auto_20856 ?auto_20857 )
      ( GET-3IMAGE-VERIFY ?auto_20856 ?auto_20857 ?auto_20858 ?auto_20855 ?auto_20860 ?auto_20859 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20877 - DIRECTION
      ?auto_20878 - MODE
      ?auto_20879 - DIRECTION
      ?auto_20876 - MODE
      ?auto_20881 - DIRECTION
      ?auto_20880 - MODE
    )
    :vars
    (
      ?auto_20882 - INSTRUMENT
      ?auto_20884 - SATELLITE
      ?auto_20885 - DIRECTION
      ?auto_20883 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_20879 ?auto_20877 ) ) ( not ( = ?auto_20881 ?auto_20877 ) ) ( not ( = ?auto_20881 ?auto_20879 ) ) ( ON_BOARD ?auto_20882 ?auto_20884 ) ( SUPPORTS ?auto_20882 ?auto_20878 ) ( not ( = ?auto_20877 ?auto_20885 ) ) ( HAVE_IMAGE ?auto_20881 ?auto_20880 ) ( not ( = ?auto_20881 ?auto_20885 ) ) ( not ( = ?auto_20880 ?auto_20878 ) ) ( CALIBRATION_TARGET ?auto_20882 ?auto_20885 ) ( POINTING ?auto_20884 ?auto_20879 ) ( not ( = ?auto_20885 ?auto_20879 ) ) ( ON_BOARD ?auto_20883 ?auto_20884 ) ( POWER_ON ?auto_20883 ) ( not ( = ?auto_20882 ?auto_20883 ) ) ( HAVE_IMAGE ?auto_20879 ?auto_20876 ) ( not ( = ?auto_20878 ?auto_20876 ) ) ( not ( = ?auto_20876 ?auto_20880 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20881 ?auto_20880 ?auto_20877 ?auto_20878 )
      ( GET-3IMAGE-VERIFY ?auto_20877 ?auto_20878 ?auto_20879 ?auto_20876 ?auto_20881 ?auto_20880 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_21198 - DIRECTION
      ?auto_21199 - MODE
    )
    :vars
    (
      ?auto_21205 - DIRECTION
      ?auto_21204 - INSTRUMENT
      ?auto_21201 - SATELLITE
      ?auto_21200 - DIRECTION
      ?auto_21202 - MODE
      ?auto_21206 - DIRECTION
      ?auto_21203 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21198 ?auto_21205 ) ) ( ON_BOARD ?auto_21204 ?auto_21201 ) ( SUPPORTS ?auto_21204 ?auto_21199 ) ( not ( = ?auto_21198 ?auto_21200 ) ) ( HAVE_IMAGE ?auto_21205 ?auto_21202 ) ( not ( = ?auto_21205 ?auto_21200 ) ) ( not ( = ?auto_21202 ?auto_21199 ) ) ( CALIBRATION_TARGET ?auto_21204 ?auto_21200 ) ( not ( = ?auto_21200 ?auto_21206 ) ) ( not ( = ?auto_21198 ?auto_21206 ) ) ( not ( = ?auto_21205 ?auto_21206 ) ) ( ON_BOARD ?auto_21203 ?auto_21201 ) ( POWER_ON ?auto_21203 ) ( not ( = ?auto_21204 ?auto_21203 ) ) ( POINTING ?auto_21201 ?auto_21200 ) )
    :subtasks
    ( ( !TURN_TO ?auto_21201 ?auto_21206 ?auto_21200 )
      ( GET-2IMAGE ?auto_21205 ?auto_21202 ?auto_21198 ?auto_21199 )
      ( GET-1IMAGE-VERIFY ?auto_21198 ?auto_21199 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21208 - DIRECTION
      ?auto_21209 - MODE
      ?auto_21210 - DIRECTION
      ?auto_21207 - MODE
    )
    :vars
    (
      ?auto_21211 - INSTRUMENT
      ?auto_21212 - SATELLITE
      ?auto_21214 - DIRECTION
      ?auto_21213 - DIRECTION
      ?auto_21215 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21210 ?auto_21208 ) ) ( ON_BOARD ?auto_21211 ?auto_21212 ) ( SUPPORTS ?auto_21211 ?auto_21207 ) ( not ( = ?auto_21210 ?auto_21214 ) ) ( HAVE_IMAGE ?auto_21208 ?auto_21209 ) ( not ( = ?auto_21208 ?auto_21214 ) ) ( not ( = ?auto_21209 ?auto_21207 ) ) ( CALIBRATION_TARGET ?auto_21211 ?auto_21214 ) ( not ( = ?auto_21214 ?auto_21213 ) ) ( not ( = ?auto_21210 ?auto_21213 ) ) ( not ( = ?auto_21208 ?auto_21213 ) ) ( ON_BOARD ?auto_21215 ?auto_21212 ) ( POWER_ON ?auto_21215 ) ( not ( = ?auto_21211 ?auto_21215 ) ) ( POINTING ?auto_21212 ?auto_21214 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21210 ?auto_21207 )
      ( GET-2IMAGE-VERIFY ?auto_21208 ?auto_21209 ?auto_21210 ?auto_21207 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21227 - DIRECTION
      ?auto_21228 - MODE
      ?auto_21229 - DIRECTION
      ?auto_21226 - MODE
    )
    :vars
    (
      ?auto_21233 - INSTRUMENT
      ?auto_21230 - SATELLITE
      ?auto_21231 - DIRECTION
      ?auto_21234 - DIRECTION
      ?auto_21232 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21229 ?auto_21227 ) ) ( ON_BOARD ?auto_21233 ?auto_21230 ) ( SUPPORTS ?auto_21233 ?auto_21228 ) ( not ( = ?auto_21227 ?auto_21231 ) ) ( HAVE_IMAGE ?auto_21229 ?auto_21226 ) ( not ( = ?auto_21229 ?auto_21231 ) ) ( not ( = ?auto_21226 ?auto_21228 ) ) ( CALIBRATION_TARGET ?auto_21233 ?auto_21231 ) ( not ( = ?auto_21231 ?auto_21234 ) ) ( not ( = ?auto_21227 ?auto_21234 ) ) ( not ( = ?auto_21229 ?auto_21234 ) ) ( ON_BOARD ?auto_21232 ?auto_21230 ) ( POWER_ON ?auto_21232 ) ( not ( = ?auto_21233 ?auto_21232 ) ) ( POINTING ?auto_21230 ?auto_21231 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21229 ?auto_21226 ?auto_21227 ?auto_21228 )
      ( GET-2IMAGE-VERIFY ?auto_21227 ?auto_21228 ?auto_21229 ?auto_21226 ) )
  )

)

