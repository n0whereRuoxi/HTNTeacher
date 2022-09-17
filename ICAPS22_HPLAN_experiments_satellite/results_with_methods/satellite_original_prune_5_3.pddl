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
      ?auto_4798912 - DIRECTION
      ?auto_4798913 - MODE
    )
    :vars
    (
      ?auto_4798914 - INSTRUMENT
      ?auto_4798915 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_4798914 ) ( ON_BOARD ?auto_4798914 ?auto_4798915 ) ( SUPPORTS ?auto_4798914 ?auto_4798913 ) ( POWER_ON ?auto_4798914 ) ( POINTING ?auto_4798915 ?auto_4798912 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_4798915 ?auto_4798912 ?auto_4798914 ?auto_4798913 )
      ( GET-1IMAGE-VERIFY ?auto_4798912 ?auto_4798913 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4798952 - DIRECTION
      ?auto_4798953 - MODE
    )
    :vars
    (
      ?auto_4798954 - INSTRUMENT
      ?auto_4798955 - SATELLITE
      ?auto_4798956 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_4798954 ) ( ON_BOARD ?auto_4798954 ?auto_4798955 ) ( SUPPORTS ?auto_4798954 ?auto_4798953 ) ( POWER_ON ?auto_4798954 ) ( POINTING ?auto_4798955 ?auto_4798956 ) ( not ( = ?auto_4798952 ?auto_4798956 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_4798955 ?auto_4798952 ?auto_4798956 )
      ( GET-1IMAGE ?auto_4798952 ?auto_4798953 )
      ( GET-1IMAGE-VERIFY ?auto_4798952 ?auto_4798953 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4798997 - DIRECTION
      ?auto_4798998 - MODE
    )
    :vars
    (
      ?auto_4799000 - INSTRUMENT
      ?auto_4798999 - SATELLITE
      ?auto_4799001 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4799000 ?auto_4798999 ) ( SUPPORTS ?auto_4799000 ?auto_4798998 ) ( POWER_ON ?auto_4799000 ) ( POINTING ?auto_4798999 ?auto_4799001 ) ( not ( = ?auto_4798997 ?auto_4799001 ) ) ( CALIBRATION_TARGET ?auto_4799000 ?auto_4799001 ) ( NOT_CALIBRATED ?auto_4799000 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_4798999 ?auto_4799000 ?auto_4799001 )
      ( GET-1IMAGE ?auto_4798997 ?auto_4798998 )
      ( GET-1IMAGE-VERIFY ?auto_4798997 ?auto_4798998 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4799042 - DIRECTION
      ?auto_4799043 - MODE
    )
    :vars
    (
      ?auto_4799044 - INSTRUMENT
      ?auto_4799046 - SATELLITE
      ?auto_4799045 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4799044 ?auto_4799046 ) ( SUPPORTS ?auto_4799044 ?auto_4799043 ) ( POINTING ?auto_4799046 ?auto_4799045 ) ( not ( = ?auto_4799042 ?auto_4799045 ) ) ( CALIBRATION_TARGET ?auto_4799044 ?auto_4799045 ) ( POWER_AVAIL ?auto_4799046 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_4799044 ?auto_4799046 )
      ( GET-1IMAGE ?auto_4799042 ?auto_4799043 )
      ( GET-1IMAGE-VERIFY ?auto_4799042 ?auto_4799043 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4799087 - DIRECTION
      ?auto_4799088 - MODE
    )
    :vars
    (
      ?auto_4799089 - INSTRUMENT
      ?auto_4799091 - SATELLITE
      ?auto_4799090 - DIRECTION
      ?auto_4799092 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4799089 ?auto_4799091 ) ( SUPPORTS ?auto_4799089 ?auto_4799088 ) ( not ( = ?auto_4799087 ?auto_4799090 ) ) ( CALIBRATION_TARGET ?auto_4799089 ?auto_4799090 ) ( POWER_AVAIL ?auto_4799091 ) ( POINTING ?auto_4799091 ?auto_4799092 ) ( not ( = ?auto_4799090 ?auto_4799092 ) ) ( not ( = ?auto_4799087 ?auto_4799092 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_4799091 ?auto_4799090 ?auto_4799092 )
      ( GET-1IMAGE ?auto_4799087 ?auto_4799088 )
      ( GET-1IMAGE-VERIFY ?auto_4799087 ?auto_4799088 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4799628 - DIRECTION
      ?auto_4799629 - MODE
      ?auto_4799630 - DIRECTION
      ?auto_4799627 - MODE
    )
    :vars
    (
      ?auto_4799632 - INSTRUMENT
      ?auto_4799631 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_4799630 ?auto_4799628 ) ) ( CALIBRATED ?auto_4799632 ) ( ON_BOARD ?auto_4799632 ?auto_4799631 ) ( SUPPORTS ?auto_4799632 ?auto_4799627 ) ( POWER_ON ?auto_4799632 ) ( POINTING ?auto_4799631 ?auto_4799630 ) ( HAVE_IMAGE ?auto_4799628 ?auto_4799629 ) ( not ( = ?auto_4799629 ?auto_4799627 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4799630 ?auto_4799627 )
      ( GET-2IMAGE-VERIFY ?auto_4799628 ?auto_4799629 ?auto_4799630 ?auto_4799627 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4799634 - DIRECTION
      ?auto_4799635 - MODE
      ?auto_4799636 - DIRECTION
      ?auto_4799633 - MODE
    )
    :vars
    (
      ?auto_4799638 - INSTRUMENT
      ?auto_4799637 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_4799636 ?auto_4799634 ) ) ( CALIBRATED ?auto_4799638 ) ( ON_BOARD ?auto_4799638 ?auto_4799637 ) ( SUPPORTS ?auto_4799638 ?auto_4799635 ) ( POWER_ON ?auto_4799638 ) ( POINTING ?auto_4799637 ?auto_4799634 ) ( HAVE_IMAGE ?auto_4799636 ?auto_4799633 ) ( not ( = ?auto_4799635 ?auto_4799633 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4799634 ?auto_4799635 )
      ( GET-2IMAGE-VERIFY ?auto_4799634 ?auto_4799635 ?auto_4799636 ?auto_4799633 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4800229 - DIRECTION
      ?auto_4800230 - MODE
      ?auto_4800231 - DIRECTION
      ?auto_4800228 - MODE
    )
    :vars
    (
      ?auto_4800232 - INSTRUMENT
      ?auto_4800233 - SATELLITE
      ?auto_4800234 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4800231 ?auto_4800229 ) ) ( CALIBRATED ?auto_4800232 ) ( ON_BOARD ?auto_4800232 ?auto_4800233 ) ( SUPPORTS ?auto_4800232 ?auto_4800228 ) ( POWER_ON ?auto_4800232 ) ( POINTING ?auto_4800233 ?auto_4800234 ) ( not ( = ?auto_4800231 ?auto_4800234 ) ) ( HAVE_IMAGE ?auto_4800229 ?auto_4800230 ) ( not ( = ?auto_4800229 ?auto_4800234 ) ) ( not ( = ?auto_4800230 ?auto_4800228 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4800231 ?auto_4800228 )
      ( GET-2IMAGE-VERIFY ?auto_4800229 ?auto_4800230 ?auto_4800231 ?auto_4800228 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4800236 - DIRECTION
      ?auto_4800237 - MODE
      ?auto_4800238 - DIRECTION
      ?auto_4800235 - MODE
    )
    :vars
    (
      ?auto_4800240 - INSTRUMENT
      ?auto_4800241 - SATELLITE
      ?auto_4800239 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4800238 ?auto_4800236 ) ) ( CALIBRATED ?auto_4800240 ) ( ON_BOARD ?auto_4800240 ?auto_4800241 ) ( SUPPORTS ?auto_4800240 ?auto_4800237 ) ( POWER_ON ?auto_4800240 ) ( POINTING ?auto_4800241 ?auto_4800239 ) ( not ( = ?auto_4800236 ?auto_4800239 ) ) ( HAVE_IMAGE ?auto_4800238 ?auto_4800235 ) ( not ( = ?auto_4800238 ?auto_4800239 ) ) ( not ( = ?auto_4800235 ?auto_4800237 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4800238 ?auto_4800235 ?auto_4800236 ?auto_4800237 )
      ( GET-2IMAGE-VERIFY ?auto_4800236 ?auto_4800237 ?auto_4800238 ?auto_4800235 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4800888 - DIRECTION
      ?auto_4800889 - MODE
    )
    :vars
    (
      ?auto_4800893 - DIRECTION
      ?auto_4800891 - INSTRUMENT
      ?auto_4800892 - SATELLITE
      ?auto_4800890 - DIRECTION
      ?auto_4800894 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_4800888 ?auto_4800893 ) ) ( ON_BOARD ?auto_4800891 ?auto_4800892 ) ( SUPPORTS ?auto_4800891 ?auto_4800889 ) ( POWER_ON ?auto_4800891 ) ( POINTING ?auto_4800892 ?auto_4800890 ) ( not ( = ?auto_4800888 ?auto_4800890 ) ) ( HAVE_IMAGE ?auto_4800893 ?auto_4800894 ) ( not ( = ?auto_4800893 ?auto_4800890 ) ) ( not ( = ?auto_4800894 ?auto_4800889 ) ) ( CALIBRATION_TARGET ?auto_4800891 ?auto_4800890 ) ( NOT_CALIBRATED ?auto_4800891 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_4800892 ?auto_4800891 ?auto_4800890 )
      ( GET-2IMAGE ?auto_4800893 ?auto_4800894 ?auto_4800888 ?auto_4800889 )
      ( GET-1IMAGE-VERIFY ?auto_4800888 ?auto_4800889 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4800896 - DIRECTION
      ?auto_4800897 - MODE
      ?auto_4800898 - DIRECTION
      ?auto_4800895 - MODE
    )
    :vars
    (
      ?auto_4800901 - INSTRUMENT
      ?auto_4800900 - SATELLITE
      ?auto_4800899 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4800898 ?auto_4800896 ) ) ( ON_BOARD ?auto_4800901 ?auto_4800900 ) ( SUPPORTS ?auto_4800901 ?auto_4800895 ) ( POWER_ON ?auto_4800901 ) ( POINTING ?auto_4800900 ?auto_4800899 ) ( not ( = ?auto_4800898 ?auto_4800899 ) ) ( HAVE_IMAGE ?auto_4800896 ?auto_4800897 ) ( not ( = ?auto_4800896 ?auto_4800899 ) ) ( not ( = ?auto_4800897 ?auto_4800895 ) ) ( CALIBRATION_TARGET ?auto_4800901 ?auto_4800899 ) ( NOT_CALIBRATED ?auto_4800901 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4800898 ?auto_4800895 )
      ( GET-2IMAGE-VERIFY ?auto_4800896 ?auto_4800897 ?auto_4800898 ?auto_4800895 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4800903 - DIRECTION
      ?auto_4800904 - MODE
      ?auto_4800905 - DIRECTION
      ?auto_4800902 - MODE
    )
    :vars
    (
      ?auto_4800907 - INSTRUMENT
      ?auto_4800906 - SATELLITE
      ?auto_4800908 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4800905 ?auto_4800903 ) ) ( ON_BOARD ?auto_4800907 ?auto_4800906 ) ( SUPPORTS ?auto_4800907 ?auto_4800904 ) ( POWER_ON ?auto_4800907 ) ( POINTING ?auto_4800906 ?auto_4800908 ) ( not ( = ?auto_4800903 ?auto_4800908 ) ) ( HAVE_IMAGE ?auto_4800905 ?auto_4800902 ) ( not ( = ?auto_4800905 ?auto_4800908 ) ) ( not ( = ?auto_4800902 ?auto_4800904 ) ) ( CALIBRATION_TARGET ?auto_4800907 ?auto_4800908 ) ( NOT_CALIBRATED ?auto_4800907 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4800905 ?auto_4800902 ?auto_4800903 ?auto_4800904 )
      ( GET-2IMAGE-VERIFY ?auto_4800903 ?auto_4800904 ?auto_4800905 ?auto_4800902 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4801555 - DIRECTION
      ?auto_4801556 - MODE
    )
    :vars
    (
      ?auto_4801559 - DIRECTION
      ?auto_4801560 - INSTRUMENT
      ?auto_4801558 - SATELLITE
      ?auto_4801561 - DIRECTION
      ?auto_4801557 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_4801555 ?auto_4801559 ) ) ( ON_BOARD ?auto_4801560 ?auto_4801558 ) ( SUPPORTS ?auto_4801560 ?auto_4801556 ) ( POINTING ?auto_4801558 ?auto_4801561 ) ( not ( = ?auto_4801555 ?auto_4801561 ) ) ( HAVE_IMAGE ?auto_4801559 ?auto_4801557 ) ( not ( = ?auto_4801559 ?auto_4801561 ) ) ( not ( = ?auto_4801557 ?auto_4801556 ) ) ( CALIBRATION_TARGET ?auto_4801560 ?auto_4801561 ) ( POWER_AVAIL ?auto_4801558 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_4801560 ?auto_4801558 )
      ( GET-2IMAGE ?auto_4801559 ?auto_4801557 ?auto_4801555 ?auto_4801556 )
      ( GET-1IMAGE-VERIFY ?auto_4801555 ?auto_4801556 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4801563 - DIRECTION
      ?auto_4801564 - MODE
      ?auto_4801565 - DIRECTION
      ?auto_4801562 - MODE
    )
    :vars
    (
      ?auto_4801568 - INSTRUMENT
      ?auto_4801566 - SATELLITE
      ?auto_4801567 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4801565 ?auto_4801563 ) ) ( ON_BOARD ?auto_4801568 ?auto_4801566 ) ( SUPPORTS ?auto_4801568 ?auto_4801562 ) ( POINTING ?auto_4801566 ?auto_4801567 ) ( not ( = ?auto_4801565 ?auto_4801567 ) ) ( HAVE_IMAGE ?auto_4801563 ?auto_4801564 ) ( not ( = ?auto_4801563 ?auto_4801567 ) ) ( not ( = ?auto_4801564 ?auto_4801562 ) ) ( CALIBRATION_TARGET ?auto_4801568 ?auto_4801567 ) ( POWER_AVAIL ?auto_4801566 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4801565 ?auto_4801562 )
      ( GET-2IMAGE-VERIFY ?auto_4801563 ?auto_4801564 ?auto_4801565 ?auto_4801562 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4801570 - DIRECTION
      ?auto_4801571 - MODE
      ?auto_4801572 - DIRECTION
      ?auto_4801569 - MODE
    )
    :vars
    (
      ?auto_4801574 - INSTRUMENT
      ?auto_4801575 - SATELLITE
      ?auto_4801573 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4801572 ?auto_4801570 ) ) ( ON_BOARD ?auto_4801574 ?auto_4801575 ) ( SUPPORTS ?auto_4801574 ?auto_4801571 ) ( POINTING ?auto_4801575 ?auto_4801573 ) ( not ( = ?auto_4801570 ?auto_4801573 ) ) ( HAVE_IMAGE ?auto_4801572 ?auto_4801569 ) ( not ( = ?auto_4801572 ?auto_4801573 ) ) ( not ( = ?auto_4801569 ?auto_4801571 ) ) ( CALIBRATION_TARGET ?auto_4801574 ?auto_4801573 ) ( POWER_AVAIL ?auto_4801575 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4801572 ?auto_4801569 ?auto_4801570 ?auto_4801571 )
      ( GET-2IMAGE-VERIFY ?auto_4801570 ?auto_4801571 ?auto_4801572 ?auto_4801569 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4802222 - DIRECTION
      ?auto_4802223 - MODE
    )
    :vars
    (
      ?auto_4802227 - DIRECTION
      ?auto_4802225 - INSTRUMENT
      ?auto_4802226 - SATELLITE
      ?auto_4802224 - DIRECTION
      ?auto_4802228 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_4802222 ?auto_4802227 ) ) ( ON_BOARD ?auto_4802225 ?auto_4802226 ) ( SUPPORTS ?auto_4802225 ?auto_4802223 ) ( not ( = ?auto_4802222 ?auto_4802224 ) ) ( HAVE_IMAGE ?auto_4802227 ?auto_4802228 ) ( not ( = ?auto_4802227 ?auto_4802224 ) ) ( not ( = ?auto_4802228 ?auto_4802223 ) ) ( CALIBRATION_TARGET ?auto_4802225 ?auto_4802224 ) ( POWER_AVAIL ?auto_4802226 ) ( POINTING ?auto_4802226 ?auto_4802227 ) )
    :subtasks
    ( ( !TURN_TO ?auto_4802226 ?auto_4802224 ?auto_4802227 )
      ( GET-2IMAGE ?auto_4802227 ?auto_4802228 ?auto_4802222 ?auto_4802223 )
      ( GET-1IMAGE-VERIFY ?auto_4802222 ?auto_4802223 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4802230 - DIRECTION
      ?auto_4802231 - MODE
      ?auto_4802232 - DIRECTION
      ?auto_4802229 - MODE
    )
    :vars
    (
      ?auto_4802235 - INSTRUMENT
      ?auto_4802234 - SATELLITE
      ?auto_4802233 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4802232 ?auto_4802230 ) ) ( ON_BOARD ?auto_4802235 ?auto_4802234 ) ( SUPPORTS ?auto_4802235 ?auto_4802229 ) ( not ( = ?auto_4802232 ?auto_4802233 ) ) ( HAVE_IMAGE ?auto_4802230 ?auto_4802231 ) ( not ( = ?auto_4802230 ?auto_4802233 ) ) ( not ( = ?auto_4802231 ?auto_4802229 ) ) ( CALIBRATION_TARGET ?auto_4802235 ?auto_4802233 ) ( POWER_AVAIL ?auto_4802234 ) ( POINTING ?auto_4802234 ?auto_4802230 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4802232 ?auto_4802229 )
      ( GET-2IMAGE-VERIFY ?auto_4802230 ?auto_4802231 ?auto_4802232 ?auto_4802229 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4802237 - DIRECTION
      ?auto_4802238 - MODE
      ?auto_4802239 - DIRECTION
      ?auto_4802236 - MODE
    )
    :vars
    (
      ?auto_4802242 - INSTRUMENT
      ?auto_4802241 - SATELLITE
      ?auto_4802240 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4802239 ?auto_4802237 ) ) ( ON_BOARD ?auto_4802242 ?auto_4802241 ) ( SUPPORTS ?auto_4802242 ?auto_4802238 ) ( not ( = ?auto_4802237 ?auto_4802240 ) ) ( HAVE_IMAGE ?auto_4802239 ?auto_4802236 ) ( not ( = ?auto_4802239 ?auto_4802240 ) ) ( not ( = ?auto_4802236 ?auto_4802238 ) ) ( CALIBRATION_TARGET ?auto_4802242 ?auto_4802240 ) ( POWER_AVAIL ?auto_4802241 ) ( POINTING ?auto_4802241 ?auto_4802239 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4802239 ?auto_4802236 ?auto_4802237 ?auto_4802238 )
      ( GET-2IMAGE-VERIFY ?auto_4802237 ?auto_4802238 ?auto_4802239 ?auto_4802236 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4802889 - DIRECTION
      ?auto_4802890 - MODE
    )
    :vars
    (
      ?auto_4802892 - DIRECTION
      ?auto_4802894 - INSTRUMENT
      ?auto_4802893 - SATELLITE
      ?auto_4802891 - DIRECTION
      ?auto_4802895 - MODE
      ?auto_4802896 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4802889 ?auto_4802892 ) ) ( ON_BOARD ?auto_4802894 ?auto_4802893 ) ( SUPPORTS ?auto_4802894 ?auto_4802890 ) ( not ( = ?auto_4802889 ?auto_4802891 ) ) ( HAVE_IMAGE ?auto_4802892 ?auto_4802895 ) ( not ( = ?auto_4802892 ?auto_4802891 ) ) ( not ( = ?auto_4802895 ?auto_4802890 ) ) ( CALIBRATION_TARGET ?auto_4802894 ?auto_4802891 ) ( POINTING ?auto_4802893 ?auto_4802892 ) ( ON_BOARD ?auto_4802896 ?auto_4802893 ) ( POWER_ON ?auto_4802896 ) ( not ( = ?auto_4802894 ?auto_4802896 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_4802896 ?auto_4802893 )
      ( GET-2IMAGE ?auto_4802892 ?auto_4802895 ?auto_4802889 ?auto_4802890 )
      ( GET-1IMAGE-VERIFY ?auto_4802889 ?auto_4802890 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4802898 - DIRECTION
      ?auto_4802899 - MODE
      ?auto_4802900 - DIRECTION
      ?auto_4802897 - MODE
    )
    :vars
    (
      ?auto_4802901 - INSTRUMENT
      ?auto_4802904 - SATELLITE
      ?auto_4802902 - DIRECTION
      ?auto_4802903 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4802900 ?auto_4802898 ) ) ( ON_BOARD ?auto_4802901 ?auto_4802904 ) ( SUPPORTS ?auto_4802901 ?auto_4802897 ) ( not ( = ?auto_4802900 ?auto_4802902 ) ) ( HAVE_IMAGE ?auto_4802898 ?auto_4802899 ) ( not ( = ?auto_4802898 ?auto_4802902 ) ) ( not ( = ?auto_4802899 ?auto_4802897 ) ) ( CALIBRATION_TARGET ?auto_4802901 ?auto_4802902 ) ( POINTING ?auto_4802904 ?auto_4802898 ) ( ON_BOARD ?auto_4802903 ?auto_4802904 ) ( POWER_ON ?auto_4802903 ) ( not ( = ?auto_4802901 ?auto_4802903 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4802900 ?auto_4802897 )
      ( GET-2IMAGE-VERIFY ?auto_4802898 ?auto_4802899 ?auto_4802900 ?auto_4802897 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4802906 - DIRECTION
      ?auto_4802907 - MODE
      ?auto_4802908 - DIRECTION
      ?auto_4802905 - MODE
    )
    :vars
    (
      ?auto_4802912 - INSTRUMENT
      ?auto_4802909 - SATELLITE
      ?auto_4802910 - DIRECTION
      ?auto_4802911 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4802908 ?auto_4802906 ) ) ( ON_BOARD ?auto_4802912 ?auto_4802909 ) ( SUPPORTS ?auto_4802912 ?auto_4802907 ) ( not ( = ?auto_4802906 ?auto_4802910 ) ) ( HAVE_IMAGE ?auto_4802908 ?auto_4802905 ) ( not ( = ?auto_4802908 ?auto_4802910 ) ) ( not ( = ?auto_4802905 ?auto_4802907 ) ) ( CALIBRATION_TARGET ?auto_4802912 ?auto_4802910 ) ( POINTING ?auto_4802909 ?auto_4802908 ) ( ON_BOARD ?auto_4802911 ?auto_4802909 ) ( POWER_ON ?auto_4802911 ) ( not ( = ?auto_4802912 ?auto_4802911 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4802908 ?auto_4802905 ?auto_4802906 ?auto_4802907 )
      ( GET-2IMAGE-VERIFY ?auto_4802906 ?auto_4802907 ?auto_4802908 ?auto_4802905 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4803613 - DIRECTION
      ?auto_4803614 - MODE
    )
    :vars
    (
      ?auto_4803618 - DIRECTION
      ?auto_4803620 - INSTRUMENT
      ?auto_4803616 - SATELLITE
      ?auto_4803617 - DIRECTION
      ?auto_4803615 - MODE
      ?auto_4803619 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4803613 ?auto_4803618 ) ) ( ON_BOARD ?auto_4803620 ?auto_4803616 ) ( SUPPORTS ?auto_4803620 ?auto_4803614 ) ( not ( = ?auto_4803613 ?auto_4803617 ) ) ( not ( = ?auto_4803618 ?auto_4803617 ) ) ( not ( = ?auto_4803615 ?auto_4803614 ) ) ( CALIBRATION_TARGET ?auto_4803620 ?auto_4803617 ) ( POINTING ?auto_4803616 ?auto_4803618 ) ( ON_BOARD ?auto_4803619 ?auto_4803616 ) ( POWER_ON ?auto_4803619 ) ( not ( = ?auto_4803620 ?auto_4803619 ) ) ( CALIBRATED ?auto_4803619 ) ( SUPPORTS ?auto_4803619 ?auto_4803615 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4803618 ?auto_4803615 )
      ( GET-2IMAGE ?auto_4803618 ?auto_4803615 ?auto_4803613 ?auto_4803614 )
      ( GET-1IMAGE-VERIFY ?auto_4803613 ?auto_4803614 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4803622 - DIRECTION
      ?auto_4803623 - MODE
      ?auto_4803624 - DIRECTION
      ?auto_4803621 - MODE
    )
    :vars
    (
      ?auto_4803627 - INSTRUMENT
      ?auto_4803628 - SATELLITE
      ?auto_4803626 - DIRECTION
      ?auto_4803625 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4803624 ?auto_4803622 ) ) ( ON_BOARD ?auto_4803627 ?auto_4803628 ) ( SUPPORTS ?auto_4803627 ?auto_4803621 ) ( not ( = ?auto_4803624 ?auto_4803626 ) ) ( not ( = ?auto_4803622 ?auto_4803626 ) ) ( not ( = ?auto_4803623 ?auto_4803621 ) ) ( CALIBRATION_TARGET ?auto_4803627 ?auto_4803626 ) ( POINTING ?auto_4803628 ?auto_4803622 ) ( ON_BOARD ?auto_4803625 ?auto_4803628 ) ( POWER_ON ?auto_4803625 ) ( not ( = ?auto_4803627 ?auto_4803625 ) ) ( CALIBRATED ?auto_4803625 ) ( SUPPORTS ?auto_4803625 ?auto_4803623 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4803624 ?auto_4803621 )
      ( GET-2IMAGE-VERIFY ?auto_4803622 ?auto_4803623 ?auto_4803624 ?auto_4803621 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4803630 - DIRECTION
      ?auto_4803631 - MODE
      ?auto_4803632 - DIRECTION
      ?auto_4803629 - MODE
    )
    :vars
    (
      ?auto_4803635 - INSTRUMENT
      ?auto_4803634 - SATELLITE
      ?auto_4803636 - DIRECTION
      ?auto_4803633 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4803632 ?auto_4803630 ) ) ( ON_BOARD ?auto_4803635 ?auto_4803634 ) ( SUPPORTS ?auto_4803635 ?auto_4803631 ) ( not ( = ?auto_4803630 ?auto_4803636 ) ) ( not ( = ?auto_4803632 ?auto_4803636 ) ) ( not ( = ?auto_4803629 ?auto_4803631 ) ) ( CALIBRATION_TARGET ?auto_4803635 ?auto_4803636 ) ( POINTING ?auto_4803634 ?auto_4803632 ) ( ON_BOARD ?auto_4803633 ?auto_4803634 ) ( POWER_ON ?auto_4803633 ) ( not ( = ?auto_4803635 ?auto_4803633 ) ) ( CALIBRATED ?auto_4803633 ) ( SUPPORTS ?auto_4803633 ?auto_4803629 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4803632 ?auto_4803629 ?auto_4803630 ?auto_4803631 )
      ( GET-2IMAGE-VERIFY ?auto_4803630 ?auto_4803631 ?auto_4803632 ?auto_4803629 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4804337 - DIRECTION
      ?auto_4804338 - MODE
    )
    :vars
    (
      ?auto_4804343 - DIRECTION
      ?auto_4804341 - INSTRUMENT
      ?auto_4804340 - SATELLITE
      ?auto_4804342 - DIRECTION
      ?auto_4804344 - MODE
      ?auto_4804339 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4804337 ?auto_4804343 ) ) ( ON_BOARD ?auto_4804341 ?auto_4804340 ) ( SUPPORTS ?auto_4804341 ?auto_4804338 ) ( not ( = ?auto_4804337 ?auto_4804342 ) ) ( not ( = ?auto_4804343 ?auto_4804342 ) ) ( not ( = ?auto_4804344 ?auto_4804338 ) ) ( CALIBRATION_TARGET ?auto_4804341 ?auto_4804342 ) ( ON_BOARD ?auto_4804339 ?auto_4804340 ) ( POWER_ON ?auto_4804339 ) ( not ( = ?auto_4804341 ?auto_4804339 ) ) ( CALIBRATED ?auto_4804339 ) ( SUPPORTS ?auto_4804339 ?auto_4804344 ) ( POINTING ?auto_4804340 ?auto_4804342 ) )
    :subtasks
    ( ( !TURN_TO ?auto_4804340 ?auto_4804343 ?auto_4804342 )
      ( GET-2IMAGE ?auto_4804343 ?auto_4804344 ?auto_4804337 ?auto_4804338 )
      ( GET-1IMAGE-VERIFY ?auto_4804337 ?auto_4804338 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4804346 - DIRECTION
      ?auto_4804347 - MODE
      ?auto_4804348 - DIRECTION
      ?auto_4804345 - MODE
    )
    :vars
    (
      ?auto_4804352 - INSTRUMENT
      ?auto_4804350 - SATELLITE
      ?auto_4804349 - DIRECTION
      ?auto_4804351 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4804348 ?auto_4804346 ) ) ( ON_BOARD ?auto_4804352 ?auto_4804350 ) ( SUPPORTS ?auto_4804352 ?auto_4804345 ) ( not ( = ?auto_4804348 ?auto_4804349 ) ) ( not ( = ?auto_4804346 ?auto_4804349 ) ) ( not ( = ?auto_4804347 ?auto_4804345 ) ) ( CALIBRATION_TARGET ?auto_4804352 ?auto_4804349 ) ( ON_BOARD ?auto_4804351 ?auto_4804350 ) ( POWER_ON ?auto_4804351 ) ( not ( = ?auto_4804352 ?auto_4804351 ) ) ( CALIBRATED ?auto_4804351 ) ( SUPPORTS ?auto_4804351 ?auto_4804347 ) ( POINTING ?auto_4804350 ?auto_4804349 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4804348 ?auto_4804345 )
      ( GET-2IMAGE-VERIFY ?auto_4804346 ?auto_4804347 ?auto_4804348 ?auto_4804345 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4804354 - DIRECTION
      ?auto_4804355 - MODE
      ?auto_4804356 - DIRECTION
      ?auto_4804353 - MODE
    )
    :vars
    (
      ?auto_4804360 - INSTRUMENT
      ?auto_4804357 - SATELLITE
      ?auto_4804359 - DIRECTION
      ?auto_4804358 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4804356 ?auto_4804354 ) ) ( ON_BOARD ?auto_4804360 ?auto_4804357 ) ( SUPPORTS ?auto_4804360 ?auto_4804355 ) ( not ( = ?auto_4804354 ?auto_4804359 ) ) ( not ( = ?auto_4804356 ?auto_4804359 ) ) ( not ( = ?auto_4804353 ?auto_4804355 ) ) ( CALIBRATION_TARGET ?auto_4804360 ?auto_4804359 ) ( ON_BOARD ?auto_4804358 ?auto_4804357 ) ( POWER_ON ?auto_4804358 ) ( not ( = ?auto_4804360 ?auto_4804358 ) ) ( CALIBRATED ?auto_4804358 ) ( SUPPORTS ?auto_4804358 ?auto_4804353 ) ( POINTING ?auto_4804357 ?auto_4804359 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4804356 ?auto_4804353 ?auto_4804354 ?auto_4804355 )
      ( GET-2IMAGE-VERIFY ?auto_4804354 ?auto_4804355 ?auto_4804356 ?auto_4804353 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4805061 - DIRECTION
      ?auto_4805062 - MODE
    )
    :vars
    (
      ?auto_4805068 - DIRECTION
      ?auto_4805066 - INSTRUMENT
      ?auto_4805063 - SATELLITE
      ?auto_4805065 - DIRECTION
      ?auto_4805067 - MODE
      ?auto_4805064 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4805061 ?auto_4805068 ) ) ( ON_BOARD ?auto_4805066 ?auto_4805063 ) ( SUPPORTS ?auto_4805066 ?auto_4805062 ) ( not ( = ?auto_4805061 ?auto_4805065 ) ) ( not ( = ?auto_4805068 ?auto_4805065 ) ) ( not ( = ?auto_4805067 ?auto_4805062 ) ) ( CALIBRATION_TARGET ?auto_4805066 ?auto_4805065 ) ( ON_BOARD ?auto_4805064 ?auto_4805063 ) ( POWER_ON ?auto_4805064 ) ( not ( = ?auto_4805066 ?auto_4805064 ) ) ( SUPPORTS ?auto_4805064 ?auto_4805067 ) ( POINTING ?auto_4805063 ?auto_4805065 ) ( CALIBRATION_TARGET ?auto_4805064 ?auto_4805065 ) ( NOT_CALIBRATED ?auto_4805064 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_4805063 ?auto_4805064 ?auto_4805065 )
      ( GET-2IMAGE ?auto_4805068 ?auto_4805067 ?auto_4805061 ?auto_4805062 )
      ( GET-1IMAGE-VERIFY ?auto_4805061 ?auto_4805062 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4805070 - DIRECTION
      ?auto_4805071 - MODE
      ?auto_4805072 - DIRECTION
      ?auto_4805069 - MODE
    )
    :vars
    (
      ?auto_4805074 - INSTRUMENT
      ?auto_4805073 - SATELLITE
      ?auto_4805076 - DIRECTION
      ?auto_4805075 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4805072 ?auto_4805070 ) ) ( ON_BOARD ?auto_4805074 ?auto_4805073 ) ( SUPPORTS ?auto_4805074 ?auto_4805069 ) ( not ( = ?auto_4805072 ?auto_4805076 ) ) ( not ( = ?auto_4805070 ?auto_4805076 ) ) ( not ( = ?auto_4805071 ?auto_4805069 ) ) ( CALIBRATION_TARGET ?auto_4805074 ?auto_4805076 ) ( ON_BOARD ?auto_4805075 ?auto_4805073 ) ( POWER_ON ?auto_4805075 ) ( not ( = ?auto_4805074 ?auto_4805075 ) ) ( SUPPORTS ?auto_4805075 ?auto_4805071 ) ( POINTING ?auto_4805073 ?auto_4805076 ) ( CALIBRATION_TARGET ?auto_4805075 ?auto_4805076 ) ( NOT_CALIBRATED ?auto_4805075 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4805072 ?auto_4805069 )
      ( GET-2IMAGE-VERIFY ?auto_4805070 ?auto_4805071 ?auto_4805072 ?auto_4805069 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4805078 - DIRECTION
      ?auto_4805079 - MODE
      ?auto_4805080 - DIRECTION
      ?auto_4805077 - MODE
    )
    :vars
    (
      ?auto_4805084 - INSTRUMENT
      ?auto_4805082 - SATELLITE
      ?auto_4805081 - DIRECTION
      ?auto_4805083 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4805080 ?auto_4805078 ) ) ( ON_BOARD ?auto_4805084 ?auto_4805082 ) ( SUPPORTS ?auto_4805084 ?auto_4805079 ) ( not ( = ?auto_4805078 ?auto_4805081 ) ) ( not ( = ?auto_4805080 ?auto_4805081 ) ) ( not ( = ?auto_4805077 ?auto_4805079 ) ) ( CALIBRATION_TARGET ?auto_4805084 ?auto_4805081 ) ( ON_BOARD ?auto_4805083 ?auto_4805082 ) ( POWER_ON ?auto_4805083 ) ( not ( = ?auto_4805084 ?auto_4805083 ) ) ( SUPPORTS ?auto_4805083 ?auto_4805077 ) ( POINTING ?auto_4805082 ?auto_4805081 ) ( CALIBRATION_TARGET ?auto_4805083 ?auto_4805081 ) ( NOT_CALIBRATED ?auto_4805083 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4805080 ?auto_4805077 ?auto_4805078 ?auto_4805079 )
      ( GET-2IMAGE-VERIFY ?auto_4805078 ?auto_4805079 ?auto_4805080 ?auto_4805077 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4809954 - DIRECTION
      ?auto_4809955 - MODE
      ?auto_4809956 - DIRECTION
      ?auto_4809953 - MODE
      ?auto_4809958 - DIRECTION
      ?auto_4809957 - MODE
    )
    :vars
    (
      ?auto_4809960 - INSTRUMENT
      ?auto_4809959 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_4809956 ?auto_4809954 ) ) ( not ( = ?auto_4809958 ?auto_4809954 ) ) ( not ( = ?auto_4809958 ?auto_4809956 ) ) ( CALIBRATED ?auto_4809960 ) ( ON_BOARD ?auto_4809960 ?auto_4809959 ) ( SUPPORTS ?auto_4809960 ?auto_4809957 ) ( POWER_ON ?auto_4809960 ) ( POINTING ?auto_4809959 ?auto_4809958 ) ( HAVE_IMAGE ?auto_4809954 ?auto_4809955 ) ( HAVE_IMAGE ?auto_4809956 ?auto_4809953 ) ( not ( = ?auto_4809955 ?auto_4809953 ) ) ( not ( = ?auto_4809955 ?auto_4809957 ) ) ( not ( = ?auto_4809953 ?auto_4809957 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4809958 ?auto_4809957 )
      ( GET-3IMAGE-VERIFY ?auto_4809954 ?auto_4809955 ?auto_4809956 ?auto_4809953 ?auto_4809958 ?auto_4809957 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4809970 - DIRECTION
      ?auto_4809971 - MODE
      ?auto_4809972 - DIRECTION
      ?auto_4809969 - MODE
      ?auto_4809974 - DIRECTION
      ?auto_4809973 - MODE
    )
    :vars
    (
      ?auto_4809976 - INSTRUMENT
      ?auto_4809975 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_4809972 ?auto_4809970 ) ) ( not ( = ?auto_4809974 ?auto_4809970 ) ) ( not ( = ?auto_4809974 ?auto_4809972 ) ) ( CALIBRATED ?auto_4809976 ) ( ON_BOARD ?auto_4809976 ?auto_4809975 ) ( SUPPORTS ?auto_4809976 ?auto_4809969 ) ( POWER_ON ?auto_4809976 ) ( POINTING ?auto_4809975 ?auto_4809972 ) ( HAVE_IMAGE ?auto_4809970 ?auto_4809971 ) ( HAVE_IMAGE ?auto_4809974 ?auto_4809973 ) ( not ( = ?auto_4809971 ?auto_4809969 ) ) ( not ( = ?auto_4809971 ?auto_4809973 ) ) ( not ( = ?auto_4809969 ?auto_4809973 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4809972 ?auto_4809969 )
      ( GET-3IMAGE-VERIFY ?auto_4809970 ?auto_4809971 ?auto_4809972 ?auto_4809969 ?auto_4809974 ?auto_4809973 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4810030 - DIRECTION
      ?auto_4810031 - MODE
      ?auto_4810032 - DIRECTION
      ?auto_4810029 - MODE
      ?auto_4810034 - DIRECTION
      ?auto_4810033 - MODE
    )
    :vars
    (
      ?auto_4810036 - INSTRUMENT
      ?auto_4810035 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_4810032 ?auto_4810030 ) ) ( not ( = ?auto_4810034 ?auto_4810030 ) ) ( not ( = ?auto_4810034 ?auto_4810032 ) ) ( CALIBRATED ?auto_4810036 ) ( ON_BOARD ?auto_4810036 ?auto_4810035 ) ( SUPPORTS ?auto_4810036 ?auto_4810031 ) ( POWER_ON ?auto_4810036 ) ( POINTING ?auto_4810035 ?auto_4810030 ) ( HAVE_IMAGE ?auto_4810032 ?auto_4810029 ) ( HAVE_IMAGE ?auto_4810034 ?auto_4810033 ) ( not ( = ?auto_4810031 ?auto_4810029 ) ) ( not ( = ?auto_4810031 ?auto_4810033 ) ) ( not ( = ?auto_4810029 ?auto_4810033 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4810030 ?auto_4810031 )
      ( GET-3IMAGE-VERIFY ?auto_4810030 ?auto_4810031 ?auto_4810032 ?auto_4810029 ?auto_4810034 ?auto_4810033 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4813319 - DIRECTION
      ?auto_4813320 - MODE
      ?auto_4813321 - DIRECTION
      ?auto_4813318 - MODE
      ?auto_4813323 - DIRECTION
      ?auto_4813322 - MODE
    )
    :vars
    (
      ?auto_4813325 - INSTRUMENT
      ?auto_4813326 - SATELLITE
      ?auto_4813324 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4813321 ?auto_4813319 ) ) ( not ( = ?auto_4813323 ?auto_4813319 ) ) ( not ( = ?auto_4813323 ?auto_4813321 ) ) ( CALIBRATED ?auto_4813325 ) ( ON_BOARD ?auto_4813325 ?auto_4813326 ) ( SUPPORTS ?auto_4813325 ?auto_4813322 ) ( POWER_ON ?auto_4813325 ) ( POINTING ?auto_4813326 ?auto_4813324 ) ( not ( = ?auto_4813323 ?auto_4813324 ) ) ( HAVE_IMAGE ?auto_4813319 ?auto_4813320 ) ( not ( = ?auto_4813319 ?auto_4813324 ) ) ( not ( = ?auto_4813320 ?auto_4813322 ) ) ( HAVE_IMAGE ?auto_4813321 ?auto_4813318 ) ( not ( = ?auto_4813320 ?auto_4813318 ) ) ( not ( = ?auto_4813321 ?auto_4813324 ) ) ( not ( = ?auto_4813318 ?auto_4813322 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4813319 ?auto_4813320 ?auto_4813323 ?auto_4813322 )
      ( GET-3IMAGE-VERIFY ?auto_4813319 ?auto_4813320 ?auto_4813321 ?auto_4813318 ?auto_4813323 ?auto_4813322 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4813337 - DIRECTION
      ?auto_4813338 - MODE
      ?auto_4813339 - DIRECTION
      ?auto_4813336 - MODE
      ?auto_4813341 - DIRECTION
      ?auto_4813340 - MODE
    )
    :vars
    (
      ?auto_4813343 - INSTRUMENT
      ?auto_4813344 - SATELLITE
      ?auto_4813342 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4813339 ?auto_4813337 ) ) ( not ( = ?auto_4813341 ?auto_4813337 ) ) ( not ( = ?auto_4813341 ?auto_4813339 ) ) ( CALIBRATED ?auto_4813343 ) ( ON_BOARD ?auto_4813343 ?auto_4813344 ) ( SUPPORTS ?auto_4813343 ?auto_4813336 ) ( POWER_ON ?auto_4813343 ) ( POINTING ?auto_4813344 ?auto_4813342 ) ( not ( = ?auto_4813339 ?auto_4813342 ) ) ( HAVE_IMAGE ?auto_4813337 ?auto_4813338 ) ( not ( = ?auto_4813337 ?auto_4813342 ) ) ( not ( = ?auto_4813338 ?auto_4813336 ) ) ( HAVE_IMAGE ?auto_4813341 ?auto_4813340 ) ( not ( = ?auto_4813338 ?auto_4813340 ) ) ( not ( = ?auto_4813336 ?auto_4813340 ) ) ( not ( = ?auto_4813341 ?auto_4813342 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4813337 ?auto_4813338 ?auto_4813339 ?auto_4813336 )
      ( GET-3IMAGE-VERIFY ?auto_4813337 ?auto_4813338 ?auto_4813339 ?auto_4813336 ?auto_4813341 ?auto_4813340 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4813409 - DIRECTION
      ?auto_4813410 - MODE
      ?auto_4813411 - DIRECTION
      ?auto_4813408 - MODE
      ?auto_4813413 - DIRECTION
      ?auto_4813412 - MODE
    )
    :vars
    (
      ?auto_4813415 - INSTRUMENT
      ?auto_4813416 - SATELLITE
      ?auto_4813414 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4813411 ?auto_4813409 ) ) ( not ( = ?auto_4813413 ?auto_4813409 ) ) ( not ( = ?auto_4813413 ?auto_4813411 ) ) ( CALIBRATED ?auto_4813415 ) ( ON_BOARD ?auto_4813415 ?auto_4813416 ) ( SUPPORTS ?auto_4813415 ?auto_4813410 ) ( POWER_ON ?auto_4813415 ) ( POINTING ?auto_4813416 ?auto_4813414 ) ( not ( = ?auto_4813409 ?auto_4813414 ) ) ( HAVE_IMAGE ?auto_4813411 ?auto_4813408 ) ( not ( = ?auto_4813411 ?auto_4813414 ) ) ( not ( = ?auto_4813408 ?auto_4813410 ) ) ( HAVE_IMAGE ?auto_4813413 ?auto_4813412 ) ( not ( = ?auto_4813410 ?auto_4813412 ) ) ( not ( = ?auto_4813408 ?auto_4813412 ) ) ( not ( = ?auto_4813413 ?auto_4813414 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4813411 ?auto_4813408 ?auto_4813409 ?auto_4813410 )
      ( GET-3IMAGE-VERIFY ?auto_4813409 ?auto_4813410 ?auto_4813411 ?auto_4813408 ?auto_4813413 ?auto_4813412 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4817083 - DIRECTION
      ?auto_4817084 - MODE
      ?auto_4817085 - DIRECTION
      ?auto_4817082 - MODE
      ?auto_4817087 - DIRECTION
      ?auto_4817086 - MODE
    )
    :vars
    (
      ?auto_4817090 - INSTRUMENT
      ?auto_4817088 - SATELLITE
      ?auto_4817089 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4817085 ?auto_4817083 ) ) ( not ( = ?auto_4817087 ?auto_4817083 ) ) ( not ( = ?auto_4817087 ?auto_4817085 ) ) ( ON_BOARD ?auto_4817090 ?auto_4817088 ) ( SUPPORTS ?auto_4817090 ?auto_4817086 ) ( POWER_ON ?auto_4817090 ) ( POINTING ?auto_4817088 ?auto_4817089 ) ( not ( = ?auto_4817087 ?auto_4817089 ) ) ( HAVE_IMAGE ?auto_4817083 ?auto_4817084 ) ( not ( = ?auto_4817083 ?auto_4817089 ) ) ( not ( = ?auto_4817084 ?auto_4817086 ) ) ( CALIBRATION_TARGET ?auto_4817090 ?auto_4817089 ) ( NOT_CALIBRATED ?auto_4817090 ) ( HAVE_IMAGE ?auto_4817085 ?auto_4817082 ) ( not ( = ?auto_4817084 ?auto_4817082 ) ) ( not ( = ?auto_4817085 ?auto_4817089 ) ) ( not ( = ?auto_4817082 ?auto_4817086 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4817083 ?auto_4817084 ?auto_4817087 ?auto_4817086 )
      ( GET-3IMAGE-VERIFY ?auto_4817083 ?auto_4817084 ?auto_4817085 ?auto_4817082 ?auto_4817087 ?auto_4817086 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4817101 - DIRECTION
      ?auto_4817102 - MODE
      ?auto_4817103 - DIRECTION
      ?auto_4817100 - MODE
      ?auto_4817105 - DIRECTION
      ?auto_4817104 - MODE
    )
    :vars
    (
      ?auto_4817108 - INSTRUMENT
      ?auto_4817106 - SATELLITE
      ?auto_4817107 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4817103 ?auto_4817101 ) ) ( not ( = ?auto_4817105 ?auto_4817101 ) ) ( not ( = ?auto_4817105 ?auto_4817103 ) ) ( ON_BOARD ?auto_4817108 ?auto_4817106 ) ( SUPPORTS ?auto_4817108 ?auto_4817100 ) ( POWER_ON ?auto_4817108 ) ( POINTING ?auto_4817106 ?auto_4817107 ) ( not ( = ?auto_4817103 ?auto_4817107 ) ) ( HAVE_IMAGE ?auto_4817101 ?auto_4817102 ) ( not ( = ?auto_4817101 ?auto_4817107 ) ) ( not ( = ?auto_4817102 ?auto_4817100 ) ) ( CALIBRATION_TARGET ?auto_4817108 ?auto_4817107 ) ( NOT_CALIBRATED ?auto_4817108 ) ( HAVE_IMAGE ?auto_4817105 ?auto_4817104 ) ( not ( = ?auto_4817102 ?auto_4817104 ) ) ( not ( = ?auto_4817100 ?auto_4817104 ) ) ( not ( = ?auto_4817105 ?auto_4817107 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4817101 ?auto_4817102 ?auto_4817103 ?auto_4817100 )
      ( GET-3IMAGE-VERIFY ?auto_4817101 ?auto_4817102 ?auto_4817103 ?auto_4817100 ?auto_4817105 ?auto_4817104 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4817173 - DIRECTION
      ?auto_4817174 - MODE
      ?auto_4817175 - DIRECTION
      ?auto_4817172 - MODE
      ?auto_4817177 - DIRECTION
      ?auto_4817176 - MODE
    )
    :vars
    (
      ?auto_4817180 - INSTRUMENT
      ?auto_4817178 - SATELLITE
      ?auto_4817179 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4817175 ?auto_4817173 ) ) ( not ( = ?auto_4817177 ?auto_4817173 ) ) ( not ( = ?auto_4817177 ?auto_4817175 ) ) ( ON_BOARD ?auto_4817180 ?auto_4817178 ) ( SUPPORTS ?auto_4817180 ?auto_4817174 ) ( POWER_ON ?auto_4817180 ) ( POINTING ?auto_4817178 ?auto_4817179 ) ( not ( = ?auto_4817173 ?auto_4817179 ) ) ( HAVE_IMAGE ?auto_4817175 ?auto_4817172 ) ( not ( = ?auto_4817175 ?auto_4817179 ) ) ( not ( = ?auto_4817172 ?auto_4817174 ) ) ( CALIBRATION_TARGET ?auto_4817180 ?auto_4817179 ) ( NOT_CALIBRATED ?auto_4817180 ) ( HAVE_IMAGE ?auto_4817177 ?auto_4817176 ) ( not ( = ?auto_4817174 ?auto_4817176 ) ) ( not ( = ?auto_4817172 ?auto_4817176 ) ) ( not ( = ?auto_4817177 ?auto_4817179 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4817175 ?auto_4817172 ?auto_4817173 ?auto_4817174 )
      ( GET-3IMAGE-VERIFY ?auto_4817173 ?auto_4817174 ?auto_4817175 ?auto_4817172 ?auto_4817177 ?auto_4817176 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4820847 - DIRECTION
      ?auto_4820848 - MODE
      ?auto_4820849 - DIRECTION
      ?auto_4820846 - MODE
      ?auto_4820851 - DIRECTION
      ?auto_4820850 - MODE
    )
    :vars
    (
      ?auto_4820853 - INSTRUMENT
      ?auto_4820854 - SATELLITE
      ?auto_4820852 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4820849 ?auto_4820847 ) ) ( not ( = ?auto_4820851 ?auto_4820847 ) ) ( not ( = ?auto_4820851 ?auto_4820849 ) ) ( ON_BOARD ?auto_4820853 ?auto_4820854 ) ( SUPPORTS ?auto_4820853 ?auto_4820850 ) ( POINTING ?auto_4820854 ?auto_4820852 ) ( not ( = ?auto_4820851 ?auto_4820852 ) ) ( HAVE_IMAGE ?auto_4820847 ?auto_4820848 ) ( not ( = ?auto_4820847 ?auto_4820852 ) ) ( not ( = ?auto_4820848 ?auto_4820850 ) ) ( CALIBRATION_TARGET ?auto_4820853 ?auto_4820852 ) ( POWER_AVAIL ?auto_4820854 ) ( HAVE_IMAGE ?auto_4820849 ?auto_4820846 ) ( not ( = ?auto_4820848 ?auto_4820846 ) ) ( not ( = ?auto_4820849 ?auto_4820852 ) ) ( not ( = ?auto_4820846 ?auto_4820850 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4820847 ?auto_4820848 ?auto_4820851 ?auto_4820850 )
      ( GET-3IMAGE-VERIFY ?auto_4820847 ?auto_4820848 ?auto_4820849 ?auto_4820846 ?auto_4820851 ?auto_4820850 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4820865 - DIRECTION
      ?auto_4820866 - MODE
      ?auto_4820867 - DIRECTION
      ?auto_4820864 - MODE
      ?auto_4820869 - DIRECTION
      ?auto_4820868 - MODE
    )
    :vars
    (
      ?auto_4820871 - INSTRUMENT
      ?auto_4820872 - SATELLITE
      ?auto_4820870 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4820867 ?auto_4820865 ) ) ( not ( = ?auto_4820869 ?auto_4820865 ) ) ( not ( = ?auto_4820869 ?auto_4820867 ) ) ( ON_BOARD ?auto_4820871 ?auto_4820872 ) ( SUPPORTS ?auto_4820871 ?auto_4820864 ) ( POINTING ?auto_4820872 ?auto_4820870 ) ( not ( = ?auto_4820867 ?auto_4820870 ) ) ( HAVE_IMAGE ?auto_4820865 ?auto_4820866 ) ( not ( = ?auto_4820865 ?auto_4820870 ) ) ( not ( = ?auto_4820866 ?auto_4820864 ) ) ( CALIBRATION_TARGET ?auto_4820871 ?auto_4820870 ) ( POWER_AVAIL ?auto_4820872 ) ( HAVE_IMAGE ?auto_4820869 ?auto_4820868 ) ( not ( = ?auto_4820866 ?auto_4820868 ) ) ( not ( = ?auto_4820864 ?auto_4820868 ) ) ( not ( = ?auto_4820869 ?auto_4820870 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4820865 ?auto_4820866 ?auto_4820867 ?auto_4820864 )
      ( GET-3IMAGE-VERIFY ?auto_4820865 ?auto_4820866 ?auto_4820867 ?auto_4820864 ?auto_4820869 ?auto_4820868 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4820937 - DIRECTION
      ?auto_4820938 - MODE
      ?auto_4820939 - DIRECTION
      ?auto_4820936 - MODE
      ?auto_4820941 - DIRECTION
      ?auto_4820940 - MODE
    )
    :vars
    (
      ?auto_4820943 - INSTRUMENT
      ?auto_4820944 - SATELLITE
      ?auto_4820942 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4820939 ?auto_4820937 ) ) ( not ( = ?auto_4820941 ?auto_4820937 ) ) ( not ( = ?auto_4820941 ?auto_4820939 ) ) ( ON_BOARD ?auto_4820943 ?auto_4820944 ) ( SUPPORTS ?auto_4820943 ?auto_4820938 ) ( POINTING ?auto_4820944 ?auto_4820942 ) ( not ( = ?auto_4820937 ?auto_4820942 ) ) ( HAVE_IMAGE ?auto_4820939 ?auto_4820936 ) ( not ( = ?auto_4820939 ?auto_4820942 ) ) ( not ( = ?auto_4820936 ?auto_4820938 ) ) ( CALIBRATION_TARGET ?auto_4820943 ?auto_4820942 ) ( POWER_AVAIL ?auto_4820944 ) ( HAVE_IMAGE ?auto_4820941 ?auto_4820940 ) ( not ( = ?auto_4820938 ?auto_4820940 ) ) ( not ( = ?auto_4820936 ?auto_4820940 ) ) ( not ( = ?auto_4820941 ?auto_4820942 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4820939 ?auto_4820936 ?auto_4820937 ?auto_4820938 )
      ( GET-3IMAGE-VERIFY ?auto_4820937 ?auto_4820938 ?auto_4820939 ?auto_4820936 ?auto_4820941 ?auto_4820940 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4824563 - DIRECTION
      ?auto_4824564 - MODE
    )
    :vars
    (
      ?auto_4824569 - DIRECTION
      ?auto_4824567 - INSTRUMENT
      ?auto_4824568 - SATELLITE
      ?auto_4824566 - DIRECTION
      ?auto_4824565 - MODE
      ?auto_4824570 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4824563 ?auto_4824569 ) ) ( ON_BOARD ?auto_4824567 ?auto_4824568 ) ( SUPPORTS ?auto_4824567 ?auto_4824564 ) ( not ( = ?auto_4824563 ?auto_4824566 ) ) ( HAVE_IMAGE ?auto_4824569 ?auto_4824565 ) ( not ( = ?auto_4824569 ?auto_4824566 ) ) ( not ( = ?auto_4824565 ?auto_4824564 ) ) ( CALIBRATION_TARGET ?auto_4824567 ?auto_4824566 ) ( POWER_AVAIL ?auto_4824568 ) ( POINTING ?auto_4824568 ?auto_4824570 ) ( not ( = ?auto_4824566 ?auto_4824570 ) ) ( not ( = ?auto_4824563 ?auto_4824570 ) ) ( not ( = ?auto_4824569 ?auto_4824570 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_4824568 ?auto_4824566 ?auto_4824570 )
      ( GET-2IMAGE ?auto_4824569 ?auto_4824565 ?auto_4824563 ?auto_4824564 )
      ( GET-1IMAGE-VERIFY ?auto_4824563 ?auto_4824564 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4824572 - DIRECTION
      ?auto_4824573 - MODE
      ?auto_4824574 - DIRECTION
      ?auto_4824571 - MODE
    )
    :vars
    (
      ?auto_4824578 - INSTRUMENT
      ?auto_4824576 - SATELLITE
      ?auto_4824577 - DIRECTION
      ?auto_4824575 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4824574 ?auto_4824572 ) ) ( ON_BOARD ?auto_4824578 ?auto_4824576 ) ( SUPPORTS ?auto_4824578 ?auto_4824571 ) ( not ( = ?auto_4824574 ?auto_4824577 ) ) ( HAVE_IMAGE ?auto_4824572 ?auto_4824573 ) ( not ( = ?auto_4824572 ?auto_4824577 ) ) ( not ( = ?auto_4824573 ?auto_4824571 ) ) ( CALIBRATION_TARGET ?auto_4824578 ?auto_4824577 ) ( POWER_AVAIL ?auto_4824576 ) ( POINTING ?auto_4824576 ?auto_4824575 ) ( not ( = ?auto_4824577 ?auto_4824575 ) ) ( not ( = ?auto_4824574 ?auto_4824575 ) ) ( not ( = ?auto_4824572 ?auto_4824575 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4824574 ?auto_4824571 )
      ( GET-2IMAGE-VERIFY ?auto_4824572 ?auto_4824573 ?auto_4824574 ?auto_4824571 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4824580 - DIRECTION
      ?auto_4824581 - MODE
      ?auto_4824582 - DIRECTION
      ?auto_4824579 - MODE
    )
    :vars
    (
      ?auto_4824584 - DIRECTION
      ?auto_4824585 - INSTRUMENT
      ?auto_4824586 - SATELLITE
      ?auto_4824583 - DIRECTION
      ?auto_4824587 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_4824582 ?auto_4824580 ) ) ( not ( = ?auto_4824582 ?auto_4824584 ) ) ( ON_BOARD ?auto_4824585 ?auto_4824586 ) ( SUPPORTS ?auto_4824585 ?auto_4824579 ) ( not ( = ?auto_4824582 ?auto_4824583 ) ) ( HAVE_IMAGE ?auto_4824584 ?auto_4824587 ) ( not ( = ?auto_4824584 ?auto_4824583 ) ) ( not ( = ?auto_4824587 ?auto_4824579 ) ) ( CALIBRATION_TARGET ?auto_4824585 ?auto_4824583 ) ( POWER_AVAIL ?auto_4824586 ) ( POINTING ?auto_4824586 ?auto_4824580 ) ( not ( = ?auto_4824583 ?auto_4824580 ) ) ( not ( = ?auto_4824584 ?auto_4824580 ) ) ( HAVE_IMAGE ?auto_4824580 ?auto_4824581 ) ( not ( = ?auto_4824581 ?auto_4824579 ) ) ( not ( = ?auto_4824581 ?auto_4824587 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4824584 ?auto_4824587 ?auto_4824582 ?auto_4824579 )
      ( GET-2IMAGE-VERIFY ?auto_4824580 ?auto_4824581 ?auto_4824582 ?auto_4824579 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4824589 - DIRECTION
      ?auto_4824590 - MODE
      ?auto_4824591 - DIRECTION
      ?auto_4824588 - MODE
    )
    :vars
    (
      ?auto_4824594 - INSTRUMENT
      ?auto_4824595 - SATELLITE
      ?auto_4824592 - DIRECTION
      ?auto_4824593 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4824591 ?auto_4824589 ) ) ( ON_BOARD ?auto_4824594 ?auto_4824595 ) ( SUPPORTS ?auto_4824594 ?auto_4824590 ) ( not ( = ?auto_4824589 ?auto_4824592 ) ) ( HAVE_IMAGE ?auto_4824591 ?auto_4824588 ) ( not ( = ?auto_4824591 ?auto_4824592 ) ) ( not ( = ?auto_4824588 ?auto_4824590 ) ) ( CALIBRATION_TARGET ?auto_4824594 ?auto_4824592 ) ( POWER_AVAIL ?auto_4824595 ) ( POINTING ?auto_4824595 ?auto_4824593 ) ( not ( = ?auto_4824592 ?auto_4824593 ) ) ( not ( = ?auto_4824589 ?auto_4824593 ) ) ( not ( = ?auto_4824591 ?auto_4824593 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4824591 ?auto_4824588 ?auto_4824589 ?auto_4824590 )
      ( GET-2IMAGE-VERIFY ?auto_4824589 ?auto_4824590 ?auto_4824591 ?auto_4824588 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4824597 - DIRECTION
      ?auto_4824598 - MODE
      ?auto_4824599 - DIRECTION
      ?auto_4824596 - MODE
    )
    :vars
    (
      ?auto_4824601 - DIRECTION
      ?auto_4824602 - INSTRUMENT
      ?auto_4824603 - SATELLITE
      ?auto_4824600 - DIRECTION
      ?auto_4824604 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_4824599 ?auto_4824597 ) ) ( not ( = ?auto_4824597 ?auto_4824601 ) ) ( ON_BOARD ?auto_4824602 ?auto_4824603 ) ( SUPPORTS ?auto_4824602 ?auto_4824598 ) ( not ( = ?auto_4824597 ?auto_4824600 ) ) ( HAVE_IMAGE ?auto_4824601 ?auto_4824604 ) ( not ( = ?auto_4824601 ?auto_4824600 ) ) ( not ( = ?auto_4824604 ?auto_4824598 ) ) ( CALIBRATION_TARGET ?auto_4824602 ?auto_4824600 ) ( POWER_AVAIL ?auto_4824603 ) ( POINTING ?auto_4824603 ?auto_4824599 ) ( not ( = ?auto_4824600 ?auto_4824599 ) ) ( not ( = ?auto_4824601 ?auto_4824599 ) ) ( HAVE_IMAGE ?auto_4824599 ?auto_4824596 ) ( not ( = ?auto_4824598 ?auto_4824596 ) ) ( not ( = ?auto_4824596 ?auto_4824604 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4824601 ?auto_4824604 ?auto_4824597 ?auto_4824598 )
      ( GET-2IMAGE-VERIFY ?auto_4824597 ?auto_4824598 ?auto_4824599 ?auto_4824596 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4824626 - DIRECTION
      ?auto_4824627 - MODE
      ?auto_4824628 - DIRECTION
      ?auto_4824625 - MODE
      ?auto_4824630 - DIRECTION
      ?auto_4824629 - MODE
    )
    :vars
    (
      ?auto_4824632 - INSTRUMENT
      ?auto_4824633 - SATELLITE
      ?auto_4824631 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4824628 ?auto_4824626 ) ) ( not ( = ?auto_4824630 ?auto_4824626 ) ) ( not ( = ?auto_4824630 ?auto_4824628 ) ) ( ON_BOARD ?auto_4824632 ?auto_4824633 ) ( SUPPORTS ?auto_4824632 ?auto_4824629 ) ( not ( = ?auto_4824630 ?auto_4824631 ) ) ( HAVE_IMAGE ?auto_4824626 ?auto_4824627 ) ( not ( = ?auto_4824626 ?auto_4824631 ) ) ( not ( = ?auto_4824627 ?auto_4824629 ) ) ( CALIBRATION_TARGET ?auto_4824632 ?auto_4824631 ) ( POWER_AVAIL ?auto_4824633 ) ( POINTING ?auto_4824633 ?auto_4824628 ) ( not ( = ?auto_4824631 ?auto_4824628 ) ) ( HAVE_IMAGE ?auto_4824628 ?auto_4824625 ) ( not ( = ?auto_4824627 ?auto_4824625 ) ) ( not ( = ?auto_4824625 ?auto_4824629 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4824626 ?auto_4824627 ?auto_4824630 ?auto_4824629 )
      ( GET-3IMAGE-VERIFY ?auto_4824626 ?auto_4824627 ?auto_4824628 ?auto_4824625 ?auto_4824630 ?auto_4824629 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4824645 - DIRECTION
      ?auto_4824646 - MODE
      ?auto_4824647 - DIRECTION
      ?auto_4824644 - MODE
      ?auto_4824649 - DIRECTION
      ?auto_4824648 - MODE
    )
    :vars
    (
      ?auto_4824651 - INSTRUMENT
      ?auto_4824652 - SATELLITE
      ?auto_4824650 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4824647 ?auto_4824645 ) ) ( not ( = ?auto_4824649 ?auto_4824645 ) ) ( not ( = ?auto_4824649 ?auto_4824647 ) ) ( ON_BOARD ?auto_4824651 ?auto_4824652 ) ( SUPPORTS ?auto_4824651 ?auto_4824644 ) ( not ( = ?auto_4824647 ?auto_4824650 ) ) ( HAVE_IMAGE ?auto_4824645 ?auto_4824646 ) ( not ( = ?auto_4824645 ?auto_4824650 ) ) ( not ( = ?auto_4824646 ?auto_4824644 ) ) ( CALIBRATION_TARGET ?auto_4824651 ?auto_4824650 ) ( POWER_AVAIL ?auto_4824652 ) ( POINTING ?auto_4824652 ?auto_4824649 ) ( not ( = ?auto_4824650 ?auto_4824649 ) ) ( HAVE_IMAGE ?auto_4824649 ?auto_4824648 ) ( not ( = ?auto_4824646 ?auto_4824648 ) ) ( not ( = ?auto_4824644 ?auto_4824648 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4824645 ?auto_4824646 ?auto_4824647 ?auto_4824644 )
      ( GET-3IMAGE-VERIFY ?auto_4824645 ?auto_4824646 ?auto_4824647 ?auto_4824644 ?auto_4824649 ?auto_4824648 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4824664 - DIRECTION
      ?auto_4824665 - MODE
      ?auto_4824666 - DIRECTION
      ?auto_4824663 - MODE
      ?auto_4824668 - DIRECTION
      ?auto_4824667 - MODE
    )
    :vars
    (
      ?auto_4824670 - INSTRUMENT
      ?auto_4824671 - SATELLITE
      ?auto_4824669 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4824666 ?auto_4824664 ) ) ( not ( = ?auto_4824668 ?auto_4824664 ) ) ( not ( = ?auto_4824668 ?auto_4824666 ) ) ( ON_BOARD ?auto_4824670 ?auto_4824671 ) ( SUPPORTS ?auto_4824670 ?auto_4824667 ) ( not ( = ?auto_4824668 ?auto_4824669 ) ) ( HAVE_IMAGE ?auto_4824666 ?auto_4824663 ) ( not ( = ?auto_4824666 ?auto_4824669 ) ) ( not ( = ?auto_4824663 ?auto_4824667 ) ) ( CALIBRATION_TARGET ?auto_4824670 ?auto_4824669 ) ( POWER_AVAIL ?auto_4824671 ) ( POINTING ?auto_4824671 ?auto_4824664 ) ( not ( = ?auto_4824669 ?auto_4824664 ) ) ( HAVE_IMAGE ?auto_4824664 ?auto_4824665 ) ( not ( = ?auto_4824665 ?auto_4824663 ) ) ( not ( = ?auto_4824665 ?auto_4824667 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4824666 ?auto_4824663 ?auto_4824668 ?auto_4824667 )
      ( GET-3IMAGE-VERIFY ?auto_4824664 ?auto_4824665 ?auto_4824666 ?auto_4824663 ?auto_4824668 ?auto_4824667 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4824684 - DIRECTION
      ?auto_4824685 - MODE
      ?auto_4824686 - DIRECTION
      ?auto_4824683 - MODE
      ?auto_4824688 - DIRECTION
      ?auto_4824687 - MODE
    )
    :vars
    (
      ?auto_4824690 - INSTRUMENT
      ?auto_4824691 - SATELLITE
      ?auto_4824689 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4824686 ?auto_4824684 ) ) ( not ( = ?auto_4824688 ?auto_4824684 ) ) ( not ( = ?auto_4824688 ?auto_4824686 ) ) ( ON_BOARD ?auto_4824690 ?auto_4824691 ) ( SUPPORTS ?auto_4824690 ?auto_4824683 ) ( not ( = ?auto_4824686 ?auto_4824689 ) ) ( HAVE_IMAGE ?auto_4824688 ?auto_4824687 ) ( not ( = ?auto_4824688 ?auto_4824689 ) ) ( not ( = ?auto_4824687 ?auto_4824683 ) ) ( CALIBRATION_TARGET ?auto_4824690 ?auto_4824689 ) ( POWER_AVAIL ?auto_4824691 ) ( POINTING ?auto_4824691 ?auto_4824684 ) ( not ( = ?auto_4824689 ?auto_4824684 ) ) ( HAVE_IMAGE ?auto_4824684 ?auto_4824685 ) ( not ( = ?auto_4824685 ?auto_4824683 ) ) ( not ( = ?auto_4824685 ?auto_4824687 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4824688 ?auto_4824687 ?auto_4824686 ?auto_4824683 )
      ( GET-3IMAGE-VERIFY ?auto_4824684 ?auto_4824685 ?auto_4824686 ?auto_4824683 ?auto_4824688 ?auto_4824687 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4824725 - DIRECTION
      ?auto_4824726 - MODE
      ?auto_4824727 - DIRECTION
      ?auto_4824724 - MODE
      ?auto_4824729 - DIRECTION
      ?auto_4824728 - MODE
    )
    :vars
    (
      ?auto_4824731 - INSTRUMENT
      ?auto_4824732 - SATELLITE
      ?auto_4824730 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4824727 ?auto_4824725 ) ) ( not ( = ?auto_4824729 ?auto_4824725 ) ) ( not ( = ?auto_4824729 ?auto_4824727 ) ) ( ON_BOARD ?auto_4824731 ?auto_4824732 ) ( SUPPORTS ?auto_4824731 ?auto_4824726 ) ( not ( = ?auto_4824725 ?auto_4824730 ) ) ( HAVE_IMAGE ?auto_4824727 ?auto_4824724 ) ( not ( = ?auto_4824727 ?auto_4824730 ) ) ( not ( = ?auto_4824724 ?auto_4824726 ) ) ( CALIBRATION_TARGET ?auto_4824731 ?auto_4824730 ) ( POWER_AVAIL ?auto_4824732 ) ( POINTING ?auto_4824732 ?auto_4824729 ) ( not ( = ?auto_4824730 ?auto_4824729 ) ) ( HAVE_IMAGE ?auto_4824729 ?auto_4824728 ) ( not ( = ?auto_4824726 ?auto_4824728 ) ) ( not ( = ?auto_4824724 ?auto_4824728 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4824727 ?auto_4824724 ?auto_4824725 ?auto_4824726 )
      ( GET-3IMAGE-VERIFY ?auto_4824725 ?auto_4824726 ?auto_4824727 ?auto_4824724 ?auto_4824729 ?auto_4824728 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4824744 - DIRECTION
      ?auto_4824745 - MODE
      ?auto_4824746 - DIRECTION
      ?auto_4824743 - MODE
      ?auto_4824748 - DIRECTION
      ?auto_4824747 - MODE
    )
    :vars
    (
      ?auto_4824750 - INSTRUMENT
      ?auto_4824751 - SATELLITE
      ?auto_4824749 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4824746 ?auto_4824744 ) ) ( not ( = ?auto_4824748 ?auto_4824744 ) ) ( not ( = ?auto_4824748 ?auto_4824746 ) ) ( ON_BOARD ?auto_4824750 ?auto_4824751 ) ( SUPPORTS ?auto_4824750 ?auto_4824745 ) ( not ( = ?auto_4824744 ?auto_4824749 ) ) ( HAVE_IMAGE ?auto_4824748 ?auto_4824747 ) ( not ( = ?auto_4824748 ?auto_4824749 ) ) ( not ( = ?auto_4824747 ?auto_4824745 ) ) ( CALIBRATION_TARGET ?auto_4824750 ?auto_4824749 ) ( POWER_AVAIL ?auto_4824751 ) ( POINTING ?auto_4824751 ?auto_4824746 ) ( not ( = ?auto_4824749 ?auto_4824746 ) ) ( HAVE_IMAGE ?auto_4824746 ?auto_4824743 ) ( not ( = ?auto_4824745 ?auto_4824743 ) ) ( not ( = ?auto_4824743 ?auto_4824747 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4824748 ?auto_4824747 ?auto_4824744 ?auto_4824745 )
      ( GET-3IMAGE-VERIFY ?auto_4824744 ?auto_4824745 ?auto_4824746 ?auto_4824743 ?auto_4824748 ?auto_4824747 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4828403 - DIRECTION
      ?auto_4828404 - MODE
    )
    :vars
    (
      ?auto_4828407 - DIRECTION
      ?auto_4828408 - INSTRUMENT
      ?auto_4828409 - SATELLITE
      ?auto_4828405 - DIRECTION
      ?auto_4828410 - MODE
      ?auto_4828406 - DIRECTION
      ?auto_4828411 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4828403 ?auto_4828407 ) ) ( ON_BOARD ?auto_4828408 ?auto_4828409 ) ( SUPPORTS ?auto_4828408 ?auto_4828404 ) ( not ( = ?auto_4828403 ?auto_4828405 ) ) ( HAVE_IMAGE ?auto_4828407 ?auto_4828410 ) ( not ( = ?auto_4828407 ?auto_4828405 ) ) ( not ( = ?auto_4828410 ?auto_4828404 ) ) ( CALIBRATION_TARGET ?auto_4828408 ?auto_4828405 ) ( POINTING ?auto_4828409 ?auto_4828406 ) ( not ( = ?auto_4828405 ?auto_4828406 ) ) ( not ( = ?auto_4828403 ?auto_4828406 ) ) ( not ( = ?auto_4828407 ?auto_4828406 ) ) ( ON_BOARD ?auto_4828411 ?auto_4828409 ) ( POWER_ON ?auto_4828411 ) ( not ( = ?auto_4828408 ?auto_4828411 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_4828411 ?auto_4828409 )
      ( GET-2IMAGE ?auto_4828407 ?auto_4828410 ?auto_4828403 ?auto_4828404 )
      ( GET-1IMAGE-VERIFY ?auto_4828403 ?auto_4828404 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4828413 - DIRECTION
      ?auto_4828414 - MODE
      ?auto_4828415 - DIRECTION
      ?auto_4828412 - MODE
    )
    :vars
    (
      ?auto_4828417 - INSTRUMENT
      ?auto_4828420 - SATELLITE
      ?auto_4828418 - DIRECTION
      ?auto_4828419 - DIRECTION
      ?auto_4828416 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4828415 ?auto_4828413 ) ) ( ON_BOARD ?auto_4828417 ?auto_4828420 ) ( SUPPORTS ?auto_4828417 ?auto_4828412 ) ( not ( = ?auto_4828415 ?auto_4828418 ) ) ( HAVE_IMAGE ?auto_4828413 ?auto_4828414 ) ( not ( = ?auto_4828413 ?auto_4828418 ) ) ( not ( = ?auto_4828414 ?auto_4828412 ) ) ( CALIBRATION_TARGET ?auto_4828417 ?auto_4828418 ) ( POINTING ?auto_4828420 ?auto_4828419 ) ( not ( = ?auto_4828418 ?auto_4828419 ) ) ( not ( = ?auto_4828415 ?auto_4828419 ) ) ( not ( = ?auto_4828413 ?auto_4828419 ) ) ( ON_BOARD ?auto_4828416 ?auto_4828420 ) ( POWER_ON ?auto_4828416 ) ( not ( = ?auto_4828417 ?auto_4828416 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4828415 ?auto_4828412 )
      ( GET-2IMAGE-VERIFY ?auto_4828413 ?auto_4828414 ?auto_4828415 ?auto_4828412 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4828422 - DIRECTION
      ?auto_4828423 - MODE
      ?auto_4828424 - DIRECTION
      ?auto_4828421 - MODE
    )
    :vars
    (
      ?auto_4828430 - DIRECTION
      ?auto_4828426 - INSTRUMENT
      ?auto_4828428 - SATELLITE
      ?auto_4828427 - DIRECTION
      ?auto_4828425 - MODE
      ?auto_4828429 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4828424 ?auto_4828422 ) ) ( not ( = ?auto_4828424 ?auto_4828430 ) ) ( ON_BOARD ?auto_4828426 ?auto_4828428 ) ( SUPPORTS ?auto_4828426 ?auto_4828421 ) ( not ( = ?auto_4828424 ?auto_4828427 ) ) ( HAVE_IMAGE ?auto_4828430 ?auto_4828425 ) ( not ( = ?auto_4828430 ?auto_4828427 ) ) ( not ( = ?auto_4828425 ?auto_4828421 ) ) ( CALIBRATION_TARGET ?auto_4828426 ?auto_4828427 ) ( POINTING ?auto_4828428 ?auto_4828422 ) ( not ( = ?auto_4828427 ?auto_4828422 ) ) ( not ( = ?auto_4828430 ?auto_4828422 ) ) ( ON_BOARD ?auto_4828429 ?auto_4828428 ) ( POWER_ON ?auto_4828429 ) ( not ( = ?auto_4828426 ?auto_4828429 ) ) ( HAVE_IMAGE ?auto_4828422 ?auto_4828423 ) ( not ( = ?auto_4828423 ?auto_4828421 ) ) ( not ( = ?auto_4828423 ?auto_4828425 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4828430 ?auto_4828425 ?auto_4828424 ?auto_4828421 )
      ( GET-2IMAGE-VERIFY ?auto_4828422 ?auto_4828423 ?auto_4828424 ?auto_4828421 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4828432 - DIRECTION
      ?auto_4828433 - MODE
      ?auto_4828434 - DIRECTION
      ?auto_4828431 - MODE
    )
    :vars
    (
      ?auto_4828436 - INSTRUMENT
      ?auto_4828438 - SATELLITE
      ?auto_4828437 - DIRECTION
      ?auto_4828435 - DIRECTION
      ?auto_4828439 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4828434 ?auto_4828432 ) ) ( ON_BOARD ?auto_4828436 ?auto_4828438 ) ( SUPPORTS ?auto_4828436 ?auto_4828433 ) ( not ( = ?auto_4828432 ?auto_4828437 ) ) ( HAVE_IMAGE ?auto_4828434 ?auto_4828431 ) ( not ( = ?auto_4828434 ?auto_4828437 ) ) ( not ( = ?auto_4828431 ?auto_4828433 ) ) ( CALIBRATION_TARGET ?auto_4828436 ?auto_4828437 ) ( POINTING ?auto_4828438 ?auto_4828435 ) ( not ( = ?auto_4828437 ?auto_4828435 ) ) ( not ( = ?auto_4828432 ?auto_4828435 ) ) ( not ( = ?auto_4828434 ?auto_4828435 ) ) ( ON_BOARD ?auto_4828439 ?auto_4828438 ) ( POWER_ON ?auto_4828439 ) ( not ( = ?auto_4828436 ?auto_4828439 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4828434 ?auto_4828431 ?auto_4828432 ?auto_4828433 )
      ( GET-2IMAGE-VERIFY ?auto_4828432 ?auto_4828433 ?auto_4828434 ?auto_4828431 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4828441 - DIRECTION
      ?auto_4828442 - MODE
      ?auto_4828443 - DIRECTION
      ?auto_4828440 - MODE
    )
    :vars
    (
      ?auto_4828449 - DIRECTION
      ?auto_4828445 - INSTRUMENT
      ?auto_4828447 - SATELLITE
      ?auto_4828446 - DIRECTION
      ?auto_4828444 - MODE
      ?auto_4828448 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4828443 ?auto_4828441 ) ) ( not ( = ?auto_4828441 ?auto_4828449 ) ) ( ON_BOARD ?auto_4828445 ?auto_4828447 ) ( SUPPORTS ?auto_4828445 ?auto_4828442 ) ( not ( = ?auto_4828441 ?auto_4828446 ) ) ( HAVE_IMAGE ?auto_4828449 ?auto_4828444 ) ( not ( = ?auto_4828449 ?auto_4828446 ) ) ( not ( = ?auto_4828444 ?auto_4828442 ) ) ( CALIBRATION_TARGET ?auto_4828445 ?auto_4828446 ) ( POINTING ?auto_4828447 ?auto_4828443 ) ( not ( = ?auto_4828446 ?auto_4828443 ) ) ( not ( = ?auto_4828449 ?auto_4828443 ) ) ( ON_BOARD ?auto_4828448 ?auto_4828447 ) ( POWER_ON ?auto_4828448 ) ( not ( = ?auto_4828445 ?auto_4828448 ) ) ( HAVE_IMAGE ?auto_4828443 ?auto_4828440 ) ( not ( = ?auto_4828442 ?auto_4828440 ) ) ( not ( = ?auto_4828440 ?auto_4828444 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4828449 ?auto_4828444 ?auto_4828441 ?auto_4828442 )
      ( GET-2IMAGE-VERIFY ?auto_4828441 ?auto_4828442 ?auto_4828443 ?auto_4828440 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4828473 - DIRECTION
      ?auto_4828474 - MODE
      ?auto_4828475 - DIRECTION
      ?auto_4828472 - MODE
      ?auto_4828477 - DIRECTION
      ?auto_4828476 - MODE
    )
    :vars
    (
      ?auto_4828478 - INSTRUMENT
      ?auto_4828480 - SATELLITE
      ?auto_4828479 - DIRECTION
      ?auto_4828481 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4828475 ?auto_4828473 ) ) ( not ( = ?auto_4828477 ?auto_4828473 ) ) ( not ( = ?auto_4828477 ?auto_4828475 ) ) ( ON_BOARD ?auto_4828478 ?auto_4828480 ) ( SUPPORTS ?auto_4828478 ?auto_4828476 ) ( not ( = ?auto_4828477 ?auto_4828479 ) ) ( HAVE_IMAGE ?auto_4828473 ?auto_4828474 ) ( not ( = ?auto_4828473 ?auto_4828479 ) ) ( not ( = ?auto_4828474 ?auto_4828476 ) ) ( CALIBRATION_TARGET ?auto_4828478 ?auto_4828479 ) ( POINTING ?auto_4828480 ?auto_4828475 ) ( not ( = ?auto_4828479 ?auto_4828475 ) ) ( ON_BOARD ?auto_4828481 ?auto_4828480 ) ( POWER_ON ?auto_4828481 ) ( not ( = ?auto_4828478 ?auto_4828481 ) ) ( HAVE_IMAGE ?auto_4828475 ?auto_4828472 ) ( not ( = ?auto_4828474 ?auto_4828472 ) ) ( not ( = ?auto_4828472 ?auto_4828476 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4828473 ?auto_4828474 ?auto_4828477 ?auto_4828476 )
      ( GET-3IMAGE-VERIFY ?auto_4828473 ?auto_4828474 ?auto_4828475 ?auto_4828472 ?auto_4828477 ?auto_4828476 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4828494 - DIRECTION
      ?auto_4828495 - MODE
      ?auto_4828496 - DIRECTION
      ?auto_4828493 - MODE
      ?auto_4828498 - DIRECTION
      ?auto_4828497 - MODE
    )
    :vars
    (
      ?auto_4828499 - INSTRUMENT
      ?auto_4828501 - SATELLITE
      ?auto_4828500 - DIRECTION
      ?auto_4828502 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4828496 ?auto_4828494 ) ) ( not ( = ?auto_4828498 ?auto_4828494 ) ) ( not ( = ?auto_4828498 ?auto_4828496 ) ) ( ON_BOARD ?auto_4828499 ?auto_4828501 ) ( SUPPORTS ?auto_4828499 ?auto_4828493 ) ( not ( = ?auto_4828496 ?auto_4828500 ) ) ( HAVE_IMAGE ?auto_4828494 ?auto_4828495 ) ( not ( = ?auto_4828494 ?auto_4828500 ) ) ( not ( = ?auto_4828495 ?auto_4828493 ) ) ( CALIBRATION_TARGET ?auto_4828499 ?auto_4828500 ) ( POINTING ?auto_4828501 ?auto_4828498 ) ( not ( = ?auto_4828500 ?auto_4828498 ) ) ( ON_BOARD ?auto_4828502 ?auto_4828501 ) ( POWER_ON ?auto_4828502 ) ( not ( = ?auto_4828499 ?auto_4828502 ) ) ( HAVE_IMAGE ?auto_4828498 ?auto_4828497 ) ( not ( = ?auto_4828495 ?auto_4828497 ) ) ( not ( = ?auto_4828493 ?auto_4828497 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4828494 ?auto_4828495 ?auto_4828496 ?auto_4828493 )
      ( GET-3IMAGE-VERIFY ?auto_4828494 ?auto_4828495 ?auto_4828496 ?auto_4828493 ?auto_4828498 ?auto_4828497 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4828515 - DIRECTION
      ?auto_4828516 - MODE
      ?auto_4828517 - DIRECTION
      ?auto_4828514 - MODE
      ?auto_4828519 - DIRECTION
      ?auto_4828518 - MODE
    )
    :vars
    (
      ?auto_4828520 - INSTRUMENT
      ?auto_4828522 - SATELLITE
      ?auto_4828521 - DIRECTION
      ?auto_4828523 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4828517 ?auto_4828515 ) ) ( not ( = ?auto_4828519 ?auto_4828515 ) ) ( not ( = ?auto_4828519 ?auto_4828517 ) ) ( ON_BOARD ?auto_4828520 ?auto_4828522 ) ( SUPPORTS ?auto_4828520 ?auto_4828518 ) ( not ( = ?auto_4828519 ?auto_4828521 ) ) ( HAVE_IMAGE ?auto_4828517 ?auto_4828514 ) ( not ( = ?auto_4828517 ?auto_4828521 ) ) ( not ( = ?auto_4828514 ?auto_4828518 ) ) ( CALIBRATION_TARGET ?auto_4828520 ?auto_4828521 ) ( POINTING ?auto_4828522 ?auto_4828515 ) ( not ( = ?auto_4828521 ?auto_4828515 ) ) ( ON_BOARD ?auto_4828523 ?auto_4828522 ) ( POWER_ON ?auto_4828523 ) ( not ( = ?auto_4828520 ?auto_4828523 ) ) ( HAVE_IMAGE ?auto_4828515 ?auto_4828516 ) ( not ( = ?auto_4828516 ?auto_4828514 ) ) ( not ( = ?auto_4828516 ?auto_4828518 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4828517 ?auto_4828514 ?auto_4828519 ?auto_4828518 )
      ( GET-3IMAGE-VERIFY ?auto_4828515 ?auto_4828516 ?auto_4828517 ?auto_4828514 ?auto_4828519 ?auto_4828518 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4828537 - DIRECTION
      ?auto_4828538 - MODE
      ?auto_4828539 - DIRECTION
      ?auto_4828536 - MODE
      ?auto_4828541 - DIRECTION
      ?auto_4828540 - MODE
    )
    :vars
    (
      ?auto_4828542 - INSTRUMENT
      ?auto_4828544 - SATELLITE
      ?auto_4828543 - DIRECTION
      ?auto_4828545 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4828539 ?auto_4828537 ) ) ( not ( = ?auto_4828541 ?auto_4828537 ) ) ( not ( = ?auto_4828541 ?auto_4828539 ) ) ( ON_BOARD ?auto_4828542 ?auto_4828544 ) ( SUPPORTS ?auto_4828542 ?auto_4828536 ) ( not ( = ?auto_4828539 ?auto_4828543 ) ) ( HAVE_IMAGE ?auto_4828541 ?auto_4828540 ) ( not ( = ?auto_4828541 ?auto_4828543 ) ) ( not ( = ?auto_4828540 ?auto_4828536 ) ) ( CALIBRATION_TARGET ?auto_4828542 ?auto_4828543 ) ( POINTING ?auto_4828544 ?auto_4828537 ) ( not ( = ?auto_4828543 ?auto_4828537 ) ) ( ON_BOARD ?auto_4828545 ?auto_4828544 ) ( POWER_ON ?auto_4828545 ) ( not ( = ?auto_4828542 ?auto_4828545 ) ) ( HAVE_IMAGE ?auto_4828537 ?auto_4828538 ) ( not ( = ?auto_4828538 ?auto_4828536 ) ) ( not ( = ?auto_4828538 ?auto_4828540 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4828541 ?auto_4828540 ?auto_4828539 ?auto_4828536 )
      ( GET-3IMAGE-VERIFY ?auto_4828537 ?auto_4828538 ?auto_4828539 ?auto_4828536 ?auto_4828541 ?auto_4828540 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4828582 - DIRECTION
      ?auto_4828583 - MODE
      ?auto_4828584 - DIRECTION
      ?auto_4828581 - MODE
      ?auto_4828586 - DIRECTION
      ?auto_4828585 - MODE
    )
    :vars
    (
      ?auto_4828587 - INSTRUMENT
      ?auto_4828589 - SATELLITE
      ?auto_4828588 - DIRECTION
      ?auto_4828590 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4828584 ?auto_4828582 ) ) ( not ( = ?auto_4828586 ?auto_4828582 ) ) ( not ( = ?auto_4828586 ?auto_4828584 ) ) ( ON_BOARD ?auto_4828587 ?auto_4828589 ) ( SUPPORTS ?auto_4828587 ?auto_4828583 ) ( not ( = ?auto_4828582 ?auto_4828588 ) ) ( HAVE_IMAGE ?auto_4828584 ?auto_4828581 ) ( not ( = ?auto_4828584 ?auto_4828588 ) ) ( not ( = ?auto_4828581 ?auto_4828583 ) ) ( CALIBRATION_TARGET ?auto_4828587 ?auto_4828588 ) ( POINTING ?auto_4828589 ?auto_4828586 ) ( not ( = ?auto_4828588 ?auto_4828586 ) ) ( ON_BOARD ?auto_4828590 ?auto_4828589 ) ( POWER_ON ?auto_4828590 ) ( not ( = ?auto_4828587 ?auto_4828590 ) ) ( HAVE_IMAGE ?auto_4828586 ?auto_4828585 ) ( not ( = ?auto_4828583 ?auto_4828585 ) ) ( not ( = ?auto_4828581 ?auto_4828585 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4828584 ?auto_4828581 ?auto_4828582 ?auto_4828583 )
      ( GET-3IMAGE-VERIFY ?auto_4828582 ?auto_4828583 ?auto_4828584 ?auto_4828581 ?auto_4828586 ?auto_4828585 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4828603 - DIRECTION
      ?auto_4828604 - MODE
      ?auto_4828605 - DIRECTION
      ?auto_4828602 - MODE
      ?auto_4828607 - DIRECTION
      ?auto_4828606 - MODE
    )
    :vars
    (
      ?auto_4828608 - INSTRUMENT
      ?auto_4828610 - SATELLITE
      ?auto_4828609 - DIRECTION
      ?auto_4828611 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4828605 ?auto_4828603 ) ) ( not ( = ?auto_4828607 ?auto_4828603 ) ) ( not ( = ?auto_4828607 ?auto_4828605 ) ) ( ON_BOARD ?auto_4828608 ?auto_4828610 ) ( SUPPORTS ?auto_4828608 ?auto_4828604 ) ( not ( = ?auto_4828603 ?auto_4828609 ) ) ( HAVE_IMAGE ?auto_4828607 ?auto_4828606 ) ( not ( = ?auto_4828607 ?auto_4828609 ) ) ( not ( = ?auto_4828606 ?auto_4828604 ) ) ( CALIBRATION_TARGET ?auto_4828608 ?auto_4828609 ) ( POINTING ?auto_4828610 ?auto_4828605 ) ( not ( = ?auto_4828609 ?auto_4828605 ) ) ( ON_BOARD ?auto_4828611 ?auto_4828610 ) ( POWER_ON ?auto_4828611 ) ( not ( = ?auto_4828608 ?auto_4828611 ) ) ( HAVE_IMAGE ?auto_4828605 ?auto_4828602 ) ( not ( = ?auto_4828604 ?auto_4828602 ) ) ( not ( = ?auto_4828602 ?auto_4828606 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4828607 ?auto_4828606 ?auto_4828603 ?auto_4828604 )
      ( GET-3IMAGE-VERIFY ?auto_4828603 ?auto_4828604 ?auto_4828605 ?auto_4828602 ?auto_4828607 ?auto_4828606 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4836668 - DIRECTION
      ?auto_4836669 - MODE
    )
    :vars
    (
      ?auto_4836676 - DIRECTION
      ?auto_4836671 - INSTRUMENT
      ?auto_4836672 - SATELLITE
      ?auto_4836674 - DIRECTION
      ?auto_4836670 - MODE
      ?auto_4836673 - DIRECTION
      ?auto_4836675 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4836668 ?auto_4836676 ) ) ( ON_BOARD ?auto_4836671 ?auto_4836672 ) ( SUPPORTS ?auto_4836671 ?auto_4836669 ) ( not ( = ?auto_4836668 ?auto_4836674 ) ) ( HAVE_IMAGE ?auto_4836676 ?auto_4836670 ) ( not ( = ?auto_4836676 ?auto_4836674 ) ) ( not ( = ?auto_4836670 ?auto_4836669 ) ) ( CALIBRATION_TARGET ?auto_4836671 ?auto_4836674 ) ( not ( = ?auto_4836674 ?auto_4836673 ) ) ( not ( = ?auto_4836668 ?auto_4836673 ) ) ( not ( = ?auto_4836676 ?auto_4836673 ) ) ( ON_BOARD ?auto_4836675 ?auto_4836672 ) ( POWER_ON ?auto_4836675 ) ( not ( = ?auto_4836671 ?auto_4836675 ) ) ( POINTING ?auto_4836672 ?auto_4836674 ) )
    :subtasks
    ( ( !TURN_TO ?auto_4836672 ?auto_4836673 ?auto_4836674 )
      ( GET-2IMAGE ?auto_4836676 ?auto_4836670 ?auto_4836668 ?auto_4836669 )
      ( GET-1IMAGE-VERIFY ?auto_4836668 ?auto_4836669 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4836678 - DIRECTION
      ?auto_4836679 - MODE
      ?auto_4836680 - DIRECTION
      ?auto_4836677 - MODE
    )
    :vars
    (
      ?auto_4836683 - INSTRUMENT
      ?auto_4836682 - SATELLITE
      ?auto_4836684 - DIRECTION
      ?auto_4836685 - DIRECTION
      ?auto_4836681 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4836680 ?auto_4836678 ) ) ( ON_BOARD ?auto_4836683 ?auto_4836682 ) ( SUPPORTS ?auto_4836683 ?auto_4836677 ) ( not ( = ?auto_4836680 ?auto_4836684 ) ) ( HAVE_IMAGE ?auto_4836678 ?auto_4836679 ) ( not ( = ?auto_4836678 ?auto_4836684 ) ) ( not ( = ?auto_4836679 ?auto_4836677 ) ) ( CALIBRATION_TARGET ?auto_4836683 ?auto_4836684 ) ( not ( = ?auto_4836684 ?auto_4836685 ) ) ( not ( = ?auto_4836680 ?auto_4836685 ) ) ( not ( = ?auto_4836678 ?auto_4836685 ) ) ( ON_BOARD ?auto_4836681 ?auto_4836682 ) ( POWER_ON ?auto_4836681 ) ( not ( = ?auto_4836683 ?auto_4836681 ) ) ( POINTING ?auto_4836682 ?auto_4836684 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4836680 ?auto_4836677 )
      ( GET-2IMAGE-VERIFY ?auto_4836678 ?auto_4836679 ?auto_4836680 ?auto_4836677 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4836697 - DIRECTION
      ?auto_4836698 - MODE
      ?auto_4836699 - DIRECTION
      ?auto_4836696 - MODE
    )
    :vars
    (
      ?auto_4836700 - INSTRUMENT
      ?auto_4836702 - SATELLITE
      ?auto_4836704 - DIRECTION
      ?auto_4836703 - DIRECTION
      ?auto_4836701 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4836699 ?auto_4836697 ) ) ( ON_BOARD ?auto_4836700 ?auto_4836702 ) ( SUPPORTS ?auto_4836700 ?auto_4836698 ) ( not ( = ?auto_4836697 ?auto_4836704 ) ) ( HAVE_IMAGE ?auto_4836699 ?auto_4836696 ) ( not ( = ?auto_4836699 ?auto_4836704 ) ) ( not ( = ?auto_4836696 ?auto_4836698 ) ) ( CALIBRATION_TARGET ?auto_4836700 ?auto_4836704 ) ( not ( = ?auto_4836704 ?auto_4836703 ) ) ( not ( = ?auto_4836697 ?auto_4836703 ) ) ( not ( = ?auto_4836699 ?auto_4836703 ) ) ( ON_BOARD ?auto_4836701 ?auto_4836702 ) ( POWER_ON ?auto_4836701 ) ( not ( = ?auto_4836700 ?auto_4836701 ) ) ( POINTING ?auto_4836702 ?auto_4836704 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4836699 ?auto_4836696 ?auto_4836697 ?auto_4836698 )
      ( GET-2IMAGE-VERIFY ?auto_4836697 ?auto_4836698 ?auto_4836699 ?auto_4836696 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4886275 - DIRECTION
      ?auto_4886276 - MODE
      ?auto_4886277 - DIRECTION
      ?auto_4886274 - MODE
      ?auto_4886279 - DIRECTION
      ?auto_4886278 - MODE
      ?auto_4886280 - DIRECTION
      ?auto_4886281 - MODE
    )
    :vars
    (
      ?auto_4886282 - INSTRUMENT
      ?auto_4886283 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_4886277 ?auto_4886275 ) ) ( not ( = ?auto_4886279 ?auto_4886275 ) ) ( not ( = ?auto_4886279 ?auto_4886277 ) ) ( not ( = ?auto_4886280 ?auto_4886275 ) ) ( not ( = ?auto_4886280 ?auto_4886277 ) ) ( not ( = ?auto_4886280 ?auto_4886279 ) ) ( CALIBRATED ?auto_4886282 ) ( ON_BOARD ?auto_4886282 ?auto_4886283 ) ( SUPPORTS ?auto_4886282 ?auto_4886281 ) ( POWER_ON ?auto_4886282 ) ( POINTING ?auto_4886283 ?auto_4886280 ) ( HAVE_IMAGE ?auto_4886275 ?auto_4886276 ) ( HAVE_IMAGE ?auto_4886277 ?auto_4886274 ) ( HAVE_IMAGE ?auto_4886279 ?auto_4886278 ) ( not ( = ?auto_4886276 ?auto_4886274 ) ) ( not ( = ?auto_4886276 ?auto_4886278 ) ) ( not ( = ?auto_4886276 ?auto_4886281 ) ) ( not ( = ?auto_4886274 ?auto_4886278 ) ) ( not ( = ?auto_4886274 ?auto_4886281 ) ) ( not ( = ?auto_4886278 ?auto_4886281 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4886280 ?auto_4886281 )
      ( GET-4IMAGE-VERIFY ?auto_4886275 ?auto_4886276 ?auto_4886277 ?auto_4886274 ?auto_4886279 ?auto_4886278 ?auto_4886280 ?auto_4886281 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4886305 - DIRECTION
      ?auto_4886306 - MODE
      ?auto_4886307 - DIRECTION
      ?auto_4886304 - MODE
      ?auto_4886309 - DIRECTION
      ?auto_4886308 - MODE
      ?auto_4886310 - DIRECTION
      ?auto_4886311 - MODE
    )
    :vars
    (
      ?auto_4886312 - INSTRUMENT
      ?auto_4886313 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_4886307 ?auto_4886305 ) ) ( not ( = ?auto_4886309 ?auto_4886305 ) ) ( not ( = ?auto_4886309 ?auto_4886307 ) ) ( not ( = ?auto_4886310 ?auto_4886305 ) ) ( not ( = ?auto_4886310 ?auto_4886307 ) ) ( not ( = ?auto_4886310 ?auto_4886309 ) ) ( CALIBRATED ?auto_4886312 ) ( ON_BOARD ?auto_4886312 ?auto_4886313 ) ( SUPPORTS ?auto_4886312 ?auto_4886308 ) ( POWER_ON ?auto_4886312 ) ( POINTING ?auto_4886313 ?auto_4886309 ) ( HAVE_IMAGE ?auto_4886305 ?auto_4886306 ) ( HAVE_IMAGE ?auto_4886307 ?auto_4886304 ) ( HAVE_IMAGE ?auto_4886310 ?auto_4886311 ) ( not ( = ?auto_4886306 ?auto_4886304 ) ) ( not ( = ?auto_4886306 ?auto_4886308 ) ) ( not ( = ?auto_4886306 ?auto_4886311 ) ) ( not ( = ?auto_4886304 ?auto_4886308 ) ) ( not ( = ?auto_4886304 ?auto_4886311 ) ) ( not ( = ?auto_4886308 ?auto_4886311 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4886309 ?auto_4886308 )
      ( GET-4IMAGE-VERIFY ?auto_4886305 ?auto_4886306 ?auto_4886307 ?auto_4886304 ?auto_4886309 ?auto_4886308 ?auto_4886310 ?auto_4886311 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4886451 - DIRECTION
      ?auto_4886452 - MODE
      ?auto_4886453 - DIRECTION
      ?auto_4886450 - MODE
      ?auto_4886455 - DIRECTION
      ?auto_4886454 - MODE
      ?auto_4886456 - DIRECTION
      ?auto_4886457 - MODE
    )
    :vars
    (
      ?auto_4886458 - INSTRUMENT
      ?auto_4886459 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_4886453 ?auto_4886451 ) ) ( not ( = ?auto_4886455 ?auto_4886451 ) ) ( not ( = ?auto_4886455 ?auto_4886453 ) ) ( not ( = ?auto_4886456 ?auto_4886451 ) ) ( not ( = ?auto_4886456 ?auto_4886453 ) ) ( not ( = ?auto_4886456 ?auto_4886455 ) ) ( CALIBRATED ?auto_4886458 ) ( ON_BOARD ?auto_4886458 ?auto_4886459 ) ( SUPPORTS ?auto_4886458 ?auto_4886450 ) ( POWER_ON ?auto_4886458 ) ( POINTING ?auto_4886459 ?auto_4886453 ) ( HAVE_IMAGE ?auto_4886451 ?auto_4886452 ) ( HAVE_IMAGE ?auto_4886455 ?auto_4886454 ) ( HAVE_IMAGE ?auto_4886456 ?auto_4886457 ) ( not ( = ?auto_4886452 ?auto_4886450 ) ) ( not ( = ?auto_4886452 ?auto_4886454 ) ) ( not ( = ?auto_4886452 ?auto_4886457 ) ) ( not ( = ?auto_4886450 ?auto_4886454 ) ) ( not ( = ?auto_4886450 ?auto_4886457 ) ) ( not ( = ?auto_4886454 ?auto_4886457 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4886453 ?auto_4886450 )
      ( GET-4IMAGE-VERIFY ?auto_4886451 ?auto_4886452 ?auto_4886453 ?auto_4886450 ?auto_4886455 ?auto_4886454 ?auto_4886456 ?auto_4886457 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4887325 - DIRECTION
      ?auto_4887326 - MODE
      ?auto_4887327 - DIRECTION
      ?auto_4887324 - MODE
      ?auto_4887329 - DIRECTION
      ?auto_4887328 - MODE
      ?auto_4887330 - DIRECTION
      ?auto_4887331 - MODE
    )
    :vars
    (
      ?auto_4887332 - INSTRUMENT
      ?auto_4887333 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_4887327 ?auto_4887325 ) ) ( not ( = ?auto_4887329 ?auto_4887325 ) ) ( not ( = ?auto_4887329 ?auto_4887327 ) ) ( not ( = ?auto_4887330 ?auto_4887325 ) ) ( not ( = ?auto_4887330 ?auto_4887327 ) ) ( not ( = ?auto_4887330 ?auto_4887329 ) ) ( CALIBRATED ?auto_4887332 ) ( ON_BOARD ?auto_4887332 ?auto_4887333 ) ( SUPPORTS ?auto_4887332 ?auto_4887326 ) ( POWER_ON ?auto_4887332 ) ( POINTING ?auto_4887333 ?auto_4887325 ) ( HAVE_IMAGE ?auto_4887327 ?auto_4887324 ) ( HAVE_IMAGE ?auto_4887329 ?auto_4887328 ) ( HAVE_IMAGE ?auto_4887330 ?auto_4887331 ) ( not ( = ?auto_4887326 ?auto_4887324 ) ) ( not ( = ?auto_4887326 ?auto_4887328 ) ) ( not ( = ?auto_4887326 ?auto_4887331 ) ) ( not ( = ?auto_4887324 ?auto_4887328 ) ) ( not ( = ?auto_4887324 ?auto_4887331 ) ) ( not ( = ?auto_4887328 ?auto_4887331 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4887325 ?auto_4887326 )
      ( GET-4IMAGE-VERIFY ?auto_4887325 ?auto_4887326 ?auto_4887327 ?auto_4887324 ?auto_4887329 ?auto_4887328 ?auto_4887330 ?auto_4887331 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4897724 - DIRECTION
      ?auto_4897725 - MODE
      ?auto_4897726 - DIRECTION
      ?auto_4897723 - MODE
      ?auto_4897728 - DIRECTION
      ?auto_4897727 - MODE
      ?auto_4897729 - DIRECTION
      ?auto_4897730 - MODE
    )
    :vars
    (
      ?auto_4897732 - INSTRUMENT
      ?auto_4897733 - SATELLITE
      ?auto_4897731 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4897726 ?auto_4897724 ) ) ( not ( = ?auto_4897728 ?auto_4897724 ) ) ( not ( = ?auto_4897728 ?auto_4897726 ) ) ( not ( = ?auto_4897729 ?auto_4897724 ) ) ( not ( = ?auto_4897729 ?auto_4897726 ) ) ( not ( = ?auto_4897729 ?auto_4897728 ) ) ( CALIBRATED ?auto_4897732 ) ( ON_BOARD ?auto_4897732 ?auto_4897733 ) ( SUPPORTS ?auto_4897732 ?auto_4897730 ) ( POWER_ON ?auto_4897732 ) ( POINTING ?auto_4897733 ?auto_4897731 ) ( not ( = ?auto_4897729 ?auto_4897731 ) ) ( HAVE_IMAGE ?auto_4897724 ?auto_4897725 ) ( not ( = ?auto_4897724 ?auto_4897731 ) ) ( not ( = ?auto_4897725 ?auto_4897730 ) ) ( HAVE_IMAGE ?auto_4897726 ?auto_4897723 ) ( HAVE_IMAGE ?auto_4897728 ?auto_4897727 ) ( not ( = ?auto_4897725 ?auto_4897723 ) ) ( not ( = ?auto_4897725 ?auto_4897727 ) ) ( not ( = ?auto_4897726 ?auto_4897731 ) ) ( not ( = ?auto_4897723 ?auto_4897727 ) ) ( not ( = ?auto_4897723 ?auto_4897730 ) ) ( not ( = ?auto_4897728 ?auto_4897731 ) ) ( not ( = ?auto_4897727 ?auto_4897730 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4897724 ?auto_4897725 ?auto_4897729 ?auto_4897730 )
      ( GET-4IMAGE-VERIFY ?auto_4897724 ?auto_4897725 ?auto_4897726 ?auto_4897723 ?auto_4897728 ?auto_4897727 ?auto_4897729 ?auto_4897730 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4897757 - DIRECTION
      ?auto_4897758 - MODE
      ?auto_4897759 - DIRECTION
      ?auto_4897756 - MODE
      ?auto_4897761 - DIRECTION
      ?auto_4897760 - MODE
      ?auto_4897762 - DIRECTION
      ?auto_4897763 - MODE
    )
    :vars
    (
      ?auto_4897765 - INSTRUMENT
      ?auto_4897766 - SATELLITE
      ?auto_4897764 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4897759 ?auto_4897757 ) ) ( not ( = ?auto_4897761 ?auto_4897757 ) ) ( not ( = ?auto_4897761 ?auto_4897759 ) ) ( not ( = ?auto_4897762 ?auto_4897757 ) ) ( not ( = ?auto_4897762 ?auto_4897759 ) ) ( not ( = ?auto_4897762 ?auto_4897761 ) ) ( CALIBRATED ?auto_4897765 ) ( ON_BOARD ?auto_4897765 ?auto_4897766 ) ( SUPPORTS ?auto_4897765 ?auto_4897760 ) ( POWER_ON ?auto_4897765 ) ( POINTING ?auto_4897766 ?auto_4897764 ) ( not ( = ?auto_4897761 ?auto_4897764 ) ) ( HAVE_IMAGE ?auto_4897757 ?auto_4897758 ) ( not ( = ?auto_4897757 ?auto_4897764 ) ) ( not ( = ?auto_4897758 ?auto_4897760 ) ) ( HAVE_IMAGE ?auto_4897759 ?auto_4897756 ) ( HAVE_IMAGE ?auto_4897762 ?auto_4897763 ) ( not ( = ?auto_4897758 ?auto_4897756 ) ) ( not ( = ?auto_4897758 ?auto_4897763 ) ) ( not ( = ?auto_4897759 ?auto_4897764 ) ) ( not ( = ?auto_4897756 ?auto_4897760 ) ) ( not ( = ?auto_4897756 ?auto_4897763 ) ) ( not ( = ?auto_4897760 ?auto_4897763 ) ) ( not ( = ?auto_4897762 ?auto_4897764 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4897757 ?auto_4897758 ?auto_4897761 ?auto_4897760 )
      ( GET-4IMAGE-VERIFY ?auto_4897757 ?auto_4897758 ?auto_4897759 ?auto_4897756 ?auto_4897761 ?auto_4897760 ?auto_4897762 ?auto_4897763 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4897916 - DIRECTION
      ?auto_4897917 - MODE
      ?auto_4897918 - DIRECTION
      ?auto_4897915 - MODE
      ?auto_4897920 - DIRECTION
      ?auto_4897919 - MODE
      ?auto_4897921 - DIRECTION
      ?auto_4897922 - MODE
    )
    :vars
    (
      ?auto_4897924 - INSTRUMENT
      ?auto_4897925 - SATELLITE
      ?auto_4897923 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4897918 ?auto_4897916 ) ) ( not ( = ?auto_4897920 ?auto_4897916 ) ) ( not ( = ?auto_4897920 ?auto_4897918 ) ) ( not ( = ?auto_4897921 ?auto_4897916 ) ) ( not ( = ?auto_4897921 ?auto_4897918 ) ) ( not ( = ?auto_4897921 ?auto_4897920 ) ) ( CALIBRATED ?auto_4897924 ) ( ON_BOARD ?auto_4897924 ?auto_4897925 ) ( SUPPORTS ?auto_4897924 ?auto_4897915 ) ( POWER_ON ?auto_4897924 ) ( POINTING ?auto_4897925 ?auto_4897923 ) ( not ( = ?auto_4897918 ?auto_4897923 ) ) ( HAVE_IMAGE ?auto_4897916 ?auto_4897917 ) ( not ( = ?auto_4897916 ?auto_4897923 ) ) ( not ( = ?auto_4897917 ?auto_4897915 ) ) ( HAVE_IMAGE ?auto_4897920 ?auto_4897919 ) ( HAVE_IMAGE ?auto_4897921 ?auto_4897922 ) ( not ( = ?auto_4897917 ?auto_4897919 ) ) ( not ( = ?auto_4897917 ?auto_4897922 ) ) ( not ( = ?auto_4897915 ?auto_4897919 ) ) ( not ( = ?auto_4897915 ?auto_4897922 ) ) ( not ( = ?auto_4897920 ?auto_4897923 ) ) ( not ( = ?auto_4897919 ?auto_4897922 ) ) ( not ( = ?auto_4897921 ?auto_4897923 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4897916 ?auto_4897917 ?auto_4897918 ?auto_4897915 )
      ( GET-4IMAGE-VERIFY ?auto_4897916 ?auto_4897917 ?auto_4897918 ?auto_4897915 ?auto_4897920 ?auto_4897919 ?auto_4897921 ?auto_4897922 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4898943 - DIRECTION
      ?auto_4898944 - MODE
      ?auto_4898945 - DIRECTION
      ?auto_4898942 - MODE
      ?auto_4898947 - DIRECTION
      ?auto_4898946 - MODE
      ?auto_4898948 - DIRECTION
      ?auto_4898949 - MODE
    )
    :vars
    (
      ?auto_4898951 - INSTRUMENT
      ?auto_4898952 - SATELLITE
      ?auto_4898950 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4898945 ?auto_4898943 ) ) ( not ( = ?auto_4898947 ?auto_4898943 ) ) ( not ( = ?auto_4898947 ?auto_4898945 ) ) ( not ( = ?auto_4898948 ?auto_4898943 ) ) ( not ( = ?auto_4898948 ?auto_4898945 ) ) ( not ( = ?auto_4898948 ?auto_4898947 ) ) ( CALIBRATED ?auto_4898951 ) ( ON_BOARD ?auto_4898951 ?auto_4898952 ) ( SUPPORTS ?auto_4898951 ?auto_4898944 ) ( POWER_ON ?auto_4898951 ) ( POINTING ?auto_4898952 ?auto_4898950 ) ( not ( = ?auto_4898943 ?auto_4898950 ) ) ( HAVE_IMAGE ?auto_4898945 ?auto_4898942 ) ( not ( = ?auto_4898945 ?auto_4898950 ) ) ( not ( = ?auto_4898942 ?auto_4898944 ) ) ( HAVE_IMAGE ?auto_4898947 ?auto_4898946 ) ( HAVE_IMAGE ?auto_4898948 ?auto_4898949 ) ( not ( = ?auto_4898944 ?auto_4898946 ) ) ( not ( = ?auto_4898944 ?auto_4898949 ) ) ( not ( = ?auto_4898942 ?auto_4898946 ) ) ( not ( = ?auto_4898942 ?auto_4898949 ) ) ( not ( = ?auto_4898947 ?auto_4898950 ) ) ( not ( = ?auto_4898946 ?auto_4898949 ) ) ( not ( = ?auto_4898948 ?auto_4898950 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4898945 ?auto_4898942 ?auto_4898943 ?auto_4898944 )
      ( GET-4IMAGE-VERIFY ?auto_4898943 ?auto_4898944 ?auto_4898945 ?auto_4898942 ?auto_4898947 ?auto_4898946 ?auto_4898948 ?auto_4898949 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4910654 - DIRECTION
      ?auto_4910655 - MODE
      ?auto_4910656 - DIRECTION
      ?auto_4910653 - MODE
      ?auto_4910658 - DIRECTION
      ?auto_4910657 - MODE
      ?auto_4910659 - DIRECTION
      ?auto_4910660 - MODE
    )
    :vars
    (
      ?auto_4910662 - INSTRUMENT
      ?auto_4910661 - SATELLITE
      ?auto_4910663 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4910656 ?auto_4910654 ) ) ( not ( = ?auto_4910658 ?auto_4910654 ) ) ( not ( = ?auto_4910658 ?auto_4910656 ) ) ( not ( = ?auto_4910659 ?auto_4910654 ) ) ( not ( = ?auto_4910659 ?auto_4910656 ) ) ( not ( = ?auto_4910659 ?auto_4910658 ) ) ( ON_BOARD ?auto_4910662 ?auto_4910661 ) ( SUPPORTS ?auto_4910662 ?auto_4910660 ) ( POWER_ON ?auto_4910662 ) ( POINTING ?auto_4910661 ?auto_4910663 ) ( not ( = ?auto_4910659 ?auto_4910663 ) ) ( HAVE_IMAGE ?auto_4910654 ?auto_4910655 ) ( not ( = ?auto_4910654 ?auto_4910663 ) ) ( not ( = ?auto_4910655 ?auto_4910660 ) ) ( CALIBRATION_TARGET ?auto_4910662 ?auto_4910663 ) ( NOT_CALIBRATED ?auto_4910662 ) ( HAVE_IMAGE ?auto_4910656 ?auto_4910653 ) ( HAVE_IMAGE ?auto_4910658 ?auto_4910657 ) ( not ( = ?auto_4910655 ?auto_4910653 ) ) ( not ( = ?auto_4910655 ?auto_4910657 ) ) ( not ( = ?auto_4910656 ?auto_4910663 ) ) ( not ( = ?auto_4910653 ?auto_4910657 ) ) ( not ( = ?auto_4910653 ?auto_4910660 ) ) ( not ( = ?auto_4910658 ?auto_4910663 ) ) ( not ( = ?auto_4910657 ?auto_4910660 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4910654 ?auto_4910655 ?auto_4910659 ?auto_4910660 )
      ( GET-4IMAGE-VERIFY ?auto_4910654 ?auto_4910655 ?auto_4910656 ?auto_4910653 ?auto_4910658 ?auto_4910657 ?auto_4910659 ?auto_4910660 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4910687 - DIRECTION
      ?auto_4910688 - MODE
      ?auto_4910689 - DIRECTION
      ?auto_4910686 - MODE
      ?auto_4910691 - DIRECTION
      ?auto_4910690 - MODE
      ?auto_4910692 - DIRECTION
      ?auto_4910693 - MODE
    )
    :vars
    (
      ?auto_4910695 - INSTRUMENT
      ?auto_4910694 - SATELLITE
      ?auto_4910696 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4910689 ?auto_4910687 ) ) ( not ( = ?auto_4910691 ?auto_4910687 ) ) ( not ( = ?auto_4910691 ?auto_4910689 ) ) ( not ( = ?auto_4910692 ?auto_4910687 ) ) ( not ( = ?auto_4910692 ?auto_4910689 ) ) ( not ( = ?auto_4910692 ?auto_4910691 ) ) ( ON_BOARD ?auto_4910695 ?auto_4910694 ) ( SUPPORTS ?auto_4910695 ?auto_4910690 ) ( POWER_ON ?auto_4910695 ) ( POINTING ?auto_4910694 ?auto_4910696 ) ( not ( = ?auto_4910691 ?auto_4910696 ) ) ( HAVE_IMAGE ?auto_4910687 ?auto_4910688 ) ( not ( = ?auto_4910687 ?auto_4910696 ) ) ( not ( = ?auto_4910688 ?auto_4910690 ) ) ( CALIBRATION_TARGET ?auto_4910695 ?auto_4910696 ) ( NOT_CALIBRATED ?auto_4910695 ) ( HAVE_IMAGE ?auto_4910689 ?auto_4910686 ) ( HAVE_IMAGE ?auto_4910692 ?auto_4910693 ) ( not ( = ?auto_4910688 ?auto_4910686 ) ) ( not ( = ?auto_4910688 ?auto_4910693 ) ) ( not ( = ?auto_4910689 ?auto_4910696 ) ) ( not ( = ?auto_4910686 ?auto_4910690 ) ) ( not ( = ?auto_4910686 ?auto_4910693 ) ) ( not ( = ?auto_4910690 ?auto_4910693 ) ) ( not ( = ?auto_4910692 ?auto_4910696 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4910687 ?auto_4910688 ?auto_4910691 ?auto_4910690 )
      ( GET-4IMAGE-VERIFY ?auto_4910687 ?auto_4910688 ?auto_4910689 ?auto_4910686 ?auto_4910691 ?auto_4910690 ?auto_4910692 ?auto_4910693 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4910846 - DIRECTION
      ?auto_4910847 - MODE
      ?auto_4910848 - DIRECTION
      ?auto_4910845 - MODE
      ?auto_4910850 - DIRECTION
      ?auto_4910849 - MODE
      ?auto_4910851 - DIRECTION
      ?auto_4910852 - MODE
    )
    :vars
    (
      ?auto_4910854 - INSTRUMENT
      ?auto_4910853 - SATELLITE
      ?auto_4910855 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4910848 ?auto_4910846 ) ) ( not ( = ?auto_4910850 ?auto_4910846 ) ) ( not ( = ?auto_4910850 ?auto_4910848 ) ) ( not ( = ?auto_4910851 ?auto_4910846 ) ) ( not ( = ?auto_4910851 ?auto_4910848 ) ) ( not ( = ?auto_4910851 ?auto_4910850 ) ) ( ON_BOARD ?auto_4910854 ?auto_4910853 ) ( SUPPORTS ?auto_4910854 ?auto_4910845 ) ( POWER_ON ?auto_4910854 ) ( POINTING ?auto_4910853 ?auto_4910855 ) ( not ( = ?auto_4910848 ?auto_4910855 ) ) ( HAVE_IMAGE ?auto_4910846 ?auto_4910847 ) ( not ( = ?auto_4910846 ?auto_4910855 ) ) ( not ( = ?auto_4910847 ?auto_4910845 ) ) ( CALIBRATION_TARGET ?auto_4910854 ?auto_4910855 ) ( NOT_CALIBRATED ?auto_4910854 ) ( HAVE_IMAGE ?auto_4910850 ?auto_4910849 ) ( HAVE_IMAGE ?auto_4910851 ?auto_4910852 ) ( not ( = ?auto_4910847 ?auto_4910849 ) ) ( not ( = ?auto_4910847 ?auto_4910852 ) ) ( not ( = ?auto_4910845 ?auto_4910849 ) ) ( not ( = ?auto_4910845 ?auto_4910852 ) ) ( not ( = ?auto_4910850 ?auto_4910855 ) ) ( not ( = ?auto_4910849 ?auto_4910852 ) ) ( not ( = ?auto_4910851 ?auto_4910855 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4910846 ?auto_4910847 ?auto_4910848 ?auto_4910845 )
      ( GET-4IMAGE-VERIFY ?auto_4910846 ?auto_4910847 ?auto_4910848 ?auto_4910845 ?auto_4910850 ?auto_4910849 ?auto_4910851 ?auto_4910852 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4911873 - DIRECTION
      ?auto_4911874 - MODE
      ?auto_4911875 - DIRECTION
      ?auto_4911872 - MODE
      ?auto_4911877 - DIRECTION
      ?auto_4911876 - MODE
      ?auto_4911878 - DIRECTION
      ?auto_4911879 - MODE
    )
    :vars
    (
      ?auto_4911881 - INSTRUMENT
      ?auto_4911880 - SATELLITE
      ?auto_4911882 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4911875 ?auto_4911873 ) ) ( not ( = ?auto_4911877 ?auto_4911873 ) ) ( not ( = ?auto_4911877 ?auto_4911875 ) ) ( not ( = ?auto_4911878 ?auto_4911873 ) ) ( not ( = ?auto_4911878 ?auto_4911875 ) ) ( not ( = ?auto_4911878 ?auto_4911877 ) ) ( ON_BOARD ?auto_4911881 ?auto_4911880 ) ( SUPPORTS ?auto_4911881 ?auto_4911874 ) ( POWER_ON ?auto_4911881 ) ( POINTING ?auto_4911880 ?auto_4911882 ) ( not ( = ?auto_4911873 ?auto_4911882 ) ) ( HAVE_IMAGE ?auto_4911875 ?auto_4911872 ) ( not ( = ?auto_4911875 ?auto_4911882 ) ) ( not ( = ?auto_4911872 ?auto_4911874 ) ) ( CALIBRATION_TARGET ?auto_4911881 ?auto_4911882 ) ( NOT_CALIBRATED ?auto_4911881 ) ( HAVE_IMAGE ?auto_4911877 ?auto_4911876 ) ( HAVE_IMAGE ?auto_4911878 ?auto_4911879 ) ( not ( = ?auto_4911874 ?auto_4911876 ) ) ( not ( = ?auto_4911874 ?auto_4911879 ) ) ( not ( = ?auto_4911872 ?auto_4911876 ) ) ( not ( = ?auto_4911872 ?auto_4911879 ) ) ( not ( = ?auto_4911877 ?auto_4911882 ) ) ( not ( = ?auto_4911876 ?auto_4911879 ) ) ( not ( = ?auto_4911878 ?auto_4911882 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4911875 ?auto_4911872 ?auto_4911873 ?auto_4911874 )
      ( GET-4IMAGE-VERIFY ?auto_4911873 ?auto_4911874 ?auto_4911875 ?auto_4911872 ?auto_4911877 ?auto_4911876 ?auto_4911878 ?auto_4911879 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4923584 - DIRECTION
      ?auto_4923585 - MODE
      ?auto_4923586 - DIRECTION
      ?auto_4923583 - MODE
      ?auto_4923588 - DIRECTION
      ?auto_4923587 - MODE
      ?auto_4923589 - DIRECTION
      ?auto_4923590 - MODE
    )
    :vars
    (
      ?auto_4923591 - INSTRUMENT
      ?auto_4923592 - SATELLITE
      ?auto_4923593 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4923586 ?auto_4923584 ) ) ( not ( = ?auto_4923588 ?auto_4923584 ) ) ( not ( = ?auto_4923588 ?auto_4923586 ) ) ( not ( = ?auto_4923589 ?auto_4923584 ) ) ( not ( = ?auto_4923589 ?auto_4923586 ) ) ( not ( = ?auto_4923589 ?auto_4923588 ) ) ( ON_BOARD ?auto_4923591 ?auto_4923592 ) ( SUPPORTS ?auto_4923591 ?auto_4923590 ) ( POINTING ?auto_4923592 ?auto_4923593 ) ( not ( = ?auto_4923589 ?auto_4923593 ) ) ( HAVE_IMAGE ?auto_4923584 ?auto_4923585 ) ( not ( = ?auto_4923584 ?auto_4923593 ) ) ( not ( = ?auto_4923585 ?auto_4923590 ) ) ( CALIBRATION_TARGET ?auto_4923591 ?auto_4923593 ) ( POWER_AVAIL ?auto_4923592 ) ( HAVE_IMAGE ?auto_4923586 ?auto_4923583 ) ( HAVE_IMAGE ?auto_4923588 ?auto_4923587 ) ( not ( = ?auto_4923585 ?auto_4923583 ) ) ( not ( = ?auto_4923585 ?auto_4923587 ) ) ( not ( = ?auto_4923586 ?auto_4923593 ) ) ( not ( = ?auto_4923583 ?auto_4923587 ) ) ( not ( = ?auto_4923583 ?auto_4923590 ) ) ( not ( = ?auto_4923588 ?auto_4923593 ) ) ( not ( = ?auto_4923587 ?auto_4923590 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4923584 ?auto_4923585 ?auto_4923589 ?auto_4923590 )
      ( GET-4IMAGE-VERIFY ?auto_4923584 ?auto_4923585 ?auto_4923586 ?auto_4923583 ?auto_4923588 ?auto_4923587 ?auto_4923589 ?auto_4923590 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4923617 - DIRECTION
      ?auto_4923618 - MODE
      ?auto_4923619 - DIRECTION
      ?auto_4923616 - MODE
      ?auto_4923621 - DIRECTION
      ?auto_4923620 - MODE
      ?auto_4923622 - DIRECTION
      ?auto_4923623 - MODE
    )
    :vars
    (
      ?auto_4923624 - INSTRUMENT
      ?auto_4923625 - SATELLITE
      ?auto_4923626 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4923619 ?auto_4923617 ) ) ( not ( = ?auto_4923621 ?auto_4923617 ) ) ( not ( = ?auto_4923621 ?auto_4923619 ) ) ( not ( = ?auto_4923622 ?auto_4923617 ) ) ( not ( = ?auto_4923622 ?auto_4923619 ) ) ( not ( = ?auto_4923622 ?auto_4923621 ) ) ( ON_BOARD ?auto_4923624 ?auto_4923625 ) ( SUPPORTS ?auto_4923624 ?auto_4923620 ) ( POINTING ?auto_4923625 ?auto_4923626 ) ( not ( = ?auto_4923621 ?auto_4923626 ) ) ( HAVE_IMAGE ?auto_4923617 ?auto_4923618 ) ( not ( = ?auto_4923617 ?auto_4923626 ) ) ( not ( = ?auto_4923618 ?auto_4923620 ) ) ( CALIBRATION_TARGET ?auto_4923624 ?auto_4923626 ) ( POWER_AVAIL ?auto_4923625 ) ( HAVE_IMAGE ?auto_4923619 ?auto_4923616 ) ( HAVE_IMAGE ?auto_4923622 ?auto_4923623 ) ( not ( = ?auto_4923618 ?auto_4923616 ) ) ( not ( = ?auto_4923618 ?auto_4923623 ) ) ( not ( = ?auto_4923619 ?auto_4923626 ) ) ( not ( = ?auto_4923616 ?auto_4923620 ) ) ( not ( = ?auto_4923616 ?auto_4923623 ) ) ( not ( = ?auto_4923620 ?auto_4923623 ) ) ( not ( = ?auto_4923622 ?auto_4923626 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4923617 ?auto_4923618 ?auto_4923621 ?auto_4923620 )
      ( GET-4IMAGE-VERIFY ?auto_4923617 ?auto_4923618 ?auto_4923619 ?auto_4923616 ?auto_4923621 ?auto_4923620 ?auto_4923622 ?auto_4923623 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4923776 - DIRECTION
      ?auto_4923777 - MODE
      ?auto_4923778 - DIRECTION
      ?auto_4923775 - MODE
      ?auto_4923780 - DIRECTION
      ?auto_4923779 - MODE
      ?auto_4923781 - DIRECTION
      ?auto_4923782 - MODE
    )
    :vars
    (
      ?auto_4923783 - INSTRUMENT
      ?auto_4923784 - SATELLITE
      ?auto_4923785 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4923778 ?auto_4923776 ) ) ( not ( = ?auto_4923780 ?auto_4923776 ) ) ( not ( = ?auto_4923780 ?auto_4923778 ) ) ( not ( = ?auto_4923781 ?auto_4923776 ) ) ( not ( = ?auto_4923781 ?auto_4923778 ) ) ( not ( = ?auto_4923781 ?auto_4923780 ) ) ( ON_BOARD ?auto_4923783 ?auto_4923784 ) ( SUPPORTS ?auto_4923783 ?auto_4923775 ) ( POINTING ?auto_4923784 ?auto_4923785 ) ( not ( = ?auto_4923778 ?auto_4923785 ) ) ( HAVE_IMAGE ?auto_4923776 ?auto_4923777 ) ( not ( = ?auto_4923776 ?auto_4923785 ) ) ( not ( = ?auto_4923777 ?auto_4923775 ) ) ( CALIBRATION_TARGET ?auto_4923783 ?auto_4923785 ) ( POWER_AVAIL ?auto_4923784 ) ( HAVE_IMAGE ?auto_4923780 ?auto_4923779 ) ( HAVE_IMAGE ?auto_4923781 ?auto_4923782 ) ( not ( = ?auto_4923777 ?auto_4923779 ) ) ( not ( = ?auto_4923777 ?auto_4923782 ) ) ( not ( = ?auto_4923775 ?auto_4923779 ) ) ( not ( = ?auto_4923775 ?auto_4923782 ) ) ( not ( = ?auto_4923780 ?auto_4923785 ) ) ( not ( = ?auto_4923779 ?auto_4923782 ) ) ( not ( = ?auto_4923781 ?auto_4923785 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4923776 ?auto_4923777 ?auto_4923778 ?auto_4923775 )
      ( GET-4IMAGE-VERIFY ?auto_4923776 ?auto_4923777 ?auto_4923778 ?auto_4923775 ?auto_4923780 ?auto_4923779 ?auto_4923781 ?auto_4923782 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4924803 - DIRECTION
      ?auto_4924804 - MODE
      ?auto_4924805 - DIRECTION
      ?auto_4924802 - MODE
      ?auto_4924807 - DIRECTION
      ?auto_4924806 - MODE
      ?auto_4924808 - DIRECTION
      ?auto_4924809 - MODE
    )
    :vars
    (
      ?auto_4924810 - INSTRUMENT
      ?auto_4924811 - SATELLITE
      ?auto_4924812 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4924805 ?auto_4924803 ) ) ( not ( = ?auto_4924807 ?auto_4924803 ) ) ( not ( = ?auto_4924807 ?auto_4924805 ) ) ( not ( = ?auto_4924808 ?auto_4924803 ) ) ( not ( = ?auto_4924808 ?auto_4924805 ) ) ( not ( = ?auto_4924808 ?auto_4924807 ) ) ( ON_BOARD ?auto_4924810 ?auto_4924811 ) ( SUPPORTS ?auto_4924810 ?auto_4924804 ) ( POINTING ?auto_4924811 ?auto_4924812 ) ( not ( = ?auto_4924803 ?auto_4924812 ) ) ( HAVE_IMAGE ?auto_4924805 ?auto_4924802 ) ( not ( = ?auto_4924805 ?auto_4924812 ) ) ( not ( = ?auto_4924802 ?auto_4924804 ) ) ( CALIBRATION_TARGET ?auto_4924810 ?auto_4924812 ) ( POWER_AVAIL ?auto_4924811 ) ( HAVE_IMAGE ?auto_4924807 ?auto_4924806 ) ( HAVE_IMAGE ?auto_4924808 ?auto_4924809 ) ( not ( = ?auto_4924804 ?auto_4924806 ) ) ( not ( = ?auto_4924804 ?auto_4924809 ) ) ( not ( = ?auto_4924802 ?auto_4924806 ) ) ( not ( = ?auto_4924802 ?auto_4924809 ) ) ( not ( = ?auto_4924807 ?auto_4924812 ) ) ( not ( = ?auto_4924806 ?auto_4924809 ) ) ( not ( = ?auto_4924808 ?auto_4924812 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4924805 ?auto_4924802 ?auto_4924803 ?auto_4924804 )
      ( GET-4IMAGE-VERIFY ?auto_4924803 ?auto_4924804 ?auto_4924805 ?auto_4924802 ?auto_4924807 ?auto_4924806 ?auto_4924808 ?auto_4924809 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4936125 - DIRECTION
      ?auto_4936126 - MODE
      ?auto_4936127 - DIRECTION
      ?auto_4936124 - MODE
      ?auto_4936129 - DIRECTION
      ?auto_4936128 - MODE
    )
    :vars
    (
      ?auto_4936130 - INSTRUMENT
      ?auto_4936132 - SATELLITE
      ?auto_4936131 - DIRECTION
      ?auto_4936133 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4936127 ?auto_4936125 ) ) ( not ( = ?auto_4936129 ?auto_4936125 ) ) ( not ( = ?auto_4936129 ?auto_4936127 ) ) ( ON_BOARD ?auto_4936130 ?auto_4936132 ) ( SUPPORTS ?auto_4936130 ?auto_4936128 ) ( not ( = ?auto_4936129 ?auto_4936131 ) ) ( HAVE_IMAGE ?auto_4936125 ?auto_4936126 ) ( not ( = ?auto_4936125 ?auto_4936131 ) ) ( not ( = ?auto_4936126 ?auto_4936128 ) ) ( CALIBRATION_TARGET ?auto_4936130 ?auto_4936131 ) ( POWER_AVAIL ?auto_4936132 ) ( POINTING ?auto_4936132 ?auto_4936133 ) ( not ( = ?auto_4936131 ?auto_4936133 ) ) ( not ( = ?auto_4936129 ?auto_4936133 ) ) ( not ( = ?auto_4936125 ?auto_4936133 ) ) ( HAVE_IMAGE ?auto_4936127 ?auto_4936124 ) ( not ( = ?auto_4936126 ?auto_4936124 ) ) ( not ( = ?auto_4936127 ?auto_4936131 ) ) ( not ( = ?auto_4936127 ?auto_4936133 ) ) ( not ( = ?auto_4936124 ?auto_4936128 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4936125 ?auto_4936126 ?auto_4936129 ?auto_4936128 )
      ( GET-3IMAGE-VERIFY ?auto_4936125 ?auto_4936126 ?auto_4936127 ?auto_4936124 ?auto_4936129 ?auto_4936128 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4936154 - DIRECTION
      ?auto_4936155 - MODE
      ?auto_4936156 - DIRECTION
      ?auto_4936153 - MODE
      ?auto_4936158 - DIRECTION
      ?auto_4936157 - MODE
    )
    :vars
    (
      ?auto_4936159 - INSTRUMENT
      ?auto_4936161 - SATELLITE
      ?auto_4936160 - DIRECTION
      ?auto_4936162 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4936156 ?auto_4936154 ) ) ( not ( = ?auto_4936158 ?auto_4936154 ) ) ( not ( = ?auto_4936158 ?auto_4936156 ) ) ( ON_BOARD ?auto_4936159 ?auto_4936161 ) ( SUPPORTS ?auto_4936159 ?auto_4936153 ) ( not ( = ?auto_4936156 ?auto_4936160 ) ) ( HAVE_IMAGE ?auto_4936154 ?auto_4936155 ) ( not ( = ?auto_4936154 ?auto_4936160 ) ) ( not ( = ?auto_4936155 ?auto_4936153 ) ) ( CALIBRATION_TARGET ?auto_4936159 ?auto_4936160 ) ( POWER_AVAIL ?auto_4936161 ) ( POINTING ?auto_4936161 ?auto_4936162 ) ( not ( = ?auto_4936160 ?auto_4936162 ) ) ( not ( = ?auto_4936156 ?auto_4936162 ) ) ( not ( = ?auto_4936154 ?auto_4936162 ) ) ( HAVE_IMAGE ?auto_4936158 ?auto_4936157 ) ( not ( = ?auto_4936155 ?auto_4936157 ) ) ( not ( = ?auto_4936153 ?auto_4936157 ) ) ( not ( = ?auto_4936158 ?auto_4936160 ) ) ( not ( = ?auto_4936158 ?auto_4936162 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4936154 ?auto_4936155 ?auto_4936156 ?auto_4936153 )
      ( GET-3IMAGE-VERIFY ?auto_4936154 ?auto_4936155 ?auto_4936156 ?auto_4936153 ?auto_4936158 ?auto_4936157 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4936316 - DIRECTION
      ?auto_4936317 - MODE
      ?auto_4936318 - DIRECTION
      ?auto_4936315 - MODE
      ?auto_4936320 - DIRECTION
      ?auto_4936319 - MODE
    )
    :vars
    (
      ?auto_4936321 - INSTRUMENT
      ?auto_4936323 - SATELLITE
      ?auto_4936322 - DIRECTION
      ?auto_4936324 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4936318 ?auto_4936316 ) ) ( not ( = ?auto_4936320 ?auto_4936316 ) ) ( not ( = ?auto_4936320 ?auto_4936318 ) ) ( ON_BOARD ?auto_4936321 ?auto_4936323 ) ( SUPPORTS ?auto_4936321 ?auto_4936317 ) ( not ( = ?auto_4936316 ?auto_4936322 ) ) ( HAVE_IMAGE ?auto_4936318 ?auto_4936315 ) ( not ( = ?auto_4936318 ?auto_4936322 ) ) ( not ( = ?auto_4936315 ?auto_4936317 ) ) ( CALIBRATION_TARGET ?auto_4936321 ?auto_4936322 ) ( POWER_AVAIL ?auto_4936323 ) ( POINTING ?auto_4936323 ?auto_4936324 ) ( not ( = ?auto_4936322 ?auto_4936324 ) ) ( not ( = ?auto_4936316 ?auto_4936324 ) ) ( not ( = ?auto_4936318 ?auto_4936324 ) ) ( HAVE_IMAGE ?auto_4936320 ?auto_4936319 ) ( not ( = ?auto_4936317 ?auto_4936319 ) ) ( not ( = ?auto_4936315 ?auto_4936319 ) ) ( not ( = ?auto_4936320 ?auto_4936322 ) ) ( not ( = ?auto_4936320 ?auto_4936324 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4936318 ?auto_4936315 ?auto_4936316 ?auto_4936317 )
      ( GET-3IMAGE-VERIFY ?auto_4936316 ?auto_4936317 ?auto_4936318 ?auto_4936315 ?auto_4936320 ?auto_4936319 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4936569 - DIRECTION
      ?auto_4936570 - MODE
      ?auto_4936571 - DIRECTION
      ?auto_4936568 - MODE
      ?auto_4936573 - DIRECTION
      ?auto_4936572 - MODE
      ?auto_4936574 - DIRECTION
      ?auto_4936575 - MODE
    )
    :vars
    (
      ?auto_4936576 - INSTRUMENT
      ?auto_4936578 - SATELLITE
      ?auto_4936577 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4936571 ?auto_4936569 ) ) ( not ( = ?auto_4936573 ?auto_4936569 ) ) ( not ( = ?auto_4936573 ?auto_4936571 ) ) ( not ( = ?auto_4936574 ?auto_4936569 ) ) ( not ( = ?auto_4936574 ?auto_4936571 ) ) ( not ( = ?auto_4936574 ?auto_4936573 ) ) ( ON_BOARD ?auto_4936576 ?auto_4936578 ) ( SUPPORTS ?auto_4936576 ?auto_4936575 ) ( not ( = ?auto_4936574 ?auto_4936577 ) ) ( HAVE_IMAGE ?auto_4936569 ?auto_4936570 ) ( not ( = ?auto_4936569 ?auto_4936577 ) ) ( not ( = ?auto_4936570 ?auto_4936575 ) ) ( CALIBRATION_TARGET ?auto_4936576 ?auto_4936577 ) ( POWER_AVAIL ?auto_4936578 ) ( POINTING ?auto_4936578 ?auto_4936573 ) ( not ( = ?auto_4936577 ?auto_4936573 ) ) ( HAVE_IMAGE ?auto_4936571 ?auto_4936568 ) ( HAVE_IMAGE ?auto_4936573 ?auto_4936572 ) ( not ( = ?auto_4936570 ?auto_4936568 ) ) ( not ( = ?auto_4936570 ?auto_4936572 ) ) ( not ( = ?auto_4936571 ?auto_4936577 ) ) ( not ( = ?auto_4936568 ?auto_4936572 ) ) ( not ( = ?auto_4936568 ?auto_4936575 ) ) ( not ( = ?auto_4936572 ?auto_4936575 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4936569 ?auto_4936570 ?auto_4936574 ?auto_4936575 )
      ( GET-4IMAGE-VERIFY ?auto_4936569 ?auto_4936570 ?auto_4936571 ?auto_4936568 ?auto_4936573 ?auto_4936572 ?auto_4936574 ?auto_4936575 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4936604 - DIRECTION
      ?auto_4936605 - MODE
      ?auto_4936606 - DIRECTION
      ?auto_4936603 - MODE
      ?auto_4936608 - DIRECTION
      ?auto_4936607 - MODE
      ?auto_4936609 - DIRECTION
      ?auto_4936610 - MODE
    )
    :vars
    (
      ?auto_4936611 - INSTRUMENT
      ?auto_4936613 - SATELLITE
      ?auto_4936612 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4936606 ?auto_4936604 ) ) ( not ( = ?auto_4936608 ?auto_4936604 ) ) ( not ( = ?auto_4936608 ?auto_4936606 ) ) ( not ( = ?auto_4936609 ?auto_4936604 ) ) ( not ( = ?auto_4936609 ?auto_4936606 ) ) ( not ( = ?auto_4936609 ?auto_4936608 ) ) ( ON_BOARD ?auto_4936611 ?auto_4936613 ) ( SUPPORTS ?auto_4936611 ?auto_4936607 ) ( not ( = ?auto_4936608 ?auto_4936612 ) ) ( HAVE_IMAGE ?auto_4936604 ?auto_4936605 ) ( not ( = ?auto_4936604 ?auto_4936612 ) ) ( not ( = ?auto_4936605 ?auto_4936607 ) ) ( CALIBRATION_TARGET ?auto_4936611 ?auto_4936612 ) ( POWER_AVAIL ?auto_4936613 ) ( POINTING ?auto_4936613 ?auto_4936609 ) ( not ( = ?auto_4936612 ?auto_4936609 ) ) ( HAVE_IMAGE ?auto_4936606 ?auto_4936603 ) ( HAVE_IMAGE ?auto_4936609 ?auto_4936610 ) ( not ( = ?auto_4936605 ?auto_4936603 ) ) ( not ( = ?auto_4936605 ?auto_4936610 ) ) ( not ( = ?auto_4936606 ?auto_4936612 ) ) ( not ( = ?auto_4936603 ?auto_4936607 ) ) ( not ( = ?auto_4936603 ?auto_4936610 ) ) ( not ( = ?auto_4936607 ?auto_4936610 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4936604 ?auto_4936605 ?auto_4936608 ?auto_4936607 )
      ( GET-4IMAGE-VERIFY ?auto_4936604 ?auto_4936605 ?auto_4936606 ?auto_4936603 ?auto_4936608 ?auto_4936607 ?auto_4936609 ?auto_4936610 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4936638 - DIRECTION
      ?auto_4936639 - MODE
      ?auto_4936640 - DIRECTION
      ?auto_4936637 - MODE
      ?auto_4936642 - DIRECTION
      ?auto_4936641 - MODE
      ?auto_4936643 - DIRECTION
      ?auto_4936644 - MODE
    )
    :vars
    (
      ?auto_4936645 - INSTRUMENT
      ?auto_4936647 - SATELLITE
      ?auto_4936646 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4936640 ?auto_4936638 ) ) ( not ( = ?auto_4936642 ?auto_4936638 ) ) ( not ( = ?auto_4936642 ?auto_4936640 ) ) ( not ( = ?auto_4936643 ?auto_4936638 ) ) ( not ( = ?auto_4936643 ?auto_4936640 ) ) ( not ( = ?auto_4936643 ?auto_4936642 ) ) ( ON_BOARD ?auto_4936645 ?auto_4936647 ) ( SUPPORTS ?auto_4936645 ?auto_4936644 ) ( not ( = ?auto_4936643 ?auto_4936646 ) ) ( HAVE_IMAGE ?auto_4936638 ?auto_4936639 ) ( not ( = ?auto_4936638 ?auto_4936646 ) ) ( not ( = ?auto_4936639 ?auto_4936644 ) ) ( CALIBRATION_TARGET ?auto_4936645 ?auto_4936646 ) ( POWER_AVAIL ?auto_4936647 ) ( POINTING ?auto_4936647 ?auto_4936640 ) ( not ( = ?auto_4936646 ?auto_4936640 ) ) ( HAVE_IMAGE ?auto_4936640 ?auto_4936637 ) ( HAVE_IMAGE ?auto_4936642 ?auto_4936641 ) ( not ( = ?auto_4936639 ?auto_4936637 ) ) ( not ( = ?auto_4936639 ?auto_4936641 ) ) ( not ( = ?auto_4936637 ?auto_4936641 ) ) ( not ( = ?auto_4936637 ?auto_4936644 ) ) ( not ( = ?auto_4936642 ?auto_4936646 ) ) ( not ( = ?auto_4936641 ?auto_4936644 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4936638 ?auto_4936639 ?auto_4936643 ?auto_4936644 )
      ( GET-4IMAGE-VERIFY ?auto_4936638 ?auto_4936639 ?auto_4936640 ?auto_4936637 ?auto_4936642 ?auto_4936641 ?auto_4936643 ?auto_4936644 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4936671 - DIRECTION
      ?auto_4936672 - MODE
      ?auto_4936673 - DIRECTION
      ?auto_4936670 - MODE
      ?auto_4936675 - DIRECTION
      ?auto_4936674 - MODE
      ?auto_4936676 - DIRECTION
      ?auto_4936677 - MODE
    )
    :vars
    (
      ?auto_4936678 - INSTRUMENT
      ?auto_4936680 - SATELLITE
      ?auto_4936679 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4936673 ?auto_4936671 ) ) ( not ( = ?auto_4936675 ?auto_4936671 ) ) ( not ( = ?auto_4936675 ?auto_4936673 ) ) ( not ( = ?auto_4936676 ?auto_4936671 ) ) ( not ( = ?auto_4936676 ?auto_4936673 ) ) ( not ( = ?auto_4936676 ?auto_4936675 ) ) ( ON_BOARD ?auto_4936678 ?auto_4936680 ) ( SUPPORTS ?auto_4936678 ?auto_4936674 ) ( not ( = ?auto_4936675 ?auto_4936679 ) ) ( HAVE_IMAGE ?auto_4936671 ?auto_4936672 ) ( not ( = ?auto_4936671 ?auto_4936679 ) ) ( not ( = ?auto_4936672 ?auto_4936674 ) ) ( CALIBRATION_TARGET ?auto_4936678 ?auto_4936679 ) ( POWER_AVAIL ?auto_4936680 ) ( POINTING ?auto_4936680 ?auto_4936673 ) ( not ( = ?auto_4936679 ?auto_4936673 ) ) ( HAVE_IMAGE ?auto_4936673 ?auto_4936670 ) ( HAVE_IMAGE ?auto_4936676 ?auto_4936677 ) ( not ( = ?auto_4936672 ?auto_4936670 ) ) ( not ( = ?auto_4936672 ?auto_4936677 ) ) ( not ( = ?auto_4936670 ?auto_4936674 ) ) ( not ( = ?auto_4936670 ?auto_4936677 ) ) ( not ( = ?auto_4936674 ?auto_4936677 ) ) ( not ( = ?auto_4936676 ?auto_4936679 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4936671 ?auto_4936672 ?auto_4936675 ?auto_4936674 )
      ( GET-4IMAGE-VERIFY ?auto_4936671 ?auto_4936672 ?auto_4936673 ?auto_4936670 ?auto_4936675 ?auto_4936674 ?auto_4936676 ?auto_4936677 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4936775 - DIRECTION
      ?auto_4936776 - MODE
      ?auto_4936777 - DIRECTION
      ?auto_4936774 - MODE
      ?auto_4936779 - DIRECTION
      ?auto_4936778 - MODE
      ?auto_4936780 - DIRECTION
      ?auto_4936781 - MODE
    )
    :vars
    (
      ?auto_4936782 - INSTRUMENT
      ?auto_4936784 - SATELLITE
      ?auto_4936783 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4936777 ?auto_4936775 ) ) ( not ( = ?auto_4936779 ?auto_4936775 ) ) ( not ( = ?auto_4936779 ?auto_4936777 ) ) ( not ( = ?auto_4936780 ?auto_4936775 ) ) ( not ( = ?auto_4936780 ?auto_4936777 ) ) ( not ( = ?auto_4936780 ?auto_4936779 ) ) ( ON_BOARD ?auto_4936782 ?auto_4936784 ) ( SUPPORTS ?auto_4936782 ?auto_4936774 ) ( not ( = ?auto_4936777 ?auto_4936783 ) ) ( HAVE_IMAGE ?auto_4936775 ?auto_4936776 ) ( not ( = ?auto_4936775 ?auto_4936783 ) ) ( not ( = ?auto_4936776 ?auto_4936774 ) ) ( CALIBRATION_TARGET ?auto_4936782 ?auto_4936783 ) ( POWER_AVAIL ?auto_4936784 ) ( POINTING ?auto_4936784 ?auto_4936780 ) ( not ( = ?auto_4936783 ?auto_4936780 ) ) ( HAVE_IMAGE ?auto_4936779 ?auto_4936778 ) ( HAVE_IMAGE ?auto_4936780 ?auto_4936781 ) ( not ( = ?auto_4936776 ?auto_4936778 ) ) ( not ( = ?auto_4936776 ?auto_4936781 ) ) ( not ( = ?auto_4936774 ?auto_4936778 ) ) ( not ( = ?auto_4936774 ?auto_4936781 ) ) ( not ( = ?auto_4936779 ?auto_4936783 ) ) ( not ( = ?auto_4936778 ?auto_4936781 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4936775 ?auto_4936776 ?auto_4936777 ?auto_4936774 )
      ( GET-4IMAGE-VERIFY ?auto_4936775 ?auto_4936776 ?auto_4936777 ?auto_4936774 ?auto_4936779 ?auto_4936778 ?auto_4936780 ?auto_4936781 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4936809 - DIRECTION
      ?auto_4936810 - MODE
      ?auto_4936811 - DIRECTION
      ?auto_4936808 - MODE
      ?auto_4936813 - DIRECTION
      ?auto_4936812 - MODE
      ?auto_4936814 - DIRECTION
      ?auto_4936815 - MODE
    )
    :vars
    (
      ?auto_4936816 - INSTRUMENT
      ?auto_4936818 - SATELLITE
      ?auto_4936817 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4936811 ?auto_4936809 ) ) ( not ( = ?auto_4936813 ?auto_4936809 ) ) ( not ( = ?auto_4936813 ?auto_4936811 ) ) ( not ( = ?auto_4936814 ?auto_4936809 ) ) ( not ( = ?auto_4936814 ?auto_4936811 ) ) ( not ( = ?auto_4936814 ?auto_4936813 ) ) ( ON_BOARD ?auto_4936816 ?auto_4936818 ) ( SUPPORTS ?auto_4936816 ?auto_4936808 ) ( not ( = ?auto_4936811 ?auto_4936817 ) ) ( HAVE_IMAGE ?auto_4936809 ?auto_4936810 ) ( not ( = ?auto_4936809 ?auto_4936817 ) ) ( not ( = ?auto_4936810 ?auto_4936808 ) ) ( CALIBRATION_TARGET ?auto_4936816 ?auto_4936817 ) ( POWER_AVAIL ?auto_4936818 ) ( POINTING ?auto_4936818 ?auto_4936813 ) ( not ( = ?auto_4936817 ?auto_4936813 ) ) ( HAVE_IMAGE ?auto_4936813 ?auto_4936812 ) ( HAVE_IMAGE ?auto_4936814 ?auto_4936815 ) ( not ( = ?auto_4936810 ?auto_4936812 ) ) ( not ( = ?auto_4936810 ?auto_4936815 ) ) ( not ( = ?auto_4936808 ?auto_4936812 ) ) ( not ( = ?auto_4936808 ?auto_4936815 ) ) ( not ( = ?auto_4936812 ?auto_4936815 ) ) ( not ( = ?auto_4936814 ?auto_4936817 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4936809 ?auto_4936810 ?auto_4936811 ?auto_4936808 )
      ( GET-4IMAGE-VERIFY ?auto_4936809 ?auto_4936810 ?auto_4936811 ?auto_4936808 ?auto_4936813 ?auto_4936812 ?auto_4936814 ?auto_4936815 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4937346 - DIRECTION
      ?auto_4937347 - MODE
      ?auto_4937348 - DIRECTION
      ?auto_4937345 - MODE
      ?auto_4937350 - DIRECTION
      ?auto_4937349 - MODE
      ?auto_4937351 - DIRECTION
      ?auto_4937352 - MODE
    )
    :vars
    (
      ?auto_4937353 - INSTRUMENT
      ?auto_4937355 - SATELLITE
      ?auto_4937354 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4937348 ?auto_4937346 ) ) ( not ( = ?auto_4937350 ?auto_4937346 ) ) ( not ( = ?auto_4937350 ?auto_4937348 ) ) ( not ( = ?auto_4937351 ?auto_4937346 ) ) ( not ( = ?auto_4937351 ?auto_4937348 ) ) ( not ( = ?auto_4937351 ?auto_4937350 ) ) ( ON_BOARD ?auto_4937353 ?auto_4937355 ) ( SUPPORTS ?auto_4937353 ?auto_4937352 ) ( not ( = ?auto_4937351 ?auto_4937354 ) ) ( HAVE_IMAGE ?auto_4937348 ?auto_4937345 ) ( not ( = ?auto_4937348 ?auto_4937354 ) ) ( not ( = ?auto_4937345 ?auto_4937352 ) ) ( CALIBRATION_TARGET ?auto_4937353 ?auto_4937354 ) ( POWER_AVAIL ?auto_4937355 ) ( POINTING ?auto_4937355 ?auto_4937346 ) ( not ( = ?auto_4937354 ?auto_4937346 ) ) ( HAVE_IMAGE ?auto_4937346 ?auto_4937347 ) ( HAVE_IMAGE ?auto_4937350 ?auto_4937349 ) ( not ( = ?auto_4937347 ?auto_4937345 ) ) ( not ( = ?auto_4937347 ?auto_4937349 ) ) ( not ( = ?auto_4937347 ?auto_4937352 ) ) ( not ( = ?auto_4937345 ?auto_4937349 ) ) ( not ( = ?auto_4937350 ?auto_4937354 ) ) ( not ( = ?auto_4937349 ?auto_4937352 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4937348 ?auto_4937345 ?auto_4937351 ?auto_4937352 )
      ( GET-4IMAGE-VERIFY ?auto_4937346 ?auto_4937347 ?auto_4937348 ?auto_4937345 ?auto_4937350 ?auto_4937349 ?auto_4937351 ?auto_4937352 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4937379 - DIRECTION
      ?auto_4937380 - MODE
      ?auto_4937381 - DIRECTION
      ?auto_4937378 - MODE
      ?auto_4937383 - DIRECTION
      ?auto_4937382 - MODE
      ?auto_4937384 - DIRECTION
      ?auto_4937385 - MODE
    )
    :vars
    (
      ?auto_4937386 - INSTRUMENT
      ?auto_4937388 - SATELLITE
      ?auto_4937387 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4937381 ?auto_4937379 ) ) ( not ( = ?auto_4937383 ?auto_4937379 ) ) ( not ( = ?auto_4937383 ?auto_4937381 ) ) ( not ( = ?auto_4937384 ?auto_4937379 ) ) ( not ( = ?auto_4937384 ?auto_4937381 ) ) ( not ( = ?auto_4937384 ?auto_4937383 ) ) ( ON_BOARD ?auto_4937386 ?auto_4937388 ) ( SUPPORTS ?auto_4937386 ?auto_4937382 ) ( not ( = ?auto_4937383 ?auto_4937387 ) ) ( HAVE_IMAGE ?auto_4937381 ?auto_4937378 ) ( not ( = ?auto_4937381 ?auto_4937387 ) ) ( not ( = ?auto_4937378 ?auto_4937382 ) ) ( CALIBRATION_TARGET ?auto_4937386 ?auto_4937387 ) ( POWER_AVAIL ?auto_4937388 ) ( POINTING ?auto_4937388 ?auto_4937379 ) ( not ( = ?auto_4937387 ?auto_4937379 ) ) ( HAVE_IMAGE ?auto_4937379 ?auto_4937380 ) ( HAVE_IMAGE ?auto_4937384 ?auto_4937385 ) ( not ( = ?auto_4937380 ?auto_4937378 ) ) ( not ( = ?auto_4937380 ?auto_4937382 ) ) ( not ( = ?auto_4937380 ?auto_4937385 ) ) ( not ( = ?auto_4937378 ?auto_4937385 ) ) ( not ( = ?auto_4937382 ?auto_4937385 ) ) ( not ( = ?auto_4937384 ?auto_4937387 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4937381 ?auto_4937378 ?auto_4937383 ?auto_4937382 )
      ( GET-4IMAGE-VERIFY ?auto_4937379 ?auto_4937380 ?auto_4937381 ?auto_4937378 ?auto_4937383 ?auto_4937382 ?auto_4937384 ?auto_4937385 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4937591 - DIRECTION
      ?auto_4937592 - MODE
      ?auto_4937593 - DIRECTION
      ?auto_4937590 - MODE
      ?auto_4937595 - DIRECTION
      ?auto_4937594 - MODE
      ?auto_4937596 - DIRECTION
      ?auto_4937597 - MODE
    )
    :vars
    (
      ?auto_4937598 - INSTRUMENT
      ?auto_4937600 - SATELLITE
      ?auto_4937599 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4937593 ?auto_4937591 ) ) ( not ( = ?auto_4937595 ?auto_4937591 ) ) ( not ( = ?auto_4937595 ?auto_4937593 ) ) ( not ( = ?auto_4937596 ?auto_4937591 ) ) ( not ( = ?auto_4937596 ?auto_4937593 ) ) ( not ( = ?auto_4937596 ?auto_4937595 ) ) ( ON_BOARD ?auto_4937598 ?auto_4937600 ) ( SUPPORTS ?auto_4937598 ?auto_4937590 ) ( not ( = ?auto_4937593 ?auto_4937599 ) ) ( HAVE_IMAGE ?auto_4937595 ?auto_4937594 ) ( not ( = ?auto_4937595 ?auto_4937599 ) ) ( not ( = ?auto_4937594 ?auto_4937590 ) ) ( CALIBRATION_TARGET ?auto_4937598 ?auto_4937599 ) ( POWER_AVAIL ?auto_4937600 ) ( POINTING ?auto_4937600 ?auto_4937591 ) ( not ( = ?auto_4937599 ?auto_4937591 ) ) ( HAVE_IMAGE ?auto_4937591 ?auto_4937592 ) ( HAVE_IMAGE ?auto_4937596 ?auto_4937597 ) ( not ( = ?auto_4937592 ?auto_4937590 ) ) ( not ( = ?auto_4937592 ?auto_4937594 ) ) ( not ( = ?auto_4937592 ?auto_4937597 ) ) ( not ( = ?auto_4937590 ?auto_4937597 ) ) ( not ( = ?auto_4937594 ?auto_4937597 ) ) ( not ( = ?auto_4937596 ?auto_4937599 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4937595 ?auto_4937594 ?auto_4937593 ?auto_4937590 )
      ( GET-4IMAGE-VERIFY ?auto_4937591 ?auto_4937592 ?auto_4937593 ?auto_4937590 ?auto_4937595 ?auto_4937594 ?auto_4937596 ?auto_4937597 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4937842 - DIRECTION
      ?auto_4937843 - MODE
      ?auto_4937844 - DIRECTION
      ?auto_4937841 - MODE
      ?auto_4937846 - DIRECTION
      ?auto_4937845 - MODE
      ?auto_4937847 - DIRECTION
      ?auto_4937848 - MODE
    )
    :vars
    (
      ?auto_4937849 - INSTRUMENT
      ?auto_4937851 - SATELLITE
      ?auto_4937850 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4937844 ?auto_4937842 ) ) ( not ( = ?auto_4937846 ?auto_4937842 ) ) ( not ( = ?auto_4937846 ?auto_4937844 ) ) ( not ( = ?auto_4937847 ?auto_4937842 ) ) ( not ( = ?auto_4937847 ?auto_4937844 ) ) ( not ( = ?auto_4937847 ?auto_4937846 ) ) ( ON_BOARD ?auto_4937849 ?auto_4937851 ) ( SUPPORTS ?auto_4937849 ?auto_4937843 ) ( not ( = ?auto_4937842 ?auto_4937850 ) ) ( HAVE_IMAGE ?auto_4937844 ?auto_4937841 ) ( not ( = ?auto_4937844 ?auto_4937850 ) ) ( not ( = ?auto_4937841 ?auto_4937843 ) ) ( CALIBRATION_TARGET ?auto_4937849 ?auto_4937850 ) ( POWER_AVAIL ?auto_4937851 ) ( POINTING ?auto_4937851 ?auto_4937847 ) ( not ( = ?auto_4937850 ?auto_4937847 ) ) ( HAVE_IMAGE ?auto_4937846 ?auto_4937845 ) ( HAVE_IMAGE ?auto_4937847 ?auto_4937848 ) ( not ( = ?auto_4937843 ?auto_4937845 ) ) ( not ( = ?auto_4937843 ?auto_4937848 ) ) ( not ( = ?auto_4937841 ?auto_4937845 ) ) ( not ( = ?auto_4937841 ?auto_4937848 ) ) ( not ( = ?auto_4937846 ?auto_4937850 ) ) ( not ( = ?auto_4937845 ?auto_4937848 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4937844 ?auto_4937841 ?auto_4937842 ?auto_4937843 )
      ( GET-4IMAGE-VERIFY ?auto_4937842 ?auto_4937843 ?auto_4937844 ?auto_4937841 ?auto_4937846 ?auto_4937845 ?auto_4937847 ?auto_4937848 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4937876 - DIRECTION
      ?auto_4937877 - MODE
      ?auto_4937878 - DIRECTION
      ?auto_4937875 - MODE
      ?auto_4937880 - DIRECTION
      ?auto_4937879 - MODE
      ?auto_4937881 - DIRECTION
      ?auto_4937882 - MODE
    )
    :vars
    (
      ?auto_4937883 - INSTRUMENT
      ?auto_4937885 - SATELLITE
      ?auto_4937884 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4937878 ?auto_4937876 ) ) ( not ( = ?auto_4937880 ?auto_4937876 ) ) ( not ( = ?auto_4937880 ?auto_4937878 ) ) ( not ( = ?auto_4937881 ?auto_4937876 ) ) ( not ( = ?auto_4937881 ?auto_4937878 ) ) ( not ( = ?auto_4937881 ?auto_4937880 ) ) ( ON_BOARD ?auto_4937883 ?auto_4937885 ) ( SUPPORTS ?auto_4937883 ?auto_4937877 ) ( not ( = ?auto_4937876 ?auto_4937884 ) ) ( HAVE_IMAGE ?auto_4937878 ?auto_4937875 ) ( not ( = ?auto_4937878 ?auto_4937884 ) ) ( not ( = ?auto_4937875 ?auto_4937877 ) ) ( CALIBRATION_TARGET ?auto_4937883 ?auto_4937884 ) ( POWER_AVAIL ?auto_4937885 ) ( POINTING ?auto_4937885 ?auto_4937880 ) ( not ( = ?auto_4937884 ?auto_4937880 ) ) ( HAVE_IMAGE ?auto_4937880 ?auto_4937879 ) ( HAVE_IMAGE ?auto_4937881 ?auto_4937882 ) ( not ( = ?auto_4937877 ?auto_4937879 ) ) ( not ( = ?auto_4937877 ?auto_4937882 ) ) ( not ( = ?auto_4937875 ?auto_4937879 ) ) ( not ( = ?auto_4937875 ?auto_4937882 ) ) ( not ( = ?auto_4937879 ?auto_4937882 ) ) ( not ( = ?auto_4937881 ?auto_4937884 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4937878 ?auto_4937875 ?auto_4937876 ?auto_4937877 )
      ( GET-4IMAGE-VERIFY ?auto_4937876 ?auto_4937877 ?auto_4937878 ?auto_4937875 ?auto_4937880 ?auto_4937879 ?auto_4937881 ?auto_4937882 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4938164 - DIRECTION
      ?auto_4938165 - MODE
      ?auto_4938166 - DIRECTION
      ?auto_4938163 - MODE
      ?auto_4938168 - DIRECTION
      ?auto_4938167 - MODE
      ?auto_4938169 - DIRECTION
      ?auto_4938170 - MODE
    )
    :vars
    (
      ?auto_4938171 - INSTRUMENT
      ?auto_4938173 - SATELLITE
      ?auto_4938172 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4938166 ?auto_4938164 ) ) ( not ( = ?auto_4938168 ?auto_4938164 ) ) ( not ( = ?auto_4938168 ?auto_4938166 ) ) ( not ( = ?auto_4938169 ?auto_4938164 ) ) ( not ( = ?auto_4938169 ?auto_4938166 ) ) ( not ( = ?auto_4938169 ?auto_4938168 ) ) ( ON_BOARD ?auto_4938171 ?auto_4938173 ) ( SUPPORTS ?auto_4938171 ?auto_4938165 ) ( not ( = ?auto_4938164 ?auto_4938172 ) ) ( HAVE_IMAGE ?auto_4938168 ?auto_4938167 ) ( not ( = ?auto_4938168 ?auto_4938172 ) ) ( not ( = ?auto_4938167 ?auto_4938165 ) ) ( CALIBRATION_TARGET ?auto_4938171 ?auto_4938172 ) ( POWER_AVAIL ?auto_4938173 ) ( POINTING ?auto_4938173 ?auto_4938166 ) ( not ( = ?auto_4938172 ?auto_4938166 ) ) ( HAVE_IMAGE ?auto_4938166 ?auto_4938163 ) ( HAVE_IMAGE ?auto_4938169 ?auto_4938170 ) ( not ( = ?auto_4938165 ?auto_4938163 ) ) ( not ( = ?auto_4938165 ?auto_4938170 ) ) ( not ( = ?auto_4938163 ?auto_4938167 ) ) ( not ( = ?auto_4938163 ?auto_4938170 ) ) ( not ( = ?auto_4938167 ?auto_4938170 ) ) ( not ( = ?auto_4938169 ?auto_4938172 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4938168 ?auto_4938167 ?auto_4938164 ?auto_4938165 )
      ( GET-4IMAGE-VERIFY ?auto_4938164 ?auto_4938165 ?auto_4938166 ?auto_4938163 ?auto_4938168 ?auto_4938167 ?auto_4938169 ?auto_4938170 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4949410 - DIRECTION
      ?auto_4949411 - MODE
      ?auto_4949412 - DIRECTION
      ?auto_4949409 - MODE
      ?auto_4949414 - DIRECTION
      ?auto_4949413 - MODE
    )
    :vars
    (
      ?auto_4949419 - INSTRUMENT
      ?auto_4949415 - SATELLITE
      ?auto_4949417 - DIRECTION
      ?auto_4949416 - DIRECTION
      ?auto_4949418 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4949412 ?auto_4949410 ) ) ( not ( = ?auto_4949414 ?auto_4949410 ) ) ( not ( = ?auto_4949414 ?auto_4949412 ) ) ( ON_BOARD ?auto_4949419 ?auto_4949415 ) ( SUPPORTS ?auto_4949419 ?auto_4949413 ) ( not ( = ?auto_4949414 ?auto_4949417 ) ) ( HAVE_IMAGE ?auto_4949410 ?auto_4949411 ) ( not ( = ?auto_4949410 ?auto_4949417 ) ) ( not ( = ?auto_4949411 ?auto_4949413 ) ) ( CALIBRATION_TARGET ?auto_4949419 ?auto_4949417 ) ( POINTING ?auto_4949415 ?auto_4949416 ) ( not ( = ?auto_4949417 ?auto_4949416 ) ) ( not ( = ?auto_4949414 ?auto_4949416 ) ) ( not ( = ?auto_4949410 ?auto_4949416 ) ) ( ON_BOARD ?auto_4949418 ?auto_4949415 ) ( POWER_ON ?auto_4949418 ) ( not ( = ?auto_4949419 ?auto_4949418 ) ) ( HAVE_IMAGE ?auto_4949412 ?auto_4949409 ) ( not ( = ?auto_4949411 ?auto_4949409 ) ) ( not ( = ?auto_4949412 ?auto_4949417 ) ) ( not ( = ?auto_4949412 ?auto_4949416 ) ) ( not ( = ?auto_4949409 ?auto_4949413 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4949410 ?auto_4949411 ?auto_4949414 ?auto_4949413 )
      ( GET-3IMAGE-VERIFY ?auto_4949410 ?auto_4949411 ?auto_4949412 ?auto_4949409 ?auto_4949414 ?auto_4949413 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4949442 - DIRECTION
      ?auto_4949443 - MODE
      ?auto_4949444 - DIRECTION
      ?auto_4949441 - MODE
      ?auto_4949446 - DIRECTION
      ?auto_4949445 - MODE
    )
    :vars
    (
      ?auto_4949451 - INSTRUMENT
      ?auto_4949447 - SATELLITE
      ?auto_4949449 - DIRECTION
      ?auto_4949448 - DIRECTION
      ?auto_4949450 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4949444 ?auto_4949442 ) ) ( not ( = ?auto_4949446 ?auto_4949442 ) ) ( not ( = ?auto_4949446 ?auto_4949444 ) ) ( ON_BOARD ?auto_4949451 ?auto_4949447 ) ( SUPPORTS ?auto_4949451 ?auto_4949441 ) ( not ( = ?auto_4949444 ?auto_4949449 ) ) ( HAVE_IMAGE ?auto_4949442 ?auto_4949443 ) ( not ( = ?auto_4949442 ?auto_4949449 ) ) ( not ( = ?auto_4949443 ?auto_4949441 ) ) ( CALIBRATION_TARGET ?auto_4949451 ?auto_4949449 ) ( POINTING ?auto_4949447 ?auto_4949448 ) ( not ( = ?auto_4949449 ?auto_4949448 ) ) ( not ( = ?auto_4949444 ?auto_4949448 ) ) ( not ( = ?auto_4949442 ?auto_4949448 ) ) ( ON_BOARD ?auto_4949450 ?auto_4949447 ) ( POWER_ON ?auto_4949450 ) ( not ( = ?auto_4949451 ?auto_4949450 ) ) ( HAVE_IMAGE ?auto_4949446 ?auto_4949445 ) ( not ( = ?auto_4949443 ?auto_4949445 ) ) ( not ( = ?auto_4949441 ?auto_4949445 ) ) ( not ( = ?auto_4949446 ?auto_4949449 ) ) ( not ( = ?auto_4949446 ?auto_4949448 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4949442 ?auto_4949443 ?auto_4949444 ?auto_4949441 )
      ( GET-3IMAGE-VERIFY ?auto_4949442 ?auto_4949443 ?auto_4949444 ?auto_4949441 ?auto_4949446 ?auto_4949445 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4949616 - DIRECTION
      ?auto_4949617 - MODE
      ?auto_4949618 - DIRECTION
      ?auto_4949615 - MODE
      ?auto_4949620 - DIRECTION
      ?auto_4949619 - MODE
    )
    :vars
    (
      ?auto_4949625 - INSTRUMENT
      ?auto_4949621 - SATELLITE
      ?auto_4949623 - DIRECTION
      ?auto_4949622 - DIRECTION
      ?auto_4949624 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4949618 ?auto_4949616 ) ) ( not ( = ?auto_4949620 ?auto_4949616 ) ) ( not ( = ?auto_4949620 ?auto_4949618 ) ) ( ON_BOARD ?auto_4949625 ?auto_4949621 ) ( SUPPORTS ?auto_4949625 ?auto_4949617 ) ( not ( = ?auto_4949616 ?auto_4949623 ) ) ( HAVE_IMAGE ?auto_4949618 ?auto_4949615 ) ( not ( = ?auto_4949618 ?auto_4949623 ) ) ( not ( = ?auto_4949615 ?auto_4949617 ) ) ( CALIBRATION_TARGET ?auto_4949625 ?auto_4949623 ) ( POINTING ?auto_4949621 ?auto_4949622 ) ( not ( = ?auto_4949623 ?auto_4949622 ) ) ( not ( = ?auto_4949616 ?auto_4949622 ) ) ( not ( = ?auto_4949618 ?auto_4949622 ) ) ( ON_BOARD ?auto_4949624 ?auto_4949621 ) ( POWER_ON ?auto_4949624 ) ( not ( = ?auto_4949625 ?auto_4949624 ) ) ( HAVE_IMAGE ?auto_4949620 ?auto_4949619 ) ( not ( = ?auto_4949617 ?auto_4949619 ) ) ( not ( = ?auto_4949615 ?auto_4949619 ) ) ( not ( = ?auto_4949620 ?auto_4949623 ) ) ( not ( = ?auto_4949620 ?auto_4949622 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4949618 ?auto_4949615 ?auto_4949616 ?auto_4949617 )
      ( GET-3IMAGE-VERIFY ?auto_4949616 ?auto_4949617 ?auto_4949618 ?auto_4949615 ?auto_4949620 ?auto_4949619 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4949890 - DIRECTION
      ?auto_4949891 - MODE
      ?auto_4949892 - DIRECTION
      ?auto_4949889 - MODE
      ?auto_4949894 - DIRECTION
      ?auto_4949893 - MODE
      ?auto_4949895 - DIRECTION
      ?auto_4949896 - MODE
    )
    :vars
    (
      ?auto_4949900 - INSTRUMENT
      ?auto_4949897 - SATELLITE
      ?auto_4949898 - DIRECTION
      ?auto_4949899 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4949892 ?auto_4949890 ) ) ( not ( = ?auto_4949894 ?auto_4949890 ) ) ( not ( = ?auto_4949894 ?auto_4949892 ) ) ( not ( = ?auto_4949895 ?auto_4949890 ) ) ( not ( = ?auto_4949895 ?auto_4949892 ) ) ( not ( = ?auto_4949895 ?auto_4949894 ) ) ( ON_BOARD ?auto_4949900 ?auto_4949897 ) ( SUPPORTS ?auto_4949900 ?auto_4949896 ) ( not ( = ?auto_4949895 ?auto_4949898 ) ) ( HAVE_IMAGE ?auto_4949890 ?auto_4949891 ) ( not ( = ?auto_4949890 ?auto_4949898 ) ) ( not ( = ?auto_4949891 ?auto_4949896 ) ) ( CALIBRATION_TARGET ?auto_4949900 ?auto_4949898 ) ( POINTING ?auto_4949897 ?auto_4949894 ) ( not ( = ?auto_4949898 ?auto_4949894 ) ) ( ON_BOARD ?auto_4949899 ?auto_4949897 ) ( POWER_ON ?auto_4949899 ) ( not ( = ?auto_4949900 ?auto_4949899 ) ) ( HAVE_IMAGE ?auto_4949892 ?auto_4949889 ) ( HAVE_IMAGE ?auto_4949894 ?auto_4949893 ) ( not ( = ?auto_4949891 ?auto_4949889 ) ) ( not ( = ?auto_4949891 ?auto_4949893 ) ) ( not ( = ?auto_4949892 ?auto_4949898 ) ) ( not ( = ?auto_4949889 ?auto_4949893 ) ) ( not ( = ?auto_4949889 ?auto_4949896 ) ) ( not ( = ?auto_4949893 ?auto_4949896 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4949890 ?auto_4949891 ?auto_4949895 ?auto_4949896 )
      ( GET-4IMAGE-VERIFY ?auto_4949890 ?auto_4949891 ?auto_4949892 ?auto_4949889 ?auto_4949894 ?auto_4949893 ?auto_4949895 ?auto_4949896 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4949928 - DIRECTION
      ?auto_4949929 - MODE
      ?auto_4949930 - DIRECTION
      ?auto_4949927 - MODE
      ?auto_4949932 - DIRECTION
      ?auto_4949931 - MODE
      ?auto_4949933 - DIRECTION
      ?auto_4949934 - MODE
    )
    :vars
    (
      ?auto_4949938 - INSTRUMENT
      ?auto_4949935 - SATELLITE
      ?auto_4949936 - DIRECTION
      ?auto_4949937 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4949930 ?auto_4949928 ) ) ( not ( = ?auto_4949932 ?auto_4949928 ) ) ( not ( = ?auto_4949932 ?auto_4949930 ) ) ( not ( = ?auto_4949933 ?auto_4949928 ) ) ( not ( = ?auto_4949933 ?auto_4949930 ) ) ( not ( = ?auto_4949933 ?auto_4949932 ) ) ( ON_BOARD ?auto_4949938 ?auto_4949935 ) ( SUPPORTS ?auto_4949938 ?auto_4949931 ) ( not ( = ?auto_4949932 ?auto_4949936 ) ) ( HAVE_IMAGE ?auto_4949928 ?auto_4949929 ) ( not ( = ?auto_4949928 ?auto_4949936 ) ) ( not ( = ?auto_4949929 ?auto_4949931 ) ) ( CALIBRATION_TARGET ?auto_4949938 ?auto_4949936 ) ( POINTING ?auto_4949935 ?auto_4949933 ) ( not ( = ?auto_4949936 ?auto_4949933 ) ) ( ON_BOARD ?auto_4949937 ?auto_4949935 ) ( POWER_ON ?auto_4949937 ) ( not ( = ?auto_4949938 ?auto_4949937 ) ) ( HAVE_IMAGE ?auto_4949930 ?auto_4949927 ) ( HAVE_IMAGE ?auto_4949933 ?auto_4949934 ) ( not ( = ?auto_4949929 ?auto_4949927 ) ) ( not ( = ?auto_4949929 ?auto_4949934 ) ) ( not ( = ?auto_4949930 ?auto_4949936 ) ) ( not ( = ?auto_4949927 ?auto_4949931 ) ) ( not ( = ?auto_4949927 ?auto_4949934 ) ) ( not ( = ?auto_4949931 ?auto_4949934 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4949928 ?auto_4949929 ?auto_4949932 ?auto_4949931 )
      ( GET-4IMAGE-VERIFY ?auto_4949928 ?auto_4949929 ?auto_4949930 ?auto_4949927 ?auto_4949932 ?auto_4949931 ?auto_4949933 ?auto_4949934 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4949965 - DIRECTION
      ?auto_4949966 - MODE
      ?auto_4949967 - DIRECTION
      ?auto_4949964 - MODE
      ?auto_4949969 - DIRECTION
      ?auto_4949968 - MODE
      ?auto_4949970 - DIRECTION
      ?auto_4949971 - MODE
    )
    :vars
    (
      ?auto_4949975 - INSTRUMENT
      ?auto_4949972 - SATELLITE
      ?auto_4949973 - DIRECTION
      ?auto_4949974 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4949967 ?auto_4949965 ) ) ( not ( = ?auto_4949969 ?auto_4949965 ) ) ( not ( = ?auto_4949969 ?auto_4949967 ) ) ( not ( = ?auto_4949970 ?auto_4949965 ) ) ( not ( = ?auto_4949970 ?auto_4949967 ) ) ( not ( = ?auto_4949970 ?auto_4949969 ) ) ( ON_BOARD ?auto_4949975 ?auto_4949972 ) ( SUPPORTS ?auto_4949975 ?auto_4949971 ) ( not ( = ?auto_4949970 ?auto_4949973 ) ) ( HAVE_IMAGE ?auto_4949965 ?auto_4949966 ) ( not ( = ?auto_4949965 ?auto_4949973 ) ) ( not ( = ?auto_4949966 ?auto_4949971 ) ) ( CALIBRATION_TARGET ?auto_4949975 ?auto_4949973 ) ( POINTING ?auto_4949972 ?auto_4949967 ) ( not ( = ?auto_4949973 ?auto_4949967 ) ) ( ON_BOARD ?auto_4949974 ?auto_4949972 ) ( POWER_ON ?auto_4949974 ) ( not ( = ?auto_4949975 ?auto_4949974 ) ) ( HAVE_IMAGE ?auto_4949967 ?auto_4949964 ) ( HAVE_IMAGE ?auto_4949969 ?auto_4949968 ) ( not ( = ?auto_4949966 ?auto_4949964 ) ) ( not ( = ?auto_4949966 ?auto_4949968 ) ) ( not ( = ?auto_4949964 ?auto_4949968 ) ) ( not ( = ?auto_4949964 ?auto_4949971 ) ) ( not ( = ?auto_4949969 ?auto_4949973 ) ) ( not ( = ?auto_4949968 ?auto_4949971 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4949965 ?auto_4949966 ?auto_4949970 ?auto_4949971 )
      ( GET-4IMAGE-VERIFY ?auto_4949965 ?auto_4949966 ?auto_4949967 ?auto_4949964 ?auto_4949969 ?auto_4949968 ?auto_4949970 ?auto_4949971 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4950001 - DIRECTION
      ?auto_4950002 - MODE
      ?auto_4950003 - DIRECTION
      ?auto_4950000 - MODE
      ?auto_4950005 - DIRECTION
      ?auto_4950004 - MODE
      ?auto_4950006 - DIRECTION
      ?auto_4950007 - MODE
    )
    :vars
    (
      ?auto_4950011 - INSTRUMENT
      ?auto_4950008 - SATELLITE
      ?auto_4950009 - DIRECTION
      ?auto_4950010 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4950003 ?auto_4950001 ) ) ( not ( = ?auto_4950005 ?auto_4950001 ) ) ( not ( = ?auto_4950005 ?auto_4950003 ) ) ( not ( = ?auto_4950006 ?auto_4950001 ) ) ( not ( = ?auto_4950006 ?auto_4950003 ) ) ( not ( = ?auto_4950006 ?auto_4950005 ) ) ( ON_BOARD ?auto_4950011 ?auto_4950008 ) ( SUPPORTS ?auto_4950011 ?auto_4950004 ) ( not ( = ?auto_4950005 ?auto_4950009 ) ) ( HAVE_IMAGE ?auto_4950001 ?auto_4950002 ) ( not ( = ?auto_4950001 ?auto_4950009 ) ) ( not ( = ?auto_4950002 ?auto_4950004 ) ) ( CALIBRATION_TARGET ?auto_4950011 ?auto_4950009 ) ( POINTING ?auto_4950008 ?auto_4950003 ) ( not ( = ?auto_4950009 ?auto_4950003 ) ) ( ON_BOARD ?auto_4950010 ?auto_4950008 ) ( POWER_ON ?auto_4950010 ) ( not ( = ?auto_4950011 ?auto_4950010 ) ) ( HAVE_IMAGE ?auto_4950003 ?auto_4950000 ) ( HAVE_IMAGE ?auto_4950006 ?auto_4950007 ) ( not ( = ?auto_4950002 ?auto_4950000 ) ) ( not ( = ?auto_4950002 ?auto_4950007 ) ) ( not ( = ?auto_4950000 ?auto_4950004 ) ) ( not ( = ?auto_4950000 ?auto_4950007 ) ) ( not ( = ?auto_4950004 ?auto_4950007 ) ) ( not ( = ?auto_4950006 ?auto_4950009 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4950001 ?auto_4950002 ?auto_4950005 ?auto_4950004 )
      ( GET-4IMAGE-VERIFY ?auto_4950001 ?auto_4950002 ?auto_4950003 ?auto_4950000 ?auto_4950005 ?auto_4950004 ?auto_4950006 ?auto_4950007 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4950114 - DIRECTION
      ?auto_4950115 - MODE
      ?auto_4950116 - DIRECTION
      ?auto_4950113 - MODE
      ?auto_4950118 - DIRECTION
      ?auto_4950117 - MODE
      ?auto_4950119 - DIRECTION
      ?auto_4950120 - MODE
    )
    :vars
    (
      ?auto_4950124 - INSTRUMENT
      ?auto_4950121 - SATELLITE
      ?auto_4950122 - DIRECTION
      ?auto_4950123 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4950116 ?auto_4950114 ) ) ( not ( = ?auto_4950118 ?auto_4950114 ) ) ( not ( = ?auto_4950118 ?auto_4950116 ) ) ( not ( = ?auto_4950119 ?auto_4950114 ) ) ( not ( = ?auto_4950119 ?auto_4950116 ) ) ( not ( = ?auto_4950119 ?auto_4950118 ) ) ( ON_BOARD ?auto_4950124 ?auto_4950121 ) ( SUPPORTS ?auto_4950124 ?auto_4950113 ) ( not ( = ?auto_4950116 ?auto_4950122 ) ) ( HAVE_IMAGE ?auto_4950114 ?auto_4950115 ) ( not ( = ?auto_4950114 ?auto_4950122 ) ) ( not ( = ?auto_4950115 ?auto_4950113 ) ) ( CALIBRATION_TARGET ?auto_4950124 ?auto_4950122 ) ( POINTING ?auto_4950121 ?auto_4950119 ) ( not ( = ?auto_4950122 ?auto_4950119 ) ) ( ON_BOARD ?auto_4950123 ?auto_4950121 ) ( POWER_ON ?auto_4950123 ) ( not ( = ?auto_4950124 ?auto_4950123 ) ) ( HAVE_IMAGE ?auto_4950118 ?auto_4950117 ) ( HAVE_IMAGE ?auto_4950119 ?auto_4950120 ) ( not ( = ?auto_4950115 ?auto_4950117 ) ) ( not ( = ?auto_4950115 ?auto_4950120 ) ) ( not ( = ?auto_4950113 ?auto_4950117 ) ) ( not ( = ?auto_4950113 ?auto_4950120 ) ) ( not ( = ?auto_4950118 ?auto_4950122 ) ) ( not ( = ?auto_4950117 ?auto_4950120 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4950114 ?auto_4950115 ?auto_4950116 ?auto_4950113 )
      ( GET-4IMAGE-VERIFY ?auto_4950114 ?auto_4950115 ?auto_4950116 ?auto_4950113 ?auto_4950118 ?auto_4950117 ?auto_4950119 ?auto_4950120 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4950151 - DIRECTION
      ?auto_4950152 - MODE
      ?auto_4950153 - DIRECTION
      ?auto_4950150 - MODE
      ?auto_4950155 - DIRECTION
      ?auto_4950154 - MODE
      ?auto_4950156 - DIRECTION
      ?auto_4950157 - MODE
    )
    :vars
    (
      ?auto_4950161 - INSTRUMENT
      ?auto_4950158 - SATELLITE
      ?auto_4950159 - DIRECTION
      ?auto_4950160 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4950153 ?auto_4950151 ) ) ( not ( = ?auto_4950155 ?auto_4950151 ) ) ( not ( = ?auto_4950155 ?auto_4950153 ) ) ( not ( = ?auto_4950156 ?auto_4950151 ) ) ( not ( = ?auto_4950156 ?auto_4950153 ) ) ( not ( = ?auto_4950156 ?auto_4950155 ) ) ( ON_BOARD ?auto_4950161 ?auto_4950158 ) ( SUPPORTS ?auto_4950161 ?auto_4950150 ) ( not ( = ?auto_4950153 ?auto_4950159 ) ) ( HAVE_IMAGE ?auto_4950151 ?auto_4950152 ) ( not ( = ?auto_4950151 ?auto_4950159 ) ) ( not ( = ?auto_4950152 ?auto_4950150 ) ) ( CALIBRATION_TARGET ?auto_4950161 ?auto_4950159 ) ( POINTING ?auto_4950158 ?auto_4950155 ) ( not ( = ?auto_4950159 ?auto_4950155 ) ) ( ON_BOARD ?auto_4950160 ?auto_4950158 ) ( POWER_ON ?auto_4950160 ) ( not ( = ?auto_4950161 ?auto_4950160 ) ) ( HAVE_IMAGE ?auto_4950155 ?auto_4950154 ) ( HAVE_IMAGE ?auto_4950156 ?auto_4950157 ) ( not ( = ?auto_4950152 ?auto_4950154 ) ) ( not ( = ?auto_4950152 ?auto_4950157 ) ) ( not ( = ?auto_4950150 ?auto_4950154 ) ) ( not ( = ?auto_4950150 ?auto_4950157 ) ) ( not ( = ?auto_4950154 ?auto_4950157 ) ) ( not ( = ?auto_4950156 ?auto_4950159 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4950151 ?auto_4950152 ?auto_4950153 ?auto_4950150 )
      ( GET-4IMAGE-VERIFY ?auto_4950151 ?auto_4950152 ?auto_4950153 ?auto_4950150 ?auto_4950155 ?auto_4950154 ?auto_4950156 ?auto_4950157 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4950727 - DIRECTION
      ?auto_4950728 - MODE
      ?auto_4950729 - DIRECTION
      ?auto_4950726 - MODE
      ?auto_4950731 - DIRECTION
      ?auto_4950730 - MODE
      ?auto_4950732 - DIRECTION
      ?auto_4950733 - MODE
    )
    :vars
    (
      ?auto_4950737 - INSTRUMENT
      ?auto_4950734 - SATELLITE
      ?auto_4950735 - DIRECTION
      ?auto_4950736 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4950729 ?auto_4950727 ) ) ( not ( = ?auto_4950731 ?auto_4950727 ) ) ( not ( = ?auto_4950731 ?auto_4950729 ) ) ( not ( = ?auto_4950732 ?auto_4950727 ) ) ( not ( = ?auto_4950732 ?auto_4950729 ) ) ( not ( = ?auto_4950732 ?auto_4950731 ) ) ( ON_BOARD ?auto_4950737 ?auto_4950734 ) ( SUPPORTS ?auto_4950737 ?auto_4950733 ) ( not ( = ?auto_4950732 ?auto_4950735 ) ) ( HAVE_IMAGE ?auto_4950729 ?auto_4950726 ) ( not ( = ?auto_4950729 ?auto_4950735 ) ) ( not ( = ?auto_4950726 ?auto_4950733 ) ) ( CALIBRATION_TARGET ?auto_4950737 ?auto_4950735 ) ( POINTING ?auto_4950734 ?auto_4950727 ) ( not ( = ?auto_4950735 ?auto_4950727 ) ) ( ON_BOARD ?auto_4950736 ?auto_4950734 ) ( POWER_ON ?auto_4950736 ) ( not ( = ?auto_4950737 ?auto_4950736 ) ) ( HAVE_IMAGE ?auto_4950727 ?auto_4950728 ) ( HAVE_IMAGE ?auto_4950731 ?auto_4950730 ) ( not ( = ?auto_4950728 ?auto_4950726 ) ) ( not ( = ?auto_4950728 ?auto_4950730 ) ) ( not ( = ?auto_4950728 ?auto_4950733 ) ) ( not ( = ?auto_4950726 ?auto_4950730 ) ) ( not ( = ?auto_4950731 ?auto_4950735 ) ) ( not ( = ?auto_4950730 ?auto_4950733 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4950729 ?auto_4950726 ?auto_4950732 ?auto_4950733 )
      ( GET-4IMAGE-VERIFY ?auto_4950727 ?auto_4950728 ?auto_4950729 ?auto_4950726 ?auto_4950731 ?auto_4950730 ?auto_4950732 ?auto_4950733 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4950763 - DIRECTION
      ?auto_4950764 - MODE
      ?auto_4950765 - DIRECTION
      ?auto_4950762 - MODE
      ?auto_4950767 - DIRECTION
      ?auto_4950766 - MODE
      ?auto_4950768 - DIRECTION
      ?auto_4950769 - MODE
    )
    :vars
    (
      ?auto_4950773 - INSTRUMENT
      ?auto_4950770 - SATELLITE
      ?auto_4950771 - DIRECTION
      ?auto_4950772 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4950765 ?auto_4950763 ) ) ( not ( = ?auto_4950767 ?auto_4950763 ) ) ( not ( = ?auto_4950767 ?auto_4950765 ) ) ( not ( = ?auto_4950768 ?auto_4950763 ) ) ( not ( = ?auto_4950768 ?auto_4950765 ) ) ( not ( = ?auto_4950768 ?auto_4950767 ) ) ( ON_BOARD ?auto_4950773 ?auto_4950770 ) ( SUPPORTS ?auto_4950773 ?auto_4950766 ) ( not ( = ?auto_4950767 ?auto_4950771 ) ) ( HAVE_IMAGE ?auto_4950765 ?auto_4950762 ) ( not ( = ?auto_4950765 ?auto_4950771 ) ) ( not ( = ?auto_4950762 ?auto_4950766 ) ) ( CALIBRATION_TARGET ?auto_4950773 ?auto_4950771 ) ( POINTING ?auto_4950770 ?auto_4950763 ) ( not ( = ?auto_4950771 ?auto_4950763 ) ) ( ON_BOARD ?auto_4950772 ?auto_4950770 ) ( POWER_ON ?auto_4950772 ) ( not ( = ?auto_4950773 ?auto_4950772 ) ) ( HAVE_IMAGE ?auto_4950763 ?auto_4950764 ) ( HAVE_IMAGE ?auto_4950768 ?auto_4950769 ) ( not ( = ?auto_4950764 ?auto_4950762 ) ) ( not ( = ?auto_4950764 ?auto_4950766 ) ) ( not ( = ?auto_4950764 ?auto_4950769 ) ) ( not ( = ?auto_4950762 ?auto_4950769 ) ) ( not ( = ?auto_4950766 ?auto_4950769 ) ) ( not ( = ?auto_4950768 ?auto_4950771 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4950765 ?auto_4950762 ?auto_4950767 ?auto_4950766 )
      ( GET-4IMAGE-VERIFY ?auto_4950763 ?auto_4950764 ?auto_4950765 ?auto_4950762 ?auto_4950767 ?auto_4950766 ?auto_4950768 ?auto_4950769 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4950991 - DIRECTION
      ?auto_4950992 - MODE
      ?auto_4950993 - DIRECTION
      ?auto_4950990 - MODE
      ?auto_4950995 - DIRECTION
      ?auto_4950994 - MODE
      ?auto_4950996 - DIRECTION
      ?auto_4950997 - MODE
    )
    :vars
    (
      ?auto_4951001 - INSTRUMENT
      ?auto_4950998 - SATELLITE
      ?auto_4950999 - DIRECTION
      ?auto_4951000 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4950993 ?auto_4950991 ) ) ( not ( = ?auto_4950995 ?auto_4950991 ) ) ( not ( = ?auto_4950995 ?auto_4950993 ) ) ( not ( = ?auto_4950996 ?auto_4950991 ) ) ( not ( = ?auto_4950996 ?auto_4950993 ) ) ( not ( = ?auto_4950996 ?auto_4950995 ) ) ( ON_BOARD ?auto_4951001 ?auto_4950998 ) ( SUPPORTS ?auto_4951001 ?auto_4950990 ) ( not ( = ?auto_4950993 ?auto_4950999 ) ) ( HAVE_IMAGE ?auto_4950995 ?auto_4950994 ) ( not ( = ?auto_4950995 ?auto_4950999 ) ) ( not ( = ?auto_4950994 ?auto_4950990 ) ) ( CALIBRATION_TARGET ?auto_4951001 ?auto_4950999 ) ( POINTING ?auto_4950998 ?auto_4950991 ) ( not ( = ?auto_4950999 ?auto_4950991 ) ) ( ON_BOARD ?auto_4951000 ?auto_4950998 ) ( POWER_ON ?auto_4951000 ) ( not ( = ?auto_4951001 ?auto_4951000 ) ) ( HAVE_IMAGE ?auto_4950991 ?auto_4950992 ) ( HAVE_IMAGE ?auto_4950996 ?auto_4950997 ) ( not ( = ?auto_4950992 ?auto_4950990 ) ) ( not ( = ?auto_4950992 ?auto_4950994 ) ) ( not ( = ?auto_4950992 ?auto_4950997 ) ) ( not ( = ?auto_4950990 ?auto_4950997 ) ) ( not ( = ?auto_4950994 ?auto_4950997 ) ) ( not ( = ?auto_4950996 ?auto_4950999 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4950995 ?auto_4950994 ?auto_4950993 ?auto_4950990 )
      ( GET-4IMAGE-VERIFY ?auto_4950991 ?auto_4950992 ?auto_4950993 ?auto_4950990 ?auto_4950995 ?auto_4950994 ?auto_4950996 ?auto_4950997 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4951262 - DIRECTION
      ?auto_4951263 - MODE
      ?auto_4951264 - DIRECTION
      ?auto_4951261 - MODE
      ?auto_4951266 - DIRECTION
      ?auto_4951265 - MODE
      ?auto_4951267 - DIRECTION
      ?auto_4951268 - MODE
    )
    :vars
    (
      ?auto_4951272 - INSTRUMENT
      ?auto_4951269 - SATELLITE
      ?auto_4951270 - DIRECTION
      ?auto_4951271 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4951264 ?auto_4951262 ) ) ( not ( = ?auto_4951266 ?auto_4951262 ) ) ( not ( = ?auto_4951266 ?auto_4951264 ) ) ( not ( = ?auto_4951267 ?auto_4951262 ) ) ( not ( = ?auto_4951267 ?auto_4951264 ) ) ( not ( = ?auto_4951267 ?auto_4951266 ) ) ( ON_BOARD ?auto_4951272 ?auto_4951269 ) ( SUPPORTS ?auto_4951272 ?auto_4951263 ) ( not ( = ?auto_4951262 ?auto_4951270 ) ) ( HAVE_IMAGE ?auto_4951264 ?auto_4951261 ) ( not ( = ?auto_4951264 ?auto_4951270 ) ) ( not ( = ?auto_4951261 ?auto_4951263 ) ) ( CALIBRATION_TARGET ?auto_4951272 ?auto_4951270 ) ( POINTING ?auto_4951269 ?auto_4951267 ) ( not ( = ?auto_4951270 ?auto_4951267 ) ) ( ON_BOARD ?auto_4951271 ?auto_4951269 ) ( POWER_ON ?auto_4951271 ) ( not ( = ?auto_4951272 ?auto_4951271 ) ) ( HAVE_IMAGE ?auto_4951266 ?auto_4951265 ) ( HAVE_IMAGE ?auto_4951267 ?auto_4951268 ) ( not ( = ?auto_4951263 ?auto_4951265 ) ) ( not ( = ?auto_4951263 ?auto_4951268 ) ) ( not ( = ?auto_4951261 ?auto_4951265 ) ) ( not ( = ?auto_4951261 ?auto_4951268 ) ) ( not ( = ?auto_4951266 ?auto_4951270 ) ) ( not ( = ?auto_4951265 ?auto_4951268 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4951264 ?auto_4951261 ?auto_4951262 ?auto_4951263 )
      ( GET-4IMAGE-VERIFY ?auto_4951262 ?auto_4951263 ?auto_4951264 ?auto_4951261 ?auto_4951266 ?auto_4951265 ?auto_4951267 ?auto_4951268 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4951299 - DIRECTION
      ?auto_4951300 - MODE
      ?auto_4951301 - DIRECTION
      ?auto_4951298 - MODE
      ?auto_4951303 - DIRECTION
      ?auto_4951302 - MODE
      ?auto_4951304 - DIRECTION
      ?auto_4951305 - MODE
    )
    :vars
    (
      ?auto_4951309 - INSTRUMENT
      ?auto_4951306 - SATELLITE
      ?auto_4951307 - DIRECTION
      ?auto_4951308 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4951301 ?auto_4951299 ) ) ( not ( = ?auto_4951303 ?auto_4951299 ) ) ( not ( = ?auto_4951303 ?auto_4951301 ) ) ( not ( = ?auto_4951304 ?auto_4951299 ) ) ( not ( = ?auto_4951304 ?auto_4951301 ) ) ( not ( = ?auto_4951304 ?auto_4951303 ) ) ( ON_BOARD ?auto_4951309 ?auto_4951306 ) ( SUPPORTS ?auto_4951309 ?auto_4951300 ) ( not ( = ?auto_4951299 ?auto_4951307 ) ) ( HAVE_IMAGE ?auto_4951301 ?auto_4951298 ) ( not ( = ?auto_4951301 ?auto_4951307 ) ) ( not ( = ?auto_4951298 ?auto_4951300 ) ) ( CALIBRATION_TARGET ?auto_4951309 ?auto_4951307 ) ( POINTING ?auto_4951306 ?auto_4951303 ) ( not ( = ?auto_4951307 ?auto_4951303 ) ) ( ON_BOARD ?auto_4951308 ?auto_4951306 ) ( POWER_ON ?auto_4951308 ) ( not ( = ?auto_4951309 ?auto_4951308 ) ) ( HAVE_IMAGE ?auto_4951303 ?auto_4951302 ) ( HAVE_IMAGE ?auto_4951304 ?auto_4951305 ) ( not ( = ?auto_4951300 ?auto_4951302 ) ) ( not ( = ?auto_4951300 ?auto_4951305 ) ) ( not ( = ?auto_4951298 ?auto_4951302 ) ) ( not ( = ?auto_4951298 ?auto_4951305 ) ) ( not ( = ?auto_4951302 ?auto_4951305 ) ) ( not ( = ?auto_4951304 ?auto_4951307 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4951301 ?auto_4951298 ?auto_4951299 ?auto_4951300 )
      ( GET-4IMAGE-VERIFY ?auto_4951299 ?auto_4951300 ?auto_4951301 ?auto_4951298 ?auto_4951303 ?auto_4951302 ?auto_4951304 ?auto_4951305 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4951609 - DIRECTION
      ?auto_4951610 - MODE
      ?auto_4951611 - DIRECTION
      ?auto_4951608 - MODE
      ?auto_4951613 - DIRECTION
      ?auto_4951612 - MODE
      ?auto_4951614 - DIRECTION
      ?auto_4951615 - MODE
    )
    :vars
    (
      ?auto_4951619 - INSTRUMENT
      ?auto_4951616 - SATELLITE
      ?auto_4951617 - DIRECTION
      ?auto_4951618 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4951611 ?auto_4951609 ) ) ( not ( = ?auto_4951613 ?auto_4951609 ) ) ( not ( = ?auto_4951613 ?auto_4951611 ) ) ( not ( = ?auto_4951614 ?auto_4951609 ) ) ( not ( = ?auto_4951614 ?auto_4951611 ) ) ( not ( = ?auto_4951614 ?auto_4951613 ) ) ( ON_BOARD ?auto_4951619 ?auto_4951616 ) ( SUPPORTS ?auto_4951619 ?auto_4951610 ) ( not ( = ?auto_4951609 ?auto_4951617 ) ) ( HAVE_IMAGE ?auto_4951613 ?auto_4951612 ) ( not ( = ?auto_4951613 ?auto_4951617 ) ) ( not ( = ?auto_4951612 ?auto_4951610 ) ) ( CALIBRATION_TARGET ?auto_4951619 ?auto_4951617 ) ( POINTING ?auto_4951616 ?auto_4951611 ) ( not ( = ?auto_4951617 ?auto_4951611 ) ) ( ON_BOARD ?auto_4951618 ?auto_4951616 ) ( POWER_ON ?auto_4951618 ) ( not ( = ?auto_4951619 ?auto_4951618 ) ) ( HAVE_IMAGE ?auto_4951611 ?auto_4951608 ) ( HAVE_IMAGE ?auto_4951614 ?auto_4951615 ) ( not ( = ?auto_4951610 ?auto_4951608 ) ) ( not ( = ?auto_4951610 ?auto_4951615 ) ) ( not ( = ?auto_4951608 ?auto_4951612 ) ) ( not ( = ?auto_4951608 ?auto_4951615 ) ) ( not ( = ?auto_4951612 ?auto_4951615 ) ) ( not ( = ?auto_4951614 ?auto_4951617 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4951613 ?auto_4951612 ?auto_4951609 ?auto_4951610 )
      ( GET-4IMAGE-VERIFY ?auto_4951609 ?auto_4951610 ?auto_4951611 ?auto_4951608 ?auto_4951613 ?auto_4951612 ?auto_4951614 ?auto_4951615 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4992314 - DIRECTION
      ?auto_4992315 - MODE
      ?auto_4992316 - DIRECTION
      ?auto_4992313 - MODE
      ?auto_4992318 - DIRECTION
      ?auto_4992317 - MODE
    )
    :vars
    (
      ?auto_4992320 - INSTRUMENT
      ?auto_4992319 - SATELLITE
      ?auto_4992321 - DIRECTION
      ?auto_4992322 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4992316 ?auto_4992314 ) ) ( not ( = ?auto_4992318 ?auto_4992314 ) ) ( not ( = ?auto_4992318 ?auto_4992316 ) ) ( ON_BOARD ?auto_4992320 ?auto_4992319 ) ( SUPPORTS ?auto_4992320 ?auto_4992317 ) ( not ( = ?auto_4992318 ?auto_4992321 ) ) ( HAVE_IMAGE ?auto_4992314 ?auto_4992315 ) ( not ( = ?auto_4992314 ?auto_4992321 ) ) ( not ( = ?auto_4992315 ?auto_4992317 ) ) ( CALIBRATION_TARGET ?auto_4992320 ?auto_4992321 ) ( not ( = ?auto_4992321 ?auto_4992316 ) ) ( ON_BOARD ?auto_4992322 ?auto_4992319 ) ( POWER_ON ?auto_4992322 ) ( not ( = ?auto_4992320 ?auto_4992322 ) ) ( POINTING ?auto_4992319 ?auto_4992321 ) ( HAVE_IMAGE ?auto_4992316 ?auto_4992313 ) ( not ( = ?auto_4992315 ?auto_4992313 ) ) ( not ( = ?auto_4992313 ?auto_4992317 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4992314 ?auto_4992315 ?auto_4992318 ?auto_4992317 )
      ( GET-3IMAGE-VERIFY ?auto_4992314 ?auto_4992315 ?auto_4992316 ?auto_4992313 ?auto_4992318 ?auto_4992317 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4992346 - DIRECTION
      ?auto_4992347 - MODE
      ?auto_4992348 - DIRECTION
      ?auto_4992345 - MODE
      ?auto_4992350 - DIRECTION
      ?auto_4992349 - MODE
    )
    :vars
    (
      ?auto_4992352 - INSTRUMENT
      ?auto_4992351 - SATELLITE
      ?auto_4992353 - DIRECTION
      ?auto_4992354 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4992348 ?auto_4992346 ) ) ( not ( = ?auto_4992350 ?auto_4992346 ) ) ( not ( = ?auto_4992350 ?auto_4992348 ) ) ( ON_BOARD ?auto_4992352 ?auto_4992351 ) ( SUPPORTS ?auto_4992352 ?auto_4992345 ) ( not ( = ?auto_4992348 ?auto_4992353 ) ) ( HAVE_IMAGE ?auto_4992346 ?auto_4992347 ) ( not ( = ?auto_4992346 ?auto_4992353 ) ) ( not ( = ?auto_4992347 ?auto_4992345 ) ) ( CALIBRATION_TARGET ?auto_4992352 ?auto_4992353 ) ( not ( = ?auto_4992353 ?auto_4992350 ) ) ( ON_BOARD ?auto_4992354 ?auto_4992351 ) ( POWER_ON ?auto_4992354 ) ( not ( = ?auto_4992352 ?auto_4992354 ) ) ( POINTING ?auto_4992351 ?auto_4992353 ) ( HAVE_IMAGE ?auto_4992350 ?auto_4992349 ) ( not ( = ?auto_4992347 ?auto_4992349 ) ) ( not ( = ?auto_4992345 ?auto_4992349 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4992346 ?auto_4992347 ?auto_4992348 ?auto_4992345 )
      ( GET-3IMAGE-VERIFY ?auto_4992346 ?auto_4992347 ?auto_4992348 ?auto_4992345 ?auto_4992350 ?auto_4992349 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4978038 - DIRECTION
      ?auto_4978039 - MODE
      ?auto_4978040 - DIRECTION
      ?auto_4978037 - MODE
      ?auto_4978042 - DIRECTION
      ?auto_4978041 - MODE
    )
    :vars
    (
      ?auto_4978047 - INSTRUMENT
      ?auto_4978043 - SATELLITE
      ?auto_4978045 - DIRECTION
      ?auto_4978044 - DIRECTION
      ?auto_4978046 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4978040 ?auto_4978038 ) ) ( not ( = ?auto_4978042 ?auto_4978038 ) ) ( not ( = ?auto_4978042 ?auto_4978040 ) ) ( ON_BOARD ?auto_4978047 ?auto_4978043 ) ( SUPPORTS ?auto_4978047 ?auto_4978041 ) ( not ( = ?auto_4978042 ?auto_4978045 ) ) ( HAVE_IMAGE ?auto_4978040 ?auto_4978037 ) ( not ( = ?auto_4978040 ?auto_4978045 ) ) ( not ( = ?auto_4978037 ?auto_4978041 ) ) ( CALIBRATION_TARGET ?auto_4978047 ?auto_4978045 ) ( not ( = ?auto_4978045 ?auto_4978044 ) ) ( not ( = ?auto_4978042 ?auto_4978044 ) ) ( not ( = ?auto_4978040 ?auto_4978044 ) ) ( ON_BOARD ?auto_4978046 ?auto_4978043 ) ( POWER_ON ?auto_4978046 ) ( not ( = ?auto_4978047 ?auto_4978046 ) ) ( POINTING ?auto_4978043 ?auto_4978045 ) ( HAVE_IMAGE ?auto_4978038 ?auto_4978039 ) ( not ( = ?auto_4978038 ?auto_4978045 ) ) ( not ( = ?auto_4978038 ?auto_4978044 ) ) ( not ( = ?auto_4978039 ?auto_4978037 ) ) ( not ( = ?auto_4978039 ?auto_4978041 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4978040 ?auto_4978037 ?auto_4978042 ?auto_4978041 )
      ( GET-3IMAGE-VERIFY ?auto_4978038 ?auto_4978039 ?auto_4978040 ?auto_4978037 ?auto_4978042 ?auto_4978041 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4978074 - DIRECTION
      ?auto_4978075 - MODE
      ?auto_4978076 - DIRECTION
      ?auto_4978073 - MODE
      ?auto_4978078 - DIRECTION
      ?auto_4978077 - MODE
    )
    :vars
    (
      ?auto_4978083 - INSTRUMENT
      ?auto_4978079 - SATELLITE
      ?auto_4978081 - DIRECTION
      ?auto_4978080 - DIRECTION
      ?auto_4978082 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4978076 ?auto_4978074 ) ) ( not ( = ?auto_4978078 ?auto_4978074 ) ) ( not ( = ?auto_4978078 ?auto_4978076 ) ) ( ON_BOARD ?auto_4978083 ?auto_4978079 ) ( SUPPORTS ?auto_4978083 ?auto_4978073 ) ( not ( = ?auto_4978076 ?auto_4978081 ) ) ( HAVE_IMAGE ?auto_4978078 ?auto_4978077 ) ( not ( = ?auto_4978078 ?auto_4978081 ) ) ( not ( = ?auto_4978077 ?auto_4978073 ) ) ( CALIBRATION_TARGET ?auto_4978083 ?auto_4978081 ) ( not ( = ?auto_4978081 ?auto_4978080 ) ) ( not ( = ?auto_4978076 ?auto_4978080 ) ) ( not ( = ?auto_4978078 ?auto_4978080 ) ) ( ON_BOARD ?auto_4978082 ?auto_4978079 ) ( POWER_ON ?auto_4978082 ) ( not ( = ?auto_4978083 ?auto_4978082 ) ) ( POINTING ?auto_4978079 ?auto_4978081 ) ( HAVE_IMAGE ?auto_4978074 ?auto_4978075 ) ( not ( = ?auto_4978074 ?auto_4978081 ) ) ( not ( = ?auto_4978074 ?auto_4978080 ) ) ( not ( = ?auto_4978075 ?auto_4978073 ) ) ( not ( = ?auto_4978075 ?auto_4978077 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4978078 ?auto_4978077 ?auto_4978076 ?auto_4978073 )
      ( GET-3IMAGE-VERIFY ?auto_4978074 ?auto_4978075 ?auto_4978076 ?auto_4978073 ?auto_4978078 ?auto_4978077 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4992546 - DIRECTION
      ?auto_4992547 - MODE
      ?auto_4992548 - DIRECTION
      ?auto_4992545 - MODE
      ?auto_4992550 - DIRECTION
      ?auto_4992549 - MODE
    )
    :vars
    (
      ?auto_4992552 - INSTRUMENT
      ?auto_4992551 - SATELLITE
      ?auto_4992553 - DIRECTION
      ?auto_4992554 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4992548 ?auto_4992546 ) ) ( not ( = ?auto_4992550 ?auto_4992546 ) ) ( not ( = ?auto_4992550 ?auto_4992548 ) ) ( ON_BOARD ?auto_4992552 ?auto_4992551 ) ( SUPPORTS ?auto_4992552 ?auto_4992547 ) ( not ( = ?auto_4992546 ?auto_4992553 ) ) ( HAVE_IMAGE ?auto_4992548 ?auto_4992545 ) ( not ( = ?auto_4992548 ?auto_4992553 ) ) ( not ( = ?auto_4992545 ?auto_4992547 ) ) ( CALIBRATION_TARGET ?auto_4992552 ?auto_4992553 ) ( not ( = ?auto_4992553 ?auto_4992550 ) ) ( ON_BOARD ?auto_4992554 ?auto_4992551 ) ( POWER_ON ?auto_4992554 ) ( not ( = ?auto_4992552 ?auto_4992554 ) ) ( POINTING ?auto_4992551 ?auto_4992553 ) ( HAVE_IMAGE ?auto_4992550 ?auto_4992549 ) ( not ( = ?auto_4992547 ?auto_4992549 ) ) ( not ( = ?auto_4992545 ?auto_4992549 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4992548 ?auto_4992545 ?auto_4992546 ?auto_4992547 )
      ( GET-3IMAGE-VERIFY ?auto_4992546 ?auto_4992547 ?auto_4992548 ?auto_4992545 ?auto_4992550 ?auto_4992549 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4978246 - DIRECTION
      ?auto_4978247 - MODE
      ?auto_4978248 - DIRECTION
      ?auto_4978245 - MODE
      ?auto_4978250 - DIRECTION
      ?auto_4978249 - MODE
    )
    :vars
    (
      ?auto_4978255 - INSTRUMENT
      ?auto_4978251 - SATELLITE
      ?auto_4978253 - DIRECTION
      ?auto_4978252 - DIRECTION
      ?auto_4978254 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4978248 ?auto_4978246 ) ) ( not ( = ?auto_4978250 ?auto_4978246 ) ) ( not ( = ?auto_4978250 ?auto_4978248 ) ) ( ON_BOARD ?auto_4978255 ?auto_4978251 ) ( SUPPORTS ?auto_4978255 ?auto_4978247 ) ( not ( = ?auto_4978246 ?auto_4978253 ) ) ( HAVE_IMAGE ?auto_4978250 ?auto_4978249 ) ( not ( = ?auto_4978250 ?auto_4978253 ) ) ( not ( = ?auto_4978249 ?auto_4978247 ) ) ( CALIBRATION_TARGET ?auto_4978255 ?auto_4978253 ) ( not ( = ?auto_4978253 ?auto_4978252 ) ) ( not ( = ?auto_4978246 ?auto_4978252 ) ) ( not ( = ?auto_4978250 ?auto_4978252 ) ) ( ON_BOARD ?auto_4978254 ?auto_4978251 ) ( POWER_ON ?auto_4978254 ) ( not ( = ?auto_4978255 ?auto_4978254 ) ) ( POINTING ?auto_4978251 ?auto_4978253 ) ( HAVE_IMAGE ?auto_4978248 ?auto_4978245 ) ( not ( = ?auto_4978247 ?auto_4978245 ) ) ( not ( = ?auto_4978248 ?auto_4978253 ) ) ( not ( = ?auto_4978248 ?auto_4978252 ) ) ( not ( = ?auto_4978245 ?auto_4978249 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4978250 ?auto_4978249 ?auto_4978246 ?auto_4978247 )
      ( GET-3IMAGE-VERIFY ?auto_4978246 ?auto_4978247 ?auto_4978248 ?auto_4978245 ?auto_4978250 ?auto_4978249 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5227928 - DIRECTION
      ?auto_5227929 - MODE
      ?auto_5227930 - DIRECTION
      ?auto_5227927 - MODE
      ?auto_5227932 - DIRECTION
      ?auto_5227931 - MODE
      ?auto_5227933 - DIRECTION
      ?auto_5227934 - MODE
      ?auto_5227935 - DIRECTION
      ?auto_5227936 - MODE
    )
    :vars
    (
      ?auto_5227938 - INSTRUMENT
      ?auto_5227937 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_5227930 ?auto_5227928 ) ) ( not ( = ?auto_5227932 ?auto_5227928 ) ) ( not ( = ?auto_5227932 ?auto_5227930 ) ) ( not ( = ?auto_5227933 ?auto_5227928 ) ) ( not ( = ?auto_5227933 ?auto_5227930 ) ) ( not ( = ?auto_5227933 ?auto_5227932 ) ) ( not ( = ?auto_5227935 ?auto_5227928 ) ) ( not ( = ?auto_5227935 ?auto_5227930 ) ) ( not ( = ?auto_5227935 ?auto_5227932 ) ) ( not ( = ?auto_5227935 ?auto_5227933 ) ) ( CALIBRATED ?auto_5227938 ) ( ON_BOARD ?auto_5227938 ?auto_5227937 ) ( SUPPORTS ?auto_5227938 ?auto_5227936 ) ( POWER_ON ?auto_5227938 ) ( POINTING ?auto_5227937 ?auto_5227935 ) ( HAVE_IMAGE ?auto_5227928 ?auto_5227929 ) ( HAVE_IMAGE ?auto_5227930 ?auto_5227927 ) ( HAVE_IMAGE ?auto_5227932 ?auto_5227931 ) ( HAVE_IMAGE ?auto_5227933 ?auto_5227934 ) ( not ( = ?auto_5227929 ?auto_5227927 ) ) ( not ( = ?auto_5227929 ?auto_5227931 ) ) ( not ( = ?auto_5227929 ?auto_5227934 ) ) ( not ( = ?auto_5227929 ?auto_5227936 ) ) ( not ( = ?auto_5227927 ?auto_5227931 ) ) ( not ( = ?auto_5227927 ?auto_5227934 ) ) ( not ( = ?auto_5227927 ?auto_5227936 ) ) ( not ( = ?auto_5227931 ?auto_5227934 ) ) ( not ( = ?auto_5227931 ?auto_5227936 ) ) ( not ( = ?auto_5227934 ?auto_5227936 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_5227935 ?auto_5227936 )
      ( GET-5IMAGE-VERIFY ?auto_5227928 ?auto_5227929 ?auto_5227930 ?auto_5227927 ?auto_5227932 ?auto_5227931 ?auto_5227933 ?auto_5227934 ?auto_5227935 ?auto_5227936 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5227976 - DIRECTION
      ?auto_5227977 - MODE
      ?auto_5227978 - DIRECTION
      ?auto_5227975 - MODE
      ?auto_5227980 - DIRECTION
      ?auto_5227979 - MODE
      ?auto_5227981 - DIRECTION
      ?auto_5227982 - MODE
      ?auto_5227983 - DIRECTION
      ?auto_5227984 - MODE
    )
    :vars
    (
      ?auto_5227986 - INSTRUMENT
      ?auto_5227985 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_5227978 ?auto_5227976 ) ) ( not ( = ?auto_5227980 ?auto_5227976 ) ) ( not ( = ?auto_5227980 ?auto_5227978 ) ) ( not ( = ?auto_5227981 ?auto_5227976 ) ) ( not ( = ?auto_5227981 ?auto_5227978 ) ) ( not ( = ?auto_5227981 ?auto_5227980 ) ) ( not ( = ?auto_5227983 ?auto_5227976 ) ) ( not ( = ?auto_5227983 ?auto_5227978 ) ) ( not ( = ?auto_5227983 ?auto_5227980 ) ) ( not ( = ?auto_5227983 ?auto_5227981 ) ) ( CALIBRATED ?auto_5227986 ) ( ON_BOARD ?auto_5227986 ?auto_5227985 ) ( SUPPORTS ?auto_5227986 ?auto_5227982 ) ( POWER_ON ?auto_5227986 ) ( POINTING ?auto_5227985 ?auto_5227981 ) ( HAVE_IMAGE ?auto_5227976 ?auto_5227977 ) ( HAVE_IMAGE ?auto_5227978 ?auto_5227975 ) ( HAVE_IMAGE ?auto_5227980 ?auto_5227979 ) ( HAVE_IMAGE ?auto_5227983 ?auto_5227984 ) ( not ( = ?auto_5227977 ?auto_5227975 ) ) ( not ( = ?auto_5227977 ?auto_5227979 ) ) ( not ( = ?auto_5227977 ?auto_5227982 ) ) ( not ( = ?auto_5227977 ?auto_5227984 ) ) ( not ( = ?auto_5227975 ?auto_5227979 ) ) ( not ( = ?auto_5227975 ?auto_5227982 ) ) ( not ( = ?auto_5227975 ?auto_5227984 ) ) ( not ( = ?auto_5227979 ?auto_5227982 ) ) ( not ( = ?auto_5227979 ?auto_5227984 ) ) ( not ( = ?auto_5227982 ?auto_5227984 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_5227981 ?auto_5227982 )
      ( GET-5IMAGE-VERIFY ?auto_5227976 ?auto_5227977 ?auto_5227978 ?auto_5227975 ?auto_5227980 ?auto_5227979 ?auto_5227981 ?auto_5227982 ?auto_5227983 ?auto_5227984 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5228260 - DIRECTION
      ?auto_5228261 - MODE
      ?auto_5228262 - DIRECTION
      ?auto_5228259 - MODE
      ?auto_5228264 - DIRECTION
      ?auto_5228263 - MODE
      ?auto_5228265 - DIRECTION
      ?auto_5228266 - MODE
      ?auto_5228267 - DIRECTION
      ?auto_5228268 - MODE
    )
    :vars
    (
      ?auto_5228270 - INSTRUMENT
      ?auto_5228269 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_5228262 ?auto_5228260 ) ) ( not ( = ?auto_5228264 ?auto_5228260 ) ) ( not ( = ?auto_5228264 ?auto_5228262 ) ) ( not ( = ?auto_5228265 ?auto_5228260 ) ) ( not ( = ?auto_5228265 ?auto_5228262 ) ) ( not ( = ?auto_5228265 ?auto_5228264 ) ) ( not ( = ?auto_5228267 ?auto_5228260 ) ) ( not ( = ?auto_5228267 ?auto_5228262 ) ) ( not ( = ?auto_5228267 ?auto_5228264 ) ) ( not ( = ?auto_5228267 ?auto_5228265 ) ) ( CALIBRATED ?auto_5228270 ) ( ON_BOARD ?auto_5228270 ?auto_5228269 ) ( SUPPORTS ?auto_5228270 ?auto_5228263 ) ( POWER_ON ?auto_5228270 ) ( POINTING ?auto_5228269 ?auto_5228264 ) ( HAVE_IMAGE ?auto_5228260 ?auto_5228261 ) ( HAVE_IMAGE ?auto_5228262 ?auto_5228259 ) ( HAVE_IMAGE ?auto_5228265 ?auto_5228266 ) ( HAVE_IMAGE ?auto_5228267 ?auto_5228268 ) ( not ( = ?auto_5228261 ?auto_5228259 ) ) ( not ( = ?auto_5228261 ?auto_5228263 ) ) ( not ( = ?auto_5228261 ?auto_5228266 ) ) ( not ( = ?auto_5228261 ?auto_5228268 ) ) ( not ( = ?auto_5228259 ?auto_5228263 ) ) ( not ( = ?auto_5228259 ?auto_5228266 ) ) ( not ( = ?auto_5228259 ?auto_5228268 ) ) ( not ( = ?auto_5228263 ?auto_5228266 ) ) ( not ( = ?auto_5228263 ?auto_5228268 ) ) ( not ( = ?auto_5228266 ?auto_5228268 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_5228264 ?auto_5228263 )
      ( GET-5IMAGE-VERIFY ?auto_5228260 ?auto_5228261 ?auto_5228262 ?auto_5228259 ?auto_5228264 ?auto_5228263 ?auto_5228265 ?auto_5228266 ?auto_5228267 ?auto_5228268 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5230298 - DIRECTION
      ?auto_5230299 - MODE
      ?auto_5230300 - DIRECTION
      ?auto_5230297 - MODE
      ?auto_5230302 - DIRECTION
      ?auto_5230301 - MODE
      ?auto_5230303 - DIRECTION
      ?auto_5230304 - MODE
      ?auto_5230305 - DIRECTION
      ?auto_5230306 - MODE
    )
    :vars
    (
      ?auto_5230308 - INSTRUMENT
      ?auto_5230307 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_5230300 ?auto_5230298 ) ) ( not ( = ?auto_5230302 ?auto_5230298 ) ) ( not ( = ?auto_5230302 ?auto_5230300 ) ) ( not ( = ?auto_5230303 ?auto_5230298 ) ) ( not ( = ?auto_5230303 ?auto_5230300 ) ) ( not ( = ?auto_5230303 ?auto_5230302 ) ) ( not ( = ?auto_5230305 ?auto_5230298 ) ) ( not ( = ?auto_5230305 ?auto_5230300 ) ) ( not ( = ?auto_5230305 ?auto_5230302 ) ) ( not ( = ?auto_5230305 ?auto_5230303 ) ) ( CALIBRATED ?auto_5230308 ) ( ON_BOARD ?auto_5230308 ?auto_5230307 ) ( SUPPORTS ?auto_5230308 ?auto_5230297 ) ( POWER_ON ?auto_5230308 ) ( POINTING ?auto_5230307 ?auto_5230300 ) ( HAVE_IMAGE ?auto_5230298 ?auto_5230299 ) ( HAVE_IMAGE ?auto_5230302 ?auto_5230301 ) ( HAVE_IMAGE ?auto_5230303 ?auto_5230304 ) ( HAVE_IMAGE ?auto_5230305 ?auto_5230306 ) ( not ( = ?auto_5230299 ?auto_5230297 ) ) ( not ( = ?auto_5230299 ?auto_5230301 ) ) ( not ( = ?auto_5230299 ?auto_5230304 ) ) ( not ( = ?auto_5230299 ?auto_5230306 ) ) ( not ( = ?auto_5230297 ?auto_5230301 ) ) ( not ( = ?auto_5230297 ?auto_5230304 ) ) ( not ( = ?auto_5230297 ?auto_5230306 ) ) ( not ( = ?auto_5230301 ?auto_5230304 ) ) ( not ( = ?auto_5230301 ?auto_5230306 ) ) ( not ( = ?auto_5230304 ?auto_5230306 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_5230300 ?auto_5230297 )
      ( GET-5IMAGE-VERIFY ?auto_5230298 ?auto_5230299 ?auto_5230300 ?auto_5230297 ?auto_5230302 ?auto_5230301 ?auto_5230303 ?auto_5230304 ?auto_5230305 ?auto_5230306 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5244928 - DIRECTION
      ?auto_5244929 - MODE
      ?auto_5244930 - DIRECTION
      ?auto_5244927 - MODE
      ?auto_5244932 - DIRECTION
      ?auto_5244931 - MODE
      ?auto_5244933 - DIRECTION
      ?auto_5244934 - MODE
      ?auto_5244935 - DIRECTION
      ?auto_5244936 - MODE
    )
    :vars
    (
      ?auto_5244938 - INSTRUMENT
      ?auto_5244937 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_5244930 ?auto_5244928 ) ) ( not ( = ?auto_5244932 ?auto_5244928 ) ) ( not ( = ?auto_5244932 ?auto_5244930 ) ) ( not ( = ?auto_5244933 ?auto_5244928 ) ) ( not ( = ?auto_5244933 ?auto_5244930 ) ) ( not ( = ?auto_5244933 ?auto_5244932 ) ) ( not ( = ?auto_5244935 ?auto_5244928 ) ) ( not ( = ?auto_5244935 ?auto_5244930 ) ) ( not ( = ?auto_5244935 ?auto_5244932 ) ) ( not ( = ?auto_5244935 ?auto_5244933 ) ) ( CALIBRATED ?auto_5244938 ) ( ON_BOARD ?auto_5244938 ?auto_5244937 ) ( SUPPORTS ?auto_5244938 ?auto_5244929 ) ( POWER_ON ?auto_5244938 ) ( POINTING ?auto_5244937 ?auto_5244928 ) ( HAVE_IMAGE ?auto_5244930 ?auto_5244927 ) ( HAVE_IMAGE ?auto_5244932 ?auto_5244931 ) ( HAVE_IMAGE ?auto_5244933 ?auto_5244934 ) ( HAVE_IMAGE ?auto_5244935 ?auto_5244936 ) ( not ( = ?auto_5244929 ?auto_5244927 ) ) ( not ( = ?auto_5244929 ?auto_5244931 ) ) ( not ( = ?auto_5244929 ?auto_5244934 ) ) ( not ( = ?auto_5244929 ?auto_5244936 ) ) ( not ( = ?auto_5244927 ?auto_5244931 ) ) ( not ( = ?auto_5244927 ?auto_5244934 ) ) ( not ( = ?auto_5244927 ?auto_5244936 ) ) ( not ( = ?auto_5244931 ?auto_5244934 ) ) ( not ( = ?auto_5244931 ?auto_5244936 ) ) ( not ( = ?auto_5244934 ?auto_5244936 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_5244928 ?auto_5244929 )
      ( GET-5IMAGE-VERIFY ?auto_5244928 ?auto_5244929 ?auto_5244930 ?auto_5244927 ?auto_5244932 ?auto_5244931 ?auto_5244933 ?auto_5244934 ?auto_5244935 ?auto_5244936 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5257617 - DIRECTION
      ?auto_5257618 - MODE
      ?auto_5257619 - DIRECTION
      ?auto_5257616 - MODE
      ?auto_5257621 - DIRECTION
      ?auto_5257620 - MODE
      ?auto_5257622 - DIRECTION
      ?auto_5257623 - MODE
      ?auto_5257624 - DIRECTION
      ?auto_5257625 - MODE
    )
    :vars
    (
      ?auto_5257627 - INSTRUMENT
      ?auto_5257628 - SATELLITE
      ?auto_5257626 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5257619 ?auto_5257617 ) ) ( not ( = ?auto_5257621 ?auto_5257617 ) ) ( not ( = ?auto_5257621 ?auto_5257619 ) ) ( not ( = ?auto_5257622 ?auto_5257617 ) ) ( not ( = ?auto_5257622 ?auto_5257619 ) ) ( not ( = ?auto_5257622 ?auto_5257621 ) ) ( not ( = ?auto_5257624 ?auto_5257617 ) ) ( not ( = ?auto_5257624 ?auto_5257619 ) ) ( not ( = ?auto_5257624 ?auto_5257621 ) ) ( not ( = ?auto_5257624 ?auto_5257622 ) ) ( CALIBRATED ?auto_5257627 ) ( ON_BOARD ?auto_5257627 ?auto_5257628 ) ( SUPPORTS ?auto_5257627 ?auto_5257625 ) ( POWER_ON ?auto_5257627 ) ( POINTING ?auto_5257628 ?auto_5257626 ) ( not ( = ?auto_5257624 ?auto_5257626 ) ) ( HAVE_IMAGE ?auto_5257617 ?auto_5257618 ) ( not ( = ?auto_5257617 ?auto_5257626 ) ) ( not ( = ?auto_5257618 ?auto_5257625 ) ) ( HAVE_IMAGE ?auto_5257619 ?auto_5257616 ) ( HAVE_IMAGE ?auto_5257621 ?auto_5257620 ) ( HAVE_IMAGE ?auto_5257622 ?auto_5257623 ) ( not ( = ?auto_5257618 ?auto_5257616 ) ) ( not ( = ?auto_5257618 ?auto_5257620 ) ) ( not ( = ?auto_5257618 ?auto_5257623 ) ) ( not ( = ?auto_5257619 ?auto_5257626 ) ) ( not ( = ?auto_5257616 ?auto_5257620 ) ) ( not ( = ?auto_5257616 ?auto_5257623 ) ) ( not ( = ?auto_5257616 ?auto_5257625 ) ) ( not ( = ?auto_5257621 ?auto_5257626 ) ) ( not ( = ?auto_5257620 ?auto_5257623 ) ) ( not ( = ?auto_5257620 ?auto_5257625 ) ) ( not ( = ?auto_5257622 ?auto_5257626 ) ) ( not ( = ?auto_5257623 ?auto_5257625 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5257617 ?auto_5257618 ?auto_5257624 ?auto_5257625 )
      ( GET-5IMAGE-VERIFY ?auto_5257617 ?auto_5257618 ?auto_5257619 ?auto_5257616 ?auto_5257621 ?auto_5257620 ?auto_5257622 ?auto_5257623 ?auto_5257624 ?auto_5257625 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5257669 - DIRECTION
      ?auto_5257670 - MODE
      ?auto_5257671 - DIRECTION
      ?auto_5257668 - MODE
      ?auto_5257673 - DIRECTION
      ?auto_5257672 - MODE
      ?auto_5257674 - DIRECTION
      ?auto_5257675 - MODE
      ?auto_5257676 - DIRECTION
      ?auto_5257677 - MODE
    )
    :vars
    (
      ?auto_5257679 - INSTRUMENT
      ?auto_5257680 - SATELLITE
      ?auto_5257678 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5257671 ?auto_5257669 ) ) ( not ( = ?auto_5257673 ?auto_5257669 ) ) ( not ( = ?auto_5257673 ?auto_5257671 ) ) ( not ( = ?auto_5257674 ?auto_5257669 ) ) ( not ( = ?auto_5257674 ?auto_5257671 ) ) ( not ( = ?auto_5257674 ?auto_5257673 ) ) ( not ( = ?auto_5257676 ?auto_5257669 ) ) ( not ( = ?auto_5257676 ?auto_5257671 ) ) ( not ( = ?auto_5257676 ?auto_5257673 ) ) ( not ( = ?auto_5257676 ?auto_5257674 ) ) ( CALIBRATED ?auto_5257679 ) ( ON_BOARD ?auto_5257679 ?auto_5257680 ) ( SUPPORTS ?auto_5257679 ?auto_5257675 ) ( POWER_ON ?auto_5257679 ) ( POINTING ?auto_5257680 ?auto_5257678 ) ( not ( = ?auto_5257674 ?auto_5257678 ) ) ( HAVE_IMAGE ?auto_5257669 ?auto_5257670 ) ( not ( = ?auto_5257669 ?auto_5257678 ) ) ( not ( = ?auto_5257670 ?auto_5257675 ) ) ( HAVE_IMAGE ?auto_5257671 ?auto_5257668 ) ( HAVE_IMAGE ?auto_5257673 ?auto_5257672 ) ( HAVE_IMAGE ?auto_5257676 ?auto_5257677 ) ( not ( = ?auto_5257670 ?auto_5257668 ) ) ( not ( = ?auto_5257670 ?auto_5257672 ) ) ( not ( = ?auto_5257670 ?auto_5257677 ) ) ( not ( = ?auto_5257671 ?auto_5257678 ) ) ( not ( = ?auto_5257668 ?auto_5257672 ) ) ( not ( = ?auto_5257668 ?auto_5257675 ) ) ( not ( = ?auto_5257668 ?auto_5257677 ) ) ( not ( = ?auto_5257673 ?auto_5257678 ) ) ( not ( = ?auto_5257672 ?auto_5257675 ) ) ( not ( = ?auto_5257672 ?auto_5257677 ) ) ( not ( = ?auto_5257675 ?auto_5257677 ) ) ( not ( = ?auto_5257676 ?auto_5257678 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5257669 ?auto_5257670 ?auto_5257674 ?auto_5257675 )
      ( GET-5IMAGE-VERIFY ?auto_5257669 ?auto_5257670 ?auto_5257671 ?auto_5257668 ?auto_5257673 ?auto_5257672 ?auto_5257674 ?auto_5257675 ?auto_5257676 ?auto_5257677 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5257975 - DIRECTION
      ?auto_5257976 - MODE
      ?auto_5257977 - DIRECTION
      ?auto_5257974 - MODE
      ?auto_5257979 - DIRECTION
      ?auto_5257978 - MODE
      ?auto_5257980 - DIRECTION
      ?auto_5257981 - MODE
      ?auto_5257982 - DIRECTION
      ?auto_5257983 - MODE
    )
    :vars
    (
      ?auto_5257985 - INSTRUMENT
      ?auto_5257986 - SATELLITE
      ?auto_5257984 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5257977 ?auto_5257975 ) ) ( not ( = ?auto_5257979 ?auto_5257975 ) ) ( not ( = ?auto_5257979 ?auto_5257977 ) ) ( not ( = ?auto_5257980 ?auto_5257975 ) ) ( not ( = ?auto_5257980 ?auto_5257977 ) ) ( not ( = ?auto_5257980 ?auto_5257979 ) ) ( not ( = ?auto_5257982 ?auto_5257975 ) ) ( not ( = ?auto_5257982 ?auto_5257977 ) ) ( not ( = ?auto_5257982 ?auto_5257979 ) ) ( not ( = ?auto_5257982 ?auto_5257980 ) ) ( CALIBRATED ?auto_5257985 ) ( ON_BOARD ?auto_5257985 ?auto_5257986 ) ( SUPPORTS ?auto_5257985 ?auto_5257978 ) ( POWER_ON ?auto_5257985 ) ( POINTING ?auto_5257986 ?auto_5257984 ) ( not ( = ?auto_5257979 ?auto_5257984 ) ) ( HAVE_IMAGE ?auto_5257975 ?auto_5257976 ) ( not ( = ?auto_5257975 ?auto_5257984 ) ) ( not ( = ?auto_5257976 ?auto_5257978 ) ) ( HAVE_IMAGE ?auto_5257977 ?auto_5257974 ) ( HAVE_IMAGE ?auto_5257980 ?auto_5257981 ) ( HAVE_IMAGE ?auto_5257982 ?auto_5257983 ) ( not ( = ?auto_5257976 ?auto_5257974 ) ) ( not ( = ?auto_5257976 ?auto_5257981 ) ) ( not ( = ?auto_5257976 ?auto_5257983 ) ) ( not ( = ?auto_5257977 ?auto_5257984 ) ) ( not ( = ?auto_5257974 ?auto_5257978 ) ) ( not ( = ?auto_5257974 ?auto_5257981 ) ) ( not ( = ?auto_5257974 ?auto_5257983 ) ) ( not ( = ?auto_5257978 ?auto_5257981 ) ) ( not ( = ?auto_5257978 ?auto_5257983 ) ) ( not ( = ?auto_5257980 ?auto_5257984 ) ) ( not ( = ?auto_5257981 ?auto_5257983 ) ) ( not ( = ?auto_5257982 ?auto_5257984 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5257975 ?auto_5257976 ?auto_5257979 ?auto_5257978 )
      ( GET-5IMAGE-VERIFY ?auto_5257975 ?auto_5257976 ?auto_5257977 ?auto_5257974 ?auto_5257979 ?auto_5257978 ?auto_5257980 ?auto_5257981 ?auto_5257982 ?auto_5257983 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5260172 - DIRECTION
      ?auto_5260173 - MODE
      ?auto_5260174 - DIRECTION
      ?auto_5260171 - MODE
      ?auto_5260176 - DIRECTION
      ?auto_5260175 - MODE
      ?auto_5260177 - DIRECTION
      ?auto_5260178 - MODE
      ?auto_5260179 - DIRECTION
      ?auto_5260180 - MODE
    )
    :vars
    (
      ?auto_5260182 - INSTRUMENT
      ?auto_5260183 - SATELLITE
      ?auto_5260181 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5260174 ?auto_5260172 ) ) ( not ( = ?auto_5260176 ?auto_5260172 ) ) ( not ( = ?auto_5260176 ?auto_5260174 ) ) ( not ( = ?auto_5260177 ?auto_5260172 ) ) ( not ( = ?auto_5260177 ?auto_5260174 ) ) ( not ( = ?auto_5260177 ?auto_5260176 ) ) ( not ( = ?auto_5260179 ?auto_5260172 ) ) ( not ( = ?auto_5260179 ?auto_5260174 ) ) ( not ( = ?auto_5260179 ?auto_5260176 ) ) ( not ( = ?auto_5260179 ?auto_5260177 ) ) ( CALIBRATED ?auto_5260182 ) ( ON_BOARD ?auto_5260182 ?auto_5260183 ) ( SUPPORTS ?auto_5260182 ?auto_5260171 ) ( POWER_ON ?auto_5260182 ) ( POINTING ?auto_5260183 ?auto_5260181 ) ( not ( = ?auto_5260174 ?auto_5260181 ) ) ( HAVE_IMAGE ?auto_5260172 ?auto_5260173 ) ( not ( = ?auto_5260172 ?auto_5260181 ) ) ( not ( = ?auto_5260173 ?auto_5260171 ) ) ( HAVE_IMAGE ?auto_5260176 ?auto_5260175 ) ( HAVE_IMAGE ?auto_5260177 ?auto_5260178 ) ( HAVE_IMAGE ?auto_5260179 ?auto_5260180 ) ( not ( = ?auto_5260173 ?auto_5260175 ) ) ( not ( = ?auto_5260173 ?auto_5260178 ) ) ( not ( = ?auto_5260173 ?auto_5260180 ) ) ( not ( = ?auto_5260171 ?auto_5260175 ) ) ( not ( = ?auto_5260171 ?auto_5260178 ) ) ( not ( = ?auto_5260171 ?auto_5260180 ) ) ( not ( = ?auto_5260176 ?auto_5260181 ) ) ( not ( = ?auto_5260175 ?auto_5260178 ) ) ( not ( = ?auto_5260175 ?auto_5260180 ) ) ( not ( = ?auto_5260177 ?auto_5260181 ) ) ( not ( = ?auto_5260178 ?auto_5260180 ) ) ( not ( = ?auto_5260179 ?auto_5260181 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5260172 ?auto_5260173 ?auto_5260174 ?auto_5260171 )
      ( GET-5IMAGE-VERIFY ?auto_5260172 ?auto_5260173 ?auto_5260174 ?auto_5260171 ?auto_5260176 ?auto_5260175 ?auto_5260177 ?auto_5260178 ?auto_5260179 ?auto_5260180 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5277007 - DIRECTION
      ?auto_5277008 - MODE
      ?auto_5277009 - DIRECTION
      ?auto_5277006 - MODE
      ?auto_5277011 - DIRECTION
      ?auto_5277010 - MODE
      ?auto_5277012 - DIRECTION
      ?auto_5277013 - MODE
      ?auto_5277014 - DIRECTION
      ?auto_5277015 - MODE
    )
    :vars
    (
      ?auto_5277017 - INSTRUMENT
      ?auto_5277018 - SATELLITE
      ?auto_5277016 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5277009 ?auto_5277007 ) ) ( not ( = ?auto_5277011 ?auto_5277007 ) ) ( not ( = ?auto_5277011 ?auto_5277009 ) ) ( not ( = ?auto_5277012 ?auto_5277007 ) ) ( not ( = ?auto_5277012 ?auto_5277009 ) ) ( not ( = ?auto_5277012 ?auto_5277011 ) ) ( not ( = ?auto_5277014 ?auto_5277007 ) ) ( not ( = ?auto_5277014 ?auto_5277009 ) ) ( not ( = ?auto_5277014 ?auto_5277011 ) ) ( not ( = ?auto_5277014 ?auto_5277012 ) ) ( CALIBRATED ?auto_5277017 ) ( ON_BOARD ?auto_5277017 ?auto_5277018 ) ( SUPPORTS ?auto_5277017 ?auto_5277008 ) ( POWER_ON ?auto_5277017 ) ( POINTING ?auto_5277018 ?auto_5277016 ) ( not ( = ?auto_5277007 ?auto_5277016 ) ) ( HAVE_IMAGE ?auto_5277009 ?auto_5277006 ) ( not ( = ?auto_5277009 ?auto_5277016 ) ) ( not ( = ?auto_5277006 ?auto_5277008 ) ) ( HAVE_IMAGE ?auto_5277011 ?auto_5277010 ) ( HAVE_IMAGE ?auto_5277012 ?auto_5277013 ) ( HAVE_IMAGE ?auto_5277014 ?auto_5277015 ) ( not ( = ?auto_5277008 ?auto_5277010 ) ) ( not ( = ?auto_5277008 ?auto_5277013 ) ) ( not ( = ?auto_5277008 ?auto_5277015 ) ) ( not ( = ?auto_5277006 ?auto_5277010 ) ) ( not ( = ?auto_5277006 ?auto_5277013 ) ) ( not ( = ?auto_5277006 ?auto_5277015 ) ) ( not ( = ?auto_5277011 ?auto_5277016 ) ) ( not ( = ?auto_5277010 ?auto_5277013 ) ) ( not ( = ?auto_5277010 ?auto_5277015 ) ) ( not ( = ?auto_5277012 ?auto_5277016 ) ) ( not ( = ?auto_5277013 ?auto_5277015 ) ) ( not ( = ?auto_5277014 ?auto_5277016 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5277009 ?auto_5277006 ?auto_5277007 ?auto_5277008 )
      ( GET-5IMAGE-VERIFY ?auto_5277007 ?auto_5277008 ?auto_5277009 ?auto_5277006 ?auto_5277011 ?auto_5277010 ?auto_5277012 ?auto_5277013 ?auto_5277014 ?auto_5277015 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5290774 - DIRECTION
      ?auto_5290775 - MODE
      ?auto_5290776 - DIRECTION
      ?auto_5290773 - MODE
      ?auto_5290778 - DIRECTION
      ?auto_5290777 - MODE
      ?auto_5290779 - DIRECTION
      ?auto_5290780 - MODE
      ?auto_5290781 - DIRECTION
      ?auto_5290782 - MODE
    )
    :vars
    (
      ?auto_5290783 - INSTRUMENT
      ?auto_5290785 - SATELLITE
      ?auto_5290784 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5290776 ?auto_5290774 ) ) ( not ( = ?auto_5290778 ?auto_5290774 ) ) ( not ( = ?auto_5290778 ?auto_5290776 ) ) ( not ( = ?auto_5290779 ?auto_5290774 ) ) ( not ( = ?auto_5290779 ?auto_5290776 ) ) ( not ( = ?auto_5290779 ?auto_5290778 ) ) ( not ( = ?auto_5290781 ?auto_5290774 ) ) ( not ( = ?auto_5290781 ?auto_5290776 ) ) ( not ( = ?auto_5290781 ?auto_5290778 ) ) ( not ( = ?auto_5290781 ?auto_5290779 ) ) ( ON_BOARD ?auto_5290783 ?auto_5290785 ) ( SUPPORTS ?auto_5290783 ?auto_5290782 ) ( POWER_ON ?auto_5290783 ) ( POINTING ?auto_5290785 ?auto_5290784 ) ( not ( = ?auto_5290781 ?auto_5290784 ) ) ( HAVE_IMAGE ?auto_5290774 ?auto_5290775 ) ( not ( = ?auto_5290774 ?auto_5290784 ) ) ( not ( = ?auto_5290775 ?auto_5290782 ) ) ( CALIBRATION_TARGET ?auto_5290783 ?auto_5290784 ) ( NOT_CALIBRATED ?auto_5290783 ) ( HAVE_IMAGE ?auto_5290776 ?auto_5290773 ) ( HAVE_IMAGE ?auto_5290778 ?auto_5290777 ) ( HAVE_IMAGE ?auto_5290779 ?auto_5290780 ) ( not ( = ?auto_5290775 ?auto_5290773 ) ) ( not ( = ?auto_5290775 ?auto_5290777 ) ) ( not ( = ?auto_5290775 ?auto_5290780 ) ) ( not ( = ?auto_5290776 ?auto_5290784 ) ) ( not ( = ?auto_5290773 ?auto_5290777 ) ) ( not ( = ?auto_5290773 ?auto_5290780 ) ) ( not ( = ?auto_5290773 ?auto_5290782 ) ) ( not ( = ?auto_5290778 ?auto_5290784 ) ) ( not ( = ?auto_5290777 ?auto_5290780 ) ) ( not ( = ?auto_5290777 ?auto_5290782 ) ) ( not ( = ?auto_5290779 ?auto_5290784 ) ) ( not ( = ?auto_5290780 ?auto_5290782 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5290774 ?auto_5290775 ?auto_5290781 ?auto_5290782 )
      ( GET-5IMAGE-VERIFY ?auto_5290774 ?auto_5290775 ?auto_5290776 ?auto_5290773 ?auto_5290778 ?auto_5290777 ?auto_5290779 ?auto_5290780 ?auto_5290781 ?auto_5290782 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5290826 - DIRECTION
      ?auto_5290827 - MODE
      ?auto_5290828 - DIRECTION
      ?auto_5290825 - MODE
      ?auto_5290830 - DIRECTION
      ?auto_5290829 - MODE
      ?auto_5290831 - DIRECTION
      ?auto_5290832 - MODE
      ?auto_5290833 - DIRECTION
      ?auto_5290834 - MODE
    )
    :vars
    (
      ?auto_5290835 - INSTRUMENT
      ?auto_5290837 - SATELLITE
      ?auto_5290836 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5290828 ?auto_5290826 ) ) ( not ( = ?auto_5290830 ?auto_5290826 ) ) ( not ( = ?auto_5290830 ?auto_5290828 ) ) ( not ( = ?auto_5290831 ?auto_5290826 ) ) ( not ( = ?auto_5290831 ?auto_5290828 ) ) ( not ( = ?auto_5290831 ?auto_5290830 ) ) ( not ( = ?auto_5290833 ?auto_5290826 ) ) ( not ( = ?auto_5290833 ?auto_5290828 ) ) ( not ( = ?auto_5290833 ?auto_5290830 ) ) ( not ( = ?auto_5290833 ?auto_5290831 ) ) ( ON_BOARD ?auto_5290835 ?auto_5290837 ) ( SUPPORTS ?auto_5290835 ?auto_5290832 ) ( POWER_ON ?auto_5290835 ) ( POINTING ?auto_5290837 ?auto_5290836 ) ( not ( = ?auto_5290831 ?auto_5290836 ) ) ( HAVE_IMAGE ?auto_5290826 ?auto_5290827 ) ( not ( = ?auto_5290826 ?auto_5290836 ) ) ( not ( = ?auto_5290827 ?auto_5290832 ) ) ( CALIBRATION_TARGET ?auto_5290835 ?auto_5290836 ) ( NOT_CALIBRATED ?auto_5290835 ) ( HAVE_IMAGE ?auto_5290828 ?auto_5290825 ) ( HAVE_IMAGE ?auto_5290830 ?auto_5290829 ) ( HAVE_IMAGE ?auto_5290833 ?auto_5290834 ) ( not ( = ?auto_5290827 ?auto_5290825 ) ) ( not ( = ?auto_5290827 ?auto_5290829 ) ) ( not ( = ?auto_5290827 ?auto_5290834 ) ) ( not ( = ?auto_5290828 ?auto_5290836 ) ) ( not ( = ?auto_5290825 ?auto_5290829 ) ) ( not ( = ?auto_5290825 ?auto_5290832 ) ) ( not ( = ?auto_5290825 ?auto_5290834 ) ) ( not ( = ?auto_5290830 ?auto_5290836 ) ) ( not ( = ?auto_5290829 ?auto_5290832 ) ) ( not ( = ?auto_5290829 ?auto_5290834 ) ) ( not ( = ?auto_5290832 ?auto_5290834 ) ) ( not ( = ?auto_5290833 ?auto_5290836 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5290826 ?auto_5290827 ?auto_5290831 ?auto_5290832 )
      ( GET-5IMAGE-VERIFY ?auto_5290826 ?auto_5290827 ?auto_5290828 ?auto_5290825 ?auto_5290830 ?auto_5290829 ?auto_5290831 ?auto_5290832 ?auto_5290833 ?auto_5290834 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5291132 - DIRECTION
      ?auto_5291133 - MODE
      ?auto_5291134 - DIRECTION
      ?auto_5291131 - MODE
      ?auto_5291136 - DIRECTION
      ?auto_5291135 - MODE
      ?auto_5291137 - DIRECTION
      ?auto_5291138 - MODE
      ?auto_5291139 - DIRECTION
      ?auto_5291140 - MODE
    )
    :vars
    (
      ?auto_5291141 - INSTRUMENT
      ?auto_5291143 - SATELLITE
      ?auto_5291142 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5291134 ?auto_5291132 ) ) ( not ( = ?auto_5291136 ?auto_5291132 ) ) ( not ( = ?auto_5291136 ?auto_5291134 ) ) ( not ( = ?auto_5291137 ?auto_5291132 ) ) ( not ( = ?auto_5291137 ?auto_5291134 ) ) ( not ( = ?auto_5291137 ?auto_5291136 ) ) ( not ( = ?auto_5291139 ?auto_5291132 ) ) ( not ( = ?auto_5291139 ?auto_5291134 ) ) ( not ( = ?auto_5291139 ?auto_5291136 ) ) ( not ( = ?auto_5291139 ?auto_5291137 ) ) ( ON_BOARD ?auto_5291141 ?auto_5291143 ) ( SUPPORTS ?auto_5291141 ?auto_5291135 ) ( POWER_ON ?auto_5291141 ) ( POINTING ?auto_5291143 ?auto_5291142 ) ( not ( = ?auto_5291136 ?auto_5291142 ) ) ( HAVE_IMAGE ?auto_5291132 ?auto_5291133 ) ( not ( = ?auto_5291132 ?auto_5291142 ) ) ( not ( = ?auto_5291133 ?auto_5291135 ) ) ( CALIBRATION_TARGET ?auto_5291141 ?auto_5291142 ) ( NOT_CALIBRATED ?auto_5291141 ) ( HAVE_IMAGE ?auto_5291134 ?auto_5291131 ) ( HAVE_IMAGE ?auto_5291137 ?auto_5291138 ) ( HAVE_IMAGE ?auto_5291139 ?auto_5291140 ) ( not ( = ?auto_5291133 ?auto_5291131 ) ) ( not ( = ?auto_5291133 ?auto_5291138 ) ) ( not ( = ?auto_5291133 ?auto_5291140 ) ) ( not ( = ?auto_5291134 ?auto_5291142 ) ) ( not ( = ?auto_5291131 ?auto_5291135 ) ) ( not ( = ?auto_5291131 ?auto_5291138 ) ) ( not ( = ?auto_5291131 ?auto_5291140 ) ) ( not ( = ?auto_5291135 ?auto_5291138 ) ) ( not ( = ?auto_5291135 ?auto_5291140 ) ) ( not ( = ?auto_5291137 ?auto_5291142 ) ) ( not ( = ?auto_5291138 ?auto_5291140 ) ) ( not ( = ?auto_5291139 ?auto_5291142 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5291132 ?auto_5291133 ?auto_5291136 ?auto_5291135 )
      ( GET-5IMAGE-VERIFY ?auto_5291132 ?auto_5291133 ?auto_5291134 ?auto_5291131 ?auto_5291136 ?auto_5291135 ?auto_5291137 ?auto_5291138 ?auto_5291139 ?auto_5291140 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5293329 - DIRECTION
      ?auto_5293330 - MODE
      ?auto_5293331 - DIRECTION
      ?auto_5293328 - MODE
      ?auto_5293333 - DIRECTION
      ?auto_5293332 - MODE
      ?auto_5293334 - DIRECTION
      ?auto_5293335 - MODE
      ?auto_5293336 - DIRECTION
      ?auto_5293337 - MODE
    )
    :vars
    (
      ?auto_5293338 - INSTRUMENT
      ?auto_5293340 - SATELLITE
      ?auto_5293339 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5293331 ?auto_5293329 ) ) ( not ( = ?auto_5293333 ?auto_5293329 ) ) ( not ( = ?auto_5293333 ?auto_5293331 ) ) ( not ( = ?auto_5293334 ?auto_5293329 ) ) ( not ( = ?auto_5293334 ?auto_5293331 ) ) ( not ( = ?auto_5293334 ?auto_5293333 ) ) ( not ( = ?auto_5293336 ?auto_5293329 ) ) ( not ( = ?auto_5293336 ?auto_5293331 ) ) ( not ( = ?auto_5293336 ?auto_5293333 ) ) ( not ( = ?auto_5293336 ?auto_5293334 ) ) ( ON_BOARD ?auto_5293338 ?auto_5293340 ) ( SUPPORTS ?auto_5293338 ?auto_5293328 ) ( POWER_ON ?auto_5293338 ) ( POINTING ?auto_5293340 ?auto_5293339 ) ( not ( = ?auto_5293331 ?auto_5293339 ) ) ( HAVE_IMAGE ?auto_5293329 ?auto_5293330 ) ( not ( = ?auto_5293329 ?auto_5293339 ) ) ( not ( = ?auto_5293330 ?auto_5293328 ) ) ( CALIBRATION_TARGET ?auto_5293338 ?auto_5293339 ) ( NOT_CALIBRATED ?auto_5293338 ) ( HAVE_IMAGE ?auto_5293333 ?auto_5293332 ) ( HAVE_IMAGE ?auto_5293334 ?auto_5293335 ) ( HAVE_IMAGE ?auto_5293336 ?auto_5293337 ) ( not ( = ?auto_5293330 ?auto_5293332 ) ) ( not ( = ?auto_5293330 ?auto_5293335 ) ) ( not ( = ?auto_5293330 ?auto_5293337 ) ) ( not ( = ?auto_5293328 ?auto_5293332 ) ) ( not ( = ?auto_5293328 ?auto_5293335 ) ) ( not ( = ?auto_5293328 ?auto_5293337 ) ) ( not ( = ?auto_5293333 ?auto_5293339 ) ) ( not ( = ?auto_5293332 ?auto_5293335 ) ) ( not ( = ?auto_5293332 ?auto_5293337 ) ) ( not ( = ?auto_5293334 ?auto_5293339 ) ) ( not ( = ?auto_5293335 ?auto_5293337 ) ) ( not ( = ?auto_5293336 ?auto_5293339 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5293329 ?auto_5293330 ?auto_5293331 ?auto_5293328 )
      ( GET-5IMAGE-VERIFY ?auto_5293329 ?auto_5293330 ?auto_5293331 ?auto_5293328 ?auto_5293333 ?auto_5293332 ?auto_5293334 ?auto_5293335 ?auto_5293336 ?auto_5293337 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5310164 - DIRECTION
      ?auto_5310165 - MODE
      ?auto_5310166 - DIRECTION
      ?auto_5310163 - MODE
      ?auto_5310168 - DIRECTION
      ?auto_5310167 - MODE
      ?auto_5310169 - DIRECTION
      ?auto_5310170 - MODE
      ?auto_5310171 - DIRECTION
      ?auto_5310172 - MODE
    )
    :vars
    (
      ?auto_5310173 - INSTRUMENT
      ?auto_5310175 - SATELLITE
      ?auto_5310174 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5310166 ?auto_5310164 ) ) ( not ( = ?auto_5310168 ?auto_5310164 ) ) ( not ( = ?auto_5310168 ?auto_5310166 ) ) ( not ( = ?auto_5310169 ?auto_5310164 ) ) ( not ( = ?auto_5310169 ?auto_5310166 ) ) ( not ( = ?auto_5310169 ?auto_5310168 ) ) ( not ( = ?auto_5310171 ?auto_5310164 ) ) ( not ( = ?auto_5310171 ?auto_5310166 ) ) ( not ( = ?auto_5310171 ?auto_5310168 ) ) ( not ( = ?auto_5310171 ?auto_5310169 ) ) ( ON_BOARD ?auto_5310173 ?auto_5310175 ) ( SUPPORTS ?auto_5310173 ?auto_5310165 ) ( POWER_ON ?auto_5310173 ) ( POINTING ?auto_5310175 ?auto_5310174 ) ( not ( = ?auto_5310164 ?auto_5310174 ) ) ( HAVE_IMAGE ?auto_5310166 ?auto_5310163 ) ( not ( = ?auto_5310166 ?auto_5310174 ) ) ( not ( = ?auto_5310163 ?auto_5310165 ) ) ( CALIBRATION_TARGET ?auto_5310173 ?auto_5310174 ) ( NOT_CALIBRATED ?auto_5310173 ) ( HAVE_IMAGE ?auto_5310168 ?auto_5310167 ) ( HAVE_IMAGE ?auto_5310169 ?auto_5310170 ) ( HAVE_IMAGE ?auto_5310171 ?auto_5310172 ) ( not ( = ?auto_5310165 ?auto_5310167 ) ) ( not ( = ?auto_5310165 ?auto_5310170 ) ) ( not ( = ?auto_5310165 ?auto_5310172 ) ) ( not ( = ?auto_5310163 ?auto_5310167 ) ) ( not ( = ?auto_5310163 ?auto_5310170 ) ) ( not ( = ?auto_5310163 ?auto_5310172 ) ) ( not ( = ?auto_5310168 ?auto_5310174 ) ) ( not ( = ?auto_5310167 ?auto_5310170 ) ) ( not ( = ?auto_5310167 ?auto_5310172 ) ) ( not ( = ?auto_5310169 ?auto_5310174 ) ) ( not ( = ?auto_5310170 ?auto_5310172 ) ) ( not ( = ?auto_5310171 ?auto_5310174 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5310166 ?auto_5310163 ?auto_5310164 ?auto_5310165 )
      ( GET-5IMAGE-VERIFY ?auto_5310164 ?auto_5310165 ?auto_5310166 ?auto_5310163 ?auto_5310168 ?auto_5310167 ?auto_5310169 ?auto_5310170 ?auto_5310171 ?auto_5310172 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5323931 - DIRECTION
      ?auto_5323932 - MODE
      ?auto_5323933 - DIRECTION
      ?auto_5323930 - MODE
      ?auto_5323935 - DIRECTION
      ?auto_5323934 - MODE
      ?auto_5323936 - DIRECTION
      ?auto_5323937 - MODE
      ?auto_5323938 - DIRECTION
      ?auto_5323939 - MODE
    )
    :vars
    (
      ?auto_5323941 - INSTRUMENT
      ?auto_5323940 - SATELLITE
      ?auto_5323942 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5323933 ?auto_5323931 ) ) ( not ( = ?auto_5323935 ?auto_5323931 ) ) ( not ( = ?auto_5323935 ?auto_5323933 ) ) ( not ( = ?auto_5323936 ?auto_5323931 ) ) ( not ( = ?auto_5323936 ?auto_5323933 ) ) ( not ( = ?auto_5323936 ?auto_5323935 ) ) ( not ( = ?auto_5323938 ?auto_5323931 ) ) ( not ( = ?auto_5323938 ?auto_5323933 ) ) ( not ( = ?auto_5323938 ?auto_5323935 ) ) ( not ( = ?auto_5323938 ?auto_5323936 ) ) ( ON_BOARD ?auto_5323941 ?auto_5323940 ) ( SUPPORTS ?auto_5323941 ?auto_5323939 ) ( POINTING ?auto_5323940 ?auto_5323942 ) ( not ( = ?auto_5323938 ?auto_5323942 ) ) ( HAVE_IMAGE ?auto_5323931 ?auto_5323932 ) ( not ( = ?auto_5323931 ?auto_5323942 ) ) ( not ( = ?auto_5323932 ?auto_5323939 ) ) ( CALIBRATION_TARGET ?auto_5323941 ?auto_5323942 ) ( POWER_AVAIL ?auto_5323940 ) ( HAVE_IMAGE ?auto_5323933 ?auto_5323930 ) ( HAVE_IMAGE ?auto_5323935 ?auto_5323934 ) ( HAVE_IMAGE ?auto_5323936 ?auto_5323937 ) ( not ( = ?auto_5323932 ?auto_5323930 ) ) ( not ( = ?auto_5323932 ?auto_5323934 ) ) ( not ( = ?auto_5323932 ?auto_5323937 ) ) ( not ( = ?auto_5323933 ?auto_5323942 ) ) ( not ( = ?auto_5323930 ?auto_5323934 ) ) ( not ( = ?auto_5323930 ?auto_5323937 ) ) ( not ( = ?auto_5323930 ?auto_5323939 ) ) ( not ( = ?auto_5323935 ?auto_5323942 ) ) ( not ( = ?auto_5323934 ?auto_5323937 ) ) ( not ( = ?auto_5323934 ?auto_5323939 ) ) ( not ( = ?auto_5323936 ?auto_5323942 ) ) ( not ( = ?auto_5323937 ?auto_5323939 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5323931 ?auto_5323932 ?auto_5323938 ?auto_5323939 )
      ( GET-5IMAGE-VERIFY ?auto_5323931 ?auto_5323932 ?auto_5323933 ?auto_5323930 ?auto_5323935 ?auto_5323934 ?auto_5323936 ?auto_5323937 ?auto_5323938 ?auto_5323939 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5323983 - DIRECTION
      ?auto_5323984 - MODE
      ?auto_5323985 - DIRECTION
      ?auto_5323982 - MODE
      ?auto_5323987 - DIRECTION
      ?auto_5323986 - MODE
      ?auto_5323988 - DIRECTION
      ?auto_5323989 - MODE
      ?auto_5323990 - DIRECTION
      ?auto_5323991 - MODE
    )
    :vars
    (
      ?auto_5323993 - INSTRUMENT
      ?auto_5323992 - SATELLITE
      ?auto_5323994 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5323985 ?auto_5323983 ) ) ( not ( = ?auto_5323987 ?auto_5323983 ) ) ( not ( = ?auto_5323987 ?auto_5323985 ) ) ( not ( = ?auto_5323988 ?auto_5323983 ) ) ( not ( = ?auto_5323988 ?auto_5323985 ) ) ( not ( = ?auto_5323988 ?auto_5323987 ) ) ( not ( = ?auto_5323990 ?auto_5323983 ) ) ( not ( = ?auto_5323990 ?auto_5323985 ) ) ( not ( = ?auto_5323990 ?auto_5323987 ) ) ( not ( = ?auto_5323990 ?auto_5323988 ) ) ( ON_BOARD ?auto_5323993 ?auto_5323992 ) ( SUPPORTS ?auto_5323993 ?auto_5323989 ) ( POINTING ?auto_5323992 ?auto_5323994 ) ( not ( = ?auto_5323988 ?auto_5323994 ) ) ( HAVE_IMAGE ?auto_5323983 ?auto_5323984 ) ( not ( = ?auto_5323983 ?auto_5323994 ) ) ( not ( = ?auto_5323984 ?auto_5323989 ) ) ( CALIBRATION_TARGET ?auto_5323993 ?auto_5323994 ) ( POWER_AVAIL ?auto_5323992 ) ( HAVE_IMAGE ?auto_5323985 ?auto_5323982 ) ( HAVE_IMAGE ?auto_5323987 ?auto_5323986 ) ( HAVE_IMAGE ?auto_5323990 ?auto_5323991 ) ( not ( = ?auto_5323984 ?auto_5323982 ) ) ( not ( = ?auto_5323984 ?auto_5323986 ) ) ( not ( = ?auto_5323984 ?auto_5323991 ) ) ( not ( = ?auto_5323985 ?auto_5323994 ) ) ( not ( = ?auto_5323982 ?auto_5323986 ) ) ( not ( = ?auto_5323982 ?auto_5323989 ) ) ( not ( = ?auto_5323982 ?auto_5323991 ) ) ( not ( = ?auto_5323987 ?auto_5323994 ) ) ( not ( = ?auto_5323986 ?auto_5323989 ) ) ( not ( = ?auto_5323986 ?auto_5323991 ) ) ( not ( = ?auto_5323989 ?auto_5323991 ) ) ( not ( = ?auto_5323990 ?auto_5323994 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5323983 ?auto_5323984 ?auto_5323988 ?auto_5323989 )
      ( GET-5IMAGE-VERIFY ?auto_5323983 ?auto_5323984 ?auto_5323985 ?auto_5323982 ?auto_5323987 ?auto_5323986 ?auto_5323988 ?auto_5323989 ?auto_5323990 ?auto_5323991 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5324289 - DIRECTION
      ?auto_5324290 - MODE
      ?auto_5324291 - DIRECTION
      ?auto_5324288 - MODE
      ?auto_5324293 - DIRECTION
      ?auto_5324292 - MODE
      ?auto_5324294 - DIRECTION
      ?auto_5324295 - MODE
      ?auto_5324296 - DIRECTION
      ?auto_5324297 - MODE
    )
    :vars
    (
      ?auto_5324299 - INSTRUMENT
      ?auto_5324298 - SATELLITE
      ?auto_5324300 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5324291 ?auto_5324289 ) ) ( not ( = ?auto_5324293 ?auto_5324289 ) ) ( not ( = ?auto_5324293 ?auto_5324291 ) ) ( not ( = ?auto_5324294 ?auto_5324289 ) ) ( not ( = ?auto_5324294 ?auto_5324291 ) ) ( not ( = ?auto_5324294 ?auto_5324293 ) ) ( not ( = ?auto_5324296 ?auto_5324289 ) ) ( not ( = ?auto_5324296 ?auto_5324291 ) ) ( not ( = ?auto_5324296 ?auto_5324293 ) ) ( not ( = ?auto_5324296 ?auto_5324294 ) ) ( ON_BOARD ?auto_5324299 ?auto_5324298 ) ( SUPPORTS ?auto_5324299 ?auto_5324292 ) ( POINTING ?auto_5324298 ?auto_5324300 ) ( not ( = ?auto_5324293 ?auto_5324300 ) ) ( HAVE_IMAGE ?auto_5324289 ?auto_5324290 ) ( not ( = ?auto_5324289 ?auto_5324300 ) ) ( not ( = ?auto_5324290 ?auto_5324292 ) ) ( CALIBRATION_TARGET ?auto_5324299 ?auto_5324300 ) ( POWER_AVAIL ?auto_5324298 ) ( HAVE_IMAGE ?auto_5324291 ?auto_5324288 ) ( HAVE_IMAGE ?auto_5324294 ?auto_5324295 ) ( HAVE_IMAGE ?auto_5324296 ?auto_5324297 ) ( not ( = ?auto_5324290 ?auto_5324288 ) ) ( not ( = ?auto_5324290 ?auto_5324295 ) ) ( not ( = ?auto_5324290 ?auto_5324297 ) ) ( not ( = ?auto_5324291 ?auto_5324300 ) ) ( not ( = ?auto_5324288 ?auto_5324292 ) ) ( not ( = ?auto_5324288 ?auto_5324295 ) ) ( not ( = ?auto_5324288 ?auto_5324297 ) ) ( not ( = ?auto_5324292 ?auto_5324295 ) ) ( not ( = ?auto_5324292 ?auto_5324297 ) ) ( not ( = ?auto_5324294 ?auto_5324300 ) ) ( not ( = ?auto_5324295 ?auto_5324297 ) ) ( not ( = ?auto_5324296 ?auto_5324300 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5324289 ?auto_5324290 ?auto_5324293 ?auto_5324292 )
      ( GET-5IMAGE-VERIFY ?auto_5324289 ?auto_5324290 ?auto_5324291 ?auto_5324288 ?auto_5324293 ?auto_5324292 ?auto_5324294 ?auto_5324295 ?auto_5324296 ?auto_5324297 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5326486 - DIRECTION
      ?auto_5326487 - MODE
      ?auto_5326488 - DIRECTION
      ?auto_5326485 - MODE
      ?auto_5326490 - DIRECTION
      ?auto_5326489 - MODE
      ?auto_5326491 - DIRECTION
      ?auto_5326492 - MODE
      ?auto_5326493 - DIRECTION
      ?auto_5326494 - MODE
    )
    :vars
    (
      ?auto_5326496 - INSTRUMENT
      ?auto_5326495 - SATELLITE
      ?auto_5326497 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5326488 ?auto_5326486 ) ) ( not ( = ?auto_5326490 ?auto_5326486 ) ) ( not ( = ?auto_5326490 ?auto_5326488 ) ) ( not ( = ?auto_5326491 ?auto_5326486 ) ) ( not ( = ?auto_5326491 ?auto_5326488 ) ) ( not ( = ?auto_5326491 ?auto_5326490 ) ) ( not ( = ?auto_5326493 ?auto_5326486 ) ) ( not ( = ?auto_5326493 ?auto_5326488 ) ) ( not ( = ?auto_5326493 ?auto_5326490 ) ) ( not ( = ?auto_5326493 ?auto_5326491 ) ) ( ON_BOARD ?auto_5326496 ?auto_5326495 ) ( SUPPORTS ?auto_5326496 ?auto_5326485 ) ( POINTING ?auto_5326495 ?auto_5326497 ) ( not ( = ?auto_5326488 ?auto_5326497 ) ) ( HAVE_IMAGE ?auto_5326486 ?auto_5326487 ) ( not ( = ?auto_5326486 ?auto_5326497 ) ) ( not ( = ?auto_5326487 ?auto_5326485 ) ) ( CALIBRATION_TARGET ?auto_5326496 ?auto_5326497 ) ( POWER_AVAIL ?auto_5326495 ) ( HAVE_IMAGE ?auto_5326490 ?auto_5326489 ) ( HAVE_IMAGE ?auto_5326491 ?auto_5326492 ) ( HAVE_IMAGE ?auto_5326493 ?auto_5326494 ) ( not ( = ?auto_5326487 ?auto_5326489 ) ) ( not ( = ?auto_5326487 ?auto_5326492 ) ) ( not ( = ?auto_5326487 ?auto_5326494 ) ) ( not ( = ?auto_5326485 ?auto_5326489 ) ) ( not ( = ?auto_5326485 ?auto_5326492 ) ) ( not ( = ?auto_5326485 ?auto_5326494 ) ) ( not ( = ?auto_5326490 ?auto_5326497 ) ) ( not ( = ?auto_5326489 ?auto_5326492 ) ) ( not ( = ?auto_5326489 ?auto_5326494 ) ) ( not ( = ?auto_5326491 ?auto_5326497 ) ) ( not ( = ?auto_5326492 ?auto_5326494 ) ) ( not ( = ?auto_5326493 ?auto_5326497 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5326486 ?auto_5326487 ?auto_5326488 ?auto_5326485 )
      ( GET-5IMAGE-VERIFY ?auto_5326486 ?auto_5326487 ?auto_5326488 ?auto_5326485 ?auto_5326490 ?auto_5326489 ?auto_5326491 ?auto_5326492 ?auto_5326493 ?auto_5326494 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5343321 - DIRECTION
      ?auto_5343322 - MODE
      ?auto_5343323 - DIRECTION
      ?auto_5343320 - MODE
      ?auto_5343325 - DIRECTION
      ?auto_5343324 - MODE
      ?auto_5343326 - DIRECTION
      ?auto_5343327 - MODE
      ?auto_5343328 - DIRECTION
      ?auto_5343329 - MODE
    )
    :vars
    (
      ?auto_5343331 - INSTRUMENT
      ?auto_5343330 - SATELLITE
      ?auto_5343332 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5343323 ?auto_5343321 ) ) ( not ( = ?auto_5343325 ?auto_5343321 ) ) ( not ( = ?auto_5343325 ?auto_5343323 ) ) ( not ( = ?auto_5343326 ?auto_5343321 ) ) ( not ( = ?auto_5343326 ?auto_5343323 ) ) ( not ( = ?auto_5343326 ?auto_5343325 ) ) ( not ( = ?auto_5343328 ?auto_5343321 ) ) ( not ( = ?auto_5343328 ?auto_5343323 ) ) ( not ( = ?auto_5343328 ?auto_5343325 ) ) ( not ( = ?auto_5343328 ?auto_5343326 ) ) ( ON_BOARD ?auto_5343331 ?auto_5343330 ) ( SUPPORTS ?auto_5343331 ?auto_5343322 ) ( POINTING ?auto_5343330 ?auto_5343332 ) ( not ( = ?auto_5343321 ?auto_5343332 ) ) ( HAVE_IMAGE ?auto_5343323 ?auto_5343320 ) ( not ( = ?auto_5343323 ?auto_5343332 ) ) ( not ( = ?auto_5343320 ?auto_5343322 ) ) ( CALIBRATION_TARGET ?auto_5343331 ?auto_5343332 ) ( POWER_AVAIL ?auto_5343330 ) ( HAVE_IMAGE ?auto_5343325 ?auto_5343324 ) ( HAVE_IMAGE ?auto_5343326 ?auto_5343327 ) ( HAVE_IMAGE ?auto_5343328 ?auto_5343329 ) ( not ( = ?auto_5343322 ?auto_5343324 ) ) ( not ( = ?auto_5343322 ?auto_5343327 ) ) ( not ( = ?auto_5343322 ?auto_5343329 ) ) ( not ( = ?auto_5343320 ?auto_5343324 ) ) ( not ( = ?auto_5343320 ?auto_5343327 ) ) ( not ( = ?auto_5343320 ?auto_5343329 ) ) ( not ( = ?auto_5343325 ?auto_5343332 ) ) ( not ( = ?auto_5343324 ?auto_5343327 ) ) ( not ( = ?auto_5343324 ?auto_5343329 ) ) ( not ( = ?auto_5343326 ?auto_5343332 ) ) ( not ( = ?auto_5343327 ?auto_5343329 ) ) ( not ( = ?auto_5343328 ?auto_5343332 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5343323 ?auto_5343320 ?auto_5343321 ?auto_5343322 )
      ( GET-5IMAGE-VERIFY ?auto_5343321 ?auto_5343322 ?auto_5343323 ?auto_5343320 ?auto_5343325 ?auto_5343324 ?auto_5343326 ?auto_5343327 ?auto_5343328 ?auto_5343329 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5352121 - DIRECTION
      ?auto_5352122 - MODE
      ?auto_5352123 - DIRECTION
      ?auto_5352120 - MODE
      ?auto_5352125 - DIRECTION
      ?auto_5352124 - MODE
      ?auto_5352126 - DIRECTION
      ?auto_5352127 - MODE
    )
    :vars
    (
      ?auto_5352128 - INSTRUMENT
      ?auto_5352131 - SATELLITE
      ?auto_5352129 - DIRECTION
      ?auto_5352130 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5352123 ?auto_5352121 ) ) ( not ( = ?auto_5352125 ?auto_5352121 ) ) ( not ( = ?auto_5352125 ?auto_5352123 ) ) ( not ( = ?auto_5352126 ?auto_5352121 ) ) ( not ( = ?auto_5352126 ?auto_5352123 ) ) ( not ( = ?auto_5352126 ?auto_5352125 ) ) ( ON_BOARD ?auto_5352128 ?auto_5352131 ) ( SUPPORTS ?auto_5352128 ?auto_5352127 ) ( not ( = ?auto_5352126 ?auto_5352129 ) ) ( HAVE_IMAGE ?auto_5352121 ?auto_5352122 ) ( not ( = ?auto_5352121 ?auto_5352129 ) ) ( not ( = ?auto_5352122 ?auto_5352127 ) ) ( CALIBRATION_TARGET ?auto_5352128 ?auto_5352129 ) ( POWER_AVAIL ?auto_5352131 ) ( POINTING ?auto_5352131 ?auto_5352130 ) ( not ( = ?auto_5352129 ?auto_5352130 ) ) ( not ( = ?auto_5352126 ?auto_5352130 ) ) ( not ( = ?auto_5352121 ?auto_5352130 ) ) ( HAVE_IMAGE ?auto_5352123 ?auto_5352120 ) ( HAVE_IMAGE ?auto_5352125 ?auto_5352124 ) ( not ( = ?auto_5352122 ?auto_5352120 ) ) ( not ( = ?auto_5352122 ?auto_5352124 ) ) ( not ( = ?auto_5352123 ?auto_5352129 ) ) ( not ( = ?auto_5352123 ?auto_5352130 ) ) ( not ( = ?auto_5352120 ?auto_5352124 ) ) ( not ( = ?auto_5352120 ?auto_5352127 ) ) ( not ( = ?auto_5352125 ?auto_5352129 ) ) ( not ( = ?auto_5352125 ?auto_5352130 ) ) ( not ( = ?auto_5352124 ?auto_5352127 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5352121 ?auto_5352122 ?auto_5352126 ?auto_5352127 )
      ( GET-4IMAGE-VERIFY ?auto_5352121 ?auto_5352122 ?auto_5352123 ?auto_5352120 ?auto_5352125 ?auto_5352124 ?auto_5352126 ?auto_5352127 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5352168 - DIRECTION
      ?auto_5352169 - MODE
      ?auto_5352170 - DIRECTION
      ?auto_5352167 - MODE
      ?auto_5352172 - DIRECTION
      ?auto_5352171 - MODE
      ?auto_5352173 - DIRECTION
      ?auto_5352174 - MODE
    )
    :vars
    (
      ?auto_5352175 - INSTRUMENT
      ?auto_5352178 - SATELLITE
      ?auto_5352176 - DIRECTION
      ?auto_5352177 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5352170 ?auto_5352168 ) ) ( not ( = ?auto_5352172 ?auto_5352168 ) ) ( not ( = ?auto_5352172 ?auto_5352170 ) ) ( not ( = ?auto_5352173 ?auto_5352168 ) ) ( not ( = ?auto_5352173 ?auto_5352170 ) ) ( not ( = ?auto_5352173 ?auto_5352172 ) ) ( ON_BOARD ?auto_5352175 ?auto_5352178 ) ( SUPPORTS ?auto_5352175 ?auto_5352171 ) ( not ( = ?auto_5352172 ?auto_5352176 ) ) ( HAVE_IMAGE ?auto_5352168 ?auto_5352169 ) ( not ( = ?auto_5352168 ?auto_5352176 ) ) ( not ( = ?auto_5352169 ?auto_5352171 ) ) ( CALIBRATION_TARGET ?auto_5352175 ?auto_5352176 ) ( POWER_AVAIL ?auto_5352178 ) ( POINTING ?auto_5352178 ?auto_5352177 ) ( not ( = ?auto_5352176 ?auto_5352177 ) ) ( not ( = ?auto_5352172 ?auto_5352177 ) ) ( not ( = ?auto_5352168 ?auto_5352177 ) ) ( HAVE_IMAGE ?auto_5352170 ?auto_5352167 ) ( HAVE_IMAGE ?auto_5352173 ?auto_5352174 ) ( not ( = ?auto_5352169 ?auto_5352167 ) ) ( not ( = ?auto_5352169 ?auto_5352174 ) ) ( not ( = ?auto_5352170 ?auto_5352176 ) ) ( not ( = ?auto_5352170 ?auto_5352177 ) ) ( not ( = ?auto_5352167 ?auto_5352171 ) ) ( not ( = ?auto_5352167 ?auto_5352174 ) ) ( not ( = ?auto_5352171 ?auto_5352174 ) ) ( not ( = ?auto_5352173 ?auto_5352176 ) ) ( not ( = ?auto_5352173 ?auto_5352177 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5352168 ?auto_5352169 ?auto_5352172 ?auto_5352171 )
      ( GET-4IMAGE-VERIFY ?auto_5352168 ?auto_5352169 ?auto_5352170 ?auto_5352167 ?auto_5352172 ?auto_5352171 ?auto_5352173 ?auto_5352174 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5352471 - DIRECTION
      ?auto_5352472 - MODE
      ?auto_5352473 - DIRECTION
      ?auto_5352470 - MODE
      ?auto_5352475 - DIRECTION
      ?auto_5352474 - MODE
      ?auto_5352476 - DIRECTION
      ?auto_5352477 - MODE
    )
    :vars
    (
      ?auto_5352478 - INSTRUMENT
      ?auto_5352481 - SATELLITE
      ?auto_5352479 - DIRECTION
      ?auto_5352480 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5352473 ?auto_5352471 ) ) ( not ( = ?auto_5352475 ?auto_5352471 ) ) ( not ( = ?auto_5352475 ?auto_5352473 ) ) ( not ( = ?auto_5352476 ?auto_5352471 ) ) ( not ( = ?auto_5352476 ?auto_5352473 ) ) ( not ( = ?auto_5352476 ?auto_5352475 ) ) ( ON_BOARD ?auto_5352478 ?auto_5352481 ) ( SUPPORTS ?auto_5352478 ?auto_5352470 ) ( not ( = ?auto_5352473 ?auto_5352479 ) ) ( HAVE_IMAGE ?auto_5352471 ?auto_5352472 ) ( not ( = ?auto_5352471 ?auto_5352479 ) ) ( not ( = ?auto_5352472 ?auto_5352470 ) ) ( CALIBRATION_TARGET ?auto_5352478 ?auto_5352479 ) ( POWER_AVAIL ?auto_5352481 ) ( POINTING ?auto_5352481 ?auto_5352480 ) ( not ( = ?auto_5352479 ?auto_5352480 ) ) ( not ( = ?auto_5352473 ?auto_5352480 ) ) ( not ( = ?auto_5352471 ?auto_5352480 ) ) ( HAVE_IMAGE ?auto_5352475 ?auto_5352474 ) ( HAVE_IMAGE ?auto_5352476 ?auto_5352477 ) ( not ( = ?auto_5352472 ?auto_5352474 ) ) ( not ( = ?auto_5352472 ?auto_5352477 ) ) ( not ( = ?auto_5352470 ?auto_5352474 ) ) ( not ( = ?auto_5352470 ?auto_5352477 ) ) ( not ( = ?auto_5352475 ?auto_5352479 ) ) ( not ( = ?auto_5352475 ?auto_5352480 ) ) ( not ( = ?auto_5352474 ?auto_5352477 ) ) ( not ( = ?auto_5352476 ?auto_5352479 ) ) ( not ( = ?auto_5352476 ?auto_5352480 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5352471 ?auto_5352472 ?auto_5352473 ?auto_5352470 )
      ( GET-4IMAGE-VERIFY ?auto_5352471 ?auto_5352472 ?auto_5352473 ?auto_5352470 ?auto_5352475 ?auto_5352474 ?auto_5352476 ?auto_5352477 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5354860 - DIRECTION
      ?auto_5354861 - MODE
      ?auto_5354862 - DIRECTION
      ?auto_5354859 - MODE
      ?auto_5354864 - DIRECTION
      ?auto_5354863 - MODE
      ?auto_5354865 - DIRECTION
      ?auto_5354866 - MODE
    )
    :vars
    (
      ?auto_5354867 - INSTRUMENT
      ?auto_5354870 - SATELLITE
      ?auto_5354868 - DIRECTION
      ?auto_5354869 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5354862 ?auto_5354860 ) ) ( not ( = ?auto_5354864 ?auto_5354860 ) ) ( not ( = ?auto_5354864 ?auto_5354862 ) ) ( not ( = ?auto_5354865 ?auto_5354860 ) ) ( not ( = ?auto_5354865 ?auto_5354862 ) ) ( not ( = ?auto_5354865 ?auto_5354864 ) ) ( ON_BOARD ?auto_5354867 ?auto_5354870 ) ( SUPPORTS ?auto_5354867 ?auto_5354861 ) ( not ( = ?auto_5354860 ?auto_5354868 ) ) ( HAVE_IMAGE ?auto_5354862 ?auto_5354859 ) ( not ( = ?auto_5354862 ?auto_5354868 ) ) ( not ( = ?auto_5354859 ?auto_5354861 ) ) ( CALIBRATION_TARGET ?auto_5354867 ?auto_5354868 ) ( POWER_AVAIL ?auto_5354870 ) ( POINTING ?auto_5354870 ?auto_5354869 ) ( not ( = ?auto_5354868 ?auto_5354869 ) ) ( not ( = ?auto_5354860 ?auto_5354869 ) ) ( not ( = ?auto_5354862 ?auto_5354869 ) ) ( HAVE_IMAGE ?auto_5354864 ?auto_5354863 ) ( HAVE_IMAGE ?auto_5354865 ?auto_5354866 ) ( not ( = ?auto_5354861 ?auto_5354863 ) ) ( not ( = ?auto_5354861 ?auto_5354866 ) ) ( not ( = ?auto_5354859 ?auto_5354863 ) ) ( not ( = ?auto_5354859 ?auto_5354866 ) ) ( not ( = ?auto_5354864 ?auto_5354868 ) ) ( not ( = ?auto_5354864 ?auto_5354869 ) ) ( not ( = ?auto_5354863 ?auto_5354866 ) ) ( not ( = ?auto_5354865 ?auto_5354868 ) ) ( not ( = ?auto_5354865 ?auto_5354869 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5354862 ?auto_5354859 ?auto_5354860 ?auto_5354861 )
      ( GET-4IMAGE-VERIFY ?auto_5354860 ?auto_5354861 ?auto_5354862 ?auto_5354859 ?auto_5354864 ?auto_5354863 ?auto_5354865 ?auto_5354866 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5357387 - DIRECTION
      ?auto_5357388 - MODE
      ?auto_5357389 - DIRECTION
      ?auto_5357386 - MODE
      ?auto_5357391 - DIRECTION
      ?auto_5357390 - MODE
      ?auto_5357392 - DIRECTION
      ?auto_5357393 - MODE
      ?auto_5357394 - DIRECTION
      ?auto_5357395 - MODE
    )
    :vars
    (
      ?auto_5357396 - INSTRUMENT
      ?auto_5357398 - SATELLITE
      ?auto_5357397 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5357389 ?auto_5357387 ) ) ( not ( = ?auto_5357391 ?auto_5357387 ) ) ( not ( = ?auto_5357391 ?auto_5357389 ) ) ( not ( = ?auto_5357392 ?auto_5357387 ) ) ( not ( = ?auto_5357392 ?auto_5357389 ) ) ( not ( = ?auto_5357392 ?auto_5357391 ) ) ( not ( = ?auto_5357394 ?auto_5357387 ) ) ( not ( = ?auto_5357394 ?auto_5357389 ) ) ( not ( = ?auto_5357394 ?auto_5357391 ) ) ( not ( = ?auto_5357394 ?auto_5357392 ) ) ( ON_BOARD ?auto_5357396 ?auto_5357398 ) ( SUPPORTS ?auto_5357396 ?auto_5357395 ) ( not ( = ?auto_5357394 ?auto_5357397 ) ) ( HAVE_IMAGE ?auto_5357387 ?auto_5357388 ) ( not ( = ?auto_5357387 ?auto_5357397 ) ) ( not ( = ?auto_5357388 ?auto_5357395 ) ) ( CALIBRATION_TARGET ?auto_5357396 ?auto_5357397 ) ( POWER_AVAIL ?auto_5357398 ) ( POINTING ?auto_5357398 ?auto_5357392 ) ( not ( = ?auto_5357397 ?auto_5357392 ) ) ( HAVE_IMAGE ?auto_5357389 ?auto_5357386 ) ( HAVE_IMAGE ?auto_5357391 ?auto_5357390 ) ( HAVE_IMAGE ?auto_5357392 ?auto_5357393 ) ( not ( = ?auto_5357388 ?auto_5357386 ) ) ( not ( = ?auto_5357388 ?auto_5357390 ) ) ( not ( = ?auto_5357388 ?auto_5357393 ) ) ( not ( = ?auto_5357389 ?auto_5357397 ) ) ( not ( = ?auto_5357386 ?auto_5357390 ) ) ( not ( = ?auto_5357386 ?auto_5357393 ) ) ( not ( = ?auto_5357386 ?auto_5357395 ) ) ( not ( = ?auto_5357391 ?auto_5357397 ) ) ( not ( = ?auto_5357390 ?auto_5357393 ) ) ( not ( = ?auto_5357390 ?auto_5357395 ) ) ( not ( = ?auto_5357393 ?auto_5357395 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5357387 ?auto_5357388 ?auto_5357394 ?auto_5357395 )
      ( GET-5IMAGE-VERIFY ?auto_5357387 ?auto_5357388 ?auto_5357389 ?auto_5357386 ?auto_5357391 ?auto_5357390 ?auto_5357392 ?auto_5357393 ?auto_5357394 ?auto_5357395 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5357442 - DIRECTION
      ?auto_5357443 - MODE
      ?auto_5357444 - DIRECTION
      ?auto_5357441 - MODE
      ?auto_5357446 - DIRECTION
      ?auto_5357445 - MODE
      ?auto_5357447 - DIRECTION
      ?auto_5357448 - MODE
      ?auto_5357449 - DIRECTION
      ?auto_5357450 - MODE
    )
    :vars
    (
      ?auto_5357451 - INSTRUMENT
      ?auto_5357453 - SATELLITE
      ?auto_5357452 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5357444 ?auto_5357442 ) ) ( not ( = ?auto_5357446 ?auto_5357442 ) ) ( not ( = ?auto_5357446 ?auto_5357444 ) ) ( not ( = ?auto_5357447 ?auto_5357442 ) ) ( not ( = ?auto_5357447 ?auto_5357444 ) ) ( not ( = ?auto_5357447 ?auto_5357446 ) ) ( not ( = ?auto_5357449 ?auto_5357442 ) ) ( not ( = ?auto_5357449 ?auto_5357444 ) ) ( not ( = ?auto_5357449 ?auto_5357446 ) ) ( not ( = ?auto_5357449 ?auto_5357447 ) ) ( ON_BOARD ?auto_5357451 ?auto_5357453 ) ( SUPPORTS ?auto_5357451 ?auto_5357448 ) ( not ( = ?auto_5357447 ?auto_5357452 ) ) ( HAVE_IMAGE ?auto_5357442 ?auto_5357443 ) ( not ( = ?auto_5357442 ?auto_5357452 ) ) ( not ( = ?auto_5357443 ?auto_5357448 ) ) ( CALIBRATION_TARGET ?auto_5357451 ?auto_5357452 ) ( POWER_AVAIL ?auto_5357453 ) ( POINTING ?auto_5357453 ?auto_5357449 ) ( not ( = ?auto_5357452 ?auto_5357449 ) ) ( HAVE_IMAGE ?auto_5357444 ?auto_5357441 ) ( HAVE_IMAGE ?auto_5357446 ?auto_5357445 ) ( HAVE_IMAGE ?auto_5357449 ?auto_5357450 ) ( not ( = ?auto_5357443 ?auto_5357441 ) ) ( not ( = ?auto_5357443 ?auto_5357445 ) ) ( not ( = ?auto_5357443 ?auto_5357450 ) ) ( not ( = ?auto_5357444 ?auto_5357452 ) ) ( not ( = ?auto_5357441 ?auto_5357445 ) ) ( not ( = ?auto_5357441 ?auto_5357448 ) ) ( not ( = ?auto_5357441 ?auto_5357450 ) ) ( not ( = ?auto_5357446 ?auto_5357452 ) ) ( not ( = ?auto_5357445 ?auto_5357448 ) ) ( not ( = ?auto_5357445 ?auto_5357450 ) ) ( not ( = ?auto_5357448 ?auto_5357450 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5357442 ?auto_5357443 ?auto_5357447 ?auto_5357448 )
      ( GET-5IMAGE-VERIFY ?auto_5357442 ?auto_5357443 ?auto_5357444 ?auto_5357441 ?auto_5357446 ?auto_5357445 ?auto_5357447 ?auto_5357448 ?auto_5357449 ?auto_5357450 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5357495 - DIRECTION
      ?auto_5357496 - MODE
      ?auto_5357497 - DIRECTION
      ?auto_5357494 - MODE
      ?auto_5357499 - DIRECTION
      ?auto_5357498 - MODE
      ?auto_5357500 - DIRECTION
      ?auto_5357501 - MODE
      ?auto_5357502 - DIRECTION
      ?auto_5357503 - MODE
    )
    :vars
    (
      ?auto_5357504 - INSTRUMENT
      ?auto_5357506 - SATELLITE
      ?auto_5357505 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5357497 ?auto_5357495 ) ) ( not ( = ?auto_5357499 ?auto_5357495 ) ) ( not ( = ?auto_5357499 ?auto_5357497 ) ) ( not ( = ?auto_5357500 ?auto_5357495 ) ) ( not ( = ?auto_5357500 ?auto_5357497 ) ) ( not ( = ?auto_5357500 ?auto_5357499 ) ) ( not ( = ?auto_5357502 ?auto_5357495 ) ) ( not ( = ?auto_5357502 ?auto_5357497 ) ) ( not ( = ?auto_5357502 ?auto_5357499 ) ) ( not ( = ?auto_5357502 ?auto_5357500 ) ) ( ON_BOARD ?auto_5357504 ?auto_5357506 ) ( SUPPORTS ?auto_5357504 ?auto_5357503 ) ( not ( = ?auto_5357502 ?auto_5357505 ) ) ( HAVE_IMAGE ?auto_5357495 ?auto_5357496 ) ( not ( = ?auto_5357495 ?auto_5357505 ) ) ( not ( = ?auto_5357496 ?auto_5357503 ) ) ( CALIBRATION_TARGET ?auto_5357504 ?auto_5357505 ) ( POWER_AVAIL ?auto_5357506 ) ( POINTING ?auto_5357506 ?auto_5357499 ) ( not ( = ?auto_5357505 ?auto_5357499 ) ) ( HAVE_IMAGE ?auto_5357497 ?auto_5357494 ) ( HAVE_IMAGE ?auto_5357499 ?auto_5357498 ) ( HAVE_IMAGE ?auto_5357500 ?auto_5357501 ) ( not ( = ?auto_5357496 ?auto_5357494 ) ) ( not ( = ?auto_5357496 ?auto_5357498 ) ) ( not ( = ?auto_5357496 ?auto_5357501 ) ) ( not ( = ?auto_5357497 ?auto_5357505 ) ) ( not ( = ?auto_5357494 ?auto_5357498 ) ) ( not ( = ?auto_5357494 ?auto_5357501 ) ) ( not ( = ?auto_5357494 ?auto_5357503 ) ) ( not ( = ?auto_5357498 ?auto_5357501 ) ) ( not ( = ?auto_5357498 ?auto_5357503 ) ) ( not ( = ?auto_5357500 ?auto_5357505 ) ) ( not ( = ?auto_5357501 ?auto_5357503 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5357495 ?auto_5357496 ?auto_5357502 ?auto_5357503 )
      ( GET-5IMAGE-VERIFY ?auto_5357495 ?auto_5357496 ?auto_5357497 ?auto_5357494 ?auto_5357499 ?auto_5357498 ?auto_5357500 ?auto_5357501 ?auto_5357502 ?auto_5357503 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5357547 - DIRECTION
      ?auto_5357548 - MODE
      ?auto_5357549 - DIRECTION
      ?auto_5357546 - MODE
      ?auto_5357551 - DIRECTION
      ?auto_5357550 - MODE
      ?auto_5357552 - DIRECTION
      ?auto_5357553 - MODE
      ?auto_5357554 - DIRECTION
      ?auto_5357555 - MODE
    )
    :vars
    (
      ?auto_5357556 - INSTRUMENT
      ?auto_5357558 - SATELLITE
      ?auto_5357557 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5357549 ?auto_5357547 ) ) ( not ( = ?auto_5357551 ?auto_5357547 ) ) ( not ( = ?auto_5357551 ?auto_5357549 ) ) ( not ( = ?auto_5357552 ?auto_5357547 ) ) ( not ( = ?auto_5357552 ?auto_5357549 ) ) ( not ( = ?auto_5357552 ?auto_5357551 ) ) ( not ( = ?auto_5357554 ?auto_5357547 ) ) ( not ( = ?auto_5357554 ?auto_5357549 ) ) ( not ( = ?auto_5357554 ?auto_5357551 ) ) ( not ( = ?auto_5357554 ?auto_5357552 ) ) ( ON_BOARD ?auto_5357556 ?auto_5357558 ) ( SUPPORTS ?auto_5357556 ?auto_5357553 ) ( not ( = ?auto_5357552 ?auto_5357557 ) ) ( HAVE_IMAGE ?auto_5357547 ?auto_5357548 ) ( not ( = ?auto_5357547 ?auto_5357557 ) ) ( not ( = ?auto_5357548 ?auto_5357553 ) ) ( CALIBRATION_TARGET ?auto_5357556 ?auto_5357557 ) ( POWER_AVAIL ?auto_5357558 ) ( POINTING ?auto_5357558 ?auto_5357551 ) ( not ( = ?auto_5357557 ?auto_5357551 ) ) ( HAVE_IMAGE ?auto_5357549 ?auto_5357546 ) ( HAVE_IMAGE ?auto_5357551 ?auto_5357550 ) ( HAVE_IMAGE ?auto_5357554 ?auto_5357555 ) ( not ( = ?auto_5357548 ?auto_5357546 ) ) ( not ( = ?auto_5357548 ?auto_5357550 ) ) ( not ( = ?auto_5357548 ?auto_5357555 ) ) ( not ( = ?auto_5357549 ?auto_5357557 ) ) ( not ( = ?auto_5357546 ?auto_5357550 ) ) ( not ( = ?auto_5357546 ?auto_5357553 ) ) ( not ( = ?auto_5357546 ?auto_5357555 ) ) ( not ( = ?auto_5357550 ?auto_5357553 ) ) ( not ( = ?auto_5357550 ?auto_5357555 ) ) ( not ( = ?auto_5357553 ?auto_5357555 ) ) ( not ( = ?auto_5357554 ?auto_5357557 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5357547 ?auto_5357548 ?auto_5357552 ?auto_5357553 )
      ( GET-5IMAGE-VERIFY ?auto_5357547 ?auto_5357548 ?auto_5357549 ?auto_5357546 ?auto_5357551 ?auto_5357550 ?auto_5357552 ?auto_5357553 ?auto_5357554 ?auto_5357555 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5357766 - DIRECTION
      ?auto_5357767 - MODE
      ?auto_5357768 - DIRECTION
      ?auto_5357765 - MODE
      ?auto_5357770 - DIRECTION
      ?auto_5357769 - MODE
      ?auto_5357771 - DIRECTION
      ?auto_5357772 - MODE
      ?auto_5357773 - DIRECTION
      ?auto_5357774 - MODE
    )
    :vars
    (
      ?auto_5357775 - INSTRUMENT
      ?auto_5357777 - SATELLITE
      ?auto_5357776 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5357768 ?auto_5357766 ) ) ( not ( = ?auto_5357770 ?auto_5357766 ) ) ( not ( = ?auto_5357770 ?auto_5357768 ) ) ( not ( = ?auto_5357771 ?auto_5357766 ) ) ( not ( = ?auto_5357771 ?auto_5357768 ) ) ( not ( = ?auto_5357771 ?auto_5357770 ) ) ( not ( = ?auto_5357773 ?auto_5357766 ) ) ( not ( = ?auto_5357773 ?auto_5357768 ) ) ( not ( = ?auto_5357773 ?auto_5357770 ) ) ( not ( = ?auto_5357773 ?auto_5357771 ) ) ( ON_BOARD ?auto_5357775 ?auto_5357777 ) ( SUPPORTS ?auto_5357775 ?auto_5357769 ) ( not ( = ?auto_5357770 ?auto_5357776 ) ) ( HAVE_IMAGE ?auto_5357766 ?auto_5357767 ) ( not ( = ?auto_5357766 ?auto_5357776 ) ) ( not ( = ?auto_5357767 ?auto_5357769 ) ) ( CALIBRATION_TARGET ?auto_5357775 ?auto_5357776 ) ( POWER_AVAIL ?auto_5357777 ) ( POINTING ?auto_5357777 ?auto_5357773 ) ( not ( = ?auto_5357776 ?auto_5357773 ) ) ( HAVE_IMAGE ?auto_5357768 ?auto_5357765 ) ( HAVE_IMAGE ?auto_5357771 ?auto_5357772 ) ( HAVE_IMAGE ?auto_5357773 ?auto_5357774 ) ( not ( = ?auto_5357767 ?auto_5357765 ) ) ( not ( = ?auto_5357767 ?auto_5357772 ) ) ( not ( = ?auto_5357767 ?auto_5357774 ) ) ( not ( = ?auto_5357768 ?auto_5357776 ) ) ( not ( = ?auto_5357765 ?auto_5357769 ) ) ( not ( = ?auto_5357765 ?auto_5357772 ) ) ( not ( = ?auto_5357765 ?auto_5357774 ) ) ( not ( = ?auto_5357769 ?auto_5357772 ) ) ( not ( = ?auto_5357769 ?auto_5357774 ) ) ( not ( = ?auto_5357771 ?auto_5357776 ) ) ( not ( = ?auto_5357772 ?auto_5357774 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5357766 ?auto_5357767 ?auto_5357770 ?auto_5357769 )
      ( GET-5IMAGE-VERIFY ?auto_5357766 ?auto_5357767 ?auto_5357768 ?auto_5357765 ?auto_5357770 ?auto_5357769 ?auto_5357771 ?auto_5357772 ?auto_5357773 ?auto_5357774 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5357819 - DIRECTION
      ?auto_5357820 - MODE
      ?auto_5357821 - DIRECTION
      ?auto_5357818 - MODE
      ?auto_5357823 - DIRECTION
      ?auto_5357822 - MODE
      ?auto_5357824 - DIRECTION
      ?auto_5357825 - MODE
      ?auto_5357826 - DIRECTION
      ?auto_5357827 - MODE
    )
    :vars
    (
      ?auto_5357828 - INSTRUMENT
      ?auto_5357830 - SATELLITE
      ?auto_5357829 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5357821 ?auto_5357819 ) ) ( not ( = ?auto_5357823 ?auto_5357819 ) ) ( not ( = ?auto_5357823 ?auto_5357821 ) ) ( not ( = ?auto_5357824 ?auto_5357819 ) ) ( not ( = ?auto_5357824 ?auto_5357821 ) ) ( not ( = ?auto_5357824 ?auto_5357823 ) ) ( not ( = ?auto_5357826 ?auto_5357819 ) ) ( not ( = ?auto_5357826 ?auto_5357821 ) ) ( not ( = ?auto_5357826 ?auto_5357823 ) ) ( not ( = ?auto_5357826 ?auto_5357824 ) ) ( ON_BOARD ?auto_5357828 ?auto_5357830 ) ( SUPPORTS ?auto_5357828 ?auto_5357822 ) ( not ( = ?auto_5357823 ?auto_5357829 ) ) ( HAVE_IMAGE ?auto_5357819 ?auto_5357820 ) ( not ( = ?auto_5357819 ?auto_5357829 ) ) ( not ( = ?auto_5357820 ?auto_5357822 ) ) ( CALIBRATION_TARGET ?auto_5357828 ?auto_5357829 ) ( POWER_AVAIL ?auto_5357830 ) ( POINTING ?auto_5357830 ?auto_5357824 ) ( not ( = ?auto_5357829 ?auto_5357824 ) ) ( HAVE_IMAGE ?auto_5357821 ?auto_5357818 ) ( HAVE_IMAGE ?auto_5357824 ?auto_5357825 ) ( HAVE_IMAGE ?auto_5357826 ?auto_5357827 ) ( not ( = ?auto_5357820 ?auto_5357818 ) ) ( not ( = ?auto_5357820 ?auto_5357825 ) ) ( not ( = ?auto_5357820 ?auto_5357827 ) ) ( not ( = ?auto_5357821 ?auto_5357829 ) ) ( not ( = ?auto_5357818 ?auto_5357822 ) ) ( not ( = ?auto_5357818 ?auto_5357825 ) ) ( not ( = ?auto_5357818 ?auto_5357827 ) ) ( not ( = ?auto_5357822 ?auto_5357825 ) ) ( not ( = ?auto_5357822 ?auto_5357827 ) ) ( not ( = ?auto_5357825 ?auto_5357827 ) ) ( not ( = ?auto_5357826 ?auto_5357829 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5357819 ?auto_5357820 ?auto_5357823 ?auto_5357822 )
      ( GET-5IMAGE-VERIFY ?auto_5357819 ?auto_5357820 ?auto_5357821 ?auto_5357818 ?auto_5357823 ?auto_5357822 ?auto_5357824 ?auto_5357825 ?auto_5357826 ?auto_5357827 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5358882 - DIRECTION
      ?auto_5358883 - MODE
      ?auto_5358884 - DIRECTION
      ?auto_5358881 - MODE
      ?auto_5358886 - DIRECTION
      ?auto_5358885 - MODE
      ?auto_5358887 - DIRECTION
      ?auto_5358888 - MODE
      ?auto_5358889 - DIRECTION
      ?auto_5358890 - MODE
    )
    :vars
    (
      ?auto_5358891 - INSTRUMENT
      ?auto_5358893 - SATELLITE
      ?auto_5358892 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5358884 ?auto_5358882 ) ) ( not ( = ?auto_5358886 ?auto_5358882 ) ) ( not ( = ?auto_5358886 ?auto_5358884 ) ) ( not ( = ?auto_5358887 ?auto_5358882 ) ) ( not ( = ?auto_5358887 ?auto_5358884 ) ) ( not ( = ?auto_5358887 ?auto_5358886 ) ) ( not ( = ?auto_5358889 ?auto_5358882 ) ) ( not ( = ?auto_5358889 ?auto_5358884 ) ) ( not ( = ?auto_5358889 ?auto_5358886 ) ) ( not ( = ?auto_5358889 ?auto_5358887 ) ) ( ON_BOARD ?auto_5358891 ?auto_5358893 ) ( SUPPORTS ?auto_5358891 ?auto_5358890 ) ( not ( = ?auto_5358889 ?auto_5358892 ) ) ( HAVE_IMAGE ?auto_5358882 ?auto_5358883 ) ( not ( = ?auto_5358882 ?auto_5358892 ) ) ( not ( = ?auto_5358883 ?auto_5358890 ) ) ( CALIBRATION_TARGET ?auto_5358891 ?auto_5358892 ) ( POWER_AVAIL ?auto_5358893 ) ( POINTING ?auto_5358893 ?auto_5358884 ) ( not ( = ?auto_5358892 ?auto_5358884 ) ) ( HAVE_IMAGE ?auto_5358884 ?auto_5358881 ) ( HAVE_IMAGE ?auto_5358886 ?auto_5358885 ) ( HAVE_IMAGE ?auto_5358887 ?auto_5358888 ) ( not ( = ?auto_5358883 ?auto_5358881 ) ) ( not ( = ?auto_5358883 ?auto_5358885 ) ) ( not ( = ?auto_5358883 ?auto_5358888 ) ) ( not ( = ?auto_5358881 ?auto_5358885 ) ) ( not ( = ?auto_5358881 ?auto_5358888 ) ) ( not ( = ?auto_5358881 ?auto_5358890 ) ) ( not ( = ?auto_5358886 ?auto_5358892 ) ) ( not ( = ?auto_5358885 ?auto_5358888 ) ) ( not ( = ?auto_5358885 ?auto_5358890 ) ) ( not ( = ?auto_5358887 ?auto_5358892 ) ) ( not ( = ?auto_5358888 ?auto_5358890 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5358882 ?auto_5358883 ?auto_5358889 ?auto_5358890 )
      ( GET-5IMAGE-VERIFY ?auto_5358882 ?auto_5358883 ?auto_5358884 ?auto_5358881 ?auto_5358886 ?auto_5358885 ?auto_5358887 ?auto_5358888 ?auto_5358889 ?auto_5358890 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5358934 - DIRECTION
      ?auto_5358935 - MODE
      ?auto_5358936 - DIRECTION
      ?auto_5358933 - MODE
      ?auto_5358938 - DIRECTION
      ?auto_5358937 - MODE
      ?auto_5358939 - DIRECTION
      ?auto_5358940 - MODE
      ?auto_5358941 - DIRECTION
      ?auto_5358942 - MODE
    )
    :vars
    (
      ?auto_5358943 - INSTRUMENT
      ?auto_5358945 - SATELLITE
      ?auto_5358944 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5358936 ?auto_5358934 ) ) ( not ( = ?auto_5358938 ?auto_5358934 ) ) ( not ( = ?auto_5358938 ?auto_5358936 ) ) ( not ( = ?auto_5358939 ?auto_5358934 ) ) ( not ( = ?auto_5358939 ?auto_5358936 ) ) ( not ( = ?auto_5358939 ?auto_5358938 ) ) ( not ( = ?auto_5358941 ?auto_5358934 ) ) ( not ( = ?auto_5358941 ?auto_5358936 ) ) ( not ( = ?auto_5358941 ?auto_5358938 ) ) ( not ( = ?auto_5358941 ?auto_5358939 ) ) ( ON_BOARD ?auto_5358943 ?auto_5358945 ) ( SUPPORTS ?auto_5358943 ?auto_5358940 ) ( not ( = ?auto_5358939 ?auto_5358944 ) ) ( HAVE_IMAGE ?auto_5358934 ?auto_5358935 ) ( not ( = ?auto_5358934 ?auto_5358944 ) ) ( not ( = ?auto_5358935 ?auto_5358940 ) ) ( CALIBRATION_TARGET ?auto_5358943 ?auto_5358944 ) ( POWER_AVAIL ?auto_5358945 ) ( POINTING ?auto_5358945 ?auto_5358936 ) ( not ( = ?auto_5358944 ?auto_5358936 ) ) ( HAVE_IMAGE ?auto_5358936 ?auto_5358933 ) ( HAVE_IMAGE ?auto_5358938 ?auto_5358937 ) ( HAVE_IMAGE ?auto_5358941 ?auto_5358942 ) ( not ( = ?auto_5358935 ?auto_5358933 ) ) ( not ( = ?auto_5358935 ?auto_5358937 ) ) ( not ( = ?auto_5358935 ?auto_5358942 ) ) ( not ( = ?auto_5358933 ?auto_5358937 ) ) ( not ( = ?auto_5358933 ?auto_5358940 ) ) ( not ( = ?auto_5358933 ?auto_5358942 ) ) ( not ( = ?auto_5358938 ?auto_5358944 ) ) ( not ( = ?auto_5358937 ?auto_5358940 ) ) ( not ( = ?auto_5358937 ?auto_5358942 ) ) ( not ( = ?auto_5358940 ?auto_5358942 ) ) ( not ( = ?auto_5358941 ?auto_5358944 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5358934 ?auto_5358935 ?auto_5358939 ?auto_5358940 )
      ( GET-5IMAGE-VERIFY ?auto_5358934 ?auto_5358935 ?auto_5358936 ?auto_5358933 ?auto_5358938 ?auto_5358937 ?auto_5358939 ?auto_5358940 ?auto_5358941 ?auto_5358942 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5359292 - DIRECTION
      ?auto_5359293 - MODE
      ?auto_5359294 - DIRECTION
      ?auto_5359291 - MODE
      ?auto_5359296 - DIRECTION
      ?auto_5359295 - MODE
      ?auto_5359297 - DIRECTION
      ?auto_5359298 - MODE
      ?auto_5359299 - DIRECTION
      ?auto_5359300 - MODE
    )
    :vars
    (
      ?auto_5359301 - INSTRUMENT
      ?auto_5359303 - SATELLITE
      ?auto_5359302 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5359294 ?auto_5359292 ) ) ( not ( = ?auto_5359296 ?auto_5359292 ) ) ( not ( = ?auto_5359296 ?auto_5359294 ) ) ( not ( = ?auto_5359297 ?auto_5359292 ) ) ( not ( = ?auto_5359297 ?auto_5359294 ) ) ( not ( = ?auto_5359297 ?auto_5359296 ) ) ( not ( = ?auto_5359299 ?auto_5359292 ) ) ( not ( = ?auto_5359299 ?auto_5359294 ) ) ( not ( = ?auto_5359299 ?auto_5359296 ) ) ( not ( = ?auto_5359299 ?auto_5359297 ) ) ( ON_BOARD ?auto_5359301 ?auto_5359303 ) ( SUPPORTS ?auto_5359301 ?auto_5359295 ) ( not ( = ?auto_5359296 ?auto_5359302 ) ) ( HAVE_IMAGE ?auto_5359292 ?auto_5359293 ) ( not ( = ?auto_5359292 ?auto_5359302 ) ) ( not ( = ?auto_5359293 ?auto_5359295 ) ) ( CALIBRATION_TARGET ?auto_5359301 ?auto_5359302 ) ( POWER_AVAIL ?auto_5359303 ) ( POINTING ?auto_5359303 ?auto_5359294 ) ( not ( = ?auto_5359302 ?auto_5359294 ) ) ( HAVE_IMAGE ?auto_5359294 ?auto_5359291 ) ( HAVE_IMAGE ?auto_5359297 ?auto_5359298 ) ( HAVE_IMAGE ?auto_5359299 ?auto_5359300 ) ( not ( = ?auto_5359293 ?auto_5359291 ) ) ( not ( = ?auto_5359293 ?auto_5359298 ) ) ( not ( = ?auto_5359293 ?auto_5359300 ) ) ( not ( = ?auto_5359291 ?auto_5359295 ) ) ( not ( = ?auto_5359291 ?auto_5359298 ) ) ( not ( = ?auto_5359291 ?auto_5359300 ) ) ( not ( = ?auto_5359295 ?auto_5359298 ) ) ( not ( = ?auto_5359295 ?auto_5359300 ) ) ( not ( = ?auto_5359297 ?auto_5359302 ) ) ( not ( = ?auto_5359298 ?auto_5359300 ) ) ( not ( = ?auto_5359299 ?auto_5359302 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5359292 ?auto_5359293 ?auto_5359296 ?auto_5359295 )
      ( GET-5IMAGE-VERIFY ?auto_5359292 ?auto_5359293 ?auto_5359294 ?auto_5359291 ?auto_5359296 ?auto_5359295 ?auto_5359297 ?auto_5359298 ?auto_5359299 ?auto_5359300 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5360044 - DIRECTION
      ?auto_5360045 - MODE
      ?auto_5360046 - DIRECTION
      ?auto_5360043 - MODE
      ?auto_5360048 - DIRECTION
      ?auto_5360047 - MODE
      ?auto_5360049 - DIRECTION
      ?auto_5360050 - MODE
      ?auto_5360051 - DIRECTION
      ?auto_5360052 - MODE
    )
    :vars
    (
      ?auto_5360053 - INSTRUMENT
      ?auto_5360055 - SATELLITE
      ?auto_5360054 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5360046 ?auto_5360044 ) ) ( not ( = ?auto_5360048 ?auto_5360044 ) ) ( not ( = ?auto_5360048 ?auto_5360046 ) ) ( not ( = ?auto_5360049 ?auto_5360044 ) ) ( not ( = ?auto_5360049 ?auto_5360046 ) ) ( not ( = ?auto_5360049 ?auto_5360048 ) ) ( not ( = ?auto_5360051 ?auto_5360044 ) ) ( not ( = ?auto_5360051 ?auto_5360046 ) ) ( not ( = ?auto_5360051 ?auto_5360048 ) ) ( not ( = ?auto_5360051 ?auto_5360049 ) ) ( ON_BOARD ?auto_5360053 ?auto_5360055 ) ( SUPPORTS ?auto_5360053 ?auto_5360043 ) ( not ( = ?auto_5360046 ?auto_5360054 ) ) ( HAVE_IMAGE ?auto_5360044 ?auto_5360045 ) ( not ( = ?auto_5360044 ?auto_5360054 ) ) ( not ( = ?auto_5360045 ?auto_5360043 ) ) ( CALIBRATION_TARGET ?auto_5360053 ?auto_5360054 ) ( POWER_AVAIL ?auto_5360055 ) ( POINTING ?auto_5360055 ?auto_5360051 ) ( not ( = ?auto_5360054 ?auto_5360051 ) ) ( HAVE_IMAGE ?auto_5360048 ?auto_5360047 ) ( HAVE_IMAGE ?auto_5360049 ?auto_5360050 ) ( HAVE_IMAGE ?auto_5360051 ?auto_5360052 ) ( not ( = ?auto_5360045 ?auto_5360047 ) ) ( not ( = ?auto_5360045 ?auto_5360050 ) ) ( not ( = ?auto_5360045 ?auto_5360052 ) ) ( not ( = ?auto_5360043 ?auto_5360047 ) ) ( not ( = ?auto_5360043 ?auto_5360050 ) ) ( not ( = ?auto_5360043 ?auto_5360052 ) ) ( not ( = ?auto_5360048 ?auto_5360054 ) ) ( not ( = ?auto_5360047 ?auto_5360050 ) ) ( not ( = ?auto_5360047 ?auto_5360052 ) ) ( not ( = ?auto_5360049 ?auto_5360054 ) ) ( not ( = ?auto_5360050 ?auto_5360052 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5360044 ?auto_5360045 ?auto_5360046 ?auto_5360043 )
      ( GET-5IMAGE-VERIFY ?auto_5360044 ?auto_5360045 ?auto_5360046 ?auto_5360043 ?auto_5360048 ?auto_5360047 ?auto_5360049 ?auto_5360050 ?auto_5360051 ?auto_5360052 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5360097 - DIRECTION
      ?auto_5360098 - MODE
      ?auto_5360099 - DIRECTION
      ?auto_5360096 - MODE
      ?auto_5360101 - DIRECTION
      ?auto_5360100 - MODE
      ?auto_5360102 - DIRECTION
      ?auto_5360103 - MODE
      ?auto_5360104 - DIRECTION
      ?auto_5360105 - MODE
    )
    :vars
    (
      ?auto_5360106 - INSTRUMENT
      ?auto_5360108 - SATELLITE
      ?auto_5360107 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5360099 ?auto_5360097 ) ) ( not ( = ?auto_5360101 ?auto_5360097 ) ) ( not ( = ?auto_5360101 ?auto_5360099 ) ) ( not ( = ?auto_5360102 ?auto_5360097 ) ) ( not ( = ?auto_5360102 ?auto_5360099 ) ) ( not ( = ?auto_5360102 ?auto_5360101 ) ) ( not ( = ?auto_5360104 ?auto_5360097 ) ) ( not ( = ?auto_5360104 ?auto_5360099 ) ) ( not ( = ?auto_5360104 ?auto_5360101 ) ) ( not ( = ?auto_5360104 ?auto_5360102 ) ) ( ON_BOARD ?auto_5360106 ?auto_5360108 ) ( SUPPORTS ?auto_5360106 ?auto_5360096 ) ( not ( = ?auto_5360099 ?auto_5360107 ) ) ( HAVE_IMAGE ?auto_5360097 ?auto_5360098 ) ( not ( = ?auto_5360097 ?auto_5360107 ) ) ( not ( = ?auto_5360098 ?auto_5360096 ) ) ( CALIBRATION_TARGET ?auto_5360106 ?auto_5360107 ) ( POWER_AVAIL ?auto_5360108 ) ( POINTING ?auto_5360108 ?auto_5360102 ) ( not ( = ?auto_5360107 ?auto_5360102 ) ) ( HAVE_IMAGE ?auto_5360101 ?auto_5360100 ) ( HAVE_IMAGE ?auto_5360102 ?auto_5360103 ) ( HAVE_IMAGE ?auto_5360104 ?auto_5360105 ) ( not ( = ?auto_5360098 ?auto_5360100 ) ) ( not ( = ?auto_5360098 ?auto_5360103 ) ) ( not ( = ?auto_5360098 ?auto_5360105 ) ) ( not ( = ?auto_5360096 ?auto_5360100 ) ) ( not ( = ?auto_5360096 ?auto_5360103 ) ) ( not ( = ?auto_5360096 ?auto_5360105 ) ) ( not ( = ?auto_5360101 ?auto_5360107 ) ) ( not ( = ?auto_5360100 ?auto_5360103 ) ) ( not ( = ?auto_5360100 ?auto_5360105 ) ) ( not ( = ?auto_5360103 ?auto_5360105 ) ) ( not ( = ?auto_5360104 ?auto_5360107 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5360097 ?auto_5360098 ?auto_5360099 ?auto_5360096 )
      ( GET-5IMAGE-VERIFY ?auto_5360097 ?auto_5360098 ?auto_5360099 ?auto_5360096 ?auto_5360101 ?auto_5360100 ?auto_5360102 ?auto_5360103 ?auto_5360104 ?auto_5360105 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5360631 - DIRECTION
      ?auto_5360632 - MODE
      ?auto_5360633 - DIRECTION
      ?auto_5360630 - MODE
      ?auto_5360635 - DIRECTION
      ?auto_5360634 - MODE
      ?auto_5360636 - DIRECTION
      ?auto_5360637 - MODE
      ?auto_5360638 - DIRECTION
      ?auto_5360639 - MODE
    )
    :vars
    (
      ?auto_5360640 - INSTRUMENT
      ?auto_5360642 - SATELLITE
      ?auto_5360641 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5360633 ?auto_5360631 ) ) ( not ( = ?auto_5360635 ?auto_5360631 ) ) ( not ( = ?auto_5360635 ?auto_5360633 ) ) ( not ( = ?auto_5360636 ?auto_5360631 ) ) ( not ( = ?auto_5360636 ?auto_5360633 ) ) ( not ( = ?auto_5360636 ?auto_5360635 ) ) ( not ( = ?auto_5360638 ?auto_5360631 ) ) ( not ( = ?auto_5360638 ?auto_5360633 ) ) ( not ( = ?auto_5360638 ?auto_5360635 ) ) ( not ( = ?auto_5360638 ?auto_5360636 ) ) ( ON_BOARD ?auto_5360640 ?auto_5360642 ) ( SUPPORTS ?auto_5360640 ?auto_5360630 ) ( not ( = ?auto_5360633 ?auto_5360641 ) ) ( HAVE_IMAGE ?auto_5360631 ?auto_5360632 ) ( not ( = ?auto_5360631 ?auto_5360641 ) ) ( not ( = ?auto_5360632 ?auto_5360630 ) ) ( CALIBRATION_TARGET ?auto_5360640 ?auto_5360641 ) ( POWER_AVAIL ?auto_5360642 ) ( POINTING ?auto_5360642 ?auto_5360635 ) ( not ( = ?auto_5360641 ?auto_5360635 ) ) ( HAVE_IMAGE ?auto_5360635 ?auto_5360634 ) ( HAVE_IMAGE ?auto_5360636 ?auto_5360637 ) ( HAVE_IMAGE ?auto_5360638 ?auto_5360639 ) ( not ( = ?auto_5360632 ?auto_5360634 ) ) ( not ( = ?auto_5360632 ?auto_5360637 ) ) ( not ( = ?auto_5360632 ?auto_5360639 ) ) ( not ( = ?auto_5360630 ?auto_5360634 ) ) ( not ( = ?auto_5360630 ?auto_5360637 ) ) ( not ( = ?auto_5360630 ?auto_5360639 ) ) ( not ( = ?auto_5360634 ?auto_5360637 ) ) ( not ( = ?auto_5360634 ?auto_5360639 ) ) ( not ( = ?auto_5360636 ?auto_5360641 ) ) ( not ( = ?auto_5360637 ?auto_5360639 ) ) ( not ( = ?auto_5360638 ?auto_5360641 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5360631 ?auto_5360632 ?auto_5360633 ?auto_5360630 )
      ( GET-5IMAGE-VERIFY ?auto_5360631 ?auto_5360632 ?auto_5360633 ?auto_5360630 ?auto_5360635 ?auto_5360634 ?auto_5360636 ?auto_5360637 ?auto_5360638 ?auto_5360639 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5371846 - DIRECTION
      ?auto_5371847 - MODE
      ?auto_5371848 - DIRECTION
      ?auto_5371845 - MODE
      ?auto_5371850 - DIRECTION
      ?auto_5371849 - MODE
      ?auto_5371851 - DIRECTION
      ?auto_5371852 - MODE
      ?auto_5371853 - DIRECTION
      ?auto_5371854 - MODE
    )
    :vars
    (
      ?auto_5371855 - INSTRUMENT
      ?auto_5371857 - SATELLITE
      ?auto_5371856 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5371848 ?auto_5371846 ) ) ( not ( = ?auto_5371850 ?auto_5371846 ) ) ( not ( = ?auto_5371850 ?auto_5371848 ) ) ( not ( = ?auto_5371851 ?auto_5371846 ) ) ( not ( = ?auto_5371851 ?auto_5371848 ) ) ( not ( = ?auto_5371851 ?auto_5371850 ) ) ( not ( = ?auto_5371853 ?auto_5371846 ) ) ( not ( = ?auto_5371853 ?auto_5371848 ) ) ( not ( = ?auto_5371853 ?auto_5371850 ) ) ( not ( = ?auto_5371853 ?auto_5371851 ) ) ( ON_BOARD ?auto_5371855 ?auto_5371857 ) ( SUPPORTS ?auto_5371855 ?auto_5371854 ) ( not ( = ?auto_5371853 ?auto_5371856 ) ) ( HAVE_IMAGE ?auto_5371848 ?auto_5371845 ) ( not ( = ?auto_5371848 ?auto_5371856 ) ) ( not ( = ?auto_5371845 ?auto_5371854 ) ) ( CALIBRATION_TARGET ?auto_5371855 ?auto_5371856 ) ( POWER_AVAIL ?auto_5371857 ) ( POINTING ?auto_5371857 ?auto_5371846 ) ( not ( = ?auto_5371856 ?auto_5371846 ) ) ( HAVE_IMAGE ?auto_5371846 ?auto_5371847 ) ( HAVE_IMAGE ?auto_5371850 ?auto_5371849 ) ( HAVE_IMAGE ?auto_5371851 ?auto_5371852 ) ( not ( = ?auto_5371847 ?auto_5371845 ) ) ( not ( = ?auto_5371847 ?auto_5371849 ) ) ( not ( = ?auto_5371847 ?auto_5371852 ) ) ( not ( = ?auto_5371847 ?auto_5371854 ) ) ( not ( = ?auto_5371845 ?auto_5371849 ) ) ( not ( = ?auto_5371845 ?auto_5371852 ) ) ( not ( = ?auto_5371850 ?auto_5371856 ) ) ( not ( = ?auto_5371849 ?auto_5371852 ) ) ( not ( = ?auto_5371849 ?auto_5371854 ) ) ( not ( = ?auto_5371851 ?auto_5371856 ) ) ( not ( = ?auto_5371852 ?auto_5371854 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5371848 ?auto_5371845 ?auto_5371853 ?auto_5371854 )
      ( GET-5IMAGE-VERIFY ?auto_5371846 ?auto_5371847 ?auto_5371848 ?auto_5371845 ?auto_5371850 ?auto_5371849 ?auto_5371851 ?auto_5371852 ?auto_5371853 ?auto_5371854 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5371898 - DIRECTION
      ?auto_5371899 - MODE
      ?auto_5371900 - DIRECTION
      ?auto_5371897 - MODE
      ?auto_5371902 - DIRECTION
      ?auto_5371901 - MODE
      ?auto_5371903 - DIRECTION
      ?auto_5371904 - MODE
      ?auto_5371905 - DIRECTION
      ?auto_5371906 - MODE
    )
    :vars
    (
      ?auto_5371907 - INSTRUMENT
      ?auto_5371909 - SATELLITE
      ?auto_5371908 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5371900 ?auto_5371898 ) ) ( not ( = ?auto_5371902 ?auto_5371898 ) ) ( not ( = ?auto_5371902 ?auto_5371900 ) ) ( not ( = ?auto_5371903 ?auto_5371898 ) ) ( not ( = ?auto_5371903 ?auto_5371900 ) ) ( not ( = ?auto_5371903 ?auto_5371902 ) ) ( not ( = ?auto_5371905 ?auto_5371898 ) ) ( not ( = ?auto_5371905 ?auto_5371900 ) ) ( not ( = ?auto_5371905 ?auto_5371902 ) ) ( not ( = ?auto_5371905 ?auto_5371903 ) ) ( ON_BOARD ?auto_5371907 ?auto_5371909 ) ( SUPPORTS ?auto_5371907 ?auto_5371904 ) ( not ( = ?auto_5371903 ?auto_5371908 ) ) ( HAVE_IMAGE ?auto_5371900 ?auto_5371897 ) ( not ( = ?auto_5371900 ?auto_5371908 ) ) ( not ( = ?auto_5371897 ?auto_5371904 ) ) ( CALIBRATION_TARGET ?auto_5371907 ?auto_5371908 ) ( POWER_AVAIL ?auto_5371909 ) ( POINTING ?auto_5371909 ?auto_5371898 ) ( not ( = ?auto_5371908 ?auto_5371898 ) ) ( HAVE_IMAGE ?auto_5371898 ?auto_5371899 ) ( HAVE_IMAGE ?auto_5371902 ?auto_5371901 ) ( HAVE_IMAGE ?auto_5371905 ?auto_5371906 ) ( not ( = ?auto_5371899 ?auto_5371897 ) ) ( not ( = ?auto_5371899 ?auto_5371901 ) ) ( not ( = ?auto_5371899 ?auto_5371904 ) ) ( not ( = ?auto_5371899 ?auto_5371906 ) ) ( not ( = ?auto_5371897 ?auto_5371901 ) ) ( not ( = ?auto_5371897 ?auto_5371906 ) ) ( not ( = ?auto_5371902 ?auto_5371908 ) ) ( not ( = ?auto_5371901 ?auto_5371904 ) ) ( not ( = ?auto_5371901 ?auto_5371906 ) ) ( not ( = ?auto_5371904 ?auto_5371906 ) ) ( not ( = ?auto_5371905 ?auto_5371908 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5371900 ?auto_5371897 ?auto_5371903 ?auto_5371904 )
      ( GET-5IMAGE-VERIFY ?auto_5371898 ?auto_5371899 ?auto_5371900 ?auto_5371897 ?auto_5371902 ?auto_5371901 ?auto_5371903 ?auto_5371904 ?auto_5371905 ?auto_5371906 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5372256 - DIRECTION
      ?auto_5372257 - MODE
      ?auto_5372258 - DIRECTION
      ?auto_5372255 - MODE
      ?auto_5372260 - DIRECTION
      ?auto_5372259 - MODE
      ?auto_5372261 - DIRECTION
      ?auto_5372262 - MODE
      ?auto_5372263 - DIRECTION
      ?auto_5372264 - MODE
    )
    :vars
    (
      ?auto_5372265 - INSTRUMENT
      ?auto_5372267 - SATELLITE
      ?auto_5372266 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5372258 ?auto_5372256 ) ) ( not ( = ?auto_5372260 ?auto_5372256 ) ) ( not ( = ?auto_5372260 ?auto_5372258 ) ) ( not ( = ?auto_5372261 ?auto_5372256 ) ) ( not ( = ?auto_5372261 ?auto_5372258 ) ) ( not ( = ?auto_5372261 ?auto_5372260 ) ) ( not ( = ?auto_5372263 ?auto_5372256 ) ) ( not ( = ?auto_5372263 ?auto_5372258 ) ) ( not ( = ?auto_5372263 ?auto_5372260 ) ) ( not ( = ?auto_5372263 ?auto_5372261 ) ) ( ON_BOARD ?auto_5372265 ?auto_5372267 ) ( SUPPORTS ?auto_5372265 ?auto_5372259 ) ( not ( = ?auto_5372260 ?auto_5372266 ) ) ( HAVE_IMAGE ?auto_5372258 ?auto_5372255 ) ( not ( = ?auto_5372258 ?auto_5372266 ) ) ( not ( = ?auto_5372255 ?auto_5372259 ) ) ( CALIBRATION_TARGET ?auto_5372265 ?auto_5372266 ) ( POWER_AVAIL ?auto_5372267 ) ( POINTING ?auto_5372267 ?auto_5372256 ) ( not ( = ?auto_5372266 ?auto_5372256 ) ) ( HAVE_IMAGE ?auto_5372256 ?auto_5372257 ) ( HAVE_IMAGE ?auto_5372261 ?auto_5372262 ) ( HAVE_IMAGE ?auto_5372263 ?auto_5372264 ) ( not ( = ?auto_5372257 ?auto_5372255 ) ) ( not ( = ?auto_5372257 ?auto_5372259 ) ) ( not ( = ?auto_5372257 ?auto_5372262 ) ) ( not ( = ?auto_5372257 ?auto_5372264 ) ) ( not ( = ?auto_5372255 ?auto_5372262 ) ) ( not ( = ?auto_5372255 ?auto_5372264 ) ) ( not ( = ?auto_5372259 ?auto_5372262 ) ) ( not ( = ?auto_5372259 ?auto_5372264 ) ) ( not ( = ?auto_5372261 ?auto_5372266 ) ) ( not ( = ?auto_5372262 ?auto_5372264 ) ) ( not ( = ?auto_5372263 ?auto_5372266 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5372258 ?auto_5372255 ?auto_5372260 ?auto_5372259 )
      ( GET-5IMAGE-VERIFY ?auto_5372256 ?auto_5372257 ?auto_5372258 ?auto_5372255 ?auto_5372260 ?auto_5372259 ?auto_5372261 ?auto_5372262 ?auto_5372263 ?auto_5372264 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5375143 - DIRECTION
      ?auto_5375144 - MODE
      ?auto_5375145 - DIRECTION
      ?auto_5375142 - MODE
      ?auto_5375147 - DIRECTION
      ?auto_5375146 - MODE
      ?auto_5375148 - DIRECTION
      ?auto_5375149 - MODE
      ?auto_5375150 - DIRECTION
      ?auto_5375151 - MODE
    )
    :vars
    (
      ?auto_5375152 - INSTRUMENT
      ?auto_5375154 - SATELLITE
      ?auto_5375153 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5375145 ?auto_5375143 ) ) ( not ( = ?auto_5375147 ?auto_5375143 ) ) ( not ( = ?auto_5375147 ?auto_5375145 ) ) ( not ( = ?auto_5375148 ?auto_5375143 ) ) ( not ( = ?auto_5375148 ?auto_5375145 ) ) ( not ( = ?auto_5375148 ?auto_5375147 ) ) ( not ( = ?auto_5375150 ?auto_5375143 ) ) ( not ( = ?auto_5375150 ?auto_5375145 ) ) ( not ( = ?auto_5375150 ?auto_5375147 ) ) ( not ( = ?auto_5375150 ?auto_5375148 ) ) ( ON_BOARD ?auto_5375152 ?auto_5375154 ) ( SUPPORTS ?auto_5375152 ?auto_5375142 ) ( not ( = ?auto_5375145 ?auto_5375153 ) ) ( HAVE_IMAGE ?auto_5375147 ?auto_5375146 ) ( not ( = ?auto_5375147 ?auto_5375153 ) ) ( not ( = ?auto_5375146 ?auto_5375142 ) ) ( CALIBRATION_TARGET ?auto_5375152 ?auto_5375153 ) ( POWER_AVAIL ?auto_5375154 ) ( POINTING ?auto_5375154 ?auto_5375143 ) ( not ( = ?auto_5375153 ?auto_5375143 ) ) ( HAVE_IMAGE ?auto_5375143 ?auto_5375144 ) ( HAVE_IMAGE ?auto_5375148 ?auto_5375149 ) ( HAVE_IMAGE ?auto_5375150 ?auto_5375151 ) ( not ( = ?auto_5375144 ?auto_5375142 ) ) ( not ( = ?auto_5375144 ?auto_5375146 ) ) ( not ( = ?auto_5375144 ?auto_5375149 ) ) ( not ( = ?auto_5375144 ?auto_5375151 ) ) ( not ( = ?auto_5375142 ?auto_5375149 ) ) ( not ( = ?auto_5375142 ?auto_5375151 ) ) ( not ( = ?auto_5375146 ?auto_5375149 ) ) ( not ( = ?auto_5375146 ?auto_5375151 ) ) ( not ( = ?auto_5375148 ?auto_5375153 ) ) ( not ( = ?auto_5375149 ?auto_5375151 ) ) ( not ( = ?auto_5375150 ?auto_5375153 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5375147 ?auto_5375146 ?auto_5375145 ?auto_5375142 )
      ( GET-5IMAGE-VERIFY ?auto_5375143 ?auto_5375144 ?auto_5375145 ?auto_5375142 ?auto_5375147 ?auto_5375146 ?auto_5375148 ?auto_5375149 ?auto_5375150 ?auto_5375151 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5377311 - DIRECTION
      ?auto_5377312 - MODE
      ?auto_5377313 - DIRECTION
      ?auto_5377310 - MODE
      ?auto_5377315 - DIRECTION
      ?auto_5377314 - MODE
      ?auto_5377316 - DIRECTION
      ?auto_5377317 - MODE
      ?auto_5377318 - DIRECTION
      ?auto_5377319 - MODE
    )
    :vars
    (
      ?auto_5377320 - INSTRUMENT
      ?auto_5377322 - SATELLITE
      ?auto_5377321 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5377313 ?auto_5377311 ) ) ( not ( = ?auto_5377315 ?auto_5377311 ) ) ( not ( = ?auto_5377315 ?auto_5377313 ) ) ( not ( = ?auto_5377316 ?auto_5377311 ) ) ( not ( = ?auto_5377316 ?auto_5377313 ) ) ( not ( = ?auto_5377316 ?auto_5377315 ) ) ( not ( = ?auto_5377318 ?auto_5377311 ) ) ( not ( = ?auto_5377318 ?auto_5377313 ) ) ( not ( = ?auto_5377318 ?auto_5377315 ) ) ( not ( = ?auto_5377318 ?auto_5377316 ) ) ( ON_BOARD ?auto_5377320 ?auto_5377322 ) ( SUPPORTS ?auto_5377320 ?auto_5377312 ) ( not ( = ?auto_5377311 ?auto_5377321 ) ) ( HAVE_IMAGE ?auto_5377313 ?auto_5377310 ) ( not ( = ?auto_5377313 ?auto_5377321 ) ) ( not ( = ?auto_5377310 ?auto_5377312 ) ) ( CALIBRATION_TARGET ?auto_5377320 ?auto_5377321 ) ( POWER_AVAIL ?auto_5377322 ) ( POINTING ?auto_5377322 ?auto_5377318 ) ( not ( = ?auto_5377321 ?auto_5377318 ) ) ( HAVE_IMAGE ?auto_5377315 ?auto_5377314 ) ( HAVE_IMAGE ?auto_5377316 ?auto_5377317 ) ( HAVE_IMAGE ?auto_5377318 ?auto_5377319 ) ( not ( = ?auto_5377312 ?auto_5377314 ) ) ( not ( = ?auto_5377312 ?auto_5377317 ) ) ( not ( = ?auto_5377312 ?auto_5377319 ) ) ( not ( = ?auto_5377310 ?auto_5377314 ) ) ( not ( = ?auto_5377310 ?auto_5377317 ) ) ( not ( = ?auto_5377310 ?auto_5377319 ) ) ( not ( = ?auto_5377315 ?auto_5377321 ) ) ( not ( = ?auto_5377314 ?auto_5377317 ) ) ( not ( = ?auto_5377314 ?auto_5377319 ) ) ( not ( = ?auto_5377316 ?auto_5377321 ) ) ( not ( = ?auto_5377317 ?auto_5377319 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5377313 ?auto_5377310 ?auto_5377311 ?auto_5377312 )
      ( GET-5IMAGE-VERIFY ?auto_5377311 ?auto_5377312 ?auto_5377313 ?auto_5377310 ?auto_5377315 ?auto_5377314 ?auto_5377316 ?auto_5377317 ?auto_5377318 ?auto_5377319 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5377364 - DIRECTION
      ?auto_5377365 - MODE
      ?auto_5377366 - DIRECTION
      ?auto_5377363 - MODE
      ?auto_5377368 - DIRECTION
      ?auto_5377367 - MODE
      ?auto_5377369 - DIRECTION
      ?auto_5377370 - MODE
      ?auto_5377371 - DIRECTION
      ?auto_5377372 - MODE
    )
    :vars
    (
      ?auto_5377373 - INSTRUMENT
      ?auto_5377375 - SATELLITE
      ?auto_5377374 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5377366 ?auto_5377364 ) ) ( not ( = ?auto_5377368 ?auto_5377364 ) ) ( not ( = ?auto_5377368 ?auto_5377366 ) ) ( not ( = ?auto_5377369 ?auto_5377364 ) ) ( not ( = ?auto_5377369 ?auto_5377366 ) ) ( not ( = ?auto_5377369 ?auto_5377368 ) ) ( not ( = ?auto_5377371 ?auto_5377364 ) ) ( not ( = ?auto_5377371 ?auto_5377366 ) ) ( not ( = ?auto_5377371 ?auto_5377368 ) ) ( not ( = ?auto_5377371 ?auto_5377369 ) ) ( ON_BOARD ?auto_5377373 ?auto_5377375 ) ( SUPPORTS ?auto_5377373 ?auto_5377365 ) ( not ( = ?auto_5377364 ?auto_5377374 ) ) ( HAVE_IMAGE ?auto_5377366 ?auto_5377363 ) ( not ( = ?auto_5377366 ?auto_5377374 ) ) ( not ( = ?auto_5377363 ?auto_5377365 ) ) ( CALIBRATION_TARGET ?auto_5377373 ?auto_5377374 ) ( POWER_AVAIL ?auto_5377375 ) ( POINTING ?auto_5377375 ?auto_5377369 ) ( not ( = ?auto_5377374 ?auto_5377369 ) ) ( HAVE_IMAGE ?auto_5377368 ?auto_5377367 ) ( HAVE_IMAGE ?auto_5377369 ?auto_5377370 ) ( HAVE_IMAGE ?auto_5377371 ?auto_5377372 ) ( not ( = ?auto_5377365 ?auto_5377367 ) ) ( not ( = ?auto_5377365 ?auto_5377370 ) ) ( not ( = ?auto_5377365 ?auto_5377372 ) ) ( not ( = ?auto_5377363 ?auto_5377367 ) ) ( not ( = ?auto_5377363 ?auto_5377370 ) ) ( not ( = ?auto_5377363 ?auto_5377372 ) ) ( not ( = ?auto_5377368 ?auto_5377374 ) ) ( not ( = ?auto_5377367 ?auto_5377370 ) ) ( not ( = ?auto_5377367 ?auto_5377372 ) ) ( not ( = ?auto_5377370 ?auto_5377372 ) ) ( not ( = ?auto_5377371 ?auto_5377374 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5377366 ?auto_5377363 ?auto_5377364 ?auto_5377365 )
      ( GET-5IMAGE-VERIFY ?auto_5377364 ?auto_5377365 ?auto_5377366 ?auto_5377363 ?auto_5377368 ?auto_5377367 ?auto_5377369 ?auto_5377370 ?auto_5377371 ?auto_5377372 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5377898 - DIRECTION
      ?auto_5377899 - MODE
      ?auto_5377900 - DIRECTION
      ?auto_5377897 - MODE
      ?auto_5377902 - DIRECTION
      ?auto_5377901 - MODE
      ?auto_5377903 - DIRECTION
      ?auto_5377904 - MODE
      ?auto_5377905 - DIRECTION
      ?auto_5377906 - MODE
    )
    :vars
    (
      ?auto_5377907 - INSTRUMENT
      ?auto_5377909 - SATELLITE
      ?auto_5377908 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5377900 ?auto_5377898 ) ) ( not ( = ?auto_5377902 ?auto_5377898 ) ) ( not ( = ?auto_5377902 ?auto_5377900 ) ) ( not ( = ?auto_5377903 ?auto_5377898 ) ) ( not ( = ?auto_5377903 ?auto_5377900 ) ) ( not ( = ?auto_5377903 ?auto_5377902 ) ) ( not ( = ?auto_5377905 ?auto_5377898 ) ) ( not ( = ?auto_5377905 ?auto_5377900 ) ) ( not ( = ?auto_5377905 ?auto_5377902 ) ) ( not ( = ?auto_5377905 ?auto_5377903 ) ) ( ON_BOARD ?auto_5377907 ?auto_5377909 ) ( SUPPORTS ?auto_5377907 ?auto_5377899 ) ( not ( = ?auto_5377898 ?auto_5377908 ) ) ( HAVE_IMAGE ?auto_5377900 ?auto_5377897 ) ( not ( = ?auto_5377900 ?auto_5377908 ) ) ( not ( = ?auto_5377897 ?auto_5377899 ) ) ( CALIBRATION_TARGET ?auto_5377907 ?auto_5377908 ) ( POWER_AVAIL ?auto_5377909 ) ( POINTING ?auto_5377909 ?auto_5377902 ) ( not ( = ?auto_5377908 ?auto_5377902 ) ) ( HAVE_IMAGE ?auto_5377902 ?auto_5377901 ) ( HAVE_IMAGE ?auto_5377903 ?auto_5377904 ) ( HAVE_IMAGE ?auto_5377905 ?auto_5377906 ) ( not ( = ?auto_5377899 ?auto_5377901 ) ) ( not ( = ?auto_5377899 ?auto_5377904 ) ) ( not ( = ?auto_5377899 ?auto_5377906 ) ) ( not ( = ?auto_5377897 ?auto_5377901 ) ) ( not ( = ?auto_5377897 ?auto_5377904 ) ) ( not ( = ?auto_5377897 ?auto_5377906 ) ) ( not ( = ?auto_5377901 ?auto_5377904 ) ) ( not ( = ?auto_5377901 ?auto_5377906 ) ) ( not ( = ?auto_5377903 ?auto_5377908 ) ) ( not ( = ?auto_5377904 ?auto_5377906 ) ) ( not ( = ?auto_5377905 ?auto_5377908 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5377900 ?auto_5377897 ?auto_5377898 ?auto_5377899 )
      ( GET-5IMAGE-VERIFY ?auto_5377898 ?auto_5377899 ?auto_5377900 ?auto_5377897 ?auto_5377902 ?auto_5377901 ?auto_5377903 ?auto_5377904 ?auto_5377905 ?auto_5377906 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5382159 - DIRECTION
      ?auto_5382160 - MODE
      ?auto_5382161 - DIRECTION
      ?auto_5382158 - MODE
      ?auto_5382163 - DIRECTION
      ?auto_5382162 - MODE
      ?auto_5382164 - DIRECTION
      ?auto_5382165 - MODE
      ?auto_5382166 - DIRECTION
      ?auto_5382167 - MODE
    )
    :vars
    (
      ?auto_5382168 - INSTRUMENT
      ?auto_5382170 - SATELLITE
      ?auto_5382169 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5382161 ?auto_5382159 ) ) ( not ( = ?auto_5382163 ?auto_5382159 ) ) ( not ( = ?auto_5382163 ?auto_5382161 ) ) ( not ( = ?auto_5382164 ?auto_5382159 ) ) ( not ( = ?auto_5382164 ?auto_5382161 ) ) ( not ( = ?auto_5382164 ?auto_5382163 ) ) ( not ( = ?auto_5382166 ?auto_5382159 ) ) ( not ( = ?auto_5382166 ?auto_5382161 ) ) ( not ( = ?auto_5382166 ?auto_5382163 ) ) ( not ( = ?auto_5382166 ?auto_5382164 ) ) ( ON_BOARD ?auto_5382168 ?auto_5382170 ) ( SUPPORTS ?auto_5382168 ?auto_5382160 ) ( not ( = ?auto_5382159 ?auto_5382169 ) ) ( HAVE_IMAGE ?auto_5382163 ?auto_5382162 ) ( not ( = ?auto_5382163 ?auto_5382169 ) ) ( not ( = ?auto_5382162 ?auto_5382160 ) ) ( CALIBRATION_TARGET ?auto_5382168 ?auto_5382169 ) ( POWER_AVAIL ?auto_5382170 ) ( POINTING ?auto_5382170 ?auto_5382161 ) ( not ( = ?auto_5382169 ?auto_5382161 ) ) ( HAVE_IMAGE ?auto_5382161 ?auto_5382158 ) ( HAVE_IMAGE ?auto_5382164 ?auto_5382165 ) ( HAVE_IMAGE ?auto_5382166 ?auto_5382167 ) ( not ( = ?auto_5382160 ?auto_5382158 ) ) ( not ( = ?auto_5382160 ?auto_5382165 ) ) ( not ( = ?auto_5382160 ?auto_5382167 ) ) ( not ( = ?auto_5382158 ?auto_5382162 ) ) ( not ( = ?auto_5382158 ?auto_5382165 ) ) ( not ( = ?auto_5382158 ?auto_5382167 ) ) ( not ( = ?auto_5382162 ?auto_5382165 ) ) ( not ( = ?auto_5382162 ?auto_5382167 ) ) ( not ( = ?auto_5382164 ?auto_5382169 ) ) ( not ( = ?auto_5382165 ?auto_5382167 ) ) ( not ( = ?auto_5382166 ?auto_5382169 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5382163 ?auto_5382162 ?auto_5382159 ?auto_5382160 )
      ( GET-5IMAGE-VERIFY ?auto_5382159 ?auto_5382160 ?auto_5382161 ?auto_5382158 ?auto_5382163 ?auto_5382162 ?auto_5382164 ?auto_5382165 ?auto_5382166 ?auto_5382167 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5386400 - DIRECTION
      ?auto_5386401 - MODE
      ?auto_5386402 - DIRECTION
      ?auto_5386399 - MODE
      ?auto_5386404 - DIRECTION
      ?auto_5386403 - MODE
      ?auto_5386405 - DIRECTION
      ?auto_5386406 - MODE
    )
    :vars
    (
      ?auto_5386411 - INSTRUMENT
      ?auto_5386409 - SATELLITE
      ?auto_5386407 - DIRECTION
      ?auto_5386408 - DIRECTION
      ?auto_5386410 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5386402 ?auto_5386400 ) ) ( not ( = ?auto_5386404 ?auto_5386400 ) ) ( not ( = ?auto_5386404 ?auto_5386402 ) ) ( not ( = ?auto_5386405 ?auto_5386400 ) ) ( not ( = ?auto_5386405 ?auto_5386402 ) ) ( not ( = ?auto_5386405 ?auto_5386404 ) ) ( ON_BOARD ?auto_5386411 ?auto_5386409 ) ( SUPPORTS ?auto_5386411 ?auto_5386406 ) ( not ( = ?auto_5386405 ?auto_5386407 ) ) ( HAVE_IMAGE ?auto_5386400 ?auto_5386401 ) ( not ( = ?auto_5386400 ?auto_5386407 ) ) ( not ( = ?auto_5386401 ?auto_5386406 ) ) ( CALIBRATION_TARGET ?auto_5386411 ?auto_5386407 ) ( POINTING ?auto_5386409 ?auto_5386408 ) ( not ( = ?auto_5386407 ?auto_5386408 ) ) ( not ( = ?auto_5386405 ?auto_5386408 ) ) ( not ( = ?auto_5386400 ?auto_5386408 ) ) ( ON_BOARD ?auto_5386410 ?auto_5386409 ) ( POWER_ON ?auto_5386410 ) ( not ( = ?auto_5386411 ?auto_5386410 ) ) ( HAVE_IMAGE ?auto_5386402 ?auto_5386399 ) ( HAVE_IMAGE ?auto_5386404 ?auto_5386403 ) ( not ( = ?auto_5386401 ?auto_5386399 ) ) ( not ( = ?auto_5386401 ?auto_5386403 ) ) ( not ( = ?auto_5386402 ?auto_5386407 ) ) ( not ( = ?auto_5386402 ?auto_5386408 ) ) ( not ( = ?auto_5386399 ?auto_5386403 ) ) ( not ( = ?auto_5386399 ?auto_5386406 ) ) ( not ( = ?auto_5386404 ?auto_5386407 ) ) ( not ( = ?auto_5386404 ?auto_5386408 ) ) ( not ( = ?auto_5386403 ?auto_5386406 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5386400 ?auto_5386401 ?auto_5386405 ?auto_5386406 )
      ( GET-4IMAGE-VERIFY ?auto_5386400 ?auto_5386401 ?auto_5386402 ?auto_5386399 ?auto_5386404 ?auto_5386403 ?auto_5386405 ?auto_5386406 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5386451 - DIRECTION
      ?auto_5386452 - MODE
      ?auto_5386453 - DIRECTION
      ?auto_5386450 - MODE
      ?auto_5386455 - DIRECTION
      ?auto_5386454 - MODE
      ?auto_5386456 - DIRECTION
      ?auto_5386457 - MODE
    )
    :vars
    (
      ?auto_5386462 - INSTRUMENT
      ?auto_5386460 - SATELLITE
      ?auto_5386458 - DIRECTION
      ?auto_5386459 - DIRECTION
      ?auto_5386461 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5386453 ?auto_5386451 ) ) ( not ( = ?auto_5386455 ?auto_5386451 ) ) ( not ( = ?auto_5386455 ?auto_5386453 ) ) ( not ( = ?auto_5386456 ?auto_5386451 ) ) ( not ( = ?auto_5386456 ?auto_5386453 ) ) ( not ( = ?auto_5386456 ?auto_5386455 ) ) ( ON_BOARD ?auto_5386462 ?auto_5386460 ) ( SUPPORTS ?auto_5386462 ?auto_5386454 ) ( not ( = ?auto_5386455 ?auto_5386458 ) ) ( HAVE_IMAGE ?auto_5386451 ?auto_5386452 ) ( not ( = ?auto_5386451 ?auto_5386458 ) ) ( not ( = ?auto_5386452 ?auto_5386454 ) ) ( CALIBRATION_TARGET ?auto_5386462 ?auto_5386458 ) ( POINTING ?auto_5386460 ?auto_5386459 ) ( not ( = ?auto_5386458 ?auto_5386459 ) ) ( not ( = ?auto_5386455 ?auto_5386459 ) ) ( not ( = ?auto_5386451 ?auto_5386459 ) ) ( ON_BOARD ?auto_5386461 ?auto_5386460 ) ( POWER_ON ?auto_5386461 ) ( not ( = ?auto_5386462 ?auto_5386461 ) ) ( HAVE_IMAGE ?auto_5386453 ?auto_5386450 ) ( HAVE_IMAGE ?auto_5386456 ?auto_5386457 ) ( not ( = ?auto_5386452 ?auto_5386450 ) ) ( not ( = ?auto_5386452 ?auto_5386457 ) ) ( not ( = ?auto_5386453 ?auto_5386458 ) ) ( not ( = ?auto_5386453 ?auto_5386459 ) ) ( not ( = ?auto_5386450 ?auto_5386454 ) ) ( not ( = ?auto_5386450 ?auto_5386457 ) ) ( not ( = ?auto_5386454 ?auto_5386457 ) ) ( not ( = ?auto_5386456 ?auto_5386458 ) ) ( not ( = ?auto_5386456 ?auto_5386459 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5386451 ?auto_5386452 ?auto_5386455 ?auto_5386454 )
      ( GET-4IMAGE-VERIFY ?auto_5386451 ?auto_5386452 ?auto_5386453 ?auto_5386450 ?auto_5386455 ?auto_5386454 ?auto_5386456 ?auto_5386457 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5386776 - DIRECTION
      ?auto_5386777 - MODE
      ?auto_5386778 - DIRECTION
      ?auto_5386775 - MODE
      ?auto_5386780 - DIRECTION
      ?auto_5386779 - MODE
      ?auto_5386781 - DIRECTION
      ?auto_5386782 - MODE
    )
    :vars
    (
      ?auto_5386787 - INSTRUMENT
      ?auto_5386785 - SATELLITE
      ?auto_5386783 - DIRECTION
      ?auto_5386784 - DIRECTION
      ?auto_5386786 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5386778 ?auto_5386776 ) ) ( not ( = ?auto_5386780 ?auto_5386776 ) ) ( not ( = ?auto_5386780 ?auto_5386778 ) ) ( not ( = ?auto_5386781 ?auto_5386776 ) ) ( not ( = ?auto_5386781 ?auto_5386778 ) ) ( not ( = ?auto_5386781 ?auto_5386780 ) ) ( ON_BOARD ?auto_5386787 ?auto_5386785 ) ( SUPPORTS ?auto_5386787 ?auto_5386775 ) ( not ( = ?auto_5386778 ?auto_5386783 ) ) ( HAVE_IMAGE ?auto_5386776 ?auto_5386777 ) ( not ( = ?auto_5386776 ?auto_5386783 ) ) ( not ( = ?auto_5386777 ?auto_5386775 ) ) ( CALIBRATION_TARGET ?auto_5386787 ?auto_5386783 ) ( POINTING ?auto_5386785 ?auto_5386784 ) ( not ( = ?auto_5386783 ?auto_5386784 ) ) ( not ( = ?auto_5386778 ?auto_5386784 ) ) ( not ( = ?auto_5386776 ?auto_5386784 ) ) ( ON_BOARD ?auto_5386786 ?auto_5386785 ) ( POWER_ON ?auto_5386786 ) ( not ( = ?auto_5386787 ?auto_5386786 ) ) ( HAVE_IMAGE ?auto_5386780 ?auto_5386779 ) ( HAVE_IMAGE ?auto_5386781 ?auto_5386782 ) ( not ( = ?auto_5386777 ?auto_5386779 ) ) ( not ( = ?auto_5386777 ?auto_5386782 ) ) ( not ( = ?auto_5386775 ?auto_5386779 ) ) ( not ( = ?auto_5386775 ?auto_5386782 ) ) ( not ( = ?auto_5386780 ?auto_5386783 ) ) ( not ( = ?auto_5386780 ?auto_5386784 ) ) ( not ( = ?auto_5386779 ?auto_5386782 ) ) ( not ( = ?auto_5386781 ?auto_5386783 ) ) ( not ( = ?auto_5386781 ?auto_5386784 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5386776 ?auto_5386777 ?auto_5386778 ?auto_5386775 )
      ( GET-4IMAGE-VERIFY ?auto_5386776 ?auto_5386777 ?auto_5386778 ?auto_5386775 ?auto_5386780 ?auto_5386779 ?auto_5386781 ?auto_5386782 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5389319 - DIRECTION
      ?auto_5389320 - MODE
      ?auto_5389321 - DIRECTION
      ?auto_5389318 - MODE
      ?auto_5389323 - DIRECTION
      ?auto_5389322 - MODE
      ?auto_5389324 - DIRECTION
      ?auto_5389325 - MODE
    )
    :vars
    (
      ?auto_5389330 - INSTRUMENT
      ?auto_5389328 - SATELLITE
      ?auto_5389326 - DIRECTION
      ?auto_5389327 - DIRECTION
      ?auto_5389329 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5389321 ?auto_5389319 ) ) ( not ( = ?auto_5389323 ?auto_5389319 ) ) ( not ( = ?auto_5389323 ?auto_5389321 ) ) ( not ( = ?auto_5389324 ?auto_5389319 ) ) ( not ( = ?auto_5389324 ?auto_5389321 ) ) ( not ( = ?auto_5389324 ?auto_5389323 ) ) ( ON_BOARD ?auto_5389330 ?auto_5389328 ) ( SUPPORTS ?auto_5389330 ?auto_5389320 ) ( not ( = ?auto_5389319 ?auto_5389326 ) ) ( HAVE_IMAGE ?auto_5389321 ?auto_5389318 ) ( not ( = ?auto_5389321 ?auto_5389326 ) ) ( not ( = ?auto_5389318 ?auto_5389320 ) ) ( CALIBRATION_TARGET ?auto_5389330 ?auto_5389326 ) ( POINTING ?auto_5389328 ?auto_5389327 ) ( not ( = ?auto_5389326 ?auto_5389327 ) ) ( not ( = ?auto_5389319 ?auto_5389327 ) ) ( not ( = ?auto_5389321 ?auto_5389327 ) ) ( ON_BOARD ?auto_5389329 ?auto_5389328 ) ( POWER_ON ?auto_5389329 ) ( not ( = ?auto_5389330 ?auto_5389329 ) ) ( HAVE_IMAGE ?auto_5389323 ?auto_5389322 ) ( HAVE_IMAGE ?auto_5389324 ?auto_5389325 ) ( not ( = ?auto_5389320 ?auto_5389322 ) ) ( not ( = ?auto_5389320 ?auto_5389325 ) ) ( not ( = ?auto_5389318 ?auto_5389322 ) ) ( not ( = ?auto_5389318 ?auto_5389325 ) ) ( not ( = ?auto_5389323 ?auto_5389326 ) ) ( not ( = ?auto_5389323 ?auto_5389327 ) ) ( not ( = ?auto_5389322 ?auto_5389325 ) ) ( not ( = ?auto_5389324 ?auto_5389326 ) ) ( not ( = ?auto_5389324 ?auto_5389327 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5389321 ?auto_5389318 ?auto_5389319 ?auto_5389320 )
      ( GET-4IMAGE-VERIFY ?auto_5389319 ?auto_5389320 ?auto_5389321 ?auto_5389318 ?auto_5389323 ?auto_5389322 ?auto_5389324 ?auto_5389325 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5392026 - DIRECTION
      ?auto_5392027 - MODE
      ?auto_5392028 - DIRECTION
      ?auto_5392025 - MODE
      ?auto_5392030 - DIRECTION
      ?auto_5392029 - MODE
      ?auto_5392031 - DIRECTION
      ?auto_5392032 - MODE
      ?auto_5392033 - DIRECTION
      ?auto_5392034 - MODE
    )
    :vars
    (
      ?auto_5392038 - INSTRUMENT
      ?auto_5392036 - SATELLITE
      ?auto_5392035 - DIRECTION
      ?auto_5392037 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5392028 ?auto_5392026 ) ) ( not ( = ?auto_5392030 ?auto_5392026 ) ) ( not ( = ?auto_5392030 ?auto_5392028 ) ) ( not ( = ?auto_5392031 ?auto_5392026 ) ) ( not ( = ?auto_5392031 ?auto_5392028 ) ) ( not ( = ?auto_5392031 ?auto_5392030 ) ) ( not ( = ?auto_5392033 ?auto_5392026 ) ) ( not ( = ?auto_5392033 ?auto_5392028 ) ) ( not ( = ?auto_5392033 ?auto_5392030 ) ) ( not ( = ?auto_5392033 ?auto_5392031 ) ) ( ON_BOARD ?auto_5392038 ?auto_5392036 ) ( SUPPORTS ?auto_5392038 ?auto_5392034 ) ( not ( = ?auto_5392033 ?auto_5392035 ) ) ( HAVE_IMAGE ?auto_5392026 ?auto_5392027 ) ( not ( = ?auto_5392026 ?auto_5392035 ) ) ( not ( = ?auto_5392027 ?auto_5392034 ) ) ( CALIBRATION_TARGET ?auto_5392038 ?auto_5392035 ) ( POINTING ?auto_5392036 ?auto_5392031 ) ( not ( = ?auto_5392035 ?auto_5392031 ) ) ( ON_BOARD ?auto_5392037 ?auto_5392036 ) ( POWER_ON ?auto_5392037 ) ( not ( = ?auto_5392038 ?auto_5392037 ) ) ( HAVE_IMAGE ?auto_5392028 ?auto_5392025 ) ( HAVE_IMAGE ?auto_5392030 ?auto_5392029 ) ( HAVE_IMAGE ?auto_5392031 ?auto_5392032 ) ( not ( = ?auto_5392027 ?auto_5392025 ) ) ( not ( = ?auto_5392027 ?auto_5392029 ) ) ( not ( = ?auto_5392027 ?auto_5392032 ) ) ( not ( = ?auto_5392028 ?auto_5392035 ) ) ( not ( = ?auto_5392025 ?auto_5392029 ) ) ( not ( = ?auto_5392025 ?auto_5392032 ) ) ( not ( = ?auto_5392025 ?auto_5392034 ) ) ( not ( = ?auto_5392030 ?auto_5392035 ) ) ( not ( = ?auto_5392029 ?auto_5392032 ) ) ( not ( = ?auto_5392029 ?auto_5392034 ) ) ( not ( = ?auto_5392032 ?auto_5392034 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5392026 ?auto_5392027 ?auto_5392033 ?auto_5392034 )
      ( GET-5IMAGE-VERIFY ?auto_5392026 ?auto_5392027 ?auto_5392028 ?auto_5392025 ?auto_5392030 ?auto_5392029 ?auto_5392031 ?auto_5392032 ?auto_5392033 ?auto_5392034 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5392085 - DIRECTION
      ?auto_5392086 - MODE
      ?auto_5392087 - DIRECTION
      ?auto_5392084 - MODE
      ?auto_5392089 - DIRECTION
      ?auto_5392088 - MODE
      ?auto_5392090 - DIRECTION
      ?auto_5392091 - MODE
      ?auto_5392092 - DIRECTION
      ?auto_5392093 - MODE
    )
    :vars
    (
      ?auto_5392097 - INSTRUMENT
      ?auto_5392095 - SATELLITE
      ?auto_5392094 - DIRECTION
      ?auto_5392096 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5392087 ?auto_5392085 ) ) ( not ( = ?auto_5392089 ?auto_5392085 ) ) ( not ( = ?auto_5392089 ?auto_5392087 ) ) ( not ( = ?auto_5392090 ?auto_5392085 ) ) ( not ( = ?auto_5392090 ?auto_5392087 ) ) ( not ( = ?auto_5392090 ?auto_5392089 ) ) ( not ( = ?auto_5392092 ?auto_5392085 ) ) ( not ( = ?auto_5392092 ?auto_5392087 ) ) ( not ( = ?auto_5392092 ?auto_5392089 ) ) ( not ( = ?auto_5392092 ?auto_5392090 ) ) ( ON_BOARD ?auto_5392097 ?auto_5392095 ) ( SUPPORTS ?auto_5392097 ?auto_5392091 ) ( not ( = ?auto_5392090 ?auto_5392094 ) ) ( HAVE_IMAGE ?auto_5392085 ?auto_5392086 ) ( not ( = ?auto_5392085 ?auto_5392094 ) ) ( not ( = ?auto_5392086 ?auto_5392091 ) ) ( CALIBRATION_TARGET ?auto_5392097 ?auto_5392094 ) ( POINTING ?auto_5392095 ?auto_5392092 ) ( not ( = ?auto_5392094 ?auto_5392092 ) ) ( ON_BOARD ?auto_5392096 ?auto_5392095 ) ( POWER_ON ?auto_5392096 ) ( not ( = ?auto_5392097 ?auto_5392096 ) ) ( HAVE_IMAGE ?auto_5392087 ?auto_5392084 ) ( HAVE_IMAGE ?auto_5392089 ?auto_5392088 ) ( HAVE_IMAGE ?auto_5392092 ?auto_5392093 ) ( not ( = ?auto_5392086 ?auto_5392084 ) ) ( not ( = ?auto_5392086 ?auto_5392088 ) ) ( not ( = ?auto_5392086 ?auto_5392093 ) ) ( not ( = ?auto_5392087 ?auto_5392094 ) ) ( not ( = ?auto_5392084 ?auto_5392088 ) ) ( not ( = ?auto_5392084 ?auto_5392091 ) ) ( not ( = ?auto_5392084 ?auto_5392093 ) ) ( not ( = ?auto_5392089 ?auto_5392094 ) ) ( not ( = ?auto_5392088 ?auto_5392091 ) ) ( not ( = ?auto_5392088 ?auto_5392093 ) ) ( not ( = ?auto_5392091 ?auto_5392093 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5392085 ?auto_5392086 ?auto_5392090 ?auto_5392091 )
      ( GET-5IMAGE-VERIFY ?auto_5392085 ?auto_5392086 ?auto_5392087 ?auto_5392084 ?auto_5392089 ?auto_5392088 ?auto_5392090 ?auto_5392091 ?auto_5392092 ?auto_5392093 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5392142 - DIRECTION
      ?auto_5392143 - MODE
      ?auto_5392144 - DIRECTION
      ?auto_5392141 - MODE
      ?auto_5392146 - DIRECTION
      ?auto_5392145 - MODE
      ?auto_5392147 - DIRECTION
      ?auto_5392148 - MODE
      ?auto_5392149 - DIRECTION
      ?auto_5392150 - MODE
    )
    :vars
    (
      ?auto_5392154 - INSTRUMENT
      ?auto_5392152 - SATELLITE
      ?auto_5392151 - DIRECTION
      ?auto_5392153 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5392144 ?auto_5392142 ) ) ( not ( = ?auto_5392146 ?auto_5392142 ) ) ( not ( = ?auto_5392146 ?auto_5392144 ) ) ( not ( = ?auto_5392147 ?auto_5392142 ) ) ( not ( = ?auto_5392147 ?auto_5392144 ) ) ( not ( = ?auto_5392147 ?auto_5392146 ) ) ( not ( = ?auto_5392149 ?auto_5392142 ) ) ( not ( = ?auto_5392149 ?auto_5392144 ) ) ( not ( = ?auto_5392149 ?auto_5392146 ) ) ( not ( = ?auto_5392149 ?auto_5392147 ) ) ( ON_BOARD ?auto_5392154 ?auto_5392152 ) ( SUPPORTS ?auto_5392154 ?auto_5392150 ) ( not ( = ?auto_5392149 ?auto_5392151 ) ) ( HAVE_IMAGE ?auto_5392142 ?auto_5392143 ) ( not ( = ?auto_5392142 ?auto_5392151 ) ) ( not ( = ?auto_5392143 ?auto_5392150 ) ) ( CALIBRATION_TARGET ?auto_5392154 ?auto_5392151 ) ( POINTING ?auto_5392152 ?auto_5392146 ) ( not ( = ?auto_5392151 ?auto_5392146 ) ) ( ON_BOARD ?auto_5392153 ?auto_5392152 ) ( POWER_ON ?auto_5392153 ) ( not ( = ?auto_5392154 ?auto_5392153 ) ) ( HAVE_IMAGE ?auto_5392144 ?auto_5392141 ) ( HAVE_IMAGE ?auto_5392146 ?auto_5392145 ) ( HAVE_IMAGE ?auto_5392147 ?auto_5392148 ) ( not ( = ?auto_5392143 ?auto_5392141 ) ) ( not ( = ?auto_5392143 ?auto_5392145 ) ) ( not ( = ?auto_5392143 ?auto_5392148 ) ) ( not ( = ?auto_5392144 ?auto_5392151 ) ) ( not ( = ?auto_5392141 ?auto_5392145 ) ) ( not ( = ?auto_5392141 ?auto_5392148 ) ) ( not ( = ?auto_5392141 ?auto_5392150 ) ) ( not ( = ?auto_5392145 ?auto_5392148 ) ) ( not ( = ?auto_5392145 ?auto_5392150 ) ) ( not ( = ?auto_5392147 ?auto_5392151 ) ) ( not ( = ?auto_5392148 ?auto_5392150 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5392142 ?auto_5392143 ?auto_5392149 ?auto_5392150 )
      ( GET-5IMAGE-VERIFY ?auto_5392142 ?auto_5392143 ?auto_5392144 ?auto_5392141 ?auto_5392146 ?auto_5392145 ?auto_5392147 ?auto_5392148 ?auto_5392149 ?auto_5392150 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5392198 - DIRECTION
      ?auto_5392199 - MODE
      ?auto_5392200 - DIRECTION
      ?auto_5392197 - MODE
      ?auto_5392202 - DIRECTION
      ?auto_5392201 - MODE
      ?auto_5392203 - DIRECTION
      ?auto_5392204 - MODE
      ?auto_5392205 - DIRECTION
      ?auto_5392206 - MODE
    )
    :vars
    (
      ?auto_5392210 - INSTRUMENT
      ?auto_5392208 - SATELLITE
      ?auto_5392207 - DIRECTION
      ?auto_5392209 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5392200 ?auto_5392198 ) ) ( not ( = ?auto_5392202 ?auto_5392198 ) ) ( not ( = ?auto_5392202 ?auto_5392200 ) ) ( not ( = ?auto_5392203 ?auto_5392198 ) ) ( not ( = ?auto_5392203 ?auto_5392200 ) ) ( not ( = ?auto_5392203 ?auto_5392202 ) ) ( not ( = ?auto_5392205 ?auto_5392198 ) ) ( not ( = ?auto_5392205 ?auto_5392200 ) ) ( not ( = ?auto_5392205 ?auto_5392202 ) ) ( not ( = ?auto_5392205 ?auto_5392203 ) ) ( ON_BOARD ?auto_5392210 ?auto_5392208 ) ( SUPPORTS ?auto_5392210 ?auto_5392204 ) ( not ( = ?auto_5392203 ?auto_5392207 ) ) ( HAVE_IMAGE ?auto_5392198 ?auto_5392199 ) ( not ( = ?auto_5392198 ?auto_5392207 ) ) ( not ( = ?auto_5392199 ?auto_5392204 ) ) ( CALIBRATION_TARGET ?auto_5392210 ?auto_5392207 ) ( POINTING ?auto_5392208 ?auto_5392202 ) ( not ( = ?auto_5392207 ?auto_5392202 ) ) ( ON_BOARD ?auto_5392209 ?auto_5392208 ) ( POWER_ON ?auto_5392209 ) ( not ( = ?auto_5392210 ?auto_5392209 ) ) ( HAVE_IMAGE ?auto_5392200 ?auto_5392197 ) ( HAVE_IMAGE ?auto_5392202 ?auto_5392201 ) ( HAVE_IMAGE ?auto_5392205 ?auto_5392206 ) ( not ( = ?auto_5392199 ?auto_5392197 ) ) ( not ( = ?auto_5392199 ?auto_5392201 ) ) ( not ( = ?auto_5392199 ?auto_5392206 ) ) ( not ( = ?auto_5392200 ?auto_5392207 ) ) ( not ( = ?auto_5392197 ?auto_5392201 ) ) ( not ( = ?auto_5392197 ?auto_5392204 ) ) ( not ( = ?auto_5392197 ?auto_5392206 ) ) ( not ( = ?auto_5392201 ?auto_5392204 ) ) ( not ( = ?auto_5392201 ?auto_5392206 ) ) ( not ( = ?auto_5392204 ?auto_5392206 ) ) ( not ( = ?auto_5392205 ?auto_5392207 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5392198 ?auto_5392199 ?auto_5392203 ?auto_5392204 )
      ( GET-5IMAGE-VERIFY ?auto_5392198 ?auto_5392199 ?auto_5392200 ?auto_5392197 ?auto_5392202 ?auto_5392201 ?auto_5392203 ?auto_5392204 ?auto_5392205 ?auto_5392206 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5392433 - DIRECTION
      ?auto_5392434 - MODE
      ?auto_5392435 - DIRECTION
      ?auto_5392432 - MODE
      ?auto_5392437 - DIRECTION
      ?auto_5392436 - MODE
      ?auto_5392438 - DIRECTION
      ?auto_5392439 - MODE
      ?auto_5392440 - DIRECTION
      ?auto_5392441 - MODE
    )
    :vars
    (
      ?auto_5392445 - INSTRUMENT
      ?auto_5392443 - SATELLITE
      ?auto_5392442 - DIRECTION
      ?auto_5392444 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5392435 ?auto_5392433 ) ) ( not ( = ?auto_5392437 ?auto_5392433 ) ) ( not ( = ?auto_5392437 ?auto_5392435 ) ) ( not ( = ?auto_5392438 ?auto_5392433 ) ) ( not ( = ?auto_5392438 ?auto_5392435 ) ) ( not ( = ?auto_5392438 ?auto_5392437 ) ) ( not ( = ?auto_5392440 ?auto_5392433 ) ) ( not ( = ?auto_5392440 ?auto_5392435 ) ) ( not ( = ?auto_5392440 ?auto_5392437 ) ) ( not ( = ?auto_5392440 ?auto_5392438 ) ) ( ON_BOARD ?auto_5392445 ?auto_5392443 ) ( SUPPORTS ?auto_5392445 ?auto_5392436 ) ( not ( = ?auto_5392437 ?auto_5392442 ) ) ( HAVE_IMAGE ?auto_5392433 ?auto_5392434 ) ( not ( = ?auto_5392433 ?auto_5392442 ) ) ( not ( = ?auto_5392434 ?auto_5392436 ) ) ( CALIBRATION_TARGET ?auto_5392445 ?auto_5392442 ) ( POINTING ?auto_5392443 ?auto_5392440 ) ( not ( = ?auto_5392442 ?auto_5392440 ) ) ( ON_BOARD ?auto_5392444 ?auto_5392443 ) ( POWER_ON ?auto_5392444 ) ( not ( = ?auto_5392445 ?auto_5392444 ) ) ( HAVE_IMAGE ?auto_5392435 ?auto_5392432 ) ( HAVE_IMAGE ?auto_5392438 ?auto_5392439 ) ( HAVE_IMAGE ?auto_5392440 ?auto_5392441 ) ( not ( = ?auto_5392434 ?auto_5392432 ) ) ( not ( = ?auto_5392434 ?auto_5392439 ) ) ( not ( = ?auto_5392434 ?auto_5392441 ) ) ( not ( = ?auto_5392435 ?auto_5392442 ) ) ( not ( = ?auto_5392432 ?auto_5392436 ) ) ( not ( = ?auto_5392432 ?auto_5392439 ) ) ( not ( = ?auto_5392432 ?auto_5392441 ) ) ( not ( = ?auto_5392436 ?auto_5392439 ) ) ( not ( = ?auto_5392436 ?auto_5392441 ) ) ( not ( = ?auto_5392438 ?auto_5392442 ) ) ( not ( = ?auto_5392439 ?auto_5392441 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5392433 ?auto_5392434 ?auto_5392437 ?auto_5392436 )
      ( GET-5IMAGE-VERIFY ?auto_5392433 ?auto_5392434 ?auto_5392435 ?auto_5392432 ?auto_5392437 ?auto_5392436 ?auto_5392438 ?auto_5392439 ?auto_5392440 ?auto_5392441 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5392490 - DIRECTION
      ?auto_5392491 - MODE
      ?auto_5392492 - DIRECTION
      ?auto_5392489 - MODE
      ?auto_5392494 - DIRECTION
      ?auto_5392493 - MODE
      ?auto_5392495 - DIRECTION
      ?auto_5392496 - MODE
      ?auto_5392497 - DIRECTION
      ?auto_5392498 - MODE
    )
    :vars
    (
      ?auto_5392502 - INSTRUMENT
      ?auto_5392500 - SATELLITE
      ?auto_5392499 - DIRECTION
      ?auto_5392501 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5392492 ?auto_5392490 ) ) ( not ( = ?auto_5392494 ?auto_5392490 ) ) ( not ( = ?auto_5392494 ?auto_5392492 ) ) ( not ( = ?auto_5392495 ?auto_5392490 ) ) ( not ( = ?auto_5392495 ?auto_5392492 ) ) ( not ( = ?auto_5392495 ?auto_5392494 ) ) ( not ( = ?auto_5392497 ?auto_5392490 ) ) ( not ( = ?auto_5392497 ?auto_5392492 ) ) ( not ( = ?auto_5392497 ?auto_5392494 ) ) ( not ( = ?auto_5392497 ?auto_5392495 ) ) ( ON_BOARD ?auto_5392502 ?auto_5392500 ) ( SUPPORTS ?auto_5392502 ?auto_5392493 ) ( not ( = ?auto_5392494 ?auto_5392499 ) ) ( HAVE_IMAGE ?auto_5392490 ?auto_5392491 ) ( not ( = ?auto_5392490 ?auto_5392499 ) ) ( not ( = ?auto_5392491 ?auto_5392493 ) ) ( CALIBRATION_TARGET ?auto_5392502 ?auto_5392499 ) ( POINTING ?auto_5392500 ?auto_5392495 ) ( not ( = ?auto_5392499 ?auto_5392495 ) ) ( ON_BOARD ?auto_5392501 ?auto_5392500 ) ( POWER_ON ?auto_5392501 ) ( not ( = ?auto_5392502 ?auto_5392501 ) ) ( HAVE_IMAGE ?auto_5392492 ?auto_5392489 ) ( HAVE_IMAGE ?auto_5392495 ?auto_5392496 ) ( HAVE_IMAGE ?auto_5392497 ?auto_5392498 ) ( not ( = ?auto_5392491 ?auto_5392489 ) ) ( not ( = ?auto_5392491 ?auto_5392496 ) ) ( not ( = ?auto_5392491 ?auto_5392498 ) ) ( not ( = ?auto_5392492 ?auto_5392499 ) ) ( not ( = ?auto_5392489 ?auto_5392493 ) ) ( not ( = ?auto_5392489 ?auto_5392496 ) ) ( not ( = ?auto_5392489 ?auto_5392498 ) ) ( not ( = ?auto_5392493 ?auto_5392496 ) ) ( not ( = ?auto_5392493 ?auto_5392498 ) ) ( not ( = ?auto_5392496 ?auto_5392498 ) ) ( not ( = ?auto_5392497 ?auto_5392499 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5392490 ?auto_5392491 ?auto_5392494 ?auto_5392493 )
      ( GET-5IMAGE-VERIFY ?auto_5392490 ?auto_5392491 ?auto_5392492 ?auto_5392489 ?auto_5392494 ?auto_5392493 ?auto_5392495 ?auto_5392496 ?auto_5392497 ?auto_5392498 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5393627 - DIRECTION
      ?auto_5393628 - MODE
      ?auto_5393629 - DIRECTION
      ?auto_5393626 - MODE
      ?auto_5393631 - DIRECTION
      ?auto_5393630 - MODE
      ?auto_5393632 - DIRECTION
      ?auto_5393633 - MODE
      ?auto_5393634 - DIRECTION
      ?auto_5393635 - MODE
    )
    :vars
    (
      ?auto_5393639 - INSTRUMENT
      ?auto_5393637 - SATELLITE
      ?auto_5393636 - DIRECTION
      ?auto_5393638 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5393629 ?auto_5393627 ) ) ( not ( = ?auto_5393631 ?auto_5393627 ) ) ( not ( = ?auto_5393631 ?auto_5393629 ) ) ( not ( = ?auto_5393632 ?auto_5393627 ) ) ( not ( = ?auto_5393632 ?auto_5393629 ) ) ( not ( = ?auto_5393632 ?auto_5393631 ) ) ( not ( = ?auto_5393634 ?auto_5393627 ) ) ( not ( = ?auto_5393634 ?auto_5393629 ) ) ( not ( = ?auto_5393634 ?auto_5393631 ) ) ( not ( = ?auto_5393634 ?auto_5393632 ) ) ( ON_BOARD ?auto_5393639 ?auto_5393637 ) ( SUPPORTS ?auto_5393639 ?auto_5393635 ) ( not ( = ?auto_5393634 ?auto_5393636 ) ) ( HAVE_IMAGE ?auto_5393627 ?auto_5393628 ) ( not ( = ?auto_5393627 ?auto_5393636 ) ) ( not ( = ?auto_5393628 ?auto_5393635 ) ) ( CALIBRATION_TARGET ?auto_5393639 ?auto_5393636 ) ( POINTING ?auto_5393637 ?auto_5393629 ) ( not ( = ?auto_5393636 ?auto_5393629 ) ) ( ON_BOARD ?auto_5393638 ?auto_5393637 ) ( POWER_ON ?auto_5393638 ) ( not ( = ?auto_5393639 ?auto_5393638 ) ) ( HAVE_IMAGE ?auto_5393629 ?auto_5393626 ) ( HAVE_IMAGE ?auto_5393631 ?auto_5393630 ) ( HAVE_IMAGE ?auto_5393632 ?auto_5393633 ) ( not ( = ?auto_5393628 ?auto_5393626 ) ) ( not ( = ?auto_5393628 ?auto_5393630 ) ) ( not ( = ?auto_5393628 ?auto_5393633 ) ) ( not ( = ?auto_5393626 ?auto_5393630 ) ) ( not ( = ?auto_5393626 ?auto_5393633 ) ) ( not ( = ?auto_5393626 ?auto_5393635 ) ) ( not ( = ?auto_5393631 ?auto_5393636 ) ) ( not ( = ?auto_5393630 ?auto_5393633 ) ) ( not ( = ?auto_5393630 ?auto_5393635 ) ) ( not ( = ?auto_5393632 ?auto_5393636 ) ) ( not ( = ?auto_5393633 ?auto_5393635 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5393627 ?auto_5393628 ?auto_5393634 ?auto_5393635 )
      ( GET-5IMAGE-VERIFY ?auto_5393627 ?auto_5393628 ?auto_5393629 ?auto_5393626 ?auto_5393631 ?auto_5393630 ?auto_5393632 ?auto_5393633 ?auto_5393634 ?auto_5393635 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5393683 - DIRECTION
      ?auto_5393684 - MODE
      ?auto_5393685 - DIRECTION
      ?auto_5393682 - MODE
      ?auto_5393687 - DIRECTION
      ?auto_5393686 - MODE
      ?auto_5393688 - DIRECTION
      ?auto_5393689 - MODE
      ?auto_5393690 - DIRECTION
      ?auto_5393691 - MODE
    )
    :vars
    (
      ?auto_5393695 - INSTRUMENT
      ?auto_5393693 - SATELLITE
      ?auto_5393692 - DIRECTION
      ?auto_5393694 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5393685 ?auto_5393683 ) ) ( not ( = ?auto_5393687 ?auto_5393683 ) ) ( not ( = ?auto_5393687 ?auto_5393685 ) ) ( not ( = ?auto_5393688 ?auto_5393683 ) ) ( not ( = ?auto_5393688 ?auto_5393685 ) ) ( not ( = ?auto_5393688 ?auto_5393687 ) ) ( not ( = ?auto_5393690 ?auto_5393683 ) ) ( not ( = ?auto_5393690 ?auto_5393685 ) ) ( not ( = ?auto_5393690 ?auto_5393687 ) ) ( not ( = ?auto_5393690 ?auto_5393688 ) ) ( ON_BOARD ?auto_5393695 ?auto_5393693 ) ( SUPPORTS ?auto_5393695 ?auto_5393689 ) ( not ( = ?auto_5393688 ?auto_5393692 ) ) ( HAVE_IMAGE ?auto_5393683 ?auto_5393684 ) ( not ( = ?auto_5393683 ?auto_5393692 ) ) ( not ( = ?auto_5393684 ?auto_5393689 ) ) ( CALIBRATION_TARGET ?auto_5393695 ?auto_5393692 ) ( POINTING ?auto_5393693 ?auto_5393685 ) ( not ( = ?auto_5393692 ?auto_5393685 ) ) ( ON_BOARD ?auto_5393694 ?auto_5393693 ) ( POWER_ON ?auto_5393694 ) ( not ( = ?auto_5393695 ?auto_5393694 ) ) ( HAVE_IMAGE ?auto_5393685 ?auto_5393682 ) ( HAVE_IMAGE ?auto_5393687 ?auto_5393686 ) ( HAVE_IMAGE ?auto_5393690 ?auto_5393691 ) ( not ( = ?auto_5393684 ?auto_5393682 ) ) ( not ( = ?auto_5393684 ?auto_5393686 ) ) ( not ( = ?auto_5393684 ?auto_5393691 ) ) ( not ( = ?auto_5393682 ?auto_5393686 ) ) ( not ( = ?auto_5393682 ?auto_5393689 ) ) ( not ( = ?auto_5393682 ?auto_5393691 ) ) ( not ( = ?auto_5393687 ?auto_5393692 ) ) ( not ( = ?auto_5393686 ?auto_5393689 ) ) ( not ( = ?auto_5393686 ?auto_5393691 ) ) ( not ( = ?auto_5393689 ?auto_5393691 ) ) ( not ( = ?auto_5393690 ?auto_5393692 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5393683 ?auto_5393684 ?auto_5393688 ?auto_5393689 )
      ( GET-5IMAGE-VERIFY ?auto_5393683 ?auto_5393684 ?auto_5393685 ?auto_5393682 ?auto_5393687 ?auto_5393686 ?auto_5393688 ?auto_5393689 ?auto_5393690 ?auto_5393691 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5394067 - DIRECTION
      ?auto_5394068 - MODE
      ?auto_5394069 - DIRECTION
      ?auto_5394066 - MODE
      ?auto_5394071 - DIRECTION
      ?auto_5394070 - MODE
      ?auto_5394072 - DIRECTION
      ?auto_5394073 - MODE
      ?auto_5394074 - DIRECTION
      ?auto_5394075 - MODE
    )
    :vars
    (
      ?auto_5394079 - INSTRUMENT
      ?auto_5394077 - SATELLITE
      ?auto_5394076 - DIRECTION
      ?auto_5394078 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5394069 ?auto_5394067 ) ) ( not ( = ?auto_5394071 ?auto_5394067 ) ) ( not ( = ?auto_5394071 ?auto_5394069 ) ) ( not ( = ?auto_5394072 ?auto_5394067 ) ) ( not ( = ?auto_5394072 ?auto_5394069 ) ) ( not ( = ?auto_5394072 ?auto_5394071 ) ) ( not ( = ?auto_5394074 ?auto_5394067 ) ) ( not ( = ?auto_5394074 ?auto_5394069 ) ) ( not ( = ?auto_5394074 ?auto_5394071 ) ) ( not ( = ?auto_5394074 ?auto_5394072 ) ) ( ON_BOARD ?auto_5394079 ?auto_5394077 ) ( SUPPORTS ?auto_5394079 ?auto_5394070 ) ( not ( = ?auto_5394071 ?auto_5394076 ) ) ( HAVE_IMAGE ?auto_5394067 ?auto_5394068 ) ( not ( = ?auto_5394067 ?auto_5394076 ) ) ( not ( = ?auto_5394068 ?auto_5394070 ) ) ( CALIBRATION_TARGET ?auto_5394079 ?auto_5394076 ) ( POINTING ?auto_5394077 ?auto_5394069 ) ( not ( = ?auto_5394076 ?auto_5394069 ) ) ( ON_BOARD ?auto_5394078 ?auto_5394077 ) ( POWER_ON ?auto_5394078 ) ( not ( = ?auto_5394079 ?auto_5394078 ) ) ( HAVE_IMAGE ?auto_5394069 ?auto_5394066 ) ( HAVE_IMAGE ?auto_5394072 ?auto_5394073 ) ( HAVE_IMAGE ?auto_5394074 ?auto_5394075 ) ( not ( = ?auto_5394068 ?auto_5394066 ) ) ( not ( = ?auto_5394068 ?auto_5394073 ) ) ( not ( = ?auto_5394068 ?auto_5394075 ) ) ( not ( = ?auto_5394066 ?auto_5394070 ) ) ( not ( = ?auto_5394066 ?auto_5394073 ) ) ( not ( = ?auto_5394066 ?auto_5394075 ) ) ( not ( = ?auto_5394070 ?auto_5394073 ) ) ( not ( = ?auto_5394070 ?auto_5394075 ) ) ( not ( = ?auto_5394072 ?auto_5394076 ) ) ( not ( = ?auto_5394073 ?auto_5394075 ) ) ( not ( = ?auto_5394074 ?auto_5394076 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5394067 ?auto_5394068 ?auto_5394071 ?auto_5394070 )
      ( GET-5IMAGE-VERIFY ?auto_5394067 ?auto_5394068 ?auto_5394069 ?auto_5394066 ?auto_5394071 ?auto_5394070 ?auto_5394072 ?auto_5394073 ?auto_5394074 ?auto_5394075 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5394874 - DIRECTION
      ?auto_5394875 - MODE
      ?auto_5394876 - DIRECTION
      ?auto_5394873 - MODE
      ?auto_5394878 - DIRECTION
      ?auto_5394877 - MODE
      ?auto_5394879 - DIRECTION
      ?auto_5394880 - MODE
      ?auto_5394881 - DIRECTION
      ?auto_5394882 - MODE
    )
    :vars
    (
      ?auto_5394886 - INSTRUMENT
      ?auto_5394884 - SATELLITE
      ?auto_5394883 - DIRECTION
      ?auto_5394885 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5394876 ?auto_5394874 ) ) ( not ( = ?auto_5394878 ?auto_5394874 ) ) ( not ( = ?auto_5394878 ?auto_5394876 ) ) ( not ( = ?auto_5394879 ?auto_5394874 ) ) ( not ( = ?auto_5394879 ?auto_5394876 ) ) ( not ( = ?auto_5394879 ?auto_5394878 ) ) ( not ( = ?auto_5394881 ?auto_5394874 ) ) ( not ( = ?auto_5394881 ?auto_5394876 ) ) ( not ( = ?auto_5394881 ?auto_5394878 ) ) ( not ( = ?auto_5394881 ?auto_5394879 ) ) ( ON_BOARD ?auto_5394886 ?auto_5394884 ) ( SUPPORTS ?auto_5394886 ?auto_5394873 ) ( not ( = ?auto_5394876 ?auto_5394883 ) ) ( HAVE_IMAGE ?auto_5394874 ?auto_5394875 ) ( not ( = ?auto_5394874 ?auto_5394883 ) ) ( not ( = ?auto_5394875 ?auto_5394873 ) ) ( CALIBRATION_TARGET ?auto_5394886 ?auto_5394883 ) ( POINTING ?auto_5394884 ?auto_5394881 ) ( not ( = ?auto_5394883 ?auto_5394881 ) ) ( ON_BOARD ?auto_5394885 ?auto_5394884 ) ( POWER_ON ?auto_5394885 ) ( not ( = ?auto_5394886 ?auto_5394885 ) ) ( HAVE_IMAGE ?auto_5394878 ?auto_5394877 ) ( HAVE_IMAGE ?auto_5394879 ?auto_5394880 ) ( HAVE_IMAGE ?auto_5394881 ?auto_5394882 ) ( not ( = ?auto_5394875 ?auto_5394877 ) ) ( not ( = ?auto_5394875 ?auto_5394880 ) ) ( not ( = ?auto_5394875 ?auto_5394882 ) ) ( not ( = ?auto_5394873 ?auto_5394877 ) ) ( not ( = ?auto_5394873 ?auto_5394880 ) ) ( not ( = ?auto_5394873 ?auto_5394882 ) ) ( not ( = ?auto_5394878 ?auto_5394883 ) ) ( not ( = ?auto_5394877 ?auto_5394880 ) ) ( not ( = ?auto_5394877 ?auto_5394882 ) ) ( not ( = ?auto_5394879 ?auto_5394883 ) ) ( not ( = ?auto_5394880 ?auto_5394882 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5394874 ?auto_5394875 ?auto_5394876 ?auto_5394873 )
      ( GET-5IMAGE-VERIFY ?auto_5394874 ?auto_5394875 ?auto_5394876 ?auto_5394873 ?auto_5394878 ?auto_5394877 ?auto_5394879 ?auto_5394880 ?auto_5394881 ?auto_5394882 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5394931 - DIRECTION
      ?auto_5394932 - MODE
      ?auto_5394933 - DIRECTION
      ?auto_5394930 - MODE
      ?auto_5394935 - DIRECTION
      ?auto_5394934 - MODE
      ?auto_5394936 - DIRECTION
      ?auto_5394937 - MODE
      ?auto_5394938 - DIRECTION
      ?auto_5394939 - MODE
    )
    :vars
    (
      ?auto_5394943 - INSTRUMENT
      ?auto_5394941 - SATELLITE
      ?auto_5394940 - DIRECTION
      ?auto_5394942 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5394933 ?auto_5394931 ) ) ( not ( = ?auto_5394935 ?auto_5394931 ) ) ( not ( = ?auto_5394935 ?auto_5394933 ) ) ( not ( = ?auto_5394936 ?auto_5394931 ) ) ( not ( = ?auto_5394936 ?auto_5394933 ) ) ( not ( = ?auto_5394936 ?auto_5394935 ) ) ( not ( = ?auto_5394938 ?auto_5394931 ) ) ( not ( = ?auto_5394938 ?auto_5394933 ) ) ( not ( = ?auto_5394938 ?auto_5394935 ) ) ( not ( = ?auto_5394938 ?auto_5394936 ) ) ( ON_BOARD ?auto_5394943 ?auto_5394941 ) ( SUPPORTS ?auto_5394943 ?auto_5394930 ) ( not ( = ?auto_5394933 ?auto_5394940 ) ) ( HAVE_IMAGE ?auto_5394931 ?auto_5394932 ) ( not ( = ?auto_5394931 ?auto_5394940 ) ) ( not ( = ?auto_5394932 ?auto_5394930 ) ) ( CALIBRATION_TARGET ?auto_5394943 ?auto_5394940 ) ( POINTING ?auto_5394941 ?auto_5394936 ) ( not ( = ?auto_5394940 ?auto_5394936 ) ) ( ON_BOARD ?auto_5394942 ?auto_5394941 ) ( POWER_ON ?auto_5394942 ) ( not ( = ?auto_5394943 ?auto_5394942 ) ) ( HAVE_IMAGE ?auto_5394935 ?auto_5394934 ) ( HAVE_IMAGE ?auto_5394936 ?auto_5394937 ) ( HAVE_IMAGE ?auto_5394938 ?auto_5394939 ) ( not ( = ?auto_5394932 ?auto_5394934 ) ) ( not ( = ?auto_5394932 ?auto_5394937 ) ) ( not ( = ?auto_5394932 ?auto_5394939 ) ) ( not ( = ?auto_5394930 ?auto_5394934 ) ) ( not ( = ?auto_5394930 ?auto_5394937 ) ) ( not ( = ?auto_5394930 ?auto_5394939 ) ) ( not ( = ?auto_5394935 ?auto_5394940 ) ) ( not ( = ?auto_5394934 ?auto_5394937 ) ) ( not ( = ?auto_5394934 ?auto_5394939 ) ) ( not ( = ?auto_5394937 ?auto_5394939 ) ) ( not ( = ?auto_5394938 ?auto_5394940 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5394931 ?auto_5394932 ?auto_5394933 ?auto_5394930 )
      ( GET-5IMAGE-VERIFY ?auto_5394931 ?auto_5394932 ?auto_5394933 ?auto_5394930 ?auto_5394935 ?auto_5394934 ?auto_5394936 ?auto_5394937 ?auto_5394938 ?auto_5394939 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5395503 - DIRECTION
      ?auto_5395504 - MODE
      ?auto_5395505 - DIRECTION
      ?auto_5395502 - MODE
      ?auto_5395507 - DIRECTION
      ?auto_5395506 - MODE
      ?auto_5395508 - DIRECTION
      ?auto_5395509 - MODE
      ?auto_5395510 - DIRECTION
      ?auto_5395511 - MODE
    )
    :vars
    (
      ?auto_5395515 - INSTRUMENT
      ?auto_5395513 - SATELLITE
      ?auto_5395512 - DIRECTION
      ?auto_5395514 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5395505 ?auto_5395503 ) ) ( not ( = ?auto_5395507 ?auto_5395503 ) ) ( not ( = ?auto_5395507 ?auto_5395505 ) ) ( not ( = ?auto_5395508 ?auto_5395503 ) ) ( not ( = ?auto_5395508 ?auto_5395505 ) ) ( not ( = ?auto_5395508 ?auto_5395507 ) ) ( not ( = ?auto_5395510 ?auto_5395503 ) ) ( not ( = ?auto_5395510 ?auto_5395505 ) ) ( not ( = ?auto_5395510 ?auto_5395507 ) ) ( not ( = ?auto_5395510 ?auto_5395508 ) ) ( ON_BOARD ?auto_5395515 ?auto_5395513 ) ( SUPPORTS ?auto_5395515 ?auto_5395502 ) ( not ( = ?auto_5395505 ?auto_5395512 ) ) ( HAVE_IMAGE ?auto_5395503 ?auto_5395504 ) ( not ( = ?auto_5395503 ?auto_5395512 ) ) ( not ( = ?auto_5395504 ?auto_5395502 ) ) ( CALIBRATION_TARGET ?auto_5395515 ?auto_5395512 ) ( POINTING ?auto_5395513 ?auto_5395507 ) ( not ( = ?auto_5395512 ?auto_5395507 ) ) ( ON_BOARD ?auto_5395514 ?auto_5395513 ) ( POWER_ON ?auto_5395514 ) ( not ( = ?auto_5395515 ?auto_5395514 ) ) ( HAVE_IMAGE ?auto_5395507 ?auto_5395506 ) ( HAVE_IMAGE ?auto_5395508 ?auto_5395509 ) ( HAVE_IMAGE ?auto_5395510 ?auto_5395511 ) ( not ( = ?auto_5395504 ?auto_5395506 ) ) ( not ( = ?auto_5395504 ?auto_5395509 ) ) ( not ( = ?auto_5395504 ?auto_5395511 ) ) ( not ( = ?auto_5395502 ?auto_5395506 ) ) ( not ( = ?auto_5395502 ?auto_5395509 ) ) ( not ( = ?auto_5395502 ?auto_5395511 ) ) ( not ( = ?auto_5395506 ?auto_5395509 ) ) ( not ( = ?auto_5395506 ?auto_5395511 ) ) ( not ( = ?auto_5395508 ?auto_5395512 ) ) ( not ( = ?auto_5395509 ?auto_5395511 ) ) ( not ( = ?auto_5395510 ?auto_5395512 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5395503 ?auto_5395504 ?auto_5395505 ?auto_5395502 )
      ( GET-5IMAGE-VERIFY ?auto_5395503 ?auto_5395504 ?auto_5395505 ?auto_5395502 ?auto_5395507 ?auto_5395506 ?auto_5395508 ?auto_5395509 ?auto_5395510 ?auto_5395511 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5407461 - DIRECTION
      ?auto_5407462 - MODE
      ?auto_5407463 - DIRECTION
      ?auto_5407460 - MODE
      ?auto_5407465 - DIRECTION
      ?auto_5407464 - MODE
      ?auto_5407466 - DIRECTION
      ?auto_5407467 - MODE
      ?auto_5407468 - DIRECTION
      ?auto_5407469 - MODE
    )
    :vars
    (
      ?auto_5407473 - INSTRUMENT
      ?auto_5407471 - SATELLITE
      ?auto_5407470 - DIRECTION
      ?auto_5407472 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5407463 ?auto_5407461 ) ) ( not ( = ?auto_5407465 ?auto_5407461 ) ) ( not ( = ?auto_5407465 ?auto_5407463 ) ) ( not ( = ?auto_5407466 ?auto_5407461 ) ) ( not ( = ?auto_5407466 ?auto_5407463 ) ) ( not ( = ?auto_5407466 ?auto_5407465 ) ) ( not ( = ?auto_5407468 ?auto_5407461 ) ) ( not ( = ?auto_5407468 ?auto_5407463 ) ) ( not ( = ?auto_5407468 ?auto_5407465 ) ) ( not ( = ?auto_5407468 ?auto_5407466 ) ) ( ON_BOARD ?auto_5407473 ?auto_5407471 ) ( SUPPORTS ?auto_5407473 ?auto_5407469 ) ( not ( = ?auto_5407468 ?auto_5407470 ) ) ( HAVE_IMAGE ?auto_5407463 ?auto_5407460 ) ( not ( = ?auto_5407463 ?auto_5407470 ) ) ( not ( = ?auto_5407460 ?auto_5407469 ) ) ( CALIBRATION_TARGET ?auto_5407473 ?auto_5407470 ) ( POINTING ?auto_5407471 ?auto_5407461 ) ( not ( = ?auto_5407470 ?auto_5407461 ) ) ( ON_BOARD ?auto_5407472 ?auto_5407471 ) ( POWER_ON ?auto_5407472 ) ( not ( = ?auto_5407473 ?auto_5407472 ) ) ( HAVE_IMAGE ?auto_5407461 ?auto_5407462 ) ( HAVE_IMAGE ?auto_5407465 ?auto_5407464 ) ( HAVE_IMAGE ?auto_5407466 ?auto_5407467 ) ( not ( = ?auto_5407462 ?auto_5407460 ) ) ( not ( = ?auto_5407462 ?auto_5407464 ) ) ( not ( = ?auto_5407462 ?auto_5407467 ) ) ( not ( = ?auto_5407462 ?auto_5407469 ) ) ( not ( = ?auto_5407460 ?auto_5407464 ) ) ( not ( = ?auto_5407460 ?auto_5407467 ) ) ( not ( = ?auto_5407465 ?auto_5407470 ) ) ( not ( = ?auto_5407464 ?auto_5407467 ) ) ( not ( = ?auto_5407464 ?auto_5407469 ) ) ( not ( = ?auto_5407466 ?auto_5407470 ) ) ( not ( = ?auto_5407467 ?auto_5407469 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5407463 ?auto_5407460 ?auto_5407468 ?auto_5407469 )
      ( GET-5IMAGE-VERIFY ?auto_5407461 ?auto_5407462 ?auto_5407463 ?auto_5407460 ?auto_5407465 ?auto_5407464 ?auto_5407466 ?auto_5407467 ?auto_5407468 ?auto_5407469 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5407517 - DIRECTION
      ?auto_5407518 - MODE
      ?auto_5407519 - DIRECTION
      ?auto_5407516 - MODE
      ?auto_5407521 - DIRECTION
      ?auto_5407520 - MODE
      ?auto_5407522 - DIRECTION
      ?auto_5407523 - MODE
      ?auto_5407524 - DIRECTION
      ?auto_5407525 - MODE
    )
    :vars
    (
      ?auto_5407529 - INSTRUMENT
      ?auto_5407527 - SATELLITE
      ?auto_5407526 - DIRECTION
      ?auto_5407528 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5407519 ?auto_5407517 ) ) ( not ( = ?auto_5407521 ?auto_5407517 ) ) ( not ( = ?auto_5407521 ?auto_5407519 ) ) ( not ( = ?auto_5407522 ?auto_5407517 ) ) ( not ( = ?auto_5407522 ?auto_5407519 ) ) ( not ( = ?auto_5407522 ?auto_5407521 ) ) ( not ( = ?auto_5407524 ?auto_5407517 ) ) ( not ( = ?auto_5407524 ?auto_5407519 ) ) ( not ( = ?auto_5407524 ?auto_5407521 ) ) ( not ( = ?auto_5407524 ?auto_5407522 ) ) ( ON_BOARD ?auto_5407529 ?auto_5407527 ) ( SUPPORTS ?auto_5407529 ?auto_5407523 ) ( not ( = ?auto_5407522 ?auto_5407526 ) ) ( HAVE_IMAGE ?auto_5407519 ?auto_5407516 ) ( not ( = ?auto_5407519 ?auto_5407526 ) ) ( not ( = ?auto_5407516 ?auto_5407523 ) ) ( CALIBRATION_TARGET ?auto_5407529 ?auto_5407526 ) ( POINTING ?auto_5407527 ?auto_5407517 ) ( not ( = ?auto_5407526 ?auto_5407517 ) ) ( ON_BOARD ?auto_5407528 ?auto_5407527 ) ( POWER_ON ?auto_5407528 ) ( not ( = ?auto_5407529 ?auto_5407528 ) ) ( HAVE_IMAGE ?auto_5407517 ?auto_5407518 ) ( HAVE_IMAGE ?auto_5407521 ?auto_5407520 ) ( HAVE_IMAGE ?auto_5407524 ?auto_5407525 ) ( not ( = ?auto_5407518 ?auto_5407516 ) ) ( not ( = ?auto_5407518 ?auto_5407520 ) ) ( not ( = ?auto_5407518 ?auto_5407523 ) ) ( not ( = ?auto_5407518 ?auto_5407525 ) ) ( not ( = ?auto_5407516 ?auto_5407520 ) ) ( not ( = ?auto_5407516 ?auto_5407525 ) ) ( not ( = ?auto_5407521 ?auto_5407526 ) ) ( not ( = ?auto_5407520 ?auto_5407523 ) ) ( not ( = ?auto_5407520 ?auto_5407525 ) ) ( not ( = ?auto_5407523 ?auto_5407525 ) ) ( not ( = ?auto_5407524 ?auto_5407526 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5407519 ?auto_5407516 ?auto_5407522 ?auto_5407523 )
      ( GET-5IMAGE-VERIFY ?auto_5407517 ?auto_5407518 ?auto_5407519 ?auto_5407516 ?auto_5407521 ?auto_5407520 ?auto_5407522 ?auto_5407523 ?auto_5407524 ?auto_5407525 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5407901 - DIRECTION
      ?auto_5407902 - MODE
      ?auto_5407903 - DIRECTION
      ?auto_5407900 - MODE
      ?auto_5407905 - DIRECTION
      ?auto_5407904 - MODE
      ?auto_5407906 - DIRECTION
      ?auto_5407907 - MODE
      ?auto_5407908 - DIRECTION
      ?auto_5407909 - MODE
    )
    :vars
    (
      ?auto_5407913 - INSTRUMENT
      ?auto_5407911 - SATELLITE
      ?auto_5407910 - DIRECTION
      ?auto_5407912 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5407903 ?auto_5407901 ) ) ( not ( = ?auto_5407905 ?auto_5407901 ) ) ( not ( = ?auto_5407905 ?auto_5407903 ) ) ( not ( = ?auto_5407906 ?auto_5407901 ) ) ( not ( = ?auto_5407906 ?auto_5407903 ) ) ( not ( = ?auto_5407906 ?auto_5407905 ) ) ( not ( = ?auto_5407908 ?auto_5407901 ) ) ( not ( = ?auto_5407908 ?auto_5407903 ) ) ( not ( = ?auto_5407908 ?auto_5407905 ) ) ( not ( = ?auto_5407908 ?auto_5407906 ) ) ( ON_BOARD ?auto_5407913 ?auto_5407911 ) ( SUPPORTS ?auto_5407913 ?auto_5407904 ) ( not ( = ?auto_5407905 ?auto_5407910 ) ) ( HAVE_IMAGE ?auto_5407903 ?auto_5407900 ) ( not ( = ?auto_5407903 ?auto_5407910 ) ) ( not ( = ?auto_5407900 ?auto_5407904 ) ) ( CALIBRATION_TARGET ?auto_5407913 ?auto_5407910 ) ( POINTING ?auto_5407911 ?auto_5407901 ) ( not ( = ?auto_5407910 ?auto_5407901 ) ) ( ON_BOARD ?auto_5407912 ?auto_5407911 ) ( POWER_ON ?auto_5407912 ) ( not ( = ?auto_5407913 ?auto_5407912 ) ) ( HAVE_IMAGE ?auto_5407901 ?auto_5407902 ) ( HAVE_IMAGE ?auto_5407906 ?auto_5407907 ) ( HAVE_IMAGE ?auto_5407908 ?auto_5407909 ) ( not ( = ?auto_5407902 ?auto_5407900 ) ) ( not ( = ?auto_5407902 ?auto_5407904 ) ) ( not ( = ?auto_5407902 ?auto_5407907 ) ) ( not ( = ?auto_5407902 ?auto_5407909 ) ) ( not ( = ?auto_5407900 ?auto_5407907 ) ) ( not ( = ?auto_5407900 ?auto_5407909 ) ) ( not ( = ?auto_5407904 ?auto_5407907 ) ) ( not ( = ?auto_5407904 ?auto_5407909 ) ) ( not ( = ?auto_5407906 ?auto_5407910 ) ) ( not ( = ?auto_5407907 ?auto_5407909 ) ) ( not ( = ?auto_5407908 ?auto_5407910 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5407903 ?auto_5407900 ?auto_5407905 ?auto_5407904 )
      ( GET-5IMAGE-VERIFY ?auto_5407901 ?auto_5407902 ?auto_5407903 ?auto_5407900 ?auto_5407905 ?auto_5407904 ?auto_5407906 ?auto_5407907 ?auto_5407908 ?auto_5407909 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5410983 - DIRECTION
      ?auto_5410984 - MODE
      ?auto_5410985 - DIRECTION
      ?auto_5410982 - MODE
      ?auto_5410987 - DIRECTION
      ?auto_5410986 - MODE
      ?auto_5410988 - DIRECTION
      ?auto_5410989 - MODE
      ?auto_5410990 - DIRECTION
      ?auto_5410991 - MODE
    )
    :vars
    (
      ?auto_5410995 - INSTRUMENT
      ?auto_5410993 - SATELLITE
      ?auto_5410992 - DIRECTION
      ?auto_5410994 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5410985 ?auto_5410983 ) ) ( not ( = ?auto_5410987 ?auto_5410983 ) ) ( not ( = ?auto_5410987 ?auto_5410985 ) ) ( not ( = ?auto_5410988 ?auto_5410983 ) ) ( not ( = ?auto_5410988 ?auto_5410985 ) ) ( not ( = ?auto_5410988 ?auto_5410987 ) ) ( not ( = ?auto_5410990 ?auto_5410983 ) ) ( not ( = ?auto_5410990 ?auto_5410985 ) ) ( not ( = ?auto_5410990 ?auto_5410987 ) ) ( not ( = ?auto_5410990 ?auto_5410988 ) ) ( ON_BOARD ?auto_5410995 ?auto_5410993 ) ( SUPPORTS ?auto_5410995 ?auto_5410982 ) ( not ( = ?auto_5410985 ?auto_5410992 ) ) ( HAVE_IMAGE ?auto_5410987 ?auto_5410986 ) ( not ( = ?auto_5410987 ?auto_5410992 ) ) ( not ( = ?auto_5410986 ?auto_5410982 ) ) ( CALIBRATION_TARGET ?auto_5410995 ?auto_5410992 ) ( POINTING ?auto_5410993 ?auto_5410983 ) ( not ( = ?auto_5410992 ?auto_5410983 ) ) ( ON_BOARD ?auto_5410994 ?auto_5410993 ) ( POWER_ON ?auto_5410994 ) ( not ( = ?auto_5410995 ?auto_5410994 ) ) ( HAVE_IMAGE ?auto_5410983 ?auto_5410984 ) ( HAVE_IMAGE ?auto_5410988 ?auto_5410989 ) ( HAVE_IMAGE ?auto_5410990 ?auto_5410991 ) ( not ( = ?auto_5410984 ?auto_5410982 ) ) ( not ( = ?auto_5410984 ?auto_5410986 ) ) ( not ( = ?auto_5410984 ?auto_5410989 ) ) ( not ( = ?auto_5410984 ?auto_5410991 ) ) ( not ( = ?auto_5410982 ?auto_5410989 ) ) ( not ( = ?auto_5410982 ?auto_5410991 ) ) ( not ( = ?auto_5410986 ?auto_5410989 ) ) ( not ( = ?auto_5410986 ?auto_5410991 ) ) ( not ( = ?auto_5410988 ?auto_5410992 ) ) ( not ( = ?auto_5410989 ?auto_5410991 ) ) ( not ( = ?auto_5410990 ?auto_5410992 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5410987 ?auto_5410986 ?auto_5410985 ?auto_5410982 )
      ( GET-5IMAGE-VERIFY ?auto_5410983 ?auto_5410984 ?auto_5410985 ?auto_5410982 ?auto_5410987 ?auto_5410986 ?auto_5410988 ?auto_5410989 ?auto_5410990 ?auto_5410991 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5413302 - DIRECTION
      ?auto_5413303 - MODE
      ?auto_5413304 - DIRECTION
      ?auto_5413301 - MODE
      ?auto_5413306 - DIRECTION
      ?auto_5413305 - MODE
      ?auto_5413307 - DIRECTION
      ?auto_5413308 - MODE
      ?auto_5413309 - DIRECTION
      ?auto_5413310 - MODE
    )
    :vars
    (
      ?auto_5413314 - INSTRUMENT
      ?auto_5413312 - SATELLITE
      ?auto_5413311 - DIRECTION
      ?auto_5413313 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5413304 ?auto_5413302 ) ) ( not ( = ?auto_5413306 ?auto_5413302 ) ) ( not ( = ?auto_5413306 ?auto_5413304 ) ) ( not ( = ?auto_5413307 ?auto_5413302 ) ) ( not ( = ?auto_5413307 ?auto_5413304 ) ) ( not ( = ?auto_5413307 ?auto_5413306 ) ) ( not ( = ?auto_5413309 ?auto_5413302 ) ) ( not ( = ?auto_5413309 ?auto_5413304 ) ) ( not ( = ?auto_5413309 ?auto_5413306 ) ) ( not ( = ?auto_5413309 ?auto_5413307 ) ) ( ON_BOARD ?auto_5413314 ?auto_5413312 ) ( SUPPORTS ?auto_5413314 ?auto_5413303 ) ( not ( = ?auto_5413302 ?auto_5413311 ) ) ( HAVE_IMAGE ?auto_5413304 ?auto_5413301 ) ( not ( = ?auto_5413304 ?auto_5413311 ) ) ( not ( = ?auto_5413301 ?auto_5413303 ) ) ( CALIBRATION_TARGET ?auto_5413314 ?auto_5413311 ) ( POINTING ?auto_5413312 ?auto_5413309 ) ( not ( = ?auto_5413311 ?auto_5413309 ) ) ( ON_BOARD ?auto_5413313 ?auto_5413312 ) ( POWER_ON ?auto_5413313 ) ( not ( = ?auto_5413314 ?auto_5413313 ) ) ( HAVE_IMAGE ?auto_5413306 ?auto_5413305 ) ( HAVE_IMAGE ?auto_5413307 ?auto_5413308 ) ( HAVE_IMAGE ?auto_5413309 ?auto_5413310 ) ( not ( = ?auto_5413303 ?auto_5413305 ) ) ( not ( = ?auto_5413303 ?auto_5413308 ) ) ( not ( = ?auto_5413303 ?auto_5413310 ) ) ( not ( = ?auto_5413301 ?auto_5413305 ) ) ( not ( = ?auto_5413301 ?auto_5413308 ) ) ( not ( = ?auto_5413301 ?auto_5413310 ) ) ( not ( = ?auto_5413306 ?auto_5413311 ) ) ( not ( = ?auto_5413305 ?auto_5413308 ) ) ( not ( = ?auto_5413305 ?auto_5413310 ) ) ( not ( = ?auto_5413307 ?auto_5413311 ) ) ( not ( = ?auto_5413308 ?auto_5413310 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5413304 ?auto_5413301 ?auto_5413302 ?auto_5413303 )
      ( GET-5IMAGE-VERIFY ?auto_5413302 ?auto_5413303 ?auto_5413304 ?auto_5413301 ?auto_5413306 ?auto_5413305 ?auto_5413307 ?auto_5413308 ?auto_5413309 ?auto_5413310 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5413359 - DIRECTION
      ?auto_5413360 - MODE
      ?auto_5413361 - DIRECTION
      ?auto_5413358 - MODE
      ?auto_5413363 - DIRECTION
      ?auto_5413362 - MODE
      ?auto_5413364 - DIRECTION
      ?auto_5413365 - MODE
      ?auto_5413366 - DIRECTION
      ?auto_5413367 - MODE
    )
    :vars
    (
      ?auto_5413371 - INSTRUMENT
      ?auto_5413369 - SATELLITE
      ?auto_5413368 - DIRECTION
      ?auto_5413370 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5413361 ?auto_5413359 ) ) ( not ( = ?auto_5413363 ?auto_5413359 ) ) ( not ( = ?auto_5413363 ?auto_5413361 ) ) ( not ( = ?auto_5413364 ?auto_5413359 ) ) ( not ( = ?auto_5413364 ?auto_5413361 ) ) ( not ( = ?auto_5413364 ?auto_5413363 ) ) ( not ( = ?auto_5413366 ?auto_5413359 ) ) ( not ( = ?auto_5413366 ?auto_5413361 ) ) ( not ( = ?auto_5413366 ?auto_5413363 ) ) ( not ( = ?auto_5413366 ?auto_5413364 ) ) ( ON_BOARD ?auto_5413371 ?auto_5413369 ) ( SUPPORTS ?auto_5413371 ?auto_5413360 ) ( not ( = ?auto_5413359 ?auto_5413368 ) ) ( HAVE_IMAGE ?auto_5413361 ?auto_5413358 ) ( not ( = ?auto_5413361 ?auto_5413368 ) ) ( not ( = ?auto_5413358 ?auto_5413360 ) ) ( CALIBRATION_TARGET ?auto_5413371 ?auto_5413368 ) ( POINTING ?auto_5413369 ?auto_5413364 ) ( not ( = ?auto_5413368 ?auto_5413364 ) ) ( ON_BOARD ?auto_5413370 ?auto_5413369 ) ( POWER_ON ?auto_5413370 ) ( not ( = ?auto_5413371 ?auto_5413370 ) ) ( HAVE_IMAGE ?auto_5413363 ?auto_5413362 ) ( HAVE_IMAGE ?auto_5413364 ?auto_5413365 ) ( HAVE_IMAGE ?auto_5413366 ?auto_5413367 ) ( not ( = ?auto_5413360 ?auto_5413362 ) ) ( not ( = ?auto_5413360 ?auto_5413365 ) ) ( not ( = ?auto_5413360 ?auto_5413367 ) ) ( not ( = ?auto_5413358 ?auto_5413362 ) ) ( not ( = ?auto_5413358 ?auto_5413365 ) ) ( not ( = ?auto_5413358 ?auto_5413367 ) ) ( not ( = ?auto_5413363 ?auto_5413368 ) ) ( not ( = ?auto_5413362 ?auto_5413365 ) ) ( not ( = ?auto_5413362 ?auto_5413367 ) ) ( not ( = ?auto_5413365 ?auto_5413367 ) ) ( not ( = ?auto_5413366 ?auto_5413368 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5413361 ?auto_5413358 ?auto_5413359 ?auto_5413360 )
      ( GET-5IMAGE-VERIFY ?auto_5413359 ?auto_5413360 ?auto_5413361 ?auto_5413358 ?auto_5413363 ?auto_5413362 ?auto_5413364 ?auto_5413365 ?auto_5413366 ?auto_5413367 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5413931 - DIRECTION
      ?auto_5413932 - MODE
      ?auto_5413933 - DIRECTION
      ?auto_5413930 - MODE
      ?auto_5413935 - DIRECTION
      ?auto_5413934 - MODE
      ?auto_5413936 - DIRECTION
      ?auto_5413937 - MODE
      ?auto_5413938 - DIRECTION
      ?auto_5413939 - MODE
    )
    :vars
    (
      ?auto_5413943 - INSTRUMENT
      ?auto_5413941 - SATELLITE
      ?auto_5413940 - DIRECTION
      ?auto_5413942 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5413933 ?auto_5413931 ) ) ( not ( = ?auto_5413935 ?auto_5413931 ) ) ( not ( = ?auto_5413935 ?auto_5413933 ) ) ( not ( = ?auto_5413936 ?auto_5413931 ) ) ( not ( = ?auto_5413936 ?auto_5413933 ) ) ( not ( = ?auto_5413936 ?auto_5413935 ) ) ( not ( = ?auto_5413938 ?auto_5413931 ) ) ( not ( = ?auto_5413938 ?auto_5413933 ) ) ( not ( = ?auto_5413938 ?auto_5413935 ) ) ( not ( = ?auto_5413938 ?auto_5413936 ) ) ( ON_BOARD ?auto_5413943 ?auto_5413941 ) ( SUPPORTS ?auto_5413943 ?auto_5413932 ) ( not ( = ?auto_5413931 ?auto_5413940 ) ) ( HAVE_IMAGE ?auto_5413933 ?auto_5413930 ) ( not ( = ?auto_5413933 ?auto_5413940 ) ) ( not ( = ?auto_5413930 ?auto_5413932 ) ) ( CALIBRATION_TARGET ?auto_5413943 ?auto_5413940 ) ( POINTING ?auto_5413941 ?auto_5413935 ) ( not ( = ?auto_5413940 ?auto_5413935 ) ) ( ON_BOARD ?auto_5413942 ?auto_5413941 ) ( POWER_ON ?auto_5413942 ) ( not ( = ?auto_5413943 ?auto_5413942 ) ) ( HAVE_IMAGE ?auto_5413935 ?auto_5413934 ) ( HAVE_IMAGE ?auto_5413936 ?auto_5413937 ) ( HAVE_IMAGE ?auto_5413938 ?auto_5413939 ) ( not ( = ?auto_5413932 ?auto_5413934 ) ) ( not ( = ?auto_5413932 ?auto_5413937 ) ) ( not ( = ?auto_5413932 ?auto_5413939 ) ) ( not ( = ?auto_5413930 ?auto_5413934 ) ) ( not ( = ?auto_5413930 ?auto_5413937 ) ) ( not ( = ?auto_5413930 ?auto_5413939 ) ) ( not ( = ?auto_5413934 ?auto_5413937 ) ) ( not ( = ?auto_5413934 ?auto_5413939 ) ) ( not ( = ?auto_5413936 ?auto_5413940 ) ) ( not ( = ?auto_5413937 ?auto_5413939 ) ) ( not ( = ?auto_5413938 ?auto_5413940 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5413933 ?auto_5413930 ?auto_5413931 ?auto_5413932 )
      ( GET-5IMAGE-VERIFY ?auto_5413931 ?auto_5413932 ?auto_5413933 ?auto_5413930 ?auto_5413935 ?auto_5413934 ?auto_5413936 ?auto_5413937 ?auto_5413938 ?auto_5413939 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5418479 - DIRECTION
      ?auto_5418480 - MODE
      ?auto_5418481 - DIRECTION
      ?auto_5418478 - MODE
      ?auto_5418483 - DIRECTION
      ?auto_5418482 - MODE
      ?auto_5418484 - DIRECTION
      ?auto_5418485 - MODE
      ?auto_5418486 - DIRECTION
      ?auto_5418487 - MODE
    )
    :vars
    (
      ?auto_5418491 - INSTRUMENT
      ?auto_5418489 - SATELLITE
      ?auto_5418488 - DIRECTION
      ?auto_5418490 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5418481 ?auto_5418479 ) ) ( not ( = ?auto_5418483 ?auto_5418479 ) ) ( not ( = ?auto_5418483 ?auto_5418481 ) ) ( not ( = ?auto_5418484 ?auto_5418479 ) ) ( not ( = ?auto_5418484 ?auto_5418481 ) ) ( not ( = ?auto_5418484 ?auto_5418483 ) ) ( not ( = ?auto_5418486 ?auto_5418479 ) ) ( not ( = ?auto_5418486 ?auto_5418481 ) ) ( not ( = ?auto_5418486 ?auto_5418483 ) ) ( not ( = ?auto_5418486 ?auto_5418484 ) ) ( ON_BOARD ?auto_5418491 ?auto_5418489 ) ( SUPPORTS ?auto_5418491 ?auto_5418480 ) ( not ( = ?auto_5418479 ?auto_5418488 ) ) ( HAVE_IMAGE ?auto_5418483 ?auto_5418482 ) ( not ( = ?auto_5418483 ?auto_5418488 ) ) ( not ( = ?auto_5418482 ?auto_5418480 ) ) ( CALIBRATION_TARGET ?auto_5418491 ?auto_5418488 ) ( POINTING ?auto_5418489 ?auto_5418481 ) ( not ( = ?auto_5418488 ?auto_5418481 ) ) ( ON_BOARD ?auto_5418490 ?auto_5418489 ) ( POWER_ON ?auto_5418490 ) ( not ( = ?auto_5418491 ?auto_5418490 ) ) ( HAVE_IMAGE ?auto_5418481 ?auto_5418478 ) ( HAVE_IMAGE ?auto_5418484 ?auto_5418485 ) ( HAVE_IMAGE ?auto_5418486 ?auto_5418487 ) ( not ( = ?auto_5418480 ?auto_5418478 ) ) ( not ( = ?auto_5418480 ?auto_5418485 ) ) ( not ( = ?auto_5418480 ?auto_5418487 ) ) ( not ( = ?auto_5418478 ?auto_5418482 ) ) ( not ( = ?auto_5418478 ?auto_5418485 ) ) ( not ( = ?auto_5418478 ?auto_5418487 ) ) ( not ( = ?auto_5418482 ?auto_5418485 ) ) ( not ( = ?auto_5418482 ?auto_5418487 ) ) ( not ( = ?auto_5418484 ?auto_5418488 ) ) ( not ( = ?auto_5418485 ?auto_5418487 ) ) ( not ( = ?auto_5418486 ?auto_5418488 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5418483 ?auto_5418482 ?auto_5418479 ?auto_5418480 )
      ( GET-5IMAGE-VERIFY ?auto_5418479 ?auto_5418480 ?auto_5418481 ?auto_5418478 ?auto_5418483 ?auto_5418482 ?auto_5418484 ?auto_5418485 ?auto_5418486 ?auto_5418487 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5497694 - DIRECTION
      ?auto_5497695 - MODE
      ?auto_5497696 - DIRECTION
      ?auto_5497693 - MODE
      ?auto_5497698 - DIRECTION
      ?auto_5497697 - MODE
      ?auto_5497699 - DIRECTION
      ?auto_5497700 - MODE
    )
    :vars
    (
      ?auto_5497704 - INSTRUMENT
      ?auto_5497702 - SATELLITE
      ?auto_5497703 - DIRECTION
      ?auto_5497701 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5497696 ?auto_5497694 ) ) ( not ( = ?auto_5497698 ?auto_5497694 ) ) ( not ( = ?auto_5497698 ?auto_5497696 ) ) ( not ( = ?auto_5497699 ?auto_5497694 ) ) ( not ( = ?auto_5497699 ?auto_5497696 ) ) ( not ( = ?auto_5497699 ?auto_5497698 ) ) ( ON_BOARD ?auto_5497704 ?auto_5497702 ) ( SUPPORTS ?auto_5497704 ?auto_5497700 ) ( not ( = ?auto_5497699 ?auto_5497703 ) ) ( HAVE_IMAGE ?auto_5497694 ?auto_5497695 ) ( not ( = ?auto_5497694 ?auto_5497703 ) ) ( not ( = ?auto_5497695 ?auto_5497700 ) ) ( CALIBRATION_TARGET ?auto_5497704 ?auto_5497703 ) ( not ( = ?auto_5497703 ?auto_5497696 ) ) ( ON_BOARD ?auto_5497701 ?auto_5497702 ) ( POWER_ON ?auto_5497701 ) ( not ( = ?auto_5497704 ?auto_5497701 ) ) ( POINTING ?auto_5497702 ?auto_5497703 ) ( HAVE_IMAGE ?auto_5497696 ?auto_5497693 ) ( HAVE_IMAGE ?auto_5497698 ?auto_5497697 ) ( not ( = ?auto_5497695 ?auto_5497693 ) ) ( not ( = ?auto_5497695 ?auto_5497697 ) ) ( not ( = ?auto_5497693 ?auto_5497697 ) ) ( not ( = ?auto_5497693 ?auto_5497700 ) ) ( not ( = ?auto_5497698 ?auto_5497703 ) ) ( not ( = ?auto_5497697 ?auto_5497700 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5497694 ?auto_5497695 ?auto_5497699 ?auto_5497700 )
      ( GET-4IMAGE-VERIFY ?auto_5497694 ?auto_5497695 ?auto_5497696 ?auto_5497693 ?auto_5497698 ?auto_5497697 ?auto_5497699 ?auto_5497700 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5497742 - DIRECTION
      ?auto_5497743 - MODE
      ?auto_5497744 - DIRECTION
      ?auto_5497741 - MODE
      ?auto_5497746 - DIRECTION
      ?auto_5497745 - MODE
      ?auto_5497747 - DIRECTION
      ?auto_5497748 - MODE
    )
    :vars
    (
      ?auto_5497752 - INSTRUMENT
      ?auto_5497750 - SATELLITE
      ?auto_5497751 - DIRECTION
      ?auto_5497749 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5497744 ?auto_5497742 ) ) ( not ( = ?auto_5497746 ?auto_5497742 ) ) ( not ( = ?auto_5497746 ?auto_5497744 ) ) ( not ( = ?auto_5497747 ?auto_5497742 ) ) ( not ( = ?auto_5497747 ?auto_5497744 ) ) ( not ( = ?auto_5497747 ?auto_5497746 ) ) ( ON_BOARD ?auto_5497752 ?auto_5497750 ) ( SUPPORTS ?auto_5497752 ?auto_5497745 ) ( not ( = ?auto_5497746 ?auto_5497751 ) ) ( HAVE_IMAGE ?auto_5497742 ?auto_5497743 ) ( not ( = ?auto_5497742 ?auto_5497751 ) ) ( not ( = ?auto_5497743 ?auto_5497745 ) ) ( CALIBRATION_TARGET ?auto_5497752 ?auto_5497751 ) ( not ( = ?auto_5497751 ?auto_5497744 ) ) ( ON_BOARD ?auto_5497749 ?auto_5497750 ) ( POWER_ON ?auto_5497749 ) ( not ( = ?auto_5497752 ?auto_5497749 ) ) ( POINTING ?auto_5497750 ?auto_5497751 ) ( HAVE_IMAGE ?auto_5497744 ?auto_5497741 ) ( HAVE_IMAGE ?auto_5497747 ?auto_5497748 ) ( not ( = ?auto_5497743 ?auto_5497741 ) ) ( not ( = ?auto_5497743 ?auto_5497748 ) ) ( not ( = ?auto_5497741 ?auto_5497745 ) ) ( not ( = ?auto_5497741 ?auto_5497748 ) ) ( not ( = ?auto_5497745 ?auto_5497748 ) ) ( not ( = ?auto_5497747 ?auto_5497751 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5497742 ?auto_5497743 ?auto_5497746 ?auto_5497745 )
      ( GET-4IMAGE-VERIFY ?auto_5497742 ?auto_5497743 ?auto_5497744 ?auto_5497741 ?auto_5497746 ?auto_5497745 ?auto_5497747 ?auto_5497748 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5498088 - DIRECTION
      ?auto_5498089 - MODE
      ?auto_5498090 - DIRECTION
      ?auto_5498087 - MODE
      ?auto_5498092 - DIRECTION
      ?auto_5498091 - MODE
      ?auto_5498093 - DIRECTION
      ?auto_5498094 - MODE
    )
    :vars
    (
      ?auto_5498098 - INSTRUMENT
      ?auto_5498096 - SATELLITE
      ?auto_5498097 - DIRECTION
      ?auto_5498095 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5498090 ?auto_5498088 ) ) ( not ( = ?auto_5498092 ?auto_5498088 ) ) ( not ( = ?auto_5498092 ?auto_5498090 ) ) ( not ( = ?auto_5498093 ?auto_5498088 ) ) ( not ( = ?auto_5498093 ?auto_5498090 ) ) ( not ( = ?auto_5498093 ?auto_5498092 ) ) ( ON_BOARD ?auto_5498098 ?auto_5498096 ) ( SUPPORTS ?auto_5498098 ?auto_5498087 ) ( not ( = ?auto_5498090 ?auto_5498097 ) ) ( HAVE_IMAGE ?auto_5498088 ?auto_5498089 ) ( not ( = ?auto_5498088 ?auto_5498097 ) ) ( not ( = ?auto_5498089 ?auto_5498087 ) ) ( CALIBRATION_TARGET ?auto_5498098 ?auto_5498097 ) ( not ( = ?auto_5498097 ?auto_5498092 ) ) ( ON_BOARD ?auto_5498095 ?auto_5498096 ) ( POWER_ON ?auto_5498095 ) ( not ( = ?auto_5498098 ?auto_5498095 ) ) ( POINTING ?auto_5498096 ?auto_5498097 ) ( HAVE_IMAGE ?auto_5498092 ?auto_5498091 ) ( HAVE_IMAGE ?auto_5498093 ?auto_5498094 ) ( not ( = ?auto_5498089 ?auto_5498091 ) ) ( not ( = ?auto_5498089 ?auto_5498094 ) ) ( not ( = ?auto_5498087 ?auto_5498091 ) ) ( not ( = ?auto_5498087 ?auto_5498094 ) ) ( not ( = ?auto_5498091 ?auto_5498094 ) ) ( not ( = ?auto_5498093 ?auto_5498097 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5498088 ?auto_5498089 ?auto_5498090 ?auto_5498087 )
      ( GET-4IMAGE-VERIFY ?auto_5498088 ?auto_5498089 ?auto_5498090 ?auto_5498087 ?auto_5498092 ?auto_5498091 ?auto_5498093 ?auto_5498094 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5460950 - DIRECTION
      ?auto_5460951 - MODE
      ?auto_5460952 - DIRECTION
      ?auto_5460949 - MODE
      ?auto_5460954 - DIRECTION
      ?auto_5460953 - MODE
      ?auto_5460955 - DIRECTION
      ?auto_5460956 - MODE
    )
    :vars
    (
      ?auto_5460958 - INSTRUMENT
      ?auto_5460959 - SATELLITE
      ?auto_5460960 - DIRECTION
      ?auto_5460961 - DIRECTION
      ?auto_5460957 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5460952 ?auto_5460950 ) ) ( not ( = ?auto_5460954 ?auto_5460950 ) ) ( not ( = ?auto_5460954 ?auto_5460952 ) ) ( not ( = ?auto_5460955 ?auto_5460950 ) ) ( not ( = ?auto_5460955 ?auto_5460952 ) ) ( not ( = ?auto_5460955 ?auto_5460954 ) ) ( ON_BOARD ?auto_5460958 ?auto_5460959 ) ( SUPPORTS ?auto_5460958 ?auto_5460956 ) ( not ( = ?auto_5460955 ?auto_5460960 ) ) ( HAVE_IMAGE ?auto_5460952 ?auto_5460949 ) ( not ( = ?auto_5460952 ?auto_5460960 ) ) ( not ( = ?auto_5460949 ?auto_5460956 ) ) ( CALIBRATION_TARGET ?auto_5460958 ?auto_5460960 ) ( not ( = ?auto_5460960 ?auto_5460961 ) ) ( not ( = ?auto_5460955 ?auto_5460961 ) ) ( not ( = ?auto_5460952 ?auto_5460961 ) ) ( ON_BOARD ?auto_5460957 ?auto_5460959 ) ( POWER_ON ?auto_5460957 ) ( not ( = ?auto_5460958 ?auto_5460957 ) ) ( POINTING ?auto_5460959 ?auto_5460960 ) ( HAVE_IMAGE ?auto_5460950 ?auto_5460951 ) ( HAVE_IMAGE ?auto_5460954 ?auto_5460953 ) ( not ( = ?auto_5460950 ?auto_5460960 ) ) ( not ( = ?auto_5460950 ?auto_5460961 ) ) ( not ( = ?auto_5460951 ?auto_5460949 ) ) ( not ( = ?auto_5460951 ?auto_5460953 ) ) ( not ( = ?auto_5460951 ?auto_5460956 ) ) ( not ( = ?auto_5460949 ?auto_5460953 ) ) ( not ( = ?auto_5460954 ?auto_5460960 ) ) ( not ( = ?auto_5460954 ?auto_5460961 ) ) ( not ( = ?auto_5460953 ?auto_5460956 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5460952 ?auto_5460949 ?auto_5460955 ?auto_5460956 )
      ( GET-4IMAGE-VERIFY ?auto_5460950 ?auto_5460951 ?auto_5460952 ?auto_5460949 ?auto_5460954 ?auto_5460953 ?auto_5460955 ?auto_5460956 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5461001 - DIRECTION
      ?auto_5461002 - MODE
      ?auto_5461003 - DIRECTION
      ?auto_5461000 - MODE
      ?auto_5461005 - DIRECTION
      ?auto_5461004 - MODE
      ?auto_5461006 - DIRECTION
      ?auto_5461007 - MODE
    )
    :vars
    (
      ?auto_5461009 - INSTRUMENT
      ?auto_5461010 - SATELLITE
      ?auto_5461011 - DIRECTION
      ?auto_5461012 - DIRECTION
      ?auto_5461008 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5461003 ?auto_5461001 ) ) ( not ( = ?auto_5461005 ?auto_5461001 ) ) ( not ( = ?auto_5461005 ?auto_5461003 ) ) ( not ( = ?auto_5461006 ?auto_5461001 ) ) ( not ( = ?auto_5461006 ?auto_5461003 ) ) ( not ( = ?auto_5461006 ?auto_5461005 ) ) ( ON_BOARD ?auto_5461009 ?auto_5461010 ) ( SUPPORTS ?auto_5461009 ?auto_5461004 ) ( not ( = ?auto_5461005 ?auto_5461011 ) ) ( HAVE_IMAGE ?auto_5461003 ?auto_5461000 ) ( not ( = ?auto_5461003 ?auto_5461011 ) ) ( not ( = ?auto_5461000 ?auto_5461004 ) ) ( CALIBRATION_TARGET ?auto_5461009 ?auto_5461011 ) ( not ( = ?auto_5461011 ?auto_5461012 ) ) ( not ( = ?auto_5461005 ?auto_5461012 ) ) ( not ( = ?auto_5461003 ?auto_5461012 ) ) ( ON_BOARD ?auto_5461008 ?auto_5461010 ) ( POWER_ON ?auto_5461008 ) ( not ( = ?auto_5461009 ?auto_5461008 ) ) ( POINTING ?auto_5461010 ?auto_5461011 ) ( HAVE_IMAGE ?auto_5461001 ?auto_5461002 ) ( HAVE_IMAGE ?auto_5461006 ?auto_5461007 ) ( not ( = ?auto_5461001 ?auto_5461011 ) ) ( not ( = ?auto_5461001 ?auto_5461012 ) ) ( not ( = ?auto_5461002 ?auto_5461000 ) ) ( not ( = ?auto_5461002 ?auto_5461004 ) ) ( not ( = ?auto_5461002 ?auto_5461007 ) ) ( not ( = ?auto_5461000 ?auto_5461007 ) ) ( not ( = ?auto_5461004 ?auto_5461007 ) ) ( not ( = ?auto_5461006 ?auto_5461011 ) ) ( not ( = ?auto_5461006 ?auto_5461012 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5461003 ?auto_5461000 ?auto_5461005 ?auto_5461004 )
      ( GET-4IMAGE-VERIFY ?auto_5461001 ?auto_5461002 ?auto_5461003 ?auto_5461000 ?auto_5461005 ?auto_5461004 ?auto_5461006 ?auto_5461007 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5461168 - DIRECTION
      ?auto_5461169 - MODE
      ?auto_5461170 - DIRECTION
      ?auto_5461167 - MODE
      ?auto_5461172 - DIRECTION
      ?auto_5461171 - MODE
      ?auto_5461173 - DIRECTION
      ?auto_5461174 - MODE
    )
    :vars
    (
      ?auto_5461176 - INSTRUMENT
      ?auto_5461177 - SATELLITE
      ?auto_5461178 - DIRECTION
      ?auto_5461179 - DIRECTION
      ?auto_5461175 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5461170 ?auto_5461168 ) ) ( not ( = ?auto_5461172 ?auto_5461168 ) ) ( not ( = ?auto_5461172 ?auto_5461170 ) ) ( not ( = ?auto_5461173 ?auto_5461168 ) ) ( not ( = ?auto_5461173 ?auto_5461170 ) ) ( not ( = ?auto_5461173 ?auto_5461172 ) ) ( ON_BOARD ?auto_5461176 ?auto_5461177 ) ( SUPPORTS ?auto_5461176 ?auto_5461174 ) ( not ( = ?auto_5461173 ?auto_5461178 ) ) ( HAVE_IMAGE ?auto_5461172 ?auto_5461171 ) ( not ( = ?auto_5461172 ?auto_5461178 ) ) ( not ( = ?auto_5461171 ?auto_5461174 ) ) ( CALIBRATION_TARGET ?auto_5461176 ?auto_5461178 ) ( not ( = ?auto_5461178 ?auto_5461179 ) ) ( not ( = ?auto_5461173 ?auto_5461179 ) ) ( not ( = ?auto_5461172 ?auto_5461179 ) ) ( ON_BOARD ?auto_5461175 ?auto_5461177 ) ( POWER_ON ?auto_5461175 ) ( not ( = ?auto_5461176 ?auto_5461175 ) ) ( POINTING ?auto_5461177 ?auto_5461178 ) ( HAVE_IMAGE ?auto_5461168 ?auto_5461169 ) ( HAVE_IMAGE ?auto_5461170 ?auto_5461167 ) ( not ( = ?auto_5461168 ?auto_5461178 ) ) ( not ( = ?auto_5461168 ?auto_5461179 ) ) ( not ( = ?auto_5461169 ?auto_5461167 ) ) ( not ( = ?auto_5461169 ?auto_5461171 ) ) ( not ( = ?auto_5461169 ?auto_5461174 ) ) ( not ( = ?auto_5461170 ?auto_5461178 ) ) ( not ( = ?auto_5461170 ?auto_5461179 ) ) ( not ( = ?auto_5461167 ?auto_5461171 ) ) ( not ( = ?auto_5461167 ?auto_5461174 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5461172 ?auto_5461171 ?auto_5461173 ?auto_5461174 )
      ( GET-4IMAGE-VERIFY ?auto_5461168 ?auto_5461169 ?auto_5461170 ?auto_5461167 ?auto_5461172 ?auto_5461171 ?auto_5461173 ?auto_5461174 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5461225 - DIRECTION
      ?auto_5461226 - MODE
      ?auto_5461227 - DIRECTION
      ?auto_5461224 - MODE
      ?auto_5461229 - DIRECTION
      ?auto_5461228 - MODE
      ?auto_5461230 - DIRECTION
      ?auto_5461231 - MODE
    )
    :vars
    (
      ?auto_5461233 - INSTRUMENT
      ?auto_5461234 - SATELLITE
      ?auto_5461235 - DIRECTION
      ?auto_5461236 - DIRECTION
      ?auto_5461232 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5461227 ?auto_5461225 ) ) ( not ( = ?auto_5461229 ?auto_5461225 ) ) ( not ( = ?auto_5461229 ?auto_5461227 ) ) ( not ( = ?auto_5461230 ?auto_5461225 ) ) ( not ( = ?auto_5461230 ?auto_5461227 ) ) ( not ( = ?auto_5461230 ?auto_5461229 ) ) ( ON_BOARD ?auto_5461233 ?auto_5461234 ) ( SUPPORTS ?auto_5461233 ?auto_5461228 ) ( not ( = ?auto_5461229 ?auto_5461235 ) ) ( HAVE_IMAGE ?auto_5461230 ?auto_5461231 ) ( not ( = ?auto_5461230 ?auto_5461235 ) ) ( not ( = ?auto_5461231 ?auto_5461228 ) ) ( CALIBRATION_TARGET ?auto_5461233 ?auto_5461235 ) ( not ( = ?auto_5461235 ?auto_5461236 ) ) ( not ( = ?auto_5461229 ?auto_5461236 ) ) ( not ( = ?auto_5461230 ?auto_5461236 ) ) ( ON_BOARD ?auto_5461232 ?auto_5461234 ) ( POWER_ON ?auto_5461232 ) ( not ( = ?auto_5461233 ?auto_5461232 ) ) ( POINTING ?auto_5461234 ?auto_5461235 ) ( HAVE_IMAGE ?auto_5461225 ?auto_5461226 ) ( HAVE_IMAGE ?auto_5461227 ?auto_5461224 ) ( not ( = ?auto_5461225 ?auto_5461235 ) ) ( not ( = ?auto_5461225 ?auto_5461236 ) ) ( not ( = ?auto_5461226 ?auto_5461224 ) ) ( not ( = ?auto_5461226 ?auto_5461228 ) ) ( not ( = ?auto_5461226 ?auto_5461231 ) ) ( not ( = ?auto_5461227 ?auto_5461235 ) ) ( not ( = ?auto_5461227 ?auto_5461236 ) ) ( not ( = ?auto_5461224 ?auto_5461228 ) ) ( not ( = ?auto_5461224 ?auto_5461231 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5461230 ?auto_5461231 ?auto_5461229 ?auto_5461228 )
      ( GET-4IMAGE-VERIFY ?auto_5461225 ?auto_5461226 ?auto_5461227 ?auto_5461224 ?auto_5461229 ?auto_5461228 ?auto_5461230 ?auto_5461231 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5461445 - DIRECTION
      ?auto_5461446 - MODE
      ?auto_5461447 - DIRECTION
      ?auto_5461444 - MODE
      ?auto_5461449 - DIRECTION
      ?auto_5461448 - MODE
      ?auto_5461450 - DIRECTION
      ?auto_5461451 - MODE
    )
    :vars
    (
      ?auto_5461453 - INSTRUMENT
      ?auto_5461454 - SATELLITE
      ?auto_5461455 - DIRECTION
      ?auto_5461456 - DIRECTION
      ?auto_5461452 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5461447 ?auto_5461445 ) ) ( not ( = ?auto_5461449 ?auto_5461445 ) ) ( not ( = ?auto_5461449 ?auto_5461447 ) ) ( not ( = ?auto_5461450 ?auto_5461445 ) ) ( not ( = ?auto_5461450 ?auto_5461447 ) ) ( not ( = ?auto_5461450 ?auto_5461449 ) ) ( ON_BOARD ?auto_5461453 ?auto_5461454 ) ( SUPPORTS ?auto_5461453 ?auto_5461444 ) ( not ( = ?auto_5461447 ?auto_5461455 ) ) ( HAVE_IMAGE ?auto_5461449 ?auto_5461448 ) ( not ( = ?auto_5461449 ?auto_5461455 ) ) ( not ( = ?auto_5461448 ?auto_5461444 ) ) ( CALIBRATION_TARGET ?auto_5461453 ?auto_5461455 ) ( not ( = ?auto_5461455 ?auto_5461456 ) ) ( not ( = ?auto_5461447 ?auto_5461456 ) ) ( not ( = ?auto_5461449 ?auto_5461456 ) ) ( ON_BOARD ?auto_5461452 ?auto_5461454 ) ( POWER_ON ?auto_5461452 ) ( not ( = ?auto_5461453 ?auto_5461452 ) ) ( POINTING ?auto_5461454 ?auto_5461455 ) ( HAVE_IMAGE ?auto_5461445 ?auto_5461446 ) ( HAVE_IMAGE ?auto_5461450 ?auto_5461451 ) ( not ( = ?auto_5461445 ?auto_5461455 ) ) ( not ( = ?auto_5461445 ?auto_5461456 ) ) ( not ( = ?auto_5461446 ?auto_5461444 ) ) ( not ( = ?auto_5461446 ?auto_5461448 ) ) ( not ( = ?auto_5461446 ?auto_5461451 ) ) ( not ( = ?auto_5461444 ?auto_5461451 ) ) ( not ( = ?auto_5461448 ?auto_5461451 ) ) ( not ( = ?auto_5461450 ?auto_5461455 ) ) ( not ( = ?auto_5461450 ?auto_5461456 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5461449 ?auto_5461448 ?auto_5461447 ?auto_5461444 )
      ( GET-4IMAGE-VERIFY ?auto_5461445 ?auto_5461446 ?auto_5461447 ?auto_5461444 ?auto_5461449 ?auto_5461448 ?auto_5461450 ?auto_5461451 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5461555 - DIRECTION
      ?auto_5461556 - MODE
      ?auto_5461557 - DIRECTION
      ?auto_5461554 - MODE
      ?auto_5461559 - DIRECTION
      ?auto_5461558 - MODE
      ?auto_5461560 - DIRECTION
      ?auto_5461561 - MODE
    )
    :vars
    (
      ?auto_5461563 - INSTRUMENT
      ?auto_5461564 - SATELLITE
      ?auto_5461565 - DIRECTION
      ?auto_5461566 - DIRECTION
      ?auto_5461562 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5461557 ?auto_5461555 ) ) ( not ( = ?auto_5461559 ?auto_5461555 ) ) ( not ( = ?auto_5461559 ?auto_5461557 ) ) ( not ( = ?auto_5461560 ?auto_5461555 ) ) ( not ( = ?auto_5461560 ?auto_5461557 ) ) ( not ( = ?auto_5461560 ?auto_5461559 ) ) ( ON_BOARD ?auto_5461563 ?auto_5461564 ) ( SUPPORTS ?auto_5461563 ?auto_5461554 ) ( not ( = ?auto_5461557 ?auto_5461565 ) ) ( HAVE_IMAGE ?auto_5461560 ?auto_5461561 ) ( not ( = ?auto_5461560 ?auto_5461565 ) ) ( not ( = ?auto_5461561 ?auto_5461554 ) ) ( CALIBRATION_TARGET ?auto_5461563 ?auto_5461565 ) ( not ( = ?auto_5461565 ?auto_5461566 ) ) ( not ( = ?auto_5461557 ?auto_5461566 ) ) ( not ( = ?auto_5461560 ?auto_5461566 ) ) ( ON_BOARD ?auto_5461562 ?auto_5461564 ) ( POWER_ON ?auto_5461562 ) ( not ( = ?auto_5461563 ?auto_5461562 ) ) ( POINTING ?auto_5461564 ?auto_5461565 ) ( HAVE_IMAGE ?auto_5461555 ?auto_5461556 ) ( HAVE_IMAGE ?auto_5461559 ?auto_5461558 ) ( not ( = ?auto_5461555 ?auto_5461565 ) ) ( not ( = ?auto_5461555 ?auto_5461566 ) ) ( not ( = ?auto_5461556 ?auto_5461554 ) ) ( not ( = ?auto_5461556 ?auto_5461558 ) ) ( not ( = ?auto_5461556 ?auto_5461561 ) ) ( not ( = ?auto_5461554 ?auto_5461558 ) ) ( not ( = ?auto_5461559 ?auto_5461565 ) ) ( not ( = ?auto_5461559 ?auto_5461566 ) ) ( not ( = ?auto_5461558 ?auto_5461561 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5461560 ?auto_5461561 ?auto_5461557 ?auto_5461554 )
      ( GET-4IMAGE-VERIFY ?auto_5461555 ?auto_5461556 ?auto_5461557 ?auto_5461554 ?auto_5461559 ?auto_5461558 ?auto_5461560 ?auto_5461561 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5500844 - DIRECTION
      ?auto_5500845 - MODE
      ?auto_5500846 - DIRECTION
      ?auto_5500843 - MODE
      ?auto_5500848 - DIRECTION
      ?auto_5500847 - MODE
      ?auto_5500849 - DIRECTION
      ?auto_5500850 - MODE
    )
    :vars
    (
      ?auto_5500854 - INSTRUMENT
      ?auto_5500852 - SATELLITE
      ?auto_5500853 - DIRECTION
      ?auto_5500851 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5500846 ?auto_5500844 ) ) ( not ( = ?auto_5500848 ?auto_5500844 ) ) ( not ( = ?auto_5500848 ?auto_5500846 ) ) ( not ( = ?auto_5500849 ?auto_5500844 ) ) ( not ( = ?auto_5500849 ?auto_5500846 ) ) ( not ( = ?auto_5500849 ?auto_5500848 ) ) ( ON_BOARD ?auto_5500854 ?auto_5500852 ) ( SUPPORTS ?auto_5500854 ?auto_5500845 ) ( not ( = ?auto_5500844 ?auto_5500853 ) ) ( HAVE_IMAGE ?auto_5500846 ?auto_5500843 ) ( not ( = ?auto_5500846 ?auto_5500853 ) ) ( not ( = ?auto_5500843 ?auto_5500845 ) ) ( CALIBRATION_TARGET ?auto_5500854 ?auto_5500853 ) ( not ( = ?auto_5500853 ?auto_5500848 ) ) ( ON_BOARD ?auto_5500851 ?auto_5500852 ) ( POWER_ON ?auto_5500851 ) ( not ( = ?auto_5500854 ?auto_5500851 ) ) ( POINTING ?auto_5500852 ?auto_5500853 ) ( HAVE_IMAGE ?auto_5500848 ?auto_5500847 ) ( HAVE_IMAGE ?auto_5500849 ?auto_5500850 ) ( not ( = ?auto_5500845 ?auto_5500847 ) ) ( not ( = ?auto_5500845 ?auto_5500850 ) ) ( not ( = ?auto_5500843 ?auto_5500847 ) ) ( not ( = ?auto_5500843 ?auto_5500850 ) ) ( not ( = ?auto_5500847 ?auto_5500850 ) ) ( not ( = ?auto_5500849 ?auto_5500853 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5500846 ?auto_5500843 ?auto_5500844 ?auto_5500845 )
      ( GET-4IMAGE-VERIFY ?auto_5500844 ?auto_5500845 ?auto_5500846 ?auto_5500843 ?auto_5500848 ?auto_5500847 ?auto_5500849 ?auto_5500850 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5463758 - DIRECTION
      ?auto_5463759 - MODE
      ?auto_5463760 - DIRECTION
      ?auto_5463757 - MODE
      ?auto_5463762 - DIRECTION
      ?auto_5463761 - MODE
      ?auto_5463763 - DIRECTION
      ?auto_5463764 - MODE
    )
    :vars
    (
      ?auto_5463766 - INSTRUMENT
      ?auto_5463767 - SATELLITE
      ?auto_5463768 - DIRECTION
      ?auto_5463769 - DIRECTION
      ?auto_5463765 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5463760 ?auto_5463758 ) ) ( not ( = ?auto_5463762 ?auto_5463758 ) ) ( not ( = ?auto_5463762 ?auto_5463760 ) ) ( not ( = ?auto_5463763 ?auto_5463758 ) ) ( not ( = ?auto_5463763 ?auto_5463760 ) ) ( not ( = ?auto_5463763 ?auto_5463762 ) ) ( ON_BOARD ?auto_5463766 ?auto_5463767 ) ( SUPPORTS ?auto_5463766 ?auto_5463759 ) ( not ( = ?auto_5463758 ?auto_5463768 ) ) ( HAVE_IMAGE ?auto_5463762 ?auto_5463761 ) ( not ( = ?auto_5463762 ?auto_5463768 ) ) ( not ( = ?auto_5463761 ?auto_5463759 ) ) ( CALIBRATION_TARGET ?auto_5463766 ?auto_5463768 ) ( not ( = ?auto_5463768 ?auto_5463769 ) ) ( not ( = ?auto_5463758 ?auto_5463769 ) ) ( not ( = ?auto_5463762 ?auto_5463769 ) ) ( ON_BOARD ?auto_5463765 ?auto_5463767 ) ( POWER_ON ?auto_5463765 ) ( not ( = ?auto_5463766 ?auto_5463765 ) ) ( POINTING ?auto_5463767 ?auto_5463768 ) ( HAVE_IMAGE ?auto_5463760 ?auto_5463757 ) ( HAVE_IMAGE ?auto_5463763 ?auto_5463764 ) ( not ( = ?auto_5463759 ?auto_5463757 ) ) ( not ( = ?auto_5463759 ?auto_5463764 ) ) ( not ( = ?auto_5463760 ?auto_5463768 ) ) ( not ( = ?auto_5463760 ?auto_5463769 ) ) ( not ( = ?auto_5463757 ?auto_5463761 ) ) ( not ( = ?auto_5463757 ?auto_5463764 ) ) ( not ( = ?auto_5463761 ?auto_5463764 ) ) ( not ( = ?auto_5463763 ?auto_5463768 ) ) ( not ( = ?auto_5463763 ?auto_5463769 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5463762 ?auto_5463761 ?auto_5463758 ?auto_5463759 )
      ( GET-4IMAGE-VERIFY ?auto_5463758 ?auto_5463759 ?auto_5463760 ?auto_5463757 ?auto_5463762 ?auto_5463761 ?auto_5463763 ?auto_5463764 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5463868 - DIRECTION
      ?auto_5463869 - MODE
      ?auto_5463870 - DIRECTION
      ?auto_5463867 - MODE
      ?auto_5463872 - DIRECTION
      ?auto_5463871 - MODE
      ?auto_5463873 - DIRECTION
      ?auto_5463874 - MODE
    )
    :vars
    (
      ?auto_5463876 - INSTRUMENT
      ?auto_5463877 - SATELLITE
      ?auto_5463878 - DIRECTION
      ?auto_5463879 - DIRECTION
      ?auto_5463875 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5463870 ?auto_5463868 ) ) ( not ( = ?auto_5463872 ?auto_5463868 ) ) ( not ( = ?auto_5463872 ?auto_5463870 ) ) ( not ( = ?auto_5463873 ?auto_5463868 ) ) ( not ( = ?auto_5463873 ?auto_5463870 ) ) ( not ( = ?auto_5463873 ?auto_5463872 ) ) ( ON_BOARD ?auto_5463876 ?auto_5463877 ) ( SUPPORTS ?auto_5463876 ?auto_5463869 ) ( not ( = ?auto_5463868 ?auto_5463878 ) ) ( HAVE_IMAGE ?auto_5463873 ?auto_5463874 ) ( not ( = ?auto_5463873 ?auto_5463878 ) ) ( not ( = ?auto_5463874 ?auto_5463869 ) ) ( CALIBRATION_TARGET ?auto_5463876 ?auto_5463878 ) ( not ( = ?auto_5463878 ?auto_5463879 ) ) ( not ( = ?auto_5463868 ?auto_5463879 ) ) ( not ( = ?auto_5463873 ?auto_5463879 ) ) ( ON_BOARD ?auto_5463875 ?auto_5463877 ) ( POWER_ON ?auto_5463875 ) ( not ( = ?auto_5463876 ?auto_5463875 ) ) ( POINTING ?auto_5463877 ?auto_5463878 ) ( HAVE_IMAGE ?auto_5463870 ?auto_5463867 ) ( HAVE_IMAGE ?auto_5463872 ?auto_5463871 ) ( not ( = ?auto_5463869 ?auto_5463867 ) ) ( not ( = ?auto_5463869 ?auto_5463871 ) ) ( not ( = ?auto_5463870 ?auto_5463878 ) ) ( not ( = ?auto_5463870 ?auto_5463879 ) ) ( not ( = ?auto_5463867 ?auto_5463871 ) ) ( not ( = ?auto_5463867 ?auto_5463874 ) ) ( not ( = ?auto_5463872 ?auto_5463878 ) ) ( not ( = ?auto_5463872 ?auto_5463879 ) ) ( not ( = ?auto_5463871 ?auto_5463874 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5463873 ?auto_5463874 ?auto_5463868 ?auto_5463869 )
      ( GET-4IMAGE-VERIFY ?auto_5463868 ?auto_5463869 ?auto_5463870 ?auto_5463867 ?auto_5463872 ?auto_5463871 ?auto_5463873 ?auto_5463874 ) )
  )

)

