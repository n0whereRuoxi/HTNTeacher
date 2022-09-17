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

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_166714 - DIRECTION
      ?auto_166715 - MODE
    )
    :vars
    (
      ?auto_166716 - INSTRUMENT
      ?auto_166717 - SATELLITE
      ?auto_166718 - DIRECTION
      ?auto_166719 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_166716 ?auto_166717 ) ( SUPPORTS ?auto_166716 ?auto_166715 ) ( not ( = ?auto_166714 ?auto_166718 ) ) ( CALIBRATION_TARGET ?auto_166716 ?auto_166718 ) ( POWER_AVAIL ?auto_166717 ) ( POINTING ?auto_166717 ?auto_166719 ) ( not ( = ?auto_166718 ?auto_166719 ) ) ( not ( = ?auto_166714 ?auto_166719 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_166717 ?auto_166718 ?auto_166719 )
      ( !SWITCH_ON ?auto_166716 ?auto_166717 )
      ( !CALIBRATE ?auto_166717 ?auto_166716 ?auto_166718 )
      ( !TURN_TO ?auto_166717 ?auto_166714 ?auto_166718 )
      ( !TAKE_IMAGE ?auto_166717 ?auto_166714 ?auto_166716 ?auto_166715 )
      ( GET-1IMAGE-VERIFY ?auto_166714 ?auto_166715 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_166722 - DIRECTION
      ?auto_166723 - MODE
    )
    :vars
    (
      ?auto_166724 - INSTRUMENT
      ?auto_166725 - SATELLITE
      ?auto_166726 - DIRECTION
      ?auto_166727 - DIRECTION
      ?auto_166728 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_166724 ?auto_166725 ) ( SUPPORTS ?auto_166724 ?auto_166723 ) ( not ( = ?auto_166722 ?auto_166726 ) ) ( CALIBRATION_TARGET ?auto_166724 ?auto_166726 ) ( POINTING ?auto_166725 ?auto_166727 ) ( not ( = ?auto_166726 ?auto_166727 ) ) ( ON_BOARD ?auto_166728 ?auto_166725 ) ( POWER_ON ?auto_166728 ) ( not ( = ?auto_166722 ?auto_166727 ) ) ( not ( = ?auto_166724 ?auto_166728 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_166728 ?auto_166725 )
      ( !TURN_TO ?auto_166725 ?auto_166726 ?auto_166727 )
      ( !SWITCH_ON ?auto_166724 ?auto_166725 )
      ( !CALIBRATE ?auto_166725 ?auto_166724 ?auto_166726 )
      ( !TURN_TO ?auto_166725 ?auto_166722 ?auto_166726 )
      ( !TAKE_IMAGE ?auto_166725 ?auto_166722 ?auto_166724 ?auto_166723 )
      ( GET-1IMAGE-VERIFY ?auto_166722 ?auto_166723 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_166741 - DIRECTION
      ?auto_166742 - MODE
      ?auto_166744 - DIRECTION
      ?auto_166743 - MODE
    )
    :vars
    (
      ?auto_166746 - INSTRUMENT
      ?auto_166748 - SATELLITE
      ?auto_166747 - DIRECTION
      ?auto_166745 - INSTRUMENT
      ?auto_166749 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_166744 ?auto_166741 ) ) ( ON_BOARD ?auto_166746 ?auto_166748 ) ( SUPPORTS ?auto_166746 ?auto_166743 ) ( not ( = ?auto_166744 ?auto_166747 ) ) ( CALIBRATION_TARGET ?auto_166746 ?auto_166747 ) ( not ( = ?auto_166747 ?auto_166741 ) ) ( ON_BOARD ?auto_166745 ?auto_166748 ) ( not ( = ?auto_166746 ?auto_166745 ) ) ( SUPPORTS ?auto_166745 ?auto_166742 ) ( CALIBRATION_TARGET ?auto_166745 ?auto_166747 ) ( POWER_AVAIL ?auto_166748 ) ( POINTING ?auto_166748 ?auto_166749 ) ( not ( = ?auto_166747 ?auto_166749 ) ) ( not ( = ?auto_166741 ?auto_166749 ) ) ( not ( = ?auto_166742 ?auto_166743 ) ) ( not ( = ?auto_166744 ?auto_166749 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_166741 ?auto_166742 )
      ( GET-1IMAGE ?auto_166744 ?auto_166743 )
      ( GET-2IMAGE-VERIFY ?auto_166741 ?auto_166742 ?auto_166744 ?auto_166743 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_166750 - DIRECTION
      ?auto_166751 - MODE
      ?auto_166753 - DIRECTION
      ?auto_166752 - MODE
    )
    :vars
    (
      ?auto_166758 - INSTRUMENT
      ?auto_166754 - SATELLITE
      ?auto_166755 - DIRECTION
      ?auto_166757 - INSTRUMENT
      ?auto_166756 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_166753 ?auto_166750 ) ) ( ON_BOARD ?auto_166758 ?auto_166754 ) ( SUPPORTS ?auto_166758 ?auto_166751 ) ( not ( = ?auto_166750 ?auto_166755 ) ) ( CALIBRATION_TARGET ?auto_166758 ?auto_166755 ) ( not ( = ?auto_166755 ?auto_166753 ) ) ( ON_BOARD ?auto_166757 ?auto_166754 ) ( not ( = ?auto_166758 ?auto_166757 ) ) ( SUPPORTS ?auto_166757 ?auto_166752 ) ( CALIBRATION_TARGET ?auto_166757 ?auto_166755 ) ( POWER_AVAIL ?auto_166754 ) ( POINTING ?auto_166754 ?auto_166756 ) ( not ( = ?auto_166755 ?auto_166756 ) ) ( not ( = ?auto_166753 ?auto_166756 ) ) ( not ( = ?auto_166752 ?auto_166751 ) ) ( not ( = ?auto_166750 ?auto_166756 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_166753 ?auto_166752 ?auto_166750 ?auto_166751 )
      ( GET-2IMAGE-VERIFY ?auto_166750 ?auto_166751 ?auto_166753 ?auto_166752 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_166772 - DIRECTION
      ?auto_166773 - MODE
    )
    :vars
    (
      ?auto_166774 - INSTRUMENT
      ?auto_166775 - SATELLITE
      ?auto_166776 - DIRECTION
      ?auto_166777 - DIRECTION
      ?auto_166778 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_166774 ?auto_166775 ) ( SUPPORTS ?auto_166774 ?auto_166773 ) ( not ( = ?auto_166772 ?auto_166776 ) ) ( CALIBRATION_TARGET ?auto_166774 ?auto_166776 ) ( POINTING ?auto_166775 ?auto_166777 ) ( not ( = ?auto_166776 ?auto_166777 ) ) ( ON_BOARD ?auto_166778 ?auto_166775 ) ( POWER_ON ?auto_166778 ) ( not ( = ?auto_166772 ?auto_166777 ) ) ( not ( = ?auto_166774 ?auto_166778 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_166778 ?auto_166775 )
      ( !TURN_TO ?auto_166775 ?auto_166776 ?auto_166777 )
      ( !SWITCH_ON ?auto_166774 ?auto_166775 )
      ( !CALIBRATE ?auto_166775 ?auto_166774 ?auto_166776 )
      ( !TURN_TO ?auto_166775 ?auto_166772 ?auto_166776 )
      ( !TAKE_IMAGE ?auto_166775 ?auto_166772 ?auto_166774 ?auto_166773 )
      ( GET-1IMAGE-VERIFY ?auto_166772 ?auto_166773 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_166907 - DIRECTION
      ?auto_166908 - MODE
      ?auto_166910 - DIRECTION
      ?auto_166909 - MODE
      ?auto_166911 - DIRECTION
      ?auto_166912 - MODE
    )
    :vars
    (
      ?auto_166916 - INSTRUMENT
      ?auto_166913 - SATELLITE
      ?auto_166914 - DIRECTION
      ?auto_166915 - INSTRUMENT
      ?auto_166917 - INSTRUMENT
      ?auto_166918 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_166910 ?auto_166907 ) ) ( not ( = ?auto_166911 ?auto_166907 ) ) ( not ( = ?auto_166911 ?auto_166910 ) ) ( ON_BOARD ?auto_166916 ?auto_166913 ) ( SUPPORTS ?auto_166916 ?auto_166912 ) ( not ( = ?auto_166911 ?auto_166914 ) ) ( CALIBRATION_TARGET ?auto_166916 ?auto_166914 ) ( not ( = ?auto_166914 ?auto_166910 ) ) ( ON_BOARD ?auto_166915 ?auto_166913 ) ( not ( = ?auto_166916 ?auto_166915 ) ) ( SUPPORTS ?auto_166915 ?auto_166909 ) ( CALIBRATION_TARGET ?auto_166915 ?auto_166914 ) ( not ( = ?auto_166914 ?auto_166907 ) ) ( ON_BOARD ?auto_166917 ?auto_166913 ) ( not ( = ?auto_166915 ?auto_166917 ) ) ( SUPPORTS ?auto_166917 ?auto_166908 ) ( CALIBRATION_TARGET ?auto_166917 ?auto_166914 ) ( POWER_AVAIL ?auto_166913 ) ( POINTING ?auto_166913 ?auto_166918 ) ( not ( = ?auto_166914 ?auto_166918 ) ) ( not ( = ?auto_166907 ?auto_166918 ) ) ( not ( = ?auto_166908 ?auto_166909 ) ) ( not ( = ?auto_166910 ?auto_166918 ) ) ( not ( = ?auto_166908 ?auto_166912 ) ) ( not ( = ?auto_166909 ?auto_166912 ) ) ( not ( = ?auto_166911 ?auto_166918 ) ) ( not ( = ?auto_166916 ?auto_166917 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_166910 ?auto_166909 ?auto_166907 ?auto_166908 )
      ( GET-1IMAGE ?auto_166911 ?auto_166912 )
      ( GET-3IMAGE-VERIFY ?auto_166907 ?auto_166908 ?auto_166910 ?auto_166909 ?auto_166911 ?auto_166912 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_166933 - DIRECTION
      ?auto_166934 - MODE
      ?auto_166936 - DIRECTION
      ?auto_166935 - MODE
      ?auto_166937 - DIRECTION
      ?auto_166938 - MODE
    )
    :vars
    (
      ?auto_166940 - INSTRUMENT
      ?auto_166942 - SATELLITE
      ?auto_166941 - DIRECTION
      ?auto_166939 - INSTRUMENT
      ?auto_166943 - INSTRUMENT
      ?auto_166944 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_166936 ?auto_166933 ) ) ( not ( = ?auto_166937 ?auto_166933 ) ) ( not ( = ?auto_166937 ?auto_166936 ) ) ( ON_BOARD ?auto_166940 ?auto_166942 ) ( SUPPORTS ?auto_166940 ?auto_166935 ) ( not ( = ?auto_166936 ?auto_166941 ) ) ( CALIBRATION_TARGET ?auto_166940 ?auto_166941 ) ( not ( = ?auto_166941 ?auto_166937 ) ) ( ON_BOARD ?auto_166939 ?auto_166942 ) ( not ( = ?auto_166940 ?auto_166939 ) ) ( SUPPORTS ?auto_166939 ?auto_166938 ) ( CALIBRATION_TARGET ?auto_166939 ?auto_166941 ) ( not ( = ?auto_166941 ?auto_166933 ) ) ( ON_BOARD ?auto_166943 ?auto_166942 ) ( not ( = ?auto_166939 ?auto_166943 ) ) ( SUPPORTS ?auto_166943 ?auto_166934 ) ( CALIBRATION_TARGET ?auto_166943 ?auto_166941 ) ( POWER_AVAIL ?auto_166942 ) ( POINTING ?auto_166942 ?auto_166944 ) ( not ( = ?auto_166941 ?auto_166944 ) ) ( not ( = ?auto_166933 ?auto_166944 ) ) ( not ( = ?auto_166934 ?auto_166938 ) ) ( not ( = ?auto_166937 ?auto_166944 ) ) ( not ( = ?auto_166934 ?auto_166935 ) ) ( not ( = ?auto_166938 ?auto_166935 ) ) ( not ( = ?auto_166936 ?auto_166944 ) ) ( not ( = ?auto_166940 ?auto_166943 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_166933 ?auto_166934 ?auto_166937 ?auto_166938 ?auto_166936 ?auto_166935 )
      ( GET-3IMAGE-VERIFY ?auto_166933 ?auto_166934 ?auto_166936 ?auto_166935 ?auto_166937 ?auto_166938 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_166959 - DIRECTION
      ?auto_166960 - MODE
      ?auto_166962 - DIRECTION
      ?auto_166961 - MODE
      ?auto_166963 - DIRECTION
      ?auto_166964 - MODE
    )
    :vars
    (
      ?auto_166966 - INSTRUMENT
      ?auto_166969 - SATELLITE
      ?auto_166968 - DIRECTION
      ?auto_166967 - INSTRUMENT
      ?auto_166965 - INSTRUMENT
      ?auto_166970 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_166962 ?auto_166959 ) ) ( not ( = ?auto_166963 ?auto_166959 ) ) ( not ( = ?auto_166963 ?auto_166962 ) ) ( ON_BOARD ?auto_166966 ?auto_166969 ) ( SUPPORTS ?auto_166966 ?auto_166964 ) ( not ( = ?auto_166963 ?auto_166968 ) ) ( CALIBRATION_TARGET ?auto_166966 ?auto_166968 ) ( not ( = ?auto_166968 ?auto_166959 ) ) ( ON_BOARD ?auto_166967 ?auto_166969 ) ( not ( = ?auto_166966 ?auto_166967 ) ) ( SUPPORTS ?auto_166967 ?auto_166960 ) ( CALIBRATION_TARGET ?auto_166967 ?auto_166968 ) ( not ( = ?auto_166968 ?auto_166962 ) ) ( ON_BOARD ?auto_166965 ?auto_166969 ) ( not ( = ?auto_166967 ?auto_166965 ) ) ( SUPPORTS ?auto_166965 ?auto_166961 ) ( CALIBRATION_TARGET ?auto_166965 ?auto_166968 ) ( POWER_AVAIL ?auto_166969 ) ( POINTING ?auto_166969 ?auto_166970 ) ( not ( = ?auto_166968 ?auto_166970 ) ) ( not ( = ?auto_166962 ?auto_166970 ) ) ( not ( = ?auto_166961 ?auto_166960 ) ) ( not ( = ?auto_166959 ?auto_166970 ) ) ( not ( = ?auto_166961 ?auto_166964 ) ) ( not ( = ?auto_166960 ?auto_166964 ) ) ( not ( = ?auto_166963 ?auto_166970 ) ) ( not ( = ?auto_166966 ?auto_166965 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_166962 ?auto_166961 ?auto_166963 ?auto_166964 ?auto_166959 ?auto_166960 )
      ( GET-3IMAGE-VERIFY ?auto_166959 ?auto_166960 ?auto_166962 ?auto_166961 ?auto_166963 ?auto_166964 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_166985 - DIRECTION
      ?auto_166986 - MODE
      ?auto_166988 - DIRECTION
      ?auto_166987 - MODE
      ?auto_166989 - DIRECTION
      ?auto_166990 - MODE
    )
    :vars
    (
      ?auto_166992 - INSTRUMENT
      ?auto_166995 - SATELLITE
      ?auto_166994 - DIRECTION
      ?auto_166993 - INSTRUMENT
      ?auto_166991 - INSTRUMENT
      ?auto_166996 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_166988 ?auto_166985 ) ) ( not ( = ?auto_166989 ?auto_166985 ) ) ( not ( = ?auto_166989 ?auto_166988 ) ) ( ON_BOARD ?auto_166992 ?auto_166995 ) ( SUPPORTS ?auto_166992 ?auto_166987 ) ( not ( = ?auto_166988 ?auto_166994 ) ) ( CALIBRATION_TARGET ?auto_166992 ?auto_166994 ) ( not ( = ?auto_166994 ?auto_166985 ) ) ( ON_BOARD ?auto_166993 ?auto_166995 ) ( not ( = ?auto_166992 ?auto_166993 ) ) ( SUPPORTS ?auto_166993 ?auto_166986 ) ( CALIBRATION_TARGET ?auto_166993 ?auto_166994 ) ( not ( = ?auto_166994 ?auto_166989 ) ) ( ON_BOARD ?auto_166991 ?auto_166995 ) ( not ( = ?auto_166993 ?auto_166991 ) ) ( SUPPORTS ?auto_166991 ?auto_166990 ) ( CALIBRATION_TARGET ?auto_166991 ?auto_166994 ) ( POWER_AVAIL ?auto_166995 ) ( POINTING ?auto_166995 ?auto_166996 ) ( not ( = ?auto_166994 ?auto_166996 ) ) ( not ( = ?auto_166989 ?auto_166996 ) ) ( not ( = ?auto_166990 ?auto_166986 ) ) ( not ( = ?auto_166985 ?auto_166996 ) ) ( not ( = ?auto_166990 ?auto_166987 ) ) ( not ( = ?auto_166986 ?auto_166987 ) ) ( not ( = ?auto_166988 ?auto_166996 ) ) ( not ( = ?auto_166992 ?auto_166991 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_166989 ?auto_166990 ?auto_166988 ?auto_166987 ?auto_166985 ?auto_166986 )
      ( GET-3IMAGE-VERIFY ?auto_166985 ?auto_166986 ?auto_166988 ?auto_166987 ?auto_166989 ?auto_166990 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_167039 - DIRECTION
      ?auto_167040 - MODE
      ?auto_167042 - DIRECTION
      ?auto_167041 - MODE
      ?auto_167043 - DIRECTION
      ?auto_167044 - MODE
    )
    :vars
    (
      ?auto_167046 - INSTRUMENT
      ?auto_167049 - SATELLITE
      ?auto_167048 - DIRECTION
      ?auto_167047 - INSTRUMENT
      ?auto_167045 - INSTRUMENT
      ?auto_167050 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_167042 ?auto_167039 ) ) ( not ( = ?auto_167043 ?auto_167039 ) ) ( not ( = ?auto_167043 ?auto_167042 ) ) ( ON_BOARD ?auto_167046 ?auto_167049 ) ( SUPPORTS ?auto_167046 ?auto_167040 ) ( not ( = ?auto_167039 ?auto_167048 ) ) ( CALIBRATION_TARGET ?auto_167046 ?auto_167048 ) ( not ( = ?auto_167048 ?auto_167043 ) ) ( ON_BOARD ?auto_167047 ?auto_167049 ) ( not ( = ?auto_167046 ?auto_167047 ) ) ( SUPPORTS ?auto_167047 ?auto_167044 ) ( CALIBRATION_TARGET ?auto_167047 ?auto_167048 ) ( not ( = ?auto_167048 ?auto_167042 ) ) ( ON_BOARD ?auto_167045 ?auto_167049 ) ( not ( = ?auto_167047 ?auto_167045 ) ) ( SUPPORTS ?auto_167045 ?auto_167041 ) ( CALIBRATION_TARGET ?auto_167045 ?auto_167048 ) ( POWER_AVAIL ?auto_167049 ) ( POINTING ?auto_167049 ?auto_167050 ) ( not ( = ?auto_167048 ?auto_167050 ) ) ( not ( = ?auto_167042 ?auto_167050 ) ) ( not ( = ?auto_167041 ?auto_167044 ) ) ( not ( = ?auto_167043 ?auto_167050 ) ) ( not ( = ?auto_167041 ?auto_167040 ) ) ( not ( = ?auto_167044 ?auto_167040 ) ) ( not ( = ?auto_167039 ?auto_167050 ) ) ( not ( = ?auto_167046 ?auto_167045 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_167042 ?auto_167041 ?auto_167039 ?auto_167040 ?auto_167043 ?auto_167044 )
      ( GET-3IMAGE-VERIFY ?auto_167039 ?auto_167040 ?auto_167042 ?auto_167041 ?auto_167043 ?auto_167044 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_167065 - DIRECTION
      ?auto_167066 - MODE
      ?auto_167068 - DIRECTION
      ?auto_167067 - MODE
      ?auto_167069 - DIRECTION
      ?auto_167070 - MODE
    )
    :vars
    (
      ?auto_167072 - INSTRUMENT
      ?auto_167075 - SATELLITE
      ?auto_167074 - DIRECTION
      ?auto_167073 - INSTRUMENT
      ?auto_167071 - INSTRUMENT
      ?auto_167076 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_167068 ?auto_167065 ) ) ( not ( = ?auto_167069 ?auto_167065 ) ) ( not ( = ?auto_167069 ?auto_167068 ) ) ( ON_BOARD ?auto_167072 ?auto_167075 ) ( SUPPORTS ?auto_167072 ?auto_167066 ) ( not ( = ?auto_167065 ?auto_167074 ) ) ( CALIBRATION_TARGET ?auto_167072 ?auto_167074 ) ( not ( = ?auto_167074 ?auto_167068 ) ) ( ON_BOARD ?auto_167073 ?auto_167075 ) ( not ( = ?auto_167072 ?auto_167073 ) ) ( SUPPORTS ?auto_167073 ?auto_167067 ) ( CALIBRATION_TARGET ?auto_167073 ?auto_167074 ) ( not ( = ?auto_167074 ?auto_167069 ) ) ( ON_BOARD ?auto_167071 ?auto_167075 ) ( not ( = ?auto_167073 ?auto_167071 ) ) ( SUPPORTS ?auto_167071 ?auto_167070 ) ( CALIBRATION_TARGET ?auto_167071 ?auto_167074 ) ( POWER_AVAIL ?auto_167075 ) ( POINTING ?auto_167075 ?auto_167076 ) ( not ( = ?auto_167074 ?auto_167076 ) ) ( not ( = ?auto_167069 ?auto_167076 ) ) ( not ( = ?auto_167070 ?auto_167067 ) ) ( not ( = ?auto_167068 ?auto_167076 ) ) ( not ( = ?auto_167070 ?auto_167066 ) ) ( not ( = ?auto_167067 ?auto_167066 ) ) ( not ( = ?auto_167065 ?auto_167076 ) ) ( not ( = ?auto_167072 ?auto_167071 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_167069 ?auto_167070 ?auto_167065 ?auto_167066 ?auto_167068 ?auto_167067 )
      ( GET-3IMAGE-VERIFY ?auto_167065 ?auto_167066 ?auto_167068 ?auto_167067 ?auto_167069 ?auto_167070 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_167151 - DIRECTION
      ?auto_167152 - MODE
    )
    :vars
    (
      ?auto_167153 - INSTRUMENT
      ?auto_167154 - SATELLITE
      ?auto_167155 - DIRECTION
      ?auto_167156 - DIRECTION
      ?auto_167157 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_167153 ?auto_167154 ) ( SUPPORTS ?auto_167153 ?auto_167152 ) ( not ( = ?auto_167151 ?auto_167155 ) ) ( CALIBRATION_TARGET ?auto_167153 ?auto_167155 ) ( POINTING ?auto_167154 ?auto_167156 ) ( not ( = ?auto_167155 ?auto_167156 ) ) ( ON_BOARD ?auto_167157 ?auto_167154 ) ( POWER_ON ?auto_167157 ) ( not ( = ?auto_167151 ?auto_167156 ) ) ( not ( = ?auto_167153 ?auto_167157 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_167157 ?auto_167154 )
      ( !TURN_TO ?auto_167154 ?auto_167155 ?auto_167156 )
      ( !SWITCH_ON ?auto_167153 ?auto_167154 )
      ( !CALIBRATE ?auto_167154 ?auto_167153 ?auto_167155 )
      ( !TURN_TO ?auto_167154 ?auto_167151 ?auto_167155 )
      ( !TAKE_IMAGE ?auto_167154 ?auto_167151 ?auto_167153 ?auto_167152 )
      ( GET-1IMAGE-VERIFY ?auto_167151 ?auto_167152 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_168717 - DIRECTION
      ?auto_168718 - MODE
      ?auto_168720 - DIRECTION
      ?auto_168719 - MODE
      ?auto_168721 - DIRECTION
      ?auto_168722 - MODE
      ?auto_168723 - DIRECTION
      ?auto_168724 - MODE
    )
    :vars
    (
      ?auto_168725 - INSTRUMENT
      ?auto_168727 - SATELLITE
      ?auto_168726 - DIRECTION
      ?auto_168728 - INSTRUMENT
      ?auto_168730 - INSTRUMENT
      ?auto_168729 - INSTRUMENT
      ?auto_168731 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_168720 ?auto_168717 ) ) ( not ( = ?auto_168721 ?auto_168717 ) ) ( not ( = ?auto_168721 ?auto_168720 ) ) ( not ( = ?auto_168723 ?auto_168717 ) ) ( not ( = ?auto_168723 ?auto_168720 ) ) ( not ( = ?auto_168723 ?auto_168721 ) ) ( ON_BOARD ?auto_168725 ?auto_168727 ) ( SUPPORTS ?auto_168725 ?auto_168724 ) ( not ( = ?auto_168723 ?auto_168726 ) ) ( CALIBRATION_TARGET ?auto_168725 ?auto_168726 ) ( not ( = ?auto_168726 ?auto_168721 ) ) ( ON_BOARD ?auto_168728 ?auto_168727 ) ( not ( = ?auto_168725 ?auto_168728 ) ) ( SUPPORTS ?auto_168728 ?auto_168722 ) ( CALIBRATION_TARGET ?auto_168728 ?auto_168726 ) ( not ( = ?auto_168726 ?auto_168720 ) ) ( ON_BOARD ?auto_168730 ?auto_168727 ) ( not ( = ?auto_168728 ?auto_168730 ) ) ( SUPPORTS ?auto_168730 ?auto_168719 ) ( CALIBRATION_TARGET ?auto_168730 ?auto_168726 ) ( not ( = ?auto_168726 ?auto_168717 ) ) ( ON_BOARD ?auto_168729 ?auto_168727 ) ( not ( = ?auto_168730 ?auto_168729 ) ) ( SUPPORTS ?auto_168729 ?auto_168718 ) ( CALIBRATION_TARGET ?auto_168729 ?auto_168726 ) ( POWER_AVAIL ?auto_168727 ) ( POINTING ?auto_168727 ?auto_168731 ) ( not ( = ?auto_168726 ?auto_168731 ) ) ( not ( = ?auto_168717 ?auto_168731 ) ) ( not ( = ?auto_168718 ?auto_168719 ) ) ( not ( = ?auto_168720 ?auto_168731 ) ) ( not ( = ?auto_168718 ?auto_168722 ) ) ( not ( = ?auto_168719 ?auto_168722 ) ) ( not ( = ?auto_168721 ?auto_168731 ) ) ( not ( = ?auto_168728 ?auto_168729 ) ) ( not ( = ?auto_168718 ?auto_168724 ) ) ( not ( = ?auto_168719 ?auto_168724 ) ) ( not ( = ?auto_168722 ?auto_168724 ) ) ( not ( = ?auto_168723 ?auto_168731 ) ) ( not ( = ?auto_168725 ?auto_168730 ) ) ( not ( = ?auto_168725 ?auto_168729 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_168717 ?auto_168718 ?auto_168721 ?auto_168722 ?auto_168720 ?auto_168719 )
      ( GET-1IMAGE ?auto_168723 ?auto_168724 )
      ( GET-4IMAGE-VERIFY ?auto_168717 ?auto_168718 ?auto_168720 ?auto_168719 ?auto_168721 ?auto_168722 ?auto_168723 ?auto_168724 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_168766 - DIRECTION
      ?auto_168767 - MODE
      ?auto_168769 - DIRECTION
      ?auto_168768 - MODE
      ?auto_168770 - DIRECTION
      ?auto_168771 - MODE
      ?auto_168772 - DIRECTION
      ?auto_168773 - MODE
    )
    :vars
    (
      ?auto_168774 - INSTRUMENT
      ?auto_168777 - SATELLITE
      ?auto_168779 - DIRECTION
      ?auto_168775 - INSTRUMENT
      ?auto_168778 - INSTRUMENT
      ?auto_168776 - INSTRUMENT
      ?auto_168780 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_168769 ?auto_168766 ) ) ( not ( = ?auto_168770 ?auto_168766 ) ) ( not ( = ?auto_168770 ?auto_168769 ) ) ( not ( = ?auto_168772 ?auto_168766 ) ) ( not ( = ?auto_168772 ?auto_168769 ) ) ( not ( = ?auto_168772 ?auto_168770 ) ) ( ON_BOARD ?auto_168774 ?auto_168777 ) ( SUPPORTS ?auto_168774 ?auto_168771 ) ( not ( = ?auto_168770 ?auto_168779 ) ) ( CALIBRATION_TARGET ?auto_168774 ?auto_168779 ) ( not ( = ?auto_168779 ?auto_168772 ) ) ( ON_BOARD ?auto_168775 ?auto_168777 ) ( not ( = ?auto_168774 ?auto_168775 ) ) ( SUPPORTS ?auto_168775 ?auto_168773 ) ( CALIBRATION_TARGET ?auto_168775 ?auto_168779 ) ( not ( = ?auto_168779 ?auto_168769 ) ) ( ON_BOARD ?auto_168778 ?auto_168777 ) ( not ( = ?auto_168775 ?auto_168778 ) ) ( SUPPORTS ?auto_168778 ?auto_168768 ) ( CALIBRATION_TARGET ?auto_168778 ?auto_168779 ) ( not ( = ?auto_168779 ?auto_168766 ) ) ( ON_BOARD ?auto_168776 ?auto_168777 ) ( not ( = ?auto_168778 ?auto_168776 ) ) ( SUPPORTS ?auto_168776 ?auto_168767 ) ( CALIBRATION_TARGET ?auto_168776 ?auto_168779 ) ( POWER_AVAIL ?auto_168777 ) ( POINTING ?auto_168777 ?auto_168780 ) ( not ( = ?auto_168779 ?auto_168780 ) ) ( not ( = ?auto_168766 ?auto_168780 ) ) ( not ( = ?auto_168767 ?auto_168768 ) ) ( not ( = ?auto_168769 ?auto_168780 ) ) ( not ( = ?auto_168767 ?auto_168773 ) ) ( not ( = ?auto_168768 ?auto_168773 ) ) ( not ( = ?auto_168772 ?auto_168780 ) ) ( not ( = ?auto_168775 ?auto_168776 ) ) ( not ( = ?auto_168767 ?auto_168771 ) ) ( not ( = ?auto_168768 ?auto_168771 ) ) ( not ( = ?auto_168773 ?auto_168771 ) ) ( not ( = ?auto_168770 ?auto_168780 ) ) ( not ( = ?auto_168774 ?auto_168778 ) ) ( not ( = ?auto_168774 ?auto_168776 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_168766 ?auto_168767 ?auto_168769 ?auto_168768 ?auto_168772 ?auto_168773 ?auto_168770 ?auto_168771 )
      ( GET-4IMAGE-VERIFY ?auto_168766 ?auto_168767 ?auto_168769 ?auto_168768 ?auto_168770 ?auto_168771 ?auto_168772 ?auto_168773 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_168815 - DIRECTION
      ?auto_168816 - MODE
      ?auto_168818 - DIRECTION
      ?auto_168817 - MODE
      ?auto_168819 - DIRECTION
      ?auto_168820 - MODE
      ?auto_168821 - DIRECTION
      ?auto_168822 - MODE
    )
    :vars
    (
      ?auto_168824 - INSTRUMENT
      ?auto_168825 - SATELLITE
      ?auto_168826 - DIRECTION
      ?auto_168827 - INSTRUMENT
      ?auto_168828 - INSTRUMENT
      ?auto_168829 - INSTRUMENT
      ?auto_168823 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_168818 ?auto_168815 ) ) ( not ( = ?auto_168819 ?auto_168815 ) ) ( not ( = ?auto_168819 ?auto_168818 ) ) ( not ( = ?auto_168821 ?auto_168815 ) ) ( not ( = ?auto_168821 ?auto_168818 ) ) ( not ( = ?auto_168821 ?auto_168819 ) ) ( ON_BOARD ?auto_168824 ?auto_168825 ) ( SUPPORTS ?auto_168824 ?auto_168822 ) ( not ( = ?auto_168821 ?auto_168826 ) ) ( CALIBRATION_TARGET ?auto_168824 ?auto_168826 ) ( not ( = ?auto_168826 ?auto_168818 ) ) ( ON_BOARD ?auto_168827 ?auto_168825 ) ( not ( = ?auto_168824 ?auto_168827 ) ) ( SUPPORTS ?auto_168827 ?auto_168817 ) ( CALIBRATION_TARGET ?auto_168827 ?auto_168826 ) ( not ( = ?auto_168826 ?auto_168819 ) ) ( ON_BOARD ?auto_168828 ?auto_168825 ) ( not ( = ?auto_168827 ?auto_168828 ) ) ( SUPPORTS ?auto_168828 ?auto_168820 ) ( CALIBRATION_TARGET ?auto_168828 ?auto_168826 ) ( not ( = ?auto_168826 ?auto_168815 ) ) ( ON_BOARD ?auto_168829 ?auto_168825 ) ( not ( = ?auto_168828 ?auto_168829 ) ) ( SUPPORTS ?auto_168829 ?auto_168816 ) ( CALIBRATION_TARGET ?auto_168829 ?auto_168826 ) ( POWER_AVAIL ?auto_168825 ) ( POINTING ?auto_168825 ?auto_168823 ) ( not ( = ?auto_168826 ?auto_168823 ) ) ( not ( = ?auto_168815 ?auto_168823 ) ) ( not ( = ?auto_168816 ?auto_168820 ) ) ( not ( = ?auto_168819 ?auto_168823 ) ) ( not ( = ?auto_168816 ?auto_168817 ) ) ( not ( = ?auto_168820 ?auto_168817 ) ) ( not ( = ?auto_168818 ?auto_168823 ) ) ( not ( = ?auto_168827 ?auto_168829 ) ) ( not ( = ?auto_168816 ?auto_168822 ) ) ( not ( = ?auto_168820 ?auto_168822 ) ) ( not ( = ?auto_168817 ?auto_168822 ) ) ( not ( = ?auto_168821 ?auto_168823 ) ) ( not ( = ?auto_168824 ?auto_168828 ) ) ( not ( = ?auto_168824 ?auto_168829 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_168815 ?auto_168816 ?auto_168819 ?auto_168820 ?auto_168821 ?auto_168822 ?auto_168818 ?auto_168817 )
      ( GET-4IMAGE-VERIFY ?auto_168815 ?auto_168816 ?auto_168818 ?auto_168817 ?auto_168819 ?auto_168820 ?auto_168821 ?auto_168822 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_168864 - DIRECTION
      ?auto_168865 - MODE
      ?auto_168867 - DIRECTION
      ?auto_168866 - MODE
      ?auto_168868 - DIRECTION
      ?auto_168869 - MODE
      ?auto_168870 - DIRECTION
      ?auto_168871 - MODE
    )
    :vars
    (
      ?auto_168873 - INSTRUMENT
      ?auto_168874 - SATELLITE
      ?auto_168875 - DIRECTION
      ?auto_168876 - INSTRUMENT
      ?auto_168877 - INSTRUMENT
      ?auto_168878 - INSTRUMENT
      ?auto_168872 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_168867 ?auto_168864 ) ) ( not ( = ?auto_168868 ?auto_168864 ) ) ( not ( = ?auto_168868 ?auto_168867 ) ) ( not ( = ?auto_168870 ?auto_168864 ) ) ( not ( = ?auto_168870 ?auto_168867 ) ) ( not ( = ?auto_168870 ?auto_168868 ) ) ( ON_BOARD ?auto_168873 ?auto_168874 ) ( SUPPORTS ?auto_168873 ?auto_168869 ) ( not ( = ?auto_168868 ?auto_168875 ) ) ( CALIBRATION_TARGET ?auto_168873 ?auto_168875 ) ( not ( = ?auto_168875 ?auto_168867 ) ) ( ON_BOARD ?auto_168876 ?auto_168874 ) ( not ( = ?auto_168873 ?auto_168876 ) ) ( SUPPORTS ?auto_168876 ?auto_168866 ) ( CALIBRATION_TARGET ?auto_168876 ?auto_168875 ) ( not ( = ?auto_168875 ?auto_168870 ) ) ( ON_BOARD ?auto_168877 ?auto_168874 ) ( not ( = ?auto_168876 ?auto_168877 ) ) ( SUPPORTS ?auto_168877 ?auto_168871 ) ( CALIBRATION_TARGET ?auto_168877 ?auto_168875 ) ( not ( = ?auto_168875 ?auto_168864 ) ) ( ON_BOARD ?auto_168878 ?auto_168874 ) ( not ( = ?auto_168877 ?auto_168878 ) ) ( SUPPORTS ?auto_168878 ?auto_168865 ) ( CALIBRATION_TARGET ?auto_168878 ?auto_168875 ) ( POWER_AVAIL ?auto_168874 ) ( POINTING ?auto_168874 ?auto_168872 ) ( not ( = ?auto_168875 ?auto_168872 ) ) ( not ( = ?auto_168864 ?auto_168872 ) ) ( not ( = ?auto_168865 ?auto_168871 ) ) ( not ( = ?auto_168870 ?auto_168872 ) ) ( not ( = ?auto_168865 ?auto_168866 ) ) ( not ( = ?auto_168871 ?auto_168866 ) ) ( not ( = ?auto_168867 ?auto_168872 ) ) ( not ( = ?auto_168876 ?auto_168878 ) ) ( not ( = ?auto_168865 ?auto_168869 ) ) ( not ( = ?auto_168871 ?auto_168869 ) ) ( not ( = ?auto_168866 ?auto_168869 ) ) ( not ( = ?auto_168868 ?auto_168872 ) ) ( not ( = ?auto_168873 ?auto_168877 ) ) ( not ( = ?auto_168873 ?auto_168878 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_168864 ?auto_168865 ?auto_168870 ?auto_168871 ?auto_168868 ?auto_168869 ?auto_168867 ?auto_168866 )
      ( GET-4IMAGE-VERIFY ?auto_168864 ?auto_168865 ?auto_168867 ?auto_168866 ?auto_168868 ?auto_168869 ?auto_168870 ?auto_168871 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_169019 - DIRECTION
      ?auto_169020 - MODE
      ?auto_169022 - DIRECTION
      ?auto_169021 - MODE
      ?auto_169023 - DIRECTION
      ?auto_169024 - MODE
      ?auto_169025 - DIRECTION
      ?auto_169026 - MODE
    )
    :vars
    (
      ?auto_169028 - INSTRUMENT
      ?auto_169029 - SATELLITE
      ?auto_169030 - DIRECTION
      ?auto_169031 - INSTRUMENT
      ?auto_169032 - INSTRUMENT
      ?auto_169033 - INSTRUMENT
      ?auto_169027 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_169022 ?auto_169019 ) ) ( not ( = ?auto_169023 ?auto_169019 ) ) ( not ( = ?auto_169023 ?auto_169022 ) ) ( not ( = ?auto_169025 ?auto_169019 ) ) ( not ( = ?auto_169025 ?auto_169022 ) ) ( not ( = ?auto_169025 ?auto_169023 ) ) ( ON_BOARD ?auto_169028 ?auto_169029 ) ( SUPPORTS ?auto_169028 ?auto_169021 ) ( not ( = ?auto_169022 ?auto_169030 ) ) ( CALIBRATION_TARGET ?auto_169028 ?auto_169030 ) ( not ( = ?auto_169030 ?auto_169025 ) ) ( ON_BOARD ?auto_169031 ?auto_169029 ) ( not ( = ?auto_169028 ?auto_169031 ) ) ( SUPPORTS ?auto_169031 ?auto_169026 ) ( CALIBRATION_TARGET ?auto_169031 ?auto_169030 ) ( not ( = ?auto_169030 ?auto_169023 ) ) ( ON_BOARD ?auto_169032 ?auto_169029 ) ( not ( = ?auto_169031 ?auto_169032 ) ) ( SUPPORTS ?auto_169032 ?auto_169024 ) ( CALIBRATION_TARGET ?auto_169032 ?auto_169030 ) ( not ( = ?auto_169030 ?auto_169019 ) ) ( ON_BOARD ?auto_169033 ?auto_169029 ) ( not ( = ?auto_169032 ?auto_169033 ) ) ( SUPPORTS ?auto_169033 ?auto_169020 ) ( CALIBRATION_TARGET ?auto_169033 ?auto_169030 ) ( POWER_AVAIL ?auto_169029 ) ( POINTING ?auto_169029 ?auto_169027 ) ( not ( = ?auto_169030 ?auto_169027 ) ) ( not ( = ?auto_169019 ?auto_169027 ) ) ( not ( = ?auto_169020 ?auto_169024 ) ) ( not ( = ?auto_169023 ?auto_169027 ) ) ( not ( = ?auto_169020 ?auto_169026 ) ) ( not ( = ?auto_169024 ?auto_169026 ) ) ( not ( = ?auto_169025 ?auto_169027 ) ) ( not ( = ?auto_169031 ?auto_169033 ) ) ( not ( = ?auto_169020 ?auto_169021 ) ) ( not ( = ?auto_169024 ?auto_169021 ) ) ( not ( = ?auto_169026 ?auto_169021 ) ) ( not ( = ?auto_169022 ?auto_169027 ) ) ( not ( = ?auto_169028 ?auto_169032 ) ) ( not ( = ?auto_169028 ?auto_169033 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_169019 ?auto_169020 ?auto_169023 ?auto_169024 ?auto_169022 ?auto_169021 ?auto_169025 ?auto_169026 )
      ( GET-4IMAGE-VERIFY ?auto_169019 ?auto_169020 ?auto_169022 ?auto_169021 ?auto_169023 ?auto_169024 ?auto_169025 ?auto_169026 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_169068 - DIRECTION
      ?auto_169069 - MODE
      ?auto_169071 - DIRECTION
      ?auto_169070 - MODE
      ?auto_169072 - DIRECTION
      ?auto_169073 - MODE
      ?auto_169074 - DIRECTION
      ?auto_169075 - MODE
    )
    :vars
    (
      ?auto_169077 - INSTRUMENT
      ?auto_169078 - SATELLITE
      ?auto_169079 - DIRECTION
      ?auto_169080 - INSTRUMENT
      ?auto_169081 - INSTRUMENT
      ?auto_169082 - INSTRUMENT
      ?auto_169076 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_169071 ?auto_169068 ) ) ( not ( = ?auto_169072 ?auto_169068 ) ) ( not ( = ?auto_169072 ?auto_169071 ) ) ( not ( = ?auto_169074 ?auto_169068 ) ) ( not ( = ?auto_169074 ?auto_169071 ) ) ( not ( = ?auto_169074 ?auto_169072 ) ) ( ON_BOARD ?auto_169077 ?auto_169078 ) ( SUPPORTS ?auto_169077 ?auto_169070 ) ( not ( = ?auto_169071 ?auto_169079 ) ) ( CALIBRATION_TARGET ?auto_169077 ?auto_169079 ) ( not ( = ?auto_169079 ?auto_169072 ) ) ( ON_BOARD ?auto_169080 ?auto_169078 ) ( not ( = ?auto_169077 ?auto_169080 ) ) ( SUPPORTS ?auto_169080 ?auto_169073 ) ( CALIBRATION_TARGET ?auto_169080 ?auto_169079 ) ( not ( = ?auto_169079 ?auto_169074 ) ) ( ON_BOARD ?auto_169081 ?auto_169078 ) ( not ( = ?auto_169080 ?auto_169081 ) ) ( SUPPORTS ?auto_169081 ?auto_169075 ) ( CALIBRATION_TARGET ?auto_169081 ?auto_169079 ) ( not ( = ?auto_169079 ?auto_169068 ) ) ( ON_BOARD ?auto_169082 ?auto_169078 ) ( not ( = ?auto_169081 ?auto_169082 ) ) ( SUPPORTS ?auto_169082 ?auto_169069 ) ( CALIBRATION_TARGET ?auto_169082 ?auto_169079 ) ( POWER_AVAIL ?auto_169078 ) ( POINTING ?auto_169078 ?auto_169076 ) ( not ( = ?auto_169079 ?auto_169076 ) ) ( not ( = ?auto_169068 ?auto_169076 ) ) ( not ( = ?auto_169069 ?auto_169075 ) ) ( not ( = ?auto_169074 ?auto_169076 ) ) ( not ( = ?auto_169069 ?auto_169073 ) ) ( not ( = ?auto_169075 ?auto_169073 ) ) ( not ( = ?auto_169072 ?auto_169076 ) ) ( not ( = ?auto_169080 ?auto_169082 ) ) ( not ( = ?auto_169069 ?auto_169070 ) ) ( not ( = ?auto_169075 ?auto_169070 ) ) ( not ( = ?auto_169073 ?auto_169070 ) ) ( not ( = ?auto_169071 ?auto_169076 ) ) ( not ( = ?auto_169077 ?auto_169081 ) ) ( not ( = ?auto_169077 ?auto_169082 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_169068 ?auto_169069 ?auto_169074 ?auto_169075 ?auto_169071 ?auto_169070 ?auto_169072 ?auto_169073 )
      ( GET-4IMAGE-VERIFY ?auto_169068 ?auto_169069 ?auto_169071 ?auto_169070 ?auto_169072 ?auto_169073 ?auto_169074 ?auto_169075 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_169223 - DIRECTION
      ?auto_169224 - MODE
      ?auto_169226 - DIRECTION
      ?auto_169225 - MODE
      ?auto_169227 - DIRECTION
      ?auto_169228 - MODE
      ?auto_169229 - DIRECTION
      ?auto_169230 - MODE
    )
    :vars
    (
      ?auto_169232 - INSTRUMENT
      ?auto_169233 - SATELLITE
      ?auto_169234 - DIRECTION
      ?auto_169235 - INSTRUMENT
      ?auto_169236 - INSTRUMENT
      ?auto_169237 - INSTRUMENT
      ?auto_169231 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_169226 ?auto_169223 ) ) ( not ( = ?auto_169227 ?auto_169223 ) ) ( not ( = ?auto_169227 ?auto_169226 ) ) ( not ( = ?auto_169229 ?auto_169223 ) ) ( not ( = ?auto_169229 ?auto_169226 ) ) ( not ( = ?auto_169229 ?auto_169227 ) ) ( ON_BOARD ?auto_169232 ?auto_169233 ) ( SUPPORTS ?auto_169232 ?auto_169230 ) ( not ( = ?auto_169229 ?auto_169234 ) ) ( CALIBRATION_TARGET ?auto_169232 ?auto_169234 ) ( not ( = ?auto_169234 ?auto_169227 ) ) ( ON_BOARD ?auto_169235 ?auto_169233 ) ( not ( = ?auto_169232 ?auto_169235 ) ) ( SUPPORTS ?auto_169235 ?auto_169228 ) ( CALIBRATION_TARGET ?auto_169235 ?auto_169234 ) ( not ( = ?auto_169234 ?auto_169223 ) ) ( ON_BOARD ?auto_169236 ?auto_169233 ) ( not ( = ?auto_169235 ?auto_169236 ) ) ( SUPPORTS ?auto_169236 ?auto_169224 ) ( CALIBRATION_TARGET ?auto_169236 ?auto_169234 ) ( not ( = ?auto_169234 ?auto_169226 ) ) ( ON_BOARD ?auto_169237 ?auto_169233 ) ( not ( = ?auto_169236 ?auto_169237 ) ) ( SUPPORTS ?auto_169237 ?auto_169225 ) ( CALIBRATION_TARGET ?auto_169237 ?auto_169234 ) ( POWER_AVAIL ?auto_169233 ) ( POINTING ?auto_169233 ?auto_169231 ) ( not ( = ?auto_169234 ?auto_169231 ) ) ( not ( = ?auto_169226 ?auto_169231 ) ) ( not ( = ?auto_169225 ?auto_169224 ) ) ( not ( = ?auto_169223 ?auto_169231 ) ) ( not ( = ?auto_169225 ?auto_169228 ) ) ( not ( = ?auto_169224 ?auto_169228 ) ) ( not ( = ?auto_169227 ?auto_169231 ) ) ( not ( = ?auto_169235 ?auto_169237 ) ) ( not ( = ?auto_169225 ?auto_169230 ) ) ( not ( = ?auto_169224 ?auto_169230 ) ) ( not ( = ?auto_169228 ?auto_169230 ) ) ( not ( = ?auto_169229 ?auto_169231 ) ) ( not ( = ?auto_169232 ?auto_169236 ) ) ( not ( = ?auto_169232 ?auto_169237 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_169226 ?auto_169225 ?auto_169223 ?auto_169224 ?auto_169229 ?auto_169230 ?auto_169227 ?auto_169228 )
      ( GET-4IMAGE-VERIFY ?auto_169223 ?auto_169224 ?auto_169226 ?auto_169225 ?auto_169227 ?auto_169228 ?auto_169229 ?auto_169230 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_169272 - DIRECTION
      ?auto_169273 - MODE
      ?auto_169275 - DIRECTION
      ?auto_169274 - MODE
      ?auto_169276 - DIRECTION
      ?auto_169277 - MODE
      ?auto_169278 - DIRECTION
      ?auto_169279 - MODE
    )
    :vars
    (
      ?auto_169281 - INSTRUMENT
      ?auto_169282 - SATELLITE
      ?auto_169283 - DIRECTION
      ?auto_169284 - INSTRUMENT
      ?auto_169285 - INSTRUMENT
      ?auto_169286 - INSTRUMENT
      ?auto_169280 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_169275 ?auto_169272 ) ) ( not ( = ?auto_169276 ?auto_169272 ) ) ( not ( = ?auto_169276 ?auto_169275 ) ) ( not ( = ?auto_169278 ?auto_169272 ) ) ( not ( = ?auto_169278 ?auto_169275 ) ) ( not ( = ?auto_169278 ?auto_169276 ) ) ( ON_BOARD ?auto_169281 ?auto_169282 ) ( SUPPORTS ?auto_169281 ?auto_169277 ) ( not ( = ?auto_169276 ?auto_169283 ) ) ( CALIBRATION_TARGET ?auto_169281 ?auto_169283 ) ( not ( = ?auto_169283 ?auto_169278 ) ) ( ON_BOARD ?auto_169284 ?auto_169282 ) ( not ( = ?auto_169281 ?auto_169284 ) ) ( SUPPORTS ?auto_169284 ?auto_169279 ) ( CALIBRATION_TARGET ?auto_169284 ?auto_169283 ) ( not ( = ?auto_169283 ?auto_169272 ) ) ( ON_BOARD ?auto_169285 ?auto_169282 ) ( not ( = ?auto_169284 ?auto_169285 ) ) ( SUPPORTS ?auto_169285 ?auto_169273 ) ( CALIBRATION_TARGET ?auto_169285 ?auto_169283 ) ( not ( = ?auto_169283 ?auto_169275 ) ) ( ON_BOARD ?auto_169286 ?auto_169282 ) ( not ( = ?auto_169285 ?auto_169286 ) ) ( SUPPORTS ?auto_169286 ?auto_169274 ) ( CALIBRATION_TARGET ?auto_169286 ?auto_169283 ) ( POWER_AVAIL ?auto_169282 ) ( POINTING ?auto_169282 ?auto_169280 ) ( not ( = ?auto_169283 ?auto_169280 ) ) ( not ( = ?auto_169275 ?auto_169280 ) ) ( not ( = ?auto_169274 ?auto_169273 ) ) ( not ( = ?auto_169272 ?auto_169280 ) ) ( not ( = ?auto_169274 ?auto_169279 ) ) ( not ( = ?auto_169273 ?auto_169279 ) ) ( not ( = ?auto_169278 ?auto_169280 ) ) ( not ( = ?auto_169284 ?auto_169286 ) ) ( not ( = ?auto_169274 ?auto_169277 ) ) ( not ( = ?auto_169273 ?auto_169277 ) ) ( not ( = ?auto_169279 ?auto_169277 ) ) ( not ( = ?auto_169276 ?auto_169280 ) ) ( not ( = ?auto_169281 ?auto_169285 ) ) ( not ( = ?auto_169281 ?auto_169286 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_169275 ?auto_169274 ?auto_169272 ?auto_169273 ?auto_169276 ?auto_169277 ?auto_169278 ?auto_169279 )
      ( GET-4IMAGE-VERIFY ?auto_169272 ?auto_169273 ?auto_169275 ?auto_169274 ?auto_169276 ?auto_169277 ?auto_169278 ?auto_169279 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_169429 - DIRECTION
      ?auto_169430 - MODE
      ?auto_169432 - DIRECTION
      ?auto_169431 - MODE
      ?auto_169433 - DIRECTION
      ?auto_169434 - MODE
      ?auto_169435 - DIRECTION
      ?auto_169436 - MODE
    )
    :vars
    (
      ?auto_169438 - INSTRUMENT
      ?auto_169439 - SATELLITE
      ?auto_169440 - DIRECTION
      ?auto_169441 - INSTRUMENT
      ?auto_169442 - INSTRUMENT
      ?auto_169443 - INSTRUMENT
      ?auto_169437 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_169432 ?auto_169429 ) ) ( not ( = ?auto_169433 ?auto_169429 ) ) ( not ( = ?auto_169433 ?auto_169432 ) ) ( not ( = ?auto_169435 ?auto_169429 ) ) ( not ( = ?auto_169435 ?auto_169432 ) ) ( not ( = ?auto_169435 ?auto_169433 ) ) ( ON_BOARD ?auto_169438 ?auto_169439 ) ( SUPPORTS ?auto_169438 ?auto_169436 ) ( not ( = ?auto_169435 ?auto_169440 ) ) ( CALIBRATION_TARGET ?auto_169438 ?auto_169440 ) ( not ( = ?auto_169440 ?auto_169432 ) ) ( ON_BOARD ?auto_169441 ?auto_169439 ) ( not ( = ?auto_169438 ?auto_169441 ) ) ( SUPPORTS ?auto_169441 ?auto_169431 ) ( CALIBRATION_TARGET ?auto_169441 ?auto_169440 ) ( not ( = ?auto_169440 ?auto_169429 ) ) ( ON_BOARD ?auto_169442 ?auto_169439 ) ( not ( = ?auto_169441 ?auto_169442 ) ) ( SUPPORTS ?auto_169442 ?auto_169430 ) ( CALIBRATION_TARGET ?auto_169442 ?auto_169440 ) ( not ( = ?auto_169440 ?auto_169433 ) ) ( ON_BOARD ?auto_169443 ?auto_169439 ) ( not ( = ?auto_169442 ?auto_169443 ) ) ( SUPPORTS ?auto_169443 ?auto_169434 ) ( CALIBRATION_TARGET ?auto_169443 ?auto_169440 ) ( POWER_AVAIL ?auto_169439 ) ( POINTING ?auto_169439 ?auto_169437 ) ( not ( = ?auto_169440 ?auto_169437 ) ) ( not ( = ?auto_169433 ?auto_169437 ) ) ( not ( = ?auto_169434 ?auto_169430 ) ) ( not ( = ?auto_169429 ?auto_169437 ) ) ( not ( = ?auto_169434 ?auto_169431 ) ) ( not ( = ?auto_169430 ?auto_169431 ) ) ( not ( = ?auto_169432 ?auto_169437 ) ) ( not ( = ?auto_169441 ?auto_169443 ) ) ( not ( = ?auto_169434 ?auto_169436 ) ) ( not ( = ?auto_169430 ?auto_169436 ) ) ( not ( = ?auto_169431 ?auto_169436 ) ) ( not ( = ?auto_169435 ?auto_169437 ) ) ( not ( = ?auto_169438 ?auto_169442 ) ) ( not ( = ?auto_169438 ?auto_169443 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_169433 ?auto_169434 ?auto_169429 ?auto_169430 ?auto_169435 ?auto_169436 ?auto_169432 ?auto_169431 )
      ( GET-4IMAGE-VERIFY ?auto_169429 ?auto_169430 ?auto_169432 ?auto_169431 ?auto_169433 ?auto_169434 ?auto_169435 ?auto_169436 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_169478 - DIRECTION
      ?auto_169479 - MODE
      ?auto_169481 - DIRECTION
      ?auto_169480 - MODE
      ?auto_169482 - DIRECTION
      ?auto_169483 - MODE
      ?auto_169484 - DIRECTION
      ?auto_169485 - MODE
    )
    :vars
    (
      ?auto_169487 - INSTRUMENT
      ?auto_169488 - SATELLITE
      ?auto_169489 - DIRECTION
      ?auto_169490 - INSTRUMENT
      ?auto_169491 - INSTRUMENT
      ?auto_169492 - INSTRUMENT
      ?auto_169486 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_169481 ?auto_169478 ) ) ( not ( = ?auto_169482 ?auto_169478 ) ) ( not ( = ?auto_169482 ?auto_169481 ) ) ( not ( = ?auto_169484 ?auto_169478 ) ) ( not ( = ?auto_169484 ?auto_169481 ) ) ( not ( = ?auto_169484 ?auto_169482 ) ) ( ON_BOARD ?auto_169487 ?auto_169488 ) ( SUPPORTS ?auto_169487 ?auto_169483 ) ( not ( = ?auto_169482 ?auto_169489 ) ) ( CALIBRATION_TARGET ?auto_169487 ?auto_169489 ) ( not ( = ?auto_169489 ?auto_169481 ) ) ( ON_BOARD ?auto_169490 ?auto_169488 ) ( not ( = ?auto_169487 ?auto_169490 ) ) ( SUPPORTS ?auto_169490 ?auto_169480 ) ( CALIBRATION_TARGET ?auto_169490 ?auto_169489 ) ( not ( = ?auto_169489 ?auto_169478 ) ) ( ON_BOARD ?auto_169491 ?auto_169488 ) ( not ( = ?auto_169490 ?auto_169491 ) ) ( SUPPORTS ?auto_169491 ?auto_169479 ) ( CALIBRATION_TARGET ?auto_169491 ?auto_169489 ) ( not ( = ?auto_169489 ?auto_169484 ) ) ( ON_BOARD ?auto_169492 ?auto_169488 ) ( not ( = ?auto_169491 ?auto_169492 ) ) ( SUPPORTS ?auto_169492 ?auto_169485 ) ( CALIBRATION_TARGET ?auto_169492 ?auto_169489 ) ( POWER_AVAIL ?auto_169488 ) ( POINTING ?auto_169488 ?auto_169486 ) ( not ( = ?auto_169489 ?auto_169486 ) ) ( not ( = ?auto_169484 ?auto_169486 ) ) ( not ( = ?auto_169485 ?auto_169479 ) ) ( not ( = ?auto_169478 ?auto_169486 ) ) ( not ( = ?auto_169485 ?auto_169480 ) ) ( not ( = ?auto_169479 ?auto_169480 ) ) ( not ( = ?auto_169481 ?auto_169486 ) ) ( not ( = ?auto_169490 ?auto_169492 ) ) ( not ( = ?auto_169485 ?auto_169483 ) ) ( not ( = ?auto_169479 ?auto_169483 ) ) ( not ( = ?auto_169480 ?auto_169483 ) ) ( not ( = ?auto_169482 ?auto_169486 ) ) ( not ( = ?auto_169487 ?auto_169491 ) ) ( not ( = ?auto_169487 ?auto_169492 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_169484 ?auto_169485 ?auto_169478 ?auto_169479 ?auto_169482 ?auto_169483 ?auto_169481 ?auto_169480 )
      ( GET-4IMAGE-VERIFY ?auto_169478 ?auto_169479 ?auto_169481 ?auto_169480 ?auto_169482 ?auto_169483 ?auto_169484 ?auto_169485 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_169578 - DIRECTION
      ?auto_169579 - MODE
      ?auto_169581 - DIRECTION
      ?auto_169580 - MODE
      ?auto_169582 - DIRECTION
      ?auto_169583 - MODE
      ?auto_169584 - DIRECTION
      ?auto_169585 - MODE
    )
    :vars
    (
      ?auto_169587 - INSTRUMENT
      ?auto_169588 - SATELLITE
      ?auto_169589 - DIRECTION
      ?auto_169590 - INSTRUMENT
      ?auto_169591 - INSTRUMENT
      ?auto_169592 - INSTRUMENT
      ?auto_169586 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_169581 ?auto_169578 ) ) ( not ( = ?auto_169582 ?auto_169578 ) ) ( not ( = ?auto_169582 ?auto_169581 ) ) ( not ( = ?auto_169584 ?auto_169578 ) ) ( not ( = ?auto_169584 ?auto_169581 ) ) ( not ( = ?auto_169584 ?auto_169582 ) ) ( ON_BOARD ?auto_169587 ?auto_169588 ) ( SUPPORTS ?auto_169587 ?auto_169580 ) ( not ( = ?auto_169581 ?auto_169589 ) ) ( CALIBRATION_TARGET ?auto_169587 ?auto_169589 ) ( not ( = ?auto_169589 ?auto_169584 ) ) ( ON_BOARD ?auto_169590 ?auto_169588 ) ( not ( = ?auto_169587 ?auto_169590 ) ) ( SUPPORTS ?auto_169590 ?auto_169585 ) ( CALIBRATION_TARGET ?auto_169590 ?auto_169589 ) ( not ( = ?auto_169589 ?auto_169578 ) ) ( ON_BOARD ?auto_169591 ?auto_169588 ) ( not ( = ?auto_169590 ?auto_169591 ) ) ( SUPPORTS ?auto_169591 ?auto_169579 ) ( CALIBRATION_TARGET ?auto_169591 ?auto_169589 ) ( not ( = ?auto_169589 ?auto_169582 ) ) ( ON_BOARD ?auto_169592 ?auto_169588 ) ( not ( = ?auto_169591 ?auto_169592 ) ) ( SUPPORTS ?auto_169592 ?auto_169583 ) ( CALIBRATION_TARGET ?auto_169592 ?auto_169589 ) ( POWER_AVAIL ?auto_169588 ) ( POINTING ?auto_169588 ?auto_169586 ) ( not ( = ?auto_169589 ?auto_169586 ) ) ( not ( = ?auto_169582 ?auto_169586 ) ) ( not ( = ?auto_169583 ?auto_169579 ) ) ( not ( = ?auto_169578 ?auto_169586 ) ) ( not ( = ?auto_169583 ?auto_169585 ) ) ( not ( = ?auto_169579 ?auto_169585 ) ) ( not ( = ?auto_169584 ?auto_169586 ) ) ( not ( = ?auto_169590 ?auto_169592 ) ) ( not ( = ?auto_169583 ?auto_169580 ) ) ( not ( = ?auto_169579 ?auto_169580 ) ) ( not ( = ?auto_169585 ?auto_169580 ) ) ( not ( = ?auto_169581 ?auto_169586 ) ) ( not ( = ?auto_169587 ?auto_169591 ) ) ( not ( = ?auto_169587 ?auto_169592 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_169582 ?auto_169583 ?auto_169578 ?auto_169579 ?auto_169581 ?auto_169580 ?auto_169584 ?auto_169585 )
      ( GET-4IMAGE-VERIFY ?auto_169578 ?auto_169579 ?auto_169581 ?auto_169580 ?auto_169582 ?auto_169583 ?auto_169584 ?auto_169585 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_169682 - DIRECTION
      ?auto_169683 - MODE
      ?auto_169685 - DIRECTION
      ?auto_169684 - MODE
      ?auto_169686 - DIRECTION
      ?auto_169687 - MODE
      ?auto_169688 - DIRECTION
      ?auto_169689 - MODE
    )
    :vars
    (
      ?auto_169691 - INSTRUMENT
      ?auto_169692 - SATELLITE
      ?auto_169693 - DIRECTION
      ?auto_169694 - INSTRUMENT
      ?auto_169695 - INSTRUMENT
      ?auto_169696 - INSTRUMENT
      ?auto_169690 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_169685 ?auto_169682 ) ) ( not ( = ?auto_169686 ?auto_169682 ) ) ( not ( = ?auto_169686 ?auto_169685 ) ) ( not ( = ?auto_169688 ?auto_169682 ) ) ( not ( = ?auto_169688 ?auto_169685 ) ) ( not ( = ?auto_169688 ?auto_169686 ) ) ( ON_BOARD ?auto_169691 ?auto_169692 ) ( SUPPORTS ?auto_169691 ?auto_169684 ) ( not ( = ?auto_169685 ?auto_169693 ) ) ( CALIBRATION_TARGET ?auto_169691 ?auto_169693 ) ( not ( = ?auto_169693 ?auto_169686 ) ) ( ON_BOARD ?auto_169694 ?auto_169692 ) ( not ( = ?auto_169691 ?auto_169694 ) ) ( SUPPORTS ?auto_169694 ?auto_169687 ) ( CALIBRATION_TARGET ?auto_169694 ?auto_169693 ) ( not ( = ?auto_169693 ?auto_169682 ) ) ( ON_BOARD ?auto_169695 ?auto_169692 ) ( not ( = ?auto_169694 ?auto_169695 ) ) ( SUPPORTS ?auto_169695 ?auto_169683 ) ( CALIBRATION_TARGET ?auto_169695 ?auto_169693 ) ( not ( = ?auto_169693 ?auto_169688 ) ) ( ON_BOARD ?auto_169696 ?auto_169692 ) ( not ( = ?auto_169695 ?auto_169696 ) ) ( SUPPORTS ?auto_169696 ?auto_169689 ) ( CALIBRATION_TARGET ?auto_169696 ?auto_169693 ) ( POWER_AVAIL ?auto_169692 ) ( POINTING ?auto_169692 ?auto_169690 ) ( not ( = ?auto_169693 ?auto_169690 ) ) ( not ( = ?auto_169688 ?auto_169690 ) ) ( not ( = ?auto_169689 ?auto_169683 ) ) ( not ( = ?auto_169682 ?auto_169690 ) ) ( not ( = ?auto_169689 ?auto_169687 ) ) ( not ( = ?auto_169683 ?auto_169687 ) ) ( not ( = ?auto_169686 ?auto_169690 ) ) ( not ( = ?auto_169694 ?auto_169696 ) ) ( not ( = ?auto_169689 ?auto_169684 ) ) ( not ( = ?auto_169683 ?auto_169684 ) ) ( not ( = ?auto_169687 ?auto_169684 ) ) ( not ( = ?auto_169685 ?auto_169690 ) ) ( not ( = ?auto_169691 ?auto_169695 ) ) ( not ( = ?auto_169691 ?auto_169696 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_169688 ?auto_169689 ?auto_169682 ?auto_169683 ?auto_169685 ?auto_169684 ?auto_169686 ?auto_169687 )
      ( GET-4IMAGE-VERIFY ?auto_169682 ?auto_169683 ?auto_169685 ?auto_169684 ?auto_169686 ?auto_169687 ?auto_169688 ?auto_169689 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_169837 - DIRECTION
      ?auto_169838 - MODE
      ?auto_169840 - DIRECTION
      ?auto_169839 - MODE
      ?auto_169841 - DIRECTION
      ?auto_169842 - MODE
      ?auto_169843 - DIRECTION
      ?auto_169844 - MODE
    )
    :vars
    (
      ?auto_169846 - INSTRUMENT
      ?auto_169847 - SATELLITE
      ?auto_169848 - DIRECTION
      ?auto_169849 - INSTRUMENT
      ?auto_169850 - INSTRUMENT
      ?auto_169851 - INSTRUMENT
      ?auto_169845 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_169840 ?auto_169837 ) ) ( not ( = ?auto_169841 ?auto_169837 ) ) ( not ( = ?auto_169841 ?auto_169840 ) ) ( not ( = ?auto_169843 ?auto_169837 ) ) ( not ( = ?auto_169843 ?auto_169840 ) ) ( not ( = ?auto_169843 ?auto_169841 ) ) ( ON_BOARD ?auto_169846 ?auto_169847 ) ( SUPPORTS ?auto_169846 ?auto_169844 ) ( not ( = ?auto_169843 ?auto_169848 ) ) ( CALIBRATION_TARGET ?auto_169846 ?auto_169848 ) ( not ( = ?auto_169848 ?auto_169837 ) ) ( ON_BOARD ?auto_169849 ?auto_169847 ) ( not ( = ?auto_169846 ?auto_169849 ) ) ( SUPPORTS ?auto_169849 ?auto_169838 ) ( CALIBRATION_TARGET ?auto_169849 ?auto_169848 ) ( not ( = ?auto_169848 ?auto_169841 ) ) ( ON_BOARD ?auto_169850 ?auto_169847 ) ( not ( = ?auto_169849 ?auto_169850 ) ) ( SUPPORTS ?auto_169850 ?auto_169842 ) ( CALIBRATION_TARGET ?auto_169850 ?auto_169848 ) ( not ( = ?auto_169848 ?auto_169840 ) ) ( ON_BOARD ?auto_169851 ?auto_169847 ) ( not ( = ?auto_169850 ?auto_169851 ) ) ( SUPPORTS ?auto_169851 ?auto_169839 ) ( CALIBRATION_TARGET ?auto_169851 ?auto_169848 ) ( POWER_AVAIL ?auto_169847 ) ( POINTING ?auto_169847 ?auto_169845 ) ( not ( = ?auto_169848 ?auto_169845 ) ) ( not ( = ?auto_169840 ?auto_169845 ) ) ( not ( = ?auto_169839 ?auto_169842 ) ) ( not ( = ?auto_169841 ?auto_169845 ) ) ( not ( = ?auto_169839 ?auto_169838 ) ) ( not ( = ?auto_169842 ?auto_169838 ) ) ( not ( = ?auto_169837 ?auto_169845 ) ) ( not ( = ?auto_169849 ?auto_169851 ) ) ( not ( = ?auto_169839 ?auto_169844 ) ) ( not ( = ?auto_169842 ?auto_169844 ) ) ( not ( = ?auto_169838 ?auto_169844 ) ) ( not ( = ?auto_169843 ?auto_169845 ) ) ( not ( = ?auto_169846 ?auto_169850 ) ) ( not ( = ?auto_169846 ?auto_169851 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_169840 ?auto_169839 ?auto_169841 ?auto_169842 ?auto_169843 ?auto_169844 ?auto_169837 ?auto_169838 )
      ( GET-4IMAGE-VERIFY ?auto_169837 ?auto_169838 ?auto_169840 ?auto_169839 ?auto_169841 ?auto_169842 ?auto_169843 ?auto_169844 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_169886 - DIRECTION
      ?auto_169887 - MODE
      ?auto_169889 - DIRECTION
      ?auto_169888 - MODE
      ?auto_169890 - DIRECTION
      ?auto_169891 - MODE
      ?auto_169892 - DIRECTION
      ?auto_169893 - MODE
    )
    :vars
    (
      ?auto_169895 - INSTRUMENT
      ?auto_169896 - SATELLITE
      ?auto_169897 - DIRECTION
      ?auto_169898 - INSTRUMENT
      ?auto_169899 - INSTRUMENT
      ?auto_169900 - INSTRUMENT
      ?auto_169894 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_169889 ?auto_169886 ) ) ( not ( = ?auto_169890 ?auto_169886 ) ) ( not ( = ?auto_169890 ?auto_169889 ) ) ( not ( = ?auto_169892 ?auto_169886 ) ) ( not ( = ?auto_169892 ?auto_169889 ) ) ( not ( = ?auto_169892 ?auto_169890 ) ) ( ON_BOARD ?auto_169895 ?auto_169896 ) ( SUPPORTS ?auto_169895 ?auto_169891 ) ( not ( = ?auto_169890 ?auto_169897 ) ) ( CALIBRATION_TARGET ?auto_169895 ?auto_169897 ) ( not ( = ?auto_169897 ?auto_169886 ) ) ( ON_BOARD ?auto_169898 ?auto_169896 ) ( not ( = ?auto_169895 ?auto_169898 ) ) ( SUPPORTS ?auto_169898 ?auto_169887 ) ( CALIBRATION_TARGET ?auto_169898 ?auto_169897 ) ( not ( = ?auto_169897 ?auto_169892 ) ) ( ON_BOARD ?auto_169899 ?auto_169896 ) ( not ( = ?auto_169898 ?auto_169899 ) ) ( SUPPORTS ?auto_169899 ?auto_169893 ) ( CALIBRATION_TARGET ?auto_169899 ?auto_169897 ) ( not ( = ?auto_169897 ?auto_169889 ) ) ( ON_BOARD ?auto_169900 ?auto_169896 ) ( not ( = ?auto_169899 ?auto_169900 ) ) ( SUPPORTS ?auto_169900 ?auto_169888 ) ( CALIBRATION_TARGET ?auto_169900 ?auto_169897 ) ( POWER_AVAIL ?auto_169896 ) ( POINTING ?auto_169896 ?auto_169894 ) ( not ( = ?auto_169897 ?auto_169894 ) ) ( not ( = ?auto_169889 ?auto_169894 ) ) ( not ( = ?auto_169888 ?auto_169893 ) ) ( not ( = ?auto_169892 ?auto_169894 ) ) ( not ( = ?auto_169888 ?auto_169887 ) ) ( not ( = ?auto_169893 ?auto_169887 ) ) ( not ( = ?auto_169886 ?auto_169894 ) ) ( not ( = ?auto_169898 ?auto_169900 ) ) ( not ( = ?auto_169888 ?auto_169891 ) ) ( not ( = ?auto_169893 ?auto_169891 ) ) ( not ( = ?auto_169887 ?auto_169891 ) ) ( not ( = ?auto_169890 ?auto_169894 ) ) ( not ( = ?auto_169895 ?auto_169899 ) ) ( not ( = ?auto_169895 ?auto_169900 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_169889 ?auto_169888 ?auto_169892 ?auto_169893 ?auto_169890 ?auto_169891 ?auto_169886 ?auto_169887 )
      ( GET-4IMAGE-VERIFY ?auto_169886 ?auto_169887 ?auto_169889 ?auto_169888 ?auto_169890 ?auto_169891 ?auto_169892 ?auto_169893 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_169935 - DIRECTION
      ?auto_169936 - MODE
      ?auto_169938 - DIRECTION
      ?auto_169937 - MODE
      ?auto_169939 - DIRECTION
      ?auto_169940 - MODE
      ?auto_169941 - DIRECTION
      ?auto_169942 - MODE
    )
    :vars
    (
      ?auto_169944 - INSTRUMENT
      ?auto_169945 - SATELLITE
      ?auto_169946 - DIRECTION
      ?auto_169947 - INSTRUMENT
      ?auto_169948 - INSTRUMENT
      ?auto_169949 - INSTRUMENT
      ?auto_169943 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_169938 ?auto_169935 ) ) ( not ( = ?auto_169939 ?auto_169935 ) ) ( not ( = ?auto_169939 ?auto_169938 ) ) ( not ( = ?auto_169941 ?auto_169935 ) ) ( not ( = ?auto_169941 ?auto_169938 ) ) ( not ( = ?auto_169941 ?auto_169939 ) ) ( ON_BOARD ?auto_169944 ?auto_169945 ) ( SUPPORTS ?auto_169944 ?auto_169942 ) ( not ( = ?auto_169941 ?auto_169946 ) ) ( CALIBRATION_TARGET ?auto_169944 ?auto_169946 ) ( not ( = ?auto_169946 ?auto_169935 ) ) ( ON_BOARD ?auto_169947 ?auto_169945 ) ( not ( = ?auto_169944 ?auto_169947 ) ) ( SUPPORTS ?auto_169947 ?auto_169936 ) ( CALIBRATION_TARGET ?auto_169947 ?auto_169946 ) ( not ( = ?auto_169946 ?auto_169938 ) ) ( ON_BOARD ?auto_169948 ?auto_169945 ) ( not ( = ?auto_169947 ?auto_169948 ) ) ( SUPPORTS ?auto_169948 ?auto_169937 ) ( CALIBRATION_TARGET ?auto_169948 ?auto_169946 ) ( not ( = ?auto_169946 ?auto_169939 ) ) ( ON_BOARD ?auto_169949 ?auto_169945 ) ( not ( = ?auto_169948 ?auto_169949 ) ) ( SUPPORTS ?auto_169949 ?auto_169940 ) ( CALIBRATION_TARGET ?auto_169949 ?auto_169946 ) ( POWER_AVAIL ?auto_169945 ) ( POINTING ?auto_169945 ?auto_169943 ) ( not ( = ?auto_169946 ?auto_169943 ) ) ( not ( = ?auto_169939 ?auto_169943 ) ) ( not ( = ?auto_169940 ?auto_169937 ) ) ( not ( = ?auto_169938 ?auto_169943 ) ) ( not ( = ?auto_169940 ?auto_169936 ) ) ( not ( = ?auto_169937 ?auto_169936 ) ) ( not ( = ?auto_169935 ?auto_169943 ) ) ( not ( = ?auto_169947 ?auto_169949 ) ) ( not ( = ?auto_169940 ?auto_169942 ) ) ( not ( = ?auto_169937 ?auto_169942 ) ) ( not ( = ?auto_169936 ?auto_169942 ) ) ( not ( = ?auto_169941 ?auto_169943 ) ) ( not ( = ?auto_169944 ?auto_169948 ) ) ( not ( = ?auto_169944 ?auto_169949 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_169939 ?auto_169940 ?auto_169938 ?auto_169937 ?auto_169941 ?auto_169942 ?auto_169935 ?auto_169936 )
      ( GET-4IMAGE-VERIFY ?auto_169935 ?auto_169936 ?auto_169938 ?auto_169937 ?auto_169939 ?auto_169940 ?auto_169941 ?auto_169942 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_169984 - DIRECTION
      ?auto_169985 - MODE
      ?auto_169987 - DIRECTION
      ?auto_169986 - MODE
      ?auto_169988 - DIRECTION
      ?auto_169989 - MODE
      ?auto_169990 - DIRECTION
      ?auto_169991 - MODE
    )
    :vars
    (
      ?auto_169993 - INSTRUMENT
      ?auto_169994 - SATELLITE
      ?auto_169995 - DIRECTION
      ?auto_169996 - INSTRUMENT
      ?auto_169997 - INSTRUMENT
      ?auto_169998 - INSTRUMENT
      ?auto_169992 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_169987 ?auto_169984 ) ) ( not ( = ?auto_169988 ?auto_169984 ) ) ( not ( = ?auto_169988 ?auto_169987 ) ) ( not ( = ?auto_169990 ?auto_169984 ) ) ( not ( = ?auto_169990 ?auto_169987 ) ) ( not ( = ?auto_169990 ?auto_169988 ) ) ( ON_BOARD ?auto_169993 ?auto_169994 ) ( SUPPORTS ?auto_169993 ?auto_169989 ) ( not ( = ?auto_169988 ?auto_169995 ) ) ( CALIBRATION_TARGET ?auto_169993 ?auto_169995 ) ( not ( = ?auto_169995 ?auto_169984 ) ) ( ON_BOARD ?auto_169996 ?auto_169994 ) ( not ( = ?auto_169993 ?auto_169996 ) ) ( SUPPORTS ?auto_169996 ?auto_169985 ) ( CALIBRATION_TARGET ?auto_169996 ?auto_169995 ) ( not ( = ?auto_169995 ?auto_169987 ) ) ( ON_BOARD ?auto_169997 ?auto_169994 ) ( not ( = ?auto_169996 ?auto_169997 ) ) ( SUPPORTS ?auto_169997 ?auto_169986 ) ( CALIBRATION_TARGET ?auto_169997 ?auto_169995 ) ( not ( = ?auto_169995 ?auto_169990 ) ) ( ON_BOARD ?auto_169998 ?auto_169994 ) ( not ( = ?auto_169997 ?auto_169998 ) ) ( SUPPORTS ?auto_169998 ?auto_169991 ) ( CALIBRATION_TARGET ?auto_169998 ?auto_169995 ) ( POWER_AVAIL ?auto_169994 ) ( POINTING ?auto_169994 ?auto_169992 ) ( not ( = ?auto_169995 ?auto_169992 ) ) ( not ( = ?auto_169990 ?auto_169992 ) ) ( not ( = ?auto_169991 ?auto_169986 ) ) ( not ( = ?auto_169987 ?auto_169992 ) ) ( not ( = ?auto_169991 ?auto_169985 ) ) ( not ( = ?auto_169986 ?auto_169985 ) ) ( not ( = ?auto_169984 ?auto_169992 ) ) ( not ( = ?auto_169996 ?auto_169998 ) ) ( not ( = ?auto_169991 ?auto_169989 ) ) ( not ( = ?auto_169986 ?auto_169989 ) ) ( not ( = ?auto_169985 ?auto_169989 ) ) ( not ( = ?auto_169988 ?auto_169992 ) ) ( not ( = ?auto_169993 ?auto_169997 ) ) ( not ( = ?auto_169993 ?auto_169998 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_169990 ?auto_169991 ?auto_169987 ?auto_169986 ?auto_169988 ?auto_169989 ?auto_169984 ?auto_169985 )
      ( GET-4IMAGE-VERIFY ?auto_169984 ?auto_169985 ?auto_169987 ?auto_169986 ?auto_169988 ?auto_169989 ?auto_169990 ?auto_169991 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_170192 - DIRECTION
      ?auto_170193 - MODE
      ?auto_170195 - DIRECTION
      ?auto_170194 - MODE
      ?auto_170196 - DIRECTION
      ?auto_170197 - MODE
      ?auto_170198 - DIRECTION
      ?auto_170199 - MODE
    )
    :vars
    (
      ?auto_170201 - INSTRUMENT
      ?auto_170202 - SATELLITE
      ?auto_170203 - DIRECTION
      ?auto_170204 - INSTRUMENT
      ?auto_170205 - INSTRUMENT
      ?auto_170206 - INSTRUMENT
      ?auto_170200 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_170195 ?auto_170192 ) ) ( not ( = ?auto_170196 ?auto_170192 ) ) ( not ( = ?auto_170196 ?auto_170195 ) ) ( not ( = ?auto_170198 ?auto_170192 ) ) ( not ( = ?auto_170198 ?auto_170195 ) ) ( not ( = ?auto_170198 ?auto_170196 ) ) ( ON_BOARD ?auto_170201 ?auto_170202 ) ( SUPPORTS ?auto_170201 ?auto_170194 ) ( not ( = ?auto_170195 ?auto_170203 ) ) ( CALIBRATION_TARGET ?auto_170201 ?auto_170203 ) ( not ( = ?auto_170203 ?auto_170192 ) ) ( ON_BOARD ?auto_170204 ?auto_170202 ) ( not ( = ?auto_170201 ?auto_170204 ) ) ( SUPPORTS ?auto_170204 ?auto_170193 ) ( CALIBRATION_TARGET ?auto_170204 ?auto_170203 ) ( not ( = ?auto_170203 ?auto_170198 ) ) ( ON_BOARD ?auto_170205 ?auto_170202 ) ( not ( = ?auto_170204 ?auto_170205 ) ) ( SUPPORTS ?auto_170205 ?auto_170199 ) ( CALIBRATION_TARGET ?auto_170205 ?auto_170203 ) ( not ( = ?auto_170203 ?auto_170196 ) ) ( ON_BOARD ?auto_170206 ?auto_170202 ) ( not ( = ?auto_170205 ?auto_170206 ) ) ( SUPPORTS ?auto_170206 ?auto_170197 ) ( CALIBRATION_TARGET ?auto_170206 ?auto_170203 ) ( POWER_AVAIL ?auto_170202 ) ( POINTING ?auto_170202 ?auto_170200 ) ( not ( = ?auto_170203 ?auto_170200 ) ) ( not ( = ?auto_170196 ?auto_170200 ) ) ( not ( = ?auto_170197 ?auto_170199 ) ) ( not ( = ?auto_170198 ?auto_170200 ) ) ( not ( = ?auto_170197 ?auto_170193 ) ) ( not ( = ?auto_170199 ?auto_170193 ) ) ( not ( = ?auto_170192 ?auto_170200 ) ) ( not ( = ?auto_170204 ?auto_170206 ) ) ( not ( = ?auto_170197 ?auto_170194 ) ) ( not ( = ?auto_170199 ?auto_170194 ) ) ( not ( = ?auto_170193 ?auto_170194 ) ) ( not ( = ?auto_170195 ?auto_170200 ) ) ( not ( = ?auto_170201 ?auto_170205 ) ) ( not ( = ?auto_170201 ?auto_170206 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_170196 ?auto_170197 ?auto_170198 ?auto_170199 ?auto_170195 ?auto_170194 ?auto_170192 ?auto_170193 )
      ( GET-4IMAGE-VERIFY ?auto_170192 ?auto_170193 ?auto_170195 ?auto_170194 ?auto_170196 ?auto_170197 ?auto_170198 ?auto_170199 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_170241 - DIRECTION
      ?auto_170242 - MODE
      ?auto_170244 - DIRECTION
      ?auto_170243 - MODE
      ?auto_170245 - DIRECTION
      ?auto_170246 - MODE
      ?auto_170247 - DIRECTION
      ?auto_170248 - MODE
    )
    :vars
    (
      ?auto_170250 - INSTRUMENT
      ?auto_170251 - SATELLITE
      ?auto_170252 - DIRECTION
      ?auto_170253 - INSTRUMENT
      ?auto_170254 - INSTRUMENT
      ?auto_170255 - INSTRUMENT
      ?auto_170249 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_170244 ?auto_170241 ) ) ( not ( = ?auto_170245 ?auto_170241 ) ) ( not ( = ?auto_170245 ?auto_170244 ) ) ( not ( = ?auto_170247 ?auto_170241 ) ) ( not ( = ?auto_170247 ?auto_170244 ) ) ( not ( = ?auto_170247 ?auto_170245 ) ) ( ON_BOARD ?auto_170250 ?auto_170251 ) ( SUPPORTS ?auto_170250 ?auto_170243 ) ( not ( = ?auto_170244 ?auto_170252 ) ) ( CALIBRATION_TARGET ?auto_170250 ?auto_170252 ) ( not ( = ?auto_170252 ?auto_170241 ) ) ( ON_BOARD ?auto_170253 ?auto_170251 ) ( not ( = ?auto_170250 ?auto_170253 ) ) ( SUPPORTS ?auto_170253 ?auto_170242 ) ( CALIBRATION_TARGET ?auto_170253 ?auto_170252 ) ( not ( = ?auto_170252 ?auto_170245 ) ) ( ON_BOARD ?auto_170254 ?auto_170251 ) ( not ( = ?auto_170253 ?auto_170254 ) ) ( SUPPORTS ?auto_170254 ?auto_170246 ) ( CALIBRATION_TARGET ?auto_170254 ?auto_170252 ) ( not ( = ?auto_170252 ?auto_170247 ) ) ( ON_BOARD ?auto_170255 ?auto_170251 ) ( not ( = ?auto_170254 ?auto_170255 ) ) ( SUPPORTS ?auto_170255 ?auto_170248 ) ( CALIBRATION_TARGET ?auto_170255 ?auto_170252 ) ( POWER_AVAIL ?auto_170251 ) ( POINTING ?auto_170251 ?auto_170249 ) ( not ( = ?auto_170252 ?auto_170249 ) ) ( not ( = ?auto_170247 ?auto_170249 ) ) ( not ( = ?auto_170248 ?auto_170246 ) ) ( not ( = ?auto_170245 ?auto_170249 ) ) ( not ( = ?auto_170248 ?auto_170242 ) ) ( not ( = ?auto_170246 ?auto_170242 ) ) ( not ( = ?auto_170241 ?auto_170249 ) ) ( not ( = ?auto_170253 ?auto_170255 ) ) ( not ( = ?auto_170248 ?auto_170243 ) ) ( not ( = ?auto_170246 ?auto_170243 ) ) ( not ( = ?auto_170242 ?auto_170243 ) ) ( not ( = ?auto_170244 ?auto_170249 ) ) ( not ( = ?auto_170250 ?auto_170254 ) ) ( not ( = ?auto_170250 ?auto_170255 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_170247 ?auto_170248 ?auto_170245 ?auto_170246 ?auto_170244 ?auto_170243 ?auto_170241 ?auto_170242 )
      ( GET-4IMAGE-VERIFY ?auto_170241 ?auto_170242 ?auto_170244 ?auto_170243 ?auto_170245 ?auto_170246 ?auto_170247 ?auto_170248 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_170557 - DIRECTION
      ?auto_170558 - MODE
      ?auto_170560 - DIRECTION
      ?auto_170559 - MODE
      ?auto_170561 - DIRECTION
      ?auto_170562 - MODE
      ?auto_170563 - DIRECTION
      ?auto_170564 - MODE
    )
    :vars
    (
      ?auto_170566 - INSTRUMENT
      ?auto_170567 - SATELLITE
      ?auto_170568 - DIRECTION
      ?auto_170569 - INSTRUMENT
      ?auto_170570 - INSTRUMENT
      ?auto_170571 - INSTRUMENT
      ?auto_170565 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_170560 ?auto_170557 ) ) ( not ( = ?auto_170561 ?auto_170557 ) ) ( not ( = ?auto_170561 ?auto_170560 ) ) ( not ( = ?auto_170563 ?auto_170557 ) ) ( not ( = ?auto_170563 ?auto_170560 ) ) ( not ( = ?auto_170563 ?auto_170561 ) ) ( ON_BOARD ?auto_170566 ?auto_170567 ) ( SUPPORTS ?auto_170566 ?auto_170558 ) ( not ( = ?auto_170557 ?auto_170568 ) ) ( CALIBRATION_TARGET ?auto_170566 ?auto_170568 ) ( not ( = ?auto_170568 ?auto_170563 ) ) ( ON_BOARD ?auto_170569 ?auto_170567 ) ( not ( = ?auto_170566 ?auto_170569 ) ) ( SUPPORTS ?auto_170569 ?auto_170564 ) ( CALIBRATION_TARGET ?auto_170569 ?auto_170568 ) ( not ( = ?auto_170568 ?auto_170561 ) ) ( ON_BOARD ?auto_170570 ?auto_170567 ) ( not ( = ?auto_170569 ?auto_170570 ) ) ( SUPPORTS ?auto_170570 ?auto_170562 ) ( CALIBRATION_TARGET ?auto_170570 ?auto_170568 ) ( not ( = ?auto_170568 ?auto_170560 ) ) ( ON_BOARD ?auto_170571 ?auto_170567 ) ( not ( = ?auto_170570 ?auto_170571 ) ) ( SUPPORTS ?auto_170571 ?auto_170559 ) ( CALIBRATION_TARGET ?auto_170571 ?auto_170568 ) ( POWER_AVAIL ?auto_170567 ) ( POINTING ?auto_170567 ?auto_170565 ) ( not ( = ?auto_170568 ?auto_170565 ) ) ( not ( = ?auto_170560 ?auto_170565 ) ) ( not ( = ?auto_170559 ?auto_170562 ) ) ( not ( = ?auto_170561 ?auto_170565 ) ) ( not ( = ?auto_170559 ?auto_170564 ) ) ( not ( = ?auto_170562 ?auto_170564 ) ) ( not ( = ?auto_170563 ?auto_170565 ) ) ( not ( = ?auto_170569 ?auto_170571 ) ) ( not ( = ?auto_170559 ?auto_170558 ) ) ( not ( = ?auto_170562 ?auto_170558 ) ) ( not ( = ?auto_170564 ?auto_170558 ) ) ( not ( = ?auto_170557 ?auto_170565 ) ) ( not ( = ?auto_170566 ?auto_170570 ) ) ( not ( = ?auto_170566 ?auto_170571 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_170560 ?auto_170559 ?auto_170561 ?auto_170562 ?auto_170557 ?auto_170558 ?auto_170563 ?auto_170564 )
      ( GET-4IMAGE-VERIFY ?auto_170557 ?auto_170558 ?auto_170560 ?auto_170559 ?auto_170561 ?auto_170562 ?auto_170563 ?auto_170564 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_170606 - DIRECTION
      ?auto_170607 - MODE
      ?auto_170609 - DIRECTION
      ?auto_170608 - MODE
      ?auto_170610 - DIRECTION
      ?auto_170611 - MODE
      ?auto_170612 - DIRECTION
      ?auto_170613 - MODE
    )
    :vars
    (
      ?auto_170615 - INSTRUMENT
      ?auto_170616 - SATELLITE
      ?auto_170617 - DIRECTION
      ?auto_170618 - INSTRUMENT
      ?auto_170619 - INSTRUMENT
      ?auto_170620 - INSTRUMENT
      ?auto_170614 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_170609 ?auto_170606 ) ) ( not ( = ?auto_170610 ?auto_170606 ) ) ( not ( = ?auto_170610 ?auto_170609 ) ) ( not ( = ?auto_170612 ?auto_170606 ) ) ( not ( = ?auto_170612 ?auto_170609 ) ) ( not ( = ?auto_170612 ?auto_170610 ) ) ( ON_BOARD ?auto_170615 ?auto_170616 ) ( SUPPORTS ?auto_170615 ?auto_170607 ) ( not ( = ?auto_170606 ?auto_170617 ) ) ( CALIBRATION_TARGET ?auto_170615 ?auto_170617 ) ( not ( = ?auto_170617 ?auto_170610 ) ) ( ON_BOARD ?auto_170618 ?auto_170616 ) ( not ( = ?auto_170615 ?auto_170618 ) ) ( SUPPORTS ?auto_170618 ?auto_170611 ) ( CALIBRATION_TARGET ?auto_170618 ?auto_170617 ) ( not ( = ?auto_170617 ?auto_170612 ) ) ( ON_BOARD ?auto_170619 ?auto_170616 ) ( not ( = ?auto_170618 ?auto_170619 ) ) ( SUPPORTS ?auto_170619 ?auto_170613 ) ( CALIBRATION_TARGET ?auto_170619 ?auto_170617 ) ( not ( = ?auto_170617 ?auto_170609 ) ) ( ON_BOARD ?auto_170620 ?auto_170616 ) ( not ( = ?auto_170619 ?auto_170620 ) ) ( SUPPORTS ?auto_170620 ?auto_170608 ) ( CALIBRATION_TARGET ?auto_170620 ?auto_170617 ) ( POWER_AVAIL ?auto_170616 ) ( POINTING ?auto_170616 ?auto_170614 ) ( not ( = ?auto_170617 ?auto_170614 ) ) ( not ( = ?auto_170609 ?auto_170614 ) ) ( not ( = ?auto_170608 ?auto_170613 ) ) ( not ( = ?auto_170612 ?auto_170614 ) ) ( not ( = ?auto_170608 ?auto_170611 ) ) ( not ( = ?auto_170613 ?auto_170611 ) ) ( not ( = ?auto_170610 ?auto_170614 ) ) ( not ( = ?auto_170618 ?auto_170620 ) ) ( not ( = ?auto_170608 ?auto_170607 ) ) ( not ( = ?auto_170613 ?auto_170607 ) ) ( not ( = ?auto_170611 ?auto_170607 ) ) ( not ( = ?auto_170606 ?auto_170614 ) ) ( not ( = ?auto_170615 ?auto_170619 ) ) ( not ( = ?auto_170615 ?auto_170620 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_170609 ?auto_170608 ?auto_170612 ?auto_170613 ?auto_170606 ?auto_170607 ?auto_170610 ?auto_170611 )
      ( GET-4IMAGE-VERIFY ?auto_170606 ?auto_170607 ?auto_170609 ?auto_170608 ?auto_170610 ?auto_170611 ?auto_170612 ?auto_170613 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_170761 - DIRECTION
      ?auto_170762 - MODE
      ?auto_170764 - DIRECTION
      ?auto_170763 - MODE
      ?auto_170765 - DIRECTION
      ?auto_170766 - MODE
      ?auto_170767 - DIRECTION
      ?auto_170768 - MODE
    )
    :vars
    (
      ?auto_170770 - INSTRUMENT
      ?auto_170771 - SATELLITE
      ?auto_170772 - DIRECTION
      ?auto_170773 - INSTRUMENT
      ?auto_170774 - INSTRUMENT
      ?auto_170775 - INSTRUMENT
      ?auto_170769 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_170764 ?auto_170761 ) ) ( not ( = ?auto_170765 ?auto_170761 ) ) ( not ( = ?auto_170765 ?auto_170764 ) ) ( not ( = ?auto_170767 ?auto_170761 ) ) ( not ( = ?auto_170767 ?auto_170764 ) ) ( not ( = ?auto_170767 ?auto_170765 ) ) ( ON_BOARD ?auto_170770 ?auto_170771 ) ( SUPPORTS ?auto_170770 ?auto_170762 ) ( not ( = ?auto_170761 ?auto_170772 ) ) ( CALIBRATION_TARGET ?auto_170770 ?auto_170772 ) ( not ( = ?auto_170772 ?auto_170767 ) ) ( ON_BOARD ?auto_170773 ?auto_170771 ) ( not ( = ?auto_170770 ?auto_170773 ) ) ( SUPPORTS ?auto_170773 ?auto_170768 ) ( CALIBRATION_TARGET ?auto_170773 ?auto_170772 ) ( not ( = ?auto_170772 ?auto_170764 ) ) ( ON_BOARD ?auto_170774 ?auto_170771 ) ( not ( = ?auto_170773 ?auto_170774 ) ) ( SUPPORTS ?auto_170774 ?auto_170763 ) ( CALIBRATION_TARGET ?auto_170774 ?auto_170772 ) ( not ( = ?auto_170772 ?auto_170765 ) ) ( ON_BOARD ?auto_170775 ?auto_170771 ) ( not ( = ?auto_170774 ?auto_170775 ) ) ( SUPPORTS ?auto_170775 ?auto_170766 ) ( CALIBRATION_TARGET ?auto_170775 ?auto_170772 ) ( POWER_AVAIL ?auto_170771 ) ( POINTING ?auto_170771 ?auto_170769 ) ( not ( = ?auto_170772 ?auto_170769 ) ) ( not ( = ?auto_170765 ?auto_170769 ) ) ( not ( = ?auto_170766 ?auto_170763 ) ) ( not ( = ?auto_170764 ?auto_170769 ) ) ( not ( = ?auto_170766 ?auto_170768 ) ) ( not ( = ?auto_170763 ?auto_170768 ) ) ( not ( = ?auto_170767 ?auto_170769 ) ) ( not ( = ?auto_170773 ?auto_170775 ) ) ( not ( = ?auto_170766 ?auto_170762 ) ) ( not ( = ?auto_170763 ?auto_170762 ) ) ( not ( = ?auto_170768 ?auto_170762 ) ) ( not ( = ?auto_170761 ?auto_170769 ) ) ( not ( = ?auto_170770 ?auto_170774 ) ) ( not ( = ?auto_170770 ?auto_170775 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_170765 ?auto_170766 ?auto_170764 ?auto_170763 ?auto_170761 ?auto_170762 ?auto_170767 ?auto_170768 )
      ( GET-4IMAGE-VERIFY ?auto_170761 ?auto_170762 ?auto_170764 ?auto_170763 ?auto_170765 ?auto_170766 ?auto_170767 ?auto_170768 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_170865 - DIRECTION
      ?auto_170866 - MODE
      ?auto_170868 - DIRECTION
      ?auto_170867 - MODE
      ?auto_170869 - DIRECTION
      ?auto_170870 - MODE
      ?auto_170871 - DIRECTION
      ?auto_170872 - MODE
    )
    :vars
    (
      ?auto_170874 - INSTRUMENT
      ?auto_170875 - SATELLITE
      ?auto_170876 - DIRECTION
      ?auto_170877 - INSTRUMENT
      ?auto_170878 - INSTRUMENT
      ?auto_170879 - INSTRUMENT
      ?auto_170873 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_170868 ?auto_170865 ) ) ( not ( = ?auto_170869 ?auto_170865 ) ) ( not ( = ?auto_170869 ?auto_170868 ) ) ( not ( = ?auto_170871 ?auto_170865 ) ) ( not ( = ?auto_170871 ?auto_170868 ) ) ( not ( = ?auto_170871 ?auto_170869 ) ) ( ON_BOARD ?auto_170874 ?auto_170875 ) ( SUPPORTS ?auto_170874 ?auto_170866 ) ( not ( = ?auto_170865 ?auto_170876 ) ) ( CALIBRATION_TARGET ?auto_170874 ?auto_170876 ) ( not ( = ?auto_170876 ?auto_170869 ) ) ( ON_BOARD ?auto_170877 ?auto_170875 ) ( not ( = ?auto_170874 ?auto_170877 ) ) ( SUPPORTS ?auto_170877 ?auto_170870 ) ( CALIBRATION_TARGET ?auto_170877 ?auto_170876 ) ( not ( = ?auto_170876 ?auto_170868 ) ) ( ON_BOARD ?auto_170878 ?auto_170875 ) ( not ( = ?auto_170877 ?auto_170878 ) ) ( SUPPORTS ?auto_170878 ?auto_170867 ) ( CALIBRATION_TARGET ?auto_170878 ?auto_170876 ) ( not ( = ?auto_170876 ?auto_170871 ) ) ( ON_BOARD ?auto_170879 ?auto_170875 ) ( not ( = ?auto_170878 ?auto_170879 ) ) ( SUPPORTS ?auto_170879 ?auto_170872 ) ( CALIBRATION_TARGET ?auto_170879 ?auto_170876 ) ( POWER_AVAIL ?auto_170875 ) ( POINTING ?auto_170875 ?auto_170873 ) ( not ( = ?auto_170876 ?auto_170873 ) ) ( not ( = ?auto_170871 ?auto_170873 ) ) ( not ( = ?auto_170872 ?auto_170867 ) ) ( not ( = ?auto_170868 ?auto_170873 ) ) ( not ( = ?auto_170872 ?auto_170870 ) ) ( not ( = ?auto_170867 ?auto_170870 ) ) ( not ( = ?auto_170869 ?auto_170873 ) ) ( not ( = ?auto_170877 ?auto_170879 ) ) ( not ( = ?auto_170872 ?auto_170866 ) ) ( not ( = ?auto_170867 ?auto_170866 ) ) ( not ( = ?auto_170870 ?auto_170866 ) ) ( not ( = ?auto_170865 ?auto_170873 ) ) ( not ( = ?auto_170874 ?auto_170878 ) ) ( not ( = ?auto_170874 ?auto_170879 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_170871 ?auto_170872 ?auto_170868 ?auto_170867 ?auto_170865 ?auto_170866 ?auto_170869 ?auto_170870 )
      ( GET-4IMAGE-VERIFY ?auto_170865 ?auto_170866 ?auto_170868 ?auto_170867 ?auto_170869 ?auto_170870 ?auto_170871 ?auto_170872 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_171020 - DIRECTION
      ?auto_171021 - MODE
      ?auto_171023 - DIRECTION
      ?auto_171022 - MODE
      ?auto_171024 - DIRECTION
      ?auto_171025 - MODE
      ?auto_171026 - DIRECTION
      ?auto_171027 - MODE
    )
    :vars
    (
      ?auto_171029 - INSTRUMENT
      ?auto_171030 - SATELLITE
      ?auto_171031 - DIRECTION
      ?auto_171032 - INSTRUMENT
      ?auto_171033 - INSTRUMENT
      ?auto_171034 - INSTRUMENT
      ?auto_171028 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_171023 ?auto_171020 ) ) ( not ( = ?auto_171024 ?auto_171020 ) ) ( not ( = ?auto_171024 ?auto_171023 ) ) ( not ( = ?auto_171026 ?auto_171020 ) ) ( not ( = ?auto_171026 ?auto_171023 ) ) ( not ( = ?auto_171026 ?auto_171024 ) ) ( ON_BOARD ?auto_171029 ?auto_171030 ) ( SUPPORTS ?auto_171029 ?auto_171021 ) ( not ( = ?auto_171020 ?auto_171031 ) ) ( CALIBRATION_TARGET ?auto_171029 ?auto_171031 ) ( not ( = ?auto_171031 ?auto_171023 ) ) ( ON_BOARD ?auto_171032 ?auto_171030 ) ( not ( = ?auto_171029 ?auto_171032 ) ) ( SUPPORTS ?auto_171032 ?auto_171022 ) ( CALIBRATION_TARGET ?auto_171032 ?auto_171031 ) ( not ( = ?auto_171031 ?auto_171026 ) ) ( ON_BOARD ?auto_171033 ?auto_171030 ) ( not ( = ?auto_171032 ?auto_171033 ) ) ( SUPPORTS ?auto_171033 ?auto_171027 ) ( CALIBRATION_TARGET ?auto_171033 ?auto_171031 ) ( not ( = ?auto_171031 ?auto_171024 ) ) ( ON_BOARD ?auto_171034 ?auto_171030 ) ( not ( = ?auto_171033 ?auto_171034 ) ) ( SUPPORTS ?auto_171034 ?auto_171025 ) ( CALIBRATION_TARGET ?auto_171034 ?auto_171031 ) ( POWER_AVAIL ?auto_171030 ) ( POINTING ?auto_171030 ?auto_171028 ) ( not ( = ?auto_171031 ?auto_171028 ) ) ( not ( = ?auto_171024 ?auto_171028 ) ) ( not ( = ?auto_171025 ?auto_171027 ) ) ( not ( = ?auto_171026 ?auto_171028 ) ) ( not ( = ?auto_171025 ?auto_171022 ) ) ( not ( = ?auto_171027 ?auto_171022 ) ) ( not ( = ?auto_171023 ?auto_171028 ) ) ( not ( = ?auto_171032 ?auto_171034 ) ) ( not ( = ?auto_171025 ?auto_171021 ) ) ( not ( = ?auto_171027 ?auto_171021 ) ) ( not ( = ?auto_171022 ?auto_171021 ) ) ( not ( = ?auto_171020 ?auto_171028 ) ) ( not ( = ?auto_171029 ?auto_171033 ) ) ( not ( = ?auto_171029 ?auto_171034 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_171024 ?auto_171025 ?auto_171026 ?auto_171027 ?auto_171020 ?auto_171021 ?auto_171023 ?auto_171022 )
      ( GET-4IMAGE-VERIFY ?auto_171020 ?auto_171021 ?auto_171023 ?auto_171022 ?auto_171024 ?auto_171025 ?auto_171026 ?auto_171027 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_171069 - DIRECTION
      ?auto_171070 - MODE
      ?auto_171072 - DIRECTION
      ?auto_171071 - MODE
      ?auto_171073 - DIRECTION
      ?auto_171074 - MODE
      ?auto_171075 - DIRECTION
      ?auto_171076 - MODE
    )
    :vars
    (
      ?auto_171078 - INSTRUMENT
      ?auto_171079 - SATELLITE
      ?auto_171080 - DIRECTION
      ?auto_171081 - INSTRUMENT
      ?auto_171082 - INSTRUMENT
      ?auto_171083 - INSTRUMENT
      ?auto_171077 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_171072 ?auto_171069 ) ) ( not ( = ?auto_171073 ?auto_171069 ) ) ( not ( = ?auto_171073 ?auto_171072 ) ) ( not ( = ?auto_171075 ?auto_171069 ) ) ( not ( = ?auto_171075 ?auto_171072 ) ) ( not ( = ?auto_171075 ?auto_171073 ) ) ( ON_BOARD ?auto_171078 ?auto_171079 ) ( SUPPORTS ?auto_171078 ?auto_171070 ) ( not ( = ?auto_171069 ?auto_171080 ) ) ( CALIBRATION_TARGET ?auto_171078 ?auto_171080 ) ( not ( = ?auto_171080 ?auto_171072 ) ) ( ON_BOARD ?auto_171081 ?auto_171079 ) ( not ( = ?auto_171078 ?auto_171081 ) ) ( SUPPORTS ?auto_171081 ?auto_171071 ) ( CALIBRATION_TARGET ?auto_171081 ?auto_171080 ) ( not ( = ?auto_171080 ?auto_171073 ) ) ( ON_BOARD ?auto_171082 ?auto_171079 ) ( not ( = ?auto_171081 ?auto_171082 ) ) ( SUPPORTS ?auto_171082 ?auto_171074 ) ( CALIBRATION_TARGET ?auto_171082 ?auto_171080 ) ( not ( = ?auto_171080 ?auto_171075 ) ) ( ON_BOARD ?auto_171083 ?auto_171079 ) ( not ( = ?auto_171082 ?auto_171083 ) ) ( SUPPORTS ?auto_171083 ?auto_171076 ) ( CALIBRATION_TARGET ?auto_171083 ?auto_171080 ) ( POWER_AVAIL ?auto_171079 ) ( POINTING ?auto_171079 ?auto_171077 ) ( not ( = ?auto_171080 ?auto_171077 ) ) ( not ( = ?auto_171075 ?auto_171077 ) ) ( not ( = ?auto_171076 ?auto_171074 ) ) ( not ( = ?auto_171073 ?auto_171077 ) ) ( not ( = ?auto_171076 ?auto_171071 ) ) ( not ( = ?auto_171074 ?auto_171071 ) ) ( not ( = ?auto_171072 ?auto_171077 ) ) ( not ( = ?auto_171081 ?auto_171083 ) ) ( not ( = ?auto_171076 ?auto_171070 ) ) ( not ( = ?auto_171074 ?auto_171070 ) ) ( not ( = ?auto_171071 ?auto_171070 ) ) ( not ( = ?auto_171069 ?auto_171077 ) ) ( not ( = ?auto_171078 ?auto_171082 ) ) ( not ( = ?auto_171078 ?auto_171083 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_171075 ?auto_171076 ?auto_171073 ?auto_171074 ?auto_171069 ?auto_171070 ?auto_171072 ?auto_171071 )
      ( GET-4IMAGE-VERIFY ?auto_171069 ?auto_171070 ?auto_171072 ?auto_171071 ?auto_171073 ?auto_171074 ?auto_171075 ?auto_171076 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_171575 - DIRECTION
      ?auto_171576 - MODE
    )
    :vars
    (
      ?auto_171577 - INSTRUMENT
      ?auto_171578 - SATELLITE
      ?auto_171579 - DIRECTION
      ?auto_171580 - DIRECTION
      ?auto_171581 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_171577 ?auto_171578 ) ( SUPPORTS ?auto_171577 ?auto_171576 ) ( not ( = ?auto_171575 ?auto_171579 ) ) ( CALIBRATION_TARGET ?auto_171577 ?auto_171579 ) ( POINTING ?auto_171578 ?auto_171580 ) ( not ( = ?auto_171579 ?auto_171580 ) ) ( ON_BOARD ?auto_171581 ?auto_171578 ) ( POWER_ON ?auto_171581 ) ( not ( = ?auto_171575 ?auto_171580 ) ) ( not ( = ?auto_171577 ?auto_171581 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_171581 ?auto_171578 )
      ( !TURN_TO ?auto_171578 ?auto_171579 ?auto_171580 )
      ( !SWITCH_ON ?auto_171577 ?auto_171578 )
      ( !CALIBRATE ?auto_171578 ?auto_171577 ?auto_171579 )
      ( !TURN_TO ?auto_171578 ?auto_171575 ?auto_171579 )
      ( !TAKE_IMAGE ?auto_171578 ?auto_171575 ?auto_171577 ?auto_171576 )
      ( GET-1IMAGE-VERIFY ?auto_171575 ?auto_171576 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_194352 - DIRECTION
      ?auto_194353 - MODE
      ?auto_194355 - DIRECTION
      ?auto_194354 - MODE
      ?auto_194356 - DIRECTION
      ?auto_194357 - MODE
      ?auto_194358 - DIRECTION
      ?auto_194359 - MODE
      ?auto_194360 - DIRECTION
      ?auto_194361 - MODE
    )
    :vars
    (
      ?auto_194364 - INSTRUMENT
      ?auto_194362 - SATELLITE
      ?auto_194365 - DIRECTION
      ?auto_194363 - INSTRUMENT
      ?auto_194367 - INSTRUMENT
      ?auto_194368 - INSTRUMENT
      ?auto_194369 - INSTRUMENT
      ?auto_194366 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_194355 ?auto_194352 ) ) ( not ( = ?auto_194356 ?auto_194352 ) ) ( not ( = ?auto_194356 ?auto_194355 ) ) ( not ( = ?auto_194358 ?auto_194352 ) ) ( not ( = ?auto_194358 ?auto_194355 ) ) ( not ( = ?auto_194358 ?auto_194356 ) ) ( not ( = ?auto_194360 ?auto_194352 ) ) ( not ( = ?auto_194360 ?auto_194355 ) ) ( not ( = ?auto_194360 ?auto_194356 ) ) ( not ( = ?auto_194360 ?auto_194358 ) ) ( ON_BOARD ?auto_194364 ?auto_194362 ) ( SUPPORTS ?auto_194364 ?auto_194361 ) ( not ( = ?auto_194360 ?auto_194365 ) ) ( CALIBRATION_TARGET ?auto_194364 ?auto_194365 ) ( not ( = ?auto_194365 ?auto_194358 ) ) ( ON_BOARD ?auto_194363 ?auto_194362 ) ( not ( = ?auto_194364 ?auto_194363 ) ) ( SUPPORTS ?auto_194363 ?auto_194359 ) ( CALIBRATION_TARGET ?auto_194363 ?auto_194365 ) ( not ( = ?auto_194365 ?auto_194356 ) ) ( ON_BOARD ?auto_194367 ?auto_194362 ) ( not ( = ?auto_194363 ?auto_194367 ) ) ( SUPPORTS ?auto_194367 ?auto_194357 ) ( CALIBRATION_TARGET ?auto_194367 ?auto_194365 ) ( not ( = ?auto_194365 ?auto_194355 ) ) ( ON_BOARD ?auto_194368 ?auto_194362 ) ( not ( = ?auto_194367 ?auto_194368 ) ) ( SUPPORTS ?auto_194368 ?auto_194354 ) ( CALIBRATION_TARGET ?auto_194368 ?auto_194365 ) ( not ( = ?auto_194365 ?auto_194352 ) ) ( ON_BOARD ?auto_194369 ?auto_194362 ) ( not ( = ?auto_194368 ?auto_194369 ) ) ( SUPPORTS ?auto_194369 ?auto_194353 ) ( CALIBRATION_TARGET ?auto_194369 ?auto_194365 ) ( POWER_AVAIL ?auto_194362 ) ( POINTING ?auto_194362 ?auto_194366 ) ( not ( = ?auto_194365 ?auto_194366 ) ) ( not ( = ?auto_194352 ?auto_194366 ) ) ( not ( = ?auto_194353 ?auto_194354 ) ) ( not ( = ?auto_194355 ?auto_194366 ) ) ( not ( = ?auto_194353 ?auto_194357 ) ) ( not ( = ?auto_194354 ?auto_194357 ) ) ( not ( = ?auto_194356 ?auto_194366 ) ) ( not ( = ?auto_194367 ?auto_194369 ) ) ( not ( = ?auto_194353 ?auto_194359 ) ) ( not ( = ?auto_194354 ?auto_194359 ) ) ( not ( = ?auto_194357 ?auto_194359 ) ) ( not ( = ?auto_194358 ?auto_194366 ) ) ( not ( = ?auto_194363 ?auto_194368 ) ) ( not ( = ?auto_194363 ?auto_194369 ) ) ( not ( = ?auto_194353 ?auto_194361 ) ) ( not ( = ?auto_194354 ?auto_194361 ) ) ( not ( = ?auto_194357 ?auto_194361 ) ) ( not ( = ?auto_194359 ?auto_194361 ) ) ( not ( = ?auto_194360 ?auto_194366 ) ) ( not ( = ?auto_194364 ?auto_194367 ) ) ( not ( = ?auto_194364 ?auto_194368 ) ) ( not ( = ?auto_194364 ?auto_194369 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_194352 ?auto_194353 ?auto_194355 ?auto_194354 ?auto_194358 ?auto_194359 ?auto_194356 ?auto_194357 )
      ( GET-1IMAGE ?auto_194360 ?auto_194361 )
      ( GET-5IMAGE-VERIFY ?auto_194352 ?auto_194353 ?auto_194355 ?auto_194354 ?auto_194356 ?auto_194357 ?auto_194358 ?auto_194359 ?auto_194360 ?auto_194361 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_194430 - DIRECTION
      ?auto_194431 - MODE
      ?auto_194433 - DIRECTION
      ?auto_194432 - MODE
      ?auto_194434 - DIRECTION
      ?auto_194435 - MODE
      ?auto_194436 - DIRECTION
      ?auto_194437 - MODE
      ?auto_194438 - DIRECTION
      ?auto_194439 - MODE
    )
    :vars
    (
      ?auto_194443 - INSTRUMENT
      ?auto_194446 - SATELLITE
      ?auto_194442 - DIRECTION
      ?auto_194440 - INSTRUMENT
      ?auto_194441 - INSTRUMENT
      ?auto_194444 - INSTRUMENT
      ?auto_194447 - INSTRUMENT
      ?auto_194445 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_194433 ?auto_194430 ) ) ( not ( = ?auto_194434 ?auto_194430 ) ) ( not ( = ?auto_194434 ?auto_194433 ) ) ( not ( = ?auto_194436 ?auto_194430 ) ) ( not ( = ?auto_194436 ?auto_194433 ) ) ( not ( = ?auto_194436 ?auto_194434 ) ) ( not ( = ?auto_194438 ?auto_194430 ) ) ( not ( = ?auto_194438 ?auto_194433 ) ) ( not ( = ?auto_194438 ?auto_194434 ) ) ( not ( = ?auto_194438 ?auto_194436 ) ) ( ON_BOARD ?auto_194443 ?auto_194446 ) ( SUPPORTS ?auto_194443 ?auto_194437 ) ( not ( = ?auto_194436 ?auto_194442 ) ) ( CALIBRATION_TARGET ?auto_194443 ?auto_194442 ) ( not ( = ?auto_194442 ?auto_194438 ) ) ( ON_BOARD ?auto_194440 ?auto_194446 ) ( not ( = ?auto_194443 ?auto_194440 ) ) ( SUPPORTS ?auto_194440 ?auto_194439 ) ( CALIBRATION_TARGET ?auto_194440 ?auto_194442 ) ( not ( = ?auto_194442 ?auto_194434 ) ) ( ON_BOARD ?auto_194441 ?auto_194446 ) ( not ( = ?auto_194440 ?auto_194441 ) ) ( SUPPORTS ?auto_194441 ?auto_194435 ) ( CALIBRATION_TARGET ?auto_194441 ?auto_194442 ) ( not ( = ?auto_194442 ?auto_194433 ) ) ( ON_BOARD ?auto_194444 ?auto_194446 ) ( not ( = ?auto_194441 ?auto_194444 ) ) ( SUPPORTS ?auto_194444 ?auto_194432 ) ( CALIBRATION_TARGET ?auto_194444 ?auto_194442 ) ( not ( = ?auto_194442 ?auto_194430 ) ) ( ON_BOARD ?auto_194447 ?auto_194446 ) ( not ( = ?auto_194444 ?auto_194447 ) ) ( SUPPORTS ?auto_194447 ?auto_194431 ) ( CALIBRATION_TARGET ?auto_194447 ?auto_194442 ) ( POWER_AVAIL ?auto_194446 ) ( POINTING ?auto_194446 ?auto_194445 ) ( not ( = ?auto_194442 ?auto_194445 ) ) ( not ( = ?auto_194430 ?auto_194445 ) ) ( not ( = ?auto_194431 ?auto_194432 ) ) ( not ( = ?auto_194433 ?auto_194445 ) ) ( not ( = ?auto_194431 ?auto_194435 ) ) ( not ( = ?auto_194432 ?auto_194435 ) ) ( not ( = ?auto_194434 ?auto_194445 ) ) ( not ( = ?auto_194441 ?auto_194447 ) ) ( not ( = ?auto_194431 ?auto_194439 ) ) ( not ( = ?auto_194432 ?auto_194439 ) ) ( not ( = ?auto_194435 ?auto_194439 ) ) ( not ( = ?auto_194438 ?auto_194445 ) ) ( not ( = ?auto_194440 ?auto_194444 ) ) ( not ( = ?auto_194440 ?auto_194447 ) ) ( not ( = ?auto_194431 ?auto_194437 ) ) ( not ( = ?auto_194432 ?auto_194437 ) ) ( not ( = ?auto_194435 ?auto_194437 ) ) ( not ( = ?auto_194439 ?auto_194437 ) ) ( not ( = ?auto_194436 ?auto_194445 ) ) ( not ( = ?auto_194443 ?auto_194441 ) ) ( not ( = ?auto_194443 ?auto_194444 ) ) ( not ( = ?auto_194443 ?auto_194447 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_194430 ?auto_194431 ?auto_194433 ?auto_194432 ?auto_194434 ?auto_194435 ?auto_194438 ?auto_194439 ?auto_194436 ?auto_194437 )
      ( GET-5IMAGE-VERIFY ?auto_194430 ?auto_194431 ?auto_194433 ?auto_194432 ?auto_194434 ?auto_194435 ?auto_194436 ?auto_194437 ?auto_194438 ?auto_194439 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_194508 - DIRECTION
      ?auto_194509 - MODE
      ?auto_194511 - DIRECTION
      ?auto_194510 - MODE
      ?auto_194512 - DIRECTION
      ?auto_194513 - MODE
      ?auto_194514 - DIRECTION
      ?auto_194515 - MODE
      ?auto_194516 - DIRECTION
      ?auto_194517 - MODE
    )
    :vars
    (
      ?auto_194518 - INSTRUMENT
      ?auto_194523 - SATELLITE
      ?auto_194519 - DIRECTION
      ?auto_194525 - INSTRUMENT
      ?auto_194522 - INSTRUMENT
      ?auto_194521 - INSTRUMENT
      ?auto_194524 - INSTRUMENT
      ?auto_194520 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_194511 ?auto_194508 ) ) ( not ( = ?auto_194512 ?auto_194508 ) ) ( not ( = ?auto_194512 ?auto_194511 ) ) ( not ( = ?auto_194514 ?auto_194508 ) ) ( not ( = ?auto_194514 ?auto_194511 ) ) ( not ( = ?auto_194514 ?auto_194512 ) ) ( not ( = ?auto_194516 ?auto_194508 ) ) ( not ( = ?auto_194516 ?auto_194511 ) ) ( not ( = ?auto_194516 ?auto_194512 ) ) ( not ( = ?auto_194516 ?auto_194514 ) ) ( ON_BOARD ?auto_194518 ?auto_194523 ) ( SUPPORTS ?auto_194518 ?auto_194517 ) ( not ( = ?auto_194516 ?auto_194519 ) ) ( CALIBRATION_TARGET ?auto_194518 ?auto_194519 ) ( not ( = ?auto_194519 ?auto_194512 ) ) ( ON_BOARD ?auto_194525 ?auto_194523 ) ( not ( = ?auto_194518 ?auto_194525 ) ) ( SUPPORTS ?auto_194525 ?auto_194513 ) ( CALIBRATION_TARGET ?auto_194525 ?auto_194519 ) ( not ( = ?auto_194519 ?auto_194514 ) ) ( ON_BOARD ?auto_194522 ?auto_194523 ) ( not ( = ?auto_194525 ?auto_194522 ) ) ( SUPPORTS ?auto_194522 ?auto_194515 ) ( CALIBRATION_TARGET ?auto_194522 ?auto_194519 ) ( not ( = ?auto_194519 ?auto_194511 ) ) ( ON_BOARD ?auto_194521 ?auto_194523 ) ( not ( = ?auto_194522 ?auto_194521 ) ) ( SUPPORTS ?auto_194521 ?auto_194510 ) ( CALIBRATION_TARGET ?auto_194521 ?auto_194519 ) ( not ( = ?auto_194519 ?auto_194508 ) ) ( ON_BOARD ?auto_194524 ?auto_194523 ) ( not ( = ?auto_194521 ?auto_194524 ) ) ( SUPPORTS ?auto_194524 ?auto_194509 ) ( CALIBRATION_TARGET ?auto_194524 ?auto_194519 ) ( POWER_AVAIL ?auto_194523 ) ( POINTING ?auto_194523 ?auto_194520 ) ( not ( = ?auto_194519 ?auto_194520 ) ) ( not ( = ?auto_194508 ?auto_194520 ) ) ( not ( = ?auto_194509 ?auto_194510 ) ) ( not ( = ?auto_194511 ?auto_194520 ) ) ( not ( = ?auto_194509 ?auto_194515 ) ) ( not ( = ?auto_194510 ?auto_194515 ) ) ( not ( = ?auto_194514 ?auto_194520 ) ) ( not ( = ?auto_194522 ?auto_194524 ) ) ( not ( = ?auto_194509 ?auto_194513 ) ) ( not ( = ?auto_194510 ?auto_194513 ) ) ( not ( = ?auto_194515 ?auto_194513 ) ) ( not ( = ?auto_194512 ?auto_194520 ) ) ( not ( = ?auto_194525 ?auto_194521 ) ) ( not ( = ?auto_194525 ?auto_194524 ) ) ( not ( = ?auto_194509 ?auto_194517 ) ) ( not ( = ?auto_194510 ?auto_194517 ) ) ( not ( = ?auto_194515 ?auto_194517 ) ) ( not ( = ?auto_194513 ?auto_194517 ) ) ( not ( = ?auto_194516 ?auto_194520 ) ) ( not ( = ?auto_194518 ?auto_194522 ) ) ( not ( = ?auto_194518 ?auto_194521 ) ) ( not ( = ?auto_194518 ?auto_194524 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_194508 ?auto_194509 ?auto_194511 ?auto_194510 ?auto_194514 ?auto_194515 ?auto_194516 ?auto_194517 ?auto_194512 ?auto_194513 )
      ( GET-5IMAGE-VERIFY ?auto_194508 ?auto_194509 ?auto_194511 ?auto_194510 ?auto_194512 ?auto_194513 ?auto_194514 ?auto_194515 ?auto_194516 ?auto_194517 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_194586 - DIRECTION
      ?auto_194587 - MODE
      ?auto_194589 - DIRECTION
      ?auto_194588 - MODE
      ?auto_194590 - DIRECTION
      ?auto_194591 - MODE
      ?auto_194592 - DIRECTION
      ?auto_194593 - MODE
      ?auto_194594 - DIRECTION
      ?auto_194595 - MODE
    )
    :vars
    (
      ?auto_194596 - INSTRUMENT
      ?auto_194601 - SATELLITE
      ?auto_194597 - DIRECTION
      ?auto_194603 - INSTRUMENT
      ?auto_194600 - INSTRUMENT
      ?auto_194599 - INSTRUMENT
      ?auto_194602 - INSTRUMENT
      ?auto_194598 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_194589 ?auto_194586 ) ) ( not ( = ?auto_194590 ?auto_194586 ) ) ( not ( = ?auto_194590 ?auto_194589 ) ) ( not ( = ?auto_194592 ?auto_194586 ) ) ( not ( = ?auto_194592 ?auto_194589 ) ) ( not ( = ?auto_194592 ?auto_194590 ) ) ( not ( = ?auto_194594 ?auto_194586 ) ) ( not ( = ?auto_194594 ?auto_194589 ) ) ( not ( = ?auto_194594 ?auto_194590 ) ) ( not ( = ?auto_194594 ?auto_194592 ) ) ( ON_BOARD ?auto_194596 ?auto_194601 ) ( SUPPORTS ?auto_194596 ?auto_194593 ) ( not ( = ?auto_194592 ?auto_194597 ) ) ( CALIBRATION_TARGET ?auto_194596 ?auto_194597 ) ( not ( = ?auto_194597 ?auto_194590 ) ) ( ON_BOARD ?auto_194603 ?auto_194601 ) ( not ( = ?auto_194596 ?auto_194603 ) ) ( SUPPORTS ?auto_194603 ?auto_194591 ) ( CALIBRATION_TARGET ?auto_194603 ?auto_194597 ) ( not ( = ?auto_194597 ?auto_194594 ) ) ( ON_BOARD ?auto_194600 ?auto_194601 ) ( not ( = ?auto_194603 ?auto_194600 ) ) ( SUPPORTS ?auto_194600 ?auto_194595 ) ( CALIBRATION_TARGET ?auto_194600 ?auto_194597 ) ( not ( = ?auto_194597 ?auto_194589 ) ) ( ON_BOARD ?auto_194599 ?auto_194601 ) ( not ( = ?auto_194600 ?auto_194599 ) ) ( SUPPORTS ?auto_194599 ?auto_194588 ) ( CALIBRATION_TARGET ?auto_194599 ?auto_194597 ) ( not ( = ?auto_194597 ?auto_194586 ) ) ( ON_BOARD ?auto_194602 ?auto_194601 ) ( not ( = ?auto_194599 ?auto_194602 ) ) ( SUPPORTS ?auto_194602 ?auto_194587 ) ( CALIBRATION_TARGET ?auto_194602 ?auto_194597 ) ( POWER_AVAIL ?auto_194601 ) ( POINTING ?auto_194601 ?auto_194598 ) ( not ( = ?auto_194597 ?auto_194598 ) ) ( not ( = ?auto_194586 ?auto_194598 ) ) ( not ( = ?auto_194587 ?auto_194588 ) ) ( not ( = ?auto_194589 ?auto_194598 ) ) ( not ( = ?auto_194587 ?auto_194595 ) ) ( not ( = ?auto_194588 ?auto_194595 ) ) ( not ( = ?auto_194594 ?auto_194598 ) ) ( not ( = ?auto_194600 ?auto_194602 ) ) ( not ( = ?auto_194587 ?auto_194591 ) ) ( not ( = ?auto_194588 ?auto_194591 ) ) ( not ( = ?auto_194595 ?auto_194591 ) ) ( not ( = ?auto_194590 ?auto_194598 ) ) ( not ( = ?auto_194603 ?auto_194599 ) ) ( not ( = ?auto_194603 ?auto_194602 ) ) ( not ( = ?auto_194587 ?auto_194593 ) ) ( not ( = ?auto_194588 ?auto_194593 ) ) ( not ( = ?auto_194595 ?auto_194593 ) ) ( not ( = ?auto_194591 ?auto_194593 ) ) ( not ( = ?auto_194592 ?auto_194598 ) ) ( not ( = ?auto_194596 ?auto_194600 ) ) ( not ( = ?auto_194596 ?auto_194599 ) ) ( not ( = ?auto_194596 ?auto_194602 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_194586 ?auto_194587 ?auto_194589 ?auto_194588 ?auto_194594 ?auto_194595 ?auto_194592 ?auto_194593 ?auto_194590 ?auto_194591 )
      ( GET-5IMAGE-VERIFY ?auto_194586 ?auto_194587 ?auto_194589 ?auto_194588 ?auto_194590 ?auto_194591 ?auto_194592 ?auto_194593 ?auto_194594 ?auto_194595 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_194916 - DIRECTION
      ?auto_194917 - MODE
      ?auto_194919 - DIRECTION
      ?auto_194918 - MODE
      ?auto_194920 - DIRECTION
      ?auto_194921 - MODE
      ?auto_194922 - DIRECTION
      ?auto_194923 - MODE
      ?auto_194924 - DIRECTION
      ?auto_194925 - MODE
    )
    :vars
    (
      ?auto_194926 - INSTRUMENT
      ?auto_194931 - SATELLITE
      ?auto_194927 - DIRECTION
      ?auto_194933 - INSTRUMENT
      ?auto_194930 - INSTRUMENT
      ?auto_194929 - INSTRUMENT
      ?auto_194932 - INSTRUMENT
      ?auto_194928 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_194919 ?auto_194916 ) ) ( not ( = ?auto_194920 ?auto_194916 ) ) ( not ( = ?auto_194920 ?auto_194919 ) ) ( not ( = ?auto_194922 ?auto_194916 ) ) ( not ( = ?auto_194922 ?auto_194919 ) ) ( not ( = ?auto_194922 ?auto_194920 ) ) ( not ( = ?auto_194924 ?auto_194916 ) ) ( not ( = ?auto_194924 ?auto_194919 ) ) ( not ( = ?auto_194924 ?auto_194920 ) ) ( not ( = ?auto_194924 ?auto_194922 ) ) ( ON_BOARD ?auto_194926 ?auto_194931 ) ( SUPPORTS ?auto_194926 ?auto_194921 ) ( not ( = ?auto_194920 ?auto_194927 ) ) ( CALIBRATION_TARGET ?auto_194926 ?auto_194927 ) ( not ( = ?auto_194927 ?auto_194924 ) ) ( ON_BOARD ?auto_194933 ?auto_194931 ) ( not ( = ?auto_194926 ?auto_194933 ) ) ( SUPPORTS ?auto_194933 ?auto_194925 ) ( CALIBRATION_TARGET ?auto_194933 ?auto_194927 ) ( not ( = ?auto_194927 ?auto_194922 ) ) ( ON_BOARD ?auto_194930 ?auto_194931 ) ( not ( = ?auto_194933 ?auto_194930 ) ) ( SUPPORTS ?auto_194930 ?auto_194923 ) ( CALIBRATION_TARGET ?auto_194930 ?auto_194927 ) ( not ( = ?auto_194927 ?auto_194919 ) ) ( ON_BOARD ?auto_194929 ?auto_194931 ) ( not ( = ?auto_194930 ?auto_194929 ) ) ( SUPPORTS ?auto_194929 ?auto_194918 ) ( CALIBRATION_TARGET ?auto_194929 ?auto_194927 ) ( not ( = ?auto_194927 ?auto_194916 ) ) ( ON_BOARD ?auto_194932 ?auto_194931 ) ( not ( = ?auto_194929 ?auto_194932 ) ) ( SUPPORTS ?auto_194932 ?auto_194917 ) ( CALIBRATION_TARGET ?auto_194932 ?auto_194927 ) ( POWER_AVAIL ?auto_194931 ) ( POINTING ?auto_194931 ?auto_194928 ) ( not ( = ?auto_194927 ?auto_194928 ) ) ( not ( = ?auto_194916 ?auto_194928 ) ) ( not ( = ?auto_194917 ?auto_194918 ) ) ( not ( = ?auto_194919 ?auto_194928 ) ) ( not ( = ?auto_194917 ?auto_194923 ) ) ( not ( = ?auto_194918 ?auto_194923 ) ) ( not ( = ?auto_194922 ?auto_194928 ) ) ( not ( = ?auto_194930 ?auto_194932 ) ) ( not ( = ?auto_194917 ?auto_194925 ) ) ( not ( = ?auto_194918 ?auto_194925 ) ) ( not ( = ?auto_194923 ?auto_194925 ) ) ( not ( = ?auto_194924 ?auto_194928 ) ) ( not ( = ?auto_194933 ?auto_194929 ) ) ( not ( = ?auto_194933 ?auto_194932 ) ) ( not ( = ?auto_194917 ?auto_194921 ) ) ( not ( = ?auto_194918 ?auto_194921 ) ) ( not ( = ?auto_194923 ?auto_194921 ) ) ( not ( = ?auto_194925 ?auto_194921 ) ) ( not ( = ?auto_194920 ?auto_194928 ) ) ( not ( = ?auto_194926 ?auto_194930 ) ) ( not ( = ?auto_194926 ?auto_194929 ) ) ( not ( = ?auto_194926 ?auto_194932 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_194916 ?auto_194917 ?auto_194919 ?auto_194918 ?auto_194922 ?auto_194923 ?auto_194920 ?auto_194921 ?auto_194924 ?auto_194925 )
      ( GET-5IMAGE-VERIFY ?auto_194916 ?auto_194917 ?auto_194919 ?auto_194918 ?auto_194920 ?auto_194921 ?auto_194922 ?auto_194923 ?auto_194924 ?auto_194925 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_194994 - DIRECTION
      ?auto_194995 - MODE
      ?auto_194997 - DIRECTION
      ?auto_194996 - MODE
      ?auto_194998 - DIRECTION
      ?auto_194999 - MODE
      ?auto_195000 - DIRECTION
      ?auto_195001 - MODE
      ?auto_195002 - DIRECTION
      ?auto_195003 - MODE
    )
    :vars
    (
      ?auto_195004 - INSTRUMENT
      ?auto_195009 - SATELLITE
      ?auto_195005 - DIRECTION
      ?auto_195011 - INSTRUMENT
      ?auto_195008 - INSTRUMENT
      ?auto_195007 - INSTRUMENT
      ?auto_195010 - INSTRUMENT
      ?auto_195006 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_194997 ?auto_194994 ) ) ( not ( = ?auto_194998 ?auto_194994 ) ) ( not ( = ?auto_194998 ?auto_194997 ) ) ( not ( = ?auto_195000 ?auto_194994 ) ) ( not ( = ?auto_195000 ?auto_194997 ) ) ( not ( = ?auto_195000 ?auto_194998 ) ) ( not ( = ?auto_195002 ?auto_194994 ) ) ( not ( = ?auto_195002 ?auto_194997 ) ) ( not ( = ?auto_195002 ?auto_194998 ) ) ( not ( = ?auto_195002 ?auto_195000 ) ) ( ON_BOARD ?auto_195004 ?auto_195009 ) ( SUPPORTS ?auto_195004 ?auto_194999 ) ( not ( = ?auto_194998 ?auto_195005 ) ) ( CALIBRATION_TARGET ?auto_195004 ?auto_195005 ) ( not ( = ?auto_195005 ?auto_195000 ) ) ( ON_BOARD ?auto_195011 ?auto_195009 ) ( not ( = ?auto_195004 ?auto_195011 ) ) ( SUPPORTS ?auto_195011 ?auto_195001 ) ( CALIBRATION_TARGET ?auto_195011 ?auto_195005 ) ( not ( = ?auto_195005 ?auto_195002 ) ) ( ON_BOARD ?auto_195008 ?auto_195009 ) ( not ( = ?auto_195011 ?auto_195008 ) ) ( SUPPORTS ?auto_195008 ?auto_195003 ) ( CALIBRATION_TARGET ?auto_195008 ?auto_195005 ) ( not ( = ?auto_195005 ?auto_194997 ) ) ( ON_BOARD ?auto_195007 ?auto_195009 ) ( not ( = ?auto_195008 ?auto_195007 ) ) ( SUPPORTS ?auto_195007 ?auto_194996 ) ( CALIBRATION_TARGET ?auto_195007 ?auto_195005 ) ( not ( = ?auto_195005 ?auto_194994 ) ) ( ON_BOARD ?auto_195010 ?auto_195009 ) ( not ( = ?auto_195007 ?auto_195010 ) ) ( SUPPORTS ?auto_195010 ?auto_194995 ) ( CALIBRATION_TARGET ?auto_195010 ?auto_195005 ) ( POWER_AVAIL ?auto_195009 ) ( POINTING ?auto_195009 ?auto_195006 ) ( not ( = ?auto_195005 ?auto_195006 ) ) ( not ( = ?auto_194994 ?auto_195006 ) ) ( not ( = ?auto_194995 ?auto_194996 ) ) ( not ( = ?auto_194997 ?auto_195006 ) ) ( not ( = ?auto_194995 ?auto_195003 ) ) ( not ( = ?auto_194996 ?auto_195003 ) ) ( not ( = ?auto_195002 ?auto_195006 ) ) ( not ( = ?auto_195008 ?auto_195010 ) ) ( not ( = ?auto_194995 ?auto_195001 ) ) ( not ( = ?auto_194996 ?auto_195001 ) ) ( not ( = ?auto_195003 ?auto_195001 ) ) ( not ( = ?auto_195000 ?auto_195006 ) ) ( not ( = ?auto_195011 ?auto_195007 ) ) ( not ( = ?auto_195011 ?auto_195010 ) ) ( not ( = ?auto_194995 ?auto_194999 ) ) ( not ( = ?auto_194996 ?auto_194999 ) ) ( not ( = ?auto_195003 ?auto_194999 ) ) ( not ( = ?auto_195001 ?auto_194999 ) ) ( not ( = ?auto_194998 ?auto_195006 ) ) ( not ( = ?auto_195004 ?auto_195008 ) ) ( not ( = ?auto_195004 ?auto_195007 ) ) ( not ( = ?auto_195004 ?auto_195010 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_194994 ?auto_194995 ?auto_194997 ?auto_194996 ?auto_195002 ?auto_195003 ?auto_194998 ?auto_194999 ?auto_195000 ?auto_195001 )
      ( GET-5IMAGE-VERIFY ?auto_194994 ?auto_194995 ?auto_194997 ?auto_194996 ?auto_194998 ?auto_194999 ?auto_195000 ?auto_195001 ?auto_195002 ?auto_195003 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_195408 - DIRECTION
      ?auto_195409 - MODE
      ?auto_195411 - DIRECTION
      ?auto_195410 - MODE
      ?auto_195412 - DIRECTION
      ?auto_195413 - MODE
      ?auto_195414 - DIRECTION
      ?auto_195415 - MODE
      ?auto_195416 - DIRECTION
      ?auto_195417 - MODE
    )
    :vars
    (
      ?auto_195418 - INSTRUMENT
      ?auto_195423 - SATELLITE
      ?auto_195419 - DIRECTION
      ?auto_195425 - INSTRUMENT
      ?auto_195422 - INSTRUMENT
      ?auto_195421 - INSTRUMENT
      ?auto_195424 - INSTRUMENT
      ?auto_195420 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_195411 ?auto_195408 ) ) ( not ( = ?auto_195412 ?auto_195408 ) ) ( not ( = ?auto_195412 ?auto_195411 ) ) ( not ( = ?auto_195414 ?auto_195408 ) ) ( not ( = ?auto_195414 ?auto_195411 ) ) ( not ( = ?auto_195414 ?auto_195412 ) ) ( not ( = ?auto_195416 ?auto_195408 ) ) ( not ( = ?auto_195416 ?auto_195411 ) ) ( not ( = ?auto_195416 ?auto_195412 ) ) ( not ( = ?auto_195416 ?auto_195414 ) ) ( ON_BOARD ?auto_195418 ?auto_195423 ) ( SUPPORTS ?auto_195418 ?auto_195417 ) ( not ( = ?auto_195416 ?auto_195419 ) ) ( CALIBRATION_TARGET ?auto_195418 ?auto_195419 ) ( not ( = ?auto_195419 ?auto_195414 ) ) ( ON_BOARD ?auto_195425 ?auto_195423 ) ( not ( = ?auto_195418 ?auto_195425 ) ) ( SUPPORTS ?auto_195425 ?auto_195415 ) ( CALIBRATION_TARGET ?auto_195425 ?auto_195419 ) ( not ( = ?auto_195419 ?auto_195411 ) ) ( ON_BOARD ?auto_195422 ?auto_195423 ) ( not ( = ?auto_195425 ?auto_195422 ) ) ( SUPPORTS ?auto_195422 ?auto_195410 ) ( CALIBRATION_TARGET ?auto_195422 ?auto_195419 ) ( not ( = ?auto_195419 ?auto_195412 ) ) ( ON_BOARD ?auto_195421 ?auto_195423 ) ( not ( = ?auto_195422 ?auto_195421 ) ) ( SUPPORTS ?auto_195421 ?auto_195413 ) ( CALIBRATION_TARGET ?auto_195421 ?auto_195419 ) ( not ( = ?auto_195419 ?auto_195408 ) ) ( ON_BOARD ?auto_195424 ?auto_195423 ) ( not ( = ?auto_195421 ?auto_195424 ) ) ( SUPPORTS ?auto_195424 ?auto_195409 ) ( CALIBRATION_TARGET ?auto_195424 ?auto_195419 ) ( POWER_AVAIL ?auto_195423 ) ( POINTING ?auto_195423 ?auto_195420 ) ( not ( = ?auto_195419 ?auto_195420 ) ) ( not ( = ?auto_195408 ?auto_195420 ) ) ( not ( = ?auto_195409 ?auto_195413 ) ) ( not ( = ?auto_195412 ?auto_195420 ) ) ( not ( = ?auto_195409 ?auto_195410 ) ) ( not ( = ?auto_195413 ?auto_195410 ) ) ( not ( = ?auto_195411 ?auto_195420 ) ) ( not ( = ?auto_195422 ?auto_195424 ) ) ( not ( = ?auto_195409 ?auto_195415 ) ) ( not ( = ?auto_195413 ?auto_195415 ) ) ( not ( = ?auto_195410 ?auto_195415 ) ) ( not ( = ?auto_195414 ?auto_195420 ) ) ( not ( = ?auto_195425 ?auto_195421 ) ) ( not ( = ?auto_195425 ?auto_195424 ) ) ( not ( = ?auto_195409 ?auto_195417 ) ) ( not ( = ?auto_195413 ?auto_195417 ) ) ( not ( = ?auto_195410 ?auto_195417 ) ) ( not ( = ?auto_195415 ?auto_195417 ) ) ( not ( = ?auto_195416 ?auto_195420 ) ) ( not ( = ?auto_195418 ?auto_195422 ) ) ( not ( = ?auto_195418 ?auto_195421 ) ) ( not ( = ?auto_195418 ?auto_195424 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_195408 ?auto_195409 ?auto_195412 ?auto_195413 ?auto_195411 ?auto_195410 ?auto_195416 ?auto_195417 ?auto_195414 ?auto_195415 )
      ( GET-5IMAGE-VERIFY ?auto_195408 ?auto_195409 ?auto_195411 ?auto_195410 ?auto_195412 ?auto_195413 ?auto_195414 ?auto_195415 ?auto_195416 ?auto_195417 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_195486 - DIRECTION
      ?auto_195487 - MODE
      ?auto_195489 - DIRECTION
      ?auto_195488 - MODE
      ?auto_195490 - DIRECTION
      ?auto_195491 - MODE
      ?auto_195492 - DIRECTION
      ?auto_195493 - MODE
      ?auto_195494 - DIRECTION
      ?auto_195495 - MODE
    )
    :vars
    (
      ?auto_195496 - INSTRUMENT
      ?auto_195501 - SATELLITE
      ?auto_195497 - DIRECTION
      ?auto_195503 - INSTRUMENT
      ?auto_195500 - INSTRUMENT
      ?auto_195499 - INSTRUMENT
      ?auto_195502 - INSTRUMENT
      ?auto_195498 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_195489 ?auto_195486 ) ) ( not ( = ?auto_195490 ?auto_195486 ) ) ( not ( = ?auto_195490 ?auto_195489 ) ) ( not ( = ?auto_195492 ?auto_195486 ) ) ( not ( = ?auto_195492 ?auto_195489 ) ) ( not ( = ?auto_195492 ?auto_195490 ) ) ( not ( = ?auto_195494 ?auto_195486 ) ) ( not ( = ?auto_195494 ?auto_195489 ) ) ( not ( = ?auto_195494 ?auto_195490 ) ) ( not ( = ?auto_195494 ?auto_195492 ) ) ( ON_BOARD ?auto_195496 ?auto_195501 ) ( SUPPORTS ?auto_195496 ?auto_195493 ) ( not ( = ?auto_195492 ?auto_195497 ) ) ( CALIBRATION_TARGET ?auto_195496 ?auto_195497 ) ( not ( = ?auto_195497 ?auto_195494 ) ) ( ON_BOARD ?auto_195503 ?auto_195501 ) ( not ( = ?auto_195496 ?auto_195503 ) ) ( SUPPORTS ?auto_195503 ?auto_195495 ) ( CALIBRATION_TARGET ?auto_195503 ?auto_195497 ) ( not ( = ?auto_195497 ?auto_195489 ) ) ( ON_BOARD ?auto_195500 ?auto_195501 ) ( not ( = ?auto_195503 ?auto_195500 ) ) ( SUPPORTS ?auto_195500 ?auto_195488 ) ( CALIBRATION_TARGET ?auto_195500 ?auto_195497 ) ( not ( = ?auto_195497 ?auto_195490 ) ) ( ON_BOARD ?auto_195499 ?auto_195501 ) ( not ( = ?auto_195500 ?auto_195499 ) ) ( SUPPORTS ?auto_195499 ?auto_195491 ) ( CALIBRATION_TARGET ?auto_195499 ?auto_195497 ) ( not ( = ?auto_195497 ?auto_195486 ) ) ( ON_BOARD ?auto_195502 ?auto_195501 ) ( not ( = ?auto_195499 ?auto_195502 ) ) ( SUPPORTS ?auto_195502 ?auto_195487 ) ( CALIBRATION_TARGET ?auto_195502 ?auto_195497 ) ( POWER_AVAIL ?auto_195501 ) ( POINTING ?auto_195501 ?auto_195498 ) ( not ( = ?auto_195497 ?auto_195498 ) ) ( not ( = ?auto_195486 ?auto_195498 ) ) ( not ( = ?auto_195487 ?auto_195491 ) ) ( not ( = ?auto_195490 ?auto_195498 ) ) ( not ( = ?auto_195487 ?auto_195488 ) ) ( not ( = ?auto_195491 ?auto_195488 ) ) ( not ( = ?auto_195489 ?auto_195498 ) ) ( not ( = ?auto_195500 ?auto_195502 ) ) ( not ( = ?auto_195487 ?auto_195495 ) ) ( not ( = ?auto_195491 ?auto_195495 ) ) ( not ( = ?auto_195488 ?auto_195495 ) ) ( not ( = ?auto_195494 ?auto_195498 ) ) ( not ( = ?auto_195503 ?auto_195499 ) ) ( not ( = ?auto_195503 ?auto_195502 ) ) ( not ( = ?auto_195487 ?auto_195493 ) ) ( not ( = ?auto_195491 ?auto_195493 ) ) ( not ( = ?auto_195488 ?auto_195493 ) ) ( not ( = ?auto_195495 ?auto_195493 ) ) ( not ( = ?auto_195492 ?auto_195498 ) ) ( not ( = ?auto_195496 ?auto_195500 ) ) ( not ( = ?auto_195496 ?auto_195499 ) ) ( not ( = ?auto_195496 ?auto_195502 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_195486 ?auto_195487 ?auto_195490 ?auto_195491 ?auto_195489 ?auto_195488 ?auto_195492 ?auto_195493 ?auto_195494 ?auto_195495 )
      ( GET-5IMAGE-VERIFY ?auto_195486 ?auto_195487 ?auto_195489 ?auto_195488 ?auto_195490 ?auto_195491 ?auto_195492 ?auto_195493 ?auto_195494 ?auto_195495 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_195734 - DIRECTION
      ?auto_195735 - MODE
      ?auto_195737 - DIRECTION
      ?auto_195736 - MODE
      ?auto_195738 - DIRECTION
      ?auto_195739 - MODE
      ?auto_195740 - DIRECTION
      ?auto_195741 - MODE
      ?auto_195742 - DIRECTION
      ?auto_195743 - MODE
    )
    :vars
    (
      ?auto_195744 - INSTRUMENT
      ?auto_195749 - SATELLITE
      ?auto_195745 - DIRECTION
      ?auto_195751 - INSTRUMENT
      ?auto_195748 - INSTRUMENT
      ?auto_195747 - INSTRUMENT
      ?auto_195750 - INSTRUMENT
      ?auto_195746 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_195737 ?auto_195734 ) ) ( not ( = ?auto_195738 ?auto_195734 ) ) ( not ( = ?auto_195738 ?auto_195737 ) ) ( not ( = ?auto_195740 ?auto_195734 ) ) ( not ( = ?auto_195740 ?auto_195737 ) ) ( not ( = ?auto_195740 ?auto_195738 ) ) ( not ( = ?auto_195742 ?auto_195734 ) ) ( not ( = ?auto_195742 ?auto_195737 ) ) ( not ( = ?auto_195742 ?auto_195738 ) ) ( not ( = ?auto_195742 ?auto_195740 ) ) ( ON_BOARD ?auto_195744 ?auto_195749 ) ( SUPPORTS ?auto_195744 ?auto_195743 ) ( not ( = ?auto_195742 ?auto_195745 ) ) ( CALIBRATION_TARGET ?auto_195744 ?auto_195745 ) ( not ( = ?auto_195745 ?auto_195738 ) ) ( ON_BOARD ?auto_195751 ?auto_195749 ) ( not ( = ?auto_195744 ?auto_195751 ) ) ( SUPPORTS ?auto_195751 ?auto_195739 ) ( CALIBRATION_TARGET ?auto_195751 ?auto_195745 ) ( not ( = ?auto_195745 ?auto_195737 ) ) ( ON_BOARD ?auto_195748 ?auto_195749 ) ( not ( = ?auto_195751 ?auto_195748 ) ) ( SUPPORTS ?auto_195748 ?auto_195736 ) ( CALIBRATION_TARGET ?auto_195748 ?auto_195745 ) ( not ( = ?auto_195745 ?auto_195740 ) ) ( ON_BOARD ?auto_195747 ?auto_195749 ) ( not ( = ?auto_195748 ?auto_195747 ) ) ( SUPPORTS ?auto_195747 ?auto_195741 ) ( CALIBRATION_TARGET ?auto_195747 ?auto_195745 ) ( not ( = ?auto_195745 ?auto_195734 ) ) ( ON_BOARD ?auto_195750 ?auto_195749 ) ( not ( = ?auto_195747 ?auto_195750 ) ) ( SUPPORTS ?auto_195750 ?auto_195735 ) ( CALIBRATION_TARGET ?auto_195750 ?auto_195745 ) ( POWER_AVAIL ?auto_195749 ) ( POINTING ?auto_195749 ?auto_195746 ) ( not ( = ?auto_195745 ?auto_195746 ) ) ( not ( = ?auto_195734 ?auto_195746 ) ) ( not ( = ?auto_195735 ?auto_195741 ) ) ( not ( = ?auto_195740 ?auto_195746 ) ) ( not ( = ?auto_195735 ?auto_195736 ) ) ( not ( = ?auto_195741 ?auto_195736 ) ) ( not ( = ?auto_195737 ?auto_195746 ) ) ( not ( = ?auto_195748 ?auto_195750 ) ) ( not ( = ?auto_195735 ?auto_195739 ) ) ( not ( = ?auto_195741 ?auto_195739 ) ) ( not ( = ?auto_195736 ?auto_195739 ) ) ( not ( = ?auto_195738 ?auto_195746 ) ) ( not ( = ?auto_195751 ?auto_195747 ) ) ( not ( = ?auto_195751 ?auto_195750 ) ) ( not ( = ?auto_195735 ?auto_195743 ) ) ( not ( = ?auto_195741 ?auto_195743 ) ) ( not ( = ?auto_195736 ?auto_195743 ) ) ( not ( = ?auto_195739 ?auto_195743 ) ) ( not ( = ?auto_195742 ?auto_195746 ) ) ( not ( = ?auto_195744 ?auto_195748 ) ) ( not ( = ?auto_195744 ?auto_195747 ) ) ( not ( = ?auto_195744 ?auto_195750 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_195734 ?auto_195735 ?auto_195740 ?auto_195741 ?auto_195737 ?auto_195736 ?auto_195742 ?auto_195743 ?auto_195738 ?auto_195739 )
      ( GET-5IMAGE-VERIFY ?auto_195734 ?auto_195735 ?auto_195737 ?auto_195736 ?auto_195738 ?auto_195739 ?auto_195740 ?auto_195741 ?auto_195742 ?auto_195743 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_195812 - DIRECTION
      ?auto_195813 - MODE
      ?auto_195815 - DIRECTION
      ?auto_195814 - MODE
      ?auto_195816 - DIRECTION
      ?auto_195817 - MODE
      ?auto_195818 - DIRECTION
      ?auto_195819 - MODE
      ?auto_195820 - DIRECTION
      ?auto_195821 - MODE
    )
    :vars
    (
      ?auto_195822 - INSTRUMENT
      ?auto_195827 - SATELLITE
      ?auto_195823 - DIRECTION
      ?auto_195829 - INSTRUMENT
      ?auto_195826 - INSTRUMENT
      ?auto_195825 - INSTRUMENT
      ?auto_195828 - INSTRUMENT
      ?auto_195824 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_195815 ?auto_195812 ) ) ( not ( = ?auto_195816 ?auto_195812 ) ) ( not ( = ?auto_195816 ?auto_195815 ) ) ( not ( = ?auto_195818 ?auto_195812 ) ) ( not ( = ?auto_195818 ?auto_195815 ) ) ( not ( = ?auto_195818 ?auto_195816 ) ) ( not ( = ?auto_195820 ?auto_195812 ) ) ( not ( = ?auto_195820 ?auto_195815 ) ) ( not ( = ?auto_195820 ?auto_195816 ) ) ( not ( = ?auto_195820 ?auto_195818 ) ) ( ON_BOARD ?auto_195822 ?auto_195827 ) ( SUPPORTS ?auto_195822 ?auto_195819 ) ( not ( = ?auto_195818 ?auto_195823 ) ) ( CALIBRATION_TARGET ?auto_195822 ?auto_195823 ) ( not ( = ?auto_195823 ?auto_195816 ) ) ( ON_BOARD ?auto_195829 ?auto_195827 ) ( not ( = ?auto_195822 ?auto_195829 ) ) ( SUPPORTS ?auto_195829 ?auto_195817 ) ( CALIBRATION_TARGET ?auto_195829 ?auto_195823 ) ( not ( = ?auto_195823 ?auto_195815 ) ) ( ON_BOARD ?auto_195826 ?auto_195827 ) ( not ( = ?auto_195829 ?auto_195826 ) ) ( SUPPORTS ?auto_195826 ?auto_195814 ) ( CALIBRATION_TARGET ?auto_195826 ?auto_195823 ) ( not ( = ?auto_195823 ?auto_195820 ) ) ( ON_BOARD ?auto_195825 ?auto_195827 ) ( not ( = ?auto_195826 ?auto_195825 ) ) ( SUPPORTS ?auto_195825 ?auto_195821 ) ( CALIBRATION_TARGET ?auto_195825 ?auto_195823 ) ( not ( = ?auto_195823 ?auto_195812 ) ) ( ON_BOARD ?auto_195828 ?auto_195827 ) ( not ( = ?auto_195825 ?auto_195828 ) ) ( SUPPORTS ?auto_195828 ?auto_195813 ) ( CALIBRATION_TARGET ?auto_195828 ?auto_195823 ) ( POWER_AVAIL ?auto_195827 ) ( POINTING ?auto_195827 ?auto_195824 ) ( not ( = ?auto_195823 ?auto_195824 ) ) ( not ( = ?auto_195812 ?auto_195824 ) ) ( not ( = ?auto_195813 ?auto_195821 ) ) ( not ( = ?auto_195820 ?auto_195824 ) ) ( not ( = ?auto_195813 ?auto_195814 ) ) ( not ( = ?auto_195821 ?auto_195814 ) ) ( not ( = ?auto_195815 ?auto_195824 ) ) ( not ( = ?auto_195826 ?auto_195828 ) ) ( not ( = ?auto_195813 ?auto_195817 ) ) ( not ( = ?auto_195821 ?auto_195817 ) ) ( not ( = ?auto_195814 ?auto_195817 ) ) ( not ( = ?auto_195816 ?auto_195824 ) ) ( not ( = ?auto_195829 ?auto_195825 ) ) ( not ( = ?auto_195829 ?auto_195828 ) ) ( not ( = ?auto_195813 ?auto_195819 ) ) ( not ( = ?auto_195821 ?auto_195819 ) ) ( not ( = ?auto_195814 ?auto_195819 ) ) ( not ( = ?auto_195817 ?auto_195819 ) ) ( not ( = ?auto_195818 ?auto_195824 ) ) ( not ( = ?auto_195822 ?auto_195826 ) ) ( not ( = ?auto_195822 ?auto_195825 ) ) ( not ( = ?auto_195822 ?auto_195828 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_195812 ?auto_195813 ?auto_195820 ?auto_195821 ?auto_195815 ?auto_195814 ?auto_195818 ?auto_195819 ?auto_195816 ?auto_195817 )
      ( GET-5IMAGE-VERIFY ?auto_195812 ?auto_195813 ?auto_195815 ?auto_195814 ?auto_195816 ?auto_195817 ?auto_195818 ?auto_195819 ?auto_195820 ?auto_195821 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_196056 - DIRECTION
      ?auto_196057 - MODE
      ?auto_196059 - DIRECTION
      ?auto_196058 - MODE
      ?auto_196060 - DIRECTION
      ?auto_196061 - MODE
      ?auto_196062 - DIRECTION
      ?auto_196063 - MODE
      ?auto_196064 - DIRECTION
      ?auto_196065 - MODE
    )
    :vars
    (
      ?auto_196066 - INSTRUMENT
      ?auto_196071 - SATELLITE
      ?auto_196067 - DIRECTION
      ?auto_196073 - INSTRUMENT
      ?auto_196070 - INSTRUMENT
      ?auto_196069 - INSTRUMENT
      ?auto_196072 - INSTRUMENT
      ?auto_196068 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_196059 ?auto_196056 ) ) ( not ( = ?auto_196060 ?auto_196056 ) ) ( not ( = ?auto_196060 ?auto_196059 ) ) ( not ( = ?auto_196062 ?auto_196056 ) ) ( not ( = ?auto_196062 ?auto_196059 ) ) ( not ( = ?auto_196062 ?auto_196060 ) ) ( not ( = ?auto_196064 ?auto_196056 ) ) ( not ( = ?auto_196064 ?auto_196059 ) ) ( not ( = ?auto_196064 ?auto_196060 ) ) ( not ( = ?auto_196064 ?auto_196062 ) ) ( ON_BOARD ?auto_196066 ?auto_196071 ) ( SUPPORTS ?auto_196066 ?auto_196061 ) ( not ( = ?auto_196060 ?auto_196067 ) ) ( CALIBRATION_TARGET ?auto_196066 ?auto_196067 ) ( not ( = ?auto_196067 ?auto_196064 ) ) ( ON_BOARD ?auto_196073 ?auto_196071 ) ( not ( = ?auto_196066 ?auto_196073 ) ) ( SUPPORTS ?auto_196073 ?auto_196065 ) ( CALIBRATION_TARGET ?auto_196073 ?auto_196067 ) ( not ( = ?auto_196067 ?auto_196059 ) ) ( ON_BOARD ?auto_196070 ?auto_196071 ) ( not ( = ?auto_196073 ?auto_196070 ) ) ( SUPPORTS ?auto_196070 ?auto_196058 ) ( CALIBRATION_TARGET ?auto_196070 ?auto_196067 ) ( not ( = ?auto_196067 ?auto_196062 ) ) ( ON_BOARD ?auto_196069 ?auto_196071 ) ( not ( = ?auto_196070 ?auto_196069 ) ) ( SUPPORTS ?auto_196069 ?auto_196063 ) ( CALIBRATION_TARGET ?auto_196069 ?auto_196067 ) ( not ( = ?auto_196067 ?auto_196056 ) ) ( ON_BOARD ?auto_196072 ?auto_196071 ) ( not ( = ?auto_196069 ?auto_196072 ) ) ( SUPPORTS ?auto_196072 ?auto_196057 ) ( CALIBRATION_TARGET ?auto_196072 ?auto_196067 ) ( POWER_AVAIL ?auto_196071 ) ( POINTING ?auto_196071 ?auto_196068 ) ( not ( = ?auto_196067 ?auto_196068 ) ) ( not ( = ?auto_196056 ?auto_196068 ) ) ( not ( = ?auto_196057 ?auto_196063 ) ) ( not ( = ?auto_196062 ?auto_196068 ) ) ( not ( = ?auto_196057 ?auto_196058 ) ) ( not ( = ?auto_196063 ?auto_196058 ) ) ( not ( = ?auto_196059 ?auto_196068 ) ) ( not ( = ?auto_196070 ?auto_196072 ) ) ( not ( = ?auto_196057 ?auto_196065 ) ) ( not ( = ?auto_196063 ?auto_196065 ) ) ( not ( = ?auto_196058 ?auto_196065 ) ) ( not ( = ?auto_196064 ?auto_196068 ) ) ( not ( = ?auto_196073 ?auto_196069 ) ) ( not ( = ?auto_196073 ?auto_196072 ) ) ( not ( = ?auto_196057 ?auto_196061 ) ) ( not ( = ?auto_196063 ?auto_196061 ) ) ( not ( = ?auto_196058 ?auto_196061 ) ) ( not ( = ?auto_196065 ?auto_196061 ) ) ( not ( = ?auto_196060 ?auto_196068 ) ) ( not ( = ?auto_196066 ?auto_196070 ) ) ( not ( = ?auto_196066 ?auto_196069 ) ) ( not ( = ?auto_196066 ?auto_196072 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_196056 ?auto_196057 ?auto_196062 ?auto_196063 ?auto_196059 ?auto_196058 ?auto_196060 ?auto_196061 ?auto_196064 ?auto_196065 )
      ( GET-5IMAGE-VERIFY ?auto_196056 ?auto_196057 ?auto_196059 ?auto_196058 ?auto_196060 ?auto_196061 ?auto_196062 ?auto_196063 ?auto_196064 ?auto_196065 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_196220 - DIRECTION
      ?auto_196221 - MODE
      ?auto_196223 - DIRECTION
      ?auto_196222 - MODE
      ?auto_196224 - DIRECTION
      ?auto_196225 - MODE
      ?auto_196226 - DIRECTION
      ?auto_196227 - MODE
      ?auto_196228 - DIRECTION
      ?auto_196229 - MODE
    )
    :vars
    (
      ?auto_196230 - INSTRUMENT
      ?auto_196235 - SATELLITE
      ?auto_196231 - DIRECTION
      ?auto_196237 - INSTRUMENT
      ?auto_196234 - INSTRUMENT
      ?auto_196233 - INSTRUMENT
      ?auto_196236 - INSTRUMENT
      ?auto_196232 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_196223 ?auto_196220 ) ) ( not ( = ?auto_196224 ?auto_196220 ) ) ( not ( = ?auto_196224 ?auto_196223 ) ) ( not ( = ?auto_196226 ?auto_196220 ) ) ( not ( = ?auto_196226 ?auto_196223 ) ) ( not ( = ?auto_196226 ?auto_196224 ) ) ( not ( = ?auto_196228 ?auto_196220 ) ) ( not ( = ?auto_196228 ?auto_196223 ) ) ( not ( = ?auto_196228 ?auto_196224 ) ) ( not ( = ?auto_196228 ?auto_196226 ) ) ( ON_BOARD ?auto_196230 ?auto_196235 ) ( SUPPORTS ?auto_196230 ?auto_196225 ) ( not ( = ?auto_196224 ?auto_196231 ) ) ( CALIBRATION_TARGET ?auto_196230 ?auto_196231 ) ( not ( = ?auto_196231 ?auto_196226 ) ) ( ON_BOARD ?auto_196237 ?auto_196235 ) ( not ( = ?auto_196230 ?auto_196237 ) ) ( SUPPORTS ?auto_196237 ?auto_196227 ) ( CALIBRATION_TARGET ?auto_196237 ?auto_196231 ) ( not ( = ?auto_196231 ?auto_196223 ) ) ( ON_BOARD ?auto_196234 ?auto_196235 ) ( not ( = ?auto_196237 ?auto_196234 ) ) ( SUPPORTS ?auto_196234 ?auto_196222 ) ( CALIBRATION_TARGET ?auto_196234 ?auto_196231 ) ( not ( = ?auto_196231 ?auto_196228 ) ) ( ON_BOARD ?auto_196233 ?auto_196235 ) ( not ( = ?auto_196234 ?auto_196233 ) ) ( SUPPORTS ?auto_196233 ?auto_196229 ) ( CALIBRATION_TARGET ?auto_196233 ?auto_196231 ) ( not ( = ?auto_196231 ?auto_196220 ) ) ( ON_BOARD ?auto_196236 ?auto_196235 ) ( not ( = ?auto_196233 ?auto_196236 ) ) ( SUPPORTS ?auto_196236 ?auto_196221 ) ( CALIBRATION_TARGET ?auto_196236 ?auto_196231 ) ( POWER_AVAIL ?auto_196235 ) ( POINTING ?auto_196235 ?auto_196232 ) ( not ( = ?auto_196231 ?auto_196232 ) ) ( not ( = ?auto_196220 ?auto_196232 ) ) ( not ( = ?auto_196221 ?auto_196229 ) ) ( not ( = ?auto_196228 ?auto_196232 ) ) ( not ( = ?auto_196221 ?auto_196222 ) ) ( not ( = ?auto_196229 ?auto_196222 ) ) ( not ( = ?auto_196223 ?auto_196232 ) ) ( not ( = ?auto_196234 ?auto_196236 ) ) ( not ( = ?auto_196221 ?auto_196227 ) ) ( not ( = ?auto_196229 ?auto_196227 ) ) ( not ( = ?auto_196222 ?auto_196227 ) ) ( not ( = ?auto_196226 ?auto_196232 ) ) ( not ( = ?auto_196237 ?auto_196233 ) ) ( not ( = ?auto_196237 ?auto_196236 ) ) ( not ( = ?auto_196221 ?auto_196225 ) ) ( not ( = ?auto_196229 ?auto_196225 ) ) ( not ( = ?auto_196222 ?auto_196225 ) ) ( not ( = ?auto_196227 ?auto_196225 ) ) ( not ( = ?auto_196224 ?auto_196232 ) ) ( not ( = ?auto_196230 ?auto_196234 ) ) ( not ( = ?auto_196230 ?auto_196233 ) ) ( not ( = ?auto_196230 ?auto_196236 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_196220 ?auto_196221 ?auto_196228 ?auto_196229 ?auto_196223 ?auto_196222 ?auto_196224 ?auto_196225 ?auto_196226 ?auto_196227 )
      ( GET-5IMAGE-VERIFY ?auto_196220 ?auto_196221 ?auto_196223 ?auto_196222 ?auto_196224 ?auto_196225 ?auto_196226 ?auto_196227 ?auto_196228 ?auto_196229 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_196634 - DIRECTION
      ?auto_196635 - MODE
      ?auto_196637 - DIRECTION
      ?auto_196636 - MODE
      ?auto_196638 - DIRECTION
      ?auto_196639 - MODE
      ?auto_196640 - DIRECTION
      ?auto_196641 - MODE
      ?auto_196642 - DIRECTION
      ?auto_196643 - MODE
    )
    :vars
    (
      ?auto_196644 - INSTRUMENT
      ?auto_196649 - SATELLITE
      ?auto_196645 - DIRECTION
      ?auto_196651 - INSTRUMENT
      ?auto_196648 - INSTRUMENT
      ?auto_196647 - INSTRUMENT
      ?auto_196650 - INSTRUMENT
      ?auto_196646 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_196637 ?auto_196634 ) ) ( not ( = ?auto_196638 ?auto_196634 ) ) ( not ( = ?auto_196638 ?auto_196637 ) ) ( not ( = ?auto_196640 ?auto_196634 ) ) ( not ( = ?auto_196640 ?auto_196637 ) ) ( not ( = ?auto_196640 ?auto_196638 ) ) ( not ( = ?auto_196642 ?auto_196634 ) ) ( not ( = ?auto_196642 ?auto_196637 ) ) ( not ( = ?auto_196642 ?auto_196638 ) ) ( not ( = ?auto_196642 ?auto_196640 ) ) ( ON_BOARD ?auto_196644 ?auto_196649 ) ( SUPPORTS ?auto_196644 ?auto_196643 ) ( not ( = ?auto_196642 ?auto_196645 ) ) ( CALIBRATION_TARGET ?auto_196644 ?auto_196645 ) ( not ( = ?auto_196645 ?auto_196637 ) ) ( ON_BOARD ?auto_196651 ?auto_196649 ) ( not ( = ?auto_196644 ?auto_196651 ) ) ( SUPPORTS ?auto_196651 ?auto_196636 ) ( CALIBRATION_TARGET ?auto_196651 ?auto_196645 ) ( not ( = ?auto_196645 ?auto_196640 ) ) ( ON_BOARD ?auto_196648 ?auto_196649 ) ( not ( = ?auto_196651 ?auto_196648 ) ) ( SUPPORTS ?auto_196648 ?auto_196641 ) ( CALIBRATION_TARGET ?auto_196648 ?auto_196645 ) ( not ( = ?auto_196645 ?auto_196638 ) ) ( ON_BOARD ?auto_196647 ?auto_196649 ) ( not ( = ?auto_196648 ?auto_196647 ) ) ( SUPPORTS ?auto_196647 ?auto_196639 ) ( CALIBRATION_TARGET ?auto_196647 ?auto_196645 ) ( not ( = ?auto_196645 ?auto_196634 ) ) ( ON_BOARD ?auto_196650 ?auto_196649 ) ( not ( = ?auto_196647 ?auto_196650 ) ) ( SUPPORTS ?auto_196650 ?auto_196635 ) ( CALIBRATION_TARGET ?auto_196650 ?auto_196645 ) ( POWER_AVAIL ?auto_196649 ) ( POINTING ?auto_196649 ?auto_196646 ) ( not ( = ?auto_196645 ?auto_196646 ) ) ( not ( = ?auto_196634 ?auto_196646 ) ) ( not ( = ?auto_196635 ?auto_196639 ) ) ( not ( = ?auto_196638 ?auto_196646 ) ) ( not ( = ?auto_196635 ?auto_196641 ) ) ( not ( = ?auto_196639 ?auto_196641 ) ) ( not ( = ?auto_196640 ?auto_196646 ) ) ( not ( = ?auto_196648 ?auto_196650 ) ) ( not ( = ?auto_196635 ?auto_196636 ) ) ( not ( = ?auto_196639 ?auto_196636 ) ) ( not ( = ?auto_196641 ?auto_196636 ) ) ( not ( = ?auto_196637 ?auto_196646 ) ) ( not ( = ?auto_196651 ?auto_196647 ) ) ( not ( = ?auto_196651 ?auto_196650 ) ) ( not ( = ?auto_196635 ?auto_196643 ) ) ( not ( = ?auto_196639 ?auto_196643 ) ) ( not ( = ?auto_196641 ?auto_196643 ) ) ( not ( = ?auto_196636 ?auto_196643 ) ) ( not ( = ?auto_196642 ?auto_196646 ) ) ( not ( = ?auto_196644 ?auto_196648 ) ) ( not ( = ?auto_196644 ?auto_196647 ) ) ( not ( = ?auto_196644 ?auto_196650 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_196634 ?auto_196635 ?auto_196638 ?auto_196639 ?auto_196640 ?auto_196641 ?auto_196642 ?auto_196643 ?auto_196637 ?auto_196636 )
      ( GET-5IMAGE-VERIFY ?auto_196634 ?auto_196635 ?auto_196637 ?auto_196636 ?auto_196638 ?auto_196639 ?auto_196640 ?auto_196641 ?auto_196642 ?auto_196643 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_196712 - DIRECTION
      ?auto_196713 - MODE
      ?auto_196715 - DIRECTION
      ?auto_196714 - MODE
      ?auto_196716 - DIRECTION
      ?auto_196717 - MODE
      ?auto_196718 - DIRECTION
      ?auto_196719 - MODE
      ?auto_196720 - DIRECTION
      ?auto_196721 - MODE
    )
    :vars
    (
      ?auto_196722 - INSTRUMENT
      ?auto_196727 - SATELLITE
      ?auto_196723 - DIRECTION
      ?auto_196729 - INSTRUMENT
      ?auto_196726 - INSTRUMENT
      ?auto_196725 - INSTRUMENT
      ?auto_196728 - INSTRUMENT
      ?auto_196724 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_196715 ?auto_196712 ) ) ( not ( = ?auto_196716 ?auto_196712 ) ) ( not ( = ?auto_196716 ?auto_196715 ) ) ( not ( = ?auto_196718 ?auto_196712 ) ) ( not ( = ?auto_196718 ?auto_196715 ) ) ( not ( = ?auto_196718 ?auto_196716 ) ) ( not ( = ?auto_196720 ?auto_196712 ) ) ( not ( = ?auto_196720 ?auto_196715 ) ) ( not ( = ?auto_196720 ?auto_196716 ) ) ( not ( = ?auto_196720 ?auto_196718 ) ) ( ON_BOARD ?auto_196722 ?auto_196727 ) ( SUPPORTS ?auto_196722 ?auto_196719 ) ( not ( = ?auto_196718 ?auto_196723 ) ) ( CALIBRATION_TARGET ?auto_196722 ?auto_196723 ) ( not ( = ?auto_196723 ?auto_196715 ) ) ( ON_BOARD ?auto_196729 ?auto_196727 ) ( not ( = ?auto_196722 ?auto_196729 ) ) ( SUPPORTS ?auto_196729 ?auto_196714 ) ( CALIBRATION_TARGET ?auto_196729 ?auto_196723 ) ( not ( = ?auto_196723 ?auto_196720 ) ) ( ON_BOARD ?auto_196726 ?auto_196727 ) ( not ( = ?auto_196729 ?auto_196726 ) ) ( SUPPORTS ?auto_196726 ?auto_196721 ) ( CALIBRATION_TARGET ?auto_196726 ?auto_196723 ) ( not ( = ?auto_196723 ?auto_196716 ) ) ( ON_BOARD ?auto_196725 ?auto_196727 ) ( not ( = ?auto_196726 ?auto_196725 ) ) ( SUPPORTS ?auto_196725 ?auto_196717 ) ( CALIBRATION_TARGET ?auto_196725 ?auto_196723 ) ( not ( = ?auto_196723 ?auto_196712 ) ) ( ON_BOARD ?auto_196728 ?auto_196727 ) ( not ( = ?auto_196725 ?auto_196728 ) ) ( SUPPORTS ?auto_196728 ?auto_196713 ) ( CALIBRATION_TARGET ?auto_196728 ?auto_196723 ) ( POWER_AVAIL ?auto_196727 ) ( POINTING ?auto_196727 ?auto_196724 ) ( not ( = ?auto_196723 ?auto_196724 ) ) ( not ( = ?auto_196712 ?auto_196724 ) ) ( not ( = ?auto_196713 ?auto_196717 ) ) ( not ( = ?auto_196716 ?auto_196724 ) ) ( not ( = ?auto_196713 ?auto_196721 ) ) ( not ( = ?auto_196717 ?auto_196721 ) ) ( not ( = ?auto_196720 ?auto_196724 ) ) ( not ( = ?auto_196726 ?auto_196728 ) ) ( not ( = ?auto_196713 ?auto_196714 ) ) ( not ( = ?auto_196717 ?auto_196714 ) ) ( not ( = ?auto_196721 ?auto_196714 ) ) ( not ( = ?auto_196715 ?auto_196724 ) ) ( not ( = ?auto_196729 ?auto_196725 ) ) ( not ( = ?auto_196729 ?auto_196728 ) ) ( not ( = ?auto_196713 ?auto_196719 ) ) ( not ( = ?auto_196717 ?auto_196719 ) ) ( not ( = ?auto_196721 ?auto_196719 ) ) ( not ( = ?auto_196714 ?auto_196719 ) ) ( not ( = ?auto_196718 ?auto_196724 ) ) ( not ( = ?auto_196722 ?auto_196726 ) ) ( not ( = ?auto_196722 ?auto_196725 ) ) ( not ( = ?auto_196722 ?auto_196728 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_196712 ?auto_196713 ?auto_196716 ?auto_196717 ?auto_196720 ?auto_196721 ?auto_196718 ?auto_196719 ?auto_196715 ?auto_196714 )
      ( GET-5IMAGE-VERIFY ?auto_196712 ?auto_196713 ?auto_196715 ?auto_196714 ?auto_196716 ?auto_196717 ?auto_196718 ?auto_196719 ?auto_196720 ?auto_196721 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_196790 - DIRECTION
      ?auto_196791 - MODE
      ?auto_196793 - DIRECTION
      ?auto_196792 - MODE
      ?auto_196794 - DIRECTION
      ?auto_196795 - MODE
      ?auto_196796 - DIRECTION
      ?auto_196797 - MODE
      ?auto_196798 - DIRECTION
      ?auto_196799 - MODE
    )
    :vars
    (
      ?auto_196800 - INSTRUMENT
      ?auto_196805 - SATELLITE
      ?auto_196801 - DIRECTION
      ?auto_196807 - INSTRUMENT
      ?auto_196804 - INSTRUMENT
      ?auto_196803 - INSTRUMENT
      ?auto_196806 - INSTRUMENT
      ?auto_196802 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_196793 ?auto_196790 ) ) ( not ( = ?auto_196794 ?auto_196790 ) ) ( not ( = ?auto_196794 ?auto_196793 ) ) ( not ( = ?auto_196796 ?auto_196790 ) ) ( not ( = ?auto_196796 ?auto_196793 ) ) ( not ( = ?auto_196796 ?auto_196794 ) ) ( not ( = ?auto_196798 ?auto_196790 ) ) ( not ( = ?auto_196798 ?auto_196793 ) ) ( not ( = ?auto_196798 ?auto_196794 ) ) ( not ( = ?auto_196798 ?auto_196796 ) ) ( ON_BOARD ?auto_196800 ?auto_196805 ) ( SUPPORTS ?auto_196800 ?auto_196799 ) ( not ( = ?auto_196798 ?auto_196801 ) ) ( CALIBRATION_TARGET ?auto_196800 ?auto_196801 ) ( not ( = ?auto_196801 ?auto_196793 ) ) ( ON_BOARD ?auto_196807 ?auto_196805 ) ( not ( = ?auto_196800 ?auto_196807 ) ) ( SUPPORTS ?auto_196807 ?auto_196792 ) ( CALIBRATION_TARGET ?auto_196807 ?auto_196801 ) ( not ( = ?auto_196801 ?auto_196794 ) ) ( ON_BOARD ?auto_196804 ?auto_196805 ) ( not ( = ?auto_196807 ?auto_196804 ) ) ( SUPPORTS ?auto_196804 ?auto_196795 ) ( CALIBRATION_TARGET ?auto_196804 ?auto_196801 ) ( not ( = ?auto_196801 ?auto_196796 ) ) ( ON_BOARD ?auto_196803 ?auto_196805 ) ( not ( = ?auto_196804 ?auto_196803 ) ) ( SUPPORTS ?auto_196803 ?auto_196797 ) ( CALIBRATION_TARGET ?auto_196803 ?auto_196801 ) ( not ( = ?auto_196801 ?auto_196790 ) ) ( ON_BOARD ?auto_196806 ?auto_196805 ) ( not ( = ?auto_196803 ?auto_196806 ) ) ( SUPPORTS ?auto_196806 ?auto_196791 ) ( CALIBRATION_TARGET ?auto_196806 ?auto_196801 ) ( POWER_AVAIL ?auto_196805 ) ( POINTING ?auto_196805 ?auto_196802 ) ( not ( = ?auto_196801 ?auto_196802 ) ) ( not ( = ?auto_196790 ?auto_196802 ) ) ( not ( = ?auto_196791 ?auto_196797 ) ) ( not ( = ?auto_196796 ?auto_196802 ) ) ( not ( = ?auto_196791 ?auto_196795 ) ) ( not ( = ?auto_196797 ?auto_196795 ) ) ( not ( = ?auto_196794 ?auto_196802 ) ) ( not ( = ?auto_196804 ?auto_196806 ) ) ( not ( = ?auto_196791 ?auto_196792 ) ) ( not ( = ?auto_196797 ?auto_196792 ) ) ( not ( = ?auto_196795 ?auto_196792 ) ) ( not ( = ?auto_196793 ?auto_196802 ) ) ( not ( = ?auto_196807 ?auto_196803 ) ) ( not ( = ?auto_196807 ?auto_196806 ) ) ( not ( = ?auto_196791 ?auto_196799 ) ) ( not ( = ?auto_196797 ?auto_196799 ) ) ( not ( = ?auto_196795 ?auto_196799 ) ) ( not ( = ?auto_196792 ?auto_196799 ) ) ( not ( = ?auto_196798 ?auto_196802 ) ) ( not ( = ?auto_196800 ?auto_196804 ) ) ( not ( = ?auto_196800 ?auto_196803 ) ) ( not ( = ?auto_196800 ?auto_196806 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_196790 ?auto_196791 ?auto_196796 ?auto_196797 ?auto_196794 ?auto_196795 ?auto_196798 ?auto_196799 ?auto_196793 ?auto_196792 )
      ( GET-5IMAGE-VERIFY ?auto_196790 ?auto_196791 ?auto_196793 ?auto_196792 ?auto_196794 ?auto_196795 ?auto_196796 ?auto_196797 ?auto_196798 ?auto_196799 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_196868 - DIRECTION
      ?auto_196869 - MODE
      ?auto_196871 - DIRECTION
      ?auto_196870 - MODE
      ?auto_196872 - DIRECTION
      ?auto_196873 - MODE
      ?auto_196874 - DIRECTION
      ?auto_196875 - MODE
      ?auto_196876 - DIRECTION
      ?auto_196877 - MODE
    )
    :vars
    (
      ?auto_196878 - INSTRUMENT
      ?auto_196883 - SATELLITE
      ?auto_196879 - DIRECTION
      ?auto_196885 - INSTRUMENT
      ?auto_196882 - INSTRUMENT
      ?auto_196881 - INSTRUMENT
      ?auto_196884 - INSTRUMENT
      ?auto_196880 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_196871 ?auto_196868 ) ) ( not ( = ?auto_196872 ?auto_196868 ) ) ( not ( = ?auto_196872 ?auto_196871 ) ) ( not ( = ?auto_196874 ?auto_196868 ) ) ( not ( = ?auto_196874 ?auto_196871 ) ) ( not ( = ?auto_196874 ?auto_196872 ) ) ( not ( = ?auto_196876 ?auto_196868 ) ) ( not ( = ?auto_196876 ?auto_196871 ) ) ( not ( = ?auto_196876 ?auto_196872 ) ) ( not ( = ?auto_196876 ?auto_196874 ) ) ( ON_BOARD ?auto_196878 ?auto_196883 ) ( SUPPORTS ?auto_196878 ?auto_196875 ) ( not ( = ?auto_196874 ?auto_196879 ) ) ( CALIBRATION_TARGET ?auto_196878 ?auto_196879 ) ( not ( = ?auto_196879 ?auto_196871 ) ) ( ON_BOARD ?auto_196885 ?auto_196883 ) ( not ( = ?auto_196878 ?auto_196885 ) ) ( SUPPORTS ?auto_196885 ?auto_196870 ) ( CALIBRATION_TARGET ?auto_196885 ?auto_196879 ) ( not ( = ?auto_196879 ?auto_196872 ) ) ( ON_BOARD ?auto_196882 ?auto_196883 ) ( not ( = ?auto_196885 ?auto_196882 ) ) ( SUPPORTS ?auto_196882 ?auto_196873 ) ( CALIBRATION_TARGET ?auto_196882 ?auto_196879 ) ( not ( = ?auto_196879 ?auto_196876 ) ) ( ON_BOARD ?auto_196881 ?auto_196883 ) ( not ( = ?auto_196882 ?auto_196881 ) ) ( SUPPORTS ?auto_196881 ?auto_196877 ) ( CALIBRATION_TARGET ?auto_196881 ?auto_196879 ) ( not ( = ?auto_196879 ?auto_196868 ) ) ( ON_BOARD ?auto_196884 ?auto_196883 ) ( not ( = ?auto_196881 ?auto_196884 ) ) ( SUPPORTS ?auto_196884 ?auto_196869 ) ( CALIBRATION_TARGET ?auto_196884 ?auto_196879 ) ( POWER_AVAIL ?auto_196883 ) ( POINTING ?auto_196883 ?auto_196880 ) ( not ( = ?auto_196879 ?auto_196880 ) ) ( not ( = ?auto_196868 ?auto_196880 ) ) ( not ( = ?auto_196869 ?auto_196877 ) ) ( not ( = ?auto_196876 ?auto_196880 ) ) ( not ( = ?auto_196869 ?auto_196873 ) ) ( not ( = ?auto_196877 ?auto_196873 ) ) ( not ( = ?auto_196872 ?auto_196880 ) ) ( not ( = ?auto_196882 ?auto_196884 ) ) ( not ( = ?auto_196869 ?auto_196870 ) ) ( not ( = ?auto_196877 ?auto_196870 ) ) ( not ( = ?auto_196873 ?auto_196870 ) ) ( not ( = ?auto_196871 ?auto_196880 ) ) ( not ( = ?auto_196885 ?auto_196881 ) ) ( not ( = ?auto_196885 ?auto_196884 ) ) ( not ( = ?auto_196869 ?auto_196875 ) ) ( not ( = ?auto_196877 ?auto_196875 ) ) ( not ( = ?auto_196873 ?auto_196875 ) ) ( not ( = ?auto_196870 ?auto_196875 ) ) ( not ( = ?auto_196874 ?auto_196880 ) ) ( not ( = ?auto_196878 ?auto_196882 ) ) ( not ( = ?auto_196878 ?auto_196881 ) ) ( not ( = ?auto_196878 ?auto_196884 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_196868 ?auto_196869 ?auto_196876 ?auto_196877 ?auto_196872 ?auto_196873 ?auto_196874 ?auto_196875 ?auto_196871 ?auto_196870 )
      ( GET-5IMAGE-VERIFY ?auto_196868 ?auto_196869 ?auto_196871 ?auto_196870 ?auto_196872 ?auto_196873 ?auto_196874 ?auto_196875 ?auto_196876 ?auto_196877 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_197282 - DIRECTION
      ?auto_197283 - MODE
      ?auto_197285 - DIRECTION
      ?auto_197284 - MODE
      ?auto_197286 - DIRECTION
      ?auto_197287 - MODE
      ?auto_197288 - DIRECTION
      ?auto_197289 - MODE
      ?auto_197290 - DIRECTION
      ?auto_197291 - MODE
    )
    :vars
    (
      ?auto_197292 - INSTRUMENT
      ?auto_197297 - SATELLITE
      ?auto_197293 - DIRECTION
      ?auto_197299 - INSTRUMENT
      ?auto_197296 - INSTRUMENT
      ?auto_197295 - INSTRUMENT
      ?auto_197298 - INSTRUMENT
      ?auto_197294 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_197285 ?auto_197282 ) ) ( not ( = ?auto_197286 ?auto_197282 ) ) ( not ( = ?auto_197286 ?auto_197285 ) ) ( not ( = ?auto_197288 ?auto_197282 ) ) ( not ( = ?auto_197288 ?auto_197285 ) ) ( not ( = ?auto_197288 ?auto_197286 ) ) ( not ( = ?auto_197290 ?auto_197282 ) ) ( not ( = ?auto_197290 ?auto_197285 ) ) ( not ( = ?auto_197290 ?auto_197286 ) ) ( not ( = ?auto_197290 ?auto_197288 ) ) ( ON_BOARD ?auto_197292 ?auto_197297 ) ( SUPPORTS ?auto_197292 ?auto_197287 ) ( not ( = ?auto_197286 ?auto_197293 ) ) ( CALIBRATION_TARGET ?auto_197292 ?auto_197293 ) ( not ( = ?auto_197293 ?auto_197285 ) ) ( ON_BOARD ?auto_197299 ?auto_197297 ) ( not ( = ?auto_197292 ?auto_197299 ) ) ( SUPPORTS ?auto_197299 ?auto_197284 ) ( CALIBRATION_TARGET ?auto_197299 ?auto_197293 ) ( not ( = ?auto_197293 ?auto_197290 ) ) ( ON_BOARD ?auto_197296 ?auto_197297 ) ( not ( = ?auto_197299 ?auto_197296 ) ) ( SUPPORTS ?auto_197296 ?auto_197291 ) ( CALIBRATION_TARGET ?auto_197296 ?auto_197293 ) ( not ( = ?auto_197293 ?auto_197288 ) ) ( ON_BOARD ?auto_197295 ?auto_197297 ) ( not ( = ?auto_197296 ?auto_197295 ) ) ( SUPPORTS ?auto_197295 ?auto_197289 ) ( CALIBRATION_TARGET ?auto_197295 ?auto_197293 ) ( not ( = ?auto_197293 ?auto_197282 ) ) ( ON_BOARD ?auto_197298 ?auto_197297 ) ( not ( = ?auto_197295 ?auto_197298 ) ) ( SUPPORTS ?auto_197298 ?auto_197283 ) ( CALIBRATION_TARGET ?auto_197298 ?auto_197293 ) ( POWER_AVAIL ?auto_197297 ) ( POINTING ?auto_197297 ?auto_197294 ) ( not ( = ?auto_197293 ?auto_197294 ) ) ( not ( = ?auto_197282 ?auto_197294 ) ) ( not ( = ?auto_197283 ?auto_197289 ) ) ( not ( = ?auto_197288 ?auto_197294 ) ) ( not ( = ?auto_197283 ?auto_197291 ) ) ( not ( = ?auto_197289 ?auto_197291 ) ) ( not ( = ?auto_197290 ?auto_197294 ) ) ( not ( = ?auto_197296 ?auto_197298 ) ) ( not ( = ?auto_197283 ?auto_197284 ) ) ( not ( = ?auto_197289 ?auto_197284 ) ) ( not ( = ?auto_197291 ?auto_197284 ) ) ( not ( = ?auto_197285 ?auto_197294 ) ) ( not ( = ?auto_197299 ?auto_197295 ) ) ( not ( = ?auto_197299 ?auto_197298 ) ) ( not ( = ?auto_197283 ?auto_197287 ) ) ( not ( = ?auto_197289 ?auto_197287 ) ) ( not ( = ?auto_197291 ?auto_197287 ) ) ( not ( = ?auto_197284 ?auto_197287 ) ) ( not ( = ?auto_197286 ?auto_197294 ) ) ( not ( = ?auto_197292 ?auto_197296 ) ) ( not ( = ?auto_197292 ?auto_197295 ) ) ( not ( = ?auto_197292 ?auto_197298 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_197282 ?auto_197283 ?auto_197288 ?auto_197289 ?auto_197290 ?auto_197291 ?auto_197286 ?auto_197287 ?auto_197285 ?auto_197284 )
      ( GET-5IMAGE-VERIFY ?auto_197282 ?auto_197283 ?auto_197285 ?auto_197284 ?auto_197286 ?auto_197287 ?auto_197288 ?auto_197289 ?auto_197290 ?auto_197291 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_197360 - DIRECTION
      ?auto_197361 - MODE
      ?auto_197363 - DIRECTION
      ?auto_197362 - MODE
      ?auto_197364 - DIRECTION
      ?auto_197365 - MODE
      ?auto_197366 - DIRECTION
      ?auto_197367 - MODE
      ?auto_197368 - DIRECTION
      ?auto_197369 - MODE
    )
    :vars
    (
      ?auto_197370 - INSTRUMENT
      ?auto_197375 - SATELLITE
      ?auto_197371 - DIRECTION
      ?auto_197377 - INSTRUMENT
      ?auto_197374 - INSTRUMENT
      ?auto_197373 - INSTRUMENT
      ?auto_197376 - INSTRUMENT
      ?auto_197372 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_197363 ?auto_197360 ) ) ( not ( = ?auto_197364 ?auto_197360 ) ) ( not ( = ?auto_197364 ?auto_197363 ) ) ( not ( = ?auto_197366 ?auto_197360 ) ) ( not ( = ?auto_197366 ?auto_197363 ) ) ( not ( = ?auto_197366 ?auto_197364 ) ) ( not ( = ?auto_197368 ?auto_197360 ) ) ( not ( = ?auto_197368 ?auto_197363 ) ) ( not ( = ?auto_197368 ?auto_197364 ) ) ( not ( = ?auto_197368 ?auto_197366 ) ) ( ON_BOARD ?auto_197370 ?auto_197375 ) ( SUPPORTS ?auto_197370 ?auto_197365 ) ( not ( = ?auto_197364 ?auto_197371 ) ) ( CALIBRATION_TARGET ?auto_197370 ?auto_197371 ) ( not ( = ?auto_197371 ?auto_197363 ) ) ( ON_BOARD ?auto_197377 ?auto_197375 ) ( not ( = ?auto_197370 ?auto_197377 ) ) ( SUPPORTS ?auto_197377 ?auto_197362 ) ( CALIBRATION_TARGET ?auto_197377 ?auto_197371 ) ( not ( = ?auto_197371 ?auto_197366 ) ) ( ON_BOARD ?auto_197374 ?auto_197375 ) ( not ( = ?auto_197377 ?auto_197374 ) ) ( SUPPORTS ?auto_197374 ?auto_197367 ) ( CALIBRATION_TARGET ?auto_197374 ?auto_197371 ) ( not ( = ?auto_197371 ?auto_197368 ) ) ( ON_BOARD ?auto_197373 ?auto_197375 ) ( not ( = ?auto_197374 ?auto_197373 ) ) ( SUPPORTS ?auto_197373 ?auto_197369 ) ( CALIBRATION_TARGET ?auto_197373 ?auto_197371 ) ( not ( = ?auto_197371 ?auto_197360 ) ) ( ON_BOARD ?auto_197376 ?auto_197375 ) ( not ( = ?auto_197373 ?auto_197376 ) ) ( SUPPORTS ?auto_197376 ?auto_197361 ) ( CALIBRATION_TARGET ?auto_197376 ?auto_197371 ) ( POWER_AVAIL ?auto_197375 ) ( POINTING ?auto_197375 ?auto_197372 ) ( not ( = ?auto_197371 ?auto_197372 ) ) ( not ( = ?auto_197360 ?auto_197372 ) ) ( not ( = ?auto_197361 ?auto_197369 ) ) ( not ( = ?auto_197368 ?auto_197372 ) ) ( not ( = ?auto_197361 ?auto_197367 ) ) ( not ( = ?auto_197369 ?auto_197367 ) ) ( not ( = ?auto_197366 ?auto_197372 ) ) ( not ( = ?auto_197374 ?auto_197376 ) ) ( not ( = ?auto_197361 ?auto_197362 ) ) ( not ( = ?auto_197369 ?auto_197362 ) ) ( not ( = ?auto_197367 ?auto_197362 ) ) ( not ( = ?auto_197363 ?auto_197372 ) ) ( not ( = ?auto_197377 ?auto_197373 ) ) ( not ( = ?auto_197377 ?auto_197376 ) ) ( not ( = ?auto_197361 ?auto_197365 ) ) ( not ( = ?auto_197369 ?auto_197365 ) ) ( not ( = ?auto_197367 ?auto_197365 ) ) ( not ( = ?auto_197362 ?auto_197365 ) ) ( not ( = ?auto_197364 ?auto_197372 ) ) ( not ( = ?auto_197370 ?auto_197374 ) ) ( not ( = ?auto_197370 ?auto_197373 ) ) ( not ( = ?auto_197370 ?auto_197376 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_197360 ?auto_197361 ?auto_197368 ?auto_197369 ?auto_197366 ?auto_197367 ?auto_197364 ?auto_197365 ?auto_197363 ?auto_197362 )
      ( GET-5IMAGE-VERIFY ?auto_197360 ?auto_197361 ?auto_197363 ?auto_197362 ?auto_197364 ?auto_197365 ?auto_197366 ?auto_197367 ?auto_197368 ?auto_197369 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_198468 - DIRECTION
      ?auto_198469 - MODE
      ?auto_198471 - DIRECTION
      ?auto_198470 - MODE
      ?auto_198472 - DIRECTION
      ?auto_198473 - MODE
      ?auto_198474 - DIRECTION
      ?auto_198475 - MODE
      ?auto_198476 - DIRECTION
      ?auto_198477 - MODE
    )
    :vars
    (
      ?auto_198478 - INSTRUMENT
      ?auto_198483 - SATELLITE
      ?auto_198479 - DIRECTION
      ?auto_198485 - INSTRUMENT
      ?auto_198482 - INSTRUMENT
      ?auto_198481 - INSTRUMENT
      ?auto_198484 - INSTRUMENT
      ?auto_198480 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_198471 ?auto_198468 ) ) ( not ( = ?auto_198472 ?auto_198468 ) ) ( not ( = ?auto_198472 ?auto_198471 ) ) ( not ( = ?auto_198474 ?auto_198468 ) ) ( not ( = ?auto_198474 ?auto_198471 ) ) ( not ( = ?auto_198474 ?auto_198472 ) ) ( not ( = ?auto_198476 ?auto_198468 ) ) ( not ( = ?auto_198476 ?auto_198471 ) ) ( not ( = ?auto_198476 ?auto_198472 ) ) ( not ( = ?auto_198476 ?auto_198474 ) ) ( ON_BOARD ?auto_198478 ?auto_198483 ) ( SUPPORTS ?auto_198478 ?auto_198470 ) ( not ( = ?auto_198471 ?auto_198479 ) ) ( CALIBRATION_TARGET ?auto_198478 ?auto_198479 ) ( not ( = ?auto_198479 ?auto_198476 ) ) ( ON_BOARD ?auto_198485 ?auto_198483 ) ( not ( = ?auto_198478 ?auto_198485 ) ) ( SUPPORTS ?auto_198485 ?auto_198477 ) ( CALIBRATION_TARGET ?auto_198485 ?auto_198479 ) ( not ( = ?auto_198479 ?auto_198474 ) ) ( ON_BOARD ?auto_198482 ?auto_198483 ) ( not ( = ?auto_198485 ?auto_198482 ) ) ( SUPPORTS ?auto_198482 ?auto_198475 ) ( CALIBRATION_TARGET ?auto_198482 ?auto_198479 ) ( not ( = ?auto_198479 ?auto_198472 ) ) ( ON_BOARD ?auto_198481 ?auto_198483 ) ( not ( = ?auto_198482 ?auto_198481 ) ) ( SUPPORTS ?auto_198481 ?auto_198473 ) ( CALIBRATION_TARGET ?auto_198481 ?auto_198479 ) ( not ( = ?auto_198479 ?auto_198468 ) ) ( ON_BOARD ?auto_198484 ?auto_198483 ) ( not ( = ?auto_198481 ?auto_198484 ) ) ( SUPPORTS ?auto_198484 ?auto_198469 ) ( CALIBRATION_TARGET ?auto_198484 ?auto_198479 ) ( POWER_AVAIL ?auto_198483 ) ( POINTING ?auto_198483 ?auto_198480 ) ( not ( = ?auto_198479 ?auto_198480 ) ) ( not ( = ?auto_198468 ?auto_198480 ) ) ( not ( = ?auto_198469 ?auto_198473 ) ) ( not ( = ?auto_198472 ?auto_198480 ) ) ( not ( = ?auto_198469 ?auto_198475 ) ) ( not ( = ?auto_198473 ?auto_198475 ) ) ( not ( = ?auto_198474 ?auto_198480 ) ) ( not ( = ?auto_198482 ?auto_198484 ) ) ( not ( = ?auto_198469 ?auto_198477 ) ) ( not ( = ?auto_198473 ?auto_198477 ) ) ( not ( = ?auto_198475 ?auto_198477 ) ) ( not ( = ?auto_198476 ?auto_198480 ) ) ( not ( = ?auto_198485 ?auto_198481 ) ) ( not ( = ?auto_198485 ?auto_198484 ) ) ( not ( = ?auto_198469 ?auto_198470 ) ) ( not ( = ?auto_198473 ?auto_198470 ) ) ( not ( = ?auto_198475 ?auto_198470 ) ) ( not ( = ?auto_198477 ?auto_198470 ) ) ( not ( = ?auto_198471 ?auto_198480 ) ) ( not ( = ?auto_198478 ?auto_198482 ) ) ( not ( = ?auto_198478 ?auto_198481 ) ) ( not ( = ?auto_198478 ?auto_198484 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_198468 ?auto_198469 ?auto_198472 ?auto_198473 ?auto_198474 ?auto_198475 ?auto_198471 ?auto_198470 ?auto_198476 ?auto_198477 )
      ( GET-5IMAGE-VERIFY ?auto_198468 ?auto_198469 ?auto_198471 ?auto_198470 ?auto_198472 ?auto_198473 ?auto_198474 ?auto_198475 ?auto_198476 ?auto_198477 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_198546 - DIRECTION
      ?auto_198547 - MODE
      ?auto_198549 - DIRECTION
      ?auto_198548 - MODE
      ?auto_198550 - DIRECTION
      ?auto_198551 - MODE
      ?auto_198552 - DIRECTION
      ?auto_198553 - MODE
      ?auto_198554 - DIRECTION
      ?auto_198555 - MODE
    )
    :vars
    (
      ?auto_198556 - INSTRUMENT
      ?auto_198561 - SATELLITE
      ?auto_198557 - DIRECTION
      ?auto_198563 - INSTRUMENT
      ?auto_198560 - INSTRUMENT
      ?auto_198559 - INSTRUMENT
      ?auto_198562 - INSTRUMENT
      ?auto_198558 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_198549 ?auto_198546 ) ) ( not ( = ?auto_198550 ?auto_198546 ) ) ( not ( = ?auto_198550 ?auto_198549 ) ) ( not ( = ?auto_198552 ?auto_198546 ) ) ( not ( = ?auto_198552 ?auto_198549 ) ) ( not ( = ?auto_198552 ?auto_198550 ) ) ( not ( = ?auto_198554 ?auto_198546 ) ) ( not ( = ?auto_198554 ?auto_198549 ) ) ( not ( = ?auto_198554 ?auto_198550 ) ) ( not ( = ?auto_198554 ?auto_198552 ) ) ( ON_BOARD ?auto_198556 ?auto_198561 ) ( SUPPORTS ?auto_198556 ?auto_198548 ) ( not ( = ?auto_198549 ?auto_198557 ) ) ( CALIBRATION_TARGET ?auto_198556 ?auto_198557 ) ( not ( = ?auto_198557 ?auto_198552 ) ) ( ON_BOARD ?auto_198563 ?auto_198561 ) ( not ( = ?auto_198556 ?auto_198563 ) ) ( SUPPORTS ?auto_198563 ?auto_198553 ) ( CALIBRATION_TARGET ?auto_198563 ?auto_198557 ) ( not ( = ?auto_198557 ?auto_198554 ) ) ( ON_BOARD ?auto_198560 ?auto_198561 ) ( not ( = ?auto_198563 ?auto_198560 ) ) ( SUPPORTS ?auto_198560 ?auto_198555 ) ( CALIBRATION_TARGET ?auto_198560 ?auto_198557 ) ( not ( = ?auto_198557 ?auto_198550 ) ) ( ON_BOARD ?auto_198559 ?auto_198561 ) ( not ( = ?auto_198560 ?auto_198559 ) ) ( SUPPORTS ?auto_198559 ?auto_198551 ) ( CALIBRATION_TARGET ?auto_198559 ?auto_198557 ) ( not ( = ?auto_198557 ?auto_198546 ) ) ( ON_BOARD ?auto_198562 ?auto_198561 ) ( not ( = ?auto_198559 ?auto_198562 ) ) ( SUPPORTS ?auto_198562 ?auto_198547 ) ( CALIBRATION_TARGET ?auto_198562 ?auto_198557 ) ( POWER_AVAIL ?auto_198561 ) ( POINTING ?auto_198561 ?auto_198558 ) ( not ( = ?auto_198557 ?auto_198558 ) ) ( not ( = ?auto_198546 ?auto_198558 ) ) ( not ( = ?auto_198547 ?auto_198551 ) ) ( not ( = ?auto_198550 ?auto_198558 ) ) ( not ( = ?auto_198547 ?auto_198555 ) ) ( not ( = ?auto_198551 ?auto_198555 ) ) ( not ( = ?auto_198554 ?auto_198558 ) ) ( not ( = ?auto_198560 ?auto_198562 ) ) ( not ( = ?auto_198547 ?auto_198553 ) ) ( not ( = ?auto_198551 ?auto_198553 ) ) ( not ( = ?auto_198555 ?auto_198553 ) ) ( not ( = ?auto_198552 ?auto_198558 ) ) ( not ( = ?auto_198563 ?auto_198559 ) ) ( not ( = ?auto_198563 ?auto_198562 ) ) ( not ( = ?auto_198547 ?auto_198548 ) ) ( not ( = ?auto_198551 ?auto_198548 ) ) ( not ( = ?auto_198555 ?auto_198548 ) ) ( not ( = ?auto_198553 ?auto_198548 ) ) ( not ( = ?auto_198549 ?auto_198558 ) ) ( not ( = ?auto_198556 ?auto_198560 ) ) ( not ( = ?auto_198556 ?auto_198559 ) ) ( not ( = ?auto_198556 ?auto_198562 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_198546 ?auto_198547 ?auto_198550 ?auto_198551 ?auto_198554 ?auto_198555 ?auto_198549 ?auto_198548 ?auto_198552 ?auto_198553 )
      ( GET-5IMAGE-VERIFY ?auto_198546 ?auto_198547 ?auto_198549 ?auto_198548 ?auto_198550 ?auto_198551 ?auto_198552 ?auto_198553 ?auto_198554 ?auto_198555 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_198876 - DIRECTION
      ?auto_198877 - MODE
      ?auto_198879 - DIRECTION
      ?auto_198878 - MODE
      ?auto_198880 - DIRECTION
      ?auto_198881 - MODE
      ?auto_198882 - DIRECTION
      ?auto_198883 - MODE
      ?auto_198884 - DIRECTION
      ?auto_198885 - MODE
    )
    :vars
    (
      ?auto_198886 - INSTRUMENT
      ?auto_198891 - SATELLITE
      ?auto_198887 - DIRECTION
      ?auto_198893 - INSTRUMENT
      ?auto_198890 - INSTRUMENT
      ?auto_198889 - INSTRUMENT
      ?auto_198892 - INSTRUMENT
      ?auto_198888 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_198879 ?auto_198876 ) ) ( not ( = ?auto_198880 ?auto_198876 ) ) ( not ( = ?auto_198880 ?auto_198879 ) ) ( not ( = ?auto_198882 ?auto_198876 ) ) ( not ( = ?auto_198882 ?auto_198879 ) ) ( not ( = ?auto_198882 ?auto_198880 ) ) ( not ( = ?auto_198884 ?auto_198876 ) ) ( not ( = ?auto_198884 ?auto_198879 ) ) ( not ( = ?auto_198884 ?auto_198880 ) ) ( not ( = ?auto_198884 ?auto_198882 ) ) ( ON_BOARD ?auto_198886 ?auto_198891 ) ( SUPPORTS ?auto_198886 ?auto_198878 ) ( not ( = ?auto_198879 ?auto_198887 ) ) ( CALIBRATION_TARGET ?auto_198886 ?auto_198887 ) ( not ( = ?auto_198887 ?auto_198884 ) ) ( ON_BOARD ?auto_198893 ?auto_198891 ) ( not ( = ?auto_198886 ?auto_198893 ) ) ( SUPPORTS ?auto_198893 ?auto_198885 ) ( CALIBRATION_TARGET ?auto_198893 ?auto_198887 ) ( not ( = ?auto_198887 ?auto_198880 ) ) ( ON_BOARD ?auto_198890 ?auto_198891 ) ( not ( = ?auto_198893 ?auto_198890 ) ) ( SUPPORTS ?auto_198890 ?auto_198881 ) ( CALIBRATION_TARGET ?auto_198890 ?auto_198887 ) ( not ( = ?auto_198887 ?auto_198882 ) ) ( ON_BOARD ?auto_198889 ?auto_198891 ) ( not ( = ?auto_198890 ?auto_198889 ) ) ( SUPPORTS ?auto_198889 ?auto_198883 ) ( CALIBRATION_TARGET ?auto_198889 ?auto_198887 ) ( not ( = ?auto_198887 ?auto_198876 ) ) ( ON_BOARD ?auto_198892 ?auto_198891 ) ( not ( = ?auto_198889 ?auto_198892 ) ) ( SUPPORTS ?auto_198892 ?auto_198877 ) ( CALIBRATION_TARGET ?auto_198892 ?auto_198887 ) ( POWER_AVAIL ?auto_198891 ) ( POINTING ?auto_198891 ?auto_198888 ) ( not ( = ?auto_198887 ?auto_198888 ) ) ( not ( = ?auto_198876 ?auto_198888 ) ) ( not ( = ?auto_198877 ?auto_198883 ) ) ( not ( = ?auto_198882 ?auto_198888 ) ) ( not ( = ?auto_198877 ?auto_198881 ) ) ( not ( = ?auto_198883 ?auto_198881 ) ) ( not ( = ?auto_198880 ?auto_198888 ) ) ( not ( = ?auto_198890 ?auto_198892 ) ) ( not ( = ?auto_198877 ?auto_198885 ) ) ( not ( = ?auto_198883 ?auto_198885 ) ) ( not ( = ?auto_198881 ?auto_198885 ) ) ( not ( = ?auto_198884 ?auto_198888 ) ) ( not ( = ?auto_198893 ?auto_198889 ) ) ( not ( = ?auto_198893 ?auto_198892 ) ) ( not ( = ?auto_198877 ?auto_198878 ) ) ( not ( = ?auto_198883 ?auto_198878 ) ) ( not ( = ?auto_198881 ?auto_198878 ) ) ( not ( = ?auto_198885 ?auto_198878 ) ) ( not ( = ?auto_198879 ?auto_198888 ) ) ( not ( = ?auto_198886 ?auto_198890 ) ) ( not ( = ?auto_198886 ?auto_198889 ) ) ( not ( = ?auto_198886 ?auto_198892 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_198876 ?auto_198877 ?auto_198882 ?auto_198883 ?auto_198880 ?auto_198881 ?auto_198879 ?auto_198878 ?auto_198884 ?auto_198885 )
      ( GET-5IMAGE-VERIFY ?auto_198876 ?auto_198877 ?auto_198879 ?auto_198878 ?auto_198880 ?auto_198881 ?auto_198882 ?auto_198883 ?auto_198884 ?auto_198885 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_199040 - DIRECTION
      ?auto_199041 - MODE
      ?auto_199043 - DIRECTION
      ?auto_199042 - MODE
      ?auto_199044 - DIRECTION
      ?auto_199045 - MODE
      ?auto_199046 - DIRECTION
      ?auto_199047 - MODE
      ?auto_199048 - DIRECTION
      ?auto_199049 - MODE
    )
    :vars
    (
      ?auto_199050 - INSTRUMENT
      ?auto_199055 - SATELLITE
      ?auto_199051 - DIRECTION
      ?auto_199057 - INSTRUMENT
      ?auto_199054 - INSTRUMENT
      ?auto_199053 - INSTRUMENT
      ?auto_199056 - INSTRUMENT
      ?auto_199052 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_199043 ?auto_199040 ) ) ( not ( = ?auto_199044 ?auto_199040 ) ) ( not ( = ?auto_199044 ?auto_199043 ) ) ( not ( = ?auto_199046 ?auto_199040 ) ) ( not ( = ?auto_199046 ?auto_199043 ) ) ( not ( = ?auto_199046 ?auto_199044 ) ) ( not ( = ?auto_199048 ?auto_199040 ) ) ( not ( = ?auto_199048 ?auto_199043 ) ) ( not ( = ?auto_199048 ?auto_199044 ) ) ( not ( = ?auto_199048 ?auto_199046 ) ) ( ON_BOARD ?auto_199050 ?auto_199055 ) ( SUPPORTS ?auto_199050 ?auto_199042 ) ( not ( = ?auto_199043 ?auto_199051 ) ) ( CALIBRATION_TARGET ?auto_199050 ?auto_199051 ) ( not ( = ?auto_199051 ?auto_199046 ) ) ( ON_BOARD ?auto_199057 ?auto_199055 ) ( not ( = ?auto_199050 ?auto_199057 ) ) ( SUPPORTS ?auto_199057 ?auto_199047 ) ( CALIBRATION_TARGET ?auto_199057 ?auto_199051 ) ( not ( = ?auto_199051 ?auto_199044 ) ) ( ON_BOARD ?auto_199054 ?auto_199055 ) ( not ( = ?auto_199057 ?auto_199054 ) ) ( SUPPORTS ?auto_199054 ?auto_199045 ) ( CALIBRATION_TARGET ?auto_199054 ?auto_199051 ) ( not ( = ?auto_199051 ?auto_199048 ) ) ( ON_BOARD ?auto_199053 ?auto_199055 ) ( not ( = ?auto_199054 ?auto_199053 ) ) ( SUPPORTS ?auto_199053 ?auto_199049 ) ( CALIBRATION_TARGET ?auto_199053 ?auto_199051 ) ( not ( = ?auto_199051 ?auto_199040 ) ) ( ON_BOARD ?auto_199056 ?auto_199055 ) ( not ( = ?auto_199053 ?auto_199056 ) ) ( SUPPORTS ?auto_199056 ?auto_199041 ) ( CALIBRATION_TARGET ?auto_199056 ?auto_199051 ) ( POWER_AVAIL ?auto_199055 ) ( POINTING ?auto_199055 ?auto_199052 ) ( not ( = ?auto_199051 ?auto_199052 ) ) ( not ( = ?auto_199040 ?auto_199052 ) ) ( not ( = ?auto_199041 ?auto_199049 ) ) ( not ( = ?auto_199048 ?auto_199052 ) ) ( not ( = ?auto_199041 ?auto_199045 ) ) ( not ( = ?auto_199049 ?auto_199045 ) ) ( not ( = ?auto_199044 ?auto_199052 ) ) ( not ( = ?auto_199054 ?auto_199056 ) ) ( not ( = ?auto_199041 ?auto_199047 ) ) ( not ( = ?auto_199049 ?auto_199047 ) ) ( not ( = ?auto_199045 ?auto_199047 ) ) ( not ( = ?auto_199046 ?auto_199052 ) ) ( not ( = ?auto_199057 ?auto_199053 ) ) ( not ( = ?auto_199057 ?auto_199056 ) ) ( not ( = ?auto_199041 ?auto_199042 ) ) ( not ( = ?auto_199049 ?auto_199042 ) ) ( not ( = ?auto_199045 ?auto_199042 ) ) ( not ( = ?auto_199047 ?auto_199042 ) ) ( not ( = ?auto_199043 ?auto_199052 ) ) ( not ( = ?auto_199050 ?auto_199054 ) ) ( not ( = ?auto_199050 ?auto_199053 ) ) ( not ( = ?auto_199050 ?auto_199056 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_199040 ?auto_199041 ?auto_199048 ?auto_199049 ?auto_199044 ?auto_199045 ?auto_199043 ?auto_199042 ?auto_199046 ?auto_199047 )
      ( GET-5IMAGE-VERIFY ?auto_199040 ?auto_199041 ?auto_199043 ?auto_199042 ?auto_199044 ?auto_199045 ?auto_199046 ?auto_199047 ?auto_199048 ?auto_199049 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_199370 - DIRECTION
      ?auto_199371 - MODE
      ?auto_199373 - DIRECTION
      ?auto_199372 - MODE
      ?auto_199374 - DIRECTION
      ?auto_199375 - MODE
      ?auto_199376 - DIRECTION
      ?auto_199377 - MODE
      ?auto_199378 - DIRECTION
      ?auto_199379 - MODE
    )
    :vars
    (
      ?auto_199380 - INSTRUMENT
      ?auto_199385 - SATELLITE
      ?auto_199381 - DIRECTION
      ?auto_199387 - INSTRUMENT
      ?auto_199384 - INSTRUMENT
      ?auto_199383 - INSTRUMENT
      ?auto_199386 - INSTRUMENT
      ?auto_199382 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_199373 ?auto_199370 ) ) ( not ( = ?auto_199374 ?auto_199370 ) ) ( not ( = ?auto_199374 ?auto_199373 ) ) ( not ( = ?auto_199376 ?auto_199370 ) ) ( not ( = ?auto_199376 ?auto_199373 ) ) ( not ( = ?auto_199376 ?auto_199374 ) ) ( not ( = ?auto_199378 ?auto_199370 ) ) ( not ( = ?auto_199378 ?auto_199373 ) ) ( not ( = ?auto_199378 ?auto_199374 ) ) ( not ( = ?auto_199378 ?auto_199376 ) ) ( ON_BOARD ?auto_199380 ?auto_199385 ) ( SUPPORTS ?auto_199380 ?auto_199372 ) ( not ( = ?auto_199373 ?auto_199381 ) ) ( CALIBRATION_TARGET ?auto_199380 ?auto_199381 ) ( not ( = ?auto_199381 ?auto_199374 ) ) ( ON_BOARD ?auto_199387 ?auto_199385 ) ( not ( = ?auto_199380 ?auto_199387 ) ) ( SUPPORTS ?auto_199387 ?auto_199375 ) ( CALIBRATION_TARGET ?auto_199387 ?auto_199381 ) ( not ( = ?auto_199381 ?auto_199378 ) ) ( ON_BOARD ?auto_199384 ?auto_199385 ) ( not ( = ?auto_199387 ?auto_199384 ) ) ( SUPPORTS ?auto_199384 ?auto_199379 ) ( CALIBRATION_TARGET ?auto_199384 ?auto_199381 ) ( not ( = ?auto_199381 ?auto_199376 ) ) ( ON_BOARD ?auto_199383 ?auto_199385 ) ( not ( = ?auto_199384 ?auto_199383 ) ) ( SUPPORTS ?auto_199383 ?auto_199377 ) ( CALIBRATION_TARGET ?auto_199383 ?auto_199381 ) ( not ( = ?auto_199381 ?auto_199370 ) ) ( ON_BOARD ?auto_199386 ?auto_199385 ) ( not ( = ?auto_199383 ?auto_199386 ) ) ( SUPPORTS ?auto_199386 ?auto_199371 ) ( CALIBRATION_TARGET ?auto_199386 ?auto_199381 ) ( POWER_AVAIL ?auto_199385 ) ( POINTING ?auto_199385 ?auto_199382 ) ( not ( = ?auto_199381 ?auto_199382 ) ) ( not ( = ?auto_199370 ?auto_199382 ) ) ( not ( = ?auto_199371 ?auto_199377 ) ) ( not ( = ?auto_199376 ?auto_199382 ) ) ( not ( = ?auto_199371 ?auto_199379 ) ) ( not ( = ?auto_199377 ?auto_199379 ) ) ( not ( = ?auto_199378 ?auto_199382 ) ) ( not ( = ?auto_199384 ?auto_199386 ) ) ( not ( = ?auto_199371 ?auto_199375 ) ) ( not ( = ?auto_199377 ?auto_199375 ) ) ( not ( = ?auto_199379 ?auto_199375 ) ) ( not ( = ?auto_199374 ?auto_199382 ) ) ( not ( = ?auto_199387 ?auto_199383 ) ) ( not ( = ?auto_199387 ?auto_199386 ) ) ( not ( = ?auto_199371 ?auto_199372 ) ) ( not ( = ?auto_199377 ?auto_199372 ) ) ( not ( = ?auto_199379 ?auto_199372 ) ) ( not ( = ?auto_199375 ?auto_199372 ) ) ( not ( = ?auto_199373 ?auto_199382 ) ) ( not ( = ?auto_199380 ?auto_199384 ) ) ( not ( = ?auto_199380 ?auto_199383 ) ) ( not ( = ?auto_199380 ?auto_199386 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_199370 ?auto_199371 ?auto_199376 ?auto_199377 ?auto_199378 ?auto_199379 ?auto_199373 ?auto_199372 ?auto_199374 ?auto_199375 )
      ( GET-5IMAGE-VERIFY ?auto_199370 ?auto_199371 ?auto_199373 ?auto_199372 ?auto_199374 ?auto_199375 ?auto_199376 ?auto_199377 ?auto_199378 ?auto_199379 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_199448 - DIRECTION
      ?auto_199449 - MODE
      ?auto_199451 - DIRECTION
      ?auto_199450 - MODE
      ?auto_199452 - DIRECTION
      ?auto_199453 - MODE
      ?auto_199454 - DIRECTION
      ?auto_199455 - MODE
      ?auto_199456 - DIRECTION
      ?auto_199457 - MODE
    )
    :vars
    (
      ?auto_199458 - INSTRUMENT
      ?auto_199463 - SATELLITE
      ?auto_199459 - DIRECTION
      ?auto_199465 - INSTRUMENT
      ?auto_199462 - INSTRUMENT
      ?auto_199461 - INSTRUMENT
      ?auto_199464 - INSTRUMENT
      ?auto_199460 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_199451 ?auto_199448 ) ) ( not ( = ?auto_199452 ?auto_199448 ) ) ( not ( = ?auto_199452 ?auto_199451 ) ) ( not ( = ?auto_199454 ?auto_199448 ) ) ( not ( = ?auto_199454 ?auto_199451 ) ) ( not ( = ?auto_199454 ?auto_199452 ) ) ( not ( = ?auto_199456 ?auto_199448 ) ) ( not ( = ?auto_199456 ?auto_199451 ) ) ( not ( = ?auto_199456 ?auto_199452 ) ) ( not ( = ?auto_199456 ?auto_199454 ) ) ( ON_BOARD ?auto_199458 ?auto_199463 ) ( SUPPORTS ?auto_199458 ?auto_199450 ) ( not ( = ?auto_199451 ?auto_199459 ) ) ( CALIBRATION_TARGET ?auto_199458 ?auto_199459 ) ( not ( = ?auto_199459 ?auto_199452 ) ) ( ON_BOARD ?auto_199465 ?auto_199463 ) ( not ( = ?auto_199458 ?auto_199465 ) ) ( SUPPORTS ?auto_199465 ?auto_199453 ) ( CALIBRATION_TARGET ?auto_199465 ?auto_199459 ) ( not ( = ?auto_199459 ?auto_199454 ) ) ( ON_BOARD ?auto_199462 ?auto_199463 ) ( not ( = ?auto_199465 ?auto_199462 ) ) ( SUPPORTS ?auto_199462 ?auto_199455 ) ( CALIBRATION_TARGET ?auto_199462 ?auto_199459 ) ( not ( = ?auto_199459 ?auto_199456 ) ) ( ON_BOARD ?auto_199461 ?auto_199463 ) ( not ( = ?auto_199462 ?auto_199461 ) ) ( SUPPORTS ?auto_199461 ?auto_199457 ) ( CALIBRATION_TARGET ?auto_199461 ?auto_199459 ) ( not ( = ?auto_199459 ?auto_199448 ) ) ( ON_BOARD ?auto_199464 ?auto_199463 ) ( not ( = ?auto_199461 ?auto_199464 ) ) ( SUPPORTS ?auto_199464 ?auto_199449 ) ( CALIBRATION_TARGET ?auto_199464 ?auto_199459 ) ( POWER_AVAIL ?auto_199463 ) ( POINTING ?auto_199463 ?auto_199460 ) ( not ( = ?auto_199459 ?auto_199460 ) ) ( not ( = ?auto_199448 ?auto_199460 ) ) ( not ( = ?auto_199449 ?auto_199457 ) ) ( not ( = ?auto_199456 ?auto_199460 ) ) ( not ( = ?auto_199449 ?auto_199455 ) ) ( not ( = ?auto_199457 ?auto_199455 ) ) ( not ( = ?auto_199454 ?auto_199460 ) ) ( not ( = ?auto_199462 ?auto_199464 ) ) ( not ( = ?auto_199449 ?auto_199453 ) ) ( not ( = ?auto_199457 ?auto_199453 ) ) ( not ( = ?auto_199455 ?auto_199453 ) ) ( not ( = ?auto_199452 ?auto_199460 ) ) ( not ( = ?auto_199465 ?auto_199461 ) ) ( not ( = ?auto_199465 ?auto_199464 ) ) ( not ( = ?auto_199449 ?auto_199450 ) ) ( not ( = ?auto_199457 ?auto_199450 ) ) ( not ( = ?auto_199455 ?auto_199450 ) ) ( not ( = ?auto_199453 ?auto_199450 ) ) ( not ( = ?auto_199451 ?auto_199460 ) ) ( not ( = ?auto_199458 ?auto_199462 ) ) ( not ( = ?auto_199458 ?auto_199461 ) ) ( not ( = ?auto_199458 ?auto_199464 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_199448 ?auto_199449 ?auto_199456 ?auto_199457 ?auto_199454 ?auto_199455 ?auto_199451 ?auto_199450 ?auto_199452 ?auto_199453 )
      ( GET-5IMAGE-VERIFY ?auto_199448 ?auto_199449 ?auto_199451 ?auto_199450 ?auto_199452 ?auto_199453 ?auto_199454 ?auto_199455 ?auto_199456 ?auto_199457 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_200724 - DIRECTION
      ?auto_200725 - MODE
      ?auto_200727 - DIRECTION
      ?auto_200726 - MODE
      ?auto_200728 - DIRECTION
      ?auto_200729 - MODE
      ?auto_200730 - DIRECTION
      ?auto_200731 - MODE
      ?auto_200732 - DIRECTION
      ?auto_200733 - MODE
    )
    :vars
    (
      ?auto_200734 - INSTRUMENT
      ?auto_200739 - SATELLITE
      ?auto_200735 - DIRECTION
      ?auto_200741 - INSTRUMENT
      ?auto_200738 - INSTRUMENT
      ?auto_200737 - INSTRUMENT
      ?auto_200740 - INSTRUMENT
      ?auto_200736 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_200727 ?auto_200724 ) ) ( not ( = ?auto_200728 ?auto_200724 ) ) ( not ( = ?auto_200728 ?auto_200727 ) ) ( not ( = ?auto_200730 ?auto_200724 ) ) ( not ( = ?auto_200730 ?auto_200727 ) ) ( not ( = ?auto_200730 ?auto_200728 ) ) ( not ( = ?auto_200732 ?auto_200724 ) ) ( not ( = ?auto_200732 ?auto_200727 ) ) ( not ( = ?auto_200732 ?auto_200728 ) ) ( not ( = ?auto_200732 ?auto_200730 ) ) ( ON_BOARD ?auto_200734 ?auto_200739 ) ( SUPPORTS ?auto_200734 ?auto_200733 ) ( not ( = ?auto_200732 ?auto_200735 ) ) ( CALIBRATION_TARGET ?auto_200734 ?auto_200735 ) ( not ( = ?auto_200735 ?auto_200730 ) ) ( ON_BOARD ?auto_200741 ?auto_200739 ) ( not ( = ?auto_200734 ?auto_200741 ) ) ( SUPPORTS ?auto_200741 ?auto_200731 ) ( CALIBRATION_TARGET ?auto_200741 ?auto_200735 ) ( not ( = ?auto_200735 ?auto_200728 ) ) ( ON_BOARD ?auto_200738 ?auto_200739 ) ( not ( = ?auto_200741 ?auto_200738 ) ) ( SUPPORTS ?auto_200738 ?auto_200729 ) ( CALIBRATION_TARGET ?auto_200738 ?auto_200735 ) ( not ( = ?auto_200735 ?auto_200724 ) ) ( ON_BOARD ?auto_200737 ?auto_200739 ) ( not ( = ?auto_200738 ?auto_200737 ) ) ( SUPPORTS ?auto_200737 ?auto_200725 ) ( CALIBRATION_TARGET ?auto_200737 ?auto_200735 ) ( not ( = ?auto_200735 ?auto_200727 ) ) ( ON_BOARD ?auto_200740 ?auto_200739 ) ( not ( = ?auto_200737 ?auto_200740 ) ) ( SUPPORTS ?auto_200740 ?auto_200726 ) ( CALIBRATION_TARGET ?auto_200740 ?auto_200735 ) ( POWER_AVAIL ?auto_200739 ) ( POINTING ?auto_200739 ?auto_200736 ) ( not ( = ?auto_200735 ?auto_200736 ) ) ( not ( = ?auto_200727 ?auto_200736 ) ) ( not ( = ?auto_200726 ?auto_200725 ) ) ( not ( = ?auto_200724 ?auto_200736 ) ) ( not ( = ?auto_200726 ?auto_200729 ) ) ( not ( = ?auto_200725 ?auto_200729 ) ) ( not ( = ?auto_200728 ?auto_200736 ) ) ( not ( = ?auto_200738 ?auto_200740 ) ) ( not ( = ?auto_200726 ?auto_200731 ) ) ( not ( = ?auto_200725 ?auto_200731 ) ) ( not ( = ?auto_200729 ?auto_200731 ) ) ( not ( = ?auto_200730 ?auto_200736 ) ) ( not ( = ?auto_200741 ?auto_200737 ) ) ( not ( = ?auto_200741 ?auto_200740 ) ) ( not ( = ?auto_200726 ?auto_200733 ) ) ( not ( = ?auto_200725 ?auto_200733 ) ) ( not ( = ?auto_200729 ?auto_200733 ) ) ( not ( = ?auto_200731 ?auto_200733 ) ) ( not ( = ?auto_200732 ?auto_200736 ) ) ( not ( = ?auto_200734 ?auto_200738 ) ) ( not ( = ?auto_200734 ?auto_200737 ) ) ( not ( = ?auto_200734 ?auto_200740 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_200727 ?auto_200726 ?auto_200724 ?auto_200725 ?auto_200728 ?auto_200729 ?auto_200732 ?auto_200733 ?auto_200730 ?auto_200731 )
      ( GET-5IMAGE-VERIFY ?auto_200724 ?auto_200725 ?auto_200727 ?auto_200726 ?auto_200728 ?auto_200729 ?auto_200730 ?auto_200731 ?auto_200732 ?auto_200733 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_200802 - DIRECTION
      ?auto_200803 - MODE
      ?auto_200805 - DIRECTION
      ?auto_200804 - MODE
      ?auto_200806 - DIRECTION
      ?auto_200807 - MODE
      ?auto_200808 - DIRECTION
      ?auto_200809 - MODE
      ?auto_200810 - DIRECTION
      ?auto_200811 - MODE
    )
    :vars
    (
      ?auto_200812 - INSTRUMENT
      ?auto_200817 - SATELLITE
      ?auto_200813 - DIRECTION
      ?auto_200819 - INSTRUMENT
      ?auto_200816 - INSTRUMENT
      ?auto_200815 - INSTRUMENT
      ?auto_200818 - INSTRUMENT
      ?auto_200814 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_200805 ?auto_200802 ) ) ( not ( = ?auto_200806 ?auto_200802 ) ) ( not ( = ?auto_200806 ?auto_200805 ) ) ( not ( = ?auto_200808 ?auto_200802 ) ) ( not ( = ?auto_200808 ?auto_200805 ) ) ( not ( = ?auto_200808 ?auto_200806 ) ) ( not ( = ?auto_200810 ?auto_200802 ) ) ( not ( = ?auto_200810 ?auto_200805 ) ) ( not ( = ?auto_200810 ?auto_200806 ) ) ( not ( = ?auto_200810 ?auto_200808 ) ) ( ON_BOARD ?auto_200812 ?auto_200817 ) ( SUPPORTS ?auto_200812 ?auto_200809 ) ( not ( = ?auto_200808 ?auto_200813 ) ) ( CALIBRATION_TARGET ?auto_200812 ?auto_200813 ) ( not ( = ?auto_200813 ?auto_200810 ) ) ( ON_BOARD ?auto_200819 ?auto_200817 ) ( not ( = ?auto_200812 ?auto_200819 ) ) ( SUPPORTS ?auto_200819 ?auto_200811 ) ( CALIBRATION_TARGET ?auto_200819 ?auto_200813 ) ( not ( = ?auto_200813 ?auto_200806 ) ) ( ON_BOARD ?auto_200816 ?auto_200817 ) ( not ( = ?auto_200819 ?auto_200816 ) ) ( SUPPORTS ?auto_200816 ?auto_200807 ) ( CALIBRATION_TARGET ?auto_200816 ?auto_200813 ) ( not ( = ?auto_200813 ?auto_200802 ) ) ( ON_BOARD ?auto_200815 ?auto_200817 ) ( not ( = ?auto_200816 ?auto_200815 ) ) ( SUPPORTS ?auto_200815 ?auto_200803 ) ( CALIBRATION_TARGET ?auto_200815 ?auto_200813 ) ( not ( = ?auto_200813 ?auto_200805 ) ) ( ON_BOARD ?auto_200818 ?auto_200817 ) ( not ( = ?auto_200815 ?auto_200818 ) ) ( SUPPORTS ?auto_200818 ?auto_200804 ) ( CALIBRATION_TARGET ?auto_200818 ?auto_200813 ) ( POWER_AVAIL ?auto_200817 ) ( POINTING ?auto_200817 ?auto_200814 ) ( not ( = ?auto_200813 ?auto_200814 ) ) ( not ( = ?auto_200805 ?auto_200814 ) ) ( not ( = ?auto_200804 ?auto_200803 ) ) ( not ( = ?auto_200802 ?auto_200814 ) ) ( not ( = ?auto_200804 ?auto_200807 ) ) ( not ( = ?auto_200803 ?auto_200807 ) ) ( not ( = ?auto_200806 ?auto_200814 ) ) ( not ( = ?auto_200816 ?auto_200818 ) ) ( not ( = ?auto_200804 ?auto_200811 ) ) ( not ( = ?auto_200803 ?auto_200811 ) ) ( not ( = ?auto_200807 ?auto_200811 ) ) ( not ( = ?auto_200810 ?auto_200814 ) ) ( not ( = ?auto_200819 ?auto_200815 ) ) ( not ( = ?auto_200819 ?auto_200818 ) ) ( not ( = ?auto_200804 ?auto_200809 ) ) ( not ( = ?auto_200803 ?auto_200809 ) ) ( not ( = ?auto_200807 ?auto_200809 ) ) ( not ( = ?auto_200811 ?auto_200809 ) ) ( not ( = ?auto_200808 ?auto_200814 ) ) ( not ( = ?auto_200812 ?auto_200816 ) ) ( not ( = ?auto_200812 ?auto_200815 ) ) ( not ( = ?auto_200812 ?auto_200818 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_200805 ?auto_200804 ?auto_200802 ?auto_200803 ?auto_200806 ?auto_200807 ?auto_200808 ?auto_200809 ?auto_200810 ?auto_200811 )
      ( GET-5IMAGE-VERIFY ?auto_200802 ?auto_200803 ?auto_200805 ?auto_200804 ?auto_200806 ?auto_200807 ?auto_200808 ?auto_200809 ?auto_200810 ?auto_200811 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_200880 - DIRECTION
      ?auto_200881 - MODE
      ?auto_200883 - DIRECTION
      ?auto_200882 - MODE
      ?auto_200884 - DIRECTION
      ?auto_200885 - MODE
      ?auto_200886 - DIRECTION
      ?auto_200887 - MODE
      ?auto_200888 - DIRECTION
      ?auto_200889 - MODE
    )
    :vars
    (
      ?auto_200890 - INSTRUMENT
      ?auto_200895 - SATELLITE
      ?auto_200891 - DIRECTION
      ?auto_200897 - INSTRUMENT
      ?auto_200894 - INSTRUMENT
      ?auto_200893 - INSTRUMENT
      ?auto_200896 - INSTRUMENT
      ?auto_200892 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_200883 ?auto_200880 ) ) ( not ( = ?auto_200884 ?auto_200880 ) ) ( not ( = ?auto_200884 ?auto_200883 ) ) ( not ( = ?auto_200886 ?auto_200880 ) ) ( not ( = ?auto_200886 ?auto_200883 ) ) ( not ( = ?auto_200886 ?auto_200884 ) ) ( not ( = ?auto_200888 ?auto_200880 ) ) ( not ( = ?auto_200888 ?auto_200883 ) ) ( not ( = ?auto_200888 ?auto_200884 ) ) ( not ( = ?auto_200888 ?auto_200886 ) ) ( ON_BOARD ?auto_200890 ?auto_200895 ) ( SUPPORTS ?auto_200890 ?auto_200889 ) ( not ( = ?auto_200888 ?auto_200891 ) ) ( CALIBRATION_TARGET ?auto_200890 ?auto_200891 ) ( not ( = ?auto_200891 ?auto_200884 ) ) ( ON_BOARD ?auto_200897 ?auto_200895 ) ( not ( = ?auto_200890 ?auto_200897 ) ) ( SUPPORTS ?auto_200897 ?auto_200885 ) ( CALIBRATION_TARGET ?auto_200897 ?auto_200891 ) ( not ( = ?auto_200891 ?auto_200886 ) ) ( ON_BOARD ?auto_200894 ?auto_200895 ) ( not ( = ?auto_200897 ?auto_200894 ) ) ( SUPPORTS ?auto_200894 ?auto_200887 ) ( CALIBRATION_TARGET ?auto_200894 ?auto_200891 ) ( not ( = ?auto_200891 ?auto_200880 ) ) ( ON_BOARD ?auto_200893 ?auto_200895 ) ( not ( = ?auto_200894 ?auto_200893 ) ) ( SUPPORTS ?auto_200893 ?auto_200881 ) ( CALIBRATION_TARGET ?auto_200893 ?auto_200891 ) ( not ( = ?auto_200891 ?auto_200883 ) ) ( ON_BOARD ?auto_200896 ?auto_200895 ) ( not ( = ?auto_200893 ?auto_200896 ) ) ( SUPPORTS ?auto_200896 ?auto_200882 ) ( CALIBRATION_TARGET ?auto_200896 ?auto_200891 ) ( POWER_AVAIL ?auto_200895 ) ( POINTING ?auto_200895 ?auto_200892 ) ( not ( = ?auto_200891 ?auto_200892 ) ) ( not ( = ?auto_200883 ?auto_200892 ) ) ( not ( = ?auto_200882 ?auto_200881 ) ) ( not ( = ?auto_200880 ?auto_200892 ) ) ( not ( = ?auto_200882 ?auto_200887 ) ) ( not ( = ?auto_200881 ?auto_200887 ) ) ( not ( = ?auto_200886 ?auto_200892 ) ) ( not ( = ?auto_200894 ?auto_200896 ) ) ( not ( = ?auto_200882 ?auto_200885 ) ) ( not ( = ?auto_200881 ?auto_200885 ) ) ( not ( = ?auto_200887 ?auto_200885 ) ) ( not ( = ?auto_200884 ?auto_200892 ) ) ( not ( = ?auto_200897 ?auto_200893 ) ) ( not ( = ?auto_200897 ?auto_200896 ) ) ( not ( = ?auto_200882 ?auto_200889 ) ) ( not ( = ?auto_200881 ?auto_200889 ) ) ( not ( = ?auto_200887 ?auto_200889 ) ) ( not ( = ?auto_200885 ?auto_200889 ) ) ( not ( = ?auto_200888 ?auto_200892 ) ) ( not ( = ?auto_200890 ?auto_200894 ) ) ( not ( = ?auto_200890 ?auto_200893 ) ) ( not ( = ?auto_200890 ?auto_200896 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_200883 ?auto_200882 ?auto_200880 ?auto_200881 ?auto_200886 ?auto_200887 ?auto_200888 ?auto_200889 ?auto_200884 ?auto_200885 )
      ( GET-5IMAGE-VERIFY ?auto_200880 ?auto_200881 ?auto_200883 ?auto_200882 ?auto_200884 ?auto_200885 ?auto_200886 ?auto_200887 ?auto_200888 ?auto_200889 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_200958 - DIRECTION
      ?auto_200959 - MODE
      ?auto_200961 - DIRECTION
      ?auto_200960 - MODE
      ?auto_200962 - DIRECTION
      ?auto_200963 - MODE
      ?auto_200964 - DIRECTION
      ?auto_200965 - MODE
      ?auto_200966 - DIRECTION
      ?auto_200967 - MODE
    )
    :vars
    (
      ?auto_200968 - INSTRUMENT
      ?auto_200973 - SATELLITE
      ?auto_200969 - DIRECTION
      ?auto_200975 - INSTRUMENT
      ?auto_200972 - INSTRUMENT
      ?auto_200971 - INSTRUMENT
      ?auto_200974 - INSTRUMENT
      ?auto_200970 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_200961 ?auto_200958 ) ) ( not ( = ?auto_200962 ?auto_200958 ) ) ( not ( = ?auto_200962 ?auto_200961 ) ) ( not ( = ?auto_200964 ?auto_200958 ) ) ( not ( = ?auto_200964 ?auto_200961 ) ) ( not ( = ?auto_200964 ?auto_200962 ) ) ( not ( = ?auto_200966 ?auto_200958 ) ) ( not ( = ?auto_200966 ?auto_200961 ) ) ( not ( = ?auto_200966 ?auto_200962 ) ) ( not ( = ?auto_200966 ?auto_200964 ) ) ( ON_BOARD ?auto_200968 ?auto_200973 ) ( SUPPORTS ?auto_200968 ?auto_200965 ) ( not ( = ?auto_200964 ?auto_200969 ) ) ( CALIBRATION_TARGET ?auto_200968 ?auto_200969 ) ( not ( = ?auto_200969 ?auto_200962 ) ) ( ON_BOARD ?auto_200975 ?auto_200973 ) ( not ( = ?auto_200968 ?auto_200975 ) ) ( SUPPORTS ?auto_200975 ?auto_200963 ) ( CALIBRATION_TARGET ?auto_200975 ?auto_200969 ) ( not ( = ?auto_200969 ?auto_200966 ) ) ( ON_BOARD ?auto_200972 ?auto_200973 ) ( not ( = ?auto_200975 ?auto_200972 ) ) ( SUPPORTS ?auto_200972 ?auto_200967 ) ( CALIBRATION_TARGET ?auto_200972 ?auto_200969 ) ( not ( = ?auto_200969 ?auto_200958 ) ) ( ON_BOARD ?auto_200971 ?auto_200973 ) ( not ( = ?auto_200972 ?auto_200971 ) ) ( SUPPORTS ?auto_200971 ?auto_200959 ) ( CALIBRATION_TARGET ?auto_200971 ?auto_200969 ) ( not ( = ?auto_200969 ?auto_200961 ) ) ( ON_BOARD ?auto_200974 ?auto_200973 ) ( not ( = ?auto_200971 ?auto_200974 ) ) ( SUPPORTS ?auto_200974 ?auto_200960 ) ( CALIBRATION_TARGET ?auto_200974 ?auto_200969 ) ( POWER_AVAIL ?auto_200973 ) ( POINTING ?auto_200973 ?auto_200970 ) ( not ( = ?auto_200969 ?auto_200970 ) ) ( not ( = ?auto_200961 ?auto_200970 ) ) ( not ( = ?auto_200960 ?auto_200959 ) ) ( not ( = ?auto_200958 ?auto_200970 ) ) ( not ( = ?auto_200960 ?auto_200967 ) ) ( not ( = ?auto_200959 ?auto_200967 ) ) ( not ( = ?auto_200966 ?auto_200970 ) ) ( not ( = ?auto_200972 ?auto_200974 ) ) ( not ( = ?auto_200960 ?auto_200963 ) ) ( not ( = ?auto_200959 ?auto_200963 ) ) ( not ( = ?auto_200967 ?auto_200963 ) ) ( not ( = ?auto_200962 ?auto_200970 ) ) ( not ( = ?auto_200975 ?auto_200971 ) ) ( not ( = ?auto_200975 ?auto_200974 ) ) ( not ( = ?auto_200960 ?auto_200965 ) ) ( not ( = ?auto_200959 ?auto_200965 ) ) ( not ( = ?auto_200967 ?auto_200965 ) ) ( not ( = ?auto_200963 ?auto_200965 ) ) ( not ( = ?auto_200964 ?auto_200970 ) ) ( not ( = ?auto_200968 ?auto_200972 ) ) ( not ( = ?auto_200968 ?auto_200971 ) ) ( not ( = ?auto_200968 ?auto_200974 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_200961 ?auto_200960 ?auto_200958 ?auto_200959 ?auto_200966 ?auto_200967 ?auto_200964 ?auto_200965 ?auto_200962 ?auto_200963 )
      ( GET-5IMAGE-VERIFY ?auto_200958 ?auto_200959 ?auto_200961 ?auto_200960 ?auto_200962 ?auto_200963 ?auto_200964 ?auto_200965 ?auto_200966 ?auto_200967 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_201288 - DIRECTION
      ?auto_201289 - MODE
      ?auto_201291 - DIRECTION
      ?auto_201290 - MODE
      ?auto_201292 - DIRECTION
      ?auto_201293 - MODE
      ?auto_201294 - DIRECTION
      ?auto_201295 - MODE
      ?auto_201296 - DIRECTION
      ?auto_201297 - MODE
    )
    :vars
    (
      ?auto_201298 - INSTRUMENT
      ?auto_201303 - SATELLITE
      ?auto_201299 - DIRECTION
      ?auto_201305 - INSTRUMENT
      ?auto_201302 - INSTRUMENT
      ?auto_201301 - INSTRUMENT
      ?auto_201304 - INSTRUMENT
      ?auto_201300 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_201291 ?auto_201288 ) ) ( not ( = ?auto_201292 ?auto_201288 ) ) ( not ( = ?auto_201292 ?auto_201291 ) ) ( not ( = ?auto_201294 ?auto_201288 ) ) ( not ( = ?auto_201294 ?auto_201291 ) ) ( not ( = ?auto_201294 ?auto_201292 ) ) ( not ( = ?auto_201296 ?auto_201288 ) ) ( not ( = ?auto_201296 ?auto_201291 ) ) ( not ( = ?auto_201296 ?auto_201292 ) ) ( not ( = ?auto_201296 ?auto_201294 ) ) ( ON_BOARD ?auto_201298 ?auto_201303 ) ( SUPPORTS ?auto_201298 ?auto_201293 ) ( not ( = ?auto_201292 ?auto_201299 ) ) ( CALIBRATION_TARGET ?auto_201298 ?auto_201299 ) ( not ( = ?auto_201299 ?auto_201296 ) ) ( ON_BOARD ?auto_201305 ?auto_201303 ) ( not ( = ?auto_201298 ?auto_201305 ) ) ( SUPPORTS ?auto_201305 ?auto_201297 ) ( CALIBRATION_TARGET ?auto_201305 ?auto_201299 ) ( not ( = ?auto_201299 ?auto_201294 ) ) ( ON_BOARD ?auto_201302 ?auto_201303 ) ( not ( = ?auto_201305 ?auto_201302 ) ) ( SUPPORTS ?auto_201302 ?auto_201295 ) ( CALIBRATION_TARGET ?auto_201302 ?auto_201299 ) ( not ( = ?auto_201299 ?auto_201288 ) ) ( ON_BOARD ?auto_201301 ?auto_201303 ) ( not ( = ?auto_201302 ?auto_201301 ) ) ( SUPPORTS ?auto_201301 ?auto_201289 ) ( CALIBRATION_TARGET ?auto_201301 ?auto_201299 ) ( not ( = ?auto_201299 ?auto_201291 ) ) ( ON_BOARD ?auto_201304 ?auto_201303 ) ( not ( = ?auto_201301 ?auto_201304 ) ) ( SUPPORTS ?auto_201304 ?auto_201290 ) ( CALIBRATION_TARGET ?auto_201304 ?auto_201299 ) ( POWER_AVAIL ?auto_201303 ) ( POINTING ?auto_201303 ?auto_201300 ) ( not ( = ?auto_201299 ?auto_201300 ) ) ( not ( = ?auto_201291 ?auto_201300 ) ) ( not ( = ?auto_201290 ?auto_201289 ) ) ( not ( = ?auto_201288 ?auto_201300 ) ) ( not ( = ?auto_201290 ?auto_201295 ) ) ( not ( = ?auto_201289 ?auto_201295 ) ) ( not ( = ?auto_201294 ?auto_201300 ) ) ( not ( = ?auto_201302 ?auto_201304 ) ) ( not ( = ?auto_201290 ?auto_201297 ) ) ( not ( = ?auto_201289 ?auto_201297 ) ) ( not ( = ?auto_201295 ?auto_201297 ) ) ( not ( = ?auto_201296 ?auto_201300 ) ) ( not ( = ?auto_201305 ?auto_201301 ) ) ( not ( = ?auto_201305 ?auto_201304 ) ) ( not ( = ?auto_201290 ?auto_201293 ) ) ( not ( = ?auto_201289 ?auto_201293 ) ) ( not ( = ?auto_201295 ?auto_201293 ) ) ( not ( = ?auto_201297 ?auto_201293 ) ) ( not ( = ?auto_201292 ?auto_201300 ) ) ( not ( = ?auto_201298 ?auto_201302 ) ) ( not ( = ?auto_201298 ?auto_201301 ) ) ( not ( = ?auto_201298 ?auto_201304 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_201291 ?auto_201290 ?auto_201288 ?auto_201289 ?auto_201294 ?auto_201295 ?auto_201292 ?auto_201293 ?auto_201296 ?auto_201297 )
      ( GET-5IMAGE-VERIFY ?auto_201288 ?auto_201289 ?auto_201291 ?auto_201290 ?auto_201292 ?auto_201293 ?auto_201294 ?auto_201295 ?auto_201296 ?auto_201297 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_201366 - DIRECTION
      ?auto_201367 - MODE
      ?auto_201369 - DIRECTION
      ?auto_201368 - MODE
      ?auto_201370 - DIRECTION
      ?auto_201371 - MODE
      ?auto_201372 - DIRECTION
      ?auto_201373 - MODE
      ?auto_201374 - DIRECTION
      ?auto_201375 - MODE
    )
    :vars
    (
      ?auto_201376 - INSTRUMENT
      ?auto_201381 - SATELLITE
      ?auto_201377 - DIRECTION
      ?auto_201383 - INSTRUMENT
      ?auto_201380 - INSTRUMENT
      ?auto_201379 - INSTRUMENT
      ?auto_201382 - INSTRUMENT
      ?auto_201378 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_201369 ?auto_201366 ) ) ( not ( = ?auto_201370 ?auto_201366 ) ) ( not ( = ?auto_201370 ?auto_201369 ) ) ( not ( = ?auto_201372 ?auto_201366 ) ) ( not ( = ?auto_201372 ?auto_201369 ) ) ( not ( = ?auto_201372 ?auto_201370 ) ) ( not ( = ?auto_201374 ?auto_201366 ) ) ( not ( = ?auto_201374 ?auto_201369 ) ) ( not ( = ?auto_201374 ?auto_201370 ) ) ( not ( = ?auto_201374 ?auto_201372 ) ) ( ON_BOARD ?auto_201376 ?auto_201381 ) ( SUPPORTS ?auto_201376 ?auto_201371 ) ( not ( = ?auto_201370 ?auto_201377 ) ) ( CALIBRATION_TARGET ?auto_201376 ?auto_201377 ) ( not ( = ?auto_201377 ?auto_201372 ) ) ( ON_BOARD ?auto_201383 ?auto_201381 ) ( not ( = ?auto_201376 ?auto_201383 ) ) ( SUPPORTS ?auto_201383 ?auto_201373 ) ( CALIBRATION_TARGET ?auto_201383 ?auto_201377 ) ( not ( = ?auto_201377 ?auto_201374 ) ) ( ON_BOARD ?auto_201380 ?auto_201381 ) ( not ( = ?auto_201383 ?auto_201380 ) ) ( SUPPORTS ?auto_201380 ?auto_201375 ) ( CALIBRATION_TARGET ?auto_201380 ?auto_201377 ) ( not ( = ?auto_201377 ?auto_201366 ) ) ( ON_BOARD ?auto_201379 ?auto_201381 ) ( not ( = ?auto_201380 ?auto_201379 ) ) ( SUPPORTS ?auto_201379 ?auto_201367 ) ( CALIBRATION_TARGET ?auto_201379 ?auto_201377 ) ( not ( = ?auto_201377 ?auto_201369 ) ) ( ON_BOARD ?auto_201382 ?auto_201381 ) ( not ( = ?auto_201379 ?auto_201382 ) ) ( SUPPORTS ?auto_201382 ?auto_201368 ) ( CALIBRATION_TARGET ?auto_201382 ?auto_201377 ) ( POWER_AVAIL ?auto_201381 ) ( POINTING ?auto_201381 ?auto_201378 ) ( not ( = ?auto_201377 ?auto_201378 ) ) ( not ( = ?auto_201369 ?auto_201378 ) ) ( not ( = ?auto_201368 ?auto_201367 ) ) ( not ( = ?auto_201366 ?auto_201378 ) ) ( not ( = ?auto_201368 ?auto_201375 ) ) ( not ( = ?auto_201367 ?auto_201375 ) ) ( not ( = ?auto_201374 ?auto_201378 ) ) ( not ( = ?auto_201380 ?auto_201382 ) ) ( not ( = ?auto_201368 ?auto_201373 ) ) ( not ( = ?auto_201367 ?auto_201373 ) ) ( not ( = ?auto_201375 ?auto_201373 ) ) ( not ( = ?auto_201372 ?auto_201378 ) ) ( not ( = ?auto_201383 ?auto_201379 ) ) ( not ( = ?auto_201383 ?auto_201382 ) ) ( not ( = ?auto_201368 ?auto_201371 ) ) ( not ( = ?auto_201367 ?auto_201371 ) ) ( not ( = ?auto_201375 ?auto_201371 ) ) ( not ( = ?auto_201373 ?auto_201371 ) ) ( not ( = ?auto_201370 ?auto_201378 ) ) ( not ( = ?auto_201376 ?auto_201380 ) ) ( not ( = ?auto_201376 ?auto_201379 ) ) ( not ( = ?auto_201376 ?auto_201382 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_201369 ?auto_201368 ?auto_201366 ?auto_201367 ?auto_201374 ?auto_201375 ?auto_201370 ?auto_201371 ?auto_201372 ?auto_201373 )
      ( GET-5IMAGE-VERIFY ?auto_201366 ?auto_201367 ?auto_201369 ?auto_201368 ?auto_201370 ?auto_201371 ?auto_201372 ?auto_201373 ?auto_201374 ?auto_201375 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_202910 - DIRECTION
      ?auto_202911 - MODE
      ?auto_202913 - DIRECTION
      ?auto_202912 - MODE
      ?auto_202914 - DIRECTION
      ?auto_202915 - MODE
      ?auto_202916 - DIRECTION
      ?auto_202917 - MODE
      ?auto_202918 - DIRECTION
      ?auto_202919 - MODE
    )
    :vars
    (
      ?auto_202920 - INSTRUMENT
      ?auto_202925 - SATELLITE
      ?auto_202921 - DIRECTION
      ?auto_202927 - INSTRUMENT
      ?auto_202924 - INSTRUMENT
      ?auto_202923 - INSTRUMENT
      ?auto_202926 - INSTRUMENT
      ?auto_202922 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_202913 ?auto_202910 ) ) ( not ( = ?auto_202914 ?auto_202910 ) ) ( not ( = ?auto_202914 ?auto_202913 ) ) ( not ( = ?auto_202916 ?auto_202910 ) ) ( not ( = ?auto_202916 ?auto_202913 ) ) ( not ( = ?auto_202916 ?auto_202914 ) ) ( not ( = ?auto_202918 ?auto_202910 ) ) ( not ( = ?auto_202918 ?auto_202913 ) ) ( not ( = ?auto_202918 ?auto_202914 ) ) ( not ( = ?auto_202918 ?auto_202916 ) ) ( ON_BOARD ?auto_202920 ?auto_202925 ) ( SUPPORTS ?auto_202920 ?auto_202919 ) ( not ( = ?auto_202918 ?auto_202921 ) ) ( CALIBRATION_TARGET ?auto_202920 ?auto_202921 ) ( not ( = ?auto_202921 ?auto_202916 ) ) ( ON_BOARD ?auto_202927 ?auto_202925 ) ( not ( = ?auto_202920 ?auto_202927 ) ) ( SUPPORTS ?auto_202927 ?auto_202917 ) ( CALIBRATION_TARGET ?auto_202927 ?auto_202921 ) ( not ( = ?auto_202921 ?auto_202913 ) ) ( ON_BOARD ?auto_202924 ?auto_202925 ) ( not ( = ?auto_202927 ?auto_202924 ) ) ( SUPPORTS ?auto_202924 ?auto_202912 ) ( CALIBRATION_TARGET ?auto_202924 ?auto_202921 ) ( not ( = ?auto_202921 ?auto_202910 ) ) ( ON_BOARD ?auto_202923 ?auto_202925 ) ( not ( = ?auto_202924 ?auto_202923 ) ) ( SUPPORTS ?auto_202923 ?auto_202911 ) ( CALIBRATION_TARGET ?auto_202923 ?auto_202921 ) ( not ( = ?auto_202921 ?auto_202914 ) ) ( ON_BOARD ?auto_202926 ?auto_202925 ) ( not ( = ?auto_202923 ?auto_202926 ) ) ( SUPPORTS ?auto_202926 ?auto_202915 ) ( CALIBRATION_TARGET ?auto_202926 ?auto_202921 ) ( POWER_AVAIL ?auto_202925 ) ( POINTING ?auto_202925 ?auto_202922 ) ( not ( = ?auto_202921 ?auto_202922 ) ) ( not ( = ?auto_202914 ?auto_202922 ) ) ( not ( = ?auto_202915 ?auto_202911 ) ) ( not ( = ?auto_202910 ?auto_202922 ) ) ( not ( = ?auto_202915 ?auto_202912 ) ) ( not ( = ?auto_202911 ?auto_202912 ) ) ( not ( = ?auto_202913 ?auto_202922 ) ) ( not ( = ?auto_202924 ?auto_202926 ) ) ( not ( = ?auto_202915 ?auto_202917 ) ) ( not ( = ?auto_202911 ?auto_202917 ) ) ( not ( = ?auto_202912 ?auto_202917 ) ) ( not ( = ?auto_202916 ?auto_202922 ) ) ( not ( = ?auto_202927 ?auto_202923 ) ) ( not ( = ?auto_202927 ?auto_202926 ) ) ( not ( = ?auto_202915 ?auto_202919 ) ) ( not ( = ?auto_202911 ?auto_202919 ) ) ( not ( = ?auto_202912 ?auto_202919 ) ) ( not ( = ?auto_202917 ?auto_202919 ) ) ( not ( = ?auto_202918 ?auto_202922 ) ) ( not ( = ?auto_202920 ?auto_202924 ) ) ( not ( = ?auto_202920 ?auto_202923 ) ) ( not ( = ?auto_202920 ?auto_202926 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_202914 ?auto_202915 ?auto_202910 ?auto_202911 ?auto_202913 ?auto_202912 ?auto_202918 ?auto_202919 ?auto_202916 ?auto_202917 )
      ( GET-5IMAGE-VERIFY ?auto_202910 ?auto_202911 ?auto_202913 ?auto_202912 ?auto_202914 ?auto_202915 ?auto_202916 ?auto_202917 ?auto_202918 ?auto_202919 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_202988 - DIRECTION
      ?auto_202989 - MODE
      ?auto_202991 - DIRECTION
      ?auto_202990 - MODE
      ?auto_202992 - DIRECTION
      ?auto_202993 - MODE
      ?auto_202994 - DIRECTION
      ?auto_202995 - MODE
      ?auto_202996 - DIRECTION
      ?auto_202997 - MODE
    )
    :vars
    (
      ?auto_202998 - INSTRUMENT
      ?auto_203003 - SATELLITE
      ?auto_202999 - DIRECTION
      ?auto_203005 - INSTRUMENT
      ?auto_203002 - INSTRUMENT
      ?auto_203001 - INSTRUMENT
      ?auto_203004 - INSTRUMENT
      ?auto_203000 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_202991 ?auto_202988 ) ) ( not ( = ?auto_202992 ?auto_202988 ) ) ( not ( = ?auto_202992 ?auto_202991 ) ) ( not ( = ?auto_202994 ?auto_202988 ) ) ( not ( = ?auto_202994 ?auto_202991 ) ) ( not ( = ?auto_202994 ?auto_202992 ) ) ( not ( = ?auto_202996 ?auto_202988 ) ) ( not ( = ?auto_202996 ?auto_202991 ) ) ( not ( = ?auto_202996 ?auto_202992 ) ) ( not ( = ?auto_202996 ?auto_202994 ) ) ( ON_BOARD ?auto_202998 ?auto_203003 ) ( SUPPORTS ?auto_202998 ?auto_202995 ) ( not ( = ?auto_202994 ?auto_202999 ) ) ( CALIBRATION_TARGET ?auto_202998 ?auto_202999 ) ( not ( = ?auto_202999 ?auto_202996 ) ) ( ON_BOARD ?auto_203005 ?auto_203003 ) ( not ( = ?auto_202998 ?auto_203005 ) ) ( SUPPORTS ?auto_203005 ?auto_202997 ) ( CALIBRATION_TARGET ?auto_203005 ?auto_202999 ) ( not ( = ?auto_202999 ?auto_202991 ) ) ( ON_BOARD ?auto_203002 ?auto_203003 ) ( not ( = ?auto_203005 ?auto_203002 ) ) ( SUPPORTS ?auto_203002 ?auto_202990 ) ( CALIBRATION_TARGET ?auto_203002 ?auto_202999 ) ( not ( = ?auto_202999 ?auto_202988 ) ) ( ON_BOARD ?auto_203001 ?auto_203003 ) ( not ( = ?auto_203002 ?auto_203001 ) ) ( SUPPORTS ?auto_203001 ?auto_202989 ) ( CALIBRATION_TARGET ?auto_203001 ?auto_202999 ) ( not ( = ?auto_202999 ?auto_202992 ) ) ( ON_BOARD ?auto_203004 ?auto_203003 ) ( not ( = ?auto_203001 ?auto_203004 ) ) ( SUPPORTS ?auto_203004 ?auto_202993 ) ( CALIBRATION_TARGET ?auto_203004 ?auto_202999 ) ( POWER_AVAIL ?auto_203003 ) ( POINTING ?auto_203003 ?auto_203000 ) ( not ( = ?auto_202999 ?auto_203000 ) ) ( not ( = ?auto_202992 ?auto_203000 ) ) ( not ( = ?auto_202993 ?auto_202989 ) ) ( not ( = ?auto_202988 ?auto_203000 ) ) ( not ( = ?auto_202993 ?auto_202990 ) ) ( not ( = ?auto_202989 ?auto_202990 ) ) ( not ( = ?auto_202991 ?auto_203000 ) ) ( not ( = ?auto_203002 ?auto_203004 ) ) ( not ( = ?auto_202993 ?auto_202997 ) ) ( not ( = ?auto_202989 ?auto_202997 ) ) ( not ( = ?auto_202990 ?auto_202997 ) ) ( not ( = ?auto_202996 ?auto_203000 ) ) ( not ( = ?auto_203005 ?auto_203001 ) ) ( not ( = ?auto_203005 ?auto_203004 ) ) ( not ( = ?auto_202993 ?auto_202995 ) ) ( not ( = ?auto_202989 ?auto_202995 ) ) ( not ( = ?auto_202990 ?auto_202995 ) ) ( not ( = ?auto_202997 ?auto_202995 ) ) ( not ( = ?auto_202994 ?auto_203000 ) ) ( not ( = ?auto_202998 ?auto_203002 ) ) ( not ( = ?auto_202998 ?auto_203001 ) ) ( not ( = ?auto_202998 ?auto_203004 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_202992 ?auto_202993 ?auto_202988 ?auto_202989 ?auto_202991 ?auto_202990 ?auto_202994 ?auto_202995 ?auto_202996 ?auto_202997 )
      ( GET-5IMAGE-VERIFY ?auto_202988 ?auto_202989 ?auto_202991 ?auto_202990 ?auto_202992 ?auto_202993 ?auto_202994 ?auto_202995 ?auto_202996 ?auto_202997 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_203406 - DIRECTION
      ?auto_203407 - MODE
      ?auto_203409 - DIRECTION
      ?auto_203408 - MODE
      ?auto_203410 - DIRECTION
      ?auto_203411 - MODE
      ?auto_203412 - DIRECTION
      ?auto_203413 - MODE
      ?auto_203414 - DIRECTION
      ?auto_203415 - MODE
    )
    :vars
    (
      ?auto_203416 - INSTRUMENT
      ?auto_203421 - SATELLITE
      ?auto_203417 - DIRECTION
      ?auto_203423 - INSTRUMENT
      ?auto_203420 - INSTRUMENT
      ?auto_203419 - INSTRUMENT
      ?auto_203422 - INSTRUMENT
      ?auto_203418 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_203409 ?auto_203406 ) ) ( not ( = ?auto_203410 ?auto_203406 ) ) ( not ( = ?auto_203410 ?auto_203409 ) ) ( not ( = ?auto_203412 ?auto_203406 ) ) ( not ( = ?auto_203412 ?auto_203409 ) ) ( not ( = ?auto_203412 ?auto_203410 ) ) ( not ( = ?auto_203414 ?auto_203406 ) ) ( not ( = ?auto_203414 ?auto_203409 ) ) ( not ( = ?auto_203414 ?auto_203410 ) ) ( not ( = ?auto_203414 ?auto_203412 ) ) ( ON_BOARD ?auto_203416 ?auto_203421 ) ( SUPPORTS ?auto_203416 ?auto_203415 ) ( not ( = ?auto_203414 ?auto_203417 ) ) ( CALIBRATION_TARGET ?auto_203416 ?auto_203417 ) ( not ( = ?auto_203417 ?auto_203410 ) ) ( ON_BOARD ?auto_203423 ?auto_203421 ) ( not ( = ?auto_203416 ?auto_203423 ) ) ( SUPPORTS ?auto_203423 ?auto_203411 ) ( CALIBRATION_TARGET ?auto_203423 ?auto_203417 ) ( not ( = ?auto_203417 ?auto_203409 ) ) ( ON_BOARD ?auto_203420 ?auto_203421 ) ( not ( = ?auto_203423 ?auto_203420 ) ) ( SUPPORTS ?auto_203420 ?auto_203408 ) ( CALIBRATION_TARGET ?auto_203420 ?auto_203417 ) ( not ( = ?auto_203417 ?auto_203406 ) ) ( ON_BOARD ?auto_203419 ?auto_203421 ) ( not ( = ?auto_203420 ?auto_203419 ) ) ( SUPPORTS ?auto_203419 ?auto_203407 ) ( CALIBRATION_TARGET ?auto_203419 ?auto_203417 ) ( not ( = ?auto_203417 ?auto_203412 ) ) ( ON_BOARD ?auto_203422 ?auto_203421 ) ( not ( = ?auto_203419 ?auto_203422 ) ) ( SUPPORTS ?auto_203422 ?auto_203413 ) ( CALIBRATION_TARGET ?auto_203422 ?auto_203417 ) ( POWER_AVAIL ?auto_203421 ) ( POINTING ?auto_203421 ?auto_203418 ) ( not ( = ?auto_203417 ?auto_203418 ) ) ( not ( = ?auto_203412 ?auto_203418 ) ) ( not ( = ?auto_203413 ?auto_203407 ) ) ( not ( = ?auto_203406 ?auto_203418 ) ) ( not ( = ?auto_203413 ?auto_203408 ) ) ( not ( = ?auto_203407 ?auto_203408 ) ) ( not ( = ?auto_203409 ?auto_203418 ) ) ( not ( = ?auto_203420 ?auto_203422 ) ) ( not ( = ?auto_203413 ?auto_203411 ) ) ( not ( = ?auto_203407 ?auto_203411 ) ) ( not ( = ?auto_203408 ?auto_203411 ) ) ( not ( = ?auto_203410 ?auto_203418 ) ) ( not ( = ?auto_203423 ?auto_203419 ) ) ( not ( = ?auto_203423 ?auto_203422 ) ) ( not ( = ?auto_203413 ?auto_203415 ) ) ( not ( = ?auto_203407 ?auto_203415 ) ) ( not ( = ?auto_203408 ?auto_203415 ) ) ( not ( = ?auto_203411 ?auto_203415 ) ) ( not ( = ?auto_203414 ?auto_203418 ) ) ( not ( = ?auto_203416 ?auto_203420 ) ) ( not ( = ?auto_203416 ?auto_203419 ) ) ( not ( = ?auto_203416 ?auto_203422 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_203412 ?auto_203413 ?auto_203406 ?auto_203407 ?auto_203409 ?auto_203408 ?auto_203414 ?auto_203415 ?auto_203410 ?auto_203411 )
      ( GET-5IMAGE-VERIFY ?auto_203406 ?auto_203407 ?auto_203409 ?auto_203408 ?auto_203410 ?auto_203411 ?auto_203412 ?auto_203413 ?auto_203414 ?auto_203415 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_203484 - DIRECTION
      ?auto_203485 - MODE
      ?auto_203487 - DIRECTION
      ?auto_203486 - MODE
      ?auto_203488 - DIRECTION
      ?auto_203489 - MODE
      ?auto_203490 - DIRECTION
      ?auto_203491 - MODE
      ?auto_203492 - DIRECTION
      ?auto_203493 - MODE
    )
    :vars
    (
      ?auto_203494 - INSTRUMENT
      ?auto_203499 - SATELLITE
      ?auto_203495 - DIRECTION
      ?auto_203501 - INSTRUMENT
      ?auto_203498 - INSTRUMENT
      ?auto_203497 - INSTRUMENT
      ?auto_203500 - INSTRUMENT
      ?auto_203496 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_203487 ?auto_203484 ) ) ( not ( = ?auto_203488 ?auto_203484 ) ) ( not ( = ?auto_203488 ?auto_203487 ) ) ( not ( = ?auto_203490 ?auto_203484 ) ) ( not ( = ?auto_203490 ?auto_203487 ) ) ( not ( = ?auto_203490 ?auto_203488 ) ) ( not ( = ?auto_203492 ?auto_203484 ) ) ( not ( = ?auto_203492 ?auto_203487 ) ) ( not ( = ?auto_203492 ?auto_203488 ) ) ( not ( = ?auto_203492 ?auto_203490 ) ) ( ON_BOARD ?auto_203494 ?auto_203499 ) ( SUPPORTS ?auto_203494 ?auto_203491 ) ( not ( = ?auto_203490 ?auto_203495 ) ) ( CALIBRATION_TARGET ?auto_203494 ?auto_203495 ) ( not ( = ?auto_203495 ?auto_203488 ) ) ( ON_BOARD ?auto_203501 ?auto_203499 ) ( not ( = ?auto_203494 ?auto_203501 ) ) ( SUPPORTS ?auto_203501 ?auto_203489 ) ( CALIBRATION_TARGET ?auto_203501 ?auto_203495 ) ( not ( = ?auto_203495 ?auto_203487 ) ) ( ON_BOARD ?auto_203498 ?auto_203499 ) ( not ( = ?auto_203501 ?auto_203498 ) ) ( SUPPORTS ?auto_203498 ?auto_203486 ) ( CALIBRATION_TARGET ?auto_203498 ?auto_203495 ) ( not ( = ?auto_203495 ?auto_203484 ) ) ( ON_BOARD ?auto_203497 ?auto_203499 ) ( not ( = ?auto_203498 ?auto_203497 ) ) ( SUPPORTS ?auto_203497 ?auto_203485 ) ( CALIBRATION_TARGET ?auto_203497 ?auto_203495 ) ( not ( = ?auto_203495 ?auto_203492 ) ) ( ON_BOARD ?auto_203500 ?auto_203499 ) ( not ( = ?auto_203497 ?auto_203500 ) ) ( SUPPORTS ?auto_203500 ?auto_203493 ) ( CALIBRATION_TARGET ?auto_203500 ?auto_203495 ) ( POWER_AVAIL ?auto_203499 ) ( POINTING ?auto_203499 ?auto_203496 ) ( not ( = ?auto_203495 ?auto_203496 ) ) ( not ( = ?auto_203492 ?auto_203496 ) ) ( not ( = ?auto_203493 ?auto_203485 ) ) ( not ( = ?auto_203484 ?auto_203496 ) ) ( not ( = ?auto_203493 ?auto_203486 ) ) ( not ( = ?auto_203485 ?auto_203486 ) ) ( not ( = ?auto_203487 ?auto_203496 ) ) ( not ( = ?auto_203498 ?auto_203500 ) ) ( not ( = ?auto_203493 ?auto_203489 ) ) ( not ( = ?auto_203485 ?auto_203489 ) ) ( not ( = ?auto_203486 ?auto_203489 ) ) ( not ( = ?auto_203488 ?auto_203496 ) ) ( not ( = ?auto_203501 ?auto_203497 ) ) ( not ( = ?auto_203501 ?auto_203500 ) ) ( not ( = ?auto_203493 ?auto_203491 ) ) ( not ( = ?auto_203485 ?auto_203491 ) ) ( not ( = ?auto_203486 ?auto_203491 ) ) ( not ( = ?auto_203489 ?auto_203491 ) ) ( not ( = ?auto_203490 ?auto_203496 ) ) ( not ( = ?auto_203494 ?auto_203498 ) ) ( not ( = ?auto_203494 ?auto_203497 ) ) ( not ( = ?auto_203494 ?auto_203500 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_203492 ?auto_203493 ?auto_203484 ?auto_203485 ?auto_203487 ?auto_203486 ?auto_203490 ?auto_203491 ?auto_203488 ?auto_203489 )
      ( GET-5IMAGE-VERIFY ?auto_203484 ?auto_203485 ?auto_203487 ?auto_203486 ?auto_203488 ?auto_203489 ?auto_203490 ?auto_203491 ?auto_203492 ?auto_203493 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_203642 - DIRECTION
      ?auto_203643 - MODE
      ?auto_203645 - DIRECTION
      ?auto_203644 - MODE
      ?auto_203646 - DIRECTION
      ?auto_203647 - MODE
      ?auto_203648 - DIRECTION
      ?auto_203649 - MODE
      ?auto_203650 - DIRECTION
      ?auto_203651 - MODE
    )
    :vars
    (
      ?auto_203652 - INSTRUMENT
      ?auto_203657 - SATELLITE
      ?auto_203653 - DIRECTION
      ?auto_203659 - INSTRUMENT
      ?auto_203656 - INSTRUMENT
      ?auto_203655 - INSTRUMENT
      ?auto_203658 - INSTRUMENT
      ?auto_203654 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_203645 ?auto_203642 ) ) ( not ( = ?auto_203646 ?auto_203642 ) ) ( not ( = ?auto_203646 ?auto_203645 ) ) ( not ( = ?auto_203648 ?auto_203642 ) ) ( not ( = ?auto_203648 ?auto_203645 ) ) ( not ( = ?auto_203648 ?auto_203646 ) ) ( not ( = ?auto_203650 ?auto_203642 ) ) ( not ( = ?auto_203650 ?auto_203645 ) ) ( not ( = ?auto_203650 ?auto_203646 ) ) ( not ( = ?auto_203650 ?auto_203648 ) ) ( ON_BOARD ?auto_203652 ?auto_203657 ) ( SUPPORTS ?auto_203652 ?auto_203647 ) ( not ( = ?auto_203646 ?auto_203653 ) ) ( CALIBRATION_TARGET ?auto_203652 ?auto_203653 ) ( not ( = ?auto_203653 ?auto_203650 ) ) ( ON_BOARD ?auto_203659 ?auto_203657 ) ( not ( = ?auto_203652 ?auto_203659 ) ) ( SUPPORTS ?auto_203659 ?auto_203651 ) ( CALIBRATION_TARGET ?auto_203659 ?auto_203653 ) ( not ( = ?auto_203653 ?auto_203645 ) ) ( ON_BOARD ?auto_203656 ?auto_203657 ) ( not ( = ?auto_203659 ?auto_203656 ) ) ( SUPPORTS ?auto_203656 ?auto_203644 ) ( CALIBRATION_TARGET ?auto_203656 ?auto_203653 ) ( not ( = ?auto_203653 ?auto_203642 ) ) ( ON_BOARD ?auto_203655 ?auto_203657 ) ( not ( = ?auto_203656 ?auto_203655 ) ) ( SUPPORTS ?auto_203655 ?auto_203643 ) ( CALIBRATION_TARGET ?auto_203655 ?auto_203653 ) ( not ( = ?auto_203653 ?auto_203648 ) ) ( ON_BOARD ?auto_203658 ?auto_203657 ) ( not ( = ?auto_203655 ?auto_203658 ) ) ( SUPPORTS ?auto_203658 ?auto_203649 ) ( CALIBRATION_TARGET ?auto_203658 ?auto_203653 ) ( POWER_AVAIL ?auto_203657 ) ( POINTING ?auto_203657 ?auto_203654 ) ( not ( = ?auto_203653 ?auto_203654 ) ) ( not ( = ?auto_203648 ?auto_203654 ) ) ( not ( = ?auto_203649 ?auto_203643 ) ) ( not ( = ?auto_203642 ?auto_203654 ) ) ( not ( = ?auto_203649 ?auto_203644 ) ) ( not ( = ?auto_203643 ?auto_203644 ) ) ( not ( = ?auto_203645 ?auto_203654 ) ) ( not ( = ?auto_203656 ?auto_203658 ) ) ( not ( = ?auto_203649 ?auto_203651 ) ) ( not ( = ?auto_203643 ?auto_203651 ) ) ( not ( = ?auto_203644 ?auto_203651 ) ) ( not ( = ?auto_203650 ?auto_203654 ) ) ( not ( = ?auto_203659 ?auto_203655 ) ) ( not ( = ?auto_203659 ?auto_203658 ) ) ( not ( = ?auto_203649 ?auto_203647 ) ) ( not ( = ?auto_203643 ?auto_203647 ) ) ( not ( = ?auto_203644 ?auto_203647 ) ) ( not ( = ?auto_203651 ?auto_203647 ) ) ( not ( = ?auto_203646 ?auto_203654 ) ) ( not ( = ?auto_203652 ?auto_203656 ) ) ( not ( = ?auto_203652 ?auto_203655 ) ) ( not ( = ?auto_203652 ?auto_203658 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_203648 ?auto_203649 ?auto_203642 ?auto_203643 ?auto_203645 ?auto_203644 ?auto_203646 ?auto_203647 ?auto_203650 ?auto_203651 )
      ( GET-5IMAGE-VERIFY ?auto_203642 ?auto_203643 ?auto_203645 ?auto_203644 ?auto_203646 ?auto_203647 ?auto_203648 ?auto_203649 ?auto_203650 ?auto_203651 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_203892 - DIRECTION
      ?auto_203893 - MODE
      ?auto_203895 - DIRECTION
      ?auto_203894 - MODE
      ?auto_203896 - DIRECTION
      ?auto_203897 - MODE
      ?auto_203898 - DIRECTION
      ?auto_203899 - MODE
      ?auto_203900 - DIRECTION
      ?auto_203901 - MODE
    )
    :vars
    (
      ?auto_203902 - INSTRUMENT
      ?auto_203907 - SATELLITE
      ?auto_203903 - DIRECTION
      ?auto_203909 - INSTRUMENT
      ?auto_203906 - INSTRUMENT
      ?auto_203905 - INSTRUMENT
      ?auto_203908 - INSTRUMENT
      ?auto_203904 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_203895 ?auto_203892 ) ) ( not ( = ?auto_203896 ?auto_203892 ) ) ( not ( = ?auto_203896 ?auto_203895 ) ) ( not ( = ?auto_203898 ?auto_203892 ) ) ( not ( = ?auto_203898 ?auto_203895 ) ) ( not ( = ?auto_203898 ?auto_203896 ) ) ( not ( = ?auto_203900 ?auto_203892 ) ) ( not ( = ?auto_203900 ?auto_203895 ) ) ( not ( = ?auto_203900 ?auto_203896 ) ) ( not ( = ?auto_203900 ?auto_203898 ) ) ( ON_BOARD ?auto_203902 ?auto_203907 ) ( SUPPORTS ?auto_203902 ?auto_203897 ) ( not ( = ?auto_203896 ?auto_203903 ) ) ( CALIBRATION_TARGET ?auto_203902 ?auto_203903 ) ( not ( = ?auto_203903 ?auto_203898 ) ) ( ON_BOARD ?auto_203909 ?auto_203907 ) ( not ( = ?auto_203902 ?auto_203909 ) ) ( SUPPORTS ?auto_203909 ?auto_203899 ) ( CALIBRATION_TARGET ?auto_203909 ?auto_203903 ) ( not ( = ?auto_203903 ?auto_203895 ) ) ( ON_BOARD ?auto_203906 ?auto_203907 ) ( not ( = ?auto_203909 ?auto_203906 ) ) ( SUPPORTS ?auto_203906 ?auto_203894 ) ( CALIBRATION_TARGET ?auto_203906 ?auto_203903 ) ( not ( = ?auto_203903 ?auto_203892 ) ) ( ON_BOARD ?auto_203905 ?auto_203907 ) ( not ( = ?auto_203906 ?auto_203905 ) ) ( SUPPORTS ?auto_203905 ?auto_203893 ) ( CALIBRATION_TARGET ?auto_203905 ?auto_203903 ) ( not ( = ?auto_203903 ?auto_203900 ) ) ( ON_BOARD ?auto_203908 ?auto_203907 ) ( not ( = ?auto_203905 ?auto_203908 ) ) ( SUPPORTS ?auto_203908 ?auto_203901 ) ( CALIBRATION_TARGET ?auto_203908 ?auto_203903 ) ( POWER_AVAIL ?auto_203907 ) ( POINTING ?auto_203907 ?auto_203904 ) ( not ( = ?auto_203903 ?auto_203904 ) ) ( not ( = ?auto_203900 ?auto_203904 ) ) ( not ( = ?auto_203901 ?auto_203893 ) ) ( not ( = ?auto_203892 ?auto_203904 ) ) ( not ( = ?auto_203901 ?auto_203894 ) ) ( not ( = ?auto_203893 ?auto_203894 ) ) ( not ( = ?auto_203895 ?auto_203904 ) ) ( not ( = ?auto_203906 ?auto_203908 ) ) ( not ( = ?auto_203901 ?auto_203899 ) ) ( not ( = ?auto_203893 ?auto_203899 ) ) ( not ( = ?auto_203894 ?auto_203899 ) ) ( not ( = ?auto_203898 ?auto_203904 ) ) ( not ( = ?auto_203909 ?auto_203905 ) ) ( not ( = ?auto_203909 ?auto_203908 ) ) ( not ( = ?auto_203901 ?auto_203897 ) ) ( not ( = ?auto_203893 ?auto_203897 ) ) ( not ( = ?auto_203894 ?auto_203897 ) ) ( not ( = ?auto_203899 ?auto_203897 ) ) ( not ( = ?auto_203896 ?auto_203904 ) ) ( not ( = ?auto_203902 ?auto_203906 ) ) ( not ( = ?auto_203902 ?auto_203905 ) ) ( not ( = ?auto_203902 ?auto_203908 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_203900 ?auto_203901 ?auto_203892 ?auto_203893 ?auto_203895 ?auto_203894 ?auto_203896 ?auto_203897 ?auto_203898 ?auto_203899 )
      ( GET-5IMAGE-VERIFY ?auto_203892 ?auto_203893 ?auto_203895 ?auto_203894 ?auto_203896 ?auto_203897 ?auto_203898 ?auto_203899 ?auto_203900 ?auto_203901 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_204136 - DIRECTION
      ?auto_204137 - MODE
      ?auto_204139 - DIRECTION
      ?auto_204138 - MODE
      ?auto_204140 - DIRECTION
      ?auto_204141 - MODE
      ?auto_204142 - DIRECTION
      ?auto_204143 - MODE
      ?auto_204144 - DIRECTION
      ?auto_204145 - MODE
    )
    :vars
    (
      ?auto_204146 - INSTRUMENT
      ?auto_204151 - SATELLITE
      ?auto_204147 - DIRECTION
      ?auto_204153 - INSTRUMENT
      ?auto_204150 - INSTRUMENT
      ?auto_204149 - INSTRUMENT
      ?auto_204152 - INSTRUMENT
      ?auto_204148 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_204139 ?auto_204136 ) ) ( not ( = ?auto_204140 ?auto_204136 ) ) ( not ( = ?auto_204140 ?auto_204139 ) ) ( not ( = ?auto_204142 ?auto_204136 ) ) ( not ( = ?auto_204142 ?auto_204139 ) ) ( not ( = ?auto_204142 ?auto_204140 ) ) ( not ( = ?auto_204144 ?auto_204136 ) ) ( not ( = ?auto_204144 ?auto_204139 ) ) ( not ( = ?auto_204144 ?auto_204140 ) ) ( not ( = ?auto_204144 ?auto_204142 ) ) ( ON_BOARD ?auto_204146 ?auto_204151 ) ( SUPPORTS ?auto_204146 ?auto_204145 ) ( not ( = ?auto_204144 ?auto_204147 ) ) ( CALIBRATION_TARGET ?auto_204146 ?auto_204147 ) ( not ( = ?auto_204147 ?auto_204139 ) ) ( ON_BOARD ?auto_204153 ?auto_204151 ) ( not ( = ?auto_204146 ?auto_204153 ) ) ( SUPPORTS ?auto_204153 ?auto_204138 ) ( CALIBRATION_TARGET ?auto_204153 ?auto_204147 ) ( not ( = ?auto_204147 ?auto_204142 ) ) ( ON_BOARD ?auto_204150 ?auto_204151 ) ( not ( = ?auto_204153 ?auto_204150 ) ) ( SUPPORTS ?auto_204150 ?auto_204143 ) ( CALIBRATION_TARGET ?auto_204150 ?auto_204147 ) ( not ( = ?auto_204147 ?auto_204136 ) ) ( ON_BOARD ?auto_204149 ?auto_204151 ) ( not ( = ?auto_204150 ?auto_204149 ) ) ( SUPPORTS ?auto_204149 ?auto_204137 ) ( CALIBRATION_TARGET ?auto_204149 ?auto_204147 ) ( not ( = ?auto_204147 ?auto_204140 ) ) ( ON_BOARD ?auto_204152 ?auto_204151 ) ( not ( = ?auto_204149 ?auto_204152 ) ) ( SUPPORTS ?auto_204152 ?auto_204141 ) ( CALIBRATION_TARGET ?auto_204152 ?auto_204147 ) ( POWER_AVAIL ?auto_204151 ) ( POINTING ?auto_204151 ?auto_204148 ) ( not ( = ?auto_204147 ?auto_204148 ) ) ( not ( = ?auto_204140 ?auto_204148 ) ) ( not ( = ?auto_204141 ?auto_204137 ) ) ( not ( = ?auto_204136 ?auto_204148 ) ) ( not ( = ?auto_204141 ?auto_204143 ) ) ( not ( = ?auto_204137 ?auto_204143 ) ) ( not ( = ?auto_204142 ?auto_204148 ) ) ( not ( = ?auto_204150 ?auto_204152 ) ) ( not ( = ?auto_204141 ?auto_204138 ) ) ( not ( = ?auto_204137 ?auto_204138 ) ) ( not ( = ?auto_204143 ?auto_204138 ) ) ( not ( = ?auto_204139 ?auto_204148 ) ) ( not ( = ?auto_204153 ?auto_204149 ) ) ( not ( = ?auto_204153 ?auto_204152 ) ) ( not ( = ?auto_204141 ?auto_204145 ) ) ( not ( = ?auto_204137 ?auto_204145 ) ) ( not ( = ?auto_204143 ?auto_204145 ) ) ( not ( = ?auto_204138 ?auto_204145 ) ) ( not ( = ?auto_204144 ?auto_204148 ) ) ( not ( = ?auto_204146 ?auto_204150 ) ) ( not ( = ?auto_204146 ?auto_204149 ) ) ( not ( = ?auto_204146 ?auto_204152 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_204140 ?auto_204141 ?auto_204136 ?auto_204137 ?auto_204142 ?auto_204143 ?auto_204144 ?auto_204145 ?auto_204139 ?auto_204138 )
      ( GET-5IMAGE-VERIFY ?auto_204136 ?auto_204137 ?auto_204139 ?auto_204138 ?auto_204140 ?auto_204141 ?auto_204142 ?auto_204143 ?auto_204144 ?auto_204145 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_204214 - DIRECTION
      ?auto_204215 - MODE
      ?auto_204217 - DIRECTION
      ?auto_204216 - MODE
      ?auto_204218 - DIRECTION
      ?auto_204219 - MODE
      ?auto_204220 - DIRECTION
      ?auto_204221 - MODE
      ?auto_204222 - DIRECTION
      ?auto_204223 - MODE
    )
    :vars
    (
      ?auto_204224 - INSTRUMENT
      ?auto_204229 - SATELLITE
      ?auto_204225 - DIRECTION
      ?auto_204231 - INSTRUMENT
      ?auto_204228 - INSTRUMENT
      ?auto_204227 - INSTRUMENT
      ?auto_204230 - INSTRUMENT
      ?auto_204226 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_204217 ?auto_204214 ) ) ( not ( = ?auto_204218 ?auto_204214 ) ) ( not ( = ?auto_204218 ?auto_204217 ) ) ( not ( = ?auto_204220 ?auto_204214 ) ) ( not ( = ?auto_204220 ?auto_204217 ) ) ( not ( = ?auto_204220 ?auto_204218 ) ) ( not ( = ?auto_204222 ?auto_204214 ) ) ( not ( = ?auto_204222 ?auto_204217 ) ) ( not ( = ?auto_204222 ?auto_204218 ) ) ( not ( = ?auto_204222 ?auto_204220 ) ) ( ON_BOARD ?auto_204224 ?auto_204229 ) ( SUPPORTS ?auto_204224 ?auto_204221 ) ( not ( = ?auto_204220 ?auto_204225 ) ) ( CALIBRATION_TARGET ?auto_204224 ?auto_204225 ) ( not ( = ?auto_204225 ?auto_204217 ) ) ( ON_BOARD ?auto_204231 ?auto_204229 ) ( not ( = ?auto_204224 ?auto_204231 ) ) ( SUPPORTS ?auto_204231 ?auto_204216 ) ( CALIBRATION_TARGET ?auto_204231 ?auto_204225 ) ( not ( = ?auto_204225 ?auto_204222 ) ) ( ON_BOARD ?auto_204228 ?auto_204229 ) ( not ( = ?auto_204231 ?auto_204228 ) ) ( SUPPORTS ?auto_204228 ?auto_204223 ) ( CALIBRATION_TARGET ?auto_204228 ?auto_204225 ) ( not ( = ?auto_204225 ?auto_204214 ) ) ( ON_BOARD ?auto_204227 ?auto_204229 ) ( not ( = ?auto_204228 ?auto_204227 ) ) ( SUPPORTS ?auto_204227 ?auto_204215 ) ( CALIBRATION_TARGET ?auto_204227 ?auto_204225 ) ( not ( = ?auto_204225 ?auto_204218 ) ) ( ON_BOARD ?auto_204230 ?auto_204229 ) ( not ( = ?auto_204227 ?auto_204230 ) ) ( SUPPORTS ?auto_204230 ?auto_204219 ) ( CALIBRATION_TARGET ?auto_204230 ?auto_204225 ) ( POWER_AVAIL ?auto_204229 ) ( POINTING ?auto_204229 ?auto_204226 ) ( not ( = ?auto_204225 ?auto_204226 ) ) ( not ( = ?auto_204218 ?auto_204226 ) ) ( not ( = ?auto_204219 ?auto_204215 ) ) ( not ( = ?auto_204214 ?auto_204226 ) ) ( not ( = ?auto_204219 ?auto_204223 ) ) ( not ( = ?auto_204215 ?auto_204223 ) ) ( not ( = ?auto_204222 ?auto_204226 ) ) ( not ( = ?auto_204228 ?auto_204230 ) ) ( not ( = ?auto_204219 ?auto_204216 ) ) ( not ( = ?auto_204215 ?auto_204216 ) ) ( not ( = ?auto_204223 ?auto_204216 ) ) ( not ( = ?auto_204217 ?auto_204226 ) ) ( not ( = ?auto_204231 ?auto_204227 ) ) ( not ( = ?auto_204231 ?auto_204230 ) ) ( not ( = ?auto_204219 ?auto_204221 ) ) ( not ( = ?auto_204215 ?auto_204221 ) ) ( not ( = ?auto_204223 ?auto_204221 ) ) ( not ( = ?auto_204216 ?auto_204221 ) ) ( not ( = ?auto_204220 ?auto_204226 ) ) ( not ( = ?auto_204224 ?auto_204228 ) ) ( not ( = ?auto_204224 ?auto_204227 ) ) ( not ( = ?auto_204224 ?auto_204230 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_204218 ?auto_204219 ?auto_204214 ?auto_204215 ?auto_204222 ?auto_204223 ?auto_204220 ?auto_204221 ?auto_204217 ?auto_204216 )
      ( GET-5IMAGE-VERIFY ?auto_204214 ?auto_204215 ?auto_204217 ?auto_204216 ?auto_204218 ?auto_204219 ?auto_204220 ?auto_204221 ?auto_204222 ?auto_204223 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_204462 - DIRECTION
      ?auto_204463 - MODE
      ?auto_204465 - DIRECTION
      ?auto_204464 - MODE
      ?auto_204466 - DIRECTION
      ?auto_204467 - MODE
      ?auto_204468 - DIRECTION
      ?auto_204469 - MODE
      ?auto_204470 - DIRECTION
      ?auto_204471 - MODE
    )
    :vars
    (
      ?auto_204472 - INSTRUMENT
      ?auto_204477 - SATELLITE
      ?auto_204473 - DIRECTION
      ?auto_204479 - INSTRUMENT
      ?auto_204476 - INSTRUMENT
      ?auto_204475 - INSTRUMENT
      ?auto_204478 - INSTRUMENT
      ?auto_204474 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_204465 ?auto_204462 ) ) ( not ( = ?auto_204466 ?auto_204462 ) ) ( not ( = ?auto_204466 ?auto_204465 ) ) ( not ( = ?auto_204468 ?auto_204462 ) ) ( not ( = ?auto_204468 ?auto_204465 ) ) ( not ( = ?auto_204468 ?auto_204466 ) ) ( not ( = ?auto_204470 ?auto_204462 ) ) ( not ( = ?auto_204470 ?auto_204465 ) ) ( not ( = ?auto_204470 ?auto_204466 ) ) ( not ( = ?auto_204470 ?auto_204468 ) ) ( ON_BOARD ?auto_204472 ?auto_204477 ) ( SUPPORTS ?auto_204472 ?auto_204471 ) ( not ( = ?auto_204470 ?auto_204473 ) ) ( CALIBRATION_TARGET ?auto_204472 ?auto_204473 ) ( not ( = ?auto_204473 ?auto_204465 ) ) ( ON_BOARD ?auto_204479 ?auto_204477 ) ( not ( = ?auto_204472 ?auto_204479 ) ) ( SUPPORTS ?auto_204479 ?auto_204464 ) ( CALIBRATION_TARGET ?auto_204479 ?auto_204473 ) ( not ( = ?auto_204473 ?auto_204466 ) ) ( ON_BOARD ?auto_204476 ?auto_204477 ) ( not ( = ?auto_204479 ?auto_204476 ) ) ( SUPPORTS ?auto_204476 ?auto_204467 ) ( CALIBRATION_TARGET ?auto_204476 ?auto_204473 ) ( not ( = ?auto_204473 ?auto_204462 ) ) ( ON_BOARD ?auto_204475 ?auto_204477 ) ( not ( = ?auto_204476 ?auto_204475 ) ) ( SUPPORTS ?auto_204475 ?auto_204463 ) ( CALIBRATION_TARGET ?auto_204475 ?auto_204473 ) ( not ( = ?auto_204473 ?auto_204468 ) ) ( ON_BOARD ?auto_204478 ?auto_204477 ) ( not ( = ?auto_204475 ?auto_204478 ) ) ( SUPPORTS ?auto_204478 ?auto_204469 ) ( CALIBRATION_TARGET ?auto_204478 ?auto_204473 ) ( POWER_AVAIL ?auto_204477 ) ( POINTING ?auto_204477 ?auto_204474 ) ( not ( = ?auto_204473 ?auto_204474 ) ) ( not ( = ?auto_204468 ?auto_204474 ) ) ( not ( = ?auto_204469 ?auto_204463 ) ) ( not ( = ?auto_204462 ?auto_204474 ) ) ( not ( = ?auto_204469 ?auto_204467 ) ) ( not ( = ?auto_204463 ?auto_204467 ) ) ( not ( = ?auto_204466 ?auto_204474 ) ) ( not ( = ?auto_204476 ?auto_204478 ) ) ( not ( = ?auto_204469 ?auto_204464 ) ) ( not ( = ?auto_204463 ?auto_204464 ) ) ( not ( = ?auto_204467 ?auto_204464 ) ) ( not ( = ?auto_204465 ?auto_204474 ) ) ( not ( = ?auto_204479 ?auto_204475 ) ) ( not ( = ?auto_204479 ?auto_204478 ) ) ( not ( = ?auto_204469 ?auto_204471 ) ) ( not ( = ?auto_204463 ?auto_204471 ) ) ( not ( = ?auto_204467 ?auto_204471 ) ) ( not ( = ?auto_204464 ?auto_204471 ) ) ( not ( = ?auto_204470 ?auto_204474 ) ) ( not ( = ?auto_204472 ?auto_204476 ) ) ( not ( = ?auto_204472 ?auto_204475 ) ) ( not ( = ?auto_204472 ?auto_204478 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_204468 ?auto_204469 ?auto_204462 ?auto_204463 ?auto_204466 ?auto_204467 ?auto_204470 ?auto_204471 ?auto_204465 ?auto_204464 )
      ( GET-5IMAGE-VERIFY ?auto_204462 ?auto_204463 ?auto_204465 ?auto_204464 ?auto_204466 ?auto_204467 ?auto_204468 ?auto_204469 ?auto_204470 ?auto_204471 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_204540 - DIRECTION
      ?auto_204541 - MODE
      ?auto_204543 - DIRECTION
      ?auto_204542 - MODE
      ?auto_204544 - DIRECTION
      ?auto_204545 - MODE
      ?auto_204546 - DIRECTION
      ?auto_204547 - MODE
      ?auto_204548 - DIRECTION
      ?auto_204549 - MODE
    )
    :vars
    (
      ?auto_204550 - INSTRUMENT
      ?auto_204555 - SATELLITE
      ?auto_204551 - DIRECTION
      ?auto_204557 - INSTRUMENT
      ?auto_204554 - INSTRUMENT
      ?auto_204553 - INSTRUMENT
      ?auto_204556 - INSTRUMENT
      ?auto_204552 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_204543 ?auto_204540 ) ) ( not ( = ?auto_204544 ?auto_204540 ) ) ( not ( = ?auto_204544 ?auto_204543 ) ) ( not ( = ?auto_204546 ?auto_204540 ) ) ( not ( = ?auto_204546 ?auto_204543 ) ) ( not ( = ?auto_204546 ?auto_204544 ) ) ( not ( = ?auto_204548 ?auto_204540 ) ) ( not ( = ?auto_204548 ?auto_204543 ) ) ( not ( = ?auto_204548 ?auto_204544 ) ) ( not ( = ?auto_204548 ?auto_204546 ) ) ( ON_BOARD ?auto_204550 ?auto_204555 ) ( SUPPORTS ?auto_204550 ?auto_204547 ) ( not ( = ?auto_204546 ?auto_204551 ) ) ( CALIBRATION_TARGET ?auto_204550 ?auto_204551 ) ( not ( = ?auto_204551 ?auto_204543 ) ) ( ON_BOARD ?auto_204557 ?auto_204555 ) ( not ( = ?auto_204550 ?auto_204557 ) ) ( SUPPORTS ?auto_204557 ?auto_204542 ) ( CALIBRATION_TARGET ?auto_204557 ?auto_204551 ) ( not ( = ?auto_204551 ?auto_204544 ) ) ( ON_BOARD ?auto_204554 ?auto_204555 ) ( not ( = ?auto_204557 ?auto_204554 ) ) ( SUPPORTS ?auto_204554 ?auto_204545 ) ( CALIBRATION_TARGET ?auto_204554 ?auto_204551 ) ( not ( = ?auto_204551 ?auto_204540 ) ) ( ON_BOARD ?auto_204553 ?auto_204555 ) ( not ( = ?auto_204554 ?auto_204553 ) ) ( SUPPORTS ?auto_204553 ?auto_204541 ) ( CALIBRATION_TARGET ?auto_204553 ?auto_204551 ) ( not ( = ?auto_204551 ?auto_204548 ) ) ( ON_BOARD ?auto_204556 ?auto_204555 ) ( not ( = ?auto_204553 ?auto_204556 ) ) ( SUPPORTS ?auto_204556 ?auto_204549 ) ( CALIBRATION_TARGET ?auto_204556 ?auto_204551 ) ( POWER_AVAIL ?auto_204555 ) ( POINTING ?auto_204555 ?auto_204552 ) ( not ( = ?auto_204551 ?auto_204552 ) ) ( not ( = ?auto_204548 ?auto_204552 ) ) ( not ( = ?auto_204549 ?auto_204541 ) ) ( not ( = ?auto_204540 ?auto_204552 ) ) ( not ( = ?auto_204549 ?auto_204545 ) ) ( not ( = ?auto_204541 ?auto_204545 ) ) ( not ( = ?auto_204544 ?auto_204552 ) ) ( not ( = ?auto_204554 ?auto_204556 ) ) ( not ( = ?auto_204549 ?auto_204542 ) ) ( not ( = ?auto_204541 ?auto_204542 ) ) ( not ( = ?auto_204545 ?auto_204542 ) ) ( not ( = ?auto_204543 ?auto_204552 ) ) ( not ( = ?auto_204557 ?auto_204553 ) ) ( not ( = ?auto_204557 ?auto_204556 ) ) ( not ( = ?auto_204549 ?auto_204547 ) ) ( not ( = ?auto_204541 ?auto_204547 ) ) ( not ( = ?auto_204545 ?auto_204547 ) ) ( not ( = ?auto_204542 ?auto_204547 ) ) ( not ( = ?auto_204546 ?auto_204552 ) ) ( not ( = ?auto_204550 ?auto_204554 ) ) ( not ( = ?auto_204550 ?auto_204553 ) ) ( not ( = ?auto_204550 ?auto_204556 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_204548 ?auto_204549 ?auto_204540 ?auto_204541 ?auto_204544 ?auto_204545 ?auto_204546 ?auto_204547 ?auto_204543 ?auto_204542 )
      ( GET-5IMAGE-VERIFY ?auto_204540 ?auto_204541 ?auto_204543 ?auto_204542 ?auto_204544 ?auto_204545 ?auto_204546 ?auto_204547 ?auto_204548 ?auto_204549 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_204868 - DIRECTION
      ?auto_204869 - MODE
      ?auto_204871 - DIRECTION
      ?auto_204870 - MODE
      ?auto_204872 - DIRECTION
      ?auto_204873 - MODE
      ?auto_204874 - DIRECTION
      ?auto_204875 - MODE
      ?auto_204876 - DIRECTION
      ?auto_204877 - MODE
    )
    :vars
    (
      ?auto_204878 - INSTRUMENT
      ?auto_204883 - SATELLITE
      ?auto_204879 - DIRECTION
      ?auto_204885 - INSTRUMENT
      ?auto_204882 - INSTRUMENT
      ?auto_204881 - INSTRUMENT
      ?auto_204884 - INSTRUMENT
      ?auto_204880 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_204871 ?auto_204868 ) ) ( not ( = ?auto_204872 ?auto_204868 ) ) ( not ( = ?auto_204872 ?auto_204871 ) ) ( not ( = ?auto_204874 ?auto_204868 ) ) ( not ( = ?auto_204874 ?auto_204871 ) ) ( not ( = ?auto_204874 ?auto_204872 ) ) ( not ( = ?auto_204876 ?auto_204868 ) ) ( not ( = ?auto_204876 ?auto_204871 ) ) ( not ( = ?auto_204876 ?auto_204872 ) ) ( not ( = ?auto_204876 ?auto_204874 ) ) ( ON_BOARD ?auto_204878 ?auto_204883 ) ( SUPPORTS ?auto_204878 ?auto_204873 ) ( not ( = ?auto_204872 ?auto_204879 ) ) ( CALIBRATION_TARGET ?auto_204878 ?auto_204879 ) ( not ( = ?auto_204879 ?auto_204871 ) ) ( ON_BOARD ?auto_204885 ?auto_204883 ) ( not ( = ?auto_204878 ?auto_204885 ) ) ( SUPPORTS ?auto_204885 ?auto_204870 ) ( CALIBRATION_TARGET ?auto_204885 ?auto_204879 ) ( not ( = ?auto_204879 ?auto_204876 ) ) ( ON_BOARD ?auto_204882 ?auto_204883 ) ( not ( = ?auto_204885 ?auto_204882 ) ) ( SUPPORTS ?auto_204882 ?auto_204877 ) ( CALIBRATION_TARGET ?auto_204882 ?auto_204879 ) ( not ( = ?auto_204879 ?auto_204868 ) ) ( ON_BOARD ?auto_204881 ?auto_204883 ) ( not ( = ?auto_204882 ?auto_204881 ) ) ( SUPPORTS ?auto_204881 ?auto_204869 ) ( CALIBRATION_TARGET ?auto_204881 ?auto_204879 ) ( not ( = ?auto_204879 ?auto_204874 ) ) ( ON_BOARD ?auto_204884 ?auto_204883 ) ( not ( = ?auto_204881 ?auto_204884 ) ) ( SUPPORTS ?auto_204884 ?auto_204875 ) ( CALIBRATION_TARGET ?auto_204884 ?auto_204879 ) ( POWER_AVAIL ?auto_204883 ) ( POINTING ?auto_204883 ?auto_204880 ) ( not ( = ?auto_204879 ?auto_204880 ) ) ( not ( = ?auto_204874 ?auto_204880 ) ) ( not ( = ?auto_204875 ?auto_204869 ) ) ( not ( = ?auto_204868 ?auto_204880 ) ) ( not ( = ?auto_204875 ?auto_204877 ) ) ( not ( = ?auto_204869 ?auto_204877 ) ) ( not ( = ?auto_204876 ?auto_204880 ) ) ( not ( = ?auto_204882 ?auto_204884 ) ) ( not ( = ?auto_204875 ?auto_204870 ) ) ( not ( = ?auto_204869 ?auto_204870 ) ) ( not ( = ?auto_204877 ?auto_204870 ) ) ( not ( = ?auto_204871 ?auto_204880 ) ) ( not ( = ?auto_204885 ?auto_204881 ) ) ( not ( = ?auto_204885 ?auto_204884 ) ) ( not ( = ?auto_204875 ?auto_204873 ) ) ( not ( = ?auto_204869 ?auto_204873 ) ) ( not ( = ?auto_204877 ?auto_204873 ) ) ( not ( = ?auto_204870 ?auto_204873 ) ) ( not ( = ?auto_204872 ?auto_204880 ) ) ( not ( = ?auto_204878 ?auto_204882 ) ) ( not ( = ?auto_204878 ?auto_204881 ) ) ( not ( = ?auto_204878 ?auto_204884 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_204874 ?auto_204875 ?auto_204868 ?auto_204869 ?auto_204876 ?auto_204877 ?auto_204872 ?auto_204873 ?auto_204871 ?auto_204870 )
      ( GET-5IMAGE-VERIFY ?auto_204868 ?auto_204869 ?auto_204871 ?auto_204870 ?auto_204872 ?auto_204873 ?auto_204874 ?auto_204875 ?auto_204876 ?auto_204877 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_205032 - DIRECTION
      ?auto_205033 - MODE
      ?auto_205035 - DIRECTION
      ?auto_205034 - MODE
      ?auto_205036 - DIRECTION
      ?auto_205037 - MODE
      ?auto_205038 - DIRECTION
      ?auto_205039 - MODE
      ?auto_205040 - DIRECTION
      ?auto_205041 - MODE
    )
    :vars
    (
      ?auto_205042 - INSTRUMENT
      ?auto_205047 - SATELLITE
      ?auto_205043 - DIRECTION
      ?auto_205049 - INSTRUMENT
      ?auto_205046 - INSTRUMENT
      ?auto_205045 - INSTRUMENT
      ?auto_205048 - INSTRUMENT
      ?auto_205044 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_205035 ?auto_205032 ) ) ( not ( = ?auto_205036 ?auto_205032 ) ) ( not ( = ?auto_205036 ?auto_205035 ) ) ( not ( = ?auto_205038 ?auto_205032 ) ) ( not ( = ?auto_205038 ?auto_205035 ) ) ( not ( = ?auto_205038 ?auto_205036 ) ) ( not ( = ?auto_205040 ?auto_205032 ) ) ( not ( = ?auto_205040 ?auto_205035 ) ) ( not ( = ?auto_205040 ?auto_205036 ) ) ( not ( = ?auto_205040 ?auto_205038 ) ) ( ON_BOARD ?auto_205042 ?auto_205047 ) ( SUPPORTS ?auto_205042 ?auto_205037 ) ( not ( = ?auto_205036 ?auto_205043 ) ) ( CALIBRATION_TARGET ?auto_205042 ?auto_205043 ) ( not ( = ?auto_205043 ?auto_205035 ) ) ( ON_BOARD ?auto_205049 ?auto_205047 ) ( not ( = ?auto_205042 ?auto_205049 ) ) ( SUPPORTS ?auto_205049 ?auto_205034 ) ( CALIBRATION_TARGET ?auto_205049 ?auto_205043 ) ( not ( = ?auto_205043 ?auto_205038 ) ) ( ON_BOARD ?auto_205046 ?auto_205047 ) ( not ( = ?auto_205049 ?auto_205046 ) ) ( SUPPORTS ?auto_205046 ?auto_205039 ) ( CALIBRATION_TARGET ?auto_205046 ?auto_205043 ) ( not ( = ?auto_205043 ?auto_205032 ) ) ( ON_BOARD ?auto_205045 ?auto_205047 ) ( not ( = ?auto_205046 ?auto_205045 ) ) ( SUPPORTS ?auto_205045 ?auto_205033 ) ( CALIBRATION_TARGET ?auto_205045 ?auto_205043 ) ( not ( = ?auto_205043 ?auto_205040 ) ) ( ON_BOARD ?auto_205048 ?auto_205047 ) ( not ( = ?auto_205045 ?auto_205048 ) ) ( SUPPORTS ?auto_205048 ?auto_205041 ) ( CALIBRATION_TARGET ?auto_205048 ?auto_205043 ) ( POWER_AVAIL ?auto_205047 ) ( POINTING ?auto_205047 ?auto_205044 ) ( not ( = ?auto_205043 ?auto_205044 ) ) ( not ( = ?auto_205040 ?auto_205044 ) ) ( not ( = ?auto_205041 ?auto_205033 ) ) ( not ( = ?auto_205032 ?auto_205044 ) ) ( not ( = ?auto_205041 ?auto_205039 ) ) ( not ( = ?auto_205033 ?auto_205039 ) ) ( not ( = ?auto_205038 ?auto_205044 ) ) ( not ( = ?auto_205046 ?auto_205048 ) ) ( not ( = ?auto_205041 ?auto_205034 ) ) ( not ( = ?auto_205033 ?auto_205034 ) ) ( not ( = ?auto_205039 ?auto_205034 ) ) ( not ( = ?auto_205035 ?auto_205044 ) ) ( not ( = ?auto_205049 ?auto_205045 ) ) ( not ( = ?auto_205049 ?auto_205048 ) ) ( not ( = ?auto_205041 ?auto_205037 ) ) ( not ( = ?auto_205033 ?auto_205037 ) ) ( not ( = ?auto_205039 ?auto_205037 ) ) ( not ( = ?auto_205034 ?auto_205037 ) ) ( not ( = ?auto_205036 ?auto_205044 ) ) ( not ( = ?auto_205042 ?auto_205046 ) ) ( not ( = ?auto_205042 ?auto_205045 ) ) ( not ( = ?auto_205042 ?auto_205048 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_205040 ?auto_205041 ?auto_205032 ?auto_205033 ?auto_205038 ?auto_205039 ?auto_205036 ?auto_205037 ?auto_205035 ?auto_205034 )
      ( GET-5IMAGE-VERIFY ?auto_205032 ?auto_205033 ?auto_205035 ?auto_205034 ?auto_205036 ?auto_205037 ?auto_205038 ?auto_205039 ?auto_205040 ?auto_205041 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_205614 - DIRECTION
      ?auto_205615 - MODE
      ?auto_205617 - DIRECTION
      ?auto_205616 - MODE
      ?auto_205618 - DIRECTION
      ?auto_205619 - MODE
      ?auto_205620 - DIRECTION
      ?auto_205621 - MODE
      ?auto_205622 - DIRECTION
      ?auto_205623 - MODE
    )
    :vars
    (
      ?auto_205624 - INSTRUMENT
      ?auto_205629 - SATELLITE
      ?auto_205625 - DIRECTION
      ?auto_205631 - INSTRUMENT
      ?auto_205628 - INSTRUMENT
      ?auto_205627 - INSTRUMENT
      ?auto_205630 - INSTRUMENT
      ?auto_205626 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_205617 ?auto_205614 ) ) ( not ( = ?auto_205618 ?auto_205614 ) ) ( not ( = ?auto_205618 ?auto_205617 ) ) ( not ( = ?auto_205620 ?auto_205614 ) ) ( not ( = ?auto_205620 ?auto_205617 ) ) ( not ( = ?auto_205620 ?auto_205618 ) ) ( not ( = ?auto_205622 ?auto_205614 ) ) ( not ( = ?auto_205622 ?auto_205617 ) ) ( not ( = ?auto_205622 ?auto_205618 ) ) ( not ( = ?auto_205622 ?auto_205620 ) ) ( ON_BOARD ?auto_205624 ?auto_205629 ) ( SUPPORTS ?auto_205624 ?auto_205616 ) ( not ( = ?auto_205617 ?auto_205625 ) ) ( CALIBRATION_TARGET ?auto_205624 ?auto_205625 ) ( not ( = ?auto_205625 ?auto_205622 ) ) ( ON_BOARD ?auto_205631 ?auto_205629 ) ( not ( = ?auto_205624 ?auto_205631 ) ) ( SUPPORTS ?auto_205631 ?auto_205623 ) ( CALIBRATION_TARGET ?auto_205631 ?auto_205625 ) ( not ( = ?auto_205625 ?auto_205620 ) ) ( ON_BOARD ?auto_205628 ?auto_205629 ) ( not ( = ?auto_205631 ?auto_205628 ) ) ( SUPPORTS ?auto_205628 ?auto_205621 ) ( CALIBRATION_TARGET ?auto_205628 ?auto_205625 ) ( not ( = ?auto_205625 ?auto_205614 ) ) ( ON_BOARD ?auto_205627 ?auto_205629 ) ( not ( = ?auto_205628 ?auto_205627 ) ) ( SUPPORTS ?auto_205627 ?auto_205615 ) ( CALIBRATION_TARGET ?auto_205627 ?auto_205625 ) ( not ( = ?auto_205625 ?auto_205618 ) ) ( ON_BOARD ?auto_205630 ?auto_205629 ) ( not ( = ?auto_205627 ?auto_205630 ) ) ( SUPPORTS ?auto_205630 ?auto_205619 ) ( CALIBRATION_TARGET ?auto_205630 ?auto_205625 ) ( POWER_AVAIL ?auto_205629 ) ( POINTING ?auto_205629 ?auto_205626 ) ( not ( = ?auto_205625 ?auto_205626 ) ) ( not ( = ?auto_205618 ?auto_205626 ) ) ( not ( = ?auto_205619 ?auto_205615 ) ) ( not ( = ?auto_205614 ?auto_205626 ) ) ( not ( = ?auto_205619 ?auto_205621 ) ) ( not ( = ?auto_205615 ?auto_205621 ) ) ( not ( = ?auto_205620 ?auto_205626 ) ) ( not ( = ?auto_205628 ?auto_205630 ) ) ( not ( = ?auto_205619 ?auto_205623 ) ) ( not ( = ?auto_205615 ?auto_205623 ) ) ( not ( = ?auto_205621 ?auto_205623 ) ) ( not ( = ?auto_205622 ?auto_205626 ) ) ( not ( = ?auto_205631 ?auto_205627 ) ) ( not ( = ?auto_205631 ?auto_205630 ) ) ( not ( = ?auto_205619 ?auto_205616 ) ) ( not ( = ?auto_205615 ?auto_205616 ) ) ( not ( = ?auto_205621 ?auto_205616 ) ) ( not ( = ?auto_205623 ?auto_205616 ) ) ( not ( = ?auto_205617 ?auto_205626 ) ) ( not ( = ?auto_205624 ?auto_205628 ) ) ( not ( = ?auto_205624 ?auto_205627 ) ) ( not ( = ?auto_205624 ?auto_205630 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_205618 ?auto_205619 ?auto_205614 ?auto_205615 ?auto_205620 ?auto_205621 ?auto_205617 ?auto_205616 ?auto_205622 ?auto_205623 )
      ( GET-5IMAGE-VERIFY ?auto_205614 ?auto_205615 ?auto_205617 ?auto_205616 ?auto_205618 ?auto_205619 ?auto_205620 ?auto_205621 ?auto_205622 ?auto_205623 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_205692 - DIRECTION
      ?auto_205693 - MODE
      ?auto_205695 - DIRECTION
      ?auto_205694 - MODE
      ?auto_205696 - DIRECTION
      ?auto_205697 - MODE
      ?auto_205698 - DIRECTION
      ?auto_205699 - MODE
      ?auto_205700 - DIRECTION
      ?auto_205701 - MODE
    )
    :vars
    (
      ?auto_205702 - INSTRUMENT
      ?auto_205707 - SATELLITE
      ?auto_205703 - DIRECTION
      ?auto_205709 - INSTRUMENT
      ?auto_205706 - INSTRUMENT
      ?auto_205705 - INSTRUMENT
      ?auto_205708 - INSTRUMENT
      ?auto_205704 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_205695 ?auto_205692 ) ) ( not ( = ?auto_205696 ?auto_205692 ) ) ( not ( = ?auto_205696 ?auto_205695 ) ) ( not ( = ?auto_205698 ?auto_205692 ) ) ( not ( = ?auto_205698 ?auto_205695 ) ) ( not ( = ?auto_205698 ?auto_205696 ) ) ( not ( = ?auto_205700 ?auto_205692 ) ) ( not ( = ?auto_205700 ?auto_205695 ) ) ( not ( = ?auto_205700 ?auto_205696 ) ) ( not ( = ?auto_205700 ?auto_205698 ) ) ( ON_BOARD ?auto_205702 ?auto_205707 ) ( SUPPORTS ?auto_205702 ?auto_205694 ) ( not ( = ?auto_205695 ?auto_205703 ) ) ( CALIBRATION_TARGET ?auto_205702 ?auto_205703 ) ( not ( = ?auto_205703 ?auto_205698 ) ) ( ON_BOARD ?auto_205709 ?auto_205707 ) ( not ( = ?auto_205702 ?auto_205709 ) ) ( SUPPORTS ?auto_205709 ?auto_205699 ) ( CALIBRATION_TARGET ?auto_205709 ?auto_205703 ) ( not ( = ?auto_205703 ?auto_205700 ) ) ( ON_BOARD ?auto_205706 ?auto_205707 ) ( not ( = ?auto_205709 ?auto_205706 ) ) ( SUPPORTS ?auto_205706 ?auto_205701 ) ( CALIBRATION_TARGET ?auto_205706 ?auto_205703 ) ( not ( = ?auto_205703 ?auto_205692 ) ) ( ON_BOARD ?auto_205705 ?auto_205707 ) ( not ( = ?auto_205706 ?auto_205705 ) ) ( SUPPORTS ?auto_205705 ?auto_205693 ) ( CALIBRATION_TARGET ?auto_205705 ?auto_205703 ) ( not ( = ?auto_205703 ?auto_205696 ) ) ( ON_BOARD ?auto_205708 ?auto_205707 ) ( not ( = ?auto_205705 ?auto_205708 ) ) ( SUPPORTS ?auto_205708 ?auto_205697 ) ( CALIBRATION_TARGET ?auto_205708 ?auto_205703 ) ( POWER_AVAIL ?auto_205707 ) ( POINTING ?auto_205707 ?auto_205704 ) ( not ( = ?auto_205703 ?auto_205704 ) ) ( not ( = ?auto_205696 ?auto_205704 ) ) ( not ( = ?auto_205697 ?auto_205693 ) ) ( not ( = ?auto_205692 ?auto_205704 ) ) ( not ( = ?auto_205697 ?auto_205701 ) ) ( not ( = ?auto_205693 ?auto_205701 ) ) ( not ( = ?auto_205700 ?auto_205704 ) ) ( not ( = ?auto_205706 ?auto_205708 ) ) ( not ( = ?auto_205697 ?auto_205699 ) ) ( not ( = ?auto_205693 ?auto_205699 ) ) ( not ( = ?auto_205701 ?auto_205699 ) ) ( not ( = ?auto_205698 ?auto_205704 ) ) ( not ( = ?auto_205709 ?auto_205705 ) ) ( not ( = ?auto_205709 ?auto_205708 ) ) ( not ( = ?auto_205697 ?auto_205694 ) ) ( not ( = ?auto_205693 ?auto_205694 ) ) ( not ( = ?auto_205701 ?auto_205694 ) ) ( not ( = ?auto_205699 ?auto_205694 ) ) ( not ( = ?auto_205695 ?auto_205704 ) ) ( not ( = ?auto_205702 ?auto_205706 ) ) ( not ( = ?auto_205702 ?auto_205705 ) ) ( not ( = ?auto_205702 ?auto_205708 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_205696 ?auto_205697 ?auto_205692 ?auto_205693 ?auto_205700 ?auto_205701 ?auto_205695 ?auto_205694 ?auto_205698 ?auto_205699 )
      ( GET-5IMAGE-VERIFY ?auto_205692 ?auto_205693 ?auto_205695 ?auto_205694 ?auto_205696 ?auto_205697 ?auto_205698 ?auto_205699 ?auto_205700 ?auto_205701 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_206462 - DIRECTION
      ?auto_206463 - MODE
      ?auto_206465 - DIRECTION
      ?auto_206464 - MODE
      ?auto_206466 - DIRECTION
      ?auto_206467 - MODE
      ?auto_206468 - DIRECTION
      ?auto_206469 - MODE
      ?auto_206470 - DIRECTION
      ?auto_206471 - MODE
    )
    :vars
    (
      ?auto_206472 - INSTRUMENT
      ?auto_206477 - SATELLITE
      ?auto_206473 - DIRECTION
      ?auto_206479 - INSTRUMENT
      ?auto_206476 - INSTRUMENT
      ?auto_206475 - INSTRUMENT
      ?auto_206478 - INSTRUMENT
      ?auto_206474 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_206465 ?auto_206462 ) ) ( not ( = ?auto_206466 ?auto_206462 ) ) ( not ( = ?auto_206466 ?auto_206465 ) ) ( not ( = ?auto_206468 ?auto_206462 ) ) ( not ( = ?auto_206468 ?auto_206465 ) ) ( not ( = ?auto_206468 ?auto_206466 ) ) ( not ( = ?auto_206470 ?auto_206462 ) ) ( not ( = ?auto_206470 ?auto_206465 ) ) ( not ( = ?auto_206470 ?auto_206466 ) ) ( not ( = ?auto_206470 ?auto_206468 ) ) ( ON_BOARD ?auto_206472 ?auto_206477 ) ( SUPPORTS ?auto_206472 ?auto_206464 ) ( not ( = ?auto_206465 ?auto_206473 ) ) ( CALIBRATION_TARGET ?auto_206472 ?auto_206473 ) ( not ( = ?auto_206473 ?auto_206470 ) ) ( ON_BOARD ?auto_206479 ?auto_206477 ) ( not ( = ?auto_206472 ?auto_206479 ) ) ( SUPPORTS ?auto_206479 ?auto_206471 ) ( CALIBRATION_TARGET ?auto_206479 ?auto_206473 ) ( not ( = ?auto_206473 ?auto_206466 ) ) ( ON_BOARD ?auto_206476 ?auto_206477 ) ( not ( = ?auto_206479 ?auto_206476 ) ) ( SUPPORTS ?auto_206476 ?auto_206467 ) ( CALIBRATION_TARGET ?auto_206476 ?auto_206473 ) ( not ( = ?auto_206473 ?auto_206462 ) ) ( ON_BOARD ?auto_206475 ?auto_206477 ) ( not ( = ?auto_206476 ?auto_206475 ) ) ( SUPPORTS ?auto_206475 ?auto_206463 ) ( CALIBRATION_TARGET ?auto_206475 ?auto_206473 ) ( not ( = ?auto_206473 ?auto_206468 ) ) ( ON_BOARD ?auto_206478 ?auto_206477 ) ( not ( = ?auto_206475 ?auto_206478 ) ) ( SUPPORTS ?auto_206478 ?auto_206469 ) ( CALIBRATION_TARGET ?auto_206478 ?auto_206473 ) ( POWER_AVAIL ?auto_206477 ) ( POINTING ?auto_206477 ?auto_206474 ) ( not ( = ?auto_206473 ?auto_206474 ) ) ( not ( = ?auto_206468 ?auto_206474 ) ) ( not ( = ?auto_206469 ?auto_206463 ) ) ( not ( = ?auto_206462 ?auto_206474 ) ) ( not ( = ?auto_206469 ?auto_206467 ) ) ( not ( = ?auto_206463 ?auto_206467 ) ) ( not ( = ?auto_206466 ?auto_206474 ) ) ( not ( = ?auto_206476 ?auto_206478 ) ) ( not ( = ?auto_206469 ?auto_206471 ) ) ( not ( = ?auto_206463 ?auto_206471 ) ) ( not ( = ?auto_206467 ?auto_206471 ) ) ( not ( = ?auto_206470 ?auto_206474 ) ) ( not ( = ?auto_206479 ?auto_206475 ) ) ( not ( = ?auto_206479 ?auto_206478 ) ) ( not ( = ?auto_206469 ?auto_206464 ) ) ( not ( = ?auto_206463 ?auto_206464 ) ) ( not ( = ?auto_206467 ?auto_206464 ) ) ( not ( = ?auto_206471 ?auto_206464 ) ) ( not ( = ?auto_206465 ?auto_206474 ) ) ( not ( = ?auto_206472 ?auto_206476 ) ) ( not ( = ?auto_206472 ?auto_206475 ) ) ( not ( = ?auto_206472 ?auto_206478 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_206468 ?auto_206469 ?auto_206462 ?auto_206463 ?auto_206466 ?auto_206467 ?auto_206465 ?auto_206464 ?auto_206470 ?auto_206471 )
      ( GET-5IMAGE-VERIFY ?auto_206462 ?auto_206463 ?auto_206465 ?auto_206464 ?auto_206466 ?auto_206467 ?auto_206468 ?auto_206469 ?auto_206470 ?auto_206471 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_206712 - DIRECTION
      ?auto_206713 - MODE
      ?auto_206715 - DIRECTION
      ?auto_206714 - MODE
      ?auto_206716 - DIRECTION
      ?auto_206717 - MODE
      ?auto_206718 - DIRECTION
      ?auto_206719 - MODE
      ?auto_206720 - DIRECTION
      ?auto_206721 - MODE
    )
    :vars
    (
      ?auto_206722 - INSTRUMENT
      ?auto_206727 - SATELLITE
      ?auto_206723 - DIRECTION
      ?auto_206729 - INSTRUMENT
      ?auto_206726 - INSTRUMENT
      ?auto_206725 - INSTRUMENT
      ?auto_206728 - INSTRUMENT
      ?auto_206724 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_206715 ?auto_206712 ) ) ( not ( = ?auto_206716 ?auto_206712 ) ) ( not ( = ?auto_206716 ?auto_206715 ) ) ( not ( = ?auto_206718 ?auto_206712 ) ) ( not ( = ?auto_206718 ?auto_206715 ) ) ( not ( = ?auto_206718 ?auto_206716 ) ) ( not ( = ?auto_206720 ?auto_206712 ) ) ( not ( = ?auto_206720 ?auto_206715 ) ) ( not ( = ?auto_206720 ?auto_206716 ) ) ( not ( = ?auto_206720 ?auto_206718 ) ) ( ON_BOARD ?auto_206722 ?auto_206727 ) ( SUPPORTS ?auto_206722 ?auto_206714 ) ( not ( = ?auto_206715 ?auto_206723 ) ) ( CALIBRATION_TARGET ?auto_206722 ?auto_206723 ) ( not ( = ?auto_206723 ?auto_206718 ) ) ( ON_BOARD ?auto_206729 ?auto_206727 ) ( not ( = ?auto_206722 ?auto_206729 ) ) ( SUPPORTS ?auto_206729 ?auto_206719 ) ( CALIBRATION_TARGET ?auto_206729 ?auto_206723 ) ( not ( = ?auto_206723 ?auto_206716 ) ) ( ON_BOARD ?auto_206726 ?auto_206727 ) ( not ( = ?auto_206729 ?auto_206726 ) ) ( SUPPORTS ?auto_206726 ?auto_206717 ) ( CALIBRATION_TARGET ?auto_206726 ?auto_206723 ) ( not ( = ?auto_206723 ?auto_206712 ) ) ( ON_BOARD ?auto_206725 ?auto_206727 ) ( not ( = ?auto_206726 ?auto_206725 ) ) ( SUPPORTS ?auto_206725 ?auto_206713 ) ( CALIBRATION_TARGET ?auto_206725 ?auto_206723 ) ( not ( = ?auto_206723 ?auto_206720 ) ) ( ON_BOARD ?auto_206728 ?auto_206727 ) ( not ( = ?auto_206725 ?auto_206728 ) ) ( SUPPORTS ?auto_206728 ?auto_206721 ) ( CALIBRATION_TARGET ?auto_206728 ?auto_206723 ) ( POWER_AVAIL ?auto_206727 ) ( POINTING ?auto_206727 ?auto_206724 ) ( not ( = ?auto_206723 ?auto_206724 ) ) ( not ( = ?auto_206720 ?auto_206724 ) ) ( not ( = ?auto_206721 ?auto_206713 ) ) ( not ( = ?auto_206712 ?auto_206724 ) ) ( not ( = ?auto_206721 ?auto_206717 ) ) ( not ( = ?auto_206713 ?auto_206717 ) ) ( not ( = ?auto_206716 ?auto_206724 ) ) ( not ( = ?auto_206726 ?auto_206728 ) ) ( not ( = ?auto_206721 ?auto_206719 ) ) ( not ( = ?auto_206713 ?auto_206719 ) ) ( not ( = ?auto_206717 ?auto_206719 ) ) ( not ( = ?auto_206718 ?auto_206724 ) ) ( not ( = ?auto_206729 ?auto_206725 ) ) ( not ( = ?auto_206729 ?auto_206728 ) ) ( not ( = ?auto_206721 ?auto_206714 ) ) ( not ( = ?auto_206713 ?auto_206714 ) ) ( not ( = ?auto_206717 ?auto_206714 ) ) ( not ( = ?auto_206719 ?auto_206714 ) ) ( not ( = ?auto_206715 ?auto_206724 ) ) ( not ( = ?auto_206722 ?auto_206726 ) ) ( not ( = ?auto_206722 ?auto_206725 ) ) ( not ( = ?auto_206722 ?auto_206728 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_206720 ?auto_206721 ?auto_206712 ?auto_206713 ?auto_206716 ?auto_206717 ?auto_206715 ?auto_206714 ?auto_206718 ?auto_206719 )
      ( GET-5IMAGE-VERIFY ?auto_206712 ?auto_206713 ?auto_206715 ?auto_206714 ?auto_206716 ?auto_206717 ?auto_206718 ?auto_206719 ?auto_206720 ?auto_206721 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_206956 - DIRECTION
      ?auto_206957 - MODE
      ?auto_206959 - DIRECTION
      ?auto_206958 - MODE
      ?auto_206960 - DIRECTION
      ?auto_206961 - MODE
      ?auto_206962 - DIRECTION
      ?auto_206963 - MODE
      ?auto_206964 - DIRECTION
      ?auto_206965 - MODE
    )
    :vars
    (
      ?auto_206966 - INSTRUMENT
      ?auto_206971 - SATELLITE
      ?auto_206967 - DIRECTION
      ?auto_206973 - INSTRUMENT
      ?auto_206970 - INSTRUMENT
      ?auto_206969 - INSTRUMENT
      ?auto_206972 - INSTRUMENT
      ?auto_206968 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_206959 ?auto_206956 ) ) ( not ( = ?auto_206960 ?auto_206956 ) ) ( not ( = ?auto_206960 ?auto_206959 ) ) ( not ( = ?auto_206962 ?auto_206956 ) ) ( not ( = ?auto_206962 ?auto_206959 ) ) ( not ( = ?auto_206962 ?auto_206960 ) ) ( not ( = ?auto_206964 ?auto_206956 ) ) ( not ( = ?auto_206964 ?auto_206959 ) ) ( not ( = ?auto_206964 ?auto_206960 ) ) ( not ( = ?auto_206964 ?auto_206962 ) ) ( ON_BOARD ?auto_206966 ?auto_206971 ) ( SUPPORTS ?auto_206966 ?auto_206958 ) ( not ( = ?auto_206959 ?auto_206967 ) ) ( CALIBRATION_TARGET ?auto_206966 ?auto_206967 ) ( not ( = ?auto_206967 ?auto_206960 ) ) ( ON_BOARD ?auto_206973 ?auto_206971 ) ( not ( = ?auto_206966 ?auto_206973 ) ) ( SUPPORTS ?auto_206973 ?auto_206961 ) ( CALIBRATION_TARGET ?auto_206973 ?auto_206967 ) ( not ( = ?auto_206967 ?auto_206964 ) ) ( ON_BOARD ?auto_206970 ?auto_206971 ) ( not ( = ?auto_206973 ?auto_206970 ) ) ( SUPPORTS ?auto_206970 ?auto_206965 ) ( CALIBRATION_TARGET ?auto_206970 ?auto_206967 ) ( not ( = ?auto_206967 ?auto_206956 ) ) ( ON_BOARD ?auto_206969 ?auto_206971 ) ( not ( = ?auto_206970 ?auto_206969 ) ) ( SUPPORTS ?auto_206969 ?auto_206957 ) ( CALIBRATION_TARGET ?auto_206969 ?auto_206967 ) ( not ( = ?auto_206967 ?auto_206962 ) ) ( ON_BOARD ?auto_206972 ?auto_206971 ) ( not ( = ?auto_206969 ?auto_206972 ) ) ( SUPPORTS ?auto_206972 ?auto_206963 ) ( CALIBRATION_TARGET ?auto_206972 ?auto_206967 ) ( POWER_AVAIL ?auto_206971 ) ( POINTING ?auto_206971 ?auto_206968 ) ( not ( = ?auto_206967 ?auto_206968 ) ) ( not ( = ?auto_206962 ?auto_206968 ) ) ( not ( = ?auto_206963 ?auto_206957 ) ) ( not ( = ?auto_206956 ?auto_206968 ) ) ( not ( = ?auto_206963 ?auto_206965 ) ) ( not ( = ?auto_206957 ?auto_206965 ) ) ( not ( = ?auto_206964 ?auto_206968 ) ) ( not ( = ?auto_206970 ?auto_206972 ) ) ( not ( = ?auto_206963 ?auto_206961 ) ) ( not ( = ?auto_206957 ?auto_206961 ) ) ( not ( = ?auto_206965 ?auto_206961 ) ) ( not ( = ?auto_206960 ?auto_206968 ) ) ( not ( = ?auto_206973 ?auto_206969 ) ) ( not ( = ?auto_206973 ?auto_206972 ) ) ( not ( = ?auto_206963 ?auto_206958 ) ) ( not ( = ?auto_206957 ?auto_206958 ) ) ( not ( = ?auto_206965 ?auto_206958 ) ) ( not ( = ?auto_206961 ?auto_206958 ) ) ( not ( = ?auto_206959 ?auto_206968 ) ) ( not ( = ?auto_206966 ?auto_206970 ) ) ( not ( = ?auto_206966 ?auto_206969 ) ) ( not ( = ?auto_206966 ?auto_206972 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_206962 ?auto_206963 ?auto_206956 ?auto_206957 ?auto_206964 ?auto_206965 ?auto_206959 ?auto_206958 ?auto_206960 ?auto_206961 )
      ( GET-5IMAGE-VERIFY ?auto_206956 ?auto_206957 ?auto_206959 ?auto_206958 ?auto_206960 ?auto_206961 ?auto_206962 ?auto_206963 ?auto_206964 ?auto_206965 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_207120 - DIRECTION
      ?auto_207121 - MODE
      ?auto_207123 - DIRECTION
      ?auto_207122 - MODE
      ?auto_207124 - DIRECTION
      ?auto_207125 - MODE
      ?auto_207126 - DIRECTION
      ?auto_207127 - MODE
      ?auto_207128 - DIRECTION
      ?auto_207129 - MODE
    )
    :vars
    (
      ?auto_207130 - INSTRUMENT
      ?auto_207135 - SATELLITE
      ?auto_207131 - DIRECTION
      ?auto_207137 - INSTRUMENT
      ?auto_207134 - INSTRUMENT
      ?auto_207133 - INSTRUMENT
      ?auto_207136 - INSTRUMENT
      ?auto_207132 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_207123 ?auto_207120 ) ) ( not ( = ?auto_207124 ?auto_207120 ) ) ( not ( = ?auto_207124 ?auto_207123 ) ) ( not ( = ?auto_207126 ?auto_207120 ) ) ( not ( = ?auto_207126 ?auto_207123 ) ) ( not ( = ?auto_207126 ?auto_207124 ) ) ( not ( = ?auto_207128 ?auto_207120 ) ) ( not ( = ?auto_207128 ?auto_207123 ) ) ( not ( = ?auto_207128 ?auto_207124 ) ) ( not ( = ?auto_207128 ?auto_207126 ) ) ( ON_BOARD ?auto_207130 ?auto_207135 ) ( SUPPORTS ?auto_207130 ?auto_207122 ) ( not ( = ?auto_207123 ?auto_207131 ) ) ( CALIBRATION_TARGET ?auto_207130 ?auto_207131 ) ( not ( = ?auto_207131 ?auto_207124 ) ) ( ON_BOARD ?auto_207137 ?auto_207135 ) ( not ( = ?auto_207130 ?auto_207137 ) ) ( SUPPORTS ?auto_207137 ?auto_207125 ) ( CALIBRATION_TARGET ?auto_207137 ?auto_207131 ) ( not ( = ?auto_207131 ?auto_207126 ) ) ( ON_BOARD ?auto_207134 ?auto_207135 ) ( not ( = ?auto_207137 ?auto_207134 ) ) ( SUPPORTS ?auto_207134 ?auto_207127 ) ( CALIBRATION_TARGET ?auto_207134 ?auto_207131 ) ( not ( = ?auto_207131 ?auto_207120 ) ) ( ON_BOARD ?auto_207133 ?auto_207135 ) ( not ( = ?auto_207134 ?auto_207133 ) ) ( SUPPORTS ?auto_207133 ?auto_207121 ) ( CALIBRATION_TARGET ?auto_207133 ?auto_207131 ) ( not ( = ?auto_207131 ?auto_207128 ) ) ( ON_BOARD ?auto_207136 ?auto_207135 ) ( not ( = ?auto_207133 ?auto_207136 ) ) ( SUPPORTS ?auto_207136 ?auto_207129 ) ( CALIBRATION_TARGET ?auto_207136 ?auto_207131 ) ( POWER_AVAIL ?auto_207135 ) ( POINTING ?auto_207135 ?auto_207132 ) ( not ( = ?auto_207131 ?auto_207132 ) ) ( not ( = ?auto_207128 ?auto_207132 ) ) ( not ( = ?auto_207129 ?auto_207121 ) ) ( not ( = ?auto_207120 ?auto_207132 ) ) ( not ( = ?auto_207129 ?auto_207127 ) ) ( not ( = ?auto_207121 ?auto_207127 ) ) ( not ( = ?auto_207126 ?auto_207132 ) ) ( not ( = ?auto_207134 ?auto_207136 ) ) ( not ( = ?auto_207129 ?auto_207125 ) ) ( not ( = ?auto_207121 ?auto_207125 ) ) ( not ( = ?auto_207127 ?auto_207125 ) ) ( not ( = ?auto_207124 ?auto_207132 ) ) ( not ( = ?auto_207137 ?auto_207133 ) ) ( not ( = ?auto_207137 ?auto_207136 ) ) ( not ( = ?auto_207129 ?auto_207122 ) ) ( not ( = ?auto_207121 ?auto_207122 ) ) ( not ( = ?auto_207127 ?auto_207122 ) ) ( not ( = ?auto_207125 ?auto_207122 ) ) ( not ( = ?auto_207123 ?auto_207132 ) ) ( not ( = ?auto_207130 ?auto_207134 ) ) ( not ( = ?auto_207130 ?auto_207133 ) ) ( not ( = ?auto_207130 ?auto_207136 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_207128 ?auto_207129 ?auto_207120 ?auto_207121 ?auto_207126 ?auto_207127 ?auto_207123 ?auto_207122 ?auto_207124 ?auto_207125 )
      ( GET-5IMAGE-VERIFY ?auto_207120 ?auto_207121 ?auto_207123 ?auto_207122 ?auto_207124 ?auto_207125 ?auto_207126 ?auto_207127 ?auto_207128 ?auto_207129 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_208226 - DIRECTION
      ?auto_208227 - MODE
      ?auto_208229 - DIRECTION
      ?auto_208228 - MODE
      ?auto_208230 - DIRECTION
      ?auto_208231 - MODE
      ?auto_208232 - DIRECTION
      ?auto_208233 - MODE
      ?auto_208234 - DIRECTION
      ?auto_208235 - MODE
    )
    :vars
    (
      ?auto_208236 - INSTRUMENT
      ?auto_208241 - SATELLITE
      ?auto_208237 - DIRECTION
      ?auto_208243 - INSTRUMENT
      ?auto_208240 - INSTRUMENT
      ?auto_208239 - INSTRUMENT
      ?auto_208242 - INSTRUMENT
      ?auto_208238 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_208229 ?auto_208226 ) ) ( not ( = ?auto_208230 ?auto_208226 ) ) ( not ( = ?auto_208230 ?auto_208229 ) ) ( not ( = ?auto_208232 ?auto_208226 ) ) ( not ( = ?auto_208232 ?auto_208229 ) ) ( not ( = ?auto_208232 ?auto_208230 ) ) ( not ( = ?auto_208234 ?auto_208226 ) ) ( not ( = ?auto_208234 ?auto_208229 ) ) ( not ( = ?auto_208234 ?auto_208230 ) ) ( not ( = ?auto_208234 ?auto_208232 ) ) ( ON_BOARD ?auto_208236 ?auto_208241 ) ( SUPPORTS ?auto_208236 ?auto_208235 ) ( not ( = ?auto_208234 ?auto_208237 ) ) ( CALIBRATION_TARGET ?auto_208236 ?auto_208237 ) ( not ( = ?auto_208237 ?auto_208232 ) ) ( ON_BOARD ?auto_208243 ?auto_208241 ) ( not ( = ?auto_208236 ?auto_208243 ) ) ( SUPPORTS ?auto_208243 ?auto_208233 ) ( CALIBRATION_TARGET ?auto_208243 ?auto_208237 ) ( not ( = ?auto_208237 ?auto_208226 ) ) ( ON_BOARD ?auto_208240 ?auto_208241 ) ( not ( = ?auto_208243 ?auto_208240 ) ) ( SUPPORTS ?auto_208240 ?auto_208227 ) ( CALIBRATION_TARGET ?auto_208240 ?auto_208237 ) ( not ( = ?auto_208237 ?auto_208230 ) ) ( ON_BOARD ?auto_208239 ?auto_208241 ) ( not ( = ?auto_208240 ?auto_208239 ) ) ( SUPPORTS ?auto_208239 ?auto_208231 ) ( CALIBRATION_TARGET ?auto_208239 ?auto_208237 ) ( not ( = ?auto_208237 ?auto_208229 ) ) ( ON_BOARD ?auto_208242 ?auto_208241 ) ( not ( = ?auto_208239 ?auto_208242 ) ) ( SUPPORTS ?auto_208242 ?auto_208228 ) ( CALIBRATION_TARGET ?auto_208242 ?auto_208237 ) ( POWER_AVAIL ?auto_208241 ) ( POINTING ?auto_208241 ?auto_208238 ) ( not ( = ?auto_208237 ?auto_208238 ) ) ( not ( = ?auto_208229 ?auto_208238 ) ) ( not ( = ?auto_208228 ?auto_208231 ) ) ( not ( = ?auto_208230 ?auto_208238 ) ) ( not ( = ?auto_208228 ?auto_208227 ) ) ( not ( = ?auto_208231 ?auto_208227 ) ) ( not ( = ?auto_208226 ?auto_208238 ) ) ( not ( = ?auto_208240 ?auto_208242 ) ) ( not ( = ?auto_208228 ?auto_208233 ) ) ( not ( = ?auto_208231 ?auto_208233 ) ) ( not ( = ?auto_208227 ?auto_208233 ) ) ( not ( = ?auto_208232 ?auto_208238 ) ) ( not ( = ?auto_208243 ?auto_208239 ) ) ( not ( = ?auto_208243 ?auto_208242 ) ) ( not ( = ?auto_208228 ?auto_208235 ) ) ( not ( = ?auto_208231 ?auto_208235 ) ) ( not ( = ?auto_208227 ?auto_208235 ) ) ( not ( = ?auto_208233 ?auto_208235 ) ) ( not ( = ?auto_208234 ?auto_208238 ) ) ( not ( = ?auto_208236 ?auto_208240 ) ) ( not ( = ?auto_208236 ?auto_208239 ) ) ( not ( = ?auto_208236 ?auto_208242 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_208229 ?auto_208228 ?auto_208230 ?auto_208231 ?auto_208226 ?auto_208227 ?auto_208234 ?auto_208235 ?auto_208232 ?auto_208233 )
      ( GET-5IMAGE-VERIFY ?auto_208226 ?auto_208227 ?auto_208229 ?auto_208228 ?auto_208230 ?auto_208231 ?auto_208232 ?auto_208233 ?auto_208234 ?auto_208235 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_208304 - DIRECTION
      ?auto_208305 - MODE
      ?auto_208307 - DIRECTION
      ?auto_208306 - MODE
      ?auto_208308 - DIRECTION
      ?auto_208309 - MODE
      ?auto_208310 - DIRECTION
      ?auto_208311 - MODE
      ?auto_208312 - DIRECTION
      ?auto_208313 - MODE
    )
    :vars
    (
      ?auto_208314 - INSTRUMENT
      ?auto_208319 - SATELLITE
      ?auto_208315 - DIRECTION
      ?auto_208321 - INSTRUMENT
      ?auto_208318 - INSTRUMENT
      ?auto_208317 - INSTRUMENT
      ?auto_208320 - INSTRUMENT
      ?auto_208316 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_208307 ?auto_208304 ) ) ( not ( = ?auto_208308 ?auto_208304 ) ) ( not ( = ?auto_208308 ?auto_208307 ) ) ( not ( = ?auto_208310 ?auto_208304 ) ) ( not ( = ?auto_208310 ?auto_208307 ) ) ( not ( = ?auto_208310 ?auto_208308 ) ) ( not ( = ?auto_208312 ?auto_208304 ) ) ( not ( = ?auto_208312 ?auto_208307 ) ) ( not ( = ?auto_208312 ?auto_208308 ) ) ( not ( = ?auto_208312 ?auto_208310 ) ) ( ON_BOARD ?auto_208314 ?auto_208319 ) ( SUPPORTS ?auto_208314 ?auto_208311 ) ( not ( = ?auto_208310 ?auto_208315 ) ) ( CALIBRATION_TARGET ?auto_208314 ?auto_208315 ) ( not ( = ?auto_208315 ?auto_208312 ) ) ( ON_BOARD ?auto_208321 ?auto_208319 ) ( not ( = ?auto_208314 ?auto_208321 ) ) ( SUPPORTS ?auto_208321 ?auto_208313 ) ( CALIBRATION_TARGET ?auto_208321 ?auto_208315 ) ( not ( = ?auto_208315 ?auto_208304 ) ) ( ON_BOARD ?auto_208318 ?auto_208319 ) ( not ( = ?auto_208321 ?auto_208318 ) ) ( SUPPORTS ?auto_208318 ?auto_208305 ) ( CALIBRATION_TARGET ?auto_208318 ?auto_208315 ) ( not ( = ?auto_208315 ?auto_208308 ) ) ( ON_BOARD ?auto_208317 ?auto_208319 ) ( not ( = ?auto_208318 ?auto_208317 ) ) ( SUPPORTS ?auto_208317 ?auto_208309 ) ( CALIBRATION_TARGET ?auto_208317 ?auto_208315 ) ( not ( = ?auto_208315 ?auto_208307 ) ) ( ON_BOARD ?auto_208320 ?auto_208319 ) ( not ( = ?auto_208317 ?auto_208320 ) ) ( SUPPORTS ?auto_208320 ?auto_208306 ) ( CALIBRATION_TARGET ?auto_208320 ?auto_208315 ) ( POWER_AVAIL ?auto_208319 ) ( POINTING ?auto_208319 ?auto_208316 ) ( not ( = ?auto_208315 ?auto_208316 ) ) ( not ( = ?auto_208307 ?auto_208316 ) ) ( not ( = ?auto_208306 ?auto_208309 ) ) ( not ( = ?auto_208308 ?auto_208316 ) ) ( not ( = ?auto_208306 ?auto_208305 ) ) ( not ( = ?auto_208309 ?auto_208305 ) ) ( not ( = ?auto_208304 ?auto_208316 ) ) ( not ( = ?auto_208318 ?auto_208320 ) ) ( not ( = ?auto_208306 ?auto_208313 ) ) ( not ( = ?auto_208309 ?auto_208313 ) ) ( not ( = ?auto_208305 ?auto_208313 ) ) ( not ( = ?auto_208312 ?auto_208316 ) ) ( not ( = ?auto_208321 ?auto_208317 ) ) ( not ( = ?auto_208321 ?auto_208320 ) ) ( not ( = ?auto_208306 ?auto_208311 ) ) ( not ( = ?auto_208309 ?auto_208311 ) ) ( not ( = ?auto_208305 ?auto_208311 ) ) ( not ( = ?auto_208313 ?auto_208311 ) ) ( not ( = ?auto_208310 ?auto_208316 ) ) ( not ( = ?auto_208314 ?auto_208318 ) ) ( not ( = ?auto_208314 ?auto_208317 ) ) ( not ( = ?auto_208314 ?auto_208320 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_208307 ?auto_208306 ?auto_208308 ?auto_208309 ?auto_208304 ?auto_208305 ?auto_208310 ?auto_208311 ?auto_208312 ?auto_208313 )
      ( GET-5IMAGE-VERIFY ?auto_208304 ?auto_208305 ?auto_208307 ?auto_208306 ?auto_208308 ?auto_208309 ?auto_208310 ?auto_208311 ?auto_208312 ?auto_208313 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_208552 - DIRECTION
      ?auto_208553 - MODE
      ?auto_208555 - DIRECTION
      ?auto_208554 - MODE
      ?auto_208556 - DIRECTION
      ?auto_208557 - MODE
      ?auto_208558 - DIRECTION
      ?auto_208559 - MODE
      ?auto_208560 - DIRECTION
      ?auto_208561 - MODE
    )
    :vars
    (
      ?auto_208562 - INSTRUMENT
      ?auto_208567 - SATELLITE
      ?auto_208563 - DIRECTION
      ?auto_208569 - INSTRUMENT
      ?auto_208566 - INSTRUMENT
      ?auto_208565 - INSTRUMENT
      ?auto_208568 - INSTRUMENT
      ?auto_208564 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_208555 ?auto_208552 ) ) ( not ( = ?auto_208556 ?auto_208552 ) ) ( not ( = ?auto_208556 ?auto_208555 ) ) ( not ( = ?auto_208558 ?auto_208552 ) ) ( not ( = ?auto_208558 ?auto_208555 ) ) ( not ( = ?auto_208558 ?auto_208556 ) ) ( not ( = ?auto_208560 ?auto_208552 ) ) ( not ( = ?auto_208560 ?auto_208555 ) ) ( not ( = ?auto_208560 ?auto_208556 ) ) ( not ( = ?auto_208560 ?auto_208558 ) ) ( ON_BOARD ?auto_208562 ?auto_208567 ) ( SUPPORTS ?auto_208562 ?auto_208561 ) ( not ( = ?auto_208560 ?auto_208563 ) ) ( CALIBRATION_TARGET ?auto_208562 ?auto_208563 ) ( not ( = ?auto_208563 ?auto_208556 ) ) ( ON_BOARD ?auto_208569 ?auto_208567 ) ( not ( = ?auto_208562 ?auto_208569 ) ) ( SUPPORTS ?auto_208569 ?auto_208557 ) ( CALIBRATION_TARGET ?auto_208569 ?auto_208563 ) ( not ( = ?auto_208563 ?auto_208552 ) ) ( ON_BOARD ?auto_208566 ?auto_208567 ) ( not ( = ?auto_208569 ?auto_208566 ) ) ( SUPPORTS ?auto_208566 ?auto_208553 ) ( CALIBRATION_TARGET ?auto_208566 ?auto_208563 ) ( not ( = ?auto_208563 ?auto_208558 ) ) ( ON_BOARD ?auto_208565 ?auto_208567 ) ( not ( = ?auto_208566 ?auto_208565 ) ) ( SUPPORTS ?auto_208565 ?auto_208559 ) ( CALIBRATION_TARGET ?auto_208565 ?auto_208563 ) ( not ( = ?auto_208563 ?auto_208555 ) ) ( ON_BOARD ?auto_208568 ?auto_208567 ) ( not ( = ?auto_208565 ?auto_208568 ) ) ( SUPPORTS ?auto_208568 ?auto_208554 ) ( CALIBRATION_TARGET ?auto_208568 ?auto_208563 ) ( POWER_AVAIL ?auto_208567 ) ( POINTING ?auto_208567 ?auto_208564 ) ( not ( = ?auto_208563 ?auto_208564 ) ) ( not ( = ?auto_208555 ?auto_208564 ) ) ( not ( = ?auto_208554 ?auto_208559 ) ) ( not ( = ?auto_208558 ?auto_208564 ) ) ( not ( = ?auto_208554 ?auto_208553 ) ) ( not ( = ?auto_208559 ?auto_208553 ) ) ( not ( = ?auto_208552 ?auto_208564 ) ) ( not ( = ?auto_208566 ?auto_208568 ) ) ( not ( = ?auto_208554 ?auto_208557 ) ) ( not ( = ?auto_208559 ?auto_208557 ) ) ( not ( = ?auto_208553 ?auto_208557 ) ) ( not ( = ?auto_208556 ?auto_208564 ) ) ( not ( = ?auto_208569 ?auto_208565 ) ) ( not ( = ?auto_208569 ?auto_208568 ) ) ( not ( = ?auto_208554 ?auto_208561 ) ) ( not ( = ?auto_208559 ?auto_208561 ) ) ( not ( = ?auto_208553 ?auto_208561 ) ) ( not ( = ?auto_208557 ?auto_208561 ) ) ( not ( = ?auto_208560 ?auto_208564 ) ) ( not ( = ?auto_208562 ?auto_208566 ) ) ( not ( = ?auto_208562 ?auto_208565 ) ) ( not ( = ?auto_208562 ?auto_208568 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_208555 ?auto_208554 ?auto_208558 ?auto_208559 ?auto_208552 ?auto_208553 ?auto_208560 ?auto_208561 ?auto_208556 ?auto_208557 )
      ( GET-5IMAGE-VERIFY ?auto_208552 ?auto_208553 ?auto_208555 ?auto_208554 ?auto_208556 ?auto_208557 ?auto_208558 ?auto_208559 ?auto_208560 ?auto_208561 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_208630 - DIRECTION
      ?auto_208631 - MODE
      ?auto_208633 - DIRECTION
      ?auto_208632 - MODE
      ?auto_208634 - DIRECTION
      ?auto_208635 - MODE
      ?auto_208636 - DIRECTION
      ?auto_208637 - MODE
      ?auto_208638 - DIRECTION
      ?auto_208639 - MODE
    )
    :vars
    (
      ?auto_208640 - INSTRUMENT
      ?auto_208645 - SATELLITE
      ?auto_208641 - DIRECTION
      ?auto_208647 - INSTRUMENT
      ?auto_208644 - INSTRUMENT
      ?auto_208643 - INSTRUMENT
      ?auto_208646 - INSTRUMENT
      ?auto_208642 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_208633 ?auto_208630 ) ) ( not ( = ?auto_208634 ?auto_208630 ) ) ( not ( = ?auto_208634 ?auto_208633 ) ) ( not ( = ?auto_208636 ?auto_208630 ) ) ( not ( = ?auto_208636 ?auto_208633 ) ) ( not ( = ?auto_208636 ?auto_208634 ) ) ( not ( = ?auto_208638 ?auto_208630 ) ) ( not ( = ?auto_208638 ?auto_208633 ) ) ( not ( = ?auto_208638 ?auto_208634 ) ) ( not ( = ?auto_208638 ?auto_208636 ) ) ( ON_BOARD ?auto_208640 ?auto_208645 ) ( SUPPORTS ?auto_208640 ?auto_208637 ) ( not ( = ?auto_208636 ?auto_208641 ) ) ( CALIBRATION_TARGET ?auto_208640 ?auto_208641 ) ( not ( = ?auto_208641 ?auto_208634 ) ) ( ON_BOARD ?auto_208647 ?auto_208645 ) ( not ( = ?auto_208640 ?auto_208647 ) ) ( SUPPORTS ?auto_208647 ?auto_208635 ) ( CALIBRATION_TARGET ?auto_208647 ?auto_208641 ) ( not ( = ?auto_208641 ?auto_208630 ) ) ( ON_BOARD ?auto_208644 ?auto_208645 ) ( not ( = ?auto_208647 ?auto_208644 ) ) ( SUPPORTS ?auto_208644 ?auto_208631 ) ( CALIBRATION_TARGET ?auto_208644 ?auto_208641 ) ( not ( = ?auto_208641 ?auto_208638 ) ) ( ON_BOARD ?auto_208643 ?auto_208645 ) ( not ( = ?auto_208644 ?auto_208643 ) ) ( SUPPORTS ?auto_208643 ?auto_208639 ) ( CALIBRATION_TARGET ?auto_208643 ?auto_208641 ) ( not ( = ?auto_208641 ?auto_208633 ) ) ( ON_BOARD ?auto_208646 ?auto_208645 ) ( not ( = ?auto_208643 ?auto_208646 ) ) ( SUPPORTS ?auto_208646 ?auto_208632 ) ( CALIBRATION_TARGET ?auto_208646 ?auto_208641 ) ( POWER_AVAIL ?auto_208645 ) ( POINTING ?auto_208645 ?auto_208642 ) ( not ( = ?auto_208641 ?auto_208642 ) ) ( not ( = ?auto_208633 ?auto_208642 ) ) ( not ( = ?auto_208632 ?auto_208639 ) ) ( not ( = ?auto_208638 ?auto_208642 ) ) ( not ( = ?auto_208632 ?auto_208631 ) ) ( not ( = ?auto_208639 ?auto_208631 ) ) ( not ( = ?auto_208630 ?auto_208642 ) ) ( not ( = ?auto_208644 ?auto_208646 ) ) ( not ( = ?auto_208632 ?auto_208635 ) ) ( not ( = ?auto_208639 ?auto_208635 ) ) ( not ( = ?auto_208631 ?auto_208635 ) ) ( not ( = ?auto_208634 ?auto_208642 ) ) ( not ( = ?auto_208647 ?auto_208643 ) ) ( not ( = ?auto_208647 ?auto_208646 ) ) ( not ( = ?auto_208632 ?auto_208637 ) ) ( not ( = ?auto_208639 ?auto_208637 ) ) ( not ( = ?auto_208631 ?auto_208637 ) ) ( not ( = ?auto_208635 ?auto_208637 ) ) ( not ( = ?auto_208636 ?auto_208642 ) ) ( not ( = ?auto_208640 ?auto_208644 ) ) ( not ( = ?auto_208640 ?auto_208643 ) ) ( not ( = ?auto_208640 ?auto_208646 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_208633 ?auto_208632 ?auto_208638 ?auto_208639 ?auto_208630 ?auto_208631 ?auto_208636 ?auto_208637 ?auto_208634 ?auto_208635 )
      ( GET-5IMAGE-VERIFY ?auto_208630 ?auto_208631 ?auto_208633 ?auto_208632 ?auto_208634 ?auto_208635 ?auto_208636 ?auto_208637 ?auto_208638 ?auto_208639 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_208874 - DIRECTION
      ?auto_208875 - MODE
      ?auto_208877 - DIRECTION
      ?auto_208876 - MODE
      ?auto_208878 - DIRECTION
      ?auto_208879 - MODE
      ?auto_208880 - DIRECTION
      ?auto_208881 - MODE
      ?auto_208882 - DIRECTION
      ?auto_208883 - MODE
    )
    :vars
    (
      ?auto_208884 - INSTRUMENT
      ?auto_208889 - SATELLITE
      ?auto_208885 - DIRECTION
      ?auto_208891 - INSTRUMENT
      ?auto_208888 - INSTRUMENT
      ?auto_208887 - INSTRUMENT
      ?auto_208890 - INSTRUMENT
      ?auto_208886 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_208877 ?auto_208874 ) ) ( not ( = ?auto_208878 ?auto_208874 ) ) ( not ( = ?auto_208878 ?auto_208877 ) ) ( not ( = ?auto_208880 ?auto_208874 ) ) ( not ( = ?auto_208880 ?auto_208877 ) ) ( not ( = ?auto_208880 ?auto_208878 ) ) ( not ( = ?auto_208882 ?auto_208874 ) ) ( not ( = ?auto_208882 ?auto_208877 ) ) ( not ( = ?auto_208882 ?auto_208878 ) ) ( not ( = ?auto_208882 ?auto_208880 ) ) ( ON_BOARD ?auto_208884 ?auto_208889 ) ( SUPPORTS ?auto_208884 ?auto_208879 ) ( not ( = ?auto_208878 ?auto_208885 ) ) ( CALIBRATION_TARGET ?auto_208884 ?auto_208885 ) ( not ( = ?auto_208885 ?auto_208882 ) ) ( ON_BOARD ?auto_208891 ?auto_208889 ) ( not ( = ?auto_208884 ?auto_208891 ) ) ( SUPPORTS ?auto_208891 ?auto_208883 ) ( CALIBRATION_TARGET ?auto_208891 ?auto_208885 ) ( not ( = ?auto_208885 ?auto_208874 ) ) ( ON_BOARD ?auto_208888 ?auto_208889 ) ( not ( = ?auto_208891 ?auto_208888 ) ) ( SUPPORTS ?auto_208888 ?auto_208875 ) ( CALIBRATION_TARGET ?auto_208888 ?auto_208885 ) ( not ( = ?auto_208885 ?auto_208880 ) ) ( ON_BOARD ?auto_208887 ?auto_208889 ) ( not ( = ?auto_208888 ?auto_208887 ) ) ( SUPPORTS ?auto_208887 ?auto_208881 ) ( CALIBRATION_TARGET ?auto_208887 ?auto_208885 ) ( not ( = ?auto_208885 ?auto_208877 ) ) ( ON_BOARD ?auto_208890 ?auto_208889 ) ( not ( = ?auto_208887 ?auto_208890 ) ) ( SUPPORTS ?auto_208890 ?auto_208876 ) ( CALIBRATION_TARGET ?auto_208890 ?auto_208885 ) ( POWER_AVAIL ?auto_208889 ) ( POINTING ?auto_208889 ?auto_208886 ) ( not ( = ?auto_208885 ?auto_208886 ) ) ( not ( = ?auto_208877 ?auto_208886 ) ) ( not ( = ?auto_208876 ?auto_208881 ) ) ( not ( = ?auto_208880 ?auto_208886 ) ) ( not ( = ?auto_208876 ?auto_208875 ) ) ( not ( = ?auto_208881 ?auto_208875 ) ) ( not ( = ?auto_208874 ?auto_208886 ) ) ( not ( = ?auto_208888 ?auto_208890 ) ) ( not ( = ?auto_208876 ?auto_208883 ) ) ( not ( = ?auto_208881 ?auto_208883 ) ) ( not ( = ?auto_208875 ?auto_208883 ) ) ( not ( = ?auto_208882 ?auto_208886 ) ) ( not ( = ?auto_208891 ?auto_208887 ) ) ( not ( = ?auto_208891 ?auto_208890 ) ) ( not ( = ?auto_208876 ?auto_208879 ) ) ( not ( = ?auto_208881 ?auto_208879 ) ) ( not ( = ?auto_208875 ?auto_208879 ) ) ( not ( = ?auto_208883 ?auto_208879 ) ) ( not ( = ?auto_208878 ?auto_208886 ) ) ( not ( = ?auto_208884 ?auto_208888 ) ) ( not ( = ?auto_208884 ?auto_208887 ) ) ( not ( = ?auto_208884 ?auto_208890 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_208877 ?auto_208876 ?auto_208880 ?auto_208881 ?auto_208874 ?auto_208875 ?auto_208878 ?auto_208879 ?auto_208882 ?auto_208883 )
      ( GET-5IMAGE-VERIFY ?auto_208874 ?auto_208875 ?auto_208877 ?auto_208876 ?auto_208878 ?auto_208879 ?auto_208880 ?auto_208881 ?auto_208882 ?auto_208883 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_209038 - DIRECTION
      ?auto_209039 - MODE
      ?auto_209041 - DIRECTION
      ?auto_209040 - MODE
      ?auto_209042 - DIRECTION
      ?auto_209043 - MODE
      ?auto_209044 - DIRECTION
      ?auto_209045 - MODE
      ?auto_209046 - DIRECTION
      ?auto_209047 - MODE
    )
    :vars
    (
      ?auto_209048 - INSTRUMENT
      ?auto_209053 - SATELLITE
      ?auto_209049 - DIRECTION
      ?auto_209055 - INSTRUMENT
      ?auto_209052 - INSTRUMENT
      ?auto_209051 - INSTRUMENT
      ?auto_209054 - INSTRUMENT
      ?auto_209050 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_209041 ?auto_209038 ) ) ( not ( = ?auto_209042 ?auto_209038 ) ) ( not ( = ?auto_209042 ?auto_209041 ) ) ( not ( = ?auto_209044 ?auto_209038 ) ) ( not ( = ?auto_209044 ?auto_209041 ) ) ( not ( = ?auto_209044 ?auto_209042 ) ) ( not ( = ?auto_209046 ?auto_209038 ) ) ( not ( = ?auto_209046 ?auto_209041 ) ) ( not ( = ?auto_209046 ?auto_209042 ) ) ( not ( = ?auto_209046 ?auto_209044 ) ) ( ON_BOARD ?auto_209048 ?auto_209053 ) ( SUPPORTS ?auto_209048 ?auto_209043 ) ( not ( = ?auto_209042 ?auto_209049 ) ) ( CALIBRATION_TARGET ?auto_209048 ?auto_209049 ) ( not ( = ?auto_209049 ?auto_209044 ) ) ( ON_BOARD ?auto_209055 ?auto_209053 ) ( not ( = ?auto_209048 ?auto_209055 ) ) ( SUPPORTS ?auto_209055 ?auto_209045 ) ( CALIBRATION_TARGET ?auto_209055 ?auto_209049 ) ( not ( = ?auto_209049 ?auto_209038 ) ) ( ON_BOARD ?auto_209052 ?auto_209053 ) ( not ( = ?auto_209055 ?auto_209052 ) ) ( SUPPORTS ?auto_209052 ?auto_209039 ) ( CALIBRATION_TARGET ?auto_209052 ?auto_209049 ) ( not ( = ?auto_209049 ?auto_209046 ) ) ( ON_BOARD ?auto_209051 ?auto_209053 ) ( not ( = ?auto_209052 ?auto_209051 ) ) ( SUPPORTS ?auto_209051 ?auto_209047 ) ( CALIBRATION_TARGET ?auto_209051 ?auto_209049 ) ( not ( = ?auto_209049 ?auto_209041 ) ) ( ON_BOARD ?auto_209054 ?auto_209053 ) ( not ( = ?auto_209051 ?auto_209054 ) ) ( SUPPORTS ?auto_209054 ?auto_209040 ) ( CALIBRATION_TARGET ?auto_209054 ?auto_209049 ) ( POWER_AVAIL ?auto_209053 ) ( POINTING ?auto_209053 ?auto_209050 ) ( not ( = ?auto_209049 ?auto_209050 ) ) ( not ( = ?auto_209041 ?auto_209050 ) ) ( not ( = ?auto_209040 ?auto_209047 ) ) ( not ( = ?auto_209046 ?auto_209050 ) ) ( not ( = ?auto_209040 ?auto_209039 ) ) ( not ( = ?auto_209047 ?auto_209039 ) ) ( not ( = ?auto_209038 ?auto_209050 ) ) ( not ( = ?auto_209052 ?auto_209054 ) ) ( not ( = ?auto_209040 ?auto_209045 ) ) ( not ( = ?auto_209047 ?auto_209045 ) ) ( not ( = ?auto_209039 ?auto_209045 ) ) ( not ( = ?auto_209044 ?auto_209050 ) ) ( not ( = ?auto_209055 ?auto_209051 ) ) ( not ( = ?auto_209055 ?auto_209054 ) ) ( not ( = ?auto_209040 ?auto_209043 ) ) ( not ( = ?auto_209047 ?auto_209043 ) ) ( not ( = ?auto_209039 ?auto_209043 ) ) ( not ( = ?auto_209045 ?auto_209043 ) ) ( not ( = ?auto_209042 ?auto_209050 ) ) ( not ( = ?auto_209048 ?auto_209052 ) ) ( not ( = ?auto_209048 ?auto_209051 ) ) ( not ( = ?auto_209048 ?auto_209054 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_209041 ?auto_209040 ?auto_209046 ?auto_209047 ?auto_209038 ?auto_209039 ?auto_209042 ?auto_209043 ?auto_209044 ?auto_209045 )
      ( GET-5IMAGE-VERIFY ?auto_209038 ?auto_209039 ?auto_209041 ?auto_209040 ?auto_209042 ?auto_209043 ?auto_209044 ?auto_209045 ?auto_209046 ?auto_209047 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_209282 - DIRECTION
      ?auto_209283 - MODE
      ?auto_209285 - DIRECTION
      ?auto_209284 - MODE
      ?auto_209286 - DIRECTION
      ?auto_209287 - MODE
      ?auto_209288 - DIRECTION
      ?auto_209289 - MODE
      ?auto_209290 - DIRECTION
      ?auto_209291 - MODE
    )
    :vars
    (
      ?auto_209292 - INSTRUMENT
      ?auto_209297 - SATELLITE
      ?auto_209293 - DIRECTION
      ?auto_209299 - INSTRUMENT
      ?auto_209296 - INSTRUMENT
      ?auto_209295 - INSTRUMENT
      ?auto_209298 - INSTRUMENT
      ?auto_209294 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_209285 ?auto_209282 ) ) ( not ( = ?auto_209286 ?auto_209282 ) ) ( not ( = ?auto_209286 ?auto_209285 ) ) ( not ( = ?auto_209288 ?auto_209282 ) ) ( not ( = ?auto_209288 ?auto_209285 ) ) ( not ( = ?auto_209288 ?auto_209286 ) ) ( not ( = ?auto_209290 ?auto_209282 ) ) ( not ( = ?auto_209290 ?auto_209285 ) ) ( not ( = ?auto_209290 ?auto_209286 ) ) ( not ( = ?auto_209290 ?auto_209288 ) ) ( ON_BOARD ?auto_209292 ?auto_209297 ) ( SUPPORTS ?auto_209292 ?auto_209291 ) ( not ( = ?auto_209290 ?auto_209293 ) ) ( CALIBRATION_TARGET ?auto_209292 ?auto_209293 ) ( not ( = ?auto_209293 ?auto_209288 ) ) ( ON_BOARD ?auto_209299 ?auto_209297 ) ( not ( = ?auto_209292 ?auto_209299 ) ) ( SUPPORTS ?auto_209299 ?auto_209289 ) ( CALIBRATION_TARGET ?auto_209299 ?auto_209293 ) ( not ( = ?auto_209293 ?auto_209282 ) ) ( ON_BOARD ?auto_209296 ?auto_209297 ) ( not ( = ?auto_209299 ?auto_209296 ) ) ( SUPPORTS ?auto_209296 ?auto_209283 ) ( CALIBRATION_TARGET ?auto_209296 ?auto_209293 ) ( not ( = ?auto_209293 ?auto_209285 ) ) ( ON_BOARD ?auto_209295 ?auto_209297 ) ( not ( = ?auto_209296 ?auto_209295 ) ) ( SUPPORTS ?auto_209295 ?auto_209284 ) ( CALIBRATION_TARGET ?auto_209295 ?auto_209293 ) ( not ( = ?auto_209293 ?auto_209286 ) ) ( ON_BOARD ?auto_209298 ?auto_209297 ) ( not ( = ?auto_209295 ?auto_209298 ) ) ( SUPPORTS ?auto_209298 ?auto_209287 ) ( CALIBRATION_TARGET ?auto_209298 ?auto_209293 ) ( POWER_AVAIL ?auto_209297 ) ( POINTING ?auto_209297 ?auto_209294 ) ( not ( = ?auto_209293 ?auto_209294 ) ) ( not ( = ?auto_209286 ?auto_209294 ) ) ( not ( = ?auto_209287 ?auto_209284 ) ) ( not ( = ?auto_209285 ?auto_209294 ) ) ( not ( = ?auto_209287 ?auto_209283 ) ) ( not ( = ?auto_209284 ?auto_209283 ) ) ( not ( = ?auto_209282 ?auto_209294 ) ) ( not ( = ?auto_209296 ?auto_209298 ) ) ( not ( = ?auto_209287 ?auto_209289 ) ) ( not ( = ?auto_209284 ?auto_209289 ) ) ( not ( = ?auto_209283 ?auto_209289 ) ) ( not ( = ?auto_209288 ?auto_209294 ) ) ( not ( = ?auto_209299 ?auto_209295 ) ) ( not ( = ?auto_209299 ?auto_209298 ) ) ( not ( = ?auto_209287 ?auto_209291 ) ) ( not ( = ?auto_209284 ?auto_209291 ) ) ( not ( = ?auto_209283 ?auto_209291 ) ) ( not ( = ?auto_209289 ?auto_209291 ) ) ( not ( = ?auto_209290 ?auto_209294 ) ) ( not ( = ?auto_209292 ?auto_209296 ) ) ( not ( = ?auto_209292 ?auto_209295 ) ) ( not ( = ?auto_209292 ?auto_209298 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_209286 ?auto_209287 ?auto_209285 ?auto_209284 ?auto_209282 ?auto_209283 ?auto_209290 ?auto_209291 ?auto_209288 ?auto_209289 )
      ( GET-5IMAGE-VERIFY ?auto_209282 ?auto_209283 ?auto_209285 ?auto_209284 ?auto_209286 ?auto_209287 ?auto_209288 ?auto_209289 ?auto_209290 ?auto_209291 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_209360 - DIRECTION
      ?auto_209361 - MODE
      ?auto_209363 - DIRECTION
      ?auto_209362 - MODE
      ?auto_209364 - DIRECTION
      ?auto_209365 - MODE
      ?auto_209366 - DIRECTION
      ?auto_209367 - MODE
      ?auto_209368 - DIRECTION
      ?auto_209369 - MODE
    )
    :vars
    (
      ?auto_209370 - INSTRUMENT
      ?auto_209375 - SATELLITE
      ?auto_209371 - DIRECTION
      ?auto_209377 - INSTRUMENT
      ?auto_209374 - INSTRUMENT
      ?auto_209373 - INSTRUMENT
      ?auto_209376 - INSTRUMENT
      ?auto_209372 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_209363 ?auto_209360 ) ) ( not ( = ?auto_209364 ?auto_209360 ) ) ( not ( = ?auto_209364 ?auto_209363 ) ) ( not ( = ?auto_209366 ?auto_209360 ) ) ( not ( = ?auto_209366 ?auto_209363 ) ) ( not ( = ?auto_209366 ?auto_209364 ) ) ( not ( = ?auto_209368 ?auto_209360 ) ) ( not ( = ?auto_209368 ?auto_209363 ) ) ( not ( = ?auto_209368 ?auto_209364 ) ) ( not ( = ?auto_209368 ?auto_209366 ) ) ( ON_BOARD ?auto_209370 ?auto_209375 ) ( SUPPORTS ?auto_209370 ?auto_209367 ) ( not ( = ?auto_209366 ?auto_209371 ) ) ( CALIBRATION_TARGET ?auto_209370 ?auto_209371 ) ( not ( = ?auto_209371 ?auto_209368 ) ) ( ON_BOARD ?auto_209377 ?auto_209375 ) ( not ( = ?auto_209370 ?auto_209377 ) ) ( SUPPORTS ?auto_209377 ?auto_209369 ) ( CALIBRATION_TARGET ?auto_209377 ?auto_209371 ) ( not ( = ?auto_209371 ?auto_209360 ) ) ( ON_BOARD ?auto_209374 ?auto_209375 ) ( not ( = ?auto_209377 ?auto_209374 ) ) ( SUPPORTS ?auto_209374 ?auto_209361 ) ( CALIBRATION_TARGET ?auto_209374 ?auto_209371 ) ( not ( = ?auto_209371 ?auto_209363 ) ) ( ON_BOARD ?auto_209373 ?auto_209375 ) ( not ( = ?auto_209374 ?auto_209373 ) ) ( SUPPORTS ?auto_209373 ?auto_209362 ) ( CALIBRATION_TARGET ?auto_209373 ?auto_209371 ) ( not ( = ?auto_209371 ?auto_209364 ) ) ( ON_BOARD ?auto_209376 ?auto_209375 ) ( not ( = ?auto_209373 ?auto_209376 ) ) ( SUPPORTS ?auto_209376 ?auto_209365 ) ( CALIBRATION_TARGET ?auto_209376 ?auto_209371 ) ( POWER_AVAIL ?auto_209375 ) ( POINTING ?auto_209375 ?auto_209372 ) ( not ( = ?auto_209371 ?auto_209372 ) ) ( not ( = ?auto_209364 ?auto_209372 ) ) ( not ( = ?auto_209365 ?auto_209362 ) ) ( not ( = ?auto_209363 ?auto_209372 ) ) ( not ( = ?auto_209365 ?auto_209361 ) ) ( not ( = ?auto_209362 ?auto_209361 ) ) ( not ( = ?auto_209360 ?auto_209372 ) ) ( not ( = ?auto_209374 ?auto_209376 ) ) ( not ( = ?auto_209365 ?auto_209369 ) ) ( not ( = ?auto_209362 ?auto_209369 ) ) ( not ( = ?auto_209361 ?auto_209369 ) ) ( not ( = ?auto_209368 ?auto_209372 ) ) ( not ( = ?auto_209377 ?auto_209373 ) ) ( not ( = ?auto_209377 ?auto_209376 ) ) ( not ( = ?auto_209365 ?auto_209367 ) ) ( not ( = ?auto_209362 ?auto_209367 ) ) ( not ( = ?auto_209361 ?auto_209367 ) ) ( not ( = ?auto_209369 ?auto_209367 ) ) ( not ( = ?auto_209366 ?auto_209372 ) ) ( not ( = ?auto_209370 ?auto_209374 ) ) ( not ( = ?auto_209370 ?auto_209373 ) ) ( not ( = ?auto_209370 ?auto_209376 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_209364 ?auto_209365 ?auto_209363 ?auto_209362 ?auto_209360 ?auto_209361 ?auto_209366 ?auto_209367 ?auto_209368 ?auto_209369 )
      ( GET-5IMAGE-VERIFY ?auto_209360 ?auto_209361 ?auto_209363 ?auto_209362 ?auto_209364 ?auto_209365 ?auto_209366 ?auto_209367 ?auto_209368 ?auto_209369 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_209778 - DIRECTION
      ?auto_209779 - MODE
      ?auto_209781 - DIRECTION
      ?auto_209780 - MODE
      ?auto_209782 - DIRECTION
      ?auto_209783 - MODE
      ?auto_209784 - DIRECTION
      ?auto_209785 - MODE
      ?auto_209786 - DIRECTION
      ?auto_209787 - MODE
    )
    :vars
    (
      ?auto_209788 - INSTRUMENT
      ?auto_209793 - SATELLITE
      ?auto_209789 - DIRECTION
      ?auto_209795 - INSTRUMENT
      ?auto_209792 - INSTRUMENT
      ?auto_209791 - INSTRUMENT
      ?auto_209794 - INSTRUMENT
      ?auto_209790 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_209781 ?auto_209778 ) ) ( not ( = ?auto_209782 ?auto_209778 ) ) ( not ( = ?auto_209782 ?auto_209781 ) ) ( not ( = ?auto_209784 ?auto_209778 ) ) ( not ( = ?auto_209784 ?auto_209781 ) ) ( not ( = ?auto_209784 ?auto_209782 ) ) ( not ( = ?auto_209786 ?auto_209778 ) ) ( not ( = ?auto_209786 ?auto_209781 ) ) ( not ( = ?auto_209786 ?auto_209782 ) ) ( not ( = ?auto_209786 ?auto_209784 ) ) ( ON_BOARD ?auto_209788 ?auto_209793 ) ( SUPPORTS ?auto_209788 ?auto_209787 ) ( not ( = ?auto_209786 ?auto_209789 ) ) ( CALIBRATION_TARGET ?auto_209788 ?auto_209789 ) ( not ( = ?auto_209789 ?auto_209782 ) ) ( ON_BOARD ?auto_209795 ?auto_209793 ) ( not ( = ?auto_209788 ?auto_209795 ) ) ( SUPPORTS ?auto_209795 ?auto_209783 ) ( CALIBRATION_TARGET ?auto_209795 ?auto_209789 ) ( not ( = ?auto_209789 ?auto_209778 ) ) ( ON_BOARD ?auto_209792 ?auto_209793 ) ( not ( = ?auto_209795 ?auto_209792 ) ) ( SUPPORTS ?auto_209792 ?auto_209779 ) ( CALIBRATION_TARGET ?auto_209792 ?auto_209789 ) ( not ( = ?auto_209789 ?auto_209781 ) ) ( ON_BOARD ?auto_209791 ?auto_209793 ) ( not ( = ?auto_209792 ?auto_209791 ) ) ( SUPPORTS ?auto_209791 ?auto_209780 ) ( CALIBRATION_TARGET ?auto_209791 ?auto_209789 ) ( not ( = ?auto_209789 ?auto_209784 ) ) ( ON_BOARD ?auto_209794 ?auto_209793 ) ( not ( = ?auto_209791 ?auto_209794 ) ) ( SUPPORTS ?auto_209794 ?auto_209785 ) ( CALIBRATION_TARGET ?auto_209794 ?auto_209789 ) ( POWER_AVAIL ?auto_209793 ) ( POINTING ?auto_209793 ?auto_209790 ) ( not ( = ?auto_209789 ?auto_209790 ) ) ( not ( = ?auto_209784 ?auto_209790 ) ) ( not ( = ?auto_209785 ?auto_209780 ) ) ( not ( = ?auto_209781 ?auto_209790 ) ) ( not ( = ?auto_209785 ?auto_209779 ) ) ( not ( = ?auto_209780 ?auto_209779 ) ) ( not ( = ?auto_209778 ?auto_209790 ) ) ( not ( = ?auto_209792 ?auto_209794 ) ) ( not ( = ?auto_209785 ?auto_209783 ) ) ( not ( = ?auto_209780 ?auto_209783 ) ) ( not ( = ?auto_209779 ?auto_209783 ) ) ( not ( = ?auto_209782 ?auto_209790 ) ) ( not ( = ?auto_209795 ?auto_209791 ) ) ( not ( = ?auto_209795 ?auto_209794 ) ) ( not ( = ?auto_209785 ?auto_209787 ) ) ( not ( = ?auto_209780 ?auto_209787 ) ) ( not ( = ?auto_209779 ?auto_209787 ) ) ( not ( = ?auto_209783 ?auto_209787 ) ) ( not ( = ?auto_209786 ?auto_209790 ) ) ( not ( = ?auto_209788 ?auto_209792 ) ) ( not ( = ?auto_209788 ?auto_209791 ) ) ( not ( = ?auto_209788 ?auto_209794 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_209784 ?auto_209785 ?auto_209781 ?auto_209780 ?auto_209778 ?auto_209779 ?auto_209786 ?auto_209787 ?auto_209782 ?auto_209783 )
      ( GET-5IMAGE-VERIFY ?auto_209778 ?auto_209779 ?auto_209781 ?auto_209780 ?auto_209782 ?auto_209783 ?auto_209784 ?auto_209785 ?auto_209786 ?auto_209787 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_209856 - DIRECTION
      ?auto_209857 - MODE
      ?auto_209859 - DIRECTION
      ?auto_209858 - MODE
      ?auto_209860 - DIRECTION
      ?auto_209861 - MODE
      ?auto_209862 - DIRECTION
      ?auto_209863 - MODE
      ?auto_209864 - DIRECTION
      ?auto_209865 - MODE
    )
    :vars
    (
      ?auto_209866 - INSTRUMENT
      ?auto_209871 - SATELLITE
      ?auto_209867 - DIRECTION
      ?auto_209873 - INSTRUMENT
      ?auto_209870 - INSTRUMENT
      ?auto_209869 - INSTRUMENT
      ?auto_209872 - INSTRUMENT
      ?auto_209868 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_209859 ?auto_209856 ) ) ( not ( = ?auto_209860 ?auto_209856 ) ) ( not ( = ?auto_209860 ?auto_209859 ) ) ( not ( = ?auto_209862 ?auto_209856 ) ) ( not ( = ?auto_209862 ?auto_209859 ) ) ( not ( = ?auto_209862 ?auto_209860 ) ) ( not ( = ?auto_209864 ?auto_209856 ) ) ( not ( = ?auto_209864 ?auto_209859 ) ) ( not ( = ?auto_209864 ?auto_209860 ) ) ( not ( = ?auto_209864 ?auto_209862 ) ) ( ON_BOARD ?auto_209866 ?auto_209871 ) ( SUPPORTS ?auto_209866 ?auto_209863 ) ( not ( = ?auto_209862 ?auto_209867 ) ) ( CALIBRATION_TARGET ?auto_209866 ?auto_209867 ) ( not ( = ?auto_209867 ?auto_209860 ) ) ( ON_BOARD ?auto_209873 ?auto_209871 ) ( not ( = ?auto_209866 ?auto_209873 ) ) ( SUPPORTS ?auto_209873 ?auto_209861 ) ( CALIBRATION_TARGET ?auto_209873 ?auto_209867 ) ( not ( = ?auto_209867 ?auto_209856 ) ) ( ON_BOARD ?auto_209870 ?auto_209871 ) ( not ( = ?auto_209873 ?auto_209870 ) ) ( SUPPORTS ?auto_209870 ?auto_209857 ) ( CALIBRATION_TARGET ?auto_209870 ?auto_209867 ) ( not ( = ?auto_209867 ?auto_209859 ) ) ( ON_BOARD ?auto_209869 ?auto_209871 ) ( not ( = ?auto_209870 ?auto_209869 ) ) ( SUPPORTS ?auto_209869 ?auto_209858 ) ( CALIBRATION_TARGET ?auto_209869 ?auto_209867 ) ( not ( = ?auto_209867 ?auto_209864 ) ) ( ON_BOARD ?auto_209872 ?auto_209871 ) ( not ( = ?auto_209869 ?auto_209872 ) ) ( SUPPORTS ?auto_209872 ?auto_209865 ) ( CALIBRATION_TARGET ?auto_209872 ?auto_209867 ) ( POWER_AVAIL ?auto_209871 ) ( POINTING ?auto_209871 ?auto_209868 ) ( not ( = ?auto_209867 ?auto_209868 ) ) ( not ( = ?auto_209864 ?auto_209868 ) ) ( not ( = ?auto_209865 ?auto_209858 ) ) ( not ( = ?auto_209859 ?auto_209868 ) ) ( not ( = ?auto_209865 ?auto_209857 ) ) ( not ( = ?auto_209858 ?auto_209857 ) ) ( not ( = ?auto_209856 ?auto_209868 ) ) ( not ( = ?auto_209870 ?auto_209872 ) ) ( not ( = ?auto_209865 ?auto_209861 ) ) ( not ( = ?auto_209858 ?auto_209861 ) ) ( not ( = ?auto_209857 ?auto_209861 ) ) ( not ( = ?auto_209860 ?auto_209868 ) ) ( not ( = ?auto_209873 ?auto_209869 ) ) ( not ( = ?auto_209873 ?auto_209872 ) ) ( not ( = ?auto_209865 ?auto_209863 ) ) ( not ( = ?auto_209858 ?auto_209863 ) ) ( not ( = ?auto_209857 ?auto_209863 ) ) ( not ( = ?auto_209861 ?auto_209863 ) ) ( not ( = ?auto_209862 ?auto_209868 ) ) ( not ( = ?auto_209866 ?auto_209870 ) ) ( not ( = ?auto_209866 ?auto_209869 ) ) ( not ( = ?auto_209866 ?auto_209872 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_209864 ?auto_209865 ?auto_209859 ?auto_209858 ?auto_209856 ?auto_209857 ?auto_209862 ?auto_209863 ?auto_209860 ?auto_209861 )
      ( GET-5IMAGE-VERIFY ?auto_209856 ?auto_209857 ?auto_209859 ?auto_209858 ?auto_209860 ?auto_209861 ?auto_209862 ?auto_209863 ?auto_209864 ?auto_209865 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_210014 - DIRECTION
      ?auto_210015 - MODE
      ?auto_210017 - DIRECTION
      ?auto_210016 - MODE
      ?auto_210018 - DIRECTION
      ?auto_210019 - MODE
      ?auto_210020 - DIRECTION
      ?auto_210021 - MODE
      ?auto_210022 - DIRECTION
      ?auto_210023 - MODE
    )
    :vars
    (
      ?auto_210024 - INSTRUMENT
      ?auto_210029 - SATELLITE
      ?auto_210025 - DIRECTION
      ?auto_210031 - INSTRUMENT
      ?auto_210028 - INSTRUMENT
      ?auto_210027 - INSTRUMENT
      ?auto_210030 - INSTRUMENT
      ?auto_210026 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_210017 ?auto_210014 ) ) ( not ( = ?auto_210018 ?auto_210014 ) ) ( not ( = ?auto_210018 ?auto_210017 ) ) ( not ( = ?auto_210020 ?auto_210014 ) ) ( not ( = ?auto_210020 ?auto_210017 ) ) ( not ( = ?auto_210020 ?auto_210018 ) ) ( not ( = ?auto_210022 ?auto_210014 ) ) ( not ( = ?auto_210022 ?auto_210017 ) ) ( not ( = ?auto_210022 ?auto_210018 ) ) ( not ( = ?auto_210022 ?auto_210020 ) ) ( ON_BOARD ?auto_210024 ?auto_210029 ) ( SUPPORTS ?auto_210024 ?auto_210019 ) ( not ( = ?auto_210018 ?auto_210025 ) ) ( CALIBRATION_TARGET ?auto_210024 ?auto_210025 ) ( not ( = ?auto_210025 ?auto_210022 ) ) ( ON_BOARD ?auto_210031 ?auto_210029 ) ( not ( = ?auto_210024 ?auto_210031 ) ) ( SUPPORTS ?auto_210031 ?auto_210023 ) ( CALIBRATION_TARGET ?auto_210031 ?auto_210025 ) ( not ( = ?auto_210025 ?auto_210014 ) ) ( ON_BOARD ?auto_210028 ?auto_210029 ) ( not ( = ?auto_210031 ?auto_210028 ) ) ( SUPPORTS ?auto_210028 ?auto_210015 ) ( CALIBRATION_TARGET ?auto_210028 ?auto_210025 ) ( not ( = ?auto_210025 ?auto_210017 ) ) ( ON_BOARD ?auto_210027 ?auto_210029 ) ( not ( = ?auto_210028 ?auto_210027 ) ) ( SUPPORTS ?auto_210027 ?auto_210016 ) ( CALIBRATION_TARGET ?auto_210027 ?auto_210025 ) ( not ( = ?auto_210025 ?auto_210020 ) ) ( ON_BOARD ?auto_210030 ?auto_210029 ) ( not ( = ?auto_210027 ?auto_210030 ) ) ( SUPPORTS ?auto_210030 ?auto_210021 ) ( CALIBRATION_TARGET ?auto_210030 ?auto_210025 ) ( POWER_AVAIL ?auto_210029 ) ( POINTING ?auto_210029 ?auto_210026 ) ( not ( = ?auto_210025 ?auto_210026 ) ) ( not ( = ?auto_210020 ?auto_210026 ) ) ( not ( = ?auto_210021 ?auto_210016 ) ) ( not ( = ?auto_210017 ?auto_210026 ) ) ( not ( = ?auto_210021 ?auto_210015 ) ) ( not ( = ?auto_210016 ?auto_210015 ) ) ( not ( = ?auto_210014 ?auto_210026 ) ) ( not ( = ?auto_210028 ?auto_210030 ) ) ( not ( = ?auto_210021 ?auto_210023 ) ) ( not ( = ?auto_210016 ?auto_210023 ) ) ( not ( = ?auto_210015 ?auto_210023 ) ) ( not ( = ?auto_210022 ?auto_210026 ) ) ( not ( = ?auto_210031 ?auto_210027 ) ) ( not ( = ?auto_210031 ?auto_210030 ) ) ( not ( = ?auto_210021 ?auto_210019 ) ) ( not ( = ?auto_210016 ?auto_210019 ) ) ( not ( = ?auto_210015 ?auto_210019 ) ) ( not ( = ?auto_210023 ?auto_210019 ) ) ( not ( = ?auto_210018 ?auto_210026 ) ) ( not ( = ?auto_210024 ?auto_210028 ) ) ( not ( = ?auto_210024 ?auto_210027 ) ) ( not ( = ?auto_210024 ?auto_210030 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_210020 ?auto_210021 ?auto_210017 ?auto_210016 ?auto_210014 ?auto_210015 ?auto_210018 ?auto_210019 ?auto_210022 ?auto_210023 )
      ( GET-5IMAGE-VERIFY ?auto_210014 ?auto_210015 ?auto_210017 ?auto_210016 ?auto_210018 ?auto_210019 ?auto_210020 ?auto_210021 ?auto_210022 ?auto_210023 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_210264 - DIRECTION
      ?auto_210265 - MODE
      ?auto_210267 - DIRECTION
      ?auto_210266 - MODE
      ?auto_210268 - DIRECTION
      ?auto_210269 - MODE
      ?auto_210270 - DIRECTION
      ?auto_210271 - MODE
      ?auto_210272 - DIRECTION
      ?auto_210273 - MODE
    )
    :vars
    (
      ?auto_210274 - INSTRUMENT
      ?auto_210279 - SATELLITE
      ?auto_210275 - DIRECTION
      ?auto_210281 - INSTRUMENT
      ?auto_210278 - INSTRUMENT
      ?auto_210277 - INSTRUMENT
      ?auto_210280 - INSTRUMENT
      ?auto_210276 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_210267 ?auto_210264 ) ) ( not ( = ?auto_210268 ?auto_210264 ) ) ( not ( = ?auto_210268 ?auto_210267 ) ) ( not ( = ?auto_210270 ?auto_210264 ) ) ( not ( = ?auto_210270 ?auto_210267 ) ) ( not ( = ?auto_210270 ?auto_210268 ) ) ( not ( = ?auto_210272 ?auto_210264 ) ) ( not ( = ?auto_210272 ?auto_210267 ) ) ( not ( = ?auto_210272 ?auto_210268 ) ) ( not ( = ?auto_210272 ?auto_210270 ) ) ( ON_BOARD ?auto_210274 ?auto_210279 ) ( SUPPORTS ?auto_210274 ?auto_210269 ) ( not ( = ?auto_210268 ?auto_210275 ) ) ( CALIBRATION_TARGET ?auto_210274 ?auto_210275 ) ( not ( = ?auto_210275 ?auto_210270 ) ) ( ON_BOARD ?auto_210281 ?auto_210279 ) ( not ( = ?auto_210274 ?auto_210281 ) ) ( SUPPORTS ?auto_210281 ?auto_210271 ) ( CALIBRATION_TARGET ?auto_210281 ?auto_210275 ) ( not ( = ?auto_210275 ?auto_210264 ) ) ( ON_BOARD ?auto_210278 ?auto_210279 ) ( not ( = ?auto_210281 ?auto_210278 ) ) ( SUPPORTS ?auto_210278 ?auto_210265 ) ( CALIBRATION_TARGET ?auto_210278 ?auto_210275 ) ( not ( = ?auto_210275 ?auto_210267 ) ) ( ON_BOARD ?auto_210277 ?auto_210279 ) ( not ( = ?auto_210278 ?auto_210277 ) ) ( SUPPORTS ?auto_210277 ?auto_210266 ) ( CALIBRATION_TARGET ?auto_210277 ?auto_210275 ) ( not ( = ?auto_210275 ?auto_210272 ) ) ( ON_BOARD ?auto_210280 ?auto_210279 ) ( not ( = ?auto_210277 ?auto_210280 ) ) ( SUPPORTS ?auto_210280 ?auto_210273 ) ( CALIBRATION_TARGET ?auto_210280 ?auto_210275 ) ( POWER_AVAIL ?auto_210279 ) ( POINTING ?auto_210279 ?auto_210276 ) ( not ( = ?auto_210275 ?auto_210276 ) ) ( not ( = ?auto_210272 ?auto_210276 ) ) ( not ( = ?auto_210273 ?auto_210266 ) ) ( not ( = ?auto_210267 ?auto_210276 ) ) ( not ( = ?auto_210273 ?auto_210265 ) ) ( not ( = ?auto_210266 ?auto_210265 ) ) ( not ( = ?auto_210264 ?auto_210276 ) ) ( not ( = ?auto_210278 ?auto_210280 ) ) ( not ( = ?auto_210273 ?auto_210271 ) ) ( not ( = ?auto_210266 ?auto_210271 ) ) ( not ( = ?auto_210265 ?auto_210271 ) ) ( not ( = ?auto_210270 ?auto_210276 ) ) ( not ( = ?auto_210281 ?auto_210277 ) ) ( not ( = ?auto_210281 ?auto_210280 ) ) ( not ( = ?auto_210273 ?auto_210269 ) ) ( not ( = ?auto_210266 ?auto_210269 ) ) ( not ( = ?auto_210265 ?auto_210269 ) ) ( not ( = ?auto_210271 ?auto_210269 ) ) ( not ( = ?auto_210268 ?auto_210276 ) ) ( not ( = ?auto_210274 ?auto_210278 ) ) ( not ( = ?auto_210274 ?auto_210277 ) ) ( not ( = ?auto_210274 ?auto_210280 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_210272 ?auto_210273 ?auto_210267 ?auto_210266 ?auto_210264 ?auto_210265 ?auto_210268 ?auto_210269 ?auto_210270 ?auto_210271 )
      ( GET-5IMAGE-VERIFY ?auto_210264 ?auto_210265 ?auto_210267 ?auto_210266 ?auto_210268 ?auto_210269 ?auto_210270 ?auto_210271 ?auto_210272 ?auto_210273 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_211808 - DIRECTION
      ?auto_211809 - MODE
      ?auto_211811 - DIRECTION
      ?auto_211810 - MODE
      ?auto_211812 - DIRECTION
      ?auto_211813 - MODE
      ?auto_211814 - DIRECTION
      ?auto_211815 - MODE
      ?auto_211816 - DIRECTION
      ?auto_211817 - MODE
    )
    :vars
    (
      ?auto_211818 - INSTRUMENT
      ?auto_211823 - SATELLITE
      ?auto_211819 - DIRECTION
      ?auto_211825 - INSTRUMENT
      ?auto_211822 - INSTRUMENT
      ?auto_211821 - INSTRUMENT
      ?auto_211824 - INSTRUMENT
      ?auto_211820 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_211811 ?auto_211808 ) ) ( not ( = ?auto_211812 ?auto_211808 ) ) ( not ( = ?auto_211812 ?auto_211811 ) ) ( not ( = ?auto_211814 ?auto_211808 ) ) ( not ( = ?auto_211814 ?auto_211811 ) ) ( not ( = ?auto_211814 ?auto_211812 ) ) ( not ( = ?auto_211816 ?auto_211808 ) ) ( not ( = ?auto_211816 ?auto_211811 ) ) ( not ( = ?auto_211816 ?auto_211812 ) ) ( not ( = ?auto_211816 ?auto_211814 ) ) ( ON_BOARD ?auto_211818 ?auto_211823 ) ( SUPPORTS ?auto_211818 ?auto_211817 ) ( not ( = ?auto_211816 ?auto_211819 ) ) ( CALIBRATION_TARGET ?auto_211818 ?auto_211819 ) ( not ( = ?auto_211819 ?auto_211811 ) ) ( ON_BOARD ?auto_211825 ?auto_211823 ) ( not ( = ?auto_211818 ?auto_211825 ) ) ( SUPPORTS ?auto_211825 ?auto_211810 ) ( CALIBRATION_TARGET ?auto_211825 ?auto_211819 ) ( not ( = ?auto_211819 ?auto_211808 ) ) ( ON_BOARD ?auto_211822 ?auto_211823 ) ( not ( = ?auto_211825 ?auto_211822 ) ) ( SUPPORTS ?auto_211822 ?auto_211809 ) ( CALIBRATION_TARGET ?auto_211822 ?auto_211819 ) ( not ( = ?auto_211819 ?auto_211814 ) ) ( ON_BOARD ?auto_211821 ?auto_211823 ) ( not ( = ?auto_211822 ?auto_211821 ) ) ( SUPPORTS ?auto_211821 ?auto_211815 ) ( CALIBRATION_TARGET ?auto_211821 ?auto_211819 ) ( not ( = ?auto_211819 ?auto_211812 ) ) ( ON_BOARD ?auto_211824 ?auto_211823 ) ( not ( = ?auto_211821 ?auto_211824 ) ) ( SUPPORTS ?auto_211824 ?auto_211813 ) ( CALIBRATION_TARGET ?auto_211824 ?auto_211819 ) ( POWER_AVAIL ?auto_211823 ) ( POINTING ?auto_211823 ?auto_211820 ) ( not ( = ?auto_211819 ?auto_211820 ) ) ( not ( = ?auto_211812 ?auto_211820 ) ) ( not ( = ?auto_211813 ?auto_211815 ) ) ( not ( = ?auto_211814 ?auto_211820 ) ) ( not ( = ?auto_211813 ?auto_211809 ) ) ( not ( = ?auto_211815 ?auto_211809 ) ) ( not ( = ?auto_211808 ?auto_211820 ) ) ( not ( = ?auto_211822 ?auto_211824 ) ) ( not ( = ?auto_211813 ?auto_211810 ) ) ( not ( = ?auto_211815 ?auto_211810 ) ) ( not ( = ?auto_211809 ?auto_211810 ) ) ( not ( = ?auto_211811 ?auto_211820 ) ) ( not ( = ?auto_211825 ?auto_211821 ) ) ( not ( = ?auto_211825 ?auto_211824 ) ) ( not ( = ?auto_211813 ?auto_211817 ) ) ( not ( = ?auto_211815 ?auto_211817 ) ) ( not ( = ?auto_211809 ?auto_211817 ) ) ( not ( = ?auto_211810 ?auto_211817 ) ) ( not ( = ?auto_211816 ?auto_211820 ) ) ( not ( = ?auto_211818 ?auto_211822 ) ) ( not ( = ?auto_211818 ?auto_211821 ) ) ( not ( = ?auto_211818 ?auto_211824 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_211812 ?auto_211813 ?auto_211814 ?auto_211815 ?auto_211808 ?auto_211809 ?auto_211816 ?auto_211817 ?auto_211811 ?auto_211810 )
      ( GET-5IMAGE-VERIFY ?auto_211808 ?auto_211809 ?auto_211811 ?auto_211810 ?auto_211812 ?auto_211813 ?auto_211814 ?auto_211815 ?auto_211816 ?auto_211817 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_211886 - DIRECTION
      ?auto_211887 - MODE
      ?auto_211889 - DIRECTION
      ?auto_211888 - MODE
      ?auto_211890 - DIRECTION
      ?auto_211891 - MODE
      ?auto_211892 - DIRECTION
      ?auto_211893 - MODE
      ?auto_211894 - DIRECTION
      ?auto_211895 - MODE
    )
    :vars
    (
      ?auto_211896 - INSTRUMENT
      ?auto_211901 - SATELLITE
      ?auto_211897 - DIRECTION
      ?auto_211903 - INSTRUMENT
      ?auto_211900 - INSTRUMENT
      ?auto_211899 - INSTRUMENT
      ?auto_211902 - INSTRUMENT
      ?auto_211898 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_211889 ?auto_211886 ) ) ( not ( = ?auto_211890 ?auto_211886 ) ) ( not ( = ?auto_211890 ?auto_211889 ) ) ( not ( = ?auto_211892 ?auto_211886 ) ) ( not ( = ?auto_211892 ?auto_211889 ) ) ( not ( = ?auto_211892 ?auto_211890 ) ) ( not ( = ?auto_211894 ?auto_211886 ) ) ( not ( = ?auto_211894 ?auto_211889 ) ) ( not ( = ?auto_211894 ?auto_211890 ) ) ( not ( = ?auto_211894 ?auto_211892 ) ) ( ON_BOARD ?auto_211896 ?auto_211901 ) ( SUPPORTS ?auto_211896 ?auto_211893 ) ( not ( = ?auto_211892 ?auto_211897 ) ) ( CALIBRATION_TARGET ?auto_211896 ?auto_211897 ) ( not ( = ?auto_211897 ?auto_211889 ) ) ( ON_BOARD ?auto_211903 ?auto_211901 ) ( not ( = ?auto_211896 ?auto_211903 ) ) ( SUPPORTS ?auto_211903 ?auto_211888 ) ( CALIBRATION_TARGET ?auto_211903 ?auto_211897 ) ( not ( = ?auto_211897 ?auto_211886 ) ) ( ON_BOARD ?auto_211900 ?auto_211901 ) ( not ( = ?auto_211903 ?auto_211900 ) ) ( SUPPORTS ?auto_211900 ?auto_211887 ) ( CALIBRATION_TARGET ?auto_211900 ?auto_211897 ) ( not ( = ?auto_211897 ?auto_211894 ) ) ( ON_BOARD ?auto_211899 ?auto_211901 ) ( not ( = ?auto_211900 ?auto_211899 ) ) ( SUPPORTS ?auto_211899 ?auto_211895 ) ( CALIBRATION_TARGET ?auto_211899 ?auto_211897 ) ( not ( = ?auto_211897 ?auto_211890 ) ) ( ON_BOARD ?auto_211902 ?auto_211901 ) ( not ( = ?auto_211899 ?auto_211902 ) ) ( SUPPORTS ?auto_211902 ?auto_211891 ) ( CALIBRATION_TARGET ?auto_211902 ?auto_211897 ) ( POWER_AVAIL ?auto_211901 ) ( POINTING ?auto_211901 ?auto_211898 ) ( not ( = ?auto_211897 ?auto_211898 ) ) ( not ( = ?auto_211890 ?auto_211898 ) ) ( not ( = ?auto_211891 ?auto_211895 ) ) ( not ( = ?auto_211894 ?auto_211898 ) ) ( not ( = ?auto_211891 ?auto_211887 ) ) ( not ( = ?auto_211895 ?auto_211887 ) ) ( not ( = ?auto_211886 ?auto_211898 ) ) ( not ( = ?auto_211900 ?auto_211902 ) ) ( not ( = ?auto_211891 ?auto_211888 ) ) ( not ( = ?auto_211895 ?auto_211888 ) ) ( not ( = ?auto_211887 ?auto_211888 ) ) ( not ( = ?auto_211889 ?auto_211898 ) ) ( not ( = ?auto_211903 ?auto_211899 ) ) ( not ( = ?auto_211903 ?auto_211902 ) ) ( not ( = ?auto_211891 ?auto_211893 ) ) ( not ( = ?auto_211895 ?auto_211893 ) ) ( not ( = ?auto_211887 ?auto_211893 ) ) ( not ( = ?auto_211888 ?auto_211893 ) ) ( not ( = ?auto_211892 ?auto_211898 ) ) ( not ( = ?auto_211896 ?auto_211900 ) ) ( not ( = ?auto_211896 ?auto_211899 ) ) ( not ( = ?auto_211896 ?auto_211902 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_211890 ?auto_211891 ?auto_211894 ?auto_211895 ?auto_211886 ?auto_211887 ?auto_211892 ?auto_211893 ?auto_211889 ?auto_211888 )
      ( GET-5IMAGE-VERIFY ?auto_211886 ?auto_211887 ?auto_211889 ?auto_211888 ?auto_211890 ?auto_211891 ?auto_211892 ?auto_211893 ?auto_211894 ?auto_211895 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_211964 - DIRECTION
      ?auto_211965 - MODE
      ?auto_211967 - DIRECTION
      ?auto_211966 - MODE
      ?auto_211968 - DIRECTION
      ?auto_211969 - MODE
      ?auto_211970 - DIRECTION
      ?auto_211971 - MODE
      ?auto_211972 - DIRECTION
      ?auto_211973 - MODE
    )
    :vars
    (
      ?auto_211974 - INSTRUMENT
      ?auto_211979 - SATELLITE
      ?auto_211975 - DIRECTION
      ?auto_211981 - INSTRUMENT
      ?auto_211978 - INSTRUMENT
      ?auto_211977 - INSTRUMENT
      ?auto_211980 - INSTRUMENT
      ?auto_211976 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_211967 ?auto_211964 ) ) ( not ( = ?auto_211968 ?auto_211964 ) ) ( not ( = ?auto_211968 ?auto_211967 ) ) ( not ( = ?auto_211970 ?auto_211964 ) ) ( not ( = ?auto_211970 ?auto_211967 ) ) ( not ( = ?auto_211970 ?auto_211968 ) ) ( not ( = ?auto_211972 ?auto_211964 ) ) ( not ( = ?auto_211972 ?auto_211967 ) ) ( not ( = ?auto_211972 ?auto_211968 ) ) ( not ( = ?auto_211972 ?auto_211970 ) ) ( ON_BOARD ?auto_211974 ?auto_211979 ) ( SUPPORTS ?auto_211974 ?auto_211973 ) ( not ( = ?auto_211972 ?auto_211975 ) ) ( CALIBRATION_TARGET ?auto_211974 ?auto_211975 ) ( not ( = ?auto_211975 ?auto_211967 ) ) ( ON_BOARD ?auto_211981 ?auto_211979 ) ( not ( = ?auto_211974 ?auto_211981 ) ) ( SUPPORTS ?auto_211981 ?auto_211966 ) ( CALIBRATION_TARGET ?auto_211981 ?auto_211975 ) ( not ( = ?auto_211975 ?auto_211964 ) ) ( ON_BOARD ?auto_211978 ?auto_211979 ) ( not ( = ?auto_211981 ?auto_211978 ) ) ( SUPPORTS ?auto_211978 ?auto_211965 ) ( CALIBRATION_TARGET ?auto_211978 ?auto_211975 ) ( not ( = ?auto_211975 ?auto_211968 ) ) ( ON_BOARD ?auto_211977 ?auto_211979 ) ( not ( = ?auto_211978 ?auto_211977 ) ) ( SUPPORTS ?auto_211977 ?auto_211969 ) ( CALIBRATION_TARGET ?auto_211977 ?auto_211975 ) ( not ( = ?auto_211975 ?auto_211970 ) ) ( ON_BOARD ?auto_211980 ?auto_211979 ) ( not ( = ?auto_211977 ?auto_211980 ) ) ( SUPPORTS ?auto_211980 ?auto_211971 ) ( CALIBRATION_TARGET ?auto_211980 ?auto_211975 ) ( POWER_AVAIL ?auto_211979 ) ( POINTING ?auto_211979 ?auto_211976 ) ( not ( = ?auto_211975 ?auto_211976 ) ) ( not ( = ?auto_211970 ?auto_211976 ) ) ( not ( = ?auto_211971 ?auto_211969 ) ) ( not ( = ?auto_211968 ?auto_211976 ) ) ( not ( = ?auto_211971 ?auto_211965 ) ) ( not ( = ?auto_211969 ?auto_211965 ) ) ( not ( = ?auto_211964 ?auto_211976 ) ) ( not ( = ?auto_211978 ?auto_211980 ) ) ( not ( = ?auto_211971 ?auto_211966 ) ) ( not ( = ?auto_211969 ?auto_211966 ) ) ( not ( = ?auto_211965 ?auto_211966 ) ) ( not ( = ?auto_211967 ?auto_211976 ) ) ( not ( = ?auto_211981 ?auto_211977 ) ) ( not ( = ?auto_211981 ?auto_211980 ) ) ( not ( = ?auto_211971 ?auto_211973 ) ) ( not ( = ?auto_211969 ?auto_211973 ) ) ( not ( = ?auto_211965 ?auto_211973 ) ) ( not ( = ?auto_211966 ?auto_211973 ) ) ( not ( = ?auto_211972 ?auto_211976 ) ) ( not ( = ?auto_211974 ?auto_211978 ) ) ( not ( = ?auto_211974 ?auto_211977 ) ) ( not ( = ?auto_211974 ?auto_211980 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_211970 ?auto_211971 ?auto_211968 ?auto_211969 ?auto_211964 ?auto_211965 ?auto_211972 ?auto_211973 ?auto_211967 ?auto_211966 )
      ( GET-5IMAGE-VERIFY ?auto_211964 ?auto_211965 ?auto_211967 ?auto_211966 ?auto_211968 ?auto_211969 ?auto_211970 ?auto_211971 ?auto_211972 ?auto_211973 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_212042 - DIRECTION
      ?auto_212043 - MODE
      ?auto_212045 - DIRECTION
      ?auto_212044 - MODE
      ?auto_212046 - DIRECTION
      ?auto_212047 - MODE
      ?auto_212048 - DIRECTION
      ?auto_212049 - MODE
      ?auto_212050 - DIRECTION
      ?auto_212051 - MODE
    )
    :vars
    (
      ?auto_212052 - INSTRUMENT
      ?auto_212057 - SATELLITE
      ?auto_212053 - DIRECTION
      ?auto_212059 - INSTRUMENT
      ?auto_212056 - INSTRUMENT
      ?auto_212055 - INSTRUMENT
      ?auto_212058 - INSTRUMENT
      ?auto_212054 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_212045 ?auto_212042 ) ) ( not ( = ?auto_212046 ?auto_212042 ) ) ( not ( = ?auto_212046 ?auto_212045 ) ) ( not ( = ?auto_212048 ?auto_212042 ) ) ( not ( = ?auto_212048 ?auto_212045 ) ) ( not ( = ?auto_212048 ?auto_212046 ) ) ( not ( = ?auto_212050 ?auto_212042 ) ) ( not ( = ?auto_212050 ?auto_212045 ) ) ( not ( = ?auto_212050 ?auto_212046 ) ) ( not ( = ?auto_212050 ?auto_212048 ) ) ( ON_BOARD ?auto_212052 ?auto_212057 ) ( SUPPORTS ?auto_212052 ?auto_212049 ) ( not ( = ?auto_212048 ?auto_212053 ) ) ( CALIBRATION_TARGET ?auto_212052 ?auto_212053 ) ( not ( = ?auto_212053 ?auto_212045 ) ) ( ON_BOARD ?auto_212059 ?auto_212057 ) ( not ( = ?auto_212052 ?auto_212059 ) ) ( SUPPORTS ?auto_212059 ?auto_212044 ) ( CALIBRATION_TARGET ?auto_212059 ?auto_212053 ) ( not ( = ?auto_212053 ?auto_212042 ) ) ( ON_BOARD ?auto_212056 ?auto_212057 ) ( not ( = ?auto_212059 ?auto_212056 ) ) ( SUPPORTS ?auto_212056 ?auto_212043 ) ( CALIBRATION_TARGET ?auto_212056 ?auto_212053 ) ( not ( = ?auto_212053 ?auto_212046 ) ) ( ON_BOARD ?auto_212055 ?auto_212057 ) ( not ( = ?auto_212056 ?auto_212055 ) ) ( SUPPORTS ?auto_212055 ?auto_212047 ) ( CALIBRATION_TARGET ?auto_212055 ?auto_212053 ) ( not ( = ?auto_212053 ?auto_212050 ) ) ( ON_BOARD ?auto_212058 ?auto_212057 ) ( not ( = ?auto_212055 ?auto_212058 ) ) ( SUPPORTS ?auto_212058 ?auto_212051 ) ( CALIBRATION_TARGET ?auto_212058 ?auto_212053 ) ( POWER_AVAIL ?auto_212057 ) ( POINTING ?auto_212057 ?auto_212054 ) ( not ( = ?auto_212053 ?auto_212054 ) ) ( not ( = ?auto_212050 ?auto_212054 ) ) ( not ( = ?auto_212051 ?auto_212047 ) ) ( not ( = ?auto_212046 ?auto_212054 ) ) ( not ( = ?auto_212051 ?auto_212043 ) ) ( not ( = ?auto_212047 ?auto_212043 ) ) ( not ( = ?auto_212042 ?auto_212054 ) ) ( not ( = ?auto_212056 ?auto_212058 ) ) ( not ( = ?auto_212051 ?auto_212044 ) ) ( not ( = ?auto_212047 ?auto_212044 ) ) ( not ( = ?auto_212043 ?auto_212044 ) ) ( not ( = ?auto_212045 ?auto_212054 ) ) ( not ( = ?auto_212059 ?auto_212055 ) ) ( not ( = ?auto_212059 ?auto_212058 ) ) ( not ( = ?auto_212051 ?auto_212049 ) ) ( not ( = ?auto_212047 ?auto_212049 ) ) ( not ( = ?auto_212043 ?auto_212049 ) ) ( not ( = ?auto_212044 ?auto_212049 ) ) ( not ( = ?auto_212048 ?auto_212054 ) ) ( not ( = ?auto_212052 ?auto_212056 ) ) ( not ( = ?auto_212052 ?auto_212055 ) ) ( not ( = ?auto_212052 ?auto_212058 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_212050 ?auto_212051 ?auto_212046 ?auto_212047 ?auto_212042 ?auto_212043 ?auto_212048 ?auto_212049 ?auto_212045 ?auto_212044 )
      ( GET-5IMAGE-VERIFY ?auto_212042 ?auto_212043 ?auto_212045 ?auto_212044 ?auto_212046 ?auto_212047 ?auto_212048 ?auto_212049 ?auto_212050 ?auto_212051 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_212540 - DIRECTION
      ?auto_212541 - MODE
      ?auto_212543 - DIRECTION
      ?auto_212542 - MODE
      ?auto_212544 - DIRECTION
      ?auto_212545 - MODE
      ?auto_212546 - DIRECTION
      ?auto_212547 - MODE
      ?auto_212548 - DIRECTION
      ?auto_212549 - MODE
    )
    :vars
    (
      ?auto_212550 - INSTRUMENT
      ?auto_212555 - SATELLITE
      ?auto_212551 - DIRECTION
      ?auto_212557 - INSTRUMENT
      ?auto_212554 - INSTRUMENT
      ?auto_212553 - INSTRUMENT
      ?auto_212556 - INSTRUMENT
      ?auto_212552 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_212543 ?auto_212540 ) ) ( not ( = ?auto_212544 ?auto_212540 ) ) ( not ( = ?auto_212544 ?auto_212543 ) ) ( not ( = ?auto_212546 ?auto_212540 ) ) ( not ( = ?auto_212546 ?auto_212543 ) ) ( not ( = ?auto_212546 ?auto_212544 ) ) ( not ( = ?auto_212548 ?auto_212540 ) ) ( not ( = ?auto_212548 ?auto_212543 ) ) ( not ( = ?auto_212548 ?auto_212544 ) ) ( not ( = ?auto_212548 ?auto_212546 ) ) ( ON_BOARD ?auto_212550 ?auto_212555 ) ( SUPPORTS ?auto_212550 ?auto_212545 ) ( not ( = ?auto_212544 ?auto_212551 ) ) ( CALIBRATION_TARGET ?auto_212550 ?auto_212551 ) ( not ( = ?auto_212551 ?auto_212543 ) ) ( ON_BOARD ?auto_212557 ?auto_212555 ) ( not ( = ?auto_212550 ?auto_212557 ) ) ( SUPPORTS ?auto_212557 ?auto_212542 ) ( CALIBRATION_TARGET ?auto_212557 ?auto_212551 ) ( not ( = ?auto_212551 ?auto_212540 ) ) ( ON_BOARD ?auto_212554 ?auto_212555 ) ( not ( = ?auto_212557 ?auto_212554 ) ) ( SUPPORTS ?auto_212554 ?auto_212541 ) ( CALIBRATION_TARGET ?auto_212554 ?auto_212551 ) ( not ( = ?auto_212551 ?auto_212548 ) ) ( ON_BOARD ?auto_212553 ?auto_212555 ) ( not ( = ?auto_212554 ?auto_212553 ) ) ( SUPPORTS ?auto_212553 ?auto_212549 ) ( CALIBRATION_TARGET ?auto_212553 ?auto_212551 ) ( not ( = ?auto_212551 ?auto_212546 ) ) ( ON_BOARD ?auto_212556 ?auto_212555 ) ( not ( = ?auto_212553 ?auto_212556 ) ) ( SUPPORTS ?auto_212556 ?auto_212547 ) ( CALIBRATION_TARGET ?auto_212556 ?auto_212551 ) ( POWER_AVAIL ?auto_212555 ) ( POINTING ?auto_212555 ?auto_212552 ) ( not ( = ?auto_212551 ?auto_212552 ) ) ( not ( = ?auto_212546 ?auto_212552 ) ) ( not ( = ?auto_212547 ?auto_212549 ) ) ( not ( = ?auto_212548 ?auto_212552 ) ) ( not ( = ?auto_212547 ?auto_212541 ) ) ( not ( = ?auto_212549 ?auto_212541 ) ) ( not ( = ?auto_212540 ?auto_212552 ) ) ( not ( = ?auto_212554 ?auto_212556 ) ) ( not ( = ?auto_212547 ?auto_212542 ) ) ( not ( = ?auto_212549 ?auto_212542 ) ) ( not ( = ?auto_212541 ?auto_212542 ) ) ( not ( = ?auto_212543 ?auto_212552 ) ) ( not ( = ?auto_212557 ?auto_212553 ) ) ( not ( = ?auto_212557 ?auto_212556 ) ) ( not ( = ?auto_212547 ?auto_212545 ) ) ( not ( = ?auto_212549 ?auto_212545 ) ) ( not ( = ?auto_212541 ?auto_212545 ) ) ( not ( = ?auto_212542 ?auto_212545 ) ) ( not ( = ?auto_212544 ?auto_212552 ) ) ( not ( = ?auto_212550 ?auto_212554 ) ) ( not ( = ?auto_212550 ?auto_212553 ) ) ( not ( = ?auto_212550 ?auto_212556 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_212546 ?auto_212547 ?auto_212548 ?auto_212549 ?auto_212540 ?auto_212541 ?auto_212544 ?auto_212545 ?auto_212543 ?auto_212542 )
      ( GET-5IMAGE-VERIFY ?auto_212540 ?auto_212541 ?auto_212543 ?auto_212542 ?auto_212544 ?auto_212545 ?auto_212546 ?auto_212547 ?auto_212548 ?auto_212549 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_212618 - DIRECTION
      ?auto_212619 - MODE
      ?auto_212621 - DIRECTION
      ?auto_212620 - MODE
      ?auto_212622 - DIRECTION
      ?auto_212623 - MODE
      ?auto_212624 - DIRECTION
      ?auto_212625 - MODE
      ?auto_212626 - DIRECTION
      ?auto_212627 - MODE
    )
    :vars
    (
      ?auto_212628 - INSTRUMENT
      ?auto_212633 - SATELLITE
      ?auto_212629 - DIRECTION
      ?auto_212635 - INSTRUMENT
      ?auto_212632 - INSTRUMENT
      ?auto_212631 - INSTRUMENT
      ?auto_212634 - INSTRUMENT
      ?auto_212630 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_212621 ?auto_212618 ) ) ( not ( = ?auto_212622 ?auto_212618 ) ) ( not ( = ?auto_212622 ?auto_212621 ) ) ( not ( = ?auto_212624 ?auto_212618 ) ) ( not ( = ?auto_212624 ?auto_212621 ) ) ( not ( = ?auto_212624 ?auto_212622 ) ) ( not ( = ?auto_212626 ?auto_212618 ) ) ( not ( = ?auto_212626 ?auto_212621 ) ) ( not ( = ?auto_212626 ?auto_212622 ) ) ( not ( = ?auto_212626 ?auto_212624 ) ) ( ON_BOARD ?auto_212628 ?auto_212633 ) ( SUPPORTS ?auto_212628 ?auto_212623 ) ( not ( = ?auto_212622 ?auto_212629 ) ) ( CALIBRATION_TARGET ?auto_212628 ?auto_212629 ) ( not ( = ?auto_212629 ?auto_212621 ) ) ( ON_BOARD ?auto_212635 ?auto_212633 ) ( not ( = ?auto_212628 ?auto_212635 ) ) ( SUPPORTS ?auto_212635 ?auto_212620 ) ( CALIBRATION_TARGET ?auto_212635 ?auto_212629 ) ( not ( = ?auto_212629 ?auto_212618 ) ) ( ON_BOARD ?auto_212632 ?auto_212633 ) ( not ( = ?auto_212635 ?auto_212632 ) ) ( SUPPORTS ?auto_212632 ?auto_212619 ) ( CALIBRATION_TARGET ?auto_212632 ?auto_212629 ) ( not ( = ?auto_212629 ?auto_212624 ) ) ( ON_BOARD ?auto_212631 ?auto_212633 ) ( not ( = ?auto_212632 ?auto_212631 ) ) ( SUPPORTS ?auto_212631 ?auto_212625 ) ( CALIBRATION_TARGET ?auto_212631 ?auto_212629 ) ( not ( = ?auto_212629 ?auto_212626 ) ) ( ON_BOARD ?auto_212634 ?auto_212633 ) ( not ( = ?auto_212631 ?auto_212634 ) ) ( SUPPORTS ?auto_212634 ?auto_212627 ) ( CALIBRATION_TARGET ?auto_212634 ?auto_212629 ) ( POWER_AVAIL ?auto_212633 ) ( POINTING ?auto_212633 ?auto_212630 ) ( not ( = ?auto_212629 ?auto_212630 ) ) ( not ( = ?auto_212626 ?auto_212630 ) ) ( not ( = ?auto_212627 ?auto_212625 ) ) ( not ( = ?auto_212624 ?auto_212630 ) ) ( not ( = ?auto_212627 ?auto_212619 ) ) ( not ( = ?auto_212625 ?auto_212619 ) ) ( not ( = ?auto_212618 ?auto_212630 ) ) ( not ( = ?auto_212632 ?auto_212634 ) ) ( not ( = ?auto_212627 ?auto_212620 ) ) ( not ( = ?auto_212625 ?auto_212620 ) ) ( not ( = ?auto_212619 ?auto_212620 ) ) ( not ( = ?auto_212621 ?auto_212630 ) ) ( not ( = ?auto_212635 ?auto_212631 ) ) ( not ( = ?auto_212635 ?auto_212634 ) ) ( not ( = ?auto_212627 ?auto_212623 ) ) ( not ( = ?auto_212625 ?auto_212623 ) ) ( not ( = ?auto_212619 ?auto_212623 ) ) ( not ( = ?auto_212620 ?auto_212623 ) ) ( not ( = ?auto_212622 ?auto_212630 ) ) ( not ( = ?auto_212628 ?auto_212632 ) ) ( not ( = ?auto_212628 ?auto_212631 ) ) ( not ( = ?auto_212628 ?auto_212634 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_212626 ?auto_212627 ?auto_212624 ?auto_212625 ?auto_212618 ?auto_212619 ?auto_212622 ?auto_212623 ?auto_212621 ?auto_212620 )
      ( GET-5IMAGE-VERIFY ?auto_212618 ?auto_212619 ?auto_212621 ?auto_212620 ?auto_212622 ?auto_212623 ?auto_212624 ?auto_212625 ?auto_212626 ?auto_212627 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_213200 - DIRECTION
      ?auto_213201 - MODE
      ?auto_213203 - DIRECTION
      ?auto_213202 - MODE
      ?auto_213204 - DIRECTION
      ?auto_213205 - MODE
      ?auto_213206 - DIRECTION
      ?auto_213207 - MODE
      ?auto_213208 - DIRECTION
      ?auto_213209 - MODE
    )
    :vars
    (
      ?auto_213210 - INSTRUMENT
      ?auto_213215 - SATELLITE
      ?auto_213211 - DIRECTION
      ?auto_213217 - INSTRUMENT
      ?auto_213214 - INSTRUMENT
      ?auto_213213 - INSTRUMENT
      ?auto_213216 - INSTRUMENT
      ?auto_213212 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_213203 ?auto_213200 ) ) ( not ( = ?auto_213204 ?auto_213200 ) ) ( not ( = ?auto_213204 ?auto_213203 ) ) ( not ( = ?auto_213206 ?auto_213200 ) ) ( not ( = ?auto_213206 ?auto_213203 ) ) ( not ( = ?auto_213206 ?auto_213204 ) ) ( not ( = ?auto_213208 ?auto_213200 ) ) ( not ( = ?auto_213208 ?auto_213203 ) ) ( not ( = ?auto_213208 ?auto_213204 ) ) ( not ( = ?auto_213208 ?auto_213206 ) ) ( ON_BOARD ?auto_213210 ?auto_213215 ) ( SUPPORTS ?auto_213210 ?auto_213202 ) ( not ( = ?auto_213203 ?auto_213211 ) ) ( CALIBRATION_TARGET ?auto_213210 ?auto_213211 ) ( not ( = ?auto_213211 ?auto_213208 ) ) ( ON_BOARD ?auto_213217 ?auto_213215 ) ( not ( = ?auto_213210 ?auto_213217 ) ) ( SUPPORTS ?auto_213217 ?auto_213209 ) ( CALIBRATION_TARGET ?auto_213217 ?auto_213211 ) ( not ( = ?auto_213211 ?auto_213200 ) ) ( ON_BOARD ?auto_213214 ?auto_213215 ) ( not ( = ?auto_213217 ?auto_213214 ) ) ( SUPPORTS ?auto_213214 ?auto_213201 ) ( CALIBRATION_TARGET ?auto_213214 ?auto_213211 ) ( not ( = ?auto_213211 ?auto_213206 ) ) ( ON_BOARD ?auto_213213 ?auto_213215 ) ( not ( = ?auto_213214 ?auto_213213 ) ) ( SUPPORTS ?auto_213213 ?auto_213207 ) ( CALIBRATION_TARGET ?auto_213213 ?auto_213211 ) ( not ( = ?auto_213211 ?auto_213204 ) ) ( ON_BOARD ?auto_213216 ?auto_213215 ) ( not ( = ?auto_213213 ?auto_213216 ) ) ( SUPPORTS ?auto_213216 ?auto_213205 ) ( CALIBRATION_TARGET ?auto_213216 ?auto_213211 ) ( POWER_AVAIL ?auto_213215 ) ( POINTING ?auto_213215 ?auto_213212 ) ( not ( = ?auto_213211 ?auto_213212 ) ) ( not ( = ?auto_213204 ?auto_213212 ) ) ( not ( = ?auto_213205 ?auto_213207 ) ) ( not ( = ?auto_213206 ?auto_213212 ) ) ( not ( = ?auto_213205 ?auto_213201 ) ) ( not ( = ?auto_213207 ?auto_213201 ) ) ( not ( = ?auto_213200 ?auto_213212 ) ) ( not ( = ?auto_213214 ?auto_213216 ) ) ( not ( = ?auto_213205 ?auto_213209 ) ) ( not ( = ?auto_213207 ?auto_213209 ) ) ( not ( = ?auto_213201 ?auto_213209 ) ) ( not ( = ?auto_213208 ?auto_213212 ) ) ( not ( = ?auto_213217 ?auto_213213 ) ) ( not ( = ?auto_213217 ?auto_213216 ) ) ( not ( = ?auto_213205 ?auto_213202 ) ) ( not ( = ?auto_213207 ?auto_213202 ) ) ( not ( = ?auto_213201 ?auto_213202 ) ) ( not ( = ?auto_213209 ?auto_213202 ) ) ( not ( = ?auto_213203 ?auto_213212 ) ) ( not ( = ?auto_213210 ?auto_213214 ) ) ( not ( = ?auto_213210 ?auto_213213 ) ) ( not ( = ?auto_213210 ?auto_213216 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_213204 ?auto_213205 ?auto_213206 ?auto_213207 ?auto_213200 ?auto_213201 ?auto_213203 ?auto_213202 ?auto_213208 ?auto_213209 )
      ( GET-5IMAGE-VERIFY ?auto_213200 ?auto_213201 ?auto_213203 ?auto_213202 ?auto_213204 ?auto_213205 ?auto_213206 ?auto_213207 ?auto_213208 ?auto_213209 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_213364 - DIRECTION
      ?auto_213365 - MODE
      ?auto_213367 - DIRECTION
      ?auto_213366 - MODE
      ?auto_213368 - DIRECTION
      ?auto_213369 - MODE
      ?auto_213370 - DIRECTION
      ?auto_213371 - MODE
      ?auto_213372 - DIRECTION
      ?auto_213373 - MODE
    )
    :vars
    (
      ?auto_213374 - INSTRUMENT
      ?auto_213379 - SATELLITE
      ?auto_213375 - DIRECTION
      ?auto_213381 - INSTRUMENT
      ?auto_213378 - INSTRUMENT
      ?auto_213377 - INSTRUMENT
      ?auto_213380 - INSTRUMENT
      ?auto_213376 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_213367 ?auto_213364 ) ) ( not ( = ?auto_213368 ?auto_213364 ) ) ( not ( = ?auto_213368 ?auto_213367 ) ) ( not ( = ?auto_213370 ?auto_213364 ) ) ( not ( = ?auto_213370 ?auto_213367 ) ) ( not ( = ?auto_213370 ?auto_213368 ) ) ( not ( = ?auto_213372 ?auto_213364 ) ) ( not ( = ?auto_213372 ?auto_213367 ) ) ( not ( = ?auto_213372 ?auto_213368 ) ) ( not ( = ?auto_213372 ?auto_213370 ) ) ( ON_BOARD ?auto_213374 ?auto_213379 ) ( SUPPORTS ?auto_213374 ?auto_213366 ) ( not ( = ?auto_213367 ?auto_213375 ) ) ( CALIBRATION_TARGET ?auto_213374 ?auto_213375 ) ( not ( = ?auto_213375 ?auto_213370 ) ) ( ON_BOARD ?auto_213381 ?auto_213379 ) ( not ( = ?auto_213374 ?auto_213381 ) ) ( SUPPORTS ?auto_213381 ?auto_213371 ) ( CALIBRATION_TARGET ?auto_213381 ?auto_213375 ) ( not ( = ?auto_213375 ?auto_213364 ) ) ( ON_BOARD ?auto_213378 ?auto_213379 ) ( not ( = ?auto_213381 ?auto_213378 ) ) ( SUPPORTS ?auto_213378 ?auto_213365 ) ( CALIBRATION_TARGET ?auto_213378 ?auto_213375 ) ( not ( = ?auto_213375 ?auto_213372 ) ) ( ON_BOARD ?auto_213377 ?auto_213379 ) ( not ( = ?auto_213378 ?auto_213377 ) ) ( SUPPORTS ?auto_213377 ?auto_213373 ) ( CALIBRATION_TARGET ?auto_213377 ?auto_213375 ) ( not ( = ?auto_213375 ?auto_213368 ) ) ( ON_BOARD ?auto_213380 ?auto_213379 ) ( not ( = ?auto_213377 ?auto_213380 ) ) ( SUPPORTS ?auto_213380 ?auto_213369 ) ( CALIBRATION_TARGET ?auto_213380 ?auto_213375 ) ( POWER_AVAIL ?auto_213379 ) ( POINTING ?auto_213379 ?auto_213376 ) ( not ( = ?auto_213375 ?auto_213376 ) ) ( not ( = ?auto_213368 ?auto_213376 ) ) ( not ( = ?auto_213369 ?auto_213373 ) ) ( not ( = ?auto_213372 ?auto_213376 ) ) ( not ( = ?auto_213369 ?auto_213365 ) ) ( not ( = ?auto_213373 ?auto_213365 ) ) ( not ( = ?auto_213364 ?auto_213376 ) ) ( not ( = ?auto_213378 ?auto_213380 ) ) ( not ( = ?auto_213369 ?auto_213371 ) ) ( not ( = ?auto_213373 ?auto_213371 ) ) ( not ( = ?auto_213365 ?auto_213371 ) ) ( not ( = ?auto_213370 ?auto_213376 ) ) ( not ( = ?auto_213381 ?auto_213377 ) ) ( not ( = ?auto_213381 ?auto_213380 ) ) ( not ( = ?auto_213369 ?auto_213366 ) ) ( not ( = ?auto_213373 ?auto_213366 ) ) ( not ( = ?auto_213365 ?auto_213366 ) ) ( not ( = ?auto_213371 ?auto_213366 ) ) ( not ( = ?auto_213367 ?auto_213376 ) ) ( not ( = ?auto_213374 ?auto_213378 ) ) ( not ( = ?auto_213374 ?auto_213377 ) ) ( not ( = ?auto_213374 ?auto_213380 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_213368 ?auto_213369 ?auto_213372 ?auto_213373 ?auto_213364 ?auto_213365 ?auto_213367 ?auto_213366 ?auto_213370 ?auto_213371 )
      ( GET-5IMAGE-VERIFY ?auto_213364 ?auto_213365 ?auto_213367 ?auto_213366 ?auto_213368 ?auto_213369 ?auto_213370 ?auto_213371 ?auto_213372 ?auto_213373 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_213608 - DIRECTION
      ?auto_213609 - MODE
      ?auto_213611 - DIRECTION
      ?auto_213610 - MODE
      ?auto_213612 - DIRECTION
      ?auto_213613 - MODE
      ?auto_213614 - DIRECTION
      ?auto_213615 - MODE
      ?auto_213616 - DIRECTION
      ?auto_213617 - MODE
    )
    :vars
    (
      ?auto_213618 - INSTRUMENT
      ?auto_213623 - SATELLITE
      ?auto_213619 - DIRECTION
      ?auto_213625 - INSTRUMENT
      ?auto_213622 - INSTRUMENT
      ?auto_213621 - INSTRUMENT
      ?auto_213624 - INSTRUMENT
      ?auto_213620 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_213611 ?auto_213608 ) ) ( not ( = ?auto_213612 ?auto_213608 ) ) ( not ( = ?auto_213612 ?auto_213611 ) ) ( not ( = ?auto_213614 ?auto_213608 ) ) ( not ( = ?auto_213614 ?auto_213611 ) ) ( not ( = ?auto_213614 ?auto_213612 ) ) ( not ( = ?auto_213616 ?auto_213608 ) ) ( not ( = ?auto_213616 ?auto_213611 ) ) ( not ( = ?auto_213616 ?auto_213612 ) ) ( not ( = ?auto_213616 ?auto_213614 ) ) ( ON_BOARD ?auto_213618 ?auto_213623 ) ( SUPPORTS ?auto_213618 ?auto_213610 ) ( not ( = ?auto_213611 ?auto_213619 ) ) ( CALIBRATION_TARGET ?auto_213618 ?auto_213619 ) ( not ( = ?auto_213619 ?auto_213616 ) ) ( ON_BOARD ?auto_213625 ?auto_213623 ) ( not ( = ?auto_213618 ?auto_213625 ) ) ( SUPPORTS ?auto_213625 ?auto_213617 ) ( CALIBRATION_TARGET ?auto_213625 ?auto_213619 ) ( not ( = ?auto_213619 ?auto_213608 ) ) ( ON_BOARD ?auto_213622 ?auto_213623 ) ( not ( = ?auto_213625 ?auto_213622 ) ) ( SUPPORTS ?auto_213622 ?auto_213609 ) ( CALIBRATION_TARGET ?auto_213622 ?auto_213619 ) ( not ( = ?auto_213619 ?auto_213612 ) ) ( ON_BOARD ?auto_213621 ?auto_213623 ) ( not ( = ?auto_213622 ?auto_213621 ) ) ( SUPPORTS ?auto_213621 ?auto_213613 ) ( CALIBRATION_TARGET ?auto_213621 ?auto_213619 ) ( not ( = ?auto_213619 ?auto_213614 ) ) ( ON_BOARD ?auto_213624 ?auto_213623 ) ( not ( = ?auto_213621 ?auto_213624 ) ) ( SUPPORTS ?auto_213624 ?auto_213615 ) ( CALIBRATION_TARGET ?auto_213624 ?auto_213619 ) ( POWER_AVAIL ?auto_213623 ) ( POINTING ?auto_213623 ?auto_213620 ) ( not ( = ?auto_213619 ?auto_213620 ) ) ( not ( = ?auto_213614 ?auto_213620 ) ) ( not ( = ?auto_213615 ?auto_213613 ) ) ( not ( = ?auto_213612 ?auto_213620 ) ) ( not ( = ?auto_213615 ?auto_213609 ) ) ( not ( = ?auto_213613 ?auto_213609 ) ) ( not ( = ?auto_213608 ?auto_213620 ) ) ( not ( = ?auto_213622 ?auto_213624 ) ) ( not ( = ?auto_213615 ?auto_213617 ) ) ( not ( = ?auto_213613 ?auto_213617 ) ) ( not ( = ?auto_213609 ?auto_213617 ) ) ( not ( = ?auto_213616 ?auto_213620 ) ) ( not ( = ?auto_213625 ?auto_213621 ) ) ( not ( = ?auto_213625 ?auto_213624 ) ) ( not ( = ?auto_213615 ?auto_213610 ) ) ( not ( = ?auto_213613 ?auto_213610 ) ) ( not ( = ?auto_213609 ?auto_213610 ) ) ( not ( = ?auto_213617 ?auto_213610 ) ) ( not ( = ?auto_213611 ?auto_213620 ) ) ( not ( = ?auto_213618 ?auto_213622 ) ) ( not ( = ?auto_213618 ?auto_213621 ) ) ( not ( = ?auto_213618 ?auto_213624 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_213614 ?auto_213615 ?auto_213612 ?auto_213613 ?auto_213608 ?auto_213609 ?auto_213611 ?auto_213610 ?auto_213616 ?auto_213617 )
      ( GET-5IMAGE-VERIFY ?auto_213608 ?auto_213609 ?auto_213611 ?auto_213610 ?auto_213612 ?auto_213613 ?auto_213614 ?auto_213615 ?auto_213616 ?auto_213617 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_213858 - DIRECTION
      ?auto_213859 - MODE
      ?auto_213861 - DIRECTION
      ?auto_213860 - MODE
      ?auto_213862 - DIRECTION
      ?auto_213863 - MODE
      ?auto_213864 - DIRECTION
      ?auto_213865 - MODE
      ?auto_213866 - DIRECTION
      ?auto_213867 - MODE
    )
    :vars
    (
      ?auto_213868 - INSTRUMENT
      ?auto_213873 - SATELLITE
      ?auto_213869 - DIRECTION
      ?auto_213875 - INSTRUMENT
      ?auto_213872 - INSTRUMENT
      ?auto_213871 - INSTRUMENT
      ?auto_213874 - INSTRUMENT
      ?auto_213870 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_213861 ?auto_213858 ) ) ( not ( = ?auto_213862 ?auto_213858 ) ) ( not ( = ?auto_213862 ?auto_213861 ) ) ( not ( = ?auto_213864 ?auto_213858 ) ) ( not ( = ?auto_213864 ?auto_213861 ) ) ( not ( = ?auto_213864 ?auto_213862 ) ) ( not ( = ?auto_213866 ?auto_213858 ) ) ( not ( = ?auto_213866 ?auto_213861 ) ) ( not ( = ?auto_213866 ?auto_213862 ) ) ( not ( = ?auto_213866 ?auto_213864 ) ) ( ON_BOARD ?auto_213868 ?auto_213873 ) ( SUPPORTS ?auto_213868 ?auto_213860 ) ( not ( = ?auto_213861 ?auto_213869 ) ) ( CALIBRATION_TARGET ?auto_213868 ?auto_213869 ) ( not ( = ?auto_213869 ?auto_213864 ) ) ( ON_BOARD ?auto_213875 ?auto_213873 ) ( not ( = ?auto_213868 ?auto_213875 ) ) ( SUPPORTS ?auto_213875 ?auto_213865 ) ( CALIBRATION_TARGET ?auto_213875 ?auto_213869 ) ( not ( = ?auto_213869 ?auto_213858 ) ) ( ON_BOARD ?auto_213872 ?auto_213873 ) ( not ( = ?auto_213875 ?auto_213872 ) ) ( SUPPORTS ?auto_213872 ?auto_213859 ) ( CALIBRATION_TARGET ?auto_213872 ?auto_213869 ) ( not ( = ?auto_213869 ?auto_213862 ) ) ( ON_BOARD ?auto_213871 ?auto_213873 ) ( not ( = ?auto_213872 ?auto_213871 ) ) ( SUPPORTS ?auto_213871 ?auto_213863 ) ( CALIBRATION_TARGET ?auto_213871 ?auto_213869 ) ( not ( = ?auto_213869 ?auto_213866 ) ) ( ON_BOARD ?auto_213874 ?auto_213873 ) ( not ( = ?auto_213871 ?auto_213874 ) ) ( SUPPORTS ?auto_213874 ?auto_213867 ) ( CALIBRATION_TARGET ?auto_213874 ?auto_213869 ) ( POWER_AVAIL ?auto_213873 ) ( POINTING ?auto_213873 ?auto_213870 ) ( not ( = ?auto_213869 ?auto_213870 ) ) ( not ( = ?auto_213866 ?auto_213870 ) ) ( not ( = ?auto_213867 ?auto_213863 ) ) ( not ( = ?auto_213862 ?auto_213870 ) ) ( not ( = ?auto_213867 ?auto_213859 ) ) ( not ( = ?auto_213863 ?auto_213859 ) ) ( not ( = ?auto_213858 ?auto_213870 ) ) ( not ( = ?auto_213872 ?auto_213874 ) ) ( not ( = ?auto_213867 ?auto_213865 ) ) ( not ( = ?auto_213863 ?auto_213865 ) ) ( not ( = ?auto_213859 ?auto_213865 ) ) ( not ( = ?auto_213864 ?auto_213870 ) ) ( not ( = ?auto_213875 ?auto_213871 ) ) ( not ( = ?auto_213875 ?auto_213874 ) ) ( not ( = ?auto_213867 ?auto_213860 ) ) ( not ( = ?auto_213863 ?auto_213860 ) ) ( not ( = ?auto_213859 ?auto_213860 ) ) ( not ( = ?auto_213865 ?auto_213860 ) ) ( not ( = ?auto_213861 ?auto_213870 ) ) ( not ( = ?auto_213868 ?auto_213872 ) ) ( not ( = ?auto_213868 ?auto_213871 ) ) ( not ( = ?auto_213868 ?auto_213874 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_213866 ?auto_213867 ?auto_213862 ?auto_213863 ?auto_213858 ?auto_213859 ?auto_213861 ?auto_213860 ?auto_213864 ?auto_213865 )
      ( GET-5IMAGE-VERIFY ?auto_213858 ?auto_213859 ?auto_213861 ?auto_213860 ?auto_213862 ?auto_213863 ?auto_213864 ?auto_213865 ?auto_213866 ?auto_213867 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_214628 - DIRECTION
      ?auto_214629 - MODE
      ?auto_214631 - DIRECTION
      ?auto_214630 - MODE
      ?auto_214632 - DIRECTION
      ?auto_214633 - MODE
      ?auto_214634 - DIRECTION
      ?auto_214635 - MODE
      ?auto_214636 - DIRECTION
      ?auto_214637 - MODE
    )
    :vars
    (
      ?auto_214638 - INSTRUMENT
      ?auto_214643 - SATELLITE
      ?auto_214639 - DIRECTION
      ?auto_214645 - INSTRUMENT
      ?auto_214642 - INSTRUMENT
      ?auto_214641 - INSTRUMENT
      ?auto_214644 - INSTRUMENT
      ?auto_214640 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_214631 ?auto_214628 ) ) ( not ( = ?auto_214632 ?auto_214628 ) ) ( not ( = ?auto_214632 ?auto_214631 ) ) ( not ( = ?auto_214634 ?auto_214628 ) ) ( not ( = ?auto_214634 ?auto_214631 ) ) ( not ( = ?auto_214634 ?auto_214632 ) ) ( not ( = ?auto_214636 ?auto_214628 ) ) ( not ( = ?auto_214636 ?auto_214631 ) ) ( not ( = ?auto_214636 ?auto_214632 ) ) ( not ( = ?auto_214636 ?auto_214634 ) ) ( ON_BOARD ?auto_214638 ?auto_214643 ) ( SUPPORTS ?auto_214638 ?auto_214630 ) ( not ( = ?auto_214631 ?auto_214639 ) ) ( CALIBRATION_TARGET ?auto_214638 ?auto_214639 ) ( not ( = ?auto_214639 ?auto_214632 ) ) ( ON_BOARD ?auto_214645 ?auto_214643 ) ( not ( = ?auto_214638 ?auto_214645 ) ) ( SUPPORTS ?auto_214645 ?auto_214633 ) ( CALIBRATION_TARGET ?auto_214645 ?auto_214639 ) ( not ( = ?auto_214639 ?auto_214628 ) ) ( ON_BOARD ?auto_214642 ?auto_214643 ) ( not ( = ?auto_214645 ?auto_214642 ) ) ( SUPPORTS ?auto_214642 ?auto_214629 ) ( CALIBRATION_TARGET ?auto_214642 ?auto_214639 ) ( not ( = ?auto_214639 ?auto_214636 ) ) ( ON_BOARD ?auto_214641 ?auto_214643 ) ( not ( = ?auto_214642 ?auto_214641 ) ) ( SUPPORTS ?auto_214641 ?auto_214637 ) ( CALIBRATION_TARGET ?auto_214641 ?auto_214639 ) ( not ( = ?auto_214639 ?auto_214634 ) ) ( ON_BOARD ?auto_214644 ?auto_214643 ) ( not ( = ?auto_214641 ?auto_214644 ) ) ( SUPPORTS ?auto_214644 ?auto_214635 ) ( CALIBRATION_TARGET ?auto_214644 ?auto_214639 ) ( POWER_AVAIL ?auto_214643 ) ( POINTING ?auto_214643 ?auto_214640 ) ( not ( = ?auto_214639 ?auto_214640 ) ) ( not ( = ?auto_214634 ?auto_214640 ) ) ( not ( = ?auto_214635 ?auto_214637 ) ) ( not ( = ?auto_214636 ?auto_214640 ) ) ( not ( = ?auto_214635 ?auto_214629 ) ) ( not ( = ?auto_214637 ?auto_214629 ) ) ( not ( = ?auto_214628 ?auto_214640 ) ) ( not ( = ?auto_214642 ?auto_214644 ) ) ( not ( = ?auto_214635 ?auto_214633 ) ) ( not ( = ?auto_214637 ?auto_214633 ) ) ( not ( = ?auto_214629 ?auto_214633 ) ) ( not ( = ?auto_214632 ?auto_214640 ) ) ( not ( = ?auto_214645 ?auto_214641 ) ) ( not ( = ?auto_214645 ?auto_214644 ) ) ( not ( = ?auto_214635 ?auto_214630 ) ) ( not ( = ?auto_214637 ?auto_214630 ) ) ( not ( = ?auto_214629 ?auto_214630 ) ) ( not ( = ?auto_214633 ?auto_214630 ) ) ( not ( = ?auto_214631 ?auto_214640 ) ) ( not ( = ?auto_214638 ?auto_214642 ) ) ( not ( = ?auto_214638 ?auto_214641 ) ) ( not ( = ?auto_214638 ?auto_214644 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_214634 ?auto_214635 ?auto_214636 ?auto_214637 ?auto_214628 ?auto_214629 ?auto_214631 ?auto_214630 ?auto_214632 ?auto_214633 )
      ( GET-5IMAGE-VERIFY ?auto_214628 ?auto_214629 ?auto_214631 ?auto_214630 ?auto_214632 ?auto_214633 ?auto_214634 ?auto_214635 ?auto_214636 ?auto_214637 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_214706 - DIRECTION
      ?auto_214707 - MODE
      ?auto_214709 - DIRECTION
      ?auto_214708 - MODE
      ?auto_214710 - DIRECTION
      ?auto_214711 - MODE
      ?auto_214712 - DIRECTION
      ?auto_214713 - MODE
      ?auto_214714 - DIRECTION
      ?auto_214715 - MODE
    )
    :vars
    (
      ?auto_214716 - INSTRUMENT
      ?auto_214721 - SATELLITE
      ?auto_214717 - DIRECTION
      ?auto_214723 - INSTRUMENT
      ?auto_214720 - INSTRUMENT
      ?auto_214719 - INSTRUMENT
      ?auto_214722 - INSTRUMENT
      ?auto_214718 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_214709 ?auto_214706 ) ) ( not ( = ?auto_214710 ?auto_214706 ) ) ( not ( = ?auto_214710 ?auto_214709 ) ) ( not ( = ?auto_214712 ?auto_214706 ) ) ( not ( = ?auto_214712 ?auto_214709 ) ) ( not ( = ?auto_214712 ?auto_214710 ) ) ( not ( = ?auto_214714 ?auto_214706 ) ) ( not ( = ?auto_214714 ?auto_214709 ) ) ( not ( = ?auto_214714 ?auto_214710 ) ) ( not ( = ?auto_214714 ?auto_214712 ) ) ( ON_BOARD ?auto_214716 ?auto_214721 ) ( SUPPORTS ?auto_214716 ?auto_214708 ) ( not ( = ?auto_214709 ?auto_214717 ) ) ( CALIBRATION_TARGET ?auto_214716 ?auto_214717 ) ( not ( = ?auto_214717 ?auto_214710 ) ) ( ON_BOARD ?auto_214723 ?auto_214721 ) ( not ( = ?auto_214716 ?auto_214723 ) ) ( SUPPORTS ?auto_214723 ?auto_214711 ) ( CALIBRATION_TARGET ?auto_214723 ?auto_214717 ) ( not ( = ?auto_214717 ?auto_214706 ) ) ( ON_BOARD ?auto_214720 ?auto_214721 ) ( not ( = ?auto_214723 ?auto_214720 ) ) ( SUPPORTS ?auto_214720 ?auto_214707 ) ( CALIBRATION_TARGET ?auto_214720 ?auto_214717 ) ( not ( = ?auto_214717 ?auto_214712 ) ) ( ON_BOARD ?auto_214719 ?auto_214721 ) ( not ( = ?auto_214720 ?auto_214719 ) ) ( SUPPORTS ?auto_214719 ?auto_214713 ) ( CALIBRATION_TARGET ?auto_214719 ?auto_214717 ) ( not ( = ?auto_214717 ?auto_214714 ) ) ( ON_BOARD ?auto_214722 ?auto_214721 ) ( not ( = ?auto_214719 ?auto_214722 ) ) ( SUPPORTS ?auto_214722 ?auto_214715 ) ( CALIBRATION_TARGET ?auto_214722 ?auto_214717 ) ( POWER_AVAIL ?auto_214721 ) ( POINTING ?auto_214721 ?auto_214718 ) ( not ( = ?auto_214717 ?auto_214718 ) ) ( not ( = ?auto_214714 ?auto_214718 ) ) ( not ( = ?auto_214715 ?auto_214713 ) ) ( not ( = ?auto_214712 ?auto_214718 ) ) ( not ( = ?auto_214715 ?auto_214707 ) ) ( not ( = ?auto_214713 ?auto_214707 ) ) ( not ( = ?auto_214706 ?auto_214718 ) ) ( not ( = ?auto_214720 ?auto_214722 ) ) ( not ( = ?auto_214715 ?auto_214711 ) ) ( not ( = ?auto_214713 ?auto_214711 ) ) ( not ( = ?auto_214707 ?auto_214711 ) ) ( not ( = ?auto_214710 ?auto_214718 ) ) ( not ( = ?auto_214723 ?auto_214719 ) ) ( not ( = ?auto_214723 ?auto_214722 ) ) ( not ( = ?auto_214715 ?auto_214708 ) ) ( not ( = ?auto_214713 ?auto_214708 ) ) ( not ( = ?auto_214707 ?auto_214708 ) ) ( not ( = ?auto_214711 ?auto_214708 ) ) ( not ( = ?auto_214709 ?auto_214718 ) ) ( not ( = ?auto_214716 ?auto_214720 ) ) ( not ( = ?auto_214716 ?auto_214719 ) ) ( not ( = ?auto_214716 ?auto_214722 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_214714 ?auto_214715 ?auto_214712 ?auto_214713 ?auto_214706 ?auto_214707 ?auto_214709 ?auto_214708 ?auto_214710 ?auto_214711 )
      ( GET-5IMAGE-VERIFY ?auto_214706 ?auto_214707 ?auto_214709 ?auto_214708 ?auto_214710 ?auto_214711 ?auto_214712 ?auto_214713 ?auto_214714 ?auto_214715 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_215898 - DIRECTION
      ?auto_215899 - MODE
      ?auto_215901 - DIRECTION
      ?auto_215900 - MODE
      ?auto_215902 - DIRECTION
      ?auto_215903 - MODE
      ?auto_215904 - DIRECTION
      ?auto_215905 - MODE
      ?auto_215906 - DIRECTION
      ?auto_215907 - MODE
    )
    :vars
    (
      ?auto_215908 - INSTRUMENT
      ?auto_215913 - SATELLITE
      ?auto_215909 - DIRECTION
      ?auto_215915 - INSTRUMENT
      ?auto_215912 - INSTRUMENT
      ?auto_215911 - INSTRUMENT
      ?auto_215914 - INSTRUMENT
      ?auto_215910 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_215901 ?auto_215898 ) ) ( not ( = ?auto_215902 ?auto_215898 ) ) ( not ( = ?auto_215902 ?auto_215901 ) ) ( not ( = ?auto_215904 ?auto_215898 ) ) ( not ( = ?auto_215904 ?auto_215901 ) ) ( not ( = ?auto_215904 ?auto_215902 ) ) ( not ( = ?auto_215906 ?auto_215898 ) ) ( not ( = ?auto_215906 ?auto_215901 ) ) ( not ( = ?auto_215906 ?auto_215902 ) ) ( not ( = ?auto_215906 ?auto_215904 ) ) ( ON_BOARD ?auto_215908 ?auto_215913 ) ( SUPPORTS ?auto_215908 ?auto_215907 ) ( not ( = ?auto_215906 ?auto_215909 ) ) ( CALIBRATION_TARGET ?auto_215908 ?auto_215909 ) ( not ( = ?auto_215909 ?auto_215898 ) ) ( ON_BOARD ?auto_215915 ?auto_215913 ) ( not ( = ?auto_215908 ?auto_215915 ) ) ( SUPPORTS ?auto_215915 ?auto_215899 ) ( CALIBRATION_TARGET ?auto_215915 ?auto_215909 ) ( not ( = ?auto_215909 ?auto_215904 ) ) ( ON_BOARD ?auto_215912 ?auto_215913 ) ( not ( = ?auto_215915 ?auto_215912 ) ) ( SUPPORTS ?auto_215912 ?auto_215905 ) ( CALIBRATION_TARGET ?auto_215912 ?auto_215909 ) ( not ( = ?auto_215909 ?auto_215902 ) ) ( ON_BOARD ?auto_215911 ?auto_215913 ) ( not ( = ?auto_215912 ?auto_215911 ) ) ( SUPPORTS ?auto_215911 ?auto_215903 ) ( CALIBRATION_TARGET ?auto_215911 ?auto_215909 ) ( not ( = ?auto_215909 ?auto_215901 ) ) ( ON_BOARD ?auto_215914 ?auto_215913 ) ( not ( = ?auto_215911 ?auto_215914 ) ) ( SUPPORTS ?auto_215914 ?auto_215900 ) ( CALIBRATION_TARGET ?auto_215914 ?auto_215909 ) ( POWER_AVAIL ?auto_215913 ) ( POINTING ?auto_215913 ?auto_215910 ) ( not ( = ?auto_215909 ?auto_215910 ) ) ( not ( = ?auto_215901 ?auto_215910 ) ) ( not ( = ?auto_215900 ?auto_215903 ) ) ( not ( = ?auto_215902 ?auto_215910 ) ) ( not ( = ?auto_215900 ?auto_215905 ) ) ( not ( = ?auto_215903 ?auto_215905 ) ) ( not ( = ?auto_215904 ?auto_215910 ) ) ( not ( = ?auto_215912 ?auto_215914 ) ) ( not ( = ?auto_215900 ?auto_215899 ) ) ( not ( = ?auto_215903 ?auto_215899 ) ) ( not ( = ?auto_215905 ?auto_215899 ) ) ( not ( = ?auto_215898 ?auto_215910 ) ) ( not ( = ?auto_215915 ?auto_215911 ) ) ( not ( = ?auto_215915 ?auto_215914 ) ) ( not ( = ?auto_215900 ?auto_215907 ) ) ( not ( = ?auto_215903 ?auto_215907 ) ) ( not ( = ?auto_215905 ?auto_215907 ) ) ( not ( = ?auto_215899 ?auto_215907 ) ) ( not ( = ?auto_215906 ?auto_215910 ) ) ( not ( = ?auto_215908 ?auto_215912 ) ) ( not ( = ?auto_215908 ?auto_215911 ) ) ( not ( = ?auto_215908 ?auto_215914 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_215901 ?auto_215900 ?auto_215902 ?auto_215903 ?auto_215904 ?auto_215905 ?auto_215906 ?auto_215907 ?auto_215898 ?auto_215899 )
      ( GET-5IMAGE-VERIFY ?auto_215898 ?auto_215899 ?auto_215901 ?auto_215900 ?auto_215902 ?auto_215903 ?auto_215904 ?auto_215905 ?auto_215906 ?auto_215907 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_215976 - DIRECTION
      ?auto_215977 - MODE
      ?auto_215979 - DIRECTION
      ?auto_215978 - MODE
      ?auto_215980 - DIRECTION
      ?auto_215981 - MODE
      ?auto_215982 - DIRECTION
      ?auto_215983 - MODE
      ?auto_215984 - DIRECTION
      ?auto_215985 - MODE
    )
    :vars
    (
      ?auto_215986 - INSTRUMENT
      ?auto_215991 - SATELLITE
      ?auto_215987 - DIRECTION
      ?auto_215993 - INSTRUMENT
      ?auto_215990 - INSTRUMENT
      ?auto_215989 - INSTRUMENT
      ?auto_215992 - INSTRUMENT
      ?auto_215988 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_215979 ?auto_215976 ) ) ( not ( = ?auto_215980 ?auto_215976 ) ) ( not ( = ?auto_215980 ?auto_215979 ) ) ( not ( = ?auto_215982 ?auto_215976 ) ) ( not ( = ?auto_215982 ?auto_215979 ) ) ( not ( = ?auto_215982 ?auto_215980 ) ) ( not ( = ?auto_215984 ?auto_215976 ) ) ( not ( = ?auto_215984 ?auto_215979 ) ) ( not ( = ?auto_215984 ?auto_215980 ) ) ( not ( = ?auto_215984 ?auto_215982 ) ) ( ON_BOARD ?auto_215986 ?auto_215991 ) ( SUPPORTS ?auto_215986 ?auto_215983 ) ( not ( = ?auto_215982 ?auto_215987 ) ) ( CALIBRATION_TARGET ?auto_215986 ?auto_215987 ) ( not ( = ?auto_215987 ?auto_215976 ) ) ( ON_BOARD ?auto_215993 ?auto_215991 ) ( not ( = ?auto_215986 ?auto_215993 ) ) ( SUPPORTS ?auto_215993 ?auto_215977 ) ( CALIBRATION_TARGET ?auto_215993 ?auto_215987 ) ( not ( = ?auto_215987 ?auto_215984 ) ) ( ON_BOARD ?auto_215990 ?auto_215991 ) ( not ( = ?auto_215993 ?auto_215990 ) ) ( SUPPORTS ?auto_215990 ?auto_215985 ) ( CALIBRATION_TARGET ?auto_215990 ?auto_215987 ) ( not ( = ?auto_215987 ?auto_215980 ) ) ( ON_BOARD ?auto_215989 ?auto_215991 ) ( not ( = ?auto_215990 ?auto_215989 ) ) ( SUPPORTS ?auto_215989 ?auto_215981 ) ( CALIBRATION_TARGET ?auto_215989 ?auto_215987 ) ( not ( = ?auto_215987 ?auto_215979 ) ) ( ON_BOARD ?auto_215992 ?auto_215991 ) ( not ( = ?auto_215989 ?auto_215992 ) ) ( SUPPORTS ?auto_215992 ?auto_215978 ) ( CALIBRATION_TARGET ?auto_215992 ?auto_215987 ) ( POWER_AVAIL ?auto_215991 ) ( POINTING ?auto_215991 ?auto_215988 ) ( not ( = ?auto_215987 ?auto_215988 ) ) ( not ( = ?auto_215979 ?auto_215988 ) ) ( not ( = ?auto_215978 ?auto_215981 ) ) ( not ( = ?auto_215980 ?auto_215988 ) ) ( not ( = ?auto_215978 ?auto_215985 ) ) ( not ( = ?auto_215981 ?auto_215985 ) ) ( not ( = ?auto_215984 ?auto_215988 ) ) ( not ( = ?auto_215990 ?auto_215992 ) ) ( not ( = ?auto_215978 ?auto_215977 ) ) ( not ( = ?auto_215981 ?auto_215977 ) ) ( not ( = ?auto_215985 ?auto_215977 ) ) ( not ( = ?auto_215976 ?auto_215988 ) ) ( not ( = ?auto_215993 ?auto_215989 ) ) ( not ( = ?auto_215993 ?auto_215992 ) ) ( not ( = ?auto_215978 ?auto_215983 ) ) ( not ( = ?auto_215981 ?auto_215983 ) ) ( not ( = ?auto_215985 ?auto_215983 ) ) ( not ( = ?auto_215977 ?auto_215983 ) ) ( not ( = ?auto_215982 ?auto_215988 ) ) ( not ( = ?auto_215986 ?auto_215990 ) ) ( not ( = ?auto_215986 ?auto_215989 ) ) ( not ( = ?auto_215986 ?auto_215992 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_215979 ?auto_215978 ?auto_215980 ?auto_215981 ?auto_215984 ?auto_215985 ?auto_215982 ?auto_215983 ?auto_215976 ?auto_215977 )
      ( GET-5IMAGE-VERIFY ?auto_215976 ?auto_215977 ?auto_215979 ?auto_215978 ?auto_215980 ?auto_215981 ?auto_215982 ?auto_215983 ?auto_215984 ?auto_215985 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_216054 - DIRECTION
      ?auto_216055 - MODE
      ?auto_216057 - DIRECTION
      ?auto_216056 - MODE
      ?auto_216058 - DIRECTION
      ?auto_216059 - MODE
      ?auto_216060 - DIRECTION
      ?auto_216061 - MODE
      ?auto_216062 - DIRECTION
      ?auto_216063 - MODE
    )
    :vars
    (
      ?auto_216064 - INSTRUMENT
      ?auto_216069 - SATELLITE
      ?auto_216065 - DIRECTION
      ?auto_216071 - INSTRUMENT
      ?auto_216068 - INSTRUMENT
      ?auto_216067 - INSTRUMENT
      ?auto_216070 - INSTRUMENT
      ?auto_216066 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_216057 ?auto_216054 ) ) ( not ( = ?auto_216058 ?auto_216054 ) ) ( not ( = ?auto_216058 ?auto_216057 ) ) ( not ( = ?auto_216060 ?auto_216054 ) ) ( not ( = ?auto_216060 ?auto_216057 ) ) ( not ( = ?auto_216060 ?auto_216058 ) ) ( not ( = ?auto_216062 ?auto_216054 ) ) ( not ( = ?auto_216062 ?auto_216057 ) ) ( not ( = ?auto_216062 ?auto_216058 ) ) ( not ( = ?auto_216062 ?auto_216060 ) ) ( ON_BOARD ?auto_216064 ?auto_216069 ) ( SUPPORTS ?auto_216064 ?auto_216063 ) ( not ( = ?auto_216062 ?auto_216065 ) ) ( CALIBRATION_TARGET ?auto_216064 ?auto_216065 ) ( not ( = ?auto_216065 ?auto_216054 ) ) ( ON_BOARD ?auto_216071 ?auto_216069 ) ( not ( = ?auto_216064 ?auto_216071 ) ) ( SUPPORTS ?auto_216071 ?auto_216055 ) ( CALIBRATION_TARGET ?auto_216071 ?auto_216065 ) ( not ( = ?auto_216065 ?auto_216058 ) ) ( ON_BOARD ?auto_216068 ?auto_216069 ) ( not ( = ?auto_216071 ?auto_216068 ) ) ( SUPPORTS ?auto_216068 ?auto_216059 ) ( CALIBRATION_TARGET ?auto_216068 ?auto_216065 ) ( not ( = ?auto_216065 ?auto_216060 ) ) ( ON_BOARD ?auto_216067 ?auto_216069 ) ( not ( = ?auto_216068 ?auto_216067 ) ) ( SUPPORTS ?auto_216067 ?auto_216061 ) ( CALIBRATION_TARGET ?auto_216067 ?auto_216065 ) ( not ( = ?auto_216065 ?auto_216057 ) ) ( ON_BOARD ?auto_216070 ?auto_216069 ) ( not ( = ?auto_216067 ?auto_216070 ) ) ( SUPPORTS ?auto_216070 ?auto_216056 ) ( CALIBRATION_TARGET ?auto_216070 ?auto_216065 ) ( POWER_AVAIL ?auto_216069 ) ( POINTING ?auto_216069 ?auto_216066 ) ( not ( = ?auto_216065 ?auto_216066 ) ) ( not ( = ?auto_216057 ?auto_216066 ) ) ( not ( = ?auto_216056 ?auto_216061 ) ) ( not ( = ?auto_216060 ?auto_216066 ) ) ( not ( = ?auto_216056 ?auto_216059 ) ) ( not ( = ?auto_216061 ?auto_216059 ) ) ( not ( = ?auto_216058 ?auto_216066 ) ) ( not ( = ?auto_216068 ?auto_216070 ) ) ( not ( = ?auto_216056 ?auto_216055 ) ) ( not ( = ?auto_216061 ?auto_216055 ) ) ( not ( = ?auto_216059 ?auto_216055 ) ) ( not ( = ?auto_216054 ?auto_216066 ) ) ( not ( = ?auto_216071 ?auto_216067 ) ) ( not ( = ?auto_216071 ?auto_216070 ) ) ( not ( = ?auto_216056 ?auto_216063 ) ) ( not ( = ?auto_216061 ?auto_216063 ) ) ( not ( = ?auto_216059 ?auto_216063 ) ) ( not ( = ?auto_216055 ?auto_216063 ) ) ( not ( = ?auto_216062 ?auto_216066 ) ) ( not ( = ?auto_216064 ?auto_216068 ) ) ( not ( = ?auto_216064 ?auto_216067 ) ) ( not ( = ?auto_216064 ?auto_216070 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_216057 ?auto_216056 ?auto_216060 ?auto_216061 ?auto_216058 ?auto_216059 ?auto_216062 ?auto_216063 ?auto_216054 ?auto_216055 )
      ( GET-5IMAGE-VERIFY ?auto_216054 ?auto_216055 ?auto_216057 ?auto_216056 ?auto_216058 ?auto_216059 ?auto_216060 ?auto_216061 ?auto_216062 ?auto_216063 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_216132 - DIRECTION
      ?auto_216133 - MODE
      ?auto_216135 - DIRECTION
      ?auto_216134 - MODE
      ?auto_216136 - DIRECTION
      ?auto_216137 - MODE
      ?auto_216138 - DIRECTION
      ?auto_216139 - MODE
      ?auto_216140 - DIRECTION
      ?auto_216141 - MODE
    )
    :vars
    (
      ?auto_216142 - INSTRUMENT
      ?auto_216147 - SATELLITE
      ?auto_216143 - DIRECTION
      ?auto_216149 - INSTRUMENT
      ?auto_216146 - INSTRUMENT
      ?auto_216145 - INSTRUMENT
      ?auto_216148 - INSTRUMENT
      ?auto_216144 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_216135 ?auto_216132 ) ) ( not ( = ?auto_216136 ?auto_216132 ) ) ( not ( = ?auto_216136 ?auto_216135 ) ) ( not ( = ?auto_216138 ?auto_216132 ) ) ( not ( = ?auto_216138 ?auto_216135 ) ) ( not ( = ?auto_216138 ?auto_216136 ) ) ( not ( = ?auto_216140 ?auto_216132 ) ) ( not ( = ?auto_216140 ?auto_216135 ) ) ( not ( = ?auto_216140 ?auto_216136 ) ) ( not ( = ?auto_216140 ?auto_216138 ) ) ( ON_BOARD ?auto_216142 ?auto_216147 ) ( SUPPORTS ?auto_216142 ?auto_216139 ) ( not ( = ?auto_216138 ?auto_216143 ) ) ( CALIBRATION_TARGET ?auto_216142 ?auto_216143 ) ( not ( = ?auto_216143 ?auto_216132 ) ) ( ON_BOARD ?auto_216149 ?auto_216147 ) ( not ( = ?auto_216142 ?auto_216149 ) ) ( SUPPORTS ?auto_216149 ?auto_216133 ) ( CALIBRATION_TARGET ?auto_216149 ?auto_216143 ) ( not ( = ?auto_216143 ?auto_216136 ) ) ( ON_BOARD ?auto_216146 ?auto_216147 ) ( not ( = ?auto_216149 ?auto_216146 ) ) ( SUPPORTS ?auto_216146 ?auto_216137 ) ( CALIBRATION_TARGET ?auto_216146 ?auto_216143 ) ( not ( = ?auto_216143 ?auto_216140 ) ) ( ON_BOARD ?auto_216145 ?auto_216147 ) ( not ( = ?auto_216146 ?auto_216145 ) ) ( SUPPORTS ?auto_216145 ?auto_216141 ) ( CALIBRATION_TARGET ?auto_216145 ?auto_216143 ) ( not ( = ?auto_216143 ?auto_216135 ) ) ( ON_BOARD ?auto_216148 ?auto_216147 ) ( not ( = ?auto_216145 ?auto_216148 ) ) ( SUPPORTS ?auto_216148 ?auto_216134 ) ( CALIBRATION_TARGET ?auto_216148 ?auto_216143 ) ( POWER_AVAIL ?auto_216147 ) ( POINTING ?auto_216147 ?auto_216144 ) ( not ( = ?auto_216143 ?auto_216144 ) ) ( not ( = ?auto_216135 ?auto_216144 ) ) ( not ( = ?auto_216134 ?auto_216141 ) ) ( not ( = ?auto_216140 ?auto_216144 ) ) ( not ( = ?auto_216134 ?auto_216137 ) ) ( not ( = ?auto_216141 ?auto_216137 ) ) ( not ( = ?auto_216136 ?auto_216144 ) ) ( not ( = ?auto_216146 ?auto_216148 ) ) ( not ( = ?auto_216134 ?auto_216133 ) ) ( not ( = ?auto_216141 ?auto_216133 ) ) ( not ( = ?auto_216137 ?auto_216133 ) ) ( not ( = ?auto_216132 ?auto_216144 ) ) ( not ( = ?auto_216149 ?auto_216145 ) ) ( not ( = ?auto_216149 ?auto_216148 ) ) ( not ( = ?auto_216134 ?auto_216139 ) ) ( not ( = ?auto_216141 ?auto_216139 ) ) ( not ( = ?auto_216137 ?auto_216139 ) ) ( not ( = ?auto_216133 ?auto_216139 ) ) ( not ( = ?auto_216138 ?auto_216144 ) ) ( not ( = ?auto_216142 ?auto_216146 ) ) ( not ( = ?auto_216142 ?auto_216145 ) ) ( not ( = ?auto_216142 ?auto_216148 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_216135 ?auto_216134 ?auto_216140 ?auto_216141 ?auto_216136 ?auto_216137 ?auto_216138 ?auto_216139 ?auto_216132 ?auto_216133 )
      ( GET-5IMAGE-VERIFY ?auto_216132 ?auto_216133 ?auto_216135 ?auto_216134 ?auto_216136 ?auto_216137 ?auto_216138 ?auto_216139 ?auto_216140 ?auto_216141 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_216546 - DIRECTION
      ?auto_216547 - MODE
      ?auto_216549 - DIRECTION
      ?auto_216548 - MODE
      ?auto_216550 - DIRECTION
      ?auto_216551 - MODE
      ?auto_216552 - DIRECTION
      ?auto_216553 - MODE
      ?auto_216554 - DIRECTION
      ?auto_216555 - MODE
    )
    :vars
    (
      ?auto_216556 - INSTRUMENT
      ?auto_216561 - SATELLITE
      ?auto_216557 - DIRECTION
      ?auto_216563 - INSTRUMENT
      ?auto_216560 - INSTRUMENT
      ?auto_216559 - INSTRUMENT
      ?auto_216562 - INSTRUMENT
      ?auto_216558 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_216549 ?auto_216546 ) ) ( not ( = ?auto_216550 ?auto_216546 ) ) ( not ( = ?auto_216550 ?auto_216549 ) ) ( not ( = ?auto_216552 ?auto_216546 ) ) ( not ( = ?auto_216552 ?auto_216549 ) ) ( not ( = ?auto_216552 ?auto_216550 ) ) ( not ( = ?auto_216554 ?auto_216546 ) ) ( not ( = ?auto_216554 ?auto_216549 ) ) ( not ( = ?auto_216554 ?auto_216550 ) ) ( not ( = ?auto_216554 ?auto_216552 ) ) ( ON_BOARD ?auto_216556 ?auto_216561 ) ( SUPPORTS ?auto_216556 ?auto_216551 ) ( not ( = ?auto_216550 ?auto_216557 ) ) ( CALIBRATION_TARGET ?auto_216556 ?auto_216557 ) ( not ( = ?auto_216557 ?auto_216546 ) ) ( ON_BOARD ?auto_216563 ?auto_216561 ) ( not ( = ?auto_216556 ?auto_216563 ) ) ( SUPPORTS ?auto_216563 ?auto_216547 ) ( CALIBRATION_TARGET ?auto_216563 ?auto_216557 ) ( not ( = ?auto_216557 ?auto_216554 ) ) ( ON_BOARD ?auto_216560 ?auto_216561 ) ( not ( = ?auto_216563 ?auto_216560 ) ) ( SUPPORTS ?auto_216560 ?auto_216555 ) ( CALIBRATION_TARGET ?auto_216560 ?auto_216557 ) ( not ( = ?auto_216557 ?auto_216552 ) ) ( ON_BOARD ?auto_216559 ?auto_216561 ) ( not ( = ?auto_216560 ?auto_216559 ) ) ( SUPPORTS ?auto_216559 ?auto_216553 ) ( CALIBRATION_TARGET ?auto_216559 ?auto_216557 ) ( not ( = ?auto_216557 ?auto_216549 ) ) ( ON_BOARD ?auto_216562 ?auto_216561 ) ( not ( = ?auto_216559 ?auto_216562 ) ) ( SUPPORTS ?auto_216562 ?auto_216548 ) ( CALIBRATION_TARGET ?auto_216562 ?auto_216557 ) ( POWER_AVAIL ?auto_216561 ) ( POINTING ?auto_216561 ?auto_216558 ) ( not ( = ?auto_216557 ?auto_216558 ) ) ( not ( = ?auto_216549 ?auto_216558 ) ) ( not ( = ?auto_216548 ?auto_216553 ) ) ( not ( = ?auto_216552 ?auto_216558 ) ) ( not ( = ?auto_216548 ?auto_216555 ) ) ( not ( = ?auto_216553 ?auto_216555 ) ) ( not ( = ?auto_216554 ?auto_216558 ) ) ( not ( = ?auto_216560 ?auto_216562 ) ) ( not ( = ?auto_216548 ?auto_216547 ) ) ( not ( = ?auto_216553 ?auto_216547 ) ) ( not ( = ?auto_216555 ?auto_216547 ) ) ( not ( = ?auto_216546 ?auto_216558 ) ) ( not ( = ?auto_216563 ?auto_216559 ) ) ( not ( = ?auto_216563 ?auto_216562 ) ) ( not ( = ?auto_216548 ?auto_216551 ) ) ( not ( = ?auto_216553 ?auto_216551 ) ) ( not ( = ?auto_216555 ?auto_216551 ) ) ( not ( = ?auto_216547 ?auto_216551 ) ) ( not ( = ?auto_216550 ?auto_216558 ) ) ( not ( = ?auto_216556 ?auto_216560 ) ) ( not ( = ?auto_216556 ?auto_216559 ) ) ( not ( = ?auto_216556 ?auto_216562 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_216549 ?auto_216548 ?auto_216552 ?auto_216553 ?auto_216554 ?auto_216555 ?auto_216550 ?auto_216551 ?auto_216546 ?auto_216547 )
      ( GET-5IMAGE-VERIFY ?auto_216546 ?auto_216547 ?auto_216549 ?auto_216548 ?auto_216550 ?auto_216551 ?auto_216552 ?auto_216553 ?auto_216554 ?auto_216555 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_216624 - DIRECTION
      ?auto_216625 - MODE
      ?auto_216627 - DIRECTION
      ?auto_216626 - MODE
      ?auto_216628 - DIRECTION
      ?auto_216629 - MODE
      ?auto_216630 - DIRECTION
      ?auto_216631 - MODE
      ?auto_216632 - DIRECTION
      ?auto_216633 - MODE
    )
    :vars
    (
      ?auto_216634 - INSTRUMENT
      ?auto_216639 - SATELLITE
      ?auto_216635 - DIRECTION
      ?auto_216641 - INSTRUMENT
      ?auto_216638 - INSTRUMENT
      ?auto_216637 - INSTRUMENT
      ?auto_216640 - INSTRUMENT
      ?auto_216636 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_216627 ?auto_216624 ) ) ( not ( = ?auto_216628 ?auto_216624 ) ) ( not ( = ?auto_216628 ?auto_216627 ) ) ( not ( = ?auto_216630 ?auto_216624 ) ) ( not ( = ?auto_216630 ?auto_216627 ) ) ( not ( = ?auto_216630 ?auto_216628 ) ) ( not ( = ?auto_216632 ?auto_216624 ) ) ( not ( = ?auto_216632 ?auto_216627 ) ) ( not ( = ?auto_216632 ?auto_216628 ) ) ( not ( = ?auto_216632 ?auto_216630 ) ) ( ON_BOARD ?auto_216634 ?auto_216639 ) ( SUPPORTS ?auto_216634 ?auto_216629 ) ( not ( = ?auto_216628 ?auto_216635 ) ) ( CALIBRATION_TARGET ?auto_216634 ?auto_216635 ) ( not ( = ?auto_216635 ?auto_216624 ) ) ( ON_BOARD ?auto_216641 ?auto_216639 ) ( not ( = ?auto_216634 ?auto_216641 ) ) ( SUPPORTS ?auto_216641 ?auto_216625 ) ( CALIBRATION_TARGET ?auto_216641 ?auto_216635 ) ( not ( = ?auto_216635 ?auto_216630 ) ) ( ON_BOARD ?auto_216638 ?auto_216639 ) ( not ( = ?auto_216641 ?auto_216638 ) ) ( SUPPORTS ?auto_216638 ?auto_216631 ) ( CALIBRATION_TARGET ?auto_216638 ?auto_216635 ) ( not ( = ?auto_216635 ?auto_216632 ) ) ( ON_BOARD ?auto_216637 ?auto_216639 ) ( not ( = ?auto_216638 ?auto_216637 ) ) ( SUPPORTS ?auto_216637 ?auto_216633 ) ( CALIBRATION_TARGET ?auto_216637 ?auto_216635 ) ( not ( = ?auto_216635 ?auto_216627 ) ) ( ON_BOARD ?auto_216640 ?auto_216639 ) ( not ( = ?auto_216637 ?auto_216640 ) ) ( SUPPORTS ?auto_216640 ?auto_216626 ) ( CALIBRATION_TARGET ?auto_216640 ?auto_216635 ) ( POWER_AVAIL ?auto_216639 ) ( POINTING ?auto_216639 ?auto_216636 ) ( not ( = ?auto_216635 ?auto_216636 ) ) ( not ( = ?auto_216627 ?auto_216636 ) ) ( not ( = ?auto_216626 ?auto_216633 ) ) ( not ( = ?auto_216632 ?auto_216636 ) ) ( not ( = ?auto_216626 ?auto_216631 ) ) ( not ( = ?auto_216633 ?auto_216631 ) ) ( not ( = ?auto_216630 ?auto_216636 ) ) ( not ( = ?auto_216638 ?auto_216640 ) ) ( not ( = ?auto_216626 ?auto_216625 ) ) ( not ( = ?auto_216633 ?auto_216625 ) ) ( not ( = ?auto_216631 ?auto_216625 ) ) ( not ( = ?auto_216624 ?auto_216636 ) ) ( not ( = ?auto_216641 ?auto_216637 ) ) ( not ( = ?auto_216641 ?auto_216640 ) ) ( not ( = ?auto_216626 ?auto_216629 ) ) ( not ( = ?auto_216633 ?auto_216629 ) ) ( not ( = ?auto_216631 ?auto_216629 ) ) ( not ( = ?auto_216625 ?auto_216629 ) ) ( not ( = ?auto_216628 ?auto_216636 ) ) ( not ( = ?auto_216634 ?auto_216638 ) ) ( not ( = ?auto_216634 ?auto_216637 ) ) ( not ( = ?auto_216634 ?auto_216640 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_216627 ?auto_216626 ?auto_216632 ?auto_216633 ?auto_216630 ?auto_216631 ?auto_216628 ?auto_216629 ?auto_216624 ?auto_216625 )
      ( GET-5IMAGE-VERIFY ?auto_216624 ?auto_216625 ?auto_216627 ?auto_216626 ?auto_216628 ?auto_216629 ?auto_216630 ?auto_216631 ?auto_216632 ?auto_216633 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_216954 - DIRECTION
      ?auto_216955 - MODE
      ?auto_216957 - DIRECTION
      ?auto_216956 - MODE
      ?auto_216958 - DIRECTION
      ?auto_216959 - MODE
      ?auto_216960 - DIRECTION
      ?auto_216961 - MODE
      ?auto_216962 - DIRECTION
      ?auto_216963 - MODE
    )
    :vars
    (
      ?auto_216964 - INSTRUMENT
      ?auto_216969 - SATELLITE
      ?auto_216965 - DIRECTION
      ?auto_216971 - INSTRUMENT
      ?auto_216968 - INSTRUMENT
      ?auto_216967 - INSTRUMENT
      ?auto_216970 - INSTRUMENT
      ?auto_216966 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_216957 ?auto_216954 ) ) ( not ( = ?auto_216958 ?auto_216954 ) ) ( not ( = ?auto_216958 ?auto_216957 ) ) ( not ( = ?auto_216960 ?auto_216954 ) ) ( not ( = ?auto_216960 ?auto_216957 ) ) ( not ( = ?auto_216960 ?auto_216958 ) ) ( not ( = ?auto_216962 ?auto_216954 ) ) ( not ( = ?auto_216962 ?auto_216957 ) ) ( not ( = ?auto_216962 ?auto_216958 ) ) ( not ( = ?auto_216962 ?auto_216960 ) ) ( ON_BOARD ?auto_216964 ?auto_216969 ) ( SUPPORTS ?auto_216964 ?auto_216963 ) ( not ( = ?auto_216962 ?auto_216965 ) ) ( CALIBRATION_TARGET ?auto_216964 ?auto_216965 ) ( not ( = ?auto_216965 ?auto_216954 ) ) ( ON_BOARD ?auto_216971 ?auto_216969 ) ( not ( = ?auto_216964 ?auto_216971 ) ) ( SUPPORTS ?auto_216971 ?auto_216955 ) ( CALIBRATION_TARGET ?auto_216971 ?auto_216965 ) ( not ( = ?auto_216965 ?auto_216960 ) ) ( ON_BOARD ?auto_216968 ?auto_216969 ) ( not ( = ?auto_216971 ?auto_216968 ) ) ( SUPPORTS ?auto_216968 ?auto_216961 ) ( CALIBRATION_TARGET ?auto_216968 ?auto_216965 ) ( not ( = ?auto_216965 ?auto_216957 ) ) ( ON_BOARD ?auto_216967 ?auto_216969 ) ( not ( = ?auto_216968 ?auto_216967 ) ) ( SUPPORTS ?auto_216967 ?auto_216956 ) ( CALIBRATION_TARGET ?auto_216967 ?auto_216965 ) ( not ( = ?auto_216965 ?auto_216958 ) ) ( ON_BOARD ?auto_216970 ?auto_216969 ) ( not ( = ?auto_216967 ?auto_216970 ) ) ( SUPPORTS ?auto_216970 ?auto_216959 ) ( CALIBRATION_TARGET ?auto_216970 ?auto_216965 ) ( POWER_AVAIL ?auto_216969 ) ( POINTING ?auto_216969 ?auto_216966 ) ( not ( = ?auto_216965 ?auto_216966 ) ) ( not ( = ?auto_216958 ?auto_216966 ) ) ( not ( = ?auto_216959 ?auto_216956 ) ) ( not ( = ?auto_216957 ?auto_216966 ) ) ( not ( = ?auto_216959 ?auto_216961 ) ) ( not ( = ?auto_216956 ?auto_216961 ) ) ( not ( = ?auto_216960 ?auto_216966 ) ) ( not ( = ?auto_216968 ?auto_216970 ) ) ( not ( = ?auto_216959 ?auto_216955 ) ) ( not ( = ?auto_216956 ?auto_216955 ) ) ( not ( = ?auto_216961 ?auto_216955 ) ) ( not ( = ?auto_216954 ?auto_216966 ) ) ( not ( = ?auto_216971 ?auto_216967 ) ) ( not ( = ?auto_216971 ?auto_216970 ) ) ( not ( = ?auto_216959 ?auto_216963 ) ) ( not ( = ?auto_216956 ?auto_216963 ) ) ( not ( = ?auto_216961 ?auto_216963 ) ) ( not ( = ?auto_216955 ?auto_216963 ) ) ( not ( = ?auto_216962 ?auto_216966 ) ) ( not ( = ?auto_216964 ?auto_216968 ) ) ( not ( = ?auto_216964 ?auto_216967 ) ) ( not ( = ?auto_216964 ?auto_216970 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_216958 ?auto_216959 ?auto_216957 ?auto_216956 ?auto_216960 ?auto_216961 ?auto_216962 ?auto_216963 ?auto_216954 ?auto_216955 )
      ( GET-5IMAGE-VERIFY ?auto_216954 ?auto_216955 ?auto_216957 ?auto_216956 ?auto_216958 ?auto_216959 ?auto_216960 ?auto_216961 ?auto_216962 ?auto_216963 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_217032 - DIRECTION
      ?auto_217033 - MODE
      ?auto_217035 - DIRECTION
      ?auto_217034 - MODE
      ?auto_217036 - DIRECTION
      ?auto_217037 - MODE
      ?auto_217038 - DIRECTION
      ?auto_217039 - MODE
      ?auto_217040 - DIRECTION
      ?auto_217041 - MODE
    )
    :vars
    (
      ?auto_217042 - INSTRUMENT
      ?auto_217047 - SATELLITE
      ?auto_217043 - DIRECTION
      ?auto_217049 - INSTRUMENT
      ?auto_217046 - INSTRUMENT
      ?auto_217045 - INSTRUMENT
      ?auto_217048 - INSTRUMENT
      ?auto_217044 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_217035 ?auto_217032 ) ) ( not ( = ?auto_217036 ?auto_217032 ) ) ( not ( = ?auto_217036 ?auto_217035 ) ) ( not ( = ?auto_217038 ?auto_217032 ) ) ( not ( = ?auto_217038 ?auto_217035 ) ) ( not ( = ?auto_217038 ?auto_217036 ) ) ( not ( = ?auto_217040 ?auto_217032 ) ) ( not ( = ?auto_217040 ?auto_217035 ) ) ( not ( = ?auto_217040 ?auto_217036 ) ) ( not ( = ?auto_217040 ?auto_217038 ) ) ( ON_BOARD ?auto_217042 ?auto_217047 ) ( SUPPORTS ?auto_217042 ?auto_217039 ) ( not ( = ?auto_217038 ?auto_217043 ) ) ( CALIBRATION_TARGET ?auto_217042 ?auto_217043 ) ( not ( = ?auto_217043 ?auto_217032 ) ) ( ON_BOARD ?auto_217049 ?auto_217047 ) ( not ( = ?auto_217042 ?auto_217049 ) ) ( SUPPORTS ?auto_217049 ?auto_217033 ) ( CALIBRATION_TARGET ?auto_217049 ?auto_217043 ) ( not ( = ?auto_217043 ?auto_217040 ) ) ( ON_BOARD ?auto_217046 ?auto_217047 ) ( not ( = ?auto_217049 ?auto_217046 ) ) ( SUPPORTS ?auto_217046 ?auto_217041 ) ( CALIBRATION_TARGET ?auto_217046 ?auto_217043 ) ( not ( = ?auto_217043 ?auto_217035 ) ) ( ON_BOARD ?auto_217045 ?auto_217047 ) ( not ( = ?auto_217046 ?auto_217045 ) ) ( SUPPORTS ?auto_217045 ?auto_217034 ) ( CALIBRATION_TARGET ?auto_217045 ?auto_217043 ) ( not ( = ?auto_217043 ?auto_217036 ) ) ( ON_BOARD ?auto_217048 ?auto_217047 ) ( not ( = ?auto_217045 ?auto_217048 ) ) ( SUPPORTS ?auto_217048 ?auto_217037 ) ( CALIBRATION_TARGET ?auto_217048 ?auto_217043 ) ( POWER_AVAIL ?auto_217047 ) ( POINTING ?auto_217047 ?auto_217044 ) ( not ( = ?auto_217043 ?auto_217044 ) ) ( not ( = ?auto_217036 ?auto_217044 ) ) ( not ( = ?auto_217037 ?auto_217034 ) ) ( not ( = ?auto_217035 ?auto_217044 ) ) ( not ( = ?auto_217037 ?auto_217041 ) ) ( not ( = ?auto_217034 ?auto_217041 ) ) ( not ( = ?auto_217040 ?auto_217044 ) ) ( not ( = ?auto_217046 ?auto_217048 ) ) ( not ( = ?auto_217037 ?auto_217033 ) ) ( not ( = ?auto_217034 ?auto_217033 ) ) ( not ( = ?auto_217041 ?auto_217033 ) ) ( not ( = ?auto_217032 ?auto_217044 ) ) ( not ( = ?auto_217049 ?auto_217045 ) ) ( not ( = ?auto_217049 ?auto_217048 ) ) ( not ( = ?auto_217037 ?auto_217039 ) ) ( not ( = ?auto_217034 ?auto_217039 ) ) ( not ( = ?auto_217041 ?auto_217039 ) ) ( not ( = ?auto_217033 ?auto_217039 ) ) ( not ( = ?auto_217038 ?auto_217044 ) ) ( not ( = ?auto_217042 ?auto_217046 ) ) ( not ( = ?auto_217042 ?auto_217045 ) ) ( not ( = ?auto_217042 ?auto_217048 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_217036 ?auto_217037 ?auto_217035 ?auto_217034 ?auto_217040 ?auto_217041 ?auto_217038 ?auto_217039 ?auto_217032 ?auto_217033 )
      ( GET-5IMAGE-VERIFY ?auto_217032 ?auto_217033 ?auto_217035 ?auto_217034 ?auto_217036 ?auto_217037 ?auto_217038 ?auto_217039 ?auto_217040 ?auto_217041 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_217280 - DIRECTION
      ?auto_217281 - MODE
      ?auto_217283 - DIRECTION
      ?auto_217282 - MODE
      ?auto_217284 - DIRECTION
      ?auto_217285 - MODE
      ?auto_217286 - DIRECTION
      ?auto_217287 - MODE
      ?auto_217288 - DIRECTION
      ?auto_217289 - MODE
    )
    :vars
    (
      ?auto_217290 - INSTRUMENT
      ?auto_217295 - SATELLITE
      ?auto_217291 - DIRECTION
      ?auto_217297 - INSTRUMENT
      ?auto_217294 - INSTRUMENT
      ?auto_217293 - INSTRUMENT
      ?auto_217296 - INSTRUMENT
      ?auto_217292 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_217283 ?auto_217280 ) ) ( not ( = ?auto_217284 ?auto_217280 ) ) ( not ( = ?auto_217284 ?auto_217283 ) ) ( not ( = ?auto_217286 ?auto_217280 ) ) ( not ( = ?auto_217286 ?auto_217283 ) ) ( not ( = ?auto_217286 ?auto_217284 ) ) ( not ( = ?auto_217288 ?auto_217280 ) ) ( not ( = ?auto_217288 ?auto_217283 ) ) ( not ( = ?auto_217288 ?auto_217284 ) ) ( not ( = ?auto_217288 ?auto_217286 ) ) ( ON_BOARD ?auto_217290 ?auto_217295 ) ( SUPPORTS ?auto_217290 ?auto_217289 ) ( not ( = ?auto_217288 ?auto_217291 ) ) ( CALIBRATION_TARGET ?auto_217290 ?auto_217291 ) ( not ( = ?auto_217291 ?auto_217280 ) ) ( ON_BOARD ?auto_217297 ?auto_217295 ) ( not ( = ?auto_217290 ?auto_217297 ) ) ( SUPPORTS ?auto_217297 ?auto_217281 ) ( CALIBRATION_TARGET ?auto_217297 ?auto_217291 ) ( not ( = ?auto_217291 ?auto_217284 ) ) ( ON_BOARD ?auto_217294 ?auto_217295 ) ( not ( = ?auto_217297 ?auto_217294 ) ) ( SUPPORTS ?auto_217294 ?auto_217285 ) ( CALIBRATION_TARGET ?auto_217294 ?auto_217291 ) ( not ( = ?auto_217291 ?auto_217283 ) ) ( ON_BOARD ?auto_217293 ?auto_217295 ) ( not ( = ?auto_217294 ?auto_217293 ) ) ( SUPPORTS ?auto_217293 ?auto_217282 ) ( CALIBRATION_TARGET ?auto_217293 ?auto_217291 ) ( not ( = ?auto_217291 ?auto_217286 ) ) ( ON_BOARD ?auto_217296 ?auto_217295 ) ( not ( = ?auto_217293 ?auto_217296 ) ) ( SUPPORTS ?auto_217296 ?auto_217287 ) ( CALIBRATION_TARGET ?auto_217296 ?auto_217291 ) ( POWER_AVAIL ?auto_217295 ) ( POINTING ?auto_217295 ?auto_217292 ) ( not ( = ?auto_217291 ?auto_217292 ) ) ( not ( = ?auto_217286 ?auto_217292 ) ) ( not ( = ?auto_217287 ?auto_217282 ) ) ( not ( = ?auto_217283 ?auto_217292 ) ) ( not ( = ?auto_217287 ?auto_217285 ) ) ( not ( = ?auto_217282 ?auto_217285 ) ) ( not ( = ?auto_217284 ?auto_217292 ) ) ( not ( = ?auto_217294 ?auto_217296 ) ) ( not ( = ?auto_217287 ?auto_217281 ) ) ( not ( = ?auto_217282 ?auto_217281 ) ) ( not ( = ?auto_217285 ?auto_217281 ) ) ( not ( = ?auto_217280 ?auto_217292 ) ) ( not ( = ?auto_217297 ?auto_217293 ) ) ( not ( = ?auto_217297 ?auto_217296 ) ) ( not ( = ?auto_217287 ?auto_217289 ) ) ( not ( = ?auto_217282 ?auto_217289 ) ) ( not ( = ?auto_217285 ?auto_217289 ) ) ( not ( = ?auto_217281 ?auto_217289 ) ) ( not ( = ?auto_217288 ?auto_217292 ) ) ( not ( = ?auto_217290 ?auto_217294 ) ) ( not ( = ?auto_217290 ?auto_217293 ) ) ( not ( = ?auto_217290 ?auto_217296 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_217286 ?auto_217287 ?auto_217283 ?auto_217282 ?auto_217284 ?auto_217285 ?auto_217288 ?auto_217289 ?auto_217280 ?auto_217281 )
      ( GET-5IMAGE-VERIFY ?auto_217280 ?auto_217281 ?auto_217283 ?auto_217282 ?auto_217284 ?auto_217285 ?auto_217286 ?auto_217287 ?auto_217288 ?auto_217289 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_217358 - DIRECTION
      ?auto_217359 - MODE
      ?auto_217361 - DIRECTION
      ?auto_217360 - MODE
      ?auto_217362 - DIRECTION
      ?auto_217363 - MODE
      ?auto_217364 - DIRECTION
      ?auto_217365 - MODE
      ?auto_217366 - DIRECTION
      ?auto_217367 - MODE
    )
    :vars
    (
      ?auto_217368 - INSTRUMENT
      ?auto_217373 - SATELLITE
      ?auto_217369 - DIRECTION
      ?auto_217375 - INSTRUMENT
      ?auto_217372 - INSTRUMENT
      ?auto_217371 - INSTRUMENT
      ?auto_217374 - INSTRUMENT
      ?auto_217370 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_217361 ?auto_217358 ) ) ( not ( = ?auto_217362 ?auto_217358 ) ) ( not ( = ?auto_217362 ?auto_217361 ) ) ( not ( = ?auto_217364 ?auto_217358 ) ) ( not ( = ?auto_217364 ?auto_217361 ) ) ( not ( = ?auto_217364 ?auto_217362 ) ) ( not ( = ?auto_217366 ?auto_217358 ) ) ( not ( = ?auto_217366 ?auto_217361 ) ) ( not ( = ?auto_217366 ?auto_217362 ) ) ( not ( = ?auto_217366 ?auto_217364 ) ) ( ON_BOARD ?auto_217368 ?auto_217373 ) ( SUPPORTS ?auto_217368 ?auto_217365 ) ( not ( = ?auto_217364 ?auto_217369 ) ) ( CALIBRATION_TARGET ?auto_217368 ?auto_217369 ) ( not ( = ?auto_217369 ?auto_217358 ) ) ( ON_BOARD ?auto_217375 ?auto_217373 ) ( not ( = ?auto_217368 ?auto_217375 ) ) ( SUPPORTS ?auto_217375 ?auto_217359 ) ( CALIBRATION_TARGET ?auto_217375 ?auto_217369 ) ( not ( = ?auto_217369 ?auto_217362 ) ) ( ON_BOARD ?auto_217372 ?auto_217373 ) ( not ( = ?auto_217375 ?auto_217372 ) ) ( SUPPORTS ?auto_217372 ?auto_217363 ) ( CALIBRATION_TARGET ?auto_217372 ?auto_217369 ) ( not ( = ?auto_217369 ?auto_217361 ) ) ( ON_BOARD ?auto_217371 ?auto_217373 ) ( not ( = ?auto_217372 ?auto_217371 ) ) ( SUPPORTS ?auto_217371 ?auto_217360 ) ( CALIBRATION_TARGET ?auto_217371 ?auto_217369 ) ( not ( = ?auto_217369 ?auto_217366 ) ) ( ON_BOARD ?auto_217374 ?auto_217373 ) ( not ( = ?auto_217371 ?auto_217374 ) ) ( SUPPORTS ?auto_217374 ?auto_217367 ) ( CALIBRATION_TARGET ?auto_217374 ?auto_217369 ) ( POWER_AVAIL ?auto_217373 ) ( POINTING ?auto_217373 ?auto_217370 ) ( not ( = ?auto_217369 ?auto_217370 ) ) ( not ( = ?auto_217366 ?auto_217370 ) ) ( not ( = ?auto_217367 ?auto_217360 ) ) ( not ( = ?auto_217361 ?auto_217370 ) ) ( not ( = ?auto_217367 ?auto_217363 ) ) ( not ( = ?auto_217360 ?auto_217363 ) ) ( not ( = ?auto_217362 ?auto_217370 ) ) ( not ( = ?auto_217372 ?auto_217374 ) ) ( not ( = ?auto_217367 ?auto_217359 ) ) ( not ( = ?auto_217360 ?auto_217359 ) ) ( not ( = ?auto_217363 ?auto_217359 ) ) ( not ( = ?auto_217358 ?auto_217370 ) ) ( not ( = ?auto_217375 ?auto_217371 ) ) ( not ( = ?auto_217375 ?auto_217374 ) ) ( not ( = ?auto_217367 ?auto_217365 ) ) ( not ( = ?auto_217360 ?auto_217365 ) ) ( not ( = ?auto_217363 ?auto_217365 ) ) ( not ( = ?auto_217359 ?auto_217365 ) ) ( not ( = ?auto_217364 ?auto_217370 ) ) ( not ( = ?auto_217368 ?auto_217372 ) ) ( not ( = ?auto_217368 ?auto_217371 ) ) ( not ( = ?auto_217368 ?auto_217374 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_217366 ?auto_217367 ?auto_217361 ?auto_217360 ?auto_217362 ?auto_217363 ?auto_217364 ?auto_217365 ?auto_217358 ?auto_217359 )
      ( GET-5IMAGE-VERIFY ?auto_217358 ?auto_217359 ?auto_217361 ?auto_217360 ?auto_217362 ?auto_217363 ?auto_217364 ?auto_217365 ?auto_217366 ?auto_217367 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_217686 - DIRECTION
      ?auto_217687 - MODE
      ?auto_217689 - DIRECTION
      ?auto_217688 - MODE
      ?auto_217690 - DIRECTION
      ?auto_217691 - MODE
      ?auto_217692 - DIRECTION
      ?auto_217693 - MODE
      ?auto_217694 - DIRECTION
      ?auto_217695 - MODE
    )
    :vars
    (
      ?auto_217696 - INSTRUMENT
      ?auto_217701 - SATELLITE
      ?auto_217697 - DIRECTION
      ?auto_217703 - INSTRUMENT
      ?auto_217700 - INSTRUMENT
      ?auto_217699 - INSTRUMENT
      ?auto_217702 - INSTRUMENT
      ?auto_217698 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_217689 ?auto_217686 ) ) ( not ( = ?auto_217690 ?auto_217686 ) ) ( not ( = ?auto_217690 ?auto_217689 ) ) ( not ( = ?auto_217692 ?auto_217686 ) ) ( not ( = ?auto_217692 ?auto_217689 ) ) ( not ( = ?auto_217692 ?auto_217690 ) ) ( not ( = ?auto_217694 ?auto_217686 ) ) ( not ( = ?auto_217694 ?auto_217689 ) ) ( not ( = ?auto_217694 ?auto_217690 ) ) ( not ( = ?auto_217694 ?auto_217692 ) ) ( ON_BOARD ?auto_217696 ?auto_217701 ) ( SUPPORTS ?auto_217696 ?auto_217691 ) ( not ( = ?auto_217690 ?auto_217697 ) ) ( CALIBRATION_TARGET ?auto_217696 ?auto_217697 ) ( not ( = ?auto_217697 ?auto_217686 ) ) ( ON_BOARD ?auto_217703 ?auto_217701 ) ( not ( = ?auto_217696 ?auto_217703 ) ) ( SUPPORTS ?auto_217703 ?auto_217687 ) ( CALIBRATION_TARGET ?auto_217703 ?auto_217697 ) ( not ( = ?auto_217697 ?auto_217694 ) ) ( ON_BOARD ?auto_217700 ?auto_217701 ) ( not ( = ?auto_217703 ?auto_217700 ) ) ( SUPPORTS ?auto_217700 ?auto_217695 ) ( CALIBRATION_TARGET ?auto_217700 ?auto_217697 ) ( not ( = ?auto_217697 ?auto_217689 ) ) ( ON_BOARD ?auto_217699 ?auto_217701 ) ( not ( = ?auto_217700 ?auto_217699 ) ) ( SUPPORTS ?auto_217699 ?auto_217688 ) ( CALIBRATION_TARGET ?auto_217699 ?auto_217697 ) ( not ( = ?auto_217697 ?auto_217692 ) ) ( ON_BOARD ?auto_217702 ?auto_217701 ) ( not ( = ?auto_217699 ?auto_217702 ) ) ( SUPPORTS ?auto_217702 ?auto_217693 ) ( CALIBRATION_TARGET ?auto_217702 ?auto_217697 ) ( POWER_AVAIL ?auto_217701 ) ( POINTING ?auto_217701 ?auto_217698 ) ( not ( = ?auto_217697 ?auto_217698 ) ) ( not ( = ?auto_217692 ?auto_217698 ) ) ( not ( = ?auto_217693 ?auto_217688 ) ) ( not ( = ?auto_217689 ?auto_217698 ) ) ( not ( = ?auto_217693 ?auto_217695 ) ) ( not ( = ?auto_217688 ?auto_217695 ) ) ( not ( = ?auto_217694 ?auto_217698 ) ) ( not ( = ?auto_217700 ?auto_217702 ) ) ( not ( = ?auto_217693 ?auto_217687 ) ) ( not ( = ?auto_217688 ?auto_217687 ) ) ( not ( = ?auto_217695 ?auto_217687 ) ) ( not ( = ?auto_217686 ?auto_217698 ) ) ( not ( = ?auto_217703 ?auto_217699 ) ) ( not ( = ?auto_217703 ?auto_217702 ) ) ( not ( = ?auto_217693 ?auto_217691 ) ) ( not ( = ?auto_217688 ?auto_217691 ) ) ( not ( = ?auto_217695 ?auto_217691 ) ) ( not ( = ?auto_217687 ?auto_217691 ) ) ( not ( = ?auto_217690 ?auto_217698 ) ) ( not ( = ?auto_217696 ?auto_217700 ) ) ( not ( = ?auto_217696 ?auto_217699 ) ) ( not ( = ?auto_217696 ?auto_217702 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_217692 ?auto_217693 ?auto_217689 ?auto_217688 ?auto_217694 ?auto_217695 ?auto_217690 ?auto_217691 ?auto_217686 ?auto_217687 )
      ( GET-5IMAGE-VERIFY ?auto_217686 ?auto_217687 ?auto_217689 ?auto_217688 ?auto_217690 ?auto_217691 ?auto_217692 ?auto_217693 ?auto_217694 ?auto_217695 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_217850 - DIRECTION
      ?auto_217851 - MODE
      ?auto_217853 - DIRECTION
      ?auto_217852 - MODE
      ?auto_217854 - DIRECTION
      ?auto_217855 - MODE
      ?auto_217856 - DIRECTION
      ?auto_217857 - MODE
      ?auto_217858 - DIRECTION
      ?auto_217859 - MODE
    )
    :vars
    (
      ?auto_217860 - INSTRUMENT
      ?auto_217865 - SATELLITE
      ?auto_217861 - DIRECTION
      ?auto_217867 - INSTRUMENT
      ?auto_217864 - INSTRUMENT
      ?auto_217863 - INSTRUMENT
      ?auto_217866 - INSTRUMENT
      ?auto_217862 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_217853 ?auto_217850 ) ) ( not ( = ?auto_217854 ?auto_217850 ) ) ( not ( = ?auto_217854 ?auto_217853 ) ) ( not ( = ?auto_217856 ?auto_217850 ) ) ( not ( = ?auto_217856 ?auto_217853 ) ) ( not ( = ?auto_217856 ?auto_217854 ) ) ( not ( = ?auto_217858 ?auto_217850 ) ) ( not ( = ?auto_217858 ?auto_217853 ) ) ( not ( = ?auto_217858 ?auto_217854 ) ) ( not ( = ?auto_217858 ?auto_217856 ) ) ( ON_BOARD ?auto_217860 ?auto_217865 ) ( SUPPORTS ?auto_217860 ?auto_217855 ) ( not ( = ?auto_217854 ?auto_217861 ) ) ( CALIBRATION_TARGET ?auto_217860 ?auto_217861 ) ( not ( = ?auto_217861 ?auto_217850 ) ) ( ON_BOARD ?auto_217867 ?auto_217865 ) ( not ( = ?auto_217860 ?auto_217867 ) ) ( SUPPORTS ?auto_217867 ?auto_217851 ) ( CALIBRATION_TARGET ?auto_217867 ?auto_217861 ) ( not ( = ?auto_217861 ?auto_217856 ) ) ( ON_BOARD ?auto_217864 ?auto_217865 ) ( not ( = ?auto_217867 ?auto_217864 ) ) ( SUPPORTS ?auto_217864 ?auto_217857 ) ( CALIBRATION_TARGET ?auto_217864 ?auto_217861 ) ( not ( = ?auto_217861 ?auto_217853 ) ) ( ON_BOARD ?auto_217863 ?auto_217865 ) ( not ( = ?auto_217864 ?auto_217863 ) ) ( SUPPORTS ?auto_217863 ?auto_217852 ) ( CALIBRATION_TARGET ?auto_217863 ?auto_217861 ) ( not ( = ?auto_217861 ?auto_217858 ) ) ( ON_BOARD ?auto_217866 ?auto_217865 ) ( not ( = ?auto_217863 ?auto_217866 ) ) ( SUPPORTS ?auto_217866 ?auto_217859 ) ( CALIBRATION_TARGET ?auto_217866 ?auto_217861 ) ( POWER_AVAIL ?auto_217865 ) ( POINTING ?auto_217865 ?auto_217862 ) ( not ( = ?auto_217861 ?auto_217862 ) ) ( not ( = ?auto_217858 ?auto_217862 ) ) ( not ( = ?auto_217859 ?auto_217852 ) ) ( not ( = ?auto_217853 ?auto_217862 ) ) ( not ( = ?auto_217859 ?auto_217857 ) ) ( not ( = ?auto_217852 ?auto_217857 ) ) ( not ( = ?auto_217856 ?auto_217862 ) ) ( not ( = ?auto_217864 ?auto_217866 ) ) ( not ( = ?auto_217859 ?auto_217851 ) ) ( not ( = ?auto_217852 ?auto_217851 ) ) ( not ( = ?auto_217857 ?auto_217851 ) ) ( not ( = ?auto_217850 ?auto_217862 ) ) ( not ( = ?auto_217867 ?auto_217863 ) ) ( not ( = ?auto_217867 ?auto_217866 ) ) ( not ( = ?auto_217859 ?auto_217855 ) ) ( not ( = ?auto_217852 ?auto_217855 ) ) ( not ( = ?auto_217857 ?auto_217855 ) ) ( not ( = ?auto_217851 ?auto_217855 ) ) ( not ( = ?auto_217854 ?auto_217862 ) ) ( not ( = ?auto_217860 ?auto_217864 ) ) ( not ( = ?auto_217860 ?auto_217863 ) ) ( not ( = ?auto_217860 ?auto_217866 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_217858 ?auto_217859 ?auto_217853 ?auto_217852 ?auto_217856 ?auto_217857 ?auto_217854 ?auto_217855 ?auto_217850 ?auto_217851 )
      ( GET-5IMAGE-VERIFY ?auto_217850 ?auto_217851 ?auto_217853 ?auto_217852 ?auto_217854 ?auto_217855 ?auto_217856 ?auto_217857 ?auto_217858 ?auto_217859 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_218180 - DIRECTION
      ?auto_218181 - MODE
      ?auto_218183 - DIRECTION
      ?auto_218182 - MODE
      ?auto_218184 - DIRECTION
      ?auto_218185 - MODE
      ?auto_218186 - DIRECTION
      ?auto_218187 - MODE
      ?auto_218188 - DIRECTION
      ?auto_218189 - MODE
    )
    :vars
    (
      ?auto_218190 - INSTRUMENT
      ?auto_218195 - SATELLITE
      ?auto_218191 - DIRECTION
      ?auto_218197 - INSTRUMENT
      ?auto_218194 - INSTRUMENT
      ?auto_218193 - INSTRUMENT
      ?auto_218196 - INSTRUMENT
      ?auto_218192 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_218183 ?auto_218180 ) ) ( not ( = ?auto_218184 ?auto_218180 ) ) ( not ( = ?auto_218184 ?auto_218183 ) ) ( not ( = ?auto_218186 ?auto_218180 ) ) ( not ( = ?auto_218186 ?auto_218183 ) ) ( not ( = ?auto_218186 ?auto_218184 ) ) ( not ( = ?auto_218188 ?auto_218180 ) ) ( not ( = ?auto_218188 ?auto_218183 ) ) ( not ( = ?auto_218188 ?auto_218184 ) ) ( not ( = ?auto_218188 ?auto_218186 ) ) ( ON_BOARD ?auto_218190 ?auto_218195 ) ( SUPPORTS ?auto_218190 ?auto_218189 ) ( not ( = ?auto_218188 ?auto_218191 ) ) ( CALIBRATION_TARGET ?auto_218190 ?auto_218191 ) ( not ( = ?auto_218191 ?auto_218180 ) ) ( ON_BOARD ?auto_218197 ?auto_218195 ) ( not ( = ?auto_218190 ?auto_218197 ) ) ( SUPPORTS ?auto_218197 ?auto_218181 ) ( CALIBRATION_TARGET ?auto_218197 ?auto_218191 ) ( not ( = ?auto_218191 ?auto_218183 ) ) ( ON_BOARD ?auto_218194 ?auto_218195 ) ( not ( = ?auto_218197 ?auto_218194 ) ) ( SUPPORTS ?auto_218194 ?auto_218182 ) ( CALIBRATION_TARGET ?auto_218194 ?auto_218191 ) ( not ( = ?auto_218191 ?auto_218186 ) ) ( ON_BOARD ?auto_218193 ?auto_218195 ) ( not ( = ?auto_218194 ?auto_218193 ) ) ( SUPPORTS ?auto_218193 ?auto_218187 ) ( CALIBRATION_TARGET ?auto_218193 ?auto_218191 ) ( not ( = ?auto_218191 ?auto_218184 ) ) ( ON_BOARD ?auto_218196 ?auto_218195 ) ( not ( = ?auto_218193 ?auto_218196 ) ) ( SUPPORTS ?auto_218196 ?auto_218185 ) ( CALIBRATION_TARGET ?auto_218196 ?auto_218191 ) ( POWER_AVAIL ?auto_218195 ) ( POINTING ?auto_218195 ?auto_218192 ) ( not ( = ?auto_218191 ?auto_218192 ) ) ( not ( = ?auto_218184 ?auto_218192 ) ) ( not ( = ?auto_218185 ?auto_218187 ) ) ( not ( = ?auto_218186 ?auto_218192 ) ) ( not ( = ?auto_218185 ?auto_218182 ) ) ( not ( = ?auto_218187 ?auto_218182 ) ) ( not ( = ?auto_218183 ?auto_218192 ) ) ( not ( = ?auto_218194 ?auto_218196 ) ) ( not ( = ?auto_218185 ?auto_218181 ) ) ( not ( = ?auto_218187 ?auto_218181 ) ) ( not ( = ?auto_218182 ?auto_218181 ) ) ( not ( = ?auto_218180 ?auto_218192 ) ) ( not ( = ?auto_218197 ?auto_218193 ) ) ( not ( = ?auto_218197 ?auto_218196 ) ) ( not ( = ?auto_218185 ?auto_218189 ) ) ( not ( = ?auto_218187 ?auto_218189 ) ) ( not ( = ?auto_218182 ?auto_218189 ) ) ( not ( = ?auto_218181 ?auto_218189 ) ) ( not ( = ?auto_218188 ?auto_218192 ) ) ( not ( = ?auto_218190 ?auto_218194 ) ) ( not ( = ?auto_218190 ?auto_218193 ) ) ( not ( = ?auto_218190 ?auto_218196 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_218184 ?auto_218185 ?auto_218186 ?auto_218187 ?auto_218183 ?auto_218182 ?auto_218188 ?auto_218189 ?auto_218180 ?auto_218181 )
      ( GET-5IMAGE-VERIFY ?auto_218180 ?auto_218181 ?auto_218183 ?auto_218182 ?auto_218184 ?auto_218185 ?auto_218186 ?auto_218187 ?auto_218188 ?auto_218189 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_218258 - DIRECTION
      ?auto_218259 - MODE
      ?auto_218261 - DIRECTION
      ?auto_218260 - MODE
      ?auto_218262 - DIRECTION
      ?auto_218263 - MODE
      ?auto_218264 - DIRECTION
      ?auto_218265 - MODE
      ?auto_218266 - DIRECTION
      ?auto_218267 - MODE
    )
    :vars
    (
      ?auto_218268 - INSTRUMENT
      ?auto_218273 - SATELLITE
      ?auto_218269 - DIRECTION
      ?auto_218275 - INSTRUMENT
      ?auto_218272 - INSTRUMENT
      ?auto_218271 - INSTRUMENT
      ?auto_218274 - INSTRUMENT
      ?auto_218270 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_218261 ?auto_218258 ) ) ( not ( = ?auto_218262 ?auto_218258 ) ) ( not ( = ?auto_218262 ?auto_218261 ) ) ( not ( = ?auto_218264 ?auto_218258 ) ) ( not ( = ?auto_218264 ?auto_218261 ) ) ( not ( = ?auto_218264 ?auto_218262 ) ) ( not ( = ?auto_218266 ?auto_218258 ) ) ( not ( = ?auto_218266 ?auto_218261 ) ) ( not ( = ?auto_218266 ?auto_218262 ) ) ( not ( = ?auto_218266 ?auto_218264 ) ) ( ON_BOARD ?auto_218268 ?auto_218273 ) ( SUPPORTS ?auto_218268 ?auto_218265 ) ( not ( = ?auto_218264 ?auto_218269 ) ) ( CALIBRATION_TARGET ?auto_218268 ?auto_218269 ) ( not ( = ?auto_218269 ?auto_218258 ) ) ( ON_BOARD ?auto_218275 ?auto_218273 ) ( not ( = ?auto_218268 ?auto_218275 ) ) ( SUPPORTS ?auto_218275 ?auto_218259 ) ( CALIBRATION_TARGET ?auto_218275 ?auto_218269 ) ( not ( = ?auto_218269 ?auto_218261 ) ) ( ON_BOARD ?auto_218272 ?auto_218273 ) ( not ( = ?auto_218275 ?auto_218272 ) ) ( SUPPORTS ?auto_218272 ?auto_218260 ) ( CALIBRATION_TARGET ?auto_218272 ?auto_218269 ) ( not ( = ?auto_218269 ?auto_218266 ) ) ( ON_BOARD ?auto_218271 ?auto_218273 ) ( not ( = ?auto_218272 ?auto_218271 ) ) ( SUPPORTS ?auto_218271 ?auto_218267 ) ( CALIBRATION_TARGET ?auto_218271 ?auto_218269 ) ( not ( = ?auto_218269 ?auto_218262 ) ) ( ON_BOARD ?auto_218274 ?auto_218273 ) ( not ( = ?auto_218271 ?auto_218274 ) ) ( SUPPORTS ?auto_218274 ?auto_218263 ) ( CALIBRATION_TARGET ?auto_218274 ?auto_218269 ) ( POWER_AVAIL ?auto_218273 ) ( POINTING ?auto_218273 ?auto_218270 ) ( not ( = ?auto_218269 ?auto_218270 ) ) ( not ( = ?auto_218262 ?auto_218270 ) ) ( not ( = ?auto_218263 ?auto_218267 ) ) ( not ( = ?auto_218266 ?auto_218270 ) ) ( not ( = ?auto_218263 ?auto_218260 ) ) ( not ( = ?auto_218267 ?auto_218260 ) ) ( not ( = ?auto_218261 ?auto_218270 ) ) ( not ( = ?auto_218272 ?auto_218274 ) ) ( not ( = ?auto_218263 ?auto_218259 ) ) ( not ( = ?auto_218267 ?auto_218259 ) ) ( not ( = ?auto_218260 ?auto_218259 ) ) ( not ( = ?auto_218258 ?auto_218270 ) ) ( not ( = ?auto_218275 ?auto_218271 ) ) ( not ( = ?auto_218275 ?auto_218274 ) ) ( not ( = ?auto_218263 ?auto_218265 ) ) ( not ( = ?auto_218267 ?auto_218265 ) ) ( not ( = ?auto_218260 ?auto_218265 ) ) ( not ( = ?auto_218259 ?auto_218265 ) ) ( not ( = ?auto_218264 ?auto_218270 ) ) ( not ( = ?auto_218268 ?auto_218272 ) ) ( not ( = ?auto_218268 ?auto_218271 ) ) ( not ( = ?auto_218268 ?auto_218274 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_218262 ?auto_218263 ?auto_218266 ?auto_218267 ?auto_218261 ?auto_218260 ?auto_218264 ?auto_218265 ?auto_218258 ?auto_218259 )
      ( GET-5IMAGE-VERIFY ?auto_218258 ?auto_218259 ?auto_218261 ?auto_218260 ?auto_218262 ?auto_218263 ?auto_218264 ?auto_218265 ?auto_218266 ?auto_218267 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_218336 - DIRECTION
      ?auto_218337 - MODE
      ?auto_218339 - DIRECTION
      ?auto_218338 - MODE
      ?auto_218340 - DIRECTION
      ?auto_218341 - MODE
      ?auto_218342 - DIRECTION
      ?auto_218343 - MODE
      ?auto_218344 - DIRECTION
      ?auto_218345 - MODE
    )
    :vars
    (
      ?auto_218346 - INSTRUMENT
      ?auto_218351 - SATELLITE
      ?auto_218347 - DIRECTION
      ?auto_218353 - INSTRUMENT
      ?auto_218350 - INSTRUMENT
      ?auto_218349 - INSTRUMENT
      ?auto_218352 - INSTRUMENT
      ?auto_218348 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_218339 ?auto_218336 ) ) ( not ( = ?auto_218340 ?auto_218336 ) ) ( not ( = ?auto_218340 ?auto_218339 ) ) ( not ( = ?auto_218342 ?auto_218336 ) ) ( not ( = ?auto_218342 ?auto_218339 ) ) ( not ( = ?auto_218342 ?auto_218340 ) ) ( not ( = ?auto_218344 ?auto_218336 ) ) ( not ( = ?auto_218344 ?auto_218339 ) ) ( not ( = ?auto_218344 ?auto_218340 ) ) ( not ( = ?auto_218344 ?auto_218342 ) ) ( ON_BOARD ?auto_218346 ?auto_218351 ) ( SUPPORTS ?auto_218346 ?auto_218345 ) ( not ( = ?auto_218344 ?auto_218347 ) ) ( CALIBRATION_TARGET ?auto_218346 ?auto_218347 ) ( not ( = ?auto_218347 ?auto_218336 ) ) ( ON_BOARD ?auto_218353 ?auto_218351 ) ( not ( = ?auto_218346 ?auto_218353 ) ) ( SUPPORTS ?auto_218353 ?auto_218337 ) ( CALIBRATION_TARGET ?auto_218353 ?auto_218347 ) ( not ( = ?auto_218347 ?auto_218339 ) ) ( ON_BOARD ?auto_218350 ?auto_218351 ) ( not ( = ?auto_218353 ?auto_218350 ) ) ( SUPPORTS ?auto_218350 ?auto_218338 ) ( CALIBRATION_TARGET ?auto_218350 ?auto_218347 ) ( not ( = ?auto_218347 ?auto_218340 ) ) ( ON_BOARD ?auto_218349 ?auto_218351 ) ( not ( = ?auto_218350 ?auto_218349 ) ) ( SUPPORTS ?auto_218349 ?auto_218341 ) ( CALIBRATION_TARGET ?auto_218349 ?auto_218347 ) ( not ( = ?auto_218347 ?auto_218342 ) ) ( ON_BOARD ?auto_218352 ?auto_218351 ) ( not ( = ?auto_218349 ?auto_218352 ) ) ( SUPPORTS ?auto_218352 ?auto_218343 ) ( CALIBRATION_TARGET ?auto_218352 ?auto_218347 ) ( POWER_AVAIL ?auto_218351 ) ( POINTING ?auto_218351 ?auto_218348 ) ( not ( = ?auto_218347 ?auto_218348 ) ) ( not ( = ?auto_218342 ?auto_218348 ) ) ( not ( = ?auto_218343 ?auto_218341 ) ) ( not ( = ?auto_218340 ?auto_218348 ) ) ( not ( = ?auto_218343 ?auto_218338 ) ) ( not ( = ?auto_218341 ?auto_218338 ) ) ( not ( = ?auto_218339 ?auto_218348 ) ) ( not ( = ?auto_218350 ?auto_218352 ) ) ( not ( = ?auto_218343 ?auto_218337 ) ) ( not ( = ?auto_218341 ?auto_218337 ) ) ( not ( = ?auto_218338 ?auto_218337 ) ) ( not ( = ?auto_218336 ?auto_218348 ) ) ( not ( = ?auto_218353 ?auto_218349 ) ) ( not ( = ?auto_218353 ?auto_218352 ) ) ( not ( = ?auto_218343 ?auto_218345 ) ) ( not ( = ?auto_218341 ?auto_218345 ) ) ( not ( = ?auto_218338 ?auto_218345 ) ) ( not ( = ?auto_218337 ?auto_218345 ) ) ( not ( = ?auto_218344 ?auto_218348 ) ) ( not ( = ?auto_218346 ?auto_218350 ) ) ( not ( = ?auto_218346 ?auto_218349 ) ) ( not ( = ?auto_218346 ?auto_218352 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_218342 ?auto_218343 ?auto_218340 ?auto_218341 ?auto_218339 ?auto_218338 ?auto_218344 ?auto_218345 ?auto_218336 ?auto_218337 )
      ( GET-5IMAGE-VERIFY ?auto_218336 ?auto_218337 ?auto_218339 ?auto_218338 ?auto_218340 ?auto_218341 ?auto_218342 ?auto_218343 ?auto_218344 ?auto_218345 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_218414 - DIRECTION
      ?auto_218415 - MODE
      ?auto_218417 - DIRECTION
      ?auto_218416 - MODE
      ?auto_218418 - DIRECTION
      ?auto_218419 - MODE
      ?auto_218420 - DIRECTION
      ?auto_218421 - MODE
      ?auto_218422 - DIRECTION
      ?auto_218423 - MODE
    )
    :vars
    (
      ?auto_218424 - INSTRUMENT
      ?auto_218429 - SATELLITE
      ?auto_218425 - DIRECTION
      ?auto_218431 - INSTRUMENT
      ?auto_218428 - INSTRUMENT
      ?auto_218427 - INSTRUMENT
      ?auto_218430 - INSTRUMENT
      ?auto_218426 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_218417 ?auto_218414 ) ) ( not ( = ?auto_218418 ?auto_218414 ) ) ( not ( = ?auto_218418 ?auto_218417 ) ) ( not ( = ?auto_218420 ?auto_218414 ) ) ( not ( = ?auto_218420 ?auto_218417 ) ) ( not ( = ?auto_218420 ?auto_218418 ) ) ( not ( = ?auto_218422 ?auto_218414 ) ) ( not ( = ?auto_218422 ?auto_218417 ) ) ( not ( = ?auto_218422 ?auto_218418 ) ) ( not ( = ?auto_218422 ?auto_218420 ) ) ( ON_BOARD ?auto_218424 ?auto_218429 ) ( SUPPORTS ?auto_218424 ?auto_218421 ) ( not ( = ?auto_218420 ?auto_218425 ) ) ( CALIBRATION_TARGET ?auto_218424 ?auto_218425 ) ( not ( = ?auto_218425 ?auto_218414 ) ) ( ON_BOARD ?auto_218431 ?auto_218429 ) ( not ( = ?auto_218424 ?auto_218431 ) ) ( SUPPORTS ?auto_218431 ?auto_218415 ) ( CALIBRATION_TARGET ?auto_218431 ?auto_218425 ) ( not ( = ?auto_218425 ?auto_218417 ) ) ( ON_BOARD ?auto_218428 ?auto_218429 ) ( not ( = ?auto_218431 ?auto_218428 ) ) ( SUPPORTS ?auto_218428 ?auto_218416 ) ( CALIBRATION_TARGET ?auto_218428 ?auto_218425 ) ( not ( = ?auto_218425 ?auto_218418 ) ) ( ON_BOARD ?auto_218427 ?auto_218429 ) ( not ( = ?auto_218428 ?auto_218427 ) ) ( SUPPORTS ?auto_218427 ?auto_218419 ) ( CALIBRATION_TARGET ?auto_218427 ?auto_218425 ) ( not ( = ?auto_218425 ?auto_218422 ) ) ( ON_BOARD ?auto_218430 ?auto_218429 ) ( not ( = ?auto_218427 ?auto_218430 ) ) ( SUPPORTS ?auto_218430 ?auto_218423 ) ( CALIBRATION_TARGET ?auto_218430 ?auto_218425 ) ( POWER_AVAIL ?auto_218429 ) ( POINTING ?auto_218429 ?auto_218426 ) ( not ( = ?auto_218425 ?auto_218426 ) ) ( not ( = ?auto_218422 ?auto_218426 ) ) ( not ( = ?auto_218423 ?auto_218419 ) ) ( not ( = ?auto_218418 ?auto_218426 ) ) ( not ( = ?auto_218423 ?auto_218416 ) ) ( not ( = ?auto_218419 ?auto_218416 ) ) ( not ( = ?auto_218417 ?auto_218426 ) ) ( not ( = ?auto_218428 ?auto_218430 ) ) ( not ( = ?auto_218423 ?auto_218415 ) ) ( not ( = ?auto_218419 ?auto_218415 ) ) ( not ( = ?auto_218416 ?auto_218415 ) ) ( not ( = ?auto_218414 ?auto_218426 ) ) ( not ( = ?auto_218431 ?auto_218427 ) ) ( not ( = ?auto_218431 ?auto_218430 ) ) ( not ( = ?auto_218423 ?auto_218421 ) ) ( not ( = ?auto_218419 ?auto_218421 ) ) ( not ( = ?auto_218416 ?auto_218421 ) ) ( not ( = ?auto_218415 ?auto_218421 ) ) ( not ( = ?auto_218420 ?auto_218426 ) ) ( not ( = ?auto_218424 ?auto_218428 ) ) ( not ( = ?auto_218424 ?auto_218427 ) ) ( not ( = ?auto_218424 ?auto_218430 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_218422 ?auto_218423 ?auto_218418 ?auto_218419 ?auto_218417 ?auto_218416 ?auto_218420 ?auto_218421 ?auto_218414 ?auto_218415 )
      ( GET-5IMAGE-VERIFY ?auto_218414 ?auto_218415 ?auto_218417 ?auto_218416 ?auto_218418 ?auto_218419 ?auto_218420 ?auto_218421 ?auto_218422 ?auto_218423 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_218912 - DIRECTION
      ?auto_218913 - MODE
      ?auto_218915 - DIRECTION
      ?auto_218914 - MODE
      ?auto_218916 - DIRECTION
      ?auto_218917 - MODE
      ?auto_218918 - DIRECTION
      ?auto_218919 - MODE
      ?auto_218920 - DIRECTION
      ?auto_218921 - MODE
    )
    :vars
    (
      ?auto_218922 - INSTRUMENT
      ?auto_218927 - SATELLITE
      ?auto_218923 - DIRECTION
      ?auto_218929 - INSTRUMENT
      ?auto_218926 - INSTRUMENT
      ?auto_218925 - INSTRUMENT
      ?auto_218928 - INSTRUMENT
      ?auto_218924 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_218915 ?auto_218912 ) ) ( not ( = ?auto_218916 ?auto_218912 ) ) ( not ( = ?auto_218916 ?auto_218915 ) ) ( not ( = ?auto_218918 ?auto_218912 ) ) ( not ( = ?auto_218918 ?auto_218915 ) ) ( not ( = ?auto_218918 ?auto_218916 ) ) ( not ( = ?auto_218920 ?auto_218912 ) ) ( not ( = ?auto_218920 ?auto_218915 ) ) ( not ( = ?auto_218920 ?auto_218916 ) ) ( not ( = ?auto_218920 ?auto_218918 ) ) ( ON_BOARD ?auto_218922 ?auto_218927 ) ( SUPPORTS ?auto_218922 ?auto_218917 ) ( not ( = ?auto_218916 ?auto_218923 ) ) ( CALIBRATION_TARGET ?auto_218922 ?auto_218923 ) ( not ( = ?auto_218923 ?auto_218912 ) ) ( ON_BOARD ?auto_218929 ?auto_218927 ) ( not ( = ?auto_218922 ?auto_218929 ) ) ( SUPPORTS ?auto_218929 ?auto_218913 ) ( CALIBRATION_TARGET ?auto_218929 ?auto_218923 ) ( not ( = ?auto_218923 ?auto_218915 ) ) ( ON_BOARD ?auto_218926 ?auto_218927 ) ( not ( = ?auto_218929 ?auto_218926 ) ) ( SUPPORTS ?auto_218926 ?auto_218914 ) ( CALIBRATION_TARGET ?auto_218926 ?auto_218923 ) ( not ( = ?auto_218923 ?auto_218920 ) ) ( ON_BOARD ?auto_218925 ?auto_218927 ) ( not ( = ?auto_218926 ?auto_218925 ) ) ( SUPPORTS ?auto_218925 ?auto_218921 ) ( CALIBRATION_TARGET ?auto_218925 ?auto_218923 ) ( not ( = ?auto_218923 ?auto_218918 ) ) ( ON_BOARD ?auto_218928 ?auto_218927 ) ( not ( = ?auto_218925 ?auto_218928 ) ) ( SUPPORTS ?auto_218928 ?auto_218919 ) ( CALIBRATION_TARGET ?auto_218928 ?auto_218923 ) ( POWER_AVAIL ?auto_218927 ) ( POINTING ?auto_218927 ?auto_218924 ) ( not ( = ?auto_218923 ?auto_218924 ) ) ( not ( = ?auto_218918 ?auto_218924 ) ) ( not ( = ?auto_218919 ?auto_218921 ) ) ( not ( = ?auto_218920 ?auto_218924 ) ) ( not ( = ?auto_218919 ?auto_218914 ) ) ( not ( = ?auto_218921 ?auto_218914 ) ) ( not ( = ?auto_218915 ?auto_218924 ) ) ( not ( = ?auto_218926 ?auto_218928 ) ) ( not ( = ?auto_218919 ?auto_218913 ) ) ( not ( = ?auto_218921 ?auto_218913 ) ) ( not ( = ?auto_218914 ?auto_218913 ) ) ( not ( = ?auto_218912 ?auto_218924 ) ) ( not ( = ?auto_218929 ?auto_218925 ) ) ( not ( = ?auto_218929 ?auto_218928 ) ) ( not ( = ?auto_218919 ?auto_218917 ) ) ( not ( = ?auto_218921 ?auto_218917 ) ) ( not ( = ?auto_218914 ?auto_218917 ) ) ( not ( = ?auto_218913 ?auto_218917 ) ) ( not ( = ?auto_218916 ?auto_218924 ) ) ( not ( = ?auto_218922 ?auto_218926 ) ) ( not ( = ?auto_218922 ?auto_218925 ) ) ( not ( = ?auto_218922 ?auto_218928 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_218918 ?auto_218919 ?auto_218920 ?auto_218921 ?auto_218915 ?auto_218914 ?auto_218916 ?auto_218917 ?auto_218912 ?auto_218913 )
      ( GET-5IMAGE-VERIFY ?auto_218912 ?auto_218913 ?auto_218915 ?auto_218914 ?auto_218916 ?auto_218917 ?auto_218918 ?auto_218919 ?auto_218920 ?auto_218921 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_218990 - DIRECTION
      ?auto_218991 - MODE
      ?auto_218993 - DIRECTION
      ?auto_218992 - MODE
      ?auto_218994 - DIRECTION
      ?auto_218995 - MODE
      ?auto_218996 - DIRECTION
      ?auto_218997 - MODE
      ?auto_218998 - DIRECTION
      ?auto_218999 - MODE
    )
    :vars
    (
      ?auto_219000 - INSTRUMENT
      ?auto_219005 - SATELLITE
      ?auto_219001 - DIRECTION
      ?auto_219007 - INSTRUMENT
      ?auto_219004 - INSTRUMENT
      ?auto_219003 - INSTRUMENT
      ?auto_219006 - INSTRUMENT
      ?auto_219002 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_218993 ?auto_218990 ) ) ( not ( = ?auto_218994 ?auto_218990 ) ) ( not ( = ?auto_218994 ?auto_218993 ) ) ( not ( = ?auto_218996 ?auto_218990 ) ) ( not ( = ?auto_218996 ?auto_218993 ) ) ( not ( = ?auto_218996 ?auto_218994 ) ) ( not ( = ?auto_218998 ?auto_218990 ) ) ( not ( = ?auto_218998 ?auto_218993 ) ) ( not ( = ?auto_218998 ?auto_218994 ) ) ( not ( = ?auto_218998 ?auto_218996 ) ) ( ON_BOARD ?auto_219000 ?auto_219005 ) ( SUPPORTS ?auto_219000 ?auto_218995 ) ( not ( = ?auto_218994 ?auto_219001 ) ) ( CALIBRATION_TARGET ?auto_219000 ?auto_219001 ) ( not ( = ?auto_219001 ?auto_218990 ) ) ( ON_BOARD ?auto_219007 ?auto_219005 ) ( not ( = ?auto_219000 ?auto_219007 ) ) ( SUPPORTS ?auto_219007 ?auto_218991 ) ( CALIBRATION_TARGET ?auto_219007 ?auto_219001 ) ( not ( = ?auto_219001 ?auto_218993 ) ) ( ON_BOARD ?auto_219004 ?auto_219005 ) ( not ( = ?auto_219007 ?auto_219004 ) ) ( SUPPORTS ?auto_219004 ?auto_218992 ) ( CALIBRATION_TARGET ?auto_219004 ?auto_219001 ) ( not ( = ?auto_219001 ?auto_218996 ) ) ( ON_BOARD ?auto_219003 ?auto_219005 ) ( not ( = ?auto_219004 ?auto_219003 ) ) ( SUPPORTS ?auto_219003 ?auto_218997 ) ( CALIBRATION_TARGET ?auto_219003 ?auto_219001 ) ( not ( = ?auto_219001 ?auto_218998 ) ) ( ON_BOARD ?auto_219006 ?auto_219005 ) ( not ( = ?auto_219003 ?auto_219006 ) ) ( SUPPORTS ?auto_219006 ?auto_218999 ) ( CALIBRATION_TARGET ?auto_219006 ?auto_219001 ) ( POWER_AVAIL ?auto_219005 ) ( POINTING ?auto_219005 ?auto_219002 ) ( not ( = ?auto_219001 ?auto_219002 ) ) ( not ( = ?auto_218998 ?auto_219002 ) ) ( not ( = ?auto_218999 ?auto_218997 ) ) ( not ( = ?auto_218996 ?auto_219002 ) ) ( not ( = ?auto_218999 ?auto_218992 ) ) ( not ( = ?auto_218997 ?auto_218992 ) ) ( not ( = ?auto_218993 ?auto_219002 ) ) ( not ( = ?auto_219004 ?auto_219006 ) ) ( not ( = ?auto_218999 ?auto_218991 ) ) ( not ( = ?auto_218997 ?auto_218991 ) ) ( not ( = ?auto_218992 ?auto_218991 ) ) ( not ( = ?auto_218990 ?auto_219002 ) ) ( not ( = ?auto_219007 ?auto_219003 ) ) ( not ( = ?auto_219007 ?auto_219006 ) ) ( not ( = ?auto_218999 ?auto_218995 ) ) ( not ( = ?auto_218997 ?auto_218995 ) ) ( not ( = ?auto_218992 ?auto_218995 ) ) ( not ( = ?auto_218991 ?auto_218995 ) ) ( not ( = ?auto_218994 ?auto_219002 ) ) ( not ( = ?auto_219000 ?auto_219004 ) ) ( not ( = ?auto_219000 ?auto_219003 ) ) ( not ( = ?auto_219000 ?auto_219006 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_218998 ?auto_218999 ?auto_218996 ?auto_218997 ?auto_218993 ?auto_218992 ?auto_218994 ?auto_218995 ?auto_218990 ?auto_218991 )
      ( GET-5IMAGE-VERIFY ?auto_218990 ?auto_218991 ?auto_218993 ?auto_218992 ?auto_218994 ?auto_218995 ?auto_218996 ?auto_218997 ?auto_218998 ?auto_218999 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_220872 - DIRECTION
      ?auto_220873 - MODE
      ?auto_220875 - DIRECTION
      ?auto_220874 - MODE
      ?auto_220876 - DIRECTION
      ?auto_220877 - MODE
      ?auto_220878 - DIRECTION
      ?auto_220879 - MODE
      ?auto_220880 - DIRECTION
      ?auto_220881 - MODE
    )
    :vars
    (
      ?auto_220882 - INSTRUMENT
      ?auto_220887 - SATELLITE
      ?auto_220883 - DIRECTION
      ?auto_220889 - INSTRUMENT
      ?auto_220886 - INSTRUMENT
      ?auto_220885 - INSTRUMENT
      ?auto_220888 - INSTRUMENT
      ?auto_220884 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_220875 ?auto_220872 ) ) ( not ( = ?auto_220876 ?auto_220872 ) ) ( not ( = ?auto_220876 ?auto_220875 ) ) ( not ( = ?auto_220878 ?auto_220872 ) ) ( not ( = ?auto_220878 ?auto_220875 ) ) ( not ( = ?auto_220878 ?auto_220876 ) ) ( not ( = ?auto_220880 ?auto_220872 ) ) ( not ( = ?auto_220880 ?auto_220875 ) ) ( not ( = ?auto_220880 ?auto_220876 ) ) ( not ( = ?auto_220880 ?auto_220878 ) ) ( ON_BOARD ?auto_220882 ?auto_220887 ) ( SUPPORTS ?auto_220882 ?auto_220874 ) ( not ( = ?auto_220875 ?auto_220883 ) ) ( CALIBRATION_TARGET ?auto_220882 ?auto_220883 ) ( not ( = ?auto_220883 ?auto_220872 ) ) ( ON_BOARD ?auto_220889 ?auto_220887 ) ( not ( = ?auto_220882 ?auto_220889 ) ) ( SUPPORTS ?auto_220889 ?auto_220873 ) ( CALIBRATION_TARGET ?auto_220889 ?auto_220883 ) ( not ( = ?auto_220883 ?auto_220880 ) ) ( ON_BOARD ?auto_220886 ?auto_220887 ) ( not ( = ?auto_220889 ?auto_220886 ) ) ( SUPPORTS ?auto_220886 ?auto_220881 ) ( CALIBRATION_TARGET ?auto_220886 ?auto_220883 ) ( not ( = ?auto_220883 ?auto_220878 ) ) ( ON_BOARD ?auto_220885 ?auto_220887 ) ( not ( = ?auto_220886 ?auto_220885 ) ) ( SUPPORTS ?auto_220885 ?auto_220879 ) ( CALIBRATION_TARGET ?auto_220885 ?auto_220883 ) ( not ( = ?auto_220883 ?auto_220876 ) ) ( ON_BOARD ?auto_220888 ?auto_220887 ) ( not ( = ?auto_220885 ?auto_220888 ) ) ( SUPPORTS ?auto_220888 ?auto_220877 ) ( CALIBRATION_TARGET ?auto_220888 ?auto_220883 ) ( POWER_AVAIL ?auto_220887 ) ( POINTING ?auto_220887 ?auto_220884 ) ( not ( = ?auto_220883 ?auto_220884 ) ) ( not ( = ?auto_220876 ?auto_220884 ) ) ( not ( = ?auto_220877 ?auto_220879 ) ) ( not ( = ?auto_220878 ?auto_220884 ) ) ( not ( = ?auto_220877 ?auto_220881 ) ) ( not ( = ?auto_220879 ?auto_220881 ) ) ( not ( = ?auto_220880 ?auto_220884 ) ) ( not ( = ?auto_220886 ?auto_220888 ) ) ( not ( = ?auto_220877 ?auto_220873 ) ) ( not ( = ?auto_220879 ?auto_220873 ) ) ( not ( = ?auto_220881 ?auto_220873 ) ) ( not ( = ?auto_220872 ?auto_220884 ) ) ( not ( = ?auto_220889 ?auto_220885 ) ) ( not ( = ?auto_220889 ?auto_220888 ) ) ( not ( = ?auto_220877 ?auto_220874 ) ) ( not ( = ?auto_220879 ?auto_220874 ) ) ( not ( = ?auto_220881 ?auto_220874 ) ) ( not ( = ?auto_220873 ?auto_220874 ) ) ( not ( = ?auto_220875 ?auto_220884 ) ) ( not ( = ?auto_220882 ?auto_220886 ) ) ( not ( = ?auto_220882 ?auto_220885 ) ) ( not ( = ?auto_220882 ?auto_220888 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_220876 ?auto_220877 ?auto_220878 ?auto_220879 ?auto_220880 ?auto_220881 ?auto_220875 ?auto_220874 ?auto_220872 ?auto_220873 )
      ( GET-5IMAGE-VERIFY ?auto_220872 ?auto_220873 ?auto_220875 ?auto_220874 ?auto_220876 ?auto_220877 ?auto_220878 ?auto_220879 ?auto_220880 ?auto_220881 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_220950 - DIRECTION
      ?auto_220951 - MODE
      ?auto_220953 - DIRECTION
      ?auto_220952 - MODE
      ?auto_220954 - DIRECTION
      ?auto_220955 - MODE
      ?auto_220956 - DIRECTION
      ?auto_220957 - MODE
      ?auto_220958 - DIRECTION
      ?auto_220959 - MODE
    )
    :vars
    (
      ?auto_220960 - INSTRUMENT
      ?auto_220965 - SATELLITE
      ?auto_220961 - DIRECTION
      ?auto_220967 - INSTRUMENT
      ?auto_220964 - INSTRUMENT
      ?auto_220963 - INSTRUMENT
      ?auto_220966 - INSTRUMENT
      ?auto_220962 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_220953 ?auto_220950 ) ) ( not ( = ?auto_220954 ?auto_220950 ) ) ( not ( = ?auto_220954 ?auto_220953 ) ) ( not ( = ?auto_220956 ?auto_220950 ) ) ( not ( = ?auto_220956 ?auto_220953 ) ) ( not ( = ?auto_220956 ?auto_220954 ) ) ( not ( = ?auto_220958 ?auto_220950 ) ) ( not ( = ?auto_220958 ?auto_220953 ) ) ( not ( = ?auto_220958 ?auto_220954 ) ) ( not ( = ?auto_220958 ?auto_220956 ) ) ( ON_BOARD ?auto_220960 ?auto_220965 ) ( SUPPORTS ?auto_220960 ?auto_220952 ) ( not ( = ?auto_220953 ?auto_220961 ) ) ( CALIBRATION_TARGET ?auto_220960 ?auto_220961 ) ( not ( = ?auto_220961 ?auto_220950 ) ) ( ON_BOARD ?auto_220967 ?auto_220965 ) ( not ( = ?auto_220960 ?auto_220967 ) ) ( SUPPORTS ?auto_220967 ?auto_220951 ) ( CALIBRATION_TARGET ?auto_220967 ?auto_220961 ) ( not ( = ?auto_220961 ?auto_220956 ) ) ( ON_BOARD ?auto_220964 ?auto_220965 ) ( not ( = ?auto_220967 ?auto_220964 ) ) ( SUPPORTS ?auto_220964 ?auto_220957 ) ( CALIBRATION_TARGET ?auto_220964 ?auto_220961 ) ( not ( = ?auto_220961 ?auto_220958 ) ) ( ON_BOARD ?auto_220963 ?auto_220965 ) ( not ( = ?auto_220964 ?auto_220963 ) ) ( SUPPORTS ?auto_220963 ?auto_220959 ) ( CALIBRATION_TARGET ?auto_220963 ?auto_220961 ) ( not ( = ?auto_220961 ?auto_220954 ) ) ( ON_BOARD ?auto_220966 ?auto_220965 ) ( not ( = ?auto_220963 ?auto_220966 ) ) ( SUPPORTS ?auto_220966 ?auto_220955 ) ( CALIBRATION_TARGET ?auto_220966 ?auto_220961 ) ( POWER_AVAIL ?auto_220965 ) ( POINTING ?auto_220965 ?auto_220962 ) ( not ( = ?auto_220961 ?auto_220962 ) ) ( not ( = ?auto_220954 ?auto_220962 ) ) ( not ( = ?auto_220955 ?auto_220959 ) ) ( not ( = ?auto_220958 ?auto_220962 ) ) ( not ( = ?auto_220955 ?auto_220957 ) ) ( not ( = ?auto_220959 ?auto_220957 ) ) ( not ( = ?auto_220956 ?auto_220962 ) ) ( not ( = ?auto_220964 ?auto_220966 ) ) ( not ( = ?auto_220955 ?auto_220951 ) ) ( not ( = ?auto_220959 ?auto_220951 ) ) ( not ( = ?auto_220957 ?auto_220951 ) ) ( not ( = ?auto_220950 ?auto_220962 ) ) ( not ( = ?auto_220967 ?auto_220963 ) ) ( not ( = ?auto_220967 ?auto_220966 ) ) ( not ( = ?auto_220955 ?auto_220952 ) ) ( not ( = ?auto_220959 ?auto_220952 ) ) ( not ( = ?auto_220957 ?auto_220952 ) ) ( not ( = ?auto_220951 ?auto_220952 ) ) ( not ( = ?auto_220953 ?auto_220962 ) ) ( not ( = ?auto_220960 ?auto_220964 ) ) ( not ( = ?auto_220960 ?auto_220963 ) ) ( not ( = ?auto_220960 ?auto_220966 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_220954 ?auto_220955 ?auto_220958 ?auto_220959 ?auto_220956 ?auto_220957 ?auto_220953 ?auto_220952 ?auto_220950 ?auto_220951 )
      ( GET-5IMAGE-VERIFY ?auto_220950 ?auto_220951 ?auto_220953 ?auto_220952 ?auto_220954 ?auto_220955 ?auto_220956 ?auto_220957 ?auto_220958 ?auto_220959 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_221280 - DIRECTION
      ?auto_221281 - MODE
      ?auto_221283 - DIRECTION
      ?auto_221282 - MODE
      ?auto_221284 - DIRECTION
      ?auto_221285 - MODE
      ?auto_221286 - DIRECTION
      ?auto_221287 - MODE
      ?auto_221288 - DIRECTION
      ?auto_221289 - MODE
    )
    :vars
    (
      ?auto_221290 - INSTRUMENT
      ?auto_221295 - SATELLITE
      ?auto_221291 - DIRECTION
      ?auto_221297 - INSTRUMENT
      ?auto_221294 - INSTRUMENT
      ?auto_221293 - INSTRUMENT
      ?auto_221296 - INSTRUMENT
      ?auto_221292 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_221283 ?auto_221280 ) ) ( not ( = ?auto_221284 ?auto_221280 ) ) ( not ( = ?auto_221284 ?auto_221283 ) ) ( not ( = ?auto_221286 ?auto_221280 ) ) ( not ( = ?auto_221286 ?auto_221283 ) ) ( not ( = ?auto_221286 ?auto_221284 ) ) ( not ( = ?auto_221288 ?auto_221280 ) ) ( not ( = ?auto_221288 ?auto_221283 ) ) ( not ( = ?auto_221288 ?auto_221284 ) ) ( not ( = ?auto_221288 ?auto_221286 ) ) ( ON_BOARD ?auto_221290 ?auto_221295 ) ( SUPPORTS ?auto_221290 ?auto_221282 ) ( not ( = ?auto_221283 ?auto_221291 ) ) ( CALIBRATION_TARGET ?auto_221290 ?auto_221291 ) ( not ( = ?auto_221291 ?auto_221280 ) ) ( ON_BOARD ?auto_221297 ?auto_221295 ) ( not ( = ?auto_221290 ?auto_221297 ) ) ( SUPPORTS ?auto_221297 ?auto_221281 ) ( CALIBRATION_TARGET ?auto_221297 ?auto_221291 ) ( not ( = ?auto_221291 ?auto_221288 ) ) ( ON_BOARD ?auto_221294 ?auto_221295 ) ( not ( = ?auto_221297 ?auto_221294 ) ) ( SUPPORTS ?auto_221294 ?auto_221289 ) ( CALIBRATION_TARGET ?auto_221294 ?auto_221291 ) ( not ( = ?auto_221291 ?auto_221284 ) ) ( ON_BOARD ?auto_221293 ?auto_221295 ) ( not ( = ?auto_221294 ?auto_221293 ) ) ( SUPPORTS ?auto_221293 ?auto_221285 ) ( CALIBRATION_TARGET ?auto_221293 ?auto_221291 ) ( not ( = ?auto_221291 ?auto_221286 ) ) ( ON_BOARD ?auto_221296 ?auto_221295 ) ( not ( = ?auto_221293 ?auto_221296 ) ) ( SUPPORTS ?auto_221296 ?auto_221287 ) ( CALIBRATION_TARGET ?auto_221296 ?auto_221291 ) ( POWER_AVAIL ?auto_221295 ) ( POINTING ?auto_221295 ?auto_221292 ) ( not ( = ?auto_221291 ?auto_221292 ) ) ( not ( = ?auto_221286 ?auto_221292 ) ) ( not ( = ?auto_221287 ?auto_221285 ) ) ( not ( = ?auto_221284 ?auto_221292 ) ) ( not ( = ?auto_221287 ?auto_221289 ) ) ( not ( = ?auto_221285 ?auto_221289 ) ) ( not ( = ?auto_221288 ?auto_221292 ) ) ( not ( = ?auto_221294 ?auto_221296 ) ) ( not ( = ?auto_221287 ?auto_221281 ) ) ( not ( = ?auto_221285 ?auto_221281 ) ) ( not ( = ?auto_221289 ?auto_221281 ) ) ( not ( = ?auto_221280 ?auto_221292 ) ) ( not ( = ?auto_221297 ?auto_221293 ) ) ( not ( = ?auto_221297 ?auto_221296 ) ) ( not ( = ?auto_221287 ?auto_221282 ) ) ( not ( = ?auto_221285 ?auto_221282 ) ) ( not ( = ?auto_221289 ?auto_221282 ) ) ( not ( = ?auto_221281 ?auto_221282 ) ) ( not ( = ?auto_221283 ?auto_221292 ) ) ( not ( = ?auto_221290 ?auto_221294 ) ) ( not ( = ?auto_221290 ?auto_221293 ) ) ( not ( = ?auto_221290 ?auto_221296 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_221286 ?auto_221287 ?auto_221284 ?auto_221285 ?auto_221288 ?auto_221289 ?auto_221283 ?auto_221282 ?auto_221280 ?auto_221281 )
      ( GET-5IMAGE-VERIFY ?auto_221280 ?auto_221281 ?auto_221283 ?auto_221282 ?auto_221284 ?auto_221285 ?auto_221286 ?auto_221287 ?auto_221288 ?auto_221289 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_221444 - DIRECTION
      ?auto_221445 - MODE
      ?auto_221447 - DIRECTION
      ?auto_221446 - MODE
      ?auto_221448 - DIRECTION
      ?auto_221449 - MODE
      ?auto_221450 - DIRECTION
      ?auto_221451 - MODE
      ?auto_221452 - DIRECTION
      ?auto_221453 - MODE
    )
    :vars
    (
      ?auto_221454 - INSTRUMENT
      ?auto_221459 - SATELLITE
      ?auto_221455 - DIRECTION
      ?auto_221461 - INSTRUMENT
      ?auto_221458 - INSTRUMENT
      ?auto_221457 - INSTRUMENT
      ?auto_221460 - INSTRUMENT
      ?auto_221456 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_221447 ?auto_221444 ) ) ( not ( = ?auto_221448 ?auto_221444 ) ) ( not ( = ?auto_221448 ?auto_221447 ) ) ( not ( = ?auto_221450 ?auto_221444 ) ) ( not ( = ?auto_221450 ?auto_221447 ) ) ( not ( = ?auto_221450 ?auto_221448 ) ) ( not ( = ?auto_221452 ?auto_221444 ) ) ( not ( = ?auto_221452 ?auto_221447 ) ) ( not ( = ?auto_221452 ?auto_221448 ) ) ( not ( = ?auto_221452 ?auto_221450 ) ) ( ON_BOARD ?auto_221454 ?auto_221459 ) ( SUPPORTS ?auto_221454 ?auto_221446 ) ( not ( = ?auto_221447 ?auto_221455 ) ) ( CALIBRATION_TARGET ?auto_221454 ?auto_221455 ) ( not ( = ?auto_221455 ?auto_221444 ) ) ( ON_BOARD ?auto_221461 ?auto_221459 ) ( not ( = ?auto_221454 ?auto_221461 ) ) ( SUPPORTS ?auto_221461 ?auto_221445 ) ( CALIBRATION_TARGET ?auto_221461 ?auto_221455 ) ( not ( = ?auto_221455 ?auto_221450 ) ) ( ON_BOARD ?auto_221458 ?auto_221459 ) ( not ( = ?auto_221461 ?auto_221458 ) ) ( SUPPORTS ?auto_221458 ?auto_221451 ) ( CALIBRATION_TARGET ?auto_221458 ?auto_221455 ) ( not ( = ?auto_221455 ?auto_221448 ) ) ( ON_BOARD ?auto_221457 ?auto_221459 ) ( not ( = ?auto_221458 ?auto_221457 ) ) ( SUPPORTS ?auto_221457 ?auto_221449 ) ( CALIBRATION_TARGET ?auto_221457 ?auto_221455 ) ( not ( = ?auto_221455 ?auto_221452 ) ) ( ON_BOARD ?auto_221460 ?auto_221459 ) ( not ( = ?auto_221457 ?auto_221460 ) ) ( SUPPORTS ?auto_221460 ?auto_221453 ) ( CALIBRATION_TARGET ?auto_221460 ?auto_221455 ) ( POWER_AVAIL ?auto_221459 ) ( POINTING ?auto_221459 ?auto_221456 ) ( not ( = ?auto_221455 ?auto_221456 ) ) ( not ( = ?auto_221452 ?auto_221456 ) ) ( not ( = ?auto_221453 ?auto_221449 ) ) ( not ( = ?auto_221448 ?auto_221456 ) ) ( not ( = ?auto_221453 ?auto_221451 ) ) ( not ( = ?auto_221449 ?auto_221451 ) ) ( not ( = ?auto_221450 ?auto_221456 ) ) ( not ( = ?auto_221458 ?auto_221460 ) ) ( not ( = ?auto_221453 ?auto_221445 ) ) ( not ( = ?auto_221449 ?auto_221445 ) ) ( not ( = ?auto_221451 ?auto_221445 ) ) ( not ( = ?auto_221444 ?auto_221456 ) ) ( not ( = ?auto_221461 ?auto_221457 ) ) ( not ( = ?auto_221461 ?auto_221460 ) ) ( not ( = ?auto_221453 ?auto_221446 ) ) ( not ( = ?auto_221449 ?auto_221446 ) ) ( not ( = ?auto_221451 ?auto_221446 ) ) ( not ( = ?auto_221445 ?auto_221446 ) ) ( not ( = ?auto_221447 ?auto_221456 ) ) ( not ( = ?auto_221454 ?auto_221458 ) ) ( not ( = ?auto_221454 ?auto_221457 ) ) ( not ( = ?auto_221454 ?auto_221460 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_221452 ?auto_221453 ?auto_221448 ?auto_221449 ?auto_221450 ?auto_221451 ?auto_221447 ?auto_221446 ?auto_221444 ?auto_221445 )
      ( GET-5IMAGE-VERIFY ?auto_221444 ?auto_221445 ?auto_221447 ?auto_221446 ?auto_221448 ?auto_221449 ?auto_221450 ?auto_221451 ?auto_221452 ?auto_221453 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_221774 - DIRECTION
      ?auto_221775 - MODE
      ?auto_221777 - DIRECTION
      ?auto_221776 - MODE
      ?auto_221778 - DIRECTION
      ?auto_221779 - MODE
      ?auto_221780 - DIRECTION
      ?auto_221781 - MODE
      ?auto_221782 - DIRECTION
      ?auto_221783 - MODE
    )
    :vars
    (
      ?auto_221784 - INSTRUMENT
      ?auto_221789 - SATELLITE
      ?auto_221785 - DIRECTION
      ?auto_221791 - INSTRUMENT
      ?auto_221788 - INSTRUMENT
      ?auto_221787 - INSTRUMENT
      ?auto_221790 - INSTRUMENT
      ?auto_221786 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_221777 ?auto_221774 ) ) ( not ( = ?auto_221778 ?auto_221774 ) ) ( not ( = ?auto_221778 ?auto_221777 ) ) ( not ( = ?auto_221780 ?auto_221774 ) ) ( not ( = ?auto_221780 ?auto_221777 ) ) ( not ( = ?auto_221780 ?auto_221778 ) ) ( not ( = ?auto_221782 ?auto_221774 ) ) ( not ( = ?auto_221782 ?auto_221777 ) ) ( not ( = ?auto_221782 ?auto_221778 ) ) ( not ( = ?auto_221782 ?auto_221780 ) ) ( ON_BOARD ?auto_221784 ?auto_221789 ) ( SUPPORTS ?auto_221784 ?auto_221776 ) ( not ( = ?auto_221777 ?auto_221785 ) ) ( CALIBRATION_TARGET ?auto_221784 ?auto_221785 ) ( not ( = ?auto_221785 ?auto_221774 ) ) ( ON_BOARD ?auto_221791 ?auto_221789 ) ( not ( = ?auto_221784 ?auto_221791 ) ) ( SUPPORTS ?auto_221791 ?auto_221775 ) ( CALIBRATION_TARGET ?auto_221791 ?auto_221785 ) ( not ( = ?auto_221785 ?auto_221778 ) ) ( ON_BOARD ?auto_221788 ?auto_221789 ) ( not ( = ?auto_221791 ?auto_221788 ) ) ( SUPPORTS ?auto_221788 ?auto_221779 ) ( CALIBRATION_TARGET ?auto_221788 ?auto_221785 ) ( not ( = ?auto_221785 ?auto_221782 ) ) ( ON_BOARD ?auto_221787 ?auto_221789 ) ( not ( = ?auto_221788 ?auto_221787 ) ) ( SUPPORTS ?auto_221787 ?auto_221783 ) ( CALIBRATION_TARGET ?auto_221787 ?auto_221785 ) ( not ( = ?auto_221785 ?auto_221780 ) ) ( ON_BOARD ?auto_221790 ?auto_221789 ) ( not ( = ?auto_221787 ?auto_221790 ) ) ( SUPPORTS ?auto_221790 ?auto_221781 ) ( CALIBRATION_TARGET ?auto_221790 ?auto_221785 ) ( POWER_AVAIL ?auto_221789 ) ( POINTING ?auto_221789 ?auto_221786 ) ( not ( = ?auto_221785 ?auto_221786 ) ) ( not ( = ?auto_221780 ?auto_221786 ) ) ( not ( = ?auto_221781 ?auto_221783 ) ) ( not ( = ?auto_221782 ?auto_221786 ) ) ( not ( = ?auto_221781 ?auto_221779 ) ) ( not ( = ?auto_221783 ?auto_221779 ) ) ( not ( = ?auto_221778 ?auto_221786 ) ) ( not ( = ?auto_221788 ?auto_221790 ) ) ( not ( = ?auto_221781 ?auto_221775 ) ) ( not ( = ?auto_221783 ?auto_221775 ) ) ( not ( = ?auto_221779 ?auto_221775 ) ) ( not ( = ?auto_221774 ?auto_221786 ) ) ( not ( = ?auto_221791 ?auto_221787 ) ) ( not ( = ?auto_221791 ?auto_221790 ) ) ( not ( = ?auto_221781 ?auto_221776 ) ) ( not ( = ?auto_221783 ?auto_221776 ) ) ( not ( = ?auto_221779 ?auto_221776 ) ) ( not ( = ?auto_221775 ?auto_221776 ) ) ( not ( = ?auto_221777 ?auto_221786 ) ) ( not ( = ?auto_221784 ?auto_221788 ) ) ( not ( = ?auto_221784 ?auto_221787 ) ) ( not ( = ?auto_221784 ?auto_221790 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_221780 ?auto_221781 ?auto_221782 ?auto_221783 ?auto_221778 ?auto_221779 ?auto_221777 ?auto_221776 ?auto_221774 ?auto_221775 )
      ( GET-5IMAGE-VERIFY ?auto_221774 ?auto_221775 ?auto_221777 ?auto_221776 ?auto_221778 ?auto_221779 ?auto_221780 ?auto_221781 ?auto_221782 ?auto_221783 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_221852 - DIRECTION
      ?auto_221853 - MODE
      ?auto_221855 - DIRECTION
      ?auto_221854 - MODE
      ?auto_221856 - DIRECTION
      ?auto_221857 - MODE
      ?auto_221858 - DIRECTION
      ?auto_221859 - MODE
      ?auto_221860 - DIRECTION
      ?auto_221861 - MODE
    )
    :vars
    (
      ?auto_221862 - INSTRUMENT
      ?auto_221867 - SATELLITE
      ?auto_221863 - DIRECTION
      ?auto_221869 - INSTRUMENT
      ?auto_221866 - INSTRUMENT
      ?auto_221865 - INSTRUMENT
      ?auto_221868 - INSTRUMENT
      ?auto_221864 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_221855 ?auto_221852 ) ) ( not ( = ?auto_221856 ?auto_221852 ) ) ( not ( = ?auto_221856 ?auto_221855 ) ) ( not ( = ?auto_221858 ?auto_221852 ) ) ( not ( = ?auto_221858 ?auto_221855 ) ) ( not ( = ?auto_221858 ?auto_221856 ) ) ( not ( = ?auto_221860 ?auto_221852 ) ) ( not ( = ?auto_221860 ?auto_221855 ) ) ( not ( = ?auto_221860 ?auto_221856 ) ) ( not ( = ?auto_221860 ?auto_221858 ) ) ( ON_BOARD ?auto_221862 ?auto_221867 ) ( SUPPORTS ?auto_221862 ?auto_221854 ) ( not ( = ?auto_221855 ?auto_221863 ) ) ( CALIBRATION_TARGET ?auto_221862 ?auto_221863 ) ( not ( = ?auto_221863 ?auto_221852 ) ) ( ON_BOARD ?auto_221869 ?auto_221867 ) ( not ( = ?auto_221862 ?auto_221869 ) ) ( SUPPORTS ?auto_221869 ?auto_221853 ) ( CALIBRATION_TARGET ?auto_221869 ?auto_221863 ) ( not ( = ?auto_221863 ?auto_221856 ) ) ( ON_BOARD ?auto_221866 ?auto_221867 ) ( not ( = ?auto_221869 ?auto_221866 ) ) ( SUPPORTS ?auto_221866 ?auto_221857 ) ( CALIBRATION_TARGET ?auto_221866 ?auto_221863 ) ( not ( = ?auto_221863 ?auto_221858 ) ) ( ON_BOARD ?auto_221865 ?auto_221867 ) ( not ( = ?auto_221866 ?auto_221865 ) ) ( SUPPORTS ?auto_221865 ?auto_221859 ) ( CALIBRATION_TARGET ?auto_221865 ?auto_221863 ) ( not ( = ?auto_221863 ?auto_221860 ) ) ( ON_BOARD ?auto_221868 ?auto_221867 ) ( not ( = ?auto_221865 ?auto_221868 ) ) ( SUPPORTS ?auto_221868 ?auto_221861 ) ( CALIBRATION_TARGET ?auto_221868 ?auto_221863 ) ( POWER_AVAIL ?auto_221867 ) ( POINTING ?auto_221867 ?auto_221864 ) ( not ( = ?auto_221863 ?auto_221864 ) ) ( not ( = ?auto_221860 ?auto_221864 ) ) ( not ( = ?auto_221861 ?auto_221859 ) ) ( not ( = ?auto_221858 ?auto_221864 ) ) ( not ( = ?auto_221861 ?auto_221857 ) ) ( not ( = ?auto_221859 ?auto_221857 ) ) ( not ( = ?auto_221856 ?auto_221864 ) ) ( not ( = ?auto_221866 ?auto_221868 ) ) ( not ( = ?auto_221861 ?auto_221853 ) ) ( not ( = ?auto_221859 ?auto_221853 ) ) ( not ( = ?auto_221857 ?auto_221853 ) ) ( not ( = ?auto_221852 ?auto_221864 ) ) ( not ( = ?auto_221869 ?auto_221865 ) ) ( not ( = ?auto_221869 ?auto_221868 ) ) ( not ( = ?auto_221861 ?auto_221854 ) ) ( not ( = ?auto_221859 ?auto_221854 ) ) ( not ( = ?auto_221857 ?auto_221854 ) ) ( not ( = ?auto_221853 ?auto_221854 ) ) ( not ( = ?auto_221855 ?auto_221864 ) ) ( not ( = ?auto_221862 ?auto_221866 ) ) ( not ( = ?auto_221862 ?auto_221865 ) ) ( not ( = ?auto_221862 ?auto_221868 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_221860 ?auto_221861 ?auto_221858 ?auto_221859 ?auto_221856 ?auto_221857 ?auto_221855 ?auto_221854 ?auto_221852 ?auto_221853 )
      ( GET-5IMAGE-VERIFY ?auto_221852 ?auto_221853 ?auto_221855 ?auto_221854 ?auto_221856 ?auto_221857 ?auto_221858 ?auto_221859 ?auto_221860 ?auto_221861 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_224178 - DIRECTION
      ?auto_224179 - MODE
      ?auto_224181 - DIRECTION
      ?auto_224180 - MODE
      ?auto_224182 - DIRECTION
      ?auto_224183 - MODE
      ?auto_224184 - DIRECTION
      ?auto_224185 - MODE
      ?auto_224186 - DIRECTION
      ?auto_224187 - MODE
    )
    :vars
    (
      ?auto_224188 - INSTRUMENT
      ?auto_224193 - SATELLITE
      ?auto_224189 - DIRECTION
      ?auto_224195 - INSTRUMENT
      ?auto_224192 - INSTRUMENT
      ?auto_224191 - INSTRUMENT
      ?auto_224194 - INSTRUMENT
      ?auto_224190 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_224181 ?auto_224178 ) ) ( not ( = ?auto_224182 ?auto_224178 ) ) ( not ( = ?auto_224182 ?auto_224181 ) ) ( not ( = ?auto_224184 ?auto_224178 ) ) ( not ( = ?auto_224184 ?auto_224181 ) ) ( not ( = ?auto_224184 ?auto_224182 ) ) ( not ( = ?auto_224186 ?auto_224178 ) ) ( not ( = ?auto_224186 ?auto_224181 ) ) ( not ( = ?auto_224186 ?auto_224182 ) ) ( not ( = ?auto_224186 ?auto_224184 ) ) ( ON_BOARD ?auto_224188 ?auto_224193 ) ( SUPPORTS ?auto_224188 ?auto_224179 ) ( not ( = ?auto_224178 ?auto_224189 ) ) ( CALIBRATION_TARGET ?auto_224188 ?auto_224189 ) ( not ( = ?auto_224189 ?auto_224186 ) ) ( ON_BOARD ?auto_224195 ?auto_224193 ) ( not ( = ?auto_224188 ?auto_224195 ) ) ( SUPPORTS ?auto_224195 ?auto_224187 ) ( CALIBRATION_TARGET ?auto_224195 ?auto_224189 ) ( not ( = ?auto_224189 ?auto_224184 ) ) ( ON_BOARD ?auto_224192 ?auto_224193 ) ( not ( = ?auto_224195 ?auto_224192 ) ) ( SUPPORTS ?auto_224192 ?auto_224185 ) ( CALIBRATION_TARGET ?auto_224192 ?auto_224189 ) ( not ( = ?auto_224189 ?auto_224182 ) ) ( ON_BOARD ?auto_224191 ?auto_224193 ) ( not ( = ?auto_224192 ?auto_224191 ) ) ( SUPPORTS ?auto_224191 ?auto_224183 ) ( CALIBRATION_TARGET ?auto_224191 ?auto_224189 ) ( not ( = ?auto_224189 ?auto_224181 ) ) ( ON_BOARD ?auto_224194 ?auto_224193 ) ( not ( = ?auto_224191 ?auto_224194 ) ) ( SUPPORTS ?auto_224194 ?auto_224180 ) ( CALIBRATION_TARGET ?auto_224194 ?auto_224189 ) ( POWER_AVAIL ?auto_224193 ) ( POINTING ?auto_224193 ?auto_224190 ) ( not ( = ?auto_224189 ?auto_224190 ) ) ( not ( = ?auto_224181 ?auto_224190 ) ) ( not ( = ?auto_224180 ?auto_224183 ) ) ( not ( = ?auto_224182 ?auto_224190 ) ) ( not ( = ?auto_224180 ?auto_224185 ) ) ( not ( = ?auto_224183 ?auto_224185 ) ) ( not ( = ?auto_224184 ?auto_224190 ) ) ( not ( = ?auto_224192 ?auto_224194 ) ) ( not ( = ?auto_224180 ?auto_224187 ) ) ( not ( = ?auto_224183 ?auto_224187 ) ) ( not ( = ?auto_224185 ?auto_224187 ) ) ( not ( = ?auto_224186 ?auto_224190 ) ) ( not ( = ?auto_224195 ?auto_224191 ) ) ( not ( = ?auto_224195 ?auto_224194 ) ) ( not ( = ?auto_224180 ?auto_224179 ) ) ( not ( = ?auto_224183 ?auto_224179 ) ) ( not ( = ?auto_224185 ?auto_224179 ) ) ( not ( = ?auto_224187 ?auto_224179 ) ) ( not ( = ?auto_224178 ?auto_224190 ) ) ( not ( = ?auto_224188 ?auto_224192 ) ) ( not ( = ?auto_224188 ?auto_224191 ) ) ( not ( = ?auto_224188 ?auto_224194 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_224181 ?auto_224180 ?auto_224182 ?auto_224183 ?auto_224184 ?auto_224185 ?auto_224178 ?auto_224179 ?auto_224186 ?auto_224187 )
      ( GET-5IMAGE-VERIFY ?auto_224178 ?auto_224179 ?auto_224181 ?auto_224180 ?auto_224182 ?auto_224183 ?auto_224184 ?auto_224185 ?auto_224186 ?auto_224187 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_224256 - DIRECTION
      ?auto_224257 - MODE
      ?auto_224259 - DIRECTION
      ?auto_224258 - MODE
      ?auto_224260 - DIRECTION
      ?auto_224261 - MODE
      ?auto_224262 - DIRECTION
      ?auto_224263 - MODE
      ?auto_224264 - DIRECTION
      ?auto_224265 - MODE
    )
    :vars
    (
      ?auto_224266 - INSTRUMENT
      ?auto_224271 - SATELLITE
      ?auto_224267 - DIRECTION
      ?auto_224273 - INSTRUMENT
      ?auto_224270 - INSTRUMENT
      ?auto_224269 - INSTRUMENT
      ?auto_224272 - INSTRUMENT
      ?auto_224268 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_224259 ?auto_224256 ) ) ( not ( = ?auto_224260 ?auto_224256 ) ) ( not ( = ?auto_224260 ?auto_224259 ) ) ( not ( = ?auto_224262 ?auto_224256 ) ) ( not ( = ?auto_224262 ?auto_224259 ) ) ( not ( = ?auto_224262 ?auto_224260 ) ) ( not ( = ?auto_224264 ?auto_224256 ) ) ( not ( = ?auto_224264 ?auto_224259 ) ) ( not ( = ?auto_224264 ?auto_224260 ) ) ( not ( = ?auto_224264 ?auto_224262 ) ) ( ON_BOARD ?auto_224266 ?auto_224271 ) ( SUPPORTS ?auto_224266 ?auto_224257 ) ( not ( = ?auto_224256 ?auto_224267 ) ) ( CALIBRATION_TARGET ?auto_224266 ?auto_224267 ) ( not ( = ?auto_224267 ?auto_224262 ) ) ( ON_BOARD ?auto_224273 ?auto_224271 ) ( not ( = ?auto_224266 ?auto_224273 ) ) ( SUPPORTS ?auto_224273 ?auto_224263 ) ( CALIBRATION_TARGET ?auto_224273 ?auto_224267 ) ( not ( = ?auto_224267 ?auto_224264 ) ) ( ON_BOARD ?auto_224270 ?auto_224271 ) ( not ( = ?auto_224273 ?auto_224270 ) ) ( SUPPORTS ?auto_224270 ?auto_224265 ) ( CALIBRATION_TARGET ?auto_224270 ?auto_224267 ) ( not ( = ?auto_224267 ?auto_224260 ) ) ( ON_BOARD ?auto_224269 ?auto_224271 ) ( not ( = ?auto_224270 ?auto_224269 ) ) ( SUPPORTS ?auto_224269 ?auto_224261 ) ( CALIBRATION_TARGET ?auto_224269 ?auto_224267 ) ( not ( = ?auto_224267 ?auto_224259 ) ) ( ON_BOARD ?auto_224272 ?auto_224271 ) ( not ( = ?auto_224269 ?auto_224272 ) ) ( SUPPORTS ?auto_224272 ?auto_224258 ) ( CALIBRATION_TARGET ?auto_224272 ?auto_224267 ) ( POWER_AVAIL ?auto_224271 ) ( POINTING ?auto_224271 ?auto_224268 ) ( not ( = ?auto_224267 ?auto_224268 ) ) ( not ( = ?auto_224259 ?auto_224268 ) ) ( not ( = ?auto_224258 ?auto_224261 ) ) ( not ( = ?auto_224260 ?auto_224268 ) ) ( not ( = ?auto_224258 ?auto_224265 ) ) ( not ( = ?auto_224261 ?auto_224265 ) ) ( not ( = ?auto_224264 ?auto_224268 ) ) ( not ( = ?auto_224270 ?auto_224272 ) ) ( not ( = ?auto_224258 ?auto_224263 ) ) ( not ( = ?auto_224261 ?auto_224263 ) ) ( not ( = ?auto_224265 ?auto_224263 ) ) ( not ( = ?auto_224262 ?auto_224268 ) ) ( not ( = ?auto_224273 ?auto_224269 ) ) ( not ( = ?auto_224273 ?auto_224272 ) ) ( not ( = ?auto_224258 ?auto_224257 ) ) ( not ( = ?auto_224261 ?auto_224257 ) ) ( not ( = ?auto_224265 ?auto_224257 ) ) ( not ( = ?auto_224263 ?auto_224257 ) ) ( not ( = ?auto_224256 ?auto_224268 ) ) ( not ( = ?auto_224266 ?auto_224270 ) ) ( not ( = ?auto_224266 ?auto_224269 ) ) ( not ( = ?auto_224266 ?auto_224272 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_224259 ?auto_224258 ?auto_224260 ?auto_224261 ?auto_224264 ?auto_224265 ?auto_224256 ?auto_224257 ?auto_224262 ?auto_224263 )
      ( GET-5IMAGE-VERIFY ?auto_224256 ?auto_224257 ?auto_224259 ?auto_224258 ?auto_224260 ?auto_224261 ?auto_224262 ?auto_224263 ?auto_224264 ?auto_224265 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_224586 - DIRECTION
      ?auto_224587 - MODE
      ?auto_224589 - DIRECTION
      ?auto_224588 - MODE
      ?auto_224590 - DIRECTION
      ?auto_224591 - MODE
      ?auto_224592 - DIRECTION
      ?auto_224593 - MODE
      ?auto_224594 - DIRECTION
      ?auto_224595 - MODE
    )
    :vars
    (
      ?auto_224596 - INSTRUMENT
      ?auto_224601 - SATELLITE
      ?auto_224597 - DIRECTION
      ?auto_224603 - INSTRUMENT
      ?auto_224600 - INSTRUMENT
      ?auto_224599 - INSTRUMENT
      ?auto_224602 - INSTRUMENT
      ?auto_224598 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_224589 ?auto_224586 ) ) ( not ( = ?auto_224590 ?auto_224586 ) ) ( not ( = ?auto_224590 ?auto_224589 ) ) ( not ( = ?auto_224592 ?auto_224586 ) ) ( not ( = ?auto_224592 ?auto_224589 ) ) ( not ( = ?auto_224592 ?auto_224590 ) ) ( not ( = ?auto_224594 ?auto_224586 ) ) ( not ( = ?auto_224594 ?auto_224589 ) ) ( not ( = ?auto_224594 ?auto_224590 ) ) ( not ( = ?auto_224594 ?auto_224592 ) ) ( ON_BOARD ?auto_224596 ?auto_224601 ) ( SUPPORTS ?auto_224596 ?auto_224587 ) ( not ( = ?auto_224586 ?auto_224597 ) ) ( CALIBRATION_TARGET ?auto_224596 ?auto_224597 ) ( not ( = ?auto_224597 ?auto_224594 ) ) ( ON_BOARD ?auto_224603 ?auto_224601 ) ( not ( = ?auto_224596 ?auto_224603 ) ) ( SUPPORTS ?auto_224603 ?auto_224595 ) ( CALIBRATION_TARGET ?auto_224603 ?auto_224597 ) ( not ( = ?auto_224597 ?auto_224590 ) ) ( ON_BOARD ?auto_224600 ?auto_224601 ) ( not ( = ?auto_224603 ?auto_224600 ) ) ( SUPPORTS ?auto_224600 ?auto_224591 ) ( CALIBRATION_TARGET ?auto_224600 ?auto_224597 ) ( not ( = ?auto_224597 ?auto_224592 ) ) ( ON_BOARD ?auto_224599 ?auto_224601 ) ( not ( = ?auto_224600 ?auto_224599 ) ) ( SUPPORTS ?auto_224599 ?auto_224593 ) ( CALIBRATION_TARGET ?auto_224599 ?auto_224597 ) ( not ( = ?auto_224597 ?auto_224589 ) ) ( ON_BOARD ?auto_224602 ?auto_224601 ) ( not ( = ?auto_224599 ?auto_224602 ) ) ( SUPPORTS ?auto_224602 ?auto_224588 ) ( CALIBRATION_TARGET ?auto_224602 ?auto_224597 ) ( POWER_AVAIL ?auto_224601 ) ( POINTING ?auto_224601 ?auto_224598 ) ( not ( = ?auto_224597 ?auto_224598 ) ) ( not ( = ?auto_224589 ?auto_224598 ) ) ( not ( = ?auto_224588 ?auto_224593 ) ) ( not ( = ?auto_224592 ?auto_224598 ) ) ( not ( = ?auto_224588 ?auto_224591 ) ) ( not ( = ?auto_224593 ?auto_224591 ) ) ( not ( = ?auto_224590 ?auto_224598 ) ) ( not ( = ?auto_224600 ?auto_224602 ) ) ( not ( = ?auto_224588 ?auto_224595 ) ) ( not ( = ?auto_224593 ?auto_224595 ) ) ( not ( = ?auto_224591 ?auto_224595 ) ) ( not ( = ?auto_224594 ?auto_224598 ) ) ( not ( = ?auto_224603 ?auto_224599 ) ) ( not ( = ?auto_224603 ?auto_224602 ) ) ( not ( = ?auto_224588 ?auto_224587 ) ) ( not ( = ?auto_224593 ?auto_224587 ) ) ( not ( = ?auto_224591 ?auto_224587 ) ) ( not ( = ?auto_224595 ?auto_224587 ) ) ( not ( = ?auto_224586 ?auto_224598 ) ) ( not ( = ?auto_224596 ?auto_224600 ) ) ( not ( = ?auto_224596 ?auto_224599 ) ) ( not ( = ?auto_224596 ?auto_224602 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_224589 ?auto_224588 ?auto_224592 ?auto_224593 ?auto_224590 ?auto_224591 ?auto_224586 ?auto_224587 ?auto_224594 ?auto_224595 )
      ( GET-5IMAGE-VERIFY ?auto_224586 ?auto_224587 ?auto_224589 ?auto_224588 ?auto_224590 ?auto_224591 ?auto_224592 ?auto_224593 ?auto_224594 ?auto_224595 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_224750 - DIRECTION
      ?auto_224751 - MODE
      ?auto_224753 - DIRECTION
      ?auto_224752 - MODE
      ?auto_224754 - DIRECTION
      ?auto_224755 - MODE
      ?auto_224756 - DIRECTION
      ?auto_224757 - MODE
      ?auto_224758 - DIRECTION
      ?auto_224759 - MODE
    )
    :vars
    (
      ?auto_224760 - INSTRUMENT
      ?auto_224765 - SATELLITE
      ?auto_224761 - DIRECTION
      ?auto_224767 - INSTRUMENT
      ?auto_224764 - INSTRUMENT
      ?auto_224763 - INSTRUMENT
      ?auto_224766 - INSTRUMENT
      ?auto_224762 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_224753 ?auto_224750 ) ) ( not ( = ?auto_224754 ?auto_224750 ) ) ( not ( = ?auto_224754 ?auto_224753 ) ) ( not ( = ?auto_224756 ?auto_224750 ) ) ( not ( = ?auto_224756 ?auto_224753 ) ) ( not ( = ?auto_224756 ?auto_224754 ) ) ( not ( = ?auto_224758 ?auto_224750 ) ) ( not ( = ?auto_224758 ?auto_224753 ) ) ( not ( = ?auto_224758 ?auto_224754 ) ) ( not ( = ?auto_224758 ?auto_224756 ) ) ( ON_BOARD ?auto_224760 ?auto_224765 ) ( SUPPORTS ?auto_224760 ?auto_224751 ) ( not ( = ?auto_224750 ?auto_224761 ) ) ( CALIBRATION_TARGET ?auto_224760 ?auto_224761 ) ( not ( = ?auto_224761 ?auto_224756 ) ) ( ON_BOARD ?auto_224767 ?auto_224765 ) ( not ( = ?auto_224760 ?auto_224767 ) ) ( SUPPORTS ?auto_224767 ?auto_224757 ) ( CALIBRATION_TARGET ?auto_224767 ?auto_224761 ) ( not ( = ?auto_224761 ?auto_224754 ) ) ( ON_BOARD ?auto_224764 ?auto_224765 ) ( not ( = ?auto_224767 ?auto_224764 ) ) ( SUPPORTS ?auto_224764 ?auto_224755 ) ( CALIBRATION_TARGET ?auto_224764 ?auto_224761 ) ( not ( = ?auto_224761 ?auto_224758 ) ) ( ON_BOARD ?auto_224763 ?auto_224765 ) ( not ( = ?auto_224764 ?auto_224763 ) ) ( SUPPORTS ?auto_224763 ?auto_224759 ) ( CALIBRATION_TARGET ?auto_224763 ?auto_224761 ) ( not ( = ?auto_224761 ?auto_224753 ) ) ( ON_BOARD ?auto_224766 ?auto_224765 ) ( not ( = ?auto_224763 ?auto_224766 ) ) ( SUPPORTS ?auto_224766 ?auto_224752 ) ( CALIBRATION_TARGET ?auto_224766 ?auto_224761 ) ( POWER_AVAIL ?auto_224765 ) ( POINTING ?auto_224765 ?auto_224762 ) ( not ( = ?auto_224761 ?auto_224762 ) ) ( not ( = ?auto_224753 ?auto_224762 ) ) ( not ( = ?auto_224752 ?auto_224759 ) ) ( not ( = ?auto_224758 ?auto_224762 ) ) ( not ( = ?auto_224752 ?auto_224755 ) ) ( not ( = ?auto_224759 ?auto_224755 ) ) ( not ( = ?auto_224754 ?auto_224762 ) ) ( not ( = ?auto_224764 ?auto_224766 ) ) ( not ( = ?auto_224752 ?auto_224757 ) ) ( not ( = ?auto_224759 ?auto_224757 ) ) ( not ( = ?auto_224755 ?auto_224757 ) ) ( not ( = ?auto_224756 ?auto_224762 ) ) ( not ( = ?auto_224767 ?auto_224763 ) ) ( not ( = ?auto_224767 ?auto_224766 ) ) ( not ( = ?auto_224752 ?auto_224751 ) ) ( not ( = ?auto_224759 ?auto_224751 ) ) ( not ( = ?auto_224755 ?auto_224751 ) ) ( not ( = ?auto_224757 ?auto_224751 ) ) ( not ( = ?auto_224750 ?auto_224762 ) ) ( not ( = ?auto_224760 ?auto_224764 ) ) ( not ( = ?auto_224760 ?auto_224763 ) ) ( not ( = ?auto_224760 ?auto_224766 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_224753 ?auto_224752 ?auto_224758 ?auto_224759 ?auto_224754 ?auto_224755 ?auto_224750 ?auto_224751 ?auto_224756 ?auto_224757 )
      ( GET-5IMAGE-VERIFY ?auto_224750 ?auto_224751 ?auto_224753 ?auto_224752 ?auto_224754 ?auto_224755 ?auto_224756 ?auto_224757 ?auto_224758 ?auto_224759 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_225080 - DIRECTION
      ?auto_225081 - MODE
      ?auto_225083 - DIRECTION
      ?auto_225082 - MODE
      ?auto_225084 - DIRECTION
      ?auto_225085 - MODE
      ?auto_225086 - DIRECTION
      ?auto_225087 - MODE
      ?auto_225088 - DIRECTION
      ?auto_225089 - MODE
    )
    :vars
    (
      ?auto_225090 - INSTRUMENT
      ?auto_225095 - SATELLITE
      ?auto_225091 - DIRECTION
      ?auto_225097 - INSTRUMENT
      ?auto_225094 - INSTRUMENT
      ?auto_225093 - INSTRUMENT
      ?auto_225096 - INSTRUMENT
      ?auto_225092 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_225083 ?auto_225080 ) ) ( not ( = ?auto_225084 ?auto_225080 ) ) ( not ( = ?auto_225084 ?auto_225083 ) ) ( not ( = ?auto_225086 ?auto_225080 ) ) ( not ( = ?auto_225086 ?auto_225083 ) ) ( not ( = ?auto_225086 ?auto_225084 ) ) ( not ( = ?auto_225088 ?auto_225080 ) ) ( not ( = ?auto_225088 ?auto_225083 ) ) ( not ( = ?auto_225088 ?auto_225084 ) ) ( not ( = ?auto_225088 ?auto_225086 ) ) ( ON_BOARD ?auto_225090 ?auto_225095 ) ( SUPPORTS ?auto_225090 ?auto_225081 ) ( not ( = ?auto_225080 ?auto_225091 ) ) ( CALIBRATION_TARGET ?auto_225090 ?auto_225091 ) ( not ( = ?auto_225091 ?auto_225084 ) ) ( ON_BOARD ?auto_225097 ?auto_225095 ) ( not ( = ?auto_225090 ?auto_225097 ) ) ( SUPPORTS ?auto_225097 ?auto_225085 ) ( CALIBRATION_TARGET ?auto_225097 ?auto_225091 ) ( not ( = ?auto_225091 ?auto_225088 ) ) ( ON_BOARD ?auto_225094 ?auto_225095 ) ( not ( = ?auto_225097 ?auto_225094 ) ) ( SUPPORTS ?auto_225094 ?auto_225089 ) ( CALIBRATION_TARGET ?auto_225094 ?auto_225091 ) ( not ( = ?auto_225091 ?auto_225086 ) ) ( ON_BOARD ?auto_225093 ?auto_225095 ) ( not ( = ?auto_225094 ?auto_225093 ) ) ( SUPPORTS ?auto_225093 ?auto_225087 ) ( CALIBRATION_TARGET ?auto_225093 ?auto_225091 ) ( not ( = ?auto_225091 ?auto_225083 ) ) ( ON_BOARD ?auto_225096 ?auto_225095 ) ( not ( = ?auto_225093 ?auto_225096 ) ) ( SUPPORTS ?auto_225096 ?auto_225082 ) ( CALIBRATION_TARGET ?auto_225096 ?auto_225091 ) ( POWER_AVAIL ?auto_225095 ) ( POINTING ?auto_225095 ?auto_225092 ) ( not ( = ?auto_225091 ?auto_225092 ) ) ( not ( = ?auto_225083 ?auto_225092 ) ) ( not ( = ?auto_225082 ?auto_225087 ) ) ( not ( = ?auto_225086 ?auto_225092 ) ) ( not ( = ?auto_225082 ?auto_225089 ) ) ( not ( = ?auto_225087 ?auto_225089 ) ) ( not ( = ?auto_225088 ?auto_225092 ) ) ( not ( = ?auto_225094 ?auto_225096 ) ) ( not ( = ?auto_225082 ?auto_225085 ) ) ( not ( = ?auto_225087 ?auto_225085 ) ) ( not ( = ?auto_225089 ?auto_225085 ) ) ( not ( = ?auto_225084 ?auto_225092 ) ) ( not ( = ?auto_225097 ?auto_225093 ) ) ( not ( = ?auto_225097 ?auto_225096 ) ) ( not ( = ?auto_225082 ?auto_225081 ) ) ( not ( = ?auto_225087 ?auto_225081 ) ) ( not ( = ?auto_225089 ?auto_225081 ) ) ( not ( = ?auto_225085 ?auto_225081 ) ) ( not ( = ?auto_225080 ?auto_225092 ) ) ( not ( = ?auto_225090 ?auto_225094 ) ) ( not ( = ?auto_225090 ?auto_225093 ) ) ( not ( = ?auto_225090 ?auto_225096 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_225083 ?auto_225082 ?auto_225086 ?auto_225087 ?auto_225088 ?auto_225089 ?auto_225080 ?auto_225081 ?auto_225084 ?auto_225085 )
      ( GET-5IMAGE-VERIFY ?auto_225080 ?auto_225081 ?auto_225083 ?auto_225082 ?auto_225084 ?auto_225085 ?auto_225086 ?auto_225087 ?auto_225088 ?auto_225089 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_225158 - DIRECTION
      ?auto_225159 - MODE
      ?auto_225161 - DIRECTION
      ?auto_225160 - MODE
      ?auto_225162 - DIRECTION
      ?auto_225163 - MODE
      ?auto_225164 - DIRECTION
      ?auto_225165 - MODE
      ?auto_225166 - DIRECTION
      ?auto_225167 - MODE
    )
    :vars
    (
      ?auto_225168 - INSTRUMENT
      ?auto_225173 - SATELLITE
      ?auto_225169 - DIRECTION
      ?auto_225175 - INSTRUMENT
      ?auto_225172 - INSTRUMENT
      ?auto_225171 - INSTRUMENT
      ?auto_225174 - INSTRUMENT
      ?auto_225170 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_225161 ?auto_225158 ) ) ( not ( = ?auto_225162 ?auto_225158 ) ) ( not ( = ?auto_225162 ?auto_225161 ) ) ( not ( = ?auto_225164 ?auto_225158 ) ) ( not ( = ?auto_225164 ?auto_225161 ) ) ( not ( = ?auto_225164 ?auto_225162 ) ) ( not ( = ?auto_225166 ?auto_225158 ) ) ( not ( = ?auto_225166 ?auto_225161 ) ) ( not ( = ?auto_225166 ?auto_225162 ) ) ( not ( = ?auto_225166 ?auto_225164 ) ) ( ON_BOARD ?auto_225168 ?auto_225173 ) ( SUPPORTS ?auto_225168 ?auto_225159 ) ( not ( = ?auto_225158 ?auto_225169 ) ) ( CALIBRATION_TARGET ?auto_225168 ?auto_225169 ) ( not ( = ?auto_225169 ?auto_225162 ) ) ( ON_BOARD ?auto_225175 ?auto_225173 ) ( not ( = ?auto_225168 ?auto_225175 ) ) ( SUPPORTS ?auto_225175 ?auto_225163 ) ( CALIBRATION_TARGET ?auto_225175 ?auto_225169 ) ( not ( = ?auto_225169 ?auto_225164 ) ) ( ON_BOARD ?auto_225172 ?auto_225173 ) ( not ( = ?auto_225175 ?auto_225172 ) ) ( SUPPORTS ?auto_225172 ?auto_225165 ) ( CALIBRATION_TARGET ?auto_225172 ?auto_225169 ) ( not ( = ?auto_225169 ?auto_225166 ) ) ( ON_BOARD ?auto_225171 ?auto_225173 ) ( not ( = ?auto_225172 ?auto_225171 ) ) ( SUPPORTS ?auto_225171 ?auto_225167 ) ( CALIBRATION_TARGET ?auto_225171 ?auto_225169 ) ( not ( = ?auto_225169 ?auto_225161 ) ) ( ON_BOARD ?auto_225174 ?auto_225173 ) ( not ( = ?auto_225171 ?auto_225174 ) ) ( SUPPORTS ?auto_225174 ?auto_225160 ) ( CALIBRATION_TARGET ?auto_225174 ?auto_225169 ) ( POWER_AVAIL ?auto_225173 ) ( POINTING ?auto_225173 ?auto_225170 ) ( not ( = ?auto_225169 ?auto_225170 ) ) ( not ( = ?auto_225161 ?auto_225170 ) ) ( not ( = ?auto_225160 ?auto_225167 ) ) ( not ( = ?auto_225166 ?auto_225170 ) ) ( not ( = ?auto_225160 ?auto_225165 ) ) ( not ( = ?auto_225167 ?auto_225165 ) ) ( not ( = ?auto_225164 ?auto_225170 ) ) ( not ( = ?auto_225172 ?auto_225174 ) ) ( not ( = ?auto_225160 ?auto_225163 ) ) ( not ( = ?auto_225167 ?auto_225163 ) ) ( not ( = ?auto_225165 ?auto_225163 ) ) ( not ( = ?auto_225162 ?auto_225170 ) ) ( not ( = ?auto_225175 ?auto_225171 ) ) ( not ( = ?auto_225175 ?auto_225174 ) ) ( not ( = ?auto_225160 ?auto_225159 ) ) ( not ( = ?auto_225167 ?auto_225159 ) ) ( not ( = ?auto_225165 ?auto_225159 ) ) ( not ( = ?auto_225163 ?auto_225159 ) ) ( not ( = ?auto_225158 ?auto_225170 ) ) ( not ( = ?auto_225168 ?auto_225172 ) ) ( not ( = ?auto_225168 ?auto_225171 ) ) ( not ( = ?auto_225168 ?auto_225174 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_225161 ?auto_225160 ?auto_225166 ?auto_225167 ?auto_225164 ?auto_225165 ?auto_225158 ?auto_225159 ?auto_225162 ?auto_225163 )
      ( GET-5IMAGE-VERIFY ?auto_225158 ?auto_225159 ?auto_225161 ?auto_225160 ?auto_225162 ?auto_225163 ?auto_225164 ?auto_225165 ?auto_225166 ?auto_225167 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_226266 - DIRECTION
      ?auto_226267 - MODE
      ?auto_226269 - DIRECTION
      ?auto_226268 - MODE
      ?auto_226270 - DIRECTION
      ?auto_226271 - MODE
      ?auto_226272 - DIRECTION
      ?auto_226273 - MODE
      ?auto_226274 - DIRECTION
      ?auto_226275 - MODE
    )
    :vars
    (
      ?auto_226276 - INSTRUMENT
      ?auto_226281 - SATELLITE
      ?auto_226277 - DIRECTION
      ?auto_226283 - INSTRUMENT
      ?auto_226280 - INSTRUMENT
      ?auto_226279 - INSTRUMENT
      ?auto_226282 - INSTRUMENT
      ?auto_226278 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_226269 ?auto_226266 ) ) ( not ( = ?auto_226270 ?auto_226266 ) ) ( not ( = ?auto_226270 ?auto_226269 ) ) ( not ( = ?auto_226272 ?auto_226266 ) ) ( not ( = ?auto_226272 ?auto_226269 ) ) ( not ( = ?auto_226272 ?auto_226270 ) ) ( not ( = ?auto_226274 ?auto_226266 ) ) ( not ( = ?auto_226274 ?auto_226269 ) ) ( not ( = ?auto_226274 ?auto_226270 ) ) ( not ( = ?auto_226274 ?auto_226272 ) ) ( ON_BOARD ?auto_226276 ?auto_226281 ) ( SUPPORTS ?auto_226276 ?auto_226267 ) ( not ( = ?auto_226266 ?auto_226277 ) ) ( CALIBRATION_TARGET ?auto_226276 ?auto_226277 ) ( not ( = ?auto_226277 ?auto_226274 ) ) ( ON_BOARD ?auto_226283 ?auto_226281 ) ( not ( = ?auto_226276 ?auto_226283 ) ) ( SUPPORTS ?auto_226283 ?auto_226275 ) ( CALIBRATION_TARGET ?auto_226283 ?auto_226277 ) ( not ( = ?auto_226277 ?auto_226272 ) ) ( ON_BOARD ?auto_226280 ?auto_226281 ) ( not ( = ?auto_226283 ?auto_226280 ) ) ( SUPPORTS ?auto_226280 ?auto_226273 ) ( CALIBRATION_TARGET ?auto_226280 ?auto_226277 ) ( not ( = ?auto_226277 ?auto_226269 ) ) ( ON_BOARD ?auto_226279 ?auto_226281 ) ( not ( = ?auto_226280 ?auto_226279 ) ) ( SUPPORTS ?auto_226279 ?auto_226268 ) ( CALIBRATION_TARGET ?auto_226279 ?auto_226277 ) ( not ( = ?auto_226277 ?auto_226270 ) ) ( ON_BOARD ?auto_226282 ?auto_226281 ) ( not ( = ?auto_226279 ?auto_226282 ) ) ( SUPPORTS ?auto_226282 ?auto_226271 ) ( CALIBRATION_TARGET ?auto_226282 ?auto_226277 ) ( POWER_AVAIL ?auto_226281 ) ( POINTING ?auto_226281 ?auto_226278 ) ( not ( = ?auto_226277 ?auto_226278 ) ) ( not ( = ?auto_226270 ?auto_226278 ) ) ( not ( = ?auto_226271 ?auto_226268 ) ) ( not ( = ?auto_226269 ?auto_226278 ) ) ( not ( = ?auto_226271 ?auto_226273 ) ) ( not ( = ?auto_226268 ?auto_226273 ) ) ( not ( = ?auto_226272 ?auto_226278 ) ) ( not ( = ?auto_226280 ?auto_226282 ) ) ( not ( = ?auto_226271 ?auto_226275 ) ) ( not ( = ?auto_226268 ?auto_226275 ) ) ( not ( = ?auto_226273 ?auto_226275 ) ) ( not ( = ?auto_226274 ?auto_226278 ) ) ( not ( = ?auto_226283 ?auto_226279 ) ) ( not ( = ?auto_226283 ?auto_226282 ) ) ( not ( = ?auto_226271 ?auto_226267 ) ) ( not ( = ?auto_226268 ?auto_226267 ) ) ( not ( = ?auto_226273 ?auto_226267 ) ) ( not ( = ?auto_226275 ?auto_226267 ) ) ( not ( = ?auto_226266 ?auto_226278 ) ) ( not ( = ?auto_226276 ?auto_226280 ) ) ( not ( = ?auto_226276 ?auto_226279 ) ) ( not ( = ?auto_226276 ?auto_226282 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_226270 ?auto_226271 ?auto_226269 ?auto_226268 ?auto_226272 ?auto_226273 ?auto_226266 ?auto_226267 ?auto_226274 ?auto_226275 )
      ( GET-5IMAGE-VERIFY ?auto_226266 ?auto_226267 ?auto_226269 ?auto_226268 ?auto_226270 ?auto_226271 ?auto_226272 ?auto_226273 ?auto_226274 ?auto_226275 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_226344 - DIRECTION
      ?auto_226345 - MODE
      ?auto_226347 - DIRECTION
      ?auto_226346 - MODE
      ?auto_226348 - DIRECTION
      ?auto_226349 - MODE
      ?auto_226350 - DIRECTION
      ?auto_226351 - MODE
      ?auto_226352 - DIRECTION
      ?auto_226353 - MODE
    )
    :vars
    (
      ?auto_226354 - INSTRUMENT
      ?auto_226359 - SATELLITE
      ?auto_226355 - DIRECTION
      ?auto_226361 - INSTRUMENT
      ?auto_226358 - INSTRUMENT
      ?auto_226357 - INSTRUMENT
      ?auto_226360 - INSTRUMENT
      ?auto_226356 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_226347 ?auto_226344 ) ) ( not ( = ?auto_226348 ?auto_226344 ) ) ( not ( = ?auto_226348 ?auto_226347 ) ) ( not ( = ?auto_226350 ?auto_226344 ) ) ( not ( = ?auto_226350 ?auto_226347 ) ) ( not ( = ?auto_226350 ?auto_226348 ) ) ( not ( = ?auto_226352 ?auto_226344 ) ) ( not ( = ?auto_226352 ?auto_226347 ) ) ( not ( = ?auto_226352 ?auto_226348 ) ) ( not ( = ?auto_226352 ?auto_226350 ) ) ( ON_BOARD ?auto_226354 ?auto_226359 ) ( SUPPORTS ?auto_226354 ?auto_226345 ) ( not ( = ?auto_226344 ?auto_226355 ) ) ( CALIBRATION_TARGET ?auto_226354 ?auto_226355 ) ( not ( = ?auto_226355 ?auto_226350 ) ) ( ON_BOARD ?auto_226361 ?auto_226359 ) ( not ( = ?auto_226354 ?auto_226361 ) ) ( SUPPORTS ?auto_226361 ?auto_226351 ) ( CALIBRATION_TARGET ?auto_226361 ?auto_226355 ) ( not ( = ?auto_226355 ?auto_226352 ) ) ( ON_BOARD ?auto_226358 ?auto_226359 ) ( not ( = ?auto_226361 ?auto_226358 ) ) ( SUPPORTS ?auto_226358 ?auto_226353 ) ( CALIBRATION_TARGET ?auto_226358 ?auto_226355 ) ( not ( = ?auto_226355 ?auto_226347 ) ) ( ON_BOARD ?auto_226357 ?auto_226359 ) ( not ( = ?auto_226358 ?auto_226357 ) ) ( SUPPORTS ?auto_226357 ?auto_226346 ) ( CALIBRATION_TARGET ?auto_226357 ?auto_226355 ) ( not ( = ?auto_226355 ?auto_226348 ) ) ( ON_BOARD ?auto_226360 ?auto_226359 ) ( not ( = ?auto_226357 ?auto_226360 ) ) ( SUPPORTS ?auto_226360 ?auto_226349 ) ( CALIBRATION_TARGET ?auto_226360 ?auto_226355 ) ( POWER_AVAIL ?auto_226359 ) ( POINTING ?auto_226359 ?auto_226356 ) ( not ( = ?auto_226355 ?auto_226356 ) ) ( not ( = ?auto_226348 ?auto_226356 ) ) ( not ( = ?auto_226349 ?auto_226346 ) ) ( not ( = ?auto_226347 ?auto_226356 ) ) ( not ( = ?auto_226349 ?auto_226353 ) ) ( not ( = ?auto_226346 ?auto_226353 ) ) ( not ( = ?auto_226352 ?auto_226356 ) ) ( not ( = ?auto_226358 ?auto_226360 ) ) ( not ( = ?auto_226349 ?auto_226351 ) ) ( not ( = ?auto_226346 ?auto_226351 ) ) ( not ( = ?auto_226353 ?auto_226351 ) ) ( not ( = ?auto_226350 ?auto_226356 ) ) ( not ( = ?auto_226361 ?auto_226357 ) ) ( not ( = ?auto_226361 ?auto_226360 ) ) ( not ( = ?auto_226349 ?auto_226345 ) ) ( not ( = ?auto_226346 ?auto_226345 ) ) ( not ( = ?auto_226353 ?auto_226345 ) ) ( not ( = ?auto_226351 ?auto_226345 ) ) ( not ( = ?auto_226344 ?auto_226356 ) ) ( not ( = ?auto_226354 ?auto_226358 ) ) ( not ( = ?auto_226354 ?auto_226357 ) ) ( not ( = ?auto_226354 ?auto_226360 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_226348 ?auto_226349 ?auto_226347 ?auto_226346 ?auto_226352 ?auto_226353 ?auto_226344 ?auto_226345 ?auto_226350 ?auto_226351 )
      ( GET-5IMAGE-VERIFY ?auto_226344 ?auto_226345 ?auto_226347 ?auto_226346 ?auto_226348 ?auto_226349 ?auto_226350 ?auto_226351 ?auto_226352 ?auto_226353 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_227114 - DIRECTION
      ?auto_227115 - MODE
      ?auto_227117 - DIRECTION
      ?auto_227116 - MODE
      ?auto_227118 - DIRECTION
      ?auto_227119 - MODE
      ?auto_227120 - DIRECTION
      ?auto_227121 - MODE
      ?auto_227122 - DIRECTION
      ?auto_227123 - MODE
    )
    :vars
    (
      ?auto_227124 - INSTRUMENT
      ?auto_227129 - SATELLITE
      ?auto_227125 - DIRECTION
      ?auto_227131 - INSTRUMENT
      ?auto_227128 - INSTRUMENT
      ?auto_227127 - INSTRUMENT
      ?auto_227130 - INSTRUMENT
      ?auto_227126 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_227117 ?auto_227114 ) ) ( not ( = ?auto_227118 ?auto_227114 ) ) ( not ( = ?auto_227118 ?auto_227117 ) ) ( not ( = ?auto_227120 ?auto_227114 ) ) ( not ( = ?auto_227120 ?auto_227117 ) ) ( not ( = ?auto_227120 ?auto_227118 ) ) ( not ( = ?auto_227122 ?auto_227114 ) ) ( not ( = ?auto_227122 ?auto_227117 ) ) ( not ( = ?auto_227122 ?auto_227118 ) ) ( not ( = ?auto_227122 ?auto_227120 ) ) ( ON_BOARD ?auto_227124 ?auto_227129 ) ( SUPPORTS ?auto_227124 ?auto_227115 ) ( not ( = ?auto_227114 ?auto_227125 ) ) ( CALIBRATION_TARGET ?auto_227124 ?auto_227125 ) ( not ( = ?auto_227125 ?auto_227122 ) ) ( ON_BOARD ?auto_227131 ?auto_227129 ) ( not ( = ?auto_227124 ?auto_227131 ) ) ( SUPPORTS ?auto_227131 ?auto_227123 ) ( CALIBRATION_TARGET ?auto_227131 ?auto_227125 ) ( not ( = ?auto_227125 ?auto_227118 ) ) ( ON_BOARD ?auto_227128 ?auto_227129 ) ( not ( = ?auto_227131 ?auto_227128 ) ) ( SUPPORTS ?auto_227128 ?auto_227119 ) ( CALIBRATION_TARGET ?auto_227128 ?auto_227125 ) ( not ( = ?auto_227125 ?auto_227117 ) ) ( ON_BOARD ?auto_227127 ?auto_227129 ) ( not ( = ?auto_227128 ?auto_227127 ) ) ( SUPPORTS ?auto_227127 ?auto_227116 ) ( CALIBRATION_TARGET ?auto_227127 ?auto_227125 ) ( not ( = ?auto_227125 ?auto_227120 ) ) ( ON_BOARD ?auto_227130 ?auto_227129 ) ( not ( = ?auto_227127 ?auto_227130 ) ) ( SUPPORTS ?auto_227130 ?auto_227121 ) ( CALIBRATION_TARGET ?auto_227130 ?auto_227125 ) ( POWER_AVAIL ?auto_227129 ) ( POINTING ?auto_227129 ?auto_227126 ) ( not ( = ?auto_227125 ?auto_227126 ) ) ( not ( = ?auto_227120 ?auto_227126 ) ) ( not ( = ?auto_227121 ?auto_227116 ) ) ( not ( = ?auto_227117 ?auto_227126 ) ) ( not ( = ?auto_227121 ?auto_227119 ) ) ( not ( = ?auto_227116 ?auto_227119 ) ) ( not ( = ?auto_227118 ?auto_227126 ) ) ( not ( = ?auto_227128 ?auto_227130 ) ) ( not ( = ?auto_227121 ?auto_227123 ) ) ( not ( = ?auto_227116 ?auto_227123 ) ) ( not ( = ?auto_227119 ?auto_227123 ) ) ( not ( = ?auto_227122 ?auto_227126 ) ) ( not ( = ?auto_227131 ?auto_227127 ) ) ( not ( = ?auto_227131 ?auto_227130 ) ) ( not ( = ?auto_227121 ?auto_227115 ) ) ( not ( = ?auto_227116 ?auto_227115 ) ) ( not ( = ?auto_227119 ?auto_227115 ) ) ( not ( = ?auto_227123 ?auto_227115 ) ) ( not ( = ?auto_227114 ?auto_227126 ) ) ( not ( = ?auto_227124 ?auto_227128 ) ) ( not ( = ?auto_227124 ?auto_227127 ) ) ( not ( = ?auto_227124 ?auto_227130 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_227120 ?auto_227121 ?auto_227117 ?auto_227116 ?auto_227118 ?auto_227119 ?auto_227114 ?auto_227115 ?auto_227122 ?auto_227123 )
      ( GET-5IMAGE-VERIFY ?auto_227114 ?auto_227115 ?auto_227117 ?auto_227116 ?auto_227118 ?auto_227119 ?auto_227120 ?auto_227121 ?auto_227122 ?auto_227123 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_227364 - DIRECTION
      ?auto_227365 - MODE
      ?auto_227367 - DIRECTION
      ?auto_227366 - MODE
      ?auto_227368 - DIRECTION
      ?auto_227369 - MODE
      ?auto_227370 - DIRECTION
      ?auto_227371 - MODE
      ?auto_227372 - DIRECTION
      ?auto_227373 - MODE
    )
    :vars
    (
      ?auto_227374 - INSTRUMENT
      ?auto_227379 - SATELLITE
      ?auto_227375 - DIRECTION
      ?auto_227381 - INSTRUMENT
      ?auto_227378 - INSTRUMENT
      ?auto_227377 - INSTRUMENT
      ?auto_227380 - INSTRUMENT
      ?auto_227376 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_227367 ?auto_227364 ) ) ( not ( = ?auto_227368 ?auto_227364 ) ) ( not ( = ?auto_227368 ?auto_227367 ) ) ( not ( = ?auto_227370 ?auto_227364 ) ) ( not ( = ?auto_227370 ?auto_227367 ) ) ( not ( = ?auto_227370 ?auto_227368 ) ) ( not ( = ?auto_227372 ?auto_227364 ) ) ( not ( = ?auto_227372 ?auto_227367 ) ) ( not ( = ?auto_227372 ?auto_227368 ) ) ( not ( = ?auto_227372 ?auto_227370 ) ) ( ON_BOARD ?auto_227374 ?auto_227379 ) ( SUPPORTS ?auto_227374 ?auto_227365 ) ( not ( = ?auto_227364 ?auto_227375 ) ) ( CALIBRATION_TARGET ?auto_227374 ?auto_227375 ) ( not ( = ?auto_227375 ?auto_227370 ) ) ( ON_BOARD ?auto_227381 ?auto_227379 ) ( not ( = ?auto_227374 ?auto_227381 ) ) ( SUPPORTS ?auto_227381 ?auto_227371 ) ( CALIBRATION_TARGET ?auto_227381 ?auto_227375 ) ( not ( = ?auto_227375 ?auto_227368 ) ) ( ON_BOARD ?auto_227378 ?auto_227379 ) ( not ( = ?auto_227381 ?auto_227378 ) ) ( SUPPORTS ?auto_227378 ?auto_227369 ) ( CALIBRATION_TARGET ?auto_227378 ?auto_227375 ) ( not ( = ?auto_227375 ?auto_227367 ) ) ( ON_BOARD ?auto_227377 ?auto_227379 ) ( not ( = ?auto_227378 ?auto_227377 ) ) ( SUPPORTS ?auto_227377 ?auto_227366 ) ( CALIBRATION_TARGET ?auto_227377 ?auto_227375 ) ( not ( = ?auto_227375 ?auto_227372 ) ) ( ON_BOARD ?auto_227380 ?auto_227379 ) ( not ( = ?auto_227377 ?auto_227380 ) ) ( SUPPORTS ?auto_227380 ?auto_227373 ) ( CALIBRATION_TARGET ?auto_227380 ?auto_227375 ) ( POWER_AVAIL ?auto_227379 ) ( POINTING ?auto_227379 ?auto_227376 ) ( not ( = ?auto_227375 ?auto_227376 ) ) ( not ( = ?auto_227372 ?auto_227376 ) ) ( not ( = ?auto_227373 ?auto_227366 ) ) ( not ( = ?auto_227367 ?auto_227376 ) ) ( not ( = ?auto_227373 ?auto_227369 ) ) ( not ( = ?auto_227366 ?auto_227369 ) ) ( not ( = ?auto_227368 ?auto_227376 ) ) ( not ( = ?auto_227378 ?auto_227380 ) ) ( not ( = ?auto_227373 ?auto_227371 ) ) ( not ( = ?auto_227366 ?auto_227371 ) ) ( not ( = ?auto_227369 ?auto_227371 ) ) ( not ( = ?auto_227370 ?auto_227376 ) ) ( not ( = ?auto_227381 ?auto_227377 ) ) ( not ( = ?auto_227381 ?auto_227380 ) ) ( not ( = ?auto_227373 ?auto_227365 ) ) ( not ( = ?auto_227366 ?auto_227365 ) ) ( not ( = ?auto_227369 ?auto_227365 ) ) ( not ( = ?auto_227371 ?auto_227365 ) ) ( not ( = ?auto_227364 ?auto_227376 ) ) ( not ( = ?auto_227374 ?auto_227378 ) ) ( not ( = ?auto_227374 ?auto_227377 ) ) ( not ( = ?auto_227374 ?auto_227380 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_227372 ?auto_227373 ?auto_227367 ?auto_227366 ?auto_227368 ?auto_227369 ?auto_227364 ?auto_227365 ?auto_227370 ?auto_227371 )
      ( GET-5IMAGE-VERIFY ?auto_227364 ?auto_227365 ?auto_227367 ?auto_227366 ?auto_227368 ?auto_227369 ?auto_227370 ?auto_227371 ?auto_227372 ?auto_227373 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_227608 - DIRECTION
      ?auto_227609 - MODE
      ?auto_227611 - DIRECTION
      ?auto_227610 - MODE
      ?auto_227612 - DIRECTION
      ?auto_227613 - MODE
      ?auto_227614 - DIRECTION
      ?auto_227615 - MODE
      ?auto_227616 - DIRECTION
      ?auto_227617 - MODE
    )
    :vars
    (
      ?auto_227618 - INSTRUMENT
      ?auto_227623 - SATELLITE
      ?auto_227619 - DIRECTION
      ?auto_227625 - INSTRUMENT
      ?auto_227622 - INSTRUMENT
      ?auto_227621 - INSTRUMENT
      ?auto_227624 - INSTRUMENT
      ?auto_227620 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_227611 ?auto_227608 ) ) ( not ( = ?auto_227612 ?auto_227608 ) ) ( not ( = ?auto_227612 ?auto_227611 ) ) ( not ( = ?auto_227614 ?auto_227608 ) ) ( not ( = ?auto_227614 ?auto_227611 ) ) ( not ( = ?auto_227614 ?auto_227612 ) ) ( not ( = ?auto_227616 ?auto_227608 ) ) ( not ( = ?auto_227616 ?auto_227611 ) ) ( not ( = ?auto_227616 ?auto_227612 ) ) ( not ( = ?auto_227616 ?auto_227614 ) ) ( ON_BOARD ?auto_227618 ?auto_227623 ) ( SUPPORTS ?auto_227618 ?auto_227609 ) ( not ( = ?auto_227608 ?auto_227619 ) ) ( CALIBRATION_TARGET ?auto_227618 ?auto_227619 ) ( not ( = ?auto_227619 ?auto_227612 ) ) ( ON_BOARD ?auto_227625 ?auto_227623 ) ( not ( = ?auto_227618 ?auto_227625 ) ) ( SUPPORTS ?auto_227625 ?auto_227613 ) ( CALIBRATION_TARGET ?auto_227625 ?auto_227619 ) ( not ( = ?auto_227619 ?auto_227616 ) ) ( ON_BOARD ?auto_227622 ?auto_227623 ) ( not ( = ?auto_227625 ?auto_227622 ) ) ( SUPPORTS ?auto_227622 ?auto_227617 ) ( CALIBRATION_TARGET ?auto_227622 ?auto_227619 ) ( not ( = ?auto_227619 ?auto_227611 ) ) ( ON_BOARD ?auto_227621 ?auto_227623 ) ( not ( = ?auto_227622 ?auto_227621 ) ) ( SUPPORTS ?auto_227621 ?auto_227610 ) ( CALIBRATION_TARGET ?auto_227621 ?auto_227619 ) ( not ( = ?auto_227619 ?auto_227614 ) ) ( ON_BOARD ?auto_227624 ?auto_227623 ) ( not ( = ?auto_227621 ?auto_227624 ) ) ( SUPPORTS ?auto_227624 ?auto_227615 ) ( CALIBRATION_TARGET ?auto_227624 ?auto_227619 ) ( POWER_AVAIL ?auto_227623 ) ( POINTING ?auto_227623 ?auto_227620 ) ( not ( = ?auto_227619 ?auto_227620 ) ) ( not ( = ?auto_227614 ?auto_227620 ) ) ( not ( = ?auto_227615 ?auto_227610 ) ) ( not ( = ?auto_227611 ?auto_227620 ) ) ( not ( = ?auto_227615 ?auto_227617 ) ) ( not ( = ?auto_227610 ?auto_227617 ) ) ( not ( = ?auto_227616 ?auto_227620 ) ) ( not ( = ?auto_227622 ?auto_227624 ) ) ( not ( = ?auto_227615 ?auto_227613 ) ) ( not ( = ?auto_227610 ?auto_227613 ) ) ( not ( = ?auto_227617 ?auto_227613 ) ) ( not ( = ?auto_227612 ?auto_227620 ) ) ( not ( = ?auto_227625 ?auto_227621 ) ) ( not ( = ?auto_227625 ?auto_227624 ) ) ( not ( = ?auto_227615 ?auto_227609 ) ) ( not ( = ?auto_227610 ?auto_227609 ) ) ( not ( = ?auto_227617 ?auto_227609 ) ) ( not ( = ?auto_227613 ?auto_227609 ) ) ( not ( = ?auto_227608 ?auto_227620 ) ) ( not ( = ?auto_227618 ?auto_227622 ) ) ( not ( = ?auto_227618 ?auto_227621 ) ) ( not ( = ?auto_227618 ?auto_227624 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_227614 ?auto_227615 ?auto_227611 ?auto_227610 ?auto_227616 ?auto_227617 ?auto_227608 ?auto_227609 ?auto_227612 ?auto_227613 )
      ( GET-5IMAGE-VERIFY ?auto_227608 ?auto_227609 ?auto_227611 ?auto_227610 ?auto_227612 ?auto_227613 ?auto_227614 ?auto_227615 ?auto_227616 ?auto_227617 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_227772 - DIRECTION
      ?auto_227773 - MODE
      ?auto_227775 - DIRECTION
      ?auto_227774 - MODE
      ?auto_227776 - DIRECTION
      ?auto_227777 - MODE
      ?auto_227778 - DIRECTION
      ?auto_227779 - MODE
      ?auto_227780 - DIRECTION
      ?auto_227781 - MODE
    )
    :vars
    (
      ?auto_227782 - INSTRUMENT
      ?auto_227787 - SATELLITE
      ?auto_227783 - DIRECTION
      ?auto_227789 - INSTRUMENT
      ?auto_227786 - INSTRUMENT
      ?auto_227785 - INSTRUMENT
      ?auto_227788 - INSTRUMENT
      ?auto_227784 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_227775 ?auto_227772 ) ) ( not ( = ?auto_227776 ?auto_227772 ) ) ( not ( = ?auto_227776 ?auto_227775 ) ) ( not ( = ?auto_227778 ?auto_227772 ) ) ( not ( = ?auto_227778 ?auto_227775 ) ) ( not ( = ?auto_227778 ?auto_227776 ) ) ( not ( = ?auto_227780 ?auto_227772 ) ) ( not ( = ?auto_227780 ?auto_227775 ) ) ( not ( = ?auto_227780 ?auto_227776 ) ) ( not ( = ?auto_227780 ?auto_227778 ) ) ( ON_BOARD ?auto_227782 ?auto_227787 ) ( SUPPORTS ?auto_227782 ?auto_227773 ) ( not ( = ?auto_227772 ?auto_227783 ) ) ( CALIBRATION_TARGET ?auto_227782 ?auto_227783 ) ( not ( = ?auto_227783 ?auto_227776 ) ) ( ON_BOARD ?auto_227789 ?auto_227787 ) ( not ( = ?auto_227782 ?auto_227789 ) ) ( SUPPORTS ?auto_227789 ?auto_227777 ) ( CALIBRATION_TARGET ?auto_227789 ?auto_227783 ) ( not ( = ?auto_227783 ?auto_227778 ) ) ( ON_BOARD ?auto_227786 ?auto_227787 ) ( not ( = ?auto_227789 ?auto_227786 ) ) ( SUPPORTS ?auto_227786 ?auto_227779 ) ( CALIBRATION_TARGET ?auto_227786 ?auto_227783 ) ( not ( = ?auto_227783 ?auto_227775 ) ) ( ON_BOARD ?auto_227785 ?auto_227787 ) ( not ( = ?auto_227786 ?auto_227785 ) ) ( SUPPORTS ?auto_227785 ?auto_227774 ) ( CALIBRATION_TARGET ?auto_227785 ?auto_227783 ) ( not ( = ?auto_227783 ?auto_227780 ) ) ( ON_BOARD ?auto_227788 ?auto_227787 ) ( not ( = ?auto_227785 ?auto_227788 ) ) ( SUPPORTS ?auto_227788 ?auto_227781 ) ( CALIBRATION_TARGET ?auto_227788 ?auto_227783 ) ( POWER_AVAIL ?auto_227787 ) ( POINTING ?auto_227787 ?auto_227784 ) ( not ( = ?auto_227783 ?auto_227784 ) ) ( not ( = ?auto_227780 ?auto_227784 ) ) ( not ( = ?auto_227781 ?auto_227774 ) ) ( not ( = ?auto_227775 ?auto_227784 ) ) ( not ( = ?auto_227781 ?auto_227779 ) ) ( not ( = ?auto_227774 ?auto_227779 ) ) ( not ( = ?auto_227778 ?auto_227784 ) ) ( not ( = ?auto_227786 ?auto_227788 ) ) ( not ( = ?auto_227781 ?auto_227777 ) ) ( not ( = ?auto_227774 ?auto_227777 ) ) ( not ( = ?auto_227779 ?auto_227777 ) ) ( not ( = ?auto_227776 ?auto_227784 ) ) ( not ( = ?auto_227789 ?auto_227785 ) ) ( not ( = ?auto_227789 ?auto_227788 ) ) ( not ( = ?auto_227781 ?auto_227773 ) ) ( not ( = ?auto_227774 ?auto_227773 ) ) ( not ( = ?auto_227779 ?auto_227773 ) ) ( not ( = ?auto_227777 ?auto_227773 ) ) ( not ( = ?auto_227772 ?auto_227784 ) ) ( not ( = ?auto_227782 ?auto_227786 ) ) ( not ( = ?auto_227782 ?auto_227785 ) ) ( not ( = ?auto_227782 ?auto_227788 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_227780 ?auto_227781 ?auto_227775 ?auto_227774 ?auto_227778 ?auto_227779 ?auto_227772 ?auto_227773 ?auto_227776 ?auto_227777 )
      ( GET-5IMAGE-VERIFY ?auto_227772 ?auto_227773 ?auto_227775 ?auto_227774 ?auto_227776 ?auto_227777 ?auto_227778 ?auto_227779 ?auto_227780 ?auto_227781 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_228794 - DIRECTION
      ?auto_228795 - MODE
      ?auto_228797 - DIRECTION
      ?auto_228796 - MODE
      ?auto_228798 - DIRECTION
      ?auto_228799 - MODE
      ?auto_228800 - DIRECTION
      ?auto_228801 - MODE
      ?auto_228802 - DIRECTION
      ?auto_228803 - MODE
    )
    :vars
    (
      ?auto_228804 - INSTRUMENT
      ?auto_228809 - SATELLITE
      ?auto_228805 - DIRECTION
      ?auto_228811 - INSTRUMENT
      ?auto_228808 - INSTRUMENT
      ?auto_228807 - INSTRUMENT
      ?auto_228810 - INSTRUMENT
      ?auto_228806 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_228797 ?auto_228794 ) ) ( not ( = ?auto_228798 ?auto_228794 ) ) ( not ( = ?auto_228798 ?auto_228797 ) ) ( not ( = ?auto_228800 ?auto_228794 ) ) ( not ( = ?auto_228800 ?auto_228797 ) ) ( not ( = ?auto_228800 ?auto_228798 ) ) ( not ( = ?auto_228802 ?auto_228794 ) ) ( not ( = ?auto_228802 ?auto_228797 ) ) ( not ( = ?auto_228802 ?auto_228798 ) ) ( not ( = ?auto_228802 ?auto_228800 ) ) ( ON_BOARD ?auto_228804 ?auto_228809 ) ( SUPPORTS ?auto_228804 ?auto_228795 ) ( not ( = ?auto_228794 ?auto_228805 ) ) ( CALIBRATION_TARGET ?auto_228804 ?auto_228805 ) ( not ( = ?auto_228805 ?auto_228802 ) ) ( ON_BOARD ?auto_228811 ?auto_228809 ) ( not ( = ?auto_228804 ?auto_228811 ) ) ( SUPPORTS ?auto_228811 ?auto_228803 ) ( CALIBRATION_TARGET ?auto_228811 ?auto_228805 ) ( not ( = ?auto_228805 ?auto_228797 ) ) ( ON_BOARD ?auto_228808 ?auto_228809 ) ( not ( = ?auto_228811 ?auto_228808 ) ) ( SUPPORTS ?auto_228808 ?auto_228796 ) ( CALIBRATION_TARGET ?auto_228808 ?auto_228805 ) ( not ( = ?auto_228805 ?auto_228800 ) ) ( ON_BOARD ?auto_228807 ?auto_228809 ) ( not ( = ?auto_228808 ?auto_228807 ) ) ( SUPPORTS ?auto_228807 ?auto_228801 ) ( CALIBRATION_TARGET ?auto_228807 ?auto_228805 ) ( not ( = ?auto_228805 ?auto_228798 ) ) ( ON_BOARD ?auto_228810 ?auto_228809 ) ( not ( = ?auto_228807 ?auto_228810 ) ) ( SUPPORTS ?auto_228810 ?auto_228799 ) ( CALIBRATION_TARGET ?auto_228810 ?auto_228805 ) ( POWER_AVAIL ?auto_228809 ) ( POINTING ?auto_228809 ?auto_228806 ) ( not ( = ?auto_228805 ?auto_228806 ) ) ( not ( = ?auto_228798 ?auto_228806 ) ) ( not ( = ?auto_228799 ?auto_228801 ) ) ( not ( = ?auto_228800 ?auto_228806 ) ) ( not ( = ?auto_228799 ?auto_228796 ) ) ( not ( = ?auto_228801 ?auto_228796 ) ) ( not ( = ?auto_228797 ?auto_228806 ) ) ( not ( = ?auto_228808 ?auto_228810 ) ) ( not ( = ?auto_228799 ?auto_228803 ) ) ( not ( = ?auto_228801 ?auto_228803 ) ) ( not ( = ?auto_228796 ?auto_228803 ) ) ( not ( = ?auto_228802 ?auto_228806 ) ) ( not ( = ?auto_228811 ?auto_228807 ) ) ( not ( = ?auto_228811 ?auto_228810 ) ) ( not ( = ?auto_228799 ?auto_228795 ) ) ( not ( = ?auto_228801 ?auto_228795 ) ) ( not ( = ?auto_228796 ?auto_228795 ) ) ( not ( = ?auto_228803 ?auto_228795 ) ) ( not ( = ?auto_228794 ?auto_228806 ) ) ( not ( = ?auto_228804 ?auto_228808 ) ) ( not ( = ?auto_228804 ?auto_228807 ) ) ( not ( = ?auto_228804 ?auto_228810 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_228798 ?auto_228799 ?auto_228800 ?auto_228801 ?auto_228797 ?auto_228796 ?auto_228794 ?auto_228795 ?auto_228802 ?auto_228803 )
      ( GET-5IMAGE-VERIFY ?auto_228794 ?auto_228795 ?auto_228797 ?auto_228796 ?auto_228798 ?auto_228799 ?auto_228800 ?auto_228801 ?auto_228802 ?auto_228803 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_228958 - DIRECTION
      ?auto_228959 - MODE
      ?auto_228961 - DIRECTION
      ?auto_228960 - MODE
      ?auto_228962 - DIRECTION
      ?auto_228963 - MODE
      ?auto_228964 - DIRECTION
      ?auto_228965 - MODE
      ?auto_228966 - DIRECTION
      ?auto_228967 - MODE
    )
    :vars
    (
      ?auto_228968 - INSTRUMENT
      ?auto_228973 - SATELLITE
      ?auto_228969 - DIRECTION
      ?auto_228975 - INSTRUMENT
      ?auto_228972 - INSTRUMENT
      ?auto_228971 - INSTRUMENT
      ?auto_228974 - INSTRUMENT
      ?auto_228970 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_228961 ?auto_228958 ) ) ( not ( = ?auto_228962 ?auto_228958 ) ) ( not ( = ?auto_228962 ?auto_228961 ) ) ( not ( = ?auto_228964 ?auto_228958 ) ) ( not ( = ?auto_228964 ?auto_228961 ) ) ( not ( = ?auto_228964 ?auto_228962 ) ) ( not ( = ?auto_228966 ?auto_228958 ) ) ( not ( = ?auto_228966 ?auto_228961 ) ) ( not ( = ?auto_228966 ?auto_228962 ) ) ( not ( = ?auto_228966 ?auto_228964 ) ) ( ON_BOARD ?auto_228968 ?auto_228973 ) ( SUPPORTS ?auto_228968 ?auto_228959 ) ( not ( = ?auto_228958 ?auto_228969 ) ) ( CALIBRATION_TARGET ?auto_228968 ?auto_228969 ) ( not ( = ?auto_228969 ?auto_228964 ) ) ( ON_BOARD ?auto_228975 ?auto_228973 ) ( not ( = ?auto_228968 ?auto_228975 ) ) ( SUPPORTS ?auto_228975 ?auto_228965 ) ( CALIBRATION_TARGET ?auto_228975 ?auto_228969 ) ( not ( = ?auto_228969 ?auto_228961 ) ) ( ON_BOARD ?auto_228972 ?auto_228973 ) ( not ( = ?auto_228975 ?auto_228972 ) ) ( SUPPORTS ?auto_228972 ?auto_228960 ) ( CALIBRATION_TARGET ?auto_228972 ?auto_228969 ) ( not ( = ?auto_228969 ?auto_228966 ) ) ( ON_BOARD ?auto_228971 ?auto_228973 ) ( not ( = ?auto_228972 ?auto_228971 ) ) ( SUPPORTS ?auto_228971 ?auto_228967 ) ( CALIBRATION_TARGET ?auto_228971 ?auto_228969 ) ( not ( = ?auto_228969 ?auto_228962 ) ) ( ON_BOARD ?auto_228974 ?auto_228973 ) ( not ( = ?auto_228971 ?auto_228974 ) ) ( SUPPORTS ?auto_228974 ?auto_228963 ) ( CALIBRATION_TARGET ?auto_228974 ?auto_228969 ) ( POWER_AVAIL ?auto_228973 ) ( POINTING ?auto_228973 ?auto_228970 ) ( not ( = ?auto_228969 ?auto_228970 ) ) ( not ( = ?auto_228962 ?auto_228970 ) ) ( not ( = ?auto_228963 ?auto_228967 ) ) ( not ( = ?auto_228966 ?auto_228970 ) ) ( not ( = ?auto_228963 ?auto_228960 ) ) ( not ( = ?auto_228967 ?auto_228960 ) ) ( not ( = ?auto_228961 ?auto_228970 ) ) ( not ( = ?auto_228972 ?auto_228974 ) ) ( not ( = ?auto_228963 ?auto_228965 ) ) ( not ( = ?auto_228967 ?auto_228965 ) ) ( not ( = ?auto_228960 ?auto_228965 ) ) ( not ( = ?auto_228964 ?auto_228970 ) ) ( not ( = ?auto_228975 ?auto_228971 ) ) ( not ( = ?auto_228975 ?auto_228974 ) ) ( not ( = ?auto_228963 ?auto_228959 ) ) ( not ( = ?auto_228967 ?auto_228959 ) ) ( not ( = ?auto_228960 ?auto_228959 ) ) ( not ( = ?auto_228965 ?auto_228959 ) ) ( not ( = ?auto_228958 ?auto_228970 ) ) ( not ( = ?auto_228968 ?auto_228972 ) ) ( not ( = ?auto_228968 ?auto_228971 ) ) ( not ( = ?auto_228968 ?auto_228974 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_228962 ?auto_228963 ?auto_228966 ?auto_228967 ?auto_228961 ?auto_228960 ?auto_228958 ?auto_228959 ?auto_228964 ?auto_228965 )
      ( GET-5IMAGE-VERIFY ?auto_228958 ?auto_228959 ?auto_228961 ?auto_228960 ?auto_228962 ?auto_228963 ?auto_228964 ?auto_228965 ?auto_228966 ?auto_228967 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_229202 - DIRECTION
      ?auto_229203 - MODE
      ?auto_229205 - DIRECTION
      ?auto_229204 - MODE
      ?auto_229206 - DIRECTION
      ?auto_229207 - MODE
      ?auto_229208 - DIRECTION
      ?auto_229209 - MODE
      ?auto_229210 - DIRECTION
      ?auto_229211 - MODE
    )
    :vars
    (
      ?auto_229212 - INSTRUMENT
      ?auto_229217 - SATELLITE
      ?auto_229213 - DIRECTION
      ?auto_229219 - INSTRUMENT
      ?auto_229216 - INSTRUMENT
      ?auto_229215 - INSTRUMENT
      ?auto_229218 - INSTRUMENT
      ?auto_229214 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_229205 ?auto_229202 ) ) ( not ( = ?auto_229206 ?auto_229202 ) ) ( not ( = ?auto_229206 ?auto_229205 ) ) ( not ( = ?auto_229208 ?auto_229202 ) ) ( not ( = ?auto_229208 ?auto_229205 ) ) ( not ( = ?auto_229208 ?auto_229206 ) ) ( not ( = ?auto_229210 ?auto_229202 ) ) ( not ( = ?auto_229210 ?auto_229205 ) ) ( not ( = ?auto_229210 ?auto_229206 ) ) ( not ( = ?auto_229210 ?auto_229208 ) ) ( ON_BOARD ?auto_229212 ?auto_229217 ) ( SUPPORTS ?auto_229212 ?auto_229203 ) ( not ( = ?auto_229202 ?auto_229213 ) ) ( CALIBRATION_TARGET ?auto_229212 ?auto_229213 ) ( not ( = ?auto_229213 ?auto_229210 ) ) ( ON_BOARD ?auto_229219 ?auto_229217 ) ( not ( = ?auto_229212 ?auto_229219 ) ) ( SUPPORTS ?auto_229219 ?auto_229211 ) ( CALIBRATION_TARGET ?auto_229219 ?auto_229213 ) ( not ( = ?auto_229213 ?auto_229205 ) ) ( ON_BOARD ?auto_229216 ?auto_229217 ) ( not ( = ?auto_229219 ?auto_229216 ) ) ( SUPPORTS ?auto_229216 ?auto_229204 ) ( CALIBRATION_TARGET ?auto_229216 ?auto_229213 ) ( not ( = ?auto_229213 ?auto_229206 ) ) ( ON_BOARD ?auto_229215 ?auto_229217 ) ( not ( = ?auto_229216 ?auto_229215 ) ) ( SUPPORTS ?auto_229215 ?auto_229207 ) ( CALIBRATION_TARGET ?auto_229215 ?auto_229213 ) ( not ( = ?auto_229213 ?auto_229208 ) ) ( ON_BOARD ?auto_229218 ?auto_229217 ) ( not ( = ?auto_229215 ?auto_229218 ) ) ( SUPPORTS ?auto_229218 ?auto_229209 ) ( CALIBRATION_TARGET ?auto_229218 ?auto_229213 ) ( POWER_AVAIL ?auto_229217 ) ( POINTING ?auto_229217 ?auto_229214 ) ( not ( = ?auto_229213 ?auto_229214 ) ) ( not ( = ?auto_229208 ?auto_229214 ) ) ( not ( = ?auto_229209 ?auto_229207 ) ) ( not ( = ?auto_229206 ?auto_229214 ) ) ( not ( = ?auto_229209 ?auto_229204 ) ) ( not ( = ?auto_229207 ?auto_229204 ) ) ( not ( = ?auto_229205 ?auto_229214 ) ) ( not ( = ?auto_229216 ?auto_229218 ) ) ( not ( = ?auto_229209 ?auto_229211 ) ) ( not ( = ?auto_229207 ?auto_229211 ) ) ( not ( = ?auto_229204 ?auto_229211 ) ) ( not ( = ?auto_229210 ?auto_229214 ) ) ( not ( = ?auto_229219 ?auto_229215 ) ) ( not ( = ?auto_229219 ?auto_229218 ) ) ( not ( = ?auto_229209 ?auto_229203 ) ) ( not ( = ?auto_229207 ?auto_229203 ) ) ( not ( = ?auto_229204 ?auto_229203 ) ) ( not ( = ?auto_229211 ?auto_229203 ) ) ( not ( = ?auto_229202 ?auto_229214 ) ) ( not ( = ?auto_229212 ?auto_229216 ) ) ( not ( = ?auto_229212 ?auto_229215 ) ) ( not ( = ?auto_229212 ?auto_229218 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_229208 ?auto_229209 ?auto_229206 ?auto_229207 ?auto_229205 ?auto_229204 ?auto_229202 ?auto_229203 ?auto_229210 ?auto_229211 )
      ( GET-5IMAGE-VERIFY ?auto_229202 ?auto_229203 ?auto_229205 ?auto_229204 ?auto_229206 ?auto_229207 ?auto_229208 ?auto_229209 ?auto_229210 ?auto_229211 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_229452 - DIRECTION
      ?auto_229453 - MODE
      ?auto_229455 - DIRECTION
      ?auto_229454 - MODE
      ?auto_229456 - DIRECTION
      ?auto_229457 - MODE
      ?auto_229458 - DIRECTION
      ?auto_229459 - MODE
      ?auto_229460 - DIRECTION
      ?auto_229461 - MODE
    )
    :vars
    (
      ?auto_229462 - INSTRUMENT
      ?auto_229467 - SATELLITE
      ?auto_229463 - DIRECTION
      ?auto_229469 - INSTRUMENT
      ?auto_229466 - INSTRUMENT
      ?auto_229465 - INSTRUMENT
      ?auto_229468 - INSTRUMENT
      ?auto_229464 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_229455 ?auto_229452 ) ) ( not ( = ?auto_229456 ?auto_229452 ) ) ( not ( = ?auto_229456 ?auto_229455 ) ) ( not ( = ?auto_229458 ?auto_229452 ) ) ( not ( = ?auto_229458 ?auto_229455 ) ) ( not ( = ?auto_229458 ?auto_229456 ) ) ( not ( = ?auto_229460 ?auto_229452 ) ) ( not ( = ?auto_229460 ?auto_229455 ) ) ( not ( = ?auto_229460 ?auto_229456 ) ) ( not ( = ?auto_229460 ?auto_229458 ) ) ( ON_BOARD ?auto_229462 ?auto_229467 ) ( SUPPORTS ?auto_229462 ?auto_229453 ) ( not ( = ?auto_229452 ?auto_229463 ) ) ( CALIBRATION_TARGET ?auto_229462 ?auto_229463 ) ( not ( = ?auto_229463 ?auto_229458 ) ) ( ON_BOARD ?auto_229469 ?auto_229467 ) ( not ( = ?auto_229462 ?auto_229469 ) ) ( SUPPORTS ?auto_229469 ?auto_229459 ) ( CALIBRATION_TARGET ?auto_229469 ?auto_229463 ) ( not ( = ?auto_229463 ?auto_229455 ) ) ( ON_BOARD ?auto_229466 ?auto_229467 ) ( not ( = ?auto_229469 ?auto_229466 ) ) ( SUPPORTS ?auto_229466 ?auto_229454 ) ( CALIBRATION_TARGET ?auto_229466 ?auto_229463 ) ( not ( = ?auto_229463 ?auto_229456 ) ) ( ON_BOARD ?auto_229465 ?auto_229467 ) ( not ( = ?auto_229466 ?auto_229465 ) ) ( SUPPORTS ?auto_229465 ?auto_229457 ) ( CALIBRATION_TARGET ?auto_229465 ?auto_229463 ) ( not ( = ?auto_229463 ?auto_229460 ) ) ( ON_BOARD ?auto_229468 ?auto_229467 ) ( not ( = ?auto_229465 ?auto_229468 ) ) ( SUPPORTS ?auto_229468 ?auto_229461 ) ( CALIBRATION_TARGET ?auto_229468 ?auto_229463 ) ( POWER_AVAIL ?auto_229467 ) ( POINTING ?auto_229467 ?auto_229464 ) ( not ( = ?auto_229463 ?auto_229464 ) ) ( not ( = ?auto_229460 ?auto_229464 ) ) ( not ( = ?auto_229461 ?auto_229457 ) ) ( not ( = ?auto_229456 ?auto_229464 ) ) ( not ( = ?auto_229461 ?auto_229454 ) ) ( not ( = ?auto_229457 ?auto_229454 ) ) ( not ( = ?auto_229455 ?auto_229464 ) ) ( not ( = ?auto_229466 ?auto_229468 ) ) ( not ( = ?auto_229461 ?auto_229459 ) ) ( not ( = ?auto_229457 ?auto_229459 ) ) ( not ( = ?auto_229454 ?auto_229459 ) ) ( not ( = ?auto_229458 ?auto_229464 ) ) ( not ( = ?auto_229469 ?auto_229465 ) ) ( not ( = ?auto_229469 ?auto_229468 ) ) ( not ( = ?auto_229461 ?auto_229453 ) ) ( not ( = ?auto_229457 ?auto_229453 ) ) ( not ( = ?auto_229454 ?auto_229453 ) ) ( not ( = ?auto_229459 ?auto_229453 ) ) ( not ( = ?auto_229452 ?auto_229464 ) ) ( not ( = ?auto_229462 ?auto_229466 ) ) ( not ( = ?auto_229462 ?auto_229465 ) ) ( not ( = ?auto_229462 ?auto_229468 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_229460 ?auto_229461 ?auto_229456 ?auto_229457 ?auto_229455 ?auto_229454 ?auto_229452 ?auto_229453 ?auto_229458 ?auto_229459 )
      ( GET-5IMAGE-VERIFY ?auto_229452 ?auto_229453 ?auto_229455 ?auto_229454 ?auto_229456 ?auto_229457 ?auto_229458 ?auto_229459 ?auto_229460 ?auto_229461 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_230222 - DIRECTION
      ?auto_230223 - MODE
      ?auto_230225 - DIRECTION
      ?auto_230224 - MODE
      ?auto_230226 - DIRECTION
      ?auto_230227 - MODE
      ?auto_230228 - DIRECTION
      ?auto_230229 - MODE
      ?auto_230230 - DIRECTION
      ?auto_230231 - MODE
    )
    :vars
    (
      ?auto_230232 - INSTRUMENT
      ?auto_230237 - SATELLITE
      ?auto_230233 - DIRECTION
      ?auto_230239 - INSTRUMENT
      ?auto_230236 - INSTRUMENT
      ?auto_230235 - INSTRUMENT
      ?auto_230238 - INSTRUMENT
      ?auto_230234 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_230225 ?auto_230222 ) ) ( not ( = ?auto_230226 ?auto_230222 ) ) ( not ( = ?auto_230226 ?auto_230225 ) ) ( not ( = ?auto_230228 ?auto_230222 ) ) ( not ( = ?auto_230228 ?auto_230225 ) ) ( not ( = ?auto_230228 ?auto_230226 ) ) ( not ( = ?auto_230230 ?auto_230222 ) ) ( not ( = ?auto_230230 ?auto_230225 ) ) ( not ( = ?auto_230230 ?auto_230226 ) ) ( not ( = ?auto_230230 ?auto_230228 ) ) ( ON_BOARD ?auto_230232 ?auto_230237 ) ( SUPPORTS ?auto_230232 ?auto_230223 ) ( not ( = ?auto_230222 ?auto_230233 ) ) ( CALIBRATION_TARGET ?auto_230232 ?auto_230233 ) ( not ( = ?auto_230233 ?auto_230226 ) ) ( ON_BOARD ?auto_230239 ?auto_230237 ) ( not ( = ?auto_230232 ?auto_230239 ) ) ( SUPPORTS ?auto_230239 ?auto_230227 ) ( CALIBRATION_TARGET ?auto_230239 ?auto_230233 ) ( not ( = ?auto_230233 ?auto_230225 ) ) ( ON_BOARD ?auto_230236 ?auto_230237 ) ( not ( = ?auto_230239 ?auto_230236 ) ) ( SUPPORTS ?auto_230236 ?auto_230224 ) ( CALIBRATION_TARGET ?auto_230236 ?auto_230233 ) ( not ( = ?auto_230233 ?auto_230230 ) ) ( ON_BOARD ?auto_230235 ?auto_230237 ) ( not ( = ?auto_230236 ?auto_230235 ) ) ( SUPPORTS ?auto_230235 ?auto_230231 ) ( CALIBRATION_TARGET ?auto_230235 ?auto_230233 ) ( not ( = ?auto_230233 ?auto_230228 ) ) ( ON_BOARD ?auto_230238 ?auto_230237 ) ( not ( = ?auto_230235 ?auto_230238 ) ) ( SUPPORTS ?auto_230238 ?auto_230229 ) ( CALIBRATION_TARGET ?auto_230238 ?auto_230233 ) ( POWER_AVAIL ?auto_230237 ) ( POINTING ?auto_230237 ?auto_230234 ) ( not ( = ?auto_230233 ?auto_230234 ) ) ( not ( = ?auto_230228 ?auto_230234 ) ) ( not ( = ?auto_230229 ?auto_230231 ) ) ( not ( = ?auto_230230 ?auto_230234 ) ) ( not ( = ?auto_230229 ?auto_230224 ) ) ( not ( = ?auto_230231 ?auto_230224 ) ) ( not ( = ?auto_230225 ?auto_230234 ) ) ( not ( = ?auto_230236 ?auto_230238 ) ) ( not ( = ?auto_230229 ?auto_230227 ) ) ( not ( = ?auto_230231 ?auto_230227 ) ) ( not ( = ?auto_230224 ?auto_230227 ) ) ( not ( = ?auto_230226 ?auto_230234 ) ) ( not ( = ?auto_230239 ?auto_230235 ) ) ( not ( = ?auto_230239 ?auto_230238 ) ) ( not ( = ?auto_230229 ?auto_230223 ) ) ( not ( = ?auto_230231 ?auto_230223 ) ) ( not ( = ?auto_230224 ?auto_230223 ) ) ( not ( = ?auto_230227 ?auto_230223 ) ) ( not ( = ?auto_230222 ?auto_230234 ) ) ( not ( = ?auto_230232 ?auto_230236 ) ) ( not ( = ?auto_230232 ?auto_230235 ) ) ( not ( = ?auto_230232 ?auto_230238 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_230228 ?auto_230229 ?auto_230230 ?auto_230231 ?auto_230225 ?auto_230224 ?auto_230222 ?auto_230223 ?auto_230226 ?auto_230227 )
      ( GET-5IMAGE-VERIFY ?auto_230222 ?auto_230223 ?auto_230225 ?auto_230224 ?auto_230226 ?auto_230227 ?auto_230228 ?auto_230229 ?auto_230230 ?auto_230231 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_230300 - DIRECTION
      ?auto_230301 - MODE
      ?auto_230303 - DIRECTION
      ?auto_230302 - MODE
      ?auto_230304 - DIRECTION
      ?auto_230305 - MODE
      ?auto_230306 - DIRECTION
      ?auto_230307 - MODE
      ?auto_230308 - DIRECTION
      ?auto_230309 - MODE
    )
    :vars
    (
      ?auto_230310 - INSTRUMENT
      ?auto_230315 - SATELLITE
      ?auto_230311 - DIRECTION
      ?auto_230317 - INSTRUMENT
      ?auto_230314 - INSTRUMENT
      ?auto_230313 - INSTRUMENT
      ?auto_230316 - INSTRUMENT
      ?auto_230312 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_230303 ?auto_230300 ) ) ( not ( = ?auto_230304 ?auto_230300 ) ) ( not ( = ?auto_230304 ?auto_230303 ) ) ( not ( = ?auto_230306 ?auto_230300 ) ) ( not ( = ?auto_230306 ?auto_230303 ) ) ( not ( = ?auto_230306 ?auto_230304 ) ) ( not ( = ?auto_230308 ?auto_230300 ) ) ( not ( = ?auto_230308 ?auto_230303 ) ) ( not ( = ?auto_230308 ?auto_230304 ) ) ( not ( = ?auto_230308 ?auto_230306 ) ) ( ON_BOARD ?auto_230310 ?auto_230315 ) ( SUPPORTS ?auto_230310 ?auto_230301 ) ( not ( = ?auto_230300 ?auto_230311 ) ) ( CALIBRATION_TARGET ?auto_230310 ?auto_230311 ) ( not ( = ?auto_230311 ?auto_230304 ) ) ( ON_BOARD ?auto_230317 ?auto_230315 ) ( not ( = ?auto_230310 ?auto_230317 ) ) ( SUPPORTS ?auto_230317 ?auto_230305 ) ( CALIBRATION_TARGET ?auto_230317 ?auto_230311 ) ( not ( = ?auto_230311 ?auto_230303 ) ) ( ON_BOARD ?auto_230314 ?auto_230315 ) ( not ( = ?auto_230317 ?auto_230314 ) ) ( SUPPORTS ?auto_230314 ?auto_230302 ) ( CALIBRATION_TARGET ?auto_230314 ?auto_230311 ) ( not ( = ?auto_230311 ?auto_230306 ) ) ( ON_BOARD ?auto_230313 ?auto_230315 ) ( not ( = ?auto_230314 ?auto_230313 ) ) ( SUPPORTS ?auto_230313 ?auto_230307 ) ( CALIBRATION_TARGET ?auto_230313 ?auto_230311 ) ( not ( = ?auto_230311 ?auto_230308 ) ) ( ON_BOARD ?auto_230316 ?auto_230315 ) ( not ( = ?auto_230313 ?auto_230316 ) ) ( SUPPORTS ?auto_230316 ?auto_230309 ) ( CALIBRATION_TARGET ?auto_230316 ?auto_230311 ) ( POWER_AVAIL ?auto_230315 ) ( POINTING ?auto_230315 ?auto_230312 ) ( not ( = ?auto_230311 ?auto_230312 ) ) ( not ( = ?auto_230308 ?auto_230312 ) ) ( not ( = ?auto_230309 ?auto_230307 ) ) ( not ( = ?auto_230306 ?auto_230312 ) ) ( not ( = ?auto_230309 ?auto_230302 ) ) ( not ( = ?auto_230307 ?auto_230302 ) ) ( not ( = ?auto_230303 ?auto_230312 ) ) ( not ( = ?auto_230314 ?auto_230316 ) ) ( not ( = ?auto_230309 ?auto_230305 ) ) ( not ( = ?auto_230307 ?auto_230305 ) ) ( not ( = ?auto_230302 ?auto_230305 ) ) ( not ( = ?auto_230304 ?auto_230312 ) ) ( not ( = ?auto_230317 ?auto_230313 ) ) ( not ( = ?auto_230317 ?auto_230316 ) ) ( not ( = ?auto_230309 ?auto_230301 ) ) ( not ( = ?auto_230307 ?auto_230301 ) ) ( not ( = ?auto_230302 ?auto_230301 ) ) ( not ( = ?auto_230305 ?auto_230301 ) ) ( not ( = ?auto_230300 ?auto_230312 ) ) ( not ( = ?auto_230310 ?auto_230314 ) ) ( not ( = ?auto_230310 ?auto_230313 ) ) ( not ( = ?auto_230310 ?auto_230316 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_230308 ?auto_230309 ?auto_230306 ?auto_230307 ?auto_230303 ?auto_230302 ?auto_230300 ?auto_230301 ?auto_230304 ?auto_230305 )
      ( GET-5IMAGE-VERIFY ?auto_230300 ?auto_230301 ?auto_230303 ?auto_230302 ?auto_230304 ?auto_230305 ?auto_230306 ?auto_230307 ?auto_230308 ?auto_230309 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_231408 - DIRECTION
      ?auto_231409 - MODE
      ?auto_231411 - DIRECTION
      ?auto_231410 - MODE
      ?auto_231412 - DIRECTION
      ?auto_231413 - MODE
      ?auto_231414 - DIRECTION
      ?auto_231415 - MODE
      ?auto_231416 - DIRECTION
      ?auto_231417 - MODE
    )
    :vars
    (
      ?auto_231418 - INSTRUMENT
      ?auto_231423 - SATELLITE
      ?auto_231419 - DIRECTION
      ?auto_231425 - INSTRUMENT
      ?auto_231422 - INSTRUMENT
      ?auto_231421 - INSTRUMENT
      ?auto_231424 - INSTRUMENT
      ?auto_231420 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_231411 ?auto_231408 ) ) ( not ( = ?auto_231412 ?auto_231408 ) ) ( not ( = ?auto_231412 ?auto_231411 ) ) ( not ( = ?auto_231414 ?auto_231408 ) ) ( not ( = ?auto_231414 ?auto_231411 ) ) ( not ( = ?auto_231414 ?auto_231412 ) ) ( not ( = ?auto_231416 ?auto_231408 ) ) ( not ( = ?auto_231416 ?auto_231411 ) ) ( not ( = ?auto_231416 ?auto_231412 ) ) ( not ( = ?auto_231416 ?auto_231414 ) ) ( ON_BOARD ?auto_231418 ?auto_231423 ) ( SUPPORTS ?auto_231418 ?auto_231409 ) ( not ( = ?auto_231408 ?auto_231419 ) ) ( CALIBRATION_TARGET ?auto_231418 ?auto_231419 ) ( not ( = ?auto_231419 ?auto_231411 ) ) ( ON_BOARD ?auto_231425 ?auto_231423 ) ( not ( = ?auto_231418 ?auto_231425 ) ) ( SUPPORTS ?auto_231425 ?auto_231410 ) ( CALIBRATION_TARGET ?auto_231425 ?auto_231419 ) ( not ( = ?auto_231419 ?auto_231416 ) ) ( ON_BOARD ?auto_231422 ?auto_231423 ) ( not ( = ?auto_231425 ?auto_231422 ) ) ( SUPPORTS ?auto_231422 ?auto_231417 ) ( CALIBRATION_TARGET ?auto_231422 ?auto_231419 ) ( not ( = ?auto_231419 ?auto_231414 ) ) ( ON_BOARD ?auto_231421 ?auto_231423 ) ( not ( = ?auto_231422 ?auto_231421 ) ) ( SUPPORTS ?auto_231421 ?auto_231415 ) ( CALIBRATION_TARGET ?auto_231421 ?auto_231419 ) ( not ( = ?auto_231419 ?auto_231412 ) ) ( ON_BOARD ?auto_231424 ?auto_231423 ) ( not ( = ?auto_231421 ?auto_231424 ) ) ( SUPPORTS ?auto_231424 ?auto_231413 ) ( CALIBRATION_TARGET ?auto_231424 ?auto_231419 ) ( POWER_AVAIL ?auto_231423 ) ( POINTING ?auto_231423 ?auto_231420 ) ( not ( = ?auto_231419 ?auto_231420 ) ) ( not ( = ?auto_231412 ?auto_231420 ) ) ( not ( = ?auto_231413 ?auto_231415 ) ) ( not ( = ?auto_231414 ?auto_231420 ) ) ( not ( = ?auto_231413 ?auto_231417 ) ) ( not ( = ?auto_231415 ?auto_231417 ) ) ( not ( = ?auto_231416 ?auto_231420 ) ) ( not ( = ?auto_231422 ?auto_231424 ) ) ( not ( = ?auto_231413 ?auto_231410 ) ) ( not ( = ?auto_231415 ?auto_231410 ) ) ( not ( = ?auto_231417 ?auto_231410 ) ) ( not ( = ?auto_231411 ?auto_231420 ) ) ( not ( = ?auto_231425 ?auto_231421 ) ) ( not ( = ?auto_231425 ?auto_231424 ) ) ( not ( = ?auto_231413 ?auto_231409 ) ) ( not ( = ?auto_231415 ?auto_231409 ) ) ( not ( = ?auto_231417 ?auto_231409 ) ) ( not ( = ?auto_231410 ?auto_231409 ) ) ( not ( = ?auto_231408 ?auto_231420 ) ) ( not ( = ?auto_231418 ?auto_231422 ) ) ( not ( = ?auto_231418 ?auto_231421 ) ) ( not ( = ?auto_231418 ?auto_231424 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_231412 ?auto_231413 ?auto_231414 ?auto_231415 ?auto_231416 ?auto_231417 ?auto_231408 ?auto_231409 ?auto_231411 ?auto_231410 )
      ( GET-5IMAGE-VERIFY ?auto_231408 ?auto_231409 ?auto_231411 ?auto_231410 ?auto_231412 ?auto_231413 ?auto_231414 ?auto_231415 ?auto_231416 ?auto_231417 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_231486 - DIRECTION
      ?auto_231487 - MODE
      ?auto_231489 - DIRECTION
      ?auto_231488 - MODE
      ?auto_231490 - DIRECTION
      ?auto_231491 - MODE
      ?auto_231492 - DIRECTION
      ?auto_231493 - MODE
      ?auto_231494 - DIRECTION
      ?auto_231495 - MODE
    )
    :vars
    (
      ?auto_231496 - INSTRUMENT
      ?auto_231501 - SATELLITE
      ?auto_231497 - DIRECTION
      ?auto_231503 - INSTRUMENT
      ?auto_231500 - INSTRUMENT
      ?auto_231499 - INSTRUMENT
      ?auto_231502 - INSTRUMENT
      ?auto_231498 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_231489 ?auto_231486 ) ) ( not ( = ?auto_231490 ?auto_231486 ) ) ( not ( = ?auto_231490 ?auto_231489 ) ) ( not ( = ?auto_231492 ?auto_231486 ) ) ( not ( = ?auto_231492 ?auto_231489 ) ) ( not ( = ?auto_231492 ?auto_231490 ) ) ( not ( = ?auto_231494 ?auto_231486 ) ) ( not ( = ?auto_231494 ?auto_231489 ) ) ( not ( = ?auto_231494 ?auto_231490 ) ) ( not ( = ?auto_231494 ?auto_231492 ) ) ( ON_BOARD ?auto_231496 ?auto_231501 ) ( SUPPORTS ?auto_231496 ?auto_231487 ) ( not ( = ?auto_231486 ?auto_231497 ) ) ( CALIBRATION_TARGET ?auto_231496 ?auto_231497 ) ( not ( = ?auto_231497 ?auto_231489 ) ) ( ON_BOARD ?auto_231503 ?auto_231501 ) ( not ( = ?auto_231496 ?auto_231503 ) ) ( SUPPORTS ?auto_231503 ?auto_231488 ) ( CALIBRATION_TARGET ?auto_231503 ?auto_231497 ) ( not ( = ?auto_231497 ?auto_231492 ) ) ( ON_BOARD ?auto_231500 ?auto_231501 ) ( not ( = ?auto_231503 ?auto_231500 ) ) ( SUPPORTS ?auto_231500 ?auto_231493 ) ( CALIBRATION_TARGET ?auto_231500 ?auto_231497 ) ( not ( = ?auto_231497 ?auto_231494 ) ) ( ON_BOARD ?auto_231499 ?auto_231501 ) ( not ( = ?auto_231500 ?auto_231499 ) ) ( SUPPORTS ?auto_231499 ?auto_231495 ) ( CALIBRATION_TARGET ?auto_231499 ?auto_231497 ) ( not ( = ?auto_231497 ?auto_231490 ) ) ( ON_BOARD ?auto_231502 ?auto_231501 ) ( not ( = ?auto_231499 ?auto_231502 ) ) ( SUPPORTS ?auto_231502 ?auto_231491 ) ( CALIBRATION_TARGET ?auto_231502 ?auto_231497 ) ( POWER_AVAIL ?auto_231501 ) ( POINTING ?auto_231501 ?auto_231498 ) ( not ( = ?auto_231497 ?auto_231498 ) ) ( not ( = ?auto_231490 ?auto_231498 ) ) ( not ( = ?auto_231491 ?auto_231495 ) ) ( not ( = ?auto_231494 ?auto_231498 ) ) ( not ( = ?auto_231491 ?auto_231493 ) ) ( not ( = ?auto_231495 ?auto_231493 ) ) ( not ( = ?auto_231492 ?auto_231498 ) ) ( not ( = ?auto_231500 ?auto_231502 ) ) ( not ( = ?auto_231491 ?auto_231488 ) ) ( not ( = ?auto_231495 ?auto_231488 ) ) ( not ( = ?auto_231493 ?auto_231488 ) ) ( not ( = ?auto_231489 ?auto_231498 ) ) ( not ( = ?auto_231503 ?auto_231499 ) ) ( not ( = ?auto_231503 ?auto_231502 ) ) ( not ( = ?auto_231491 ?auto_231487 ) ) ( not ( = ?auto_231495 ?auto_231487 ) ) ( not ( = ?auto_231493 ?auto_231487 ) ) ( not ( = ?auto_231488 ?auto_231487 ) ) ( not ( = ?auto_231486 ?auto_231498 ) ) ( not ( = ?auto_231496 ?auto_231500 ) ) ( not ( = ?auto_231496 ?auto_231499 ) ) ( not ( = ?auto_231496 ?auto_231502 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_231490 ?auto_231491 ?auto_231494 ?auto_231495 ?auto_231492 ?auto_231493 ?auto_231486 ?auto_231487 ?auto_231489 ?auto_231488 )
      ( GET-5IMAGE-VERIFY ?auto_231486 ?auto_231487 ?auto_231489 ?auto_231488 ?auto_231490 ?auto_231491 ?auto_231492 ?auto_231493 ?auto_231494 ?auto_231495 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_231816 - DIRECTION
      ?auto_231817 - MODE
      ?auto_231819 - DIRECTION
      ?auto_231818 - MODE
      ?auto_231820 - DIRECTION
      ?auto_231821 - MODE
      ?auto_231822 - DIRECTION
      ?auto_231823 - MODE
      ?auto_231824 - DIRECTION
      ?auto_231825 - MODE
    )
    :vars
    (
      ?auto_231826 - INSTRUMENT
      ?auto_231831 - SATELLITE
      ?auto_231827 - DIRECTION
      ?auto_231833 - INSTRUMENT
      ?auto_231830 - INSTRUMENT
      ?auto_231829 - INSTRUMENT
      ?auto_231832 - INSTRUMENT
      ?auto_231828 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_231819 ?auto_231816 ) ) ( not ( = ?auto_231820 ?auto_231816 ) ) ( not ( = ?auto_231820 ?auto_231819 ) ) ( not ( = ?auto_231822 ?auto_231816 ) ) ( not ( = ?auto_231822 ?auto_231819 ) ) ( not ( = ?auto_231822 ?auto_231820 ) ) ( not ( = ?auto_231824 ?auto_231816 ) ) ( not ( = ?auto_231824 ?auto_231819 ) ) ( not ( = ?auto_231824 ?auto_231820 ) ) ( not ( = ?auto_231824 ?auto_231822 ) ) ( ON_BOARD ?auto_231826 ?auto_231831 ) ( SUPPORTS ?auto_231826 ?auto_231817 ) ( not ( = ?auto_231816 ?auto_231827 ) ) ( CALIBRATION_TARGET ?auto_231826 ?auto_231827 ) ( not ( = ?auto_231827 ?auto_231819 ) ) ( ON_BOARD ?auto_231833 ?auto_231831 ) ( not ( = ?auto_231826 ?auto_231833 ) ) ( SUPPORTS ?auto_231833 ?auto_231818 ) ( CALIBRATION_TARGET ?auto_231833 ?auto_231827 ) ( not ( = ?auto_231827 ?auto_231824 ) ) ( ON_BOARD ?auto_231830 ?auto_231831 ) ( not ( = ?auto_231833 ?auto_231830 ) ) ( SUPPORTS ?auto_231830 ?auto_231825 ) ( CALIBRATION_TARGET ?auto_231830 ?auto_231827 ) ( not ( = ?auto_231827 ?auto_231820 ) ) ( ON_BOARD ?auto_231829 ?auto_231831 ) ( not ( = ?auto_231830 ?auto_231829 ) ) ( SUPPORTS ?auto_231829 ?auto_231821 ) ( CALIBRATION_TARGET ?auto_231829 ?auto_231827 ) ( not ( = ?auto_231827 ?auto_231822 ) ) ( ON_BOARD ?auto_231832 ?auto_231831 ) ( not ( = ?auto_231829 ?auto_231832 ) ) ( SUPPORTS ?auto_231832 ?auto_231823 ) ( CALIBRATION_TARGET ?auto_231832 ?auto_231827 ) ( POWER_AVAIL ?auto_231831 ) ( POINTING ?auto_231831 ?auto_231828 ) ( not ( = ?auto_231827 ?auto_231828 ) ) ( not ( = ?auto_231822 ?auto_231828 ) ) ( not ( = ?auto_231823 ?auto_231821 ) ) ( not ( = ?auto_231820 ?auto_231828 ) ) ( not ( = ?auto_231823 ?auto_231825 ) ) ( not ( = ?auto_231821 ?auto_231825 ) ) ( not ( = ?auto_231824 ?auto_231828 ) ) ( not ( = ?auto_231830 ?auto_231832 ) ) ( not ( = ?auto_231823 ?auto_231818 ) ) ( not ( = ?auto_231821 ?auto_231818 ) ) ( not ( = ?auto_231825 ?auto_231818 ) ) ( not ( = ?auto_231819 ?auto_231828 ) ) ( not ( = ?auto_231833 ?auto_231829 ) ) ( not ( = ?auto_231833 ?auto_231832 ) ) ( not ( = ?auto_231823 ?auto_231817 ) ) ( not ( = ?auto_231821 ?auto_231817 ) ) ( not ( = ?auto_231825 ?auto_231817 ) ) ( not ( = ?auto_231818 ?auto_231817 ) ) ( not ( = ?auto_231816 ?auto_231828 ) ) ( not ( = ?auto_231826 ?auto_231830 ) ) ( not ( = ?auto_231826 ?auto_231829 ) ) ( not ( = ?auto_231826 ?auto_231832 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_231822 ?auto_231823 ?auto_231820 ?auto_231821 ?auto_231824 ?auto_231825 ?auto_231816 ?auto_231817 ?auto_231819 ?auto_231818 )
      ( GET-5IMAGE-VERIFY ?auto_231816 ?auto_231817 ?auto_231819 ?auto_231818 ?auto_231820 ?auto_231821 ?auto_231822 ?auto_231823 ?auto_231824 ?auto_231825 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_231980 - DIRECTION
      ?auto_231981 - MODE
      ?auto_231983 - DIRECTION
      ?auto_231982 - MODE
      ?auto_231984 - DIRECTION
      ?auto_231985 - MODE
      ?auto_231986 - DIRECTION
      ?auto_231987 - MODE
      ?auto_231988 - DIRECTION
      ?auto_231989 - MODE
    )
    :vars
    (
      ?auto_231990 - INSTRUMENT
      ?auto_231995 - SATELLITE
      ?auto_231991 - DIRECTION
      ?auto_231997 - INSTRUMENT
      ?auto_231994 - INSTRUMENT
      ?auto_231993 - INSTRUMENT
      ?auto_231996 - INSTRUMENT
      ?auto_231992 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_231983 ?auto_231980 ) ) ( not ( = ?auto_231984 ?auto_231980 ) ) ( not ( = ?auto_231984 ?auto_231983 ) ) ( not ( = ?auto_231986 ?auto_231980 ) ) ( not ( = ?auto_231986 ?auto_231983 ) ) ( not ( = ?auto_231986 ?auto_231984 ) ) ( not ( = ?auto_231988 ?auto_231980 ) ) ( not ( = ?auto_231988 ?auto_231983 ) ) ( not ( = ?auto_231988 ?auto_231984 ) ) ( not ( = ?auto_231988 ?auto_231986 ) ) ( ON_BOARD ?auto_231990 ?auto_231995 ) ( SUPPORTS ?auto_231990 ?auto_231981 ) ( not ( = ?auto_231980 ?auto_231991 ) ) ( CALIBRATION_TARGET ?auto_231990 ?auto_231991 ) ( not ( = ?auto_231991 ?auto_231983 ) ) ( ON_BOARD ?auto_231997 ?auto_231995 ) ( not ( = ?auto_231990 ?auto_231997 ) ) ( SUPPORTS ?auto_231997 ?auto_231982 ) ( CALIBRATION_TARGET ?auto_231997 ?auto_231991 ) ( not ( = ?auto_231991 ?auto_231986 ) ) ( ON_BOARD ?auto_231994 ?auto_231995 ) ( not ( = ?auto_231997 ?auto_231994 ) ) ( SUPPORTS ?auto_231994 ?auto_231987 ) ( CALIBRATION_TARGET ?auto_231994 ?auto_231991 ) ( not ( = ?auto_231991 ?auto_231984 ) ) ( ON_BOARD ?auto_231993 ?auto_231995 ) ( not ( = ?auto_231994 ?auto_231993 ) ) ( SUPPORTS ?auto_231993 ?auto_231985 ) ( CALIBRATION_TARGET ?auto_231993 ?auto_231991 ) ( not ( = ?auto_231991 ?auto_231988 ) ) ( ON_BOARD ?auto_231996 ?auto_231995 ) ( not ( = ?auto_231993 ?auto_231996 ) ) ( SUPPORTS ?auto_231996 ?auto_231989 ) ( CALIBRATION_TARGET ?auto_231996 ?auto_231991 ) ( POWER_AVAIL ?auto_231995 ) ( POINTING ?auto_231995 ?auto_231992 ) ( not ( = ?auto_231991 ?auto_231992 ) ) ( not ( = ?auto_231988 ?auto_231992 ) ) ( not ( = ?auto_231989 ?auto_231985 ) ) ( not ( = ?auto_231984 ?auto_231992 ) ) ( not ( = ?auto_231989 ?auto_231987 ) ) ( not ( = ?auto_231985 ?auto_231987 ) ) ( not ( = ?auto_231986 ?auto_231992 ) ) ( not ( = ?auto_231994 ?auto_231996 ) ) ( not ( = ?auto_231989 ?auto_231982 ) ) ( not ( = ?auto_231985 ?auto_231982 ) ) ( not ( = ?auto_231987 ?auto_231982 ) ) ( not ( = ?auto_231983 ?auto_231992 ) ) ( not ( = ?auto_231997 ?auto_231993 ) ) ( not ( = ?auto_231997 ?auto_231996 ) ) ( not ( = ?auto_231989 ?auto_231981 ) ) ( not ( = ?auto_231985 ?auto_231981 ) ) ( not ( = ?auto_231987 ?auto_231981 ) ) ( not ( = ?auto_231982 ?auto_231981 ) ) ( not ( = ?auto_231980 ?auto_231992 ) ) ( not ( = ?auto_231990 ?auto_231994 ) ) ( not ( = ?auto_231990 ?auto_231993 ) ) ( not ( = ?auto_231990 ?auto_231996 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_231988 ?auto_231989 ?auto_231984 ?auto_231985 ?auto_231986 ?auto_231987 ?auto_231980 ?auto_231981 ?auto_231983 ?auto_231982 )
      ( GET-5IMAGE-VERIFY ?auto_231980 ?auto_231981 ?auto_231983 ?auto_231982 ?auto_231984 ?auto_231985 ?auto_231986 ?auto_231987 ?auto_231988 ?auto_231989 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_232310 - DIRECTION
      ?auto_232311 - MODE
      ?auto_232313 - DIRECTION
      ?auto_232312 - MODE
      ?auto_232314 - DIRECTION
      ?auto_232315 - MODE
      ?auto_232316 - DIRECTION
      ?auto_232317 - MODE
      ?auto_232318 - DIRECTION
      ?auto_232319 - MODE
    )
    :vars
    (
      ?auto_232320 - INSTRUMENT
      ?auto_232325 - SATELLITE
      ?auto_232321 - DIRECTION
      ?auto_232327 - INSTRUMENT
      ?auto_232324 - INSTRUMENT
      ?auto_232323 - INSTRUMENT
      ?auto_232326 - INSTRUMENT
      ?auto_232322 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_232313 ?auto_232310 ) ) ( not ( = ?auto_232314 ?auto_232310 ) ) ( not ( = ?auto_232314 ?auto_232313 ) ) ( not ( = ?auto_232316 ?auto_232310 ) ) ( not ( = ?auto_232316 ?auto_232313 ) ) ( not ( = ?auto_232316 ?auto_232314 ) ) ( not ( = ?auto_232318 ?auto_232310 ) ) ( not ( = ?auto_232318 ?auto_232313 ) ) ( not ( = ?auto_232318 ?auto_232314 ) ) ( not ( = ?auto_232318 ?auto_232316 ) ) ( ON_BOARD ?auto_232320 ?auto_232325 ) ( SUPPORTS ?auto_232320 ?auto_232311 ) ( not ( = ?auto_232310 ?auto_232321 ) ) ( CALIBRATION_TARGET ?auto_232320 ?auto_232321 ) ( not ( = ?auto_232321 ?auto_232313 ) ) ( ON_BOARD ?auto_232327 ?auto_232325 ) ( not ( = ?auto_232320 ?auto_232327 ) ) ( SUPPORTS ?auto_232327 ?auto_232312 ) ( CALIBRATION_TARGET ?auto_232327 ?auto_232321 ) ( not ( = ?auto_232321 ?auto_232314 ) ) ( ON_BOARD ?auto_232324 ?auto_232325 ) ( not ( = ?auto_232327 ?auto_232324 ) ) ( SUPPORTS ?auto_232324 ?auto_232315 ) ( CALIBRATION_TARGET ?auto_232324 ?auto_232321 ) ( not ( = ?auto_232321 ?auto_232318 ) ) ( ON_BOARD ?auto_232323 ?auto_232325 ) ( not ( = ?auto_232324 ?auto_232323 ) ) ( SUPPORTS ?auto_232323 ?auto_232319 ) ( CALIBRATION_TARGET ?auto_232323 ?auto_232321 ) ( not ( = ?auto_232321 ?auto_232316 ) ) ( ON_BOARD ?auto_232326 ?auto_232325 ) ( not ( = ?auto_232323 ?auto_232326 ) ) ( SUPPORTS ?auto_232326 ?auto_232317 ) ( CALIBRATION_TARGET ?auto_232326 ?auto_232321 ) ( POWER_AVAIL ?auto_232325 ) ( POINTING ?auto_232325 ?auto_232322 ) ( not ( = ?auto_232321 ?auto_232322 ) ) ( not ( = ?auto_232316 ?auto_232322 ) ) ( not ( = ?auto_232317 ?auto_232319 ) ) ( not ( = ?auto_232318 ?auto_232322 ) ) ( not ( = ?auto_232317 ?auto_232315 ) ) ( not ( = ?auto_232319 ?auto_232315 ) ) ( not ( = ?auto_232314 ?auto_232322 ) ) ( not ( = ?auto_232324 ?auto_232326 ) ) ( not ( = ?auto_232317 ?auto_232312 ) ) ( not ( = ?auto_232319 ?auto_232312 ) ) ( not ( = ?auto_232315 ?auto_232312 ) ) ( not ( = ?auto_232313 ?auto_232322 ) ) ( not ( = ?auto_232327 ?auto_232323 ) ) ( not ( = ?auto_232327 ?auto_232326 ) ) ( not ( = ?auto_232317 ?auto_232311 ) ) ( not ( = ?auto_232319 ?auto_232311 ) ) ( not ( = ?auto_232315 ?auto_232311 ) ) ( not ( = ?auto_232312 ?auto_232311 ) ) ( not ( = ?auto_232310 ?auto_232322 ) ) ( not ( = ?auto_232320 ?auto_232324 ) ) ( not ( = ?auto_232320 ?auto_232323 ) ) ( not ( = ?auto_232320 ?auto_232326 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_232316 ?auto_232317 ?auto_232318 ?auto_232319 ?auto_232314 ?auto_232315 ?auto_232310 ?auto_232311 ?auto_232313 ?auto_232312 )
      ( GET-5IMAGE-VERIFY ?auto_232310 ?auto_232311 ?auto_232313 ?auto_232312 ?auto_232314 ?auto_232315 ?auto_232316 ?auto_232317 ?auto_232318 ?auto_232319 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_232388 - DIRECTION
      ?auto_232389 - MODE
      ?auto_232391 - DIRECTION
      ?auto_232390 - MODE
      ?auto_232392 - DIRECTION
      ?auto_232393 - MODE
      ?auto_232394 - DIRECTION
      ?auto_232395 - MODE
      ?auto_232396 - DIRECTION
      ?auto_232397 - MODE
    )
    :vars
    (
      ?auto_232398 - INSTRUMENT
      ?auto_232403 - SATELLITE
      ?auto_232399 - DIRECTION
      ?auto_232405 - INSTRUMENT
      ?auto_232402 - INSTRUMENT
      ?auto_232401 - INSTRUMENT
      ?auto_232404 - INSTRUMENT
      ?auto_232400 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_232391 ?auto_232388 ) ) ( not ( = ?auto_232392 ?auto_232388 ) ) ( not ( = ?auto_232392 ?auto_232391 ) ) ( not ( = ?auto_232394 ?auto_232388 ) ) ( not ( = ?auto_232394 ?auto_232391 ) ) ( not ( = ?auto_232394 ?auto_232392 ) ) ( not ( = ?auto_232396 ?auto_232388 ) ) ( not ( = ?auto_232396 ?auto_232391 ) ) ( not ( = ?auto_232396 ?auto_232392 ) ) ( not ( = ?auto_232396 ?auto_232394 ) ) ( ON_BOARD ?auto_232398 ?auto_232403 ) ( SUPPORTS ?auto_232398 ?auto_232389 ) ( not ( = ?auto_232388 ?auto_232399 ) ) ( CALIBRATION_TARGET ?auto_232398 ?auto_232399 ) ( not ( = ?auto_232399 ?auto_232391 ) ) ( ON_BOARD ?auto_232405 ?auto_232403 ) ( not ( = ?auto_232398 ?auto_232405 ) ) ( SUPPORTS ?auto_232405 ?auto_232390 ) ( CALIBRATION_TARGET ?auto_232405 ?auto_232399 ) ( not ( = ?auto_232399 ?auto_232392 ) ) ( ON_BOARD ?auto_232402 ?auto_232403 ) ( not ( = ?auto_232405 ?auto_232402 ) ) ( SUPPORTS ?auto_232402 ?auto_232393 ) ( CALIBRATION_TARGET ?auto_232402 ?auto_232399 ) ( not ( = ?auto_232399 ?auto_232394 ) ) ( ON_BOARD ?auto_232401 ?auto_232403 ) ( not ( = ?auto_232402 ?auto_232401 ) ) ( SUPPORTS ?auto_232401 ?auto_232395 ) ( CALIBRATION_TARGET ?auto_232401 ?auto_232399 ) ( not ( = ?auto_232399 ?auto_232396 ) ) ( ON_BOARD ?auto_232404 ?auto_232403 ) ( not ( = ?auto_232401 ?auto_232404 ) ) ( SUPPORTS ?auto_232404 ?auto_232397 ) ( CALIBRATION_TARGET ?auto_232404 ?auto_232399 ) ( POWER_AVAIL ?auto_232403 ) ( POINTING ?auto_232403 ?auto_232400 ) ( not ( = ?auto_232399 ?auto_232400 ) ) ( not ( = ?auto_232396 ?auto_232400 ) ) ( not ( = ?auto_232397 ?auto_232395 ) ) ( not ( = ?auto_232394 ?auto_232400 ) ) ( not ( = ?auto_232397 ?auto_232393 ) ) ( not ( = ?auto_232395 ?auto_232393 ) ) ( not ( = ?auto_232392 ?auto_232400 ) ) ( not ( = ?auto_232402 ?auto_232404 ) ) ( not ( = ?auto_232397 ?auto_232390 ) ) ( not ( = ?auto_232395 ?auto_232390 ) ) ( not ( = ?auto_232393 ?auto_232390 ) ) ( not ( = ?auto_232391 ?auto_232400 ) ) ( not ( = ?auto_232405 ?auto_232401 ) ) ( not ( = ?auto_232405 ?auto_232404 ) ) ( not ( = ?auto_232397 ?auto_232389 ) ) ( not ( = ?auto_232395 ?auto_232389 ) ) ( not ( = ?auto_232393 ?auto_232389 ) ) ( not ( = ?auto_232390 ?auto_232389 ) ) ( not ( = ?auto_232388 ?auto_232400 ) ) ( not ( = ?auto_232398 ?auto_232402 ) ) ( not ( = ?auto_232398 ?auto_232401 ) ) ( not ( = ?auto_232398 ?auto_232404 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_232396 ?auto_232397 ?auto_232394 ?auto_232395 ?auto_232392 ?auto_232393 ?auto_232388 ?auto_232389 ?auto_232391 ?auto_232390 )
      ( GET-5IMAGE-VERIFY ?auto_232388 ?auto_232389 ?auto_232391 ?auto_232390 ?auto_232392 ?auto_232393 ?auto_232394 ?auto_232395 ?auto_232396 ?auto_232397 ) )
  )

)

