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
      ?auto_26539 - DIRECTION
      ?auto_26540 - MODE
    )
    :vars
    (
      ?auto_26541 - INSTRUMENT
      ?auto_26542 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_26541 ) ( ON_BOARD ?auto_26541 ?auto_26542 ) ( SUPPORTS ?auto_26541 ?auto_26540 ) ( POWER_ON ?auto_26541 ) ( POINTING ?auto_26542 ?auto_26539 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_26542 ?auto_26539 ?auto_26541 ?auto_26540 )
      ( GET-1IMAGE-VERIFY ?auto_26539 ?auto_26540 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26557 - DIRECTION
      ?auto_26558 - MODE
    )
    :vars
    (
      ?auto_26560 - INSTRUMENT
      ?auto_26559 - SATELLITE
      ?auto_26561 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_26560 ) ( ON_BOARD ?auto_26560 ?auto_26559 ) ( SUPPORTS ?auto_26560 ?auto_26558 ) ( POWER_ON ?auto_26560 ) ( POINTING ?auto_26559 ?auto_26561 ) ( not ( = ?auto_26557 ?auto_26561 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_26559 ?auto_26557 ?auto_26561 )
      ( GET-1IMAGE ?auto_26557 ?auto_26558 )
      ( GET-1IMAGE-VERIFY ?auto_26557 ?auto_26558 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26578 - DIRECTION
      ?auto_26579 - MODE
    )
    :vars
    (
      ?auto_26580 - INSTRUMENT
      ?auto_26582 - SATELLITE
      ?auto_26581 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26580 ?auto_26582 ) ( SUPPORTS ?auto_26580 ?auto_26579 ) ( POWER_ON ?auto_26580 ) ( POINTING ?auto_26582 ?auto_26581 ) ( not ( = ?auto_26578 ?auto_26581 ) ) ( CALIBRATION_TARGET ?auto_26580 ?auto_26581 ) ( NOT_CALIBRATED ?auto_26580 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_26582 ?auto_26580 ?auto_26581 )
      ( GET-1IMAGE ?auto_26578 ?auto_26579 )
      ( GET-1IMAGE-VERIFY ?auto_26578 ?auto_26579 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26599 - DIRECTION
      ?auto_26600 - MODE
    )
    :vars
    (
      ?auto_26603 - INSTRUMENT
      ?auto_26602 - SATELLITE
      ?auto_26601 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26603 ?auto_26602 ) ( SUPPORTS ?auto_26603 ?auto_26600 ) ( POINTING ?auto_26602 ?auto_26601 ) ( not ( = ?auto_26599 ?auto_26601 ) ) ( CALIBRATION_TARGET ?auto_26603 ?auto_26601 ) ( POWER_AVAIL ?auto_26602 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_26603 ?auto_26602 )
      ( GET-1IMAGE ?auto_26599 ?auto_26600 )
      ( GET-1IMAGE-VERIFY ?auto_26599 ?auto_26600 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26620 - DIRECTION
      ?auto_26621 - MODE
    )
    :vars
    (
      ?auto_26624 - INSTRUMENT
      ?auto_26623 - SATELLITE
      ?auto_26622 - DIRECTION
      ?auto_26625 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26624 ?auto_26623 ) ( SUPPORTS ?auto_26624 ?auto_26621 ) ( not ( = ?auto_26620 ?auto_26622 ) ) ( CALIBRATION_TARGET ?auto_26624 ?auto_26622 ) ( POWER_AVAIL ?auto_26623 ) ( POINTING ?auto_26623 ?auto_26625 ) ( not ( = ?auto_26622 ?auto_26625 ) ) ( not ( = ?auto_26620 ?auto_26625 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_26623 ?auto_26622 ?auto_26625 )
      ( GET-1IMAGE ?auto_26620 ?auto_26621 )
      ( GET-1IMAGE-VERIFY ?auto_26620 ?auto_26621 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26700 - DIRECTION
      ?auto_26701 - MODE
    )
    :vars
    (
      ?auto_26702 - INSTRUMENT
      ?auto_26703 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_26702 ) ( ON_BOARD ?auto_26702 ?auto_26703 ) ( SUPPORTS ?auto_26702 ?auto_26701 ) ( POWER_ON ?auto_26702 ) ( POINTING ?auto_26703 ?auto_26700 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_26703 ?auto_26700 ?auto_26702 ?auto_26701 )
      ( GET-1IMAGE-VERIFY ?auto_26700 ?auto_26701 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26704 - DIRECTION
      ?auto_26705 - MODE
      ?auto_26707 - DIRECTION
      ?auto_26706 - MODE
    )
    :vars
    (
      ?auto_26708 - INSTRUMENT
      ?auto_26709 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_26707 ?auto_26704 ) ) ( CALIBRATED ?auto_26708 ) ( ON_BOARD ?auto_26708 ?auto_26709 ) ( SUPPORTS ?auto_26708 ?auto_26706 ) ( POWER_ON ?auto_26708 ) ( POINTING ?auto_26709 ?auto_26707 ) ( HAVE_IMAGE ?auto_26704 ?auto_26705 ) ( not ( = ?auto_26705 ?auto_26706 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_26707 ?auto_26706 )
      ( GET-2IMAGE-VERIFY ?auto_26704 ?auto_26705 ?auto_26707 ?auto_26706 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26710 - DIRECTION
      ?auto_26711 - MODE
      ?auto_26713 - DIRECTION
      ?auto_26712 - MODE
    )
    :vars
    (
      ?auto_26714 - INSTRUMENT
      ?auto_26715 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_26713 ?auto_26710 ) ) ( CALIBRATED ?auto_26714 ) ( ON_BOARD ?auto_26714 ?auto_26715 ) ( SUPPORTS ?auto_26714 ?auto_26711 ) ( POWER_ON ?auto_26714 ) ( POINTING ?auto_26715 ?auto_26710 ) ( HAVE_IMAGE ?auto_26713 ?auto_26712 ) ( not ( = ?auto_26711 ?auto_26712 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_26710 ?auto_26711 )
      ( GET-2IMAGE-VERIFY ?auto_26710 ?auto_26711 ?auto_26713 ?auto_26712 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26778 - DIRECTION
      ?auto_26779 - MODE
    )
    :vars
    (
      ?auto_26780 - INSTRUMENT
      ?auto_26781 - SATELLITE
      ?auto_26782 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_26780 ) ( ON_BOARD ?auto_26780 ?auto_26781 ) ( SUPPORTS ?auto_26780 ?auto_26779 ) ( POWER_ON ?auto_26780 ) ( POINTING ?auto_26781 ?auto_26782 ) ( not ( = ?auto_26778 ?auto_26782 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_26781 ?auto_26778 ?auto_26782 )
      ( GET-1IMAGE ?auto_26778 ?auto_26779 )
      ( GET-1IMAGE-VERIFY ?auto_26778 ?auto_26779 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26783 - DIRECTION
      ?auto_26784 - MODE
      ?auto_26786 - DIRECTION
      ?auto_26785 - MODE
    )
    :vars
    (
      ?auto_26788 - INSTRUMENT
      ?auto_26787 - SATELLITE
      ?auto_26789 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26786 ?auto_26783 ) ) ( CALIBRATED ?auto_26788 ) ( ON_BOARD ?auto_26788 ?auto_26787 ) ( SUPPORTS ?auto_26788 ?auto_26785 ) ( POWER_ON ?auto_26788 ) ( POINTING ?auto_26787 ?auto_26789 ) ( not ( = ?auto_26786 ?auto_26789 ) ) ( HAVE_IMAGE ?auto_26783 ?auto_26784 ) ( not ( = ?auto_26783 ?auto_26789 ) ) ( not ( = ?auto_26784 ?auto_26785 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_26786 ?auto_26785 )
      ( GET-2IMAGE-VERIFY ?auto_26783 ?auto_26784 ?auto_26786 ?auto_26785 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26790 - DIRECTION
      ?auto_26791 - MODE
      ?auto_26793 - DIRECTION
      ?auto_26792 - MODE
    )
    :vars
    (
      ?auto_26795 - INSTRUMENT
      ?auto_26796 - SATELLITE
      ?auto_26794 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26793 ?auto_26790 ) ) ( CALIBRATED ?auto_26795 ) ( ON_BOARD ?auto_26795 ?auto_26796 ) ( SUPPORTS ?auto_26795 ?auto_26791 ) ( POWER_ON ?auto_26795 ) ( POINTING ?auto_26796 ?auto_26794 ) ( not ( = ?auto_26790 ?auto_26794 ) ) ( HAVE_IMAGE ?auto_26793 ?auto_26792 ) ( not ( = ?auto_26793 ?auto_26794 ) ) ( not ( = ?auto_26792 ?auto_26791 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26793 ?auto_26792 ?auto_26790 ?auto_26791 )
      ( GET-2IMAGE-VERIFY ?auto_26790 ?auto_26791 ?auto_26793 ?auto_26792 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26871 - DIRECTION
      ?auto_26872 - MODE
    )
    :vars
    (
      ?auto_26876 - DIRECTION
      ?auto_26874 - INSTRUMENT
      ?auto_26875 - SATELLITE
      ?auto_26873 - DIRECTION
      ?auto_26877 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_26871 ?auto_26876 ) ) ( ON_BOARD ?auto_26874 ?auto_26875 ) ( SUPPORTS ?auto_26874 ?auto_26872 ) ( POWER_ON ?auto_26874 ) ( POINTING ?auto_26875 ?auto_26873 ) ( not ( = ?auto_26871 ?auto_26873 ) ) ( HAVE_IMAGE ?auto_26876 ?auto_26877 ) ( not ( = ?auto_26876 ?auto_26873 ) ) ( not ( = ?auto_26877 ?auto_26872 ) ) ( CALIBRATION_TARGET ?auto_26874 ?auto_26873 ) ( NOT_CALIBRATED ?auto_26874 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_26875 ?auto_26874 ?auto_26873 )
      ( GET-2IMAGE ?auto_26876 ?auto_26877 ?auto_26871 ?auto_26872 )
      ( GET-1IMAGE-VERIFY ?auto_26871 ?auto_26872 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26878 - DIRECTION
      ?auto_26879 - MODE
      ?auto_26881 - DIRECTION
      ?auto_26880 - MODE
    )
    :vars
    (
      ?auto_26883 - INSTRUMENT
      ?auto_26882 - SATELLITE
      ?auto_26884 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26881 ?auto_26878 ) ) ( ON_BOARD ?auto_26883 ?auto_26882 ) ( SUPPORTS ?auto_26883 ?auto_26880 ) ( POWER_ON ?auto_26883 ) ( POINTING ?auto_26882 ?auto_26884 ) ( not ( = ?auto_26881 ?auto_26884 ) ) ( HAVE_IMAGE ?auto_26878 ?auto_26879 ) ( not ( = ?auto_26878 ?auto_26884 ) ) ( not ( = ?auto_26879 ?auto_26880 ) ) ( CALIBRATION_TARGET ?auto_26883 ?auto_26884 ) ( NOT_CALIBRATED ?auto_26883 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_26881 ?auto_26880 )
      ( GET-2IMAGE-VERIFY ?auto_26878 ?auto_26879 ?auto_26881 ?auto_26880 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26885 - DIRECTION
      ?auto_26886 - MODE
      ?auto_26888 - DIRECTION
      ?auto_26887 - MODE
    )
    :vars
    (
      ?auto_26891 - INSTRUMENT
      ?auto_26889 - SATELLITE
      ?auto_26890 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26888 ?auto_26885 ) ) ( ON_BOARD ?auto_26891 ?auto_26889 ) ( SUPPORTS ?auto_26891 ?auto_26886 ) ( POWER_ON ?auto_26891 ) ( POINTING ?auto_26889 ?auto_26890 ) ( not ( = ?auto_26885 ?auto_26890 ) ) ( HAVE_IMAGE ?auto_26888 ?auto_26887 ) ( not ( = ?auto_26888 ?auto_26890 ) ) ( not ( = ?auto_26887 ?auto_26886 ) ) ( CALIBRATION_TARGET ?auto_26891 ?auto_26890 ) ( NOT_CALIBRATED ?auto_26891 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26888 ?auto_26887 ?auto_26885 ?auto_26886 )
      ( GET-2IMAGE-VERIFY ?auto_26885 ?auto_26886 ?auto_26888 ?auto_26887 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26966 - DIRECTION
      ?auto_26967 - MODE
    )
    :vars
    (
      ?auto_26970 - DIRECTION
      ?auto_26972 - INSTRUMENT
      ?auto_26969 - SATELLITE
      ?auto_26971 - DIRECTION
      ?auto_26968 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_26966 ?auto_26970 ) ) ( ON_BOARD ?auto_26972 ?auto_26969 ) ( SUPPORTS ?auto_26972 ?auto_26967 ) ( POINTING ?auto_26969 ?auto_26971 ) ( not ( = ?auto_26966 ?auto_26971 ) ) ( HAVE_IMAGE ?auto_26970 ?auto_26968 ) ( not ( = ?auto_26970 ?auto_26971 ) ) ( not ( = ?auto_26968 ?auto_26967 ) ) ( CALIBRATION_TARGET ?auto_26972 ?auto_26971 ) ( POWER_AVAIL ?auto_26969 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_26972 ?auto_26969 )
      ( GET-2IMAGE ?auto_26970 ?auto_26968 ?auto_26966 ?auto_26967 )
      ( GET-1IMAGE-VERIFY ?auto_26966 ?auto_26967 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26973 - DIRECTION
      ?auto_26974 - MODE
      ?auto_26976 - DIRECTION
      ?auto_26975 - MODE
    )
    :vars
    (
      ?auto_26978 - INSTRUMENT
      ?auto_26977 - SATELLITE
      ?auto_26979 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26976 ?auto_26973 ) ) ( ON_BOARD ?auto_26978 ?auto_26977 ) ( SUPPORTS ?auto_26978 ?auto_26975 ) ( POINTING ?auto_26977 ?auto_26979 ) ( not ( = ?auto_26976 ?auto_26979 ) ) ( HAVE_IMAGE ?auto_26973 ?auto_26974 ) ( not ( = ?auto_26973 ?auto_26979 ) ) ( not ( = ?auto_26974 ?auto_26975 ) ) ( CALIBRATION_TARGET ?auto_26978 ?auto_26979 ) ( POWER_AVAIL ?auto_26977 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_26976 ?auto_26975 )
      ( GET-2IMAGE-VERIFY ?auto_26973 ?auto_26974 ?auto_26976 ?auto_26975 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26980 - DIRECTION
      ?auto_26981 - MODE
      ?auto_26983 - DIRECTION
      ?auto_26982 - MODE
    )
    :vars
    (
      ?auto_26986 - INSTRUMENT
      ?auto_26984 - SATELLITE
      ?auto_26985 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26983 ?auto_26980 ) ) ( ON_BOARD ?auto_26986 ?auto_26984 ) ( SUPPORTS ?auto_26986 ?auto_26981 ) ( POINTING ?auto_26984 ?auto_26985 ) ( not ( = ?auto_26980 ?auto_26985 ) ) ( HAVE_IMAGE ?auto_26983 ?auto_26982 ) ( not ( = ?auto_26983 ?auto_26985 ) ) ( not ( = ?auto_26982 ?auto_26981 ) ) ( CALIBRATION_TARGET ?auto_26986 ?auto_26985 ) ( POWER_AVAIL ?auto_26984 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26983 ?auto_26982 ?auto_26980 ?auto_26981 )
      ( GET-2IMAGE-VERIFY ?auto_26980 ?auto_26981 ?auto_26983 ?auto_26982 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_27061 - DIRECTION
      ?auto_27062 - MODE
    )
    :vars
    (
      ?auto_27064 - DIRECTION
      ?auto_27066 - INSTRUMENT
      ?auto_27063 - SATELLITE
      ?auto_27065 - DIRECTION
      ?auto_27067 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_27061 ?auto_27064 ) ) ( ON_BOARD ?auto_27066 ?auto_27063 ) ( SUPPORTS ?auto_27066 ?auto_27062 ) ( not ( = ?auto_27061 ?auto_27065 ) ) ( HAVE_IMAGE ?auto_27064 ?auto_27067 ) ( not ( = ?auto_27064 ?auto_27065 ) ) ( not ( = ?auto_27067 ?auto_27062 ) ) ( CALIBRATION_TARGET ?auto_27066 ?auto_27065 ) ( POWER_AVAIL ?auto_27063 ) ( POINTING ?auto_27063 ?auto_27064 ) )
    :subtasks
    ( ( !TURN_TO ?auto_27063 ?auto_27065 ?auto_27064 )
      ( GET-2IMAGE ?auto_27064 ?auto_27067 ?auto_27061 ?auto_27062 )
      ( GET-1IMAGE-VERIFY ?auto_27061 ?auto_27062 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27068 - DIRECTION
      ?auto_27069 - MODE
      ?auto_27071 - DIRECTION
      ?auto_27070 - MODE
    )
    :vars
    (
      ?auto_27073 - INSTRUMENT
      ?auto_27074 - SATELLITE
      ?auto_27072 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_27071 ?auto_27068 ) ) ( ON_BOARD ?auto_27073 ?auto_27074 ) ( SUPPORTS ?auto_27073 ?auto_27070 ) ( not ( = ?auto_27071 ?auto_27072 ) ) ( HAVE_IMAGE ?auto_27068 ?auto_27069 ) ( not ( = ?auto_27068 ?auto_27072 ) ) ( not ( = ?auto_27069 ?auto_27070 ) ) ( CALIBRATION_TARGET ?auto_27073 ?auto_27072 ) ( POWER_AVAIL ?auto_27074 ) ( POINTING ?auto_27074 ?auto_27068 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27071 ?auto_27070 )
      ( GET-2IMAGE-VERIFY ?auto_27068 ?auto_27069 ?auto_27071 ?auto_27070 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27075 - DIRECTION
      ?auto_27076 - MODE
      ?auto_27078 - DIRECTION
      ?auto_27077 - MODE
    )
    :vars
    (
      ?auto_27080 - INSTRUMENT
      ?auto_27079 - SATELLITE
      ?auto_27081 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_27078 ?auto_27075 ) ) ( ON_BOARD ?auto_27080 ?auto_27079 ) ( SUPPORTS ?auto_27080 ?auto_27076 ) ( not ( = ?auto_27075 ?auto_27081 ) ) ( HAVE_IMAGE ?auto_27078 ?auto_27077 ) ( not ( = ?auto_27078 ?auto_27081 ) ) ( not ( = ?auto_27077 ?auto_27076 ) ) ( CALIBRATION_TARGET ?auto_27080 ?auto_27081 ) ( POWER_AVAIL ?auto_27079 ) ( POINTING ?auto_27079 ?auto_27078 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27078 ?auto_27077 ?auto_27075 ?auto_27076 )
      ( GET-2IMAGE-VERIFY ?auto_27075 ?auto_27076 ?auto_27078 ?auto_27077 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_27156 - DIRECTION
      ?auto_27157 - MODE
    )
    :vars
    (
      ?auto_27161 - DIRECTION
      ?auto_27160 - INSTRUMENT
      ?auto_27158 - SATELLITE
      ?auto_27162 - DIRECTION
      ?auto_27159 - MODE
      ?auto_27163 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_27156 ?auto_27161 ) ) ( ON_BOARD ?auto_27160 ?auto_27158 ) ( SUPPORTS ?auto_27160 ?auto_27157 ) ( not ( = ?auto_27156 ?auto_27162 ) ) ( HAVE_IMAGE ?auto_27161 ?auto_27159 ) ( not ( = ?auto_27161 ?auto_27162 ) ) ( not ( = ?auto_27159 ?auto_27157 ) ) ( CALIBRATION_TARGET ?auto_27160 ?auto_27162 ) ( POINTING ?auto_27158 ?auto_27161 ) ( ON_BOARD ?auto_27163 ?auto_27158 ) ( POWER_ON ?auto_27163 ) ( not ( = ?auto_27160 ?auto_27163 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_27163 ?auto_27158 )
      ( GET-2IMAGE ?auto_27161 ?auto_27159 ?auto_27156 ?auto_27157 )
      ( GET-1IMAGE-VERIFY ?auto_27156 ?auto_27157 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27164 - DIRECTION
      ?auto_27165 - MODE
      ?auto_27167 - DIRECTION
      ?auto_27166 - MODE
    )
    :vars
    (
      ?auto_27168 - INSTRUMENT
      ?auto_27171 - SATELLITE
      ?auto_27169 - DIRECTION
      ?auto_27170 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_27167 ?auto_27164 ) ) ( ON_BOARD ?auto_27168 ?auto_27171 ) ( SUPPORTS ?auto_27168 ?auto_27166 ) ( not ( = ?auto_27167 ?auto_27169 ) ) ( HAVE_IMAGE ?auto_27164 ?auto_27165 ) ( not ( = ?auto_27164 ?auto_27169 ) ) ( not ( = ?auto_27165 ?auto_27166 ) ) ( CALIBRATION_TARGET ?auto_27168 ?auto_27169 ) ( POINTING ?auto_27171 ?auto_27164 ) ( ON_BOARD ?auto_27170 ?auto_27171 ) ( POWER_ON ?auto_27170 ) ( not ( = ?auto_27168 ?auto_27170 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27167 ?auto_27166 )
      ( GET-2IMAGE-VERIFY ?auto_27164 ?auto_27165 ?auto_27167 ?auto_27166 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27172 - DIRECTION
      ?auto_27173 - MODE
      ?auto_27175 - DIRECTION
      ?auto_27174 - MODE
    )
    :vars
    (
      ?auto_27177 - INSTRUMENT
      ?auto_27179 - SATELLITE
      ?auto_27178 - DIRECTION
      ?auto_27176 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_27175 ?auto_27172 ) ) ( ON_BOARD ?auto_27177 ?auto_27179 ) ( SUPPORTS ?auto_27177 ?auto_27173 ) ( not ( = ?auto_27172 ?auto_27178 ) ) ( HAVE_IMAGE ?auto_27175 ?auto_27174 ) ( not ( = ?auto_27175 ?auto_27178 ) ) ( not ( = ?auto_27174 ?auto_27173 ) ) ( CALIBRATION_TARGET ?auto_27177 ?auto_27178 ) ( POINTING ?auto_27179 ?auto_27175 ) ( ON_BOARD ?auto_27176 ?auto_27179 ) ( POWER_ON ?auto_27176 ) ( not ( = ?auto_27177 ?auto_27176 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27175 ?auto_27174 ?auto_27172 ?auto_27173 )
      ( GET-2IMAGE-VERIFY ?auto_27172 ?auto_27173 ?auto_27175 ?auto_27174 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_27262 - DIRECTION
      ?auto_27263 - MODE
    )
    :vars
    (
      ?auto_27264 - DIRECTION
      ?auto_27267 - INSTRUMENT
      ?auto_27269 - SATELLITE
      ?auto_27268 - DIRECTION
      ?auto_27266 - MODE
      ?auto_27265 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_27262 ?auto_27264 ) ) ( ON_BOARD ?auto_27267 ?auto_27269 ) ( SUPPORTS ?auto_27267 ?auto_27263 ) ( not ( = ?auto_27262 ?auto_27268 ) ) ( not ( = ?auto_27264 ?auto_27268 ) ) ( not ( = ?auto_27266 ?auto_27263 ) ) ( CALIBRATION_TARGET ?auto_27267 ?auto_27268 ) ( POINTING ?auto_27269 ?auto_27264 ) ( ON_BOARD ?auto_27265 ?auto_27269 ) ( POWER_ON ?auto_27265 ) ( not ( = ?auto_27267 ?auto_27265 ) ) ( CALIBRATED ?auto_27265 ) ( SUPPORTS ?auto_27265 ?auto_27266 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27264 ?auto_27266 )
      ( GET-2IMAGE ?auto_27264 ?auto_27266 ?auto_27262 ?auto_27263 )
      ( GET-1IMAGE-VERIFY ?auto_27262 ?auto_27263 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27270 - DIRECTION
      ?auto_27271 - MODE
      ?auto_27273 - DIRECTION
      ?auto_27272 - MODE
    )
    :vars
    (
      ?auto_27276 - INSTRUMENT
      ?auto_27277 - SATELLITE
      ?auto_27275 - DIRECTION
      ?auto_27274 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_27273 ?auto_27270 ) ) ( ON_BOARD ?auto_27276 ?auto_27277 ) ( SUPPORTS ?auto_27276 ?auto_27272 ) ( not ( = ?auto_27273 ?auto_27275 ) ) ( not ( = ?auto_27270 ?auto_27275 ) ) ( not ( = ?auto_27271 ?auto_27272 ) ) ( CALIBRATION_TARGET ?auto_27276 ?auto_27275 ) ( POINTING ?auto_27277 ?auto_27270 ) ( ON_BOARD ?auto_27274 ?auto_27277 ) ( POWER_ON ?auto_27274 ) ( not ( = ?auto_27276 ?auto_27274 ) ) ( CALIBRATED ?auto_27274 ) ( SUPPORTS ?auto_27274 ?auto_27271 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27273 ?auto_27272 )
      ( GET-2IMAGE-VERIFY ?auto_27270 ?auto_27271 ?auto_27273 ?auto_27272 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27278 - DIRECTION
      ?auto_27279 - MODE
      ?auto_27281 - DIRECTION
      ?auto_27280 - MODE
    )
    :vars
    (
      ?auto_27282 - INSTRUMENT
      ?auto_27285 - SATELLITE
      ?auto_27284 - DIRECTION
      ?auto_27283 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_27281 ?auto_27278 ) ) ( ON_BOARD ?auto_27282 ?auto_27285 ) ( SUPPORTS ?auto_27282 ?auto_27279 ) ( not ( = ?auto_27278 ?auto_27284 ) ) ( not ( = ?auto_27281 ?auto_27284 ) ) ( not ( = ?auto_27280 ?auto_27279 ) ) ( CALIBRATION_TARGET ?auto_27282 ?auto_27284 ) ( POINTING ?auto_27285 ?auto_27281 ) ( ON_BOARD ?auto_27283 ?auto_27285 ) ( POWER_ON ?auto_27283 ) ( not ( = ?auto_27282 ?auto_27283 ) ) ( CALIBRATED ?auto_27283 ) ( SUPPORTS ?auto_27283 ?auto_27280 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27281 ?auto_27280 ?auto_27278 ?auto_27279 )
      ( GET-2IMAGE-VERIFY ?auto_27278 ?auto_27279 ?auto_27281 ?auto_27280 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_27368 - DIRECTION
      ?auto_27369 - MODE
    )
    :vars
    (
      ?auto_27370 - DIRECTION
      ?auto_27371 - INSTRUMENT
      ?auto_27374 - SATELLITE
      ?auto_27373 - DIRECTION
      ?auto_27375 - MODE
      ?auto_27372 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_27368 ?auto_27370 ) ) ( ON_BOARD ?auto_27371 ?auto_27374 ) ( SUPPORTS ?auto_27371 ?auto_27369 ) ( not ( = ?auto_27368 ?auto_27373 ) ) ( not ( = ?auto_27370 ?auto_27373 ) ) ( not ( = ?auto_27375 ?auto_27369 ) ) ( CALIBRATION_TARGET ?auto_27371 ?auto_27373 ) ( ON_BOARD ?auto_27372 ?auto_27374 ) ( POWER_ON ?auto_27372 ) ( not ( = ?auto_27371 ?auto_27372 ) ) ( CALIBRATED ?auto_27372 ) ( SUPPORTS ?auto_27372 ?auto_27375 ) ( POINTING ?auto_27374 ?auto_27373 ) )
    :subtasks
    ( ( !TURN_TO ?auto_27374 ?auto_27370 ?auto_27373 )
      ( GET-2IMAGE ?auto_27370 ?auto_27375 ?auto_27368 ?auto_27369 )
      ( GET-1IMAGE-VERIFY ?auto_27368 ?auto_27369 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27376 - DIRECTION
      ?auto_27377 - MODE
      ?auto_27379 - DIRECTION
      ?auto_27378 - MODE
    )
    :vars
    (
      ?auto_27380 - INSTRUMENT
      ?auto_27383 - SATELLITE
      ?auto_27382 - DIRECTION
      ?auto_27381 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_27379 ?auto_27376 ) ) ( ON_BOARD ?auto_27380 ?auto_27383 ) ( SUPPORTS ?auto_27380 ?auto_27378 ) ( not ( = ?auto_27379 ?auto_27382 ) ) ( not ( = ?auto_27376 ?auto_27382 ) ) ( not ( = ?auto_27377 ?auto_27378 ) ) ( CALIBRATION_TARGET ?auto_27380 ?auto_27382 ) ( ON_BOARD ?auto_27381 ?auto_27383 ) ( POWER_ON ?auto_27381 ) ( not ( = ?auto_27380 ?auto_27381 ) ) ( CALIBRATED ?auto_27381 ) ( SUPPORTS ?auto_27381 ?auto_27377 ) ( POINTING ?auto_27383 ?auto_27382 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27379 ?auto_27378 )
      ( GET-2IMAGE-VERIFY ?auto_27376 ?auto_27377 ?auto_27379 ?auto_27378 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27384 - DIRECTION
      ?auto_27385 - MODE
      ?auto_27387 - DIRECTION
      ?auto_27386 - MODE
    )
    :vars
    (
      ?auto_27391 - INSTRUMENT
      ?auto_27390 - SATELLITE
      ?auto_27389 - DIRECTION
      ?auto_27388 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_27387 ?auto_27384 ) ) ( ON_BOARD ?auto_27391 ?auto_27390 ) ( SUPPORTS ?auto_27391 ?auto_27385 ) ( not ( = ?auto_27384 ?auto_27389 ) ) ( not ( = ?auto_27387 ?auto_27389 ) ) ( not ( = ?auto_27386 ?auto_27385 ) ) ( CALIBRATION_TARGET ?auto_27391 ?auto_27389 ) ( ON_BOARD ?auto_27388 ?auto_27390 ) ( POWER_ON ?auto_27388 ) ( not ( = ?auto_27391 ?auto_27388 ) ) ( CALIBRATED ?auto_27388 ) ( SUPPORTS ?auto_27388 ?auto_27386 ) ( POINTING ?auto_27390 ?auto_27389 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27387 ?auto_27386 ?auto_27384 ?auto_27385 )
      ( GET-2IMAGE-VERIFY ?auto_27384 ?auto_27385 ?auto_27387 ?auto_27386 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_27474 - DIRECTION
      ?auto_27475 - MODE
    )
    :vars
    (
      ?auto_27477 - DIRECTION
      ?auto_27481 - INSTRUMENT
      ?auto_27480 - SATELLITE
      ?auto_27479 - DIRECTION
      ?auto_27478 - MODE
      ?auto_27476 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_27474 ?auto_27477 ) ) ( ON_BOARD ?auto_27481 ?auto_27480 ) ( SUPPORTS ?auto_27481 ?auto_27475 ) ( not ( = ?auto_27474 ?auto_27479 ) ) ( not ( = ?auto_27477 ?auto_27479 ) ) ( not ( = ?auto_27478 ?auto_27475 ) ) ( CALIBRATION_TARGET ?auto_27481 ?auto_27479 ) ( ON_BOARD ?auto_27476 ?auto_27480 ) ( POWER_ON ?auto_27476 ) ( not ( = ?auto_27481 ?auto_27476 ) ) ( SUPPORTS ?auto_27476 ?auto_27478 ) ( POINTING ?auto_27480 ?auto_27479 ) ( CALIBRATION_TARGET ?auto_27476 ?auto_27479 ) ( NOT_CALIBRATED ?auto_27476 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_27480 ?auto_27476 ?auto_27479 )
      ( GET-2IMAGE ?auto_27477 ?auto_27478 ?auto_27474 ?auto_27475 )
      ( GET-1IMAGE-VERIFY ?auto_27474 ?auto_27475 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27482 - DIRECTION
      ?auto_27483 - MODE
      ?auto_27485 - DIRECTION
      ?auto_27484 - MODE
    )
    :vars
    (
      ?auto_27489 - INSTRUMENT
      ?auto_27487 - SATELLITE
      ?auto_27488 - DIRECTION
      ?auto_27486 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_27485 ?auto_27482 ) ) ( ON_BOARD ?auto_27489 ?auto_27487 ) ( SUPPORTS ?auto_27489 ?auto_27484 ) ( not ( = ?auto_27485 ?auto_27488 ) ) ( not ( = ?auto_27482 ?auto_27488 ) ) ( not ( = ?auto_27483 ?auto_27484 ) ) ( CALIBRATION_TARGET ?auto_27489 ?auto_27488 ) ( ON_BOARD ?auto_27486 ?auto_27487 ) ( POWER_ON ?auto_27486 ) ( not ( = ?auto_27489 ?auto_27486 ) ) ( SUPPORTS ?auto_27486 ?auto_27483 ) ( POINTING ?auto_27487 ?auto_27488 ) ( CALIBRATION_TARGET ?auto_27486 ?auto_27488 ) ( NOT_CALIBRATED ?auto_27486 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27485 ?auto_27484 )
      ( GET-2IMAGE-VERIFY ?auto_27482 ?auto_27483 ?auto_27485 ?auto_27484 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27490 - DIRECTION
      ?auto_27491 - MODE
      ?auto_27493 - DIRECTION
      ?auto_27492 - MODE
    )
    :vars
    (
      ?auto_27495 - INSTRUMENT
      ?auto_27494 - SATELLITE
      ?auto_27496 - DIRECTION
      ?auto_27497 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_27493 ?auto_27490 ) ) ( ON_BOARD ?auto_27495 ?auto_27494 ) ( SUPPORTS ?auto_27495 ?auto_27491 ) ( not ( = ?auto_27490 ?auto_27496 ) ) ( not ( = ?auto_27493 ?auto_27496 ) ) ( not ( = ?auto_27492 ?auto_27491 ) ) ( CALIBRATION_TARGET ?auto_27495 ?auto_27496 ) ( ON_BOARD ?auto_27497 ?auto_27494 ) ( POWER_ON ?auto_27497 ) ( not ( = ?auto_27495 ?auto_27497 ) ) ( SUPPORTS ?auto_27497 ?auto_27492 ) ( POINTING ?auto_27494 ?auto_27496 ) ( CALIBRATION_TARGET ?auto_27497 ?auto_27496 ) ( NOT_CALIBRATED ?auto_27497 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27493 ?auto_27492 ?auto_27490 ?auto_27491 )
      ( GET-2IMAGE-VERIFY ?auto_27490 ?auto_27491 ?auto_27493 ?auto_27492 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_27580 - DIRECTION
      ?auto_27581 - MODE
    )
    :vars
    (
      ?auto_27587 - DIRECTION
      ?auto_27584 - INSTRUMENT
      ?auto_27582 - SATELLITE
      ?auto_27585 - DIRECTION
      ?auto_27583 - MODE
      ?auto_27586 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_27580 ?auto_27587 ) ) ( ON_BOARD ?auto_27584 ?auto_27582 ) ( SUPPORTS ?auto_27584 ?auto_27581 ) ( not ( = ?auto_27580 ?auto_27585 ) ) ( not ( = ?auto_27587 ?auto_27585 ) ) ( not ( = ?auto_27583 ?auto_27581 ) ) ( CALIBRATION_TARGET ?auto_27584 ?auto_27585 ) ( ON_BOARD ?auto_27586 ?auto_27582 ) ( not ( = ?auto_27584 ?auto_27586 ) ) ( SUPPORTS ?auto_27586 ?auto_27583 ) ( POINTING ?auto_27582 ?auto_27585 ) ( CALIBRATION_TARGET ?auto_27586 ?auto_27585 ) ( POWER_AVAIL ?auto_27582 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_27586 ?auto_27582 )
      ( GET-2IMAGE ?auto_27587 ?auto_27583 ?auto_27580 ?auto_27581 )
      ( GET-1IMAGE-VERIFY ?auto_27580 ?auto_27581 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27588 - DIRECTION
      ?auto_27589 - MODE
      ?auto_27591 - DIRECTION
      ?auto_27590 - MODE
    )
    :vars
    (
      ?auto_27592 - INSTRUMENT
      ?auto_27595 - SATELLITE
      ?auto_27594 - DIRECTION
      ?auto_27593 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_27591 ?auto_27588 ) ) ( ON_BOARD ?auto_27592 ?auto_27595 ) ( SUPPORTS ?auto_27592 ?auto_27590 ) ( not ( = ?auto_27591 ?auto_27594 ) ) ( not ( = ?auto_27588 ?auto_27594 ) ) ( not ( = ?auto_27589 ?auto_27590 ) ) ( CALIBRATION_TARGET ?auto_27592 ?auto_27594 ) ( ON_BOARD ?auto_27593 ?auto_27595 ) ( not ( = ?auto_27592 ?auto_27593 ) ) ( SUPPORTS ?auto_27593 ?auto_27589 ) ( POINTING ?auto_27595 ?auto_27594 ) ( CALIBRATION_TARGET ?auto_27593 ?auto_27594 ) ( POWER_AVAIL ?auto_27595 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27591 ?auto_27590 )
      ( GET-2IMAGE-VERIFY ?auto_27588 ?auto_27589 ?auto_27591 ?auto_27590 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27596 - DIRECTION
      ?auto_27597 - MODE
      ?auto_27599 - DIRECTION
      ?auto_27598 - MODE
    )
    :vars
    (
      ?auto_27600 - INSTRUMENT
      ?auto_27602 - SATELLITE
      ?auto_27603 - DIRECTION
      ?auto_27601 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_27599 ?auto_27596 ) ) ( ON_BOARD ?auto_27600 ?auto_27602 ) ( SUPPORTS ?auto_27600 ?auto_27597 ) ( not ( = ?auto_27596 ?auto_27603 ) ) ( not ( = ?auto_27599 ?auto_27603 ) ) ( not ( = ?auto_27598 ?auto_27597 ) ) ( CALIBRATION_TARGET ?auto_27600 ?auto_27603 ) ( ON_BOARD ?auto_27601 ?auto_27602 ) ( not ( = ?auto_27600 ?auto_27601 ) ) ( SUPPORTS ?auto_27601 ?auto_27598 ) ( POINTING ?auto_27602 ?auto_27603 ) ( CALIBRATION_TARGET ?auto_27601 ?auto_27603 ) ( POWER_AVAIL ?auto_27602 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27599 ?auto_27598 ?auto_27596 ?auto_27597 )
      ( GET-2IMAGE-VERIFY ?auto_27596 ?auto_27597 ?auto_27599 ?auto_27598 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_27686 - DIRECTION
      ?auto_27687 - MODE
    )
    :vars
    (
      ?auto_27693 - DIRECTION
      ?auto_27688 - INSTRUMENT
      ?auto_27691 - SATELLITE
      ?auto_27692 - DIRECTION
      ?auto_27689 - MODE
      ?auto_27690 - INSTRUMENT
      ?auto_27694 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_27686 ?auto_27693 ) ) ( ON_BOARD ?auto_27688 ?auto_27691 ) ( SUPPORTS ?auto_27688 ?auto_27687 ) ( not ( = ?auto_27686 ?auto_27692 ) ) ( not ( = ?auto_27693 ?auto_27692 ) ) ( not ( = ?auto_27689 ?auto_27687 ) ) ( CALIBRATION_TARGET ?auto_27688 ?auto_27692 ) ( ON_BOARD ?auto_27690 ?auto_27691 ) ( not ( = ?auto_27688 ?auto_27690 ) ) ( SUPPORTS ?auto_27690 ?auto_27689 ) ( CALIBRATION_TARGET ?auto_27690 ?auto_27692 ) ( POWER_AVAIL ?auto_27691 ) ( POINTING ?auto_27691 ?auto_27694 ) ( not ( = ?auto_27692 ?auto_27694 ) ) ( not ( = ?auto_27686 ?auto_27694 ) ) ( not ( = ?auto_27693 ?auto_27694 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_27691 ?auto_27692 ?auto_27694 )
      ( GET-2IMAGE ?auto_27693 ?auto_27689 ?auto_27686 ?auto_27687 )
      ( GET-1IMAGE-VERIFY ?auto_27686 ?auto_27687 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27695 - DIRECTION
      ?auto_27696 - MODE
      ?auto_27698 - DIRECTION
      ?auto_27697 - MODE
    )
    :vars
    (
      ?auto_27701 - INSTRUMENT
      ?auto_27700 - SATELLITE
      ?auto_27699 - DIRECTION
      ?auto_27702 - INSTRUMENT
      ?auto_27703 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_27698 ?auto_27695 ) ) ( ON_BOARD ?auto_27701 ?auto_27700 ) ( SUPPORTS ?auto_27701 ?auto_27697 ) ( not ( = ?auto_27698 ?auto_27699 ) ) ( not ( = ?auto_27695 ?auto_27699 ) ) ( not ( = ?auto_27696 ?auto_27697 ) ) ( CALIBRATION_TARGET ?auto_27701 ?auto_27699 ) ( ON_BOARD ?auto_27702 ?auto_27700 ) ( not ( = ?auto_27701 ?auto_27702 ) ) ( SUPPORTS ?auto_27702 ?auto_27696 ) ( CALIBRATION_TARGET ?auto_27702 ?auto_27699 ) ( POWER_AVAIL ?auto_27700 ) ( POINTING ?auto_27700 ?auto_27703 ) ( not ( = ?auto_27699 ?auto_27703 ) ) ( not ( = ?auto_27698 ?auto_27703 ) ) ( not ( = ?auto_27695 ?auto_27703 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27698 ?auto_27697 )
      ( GET-2IMAGE-VERIFY ?auto_27695 ?auto_27696 ?auto_27698 ?auto_27697 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27704 - DIRECTION
      ?auto_27705 - MODE
      ?auto_27707 - DIRECTION
      ?auto_27706 - MODE
    )
    :vars
    (
      ?auto_27708 - INSTRUMENT
      ?auto_27712 - SATELLITE
      ?auto_27709 - DIRECTION
      ?auto_27711 - INSTRUMENT
      ?auto_27710 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_27707 ?auto_27704 ) ) ( ON_BOARD ?auto_27708 ?auto_27712 ) ( SUPPORTS ?auto_27708 ?auto_27705 ) ( not ( = ?auto_27704 ?auto_27709 ) ) ( not ( = ?auto_27707 ?auto_27709 ) ) ( not ( = ?auto_27706 ?auto_27705 ) ) ( CALIBRATION_TARGET ?auto_27708 ?auto_27709 ) ( ON_BOARD ?auto_27711 ?auto_27712 ) ( not ( = ?auto_27708 ?auto_27711 ) ) ( SUPPORTS ?auto_27711 ?auto_27706 ) ( CALIBRATION_TARGET ?auto_27711 ?auto_27709 ) ( POWER_AVAIL ?auto_27712 ) ( POINTING ?auto_27712 ?auto_27710 ) ( not ( = ?auto_27709 ?auto_27710 ) ) ( not ( = ?auto_27704 ?auto_27710 ) ) ( not ( = ?auto_27707 ?auto_27710 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27707 ?auto_27706 ?auto_27704 ?auto_27705 )
      ( GET-2IMAGE-VERIFY ?auto_27704 ?auto_27705 ?auto_27707 ?auto_27706 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_27939 - DIRECTION
      ?auto_27940 - MODE
    )
    :vars
    (
      ?auto_27941 - INSTRUMENT
      ?auto_27942 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_27941 ) ( ON_BOARD ?auto_27941 ?auto_27942 ) ( SUPPORTS ?auto_27941 ?auto_27940 ) ( POWER_ON ?auto_27941 ) ( POINTING ?auto_27942 ?auto_27939 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_27942 ?auto_27939 ?auto_27941 ?auto_27940 )
      ( GET-1IMAGE-VERIFY ?auto_27939 ?auto_27940 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27943 - DIRECTION
      ?auto_27944 - MODE
      ?auto_27946 - DIRECTION
      ?auto_27945 - MODE
    )
    :vars
    (
      ?auto_27948 - INSTRUMENT
      ?auto_27947 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_27946 ?auto_27943 ) ) ( CALIBRATED ?auto_27948 ) ( ON_BOARD ?auto_27948 ?auto_27947 ) ( SUPPORTS ?auto_27948 ?auto_27945 ) ( POWER_ON ?auto_27948 ) ( POINTING ?auto_27947 ?auto_27946 ) ( HAVE_IMAGE ?auto_27943 ?auto_27944 ) ( not ( = ?auto_27944 ?auto_27945 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27946 ?auto_27945 )
      ( GET-2IMAGE-VERIFY ?auto_27943 ?auto_27944 ?auto_27946 ?auto_27945 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27949 - DIRECTION
      ?auto_27950 - MODE
      ?auto_27952 - DIRECTION
      ?auto_27951 - MODE
    )
    :vars
    (
      ?auto_27954 - INSTRUMENT
      ?auto_27953 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_27952 ?auto_27949 ) ) ( CALIBRATED ?auto_27954 ) ( ON_BOARD ?auto_27954 ?auto_27953 ) ( SUPPORTS ?auto_27954 ?auto_27951 ) ( POWER_ON ?auto_27954 ) ( POINTING ?auto_27953 ?auto_27952 ) ( HAVE_IMAGE ?auto_27949 ?auto_27950 ) ( not ( = ?auto_27950 ?auto_27951 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27952 ?auto_27951 )
      ( GET-2IMAGE-VERIFY ?auto_27949 ?auto_27950 ?auto_27952 ?auto_27951 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27955 - DIRECTION
      ?auto_27956 - MODE
      ?auto_27958 - DIRECTION
      ?auto_27957 - MODE
    )
    :vars
    (
      ?auto_27960 - INSTRUMENT
      ?auto_27959 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_27958 ?auto_27955 ) ) ( CALIBRATED ?auto_27960 ) ( ON_BOARD ?auto_27960 ?auto_27959 ) ( SUPPORTS ?auto_27960 ?auto_27956 ) ( POWER_ON ?auto_27960 ) ( POINTING ?auto_27959 ?auto_27955 ) ( HAVE_IMAGE ?auto_27958 ?auto_27957 ) ( not ( = ?auto_27956 ?auto_27957 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27955 ?auto_27956 )
      ( GET-2IMAGE-VERIFY ?auto_27955 ?auto_27956 ?auto_27958 ?auto_27957 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_27961 - DIRECTION
      ?auto_27962 - MODE
      ?auto_27964 - DIRECTION
      ?auto_27963 - MODE
    )
    :vars
    (
      ?auto_27966 - INSTRUMENT
      ?auto_27965 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_27964 ?auto_27961 ) ) ( CALIBRATED ?auto_27966 ) ( ON_BOARD ?auto_27966 ?auto_27965 ) ( SUPPORTS ?auto_27966 ?auto_27962 ) ( POWER_ON ?auto_27966 ) ( POINTING ?auto_27965 ?auto_27961 ) ( HAVE_IMAGE ?auto_27964 ?auto_27963 ) ( not ( = ?auto_27962 ?auto_27963 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27961 ?auto_27962 )
      ( GET-2IMAGE-VERIFY ?auto_27961 ?auto_27962 ?auto_27964 ?auto_27963 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27981 - DIRECTION
      ?auto_27982 - MODE
      ?auto_27984 - DIRECTION
      ?auto_27983 - MODE
      ?auto_27986 - DIRECTION
      ?auto_27985 - MODE
    )
    :vars
    (
      ?auto_27988 - INSTRUMENT
      ?auto_27987 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_27984 ?auto_27981 ) ) ( not ( = ?auto_27986 ?auto_27981 ) ) ( not ( = ?auto_27986 ?auto_27984 ) ) ( CALIBRATED ?auto_27988 ) ( ON_BOARD ?auto_27988 ?auto_27987 ) ( SUPPORTS ?auto_27988 ?auto_27985 ) ( POWER_ON ?auto_27988 ) ( POINTING ?auto_27987 ?auto_27986 ) ( HAVE_IMAGE ?auto_27981 ?auto_27982 ) ( HAVE_IMAGE ?auto_27984 ?auto_27983 ) ( not ( = ?auto_27982 ?auto_27983 ) ) ( not ( = ?auto_27982 ?auto_27985 ) ) ( not ( = ?auto_27983 ?auto_27985 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27986 ?auto_27985 )
      ( GET-3IMAGE-VERIFY ?auto_27981 ?auto_27982 ?auto_27984 ?auto_27983 ?auto_27986 ?auto_27985 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27997 - DIRECTION
      ?auto_27998 - MODE
      ?auto_28000 - DIRECTION
      ?auto_27999 - MODE
      ?auto_28002 - DIRECTION
      ?auto_28001 - MODE
    )
    :vars
    (
      ?auto_28004 - INSTRUMENT
      ?auto_28003 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_28000 ?auto_27997 ) ) ( not ( = ?auto_28002 ?auto_27997 ) ) ( not ( = ?auto_28002 ?auto_28000 ) ) ( CALIBRATED ?auto_28004 ) ( ON_BOARD ?auto_28004 ?auto_28003 ) ( SUPPORTS ?auto_28004 ?auto_27999 ) ( POWER_ON ?auto_28004 ) ( POINTING ?auto_28003 ?auto_28000 ) ( HAVE_IMAGE ?auto_27997 ?auto_27998 ) ( HAVE_IMAGE ?auto_28002 ?auto_28001 ) ( not ( = ?auto_27998 ?auto_27999 ) ) ( not ( = ?auto_27998 ?auto_28001 ) ) ( not ( = ?auto_27999 ?auto_28001 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28000 ?auto_27999 )
      ( GET-3IMAGE-VERIFY ?auto_27997 ?auto_27998 ?auto_28000 ?auto_27999 ?auto_28002 ?auto_28001 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28013 - DIRECTION
      ?auto_28014 - MODE
      ?auto_28016 - DIRECTION
      ?auto_28015 - MODE
      ?auto_28018 - DIRECTION
      ?auto_28017 - MODE
    )
    :vars
    (
      ?auto_28020 - INSTRUMENT
      ?auto_28019 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_28016 ?auto_28013 ) ) ( not ( = ?auto_28018 ?auto_28013 ) ) ( not ( = ?auto_28018 ?auto_28016 ) ) ( CALIBRATED ?auto_28020 ) ( ON_BOARD ?auto_28020 ?auto_28019 ) ( SUPPORTS ?auto_28020 ?auto_28017 ) ( POWER_ON ?auto_28020 ) ( POINTING ?auto_28019 ?auto_28018 ) ( HAVE_IMAGE ?auto_28013 ?auto_28014 ) ( HAVE_IMAGE ?auto_28016 ?auto_28015 ) ( not ( = ?auto_28014 ?auto_28015 ) ) ( not ( = ?auto_28014 ?auto_28017 ) ) ( not ( = ?auto_28015 ?auto_28017 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28018 ?auto_28017 )
      ( GET-3IMAGE-VERIFY ?auto_28013 ?auto_28014 ?auto_28016 ?auto_28015 ?auto_28018 ?auto_28017 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28029 - DIRECTION
      ?auto_28030 - MODE
      ?auto_28032 - DIRECTION
      ?auto_28031 - MODE
      ?auto_28034 - DIRECTION
      ?auto_28033 - MODE
    )
    :vars
    (
      ?auto_28036 - INSTRUMENT
      ?auto_28035 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_28032 ?auto_28029 ) ) ( not ( = ?auto_28034 ?auto_28029 ) ) ( not ( = ?auto_28034 ?auto_28032 ) ) ( CALIBRATED ?auto_28036 ) ( ON_BOARD ?auto_28036 ?auto_28035 ) ( SUPPORTS ?auto_28036 ?auto_28031 ) ( POWER_ON ?auto_28036 ) ( POINTING ?auto_28035 ?auto_28032 ) ( HAVE_IMAGE ?auto_28029 ?auto_28030 ) ( HAVE_IMAGE ?auto_28034 ?auto_28033 ) ( not ( = ?auto_28030 ?auto_28031 ) ) ( not ( = ?auto_28030 ?auto_28033 ) ) ( not ( = ?auto_28031 ?auto_28033 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28032 ?auto_28031 )
      ( GET-3IMAGE-VERIFY ?auto_28029 ?auto_28030 ?auto_28032 ?auto_28031 ?auto_28034 ?auto_28033 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28061 - DIRECTION
      ?auto_28062 - MODE
      ?auto_28064 - DIRECTION
      ?auto_28063 - MODE
      ?auto_28066 - DIRECTION
      ?auto_28065 - MODE
    )
    :vars
    (
      ?auto_28068 - INSTRUMENT
      ?auto_28067 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_28064 ?auto_28061 ) ) ( not ( = ?auto_28066 ?auto_28061 ) ) ( not ( = ?auto_28066 ?auto_28064 ) ) ( CALIBRATED ?auto_28068 ) ( ON_BOARD ?auto_28068 ?auto_28067 ) ( SUPPORTS ?auto_28068 ?auto_28062 ) ( POWER_ON ?auto_28068 ) ( POINTING ?auto_28067 ?auto_28061 ) ( HAVE_IMAGE ?auto_28064 ?auto_28063 ) ( HAVE_IMAGE ?auto_28066 ?auto_28065 ) ( not ( = ?auto_28062 ?auto_28063 ) ) ( not ( = ?auto_28062 ?auto_28065 ) ) ( not ( = ?auto_28063 ?auto_28065 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28061 ?auto_28062 )
      ( GET-3IMAGE-VERIFY ?auto_28061 ?auto_28062 ?auto_28064 ?auto_28063 ?auto_28066 ?auto_28065 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28077 - DIRECTION
      ?auto_28078 - MODE
      ?auto_28080 - DIRECTION
      ?auto_28079 - MODE
      ?auto_28082 - DIRECTION
      ?auto_28081 - MODE
    )
    :vars
    (
      ?auto_28084 - INSTRUMENT
      ?auto_28083 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_28080 ?auto_28077 ) ) ( not ( = ?auto_28082 ?auto_28077 ) ) ( not ( = ?auto_28082 ?auto_28080 ) ) ( CALIBRATED ?auto_28084 ) ( ON_BOARD ?auto_28084 ?auto_28083 ) ( SUPPORTS ?auto_28084 ?auto_28078 ) ( POWER_ON ?auto_28084 ) ( POINTING ?auto_28083 ?auto_28077 ) ( HAVE_IMAGE ?auto_28080 ?auto_28079 ) ( HAVE_IMAGE ?auto_28082 ?auto_28081 ) ( not ( = ?auto_28078 ?auto_28079 ) ) ( not ( = ?auto_28078 ?auto_28081 ) ) ( not ( = ?auto_28079 ?auto_28081 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28077 ?auto_28078 )
      ( GET-3IMAGE-VERIFY ?auto_28077 ?auto_28078 ?auto_28080 ?auto_28079 ?auto_28082 ?auto_28081 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_28125 - DIRECTION
      ?auto_28126 - MODE
    )
    :vars
    (
      ?auto_28128 - INSTRUMENT
      ?auto_28127 - SATELLITE
      ?auto_28129 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_28128 ) ( ON_BOARD ?auto_28128 ?auto_28127 ) ( SUPPORTS ?auto_28128 ?auto_28126 ) ( POWER_ON ?auto_28128 ) ( POINTING ?auto_28127 ?auto_28129 ) ( not ( = ?auto_28125 ?auto_28129 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_28127 ?auto_28125 ?auto_28129 )
      ( GET-1IMAGE ?auto_28125 ?auto_28126 )
      ( GET-1IMAGE-VERIFY ?auto_28125 ?auto_28126 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28130 - DIRECTION
      ?auto_28131 - MODE
      ?auto_28133 - DIRECTION
      ?auto_28132 - MODE
    )
    :vars
    (
      ?auto_28135 - INSTRUMENT
      ?auto_28134 - SATELLITE
      ?auto_28136 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28133 ?auto_28130 ) ) ( CALIBRATED ?auto_28135 ) ( ON_BOARD ?auto_28135 ?auto_28134 ) ( SUPPORTS ?auto_28135 ?auto_28132 ) ( POWER_ON ?auto_28135 ) ( POINTING ?auto_28134 ?auto_28136 ) ( not ( = ?auto_28133 ?auto_28136 ) ) ( HAVE_IMAGE ?auto_28130 ?auto_28131 ) ( not ( = ?auto_28130 ?auto_28136 ) ) ( not ( = ?auto_28131 ?auto_28132 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28133 ?auto_28132 )
      ( GET-2IMAGE-VERIFY ?auto_28130 ?auto_28131 ?auto_28133 ?auto_28132 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28137 - DIRECTION
      ?auto_28138 - MODE
      ?auto_28140 - DIRECTION
      ?auto_28139 - MODE
    )
    :vars
    (
      ?auto_28141 - DIRECTION
      ?auto_28143 - INSTRUMENT
      ?auto_28144 - SATELLITE
      ?auto_28142 - DIRECTION
      ?auto_28145 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_28140 ?auto_28137 ) ) ( not ( = ?auto_28140 ?auto_28141 ) ) ( CALIBRATED ?auto_28143 ) ( ON_BOARD ?auto_28143 ?auto_28144 ) ( SUPPORTS ?auto_28143 ?auto_28139 ) ( POWER_ON ?auto_28143 ) ( POINTING ?auto_28144 ?auto_28142 ) ( not ( = ?auto_28140 ?auto_28142 ) ) ( HAVE_IMAGE ?auto_28141 ?auto_28145 ) ( not ( = ?auto_28141 ?auto_28142 ) ) ( not ( = ?auto_28145 ?auto_28139 ) ) ( HAVE_IMAGE ?auto_28137 ?auto_28138 ) ( not ( = ?auto_28137 ?auto_28141 ) ) ( not ( = ?auto_28137 ?auto_28142 ) ) ( not ( = ?auto_28138 ?auto_28139 ) ) ( not ( = ?auto_28138 ?auto_28145 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28141 ?auto_28145 ?auto_28140 ?auto_28139 )
      ( GET-2IMAGE-VERIFY ?auto_28137 ?auto_28138 ?auto_28140 ?auto_28139 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28146 - DIRECTION
      ?auto_28147 - MODE
      ?auto_28149 - DIRECTION
      ?auto_28148 - MODE
    )
    :vars
    (
      ?auto_28151 - INSTRUMENT
      ?auto_28152 - SATELLITE
      ?auto_28150 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28149 ?auto_28146 ) ) ( CALIBRATED ?auto_28151 ) ( ON_BOARD ?auto_28151 ?auto_28152 ) ( SUPPORTS ?auto_28151 ?auto_28147 ) ( POWER_ON ?auto_28151 ) ( POINTING ?auto_28152 ?auto_28150 ) ( not ( = ?auto_28146 ?auto_28150 ) ) ( HAVE_IMAGE ?auto_28149 ?auto_28148 ) ( not ( = ?auto_28149 ?auto_28150 ) ) ( not ( = ?auto_28148 ?auto_28147 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28149 ?auto_28148 ?auto_28146 ?auto_28147 )
      ( GET-2IMAGE-VERIFY ?auto_28146 ?auto_28147 ?auto_28149 ?auto_28148 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28153 - DIRECTION
      ?auto_28154 - MODE
      ?auto_28156 - DIRECTION
      ?auto_28155 - MODE
    )
    :vars
    (
      ?auto_28157 - DIRECTION
      ?auto_28159 - INSTRUMENT
      ?auto_28160 - SATELLITE
      ?auto_28158 - DIRECTION
      ?auto_28161 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_28156 ?auto_28153 ) ) ( not ( = ?auto_28153 ?auto_28157 ) ) ( CALIBRATED ?auto_28159 ) ( ON_BOARD ?auto_28159 ?auto_28160 ) ( SUPPORTS ?auto_28159 ?auto_28154 ) ( POWER_ON ?auto_28159 ) ( POINTING ?auto_28160 ?auto_28158 ) ( not ( = ?auto_28153 ?auto_28158 ) ) ( HAVE_IMAGE ?auto_28157 ?auto_28161 ) ( not ( = ?auto_28157 ?auto_28158 ) ) ( not ( = ?auto_28161 ?auto_28154 ) ) ( HAVE_IMAGE ?auto_28156 ?auto_28155 ) ( not ( = ?auto_28154 ?auto_28155 ) ) ( not ( = ?auto_28156 ?auto_28157 ) ) ( not ( = ?auto_28156 ?auto_28158 ) ) ( not ( = ?auto_28155 ?auto_28161 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28157 ?auto_28161 ?auto_28153 ?auto_28154 )
      ( GET-2IMAGE-VERIFY ?auto_28153 ?auto_28154 ?auto_28156 ?auto_28155 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28180 - DIRECTION
      ?auto_28181 - MODE
      ?auto_28183 - DIRECTION
      ?auto_28182 - MODE
      ?auto_28185 - DIRECTION
      ?auto_28184 - MODE
    )
    :vars
    (
      ?auto_28187 - INSTRUMENT
      ?auto_28188 - SATELLITE
      ?auto_28186 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28183 ?auto_28180 ) ) ( not ( = ?auto_28185 ?auto_28180 ) ) ( not ( = ?auto_28185 ?auto_28183 ) ) ( CALIBRATED ?auto_28187 ) ( ON_BOARD ?auto_28187 ?auto_28188 ) ( SUPPORTS ?auto_28187 ?auto_28184 ) ( POWER_ON ?auto_28187 ) ( POINTING ?auto_28188 ?auto_28186 ) ( not ( = ?auto_28185 ?auto_28186 ) ) ( HAVE_IMAGE ?auto_28180 ?auto_28181 ) ( not ( = ?auto_28180 ?auto_28186 ) ) ( not ( = ?auto_28181 ?auto_28184 ) ) ( HAVE_IMAGE ?auto_28183 ?auto_28182 ) ( not ( = ?auto_28181 ?auto_28182 ) ) ( not ( = ?auto_28183 ?auto_28186 ) ) ( not ( = ?auto_28182 ?auto_28184 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28180 ?auto_28181 ?auto_28185 ?auto_28184 )
      ( GET-3IMAGE-VERIFY ?auto_28180 ?auto_28181 ?auto_28183 ?auto_28182 ?auto_28185 ?auto_28184 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28198 - DIRECTION
      ?auto_28199 - MODE
      ?auto_28201 - DIRECTION
      ?auto_28200 - MODE
      ?auto_28203 - DIRECTION
      ?auto_28202 - MODE
    )
    :vars
    (
      ?auto_28205 - INSTRUMENT
      ?auto_28206 - SATELLITE
      ?auto_28204 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28201 ?auto_28198 ) ) ( not ( = ?auto_28203 ?auto_28198 ) ) ( not ( = ?auto_28203 ?auto_28201 ) ) ( CALIBRATED ?auto_28205 ) ( ON_BOARD ?auto_28205 ?auto_28206 ) ( SUPPORTS ?auto_28205 ?auto_28200 ) ( POWER_ON ?auto_28205 ) ( POINTING ?auto_28206 ?auto_28204 ) ( not ( = ?auto_28201 ?auto_28204 ) ) ( HAVE_IMAGE ?auto_28198 ?auto_28199 ) ( not ( = ?auto_28198 ?auto_28204 ) ) ( not ( = ?auto_28199 ?auto_28200 ) ) ( HAVE_IMAGE ?auto_28203 ?auto_28202 ) ( not ( = ?auto_28199 ?auto_28202 ) ) ( not ( = ?auto_28200 ?auto_28202 ) ) ( not ( = ?auto_28203 ?auto_28204 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28198 ?auto_28199 ?auto_28201 ?auto_28200 )
      ( GET-3IMAGE-VERIFY ?auto_28198 ?auto_28199 ?auto_28201 ?auto_28200 ?auto_28203 ?auto_28202 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28216 - DIRECTION
      ?auto_28217 - MODE
      ?auto_28219 - DIRECTION
      ?auto_28218 - MODE
      ?auto_28221 - DIRECTION
      ?auto_28220 - MODE
    )
    :vars
    (
      ?auto_28223 - INSTRUMENT
      ?auto_28224 - SATELLITE
      ?auto_28222 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28219 ?auto_28216 ) ) ( not ( = ?auto_28221 ?auto_28216 ) ) ( not ( = ?auto_28221 ?auto_28219 ) ) ( CALIBRATED ?auto_28223 ) ( ON_BOARD ?auto_28223 ?auto_28224 ) ( SUPPORTS ?auto_28223 ?auto_28220 ) ( POWER_ON ?auto_28223 ) ( POINTING ?auto_28224 ?auto_28222 ) ( not ( = ?auto_28221 ?auto_28222 ) ) ( HAVE_IMAGE ?auto_28219 ?auto_28218 ) ( not ( = ?auto_28219 ?auto_28222 ) ) ( not ( = ?auto_28218 ?auto_28220 ) ) ( HAVE_IMAGE ?auto_28216 ?auto_28217 ) ( not ( = ?auto_28216 ?auto_28222 ) ) ( not ( = ?auto_28217 ?auto_28218 ) ) ( not ( = ?auto_28217 ?auto_28220 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28219 ?auto_28218 ?auto_28221 ?auto_28220 )
      ( GET-3IMAGE-VERIFY ?auto_28216 ?auto_28217 ?auto_28219 ?auto_28218 ?auto_28221 ?auto_28220 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28236 - DIRECTION
      ?auto_28237 - MODE
      ?auto_28239 - DIRECTION
      ?auto_28238 - MODE
      ?auto_28241 - DIRECTION
      ?auto_28240 - MODE
    )
    :vars
    (
      ?auto_28243 - INSTRUMENT
      ?auto_28244 - SATELLITE
      ?auto_28242 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28239 ?auto_28236 ) ) ( not ( = ?auto_28241 ?auto_28236 ) ) ( not ( = ?auto_28241 ?auto_28239 ) ) ( CALIBRATED ?auto_28243 ) ( ON_BOARD ?auto_28243 ?auto_28244 ) ( SUPPORTS ?auto_28243 ?auto_28238 ) ( POWER_ON ?auto_28243 ) ( POINTING ?auto_28244 ?auto_28242 ) ( not ( = ?auto_28239 ?auto_28242 ) ) ( HAVE_IMAGE ?auto_28241 ?auto_28240 ) ( not ( = ?auto_28241 ?auto_28242 ) ) ( not ( = ?auto_28240 ?auto_28238 ) ) ( HAVE_IMAGE ?auto_28236 ?auto_28237 ) ( not ( = ?auto_28236 ?auto_28242 ) ) ( not ( = ?auto_28237 ?auto_28238 ) ) ( not ( = ?auto_28237 ?auto_28240 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28241 ?auto_28240 ?auto_28239 ?auto_28238 )
      ( GET-3IMAGE-VERIFY ?auto_28236 ?auto_28237 ?auto_28239 ?auto_28238 ?auto_28241 ?auto_28240 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28276 - DIRECTION
      ?auto_28277 - MODE
      ?auto_28279 - DIRECTION
      ?auto_28278 - MODE
      ?auto_28281 - DIRECTION
      ?auto_28280 - MODE
    )
    :vars
    (
      ?auto_28283 - INSTRUMENT
      ?auto_28284 - SATELLITE
      ?auto_28282 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28279 ?auto_28276 ) ) ( not ( = ?auto_28281 ?auto_28276 ) ) ( not ( = ?auto_28281 ?auto_28279 ) ) ( CALIBRATED ?auto_28283 ) ( ON_BOARD ?auto_28283 ?auto_28284 ) ( SUPPORTS ?auto_28283 ?auto_28277 ) ( POWER_ON ?auto_28283 ) ( POINTING ?auto_28284 ?auto_28282 ) ( not ( = ?auto_28276 ?auto_28282 ) ) ( HAVE_IMAGE ?auto_28279 ?auto_28278 ) ( not ( = ?auto_28279 ?auto_28282 ) ) ( not ( = ?auto_28278 ?auto_28277 ) ) ( HAVE_IMAGE ?auto_28281 ?auto_28280 ) ( not ( = ?auto_28277 ?auto_28280 ) ) ( not ( = ?auto_28278 ?auto_28280 ) ) ( not ( = ?auto_28281 ?auto_28282 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28279 ?auto_28278 ?auto_28276 ?auto_28277 )
      ( GET-3IMAGE-VERIFY ?auto_28276 ?auto_28277 ?auto_28279 ?auto_28278 ?auto_28281 ?auto_28280 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28294 - DIRECTION
      ?auto_28295 - MODE
      ?auto_28297 - DIRECTION
      ?auto_28296 - MODE
      ?auto_28299 - DIRECTION
      ?auto_28298 - MODE
    )
    :vars
    (
      ?auto_28301 - INSTRUMENT
      ?auto_28302 - SATELLITE
      ?auto_28300 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28297 ?auto_28294 ) ) ( not ( = ?auto_28299 ?auto_28294 ) ) ( not ( = ?auto_28299 ?auto_28297 ) ) ( CALIBRATED ?auto_28301 ) ( ON_BOARD ?auto_28301 ?auto_28302 ) ( SUPPORTS ?auto_28301 ?auto_28295 ) ( POWER_ON ?auto_28301 ) ( POINTING ?auto_28302 ?auto_28300 ) ( not ( = ?auto_28294 ?auto_28300 ) ) ( HAVE_IMAGE ?auto_28299 ?auto_28298 ) ( not ( = ?auto_28299 ?auto_28300 ) ) ( not ( = ?auto_28298 ?auto_28295 ) ) ( HAVE_IMAGE ?auto_28297 ?auto_28296 ) ( not ( = ?auto_28295 ?auto_28296 ) ) ( not ( = ?auto_28297 ?auto_28300 ) ) ( not ( = ?auto_28296 ?auto_28298 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28299 ?auto_28298 ?auto_28294 ?auto_28295 )
      ( GET-3IMAGE-VERIFY ?auto_28294 ?auto_28295 ?auto_28297 ?auto_28296 ?auto_28299 ?auto_28298 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_28356 - DIRECTION
      ?auto_28357 - MODE
    )
    :vars
    (
      ?auto_28358 - DIRECTION
      ?auto_28360 - INSTRUMENT
      ?auto_28361 - SATELLITE
      ?auto_28359 - DIRECTION
      ?auto_28362 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_28356 ?auto_28358 ) ) ( ON_BOARD ?auto_28360 ?auto_28361 ) ( SUPPORTS ?auto_28360 ?auto_28357 ) ( POWER_ON ?auto_28360 ) ( POINTING ?auto_28361 ?auto_28359 ) ( not ( = ?auto_28356 ?auto_28359 ) ) ( HAVE_IMAGE ?auto_28358 ?auto_28362 ) ( not ( = ?auto_28358 ?auto_28359 ) ) ( not ( = ?auto_28362 ?auto_28357 ) ) ( CALIBRATION_TARGET ?auto_28360 ?auto_28359 ) ( NOT_CALIBRATED ?auto_28360 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_28361 ?auto_28360 ?auto_28359 )
      ( GET-2IMAGE ?auto_28358 ?auto_28362 ?auto_28356 ?auto_28357 )
      ( GET-1IMAGE-VERIFY ?auto_28356 ?auto_28357 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28363 - DIRECTION
      ?auto_28364 - MODE
      ?auto_28366 - DIRECTION
      ?auto_28365 - MODE
    )
    :vars
    (
      ?auto_28367 - INSTRUMENT
      ?auto_28368 - SATELLITE
      ?auto_28369 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28366 ?auto_28363 ) ) ( ON_BOARD ?auto_28367 ?auto_28368 ) ( SUPPORTS ?auto_28367 ?auto_28365 ) ( POWER_ON ?auto_28367 ) ( POINTING ?auto_28368 ?auto_28369 ) ( not ( = ?auto_28366 ?auto_28369 ) ) ( HAVE_IMAGE ?auto_28363 ?auto_28364 ) ( not ( = ?auto_28363 ?auto_28369 ) ) ( not ( = ?auto_28364 ?auto_28365 ) ) ( CALIBRATION_TARGET ?auto_28367 ?auto_28369 ) ( NOT_CALIBRATED ?auto_28367 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28366 ?auto_28365 )
      ( GET-2IMAGE-VERIFY ?auto_28363 ?auto_28364 ?auto_28366 ?auto_28365 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28370 - DIRECTION
      ?auto_28371 - MODE
      ?auto_28373 - DIRECTION
      ?auto_28372 - MODE
    )
    :vars
    (
      ?auto_28374 - DIRECTION
      ?auto_28376 - INSTRUMENT
      ?auto_28378 - SATELLITE
      ?auto_28377 - DIRECTION
      ?auto_28375 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_28373 ?auto_28370 ) ) ( not ( = ?auto_28373 ?auto_28374 ) ) ( ON_BOARD ?auto_28376 ?auto_28378 ) ( SUPPORTS ?auto_28376 ?auto_28372 ) ( POWER_ON ?auto_28376 ) ( POINTING ?auto_28378 ?auto_28377 ) ( not ( = ?auto_28373 ?auto_28377 ) ) ( HAVE_IMAGE ?auto_28374 ?auto_28375 ) ( not ( = ?auto_28374 ?auto_28377 ) ) ( not ( = ?auto_28375 ?auto_28372 ) ) ( CALIBRATION_TARGET ?auto_28376 ?auto_28377 ) ( NOT_CALIBRATED ?auto_28376 ) ( HAVE_IMAGE ?auto_28370 ?auto_28371 ) ( not ( = ?auto_28370 ?auto_28374 ) ) ( not ( = ?auto_28370 ?auto_28377 ) ) ( not ( = ?auto_28371 ?auto_28372 ) ) ( not ( = ?auto_28371 ?auto_28375 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28374 ?auto_28375 ?auto_28373 ?auto_28372 )
      ( GET-2IMAGE-VERIFY ?auto_28370 ?auto_28371 ?auto_28373 ?auto_28372 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28379 - DIRECTION
      ?auto_28380 - MODE
      ?auto_28382 - DIRECTION
      ?auto_28381 - MODE
    )
    :vars
    (
      ?auto_28383 - INSTRUMENT
      ?auto_28385 - SATELLITE
      ?auto_28384 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28382 ?auto_28379 ) ) ( ON_BOARD ?auto_28383 ?auto_28385 ) ( SUPPORTS ?auto_28383 ?auto_28380 ) ( POWER_ON ?auto_28383 ) ( POINTING ?auto_28385 ?auto_28384 ) ( not ( = ?auto_28379 ?auto_28384 ) ) ( HAVE_IMAGE ?auto_28382 ?auto_28381 ) ( not ( = ?auto_28382 ?auto_28384 ) ) ( not ( = ?auto_28381 ?auto_28380 ) ) ( CALIBRATION_TARGET ?auto_28383 ?auto_28384 ) ( NOT_CALIBRATED ?auto_28383 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28382 ?auto_28381 ?auto_28379 ?auto_28380 )
      ( GET-2IMAGE-VERIFY ?auto_28379 ?auto_28380 ?auto_28382 ?auto_28381 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28386 - DIRECTION
      ?auto_28387 - MODE
      ?auto_28389 - DIRECTION
      ?auto_28388 - MODE
    )
    :vars
    (
      ?auto_28390 - DIRECTION
      ?auto_28392 - INSTRUMENT
      ?auto_28394 - SATELLITE
      ?auto_28393 - DIRECTION
      ?auto_28391 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_28389 ?auto_28386 ) ) ( not ( = ?auto_28386 ?auto_28390 ) ) ( ON_BOARD ?auto_28392 ?auto_28394 ) ( SUPPORTS ?auto_28392 ?auto_28387 ) ( POWER_ON ?auto_28392 ) ( POINTING ?auto_28394 ?auto_28393 ) ( not ( = ?auto_28386 ?auto_28393 ) ) ( HAVE_IMAGE ?auto_28390 ?auto_28391 ) ( not ( = ?auto_28390 ?auto_28393 ) ) ( not ( = ?auto_28391 ?auto_28387 ) ) ( CALIBRATION_TARGET ?auto_28392 ?auto_28393 ) ( NOT_CALIBRATED ?auto_28392 ) ( HAVE_IMAGE ?auto_28389 ?auto_28388 ) ( not ( = ?auto_28387 ?auto_28388 ) ) ( not ( = ?auto_28389 ?auto_28390 ) ) ( not ( = ?auto_28389 ?auto_28393 ) ) ( not ( = ?auto_28388 ?auto_28391 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28390 ?auto_28391 ?auto_28386 ?auto_28387 )
      ( GET-2IMAGE-VERIFY ?auto_28386 ?auto_28387 ?auto_28389 ?auto_28388 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28413 - DIRECTION
      ?auto_28414 - MODE
      ?auto_28416 - DIRECTION
      ?auto_28415 - MODE
      ?auto_28418 - DIRECTION
      ?auto_28417 - MODE
    )
    :vars
    (
      ?auto_28419 - INSTRUMENT
      ?auto_28421 - SATELLITE
      ?auto_28420 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28416 ?auto_28413 ) ) ( not ( = ?auto_28418 ?auto_28413 ) ) ( not ( = ?auto_28418 ?auto_28416 ) ) ( ON_BOARD ?auto_28419 ?auto_28421 ) ( SUPPORTS ?auto_28419 ?auto_28417 ) ( POWER_ON ?auto_28419 ) ( POINTING ?auto_28421 ?auto_28420 ) ( not ( = ?auto_28418 ?auto_28420 ) ) ( HAVE_IMAGE ?auto_28413 ?auto_28414 ) ( not ( = ?auto_28413 ?auto_28420 ) ) ( not ( = ?auto_28414 ?auto_28417 ) ) ( CALIBRATION_TARGET ?auto_28419 ?auto_28420 ) ( NOT_CALIBRATED ?auto_28419 ) ( HAVE_IMAGE ?auto_28416 ?auto_28415 ) ( not ( = ?auto_28414 ?auto_28415 ) ) ( not ( = ?auto_28416 ?auto_28420 ) ) ( not ( = ?auto_28415 ?auto_28417 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28413 ?auto_28414 ?auto_28418 ?auto_28417 )
      ( GET-3IMAGE-VERIFY ?auto_28413 ?auto_28414 ?auto_28416 ?auto_28415 ?auto_28418 ?auto_28417 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28431 - DIRECTION
      ?auto_28432 - MODE
      ?auto_28434 - DIRECTION
      ?auto_28433 - MODE
      ?auto_28436 - DIRECTION
      ?auto_28435 - MODE
    )
    :vars
    (
      ?auto_28437 - INSTRUMENT
      ?auto_28439 - SATELLITE
      ?auto_28438 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28434 ?auto_28431 ) ) ( not ( = ?auto_28436 ?auto_28431 ) ) ( not ( = ?auto_28436 ?auto_28434 ) ) ( ON_BOARD ?auto_28437 ?auto_28439 ) ( SUPPORTS ?auto_28437 ?auto_28433 ) ( POWER_ON ?auto_28437 ) ( POINTING ?auto_28439 ?auto_28438 ) ( not ( = ?auto_28434 ?auto_28438 ) ) ( HAVE_IMAGE ?auto_28431 ?auto_28432 ) ( not ( = ?auto_28431 ?auto_28438 ) ) ( not ( = ?auto_28432 ?auto_28433 ) ) ( CALIBRATION_TARGET ?auto_28437 ?auto_28438 ) ( NOT_CALIBRATED ?auto_28437 ) ( HAVE_IMAGE ?auto_28436 ?auto_28435 ) ( not ( = ?auto_28432 ?auto_28435 ) ) ( not ( = ?auto_28433 ?auto_28435 ) ) ( not ( = ?auto_28436 ?auto_28438 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28431 ?auto_28432 ?auto_28434 ?auto_28433 )
      ( GET-3IMAGE-VERIFY ?auto_28431 ?auto_28432 ?auto_28434 ?auto_28433 ?auto_28436 ?auto_28435 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28449 - DIRECTION
      ?auto_28450 - MODE
      ?auto_28452 - DIRECTION
      ?auto_28451 - MODE
      ?auto_28454 - DIRECTION
      ?auto_28453 - MODE
    )
    :vars
    (
      ?auto_28455 - INSTRUMENT
      ?auto_28457 - SATELLITE
      ?auto_28456 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28452 ?auto_28449 ) ) ( not ( = ?auto_28454 ?auto_28449 ) ) ( not ( = ?auto_28454 ?auto_28452 ) ) ( ON_BOARD ?auto_28455 ?auto_28457 ) ( SUPPORTS ?auto_28455 ?auto_28453 ) ( POWER_ON ?auto_28455 ) ( POINTING ?auto_28457 ?auto_28456 ) ( not ( = ?auto_28454 ?auto_28456 ) ) ( HAVE_IMAGE ?auto_28452 ?auto_28451 ) ( not ( = ?auto_28452 ?auto_28456 ) ) ( not ( = ?auto_28451 ?auto_28453 ) ) ( CALIBRATION_TARGET ?auto_28455 ?auto_28456 ) ( NOT_CALIBRATED ?auto_28455 ) ( HAVE_IMAGE ?auto_28449 ?auto_28450 ) ( not ( = ?auto_28449 ?auto_28456 ) ) ( not ( = ?auto_28450 ?auto_28451 ) ) ( not ( = ?auto_28450 ?auto_28453 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28452 ?auto_28451 ?auto_28454 ?auto_28453 )
      ( GET-3IMAGE-VERIFY ?auto_28449 ?auto_28450 ?auto_28452 ?auto_28451 ?auto_28454 ?auto_28453 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28469 - DIRECTION
      ?auto_28470 - MODE
      ?auto_28472 - DIRECTION
      ?auto_28471 - MODE
      ?auto_28474 - DIRECTION
      ?auto_28473 - MODE
    )
    :vars
    (
      ?auto_28475 - INSTRUMENT
      ?auto_28477 - SATELLITE
      ?auto_28476 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28472 ?auto_28469 ) ) ( not ( = ?auto_28474 ?auto_28469 ) ) ( not ( = ?auto_28474 ?auto_28472 ) ) ( ON_BOARD ?auto_28475 ?auto_28477 ) ( SUPPORTS ?auto_28475 ?auto_28471 ) ( POWER_ON ?auto_28475 ) ( POINTING ?auto_28477 ?auto_28476 ) ( not ( = ?auto_28472 ?auto_28476 ) ) ( HAVE_IMAGE ?auto_28474 ?auto_28473 ) ( not ( = ?auto_28474 ?auto_28476 ) ) ( not ( = ?auto_28473 ?auto_28471 ) ) ( CALIBRATION_TARGET ?auto_28475 ?auto_28476 ) ( NOT_CALIBRATED ?auto_28475 ) ( HAVE_IMAGE ?auto_28469 ?auto_28470 ) ( not ( = ?auto_28469 ?auto_28476 ) ) ( not ( = ?auto_28470 ?auto_28471 ) ) ( not ( = ?auto_28470 ?auto_28473 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28474 ?auto_28473 ?auto_28472 ?auto_28471 )
      ( GET-3IMAGE-VERIFY ?auto_28469 ?auto_28470 ?auto_28472 ?auto_28471 ?auto_28474 ?auto_28473 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28509 - DIRECTION
      ?auto_28510 - MODE
      ?auto_28512 - DIRECTION
      ?auto_28511 - MODE
      ?auto_28514 - DIRECTION
      ?auto_28513 - MODE
    )
    :vars
    (
      ?auto_28515 - INSTRUMENT
      ?auto_28517 - SATELLITE
      ?auto_28516 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28512 ?auto_28509 ) ) ( not ( = ?auto_28514 ?auto_28509 ) ) ( not ( = ?auto_28514 ?auto_28512 ) ) ( ON_BOARD ?auto_28515 ?auto_28517 ) ( SUPPORTS ?auto_28515 ?auto_28510 ) ( POWER_ON ?auto_28515 ) ( POINTING ?auto_28517 ?auto_28516 ) ( not ( = ?auto_28509 ?auto_28516 ) ) ( HAVE_IMAGE ?auto_28512 ?auto_28511 ) ( not ( = ?auto_28512 ?auto_28516 ) ) ( not ( = ?auto_28511 ?auto_28510 ) ) ( CALIBRATION_TARGET ?auto_28515 ?auto_28516 ) ( NOT_CALIBRATED ?auto_28515 ) ( HAVE_IMAGE ?auto_28514 ?auto_28513 ) ( not ( = ?auto_28510 ?auto_28513 ) ) ( not ( = ?auto_28511 ?auto_28513 ) ) ( not ( = ?auto_28514 ?auto_28516 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28512 ?auto_28511 ?auto_28509 ?auto_28510 )
      ( GET-3IMAGE-VERIFY ?auto_28509 ?auto_28510 ?auto_28512 ?auto_28511 ?auto_28514 ?auto_28513 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28527 - DIRECTION
      ?auto_28528 - MODE
      ?auto_28530 - DIRECTION
      ?auto_28529 - MODE
      ?auto_28532 - DIRECTION
      ?auto_28531 - MODE
    )
    :vars
    (
      ?auto_28533 - INSTRUMENT
      ?auto_28535 - SATELLITE
      ?auto_28534 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28530 ?auto_28527 ) ) ( not ( = ?auto_28532 ?auto_28527 ) ) ( not ( = ?auto_28532 ?auto_28530 ) ) ( ON_BOARD ?auto_28533 ?auto_28535 ) ( SUPPORTS ?auto_28533 ?auto_28528 ) ( POWER_ON ?auto_28533 ) ( POINTING ?auto_28535 ?auto_28534 ) ( not ( = ?auto_28527 ?auto_28534 ) ) ( HAVE_IMAGE ?auto_28532 ?auto_28531 ) ( not ( = ?auto_28532 ?auto_28534 ) ) ( not ( = ?auto_28531 ?auto_28528 ) ) ( CALIBRATION_TARGET ?auto_28533 ?auto_28534 ) ( NOT_CALIBRATED ?auto_28533 ) ( HAVE_IMAGE ?auto_28530 ?auto_28529 ) ( not ( = ?auto_28528 ?auto_28529 ) ) ( not ( = ?auto_28530 ?auto_28534 ) ) ( not ( = ?auto_28529 ?auto_28531 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28532 ?auto_28531 ?auto_28527 ?auto_28528 )
      ( GET-3IMAGE-VERIFY ?auto_28527 ?auto_28528 ?auto_28530 ?auto_28529 ?auto_28532 ?auto_28531 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_28589 - DIRECTION
      ?auto_28590 - MODE
    )
    :vars
    (
      ?auto_28591 - DIRECTION
      ?auto_28593 - INSTRUMENT
      ?auto_28595 - SATELLITE
      ?auto_28594 - DIRECTION
      ?auto_28592 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_28589 ?auto_28591 ) ) ( ON_BOARD ?auto_28593 ?auto_28595 ) ( SUPPORTS ?auto_28593 ?auto_28590 ) ( POINTING ?auto_28595 ?auto_28594 ) ( not ( = ?auto_28589 ?auto_28594 ) ) ( HAVE_IMAGE ?auto_28591 ?auto_28592 ) ( not ( = ?auto_28591 ?auto_28594 ) ) ( not ( = ?auto_28592 ?auto_28590 ) ) ( CALIBRATION_TARGET ?auto_28593 ?auto_28594 ) ( POWER_AVAIL ?auto_28595 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_28593 ?auto_28595 )
      ( GET-2IMAGE ?auto_28591 ?auto_28592 ?auto_28589 ?auto_28590 )
      ( GET-1IMAGE-VERIFY ?auto_28589 ?auto_28590 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28596 - DIRECTION
      ?auto_28597 - MODE
      ?auto_28599 - DIRECTION
      ?auto_28598 - MODE
    )
    :vars
    (
      ?auto_28601 - INSTRUMENT
      ?auto_28600 - SATELLITE
      ?auto_28602 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28599 ?auto_28596 ) ) ( ON_BOARD ?auto_28601 ?auto_28600 ) ( SUPPORTS ?auto_28601 ?auto_28598 ) ( POINTING ?auto_28600 ?auto_28602 ) ( not ( = ?auto_28599 ?auto_28602 ) ) ( HAVE_IMAGE ?auto_28596 ?auto_28597 ) ( not ( = ?auto_28596 ?auto_28602 ) ) ( not ( = ?auto_28597 ?auto_28598 ) ) ( CALIBRATION_TARGET ?auto_28601 ?auto_28602 ) ( POWER_AVAIL ?auto_28600 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28599 ?auto_28598 )
      ( GET-2IMAGE-VERIFY ?auto_28596 ?auto_28597 ?auto_28599 ?auto_28598 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28603 - DIRECTION
      ?auto_28604 - MODE
      ?auto_28606 - DIRECTION
      ?auto_28605 - MODE
    )
    :vars
    (
      ?auto_28608 - DIRECTION
      ?auto_28609 - INSTRUMENT
      ?auto_28610 - SATELLITE
      ?auto_28611 - DIRECTION
      ?auto_28607 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_28606 ?auto_28603 ) ) ( not ( = ?auto_28606 ?auto_28608 ) ) ( ON_BOARD ?auto_28609 ?auto_28610 ) ( SUPPORTS ?auto_28609 ?auto_28605 ) ( POINTING ?auto_28610 ?auto_28611 ) ( not ( = ?auto_28606 ?auto_28611 ) ) ( HAVE_IMAGE ?auto_28608 ?auto_28607 ) ( not ( = ?auto_28608 ?auto_28611 ) ) ( not ( = ?auto_28607 ?auto_28605 ) ) ( CALIBRATION_TARGET ?auto_28609 ?auto_28611 ) ( POWER_AVAIL ?auto_28610 ) ( HAVE_IMAGE ?auto_28603 ?auto_28604 ) ( not ( = ?auto_28603 ?auto_28608 ) ) ( not ( = ?auto_28603 ?auto_28611 ) ) ( not ( = ?auto_28604 ?auto_28605 ) ) ( not ( = ?auto_28604 ?auto_28607 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28608 ?auto_28607 ?auto_28606 ?auto_28605 )
      ( GET-2IMAGE-VERIFY ?auto_28603 ?auto_28604 ?auto_28606 ?auto_28605 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28612 - DIRECTION
      ?auto_28613 - MODE
      ?auto_28615 - DIRECTION
      ?auto_28614 - MODE
    )
    :vars
    (
      ?auto_28616 - INSTRUMENT
      ?auto_28617 - SATELLITE
      ?auto_28618 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28615 ?auto_28612 ) ) ( ON_BOARD ?auto_28616 ?auto_28617 ) ( SUPPORTS ?auto_28616 ?auto_28613 ) ( POINTING ?auto_28617 ?auto_28618 ) ( not ( = ?auto_28612 ?auto_28618 ) ) ( HAVE_IMAGE ?auto_28615 ?auto_28614 ) ( not ( = ?auto_28615 ?auto_28618 ) ) ( not ( = ?auto_28614 ?auto_28613 ) ) ( CALIBRATION_TARGET ?auto_28616 ?auto_28618 ) ( POWER_AVAIL ?auto_28617 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28615 ?auto_28614 ?auto_28612 ?auto_28613 )
      ( GET-2IMAGE-VERIFY ?auto_28612 ?auto_28613 ?auto_28615 ?auto_28614 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28619 - DIRECTION
      ?auto_28620 - MODE
      ?auto_28622 - DIRECTION
      ?auto_28621 - MODE
    )
    :vars
    (
      ?auto_28624 - DIRECTION
      ?auto_28625 - INSTRUMENT
      ?auto_28626 - SATELLITE
      ?auto_28627 - DIRECTION
      ?auto_28623 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_28622 ?auto_28619 ) ) ( not ( = ?auto_28619 ?auto_28624 ) ) ( ON_BOARD ?auto_28625 ?auto_28626 ) ( SUPPORTS ?auto_28625 ?auto_28620 ) ( POINTING ?auto_28626 ?auto_28627 ) ( not ( = ?auto_28619 ?auto_28627 ) ) ( HAVE_IMAGE ?auto_28624 ?auto_28623 ) ( not ( = ?auto_28624 ?auto_28627 ) ) ( not ( = ?auto_28623 ?auto_28620 ) ) ( CALIBRATION_TARGET ?auto_28625 ?auto_28627 ) ( POWER_AVAIL ?auto_28626 ) ( HAVE_IMAGE ?auto_28622 ?auto_28621 ) ( not ( = ?auto_28620 ?auto_28621 ) ) ( not ( = ?auto_28622 ?auto_28624 ) ) ( not ( = ?auto_28622 ?auto_28627 ) ) ( not ( = ?auto_28621 ?auto_28623 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28624 ?auto_28623 ?auto_28619 ?auto_28620 )
      ( GET-2IMAGE-VERIFY ?auto_28619 ?auto_28620 ?auto_28622 ?auto_28621 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28646 - DIRECTION
      ?auto_28647 - MODE
      ?auto_28649 - DIRECTION
      ?auto_28648 - MODE
      ?auto_28651 - DIRECTION
      ?auto_28650 - MODE
    )
    :vars
    (
      ?auto_28652 - INSTRUMENT
      ?auto_28653 - SATELLITE
      ?auto_28654 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28649 ?auto_28646 ) ) ( not ( = ?auto_28651 ?auto_28646 ) ) ( not ( = ?auto_28651 ?auto_28649 ) ) ( ON_BOARD ?auto_28652 ?auto_28653 ) ( SUPPORTS ?auto_28652 ?auto_28650 ) ( POINTING ?auto_28653 ?auto_28654 ) ( not ( = ?auto_28651 ?auto_28654 ) ) ( HAVE_IMAGE ?auto_28646 ?auto_28647 ) ( not ( = ?auto_28646 ?auto_28654 ) ) ( not ( = ?auto_28647 ?auto_28650 ) ) ( CALIBRATION_TARGET ?auto_28652 ?auto_28654 ) ( POWER_AVAIL ?auto_28653 ) ( HAVE_IMAGE ?auto_28649 ?auto_28648 ) ( not ( = ?auto_28647 ?auto_28648 ) ) ( not ( = ?auto_28649 ?auto_28654 ) ) ( not ( = ?auto_28648 ?auto_28650 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28646 ?auto_28647 ?auto_28651 ?auto_28650 )
      ( GET-3IMAGE-VERIFY ?auto_28646 ?auto_28647 ?auto_28649 ?auto_28648 ?auto_28651 ?auto_28650 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28664 - DIRECTION
      ?auto_28665 - MODE
      ?auto_28667 - DIRECTION
      ?auto_28666 - MODE
      ?auto_28669 - DIRECTION
      ?auto_28668 - MODE
    )
    :vars
    (
      ?auto_28670 - INSTRUMENT
      ?auto_28671 - SATELLITE
      ?auto_28672 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28667 ?auto_28664 ) ) ( not ( = ?auto_28669 ?auto_28664 ) ) ( not ( = ?auto_28669 ?auto_28667 ) ) ( ON_BOARD ?auto_28670 ?auto_28671 ) ( SUPPORTS ?auto_28670 ?auto_28666 ) ( POINTING ?auto_28671 ?auto_28672 ) ( not ( = ?auto_28667 ?auto_28672 ) ) ( HAVE_IMAGE ?auto_28664 ?auto_28665 ) ( not ( = ?auto_28664 ?auto_28672 ) ) ( not ( = ?auto_28665 ?auto_28666 ) ) ( CALIBRATION_TARGET ?auto_28670 ?auto_28672 ) ( POWER_AVAIL ?auto_28671 ) ( HAVE_IMAGE ?auto_28669 ?auto_28668 ) ( not ( = ?auto_28665 ?auto_28668 ) ) ( not ( = ?auto_28666 ?auto_28668 ) ) ( not ( = ?auto_28669 ?auto_28672 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28664 ?auto_28665 ?auto_28667 ?auto_28666 )
      ( GET-3IMAGE-VERIFY ?auto_28664 ?auto_28665 ?auto_28667 ?auto_28666 ?auto_28669 ?auto_28668 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28682 - DIRECTION
      ?auto_28683 - MODE
      ?auto_28685 - DIRECTION
      ?auto_28684 - MODE
      ?auto_28687 - DIRECTION
      ?auto_28686 - MODE
    )
    :vars
    (
      ?auto_28688 - INSTRUMENT
      ?auto_28689 - SATELLITE
      ?auto_28690 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28685 ?auto_28682 ) ) ( not ( = ?auto_28687 ?auto_28682 ) ) ( not ( = ?auto_28687 ?auto_28685 ) ) ( ON_BOARD ?auto_28688 ?auto_28689 ) ( SUPPORTS ?auto_28688 ?auto_28686 ) ( POINTING ?auto_28689 ?auto_28690 ) ( not ( = ?auto_28687 ?auto_28690 ) ) ( HAVE_IMAGE ?auto_28685 ?auto_28684 ) ( not ( = ?auto_28685 ?auto_28690 ) ) ( not ( = ?auto_28684 ?auto_28686 ) ) ( CALIBRATION_TARGET ?auto_28688 ?auto_28690 ) ( POWER_AVAIL ?auto_28689 ) ( HAVE_IMAGE ?auto_28682 ?auto_28683 ) ( not ( = ?auto_28682 ?auto_28690 ) ) ( not ( = ?auto_28683 ?auto_28684 ) ) ( not ( = ?auto_28683 ?auto_28686 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28685 ?auto_28684 ?auto_28687 ?auto_28686 )
      ( GET-3IMAGE-VERIFY ?auto_28682 ?auto_28683 ?auto_28685 ?auto_28684 ?auto_28687 ?auto_28686 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28702 - DIRECTION
      ?auto_28703 - MODE
      ?auto_28705 - DIRECTION
      ?auto_28704 - MODE
      ?auto_28707 - DIRECTION
      ?auto_28706 - MODE
    )
    :vars
    (
      ?auto_28708 - INSTRUMENT
      ?auto_28709 - SATELLITE
      ?auto_28710 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28705 ?auto_28702 ) ) ( not ( = ?auto_28707 ?auto_28702 ) ) ( not ( = ?auto_28707 ?auto_28705 ) ) ( ON_BOARD ?auto_28708 ?auto_28709 ) ( SUPPORTS ?auto_28708 ?auto_28704 ) ( POINTING ?auto_28709 ?auto_28710 ) ( not ( = ?auto_28705 ?auto_28710 ) ) ( HAVE_IMAGE ?auto_28707 ?auto_28706 ) ( not ( = ?auto_28707 ?auto_28710 ) ) ( not ( = ?auto_28706 ?auto_28704 ) ) ( CALIBRATION_TARGET ?auto_28708 ?auto_28710 ) ( POWER_AVAIL ?auto_28709 ) ( HAVE_IMAGE ?auto_28702 ?auto_28703 ) ( not ( = ?auto_28702 ?auto_28710 ) ) ( not ( = ?auto_28703 ?auto_28704 ) ) ( not ( = ?auto_28703 ?auto_28706 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28707 ?auto_28706 ?auto_28705 ?auto_28704 )
      ( GET-3IMAGE-VERIFY ?auto_28702 ?auto_28703 ?auto_28705 ?auto_28704 ?auto_28707 ?auto_28706 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28742 - DIRECTION
      ?auto_28743 - MODE
      ?auto_28745 - DIRECTION
      ?auto_28744 - MODE
      ?auto_28747 - DIRECTION
      ?auto_28746 - MODE
    )
    :vars
    (
      ?auto_28748 - INSTRUMENT
      ?auto_28749 - SATELLITE
      ?auto_28750 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28745 ?auto_28742 ) ) ( not ( = ?auto_28747 ?auto_28742 ) ) ( not ( = ?auto_28747 ?auto_28745 ) ) ( ON_BOARD ?auto_28748 ?auto_28749 ) ( SUPPORTS ?auto_28748 ?auto_28743 ) ( POINTING ?auto_28749 ?auto_28750 ) ( not ( = ?auto_28742 ?auto_28750 ) ) ( HAVE_IMAGE ?auto_28745 ?auto_28744 ) ( not ( = ?auto_28745 ?auto_28750 ) ) ( not ( = ?auto_28744 ?auto_28743 ) ) ( CALIBRATION_TARGET ?auto_28748 ?auto_28750 ) ( POWER_AVAIL ?auto_28749 ) ( HAVE_IMAGE ?auto_28747 ?auto_28746 ) ( not ( = ?auto_28743 ?auto_28746 ) ) ( not ( = ?auto_28744 ?auto_28746 ) ) ( not ( = ?auto_28747 ?auto_28750 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28745 ?auto_28744 ?auto_28742 ?auto_28743 )
      ( GET-3IMAGE-VERIFY ?auto_28742 ?auto_28743 ?auto_28745 ?auto_28744 ?auto_28747 ?auto_28746 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28760 - DIRECTION
      ?auto_28761 - MODE
      ?auto_28763 - DIRECTION
      ?auto_28762 - MODE
      ?auto_28765 - DIRECTION
      ?auto_28764 - MODE
    )
    :vars
    (
      ?auto_28766 - INSTRUMENT
      ?auto_28767 - SATELLITE
      ?auto_28768 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28763 ?auto_28760 ) ) ( not ( = ?auto_28765 ?auto_28760 ) ) ( not ( = ?auto_28765 ?auto_28763 ) ) ( ON_BOARD ?auto_28766 ?auto_28767 ) ( SUPPORTS ?auto_28766 ?auto_28761 ) ( POINTING ?auto_28767 ?auto_28768 ) ( not ( = ?auto_28760 ?auto_28768 ) ) ( HAVE_IMAGE ?auto_28765 ?auto_28764 ) ( not ( = ?auto_28765 ?auto_28768 ) ) ( not ( = ?auto_28764 ?auto_28761 ) ) ( CALIBRATION_TARGET ?auto_28766 ?auto_28768 ) ( POWER_AVAIL ?auto_28767 ) ( HAVE_IMAGE ?auto_28763 ?auto_28762 ) ( not ( = ?auto_28761 ?auto_28762 ) ) ( not ( = ?auto_28763 ?auto_28768 ) ) ( not ( = ?auto_28762 ?auto_28764 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28765 ?auto_28764 ?auto_28760 ?auto_28761 )
      ( GET-3IMAGE-VERIFY ?auto_28760 ?auto_28761 ?auto_28763 ?auto_28762 ?auto_28765 ?auto_28764 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_28822 - DIRECTION
      ?auto_28823 - MODE
    )
    :vars
    (
      ?auto_28825 - DIRECTION
      ?auto_28826 - INSTRUMENT
      ?auto_28827 - SATELLITE
      ?auto_28828 - DIRECTION
      ?auto_28824 - MODE
      ?auto_28829 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28822 ?auto_28825 ) ) ( ON_BOARD ?auto_28826 ?auto_28827 ) ( SUPPORTS ?auto_28826 ?auto_28823 ) ( not ( = ?auto_28822 ?auto_28828 ) ) ( HAVE_IMAGE ?auto_28825 ?auto_28824 ) ( not ( = ?auto_28825 ?auto_28828 ) ) ( not ( = ?auto_28824 ?auto_28823 ) ) ( CALIBRATION_TARGET ?auto_28826 ?auto_28828 ) ( POWER_AVAIL ?auto_28827 ) ( POINTING ?auto_28827 ?auto_28829 ) ( not ( = ?auto_28828 ?auto_28829 ) ) ( not ( = ?auto_28822 ?auto_28829 ) ) ( not ( = ?auto_28825 ?auto_28829 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_28827 ?auto_28828 ?auto_28829 )
      ( GET-2IMAGE ?auto_28825 ?auto_28824 ?auto_28822 ?auto_28823 )
      ( GET-1IMAGE-VERIFY ?auto_28822 ?auto_28823 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28830 - DIRECTION
      ?auto_28831 - MODE
      ?auto_28833 - DIRECTION
      ?auto_28832 - MODE
    )
    :vars
    (
      ?auto_28835 - INSTRUMENT
      ?auto_28836 - SATELLITE
      ?auto_28837 - DIRECTION
      ?auto_28834 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28833 ?auto_28830 ) ) ( ON_BOARD ?auto_28835 ?auto_28836 ) ( SUPPORTS ?auto_28835 ?auto_28832 ) ( not ( = ?auto_28833 ?auto_28837 ) ) ( HAVE_IMAGE ?auto_28830 ?auto_28831 ) ( not ( = ?auto_28830 ?auto_28837 ) ) ( not ( = ?auto_28831 ?auto_28832 ) ) ( CALIBRATION_TARGET ?auto_28835 ?auto_28837 ) ( POWER_AVAIL ?auto_28836 ) ( POINTING ?auto_28836 ?auto_28834 ) ( not ( = ?auto_28837 ?auto_28834 ) ) ( not ( = ?auto_28833 ?auto_28834 ) ) ( not ( = ?auto_28830 ?auto_28834 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28833 ?auto_28832 )
      ( GET-2IMAGE-VERIFY ?auto_28830 ?auto_28831 ?auto_28833 ?auto_28832 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28838 - DIRECTION
      ?auto_28839 - MODE
      ?auto_28841 - DIRECTION
      ?auto_28840 - MODE
    )
    :vars
    (
      ?auto_28846 - DIRECTION
      ?auto_28842 - INSTRUMENT
      ?auto_28843 - SATELLITE
      ?auto_28844 - DIRECTION
      ?auto_28845 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_28841 ?auto_28838 ) ) ( not ( = ?auto_28841 ?auto_28846 ) ) ( ON_BOARD ?auto_28842 ?auto_28843 ) ( SUPPORTS ?auto_28842 ?auto_28840 ) ( not ( = ?auto_28841 ?auto_28844 ) ) ( HAVE_IMAGE ?auto_28846 ?auto_28845 ) ( not ( = ?auto_28846 ?auto_28844 ) ) ( not ( = ?auto_28845 ?auto_28840 ) ) ( CALIBRATION_TARGET ?auto_28842 ?auto_28844 ) ( POWER_AVAIL ?auto_28843 ) ( POINTING ?auto_28843 ?auto_28838 ) ( not ( = ?auto_28844 ?auto_28838 ) ) ( not ( = ?auto_28846 ?auto_28838 ) ) ( HAVE_IMAGE ?auto_28838 ?auto_28839 ) ( not ( = ?auto_28839 ?auto_28840 ) ) ( not ( = ?auto_28839 ?auto_28845 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28846 ?auto_28845 ?auto_28841 ?auto_28840 )
      ( GET-2IMAGE-VERIFY ?auto_28838 ?auto_28839 ?auto_28841 ?auto_28840 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28847 - DIRECTION
      ?auto_28848 - MODE
      ?auto_28850 - DIRECTION
      ?auto_28849 - MODE
    )
    :vars
    (
      ?auto_28851 - INSTRUMENT
      ?auto_28852 - SATELLITE
      ?auto_28853 - DIRECTION
      ?auto_28854 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28850 ?auto_28847 ) ) ( ON_BOARD ?auto_28851 ?auto_28852 ) ( SUPPORTS ?auto_28851 ?auto_28848 ) ( not ( = ?auto_28847 ?auto_28853 ) ) ( HAVE_IMAGE ?auto_28850 ?auto_28849 ) ( not ( = ?auto_28850 ?auto_28853 ) ) ( not ( = ?auto_28849 ?auto_28848 ) ) ( CALIBRATION_TARGET ?auto_28851 ?auto_28853 ) ( POWER_AVAIL ?auto_28852 ) ( POINTING ?auto_28852 ?auto_28854 ) ( not ( = ?auto_28853 ?auto_28854 ) ) ( not ( = ?auto_28847 ?auto_28854 ) ) ( not ( = ?auto_28850 ?auto_28854 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28850 ?auto_28849 ?auto_28847 ?auto_28848 )
      ( GET-2IMAGE-VERIFY ?auto_28847 ?auto_28848 ?auto_28850 ?auto_28849 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_28855 - DIRECTION
      ?auto_28856 - MODE
      ?auto_28858 - DIRECTION
      ?auto_28857 - MODE
    )
    :vars
    (
      ?auto_28863 - DIRECTION
      ?auto_28859 - INSTRUMENT
      ?auto_28860 - SATELLITE
      ?auto_28861 - DIRECTION
      ?auto_28862 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_28858 ?auto_28855 ) ) ( not ( = ?auto_28855 ?auto_28863 ) ) ( ON_BOARD ?auto_28859 ?auto_28860 ) ( SUPPORTS ?auto_28859 ?auto_28856 ) ( not ( = ?auto_28855 ?auto_28861 ) ) ( HAVE_IMAGE ?auto_28863 ?auto_28862 ) ( not ( = ?auto_28863 ?auto_28861 ) ) ( not ( = ?auto_28862 ?auto_28856 ) ) ( CALIBRATION_TARGET ?auto_28859 ?auto_28861 ) ( POWER_AVAIL ?auto_28860 ) ( POINTING ?auto_28860 ?auto_28858 ) ( not ( = ?auto_28861 ?auto_28858 ) ) ( not ( = ?auto_28863 ?auto_28858 ) ) ( HAVE_IMAGE ?auto_28858 ?auto_28857 ) ( not ( = ?auto_28856 ?auto_28857 ) ) ( not ( = ?auto_28857 ?auto_28862 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28863 ?auto_28862 ?auto_28855 ?auto_28856 )
      ( GET-2IMAGE-VERIFY ?auto_28855 ?auto_28856 ?auto_28858 ?auto_28857 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28884 - DIRECTION
      ?auto_28885 - MODE
      ?auto_28887 - DIRECTION
      ?auto_28886 - MODE
      ?auto_28889 - DIRECTION
      ?auto_28888 - MODE
    )
    :vars
    (
      ?auto_28890 - INSTRUMENT
      ?auto_28891 - SATELLITE
      ?auto_28892 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28887 ?auto_28884 ) ) ( not ( = ?auto_28889 ?auto_28884 ) ) ( not ( = ?auto_28889 ?auto_28887 ) ) ( ON_BOARD ?auto_28890 ?auto_28891 ) ( SUPPORTS ?auto_28890 ?auto_28888 ) ( not ( = ?auto_28889 ?auto_28892 ) ) ( HAVE_IMAGE ?auto_28884 ?auto_28885 ) ( not ( = ?auto_28884 ?auto_28892 ) ) ( not ( = ?auto_28885 ?auto_28888 ) ) ( CALIBRATION_TARGET ?auto_28890 ?auto_28892 ) ( POWER_AVAIL ?auto_28891 ) ( POINTING ?auto_28891 ?auto_28887 ) ( not ( = ?auto_28892 ?auto_28887 ) ) ( HAVE_IMAGE ?auto_28887 ?auto_28886 ) ( not ( = ?auto_28885 ?auto_28886 ) ) ( not ( = ?auto_28886 ?auto_28888 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28884 ?auto_28885 ?auto_28889 ?auto_28888 )
      ( GET-3IMAGE-VERIFY ?auto_28884 ?auto_28885 ?auto_28887 ?auto_28886 ?auto_28889 ?auto_28888 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28903 - DIRECTION
      ?auto_28904 - MODE
      ?auto_28906 - DIRECTION
      ?auto_28905 - MODE
      ?auto_28908 - DIRECTION
      ?auto_28907 - MODE
    )
    :vars
    (
      ?auto_28909 - INSTRUMENT
      ?auto_28910 - SATELLITE
      ?auto_28911 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28906 ?auto_28903 ) ) ( not ( = ?auto_28908 ?auto_28903 ) ) ( not ( = ?auto_28908 ?auto_28906 ) ) ( ON_BOARD ?auto_28909 ?auto_28910 ) ( SUPPORTS ?auto_28909 ?auto_28905 ) ( not ( = ?auto_28906 ?auto_28911 ) ) ( HAVE_IMAGE ?auto_28903 ?auto_28904 ) ( not ( = ?auto_28903 ?auto_28911 ) ) ( not ( = ?auto_28904 ?auto_28905 ) ) ( CALIBRATION_TARGET ?auto_28909 ?auto_28911 ) ( POWER_AVAIL ?auto_28910 ) ( POINTING ?auto_28910 ?auto_28908 ) ( not ( = ?auto_28911 ?auto_28908 ) ) ( HAVE_IMAGE ?auto_28908 ?auto_28907 ) ( not ( = ?auto_28904 ?auto_28907 ) ) ( not ( = ?auto_28905 ?auto_28907 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28903 ?auto_28904 ?auto_28906 ?auto_28905 )
      ( GET-3IMAGE-VERIFY ?auto_28903 ?auto_28904 ?auto_28906 ?auto_28905 ?auto_28908 ?auto_28907 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28922 - DIRECTION
      ?auto_28923 - MODE
      ?auto_28925 - DIRECTION
      ?auto_28924 - MODE
      ?auto_28927 - DIRECTION
      ?auto_28926 - MODE
    )
    :vars
    (
      ?auto_28928 - INSTRUMENT
      ?auto_28929 - SATELLITE
      ?auto_28930 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28925 ?auto_28922 ) ) ( not ( = ?auto_28927 ?auto_28922 ) ) ( not ( = ?auto_28927 ?auto_28925 ) ) ( ON_BOARD ?auto_28928 ?auto_28929 ) ( SUPPORTS ?auto_28928 ?auto_28926 ) ( not ( = ?auto_28927 ?auto_28930 ) ) ( HAVE_IMAGE ?auto_28925 ?auto_28924 ) ( not ( = ?auto_28925 ?auto_28930 ) ) ( not ( = ?auto_28924 ?auto_28926 ) ) ( CALIBRATION_TARGET ?auto_28928 ?auto_28930 ) ( POWER_AVAIL ?auto_28929 ) ( POINTING ?auto_28929 ?auto_28922 ) ( not ( = ?auto_28930 ?auto_28922 ) ) ( HAVE_IMAGE ?auto_28922 ?auto_28923 ) ( not ( = ?auto_28923 ?auto_28924 ) ) ( not ( = ?auto_28923 ?auto_28926 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28925 ?auto_28924 ?auto_28927 ?auto_28926 )
      ( GET-3IMAGE-VERIFY ?auto_28922 ?auto_28923 ?auto_28925 ?auto_28924 ?auto_28927 ?auto_28926 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28942 - DIRECTION
      ?auto_28943 - MODE
      ?auto_28945 - DIRECTION
      ?auto_28944 - MODE
      ?auto_28947 - DIRECTION
      ?auto_28946 - MODE
    )
    :vars
    (
      ?auto_28948 - INSTRUMENT
      ?auto_28949 - SATELLITE
      ?auto_28950 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28945 ?auto_28942 ) ) ( not ( = ?auto_28947 ?auto_28942 ) ) ( not ( = ?auto_28947 ?auto_28945 ) ) ( ON_BOARD ?auto_28948 ?auto_28949 ) ( SUPPORTS ?auto_28948 ?auto_28944 ) ( not ( = ?auto_28945 ?auto_28950 ) ) ( HAVE_IMAGE ?auto_28947 ?auto_28946 ) ( not ( = ?auto_28947 ?auto_28950 ) ) ( not ( = ?auto_28946 ?auto_28944 ) ) ( CALIBRATION_TARGET ?auto_28948 ?auto_28950 ) ( POWER_AVAIL ?auto_28949 ) ( POINTING ?auto_28949 ?auto_28942 ) ( not ( = ?auto_28950 ?auto_28942 ) ) ( HAVE_IMAGE ?auto_28942 ?auto_28943 ) ( not ( = ?auto_28943 ?auto_28944 ) ) ( not ( = ?auto_28943 ?auto_28946 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28947 ?auto_28946 ?auto_28945 ?auto_28944 )
      ( GET-3IMAGE-VERIFY ?auto_28942 ?auto_28943 ?auto_28945 ?auto_28944 ?auto_28947 ?auto_28946 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28983 - DIRECTION
      ?auto_28984 - MODE
      ?auto_28986 - DIRECTION
      ?auto_28985 - MODE
      ?auto_28988 - DIRECTION
      ?auto_28987 - MODE
    )
    :vars
    (
      ?auto_28989 - INSTRUMENT
      ?auto_28990 - SATELLITE
      ?auto_28991 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28986 ?auto_28983 ) ) ( not ( = ?auto_28988 ?auto_28983 ) ) ( not ( = ?auto_28988 ?auto_28986 ) ) ( ON_BOARD ?auto_28989 ?auto_28990 ) ( SUPPORTS ?auto_28989 ?auto_28984 ) ( not ( = ?auto_28983 ?auto_28991 ) ) ( HAVE_IMAGE ?auto_28986 ?auto_28985 ) ( not ( = ?auto_28986 ?auto_28991 ) ) ( not ( = ?auto_28985 ?auto_28984 ) ) ( CALIBRATION_TARGET ?auto_28989 ?auto_28991 ) ( POWER_AVAIL ?auto_28990 ) ( POINTING ?auto_28990 ?auto_28988 ) ( not ( = ?auto_28991 ?auto_28988 ) ) ( HAVE_IMAGE ?auto_28988 ?auto_28987 ) ( not ( = ?auto_28984 ?auto_28987 ) ) ( not ( = ?auto_28985 ?auto_28987 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28986 ?auto_28985 ?auto_28983 ?auto_28984 )
      ( GET-3IMAGE-VERIFY ?auto_28983 ?auto_28984 ?auto_28986 ?auto_28985 ?auto_28988 ?auto_28987 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29002 - DIRECTION
      ?auto_29003 - MODE
      ?auto_29005 - DIRECTION
      ?auto_29004 - MODE
      ?auto_29007 - DIRECTION
      ?auto_29006 - MODE
    )
    :vars
    (
      ?auto_29008 - INSTRUMENT
      ?auto_29009 - SATELLITE
      ?auto_29010 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_29005 ?auto_29002 ) ) ( not ( = ?auto_29007 ?auto_29002 ) ) ( not ( = ?auto_29007 ?auto_29005 ) ) ( ON_BOARD ?auto_29008 ?auto_29009 ) ( SUPPORTS ?auto_29008 ?auto_29003 ) ( not ( = ?auto_29002 ?auto_29010 ) ) ( HAVE_IMAGE ?auto_29007 ?auto_29006 ) ( not ( = ?auto_29007 ?auto_29010 ) ) ( not ( = ?auto_29006 ?auto_29003 ) ) ( CALIBRATION_TARGET ?auto_29008 ?auto_29010 ) ( POWER_AVAIL ?auto_29009 ) ( POINTING ?auto_29009 ?auto_29005 ) ( not ( = ?auto_29010 ?auto_29005 ) ) ( HAVE_IMAGE ?auto_29005 ?auto_29004 ) ( not ( = ?auto_29003 ?auto_29004 ) ) ( not ( = ?auto_29004 ?auto_29006 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29007 ?auto_29006 ?auto_29002 ?auto_29003 )
      ( GET-3IMAGE-VERIFY ?auto_29002 ?auto_29003 ?auto_29005 ?auto_29004 ?auto_29007 ?auto_29006 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_29066 - DIRECTION
      ?auto_29067 - MODE
    )
    :vars
    (
      ?auto_29073 - DIRECTION
      ?auto_29068 - INSTRUMENT
      ?auto_29069 - SATELLITE
      ?auto_29070 - DIRECTION
      ?auto_29072 - MODE
      ?auto_29071 - DIRECTION
      ?auto_29074 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29066 ?auto_29073 ) ) ( ON_BOARD ?auto_29068 ?auto_29069 ) ( SUPPORTS ?auto_29068 ?auto_29067 ) ( not ( = ?auto_29066 ?auto_29070 ) ) ( HAVE_IMAGE ?auto_29073 ?auto_29072 ) ( not ( = ?auto_29073 ?auto_29070 ) ) ( not ( = ?auto_29072 ?auto_29067 ) ) ( CALIBRATION_TARGET ?auto_29068 ?auto_29070 ) ( POINTING ?auto_29069 ?auto_29071 ) ( not ( = ?auto_29070 ?auto_29071 ) ) ( not ( = ?auto_29066 ?auto_29071 ) ) ( not ( = ?auto_29073 ?auto_29071 ) ) ( ON_BOARD ?auto_29074 ?auto_29069 ) ( POWER_ON ?auto_29074 ) ( not ( = ?auto_29068 ?auto_29074 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_29074 ?auto_29069 )
      ( GET-2IMAGE ?auto_29073 ?auto_29072 ?auto_29066 ?auto_29067 )
      ( GET-1IMAGE-VERIFY ?auto_29066 ?auto_29067 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29075 - DIRECTION
      ?auto_29076 - MODE
      ?auto_29078 - DIRECTION
      ?auto_29077 - MODE
    )
    :vars
    (
      ?auto_29083 - INSTRUMENT
      ?auto_29081 - SATELLITE
      ?auto_29079 - DIRECTION
      ?auto_29080 - DIRECTION
      ?auto_29082 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29078 ?auto_29075 ) ) ( ON_BOARD ?auto_29083 ?auto_29081 ) ( SUPPORTS ?auto_29083 ?auto_29077 ) ( not ( = ?auto_29078 ?auto_29079 ) ) ( HAVE_IMAGE ?auto_29075 ?auto_29076 ) ( not ( = ?auto_29075 ?auto_29079 ) ) ( not ( = ?auto_29076 ?auto_29077 ) ) ( CALIBRATION_TARGET ?auto_29083 ?auto_29079 ) ( POINTING ?auto_29081 ?auto_29080 ) ( not ( = ?auto_29079 ?auto_29080 ) ) ( not ( = ?auto_29078 ?auto_29080 ) ) ( not ( = ?auto_29075 ?auto_29080 ) ) ( ON_BOARD ?auto_29082 ?auto_29081 ) ( POWER_ON ?auto_29082 ) ( not ( = ?auto_29083 ?auto_29082 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29078 ?auto_29077 )
      ( GET-2IMAGE-VERIFY ?auto_29075 ?auto_29076 ?auto_29078 ?auto_29077 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29084 - DIRECTION
      ?auto_29085 - MODE
      ?auto_29087 - DIRECTION
      ?auto_29086 - MODE
    )
    :vars
    (
      ?auto_29089 - DIRECTION
      ?auto_29090 - INSTRUMENT
      ?auto_29093 - SATELLITE
      ?auto_29092 - DIRECTION
      ?auto_29088 - MODE
      ?auto_29091 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29087 ?auto_29084 ) ) ( not ( = ?auto_29087 ?auto_29089 ) ) ( ON_BOARD ?auto_29090 ?auto_29093 ) ( SUPPORTS ?auto_29090 ?auto_29086 ) ( not ( = ?auto_29087 ?auto_29092 ) ) ( HAVE_IMAGE ?auto_29089 ?auto_29088 ) ( not ( = ?auto_29089 ?auto_29092 ) ) ( not ( = ?auto_29088 ?auto_29086 ) ) ( CALIBRATION_TARGET ?auto_29090 ?auto_29092 ) ( POINTING ?auto_29093 ?auto_29084 ) ( not ( = ?auto_29092 ?auto_29084 ) ) ( not ( = ?auto_29089 ?auto_29084 ) ) ( ON_BOARD ?auto_29091 ?auto_29093 ) ( POWER_ON ?auto_29091 ) ( not ( = ?auto_29090 ?auto_29091 ) ) ( HAVE_IMAGE ?auto_29084 ?auto_29085 ) ( not ( = ?auto_29085 ?auto_29086 ) ) ( not ( = ?auto_29085 ?auto_29088 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29089 ?auto_29088 ?auto_29087 ?auto_29086 )
      ( GET-2IMAGE-VERIFY ?auto_29084 ?auto_29085 ?auto_29087 ?auto_29086 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29094 - DIRECTION
      ?auto_29095 - MODE
      ?auto_29097 - DIRECTION
      ?auto_29096 - MODE
    )
    :vars
    (
      ?auto_29099 - INSTRUMENT
      ?auto_29102 - SATELLITE
      ?auto_29101 - DIRECTION
      ?auto_29098 - DIRECTION
      ?auto_29100 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29097 ?auto_29094 ) ) ( ON_BOARD ?auto_29099 ?auto_29102 ) ( SUPPORTS ?auto_29099 ?auto_29095 ) ( not ( = ?auto_29094 ?auto_29101 ) ) ( HAVE_IMAGE ?auto_29097 ?auto_29096 ) ( not ( = ?auto_29097 ?auto_29101 ) ) ( not ( = ?auto_29096 ?auto_29095 ) ) ( CALIBRATION_TARGET ?auto_29099 ?auto_29101 ) ( POINTING ?auto_29102 ?auto_29098 ) ( not ( = ?auto_29101 ?auto_29098 ) ) ( not ( = ?auto_29094 ?auto_29098 ) ) ( not ( = ?auto_29097 ?auto_29098 ) ) ( ON_BOARD ?auto_29100 ?auto_29102 ) ( POWER_ON ?auto_29100 ) ( not ( = ?auto_29099 ?auto_29100 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29097 ?auto_29096 ?auto_29094 ?auto_29095 )
      ( GET-2IMAGE-VERIFY ?auto_29094 ?auto_29095 ?auto_29097 ?auto_29096 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29103 - DIRECTION
      ?auto_29104 - MODE
      ?auto_29106 - DIRECTION
      ?auto_29105 - MODE
    )
    :vars
    (
      ?auto_29108 - DIRECTION
      ?auto_29109 - INSTRUMENT
      ?auto_29112 - SATELLITE
      ?auto_29111 - DIRECTION
      ?auto_29107 - MODE
      ?auto_29110 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29106 ?auto_29103 ) ) ( not ( = ?auto_29103 ?auto_29108 ) ) ( ON_BOARD ?auto_29109 ?auto_29112 ) ( SUPPORTS ?auto_29109 ?auto_29104 ) ( not ( = ?auto_29103 ?auto_29111 ) ) ( HAVE_IMAGE ?auto_29108 ?auto_29107 ) ( not ( = ?auto_29108 ?auto_29111 ) ) ( not ( = ?auto_29107 ?auto_29104 ) ) ( CALIBRATION_TARGET ?auto_29109 ?auto_29111 ) ( POINTING ?auto_29112 ?auto_29106 ) ( not ( = ?auto_29111 ?auto_29106 ) ) ( not ( = ?auto_29108 ?auto_29106 ) ) ( ON_BOARD ?auto_29110 ?auto_29112 ) ( POWER_ON ?auto_29110 ) ( not ( = ?auto_29109 ?auto_29110 ) ) ( HAVE_IMAGE ?auto_29106 ?auto_29105 ) ( not ( = ?auto_29104 ?auto_29105 ) ) ( not ( = ?auto_29105 ?auto_29107 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29108 ?auto_29107 ?auto_29103 ?auto_29104 )
      ( GET-2IMAGE-VERIFY ?auto_29103 ?auto_29104 ?auto_29106 ?auto_29105 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29135 - DIRECTION
      ?auto_29136 - MODE
      ?auto_29138 - DIRECTION
      ?auto_29137 - MODE
      ?auto_29140 - DIRECTION
      ?auto_29139 - MODE
    )
    :vars
    (
      ?auto_29141 - INSTRUMENT
      ?auto_29144 - SATELLITE
      ?auto_29143 - DIRECTION
      ?auto_29142 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29138 ?auto_29135 ) ) ( not ( = ?auto_29140 ?auto_29135 ) ) ( not ( = ?auto_29140 ?auto_29138 ) ) ( ON_BOARD ?auto_29141 ?auto_29144 ) ( SUPPORTS ?auto_29141 ?auto_29139 ) ( not ( = ?auto_29140 ?auto_29143 ) ) ( HAVE_IMAGE ?auto_29135 ?auto_29136 ) ( not ( = ?auto_29135 ?auto_29143 ) ) ( not ( = ?auto_29136 ?auto_29139 ) ) ( CALIBRATION_TARGET ?auto_29141 ?auto_29143 ) ( POINTING ?auto_29144 ?auto_29138 ) ( not ( = ?auto_29143 ?auto_29138 ) ) ( ON_BOARD ?auto_29142 ?auto_29144 ) ( POWER_ON ?auto_29142 ) ( not ( = ?auto_29141 ?auto_29142 ) ) ( HAVE_IMAGE ?auto_29138 ?auto_29137 ) ( not ( = ?auto_29136 ?auto_29137 ) ) ( not ( = ?auto_29137 ?auto_29139 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29135 ?auto_29136 ?auto_29140 ?auto_29139 )
      ( GET-3IMAGE-VERIFY ?auto_29135 ?auto_29136 ?auto_29138 ?auto_29137 ?auto_29140 ?auto_29139 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29156 - DIRECTION
      ?auto_29157 - MODE
      ?auto_29159 - DIRECTION
      ?auto_29158 - MODE
      ?auto_29161 - DIRECTION
      ?auto_29160 - MODE
    )
    :vars
    (
      ?auto_29162 - INSTRUMENT
      ?auto_29165 - SATELLITE
      ?auto_29164 - DIRECTION
      ?auto_29163 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29159 ?auto_29156 ) ) ( not ( = ?auto_29161 ?auto_29156 ) ) ( not ( = ?auto_29161 ?auto_29159 ) ) ( ON_BOARD ?auto_29162 ?auto_29165 ) ( SUPPORTS ?auto_29162 ?auto_29158 ) ( not ( = ?auto_29159 ?auto_29164 ) ) ( HAVE_IMAGE ?auto_29156 ?auto_29157 ) ( not ( = ?auto_29156 ?auto_29164 ) ) ( not ( = ?auto_29157 ?auto_29158 ) ) ( CALIBRATION_TARGET ?auto_29162 ?auto_29164 ) ( POINTING ?auto_29165 ?auto_29161 ) ( not ( = ?auto_29164 ?auto_29161 ) ) ( ON_BOARD ?auto_29163 ?auto_29165 ) ( POWER_ON ?auto_29163 ) ( not ( = ?auto_29162 ?auto_29163 ) ) ( HAVE_IMAGE ?auto_29161 ?auto_29160 ) ( not ( = ?auto_29157 ?auto_29160 ) ) ( not ( = ?auto_29158 ?auto_29160 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29156 ?auto_29157 ?auto_29159 ?auto_29158 )
      ( GET-3IMAGE-VERIFY ?auto_29156 ?auto_29157 ?auto_29159 ?auto_29158 ?auto_29161 ?auto_29160 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29177 - DIRECTION
      ?auto_29178 - MODE
      ?auto_29180 - DIRECTION
      ?auto_29179 - MODE
      ?auto_29182 - DIRECTION
      ?auto_29181 - MODE
    )
    :vars
    (
      ?auto_29183 - INSTRUMENT
      ?auto_29186 - SATELLITE
      ?auto_29185 - DIRECTION
      ?auto_29184 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29180 ?auto_29177 ) ) ( not ( = ?auto_29182 ?auto_29177 ) ) ( not ( = ?auto_29182 ?auto_29180 ) ) ( ON_BOARD ?auto_29183 ?auto_29186 ) ( SUPPORTS ?auto_29183 ?auto_29181 ) ( not ( = ?auto_29182 ?auto_29185 ) ) ( HAVE_IMAGE ?auto_29180 ?auto_29179 ) ( not ( = ?auto_29180 ?auto_29185 ) ) ( not ( = ?auto_29179 ?auto_29181 ) ) ( CALIBRATION_TARGET ?auto_29183 ?auto_29185 ) ( POINTING ?auto_29186 ?auto_29177 ) ( not ( = ?auto_29185 ?auto_29177 ) ) ( ON_BOARD ?auto_29184 ?auto_29186 ) ( POWER_ON ?auto_29184 ) ( not ( = ?auto_29183 ?auto_29184 ) ) ( HAVE_IMAGE ?auto_29177 ?auto_29178 ) ( not ( = ?auto_29178 ?auto_29179 ) ) ( not ( = ?auto_29178 ?auto_29181 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29180 ?auto_29179 ?auto_29182 ?auto_29181 )
      ( GET-3IMAGE-VERIFY ?auto_29177 ?auto_29178 ?auto_29180 ?auto_29179 ?auto_29182 ?auto_29181 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29199 - DIRECTION
      ?auto_29200 - MODE
      ?auto_29202 - DIRECTION
      ?auto_29201 - MODE
      ?auto_29204 - DIRECTION
      ?auto_29203 - MODE
    )
    :vars
    (
      ?auto_29205 - INSTRUMENT
      ?auto_29208 - SATELLITE
      ?auto_29207 - DIRECTION
      ?auto_29206 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29202 ?auto_29199 ) ) ( not ( = ?auto_29204 ?auto_29199 ) ) ( not ( = ?auto_29204 ?auto_29202 ) ) ( ON_BOARD ?auto_29205 ?auto_29208 ) ( SUPPORTS ?auto_29205 ?auto_29201 ) ( not ( = ?auto_29202 ?auto_29207 ) ) ( HAVE_IMAGE ?auto_29204 ?auto_29203 ) ( not ( = ?auto_29204 ?auto_29207 ) ) ( not ( = ?auto_29203 ?auto_29201 ) ) ( CALIBRATION_TARGET ?auto_29205 ?auto_29207 ) ( POINTING ?auto_29208 ?auto_29199 ) ( not ( = ?auto_29207 ?auto_29199 ) ) ( ON_BOARD ?auto_29206 ?auto_29208 ) ( POWER_ON ?auto_29206 ) ( not ( = ?auto_29205 ?auto_29206 ) ) ( HAVE_IMAGE ?auto_29199 ?auto_29200 ) ( not ( = ?auto_29200 ?auto_29201 ) ) ( not ( = ?auto_29200 ?auto_29203 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29204 ?auto_29203 ?auto_29202 ?auto_29201 )
      ( GET-3IMAGE-VERIFY ?auto_29199 ?auto_29200 ?auto_29202 ?auto_29201 ?auto_29204 ?auto_29203 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29244 - DIRECTION
      ?auto_29245 - MODE
      ?auto_29247 - DIRECTION
      ?auto_29246 - MODE
      ?auto_29249 - DIRECTION
      ?auto_29248 - MODE
    )
    :vars
    (
      ?auto_29250 - INSTRUMENT
      ?auto_29253 - SATELLITE
      ?auto_29252 - DIRECTION
      ?auto_29251 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29247 ?auto_29244 ) ) ( not ( = ?auto_29249 ?auto_29244 ) ) ( not ( = ?auto_29249 ?auto_29247 ) ) ( ON_BOARD ?auto_29250 ?auto_29253 ) ( SUPPORTS ?auto_29250 ?auto_29245 ) ( not ( = ?auto_29244 ?auto_29252 ) ) ( HAVE_IMAGE ?auto_29247 ?auto_29246 ) ( not ( = ?auto_29247 ?auto_29252 ) ) ( not ( = ?auto_29246 ?auto_29245 ) ) ( CALIBRATION_TARGET ?auto_29250 ?auto_29252 ) ( POINTING ?auto_29253 ?auto_29249 ) ( not ( = ?auto_29252 ?auto_29249 ) ) ( ON_BOARD ?auto_29251 ?auto_29253 ) ( POWER_ON ?auto_29251 ) ( not ( = ?auto_29250 ?auto_29251 ) ) ( HAVE_IMAGE ?auto_29249 ?auto_29248 ) ( not ( = ?auto_29245 ?auto_29248 ) ) ( not ( = ?auto_29246 ?auto_29248 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29247 ?auto_29246 ?auto_29244 ?auto_29245 )
      ( GET-3IMAGE-VERIFY ?auto_29244 ?auto_29245 ?auto_29247 ?auto_29246 ?auto_29249 ?auto_29248 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29265 - DIRECTION
      ?auto_29266 - MODE
      ?auto_29268 - DIRECTION
      ?auto_29267 - MODE
      ?auto_29270 - DIRECTION
      ?auto_29269 - MODE
    )
    :vars
    (
      ?auto_29271 - INSTRUMENT
      ?auto_29274 - SATELLITE
      ?auto_29273 - DIRECTION
      ?auto_29272 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29268 ?auto_29265 ) ) ( not ( = ?auto_29270 ?auto_29265 ) ) ( not ( = ?auto_29270 ?auto_29268 ) ) ( ON_BOARD ?auto_29271 ?auto_29274 ) ( SUPPORTS ?auto_29271 ?auto_29266 ) ( not ( = ?auto_29265 ?auto_29273 ) ) ( HAVE_IMAGE ?auto_29270 ?auto_29269 ) ( not ( = ?auto_29270 ?auto_29273 ) ) ( not ( = ?auto_29269 ?auto_29266 ) ) ( CALIBRATION_TARGET ?auto_29271 ?auto_29273 ) ( POINTING ?auto_29274 ?auto_29268 ) ( not ( = ?auto_29273 ?auto_29268 ) ) ( ON_BOARD ?auto_29272 ?auto_29274 ) ( POWER_ON ?auto_29272 ) ( not ( = ?auto_29271 ?auto_29272 ) ) ( HAVE_IMAGE ?auto_29268 ?auto_29267 ) ( not ( = ?auto_29266 ?auto_29267 ) ) ( not ( = ?auto_29267 ?auto_29269 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29270 ?auto_29269 ?auto_29265 ?auto_29266 )
      ( GET-3IMAGE-VERIFY ?auto_29265 ?auto_29266 ?auto_29268 ?auto_29267 ?auto_29270 ?auto_29269 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_29335 - DIRECTION
      ?auto_29336 - MODE
    )
    :vars
    (
      ?auto_29338 - DIRECTION
      ?auto_29340 - INSTRUMENT
      ?auto_29343 - SATELLITE
      ?auto_29342 - DIRECTION
      ?auto_29337 - MODE
      ?auto_29339 - DIRECTION
      ?auto_29341 - INSTRUMENT
      ?auto_29344 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_29335 ?auto_29338 ) ) ( ON_BOARD ?auto_29340 ?auto_29343 ) ( SUPPORTS ?auto_29340 ?auto_29336 ) ( not ( = ?auto_29335 ?auto_29342 ) ) ( HAVE_IMAGE ?auto_29338 ?auto_29337 ) ( not ( = ?auto_29338 ?auto_29342 ) ) ( not ( = ?auto_29337 ?auto_29336 ) ) ( CALIBRATION_TARGET ?auto_29340 ?auto_29342 ) ( POINTING ?auto_29343 ?auto_29339 ) ( not ( = ?auto_29342 ?auto_29339 ) ) ( not ( = ?auto_29335 ?auto_29339 ) ) ( not ( = ?auto_29338 ?auto_29339 ) ) ( ON_BOARD ?auto_29341 ?auto_29343 ) ( POWER_ON ?auto_29341 ) ( not ( = ?auto_29340 ?auto_29341 ) ) ( CALIBRATED ?auto_29341 ) ( SUPPORTS ?auto_29341 ?auto_29344 ) ( not ( = ?auto_29337 ?auto_29344 ) ) ( not ( = ?auto_29336 ?auto_29344 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29338 ?auto_29337 ?auto_29339 ?auto_29344 )
      ( GET-2IMAGE ?auto_29338 ?auto_29337 ?auto_29335 ?auto_29336 )
      ( GET-1IMAGE-VERIFY ?auto_29335 ?auto_29336 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29345 - DIRECTION
      ?auto_29346 - MODE
      ?auto_29348 - DIRECTION
      ?auto_29347 - MODE
    )
    :vars
    (
      ?auto_29352 - INSTRUMENT
      ?auto_29351 - SATELLITE
      ?auto_29349 - DIRECTION
      ?auto_29350 - DIRECTION
      ?auto_29354 - INSTRUMENT
      ?auto_29353 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_29348 ?auto_29345 ) ) ( ON_BOARD ?auto_29352 ?auto_29351 ) ( SUPPORTS ?auto_29352 ?auto_29347 ) ( not ( = ?auto_29348 ?auto_29349 ) ) ( HAVE_IMAGE ?auto_29345 ?auto_29346 ) ( not ( = ?auto_29345 ?auto_29349 ) ) ( not ( = ?auto_29346 ?auto_29347 ) ) ( CALIBRATION_TARGET ?auto_29352 ?auto_29349 ) ( POINTING ?auto_29351 ?auto_29350 ) ( not ( = ?auto_29349 ?auto_29350 ) ) ( not ( = ?auto_29348 ?auto_29350 ) ) ( not ( = ?auto_29345 ?auto_29350 ) ) ( ON_BOARD ?auto_29354 ?auto_29351 ) ( POWER_ON ?auto_29354 ) ( not ( = ?auto_29352 ?auto_29354 ) ) ( CALIBRATED ?auto_29354 ) ( SUPPORTS ?auto_29354 ?auto_29353 ) ( not ( = ?auto_29346 ?auto_29353 ) ) ( not ( = ?auto_29347 ?auto_29353 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29348 ?auto_29347 )
      ( GET-2IMAGE-VERIFY ?auto_29345 ?auto_29346 ?auto_29348 ?auto_29347 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29355 - DIRECTION
      ?auto_29356 - MODE
      ?auto_29358 - DIRECTION
      ?auto_29357 - MODE
    )
    :vars
    (
      ?auto_29359 - DIRECTION
      ?auto_29360 - INSTRUMENT
      ?auto_29361 - SATELLITE
      ?auto_29362 - DIRECTION
      ?auto_29363 - MODE
      ?auto_29364 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29358 ?auto_29355 ) ) ( not ( = ?auto_29358 ?auto_29359 ) ) ( ON_BOARD ?auto_29360 ?auto_29361 ) ( SUPPORTS ?auto_29360 ?auto_29357 ) ( not ( = ?auto_29358 ?auto_29362 ) ) ( HAVE_IMAGE ?auto_29359 ?auto_29363 ) ( not ( = ?auto_29359 ?auto_29362 ) ) ( not ( = ?auto_29363 ?auto_29357 ) ) ( CALIBRATION_TARGET ?auto_29360 ?auto_29362 ) ( POINTING ?auto_29361 ?auto_29355 ) ( not ( = ?auto_29362 ?auto_29355 ) ) ( not ( = ?auto_29359 ?auto_29355 ) ) ( ON_BOARD ?auto_29364 ?auto_29361 ) ( POWER_ON ?auto_29364 ) ( not ( = ?auto_29360 ?auto_29364 ) ) ( CALIBRATED ?auto_29364 ) ( SUPPORTS ?auto_29364 ?auto_29356 ) ( not ( = ?auto_29363 ?auto_29356 ) ) ( not ( = ?auto_29357 ?auto_29356 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29359 ?auto_29363 ?auto_29358 ?auto_29357 )
      ( GET-2IMAGE-VERIFY ?auto_29355 ?auto_29356 ?auto_29358 ?auto_29357 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29365 - DIRECTION
      ?auto_29366 - MODE
      ?auto_29368 - DIRECTION
      ?auto_29367 - MODE
    )
    :vars
    (
      ?auto_29369 - INSTRUMENT
      ?auto_29370 - SATELLITE
      ?auto_29371 - DIRECTION
      ?auto_29372 - DIRECTION
      ?auto_29373 - INSTRUMENT
      ?auto_29374 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_29368 ?auto_29365 ) ) ( ON_BOARD ?auto_29369 ?auto_29370 ) ( SUPPORTS ?auto_29369 ?auto_29366 ) ( not ( = ?auto_29365 ?auto_29371 ) ) ( HAVE_IMAGE ?auto_29368 ?auto_29367 ) ( not ( = ?auto_29368 ?auto_29371 ) ) ( not ( = ?auto_29367 ?auto_29366 ) ) ( CALIBRATION_TARGET ?auto_29369 ?auto_29371 ) ( POINTING ?auto_29370 ?auto_29372 ) ( not ( = ?auto_29371 ?auto_29372 ) ) ( not ( = ?auto_29365 ?auto_29372 ) ) ( not ( = ?auto_29368 ?auto_29372 ) ) ( ON_BOARD ?auto_29373 ?auto_29370 ) ( POWER_ON ?auto_29373 ) ( not ( = ?auto_29369 ?auto_29373 ) ) ( CALIBRATED ?auto_29373 ) ( SUPPORTS ?auto_29373 ?auto_29374 ) ( not ( = ?auto_29367 ?auto_29374 ) ) ( not ( = ?auto_29366 ?auto_29374 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29368 ?auto_29367 ?auto_29365 ?auto_29366 )
      ( GET-2IMAGE-VERIFY ?auto_29365 ?auto_29366 ?auto_29368 ?auto_29367 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29375 - DIRECTION
      ?auto_29376 - MODE
      ?auto_29378 - DIRECTION
      ?auto_29377 - MODE
    )
    :vars
    (
      ?auto_29379 - DIRECTION
      ?auto_29380 - INSTRUMENT
      ?auto_29381 - SATELLITE
      ?auto_29382 - DIRECTION
      ?auto_29383 - MODE
      ?auto_29384 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29378 ?auto_29375 ) ) ( not ( = ?auto_29375 ?auto_29379 ) ) ( ON_BOARD ?auto_29380 ?auto_29381 ) ( SUPPORTS ?auto_29380 ?auto_29376 ) ( not ( = ?auto_29375 ?auto_29382 ) ) ( HAVE_IMAGE ?auto_29379 ?auto_29383 ) ( not ( = ?auto_29379 ?auto_29382 ) ) ( not ( = ?auto_29383 ?auto_29376 ) ) ( CALIBRATION_TARGET ?auto_29380 ?auto_29382 ) ( POINTING ?auto_29381 ?auto_29378 ) ( not ( = ?auto_29382 ?auto_29378 ) ) ( not ( = ?auto_29379 ?auto_29378 ) ) ( ON_BOARD ?auto_29384 ?auto_29381 ) ( POWER_ON ?auto_29384 ) ( not ( = ?auto_29380 ?auto_29384 ) ) ( CALIBRATED ?auto_29384 ) ( SUPPORTS ?auto_29384 ?auto_29377 ) ( not ( = ?auto_29383 ?auto_29377 ) ) ( not ( = ?auto_29376 ?auto_29377 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29379 ?auto_29383 ?auto_29375 ?auto_29376 )
      ( GET-2IMAGE-VERIFY ?auto_29375 ?auto_29376 ?auto_29378 ?auto_29377 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29409 - DIRECTION
      ?auto_29410 - MODE
      ?auto_29412 - DIRECTION
      ?auto_29411 - MODE
      ?auto_29414 - DIRECTION
      ?auto_29413 - MODE
    )
    :vars
    (
      ?auto_29415 - INSTRUMENT
      ?auto_29416 - SATELLITE
      ?auto_29417 - DIRECTION
      ?auto_29418 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29412 ?auto_29409 ) ) ( not ( = ?auto_29414 ?auto_29409 ) ) ( not ( = ?auto_29414 ?auto_29412 ) ) ( ON_BOARD ?auto_29415 ?auto_29416 ) ( SUPPORTS ?auto_29415 ?auto_29413 ) ( not ( = ?auto_29414 ?auto_29417 ) ) ( HAVE_IMAGE ?auto_29409 ?auto_29410 ) ( not ( = ?auto_29409 ?auto_29417 ) ) ( not ( = ?auto_29410 ?auto_29413 ) ) ( CALIBRATION_TARGET ?auto_29415 ?auto_29417 ) ( POINTING ?auto_29416 ?auto_29412 ) ( not ( = ?auto_29417 ?auto_29412 ) ) ( ON_BOARD ?auto_29418 ?auto_29416 ) ( POWER_ON ?auto_29418 ) ( not ( = ?auto_29415 ?auto_29418 ) ) ( CALIBRATED ?auto_29418 ) ( SUPPORTS ?auto_29418 ?auto_29411 ) ( not ( = ?auto_29410 ?auto_29411 ) ) ( not ( = ?auto_29413 ?auto_29411 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29409 ?auto_29410 ?auto_29414 ?auto_29413 )
      ( GET-3IMAGE-VERIFY ?auto_29409 ?auto_29410 ?auto_29412 ?auto_29411 ?auto_29414 ?auto_29413 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29431 - DIRECTION
      ?auto_29432 - MODE
      ?auto_29434 - DIRECTION
      ?auto_29433 - MODE
      ?auto_29436 - DIRECTION
      ?auto_29435 - MODE
    )
    :vars
    (
      ?auto_29437 - INSTRUMENT
      ?auto_29438 - SATELLITE
      ?auto_29439 - DIRECTION
      ?auto_29440 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29434 ?auto_29431 ) ) ( not ( = ?auto_29436 ?auto_29431 ) ) ( not ( = ?auto_29436 ?auto_29434 ) ) ( ON_BOARD ?auto_29437 ?auto_29438 ) ( SUPPORTS ?auto_29437 ?auto_29433 ) ( not ( = ?auto_29434 ?auto_29439 ) ) ( HAVE_IMAGE ?auto_29431 ?auto_29432 ) ( not ( = ?auto_29431 ?auto_29439 ) ) ( not ( = ?auto_29432 ?auto_29433 ) ) ( CALIBRATION_TARGET ?auto_29437 ?auto_29439 ) ( POINTING ?auto_29438 ?auto_29436 ) ( not ( = ?auto_29439 ?auto_29436 ) ) ( ON_BOARD ?auto_29440 ?auto_29438 ) ( POWER_ON ?auto_29440 ) ( not ( = ?auto_29437 ?auto_29440 ) ) ( CALIBRATED ?auto_29440 ) ( SUPPORTS ?auto_29440 ?auto_29435 ) ( not ( = ?auto_29432 ?auto_29435 ) ) ( not ( = ?auto_29433 ?auto_29435 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29431 ?auto_29432 ?auto_29434 ?auto_29433 )
      ( GET-3IMAGE-VERIFY ?auto_29431 ?auto_29432 ?auto_29434 ?auto_29433 ?auto_29436 ?auto_29435 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29453 - DIRECTION
      ?auto_29454 - MODE
      ?auto_29456 - DIRECTION
      ?auto_29455 - MODE
      ?auto_29458 - DIRECTION
      ?auto_29457 - MODE
    )
    :vars
    (
      ?auto_29459 - INSTRUMENT
      ?auto_29460 - SATELLITE
      ?auto_29461 - DIRECTION
      ?auto_29462 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29456 ?auto_29453 ) ) ( not ( = ?auto_29458 ?auto_29453 ) ) ( not ( = ?auto_29458 ?auto_29456 ) ) ( ON_BOARD ?auto_29459 ?auto_29460 ) ( SUPPORTS ?auto_29459 ?auto_29457 ) ( not ( = ?auto_29458 ?auto_29461 ) ) ( HAVE_IMAGE ?auto_29456 ?auto_29455 ) ( not ( = ?auto_29456 ?auto_29461 ) ) ( not ( = ?auto_29455 ?auto_29457 ) ) ( CALIBRATION_TARGET ?auto_29459 ?auto_29461 ) ( POINTING ?auto_29460 ?auto_29453 ) ( not ( = ?auto_29461 ?auto_29453 ) ) ( ON_BOARD ?auto_29462 ?auto_29460 ) ( POWER_ON ?auto_29462 ) ( not ( = ?auto_29459 ?auto_29462 ) ) ( CALIBRATED ?auto_29462 ) ( SUPPORTS ?auto_29462 ?auto_29454 ) ( not ( = ?auto_29455 ?auto_29454 ) ) ( not ( = ?auto_29457 ?auto_29454 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29456 ?auto_29455 ?auto_29458 ?auto_29457 )
      ( GET-3IMAGE-VERIFY ?auto_29453 ?auto_29454 ?auto_29456 ?auto_29455 ?auto_29458 ?auto_29457 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29475 - DIRECTION
      ?auto_29476 - MODE
      ?auto_29478 - DIRECTION
      ?auto_29477 - MODE
      ?auto_29480 - DIRECTION
      ?auto_29479 - MODE
    )
    :vars
    (
      ?auto_29481 - INSTRUMENT
      ?auto_29482 - SATELLITE
      ?auto_29483 - DIRECTION
      ?auto_29484 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29478 ?auto_29475 ) ) ( not ( = ?auto_29480 ?auto_29475 ) ) ( not ( = ?auto_29480 ?auto_29478 ) ) ( ON_BOARD ?auto_29481 ?auto_29482 ) ( SUPPORTS ?auto_29481 ?auto_29477 ) ( not ( = ?auto_29478 ?auto_29483 ) ) ( HAVE_IMAGE ?auto_29480 ?auto_29479 ) ( not ( = ?auto_29480 ?auto_29483 ) ) ( not ( = ?auto_29479 ?auto_29477 ) ) ( CALIBRATION_TARGET ?auto_29481 ?auto_29483 ) ( POINTING ?auto_29482 ?auto_29475 ) ( not ( = ?auto_29483 ?auto_29475 ) ) ( ON_BOARD ?auto_29484 ?auto_29482 ) ( POWER_ON ?auto_29484 ) ( not ( = ?auto_29481 ?auto_29484 ) ) ( CALIBRATED ?auto_29484 ) ( SUPPORTS ?auto_29484 ?auto_29476 ) ( not ( = ?auto_29479 ?auto_29476 ) ) ( not ( = ?auto_29477 ?auto_29476 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29480 ?auto_29479 ?auto_29478 ?auto_29477 )
      ( GET-3IMAGE-VERIFY ?auto_29475 ?auto_29476 ?auto_29478 ?auto_29477 ?auto_29480 ?auto_29479 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29521 - DIRECTION
      ?auto_29522 - MODE
      ?auto_29524 - DIRECTION
      ?auto_29523 - MODE
      ?auto_29526 - DIRECTION
      ?auto_29525 - MODE
    )
    :vars
    (
      ?auto_29527 - INSTRUMENT
      ?auto_29528 - SATELLITE
      ?auto_29529 - DIRECTION
      ?auto_29530 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29524 ?auto_29521 ) ) ( not ( = ?auto_29526 ?auto_29521 ) ) ( not ( = ?auto_29526 ?auto_29524 ) ) ( ON_BOARD ?auto_29527 ?auto_29528 ) ( SUPPORTS ?auto_29527 ?auto_29522 ) ( not ( = ?auto_29521 ?auto_29529 ) ) ( HAVE_IMAGE ?auto_29524 ?auto_29523 ) ( not ( = ?auto_29524 ?auto_29529 ) ) ( not ( = ?auto_29523 ?auto_29522 ) ) ( CALIBRATION_TARGET ?auto_29527 ?auto_29529 ) ( POINTING ?auto_29528 ?auto_29526 ) ( not ( = ?auto_29529 ?auto_29526 ) ) ( ON_BOARD ?auto_29530 ?auto_29528 ) ( POWER_ON ?auto_29530 ) ( not ( = ?auto_29527 ?auto_29530 ) ) ( CALIBRATED ?auto_29530 ) ( SUPPORTS ?auto_29530 ?auto_29525 ) ( not ( = ?auto_29523 ?auto_29525 ) ) ( not ( = ?auto_29522 ?auto_29525 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29524 ?auto_29523 ?auto_29521 ?auto_29522 )
      ( GET-3IMAGE-VERIFY ?auto_29521 ?auto_29522 ?auto_29524 ?auto_29523 ?auto_29526 ?auto_29525 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29543 - DIRECTION
      ?auto_29544 - MODE
      ?auto_29546 - DIRECTION
      ?auto_29545 - MODE
      ?auto_29548 - DIRECTION
      ?auto_29547 - MODE
    )
    :vars
    (
      ?auto_29549 - INSTRUMENT
      ?auto_29550 - SATELLITE
      ?auto_29551 - DIRECTION
      ?auto_29552 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29546 ?auto_29543 ) ) ( not ( = ?auto_29548 ?auto_29543 ) ) ( not ( = ?auto_29548 ?auto_29546 ) ) ( ON_BOARD ?auto_29549 ?auto_29550 ) ( SUPPORTS ?auto_29549 ?auto_29544 ) ( not ( = ?auto_29543 ?auto_29551 ) ) ( HAVE_IMAGE ?auto_29548 ?auto_29547 ) ( not ( = ?auto_29548 ?auto_29551 ) ) ( not ( = ?auto_29547 ?auto_29544 ) ) ( CALIBRATION_TARGET ?auto_29549 ?auto_29551 ) ( POINTING ?auto_29550 ?auto_29546 ) ( not ( = ?auto_29551 ?auto_29546 ) ) ( ON_BOARD ?auto_29552 ?auto_29550 ) ( POWER_ON ?auto_29552 ) ( not ( = ?auto_29549 ?auto_29552 ) ) ( CALIBRATED ?auto_29552 ) ( SUPPORTS ?auto_29552 ?auto_29545 ) ( not ( = ?auto_29547 ?auto_29545 ) ) ( not ( = ?auto_29544 ?auto_29545 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29548 ?auto_29547 ?auto_29543 ?auto_29544 )
      ( GET-3IMAGE-VERIFY ?auto_29543 ?auto_29544 ?auto_29546 ?auto_29545 ?auto_29548 ?auto_29547 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_29615 - DIRECTION
      ?auto_29616 - MODE
    )
    :vars
    (
      ?auto_29617 - DIRECTION
      ?auto_29618 - INSTRUMENT
      ?auto_29619 - SATELLITE
      ?auto_29620 - DIRECTION
      ?auto_29622 - MODE
      ?auto_29621 - DIRECTION
      ?auto_29623 - INSTRUMENT
      ?auto_29624 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_29615 ?auto_29617 ) ) ( ON_BOARD ?auto_29618 ?auto_29619 ) ( SUPPORTS ?auto_29618 ?auto_29616 ) ( not ( = ?auto_29615 ?auto_29620 ) ) ( HAVE_IMAGE ?auto_29617 ?auto_29622 ) ( not ( = ?auto_29617 ?auto_29620 ) ) ( not ( = ?auto_29622 ?auto_29616 ) ) ( CALIBRATION_TARGET ?auto_29618 ?auto_29620 ) ( not ( = ?auto_29620 ?auto_29621 ) ) ( not ( = ?auto_29615 ?auto_29621 ) ) ( not ( = ?auto_29617 ?auto_29621 ) ) ( ON_BOARD ?auto_29623 ?auto_29619 ) ( POWER_ON ?auto_29623 ) ( not ( = ?auto_29618 ?auto_29623 ) ) ( CALIBRATED ?auto_29623 ) ( SUPPORTS ?auto_29623 ?auto_29624 ) ( not ( = ?auto_29622 ?auto_29624 ) ) ( not ( = ?auto_29616 ?auto_29624 ) ) ( POINTING ?auto_29619 ?auto_29620 ) )
    :subtasks
    ( ( !TURN_TO ?auto_29619 ?auto_29621 ?auto_29620 )
      ( GET-2IMAGE ?auto_29617 ?auto_29622 ?auto_29615 ?auto_29616 )
      ( GET-1IMAGE-VERIFY ?auto_29615 ?auto_29616 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29625 - DIRECTION
      ?auto_29626 - MODE
      ?auto_29628 - DIRECTION
      ?auto_29627 - MODE
    )
    :vars
    (
      ?auto_29632 - INSTRUMENT
      ?auto_29630 - SATELLITE
      ?auto_29629 - DIRECTION
      ?auto_29634 - DIRECTION
      ?auto_29631 - INSTRUMENT
      ?auto_29633 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_29628 ?auto_29625 ) ) ( ON_BOARD ?auto_29632 ?auto_29630 ) ( SUPPORTS ?auto_29632 ?auto_29627 ) ( not ( = ?auto_29628 ?auto_29629 ) ) ( HAVE_IMAGE ?auto_29625 ?auto_29626 ) ( not ( = ?auto_29625 ?auto_29629 ) ) ( not ( = ?auto_29626 ?auto_29627 ) ) ( CALIBRATION_TARGET ?auto_29632 ?auto_29629 ) ( not ( = ?auto_29629 ?auto_29634 ) ) ( not ( = ?auto_29628 ?auto_29634 ) ) ( not ( = ?auto_29625 ?auto_29634 ) ) ( ON_BOARD ?auto_29631 ?auto_29630 ) ( POWER_ON ?auto_29631 ) ( not ( = ?auto_29632 ?auto_29631 ) ) ( CALIBRATED ?auto_29631 ) ( SUPPORTS ?auto_29631 ?auto_29633 ) ( not ( = ?auto_29626 ?auto_29633 ) ) ( not ( = ?auto_29627 ?auto_29633 ) ) ( POINTING ?auto_29630 ?auto_29629 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29628 ?auto_29627 )
      ( GET-2IMAGE-VERIFY ?auto_29625 ?auto_29626 ?auto_29628 ?auto_29627 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29635 - DIRECTION
      ?auto_29636 - MODE
      ?auto_29638 - DIRECTION
      ?auto_29637 - MODE
    )
    :vars
    (
      ?auto_29644 - DIRECTION
      ?auto_29641 - INSTRUMENT
      ?auto_29639 - SATELLITE
      ?auto_29640 - DIRECTION
      ?auto_29643 - MODE
      ?auto_29642 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29638 ?auto_29635 ) ) ( not ( = ?auto_29638 ?auto_29644 ) ) ( ON_BOARD ?auto_29641 ?auto_29639 ) ( SUPPORTS ?auto_29641 ?auto_29637 ) ( not ( = ?auto_29638 ?auto_29640 ) ) ( HAVE_IMAGE ?auto_29644 ?auto_29643 ) ( not ( = ?auto_29644 ?auto_29640 ) ) ( not ( = ?auto_29643 ?auto_29637 ) ) ( CALIBRATION_TARGET ?auto_29641 ?auto_29640 ) ( not ( = ?auto_29640 ?auto_29635 ) ) ( not ( = ?auto_29644 ?auto_29635 ) ) ( ON_BOARD ?auto_29642 ?auto_29639 ) ( POWER_ON ?auto_29642 ) ( not ( = ?auto_29641 ?auto_29642 ) ) ( CALIBRATED ?auto_29642 ) ( SUPPORTS ?auto_29642 ?auto_29636 ) ( not ( = ?auto_29643 ?auto_29636 ) ) ( not ( = ?auto_29637 ?auto_29636 ) ) ( POINTING ?auto_29639 ?auto_29640 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29644 ?auto_29643 ?auto_29638 ?auto_29637 )
      ( GET-2IMAGE-VERIFY ?auto_29635 ?auto_29636 ?auto_29638 ?auto_29637 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29645 - DIRECTION
      ?auto_29646 - MODE
      ?auto_29648 - DIRECTION
      ?auto_29647 - MODE
    )
    :vars
    (
      ?auto_29652 - INSTRUMENT
      ?auto_29650 - SATELLITE
      ?auto_29651 - DIRECTION
      ?auto_29654 - DIRECTION
      ?auto_29653 - INSTRUMENT
      ?auto_29649 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_29648 ?auto_29645 ) ) ( ON_BOARD ?auto_29652 ?auto_29650 ) ( SUPPORTS ?auto_29652 ?auto_29646 ) ( not ( = ?auto_29645 ?auto_29651 ) ) ( HAVE_IMAGE ?auto_29648 ?auto_29647 ) ( not ( = ?auto_29648 ?auto_29651 ) ) ( not ( = ?auto_29647 ?auto_29646 ) ) ( CALIBRATION_TARGET ?auto_29652 ?auto_29651 ) ( not ( = ?auto_29651 ?auto_29654 ) ) ( not ( = ?auto_29645 ?auto_29654 ) ) ( not ( = ?auto_29648 ?auto_29654 ) ) ( ON_BOARD ?auto_29653 ?auto_29650 ) ( POWER_ON ?auto_29653 ) ( not ( = ?auto_29652 ?auto_29653 ) ) ( CALIBRATED ?auto_29653 ) ( SUPPORTS ?auto_29653 ?auto_29649 ) ( not ( = ?auto_29647 ?auto_29649 ) ) ( not ( = ?auto_29646 ?auto_29649 ) ) ( POINTING ?auto_29650 ?auto_29651 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29648 ?auto_29647 ?auto_29645 ?auto_29646 )
      ( GET-2IMAGE-VERIFY ?auto_29645 ?auto_29646 ?auto_29648 ?auto_29647 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29655 - DIRECTION
      ?auto_29656 - MODE
      ?auto_29658 - DIRECTION
      ?auto_29657 - MODE
    )
    :vars
    (
      ?auto_29664 - DIRECTION
      ?auto_29661 - INSTRUMENT
      ?auto_29659 - SATELLITE
      ?auto_29660 - DIRECTION
      ?auto_29663 - MODE
      ?auto_29662 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29658 ?auto_29655 ) ) ( not ( = ?auto_29655 ?auto_29664 ) ) ( ON_BOARD ?auto_29661 ?auto_29659 ) ( SUPPORTS ?auto_29661 ?auto_29656 ) ( not ( = ?auto_29655 ?auto_29660 ) ) ( HAVE_IMAGE ?auto_29664 ?auto_29663 ) ( not ( = ?auto_29664 ?auto_29660 ) ) ( not ( = ?auto_29663 ?auto_29656 ) ) ( CALIBRATION_TARGET ?auto_29661 ?auto_29660 ) ( not ( = ?auto_29660 ?auto_29658 ) ) ( not ( = ?auto_29664 ?auto_29658 ) ) ( ON_BOARD ?auto_29662 ?auto_29659 ) ( POWER_ON ?auto_29662 ) ( not ( = ?auto_29661 ?auto_29662 ) ) ( CALIBRATED ?auto_29662 ) ( SUPPORTS ?auto_29662 ?auto_29657 ) ( not ( = ?auto_29663 ?auto_29657 ) ) ( not ( = ?auto_29656 ?auto_29657 ) ) ( POINTING ?auto_29659 ?auto_29660 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29664 ?auto_29663 ?auto_29655 ?auto_29656 )
      ( GET-2IMAGE-VERIFY ?auto_29655 ?auto_29656 ?auto_29658 ?auto_29657 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29689 - DIRECTION
      ?auto_29690 - MODE
      ?auto_29692 - DIRECTION
      ?auto_29691 - MODE
      ?auto_29694 - DIRECTION
      ?auto_29693 - MODE
    )
    :vars
    (
      ?auto_29697 - INSTRUMENT
      ?auto_29695 - SATELLITE
      ?auto_29696 - DIRECTION
      ?auto_29698 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29692 ?auto_29689 ) ) ( not ( = ?auto_29694 ?auto_29689 ) ) ( not ( = ?auto_29694 ?auto_29692 ) ) ( ON_BOARD ?auto_29697 ?auto_29695 ) ( SUPPORTS ?auto_29697 ?auto_29693 ) ( not ( = ?auto_29694 ?auto_29696 ) ) ( HAVE_IMAGE ?auto_29689 ?auto_29690 ) ( not ( = ?auto_29689 ?auto_29696 ) ) ( not ( = ?auto_29690 ?auto_29693 ) ) ( CALIBRATION_TARGET ?auto_29697 ?auto_29696 ) ( not ( = ?auto_29696 ?auto_29692 ) ) ( ON_BOARD ?auto_29698 ?auto_29695 ) ( POWER_ON ?auto_29698 ) ( not ( = ?auto_29697 ?auto_29698 ) ) ( CALIBRATED ?auto_29698 ) ( SUPPORTS ?auto_29698 ?auto_29691 ) ( not ( = ?auto_29690 ?auto_29691 ) ) ( not ( = ?auto_29693 ?auto_29691 ) ) ( POINTING ?auto_29695 ?auto_29696 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29689 ?auto_29690 ?auto_29694 ?auto_29693 )
      ( GET-3IMAGE-VERIFY ?auto_29689 ?auto_29690 ?auto_29692 ?auto_29691 ?auto_29694 ?auto_29693 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29711 - DIRECTION
      ?auto_29712 - MODE
      ?auto_29714 - DIRECTION
      ?auto_29713 - MODE
      ?auto_29716 - DIRECTION
      ?auto_29715 - MODE
    )
    :vars
    (
      ?auto_29719 - INSTRUMENT
      ?auto_29717 - SATELLITE
      ?auto_29718 - DIRECTION
      ?auto_29720 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29714 ?auto_29711 ) ) ( not ( = ?auto_29716 ?auto_29711 ) ) ( not ( = ?auto_29716 ?auto_29714 ) ) ( ON_BOARD ?auto_29719 ?auto_29717 ) ( SUPPORTS ?auto_29719 ?auto_29713 ) ( not ( = ?auto_29714 ?auto_29718 ) ) ( HAVE_IMAGE ?auto_29711 ?auto_29712 ) ( not ( = ?auto_29711 ?auto_29718 ) ) ( not ( = ?auto_29712 ?auto_29713 ) ) ( CALIBRATION_TARGET ?auto_29719 ?auto_29718 ) ( not ( = ?auto_29718 ?auto_29716 ) ) ( ON_BOARD ?auto_29720 ?auto_29717 ) ( POWER_ON ?auto_29720 ) ( not ( = ?auto_29719 ?auto_29720 ) ) ( CALIBRATED ?auto_29720 ) ( SUPPORTS ?auto_29720 ?auto_29715 ) ( not ( = ?auto_29712 ?auto_29715 ) ) ( not ( = ?auto_29713 ?auto_29715 ) ) ( POINTING ?auto_29717 ?auto_29718 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29711 ?auto_29712 ?auto_29714 ?auto_29713 )
      ( GET-3IMAGE-VERIFY ?auto_29711 ?auto_29712 ?auto_29714 ?auto_29713 ?auto_29716 ?auto_29715 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29733 - DIRECTION
      ?auto_29734 - MODE
      ?auto_29736 - DIRECTION
      ?auto_29735 - MODE
      ?auto_29738 - DIRECTION
      ?auto_29737 - MODE
    )
    :vars
    (
      ?auto_29741 - INSTRUMENT
      ?auto_29739 - SATELLITE
      ?auto_29740 - DIRECTION
      ?auto_29742 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29736 ?auto_29733 ) ) ( not ( = ?auto_29738 ?auto_29733 ) ) ( not ( = ?auto_29738 ?auto_29736 ) ) ( ON_BOARD ?auto_29741 ?auto_29739 ) ( SUPPORTS ?auto_29741 ?auto_29737 ) ( not ( = ?auto_29738 ?auto_29740 ) ) ( HAVE_IMAGE ?auto_29736 ?auto_29735 ) ( not ( = ?auto_29736 ?auto_29740 ) ) ( not ( = ?auto_29735 ?auto_29737 ) ) ( CALIBRATION_TARGET ?auto_29741 ?auto_29740 ) ( not ( = ?auto_29740 ?auto_29733 ) ) ( ON_BOARD ?auto_29742 ?auto_29739 ) ( POWER_ON ?auto_29742 ) ( not ( = ?auto_29741 ?auto_29742 ) ) ( CALIBRATED ?auto_29742 ) ( SUPPORTS ?auto_29742 ?auto_29734 ) ( not ( = ?auto_29735 ?auto_29734 ) ) ( not ( = ?auto_29737 ?auto_29734 ) ) ( POINTING ?auto_29739 ?auto_29740 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29736 ?auto_29735 ?auto_29738 ?auto_29737 )
      ( GET-3IMAGE-VERIFY ?auto_29733 ?auto_29734 ?auto_29736 ?auto_29735 ?auto_29738 ?auto_29737 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29755 - DIRECTION
      ?auto_29756 - MODE
      ?auto_29758 - DIRECTION
      ?auto_29757 - MODE
      ?auto_29760 - DIRECTION
      ?auto_29759 - MODE
    )
    :vars
    (
      ?auto_29763 - INSTRUMENT
      ?auto_29761 - SATELLITE
      ?auto_29762 - DIRECTION
      ?auto_29764 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29758 ?auto_29755 ) ) ( not ( = ?auto_29760 ?auto_29755 ) ) ( not ( = ?auto_29760 ?auto_29758 ) ) ( ON_BOARD ?auto_29763 ?auto_29761 ) ( SUPPORTS ?auto_29763 ?auto_29757 ) ( not ( = ?auto_29758 ?auto_29762 ) ) ( HAVE_IMAGE ?auto_29760 ?auto_29759 ) ( not ( = ?auto_29760 ?auto_29762 ) ) ( not ( = ?auto_29759 ?auto_29757 ) ) ( CALIBRATION_TARGET ?auto_29763 ?auto_29762 ) ( not ( = ?auto_29762 ?auto_29755 ) ) ( ON_BOARD ?auto_29764 ?auto_29761 ) ( POWER_ON ?auto_29764 ) ( not ( = ?auto_29763 ?auto_29764 ) ) ( CALIBRATED ?auto_29764 ) ( SUPPORTS ?auto_29764 ?auto_29756 ) ( not ( = ?auto_29759 ?auto_29756 ) ) ( not ( = ?auto_29757 ?auto_29756 ) ) ( POINTING ?auto_29761 ?auto_29762 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29760 ?auto_29759 ?auto_29758 ?auto_29757 )
      ( GET-3IMAGE-VERIFY ?auto_29755 ?auto_29756 ?auto_29758 ?auto_29757 ?auto_29760 ?auto_29759 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29801 - DIRECTION
      ?auto_29802 - MODE
      ?auto_29804 - DIRECTION
      ?auto_29803 - MODE
      ?auto_29806 - DIRECTION
      ?auto_29805 - MODE
    )
    :vars
    (
      ?auto_29809 - INSTRUMENT
      ?auto_29807 - SATELLITE
      ?auto_29808 - DIRECTION
      ?auto_29810 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29804 ?auto_29801 ) ) ( not ( = ?auto_29806 ?auto_29801 ) ) ( not ( = ?auto_29806 ?auto_29804 ) ) ( ON_BOARD ?auto_29809 ?auto_29807 ) ( SUPPORTS ?auto_29809 ?auto_29802 ) ( not ( = ?auto_29801 ?auto_29808 ) ) ( HAVE_IMAGE ?auto_29804 ?auto_29803 ) ( not ( = ?auto_29804 ?auto_29808 ) ) ( not ( = ?auto_29803 ?auto_29802 ) ) ( CALIBRATION_TARGET ?auto_29809 ?auto_29808 ) ( not ( = ?auto_29808 ?auto_29806 ) ) ( ON_BOARD ?auto_29810 ?auto_29807 ) ( POWER_ON ?auto_29810 ) ( not ( = ?auto_29809 ?auto_29810 ) ) ( CALIBRATED ?auto_29810 ) ( SUPPORTS ?auto_29810 ?auto_29805 ) ( not ( = ?auto_29803 ?auto_29805 ) ) ( not ( = ?auto_29802 ?auto_29805 ) ) ( POINTING ?auto_29807 ?auto_29808 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29804 ?auto_29803 ?auto_29801 ?auto_29802 )
      ( GET-3IMAGE-VERIFY ?auto_29801 ?auto_29802 ?auto_29804 ?auto_29803 ?auto_29806 ?auto_29805 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29823 - DIRECTION
      ?auto_29824 - MODE
      ?auto_29826 - DIRECTION
      ?auto_29825 - MODE
      ?auto_29828 - DIRECTION
      ?auto_29827 - MODE
    )
    :vars
    (
      ?auto_29831 - INSTRUMENT
      ?auto_29829 - SATELLITE
      ?auto_29830 - DIRECTION
      ?auto_29832 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29826 ?auto_29823 ) ) ( not ( = ?auto_29828 ?auto_29823 ) ) ( not ( = ?auto_29828 ?auto_29826 ) ) ( ON_BOARD ?auto_29831 ?auto_29829 ) ( SUPPORTS ?auto_29831 ?auto_29824 ) ( not ( = ?auto_29823 ?auto_29830 ) ) ( HAVE_IMAGE ?auto_29828 ?auto_29827 ) ( not ( = ?auto_29828 ?auto_29830 ) ) ( not ( = ?auto_29827 ?auto_29824 ) ) ( CALIBRATION_TARGET ?auto_29831 ?auto_29830 ) ( not ( = ?auto_29830 ?auto_29826 ) ) ( ON_BOARD ?auto_29832 ?auto_29829 ) ( POWER_ON ?auto_29832 ) ( not ( = ?auto_29831 ?auto_29832 ) ) ( CALIBRATED ?auto_29832 ) ( SUPPORTS ?auto_29832 ?auto_29825 ) ( not ( = ?auto_29827 ?auto_29825 ) ) ( not ( = ?auto_29824 ?auto_29825 ) ) ( POINTING ?auto_29829 ?auto_29830 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29828 ?auto_29827 ?auto_29823 ?auto_29824 )
      ( GET-3IMAGE-VERIFY ?auto_29823 ?auto_29824 ?auto_29826 ?auto_29825 ?auto_29828 ?auto_29827 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_29895 - DIRECTION
      ?auto_29896 - MODE
    )
    :vars
    (
      ?auto_29904 - DIRECTION
      ?auto_29900 - INSTRUMENT
      ?auto_29898 - SATELLITE
      ?auto_29899 - DIRECTION
      ?auto_29903 - MODE
      ?auto_29902 - DIRECTION
      ?auto_29901 - INSTRUMENT
      ?auto_29897 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_29895 ?auto_29904 ) ) ( ON_BOARD ?auto_29900 ?auto_29898 ) ( SUPPORTS ?auto_29900 ?auto_29896 ) ( not ( = ?auto_29895 ?auto_29899 ) ) ( HAVE_IMAGE ?auto_29904 ?auto_29903 ) ( not ( = ?auto_29904 ?auto_29899 ) ) ( not ( = ?auto_29903 ?auto_29896 ) ) ( CALIBRATION_TARGET ?auto_29900 ?auto_29899 ) ( not ( = ?auto_29899 ?auto_29902 ) ) ( not ( = ?auto_29895 ?auto_29902 ) ) ( not ( = ?auto_29904 ?auto_29902 ) ) ( ON_BOARD ?auto_29901 ?auto_29898 ) ( POWER_ON ?auto_29901 ) ( not ( = ?auto_29900 ?auto_29901 ) ) ( SUPPORTS ?auto_29901 ?auto_29897 ) ( not ( = ?auto_29903 ?auto_29897 ) ) ( not ( = ?auto_29896 ?auto_29897 ) ) ( POINTING ?auto_29898 ?auto_29899 ) ( CALIBRATION_TARGET ?auto_29901 ?auto_29899 ) ( NOT_CALIBRATED ?auto_29901 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_29898 ?auto_29901 ?auto_29899 )
      ( GET-2IMAGE ?auto_29904 ?auto_29903 ?auto_29895 ?auto_29896 )
      ( GET-1IMAGE-VERIFY ?auto_29895 ?auto_29896 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29905 - DIRECTION
      ?auto_29906 - MODE
      ?auto_29908 - DIRECTION
      ?auto_29907 - MODE
    )
    :vars
    (
      ?auto_29913 - INSTRUMENT
      ?auto_29910 - SATELLITE
      ?auto_29911 - DIRECTION
      ?auto_29912 - DIRECTION
      ?auto_29909 - INSTRUMENT
      ?auto_29914 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_29908 ?auto_29905 ) ) ( ON_BOARD ?auto_29913 ?auto_29910 ) ( SUPPORTS ?auto_29913 ?auto_29907 ) ( not ( = ?auto_29908 ?auto_29911 ) ) ( HAVE_IMAGE ?auto_29905 ?auto_29906 ) ( not ( = ?auto_29905 ?auto_29911 ) ) ( not ( = ?auto_29906 ?auto_29907 ) ) ( CALIBRATION_TARGET ?auto_29913 ?auto_29911 ) ( not ( = ?auto_29911 ?auto_29912 ) ) ( not ( = ?auto_29908 ?auto_29912 ) ) ( not ( = ?auto_29905 ?auto_29912 ) ) ( ON_BOARD ?auto_29909 ?auto_29910 ) ( POWER_ON ?auto_29909 ) ( not ( = ?auto_29913 ?auto_29909 ) ) ( SUPPORTS ?auto_29909 ?auto_29914 ) ( not ( = ?auto_29906 ?auto_29914 ) ) ( not ( = ?auto_29907 ?auto_29914 ) ) ( POINTING ?auto_29910 ?auto_29911 ) ( CALIBRATION_TARGET ?auto_29909 ?auto_29911 ) ( NOT_CALIBRATED ?auto_29909 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29908 ?auto_29907 )
      ( GET-2IMAGE-VERIFY ?auto_29905 ?auto_29906 ?auto_29908 ?auto_29907 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29915 - DIRECTION
      ?auto_29916 - MODE
      ?auto_29918 - DIRECTION
      ?auto_29917 - MODE
    )
    :vars
    (
      ?auto_29922 - DIRECTION
      ?auto_29924 - INSTRUMENT
      ?auto_29920 - SATELLITE
      ?auto_29919 - DIRECTION
      ?auto_29921 - MODE
      ?auto_29923 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29918 ?auto_29915 ) ) ( not ( = ?auto_29918 ?auto_29922 ) ) ( ON_BOARD ?auto_29924 ?auto_29920 ) ( SUPPORTS ?auto_29924 ?auto_29917 ) ( not ( = ?auto_29918 ?auto_29919 ) ) ( HAVE_IMAGE ?auto_29922 ?auto_29921 ) ( not ( = ?auto_29922 ?auto_29919 ) ) ( not ( = ?auto_29921 ?auto_29917 ) ) ( CALIBRATION_TARGET ?auto_29924 ?auto_29919 ) ( not ( = ?auto_29919 ?auto_29915 ) ) ( not ( = ?auto_29922 ?auto_29915 ) ) ( ON_BOARD ?auto_29923 ?auto_29920 ) ( POWER_ON ?auto_29923 ) ( not ( = ?auto_29924 ?auto_29923 ) ) ( SUPPORTS ?auto_29923 ?auto_29916 ) ( not ( = ?auto_29921 ?auto_29916 ) ) ( not ( = ?auto_29917 ?auto_29916 ) ) ( POINTING ?auto_29920 ?auto_29919 ) ( CALIBRATION_TARGET ?auto_29923 ?auto_29919 ) ( NOT_CALIBRATED ?auto_29923 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29922 ?auto_29921 ?auto_29918 ?auto_29917 )
      ( GET-2IMAGE-VERIFY ?auto_29915 ?auto_29916 ?auto_29918 ?auto_29917 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29925 - DIRECTION
      ?auto_29926 - MODE
      ?auto_29928 - DIRECTION
      ?auto_29927 - MODE
    )
    :vars
    (
      ?auto_29933 - INSTRUMENT
      ?auto_29930 - SATELLITE
      ?auto_29929 - DIRECTION
      ?auto_29931 - DIRECTION
      ?auto_29932 - INSTRUMENT
      ?auto_29934 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_29928 ?auto_29925 ) ) ( ON_BOARD ?auto_29933 ?auto_29930 ) ( SUPPORTS ?auto_29933 ?auto_29926 ) ( not ( = ?auto_29925 ?auto_29929 ) ) ( HAVE_IMAGE ?auto_29928 ?auto_29927 ) ( not ( = ?auto_29928 ?auto_29929 ) ) ( not ( = ?auto_29927 ?auto_29926 ) ) ( CALIBRATION_TARGET ?auto_29933 ?auto_29929 ) ( not ( = ?auto_29929 ?auto_29931 ) ) ( not ( = ?auto_29925 ?auto_29931 ) ) ( not ( = ?auto_29928 ?auto_29931 ) ) ( ON_BOARD ?auto_29932 ?auto_29930 ) ( POWER_ON ?auto_29932 ) ( not ( = ?auto_29933 ?auto_29932 ) ) ( SUPPORTS ?auto_29932 ?auto_29934 ) ( not ( = ?auto_29927 ?auto_29934 ) ) ( not ( = ?auto_29926 ?auto_29934 ) ) ( POINTING ?auto_29930 ?auto_29929 ) ( CALIBRATION_TARGET ?auto_29932 ?auto_29929 ) ( NOT_CALIBRATED ?auto_29932 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29928 ?auto_29927 ?auto_29925 ?auto_29926 )
      ( GET-2IMAGE-VERIFY ?auto_29925 ?auto_29926 ?auto_29928 ?auto_29927 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29935 - DIRECTION
      ?auto_29936 - MODE
      ?auto_29938 - DIRECTION
      ?auto_29937 - MODE
    )
    :vars
    (
      ?auto_29942 - DIRECTION
      ?auto_29944 - INSTRUMENT
      ?auto_29940 - SATELLITE
      ?auto_29939 - DIRECTION
      ?auto_29941 - MODE
      ?auto_29943 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29938 ?auto_29935 ) ) ( not ( = ?auto_29935 ?auto_29942 ) ) ( ON_BOARD ?auto_29944 ?auto_29940 ) ( SUPPORTS ?auto_29944 ?auto_29936 ) ( not ( = ?auto_29935 ?auto_29939 ) ) ( HAVE_IMAGE ?auto_29942 ?auto_29941 ) ( not ( = ?auto_29942 ?auto_29939 ) ) ( not ( = ?auto_29941 ?auto_29936 ) ) ( CALIBRATION_TARGET ?auto_29944 ?auto_29939 ) ( not ( = ?auto_29939 ?auto_29938 ) ) ( not ( = ?auto_29942 ?auto_29938 ) ) ( ON_BOARD ?auto_29943 ?auto_29940 ) ( POWER_ON ?auto_29943 ) ( not ( = ?auto_29944 ?auto_29943 ) ) ( SUPPORTS ?auto_29943 ?auto_29937 ) ( not ( = ?auto_29941 ?auto_29937 ) ) ( not ( = ?auto_29936 ?auto_29937 ) ) ( POINTING ?auto_29940 ?auto_29939 ) ( CALIBRATION_TARGET ?auto_29943 ?auto_29939 ) ( NOT_CALIBRATED ?auto_29943 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29942 ?auto_29941 ?auto_29935 ?auto_29936 )
      ( GET-2IMAGE-VERIFY ?auto_29935 ?auto_29936 ?auto_29938 ?auto_29937 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29969 - DIRECTION
      ?auto_29970 - MODE
      ?auto_29972 - DIRECTION
      ?auto_29971 - MODE
      ?auto_29974 - DIRECTION
      ?auto_29973 - MODE
    )
    :vars
    (
      ?auto_29978 - INSTRUMENT
      ?auto_29976 - SATELLITE
      ?auto_29975 - DIRECTION
      ?auto_29977 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29972 ?auto_29969 ) ) ( not ( = ?auto_29974 ?auto_29969 ) ) ( not ( = ?auto_29974 ?auto_29972 ) ) ( ON_BOARD ?auto_29978 ?auto_29976 ) ( SUPPORTS ?auto_29978 ?auto_29973 ) ( not ( = ?auto_29974 ?auto_29975 ) ) ( HAVE_IMAGE ?auto_29969 ?auto_29970 ) ( not ( = ?auto_29969 ?auto_29975 ) ) ( not ( = ?auto_29970 ?auto_29973 ) ) ( CALIBRATION_TARGET ?auto_29978 ?auto_29975 ) ( not ( = ?auto_29975 ?auto_29972 ) ) ( ON_BOARD ?auto_29977 ?auto_29976 ) ( POWER_ON ?auto_29977 ) ( not ( = ?auto_29978 ?auto_29977 ) ) ( SUPPORTS ?auto_29977 ?auto_29971 ) ( not ( = ?auto_29970 ?auto_29971 ) ) ( not ( = ?auto_29973 ?auto_29971 ) ) ( POINTING ?auto_29976 ?auto_29975 ) ( CALIBRATION_TARGET ?auto_29977 ?auto_29975 ) ( NOT_CALIBRATED ?auto_29977 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29969 ?auto_29970 ?auto_29974 ?auto_29973 )
      ( GET-3IMAGE-VERIFY ?auto_29969 ?auto_29970 ?auto_29972 ?auto_29971 ?auto_29974 ?auto_29973 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29991 - DIRECTION
      ?auto_29992 - MODE
      ?auto_29994 - DIRECTION
      ?auto_29993 - MODE
      ?auto_29996 - DIRECTION
      ?auto_29995 - MODE
    )
    :vars
    (
      ?auto_30000 - INSTRUMENT
      ?auto_29998 - SATELLITE
      ?auto_29997 - DIRECTION
      ?auto_29999 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_29994 ?auto_29991 ) ) ( not ( = ?auto_29996 ?auto_29991 ) ) ( not ( = ?auto_29996 ?auto_29994 ) ) ( ON_BOARD ?auto_30000 ?auto_29998 ) ( SUPPORTS ?auto_30000 ?auto_29993 ) ( not ( = ?auto_29994 ?auto_29997 ) ) ( HAVE_IMAGE ?auto_29991 ?auto_29992 ) ( not ( = ?auto_29991 ?auto_29997 ) ) ( not ( = ?auto_29992 ?auto_29993 ) ) ( CALIBRATION_TARGET ?auto_30000 ?auto_29997 ) ( not ( = ?auto_29997 ?auto_29996 ) ) ( ON_BOARD ?auto_29999 ?auto_29998 ) ( POWER_ON ?auto_29999 ) ( not ( = ?auto_30000 ?auto_29999 ) ) ( SUPPORTS ?auto_29999 ?auto_29995 ) ( not ( = ?auto_29992 ?auto_29995 ) ) ( not ( = ?auto_29993 ?auto_29995 ) ) ( POINTING ?auto_29998 ?auto_29997 ) ( CALIBRATION_TARGET ?auto_29999 ?auto_29997 ) ( NOT_CALIBRATED ?auto_29999 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29991 ?auto_29992 ?auto_29994 ?auto_29993 )
      ( GET-3IMAGE-VERIFY ?auto_29991 ?auto_29992 ?auto_29994 ?auto_29993 ?auto_29996 ?auto_29995 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30013 - DIRECTION
      ?auto_30014 - MODE
      ?auto_30016 - DIRECTION
      ?auto_30015 - MODE
      ?auto_30018 - DIRECTION
      ?auto_30017 - MODE
    )
    :vars
    (
      ?auto_30022 - INSTRUMENT
      ?auto_30020 - SATELLITE
      ?auto_30019 - DIRECTION
      ?auto_30021 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30016 ?auto_30013 ) ) ( not ( = ?auto_30018 ?auto_30013 ) ) ( not ( = ?auto_30018 ?auto_30016 ) ) ( ON_BOARD ?auto_30022 ?auto_30020 ) ( SUPPORTS ?auto_30022 ?auto_30017 ) ( not ( = ?auto_30018 ?auto_30019 ) ) ( HAVE_IMAGE ?auto_30016 ?auto_30015 ) ( not ( = ?auto_30016 ?auto_30019 ) ) ( not ( = ?auto_30015 ?auto_30017 ) ) ( CALIBRATION_TARGET ?auto_30022 ?auto_30019 ) ( not ( = ?auto_30019 ?auto_30013 ) ) ( ON_BOARD ?auto_30021 ?auto_30020 ) ( POWER_ON ?auto_30021 ) ( not ( = ?auto_30022 ?auto_30021 ) ) ( SUPPORTS ?auto_30021 ?auto_30014 ) ( not ( = ?auto_30015 ?auto_30014 ) ) ( not ( = ?auto_30017 ?auto_30014 ) ) ( POINTING ?auto_30020 ?auto_30019 ) ( CALIBRATION_TARGET ?auto_30021 ?auto_30019 ) ( NOT_CALIBRATED ?auto_30021 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30016 ?auto_30015 ?auto_30018 ?auto_30017 )
      ( GET-3IMAGE-VERIFY ?auto_30013 ?auto_30014 ?auto_30016 ?auto_30015 ?auto_30018 ?auto_30017 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30035 - DIRECTION
      ?auto_30036 - MODE
      ?auto_30038 - DIRECTION
      ?auto_30037 - MODE
      ?auto_30040 - DIRECTION
      ?auto_30039 - MODE
    )
    :vars
    (
      ?auto_30044 - INSTRUMENT
      ?auto_30042 - SATELLITE
      ?auto_30041 - DIRECTION
      ?auto_30043 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30038 ?auto_30035 ) ) ( not ( = ?auto_30040 ?auto_30035 ) ) ( not ( = ?auto_30040 ?auto_30038 ) ) ( ON_BOARD ?auto_30044 ?auto_30042 ) ( SUPPORTS ?auto_30044 ?auto_30037 ) ( not ( = ?auto_30038 ?auto_30041 ) ) ( HAVE_IMAGE ?auto_30040 ?auto_30039 ) ( not ( = ?auto_30040 ?auto_30041 ) ) ( not ( = ?auto_30039 ?auto_30037 ) ) ( CALIBRATION_TARGET ?auto_30044 ?auto_30041 ) ( not ( = ?auto_30041 ?auto_30035 ) ) ( ON_BOARD ?auto_30043 ?auto_30042 ) ( POWER_ON ?auto_30043 ) ( not ( = ?auto_30044 ?auto_30043 ) ) ( SUPPORTS ?auto_30043 ?auto_30036 ) ( not ( = ?auto_30039 ?auto_30036 ) ) ( not ( = ?auto_30037 ?auto_30036 ) ) ( POINTING ?auto_30042 ?auto_30041 ) ( CALIBRATION_TARGET ?auto_30043 ?auto_30041 ) ( NOT_CALIBRATED ?auto_30043 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30040 ?auto_30039 ?auto_30038 ?auto_30037 )
      ( GET-3IMAGE-VERIFY ?auto_30035 ?auto_30036 ?auto_30038 ?auto_30037 ?auto_30040 ?auto_30039 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30081 - DIRECTION
      ?auto_30082 - MODE
      ?auto_30084 - DIRECTION
      ?auto_30083 - MODE
      ?auto_30086 - DIRECTION
      ?auto_30085 - MODE
    )
    :vars
    (
      ?auto_30090 - INSTRUMENT
      ?auto_30088 - SATELLITE
      ?auto_30087 - DIRECTION
      ?auto_30089 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30084 ?auto_30081 ) ) ( not ( = ?auto_30086 ?auto_30081 ) ) ( not ( = ?auto_30086 ?auto_30084 ) ) ( ON_BOARD ?auto_30090 ?auto_30088 ) ( SUPPORTS ?auto_30090 ?auto_30082 ) ( not ( = ?auto_30081 ?auto_30087 ) ) ( HAVE_IMAGE ?auto_30084 ?auto_30083 ) ( not ( = ?auto_30084 ?auto_30087 ) ) ( not ( = ?auto_30083 ?auto_30082 ) ) ( CALIBRATION_TARGET ?auto_30090 ?auto_30087 ) ( not ( = ?auto_30087 ?auto_30086 ) ) ( ON_BOARD ?auto_30089 ?auto_30088 ) ( POWER_ON ?auto_30089 ) ( not ( = ?auto_30090 ?auto_30089 ) ) ( SUPPORTS ?auto_30089 ?auto_30085 ) ( not ( = ?auto_30083 ?auto_30085 ) ) ( not ( = ?auto_30082 ?auto_30085 ) ) ( POINTING ?auto_30088 ?auto_30087 ) ( CALIBRATION_TARGET ?auto_30089 ?auto_30087 ) ( NOT_CALIBRATED ?auto_30089 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30084 ?auto_30083 ?auto_30081 ?auto_30082 )
      ( GET-3IMAGE-VERIFY ?auto_30081 ?auto_30082 ?auto_30084 ?auto_30083 ?auto_30086 ?auto_30085 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30103 - DIRECTION
      ?auto_30104 - MODE
      ?auto_30106 - DIRECTION
      ?auto_30105 - MODE
      ?auto_30108 - DIRECTION
      ?auto_30107 - MODE
    )
    :vars
    (
      ?auto_30112 - INSTRUMENT
      ?auto_30110 - SATELLITE
      ?auto_30109 - DIRECTION
      ?auto_30111 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30106 ?auto_30103 ) ) ( not ( = ?auto_30108 ?auto_30103 ) ) ( not ( = ?auto_30108 ?auto_30106 ) ) ( ON_BOARD ?auto_30112 ?auto_30110 ) ( SUPPORTS ?auto_30112 ?auto_30104 ) ( not ( = ?auto_30103 ?auto_30109 ) ) ( HAVE_IMAGE ?auto_30108 ?auto_30107 ) ( not ( = ?auto_30108 ?auto_30109 ) ) ( not ( = ?auto_30107 ?auto_30104 ) ) ( CALIBRATION_TARGET ?auto_30112 ?auto_30109 ) ( not ( = ?auto_30109 ?auto_30106 ) ) ( ON_BOARD ?auto_30111 ?auto_30110 ) ( POWER_ON ?auto_30111 ) ( not ( = ?auto_30112 ?auto_30111 ) ) ( SUPPORTS ?auto_30111 ?auto_30105 ) ( not ( = ?auto_30107 ?auto_30105 ) ) ( not ( = ?auto_30104 ?auto_30105 ) ) ( POINTING ?auto_30110 ?auto_30109 ) ( CALIBRATION_TARGET ?auto_30111 ?auto_30109 ) ( NOT_CALIBRATED ?auto_30111 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30108 ?auto_30107 ?auto_30103 ?auto_30104 )
      ( GET-3IMAGE-VERIFY ?auto_30103 ?auto_30104 ?auto_30106 ?auto_30105 ?auto_30108 ?auto_30107 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_30175 - DIRECTION
      ?auto_30176 - MODE
    )
    :vars
    (
      ?auto_30180 - DIRECTION
      ?auto_30183 - INSTRUMENT
      ?auto_30178 - SATELLITE
      ?auto_30177 - DIRECTION
      ?auto_30179 - MODE
      ?auto_30181 - DIRECTION
      ?auto_30182 - INSTRUMENT
      ?auto_30184 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_30175 ?auto_30180 ) ) ( ON_BOARD ?auto_30183 ?auto_30178 ) ( SUPPORTS ?auto_30183 ?auto_30176 ) ( not ( = ?auto_30175 ?auto_30177 ) ) ( HAVE_IMAGE ?auto_30180 ?auto_30179 ) ( not ( = ?auto_30180 ?auto_30177 ) ) ( not ( = ?auto_30179 ?auto_30176 ) ) ( CALIBRATION_TARGET ?auto_30183 ?auto_30177 ) ( not ( = ?auto_30177 ?auto_30181 ) ) ( not ( = ?auto_30175 ?auto_30181 ) ) ( not ( = ?auto_30180 ?auto_30181 ) ) ( ON_BOARD ?auto_30182 ?auto_30178 ) ( not ( = ?auto_30183 ?auto_30182 ) ) ( SUPPORTS ?auto_30182 ?auto_30184 ) ( not ( = ?auto_30179 ?auto_30184 ) ) ( not ( = ?auto_30176 ?auto_30184 ) ) ( POINTING ?auto_30178 ?auto_30177 ) ( CALIBRATION_TARGET ?auto_30182 ?auto_30177 ) ( POWER_AVAIL ?auto_30178 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_30182 ?auto_30178 )
      ( GET-2IMAGE ?auto_30180 ?auto_30179 ?auto_30175 ?auto_30176 )
      ( GET-1IMAGE-VERIFY ?auto_30175 ?auto_30176 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30185 - DIRECTION
      ?auto_30186 - MODE
      ?auto_30188 - DIRECTION
      ?auto_30187 - MODE
    )
    :vars
    (
      ?auto_30194 - INSTRUMENT
      ?auto_30192 - SATELLITE
      ?auto_30191 - DIRECTION
      ?auto_30189 - DIRECTION
      ?auto_30190 - INSTRUMENT
      ?auto_30193 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_30188 ?auto_30185 ) ) ( ON_BOARD ?auto_30194 ?auto_30192 ) ( SUPPORTS ?auto_30194 ?auto_30187 ) ( not ( = ?auto_30188 ?auto_30191 ) ) ( HAVE_IMAGE ?auto_30185 ?auto_30186 ) ( not ( = ?auto_30185 ?auto_30191 ) ) ( not ( = ?auto_30186 ?auto_30187 ) ) ( CALIBRATION_TARGET ?auto_30194 ?auto_30191 ) ( not ( = ?auto_30191 ?auto_30189 ) ) ( not ( = ?auto_30188 ?auto_30189 ) ) ( not ( = ?auto_30185 ?auto_30189 ) ) ( ON_BOARD ?auto_30190 ?auto_30192 ) ( not ( = ?auto_30194 ?auto_30190 ) ) ( SUPPORTS ?auto_30190 ?auto_30193 ) ( not ( = ?auto_30186 ?auto_30193 ) ) ( not ( = ?auto_30187 ?auto_30193 ) ) ( POINTING ?auto_30192 ?auto_30191 ) ( CALIBRATION_TARGET ?auto_30190 ?auto_30191 ) ( POWER_AVAIL ?auto_30192 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_30188 ?auto_30187 )
      ( GET-2IMAGE-VERIFY ?auto_30185 ?auto_30186 ?auto_30188 ?auto_30187 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30195 - DIRECTION
      ?auto_30196 - MODE
      ?auto_30198 - DIRECTION
      ?auto_30197 - MODE
    )
    :vars
    (
      ?auto_30204 - DIRECTION
      ?auto_30199 - INSTRUMENT
      ?auto_30202 - SATELLITE
      ?auto_30201 - DIRECTION
      ?auto_30203 - MODE
      ?auto_30200 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30198 ?auto_30195 ) ) ( not ( = ?auto_30198 ?auto_30204 ) ) ( ON_BOARD ?auto_30199 ?auto_30202 ) ( SUPPORTS ?auto_30199 ?auto_30197 ) ( not ( = ?auto_30198 ?auto_30201 ) ) ( HAVE_IMAGE ?auto_30204 ?auto_30203 ) ( not ( = ?auto_30204 ?auto_30201 ) ) ( not ( = ?auto_30203 ?auto_30197 ) ) ( CALIBRATION_TARGET ?auto_30199 ?auto_30201 ) ( not ( = ?auto_30201 ?auto_30195 ) ) ( not ( = ?auto_30204 ?auto_30195 ) ) ( ON_BOARD ?auto_30200 ?auto_30202 ) ( not ( = ?auto_30199 ?auto_30200 ) ) ( SUPPORTS ?auto_30200 ?auto_30196 ) ( not ( = ?auto_30203 ?auto_30196 ) ) ( not ( = ?auto_30197 ?auto_30196 ) ) ( POINTING ?auto_30202 ?auto_30201 ) ( CALIBRATION_TARGET ?auto_30200 ?auto_30201 ) ( POWER_AVAIL ?auto_30202 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30204 ?auto_30203 ?auto_30198 ?auto_30197 )
      ( GET-2IMAGE-VERIFY ?auto_30195 ?auto_30196 ?auto_30198 ?auto_30197 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30205 - DIRECTION
      ?auto_30206 - MODE
      ?auto_30208 - DIRECTION
      ?auto_30207 - MODE
    )
    :vars
    (
      ?auto_30209 - INSTRUMENT
      ?auto_30214 - SATELLITE
      ?auto_30212 - DIRECTION
      ?auto_30213 - DIRECTION
      ?auto_30211 - INSTRUMENT
      ?auto_30210 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_30208 ?auto_30205 ) ) ( ON_BOARD ?auto_30209 ?auto_30214 ) ( SUPPORTS ?auto_30209 ?auto_30206 ) ( not ( = ?auto_30205 ?auto_30212 ) ) ( HAVE_IMAGE ?auto_30208 ?auto_30207 ) ( not ( = ?auto_30208 ?auto_30212 ) ) ( not ( = ?auto_30207 ?auto_30206 ) ) ( CALIBRATION_TARGET ?auto_30209 ?auto_30212 ) ( not ( = ?auto_30212 ?auto_30213 ) ) ( not ( = ?auto_30205 ?auto_30213 ) ) ( not ( = ?auto_30208 ?auto_30213 ) ) ( ON_BOARD ?auto_30211 ?auto_30214 ) ( not ( = ?auto_30209 ?auto_30211 ) ) ( SUPPORTS ?auto_30211 ?auto_30210 ) ( not ( = ?auto_30207 ?auto_30210 ) ) ( not ( = ?auto_30206 ?auto_30210 ) ) ( POINTING ?auto_30214 ?auto_30212 ) ( CALIBRATION_TARGET ?auto_30211 ?auto_30212 ) ( POWER_AVAIL ?auto_30214 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30208 ?auto_30207 ?auto_30205 ?auto_30206 )
      ( GET-2IMAGE-VERIFY ?auto_30205 ?auto_30206 ?auto_30208 ?auto_30207 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30215 - DIRECTION
      ?auto_30216 - MODE
      ?auto_30218 - DIRECTION
      ?auto_30217 - MODE
    )
    :vars
    (
      ?auto_30224 - DIRECTION
      ?auto_30219 - INSTRUMENT
      ?auto_30222 - SATELLITE
      ?auto_30221 - DIRECTION
      ?auto_30223 - MODE
      ?auto_30220 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30218 ?auto_30215 ) ) ( not ( = ?auto_30215 ?auto_30224 ) ) ( ON_BOARD ?auto_30219 ?auto_30222 ) ( SUPPORTS ?auto_30219 ?auto_30216 ) ( not ( = ?auto_30215 ?auto_30221 ) ) ( HAVE_IMAGE ?auto_30224 ?auto_30223 ) ( not ( = ?auto_30224 ?auto_30221 ) ) ( not ( = ?auto_30223 ?auto_30216 ) ) ( CALIBRATION_TARGET ?auto_30219 ?auto_30221 ) ( not ( = ?auto_30221 ?auto_30218 ) ) ( not ( = ?auto_30224 ?auto_30218 ) ) ( ON_BOARD ?auto_30220 ?auto_30222 ) ( not ( = ?auto_30219 ?auto_30220 ) ) ( SUPPORTS ?auto_30220 ?auto_30217 ) ( not ( = ?auto_30223 ?auto_30217 ) ) ( not ( = ?auto_30216 ?auto_30217 ) ) ( POINTING ?auto_30222 ?auto_30221 ) ( CALIBRATION_TARGET ?auto_30220 ?auto_30221 ) ( POWER_AVAIL ?auto_30222 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30224 ?auto_30223 ?auto_30215 ?auto_30216 )
      ( GET-2IMAGE-VERIFY ?auto_30215 ?auto_30216 ?auto_30218 ?auto_30217 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30249 - DIRECTION
      ?auto_30250 - MODE
      ?auto_30252 - DIRECTION
      ?auto_30251 - MODE
      ?auto_30254 - DIRECTION
      ?auto_30253 - MODE
    )
    :vars
    (
      ?auto_30255 - INSTRUMENT
      ?auto_30258 - SATELLITE
      ?auto_30257 - DIRECTION
      ?auto_30256 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30252 ?auto_30249 ) ) ( not ( = ?auto_30254 ?auto_30249 ) ) ( not ( = ?auto_30254 ?auto_30252 ) ) ( ON_BOARD ?auto_30255 ?auto_30258 ) ( SUPPORTS ?auto_30255 ?auto_30253 ) ( not ( = ?auto_30254 ?auto_30257 ) ) ( HAVE_IMAGE ?auto_30249 ?auto_30250 ) ( not ( = ?auto_30249 ?auto_30257 ) ) ( not ( = ?auto_30250 ?auto_30253 ) ) ( CALIBRATION_TARGET ?auto_30255 ?auto_30257 ) ( not ( = ?auto_30257 ?auto_30252 ) ) ( ON_BOARD ?auto_30256 ?auto_30258 ) ( not ( = ?auto_30255 ?auto_30256 ) ) ( SUPPORTS ?auto_30256 ?auto_30251 ) ( not ( = ?auto_30250 ?auto_30251 ) ) ( not ( = ?auto_30253 ?auto_30251 ) ) ( POINTING ?auto_30258 ?auto_30257 ) ( CALIBRATION_TARGET ?auto_30256 ?auto_30257 ) ( POWER_AVAIL ?auto_30258 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30249 ?auto_30250 ?auto_30254 ?auto_30253 )
      ( GET-3IMAGE-VERIFY ?auto_30249 ?auto_30250 ?auto_30252 ?auto_30251 ?auto_30254 ?auto_30253 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30271 - DIRECTION
      ?auto_30272 - MODE
      ?auto_30274 - DIRECTION
      ?auto_30273 - MODE
      ?auto_30276 - DIRECTION
      ?auto_30275 - MODE
    )
    :vars
    (
      ?auto_30277 - INSTRUMENT
      ?auto_30280 - SATELLITE
      ?auto_30279 - DIRECTION
      ?auto_30278 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30274 ?auto_30271 ) ) ( not ( = ?auto_30276 ?auto_30271 ) ) ( not ( = ?auto_30276 ?auto_30274 ) ) ( ON_BOARD ?auto_30277 ?auto_30280 ) ( SUPPORTS ?auto_30277 ?auto_30273 ) ( not ( = ?auto_30274 ?auto_30279 ) ) ( HAVE_IMAGE ?auto_30271 ?auto_30272 ) ( not ( = ?auto_30271 ?auto_30279 ) ) ( not ( = ?auto_30272 ?auto_30273 ) ) ( CALIBRATION_TARGET ?auto_30277 ?auto_30279 ) ( not ( = ?auto_30279 ?auto_30276 ) ) ( ON_BOARD ?auto_30278 ?auto_30280 ) ( not ( = ?auto_30277 ?auto_30278 ) ) ( SUPPORTS ?auto_30278 ?auto_30275 ) ( not ( = ?auto_30272 ?auto_30275 ) ) ( not ( = ?auto_30273 ?auto_30275 ) ) ( POINTING ?auto_30280 ?auto_30279 ) ( CALIBRATION_TARGET ?auto_30278 ?auto_30279 ) ( POWER_AVAIL ?auto_30280 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30271 ?auto_30272 ?auto_30274 ?auto_30273 )
      ( GET-3IMAGE-VERIFY ?auto_30271 ?auto_30272 ?auto_30274 ?auto_30273 ?auto_30276 ?auto_30275 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30293 - DIRECTION
      ?auto_30294 - MODE
      ?auto_30296 - DIRECTION
      ?auto_30295 - MODE
      ?auto_30298 - DIRECTION
      ?auto_30297 - MODE
    )
    :vars
    (
      ?auto_30299 - INSTRUMENT
      ?auto_30302 - SATELLITE
      ?auto_30301 - DIRECTION
      ?auto_30300 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30296 ?auto_30293 ) ) ( not ( = ?auto_30298 ?auto_30293 ) ) ( not ( = ?auto_30298 ?auto_30296 ) ) ( ON_BOARD ?auto_30299 ?auto_30302 ) ( SUPPORTS ?auto_30299 ?auto_30297 ) ( not ( = ?auto_30298 ?auto_30301 ) ) ( HAVE_IMAGE ?auto_30296 ?auto_30295 ) ( not ( = ?auto_30296 ?auto_30301 ) ) ( not ( = ?auto_30295 ?auto_30297 ) ) ( CALIBRATION_TARGET ?auto_30299 ?auto_30301 ) ( not ( = ?auto_30301 ?auto_30293 ) ) ( ON_BOARD ?auto_30300 ?auto_30302 ) ( not ( = ?auto_30299 ?auto_30300 ) ) ( SUPPORTS ?auto_30300 ?auto_30294 ) ( not ( = ?auto_30295 ?auto_30294 ) ) ( not ( = ?auto_30297 ?auto_30294 ) ) ( POINTING ?auto_30302 ?auto_30301 ) ( CALIBRATION_TARGET ?auto_30300 ?auto_30301 ) ( POWER_AVAIL ?auto_30302 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30296 ?auto_30295 ?auto_30298 ?auto_30297 )
      ( GET-3IMAGE-VERIFY ?auto_30293 ?auto_30294 ?auto_30296 ?auto_30295 ?auto_30298 ?auto_30297 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30315 - DIRECTION
      ?auto_30316 - MODE
      ?auto_30318 - DIRECTION
      ?auto_30317 - MODE
      ?auto_30320 - DIRECTION
      ?auto_30319 - MODE
    )
    :vars
    (
      ?auto_30321 - INSTRUMENT
      ?auto_30324 - SATELLITE
      ?auto_30323 - DIRECTION
      ?auto_30322 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30318 ?auto_30315 ) ) ( not ( = ?auto_30320 ?auto_30315 ) ) ( not ( = ?auto_30320 ?auto_30318 ) ) ( ON_BOARD ?auto_30321 ?auto_30324 ) ( SUPPORTS ?auto_30321 ?auto_30317 ) ( not ( = ?auto_30318 ?auto_30323 ) ) ( HAVE_IMAGE ?auto_30320 ?auto_30319 ) ( not ( = ?auto_30320 ?auto_30323 ) ) ( not ( = ?auto_30319 ?auto_30317 ) ) ( CALIBRATION_TARGET ?auto_30321 ?auto_30323 ) ( not ( = ?auto_30323 ?auto_30315 ) ) ( ON_BOARD ?auto_30322 ?auto_30324 ) ( not ( = ?auto_30321 ?auto_30322 ) ) ( SUPPORTS ?auto_30322 ?auto_30316 ) ( not ( = ?auto_30319 ?auto_30316 ) ) ( not ( = ?auto_30317 ?auto_30316 ) ) ( POINTING ?auto_30324 ?auto_30323 ) ( CALIBRATION_TARGET ?auto_30322 ?auto_30323 ) ( POWER_AVAIL ?auto_30324 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30320 ?auto_30319 ?auto_30318 ?auto_30317 )
      ( GET-3IMAGE-VERIFY ?auto_30315 ?auto_30316 ?auto_30318 ?auto_30317 ?auto_30320 ?auto_30319 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30361 - DIRECTION
      ?auto_30362 - MODE
      ?auto_30364 - DIRECTION
      ?auto_30363 - MODE
      ?auto_30366 - DIRECTION
      ?auto_30365 - MODE
    )
    :vars
    (
      ?auto_30367 - INSTRUMENT
      ?auto_30370 - SATELLITE
      ?auto_30369 - DIRECTION
      ?auto_30368 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30364 ?auto_30361 ) ) ( not ( = ?auto_30366 ?auto_30361 ) ) ( not ( = ?auto_30366 ?auto_30364 ) ) ( ON_BOARD ?auto_30367 ?auto_30370 ) ( SUPPORTS ?auto_30367 ?auto_30362 ) ( not ( = ?auto_30361 ?auto_30369 ) ) ( HAVE_IMAGE ?auto_30364 ?auto_30363 ) ( not ( = ?auto_30364 ?auto_30369 ) ) ( not ( = ?auto_30363 ?auto_30362 ) ) ( CALIBRATION_TARGET ?auto_30367 ?auto_30369 ) ( not ( = ?auto_30369 ?auto_30366 ) ) ( ON_BOARD ?auto_30368 ?auto_30370 ) ( not ( = ?auto_30367 ?auto_30368 ) ) ( SUPPORTS ?auto_30368 ?auto_30365 ) ( not ( = ?auto_30363 ?auto_30365 ) ) ( not ( = ?auto_30362 ?auto_30365 ) ) ( POINTING ?auto_30370 ?auto_30369 ) ( CALIBRATION_TARGET ?auto_30368 ?auto_30369 ) ( POWER_AVAIL ?auto_30370 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30364 ?auto_30363 ?auto_30361 ?auto_30362 )
      ( GET-3IMAGE-VERIFY ?auto_30361 ?auto_30362 ?auto_30364 ?auto_30363 ?auto_30366 ?auto_30365 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30383 - DIRECTION
      ?auto_30384 - MODE
      ?auto_30386 - DIRECTION
      ?auto_30385 - MODE
      ?auto_30388 - DIRECTION
      ?auto_30387 - MODE
    )
    :vars
    (
      ?auto_30389 - INSTRUMENT
      ?auto_30392 - SATELLITE
      ?auto_30391 - DIRECTION
      ?auto_30390 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30386 ?auto_30383 ) ) ( not ( = ?auto_30388 ?auto_30383 ) ) ( not ( = ?auto_30388 ?auto_30386 ) ) ( ON_BOARD ?auto_30389 ?auto_30392 ) ( SUPPORTS ?auto_30389 ?auto_30384 ) ( not ( = ?auto_30383 ?auto_30391 ) ) ( HAVE_IMAGE ?auto_30388 ?auto_30387 ) ( not ( = ?auto_30388 ?auto_30391 ) ) ( not ( = ?auto_30387 ?auto_30384 ) ) ( CALIBRATION_TARGET ?auto_30389 ?auto_30391 ) ( not ( = ?auto_30391 ?auto_30386 ) ) ( ON_BOARD ?auto_30390 ?auto_30392 ) ( not ( = ?auto_30389 ?auto_30390 ) ) ( SUPPORTS ?auto_30390 ?auto_30385 ) ( not ( = ?auto_30387 ?auto_30385 ) ) ( not ( = ?auto_30384 ?auto_30385 ) ) ( POINTING ?auto_30392 ?auto_30391 ) ( CALIBRATION_TARGET ?auto_30390 ?auto_30391 ) ( POWER_AVAIL ?auto_30392 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30388 ?auto_30387 ?auto_30383 ?auto_30384 )
      ( GET-3IMAGE-VERIFY ?auto_30383 ?auto_30384 ?auto_30386 ?auto_30385 ?auto_30388 ?auto_30387 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_30455 - DIRECTION
      ?auto_30456 - MODE
    )
    :vars
    (
      ?auto_30464 - DIRECTION
      ?auto_30457 - INSTRUMENT
      ?auto_30462 - SATELLITE
      ?auto_30460 - DIRECTION
      ?auto_30463 - MODE
      ?auto_30461 - DIRECTION
      ?auto_30459 - INSTRUMENT
      ?auto_30458 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_30455 ?auto_30464 ) ) ( ON_BOARD ?auto_30457 ?auto_30462 ) ( SUPPORTS ?auto_30457 ?auto_30456 ) ( not ( = ?auto_30455 ?auto_30460 ) ) ( HAVE_IMAGE ?auto_30464 ?auto_30463 ) ( not ( = ?auto_30464 ?auto_30460 ) ) ( not ( = ?auto_30463 ?auto_30456 ) ) ( CALIBRATION_TARGET ?auto_30457 ?auto_30460 ) ( not ( = ?auto_30460 ?auto_30461 ) ) ( not ( = ?auto_30455 ?auto_30461 ) ) ( not ( = ?auto_30464 ?auto_30461 ) ) ( ON_BOARD ?auto_30459 ?auto_30462 ) ( not ( = ?auto_30457 ?auto_30459 ) ) ( SUPPORTS ?auto_30459 ?auto_30458 ) ( not ( = ?auto_30463 ?auto_30458 ) ) ( not ( = ?auto_30456 ?auto_30458 ) ) ( CALIBRATION_TARGET ?auto_30459 ?auto_30460 ) ( POWER_AVAIL ?auto_30462 ) ( POINTING ?auto_30462 ?auto_30464 ) )
    :subtasks
    ( ( !TURN_TO ?auto_30462 ?auto_30460 ?auto_30464 )
      ( GET-2IMAGE ?auto_30464 ?auto_30463 ?auto_30455 ?auto_30456 )
      ( GET-1IMAGE-VERIFY ?auto_30455 ?auto_30456 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30465 - DIRECTION
      ?auto_30466 - MODE
      ?auto_30468 - DIRECTION
      ?auto_30467 - MODE
    )
    :vars
    (
      ?auto_30469 - INSTRUMENT
      ?auto_30472 - SATELLITE
      ?auto_30473 - DIRECTION
      ?auto_30471 - DIRECTION
      ?auto_30474 - INSTRUMENT
      ?auto_30470 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_30468 ?auto_30465 ) ) ( ON_BOARD ?auto_30469 ?auto_30472 ) ( SUPPORTS ?auto_30469 ?auto_30467 ) ( not ( = ?auto_30468 ?auto_30473 ) ) ( HAVE_IMAGE ?auto_30465 ?auto_30466 ) ( not ( = ?auto_30465 ?auto_30473 ) ) ( not ( = ?auto_30466 ?auto_30467 ) ) ( CALIBRATION_TARGET ?auto_30469 ?auto_30473 ) ( not ( = ?auto_30473 ?auto_30471 ) ) ( not ( = ?auto_30468 ?auto_30471 ) ) ( not ( = ?auto_30465 ?auto_30471 ) ) ( ON_BOARD ?auto_30474 ?auto_30472 ) ( not ( = ?auto_30469 ?auto_30474 ) ) ( SUPPORTS ?auto_30474 ?auto_30470 ) ( not ( = ?auto_30466 ?auto_30470 ) ) ( not ( = ?auto_30467 ?auto_30470 ) ) ( CALIBRATION_TARGET ?auto_30474 ?auto_30473 ) ( POWER_AVAIL ?auto_30472 ) ( POINTING ?auto_30472 ?auto_30465 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_30468 ?auto_30467 )
      ( GET-2IMAGE-VERIFY ?auto_30465 ?auto_30466 ?auto_30468 ?auto_30467 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30475 - DIRECTION
      ?auto_30476 - MODE
      ?auto_30478 - DIRECTION
      ?auto_30477 - MODE
    )
    :vars
    (
      ?auto_30482 - DIRECTION
      ?auto_30483 - INSTRUMENT
      ?auto_30480 - SATELLITE
      ?auto_30479 - DIRECTION
      ?auto_30481 - MODE
      ?auto_30484 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30478 ?auto_30475 ) ) ( not ( = ?auto_30478 ?auto_30482 ) ) ( ON_BOARD ?auto_30483 ?auto_30480 ) ( SUPPORTS ?auto_30483 ?auto_30477 ) ( not ( = ?auto_30478 ?auto_30479 ) ) ( HAVE_IMAGE ?auto_30482 ?auto_30481 ) ( not ( = ?auto_30482 ?auto_30479 ) ) ( not ( = ?auto_30481 ?auto_30477 ) ) ( CALIBRATION_TARGET ?auto_30483 ?auto_30479 ) ( not ( = ?auto_30479 ?auto_30475 ) ) ( not ( = ?auto_30482 ?auto_30475 ) ) ( ON_BOARD ?auto_30484 ?auto_30480 ) ( not ( = ?auto_30483 ?auto_30484 ) ) ( SUPPORTS ?auto_30484 ?auto_30476 ) ( not ( = ?auto_30481 ?auto_30476 ) ) ( not ( = ?auto_30477 ?auto_30476 ) ) ( CALIBRATION_TARGET ?auto_30484 ?auto_30479 ) ( POWER_AVAIL ?auto_30480 ) ( POINTING ?auto_30480 ?auto_30482 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30482 ?auto_30481 ?auto_30478 ?auto_30477 )
      ( GET-2IMAGE-VERIFY ?auto_30475 ?auto_30476 ?auto_30478 ?auto_30477 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30485 - DIRECTION
      ?auto_30486 - MODE
      ?auto_30488 - DIRECTION
      ?auto_30487 - MODE
    )
    :vars
    (
      ?auto_30493 - INSTRUMENT
      ?auto_30491 - SATELLITE
      ?auto_30490 - DIRECTION
      ?auto_30489 - DIRECTION
      ?auto_30494 - INSTRUMENT
      ?auto_30492 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_30488 ?auto_30485 ) ) ( ON_BOARD ?auto_30493 ?auto_30491 ) ( SUPPORTS ?auto_30493 ?auto_30486 ) ( not ( = ?auto_30485 ?auto_30490 ) ) ( HAVE_IMAGE ?auto_30488 ?auto_30487 ) ( not ( = ?auto_30488 ?auto_30490 ) ) ( not ( = ?auto_30487 ?auto_30486 ) ) ( CALIBRATION_TARGET ?auto_30493 ?auto_30490 ) ( not ( = ?auto_30490 ?auto_30489 ) ) ( not ( = ?auto_30485 ?auto_30489 ) ) ( not ( = ?auto_30488 ?auto_30489 ) ) ( ON_BOARD ?auto_30494 ?auto_30491 ) ( not ( = ?auto_30493 ?auto_30494 ) ) ( SUPPORTS ?auto_30494 ?auto_30492 ) ( not ( = ?auto_30487 ?auto_30492 ) ) ( not ( = ?auto_30486 ?auto_30492 ) ) ( CALIBRATION_TARGET ?auto_30494 ?auto_30490 ) ( POWER_AVAIL ?auto_30491 ) ( POINTING ?auto_30491 ?auto_30488 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30488 ?auto_30487 ?auto_30485 ?auto_30486 )
      ( GET-2IMAGE-VERIFY ?auto_30485 ?auto_30486 ?auto_30488 ?auto_30487 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30495 - DIRECTION
      ?auto_30496 - MODE
      ?auto_30498 - DIRECTION
      ?auto_30497 - MODE
    )
    :vars
    (
      ?auto_30502 - DIRECTION
      ?auto_30503 - INSTRUMENT
      ?auto_30500 - SATELLITE
      ?auto_30499 - DIRECTION
      ?auto_30501 - MODE
      ?auto_30504 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30498 ?auto_30495 ) ) ( not ( = ?auto_30495 ?auto_30502 ) ) ( ON_BOARD ?auto_30503 ?auto_30500 ) ( SUPPORTS ?auto_30503 ?auto_30496 ) ( not ( = ?auto_30495 ?auto_30499 ) ) ( HAVE_IMAGE ?auto_30502 ?auto_30501 ) ( not ( = ?auto_30502 ?auto_30499 ) ) ( not ( = ?auto_30501 ?auto_30496 ) ) ( CALIBRATION_TARGET ?auto_30503 ?auto_30499 ) ( not ( = ?auto_30499 ?auto_30498 ) ) ( not ( = ?auto_30502 ?auto_30498 ) ) ( ON_BOARD ?auto_30504 ?auto_30500 ) ( not ( = ?auto_30503 ?auto_30504 ) ) ( SUPPORTS ?auto_30504 ?auto_30497 ) ( not ( = ?auto_30501 ?auto_30497 ) ) ( not ( = ?auto_30496 ?auto_30497 ) ) ( CALIBRATION_TARGET ?auto_30504 ?auto_30499 ) ( POWER_AVAIL ?auto_30500 ) ( POINTING ?auto_30500 ?auto_30502 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30502 ?auto_30501 ?auto_30495 ?auto_30496 )
      ( GET-2IMAGE-VERIFY ?auto_30495 ?auto_30496 ?auto_30498 ?auto_30497 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30529 - DIRECTION
      ?auto_30530 - MODE
      ?auto_30532 - DIRECTION
      ?auto_30531 - MODE
      ?auto_30534 - DIRECTION
      ?auto_30533 - MODE
    )
    :vars
    (
      ?auto_30537 - INSTRUMENT
      ?auto_30536 - SATELLITE
      ?auto_30535 - DIRECTION
      ?auto_30538 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30532 ?auto_30529 ) ) ( not ( = ?auto_30534 ?auto_30529 ) ) ( not ( = ?auto_30534 ?auto_30532 ) ) ( ON_BOARD ?auto_30537 ?auto_30536 ) ( SUPPORTS ?auto_30537 ?auto_30533 ) ( not ( = ?auto_30534 ?auto_30535 ) ) ( HAVE_IMAGE ?auto_30529 ?auto_30530 ) ( not ( = ?auto_30529 ?auto_30535 ) ) ( not ( = ?auto_30530 ?auto_30533 ) ) ( CALIBRATION_TARGET ?auto_30537 ?auto_30535 ) ( not ( = ?auto_30535 ?auto_30532 ) ) ( ON_BOARD ?auto_30538 ?auto_30536 ) ( not ( = ?auto_30537 ?auto_30538 ) ) ( SUPPORTS ?auto_30538 ?auto_30531 ) ( not ( = ?auto_30530 ?auto_30531 ) ) ( not ( = ?auto_30533 ?auto_30531 ) ) ( CALIBRATION_TARGET ?auto_30538 ?auto_30535 ) ( POWER_AVAIL ?auto_30536 ) ( POINTING ?auto_30536 ?auto_30529 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30529 ?auto_30530 ?auto_30534 ?auto_30533 )
      ( GET-3IMAGE-VERIFY ?auto_30529 ?auto_30530 ?auto_30532 ?auto_30531 ?auto_30534 ?auto_30533 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30551 - DIRECTION
      ?auto_30552 - MODE
      ?auto_30554 - DIRECTION
      ?auto_30553 - MODE
      ?auto_30556 - DIRECTION
      ?auto_30555 - MODE
    )
    :vars
    (
      ?auto_30559 - INSTRUMENT
      ?auto_30558 - SATELLITE
      ?auto_30557 - DIRECTION
      ?auto_30560 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30554 ?auto_30551 ) ) ( not ( = ?auto_30556 ?auto_30551 ) ) ( not ( = ?auto_30556 ?auto_30554 ) ) ( ON_BOARD ?auto_30559 ?auto_30558 ) ( SUPPORTS ?auto_30559 ?auto_30553 ) ( not ( = ?auto_30554 ?auto_30557 ) ) ( HAVE_IMAGE ?auto_30551 ?auto_30552 ) ( not ( = ?auto_30551 ?auto_30557 ) ) ( not ( = ?auto_30552 ?auto_30553 ) ) ( CALIBRATION_TARGET ?auto_30559 ?auto_30557 ) ( not ( = ?auto_30557 ?auto_30556 ) ) ( ON_BOARD ?auto_30560 ?auto_30558 ) ( not ( = ?auto_30559 ?auto_30560 ) ) ( SUPPORTS ?auto_30560 ?auto_30555 ) ( not ( = ?auto_30552 ?auto_30555 ) ) ( not ( = ?auto_30553 ?auto_30555 ) ) ( CALIBRATION_TARGET ?auto_30560 ?auto_30557 ) ( POWER_AVAIL ?auto_30558 ) ( POINTING ?auto_30558 ?auto_30551 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30551 ?auto_30552 ?auto_30554 ?auto_30553 )
      ( GET-3IMAGE-VERIFY ?auto_30551 ?auto_30552 ?auto_30554 ?auto_30553 ?auto_30556 ?auto_30555 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30573 - DIRECTION
      ?auto_30574 - MODE
      ?auto_30576 - DIRECTION
      ?auto_30575 - MODE
      ?auto_30578 - DIRECTION
      ?auto_30577 - MODE
    )
    :vars
    (
      ?auto_30581 - INSTRUMENT
      ?auto_30580 - SATELLITE
      ?auto_30579 - DIRECTION
      ?auto_30582 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30576 ?auto_30573 ) ) ( not ( = ?auto_30578 ?auto_30573 ) ) ( not ( = ?auto_30578 ?auto_30576 ) ) ( ON_BOARD ?auto_30581 ?auto_30580 ) ( SUPPORTS ?auto_30581 ?auto_30577 ) ( not ( = ?auto_30578 ?auto_30579 ) ) ( HAVE_IMAGE ?auto_30576 ?auto_30575 ) ( not ( = ?auto_30576 ?auto_30579 ) ) ( not ( = ?auto_30575 ?auto_30577 ) ) ( CALIBRATION_TARGET ?auto_30581 ?auto_30579 ) ( not ( = ?auto_30579 ?auto_30573 ) ) ( ON_BOARD ?auto_30582 ?auto_30580 ) ( not ( = ?auto_30581 ?auto_30582 ) ) ( SUPPORTS ?auto_30582 ?auto_30574 ) ( not ( = ?auto_30575 ?auto_30574 ) ) ( not ( = ?auto_30577 ?auto_30574 ) ) ( CALIBRATION_TARGET ?auto_30582 ?auto_30579 ) ( POWER_AVAIL ?auto_30580 ) ( POINTING ?auto_30580 ?auto_30576 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30576 ?auto_30575 ?auto_30578 ?auto_30577 )
      ( GET-3IMAGE-VERIFY ?auto_30573 ?auto_30574 ?auto_30576 ?auto_30575 ?auto_30578 ?auto_30577 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30595 - DIRECTION
      ?auto_30596 - MODE
      ?auto_30598 - DIRECTION
      ?auto_30597 - MODE
      ?auto_30600 - DIRECTION
      ?auto_30599 - MODE
    )
    :vars
    (
      ?auto_30603 - INSTRUMENT
      ?auto_30602 - SATELLITE
      ?auto_30601 - DIRECTION
      ?auto_30604 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30598 ?auto_30595 ) ) ( not ( = ?auto_30600 ?auto_30595 ) ) ( not ( = ?auto_30600 ?auto_30598 ) ) ( ON_BOARD ?auto_30603 ?auto_30602 ) ( SUPPORTS ?auto_30603 ?auto_30597 ) ( not ( = ?auto_30598 ?auto_30601 ) ) ( HAVE_IMAGE ?auto_30600 ?auto_30599 ) ( not ( = ?auto_30600 ?auto_30601 ) ) ( not ( = ?auto_30599 ?auto_30597 ) ) ( CALIBRATION_TARGET ?auto_30603 ?auto_30601 ) ( not ( = ?auto_30601 ?auto_30595 ) ) ( ON_BOARD ?auto_30604 ?auto_30602 ) ( not ( = ?auto_30603 ?auto_30604 ) ) ( SUPPORTS ?auto_30604 ?auto_30596 ) ( not ( = ?auto_30599 ?auto_30596 ) ) ( not ( = ?auto_30597 ?auto_30596 ) ) ( CALIBRATION_TARGET ?auto_30604 ?auto_30601 ) ( POWER_AVAIL ?auto_30602 ) ( POINTING ?auto_30602 ?auto_30600 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30600 ?auto_30599 ?auto_30598 ?auto_30597 )
      ( GET-3IMAGE-VERIFY ?auto_30595 ?auto_30596 ?auto_30598 ?auto_30597 ?auto_30600 ?auto_30599 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30641 - DIRECTION
      ?auto_30642 - MODE
      ?auto_30644 - DIRECTION
      ?auto_30643 - MODE
      ?auto_30646 - DIRECTION
      ?auto_30645 - MODE
    )
    :vars
    (
      ?auto_30649 - INSTRUMENT
      ?auto_30648 - SATELLITE
      ?auto_30647 - DIRECTION
      ?auto_30650 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30644 ?auto_30641 ) ) ( not ( = ?auto_30646 ?auto_30641 ) ) ( not ( = ?auto_30646 ?auto_30644 ) ) ( ON_BOARD ?auto_30649 ?auto_30648 ) ( SUPPORTS ?auto_30649 ?auto_30642 ) ( not ( = ?auto_30641 ?auto_30647 ) ) ( HAVE_IMAGE ?auto_30644 ?auto_30643 ) ( not ( = ?auto_30644 ?auto_30647 ) ) ( not ( = ?auto_30643 ?auto_30642 ) ) ( CALIBRATION_TARGET ?auto_30649 ?auto_30647 ) ( not ( = ?auto_30647 ?auto_30646 ) ) ( ON_BOARD ?auto_30650 ?auto_30648 ) ( not ( = ?auto_30649 ?auto_30650 ) ) ( SUPPORTS ?auto_30650 ?auto_30645 ) ( not ( = ?auto_30643 ?auto_30645 ) ) ( not ( = ?auto_30642 ?auto_30645 ) ) ( CALIBRATION_TARGET ?auto_30650 ?auto_30647 ) ( POWER_AVAIL ?auto_30648 ) ( POINTING ?auto_30648 ?auto_30644 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30644 ?auto_30643 ?auto_30641 ?auto_30642 )
      ( GET-3IMAGE-VERIFY ?auto_30641 ?auto_30642 ?auto_30644 ?auto_30643 ?auto_30646 ?auto_30645 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30663 - DIRECTION
      ?auto_30664 - MODE
      ?auto_30666 - DIRECTION
      ?auto_30665 - MODE
      ?auto_30668 - DIRECTION
      ?auto_30667 - MODE
    )
    :vars
    (
      ?auto_30671 - INSTRUMENT
      ?auto_30670 - SATELLITE
      ?auto_30669 - DIRECTION
      ?auto_30672 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30666 ?auto_30663 ) ) ( not ( = ?auto_30668 ?auto_30663 ) ) ( not ( = ?auto_30668 ?auto_30666 ) ) ( ON_BOARD ?auto_30671 ?auto_30670 ) ( SUPPORTS ?auto_30671 ?auto_30664 ) ( not ( = ?auto_30663 ?auto_30669 ) ) ( HAVE_IMAGE ?auto_30668 ?auto_30667 ) ( not ( = ?auto_30668 ?auto_30669 ) ) ( not ( = ?auto_30667 ?auto_30664 ) ) ( CALIBRATION_TARGET ?auto_30671 ?auto_30669 ) ( not ( = ?auto_30669 ?auto_30666 ) ) ( ON_BOARD ?auto_30672 ?auto_30670 ) ( not ( = ?auto_30671 ?auto_30672 ) ) ( SUPPORTS ?auto_30672 ?auto_30665 ) ( not ( = ?auto_30667 ?auto_30665 ) ) ( not ( = ?auto_30664 ?auto_30665 ) ) ( CALIBRATION_TARGET ?auto_30672 ?auto_30669 ) ( POWER_AVAIL ?auto_30670 ) ( POINTING ?auto_30670 ?auto_30668 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30668 ?auto_30667 ?auto_30663 ?auto_30664 )
      ( GET-3IMAGE-VERIFY ?auto_30663 ?auto_30664 ?auto_30666 ?auto_30665 ?auto_30668 ?auto_30667 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_30735 - DIRECTION
      ?auto_30736 - MODE
    )
    :vars
    (
      ?auto_30741 - DIRECTION
      ?auto_30743 - INSTRUMENT
      ?auto_30739 - SATELLITE
      ?auto_30738 - DIRECTION
      ?auto_30740 - MODE
      ?auto_30737 - DIRECTION
      ?auto_30744 - INSTRUMENT
      ?auto_30742 - MODE
      ?auto_30745 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30735 ?auto_30741 ) ) ( ON_BOARD ?auto_30743 ?auto_30739 ) ( SUPPORTS ?auto_30743 ?auto_30736 ) ( not ( = ?auto_30735 ?auto_30738 ) ) ( HAVE_IMAGE ?auto_30741 ?auto_30740 ) ( not ( = ?auto_30741 ?auto_30738 ) ) ( not ( = ?auto_30740 ?auto_30736 ) ) ( CALIBRATION_TARGET ?auto_30743 ?auto_30738 ) ( not ( = ?auto_30738 ?auto_30737 ) ) ( not ( = ?auto_30735 ?auto_30737 ) ) ( not ( = ?auto_30741 ?auto_30737 ) ) ( ON_BOARD ?auto_30744 ?auto_30739 ) ( not ( = ?auto_30743 ?auto_30744 ) ) ( SUPPORTS ?auto_30744 ?auto_30742 ) ( not ( = ?auto_30740 ?auto_30742 ) ) ( not ( = ?auto_30736 ?auto_30742 ) ) ( CALIBRATION_TARGET ?auto_30744 ?auto_30738 ) ( POINTING ?auto_30739 ?auto_30741 ) ( ON_BOARD ?auto_30745 ?auto_30739 ) ( POWER_ON ?auto_30745 ) ( not ( = ?auto_30743 ?auto_30745 ) ) ( not ( = ?auto_30744 ?auto_30745 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_30745 ?auto_30739 )
      ( GET-2IMAGE ?auto_30741 ?auto_30740 ?auto_30735 ?auto_30736 )
      ( GET-1IMAGE-VERIFY ?auto_30735 ?auto_30736 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30746 - DIRECTION
      ?auto_30747 - MODE
      ?auto_30749 - DIRECTION
      ?auto_30748 - MODE
    )
    :vars
    (
      ?auto_30754 - INSTRUMENT
      ?auto_30751 - SATELLITE
      ?auto_30750 - DIRECTION
      ?auto_30753 - DIRECTION
      ?auto_30752 - INSTRUMENT
      ?auto_30755 - MODE
      ?auto_30756 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30749 ?auto_30746 ) ) ( ON_BOARD ?auto_30754 ?auto_30751 ) ( SUPPORTS ?auto_30754 ?auto_30748 ) ( not ( = ?auto_30749 ?auto_30750 ) ) ( HAVE_IMAGE ?auto_30746 ?auto_30747 ) ( not ( = ?auto_30746 ?auto_30750 ) ) ( not ( = ?auto_30747 ?auto_30748 ) ) ( CALIBRATION_TARGET ?auto_30754 ?auto_30750 ) ( not ( = ?auto_30750 ?auto_30753 ) ) ( not ( = ?auto_30749 ?auto_30753 ) ) ( not ( = ?auto_30746 ?auto_30753 ) ) ( ON_BOARD ?auto_30752 ?auto_30751 ) ( not ( = ?auto_30754 ?auto_30752 ) ) ( SUPPORTS ?auto_30752 ?auto_30755 ) ( not ( = ?auto_30747 ?auto_30755 ) ) ( not ( = ?auto_30748 ?auto_30755 ) ) ( CALIBRATION_TARGET ?auto_30752 ?auto_30750 ) ( POINTING ?auto_30751 ?auto_30746 ) ( ON_BOARD ?auto_30756 ?auto_30751 ) ( POWER_ON ?auto_30756 ) ( not ( = ?auto_30754 ?auto_30756 ) ) ( not ( = ?auto_30752 ?auto_30756 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_30749 ?auto_30748 )
      ( GET-2IMAGE-VERIFY ?auto_30746 ?auto_30747 ?auto_30749 ?auto_30748 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30757 - DIRECTION
      ?auto_30758 - MODE
      ?auto_30760 - DIRECTION
      ?auto_30759 - MODE
    )
    :vars
    (
      ?auto_30767 - DIRECTION
      ?auto_30763 - INSTRUMENT
      ?auto_30761 - SATELLITE
      ?auto_30764 - DIRECTION
      ?auto_30766 - MODE
      ?auto_30762 - INSTRUMENT
      ?auto_30765 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30760 ?auto_30757 ) ) ( not ( = ?auto_30760 ?auto_30767 ) ) ( ON_BOARD ?auto_30763 ?auto_30761 ) ( SUPPORTS ?auto_30763 ?auto_30759 ) ( not ( = ?auto_30760 ?auto_30764 ) ) ( HAVE_IMAGE ?auto_30767 ?auto_30766 ) ( not ( = ?auto_30767 ?auto_30764 ) ) ( not ( = ?auto_30766 ?auto_30759 ) ) ( CALIBRATION_TARGET ?auto_30763 ?auto_30764 ) ( not ( = ?auto_30764 ?auto_30757 ) ) ( not ( = ?auto_30767 ?auto_30757 ) ) ( ON_BOARD ?auto_30762 ?auto_30761 ) ( not ( = ?auto_30763 ?auto_30762 ) ) ( SUPPORTS ?auto_30762 ?auto_30758 ) ( not ( = ?auto_30766 ?auto_30758 ) ) ( not ( = ?auto_30759 ?auto_30758 ) ) ( CALIBRATION_TARGET ?auto_30762 ?auto_30764 ) ( POINTING ?auto_30761 ?auto_30767 ) ( ON_BOARD ?auto_30765 ?auto_30761 ) ( POWER_ON ?auto_30765 ) ( not ( = ?auto_30763 ?auto_30765 ) ) ( not ( = ?auto_30762 ?auto_30765 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30767 ?auto_30766 ?auto_30760 ?auto_30759 )
      ( GET-2IMAGE-VERIFY ?auto_30757 ?auto_30758 ?auto_30760 ?auto_30759 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30768 - DIRECTION
      ?auto_30769 - MODE
      ?auto_30771 - DIRECTION
      ?auto_30770 - MODE
    )
    :vars
    (
      ?auto_30774 - INSTRUMENT
      ?auto_30772 - SATELLITE
      ?auto_30776 - DIRECTION
      ?auto_30778 - DIRECTION
      ?auto_30773 - INSTRUMENT
      ?auto_30775 - MODE
      ?auto_30777 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30771 ?auto_30768 ) ) ( ON_BOARD ?auto_30774 ?auto_30772 ) ( SUPPORTS ?auto_30774 ?auto_30769 ) ( not ( = ?auto_30768 ?auto_30776 ) ) ( HAVE_IMAGE ?auto_30771 ?auto_30770 ) ( not ( = ?auto_30771 ?auto_30776 ) ) ( not ( = ?auto_30770 ?auto_30769 ) ) ( CALIBRATION_TARGET ?auto_30774 ?auto_30776 ) ( not ( = ?auto_30776 ?auto_30778 ) ) ( not ( = ?auto_30768 ?auto_30778 ) ) ( not ( = ?auto_30771 ?auto_30778 ) ) ( ON_BOARD ?auto_30773 ?auto_30772 ) ( not ( = ?auto_30774 ?auto_30773 ) ) ( SUPPORTS ?auto_30773 ?auto_30775 ) ( not ( = ?auto_30770 ?auto_30775 ) ) ( not ( = ?auto_30769 ?auto_30775 ) ) ( CALIBRATION_TARGET ?auto_30773 ?auto_30776 ) ( POINTING ?auto_30772 ?auto_30771 ) ( ON_BOARD ?auto_30777 ?auto_30772 ) ( POWER_ON ?auto_30777 ) ( not ( = ?auto_30774 ?auto_30777 ) ) ( not ( = ?auto_30773 ?auto_30777 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30771 ?auto_30770 ?auto_30768 ?auto_30769 )
      ( GET-2IMAGE-VERIFY ?auto_30768 ?auto_30769 ?auto_30771 ?auto_30770 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30779 - DIRECTION
      ?auto_30780 - MODE
      ?auto_30782 - DIRECTION
      ?auto_30781 - MODE
    )
    :vars
    (
      ?auto_30789 - DIRECTION
      ?auto_30785 - INSTRUMENT
      ?auto_30783 - SATELLITE
      ?auto_30786 - DIRECTION
      ?auto_30788 - MODE
      ?auto_30784 - INSTRUMENT
      ?auto_30787 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30782 ?auto_30779 ) ) ( not ( = ?auto_30779 ?auto_30789 ) ) ( ON_BOARD ?auto_30785 ?auto_30783 ) ( SUPPORTS ?auto_30785 ?auto_30780 ) ( not ( = ?auto_30779 ?auto_30786 ) ) ( HAVE_IMAGE ?auto_30789 ?auto_30788 ) ( not ( = ?auto_30789 ?auto_30786 ) ) ( not ( = ?auto_30788 ?auto_30780 ) ) ( CALIBRATION_TARGET ?auto_30785 ?auto_30786 ) ( not ( = ?auto_30786 ?auto_30782 ) ) ( not ( = ?auto_30789 ?auto_30782 ) ) ( ON_BOARD ?auto_30784 ?auto_30783 ) ( not ( = ?auto_30785 ?auto_30784 ) ) ( SUPPORTS ?auto_30784 ?auto_30781 ) ( not ( = ?auto_30788 ?auto_30781 ) ) ( not ( = ?auto_30780 ?auto_30781 ) ) ( CALIBRATION_TARGET ?auto_30784 ?auto_30786 ) ( POINTING ?auto_30783 ?auto_30789 ) ( ON_BOARD ?auto_30787 ?auto_30783 ) ( POWER_ON ?auto_30787 ) ( not ( = ?auto_30785 ?auto_30787 ) ) ( not ( = ?auto_30784 ?auto_30787 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30789 ?auto_30788 ?auto_30779 ?auto_30780 )
      ( GET-2IMAGE-VERIFY ?auto_30779 ?auto_30780 ?auto_30782 ?auto_30781 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30816 - DIRECTION
      ?auto_30817 - MODE
      ?auto_30819 - DIRECTION
      ?auto_30818 - MODE
      ?auto_30821 - DIRECTION
      ?auto_30820 - MODE
    )
    :vars
    (
      ?auto_30824 - INSTRUMENT
      ?auto_30822 - SATELLITE
      ?auto_30825 - DIRECTION
      ?auto_30823 - INSTRUMENT
      ?auto_30826 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30819 ?auto_30816 ) ) ( not ( = ?auto_30821 ?auto_30816 ) ) ( not ( = ?auto_30821 ?auto_30819 ) ) ( ON_BOARD ?auto_30824 ?auto_30822 ) ( SUPPORTS ?auto_30824 ?auto_30820 ) ( not ( = ?auto_30821 ?auto_30825 ) ) ( HAVE_IMAGE ?auto_30816 ?auto_30817 ) ( not ( = ?auto_30816 ?auto_30825 ) ) ( not ( = ?auto_30817 ?auto_30820 ) ) ( CALIBRATION_TARGET ?auto_30824 ?auto_30825 ) ( not ( = ?auto_30825 ?auto_30819 ) ) ( ON_BOARD ?auto_30823 ?auto_30822 ) ( not ( = ?auto_30824 ?auto_30823 ) ) ( SUPPORTS ?auto_30823 ?auto_30818 ) ( not ( = ?auto_30817 ?auto_30818 ) ) ( not ( = ?auto_30820 ?auto_30818 ) ) ( CALIBRATION_TARGET ?auto_30823 ?auto_30825 ) ( POINTING ?auto_30822 ?auto_30816 ) ( ON_BOARD ?auto_30826 ?auto_30822 ) ( POWER_ON ?auto_30826 ) ( not ( = ?auto_30824 ?auto_30826 ) ) ( not ( = ?auto_30823 ?auto_30826 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30816 ?auto_30817 ?auto_30821 ?auto_30820 )
      ( GET-3IMAGE-VERIFY ?auto_30816 ?auto_30817 ?auto_30819 ?auto_30818 ?auto_30821 ?auto_30820 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30840 - DIRECTION
      ?auto_30841 - MODE
      ?auto_30843 - DIRECTION
      ?auto_30842 - MODE
      ?auto_30845 - DIRECTION
      ?auto_30844 - MODE
    )
    :vars
    (
      ?auto_30848 - INSTRUMENT
      ?auto_30846 - SATELLITE
      ?auto_30849 - DIRECTION
      ?auto_30847 - INSTRUMENT
      ?auto_30850 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30843 ?auto_30840 ) ) ( not ( = ?auto_30845 ?auto_30840 ) ) ( not ( = ?auto_30845 ?auto_30843 ) ) ( ON_BOARD ?auto_30848 ?auto_30846 ) ( SUPPORTS ?auto_30848 ?auto_30842 ) ( not ( = ?auto_30843 ?auto_30849 ) ) ( HAVE_IMAGE ?auto_30840 ?auto_30841 ) ( not ( = ?auto_30840 ?auto_30849 ) ) ( not ( = ?auto_30841 ?auto_30842 ) ) ( CALIBRATION_TARGET ?auto_30848 ?auto_30849 ) ( not ( = ?auto_30849 ?auto_30845 ) ) ( ON_BOARD ?auto_30847 ?auto_30846 ) ( not ( = ?auto_30848 ?auto_30847 ) ) ( SUPPORTS ?auto_30847 ?auto_30844 ) ( not ( = ?auto_30841 ?auto_30844 ) ) ( not ( = ?auto_30842 ?auto_30844 ) ) ( CALIBRATION_TARGET ?auto_30847 ?auto_30849 ) ( POINTING ?auto_30846 ?auto_30840 ) ( ON_BOARD ?auto_30850 ?auto_30846 ) ( POWER_ON ?auto_30850 ) ( not ( = ?auto_30848 ?auto_30850 ) ) ( not ( = ?auto_30847 ?auto_30850 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30840 ?auto_30841 ?auto_30843 ?auto_30842 )
      ( GET-3IMAGE-VERIFY ?auto_30840 ?auto_30841 ?auto_30843 ?auto_30842 ?auto_30845 ?auto_30844 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30864 - DIRECTION
      ?auto_30865 - MODE
      ?auto_30867 - DIRECTION
      ?auto_30866 - MODE
      ?auto_30869 - DIRECTION
      ?auto_30868 - MODE
    )
    :vars
    (
      ?auto_30872 - INSTRUMENT
      ?auto_30870 - SATELLITE
      ?auto_30873 - DIRECTION
      ?auto_30871 - INSTRUMENT
      ?auto_30874 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30867 ?auto_30864 ) ) ( not ( = ?auto_30869 ?auto_30864 ) ) ( not ( = ?auto_30869 ?auto_30867 ) ) ( ON_BOARD ?auto_30872 ?auto_30870 ) ( SUPPORTS ?auto_30872 ?auto_30868 ) ( not ( = ?auto_30869 ?auto_30873 ) ) ( HAVE_IMAGE ?auto_30867 ?auto_30866 ) ( not ( = ?auto_30867 ?auto_30873 ) ) ( not ( = ?auto_30866 ?auto_30868 ) ) ( CALIBRATION_TARGET ?auto_30872 ?auto_30873 ) ( not ( = ?auto_30873 ?auto_30864 ) ) ( ON_BOARD ?auto_30871 ?auto_30870 ) ( not ( = ?auto_30872 ?auto_30871 ) ) ( SUPPORTS ?auto_30871 ?auto_30865 ) ( not ( = ?auto_30866 ?auto_30865 ) ) ( not ( = ?auto_30868 ?auto_30865 ) ) ( CALIBRATION_TARGET ?auto_30871 ?auto_30873 ) ( POINTING ?auto_30870 ?auto_30867 ) ( ON_BOARD ?auto_30874 ?auto_30870 ) ( POWER_ON ?auto_30874 ) ( not ( = ?auto_30872 ?auto_30874 ) ) ( not ( = ?auto_30871 ?auto_30874 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30867 ?auto_30866 ?auto_30869 ?auto_30868 )
      ( GET-3IMAGE-VERIFY ?auto_30864 ?auto_30865 ?auto_30867 ?auto_30866 ?auto_30869 ?auto_30868 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30888 - DIRECTION
      ?auto_30889 - MODE
      ?auto_30891 - DIRECTION
      ?auto_30890 - MODE
      ?auto_30893 - DIRECTION
      ?auto_30892 - MODE
    )
    :vars
    (
      ?auto_30896 - INSTRUMENT
      ?auto_30894 - SATELLITE
      ?auto_30897 - DIRECTION
      ?auto_30895 - INSTRUMENT
      ?auto_30898 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30891 ?auto_30888 ) ) ( not ( = ?auto_30893 ?auto_30888 ) ) ( not ( = ?auto_30893 ?auto_30891 ) ) ( ON_BOARD ?auto_30896 ?auto_30894 ) ( SUPPORTS ?auto_30896 ?auto_30890 ) ( not ( = ?auto_30891 ?auto_30897 ) ) ( HAVE_IMAGE ?auto_30893 ?auto_30892 ) ( not ( = ?auto_30893 ?auto_30897 ) ) ( not ( = ?auto_30892 ?auto_30890 ) ) ( CALIBRATION_TARGET ?auto_30896 ?auto_30897 ) ( not ( = ?auto_30897 ?auto_30888 ) ) ( ON_BOARD ?auto_30895 ?auto_30894 ) ( not ( = ?auto_30896 ?auto_30895 ) ) ( SUPPORTS ?auto_30895 ?auto_30889 ) ( not ( = ?auto_30892 ?auto_30889 ) ) ( not ( = ?auto_30890 ?auto_30889 ) ) ( CALIBRATION_TARGET ?auto_30895 ?auto_30897 ) ( POINTING ?auto_30894 ?auto_30893 ) ( ON_BOARD ?auto_30898 ?auto_30894 ) ( POWER_ON ?auto_30898 ) ( not ( = ?auto_30896 ?auto_30898 ) ) ( not ( = ?auto_30895 ?auto_30898 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30893 ?auto_30892 ?auto_30891 ?auto_30890 )
      ( GET-3IMAGE-VERIFY ?auto_30888 ?auto_30889 ?auto_30891 ?auto_30890 ?auto_30893 ?auto_30892 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30938 - DIRECTION
      ?auto_30939 - MODE
      ?auto_30941 - DIRECTION
      ?auto_30940 - MODE
      ?auto_30943 - DIRECTION
      ?auto_30942 - MODE
    )
    :vars
    (
      ?auto_30946 - INSTRUMENT
      ?auto_30944 - SATELLITE
      ?auto_30947 - DIRECTION
      ?auto_30945 - INSTRUMENT
      ?auto_30948 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30941 ?auto_30938 ) ) ( not ( = ?auto_30943 ?auto_30938 ) ) ( not ( = ?auto_30943 ?auto_30941 ) ) ( ON_BOARD ?auto_30946 ?auto_30944 ) ( SUPPORTS ?auto_30946 ?auto_30939 ) ( not ( = ?auto_30938 ?auto_30947 ) ) ( HAVE_IMAGE ?auto_30941 ?auto_30940 ) ( not ( = ?auto_30941 ?auto_30947 ) ) ( not ( = ?auto_30940 ?auto_30939 ) ) ( CALIBRATION_TARGET ?auto_30946 ?auto_30947 ) ( not ( = ?auto_30947 ?auto_30943 ) ) ( ON_BOARD ?auto_30945 ?auto_30944 ) ( not ( = ?auto_30946 ?auto_30945 ) ) ( SUPPORTS ?auto_30945 ?auto_30942 ) ( not ( = ?auto_30940 ?auto_30942 ) ) ( not ( = ?auto_30939 ?auto_30942 ) ) ( CALIBRATION_TARGET ?auto_30945 ?auto_30947 ) ( POINTING ?auto_30944 ?auto_30941 ) ( ON_BOARD ?auto_30948 ?auto_30944 ) ( POWER_ON ?auto_30948 ) ( not ( = ?auto_30946 ?auto_30948 ) ) ( not ( = ?auto_30945 ?auto_30948 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30941 ?auto_30940 ?auto_30938 ?auto_30939 )
      ( GET-3IMAGE-VERIFY ?auto_30938 ?auto_30939 ?auto_30941 ?auto_30940 ?auto_30943 ?auto_30942 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30962 - DIRECTION
      ?auto_30963 - MODE
      ?auto_30965 - DIRECTION
      ?auto_30964 - MODE
      ?auto_30967 - DIRECTION
      ?auto_30966 - MODE
    )
    :vars
    (
      ?auto_30970 - INSTRUMENT
      ?auto_30968 - SATELLITE
      ?auto_30971 - DIRECTION
      ?auto_30969 - INSTRUMENT
      ?auto_30972 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30965 ?auto_30962 ) ) ( not ( = ?auto_30967 ?auto_30962 ) ) ( not ( = ?auto_30967 ?auto_30965 ) ) ( ON_BOARD ?auto_30970 ?auto_30968 ) ( SUPPORTS ?auto_30970 ?auto_30963 ) ( not ( = ?auto_30962 ?auto_30971 ) ) ( HAVE_IMAGE ?auto_30967 ?auto_30966 ) ( not ( = ?auto_30967 ?auto_30971 ) ) ( not ( = ?auto_30966 ?auto_30963 ) ) ( CALIBRATION_TARGET ?auto_30970 ?auto_30971 ) ( not ( = ?auto_30971 ?auto_30965 ) ) ( ON_BOARD ?auto_30969 ?auto_30968 ) ( not ( = ?auto_30970 ?auto_30969 ) ) ( SUPPORTS ?auto_30969 ?auto_30964 ) ( not ( = ?auto_30966 ?auto_30964 ) ) ( not ( = ?auto_30963 ?auto_30964 ) ) ( CALIBRATION_TARGET ?auto_30969 ?auto_30971 ) ( POINTING ?auto_30968 ?auto_30967 ) ( ON_BOARD ?auto_30972 ?auto_30968 ) ( POWER_ON ?auto_30972 ) ( not ( = ?auto_30970 ?auto_30972 ) ) ( not ( = ?auto_30969 ?auto_30972 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30967 ?auto_30966 ?auto_30962 ?auto_30963 )
      ( GET-3IMAGE-VERIFY ?auto_30962 ?auto_30963 ?auto_30965 ?auto_30964 ?auto_30967 ?auto_30966 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_31040 - DIRECTION
      ?auto_31041 - MODE
    )
    :vars
    (
      ?auto_31049 - DIRECTION
      ?auto_31044 - INSTRUMENT
      ?auto_31042 - SATELLITE
      ?auto_31046 - DIRECTION
      ?auto_31048 - MODE
      ?auto_31050 - DIRECTION
      ?auto_31043 - INSTRUMENT
      ?auto_31045 - MODE
      ?auto_31047 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31040 ?auto_31049 ) ) ( ON_BOARD ?auto_31044 ?auto_31042 ) ( SUPPORTS ?auto_31044 ?auto_31041 ) ( not ( = ?auto_31040 ?auto_31046 ) ) ( not ( = ?auto_31049 ?auto_31046 ) ) ( not ( = ?auto_31048 ?auto_31041 ) ) ( CALIBRATION_TARGET ?auto_31044 ?auto_31046 ) ( not ( = ?auto_31046 ?auto_31050 ) ) ( not ( = ?auto_31040 ?auto_31050 ) ) ( not ( = ?auto_31049 ?auto_31050 ) ) ( ON_BOARD ?auto_31043 ?auto_31042 ) ( not ( = ?auto_31044 ?auto_31043 ) ) ( SUPPORTS ?auto_31043 ?auto_31045 ) ( not ( = ?auto_31048 ?auto_31045 ) ) ( not ( = ?auto_31041 ?auto_31045 ) ) ( CALIBRATION_TARGET ?auto_31043 ?auto_31046 ) ( POINTING ?auto_31042 ?auto_31049 ) ( ON_BOARD ?auto_31047 ?auto_31042 ) ( POWER_ON ?auto_31047 ) ( not ( = ?auto_31044 ?auto_31047 ) ) ( not ( = ?auto_31043 ?auto_31047 ) ) ( CALIBRATED ?auto_31047 ) ( SUPPORTS ?auto_31047 ?auto_31048 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_31049 ?auto_31048 )
      ( GET-2IMAGE ?auto_31049 ?auto_31048 ?auto_31040 ?auto_31041 )
      ( GET-1IMAGE-VERIFY ?auto_31040 ?auto_31041 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31051 - DIRECTION
      ?auto_31052 - MODE
      ?auto_31054 - DIRECTION
      ?auto_31053 - MODE
    )
    :vars
    (
      ?auto_31061 - INSTRUMENT
      ?auto_31056 - SATELLITE
      ?auto_31057 - DIRECTION
      ?auto_31059 - DIRECTION
      ?auto_31058 - INSTRUMENT
      ?auto_31055 - MODE
      ?auto_31060 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31054 ?auto_31051 ) ) ( ON_BOARD ?auto_31061 ?auto_31056 ) ( SUPPORTS ?auto_31061 ?auto_31053 ) ( not ( = ?auto_31054 ?auto_31057 ) ) ( not ( = ?auto_31051 ?auto_31057 ) ) ( not ( = ?auto_31052 ?auto_31053 ) ) ( CALIBRATION_TARGET ?auto_31061 ?auto_31057 ) ( not ( = ?auto_31057 ?auto_31059 ) ) ( not ( = ?auto_31054 ?auto_31059 ) ) ( not ( = ?auto_31051 ?auto_31059 ) ) ( ON_BOARD ?auto_31058 ?auto_31056 ) ( not ( = ?auto_31061 ?auto_31058 ) ) ( SUPPORTS ?auto_31058 ?auto_31055 ) ( not ( = ?auto_31052 ?auto_31055 ) ) ( not ( = ?auto_31053 ?auto_31055 ) ) ( CALIBRATION_TARGET ?auto_31058 ?auto_31057 ) ( POINTING ?auto_31056 ?auto_31051 ) ( ON_BOARD ?auto_31060 ?auto_31056 ) ( POWER_ON ?auto_31060 ) ( not ( = ?auto_31061 ?auto_31060 ) ) ( not ( = ?auto_31058 ?auto_31060 ) ) ( CALIBRATED ?auto_31060 ) ( SUPPORTS ?auto_31060 ?auto_31052 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_31054 ?auto_31053 )
      ( GET-2IMAGE-VERIFY ?auto_31051 ?auto_31052 ?auto_31054 ?auto_31053 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31062 - DIRECTION
      ?auto_31063 - MODE
      ?auto_31065 - DIRECTION
      ?auto_31064 - MODE
    )
    :vars
    (
      ?auto_31072 - DIRECTION
      ?auto_31069 - INSTRUMENT
      ?auto_31067 - SATELLITE
      ?auto_31070 - DIRECTION
      ?auto_31071 - MODE
      ?auto_31066 - INSTRUMENT
      ?auto_31068 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31065 ?auto_31062 ) ) ( not ( = ?auto_31065 ?auto_31072 ) ) ( ON_BOARD ?auto_31069 ?auto_31067 ) ( SUPPORTS ?auto_31069 ?auto_31064 ) ( not ( = ?auto_31065 ?auto_31070 ) ) ( not ( = ?auto_31072 ?auto_31070 ) ) ( not ( = ?auto_31071 ?auto_31064 ) ) ( CALIBRATION_TARGET ?auto_31069 ?auto_31070 ) ( not ( = ?auto_31070 ?auto_31062 ) ) ( not ( = ?auto_31072 ?auto_31062 ) ) ( ON_BOARD ?auto_31066 ?auto_31067 ) ( not ( = ?auto_31069 ?auto_31066 ) ) ( SUPPORTS ?auto_31066 ?auto_31063 ) ( not ( = ?auto_31071 ?auto_31063 ) ) ( not ( = ?auto_31064 ?auto_31063 ) ) ( CALIBRATION_TARGET ?auto_31066 ?auto_31070 ) ( POINTING ?auto_31067 ?auto_31072 ) ( ON_BOARD ?auto_31068 ?auto_31067 ) ( POWER_ON ?auto_31068 ) ( not ( = ?auto_31069 ?auto_31068 ) ) ( not ( = ?auto_31066 ?auto_31068 ) ) ( CALIBRATED ?auto_31068 ) ( SUPPORTS ?auto_31068 ?auto_31071 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31072 ?auto_31071 ?auto_31065 ?auto_31064 )
      ( GET-2IMAGE-VERIFY ?auto_31062 ?auto_31063 ?auto_31065 ?auto_31064 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31073 - DIRECTION
      ?auto_31074 - MODE
      ?auto_31076 - DIRECTION
      ?auto_31075 - MODE
    )
    :vars
    (
      ?auto_31082 - INSTRUMENT
      ?auto_31080 - SATELLITE
      ?auto_31083 - DIRECTION
      ?auto_31078 - DIRECTION
      ?auto_31079 - INSTRUMENT
      ?auto_31077 - MODE
      ?auto_31081 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31076 ?auto_31073 ) ) ( ON_BOARD ?auto_31082 ?auto_31080 ) ( SUPPORTS ?auto_31082 ?auto_31074 ) ( not ( = ?auto_31073 ?auto_31083 ) ) ( not ( = ?auto_31076 ?auto_31083 ) ) ( not ( = ?auto_31075 ?auto_31074 ) ) ( CALIBRATION_TARGET ?auto_31082 ?auto_31083 ) ( not ( = ?auto_31083 ?auto_31078 ) ) ( not ( = ?auto_31073 ?auto_31078 ) ) ( not ( = ?auto_31076 ?auto_31078 ) ) ( ON_BOARD ?auto_31079 ?auto_31080 ) ( not ( = ?auto_31082 ?auto_31079 ) ) ( SUPPORTS ?auto_31079 ?auto_31077 ) ( not ( = ?auto_31075 ?auto_31077 ) ) ( not ( = ?auto_31074 ?auto_31077 ) ) ( CALIBRATION_TARGET ?auto_31079 ?auto_31083 ) ( POINTING ?auto_31080 ?auto_31076 ) ( ON_BOARD ?auto_31081 ?auto_31080 ) ( POWER_ON ?auto_31081 ) ( not ( = ?auto_31082 ?auto_31081 ) ) ( not ( = ?auto_31079 ?auto_31081 ) ) ( CALIBRATED ?auto_31081 ) ( SUPPORTS ?auto_31081 ?auto_31075 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31076 ?auto_31075 ?auto_31073 ?auto_31074 )
      ( GET-2IMAGE-VERIFY ?auto_31073 ?auto_31074 ?auto_31076 ?auto_31075 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31084 - DIRECTION
      ?auto_31085 - MODE
      ?auto_31087 - DIRECTION
      ?auto_31086 - MODE
    )
    :vars
    (
      ?auto_31094 - DIRECTION
      ?auto_31091 - INSTRUMENT
      ?auto_31089 - SATELLITE
      ?auto_31092 - DIRECTION
      ?auto_31093 - MODE
      ?auto_31088 - INSTRUMENT
      ?auto_31090 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31087 ?auto_31084 ) ) ( not ( = ?auto_31084 ?auto_31094 ) ) ( ON_BOARD ?auto_31091 ?auto_31089 ) ( SUPPORTS ?auto_31091 ?auto_31085 ) ( not ( = ?auto_31084 ?auto_31092 ) ) ( not ( = ?auto_31094 ?auto_31092 ) ) ( not ( = ?auto_31093 ?auto_31085 ) ) ( CALIBRATION_TARGET ?auto_31091 ?auto_31092 ) ( not ( = ?auto_31092 ?auto_31087 ) ) ( not ( = ?auto_31094 ?auto_31087 ) ) ( ON_BOARD ?auto_31088 ?auto_31089 ) ( not ( = ?auto_31091 ?auto_31088 ) ) ( SUPPORTS ?auto_31088 ?auto_31086 ) ( not ( = ?auto_31093 ?auto_31086 ) ) ( not ( = ?auto_31085 ?auto_31086 ) ) ( CALIBRATION_TARGET ?auto_31088 ?auto_31092 ) ( POINTING ?auto_31089 ?auto_31094 ) ( ON_BOARD ?auto_31090 ?auto_31089 ) ( POWER_ON ?auto_31090 ) ( not ( = ?auto_31091 ?auto_31090 ) ) ( not ( = ?auto_31088 ?auto_31090 ) ) ( CALIBRATED ?auto_31090 ) ( SUPPORTS ?auto_31090 ?auto_31093 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31094 ?auto_31093 ?auto_31084 ?auto_31085 )
      ( GET-2IMAGE-VERIFY ?auto_31084 ?auto_31085 ?auto_31087 ?auto_31086 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31121 - DIRECTION
      ?auto_31122 - MODE
      ?auto_31124 - DIRECTION
      ?auto_31123 - MODE
      ?auto_31126 - DIRECTION
      ?auto_31125 - MODE
    )
    :vars
    (
      ?auto_31130 - INSTRUMENT
      ?auto_31128 - SATELLITE
      ?auto_31131 - DIRECTION
      ?auto_31127 - INSTRUMENT
      ?auto_31129 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31124 ?auto_31121 ) ) ( not ( = ?auto_31126 ?auto_31121 ) ) ( not ( = ?auto_31126 ?auto_31124 ) ) ( ON_BOARD ?auto_31130 ?auto_31128 ) ( SUPPORTS ?auto_31130 ?auto_31125 ) ( not ( = ?auto_31126 ?auto_31131 ) ) ( not ( = ?auto_31121 ?auto_31131 ) ) ( not ( = ?auto_31122 ?auto_31125 ) ) ( CALIBRATION_TARGET ?auto_31130 ?auto_31131 ) ( not ( = ?auto_31131 ?auto_31124 ) ) ( ON_BOARD ?auto_31127 ?auto_31128 ) ( not ( = ?auto_31130 ?auto_31127 ) ) ( SUPPORTS ?auto_31127 ?auto_31123 ) ( not ( = ?auto_31122 ?auto_31123 ) ) ( not ( = ?auto_31125 ?auto_31123 ) ) ( CALIBRATION_TARGET ?auto_31127 ?auto_31131 ) ( POINTING ?auto_31128 ?auto_31121 ) ( ON_BOARD ?auto_31129 ?auto_31128 ) ( POWER_ON ?auto_31129 ) ( not ( = ?auto_31130 ?auto_31129 ) ) ( not ( = ?auto_31127 ?auto_31129 ) ) ( CALIBRATED ?auto_31129 ) ( SUPPORTS ?auto_31129 ?auto_31122 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31121 ?auto_31122 ?auto_31126 ?auto_31125 )
      ( GET-3IMAGE-VERIFY ?auto_31121 ?auto_31122 ?auto_31124 ?auto_31123 ?auto_31126 ?auto_31125 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31145 - DIRECTION
      ?auto_31146 - MODE
      ?auto_31148 - DIRECTION
      ?auto_31147 - MODE
      ?auto_31150 - DIRECTION
      ?auto_31149 - MODE
    )
    :vars
    (
      ?auto_31154 - INSTRUMENT
      ?auto_31152 - SATELLITE
      ?auto_31155 - DIRECTION
      ?auto_31151 - INSTRUMENT
      ?auto_31153 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31148 ?auto_31145 ) ) ( not ( = ?auto_31150 ?auto_31145 ) ) ( not ( = ?auto_31150 ?auto_31148 ) ) ( ON_BOARD ?auto_31154 ?auto_31152 ) ( SUPPORTS ?auto_31154 ?auto_31147 ) ( not ( = ?auto_31148 ?auto_31155 ) ) ( not ( = ?auto_31145 ?auto_31155 ) ) ( not ( = ?auto_31146 ?auto_31147 ) ) ( CALIBRATION_TARGET ?auto_31154 ?auto_31155 ) ( not ( = ?auto_31155 ?auto_31150 ) ) ( ON_BOARD ?auto_31151 ?auto_31152 ) ( not ( = ?auto_31154 ?auto_31151 ) ) ( SUPPORTS ?auto_31151 ?auto_31149 ) ( not ( = ?auto_31146 ?auto_31149 ) ) ( not ( = ?auto_31147 ?auto_31149 ) ) ( CALIBRATION_TARGET ?auto_31151 ?auto_31155 ) ( POINTING ?auto_31152 ?auto_31145 ) ( ON_BOARD ?auto_31153 ?auto_31152 ) ( POWER_ON ?auto_31153 ) ( not ( = ?auto_31154 ?auto_31153 ) ) ( not ( = ?auto_31151 ?auto_31153 ) ) ( CALIBRATED ?auto_31153 ) ( SUPPORTS ?auto_31153 ?auto_31146 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31145 ?auto_31146 ?auto_31148 ?auto_31147 )
      ( GET-3IMAGE-VERIFY ?auto_31145 ?auto_31146 ?auto_31148 ?auto_31147 ?auto_31150 ?auto_31149 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31169 - DIRECTION
      ?auto_31170 - MODE
      ?auto_31172 - DIRECTION
      ?auto_31171 - MODE
      ?auto_31174 - DIRECTION
      ?auto_31173 - MODE
    )
    :vars
    (
      ?auto_31178 - INSTRUMENT
      ?auto_31176 - SATELLITE
      ?auto_31179 - DIRECTION
      ?auto_31175 - INSTRUMENT
      ?auto_31177 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31172 ?auto_31169 ) ) ( not ( = ?auto_31174 ?auto_31169 ) ) ( not ( = ?auto_31174 ?auto_31172 ) ) ( ON_BOARD ?auto_31178 ?auto_31176 ) ( SUPPORTS ?auto_31178 ?auto_31173 ) ( not ( = ?auto_31174 ?auto_31179 ) ) ( not ( = ?auto_31172 ?auto_31179 ) ) ( not ( = ?auto_31171 ?auto_31173 ) ) ( CALIBRATION_TARGET ?auto_31178 ?auto_31179 ) ( not ( = ?auto_31179 ?auto_31169 ) ) ( ON_BOARD ?auto_31175 ?auto_31176 ) ( not ( = ?auto_31178 ?auto_31175 ) ) ( SUPPORTS ?auto_31175 ?auto_31170 ) ( not ( = ?auto_31171 ?auto_31170 ) ) ( not ( = ?auto_31173 ?auto_31170 ) ) ( CALIBRATION_TARGET ?auto_31175 ?auto_31179 ) ( POINTING ?auto_31176 ?auto_31172 ) ( ON_BOARD ?auto_31177 ?auto_31176 ) ( POWER_ON ?auto_31177 ) ( not ( = ?auto_31178 ?auto_31177 ) ) ( not ( = ?auto_31175 ?auto_31177 ) ) ( CALIBRATED ?auto_31177 ) ( SUPPORTS ?auto_31177 ?auto_31171 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31172 ?auto_31171 ?auto_31174 ?auto_31173 )
      ( GET-3IMAGE-VERIFY ?auto_31169 ?auto_31170 ?auto_31172 ?auto_31171 ?auto_31174 ?auto_31173 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31193 - DIRECTION
      ?auto_31194 - MODE
      ?auto_31196 - DIRECTION
      ?auto_31195 - MODE
      ?auto_31198 - DIRECTION
      ?auto_31197 - MODE
    )
    :vars
    (
      ?auto_31202 - INSTRUMENT
      ?auto_31200 - SATELLITE
      ?auto_31203 - DIRECTION
      ?auto_31199 - INSTRUMENT
      ?auto_31201 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31196 ?auto_31193 ) ) ( not ( = ?auto_31198 ?auto_31193 ) ) ( not ( = ?auto_31198 ?auto_31196 ) ) ( ON_BOARD ?auto_31202 ?auto_31200 ) ( SUPPORTS ?auto_31202 ?auto_31195 ) ( not ( = ?auto_31196 ?auto_31203 ) ) ( not ( = ?auto_31198 ?auto_31203 ) ) ( not ( = ?auto_31197 ?auto_31195 ) ) ( CALIBRATION_TARGET ?auto_31202 ?auto_31203 ) ( not ( = ?auto_31203 ?auto_31193 ) ) ( ON_BOARD ?auto_31199 ?auto_31200 ) ( not ( = ?auto_31202 ?auto_31199 ) ) ( SUPPORTS ?auto_31199 ?auto_31194 ) ( not ( = ?auto_31197 ?auto_31194 ) ) ( not ( = ?auto_31195 ?auto_31194 ) ) ( CALIBRATION_TARGET ?auto_31199 ?auto_31203 ) ( POINTING ?auto_31200 ?auto_31198 ) ( ON_BOARD ?auto_31201 ?auto_31200 ) ( POWER_ON ?auto_31201 ) ( not ( = ?auto_31202 ?auto_31201 ) ) ( not ( = ?auto_31199 ?auto_31201 ) ) ( CALIBRATED ?auto_31201 ) ( SUPPORTS ?auto_31201 ?auto_31197 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31198 ?auto_31197 ?auto_31196 ?auto_31195 )
      ( GET-3IMAGE-VERIFY ?auto_31193 ?auto_31194 ?auto_31196 ?auto_31195 ?auto_31198 ?auto_31197 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31243 - DIRECTION
      ?auto_31244 - MODE
      ?auto_31246 - DIRECTION
      ?auto_31245 - MODE
      ?auto_31248 - DIRECTION
      ?auto_31247 - MODE
    )
    :vars
    (
      ?auto_31252 - INSTRUMENT
      ?auto_31250 - SATELLITE
      ?auto_31253 - DIRECTION
      ?auto_31249 - INSTRUMENT
      ?auto_31251 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31246 ?auto_31243 ) ) ( not ( = ?auto_31248 ?auto_31243 ) ) ( not ( = ?auto_31248 ?auto_31246 ) ) ( ON_BOARD ?auto_31252 ?auto_31250 ) ( SUPPORTS ?auto_31252 ?auto_31244 ) ( not ( = ?auto_31243 ?auto_31253 ) ) ( not ( = ?auto_31246 ?auto_31253 ) ) ( not ( = ?auto_31245 ?auto_31244 ) ) ( CALIBRATION_TARGET ?auto_31252 ?auto_31253 ) ( not ( = ?auto_31253 ?auto_31248 ) ) ( ON_BOARD ?auto_31249 ?auto_31250 ) ( not ( = ?auto_31252 ?auto_31249 ) ) ( SUPPORTS ?auto_31249 ?auto_31247 ) ( not ( = ?auto_31245 ?auto_31247 ) ) ( not ( = ?auto_31244 ?auto_31247 ) ) ( CALIBRATION_TARGET ?auto_31249 ?auto_31253 ) ( POINTING ?auto_31250 ?auto_31246 ) ( ON_BOARD ?auto_31251 ?auto_31250 ) ( POWER_ON ?auto_31251 ) ( not ( = ?auto_31252 ?auto_31251 ) ) ( not ( = ?auto_31249 ?auto_31251 ) ) ( CALIBRATED ?auto_31251 ) ( SUPPORTS ?auto_31251 ?auto_31245 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31246 ?auto_31245 ?auto_31243 ?auto_31244 )
      ( GET-3IMAGE-VERIFY ?auto_31243 ?auto_31244 ?auto_31246 ?auto_31245 ?auto_31248 ?auto_31247 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31267 - DIRECTION
      ?auto_31268 - MODE
      ?auto_31270 - DIRECTION
      ?auto_31269 - MODE
      ?auto_31272 - DIRECTION
      ?auto_31271 - MODE
    )
    :vars
    (
      ?auto_31276 - INSTRUMENT
      ?auto_31274 - SATELLITE
      ?auto_31277 - DIRECTION
      ?auto_31273 - INSTRUMENT
      ?auto_31275 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31270 ?auto_31267 ) ) ( not ( = ?auto_31272 ?auto_31267 ) ) ( not ( = ?auto_31272 ?auto_31270 ) ) ( ON_BOARD ?auto_31276 ?auto_31274 ) ( SUPPORTS ?auto_31276 ?auto_31268 ) ( not ( = ?auto_31267 ?auto_31277 ) ) ( not ( = ?auto_31272 ?auto_31277 ) ) ( not ( = ?auto_31271 ?auto_31268 ) ) ( CALIBRATION_TARGET ?auto_31276 ?auto_31277 ) ( not ( = ?auto_31277 ?auto_31270 ) ) ( ON_BOARD ?auto_31273 ?auto_31274 ) ( not ( = ?auto_31276 ?auto_31273 ) ) ( SUPPORTS ?auto_31273 ?auto_31269 ) ( not ( = ?auto_31271 ?auto_31269 ) ) ( not ( = ?auto_31268 ?auto_31269 ) ) ( CALIBRATION_TARGET ?auto_31273 ?auto_31277 ) ( POINTING ?auto_31274 ?auto_31272 ) ( ON_BOARD ?auto_31275 ?auto_31274 ) ( POWER_ON ?auto_31275 ) ( not ( = ?auto_31276 ?auto_31275 ) ) ( not ( = ?auto_31273 ?auto_31275 ) ) ( CALIBRATED ?auto_31275 ) ( SUPPORTS ?auto_31275 ?auto_31271 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31272 ?auto_31271 ?auto_31267 ?auto_31268 )
      ( GET-3IMAGE-VERIFY ?auto_31267 ?auto_31268 ?auto_31270 ?auto_31269 ?auto_31272 ?auto_31271 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_31345 - DIRECTION
      ?auto_31346 - MODE
    )
    :vars
    (
      ?auto_31355 - DIRECTION
      ?auto_31352 - INSTRUMENT
      ?auto_31350 - SATELLITE
      ?auto_31353 - DIRECTION
      ?auto_31354 - MODE
      ?auto_31348 - DIRECTION
      ?auto_31349 - INSTRUMENT
      ?auto_31347 - MODE
      ?auto_31351 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31345 ?auto_31355 ) ) ( ON_BOARD ?auto_31352 ?auto_31350 ) ( SUPPORTS ?auto_31352 ?auto_31346 ) ( not ( = ?auto_31345 ?auto_31353 ) ) ( not ( = ?auto_31355 ?auto_31353 ) ) ( not ( = ?auto_31354 ?auto_31346 ) ) ( CALIBRATION_TARGET ?auto_31352 ?auto_31353 ) ( not ( = ?auto_31353 ?auto_31348 ) ) ( not ( = ?auto_31345 ?auto_31348 ) ) ( not ( = ?auto_31355 ?auto_31348 ) ) ( ON_BOARD ?auto_31349 ?auto_31350 ) ( not ( = ?auto_31352 ?auto_31349 ) ) ( SUPPORTS ?auto_31349 ?auto_31347 ) ( not ( = ?auto_31354 ?auto_31347 ) ) ( not ( = ?auto_31346 ?auto_31347 ) ) ( CALIBRATION_TARGET ?auto_31349 ?auto_31353 ) ( ON_BOARD ?auto_31351 ?auto_31350 ) ( POWER_ON ?auto_31351 ) ( not ( = ?auto_31352 ?auto_31351 ) ) ( not ( = ?auto_31349 ?auto_31351 ) ) ( CALIBRATED ?auto_31351 ) ( SUPPORTS ?auto_31351 ?auto_31354 ) ( POINTING ?auto_31350 ?auto_31353 ) )
    :subtasks
    ( ( !TURN_TO ?auto_31350 ?auto_31355 ?auto_31353 )
      ( GET-2IMAGE ?auto_31355 ?auto_31354 ?auto_31345 ?auto_31346 )
      ( GET-1IMAGE-VERIFY ?auto_31345 ?auto_31346 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31356 - DIRECTION
      ?auto_31357 - MODE
      ?auto_31359 - DIRECTION
      ?auto_31358 - MODE
    )
    :vars
    (
      ?auto_31362 - INSTRUMENT
      ?auto_31365 - SATELLITE
      ?auto_31361 - DIRECTION
      ?auto_31364 - DIRECTION
      ?auto_31363 - INSTRUMENT
      ?auto_31366 - MODE
      ?auto_31360 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31359 ?auto_31356 ) ) ( ON_BOARD ?auto_31362 ?auto_31365 ) ( SUPPORTS ?auto_31362 ?auto_31358 ) ( not ( = ?auto_31359 ?auto_31361 ) ) ( not ( = ?auto_31356 ?auto_31361 ) ) ( not ( = ?auto_31357 ?auto_31358 ) ) ( CALIBRATION_TARGET ?auto_31362 ?auto_31361 ) ( not ( = ?auto_31361 ?auto_31364 ) ) ( not ( = ?auto_31359 ?auto_31364 ) ) ( not ( = ?auto_31356 ?auto_31364 ) ) ( ON_BOARD ?auto_31363 ?auto_31365 ) ( not ( = ?auto_31362 ?auto_31363 ) ) ( SUPPORTS ?auto_31363 ?auto_31366 ) ( not ( = ?auto_31357 ?auto_31366 ) ) ( not ( = ?auto_31358 ?auto_31366 ) ) ( CALIBRATION_TARGET ?auto_31363 ?auto_31361 ) ( ON_BOARD ?auto_31360 ?auto_31365 ) ( POWER_ON ?auto_31360 ) ( not ( = ?auto_31362 ?auto_31360 ) ) ( not ( = ?auto_31363 ?auto_31360 ) ) ( CALIBRATED ?auto_31360 ) ( SUPPORTS ?auto_31360 ?auto_31357 ) ( POINTING ?auto_31365 ?auto_31361 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_31359 ?auto_31358 )
      ( GET-2IMAGE-VERIFY ?auto_31356 ?auto_31357 ?auto_31359 ?auto_31358 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31367 - DIRECTION
      ?auto_31368 - MODE
      ?auto_31370 - DIRECTION
      ?auto_31369 - MODE
    )
    :vars
    (
      ?auto_31377 - DIRECTION
      ?auto_31373 - INSTRUMENT
      ?auto_31375 - SATELLITE
      ?auto_31374 - DIRECTION
      ?auto_31376 - MODE
      ?auto_31371 - INSTRUMENT
      ?auto_31372 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31370 ?auto_31367 ) ) ( not ( = ?auto_31370 ?auto_31377 ) ) ( ON_BOARD ?auto_31373 ?auto_31375 ) ( SUPPORTS ?auto_31373 ?auto_31369 ) ( not ( = ?auto_31370 ?auto_31374 ) ) ( not ( = ?auto_31377 ?auto_31374 ) ) ( not ( = ?auto_31376 ?auto_31369 ) ) ( CALIBRATION_TARGET ?auto_31373 ?auto_31374 ) ( not ( = ?auto_31374 ?auto_31367 ) ) ( not ( = ?auto_31377 ?auto_31367 ) ) ( ON_BOARD ?auto_31371 ?auto_31375 ) ( not ( = ?auto_31373 ?auto_31371 ) ) ( SUPPORTS ?auto_31371 ?auto_31368 ) ( not ( = ?auto_31376 ?auto_31368 ) ) ( not ( = ?auto_31369 ?auto_31368 ) ) ( CALIBRATION_TARGET ?auto_31371 ?auto_31374 ) ( ON_BOARD ?auto_31372 ?auto_31375 ) ( POWER_ON ?auto_31372 ) ( not ( = ?auto_31373 ?auto_31372 ) ) ( not ( = ?auto_31371 ?auto_31372 ) ) ( CALIBRATED ?auto_31372 ) ( SUPPORTS ?auto_31372 ?auto_31376 ) ( POINTING ?auto_31375 ?auto_31374 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31377 ?auto_31376 ?auto_31370 ?auto_31369 )
      ( GET-2IMAGE-VERIFY ?auto_31367 ?auto_31368 ?auto_31370 ?auto_31369 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31378 - DIRECTION
      ?auto_31379 - MODE
      ?auto_31381 - DIRECTION
      ?auto_31380 - MODE
    )
    :vars
    (
      ?auto_31385 - INSTRUMENT
      ?auto_31387 - SATELLITE
      ?auto_31386 - DIRECTION
      ?auto_31388 - DIRECTION
      ?auto_31382 - INSTRUMENT
      ?auto_31384 - MODE
      ?auto_31383 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31381 ?auto_31378 ) ) ( ON_BOARD ?auto_31385 ?auto_31387 ) ( SUPPORTS ?auto_31385 ?auto_31379 ) ( not ( = ?auto_31378 ?auto_31386 ) ) ( not ( = ?auto_31381 ?auto_31386 ) ) ( not ( = ?auto_31380 ?auto_31379 ) ) ( CALIBRATION_TARGET ?auto_31385 ?auto_31386 ) ( not ( = ?auto_31386 ?auto_31388 ) ) ( not ( = ?auto_31378 ?auto_31388 ) ) ( not ( = ?auto_31381 ?auto_31388 ) ) ( ON_BOARD ?auto_31382 ?auto_31387 ) ( not ( = ?auto_31385 ?auto_31382 ) ) ( SUPPORTS ?auto_31382 ?auto_31384 ) ( not ( = ?auto_31380 ?auto_31384 ) ) ( not ( = ?auto_31379 ?auto_31384 ) ) ( CALIBRATION_TARGET ?auto_31382 ?auto_31386 ) ( ON_BOARD ?auto_31383 ?auto_31387 ) ( POWER_ON ?auto_31383 ) ( not ( = ?auto_31385 ?auto_31383 ) ) ( not ( = ?auto_31382 ?auto_31383 ) ) ( CALIBRATED ?auto_31383 ) ( SUPPORTS ?auto_31383 ?auto_31380 ) ( POINTING ?auto_31387 ?auto_31386 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31381 ?auto_31380 ?auto_31378 ?auto_31379 )
      ( GET-2IMAGE-VERIFY ?auto_31378 ?auto_31379 ?auto_31381 ?auto_31380 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31389 - DIRECTION
      ?auto_31390 - MODE
      ?auto_31392 - DIRECTION
      ?auto_31391 - MODE
    )
    :vars
    (
      ?auto_31399 - DIRECTION
      ?auto_31395 - INSTRUMENT
      ?auto_31397 - SATELLITE
      ?auto_31396 - DIRECTION
      ?auto_31398 - MODE
      ?auto_31393 - INSTRUMENT
      ?auto_31394 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31392 ?auto_31389 ) ) ( not ( = ?auto_31389 ?auto_31399 ) ) ( ON_BOARD ?auto_31395 ?auto_31397 ) ( SUPPORTS ?auto_31395 ?auto_31390 ) ( not ( = ?auto_31389 ?auto_31396 ) ) ( not ( = ?auto_31399 ?auto_31396 ) ) ( not ( = ?auto_31398 ?auto_31390 ) ) ( CALIBRATION_TARGET ?auto_31395 ?auto_31396 ) ( not ( = ?auto_31396 ?auto_31392 ) ) ( not ( = ?auto_31399 ?auto_31392 ) ) ( ON_BOARD ?auto_31393 ?auto_31397 ) ( not ( = ?auto_31395 ?auto_31393 ) ) ( SUPPORTS ?auto_31393 ?auto_31391 ) ( not ( = ?auto_31398 ?auto_31391 ) ) ( not ( = ?auto_31390 ?auto_31391 ) ) ( CALIBRATION_TARGET ?auto_31393 ?auto_31396 ) ( ON_BOARD ?auto_31394 ?auto_31397 ) ( POWER_ON ?auto_31394 ) ( not ( = ?auto_31395 ?auto_31394 ) ) ( not ( = ?auto_31393 ?auto_31394 ) ) ( CALIBRATED ?auto_31394 ) ( SUPPORTS ?auto_31394 ?auto_31398 ) ( POINTING ?auto_31397 ?auto_31396 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31399 ?auto_31398 ?auto_31389 ?auto_31390 )
      ( GET-2IMAGE-VERIFY ?auto_31389 ?auto_31390 ?auto_31392 ?auto_31391 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31426 - DIRECTION
      ?auto_31427 - MODE
      ?auto_31429 - DIRECTION
      ?auto_31428 - MODE
      ?auto_31431 - DIRECTION
      ?auto_31430 - MODE
    )
    :vars
    (
      ?auto_31434 - INSTRUMENT
      ?auto_31436 - SATELLITE
      ?auto_31435 - DIRECTION
      ?auto_31432 - INSTRUMENT
      ?auto_31433 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31429 ?auto_31426 ) ) ( not ( = ?auto_31431 ?auto_31426 ) ) ( not ( = ?auto_31431 ?auto_31429 ) ) ( ON_BOARD ?auto_31434 ?auto_31436 ) ( SUPPORTS ?auto_31434 ?auto_31430 ) ( not ( = ?auto_31431 ?auto_31435 ) ) ( not ( = ?auto_31426 ?auto_31435 ) ) ( not ( = ?auto_31427 ?auto_31430 ) ) ( CALIBRATION_TARGET ?auto_31434 ?auto_31435 ) ( not ( = ?auto_31435 ?auto_31429 ) ) ( ON_BOARD ?auto_31432 ?auto_31436 ) ( not ( = ?auto_31434 ?auto_31432 ) ) ( SUPPORTS ?auto_31432 ?auto_31428 ) ( not ( = ?auto_31427 ?auto_31428 ) ) ( not ( = ?auto_31430 ?auto_31428 ) ) ( CALIBRATION_TARGET ?auto_31432 ?auto_31435 ) ( ON_BOARD ?auto_31433 ?auto_31436 ) ( POWER_ON ?auto_31433 ) ( not ( = ?auto_31434 ?auto_31433 ) ) ( not ( = ?auto_31432 ?auto_31433 ) ) ( CALIBRATED ?auto_31433 ) ( SUPPORTS ?auto_31433 ?auto_31427 ) ( POINTING ?auto_31436 ?auto_31435 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31426 ?auto_31427 ?auto_31431 ?auto_31430 )
      ( GET-3IMAGE-VERIFY ?auto_31426 ?auto_31427 ?auto_31429 ?auto_31428 ?auto_31431 ?auto_31430 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31450 - DIRECTION
      ?auto_31451 - MODE
      ?auto_31453 - DIRECTION
      ?auto_31452 - MODE
      ?auto_31455 - DIRECTION
      ?auto_31454 - MODE
    )
    :vars
    (
      ?auto_31458 - INSTRUMENT
      ?auto_31460 - SATELLITE
      ?auto_31459 - DIRECTION
      ?auto_31456 - INSTRUMENT
      ?auto_31457 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31453 ?auto_31450 ) ) ( not ( = ?auto_31455 ?auto_31450 ) ) ( not ( = ?auto_31455 ?auto_31453 ) ) ( ON_BOARD ?auto_31458 ?auto_31460 ) ( SUPPORTS ?auto_31458 ?auto_31452 ) ( not ( = ?auto_31453 ?auto_31459 ) ) ( not ( = ?auto_31450 ?auto_31459 ) ) ( not ( = ?auto_31451 ?auto_31452 ) ) ( CALIBRATION_TARGET ?auto_31458 ?auto_31459 ) ( not ( = ?auto_31459 ?auto_31455 ) ) ( ON_BOARD ?auto_31456 ?auto_31460 ) ( not ( = ?auto_31458 ?auto_31456 ) ) ( SUPPORTS ?auto_31456 ?auto_31454 ) ( not ( = ?auto_31451 ?auto_31454 ) ) ( not ( = ?auto_31452 ?auto_31454 ) ) ( CALIBRATION_TARGET ?auto_31456 ?auto_31459 ) ( ON_BOARD ?auto_31457 ?auto_31460 ) ( POWER_ON ?auto_31457 ) ( not ( = ?auto_31458 ?auto_31457 ) ) ( not ( = ?auto_31456 ?auto_31457 ) ) ( CALIBRATED ?auto_31457 ) ( SUPPORTS ?auto_31457 ?auto_31451 ) ( POINTING ?auto_31460 ?auto_31459 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31450 ?auto_31451 ?auto_31453 ?auto_31452 )
      ( GET-3IMAGE-VERIFY ?auto_31450 ?auto_31451 ?auto_31453 ?auto_31452 ?auto_31455 ?auto_31454 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31474 - DIRECTION
      ?auto_31475 - MODE
      ?auto_31477 - DIRECTION
      ?auto_31476 - MODE
      ?auto_31479 - DIRECTION
      ?auto_31478 - MODE
    )
    :vars
    (
      ?auto_31482 - INSTRUMENT
      ?auto_31484 - SATELLITE
      ?auto_31483 - DIRECTION
      ?auto_31480 - INSTRUMENT
      ?auto_31481 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31477 ?auto_31474 ) ) ( not ( = ?auto_31479 ?auto_31474 ) ) ( not ( = ?auto_31479 ?auto_31477 ) ) ( ON_BOARD ?auto_31482 ?auto_31484 ) ( SUPPORTS ?auto_31482 ?auto_31478 ) ( not ( = ?auto_31479 ?auto_31483 ) ) ( not ( = ?auto_31477 ?auto_31483 ) ) ( not ( = ?auto_31476 ?auto_31478 ) ) ( CALIBRATION_TARGET ?auto_31482 ?auto_31483 ) ( not ( = ?auto_31483 ?auto_31474 ) ) ( ON_BOARD ?auto_31480 ?auto_31484 ) ( not ( = ?auto_31482 ?auto_31480 ) ) ( SUPPORTS ?auto_31480 ?auto_31475 ) ( not ( = ?auto_31476 ?auto_31475 ) ) ( not ( = ?auto_31478 ?auto_31475 ) ) ( CALIBRATION_TARGET ?auto_31480 ?auto_31483 ) ( ON_BOARD ?auto_31481 ?auto_31484 ) ( POWER_ON ?auto_31481 ) ( not ( = ?auto_31482 ?auto_31481 ) ) ( not ( = ?auto_31480 ?auto_31481 ) ) ( CALIBRATED ?auto_31481 ) ( SUPPORTS ?auto_31481 ?auto_31476 ) ( POINTING ?auto_31484 ?auto_31483 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31477 ?auto_31476 ?auto_31479 ?auto_31478 )
      ( GET-3IMAGE-VERIFY ?auto_31474 ?auto_31475 ?auto_31477 ?auto_31476 ?auto_31479 ?auto_31478 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31498 - DIRECTION
      ?auto_31499 - MODE
      ?auto_31501 - DIRECTION
      ?auto_31500 - MODE
      ?auto_31503 - DIRECTION
      ?auto_31502 - MODE
    )
    :vars
    (
      ?auto_31506 - INSTRUMENT
      ?auto_31508 - SATELLITE
      ?auto_31507 - DIRECTION
      ?auto_31504 - INSTRUMENT
      ?auto_31505 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31501 ?auto_31498 ) ) ( not ( = ?auto_31503 ?auto_31498 ) ) ( not ( = ?auto_31503 ?auto_31501 ) ) ( ON_BOARD ?auto_31506 ?auto_31508 ) ( SUPPORTS ?auto_31506 ?auto_31500 ) ( not ( = ?auto_31501 ?auto_31507 ) ) ( not ( = ?auto_31503 ?auto_31507 ) ) ( not ( = ?auto_31502 ?auto_31500 ) ) ( CALIBRATION_TARGET ?auto_31506 ?auto_31507 ) ( not ( = ?auto_31507 ?auto_31498 ) ) ( ON_BOARD ?auto_31504 ?auto_31508 ) ( not ( = ?auto_31506 ?auto_31504 ) ) ( SUPPORTS ?auto_31504 ?auto_31499 ) ( not ( = ?auto_31502 ?auto_31499 ) ) ( not ( = ?auto_31500 ?auto_31499 ) ) ( CALIBRATION_TARGET ?auto_31504 ?auto_31507 ) ( ON_BOARD ?auto_31505 ?auto_31508 ) ( POWER_ON ?auto_31505 ) ( not ( = ?auto_31506 ?auto_31505 ) ) ( not ( = ?auto_31504 ?auto_31505 ) ) ( CALIBRATED ?auto_31505 ) ( SUPPORTS ?auto_31505 ?auto_31502 ) ( POINTING ?auto_31508 ?auto_31507 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31503 ?auto_31502 ?auto_31501 ?auto_31500 )
      ( GET-3IMAGE-VERIFY ?auto_31498 ?auto_31499 ?auto_31501 ?auto_31500 ?auto_31503 ?auto_31502 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31548 - DIRECTION
      ?auto_31549 - MODE
      ?auto_31551 - DIRECTION
      ?auto_31550 - MODE
      ?auto_31553 - DIRECTION
      ?auto_31552 - MODE
    )
    :vars
    (
      ?auto_31556 - INSTRUMENT
      ?auto_31558 - SATELLITE
      ?auto_31557 - DIRECTION
      ?auto_31554 - INSTRUMENT
      ?auto_31555 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31551 ?auto_31548 ) ) ( not ( = ?auto_31553 ?auto_31548 ) ) ( not ( = ?auto_31553 ?auto_31551 ) ) ( ON_BOARD ?auto_31556 ?auto_31558 ) ( SUPPORTS ?auto_31556 ?auto_31549 ) ( not ( = ?auto_31548 ?auto_31557 ) ) ( not ( = ?auto_31551 ?auto_31557 ) ) ( not ( = ?auto_31550 ?auto_31549 ) ) ( CALIBRATION_TARGET ?auto_31556 ?auto_31557 ) ( not ( = ?auto_31557 ?auto_31553 ) ) ( ON_BOARD ?auto_31554 ?auto_31558 ) ( not ( = ?auto_31556 ?auto_31554 ) ) ( SUPPORTS ?auto_31554 ?auto_31552 ) ( not ( = ?auto_31550 ?auto_31552 ) ) ( not ( = ?auto_31549 ?auto_31552 ) ) ( CALIBRATION_TARGET ?auto_31554 ?auto_31557 ) ( ON_BOARD ?auto_31555 ?auto_31558 ) ( POWER_ON ?auto_31555 ) ( not ( = ?auto_31556 ?auto_31555 ) ) ( not ( = ?auto_31554 ?auto_31555 ) ) ( CALIBRATED ?auto_31555 ) ( SUPPORTS ?auto_31555 ?auto_31550 ) ( POINTING ?auto_31558 ?auto_31557 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31551 ?auto_31550 ?auto_31548 ?auto_31549 )
      ( GET-3IMAGE-VERIFY ?auto_31548 ?auto_31549 ?auto_31551 ?auto_31550 ?auto_31553 ?auto_31552 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31572 - DIRECTION
      ?auto_31573 - MODE
      ?auto_31575 - DIRECTION
      ?auto_31574 - MODE
      ?auto_31577 - DIRECTION
      ?auto_31576 - MODE
    )
    :vars
    (
      ?auto_31580 - INSTRUMENT
      ?auto_31582 - SATELLITE
      ?auto_31581 - DIRECTION
      ?auto_31578 - INSTRUMENT
      ?auto_31579 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31575 ?auto_31572 ) ) ( not ( = ?auto_31577 ?auto_31572 ) ) ( not ( = ?auto_31577 ?auto_31575 ) ) ( ON_BOARD ?auto_31580 ?auto_31582 ) ( SUPPORTS ?auto_31580 ?auto_31573 ) ( not ( = ?auto_31572 ?auto_31581 ) ) ( not ( = ?auto_31577 ?auto_31581 ) ) ( not ( = ?auto_31576 ?auto_31573 ) ) ( CALIBRATION_TARGET ?auto_31580 ?auto_31581 ) ( not ( = ?auto_31581 ?auto_31575 ) ) ( ON_BOARD ?auto_31578 ?auto_31582 ) ( not ( = ?auto_31580 ?auto_31578 ) ) ( SUPPORTS ?auto_31578 ?auto_31574 ) ( not ( = ?auto_31576 ?auto_31574 ) ) ( not ( = ?auto_31573 ?auto_31574 ) ) ( CALIBRATION_TARGET ?auto_31578 ?auto_31581 ) ( ON_BOARD ?auto_31579 ?auto_31582 ) ( POWER_ON ?auto_31579 ) ( not ( = ?auto_31580 ?auto_31579 ) ) ( not ( = ?auto_31578 ?auto_31579 ) ) ( CALIBRATED ?auto_31579 ) ( SUPPORTS ?auto_31579 ?auto_31576 ) ( POINTING ?auto_31582 ?auto_31581 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31577 ?auto_31576 ?auto_31572 ?auto_31573 )
      ( GET-3IMAGE-VERIFY ?auto_31572 ?auto_31573 ?auto_31575 ?auto_31574 ?auto_31577 ?auto_31576 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_31650 - DIRECTION
      ?auto_31651 - MODE
    )
    :vars
    (
      ?auto_31660 - DIRECTION
      ?auto_31655 - INSTRUMENT
      ?auto_31657 - SATELLITE
      ?auto_31656 - DIRECTION
      ?auto_31659 - MODE
      ?auto_31658 - DIRECTION
      ?auto_31652 - INSTRUMENT
      ?auto_31654 - MODE
      ?auto_31653 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31650 ?auto_31660 ) ) ( ON_BOARD ?auto_31655 ?auto_31657 ) ( SUPPORTS ?auto_31655 ?auto_31651 ) ( not ( = ?auto_31650 ?auto_31656 ) ) ( not ( = ?auto_31660 ?auto_31656 ) ) ( not ( = ?auto_31659 ?auto_31651 ) ) ( CALIBRATION_TARGET ?auto_31655 ?auto_31656 ) ( not ( = ?auto_31656 ?auto_31658 ) ) ( not ( = ?auto_31650 ?auto_31658 ) ) ( not ( = ?auto_31660 ?auto_31658 ) ) ( ON_BOARD ?auto_31652 ?auto_31657 ) ( not ( = ?auto_31655 ?auto_31652 ) ) ( SUPPORTS ?auto_31652 ?auto_31654 ) ( not ( = ?auto_31659 ?auto_31654 ) ) ( not ( = ?auto_31651 ?auto_31654 ) ) ( CALIBRATION_TARGET ?auto_31652 ?auto_31656 ) ( ON_BOARD ?auto_31653 ?auto_31657 ) ( POWER_ON ?auto_31653 ) ( not ( = ?auto_31655 ?auto_31653 ) ) ( not ( = ?auto_31652 ?auto_31653 ) ) ( SUPPORTS ?auto_31653 ?auto_31659 ) ( POINTING ?auto_31657 ?auto_31656 ) ( CALIBRATION_TARGET ?auto_31653 ?auto_31656 ) ( NOT_CALIBRATED ?auto_31653 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_31657 ?auto_31653 ?auto_31656 )
      ( GET-2IMAGE ?auto_31660 ?auto_31659 ?auto_31650 ?auto_31651 )
      ( GET-1IMAGE-VERIFY ?auto_31650 ?auto_31651 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31661 - DIRECTION
      ?auto_31662 - MODE
      ?auto_31664 - DIRECTION
      ?auto_31663 - MODE
    )
    :vars
    (
      ?auto_31669 - INSTRUMENT
      ?auto_31665 - SATELLITE
      ?auto_31670 - DIRECTION
      ?auto_31668 - DIRECTION
      ?auto_31671 - INSTRUMENT
      ?auto_31667 - MODE
      ?auto_31666 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31664 ?auto_31661 ) ) ( ON_BOARD ?auto_31669 ?auto_31665 ) ( SUPPORTS ?auto_31669 ?auto_31663 ) ( not ( = ?auto_31664 ?auto_31670 ) ) ( not ( = ?auto_31661 ?auto_31670 ) ) ( not ( = ?auto_31662 ?auto_31663 ) ) ( CALIBRATION_TARGET ?auto_31669 ?auto_31670 ) ( not ( = ?auto_31670 ?auto_31668 ) ) ( not ( = ?auto_31664 ?auto_31668 ) ) ( not ( = ?auto_31661 ?auto_31668 ) ) ( ON_BOARD ?auto_31671 ?auto_31665 ) ( not ( = ?auto_31669 ?auto_31671 ) ) ( SUPPORTS ?auto_31671 ?auto_31667 ) ( not ( = ?auto_31662 ?auto_31667 ) ) ( not ( = ?auto_31663 ?auto_31667 ) ) ( CALIBRATION_TARGET ?auto_31671 ?auto_31670 ) ( ON_BOARD ?auto_31666 ?auto_31665 ) ( POWER_ON ?auto_31666 ) ( not ( = ?auto_31669 ?auto_31666 ) ) ( not ( = ?auto_31671 ?auto_31666 ) ) ( SUPPORTS ?auto_31666 ?auto_31662 ) ( POINTING ?auto_31665 ?auto_31670 ) ( CALIBRATION_TARGET ?auto_31666 ?auto_31670 ) ( NOT_CALIBRATED ?auto_31666 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_31664 ?auto_31663 )
      ( GET-2IMAGE-VERIFY ?auto_31661 ?auto_31662 ?auto_31664 ?auto_31663 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31672 - DIRECTION
      ?auto_31673 - MODE
      ?auto_31675 - DIRECTION
      ?auto_31674 - MODE
    )
    :vars
    (
      ?auto_31682 - DIRECTION
      ?auto_31677 - INSTRUMENT
      ?auto_31679 - SATELLITE
      ?auto_31676 - DIRECTION
      ?auto_31681 - MODE
      ?auto_31680 - INSTRUMENT
      ?auto_31678 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31675 ?auto_31672 ) ) ( not ( = ?auto_31675 ?auto_31682 ) ) ( ON_BOARD ?auto_31677 ?auto_31679 ) ( SUPPORTS ?auto_31677 ?auto_31674 ) ( not ( = ?auto_31675 ?auto_31676 ) ) ( not ( = ?auto_31682 ?auto_31676 ) ) ( not ( = ?auto_31681 ?auto_31674 ) ) ( CALIBRATION_TARGET ?auto_31677 ?auto_31676 ) ( not ( = ?auto_31676 ?auto_31672 ) ) ( not ( = ?auto_31682 ?auto_31672 ) ) ( ON_BOARD ?auto_31680 ?auto_31679 ) ( not ( = ?auto_31677 ?auto_31680 ) ) ( SUPPORTS ?auto_31680 ?auto_31673 ) ( not ( = ?auto_31681 ?auto_31673 ) ) ( not ( = ?auto_31674 ?auto_31673 ) ) ( CALIBRATION_TARGET ?auto_31680 ?auto_31676 ) ( ON_BOARD ?auto_31678 ?auto_31679 ) ( POWER_ON ?auto_31678 ) ( not ( = ?auto_31677 ?auto_31678 ) ) ( not ( = ?auto_31680 ?auto_31678 ) ) ( SUPPORTS ?auto_31678 ?auto_31681 ) ( POINTING ?auto_31679 ?auto_31676 ) ( CALIBRATION_TARGET ?auto_31678 ?auto_31676 ) ( NOT_CALIBRATED ?auto_31678 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31682 ?auto_31681 ?auto_31675 ?auto_31674 )
      ( GET-2IMAGE-VERIFY ?auto_31672 ?auto_31673 ?auto_31675 ?auto_31674 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31683 - DIRECTION
      ?auto_31684 - MODE
      ?auto_31686 - DIRECTION
      ?auto_31685 - MODE
    )
    :vars
    (
      ?auto_31690 - INSTRUMENT
      ?auto_31692 - SATELLITE
      ?auto_31689 - DIRECTION
      ?auto_31687 - DIRECTION
      ?auto_31693 - INSTRUMENT
      ?auto_31688 - MODE
      ?auto_31691 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31686 ?auto_31683 ) ) ( ON_BOARD ?auto_31690 ?auto_31692 ) ( SUPPORTS ?auto_31690 ?auto_31684 ) ( not ( = ?auto_31683 ?auto_31689 ) ) ( not ( = ?auto_31686 ?auto_31689 ) ) ( not ( = ?auto_31685 ?auto_31684 ) ) ( CALIBRATION_TARGET ?auto_31690 ?auto_31689 ) ( not ( = ?auto_31689 ?auto_31687 ) ) ( not ( = ?auto_31683 ?auto_31687 ) ) ( not ( = ?auto_31686 ?auto_31687 ) ) ( ON_BOARD ?auto_31693 ?auto_31692 ) ( not ( = ?auto_31690 ?auto_31693 ) ) ( SUPPORTS ?auto_31693 ?auto_31688 ) ( not ( = ?auto_31685 ?auto_31688 ) ) ( not ( = ?auto_31684 ?auto_31688 ) ) ( CALIBRATION_TARGET ?auto_31693 ?auto_31689 ) ( ON_BOARD ?auto_31691 ?auto_31692 ) ( POWER_ON ?auto_31691 ) ( not ( = ?auto_31690 ?auto_31691 ) ) ( not ( = ?auto_31693 ?auto_31691 ) ) ( SUPPORTS ?auto_31691 ?auto_31685 ) ( POINTING ?auto_31692 ?auto_31689 ) ( CALIBRATION_TARGET ?auto_31691 ?auto_31689 ) ( NOT_CALIBRATED ?auto_31691 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31686 ?auto_31685 ?auto_31683 ?auto_31684 )
      ( GET-2IMAGE-VERIFY ?auto_31683 ?auto_31684 ?auto_31686 ?auto_31685 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31694 - DIRECTION
      ?auto_31695 - MODE
      ?auto_31697 - DIRECTION
      ?auto_31696 - MODE
    )
    :vars
    (
      ?auto_31704 - DIRECTION
      ?auto_31699 - INSTRUMENT
      ?auto_31701 - SATELLITE
      ?auto_31698 - DIRECTION
      ?auto_31703 - MODE
      ?auto_31702 - INSTRUMENT
      ?auto_31700 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31697 ?auto_31694 ) ) ( not ( = ?auto_31694 ?auto_31704 ) ) ( ON_BOARD ?auto_31699 ?auto_31701 ) ( SUPPORTS ?auto_31699 ?auto_31695 ) ( not ( = ?auto_31694 ?auto_31698 ) ) ( not ( = ?auto_31704 ?auto_31698 ) ) ( not ( = ?auto_31703 ?auto_31695 ) ) ( CALIBRATION_TARGET ?auto_31699 ?auto_31698 ) ( not ( = ?auto_31698 ?auto_31697 ) ) ( not ( = ?auto_31704 ?auto_31697 ) ) ( ON_BOARD ?auto_31702 ?auto_31701 ) ( not ( = ?auto_31699 ?auto_31702 ) ) ( SUPPORTS ?auto_31702 ?auto_31696 ) ( not ( = ?auto_31703 ?auto_31696 ) ) ( not ( = ?auto_31695 ?auto_31696 ) ) ( CALIBRATION_TARGET ?auto_31702 ?auto_31698 ) ( ON_BOARD ?auto_31700 ?auto_31701 ) ( POWER_ON ?auto_31700 ) ( not ( = ?auto_31699 ?auto_31700 ) ) ( not ( = ?auto_31702 ?auto_31700 ) ) ( SUPPORTS ?auto_31700 ?auto_31703 ) ( POINTING ?auto_31701 ?auto_31698 ) ( CALIBRATION_TARGET ?auto_31700 ?auto_31698 ) ( NOT_CALIBRATED ?auto_31700 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31704 ?auto_31703 ?auto_31694 ?auto_31695 )
      ( GET-2IMAGE-VERIFY ?auto_31694 ?auto_31695 ?auto_31697 ?auto_31696 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31731 - DIRECTION
      ?auto_31732 - MODE
      ?auto_31734 - DIRECTION
      ?auto_31733 - MODE
      ?auto_31736 - DIRECTION
      ?auto_31735 - MODE
    )
    :vars
    (
      ?auto_31738 - INSTRUMENT
      ?auto_31740 - SATELLITE
      ?auto_31737 - DIRECTION
      ?auto_31741 - INSTRUMENT
      ?auto_31739 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31734 ?auto_31731 ) ) ( not ( = ?auto_31736 ?auto_31731 ) ) ( not ( = ?auto_31736 ?auto_31734 ) ) ( ON_BOARD ?auto_31738 ?auto_31740 ) ( SUPPORTS ?auto_31738 ?auto_31735 ) ( not ( = ?auto_31736 ?auto_31737 ) ) ( not ( = ?auto_31731 ?auto_31737 ) ) ( not ( = ?auto_31732 ?auto_31735 ) ) ( CALIBRATION_TARGET ?auto_31738 ?auto_31737 ) ( not ( = ?auto_31737 ?auto_31734 ) ) ( ON_BOARD ?auto_31741 ?auto_31740 ) ( not ( = ?auto_31738 ?auto_31741 ) ) ( SUPPORTS ?auto_31741 ?auto_31733 ) ( not ( = ?auto_31732 ?auto_31733 ) ) ( not ( = ?auto_31735 ?auto_31733 ) ) ( CALIBRATION_TARGET ?auto_31741 ?auto_31737 ) ( ON_BOARD ?auto_31739 ?auto_31740 ) ( POWER_ON ?auto_31739 ) ( not ( = ?auto_31738 ?auto_31739 ) ) ( not ( = ?auto_31741 ?auto_31739 ) ) ( SUPPORTS ?auto_31739 ?auto_31732 ) ( POINTING ?auto_31740 ?auto_31737 ) ( CALIBRATION_TARGET ?auto_31739 ?auto_31737 ) ( NOT_CALIBRATED ?auto_31739 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31731 ?auto_31732 ?auto_31736 ?auto_31735 )
      ( GET-3IMAGE-VERIFY ?auto_31731 ?auto_31732 ?auto_31734 ?auto_31733 ?auto_31736 ?auto_31735 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31755 - DIRECTION
      ?auto_31756 - MODE
      ?auto_31758 - DIRECTION
      ?auto_31757 - MODE
      ?auto_31760 - DIRECTION
      ?auto_31759 - MODE
    )
    :vars
    (
      ?auto_31762 - INSTRUMENT
      ?auto_31764 - SATELLITE
      ?auto_31761 - DIRECTION
      ?auto_31765 - INSTRUMENT
      ?auto_31763 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31758 ?auto_31755 ) ) ( not ( = ?auto_31760 ?auto_31755 ) ) ( not ( = ?auto_31760 ?auto_31758 ) ) ( ON_BOARD ?auto_31762 ?auto_31764 ) ( SUPPORTS ?auto_31762 ?auto_31757 ) ( not ( = ?auto_31758 ?auto_31761 ) ) ( not ( = ?auto_31755 ?auto_31761 ) ) ( not ( = ?auto_31756 ?auto_31757 ) ) ( CALIBRATION_TARGET ?auto_31762 ?auto_31761 ) ( not ( = ?auto_31761 ?auto_31760 ) ) ( ON_BOARD ?auto_31765 ?auto_31764 ) ( not ( = ?auto_31762 ?auto_31765 ) ) ( SUPPORTS ?auto_31765 ?auto_31759 ) ( not ( = ?auto_31756 ?auto_31759 ) ) ( not ( = ?auto_31757 ?auto_31759 ) ) ( CALIBRATION_TARGET ?auto_31765 ?auto_31761 ) ( ON_BOARD ?auto_31763 ?auto_31764 ) ( POWER_ON ?auto_31763 ) ( not ( = ?auto_31762 ?auto_31763 ) ) ( not ( = ?auto_31765 ?auto_31763 ) ) ( SUPPORTS ?auto_31763 ?auto_31756 ) ( POINTING ?auto_31764 ?auto_31761 ) ( CALIBRATION_TARGET ?auto_31763 ?auto_31761 ) ( NOT_CALIBRATED ?auto_31763 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31755 ?auto_31756 ?auto_31758 ?auto_31757 )
      ( GET-3IMAGE-VERIFY ?auto_31755 ?auto_31756 ?auto_31758 ?auto_31757 ?auto_31760 ?auto_31759 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31779 - DIRECTION
      ?auto_31780 - MODE
      ?auto_31782 - DIRECTION
      ?auto_31781 - MODE
      ?auto_31784 - DIRECTION
      ?auto_31783 - MODE
    )
    :vars
    (
      ?auto_31786 - INSTRUMENT
      ?auto_31788 - SATELLITE
      ?auto_31785 - DIRECTION
      ?auto_31789 - INSTRUMENT
      ?auto_31787 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31782 ?auto_31779 ) ) ( not ( = ?auto_31784 ?auto_31779 ) ) ( not ( = ?auto_31784 ?auto_31782 ) ) ( ON_BOARD ?auto_31786 ?auto_31788 ) ( SUPPORTS ?auto_31786 ?auto_31783 ) ( not ( = ?auto_31784 ?auto_31785 ) ) ( not ( = ?auto_31782 ?auto_31785 ) ) ( not ( = ?auto_31781 ?auto_31783 ) ) ( CALIBRATION_TARGET ?auto_31786 ?auto_31785 ) ( not ( = ?auto_31785 ?auto_31779 ) ) ( ON_BOARD ?auto_31789 ?auto_31788 ) ( not ( = ?auto_31786 ?auto_31789 ) ) ( SUPPORTS ?auto_31789 ?auto_31780 ) ( not ( = ?auto_31781 ?auto_31780 ) ) ( not ( = ?auto_31783 ?auto_31780 ) ) ( CALIBRATION_TARGET ?auto_31789 ?auto_31785 ) ( ON_BOARD ?auto_31787 ?auto_31788 ) ( POWER_ON ?auto_31787 ) ( not ( = ?auto_31786 ?auto_31787 ) ) ( not ( = ?auto_31789 ?auto_31787 ) ) ( SUPPORTS ?auto_31787 ?auto_31781 ) ( POINTING ?auto_31788 ?auto_31785 ) ( CALIBRATION_TARGET ?auto_31787 ?auto_31785 ) ( NOT_CALIBRATED ?auto_31787 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31782 ?auto_31781 ?auto_31784 ?auto_31783 )
      ( GET-3IMAGE-VERIFY ?auto_31779 ?auto_31780 ?auto_31782 ?auto_31781 ?auto_31784 ?auto_31783 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31803 - DIRECTION
      ?auto_31804 - MODE
      ?auto_31806 - DIRECTION
      ?auto_31805 - MODE
      ?auto_31808 - DIRECTION
      ?auto_31807 - MODE
    )
    :vars
    (
      ?auto_31810 - INSTRUMENT
      ?auto_31812 - SATELLITE
      ?auto_31809 - DIRECTION
      ?auto_31813 - INSTRUMENT
      ?auto_31811 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31806 ?auto_31803 ) ) ( not ( = ?auto_31808 ?auto_31803 ) ) ( not ( = ?auto_31808 ?auto_31806 ) ) ( ON_BOARD ?auto_31810 ?auto_31812 ) ( SUPPORTS ?auto_31810 ?auto_31805 ) ( not ( = ?auto_31806 ?auto_31809 ) ) ( not ( = ?auto_31808 ?auto_31809 ) ) ( not ( = ?auto_31807 ?auto_31805 ) ) ( CALIBRATION_TARGET ?auto_31810 ?auto_31809 ) ( not ( = ?auto_31809 ?auto_31803 ) ) ( ON_BOARD ?auto_31813 ?auto_31812 ) ( not ( = ?auto_31810 ?auto_31813 ) ) ( SUPPORTS ?auto_31813 ?auto_31804 ) ( not ( = ?auto_31807 ?auto_31804 ) ) ( not ( = ?auto_31805 ?auto_31804 ) ) ( CALIBRATION_TARGET ?auto_31813 ?auto_31809 ) ( ON_BOARD ?auto_31811 ?auto_31812 ) ( POWER_ON ?auto_31811 ) ( not ( = ?auto_31810 ?auto_31811 ) ) ( not ( = ?auto_31813 ?auto_31811 ) ) ( SUPPORTS ?auto_31811 ?auto_31807 ) ( POINTING ?auto_31812 ?auto_31809 ) ( CALIBRATION_TARGET ?auto_31811 ?auto_31809 ) ( NOT_CALIBRATED ?auto_31811 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31808 ?auto_31807 ?auto_31806 ?auto_31805 )
      ( GET-3IMAGE-VERIFY ?auto_31803 ?auto_31804 ?auto_31806 ?auto_31805 ?auto_31808 ?auto_31807 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31853 - DIRECTION
      ?auto_31854 - MODE
      ?auto_31856 - DIRECTION
      ?auto_31855 - MODE
      ?auto_31858 - DIRECTION
      ?auto_31857 - MODE
    )
    :vars
    (
      ?auto_31860 - INSTRUMENT
      ?auto_31862 - SATELLITE
      ?auto_31859 - DIRECTION
      ?auto_31863 - INSTRUMENT
      ?auto_31861 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31856 ?auto_31853 ) ) ( not ( = ?auto_31858 ?auto_31853 ) ) ( not ( = ?auto_31858 ?auto_31856 ) ) ( ON_BOARD ?auto_31860 ?auto_31862 ) ( SUPPORTS ?auto_31860 ?auto_31854 ) ( not ( = ?auto_31853 ?auto_31859 ) ) ( not ( = ?auto_31856 ?auto_31859 ) ) ( not ( = ?auto_31855 ?auto_31854 ) ) ( CALIBRATION_TARGET ?auto_31860 ?auto_31859 ) ( not ( = ?auto_31859 ?auto_31858 ) ) ( ON_BOARD ?auto_31863 ?auto_31862 ) ( not ( = ?auto_31860 ?auto_31863 ) ) ( SUPPORTS ?auto_31863 ?auto_31857 ) ( not ( = ?auto_31855 ?auto_31857 ) ) ( not ( = ?auto_31854 ?auto_31857 ) ) ( CALIBRATION_TARGET ?auto_31863 ?auto_31859 ) ( ON_BOARD ?auto_31861 ?auto_31862 ) ( POWER_ON ?auto_31861 ) ( not ( = ?auto_31860 ?auto_31861 ) ) ( not ( = ?auto_31863 ?auto_31861 ) ) ( SUPPORTS ?auto_31861 ?auto_31855 ) ( POINTING ?auto_31862 ?auto_31859 ) ( CALIBRATION_TARGET ?auto_31861 ?auto_31859 ) ( NOT_CALIBRATED ?auto_31861 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31856 ?auto_31855 ?auto_31853 ?auto_31854 )
      ( GET-3IMAGE-VERIFY ?auto_31853 ?auto_31854 ?auto_31856 ?auto_31855 ?auto_31858 ?auto_31857 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_31877 - DIRECTION
      ?auto_31878 - MODE
      ?auto_31880 - DIRECTION
      ?auto_31879 - MODE
      ?auto_31882 - DIRECTION
      ?auto_31881 - MODE
    )
    :vars
    (
      ?auto_31884 - INSTRUMENT
      ?auto_31886 - SATELLITE
      ?auto_31883 - DIRECTION
      ?auto_31887 - INSTRUMENT
      ?auto_31885 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31880 ?auto_31877 ) ) ( not ( = ?auto_31882 ?auto_31877 ) ) ( not ( = ?auto_31882 ?auto_31880 ) ) ( ON_BOARD ?auto_31884 ?auto_31886 ) ( SUPPORTS ?auto_31884 ?auto_31878 ) ( not ( = ?auto_31877 ?auto_31883 ) ) ( not ( = ?auto_31882 ?auto_31883 ) ) ( not ( = ?auto_31881 ?auto_31878 ) ) ( CALIBRATION_TARGET ?auto_31884 ?auto_31883 ) ( not ( = ?auto_31883 ?auto_31880 ) ) ( ON_BOARD ?auto_31887 ?auto_31886 ) ( not ( = ?auto_31884 ?auto_31887 ) ) ( SUPPORTS ?auto_31887 ?auto_31879 ) ( not ( = ?auto_31881 ?auto_31879 ) ) ( not ( = ?auto_31878 ?auto_31879 ) ) ( CALIBRATION_TARGET ?auto_31887 ?auto_31883 ) ( ON_BOARD ?auto_31885 ?auto_31886 ) ( POWER_ON ?auto_31885 ) ( not ( = ?auto_31884 ?auto_31885 ) ) ( not ( = ?auto_31887 ?auto_31885 ) ) ( SUPPORTS ?auto_31885 ?auto_31881 ) ( POINTING ?auto_31886 ?auto_31883 ) ( CALIBRATION_TARGET ?auto_31885 ?auto_31883 ) ( NOT_CALIBRATED ?auto_31885 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31882 ?auto_31881 ?auto_31877 ?auto_31878 )
      ( GET-3IMAGE-VERIFY ?auto_31877 ?auto_31878 ?auto_31880 ?auto_31879 ?auto_31882 ?auto_31881 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_31955 - DIRECTION
      ?auto_31956 - MODE
    )
    :vars
    (
      ?auto_31965 - DIRECTION
      ?auto_31960 - INSTRUMENT
      ?auto_31962 - SATELLITE
      ?auto_31959 - DIRECTION
      ?auto_31964 - MODE
      ?auto_31957 - DIRECTION
      ?auto_31963 - INSTRUMENT
      ?auto_31958 - MODE
      ?auto_31961 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31955 ?auto_31965 ) ) ( ON_BOARD ?auto_31960 ?auto_31962 ) ( SUPPORTS ?auto_31960 ?auto_31956 ) ( not ( = ?auto_31955 ?auto_31959 ) ) ( not ( = ?auto_31965 ?auto_31959 ) ) ( not ( = ?auto_31964 ?auto_31956 ) ) ( CALIBRATION_TARGET ?auto_31960 ?auto_31959 ) ( not ( = ?auto_31959 ?auto_31957 ) ) ( not ( = ?auto_31955 ?auto_31957 ) ) ( not ( = ?auto_31965 ?auto_31957 ) ) ( ON_BOARD ?auto_31963 ?auto_31962 ) ( not ( = ?auto_31960 ?auto_31963 ) ) ( SUPPORTS ?auto_31963 ?auto_31958 ) ( not ( = ?auto_31964 ?auto_31958 ) ) ( not ( = ?auto_31956 ?auto_31958 ) ) ( CALIBRATION_TARGET ?auto_31963 ?auto_31959 ) ( ON_BOARD ?auto_31961 ?auto_31962 ) ( not ( = ?auto_31960 ?auto_31961 ) ) ( not ( = ?auto_31963 ?auto_31961 ) ) ( SUPPORTS ?auto_31961 ?auto_31964 ) ( POINTING ?auto_31962 ?auto_31959 ) ( CALIBRATION_TARGET ?auto_31961 ?auto_31959 ) ( POWER_AVAIL ?auto_31962 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_31961 ?auto_31962 )
      ( GET-2IMAGE ?auto_31965 ?auto_31964 ?auto_31955 ?auto_31956 )
      ( GET-1IMAGE-VERIFY ?auto_31955 ?auto_31956 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31966 - DIRECTION
      ?auto_31967 - MODE
      ?auto_31969 - DIRECTION
      ?auto_31968 - MODE
    )
    :vars
    (
      ?auto_31975 - INSTRUMENT
      ?auto_31970 - SATELLITE
      ?auto_31971 - DIRECTION
      ?auto_31976 - DIRECTION
      ?auto_31973 - INSTRUMENT
      ?auto_31974 - MODE
      ?auto_31972 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31969 ?auto_31966 ) ) ( ON_BOARD ?auto_31975 ?auto_31970 ) ( SUPPORTS ?auto_31975 ?auto_31968 ) ( not ( = ?auto_31969 ?auto_31971 ) ) ( not ( = ?auto_31966 ?auto_31971 ) ) ( not ( = ?auto_31967 ?auto_31968 ) ) ( CALIBRATION_TARGET ?auto_31975 ?auto_31971 ) ( not ( = ?auto_31971 ?auto_31976 ) ) ( not ( = ?auto_31969 ?auto_31976 ) ) ( not ( = ?auto_31966 ?auto_31976 ) ) ( ON_BOARD ?auto_31973 ?auto_31970 ) ( not ( = ?auto_31975 ?auto_31973 ) ) ( SUPPORTS ?auto_31973 ?auto_31974 ) ( not ( = ?auto_31967 ?auto_31974 ) ) ( not ( = ?auto_31968 ?auto_31974 ) ) ( CALIBRATION_TARGET ?auto_31973 ?auto_31971 ) ( ON_BOARD ?auto_31972 ?auto_31970 ) ( not ( = ?auto_31975 ?auto_31972 ) ) ( not ( = ?auto_31973 ?auto_31972 ) ) ( SUPPORTS ?auto_31972 ?auto_31967 ) ( POINTING ?auto_31970 ?auto_31971 ) ( CALIBRATION_TARGET ?auto_31972 ?auto_31971 ) ( POWER_AVAIL ?auto_31970 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_31969 ?auto_31968 )
      ( GET-2IMAGE-VERIFY ?auto_31966 ?auto_31967 ?auto_31969 ?auto_31968 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31977 - DIRECTION
      ?auto_31978 - MODE
      ?auto_31980 - DIRECTION
      ?auto_31979 - MODE
    )
    :vars
    (
      ?auto_31987 - DIRECTION
      ?auto_31983 - INSTRUMENT
      ?auto_31984 - SATELLITE
      ?auto_31982 - DIRECTION
      ?auto_31986 - MODE
      ?auto_31985 - INSTRUMENT
      ?auto_31981 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31980 ?auto_31977 ) ) ( not ( = ?auto_31980 ?auto_31987 ) ) ( ON_BOARD ?auto_31983 ?auto_31984 ) ( SUPPORTS ?auto_31983 ?auto_31979 ) ( not ( = ?auto_31980 ?auto_31982 ) ) ( not ( = ?auto_31987 ?auto_31982 ) ) ( not ( = ?auto_31986 ?auto_31979 ) ) ( CALIBRATION_TARGET ?auto_31983 ?auto_31982 ) ( not ( = ?auto_31982 ?auto_31977 ) ) ( not ( = ?auto_31987 ?auto_31977 ) ) ( ON_BOARD ?auto_31985 ?auto_31984 ) ( not ( = ?auto_31983 ?auto_31985 ) ) ( SUPPORTS ?auto_31985 ?auto_31978 ) ( not ( = ?auto_31986 ?auto_31978 ) ) ( not ( = ?auto_31979 ?auto_31978 ) ) ( CALIBRATION_TARGET ?auto_31985 ?auto_31982 ) ( ON_BOARD ?auto_31981 ?auto_31984 ) ( not ( = ?auto_31983 ?auto_31981 ) ) ( not ( = ?auto_31985 ?auto_31981 ) ) ( SUPPORTS ?auto_31981 ?auto_31986 ) ( POINTING ?auto_31984 ?auto_31982 ) ( CALIBRATION_TARGET ?auto_31981 ?auto_31982 ) ( POWER_AVAIL ?auto_31984 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31987 ?auto_31986 ?auto_31980 ?auto_31979 )
      ( GET-2IMAGE-VERIFY ?auto_31977 ?auto_31978 ?auto_31980 ?auto_31979 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31988 - DIRECTION
      ?auto_31989 - MODE
      ?auto_31991 - DIRECTION
      ?auto_31990 - MODE
    )
    :vars
    (
      ?auto_31996 - INSTRUMENT
      ?auto_31997 - SATELLITE
      ?auto_31995 - DIRECTION
      ?auto_31992 - DIRECTION
      ?auto_31998 - INSTRUMENT
      ?auto_31994 - MODE
      ?auto_31993 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31991 ?auto_31988 ) ) ( ON_BOARD ?auto_31996 ?auto_31997 ) ( SUPPORTS ?auto_31996 ?auto_31989 ) ( not ( = ?auto_31988 ?auto_31995 ) ) ( not ( = ?auto_31991 ?auto_31995 ) ) ( not ( = ?auto_31990 ?auto_31989 ) ) ( CALIBRATION_TARGET ?auto_31996 ?auto_31995 ) ( not ( = ?auto_31995 ?auto_31992 ) ) ( not ( = ?auto_31988 ?auto_31992 ) ) ( not ( = ?auto_31991 ?auto_31992 ) ) ( ON_BOARD ?auto_31998 ?auto_31997 ) ( not ( = ?auto_31996 ?auto_31998 ) ) ( SUPPORTS ?auto_31998 ?auto_31994 ) ( not ( = ?auto_31990 ?auto_31994 ) ) ( not ( = ?auto_31989 ?auto_31994 ) ) ( CALIBRATION_TARGET ?auto_31998 ?auto_31995 ) ( ON_BOARD ?auto_31993 ?auto_31997 ) ( not ( = ?auto_31996 ?auto_31993 ) ) ( not ( = ?auto_31998 ?auto_31993 ) ) ( SUPPORTS ?auto_31993 ?auto_31990 ) ( POINTING ?auto_31997 ?auto_31995 ) ( CALIBRATION_TARGET ?auto_31993 ?auto_31995 ) ( POWER_AVAIL ?auto_31997 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31991 ?auto_31990 ?auto_31988 ?auto_31989 )
      ( GET-2IMAGE-VERIFY ?auto_31988 ?auto_31989 ?auto_31991 ?auto_31990 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31999 - DIRECTION
      ?auto_32000 - MODE
      ?auto_32002 - DIRECTION
      ?auto_32001 - MODE
    )
    :vars
    (
      ?auto_32009 - DIRECTION
      ?auto_32005 - INSTRUMENT
      ?auto_32006 - SATELLITE
      ?auto_32004 - DIRECTION
      ?auto_32008 - MODE
      ?auto_32007 - INSTRUMENT
      ?auto_32003 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_32002 ?auto_31999 ) ) ( not ( = ?auto_31999 ?auto_32009 ) ) ( ON_BOARD ?auto_32005 ?auto_32006 ) ( SUPPORTS ?auto_32005 ?auto_32000 ) ( not ( = ?auto_31999 ?auto_32004 ) ) ( not ( = ?auto_32009 ?auto_32004 ) ) ( not ( = ?auto_32008 ?auto_32000 ) ) ( CALIBRATION_TARGET ?auto_32005 ?auto_32004 ) ( not ( = ?auto_32004 ?auto_32002 ) ) ( not ( = ?auto_32009 ?auto_32002 ) ) ( ON_BOARD ?auto_32007 ?auto_32006 ) ( not ( = ?auto_32005 ?auto_32007 ) ) ( SUPPORTS ?auto_32007 ?auto_32001 ) ( not ( = ?auto_32008 ?auto_32001 ) ) ( not ( = ?auto_32000 ?auto_32001 ) ) ( CALIBRATION_TARGET ?auto_32007 ?auto_32004 ) ( ON_BOARD ?auto_32003 ?auto_32006 ) ( not ( = ?auto_32005 ?auto_32003 ) ) ( not ( = ?auto_32007 ?auto_32003 ) ) ( SUPPORTS ?auto_32003 ?auto_32008 ) ( POINTING ?auto_32006 ?auto_32004 ) ( CALIBRATION_TARGET ?auto_32003 ?auto_32004 ) ( POWER_AVAIL ?auto_32006 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32009 ?auto_32008 ?auto_31999 ?auto_32000 )
      ( GET-2IMAGE-VERIFY ?auto_31999 ?auto_32000 ?auto_32002 ?auto_32001 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_32036 - DIRECTION
      ?auto_32037 - MODE
      ?auto_32039 - DIRECTION
      ?auto_32038 - MODE
      ?auto_32041 - DIRECTION
      ?auto_32040 - MODE
    )
    :vars
    (
      ?auto_32044 - INSTRUMENT
      ?auto_32045 - SATELLITE
      ?auto_32043 - DIRECTION
      ?auto_32046 - INSTRUMENT
      ?auto_32042 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_32039 ?auto_32036 ) ) ( not ( = ?auto_32041 ?auto_32036 ) ) ( not ( = ?auto_32041 ?auto_32039 ) ) ( ON_BOARD ?auto_32044 ?auto_32045 ) ( SUPPORTS ?auto_32044 ?auto_32040 ) ( not ( = ?auto_32041 ?auto_32043 ) ) ( not ( = ?auto_32036 ?auto_32043 ) ) ( not ( = ?auto_32037 ?auto_32040 ) ) ( CALIBRATION_TARGET ?auto_32044 ?auto_32043 ) ( not ( = ?auto_32043 ?auto_32039 ) ) ( ON_BOARD ?auto_32046 ?auto_32045 ) ( not ( = ?auto_32044 ?auto_32046 ) ) ( SUPPORTS ?auto_32046 ?auto_32038 ) ( not ( = ?auto_32037 ?auto_32038 ) ) ( not ( = ?auto_32040 ?auto_32038 ) ) ( CALIBRATION_TARGET ?auto_32046 ?auto_32043 ) ( ON_BOARD ?auto_32042 ?auto_32045 ) ( not ( = ?auto_32044 ?auto_32042 ) ) ( not ( = ?auto_32046 ?auto_32042 ) ) ( SUPPORTS ?auto_32042 ?auto_32037 ) ( POINTING ?auto_32045 ?auto_32043 ) ( CALIBRATION_TARGET ?auto_32042 ?auto_32043 ) ( POWER_AVAIL ?auto_32045 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32036 ?auto_32037 ?auto_32041 ?auto_32040 )
      ( GET-3IMAGE-VERIFY ?auto_32036 ?auto_32037 ?auto_32039 ?auto_32038 ?auto_32041 ?auto_32040 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_32060 - DIRECTION
      ?auto_32061 - MODE
      ?auto_32063 - DIRECTION
      ?auto_32062 - MODE
      ?auto_32065 - DIRECTION
      ?auto_32064 - MODE
    )
    :vars
    (
      ?auto_32068 - INSTRUMENT
      ?auto_32069 - SATELLITE
      ?auto_32067 - DIRECTION
      ?auto_32070 - INSTRUMENT
      ?auto_32066 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_32063 ?auto_32060 ) ) ( not ( = ?auto_32065 ?auto_32060 ) ) ( not ( = ?auto_32065 ?auto_32063 ) ) ( ON_BOARD ?auto_32068 ?auto_32069 ) ( SUPPORTS ?auto_32068 ?auto_32062 ) ( not ( = ?auto_32063 ?auto_32067 ) ) ( not ( = ?auto_32060 ?auto_32067 ) ) ( not ( = ?auto_32061 ?auto_32062 ) ) ( CALIBRATION_TARGET ?auto_32068 ?auto_32067 ) ( not ( = ?auto_32067 ?auto_32065 ) ) ( ON_BOARD ?auto_32070 ?auto_32069 ) ( not ( = ?auto_32068 ?auto_32070 ) ) ( SUPPORTS ?auto_32070 ?auto_32064 ) ( not ( = ?auto_32061 ?auto_32064 ) ) ( not ( = ?auto_32062 ?auto_32064 ) ) ( CALIBRATION_TARGET ?auto_32070 ?auto_32067 ) ( ON_BOARD ?auto_32066 ?auto_32069 ) ( not ( = ?auto_32068 ?auto_32066 ) ) ( not ( = ?auto_32070 ?auto_32066 ) ) ( SUPPORTS ?auto_32066 ?auto_32061 ) ( POINTING ?auto_32069 ?auto_32067 ) ( CALIBRATION_TARGET ?auto_32066 ?auto_32067 ) ( POWER_AVAIL ?auto_32069 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32060 ?auto_32061 ?auto_32063 ?auto_32062 )
      ( GET-3IMAGE-VERIFY ?auto_32060 ?auto_32061 ?auto_32063 ?auto_32062 ?auto_32065 ?auto_32064 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_32084 - DIRECTION
      ?auto_32085 - MODE
      ?auto_32087 - DIRECTION
      ?auto_32086 - MODE
      ?auto_32089 - DIRECTION
      ?auto_32088 - MODE
    )
    :vars
    (
      ?auto_32092 - INSTRUMENT
      ?auto_32093 - SATELLITE
      ?auto_32091 - DIRECTION
      ?auto_32094 - INSTRUMENT
      ?auto_32090 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_32087 ?auto_32084 ) ) ( not ( = ?auto_32089 ?auto_32084 ) ) ( not ( = ?auto_32089 ?auto_32087 ) ) ( ON_BOARD ?auto_32092 ?auto_32093 ) ( SUPPORTS ?auto_32092 ?auto_32088 ) ( not ( = ?auto_32089 ?auto_32091 ) ) ( not ( = ?auto_32087 ?auto_32091 ) ) ( not ( = ?auto_32086 ?auto_32088 ) ) ( CALIBRATION_TARGET ?auto_32092 ?auto_32091 ) ( not ( = ?auto_32091 ?auto_32084 ) ) ( ON_BOARD ?auto_32094 ?auto_32093 ) ( not ( = ?auto_32092 ?auto_32094 ) ) ( SUPPORTS ?auto_32094 ?auto_32085 ) ( not ( = ?auto_32086 ?auto_32085 ) ) ( not ( = ?auto_32088 ?auto_32085 ) ) ( CALIBRATION_TARGET ?auto_32094 ?auto_32091 ) ( ON_BOARD ?auto_32090 ?auto_32093 ) ( not ( = ?auto_32092 ?auto_32090 ) ) ( not ( = ?auto_32094 ?auto_32090 ) ) ( SUPPORTS ?auto_32090 ?auto_32086 ) ( POINTING ?auto_32093 ?auto_32091 ) ( CALIBRATION_TARGET ?auto_32090 ?auto_32091 ) ( POWER_AVAIL ?auto_32093 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32087 ?auto_32086 ?auto_32089 ?auto_32088 )
      ( GET-3IMAGE-VERIFY ?auto_32084 ?auto_32085 ?auto_32087 ?auto_32086 ?auto_32089 ?auto_32088 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_32108 - DIRECTION
      ?auto_32109 - MODE
      ?auto_32111 - DIRECTION
      ?auto_32110 - MODE
      ?auto_32113 - DIRECTION
      ?auto_32112 - MODE
    )
    :vars
    (
      ?auto_32116 - INSTRUMENT
      ?auto_32117 - SATELLITE
      ?auto_32115 - DIRECTION
      ?auto_32118 - INSTRUMENT
      ?auto_32114 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_32111 ?auto_32108 ) ) ( not ( = ?auto_32113 ?auto_32108 ) ) ( not ( = ?auto_32113 ?auto_32111 ) ) ( ON_BOARD ?auto_32116 ?auto_32117 ) ( SUPPORTS ?auto_32116 ?auto_32110 ) ( not ( = ?auto_32111 ?auto_32115 ) ) ( not ( = ?auto_32113 ?auto_32115 ) ) ( not ( = ?auto_32112 ?auto_32110 ) ) ( CALIBRATION_TARGET ?auto_32116 ?auto_32115 ) ( not ( = ?auto_32115 ?auto_32108 ) ) ( ON_BOARD ?auto_32118 ?auto_32117 ) ( not ( = ?auto_32116 ?auto_32118 ) ) ( SUPPORTS ?auto_32118 ?auto_32109 ) ( not ( = ?auto_32112 ?auto_32109 ) ) ( not ( = ?auto_32110 ?auto_32109 ) ) ( CALIBRATION_TARGET ?auto_32118 ?auto_32115 ) ( ON_BOARD ?auto_32114 ?auto_32117 ) ( not ( = ?auto_32116 ?auto_32114 ) ) ( not ( = ?auto_32118 ?auto_32114 ) ) ( SUPPORTS ?auto_32114 ?auto_32112 ) ( POINTING ?auto_32117 ?auto_32115 ) ( CALIBRATION_TARGET ?auto_32114 ?auto_32115 ) ( POWER_AVAIL ?auto_32117 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32113 ?auto_32112 ?auto_32111 ?auto_32110 )
      ( GET-3IMAGE-VERIFY ?auto_32108 ?auto_32109 ?auto_32111 ?auto_32110 ?auto_32113 ?auto_32112 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_32158 - DIRECTION
      ?auto_32159 - MODE
      ?auto_32161 - DIRECTION
      ?auto_32160 - MODE
      ?auto_32163 - DIRECTION
      ?auto_32162 - MODE
    )
    :vars
    (
      ?auto_32166 - INSTRUMENT
      ?auto_32167 - SATELLITE
      ?auto_32165 - DIRECTION
      ?auto_32168 - INSTRUMENT
      ?auto_32164 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_32161 ?auto_32158 ) ) ( not ( = ?auto_32163 ?auto_32158 ) ) ( not ( = ?auto_32163 ?auto_32161 ) ) ( ON_BOARD ?auto_32166 ?auto_32167 ) ( SUPPORTS ?auto_32166 ?auto_32159 ) ( not ( = ?auto_32158 ?auto_32165 ) ) ( not ( = ?auto_32161 ?auto_32165 ) ) ( not ( = ?auto_32160 ?auto_32159 ) ) ( CALIBRATION_TARGET ?auto_32166 ?auto_32165 ) ( not ( = ?auto_32165 ?auto_32163 ) ) ( ON_BOARD ?auto_32168 ?auto_32167 ) ( not ( = ?auto_32166 ?auto_32168 ) ) ( SUPPORTS ?auto_32168 ?auto_32162 ) ( not ( = ?auto_32160 ?auto_32162 ) ) ( not ( = ?auto_32159 ?auto_32162 ) ) ( CALIBRATION_TARGET ?auto_32168 ?auto_32165 ) ( ON_BOARD ?auto_32164 ?auto_32167 ) ( not ( = ?auto_32166 ?auto_32164 ) ) ( not ( = ?auto_32168 ?auto_32164 ) ) ( SUPPORTS ?auto_32164 ?auto_32160 ) ( POINTING ?auto_32167 ?auto_32165 ) ( CALIBRATION_TARGET ?auto_32164 ?auto_32165 ) ( POWER_AVAIL ?auto_32167 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32161 ?auto_32160 ?auto_32158 ?auto_32159 )
      ( GET-3IMAGE-VERIFY ?auto_32158 ?auto_32159 ?auto_32161 ?auto_32160 ?auto_32163 ?auto_32162 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_32182 - DIRECTION
      ?auto_32183 - MODE
      ?auto_32185 - DIRECTION
      ?auto_32184 - MODE
      ?auto_32187 - DIRECTION
      ?auto_32186 - MODE
    )
    :vars
    (
      ?auto_32190 - INSTRUMENT
      ?auto_32191 - SATELLITE
      ?auto_32189 - DIRECTION
      ?auto_32192 - INSTRUMENT
      ?auto_32188 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_32185 ?auto_32182 ) ) ( not ( = ?auto_32187 ?auto_32182 ) ) ( not ( = ?auto_32187 ?auto_32185 ) ) ( ON_BOARD ?auto_32190 ?auto_32191 ) ( SUPPORTS ?auto_32190 ?auto_32183 ) ( not ( = ?auto_32182 ?auto_32189 ) ) ( not ( = ?auto_32187 ?auto_32189 ) ) ( not ( = ?auto_32186 ?auto_32183 ) ) ( CALIBRATION_TARGET ?auto_32190 ?auto_32189 ) ( not ( = ?auto_32189 ?auto_32185 ) ) ( ON_BOARD ?auto_32192 ?auto_32191 ) ( not ( = ?auto_32190 ?auto_32192 ) ) ( SUPPORTS ?auto_32192 ?auto_32184 ) ( not ( = ?auto_32186 ?auto_32184 ) ) ( not ( = ?auto_32183 ?auto_32184 ) ) ( CALIBRATION_TARGET ?auto_32192 ?auto_32189 ) ( ON_BOARD ?auto_32188 ?auto_32191 ) ( not ( = ?auto_32190 ?auto_32188 ) ) ( not ( = ?auto_32192 ?auto_32188 ) ) ( SUPPORTS ?auto_32188 ?auto_32186 ) ( POINTING ?auto_32191 ?auto_32189 ) ( CALIBRATION_TARGET ?auto_32188 ?auto_32189 ) ( POWER_AVAIL ?auto_32191 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32187 ?auto_32186 ?auto_32182 ?auto_32183 )
      ( GET-3IMAGE-VERIFY ?auto_32182 ?auto_32183 ?auto_32185 ?auto_32184 ?auto_32187 ?auto_32186 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_32260 - DIRECTION
      ?auto_32261 - MODE
    )
    :vars
    (
      ?auto_32270 - DIRECTION
      ?auto_32266 - INSTRUMENT
      ?auto_32267 - SATELLITE
      ?auto_32265 - DIRECTION
      ?auto_32269 - MODE
      ?auto_32262 - DIRECTION
      ?auto_32268 - INSTRUMENT
      ?auto_32264 - MODE
      ?auto_32263 - INSTRUMENT
      ?auto_32271 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_32260 ?auto_32270 ) ) ( ON_BOARD ?auto_32266 ?auto_32267 ) ( SUPPORTS ?auto_32266 ?auto_32261 ) ( not ( = ?auto_32260 ?auto_32265 ) ) ( not ( = ?auto_32270 ?auto_32265 ) ) ( not ( = ?auto_32269 ?auto_32261 ) ) ( CALIBRATION_TARGET ?auto_32266 ?auto_32265 ) ( not ( = ?auto_32265 ?auto_32262 ) ) ( not ( = ?auto_32260 ?auto_32262 ) ) ( not ( = ?auto_32270 ?auto_32262 ) ) ( ON_BOARD ?auto_32268 ?auto_32267 ) ( not ( = ?auto_32266 ?auto_32268 ) ) ( SUPPORTS ?auto_32268 ?auto_32264 ) ( not ( = ?auto_32269 ?auto_32264 ) ) ( not ( = ?auto_32261 ?auto_32264 ) ) ( CALIBRATION_TARGET ?auto_32268 ?auto_32265 ) ( ON_BOARD ?auto_32263 ?auto_32267 ) ( not ( = ?auto_32266 ?auto_32263 ) ) ( not ( = ?auto_32268 ?auto_32263 ) ) ( SUPPORTS ?auto_32263 ?auto_32269 ) ( CALIBRATION_TARGET ?auto_32263 ?auto_32265 ) ( POWER_AVAIL ?auto_32267 ) ( POINTING ?auto_32267 ?auto_32271 ) ( not ( = ?auto_32265 ?auto_32271 ) ) ( not ( = ?auto_32260 ?auto_32271 ) ) ( not ( = ?auto_32270 ?auto_32271 ) ) ( not ( = ?auto_32262 ?auto_32271 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_32267 ?auto_32265 ?auto_32271 )
      ( GET-2IMAGE ?auto_32270 ?auto_32269 ?auto_32260 ?auto_32261 )
      ( GET-1IMAGE-VERIFY ?auto_32260 ?auto_32261 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_32272 - DIRECTION
      ?auto_32273 - MODE
      ?auto_32275 - DIRECTION
      ?auto_32274 - MODE
    )
    :vars
    (
      ?auto_32277 - INSTRUMENT
      ?auto_32276 - SATELLITE
      ?auto_32278 - DIRECTION
      ?auto_32283 - DIRECTION
      ?auto_32281 - INSTRUMENT
      ?auto_32282 - MODE
      ?auto_32280 - INSTRUMENT
      ?auto_32279 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_32275 ?auto_32272 ) ) ( ON_BOARD ?auto_32277 ?auto_32276 ) ( SUPPORTS ?auto_32277 ?auto_32274 ) ( not ( = ?auto_32275 ?auto_32278 ) ) ( not ( = ?auto_32272 ?auto_32278 ) ) ( not ( = ?auto_32273 ?auto_32274 ) ) ( CALIBRATION_TARGET ?auto_32277 ?auto_32278 ) ( not ( = ?auto_32278 ?auto_32283 ) ) ( not ( = ?auto_32275 ?auto_32283 ) ) ( not ( = ?auto_32272 ?auto_32283 ) ) ( ON_BOARD ?auto_32281 ?auto_32276 ) ( not ( = ?auto_32277 ?auto_32281 ) ) ( SUPPORTS ?auto_32281 ?auto_32282 ) ( not ( = ?auto_32273 ?auto_32282 ) ) ( not ( = ?auto_32274 ?auto_32282 ) ) ( CALIBRATION_TARGET ?auto_32281 ?auto_32278 ) ( ON_BOARD ?auto_32280 ?auto_32276 ) ( not ( = ?auto_32277 ?auto_32280 ) ) ( not ( = ?auto_32281 ?auto_32280 ) ) ( SUPPORTS ?auto_32280 ?auto_32273 ) ( CALIBRATION_TARGET ?auto_32280 ?auto_32278 ) ( POWER_AVAIL ?auto_32276 ) ( POINTING ?auto_32276 ?auto_32279 ) ( not ( = ?auto_32278 ?auto_32279 ) ) ( not ( = ?auto_32275 ?auto_32279 ) ) ( not ( = ?auto_32272 ?auto_32279 ) ) ( not ( = ?auto_32283 ?auto_32279 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_32275 ?auto_32274 )
      ( GET-2IMAGE-VERIFY ?auto_32272 ?auto_32273 ?auto_32275 ?auto_32274 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_32284 - DIRECTION
      ?auto_32285 - MODE
      ?auto_32287 - DIRECTION
      ?auto_32286 - MODE
    )
    :vars
    (
      ?auto_32295 - DIRECTION
      ?auto_32290 - INSTRUMENT
      ?auto_32291 - SATELLITE
      ?auto_32288 - DIRECTION
      ?auto_32294 - MODE
      ?auto_32293 - INSTRUMENT
      ?auto_32292 - INSTRUMENT
      ?auto_32289 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_32287 ?auto_32284 ) ) ( not ( = ?auto_32287 ?auto_32295 ) ) ( ON_BOARD ?auto_32290 ?auto_32291 ) ( SUPPORTS ?auto_32290 ?auto_32286 ) ( not ( = ?auto_32287 ?auto_32288 ) ) ( not ( = ?auto_32295 ?auto_32288 ) ) ( not ( = ?auto_32294 ?auto_32286 ) ) ( CALIBRATION_TARGET ?auto_32290 ?auto_32288 ) ( not ( = ?auto_32288 ?auto_32284 ) ) ( not ( = ?auto_32295 ?auto_32284 ) ) ( ON_BOARD ?auto_32293 ?auto_32291 ) ( not ( = ?auto_32290 ?auto_32293 ) ) ( SUPPORTS ?auto_32293 ?auto_32285 ) ( not ( = ?auto_32294 ?auto_32285 ) ) ( not ( = ?auto_32286 ?auto_32285 ) ) ( CALIBRATION_TARGET ?auto_32293 ?auto_32288 ) ( ON_BOARD ?auto_32292 ?auto_32291 ) ( not ( = ?auto_32290 ?auto_32292 ) ) ( not ( = ?auto_32293 ?auto_32292 ) ) ( SUPPORTS ?auto_32292 ?auto_32294 ) ( CALIBRATION_TARGET ?auto_32292 ?auto_32288 ) ( POWER_AVAIL ?auto_32291 ) ( POINTING ?auto_32291 ?auto_32289 ) ( not ( = ?auto_32288 ?auto_32289 ) ) ( not ( = ?auto_32287 ?auto_32289 ) ) ( not ( = ?auto_32295 ?auto_32289 ) ) ( not ( = ?auto_32284 ?auto_32289 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32295 ?auto_32294 ?auto_32287 ?auto_32286 )
      ( GET-2IMAGE-VERIFY ?auto_32284 ?auto_32285 ?auto_32287 ?auto_32286 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_32296 - DIRECTION
      ?auto_32297 - MODE
      ?auto_32299 - DIRECTION
      ?auto_32298 - MODE
    )
    :vars
    (
      ?auto_32303 - INSTRUMENT
      ?auto_32304 - SATELLITE
      ?auto_32300 - DIRECTION
      ?auto_32302 - DIRECTION
      ?auto_32307 - INSTRUMENT
      ?auto_32306 - MODE
      ?auto_32305 - INSTRUMENT
      ?auto_32301 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_32299 ?auto_32296 ) ) ( ON_BOARD ?auto_32303 ?auto_32304 ) ( SUPPORTS ?auto_32303 ?auto_32297 ) ( not ( = ?auto_32296 ?auto_32300 ) ) ( not ( = ?auto_32299 ?auto_32300 ) ) ( not ( = ?auto_32298 ?auto_32297 ) ) ( CALIBRATION_TARGET ?auto_32303 ?auto_32300 ) ( not ( = ?auto_32300 ?auto_32302 ) ) ( not ( = ?auto_32296 ?auto_32302 ) ) ( not ( = ?auto_32299 ?auto_32302 ) ) ( ON_BOARD ?auto_32307 ?auto_32304 ) ( not ( = ?auto_32303 ?auto_32307 ) ) ( SUPPORTS ?auto_32307 ?auto_32306 ) ( not ( = ?auto_32298 ?auto_32306 ) ) ( not ( = ?auto_32297 ?auto_32306 ) ) ( CALIBRATION_TARGET ?auto_32307 ?auto_32300 ) ( ON_BOARD ?auto_32305 ?auto_32304 ) ( not ( = ?auto_32303 ?auto_32305 ) ) ( not ( = ?auto_32307 ?auto_32305 ) ) ( SUPPORTS ?auto_32305 ?auto_32298 ) ( CALIBRATION_TARGET ?auto_32305 ?auto_32300 ) ( POWER_AVAIL ?auto_32304 ) ( POINTING ?auto_32304 ?auto_32301 ) ( not ( = ?auto_32300 ?auto_32301 ) ) ( not ( = ?auto_32296 ?auto_32301 ) ) ( not ( = ?auto_32299 ?auto_32301 ) ) ( not ( = ?auto_32302 ?auto_32301 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32299 ?auto_32298 ?auto_32296 ?auto_32297 )
      ( GET-2IMAGE-VERIFY ?auto_32296 ?auto_32297 ?auto_32299 ?auto_32298 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_32308 - DIRECTION
      ?auto_32309 - MODE
      ?auto_32311 - DIRECTION
      ?auto_32310 - MODE
    )
    :vars
    (
      ?auto_32319 - DIRECTION
      ?auto_32314 - INSTRUMENT
      ?auto_32315 - SATELLITE
      ?auto_32312 - DIRECTION
      ?auto_32318 - MODE
      ?auto_32317 - INSTRUMENT
      ?auto_32316 - INSTRUMENT
      ?auto_32313 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_32311 ?auto_32308 ) ) ( not ( = ?auto_32308 ?auto_32319 ) ) ( ON_BOARD ?auto_32314 ?auto_32315 ) ( SUPPORTS ?auto_32314 ?auto_32309 ) ( not ( = ?auto_32308 ?auto_32312 ) ) ( not ( = ?auto_32319 ?auto_32312 ) ) ( not ( = ?auto_32318 ?auto_32309 ) ) ( CALIBRATION_TARGET ?auto_32314 ?auto_32312 ) ( not ( = ?auto_32312 ?auto_32311 ) ) ( not ( = ?auto_32319 ?auto_32311 ) ) ( ON_BOARD ?auto_32317 ?auto_32315 ) ( not ( = ?auto_32314 ?auto_32317 ) ) ( SUPPORTS ?auto_32317 ?auto_32310 ) ( not ( = ?auto_32318 ?auto_32310 ) ) ( not ( = ?auto_32309 ?auto_32310 ) ) ( CALIBRATION_TARGET ?auto_32317 ?auto_32312 ) ( ON_BOARD ?auto_32316 ?auto_32315 ) ( not ( = ?auto_32314 ?auto_32316 ) ) ( not ( = ?auto_32317 ?auto_32316 ) ) ( SUPPORTS ?auto_32316 ?auto_32318 ) ( CALIBRATION_TARGET ?auto_32316 ?auto_32312 ) ( POWER_AVAIL ?auto_32315 ) ( POINTING ?auto_32315 ?auto_32313 ) ( not ( = ?auto_32312 ?auto_32313 ) ) ( not ( = ?auto_32308 ?auto_32313 ) ) ( not ( = ?auto_32319 ?auto_32313 ) ) ( not ( = ?auto_32311 ?auto_32313 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32319 ?auto_32318 ?auto_32308 ?auto_32309 )
      ( GET-2IMAGE-VERIFY ?auto_32308 ?auto_32309 ?auto_32311 ?auto_32310 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_32348 - DIRECTION
      ?auto_32349 - MODE
      ?auto_32351 - DIRECTION
      ?auto_32350 - MODE
      ?auto_32353 - DIRECTION
      ?auto_32352 - MODE
    )
    :vars
    (
      ?auto_32356 - INSTRUMENT
      ?auto_32357 - SATELLITE
      ?auto_32354 - DIRECTION
      ?auto_32359 - INSTRUMENT
      ?auto_32358 - INSTRUMENT
      ?auto_32355 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_32351 ?auto_32348 ) ) ( not ( = ?auto_32353 ?auto_32348 ) ) ( not ( = ?auto_32353 ?auto_32351 ) ) ( ON_BOARD ?auto_32356 ?auto_32357 ) ( SUPPORTS ?auto_32356 ?auto_32352 ) ( not ( = ?auto_32353 ?auto_32354 ) ) ( not ( = ?auto_32348 ?auto_32354 ) ) ( not ( = ?auto_32349 ?auto_32352 ) ) ( CALIBRATION_TARGET ?auto_32356 ?auto_32354 ) ( not ( = ?auto_32354 ?auto_32351 ) ) ( ON_BOARD ?auto_32359 ?auto_32357 ) ( not ( = ?auto_32356 ?auto_32359 ) ) ( SUPPORTS ?auto_32359 ?auto_32350 ) ( not ( = ?auto_32349 ?auto_32350 ) ) ( not ( = ?auto_32352 ?auto_32350 ) ) ( CALIBRATION_TARGET ?auto_32359 ?auto_32354 ) ( ON_BOARD ?auto_32358 ?auto_32357 ) ( not ( = ?auto_32356 ?auto_32358 ) ) ( not ( = ?auto_32359 ?auto_32358 ) ) ( SUPPORTS ?auto_32358 ?auto_32349 ) ( CALIBRATION_TARGET ?auto_32358 ?auto_32354 ) ( POWER_AVAIL ?auto_32357 ) ( POINTING ?auto_32357 ?auto_32355 ) ( not ( = ?auto_32354 ?auto_32355 ) ) ( not ( = ?auto_32353 ?auto_32355 ) ) ( not ( = ?auto_32348 ?auto_32355 ) ) ( not ( = ?auto_32351 ?auto_32355 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32348 ?auto_32349 ?auto_32353 ?auto_32352 )
      ( GET-3IMAGE-VERIFY ?auto_32348 ?auto_32349 ?auto_32351 ?auto_32350 ?auto_32353 ?auto_32352 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_32374 - DIRECTION
      ?auto_32375 - MODE
      ?auto_32377 - DIRECTION
      ?auto_32376 - MODE
      ?auto_32379 - DIRECTION
      ?auto_32378 - MODE
    )
    :vars
    (
      ?auto_32382 - INSTRUMENT
      ?auto_32383 - SATELLITE
      ?auto_32380 - DIRECTION
      ?auto_32385 - INSTRUMENT
      ?auto_32384 - INSTRUMENT
      ?auto_32381 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_32377 ?auto_32374 ) ) ( not ( = ?auto_32379 ?auto_32374 ) ) ( not ( = ?auto_32379 ?auto_32377 ) ) ( ON_BOARD ?auto_32382 ?auto_32383 ) ( SUPPORTS ?auto_32382 ?auto_32376 ) ( not ( = ?auto_32377 ?auto_32380 ) ) ( not ( = ?auto_32374 ?auto_32380 ) ) ( not ( = ?auto_32375 ?auto_32376 ) ) ( CALIBRATION_TARGET ?auto_32382 ?auto_32380 ) ( not ( = ?auto_32380 ?auto_32379 ) ) ( ON_BOARD ?auto_32385 ?auto_32383 ) ( not ( = ?auto_32382 ?auto_32385 ) ) ( SUPPORTS ?auto_32385 ?auto_32378 ) ( not ( = ?auto_32375 ?auto_32378 ) ) ( not ( = ?auto_32376 ?auto_32378 ) ) ( CALIBRATION_TARGET ?auto_32385 ?auto_32380 ) ( ON_BOARD ?auto_32384 ?auto_32383 ) ( not ( = ?auto_32382 ?auto_32384 ) ) ( not ( = ?auto_32385 ?auto_32384 ) ) ( SUPPORTS ?auto_32384 ?auto_32375 ) ( CALIBRATION_TARGET ?auto_32384 ?auto_32380 ) ( POWER_AVAIL ?auto_32383 ) ( POINTING ?auto_32383 ?auto_32381 ) ( not ( = ?auto_32380 ?auto_32381 ) ) ( not ( = ?auto_32377 ?auto_32381 ) ) ( not ( = ?auto_32374 ?auto_32381 ) ) ( not ( = ?auto_32379 ?auto_32381 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32374 ?auto_32375 ?auto_32377 ?auto_32376 )
      ( GET-3IMAGE-VERIFY ?auto_32374 ?auto_32375 ?auto_32377 ?auto_32376 ?auto_32379 ?auto_32378 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_32400 - DIRECTION
      ?auto_32401 - MODE
      ?auto_32403 - DIRECTION
      ?auto_32402 - MODE
      ?auto_32405 - DIRECTION
      ?auto_32404 - MODE
    )
    :vars
    (
      ?auto_32408 - INSTRUMENT
      ?auto_32409 - SATELLITE
      ?auto_32406 - DIRECTION
      ?auto_32411 - INSTRUMENT
      ?auto_32410 - INSTRUMENT
      ?auto_32407 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_32403 ?auto_32400 ) ) ( not ( = ?auto_32405 ?auto_32400 ) ) ( not ( = ?auto_32405 ?auto_32403 ) ) ( ON_BOARD ?auto_32408 ?auto_32409 ) ( SUPPORTS ?auto_32408 ?auto_32404 ) ( not ( = ?auto_32405 ?auto_32406 ) ) ( not ( = ?auto_32403 ?auto_32406 ) ) ( not ( = ?auto_32402 ?auto_32404 ) ) ( CALIBRATION_TARGET ?auto_32408 ?auto_32406 ) ( not ( = ?auto_32406 ?auto_32400 ) ) ( ON_BOARD ?auto_32411 ?auto_32409 ) ( not ( = ?auto_32408 ?auto_32411 ) ) ( SUPPORTS ?auto_32411 ?auto_32401 ) ( not ( = ?auto_32402 ?auto_32401 ) ) ( not ( = ?auto_32404 ?auto_32401 ) ) ( CALIBRATION_TARGET ?auto_32411 ?auto_32406 ) ( ON_BOARD ?auto_32410 ?auto_32409 ) ( not ( = ?auto_32408 ?auto_32410 ) ) ( not ( = ?auto_32411 ?auto_32410 ) ) ( SUPPORTS ?auto_32410 ?auto_32402 ) ( CALIBRATION_TARGET ?auto_32410 ?auto_32406 ) ( POWER_AVAIL ?auto_32409 ) ( POINTING ?auto_32409 ?auto_32407 ) ( not ( = ?auto_32406 ?auto_32407 ) ) ( not ( = ?auto_32405 ?auto_32407 ) ) ( not ( = ?auto_32403 ?auto_32407 ) ) ( not ( = ?auto_32400 ?auto_32407 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32403 ?auto_32402 ?auto_32405 ?auto_32404 )
      ( GET-3IMAGE-VERIFY ?auto_32400 ?auto_32401 ?auto_32403 ?auto_32402 ?auto_32405 ?auto_32404 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_32426 - DIRECTION
      ?auto_32427 - MODE
      ?auto_32429 - DIRECTION
      ?auto_32428 - MODE
      ?auto_32431 - DIRECTION
      ?auto_32430 - MODE
    )
    :vars
    (
      ?auto_32434 - INSTRUMENT
      ?auto_32435 - SATELLITE
      ?auto_32432 - DIRECTION
      ?auto_32437 - INSTRUMENT
      ?auto_32436 - INSTRUMENT
      ?auto_32433 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_32429 ?auto_32426 ) ) ( not ( = ?auto_32431 ?auto_32426 ) ) ( not ( = ?auto_32431 ?auto_32429 ) ) ( ON_BOARD ?auto_32434 ?auto_32435 ) ( SUPPORTS ?auto_32434 ?auto_32428 ) ( not ( = ?auto_32429 ?auto_32432 ) ) ( not ( = ?auto_32431 ?auto_32432 ) ) ( not ( = ?auto_32430 ?auto_32428 ) ) ( CALIBRATION_TARGET ?auto_32434 ?auto_32432 ) ( not ( = ?auto_32432 ?auto_32426 ) ) ( ON_BOARD ?auto_32437 ?auto_32435 ) ( not ( = ?auto_32434 ?auto_32437 ) ) ( SUPPORTS ?auto_32437 ?auto_32427 ) ( not ( = ?auto_32430 ?auto_32427 ) ) ( not ( = ?auto_32428 ?auto_32427 ) ) ( CALIBRATION_TARGET ?auto_32437 ?auto_32432 ) ( ON_BOARD ?auto_32436 ?auto_32435 ) ( not ( = ?auto_32434 ?auto_32436 ) ) ( not ( = ?auto_32437 ?auto_32436 ) ) ( SUPPORTS ?auto_32436 ?auto_32430 ) ( CALIBRATION_TARGET ?auto_32436 ?auto_32432 ) ( POWER_AVAIL ?auto_32435 ) ( POINTING ?auto_32435 ?auto_32433 ) ( not ( = ?auto_32432 ?auto_32433 ) ) ( not ( = ?auto_32429 ?auto_32433 ) ) ( not ( = ?auto_32431 ?auto_32433 ) ) ( not ( = ?auto_32426 ?auto_32433 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32431 ?auto_32430 ?auto_32429 ?auto_32428 )
      ( GET-3IMAGE-VERIFY ?auto_32426 ?auto_32427 ?auto_32429 ?auto_32428 ?auto_32431 ?auto_32430 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_32480 - DIRECTION
      ?auto_32481 - MODE
      ?auto_32483 - DIRECTION
      ?auto_32482 - MODE
      ?auto_32485 - DIRECTION
      ?auto_32484 - MODE
    )
    :vars
    (
      ?auto_32488 - INSTRUMENT
      ?auto_32489 - SATELLITE
      ?auto_32486 - DIRECTION
      ?auto_32491 - INSTRUMENT
      ?auto_32490 - INSTRUMENT
      ?auto_32487 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_32483 ?auto_32480 ) ) ( not ( = ?auto_32485 ?auto_32480 ) ) ( not ( = ?auto_32485 ?auto_32483 ) ) ( ON_BOARD ?auto_32488 ?auto_32489 ) ( SUPPORTS ?auto_32488 ?auto_32481 ) ( not ( = ?auto_32480 ?auto_32486 ) ) ( not ( = ?auto_32483 ?auto_32486 ) ) ( not ( = ?auto_32482 ?auto_32481 ) ) ( CALIBRATION_TARGET ?auto_32488 ?auto_32486 ) ( not ( = ?auto_32486 ?auto_32485 ) ) ( ON_BOARD ?auto_32491 ?auto_32489 ) ( not ( = ?auto_32488 ?auto_32491 ) ) ( SUPPORTS ?auto_32491 ?auto_32484 ) ( not ( = ?auto_32482 ?auto_32484 ) ) ( not ( = ?auto_32481 ?auto_32484 ) ) ( CALIBRATION_TARGET ?auto_32491 ?auto_32486 ) ( ON_BOARD ?auto_32490 ?auto_32489 ) ( not ( = ?auto_32488 ?auto_32490 ) ) ( not ( = ?auto_32491 ?auto_32490 ) ) ( SUPPORTS ?auto_32490 ?auto_32482 ) ( CALIBRATION_TARGET ?auto_32490 ?auto_32486 ) ( POWER_AVAIL ?auto_32489 ) ( POINTING ?auto_32489 ?auto_32487 ) ( not ( = ?auto_32486 ?auto_32487 ) ) ( not ( = ?auto_32480 ?auto_32487 ) ) ( not ( = ?auto_32483 ?auto_32487 ) ) ( not ( = ?auto_32485 ?auto_32487 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32483 ?auto_32482 ?auto_32480 ?auto_32481 )
      ( GET-3IMAGE-VERIFY ?auto_32480 ?auto_32481 ?auto_32483 ?auto_32482 ?auto_32485 ?auto_32484 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_32506 - DIRECTION
      ?auto_32507 - MODE
      ?auto_32509 - DIRECTION
      ?auto_32508 - MODE
      ?auto_32511 - DIRECTION
      ?auto_32510 - MODE
    )
    :vars
    (
      ?auto_32514 - INSTRUMENT
      ?auto_32515 - SATELLITE
      ?auto_32512 - DIRECTION
      ?auto_32517 - INSTRUMENT
      ?auto_32516 - INSTRUMENT
      ?auto_32513 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_32509 ?auto_32506 ) ) ( not ( = ?auto_32511 ?auto_32506 ) ) ( not ( = ?auto_32511 ?auto_32509 ) ) ( ON_BOARD ?auto_32514 ?auto_32515 ) ( SUPPORTS ?auto_32514 ?auto_32507 ) ( not ( = ?auto_32506 ?auto_32512 ) ) ( not ( = ?auto_32511 ?auto_32512 ) ) ( not ( = ?auto_32510 ?auto_32507 ) ) ( CALIBRATION_TARGET ?auto_32514 ?auto_32512 ) ( not ( = ?auto_32512 ?auto_32509 ) ) ( ON_BOARD ?auto_32517 ?auto_32515 ) ( not ( = ?auto_32514 ?auto_32517 ) ) ( SUPPORTS ?auto_32517 ?auto_32508 ) ( not ( = ?auto_32510 ?auto_32508 ) ) ( not ( = ?auto_32507 ?auto_32508 ) ) ( CALIBRATION_TARGET ?auto_32517 ?auto_32512 ) ( ON_BOARD ?auto_32516 ?auto_32515 ) ( not ( = ?auto_32514 ?auto_32516 ) ) ( not ( = ?auto_32517 ?auto_32516 ) ) ( SUPPORTS ?auto_32516 ?auto_32510 ) ( CALIBRATION_TARGET ?auto_32516 ?auto_32512 ) ( POWER_AVAIL ?auto_32515 ) ( POINTING ?auto_32515 ?auto_32513 ) ( not ( = ?auto_32512 ?auto_32513 ) ) ( not ( = ?auto_32506 ?auto_32513 ) ) ( not ( = ?auto_32511 ?auto_32513 ) ) ( not ( = ?auto_32509 ?auto_32513 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32511 ?auto_32510 ?auto_32506 ?auto_32507 )
      ( GET-3IMAGE-VERIFY ?auto_32506 ?auto_32507 ?auto_32509 ?auto_32508 ?auto_32511 ?auto_32510 ) )
  )

)

