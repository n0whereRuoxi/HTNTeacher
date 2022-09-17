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
      ?auto_7534 - DIRECTION
      ?auto_7535 - MODE
    )
    :vars
    (
      ?auto_7536 - INSTRUMENT
      ?auto_7537 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_7536 ) ( ON_BOARD ?auto_7536 ?auto_7537 ) ( SUPPORTS ?auto_7536 ?auto_7535 ) ( POWER_ON ?auto_7536 ) ( POINTING ?auto_7537 ?auto_7534 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_7537 ?auto_7534 ?auto_7536 ?auto_7535 )
      ( GET-1IMAGE-VERIFY ?auto_7534 ?auto_7535 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7552 - DIRECTION
      ?auto_7553 - MODE
    )
    :vars
    (
      ?auto_7554 - INSTRUMENT
      ?auto_7555 - SATELLITE
      ?auto_7556 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_7554 ) ( ON_BOARD ?auto_7554 ?auto_7555 ) ( SUPPORTS ?auto_7554 ?auto_7553 ) ( POWER_ON ?auto_7554 ) ( POINTING ?auto_7555 ?auto_7556 ) ( not ( = ?auto_7552 ?auto_7556 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_7555 ?auto_7552 ?auto_7556 )
      ( GET-1IMAGE ?auto_7552 ?auto_7553 )
      ( GET-1IMAGE-VERIFY ?auto_7552 ?auto_7553 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7573 - DIRECTION
      ?auto_7574 - MODE
    )
    :vars
    (
      ?auto_7575 - INSTRUMENT
      ?auto_7577 - SATELLITE
      ?auto_7576 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7575 ?auto_7577 ) ( SUPPORTS ?auto_7575 ?auto_7574 ) ( POWER_ON ?auto_7575 ) ( POINTING ?auto_7577 ?auto_7576 ) ( not ( = ?auto_7573 ?auto_7576 ) ) ( CALIBRATION_TARGET ?auto_7575 ?auto_7576 ) ( NOT_CALIBRATED ?auto_7575 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_7577 ?auto_7575 ?auto_7576 )
      ( GET-1IMAGE ?auto_7573 ?auto_7574 )
      ( GET-1IMAGE-VERIFY ?auto_7573 ?auto_7574 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7594 - DIRECTION
      ?auto_7595 - MODE
    )
    :vars
    (
      ?auto_7597 - INSTRUMENT
      ?auto_7598 - SATELLITE
      ?auto_7596 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7597 ?auto_7598 ) ( SUPPORTS ?auto_7597 ?auto_7595 ) ( POINTING ?auto_7598 ?auto_7596 ) ( not ( = ?auto_7594 ?auto_7596 ) ) ( CALIBRATION_TARGET ?auto_7597 ?auto_7596 ) ( POWER_AVAIL ?auto_7598 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_7597 ?auto_7598 )
      ( GET-1IMAGE ?auto_7594 ?auto_7595 )
      ( GET-1IMAGE-VERIFY ?auto_7594 ?auto_7595 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7615 - DIRECTION
      ?auto_7616 - MODE
    )
    :vars
    (
      ?auto_7618 - INSTRUMENT
      ?auto_7619 - SATELLITE
      ?auto_7617 - DIRECTION
      ?auto_7620 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7618 ?auto_7619 ) ( SUPPORTS ?auto_7618 ?auto_7616 ) ( not ( = ?auto_7615 ?auto_7617 ) ) ( CALIBRATION_TARGET ?auto_7618 ?auto_7617 ) ( POWER_AVAIL ?auto_7619 ) ( POINTING ?auto_7619 ?auto_7620 ) ( not ( = ?auto_7617 ?auto_7620 ) ) ( not ( = ?auto_7615 ?auto_7620 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_7619 ?auto_7617 ?auto_7620 )
      ( GET-1IMAGE ?auto_7615 ?auto_7616 )
      ( GET-1IMAGE-VERIFY ?auto_7615 ?auto_7616 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7700 - DIRECTION
      ?auto_7701 - MODE
      ?auto_7702 - DIRECTION
      ?auto_7699 - MODE
    )
    :vars
    (
      ?auto_7704 - INSTRUMENT
      ?auto_7703 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_7702 ?auto_7700 ) ) ( CALIBRATED ?auto_7704 ) ( ON_BOARD ?auto_7704 ?auto_7703 ) ( SUPPORTS ?auto_7704 ?auto_7699 ) ( POWER_ON ?auto_7704 ) ( POINTING ?auto_7703 ?auto_7702 ) ( HAVE_IMAGE ?auto_7700 ?auto_7701 ) ( not ( = ?auto_7701 ?auto_7699 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7702 ?auto_7699 )
      ( GET-2IMAGE-VERIFY ?auto_7700 ?auto_7701 ?auto_7702 ?auto_7699 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7706 - DIRECTION
      ?auto_7707 - MODE
      ?auto_7708 - DIRECTION
      ?auto_7705 - MODE
    )
    :vars
    (
      ?auto_7710 - INSTRUMENT
      ?auto_7709 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_7708 ?auto_7706 ) ) ( CALIBRATED ?auto_7710 ) ( ON_BOARD ?auto_7710 ?auto_7709 ) ( SUPPORTS ?auto_7710 ?auto_7707 ) ( POWER_ON ?auto_7710 ) ( POINTING ?auto_7709 ?auto_7706 ) ( HAVE_IMAGE ?auto_7708 ?auto_7705 ) ( not ( = ?auto_7707 ?auto_7705 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7706 ?auto_7707 )
      ( GET-2IMAGE-VERIFY ?auto_7706 ?auto_7707 ?auto_7708 ?auto_7705 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7779 - DIRECTION
      ?auto_7780 - MODE
      ?auto_7781 - DIRECTION
      ?auto_7778 - MODE
    )
    :vars
    (
      ?auto_7782 - INSTRUMENT
      ?auto_7784 - SATELLITE
      ?auto_7783 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7781 ?auto_7779 ) ) ( CALIBRATED ?auto_7782 ) ( ON_BOARD ?auto_7782 ?auto_7784 ) ( SUPPORTS ?auto_7782 ?auto_7778 ) ( POWER_ON ?auto_7782 ) ( POINTING ?auto_7784 ?auto_7783 ) ( not ( = ?auto_7781 ?auto_7783 ) ) ( HAVE_IMAGE ?auto_7779 ?auto_7780 ) ( not ( = ?auto_7779 ?auto_7783 ) ) ( not ( = ?auto_7780 ?auto_7778 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7781 ?auto_7778 )
      ( GET-2IMAGE-VERIFY ?auto_7779 ?auto_7780 ?auto_7781 ?auto_7778 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7786 - DIRECTION
      ?auto_7787 - MODE
      ?auto_7788 - DIRECTION
      ?auto_7785 - MODE
    )
    :vars
    (
      ?auto_7790 - INSTRUMENT
      ?auto_7789 - SATELLITE
      ?auto_7791 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7788 ?auto_7786 ) ) ( CALIBRATED ?auto_7790 ) ( ON_BOARD ?auto_7790 ?auto_7789 ) ( SUPPORTS ?auto_7790 ?auto_7787 ) ( POWER_ON ?auto_7790 ) ( POINTING ?auto_7789 ?auto_7791 ) ( not ( = ?auto_7786 ?auto_7791 ) ) ( HAVE_IMAGE ?auto_7788 ?auto_7785 ) ( not ( = ?auto_7788 ?auto_7791 ) ) ( not ( = ?auto_7785 ?auto_7787 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7788 ?auto_7785 ?auto_7786 ?auto_7787 )
      ( GET-2IMAGE-VERIFY ?auto_7786 ?auto_7787 ?auto_7788 ?auto_7785 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7866 - DIRECTION
      ?auto_7867 - MODE
    )
    :vars
    (
      ?auto_7870 - DIRECTION
      ?auto_7869 - INSTRUMENT
      ?auto_7868 - SATELLITE
      ?auto_7871 - DIRECTION
      ?auto_7872 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_7866 ?auto_7870 ) ) ( ON_BOARD ?auto_7869 ?auto_7868 ) ( SUPPORTS ?auto_7869 ?auto_7867 ) ( POWER_ON ?auto_7869 ) ( POINTING ?auto_7868 ?auto_7871 ) ( not ( = ?auto_7866 ?auto_7871 ) ) ( HAVE_IMAGE ?auto_7870 ?auto_7872 ) ( not ( = ?auto_7870 ?auto_7871 ) ) ( not ( = ?auto_7872 ?auto_7867 ) ) ( CALIBRATION_TARGET ?auto_7869 ?auto_7871 ) ( NOT_CALIBRATED ?auto_7869 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_7868 ?auto_7869 ?auto_7871 )
      ( GET-2IMAGE ?auto_7870 ?auto_7872 ?auto_7866 ?auto_7867 )
      ( GET-1IMAGE-VERIFY ?auto_7866 ?auto_7867 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7874 - DIRECTION
      ?auto_7875 - MODE
      ?auto_7876 - DIRECTION
      ?auto_7873 - MODE
    )
    :vars
    (
      ?auto_7879 - INSTRUMENT
      ?auto_7878 - SATELLITE
      ?auto_7877 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7876 ?auto_7874 ) ) ( ON_BOARD ?auto_7879 ?auto_7878 ) ( SUPPORTS ?auto_7879 ?auto_7873 ) ( POWER_ON ?auto_7879 ) ( POINTING ?auto_7878 ?auto_7877 ) ( not ( = ?auto_7876 ?auto_7877 ) ) ( HAVE_IMAGE ?auto_7874 ?auto_7875 ) ( not ( = ?auto_7874 ?auto_7877 ) ) ( not ( = ?auto_7875 ?auto_7873 ) ) ( CALIBRATION_TARGET ?auto_7879 ?auto_7877 ) ( NOT_CALIBRATED ?auto_7879 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7876 ?auto_7873 )
      ( GET-2IMAGE-VERIFY ?auto_7874 ?auto_7875 ?auto_7876 ?auto_7873 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7881 - DIRECTION
      ?auto_7882 - MODE
      ?auto_7883 - DIRECTION
      ?auto_7880 - MODE
    )
    :vars
    (
      ?auto_7886 - INSTRUMENT
      ?auto_7884 - SATELLITE
      ?auto_7885 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7883 ?auto_7881 ) ) ( ON_BOARD ?auto_7886 ?auto_7884 ) ( SUPPORTS ?auto_7886 ?auto_7882 ) ( POWER_ON ?auto_7886 ) ( POINTING ?auto_7884 ?auto_7885 ) ( not ( = ?auto_7881 ?auto_7885 ) ) ( HAVE_IMAGE ?auto_7883 ?auto_7880 ) ( not ( = ?auto_7883 ?auto_7885 ) ) ( not ( = ?auto_7880 ?auto_7882 ) ) ( CALIBRATION_TARGET ?auto_7886 ?auto_7885 ) ( NOT_CALIBRATED ?auto_7886 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7883 ?auto_7880 ?auto_7881 ?auto_7882 )
      ( GET-2IMAGE-VERIFY ?auto_7881 ?auto_7882 ?auto_7883 ?auto_7880 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7961 - DIRECTION
      ?auto_7962 - MODE
    )
    :vars
    (
      ?auto_7963 - DIRECTION
      ?auto_7967 - INSTRUMENT
      ?auto_7965 - SATELLITE
      ?auto_7966 - DIRECTION
      ?auto_7964 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_7961 ?auto_7963 ) ) ( ON_BOARD ?auto_7967 ?auto_7965 ) ( SUPPORTS ?auto_7967 ?auto_7962 ) ( POINTING ?auto_7965 ?auto_7966 ) ( not ( = ?auto_7961 ?auto_7966 ) ) ( HAVE_IMAGE ?auto_7963 ?auto_7964 ) ( not ( = ?auto_7963 ?auto_7966 ) ) ( not ( = ?auto_7964 ?auto_7962 ) ) ( CALIBRATION_TARGET ?auto_7967 ?auto_7966 ) ( POWER_AVAIL ?auto_7965 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_7967 ?auto_7965 )
      ( GET-2IMAGE ?auto_7963 ?auto_7964 ?auto_7961 ?auto_7962 )
      ( GET-1IMAGE-VERIFY ?auto_7961 ?auto_7962 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7969 - DIRECTION
      ?auto_7970 - MODE
      ?auto_7971 - DIRECTION
      ?auto_7968 - MODE
    )
    :vars
    (
      ?auto_7974 - INSTRUMENT
      ?auto_7972 - SATELLITE
      ?auto_7973 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7971 ?auto_7969 ) ) ( ON_BOARD ?auto_7974 ?auto_7972 ) ( SUPPORTS ?auto_7974 ?auto_7968 ) ( POINTING ?auto_7972 ?auto_7973 ) ( not ( = ?auto_7971 ?auto_7973 ) ) ( HAVE_IMAGE ?auto_7969 ?auto_7970 ) ( not ( = ?auto_7969 ?auto_7973 ) ) ( not ( = ?auto_7970 ?auto_7968 ) ) ( CALIBRATION_TARGET ?auto_7974 ?auto_7973 ) ( POWER_AVAIL ?auto_7972 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7971 ?auto_7968 )
      ( GET-2IMAGE-VERIFY ?auto_7969 ?auto_7970 ?auto_7971 ?auto_7968 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7976 - DIRECTION
      ?auto_7977 - MODE
      ?auto_7978 - DIRECTION
      ?auto_7975 - MODE
    )
    :vars
    (
      ?auto_7979 - INSTRUMENT
      ?auto_7980 - SATELLITE
      ?auto_7981 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7978 ?auto_7976 ) ) ( ON_BOARD ?auto_7979 ?auto_7980 ) ( SUPPORTS ?auto_7979 ?auto_7977 ) ( POINTING ?auto_7980 ?auto_7981 ) ( not ( = ?auto_7976 ?auto_7981 ) ) ( HAVE_IMAGE ?auto_7978 ?auto_7975 ) ( not ( = ?auto_7978 ?auto_7981 ) ) ( not ( = ?auto_7975 ?auto_7977 ) ) ( CALIBRATION_TARGET ?auto_7979 ?auto_7981 ) ( POWER_AVAIL ?auto_7980 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7978 ?auto_7975 ?auto_7976 ?auto_7977 )
      ( GET-2IMAGE-VERIFY ?auto_7976 ?auto_7977 ?auto_7978 ?auto_7975 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8056 - DIRECTION
      ?auto_8057 - MODE
    )
    :vars
    (
      ?auto_8059 - DIRECTION
      ?auto_8060 - INSTRUMENT
      ?auto_8061 - SATELLITE
      ?auto_8062 - DIRECTION
      ?auto_8058 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_8056 ?auto_8059 ) ) ( ON_BOARD ?auto_8060 ?auto_8061 ) ( SUPPORTS ?auto_8060 ?auto_8057 ) ( not ( = ?auto_8056 ?auto_8062 ) ) ( HAVE_IMAGE ?auto_8059 ?auto_8058 ) ( not ( = ?auto_8059 ?auto_8062 ) ) ( not ( = ?auto_8058 ?auto_8057 ) ) ( CALIBRATION_TARGET ?auto_8060 ?auto_8062 ) ( POWER_AVAIL ?auto_8061 ) ( POINTING ?auto_8061 ?auto_8059 ) )
    :subtasks
    ( ( !TURN_TO ?auto_8061 ?auto_8062 ?auto_8059 )
      ( GET-2IMAGE ?auto_8059 ?auto_8058 ?auto_8056 ?auto_8057 )
      ( GET-1IMAGE-VERIFY ?auto_8056 ?auto_8057 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8064 - DIRECTION
      ?auto_8065 - MODE
      ?auto_8066 - DIRECTION
      ?auto_8063 - MODE
    )
    :vars
    (
      ?auto_8067 - INSTRUMENT
      ?auto_8069 - SATELLITE
      ?auto_8068 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8066 ?auto_8064 ) ) ( ON_BOARD ?auto_8067 ?auto_8069 ) ( SUPPORTS ?auto_8067 ?auto_8063 ) ( not ( = ?auto_8066 ?auto_8068 ) ) ( HAVE_IMAGE ?auto_8064 ?auto_8065 ) ( not ( = ?auto_8064 ?auto_8068 ) ) ( not ( = ?auto_8065 ?auto_8063 ) ) ( CALIBRATION_TARGET ?auto_8067 ?auto_8068 ) ( POWER_AVAIL ?auto_8069 ) ( POINTING ?auto_8069 ?auto_8064 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8066 ?auto_8063 )
      ( GET-2IMAGE-VERIFY ?auto_8064 ?auto_8065 ?auto_8066 ?auto_8063 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8071 - DIRECTION
      ?auto_8072 - MODE
      ?auto_8073 - DIRECTION
      ?auto_8070 - MODE
    )
    :vars
    (
      ?auto_8076 - INSTRUMENT
      ?auto_8074 - SATELLITE
      ?auto_8075 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8073 ?auto_8071 ) ) ( ON_BOARD ?auto_8076 ?auto_8074 ) ( SUPPORTS ?auto_8076 ?auto_8072 ) ( not ( = ?auto_8071 ?auto_8075 ) ) ( HAVE_IMAGE ?auto_8073 ?auto_8070 ) ( not ( = ?auto_8073 ?auto_8075 ) ) ( not ( = ?auto_8070 ?auto_8072 ) ) ( CALIBRATION_TARGET ?auto_8076 ?auto_8075 ) ( POWER_AVAIL ?auto_8074 ) ( POINTING ?auto_8074 ?auto_8073 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8073 ?auto_8070 ?auto_8071 ?auto_8072 )
      ( GET-2IMAGE-VERIFY ?auto_8071 ?auto_8072 ?auto_8073 ?auto_8070 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8151 - DIRECTION
      ?auto_8152 - MODE
    )
    :vars
    (
      ?auto_8153 - DIRECTION
      ?auto_8157 - INSTRUMENT
      ?auto_8154 - SATELLITE
      ?auto_8155 - DIRECTION
      ?auto_8156 - MODE
      ?auto_8158 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_8151 ?auto_8153 ) ) ( ON_BOARD ?auto_8157 ?auto_8154 ) ( SUPPORTS ?auto_8157 ?auto_8152 ) ( not ( = ?auto_8151 ?auto_8155 ) ) ( HAVE_IMAGE ?auto_8153 ?auto_8156 ) ( not ( = ?auto_8153 ?auto_8155 ) ) ( not ( = ?auto_8156 ?auto_8152 ) ) ( CALIBRATION_TARGET ?auto_8157 ?auto_8155 ) ( POINTING ?auto_8154 ?auto_8153 ) ( ON_BOARD ?auto_8158 ?auto_8154 ) ( POWER_ON ?auto_8158 ) ( not ( = ?auto_8157 ?auto_8158 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_8158 ?auto_8154 )
      ( GET-2IMAGE ?auto_8153 ?auto_8156 ?auto_8151 ?auto_8152 )
      ( GET-1IMAGE-VERIFY ?auto_8151 ?auto_8152 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8160 - DIRECTION
      ?auto_8161 - MODE
      ?auto_8162 - DIRECTION
      ?auto_8159 - MODE
    )
    :vars
    (
      ?auto_8165 - INSTRUMENT
      ?auto_8163 - SATELLITE
      ?auto_8164 - DIRECTION
      ?auto_8166 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_8162 ?auto_8160 ) ) ( ON_BOARD ?auto_8165 ?auto_8163 ) ( SUPPORTS ?auto_8165 ?auto_8159 ) ( not ( = ?auto_8162 ?auto_8164 ) ) ( HAVE_IMAGE ?auto_8160 ?auto_8161 ) ( not ( = ?auto_8160 ?auto_8164 ) ) ( not ( = ?auto_8161 ?auto_8159 ) ) ( CALIBRATION_TARGET ?auto_8165 ?auto_8164 ) ( POINTING ?auto_8163 ?auto_8160 ) ( ON_BOARD ?auto_8166 ?auto_8163 ) ( POWER_ON ?auto_8166 ) ( not ( = ?auto_8165 ?auto_8166 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8162 ?auto_8159 )
      ( GET-2IMAGE-VERIFY ?auto_8160 ?auto_8161 ?auto_8162 ?auto_8159 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8168 - DIRECTION
      ?auto_8169 - MODE
      ?auto_8170 - DIRECTION
      ?auto_8167 - MODE
    )
    :vars
    (
      ?auto_8171 - INSTRUMENT
      ?auto_8172 - SATELLITE
      ?auto_8173 - DIRECTION
      ?auto_8174 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_8170 ?auto_8168 ) ) ( ON_BOARD ?auto_8171 ?auto_8172 ) ( SUPPORTS ?auto_8171 ?auto_8169 ) ( not ( = ?auto_8168 ?auto_8173 ) ) ( HAVE_IMAGE ?auto_8170 ?auto_8167 ) ( not ( = ?auto_8170 ?auto_8173 ) ) ( not ( = ?auto_8167 ?auto_8169 ) ) ( CALIBRATION_TARGET ?auto_8171 ?auto_8173 ) ( POINTING ?auto_8172 ?auto_8170 ) ( ON_BOARD ?auto_8174 ?auto_8172 ) ( POWER_ON ?auto_8174 ) ( not ( = ?auto_8171 ?auto_8174 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8170 ?auto_8167 ?auto_8168 ?auto_8169 )
      ( GET-2IMAGE-VERIFY ?auto_8168 ?auto_8169 ?auto_8170 ?auto_8167 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8257 - DIRECTION
      ?auto_8258 - MODE
    )
    :vars
    (
      ?auto_8261 - DIRECTION
      ?auto_8259 - INSTRUMENT
      ?auto_8260 - SATELLITE
      ?auto_8262 - DIRECTION
      ?auto_8264 - MODE
      ?auto_8263 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_8257 ?auto_8261 ) ) ( ON_BOARD ?auto_8259 ?auto_8260 ) ( SUPPORTS ?auto_8259 ?auto_8258 ) ( not ( = ?auto_8257 ?auto_8262 ) ) ( not ( = ?auto_8261 ?auto_8262 ) ) ( not ( = ?auto_8264 ?auto_8258 ) ) ( CALIBRATION_TARGET ?auto_8259 ?auto_8262 ) ( POINTING ?auto_8260 ?auto_8261 ) ( ON_BOARD ?auto_8263 ?auto_8260 ) ( POWER_ON ?auto_8263 ) ( not ( = ?auto_8259 ?auto_8263 ) ) ( CALIBRATED ?auto_8263 ) ( SUPPORTS ?auto_8263 ?auto_8264 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8261 ?auto_8264 )
      ( GET-2IMAGE ?auto_8261 ?auto_8264 ?auto_8257 ?auto_8258 )
      ( GET-1IMAGE-VERIFY ?auto_8257 ?auto_8258 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8266 - DIRECTION
      ?auto_8267 - MODE
      ?auto_8268 - DIRECTION
      ?auto_8265 - MODE
    )
    :vars
    (
      ?auto_8272 - INSTRUMENT
      ?auto_8270 - SATELLITE
      ?auto_8269 - DIRECTION
      ?auto_8271 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_8268 ?auto_8266 ) ) ( ON_BOARD ?auto_8272 ?auto_8270 ) ( SUPPORTS ?auto_8272 ?auto_8265 ) ( not ( = ?auto_8268 ?auto_8269 ) ) ( not ( = ?auto_8266 ?auto_8269 ) ) ( not ( = ?auto_8267 ?auto_8265 ) ) ( CALIBRATION_TARGET ?auto_8272 ?auto_8269 ) ( POINTING ?auto_8270 ?auto_8266 ) ( ON_BOARD ?auto_8271 ?auto_8270 ) ( POWER_ON ?auto_8271 ) ( not ( = ?auto_8272 ?auto_8271 ) ) ( CALIBRATED ?auto_8271 ) ( SUPPORTS ?auto_8271 ?auto_8267 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8268 ?auto_8265 )
      ( GET-2IMAGE-VERIFY ?auto_8266 ?auto_8267 ?auto_8268 ?auto_8265 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8274 - DIRECTION
      ?auto_8275 - MODE
      ?auto_8276 - DIRECTION
      ?auto_8273 - MODE
    )
    :vars
    (
      ?auto_8277 - INSTRUMENT
      ?auto_8278 - SATELLITE
      ?auto_8279 - DIRECTION
      ?auto_8280 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_8276 ?auto_8274 ) ) ( ON_BOARD ?auto_8277 ?auto_8278 ) ( SUPPORTS ?auto_8277 ?auto_8275 ) ( not ( = ?auto_8274 ?auto_8279 ) ) ( not ( = ?auto_8276 ?auto_8279 ) ) ( not ( = ?auto_8273 ?auto_8275 ) ) ( CALIBRATION_TARGET ?auto_8277 ?auto_8279 ) ( POINTING ?auto_8278 ?auto_8276 ) ( ON_BOARD ?auto_8280 ?auto_8278 ) ( POWER_ON ?auto_8280 ) ( not ( = ?auto_8277 ?auto_8280 ) ) ( CALIBRATED ?auto_8280 ) ( SUPPORTS ?auto_8280 ?auto_8273 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8276 ?auto_8273 ?auto_8274 ?auto_8275 )
      ( GET-2IMAGE-VERIFY ?auto_8274 ?auto_8275 ?auto_8276 ?auto_8273 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8363 - DIRECTION
      ?auto_8364 - MODE
    )
    :vars
    (
      ?auto_8365 - DIRECTION
      ?auto_8366 - INSTRUMENT
      ?auto_8367 - SATELLITE
      ?auto_8369 - DIRECTION
      ?auto_8368 - MODE
      ?auto_8370 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_8363 ?auto_8365 ) ) ( ON_BOARD ?auto_8366 ?auto_8367 ) ( SUPPORTS ?auto_8366 ?auto_8364 ) ( not ( = ?auto_8363 ?auto_8369 ) ) ( not ( = ?auto_8365 ?auto_8369 ) ) ( not ( = ?auto_8368 ?auto_8364 ) ) ( CALIBRATION_TARGET ?auto_8366 ?auto_8369 ) ( ON_BOARD ?auto_8370 ?auto_8367 ) ( POWER_ON ?auto_8370 ) ( not ( = ?auto_8366 ?auto_8370 ) ) ( CALIBRATED ?auto_8370 ) ( SUPPORTS ?auto_8370 ?auto_8368 ) ( POINTING ?auto_8367 ?auto_8369 ) )
    :subtasks
    ( ( !TURN_TO ?auto_8367 ?auto_8365 ?auto_8369 )
      ( GET-2IMAGE ?auto_8365 ?auto_8368 ?auto_8363 ?auto_8364 )
      ( GET-1IMAGE-VERIFY ?auto_8363 ?auto_8364 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8372 - DIRECTION
      ?auto_8373 - MODE
      ?auto_8374 - DIRECTION
      ?auto_8371 - MODE
    )
    :vars
    (
      ?auto_8376 - INSTRUMENT
      ?auto_8378 - SATELLITE
      ?auto_8377 - DIRECTION
      ?auto_8375 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_8374 ?auto_8372 ) ) ( ON_BOARD ?auto_8376 ?auto_8378 ) ( SUPPORTS ?auto_8376 ?auto_8371 ) ( not ( = ?auto_8374 ?auto_8377 ) ) ( not ( = ?auto_8372 ?auto_8377 ) ) ( not ( = ?auto_8373 ?auto_8371 ) ) ( CALIBRATION_TARGET ?auto_8376 ?auto_8377 ) ( ON_BOARD ?auto_8375 ?auto_8378 ) ( POWER_ON ?auto_8375 ) ( not ( = ?auto_8376 ?auto_8375 ) ) ( CALIBRATED ?auto_8375 ) ( SUPPORTS ?auto_8375 ?auto_8373 ) ( POINTING ?auto_8378 ?auto_8377 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8374 ?auto_8371 )
      ( GET-2IMAGE-VERIFY ?auto_8372 ?auto_8373 ?auto_8374 ?auto_8371 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8380 - DIRECTION
      ?auto_8381 - MODE
      ?auto_8382 - DIRECTION
      ?auto_8379 - MODE
    )
    :vars
    (
      ?auto_8385 - INSTRUMENT
      ?auto_8386 - SATELLITE
      ?auto_8383 - DIRECTION
      ?auto_8384 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_8382 ?auto_8380 ) ) ( ON_BOARD ?auto_8385 ?auto_8386 ) ( SUPPORTS ?auto_8385 ?auto_8381 ) ( not ( = ?auto_8380 ?auto_8383 ) ) ( not ( = ?auto_8382 ?auto_8383 ) ) ( not ( = ?auto_8379 ?auto_8381 ) ) ( CALIBRATION_TARGET ?auto_8385 ?auto_8383 ) ( ON_BOARD ?auto_8384 ?auto_8386 ) ( POWER_ON ?auto_8384 ) ( not ( = ?auto_8385 ?auto_8384 ) ) ( CALIBRATED ?auto_8384 ) ( SUPPORTS ?auto_8384 ?auto_8379 ) ( POINTING ?auto_8386 ?auto_8383 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8382 ?auto_8379 ?auto_8380 ?auto_8381 )
      ( GET-2IMAGE-VERIFY ?auto_8380 ?auto_8381 ?auto_8382 ?auto_8379 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8469 - DIRECTION
      ?auto_8470 - MODE
    )
    :vars
    (
      ?auto_8475 - DIRECTION
      ?auto_8474 - INSTRUMENT
      ?auto_8476 - SATELLITE
      ?auto_8472 - DIRECTION
      ?auto_8471 - MODE
      ?auto_8473 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_8469 ?auto_8475 ) ) ( ON_BOARD ?auto_8474 ?auto_8476 ) ( SUPPORTS ?auto_8474 ?auto_8470 ) ( not ( = ?auto_8469 ?auto_8472 ) ) ( not ( = ?auto_8475 ?auto_8472 ) ) ( not ( = ?auto_8471 ?auto_8470 ) ) ( CALIBRATION_TARGET ?auto_8474 ?auto_8472 ) ( ON_BOARD ?auto_8473 ?auto_8476 ) ( POWER_ON ?auto_8473 ) ( not ( = ?auto_8474 ?auto_8473 ) ) ( SUPPORTS ?auto_8473 ?auto_8471 ) ( POINTING ?auto_8476 ?auto_8472 ) ( CALIBRATION_TARGET ?auto_8473 ?auto_8472 ) ( NOT_CALIBRATED ?auto_8473 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_8476 ?auto_8473 ?auto_8472 )
      ( GET-2IMAGE ?auto_8475 ?auto_8471 ?auto_8469 ?auto_8470 )
      ( GET-1IMAGE-VERIFY ?auto_8469 ?auto_8470 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8478 - DIRECTION
      ?auto_8479 - MODE
      ?auto_8480 - DIRECTION
      ?auto_8477 - MODE
    )
    :vars
    (
      ?auto_8482 - INSTRUMENT
      ?auto_8481 - SATELLITE
      ?auto_8484 - DIRECTION
      ?auto_8483 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_8480 ?auto_8478 ) ) ( ON_BOARD ?auto_8482 ?auto_8481 ) ( SUPPORTS ?auto_8482 ?auto_8477 ) ( not ( = ?auto_8480 ?auto_8484 ) ) ( not ( = ?auto_8478 ?auto_8484 ) ) ( not ( = ?auto_8479 ?auto_8477 ) ) ( CALIBRATION_TARGET ?auto_8482 ?auto_8484 ) ( ON_BOARD ?auto_8483 ?auto_8481 ) ( POWER_ON ?auto_8483 ) ( not ( = ?auto_8482 ?auto_8483 ) ) ( SUPPORTS ?auto_8483 ?auto_8479 ) ( POINTING ?auto_8481 ?auto_8484 ) ( CALIBRATION_TARGET ?auto_8483 ?auto_8484 ) ( NOT_CALIBRATED ?auto_8483 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8480 ?auto_8477 )
      ( GET-2IMAGE-VERIFY ?auto_8478 ?auto_8479 ?auto_8480 ?auto_8477 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8486 - DIRECTION
      ?auto_8487 - MODE
      ?auto_8488 - DIRECTION
      ?auto_8485 - MODE
    )
    :vars
    (
      ?auto_8492 - INSTRUMENT
      ?auto_8489 - SATELLITE
      ?auto_8491 - DIRECTION
      ?auto_8490 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_8488 ?auto_8486 ) ) ( ON_BOARD ?auto_8492 ?auto_8489 ) ( SUPPORTS ?auto_8492 ?auto_8487 ) ( not ( = ?auto_8486 ?auto_8491 ) ) ( not ( = ?auto_8488 ?auto_8491 ) ) ( not ( = ?auto_8485 ?auto_8487 ) ) ( CALIBRATION_TARGET ?auto_8492 ?auto_8491 ) ( ON_BOARD ?auto_8490 ?auto_8489 ) ( POWER_ON ?auto_8490 ) ( not ( = ?auto_8492 ?auto_8490 ) ) ( SUPPORTS ?auto_8490 ?auto_8485 ) ( POINTING ?auto_8489 ?auto_8491 ) ( CALIBRATION_TARGET ?auto_8490 ?auto_8491 ) ( NOT_CALIBRATED ?auto_8490 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8488 ?auto_8485 ?auto_8486 ?auto_8487 )
      ( GET-2IMAGE-VERIFY ?auto_8486 ?auto_8487 ?auto_8488 ?auto_8485 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8932 - DIRECTION
      ?auto_8933 - MODE
      ?auto_8934 - DIRECTION
      ?auto_8931 - MODE
      ?auto_8936 - DIRECTION
      ?auto_8935 - MODE
    )
    :vars
    (
      ?auto_8938 - INSTRUMENT
      ?auto_8937 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_8934 ?auto_8932 ) ) ( not ( = ?auto_8936 ?auto_8932 ) ) ( not ( = ?auto_8936 ?auto_8934 ) ) ( CALIBRATED ?auto_8938 ) ( ON_BOARD ?auto_8938 ?auto_8937 ) ( SUPPORTS ?auto_8938 ?auto_8935 ) ( POWER_ON ?auto_8938 ) ( POINTING ?auto_8937 ?auto_8936 ) ( HAVE_IMAGE ?auto_8932 ?auto_8933 ) ( HAVE_IMAGE ?auto_8934 ?auto_8931 ) ( not ( = ?auto_8933 ?auto_8931 ) ) ( not ( = ?auto_8933 ?auto_8935 ) ) ( not ( = ?auto_8931 ?auto_8935 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8936 ?auto_8935 )
      ( GET-3IMAGE-VERIFY ?auto_8932 ?auto_8933 ?auto_8934 ?auto_8931 ?auto_8936 ?auto_8935 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8948 - DIRECTION
      ?auto_8949 - MODE
      ?auto_8950 - DIRECTION
      ?auto_8947 - MODE
      ?auto_8952 - DIRECTION
      ?auto_8951 - MODE
    )
    :vars
    (
      ?auto_8954 - INSTRUMENT
      ?auto_8953 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_8950 ?auto_8948 ) ) ( not ( = ?auto_8952 ?auto_8948 ) ) ( not ( = ?auto_8952 ?auto_8950 ) ) ( CALIBRATED ?auto_8954 ) ( ON_BOARD ?auto_8954 ?auto_8953 ) ( SUPPORTS ?auto_8954 ?auto_8947 ) ( POWER_ON ?auto_8954 ) ( POINTING ?auto_8953 ?auto_8950 ) ( HAVE_IMAGE ?auto_8948 ?auto_8949 ) ( HAVE_IMAGE ?auto_8952 ?auto_8951 ) ( not ( = ?auto_8949 ?auto_8947 ) ) ( not ( = ?auto_8949 ?auto_8951 ) ) ( not ( = ?auto_8947 ?auto_8951 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8950 ?auto_8947 )
      ( GET-3IMAGE-VERIFY ?auto_8948 ?auto_8949 ?auto_8950 ?auto_8947 ?auto_8952 ?auto_8951 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9008 - DIRECTION
      ?auto_9009 - MODE
      ?auto_9010 - DIRECTION
      ?auto_9007 - MODE
      ?auto_9012 - DIRECTION
      ?auto_9011 - MODE
    )
    :vars
    (
      ?auto_9014 - INSTRUMENT
      ?auto_9013 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_9010 ?auto_9008 ) ) ( not ( = ?auto_9012 ?auto_9008 ) ) ( not ( = ?auto_9012 ?auto_9010 ) ) ( CALIBRATED ?auto_9014 ) ( ON_BOARD ?auto_9014 ?auto_9013 ) ( SUPPORTS ?auto_9014 ?auto_9009 ) ( POWER_ON ?auto_9014 ) ( POINTING ?auto_9013 ?auto_9008 ) ( HAVE_IMAGE ?auto_9010 ?auto_9007 ) ( HAVE_IMAGE ?auto_9012 ?auto_9011 ) ( not ( = ?auto_9009 ?auto_9007 ) ) ( not ( = ?auto_9009 ?auto_9011 ) ) ( not ( = ?auto_9007 ?auto_9011 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9008 ?auto_9009 )
      ( GET-3IMAGE-VERIFY ?auto_9008 ?auto_9009 ?auto_9010 ?auto_9007 ?auto_9012 ?auto_9011 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9115 - DIRECTION
      ?auto_9116 - MODE
      ?auto_9117 - DIRECTION
      ?auto_9114 - MODE
      ?auto_9119 - DIRECTION
      ?auto_9118 - MODE
    )
    :vars
    (
      ?auto_9122 - INSTRUMENT
      ?auto_9121 - SATELLITE
      ?auto_9120 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9117 ?auto_9115 ) ) ( not ( = ?auto_9119 ?auto_9115 ) ) ( not ( = ?auto_9119 ?auto_9117 ) ) ( CALIBRATED ?auto_9122 ) ( ON_BOARD ?auto_9122 ?auto_9121 ) ( SUPPORTS ?auto_9122 ?auto_9118 ) ( POWER_ON ?auto_9122 ) ( POINTING ?auto_9121 ?auto_9120 ) ( not ( = ?auto_9119 ?auto_9120 ) ) ( HAVE_IMAGE ?auto_9115 ?auto_9116 ) ( not ( = ?auto_9115 ?auto_9120 ) ) ( not ( = ?auto_9116 ?auto_9118 ) ) ( HAVE_IMAGE ?auto_9117 ?auto_9114 ) ( not ( = ?auto_9116 ?auto_9114 ) ) ( not ( = ?auto_9117 ?auto_9120 ) ) ( not ( = ?auto_9114 ?auto_9118 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9115 ?auto_9116 ?auto_9119 ?auto_9118 )
      ( GET-3IMAGE-VERIFY ?auto_9115 ?auto_9116 ?auto_9117 ?auto_9114 ?auto_9119 ?auto_9118 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9133 - DIRECTION
      ?auto_9134 - MODE
      ?auto_9135 - DIRECTION
      ?auto_9132 - MODE
      ?auto_9137 - DIRECTION
      ?auto_9136 - MODE
    )
    :vars
    (
      ?auto_9140 - INSTRUMENT
      ?auto_9139 - SATELLITE
      ?auto_9138 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9135 ?auto_9133 ) ) ( not ( = ?auto_9137 ?auto_9133 ) ) ( not ( = ?auto_9137 ?auto_9135 ) ) ( CALIBRATED ?auto_9140 ) ( ON_BOARD ?auto_9140 ?auto_9139 ) ( SUPPORTS ?auto_9140 ?auto_9132 ) ( POWER_ON ?auto_9140 ) ( POINTING ?auto_9139 ?auto_9138 ) ( not ( = ?auto_9135 ?auto_9138 ) ) ( HAVE_IMAGE ?auto_9133 ?auto_9134 ) ( not ( = ?auto_9133 ?auto_9138 ) ) ( not ( = ?auto_9134 ?auto_9132 ) ) ( HAVE_IMAGE ?auto_9137 ?auto_9136 ) ( not ( = ?auto_9134 ?auto_9136 ) ) ( not ( = ?auto_9132 ?auto_9136 ) ) ( not ( = ?auto_9137 ?auto_9138 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9133 ?auto_9134 ?auto_9135 ?auto_9132 )
      ( GET-3IMAGE-VERIFY ?auto_9133 ?auto_9134 ?auto_9135 ?auto_9132 ?auto_9137 ?auto_9136 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9205 - DIRECTION
      ?auto_9206 - MODE
      ?auto_9207 - DIRECTION
      ?auto_9204 - MODE
      ?auto_9209 - DIRECTION
      ?auto_9208 - MODE
    )
    :vars
    (
      ?auto_9212 - INSTRUMENT
      ?auto_9211 - SATELLITE
      ?auto_9210 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9207 ?auto_9205 ) ) ( not ( = ?auto_9209 ?auto_9205 ) ) ( not ( = ?auto_9209 ?auto_9207 ) ) ( CALIBRATED ?auto_9212 ) ( ON_BOARD ?auto_9212 ?auto_9211 ) ( SUPPORTS ?auto_9212 ?auto_9206 ) ( POWER_ON ?auto_9212 ) ( POINTING ?auto_9211 ?auto_9210 ) ( not ( = ?auto_9205 ?auto_9210 ) ) ( HAVE_IMAGE ?auto_9207 ?auto_9204 ) ( not ( = ?auto_9207 ?auto_9210 ) ) ( not ( = ?auto_9204 ?auto_9206 ) ) ( HAVE_IMAGE ?auto_9209 ?auto_9208 ) ( not ( = ?auto_9206 ?auto_9208 ) ) ( not ( = ?auto_9204 ?auto_9208 ) ) ( not ( = ?auto_9209 ?auto_9210 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9207 ?auto_9204 ?auto_9205 ?auto_9206 )
      ( GET-3IMAGE-VERIFY ?auto_9205 ?auto_9206 ?auto_9207 ?auto_9204 ?auto_9209 ?auto_9208 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9329 - DIRECTION
      ?auto_9330 - MODE
      ?auto_9331 - DIRECTION
      ?auto_9328 - MODE
      ?auto_9333 - DIRECTION
      ?auto_9332 - MODE
    )
    :vars
    (
      ?auto_9335 - INSTRUMENT
      ?auto_9336 - SATELLITE
      ?auto_9334 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9331 ?auto_9329 ) ) ( not ( = ?auto_9333 ?auto_9329 ) ) ( not ( = ?auto_9333 ?auto_9331 ) ) ( ON_BOARD ?auto_9335 ?auto_9336 ) ( SUPPORTS ?auto_9335 ?auto_9332 ) ( POWER_ON ?auto_9335 ) ( POINTING ?auto_9336 ?auto_9334 ) ( not ( = ?auto_9333 ?auto_9334 ) ) ( HAVE_IMAGE ?auto_9329 ?auto_9330 ) ( not ( = ?auto_9329 ?auto_9334 ) ) ( not ( = ?auto_9330 ?auto_9332 ) ) ( CALIBRATION_TARGET ?auto_9335 ?auto_9334 ) ( NOT_CALIBRATED ?auto_9335 ) ( HAVE_IMAGE ?auto_9331 ?auto_9328 ) ( not ( = ?auto_9330 ?auto_9328 ) ) ( not ( = ?auto_9331 ?auto_9334 ) ) ( not ( = ?auto_9328 ?auto_9332 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9329 ?auto_9330 ?auto_9333 ?auto_9332 )
      ( GET-3IMAGE-VERIFY ?auto_9329 ?auto_9330 ?auto_9331 ?auto_9328 ?auto_9333 ?auto_9332 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9347 - DIRECTION
      ?auto_9348 - MODE
      ?auto_9349 - DIRECTION
      ?auto_9346 - MODE
      ?auto_9351 - DIRECTION
      ?auto_9350 - MODE
    )
    :vars
    (
      ?auto_9353 - INSTRUMENT
      ?auto_9354 - SATELLITE
      ?auto_9352 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9349 ?auto_9347 ) ) ( not ( = ?auto_9351 ?auto_9347 ) ) ( not ( = ?auto_9351 ?auto_9349 ) ) ( ON_BOARD ?auto_9353 ?auto_9354 ) ( SUPPORTS ?auto_9353 ?auto_9346 ) ( POWER_ON ?auto_9353 ) ( POINTING ?auto_9354 ?auto_9352 ) ( not ( = ?auto_9349 ?auto_9352 ) ) ( HAVE_IMAGE ?auto_9347 ?auto_9348 ) ( not ( = ?auto_9347 ?auto_9352 ) ) ( not ( = ?auto_9348 ?auto_9346 ) ) ( CALIBRATION_TARGET ?auto_9353 ?auto_9352 ) ( NOT_CALIBRATED ?auto_9353 ) ( HAVE_IMAGE ?auto_9351 ?auto_9350 ) ( not ( = ?auto_9348 ?auto_9350 ) ) ( not ( = ?auto_9346 ?auto_9350 ) ) ( not ( = ?auto_9351 ?auto_9352 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9347 ?auto_9348 ?auto_9349 ?auto_9346 )
      ( GET-3IMAGE-VERIFY ?auto_9347 ?auto_9348 ?auto_9349 ?auto_9346 ?auto_9351 ?auto_9350 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9419 - DIRECTION
      ?auto_9420 - MODE
      ?auto_9421 - DIRECTION
      ?auto_9418 - MODE
      ?auto_9423 - DIRECTION
      ?auto_9422 - MODE
    )
    :vars
    (
      ?auto_9425 - INSTRUMENT
      ?auto_9426 - SATELLITE
      ?auto_9424 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9421 ?auto_9419 ) ) ( not ( = ?auto_9423 ?auto_9419 ) ) ( not ( = ?auto_9423 ?auto_9421 ) ) ( ON_BOARD ?auto_9425 ?auto_9426 ) ( SUPPORTS ?auto_9425 ?auto_9420 ) ( POWER_ON ?auto_9425 ) ( POINTING ?auto_9426 ?auto_9424 ) ( not ( = ?auto_9419 ?auto_9424 ) ) ( HAVE_IMAGE ?auto_9421 ?auto_9418 ) ( not ( = ?auto_9421 ?auto_9424 ) ) ( not ( = ?auto_9418 ?auto_9420 ) ) ( CALIBRATION_TARGET ?auto_9425 ?auto_9424 ) ( NOT_CALIBRATED ?auto_9425 ) ( HAVE_IMAGE ?auto_9423 ?auto_9422 ) ( not ( = ?auto_9420 ?auto_9422 ) ) ( not ( = ?auto_9418 ?auto_9422 ) ) ( not ( = ?auto_9423 ?auto_9424 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9421 ?auto_9418 ?auto_9419 ?auto_9420 )
      ( GET-3IMAGE-VERIFY ?auto_9419 ?auto_9420 ?auto_9421 ?auto_9418 ?auto_9423 ?auto_9422 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9543 - DIRECTION
      ?auto_9544 - MODE
      ?auto_9545 - DIRECTION
      ?auto_9542 - MODE
      ?auto_9547 - DIRECTION
      ?auto_9546 - MODE
    )
    :vars
    (
      ?auto_9549 - INSTRUMENT
      ?auto_9550 - SATELLITE
      ?auto_9548 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9545 ?auto_9543 ) ) ( not ( = ?auto_9547 ?auto_9543 ) ) ( not ( = ?auto_9547 ?auto_9545 ) ) ( ON_BOARD ?auto_9549 ?auto_9550 ) ( SUPPORTS ?auto_9549 ?auto_9546 ) ( POINTING ?auto_9550 ?auto_9548 ) ( not ( = ?auto_9547 ?auto_9548 ) ) ( HAVE_IMAGE ?auto_9543 ?auto_9544 ) ( not ( = ?auto_9543 ?auto_9548 ) ) ( not ( = ?auto_9544 ?auto_9546 ) ) ( CALIBRATION_TARGET ?auto_9549 ?auto_9548 ) ( POWER_AVAIL ?auto_9550 ) ( HAVE_IMAGE ?auto_9545 ?auto_9542 ) ( not ( = ?auto_9544 ?auto_9542 ) ) ( not ( = ?auto_9545 ?auto_9548 ) ) ( not ( = ?auto_9542 ?auto_9546 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9543 ?auto_9544 ?auto_9547 ?auto_9546 )
      ( GET-3IMAGE-VERIFY ?auto_9543 ?auto_9544 ?auto_9545 ?auto_9542 ?auto_9547 ?auto_9546 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9561 - DIRECTION
      ?auto_9562 - MODE
      ?auto_9563 - DIRECTION
      ?auto_9560 - MODE
      ?auto_9565 - DIRECTION
      ?auto_9564 - MODE
    )
    :vars
    (
      ?auto_9567 - INSTRUMENT
      ?auto_9568 - SATELLITE
      ?auto_9566 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9563 ?auto_9561 ) ) ( not ( = ?auto_9565 ?auto_9561 ) ) ( not ( = ?auto_9565 ?auto_9563 ) ) ( ON_BOARD ?auto_9567 ?auto_9568 ) ( SUPPORTS ?auto_9567 ?auto_9560 ) ( POINTING ?auto_9568 ?auto_9566 ) ( not ( = ?auto_9563 ?auto_9566 ) ) ( HAVE_IMAGE ?auto_9561 ?auto_9562 ) ( not ( = ?auto_9561 ?auto_9566 ) ) ( not ( = ?auto_9562 ?auto_9560 ) ) ( CALIBRATION_TARGET ?auto_9567 ?auto_9566 ) ( POWER_AVAIL ?auto_9568 ) ( HAVE_IMAGE ?auto_9565 ?auto_9564 ) ( not ( = ?auto_9562 ?auto_9564 ) ) ( not ( = ?auto_9560 ?auto_9564 ) ) ( not ( = ?auto_9565 ?auto_9566 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9561 ?auto_9562 ?auto_9563 ?auto_9560 )
      ( GET-3IMAGE-VERIFY ?auto_9561 ?auto_9562 ?auto_9563 ?auto_9560 ?auto_9565 ?auto_9564 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9633 - DIRECTION
      ?auto_9634 - MODE
      ?auto_9635 - DIRECTION
      ?auto_9632 - MODE
      ?auto_9637 - DIRECTION
      ?auto_9636 - MODE
    )
    :vars
    (
      ?auto_9639 - INSTRUMENT
      ?auto_9640 - SATELLITE
      ?auto_9638 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9635 ?auto_9633 ) ) ( not ( = ?auto_9637 ?auto_9633 ) ) ( not ( = ?auto_9637 ?auto_9635 ) ) ( ON_BOARD ?auto_9639 ?auto_9640 ) ( SUPPORTS ?auto_9639 ?auto_9634 ) ( POINTING ?auto_9640 ?auto_9638 ) ( not ( = ?auto_9633 ?auto_9638 ) ) ( HAVE_IMAGE ?auto_9635 ?auto_9632 ) ( not ( = ?auto_9635 ?auto_9638 ) ) ( not ( = ?auto_9632 ?auto_9634 ) ) ( CALIBRATION_TARGET ?auto_9639 ?auto_9638 ) ( POWER_AVAIL ?auto_9640 ) ( HAVE_IMAGE ?auto_9637 ?auto_9636 ) ( not ( = ?auto_9634 ?auto_9636 ) ) ( not ( = ?auto_9632 ?auto_9636 ) ) ( not ( = ?auto_9637 ?auto_9638 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9635 ?auto_9632 ?auto_9633 ?auto_9634 )
      ( GET-3IMAGE-VERIFY ?auto_9633 ?auto_9634 ?auto_9635 ?auto_9632 ?auto_9637 ?auto_9636 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_9709 - DIRECTION
      ?auto_9710 - MODE
    )
    :vars
    (
      ?auto_9713 - DIRECTION
      ?auto_9712 - INSTRUMENT
      ?auto_9714 - SATELLITE
      ?auto_9711 - DIRECTION
      ?auto_9715 - MODE
      ?auto_9716 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9709 ?auto_9713 ) ) ( ON_BOARD ?auto_9712 ?auto_9714 ) ( SUPPORTS ?auto_9712 ?auto_9710 ) ( not ( = ?auto_9709 ?auto_9711 ) ) ( HAVE_IMAGE ?auto_9713 ?auto_9715 ) ( not ( = ?auto_9713 ?auto_9711 ) ) ( not ( = ?auto_9715 ?auto_9710 ) ) ( CALIBRATION_TARGET ?auto_9712 ?auto_9711 ) ( POWER_AVAIL ?auto_9714 ) ( POINTING ?auto_9714 ?auto_9716 ) ( not ( = ?auto_9711 ?auto_9716 ) ) ( not ( = ?auto_9709 ?auto_9716 ) ) ( not ( = ?auto_9713 ?auto_9716 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_9714 ?auto_9711 ?auto_9716 )
      ( GET-2IMAGE ?auto_9713 ?auto_9715 ?auto_9709 ?auto_9710 )
      ( GET-1IMAGE-VERIFY ?auto_9709 ?auto_9710 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9718 - DIRECTION
      ?auto_9719 - MODE
      ?auto_9720 - DIRECTION
      ?auto_9717 - MODE
    )
    :vars
    (
      ?auto_9721 - INSTRUMENT
      ?auto_9723 - SATELLITE
      ?auto_9722 - DIRECTION
      ?auto_9724 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9720 ?auto_9718 ) ) ( ON_BOARD ?auto_9721 ?auto_9723 ) ( SUPPORTS ?auto_9721 ?auto_9717 ) ( not ( = ?auto_9720 ?auto_9722 ) ) ( HAVE_IMAGE ?auto_9718 ?auto_9719 ) ( not ( = ?auto_9718 ?auto_9722 ) ) ( not ( = ?auto_9719 ?auto_9717 ) ) ( CALIBRATION_TARGET ?auto_9721 ?auto_9722 ) ( POWER_AVAIL ?auto_9723 ) ( POINTING ?auto_9723 ?auto_9724 ) ( not ( = ?auto_9722 ?auto_9724 ) ) ( not ( = ?auto_9720 ?auto_9724 ) ) ( not ( = ?auto_9718 ?auto_9724 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9720 ?auto_9717 )
      ( GET-2IMAGE-VERIFY ?auto_9718 ?auto_9719 ?auto_9720 ?auto_9717 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9726 - DIRECTION
      ?auto_9727 - MODE
      ?auto_9728 - DIRECTION
      ?auto_9725 - MODE
    )
    :vars
    (
      ?auto_9732 - DIRECTION
      ?auto_9730 - INSTRUMENT
      ?auto_9729 - SATELLITE
      ?auto_9731 - DIRECTION
      ?auto_9733 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_9728 ?auto_9726 ) ) ( not ( = ?auto_9728 ?auto_9732 ) ) ( ON_BOARD ?auto_9730 ?auto_9729 ) ( SUPPORTS ?auto_9730 ?auto_9725 ) ( not ( = ?auto_9728 ?auto_9731 ) ) ( HAVE_IMAGE ?auto_9732 ?auto_9733 ) ( not ( = ?auto_9732 ?auto_9731 ) ) ( not ( = ?auto_9733 ?auto_9725 ) ) ( CALIBRATION_TARGET ?auto_9730 ?auto_9731 ) ( POWER_AVAIL ?auto_9729 ) ( POINTING ?auto_9729 ?auto_9726 ) ( not ( = ?auto_9731 ?auto_9726 ) ) ( not ( = ?auto_9732 ?auto_9726 ) ) ( HAVE_IMAGE ?auto_9726 ?auto_9727 ) ( not ( = ?auto_9727 ?auto_9725 ) ) ( not ( = ?auto_9727 ?auto_9733 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9732 ?auto_9733 ?auto_9728 ?auto_9725 )
      ( GET-2IMAGE-VERIFY ?auto_9726 ?auto_9727 ?auto_9728 ?auto_9725 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9735 - DIRECTION
      ?auto_9736 - MODE
      ?auto_9737 - DIRECTION
      ?auto_9734 - MODE
    )
    :vars
    (
      ?auto_9740 - INSTRUMENT
      ?auto_9739 - SATELLITE
      ?auto_9741 - DIRECTION
      ?auto_9738 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9737 ?auto_9735 ) ) ( ON_BOARD ?auto_9740 ?auto_9739 ) ( SUPPORTS ?auto_9740 ?auto_9736 ) ( not ( = ?auto_9735 ?auto_9741 ) ) ( HAVE_IMAGE ?auto_9737 ?auto_9734 ) ( not ( = ?auto_9737 ?auto_9741 ) ) ( not ( = ?auto_9734 ?auto_9736 ) ) ( CALIBRATION_TARGET ?auto_9740 ?auto_9741 ) ( POWER_AVAIL ?auto_9739 ) ( POINTING ?auto_9739 ?auto_9738 ) ( not ( = ?auto_9741 ?auto_9738 ) ) ( not ( = ?auto_9735 ?auto_9738 ) ) ( not ( = ?auto_9737 ?auto_9738 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9737 ?auto_9734 ?auto_9735 ?auto_9736 )
      ( GET-2IMAGE-VERIFY ?auto_9735 ?auto_9736 ?auto_9737 ?auto_9734 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9743 - DIRECTION
      ?auto_9744 - MODE
      ?auto_9745 - DIRECTION
      ?auto_9742 - MODE
    )
    :vars
    (
      ?auto_9749 - DIRECTION
      ?auto_9747 - INSTRUMENT
      ?auto_9746 - SATELLITE
      ?auto_9748 - DIRECTION
      ?auto_9750 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_9745 ?auto_9743 ) ) ( not ( = ?auto_9743 ?auto_9749 ) ) ( ON_BOARD ?auto_9747 ?auto_9746 ) ( SUPPORTS ?auto_9747 ?auto_9744 ) ( not ( = ?auto_9743 ?auto_9748 ) ) ( HAVE_IMAGE ?auto_9749 ?auto_9750 ) ( not ( = ?auto_9749 ?auto_9748 ) ) ( not ( = ?auto_9750 ?auto_9744 ) ) ( CALIBRATION_TARGET ?auto_9747 ?auto_9748 ) ( POWER_AVAIL ?auto_9746 ) ( POINTING ?auto_9746 ?auto_9745 ) ( not ( = ?auto_9748 ?auto_9745 ) ) ( not ( = ?auto_9749 ?auto_9745 ) ) ( HAVE_IMAGE ?auto_9745 ?auto_9742 ) ( not ( = ?auto_9744 ?auto_9742 ) ) ( not ( = ?auto_9742 ?auto_9750 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9749 ?auto_9750 ?auto_9743 ?auto_9744 )
      ( GET-2IMAGE-VERIFY ?auto_9743 ?auto_9744 ?auto_9745 ?auto_9742 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9772 - DIRECTION
      ?auto_9773 - MODE
      ?auto_9774 - DIRECTION
      ?auto_9771 - MODE
      ?auto_9776 - DIRECTION
      ?auto_9775 - MODE
    )
    :vars
    (
      ?auto_9778 - INSTRUMENT
      ?auto_9777 - SATELLITE
      ?auto_9779 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9774 ?auto_9772 ) ) ( not ( = ?auto_9776 ?auto_9772 ) ) ( not ( = ?auto_9776 ?auto_9774 ) ) ( ON_BOARD ?auto_9778 ?auto_9777 ) ( SUPPORTS ?auto_9778 ?auto_9775 ) ( not ( = ?auto_9776 ?auto_9779 ) ) ( HAVE_IMAGE ?auto_9772 ?auto_9773 ) ( not ( = ?auto_9772 ?auto_9779 ) ) ( not ( = ?auto_9773 ?auto_9775 ) ) ( CALIBRATION_TARGET ?auto_9778 ?auto_9779 ) ( POWER_AVAIL ?auto_9777 ) ( POINTING ?auto_9777 ?auto_9774 ) ( not ( = ?auto_9779 ?auto_9774 ) ) ( HAVE_IMAGE ?auto_9774 ?auto_9771 ) ( not ( = ?auto_9773 ?auto_9771 ) ) ( not ( = ?auto_9771 ?auto_9775 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9772 ?auto_9773 ?auto_9776 ?auto_9775 )
      ( GET-3IMAGE-VERIFY ?auto_9772 ?auto_9773 ?auto_9774 ?auto_9771 ?auto_9776 ?auto_9775 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9791 - DIRECTION
      ?auto_9792 - MODE
      ?auto_9793 - DIRECTION
      ?auto_9790 - MODE
      ?auto_9795 - DIRECTION
      ?auto_9794 - MODE
    )
    :vars
    (
      ?auto_9797 - INSTRUMENT
      ?auto_9796 - SATELLITE
      ?auto_9798 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9793 ?auto_9791 ) ) ( not ( = ?auto_9795 ?auto_9791 ) ) ( not ( = ?auto_9795 ?auto_9793 ) ) ( ON_BOARD ?auto_9797 ?auto_9796 ) ( SUPPORTS ?auto_9797 ?auto_9790 ) ( not ( = ?auto_9793 ?auto_9798 ) ) ( HAVE_IMAGE ?auto_9791 ?auto_9792 ) ( not ( = ?auto_9791 ?auto_9798 ) ) ( not ( = ?auto_9792 ?auto_9790 ) ) ( CALIBRATION_TARGET ?auto_9797 ?auto_9798 ) ( POWER_AVAIL ?auto_9796 ) ( POINTING ?auto_9796 ?auto_9795 ) ( not ( = ?auto_9798 ?auto_9795 ) ) ( HAVE_IMAGE ?auto_9795 ?auto_9794 ) ( not ( = ?auto_9792 ?auto_9794 ) ) ( not ( = ?auto_9790 ?auto_9794 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9791 ?auto_9792 ?auto_9793 ?auto_9790 )
      ( GET-3IMAGE-VERIFY ?auto_9791 ?auto_9792 ?auto_9793 ?auto_9790 ?auto_9795 ?auto_9794 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9810 - DIRECTION
      ?auto_9811 - MODE
      ?auto_9812 - DIRECTION
      ?auto_9809 - MODE
      ?auto_9814 - DIRECTION
      ?auto_9813 - MODE
    )
    :vars
    (
      ?auto_9816 - INSTRUMENT
      ?auto_9815 - SATELLITE
      ?auto_9817 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9812 ?auto_9810 ) ) ( not ( = ?auto_9814 ?auto_9810 ) ) ( not ( = ?auto_9814 ?auto_9812 ) ) ( ON_BOARD ?auto_9816 ?auto_9815 ) ( SUPPORTS ?auto_9816 ?auto_9813 ) ( not ( = ?auto_9814 ?auto_9817 ) ) ( HAVE_IMAGE ?auto_9812 ?auto_9809 ) ( not ( = ?auto_9812 ?auto_9817 ) ) ( not ( = ?auto_9809 ?auto_9813 ) ) ( CALIBRATION_TARGET ?auto_9816 ?auto_9817 ) ( POWER_AVAIL ?auto_9815 ) ( POINTING ?auto_9815 ?auto_9810 ) ( not ( = ?auto_9817 ?auto_9810 ) ) ( HAVE_IMAGE ?auto_9810 ?auto_9811 ) ( not ( = ?auto_9811 ?auto_9809 ) ) ( not ( = ?auto_9811 ?auto_9813 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9812 ?auto_9809 ?auto_9814 ?auto_9813 )
      ( GET-3IMAGE-VERIFY ?auto_9810 ?auto_9811 ?auto_9812 ?auto_9809 ?auto_9814 ?auto_9813 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9830 - DIRECTION
      ?auto_9831 - MODE
      ?auto_9832 - DIRECTION
      ?auto_9829 - MODE
      ?auto_9834 - DIRECTION
      ?auto_9833 - MODE
    )
    :vars
    (
      ?auto_9836 - INSTRUMENT
      ?auto_9835 - SATELLITE
      ?auto_9837 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9832 ?auto_9830 ) ) ( not ( = ?auto_9834 ?auto_9830 ) ) ( not ( = ?auto_9834 ?auto_9832 ) ) ( ON_BOARD ?auto_9836 ?auto_9835 ) ( SUPPORTS ?auto_9836 ?auto_9829 ) ( not ( = ?auto_9832 ?auto_9837 ) ) ( HAVE_IMAGE ?auto_9834 ?auto_9833 ) ( not ( = ?auto_9834 ?auto_9837 ) ) ( not ( = ?auto_9833 ?auto_9829 ) ) ( CALIBRATION_TARGET ?auto_9836 ?auto_9837 ) ( POWER_AVAIL ?auto_9835 ) ( POINTING ?auto_9835 ?auto_9830 ) ( not ( = ?auto_9837 ?auto_9830 ) ) ( HAVE_IMAGE ?auto_9830 ?auto_9831 ) ( not ( = ?auto_9831 ?auto_9829 ) ) ( not ( = ?auto_9831 ?auto_9833 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9834 ?auto_9833 ?auto_9832 ?auto_9829 )
      ( GET-3IMAGE-VERIFY ?auto_9830 ?auto_9831 ?auto_9832 ?auto_9829 ?auto_9834 ?auto_9833 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9871 - DIRECTION
      ?auto_9872 - MODE
      ?auto_9873 - DIRECTION
      ?auto_9870 - MODE
      ?auto_9875 - DIRECTION
      ?auto_9874 - MODE
    )
    :vars
    (
      ?auto_9877 - INSTRUMENT
      ?auto_9876 - SATELLITE
      ?auto_9878 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9873 ?auto_9871 ) ) ( not ( = ?auto_9875 ?auto_9871 ) ) ( not ( = ?auto_9875 ?auto_9873 ) ) ( ON_BOARD ?auto_9877 ?auto_9876 ) ( SUPPORTS ?auto_9877 ?auto_9872 ) ( not ( = ?auto_9871 ?auto_9878 ) ) ( HAVE_IMAGE ?auto_9873 ?auto_9870 ) ( not ( = ?auto_9873 ?auto_9878 ) ) ( not ( = ?auto_9870 ?auto_9872 ) ) ( CALIBRATION_TARGET ?auto_9877 ?auto_9878 ) ( POWER_AVAIL ?auto_9876 ) ( POINTING ?auto_9876 ?auto_9875 ) ( not ( = ?auto_9878 ?auto_9875 ) ) ( HAVE_IMAGE ?auto_9875 ?auto_9874 ) ( not ( = ?auto_9872 ?auto_9874 ) ) ( not ( = ?auto_9870 ?auto_9874 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9873 ?auto_9870 ?auto_9871 ?auto_9872 )
      ( GET-3IMAGE-VERIFY ?auto_9871 ?auto_9872 ?auto_9873 ?auto_9870 ?auto_9875 ?auto_9874 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9890 - DIRECTION
      ?auto_9891 - MODE
      ?auto_9892 - DIRECTION
      ?auto_9889 - MODE
      ?auto_9894 - DIRECTION
      ?auto_9893 - MODE
    )
    :vars
    (
      ?auto_9896 - INSTRUMENT
      ?auto_9895 - SATELLITE
      ?auto_9897 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9892 ?auto_9890 ) ) ( not ( = ?auto_9894 ?auto_9890 ) ) ( not ( = ?auto_9894 ?auto_9892 ) ) ( ON_BOARD ?auto_9896 ?auto_9895 ) ( SUPPORTS ?auto_9896 ?auto_9891 ) ( not ( = ?auto_9890 ?auto_9897 ) ) ( HAVE_IMAGE ?auto_9894 ?auto_9893 ) ( not ( = ?auto_9894 ?auto_9897 ) ) ( not ( = ?auto_9893 ?auto_9891 ) ) ( CALIBRATION_TARGET ?auto_9896 ?auto_9897 ) ( POWER_AVAIL ?auto_9895 ) ( POINTING ?auto_9895 ?auto_9892 ) ( not ( = ?auto_9897 ?auto_9892 ) ) ( HAVE_IMAGE ?auto_9892 ?auto_9889 ) ( not ( = ?auto_9891 ?auto_9889 ) ) ( not ( = ?auto_9889 ?auto_9893 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9894 ?auto_9893 ?auto_9890 ?auto_9891 )
      ( GET-3IMAGE-VERIFY ?auto_9890 ?auto_9891 ?auto_9892 ?auto_9889 ?auto_9894 ?auto_9893 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_9953 - DIRECTION
      ?auto_9954 - MODE
    )
    :vars
    (
      ?auto_9959 - DIRECTION
      ?auto_9957 - INSTRUMENT
      ?auto_9956 - SATELLITE
      ?auto_9958 - DIRECTION
      ?auto_9960 - MODE
      ?auto_9955 - DIRECTION
      ?auto_9961 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9953 ?auto_9959 ) ) ( ON_BOARD ?auto_9957 ?auto_9956 ) ( SUPPORTS ?auto_9957 ?auto_9954 ) ( not ( = ?auto_9953 ?auto_9958 ) ) ( HAVE_IMAGE ?auto_9959 ?auto_9960 ) ( not ( = ?auto_9959 ?auto_9958 ) ) ( not ( = ?auto_9960 ?auto_9954 ) ) ( CALIBRATION_TARGET ?auto_9957 ?auto_9958 ) ( POINTING ?auto_9956 ?auto_9955 ) ( not ( = ?auto_9958 ?auto_9955 ) ) ( not ( = ?auto_9953 ?auto_9955 ) ) ( not ( = ?auto_9959 ?auto_9955 ) ) ( ON_BOARD ?auto_9961 ?auto_9956 ) ( POWER_ON ?auto_9961 ) ( not ( = ?auto_9957 ?auto_9961 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_9961 ?auto_9956 )
      ( GET-2IMAGE ?auto_9959 ?auto_9960 ?auto_9953 ?auto_9954 )
      ( GET-1IMAGE-VERIFY ?auto_9953 ?auto_9954 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9963 - DIRECTION
      ?auto_9964 - MODE
      ?auto_9965 - DIRECTION
      ?auto_9962 - MODE
    )
    :vars
    (
      ?auto_9968 - INSTRUMENT
      ?auto_9969 - SATELLITE
      ?auto_9967 - DIRECTION
      ?auto_9966 - DIRECTION
      ?auto_9970 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9965 ?auto_9963 ) ) ( ON_BOARD ?auto_9968 ?auto_9969 ) ( SUPPORTS ?auto_9968 ?auto_9962 ) ( not ( = ?auto_9965 ?auto_9967 ) ) ( HAVE_IMAGE ?auto_9963 ?auto_9964 ) ( not ( = ?auto_9963 ?auto_9967 ) ) ( not ( = ?auto_9964 ?auto_9962 ) ) ( CALIBRATION_TARGET ?auto_9968 ?auto_9967 ) ( POINTING ?auto_9969 ?auto_9966 ) ( not ( = ?auto_9967 ?auto_9966 ) ) ( not ( = ?auto_9965 ?auto_9966 ) ) ( not ( = ?auto_9963 ?auto_9966 ) ) ( ON_BOARD ?auto_9970 ?auto_9969 ) ( POWER_ON ?auto_9970 ) ( not ( = ?auto_9968 ?auto_9970 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9965 ?auto_9962 )
      ( GET-2IMAGE-VERIFY ?auto_9963 ?auto_9964 ?auto_9965 ?auto_9962 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9972 - DIRECTION
      ?auto_9973 - MODE
      ?auto_9974 - DIRECTION
      ?auto_9971 - MODE
    )
    :vars
    (
      ?auto_9979 - DIRECTION
      ?auto_9975 - INSTRUMENT
      ?auto_9976 - SATELLITE
      ?auto_9977 - DIRECTION
      ?auto_9978 - MODE
      ?auto_9980 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9974 ?auto_9972 ) ) ( not ( = ?auto_9974 ?auto_9979 ) ) ( ON_BOARD ?auto_9975 ?auto_9976 ) ( SUPPORTS ?auto_9975 ?auto_9971 ) ( not ( = ?auto_9974 ?auto_9977 ) ) ( HAVE_IMAGE ?auto_9979 ?auto_9978 ) ( not ( = ?auto_9979 ?auto_9977 ) ) ( not ( = ?auto_9978 ?auto_9971 ) ) ( CALIBRATION_TARGET ?auto_9975 ?auto_9977 ) ( POINTING ?auto_9976 ?auto_9972 ) ( not ( = ?auto_9977 ?auto_9972 ) ) ( not ( = ?auto_9979 ?auto_9972 ) ) ( ON_BOARD ?auto_9980 ?auto_9976 ) ( POWER_ON ?auto_9980 ) ( not ( = ?auto_9975 ?auto_9980 ) ) ( HAVE_IMAGE ?auto_9972 ?auto_9973 ) ( not ( = ?auto_9973 ?auto_9971 ) ) ( not ( = ?auto_9973 ?auto_9978 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9979 ?auto_9978 ?auto_9974 ?auto_9971 )
      ( GET-2IMAGE-VERIFY ?auto_9972 ?auto_9973 ?auto_9974 ?auto_9971 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9982 - DIRECTION
      ?auto_9983 - MODE
      ?auto_9984 - DIRECTION
      ?auto_9981 - MODE
    )
    :vars
    (
      ?auto_9985 - INSTRUMENT
      ?auto_9986 - SATELLITE
      ?auto_9987 - DIRECTION
      ?auto_9988 - DIRECTION
      ?auto_9989 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9984 ?auto_9982 ) ) ( ON_BOARD ?auto_9985 ?auto_9986 ) ( SUPPORTS ?auto_9985 ?auto_9983 ) ( not ( = ?auto_9982 ?auto_9987 ) ) ( HAVE_IMAGE ?auto_9984 ?auto_9981 ) ( not ( = ?auto_9984 ?auto_9987 ) ) ( not ( = ?auto_9981 ?auto_9983 ) ) ( CALIBRATION_TARGET ?auto_9985 ?auto_9987 ) ( POINTING ?auto_9986 ?auto_9988 ) ( not ( = ?auto_9987 ?auto_9988 ) ) ( not ( = ?auto_9982 ?auto_9988 ) ) ( not ( = ?auto_9984 ?auto_9988 ) ) ( ON_BOARD ?auto_9989 ?auto_9986 ) ( POWER_ON ?auto_9989 ) ( not ( = ?auto_9985 ?auto_9989 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9984 ?auto_9981 ?auto_9982 ?auto_9983 )
      ( GET-2IMAGE-VERIFY ?auto_9982 ?auto_9983 ?auto_9984 ?auto_9981 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9991 - DIRECTION
      ?auto_9992 - MODE
      ?auto_9993 - DIRECTION
      ?auto_9990 - MODE
    )
    :vars
    (
      ?auto_9998 - DIRECTION
      ?auto_9994 - INSTRUMENT
      ?auto_9995 - SATELLITE
      ?auto_9996 - DIRECTION
      ?auto_9997 - MODE
      ?auto_9999 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9993 ?auto_9991 ) ) ( not ( = ?auto_9991 ?auto_9998 ) ) ( ON_BOARD ?auto_9994 ?auto_9995 ) ( SUPPORTS ?auto_9994 ?auto_9992 ) ( not ( = ?auto_9991 ?auto_9996 ) ) ( HAVE_IMAGE ?auto_9998 ?auto_9997 ) ( not ( = ?auto_9998 ?auto_9996 ) ) ( not ( = ?auto_9997 ?auto_9992 ) ) ( CALIBRATION_TARGET ?auto_9994 ?auto_9996 ) ( POINTING ?auto_9995 ?auto_9993 ) ( not ( = ?auto_9996 ?auto_9993 ) ) ( not ( = ?auto_9998 ?auto_9993 ) ) ( ON_BOARD ?auto_9999 ?auto_9995 ) ( POWER_ON ?auto_9999 ) ( not ( = ?auto_9994 ?auto_9999 ) ) ( HAVE_IMAGE ?auto_9993 ?auto_9990 ) ( not ( = ?auto_9992 ?auto_9990 ) ) ( not ( = ?auto_9990 ?auto_9997 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9998 ?auto_9997 ?auto_9991 ?auto_9992 )
      ( GET-2IMAGE-VERIFY ?auto_9991 ?auto_9992 ?auto_9993 ?auto_9990 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10023 - DIRECTION
      ?auto_10024 - MODE
      ?auto_10025 - DIRECTION
      ?auto_10022 - MODE
      ?auto_10027 - DIRECTION
      ?auto_10026 - MODE
    )
    :vars
    (
      ?auto_10028 - INSTRUMENT
      ?auto_10029 - SATELLITE
      ?auto_10030 - DIRECTION
      ?auto_10031 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_10025 ?auto_10023 ) ) ( not ( = ?auto_10027 ?auto_10023 ) ) ( not ( = ?auto_10027 ?auto_10025 ) ) ( ON_BOARD ?auto_10028 ?auto_10029 ) ( SUPPORTS ?auto_10028 ?auto_10026 ) ( not ( = ?auto_10027 ?auto_10030 ) ) ( HAVE_IMAGE ?auto_10023 ?auto_10024 ) ( not ( = ?auto_10023 ?auto_10030 ) ) ( not ( = ?auto_10024 ?auto_10026 ) ) ( CALIBRATION_TARGET ?auto_10028 ?auto_10030 ) ( POINTING ?auto_10029 ?auto_10025 ) ( not ( = ?auto_10030 ?auto_10025 ) ) ( ON_BOARD ?auto_10031 ?auto_10029 ) ( POWER_ON ?auto_10031 ) ( not ( = ?auto_10028 ?auto_10031 ) ) ( HAVE_IMAGE ?auto_10025 ?auto_10022 ) ( not ( = ?auto_10024 ?auto_10022 ) ) ( not ( = ?auto_10022 ?auto_10026 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10023 ?auto_10024 ?auto_10027 ?auto_10026 )
      ( GET-3IMAGE-VERIFY ?auto_10023 ?auto_10024 ?auto_10025 ?auto_10022 ?auto_10027 ?auto_10026 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10044 - DIRECTION
      ?auto_10045 - MODE
      ?auto_10046 - DIRECTION
      ?auto_10043 - MODE
      ?auto_10048 - DIRECTION
      ?auto_10047 - MODE
    )
    :vars
    (
      ?auto_10049 - INSTRUMENT
      ?auto_10050 - SATELLITE
      ?auto_10051 - DIRECTION
      ?auto_10052 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_10046 ?auto_10044 ) ) ( not ( = ?auto_10048 ?auto_10044 ) ) ( not ( = ?auto_10048 ?auto_10046 ) ) ( ON_BOARD ?auto_10049 ?auto_10050 ) ( SUPPORTS ?auto_10049 ?auto_10043 ) ( not ( = ?auto_10046 ?auto_10051 ) ) ( HAVE_IMAGE ?auto_10044 ?auto_10045 ) ( not ( = ?auto_10044 ?auto_10051 ) ) ( not ( = ?auto_10045 ?auto_10043 ) ) ( CALIBRATION_TARGET ?auto_10049 ?auto_10051 ) ( POINTING ?auto_10050 ?auto_10048 ) ( not ( = ?auto_10051 ?auto_10048 ) ) ( ON_BOARD ?auto_10052 ?auto_10050 ) ( POWER_ON ?auto_10052 ) ( not ( = ?auto_10049 ?auto_10052 ) ) ( HAVE_IMAGE ?auto_10048 ?auto_10047 ) ( not ( = ?auto_10045 ?auto_10047 ) ) ( not ( = ?auto_10043 ?auto_10047 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10044 ?auto_10045 ?auto_10046 ?auto_10043 )
      ( GET-3IMAGE-VERIFY ?auto_10044 ?auto_10045 ?auto_10046 ?auto_10043 ?auto_10048 ?auto_10047 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10065 - DIRECTION
      ?auto_10066 - MODE
      ?auto_10067 - DIRECTION
      ?auto_10064 - MODE
      ?auto_10069 - DIRECTION
      ?auto_10068 - MODE
    )
    :vars
    (
      ?auto_10070 - INSTRUMENT
      ?auto_10071 - SATELLITE
      ?auto_10072 - DIRECTION
      ?auto_10073 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_10067 ?auto_10065 ) ) ( not ( = ?auto_10069 ?auto_10065 ) ) ( not ( = ?auto_10069 ?auto_10067 ) ) ( ON_BOARD ?auto_10070 ?auto_10071 ) ( SUPPORTS ?auto_10070 ?auto_10068 ) ( not ( = ?auto_10069 ?auto_10072 ) ) ( HAVE_IMAGE ?auto_10067 ?auto_10064 ) ( not ( = ?auto_10067 ?auto_10072 ) ) ( not ( = ?auto_10064 ?auto_10068 ) ) ( CALIBRATION_TARGET ?auto_10070 ?auto_10072 ) ( POINTING ?auto_10071 ?auto_10065 ) ( not ( = ?auto_10072 ?auto_10065 ) ) ( ON_BOARD ?auto_10073 ?auto_10071 ) ( POWER_ON ?auto_10073 ) ( not ( = ?auto_10070 ?auto_10073 ) ) ( HAVE_IMAGE ?auto_10065 ?auto_10066 ) ( not ( = ?auto_10066 ?auto_10064 ) ) ( not ( = ?auto_10066 ?auto_10068 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10067 ?auto_10064 ?auto_10069 ?auto_10068 )
      ( GET-3IMAGE-VERIFY ?auto_10065 ?auto_10066 ?auto_10067 ?auto_10064 ?auto_10069 ?auto_10068 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10087 - DIRECTION
      ?auto_10088 - MODE
      ?auto_10089 - DIRECTION
      ?auto_10086 - MODE
      ?auto_10091 - DIRECTION
      ?auto_10090 - MODE
    )
    :vars
    (
      ?auto_10092 - INSTRUMENT
      ?auto_10093 - SATELLITE
      ?auto_10094 - DIRECTION
      ?auto_10095 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_10089 ?auto_10087 ) ) ( not ( = ?auto_10091 ?auto_10087 ) ) ( not ( = ?auto_10091 ?auto_10089 ) ) ( ON_BOARD ?auto_10092 ?auto_10093 ) ( SUPPORTS ?auto_10092 ?auto_10086 ) ( not ( = ?auto_10089 ?auto_10094 ) ) ( HAVE_IMAGE ?auto_10091 ?auto_10090 ) ( not ( = ?auto_10091 ?auto_10094 ) ) ( not ( = ?auto_10090 ?auto_10086 ) ) ( CALIBRATION_TARGET ?auto_10092 ?auto_10094 ) ( POINTING ?auto_10093 ?auto_10087 ) ( not ( = ?auto_10094 ?auto_10087 ) ) ( ON_BOARD ?auto_10095 ?auto_10093 ) ( POWER_ON ?auto_10095 ) ( not ( = ?auto_10092 ?auto_10095 ) ) ( HAVE_IMAGE ?auto_10087 ?auto_10088 ) ( not ( = ?auto_10088 ?auto_10086 ) ) ( not ( = ?auto_10088 ?auto_10090 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10091 ?auto_10090 ?auto_10089 ?auto_10086 )
      ( GET-3IMAGE-VERIFY ?auto_10087 ?auto_10088 ?auto_10089 ?auto_10086 ?auto_10091 ?auto_10090 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10132 - DIRECTION
      ?auto_10133 - MODE
      ?auto_10134 - DIRECTION
      ?auto_10131 - MODE
      ?auto_10136 - DIRECTION
      ?auto_10135 - MODE
    )
    :vars
    (
      ?auto_10137 - INSTRUMENT
      ?auto_10138 - SATELLITE
      ?auto_10139 - DIRECTION
      ?auto_10140 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_10134 ?auto_10132 ) ) ( not ( = ?auto_10136 ?auto_10132 ) ) ( not ( = ?auto_10136 ?auto_10134 ) ) ( ON_BOARD ?auto_10137 ?auto_10138 ) ( SUPPORTS ?auto_10137 ?auto_10133 ) ( not ( = ?auto_10132 ?auto_10139 ) ) ( HAVE_IMAGE ?auto_10134 ?auto_10131 ) ( not ( = ?auto_10134 ?auto_10139 ) ) ( not ( = ?auto_10131 ?auto_10133 ) ) ( CALIBRATION_TARGET ?auto_10137 ?auto_10139 ) ( POINTING ?auto_10138 ?auto_10136 ) ( not ( = ?auto_10139 ?auto_10136 ) ) ( ON_BOARD ?auto_10140 ?auto_10138 ) ( POWER_ON ?auto_10140 ) ( not ( = ?auto_10137 ?auto_10140 ) ) ( HAVE_IMAGE ?auto_10136 ?auto_10135 ) ( not ( = ?auto_10133 ?auto_10135 ) ) ( not ( = ?auto_10131 ?auto_10135 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10134 ?auto_10131 ?auto_10132 ?auto_10133 )
      ( GET-3IMAGE-VERIFY ?auto_10132 ?auto_10133 ?auto_10134 ?auto_10131 ?auto_10136 ?auto_10135 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10153 - DIRECTION
      ?auto_10154 - MODE
      ?auto_10155 - DIRECTION
      ?auto_10152 - MODE
      ?auto_10157 - DIRECTION
      ?auto_10156 - MODE
    )
    :vars
    (
      ?auto_10158 - INSTRUMENT
      ?auto_10159 - SATELLITE
      ?auto_10160 - DIRECTION
      ?auto_10161 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_10155 ?auto_10153 ) ) ( not ( = ?auto_10157 ?auto_10153 ) ) ( not ( = ?auto_10157 ?auto_10155 ) ) ( ON_BOARD ?auto_10158 ?auto_10159 ) ( SUPPORTS ?auto_10158 ?auto_10154 ) ( not ( = ?auto_10153 ?auto_10160 ) ) ( HAVE_IMAGE ?auto_10157 ?auto_10156 ) ( not ( = ?auto_10157 ?auto_10160 ) ) ( not ( = ?auto_10156 ?auto_10154 ) ) ( CALIBRATION_TARGET ?auto_10158 ?auto_10160 ) ( POINTING ?auto_10159 ?auto_10155 ) ( not ( = ?auto_10160 ?auto_10155 ) ) ( ON_BOARD ?auto_10161 ?auto_10159 ) ( POWER_ON ?auto_10161 ) ( not ( = ?auto_10158 ?auto_10161 ) ) ( HAVE_IMAGE ?auto_10155 ?auto_10152 ) ( not ( = ?auto_10154 ?auto_10152 ) ) ( not ( = ?auto_10152 ?auto_10156 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10157 ?auto_10156 ?auto_10153 ?auto_10154 )
      ( GET-3IMAGE-VERIFY ?auto_10153 ?auto_10154 ?auto_10155 ?auto_10152 ?auto_10157 ?auto_10156 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_10474 - DIRECTION
      ?auto_10475 - MODE
    )
    :vars
    (
      ?auto_10477 - DIRECTION
      ?auto_10480 - INSTRUMENT
      ?auto_10479 - SATELLITE
      ?auto_10478 - DIRECTION
      ?auto_10481 - MODE
      ?auto_10482 - DIRECTION
      ?auto_10476 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_10474 ?auto_10477 ) ) ( ON_BOARD ?auto_10480 ?auto_10479 ) ( SUPPORTS ?auto_10480 ?auto_10475 ) ( not ( = ?auto_10474 ?auto_10478 ) ) ( HAVE_IMAGE ?auto_10477 ?auto_10481 ) ( not ( = ?auto_10477 ?auto_10478 ) ) ( not ( = ?auto_10481 ?auto_10475 ) ) ( CALIBRATION_TARGET ?auto_10480 ?auto_10478 ) ( not ( = ?auto_10478 ?auto_10482 ) ) ( not ( = ?auto_10474 ?auto_10482 ) ) ( not ( = ?auto_10477 ?auto_10482 ) ) ( ON_BOARD ?auto_10476 ?auto_10479 ) ( POWER_ON ?auto_10476 ) ( not ( = ?auto_10480 ?auto_10476 ) ) ( POINTING ?auto_10479 ?auto_10478 ) )
    :subtasks
    ( ( !TURN_TO ?auto_10479 ?auto_10482 ?auto_10478 )
      ( GET-2IMAGE ?auto_10477 ?auto_10481 ?auto_10474 ?auto_10475 )
      ( GET-1IMAGE-VERIFY ?auto_10474 ?auto_10475 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10484 - DIRECTION
      ?auto_10485 - MODE
      ?auto_10486 - DIRECTION
      ?auto_10483 - MODE
    )
    :vars
    (
      ?auto_10487 - INSTRUMENT
      ?auto_10491 - SATELLITE
      ?auto_10488 - DIRECTION
      ?auto_10489 - DIRECTION
      ?auto_10490 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_10486 ?auto_10484 ) ) ( ON_BOARD ?auto_10487 ?auto_10491 ) ( SUPPORTS ?auto_10487 ?auto_10483 ) ( not ( = ?auto_10486 ?auto_10488 ) ) ( HAVE_IMAGE ?auto_10484 ?auto_10485 ) ( not ( = ?auto_10484 ?auto_10488 ) ) ( not ( = ?auto_10485 ?auto_10483 ) ) ( CALIBRATION_TARGET ?auto_10487 ?auto_10488 ) ( not ( = ?auto_10488 ?auto_10489 ) ) ( not ( = ?auto_10486 ?auto_10489 ) ) ( not ( = ?auto_10484 ?auto_10489 ) ) ( ON_BOARD ?auto_10490 ?auto_10491 ) ( POWER_ON ?auto_10490 ) ( not ( = ?auto_10487 ?auto_10490 ) ) ( POINTING ?auto_10491 ?auto_10488 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_10486 ?auto_10483 )
      ( GET-2IMAGE-VERIFY ?auto_10484 ?auto_10485 ?auto_10486 ?auto_10483 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10503 - DIRECTION
      ?auto_10504 - MODE
      ?auto_10505 - DIRECTION
      ?auto_10502 - MODE
    )
    :vars
    (
      ?auto_10509 - INSTRUMENT
      ?auto_10508 - SATELLITE
      ?auto_10506 - DIRECTION
      ?auto_10510 - DIRECTION
      ?auto_10507 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_10505 ?auto_10503 ) ) ( ON_BOARD ?auto_10509 ?auto_10508 ) ( SUPPORTS ?auto_10509 ?auto_10504 ) ( not ( = ?auto_10503 ?auto_10506 ) ) ( HAVE_IMAGE ?auto_10505 ?auto_10502 ) ( not ( = ?auto_10505 ?auto_10506 ) ) ( not ( = ?auto_10502 ?auto_10504 ) ) ( CALIBRATION_TARGET ?auto_10509 ?auto_10506 ) ( not ( = ?auto_10506 ?auto_10510 ) ) ( not ( = ?auto_10503 ?auto_10510 ) ) ( not ( = ?auto_10505 ?auto_10510 ) ) ( ON_BOARD ?auto_10507 ?auto_10508 ) ( POWER_ON ?auto_10507 ) ( not ( = ?auto_10509 ?auto_10507 ) ) ( POINTING ?auto_10508 ?auto_10506 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10505 ?auto_10502 ?auto_10503 ?auto_10504 )
      ( GET-2IMAGE-VERIFY ?auto_10503 ?auto_10504 ?auto_10505 ?auto_10502 ) )
  )

)

