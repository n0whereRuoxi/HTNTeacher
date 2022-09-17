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
      ?auto_26582 - INSTRUMENT
      ?auto_26581 - SATELLITE
      ?auto_26580 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26582 ?auto_26581 ) ( SUPPORTS ?auto_26582 ?auto_26579 ) ( POWER_ON ?auto_26582 ) ( POINTING ?auto_26581 ?auto_26580 ) ( not ( = ?auto_26578 ?auto_26580 ) ) ( CALIBRATION_TARGET ?auto_26582 ?auto_26580 ) ( NOT_CALIBRATED ?auto_26582 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_26581 ?auto_26582 ?auto_26580 )
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
      ?auto_26602 - INSTRUMENT
      ?auto_26603 - SATELLITE
      ?auto_26601 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26602 ?auto_26603 ) ( SUPPORTS ?auto_26602 ?auto_26600 ) ( POINTING ?auto_26603 ?auto_26601 ) ( not ( = ?auto_26599 ?auto_26601 ) ) ( CALIBRATION_TARGET ?auto_26602 ?auto_26601 ) ( POWER_AVAIL ?auto_26603 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_26602 ?auto_26603 )
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
      ?auto_26622 - INSTRUMENT
      ?auto_26624 - SATELLITE
      ?auto_26623 - DIRECTION
      ?auto_26625 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26622 ?auto_26624 ) ( SUPPORTS ?auto_26622 ?auto_26621 ) ( not ( = ?auto_26620 ?auto_26623 ) ) ( CALIBRATION_TARGET ?auto_26622 ?auto_26623 ) ( POWER_AVAIL ?auto_26624 ) ( POINTING ?auto_26624 ?auto_26625 ) ( not ( = ?auto_26623 ?auto_26625 ) ) ( not ( = ?auto_26620 ?auto_26625 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_26624 ?auto_26623 ?auto_26625 )
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
      ?auto_26709 - INSTRUMENT
      ?auto_26708 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_26709 ) ( ON_BOARD ?auto_26709 ?auto_26708 ) ( SUPPORTS ?auto_26709 ?auto_26706 ) ( POWER_ON ?auto_26709 ) ( POINTING ?auto_26708 ?auto_26707 ) ( HAVE_IMAGE ?auto_26704 ?auto_26705 ) ( not ( = ?auto_26704 ?auto_26707 ) ) ( not ( = ?auto_26705 ?auto_26706 ) ) )
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
      ?auto_26715 - INSTRUMENT
      ?auto_26714 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_26715 ) ( ON_BOARD ?auto_26715 ?auto_26714 ) ( SUPPORTS ?auto_26715 ?auto_26711 ) ( POWER_ON ?auto_26715 ) ( POINTING ?auto_26714 ?auto_26710 ) ( HAVE_IMAGE ?auto_26713 ?auto_26712 ) ( not ( = ?auto_26710 ?auto_26713 ) ) ( not ( = ?auto_26711 ?auto_26712 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_26710 ?auto_26711 )
      ( GET-2IMAGE-VERIFY ?auto_26710 ?auto_26711 ?auto_26713 ?auto_26712 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26722 - DIRECTION
      ?auto_26723 - MODE
      ?auto_26725 - DIRECTION
      ?auto_26724 - MODE
      ?auto_26727 - DIRECTION
      ?auto_26726 - MODE
    )
    :vars
    (
      ?auto_26729 - INSTRUMENT
      ?auto_26728 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_26729 ) ( ON_BOARD ?auto_26729 ?auto_26728 ) ( SUPPORTS ?auto_26729 ?auto_26726 ) ( POWER_ON ?auto_26729 ) ( POINTING ?auto_26728 ?auto_26727 ) ( HAVE_IMAGE ?auto_26722 ?auto_26723 ) ( HAVE_IMAGE ?auto_26725 ?auto_26724 ) ( not ( = ?auto_26722 ?auto_26725 ) ) ( not ( = ?auto_26722 ?auto_26727 ) ) ( not ( = ?auto_26723 ?auto_26724 ) ) ( not ( = ?auto_26723 ?auto_26726 ) ) ( not ( = ?auto_26725 ?auto_26727 ) ) ( not ( = ?auto_26724 ?auto_26726 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_26727 ?auto_26726 )
      ( GET-3IMAGE-VERIFY ?auto_26722 ?auto_26723 ?auto_26725 ?auto_26724 ?auto_26727 ?auto_26726 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26730 - DIRECTION
      ?auto_26731 - MODE
      ?auto_26733 - DIRECTION
      ?auto_26732 - MODE
      ?auto_26735 - DIRECTION
      ?auto_26734 - MODE
    )
    :vars
    (
      ?auto_26737 - INSTRUMENT
      ?auto_26736 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_26737 ) ( ON_BOARD ?auto_26737 ?auto_26736 ) ( SUPPORTS ?auto_26737 ?auto_26732 ) ( POWER_ON ?auto_26737 ) ( POINTING ?auto_26736 ?auto_26733 ) ( HAVE_IMAGE ?auto_26730 ?auto_26731 ) ( HAVE_IMAGE ?auto_26735 ?auto_26734 ) ( not ( = ?auto_26730 ?auto_26733 ) ) ( not ( = ?auto_26730 ?auto_26735 ) ) ( not ( = ?auto_26731 ?auto_26732 ) ) ( not ( = ?auto_26731 ?auto_26734 ) ) ( not ( = ?auto_26733 ?auto_26735 ) ) ( not ( = ?auto_26732 ?auto_26734 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_26733 ?auto_26732 )
      ( GET-3IMAGE-VERIFY ?auto_26730 ?auto_26731 ?auto_26733 ?auto_26732 ?auto_26735 ?auto_26734 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26746 - DIRECTION
      ?auto_26747 - MODE
      ?auto_26749 - DIRECTION
      ?auto_26748 - MODE
      ?auto_26751 - DIRECTION
      ?auto_26750 - MODE
    )
    :vars
    (
      ?auto_26753 - INSTRUMENT
      ?auto_26752 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_26753 ) ( ON_BOARD ?auto_26753 ?auto_26752 ) ( SUPPORTS ?auto_26753 ?auto_26747 ) ( POWER_ON ?auto_26753 ) ( POINTING ?auto_26752 ?auto_26746 ) ( HAVE_IMAGE ?auto_26749 ?auto_26748 ) ( HAVE_IMAGE ?auto_26751 ?auto_26750 ) ( not ( = ?auto_26746 ?auto_26749 ) ) ( not ( = ?auto_26746 ?auto_26751 ) ) ( not ( = ?auto_26747 ?auto_26748 ) ) ( not ( = ?auto_26747 ?auto_26750 ) ) ( not ( = ?auto_26749 ?auto_26751 ) ) ( not ( = ?auto_26748 ?auto_26750 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_26746 ?auto_26747 )
      ( GET-3IMAGE-VERIFY ?auto_26746 ?auto_26747 ?auto_26749 ?auto_26748 ?auto_26751 ?auto_26750 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26778 - DIRECTION
      ?auto_26779 - MODE
    )
    :vars
    (
      ?auto_26781 - INSTRUMENT
      ?auto_26780 - SATELLITE
      ?auto_26782 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_26781 ) ( ON_BOARD ?auto_26781 ?auto_26780 ) ( SUPPORTS ?auto_26781 ?auto_26779 ) ( POWER_ON ?auto_26781 ) ( POINTING ?auto_26780 ?auto_26782 ) ( not ( = ?auto_26778 ?auto_26782 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_26780 ?auto_26778 ?auto_26782 )
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
      ?auto_26787 - INSTRUMENT
      ?auto_26789 - SATELLITE
      ?auto_26788 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_26787 ) ( ON_BOARD ?auto_26787 ?auto_26789 ) ( SUPPORTS ?auto_26787 ?auto_26785 ) ( POWER_ON ?auto_26787 ) ( POINTING ?auto_26789 ?auto_26788 ) ( not ( = ?auto_26786 ?auto_26788 ) ) ( HAVE_IMAGE ?auto_26783 ?auto_26784 ) ( not ( = ?auto_26783 ?auto_26786 ) ) ( not ( = ?auto_26783 ?auto_26788 ) ) ( not ( = ?auto_26784 ?auto_26785 ) ) )
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
      ?auto_26796 - INSTRUMENT
      ?auto_26794 - SATELLITE
      ?auto_26795 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_26796 ) ( ON_BOARD ?auto_26796 ?auto_26794 ) ( SUPPORTS ?auto_26796 ?auto_26791 ) ( POWER_ON ?auto_26796 ) ( POINTING ?auto_26794 ?auto_26795 ) ( not ( = ?auto_26790 ?auto_26795 ) ) ( HAVE_IMAGE ?auto_26793 ?auto_26792 ) ( not ( = ?auto_26793 ?auto_26790 ) ) ( not ( = ?auto_26793 ?auto_26795 ) ) ( not ( = ?auto_26792 ?auto_26791 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26793 ?auto_26792 ?auto_26790 ?auto_26791 )
      ( GET-2IMAGE-VERIFY ?auto_26790 ?auto_26791 ?auto_26793 ?auto_26792 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26806 - DIRECTION
      ?auto_26807 - MODE
      ?auto_26809 - DIRECTION
      ?auto_26808 - MODE
      ?auto_26811 - DIRECTION
      ?auto_26810 - MODE
    )
    :vars
    (
      ?auto_26814 - INSTRUMENT
      ?auto_26812 - SATELLITE
      ?auto_26813 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_26814 ) ( ON_BOARD ?auto_26814 ?auto_26812 ) ( SUPPORTS ?auto_26814 ?auto_26810 ) ( POWER_ON ?auto_26814 ) ( POINTING ?auto_26812 ?auto_26813 ) ( not ( = ?auto_26811 ?auto_26813 ) ) ( HAVE_IMAGE ?auto_26806 ?auto_26807 ) ( not ( = ?auto_26806 ?auto_26811 ) ) ( not ( = ?auto_26806 ?auto_26813 ) ) ( not ( = ?auto_26807 ?auto_26810 ) ) ( HAVE_IMAGE ?auto_26809 ?auto_26808 ) ( not ( = ?auto_26806 ?auto_26809 ) ) ( not ( = ?auto_26807 ?auto_26808 ) ) ( not ( = ?auto_26809 ?auto_26811 ) ) ( not ( = ?auto_26809 ?auto_26813 ) ) ( not ( = ?auto_26808 ?auto_26810 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26806 ?auto_26807 ?auto_26811 ?auto_26810 )
      ( GET-3IMAGE-VERIFY ?auto_26806 ?auto_26807 ?auto_26809 ?auto_26808 ?auto_26811 ?auto_26810 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26815 - DIRECTION
      ?auto_26816 - MODE
      ?auto_26818 - DIRECTION
      ?auto_26817 - MODE
      ?auto_26820 - DIRECTION
      ?auto_26819 - MODE
    )
    :vars
    (
      ?auto_26823 - INSTRUMENT
      ?auto_26821 - SATELLITE
      ?auto_26822 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_26823 ) ( ON_BOARD ?auto_26823 ?auto_26821 ) ( SUPPORTS ?auto_26823 ?auto_26817 ) ( POWER_ON ?auto_26823 ) ( POINTING ?auto_26821 ?auto_26822 ) ( not ( = ?auto_26818 ?auto_26822 ) ) ( HAVE_IMAGE ?auto_26820 ?auto_26819 ) ( not ( = ?auto_26820 ?auto_26818 ) ) ( not ( = ?auto_26820 ?auto_26822 ) ) ( not ( = ?auto_26819 ?auto_26817 ) ) ( HAVE_IMAGE ?auto_26815 ?auto_26816 ) ( not ( = ?auto_26815 ?auto_26818 ) ) ( not ( = ?auto_26815 ?auto_26820 ) ) ( not ( = ?auto_26815 ?auto_26822 ) ) ( not ( = ?auto_26816 ?auto_26817 ) ) ( not ( = ?auto_26816 ?auto_26819 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26820 ?auto_26819 ?auto_26818 ?auto_26817 )
      ( GET-3IMAGE-VERIFY ?auto_26815 ?auto_26816 ?auto_26818 ?auto_26817 ?auto_26820 ?auto_26819 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26833 - DIRECTION
      ?auto_26834 - MODE
      ?auto_26836 - DIRECTION
      ?auto_26835 - MODE
      ?auto_26838 - DIRECTION
      ?auto_26837 - MODE
    )
    :vars
    (
      ?auto_26841 - INSTRUMENT
      ?auto_26839 - SATELLITE
      ?auto_26840 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_26841 ) ( ON_BOARD ?auto_26841 ?auto_26839 ) ( SUPPORTS ?auto_26841 ?auto_26834 ) ( POWER_ON ?auto_26841 ) ( POINTING ?auto_26839 ?auto_26840 ) ( not ( = ?auto_26833 ?auto_26840 ) ) ( HAVE_IMAGE ?auto_26838 ?auto_26837 ) ( not ( = ?auto_26838 ?auto_26833 ) ) ( not ( = ?auto_26838 ?auto_26840 ) ) ( not ( = ?auto_26837 ?auto_26834 ) ) ( HAVE_IMAGE ?auto_26836 ?auto_26835 ) ( not ( = ?auto_26833 ?auto_26836 ) ) ( not ( = ?auto_26834 ?auto_26835 ) ) ( not ( = ?auto_26836 ?auto_26838 ) ) ( not ( = ?auto_26836 ?auto_26840 ) ) ( not ( = ?auto_26835 ?auto_26837 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26838 ?auto_26837 ?auto_26833 ?auto_26834 )
      ( GET-3IMAGE-VERIFY ?auto_26833 ?auto_26834 ?auto_26836 ?auto_26835 ?auto_26838 ?auto_26837 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26871 - DIRECTION
      ?auto_26872 - MODE
    )
    :vars
    (
      ?auto_26875 - INSTRUMENT
      ?auto_26873 - SATELLITE
      ?auto_26874 - DIRECTION
      ?auto_26876 - DIRECTION
      ?auto_26877 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_26875 ?auto_26873 ) ( SUPPORTS ?auto_26875 ?auto_26872 ) ( POWER_ON ?auto_26875 ) ( POINTING ?auto_26873 ?auto_26874 ) ( not ( = ?auto_26871 ?auto_26874 ) ) ( HAVE_IMAGE ?auto_26876 ?auto_26877 ) ( not ( = ?auto_26876 ?auto_26871 ) ) ( not ( = ?auto_26876 ?auto_26874 ) ) ( not ( = ?auto_26877 ?auto_26872 ) ) ( CALIBRATION_TARGET ?auto_26875 ?auto_26874 ) ( NOT_CALIBRATED ?auto_26875 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_26873 ?auto_26875 ?auto_26874 )
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
      ?auto_26884 - INSTRUMENT
      ?auto_26883 - SATELLITE
      ?auto_26882 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26884 ?auto_26883 ) ( SUPPORTS ?auto_26884 ?auto_26880 ) ( POWER_ON ?auto_26884 ) ( POINTING ?auto_26883 ?auto_26882 ) ( not ( = ?auto_26881 ?auto_26882 ) ) ( HAVE_IMAGE ?auto_26878 ?auto_26879 ) ( not ( = ?auto_26878 ?auto_26881 ) ) ( not ( = ?auto_26878 ?auto_26882 ) ) ( not ( = ?auto_26879 ?auto_26880 ) ) ( CALIBRATION_TARGET ?auto_26884 ?auto_26882 ) ( NOT_CALIBRATED ?auto_26884 ) )
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
      ?auto_26890 - SATELLITE
      ?auto_26889 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26891 ?auto_26890 ) ( SUPPORTS ?auto_26891 ?auto_26886 ) ( POWER_ON ?auto_26891 ) ( POINTING ?auto_26890 ?auto_26889 ) ( not ( = ?auto_26885 ?auto_26889 ) ) ( HAVE_IMAGE ?auto_26888 ?auto_26887 ) ( not ( = ?auto_26888 ?auto_26885 ) ) ( not ( = ?auto_26888 ?auto_26889 ) ) ( not ( = ?auto_26887 ?auto_26886 ) ) ( CALIBRATION_TARGET ?auto_26891 ?auto_26889 ) ( NOT_CALIBRATED ?auto_26891 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26888 ?auto_26887 ?auto_26885 ?auto_26886 )
      ( GET-2IMAGE-VERIFY ?auto_26885 ?auto_26886 ?auto_26888 ?auto_26887 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26901 - DIRECTION
      ?auto_26902 - MODE
      ?auto_26904 - DIRECTION
      ?auto_26903 - MODE
      ?auto_26906 - DIRECTION
      ?auto_26905 - MODE
    )
    :vars
    (
      ?auto_26909 - INSTRUMENT
      ?auto_26908 - SATELLITE
      ?auto_26907 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26909 ?auto_26908 ) ( SUPPORTS ?auto_26909 ?auto_26905 ) ( POWER_ON ?auto_26909 ) ( POINTING ?auto_26908 ?auto_26907 ) ( not ( = ?auto_26906 ?auto_26907 ) ) ( HAVE_IMAGE ?auto_26904 ?auto_26902 ) ( not ( = ?auto_26904 ?auto_26906 ) ) ( not ( = ?auto_26904 ?auto_26907 ) ) ( not ( = ?auto_26902 ?auto_26905 ) ) ( CALIBRATION_TARGET ?auto_26909 ?auto_26907 ) ( NOT_CALIBRATED ?auto_26909 ) ( HAVE_IMAGE ?auto_26901 ?auto_26902 ) ( HAVE_IMAGE ?auto_26904 ?auto_26903 ) ( not ( = ?auto_26901 ?auto_26904 ) ) ( not ( = ?auto_26901 ?auto_26906 ) ) ( not ( = ?auto_26901 ?auto_26907 ) ) ( not ( = ?auto_26902 ?auto_26903 ) ) ( not ( = ?auto_26903 ?auto_26905 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26904 ?auto_26902 ?auto_26906 ?auto_26905 )
      ( GET-3IMAGE-VERIFY ?auto_26901 ?auto_26902 ?auto_26904 ?auto_26903 ?auto_26906 ?auto_26905 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26910 - DIRECTION
      ?auto_26911 - MODE
      ?auto_26913 - DIRECTION
      ?auto_26912 - MODE
      ?auto_26915 - DIRECTION
      ?auto_26914 - MODE
    )
    :vars
    (
      ?auto_26918 - INSTRUMENT
      ?auto_26917 - SATELLITE
      ?auto_26916 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26918 ?auto_26917 ) ( SUPPORTS ?auto_26918 ?auto_26912 ) ( POWER_ON ?auto_26918 ) ( POINTING ?auto_26917 ?auto_26916 ) ( not ( = ?auto_26913 ?auto_26916 ) ) ( HAVE_IMAGE ?auto_26915 ?auto_26914 ) ( not ( = ?auto_26915 ?auto_26913 ) ) ( not ( = ?auto_26915 ?auto_26916 ) ) ( not ( = ?auto_26914 ?auto_26912 ) ) ( CALIBRATION_TARGET ?auto_26918 ?auto_26916 ) ( NOT_CALIBRATED ?auto_26918 ) ( HAVE_IMAGE ?auto_26910 ?auto_26911 ) ( not ( = ?auto_26910 ?auto_26913 ) ) ( not ( = ?auto_26910 ?auto_26915 ) ) ( not ( = ?auto_26910 ?auto_26916 ) ) ( not ( = ?auto_26911 ?auto_26912 ) ) ( not ( = ?auto_26911 ?auto_26914 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26915 ?auto_26914 ?auto_26913 ?auto_26912 )
      ( GET-3IMAGE-VERIFY ?auto_26910 ?auto_26911 ?auto_26913 ?auto_26912 ?auto_26915 ?auto_26914 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26928 - DIRECTION
      ?auto_26929 - MODE
      ?auto_26931 - DIRECTION
      ?auto_26930 - MODE
      ?auto_26933 - DIRECTION
      ?auto_26932 - MODE
    )
    :vars
    (
      ?auto_26936 - INSTRUMENT
      ?auto_26935 - SATELLITE
      ?auto_26934 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26936 ?auto_26935 ) ( SUPPORTS ?auto_26936 ?auto_26929 ) ( POWER_ON ?auto_26936 ) ( POINTING ?auto_26935 ?auto_26934 ) ( not ( = ?auto_26928 ?auto_26934 ) ) ( HAVE_IMAGE ?auto_26933 ?auto_26932 ) ( not ( = ?auto_26933 ?auto_26928 ) ) ( not ( = ?auto_26933 ?auto_26934 ) ) ( not ( = ?auto_26932 ?auto_26929 ) ) ( CALIBRATION_TARGET ?auto_26936 ?auto_26934 ) ( NOT_CALIBRATED ?auto_26936 ) ( HAVE_IMAGE ?auto_26931 ?auto_26930 ) ( not ( = ?auto_26928 ?auto_26931 ) ) ( not ( = ?auto_26929 ?auto_26930 ) ) ( not ( = ?auto_26931 ?auto_26933 ) ) ( not ( = ?auto_26931 ?auto_26934 ) ) ( not ( = ?auto_26930 ?auto_26932 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26933 ?auto_26932 ?auto_26928 ?auto_26929 )
      ( GET-3IMAGE-VERIFY ?auto_26928 ?auto_26929 ?auto_26931 ?auto_26930 ?auto_26933 ?auto_26932 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26966 - DIRECTION
      ?auto_26967 - MODE
    )
    :vars
    (
      ?auto_26972 - INSTRUMENT
      ?auto_26971 - SATELLITE
      ?auto_26970 - DIRECTION
      ?auto_26969 - DIRECTION
      ?auto_26968 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_26972 ?auto_26971 ) ( SUPPORTS ?auto_26972 ?auto_26967 ) ( POINTING ?auto_26971 ?auto_26970 ) ( not ( = ?auto_26966 ?auto_26970 ) ) ( HAVE_IMAGE ?auto_26969 ?auto_26968 ) ( not ( = ?auto_26969 ?auto_26966 ) ) ( not ( = ?auto_26969 ?auto_26970 ) ) ( not ( = ?auto_26968 ?auto_26967 ) ) ( CALIBRATION_TARGET ?auto_26972 ?auto_26970 ) ( POWER_AVAIL ?auto_26971 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_26972 ?auto_26971 )
      ( GET-2IMAGE ?auto_26969 ?auto_26968 ?auto_26966 ?auto_26967 )
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
      ?auto_26977 - INSTRUMENT
      ?auto_26978 - SATELLITE
      ?auto_26979 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26977 ?auto_26978 ) ( SUPPORTS ?auto_26977 ?auto_26975 ) ( POINTING ?auto_26978 ?auto_26979 ) ( not ( = ?auto_26976 ?auto_26979 ) ) ( HAVE_IMAGE ?auto_26973 ?auto_26974 ) ( not ( = ?auto_26973 ?auto_26976 ) ) ( not ( = ?auto_26973 ?auto_26979 ) ) ( not ( = ?auto_26974 ?auto_26975 ) ) ( CALIBRATION_TARGET ?auto_26977 ?auto_26979 ) ( POWER_AVAIL ?auto_26978 ) )
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
      ?auto_26985 - INSTRUMENT
      ?auto_26986 - SATELLITE
      ?auto_26984 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26985 ?auto_26986 ) ( SUPPORTS ?auto_26985 ?auto_26981 ) ( POINTING ?auto_26986 ?auto_26984 ) ( not ( = ?auto_26980 ?auto_26984 ) ) ( HAVE_IMAGE ?auto_26983 ?auto_26982 ) ( not ( = ?auto_26983 ?auto_26980 ) ) ( not ( = ?auto_26983 ?auto_26984 ) ) ( not ( = ?auto_26982 ?auto_26981 ) ) ( CALIBRATION_TARGET ?auto_26985 ?auto_26984 ) ( POWER_AVAIL ?auto_26986 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26983 ?auto_26982 ?auto_26980 ?auto_26981 )
      ( GET-2IMAGE-VERIFY ?auto_26980 ?auto_26981 ?auto_26983 ?auto_26982 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26996 - DIRECTION
      ?auto_26997 - MODE
      ?auto_26999 - DIRECTION
      ?auto_26998 - MODE
      ?auto_27001 - DIRECTION
      ?auto_27000 - MODE
    )
    :vars
    (
      ?auto_27003 - INSTRUMENT
      ?auto_27004 - SATELLITE
      ?auto_27002 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_27003 ?auto_27004 ) ( SUPPORTS ?auto_27003 ?auto_27000 ) ( POINTING ?auto_27004 ?auto_27002 ) ( not ( = ?auto_27001 ?auto_27002 ) ) ( HAVE_IMAGE ?auto_26999 ?auto_26997 ) ( not ( = ?auto_26999 ?auto_27001 ) ) ( not ( = ?auto_26999 ?auto_27002 ) ) ( not ( = ?auto_26997 ?auto_27000 ) ) ( CALIBRATION_TARGET ?auto_27003 ?auto_27002 ) ( POWER_AVAIL ?auto_27004 ) ( HAVE_IMAGE ?auto_26996 ?auto_26997 ) ( HAVE_IMAGE ?auto_26999 ?auto_26998 ) ( not ( = ?auto_26996 ?auto_26999 ) ) ( not ( = ?auto_26996 ?auto_27001 ) ) ( not ( = ?auto_26996 ?auto_27002 ) ) ( not ( = ?auto_26997 ?auto_26998 ) ) ( not ( = ?auto_26998 ?auto_27000 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26999 ?auto_26997 ?auto_27001 ?auto_27000 )
      ( GET-3IMAGE-VERIFY ?auto_26996 ?auto_26997 ?auto_26999 ?auto_26998 ?auto_27001 ?auto_27000 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27005 - DIRECTION
      ?auto_27006 - MODE
      ?auto_27008 - DIRECTION
      ?auto_27007 - MODE
      ?auto_27010 - DIRECTION
      ?auto_27009 - MODE
    )
    :vars
    (
      ?auto_27012 - INSTRUMENT
      ?auto_27013 - SATELLITE
      ?auto_27011 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_27012 ?auto_27013 ) ( SUPPORTS ?auto_27012 ?auto_27007 ) ( POINTING ?auto_27013 ?auto_27011 ) ( not ( = ?auto_27008 ?auto_27011 ) ) ( HAVE_IMAGE ?auto_27005 ?auto_27009 ) ( not ( = ?auto_27005 ?auto_27008 ) ) ( not ( = ?auto_27005 ?auto_27011 ) ) ( not ( = ?auto_27009 ?auto_27007 ) ) ( CALIBRATION_TARGET ?auto_27012 ?auto_27011 ) ( POWER_AVAIL ?auto_27013 ) ( HAVE_IMAGE ?auto_27005 ?auto_27006 ) ( HAVE_IMAGE ?auto_27010 ?auto_27009 ) ( not ( = ?auto_27005 ?auto_27010 ) ) ( not ( = ?auto_27006 ?auto_27007 ) ) ( not ( = ?auto_27006 ?auto_27009 ) ) ( not ( = ?auto_27008 ?auto_27010 ) ) ( not ( = ?auto_27010 ?auto_27011 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27005 ?auto_27009 ?auto_27008 ?auto_27007 )
      ( GET-3IMAGE-VERIFY ?auto_27005 ?auto_27006 ?auto_27008 ?auto_27007 ?auto_27010 ?auto_27009 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27023 - DIRECTION
      ?auto_27024 - MODE
      ?auto_27026 - DIRECTION
      ?auto_27025 - MODE
      ?auto_27028 - DIRECTION
      ?auto_27027 - MODE
    )
    :vars
    (
      ?auto_27030 - INSTRUMENT
      ?auto_27031 - SATELLITE
      ?auto_27029 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_27030 ?auto_27031 ) ( SUPPORTS ?auto_27030 ?auto_27024 ) ( POINTING ?auto_27031 ?auto_27029 ) ( not ( = ?auto_27023 ?auto_27029 ) ) ( HAVE_IMAGE ?auto_27028 ?auto_27025 ) ( not ( = ?auto_27028 ?auto_27023 ) ) ( not ( = ?auto_27028 ?auto_27029 ) ) ( not ( = ?auto_27025 ?auto_27024 ) ) ( CALIBRATION_TARGET ?auto_27030 ?auto_27029 ) ( POWER_AVAIL ?auto_27031 ) ( HAVE_IMAGE ?auto_27026 ?auto_27025 ) ( HAVE_IMAGE ?auto_27028 ?auto_27027 ) ( not ( = ?auto_27023 ?auto_27026 ) ) ( not ( = ?auto_27024 ?auto_27027 ) ) ( not ( = ?auto_27026 ?auto_27028 ) ) ( not ( = ?auto_27026 ?auto_27029 ) ) ( not ( = ?auto_27025 ?auto_27027 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27028 ?auto_27025 ?auto_27023 ?auto_27024 )
      ( GET-3IMAGE-VERIFY ?auto_27023 ?auto_27024 ?auto_27026 ?auto_27025 ?auto_27028 ?auto_27027 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_27061 - DIRECTION
      ?auto_27062 - MODE
    )
    :vars
    (
      ?auto_27066 - INSTRUMENT
      ?auto_27067 - SATELLITE
      ?auto_27064 - DIRECTION
      ?auto_27063 - DIRECTION
      ?auto_27065 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_27066 ?auto_27067 ) ( SUPPORTS ?auto_27066 ?auto_27062 ) ( not ( = ?auto_27061 ?auto_27064 ) ) ( HAVE_IMAGE ?auto_27063 ?auto_27065 ) ( not ( = ?auto_27063 ?auto_27061 ) ) ( not ( = ?auto_27063 ?auto_27064 ) ) ( not ( = ?auto_27065 ?auto_27062 ) ) ( CALIBRATION_TARGET ?auto_27066 ?auto_27064 ) ( POWER_AVAIL ?auto_27067 ) ( POINTING ?auto_27067 ?auto_27063 ) )
    :subtasks
    ( ( !TURN_TO ?auto_27067 ?auto_27064 ?auto_27063 )
      ( GET-2IMAGE ?auto_27063 ?auto_27065 ?auto_27061 ?auto_27062 )
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
    ( and ( ON_BOARD ?auto_27073 ?auto_27074 ) ( SUPPORTS ?auto_27073 ?auto_27070 ) ( not ( = ?auto_27071 ?auto_27072 ) ) ( HAVE_IMAGE ?auto_27068 ?auto_27069 ) ( not ( = ?auto_27068 ?auto_27071 ) ) ( not ( = ?auto_27068 ?auto_27072 ) ) ( not ( = ?auto_27069 ?auto_27070 ) ) ( CALIBRATION_TARGET ?auto_27073 ?auto_27072 ) ( POWER_AVAIL ?auto_27074 ) ( POINTING ?auto_27074 ?auto_27068 ) )
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
    ( and ( ON_BOARD ?auto_27080 ?auto_27079 ) ( SUPPORTS ?auto_27080 ?auto_27076 ) ( not ( = ?auto_27075 ?auto_27081 ) ) ( HAVE_IMAGE ?auto_27078 ?auto_27077 ) ( not ( = ?auto_27078 ?auto_27075 ) ) ( not ( = ?auto_27078 ?auto_27081 ) ) ( not ( = ?auto_27077 ?auto_27076 ) ) ( CALIBRATION_TARGET ?auto_27080 ?auto_27081 ) ( POWER_AVAIL ?auto_27079 ) ( POINTING ?auto_27079 ?auto_27078 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27078 ?auto_27077 ?auto_27075 ?auto_27076 )
      ( GET-2IMAGE-VERIFY ?auto_27075 ?auto_27076 ?auto_27078 ?auto_27077 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27091 - DIRECTION
      ?auto_27092 - MODE
      ?auto_27094 - DIRECTION
      ?auto_27093 - MODE
      ?auto_27096 - DIRECTION
      ?auto_27095 - MODE
    )
    :vars
    (
      ?auto_27098 - INSTRUMENT
      ?auto_27097 - SATELLITE
      ?auto_27099 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_27098 ?auto_27097 ) ( SUPPORTS ?auto_27098 ?auto_27095 ) ( not ( = ?auto_27096 ?auto_27099 ) ) ( HAVE_IMAGE ?auto_27091 ?auto_27092 ) ( not ( = ?auto_27091 ?auto_27096 ) ) ( not ( = ?auto_27091 ?auto_27099 ) ) ( not ( = ?auto_27092 ?auto_27095 ) ) ( CALIBRATION_TARGET ?auto_27098 ?auto_27099 ) ( POWER_AVAIL ?auto_27097 ) ( POINTING ?auto_27097 ?auto_27091 ) ( HAVE_IMAGE ?auto_27094 ?auto_27093 ) ( not ( = ?auto_27091 ?auto_27094 ) ) ( not ( = ?auto_27092 ?auto_27093 ) ) ( not ( = ?auto_27094 ?auto_27096 ) ) ( not ( = ?auto_27094 ?auto_27099 ) ) ( not ( = ?auto_27093 ?auto_27095 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27091 ?auto_27092 ?auto_27096 ?auto_27095 )
      ( GET-3IMAGE-VERIFY ?auto_27091 ?auto_27092 ?auto_27094 ?auto_27093 ?auto_27096 ?auto_27095 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27100 - DIRECTION
      ?auto_27101 - MODE
      ?auto_27103 - DIRECTION
      ?auto_27102 - MODE
      ?auto_27105 - DIRECTION
      ?auto_27104 - MODE
    )
    :vars
    (
      ?auto_27107 - INSTRUMENT
      ?auto_27106 - SATELLITE
      ?auto_27108 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_27107 ?auto_27106 ) ( SUPPORTS ?auto_27107 ?auto_27102 ) ( not ( = ?auto_27103 ?auto_27108 ) ) ( HAVE_IMAGE ?auto_27100 ?auto_27101 ) ( not ( = ?auto_27100 ?auto_27103 ) ) ( not ( = ?auto_27100 ?auto_27108 ) ) ( not ( = ?auto_27101 ?auto_27102 ) ) ( CALIBRATION_TARGET ?auto_27107 ?auto_27108 ) ( POWER_AVAIL ?auto_27106 ) ( POINTING ?auto_27106 ?auto_27100 ) ( HAVE_IMAGE ?auto_27105 ?auto_27104 ) ( not ( = ?auto_27100 ?auto_27105 ) ) ( not ( = ?auto_27101 ?auto_27104 ) ) ( not ( = ?auto_27103 ?auto_27105 ) ) ( not ( = ?auto_27102 ?auto_27104 ) ) ( not ( = ?auto_27105 ?auto_27108 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27100 ?auto_27101 ?auto_27103 ?auto_27102 )
      ( GET-3IMAGE-VERIFY ?auto_27100 ?auto_27101 ?auto_27103 ?auto_27102 ?auto_27105 ?auto_27104 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27118 - DIRECTION
      ?auto_27119 - MODE
      ?auto_27121 - DIRECTION
      ?auto_27120 - MODE
      ?auto_27123 - DIRECTION
      ?auto_27122 - MODE
    )
    :vars
    (
      ?auto_27125 - INSTRUMENT
      ?auto_27124 - SATELLITE
      ?auto_27126 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_27125 ?auto_27124 ) ( SUPPORTS ?auto_27125 ?auto_27119 ) ( not ( = ?auto_27118 ?auto_27126 ) ) ( HAVE_IMAGE ?auto_27123 ?auto_27122 ) ( not ( = ?auto_27123 ?auto_27118 ) ) ( not ( = ?auto_27123 ?auto_27126 ) ) ( not ( = ?auto_27122 ?auto_27119 ) ) ( CALIBRATION_TARGET ?auto_27125 ?auto_27126 ) ( POWER_AVAIL ?auto_27124 ) ( POINTING ?auto_27124 ?auto_27123 ) ( HAVE_IMAGE ?auto_27121 ?auto_27120 ) ( not ( = ?auto_27118 ?auto_27121 ) ) ( not ( = ?auto_27119 ?auto_27120 ) ) ( not ( = ?auto_27121 ?auto_27123 ) ) ( not ( = ?auto_27121 ?auto_27126 ) ) ( not ( = ?auto_27120 ?auto_27122 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27123 ?auto_27122 ?auto_27118 ?auto_27119 )
      ( GET-3IMAGE-VERIFY ?auto_27118 ?auto_27119 ?auto_27121 ?auto_27120 ?auto_27123 ?auto_27122 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_27156 - DIRECTION
      ?auto_27157 - MODE
    )
    :vars
    (
      ?auto_27159 - INSTRUMENT
      ?auto_27158 - SATELLITE
      ?auto_27162 - DIRECTION
      ?auto_27160 - DIRECTION
      ?auto_27161 - MODE
      ?auto_27163 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27159 ?auto_27158 ) ( SUPPORTS ?auto_27159 ?auto_27157 ) ( not ( = ?auto_27156 ?auto_27162 ) ) ( HAVE_IMAGE ?auto_27160 ?auto_27161 ) ( not ( = ?auto_27160 ?auto_27156 ) ) ( not ( = ?auto_27160 ?auto_27162 ) ) ( not ( = ?auto_27161 ?auto_27157 ) ) ( CALIBRATION_TARGET ?auto_27159 ?auto_27162 ) ( POINTING ?auto_27158 ?auto_27160 ) ( ON_BOARD ?auto_27163 ?auto_27158 ) ( POWER_ON ?auto_27163 ) ( not ( = ?auto_27159 ?auto_27163 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_27163 ?auto_27158 )
      ( GET-2IMAGE ?auto_27160 ?auto_27161 ?auto_27156 ?auto_27157 )
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
      ?auto_27169 - SATELLITE
      ?auto_27171 - DIRECTION
      ?auto_27170 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27168 ?auto_27169 ) ( SUPPORTS ?auto_27168 ?auto_27166 ) ( not ( = ?auto_27167 ?auto_27171 ) ) ( HAVE_IMAGE ?auto_27164 ?auto_27165 ) ( not ( = ?auto_27164 ?auto_27167 ) ) ( not ( = ?auto_27164 ?auto_27171 ) ) ( not ( = ?auto_27165 ?auto_27166 ) ) ( CALIBRATION_TARGET ?auto_27168 ?auto_27171 ) ( POINTING ?auto_27169 ?auto_27164 ) ( ON_BOARD ?auto_27170 ?auto_27169 ) ( POWER_ON ?auto_27170 ) ( not ( = ?auto_27168 ?auto_27170 ) ) )
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
      ?auto_27176 - INSTRUMENT
      ?auto_27179 - SATELLITE
      ?auto_27177 - DIRECTION
      ?auto_27178 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27176 ?auto_27179 ) ( SUPPORTS ?auto_27176 ?auto_27173 ) ( not ( = ?auto_27172 ?auto_27177 ) ) ( HAVE_IMAGE ?auto_27175 ?auto_27174 ) ( not ( = ?auto_27175 ?auto_27172 ) ) ( not ( = ?auto_27175 ?auto_27177 ) ) ( not ( = ?auto_27174 ?auto_27173 ) ) ( CALIBRATION_TARGET ?auto_27176 ?auto_27177 ) ( POINTING ?auto_27179 ?auto_27175 ) ( ON_BOARD ?auto_27178 ?auto_27179 ) ( POWER_ON ?auto_27178 ) ( not ( = ?auto_27176 ?auto_27178 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27175 ?auto_27174 ?auto_27172 ?auto_27173 )
      ( GET-2IMAGE-VERIFY ?auto_27172 ?auto_27173 ?auto_27175 ?auto_27174 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27190 - DIRECTION
      ?auto_27191 - MODE
      ?auto_27193 - DIRECTION
      ?auto_27192 - MODE
      ?auto_27195 - DIRECTION
      ?auto_27194 - MODE
    )
    :vars
    (
      ?auto_27196 - INSTRUMENT
      ?auto_27199 - SATELLITE
      ?auto_27197 - DIRECTION
      ?auto_27198 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27196 ?auto_27199 ) ( SUPPORTS ?auto_27196 ?auto_27194 ) ( not ( = ?auto_27195 ?auto_27197 ) ) ( HAVE_IMAGE ?auto_27193 ?auto_27191 ) ( not ( = ?auto_27193 ?auto_27195 ) ) ( not ( = ?auto_27193 ?auto_27197 ) ) ( not ( = ?auto_27191 ?auto_27194 ) ) ( CALIBRATION_TARGET ?auto_27196 ?auto_27197 ) ( POINTING ?auto_27199 ?auto_27193 ) ( ON_BOARD ?auto_27198 ?auto_27199 ) ( POWER_ON ?auto_27198 ) ( not ( = ?auto_27196 ?auto_27198 ) ) ( HAVE_IMAGE ?auto_27190 ?auto_27191 ) ( HAVE_IMAGE ?auto_27193 ?auto_27192 ) ( not ( = ?auto_27190 ?auto_27193 ) ) ( not ( = ?auto_27190 ?auto_27195 ) ) ( not ( = ?auto_27190 ?auto_27197 ) ) ( not ( = ?auto_27191 ?auto_27192 ) ) ( not ( = ?auto_27192 ?auto_27194 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27193 ?auto_27191 ?auto_27195 ?auto_27194 )
      ( GET-3IMAGE-VERIFY ?auto_27190 ?auto_27191 ?auto_27193 ?auto_27192 ?auto_27195 ?auto_27194 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27200 - DIRECTION
      ?auto_27201 - MODE
      ?auto_27203 - DIRECTION
      ?auto_27202 - MODE
      ?auto_27205 - DIRECTION
      ?auto_27204 - MODE
    )
    :vars
    (
      ?auto_27206 - INSTRUMENT
      ?auto_27209 - SATELLITE
      ?auto_27207 - DIRECTION
      ?auto_27208 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27206 ?auto_27209 ) ( SUPPORTS ?auto_27206 ?auto_27202 ) ( not ( = ?auto_27203 ?auto_27207 ) ) ( HAVE_IMAGE ?auto_27200 ?auto_27204 ) ( not ( = ?auto_27200 ?auto_27203 ) ) ( not ( = ?auto_27200 ?auto_27207 ) ) ( not ( = ?auto_27204 ?auto_27202 ) ) ( CALIBRATION_TARGET ?auto_27206 ?auto_27207 ) ( POINTING ?auto_27209 ?auto_27200 ) ( ON_BOARD ?auto_27208 ?auto_27209 ) ( POWER_ON ?auto_27208 ) ( not ( = ?auto_27206 ?auto_27208 ) ) ( HAVE_IMAGE ?auto_27200 ?auto_27201 ) ( HAVE_IMAGE ?auto_27205 ?auto_27204 ) ( not ( = ?auto_27200 ?auto_27205 ) ) ( not ( = ?auto_27201 ?auto_27202 ) ) ( not ( = ?auto_27201 ?auto_27204 ) ) ( not ( = ?auto_27203 ?auto_27205 ) ) ( not ( = ?auto_27205 ?auto_27207 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27200 ?auto_27204 ?auto_27203 ?auto_27202 )
      ( GET-3IMAGE-VERIFY ?auto_27200 ?auto_27201 ?auto_27203 ?auto_27202 ?auto_27205 ?auto_27204 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27220 - DIRECTION
      ?auto_27221 - MODE
      ?auto_27223 - DIRECTION
      ?auto_27222 - MODE
      ?auto_27225 - DIRECTION
      ?auto_27224 - MODE
    )
    :vars
    (
      ?auto_27226 - INSTRUMENT
      ?auto_27229 - SATELLITE
      ?auto_27227 - DIRECTION
      ?auto_27228 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27226 ?auto_27229 ) ( SUPPORTS ?auto_27226 ?auto_27221 ) ( not ( = ?auto_27220 ?auto_27227 ) ) ( HAVE_IMAGE ?auto_27225 ?auto_27222 ) ( not ( = ?auto_27225 ?auto_27220 ) ) ( not ( = ?auto_27225 ?auto_27227 ) ) ( not ( = ?auto_27222 ?auto_27221 ) ) ( CALIBRATION_TARGET ?auto_27226 ?auto_27227 ) ( POINTING ?auto_27229 ?auto_27225 ) ( ON_BOARD ?auto_27228 ?auto_27229 ) ( POWER_ON ?auto_27228 ) ( not ( = ?auto_27226 ?auto_27228 ) ) ( HAVE_IMAGE ?auto_27223 ?auto_27222 ) ( HAVE_IMAGE ?auto_27225 ?auto_27224 ) ( not ( = ?auto_27220 ?auto_27223 ) ) ( not ( = ?auto_27221 ?auto_27224 ) ) ( not ( = ?auto_27223 ?auto_27225 ) ) ( not ( = ?auto_27223 ?auto_27227 ) ) ( not ( = ?auto_27222 ?auto_27224 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27225 ?auto_27222 ?auto_27220 ?auto_27221 )
      ( GET-3IMAGE-VERIFY ?auto_27220 ?auto_27221 ?auto_27223 ?auto_27222 ?auto_27225 ?auto_27224 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_27262 - DIRECTION
      ?auto_27263 - MODE
    )
    :vars
    (
      ?auto_27264 - INSTRUMENT
      ?auto_27269 - SATELLITE
      ?auto_27265 - DIRECTION
      ?auto_27268 - DIRECTION
      ?auto_27266 - MODE
      ?auto_27267 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27264 ?auto_27269 ) ( SUPPORTS ?auto_27264 ?auto_27263 ) ( not ( = ?auto_27262 ?auto_27265 ) ) ( not ( = ?auto_27268 ?auto_27262 ) ) ( not ( = ?auto_27268 ?auto_27265 ) ) ( not ( = ?auto_27266 ?auto_27263 ) ) ( CALIBRATION_TARGET ?auto_27264 ?auto_27265 ) ( POINTING ?auto_27269 ?auto_27268 ) ( ON_BOARD ?auto_27267 ?auto_27269 ) ( POWER_ON ?auto_27267 ) ( not ( = ?auto_27264 ?auto_27267 ) ) ( CALIBRATED ?auto_27267 ) ( SUPPORTS ?auto_27267 ?auto_27266 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27268 ?auto_27266 )
      ( GET-2IMAGE ?auto_27268 ?auto_27266 ?auto_27262 ?auto_27263 )
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
      ?auto_27275 - INSTRUMENT
      ?auto_27277 - SATELLITE
      ?auto_27276 - DIRECTION
      ?auto_27274 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27275 ?auto_27277 ) ( SUPPORTS ?auto_27275 ?auto_27272 ) ( not ( = ?auto_27273 ?auto_27276 ) ) ( not ( = ?auto_27270 ?auto_27273 ) ) ( not ( = ?auto_27270 ?auto_27276 ) ) ( not ( = ?auto_27271 ?auto_27272 ) ) ( CALIBRATION_TARGET ?auto_27275 ?auto_27276 ) ( POINTING ?auto_27277 ?auto_27270 ) ( ON_BOARD ?auto_27274 ?auto_27277 ) ( POWER_ON ?auto_27274 ) ( not ( = ?auto_27275 ?auto_27274 ) ) ( CALIBRATED ?auto_27274 ) ( SUPPORTS ?auto_27274 ?auto_27271 ) )
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
      ?auto_27284 - INSTRUMENT
      ?auto_27285 - SATELLITE
      ?auto_27283 - DIRECTION
      ?auto_27282 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27284 ?auto_27285 ) ( SUPPORTS ?auto_27284 ?auto_27279 ) ( not ( = ?auto_27278 ?auto_27283 ) ) ( not ( = ?auto_27281 ?auto_27278 ) ) ( not ( = ?auto_27281 ?auto_27283 ) ) ( not ( = ?auto_27280 ?auto_27279 ) ) ( CALIBRATION_TARGET ?auto_27284 ?auto_27283 ) ( POINTING ?auto_27285 ?auto_27281 ) ( ON_BOARD ?auto_27282 ?auto_27285 ) ( POWER_ON ?auto_27282 ) ( not ( = ?auto_27284 ?auto_27282 ) ) ( CALIBRATED ?auto_27282 ) ( SUPPORTS ?auto_27282 ?auto_27280 ) )
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
      ?auto_27374 - INSTRUMENT
      ?auto_27375 - SATELLITE
      ?auto_27373 - DIRECTION
      ?auto_27372 - DIRECTION
      ?auto_27370 - MODE
      ?auto_27371 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27374 ?auto_27375 ) ( SUPPORTS ?auto_27374 ?auto_27369 ) ( not ( = ?auto_27368 ?auto_27373 ) ) ( not ( = ?auto_27372 ?auto_27368 ) ) ( not ( = ?auto_27372 ?auto_27373 ) ) ( not ( = ?auto_27370 ?auto_27369 ) ) ( CALIBRATION_TARGET ?auto_27374 ?auto_27373 ) ( ON_BOARD ?auto_27371 ?auto_27375 ) ( POWER_ON ?auto_27371 ) ( not ( = ?auto_27374 ?auto_27371 ) ) ( CALIBRATED ?auto_27371 ) ( SUPPORTS ?auto_27371 ?auto_27370 ) ( POINTING ?auto_27375 ?auto_27373 ) )
    :subtasks
    ( ( !TURN_TO ?auto_27375 ?auto_27372 ?auto_27373 )
      ( GET-2IMAGE ?auto_27372 ?auto_27370 ?auto_27368 ?auto_27369 )
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
      ?auto_27382 - INSTRUMENT
      ?auto_27380 - SATELLITE
      ?auto_27381 - DIRECTION
      ?auto_27383 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27382 ?auto_27380 ) ( SUPPORTS ?auto_27382 ?auto_27378 ) ( not ( = ?auto_27379 ?auto_27381 ) ) ( not ( = ?auto_27376 ?auto_27379 ) ) ( not ( = ?auto_27376 ?auto_27381 ) ) ( not ( = ?auto_27377 ?auto_27378 ) ) ( CALIBRATION_TARGET ?auto_27382 ?auto_27381 ) ( ON_BOARD ?auto_27383 ?auto_27380 ) ( POWER_ON ?auto_27383 ) ( not ( = ?auto_27382 ?auto_27383 ) ) ( CALIBRATED ?auto_27383 ) ( SUPPORTS ?auto_27383 ?auto_27377 ) ( POINTING ?auto_27380 ?auto_27381 ) )
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
      ?auto_27388 - INSTRUMENT
      ?auto_27390 - SATELLITE
      ?auto_27391 - DIRECTION
      ?auto_27389 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27388 ?auto_27390 ) ( SUPPORTS ?auto_27388 ?auto_27385 ) ( not ( = ?auto_27384 ?auto_27391 ) ) ( not ( = ?auto_27387 ?auto_27384 ) ) ( not ( = ?auto_27387 ?auto_27391 ) ) ( not ( = ?auto_27386 ?auto_27385 ) ) ( CALIBRATION_TARGET ?auto_27388 ?auto_27391 ) ( ON_BOARD ?auto_27389 ?auto_27390 ) ( POWER_ON ?auto_27389 ) ( not ( = ?auto_27388 ?auto_27389 ) ) ( CALIBRATED ?auto_27389 ) ( SUPPORTS ?auto_27389 ?auto_27386 ) ( POINTING ?auto_27390 ?auto_27391 ) )
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
      ?auto_27476 - INSTRUMENT
      ?auto_27480 - SATELLITE
      ?auto_27481 - DIRECTION
      ?auto_27478 - DIRECTION
      ?auto_27477 - MODE
      ?auto_27479 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27476 ?auto_27480 ) ( SUPPORTS ?auto_27476 ?auto_27475 ) ( not ( = ?auto_27474 ?auto_27481 ) ) ( not ( = ?auto_27478 ?auto_27474 ) ) ( not ( = ?auto_27478 ?auto_27481 ) ) ( not ( = ?auto_27477 ?auto_27475 ) ) ( CALIBRATION_TARGET ?auto_27476 ?auto_27481 ) ( ON_BOARD ?auto_27479 ?auto_27480 ) ( POWER_ON ?auto_27479 ) ( not ( = ?auto_27476 ?auto_27479 ) ) ( SUPPORTS ?auto_27479 ?auto_27477 ) ( POINTING ?auto_27480 ?auto_27481 ) ( CALIBRATION_TARGET ?auto_27479 ?auto_27481 ) ( NOT_CALIBRATED ?auto_27479 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_27480 ?auto_27479 ?auto_27481 )
      ( GET-2IMAGE ?auto_27478 ?auto_27477 ?auto_27474 ?auto_27475 )
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
      ?auto_27486 - INSTRUMENT
      ?auto_27488 - SATELLITE
      ?auto_27487 - DIRECTION
      ?auto_27489 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27486 ?auto_27488 ) ( SUPPORTS ?auto_27486 ?auto_27484 ) ( not ( = ?auto_27485 ?auto_27487 ) ) ( not ( = ?auto_27482 ?auto_27485 ) ) ( not ( = ?auto_27482 ?auto_27487 ) ) ( not ( = ?auto_27483 ?auto_27484 ) ) ( CALIBRATION_TARGET ?auto_27486 ?auto_27487 ) ( ON_BOARD ?auto_27489 ?auto_27488 ) ( POWER_ON ?auto_27489 ) ( not ( = ?auto_27486 ?auto_27489 ) ) ( SUPPORTS ?auto_27489 ?auto_27483 ) ( POINTING ?auto_27488 ?auto_27487 ) ( CALIBRATION_TARGET ?auto_27489 ?auto_27487 ) ( NOT_CALIBRATED ?auto_27489 ) )
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
      ?auto_27497 - DIRECTION
      ?auto_27496 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27495 ?auto_27494 ) ( SUPPORTS ?auto_27495 ?auto_27491 ) ( not ( = ?auto_27490 ?auto_27497 ) ) ( not ( = ?auto_27493 ?auto_27490 ) ) ( not ( = ?auto_27493 ?auto_27497 ) ) ( not ( = ?auto_27492 ?auto_27491 ) ) ( CALIBRATION_TARGET ?auto_27495 ?auto_27497 ) ( ON_BOARD ?auto_27496 ?auto_27494 ) ( POWER_ON ?auto_27496 ) ( not ( = ?auto_27495 ?auto_27496 ) ) ( SUPPORTS ?auto_27496 ?auto_27492 ) ( POINTING ?auto_27494 ?auto_27497 ) ( CALIBRATION_TARGET ?auto_27496 ?auto_27497 ) ( NOT_CALIBRATED ?auto_27496 ) )
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
      ?auto_27583 - INSTRUMENT
      ?auto_27582 - SATELLITE
      ?auto_27587 - DIRECTION
      ?auto_27585 - DIRECTION
      ?auto_27586 - MODE
      ?auto_27584 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27583 ?auto_27582 ) ( SUPPORTS ?auto_27583 ?auto_27581 ) ( not ( = ?auto_27580 ?auto_27587 ) ) ( not ( = ?auto_27585 ?auto_27580 ) ) ( not ( = ?auto_27585 ?auto_27587 ) ) ( not ( = ?auto_27586 ?auto_27581 ) ) ( CALIBRATION_TARGET ?auto_27583 ?auto_27587 ) ( ON_BOARD ?auto_27584 ?auto_27582 ) ( not ( = ?auto_27583 ?auto_27584 ) ) ( SUPPORTS ?auto_27584 ?auto_27586 ) ( POINTING ?auto_27582 ?auto_27587 ) ( CALIBRATION_TARGET ?auto_27584 ?auto_27587 ) ( POWER_AVAIL ?auto_27582 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_27584 ?auto_27582 )
      ( GET-2IMAGE ?auto_27585 ?auto_27586 ?auto_27580 ?auto_27581 )
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
      ?auto_27593 - INSTRUMENT
      ?auto_27594 - SATELLITE
      ?auto_27595 - DIRECTION
      ?auto_27592 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27593 ?auto_27594 ) ( SUPPORTS ?auto_27593 ?auto_27590 ) ( not ( = ?auto_27591 ?auto_27595 ) ) ( not ( = ?auto_27588 ?auto_27591 ) ) ( not ( = ?auto_27588 ?auto_27595 ) ) ( not ( = ?auto_27589 ?auto_27590 ) ) ( CALIBRATION_TARGET ?auto_27593 ?auto_27595 ) ( ON_BOARD ?auto_27592 ?auto_27594 ) ( not ( = ?auto_27593 ?auto_27592 ) ) ( SUPPORTS ?auto_27592 ?auto_27589 ) ( POINTING ?auto_27594 ?auto_27595 ) ( CALIBRATION_TARGET ?auto_27592 ?auto_27595 ) ( POWER_AVAIL ?auto_27594 ) )
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
      ?auto_27602 - INSTRUMENT
      ?auto_27600 - SATELLITE
      ?auto_27601 - DIRECTION
      ?auto_27603 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27602 ?auto_27600 ) ( SUPPORTS ?auto_27602 ?auto_27597 ) ( not ( = ?auto_27596 ?auto_27601 ) ) ( not ( = ?auto_27599 ?auto_27596 ) ) ( not ( = ?auto_27599 ?auto_27601 ) ) ( not ( = ?auto_27598 ?auto_27597 ) ) ( CALIBRATION_TARGET ?auto_27602 ?auto_27601 ) ( ON_BOARD ?auto_27603 ?auto_27600 ) ( not ( = ?auto_27602 ?auto_27603 ) ) ( SUPPORTS ?auto_27603 ?auto_27598 ) ( POINTING ?auto_27600 ?auto_27601 ) ( CALIBRATION_TARGET ?auto_27603 ?auto_27601 ) ( POWER_AVAIL ?auto_27600 ) )
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
      ?auto_27692 - INSTRUMENT
      ?auto_27688 - SATELLITE
      ?auto_27689 - DIRECTION
      ?auto_27691 - DIRECTION
      ?auto_27690 - MODE
      ?auto_27693 - INSTRUMENT
      ?auto_27694 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_27692 ?auto_27688 ) ( SUPPORTS ?auto_27692 ?auto_27687 ) ( not ( = ?auto_27686 ?auto_27689 ) ) ( not ( = ?auto_27691 ?auto_27686 ) ) ( not ( = ?auto_27691 ?auto_27689 ) ) ( not ( = ?auto_27690 ?auto_27687 ) ) ( CALIBRATION_TARGET ?auto_27692 ?auto_27689 ) ( ON_BOARD ?auto_27693 ?auto_27688 ) ( not ( = ?auto_27692 ?auto_27693 ) ) ( SUPPORTS ?auto_27693 ?auto_27690 ) ( CALIBRATION_TARGET ?auto_27693 ?auto_27689 ) ( POWER_AVAIL ?auto_27688 ) ( POINTING ?auto_27688 ?auto_27694 ) ( not ( = ?auto_27689 ?auto_27694 ) ) ( not ( = ?auto_27686 ?auto_27694 ) ) ( not ( = ?auto_27691 ?auto_27694 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_27688 ?auto_27689 ?auto_27694 )
      ( GET-2IMAGE ?auto_27691 ?auto_27690 ?auto_27686 ?auto_27687 )
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
      ?auto_27703 - SATELLITE
      ?auto_27702 - DIRECTION
      ?auto_27700 - INSTRUMENT
      ?auto_27699 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_27701 ?auto_27703 ) ( SUPPORTS ?auto_27701 ?auto_27697 ) ( not ( = ?auto_27698 ?auto_27702 ) ) ( not ( = ?auto_27695 ?auto_27698 ) ) ( not ( = ?auto_27695 ?auto_27702 ) ) ( not ( = ?auto_27696 ?auto_27697 ) ) ( CALIBRATION_TARGET ?auto_27701 ?auto_27702 ) ( ON_BOARD ?auto_27700 ?auto_27703 ) ( not ( = ?auto_27701 ?auto_27700 ) ) ( SUPPORTS ?auto_27700 ?auto_27696 ) ( CALIBRATION_TARGET ?auto_27700 ?auto_27702 ) ( POWER_AVAIL ?auto_27703 ) ( POINTING ?auto_27703 ?auto_27699 ) ( not ( = ?auto_27702 ?auto_27699 ) ) ( not ( = ?auto_27698 ?auto_27699 ) ) ( not ( = ?auto_27695 ?auto_27699 ) ) )
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
      ?auto_27710 - SATELLITE
      ?auto_27711 - DIRECTION
      ?auto_27712 - INSTRUMENT
      ?auto_27709 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_27708 ?auto_27710 ) ( SUPPORTS ?auto_27708 ?auto_27705 ) ( not ( = ?auto_27704 ?auto_27711 ) ) ( not ( = ?auto_27707 ?auto_27704 ) ) ( not ( = ?auto_27707 ?auto_27711 ) ) ( not ( = ?auto_27706 ?auto_27705 ) ) ( CALIBRATION_TARGET ?auto_27708 ?auto_27711 ) ( ON_BOARD ?auto_27712 ?auto_27710 ) ( not ( = ?auto_27708 ?auto_27712 ) ) ( SUPPORTS ?auto_27712 ?auto_27706 ) ( CALIBRATION_TARGET ?auto_27712 ?auto_27711 ) ( POWER_AVAIL ?auto_27710 ) ( POINTING ?auto_27710 ?auto_27709 ) ( not ( = ?auto_27711 ?auto_27709 ) ) ( not ( = ?auto_27704 ?auto_27709 ) ) ( not ( = ?auto_27707 ?auto_27709 ) ) )
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
    ( and ( CALIBRATED ?auto_27948 ) ( ON_BOARD ?auto_27948 ?auto_27947 ) ( SUPPORTS ?auto_27948 ?auto_27945 ) ( POWER_ON ?auto_27948 ) ( POINTING ?auto_27947 ?auto_27946 ) ( HAVE_IMAGE ?auto_27943 ?auto_27944 ) ( not ( = ?auto_27943 ?auto_27946 ) ) ( not ( = ?auto_27944 ?auto_27945 ) ) )
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
    ( and ( CALIBRATED ?auto_27954 ) ( ON_BOARD ?auto_27954 ?auto_27953 ) ( SUPPORTS ?auto_27954 ?auto_27951 ) ( POWER_ON ?auto_27954 ) ( POINTING ?auto_27953 ?auto_27952 ) ( HAVE_IMAGE ?auto_27949 ?auto_27950 ) ( not ( = ?auto_27949 ?auto_27952 ) ) ( not ( = ?auto_27950 ?auto_27951 ) ) )
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
    ( and ( CALIBRATED ?auto_27960 ) ( ON_BOARD ?auto_27960 ?auto_27959 ) ( SUPPORTS ?auto_27960 ?auto_27956 ) ( POWER_ON ?auto_27960 ) ( POINTING ?auto_27959 ?auto_27955 ) ( HAVE_IMAGE ?auto_27958 ?auto_27957 ) ( not ( = ?auto_27955 ?auto_27958 ) ) ( not ( = ?auto_27956 ?auto_27957 ) ) )
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
    ( and ( CALIBRATED ?auto_27966 ) ( ON_BOARD ?auto_27966 ?auto_27965 ) ( SUPPORTS ?auto_27966 ?auto_27962 ) ( POWER_ON ?auto_27966 ) ( POINTING ?auto_27965 ?auto_27961 ) ( HAVE_IMAGE ?auto_27964 ?auto_27963 ) ( not ( = ?auto_27961 ?auto_27964 ) ) ( not ( = ?auto_27962 ?auto_27963 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27961 ?auto_27962 )
      ( GET-2IMAGE-VERIFY ?auto_27961 ?auto_27962 ?auto_27964 ?auto_27963 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27973 - DIRECTION
      ?auto_27974 - MODE
      ?auto_27976 - DIRECTION
      ?auto_27975 - MODE
      ?auto_27978 - DIRECTION
      ?auto_27977 - MODE
    )
    :vars
    (
      ?auto_27980 - INSTRUMENT
      ?auto_27979 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_27980 ) ( ON_BOARD ?auto_27980 ?auto_27979 ) ( SUPPORTS ?auto_27980 ?auto_27977 ) ( POWER_ON ?auto_27980 ) ( POINTING ?auto_27979 ?auto_27978 ) ( HAVE_IMAGE ?auto_27973 ?auto_27974 ) ( HAVE_IMAGE ?auto_27976 ?auto_27975 ) ( not ( = ?auto_27973 ?auto_27976 ) ) ( not ( = ?auto_27973 ?auto_27978 ) ) ( not ( = ?auto_27974 ?auto_27975 ) ) ( not ( = ?auto_27974 ?auto_27977 ) ) ( not ( = ?auto_27976 ?auto_27978 ) ) ( not ( = ?auto_27975 ?auto_27977 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27978 ?auto_27977 )
      ( GET-3IMAGE-VERIFY ?auto_27973 ?auto_27974 ?auto_27976 ?auto_27975 ?auto_27978 ?auto_27977 ) )
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
    ( and ( CALIBRATED ?auto_27988 ) ( ON_BOARD ?auto_27988 ?auto_27987 ) ( SUPPORTS ?auto_27988 ?auto_27985 ) ( POWER_ON ?auto_27988 ) ( POINTING ?auto_27987 ?auto_27986 ) ( HAVE_IMAGE ?auto_27981 ?auto_27982 ) ( HAVE_IMAGE ?auto_27984 ?auto_27983 ) ( not ( = ?auto_27981 ?auto_27984 ) ) ( not ( = ?auto_27981 ?auto_27986 ) ) ( not ( = ?auto_27982 ?auto_27983 ) ) ( not ( = ?auto_27982 ?auto_27985 ) ) ( not ( = ?auto_27984 ?auto_27986 ) ) ( not ( = ?auto_27983 ?auto_27985 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27986 ?auto_27985 )
      ( GET-3IMAGE-VERIFY ?auto_27981 ?auto_27982 ?auto_27984 ?auto_27983 ?auto_27986 ?auto_27985 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27989 - DIRECTION
      ?auto_27990 - MODE
      ?auto_27992 - DIRECTION
      ?auto_27991 - MODE
      ?auto_27994 - DIRECTION
      ?auto_27993 - MODE
    )
    :vars
    (
      ?auto_27996 - INSTRUMENT
      ?auto_27995 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_27996 ) ( ON_BOARD ?auto_27996 ?auto_27995 ) ( SUPPORTS ?auto_27996 ?auto_27991 ) ( POWER_ON ?auto_27996 ) ( POINTING ?auto_27995 ?auto_27992 ) ( HAVE_IMAGE ?auto_27989 ?auto_27990 ) ( HAVE_IMAGE ?auto_27994 ?auto_27993 ) ( not ( = ?auto_27989 ?auto_27992 ) ) ( not ( = ?auto_27989 ?auto_27994 ) ) ( not ( = ?auto_27990 ?auto_27991 ) ) ( not ( = ?auto_27990 ?auto_27993 ) ) ( not ( = ?auto_27992 ?auto_27994 ) ) ( not ( = ?auto_27991 ?auto_27993 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_27992 ?auto_27991 )
      ( GET-3IMAGE-VERIFY ?auto_27989 ?auto_27990 ?auto_27992 ?auto_27991 ?auto_27994 ?auto_27993 ) )
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
    ( and ( CALIBRATED ?auto_28004 ) ( ON_BOARD ?auto_28004 ?auto_28003 ) ( SUPPORTS ?auto_28004 ?auto_27999 ) ( POWER_ON ?auto_28004 ) ( POINTING ?auto_28003 ?auto_28000 ) ( HAVE_IMAGE ?auto_27997 ?auto_27998 ) ( HAVE_IMAGE ?auto_28002 ?auto_28001 ) ( not ( = ?auto_27997 ?auto_28000 ) ) ( not ( = ?auto_27997 ?auto_28002 ) ) ( not ( = ?auto_27998 ?auto_27999 ) ) ( not ( = ?auto_27998 ?auto_28001 ) ) ( not ( = ?auto_28000 ?auto_28002 ) ) ( not ( = ?auto_27999 ?auto_28001 ) ) )
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
    ( and ( CALIBRATED ?auto_28020 ) ( ON_BOARD ?auto_28020 ?auto_28019 ) ( SUPPORTS ?auto_28020 ?auto_28017 ) ( POWER_ON ?auto_28020 ) ( POINTING ?auto_28019 ?auto_28018 ) ( HAVE_IMAGE ?auto_28013 ?auto_28014 ) ( HAVE_IMAGE ?auto_28016 ?auto_28015 ) ( not ( = ?auto_28013 ?auto_28016 ) ) ( not ( = ?auto_28013 ?auto_28018 ) ) ( not ( = ?auto_28014 ?auto_28015 ) ) ( not ( = ?auto_28014 ?auto_28017 ) ) ( not ( = ?auto_28016 ?auto_28018 ) ) ( not ( = ?auto_28015 ?auto_28017 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28018 ?auto_28017 )
      ( GET-3IMAGE-VERIFY ?auto_28013 ?auto_28014 ?auto_28016 ?auto_28015 ?auto_28018 ?auto_28017 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28021 - DIRECTION
      ?auto_28022 - MODE
      ?auto_28024 - DIRECTION
      ?auto_28023 - MODE
      ?auto_28026 - DIRECTION
      ?auto_28025 - MODE
    )
    :vars
    (
      ?auto_28028 - INSTRUMENT
      ?auto_28027 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_28028 ) ( ON_BOARD ?auto_28028 ?auto_28027 ) ( SUPPORTS ?auto_28028 ?auto_28025 ) ( POWER_ON ?auto_28028 ) ( POINTING ?auto_28027 ?auto_28026 ) ( HAVE_IMAGE ?auto_28021 ?auto_28022 ) ( HAVE_IMAGE ?auto_28024 ?auto_28023 ) ( not ( = ?auto_28021 ?auto_28024 ) ) ( not ( = ?auto_28021 ?auto_28026 ) ) ( not ( = ?auto_28022 ?auto_28023 ) ) ( not ( = ?auto_28022 ?auto_28025 ) ) ( not ( = ?auto_28024 ?auto_28026 ) ) ( not ( = ?auto_28023 ?auto_28025 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28026 ?auto_28025 )
      ( GET-3IMAGE-VERIFY ?auto_28021 ?auto_28022 ?auto_28024 ?auto_28023 ?auto_28026 ?auto_28025 ) )
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
    ( and ( CALIBRATED ?auto_28036 ) ( ON_BOARD ?auto_28036 ?auto_28035 ) ( SUPPORTS ?auto_28036 ?auto_28031 ) ( POWER_ON ?auto_28036 ) ( POINTING ?auto_28035 ?auto_28032 ) ( HAVE_IMAGE ?auto_28029 ?auto_28030 ) ( HAVE_IMAGE ?auto_28034 ?auto_28033 ) ( not ( = ?auto_28029 ?auto_28032 ) ) ( not ( = ?auto_28029 ?auto_28034 ) ) ( not ( = ?auto_28030 ?auto_28031 ) ) ( not ( = ?auto_28030 ?auto_28033 ) ) ( not ( = ?auto_28032 ?auto_28034 ) ) ( not ( = ?auto_28031 ?auto_28033 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28032 ?auto_28031 )
      ( GET-3IMAGE-VERIFY ?auto_28029 ?auto_28030 ?auto_28032 ?auto_28031 ?auto_28034 ?auto_28033 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28037 - DIRECTION
      ?auto_28038 - MODE
      ?auto_28040 - DIRECTION
      ?auto_28039 - MODE
      ?auto_28042 - DIRECTION
      ?auto_28041 - MODE
    )
    :vars
    (
      ?auto_28044 - INSTRUMENT
      ?auto_28043 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_28044 ) ( ON_BOARD ?auto_28044 ?auto_28043 ) ( SUPPORTS ?auto_28044 ?auto_28039 ) ( POWER_ON ?auto_28044 ) ( POINTING ?auto_28043 ?auto_28040 ) ( HAVE_IMAGE ?auto_28037 ?auto_28038 ) ( HAVE_IMAGE ?auto_28042 ?auto_28041 ) ( not ( = ?auto_28037 ?auto_28040 ) ) ( not ( = ?auto_28037 ?auto_28042 ) ) ( not ( = ?auto_28038 ?auto_28039 ) ) ( not ( = ?auto_28038 ?auto_28041 ) ) ( not ( = ?auto_28040 ?auto_28042 ) ) ( not ( = ?auto_28039 ?auto_28041 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28040 ?auto_28039 )
      ( GET-3IMAGE-VERIFY ?auto_28037 ?auto_28038 ?auto_28040 ?auto_28039 ?auto_28042 ?auto_28041 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28053 - DIRECTION
      ?auto_28054 - MODE
      ?auto_28056 - DIRECTION
      ?auto_28055 - MODE
      ?auto_28058 - DIRECTION
      ?auto_28057 - MODE
    )
    :vars
    (
      ?auto_28060 - INSTRUMENT
      ?auto_28059 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_28060 ) ( ON_BOARD ?auto_28060 ?auto_28059 ) ( SUPPORTS ?auto_28060 ?auto_28054 ) ( POWER_ON ?auto_28060 ) ( POINTING ?auto_28059 ?auto_28053 ) ( HAVE_IMAGE ?auto_28056 ?auto_28055 ) ( HAVE_IMAGE ?auto_28058 ?auto_28057 ) ( not ( = ?auto_28053 ?auto_28056 ) ) ( not ( = ?auto_28053 ?auto_28058 ) ) ( not ( = ?auto_28054 ?auto_28055 ) ) ( not ( = ?auto_28054 ?auto_28057 ) ) ( not ( = ?auto_28056 ?auto_28058 ) ) ( not ( = ?auto_28055 ?auto_28057 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28053 ?auto_28054 )
      ( GET-3IMAGE-VERIFY ?auto_28053 ?auto_28054 ?auto_28056 ?auto_28055 ?auto_28058 ?auto_28057 ) )
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
    ( and ( CALIBRATED ?auto_28068 ) ( ON_BOARD ?auto_28068 ?auto_28067 ) ( SUPPORTS ?auto_28068 ?auto_28062 ) ( POWER_ON ?auto_28068 ) ( POINTING ?auto_28067 ?auto_28061 ) ( HAVE_IMAGE ?auto_28064 ?auto_28063 ) ( HAVE_IMAGE ?auto_28066 ?auto_28065 ) ( not ( = ?auto_28061 ?auto_28064 ) ) ( not ( = ?auto_28061 ?auto_28066 ) ) ( not ( = ?auto_28062 ?auto_28063 ) ) ( not ( = ?auto_28062 ?auto_28065 ) ) ( not ( = ?auto_28064 ?auto_28066 ) ) ( not ( = ?auto_28063 ?auto_28065 ) ) )
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
    ( and ( CALIBRATED ?auto_28084 ) ( ON_BOARD ?auto_28084 ?auto_28083 ) ( SUPPORTS ?auto_28084 ?auto_28078 ) ( POWER_ON ?auto_28084 ) ( POINTING ?auto_28083 ?auto_28077 ) ( HAVE_IMAGE ?auto_28080 ?auto_28079 ) ( HAVE_IMAGE ?auto_28082 ?auto_28081 ) ( not ( = ?auto_28077 ?auto_28080 ) ) ( not ( = ?auto_28077 ?auto_28082 ) ) ( not ( = ?auto_28078 ?auto_28079 ) ) ( not ( = ?auto_28078 ?auto_28081 ) ) ( not ( = ?auto_28080 ?auto_28082 ) ) ( not ( = ?auto_28079 ?auto_28081 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28077 ?auto_28078 )
      ( GET-3IMAGE-VERIFY ?auto_28077 ?auto_28078 ?auto_28080 ?auto_28079 ?auto_28082 ?auto_28081 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28085 - DIRECTION
      ?auto_28086 - MODE
      ?auto_28088 - DIRECTION
      ?auto_28087 - MODE
      ?auto_28090 - DIRECTION
      ?auto_28089 - MODE
    )
    :vars
    (
      ?auto_28092 - INSTRUMENT
      ?auto_28091 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_28092 ) ( ON_BOARD ?auto_28092 ?auto_28091 ) ( SUPPORTS ?auto_28092 ?auto_28086 ) ( POWER_ON ?auto_28092 ) ( POINTING ?auto_28091 ?auto_28085 ) ( HAVE_IMAGE ?auto_28088 ?auto_28087 ) ( HAVE_IMAGE ?auto_28090 ?auto_28089 ) ( not ( = ?auto_28085 ?auto_28088 ) ) ( not ( = ?auto_28085 ?auto_28090 ) ) ( not ( = ?auto_28086 ?auto_28087 ) ) ( not ( = ?auto_28086 ?auto_28089 ) ) ( not ( = ?auto_28088 ?auto_28090 ) ) ( not ( = ?auto_28087 ?auto_28089 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_28085 ?auto_28086 )
      ( GET-3IMAGE-VERIFY ?auto_28085 ?auto_28086 ?auto_28088 ?auto_28087 ?auto_28090 ?auto_28089 ) )
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
      ?auto_28134 - INSTRUMENT
      ?auto_28135 - SATELLITE
      ?auto_28136 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_28134 ) ( ON_BOARD ?auto_28134 ?auto_28135 ) ( SUPPORTS ?auto_28134 ?auto_28132 ) ( POWER_ON ?auto_28134 ) ( POINTING ?auto_28135 ?auto_28136 ) ( not ( = ?auto_28133 ?auto_28136 ) ) ( HAVE_IMAGE ?auto_28130 ?auto_28131 ) ( not ( = ?auto_28130 ?auto_28133 ) ) ( not ( = ?auto_28130 ?auto_28136 ) ) ( not ( = ?auto_28131 ?auto_28132 ) ) )
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
      ?auto_28143 - INSTRUMENT
      ?auto_28141 - SATELLITE
      ?auto_28142 - DIRECTION
      ?auto_28145 - DIRECTION
      ?auto_28144 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_28143 ) ( ON_BOARD ?auto_28143 ?auto_28141 ) ( SUPPORTS ?auto_28143 ?auto_28139 ) ( POWER_ON ?auto_28143 ) ( POINTING ?auto_28141 ?auto_28142 ) ( not ( = ?auto_28140 ?auto_28142 ) ) ( HAVE_IMAGE ?auto_28145 ?auto_28144 ) ( not ( = ?auto_28145 ?auto_28140 ) ) ( not ( = ?auto_28145 ?auto_28142 ) ) ( not ( = ?auto_28144 ?auto_28139 ) ) ( HAVE_IMAGE ?auto_28137 ?auto_28138 ) ( not ( = ?auto_28137 ?auto_28140 ) ) ( not ( = ?auto_28137 ?auto_28142 ) ) ( not ( = ?auto_28137 ?auto_28145 ) ) ( not ( = ?auto_28138 ?auto_28139 ) ) ( not ( = ?auto_28138 ?auto_28144 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28145 ?auto_28144 ?auto_28140 ?auto_28139 )
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
      ?auto_28152 - INSTRUMENT
      ?auto_28150 - SATELLITE
      ?auto_28151 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_28152 ) ( ON_BOARD ?auto_28152 ?auto_28150 ) ( SUPPORTS ?auto_28152 ?auto_28147 ) ( POWER_ON ?auto_28152 ) ( POINTING ?auto_28150 ?auto_28151 ) ( not ( = ?auto_28146 ?auto_28151 ) ) ( HAVE_IMAGE ?auto_28149 ?auto_28148 ) ( not ( = ?auto_28149 ?auto_28146 ) ) ( not ( = ?auto_28149 ?auto_28151 ) ) ( not ( = ?auto_28148 ?auto_28147 ) ) )
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
      ?auto_28159 - INSTRUMENT
      ?auto_28157 - SATELLITE
      ?auto_28158 - DIRECTION
      ?auto_28161 - DIRECTION
      ?auto_28160 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_28159 ) ( ON_BOARD ?auto_28159 ?auto_28157 ) ( SUPPORTS ?auto_28159 ?auto_28154 ) ( POWER_ON ?auto_28159 ) ( POINTING ?auto_28157 ?auto_28158 ) ( not ( = ?auto_28153 ?auto_28158 ) ) ( HAVE_IMAGE ?auto_28161 ?auto_28160 ) ( not ( = ?auto_28161 ?auto_28153 ) ) ( not ( = ?auto_28161 ?auto_28158 ) ) ( not ( = ?auto_28160 ?auto_28154 ) ) ( HAVE_IMAGE ?auto_28156 ?auto_28155 ) ( not ( = ?auto_28153 ?auto_28156 ) ) ( not ( = ?auto_28154 ?auto_28155 ) ) ( not ( = ?auto_28156 ?auto_28158 ) ) ( not ( = ?auto_28156 ?auto_28161 ) ) ( not ( = ?auto_28155 ?auto_28160 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28161 ?auto_28160 ?auto_28153 ?auto_28154 )
      ( GET-2IMAGE-VERIFY ?auto_28153 ?auto_28154 ?auto_28156 ?auto_28155 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28171 - DIRECTION
      ?auto_28172 - MODE
      ?auto_28174 - DIRECTION
      ?auto_28173 - MODE
      ?auto_28176 - DIRECTION
      ?auto_28175 - MODE
    )
    :vars
    (
      ?auto_28179 - INSTRUMENT
      ?auto_28177 - SATELLITE
      ?auto_28178 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_28179 ) ( ON_BOARD ?auto_28179 ?auto_28177 ) ( SUPPORTS ?auto_28179 ?auto_28175 ) ( POWER_ON ?auto_28179 ) ( POINTING ?auto_28177 ?auto_28178 ) ( not ( = ?auto_28176 ?auto_28178 ) ) ( HAVE_IMAGE ?auto_28174 ?auto_28172 ) ( not ( = ?auto_28174 ?auto_28176 ) ) ( not ( = ?auto_28174 ?auto_28178 ) ) ( not ( = ?auto_28172 ?auto_28175 ) ) ( HAVE_IMAGE ?auto_28171 ?auto_28172 ) ( HAVE_IMAGE ?auto_28174 ?auto_28173 ) ( not ( = ?auto_28171 ?auto_28174 ) ) ( not ( = ?auto_28171 ?auto_28176 ) ) ( not ( = ?auto_28171 ?auto_28178 ) ) ( not ( = ?auto_28172 ?auto_28173 ) ) ( not ( = ?auto_28173 ?auto_28175 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28174 ?auto_28172 ?auto_28176 ?auto_28175 )
      ( GET-3IMAGE-VERIFY ?auto_28171 ?auto_28172 ?auto_28174 ?auto_28173 ?auto_28176 ?auto_28175 ) )
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
      ?auto_28188 - INSTRUMENT
      ?auto_28186 - SATELLITE
      ?auto_28187 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_28188 ) ( ON_BOARD ?auto_28188 ?auto_28186 ) ( SUPPORTS ?auto_28188 ?auto_28184 ) ( POWER_ON ?auto_28188 ) ( POINTING ?auto_28186 ?auto_28187 ) ( not ( = ?auto_28185 ?auto_28187 ) ) ( HAVE_IMAGE ?auto_28180 ?auto_28181 ) ( not ( = ?auto_28180 ?auto_28185 ) ) ( not ( = ?auto_28180 ?auto_28187 ) ) ( not ( = ?auto_28181 ?auto_28184 ) ) ( HAVE_IMAGE ?auto_28183 ?auto_28182 ) ( not ( = ?auto_28180 ?auto_28183 ) ) ( not ( = ?auto_28181 ?auto_28182 ) ) ( not ( = ?auto_28183 ?auto_28185 ) ) ( not ( = ?auto_28183 ?auto_28187 ) ) ( not ( = ?auto_28182 ?auto_28184 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28180 ?auto_28181 ?auto_28185 ?auto_28184 )
      ( GET-3IMAGE-VERIFY ?auto_28180 ?auto_28181 ?auto_28183 ?auto_28182 ?auto_28185 ?auto_28184 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28189 - DIRECTION
      ?auto_28190 - MODE
      ?auto_28192 - DIRECTION
      ?auto_28191 - MODE
      ?auto_28194 - DIRECTION
      ?auto_28193 - MODE
    )
    :vars
    (
      ?auto_28197 - INSTRUMENT
      ?auto_28195 - SATELLITE
      ?auto_28196 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_28197 ) ( ON_BOARD ?auto_28197 ?auto_28195 ) ( SUPPORTS ?auto_28197 ?auto_28191 ) ( POWER_ON ?auto_28197 ) ( POINTING ?auto_28195 ?auto_28196 ) ( not ( = ?auto_28192 ?auto_28196 ) ) ( HAVE_IMAGE ?auto_28189 ?auto_28193 ) ( not ( = ?auto_28189 ?auto_28192 ) ) ( not ( = ?auto_28189 ?auto_28196 ) ) ( not ( = ?auto_28193 ?auto_28191 ) ) ( HAVE_IMAGE ?auto_28189 ?auto_28190 ) ( HAVE_IMAGE ?auto_28194 ?auto_28193 ) ( not ( = ?auto_28189 ?auto_28194 ) ) ( not ( = ?auto_28190 ?auto_28191 ) ) ( not ( = ?auto_28190 ?auto_28193 ) ) ( not ( = ?auto_28192 ?auto_28194 ) ) ( not ( = ?auto_28194 ?auto_28196 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28189 ?auto_28193 ?auto_28192 ?auto_28191 )
      ( GET-3IMAGE-VERIFY ?auto_28189 ?auto_28190 ?auto_28192 ?auto_28191 ?auto_28194 ?auto_28193 ) )
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
      ?auto_28206 - INSTRUMENT
      ?auto_28204 - SATELLITE
      ?auto_28205 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_28206 ) ( ON_BOARD ?auto_28206 ?auto_28204 ) ( SUPPORTS ?auto_28206 ?auto_28200 ) ( POWER_ON ?auto_28206 ) ( POINTING ?auto_28204 ?auto_28205 ) ( not ( = ?auto_28201 ?auto_28205 ) ) ( HAVE_IMAGE ?auto_28198 ?auto_28199 ) ( not ( = ?auto_28198 ?auto_28201 ) ) ( not ( = ?auto_28198 ?auto_28205 ) ) ( not ( = ?auto_28199 ?auto_28200 ) ) ( HAVE_IMAGE ?auto_28203 ?auto_28202 ) ( not ( = ?auto_28198 ?auto_28203 ) ) ( not ( = ?auto_28199 ?auto_28202 ) ) ( not ( = ?auto_28201 ?auto_28203 ) ) ( not ( = ?auto_28200 ?auto_28202 ) ) ( not ( = ?auto_28203 ?auto_28205 ) ) )
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
      ?auto_28224 - INSTRUMENT
      ?auto_28222 - SATELLITE
      ?auto_28223 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_28224 ) ( ON_BOARD ?auto_28224 ?auto_28222 ) ( SUPPORTS ?auto_28224 ?auto_28220 ) ( POWER_ON ?auto_28224 ) ( POINTING ?auto_28222 ?auto_28223 ) ( not ( = ?auto_28221 ?auto_28223 ) ) ( HAVE_IMAGE ?auto_28219 ?auto_28218 ) ( not ( = ?auto_28219 ?auto_28221 ) ) ( not ( = ?auto_28219 ?auto_28223 ) ) ( not ( = ?auto_28218 ?auto_28220 ) ) ( HAVE_IMAGE ?auto_28216 ?auto_28217 ) ( not ( = ?auto_28216 ?auto_28219 ) ) ( not ( = ?auto_28216 ?auto_28221 ) ) ( not ( = ?auto_28216 ?auto_28223 ) ) ( not ( = ?auto_28217 ?auto_28218 ) ) ( not ( = ?auto_28217 ?auto_28220 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28219 ?auto_28218 ?auto_28221 ?auto_28220 )
      ( GET-3IMAGE-VERIFY ?auto_28216 ?auto_28217 ?auto_28219 ?auto_28218 ?auto_28221 ?auto_28220 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28225 - DIRECTION
      ?auto_28226 - MODE
      ?auto_28228 - DIRECTION
      ?auto_28227 - MODE
      ?auto_28230 - DIRECTION
      ?auto_28229 - MODE
    )
    :vars
    (
      ?auto_28233 - INSTRUMENT
      ?auto_28231 - SATELLITE
      ?auto_28232 - DIRECTION
      ?auto_28235 - DIRECTION
      ?auto_28234 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_28233 ) ( ON_BOARD ?auto_28233 ?auto_28231 ) ( SUPPORTS ?auto_28233 ?auto_28229 ) ( POWER_ON ?auto_28233 ) ( POINTING ?auto_28231 ?auto_28232 ) ( not ( = ?auto_28230 ?auto_28232 ) ) ( HAVE_IMAGE ?auto_28235 ?auto_28234 ) ( not ( = ?auto_28235 ?auto_28230 ) ) ( not ( = ?auto_28235 ?auto_28232 ) ) ( not ( = ?auto_28234 ?auto_28229 ) ) ( HAVE_IMAGE ?auto_28225 ?auto_28226 ) ( HAVE_IMAGE ?auto_28228 ?auto_28227 ) ( not ( = ?auto_28225 ?auto_28228 ) ) ( not ( = ?auto_28225 ?auto_28230 ) ) ( not ( = ?auto_28225 ?auto_28232 ) ) ( not ( = ?auto_28225 ?auto_28235 ) ) ( not ( = ?auto_28226 ?auto_28227 ) ) ( not ( = ?auto_28226 ?auto_28229 ) ) ( not ( = ?auto_28226 ?auto_28234 ) ) ( not ( = ?auto_28228 ?auto_28230 ) ) ( not ( = ?auto_28228 ?auto_28232 ) ) ( not ( = ?auto_28228 ?auto_28235 ) ) ( not ( = ?auto_28227 ?auto_28229 ) ) ( not ( = ?auto_28227 ?auto_28234 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28235 ?auto_28234 ?auto_28230 ?auto_28229 )
      ( GET-3IMAGE-VERIFY ?auto_28225 ?auto_28226 ?auto_28228 ?auto_28227 ?auto_28230 ?auto_28229 ) )
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
      ?auto_28244 - INSTRUMENT
      ?auto_28242 - SATELLITE
      ?auto_28243 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_28244 ) ( ON_BOARD ?auto_28244 ?auto_28242 ) ( SUPPORTS ?auto_28244 ?auto_28238 ) ( POWER_ON ?auto_28244 ) ( POINTING ?auto_28242 ?auto_28243 ) ( not ( = ?auto_28239 ?auto_28243 ) ) ( HAVE_IMAGE ?auto_28241 ?auto_28240 ) ( not ( = ?auto_28241 ?auto_28239 ) ) ( not ( = ?auto_28241 ?auto_28243 ) ) ( not ( = ?auto_28240 ?auto_28238 ) ) ( HAVE_IMAGE ?auto_28236 ?auto_28237 ) ( not ( = ?auto_28236 ?auto_28239 ) ) ( not ( = ?auto_28236 ?auto_28241 ) ) ( not ( = ?auto_28236 ?auto_28243 ) ) ( not ( = ?auto_28237 ?auto_28238 ) ) ( not ( = ?auto_28237 ?auto_28240 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28241 ?auto_28240 ?auto_28239 ?auto_28238 )
      ( GET-3IMAGE-VERIFY ?auto_28236 ?auto_28237 ?auto_28239 ?auto_28238 ?auto_28241 ?auto_28240 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28245 - DIRECTION
      ?auto_28246 - MODE
      ?auto_28248 - DIRECTION
      ?auto_28247 - MODE
      ?auto_28250 - DIRECTION
      ?auto_28249 - MODE
    )
    :vars
    (
      ?auto_28253 - INSTRUMENT
      ?auto_28251 - SATELLITE
      ?auto_28252 - DIRECTION
      ?auto_28255 - DIRECTION
      ?auto_28254 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_28253 ) ( ON_BOARD ?auto_28253 ?auto_28251 ) ( SUPPORTS ?auto_28253 ?auto_28247 ) ( POWER_ON ?auto_28253 ) ( POINTING ?auto_28251 ?auto_28252 ) ( not ( = ?auto_28248 ?auto_28252 ) ) ( HAVE_IMAGE ?auto_28255 ?auto_28254 ) ( not ( = ?auto_28255 ?auto_28248 ) ) ( not ( = ?auto_28255 ?auto_28252 ) ) ( not ( = ?auto_28254 ?auto_28247 ) ) ( HAVE_IMAGE ?auto_28245 ?auto_28246 ) ( HAVE_IMAGE ?auto_28250 ?auto_28249 ) ( not ( = ?auto_28245 ?auto_28248 ) ) ( not ( = ?auto_28245 ?auto_28250 ) ) ( not ( = ?auto_28245 ?auto_28252 ) ) ( not ( = ?auto_28245 ?auto_28255 ) ) ( not ( = ?auto_28246 ?auto_28247 ) ) ( not ( = ?auto_28246 ?auto_28249 ) ) ( not ( = ?auto_28246 ?auto_28254 ) ) ( not ( = ?auto_28248 ?auto_28250 ) ) ( not ( = ?auto_28247 ?auto_28249 ) ) ( not ( = ?auto_28250 ?auto_28252 ) ) ( not ( = ?auto_28250 ?auto_28255 ) ) ( not ( = ?auto_28249 ?auto_28254 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28255 ?auto_28254 ?auto_28248 ?auto_28247 )
      ( GET-3IMAGE-VERIFY ?auto_28245 ?auto_28246 ?auto_28248 ?auto_28247 ?auto_28250 ?auto_28249 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28267 - DIRECTION
      ?auto_28268 - MODE
      ?auto_28270 - DIRECTION
      ?auto_28269 - MODE
      ?auto_28272 - DIRECTION
      ?auto_28271 - MODE
    )
    :vars
    (
      ?auto_28275 - INSTRUMENT
      ?auto_28273 - SATELLITE
      ?auto_28274 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_28275 ) ( ON_BOARD ?auto_28275 ?auto_28273 ) ( SUPPORTS ?auto_28275 ?auto_28268 ) ( POWER_ON ?auto_28275 ) ( POINTING ?auto_28273 ?auto_28274 ) ( not ( = ?auto_28267 ?auto_28274 ) ) ( HAVE_IMAGE ?auto_28270 ?auto_28271 ) ( not ( = ?auto_28270 ?auto_28267 ) ) ( not ( = ?auto_28270 ?auto_28274 ) ) ( not ( = ?auto_28271 ?auto_28268 ) ) ( HAVE_IMAGE ?auto_28270 ?auto_28269 ) ( HAVE_IMAGE ?auto_28272 ?auto_28271 ) ( not ( = ?auto_28267 ?auto_28272 ) ) ( not ( = ?auto_28268 ?auto_28269 ) ) ( not ( = ?auto_28270 ?auto_28272 ) ) ( not ( = ?auto_28269 ?auto_28271 ) ) ( not ( = ?auto_28272 ?auto_28274 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28270 ?auto_28271 ?auto_28267 ?auto_28268 )
      ( GET-3IMAGE-VERIFY ?auto_28267 ?auto_28268 ?auto_28270 ?auto_28269 ?auto_28272 ?auto_28271 ) )
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
      ?auto_28284 - INSTRUMENT
      ?auto_28282 - SATELLITE
      ?auto_28283 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_28284 ) ( ON_BOARD ?auto_28284 ?auto_28282 ) ( SUPPORTS ?auto_28284 ?auto_28277 ) ( POWER_ON ?auto_28284 ) ( POINTING ?auto_28282 ?auto_28283 ) ( not ( = ?auto_28276 ?auto_28283 ) ) ( HAVE_IMAGE ?auto_28279 ?auto_28278 ) ( not ( = ?auto_28279 ?auto_28276 ) ) ( not ( = ?auto_28279 ?auto_28283 ) ) ( not ( = ?auto_28278 ?auto_28277 ) ) ( HAVE_IMAGE ?auto_28281 ?auto_28280 ) ( not ( = ?auto_28276 ?auto_28281 ) ) ( not ( = ?auto_28277 ?auto_28280 ) ) ( not ( = ?auto_28279 ?auto_28281 ) ) ( not ( = ?auto_28278 ?auto_28280 ) ) ( not ( = ?auto_28281 ?auto_28283 ) ) )
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
      ?auto_28302 - INSTRUMENT
      ?auto_28300 - SATELLITE
      ?auto_28301 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_28302 ) ( ON_BOARD ?auto_28302 ?auto_28300 ) ( SUPPORTS ?auto_28302 ?auto_28295 ) ( POWER_ON ?auto_28302 ) ( POINTING ?auto_28300 ?auto_28301 ) ( not ( = ?auto_28294 ?auto_28301 ) ) ( HAVE_IMAGE ?auto_28299 ?auto_28298 ) ( not ( = ?auto_28299 ?auto_28294 ) ) ( not ( = ?auto_28299 ?auto_28301 ) ) ( not ( = ?auto_28298 ?auto_28295 ) ) ( HAVE_IMAGE ?auto_28297 ?auto_28296 ) ( not ( = ?auto_28294 ?auto_28297 ) ) ( not ( = ?auto_28295 ?auto_28296 ) ) ( not ( = ?auto_28297 ?auto_28299 ) ) ( not ( = ?auto_28297 ?auto_28301 ) ) ( not ( = ?auto_28296 ?auto_28298 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28299 ?auto_28298 ?auto_28294 ?auto_28295 )
      ( GET-3IMAGE-VERIFY ?auto_28294 ?auto_28295 ?auto_28297 ?auto_28296 ?auto_28299 ?auto_28298 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28303 - DIRECTION
      ?auto_28304 - MODE
      ?auto_28306 - DIRECTION
      ?auto_28305 - MODE
      ?auto_28308 - DIRECTION
      ?auto_28307 - MODE
    )
    :vars
    (
      ?auto_28311 - INSTRUMENT
      ?auto_28309 - SATELLITE
      ?auto_28310 - DIRECTION
      ?auto_28313 - DIRECTION
      ?auto_28312 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_28311 ) ( ON_BOARD ?auto_28311 ?auto_28309 ) ( SUPPORTS ?auto_28311 ?auto_28304 ) ( POWER_ON ?auto_28311 ) ( POINTING ?auto_28309 ?auto_28310 ) ( not ( = ?auto_28303 ?auto_28310 ) ) ( HAVE_IMAGE ?auto_28313 ?auto_28312 ) ( not ( = ?auto_28313 ?auto_28303 ) ) ( not ( = ?auto_28313 ?auto_28310 ) ) ( not ( = ?auto_28312 ?auto_28304 ) ) ( HAVE_IMAGE ?auto_28306 ?auto_28305 ) ( HAVE_IMAGE ?auto_28308 ?auto_28307 ) ( not ( = ?auto_28303 ?auto_28306 ) ) ( not ( = ?auto_28303 ?auto_28308 ) ) ( not ( = ?auto_28304 ?auto_28305 ) ) ( not ( = ?auto_28304 ?auto_28307 ) ) ( not ( = ?auto_28306 ?auto_28308 ) ) ( not ( = ?auto_28306 ?auto_28310 ) ) ( not ( = ?auto_28306 ?auto_28313 ) ) ( not ( = ?auto_28305 ?auto_28307 ) ) ( not ( = ?auto_28305 ?auto_28312 ) ) ( not ( = ?auto_28308 ?auto_28310 ) ) ( not ( = ?auto_28308 ?auto_28313 ) ) ( not ( = ?auto_28307 ?auto_28312 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28313 ?auto_28312 ?auto_28303 ?auto_28304 )
      ( GET-3IMAGE-VERIFY ?auto_28303 ?auto_28304 ?auto_28306 ?auto_28305 ?auto_28308 ?auto_28307 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_28356 - DIRECTION
      ?auto_28357 - MODE
    )
    :vars
    (
      ?auto_28360 - INSTRUMENT
      ?auto_28358 - SATELLITE
      ?auto_28359 - DIRECTION
      ?auto_28362 - DIRECTION
      ?auto_28361 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28360 ?auto_28358 ) ( SUPPORTS ?auto_28360 ?auto_28357 ) ( POWER_ON ?auto_28360 ) ( POINTING ?auto_28358 ?auto_28359 ) ( not ( = ?auto_28356 ?auto_28359 ) ) ( HAVE_IMAGE ?auto_28362 ?auto_28361 ) ( not ( = ?auto_28362 ?auto_28356 ) ) ( not ( = ?auto_28362 ?auto_28359 ) ) ( not ( = ?auto_28361 ?auto_28357 ) ) ( CALIBRATION_TARGET ?auto_28360 ?auto_28359 ) ( NOT_CALIBRATED ?auto_28360 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_28358 ?auto_28360 ?auto_28359 )
      ( GET-2IMAGE ?auto_28362 ?auto_28361 ?auto_28356 ?auto_28357 )
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
      ?auto_28368 - INSTRUMENT
      ?auto_28369 - SATELLITE
      ?auto_28367 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28368 ?auto_28369 ) ( SUPPORTS ?auto_28368 ?auto_28365 ) ( POWER_ON ?auto_28368 ) ( POINTING ?auto_28369 ?auto_28367 ) ( not ( = ?auto_28366 ?auto_28367 ) ) ( HAVE_IMAGE ?auto_28363 ?auto_28364 ) ( not ( = ?auto_28363 ?auto_28366 ) ) ( not ( = ?auto_28363 ?auto_28367 ) ) ( not ( = ?auto_28364 ?auto_28365 ) ) ( CALIBRATION_TARGET ?auto_28368 ?auto_28367 ) ( NOT_CALIBRATED ?auto_28368 ) )
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
      ?auto_28376 - INSTRUMENT
      ?auto_28374 - SATELLITE
      ?auto_28377 - DIRECTION
      ?auto_28378 - DIRECTION
      ?auto_28375 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28376 ?auto_28374 ) ( SUPPORTS ?auto_28376 ?auto_28372 ) ( POWER_ON ?auto_28376 ) ( POINTING ?auto_28374 ?auto_28377 ) ( not ( = ?auto_28373 ?auto_28377 ) ) ( HAVE_IMAGE ?auto_28378 ?auto_28375 ) ( not ( = ?auto_28378 ?auto_28373 ) ) ( not ( = ?auto_28378 ?auto_28377 ) ) ( not ( = ?auto_28375 ?auto_28372 ) ) ( CALIBRATION_TARGET ?auto_28376 ?auto_28377 ) ( NOT_CALIBRATED ?auto_28376 ) ( HAVE_IMAGE ?auto_28370 ?auto_28371 ) ( not ( = ?auto_28370 ?auto_28373 ) ) ( not ( = ?auto_28370 ?auto_28377 ) ) ( not ( = ?auto_28370 ?auto_28378 ) ) ( not ( = ?auto_28371 ?auto_28372 ) ) ( not ( = ?auto_28371 ?auto_28375 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28378 ?auto_28375 ?auto_28373 ?auto_28372 )
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
      ?auto_28384 - INSTRUMENT
      ?auto_28383 - SATELLITE
      ?auto_28385 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28384 ?auto_28383 ) ( SUPPORTS ?auto_28384 ?auto_28380 ) ( POWER_ON ?auto_28384 ) ( POINTING ?auto_28383 ?auto_28385 ) ( not ( = ?auto_28379 ?auto_28385 ) ) ( HAVE_IMAGE ?auto_28382 ?auto_28381 ) ( not ( = ?auto_28382 ?auto_28379 ) ) ( not ( = ?auto_28382 ?auto_28385 ) ) ( not ( = ?auto_28381 ?auto_28380 ) ) ( CALIBRATION_TARGET ?auto_28384 ?auto_28385 ) ( NOT_CALIBRATED ?auto_28384 ) )
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
      ?auto_28392 - INSTRUMENT
      ?auto_28390 - SATELLITE
      ?auto_28393 - DIRECTION
      ?auto_28394 - DIRECTION
      ?auto_28391 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28392 ?auto_28390 ) ( SUPPORTS ?auto_28392 ?auto_28387 ) ( POWER_ON ?auto_28392 ) ( POINTING ?auto_28390 ?auto_28393 ) ( not ( = ?auto_28386 ?auto_28393 ) ) ( HAVE_IMAGE ?auto_28394 ?auto_28391 ) ( not ( = ?auto_28394 ?auto_28386 ) ) ( not ( = ?auto_28394 ?auto_28393 ) ) ( not ( = ?auto_28391 ?auto_28387 ) ) ( CALIBRATION_TARGET ?auto_28392 ?auto_28393 ) ( NOT_CALIBRATED ?auto_28392 ) ( HAVE_IMAGE ?auto_28389 ?auto_28388 ) ( not ( = ?auto_28386 ?auto_28389 ) ) ( not ( = ?auto_28387 ?auto_28388 ) ) ( not ( = ?auto_28389 ?auto_28393 ) ) ( not ( = ?auto_28389 ?auto_28394 ) ) ( not ( = ?auto_28388 ?auto_28391 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28394 ?auto_28391 ?auto_28386 ?auto_28387 )
      ( GET-2IMAGE-VERIFY ?auto_28386 ?auto_28387 ?auto_28389 ?auto_28388 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28404 - DIRECTION
      ?auto_28405 - MODE
      ?auto_28407 - DIRECTION
      ?auto_28406 - MODE
      ?auto_28409 - DIRECTION
      ?auto_28408 - MODE
    )
    :vars
    (
      ?auto_28411 - INSTRUMENT
      ?auto_28410 - SATELLITE
      ?auto_28412 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28411 ?auto_28410 ) ( SUPPORTS ?auto_28411 ?auto_28408 ) ( POWER_ON ?auto_28411 ) ( POINTING ?auto_28410 ?auto_28412 ) ( not ( = ?auto_28409 ?auto_28412 ) ) ( HAVE_IMAGE ?auto_28404 ?auto_28406 ) ( not ( = ?auto_28404 ?auto_28409 ) ) ( not ( = ?auto_28404 ?auto_28412 ) ) ( not ( = ?auto_28406 ?auto_28408 ) ) ( CALIBRATION_TARGET ?auto_28411 ?auto_28412 ) ( NOT_CALIBRATED ?auto_28411 ) ( HAVE_IMAGE ?auto_28404 ?auto_28405 ) ( HAVE_IMAGE ?auto_28407 ?auto_28406 ) ( not ( = ?auto_28404 ?auto_28407 ) ) ( not ( = ?auto_28405 ?auto_28406 ) ) ( not ( = ?auto_28405 ?auto_28408 ) ) ( not ( = ?auto_28407 ?auto_28409 ) ) ( not ( = ?auto_28407 ?auto_28412 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28404 ?auto_28406 ?auto_28409 ?auto_28408 )
      ( GET-3IMAGE-VERIFY ?auto_28404 ?auto_28405 ?auto_28407 ?auto_28406 ?auto_28409 ?auto_28408 ) )
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
      ?auto_28420 - INSTRUMENT
      ?auto_28419 - SATELLITE
      ?auto_28421 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28420 ?auto_28419 ) ( SUPPORTS ?auto_28420 ?auto_28417 ) ( POWER_ON ?auto_28420 ) ( POINTING ?auto_28419 ?auto_28421 ) ( not ( = ?auto_28418 ?auto_28421 ) ) ( HAVE_IMAGE ?auto_28413 ?auto_28414 ) ( not ( = ?auto_28413 ?auto_28418 ) ) ( not ( = ?auto_28413 ?auto_28421 ) ) ( not ( = ?auto_28414 ?auto_28417 ) ) ( CALIBRATION_TARGET ?auto_28420 ?auto_28421 ) ( NOT_CALIBRATED ?auto_28420 ) ( HAVE_IMAGE ?auto_28416 ?auto_28415 ) ( not ( = ?auto_28413 ?auto_28416 ) ) ( not ( = ?auto_28414 ?auto_28415 ) ) ( not ( = ?auto_28416 ?auto_28418 ) ) ( not ( = ?auto_28416 ?auto_28421 ) ) ( not ( = ?auto_28415 ?auto_28417 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28413 ?auto_28414 ?auto_28418 ?auto_28417 )
      ( GET-3IMAGE-VERIFY ?auto_28413 ?auto_28414 ?auto_28416 ?auto_28415 ?auto_28418 ?auto_28417 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28422 - DIRECTION
      ?auto_28423 - MODE
      ?auto_28425 - DIRECTION
      ?auto_28424 - MODE
      ?auto_28427 - DIRECTION
      ?auto_28426 - MODE
    )
    :vars
    (
      ?auto_28429 - INSTRUMENT
      ?auto_28428 - SATELLITE
      ?auto_28430 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28429 ?auto_28428 ) ( SUPPORTS ?auto_28429 ?auto_28424 ) ( POWER_ON ?auto_28429 ) ( POINTING ?auto_28428 ?auto_28430 ) ( not ( = ?auto_28425 ?auto_28430 ) ) ( HAVE_IMAGE ?auto_28427 ?auto_28426 ) ( not ( = ?auto_28427 ?auto_28425 ) ) ( not ( = ?auto_28427 ?auto_28430 ) ) ( not ( = ?auto_28426 ?auto_28424 ) ) ( CALIBRATION_TARGET ?auto_28429 ?auto_28430 ) ( NOT_CALIBRATED ?auto_28429 ) ( HAVE_IMAGE ?auto_28422 ?auto_28423 ) ( not ( = ?auto_28422 ?auto_28425 ) ) ( not ( = ?auto_28422 ?auto_28427 ) ) ( not ( = ?auto_28422 ?auto_28430 ) ) ( not ( = ?auto_28423 ?auto_28424 ) ) ( not ( = ?auto_28423 ?auto_28426 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28427 ?auto_28426 ?auto_28425 ?auto_28424 )
      ( GET-3IMAGE-VERIFY ?auto_28422 ?auto_28423 ?auto_28425 ?auto_28424 ?auto_28427 ?auto_28426 ) )
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
      ?auto_28438 - INSTRUMENT
      ?auto_28437 - SATELLITE
      ?auto_28439 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28438 ?auto_28437 ) ( SUPPORTS ?auto_28438 ?auto_28433 ) ( POWER_ON ?auto_28438 ) ( POINTING ?auto_28437 ?auto_28439 ) ( not ( = ?auto_28434 ?auto_28439 ) ) ( HAVE_IMAGE ?auto_28431 ?auto_28432 ) ( not ( = ?auto_28431 ?auto_28434 ) ) ( not ( = ?auto_28431 ?auto_28439 ) ) ( not ( = ?auto_28432 ?auto_28433 ) ) ( CALIBRATION_TARGET ?auto_28438 ?auto_28439 ) ( NOT_CALIBRATED ?auto_28438 ) ( HAVE_IMAGE ?auto_28436 ?auto_28435 ) ( not ( = ?auto_28431 ?auto_28436 ) ) ( not ( = ?auto_28432 ?auto_28435 ) ) ( not ( = ?auto_28434 ?auto_28436 ) ) ( not ( = ?auto_28433 ?auto_28435 ) ) ( not ( = ?auto_28436 ?auto_28439 ) ) )
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
      ?auto_28456 - INSTRUMENT
      ?auto_28455 - SATELLITE
      ?auto_28457 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28456 ?auto_28455 ) ( SUPPORTS ?auto_28456 ?auto_28453 ) ( POWER_ON ?auto_28456 ) ( POINTING ?auto_28455 ?auto_28457 ) ( not ( = ?auto_28454 ?auto_28457 ) ) ( HAVE_IMAGE ?auto_28452 ?auto_28451 ) ( not ( = ?auto_28452 ?auto_28454 ) ) ( not ( = ?auto_28452 ?auto_28457 ) ) ( not ( = ?auto_28451 ?auto_28453 ) ) ( CALIBRATION_TARGET ?auto_28456 ?auto_28457 ) ( NOT_CALIBRATED ?auto_28456 ) ( HAVE_IMAGE ?auto_28449 ?auto_28450 ) ( not ( = ?auto_28449 ?auto_28452 ) ) ( not ( = ?auto_28449 ?auto_28454 ) ) ( not ( = ?auto_28449 ?auto_28457 ) ) ( not ( = ?auto_28450 ?auto_28451 ) ) ( not ( = ?auto_28450 ?auto_28453 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28452 ?auto_28451 ?auto_28454 ?auto_28453 )
      ( GET-3IMAGE-VERIFY ?auto_28449 ?auto_28450 ?auto_28452 ?auto_28451 ?auto_28454 ?auto_28453 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28458 - DIRECTION
      ?auto_28459 - MODE
      ?auto_28461 - DIRECTION
      ?auto_28460 - MODE
      ?auto_28463 - DIRECTION
      ?auto_28462 - MODE
    )
    :vars
    (
      ?auto_28466 - INSTRUMENT
      ?auto_28464 - SATELLITE
      ?auto_28467 - DIRECTION
      ?auto_28468 - DIRECTION
      ?auto_28465 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28466 ?auto_28464 ) ( SUPPORTS ?auto_28466 ?auto_28462 ) ( POWER_ON ?auto_28466 ) ( POINTING ?auto_28464 ?auto_28467 ) ( not ( = ?auto_28463 ?auto_28467 ) ) ( HAVE_IMAGE ?auto_28468 ?auto_28465 ) ( not ( = ?auto_28468 ?auto_28463 ) ) ( not ( = ?auto_28468 ?auto_28467 ) ) ( not ( = ?auto_28465 ?auto_28462 ) ) ( CALIBRATION_TARGET ?auto_28466 ?auto_28467 ) ( NOT_CALIBRATED ?auto_28466 ) ( HAVE_IMAGE ?auto_28458 ?auto_28459 ) ( HAVE_IMAGE ?auto_28461 ?auto_28460 ) ( not ( = ?auto_28458 ?auto_28461 ) ) ( not ( = ?auto_28458 ?auto_28463 ) ) ( not ( = ?auto_28458 ?auto_28467 ) ) ( not ( = ?auto_28458 ?auto_28468 ) ) ( not ( = ?auto_28459 ?auto_28460 ) ) ( not ( = ?auto_28459 ?auto_28462 ) ) ( not ( = ?auto_28459 ?auto_28465 ) ) ( not ( = ?auto_28461 ?auto_28463 ) ) ( not ( = ?auto_28461 ?auto_28467 ) ) ( not ( = ?auto_28461 ?auto_28468 ) ) ( not ( = ?auto_28460 ?auto_28462 ) ) ( not ( = ?auto_28460 ?auto_28465 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28468 ?auto_28465 ?auto_28463 ?auto_28462 )
      ( GET-3IMAGE-VERIFY ?auto_28458 ?auto_28459 ?auto_28461 ?auto_28460 ?auto_28463 ?auto_28462 ) )
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
      ?auto_28476 - INSTRUMENT
      ?auto_28475 - SATELLITE
      ?auto_28477 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28476 ?auto_28475 ) ( SUPPORTS ?auto_28476 ?auto_28471 ) ( POWER_ON ?auto_28476 ) ( POINTING ?auto_28475 ?auto_28477 ) ( not ( = ?auto_28472 ?auto_28477 ) ) ( HAVE_IMAGE ?auto_28474 ?auto_28473 ) ( not ( = ?auto_28474 ?auto_28472 ) ) ( not ( = ?auto_28474 ?auto_28477 ) ) ( not ( = ?auto_28473 ?auto_28471 ) ) ( CALIBRATION_TARGET ?auto_28476 ?auto_28477 ) ( NOT_CALIBRATED ?auto_28476 ) ( HAVE_IMAGE ?auto_28469 ?auto_28470 ) ( not ( = ?auto_28469 ?auto_28472 ) ) ( not ( = ?auto_28469 ?auto_28474 ) ) ( not ( = ?auto_28469 ?auto_28477 ) ) ( not ( = ?auto_28470 ?auto_28471 ) ) ( not ( = ?auto_28470 ?auto_28473 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28474 ?auto_28473 ?auto_28472 ?auto_28471 )
      ( GET-3IMAGE-VERIFY ?auto_28469 ?auto_28470 ?auto_28472 ?auto_28471 ?auto_28474 ?auto_28473 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28478 - DIRECTION
      ?auto_28479 - MODE
      ?auto_28481 - DIRECTION
      ?auto_28480 - MODE
      ?auto_28483 - DIRECTION
      ?auto_28482 - MODE
    )
    :vars
    (
      ?auto_28486 - INSTRUMENT
      ?auto_28484 - SATELLITE
      ?auto_28487 - DIRECTION
      ?auto_28488 - DIRECTION
      ?auto_28485 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28486 ?auto_28484 ) ( SUPPORTS ?auto_28486 ?auto_28480 ) ( POWER_ON ?auto_28486 ) ( POINTING ?auto_28484 ?auto_28487 ) ( not ( = ?auto_28481 ?auto_28487 ) ) ( HAVE_IMAGE ?auto_28488 ?auto_28485 ) ( not ( = ?auto_28488 ?auto_28481 ) ) ( not ( = ?auto_28488 ?auto_28487 ) ) ( not ( = ?auto_28485 ?auto_28480 ) ) ( CALIBRATION_TARGET ?auto_28486 ?auto_28487 ) ( NOT_CALIBRATED ?auto_28486 ) ( HAVE_IMAGE ?auto_28478 ?auto_28479 ) ( HAVE_IMAGE ?auto_28483 ?auto_28482 ) ( not ( = ?auto_28478 ?auto_28481 ) ) ( not ( = ?auto_28478 ?auto_28483 ) ) ( not ( = ?auto_28478 ?auto_28487 ) ) ( not ( = ?auto_28478 ?auto_28488 ) ) ( not ( = ?auto_28479 ?auto_28480 ) ) ( not ( = ?auto_28479 ?auto_28482 ) ) ( not ( = ?auto_28479 ?auto_28485 ) ) ( not ( = ?auto_28481 ?auto_28483 ) ) ( not ( = ?auto_28480 ?auto_28482 ) ) ( not ( = ?auto_28483 ?auto_28487 ) ) ( not ( = ?auto_28483 ?auto_28488 ) ) ( not ( = ?auto_28482 ?auto_28485 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28488 ?auto_28485 ?auto_28481 ?auto_28480 )
      ( GET-3IMAGE-VERIFY ?auto_28478 ?auto_28479 ?auto_28481 ?auto_28480 ?auto_28483 ?auto_28482 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28500 - DIRECTION
      ?auto_28501 - MODE
      ?auto_28503 - DIRECTION
      ?auto_28502 - MODE
      ?auto_28505 - DIRECTION
      ?auto_28504 - MODE
    )
    :vars
    (
      ?auto_28507 - INSTRUMENT
      ?auto_28506 - SATELLITE
      ?auto_28508 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28507 ?auto_28506 ) ( SUPPORTS ?auto_28507 ?auto_28501 ) ( POWER_ON ?auto_28507 ) ( POINTING ?auto_28506 ?auto_28508 ) ( not ( = ?auto_28500 ?auto_28508 ) ) ( HAVE_IMAGE ?auto_28505 ?auto_28504 ) ( not ( = ?auto_28505 ?auto_28500 ) ) ( not ( = ?auto_28505 ?auto_28508 ) ) ( not ( = ?auto_28504 ?auto_28501 ) ) ( CALIBRATION_TARGET ?auto_28507 ?auto_28508 ) ( NOT_CALIBRATED ?auto_28507 ) ( HAVE_IMAGE ?auto_28503 ?auto_28502 ) ( not ( = ?auto_28500 ?auto_28503 ) ) ( not ( = ?auto_28501 ?auto_28502 ) ) ( not ( = ?auto_28503 ?auto_28505 ) ) ( not ( = ?auto_28503 ?auto_28508 ) ) ( not ( = ?auto_28502 ?auto_28504 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28505 ?auto_28504 ?auto_28500 ?auto_28501 )
      ( GET-3IMAGE-VERIFY ?auto_28500 ?auto_28501 ?auto_28503 ?auto_28502 ?auto_28505 ?auto_28504 ) )
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
      ?auto_28516 - INSTRUMENT
      ?auto_28515 - SATELLITE
      ?auto_28517 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28516 ?auto_28515 ) ( SUPPORTS ?auto_28516 ?auto_28510 ) ( POWER_ON ?auto_28516 ) ( POINTING ?auto_28515 ?auto_28517 ) ( not ( = ?auto_28509 ?auto_28517 ) ) ( HAVE_IMAGE ?auto_28512 ?auto_28511 ) ( not ( = ?auto_28512 ?auto_28509 ) ) ( not ( = ?auto_28512 ?auto_28517 ) ) ( not ( = ?auto_28511 ?auto_28510 ) ) ( CALIBRATION_TARGET ?auto_28516 ?auto_28517 ) ( NOT_CALIBRATED ?auto_28516 ) ( HAVE_IMAGE ?auto_28514 ?auto_28513 ) ( not ( = ?auto_28509 ?auto_28514 ) ) ( not ( = ?auto_28510 ?auto_28513 ) ) ( not ( = ?auto_28512 ?auto_28514 ) ) ( not ( = ?auto_28511 ?auto_28513 ) ) ( not ( = ?auto_28514 ?auto_28517 ) ) )
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
      ?auto_28534 - INSTRUMENT
      ?auto_28533 - SATELLITE
      ?auto_28535 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28534 ?auto_28533 ) ( SUPPORTS ?auto_28534 ?auto_28528 ) ( POWER_ON ?auto_28534 ) ( POINTING ?auto_28533 ?auto_28535 ) ( not ( = ?auto_28527 ?auto_28535 ) ) ( HAVE_IMAGE ?auto_28532 ?auto_28531 ) ( not ( = ?auto_28532 ?auto_28527 ) ) ( not ( = ?auto_28532 ?auto_28535 ) ) ( not ( = ?auto_28531 ?auto_28528 ) ) ( CALIBRATION_TARGET ?auto_28534 ?auto_28535 ) ( NOT_CALIBRATED ?auto_28534 ) ( HAVE_IMAGE ?auto_28530 ?auto_28529 ) ( not ( = ?auto_28527 ?auto_28530 ) ) ( not ( = ?auto_28528 ?auto_28529 ) ) ( not ( = ?auto_28530 ?auto_28532 ) ) ( not ( = ?auto_28530 ?auto_28535 ) ) ( not ( = ?auto_28529 ?auto_28531 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28532 ?auto_28531 ?auto_28527 ?auto_28528 )
      ( GET-3IMAGE-VERIFY ?auto_28527 ?auto_28528 ?auto_28530 ?auto_28529 ?auto_28532 ?auto_28531 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28536 - DIRECTION
      ?auto_28537 - MODE
      ?auto_28539 - DIRECTION
      ?auto_28538 - MODE
      ?auto_28541 - DIRECTION
      ?auto_28540 - MODE
    )
    :vars
    (
      ?auto_28544 - INSTRUMENT
      ?auto_28542 - SATELLITE
      ?auto_28545 - DIRECTION
      ?auto_28546 - DIRECTION
      ?auto_28543 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28544 ?auto_28542 ) ( SUPPORTS ?auto_28544 ?auto_28537 ) ( POWER_ON ?auto_28544 ) ( POINTING ?auto_28542 ?auto_28545 ) ( not ( = ?auto_28536 ?auto_28545 ) ) ( HAVE_IMAGE ?auto_28546 ?auto_28543 ) ( not ( = ?auto_28546 ?auto_28536 ) ) ( not ( = ?auto_28546 ?auto_28545 ) ) ( not ( = ?auto_28543 ?auto_28537 ) ) ( CALIBRATION_TARGET ?auto_28544 ?auto_28545 ) ( NOT_CALIBRATED ?auto_28544 ) ( HAVE_IMAGE ?auto_28539 ?auto_28538 ) ( HAVE_IMAGE ?auto_28541 ?auto_28540 ) ( not ( = ?auto_28536 ?auto_28539 ) ) ( not ( = ?auto_28536 ?auto_28541 ) ) ( not ( = ?auto_28537 ?auto_28538 ) ) ( not ( = ?auto_28537 ?auto_28540 ) ) ( not ( = ?auto_28539 ?auto_28541 ) ) ( not ( = ?auto_28539 ?auto_28545 ) ) ( not ( = ?auto_28539 ?auto_28546 ) ) ( not ( = ?auto_28538 ?auto_28540 ) ) ( not ( = ?auto_28538 ?auto_28543 ) ) ( not ( = ?auto_28541 ?auto_28545 ) ) ( not ( = ?auto_28541 ?auto_28546 ) ) ( not ( = ?auto_28540 ?auto_28543 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28546 ?auto_28543 ?auto_28536 ?auto_28537 )
      ( GET-3IMAGE-VERIFY ?auto_28536 ?auto_28537 ?auto_28539 ?auto_28538 ?auto_28541 ?auto_28540 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_28589 - DIRECTION
      ?auto_28590 - MODE
    )
    :vars
    (
      ?auto_28593 - INSTRUMENT
      ?auto_28591 - SATELLITE
      ?auto_28594 - DIRECTION
      ?auto_28595 - DIRECTION
      ?auto_28592 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28593 ?auto_28591 ) ( SUPPORTS ?auto_28593 ?auto_28590 ) ( POINTING ?auto_28591 ?auto_28594 ) ( not ( = ?auto_28589 ?auto_28594 ) ) ( HAVE_IMAGE ?auto_28595 ?auto_28592 ) ( not ( = ?auto_28595 ?auto_28589 ) ) ( not ( = ?auto_28595 ?auto_28594 ) ) ( not ( = ?auto_28592 ?auto_28590 ) ) ( CALIBRATION_TARGET ?auto_28593 ?auto_28594 ) ( POWER_AVAIL ?auto_28591 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_28593 ?auto_28591 )
      ( GET-2IMAGE ?auto_28595 ?auto_28592 ?auto_28589 ?auto_28590 )
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
      ?auto_28600 - INSTRUMENT
      ?auto_28602 - SATELLITE
      ?auto_28601 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28600 ?auto_28602 ) ( SUPPORTS ?auto_28600 ?auto_28598 ) ( POINTING ?auto_28602 ?auto_28601 ) ( not ( = ?auto_28599 ?auto_28601 ) ) ( HAVE_IMAGE ?auto_28596 ?auto_28597 ) ( not ( = ?auto_28596 ?auto_28599 ) ) ( not ( = ?auto_28596 ?auto_28601 ) ) ( not ( = ?auto_28597 ?auto_28598 ) ) ( CALIBRATION_TARGET ?auto_28600 ?auto_28601 ) ( POWER_AVAIL ?auto_28602 ) )
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
      ?auto_28607 - INSTRUMENT
      ?auto_28609 - SATELLITE
      ?auto_28608 - DIRECTION
      ?auto_28610 - DIRECTION
      ?auto_28611 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28607 ?auto_28609 ) ( SUPPORTS ?auto_28607 ?auto_28605 ) ( POINTING ?auto_28609 ?auto_28608 ) ( not ( = ?auto_28606 ?auto_28608 ) ) ( HAVE_IMAGE ?auto_28610 ?auto_28611 ) ( not ( = ?auto_28610 ?auto_28606 ) ) ( not ( = ?auto_28610 ?auto_28608 ) ) ( not ( = ?auto_28611 ?auto_28605 ) ) ( CALIBRATION_TARGET ?auto_28607 ?auto_28608 ) ( POWER_AVAIL ?auto_28609 ) ( HAVE_IMAGE ?auto_28603 ?auto_28604 ) ( not ( = ?auto_28603 ?auto_28606 ) ) ( not ( = ?auto_28603 ?auto_28608 ) ) ( not ( = ?auto_28603 ?auto_28610 ) ) ( not ( = ?auto_28604 ?auto_28605 ) ) ( not ( = ?auto_28604 ?auto_28611 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28610 ?auto_28611 ?auto_28606 ?auto_28605 )
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
      ?auto_28618 - SATELLITE
      ?auto_28617 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28616 ?auto_28618 ) ( SUPPORTS ?auto_28616 ?auto_28613 ) ( POINTING ?auto_28618 ?auto_28617 ) ( not ( = ?auto_28612 ?auto_28617 ) ) ( HAVE_IMAGE ?auto_28615 ?auto_28614 ) ( not ( = ?auto_28615 ?auto_28612 ) ) ( not ( = ?auto_28615 ?auto_28617 ) ) ( not ( = ?auto_28614 ?auto_28613 ) ) ( CALIBRATION_TARGET ?auto_28616 ?auto_28617 ) ( POWER_AVAIL ?auto_28618 ) )
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
      ?auto_28623 - INSTRUMENT
      ?auto_28625 - SATELLITE
      ?auto_28624 - DIRECTION
      ?auto_28626 - DIRECTION
      ?auto_28627 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28623 ?auto_28625 ) ( SUPPORTS ?auto_28623 ?auto_28620 ) ( POINTING ?auto_28625 ?auto_28624 ) ( not ( = ?auto_28619 ?auto_28624 ) ) ( HAVE_IMAGE ?auto_28626 ?auto_28627 ) ( not ( = ?auto_28626 ?auto_28619 ) ) ( not ( = ?auto_28626 ?auto_28624 ) ) ( not ( = ?auto_28627 ?auto_28620 ) ) ( CALIBRATION_TARGET ?auto_28623 ?auto_28624 ) ( POWER_AVAIL ?auto_28625 ) ( HAVE_IMAGE ?auto_28622 ?auto_28621 ) ( not ( = ?auto_28619 ?auto_28622 ) ) ( not ( = ?auto_28620 ?auto_28621 ) ) ( not ( = ?auto_28622 ?auto_28624 ) ) ( not ( = ?auto_28622 ?auto_28626 ) ) ( not ( = ?auto_28621 ?auto_28627 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28626 ?auto_28627 ?auto_28619 ?auto_28620 )
      ( GET-2IMAGE-VERIFY ?auto_28619 ?auto_28620 ?auto_28622 ?auto_28621 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28637 - DIRECTION
      ?auto_28638 - MODE
      ?auto_28640 - DIRECTION
      ?auto_28639 - MODE
      ?auto_28642 - DIRECTION
      ?auto_28641 - MODE
    )
    :vars
    (
      ?auto_28643 - INSTRUMENT
      ?auto_28645 - SATELLITE
      ?auto_28644 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28643 ?auto_28645 ) ( SUPPORTS ?auto_28643 ?auto_28641 ) ( POINTING ?auto_28645 ?auto_28644 ) ( not ( = ?auto_28642 ?auto_28644 ) ) ( HAVE_IMAGE ?auto_28637 ?auto_28638 ) ( not ( = ?auto_28637 ?auto_28642 ) ) ( not ( = ?auto_28637 ?auto_28644 ) ) ( not ( = ?auto_28638 ?auto_28641 ) ) ( CALIBRATION_TARGET ?auto_28643 ?auto_28644 ) ( POWER_AVAIL ?auto_28645 ) ( HAVE_IMAGE ?auto_28640 ?auto_28639 ) ( not ( = ?auto_28637 ?auto_28640 ) ) ( not ( = ?auto_28638 ?auto_28639 ) ) ( not ( = ?auto_28640 ?auto_28642 ) ) ( not ( = ?auto_28640 ?auto_28644 ) ) ( not ( = ?auto_28639 ?auto_28641 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28637 ?auto_28638 ?auto_28642 ?auto_28641 )
      ( GET-3IMAGE-VERIFY ?auto_28637 ?auto_28638 ?auto_28640 ?auto_28639 ?auto_28642 ?auto_28641 ) )
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
      ?auto_28654 - SATELLITE
      ?auto_28653 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28652 ?auto_28654 ) ( SUPPORTS ?auto_28652 ?auto_28650 ) ( POINTING ?auto_28654 ?auto_28653 ) ( not ( = ?auto_28651 ?auto_28653 ) ) ( HAVE_IMAGE ?auto_28646 ?auto_28647 ) ( not ( = ?auto_28646 ?auto_28651 ) ) ( not ( = ?auto_28646 ?auto_28653 ) ) ( not ( = ?auto_28647 ?auto_28650 ) ) ( CALIBRATION_TARGET ?auto_28652 ?auto_28653 ) ( POWER_AVAIL ?auto_28654 ) ( HAVE_IMAGE ?auto_28649 ?auto_28648 ) ( not ( = ?auto_28646 ?auto_28649 ) ) ( not ( = ?auto_28647 ?auto_28648 ) ) ( not ( = ?auto_28649 ?auto_28651 ) ) ( not ( = ?auto_28649 ?auto_28653 ) ) ( not ( = ?auto_28648 ?auto_28650 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28646 ?auto_28647 ?auto_28651 ?auto_28650 )
      ( GET-3IMAGE-VERIFY ?auto_28646 ?auto_28647 ?auto_28649 ?auto_28648 ?auto_28651 ?auto_28650 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28655 - DIRECTION
      ?auto_28656 - MODE
      ?auto_28658 - DIRECTION
      ?auto_28657 - MODE
      ?auto_28660 - DIRECTION
      ?auto_28659 - MODE
    )
    :vars
    (
      ?auto_28661 - INSTRUMENT
      ?auto_28663 - SATELLITE
      ?auto_28662 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28661 ?auto_28663 ) ( SUPPORTS ?auto_28661 ?auto_28657 ) ( POINTING ?auto_28663 ?auto_28662 ) ( not ( = ?auto_28658 ?auto_28662 ) ) ( HAVE_IMAGE ?auto_28655 ?auto_28656 ) ( not ( = ?auto_28655 ?auto_28658 ) ) ( not ( = ?auto_28655 ?auto_28662 ) ) ( not ( = ?auto_28656 ?auto_28657 ) ) ( CALIBRATION_TARGET ?auto_28661 ?auto_28662 ) ( POWER_AVAIL ?auto_28663 ) ( HAVE_IMAGE ?auto_28660 ?auto_28659 ) ( not ( = ?auto_28655 ?auto_28660 ) ) ( not ( = ?auto_28656 ?auto_28659 ) ) ( not ( = ?auto_28658 ?auto_28660 ) ) ( not ( = ?auto_28657 ?auto_28659 ) ) ( not ( = ?auto_28660 ?auto_28662 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28655 ?auto_28656 ?auto_28658 ?auto_28657 )
      ( GET-3IMAGE-VERIFY ?auto_28655 ?auto_28656 ?auto_28658 ?auto_28657 ?auto_28660 ?auto_28659 ) )
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
      ?auto_28672 - SATELLITE
      ?auto_28671 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28670 ?auto_28672 ) ( SUPPORTS ?auto_28670 ?auto_28666 ) ( POINTING ?auto_28672 ?auto_28671 ) ( not ( = ?auto_28667 ?auto_28671 ) ) ( HAVE_IMAGE ?auto_28664 ?auto_28665 ) ( not ( = ?auto_28664 ?auto_28667 ) ) ( not ( = ?auto_28664 ?auto_28671 ) ) ( not ( = ?auto_28665 ?auto_28666 ) ) ( CALIBRATION_TARGET ?auto_28670 ?auto_28671 ) ( POWER_AVAIL ?auto_28672 ) ( HAVE_IMAGE ?auto_28669 ?auto_28668 ) ( not ( = ?auto_28664 ?auto_28669 ) ) ( not ( = ?auto_28665 ?auto_28668 ) ) ( not ( = ?auto_28667 ?auto_28669 ) ) ( not ( = ?auto_28666 ?auto_28668 ) ) ( not ( = ?auto_28669 ?auto_28671 ) ) )
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
      ?auto_28690 - SATELLITE
      ?auto_28689 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28688 ?auto_28690 ) ( SUPPORTS ?auto_28688 ?auto_28686 ) ( POINTING ?auto_28690 ?auto_28689 ) ( not ( = ?auto_28687 ?auto_28689 ) ) ( HAVE_IMAGE ?auto_28685 ?auto_28684 ) ( not ( = ?auto_28685 ?auto_28687 ) ) ( not ( = ?auto_28685 ?auto_28689 ) ) ( not ( = ?auto_28684 ?auto_28686 ) ) ( CALIBRATION_TARGET ?auto_28688 ?auto_28689 ) ( POWER_AVAIL ?auto_28690 ) ( HAVE_IMAGE ?auto_28682 ?auto_28683 ) ( not ( = ?auto_28682 ?auto_28685 ) ) ( not ( = ?auto_28682 ?auto_28687 ) ) ( not ( = ?auto_28682 ?auto_28689 ) ) ( not ( = ?auto_28683 ?auto_28684 ) ) ( not ( = ?auto_28683 ?auto_28686 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28685 ?auto_28684 ?auto_28687 ?auto_28686 )
      ( GET-3IMAGE-VERIFY ?auto_28682 ?auto_28683 ?auto_28685 ?auto_28684 ?auto_28687 ?auto_28686 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28691 - DIRECTION
      ?auto_28692 - MODE
      ?auto_28694 - DIRECTION
      ?auto_28693 - MODE
      ?auto_28696 - DIRECTION
      ?auto_28695 - MODE
    )
    :vars
    (
      ?auto_28697 - INSTRUMENT
      ?auto_28699 - SATELLITE
      ?auto_28698 - DIRECTION
      ?auto_28700 - DIRECTION
      ?auto_28701 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28697 ?auto_28699 ) ( SUPPORTS ?auto_28697 ?auto_28695 ) ( POINTING ?auto_28699 ?auto_28698 ) ( not ( = ?auto_28696 ?auto_28698 ) ) ( HAVE_IMAGE ?auto_28700 ?auto_28701 ) ( not ( = ?auto_28700 ?auto_28696 ) ) ( not ( = ?auto_28700 ?auto_28698 ) ) ( not ( = ?auto_28701 ?auto_28695 ) ) ( CALIBRATION_TARGET ?auto_28697 ?auto_28698 ) ( POWER_AVAIL ?auto_28699 ) ( HAVE_IMAGE ?auto_28691 ?auto_28692 ) ( HAVE_IMAGE ?auto_28694 ?auto_28693 ) ( not ( = ?auto_28691 ?auto_28694 ) ) ( not ( = ?auto_28691 ?auto_28696 ) ) ( not ( = ?auto_28691 ?auto_28698 ) ) ( not ( = ?auto_28691 ?auto_28700 ) ) ( not ( = ?auto_28692 ?auto_28693 ) ) ( not ( = ?auto_28692 ?auto_28695 ) ) ( not ( = ?auto_28692 ?auto_28701 ) ) ( not ( = ?auto_28694 ?auto_28696 ) ) ( not ( = ?auto_28694 ?auto_28698 ) ) ( not ( = ?auto_28694 ?auto_28700 ) ) ( not ( = ?auto_28693 ?auto_28695 ) ) ( not ( = ?auto_28693 ?auto_28701 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28700 ?auto_28701 ?auto_28696 ?auto_28695 )
      ( GET-3IMAGE-VERIFY ?auto_28691 ?auto_28692 ?auto_28694 ?auto_28693 ?auto_28696 ?auto_28695 ) )
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
      ?auto_28710 - SATELLITE
      ?auto_28709 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28708 ?auto_28710 ) ( SUPPORTS ?auto_28708 ?auto_28704 ) ( POINTING ?auto_28710 ?auto_28709 ) ( not ( = ?auto_28705 ?auto_28709 ) ) ( HAVE_IMAGE ?auto_28707 ?auto_28706 ) ( not ( = ?auto_28707 ?auto_28705 ) ) ( not ( = ?auto_28707 ?auto_28709 ) ) ( not ( = ?auto_28706 ?auto_28704 ) ) ( CALIBRATION_TARGET ?auto_28708 ?auto_28709 ) ( POWER_AVAIL ?auto_28710 ) ( HAVE_IMAGE ?auto_28702 ?auto_28703 ) ( not ( = ?auto_28702 ?auto_28705 ) ) ( not ( = ?auto_28702 ?auto_28707 ) ) ( not ( = ?auto_28702 ?auto_28709 ) ) ( not ( = ?auto_28703 ?auto_28704 ) ) ( not ( = ?auto_28703 ?auto_28706 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28707 ?auto_28706 ?auto_28705 ?auto_28704 )
      ( GET-3IMAGE-VERIFY ?auto_28702 ?auto_28703 ?auto_28705 ?auto_28704 ?auto_28707 ?auto_28706 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28711 - DIRECTION
      ?auto_28712 - MODE
      ?auto_28714 - DIRECTION
      ?auto_28713 - MODE
      ?auto_28716 - DIRECTION
      ?auto_28715 - MODE
    )
    :vars
    (
      ?auto_28717 - INSTRUMENT
      ?auto_28719 - SATELLITE
      ?auto_28718 - DIRECTION
      ?auto_28720 - DIRECTION
      ?auto_28721 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28717 ?auto_28719 ) ( SUPPORTS ?auto_28717 ?auto_28713 ) ( POINTING ?auto_28719 ?auto_28718 ) ( not ( = ?auto_28714 ?auto_28718 ) ) ( HAVE_IMAGE ?auto_28720 ?auto_28721 ) ( not ( = ?auto_28720 ?auto_28714 ) ) ( not ( = ?auto_28720 ?auto_28718 ) ) ( not ( = ?auto_28721 ?auto_28713 ) ) ( CALIBRATION_TARGET ?auto_28717 ?auto_28718 ) ( POWER_AVAIL ?auto_28719 ) ( HAVE_IMAGE ?auto_28711 ?auto_28712 ) ( HAVE_IMAGE ?auto_28716 ?auto_28715 ) ( not ( = ?auto_28711 ?auto_28714 ) ) ( not ( = ?auto_28711 ?auto_28716 ) ) ( not ( = ?auto_28711 ?auto_28718 ) ) ( not ( = ?auto_28711 ?auto_28720 ) ) ( not ( = ?auto_28712 ?auto_28713 ) ) ( not ( = ?auto_28712 ?auto_28715 ) ) ( not ( = ?auto_28712 ?auto_28721 ) ) ( not ( = ?auto_28714 ?auto_28716 ) ) ( not ( = ?auto_28713 ?auto_28715 ) ) ( not ( = ?auto_28716 ?auto_28718 ) ) ( not ( = ?auto_28716 ?auto_28720 ) ) ( not ( = ?auto_28715 ?auto_28721 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28720 ?auto_28721 ?auto_28714 ?auto_28713 )
      ( GET-3IMAGE-VERIFY ?auto_28711 ?auto_28712 ?auto_28714 ?auto_28713 ?auto_28716 ?auto_28715 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28733 - DIRECTION
      ?auto_28734 - MODE
      ?auto_28736 - DIRECTION
      ?auto_28735 - MODE
      ?auto_28738 - DIRECTION
      ?auto_28737 - MODE
    )
    :vars
    (
      ?auto_28739 - INSTRUMENT
      ?auto_28741 - SATELLITE
      ?auto_28740 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28739 ?auto_28741 ) ( SUPPORTS ?auto_28739 ?auto_28734 ) ( POINTING ?auto_28741 ?auto_28740 ) ( not ( = ?auto_28733 ?auto_28740 ) ) ( HAVE_IMAGE ?auto_28736 ?auto_28735 ) ( not ( = ?auto_28736 ?auto_28733 ) ) ( not ( = ?auto_28736 ?auto_28740 ) ) ( not ( = ?auto_28735 ?auto_28734 ) ) ( CALIBRATION_TARGET ?auto_28739 ?auto_28740 ) ( POWER_AVAIL ?auto_28741 ) ( HAVE_IMAGE ?auto_28738 ?auto_28737 ) ( not ( = ?auto_28733 ?auto_28738 ) ) ( not ( = ?auto_28734 ?auto_28737 ) ) ( not ( = ?auto_28736 ?auto_28738 ) ) ( not ( = ?auto_28735 ?auto_28737 ) ) ( not ( = ?auto_28738 ?auto_28740 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28736 ?auto_28735 ?auto_28733 ?auto_28734 )
      ( GET-3IMAGE-VERIFY ?auto_28733 ?auto_28734 ?auto_28736 ?auto_28735 ?auto_28738 ?auto_28737 ) )
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
      ?auto_28750 - SATELLITE
      ?auto_28749 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28748 ?auto_28750 ) ( SUPPORTS ?auto_28748 ?auto_28743 ) ( POINTING ?auto_28750 ?auto_28749 ) ( not ( = ?auto_28742 ?auto_28749 ) ) ( HAVE_IMAGE ?auto_28745 ?auto_28744 ) ( not ( = ?auto_28745 ?auto_28742 ) ) ( not ( = ?auto_28745 ?auto_28749 ) ) ( not ( = ?auto_28744 ?auto_28743 ) ) ( CALIBRATION_TARGET ?auto_28748 ?auto_28749 ) ( POWER_AVAIL ?auto_28750 ) ( HAVE_IMAGE ?auto_28747 ?auto_28746 ) ( not ( = ?auto_28742 ?auto_28747 ) ) ( not ( = ?auto_28743 ?auto_28746 ) ) ( not ( = ?auto_28745 ?auto_28747 ) ) ( not ( = ?auto_28744 ?auto_28746 ) ) ( not ( = ?auto_28747 ?auto_28749 ) ) )
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
      ?auto_28768 - SATELLITE
      ?auto_28767 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28766 ?auto_28768 ) ( SUPPORTS ?auto_28766 ?auto_28761 ) ( POINTING ?auto_28768 ?auto_28767 ) ( not ( = ?auto_28760 ?auto_28767 ) ) ( HAVE_IMAGE ?auto_28765 ?auto_28764 ) ( not ( = ?auto_28765 ?auto_28760 ) ) ( not ( = ?auto_28765 ?auto_28767 ) ) ( not ( = ?auto_28764 ?auto_28761 ) ) ( CALIBRATION_TARGET ?auto_28766 ?auto_28767 ) ( POWER_AVAIL ?auto_28768 ) ( HAVE_IMAGE ?auto_28763 ?auto_28762 ) ( not ( = ?auto_28760 ?auto_28763 ) ) ( not ( = ?auto_28761 ?auto_28762 ) ) ( not ( = ?auto_28763 ?auto_28765 ) ) ( not ( = ?auto_28763 ?auto_28767 ) ) ( not ( = ?auto_28762 ?auto_28764 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28765 ?auto_28764 ?auto_28760 ?auto_28761 )
      ( GET-3IMAGE-VERIFY ?auto_28760 ?auto_28761 ?auto_28763 ?auto_28762 ?auto_28765 ?auto_28764 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28769 - DIRECTION
      ?auto_28770 - MODE
      ?auto_28772 - DIRECTION
      ?auto_28771 - MODE
      ?auto_28774 - DIRECTION
      ?auto_28773 - MODE
    )
    :vars
    (
      ?auto_28775 - INSTRUMENT
      ?auto_28777 - SATELLITE
      ?auto_28776 - DIRECTION
      ?auto_28778 - DIRECTION
      ?auto_28779 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28775 ?auto_28777 ) ( SUPPORTS ?auto_28775 ?auto_28770 ) ( POINTING ?auto_28777 ?auto_28776 ) ( not ( = ?auto_28769 ?auto_28776 ) ) ( HAVE_IMAGE ?auto_28778 ?auto_28779 ) ( not ( = ?auto_28778 ?auto_28769 ) ) ( not ( = ?auto_28778 ?auto_28776 ) ) ( not ( = ?auto_28779 ?auto_28770 ) ) ( CALIBRATION_TARGET ?auto_28775 ?auto_28776 ) ( POWER_AVAIL ?auto_28777 ) ( HAVE_IMAGE ?auto_28772 ?auto_28771 ) ( HAVE_IMAGE ?auto_28774 ?auto_28773 ) ( not ( = ?auto_28769 ?auto_28772 ) ) ( not ( = ?auto_28769 ?auto_28774 ) ) ( not ( = ?auto_28770 ?auto_28771 ) ) ( not ( = ?auto_28770 ?auto_28773 ) ) ( not ( = ?auto_28772 ?auto_28774 ) ) ( not ( = ?auto_28772 ?auto_28776 ) ) ( not ( = ?auto_28772 ?auto_28778 ) ) ( not ( = ?auto_28771 ?auto_28773 ) ) ( not ( = ?auto_28771 ?auto_28779 ) ) ( not ( = ?auto_28774 ?auto_28776 ) ) ( not ( = ?auto_28774 ?auto_28778 ) ) ( not ( = ?auto_28773 ?auto_28779 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28778 ?auto_28779 ?auto_28769 ?auto_28770 )
      ( GET-3IMAGE-VERIFY ?auto_28769 ?auto_28770 ?auto_28772 ?auto_28771 ?auto_28774 ?auto_28773 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_28822 - DIRECTION
      ?auto_28823 - MODE
    )
    :vars
    (
      ?auto_28824 - INSTRUMENT
      ?auto_28826 - SATELLITE
      ?auto_28825 - DIRECTION
      ?auto_28827 - DIRECTION
      ?auto_28828 - MODE
      ?auto_28829 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28824 ?auto_28826 ) ( SUPPORTS ?auto_28824 ?auto_28823 ) ( not ( = ?auto_28822 ?auto_28825 ) ) ( HAVE_IMAGE ?auto_28827 ?auto_28828 ) ( not ( = ?auto_28827 ?auto_28822 ) ) ( not ( = ?auto_28827 ?auto_28825 ) ) ( not ( = ?auto_28828 ?auto_28823 ) ) ( CALIBRATION_TARGET ?auto_28824 ?auto_28825 ) ( POWER_AVAIL ?auto_28826 ) ( POINTING ?auto_28826 ?auto_28829 ) ( not ( = ?auto_28825 ?auto_28829 ) ) ( not ( = ?auto_28822 ?auto_28829 ) ) ( not ( = ?auto_28827 ?auto_28829 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_28826 ?auto_28825 ?auto_28829 )
      ( GET-2IMAGE ?auto_28827 ?auto_28828 ?auto_28822 ?auto_28823 )
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
      ?auto_28836 - INSTRUMENT
      ?auto_28835 - SATELLITE
      ?auto_28834 - DIRECTION
      ?auto_28837 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28836 ?auto_28835 ) ( SUPPORTS ?auto_28836 ?auto_28832 ) ( not ( = ?auto_28833 ?auto_28834 ) ) ( HAVE_IMAGE ?auto_28830 ?auto_28831 ) ( not ( = ?auto_28830 ?auto_28833 ) ) ( not ( = ?auto_28830 ?auto_28834 ) ) ( not ( = ?auto_28831 ?auto_28832 ) ) ( CALIBRATION_TARGET ?auto_28836 ?auto_28834 ) ( POWER_AVAIL ?auto_28835 ) ( POINTING ?auto_28835 ?auto_28837 ) ( not ( = ?auto_28834 ?auto_28837 ) ) ( not ( = ?auto_28833 ?auto_28837 ) ) ( not ( = ?auto_28830 ?auto_28837 ) ) )
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
      ?auto_28842 - INSTRUMENT
      ?auto_28846 - SATELLITE
      ?auto_28845 - DIRECTION
      ?auto_28844 - DIRECTION
      ?auto_28843 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28842 ?auto_28846 ) ( SUPPORTS ?auto_28842 ?auto_28840 ) ( not ( = ?auto_28841 ?auto_28845 ) ) ( HAVE_IMAGE ?auto_28844 ?auto_28843 ) ( not ( = ?auto_28844 ?auto_28841 ) ) ( not ( = ?auto_28844 ?auto_28845 ) ) ( not ( = ?auto_28843 ?auto_28840 ) ) ( CALIBRATION_TARGET ?auto_28842 ?auto_28845 ) ( POWER_AVAIL ?auto_28846 ) ( POINTING ?auto_28846 ?auto_28838 ) ( not ( = ?auto_28845 ?auto_28838 ) ) ( not ( = ?auto_28841 ?auto_28838 ) ) ( not ( = ?auto_28844 ?auto_28838 ) ) ( HAVE_IMAGE ?auto_28838 ?auto_28839 ) ( not ( = ?auto_28839 ?auto_28840 ) ) ( not ( = ?auto_28839 ?auto_28843 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28844 ?auto_28843 ?auto_28841 ?auto_28840 )
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
      ?auto_28854 - SATELLITE
      ?auto_28853 - DIRECTION
      ?auto_28852 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28851 ?auto_28854 ) ( SUPPORTS ?auto_28851 ?auto_28848 ) ( not ( = ?auto_28847 ?auto_28853 ) ) ( HAVE_IMAGE ?auto_28850 ?auto_28849 ) ( not ( = ?auto_28850 ?auto_28847 ) ) ( not ( = ?auto_28850 ?auto_28853 ) ) ( not ( = ?auto_28849 ?auto_28848 ) ) ( CALIBRATION_TARGET ?auto_28851 ?auto_28853 ) ( POWER_AVAIL ?auto_28854 ) ( POINTING ?auto_28854 ?auto_28852 ) ( not ( = ?auto_28853 ?auto_28852 ) ) ( not ( = ?auto_28847 ?auto_28852 ) ) ( not ( = ?auto_28850 ?auto_28852 ) ) )
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
      ?auto_28859 - INSTRUMENT
      ?auto_28863 - SATELLITE
      ?auto_28862 - DIRECTION
      ?auto_28861 - DIRECTION
      ?auto_28860 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28859 ?auto_28863 ) ( SUPPORTS ?auto_28859 ?auto_28856 ) ( not ( = ?auto_28855 ?auto_28862 ) ) ( HAVE_IMAGE ?auto_28861 ?auto_28860 ) ( not ( = ?auto_28861 ?auto_28855 ) ) ( not ( = ?auto_28861 ?auto_28862 ) ) ( not ( = ?auto_28860 ?auto_28856 ) ) ( CALIBRATION_TARGET ?auto_28859 ?auto_28862 ) ( POWER_AVAIL ?auto_28863 ) ( POINTING ?auto_28863 ?auto_28858 ) ( not ( = ?auto_28862 ?auto_28858 ) ) ( not ( = ?auto_28855 ?auto_28858 ) ) ( not ( = ?auto_28861 ?auto_28858 ) ) ( HAVE_IMAGE ?auto_28858 ?auto_28857 ) ( not ( = ?auto_28856 ?auto_28857 ) ) ( not ( = ?auto_28857 ?auto_28860 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28861 ?auto_28860 ?auto_28855 ?auto_28856 )
      ( GET-2IMAGE-VERIFY ?auto_28855 ?auto_28856 ?auto_28858 ?auto_28857 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28874 - DIRECTION
      ?auto_28875 - MODE
      ?auto_28877 - DIRECTION
      ?auto_28876 - MODE
      ?auto_28879 - DIRECTION
      ?auto_28878 - MODE
    )
    :vars
    (
      ?auto_28880 - INSTRUMENT
      ?auto_28883 - SATELLITE
      ?auto_28882 - DIRECTION
      ?auto_28881 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28880 ?auto_28883 ) ( SUPPORTS ?auto_28880 ?auto_28878 ) ( not ( = ?auto_28879 ?auto_28882 ) ) ( HAVE_IMAGE ?auto_28877 ?auto_28875 ) ( not ( = ?auto_28877 ?auto_28879 ) ) ( not ( = ?auto_28877 ?auto_28882 ) ) ( not ( = ?auto_28875 ?auto_28878 ) ) ( CALIBRATION_TARGET ?auto_28880 ?auto_28882 ) ( POWER_AVAIL ?auto_28883 ) ( POINTING ?auto_28883 ?auto_28881 ) ( not ( = ?auto_28882 ?auto_28881 ) ) ( not ( = ?auto_28879 ?auto_28881 ) ) ( not ( = ?auto_28877 ?auto_28881 ) ) ( HAVE_IMAGE ?auto_28874 ?auto_28875 ) ( HAVE_IMAGE ?auto_28877 ?auto_28876 ) ( not ( = ?auto_28874 ?auto_28877 ) ) ( not ( = ?auto_28874 ?auto_28879 ) ) ( not ( = ?auto_28874 ?auto_28882 ) ) ( not ( = ?auto_28874 ?auto_28881 ) ) ( not ( = ?auto_28875 ?auto_28876 ) ) ( not ( = ?auto_28876 ?auto_28878 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28877 ?auto_28875 ?auto_28879 ?auto_28878 )
      ( GET-3IMAGE-VERIFY ?auto_28874 ?auto_28875 ?auto_28877 ?auto_28876 ?auto_28879 ?auto_28878 ) )
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
      ?auto_28892 - SATELLITE
      ?auto_28891 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28890 ?auto_28892 ) ( SUPPORTS ?auto_28890 ?auto_28888 ) ( not ( = ?auto_28889 ?auto_28891 ) ) ( HAVE_IMAGE ?auto_28884 ?auto_28885 ) ( not ( = ?auto_28884 ?auto_28889 ) ) ( not ( = ?auto_28884 ?auto_28891 ) ) ( not ( = ?auto_28885 ?auto_28888 ) ) ( CALIBRATION_TARGET ?auto_28890 ?auto_28891 ) ( POWER_AVAIL ?auto_28892 ) ( POINTING ?auto_28892 ?auto_28887 ) ( not ( = ?auto_28891 ?auto_28887 ) ) ( not ( = ?auto_28889 ?auto_28887 ) ) ( not ( = ?auto_28884 ?auto_28887 ) ) ( HAVE_IMAGE ?auto_28887 ?auto_28886 ) ( not ( = ?auto_28885 ?auto_28886 ) ) ( not ( = ?auto_28886 ?auto_28888 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28884 ?auto_28885 ?auto_28889 ?auto_28888 )
      ( GET-3IMAGE-VERIFY ?auto_28884 ?auto_28885 ?auto_28887 ?auto_28886 ?auto_28889 ?auto_28888 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28893 - DIRECTION
      ?auto_28894 - MODE
      ?auto_28896 - DIRECTION
      ?auto_28895 - MODE
      ?auto_28898 - DIRECTION
      ?auto_28897 - MODE
    )
    :vars
    (
      ?auto_28899 - INSTRUMENT
      ?auto_28902 - SATELLITE
      ?auto_28901 - DIRECTION
      ?auto_28900 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28899 ?auto_28902 ) ( SUPPORTS ?auto_28899 ?auto_28895 ) ( not ( = ?auto_28896 ?auto_28901 ) ) ( HAVE_IMAGE ?auto_28898 ?auto_28897 ) ( not ( = ?auto_28898 ?auto_28896 ) ) ( not ( = ?auto_28898 ?auto_28901 ) ) ( not ( = ?auto_28897 ?auto_28895 ) ) ( CALIBRATION_TARGET ?auto_28899 ?auto_28901 ) ( POWER_AVAIL ?auto_28902 ) ( POINTING ?auto_28902 ?auto_28900 ) ( not ( = ?auto_28901 ?auto_28900 ) ) ( not ( = ?auto_28896 ?auto_28900 ) ) ( not ( = ?auto_28898 ?auto_28900 ) ) ( HAVE_IMAGE ?auto_28893 ?auto_28894 ) ( not ( = ?auto_28893 ?auto_28896 ) ) ( not ( = ?auto_28893 ?auto_28898 ) ) ( not ( = ?auto_28893 ?auto_28901 ) ) ( not ( = ?auto_28893 ?auto_28900 ) ) ( not ( = ?auto_28894 ?auto_28895 ) ) ( not ( = ?auto_28894 ?auto_28897 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28898 ?auto_28897 ?auto_28896 ?auto_28895 )
      ( GET-3IMAGE-VERIFY ?auto_28893 ?auto_28894 ?auto_28896 ?auto_28895 ?auto_28898 ?auto_28897 ) )
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
      ?auto_28911 - SATELLITE
      ?auto_28910 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28909 ?auto_28911 ) ( SUPPORTS ?auto_28909 ?auto_28905 ) ( not ( = ?auto_28906 ?auto_28910 ) ) ( HAVE_IMAGE ?auto_28903 ?auto_28904 ) ( not ( = ?auto_28903 ?auto_28906 ) ) ( not ( = ?auto_28903 ?auto_28910 ) ) ( not ( = ?auto_28904 ?auto_28905 ) ) ( CALIBRATION_TARGET ?auto_28909 ?auto_28910 ) ( POWER_AVAIL ?auto_28911 ) ( POINTING ?auto_28911 ?auto_28908 ) ( not ( = ?auto_28910 ?auto_28908 ) ) ( not ( = ?auto_28906 ?auto_28908 ) ) ( not ( = ?auto_28903 ?auto_28908 ) ) ( HAVE_IMAGE ?auto_28908 ?auto_28907 ) ( not ( = ?auto_28904 ?auto_28907 ) ) ( not ( = ?auto_28905 ?auto_28907 ) ) )
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
      ?auto_28930 - SATELLITE
      ?auto_28929 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28928 ?auto_28930 ) ( SUPPORTS ?auto_28928 ?auto_28926 ) ( not ( = ?auto_28927 ?auto_28929 ) ) ( HAVE_IMAGE ?auto_28925 ?auto_28924 ) ( not ( = ?auto_28925 ?auto_28927 ) ) ( not ( = ?auto_28925 ?auto_28929 ) ) ( not ( = ?auto_28924 ?auto_28926 ) ) ( CALIBRATION_TARGET ?auto_28928 ?auto_28929 ) ( POWER_AVAIL ?auto_28930 ) ( POINTING ?auto_28930 ?auto_28922 ) ( not ( = ?auto_28929 ?auto_28922 ) ) ( not ( = ?auto_28927 ?auto_28922 ) ) ( not ( = ?auto_28925 ?auto_28922 ) ) ( HAVE_IMAGE ?auto_28922 ?auto_28923 ) ( not ( = ?auto_28923 ?auto_28924 ) ) ( not ( = ?auto_28923 ?auto_28926 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28925 ?auto_28924 ?auto_28927 ?auto_28926 )
      ( GET-3IMAGE-VERIFY ?auto_28922 ?auto_28923 ?auto_28925 ?auto_28924 ?auto_28927 ?auto_28926 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28931 - DIRECTION
      ?auto_28932 - MODE
      ?auto_28934 - DIRECTION
      ?auto_28933 - MODE
      ?auto_28936 - DIRECTION
      ?auto_28935 - MODE
    )
    :vars
    (
      ?auto_28937 - INSTRUMENT
      ?auto_28941 - SATELLITE
      ?auto_28940 - DIRECTION
      ?auto_28939 - DIRECTION
      ?auto_28938 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28937 ?auto_28941 ) ( SUPPORTS ?auto_28937 ?auto_28935 ) ( not ( = ?auto_28936 ?auto_28940 ) ) ( HAVE_IMAGE ?auto_28939 ?auto_28938 ) ( not ( = ?auto_28939 ?auto_28936 ) ) ( not ( = ?auto_28939 ?auto_28940 ) ) ( not ( = ?auto_28938 ?auto_28935 ) ) ( CALIBRATION_TARGET ?auto_28937 ?auto_28940 ) ( POWER_AVAIL ?auto_28941 ) ( POINTING ?auto_28941 ?auto_28934 ) ( not ( = ?auto_28940 ?auto_28934 ) ) ( not ( = ?auto_28936 ?auto_28934 ) ) ( not ( = ?auto_28939 ?auto_28934 ) ) ( HAVE_IMAGE ?auto_28931 ?auto_28932 ) ( HAVE_IMAGE ?auto_28934 ?auto_28933 ) ( not ( = ?auto_28931 ?auto_28934 ) ) ( not ( = ?auto_28931 ?auto_28936 ) ) ( not ( = ?auto_28931 ?auto_28940 ) ) ( not ( = ?auto_28931 ?auto_28939 ) ) ( not ( = ?auto_28932 ?auto_28933 ) ) ( not ( = ?auto_28932 ?auto_28935 ) ) ( not ( = ?auto_28932 ?auto_28938 ) ) ( not ( = ?auto_28933 ?auto_28935 ) ) ( not ( = ?auto_28933 ?auto_28938 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28939 ?auto_28938 ?auto_28936 ?auto_28935 )
      ( GET-3IMAGE-VERIFY ?auto_28931 ?auto_28932 ?auto_28934 ?auto_28933 ?auto_28936 ?auto_28935 ) )
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
      ?auto_28950 - SATELLITE
      ?auto_28949 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28948 ?auto_28950 ) ( SUPPORTS ?auto_28948 ?auto_28944 ) ( not ( = ?auto_28945 ?auto_28949 ) ) ( HAVE_IMAGE ?auto_28947 ?auto_28946 ) ( not ( = ?auto_28947 ?auto_28945 ) ) ( not ( = ?auto_28947 ?auto_28949 ) ) ( not ( = ?auto_28946 ?auto_28944 ) ) ( CALIBRATION_TARGET ?auto_28948 ?auto_28949 ) ( POWER_AVAIL ?auto_28950 ) ( POINTING ?auto_28950 ?auto_28942 ) ( not ( = ?auto_28949 ?auto_28942 ) ) ( not ( = ?auto_28945 ?auto_28942 ) ) ( not ( = ?auto_28947 ?auto_28942 ) ) ( HAVE_IMAGE ?auto_28942 ?auto_28943 ) ( not ( = ?auto_28943 ?auto_28944 ) ) ( not ( = ?auto_28943 ?auto_28946 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28947 ?auto_28946 ?auto_28945 ?auto_28944 )
      ( GET-3IMAGE-VERIFY ?auto_28942 ?auto_28943 ?auto_28945 ?auto_28944 ?auto_28947 ?auto_28946 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28951 - DIRECTION
      ?auto_28952 - MODE
      ?auto_28954 - DIRECTION
      ?auto_28953 - MODE
      ?auto_28956 - DIRECTION
      ?auto_28955 - MODE
    )
    :vars
    (
      ?auto_28957 - INSTRUMENT
      ?auto_28961 - SATELLITE
      ?auto_28960 - DIRECTION
      ?auto_28959 - DIRECTION
      ?auto_28958 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_28957 ?auto_28961 ) ( SUPPORTS ?auto_28957 ?auto_28953 ) ( not ( = ?auto_28954 ?auto_28960 ) ) ( HAVE_IMAGE ?auto_28959 ?auto_28958 ) ( not ( = ?auto_28959 ?auto_28954 ) ) ( not ( = ?auto_28959 ?auto_28960 ) ) ( not ( = ?auto_28958 ?auto_28953 ) ) ( CALIBRATION_TARGET ?auto_28957 ?auto_28960 ) ( POWER_AVAIL ?auto_28961 ) ( POINTING ?auto_28961 ?auto_28956 ) ( not ( = ?auto_28960 ?auto_28956 ) ) ( not ( = ?auto_28954 ?auto_28956 ) ) ( not ( = ?auto_28959 ?auto_28956 ) ) ( HAVE_IMAGE ?auto_28951 ?auto_28952 ) ( HAVE_IMAGE ?auto_28956 ?auto_28955 ) ( not ( = ?auto_28951 ?auto_28954 ) ) ( not ( = ?auto_28951 ?auto_28956 ) ) ( not ( = ?auto_28951 ?auto_28960 ) ) ( not ( = ?auto_28951 ?auto_28959 ) ) ( not ( = ?auto_28952 ?auto_28953 ) ) ( not ( = ?auto_28952 ?auto_28955 ) ) ( not ( = ?auto_28952 ?auto_28958 ) ) ( not ( = ?auto_28953 ?auto_28955 ) ) ( not ( = ?auto_28955 ?auto_28958 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28959 ?auto_28958 ?auto_28954 ?auto_28953 )
      ( GET-3IMAGE-VERIFY ?auto_28951 ?auto_28952 ?auto_28954 ?auto_28953 ?auto_28956 ?auto_28955 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_28973 - DIRECTION
      ?auto_28974 - MODE
      ?auto_28976 - DIRECTION
      ?auto_28975 - MODE
      ?auto_28978 - DIRECTION
      ?auto_28977 - MODE
    )
    :vars
    (
      ?auto_28979 - INSTRUMENT
      ?auto_28982 - SATELLITE
      ?auto_28981 - DIRECTION
      ?auto_28980 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28979 ?auto_28982 ) ( SUPPORTS ?auto_28979 ?auto_28974 ) ( not ( = ?auto_28973 ?auto_28981 ) ) ( HAVE_IMAGE ?auto_28976 ?auto_28975 ) ( not ( = ?auto_28976 ?auto_28973 ) ) ( not ( = ?auto_28976 ?auto_28981 ) ) ( not ( = ?auto_28975 ?auto_28974 ) ) ( CALIBRATION_TARGET ?auto_28979 ?auto_28981 ) ( POWER_AVAIL ?auto_28982 ) ( POINTING ?auto_28982 ?auto_28980 ) ( not ( = ?auto_28981 ?auto_28980 ) ) ( not ( = ?auto_28973 ?auto_28980 ) ) ( not ( = ?auto_28976 ?auto_28980 ) ) ( HAVE_IMAGE ?auto_28978 ?auto_28977 ) ( not ( = ?auto_28973 ?auto_28978 ) ) ( not ( = ?auto_28974 ?auto_28977 ) ) ( not ( = ?auto_28976 ?auto_28978 ) ) ( not ( = ?auto_28975 ?auto_28977 ) ) ( not ( = ?auto_28978 ?auto_28981 ) ) ( not ( = ?auto_28978 ?auto_28980 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_28976 ?auto_28975 ?auto_28973 ?auto_28974 )
      ( GET-3IMAGE-VERIFY ?auto_28973 ?auto_28974 ?auto_28976 ?auto_28975 ?auto_28978 ?auto_28977 ) )
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
      ?auto_28991 - SATELLITE
      ?auto_28990 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28989 ?auto_28991 ) ( SUPPORTS ?auto_28989 ?auto_28984 ) ( not ( = ?auto_28983 ?auto_28990 ) ) ( HAVE_IMAGE ?auto_28986 ?auto_28985 ) ( not ( = ?auto_28986 ?auto_28983 ) ) ( not ( = ?auto_28986 ?auto_28990 ) ) ( not ( = ?auto_28985 ?auto_28984 ) ) ( CALIBRATION_TARGET ?auto_28989 ?auto_28990 ) ( POWER_AVAIL ?auto_28991 ) ( POINTING ?auto_28991 ?auto_28988 ) ( not ( = ?auto_28990 ?auto_28988 ) ) ( not ( = ?auto_28983 ?auto_28988 ) ) ( not ( = ?auto_28986 ?auto_28988 ) ) ( HAVE_IMAGE ?auto_28988 ?auto_28987 ) ( not ( = ?auto_28984 ?auto_28987 ) ) ( not ( = ?auto_28985 ?auto_28987 ) ) )
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
      ?auto_29010 - SATELLITE
      ?auto_29009 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29008 ?auto_29010 ) ( SUPPORTS ?auto_29008 ?auto_29003 ) ( not ( = ?auto_29002 ?auto_29009 ) ) ( HAVE_IMAGE ?auto_29007 ?auto_29006 ) ( not ( = ?auto_29007 ?auto_29002 ) ) ( not ( = ?auto_29007 ?auto_29009 ) ) ( not ( = ?auto_29006 ?auto_29003 ) ) ( CALIBRATION_TARGET ?auto_29008 ?auto_29009 ) ( POWER_AVAIL ?auto_29010 ) ( POINTING ?auto_29010 ?auto_29005 ) ( not ( = ?auto_29009 ?auto_29005 ) ) ( not ( = ?auto_29002 ?auto_29005 ) ) ( not ( = ?auto_29007 ?auto_29005 ) ) ( HAVE_IMAGE ?auto_29005 ?auto_29004 ) ( not ( = ?auto_29003 ?auto_29004 ) ) ( not ( = ?auto_29004 ?auto_29006 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29007 ?auto_29006 ?auto_29002 ?auto_29003 )
      ( GET-3IMAGE-VERIFY ?auto_29002 ?auto_29003 ?auto_29005 ?auto_29004 ?auto_29007 ?auto_29006 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29011 - DIRECTION
      ?auto_29012 - MODE
      ?auto_29014 - DIRECTION
      ?auto_29013 - MODE
      ?auto_29016 - DIRECTION
      ?auto_29015 - MODE
    )
    :vars
    (
      ?auto_29017 - INSTRUMENT
      ?auto_29021 - SATELLITE
      ?auto_29020 - DIRECTION
      ?auto_29019 - DIRECTION
      ?auto_29018 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29017 ?auto_29021 ) ( SUPPORTS ?auto_29017 ?auto_29012 ) ( not ( = ?auto_29011 ?auto_29020 ) ) ( HAVE_IMAGE ?auto_29019 ?auto_29018 ) ( not ( = ?auto_29019 ?auto_29011 ) ) ( not ( = ?auto_29019 ?auto_29020 ) ) ( not ( = ?auto_29018 ?auto_29012 ) ) ( CALIBRATION_TARGET ?auto_29017 ?auto_29020 ) ( POWER_AVAIL ?auto_29021 ) ( POINTING ?auto_29021 ?auto_29016 ) ( not ( = ?auto_29020 ?auto_29016 ) ) ( not ( = ?auto_29011 ?auto_29016 ) ) ( not ( = ?auto_29019 ?auto_29016 ) ) ( HAVE_IMAGE ?auto_29014 ?auto_29013 ) ( HAVE_IMAGE ?auto_29016 ?auto_29015 ) ( not ( = ?auto_29011 ?auto_29014 ) ) ( not ( = ?auto_29012 ?auto_29013 ) ) ( not ( = ?auto_29012 ?auto_29015 ) ) ( not ( = ?auto_29014 ?auto_29016 ) ) ( not ( = ?auto_29014 ?auto_29020 ) ) ( not ( = ?auto_29014 ?auto_29019 ) ) ( not ( = ?auto_29013 ?auto_29015 ) ) ( not ( = ?auto_29013 ?auto_29018 ) ) ( not ( = ?auto_29015 ?auto_29018 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29019 ?auto_29018 ?auto_29011 ?auto_29012 )
      ( GET-3IMAGE-VERIFY ?auto_29011 ?auto_29012 ?auto_29014 ?auto_29013 ?auto_29016 ?auto_29015 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_29066 - DIRECTION
      ?auto_29067 - MODE
    )
    :vars
    (
      ?auto_29068 - INSTRUMENT
      ?auto_29073 - SATELLITE
      ?auto_29072 - DIRECTION
      ?auto_29070 - DIRECTION
      ?auto_29069 - MODE
      ?auto_29071 - DIRECTION
      ?auto_29074 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29068 ?auto_29073 ) ( SUPPORTS ?auto_29068 ?auto_29067 ) ( not ( = ?auto_29066 ?auto_29072 ) ) ( HAVE_IMAGE ?auto_29070 ?auto_29069 ) ( not ( = ?auto_29070 ?auto_29066 ) ) ( not ( = ?auto_29070 ?auto_29072 ) ) ( not ( = ?auto_29069 ?auto_29067 ) ) ( CALIBRATION_TARGET ?auto_29068 ?auto_29072 ) ( POINTING ?auto_29073 ?auto_29071 ) ( not ( = ?auto_29072 ?auto_29071 ) ) ( not ( = ?auto_29066 ?auto_29071 ) ) ( not ( = ?auto_29070 ?auto_29071 ) ) ( ON_BOARD ?auto_29074 ?auto_29073 ) ( POWER_ON ?auto_29074 ) ( not ( = ?auto_29068 ?auto_29074 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_29074 ?auto_29073 )
      ( GET-2IMAGE ?auto_29070 ?auto_29069 ?auto_29066 ?auto_29067 )
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
      ?auto_29081 - INSTRUMENT
      ?auto_29082 - SATELLITE
      ?auto_29080 - DIRECTION
      ?auto_29083 - DIRECTION
      ?auto_29079 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29081 ?auto_29082 ) ( SUPPORTS ?auto_29081 ?auto_29077 ) ( not ( = ?auto_29078 ?auto_29080 ) ) ( HAVE_IMAGE ?auto_29075 ?auto_29076 ) ( not ( = ?auto_29075 ?auto_29078 ) ) ( not ( = ?auto_29075 ?auto_29080 ) ) ( not ( = ?auto_29076 ?auto_29077 ) ) ( CALIBRATION_TARGET ?auto_29081 ?auto_29080 ) ( POINTING ?auto_29082 ?auto_29083 ) ( not ( = ?auto_29080 ?auto_29083 ) ) ( not ( = ?auto_29078 ?auto_29083 ) ) ( not ( = ?auto_29075 ?auto_29083 ) ) ( ON_BOARD ?auto_29079 ?auto_29082 ) ( POWER_ON ?auto_29079 ) ( not ( = ?auto_29081 ?auto_29079 ) ) )
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
      ?auto_29091 - INSTRUMENT
      ?auto_29090 - SATELLITE
      ?auto_29092 - DIRECTION
      ?auto_29088 - DIRECTION
      ?auto_29093 - MODE
      ?auto_29089 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29091 ?auto_29090 ) ( SUPPORTS ?auto_29091 ?auto_29086 ) ( not ( = ?auto_29087 ?auto_29092 ) ) ( HAVE_IMAGE ?auto_29088 ?auto_29093 ) ( not ( = ?auto_29088 ?auto_29087 ) ) ( not ( = ?auto_29088 ?auto_29092 ) ) ( not ( = ?auto_29093 ?auto_29086 ) ) ( CALIBRATION_TARGET ?auto_29091 ?auto_29092 ) ( POINTING ?auto_29090 ?auto_29084 ) ( not ( = ?auto_29092 ?auto_29084 ) ) ( not ( = ?auto_29087 ?auto_29084 ) ) ( not ( = ?auto_29088 ?auto_29084 ) ) ( ON_BOARD ?auto_29089 ?auto_29090 ) ( POWER_ON ?auto_29089 ) ( not ( = ?auto_29091 ?auto_29089 ) ) ( HAVE_IMAGE ?auto_29084 ?auto_29085 ) ( not ( = ?auto_29085 ?auto_29086 ) ) ( not ( = ?auto_29085 ?auto_29093 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29088 ?auto_29093 ?auto_29087 ?auto_29086 )
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
      ?auto_29101 - INSTRUMENT
      ?auto_29100 - SATELLITE
      ?auto_29102 - DIRECTION
      ?auto_29098 - DIRECTION
      ?auto_29099 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29101 ?auto_29100 ) ( SUPPORTS ?auto_29101 ?auto_29095 ) ( not ( = ?auto_29094 ?auto_29102 ) ) ( HAVE_IMAGE ?auto_29097 ?auto_29096 ) ( not ( = ?auto_29097 ?auto_29094 ) ) ( not ( = ?auto_29097 ?auto_29102 ) ) ( not ( = ?auto_29096 ?auto_29095 ) ) ( CALIBRATION_TARGET ?auto_29101 ?auto_29102 ) ( POINTING ?auto_29100 ?auto_29098 ) ( not ( = ?auto_29102 ?auto_29098 ) ) ( not ( = ?auto_29094 ?auto_29098 ) ) ( not ( = ?auto_29097 ?auto_29098 ) ) ( ON_BOARD ?auto_29099 ?auto_29100 ) ( POWER_ON ?auto_29099 ) ( not ( = ?auto_29101 ?auto_29099 ) ) )
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
      ?auto_29110 - INSTRUMENT
      ?auto_29109 - SATELLITE
      ?auto_29111 - DIRECTION
      ?auto_29107 - DIRECTION
      ?auto_29112 - MODE
      ?auto_29108 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29110 ?auto_29109 ) ( SUPPORTS ?auto_29110 ?auto_29104 ) ( not ( = ?auto_29103 ?auto_29111 ) ) ( HAVE_IMAGE ?auto_29107 ?auto_29112 ) ( not ( = ?auto_29107 ?auto_29103 ) ) ( not ( = ?auto_29107 ?auto_29111 ) ) ( not ( = ?auto_29112 ?auto_29104 ) ) ( CALIBRATION_TARGET ?auto_29110 ?auto_29111 ) ( POINTING ?auto_29109 ?auto_29106 ) ( not ( = ?auto_29111 ?auto_29106 ) ) ( not ( = ?auto_29103 ?auto_29106 ) ) ( not ( = ?auto_29107 ?auto_29106 ) ) ( ON_BOARD ?auto_29108 ?auto_29109 ) ( POWER_ON ?auto_29108 ) ( not ( = ?auto_29110 ?auto_29108 ) ) ( HAVE_IMAGE ?auto_29106 ?auto_29105 ) ( not ( = ?auto_29104 ?auto_29105 ) ) ( not ( = ?auto_29105 ?auto_29112 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29107 ?auto_29112 ?auto_29103 ?auto_29104 )
      ( GET-2IMAGE-VERIFY ?auto_29103 ?auto_29104 ?auto_29106 ?auto_29105 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29124 - DIRECTION
      ?auto_29125 - MODE
      ?auto_29127 - DIRECTION
      ?auto_29126 - MODE
      ?auto_29129 - DIRECTION
      ?auto_29128 - MODE
    )
    :vars
    (
      ?auto_29133 - INSTRUMENT
      ?auto_29132 - SATELLITE
      ?auto_29134 - DIRECTION
      ?auto_29130 - DIRECTION
      ?auto_29131 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29133 ?auto_29132 ) ( SUPPORTS ?auto_29133 ?auto_29128 ) ( not ( = ?auto_29129 ?auto_29134 ) ) ( HAVE_IMAGE ?auto_29124 ?auto_29126 ) ( not ( = ?auto_29124 ?auto_29129 ) ) ( not ( = ?auto_29124 ?auto_29134 ) ) ( not ( = ?auto_29126 ?auto_29128 ) ) ( CALIBRATION_TARGET ?auto_29133 ?auto_29134 ) ( POINTING ?auto_29132 ?auto_29130 ) ( not ( = ?auto_29134 ?auto_29130 ) ) ( not ( = ?auto_29129 ?auto_29130 ) ) ( not ( = ?auto_29124 ?auto_29130 ) ) ( ON_BOARD ?auto_29131 ?auto_29132 ) ( POWER_ON ?auto_29131 ) ( not ( = ?auto_29133 ?auto_29131 ) ) ( HAVE_IMAGE ?auto_29124 ?auto_29125 ) ( HAVE_IMAGE ?auto_29127 ?auto_29126 ) ( not ( = ?auto_29124 ?auto_29127 ) ) ( not ( = ?auto_29125 ?auto_29126 ) ) ( not ( = ?auto_29125 ?auto_29128 ) ) ( not ( = ?auto_29127 ?auto_29129 ) ) ( not ( = ?auto_29127 ?auto_29134 ) ) ( not ( = ?auto_29127 ?auto_29130 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29124 ?auto_29126 ?auto_29129 ?auto_29128 )
      ( GET-3IMAGE-VERIFY ?auto_29124 ?auto_29125 ?auto_29127 ?auto_29126 ?auto_29129 ?auto_29128 ) )
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
      ?auto_29143 - INSTRUMENT
      ?auto_29142 - SATELLITE
      ?auto_29144 - DIRECTION
      ?auto_29141 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29143 ?auto_29142 ) ( SUPPORTS ?auto_29143 ?auto_29139 ) ( not ( = ?auto_29140 ?auto_29144 ) ) ( HAVE_IMAGE ?auto_29135 ?auto_29136 ) ( not ( = ?auto_29135 ?auto_29140 ) ) ( not ( = ?auto_29135 ?auto_29144 ) ) ( not ( = ?auto_29136 ?auto_29139 ) ) ( CALIBRATION_TARGET ?auto_29143 ?auto_29144 ) ( POINTING ?auto_29142 ?auto_29138 ) ( not ( = ?auto_29144 ?auto_29138 ) ) ( not ( = ?auto_29140 ?auto_29138 ) ) ( not ( = ?auto_29135 ?auto_29138 ) ) ( ON_BOARD ?auto_29141 ?auto_29142 ) ( POWER_ON ?auto_29141 ) ( not ( = ?auto_29143 ?auto_29141 ) ) ( HAVE_IMAGE ?auto_29138 ?auto_29137 ) ( not ( = ?auto_29136 ?auto_29137 ) ) ( not ( = ?auto_29137 ?auto_29139 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29135 ?auto_29136 ?auto_29140 ?auto_29139 )
      ( GET-3IMAGE-VERIFY ?auto_29135 ?auto_29136 ?auto_29138 ?auto_29137 ?auto_29140 ?auto_29139 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29145 - DIRECTION
      ?auto_29146 - MODE
      ?auto_29148 - DIRECTION
      ?auto_29147 - MODE
      ?auto_29150 - DIRECTION
      ?auto_29149 - MODE
    )
    :vars
    (
      ?auto_29154 - INSTRUMENT
      ?auto_29153 - SATELLITE
      ?auto_29155 - DIRECTION
      ?auto_29151 - DIRECTION
      ?auto_29152 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29154 ?auto_29153 ) ( SUPPORTS ?auto_29154 ?auto_29147 ) ( not ( = ?auto_29148 ?auto_29155 ) ) ( HAVE_IMAGE ?auto_29150 ?auto_29149 ) ( not ( = ?auto_29150 ?auto_29148 ) ) ( not ( = ?auto_29150 ?auto_29155 ) ) ( not ( = ?auto_29149 ?auto_29147 ) ) ( CALIBRATION_TARGET ?auto_29154 ?auto_29155 ) ( POINTING ?auto_29153 ?auto_29151 ) ( not ( = ?auto_29155 ?auto_29151 ) ) ( not ( = ?auto_29148 ?auto_29151 ) ) ( not ( = ?auto_29150 ?auto_29151 ) ) ( ON_BOARD ?auto_29152 ?auto_29153 ) ( POWER_ON ?auto_29152 ) ( not ( = ?auto_29154 ?auto_29152 ) ) ( HAVE_IMAGE ?auto_29145 ?auto_29146 ) ( not ( = ?auto_29145 ?auto_29148 ) ) ( not ( = ?auto_29145 ?auto_29150 ) ) ( not ( = ?auto_29145 ?auto_29155 ) ) ( not ( = ?auto_29145 ?auto_29151 ) ) ( not ( = ?auto_29146 ?auto_29147 ) ) ( not ( = ?auto_29146 ?auto_29149 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29150 ?auto_29149 ?auto_29148 ?auto_29147 )
      ( GET-3IMAGE-VERIFY ?auto_29145 ?auto_29146 ?auto_29148 ?auto_29147 ?auto_29150 ?auto_29149 ) )
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
      ?auto_29164 - INSTRUMENT
      ?auto_29163 - SATELLITE
      ?auto_29165 - DIRECTION
      ?auto_29162 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29164 ?auto_29163 ) ( SUPPORTS ?auto_29164 ?auto_29158 ) ( not ( = ?auto_29159 ?auto_29165 ) ) ( HAVE_IMAGE ?auto_29156 ?auto_29157 ) ( not ( = ?auto_29156 ?auto_29159 ) ) ( not ( = ?auto_29156 ?auto_29165 ) ) ( not ( = ?auto_29157 ?auto_29158 ) ) ( CALIBRATION_TARGET ?auto_29164 ?auto_29165 ) ( POINTING ?auto_29163 ?auto_29161 ) ( not ( = ?auto_29165 ?auto_29161 ) ) ( not ( = ?auto_29159 ?auto_29161 ) ) ( not ( = ?auto_29156 ?auto_29161 ) ) ( ON_BOARD ?auto_29162 ?auto_29163 ) ( POWER_ON ?auto_29162 ) ( not ( = ?auto_29164 ?auto_29162 ) ) ( HAVE_IMAGE ?auto_29161 ?auto_29160 ) ( not ( = ?auto_29157 ?auto_29160 ) ) ( not ( = ?auto_29158 ?auto_29160 ) ) )
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
      ?auto_29185 - INSTRUMENT
      ?auto_29184 - SATELLITE
      ?auto_29186 - DIRECTION
      ?auto_29183 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29185 ?auto_29184 ) ( SUPPORTS ?auto_29185 ?auto_29181 ) ( not ( = ?auto_29182 ?auto_29186 ) ) ( HAVE_IMAGE ?auto_29180 ?auto_29179 ) ( not ( = ?auto_29180 ?auto_29182 ) ) ( not ( = ?auto_29180 ?auto_29186 ) ) ( not ( = ?auto_29179 ?auto_29181 ) ) ( CALIBRATION_TARGET ?auto_29185 ?auto_29186 ) ( POINTING ?auto_29184 ?auto_29177 ) ( not ( = ?auto_29186 ?auto_29177 ) ) ( not ( = ?auto_29182 ?auto_29177 ) ) ( not ( = ?auto_29180 ?auto_29177 ) ) ( ON_BOARD ?auto_29183 ?auto_29184 ) ( POWER_ON ?auto_29183 ) ( not ( = ?auto_29185 ?auto_29183 ) ) ( HAVE_IMAGE ?auto_29177 ?auto_29178 ) ( not ( = ?auto_29178 ?auto_29179 ) ) ( not ( = ?auto_29178 ?auto_29181 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29180 ?auto_29179 ?auto_29182 ?auto_29181 )
      ( GET-3IMAGE-VERIFY ?auto_29177 ?auto_29178 ?auto_29180 ?auto_29179 ?auto_29182 ?auto_29181 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29187 - DIRECTION
      ?auto_29188 - MODE
      ?auto_29190 - DIRECTION
      ?auto_29189 - MODE
      ?auto_29192 - DIRECTION
      ?auto_29191 - MODE
    )
    :vars
    (
      ?auto_29196 - INSTRUMENT
      ?auto_29195 - SATELLITE
      ?auto_29197 - DIRECTION
      ?auto_29193 - DIRECTION
      ?auto_29198 - MODE
      ?auto_29194 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29196 ?auto_29195 ) ( SUPPORTS ?auto_29196 ?auto_29191 ) ( not ( = ?auto_29192 ?auto_29197 ) ) ( HAVE_IMAGE ?auto_29193 ?auto_29198 ) ( not ( = ?auto_29193 ?auto_29192 ) ) ( not ( = ?auto_29193 ?auto_29197 ) ) ( not ( = ?auto_29198 ?auto_29191 ) ) ( CALIBRATION_TARGET ?auto_29196 ?auto_29197 ) ( POINTING ?auto_29195 ?auto_29190 ) ( not ( = ?auto_29197 ?auto_29190 ) ) ( not ( = ?auto_29192 ?auto_29190 ) ) ( not ( = ?auto_29193 ?auto_29190 ) ) ( ON_BOARD ?auto_29194 ?auto_29195 ) ( POWER_ON ?auto_29194 ) ( not ( = ?auto_29196 ?auto_29194 ) ) ( HAVE_IMAGE ?auto_29187 ?auto_29188 ) ( HAVE_IMAGE ?auto_29190 ?auto_29189 ) ( not ( = ?auto_29187 ?auto_29190 ) ) ( not ( = ?auto_29187 ?auto_29192 ) ) ( not ( = ?auto_29187 ?auto_29197 ) ) ( not ( = ?auto_29187 ?auto_29193 ) ) ( not ( = ?auto_29188 ?auto_29189 ) ) ( not ( = ?auto_29188 ?auto_29191 ) ) ( not ( = ?auto_29188 ?auto_29198 ) ) ( not ( = ?auto_29189 ?auto_29191 ) ) ( not ( = ?auto_29189 ?auto_29198 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29193 ?auto_29198 ?auto_29192 ?auto_29191 )
      ( GET-3IMAGE-VERIFY ?auto_29187 ?auto_29188 ?auto_29190 ?auto_29189 ?auto_29192 ?auto_29191 ) )
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
      ?auto_29207 - INSTRUMENT
      ?auto_29206 - SATELLITE
      ?auto_29208 - DIRECTION
      ?auto_29205 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29207 ?auto_29206 ) ( SUPPORTS ?auto_29207 ?auto_29201 ) ( not ( = ?auto_29202 ?auto_29208 ) ) ( HAVE_IMAGE ?auto_29204 ?auto_29203 ) ( not ( = ?auto_29204 ?auto_29202 ) ) ( not ( = ?auto_29204 ?auto_29208 ) ) ( not ( = ?auto_29203 ?auto_29201 ) ) ( CALIBRATION_TARGET ?auto_29207 ?auto_29208 ) ( POINTING ?auto_29206 ?auto_29199 ) ( not ( = ?auto_29208 ?auto_29199 ) ) ( not ( = ?auto_29202 ?auto_29199 ) ) ( not ( = ?auto_29204 ?auto_29199 ) ) ( ON_BOARD ?auto_29205 ?auto_29206 ) ( POWER_ON ?auto_29205 ) ( not ( = ?auto_29207 ?auto_29205 ) ) ( HAVE_IMAGE ?auto_29199 ?auto_29200 ) ( not ( = ?auto_29200 ?auto_29201 ) ) ( not ( = ?auto_29200 ?auto_29203 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29204 ?auto_29203 ?auto_29202 ?auto_29201 )
      ( GET-3IMAGE-VERIFY ?auto_29199 ?auto_29200 ?auto_29202 ?auto_29201 ?auto_29204 ?auto_29203 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29209 - DIRECTION
      ?auto_29210 - MODE
      ?auto_29212 - DIRECTION
      ?auto_29211 - MODE
      ?auto_29214 - DIRECTION
      ?auto_29213 - MODE
    )
    :vars
    (
      ?auto_29218 - INSTRUMENT
      ?auto_29217 - SATELLITE
      ?auto_29219 - DIRECTION
      ?auto_29215 - DIRECTION
      ?auto_29220 - MODE
      ?auto_29216 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29218 ?auto_29217 ) ( SUPPORTS ?auto_29218 ?auto_29211 ) ( not ( = ?auto_29212 ?auto_29219 ) ) ( HAVE_IMAGE ?auto_29215 ?auto_29220 ) ( not ( = ?auto_29215 ?auto_29212 ) ) ( not ( = ?auto_29215 ?auto_29219 ) ) ( not ( = ?auto_29220 ?auto_29211 ) ) ( CALIBRATION_TARGET ?auto_29218 ?auto_29219 ) ( POINTING ?auto_29217 ?auto_29214 ) ( not ( = ?auto_29219 ?auto_29214 ) ) ( not ( = ?auto_29212 ?auto_29214 ) ) ( not ( = ?auto_29215 ?auto_29214 ) ) ( ON_BOARD ?auto_29216 ?auto_29217 ) ( POWER_ON ?auto_29216 ) ( not ( = ?auto_29218 ?auto_29216 ) ) ( HAVE_IMAGE ?auto_29209 ?auto_29210 ) ( HAVE_IMAGE ?auto_29214 ?auto_29213 ) ( not ( = ?auto_29209 ?auto_29212 ) ) ( not ( = ?auto_29209 ?auto_29214 ) ) ( not ( = ?auto_29209 ?auto_29219 ) ) ( not ( = ?auto_29209 ?auto_29215 ) ) ( not ( = ?auto_29210 ?auto_29211 ) ) ( not ( = ?auto_29210 ?auto_29213 ) ) ( not ( = ?auto_29210 ?auto_29220 ) ) ( not ( = ?auto_29211 ?auto_29213 ) ) ( not ( = ?auto_29213 ?auto_29220 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29215 ?auto_29220 ?auto_29212 ?auto_29211 )
      ( GET-3IMAGE-VERIFY ?auto_29209 ?auto_29210 ?auto_29212 ?auto_29211 ?auto_29214 ?auto_29213 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29233 - DIRECTION
      ?auto_29234 - MODE
      ?auto_29236 - DIRECTION
      ?auto_29235 - MODE
      ?auto_29238 - DIRECTION
      ?auto_29237 - MODE
    )
    :vars
    (
      ?auto_29242 - INSTRUMENT
      ?auto_29241 - SATELLITE
      ?auto_29243 - DIRECTION
      ?auto_29239 - DIRECTION
      ?auto_29240 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29242 ?auto_29241 ) ( SUPPORTS ?auto_29242 ?auto_29234 ) ( not ( = ?auto_29233 ?auto_29243 ) ) ( HAVE_IMAGE ?auto_29236 ?auto_29235 ) ( not ( = ?auto_29236 ?auto_29233 ) ) ( not ( = ?auto_29236 ?auto_29243 ) ) ( not ( = ?auto_29235 ?auto_29234 ) ) ( CALIBRATION_TARGET ?auto_29242 ?auto_29243 ) ( POINTING ?auto_29241 ?auto_29239 ) ( not ( = ?auto_29243 ?auto_29239 ) ) ( not ( = ?auto_29233 ?auto_29239 ) ) ( not ( = ?auto_29236 ?auto_29239 ) ) ( ON_BOARD ?auto_29240 ?auto_29241 ) ( POWER_ON ?auto_29240 ) ( not ( = ?auto_29242 ?auto_29240 ) ) ( HAVE_IMAGE ?auto_29238 ?auto_29237 ) ( not ( = ?auto_29233 ?auto_29238 ) ) ( not ( = ?auto_29234 ?auto_29237 ) ) ( not ( = ?auto_29236 ?auto_29238 ) ) ( not ( = ?auto_29235 ?auto_29237 ) ) ( not ( = ?auto_29238 ?auto_29243 ) ) ( not ( = ?auto_29238 ?auto_29239 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29236 ?auto_29235 ?auto_29233 ?auto_29234 )
      ( GET-3IMAGE-VERIFY ?auto_29233 ?auto_29234 ?auto_29236 ?auto_29235 ?auto_29238 ?auto_29237 ) )
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
      ?auto_29252 - INSTRUMENT
      ?auto_29251 - SATELLITE
      ?auto_29253 - DIRECTION
      ?auto_29250 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29252 ?auto_29251 ) ( SUPPORTS ?auto_29252 ?auto_29245 ) ( not ( = ?auto_29244 ?auto_29253 ) ) ( HAVE_IMAGE ?auto_29247 ?auto_29246 ) ( not ( = ?auto_29247 ?auto_29244 ) ) ( not ( = ?auto_29247 ?auto_29253 ) ) ( not ( = ?auto_29246 ?auto_29245 ) ) ( CALIBRATION_TARGET ?auto_29252 ?auto_29253 ) ( POINTING ?auto_29251 ?auto_29249 ) ( not ( = ?auto_29253 ?auto_29249 ) ) ( not ( = ?auto_29244 ?auto_29249 ) ) ( not ( = ?auto_29247 ?auto_29249 ) ) ( ON_BOARD ?auto_29250 ?auto_29251 ) ( POWER_ON ?auto_29250 ) ( not ( = ?auto_29252 ?auto_29250 ) ) ( HAVE_IMAGE ?auto_29249 ?auto_29248 ) ( not ( = ?auto_29245 ?auto_29248 ) ) ( not ( = ?auto_29246 ?auto_29248 ) ) )
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
      ?auto_29273 - INSTRUMENT
      ?auto_29272 - SATELLITE
      ?auto_29274 - DIRECTION
      ?auto_29271 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29273 ?auto_29272 ) ( SUPPORTS ?auto_29273 ?auto_29266 ) ( not ( = ?auto_29265 ?auto_29274 ) ) ( HAVE_IMAGE ?auto_29270 ?auto_29269 ) ( not ( = ?auto_29270 ?auto_29265 ) ) ( not ( = ?auto_29270 ?auto_29274 ) ) ( not ( = ?auto_29269 ?auto_29266 ) ) ( CALIBRATION_TARGET ?auto_29273 ?auto_29274 ) ( POINTING ?auto_29272 ?auto_29268 ) ( not ( = ?auto_29274 ?auto_29268 ) ) ( not ( = ?auto_29265 ?auto_29268 ) ) ( not ( = ?auto_29270 ?auto_29268 ) ) ( ON_BOARD ?auto_29271 ?auto_29272 ) ( POWER_ON ?auto_29271 ) ( not ( = ?auto_29273 ?auto_29271 ) ) ( HAVE_IMAGE ?auto_29268 ?auto_29267 ) ( not ( = ?auto_29266 ?auto_29267 ) ) ( not ( = ?auto_29267 ?auto_29269 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29270 ?auto_29269 ?auto_29265 ?auto_29266 )
      ( GET-3IMAGE-VERIFY ?auto_29265 ?auto_29266 ?auto_29268 ?auto_29267 ?auto_29270 ?auto_29269 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29275 - DIRECTION
      ?auto_29276 - MODE
      ?auto_29278 - DIRECTION
      ?auto_29277 - MODE
      ?auto_29280 - DIRECTION
      ?auto_29279 - MODE
    )
    :vars
    (
      ?auto_29284 - INSTRUMENT
      ?auto_29283 - SATELLITE
      ?auto_29285 - DIRECTION
      ?auto_29281 - DIRECTION
      ?auto_29286 - MODE
      ?auto_29282 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29284 ?auto_29283 ) ( SUPPORTS ?auto_29284 ?auto_29276 ) ( not ( = ?auto_29275 ?auto_29285 ) ) ( HAVE_IMAGE ?auto_29281 ?auto_29286 ) ( not ( = ?auto_29281 ?auto_29275 ) ) ( not ( = ?auto_29281 ?auto_29285 ) ) ( not ( = ?auto_29286 ?auto_29276 ) ) ( CALIBRATION_TARGET ?auto_29284 ?auto_29285 ) ( POINTING ?auto_29283 ?auto_29280 ) ( not ( = ?auto_29285 ?auto_29280 ) ) ( not ( = ?auto_29275 ?auto_29280 ) ) ( not ( = ?auto_29281 ?auto_29280 ) ) ( ON_BOARD ?auto_29282 ?auto_29283 ) ( POWER_ON ?auto_29282 ) ( not ( = ?auto_29284 ?auto_29282 ) ) ( HAVE_IMAGE ?auto_29278 ?auto_29277 ) ( HAVE_IMAGE ?auto_29280 ?auto_29279 ) ( not ( = ?auto_29275 ?auto_29278 ) ) ( not ( = ?auto_29276 ?auto_29277 ) ) ( not ( = ?auto_29276 ?auto_29279 ) ) ( not ( = ?auto_29278 ?auto_29280 ) ) ( not ( = ?auto_29278 ?auto_29285 ) ) ( not ( = ?auto_29278 ?auto_29281 ) ) ( not ( = ?auto_29277 ?auto_29279 ) ) ( not ( = ?auto_29277 ?auto_29286 ) ) ( not ( = ?auto_29279 ?auto_29286 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29281 ?auto_29286 ?auto_29275 ?auto_29276 )
      ( GET-3IMAGE-VERIFY ?auto_29275 ?auto_29276 ?auto_29278 ?auto_29277 ?auto_29280 ?auto_29279 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_29335 - DIRECTION
      ?auto_29336 - MODE
    )
    :vars
    (
      ?auto_29341 - INSTRUMENT
      ?auto_29340 - SATELLITE
      ?auto_29342 - DIRECTION
      ?auto_29337 - DIRECTION
      ?auto_29343 - MODE
      ?auto_29338 - DIRECTION
      ?auto_29339 - INSTRUMENT
      ?auto_29344 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29341 ?auto_29340 ) ( SUPPORTS ?auto_29341 ?auto_29336 ) ( not ( = ?auto_29335 ?auto_29342 ) ) ( HAVE_IMAGE ?auto_29337 ?auto_29343 ) ( not ( = ?auto_29337 ?auto_29335 ) ) ( not ( = ?auto_29337 ?auto_29342 ) ) ( not ( = ?auto_29343 ?auto_29336 ) ) ( CALIBRATION_TARGET ?auto_29341 ?auto_29342 ) ( POINTING ?auto_29340 ?auto_29338 ) ( not ( = ?auto_29342 ?auto_29338 ) ) ( not ( = ?auto_29335 ?auto_29338 ) ) ( not ( = ?auto_29337 ?auto_29338 ) ) ( ON_BOARD ?auto_29339 ?auto_29340 ) ( POWER_ON ?auto_29339 ) ( not ( = ?auto_29341 ?auto_29339 ) ) ( CALIBRATED ?auto_29339 ) ( SUPPORTS ?auto_29339 ?auto_29344 ) ( not ( = ?auto_29343 ?auto_29344 ) ) ( not ( = ?auto_29336 ?auto_29344 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29337 ?auto_29343 ?auto_29338 ?auto_29344 )
      ( GET-2IMAGE ?auto_29337 ?auto_29343 ?auto_29335 ?auto_29336 )
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
      ?auto_29353 - INSTRUMENT
      ?auto_29350 - SATELLITE
      ?auto_29349 - DIRECTION
      ?auto_29351 - DIRECTION
      ?auto_29354 - INSTRUMENT
      ?auto_29352 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29353 ?auto_29350 ) ( SUPPORTS ?auto_29353 ?auto_29347 ) ( not ( = ?auto_29348 ?auto_29349 ) ) ( HAVE_IMAGE ?auto_29345 ?auto_29346 ) ( not ( = ?auto_29345 ?auto_29348 ) ) ( not ( = ?auto_29345 ?auto_29349 ) ) ( not ( = ?auto_29346 ?auto_29347 ) ) ( CALIBRATION_TARGET ?auto_29353 ?auto_29349 ) ( POINTING ?auto_29350 ?auto_29351 ) ( not ( = ?auto_29349 ?auto_29351 ) ) ( not ( = ?auto_29348 ?auto_29351 ) ) ( not ( = ?auto_29345 ?auto_29351 ) ) ( ON_BOARD ?auto_29354 ?auto_29350 ) ( POWER_ON ?auto_29354 ) ( not ( = ?auto_29353 ?auto_29354 ) ) ( CALIBRATED ?auto_29354 ) ( SUPPORTS ?auto_29354 ?auto_29352 ) ( not ( = ?auto_29346 ?auto_29352 ) ) ( not ( = ?auto_29347 ?auto_29352 ) ) )
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
      ?auto_29364 - INSTRUMENT
      ?auto_29360 - SATELLITE
      ?auto_29361 - DIRECTION
      ?auto_29359 - DIRECTION
      ?auto_29363 - MODE
      ?auto_29362 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29364 ?auto_29360 ) ( SUPPORTS ?auto_29364 ?auto_29357 ) ( not ( = ?auto_29358 ?auto_29361 ) ) ( HAVE_IMAGE ?auto_29359 ?auto_29363 ) ( not ( = ?auto_29359 ?auto_29358 ) ) ( not ( = ?auto_29359 ?auto_29361 ) ) ( not ( = ?auto_29363 ?auto_29357 ) ) ( CALIBRATION_TARGET ?auto_29364 ?auto_29361 ) ( POINTING ?auto_29360 ?auto_29355 ) ( not ( = ?auto_29361 ?auto_29355 ) ) ( not ( = ?auto_29358 ?auto_29355 ) ) ( not ( = ?auto_29359 ?auto_29355 ) ) ( ON_BOARD ?auto_29362 ?auto_29360 ) ( POWER_ON ?auto_29362 ) ( not ( = ?auto_29364 ?auto_29362 ) ) ( CALIBRATED ?auto_29362 ) ( SUPPORTS ?auto_29362 ?auto_29356 ) ( not ( = ?auto_29363 ?auto_29356 ) ) ( not ( = ?auto_29357 ?auto_29356 ) ) )
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
      ?auto_29374 - INSTRUMENT
      ?auto_29370 - SATELLITE
      ?auto_29371 - DIRECTION
      ?auto_29373 - DIRECTION
      ?auto_29372 - INSTRUMENT
      ?auto_29369 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29374 ?auto_29370 ) ( SUPPORTS ?auto_29374 ?auto_29366 ) ( not ( = ?auto_29365 ?auto_29371 ) ) ( HAVE_IMAGE ?auto_29368 ?auto_29367 ) ( not ( = ?auto_29368 ?auto_29365 ) ) ( not ( = ?auto_29368 ?auto_29371 ) ) ( not ( = ?auto_29367 ?auto_29366 ) ) ( CALIBRATION_TARGET ?auto_29374 ?auto_29371 ) ( POINTING ?auto_29370 ?auto_29373 ) ( not ( = ?auto_29371 ?auto_29373 ) ) ( not ( = ?auto_29365 ?auto_29373 ) ) ( not ( = ?auto_29368 ?auto_29373 ) ) ( ON_BOARD ?auto_29372 ?auto_29370 ) ( POWER_ON ?auto_29372 ) ( not ( = ?auto_29374 ?auto_29372 ) ) ( CALIBRATED ?auto_29372 ) ( SUPPORTS ?auto_29372 ?auto_29369 ) ( not ( = ?auto_29367 ?auto_29369 ) ) ( not ( = ?auto_29366 ?auto_29369 ) ) )
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
      ?auto_29384 - INSTRUMENT
      ?auto_29380 - SATELLITE
      ?auto_29381 - DIRECTION
      ?auto_29379 - DIRECTION
      ?auto_29383 - MODE
      ?auto_29382 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29384 ?auto_29380 ) ( SUPPORTS ?auto_29384 ?auto_29376 ) ( not ( = ?auto_29375 ?auto_29381 ) ) ( HAVE_IMAGE ?auto_29379 ?auto_29383 ) ( not ( = ?auto_29379 ?auto_29375 ) ) ( not ( = ?auto_29379 ?auto_29381 ) ) ( not ( = ?auto_29383 ?auto_29376 ) ) ( CALIBRATION_TARGET ?auto_29384 ?auto_29381 ) ( POINTING ?auto_29380 ?auto_29378 ) ( not ( = ?auto_29381 ?auto_29378 ) ) ( not ( = ?auto_29375 ?auto_29378 ) ) ( not ( = ?auto_29379 ?auto_29378 ) ) ( ON_BOARD ?auto_29382 ?auto_29380 ) ( POWER_ON ?auto_29382 ) ( not ( = ?auto_29384 ?auto_29382 ) ) ( CALIBRATED ?auto_29382 ) ( SUPPORTS ?auto_29382 ?auto_29377 ) ( not ( = ?auto_29383 ?auto_29377 ) ) ( not ( = ?auto_29376 ?auto_29377 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29379 ?auto_29383 ?auto_29375 ?auto_29376 )
      ( GET-2IMAGE-VERIFY ?auto_29375 ?auto_29376 ?auto_29378 ?auto_29377 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29397 - DIRECTION
      ?auto_29398 - MODE
      ?auto_29400 - DIRECTION
      ?auto_29399 - MODE
      ?auto_29402 - DIRECTION
      ?auto_29401 - MODE
    )
    :vars
    (
      ?auto_29408 - INSTRUMENT
      ?auto_29404 - SATELLITE
      ?auto_29405 - DIRECTION
      ?auto_29407 - DIRECTION
      ?auto_29406 - INSTRUMENT
      ?auto_29403 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29408 ?auto_29404 ) ( SUPPORTS ?auto_29408 ?auto_29401 ) ( not ( = ?auto_29402 ?auto_29405 ) ) ( HAVE_IMAGE ?auto_29400 ?auto_29399 ) ( not ( = ?auto_29400 ?auto_29402 ) ) ( not ( = ?auto_29400 ?auto_29405 ) ) ( not ( = ?auto_29399 ?auto_29401 ) ) ( CALIBRATION_TARGET ?auto_29408 ?auto_29405 ) ( POINTING ?auto_29404 ?auto_29407 ) ( not ( = ?auto_29405 ?auto_29407 ) ) ( not ( = ?auto_29402 ?auto_29407 ) ) ( not ( = ?auto_29400 ?auto_29407 ) ) ( ON_BOARD ?auto_29406 ?auto_29404 ) ( POWER_ON ?auto_29406 ) ( not ( = ?auto_29408 ?auto_29406 ) ) ( CALIBRATED ?auto_29406 ) ( SUPPORTS ?auto_29406 ?auto_29403 ) ( not ( = ?auto_29399 ?auto_29403 ) ) ( not ( = ?auto_29401 ?auto_29403 ) ) ( HAVE_IMAGE ?auto_29397 ?auto_29398 ) ( not ( = ?auto_29397 ?auto_29400 ) ) ( not ( = ?auto_29397 ?auto_29402 ) ) ( not ( = ?auto_29397 ?auto_29405 ) ) ( not ( = ?auto_29397 ?auto_29407 ) ) ( not ( = ?auto_29398 ?auto_29399 ) ) ( not ( = ?auto_29398 ?auto_29401 ) ) ( not ( = ?auto_29398 ?auto_29403 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29400 ?auto_29399 ?auto_29402 ?auto_29401 )
      ( GET-3IMAGE-VERIFY ?auto_29397 ?auto_29398 ?auto_29400 ?auto_29399 ?auto_29402 ?auto_29401 ) )
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
      ?auto_29418 - INSTRUMENT
      ?auto_29415 - SATELLITE
      ?auto_29416 - DIRECTION
      ?auto_29417 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29418 ?auto_29415 ) ( SUPPORTS ?auto_29418 ?auto_29413 ) ( not ( = ?auto_29414 ?auto_29416 ) ) ( HAVE_IMAGE ?auto_29409 ?auto_29410 ) ( not ( = ?auto_29409 ?auto_29414 ) ) ( not ( = ?auto_29409 ?auto_29416 ) ) ( not ( = ?auto_29410 ?auto_29413 ) ) ( CALIBRATION_TARGET ?auto_29418 ?auto_29416 ) ( POINTING ?auto_29415 ?auto_29412 ) ( not ( = ?auto_29416 ?auto_29412 ) ) ( not ( = ?auto_29414 ?auto_29412 ) ) ( not ( = ?auto_29409 ?auto_29412 ) ) ( ON_BOARD ?auto_29417 ?auto_29415 ) ( POWER_ON ?auto_29417 ) ( not ( = ?auto_29418 ?auto_29417 ) ) ( CALIBRATED ?auto_29417 ) ( SUPPORTS ?auto_29417 ?auto_29411 ) ( not ( = ?auto_29410 ?auto_29411 ) ) ( not ( = ?auto_29413 ?auto_29411 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29409 ?auto_29410 ?auto_29414 ?auto_29413 )
      ( GET-3IMAGE-VERIFY ?auto_29409 ?auto_29410 ?auto_29412 ?auto_29411 ?auto_29414 ?auto_29413 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29419 - DIRECTION
      ?auto_29420 - MODE
      ?auto_29422 - DIRECTION
      ?auto_29421 - MODE
      ?auto_29424 - DIRECTION
      ?auto_29423 - MODE
    )
    :vars
    (
      ?auto_29430 - INSTRUMENT
      ?auto_29426 - SATELLITE
      ?auto_29427 - DIRECTION
      ?auto_29429 - DIRECTION
      ?auto_29428 - INSTRUMENT
      ?auto_29425 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29430 ?auto_29426 ) ( SUPPORTS ?auto_29430 ?auto_29421 ) ( not ( = ?auto_29422 ?auto_29427 ) ) ( HAVE_IMAGE ?auto_29424 ?auto_29423 ) ( not ( = ?auto_29424 ?auto_29422 ) ) ( not ( = ?auto_29424 ?auto_29427 ) ) ( not ( = ?auto_29423 ?auto_29421 ) ) ( CALIBRATION_TARGET ?auto_29430 ?auto_29427 ) ( POINTING ?auto_29426 ?auto_29429 ) ( not ( = ?auto_29427 ?auto_29429 ) ) ( not ( = ?auto_29422 ?auto_29429 ) ) ( not ( = ?auto_29424 ?auto_29429 ) ) ( ON_BOARD ?auto_29428 ?auto_29426 ) ( POWER_ON ?auto_29428 ) ( not ( = ?auto_29430 ?auto_29428 ) ) ( CALIBRATED ?auto_29428 ) ( SUPPORTS ?auto_29428 ?auto_29425 ) ( not ( = ?auto_29423 ?auto_29425 ) ) ( not ( = ?auto_29421 ?auto_29425 ) ) ( HAVE_IMAGE ?auto_29419 ?auto_29420 ) ( not ( = ?auto_29419 ?auto_29422 ) ) ( not ( = ?auto_29419 ?auto_29424 ) ) ( not ( = ?auto_29419 ?auto_29427 ) ) ( not ( = ?auto_29419 ?auto_29429 ) ) ( not ( = ?auto_29420 ?auto_29421 ) ) ( not ( = ?auto_29420 ?auto_29423 ) ) ( not ( = ?auto_29420 ?auto_29425 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29424 ?auto_29423 ?auto_29422 ?auto_29421 )
      ( GET-3IMAGE-VERIFY ?auto_29419 ?auto_29420 ?auto_29422 ?auto_29421 ?auto_29424 ?auto_29423 ) )
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
      ?auto_29440 - INSTRUMENT
      ?auto_29437 - SATELLITE
      ?auto_29438 - DIRECTION
      ?auto_29439 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29440 ?auto_29437 ) ( SUPPORTS ?auto_29440 ?auto_29433 ) ( not ( = ?auto_29434 ?auto_29438 ) ) ( HAVE_IMAGE ?auto_29431 ?auto_29432 ) ( not ( = ?auto_29431 ?auto_29434 ) ) ( not ( = ?auto_29431 ?auto_29438 ) ) ( not ( = ?auto_29432 ?auto_29433 ) ) ( CALIBRATION_TARGET ?auto_29440 ?auto_29438 ) ( POINTING ?auto_29437 ?auto_29436 ) ( not ( = ?auto_29438 ?auto_29436 ) ) ( not ( = ?auto_29434 ?auto_29436 ) ) ( not ( = ?auto_29431 ?auto_29436 ) ) ( ON_BOARD ?auto_29439 ?auto_29437 ) ( POWER_ON ?auto_29439 ) ( not ( = ?auto_29440 ?auto_29439 ) ) ( CALIBRATED ?auto_29439 ) ( SUPPORTS ?auto_29439 ?auto_29435 ) ( not ( = ?auto_29432 ?auto_29435 ) ) ( not ( = ?auto_29433 ?auto_29435 ) ) )
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
      ?auto_29462 - INSTRUMENT
      ?auto_29459 - SATELLITE
      ?auto_29460 - DIRECTION
      ?auto_29461 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29462 ?auto_29459 ) ( SUPPORTS ?auto_29462 ?auto_29457 ) ( not ( = ?auto_29458 ?auto_29460 ) ) ( HAVE_IMAGE ?auto_29456 ?auto_29455 ) ( not ( = ?auto_29456 ?auto_29458 ) ) ( not ( = ?auto_29456 ?auto_29460 ) ) ( not ( = ?auto_29455 ?auto_29457 ) ) ( CALIBRATION_TARGET ?auto_29462 ?auto_29460 ) ( POINTING ?auto_29459 ?auto_29453 ) ( not ( = ?auto_29460 ?auto_29453 ) ) ( not ( = ?auto_29458 ?auto_29453 ) ) ( not ( = ?auto_29456 ?auto_29453 ) ) ( ON_BOARD ?auto_29461 ?auto_29459 ) ( POWER_ON ?auto_29461 ) ( not ( = ?auto_29462 ?auto_29461 ) ) ( CALIBRATED ?auto_29461 ) ( SUPPORTS ?auto_29461 ?auto_29454 ) ( not ( = ?auto_29455 ?auto_29454 ) ) ( not ( = ?auto_29457 ?auto_29454 ) ) )
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
      ?auto_29484 - INSTRUMENT
      ?auto_29481 - SATELLITE
      ?auto_29482 - DIRECTION
      ?auto_29483 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29484 ?auto_29481 ) ( SUPPORTS ?auto_29484 ?auto_29477 ) ( not ( = ?auto_29478 ?auto_29482 ) ) ( HAVE_IMAGE ?auto_29480 ?auto_29479 ) ( not ( = ?auto_29480 ?auto_29478 ) ) ( not ( = ?auto_29480 ?auto_29482 ) ) ( not ( = ?auto_29479 ?auto_29477 ) ) ( CALIBRATION_TARGET ?auto_29484 ?auto_29482 ) ( POINTING ?auto_29481 ?auto_29475 ) ( not ( = ?auto_29482 ?auto_29475 ) ) ( not ( = ?auto_29478 ?auto_29475 ) ) ( not ( = ?auto_29480 ?auto_29475 ) ) ( ON_BOARD ?auto_29483 ?auto_29481 ) ( POWER_ON ?auto_29483 ) ( not ( = ?auto_29484 ?auto_29483 ) ) ( CALIBRATED ?auto_29483 ) ( SUPPORTS ?auto_29483 ?auto_29476 ) ( not ( = ?auto_29479 ?auto_29476 ) ) ( not ( = ?auto_29477 ?auto_29476 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29480 ?auto_29479 ?auto_29478 ?auto_29477 )
      ( GET-3IMAGE-VERIFY ?auto_29475 ?auto_29476 ?auto_29478 ?auto_29477 ?auto_29480 ?auto_29479 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29509 - DIRECTION
      ?auto_29510 - MODE
      ?auto_29512 - DIRECTION
      ?auto_29511 - MODE
      ?auto_29514 - DIRECTION
      ?auto_29513 - MODE
    )
    :vars
    (
      ?auto_29520 - INSTRUMENT
      ?auto_29516 - SATELLITE
      ?auto_29517 - DIRECTION
      ?auto_29519 - DIRECTION
      ?auto_29518 - INSTRUMENT
      ?auto_29515 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29520 ?auto_29516 ) ( SUPPORTS ?auto_29520 ?auto_29510 ) ( not ( = ?auto_29509 ?auto_29517 ) ) ( HAVE_IMAGE ?auto_29514 ?auto_29513 ) ( not ( = ?auto_29514 ?auto_29509 ) ) ( not ( = ?auto_29514 ?auto_29517 ) ) ( not ( = ?auto_29513 ?auto_29510 ) ) ( CALIBRATION_TARGET ?auto_29520 ?auto_29517 ) ( POINTING ?auto_29516 ?auto_29519 ) ( not ( = ?auto_29517 ?auto_29519 ) ) ( not ( = ?auto_29509 ?auto_29519 ) ) ( not ( = ?auto_29514 ?auto_29519 ) ) ( ON_BOARD ?auto_29518 ?auto_29516 ) ( POWER_ON ?auto_29518 ) ( not ( = ?auto_29520 ?auto_29518 ) ) ( CALIBRATED ?auto_29518 ) ( SUPPORTS ?auto_29518 ?auto_29515 ) ( not ( = ?auto_29513 ?auto_29515 ) ) ( not ( = ?auto_29510 ?auto_29515 ) ) ( HAVE_IMAGE ?auto_29512 ?auto_29511 ) ( not ( = ?auto_29509 ?auto_29512 ) ) ( not ( = ?auto_29510 ?auto_29511 ) ) ( not ( = ?auto_29512 ?auto_29514 ) ) ( not ( = ?auto_29512 ?auto_29517 ) ) ( not ( = ?auto_29512 ?auto_29519 ) ) ( not ( = ?auto_29511 ?auto_29513 ) ) ( not ( = ?auto_29511 ?auto_29515 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29514 ?auto_29513 ?auto_29509 ?auto_29510 )
      ( GET-3IMAGE-VERIFY ?auto_29509 ?auto_29510 ?auto_29512 ?auto_29511 ?auto_29514 ?auto_29513 ) )
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
      ?auto_29530 - INSTRUMENT
      ?auto_29527 - SATELLITE
      ?auto_29528 - DIRECTION
      ?auto_29529 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29530 ?auto_29527 ) ( SUPPORTS ?auto_29530 ?auto_29522 ) ( not ( = ?auto_29521 ?auto_29528 ) ) ( HAVE_IMAGE ?auto_29524 ?auto_29523 ) ( not ( = ?auto_29524 ?auto_29521 ) ) ( not ( = ?auto_29524 ?auto_29528 ) ) ( not ( = ?auto_29523 ?auto_29522 ) ) ( CALIBRATION_TARGET ?auto_29530 ?auto_29528 ) ( POINTING ?auto_29527 ?auto_29526 ) ( not ( = ?auto_29528 ?auto_29526 ) ) ( not ( = ?auto_29521 ?auto_29526 ) ) ( not ( = ?auto_29524 ?auto_29526 ) ) ( ON_BOARD ?auto_29529 ?auto_29527 ) ( POWER_ON ?auto_29529 ) ( not ( = ?auto_29530 ?auto_29529 ) ) ( CALIBRATED ?auto_29529 ) ( SUPPORTS ?auto_29529 ?auto_29525 ) ( not ( = ?auto_29523 ?auto_29525 ) ) ( not ( = ?auto_29522 ?auto_29525 ) ) )
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
      ?auto_29552 - INSTRUMENT
      ?auto_29549 - SATELLITE
      ?auto_29550 - DIRECTION
      ?auto_29551 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29552 ?auto_29549 ) ( SUPPORTS ?auto_29552 ?auto_29544 ) ( not ( = ?auto_29543 ?auto_29550 ) ) ( HAVE_IMAGE ?auto_29548 ?auto_29547 ) ( not ( = ?auto_29548 ?auto_29543 ) ) ( not ( = ?auto_29548 ?auto_29550 ) ) ( not ( = ?auto_29547 ?auto_29544 ) ) ( CALIBRATION_TARGET ?auto_29552 ?auto_29550 ) ( POINTING ?auto_29549 ?auto_29546 ) ( not ( = ?auto_29550 ?auto_29546 ) ) ( not ( = ?auto_29543 ?auto_29546 ) ) ( not ( = ?auto_29548 ?auto_29546 ) ) ( ON_BOARD ?auto_29551 ?auto_29549 ) ( POWER_ON ?auto_29551 ) ( not ( = ?auto_29552 ?auto_29551 ) ) ( CALIBRATED ?auto_29551 ) ( SUPPORTS ?auto_29551 ?auto_29545 ) ( not ( = ?auto_29547 ?auto_29545 ) ) ( not ( = ?auto_29544 ?auto_29545 ) ) )
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
      ?auto_29624 - INSTRUMENT
      ?auto_29619 - SATELLITE
      ?auto_29620 - DIRECTION
      ?auto_29617 - DIRECTION
      ?auto_29622 - MODE
      ?auto_29623 - DIRECTION
      ?auto_29621 - INSTRUMENT
      ?auto_29618 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29624 ?auto_29619 ) ( SUPPORTS ?auto_29624 ?auto_29616 ) ( not ( = ?auto_29615 ?auto_29620 ) ) ( HAVE_IMAGE ?auto_29617 ?auto_29622 ) ( not ( = ?auto_29617 ?auto_29615 ) ) ( not ( = ?auto_29617 ?auto_29620 ) ) ( not ( = ?auto_29622 ?auto_29616 ) ) ( CALIBRATION_TARGET ?auto_29624 ?auto_29620 ) ( not ( = ?auto_29620 ?auto_29623 ) ) ( not ( = ?auto_29615 ?auto_29623 ) ) ( not ( = ?auto_29617 ?auto_29623 ) ) ( ON_BOARD ?auto_29621 ?auto_29619 ) ( POWER_ON ?auto_29621 ) ( not ( = ?auto_29624 ?auto_29621 ) ) ( CALIBRATED ?auto_29621 ) ( SUPPORTS ?auto_29621 ?auto_29618 ) ( not ( = ?auto_29622 ?auto_29618 ) ) ( not ( = ?auto_29616 ?auto_29618 ) ) ( POINTING ?auto_29619 ?auto_29620 ) )
    :subtasks
    ( ( !TURN_TO ?auto_29619 ?auto_29623 ?auto_29620 )
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
      ?auto_29630 - INSTRUMENT
      ?auto_29633 - SATELLITE
      ?auto_29631 - DIRECTION
      ?auto_29629 - DIRECTION
      ?auto_29632 - INSTRUMENT
      ?auto_29634 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29630 ?auto_29633 ) ( SUPPORTS ?auto_29630 ?auto_29627 ) ( not ( = ?auto_29628 ?auto_29631 ) ) ( HAVE_IMAGE ?auto_29625 ?auto_29626 ) ( not ( = ?auto_29625 ?auto_29628 ) ) ( not ( = ?auto_29625 ?auto_29631 ) ) ( not ( = ?auto_29626 ?auto_29627 ) ) ( CALIBRATION_TARGET ?auto_29630 ?auto_29631 ) ( not ( = ?auto_29631 ?auto_29629 ) ) ( not ( = ?auto_29628 ?auto_29629 ) ) ( not ( = ?auto_29625 ?auto_29629 ) ) ( ON_BOARD ?auto_29632 ?auto_29633 ) ( POWER_ON ?auto_29632 ) ( not ( = ?auto_29630 ?auto_29632 ) ) ( CALIBRATED ?auto_29632 ) ( SUPPORTS ?auto_29632 ?auto_29634 ) ( not ( = ?auto_29626 ?auto_29634 ) ) ( not ( = ?auto_29627 ?auto_29634 ) ) ( POINTING ?auto_29633 ?auto_29631 ) )
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
      ?auto_29643 - INSTRUMENT
      ?auto_29642 - SATELLITE
      ?auto_29641 - DIRECTION
      ?auto_29640 - DIRECTION
      ?auto_29639 - MODE
      ?auto_29644 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29643 ?auto_29642 ) ( SUPPORTS ?auto_29643 ?auto_29637 ) ( not ( = ?auto_29638 ?auto_29641 ) ) ( HAVE_IMAGE ?auto_29640 ?auto_29639 ) ( not ( = ?auto_29640 ?auto_29638 ) ) ( not ( = ?auto_29640 ?auto_29641 ) ) ( not ( = ?auto_29639 ?auto_29637 ) ) ( CALIBRATION_TARGET ?auto_29643 ?auto_29641 ) ( not ( = ?auto_29641 ?auto_29635 ) ) ( not ( = ?auto_29638 ?auto_29635 ) ) ( not ( = ?auto_29640 ?auto_29635 ) ) ( ON_BOARD ?auto_29644 ?auto_29642 ) ( POWER_ON ?auto_29644 ) ( not ( = ?auto_29643 ?auto_29644 ) ) ( CALIBRATED ?auto_29644 ) ( SUPPORTS ?auto_29644 ?auto_29636 ) ( not ( = ?auto_29639 ?auto_29636 ) ) ( not ( = ?auto_29637 ?auto_29636 ) ) ( POINTING ?auto_29642 ?auto_29641 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29640 ?auto_29639 ?auto_29638 ?auto_29637 )
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
      ?auto_29651 - SATELLITE
      ?auto_29650 - DIRECTION
      ?auto_29654 - DIRECTION
      ?auto_29653 - INSTRUMENT
      ?auto_29649 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29652 ?auto_29651 ) ( SUPPORTS ?auto_29652 ?auto_29646 ) ( not ( = ?auto_29645 ?auto_29650 ) ) ( HAVE_IMAGE ?auto_29648 ?auto_29647 ) ( not ( = ?auto_29648 ?auto_29645 ) ) ( not ( = ?auto_29648 ?auto_29650 ) ) ( not ( = ?auto_29647 ?auto_29646 ) ) ( CALIBRATION_TARGET ?auto_29652 ?auto_29650 ) ( not ( = ?auto_29650 ?auto_29654 ) ) ( not ( = ?auto_29645 ?auto_29654 ) ) ( not ( = ?auto_29648 ?auto_29654 ) ) ( ON_BOARD ?auto_29653 ?auto_29651 ) ( POWER_ON ?auto_29653 ) ( not ( = ?auto_29652 ?auto_29653 ) ) ( CALIBRATED ?auto_29653 ) ( SUPPORTS ?auto_29653 ?auto_29649 ) ( not ( = ?auto_29647 ?auto_29649 ) ) ( not ( = ?auto_29646 ?auto_29649 ) ) ( POINTING ?auto_29651 ?auto_29650 ) )
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
      ?auto_29663 - INSTRUMENT
      ?auto_29662 - SATELLITE
      ?auto_29661 - DIRECTION
      ?auto_29660 - DIRECTION
      ?auto_29659 - MODE
      ?auto_29664 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29663 ?auto_29662 ) ( SUPPORTS ?auto_29663 ?auto_29656 ) ( not ( = ?auto_29655 ?auto_29661 ) ) ( HAVE_IMAGE ?auto_29660 ?auto_29659 ) ( not ( = ?auto_29660 ?auto_29655 ) ) ( not ( = ?auto_29660 ?auto_29661 ) ) ( not ( = ?auto_29659 ?auto_29656 ) ) ( CALIBRATION_TARGET ?auto_29663 ?auto_29661 ) ( not ( = ?auto_29661 ?auto_29658 ) ) ( not ( = ?auto_29655 ?auto_29658 ) ) ( not ( = ?auto_29660 ?auto_29658 ) ) ( ON_BOARD ?auto_29664 ?auto_29662 ) ( POWER_ON ?auto_29664 ) ( not ( = ?auto_29663 ?auto_29664 ) ) ( CALIBRATED ?auto_29664 ) ( SUPPORTS ?auto_29664 ?auto_29657 ) ( not ( = ?auto_29659 ?auto_29657 ) ) ( not ( = ?auto_29656 ?auto_29657 ) ) ( POINTING ?auto_29662 ?auto_29661 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29660 ?auto_29659 ?auto_29655 ?auto_29656 )
      ( GET-2IMAGE-VERIFY ?auto_29655 ?auto_29656 ?auto_29658 ?auto_29657 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29677 - DIRECTION
      ?auto_29678 - MODE
      ?auto_29680 - DIRECTION
      ?auto_29679 - MODE
      ?auto_29682 - DIRECTION
      ?auto_29681 - MODE
    )
    :vars
    (
      ?auto_29686 - INSTRUMENT
      ?auto_29685 - SATELLITE
      ?auto_29684 - DIRECTION
      ?auto_29688 - DIRECTION
      ?auto_29687 - INSTRUMENT
      ?auto_29683 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29686 ?auto_29685 ) ( SUPPORTS ?auto_29686 ?auto_29681 ) ( not ( = ?auto_29682 ?auto_29684 ) ) ( HAVE_IMAGE ?auto_29680 ?auto_29679 ) ( not ( = ?auto_29680 ?auto_29682 ) ) ( not ( = ?auto_29680 ?auto_29684 ) ) ( not ( = ?auto_29679 ?auto_29681 ) ) ( CALIBRATION_TARGET ?auto_29686 ?auto_29684 ) ( not ( = ?auto_29684 ?auto_29688 ) ) ( not ( = ?auto_29682 ?auto_29688 ) ) ( not ( = ?auto_29680 ?auto_29688 ) ) ( ON_BOARD ?auto_29687 ?auto_29685 ) ( POWER_ON ?auto_29687 ) ( not ( = ?auto_29686 ?auto_29687 ) ) ( CALIBRATED ?auto_29687 ) ( SUPPORTS ?auto_29687 ?auto_29683 ) ( not ( = ?auto_29679 ?auto_29683 ) ) ( not ( = ?auto_29681 ?auto_29683 ) ) ( POINTING ?auto_29685 ?auto_29684 ) ( HAVE_IMAGE ?auto_29677 ?auto_29678 ) ( not ( = ?auto_29677 ?auto_29680 ) ) ( not ( = ?auto_29677 ?auto_29682 ) ) ( not ( = ?auto_29677 ?auto_29684 ) ) ( not ( = ?auto_29677 ?auto_29688 ) ) ( not ( = ?auto_29678 ?auto_29679 ) ) ( not ( = ?auto_29678 ?auto_29681 ) ) ( not ( = ?auto_29678 ?auto_29683 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29680 ?auto_29679 ?auto_29682 ?auto_29681 )
      ( GET-3IMAGE-VERIFY ?auto_29677 ?auto_29678 ?auto_29680 ?auto_29679 ?auto_29682 ?auto_29681 ) )
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
      ?auto_29696 - SATELLITE
      ?auto_29695 - DIRECTION
      ?auto_29698 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29697 ?auto_29696 ) ( SUPPORTS ?auto_29697 ?auto_29693 ) ( not ( = ?auto_29694 ?auto_29695 ) ) ( HAVE_IMAGE ?auto_29689 ?auto_29690 ) ( not ( = ?auto_29689 ?auto_29694 ) ) ( not ( = ?auto_29689 ?auto_29695 ) ) ( not ( = ?auto_29690 ?auto_29693 ) ) ( CALIBRATION_TARGET ?auto_29697 ?auto_29695 ) ( not ( = ?auto_29695 ?auto_29692 ) ) ( not ( = ?auto_29694 ?auto_29692 ) ) ( not ( = ?auto_29689 ?auto_29692 ) ) ( ON_BOARD ?auto_29698 ?auto_29696 ) ( POWER_ON ?auto_29698 ) ( not ( = ?auto_29697 ?auto_29698 ) ) ( CALIBRATED ?auto_29698 ) ( SUPPORTS ?auto_29698 ?auto_29691 ) ( not ( = ?auto_29690 ?auto_29691 ) ) ( not ( = ?auto_29693 ?auto_29691 ) ) ( POINTING ?auto_29696 ?auto_29695 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29689 ?auto_29690 ?auto_29694 ?auto_29693 )
      ( GET-3IMAGE-VERIFY ?auto_29689 ?auto_29690 ?auto_29692 ?auto_29691 ?auto_29694 ?auto_29693 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29699 - DIRECTION
      ?auto_29700 - MODE
      ?auto_29702 - DIRECTION
      ?auto_29701 - MODE
      ?auto_29704 - DIRECTION
      ?auto_29703 - MODE
    )
    :vars
    (
      ?auto_29708 - INSTRUMENT
      ?auto_29707 - SATELLITE
      ?auto_29706 - DIRECTION
      ?auto_29710 - DIRECTION
      ?auto_29709 - INSTRUMENT
      ?auto_29705 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29708 ?auto_29707 ) ( SUPPORTS ?auto_29708 ?auto_29701 ) ( not ( = ?auto_29702 ?auto_29706 ) ) ( HAVE_IMAGE ?auto_29704 ?auto_29703 ) ( not ( = ?auto_29704 ?auto_29702 ) ) ( not ( = ?auto_29704 ?auto_29706 ) ) ( not ( = ?auto_29703 ?auto_29701 ) ) ( CALIBRATION_TARGET ?auto_29708 ?auto_29706 ) ( not ( = ?auto_29706 ?auto_29710 ) ) ( not ( = ?auto_29702 ?auto_29710 ) ) ( not ( = ?auto_29704 ?auto_29710 ) ) ( ON_BOARD ?auto_29709 ?auto_29707 ) ( POWER_ON ?auto_29709 ) ( not ( = ?auto_29708 ?auto_29709 ) ) ( CALIBRATED ?auto_29709 ) ( SUPPORTS ?auto_29709 ?auto_29705 ) ( not ( = ?auto_29703 ?auto_29705 ) ) ( not ( = ?auto_29701 ?auto_29705 ) ) ( POINTING ?auto_29707 ?auto_29706 ) ( HAVE_IMAGE ?auto_29699 ?auto_29700 ) ( not ( = ?auto_29699 ?auto_29702 ) ) ( not ( = ?auto_29699 ?auto_29704 ) ) ( not ( = ?auto_29699 ?auto_29706 ) ) ( not ( = ?auto_29699 ?auto_29710 ) ) ( not ( = ?auto_29700 ?auto_29701 ) ) ( not ( = ?auto_29700 ?auto_29703 ) ) ( not ( = ?auto_29700 ?auto_29705 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29704 ?auto_29703 ?auto_29702 ?auto_29701 )
      ( GET-3IMAGE-VERIFY ?auto_29699 ?auto_29700 ?auto_29702 ?auto_29701 ?auto_29704 ?auto_29703 ) )
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
      ?auto_29718 - SATELLITE
      ?auto_29717 - DIRECTION
      ?auto_29720 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29719 ?auto_29718 ) ( SUPPORTS ?auto_29719 ?auto_29713 ) ( not ( = ?auto_29714 ?auto_29717 ) ) ( HAVE_IMAGE ?auto_29711 ?auto_29712 ) ( not ( = ?auto_29711 ?auto_29714 ) ) ( not ( = ?auto_29711 ?auto_29717 ) ) ( not ( = ?auto_29712 ?auto_29713 ) ) ( CALIBRATION_TARGET ?auto_29719 ?auto_29717 ) ( not ( = ?auto_29717 ?auto_29716 ) ) ( not ( = ?auto_29714 ?auto_29716 ) ) ( not ( = ?auto_29711 ?auto_29716 ) ) ( ON_BOARD ?auto_29720 ?auto_29718 ) ( POWER_ON ?auto_29720 ) ( not ( = ?auto_29719 ?auto_29720 ) ) ( CALIBRATED ?auto_29720 ) ( SUPPORTS ?auto_29720 ?auto_29715 ) ( not ( = ?auto_29712 ?auto_29715 ) ) ( not ( = ?auto_29713 ?auto_29715 ) ) ( POINTING ?auto_29718 ?auto_29717 ) )
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
      ?auto_29740 - SATELLITE
      ?auto_29739 - DIRECTION
      ?auto_29742 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29741 ?auto_29740 ) ( SUPPORTS ?auto_29741 ?auto_29737 ) ( not ( = ?auto_29738 ?auto_29739 ) ) ( HAVE_IMAGE ?auto_29736 ?auto_29735 ) ( not ( = ?auto_29736 ?auto_29738 ) ) ( not ( = ?auto_29736 ?auto_29739 ) ) ( not ( = ?auto_29735 ?auto_29737 ) ) ( CALIBRATION_TARGET ?auto_29741 ?auto_29739 ) ( not ( = ?auto_29739 ?auto_29733 ) ) ( not ( = ?auto_29738 ?auto_29733 ) ) ( not ( = ?auto_29736 ?auto_29733 ) ) ( ON_BOARD ?auto_29742 ?auto_29740 ) ( POWER_ON ?auto_29742 ) ( not ( = ?auto_29741 ?auto_29742 ) ) ( CALIBRATED ?auto_29742 ) ( SUPPORTS ?auto_29742 ?auto_29734 ) ( not ( = ?auto_29735 ?auto_29734 ) ) ( not ( = ?auto_29737 ?auto_29734 ) ) ( POINTING ?auto_29740 ?auto_29739 ) )
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
      ?auto_29762 - SATELLITE
      ?auto_29761 - DIRECTION
      ?auto_29764 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29763 ?auto_29762 ) ( SUPPORTS ?auto_29763 ?auto_29757 ) ( not ( = ?auto_29758 ?auto_29761 ) ) ( HAVE_IMAGE ?auto_29760 ?auto_29759 ) ( not ( = ?auto_29760 ?auto_29758 ) ) ( not ( = ?auto_29760 ?auto_29761 ) ) ( not ( = ?auto_29759 ?auto_29757 ) ) ( CALIBRATION_TARGET ?auto_29763 ?auto_29761 ) ( not ( = ?auto_29761 ?auto_29755 ) ) ( not ( = ?auto_29758 ?auto_29755 ) ) ( not ( = ?auto_29760 ?auto_29755 ) ) ( ON_BOARD ?auto_29764 ?auto_29762 ) ( POWER_ON ?auto_29764 ) ( not ( = ?auto_29763 ?auto_29764 ) ) ( CALIBRATED ?auto_29764 ) ( SUPPORTS ?auto_29764 ?auto_29756 ) ( not ( = ?auto_29759 ?auto_29756 ) ) ( not ( = ?auto_29757 ?auto_29756 ) ) ( POINTING ?auto_29762 ?auto_29761 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29760 ?auto_29759 ?auto_29758 ?auto_29757 )
      ( GET-3IMAGE-VERIFY ?auto_29755 ?auto_29756 ?auto_29758 ?auto_29757 ?auto_29760 ?auto_29759 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29789 - DIRECTION
      ?auto_29790 - MODE
      ?auto_29792 - DIRECTION
      ?auto_29791 - MODE
      ?auto_29794 - DIRECTION
      ?auto_29793 - MODE
    )
    :vars
    (
      ?auto_29798 - INSTRUMENT
      ?auto_29797 - SATELLITE
      ?auto_29796 - DIRECTION
      ?auto_29800 - DIRECTION
      ?auto_29799 - INSTRUMENT
      ?auto_29795 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29798 ?auto_29797 ) ( SUPPORTS ?auto_29798 ?auto_29790 ) ( not ( = ?auto_29789 ?auto_29796 ) ) ( HAVE_IMAGE ?auto_29792 ?auto_29793 ) ( not ( = ?auto_29792 ?auto_29789 ) ) ( not ( = ?auto_29792 ?auto_29796 ) ) ( not ( = ?auto_29793 ?auto_29790 ) ) ( CALIBRATION_TARGET ?auto_29798 ?auto_29796 ) ( not ( = ?auto_29796 ?auto_29800 ) ) ( not ( = ?auto_29789 ?auto_29800 ) ) ( not ( = ?auto_29792 ?auto_29800 ) ) ( ON_BOARD ?auto_29799 ?auto_29797 ) ( POWER_ON ?auto_29799 ) ( not ( = ?auto_29798 ?auto_29799 ) ) ( CALIBRATED ?auto_29799 ) ( SUPPORTS ?auto_29799 ?auto_29795 ) ( not ( = ?auto_29793 ?auto_29795 ) ) ( not ( = ?auto_29790 ?auto_29795 ) ) ( POINTING ?auto_29797 ?auto_29796 ) ( HAVE_IMAGE ?auto_29792 ?auto_29791 ) ( HAVE_IMAGE ?auto_29794 ?auto_29793 ) ( not ( = ?auto_29789 ?auto_29794 ) ) ( not ( = ?auto_29790 ?auto_29791 ) ) ( not ( = ?auto_29792 ?auto_29794 ) ) ( not ( = ?auto_29791 ?auto_29793 ) ) ( not ( = ?auto_29791 ?auto_29795 ) ) ( not ( = ?auto_29794 ?auto_29796 ) ) ( not ( = ?auto_29794 ?auto_29800 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29792 ?auto_29793 ?auto_29789 ?auto_29790 )
      ( GET-3IMAGE-VERIFY ?auto_29789 ?auto_29790 ?auto_29792 ?auto_29791 ?auto_29794 ?auto_29793 ) )
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
      ?auto_29808 - SATELLITE
      ?auto_29807 - DIRECTION
      ?auto_29810 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29809 ?auto_29808 ) ( SUPPORTS ?auto_29809 ?auto_29802 ) ( not ( = ?auto_29801 ?auto_29807 ) ) ( HAVE_IMAGE ?auto_29804 ?auto_29803 ) ( not ( = ?auto_29804 ?auto_29801 ) ) ( not ( = ?auto_29804 ?auto_29807 ) ) ( not ( = ?auto_29803 ?auto_29802 ) ) ( CALIBRATION_TARGET ?auto_29809 ?auto_29807 ) ( not ( = ?auto_29807 ?auto_29806 ) ) ( not ( = ?auto_29801 ?auto_29806 ) ) ( not ( = ?auto_29804 ?auto_29806 ) ) ( ON_BOARD ?auto_29810 ?auto_29808 ) ( POWER_ON ?auto_29810 ) ( not ( = ?auto_29809 ?auto_29810 ) ) ( CALIBRATED ?auto_29810 ) ( SUPPORTS ?auto_29810 ?auto_29805 ) ( not ( = ?auto_29803 ?auto_29805 ) ) ( not ( = ?auto_29802 ?auto_29805 ) ) ( POINTING ?auto_29808 ?auto_29807 ) )
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
      ?auto_29830 - SATELLITE
      ?auto_29829 - DIRECTION
      ?auto_29832 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29831 ?auto_29830 ) ( SUPPORTS ?auto_29831 ?auto_29824 ) ( not ( = ?auto_29823 ?auto_29829 ) ) ( HAVE_IMAGE ?auto_29828 ?auto_29827 ) ( not ( = ?auto_29828 ?auto_29823 ) ) ( not ( = ?auto_29828 ?auto_29829 ) ) ( not ( = ?auto_29827 ?auto_29824 ) ) ( CALIBRATION_TARGET ?auto_29831 ?auto_29829 ) ( not ( = ?auto_29829 ?auto_29826 ) ) ( not ( = ?auto_29823 ?auto_29826 ) ) ( not ( = ?auto_29828 ?auto_29826 ) ) ( ON_BOARD ?auto_29832 ?auto_29830 ) ( POWER_ON ?auto_29832 ) ( not ( = ?auto_29831 ?auto_29832 ) ) ( CALIBRATED ?auto_29832 ) ( SUPPORTS ?auto_29832 ?auto_29825 ) ( not ( = ?auto_29827 ?auto_29825 ) ) ( not ( = ?auto_29824 ?auto_29825 ) ) ( POINTING ?auto_29830 ?auto_29829 ) )
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
      ?auto_29902 - INSTRUMENT
      ?auto_29901 - SATELLITE
      ?auto_29900 - DIRECTION
      ?auto_29898 - DIRECTION
      ?auto_29897 - MODE
      ?auto_29904 - DIRECTION
      ?auto_29903 - INSTRUMENT
      ?auto_29899 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29902 ?auto_29901 ) ( SUPPORTS ?auto_29902 ?auto_29896 ) ( not ( = ?auto_29895 ?auto_29900 ) ) ( HAVE_IMAGE ?auto_29898 ?auto_29897 ) ( not ( = ?auto_29898 ?auto_29895 ) ) ( not ( = ?auto_29898 ?auto_29900 ) ) ( not ( = ?auto_29897 ?auto_29896 ) ) ( CALIBRATION_TARGET ?auto_29902 ?auto_29900 ) ( not ( = ?auto_29900 ?auto_29904 ) ) ( not ( = ?auto_29895 ?auto_29904 ) ) ( not ( = ?auto_29898 ?auto_29904 ) ) ( ON_BOARD ?auto_29903 ?auto_29901 ) ( POWER_ON ?auto_29903 ) ( not ( = ?auto_29902 ?auto_29903 ) ) ( SUPPORTS ?auto_29903 ?auto_29899 ) ( not ( = ?auto_29897 ?auto_29899 ) ) ( not ( = ?auto_29896 ?auto_29899 ) ) ( POINTING ?auto_29901 ?auto_29900 ) ( CALIBRATION_TARGET ?auto_29903 ?auto_29900 ) ( NOT_CALIBRATED ?auto_29903 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_29901 ?auto_29903 ?auto_29900 )
      ( GET-2IMAGE ?auto_29898 ?auto_29897 ?auto_29895 ?auto_29896 )
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
      ?auto_29911 - INSTRUMENT
      ?auto_29912 - SATELLITE
      ?auto_29914 - DIRECTION
      ?auto_29909 - DIRECTION
      ?auto_29913 - INSTRUMENT
      ?auto_29910 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29911 ?auto_29912 ) ( SUPPORTS ?auto_29911 ?auto_29907 ) ( not ( = ?auto_29908 ?auto_29914 ) ) ( HAVE_IMAGE ?auto_29905 ?auto_29906 ) ( not ( = ?auto_29905 ?auto_29908 ) ) ( not ( = ?auto_29905 ?auto_29914 ) ) ( not ( = ?auto_29906 ?auto_29907 ) ) ( CALIBRATION_TARGET ?auto_29911 ?auto_29914 ) ( not ( = ?auto_29914 ?auto_29909 ) ) ( not ( = ?auto_29908 ?auto_29909 ) ) ( not ( = ?auto_29905 ?auto_29909 ) ) ( ON_BOARD ?auto_29913 ?auto_29912 ) ( POWER_ON ?auto_29913 ) ( not ( = ?auto_29911 ?auto_29913 ) ) ( SUPPORTS ?auto_29913 ?auto_29910 ) ( not ( = ?auto_29906 ?auto_29910 ) ) ( not ( = ?auto_29907 ?auto_29910 ) ) ( POINTING ?auto_29912 ?auto_29914 ) ( CALIBRATION_TARGET ?auto_29913 ?auto_29914 ) ( NOT_CALIBRATED ?auto_29913 ) )
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
      ?auto_29923 - INSTRUMENT
      ?auto_29924 - SATELLITE
      ?auto_29920 - DIRECTION
      ?auto_29922 - DIRECTION
      ?auto_29921 - MODE
      ?auto_29919 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29923 ?auto_29924 ) ( SUPPORTS ?auto_29923 ?auto_29917 ) ( not ( = ?auto_29918 ?auto_29920 ) ) ( HAVE_IMAGE ?auto_29922 ?auto_29921 ) ( not ( = ?auto_29922 ?auto_29918 ) ) ( not ( = ?auto_29922 ?auto_29920 ) ) ( not ( = ?auto_29921 ?auto_29917 ) ) ( CALIBRATION_TARGET ?auto_29923 ?auto_29920 ) ( not ( = ?auto_29920 ?auto_29915 ) ) ( not ( = ?auto_29918 ?auto_29915 ) ) ( not ( = ?auto_29922 ?auto_29915 ) ) ( ON_BOARD ?auto_29919 ?auto_29924 ) ( POWER_ON ?auto_29919 ) ( not ( = ?auto_29923 ?auto_29919 ) ) ( SUPPORTS ?auto_29919 ?auto_29916 ) ( not ( = ?auto_29921 ?auto_29916 ) ) ( not ( = ?auto_29917 ?auto_29916 ) ) ( POINTING ?auto_29924 ?auto_29920 ) ( CALIBRATION_TARGET ?auto_29919 ?auto_29920 ) ( NOT_CALIBRATED ?auto_29919 ) )
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
      ?auto_29932 - INSTRUMENT
      ?auto_29933 - SATELLITE
      ?auto_29930 - DIRECTION
      ?auto_29931 - DIRECTION
      ?auto_29929 - INSTRUMENT
      ?auto_29934 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29932 ?auto_29933 ) ( SUPPORTS ?auto_29932 ?auto_29926 ) ( not ( = ?auto_29925 ?auto_29930 ) ) ( HAVE_IMAGE ?auto_29928 ?auto_29927 ) ( not ( = ?auto_29928 ?auto_29925 ) ) ( not ( = ?auto_29928 ?auto_29930 ) ) ( not ( = ?auto_29927 ?auto_29926 ) ) ( CALIBRATION_TARGET ?auto_29932 ?auto_29930 ) ( not ( = ?auto_29930 ?auto_29931 ) ) ( not ( = ?auto_29925 ?auto_29931 ) ) ( not ( = ?auto_29928 ?auto_29931 ) ) ( ON_BOARD ?auto_29929 ?auto_29933 ) ( POWER_ON ?auto_29929 ) ( not ( = ?auto_29932 ?auto_29929 ) ) ( SUPPORTS ?auto_29929 ?auto_29934 ) ( not ( = ?auto_29927 ?auto_29934 ) ) ( not ( = ?auto_29926 ?auto_29934 ) ) ( POINTING ?auto_29933 ?auto_29930 ) ( CALIBRATION_TARGET ?auto_29929 ?auto_29930 ) ( NOT_CALIBRATED ?auto_29929 ) )
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
      ?auto_29943 - INSTRUMENT
      ?auto_29944 - SATELLITE
      ?auto_29940 - DIRECTION
      ?auto_29942 - DIRECTION
      ?auto_29941 - MODE
      ?auto_29939 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29943 ?auto_29944 ) ( SUPPORTS ?auto_29943 ?auto_29936 ) ( not ( = ?auto_29935 ?auto_29940 ) ) ( HAVE_IMAGE ?auto_29942 ?auto_29941 ) ( not ( = ?auto_29942 ?auto_29935 ) ) ( not ( = ?auto_29942 ?auto_29940 ) ) ( not ( = ?auto_29941 ?auto_29936 ) ) ( CALIBRATION_TARGET ?auto_29943 ?auto_29940 ) ( not ( = ?auto_29940 ?auto_29938 ) ) ( not ( = ?auto_29935 ?auto_29938 ) ) ( not ( = ?auto_29942 ?auto_29938 ) ) ( ON_BOARD ?auto_29939 ?auto_29944 ) ( POWER_ON ?auto_29939 ) ( not ( = ?auto_29943 ?auto_29939 ) ) ( SUPPORTS ?auto_29939 ?auto_29937 ) ( not ( = ?auto_29941 ?auto_29937 ) ) ( not ( = ?auto_29936 ?auto_29937 ) ) ( POINTING ?auto_29944 ?auto_29940 ) ( CALIBRATION_TARGET ?auto_29939 ?auto_29940 ) ( NOT_CALIBRATED ?auto_29939 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29942 ?auto_29941 ?auto_29935 ?auto_29936 )
      ( GET-2IMAGE-VERIFY ?auto_29935 ?auto_29936 ?auto_29938 ?auto_29937 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29957 - DIRECTION
      ?auto_29958 - MODE
      ?auto_29960 - DIRECTION
      ?auto_29959 - MODE
      ?auto_29962 - DIRECTION
      ?auto_29961 - MODE
    )
    :vars
    (
      ?auto_29966 - INSTRUMENT
      ?auto_29967 - SATELLITE
      ?auto_29964 - DIRECTION
      ?auto_29965 - DIRECTION
      ?auto_29963 - INSTRUMENT
      ?auto_29968 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29966 ?auto_29967 ) ( SUPPORTS ?auto_29966 ?auto_29961 ) ( not ( = ?auto_29962 ?auto_29964 ) ) ( HAVE_IMAGE ?auto_29957 ?auto_29959 ) ( not ( = ?auto_29957 ?auto_29962 ) ) ( not ( = ?auto_29957 ?auto_29964 ) ) ( not ( = ?auto_29959 ?auto_29961 ) ) ( CALIBRATION_TARGET ?auto_29966 ?auto_29964 ) ( not ( = ?auto_29964 ?auto_29965 ) ) ( not ( = ?auto_29962 ?auto_29965 ) ) ( not ( = ?auto_29957 ?auto_29965 ) ) ( ON_BOARD ?auto_29963 ?auto_29967 ) ( POWER_ON ?auto_29963 ) ( not ( = ?auto_29966 ?auto_29963 ) ) ( SUPPORTS ?auto_29963 ?auto_29968 ) ( not ( = ?auto_29959 ?auto_29968 ) ) ( not ( = ?auto_29961 ?auto_29968 ) ) ( POINTING ?auto_29967 ?auto_29964 ) ( CALIBRATION_TARGET ?auto_29963 ?auto_29964 ) ( NOT_CALIBRATED ?auto_29963 ) ( HAVE_IMAGE ?auto_29957 ?auto_29958 ) ( HAVE_IMAGE ?auto_29960 ?auto_29959 ) ( not ( = ?auto_29957 ?auto_29960 ) ) ( not ( = ?auto_29958 ?auto_29959 ) ) ( not ( = ?auto_29958 ?auto_29961 ) ) ( not ( = ?auto_29958 ?auto_29968 ) ) ( not ( = ?auto_29960 ?auto_29962 ) ) ( not ( = ?auto_29960 ?auto_29964 ) ) ( not ( = ?auto_29960 ?auto_29965 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29957 ?auto_29959 ?auto_29962 ?auto_29961 )
      ( GET-3IMAGE-VERIFY ?auto_29957 ?auto_29958 ?auto_29960 ?auto_29959 ?auto_29962 ?auto_29961 ) )
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
      ?auto_29977 - INSTRUMENT
      ?auto_29978 - SATELLITE
      ?auto_29976 - DIRECTION
      ?auto_29975 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29977 ?auto_29978 ) ( SUPPORTS ?auto_29977 ?auto_29973 ) ( not ( = ?auto_29974 ?auto_29976 ) ) ( HAVE_IMAGE ?auto_29969 ?auto_29970 ) ( not ( = ?auto_29969 ?auto_29974 ) ) ( not ( = ?auto_29969 ?auto_29976 ) ) ( not ( = ?auto_29970 ?auto_29973 ) ) ( CALIBRATION_TARGET ?auto_29977 ?auto_29976 ) ( not ( = ?auto_29976 ?auto_29972 ) ) ( not ( = ?auto_29974 ?auto_29972 ) ) ( not ( = ?auto_29969 ?auto_29972 ) ) ( ON_BOARD ?auto_29975 ?auto_29978 ) ( POWER_ON ?auto_29975 ) ( not ( = ?auto_29977 ?auto_29975 ) ) ( SUPPORTS ?auto_29975 ?auto_29971 ) ( not ( = ?auto_29970 ?auto_29971 ) ) ( not ( = ?auto_29973 ?auto_29971 ) ) ( POINTING ?auto_29978 ?auto_29976 ) ( CALIBRATION_TARGET ?auto_29975 ?auto_29976 ) ( NOT_CALIBRATED ?auto_29975 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29969 ?auto_29970 ?auto_29974 ?auto_29973 )
      ( GET-3IMAGE-VERIFY ?auto_29969 ?auto_29970 ?auto_29972 ?auto_29971 ?auto_29974 ?auto_29973 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29979 - DIRECTION
      ?auto_29980 - MODE
      ?auto_29982 - DIRECTION
      ?auto_29981 - MODE
      ?auto_29984 - DIRECTION
      ?auto_29983 - MODE
    )
    :vars
    (
      ?auto_29988 - INSTRUMENT
      ?auto_29989 - SATELLITE
      ?auto_29986 - DIRECTION
      ?auto_29987 - DIRECTION
      ?auto_29985 - INSTRUMENT
      ?auto_29990 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29988 ?auto_29989 ) ( SUPPORTS ?auto_29988 ?auto_29981 ) ( not ( = ?auto_29982 ?auto_29986 ) ) ( HAVE_IMAGE ?auto_29984 ?auto_29983 ) ( not ( = ?auto_29984 ?auto_29982 ) ) ( not ( = ?auto_29984 ?auto_29986 ) ) ( not ( = ?auto_29983 ?auto_29981 ) ) ( CALIBRATION_TARGET ?auto_29988 ?auto_29986 ) ( not ( = ?auto_29986 ?auto_29987 ) ) ( not ( = ?auto_29982 ?auto_29987 ) ) ( not ( = ?auto_29984 ?auto_29987 ) ) ( ON_BOARD ?auto_29985 ?auto_29989 ) ( POWER_ON ?auto_29985 ) ( not ( = ?auto_29988 ?auto_29985 ) ) ( SUPPORTS ?auto_29985 ?auto_29990 ) ( not ( = ?auto_29983 ?auto_29990 ) ) ( not ( = ?auto_29981 ?auto_29990 ) ) ( POINTING ?auto_29989 ?auto_29986 ) ( CALIBRATION_TARGET ?auto_29985 ?auto_29986 ) ( NOT_CALIBRATED ?auto_29985 ) ( HAVE_IMAGE ?auto_29979 ?auto_29980 ) ( not ( = ?auto_29979 ?auto_29982 ) ) ( not ( = ?auto_29979 ?auto_29984 ) ) ( not ( = ?auto_29979 ?auto_29986 ) ) ( not ( = ?auto_29979 ?auto_29987 ) ) ( not ( = ?auto_29980 ?auto_29981 ) ) ( not ( = ?auto_29980 ?auto_29983 ) ) ( not ( = ?auto_29980 ?auto_29990 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29984 ?auto_29983 ?auto_29982 ?auto_29981 )
      ( GET-3IMAGE-VERIFY ?auto_29979 ?auto_29980 ?auto_29982 ?auto_29981 ?auto_29984 ?auto_29983 ) )
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
      ?auto_29999 - INSTRUMENT
      ?auto_30000 - SATELLITE
      ?auto_29998 - DIRECTION
      ?auto_29997 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_29999 ?auto_30000 ) ( SUPPORTS ?auto_29999 ?auto_29993 ) ( not ( = ?auto_29994 ?auto_29998 ) ) ( HAVE_IMAGE ?auto_29991 ?auto_29992 ) ( not ( = ?auto_29991 ?auto_29994 ) ) ( not ( = ?auto_29991 ?auto_29998 ) ) ( not ( = ?auto_29992 ?auto_29993 ) ) ( CALIBRATION_TARGET ?auto_29999 ?auto_29998 ) ( not ( = ?auto_29998 ?auto_29996 ) ) ( not ( = ?auto_29994 ?auto_29996 ) ) ( not ( = ?auto_29991 ?auto_29996 ) ) ( ON_BOARD ?auto_29997 ?auto_30000 ) ( POWER_ON ?auto_29997 ) ( not ( = ?auto_29999 ?auto_29997 ) ) ( SUPPORTS ?auto_29997 ?auto_29995 ) ( not ( = ?auto_29992 ?auto_29995 ) ) ( not ( = ?auto_29993 ?auto_29995 ) ) ( POINTING ?auto_30000 ?auto_29998 ) ( CALIBRATION_TARGET ?auto_29997 ?auto_29998 ) ( NOT_CALIBRATED ?auto_29997 ) )
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
      ?auto_30021 - INSTRUMENT
      ?auto_30022 - SATELLITE
      ?auto_30020 - DIRECTION
      ?auto_30019 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30021 ?auto_30022 ) ( SUPPORTS ?auto_30021 ?auto_30017 ) ( not ( = ?auto_30018 ?auto_30020 ) ) ( HAVE_IMAGE ?auto_30016 ?auto_30015 ) ( not ( = ?auto_30016 ?auto_30018 ) ) ( not ( = ?auto_30016 ?auto_30020 ) ) ( not ( = ?auto_30015 ?auto_30017 ) ) ( CALIBRATION_TARGET ?auto_30021 ?auto_30020 ) ( not ( = ?auto_30020 ?auto_30013 ) ) ( not ( = ?auto_30018 ?auto_30013 ) ) ( not ( = ?auto_30016 ?auto_30013 ) ) ( ON_BOARD ?auto_30019 ?auto_30022 ) ( POWER_ON ?auto_30019 ) ( not ( = ?auto_30021 ?auto_30019 ) ) ( SUPPORTS ?auto_30019 ?auto_30014 ) ( not ( = ?auto_30015 ?auto_30014 ) ) ( not ( = ?auto_30017 ?auto_30014 ) ) ( POINTING ?auto_30022 ?auto_30020 ) ( CALIBRATION_TARGET ?auto_30019 ?auto_30020 ) ( NOT_CALIBRATED ?auto_30019 ) )
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
      ?auto_30043 - INSTRUMENT
      ?auto_30044 - SATELLITE
      ?auto_30042 - DIRECTION
      ?auto_30041 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30043 ?auto_30044 ) ( SUPPORTS ?auto_30043 ?auto_30037 ) ( not ( = ?auto_30038 ?auto_30042 ) ) ( HAVE_IMAGE ?auto_30040 ?auto_30039 ) ( not ( = ?auto_30040 ?auto_30038 ) ) ( not ( = ?auto_30040 ?auto_30042 ) ) ( not ( = ?auto_30039 ?auto_30037 ) ) ( CALIBRATION_TARGET ?auto_30043 ?auto_30042 ) ( not ( = ?auto_30042 ?auto_30035 ) ) ( not ( = ?auto_30038 ?auto_30035 ) ) ( not ( = ?auto_30040 ?auto_30035 ) ) ( ON_BOARD ?auto_30041 ?auto_30044 ) ( POWER_ON ?auto_30041 ) ( not ( = ?auto_30043 ?auto_30041 ) ) ( SUPPORTS ?auto_30041 ?auto_30036 ) ( not ( = ?auto_30039 ?auto_30036 ) ) ( not ( = ?auto_30037 ?auto_30036 ) ) ( POINTING ?auto_30044 ?auto_30042 ) ( CALIBRATION_TARGET ?auto_30041 ?auto_30042 ) ( NOT_CALIBRATED ?auto_30041 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30040 ?auto_30039 ?auto_30038 ?auto_30037 )
      ( GET-3IMAGE-VERIFY ?auto_30035 ?auto_30036 ?auto_30038 ?auto_30037 ?auto_30040 ?auto_30039 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30069 - DIRECTION
      ?auto_30070 - MODE
      ?auto_30072 - DIRECTION
      ?auto_30071 - MODE
      ?auto_30074 - DIRECTION
      ?auto_30073 - MODE
    )
    :vars
    (
      ?auto_30078 - INSTRUMENT
      ?auto_30079 - SATELLITE
      ?auto_30076 - DIRECTION
      ?auto_30077 - DIRECTION
      ?auto_30075 - INSTRUMENT
      ?auto_30080 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_30078 ?auto_30079 ) ( SUPPORTS ?auto_30078 ?auto_30070 ) ( not ( = ?auto_30069 ?auto_30076 ) ) ( HAVE_IMAGE ?auto_30072 ?auto_30071 ) ( not ( = ?auto_30072 ?auto_30069 ) ) ( not ( = ?auto_30072 ?auto_30076 ) ) ( not ( = ?auto_30071 ?auto_30070 ) ) ( CALIBRATION_TARGET ?auto_30078 ?auto_30076 ) ( not ( = ?auto_30076 ?auto_30077 ) ) ( not ( = ?auto_30069 ?auto_30077 ) ) ( not ( = ?auto_30072 ?auto_30077 ) ) ( ON_BOARD ?auto_30075 ?auto_30079 ) ( POWER_ON ?auto_30075 ) ( not ( = ?auto_30078 ?auto_30075 ) ) ( SUPPORTS ?auto_30075 ?auto_30080 ) ( not ( = ?auto_30071 ?auto_30080 ) ) ( not ( = ?auto_30070 ?auto_30080 ) ) ( POINTING ?auto_30079 ?auto_30076 ) ( CALIBRATION_TARGET ?auto_30075 ?auto_30076 ) ( NOT_CALIBRATED ?auto_30075 ) ( HAVE_IMAGE ?auto_30074 ?auto_30073 ) ( not ( = ?auto_30069 ?auto_30074 ) ) ( not ( = ?auto_30070 ?auto_30073 ) ) ( not ( = ?auto_30072 ?auto_30074 ) ) ( not ( = ?auto_30071 ?auto_30073 ) ) ( not ( = ?auto_30074 ?auto_30076 ) ) ( not ( = ?auto_30074 ?auto_30077 ) ) ( not ( = ?auto_30073 ?auto_30080 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30072 ?auto_30071 ?auto_30069 ?auto_30070 )
      ( GET-3IMAGE-VERIFY ?auto_30069 ?auto_30070 ?auto_30072 ?auto_30071 ?auto_30074 ?auto_30073 ) )
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
      ?auto_30089 - INSTRUMENT
      ?auto_30090 - SATELLITE
      ?auto_30088 - DIRECTION
      ?auto_30087 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30089 ?auto_30090 ) ( SUPPORTS ?auto_30089 ?auto_30082 ) ( not ( = ?auto_30081 ?auto_30088 ) ) ( HAVE_IMAGE ?auto_30084 ?auto_30083 ) ( not ( = ?auto_30084 ?auto_30081 ) ) ( not ( = ?auto_30084 ?auto_30088 ) ) ( not ( = ?auto_30083 ?auto_30082 ) ) ( CALIBRATION_TARGET ?auto_30089 ?auto_30088 ) ( not ( = ?auto_30088 ?auto_30086 ) ) ( not ( = ?auto_30081 ?auto_30086 ) ) ( not ( = ?auto_30084 ?auto_30086 ) ) ( ON_BOARD ?auto_30087 ?auto_30090 ) ( POWER_ON ?auto_30087 ) ( not ( = ?auto_30089 ?auto_30087 ) ) ( SUPPORTS ?auto_30087 ?auto_30085 ) ( not ( = ?auto_30083 ?auto_30085 ) ) ( not ( = ?auto_30082 ?auto_30085 ) ) ( POINTING ?auto_30090 ?auto_30088 ) ( CALIBRATION_TARGET ?auto_30087 ?auto_30088 ) ( NOT_CALIBRATED ?auto_30087 ) )
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
      ?auto_30111 - INSTRUMENT
      ?auto_30112 - SATELLITE
      ?auto_30110 - DIRECTION
      ?auto_30109 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30111 ?auto_30112 ) ( SUPPORTS ?auto_30111 ?auto_30104 ) ( not ( = ?auto_30103 ?auto_30110 ) ) ( HAVE_IMAGE ?auto_30108 ?auto_30107 ) ( not ( = ?auto_30108 ?auto_30103 ) ) ( not ( = ?auto_30108 ?auto_30110 ) ) ( not ( = ?auto_30107 ?auto_30104 ) ) ( CALIBRATION_TARGET ?auto_30111 ?auto_30110 ) ( not ( = ?auto_30110 ?auto_30106 ) ) ( not ( = ?auto_30103 ?auto_30106 ) ) ( not ( = ?auto_30108 ?auto_30106 ) ) ( ON_BOARD ?auto_30109 ?auto_30112 ) ( POWER_ON ?auto_30109 ) ( not ( = ?auto_30111 ?auto_30109 ) ) ( SUPPORTS ?auto_30109 ?auto_30105 ) ( not ( = ?auto_30107 ?auto_30105 ) ) ( not ( = ?auto_30104 ?auto_30105 ) ) ( POINTING ?auto_30112 ?auto_30110 ) ( CALIBRATION_TARGET ?auto_30109 ?auto_30110 ) ( NOT_CALIBRATED ?auto_30109 ) )
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
      ?auto_30182 - INSTRUMENT
      ?auto_30183 - SATELLITE
      ?auto_30178 - DIRECTION
      ?auto_30181 - DIRECTION
      ?auto_30180 - MODE
      ?auto_30179 - DIRECTION
      ?auto_30177 - INSTRUMENT
      ?auto_30184 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_30182 ?auto_30183 ) ( SUPPORTS ?auto_30182 ?auto_30176 ) ( not ( = ?auto_30175 ?auto_30178 ) ) ( HAVE_IMAGE ?auto_30181 ?auto_30180 ) ( not ( = ?auto_30181 ?auto_30175 ) ) ( not ( = ?auto_30181 ?auto_30178 ) ) ( not ( = ?auto_30180 ?auto_30176 ) ) ( CALIBRATION_TARGET ?auto_30182 ?auto_30178 ) ( not ( = ?auto_30178 ?auto_30179 ) ) ( not ( = ?auto_30175 ?auto_30179 ) ) ( not ( = ?auto_30181 ?auto_30179 ) ) ( ON_BOARD ?auto_30177 ?auto_30183 ) ( not ( = ?auto_30182 ?auto_30177 ) ) ( SUPPORTS ?auto_30177 ?auto_30184 ) ( not ( = ?auto_30180 ?auto_30184 ) ) ( not ( = ?auto_30176 ?auto_30184 ) ) ( POINTING ?auto_30183 ?auto_30178 ) ( CALIBRATION_TARGET ?auto_30177 ?auto_30178 ) ( POWER_AVAIL ?auto_30183 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_30177 ?auto_30183 )
      ( GET-2IMAGE ?auto_30181 ?auto_30180 ?auto_30175 ?auto_30176 )
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
      ?auto_30191 - INSTRUMENT
      ?auto_30193 - SATELLITE
      ?auto_30192 - DIRECTION
      ?auto_30190 - DIRECTION
      ?auto_30189 - INSTRUMENT
      ?auto_30194 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_30191 ?auto_30193 ) ( SUPPORTS ?auto_30191 ?auto_30187 ) ( not ( = ?auto_30188 ?auto_30192 ) ) ( HAVE_IMAGE ?auto_30185 ?auto_30186 ) ( not ( = ?auto_30185 ?auto_30188 ) ) ( not ( = ?auto_30185 ?auto_30192 ) ) ( not ( = ?auto_30186 ?auto_30187 ) ) ( CALIBRATION_TARGET ?auto_30191 ?auto_30192 ) ( not ( = ?auto_30192 ?auto_30190 ) ) ( not ( = ?auto_30188 ?auto_30190 ) ) ( not ( = ?auto_30185 ?auto_30190 ) ) ( ON_BOARD ?auto_30189 ?auto_30193 ) ( not ( = ?auto_30191 ?auto_30189 ) ) ( SUPPORTS ?auto_30189 ?auto_30194 ) ( not ( = ?auto_30186 ?auto_30194 ) ) ( not ( = ?auto_30187 ?auto_30194 ) ) ( POINTING ?auto_30193 ?auto_30192 ) ( CALIBRATION_TARGET ?auto_30189 ?auto_30192 ) ( POWER_AVAIL ?auto_30193 ) )
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
      ?auto_30202 - INSTRUMENT
      ?auto_30203 - SATELLITE
      ?auto_30200 - DIRECTION
      ?auto_30199 - DIRECTION
      ?auto_30204 - MODE
      ?auto_30201 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30202 ?auto_30203 ) ( SUPPORTS ?auto_30202 ?auto_30197 ) ( not ( = ?auto_30198 ?auto_30200 ) ) ( HAVE_IMAGE ?auto_30199 ?auto_30204 ) ( not ( = ?auto_30199 ?auto_30198 ) ) ( not ( = ?auto_30199 ?auto_30200 ) ) ( not ( = ?auto_30204 ?auto_30197 ) ) ( CALIBRATION_TARGET ?auto_30202 ?auto_30200 ) ( not ( = ?auto_30200 ?auto_30195 ) ) ( not ( = ?auto_30198 ?auto_30195 ) ) ( not ( = ?auto_30199 ?auto_30195 ) ) ( ON_BOARD ?auto_30201 ?auto_30203 ) ( not ( = ?auto_30202 ?auto_30201 ) ) ( SUPPORTS ?auto_30201 ?auto_30196 ) ( not ( = ?auto_30204 ?auto_30196 ) ) ( not ( = ?auto_30197 ?auto_30196 ) ) ( POINTING ?auto_30203 ?auto_30200 ) ( CALIBRATION_TARGET ?auto_30201 ?auto_30200 ) ( POWER_AVAIL ?auto_30203 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30199 ?auto_30204 ?auto_30198 ?auto_30197 )
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
      ?auto_30213 - INSTRUMENT
      ?auto_30214 - SATELLITE
      ?auto_30209 - DIRECTION
      ?auto_30211 - DIRECTION
      ?auto_30210 - INSTRUMENT
      ?auto_30212 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_30213 ?auto_30214 ) ( SUPPORTS ?auto_30213 ?auto_30206 ) ( not ( = ?auto_30205 ?auto_30209 ) ) ( HAVE_IMAGE ?auto_30208 ?auto_30207 ) ( not ( = ?auto_30208 ?auto_30205 ) ) ( not ( = ?auto_30208 ?auto_30209 ) ) ( not ( = ?auto_30207 ?auto_30206 ) ) ( CALIBRATION_TARGET ?auto_30213 ?auto_30209 ) ( not ( = ?auto_30209 ?auto_30211 ) ) ( not ( = ?auto_30205 ?auto_30211 ) ) ( not ( = ?auto_30208 ?auto_30211 ) ) ( ON_BOARD ?auto_30210 ?auto_30214 ) ( not ( = ?auto_30213 ?auto_30210 ) ) ( SUPPORTS ?auto_30210 ?auto_30212 ) ( not ( = ?auto_30207 ?auto_30212 ) ) ( not ( = ?auto_30206 ?auto_30212 ) ) ( POINTING ?auto_30214 ?auto_30209 ) ( CALIBRATION_TARGET ?auto_30210 ?auto_30209 ) ( POWER_AVAIL ?auto_30214 ) )
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
      ?auto_30222 - INSTRUMENT
      ?auto_30223 - SATELLITE
      ?auto_30220 - DIRECTION
      ?auto_30219 - DIRECTION
      ?auto_30224 - MODE
      ?auto_30221 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30222 ?auto_30223 ) ( SUPPORTS ?auto_30222 ?auto_30216 ) ( not ( = ?auto_30215 ?auto_30220 ) ) ( HAVE_IMAGE ?auto_30219 ?auto_30224 ) ( not ( = ?auto_30219 ?auto_30215 ) ) ( not ( = ?auto_30219 ?auto_30220 ) ) ( not ( = ?auto_30224 ?auto_30216 ) ) ( CALIBRATION_TARGET ?auto_30222 ?auto_30220 ) ( not ( = ?auto_30220 ?auto_30218 ) ) ( not ( = ?auto_30215 ?auto_30218 ) ) ( not ( = ?auto_30219 ?auto_30218 ) ) ( ON_BOARD ?auto_30221 ?auto_30223 ) ( not ( = ?auto_30222 ?auto_30221 ) ) ( SUPPORTS ?auto_30221 ?auto_30217 ) ( not ( = ?auto_30224 ?auto_30217 ) ) ( not ( = ?auto_30216 ?auto_30217 ) ) ( POINTING ?auto_30223 ?auto_30220 ) ( CALIBRATION_TARGET ?auto_30221 ?auto_30220 ) ( POWER_AVAIL ?auto_30223 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30219 ?auto_30224 ?auto_30215 ?auto_30216 )
      ( GET-2IMAGE-VERIFY ?auto_30215 ?auto_30216 ?auto_30218 ?auto_30217 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30237 - DIRECTION
      ?auto_30238 - MODE
      ?auto_30240 - DIRECTION
      ?auto_30239 - MODE
      ?auto_30242 - DIRECTION
      ?auto_30241 - MODE
    )
    :vars
    (
      ?auto_30247 - INSTRUMENT
      ?auto_30248 - SATELLITE
      ?auto_30243 - DIRECTION
      ?auto_30245 - DIRECTION
      ?auto_30244 - INSTRUMENT
      ?auto_30246 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_30247 ?auto_30248 ) ( SUPPORTS ?auto_30247 ?auto_30241 ) ( not ( = ?auto_30242 ?auto_30243 ) ) ( HAVE_IMAGE ?auto_30237 ?auto_30238 ) ( not ( = ?auto_30237 ?auto_30242 ) ) ( not ( = ?auto_30237 ?auto_30243 ) ) ( not ( = ?auto_30238 ?auto_30241 ) ) ( CALIBRATION_TARGET ?auto_30247 ?auto_30243 ) ( not ( = ?auto_30243 ?auto_30245 ) ) ( not ( = ?auto_30242 ?auto_30245 ) ) ( not ( = ?auto_30237 ?auto_30245 ) ) ( ON_BOARD ?auto_30244 ?auto_30248 ) ( not ( = ?auto_30247 ?auto_30244 ) ) ( SUPPORTS ?auto_30244 ?auto_30246 ) ( not ( = ?auto_30238 ?auto_30246 ) ) ( not ( = ?auto_30241 ?auto_30246 ) ) ( POINTING ?auto_30248 ?auto_30243 ) ( CALIBRATION_TARGET ?auto_30244 ?auto_30243 ) ( POWER_AVAIL ?auto_30248 ) ( HAVE_IMAGE ?auto_30240 ?auto_30239 ) ( not ( = ?auto_30237 ?auto_30240 ) ) ( not ( = ?auto_30238 ?auto_30239 ) ) ( not ( = ?auto_30240 ?auto_30242 ) ) ( not ( = ?auto_30240 ?auto_30243 ) ) ( not ( = ?auto_30240 ?auto_30245 ) ) ( not ( = ?auto_30239 ?auto_30241 ) ) ( not ( = ?auto_30239 ?auto_30246 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30237 ?auto_30238 ?auto_30242 ?auto_30241 )
      ( GET-3IMAGE-VERIFY ?auto_30237 ?auto_30238 ?auto_30240 ?auto_30239 ?auto_30242 ?auto_30241 ) )
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
      ?auto_30257 - INSTRUMENT
      ?auto_30258 - SATELLITE
      ?auto_30255 - DIRECTION
      ?auto_30256 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30257 ?auto_30258 ) ( SUPPORTS ?auto_30257 ?auto_30253 ) ( not ( = ?auto_30254 ?auto_30255 ) ) ( HAVE_IMAGE ?auto_30249 ?auto_30250 ) ( not ( = ?auto_30249 ?auto_30254 ) ) ( not ( = ?auto_30249 ?auto_30255 ) ) ( not ( = ?auto_30250 ?auto_30253 ) ) ( CALIBRATION_TARGET ?auto_30257 ?auto_30255 ) ( not ( = ?auto_30255 ?auto_30252 ) ) ( not ( = ?auto_30254 ?auto_30252 ) ) ( not ( = ?auto_30249 ?auto_30252 ) ) ( ON_BOARD ?auto_30256 ?auto_30258 ) ( not ( = ?auto_30257 ?auto_30256 ) ) ( SUPPORTS ?auto_30256 ?auto_30251 ) ( not ( = ?auto_30250 ?auto_30251 ) ) ( not ( = ?auto_30253 ?auto_30251 ) ) ( POINTING ?auto_30258 ?auto_30255 ) ( CALIBRATION_TARGET ?auto_30256 ?auto_30255 ) ( POWER_AVAIL ?auto_30258 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30249 ?auto_30250 ?auto_30254 ?auto_30253 )
      ( GET-3IMAGE-VERIFY ?auto_30249 ?auto_30250 ?auto_30252 ?auto_30251 ?auto_30254 ?auto_30253 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30259 - DIRECTION
      ?auto_30260 - MODE
      ?auto_30262 - DIRECTION
      ?auto_30261 - MODE
      ?auto_30264 - DIRECTION
      ?auto_30263 - MODE
    )
    :vars
    (
      ?auto_30269 - INSTRUMENT
      ?auto_30270 - SATELLITE
      ?auto_30265 - DIRECTION
      ?auto_30267 - DIRECTION
      ?auto_30266 - INSTRUMENT
      ?auto_30268 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_30269 ?auto_30270 ) ( SUPPORTS ?auto_30269 ?auto_30261 ) ( not ( = ?auto_30262 ?auto_30265 ) ) ( HAVE_IMAGE ?auto_30264 ?auto_30263 ) ( not ( = ?auto_30264 ?auto_30262 ) ) ( not ( = ?auto_30264 ?auto_30265 ) ) ( not ( = ?auto_30263 ?auto_30261 ) ) ( CALIBRATION_TARGET ?auto_30269 ?auto_30265 ) ( not ( = ?auto_30265 ?auto_30267 ) ) ( not ( = ?auto_30262 ?auto_30267 ) ) ( not ( = ?auto_30264 ?auto_30267 ) ) ( ON_BOARD ?auto_30266 ?auto_30270 ) ( not ( = ?auto_30269 ?auto_30266 ) ) ( SUPPORTS ?auto_30266 ?auto_30268 ) ( not ( = ?auto_30263 ?auto_30268 ) ) ( not ( = ?auto_30261 ?auto_30268 ) ) ( POINTING ?auto_30270 ?auto_30265 ) ( CALIBRATION_TARGET ?auto_30266 ?auto_30265 ) ( POWER_AVAIL ?auto_30270 ) ( HAVE_IMAGE ?auto_30259 ?auto_30260 ) ( not ( = ?auto_30259 ?auto_30262 ) ) ( not ( = ?auto_30259 ?auto_30264 ) ) ( not ( = ?auto_30259 ?auto_30265 ) ) ( not ( = ?auto_30259 ?auto_30267 ) ) ( not ( = ?auto_30260 ?auto_30261 ) ) ( not ( = ?auto_30260 ?auto_30263 ) ) ( not ( = ?auto_30260 ?auto_30268 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30264 ?auto_30263 ?auto_30262 ?auto_30261 )
      ( GET-3IMAGE-VERIFY ?auto_30259 ?auto_30260 ?auto_30262 ?auto_30261 ?auto_30264 ?auto_30263 ) )
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
      ?auto_30279 - INSTRUMENT
      ?auto_30280 - SATELLITE
      ?auto_30277 - DIRECTION
      ?auto_30278 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30279 ?auto_30280 ) ( SUPPORTS ?auto_30279 ?auto_30273 ) ( not ( = ?auto_30274 ?auto_30277 ) ) ( HAVE_IMAGE ?auto_30271 ?auto_30272 ) ( not ( = ?auto_30271 ?auto_30274 ) ) ( not ( = ?auto_30271 ?auto_30277 ) ) ( not ( = ?auto_30272 ?auto_30273 ) ) ( CALIBRATION_TARGET ?auto_30279 ?auto_30277 ) ( not ( = ?auto_30277 ?auto_30276 ) ) ( not ( = ?auto_30274 ?auto_30276 ) ) ( not ( = ?auto_30271 ?auto_30276 ) ) ( ON_BOARD ?auto_30278 ?auto_30280 ) ( not ( = ?auto_30279 ?auto_30278 ) ) ( SUPPORTS ?auto_30278 ?auto_30275 ) ( not ( = ?auto_30272 ?auto_30275 ) ) ( not ( = ?auto_30273 ?auto_30275 ) ) ( POINTING ?auto_30280 ?auto_30277 ) ( CALIBRATION_TARGET ?auto_30278 ?auto_30277 ) ( POWER_AVAIL ?auto_30280 ) )
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
      ?auto_30301 - INSTRUMENT
      ?auto_30302 - SATELLITE
      ?auto_30299 - DIRECTION
      ?auto_30300 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30301 ?auto_30302 ) ( SUPPORTS ?auto_30301 ?auto_30297 ) ( not ( = ?auto_30298 ?auto_30299 ) ) ( HAVE_IMAGE ?auto_30296 ?auto_30295 ) ( not ( = ?auto_30296 ?auto_30298 ) ) ( not ( = ?auto_30296 ?auto_30299 ) ) ( not ( = ?auto_30295 ?auto_30297 ) ) ( CALIBRATION_TARGET ?auto_30301 ?auto_30299 ) ( not ( = ?auto_30299 ?auto_30293 ) ) ( not ( = ?auto_30298 ?auto_30293 ) ) ( not ( = ?auto_30296 ?auto_30293 ) ) ( ON_BOARD ?auto_30300 ?auto_30302 ) ( not ( = ?auto_30301 ?auto_30300 ) ) ( SUPPORTS ?auto_30300 ?auto_30294 ) ( not ( = ?auto_30295 ?auto_30294 ) ) ( not ( = ?auto_30297 ?auto_30294 ) ) ( POINTING ?auto_30302 ?auto_30299 ) ( CALIBRATION_TARGET ?auto_30300 ?auto_30299 ) ( POWER_AVAIL ?auto_30302 ) )
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
      ?auto_30323 - INSTRUMENT
      ?auto_30324 - SATELLITE
      ?auto_30321 - DIRECTION
      ?auto_30322 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30323 ?auto_30324 ) ( SUPPORTS ?auto_30323 ?auto_30317 ) ( not ( = ?auto_30318 ?auto_30321 ) ) ( HAVE_IMAGE ?auto_30320 ?auto_30319 ) ( not ( = ?auto_30320 ?auto_30318 ) ) ( not ( = ?auto_30320 ?auto_30321 ) ) ( not ( = ?auto_30319 ?auto_30317 ) ) ( CALIBRATION_TARGET ?auto_30323 ?auto_30321 ) ( not ( = ?auto_30321 ?auto_30315 ) ) ( not ( = ?auto_30318 ?auto_30315 ) ) ( not ( = ?auto_30320 ?auto_30315 ) ) ( ON_BOARD ?auto_30322 ?auto_30324 ) ( not ( = ?auto_30323 ?auto_30322 ) ) ( SUPPORTS ?auto_30322 ?auto_30316 ) ( not ( = ?auto_30319 ?auto_30316 ) ) ( not ( = ?auto_30317 ?auto_30316 ) ) ( POINTING ?auto_30324 ?auto_30321 ) ( CALIBRATION_TARGET ?auto_30322 ?auto_30321 ) ( POWER_AVAIL ?auto_30324 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30320 ?auto_30319 ?auto_30318 ?auto_30317 )
      ( GET-3IMAGE-VERIFY ?auto_30315 ?auto_30316 ?auto_30318 ?auto_30317 ?auto_30320 ?auto_30319 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30349 - DIRECTION
      ?auto_30350 - MODE
      ?auto_30352 - DIRECTION
      ?auto_30351 - MODE
      ?auto_30354 - DIRECTION
      ?auto_30353 - MODE
    )
    :vars
    (
      ?auto_30359 - INSTRUMENT
      ?auto_30360 - SATELLITE
      ?auto_30355 - DIRECTION
      ?auto_30357 - DIRECTION
      ?auto_30356 - INSTRUMENT
      ?auto_30358 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_30359 ?auto_30360 ) ( SUPPORTS ?auto_30359 ?auto_30350 ) ( not ( = ?auto_30349 ?auto_30355 ) ) ( HAVE_IMAGE ?auto_30352 ?auto_30353 ) ( not ( = ?auto_30352 ?auto_30349 ) ) ( not ( = ?auto_30352 ?auto_30355 ) ) ( not ( = ?auto_30353 ?auto_30350 ) ) ( CALIBRATION_TARGET ?auto_30359 ?auto_30355 ) ( not ( = ?auto_30355 ?auto_30357 ) ) ( not ( = ?auto_30349 ?auto_30357 ) ) ( not ( = ?auto_30352 ?auto_30357 ) ) ( ON_BOARD ?auto_30356 ?auto_30360 ) ( not ( = ?auto_30359 ?auto_30356 ) ) ( SUPPORTS ?auto_30356 ?auto_30358 ) ( not ( = ?auto_30353 ?auto_30358 ) ) ( not ( = ?auto_30350 ?auto_30358 ) ) ( POINTING ?auto_30360 ?auto_30355 ) ( CALIBRATION_TARGET ?auto_30356 ?auto_30355 ) ( POWER_AVAIL ?auto_30360 ) ( HAVE_IMAGE ?auto_30352 ?auto_30351 ) ( HAVE_IMAGE ?auto_30354 ?auto_30353 ) ( not ( = ?auto_30349 ?auto_30354 ) ) ( not ( = ?auto_30350 ?auto_30351 ) ) ( not ( = ?auto_30352 ?auto_30354 ) ) ( not ( = ?auto_30351 ?auto_30353 ) ) ( not ( = ?auto_30351 ?auto_30358 ) ) ( not ( = ?auto_30354 ?auto_30355 ) ) ( not ( = ?auto_30354 ?auto_30357 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30352 ?auto_30353 ?auto_30349 ?auto_30350 )
      ( GET-3IMAGE-VERIFY ?auto_30349 ?auto_30350 ?auto_30352 ?auto_30351 ?auto_30354 ?auto_30353 ) )
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
      ?auto_30369 - INSTRUMENT
      ?auto_30370 - SATELLITE
      ?auto_30367 - DIRECTION
      ?auto_30368 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30369 ?auto_30370 ) ( SUPPORTS ?auto_30369 ?auto_30362 ) ( not ( = ?auto_30361 ?auto_30367 ) ) ( HAVE_IMAGE ?auto_30364 ?auto_30363 ) ( not ( = ?auto_30364 ?auto_30361 ) ) ( not ( = ?auto_30364 ?auto_30367 ) ) ( not ( = ?auto_30363 ?auto_30362 ) ) ( CALIBRATION_TARGET ?auto_30369 ?auto_30367 ) ( not ( = ?auto_30367 ?auto_30366 ) ) ( not ( = ?auto_30361 ?auto_30366 ) ) ( not ( = ?auto_30364 ?auto_30366 ) ) ( ON_BOARD ?auto_30368 ?auto_30370 ) ( not ( = ?auto_30369 ?auto_30368 ) ) ( SUPPORTS ?auto_30368 ?auto_30365 ) ( not ( = ?auto_30363 ?auto_30365 ) ) ( not ( = ?auto_30362 ?auto_30365 ) ) ( POINTING ?auto_30370 ?auto_30367 ) ( CALIBRATION_TARGET ?auto_30368 ?auto_30367 ) ( POWER_AVAIL ?auto_30370 ) )
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
      ?auto_30391 - INSTRUMENT
      ?auto_30392 - SATELLITE
      ?auto_30389 - DIRECTION
      ?auto_30390 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30391 ?auto_30392 ) ( SUPPORTS ?auto_30391 ?auto_30384 ) ( not ( = ?auto_30383 ?auto_30389 ) ) ( HAVE_IMAGE ?auto_30388 ?auto_30387 ) ( not ( = ?auto_30388 ?auto_30383 ) ) ( not ( = ?auto_30388 ?auto_30389 ) ) ( not ( = ?auto_30387 ?auto_30384 ) ) ( CALIBRATION_TARGET ?auto_30391 ?auto_30389 ) ( not ( = ?auto_30389 ?auto_30386 ) ) ( not ( = ?auto_30383 ?auto_30386 ) ) ( not ( = ?auto_30388 ?auto_30386 ) ) ( ON_BOARD ?auto_30390 ?auto_30392 ) ( not ( = ?auto_30391 ?auto_30390 ) ) ( SUPPORTS ?auto_30390 ?auto_30385 ) ( not ( = ?auto_30387 ?auto_30385 ) ) ( not ( = ?auto_30384 ?auto_30385 ) ) ( POINTING ?auto_30392 ?auto_30389 ) ( CALIBRATION_TARGET ?auto_30390 ?auto_30389 ) ( POWER_AVAIL ?auto_30392 ) )
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
      ?auto_30462 - INSTRUMENT
      ?auto_30463 - SATELLITE
      ?auto_30458 - DIRECTION
      ?auto_30457 - DIRECTION
      ?auto_30464 - MODE
      ?auto_30460 - DIRECTION
      ?auto_30459 - INSTRUMENT
      ?auto_30461 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_30462 ?auto_30463 ) ( SUPPORTS ?auto_30462 ?auto_30456 ) ( not ( = ?auto_30455 ?auto_30458 ) ) ( HAVE_IMAGE ?auto_30457 ?auto_30464 ) ( not ( = ?auto_30457 ?auto_30455 ) ) ( not ( = ?auto_30457 ?auto_30458 ) ) ( not ( = ?auto_30464 ?auto_30456 ) ) ( CALIBRATION_TARGET ?auto_30462 ?auto_30458 ) ( not ( = ?auto_30458 ?auto_30460 ) ) ( not ( = ?auto_30455 ?auto_30460 ) ) ( not ( = ?auto_30457 ?auto_30460 ) ) ( ON_BOARD ?auto_30459 ?auto_30463 ) ( not ( = ?auto_30462 ?auto_30459 ) ) ( SUPPORTS ?auto_30459 ?auto_30461 ) ( not ( = ?auto_30464 ?auto_30461 ) ) ( not ( = ?auto_30456 ?auto_30461 ) ) ( CALIBRATION_TARGET ?auto_30459 ?auto_30458 ) ( POWER_AVAIL ?auto_30463 ) ( POINTING ?auto_30463 ?auto_30457 ) )
    :subtasks
    ( ( !TURN_TO ?auto_30463 ?auto_30458 ?auto_30457 )
      ( GET-2IMAGE ?auto_30457 ?auto_30464 ?auto_30455 ?auto_30456 )
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
      ?auto_30474 - INSTRUMENT
      ?auto_30472 - SATELLITE
      ?auto_30470 - DIRECTION
      ?auto_30473 - DIRECTION
      ?auto_30469 - INSTRUMENT
      ?auto_30471 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_30474 ?auto_30472 ) ( SUPPORTS ?auto_30474 ?auto_30467 ) ( not ( = ?auto_30468 ?auto_30470 ) ) ( HAVE_IMAGE ?auto_30465 ?auto_30466 ) ( not ( = ?auto_30465 ?auto_30468 ) ) ( not ( = ?auto_30465 ?auto_30470 ) ) ( not ( = ?auto_30466 ?auto_30467 ) ) ( CALIBRATION_TARGET ?auto_30474 ?auto_30470 ) ( not ( = ?auto_30470 ?auto_30473 ) ) ( not ( = ?auto_30468 ?auto_30473 ) ) ( not ( = ?auto_30465 ?auto_30473 ) ) ( ON_BOARD ?auto_30469 ?auto_30472 ) ( not ( = ?auto_30474 ?auto_30469 ) ) ( SUPPORTS ?auto_30469 ?auto_30471 ) ( not ( = ?auto_30466 ?auto_30471 ) ) ( not ( = ?auto_30467 ?auto_30471 ) ) ( CALIBRATION_TARGET ?auto_30469 ?auto_30470 ) ( POWER_AVAIL ?auto_30472 ) ( POINTING ?auto_30472 ?auto_30465 ) )
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
      ?auto_30479 - INSTRUMENT
      ?auto_30482 - SATELLITE
      ?auto_30483 - DIRECTION
      ?auto_30481 - DIRECTION
      ?auto_30480 - MODE
      ?auto_30484 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30479 ?auto_30482 ) ( SUPPORTS ?auto_30479 ?auto_30477 ) ( not ( = ?auto_30478 ?auto_30483 ) ) ( HAVE_IMAGE ?auto_30481 ?auto_30480 ) ( not ( = ?auto_30481 ?auto_30478 ) ) ( not ( = ?auto_30481 ?auto_30483 ) ) ( not ( = ?auto_30480 ?auto_30477 ) ) ( CALIBRATION_TARGET ?auto_30479 ?auto_30483 ) ( not ( = ?auto_30483 ?auto_30475 ) ) ( not ( = ?auto_30478 ?auto_30475 ) ) ( not ( = ?auto_30481 ?auto_30475 ) ) ( ON_BOARD ?auto_30484 ?auto_30482 ) ( not ( = ?auto_30479 ?auto_30484 ) ) ( SUPPORTS ?auto_30484 ?auto_30476 ) ( not ( = ?auto_30480 ?auto_30476 ) ) ( not ( = ?auto_30477 ?auto_30476 ) ) ( CALIBRATION_TARGET ?auto_30484 ?auto_30483 ) ( POWER_AVAIL ?auto_30482 ) ( POINTING ?auto_30482 ?auto_30481 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30481 ?auto_30480 ?auto_30478 ?auto_30477 )
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
      ?auto_30489 - INSTRUMENT
      ?auto_30490 - SATELLITE
      ?auto_30492 - DIRECTION
      ?auto_30491 - DIRECTION
      ?auto_30493 - INSTRUMENT
      ?auto_30494 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_30489 ?auto_30490 ) ( SUPPORTS ?auto_30489 ?auto_30486 ) ( not ( = ?auto_30485 ?auto_30492 ) ) ( HAVE_IMAGE ?auto_30488 ?auto_30487 ) ( not ( = ?auto_30488 ?auto_30485 ) ) ( not ( = ?auto_30488 ?auto_30492 ) ) ( not ( = ?auto_30487 ?auto_30486 ) ) ( CALIBRATION_TARGET ?auto_30489 ?auto_30492 ) ( not ( = ?auto_30492 ?auto_30491 ) ) ( not ( = ?auto_30485 ?auto_30491 ) ) ( not ( = ?auto_30488 ?auto_30491 ) ) ( ON_BOARD ?auto_30493 ?auto_30490 ) ( not ( = ?auto_30489 ?auto_30493 ) ) ( SUPPORTS ?auto_30493 ?auto_30494 ) ( not ( = ?auto_30487 ?auto_30494 ) ) ( not ( = ?auto_30486 ?auto_30494 ) ) ( CALIBRATION_TARGET ?auto_30493 ?auto_30492 ) ( POWER_AVAIL ?auto_30490 ) ( POINTING ?auto_30490 ?auto_30488 ) )
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
      ?auto_30499 - INSTRUMENT
      ?auto_30502 - SATELLITE
      ?auto_30503 - DIRECTION
      ?auto_30501 - DIRECTION
      ?auto_30500 - MODE
      ?auto_30504 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30499 ?auto_30502 ) ( SUPPORTS ?auto_30499 ?auto_30496 ) ( not ( = ?auto_30495 ?auto_30503 ) ) ( HAVE_IMAGE ?auto_30501 ?auto_30500 ) ( not ( = ?auto_30501 ?auto_30495 ) ) ( not ( = ?auto_30501 ?auto_30503 ) ) ( not ( = ?auto_30500 ?auto_30496 ) ) ( CALIBRATION_TARGET ?auto_30499 ?auto_30503 ) ( not ( = ?auto_30503 ?auto_30498 ) ) ( not ( = ?auto_30495 ?auto_30498 ) ) ( not ( = ?auto_30501 ?auto_30498 ) ) ( ON_BOARD ?auto_30504 ?auto_30502 ) ( not ( = ?auto_30499 ?auto_30504 ) ) ( SUPPORTS ?auto_30504 ?auto_30497 ) ( not ( = ?auto_30500 ?auto_30497 ) ) ( not ( = ?auto_30496 ?auto_30497 ) ) ( CALIBRATION_TARGET ?auto_30504 ?auto_30503 ) ( POWER_AVAIL ?auto_30502 ) ( POINTING ?auto_30502 ?auto_30501 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30501 ?auto_30500 ?auto_30495 ?auto_30496 )
      ( GET-2IMAGE-VERIFY ?auto_30495 ?auto_30496 ?auto_30498 ?auto_30497 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30517 - DIRECTION
      ?auto_30518 - MODE
      ?auto_30520 - DIRECTION
      ?auto_30519 - MODE
      ?auto_30522 - DIRECTION
      ?auto_30521 - MODE
    )
    :vars
    (
      ?auto_30523 - INSTRUMENT
      ?auto_30524 - SATELLITE
      ?auto_30526 - DIRECTION
      ?auto_30525 - DIRECTION
      ?auto_30527 - INSTRUMENT
      ?auto_30528 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_30523 ?auto_30524 ) ( SUPPORTS ?auto_30523 ?auto_30521 ) ( not ( = ?auto_30522 ?auto_30526 ) ) ( HAVE_IMAGE ?auto_30517 ?auto_30518 ) ( not ( = ?auto_30517 ?auto_30522 ) ) ( not ( = ?auto_30517 ?auto_30526 ) ) ( not ( = ?auto_30518 ?auto_30521 ) ) ( CALIBRATION_TARGET ?auto_30523 ?auto_30526 ) ( not ( = ?auto_30526 ?auto_30525 ) ) ( not ( = ?auto_30522 ?auto_30525 ) ) ( not ( = ?auto_30517 ?auto_30525 ) ) ( ON_BOARD ?auto_30527 ?auto_30524 ) ( not ( = ?auto_30523 ?auto_30527 ) ) ( SUPPORTS ?auto_30527 ?auto_30528 ) ( not ( = ?auto_30518 ?auto_30528 ) ) ( not ( = ?auto_30521 ?auto_30528 ) ) ( CALIBRATION_TARGET ?auto_30527 ?auto_30526 ) ( POWER_AVAIL ?auto_30524 ) ( POINTING ?auto_30524 ?auto_30517 ) ( HAVE_IMAGE ?auto_30520 ?auto_30519 ) ( not ( = ?auto_30517 ?auto_30520 ) ) ( not ( = ?auto_30518 ?auto_30519 ) ) ( not ( = ?auto_30520 ?auto_30522 ) ) ( not ( = ?auto_30520 ?auto_30526 ) ) ( not ( = ?auto_30520 ?auto_30525 ) ) ( not ( = ?auto_30519 ?auto_30521 ) ) ( not ( = ?auto_30519 ?auto_30528 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30517 ?auto_30518 ?auto_30522 ?auto_30521 )
      ( GET-3IMAGE-VERIFY ?auto_30517 ?auto_30518 ?auto_30520 ?auto_30519 ?auto_30522 ?auto_30521 ) )
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
      ?auto_30535 - INSTRUMENT
      ?auto_30536 - SATELLITE
      ?auto_30537 - DIRECTION
      ?auto_30538 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30535 ?auto_30536 ) ( SUPPORTS ?auto_30535 ?auto_30533 ) ( not ( = ?auto_30534 ?auto_30537 ) ) ( HAVE_IMAGE ?auto_30529 ?auto_30530 ) ( not ( = ?auto_30529 ?auto_30534 ) ) ( not ( = ?auto_30529 ?auto_30537 ) ) ( not ( = ?auto_30530 ?auto_30533 ) ) ( CALIBRATION_TARGET ?auto_30535 ?auto_30537 ) ( not ( = ?auto_30537 ?auto_30532 ) ) ( not ( = ?auto_30534 ?auto_30532 ) ) ( not ( = ?auto_30529 ?auto_30532 ) ) ( ON_BOARD ?auto_30538 ?auto_30536 ) ( not ( = ?auto_30535 ?auto_30538 ) ) ( SUPPORTS ?auto_30538 ?auto_30531 ) ( not ( = ?auto_30530 ?auto_30531 ) ) ( not ( = ?auto_30533 ?auto_30531 ) ) ( CALIBRATION_TARGET ?auto_30538 ?auto_30537 ) ( POWER_AVAIL ?auto_30536 ) ( POINTING ?auto_30536 ?auto_30529 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30529 ?auto_30530 ?auto_30534 ?auto_30533 )
      ( GET-3IMAGE-VERIFY ?auto_30529 ?auto_30530 ?auto_30532 ?auto_30531 ?auto_30534 ?auto_30533 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30539 - DIRECTION
      ?auto_30540 - MODE
      ?auto_30542 - DIRECTION
      ?auto_30541 - MODE
      ?auto_30544 - DIRECTION
      ?auto_30543 - MODE
    )
    :vars
    (
      ?auto_30545 - INSTRUMENT
      ?auto_30546 - SATELLITE
      ?auto_30548 - DIRECTION
      ?auto_30547 - DIRECTION
      ?auto_30549 - INSTRUMENT
      ?auto_30550 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_30545 ?auto_30546 ) ( SUPPORTS ?auto_30545 ?auto_30541 ) ( not ( = ?auto_30542 ?auto_30548 ) ) ( HAVE_IMAGE ?auto_30544 ?auto_30543 ) ( not ( = ?auto_30544 ?auto_30542 ) ) ( not ( = ?auto_30544 ?auto_30548 ) ) ( not ( = ?auto_30543 ?auto_30541 ) ) ( CALIBRATION_TARGET ?auto_30545 ?auto_30548 ) ( not ( = ?auto_30548 ?auto_30547 ) ) ( not ( = ?auto_30542 ?auto_30547 ) ) ( not ( = ?auto_30544 ?auto_30547 ) ) ( ON_BOARD ?auto_30549 ?auto_30546 ) ( not ( = ?auto_30545 ?auto_30549 ) ) ( SUPPORTS ?auto_30549 ?auto_30550 ) ( not ( = ?auto_30543 ?auto_30550 ) ) ( not ( = ?auto_30541 ?auto_30550 ) ) ( CALIBRATION_TARGET ?auto_30549 ?auto_30548 ) ( POWER_AVAIL ?auto_30546 ) ( POINTING ?auto_30546 ?auto_30544 ) ( HAVE_IMAGE ?auto_30539 ?auto_30540 ) ( not ( = ?auto_30539 ?auto_30542 ) ) ( not ( = ?auto_30539 ?auto_30544 ) ) ( not ( = ?auto_30539 ?auto_30548 ) ) ( not ( = ?auto_30539 ?auto_30547 ) ) ( not ( = ?auto_30540 ?auto_30541 ) ) ( not ( = ?auto_30540 ?auto_30543 ) ) ( not ( = ?auto_30540 ?auto_30550 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30544 ?auto_30543 ?auto_30542 ?auto_30541 )
      ( GET-3IMAGE-VERIFY ?auto_30539 ?auto_30540 ?auto_30542 ?auto_30541 ?auto_30544 ?auto_30543 ) )
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
      ?auto_30557 - INSTRUMENT
      ?auto_30558 - SATELLITE
      ?auto_30559 - DIRECTION
      ?auto_30560 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30557 ?auto_30558 ) ( SUPPORTS ?auto_30557 ?auto_30553 ) ( not ( = ?auto_30554 ?auto_30559 ) ) ( HAVE_IMAGE ?auto_30551 ?auto_30552 ) ( not ( = ?auto_30551 ?auto_30554 ) ) ( not ( = ?auto_30551 ?auto_30559 ) ) ( not ( = ?auto_30552 ?auto_30553 ) ) ( CALIBRATION_TARGET ?auto_30557 ?auto_30559 ) ( not ( = ?auto_30559 ?auto_30556 ) ) ( not ( = ?auto_30554 ?auto_30556 ) ) ( not ( = ?auto_30551 ?auto_30556 ) ) ( ON_BOARD ?auto_30560 ?auto_30558 ) ( not ( = ?auto_30557 ?auto_30560 ) ) ( SUPPORTS ?auto_30560 ?auto_30555 ) ( not ( = ?auto_30552 ?auto_30555 ) ) ( not ( = ?auto_30553 ?auto_30555 ) ) ( CALIBRATION_TARGET ?auto_30560 ?auto_30559 ) ( POWER_AVAIL ?auto_30558 ) ( POINTING ?auto_30558 ?auto_30551 ) )
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
      ?auto_30579 - INSTRUMENT
      ?auto_30580 - SATELLITE
      ?auto_30581 - DIRECTION
      ?auto_30582 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30579 ?auto_30580 ) ( SUPPORTS ?auto_30579 ?auto_30577 ) ( not ( = ?auto_30578 ?auto_30581 ) ) ( HAVE_IMAGE ?auto_30576 ?auto_30575 ) ( not ( = ?auto_30576 ?auto_30578 ) ) ( not ( = ?auto_30576 ?auto_30581 ) ) ( not ( = ?auto_30575 ?auto_30577 ) ) ( CALIBRATION_TARGET ?auto_30579 ?auto_30581 ) ( not ( = ?auto_30581 ?auto_30573 ) ) ( not ( = ?auto_30578 ?auto_30573 ) ) ( not ( = ?auto_30576 ?auto_30573 ) ) ( ON_BOARD ?auto_30582 ?auto_30580 ) ( not ( = ?auto_30579 ?auto_30582 ) ) ( SUPPORTS ?auto_30582 ?auto_30574 ) ( not ( = ?auto_30575 ?auto_30574 ) ) ( not ( = ?auto_30577 ?auto_30574 ) ) ( CALIBRATION_TARGET ?auto_30582 ?auto_30581 ) ( POWER_AVAIL ?auto_30580 ) ( POINTING ?auto_30580 ?auto_30576 ) )
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
      ?auto_30601 - INSTRUMENT
      ?auto_30602 - SATELLITE
      ?auto_30603 - DIRECTION
      ?auto_30604 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30601 ?auto_30602 ) ( SUPPORTS ?auto_30601 ?auto_30597 ) ( not ( = ?auto_30598 ?auto_30603 ) ) ( HAVE_IMAGE ?auto_30600 ?auto_30599 ) ( not ( = ?auto_30600 ?auto_30598 ) ) ( not ( = ?auto_30600 ?auto_30603 ) ) ( not ( = ?auto_30599 ?auto_30597 ) ) ( CALIBRATION_TARGET ?auto_30601 ?auto_30603 ) ( not ( = ?auto_30603 ?auto_30595 ) ) ( not ( = ?auto_30598 ?auto_30595 ) ) ( not ( = ?auto_30600 ?auto_30595 ) ) ( ON_BOARD ?auto_30604 ?auto_30602 ) ( not ( = ?auto_30601 ?auto_30604 ) ) ( SUPPORTS ?auto_30604 ?auto_30596 ) ( not ( = ?auto_30599 ?auto_30596 ) ) ( not ( = ?auto_30597 ?auto_30596 ) ) ( CALIBRATION_TARGET ?auto_30604 ?auto_30603 ) ( POWER_AVAIL ?auto_30602 ) ( POINTING ?auto_30602 ?auto_30600 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30600 ?auto_30599 ?auto_30598 ?auto_30597 )
      ( GET-3IMAGE-VERIFY ?auto_30595 ?auto_30596 ?auto_30598 ?auto_30597 ?auto_30600 ?auto_30599 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30629 - DIRECTION
      ?auto_30630 - MODE
      ?auto_30632 - DIRECTION
      ?auto_30631 - MODE
      ?auto_30634 - DIRECTION
      ?auto_30633 - MODE
    )
    :vars
    (
      ?auto_30635 - INSTRUMENT
      ?auto_30636 - SATELLITE
      ?auto_30638 - DIRECTION
      ?auto_30637 - DIRECTION
      ?auto_30639 - INSTRUMENT
      ?auto_30640 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_30635 ?auto_30636 ) ( SUPPORTS ?auto_30635 ?auto_30630 ) ( not ( = ?auto_30629 ?auto_30638 ) ) ( HAVE_IMAGE ?auto_30632 ?auto_30633 ) ( not ( = ?auto_30632 ?auto_30629 ) ) ( not ( = ?auto_30632 ?auto_30638 ) ) ( not ( = ?auto_30633 ?auto_30630 ) ) ( CALIBRATION_TARGET ?auto_30635 ?auto_30638 ) ( not ( = ?auto_30638 ?auto_30637 ) ) ( not ( = ?auto_30629 ?auto_30637 ) ) ( not ( = ?auto_30632 ?auto_30637 ) ) ( ON_BOARD ?auto_30639 ?auto_30636 ) ( not ( = ?auto_30635 ?auto_30639 ) ) ( SUPPORTS ?auto_30639 ?auto_30640 ) ( not ( = ?auto_30633 ?auto_30640 ) ) ( not ( = ?auto_30630 ?auto_30640 ) ) ( CALIBRATION_TARGET ?auto_30639 ?auto_30638 ) ( POWER_AVAIL ?auto_30636 ) ( POINTING ?auto_30636 ?auto_30632 ) ( HAVE_IMAGE ?auto_30632 ?auto_30631 ) ( HAVE_IMAGE ?auto_30634 ?auto_30633 ) ( not ( = ?auto_30629 ?auto_30634 ) ) ( not ( = ?auto_30630 ?auto_30631 ) ) ( not ( = ?auto_30632 ?auto_30634 ) ) ( not ( = ?auto_30631 ?auto_30633 ) ) ( not ( = ?auto_30631 ?auto_30640 ) ) ( not ( = ?auto_30634 ?auto_30638 ) ) ( not ( = ?auto_30634 ?auto_30637 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30632 ?auto_30633 ?auto_30629 ?auto_30630 )
      ( GET-3IMAGE-VERIFY ?auto_30629 ?auto_30630 ?auto_30632 ?auto_30631 ?auto_30634 ?auto_30633 ) )
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
      ?auto_30647 - INSTRUMENT
      ?auto_30648 - SATELLITE
      ?auto_30649 - DIRECTION
      ?auto_30650 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30647 ?auto_30648 ) ( SUPPORTS ?auto_30647 ?auto_30642 ) ( not ( = ?auto_30641 ?auto_30649 ) ) ( HAVE_IMAGE ?auto_30644 ?auto_30643 ) ( not ( = ?auto_30644 ?auto_30641 ) ) ( not ( = ?auto_30644 ?auto_30649 ) ) ( not ( = ?auto_30643 ?auto_30642 ) ) ( CALIBRATION_TARGET ?auto_30647 ?auto_30649 ) ( not ( = ?auto_30649 ?auto_30646 ) ) ( not ( = ?auto_30641 ?auto_30646 ) ) ( not ( = ?auto_30644 ?auto_30646 ) ) ( ON_BOARD ?auto_30650 ?auto_30648 ) ( not ( = ?auto_30647 ?auto_30650 ) ) ( SUPPORTS ?auto_30650 ?auto_30645 ) ( not ( = ?auto_30643 ?auto_30645 ) ) ( not ( = ?auto_30642 ?auto_30645 ) ) ( CALIBRATION_TARGET ?auto_30650 ?auto_30649 ) ( POWER_AVAIL ?auto_30648 ) ( POINTING ?auto_30648 ?auto_30644 ) )
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
      ?auto_30669 - INSTRUMENT
      ?auto_30670 - SATELLITE
      ?auto_30671 - DIRECTION
      ?auto_30672 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30669 ?auto_30670 ) ( SUPPORTS ?auto_30669 ?auto_30664 ) ( not ( = ?auto_30663 ?auto_30671 ) ) ( HAVE_IMAGE ?auto_30668 ?auto_30667 ) ( not ( = ?auto_30668 ?auto_30663 ) ) ( not ( = ?auto_30668 ?auto_30671 ) ) ( not ( = ?auto_30667 ?auto_30664 ) ) ( CALIBRATION_TARGET ?auto_30669 ?auto_30671 ) ( not ( = ?auto_30671 ?auto_30666 ) ) ( not ( = ?auto_30663 ?auto_30666 ) ) ( not ( = ?auto_30668 ?auto_30666 ) ) ( ON_BOARD ?auto_30672 ?auto_30670 ) ( not ( = ?auto_30669 ?auto_30672 ) ) ( SUPPORTS ?auto_30672 ?auto_30665 ) ( not ( = ?auto_30667 ?auto_30665 ) ) ( not ( = ?auto_30664 ?auto_30665 ) ) ( CALIBRATION_TARGET ?auto_30672 ?auto_30671 ) ( POWER_AVAIL ?auto_30670 ) ( POINTING ?auto_30670 ?auto_30668 ) )
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
      ?auto_30737 - INSTRUMENT
      ?auto_30740 - SATELLITE
      ?auto_30742 - DIRECTION
      ?auto_30739 - DIRECTION
      ?auto_30738 - MODE
      ?auto_30741 - DIRECTION
      ?auto_30743 - INSTRUMENT
      ?auto_30744 - MODE
      ?auto_30745 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30737 ?auto_30740 ) ( SUPPORTS ?auto_30737 ?auto_30736 ) ( not ( = ?auto_30735 ?auto_30742 ) ) ( HAVE_IMAGE ?auto_30739 ?auto_30738 ) ( not ( = ?auto_30739 ?auto_30735 ) ) ( not ( = ?auto_30739 ?auto_30742 ) ) ( not ( = ?auto_30738 ?auto_30736 ) ) ( CALIBRATION_TARGET ?auto_30737 ?auto_30742 ) ( not ( = ?auto_30742 ?auto_30741 ) ) ( not ( = ?auto_30735 ?auto_30741 ) ) ( not ( = ?auto_30739 ?auto_30741 ) ) ( ON_BOARD ?auto_30743 ?auto_30740 ) ( not ( = ?auto_30737 ?auto_30743 ) ) ( SUPPORTS ?auto_30743 ?auto_30744 ) ( not ( = ?auto_30738 ?auto_30744 ) ) ( not ( = ?auto_30736 ?auto_30744 ) ) ( CALIBRATION_TARGET ?auto_30743 ?auto_30742 ) ( POINTING ?auto_30740 ?auto_30739 ) ( ON_BOARD ?auto_30745 ?auto_30740 ) ( POWER_ON ?auto_30745 ) ( not ( = ?auto_30737 ?auto_30745 ) ) ( not ( = ?auto_30743 ?auto_30745 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_30745 ?auto_30740 )
      ( GET-2IMAGE ?auto_30739 ?auto_30738 ?auto_30735 ?auto_30736 )
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
      ?auto_30752 - SATELLITE
      ?auto_30751 - DIRECTION
      ?auto_30750 - DIRECTION
      ?auto_30753 - INSTRUMENT
      ?auto_30755 - MODE
      ?auto_30756 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30754 ?auto_30752 ) ( SUPPORTS ?auto_30754 ?auto_30748 ) ( not ( = ?auto_30749 ?auto_30751 ) ) ( HAVE_IMAGE ?auto_30746 ?auto_30747 ) ( not ( = ?auto_30746 ?auto_30749 ) ) ( not ( = ?auto_30746 ?auto_30751 ) ) ( not ( = ?auto_30747 ?auto_30748 ) ) ( CALIBRATION_TARGET ?auto_30754 ?auto_30751 ) ( not ( = ?auto_30751 ?auto_30750 ) ) ( not ( = ?auto_30749 ?auto_30750 ) ) ( not ( = ?auto_30746 ?auto_30750 ) ) ( ON_BOARD ?auto_30753 ?auto_30752 ) ( not ( = ?auto_30754 ?auto_30753 ) ) ( SUPPORTS ?auto_30753 ?auto_30755 ) ( not ( = ?auto_30747 ?auto_30755 ) ) ( not ( = ?auto_30748 ?auto_30755 ) ) ( CALIBRATION_TARGET ?auto_30753 ?auto_30751 ) ( POINTING ?auto_30752 ?auto_30746 ) ( ON_BOARD ?auto_30756 ?auto_30752 ) ( POWER_ON ?auto_30756 ) ( not ( = ?auto_30754 ?auto_30756 ) ) ( not ( = ?auto_30753 ?auto_30756 ) ) )
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
      ?auto_30762 - INSTRUMENT
      ?auto_30763 - SATELLITE
      ?auto_30761 - DIRECTION
      ?auto_30767 - DIRECTION
      ?auto_30766 - MODE
      ?auto_30765 - INSTRUMENT
      ?auto_30764 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30762 ?auto_30763 ) ( SUPPORTS ?auto_30762 ?auto_30759 ) ( not ( = ?auto_30760 ?auto_30761 ) ) ( HAVE_IMAGE ?auto_30767 ?auto_30766 ) ( not ( = ?auto_30767 ?auto_30760 ) ) ( not ( = ?auto_30767 ?auto_30761 ) ) ( not ( = ?auto_30766 ?auto_30759 ) ) ( CALIBRATION_TARGET ?auto_30762 ?auto_30761 ) ( not ( = ?auto_30761 ?auto_30757 ) ) ( not ( = ?auto_30760 ?auto_30757 ) ) ( not ( = ?auto_30767 ?auto_30757 ) ) ( ON_BOARD ?auto_30765 ?auto_30763 ) ( not ( = ?auto_30762 ?auto_30765 ) ) ( SUPPORTS ?auto_30765 ?auto_30758 ) ( not ( = ?auto_30766 ?auto_30758 ) ) ( not ( = ?auto_30759 ?auto_30758 ) ) ( CALIBRATION_TARGET ?auto_30765 ?auto_30761 ) ( POINTING ?auto_30763 ?auto_30767 ) ( ON_BOARD ?auto_30764 ?auto_30763 ) ( POWER_ON ?auto_30764 ) ( not ( = ?auto_30762 ?auto_30764 ) ) ( not ( = ?auto_30765 ?auto_30764 ) ) )
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
      ?auto_30775 - INSTRUMENT
      ?auto_30776 - SATELLITE
      ?auto_30774 - DIRECTION
      ?auto_30773 - DIRECTION
      ?auto_30778 - INSTRUMENT
      ?auto_30772 - MODE
      ?auto_30777 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30775 ?auto_30776 ) ( SUPPORTS ?auto_30775 ?auto_30769 ) ( not ( = ?auto_30768 ?auto_30774 ) ) ( HAVE_IMAGE ?auto_30771 ?auto_30770 ) ( not ( = ?auto_30771 ?auto_30768 ) ) ( not ( = ?auto_30771 ?auto_30774 ) ) ( not ( = ?auto_30770 ?auto_30769 ) ) ( CALIBRATION_TARGET ?auto_30775 ?auto_30774 ) ( not ( = ?auto_30774 ?auto_30773 ) ) ( not ( = ?auto_30768 ?auto_30773 ) ) ( not ( = ?auto_30771 ?auto_30773 ) ) ( ON_BOARD ?auto_30778 ?auto_30776 ) ( not ( = ?auto_30775 ?auto_30778 ) ) ( SUPPORTS ?auto_30778 ?auto_30772 ) ( not ( = ?auto_30770 ?auto_30772 ) ) ( not ( = ?auto_30769 ?auto_30772 ) ) ( CALIBRATION_TARGET ?auto_30778 ?auto_30774 ) ( POINTING ?auto_30776 ?auto_30771 ) ( ON_BOARD ?auto_30777 ?auto_30776 ) ( POWER_ON ?auto_30777 ) ( not ( = ?auto_30775 ?auto_30777 ) ) ( not ( = ?auto_30778 ?auto_30777 ) ) )
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
      ?auto_30784 - INSTRUMENT
      ?auto_30785 - SATELLITE
      ?auto_30783 - DIRECTION
      ?auto_30789 - DIRECTION
      ?auto_30788 - MODE
      ?auto_30787 - INSTRUMENT
      ?auto_30786 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30784 ?auto_30785 ) ( SUPPORTS ?auto_30784 ?auto_30780 ) ( not ( = ?auto_30779 ?auto_30783 ) ) ( HAVE_IMAGE ?auto_30789 ?auto_30788 ) ( not ( = ?auto_30789 ?auto_30779 ) ) ( not ( = ?auto_30789 ?auto_30783 ) ) ( not ( = ?auto_30788 ?auto_30780 ) ) ( CALIBRATION_TARGET ?auto_30784 ?auto_30783 ) ( not ( = ?auto_30783 ?auto_30782 ) ) ( not ( = ?auto_30779 ?auto_30782 ) ) ( not ( = ?auto_30789 ?auto_30782 ) ) ( ON_BOARD ?auto_30787 ?auto_30785 ) ( not ( = ?auto_30784 ?auto_30787 ) ) ( SUPPORTS ?auto_30787 ?auto_30781 ) ( not ( = ?auto_30788 ?auto_30781 ) ) ( not ( = ?auto_30780 ?auto_30781 ) ) ( CALIBRATION_TARGET ?auto_30787 ?auto_30783 ) ( POINTING ?auto_30785 ?auto_30789 ) ( ON_BOARD ?auto_30786 ?auto_30785 ) ( POWER_ON ?auto_30786 ) ( not ( = ?auto_30784 ?auto_30786 ) ) ( not ( = ?auto_30787 ?auto_30786 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30789 ?auto_30788 ?auto_30779 ?auto_30780 )
      ( GET-2IMAGE-VERIFY ?auto_30779 ?auto_30780 ?auto_30782 ?auto_30781 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30803 - DIRECTION
      ?auto_30804 - MODE
      ?auto_30806 - DIRECTION
      ?auto_30805 - MODE
      ?auto_30808 - DIRECTION
      ?auto_30807 - MODE
    )
    :vars
    (
      ?auto_30812 - INSTRUMENT
      ?auto_30813 - SATELLITE
      ?auto_30811 - DIRECTION
      ?auto_30810 - DIRECTION
      ?auto_30815 - INSTRUMENT
      ?auto_30809 - MODE
      ?auto_30814 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30812 ?auto_30813 ) ( SUPPORTS ?auto_30812 ?auto_30807 ) ( not ( = ?auto_30808 ?auto_30811 ) ) ( HAVE_IMAGE ?auto_30803 ?auto_30804 ) ( not ( = ?auto_30803 ?auto_30808 ) ) ( not ( = ?auto_30803 ?auto_30811 ) ) ( not ( = ?auto_30804 ?auto_30807 ) ) ( CALIBRATION_TARGET ?auto_30812 ?auto_30811 ) ( not ( = ?auto_30811 ?auto_30810 ) ) ( not ( = ?auto_30808 ?auto_30810 ) ) ( not ( = ?auto_30803 ?auto_30810 ) ) ( ON_BOARD ?auto_30815 ?auto_30813 ) ( not ( = ?auto_30812 ?auto_30815 ) ) ( SUPPORTS ?auto_30815 ?auto_30809 ) ( not ( = ?auto_30804 ?auto_30809 ) ) ( not ( = ?auto_30807 ?auto_30809 ) ) ( CALIBRATION_TARGET ?auto_30815 ?auto_30811 ) ( POINTING ?auto_30813 ?auto_30803 ) ( ON_BOARD ?auto_30814 ?auto_30813 ) ( POWER_ON ?auto_30814 ) ( not ( = ?auto_30812 ?auto_30814 ) ) ( not ( = ?auto_30815 ?auto_30814 ) ) ( HAVE_IMAGE ?auto_30806 ?auto_30805 ) ( not ( = ?auto_30803 ?auto_30806 ) ) ( not ( = ?auto_30804 ?auto_30805 ) ) ( not ( = ?auto_30806 ?auto_30808 ) ) ( not ( = ?auto_30806 ?auto_30811 ) ) ( not ( = ?auto_30806 ?auto_30810 ) ) ( not ( = ?auto_30805 ?auto_30807 ) ) ( not ( = ?auto_30805 ?auto_30809 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30803 ?auto_30804 ?auto_30808 ?auto_30807 )
      ( GET-3IMAGE-VERIFY ?auto_30803 ?auto_30804 ?auto_30806 ?auto_30805 ?auto_30808 ?auto_30807 ) )
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
      ?auto_30823 - INSTRUMENT
      ?auto_30824 - SATELLITE
      ?auto_30822 - DIRECTION
      ?auto_30826 - INSTRUMENT
      ?auto_30825 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30823 ?auto_30824 ) ( SUPPORTS ?auto_30823 ?auto_30820 ) ( not ( = ?auto_30821 ?auto_30822 ) ) ( HAVE_IMAGE ?auto_30816 ?auto_30817 ) ( not ( = ?auto_30816 ?auto_30821 ) ) ( not ( = ?auto_30816 ?auto_30822 ) ) ( not ( = ?auto_30817 ?auto_30820 ) ) ( CALIBRATION_TARGET ?auto_30823 ?auto_30822 ) ( not ( = ?auto_30822 ?auto_30819 ) ) ( not ( = ?auto_30821 ?auto_30819 ) ) ( not ( = ?auto_30816 ?auto_30819 ) ) ( ON_BOARD ?auto_30826 ?auto_30824 ) ( not ( = ?auto_30823 ?auto_30826 ) ) ( SUPPORTS ?auto_30826 ?auto_30818 ) ( not ( = ?auto_30817 ?auto_30818 ) ) ( not ( = ?auto_30820 ?auto_30818 ) ) ( CALIBRATION_TARGET ?auto_30826 ?auto_30822 ) ( POINTING ?auto_30824 ?auto_30816 ) ( ON_BOARD ?auto_30825 ?auto_30824 ) ( POWER_ON ?auto_30825 ) ( not ( = ?auto_30823 ?auto_30825 ) ) ( not ( = ?auto_30826 ?auto_30825 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30816 ?auto_30817 ?auto_30821 ?auto_30820 )
      ( GET-3IMAGE-VERIFY ?auto_30816 ?auto_30817 ?auto_30819 ?auto_30818 ?auto_30821 ?auto_30820 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30827 - DIRECTION
      ?auto_30828 - MODE
      ?auto_30830 - DIRECTION
      ?auto_30829 - MODE
      ?auto_30832 - DIRECTION
      ?auto_30831 - MODE
    )
    :vars
    (
      ?auto_30836 - INSTRUMENT
      ?auto_30837 - SATELLITE
      ?auto_30835 - DIRECTION
      ?auto_30834 - DIRECTION
      ?auto_30839 - INSTRUMENT
      ?auto_30833 - MODE
      ?auto_30838 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30836 ?auto_30837 ) ( SUPPORTS ?auto_30836 ?auto_30829 ) ( not ( = ?auto_30830 ?auto_30835 ) ) ( HAVE_IMAGE ?auto_30832 ?auto_30831 ) ( not ( = ?auto_30832 ?auto_30830 ) ) ( not ( = ?auto_30832 ?auto_30835 ) ) ( not ( = ?auto_30831 ?auto_30829 ) ) ( CALIBRATION_TARGET ?auto_30836 ?auto_30835 ) ( not ( = ?auto_30835 ?auto_30834 ) ) ( not ( = ?auto_30830 ?auto_30834 ) ) ( not ( = ?auto_30832 ?auto_30834 ) ) ( ON_BOARD ?auto_30839 ?auto_30837 ) ( not ( = ?auto_30836 ?auto_30839 ) ) ( SUPPORTS ?auto_30839 ?auto_30833 ) ( not ( = ?auto_30831 ?auto_30833 ) ) ( not ( = ?auto_30829 ?auto_30833 ) ) ( CALIBRATION_TARGET ?auto_30839 ?auto_30835 ) ( POINTING ?auto_30837 ?auto_30832 ) ( ON_BOARD ?auto_30838 ?auto_30837 ) ( POWER_ON ?auto_30838 ) ( not ( = ?auto_30836 ?auto_30838 ) ) ( not ( = ?auto_30839 ?auto_30838 ) ) ( HAVE_IMAGE ?auto_30827 ?auto_30828 ) ( not ( = ?auto_30827 ?auto_30830 ) ) ( not ( = ?auto_30827 ?auto_30832 ) ) ( not ( = ?auto_30827 ?auto_30835 ) ) ( not ( = ?auto_30827 ?auto_30834 ) ) ( not ( = ?auto_30828 ?auto_30829 ) ) ( not ( = ?auto_30828 ?auto_30831 ) ) ( not ( = ?auto_30828 ?auto_30833 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30832 ?auto_30831 ?auto_30830 ?auto_30829 )
      ( GET-3IMAGE-VERIFY ?auto_30827 ?auto_30828 ?auto_30830 ?auto_30829 ?auto_30832 ?auto_30831 ) )
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
      ?auto_30847 - INSTRUMENT
      ?auto_30848 - SATELLITE
      ?auto_30846 - DIRECTION
      ?auto_30850 - INSTRUMENT
      ?auto_30849 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30847 ?auto_30848 ) ( SUPPORTS ?auto_30847 ?auto_30842 ) ( not ( = ?auto_30843 ?auto_30846 ) ) ( HAVE_IMAGE ?auto_30840 ?auto_30841 ) ( not ( = ?auto_30840 ?auto_30843 ) ) ( not ( = ?auto_30840 ?auto_30846 ) ) ( not ( = ?auto_30841 ?auto_30842 ) ) ( CALIBRATION_TARGET ?auto_30847 ?auto_30846 ) ( not ( = ?auto_30846 ?auto_30845 ) ) ( not ( = ?auto_30843 ?auto_30845 ) ) ( not ( = ?auto_30840 ?auto_30845 ) ) ( ON_BOARD ?auto_30850 ?auto_30848 ) ( not ( = ?auto_30847 ?auto_30850 ) ) ( SUPPORTS ?auto_30850 ?auto_30844 ) ( not ( = ?auto_30841 ?auto_30844 ) ) ( not ( = ?auto_30842 ?auto_30844 ) ) ( CALIBRATION_TARGET ?auto_30850 ?auto_30846 ) ( POINTING ?auto_30848 ?auto_30840 ) ( ON_BOARD ?auto_30849 ?auto_30848 ) ( POWER_ON ?auto_30849 ) ( not ( = ?auto_30847 ?auto_30849 ) ) ( not ( = ?auto_30850 ?auto_30849 ) ) )
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
      ?auto_30871 - INSTRUMENT
      ?auto_30872 - SATELLITE
      ?auto_30870 - DIRECTION
      ?auto_30874 - INSTRUMENT
      ?auto_30873 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30871 ?auto_30872 ) ( SUPPORTS ?auto_30871 ?auto_30868 ) ( not ( = ?auto_30869 ?auto_30870 ) ) ( HAVE_IMAGE ?auto_30867 ?auto_30866 ) ( not ( = ?auto_30867 ?auto_30869 ) ) ( not ( = ?auto_30867 ?auto_30870 ) ) ( not ( = ?auto_30866 ?auto_30868 ) ) ( CALIBRATION_TARGET ?auto_30871 ?auto_30870 ) ( not ( = ?auto_30870 ?auto_30864 ) ) ( not ( = ?auto_30869 ?auto_30864 ) ) ( not ( = ?auto_30867 ?auto_30864 ) ) ( ON_BOARD ?auto_30874 ?auto_30872 ) ( not ( = ?auto_30871 ?auto_30874 ) ) ( SUPPORTS ?auto_30874 ?auto_30865 ) ( not ( = ?auto_30866 ?auto_30865 ) ) ( not ( = ?auto_30868 ?auto_30865 ) ) ( CALIBRATION_TARGET ?auto_30874 ?auto_30870 ) ( POINTING ?auto_30872 ?auto_30867 ) ( ON_BOARD ?auto_30873 ?auto_30872 ) ( POWER_ON ?auto_30873 ) ( not ( = ?auto_30871 ?auto_30873 ) ) ( not ( = ?auto_30874 ?auto_30873 ) ) )
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
      ?auto_30895 - INSTRUMENT
      ?auto_30896 - SATELLITE
      ?auto_30894 - DIRECTION
      ?auto_30898 - INSTRUMENT
      ?auto_30897 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30895 ?auto_30896 ) ( SUPPORTS ?auto_30895 ?auto_30890 ) ( not ( = ?auto_30891 ?auto_30894 ) ) ( HAVE_IMAGE ?auto_30893 ?auto_30892 ) ( not ( = ?auto_30893 ?auto_30891 ) ) ( not ( = ?auto_30893 ?auto_30894 ) ) ( not ( = ?auto_30892 ?auto_30890 ) ) ( CALIBRATION_TARGET ?auto_30895 ?auto_30894 ) ( not ( = ?auto_30894 ?auto_30888 ) ) ( not ( = ?auto_30891 ?auto_30888 ) ) ( not ( = ?auto_30893 ?auto_30888 ) ) ( ON_BOARD ?auto_30898 ?auto_30896 ) ( not ( = ?auto_30895 ?auto_30898 ) ) ( SUPPORTS ?auto_30898 ?auto_30889 ) ( not ( = ?auto_30892 ?auto_30889 ) ) ( not ( = ?auto_30890 ?auto_30889 ) ) ( CALIBRATION_TARGET ?auto_30898 ?auto_30894 ) ( POINTING ?auto_30896 ?auto_30893 ) ( ON_BOARD ?auto_30897 ?auto_30896 ) ( POWER_ON ?auto_30897 ) ( not ( = ?auto_30895 ?auto_30897 ) ) ( not ( = ?auto_30898 ?auto_30897 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30893 ?auto_30892 ?auto_30891 ?auto_30890 )
      ( GET-3IMAGE-VERIFY ?auto_30888 ?auto_30889 ?auto_30891 ?auto_30890 ?auto_30893 ?auto_30892 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30925 - DIRECTION
      ?auto_30926 - MODE
      ?auto_30928 - DIRECTION
      ?auto_30927 - MODE
      ?auto_30930 - DIRECTION
      ?auto_30929 - MODE
    )
    :vars
    (
      ?auto_30934 - INSTRUMENT
      ?auto_30935 - SATELLITE
      ?auto_30933 - DIRECTION
      ?auto_30932 - DIRECTION
      ?auto_30937 - INSTRUMENT
      ?auto_30931 - MODE
      ?auto_30936 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30934 ?auto_30935 ) ( SUPPORTS ?auto_30934 ?auto_30926 ) ( not ( = ?auto_30925 ?auto_30933 ) ) ( HAVE_IMAGE ?auto_30930 ?auto_30929 ) ( not ( = ?auto_30930 ?auto_30925 ) ) ( not ( = ?auto_30930 ?auto_30933 ) ) ( not ( = ?auto_30929 ?auto_30926 ) ) ( CALIBRATION_TARGET ?auto_30934 ?auto_30933 ) ( not ( = ?auto_30933 ?auto_30932 ) ) ( not ( = ?auto_30925 ?auto_30932 ) ) ( not ( = ?auto_30930 ?auto_30932 ) ) ( ON_BOARD ?auto_30937 ?auto_30935 ) ( not ( = ?auto_30934 ?auto_30937 ) ) ( SUPPORTS ?auto_30937 ?auto_30931 ) ( not ( = ?auto_30929 ?auto_30931 ) ) ( not ( = ?auto_30926 ?auto_30931 ) ) ( CALIBRATION_TARGET ?auto_30937 ?auto_30933 ) ( POINTING ?auto_30935 ?auto_30930 ) ( ON_BOARD ?auto_30936 ?auto_30935 ) ( POWER_ON ?auto_30936 ) ( not ( = ?auto_30934 ?auto_30936 ) ) ( not ( = ?auto_30937 ?auto_30936 ) ) ( HAVE_IMAGE ?auto_30928 ?auto_30927 ) ( not ( = ?auto_30925 ?auto_30928 ) ) ( not ( = ?auto_30926 ?auto_30927 ) ) ( not ( = ?auto_30928 ?auto_30930 ) ) ( not ( = ?auto_30928 ?auto_30933 ) ) ( not ( = ?auto_30928 ?auto_30932 ) ) ( not ( = ?auto_30927 ?auto_30929 ) ) ( not ( = ?auto_30927 ?auto_30931 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30930 ?auto_30929 ?auto_30925 ?auto_30926 )
      ( GET-3IMAGE-VERIFY ?auto_30925 ?auto_30926 ?auto_30928 ?auto_30927 ?auto_30930 ?auto_30929 ) )
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
      ?auto_30945 - INSTRUMENT
      ?auto_30946 - SATELLITE
      ?auto_30944 - DIRECTION
      ?auto_30948 - INSTRUMENT
      ?auto_30947 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30945 ?auto_30946 ) ( SUPPORTS ?auto_30945 ?auto_30939 ) ( not ( = ?auto_30938 ?auto_30944 ) ) ( HAVE_IMAGE ?auto_30941 ?auto_30940 ) ( not ( = ?auto_30941 ?auto_30938 ) ) ( not ( = ?auto_30941 ?auto_30944 ) ) ( not ( = ?auto_30940 ?auto_30939 ) ) ( CALIBRATION_TARGET ?auto_30945 ?auto_30944 ) ( not ( = ?auto_30944 ?auto_30943 ) ) ( not ( = ?auto_30938 ?auto_30943 ) ) ( not ( = ?auto_30941 ?auto_30943 ) ) ( ON_BOARD ?auto_30948 ?auto_30946 ) ( not ( = ?auto_30945 ?auto_30948 ) ) ( SUPPORTS ?auto_30948 ?auto_30942 ) ( not ( = ?auto_30940 ?auto_30942 ) ) ( not ( = ?auto_30939 ?auto_30942 ) ) ( CALIBRATION_TARGET ?auto_30948 ?auto_30944 ) ( POINTING ?auto_30946 ?auto_30941 ) ( ON_BOARD ?auto_30947 ?auto_30946 ) ( POWER_ON ?auto_30947 ) ( not ( = ?auto_30945 ?auto_30947 ) ) ( not ( = ?auto_30948 ?auto_30947 ) ) )
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
      ?auto_30969 - INSTRUMENT
      ?auto_30970 - SATELLITE
      ?auto_30968 - DIRECTION
      ?auto_30972 - INSTRUMENT
      ?auto_30971 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30969 ?auto_30970 ) ( SUPPORTS ?auto_30969 ?auto_30963 ) ( not ( = ?auto_30962 ?auto_30968 ) ) ( HAVE_IMAGE ?auto_30967 ?auto_30966 ) ( not ( = ?auto_30967 ?auto_30962 ) ) ( not ( = ?auto_30967 ?auto_30968 ) ) ( not ( = ?auto_30966 ?auto_30963 ) ) ( CALIBRATION_TARGET ?auto_30969 ?auto_30968 ) ( not ( = ?auto_30968 ?auto_30965 ) ) ( not ( = ?auto_30962 ?auto_30965 ) ) ( not ( = ?auto_30967 ?auto_30965 ) ) ( ON_BOARD ?auto_30972 ?auto_30970 ) ( not ( = ?auto_30969 ?auto_30972 ) ) ( SUPPORTS ?auto_30972 ?auto_30964 ) ( not ( = ?auto_30966 ?auto_30964 ) ) ( not ( = ?auto_30963 ?auto_30964 ) ) ( CALIBRATION_TARGET ?auto_30972 ?auto_30968 ) ( POINTING ?auto_30970 ?auto_30967 ) ( ON_BOARD ?auto_30971 ?auto_30970 ) ( POWER_ON ?auto_30971 ) ( not ( = ?auto_30969 ?auto_30971 ) ) ( not ( = ?auto_30972 ?auto_30971 ) ) )
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
      ?auto_31045 - INSTRUMENT
      ?auto_31046 - SATELLITE
      ?auto_31044 - DIRECTION
      ?auto_31050 - DIRECTION
      ?auto_31049 - MODE
      ?auto_31043 - DIRECTION
      ?auto_31048 - INSTRUMENT
      ?auto_31042 - MODE
      ?auto_31047 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31045 ?auto_31046 ) ( SUPPORTS ?auto_31045 ?auto_31041 ) ( not ( = ?auto_31040 ?auto_31044 ) ) ( not ( = ?auto_31050 ?auto_31040 ) ) ( not ( = ?auto_31050 ?auto_31044 ) ) ( not ( = ?auto_31049 ?auto_31041 ) ) ( CALIBRATION_TARGET ?auto_31045 ?auto_31044 ) ( not ( = ?auto_31044 ?auto_31043 ) ) ( not ( = ?auto_31040 ?auto_31043 ) ) ( not ( = ?auto_31050 ?auto_31043 ) ) ( ON_BOARD ?auto_31048 ?auto_31046 ) ( not ( = ?auto_31045 ?auto_31048 ) ) ( SUPPORTS ?auto_31048 ?auto_31042 ) ( not ( = ?auto_31049 ?auto_31042 ) ) ( not ( = ?auto_31041 ?auto_31042 ) ) ( CALIBRATION_TARGET ?auto_31048 ?auto_31044 ) ( POINTING ?auto_31046 ?auto_31050 ) ( ON_BOARD ?auto_31047 ?auto_31046 ) ( POWER_ON ?auto_31047 ) ( not ( = ?auto_31045 ?auto_31047 ) ) ( not ( = ?auto_31048 ?auto_31047 ) ) ( CALIBRATED ?auto_31047 ) ( SUPPORTS ?auto_31047 ?auto_31049 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_31050 ?auto_31049 )
      ( GET-2IMAGE ?auto_31050 ?auto_31049 ?auto_31040 ?auto_31041 )
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
      ?auto_31057 - INSTRUMENT
      ?auto_31058 - SATELLITE
      ?auto_31056 - DIRECTION
      ?auto_31060 - DIRECTION
      ?auto_31055 - INSTRUMENT
      ?auto_31059 - MODE
      ?auto_31061 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31057 ?auto_31058 ) ( SUPPORTS ?auto_31057 ?auto_31053 ) ( not ( = ?auto_31054 ?auto_31056 ) ) ( not ( = ?auto_31051 ?auto_31054 ) ) ( not ( = ?auto_31051 ?auto_31056 ) ) ( not ( = ?auto_31052 ?auto_31053 ) ) ( CALIBRATION_TARGET ?auto_31057 ?auto_31056 ) ( not ( = ?auto_31056 ?auto_31060 ) ) ( not ( = ?auto_31054 ?auto_31060 ) ) ( not ( = ?auto_31051 ?auto_31060 ) ) ( ON_BOARD ?auto_31055 ?auto_31058 ) ( not ( = ?auto_31057 ?auto_31055 ) ) ( SUPPORTS ?auto_31055 ?auto_31059 ) ( not ( = ?auto_31052 ?auto_31059 ) ) ( not ( = ?auto_31053 ?auto_31059 ) ) ( CALIBRATION_TARGET ?auto_31055 ?auto_31056 ) ( POINTING ?auto_31058 ?auto_31051 ) ( ON_BOARD ?auto_31061 ?auto_31058 ) ( POWER_ON ?auto_31061 ) ( not ( = ?auto_31057 ?auto_31061 ) ) ( not ( = ?auto_31055 ?auto_31061 ) ) ( CALIBRATED ?auto_31061 ) ( SUPPORTS ?auto_31061 ?auto_31052 ) )
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
      ?auto_31069 - INSTRUMENT
      ?auto_31066 - SATELLITE
      ?auto_31068 - DIRECTION
      ?auto_31072 - DIRECTION
      ?auto_31071 - MODE
      ?auto_31067 - INSTRUMENT
      ?auto_31070 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31069 ?auto_31066 ) ( SUPPORTS ?auto_31069 ?auto_31064 ) ( not ( = ?auto_31065 ?auto_31068 ) ) ( not ( = ?auto_31072 ?auto_31065 ) ) ( not ( = ?auto_31072 ?auto_31068 ) ) ( not ( = ?auto_31071 ?auto_31064 ) ) ( CALIBRATION_TARGET ?auto_31069 ?auto_31068 ) ( not ( = ?auto_31068 ?auto_31062 ) ) ( not ( = ?auto_31065 ?auto_31062 ) ) ( not ( = ?auto_31072 ?auto_31062 ) ) ( ON_BOARD ?auto_31067 ?auto_31066 ) ( not ( = ?auto_31069 ?auto_31067 ) ) ( SUPPORTS ?auto_31067 ?auto_31063 ) ( not ( = ?auto_31071 ?auto_31063 ) ) ( not ( = ?auto_31064 ?auto_31063 ) ) ( CALIBRATION_TARGET ?auto_31067 ?auto_31068 ) ( POINTING ?auto_31066 ?auto_31072 ) ( ON_BOARD ?auto_31070 ?auto_31066 ) ( POWER_ON ?auto_31070 ) ( not ( = ?auto_31069 ?auto_31070 ) ) ( not ( = ?auto_31067 ?auto_31070 ) ) ( CALIBRATED ?auto_31070 ) ( SUPPORTS ?auto_31070 ?auto_31071 ) )
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
      ?auto_31077 - SATELLITE
      ?auto_31080 - DIRECTION
      ?auto_31078 - DIRECTION
      ?auto_31079 - INSTRUMENT
      ?auto_31081 - MODE
      ?auto_31083 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31082 ?auto_31077 ) ( SUPPORTS ?auto_31082 ?auto_31074 ) ( not ( = ?auto_31073 ?auto_31080 ) ) ( not ( = ?auto_31076 ?auto_31073 ) ) ( not ( = ?auto_31076 ?auto_31080 ) ) ( not ( = ?auto_31075 ?auto_31074 ) ) ( CALIBRATION_TARGET ?auto_31082 ?auto_31080 ) ( not ( = ?auto_31080 ?auto_31078 ) ) ( not ( = ?auto_31073 ?auto_31078 ) ) ( not ( = ?auto_31076 ?auto_31078 ) ) ( ON_BOARD ?auto_31079 ?auto_31077 ) ( not ( = ?auto_31082 ?auto_31079 ) ) ( SUPPORTS ?auto_31079 ?auto_31081 ) ( not ( = ?auto_31075 ?auto_31081 ) ) ( not ( = ?auto_31074 ?auto_31081 ) ) ( CALIBRATION_TARGET ?auto_31079 ?auto_31080 ) ( POINTING ?auto_31077 ?auto_31076 ) ( ON_BOARD ?auto_31083 ?auto_31077 ) ( POWER_ON ?auto_31083 ) ( not ( = ?auto_31082 ?auto_31083 ) ) ( not ( = ?auto_31079 ?auto_31083 ) ) ( CALIBRATED ?auto_31083 ) ( SUPPORTS ?auto_31083 ?auto_31075 ) )
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
      ?auto_31091 - INSTRUMENT
      ?auto_31088 - SATELLITE
      ?auto_31090 - DIRECTION
      ?auto_31094 - DIRECTION
      ?auto_31093 - MODE
      ?auto_31089 - INSTRUMENT
      ?auto_31092 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31091 ?auto_31088 ) ( SUPPORTS ?auto_31091 ?auto_31085 ) ( not ( = ?auto_31084 ?auto_31090 ) ) ( not ( = ?auto_31094 ?auto_31084 ) ) ( not ( = ?auto_31094 ?auto_31090 ) ) ( not ( = ?auto_31093 ?auto_31085 ) ) ( CALIBRATION_TARGET ?auto_31091 ?auto_31090 ) ( not ( = ?auto_31090 ?auto_31087 ) ) ( not ( = ?auto_31084 ?auto_31087 ) ) ( not ( = ?auto_31094 ?auto_31087 ) ) ( ON_BOARD ?auto_31089 ?auto_31088 ) ( not ( = ?auto_31091 ?auto_31089 ) ) ( SUPPORTS ?auto_31089 ?auto_31086 ) ( not ( = ?auto_31093 ?auto_31086 ) ) ( not ( = ?auto_31085 ?auto_31086 ) ) ( CALIBRATION_TARGET ?auto_31089 ?auto_31090 ) ( POINTING ?auto_31088 ?auto_31094 ) ( ON_BOARD ?auto_31092 ?auto_31088 ) ( POWER_ON ?auto_31092 ) ( not ( = ?auto_31091 ?auto_31092 ) ) ( not ( = ?auto_31089 ?auto_31092 ) ) ( CALIBRATED ?auto_31092 ) ( SUPPORTS ?auto_31092 ?auto_31093 ) )
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
      ?auto_31127 - SATELLITE
      ?auto_31129 - DIRECTION
      ?auto_31128 - INSTRUMENT
      ?auto_31131 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31130 ?auto_31127 ) ( SUPPORTS ?auto_31130 ?auto_31125 ) ( not ( = ?auto_31126 ?auto_31129 ) ) ( not ( = ?auto_31121 ?auto_31126 ) ) ( not ( = ?auto_31121 ?auto_31129 ) ) ( not ( = ?auto_31122 ?auto_31125 ) ) ( CALIBRATION_TARGET ?auto_31130 ?auto_31129 ) ( not ( = ?auto_31129 ?auto_31124 ) ) ( not ( = ?auto_31126 ?auto_31124 ) ) ( not ( = ?auto_31121 ?auto_31124 ) ) ( ON_BOARD ?auto_31128 ?auto_31127 ) ( not ( = ?auto_31130 ?auto_31128 ) ) ( SUPPORTS ?auto_31128 ?auto_31123 ) ( not ( = ?auto_31122 ?auto_31123 ) ) ( not ( = ?auto_31125 ?auto_31123 ) ) ( CALIBRATION_TARGET ?auto_31128 ?auto_31129 ) ( POINTING ?auto_31127 ?auto_31121 ) ( ON_BOARD ?auto_31131 ?auto_31127 ) ( POWER_ON ?auto_31131 ) ( not ( = ?auto_31130 ?auto_31131 ) ) ( not ( = ?auto_31128 ?auto_31131 ) ) ( CALIBRATED ?auto_31131 ) ( SUPPORTS ?auto_31131 ?auto_31122 ) )
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
      ?auto_31151 - SATELLITE
      ?auto_31153 - DIRECTION
      ?auto_31152 - INSTRUMENT
      ?auto_31155 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31154 ?auto_31151 ) ( SUPPORTS ?auto_31154 ?auto_31147 ) ( not ( = ?auto_31148 ?auto_31153 ) ) ( not ( = ?auto_31145 ?auto_31148 ) ) ( not ( = ?auto_31145 ?auto_31153 ) ) ( not ( = ?auto_31146 ?auto_31147 ) ) ( CALIBRATION_TARGET ?auto_31154 ?auto_31153 ) ( not ( = ?auto_31153 ?auto_31150 ) ) ( not ( = ?auto_31148 ?auto_31150 ) ) ( not ( = ?auto_31145 ?auto_31150 ) ) ( ON_BOARD ?auto_31152 ?auto_31151 ) ( not ( = ?auto_31154 ?auto_31152 ) ) ( SUPPORTS ?auto_31152 ?auto_31149 ) ( not ( = ?auto_31146 ?auto_31149 ) ) ( not ( = ?auto_31147 ?auto_31149 ) ) ( CALIBRATION_TARGET ?auto_31152 ?auto_31153 ) ( POINTING ?auto_31151 ?auto_31145 ) ( ON_BOARD ?auto_31155 ?auto_31151 ) ( POWER_ON ?auto_31155 ) ( not ( = ?auto_31154 ?auto_31155 ) ) ( not ( = ?auto_31152 ?auto_31155 ) ) ( CALIBRATED ?auto_31155 ) ( SUPPORTS ?auto_31155 ?auto_31146 ) )
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
      ?auto_31175 - SATELLITE
      ?auto_31177 - DIRECTION
      ?auto_31176 - INSTRUMENT
      ?auto_31179 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31178 ?auto_31175 ) ( SUPPORTS ?auto_31178 ?auto_31173 ) ( not ( = ?auto_31174 ?auto_31177 ) ) ( not ( = ?auto_31172 ?auto_31174 ) ) ( not ( = ?auto_31172 ?auto_31177 ) ) ( not ( = ?auto_31171 ?auto_31173 ) ) ( CALIBRATION_TARGET ?auto_31178 ?auto_31177 ) ( not ( = ?auto_31177 ?auto_31169 ) ) ( not ( = ?auto_31174 ?auto_31169 ) ) ( not ( = ?auto_31172 ?auto_31169 ) ) ( ON_BOARD ?auto_31176 ?auto_31175 ) ( not ( = ?auto_31178 ?auto_31176 ) ) ( SUPPORTS ?auto_31176 ?auto_31170 ) ( not ( = ?auto_31171 ?auto_31170 ) ) ( not ( = ?auto_31173 ?auto_31170 ) ) ( CALIBRATION_TARGET ?auto_31176 ?auto_31177 ) ( POINTING ?auto_31175 ?auto_31172 ) ( ON_BOARD ?auto_31179 ?auto_31175 ) ( POWER_ON ?auto_31179 ) ( not ( = ?auto_31178 ?auto_31179 ) ) ( not ( = ?auto_31176 ?auto_31179 ) ) ( CALIBRATED ?auto_31179 ) ( SUPPORTS ?auto_31179 ?auto_31171 ) )
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
      ?auto_31199 - SATELLITE
      ?auto_31201 - DIRECTION
      ?auto_31200 - INSTRUMENT
      ?auto_31203 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31202 ?auto_31199 ) ( SUPPORTS ?auto_31202 ?auto_31195 ) ( not ( = ?auto_31196 ?auto_31201 ) ) ( not ( = ?auto_31198 ?auto_31196 ) ) ( not ( = ?auto_31198 ?auto_31201 ) ) ( not ( = ?auto_31197 ?auto_31195 ) ) ( CALIBRATION_TARGET ?auto_31202 ?auto_31201 ) ( not ( = ?auto_31201 ?auto_31193 ) ) ( not ( = ?auto_31196 ?auto_31193 ) ) ( not ( = ?auto_31198 ?auto_31193 ) ) ( ON_BOARD ?auto_31200 ?auto_31199 ) ( not ( = ?auto_31202 ?auto_31200 ) ) ( SUPPORTS ?auto_31200 ?auto_31194 ) ( not ( = ?auto_31197 ?auto_31194 ) ) ( not ( = ?auto_31195 ?auto_31194 ) ) ( CALIBRATION_TARGET ?auto_31200 ?auto_31201 ) ( POINTING ?auto_31199 ?auto_31198 ) ( ON_BOARD ?auto_31203 ?auto_31199 ) ( POWER_ON ?auto_31203 ) ( not ( = ?auto_31202 ?auto_31203 ) ) ( not ( = ?auto_31200 ?auto_31203 ) ) ( CALIBRATED ?auto_31203 ) ( SUPPORTS ?auto_31203 ?auto_31197 ) )
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
      ?auto_31249 - SATELLITE
      ?auto_31251 - DIRECTION
      ?auto_31250 - INSTRUMENT
      ?auto_31253 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31252 ?auto_31249 ) ( SUPPORTS ?auto_31252 ?auto_31244 ) ( not ( = ?auto_31243 ?auto_31251 ) ) ( not ( = ?auto_31246 ?auto_31243 ) ) ( not ( = ?auto_31246 ?auto_31251 ) ) ( not ( = ?auto_31245 ?auto_31244 ) ) ( CALIBRATION_TARGET ?auto_31252 ?auto_31251 ) ( not ( = ?auto_31251 ?auto_31248 ) ) ( not ( = ?auto_31243 ?auto_31248 ) ) ( not ( = ?auto_31246 ?auto_31248 ) ) ( ON_BOARD ?auto_31250 ?auto_31249 ) ( not ( = ?auto_31252 ?auto_31250 ) ) ( SUPPORTS ?auto_31250 ?auto_31247 ) ( not ( = ?auto_31245 ?auto_31247 ) ) ( not ( = ?auto_31244 ?auto_31247 ) ) ( CALIBRATION_TARGET ?auto_31250 ?auto_31251 ) ( POINTING ?auto_31249 ?auto_31246 ) ( ON_BOARD ?auto_31253 ?auto_31249 ) ( POWER_ON ?auto_31253 ) ( not ( = ?auto_31252 ?auto_31253 ) ) ( not ( = ?auto_31250 ?auto_31253 ) ) ( CALIBRATED ?auto_31253 ) ( SUPPORTS ?auto_31253 ?auto_31245 ) )
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
      ?auto_31273 - SATELLITE
      ?auto_31275 - DIRECTION
      ?auto_31274 - INSTRUMENT
      ?auto_31277 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31276 ?auto_31273 ) ( SUPPORTS ?auto_31276 ?auto_31268 ) ( not ( = ?auto_31267 ?auto_31275 ) ) ( not ( = ?auto_31272 ?auto_31267 ) ) ( not ( = ?auto_31272 ?auto_31275 ) ) ( not ( = ?auto_31271 ?auto_31268 ) ) ( CALIBRATION_TARGET ?auto_31276 ?auto_31275 ) ( not ( = ?auto_31275 ?auto_31270 ) ) ( not ( = ?auto_31267 ?auto_31270 ) ) ( not ( = ?auto_31272 ?auto_31270 ) ) ( ON_BOARD ?auto_31274 ?auto_31273 ) ( not ( = ?auto_31276 ?auto_31274 ) ) ( SUPPORTS ?auto_31274 ?auto_31269 ) ( not ( = ?auto_31271 ?auto_31269 ) ) ( not ( = ?auto_31268 ?auto_31269 ) ) ( CALIBRATION_TARGET ?auto_31274 ?auto_31275 ) ( POINTING ?auto_31273 ?auto_31272 ) ( ON_BOARD ?auto_31277 ?auto_31273 ) ( POWER_ON ?auto_31277 ) ( not ( = ?auto_31276 ?auto_31277 ) ) ( not ( = ?auto_31274 ?auto_31277 ) ) ( CALIBRATED ?auto_31277 ) ( SUPPORTS ?auto_31277 ?auto_31271 ) )
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
      ?auto_31352 - INSTRUMENT
      ?auto_31347 - SATELLITE
      ?auto_31350 - DIRECTION
      ?auto_31355 - DIRECTION
      ?auto_31354 - MODE
      ?auto_31348 - DIRECTION
      ?auto_31349 - INSTRUMENT
      ?auto_31351 - MODE
      ?auto_31353 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31352 ?auto_31347 ) ( SUPPORTS ?auto_31352 ?auto_31346 ) ( not ( = ?auto_31345 ?auto_31350 ) ) ( not ( = ?auto_31355 ?auto_31345 ) ) ( not ( = ?auto_31355 ?auto_31350 ) ) ( not ( = ?auto_31354 ?auto_31346 ) ) ( CALIBRATION_TARGET ?auto_31352 ?auto_31350 ) ( not ( = ?auto_31350 ?auto_31348 ) ) ( not ( = ?auto_31345 ?auto_31348 ) ) ( not ( = ?auto_31355 ?auto_31348 ) ) ( ON_BOARD ?auto_31349 ?auto_31347 ) ( not ( = ?auto_31352 ?auto_31349 ) ) ( SUPPORTS ?auto_31349 ?auto_31351 ) ( not ( = ?auto_31354 ?auto_31351 ) ) ( not ( = ?auto_31346 ?auto_31351 ) ) ( CALIBRATION_TARGET ?auto_31349 ?auto_31350 ) ( ON_BOARD ?auto_31353 ?auto_31347 ) ( POWER_ON ?auto_31353 ) ( not ( = ?auto_31352 ?auto_31353 ) ) ( not ( = ?auto_31349 ?auto_31353 ) ) ( CALIBRATED ?auto_31353 ) ( SUPPORTS ?auto_31353 ?auto_31354 ) ( POINTING ?auto_31347 ?auto_31350 ) )
    :subtasks
    ( ( !TURN_TO ?auto_31347 ?auto_31355 ?auto_31350 )
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
      ?auto_31366 - INSTRUMENT
      ?auto_31364 - SATELLITE
      ?auto_31361 - DIRECTION
      ?auto_31362 - DIRECTION
      ?auto_31365 - INSTRUMENT
      ?auto_31360 - MODE
      ?auto_31363 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31366 ?auto_31364 ) ( SUPPORTS ?auto_31366 ?auto_31358 ) ( not ( = ?auto_31359 ?auto_31361 ) ) ( not ( = ?auto_31356 ?auto_31359 ) ) ( not ( = ?auto_31356 ?auto_31361 ) ) ( not ( = ?auto_31357 ?auto_31358 ) ) ( CALIBRATION_TARGET ?auto_31366 ?auto_31361 ) ( not ( = ?auto_31361 ?auto_31362 ) ) ( not ( = ?auto_31359 ?auto_31362 ) ) ( not ( = ?auto_31356 ?auto_31362 ) ) ( ON_BOARD ?auto_31365 ?auto_31364 ) ( not ( = ?auto_31366 ?auto_31365 ) ) ( SUPPORTS ?auto_31365 ?auto_31360 ) ( not ( = ?auto_31357 ?auto_31360 ) ) ( not ( = ?auto_31358 ?auto_31360 ) ) ( CALIBRATION_TARGET ?auto_31365 ?auto_31361 ) ( ON_BOARD ?auto_31363 ?auto_31364 ) ( POWER_ON ?auto_31363 ) ( not ( = ?auto_31366 ?auto_31363 ) ) ( not ( = ?auto_31365 ?auto_31363 ) ) ( CALIBRATED ?auto_31363 ) ( SUPPORTS ?auto_31363 ?auto_31357 ) ( POINTING ?auto_31364 ?auto_31361 ) )
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
      ?auto_31373 - INSTRUMENT
      ?auto_31375 - SATELLITE
      ?auto_31374 - DIRECTION
      ?auto_31377 - DIRECTION
      ?auto_31376 - MODE
      ?auto_31371 - INSTRUMENT
      ?auto_31372 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31373 ?auto_31375 ) ( SUPPORTS ?auto_31373 ?auto_31369 ) ( not ( = ?auto_31370 ?auto_31374 ) ) ( not ( = ?auto_31377 ?auto_31370 ) ) ( not ( = ?auto_31377 ?auto_31374 ) ) ( not ( = ?auto_31376 ?auto_31369 ) ) ( CALIBRATION_TARGET ?auto_31373 ?auto_31374 ) ( not ( = ?auto_31374 ?auto_31367 ) ) ( not ( = ?auto_31370 ?auto_31367 ) ) ( not ( = ?auto_31377 ?auto_31367 ) ) ( ON_BOARD ?auto_31371 ?auto_31375 ) ( not ( = ?auto_31373 ?auto_31371 ) ) ( SUPPORTS ?auto_31371 ?auto_31368 ) ( not ( = ?auto_31376 ?auto_31368 ) ) ( not ( = ?auto_31369 ?auto_31368 ) ) ( CALIBRATION_TARGET ?auto_31371 ?auto_31374 ) ( ON_BOARD ?auto_31372 ?auto_31375 ) ( POWER_ON ?auto_31372 ) ( not ( = ?auto_31373 ?auto_31372 ) ) ( not ( = ?auto_31371 ?auto_31372 ) ) ( CALIBRATED ?auto_31372 ) ( SUPPORTS ?auto_31372 ?auto_31376 ) ( POINTING ?auto_31375 ?auto_31374 ) )
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
      ?auto_31383 - DIRECTION
      ?auto_31382 - INSTRUMENT
      ?auto_31388 - MODE
      ?auto_31384 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31385 ?auto_31387 ) ( SUPPORTS ?auto_31385 ?auto_31379 ) ( not ( = ?auto_31378 ?auto_31386 ) ) ( not ( = ?auto_31381 ?auto_31378 ) ) ( not ( = ?auto_31381 ?auto_31386 ) ) ( not ( = ?auto_31380 ?auto_31379 ) ) ( CALIBRATION_TARGET ?auto_31385 ?auto_31386 ) ( not ( = ?auto_31386 ?auto_31383 ) ) ( not ( = ?auto_31378 ?auto_31383 ) ) ( not ( = ?auto_31381 ?auto_31383 ) ) ( ON_BOARD ?auto_31382 ?auto_31387 ) ( not ( = ?auto_31385 ?auto_31382 ) ) ( SUPPORTS ?auto_31382 ?auto_31388 ) ( not ( = ?auto_31380 ?auto_31388 ) ) ( not ( = ?auto_31379 ?auto_31388 ) ) ( CALIBRATION_TARGET ?auto_31382 ?auto_31386 ) ( ON_BOARD ?auto_31384 ?auto_31387 ) ( POWER_ON ?auto_31384 ) ( not ( = ?auto_31385 ?auto_31384 ) ) ( not ( = ?auto_31382 ?auto_31384 ) ) ( CALIBRATED ?auto_31384 ) ( SUPPORTS ?auto_31384 ?auto_31380 ) ( POINTING ?auto_31387 ?auto_31386 ) )
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
      ?auto_31395 - INSTRUMENT
      ?auto_31397 - SATELLITE
      ?auto_31396 - DIRECTION
      ?auto_31399 - DIRECTION
      ?auto_31398 - MODE
      ?auto_31393 - INSTRUMENT
      ?auto_31394 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31395 ?auto_31397 ) ( SUPPORTS ?auto_31395 ?auto_31390 ) ( not ( = ?auto_31389 ?auto_31396 ) ) ( not ( = ?auto_31399 ?auto_31389 ) ) ( not ( = ?auto_31399 ?auto_31396 ) ) ( not ( = ?auto_31398 ?auto_31390 ) ) ( CALIBRATION_TARGET ?auto_31395 ?auto_31396 ) ( not ( = ?auto_31396 ?auto_31392 ) ) ( not ( = ?auto_31389 ?auto_31392 ) ) ( not ( = ?auto_31399 ?auto_31392 ) ) ( ON_BOARD ?auto_31393 ?auto_31397 ) ( not ( = ?auto_31395 ?auto_31393 ) ) ( SUPPORTS ?auto_31393 ?auto_31391 ) ( not ( = ?auto_31398 ?auto_31391 ) ) ( not ( = ?auto_31390 ?auto_31391 ) ) ( CALIBRATION_TARGET ?auto_31393 ?auto_31396 ) ( ON_BOARD ?auto_31394 ?auto_31397 ) ( POWER_ON ?auto_31394 ) ( not ( = ?auto_31395 ?auto_31394 ) ) ( not ( = ?auto_31393 ?auto_31394 ) ) ( CALIBRATED ?auto_31394 ) ( SUPPORTS ?auto_31394 ?auto_31398 ) ( POINTING ?auto_31397 ?auto_31396 ) )
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
    ( and ( ON_BOARD ?auto_31434 ?auto_31436 ) ( SUPPORTS ?auto_31434 ?auto_31430 ) ( not ( = ?auto_31431 ?auto_31435 ) ) ( not ( = ?auto_31426 ?auto_31431 ) ) ( not ( = ?auto_31426 ?auto_31435 ) ) ( not ( = ?auto_31427 ?auto_31430 ) ) ( CALIBRATION_TARGET ?auto_31434 ?auto_31435 ) ( not ( = ?auto_31435 ?auto_31429 ) ) ( not ( = ?auto_31431 ?auto_31429 ) ) ( not ( = ?auto_31426 ?auto_31429 ) ) ( ON_BOARD ?auto_31432 ?auto_31436 ) ( not ( = ?auto_31434 ?auto_31432 ) ) ( SUPPORTS ?auto_31432 ?auto_31428 ) ( not ( = ?auto_31427 ?auto_31428 ) ) ( not ( = ?auto_31430 ?auto_31428 ) ) ( CALIBRATION_TARGET ?auto_31432 ?auto_31435 ) ( ON_BOARD ?auto_31433 ?auto_31436 ) ( POWER_ON ?auto_31433 ) ( not ( = ?auto_31434 ?auto_31433 ) ) ( not ( = ?auto_31432 ?auto_31433 ) ) ( CALIBRATED ?auto_31433 ) ( SUPPORTS ?auto_31433 ?auto_31427 ) ( POINTING ?auto_31436 ?auto_31435 ) )
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
    ( and ( ON_BOARD ?auto_31458 ?auto_31460 ) ( SUPPORTS ?auto_31458 ?auto_31452 ) ( not ( = ?auto_31453 ?auto_31459 ) ) ( not ( = ?auto_31450 ?auto_31453 ) ) ( not ( = ?auto_31450 ?auto_31459 ) ) ( not ( = ?auto_31451 ?auto_31452 ) ) ( CALIBRATION_TARGET ?auto_31458 ?auto_31459 ) ( not ( = ?auto_31459 ?auto_31455 ) ) ( not ( = ?auto_31453 ?auto_31455 ) ) ( not ( = ?auto_31450 ?auto_31455 ) ) ( ON_BOARD ?auto_31456 ?auto_31460 ) ( not ( = ?auto_31458 ?auto_31456 ) ) ( SUPPORTS ?auto_31456 ?auto_31454 ) ( not ( = ?auto_31451 ?auto_31454 ) ) ( not ( = ?auto_31452 ?auto_31454 ) ) ( CALIBRATION_TARGET ?auto_31456 ?auto_31459 ) ( ON_BOARD ?auto_31457 ?auto_31460 ) ( POWER_ON ?auto_31457 ) ( not ( = ?auto_31458 ?auto_31457 ) ) ( not ( = ?auto_31456 ?auto_31457 ) ) ( CALIBRATED ?auto_31457 ) ( SUPPORTS ?auto_31457 ?auto_31451 ) ( POINTING ?auto_31460 ?auto_31459 ) )
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
    ( and ( ON_BOARD ?auto_31482 ?auto_31484 ) ( SUPPORTS ?auto_31482 ?auto_31478 ) ( not ( = ?auto_31479 ?auto_31483 ) ) ( not ( = ?auto_31477 ?auto_31479 ) ) ( not ( = ?auto_31477 ?auto_31483 ) ) ( not ( = ?auto_31476 ?auto_31478 ) ) ( CALIBRATION_TARGET ?auto_31482 ?auto_31483 ) ( not ( = ?auto_31483 ?auto_31474 ) ) ( not ( = ?auto_31479 ?auto_31474 ) ) ( not ( = ?auto_31477 ?auto_31474 ) ) ( ON_BOARD ?auto_31480 ?auto_31484 ) ( not ( = ?auto_31482 ?auto_31480 ) ) ( SUPPORTS ?auto_31480 ?auto_31475 ) ( not ( = ?auto_31476 ?auto_31475 ) ) ( not ( = ?auto_31478 ?auto_31475 ) ) ( CALIBRATION_TARGET ?auto_31480 ?auto_31483 ) ( ON_BOARD ?auto_31481 ?auto_31484 ) ( POWER_ON ?auto_31481 ) ( not ( = ?auto_31482 ?auto_31481 ) ) ( not ( = ?auto_31480 ?auto_31481 ) ) ( CALIBRATED ?auto_31481 ) ( SUPPORTS ?auto_31481 ?auto_31476 ) ( POINTING ?auto_31484 ?auto_31483 ) )
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
    ( and ( ON_BOARD ?auto_31506 ?auto_31508 ) ( SUPPORTS ?auto_31506 ?auto_31500 ) ( not ( = ?auto_31501 ?auto_31507 ) ) ( not ( = ?auto_31503 ?auto_31501 ) ) ( not ( = ?auto_31503 ?auto_31507 ) ) ( not ( = ?auto_31502 ?auto_31500 ) ) ( CALIBRATION_TARGET ?auto_31506 ?auto_31507 ) ( not ( = ?auto_31507 ?auto_31498 ) ) ( not ( = ?auto_31501 ?auto_31498 ) ) ( not ( = ?auto_31503 ?auto_31498 ) ) ( ON_BOARD ?auto_31504 ?auto_31508 ) ( not ( = ?auto_31506 ?auto_31504 ) ) ( SUPPORTS ?auto_31504 ?auto_31499 ) ( not ( = ?auto_31502 ?auto_31499 ) ) ( not ( = ?auto_31500 ?auto_31499 ) ) ( CALIBRATION_TARGET ?auto_31504 ?auto_31507 ) ( ON_BOARD ?auto_31505 ?auto_31508 ) ( POWER_ON ?auto_31505 ) ( not ( = ?auto_31506 ?auto_31505 ) ) ( not ( = ?auto_31504 ?auto_31505 ) ) ( CALIBRATED ?auto_31505 ) ( SUPPORTS ?auto_31505 ?auto_31502 ) ( POINTING ?auto_31508 ?auto_31507 ) )
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
    ( and ( ON_BOARD ?auto_31556 ?auto_31558 ) ( SUPPORTS ?auto_31556 ?auto_31549 ) ( not ( = ?auto_31548 ?auto_31557 ) ) ( not ( = ?auto_31551 ?auto_31548 ) ) ( not ( = ?auto_31551 ?auto_31557 ) ) ( not ( = ?auto_31550 ?auto_31549 ) ) ( CALIBRATION_TARGET ?auto_31556 ?auto_31557 ) ( not ( = ?auto_31557 ?auto_31553 ) ) ( not ( = ?auto_31548 ?auto_31553 ) ) ( not ( = ?auto_31551 ?auto_31553 ) ) ( ON_BOARD ?auto_31554 ?auto_31558 ) ( not ( = ?auto_31556 ?auto_31554 ) ) ( SUPPORTS ?auto_31554 ?auto_31552 ) ( not ( = ?auto_31550 ?auto_31552 ) ) ( not ( = ?auto_31549 ?auto_31552 ) ) ( CALIBRATION_TARGET ?auto_31554 ?auto_31557 ) ( ON_BOARD ?auto_31555 ?auto_31558 ) ( POWER_ON ?auto_31555 ) ( not ( = ?auto_31556 ?auto_31555 ) ) ( not ( = ?auto_31554 ?auto_31555 ) ) ( CALIBRATED ?auto_31555 ) ( SUPPORTS ?auto_31555 ?auto_31550 ) ( POINTING ?auto_31558 ?auto_31557 ) )
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
    ( and ( ON_BOARD ?auto_31580 ?auto_31582 ) ( SUPPORTS ?auto_31580 ?auto_31573 ) ( not ( = ?auto_31572 ?auto_31581 ) ) ( not ( = ?auto_31577 ?auto_31572 ) ) ( not ( = ?auto_31577 ?auto_31581 ) ) ( not ( = ?auto_31576 ?auto_31573 ) ) ( CALIBRATION_TARGET ?auto_31580 ?auto_31581 ) ( not ( = ?auto_31581 ?auto_31575 ) ) ( not ( = ?auto_31572 ?auto_31575 ) ) ( not ( = ?auto_31577 ?auto_31575 ) ) ( ON_BOARD ?auto_31578 ?auto_31582 ) ( not ( = ?auto_31580 ?auto_31578 ) ) ( SUPPORTS ?auto_31578 ?auto_31574 ) ( not ( = ?auto_31576 ?auto_31574 ) ) ( not ( = ?auto_31573 ?auto_31574 ) ) ( CALIBRATION_TARGET ?auto_31578 ?auto_31581 ) ( ON_BOARD ?auto_31579 ?auto_31582 ) ( POWER_ON ?auto_31579 ) ( not ( = ?auto_31580 ?auto_31579 ) ) ( not ( = ?auto_31578 ?auto_31579 ) ) ( CALIBRATED ?auto_31579 ) ( SUPPORTS ?auto_31579 ?auto_31576 ) ( POINTING ?auto_31582 ?auto_31581 ) )
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
      ?auto_31655 - INSTRUMENT
      ?auto_31657 - SATELLITE
      ?auto_31656 - DIRECTION
      ?auto_31660 - DIRECTION
      ?auto_31659 - MODE
      ?auto_31653 - DIRECTION
      ?auto_31652 - INSTRUMENT
      ?auto_31658 - MODE
      ?auto_31654 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31655 ?auto_31657 ) ( SUPPORTS ?auto_31655 ?auto_31651 ) ( not ( = ?auto_31650 ?auto_31656 ) ) ( not ( = ?auto_31660 ?auto_31650 ) ) ( not ( = ?auto_31660 ?auto_31656 ) ) ( not ( = ?auto_31659 ?auto_31651 ) ) ( CALIBRATION_TARGET ?auto_31655 ?auto_31656 ) ( not ( = ?auto_31656 ?auto_31653 ) ) ( not ( = ?auto_31650 ?auto_31653 ) ) ( not ( = ?auto_31660 ?auto_31653 ) ) ( ON_BOARD ?auto_31652 ?auto_31657 ) ( not ( = ?auto_31655 ?auto_31652 ) ) ( SUPPORTS ?auto_31652 ?auto_31658 ) ( not ( = ?auto_31659 ?auto_31658 ) ) ( not ( = ?auto_31651 ?auto_31658 ) ) ( CALIBRATION_TARGET ?auto_31652 ?auto_31656 ) ( ON_BOARD ?auto_31654 ?auto_31657 ) ( POWER_ON ?auto_31654 ) ( not ( = ?auto_31655 ?auto_31654 ) ) ( not ( = ?auto_31652 ?auto_31654 ) ) ( SUPPORTS ?auto_31654 ?auto_31659 ) ( POINTING ?auto_31657 ?auto_31656 ) ( CALIBRATION_TARGET ?auto_31654 ?auto_31656 ) ( NOT_CALIBRATED ?auto_31654 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_31657 ?auto_31654 ?auto_31656 )
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
      ?auto_31665 - INSTRUMENT
      ?auto_31670 - SATELLITE
      ?auto_31667 - DIRECTION
      ?auto_31666 - DIRECTION
      ?auto_31668 - INSTRUMENT
      ?auto_31671 - MODE
      ?auto_31669 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31665 ?auto_31670 ) ( SUPPORTS ?auto_31665 ?auto_31663 ) ( not ( = ?auto_31664 ?auto_31667 ) ) ( not ( = ?auto_31661 ?auto_31664 ) ) ( not ( = ?auto_31661 ?auto_31667 ) ) ( not ( = ?auto_31662 ?auto_31663 ) ) ( CALIBRATION_TARGET ?auto_31665 ?auto_31667 ) ( not ( = ?auto_31667 ?auto_31666 ) ) ( not ( = ?auto_31664 ?auto_31666 ) ) ( not ( = ?auto_31661 ?auto_31666 ) ) ( ON_BOARD ?auto_31668 ?auto_31670 ) ( not ( = ?auto_31665 ?auto_31668 ) ) ( SUPPORTS ?auto_31668 ?auto_31671 ) ( not ( = ?auto_31662 ?auto_31671 ) ) ( not ( = ?auto_31663 ?auto_31671 ) ) ( CALIBRATION_TARGET ?auto_31668 ?auto_31667 ) ( ON_BOARD ?auto_31669 ?auto_31670 ) ( POWER_ON ?auto_31669 ) ( not ( = ?auto_31665 ?auto_31669 ) ) ( not ( = ?auto_31668 ?auto_31669 ) ) ( SUPPORTS ?auto_31669 ?auto_31662 ) ( POINTING ?auto_31670 ?auto_31667 ) ( CALIBRATION_TARGET ?auto_31669 ?auto_31667 ) ( NOT_CALIBRATED ?auto_31669 ) )
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
      ?auto_31676 - INSTRUMENT
      ?auto_31680 - SATELLITE
      ?auto_31679 - DIRECTION
      ?auto_31682 - DIRECTION
      ?auto_31681 - MODE
      ?auto_31678 - INSTRUMENT
      ?auto_31677 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31676 ?auto_31680 ) ( SUPPORTS ?auto_31676 ?auto_31674 ) ( not ( = ?auto_31675 ?auto_31679 ) ) ( not ( = ?auto_31682 ?auto_31675 ) ) ( not ( = ?auto_31682 ?auto_31679 ) ) ( not ( = ?auto_31681 ?auto_31674 ) ) ( CALIBRATION_TARGET ?auto_31676 ?auto_31679 ) ( not ( = ?auto_31679 ?auto_31672 ) ) ( not ( = ?auto_31675 ?auto_31672 ) ) ( not ( = ?auto_31682 ?auto_31672 ) ) ( ON_BOARD ?auto_31678 ?auto_31680 ) ( not ( = ?auto_31676 ?auto_31678 ) ) ( SUPPORTS ?auto_31678 ?auto_31673 ) ( not ( = ?auto_31681 ?auto_31673 ) ) ( not ( = ?auto_31674 ?auto_31673 ) ) ( CALIBRATION_TARGET ?auto_31678 ?auto_31679 ) ( ON_BOARD ?auto_31677 ?auto_31680 ) ( POWER_ON ?auto_31677 ) ( not ( = ?auto_31676 ?auto_31677 ) ) ( not ( = ?auto_31678 ?auto_31677 ) ) ( SUPPORTS ?auto_31677 ?auto_31681 ) ( POINTING ?auto_31680 ?auto_31679 ) ( CALIBRATION_TARGET ?auto_31677 ?auto_31679 ) ( NOT_CALIBRATED ?auto_31677 ) )
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
      ?auto_31687 - INSTRUMENT
      ?auto_31693 - SATELLITE
      ?auto_31692 - DIRECTION
      ?auto_31690 - DIRECTION
      ?auto_31691 - INSTRUMENT
      ?auto_31689 - MODE
      ?auto_31688 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31687 ?auto_31693 ) ( SUPPORTS ?auto_31687 ?auto_31684 ) ( not ( = ?auto_31683 ?auto_31692 ) ) ( not ( = ?auto_31686 ?auto_31683 ) ) ( not ( = ?auto_31686 ?auto_31692 ) ) ( not ( = ?auto_31685 ?auto_31684 ) ) ( CALIBRATION_TARGET ?auto_31687 ?auto_31692 ) ( not ( = ?auto_31692 ?auto_31690 ) ) ( not ( = ?auto_31683 ?auto_31690 ) ) ( not ( = ?auto_31686 ?auto_31690 ) ) ( ON_BOARD ?auto_31691 ?auto_31693 ) ( not ( = ?auto_31687 ?auto_31691 ) ) ( SUPPORTS ?auto_31691 ?auto_31689 ) ( not ( = ?auto_31685 ?auto_31689 ) ) ( not ( = ?auto_31684 ?auto_31689 ) ) ( CALIBRATION_TARGET ?auto_31691 ?auto_31692 ) ( ON_BOARD ?auto_31688 ?auto_31693 ) ( POWER_ON ?auto_31688 ) ( not ( = ?auto_31687 ?auto_31688 ) ) ( not ( = ?auto_31691 ?auto_31688 ) ) ( SUPPORTS ?auto_31688 ?auto_31685 ) ( POINTING ?auto_31693 ?auto_31692 ) ( CALIBRATION_TARGET ?auto_31688 ?auto_31692 ) ( NOT_CALIBRATED ?auto_31688 ) )
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
      ?auto_31698 - INSTRUMENT
      ?auto_31702 - SATELLITE
      ?auto_31701 - DIRECTION
      ?auto_31704 - DIRECTION
      ?auto_31703 - MODE
      ?auto_31700 - INSTRUMENT
      ?auto_31699 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31698 ?auto_31702 ) ( SUPPORTS ?auto_31698 ?auto_31695 ) ( not ( = ?auto_31694 ?auto_31701 ) ) ( not ( = ?auto_31704 ?auto_31694 ) ) ( not ( = ?auto_31704 ?auto_31701 ) ) ( not ( = ?auto_31703 ?auto_31695 ) ) ( CALIBRATION_TARGET ?auto_31698 ?auto_31701 ) ( not ( = ?auto_31701 ?auto_31697 ) ) ( not ( = ?auto_31694 ?auto_31697 ) ) ( not ( = ?auto_31704 ?auto_31697 ) ) ( ON_BOARD ?auto_31700 ?auto_31702 ) ( not ( = ?auto_31698 ?auto_31700 ) ) ( SUPPORTS ?auto_31700 ?auto_31696 ) ( not ( = ?auto_31703 ?auto_31696 ) ) ( not ( = ?auto_31695 ?auto_31696 ) ) ( CALIBRATION_TARGET ?auto_31700 ?auto_31701 ) ( ON_BOARD ?auto_31699 ?auto_31702 ) ( POWER_ON ?auto_31699 ) ( not ( = ?auto_31698 ?auto_31699 ) ) ( not ( = ?auto_31700 ?auto_31699 ) ) ( SUPPORTS ?auto_31699 ?auto_31703 ) ( POINTING ?auto_31702 ?auto_31701 ) ( CALIBRATION_TARGET ?auto_31699 ?auto_31701 ) ( NOT_CALIBRATED ?auto_31699 ) )
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
      ?auto_31737 - INSTRUMENT
      ?auto_31741 - SATELLITE
      ?auto_31740 - DIRECTION
      ?auto_31739 - INSTRUMENT
      ?auto_31738 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31737 ?auto_31741 ) ( SUPPORTS ?auto_31737 ?auto_31735 ) ( not ( = ?auto_31736 ?auto_31740 ) ) ( not ( = ?auto_31731 ?auto_31736 ) ) ( not ( = ?auto_31731 ?auto_31740 ) ) ( not ( = ?auto_31732 ?auto_31735 ) ) ( CALIBRATION_TARGET ?auto_31737 ?auto_31740 ) ( not ( = ?auto_31740 ?auto_31734 ) ) ( not ( = ?auto_31736 ?auto_31734 ) ) ( not ( = ?auto_31731 ?auto_31734 ) ) ( ON_BOARD ?auto_31739 ?auto_31741 ) ( not ( = ?auto_31737 ?auto_31739 ) ) ( SUPPORTS ?auto_31739 ?auto_31733 ) ( not ( = ?auto_31732 ?auto_31733 ) ) ( not ( = ?auto_31735 ?auto_31733 ) ) ( CALIBRATION_TARGET ?auto_31739 ?auto_31740 ) ( ON_BOARD ?auto_31738 ?auto_31741 ) ( POWER_ON ?auto_31738 ) ( not ( = ?auto_31737 ?auto_31738 ) ) ( not ( = ?auto_31739 ?auto_31738 ) ) ( SUPPORTS ?auto_31738 ?auto_31732 ) ( POINTING ?auto_31741 ?auto_31740 ) ( CALIBRATION_TARGET ?auto_31738 ?auto_31740 ) ( NOT_CALIBRATED ?auto_31738 ) )
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
      ?auto_31761 - INSTRUMENT
      ?auto_31765 - SATELLITE
      ?auto_31764 - DIRECTION
      ?auto_31763 - INSTRUMENT
      ?auto_31762 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31761 ?auto_31765 ) ( SUPPORTS ?auto_31761 ?auto_31757 ) ( not ( = ?auto_31758 ?auto_31764 ) ) ( not ( = ?auto_31755 ?auto_31758 ) ) ( not ( = ?auto_31755 ?auto_31764 ) ) ( not ( = ?auto_31756 ?auto_31757 ) ) ( CALIBRATION_TARGET ?auto_31761 ?auto_31764 ) ( not ( = ?auto_31764 ?auto_31760 ) ) ( not ( = ?auto_31758 ?auto_31760 ) ) ( not ( = ?auto_31755 ?auto_31760 ) ) ( ON_BOARD ?auto_31763 ?auto_31765 ) ( not ( = ?auto_31761 ?auto_31763 ) ) ( SUPPORTS ?auto_31763 ?auto_31759 ) ( not ( = ?auto_31756 ?auto_31759 ) ) ( not ( = ?auto_31757 ?auto_31759 ) ) ( CALIBRATION_TARGET ?auto_31763 ?auto_31764 ) ( ON_BOARD ?auto_31762 ?auto_31765 ) ( POWER_ON ?auto_31762 ) ( not ( = ?auto_31761 ?auto_31762 ) ) ( not ( = ?auto_31763 ?auto_31762 ) ) ( SUPPORTS ?auto_31762 ?auto_31756 ) ( POINTING ?auto_31765 ?auto_31764 ) ( CALIBRATION_TARGET ?auto_31762 ?auto_31764 ) ( NOT_CALIBRATED ?auto_31762 ) )
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
      ?auto_31785 - INSTRUMENT
      ?auto_31789 - SATELLITE
      ?auto_31788 - DIRECTION
      ?auto_31787 - INSTRUMENT
      ?auto_31786 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31785 ?auto_31789 ) ( SUPPORTS ?auto_31785 ?auto_31783 ) ( not ( = ?auto_31784 ?auto_31788 ) ) ( not ( = ?auto_31782 ?auto_31784 ) ) ( not ( = ?auto_31782 ?auto_31788 ) ) ( not ( = ?auto_31781 ?auto_31783 ) ) ( CALIBRATION_TARGET ?auto_31785 ?auto_31788 ) ( not ( = ?auto_31788 ?auto_31779 ) ) ( not ( = ?auto_31784 ?auto_31779 ) ) ( not ( = ?auto_31782 ?auto_31779 ) ) ( ON_BOARD ?auto_31787 ?auto_31789 ) ( not ( = ?auto_31785 ?auto_31787 ) ) ( SUPPORTS ?auto_31787 ?auto_31780 ) ( not ( = ?auto_31781 ?auto_31780 ) ) ( not ( = ?auto_31783 ?auto_31780 ) ) ( CALIBRATION_TARGET ?auto_31787 ?auto_31788 ) ( ON_BOARD ?auto_31786 ?auto_31789 ) ( POWER_ON ?auto_31786 ) ( not ( = ?auto_31785 ?auto_31786 ) ) ( not ( = ?auto_31787 ?auto_31786 ) ) ( SUPPORTS ?auto_31786 ?auto_31781 ) ( POINTING ?auto_31789 ?auto_31788 ) ( CALIBRATION_TARGET ?auto_31786 ?auto_31788 ) ( NOT_CALIBRATED ?auto_31786 ) )
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
      ?auto_31809 - INSTRUMENT
      ?auto_31813 - SATELLITE
      ?auto_31812 - DIRECTION
      ?auto_31811 - INSTRUMENT
      ?auto_31810 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31809 ?auto_31813 ) ( SUPPORTS ?auto_31809 ?auto_31805 ) ( not ( = ?auto_31806 ?auto_31812 ) ) ( not ( = ?auto_31808 ?auto_31806 ) ) ( not ( = ?auto_31808 ?auto_31812 ) ) ( not ( = ?auto_31807 ?auto_31805 ) ) ( CALIBRATION_TARGET ?auto_31809 ?auto_31812 ) ( not ( = ?auto_31812 ?auto_31803 ) ) ( not ( = ?auto_31806 ?auto_31803 ) ) ( not ( = ?auto_31808 ?auto_31803 ) ) ( ON_BOARD ?auto_31811 ?auto_31813 ) ( not ( = ?auto_31809 ?auto_31811 ) ) ( SUPPORTS ?auto_31811 ?auto_31804 ) ( not ( = ?auto_31807 ?auto_31804 ) ) ( not ( = ?auto_31805 ?auto_31804 ) ) ( CALIBRATION_TARGET ?auto_31811 ?auto_31812 ) ( ON_BOARD ?auto_31810 ?auto_31813 ) ( POWER_ON ?auto_31810 ) ( not ( = ?auto_31809 ?auto_31810 ) ) ( not ( = ?auto_31811 ?auto_31810 ) ) ( SUPPORTS ?auto_31810 ?auto_31807 ) ( POINTING ?auto_31813 ?auto_31812 ) ( CALIBRATION_TARGET ?auto_31810 ?auto_31812 ) ( NOT_CALIBRATED ?auto_31810 ) )
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
      ?auto_31859 - INSTRUMENT
      ?auto_31863 - SATELLITE
      ?auto_31862 - DIRECTION
      ?auto_31861 - INSTRUMENT
      ?auto_31860 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31859 ?auto_31863 ) ( SUPPORTS ?auto_31859 ?auto_31854 ) ( not ( = ?auto_31853 ?auto_31862 ) ) ( not ( = ?auto_31856 ?auto_31853 ) ) ( not ( = ?auto_31856 ?auto_31862 ) ) ( not ( = ?auto_31855 ?auto_31854 ) ) ( CALIBRATION_TARGET ?auto_31859 ?auto_31862 ) ( not ( = ?auto_31862 ?auto_31858 ) ) ( not ( = ?auto_31853 ?auto_31858 ) ) ( not ( = ?auto_31856 ?auto_31858 ) ) ( ON_BOARD ?auto_31861 ?auto_31863 ) ( not ( = ?auto_31859 ?auto_31861 ) ) ( SUPPORTS ?auto_31861 ?auto_31857 ) ( not ( = ?auto_31855 ?auto_31857 ) ) ( not ( = ?auto_31854 ?auto_31857 ) ) ( CALIBRATION_TARGET ?auto_31861 ?auto_31862 ) ( ON_BOARD ?auto_31860 ?auto_31863 ) ( POWER_ON ?auto_31860 ) ( not ( = ?auto_31859 ?auto_31860 ) ) ( not ( = ?auto_31861 ?auto_31860 ) ) ( SUPPORTS ?auto_31860 ?auto_31855 ) ( POINTING ?auto_31863 ?auto_31862 ) ( CALIBRATION_TARGET ?auto_31860 ?auto_31862 ) ( NOT_CALIBRATED ?auto_31860 ) )
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
      ?auto_31883 - INSTRUMENT
      ?auto_31887 - SATELLITE
      ?auto_31886 - DIRECTION
      ?auto_31885 - INSTRUMENT
      ?auto_31884 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31883 ?auto_31887 ) ( SUPPORTS ?auto_31883 ?auto_31878 ) ( not ( = ?auto_31877 ?auto_31886 ) ) ( not ( = ?auto_31882 ?auto_31877 ) ) ( not ( = ?auto_31882 ?auto_31886 ) ) ( not ( = ?auto_31881 ?auto_31878 ) ) ( CALIBRATION_TARGET ?auto_31883 ?auto_31886 ) ( not ( = ?auto_31886 ?auto_31880 ) ) ( not ( = ?auto_31877 ?auto_31880 ) ) ( not ( = ?auto_31882 ?auto_31880 ) ) ( ON_BOARD ?auto_31885 ?auto_31887 ) ( not ( = ?auto_31883 ?auto_31885 ) ) ( SUPPORTS ?auto_31885 ?auto_31879 ) ( not ( = ?auto_31881 ?auto_31879 ) ) ( not ( = ?auto_31878 ?auto_31879 ) ) ( CALIBRATION_TARGET ?auto_31885 ?auto_31886 ) ( ON_BOARD ?auto_31884 ?auto_31887 ) ( POWER_ON ?auto_31884 ) ( not ( = ?auto_31883 ?auto_31884 ) ) ( not ( = ?auto_31885 ?auto_31884 ) ) ( SUPPORTS ?auto_31884 ?auto_31881 ) ( POINTING ?auto_31887 ?auto_31886 ) ( CALIBRATION_TARGET ?auto_31884 ?auto_31886 ) ( NOT_CALIBRATED ?auto_31884 ) )
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
      ?auto_31957 - INSTRUMENT
      ?auto_31963 - SATELLITE
      ?auto_31962 - DIRECTION
      ?auto_31965 - DIRECTION
      ?auto_31964 - MODE
      ?auto_31960 - DIRECTION
      ?auto_31961 - INSTRUMENT
      ?auto_31959 - MODE
      ?auto_31958 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31957 ?auto_31963 ) ( SUPPORTS ?auto_31957 ?auto_31956 ) ( not ( = ?auto_31955 ?auto_31962 ) ) ( not ( = ?auto_31965 ?auto_31955 ) ) ( not ( = ?auto_31965 ?auto_31962 ) ) ( not ( = ?auto_31964 ?auto_31956 ) ) ( CALIBRATION_TARGET ?auto_31957 ?auto_31962 ) ( not ( = ?auto_31962 ?auto_31960 ) ) ( not ( = ?auto_31955 ?auto_31960 ) ) ( not ( = ?auto_31965 ?auto_31960 ) ) ( ON_BOARD ?auto_31961 ?auto_31963 ) ( not ( = ?auto_31957 ?auto_31961 ) ) ( SUPPORTS ?auto_31961 ?auto_31959 ) ( not ( = ?auto_31964 ?auto_31959 ) ) ( not ( = ?auto_31956 ?auto_31959 ) ) ( CALIBRATION_TARGET ?auto_31961 ?auto_31962 ) ( ON_BOARD ?auto_31958 ?auto_31963 ) ( not ( = ?auto_31957 ?auto_31958 ) ) ( not ( = ?auto_31961 ?auto_31958 ) ) ( SUPPORTS ?auto_31958 ?auto_31964 ) ( POINTING ?auto_31963 ?auto_31962 ) ( CALIBRATION_TARGET ?auto_31958 ?auto_31962 ) ( POWER_AVAIL ?auto_31963 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_31958 ?auto_31963 )
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
      ?auto_31971 - INSTRUMENT
      ?auto_31972 - SATELLITE
      ?auto_31973 - DIRECTION
      ?auto_31970 - DIRECTION
      ?auto_31974 - INSTRUMENT
      ?auto_31976 - MODE
      ?auto_31975 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31971 ?auto_31972 ) ( SUPPORTS ?auto_31971 ?auto_31968 ) ( not ( = ?auto_31969 ?auto_31973 ) ) ( not ( = ?auto_31966 ?auto_31969 ) ) ( not ( = ?auto_31966 ?auto_31973 ) ) ( not ( = ?auto_31967 ?auto_31968 ) ) ( CALIBRATION_TARGET ?auto_31971 ?auto_31973 ) ( not ( = ?auto_31973 ?auto_31970 ) ) ( not ( = ?auto_31969 ?auto_31970 ) ) ( not ( = ?auto_31966 ?auto_31970 ) ) ( ON_BOARD ?auto_31974 ?auto_31972 ) ( not ( = ?auto_31971 ?auto_31974 ) ) ( SUPPORTS ?auto_31974 ?auto_31976 ) ( not ( = ?auto_31967 ?auto_31976 ) ) ( not ( = ?auto_31968 ?auto_31976 ) ) ( CALIBRATION_TARGET ?auto_31974 ?auto_31973 ) ( ON_BOARD ?auto_31975 ?auto_31972 ) ( not ( = ?auto_31971 ?auto_31975 ) ) ( not ( = ?auto_31974 ?auto_31975 ) ) ( SUPPORTS ?auto_31975 ?auto_31967 ) ( POINTING ?auto_31972 ?auto_31973 ) ( CALIBRATION_TARGET ?auto_31975 ?auto_31973 ) ( POWER_AVAIL ?auto_31972 ) )
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
      ?auto_31984 - INSTRUMENT
      ?auto_31983 - SATELLITE
      ?auto_31981 - DIRECTION
      ?auto_31987 - DIRECTION
      ?auto_31986 - MODE
      ?auto_31982 - INSTRUMENT
      ?auto_31985 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31984 ?auto_31983 ) ( SUPPORTS ?auto_31984 ?auto_31979 ) ( not ( = ?auto_31980 ?auto_31981 ) ) ( not ( = ?auto_31987 ?auto_31980 ) ) ( not ( = ?auto_31987 ?auto_31981 ) ) ( not ( = ?auto_31986 ?auto_31979 ) ) ( CALIBRATION_TARGET ?auto_31984 ?auto_31981 ) ( not ( = ?auto_31981 ?auto_31977 ) ) ( not ( = ?auto_31980 ?auto_31977 ) ) ( not ( = ?auto_31987 ?auto_31977 ) ) ( ON_BOARD ?auto_31982 ?auto_31983 ) ( not ( = ?auto_31984 ?auto_31982 ) ) ( SUPPORTS ?auto_31982 ?auto_31978 ) ( not ( = ?auto_31986 ?auto_31978 ) ) ( not ( = ?auto_31979 ?auto_31978 ) ) ( CALIBRATION_TARGET ?auto_31982 ?auto_31981 ) ( ON_BOARD ?auto_31985 ?auto_31983 ) ( not ( = ?auto_31984 ?auto_31985 ) ) ( not ( = ?auto_31982 ?auto_31985 ) ) ( SUPPORTS ?auto_31985 ?auto_31986 ) ( POINTING ?auto_31983 ?auto_31981 ) ( CALIBRATION_TARGET ?auto_31985 ?auto_31981 ) ( POWER_AVAIL ?auto_31983 ) )
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
      ?auto_31997 - INSTRUMENT
      ?auto_31996 - SATELLITE
      ?auto_31993 - DIRECTION
      ?auto_31992 - DIRECTION
      ?auto_31995 - INSTRUMENT
      ?auto_31994 - MODE
      ?auto_31998 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31997 ?auto_31996 ) ( SUPPORTS ?auto_31997 ?auto_31989 ) ( not ( = ?auto_31988 ?auto_31993 ) ) ( not ( = ?auto_31991 ?auto_31988 ) ) ( not ( = ?auto_31991 ?auto_31993 ) ) ( not ( = ?auto_31990 ?auto_31989 ) ) ( CALIBRATION_TARGET ?auto_31997 ?auto_31993 ) ( not ( = ?auto_31993 ?auto_31992 ) ) ( not ( = ?auto_31988 ?auto_31992 ) ) ( not ( = ?auto_31991 ?auto_31992 ) ) ( ON_BOARD ?auto_31995 ?auto_31996 ) ( not ( = ?auto_31997 ?auto_31995 ) ) ( SUPPORTS ?auto_31995 ?auto_31994 ) ( not ( = ?auto_31990 ?auto_31994 ) ) ( not ( = ?auto_31989 ?auto_31994 ) ) ( CALIBRATION_TARGET ?auto_31995 ?auto_31993 ) ( ON_BOARD ?auto_31998 ?auto_31996 ) ( not ( = ?auto_31997 ?auto_31998 ) ) ( not ( = ?auto_31995 ?auto_31998 ) ) ( SUPPORTS ?auto_31998 ?auto_31990 ) ( POINTING ?auto_31996 ?auto_31993 ) ( CALIBRATION_TARGET ?auto_31998 ?auto_31993 ) ( POWER_AVAIL ?auto_31996 ) )
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
      ?auto_32006 - INSTRUMENT
      ?auto_32005 - SATELLITE
      ?auto_32003 - DIRECTION
      ?auto_32009 - DIRECTION
      ?auto_32008 - MODE
      ?auto_32004 - INSTRUMENT
      ?auto_32007 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_32006 ?auto_32005 ) ( SUPPORTS ?auto_32006 ?auto_32000 ) ( not ( = ?auto_31999 ?auto_32003 ) ) ( not ( = ?auto_32009 ?auto_31999 ) ) ( not ( = ?auto_32009 ?auto_32003 ) ) ( not ( = ?auto_32008 ?auto_32000 ) ) ( CALIBRATION_TARGET ?auto_32006 ?auto_32003 ) ( not ( = ?auto_32003 ?auto_32002 ) ) ( not ( = ?auto_31999 ?auto_32002 ) ) ( not ( = ?auto_32009 ?auto_32002 ) ) ( ON_BOARD ?auto_32004 ?auto_32005 ) ( not ( = ?auto_32006 ?auto_32004 ) ) ( SUPPORTS ?auto_32004 ?auto_32001 ) ( not ( = ?auto_32008 ?auto_32001 ) ) ( not ( = ?auto_32000 ?auto_32001 ) ) ( CALIBRATION_TARGET ?auto_32004 ?auto_32003 ) ( ON_BOARD ?auto_32007 ?auto_32005 ) ( not ( = ?auto_32006 ?auto_32007 ) ) ( not ( = ?auto_32004 ?auto_32007 ) ) ( SUPPORTS ?auto_32007 ?auto_32008 ) ( POINTING ?auto_32005 ?auto_32003 ) ( CALIBRATION_TARGET ?auto_32007 ?auto_32003 ) ( POWER_AVAIL ?auto_32005 ) )
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
      ?auto_32045 - INSTRUMENT
      ?auto_32044 - SATELLITE
      ?auto_32042 - DIRECTION
      ?auto_32043 - INSTRUMENT
      ?auto_32046 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_32045 ?auto_32044 ) ( SUPPORTS ?auto_32045 ?auto_32040 ) ( not ( = ?auto_32041 ?auto_32042 ) ) ( not ( = ?auto_32036 ?auto_32041 ) ) ( not ( = ?auto_32036 ?auto_32042 ) ) ( not ( = ?auto_32037 ?auto_32040 ) ) ( CALIBRATION_TARGET ?auto_32045 ?auto_32042 ) ( not ( = ?auto_32042 ?auto_32039 ) ) ( not ( = ?auto_32041 ?auto_32039 ) ) ( not ( = ?auto_32036 ?auto_32039 ) ) ( ON_BOARD ?auto_32043 ?auto_32044 ) ( not ( = ?auto_32045 ?auto_32043 ) ) ( SUPPORTS ?auto_32043 ?auto_32038 ) ( not ( = ?auto_32037 ?auto_32038 ) ) ( not ( = ?auto_32040 ?auto_32038 ) ) ( CALIBRATION_TARGET ?auto_32043 ?auto_32042 ) ( ON_BOARD ?auto_32046 ?auto_32044 ) ( not ( = ?auto_32045 ?auto_32046 ) ) ( not ( = ?auto_32043 ?auto_32046 ) ) ( SUPPORTS ?auto_32046 ?auto_32037 ) ( POINTING ?auto_32044 ?auto_32042 ) ( CALIBRATION_TARGET ?auto_32046 ?auto_32042 ) ( POWER_AVAIL ?auto_32044 ) )
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
      ?auto_32069 - INSTRUMENT
      ?auto_32068 - SATELLITE
      ?auto_32066 - DIRECTION
      ?auto_32067 - INSTRUMENT
      ?auto_32070 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_32069 ?auto_32068 ) ( SUPPORTS ?auto_32069 ?auto_32062 ) ( not ( = ?auto_32063 ?auto_32066 ) ) ( not ( = ?auto_32060 ?auto_32063 ) ) ( not ( = ?auto_32060 ?auto_32066 ) ) ( not ( = ?auto_32061 ?auto_32062 ) ) ( CALIBRATION_TARGET ?auto_32069 ?auto_32066 ) ( not ( = ?auto_32066 ?auto_32065 ) ) ( not ( = ?auto_32063 ?auto_32065 ) ) ( not ( = ?auto_32060 ?auto_32065 ) ) ( ON_BOARD ?auto_32067 ?auto_32068 ) ( not ( = ?auto_32069 ?auto_32067 ) ) ( SUPPORTS ?auto_32067 ?auto_32064 ) ( not ( = ?auto_32061 ?auto_32064 ) ) ( not ( = ?auto_32062 ?auto_32064 ) ) ( CALIBRATION_TARGET ?auto_32067 ?auto_32066 ) ( ON_BOARD ?auto_32070 ?auto_32068 ) ( not ( = ?auto_32069 ?auto_32070 ) ) ( not ( = ?auto_32067 ?auto_32070 ) ) ( SUPPORTS ?auto_32070 ?auto_32061 ) ( POINTING ?auto_32068 ?auto_32066 ) ( CALIBRATION_TARGET ?auto_32070 ?auto_32066 ) ( POWER_AVAIL ?auto_32068 ) )
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
      ?auto_32093 - INSTRUMENT
      ?auto_32092 - SATELLITE
      ?auto_32090 - DIRECTION
      ?auto_32091 - INSTRUMENT
      ?auto_32094 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_32093 ?auto_32092 ) ( SUPPORTS ?auto_32093 ?auto_32088 ) ( not ( = ?auto_32089 ?auto_32090 ) ) ( not ( = ?auto_32087 ?auto_32089 ) ) ( not ( = ?auto_32087 ?auto_32090 ) ) ( not ( = ?auto_32086 ?auto_32088 ) ) ( CALIBRATION_TARGET ?auto_32093 ?auto_32090 ) ( not ( = ?auto_32090 ?auto_32084 ) ) ( not ( = ?auto_32089 ?auto_32084 ) ) ( not ( = ?auto_32087 ?auto_32084 ) ) ( ON_BOARD ?auto_32091 ?auto_32092 ) ( not ( = ?auto_32093 ?auto_32091 ) ) ( SUPPORTS ?auto_32091 ?auto_32085 ) ( not ( = ?auto_32086 ?auto_32085 ) ) ( not ( = ?auto_32088 ?auto_32085 ) ) ( CALIBRATION_TARGET ?auto_32091 ?auto_32090 ) ( ON_BOARD ?auto_32094 ?auto_32092 ) ( not ( = ?auto_32093 ?auto_32094 ) ) ( not ( = ?auto_32091 ?auto_32094 ) ) ( SUPPORTS ?auto_32094 ?auto_32086 ) ( POINTING ?auto_32092 ?auto_32090 ) ( CALIBRATION_TARGET ?auto_32094 ?auto_32090 ) ( POWER_AVAIL ?auto_32092 ) )
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
      ?auto_32117 - INSTRUMENT
      ?auto_32116 - SATELLITE
      ?auto_32114 - DIRECTION
      ?auto_32115 - INSTRUMENT
      ?auto_32118 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_32117 ?auto_32116 ) ( SUPPORTS ?auto_32117 ?auto_32110 ) ( not ( = ?auto_32111 ?auto_32114 ) ) ( not ( = ?auto_32113 ?auto_32111 ) ) ( not ( = ?auto_32113 ?auto_32114 ) ) ( not ( = ?auto_32112 ?auto_32110 ) ) ( CALIBRATION_TARGET ?auto_32117 ?auto_32114 ) ( not ( = ?auto_32114 ?auto_32108 ) ) ( not ( = ?auto_32111 ?auto_32108 ) ) ( not ( = ?auto_32113 ?auto_32108 ) ) ( ON_BOARD ?auto_32115 ?auto_32116 ) ( not ( = ?auto_32117 ?auto_32115 ) ) ( SUPPORTS ?auto_32115 ?auto_32109 ) ( not ( = ?auto_32112 ?auto_32109 ) ) ( not ( = ?auto_32110 ?auto_32109 ) ) ( CALIBRATION_TARGET ?auto_32115 ?auto_32114 ) ( ON_BOARD ?auto_32118 ?auto_32116 ) ( not ( = ?auto_32117 ?auto_32118 ) ) ( not ( = ?auto_32115 ?auto_32118 ) ) ( SUPPORTS ?auto_32118 ?auto_32112 ) ( POINTING ?auto_32116 ?auto_32114 ) ( CALIBRATION_TARGET ?auto_32118 ?auto_32114 ) ( POWER_AVAIL ?auto_32116 ) )
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
      ?auto_32167 - INSTRUMENT
      ?auto_32166 - SATELLITE
      ?auto_32164 - DIRECTION
      ?auto_32165 - INSTRUMENT
      ?auto_32168 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_32167 ?auto_32166 ) ( SUPPORTS ?auto_32167 ?auto_32159 ) ( not ( = ?auto_32158 ?auto_32164 ) ) ( not ( = ?auto_32161 ?auto_32158 ) ) ( not ( = ?auto_32161 ?auto_32164 ) ) ( not ( = ?auto_32160 ?auto_32159 ) ) ( CALIBRATION_TARGET ?auto_32167 ?auto_32164 ) ( not ( = ?auto_32164 ?auto_32163 ) ) ( not ( = ?auto_32158 ?auto_32163 ) ) ( not ( = ?auto_32161 ?auto_32163 ) ) ( ON_BOARD ?auto_32165 ?auto_32166 ) ( not ( = ?auto_32167 ?auto_32165 ) ) ( SUPPORTS ?auto_32165 ?auto_32162 ) ( not ( = ?auto_32160 ?auto_32162 ) ) ( not ( = ?auto_32159 ?auto_32162 ) ) ( CALIBRATION_TARGET ?auto_32165 ?auto_32164 ) ( ON_BOARD ?auto_32168 ?auto_32166 ) ( not ( = ?auto_32167 ?auto_32168 ) ) ( not ( = ?auto_32165 ?auto_32168 ) ) ( SUPPORTS ?auto_32168 ?auto_32160 ) ( POINTING ?auto_32166 ?auto_32164 ) ( CALIBRATION_TARGET ?auto_32168 ?auto_32164 ) ( POWER_AVAIL ?auto_32166 ) )
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
      ?auto_32191 - INSTRUMENT
      ?auto_32190 - SATELLITE
      ?auto_32188 - DIRECTION
      ?auto_32189 - INSTRUMENT
      ?auto_32192 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_32191 ?auto_32190 ) ( SUPPORTS ?auto_32191 ?auto_32183 ) ( not ( = ?auto_32182 ?auto_32188 ) ) ( not ( = ?auto_32187 ?auto_32182 ) ) ( not ( = ?auto_32187 ?auto_32188 ) ) ( not ( = ?auto_32186 ?auto_32183 ) ) ( CALIBRATION_TARGET ?auto_32191 ?auto_32188 ) ( not ( = ?auto_32188 ?auto_32185 ) ) ( not ( = ?auto_32182 ?auto_32185 ) ) ( not ( = ?auto_32187 ?auto_32185 ) ) ( ON_BOARD ?auto_32189 ?auto_32190 ) ( not ( = ?auto_32191 ?auto_32189 ) ) ( SUPPORTS ?auto_32189 ?auto_32184 ) ( not ( = ?auto_32186 ?auto_32184 ) ) ( not ( = ?auto_32183 ?auto_32184 ) ) ( CALIBRATION_TARGET ?auto_32189 ?auto_32188 ) ( ON_BOARD ?auto_32192 ?auto_32190 ) ( not ( = ?auto_32191 ?auto_32192 ) ) ( not ( = ?auto_32189 ?auto_32192 ) ) ( SUPPORTS ?auto_32192 ?auto_32186 ) ( POINTING ?auto_32190 ?auto_32188 ) ( CALIBRATION_TARGET ?auto_32192 ?auto_32188 ) ( POWER_AVAIL ?auto_32190 ) )
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
      ?auto_32267 - INSTRUMENT
      ?auto_32266 - SATELLITE
      ?auto_32263 - DIRECTION
      ?auto_32270 - DIRECTION
      ?auto_32269 - MODE
      ?auto_32262 - DIRECTION
      ?auto_32265 - INSTRUMENT
      ?auto_32264 - MODE
      ?auto_32268 - INSTRUMENT
      ?auto_32271 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_32267 ?auto_32266 ) ( SUPPORTS ?auto_32267 ?auto_32261 ) ( not ( = ?auto_32260 ?auto_32263 ) ) ( not ( = ?auto_32270 ?auto_32260 ) ) ( not ( = ?auto_32270 ?auto_32263 ) ) ( not ( = ?auto_32269 ?auto_32261 ) ) ( CALIBRATION_TARGET ?auto_32267 ?auto_32263 ) ( not ( = ?auto_32263 ?auto_32262 ) ) ( not ( = ?auto_32260 ?auto_32262 ) ) ( not ( = ?auto_32270 ?auto_32262 ) ) ( ON_BOARD ?auto_32265 ?auto_32266 ) ( not ( = ?auto_32267 ?auto_32265 ) ) ( SUPPORTS ?auto_32265 ?auto_32264 ) ( not ( = ?auto_32269 ?auto_32264 ) ) ( not ( = ?auto_32261 ?auto_32264 ) ) ( CALIBRATION_TARGET ?auto_32265 ?auto_32263 ) ( ON_BOARD ?auto_32268 ?auto_32266 ) ( not ( = ?auto_32267 ?auto_32268 ) ) ( not ( = ?auto_32265 ?auto_32268 ) ) ( SUPPORTS ?auto_32268 ?auto_32269 ) ( CALIBRATION_TARGET ?auto_32268 ?auto_32263 ) ( POWER_AVAIL ?auto_32266 ) ( POINTING ?auto_32266 ?auto_32271 ) ( not ( = ?auto_32263 ?auto_32271 ) ) ( not ( = ?auto_32260 ?auto_32271 ) ) ( not ( = ?auto_32270 ?auto_32271 ) ) ( not ( = ?auto_32262 ?auto_32271 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_32266 ?auto_32263 ?auto_32271 )
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
      ?auto_32278 - INSTRUMENT
      ?auto_32277 - SATELLITE
      ?auto_32280 - DIRECTION
      ?auto_32282 - DIRECTION
      ?auto_32279 - INSTRUMENT
      ?auto_32281 - MODE
      ?auto_32276 - INSTRUMENT
      ?auto_32283 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_32278 ?auto_32277 ) ( SUPPORTS ?auto_32278 ?auto_32274 ) ( not ( = ?auto_32275 ?auto_32280 ) ) ( not ( = ?auto_32272 ?auto_32275 ) ) ( not ( = ?auto_32272 ?auto_32280 ) ) ( not ( = ?auto_32273 ?auto_32274 ) ) ( CALIBRATION_TARGET ?auto_32278 ?auto_32280 ) ( not ( = ?auto_32280 ?auto_32282 ) ) ( not ( = ?auto_32275 ?auto_32282 ) ) ( not ( = ?auto_32272 ?auto_32282 ) ) ( ON_BOARD ?auto_32279 ?auto_32277 ) ( not ( = ?auto_32278 ?auto_32279 ) ) ( SUPPORTS ?auto_32279 ?auto_32281 ) ( not ( = ?auto_32273 ?auto_32281 ) ) ( not ( = ?auto_32274 ?auto_32281 ) ) ( CALIBRATION_TARGET ?auto_32279 ?auto_32280 ) ( ON_BOARD ?auto_32276 ?auto_32277 ) ( not ( = ?auto_32278 ?auto_32276 ) ) ( not ( = ?auto_32279 ?auto_32276 ) ) ( SUPPORTS ?auto_32276 ?auto_32273 ) ( CALIBRATION_TARGET ?auto_32276 ?auto_32280 ) ( POWER_AVAIL ?auto_32277 ) ( POINTING ?auto_32277 ?auto_32283 ) ( not ( = ?auto_32280 ?auto_32283 ) ) ( not ( = ?auto_32275 ?auto_32283 ) ) ( not ( = ?auto_32272 ?auto_32283 ) ) ( not ( = ?auto_32282 ?auto_32283 ) ) )
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
      ?auto_32292 - INSTRUMENT
      ?auto_32289 - SATELLITE
      ?auto_32288 - DIRECTION
      ?auto_32295 - DIRECTION
      ?auto_32294 - MODE
      ?auto_32293 - INSTRUMENT
      ?auto_32291 - INSTRUMENT
      ?auto_32290 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_32292 ?auto_32289 ) ( SUPPORTS ?auto_32292 ?auto_32286 ) ( not ( = ?auto_32287 ?auto_32288 ) ) ( not ( = ?auto_32295 ?auto_32287 ) ) ( not ( = ?auto_32295 ?auto_32288 ) ) ( not ( = ?auto_32294 ?auto_32286 ) ) ( CALIBRATION_TARGET ?auto_32292 ?auto_32288 ) ( not ( = ?auto_32288 ?auto_32284 ) ) ( not ( = ?auto_32287 ?auto_32284 ) ) ( not ( = ?auto_32295 ?auto_32284 ) ) ( ON_BOARD ?auto_32293 ?auto_32289 ) ( not ( = ?auto_32292 ?auto_32293 ) ) ( SUPPORTS ?auto_32293 ?auto_32285 ) ( not ( = ?auto_32294 ?auto_32285 ) ) ( not ( = ?auto_32286 ?auto_32285 ) ) ( CALIBRATION_TARGET ?auto_32293 ?auto_32288 ) ( ON_BOARD ?auto_32291 ?auto_32289 ) ( not ( = ?auto_32292 ?auto_32291 ) ) ( not ( = ?auto_32293 ?auto_32291 ) ) ( SUPPORTS ?auto_32291 ?auto_32294 ) ( CALIBRATION_TARGET ?auto_32291 ?auto_32288 ) ( POWER_AVAIL ?auto_32289 ) ( POINTING ?auto_32289 ?auto_32290 ) ( not ( = ?auto_32288 ?auto_32290 ) ) ( not ( = ?auto_32287 ?auto_32290 ) ) ( not ( = ?auto_32295 ?auto_32290 ) ) ( not ( = ?auto_32284 ?auto_32290 ) ) )
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
      ?auto_32304 - INSTRUMENT
      ?auto_32301 - SATELLITE
      ?auto_32300 - DIRECTION
      ?auto_32306 - DIRECTION
      ?auto_32305 - INSTRUMENT
      ?auto_32307 - MODE
      ?auto_32303 - INSTRUMENT
      ?auto_32302 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_32304 ?auto_32301 ) ( SUPPORTS ?auto_32304 ?auto_32297 ) ( not ( = ?auto_32296 ?auto_32300 ) ) ( not ( = ?auto_32299 ?auto_32296 ) ) ( not ( = ?auto_32299 ?auto_32300 ) ) ( not ( = ?auto_32298 ?auto_32297 ) ) ( CALIBRATION_TARGET ?auto_32304 ?auto_32300 ) ( not ( = ?auto_32300 ?auto_32306 ) ) ( not ( = ?auto_32296 ?auto_32306 ) ) ( not ( = ?auto_32299 ?auto_32306 ) ) ( ON_BOARD ?auto_32305 ?auto_32301 ) ( not ( = ?auto_32304 ?auto_32305 ) ) ( SUPPORTS ?auto_32305 ?auto_32307 ) ( not ( = ?auto_32298 ?auto_32307 ) ) ( not ( = ?auto_32297 ?auto_32307 ) ) ( CALIBRATION_TARGET ?auto_32305 ?auto_32300 ) ( ON_BOARD ?auto_32303 ?auto_32301 ) ( not ( = ?auto_32304 ?auto_32303 ) ) ( not ( = ?auto_32305 ?auto_32303 ) ) ( SUPPORTS ?auto_32303 ?auto_32298 ) ( CALIBRATION_TARGET ?auto_32303 ?auto_32300 ) ( POWER_AVAIL ?auto_32301 ) ( POINTING ?auto_32301 ?auto_32302 ) ( not ( = ?auto_32300 ?auto_32302 ) ) ( not ( = ?auto_32296 ?auto_32302 ) ) ( not ( = ?auto_32299 ?auto_32302 ) ) ( not ( = ?auto_32306 ?auto_32302 ) ) )
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
      ?auto_32316 - INSTRUMENT
      ?auto_32313 - SATELLITE
      ?auto_32312 - DIRECTION
      ?auto_32319 - DIRECTION
      ?auto_32318 - MODE
      ?auto_32317 - INSTRUMENT
      ?auto_32315 - INSTRUMENT
      ?auto_32314 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_32316 ?auto_32313 ) ( SUPPORTS ?auto_32316 ?auto_32309 ) ( not ( = ?auto_32308 ?auto_32312 ) ) ( not ( = ?auto_32319 ?auto_32308 ) ) ( not ( = ?auto_32319 ?auto_32312 ) ) ( not ( = ?auto_32318 ?auto_32309 ) ) ( CALIBRATION_TARGET ?auto_32316 ?auto_32312 ) ( not ( = ?auto_32312 ?auto_32311 ) ) ( not ( = ?auto_32308 ?auto_32311 ) ) ( not ( = ?auto_32319 ?auto_32311 ) ) ( ON_BOARD ?auto_32317 ?auto_32313 ) ( not ( = ?auto_32316 ?auto_32317 ) ) ( SUPPORTS ?auto_32317 ?auto_32310 ) ( not ( = ?auto_32318 ?auto_32310 ) ) ( not ( = ?auto_32309 ?auto_32310 ) ) ( CALIBRATION_TARGET ?auto_32317 ?auto_32312 ) ( ON_BOARD ?auto_32315 ?auto_32313 ) ( not ( = ?auto_32316 ?auto_32315 ) ) ( not ( = ?auto_32317 ?auto_32315 ) ) ( SUPPORTS ?auto_32315 ?auto_32318 ) ( CALIBRATION_TARGET ?auto_32315 ?auto_32312 ) ( POWER_AVAIL ?auto_32313 ) ( POINTING ?auto_32313 ?auto_32314 ) ( not ( = ?auto_32312 ?auto_32314 ) ) ( not ( = ?auto_32308 ?auto_32314 ) ) ( not ( = ?auto_32319 ?auto_32314 ) ) ( not ( = ?auto_32311 ?auto_32314 ) ) )
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
      ?auto_32358 - INSTRUMENT
      ?auto_32355 - SATELLITE
      ?auto_32354 - DIRECTION
      ?auto_32359 - INSTRUMENT
      ?auto_32357 - INSTRUMENT
      ?auto_32356 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_32358 ?auto_32355 ) ( SUPPORTS ?auto_32358 ?auto_32352 ) ( not ( = ?auto_32353 ?auto_32354 ) ) ( not ( = ?auto_32348 ?auto_32353 ) ) ( not ( = ?auto_32348 ?auto_32354 ) ) ( not ( = ?auto_32349 ?auto_32352 ) ) ( CALIBRATION_TARGET ?auto_32358 ?auto_32354 ) ( not ( = ?auto_32354 ?auto_32351 ) ) ( not ( = ?auto_32353 ?auto_32351 ) ) ( not ( = ?auto_32348 ?auto_32351 ) ) ( ON_BOARD ?auto_32359 ?auto_32355 ) ( not ( = ?auto_32358 ?auto_32359 ) ) ( SUPPORTS ?auto_32359 ?auto_32350 ) ( not ( = ?auto_32349 ?auto_32350 ) ) ( not ( = ?auto_32352 ?auto_32350 ) ) ( CALIBRATION_TARGET ?auto_32359 ?auto_32354 ) ( ON_BOARD ?auto_32357 ?auto_32355 ) ( not ( = ?auto_32358 ?auto_32357 ) ) ( not ( = ?auto_32359 ?auto_32357 ) ) ( SUPPORTS ?auto_32357 ?auto_32349 ) ( CALIBRATION_TARGET ?auto_32357 ?auto_32354 ) ( POWER_AVAIL ?auto_32355 ) ( POINTING ?auto_32355 ?auto_32356 ) ( not ( = ?auto_32354 ?auto_32356 ) ) ( not ( = ?auto_32353 ?auto_32356 ) ) ( not ( = ?auto_32348 ?auto_32356 ) ) ( not ( = ?auto_32351 ?auto_32356 ) ) )
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
      ?auto_32384 - INSTRUMENT
      ?auto_32381 - SATELLITE
      ?auto_32380 - DIRECTION
      ?auto_32385 - INSTRUMENT
      ?auto_32383 - INSTRUMENT
      ?auto_32382 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_32384 ?auto_32381 ) ( SUPPORTS ?auto_32384 ?auto_32376 ) ( not ( = ?auto_32377 ?auto_32380 ) ) ( not ( = ?auto_32374 ?auto_32377 ) ) ( not ( = ?auto_32374 ?auto_32380 ) ) ( not ( = ?auto_32375 ?auto_32376 ) ) ( CALIBRATION_TARGET ?auto_32384 ?auto_32380 ) ( not ( = ?auto_32380 ?auto_32379 ) ) ( not ( = ?auto_32377 ?auto_32379 ) ) ( not ( = ?auto_32374 ?auto_32379 ) ) ( ON_BOARD ?auto_32385 ?auto_32381 ) ( not ( = ?auto_32384 ?auto_32385 ) ) ( SUPPORTS ?auto_32385 ?auto_32378 ) ( not ( = ?auto_32375 ?auto_32378 ) ) ( not ( = ?auto_32376 ?auto_32378 ) ) ( CALIBRATION_TARGET ?auto_32385 ?auto_32380 ) ( ON_BOARD ?auto_32383 ?auto_32381 ) ( not ( = ?auto_32384 ?auto_32383 ) ) ( not ( = ?auto_32385 ?auto_32383 ) ) ( SUPPORTS ?auto_32383 ?auto_32375 ) ( CALIBRATION_TARGET ?auto_32383 ?auto_32380 ) ( POWER_AVAIL ?auto_32381 ) ( POINTING ?auto_32381 ?auto_32382 ) ( not ( = ?auto_32380 ?auto_32382 ) ) ( not ( = ?auto_32377 ?auto_32382 ) ) ( not ( = ?auto_32374 ?auto_32382 ) ) ( not ( = ?auto_32379 ?auto_32382 ) ) )
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
      ?auto_32410 - INSTRUMENT
      ?auto_32407 - SATELLITE
      ?auto_32406 - DIRECTION
      ?auto_32411 - INSTRUMENT
      ?auto_32409 - INSTRUMENT
      ?auto_32408 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_32410 ?auto_32407 ) ( SUPPORTS ?auto_32410 ?auto_32404 ) ( not ( = ?auto_32405 ?auto_32406 ) ) ( not ( = ?auto_32403 ?auto_32405 ) ) ( not ( = ?auto_32403 ?auto_32406 ) ) ( not ( = ?auto_32402 ?auto_32404 ) ) ( CALIBRATION_TARGET ?auto_32410 ?auto_32406 ) ( not ( = ?auto_32406 ?auto_32400 ) ) ( not ( = ?auto_32405 ?auto_32400 ) ) ( not ( = ?auto_32403 ?auto_32400 ) ) ( ON_BOARD ?auto_32411 ?auto_32407 ) ( not ( = ?auto_32410 ?auto_32411 ) ) ( SUPPORTS ?auto_32411 ?auto_32401 ) ( not ( = ?auto_32402 ?auto_32401 ) ) ( not ( = ?auto_32404 ?auto_32401 ) ) ( CALIBRATION_TARGET ?auto_32411 ?auto_32406 ) ( ON_BOARD ?auto_32409 ?auto_32407 ) ( not ( = ?auto_32410 ?auto_32409 ) ) ( not ( = ?auto_32411 ?auto_32409 ) ) ( SUPPORTS ?auto_32409 ?auto_32402 ) ( CALIBRATION_TARGET ?auto_32409 ?auto_32406 ) ( POWER_AVAIL ?auto_32407 ) ( POINTING ?auto_32407 ?auto_32408 ) ( not ( = ?auto_32406 ?auto_32408 ) ) ( not ( = ?auto_32405 ?auto_32408 ) ) ( not ( = ?auto_32403 ?auto_32408 ) ) ( not ( = ?auto_32400 ?auto_32408 ) ) )
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
      ?auto_32436 - INSTRUMENT
      ?auto_32433 - SATELLITE
      ?auto_32432 - DIRECTION
      ?auto_32437 - INSTRUMENT
      ?auto_32435 - INSTRUMENT
      ?auto_32434 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_32436 ?auto_32433 ) ( SUPPORTS ?auto_32436 ?auto_32428 ) ( not ( = ?auto_32429 ?auto_32432 ) ) ( not ( = ?auto_32431 ?auto_32429 ) ) ( not ( = ?auto_32431 ?auto_32432 ) ) ( not ( = ?auto_32430 ?auto_32428 ) ) ( CALIBRATION_TARGET ?auto_32436 ?auto_32432 ) ( not ( = ?auto_32432 ?auto_32426 ) ) ( not ( = ?auto_32429 ?auto_32426 ) ) ( not ( = ?auto_32431 ?auto_32426 ) ) ( ON_BOARD ?auto_32437 ?auto_32433 ) ( not ( = ?auto_32436 ?auto_32437 ) ) ( SUPPORTS ?auto_32437 ?auto_32427 ) ( not ( = ?auto_32430 ?auto_32427 ) ) ( not ( = ?auto_32428 ?auto_32427 ) ) ( CALIBRATION_TARGET ?auto_32437 ?auto_32432 ) ( ON_BOARD ?auto_32435 ?auto_32433 ) ( not ( = ?auto_32436 ?auto_32435 ) ) ( not ( = ?auto_32437 ?auto_32435 ) ) ( SUPPORTS ?auto_32435 ?auto_32430 ) ( CALIBRATION_TARGET ?auto_32435 ?auto_32432 ) ( POWER_AVAIL ?auto_32433 ) ( POINTING ?auto_32433 ?auto_32434 ) ( not ( = ?auto_32432 ?auto_32434 ) ) ( not ( = ?auto_32429 ?auto_32434 ) ) ( not ( = ?auto_32431 ?auto_32434 ) ) ( not ( = ?auto_32426 ?auto_32434 ) ) )
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
      ?auto_32490 - INSTRUMENT
      ?auto_32487 - SATELLITE
      ?auto_32486 - DIRECTION
      ?auto_32491 - INSTRUMENT
      ?auto_32489 - INSTRUMENT
      ?auto_32488 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_32490 ?auto_32487 ) ( SUPPORTS ?auto_32490 ?auto_32481 ) ( not ( = ?auto_32480 ?auto_32486 ) ) ( not ( = ?auto_32483 ?auto_32480 ) ) ( not ( = ?auto_32483 ?auto_32486 ) ) ( not ( = ?auto_32482 ?auto_32481 ) ) ( CALIBRATION_TARGET ?auto_32490 ?auto_32486 ) ( not ( = ?auto_32486 ?auto_32485 ) ) ( not ( = ?auto_32480 ?auto_32485 ) ) ( not ( = ?auto_32483 ?auto_32485 ) ) ( ON_BOARD ?auto_32491 ?auto_32487 ) ( not ( = ?auto_32490 ?auto_32491 ) ) ( SUPPORTS ?auto_32491 ?auto_32484 ) ( not ( = ?auto_32482 ?auto_32484 ) ) ( not ( = ?auto_32481 ?auto_32484 ) ) ( CALIBRATION_TARGET ?auto_32491 ?auto_32486 ) ( ON_BOARD ?auto_32489 ?auto_32487 ) ( not ( = ?auto_32490 ?auto_32489 ) ) ( not ( = ?auto_32491 ?auto_32489 ) ) ( SUPPORTS ?auto_32489 ?auto_32482 ) ( CALIBRATION_TARGET ?auto_32489 ?auto_32486 ) ( POWER_AVAIL ?auto_32487 ) ( POINTING ?auto_32487 ?auto_32488 ) ( not ( = ?auto_32486 ?auto_32488 ) ) ( not ( = ?auto_32480 ?auto_32488 ) ) ( not ( = ?auto_32483 ?auto_32488 ) ) ( not ( = ?auto_32485 ?auto_32488 ) ) )
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
      ?auto_32516 - INSTRUMENT
      ?auto_32513 - SATELLITE
      ?auto_32512 - DIRECTION
      ?auto_32517 - INSTRUMENT
      ?auto_32515 - INSTRUMENT
      ?auto_32514 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_32516 ?auto_32513 ) ( SUPPORTS ?auto_32516 ?auto_32507 ) ( not ( = ?auto_32506 ?auto_32512 ) ) ( not ( = ?auto_32511 ?auto_32506 ) ) ( not ( = ?auto_32511 ?auto_32512 ) ) ( not ( = ?auto_32510 ?auto_32507 ) ) ( CALIBRATION_TARGET ?auto_32516 ?auto_32512 ) ( not ( = ?auto_32512 ?auto_32509 ) ) ( not ( = ?auto_32506 ?auto_32509 ) ) ( not ( = ?auto_32511 ?auto_32509 ) ) ( ON_BOARD ?auto_32517 ?auto_32513 ) ( not ( = ?auto_32516 ?auto_32517 ) ) ( SUPPORTS ?auto_32517 ?auto_32508 ) ( not ( = ?auto_32510 ?auto_32508 ) ) ( not ( = ?auto_32507 ?auto_32508 ) ) ( CALIBRATION_TARGET ?auto_32517 ?auto_32512 ) ( ON_BOARD ?auto_32515 ?auto_32513 ) ( not ( = ?auto_32516 ?auto_32515 ) ) ( not ( = ?auto_32517 ?auto_32515 ) ) ( SUPPORTS ?auto_32515 ?auto_32510 ) ( CALIBRATION_TARGET ?auto_32515 ?auto_32512 ) ( POWER_AVAIL ?auto_32513 ) ( POINTING ?auto_32513 ?auto_32514 ) ( not ( = ?auto_32512 ?auto_32514 ) ) ( not ( = ?auto_32506 ?auto_32514 ) ) ( not ( = ?auto_32511 ?auto_32514 ) ) ( not ( = ?auto_32509 ?auto_32514 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_32511 ?auto_32510 ?auto_32506 ?auto_32507 )
      ( GET-3IMAGE-VERIFY ?auto_32506 ?auto_32507 ?auto_32509 ?auto_32508 ?auto_32511 ?auto_32510 ) )
  )

)

