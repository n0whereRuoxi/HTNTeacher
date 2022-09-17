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
      ?auto_7516 - DIRECTION
      ?auto_7517 - MODE
    )
    :vars
    (
      ?auto_7518 - INSTRUMENT
      ?auto_7519 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_7518 ) ( ON_BOARD ?auto_7518 ?auto_7519 ) ( SUPPORTS ?auto_7518 ?auto_7517 ) ( POWER_ON ?auto_7518 ) ( POINTING ?auto_7519 ?auto_7516 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_7519 ?auto_7516 ?auto_7518 ?auto_7517 )
      ( GET-1IMAGE-VERIFY ?auto_7516 ?auto_7517 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7534 - DIRECTION
      ?auto_7535 - MODE
    )
    :vars
    (
      ?auto_7536 - INSTRUMENT
      ?auto_7537 - SATELLITE
      ?auto_7538 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_7536 ) ( ON_BOARD ?auto_7536 ?auto_7537 ) ( SUPPORTS ?auto_7536 ?auto_7535 ) ( POWER_ON ?auto_7536 ) ( POINTING ?auto_7537 ?auto_7538 ) ( not ( = ?auto_7534 ?auto_7538 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_7537 ?auto_7534 ?auto_7538 )
      ( GET-1IMAGE ?auto_7534 ?auto_7535 )
      ( GET-1IMAGE-VERIFY ?auto_7534 ?auto_7535 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7555 - DIRECTION
      ?auto_7556 - MODE
    )
    :vars
    (
      ?auto_7558 - INSTRUMENT
      ?auto_7557 - SATELLITE
      ?auto_7559 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7558 ?auto_7557 ) ( SUPPORTS ?auto_7558 ?auto_7556 ) ( POWER_ON ?auto_7558 ) ( POINTING ?auto_7557 ?auto_7559 ) ( not ( = ?auto_7555 ?auto_7559 ) ) ( CALIBRATION_TARGET ?auto_7558 ?auto_7559 ) ( NOT_CALIBRATED ?auto_7558 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_7557 ?auto_7558 ?auto_7559 )
      ( GET-1IMAGE ?auto_7555 ?auto_7556 )
      ( GET-1IMAGE-VERIFY ?auto_7555 ?auto_7556 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7576 - DIRECTION
      ?auto_7577 - MODE
    )
    :vars
    (
      ?auto_7578 - INSTRUMENT
      ?auto_7579 - SATELLITE
      ?auto_7580 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7578 ?auto_7579 ) ( SUPPORTS ?auto_7578 ?auto_7577 ) ( POINTING ?auto_7579 ?auto_7580 ) ( not ( = ?auto_7576 ?auto_7580 ) ) ( CALIBRATION_TARGET ?auto_7578 ?auto_7580 ) ( POWER_AVAIL ?auto_7579 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_7578 ?auto_7579 )
      ( GET-1IMAGE ?auto_7576 ?auto_7577 )
      ( GET-1IMAGE-VERIFY ?auto_7576 ?auto_7577 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7597 - DIRECTION
      ?auto_7598 - MODE
    )
    :vars
    (
      ?auto_7601 - INSTRUMENT
      ?auto_7599 - SATELLITE
      ?auto_7600 - DIRECTION
      ?auto_7602 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7601 ?auto_7599 ) ( SUPPORTS ?auto_7601 ?auto_7598 ) ( not ( = ?auto_7597 ?auto_7600 ) ) ( CALIBRATION_TARGET ?auto_7601 ?auto_7600 ) ( POWER_AVAIL ?auto_7599 ) ( POINTING ?auto_7599 ?auto_7602 ) ( not ( = ?auto_7600 ?auto_7602 ) ) ( not ( = ?auto_7597 ?auto_7602 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_7599 ?auto_7600 ?auto_7602 )
      ( GET-1IMAGE ?auto_7597 ?auto_7598 )
      ( GET-1IMAGE-VERIFY ?auto_7597 ?auto_7598 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7682 - DIRECTION
      ?auto_7683 - MODE
      ?auto_7684 - DIRECTION
      ?auto_7681 - MODE
    )
    :vars
    (
      ?auto_7686 - INSTRUMENT
      ?auto_7685 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_7686 ) ( ON_BOARD ?auto_7686 ?auto_7685 ) ( SUPPORTS ?auto_7686 ?auto_7681 ) ( POWER_ON ?auto_7686 ) ( POINTING ?auto_7685 ?auto_7684 ) ( HAVE_IMAGE ?auto_7682 ?auto_7683 ) ( not ( = ?auto_7682 ?auto_7684 ) ) ( not ( = ?auto_7683 ?auto_7681 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7684 ?auto_7681 )
      ( GET-2IMAGE-VERIFY ?auto_7682 ?auto_7683 ?auto_7684 ?auto_7681 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7688 - DIRECTION
      ?auto_7689 - MODE
      ?auto_7690 - DIRECTION
      ?auto_7687 - MODE
    )
    :vars
    (
      ?auto_7692 - INSTRUMENT
      ?auto_7691 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_7692 ) ( ON_BOARD ?auto_7692 ?auto_7691 ) ( SUPPORTS ?auto_7692 ?auto_7689 ) ( POWER_ON ?auto_7692 ) ( POINTING ?auto_7691 ?auto_7688 ) ( HAVE_IMAGE ?auto_7690 ?auto_7687 ) ( not ( = ?auto_7688 ?auto_7690 ) ) ( not ( = ?auto_7689 ?auto_7687 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7688 ?auto_7689 )
      ( GET-2IMAGE-VERIFY ?auto_7688 ?auto_7689 ?auto_7690 ?auto_7687 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7700 - DIRECTION
      ?auto_7701 - MODE
      ?auto_7702 - DIRECTION
      ?auto_7699 - MODE
      ?auto_7703 - DIRECTION
      ?auto_7704 - MODE
    )
    :vars
    (
      ?auto_7706 - INSTRUMENT
      ?auto_7705 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_7706 ) ( ON_BOARD ?auto_7706 ?auto_7705 ) ( SUPPORTS ?auto_7706 ?auto_7704 ) ( POWER_ON ?auto_7706 ) ( POINTING ?auto_7705 ?auto_7703 ) ( HAVE_IMAGE ?auto_7700 ?auto_7701 ) ( HAVE_IMAGE ?auto_7702 ?auto_7699 ) ( not ( = ?auto_7700 ?auto_7702 ) ) ( not ( = ?auto_7700 ?auto_7703 ) ) ( not ( = ?auto_7701 ?auto_7699 ) ) ( not ( = ?auto_7701 ?auto_7704 ) ) ( not ( = ?auto_7702 ?auto_7703 ) ) ( not ( = ?auto_7699 ?auto_7704 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7703 ?auto_7704 )
      ( GET-3IMAGE-VERIFY ?auto_7700 ?auto_7701 ?auto_7702 ?auto_7699 ?auto_7703 ?auto_7704 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7708 - DIRECTION
      ?auto_7709 - MODE
      ?auto_7710 - DIRECTION
      ?auto_7707 - MODE
      ?auto_7711 - DIRECTION
      ?auto_7712 - MODE
    )
    :vars
    (
      ?auto_7714 - INSTRUMENT
      ?auto_7713 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_7714 ) ( ON_BOARD ?auto_7714 ?auto_7713 ) ( SUPPORTS ?auto_7714 ?auto_7707 ) ( POWER_ON ?auto_7714 ) ( POINTING ?auto_7713 ?auto_7710 ) ( HAVE_IMAGE ?auto_7708 ?auto_7709 ) ( HAVE_IMAGE ?auto_7711 ?auto_7712 ) ( not ( = ?auto_7708 ?auto_7710 ) ) ( not ( = ?auto_7708 ?auto_7711 ) ) ( not ( = ?auto_7709 ?auto_7707 ) ) ( not ( = ?auto_7709 ?auto_7712 ) ) ( not ( = ?auto_7710 ?auto_7711 ) ) ( not ( = ?auto_7707 ?auto_7712 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7710 ?auto_7707 )
      ( GET-3IMAGE-VERIFY ?auto_7708 ?auto_7709 ?auto_7710 ?auto_7707 ?auto_7711 ?auto_7712 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7724 - DIRECTION
      ?auto_7725 - MODE
      ?auto_7726 - DIRECTION
      ?auto_7723 - MODE
      ?auto_7727 - DIRECTION
      ?auto_7728 - MODE
    )
    :vars
    (
      ?auto_7730 - INSTRUMENT
      ?auto_7729 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_7730 ) ( ON_BOARD ?auto_7730 ?auto_7729 ) ( SUPPORTS ?auto_7730 ?auto_7725 ) ( POWER_ON ?auto_7730 ) ( POINTING ?auto_7729 ?auto_7724 ) ( HAVE_IMAGE ?auto_7726 ?auto_7723 ) ( HAVE_IMAGE ?auto_7727 ?auto_7728 ) ( not ( = ?auto_7724 ?auto_7726 ) ) ( not ( = ?auto_7724 ?auto_7727 ) ) ( not ( = ?auto_7725 ?auto_7723 ) ) ( not ( = ?auto_7725 ?auto_7728 ) ) ( not ( = ?auto_7726 ?auto_7727 ) ) ( not ( = ?auto_7723 ?auto_7728 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7724 ?auto_7725 )
      ( GET-3IMAGE-VERIFY ?auto_7724 ?auto_7725 ?auto_7726 ?auto_7723 ?auto_7727 ?auto_7728 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7761 - DIRECTION
      ?auto_7762 - MODE
      ?auto_7763 - DIRECTION
      ?auto_7760 - MODE
    )
    :vars
    (
      ?auto_7766 - INSTRUMENT
      ?auto_7765 - SATELLITE
      ?auto_7764 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_7766 ) ( ON_BOARD ?auto_7766 ?auto_7765 ) ( SUPPORTS ?auto_7766 ?auto_7760 ) ( POWER_ON ?auto_7766 ) ( POINTING ?auto_7765 ?auto_7764 ) ( not ( = ?auto_7763 ?auto_7764 ) ) ( HAVE_IMAGE ?auto_7761 ?auto_7762 ) ( not ( = ?auto_7761 ?auto_7763 ) ) ( not ( = ?auto_7761 ?auto_7764 ) ) ( not ( = ?auto_7762 ?auto_7760 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7763 ?auto_7760 )
      ( GET-2IMAGE-VERIFY ?auto_7761 ?auto_7762 ?auto_7763 ?auto_7760 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7768 - DIRECTION
      ?auto_7769 - MODE
      ?auto_7770 - DIRECTION
      ?auto_7767 - MODE
    )
    :vars
    (
      ?auto_7771 - INSTRUMENT
      ?auto_7773 - SATELLITE
      ?auto_7772 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_7771 ) ( ON_BOARD ?auto_7771 ?auto_7773 ) ( SUPPORTS ?auto_7771 ?auto_7769 ) ( POWER_ON ?auto_7771 ) ( POINTING ?auto_7773 ?auto_7772 ) ( not ( = ?auto_7768 ?auto_7772 ) ) ( HAVE_IMAGE ?auto_7770 ?auto_7767 ) ( not ( = ?auto_7770 ?auto_7768 ) ) ( not ( = ?auto_7770 ?auto_7772 ) ) ( not ( = ?auto_7767 ?auto_7769 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7770 ?auto_7767 ?auto_7768 ?auto_7769 )
      ( GET-2IMAGE-VERIFY ?auto_7768 ?auto_7769 ?auto_7770 ?auto_7767 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7784 - DIRECTION
      ?auto_7785 - MODE
      ?auto_7786 - DIRECTION
      ?auto_7783 - MODE
      ?auto_7787 - DIRECTION
      ?auto_7788 - MODE
    )
    :vars
    (
      ?auto_7789 - INSTRUMENT
      ?auto_7791 - SATELLITE
      ?auto_7790 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_7789 ) ( ON_BOARD ?auto_7789 ?auto_7791 ) ( SUPPORTS ?auto_7789 ?auto_7788 ) ( POWER_ON ?auto_7789 ) ( POINTING ?auto_7791 ?auto_7790 ) ( not ( = ?auto_7787 ?auto_7790 ) ) ( HAVE_IMAGE ?auto_7784 ?auto_7783 ) ( not ( = ?auto_7784 ?auto_7787 ) ) ( not ( = ?auto_7784 ?auto_7790 ) ) ( not ( = ?auto_7783 ?auto_7788 ) ) ( HAVE_IMAGE ?auto_7784 ?auto_7785 ) ( HAVE_IMAGE ?auto_7786 ?auto_7783 ) ( not ( = ?auto_7784 ?auto_7786 ) ) ( not ( = ?auto_7785 ?auto_7783 ) ) ( not ( = ?auto_7785 ?auto_7788 ) ) ( not ( = ?auto_7786 ?auto_7787 ) ) ( not ( = ?auto_7786 ?auto_7790 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7784 ?auto_7783 ?auto_7787 ?auto_7788 )
      ( GET-3IMAGE-VERIFY ?auto_7784 ?auto_7785 ?auto_7786 ?auto_7783 ?auto_7787 ?auto_7788 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7793 - DIRECTION
      ?auto_7794 - MODE
      ?auto_7795 - DIRECTION
      ?auto_7792 - MODE
      ?auto_7796 - DIRECTION
      ?auto_7797 - MODE
    )
    :vars
    (
      ?auto_7798 - INSTRUMENT
      ?auto_7800 - SATELLITE
      ?auto_7799 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_7798 ) ( ON_BOARD ?auto_7798 ?auto_7800 ) ( SUPPORTS ?auto_7798 ?auto_7792 ) ( POWER_ON ?auto_7798 ) ( POINTING ?auto_7800 ?auto_7799 ) ( not ( = ?auto_7795 ?auto_7799 ) ) ( HAVE_IMAGE ?auto_7796 ?auto_7794 ) ( not ( = ?auto_7796 ?auto_7795 ) ) ( not ( = ?auto_7796 ?auto_7799 ) ) ( not ( = ?auto_7794 ?auto_7792 ) ) ( HAVE_IMAGE ?auto_7793 ?auto_7794 ) ( HAVE_IMAGE ?auto_7796 ?auto_7797 ) ( not ( = ?auto_7793 ?auto_7795 ) ) ( not ( = ?auto_7793 ?auto_7796 ) ) ( not ( = ?auto_7793 ?auto_7799 ) ) ( not ( = ?auto_7794 ?auto_7797 ) ) ( not ( = ?auto_7792 ?auto_7797 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7796 ?auto_7794 ?auto_7795 ?auto_7792 )
      ( GET-3IMAGE-VERIFY ?auto_7793 ?auto_7794 ?auto_7795 ?auto_7792 ?auto_7796 ?auto_7797 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7811 - DIRECTION
      ?auto_7812 - MODE
      ?auto_7813 - DIRECTION
      ?auto_7810 - MODE
      ?auto_7814 - DIRECTION
      ?auto_7815 - MODE
    )
    :vars
    (
      ?auto_7816 - INSTRUMENT
      ?auto_7818 - SATELLITE
      ?auto_7817 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_7816 ) ( ON_BOARD ?auto_7816 ?auto_7818 ) ( SUPPORTS ?auto_7816 ?auto_7812 ) ( POWER_ON ?auto_7816 ) ( POINTING ?auto_7818 ?auto_7817 ) ( not ( = ?auto_7811 ?auto_7817 ) ) ( HAVE_IMAGE ?auto_7814 ?auto_7815 ) ( not ( = ?auto_7814 ?auto_7811 ) ) ( not ( = ?auto_7814 ?auto_7817 ) ) ( not ( = ?auto_7815 ?auto_7812 ) ) ( HAVE_IMAGE ?auto_7813 ?auto_7810 ) ( not ( = ?auto_7811 ?auto_7813 ) ) ( not ( = ?auto_7812 ?auto_7810 ) ) ( not ( = ?auto_7813 ?auto_7814 ) ) ( not ( = ?auto_7813 ?auto_7817 ) ) ( not ( = ?auto_7810 ?auto_7815 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7814 ?auto_7815 ?auto_7811 ?auto_7812 )
      ( GET-3IMAGE-VERIFY ?auto_7811 ?auto_7812 ?auto_7813 ?auto_7810 ?auto_7814 ?auto_7815 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7848 - DIRECTION
      ?auto_7849 - MODE
    )
    :vars
    (
      ?auto_7850 - INSTRUMENT
      ?auto_7854 - SATELLITE
      ?auto_7853 - DIRECTION
      ?auto_7852 - DIRECTION
      ?auto_7851 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_7850 ?auto_7854 ) ( SUPPORTS ?auto_7850 ?auto_7849 ) ( POWER_ON ?auto_7850 ) ( POINTING ?auto_7854 ?auto_7853 ) ( not ( = ?auto_7848 ?auto_7853 ) ) ( HAVE_IMAGE ?auto_7852 ?auto_7851 ) ( not ( = ?auto_7852 ?auto_7848 ) ) ( not ( = ?auto_7852 ?auto_7853 ) ) ( not ( = ?auto_7851 ?auto_7849 ) ) ( CALIBRATION_TARGET ?auto_7850 ?auto_7853 ) ( NOT_CALIBRATED ?auto_7850 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_7854 ?auto_7850 ?auto_7853 )
      ( GET-2IMAGE ?auto_7852 ?auto_7851 ?auto_7848 ?auto_7849 )
      ( GET-1IMAGE-VERIFY ?auto_7848 ?auto_7849 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7856 - DIRECTION
      ?auto_7857 - MODE
      ?auto_7858 - DIRECTION
      ?auto_7855 - MODE
    )
    :vars
    (
      ?auto_7861 - INSTRUMENT
      ?auto_7859 - SATELLITE
      ?auto_7860 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7861 ?auto_7859 ) ( SUPPORTS ?auto_7861 ?auto_7855 ) ( POWER_ON ?auto_7861 ) ( POINTING ?auto_7859 ?auto_7860 ) ( not ( = ?auto_7858 ?auto_7860 ) ) ( HAVE_IMAGE ?auto_7856 ?auto_7857 ) ( not ( = ?auto_7856 ?auto_7858 ) ) ( not ( = ?auto_7856 ?auto_7860 ) ) ( not ( = ?auto_7857 ?auto_7855 ) ) ( CALIBRATION_TARGET ?auto_7861 ?auto_7860 ) ( NOT_CALIBRATED ?auto_7861 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7858 ?auto_7855 )
      ( GET-2IMAGE-VERIFY ?auto_7856 ?auto_7857 ?auto_7858 ?auto_7855 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7863 - DIRECTION
      ?auto_7864 - MODE
      ?auto_7865 - DIRECTION
      ?auto_7862 - MODE
    )
    :vars
    (
      ?auto_7868 - INSTRUMENT
      ?auto_7866 - SATELLITE
      ?auto_7867 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7868 ?auto_7866 ) ( SUPPORTS ?auto_7868 ?auto_7864 ) ( POWER_ON ?auto_7868 ) ( POINTING ?auto_7866 ?auto_7867 ) ( not ( = ?auto_7863 ?auto_7867 ) ) ( HAVE_IMAGE ?auto_7865 ?auto_7862 ) ( not ( = ?auto_7865 ?auto_7863 ) ) ( not ( = ?auto_7865 ?auto_7867 ) ) ( not ( = ?auto_7862 ?auto_7864 ) ) ( CALIBRATION_TARGET ?auto_7868 ?auto_7867 ) ( NOT_CALIBRATED ?auto_7868 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7865 ?auto_7862 ?auto_7863 ?auto_7864 )
      ( GET-2IMAGE-VERIFY ?auto_7863 ?auto_7864 ?auto_7865 ?auto_7862 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7879 - DIRECTION
      ?auto_7880 - MODE
      ?auto_7881 - DIRECTION
      ?auto_7878 - MODE
      ?auto_7882 - DIRECTION
      ?auto_7883 - MODE
    )
    :vars
    (
      ?auto_7886 - INSTRUMENT
      ?auto_7884 - SATELLITE
      ?auto_7885 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7886 ?auto_7884 ) ( SUPPORTS ?auto_7886 ?auto_7883 ) ( POWER_ON ?auto_7886 ) ( POINTING ?auto_7884 ?auto_7885 ) ( not ( = ?auto_7882 ?auto_7885 ) ) ( HAVE_IMAGE ?auto_7879 ?auto_7880 ) ( not ( = ?auto_7879 ?auto_7882 ) ) ( not ( = ?auto_7879 ?auto_7885 ) ) ( not ( = ?auto_7880 ?auto_7883 ) ) ( CALIBRATION_TARGET ?auto_7886 ?auto_7885 ) ( NOT_CALIBRATED ?auto_7886 ) ( HAVE_IMAGE ?auto_7881 ?auto_7878 ) ( not ( = ?auto_7879 ?auto_7881 ) ) ( not ( = ?auto_7880 ?auto_7878 ) ) ( not ( = ?auto_7881 ?auto_7882 ) ) ( not ( = ?auto_7881 ?auto_7885 ) ) ( not ( = ?auto_7878 ?auto_7883 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7879 ?auto_7880 ?auto_7882 ?auto_7883 )
      ( GET-3IMAGE-VERIFY ?auto_7879 ?auto_7880 ?auto_7881 ?auto_7878 ?auto_7882 ?auto_7883 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7888 - DIRECTION
      ?auto_7889 - MODE
      ?auto_7890 - DIRECTION
      ?auto_7887 - MODE
      ?auto_7891 - DIRECTION
      ?auto_7892 - MODE
    )
    :vars
    (
      ?auto_7895 - INSTRUMENT
      ?auto_7893 - SATELLITE
      ?auto_7894 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7895 ?auto_7893 ) ( SUPPORTS ?auto_7895 ?auto_7887 ) ( POWER_ON ?auto_7895 ) ( POINTING ?auto_7893 ?auto_7894 ) ( not ( = ?auto_7890 ?auto_7894 ) ) ( HAVE_IMAGE ?auto_7888 ?auto_7889 ) ( not ( = ?auto_7888 ?auto_7890 ) ) ( not ( = ?auto_7888 ?auto_7894 ) ) ( not ( = ?auto_7889 ?auto_7887 ) ) ( CALIBRATION_TARGET ?auto_7895 ?auto_7894 ) ( NOT_CALIBRATED ?auto_7895 ) ( HAVE_IMAGE ?auto_7891 ?auto_7892 ) ( not ( = ?auto_7888 ?auto_7891 ) ) ( not ( = ?auto_7889 ?auto_7892 ) ) ( not ( = ?auto_7890 ?auto_7891 ) ) ( not ( = ?auto_7887 ?auto_7892 ) ) ( not ( = ?auto_7891 ?auto_7894 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7888 ?auto_7889 ?auto_7890 ?auto_7887 )
      ( GET-3IMAGE-VERIFY ?auto_7888 ?auto_7889 ?auto_7890 ?auto_7887 ?auto_7891 ?auto_7892 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7906 - DIRECTION
      ?auto_7907 - MODE
      ?auto_7908 - DIRECTION
      ?auto_7905 - MODE
      ?auto_7909 - DIRECTION
      ?auto_7910 - MODE
    )
    :vars
    (
      ?auto_7913 - INSTRUMENT
      ?auto_7911 - SATELLITE
      ?auto_7912 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7913 ?auto_7911 ) ( SUPPORTS ?auto_7913 ?auto_7907 ) ( POWER_ON ?auto_7913 ) ( POINTING ?auto_7911 ?auto_7912 ) ( not ( = ?auto_7906 ?auto_7912 ) ) ( HAVE_IMAGE ?auto_7909 ?auto_7910 ) ( not ( = ?auto_7909 ?auto_7906 ) ) ( not ( = ?auto_7909 ?auto_7912 ) ) ( not ( = ?auto_7910 ?auto_7907 ) ) ( CALIBRATION_TARGET ?auto_7913 ?auto_7912 ) ( NOT_CALIBRATED ?auto_7913 ) ( HAVE_IMAGE ?auto_7908 ?auto_7905 ) ( not ( = ?auto_7906 ?auto_7908 ) ) ( not ( = ?auto_7907 ?auto_7905 ) ) ( not ( = ?auto_7908 ?auto_7909 ) ) ( not ( = ?auto_7908 ?auto_7912 ) ) ( not ( = ?auto_7905 ?auto_7910 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7909 ?auto_7910 ?auto_7906 ?auto_7907 )
      ( GET-3IMAGE-VERIFY ?auto_7906 ?auto_7907 ?auto_7908 ?auto_7905 ?auto_7909 ?auto_7910 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7943 - DIRECTION
      ?auto_7944 - MODE
    )
    :vars
    (
      ?auto_7949 - INSTRUMENT
      ?auto_7947 - SATELLITE
      ?auto_7948 - DIRECTION
      ?auto_7946 - DIRECTION
      ?auto_7945 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_7949 ?auto_7947 ) ( SUPPORTS ?auto_7949 ?auto_7944 ) ( POINTING ?auto_7947 ?auto_7948 ) ( not ( = ?auto_7943 ?auto_7948 ) ) ( HAVE_IMAGE ?auto_7946 ?auto_7945 ) ( not ( = ?auto_7946 ?auto_7943 ) ) ( not ( = ?auto_7946 ?auto_7948 ) ) ( not ( = ?auto_7945 ?auto_7944 ) ) ( CALIBRATION_TARGET ?auto_7949 ?auto_7948 ) ( POWER_AVAIL ?auto_7947 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_7949 ?auto_7947 )
      ( GET-2IMAGE ?auto_7946 ?auto_7945 ?auto_7943 ?auto_7944 )
      ( GET-1IMAGE-VERIFY ?auto_7943 ?auto_7944 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7951 - DIRECTION
      ?auto_7952 - MODE
      ?auto_7953 - DIRECTION
      ?auto_7950 - MODE
    )
    :vars
    (
      ?auto_7956 - INSTRUMENT
      ?auto_7955 - SATELLITE
      ?auto_7954 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7956 ?auto_7955 ) ( SUPPORTS ?auto_7956 ?auto_7950 ) ( POINTING ?auto_7955 ?auto_7954 ) ( not ( = ?auto_7953 ?auto_7954 ) ) ( HAVE_IMAGE ?auto_7951 ?auto_7952 ) ( not ( = ?auto_7951 ?auto_7953 ) ) ( not ( = ?auto_7951 ?auto_7954 ) ) ( not ( = ?auto_7952 ?auto_7950 ) ) ( CALIBRATION_TARGET ?auto_7956 ?auto_7954 ) ( POWER_AVAIL ?auto_7955 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7953 ?auto_7950 )
      ( GET-2IMAGE-VERIFY ?auto_7951 ?auto_7952 ?auto_7953 ?auto_7950 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7958 - DIRECTION
      ?auto_7959 - MODE
      ?auto_7960 - DIRECTION
      ?auto_7957 - MODE
    )
    :vars
    (
      ?auto_7963 - INSTRUMENT
      ?auto_7962 - SATELLITE
      ?auto_7961 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7963 ?auto_7962 ) ( SUPPORTS ?auto_7963 ?auto_7959 ) ( POINTING ?auto_7962 ?auto_7961 ) ( not ( = ?auto_7958 ?auto_7961 ) ) ( HAVE_IMAGE ?auto_7960 ?auto_7957 ) ( not ( = ?auto_7960 ?auto_7958 ) ) ( not ( = ?auto_7960 ?auto_7961 ) ) ( not ( = ?auto_7957 ?auto_7959 ) ) ( CALIBRATION_TARGET ?auto_7963 ?auto_7961 ) ( POWER_AVAIL ?auto_7962 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7960 ?auto_7957 ?auto_7958 ?auto_7959 )
      ( GET-2IMAGE-VERIFY ?auto_7958 ?auto_7959 ?auto_7960 ?auto_7957 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7974 - DIRECTION
      ?auto_7975 - MODE
      ?auto_7976 - DIRECTION
      ?auto_7973 - MODE
      ?auto_7977 - DIRECTION
      ?auto_7978 - MODE
    )
    :vars
    (
      ?auto_7981 - INSTRUMENT
      ?auto_7980 - SATELLITE
      ?auto_7979 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7981 ?auto_7980 ) ( SUPPORTS ?auto_7981 ?auto_7978 ) ( POINTING ?auto_7980 ?auto_7979 ) ( not ( = ?auto_7977 ?auto_7979 ) ) ( HAVE_IMAGE ?auto_7974 ?auto_7975 ) ( not ( = ?auto_7974 ?auto_7977 ) ) ( not ( = ?auto_7974 ?auto_7979 ) ) ( not ( = ?auto_7975 ?auto_7978 ) ) ( CALIBRATION_TARGET ?auto_7981 ?auto_7979 ) ( POWER_AVAIL ?auto_7980 ) ( HAVE_IMAGE ?auto_7976 ?auto_7973 ) ( not ( = ?auto_7974 ?auto_7976 ) ) ( not ( = ?auto_7975 ?auto_7973 ) ) ( not ( = ?auto_7976 ?auto_7977 ) ) ( not ( = ?auto_7976 ?auto_7979 ) ) ( not ( = ?auto_7973 ?auto_7978 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7974 ?auto_7975 ?auto_7977 ?auto_7978 )
      ( GET-3IMAGE-VERIFY ?auto_7974 ?auto_7975 ?auto_7976 ?auto_7973 ?auto_7977 ?auto_7978 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7983 - DIRECTION
      ?auto_7984 - MODE
      ?auto_7985 - DIRECTION
      ?auto_7982 - MODE
      ?auto_7986 - DIRECTION
      ?auto_7987 - MODE
    )
    :vars
    (
      ?auto_7990 - INSTRUMENT
      ?auto_7989 - SATELLITE
      ?auto_7988 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7990 ?auto_7989 ) ( SUPPORTS ?auto_7990 ?auto_7982 ) ( POINTING ?auto_7989 ?auto_7988 ) ( not ( = ?auto_7985 ?auto_7988 ) ) ( HAVE_IMAGE ?auto_7986 ?auto_7987 ) ( not ( = ?auto_7986 ?auto_7985 ) ) ( not ( = ?auto_7986 ?auto_7988 ) ) ( not ( = ?auto_7987 ?auto_7982 ) ) ( CALIBRATION_TARGET ?auto_7990 ?auto_7988 ) ( POWER_AVAIL ?auto_7989 ) ( HAVE_IMAGE ?auto_7983 ?auto_7984 ) ( not ( = ?auto_7983 ?auto_7985 ) ) ( not ( = ?auto_7983 ?auto_7986 ) ) ( not ( = ?auto_7983 ?auto_7988 ) ) ( not ( = ?auto_7984 ?auto_7982 ) ) ( not ( = ?auto_7984 ?auto_7987 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7986 ?auto_7987 ?auto_7985 ?auto_7982 )
      ( GET-3IMAGE-VERIFY ?auto_7983 ?auto_7984 ?auto_7985 ?auto_7982 ?auto_7986 ?auto_7987 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8001 - DIRECTION
      ?auto_8002 - MODE
      ?auto_8003 - DIRECTION
      ?auto_8000 - MODE
      ?auto_8004 - DIRECTION
      ?auto_8005 - MODE
    )
    :vars
    (
      ?auto_8008 - INSTRUMENT
      ?auto_8007 - SATELLITE
      ?auto_8006 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8008 ?auto_8007 ) ( SUPPORTS ?auto_8008 ?auto_8002 ) ( POINTING ?auto_8007 ?auto_8006 ) ( not ( = ?auto_8001 ?auto_8006 ) ) ( HAVE_IMAGE ?auto_8003 ?auto_8005 ) ( not ( = ?auto_8003 ?auto_8001 ) ) ( not ( = ?auto_8003 ?auto_8006 ) ) ( not ( = ?auto_8005 ?auto_8002 ) ) ( CALIBRATION_TARGET ?auto_8008 ?auto_8006 ) ( POWER_AVAIL ?auto_8007 ) ( HAVE_IMAGE ?auto_8003 ?auto_8000 ) ( HAVE_IMAGE ?auto_8004 ?auto_8005 ) ( not ( = ?auto_8001 ?auto_8004 ) ) ( not ( = ?auto_8002 ?auto_8000 ) ) ( not ( = ?auto_8003 ?auto_8004 ) ) ( not ( = ?auto_8000 ?auto_8005 ) ) ( not ( = ?auto_8004 ?auto_8006 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8003 ?auto_8005 ?auto_8001 ?auto_8002 )
      ( GET-3IMAGE-VERIFY ?auto_8001 ?auto_8002 ?auto_8003 ?auto_8000 ?auto_8004 ?auto_8005 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8038 - DIRECTION
      ?auto_8039 - MODE
    )
    :vars
    (
      ?auto_8042 - INSTRUMENT
      ?auto_8041 - SATELLITE
      ?auto_8040 - DIRECTION
      ?auto_8043 - DIRECTION
      ?auto_8044 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_8042 ?auto_8041 ) ( SUPPORTS ?auto_8042 ?auto_8039 ) ( not ( = ?auto_8038 ?auto_8040 ) ) ( HAVE_IMAGE ?auto_8043 ?auto_8044 ) ( not ( = ?auto_8043 ?auto_8038 ) ) ( not ( = ?auto_8043 ?auto_8040 ) ) ( not ( = ?auto_8044 ?auto_8039 ) ) ( CALIBRATION_TARGET ?auto_8042 ?auto_8040 ) ( POWER_AVAIL ?auto_8041 ) ( POINTING ?auto_8041 ?auto_8043 ) )
    :subtasks
    ( ( !TURN_TO ?auto_8041 ?auto_8040 ?auto_8043 )
      ( GET-2IMAGE ?auto_8043 ?auto_8044 ?auto_8038 ?auto_8039 )
      ( GET-1IMAGE-VERIFY ?auto_8038 ?auto_8039 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8046 - DIRECTION
      ?auto_8047 - MODE
      ?auto_8048 - DIRECTION
      ?auto_8045 - MODE
    )
    :vars
    (
      ?auto_8051 - INSTRUMENT
      ?auto_8050 - SATELLITE
      ?auto_8049 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8051 ?auto_8050 ) ( SUPPORTS ?auto_8051 ?auto_8045 ) ( not ( = ?auto_8048 ?auto_8049 ) ) ( HAVE_IMAGE ?auto_8046 ?auto_8047 ) ( not ( = ?auto_8046 ?auto_8048 ) ) ( not ( = ?auto_8046 ?auto_8049 ) ) ( not ( = ?auto_8047 ?auto_8045 ) ) ( CALIBRATION_TARGET ?auto_8051 ?auto_8049 ) ( POWER_AVAIL ?auto_8050 ) ( POINTING ?auto_8050 ?auto_8046 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8048 ?auto_8045 )
      ( GET-2IMAGE-VERIFY ?auto_8046 ?auto_8047 ?auto_8048 ?auto_8045 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8053 - DIRECTION
      ?auto_8054 - MODE
      ?auto_8055 - DIRECTION
      ?auto_8052 - MODE
    )
    :vars
    (
      ?auto_8057 - INSTRUMENT
      ?auto_8056 - SATELLITE
      ?auto_8058 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8057 ?auto_8056 ) ( SUPPORTS ?auto_8057 ?auto_8054 ) ( not ( = ?auto_8053 ?auto_8058 ) ) ( HAVE_IMAGE ?auto_8055 ?auto_8052 ) ( not ( = ?auto_8055 ?auto_8053 ) ) ( not ( = ?auto_8055 ?auto_8058 ) ) ( not ( = ?auto_8052 ?auto_8054 ) ) ( CALIBRATION_TARGET ?auto_8057 ?auto_8058 ) ( POWER_AVAIL ?auto_8056 ) ( POINTING ?auto_8056 ?auto_8055 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8055 ?auto_8052 ?auto_8053 ?auto_8054 )
      ( GET-2IMAGE-VERIFY ?auto_8053 ?auto_8054 ?auto_8055 ?auto_8052 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8069 - DIRECTION
      ?auto_8070 - MODE
      ?auto_8071 - DIRECTION
      ?auto_8068 - MODE
      ?auto_8072 - DIRECTION
      ?auto_8073 - MODE
    )
    :vars
    (
      ?auto_8075 - INSTRUMENT
      ?auto_8074 - SATELLITE
      ?auto_8076 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8075 ?auto_8074 ) ( SUPPORTS ?auto_8075 ?auto_8073 ) ( not ( = ?auto_8072 ?auto_8076 ) ) ( HAVE_IMAGE ?auto_8071 ?auto_8070 ) ( not ( = ?auto_8071 ?auto_8072 ) ) ( not ( = ?auto_8071 ?auto_8076 ) ) ( not ( = ?auto_8070 ?auto_8073 ) ) ( CALIBRATION_TARGET ?auto_8075 ?auto_8076 ) ( POWER_AVAIL ?auto_8074 ) ( POINTING ?auto_8074 ?auto_8071 ) ( HAVE_IMAGE ?auto_8069 ?auto_8070 ) ( HAVE_IMAGE ?auto_8071 ?auto_8068 ) ( not ( = ?auto_8069 ?auto_8071 ) ) ( not ( = ?auto_8069 ?auto_8072 ) ) ( not ( = ?auto_8069 ?auto_8076 ) ) ( not ( = ?auto_8070 ?auto_8068 ) ) ( not ( = ?auto_8068 ?auto_8073 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8071 ?auto_8070 ?auto_8072 ?auto_8073 )
      ( GET-3IMAGE-VERIFY ?auto_8069 ?auto_8070 ?auto_8071 ?auto_8068 ?auto_8072 ?auto_8073 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8078 - DIRECTION
      ?auto_8079 - MODE
      ?auto_8080 - DIRECTION
      ?auto_8077 - MODE
      ?auto_8081 - DIRECTION
      ?auto_8082 - MODE
    )
    :vars
    (
      ?auto_8084 - INSTRUMENT
      ?auto_8083 - SATELLITE
      ?auto_8085 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8084 ?auto_8083 ) ( SUPPORTS ?auto_8084 ?auto_8077 ) ( not ( = ?auto_8080 ?auto_8085 ) ) ( HAVE_IMAGE ?auto_8078 ?auto_8079 ) ( not ( = ?auto_8078 ?auto_8080 ) ) ( not ( = ?auto_8078 ?auto_8085 ) ) ( not ( = ?auto_8079 ?auto_8077 ) ) ( CALIBRATION_TARGET ?auto_8084 ?auto_8085 ) ( POWER_AVAIL ?auto_8083 ) ( POINTING ?auto_8083 ?auto_8078 ) ( HAVE_IMAGE ?auto_8081 ?auto_8082 ) ( not ( = ?auto_8078 ?auto_8081 ) ) ( not ( = ?auto_8079 ?auto_8082 ) ) ( not ( = ?auto_8080 ?auto_8081 ) ) ( not ( = ?auto_8077 ?auto_8082 ) ) ( not ( = ?auto_8081 ?auto_8085 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8078 ?auto_8079 ?auto_8080 ?auto_8077 )
      ( GET-3IMAGE-VERIFY ?auto_8078 ?auto_8079 ?auto_8080 ?auto_8077 ?auto_8081 ?auto_8082 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8096 - DIRECTION
      ?auto_8097 - MODE
      ?auto_8098 - DIRECTION
      ?auto_8095 - MODE
      ?auto_8099 - DIRECTION
      ?auto_8100 - MODE
    )
    :vars
    (
      ?auto_8102 - INSTRUMENT
      ?auto_8101 - SATELLITE
      ?auto_8103 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8102 ?auto_8101 ) ( SUPPORTS ?auto_8102 ?auto_8097 ) ( not ( = ?auto_8096 ?auto_8103 ) ) ( HAVE_IMAGE ?auto_8098 ?auto_8100 ) ( not ( = ?auto_8098 ?auto_8096 ) ) ( not ( = ?auto_8098 ?auto_8103 ) ) ( not ( = ?auto_8100 ?auto_8097 ) ) ( CALIBRATION_TARGET ?auto_8102 ?auto_8103 ) ( POWER_AVAIL ?auto_8101 ) ( POINTING ?auto_8101 ?auto_8098 ) ( HAVE_IMAGE ?auto_8098 ?auto_8095 ) ( HAVE_IMAGE ?auto_8099 ?auto_8100 ) ( not ( = ?auto_8096 ?auto_8099 ) ) ( not ( = ?auto_8097 ?auto_8095 ) ) ( not ( = ?auto_8098 ?auto_8099 ) ) ( not ( = ?auto_8095 ?auto_8100 ) ) ( not ( = ?auto_8099 ?auto_8103 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8098 ?auto_8100 ?auto_8096 ?auto_8097 )
      ( GET-3IMAGE-VERIFY ?auto_8096 ?auto_8097 ?auto_8098 ?auto_8095 ?auto_8099 ?auto_8100 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8133 - DIRECTION
      ?auto_8134 - MODE
    )
    :vars
    (
      ?auto_8137 - INSTRUMENT
      ?auto_8135 - SATELLITE
      ?auto_8138 - DIRECTION
      ?auto_8136 - DIRECTION
      ?auto_8139 - MODE
      ?auto_8140 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8137 ?auto_8135 ) ( SUPPORTS ?auto_8137 ?auto_8134 ) ( not ( = ?auto_8133 ?auto_8138 ) ) ( HAVE_IMAGE ?auto_8136 ?auto_8139 ) ( not ( = ?auto_8136 ?auto_8133 ) ) ( not ( = ?auto_8136 ?auto_8138 ) ) ( not ( = ?auto_8139 ?auto_8134 ) ) ( CALIBRATION_TARGET ?auto_8137 ?auto_8138 ) ( POINTING ?auto_8135 ?auto_8136 ) ( ON_BOARD ?auto_8140 ?auto_8135 ) ( POWER_ON ?auto_8140 ) ( not ( = ?auto_8137 ?auto_8140 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_8140 ?auto_8135 )
      ( GET-2IMAGE ?auto_8136 ?auto_8139 ?auto_8133 ?auto_8134 )
      ( GET-1IMAGE-VERIFY ?auto_8133 ?auto_8134 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8142 - DIRECTION
      ?auto_8143 - MODE
      ?auto_8144 - DIRECTION
      ?auto_8141 - MODE
    )
    :vars
    (
      ?auto_8145 - INSTRUMENT
      ?auto_8146 - SATELLITE
      ?auto_8148 - DIRECTION
      ?auto_8147 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8145 ?auto_8146 ) ( SUPPORTS ?auto_8145 ?auto_8141 ) ( not ( = ?auto_8144 ?auto_8148 ) ) ( HAVE_IMAGE ?auto_8142 ?auto_8143 ) ( not ( = ?auto_8142 ?auto_8144 ) ) ( not ( = ?auto_8142 ?auto_8148 ) ) ( not ( = ?auto_8143 ?auto_8141 ) ) ( CALIBRATION_TARGET ?auto_8145 ?auto_8148 ) ( POINTING ?auto_8146 ?auto_8142 ) ( ON_BOARD ?auto_8147 ?auto_8146 ) ( POWER_ON ?auto_8147 ) ( not ( = ?auto_8145 ?auto_8147 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8144 ?auto_8141 )
      ( GET-2IMAGE-VERIFY ?auto_8142 ?auto_8143 ?auto_8144 ?auto_8141 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8150 - DIRECTION
      ?auto_8151 - MODE
      ?auto_8152 - DIRECTION
      ?auto_8149 - MODE
    )
    :vars
    (
      ?auto_8156 - INSTRUMENT
      ?auto_8154 - SATELLITE
      ?auto_8155 - DIRECTION
      ?auto_8153 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8156 ?auto_8154 ) ( SUPPORTS ?auto_8156 ?auto_8151 ) ( not ( = ?auto_8150 ?auto_8155 ) ) ( HAVE_IMAGE ?auto_8152 ?auto_8149 ) ( not ( = ?auto_8152 ?auto_8150 ) ) ( not ( = ?auto_8152 ?auto_8155 ) ) ( not ( = ?auto_8149 ?auto_8151 ) ) ( CALIBRATION_TARGET ?auto_8156 ?auto_8155 ) ( POINTING ?auto_8154 ?auto_8152 ) ( ON_BOARD ?auto_8153 ?auto_8154 ) ( POWER_ON ?auto_8153 ) ( not ( = ?auto_8156 ?auto_8153 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8152 ?auto_8149 ?auto_8150 ?auto_8151 )
      ( GET-2IMAGE-VERIFY ?auto_8150 ?auto_8151 ?auto_8152 ?auto_8149 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8168 - DIRECTION
      ?auto_8169 - MODE
      ?auto_8170 - DIRECTION
      ?auto_8167 - MODE
      ?auto_8171 - DIRECTION
      ?auto_8172 - MODE
    )
    :vars
    (
      ?auto_8176 - INSTRUMENT
      ?auto_8174 - SATELLITE
      ?auto_8175 - DIRECTION
      ?auto_8173 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8176 ?auto_8174 ) ( SUPPORTS ?auto_8176 ?auto_8172 ) ( not ( = ?auto_8171 ?auto_8175 ) ) ( HAVE_IMAGE ?auto_8168 ?auto_8167 ) ( not ( = ?auto_8168 ?auto_8171 ) ) ( not ( = ?auto_8168 ?auto_8175 ) ) ( not ( = ?auto_8167 ?auto_8172 ) ) ( CALIBRATION_TARGET ?auto_8176 ?auto_8175 ) ( POINTING ?auto_8174 ?auto_8168 ) ( ON_BOARD ?auto_8173 ?auto_8174 ) ( POWER_ON ?auto_8173 ) ( not ( = ?auto_8176 ?auto_8173 ) ) ( HAVE_IMAGE ?auto_8168 ?auto_8169 ) ( HAVE_IMAGE ?auto_8170 ?auto_8167 ) ( not ( = ?auto_8168 ?auto_8170 ) ) ( not ( = ?auto_8169 ?auto_8167 ) ) ( not ( = ?auto_8169 ?auto_8172 ) ) ( not ( = ?auto_8170 ?auto_8171 ) ) ( not ( = ?auto_8170 ?auto_8175 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8168 ?auto_8167 ?auto_8171 ?auto_8172 )
      ( GET-3IMAGE-VERIFY ?auto_8168 ?auto_8169 ?auto_8170 ?auto_8167 ?auto_8171 ?auto_8172 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8178 - DIRECTION
      ?auto_8179 - MODE
      ?auto_8180 - DIRECTION
      ?auto_8177 - MODE
      ?auto_8181 - DIRECTION
      ?auto_8182 - MODE
    )
    :vars
    (
      ?auto_8186 - INSTRUMENT
      ?auto_8184 - SATELLITE
      ?auto_8185 - DIRECTION
      ?auto_8183 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8186 ?auto_8184 ) ( SUPPORTS ?auto_8186 ?auto_8177 ) ( not ( = ?auto_8180 ?auto_8185 ) ) ( HAVE_IMAGE ?auto_8181 ?auto_8182 ) ( not ( = ?auto_8181 ?auto_8180 ) ) ( not ( = ?auto_8181 ?auto_8185 ) ) ( not ( = ?auto_8182 ?auto_8177 ) ) ( CALIBRATION_TARGET ?auto_8186 ?auto_8185 ) ( POINTING ?auto_8184 ?auto_8181 ) ( ON_BOARD ?auto_8183 ?auto_8184 ) ( POWER_ON ?auto_8183 ) ( not ( = ?auto_8186 ?auto_8183 ) ) ( HAVE_IMAGE ?auto_8178 ?auto_8179 ) ( not ( = ?auto_8178 ?auto_8180 ) ) ( not ( = ?auto_8178 ?auto_8181 ) ) ( not ( = ?auto_8178 ?auto_8185 ) ) ( not ( = ?auto_8179 ?auto_8177 ) ) ( not ( = ?auto_8179 ?auto_8182 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8181 ?auto_8182 ?auto_8180 ?auto_8177 )
      ( GET-3IMAGE-VERIFY ?auto_8178 ?auto_8179 ?auto_8180 ?auto_8177 ?auto_8181 ?auto_8182 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8198 - DIRECTION
      ?auto_8199 - MODE
      ?auto_8200 - DIRECTION
      ?auto_8197 - MODE
      ?auto_8201 - DIRECTION
      ?auto_8202 - MODE
    )
    :vars
    (
      ?auto_8206 - INSTRUMENT
      ?auto_8204 - SATELLITE
      ?auto_8205 - DIRECTION
      ?auto_8203 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8206 ?auto_8204 ) ( SUPPORTS ?auto_8206 ?auto_8199 ) ( not ( = ?auto_8198 ?auto_8205 ) ) ( HAVE_IMAGE ?auto_8201 ?auto_8197 ) ( not ( = ?auto_8201 ?auto_8198 ) ) ( not ( = ?auto_8201 ?auto_8205 ) ) ( not ( = ?auto_8197 ?auto_8199 ) ) ( CALIBRATION_TARGET ?auto_8206 ?auto_8205 ) ( POINTING ?auto_8204 ?auto_8201 ) ( ON_BOARD ?auto_8203 ?auto_8204 ) ( POWER_ON ?auto_8203 ) ( not ( = ?auto_8206 ?auto_8203 ) ) ( HAVE_IMAGE ?auto_8200 ?auto_8197 ) ( HAVE_IMAGE ?auto_8201 ?auto_8202 ) ( not ( = ?auto_8198 ?auto_8200 ) ) ( not ( = ?auto_8199 ?auto_8202 ) ) ( not ( = ?auto_8200 ?auto_8201 ) ) ( not ( = ?auto_8200 ?auto_8205 ) ) ( not ( = ?auto_8197 ?auto_8202 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8201 ?auto_8197 ?auto_8198 ?auto_8199 )
      ( GET-3IMAGE-VERIFY ?auto_8198 ?auto_8199 ?auto_8200 ?auto_8197 ?auto_8201 ?auto_8202 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8239 - DIRECTION
      ?auto_8240 - MODE
    )
    :vars
    (
      ?auto_8246 - INSTRUMENT
      ?auto_8242 - SATELLITE
      ?auto_8243 - DIRECTION
      ?auto_8244 - DIRECTION
      ?auto_8245 - MODE
      ?auto_8241 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8246 ?auto_8242 ) ( SUPPORTS ?auto_8246 ?auto_8240 ) ( not ( = ?auto_8239 ?auto_8243 ) ) ( not ( = ?auto_8244 ?auto_8239 ) ) ( not ( = ?auto_8244 ?auto_8243 ) ) ( not ( = ?auto_8245 ?auto_8240 ) ) ( CALIBRATION_TARGET ?auto_8246 ?auto_8243 ) ( POINTING ?auto_8242 ?auto_8244 ) ( ON_BOARD ?auto_8241 ?auto_8242 ) ( POWER_ON ?auto_8241 ) ( not ( = ?auto_8246 ?auto_8241 ) ) ( CALIBRATED ?auto_8241 ) ( SUPPORTS ?auto_8241 ?auto_8245 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8244 ?auto_8245 )
      ( GET-2IMAGE ?auto_8244 ?auto_8245 ?auto_8239 ?auto_8240 )
      ( GET-1IMAGE-VERIFY ?auto_8239 ?auto_8240 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8248 - DIRECTION
      ?auto_8249 - MODE
      ?auto_8250 - DIRECTION
      ?auto_8247 - MODE
    )
    :vars
    (
      ?auto_8253 - INSTRUMENT
      ?auto_8254 - SATELLITE
      ?auto_8252 - DIRECTION
      ?auto_8251 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8253 ?auto_8254 ) ( SUPPORTS ?auto_8253 ?auto_8247 ) ( not ( = ?auto_8250 ?auto_8252 ) ) ( not ( = ?auto_8248 ?auto_8250 ) ) ( not ( = ?auto_8248 ?auto_8252 ) ) ( not ( = ?auto_8249 ?auto_8247 ) ) ( CALIBRATION_TARGET ?auto_8253 ?auto_8252 ) ( POINTING ?auto_8254 ?auto_8248 ) ( ON_BOARD ?auto_8251 ?auto_8254 ) ( POWER_ON ?auto_8251 ) ( not ( = ?auto_8253 ?auto_8251 ) ) ( CALIBRATED ?auto_8251 ) ( SUPPORTS ?auto_8251 ?auto_8249 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8250 ?auto_8247 )
      ( GET-2IMAGE-VERIFY ?auto_8248 ?auto_8249 ?auto_8250 ?auto_8247 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8256 - DIRECTION
      ?auto_8257 - MODE
      ?auto_8258 - DIRECTION
      ?auto_8255 - MODE
    )
    :vars
    (
      ?auto_8262 - INSTRUMENT
      ?auto_8261 - SATELLITE
      ?auto_8260 - DIRECTION
      ?auto_8259 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8262 ?auto_8261 ) ( SUPPORTS ?auto_8262 ?auto_8257 ) ( not ( = ?auto_8256 ?auto_8260 ) ) ( not ( = ?auto_8258 ?auto_8256 ) ) ( not ( = ?auto_8258 ?auto_8260 ) ) ( not ( = ?auto_8255 ?auto_8257 ) ) ( CALIBRATION_TARGET ?auto_8262 ?auto_8260 ) ( POINTING ?auto_8261 ?auto_8258 ) ( ON_BOARD ?auto_8259 ?auto_8261 ) ( POWER_ON ?auto_8259 ) ( not ( = ?auto_8262 ?auto_8259 ) ) ( CALIBRATED ?auto_8259 ) ( SUPPORTS ?auto_8259 ?auto_8255 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8258 ?auto_8255 ?auto_8256 ?auto_8257 )
      ( GET-2IMAGE-VERIFY ?auto_8256 ?auto_8257 ?auto_8258 ?auto_8255 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8345 - DIRECTION
      ?auto_8346 - MODE
    )
    :vars
    (
      ?auto_8350 - INSTRUMENT
      ?auto_8349 - SATELLITE
      ?auto_8348 - DIRECTION
      ?auto_8351 - DIRECTION
      ?auto_8352 - MODE
      ?auto_8347 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8350 ?auto_8349 ) ( SUPPORTS ?auto_8350 ?auto_8346 ) ( not ( = ?auto_8345 ?auto_8348 ) ) ( not ( = ?auto_8351 ?auto_8345 ) ) ( not ( = ?auto_8351 ?auto_8348 ) ) ( not ( = ?auto_8352 ?auto_8346 ) ) ( CALIBRATION_TARGET ?auto_8350 ?auto_8348 ) ( ON_BOARD ?auto_8347 ?auto_8349 ) ( POWER_ON ?auto_8347 ) ( not ( = ?auto_8350 ?auto_8347 ) ) ( CALIBRATED ?auto_8347 ) ( SUPPORTS ?auto_8347 ?auto_8352 ) ( POINTING ?auto_8349 ?auto_8348 ) )
    :subtasks
    ( ( !TURN_TO ?auto_8349 ?auto_8351 ?auto_8348 )
      ( GET-2IMAGE ?auto_8351 ?auto_8352 ?auto_8345 ?auto_8346 )
      ( GET-1IMAGE-VERIFY ?auto_8345 ?auto_8346 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8354 - DIRECTION
      ?auto_8355 - MODE
      ?auto_8356 - DIRECTION
      ?auto_8353 - MODE
    )
    :vars
    (
      ?auto_8360 - INSTRUMENT
      ?auto_8357 - SATELLITE
      ?auto_8359 - DIRECTION
      ?auto_8358 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8360 ?auto_8357 ) ( SUPPORTS ?auto_8360 ?auto_8353 ) ( not ( = ?auto_8356 ?auto_8359 ) ) ( not ( = ?auto_8354 ?auto_8356 ) ) ( not ( = ?auto_8354 ?auto_8359 ) ) ( not ( = ?auto_8355 ?auto_8353 ) ) ( CALIBRATION_TARGET ?auto_8360 ?auto_8359 ) ( ON_BOARD ?auto_8358 ?auto_8357 ) ( POWER_ON ?auto_8358 ) ( not ( = ?auto_8360 ?auto_8358 ) ) ( CALIBRATED ?auto_8358 ) ( SUPPORTS ?auto_8358 ?auto_8355 ) ( POINTING ?auto_8357 ?auto_8359 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8356 ?auto_8353 )
      ( GET-2IMAGE-VERIFY ?auto_8354 ?auto_8355 ?auto_8356 ?auto_8353 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8362 - DIRECTION
      ?auto_8363 - MODE
      ?auto_8364 - DIRECTION
      ?auto_8361 - MODE
    )
    :vars
    (
      ?auto_8367 - INSTRUMENT
      ?auto_8365 - SATELLITE
      ?auto_8366 - DIRECTION
      ?auto_8368 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8367 ?auto_8365 ) ( SUPPORTS ?auto_8367 ?auto_8363 ) ( not ( = ?auto_8362 ?auto_8366 ) ) ( not ( = ?auto_8364 ?auto_8362 ) ) ( not ( = ?auto_8364 ?auto_8366 ) ) ( not ( = ?auto_8361 ?auto_8363 ) ) ( CALIBRATION_TARGET ?auto_8367 ?auto_8366 ) ( ON_BOARD ?auto_8368 ?auto_8365 ) ( POWER_ON ?auto_8368 ) ( not ( = ?auto_8367 ?auto_8368 ) ) ( CALIBRATED ?auto_8368 ) ( SUPPORTS ?auto_8368 ?auto_8361 ) ( POINTING ?auto_8365 ?auto_8366 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8364 ?auto_8361 ?auto_8362 ?auto_8363 )
      ( GET-2IMAGE-VERIFY ?auto_8362 ?auto_8363 ?auto_8364 ?auto_8361 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8451 - DIRECTION
      ?auto_8452 - MODE
    )
    :vars
    (
      ?auto_8455 - INSTRUMENT
      ?auto_8453 - SATELLITE
      ?auto_8454 - DIRECTION
      ?auto_8457 - DIRECTION
      ?auto_8458 - MODE
      ?auto_8456 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8455 ?auto_8453 ) ( SUPPORTS ?auto_8455 ?auto_8452 ) ( not ( = ?auto_8451 ?auto_8454 ) ) ( not ( = ?auto_8457 ?auto_8451 ) ) ( not ( = ?auto_8457 ?auto_8454 ) ) ( not ( = ?auto_8458 ?auto_8452 ) ) ( CALIBRATION_TARGET ?auto_8455 ?auto_8454 ) ( ON_BOARD ?auto_8456 ?auto_8453 ) ( POWER_ON ?auto_8456 ) ( not ( = ?auto_8455 ?auto_8456 ) ) ( SUPPORTS ?auto_8456 ?auto_8458 ) ( POINTING ?auto_8453 ?auto_8454 ) ( CALIBRATION_TARGET ?auto_8456 ?auto_8454 ) ( NOT_CALIBRATED ?auto_8456 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_8453 ?auto_8456 ?auto_8454 )
      ( GET-2IMAGE ?auto_8457 ?auto_8458 ?auto_8451 ?auto_8452 )
      ( GET-1IMAGE-VERIFY ?auto_8451 ?auto_8452 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8460 - DIRECTION
      ?auto_8461 - MODE
      ?auto_8462 - DIRECTION
      ?auto_8459 - MODE
    )
    :vars
    (
      ?auto_8466 - INSTRUMENT
      ?auto_8463 - SATELLITE
      ?auto_8465 - DIRECTION
      ?auto_8464 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8466 ?auto_8463 ) ( SUPPORTS ?auto_8466 ?auto_8459 ) ( not ( = ?auto_8462 ?auto_8465 ) ) ( not ( = ?auto_8460 ?auto_8462 ) ) ( not ( = ?auto_8460 ?auto_8465 ) ) ( not ( = ?auto_8461 ?auto_8459 ) ) ( CALIBRATION_TARGET ?auto_8466 ?auto_8465 ) ( ON_BOARD ?auto_8464 ?auto_8463 ) ( POWER_ON ?auto_8464 ) ( not ( = ?auto_8466 ?auto_8464 ) ) ( SUPPORTS ?auto_8464 ?auto_8461 ) ( POINTING ?auto_8463 ?auto_8465 ) ( CALIBRATION_TARGET ?auto_8464 ?auto_8465 ) ( NOT_CALIBRATED ?auto_8464 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8462 ?auto_8459 )
      ( GET-2IMAGE-VERIFY ?auto_8460 ?auto_8461 ?auto_8462 ?auto_8459 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8468 - DIRECTION
      ?auto_8469 - MODE
      ?auto_8470 - DIRECTION
      ?auto_8467 - MODE
    )
    :vars
    (
      ?auto_8472 - INSTRUMENT
      ?auto_8473 - SATELLITE
      ?auto_8471 - DIRECTION
      ?auto_8474 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8472 ?auto_8473 ) ( SUPPORTS ?auto_8472 ?auto_8469 ) ( not ( = ?auto_8468 ?auto_8471 ) ) ( not ( = ?auto_8470 ?auto_8468 ) ) ( not ( = ?auto_8470 ?auto_8471 ) ) ( not ( = ?auto_8467 ?auto_8469 ) ) ( CALIBRATION_TARGET ?auto_8472 ?auto_8471 ) ( ON_BOARD ?auto_8474 ?auto_8473 ) ( POWER_ON ?auto_8474 ) ( not ( = ?auto_8472 ?auto_8474 ) ) ( SUPPORTS ?auto_8474 ?auto_8467 ) ( POINTING ?auto_8473 ?auto_8471 ) ( CALIBRATION_TARGET ?auto_8474 ?auto_8471 ) ( NOT_CALIBRATED ?auto_8474 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8470 ?auto_8467 ?auto_8468 ?auto_8469 )
      ( GET-2IMAGE-VERIFY ?auto_8468 ?auto_8469 ?auto_8470 ?auto_8467 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9082 - DIRECTION
      ?auto_9083 - MODE
      ?auto_9084 - DIRECTION
      ?auto_9081 - MODE
      ?auto_9085 - DIRECTION
      ?auto_9086 - MODE
    )
    :vars
    (
      ?auto_9088 - INSTRUMENT
      ?auto_9089 - SATELLITE
      ?auto_9087 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_9088 ) ( ON_BOARD ?auto_9088 ?auto_9089 ) ( SUPPORTS ?auto_9088 ?auto_9086 ) ( POWER_ON ?auto_9088 ) ( POINTING ?auto_9089 ?auto_9087 ) ( not ( = ?auto_9085 ?auto_9087 ) ) ( HAVE_IMAGE ?auto_9082 ?auto_9083 ) ( not ( = ?auto_9082 ?auto_9085 ) ) ( not ( = ?auto_9082 ?auto_9087 ) ) ( not ( = ?auto_9083 ?auto_9086 ) ) ( HAVE_IMAGE ?auto_9084 ?auto_9081 ) ( not ( = ?auto_9082 ?auto_9084 ) ) ( not ( = ?auto_9083 ?auto_9081 ) ) ( not ( = ?auto_9084 ?auto_9085 ) ) ( not ( = ?auto_9084 ?auto_9087 ) ) ( not ( = ?auto_9081 ?auto_9086 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9082 ?auto_9083 ?auto_9085 ?auto_9086 )
      ( GET-3IMAGE-VERIFY ?auto_9082 ?auto_9083 ?auto_9084 ?auto_9081 ?auto_9085 ?auto_9086 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9106 - DIRECTION
      ?auto_9107 - MODE
      ?auto_9108 - DIRECTION
      ?auto_9105 - MODE
      ?auto_9109 - DIRECTION
      ?auto_9110 - MODE
    )
    :vars
    (
      ?auto_9112 - INSTRUMENT
      ?auto_9113 - SATELLITE
      ?auto_9111 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_9112 ) ( ON_BOARD ?auto_9112 ?auto_9113 ) ( SUPPORTS ?auto_9112 ?auto_9105 ) ( POWER_ON ?auto_9112 ) ( POINTING ?auto_9113 ?auto_9111 ) ( not ( = ?auto_9108 ?auto_9111 ) ) ( HAVE_IMAGE ?auto_9106 ?auto_9107 ) ( not ( = ?auto_9106 ?auto_9108 ) ) ( not ( = ?auto_9106 ?auto_9111 ) ) ( not ( = ?auto_9107 ?auto_9105 ) ) ( HAVE_IMAGE ?auto_9109 ?auto_9110 ) ( not ( = ?auto_9106 ?auto_9109 ) ) ( not ( = ?auto_9107 ?auto_9110 ) ) ( not ( = ?auto_9108 ?auto_9109 ) ) ( not ( = ?auto_9105 ?auto_9110 ) ) ( not ( = ?auto_9109 ?auto_9111 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9106 ?auto_9107 ?auto_9108 ?auto_9105 )
      ( GET-3IMAGE-VERIFY ?auto_9106 ?auto_9107 ?auto_9108 ?auto_9105 ?auto_9109 ?auto_9110 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9130 - DIRECTION
      ?auto_9131 - MODE
      ?auto_9132 - DIRECTION
      ?auto_9129 - MODE
      ?auto_9133 - DIRECTION
      ?auto_9134 - MODE
    )
    :vars
    (
      ?auto_9136 - INSTRUMENT
      ?auto_9138 - SATELLITE
      ?auto_9135 - DIRECTION
      ?auto_9139 - DIRECTION
      ?auto_9137 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9136 ) ( ON_BOARD ?auto_9136 ?auto_9138 ) ( SUPPORTS ?auto_9136 ?auto_9134 ) ( POWER_ON ?auto_9136 ) ( POINTING ?auto_9138 ?auto_9135 ) ( not ( = ?auto_9133 ?auto_9135 ) ) ( HAVE_IMAGE ?auto_9139 ?auto_9137 ) ( not ( = ?auto_9139 ?auto_9133 ) ) ( not ( = ?auto_9139 ?auto_9135 ) ) ( not ( = ?auto_9137 ?auto_9134 ) ) ( HAVE_IMAGE ?auto_9130 ?auto_9131 ) ( HAVE_IMAGE ?auto_9132 ?auto_9129 ) ( not ( = ?auto_9130 ?auto_9132 ) ) ( not ( = ?auto_9130 ?auto_9133 ) ) ( not ( = ?auto_9130 ?auto_9135 ) ) ( not ( = ?auto_9130 ?auto_9139 ) ) ( not ( = ?auto_9131 ?auto_9129 ) ) ( not ( = ?auto_9131 ?auto_9134 ) ) ( not ( = ?auto_9131 ?auto_9137 ) ) ( not ( = ?auto_9132 ?auto_9133 ) ) ( not ( = ?auto_9132 ?auto_9135 ) ) ( not ( = ?auto_9132 ?auto_9139 ) ) ( not ( = ?auto_9129 ?auto_9134 ) ) ( not ( = ?auto_9129 ?auto_9137 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9139 ?auto_9137 ?auto_9133 ?auto_9134 )
      ( GET-3IMAGE-VERIFY ?auto_9130 ?auto_9131 ?auto_9132 ?auto_9129 ?auto_9133 ?auto_9134 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9147 - DIRECTION
      ?auto_9148 - MODE
      ?auto_9149 - DIRECTION
      ?auto_9146 - MODE
      ?auto_9150 - DIRECTION
      ?auto_9151 - MODE
    )
    :vars
    (
      ?auto_9153 - INSTRUMENT
      ?auto_9155 - SATELLITE
      ?auto_9152 - DIRECTION
      ?auto_9156 - DIRECTION
      ?auto_9154 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9153 ) ( ON_BOARD ?auto_9153 ?auto_9155 ) ( SUPPORTS ?auto_9153 ?auto_9146 ) ( POWER_ON ?auto_9153 ) ( POINTING ?auto_9155 ?auto_9152 ) ( not ( = ?auto_9149 ?auto_9152 ) ) ( HAVE_IMAGE ?auto_9156 ?auto_9154 ) ( not ( = ?auto_9156 ?auto_9149 ) ) ( not ( = ?auto_9156 ?auto_9152 ) ) ( not ( = ?auto_9154 ?auto_9146 ) ) ( HAVE_IMAGE ?auto_9147 ?auto_9148 ) ( HAVE_IMAGE ?auto_9150 ?auto_9151 ) ( not ( = ?auto_9147 ?auto_9149 ) ) ( not ( = ?auto_9147 ?auto_9150 ) ) ( not ( = ?auto_9147 ?auto_9152 ) ) ( not ( = ?auto_9147 ?auto_9156 ) ) ( not ( = ?auto_9148 ?auto_9146 ) ) ( not ( = ?auto_9148 ?auto_9151 ) ) ( not ( = ?auto_9148 ?auto_9154 ) ) ( not ( = ?auto_9149 ?auto_9150 ) ) ( not ( = ?auto_9146 ?auto_9151 ) ) ( not ( = ?auto_9150 ?auto_9152 ) ) ( not ( = ?auto_9150 ?auto_9156 ) ) ( not ( = ?auto_9151 ?auto_9154 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9156 ?auto_9154 ?auto_9149 ?auto_9146 )
      ( GET-3IMAGE-VERIFY ?auto_9147 ?auto_9148 ?auto_9149 ?auto_9146 ?auto_9150 ?auto_9151 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9169 - DIRECTION
      ?auto_9170 - MODE
      ?auto_9171 - DIRECTION
      ?auto_9168 - MODE
      ?auto_9172 - DIRECTION
      ?auto_9173 - MODE
    )
    :vars
    (
      ?auto_9175 - INSTRUMENT
      ?auto_9176 - SATELLITE
      ?auto_9174 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_9175 ) ( ON_BOARD ?auto_9175 ?auto_9176 ) ( SUPPORTS ?auto_9175 ?auto_9170 ) ( POWER_ON ?auto_9175 ) ( POINTING ?auto_9176 ?auto_9174 ) ( not ( = ?auto_9169 ?auto_9174 ) ) ( HAVE_IMAGE ?auto_9171 ?auto_9168 ) ( not ( = ?auto_9171 ?auto_9169 ) ) ( not ( = ?auto_9171 ?auto_9174 ) ) ( not ( = ?auto_9168 ?auto_9170 ) ) ( HAVE_IMAGE ?auto_9172 ?auto_9173 ) ( not ( = ?auto_9169 ?auto_9172 ) ) ( not ( = ?auto_9170 ?auto_9173 ) ) ( not ( = ?auto_9171 ?auto_9172 ) ) ( not ( = ?auto_9168 ?auto_9173 ) ) ( not ( = ?auto_9172 ?auto_9174 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9171 ?auto_9168 ?auto_9169 ?auto_9170 )
      ( GET-3IMAGE-VERIFY ?auto_9169 ?auto_9170 ?auto_9171 ?auto_9168 ?auto_9172 ?auto_9173 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9199 - DIRECTION
      ?auto_9200 - MODE
      ?auto_9201 - DIRECTION
      ?auto_9198 - MODE
      ?auto_9202 - DIRECTION
      ?auto_9203 - MODE
    )
    :vars
    (
      ?auto_9205 - INSTRUMENT
      ?auto_9207 - SATELLITE
      ?auto_9204 - DIRECTION
      ?auto_9208 - DIRECTION
      ?auto_9206 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9205 ) ( ON_BOARD ?auto_9205 ?auto_9207 ) ( SUPPORTS ?auto_9205 ?auto_9200 ) ( POWER_ON ?auto_9205 ) ( POINTING ?auto_9207 ?auto_9204 ) ( not ( = ?auto_9199 ?auto_9204 ) ) ( HAVE_IMAGE ?auto_9208 ?auto_9206 ) ( not ( = ?auto_9208 ?auto_9199 ) ) ( not ( = ?auto_9208 ?auto_9204 ) ) ( not ( = ?auto_9206 ?auto_9200 ) ) ( HAVE_IMAGE ?auto_9201 ?auto_9198 ) ( HAVE_IMAGE ?auto_9202 ?auto_9203 ) ( not ( = ?auto_9199 ?auto_9201 ) ) ( not ( = ?auto_9199 ?auto_9202 ) ) ( not ( = ?auto_9200 ?auto_9198 ) ) ( not ( = ?auto_9200 ?auto_9203 ) ) ( not ( = ?auto_9201 ?auto_9202 ) ) ( not ( = ?auto_9201 ?auto_9204 ) ) ( not ( = ?auto_9201 ?auto_9208 ) ) ( not ( = ?auto_9198 ?auto_9203 ) ) ( not ( = ?auto_9198 ?auto_9206 ) ) ( not ( = ?auto_9202 ?auto_9204 ) ) ( not ( = ?auto_9202 ?auto_9208 ) ) ( not ( = ?auto_9203 ?auto_9206 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9208 ?auto_9206 ?auto_9199 ?auto_9200 )
      ( GET-3IMAGE-VERIFY ?auto_9199 ?auto_9200 ?auto_9201 ?auto_9198 ?auto_9202 ?auto_9203 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9290 - DIRECTION
      ?auto_9291 - MODE
      ?auto_9292 - DIRECTION
      ?auto_9289 - MODE
      ?auto_9293 - DIRECTION
      ?auto_9294 - MODE
    )
    :vars
    (
      ?auto_9295 - INSTRUMENT
      ?auto_9296 - SATELLITE
      ?auto_9297 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9295 ?auto_9296 ) ( SUPPORTS ?auto_9295 ?auto_9294 ) ( POWER_ON ?auto_9295 ) ( POINTING ?auto_9296 ?auto_9297 ) ( not ( = ?auto_9293 ?auto_9297 ) ) ( HAVE_IMAGE ?auto_9290 ?auto_9289 ) ( not ( = ?auto_9290 ?auto_9293 ) ) ( not ( = ?auto_9290 ?auto_9297 ) ) ( not ( = ?auto_9289 ?auto_9294 ) ) ( CALIBRATION_TARGET ?auto_9295 ?auto_9297 ) ( NOT_CALIBRATED ?auto_9295 ) ( HAVE_IMAGE ?auto_9290 ?auto_9291 ) ( HAVE_IMAGE ?auto_9292 ?auto_9289 ) ( not ( = ?auto_9290 ?auto_9292 ) ) ( not ( = ?auto_9291 ?auto_9289 ) ) ( not ( = ?auto_9291 ?auto_9294 ) ) ( not ( = ?auto_9292 ?auto_9293 ) ) ( not ( = ?auto_9292 ?auto_9297 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9290 ?auto_9289 ?auto_9293 ?auto_9294 )
      ( GET-3IMAGE-VERIFY ?auto_9290 ?auto_9291 ?auto_9292 ?auto_9289 ?auto_9293 ?auto_9294 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9338 - DIRECTION
      ?auto_9339 - MODE
      ?auto_9340 - DIRECTION
      ?auto_9337 - MODE
      ?auto_9341 - DIRECTION
      ?auto_9342 - MODE
    )
    :vars
    (
      ?auto_9343 - INSTRUMENT
      ?auto_9344 - SATELLITE
      ?auto_9345 - DIRECTION
      ?auto_9346 - DIRECTION
      ?auto_9347 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_9343 ?auto_9344 ) ( SUPPORTS ?auto_9343 ?auto_9342 ) ( POWER_ON ?auto_9343 ) ( POINTING ?auto_9344 ?auto_9345 ) ( not ( = ?auto_9341 ?auto_9345 ) ) ( HAVE_IMAGE ?auto_9346 ?auto_9347 ) ( not ( = ?auto_9346 ?auto_9341 ) ) ( not ( = ?auto_9346 ?auto_9345 ) ) ( not ( = ?auto_9347 ?auto_9342 ) ) ( CALIBRATION_TARGET ?auto_9343 ?auto_9345 ) ( NOT_CALIBRATED ?auto_9343 ) ( HAVE_IMAGE ?auto_9338 ?auto_9339 ) ( HAVE_IMAGE ?auto_9340 ?auto_9337 ) ( not ( = ?auto_9338 ?auto_9340 ) ) ( not ( = ?auto_9338 ?auto_9341 ) ) ( not ( = ?auto_9338 ?auto_9345 ) ) ( not ( = ?auto_9338 ?auto_9346 ) ) ( not ( = ?auto_9339 ?auto_9337 ) ) ( not ( = ?auto_9339 ?auto_9342 ) ) ( not ( = ?auto_9339 ?auto_9347 ) ) ( not ( = ?auto_9340 ?auto_9341 ) ) ( not ( = ?auto_9340 ?auto_9345 ) ) ( not ( = ?auto_9340 ?auto_9346 ) ) ( not ( = ?auto_9337 ?auto_9342 ) ) ( not ( = ?auto_9337 ?auto_9347 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9346 ?auto_9347 ?auto_9341 ?auto_9342 )
      ( GET-3IMAGE-VERIFY ?auto_9338 ?auto_9339 ?auto_9340 ?auto_9337 ?auto_9341 ?auto_9342 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9355 - DIRECTION
      ?auto_9356 - MODE
      ?auto_9357 - DIRECTION
      ?auto_9354 - MODE
      ?auto_9358 - DIRECTION
      ?auto_9359 - MODE
    )
    :vars
    (
      ?auto_9360 - INSTRUMENT
      ?auto_9361 - SATELLITE
      ?auto_9362 - DIRECTION
      ?auto_9363 - DIRECTION
      ?auto_9364 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_9360 ?auto_9361 ) ( SUPPORTS ?auto_9360 ?auto_9354 ) ( POWER_ON ?auto_9360 ) ( POINTING ?auto_9361 ?auto_9362 ) ( not ( = ?auto_9357 ?auto_9362 ) ) ( HAVE_IMAGE ?auto_9363 ?auto_9364 ) ( not ( = ?auto_9363 ?auto_9357 ) ) ( not ( = ?auto_9363 ?auto_9362 ) ) ( not ( = ?auto_9364 ?auto_9354 ) ) ( CALIBRATION_TARGET ?auto_9360 ?auto_9362 ) ( NOT_CALIBRATED ?auto_9360 ) ( HAVE_IMAGE ?auto_9355 ?auto_9356 ) ( HAVE_IMAGE ?auto_9358 ?auto_9359 ) ( not ( = ?auto_9355 ?auto_9357 ) ) ( not ( = ?auto_9355 ?auto_9358 ) ) ( not ( = ?auto_9355 ?auto_9362 ) ) ( not ( = ?auto_9355 ?auto_9363 ) ) ( not ( = ?auto_9356 ?auto_9354 ) ) ( not ( = ?auto_9356 ?auto_9359 ) ) ( not ( = ?auto_9356 ?auto_9364 ) ) ( not ( = ?auto_9357 ?auto_9358 ) ) ( not ( = ?auto_9354 ?auto_9359 ) ) ( not ( = ?auto_9358 ?auto_9362 ) ) ( not ( = ?auto_9358 ?auto_9363 ) ) ( not ( = ?auto_9359 ?auto_9364 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9363 ?auto_9364 ?auto_9357 ?auto_9354 )
      ( GET-3IMAGE-VERIFY ?auto_9355 ?auto_9356 ?auto_9357 ?auto_9354 ?auto_9358 ?auto_9359 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9377 - DIRECTION
      ?auto_9378 - MODE
      ?auto_9379 - DIRECTION
      ?auto_9376 - MODE
      ?auto_9380 - DIRECTION
      ?auto_9381 - MODE
    )
    :vars
    (
      ?auto_9382 - INSTRUMENT
      ?auto_9383 - SATELLITE
      ?auto_9384 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9382 ?auto_9383 ) ( SUPPORTS ?auto_9382 ?auto_9378 ) ( POWER_ON ?auto_9382 ) ( POINTING ?auto_9383 ?auto_9384 ) ( not ( = ?auto_9377 ?auto_9384 ) ) ( HAVE_IMAGE ?auto_9379 ?auto_9381 ) ( not ( = ?auto_9379 ?auto_9377 ) ) ( not ( = ?auto_9379 ?auto_9384 ) ) ( not ( = ?auto_9381 ?auto_9378 ) ) ( CALIBRATION_TARGET ?auto_9382 ?auto_9384 ) ( NOT_CALIBRATED ?auto_9382 ) ( HAVE_IMAGE ?auto_9379 ?auto_9376 ) ( HAVE_IMAGE ?auto_9380 ?auto_9381 ) ( not ( = ?auto_9377 ?auto_9380 ) ) ( not ( = ?auto_9378 ?auto_9376 ) ) ( not ( = ?auto_9379 ?auto_9380 ) ) ( not ( = ?auto_9376 ?auto_9381 ) ) ( not ( = ?auto_9380 ?auto_9384 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9379 ?auto_9381 ?auto_9377 ?auto_9378 )
      ( GET-3IMAGE-VERIFY ?auto_9377 ?auto_9378 ?auto_9379 ?auto_9376 ?auto_9380 ?auto_9381 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9386 - DIRECTION
      ?auto_9387 - MODE
      ?auto_9388 - DIRECTION
      ?auto_9385 - MODE
      ?auto_9389 - DIRECTION
      ?auto_9390 - MODE
    )
    :vars
    (
      ?auto_9391 - INSTRUMENT
      ?auto_9392 - SATELLITE
      ?auto_9393 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9391 ?auto_9392 ) ( SUPPORTS ?auto_9391 ?auto_9387 ) ( POWER_ON ?auto_9391 ) ( POINTING ?auto_9392 ?auto_9393 ) ( not ( = ?auto_9386 ?auto_9393 ) ) ( HAVE_IMAGE ?auto_9388 ?auto_9385 ) ( not ( = ?auto_9388 ?auto_9386 ) ) ( not ( = ?auto_9388 ?auto_9393 ) ) ( not ( = ?auto_9385 ?auto_9387 ) ) ( CALIBRATION_TARGET ?auto_9391 ?auto_9393 ) ( NOT_CALIBRATED ?auto_9391 ) ( HAVE_IMAGE ?auto_9389 ?auto_9390 ) ( not ( = ?auto_9386 ?auto_9389 ) ) ( not ( = ?auto_9387 ?auto_9390 ) ) ( not ( = ?auto_9388 ?auto_9389 ) ) ( not ( = ?auto_9385 ?auto_9390 ) ) ( not ( = ?auto_9389 ?auto_9393 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9388 ?auto_9385 ?auto_9386 ?auto_9387 )
      ( GET-3IMAGE-VERIFY ?auto_9386 ?auto_9387 ?auto_9388 ?auto_9385 ?auto_9389 ?auto_9390 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9410 - DIRECTION
      ?auto_9411 - MODE
      ?auto_9412 - DIRECTION
      ?auto_9409 - MODE
      ?auto_9413 - DIRECTION
      ?auto_9414 - MODE
    )
    :vars
    (
      ?auto_9415 - INSTRUMENT
      ?auto_9416 - SATELLITE
      ?auto_9417 - DIRECTION
      ?auto_9418 - DIRECTION
      ?auto_9419 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_9415 ?auto_9416 ) ( SUPPORTS ?auto_9415 ?auto_9411 ) ( POWER_ON ?auto_9415 ) ( POINTING ?auto_9416 ?auto_9417 ) ( not ( = ?auto_9410 ?auto_9417 ) ) ( HAVE_IMAGE ?auto_9418 ?auto_9419 ) ( not ( = ?auto_9418 ?auto_9410 ) ) ( not ( = ?auto_9418 ?auto_9417 ) ) ( not ( = ?auto_9419 ?auto_9411 ) ) ( CALIBRATION_TARGET ?auto_9415 ?auto_9417 ) ( NOT_CALIBRATED ?auto_9415 ) ( HAVE_IMAGE ?auto_9412 ?auto_9409 ) ( HAVE_IMAGE ?auto_9413 ?auto_9414 ) ( not ( = ?auto_9410 ?auto_9412 ) ) ( not ( = ?auto_9410 ?auto_9413 ) ) ( not ( = ?auto_9411 ?auto_9409 ) ) ( not ( = ?auto_9411 ?auto_9414 ) ) ( not ( = ?auto_9412 ?auto_9413 ) ) ( not ( = ?auto_9412 ?auto_9417 ) ) ( not ( = ?auto_9412 ?auto_9418 ) ) ( not ( = ?auto_9409 ?auto_9414 ) ) ( not ( = ?auto_9409 ?auto_9419 ) ) ( not ( = ?auto_9413 ?auto_9417 ) ) ( not ( = ?auto_9413 ?auto_9418 ) ) ( not ( = ?auto_9414 ?auto_9419 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9418 ?auto_9419 ?auto_9410 ?auto_9411 )
      ( GET-3IMAGE-VERIFY ?auto_9410 ?auto_9411 ?auto_9412 ?auto_9409 ?auto_9413 ?auto_9414 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9501 - DIRECTION
      ?auto_9502 - MODE
      ?auto_9503 - DIRECTION
      ?auto_9500 - MODE
      ?auto_9504 - DIRECTION
      ?auto_9505 - MODE
    )
    :vars
    (
      ?auto_9507 - INSTRUMENT
      ?auto_9506 - SATELLITE
      ?auto_9508 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9507 ?auto_9506 ) ( SUPPORTS ?auto_9507 ?auto_9505 ) ( POINTING ?auto_9506 ?auto_9508 ) ( not ( = ?auto_9504 ?auto_9508 ) ) ( HAVE_IMAGE ?auto_9503 ?auto_9502 ) ( not ( = ?auto_9503 ?auto_9504 ) ) ( not ( = ?auto_9503 ?auto_9508 ) ) ( not ( = ?auto_9502 ?auto_9505 ) ) ( CALIBRATION_TARGET ?auto_9507 ?auto_9508 ) ( POWER_AVAIL ?auto_9506 ) ( HAVE_IMAGE ?auto_9501 ?auto_9502 ) ( HAVE_IMAGE ?auto_9503 ?auto_9500 ) ( not ( = ?auto_9501 ?auto_9503 ) ) ( not ( = ?auto_9501 ?auto_9504 ) ) ( not ( = ?auto_9501 ?auto_9508 ) ) ( not ( = ?auto_9502 ?auto_9500 ) ) ( not ( = ?auto_9500 ?auto_9505 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9503 ?auto_9502 ?auto_9504 ?auto_9505 )
      ( GET-3IMAGE-VERIFY ?auto_9501 ?auto_9502 ?auto_9503 ?auto_9500 ?auto_9504 ?auto_9505 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9519 - DIRECTION
      ?auto_9520 - MODE
      ?auto_9521 - DIRECTION
      ?auto_9518 - MODE
      ?auto_9522 - DIRECTION
      ?auto_9523 - MODE
    )
    :vars
    (
      ?auto_9525 - INSTRUMENT
      ?auto_9524 - SATELLITE
      ?auto_9526 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9525 ?auto_9524 ) ( SUPPORTS ?auto_9525 ?auto_9518 ) ( POINTING ?auto_9524 ?auto_9526 ) ( not ( = ?auto_9521 ?auto_9526 ) ) ( HAVE_IMAGE ?auto_9519 ?auto_9520 ) ( not ( = ?auto_9519 ?auto_9521 ) ) ( not ( = ?auto_9519 ?auto_9526 ) ) ( not ( = ?auto_9520 ?auto_9518 ) ) ( CALIBRATION_TARGET ?auto_9525 ?auto_9526 ) ( POWER_AVAIL ?auto_9524 ) ( HAVE_IMAGE ?auto_9522 ?auto_9523 ) ( not ( = ?auto_9519 ?auto_9522 ) ) ( not ( = ?auto_9520 ?auto_9523 ) ) ( not ( = ?auto_9521 ?auto_9522 ) ) ( not ( = ?auto_9518 ?auto_9523 ) ) ( not ( = ?auto_9522 ?auto_9526 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9519 ?auto_9520 ?auto_9521 ?auto_9518 )
      ( GET-3IMAGE-VERIFY ?auto_9519 ?auto_9520 ?auto_9521 ?auto_9518 ?auto_9522 ?auto_9523 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9549 - DIRECTION
      ?auto_9550 - MODE
      ?auto_9551 - DIRECTION
      ?auto_9548 - MODE
      ?auto_9552 - DIRECTION
      ?auto_9553 - MODE
    )
    :vars
    (
      ?auto_9557 - INSTRUMENT
      ?auto_9554 - SATELLITE
      ?auto_9558 - DIRECTION
      ?auto_9555 - DIRECTION
      ?auto_9556 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_9557 ?auto_9554 ) ( SUPPORTS ?auto_9557 ?auto_9553 ) ( POINTING ?auto_9554 ?auto_9558 ) ( not ( = ?auto_9552 ?auto_9558 ) ) ( HAVE_IMAGE ?auto_9555 ?auto_9556 ) ( not ( = ?auto_9555 ?auto_9552 ) ) ( not ( = ?auto_9555 ?auto_9558 ) ) ( not ( = ?auto_9556 ?auto_9553 ) ) ( CALIBRATION_TARGET ?auto_9557 ?auto_9558 ) ( POWER_AVAIL ?auto_9554 ) ( HAVE_IMAGE ?auto_9549 ?auto_9550 ) ( HAVE_IMAGE ?auto_9551 ?auto_9548 ) ( not ( = ?auto_9549 ?auto_9551 ) ) ( not ( = ?auto_9549 ?auto_9552 ) ) ( not ( = ?auto_9549 ?auto_9558 ) ) ( not ( = ?auto_9549 ?auto_9555 ) ) ( not ( = ?auto_9550 ?auto_9548 ) ) ( not ( = ?auto_9550 ?auto_9553 ) ) ( not ( = ?auto_9550 ?auto_9556 ) ) ( not ( = ?auto_9551 ?auto_9552 ) ) ( not ( = ?auto_9551 ?auto_9558 ) ) ( not ( = ?auto_9551 ?auto_9555 ) ) ( not ( = ?auto_9548 ?auto_9553 ) ) ( not ( = ?auto_9548 ?auto_9556 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9555 ?auto_9556 ?auto_9552 ?auto_9553 )
      ( GET-3IMAGE-VERIFY ?auto_9549 ?auto_9550 ?auto_9551 ?auto_9548 ?auto_9552 ?auto_9553 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9566 - DIRECTION
      ?auto_9567 - MODE
      ?auto_9568 - DIRECTION
      ?auto_9565 - MODE
      ?auto_9569 - DIRECTION
      ?auto_9570 - MODE
    )
    :vars
    (
      ?auto_9574 - INSTRUMENT
      ?auto_9571 - SATELLITE
      ?auto_9575 - DIRECTION
      ?auto_9572 - DIRECTION
      ?auto_9573 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_9574 ?auto_9571 ) ( SUPPORTS ?auto_9574 ?auto_9565 ) ( POINTING ?auto_9571 ?auto_9575 ) ( not ( = ?auto_9568 ?auto_9575 ) ) ( HAVE_IMAGE ?auto_9572 ?auto_9573 ) ( not ( = ?auto_9572 ?auto_9568 ) ) ( not ( = ?auto_9572 ?auto_9575 ) ) ( not ( = ?auto_9573 ?auto_9565 ) ) ( CALIBRATION_TARGET ?auto_9574 ?auto_9575 ) ( POWER_AVAIL ?auto_9571 ) ( HAVE_IMAGE ?auto_9566 ?auto_9567 ) ( HAVE_IMAGE ?auto_9569 ?auto_9570 ) ( not ( = ?auto_9566 ?auto_9568 ) ) ( not ( = ?auto_9566 ?auto_9569 ) ) ( not ( = ?auto_9566 ?auto_9575 ) ) ( not ( = ?auto_9566 ?auto_9572 ) ) ( not ( = ?auto_9567 ?auto_9565 ) ) ( not ( = ?auto_9567 ?auto_9570 ) ) ( not ( = ?auto_9567 ?auto_9573 ) ) ( not ( = ?auto_9568 ?auto_9569 ) ) ( not ( = ?auto_9565 ?auto_9570 ) ) ( not ( = ?auto_9569 ?auto_9575 ) ) ( not ( = ?auto_9569 ?auto_9572 ) ) ( not ( = ?auto_9570 ?auto_9573 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9572 ?auto_9573 ?auto_9568 ?auto_9565 )
      ( GET-3IMAGE-VERIFY ?auto_9566 ?auto_9567 ?auto_9568 ?auto_9565 ?auto_9569 ?auto_9570 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9588 - DIRECTION
      ?auto_9589 - MODE
      ?auto_9590 - DIRECTION
      ?auto_9587 - MODE
      ?auto_9591 - DIRECTION
      ?auto_9592 - MODE
    )
    :vars
    (
      ?auto_9594 - INSTRUMENT
      ?auto_9593 - SATELLITE
      ?auto_9595 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9594 ?auto_9593 ) ( SUPPORTS ?auto_9594 ?auto_9589 ) ( POINTING ?auto_9593 ?auto_9595 ) ( not ( = ?auto_9588 ?auto_9595 ) ) ( HAVE_IMAGE ?auto_9591 ?auto_9592 ) ( not ( = ?auto_9591 ?auto_9588 ) ) ( not ( = ?auto_9591 ?auto_9595 ) ) ( not ( = ?auto_9592 ?auto_9589 ) ) ( CALIBRATION_TARGET ?auto_9594 ?auto_9595 ) ( POWER_AVAIL ?auto_9593 ) ( HAVE_IMAGE ?auto_9590 ?auto_9587 ) ( not ( = ?auto_9588 ?auto_9590 ) ) ( not ( = ?auto_9589 ?auto_9587 ) ) ( not ( = ?auto_9590 ?auto_9591 ) ) ( not ( = ?auto_9590 ?auto_9595 ) ) ( not ( = ?auto_9587 ?auto_9592 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9591 ?auto_9592 ?auto_9588 ?auto_9589 )
      ( GET-3IMAGE-VERIFY ?auto_9588 ?auto_9589 ?auto_9590 ?auto_9587 ?auto_9591 ?auto_9592 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9618 - DIRECTION
      ?auto_9619 - MODE
      ?auto_9620 - DIRECTION
      ?auto_9617 - MODE
      ?auto_9621 - DIRECTION
      ?auto_9622 - MODE
    )
    :vars
    (
      ?auto_9626 - INSTRUMENT
      ?auto_9623 - SATELLITE
      ?auto_9627 - DIRECTION
      ?auto_9624 - DIRECTION
      ?auto_9625 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_9626 ?auto_9623 ) ( SUPPORTS ?auto_9626 ?auto_9619 ) ( POINTING ?auto_9623 ?auto_9627 ) ( not ( = ?auto_9618 ?auto_9627 ) ) ( HAVE_IMAGE ?auto_9624 ?auto_9625 ) ( not ( = ?auto_9624 ?auto_9618 ) ) ( not ( = ?auto_9624 ?auto_9627 ) ) ( not ( = ?auto_9625 ?auto_9619 ) ) ( CALIBRATION_TARGET ?auto_9626 ?auto_9627 ) ( POWER_AVAIL ?auto_9623 ) ( HAVE_IMAGE ?auto_9620 ?auto_9617 ) ( HAVE_IMAGE ?auto_9621 ?auto_9622 ) ( not ( = ?auto_9618 ?auto_9620 ) ) ( not ( = ?auto_9618 ?auto_9621 ) ) ( not ( = ?auto_9619 ?auto_9617 ) ) ( not ( = ?auto_9619 ?auto_9622 ) ) ( not ( = ?auto_9620 ?auto_9621 ) ) ( not ( = ?auto_9620 ?auto_9627 ) ) ( not ( = ?auto_9620 ?auto_9624 ) ) ( not ( = ?auto_9617 ?auto_9622 ) ) ( not ( = ?auto_9617 ?auto_9625 ) ) ( not ( = ?auto_9621 ?auto_9627 ) ) ( not ( = ?auto_9621 ?auto_9624 ) ) ( not ( = ?auto_9622 ?auto_9625 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9624 ?auto_9625 ?auto_9618 ?auto_9619 )
      ( GET-3IMAGE-VERIFY ?auto_9618 ?auto_9619 ?auto_9620 ?auto_9617 ?auto_9621 ?auto_9622 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_9670 - DIRECTION
      ?auto_9671 - MODE
    )
    :vars
    (
      ?auto_9675 - INSTRUMENT
      ?auto_9672 - SATELLITE
      ?auto_9676 - DIRECTION
      ?auto_9673 - DIRECTION
      ?auto_9674 - MODE
      ?auto_9677 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9675 ?auto_9672 ) ( SUPPORTS ?auto_9675 ?auto_9671 ) ( not ( = ?auto_9670 ?auto_9676 ) ) ( HAVE_IMAGE ?auto_9673 ?auto_9674 ) ( not ( = ?auto_9673 ?auto_9670 ) ) ( not ( = ?auto_9673 ?auto_9676 ) ) ( not ( = ?auto_9674 ?auto_9671 ) ) ( CALIBRATION_TARGET ?auto_9675 ?auto_9676 ) ( POWER_AVAIL ?auto_9672 ) ( POINTING ?auto_9672 ?auto_9677 ) ( not ( = ?auto_9676 ?auto_9677 ) ) ( not ( = ?auto_9670 ?auto_9677 ) ) ( not ( = ?auto_9673 ?auto_9677 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_9672 ?auto_9676 ?auto_9677 )
      ( GET-2IMAGE ?auto_9673 ?auto_9674 ?auto_9670 ?auto_9671 )
      ( GET-1IMAGE-VERIFY ?auto_9670 ?auto_9671 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9679 - DIRECTION
      ?auto_9680 - MODE
      ?auto_9681 - DIRECTION
      ?auto_9678 - MODE
    )
    :vars
    (
      ?auto_9684 - INSTRUMENT
      ?auto_9682 - SATELLITE
      ?auto_9685 - DIRECTION
      ?auto_9683 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9684 ?auto_9682 ) ( SUPPORTS ?auto_9684 ?auto_9678 ) ( not ( = ?auto_9681 ?auto_9685 ) ) ( HAVE_IMAGE ?auto_9679 ?auto_9680 ) ( not ( = ?auto_9679 ?auto_9681 ) ) ( not ( = ?auto_9679 ?auto_9685 ) ) ( not ( = ?auto_9680 ?auto_9678 ) ) ( CALIBRATION_TARGET ?auto_9684 ?auto_9685 ) ( POWER_AVAIL ?auto_9682 ) ( POINTING ?auto_9682 ?auto_9683 ) ( not ( = ?auto_9685 ?auto_9683 ) ) ( not ( = ?auto_9681 ?auto_9683 ) ) ( not ( = ?auto_9679 ?auto_9683 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9681 ?auto_9678 )
      ( GET-2IMAGE-VERIFY ?auto_9679 ?auto_9680 ?auto_9681 ?auto_9678 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9687 - DIRECTION
      ?auto_9688 - MODE
      ?auto_9689 - DIRECTION
      ?auto_9686 - MODE
    )
    :vars
    (
      ?auto_9690 - INSTRUMENT
      ?auto_9692 - SATELLITE
      ?auto_9691 - DIRECTION
      ?auto_9693 - DIRECTION
      ?auto_9694 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_9690 ?auto_9692 ) ( SUPPORTS ?auto_9690 ?auto_9686 ) ( not ( = ?auto_9689 ?auto_9691 ) ) ( HAVE_IMAGE ?auto_9693 ?auto_9694 ) ( not ( = ?auto_9693 ?auto_9689 ) ) ( not ( = ?auto_9693 ?auto_9691 ) ) ( not ( = ?auto_9694 ?auto_9686 ) ) ( CALIBRATION_TARGET ?auto_9690 ?auto_9691 ) ( POWER_AVAIL ?auto_9692 ) ( POINTING ?auto_9692 ?auto_9687 ) ( not ( = ?auto_9691 ?auto_9687 ) ) ( not ( = ?auto_9689 ?auto_9687 ) ) ( not ( = ?auto_9693 ?auto_9687 ) ) ( HAVE_IMAGE ?auto_9687 ?auto_9688 ) ( not ( = ?auto_9688 ?auto_9686 ) ) ( not ( = ?auto_9688 ?auto_9694 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9693 ?auto_9694 ?auto_9689 ?auto_9686 )
      ( GET-2IMAGE-VERIFY ?auto_9687 ?auto_9688 ?auto_9689 ?auto_9686 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9696 - DIRECTION
      ?auto_9697 - MODE
      ?auto_9698 - DIRECTION
      ?auto_9695 - MODE
    )
    :vars
    (
      ?auto_9699 - INSTRUMENT
      ?auto_9702 - SATELLITE
      ?auto_9700 - DIRECTION
      ?auto_9701 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9699 ?auto_9702 ) ( SUPPORTS ?auto_9699 ?auto_9697 ) ( not ( = ?auto_9696 ?auto_9700 ) ) ( HAVE_IMAGE ?auto_9698 ?auto_9695 ) ( not ( = ?auto_9698 ?auto_9696 ) ) ( not ( = ?auto_9698 ?auto_9700 ) ) ( not ( = ?auto_9695 ?auto_9697 ) ) ( CALIBRATION_TARGET ?auto_9699 ?auto_9700 ) ( POWER_AVAIL ?auto_9702 ) ( POINTING ?auto_9702 ?auto_9701 ) ( not ( = ?auto_9700 ?auto_9701 ) ) ( not ( = ?auto_9696 ?auto_9701 ) ) ( not ( = ?auto_9698 ?auto_9701 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9698 ?auto_9695 ?auto_9696 ?auto_9697 )
      ( GET-2IMAGE-VERIFY ?auto_9696 ?auto_9697 ?auto_9698 ?auto_9695 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9704 - DIRECTION
      ?auto_9705 - MODE
      ?auto_9706 - DIRECTION
      ?auto_9703 - MODE
    )
    :vars
    (
      ?auto_9707 - INSTRUMENT
      ?auto_9709 - SATELLITE
      ?auto_9708 - DIRECTION
      ?auto_9710 - DIRECTION
      ?auto_9711 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_9707 ?auto_9709 ) ( SUPPORTS ?auto_9707 ?auto_9705 ) ( not ( = ?auto_9704 ?auto_9708 ) ) ( HAVE_IMAGE ?auto_9710 ?auto_9711 ) ( not ( = ?auto_9710 ?auto_9704 ) ) ( not ( = ?auto_9710 ?auto_9708 ) ) ( not ( = ?auto_9711 ?auto_9705 ) ) ( CALIBRATION_TARGET ?auto_9707 ?auto_9708 ) ( POWER_AVAIL ?auto_9709 ) ( POINTING ?auto_9709 ?auto_9706 ) ( not ( = ?auto_9708 ?auto_9706 ) ) ( not ( = ?auto_9704 ?auto_9706 ) ) ( not ( = ?auto_9710 ?auto_9706 ) ) ( HAVE_IMAGE ?auto_9706 ?auto_9703 ) ( not ( = ?auto_9705 ?auto_9703 ) ) ( not ( = ?auto_9703 ?auto_9711 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9710 ?auto_9711 ?auto_9704 ?auto_9705 )
      ( GET-2IMAGE-VERIFY ?auto_9704 ?auto_9705 ?auto_9706 ?auto_9703 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9723 - DIRECTION
      ?auto_9724 - MODE
      ?auto_9725 - DIRECTION
      ?auto_9722 - MODE
      ?auto_9726 - DIRECTION
      ?auto_9727 - MODE
    )
    :vars
    (
      ?auto_9728 - INSTRUMENT
      ?auto_9731 - SATELLITE
      ?auto_9729 - DIRECTION
      ?auto_9730 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9728 ?auto_9731 ) ( SUPPORTS ?auto_9728 ?auto_9727 ) ( not ( = ?auto_9726 ?auto_9729 ) ) ( HAVE_IMAGE ?auto_9723 ?auto_9722 ) ( not ( = ?auto_9723 ?auto_9726 ) ) ( not ( = ?auto_9723 ?auto_9729 ) ) ( not ( = ?auto_9722 ?auto_9727 ) ) ( CALIBRATION_TARGET ?auto_9728 ?auto_9729 ) ( POWER_AVAIL ?auto_9731 ) ( POINTING ?auto_9731 ?auto_9730 ) ( not ( = ?auto_9729 ?auto_9730 ) ) ( not ( = ?auto_9726 ?auto_9730 ) ) ( not ( = ?auto_9723 ?auto_9730 ) ) ( HAVE_IMAGE ?auto_9723 ?auto_9724 ) ( HAVE_IMAGE ?auto_9725 ?auto_9722 ) ( not ( = ?auto_9723 ?auto_9725 ) ) ( not ( = ?auto_9724 ?auto_9722 ) ) ( not ( = ?auto_9724 ?auto_9727 ) ) ( not ( = ?auto_9725 ?auto_9726 ) ) ( not ( = ?auto_9725 ?auto_9729 ) ) ( not ( = ?auto_9725 ?auto_9730 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9723 ?auto_9722 ?auto_9726 ?auto_9727 )
      ( GET-3IMAGE-VERIFY ?auto_9723 ?auto_9724 ?auto_9725 ?auto_9722 ?auto_9726 ?auto_9727 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9733 - DIRECTION
      ?auto_9734 - MODE
      ?auto_9735 - DIRECTION
      ?auto_9732 - MODE
      ?auto_9736 - DIRECTION
      ?auto_9737 - MODE
    )
    :vars
    (
      ?auto_9738 - INSTRUMENT
      ?auto_9740 - SATELLITE
      ?auto_9739 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9738 ?auto_9740 ) ( SUPPORTS ?auto_9738 ?auto_9737 ) ( not ( = ?auto_9736 ?auto_9739 ) ) ( HAVE_IMAGE ?auto_9733 ?auto_9734 ) ( not ( = ?auto_9733 ?auto_9736 ) ) ( not ( = ?auto_9733 ?auto_9739 ) ) ( not ( = ?auto_9734 ?auto_9737 ) ) ( CALIBRATION_TARGET ?auto_9738 ?auto_9739 ) ( POWER_AVAIL ?auto_9740 ) ( POINTING ?auto_9740 ?auto_9735 ) ( not ( = ?auto_9739 ?auto_9735 ) ) ( not ( = ?auto_9736 ?auto_9735 ) ) ( not ( = ?auto_9733 ?auto_9735 ) ) ( HAVE_IMAGE ?auto_9735 ?auto_9732 ) ( not ( = ?auto_9734 ?auto_9732 ) ) ( not ( = ?auto_9732 ?auto_9737 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9733 ?auto_9734 ?auto_9736 ?auto_9737 )
      ( GET-3IMAGE-VERIFY ?auto_9733 ?auto_9734 ?auto_9735 ?auto_9732 ?auto_9736 ?auto_9737 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9742 - DIRECTION
      ?auto_9743 - MODE
      ?auto_9744 - DIRECTION
      ?auto_9741 - MODE
      ?auto_9745 - DIRECTION
      ?auto_9746 - MODE
    )
    :vars
    (
      ?auto_9747 - INSTRUMENT
      ?auto_9750 - SATELLITE
      ?auto_9748 - DIRECTION
      ?auto_9749 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9747 ?auto_9750 ) ( SUPPORTS ?auto_9747 ?auto_9741 ) ( not ( = ?auto_9744 ?auto_9748 ) ) ( HAVE_IMAGE ?auto_9745 ?auto_9746 ) ( not ( = ?auto_9745 ?auto_9744 ) ) ( not ( = ?auto_9745 ?auto_9748 ) ) ( not ( = ?auto_9746 ?auto_9741 ) ) ( CALIBRATION_TARGET ?auto_9747 ?auto_9748 ) ( POWER_AVAIL ?auto_9750 ) ( POINTING ?auto_9750 ?auto_9749 ) ( not ( = ?auto_9748 ?auto_9749 ) ) ( not ( = ?auto_9744 ?auto_9749 ) ) ( not ( = ?auto_9745 ?auto_9749 ) ) ( HAVE_IMAGE ?auto_9742 ?auto_9743 ) ( not ( = ?auto_9742 ?auto_9744 ) ) ( not ( = ?auto_9742 ?auto_9745 ) ) ( not ( = ?auto_9742 ?auto_9748 ) ) ( not ( = ?auto_9742 ?auto_9749 ) ) ( not ( = ?auto_9743 ?auto_9741 ) ) ( not ( = ?auto_9743 ?auto_9746 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9745 ?auto_9746 ?auto_9744 ?auto_9741 )
      ( GET-3IMAGE-VERIFY ?auto_9742 ?auto_9743 ?auto_9744 ?auto_9741 ?auto_9745 ?auto_9746 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9752 - DIRECTION
      ?auto_9753 - MODE
      ?auto_9754 - DIRECTION
      ?auto_9751 - MODE
      ?auto_9755 - DIRECTION
      ?auto_9756 - MODE
    )
    :vars
    (
      ?auto_9757 - INSTRUMENT
      ?auto_9759 - SATELLITE
      ?auto_9758 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9757 ?auto_9759 ) ( SUPPORTS ?auto_9757 ?auto_9751 ) ( not ( = ?auto_9754 ?auto_9758 ) ) ( HAVE_IMAGE ?auto_9752 ?auto_9753 ) ( not ( = ?auto_9752 ?auto_9754 ) ) ( not ( = ?auto_9752 ?auto_9758 ) ) ( not ( = ?auto_9753 ?auto_9751 ) ) ( CALIBRATION_TARGET ?auto_9757 ?auto_9758 ) ( POWER_AVAIL ?auto_9759 ) ( POINTING ?auto_9759 ?auto_9755 ) ( not ( = ?auto_9758 ?auto_9755 ) ) ( not ( = ?auto_9754 ?auto_9755 ) ) ( not ( = ?auto_9752 ?auto_9755 ) ) ( HAVE_IMAGE ?auto_9755 ?auto_9756 ) ( not ( = ?auto_9753 ?auto_9756 ) ) ( not ( = ?auto_9751 ?auto_9756 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9752 ?auto_9753 ?auto_9754 ?auto_9751 )
      ( GET-3IMAGE-VERIFY ?auto_9752 ?auto_9753 ?auto_9754 ?auto_9751 ?auto_9755 ?auto_9756 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9771 - DIRECTION
      ?auto_9772 - MODE
      ?auto_9773 - DIRECTION
      ?auto_9770 - MODE
      ?auto_9774 - DIRECTION
      ?auto_9775 - MODE
    )
    :vars
    (
      ?auto_9776 - INSTRUMENT
      ?auto_9778 - SATELLITE
      ?auto_9777 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9776 ?auto_9778 ) ( SUPPORTS ?auto_9776 ?auto_9775 ) ( not ( = ?auto_9774 ?auto_9777 ) ) ( HAVE_IMAGE ?auto_9773 ?auto_9770 ) ( not ( = ?auto_9773 ?auto_9774 ) ) ( not ( = ?auto_9773 ?auto_9777 ) ) ( not ( = ?auto_9770 ?auto_9775 ) ) ( CALIBRATION_TARGET ?auto_9776 ?auto_9777 ) ( POWER_AVAIL ?auto_9778 ) ( POINTING ?auto_9778 ?auto_9771 ) ( not ( = ?auto_9777 ?auto_9771 ) ) ( not ( = ?auto_9774 ?auto_9771 ) ) ( not ( = ?auto_9773 ?auto_9771 ) ) ( HAVE_IMAGE ?auto_9771 ?auto_9772 ) ( not ( = ?auto_9772 ?auto_9770 ) ) ( not ( = ?auto_9772 ?auto_9775 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9773 ?auto_9770 ?auto_9774 ?auto_9775 )
      ( GET-3IMAGE-VERIFY ?auto_9771 ?auto_9772 ?auto_9773 ?auto_9770 ?auto_9774 ?auto_9775 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9780 - DIRECTION
      ?auto_9781 - MODE
      ?auto_9782 - DIRECTION
      ?auto_9779 - MODE
      ?auto_9783 - DIRECTION
      ?auto_9784 - MODE
    )
    :vars
    (
      ?auto_9785 - INSTRUMENT
      ?auto_9787 - SATELLITE
      ?auto_9786 - DIRECTION
      ?auto_9788 - DIRECTION
      ?auto_9789 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_9785 ?auto_9787 ) ( SUPPORTS ?auto_9785 ?auto_9784 ) ( not ( = ?auto_9783 ?auto_9786 ) ) ( HAVE_IMAGE ?auto_9788 ?auto_9789 ) ( not ( = ?auto_9788 ?auto_9783 ) ) ( not ( = ?auto_9788 ?auto_9786 ) ) ( not ( = ?auto_9789 ?auto_9784 ) ) ( CALIBRATION_TARGET ?auto_9785 ?auto_9786 ) ( POWER_AVAIL ?auto_9787 ) ( POINTING ?auto_9787 ?auto_9782 ) ( not ( = ?auto_9786 ?auto_9782 ) ) ( not ( = ?auto_9783 ?auto_9782 ) ) ( not ( = ?auto_9788 ?auto_9782 ) ) ( HAVE_IMAGE ?auto_9780 ?auto_9781 ) ( HAVE_IMAGE ?auto_9782 ?auto_9779 ) ( not ( = ?auto_9780 ?auto_9782 ) ) ( not ( = ?auto_9780 ?auto_9783 ) ) ( not ( = ?auto_9780 ?auto_9786 ) ) ( not ( = ?auto_9780 ?auto_9788 ) ) ( not ( = ?auto_9781 ?auto_9779 ) ) ( not ( = ?auto_9781 ?auto_9784 ) ) ( not ( = ?auto_9781 ?auto_9789 ) ) ( not ( = ?auto_9779 ?auto_9784 ) ) ( not ( = ?auto_9779 ?auto_9789 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9788 ?auto_9789 ?auto_9783 ?auto_9784 )
      ( GET-3IMAGE-VERIFY ?auto_9780 ?auto_9781 ?auto_9782 ?auto_9779 ?auto_9783 ?auto_9784 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9791 - DIRECTION
      ?auto_9792 - MODE
      ?auto_9793 - DIRECTION
      ?auto_9790 - MODE
      ?auto_9794 - DIRECTION
      ?auto_9795 - MODE
    )
    :vars
    (
      ?auto_9796 - INSTRUMENT
      ?auto_9798 - SATELLITE
      ?auto_9797 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9796 ?auto_9798 ) ( SUPPORTS ?auto_9796 ?auto_9790 ) ( not ( = ?auto_9793 ?auto_9797 ) ) ( HAVE_IMAGE ?auto_9794 ?auto_9795 ) ( not ( = ?auto_9794 ?auto_9793 ) ) ( not ( = ?auto_9794 ?auto_9797 ) ) ( not ( = ?auto_9795 ?auto_9790 ) ) ( CALIBRATION_TARGET ?auto_9796 ?auto_9797 ) ( POWER_AVAIL ?auto_9798 ) ( POINTING ?auto_9798 ?auto_9791 ) ( not ( = ?auto_9797 ?auto_9791 ) ) ( not ( = ?auto_9793 ?auto_9791 ) ) ( not ( = ?auto_9794 ?auto_9791 ) ) ( HAVE_IMAGE ?auto_9791 ?auto_9792 ) ( not ( = ?auto_9792 ?auto_9790 ) ) ( not ( = ?auto_9792 ?auto_9795 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9794 ?auto_9795 ?auto_9793 ?auto_9790 )
      ( GET-3IMAGE-VERIFY ?auto_9791 ?auto_9792 ?auto_9793 ?auto_9790 ?auto_9794 ?auto_9795 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9800 - DIRECTION
      ?auto_9801 - MODE
      ?auto_9802 - DIRECTION
      ?auto_9799 - MODE
      ?auto_9803 - DIRECTION
      ?auto_9804 - MODE
    )
    :vars
    (
      ?auto_9805 - INSTRUMENT
      ?auto_9807 - SATELLITE
      ?auto_9806 - DIRECTION
      ?auto_9808 - DIRECTION
      ?auto_9809 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_9805 ?auto_9807 ) ( SUPPORTS ?auto_9805 ?auto_9799 ) ( not ( = ?auto_9802 ?auto_9806 ) ) ( HAVE_IMAGE ?auto_9808 ?auto_9809 ) ( not ( = ?auto_9808 ?auto_9802 ) ) ( not ( = ?auto_9808 ?auto_9806 ) ) ( not ( = ?auto_9809 ?auto_9799 ) ) ( CALIBRATION_TARGET ?auto_9805 ?auto_9806 ) ( POWER_AVAIL ?auto_9807 ) ( POINTING ?auto_9807 ?auto_9800 ) ( not ( = ?auto_9806 ?auto_9800 ) ) ( not ( = ?auto_9802 ?auto_9800 ) ) ( not ( = ?auto_9808 ?auto_9800 ) ) ( HAVE_IMAGE ?auto_9800 ?auto_9801 ) ( HAVE_IMAGE ?auto_9803 ?auto_9804 ) ( not ( = ?auto_9800 ?auto_9803 ) ) ( not ( = ?auto_9801 ?auto_9799 ) ) ( not ( = ?auto_9801 ?auto_9804 ) ) ( not ( = ?auto_9801 ?auto_9809 ) ) ( not ( = ?auto_9802 ?auto_9803 ) ) ( not ( = ?auto_9799 ?auto_9804 ) ) ( not ( = ?auto_9803 ?auto_9806 ) ) ( not ( = ?auto_9803 ?auto_9808 ) ) ( not ( = ?auto_9804 ?auto_9809 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9808 ?auto_9809 ?auto_9802 ?auto_9799 )
      ( GET-3IMAGE-VERIFY ?auto_9800 ?auto_9801 ?auto_9802 ?auto_9799 ?auto_9803 ?auto_9804 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9822 - DIRECTION
      ?auto_9823 - MODE
      ?auto_9824 - DIRECTION
      ?auto_9821 - MODE
      ?auto_9825 - DIRECTION
      ?auto_9826 - MODE
    )
    :vars
    (
      ?auto_9827 - INSTRUMENT
      ?auto_9830 - SATELLITE
      ?auto_9828 - DIRECTION
      ?auto_9829 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9827 ?auto_9830 ) ( SUPPORTS ?auto_9827 ?auto_9823 ) ( not ( = ?auto_9822 ?auto_9828 ) ) ( HAVE_IMAGE ?auto_9824 ?auto_9821 ) ( not ( = ?auto_9824 ?auto_9822 ) ) ( not ( = ?auto_9824 ?auto_9828 ) ) ( not ( = ?auto_9821 ?auto_9823 ) ) ( CALIBRATION_TARGET ?auto_9827 ?auto_9828 ) ( POWER_AVAIL ?auto_9830 ) ( POINTING ?auto_9830 ?auto_9829 ) ( not ( = ?auto_9828 ?auto_9829 ) ) ( not ( = ?auto_9822 ?auto_9829 ) ) ( not ( = ?auto_9824 ?auto_9829 ) ) ( HAVE_IMAGE ?auto_9825 ?auto_9826 ) ( not ( = ?auto_9822 ?auto_9825 ) ) ( not ( = ?auto_9823 ?auto_9826 ) ) ( not ( = ?auto_9824 ?auto_9825 ) ) ( not ( = ?auto_9821 ?auto_9826 ) ) ( not ( = ?auto_9825 ?auto_9828 ) ) ( not ( = ?auto_9825 ?auto_9829 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9824 ?auto_9821 ?auto_9822 ?auto_9823 )
      ( GET-3IMAGE-VERIFY ?auto_9822 ?auto_9823 ?auto_9824 ?auto_9821 ?auto_9825 ?auto_9826 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9832 - DIRECTION
      ?auto_9833 - MODE
      ?auto_9834 - DIRECTION
      ?auto_9831 - MODE
      ?auto_9835 - DIRECTION
      ?auto_9836 - MODE
    )
    :vars
    (
      ?auto_9837 - INSTRUMENT
      ?auto_9839 - SATELLITE
      ?auto_9838 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9837 ?auto_9839 ) ( SUPPORTS ?auto_9837 ?auto_9833 ) ( not ( = ?auto_9832 ?auto_9838 ) ) ( HAVE_IMAGE ?auto_9834 ?auto_9831 ) ( not ( = ?auto_9834 ?auto_9832 ) ) ( not ( = ?auto_9834 ?auto_9838 ) ) ( not ( = ?auto_9831 ?auto_9833 ) ) ( CALIBRATION_TARGET ?auto_9837 ?auto_9838 ) ( POWER_AVAIL ?auto_9839 ) ( POINTING ?auto_9839 ?auto_9835 ) ( not ( = ?auto_9838 ?auto_9835 ) ) ( not ( = ?auto_9832 ?auto_9835 ) ) ( not ( = ?auto_9834 ?auto_9835 ) ) ( HAVE_IMAGE ?auto_9835 ?auto_9836 ) ( not ( = ?auto_9833 ?auto_9836 ) ) ( not ( = ?auto_9831 ?auto_9836 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9834 ?auto_9831 ?auto_9832 ?auto_9833 )
      ( GET-3IMAGE-VERIFY ?auto_9832 ?auto_9833 ?auto_9834 ?auto_9831 ?auto_9835 ?auto_9836 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9851 - DIRECTION
      ?auto_9852 - MODE
      ?auto_9853 - DIRECTION
      ?auto_9850 - MODE
      ?auto_9854 - DIRECTION
      ?auto_9855 - MODE
    )
    :vars
    (
      ?auto_9856 - INSTRUMENT
      ?auto_9858 - SATELLITE
      ?auto_9857 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9856 ?auto_9858 ) ( SUPPORTS ?auto_9856 ?auto_9852 ) ( not ( = ?auto_9851 ?auto_9857 ) ) ( HAVE_IMAGE ?auto_9854 ?auto_9855 ) ( not ( = ?auto_9854 ?auto_9851 ) ) ( not ( = ?auto_9854 ?auto_9857 ) ) ( not ( = ?auto_9855 ?auto_9852 ) ) ( CALIBRATION_TARGET ?auto_9856 ?auto_9857 ) ( POWER_AVAIL ?auto_9858 ) ( POINTING ?auto_9858 ?auto_9853 ) ( not ( = ?auto_9857 ?auto_9853 ) ) ( not ( = ?auto_9851 ?auto_9853 ) ) ( not ( = ?auto_9854 ?auto_9853 ) ) ( HAVE_IMAGE ?auto_9853 ?auto_9850 ) ( not ( = ?auto_9852 ?auto_9850 ) ) ( not ( = ?auto_9850 ?auto_9855 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9854 ?auto_9855 ?auto_9851 ?auto_9852 )
      ( GET-3IMAGE-VERIFY ?auto_9851 ?auto_9852 ?auto_9853 ?auto_9850 ?auto_9854 ?auto_9855 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9860 - DIRECTION
      ?auto_9861 - MODE
      ?auto_9862 - DIRECTION
      ?auto_9859 - MODE
      ?auto_9863 - DIRECTION
      ?auto_9864 - MODE
    )
    :vars
    (
      ?auto_9865 - INSTRUMENT
      ?auto_9867 - SATELLITE
      ?auto_9866 - DIRECTION
      ?auto_9868 - DIRECTION
      ?auto_9869 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_9865 ?auto_9867 ) ( SUPPORTS ?auto_9865 ?auto_9861 ) ( not ( = ?auto_9860 ?auto_9866 ) ) ( HAVE_IMAGE ?auto_9868 ?auto_9869 ) ( not ( = ?auto_9868 ?auto_9860 ) ) ( not ( = ?auto_9868 ?auto_9866 ) ) ( not ( = ?auto_9869 ?auto_9861 ) ) ( CALIBRATION_TARGET ?auto_9865 ?auto_9866 ) ( POWER_AVAIL ?auto_9867 ) ( POINTING ?auto_9867 ?auto_9863 ) ( not ( = ?auto_9866 ?auto_9863 ) ) ( not ( = ?auto_9860 ?auto_9863 ) ) ( not ( = ?auto_9868 ?auto_9863 ) ) ( HAVE_IMAGE ?auto_9862 ?auto_9859 ) ( HAVE_IMAGE ?auto_9863 ?auto_9864 ) ( not ( = ?auto_9860 ?auto_9862 ) ) ( not ( = ?auto_9861 ?auto_9859 ) ) ( not ( = ?auto_9861 ?auto_9864 ) ) ( not ( = ?auto_9862 ?auto_9863 ) ) ( not ( = ?auto_9862 ?auto_9866 ) ) ( not ( = ?auto_9862 ?auto_9868 ) ) ( not ( = ?auto_9859 ?auto_9864 ) ) ( not ( = ?auto_9859 ?auto_9869 ) ) ( not ( = ?auto_9864 ?auto_9869 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9868 ?auto_9869 ?auto_9860 ?auto_9861 )
      ( GET-3IMAGE-VERIFY ?auto_9860 ?auto_9861 ?auto_9862 ?auto_9859 ?auto_9863 ?auto_9864 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_9914 - DIRECTION
      ?auto_9915 - MODE
    )
    :vars
    (
      ?auto_9916 - INSTRUMENT
      ?auto_9919 - SATELLITE
      ?auto_9917 - DIRECTION
      ?auto_9920 - DIRECTION
      ?auto_9921 - MODE
      ?auto_9918 - DIRECTION
      ?auto_9922 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9916 ?auto_9919 ) ( SUPPORTS ?auto_9916 ?auto_9915 ) ( not ( = ?auto_9914 ?auto_9917 ) ) ( HAVE_IMAGE ?auto_9920 ?auto_9921 ) ( not ( = ?auto_9920 ?auto_9914 ) ) ( not ( = ?auto_9920 ?auto_9917 ) ) ( not ( = ?auto_9921 ?auto_9915 ) ) ( CALIBRATION_TARGET ?auto_9916 ?auto_9917 ) ( POINTING ?auto_9919 ?auto_9918 ) ( not ( = ?auto_9917 ?auto_9918 ) ) ( not ( = ?auto_9914 ?auto_9918 ) ) ( not ( = ?auto_9920 ?auto_9918 ) ) ( ON_BOARD ?auto_9922 ?auto_9919 ) ( POWER_ON ?auto_9922 ) ( not ( = ?auto_9916 ?auto_9922 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_9922 ?auto_9919 )
      ( GET-2IMAGE ?auto_9920 ?auto_9921 ?auto_9914 ?auto_9915 )
      ( GET-1IMAGE-VERIFY ?auto_9914 ?auto_9915 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9924 - DIRECTION
      ?auto_9925 - MODE
      ?auto_9926 - DIRECTION
      ?auto_9923 - MODE
    )
    :vars
    (
      ?auto_9928 - INSTRUMENT
      ?auto_9929 - SATELLITE
      ?auto_9927 - DIRECTION
      ?auto_9930 - DIRECTION
      ?auto_9931 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9928 ?auto_9929 ) ( SUPPORTS ?auto_9928 ?auto_9923 ) ( not ( = ?auto_9926 ?auto_9927 ) ) ( HAVE_IMAGE ?auto_9924 ?auto_9925 ) ( not ( = ?auto_9924 ?auto_9926 ) ) ( not ( = ?auto_9924 ?auto_9927 ) ) ( not ( = ?auto_9925 ?auto_9923 ) ) ( CALIBRATION_TARGET ?auto_9928 ?auto_9927 ) ( POINTING ?auto_9929 ?auto_9930 ) ( not ( = ?auto_9927 ?auto_9930 ) ) ( not ( = ?auto_9926 ?auto_9930 ) ) ( not ( = ?auto_9924 ?auto_9930 ) ) ( ON_BOARD ?auto_9931 ?auto_9929 ) ( POWER_ON ?auto_9931 ) ( not ( = ?auto_9928 ?auto_9931 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9926 ?auto_9923 )
      ( GET-2IMAGE-VERIFY ?auto_9924 ?auto_9925 ?auto_9926 ?auto_9923 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9933 - DIRECTION
      ?auto_9934 - MODE
      ?auto_9935 - DIRECTION
      ?auto_9932 - MODE
    )
    :vars
    (
      ?auto_9936 - INSTRUMENT
      ?auto_9941 - SATELLITE
      ?auto_9937 - DIRECTION
      ?auto_9938 - DIRECTION
      ?auto_9939 - MODE
      ?auto_9940 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9936 ?auto_9941 ) ( SUPPORTS ?auto_9936 ?auto_9932 ) ( not ( = ?auto_9935 ?auto_9937 ) ) ( HAVE_IMAGE ?auto_9938 ?auto_9939 ) ( not ( = ?auto_9938 ?auto_9935 ) ) ( not ( = ?auto_9938 ?auto_9937 ) ) ( not ( = ?auto_9939 ?auto_9932 ) ) ( CALIBRATION_TARGET ?auto_9936 ?auto_9937 ) ( POINTING ?auto_9941 ?auto_9933 ) ( not ( = ?auto_9937 ?auto_9933 ) ) ( not ( = ?auto_9935 ?auto_9933 ) ) ( not ( = ?auto_9938 ?auto_9933 ) ) ( ON_BOARD ?auto_9940 ?auto_9941 ) ( POWER_ON ?auto_9940 ) ( not ( = ?auto_9936 ?auto_9940 ) ) ( HAVE_IMAGE ?auto_9933 ?auto_9934 ) ( not ( = ?auto_9934 ?auto_9932 ) ) ( not ( = ?auto_9934 ?auto_9939 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9938 ?auto_9939 ?auto_9935 ?auto_9932 )
      ( GET-2IMAGE-VERIFY ?auto_9933 ?auto_9934 ?auto_9935 ?auto_9932 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9943 - DIRECTION
      ?auto_9944 - MODE
      ?auto_9945 - DIRECTION
      ?auto_9942 - MODE
    )
    :vars
    (
      ?auto_9946 - INSTRUMENT
      ?auto_9950 - SATELLITE
      ?auto_9947 - DIRECTION
      ?auto_9948 - DIRECTION
      ?auto_9949 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9946 ?auto_9950 ) ( SUPPORTS ?auto_9946 ?auto_9944 ) ( not ( = ?auto_9943 ?auto_9947 ) ) ( HAVE_IMAGE ?auto_9945 ?auto_9942 ) ( not ( = ?auto_9945 ?auto_9943 ) ) ( not ( = ?auto_9945 ?auto_9947 ) ) ( not ( = ?auto_9942 ?auto_9944 ) ) ( CALIBRATION_TARGET ?auto_9946 ?auto_9947 ) ( POINTING ?auto_9950 ?auto_9948 ) ( not ( = ?auto_9947 ?auto_9948 ) ) ( not ( = ?auto_9943 ?auto_9948 ) ) ( not ( = ?auto_9945 ?auto_9948 ) ) ( ON_BOARD ?auto_9949 ?auto_9950 ) ( POWER_ON ?auto_9949 ) ( not ( = ?auto_9946 ?auto_9949 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9945 ?auto_9942 ?auto_9943 ?auto_9944 )
      ( GET-2IMAGE-VERIFY ?auto_9943 ?auto_9944 ?auto_9945 ?auto_9942 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9952 - DIRECTION
      ?auto_9953 - MODE
      ?auto_9954 - DIRECTION
      ?auto_9951 - MODE
    )
    :vars
    (
      ?auto_9955 - INSTRUMENT
      ?auto_9960 - SATELLITE
      ?auto_9956 - DIRECTION
      ?auto_9957 - DIRECTION
      ?auto_9958 - MODE
      ?auto_9959 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9955 ?auto_9960 ) ( SUPPORTS ?auto_9955 ?auto_9953 ) ( not ( = ?auto_9952 ?auto_9956 ) ) ( HAVE_IMAGE ?auto_9957 ?auto_9958 ) ( not ( = ?auto_9957 ?auto_9952 ) ) ( not ( = ?auto_9957 ?auto_9956 ) ) ( not ( = ?auto_9958 ?auto_9953 ) ) ( CALIBRATION_TARGET ?auto_9955 ?auto_9956 ) ( POINTING ?auto_9960 ?auto_9954 ) ( not ( = ?auto_9956 ?auto_9954 ) ) ( not ( = ?auto_9952 ?auto_9954 ) ) ( not ( = ?auto_9957 ?auto_9954 ) ) ( ON_BOARD ?auto_9959 ?auto_9960 ) ( POWER_ON ?auto_9959 ) ( not ( = ?auto_9955 ?auto_9959 ) ) ( HAVE_IMAGE ?auto_9954 ?auto_9951 ) ( not ( = ?auto_9953 ?auto_9951 ) ) ( not ( = ?auto_9951 ?auto_9958 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9957 ?auto_9958 ?auto_9952 ?auto_9953 )
      ( GET-2IMAGE-VERIFY ?auto_9952 ?auto_9953 ?auto_9954 ?auto_9951 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9973 - DIRECTION
      ?auto_9974 - MODE
      ?auto_9975 - DIRECTION
      ?auto_9972 - MODE
      ?auto_9976 - DIRECTION
      ?auto_9977 - MODE
    )
    :vars
    (
      ?auto_9978 - INSTRUMENT
      ?auto_9982 - SATELLITE
      ?auto_9979 - DIRECTION
      ?auto_9980 - DIRECTION
      ?auto_9981 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9978 ?auto_9982 ) ( SUPPORTS ?auto_9978 ?auto_9977 ) ( not ( = ?auto_9976 ?auto_9979 ) ) ( HAVE_IMAGE ?auto_9975 ?auto_9974 ) ( not ( = ?auto_9975 ?auto_9976 ) ) ( not ( = ?auto_9975 ?auto_9979 ) ) ( not ( = ?auto_9974 ?auto_9977 ) ) ( CALIBRATION_TARGET ?auto_9978 ?auto_9979 ) ( POINTING ?auto_9982 ?auto_9980 ) ( not ( = ?auto_9979 ?auto_9980 ) ) ( not ( = ?auto_9976 ?auto_9980 ) ) ( not ( = ?auto_9975 ?auto_9980 ) ) ( ON_BOARD ?auto_9981 ?auto_9982 ) ( POWER_ON ?auto_9981 ) ( not ( = ?auto_9978 ?auto_9981 ) ) ( HAVE_IMAGE ?auto_9973 ?auto_9974 ) ( HAVE_IMAGE ?auto_9975 ?auto_9972 ) ( not ( = ?auto_9973 ?auto_9975 ) ) ( not ( = ?auto_9973 ?auto_9976 ) ) ( not ( = ?auto_9973 ?auto_9979 ) ) ( not ( = ?auto_9973 ?auto_9980 ) ) ( not ( = ?auto_9974 ?auto_9972 ) ) ( not ( = ?auto_9972 ?auto_9977 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9975 ?auto_9974 ?auto_9976 ?auto_9977 )
      ( GET-3IMAGE-VERIFY ?auto_9973 ?auto_9974 ?auto_9975 ?auto_9972 ?auto_9976 ?auto_9977 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9984 - DIRECTION
      ?auto_9985 - MODE
      ?auto_9986 - DIRECTION
      ?auto_9983 - MODE
      ?auto_9987 - DIRECTION
      ?auto_9988 - MODE
    )
    :vars
    (
      ?auto_9989 - INSTRUMENT
      ?auto_9992 - SATELLITE
      ?auto_9990 - DIRECTION
      ?auto_9991 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9989 ?auto_9992 ) ( SUPPORTS ?auto_9989 ?auto_9988 ) ( not ( = ?auto_9987 ?auto_9990 ) ) ( HAVE_IMAGE ?auto_9984 ?auto_9985 ) ( not ( = ?auto_9984 ?auto_9987 ) ) ( not ( = ?auto_9984 ?auto_9990 ) ) ( not ( = ?auto_9985 ?auto_9988 ) ) ( CALIBRATION_TARGET ?auto_9989 ?auto_9990 ) ( POINTING ?auto_9992 ?auto_9986 ) ( not ( = ?auto_9990 ?auto_9986 ) ) ( not ( = ?auto_9987 ?auto_9986 ) ) ( not ( = ?auto_9984 ?auto_9986 ) ) ( ON_BOARD ?auto_9991 ?auto_9992 ) ( POWER_ON ?auto_9991 ) ( not ( = ?auto_9989 ?auto_9991 ) ) ( HAVE_IMAGE ?auto_9986 ?auto_9983 ) ( not ( = ?auto_9985 ?auto_9983 ) ) ( not ( = ?auto_9983 ?auto_9988 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9984 ?auto_9985 ?auto_9987 ?auto_9988 )
      ( GET-3IMAGE-VERIFY ?auto_9984 ?auto_9985 ?auto_9986 ?auto_9983 ?auto_9987 ?auto_9988 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9994 - DIRECTION
      ?auto_9995 - MODE
      ?auto_9996 - DIRECTION
      ?auto_9993 - MODE
      ?auto_9997 - DIRECTION
      ?auto_9998 - MODE
    )
    :vars
    (
      ?auto_9999 - INSTRUMENT
      ?auto_10003 - SATELLITE
      ?auto_10000 - DIRECTION
      ?auto_10001 - DIRECTION
      ?auto_10002 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9999 ?auto_10003 ) ( SUPPORTS ?auto_9999 ?auto_9993 ) ( not ( = ?auto_9996 ?auto_10000 ) ) ( HAVE_IMAGE ?auto_9997 ?auto_9998 ) ( not ( = ?auto_9997 ?auto_9996 ) ) ( not ( = ?auto_9997 ?auto_10000 ) ) ( not ( = ?auto_9998 ?auto_9993 ) ) ( CALIBRATION_TARGET ?auto_9999 ?auto_10000 ) ( POINTING ?auto_10003 ?auto_10001 ) ( not ( = ?auto_10000 ?auto_10001 ) ) ( not ( = ?auto_9996 ?auto_10001 ) ) ( not ( = ?auto_9997 ?auto_10001 ) ) ( ON_BOARD ?auto_10002 ?auto_10003 ) ( POWER_ON ?auto_10002 ) ( not ( = ?auto_9999 ?auto_10002 ) ) ( HAVE_IMAGE ?auto_9994 ?auto_9995 ) ( not ( = ?auto_9994 ?auto_9996 ) ) ( not ( = ?auto_9994 ?auto_9997 ) ) ( not ( = ?auto_9994 ?auto_10000 ) ) ( not ( = ?auto_9994 ?auto_10001 ) ) ( not ( = ?auto_9995 ?auto_9993 ) ) ( not ( = ?auto_9995 ?auto_9998 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9997 ?auto_9998 ?auto_9996 ?auto_9993 )
      ( GET-3IMAGE-VERIFY ?auto_9994 ?auto_9995 ?auto_9996 ?auto_9993 ?auto_9997 ?auto_9998 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10005 - DIRECTION
      ?auto_10006 - MODE
      ?auto_10007 - DIRECTION
      ?auto_10004 - MODE
      ?auto_10008 - DIRECTION
      ?auto_10009 - MODE
    )
    :vars
    (
      ?auto_10010 - INSTRUMENT
      ?auto_10013 - SATELLITE
      ?auto_10011 - DIRECTION
      ?auto_10012 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10010 ?auto_10013 ) ( SUPPORTS ?auto_10010 ?auto_10004 ) ( not ( = ?auto_10007 ?auto_10011 ) ) ( HAVE_IMAGE ?auto_10005 ?auto_10006 ) ( not ( = ?auto_10005 ?auto_10007 ) ) ( not ( = ?auto_10005 ?auto_10011 ) ) ( not ( = ?auto_10006 ?auto_10004 ) ) ( CALIBRATION_TARGET ?auto_10010 ?auto_10011 ) ( POINTING ?auto_10013 ?auto_10008 ) ( not ( = ?auto_10011 ?auto_10008 ) ) ( not ( = ?auto_10007 ?auto_10008 ) ) ( not ( = ?auto_10005 ?auto_10008 ) ) ( ON_BOARD ?auto_10012 ?auto_10013 ) ( POWER_ON ?auto_10012 ) ( not ( = ?auto_10010 ?auto_10012 ) ) ( HAVE_IMAGE ?auto_10008 ?auto_10009 ) ( not ( = ?auto_10006 ?auto_10009 ) ) ( not ( = ?auto_10004 ?auto_10009 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10005 ?auto_10006 ?auto_10007 ?auto_10004 )
      ( GET-3IMAGE-VERIFY ?auto_10005 ?auto_10006 ?auto_10007 ?auto_10004 ?auto_10008 ?auto_10009 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10026 - DIRECTION
      ?auto_10027 - MODE
      ?auto_10028 - DIRECTION
      ?auto_10025 - MODE
      ?auto_10029 - DIRECTION
      ?auto_10030 - MODE
    )
    :vars
    (
      ?auto_10031 - INSTRUMENT
      ?auto_10034 - SATELLITE
      ?auto_10032 - DIRECTION
      ?auto_10033 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10031 ?auto_10034 ) ( SUPPORTS ?auto_10031 ?auto_10030 ) ( not ( = ?auto_10029 ?auto_10032 ) ) ( HAVE_IMAGE ?auto_10028 ?auto_10025 ) ( not ( = ?auto_10028 ?auto_10029 ) ) ( not ( = ?auto_10028 ?auto_10032 ) ) ( not ( = ?auto_10025 ?auto_10030 ) ) ( CALIBRATION_TARGET ?auto_10031 ?auto_10032 ) ( POINTING ?auto_10034 ?auto_10026 ) ( not ( = ?auto_10032 ?auto_10026 ) ) ( not ( = ?auto_10029 ?auto_10026 ) ) ( not ( = ?auto_10028 ?auto_10026 ) ) ( ON_BOARD ?auto_10033 ?auto_10034 ) ( POWER_ON ?auto_10033 ) ( not ( = ?auto_10031 ?auto_10033 ) ) ( HAVE_IMAGE ?auto_10026 ?auto_10027 ) ( not ( = ?auto_10027 ?auto_10025 ) ) ( not ( = ?auto_10027 ?auto_10030 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10028 ?auto_10025 ?auto_10029 ?auto_10030 )
      ( GET-3IMAGE-VERIFY ?auto_10026 ?auto_10027 ?auto_10028 ?auto_10025 ?auto_10029 ?auto_10030 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10036 - DIRECTION
      ?auto_10037 - MODE
      ?auto_10038 - DIRECTION
      ?auto_10035 - MODE
      ?auto_10039 - DIRECTION
      ?auto_10040 - MODE
    )
    :vars
    (
      ?auto_10041 - INSTRUMENT
      ?auto_10046 - SATELLITE
      ?auto_10042 - DIRECTION
      ?auto_10043 - DIRECTION
      ?auto_10044 - MODE
      ?auto_10045 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10041 ?auto_10046 ) ( SUPPORTS ?auto_10041 ?auto_10040 ) ( not ( = ?auto_10039 ?auto_10042 ) ) ( HAVE_IMAGE ?auto_10043 ?auto_10044 ) ( not ( = ?auto_10043 ?auto_10039 ) ) ( not ( = ?auto_10043 ?auto_10042 ) ) ( not ( = ?auto_10044 ?auto_10040 ) ) ( CALIBRATION_TARGET ?auto_10041 ?auto_10042 ) ( POINTING ?auto_10046 ?auto_10038 ) ( not ( = ?auto_10042 ?auto_10038 ) ) ( not ( = ?auto_10039 ?auto_10038 ) ) ( not ( = ?auto_10043 ?auto_10038 ) ) ( ON_BOARD ?auto_10045 ?auto_10046 ) ( POWER_ON ?auto_10045 ) ( not ( = ?auto_10041 ?auto_10045 ) ) ( HAVE_IMAGE ?auto_10036 ?auto_10037 ) ( HAVE_IMAGE ?auto_10038 ?auto_10035 ) ( not ( = ?auto_10036 ?auto_10038 ) ) ( not ( = ?auto_10036 ?auto_10039 ) ) ( not ( = ?auto_10036 ?auto_10042 ) ) ( not ( = ?auto_10036 ?auto_10043 ) ) ( not ( = ?auto_10037 ?auto_10035 ) ) ( not ( = ?auto_10037 ?auto_10040 ) ) ( not ( = ?auto_10037 ?auto_10044 ) ) ( not ( = ?auto_10035 ?auto_10040 ) ) ( not ( = ?auto_10035 ?auto_10044 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10043 ?auto_10044 ?auto_10039 ?auto_10040 )
      ( GET-3IMAGE-VERIFY ?auto_10036 ?auto_10037 ?auto_10038 ?auto_10035 ?auto_10039 ?auto_10040 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10048 - DIRECTION
      ?auto_10049 - MODE
      ?auto_10050 - DIRECTION
      ?auto_10047 - MODE
      ?auto_10051 - DIRECTION
      ?auto_10052 - MODE
    )
    :vars
    (
      ?auto_10053 - INSTRUMENT
      ?auto_10056 - SATELLITE
      ?auto_10054 - DIRECTION
      ?auto_10055 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10053 ?auto_10056 ) ( SUPPORTS ?auto_10053 ?auto_10047 ) ( not ( = ?auto_10050 ?auto_10054 ) ) ( HAVE_IMAGE ?auto_10051 ?auto_10052 ) ( not ( = ?auto_10051 ?auto_10050 ) ) ( not ( = ?auto_10051 ?auto_10054 ) ) ( not ( = ?auto_10052 ?auto_10047 ) ) ( CALIBRATION_TARGET ?auto_10053 ?auto_10054 ) ( POINTING ?auto_10056 ?auto_10048 ) ( not ( = ?auto_10054 ?auto_10048 ) ) ( not ( = ?auto_10050 ?auto_10048 ) ) ( not ( = ?auto_10051 ?auto_10048 ) ) ( ON_BOARD ?auto_10055 ?auto_10056 ) ( POWER_ON ?auto_10055 ) ( not ( = ?auto_10053 ?auto_10055 ) ) ( HAVE_IMAGE ?auto_10048 ?auto_10049 ) ( not ( = ?auto_10049 ?auto_10047 ) ) ( not ( = ?auto_10049 ?auto_10052 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10051 ?auto_10052 ?auto_10050 ?auto_10047 )
      ( GET-3IMAGE-VERIFY ?auto_10048 ?auto_10049 ?auto_10050 ?auto_10047 ?auto_10051 ?auto_10052 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10058 - DIRECTION
      ?auto_10059 - MODE
      ?auto_10060 - DIRECTION
      ?auto_10057 - MODE
      ?auto_10061 - DIRECTION
      ?auto_10062 - MODE
    )
    :vars
    (
      ?auto_10063 - INSTRUMENT
      ?auto_10068 - SATELLITE
      ?auto_10064 - DIRECTION
      ?auto_10065 - DIRECTION
      ?auto_10066 - MODE
      ?auto_10067 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10063 ?auto_10068 ) ( SUPPORTS ?auto_10063 ?auto_10057 ) ( not ( = ?auto_10060 ?auto_10064 ) ) ( HAVE_IMAGE ?auto_10065 ?auto_10066 ) ( not ( = ?auto_10065 ?auto_10060 ) ) ( not ( = ?auto_10065 ?auto_10064 ) ) ( not ( = ?auto_10066 ?auto_10057 ) ) ( CALIBRATION_TARGET ?auto_10063 ?auto_10064 ) ( POINTING ?auto_10068 ?auto_10058 ) ( not ( = ?auto_10064 ?auto_10058 ) ) ( not ( = ?auto_10060 ?auto_10058 ) ) ( not ( = ?auto_10065 ?auto_10058 ) ) ( ON_BOARD ?auto_10067 ?auto_10068 ) ( POWER_ON ?auto_10067 ) ( not ( = ?auto_10063 ?auto_10067 ) ) ( HAVE_IMAGE ?auto_10058 ?auto_10059 ) ( HAVE_IMAGE ?auto_10061 ?auto_10062 ) ( not ( = ?auto_10058 ?auto_10061 ) ) ( not ( = ?auto_10059 ?auto_10057 ) ) ( not ( = ?auto_10059 ?auto_10062 ) ) ( not ( = ?auto_10059 ?auto_10066 ) ) ( not ( = ?auto_10060 ?auto_10061 ) ) ( not ( = ?auto_10057 ?auto_10062 ) ) ( not ( = ?auto_10061 ?auto_10064 ) ) ( not ( = ?auto_10061 ?auto_10065 ) ) ( not ( = ?auto_10062 ?auto_10066 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10065 ?auto_10066 ?auto_10060 ?auto_10057 )
      ( GET-3IMAGE-VERIFY ?auto_10058 ?auto_10059 ?auto_10060 ?auto_10057 ?auto_10061 ?auto_10062 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10082 - DIRECTION
      ?auto_10083 - MODE
      ?auto_10084 - DIRECTION
      ?auto_10081 - MODE
      ?auto_10085 - DIRECTION
      ?auto_10086 - MODE
    )
    :vars
    (
      ?auto_10087 - INSTRUMENT
      ?auto_10091 - SATELLITE
      ?auto_10088 - DIRECTION
      ?auto_10089 - DIRECTION
      ?auto_10090 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10087 ?auto_10091 ) ( SUPPORTS ?auto_10087 ?auto_10083 ) ( not ( = ?auto_10082 ?auto_10088 ) ) ( HAVE_IMAGE ?auto_10085 ?auto_10081 ) ( not ( = ?auto_10085 ?auto_10082 ) ) ( not ( = ?auto_10085 ?auto_10088 ) ) ( not ( = ?auto_10081 ?auto_10083 ) ) ( CALIBRATION_TARGET ?auto_10087 ?auto_10088 ) ( POINTING ?auto_10091 ?auto_10089 ) ( not ( = ?auto_10088 ?auto_10089 ) ) ( not ( = ?auto_10082 ?auto_10089 ) ) ( not ( = ?auto_10085 ?auto_10089 ) ) ( ON_BOARD ?auto_10090 ?auto_10091 ) ( POWER_ON ?auto_10090 ) ( not ( = ?auto_10087 ?auto_10090 ) ) ( HAVE_IMAGE ?auto_10084 ?auto_10081 ) ( HAVE_IMAGE ?auto_10085 ?auto_10086 ) ( not ( = ?auto_10082 ?auto_10084 ) ) ( not ( = ?auto_10083 ?auto_10086 ) ) ( not ( = ?auto_10084 ?auto_10085 ) ) ( not ( = ?auto_10084 ?auto_10088 ) ) ( not ( = ?auto_10084 ?auto_10089 ) ) ( not ( = ?auto_10081 ?auto_10086 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10085 ?auto_10081 ?auto_10082 ?auto_10083 )
      ( GET-3IMAGE-VERIFY ?auto_10082 ?auto_10083 ?auto_10084 ?auto_10081 ?auto_10085 ?auto_10086 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10093 - DIRECTION
      ?auto_10094 - MODE
      ?auto_10095 - DIRECTION
      ?auto_10092 - MODE
      ?auto_10096 - DIRECTION
      ?auto_10097 - MODE
    )
    :vars
    (
      ?auto_10098 - INSTRUMENT
      ?auto_10101 - SATELLITE
      ?auto_10099 - DIRECTION
      ?auto_10100 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10098 ?auto_10101 ) ( SUPPORTS ?auto_10098 ?auto_10094 ) ( not ( = ?auto_10093 ?auto_10099 ) ) ( HAVE_IMAGE ?auto_10095 ?auto_10092 ) ( not ( = ?auto_10095 ?auto_10093 ) ) ( not ( = ?auto_10095 ?auto_10099 ) ) ( not ( = ?auto_10092 ?auto_10094 ) ) ( CALIBRATION_TARGET ?auto_10098 ?auto_10099 ) ( POINTING ?auto_10101 ?auto_10096 ) ( not ( = ?auto_10099 ?auto_10096 ) ) ( not ( = ?auto_10093 ?auto_10096 ) ) ( not ( = ?auto_10095 ?auto_10096 ) ) ( ON_BOARD ?auto_10100 ?auto_10101 ) ( POWER_ON ?auto_10100 ) ( not ( = ?auto_10098 ?auto_10100 ) ) ( HAVE_IMAGE ?auto_10096 ?auto_10097 ) ( not ( = ?auto_10094 ?auto_10097 ) ) ( not ( = ?auto_10092 ?auto_10097 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10095 ?auto_10092 ?auto_10093 ?auto_10094 )
      ( GET-3IMAGE-VERIFY ?auto_10093 ?auto_10094 ?auto_10095 ?auto_10092 ?auto_10096 ?auto_10097 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10114 - DIRECTION
      ?auto_10115 - MODE
      ?auto_10116 - DIRECTION
      ?auto_10113 - MODE
      ?auto_10117 - DIRECTION
      ?auto_10118 - MODE
    )
    :vars
    (
      ?auto_10119 - INSTRUMENT
      ?auto_10122 - SATELLITE
      ?auto_10120 - DIRECTION
      ?auto_10121 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10119 ?auto_10122 ) ( SUPPORTS ?auto_10119 ?auto_10115 ) ( not ( = ?auto_10114 ?auto_10120 ) ) ( HAVE_IMAGE ?auto_10117 ?auto_10118 ) ( not ( = ?auto_10117 ?auto_10114 ) ) ( not ( = ?auto_10117 ?auto_10120 ) ) ( not ( = ?auto_10118 ?auto_10115 ) ) ( CALIBRATION_TARGET ?auto_10119 ?auto_10120 ) ( POINTING ?auto_10122 ?auto_10116 ) ( not ( = ?auto_10120 ?auto_10116 ) ) ( not ( = ?auto_10114 ?auto_10116 ) ) ( not ( = ?auto_10117 ?auto_10116 ) ) ( ON_BOARD ?auto_10121 ?auto_10122 ) ( POWER_ON ?auto_10121 ) ( not ( = ?auto_10119 ?auto_10121 ) ) ( HAVE_IMAGE ?auto_10116 ?auto_10113 ) ( not ( = ?auto_10115 ?auto_10113 ) ) ( not ( = ?auto_10113 ?auto_10118 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10117 ?auto_10118 ?auto_10114 ?auto_10115 )
      ( GET-3IMAGE-VERIFY ?auto_10114 ?auto_10115 ?auto_10116 ?auto_10113 ?auto_10117 ?auto_10118 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10124 - DIRECTION
      ?auto_10125 - MODE
      ?auto_10126 - DIRECTION
      ?auto_10123 - MODE
      ?auto_10127 - DIRECTION
      ?auto_10128 - MODE
    )
    :vars
    (
      ?auto_10129 - INSTRUMENT
      ?auto_10134 - SATELLITE
      ?auto_10130 - DIRECTION
      ?auto_10131 - DIRECTION
      ?auto_10132 - MODE
      ?auto_10133 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10129 ?auto_10134 ) ( SUPPORTS ?auto_10129 ?auto_10125 ) ( not ( = ?auto_10124 ?auto_10130 ) ) ( HAVE_IMAGE ?auto_10131 ?auto_10132 ) ( not ( = ?auto_10131 ?auto_10124 ) ) ( not ( = ?auto_10131 ?auto_10130 ) ) ( not ( = ?auto_10132 ?auto_10125 ) ) ( CALIBRATION_TARGET ?auto_10129 ?auto_10130 ) ( POINTING ?auto_10134 ?auto_10127 ) ( not ( = ?auto_10130 ?auto_10127 ) ) ( not ( = ?auto_10124 ?auto_10127 ) ) ( not ( = ?auto_10131 ?auto_10127 ) ) ( ON_BOARD ?auto_10133 ?auto_10134 ) ( POWER_ON ?auto_10133 ) ( not ( = ?auto_10129 ?auto_10133 ) ) ( HAVE_IMAGE ?auto_10126 ?auto_10123 ) ( HAVE_IMAGE ?auto_10127 ?auto_10128 ) ( not ( = ?auto_10124 ?auto_10126 ) ) ( not ( = ?auto_10125 ?auto_10123 ) ) ( not ( = ?auto_10125 ?auto_10128 ) ) ( not ( = ?auto_10126 ?auto_10127 ) ) ( not ( = ?auto_10126 ?auto_10130 ) ) ( not ( = ?auto_10126 ?auto_10131 ) ) ( not ( = ?auto_10123 ?auto_10128 ) ) ( not ( = ?auto_10123 ?auto_10132 ) ) ( not ( = ?auto_10128 ?auto_10132 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10131 ?auto_10132 ?auto_10124 ?auto_10125 )
      ( GET-3IMAGE-VERIFY ?auto_10124 ?auto_10125 ?auto_10126 ?auto_10123 ?auto_10127 ?auto_10128 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10225 - DIRECTION
      ?auto_10226 - MODE
      ?auto_10227 - DIRECTION
      ?auto_10224 - MODE
      ?auto_10228 - DIRECTION
      ?auto_10229 - MODE
    )
    :vars
    (
      ?auto_10234 - INSTRUMENT
      ?auto_10230 - SATELLITE
      ?auto_10233 - DIRECTION
      ?auto_10232 - DIRECTION
      ?auto_10231 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10234 ?auto_10230 ) ( SUPPORTS ?auto_10234 ?auto_10229 ) ( not ( = ?auto_10228 ?auto_10233 ) ) ( HAVE_IMAGE ?auto_10225 ?auto_10224 ) ( not ( = ?auto_10225 ?auto_10228 ) ) ( not ( = ?auto_10225 ?auto_10233 ) ) ( not ( = ?auto_10224 ?auto_10229 ) ) ( CALIBRATION_TARGET ?auto_10234 ?auto_10233 ) ( POINTING ?auto_10230 ?auto_10232 ) ( not ( = ?auto_10233 ?auto_10232 ) ) ( not ( = ?auto_10228 ?auto_10232 ) ) ( not ( = ?auto_10225 ?auto_10232 ) ) ( ON_BOARD ?auto_10231 ?auto_10230 ) ( POWER_ON ?auto_10231 ) ( not ( = ?auto_10234 ?auto_10231 ) ) ( HAVE_IMAGE ?auto_10225 ?auto_10226 ) ( HAVE_IMAGE ?auto_10227 ?auto_10224 ) ( not ( = ?auto_10225 ?auto_10227 ) ) ( not ( = ?auto_10226 ?auto_10224 ) ) ( not ( = ?auto_10226 ?auto_10229 ) ) ( not ( = ?auto_10227 ?auto_10228 ) ) ( not ( = ?auto_10227 ?auto_10233 ) ) ( not ( = ?auto_10227 ?auto_10232 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10225 ?auto_10224 ?auto_10228 ?auto_10229 )
      ( GET-3IMAGE-VERIFY ?auto_10225 ?auto_10226 ?auto_10227 ?auto_10224 ?auto_10228 ?auto_10229 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10246 - DIRECTION
      ?auto_10247 - MODE
      ?auto_10248 - DIRECTION
      ?auto_10245 - MODE
      ?auto_10249 - DIRECTION
      ?auto_10250 - MODE
    )
    :vars
    (
      ?auto_10255 - INSTRUMENT
      ?auto_10251 - SATELLITE
      ?auto_10254 - DIRECTION
      ?auto_10253 - DIRECTION
      ?auto_10252 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10255 ?auto_10251 ) ( SUPPORTS ?auto_10255 ?auto_10245 ) ( not ( = ?auto_10248 ?auto_10254 ) ) ( HAVE_IMAGE ?auto_10246 ?auto_10247 ) ( not ( = ?auto_10246 ?auto_10248 ) ) ( not ( = ?auto_10246 ?auto_10254 ) ) ( not ( = ?auto_10247 ?auto_10245 ) ) ( CALIBRATION_TARGET ?auto_10255 ?auto_10254 ) ( POINTING ?auto_10251 ?auto_10253 ) ( not ( = ?auto_10254 ?auto_10253 ) ) ( not ( = ?auto_10248 ?auto_10253 ) ) ( not ( = ?auto_10246 ?auto_10253 ) ) ( ON_BOARD ?auto_10252 ?auto_10251 ) ( POWER_ON ?auto_10252 ) ( not ( = ?auto_10255 ?auto_10252 ) ) ( HAVE_IMAGE ?auto_10249 ?auto_10250 ) ( not ( = ?auto_10246 ?auto_10249 ) ) ( not ( = ?auto_10247 ?auto_10250 ) ) ( not ( = ?auto_10248 ?auto_10249 ) ) ( not ( = ?auto_10245 ?auto_10250 ) ) ( not ( = ?auto_10249 ?auto_10254 ) ) ( not ( = ?auto_10249 ?auto_10253 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10246 ?auto_10247 ?auto_10248 ?auto_10245 )
      ( GET-3IMAGE-VERIFY ?auto_10246 ?auto_10247 ?auto_10248 ?auto_10245 ?auto_10249 ?auto_10250 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10334 - DIRECTION
      ?auto_10335 - MODE
      ?auto_10336 - DIRECTION
      ?auto_10333 - MODE
      ?auto_10337 - DIRECTION
      ?auto_10338 - MODE
    )
    :vars
    (
      ?auto_10343 - INSTRUMENT
      ?auto_10339 - SATELLITE
      ?auto_10342 - DIRECTION
      ?auto_10341 - DIRECTION
      ?auto_10340 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10343 ?auto_10339 ) ( SUPPORTS ?auto_10343 ?auto_10335 ) ( not ( = ?auto_10334 ?auto_10342 ) ) ( HAVE_IMAGE ?auto_10336 ?auto_10333 ) ( not ( = ?auto_10336 ?auto_10334 ) ) ( not ( = ?auto_10336 ?auto_10342 ) ) ( not ( = ?auto_10333 ?auto_10335 ) ) ( CALIBRATION_TARGET ?auto_10343 ?auto_10342 ) ( POINTING ?auto_10339 ?auto_10341 ) ( not ( = ?auto_10342 ?auto_10341 ) ) ( not ( = ?auto_10334 ?auto_10341 ) ) ( not ( = ?auto_10336 ?auto_10341 ) ) ( ON_BOARD ?auto_10340 ?auto_10339 ) ( POWER_ON ?auto_10340 ) ( not ( = ?auto_10343 ?auto_10340 ) ) ( HAVE_IMAGE ?auto_10337 ?auto_10338 ) ( not ( = ?auto_10334 ?auto_10337 ) ) ( not ( = ?auto_10335 ?auto_10338 ) ) ( not ( = ?auto_10336 ?auto_10337 ) ) ( not ( = ?auto_10333 ?auto_10338 ) ) ( not ( = ?auto_10337 ?auto_10342 ) ) ( not ( = ?auto_10337 ?auto_10341 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10336 ?auto_10333 ?auto_10334 ?auto_10335 )
      ( GET-3IMAGE-VERIFY ?auto_10334 ?auto_10335 ?auto_10336 ?auto_10333 ?auto_10337 ?auto_10338 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_10435 - DIRECTION
      ?auto_10436 - MODE
    )
    :vars
    (
      ?auto_10442 - INSTRUMENT
      ?auto_10437 - SATELLITE
      ?auto_10441 - DIRECTION
      ?auto_10439 - DIRECTION
      ?auto_10443 - MODE
      ?auto_10440 - DIRECTION
      ?auto_10438 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10442 ?auto_10437 ) ( SUPPORTS ?auto_10442 ?auto_10436 ) ( not ( = ?auto_10435 ?auto_10441 ) ) ( HAVE_IMAGE ?auto_10439 ?auto_10443 ) ( not ( = ?auto_10439 ?auto_10435 ) ) ( not ( = ?auto_10439 ?auto_10441 ) ) ( not ( = ?auto_10443 ?auto_10436 ) ) ( CALIBRATION_TARGET ?auto_10442 ?auto_10441 ) ( not ( = ?auto_10441 ?auto_10440 ) ) ( not ( = ?auto_10435 ?auto_10440 ) ) ( not ( = ?auto_10439 ?auto_10440 ) ) ( ON_BOARD ?auto_10438 ?auto_10437 ) ( POWER_ON ?auto_10438 ) ( not ( = ?auto_10442 ?auto_10438 ) ) ( POINTING ?auto_10437 ?auto_10441 ) )
    :subtasks
    ( ( !TURN_TO ?auto_10437 ?auto_10440 ?auto_10441 )
      ( GET-2IMAGE ?auto_10439 ?auto_10443 ?auto_10435 ?auto_10436 )
      ( GET-1IMAGE-VERIFY ?auto_10435 ?auto_10436 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10445 - DIRECTION
      ?auto_10446 - MODE
      ?auto_10447 - DIRECTION
      ?auto_10444 - MODE
    )
    :vars
    (
      ?auto_10448 - INSTRUMENT
      ?auto_10449 - SATELLITE
      ?auto_10452 - DIRECTION
      ?auto_10451 - DIRECTION
      ?auto_10450 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10448 ?auto_10449 ) ( SUPPORTS ?auto_10448 ?auto_10444 ) ( not ( = ?auto_10447 ?auto_10452 ) ) ( HAVE_IMAGE ?auto_10445 ?auto_10446 ) ( not ( = ?auto_10445 ?auto_10447 ) ) ( not ( = ?auto_10445 ?auto_10452 ) ) ( not ( = ?auto_10446 ?auto_10444 ) ) ( CALIBRATION_TARGET ?auto_10448 ?auto_10452 ) ( not ( = ?auto_10452 ?auto_10451 ) ) ( not ( = ?auto_10447 ?auto_10451 ) ) ( not ( = ?auto_10445 ?auto_10451 ) ) ( ON_BOARD ?auto_10450 ?auto_10449 ) ( POWER_ON ?auto_10450 ) ( not ( = ?auto_10448 ?auto_10450 ) ) ( POINTING ?auto_10449 ?auto_10452 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_10447 ?auto_10444 )
      ( GET-2IMAGE-VERIFY ?auto_10445 ?auto_10446 ?auto_10447 ?auto_10444 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10464 - DIRECTION
      ?auto_10465 - MODE
      ?auto_10466 - DIRECTION
      ?auto_10463 - MODE
    )
    :vars
    (
      ?auto_10468 - INSTRUMENT
      ?auto_10467 - SATELLITE
      ?auto_10470 - DIRECTION
      ?auto_10469 - DIRECTION
      ?auto_10471 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10468 ?auto_10467 ) ( SUPPORTS ?auto_10468 ?auto_10465 ) ( not ( = ?auto_10464 ?auto_10470 ) ) ( HAVE_IMAGE ?auto_10466 ?auto_10463 ) ( not ( = ?auto_10466 ?auto_10464 ) ) ( not ( = ?auto_10466 ?auto_10470 ) ) ( not ( = ?auto_10463 ?auto_10465 ) ) ( CALIBRATION_TARGET ?auto_10468 ?auto_10470 ) ( not ( = ?auto_10470 ?auto_10469 ) ) ( not ( = ?auto_10464 ?auto_10469 ) ) ( not ( = ?auto_10466 ?auto_10469 ) ) ( ON_BOARD ?auto_10471 ?auto_10467 ) ( POWER_ON ?auto_10471 ) ( not ( = ?auto_10468 ?auto_10471 ) ) ( POINTING ?auto_10467 ?auto_10470 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10466 ?auto_10463 ?auto_10464 ?auto_10465 )
      ( GET-2IMAGE-VERIFY ?auto_10464 ?auto_10465 ?auto_10466 ?auto_10463 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10494 - DIRECTION
      ?auto_10495 - MODE
      ?auto_10496 - DIRECTION
      ?auto_10493 - MODE
      ?auto_10497 - DIRECTION
      ?auto_10498 - MODE
    )
    :vars
    (
      ?auto_10500 - INSTRUMENT
      ?auto_10499 - SATELLITE
      ?auto_10502 - DIRECTION
      ?auto_10501 - DIRECTION
      ?auto_10503 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10500 ?auto_10499 ) ( SUPPORTS ?auto_10500 ?auto_10498 ) ( not ( = ?auto_10497 ?auto_10502 ) ) ( HAVE_IMAGE ?auto_10496 ?auto_10495 ) ( not ( = ?auto_10496 ?auto_10497 ) ) ( not ( = ?auto_10496 ?auto_10502 ) ) ( not ( = ?auto_10495 ?auto_10498 ) ) ( CALIBRATION_TARGET ?auto_10500 ?auto_10502 ) ( not ( = ?auto_10502 ?auto_10501 ) ) ( not ( = ?auto_10497 ?auto_10501 ) ) ( not ( = ?auto_10496 ?auto_10501 ) ) ( ON_BOARD ?auto_10503 ?auto_10499 ) ( POWER_ON ?auto_10503 ) ( not ( = ?auto_10500 ?auto_10503 ) ) ( POINTING ?auto_10499 ?auto_10502 ) ( HAVE_IMAGE ?auto_10494 ?auto_10495 ) ( HAVE_IMAGE ?auto_10496 ?auto_10493 ) ( not ( = ?auto_10494 ?auto_10496 ) ) ( not ( = ?auto_10494 ?auto_10497 ) ) ( not ( = ?auto_10494 ?auto_10502 ) ) ( not ( = ?auto_10494 ?auto_10501 ) ) ( not ( = ?auto_10495 ?auto_10493 ) ) ( not ( = ?auto_10493 ?auto_10498 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10496 ?auto_10495 ?auto_10497 ?auto_10498 )
      ( GET-3IMAGE-VERIFY ?auto_10494 ?auto_10495 ?auto_10496 ?auto_10493 ?auto_10497 ?auto_10498 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10515 - DIRECTION
      ?auto_10516 - MODE
      ?auto_10517 - DIRECTION
      ?auto_10514 - MODE
      ?auto_10518 - DIRECTION
      ?auto_10519 - MODE
    )
    :vars
    (
      ?auto_10521 - INSTRUMENT
      ?auto_10520 - SATELLITE
      ?auto_10523 - DIRECTION
      ?auto_10522 - DIRECTION
      ?auto_10524 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10521 ?auto_10520 ) ( SUPPORTS ?auto_10521 ?auto_10514 ) ( not ( = ?auto_10517 ?auto_10523 ) ) ( HAVE_IMAGE ?auto_10515 ?auto_10516 ) ( not ( = ?auto_10515 ?auto_10517 ) ) ( not ( = ?auto_10515 ?auto_10523 ) ) ( not ( = ?auto_10516 ?auto_10514 ) ) ( CALIBRATION_TARGET ?auto_10521 ?auto_10523 ) ( not ( = ?auto_10523 ?auto_10522 ) ) ( not ( = ?auto_10517 ?auto_10522 ) ) ( not ( = ?auto_10515 ?auto_10522 ) ) ( ON_BOARD ?auto_10524 ?auto_10520 ) ( POWER_ON ?auto_10524 ) ( not ( = ?auto_10521 ?auto_10524 ) ) ( POINTING ?auto_10520 ?auto_10523 ) ( HAVE_IMAGE ?auto_10518 ?auto_10519 ) ( not ( = ?auto_10515 ?auto_10518 ) ) ( not ( = ?auto_10516 ?auto_10519 ) ) ( not ( = ?auto_10517 ?auto_10518 ) ) ( not ( = ?auto_10514 ?auto_10519 ) ) ( not ( = ?auto_10518 ?auto_10523 ) ) ( not ( = ?auto_10518 ?auto_10522 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10515 ?auto_10516 ?auto_10517 ?auto_10514 )
      ( GET-3IMAGE-VERIFY ?auto_10515 ?auto_10516 ?auto_10517 ?auto_10514 ?auto_10518 ?auto_10519 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10603 - DIRECTION
      ?auto_10604 - MODE
      ?auto_10605 - DIRECTION
      ?auto_10602 - MODE
      ?auto_10606 - DIRECTION
      ?auto_10607 - MODE
    )
    :vars
    (
      ?auto_10609 - INSTRUMENT
      ?auto_10608 - SATELLITE
      ?auto_10611 - DIRECTION
      ?auto_10610 - DIRECTION
      ?auto_10612 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10609 ?auto_10608 ) ( SUPPORTS ?auto_10609 ?auto_10604 ) ( not ( = ?auto_10603 ?auto_10611 ) ) ( HAVE_IMAGE ?auto_10606 ?auto_10607 ) ( not ( = ?auto_10606 ?auto_10603 ) ) ( not ( = ?auto_10606 ?auto_10611 ) ) ( not ( = ?auto_10607 ?auto_10604 ) ) ( CALIBRATION_TARGET ?auto_10609 ?auto_10611 ) ( not ( = ?auto_10611 ?auto_10610 ) ) ( not ( = ?auto_10603 ?auto_10610 ) ) ( not ( = ?auto_10606 ?auto_10610 ) ) ( ON_BOARD ?auto_10612 ?auto_10608 ) ( POWER_ON ?auto_10612 ) ( not ( = ?auto_10609 ?auto_10612 ) ) ( POINTING ?auto_10608 ?auto_10611 ) ( HAVE_IMAGE ?auto_10605 ?auto_10602 ) ( not ( = ?auto_10603 ?auto_10605 ) ) ( not ( = ?auto_10604 ?auto_10602 ) ) ( not ( = ?auto_10605 ?auto_10606 ) ) ( not ( = ?auto_10605 ?auto_10611 ) ) ( not ( = ?auto_10605 ?auto_10610 ) ) ( not ( = ?auto_10602 ?auto_10607 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10606 ?auto_10607 ?auto_10603 ?auto_10604 )
      ( GET-3IMAGE-VERIFY ?auto_10603 ?auto_10604 ?auto_10605 ?auto_10602 ?auto_10606 ?auto_10607 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11011 - DIRECTION
      ?auto_11012 - MODE
      ?auto_11013 - DIRECTION
      ?auto_11010 - MODE
      ?auto_11014 - DIRECTION
      ?auto_11015 - MODE
    )
    :vars
    (
      ?auto_11016 - INSTRUMENT
      ?auto_11018 - SATELLITE
      ?auto_11017 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_11016 ?auto_11018 ) ( SUPPORTS ?auto_11016 ?auto_11015 ) ( POINTING ?auto_11018 ?auto_11017 ) ( not ( = ?auto_11014 ?auto_11017 ) ) ( HAVE_IMAGE ?auto_11011 ?auto_11010 ) ( not ( = ?auto_11011 ?auto_11014 ) ) ( not ( = ?auto_11011 ?auto_11017 ) ) ( not ( = ?auto_11010 ?auto_11015 ) ) ( CALIBRATION_TARGET ?auto_11016 ?auto_11017 ) ( POWER_AVAIL ?auto_11018 ) ( HAVE_IMAGE ?auto_11011 ?auto_11012 ) ( HAVE_IMAGE ?auto_11013 ?auto_11010 ) ( not ( = ?auto_11011 ?auto_11013 ) ) ( not ( = ?auto_11012 ?auto_11010 ) ) ( not ( = ?auto_11012 ?auto_11015 ) ) ( not ( = ?auto_11013 ?auto_11014 ) ) ( not ( = ?auto_11013 ?auto_11017 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11011 ?auto_11010 ?auto_11014 ?auto_11015 )
      ( GET-3IMAGE-VERIFY ?auto_11011 ?auto_11012 ?auto_11013 ?auto_11010 ?auto_11014 ?auto_11015 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11233 - DIRECTION
      ?auto_11234 - MODE
      ?auto_11235 - DIRECTION
      ?auto_11232 - MODE
      ?auto_11236 - DIRECTION
      ?auto_11237 - MODE
    )
    :vars
    (
      ?auto_11240 - INSTRUMENT
      ?auto_11239 - SATELLITE
      ?auto_11238 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_11240 ?auto_11239 ) ( SUPPORTS ?auto_11240 ?auto_11237 ) ( not ( = ?auto_11236 ?auto_11238 ) ) ( HAVE_IMAGE ?auto_11233 ?auto_11232 ) ( not ( = ?auto_11233 ?auto_11236 ) ) ( not ( = ?auto_11233 ?auto_11238 ) ) ( not ( = ?auto_11232 ?auto_11237 ) ) ( CALIBRATION_TARGET ?auto_11240 ?auto_11238 ) ( POWER_AVAIL ?auto_11239 ) ( POINTING ?auto_11239 ?auto_11233 ) ( HAVE_IMAGE ?auto_11233 ?auto_11234 ) ( HAVE_IMAGE ?auto_11235 ?auto_11232 ) ( not ( = ?auto_11233 ?auto_11235 ) ) ( not ( = ?auto_11234 ?auto_11232 ) ) ( not ( = ?auto_11234 ?auto_11237 ) ) ( not ( = ?auto_11235 ?auto_11236 ) ) ( not ( = ?auto_11235 ?auto_11238 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11233 ?auto_11232 ?auto_11236 ?auto_11237 )
      ( GET-3IMAGE-VERIFY ?auto_11233 ?auto_11234 ?auto_11235 ?auto_11232 ?auto_11236 ?auto_11237 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11478 - DIRECTION
      ?auto_11479 - MODE
      ?auto_11480 - DIRECTION
      ?auto_11477 - MODE
      ?auto_11481 - DIRECTION
      ?auto_11482 - MODE
    )
    :vars
    (
      ?auto_11485 - INSTRUMENT
      ?auto_11484 - SATELLITE
      ?auto_11486 - DIRECTION
      ?auto_11483 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11485 ?auto_11484 ) ( SUPPORTS ?auto_11485 ?auto_11477 ) ( not ( = ?auto_11480 ?auto_11486 ) ) ( HAVE_IMAGE ?auto_11478 ?auto_11482 ) ( not ( = ?auto_11478 ?auto_11480 ) ) ( not ( = ?auto_11478 ?auto_11486 ) ) ( not ( = ?auto_11482 ?auto_11477 ) ) ( CALIBRATION_TARGET ?auto_11485 ?auto_11486 ) ( POINTING ?auto_11484 ?auto_11478 ) ( ON_BOARD ?auto_11483 ?auto_11484 ) ( POWER_ON ?auto_11483 ) ( not ( = ?auto_11485 ?auto_11483 ) ) ( HAVE_IMAGE ?auto_11478 ?auto_11479 ) ( HAVE_IMAGE ?auto_11481 ?auto_11482 ) ( not ( = ?auto_11478 ?auto_11481 ) ) ( not ( = ?auto_11479 ?auto_11477 ) ) ( not ( = ?auto_11479 ?auto_11482 ) ) ( not ( = ?auto_11480 ?auto_11481 ) ) ( not ( = ?auto_11481 ?auto_11486 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11478 ?auto_11482 ?auto_11480 ?auto_11477 )
      ( GET-3IMAGE-VERIFY ?auto_11478 ?auto_11479 ?auto_11480 ?auto_11477 ?auto_11481 ?auto_11482 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11564 - DIRECTION
      ?auto_11565 - MODE
      ?auto_11566 - DIRECTION
      ?auto_11563 - MODE
      ?auto_11567 - DIRECTION
      ?auto_11568 - MODE
    )
    :vars
    (
      ?auto_11571 - INSTRUMENT
      ?auto_11570 - SATELLITE
      ?auto_11572 - DIRECTION
      ?auto_11569 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11571 ?auto_11570 ) ( SUPPORTS ?auto_11571 ?auto_11565 ) ( not ( = ?auto_11564 ?auto_11572 ) ) ( HAVE_IMAGE ?auto_11566 ?auto_11568 ) ( not ( = ?auto_11566 ?auto_11564 ) ) ( not ( = ?auto_11566 ?auto_11572 ) ) ( not ( = ?auto_11568 ?auto_11565 ) ) ( CALIBRATION_TARGET ?auto_11571 ?auto_11572 ) ( POINTING ?auto_11570 ?auto_11566 ) ( ON_BOARD ?auto_11569 ?auto_11570 ) ( POWER_ON ?auto_11569 ) ( not ( = ?auto_11571 ?auto_11569 ) ) ( HAVE_IMAGE ?auto_11566 ?auto_11563 ) ( HAVE_IMAGE ?auto_11567 ?auto_11568 ) ( not ( = ?auto_11564 ?auto_11567 ) ) ( not ( = ?auto_11565 ?auto_11563 ) ) ( not ( = ?auto_11566 ?auto_11567 ) ) ( not ( = ?auto_11563 ?auto_11568 ) ) ( not ( = ?auto_11567 ?auto_11572 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11566 ?auto_11568 ?auto_11564 ?auto_11565 )
      ( GET-3IMAGE-VERIFY ?auto_11564 ?auto_11565 ?auto_11566 ?auto_11563 ?auto_11567 ?auto_11568 ) )
  )

)

