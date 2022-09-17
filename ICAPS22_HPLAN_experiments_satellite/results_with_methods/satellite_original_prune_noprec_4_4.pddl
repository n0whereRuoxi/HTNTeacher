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
      ?auto_356538 - DIRECTION
      ?auto_356539 - MODE
    )
    :vars
    (
      ?auto_356540 - INSTRUMENT
      ?auto_356541 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_356540 ) ( ON_BOARD ?auto_356540 ?auto_356541 ) ( SUPPORTS ?auto_356540 ?auto_356539 ) ( POWER_ON ?auto_356540 ) ( POINTING ?auto_356541 ?auto_356538 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_356541 ?auto_356538 ?auto_356540 ?auto_356539 )
      ( GET-1IMAGE-VERIFY ?auto_356538 ?auto_356539 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_356566 - DIRECTION
      ?auto_356567 - MODE
    )
    :vars
    (
      ?auto_356568 - INSTRUMENT
      ?auto_356569 - SATELLITE
      ?auto_356570 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_356568 ) ( ON_BOARD ?auto_356568 ?auto_356569 ) ( SUPPORTS ?auto_356568 ?auto_356567 ) ( POWER_ON ?auto_356568 ) ( POINTING ?auto_356569 ?auto_356570 ) ( not ( = ?auto_356566 ?auto_356570 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_356569 ?auto_356566 ?auto_356570 )
      ( GET-1IMAGE ?auto_356566 ?auto_356567 )
      ( GET-1IMAGE-VERIFY ?auto_356566 ?auto_356567 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_356598 - DIRECTION
      ?auto_356599 - MODE
    )
    :vars
    (
      ?auto_356601 - INSTRUMENT
      ?auto_356600 - SATELLITE
      ?auto_356602 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_356601 ?auto_356600 ) ( SUPPORTS ?auto_356601 ?auto_356599 ) ( POWER_ON ?auto_356601 ) ( POINTING ?auto_356600 ?auto_356602 ) ( not ( = ?auto_356598 ?auto_356602 ) ) ( CALIBRATION_TARGET ?auto_356601 ?auto_356602 ) ( NOT_CALIBRATED ?auto_356601 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_356600 ?auto_356601 ?auto_356602 )
      ( GET-1IMAGE ?auto_356598 ?auto_356599 )
      ( GET-1IMAGE-VERIFY ?auto_356598 ?auto_356599 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_356630 - DIRECTION
      ?auto_356631 - MODE
    )
    :vars
    (
      ?auto_356634 - INSTRUMENT
      ?auto_356632 - SATELLITE
      ?auto_356633 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_356634 ?auto_356632 ) ( SUPPORTS ?auto_356634 ?auto_356631 ) ( POINTING ?auto_356632 ?auto_356633 ) ( not ( = ?auto_356630 ?auto_356633 ) ) ( CALIBRATION_TARGET ?auto_356634 ?auto_356633 ) ( POWER_AVAIL ?auto_356632 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_356634 ?auto_356632 )
      ( GET-1IMAGE ?auto_356630 ?auto_356631 )
      ( GET-1IMAGE-VERIFY ?auto_356630 ?auto_356631 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_356662 - DIRECTION
      ?auto_356663 - MODE
    )
    :vars
    (
      ?auto_356665 - INSTRUMENT
      ?auto_356666 - SATELLITE
      ?auto_356664 - DIRECTION
      ?auto_356667 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_356665 ?auto_356666 ) ( SUPPORTS ?auto_356665 ?auto_356663 ) ( not ( = ?auto_356662 ?auto_356664 ) ) ( CALIBRATION_TARGET ?auto_356665 ?auto_356664 ) ( POWER_AVAIL ?auto_356666 ) ( POINTING ?auto_356666 ?auto_356667 ) ( not ( = ?auto_356664 ?auto_356667 ) ) ( not ( = ?auto_356662 ?auto_356667 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_356666 ?auto_356664 ?auto_356667 )
      ( GET-1IMAGE ?auto_356662 ?auto_356663 )
      ( GET-1IMAGE-VERIFY ?auto_356662 ?auto_356663 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_356879 - DIRECTION
      ?auto_356880 - MODE
      ?auto_356881 - DIRECTION
      ?auto_356878 - MODE
    )
    :vars
    (
      ?auto_356882 - INSTRUMENT
      ?auto_356883 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_356882 ) ( ON_BOARD ?auto_356882 ?auto_356883 ) ( SUPPORTS ?auto_356882 ?auto_356878 ) ( POWER_ON ?auto_356882 ) ( POINTING ?auto_356883 ?auto_356881 ) ( HAVE_IMAGE ?auto_356879 ?auto_356880 ) ( not ( = ?auto_356879 ?auto_356881 ) ) ( not ( = ?auto_356880 ?auto_356878 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_356881 ?auto_356878 )
      ( GET-2IMAGE-VERIFY ?auto_356879 ?auto_356880 ?auto_356881 ?auto_356878 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_356885 - DIRECTION
      ?auto_356886 - MODE
      ?auto_356887 - DIRECTION
      ?auto_356884 - MODE
    )
    :vars
    (
      ?auto_356888 - INSTRUMENT
      ?auto_356889 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_356888 ) ( ON_BOARD ?auto_356888 ?auto_356889 ) ( SUPPORTS ?auto_356888 ?auto_356886 ) ( POWER_ON ?auto_356888 ) ( POINTING ?auto_356889 ?auto_356885 ) ( HAVE_IMAGE ?auto_356887 ?auto_356884 ) ( not ( = ?auto_356885 ?auto_356887 ) ) ( not ( = ?auto_356886 ?auto_356884 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_356885 ?auto_356886 )
      ( GET-2IMAGE-VERIFY ?auto_356885 ?auto_356886 ?auto_356887 ?auto_356884 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_356897 - DIRECTION
      ?auto_356898 - MODE
      ?auto_356899 - DIRECTION
      ?auto_356896 - MODE
      ?auto_356900 - DIRECTION
      ?auto_356901 - MODE
    )
    :vars
    (
      ?auto_356902 - INSTRUMENT
      ?auto_356903 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_356902 ) ( ON_BOARD ?auto_356902 ?auto_356903 ) ( SUPPORTS ?auto_356902 ?auto_356901 ) ( POWER_ON ?auto_356902 ) ( POINTING ?auto_356903 ?auto_356900 ) ( HAVE_IMAGE ?auto_356897 ?auto_356898 ) ( HAVE_IMAGE ?auto_356899 ?auto_356896 ) ( not ( = ?auto_356897 ?auto_356899 ) ) ( not ( = ?auto_356897 ?auto_356900 ) ) ( not ( = ?auto_356898 ?auto_356896 ) ) ( not ( = ?auto_356898 ?auto_356901 ) ) ( not ( = ?auto_356899 ?auto_356900 ) ) ( not ( = ?auto_356896 ?auto_356901 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_356900 ?auto_356901 )
      ( GET-3IMAGE-VERIFY ?auto_356897 ?auto_356898 ?auto_356899 ?auto_356896 ?auto_356900 ?auto_356901 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_356905 - DIRECTION
      ?auto_356906 - MODE
      ?auto_356907 - DIRECTION
      ?auto_356904 - MODE
      ?auto_356908 - DIRECTION
      ?auto_356909 - MODE
    )
    :vars
    (
      ?auto_356910 - INSTRUMENT
      ?auto_356911 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_356910 ) ( ON_BOARD ?auto_356910 ?auto_356911 ) ( SUPPORTS ?auto_356910 ?auto_356904 ) ( POWER_ON ?auto_356910 ) ( POINTING ?auto_356911 ?auto_356907 ) ( HAVE_IMAGE ?auto_356905 ?auto_356906 ) ( HAVE_IMAGE ?auto_356908 ?auto_356909 ) ( not ( = ?auto_356905 ?auto_356907 ) ) ( not ( = ?auto_356905 ?auto_356908 ) ) ( not ( = ?auto_356906 ?auto_356904 ) ) ( not ( = ?auto_356906 ?auto_356909 ) ) ( not ( = ?auto_356907 ?auto_356908 ) ) ( not ( = ?auto_356904 ?auto_356909 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_356907 ?auto_356904 )
      ( GET-3IMAGE-VERIFY ?auto_356905 ?auto_356906 ?auto_356907 ?auto_356904 ?auto_356908 ?auto_356909 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_356921 - DIRECTION
      ?auto_356922 - MODE
      ?auto_356923 - DIRECTION
      ?auto_356920 - MODE
      ?auto_356924 - DIRECTION
      ?auto_356925 - MODE
    )
    :vars
    (
      ?auto_356926 - INSTRUMENT
      ?auto_356927 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_356926 ) ( ON_BOARD ?auto_356926 ?auto_356927 ) ( SUPPORTS ?auto_356926 ?auto_356922 ) ( POWER_ON ?auto_356926 ) ( POINTING ?auto_356927 ?auto_356921 ) ( HAVE_IMAGE ?auto_356923 ?auto_356920 ) ( HAVE_IMAGE ?auto_356924 ?auto_356925 ) ( not ( = ?auto_356921 ?auto_356923 ) ) ( not ( = ?auto_356921 ?auto_356924 ) ) ( not ( = ?auto_356922 ?auto_356920 ) ) ( not ( = ?auto_356922 ?auto_356925 ) ) ( not ( = ?auto_356923 ?auto_356924 ) ) ( not ( = ?auto_356920 ?auto_356925 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_356921 ?auto_356922 )
      ( GET-3IMAGE-VERIFY ?auto_356921 ?auto_356922 ?auto_356923 ?auto_356920 ?auto_356924 ?auto_356925 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_356953 - DIRECTION
      ?auto_356954 - MODE
      ?auto_356955 - DIRECTION
      ?auto_356952 - MODE
      ?auto_356956 - DIRECTION
      ?auto_356957 - MODE
      ?auto_356958 - DIRECTION
      ?auto_356959 - MODE
    )
    :vars
    (
      ?auto_356960 - INSTRUMENT
      ?auto_356961 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_356960 ) ( ON_BOARD ?auto_356960 ?auto_356961 ) ( SUPPORTS ?auto_356960 ?auto_356959 ) ( POWER_ON ?auto_356960 ) ( POINTING ?auto_356961 ?auto_356958 ) ( HAVE_IMAGE ?auto_356953 ?auto_356954 ) ( HAVE_IMAGE ?auto_356955 ?auto_356952 ) ( HAVE_IMAGE ?auto_356956 ?auto_356957 ) ( not ( = ?auto_356953 ?auto_356955 ) ) ( not ( = ?auto_356953 ?auto_356956 ) ) ( not ( = ?auto_356953 ?auto_356958 ) ) ( not ( = ?auto_356954 ?auto_356952 ) ) ( not ( = ?auto_356954 ?auto_356957 ) ) ( not ( = ?auto_356954 ?auto_356959 ) ) ( not ( = ?auto_356955 ?auto_356956 ) ) ( not ( = ?auto_356955 ?auto_356958 ) ) ( not ( = ?auto_356952 ?auto_356957 ) ) ( not ( = ?auto_356952 ?auto_356959 ) ) ( not ( = ?auto_356956 ?auto_356958 ) ) ( not ( = ?auto_356957 ?auto_356959 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_356958 ?auto_356959 )
      ( GET-4IMAGE-VERIFY ?auto_356953 ?auto_356954 ?auto_356955 ?auto_356952 ?auto_356956 ?auto_356957 ?auto_356958 ?auto_356959 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_356963 - DIRECTION
      ?auto_356964 - MODE
      ?auto_356965 - DIRECTION
      ?auto_356962 - MODE
      ?auto_356966 - DIRECTION
      ?auto_356967 - MODE
      ?auto_356968 - DIRECTION
      ?auto_356969 - MODE
    )
    :vars
    (
      ?auto_356970 - INSTRUMENT
      ?auto_356971 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_356970 ) ( ON_BOARD ?auto_356970 ?auto_356971 ) ( SUPPORTS ?auto_356970 ?auto_356967 ) ( POWER_ON ?auto_356970 ) ( POINTING ?auto_356971 ?auto_356966 ) ( HAVE_IMAGE ?auto_356963 ?auto_356964 ) ( HAVE_IMAGE ?auto_356965 ?auto_356962 ) ( HAVE_IMAGE ?auto_356968 ?auto_356969 ) ( not ( = ?auto_356963 ?auto_356965 ) ) ( not ( = ?auto_356963 ?auto_356966 ) ) ( not ( = ?auto_356963 ?auto_356968 ) ) ( not ( = ?auto_356964 ?auto_356962 ) ) ( not ( = ?auto_356964 ?auto_356967 ) ) ( not ( = ?auto_356964 ?auto_356969 ) ) ( not ( = ?auto_356965 ?auto_356966 ) ) ( not ( = ?auto_356965 ?auto_356968 ) ) ( not ( = ?auto_356962 ?auto_356967 ) ) ( not ( = ?auto_356962 ?auto_356969 ) ) ( not ( = ?auto_356966 ?auto_356968 ) ) ( not ( = ?auto_356967 ?auto_356969 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_356966 ?auto_356967 )
      ( GET-4IMAGE-VERIFY ?auto_356963 ?auto_356964 ?auto_356965 ?auto_356962 ?auto_356966 ?auto_356967 ?auto_356968 ?auto_356969 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_356983 - DIRECTION
      ?auto_356984 - MODE
      ?auto_356985 - DIRECTION
      ?auto_356982 - MODE
      ?auto_356986 - DIRECTION
      ?auto_356987 - MODE
      ?auto_356988 - DIRECTION
      ?auto_356989 - MODE
    )
    :vars
    (
      ?auto_356990 - INSTRUMENT
      ?auto_356991 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_356990 ) ( ON_BOARD ?auto_356990 ?auto_356991 ) ( SUPPORTS ?auto_356990 ?auto_356982 ) ( POWER_ON ?auto_356990 ) ( POINTING ?auto_356991 ?auto_356985 ) ( HAVE_IMAGE ?auto_356983 ?auto_356984 ) ( HAVE_IMAGE ?auto_356986 ?auto_356987 ) ( HAVE_IMAGE ?auto_356988 ?auto_356989 ) ( not ( = ?auto_356983 ?auto_356985 ) ) ( not ( = ?auto_356983 ?auto_356986 ) ) ( not ( = ?auto_356983 ?auto_356988 ) ) ( not ( = ?auto_356984 ?auto_356982 ) ) ( not ( = ?auto_356984 ?auto_356987 ) ) ( not ( = ?auto_356984 ?auto_356989 ) ) ( not ( = ?auto_356985 ?auto_356986 ) ) ( not ( = ?auto_356985 ?auto_356988 ) ) ( not ( = ?auto_356982 ?auto_356987 ) ) ( not ( = ?auto_356982 ?auto_356989 ) ) ( not ( = ?auto_356986 ?auto_356988 ) ) ( not ( = ?auto_356987 ?auto_356989 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_356985 ?auto_356982 )
      ( GET-4IMAGE-VERIFY ?auto_356983 ?auto_356984 ?auto_356985 ?auto_356982 ?auto_356986 ?auto_356987 ?auto_356988 ?auto_356989 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_357023 - DIRECTION
      ?auto_357024 - MODE
      ?auto_357025 - DIRECTION
      ?auto_357022 - MODE
      ?auto_357026 - DIRECTION
      ?auto_357027 - MODE
      ?auto_357028 - DIRECTION
      ?auto_357029 - MODE
    )
    :vars
    (
      ?auto_357030 - INSTRUMENT
      ?auto_357031 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_357030 ) ( ON_BOARD ?auto_357030 ?auto_357031 ) ( SUPPORTS ?auto_357030 ?auto_357024 ) ( POWER_ON ?auto_357030 ) ( POINTING ?auto_357031 ?auto_357023 ) ( HAVE_IMAGE ?auto_357025 ?auto_357022 ) ( HAVE_IMAGE ?auto_357026 ?auto_357027 ) ( HAVE_IMAGE ?auto_357028 ?auto_357029 ) ( not ( = ?auto_357023 ?auto_357025 ) ) ( not ( = ?auto_357023 ?auto_357026 ) ) ( not ( = ?auto_357023 ?auto_357028 ) ) ( not ( = ?auto_357024 ?auto_357022 ) ) ( not ( = ?auto_357024 ?auto_357027 ) ) ( not ( = ?auto_357024 ?auto_357029 ) ) ( not ( = ?auto_357025 ?auto_357026 ) ) ( not ( = ?auto_357025 ?auto_357028 ) ) ( not ( = ?auto_357022 ?auto_357027 ) ) ( not ( = ?auto_357022 ?auto_357029 ) ) ( not ( = ?auto_357026 ?auto_357028 ) ) ( not ( = ?auto_357027 ?auto_357029 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_357023 ?auto_357024 )
      ( GET-4IMAGE-VERIFY ?auto_357023 ?auto_357024 ?auto_357025 ?auto_357022 ?auto_357026 ?auto_357027 ?auto_357028 ?auto_357029 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_357108 - DIRECTION
      ?auto_357109 - MODE
      ?auto_357110 - DIRECTION
      ?auto_357107 - MODE
    )
    :vars
    (
      ?auto_357112 - INSTRUMENT
      ?auto_357113 - SATELLITE
      ?auto_357111 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_357112 ) ( ON_BOARD ?auto_357112 ?auto_357113 ) ( SUPPORTS ?auto_357112 ?auto_357107 ) ( POWER_ON ?auto_357112 ) ( POINTING ?auto_357113 ?auto_357111 ) ( not ( = ?auto_357110 ?auto_357111 ) ) ( HAVE_IMAGE ?auto_357108 ?auto_357109 ) ( not ( = ?auto_357108 ?auto_357110 ) ) ( not ( = ?auto_357108 ?auto_357111 ) ) ( not ( = ?auto_357109 ?auto_357107 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_357110 ?auto_357107 )
      ( GET-2IMAGE-VERIFY ?auto_357108 ?auto_357109 ?auto_357110 ?auto_357107 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_357115 - DIRECTION
      ?auto_357116 - MODE
      ?auto_357117 - DIRECTION
      ?auto_357114 - MODE
    )
    :vars
    (
      ?auto_357119 - INSTRUMENT
      ?auto_357120 - SATELLITE
      ?auto_357118 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_357119 ) ( ON_BOARD ?auto_357119 ?auto_357120 ) ( SUPPORTS ?auto_357119 ?auto_357116 ) ( POWER_ON ?auto_357119 ) ( POINTING ?auto_357120 ?auto_357118 ) ( not ( = ?auto_357115 ?auto_357118 ) ) ( HAVE_IMAGE ?auto_357117 ?auto_357114 ) ( not ( = ?auto_357117 ?auto_357115 ) ) ( not ( = ?auto_357117 ?auto_357118 ) ) ( not ( = ?auto_357114 ?auto_357116 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357117 ?auto_357114 ?auto_357115 ?auto_357116 )
      ( GET-2IMAGE-VERIFY ?auto_357115 ?auto_357116 ?auto_357117 ?auto_357114 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_357131 - DIRECTION
      ?auto_357132 - MODE
      ?auto_357133 - DIRECTION
      ?auto_357130 - MODE
      ?auto_357134 - DIRECTION
      ?auto_357135 - MODE
    )
    :vars
    (
      ?auto_357137 - INSTRUMENT
      ?auto_357138 - SATELLITE
      ?auto_357136 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_357137 ) ( ON_BOARD ?auto_357137 ?auto_357138 ) ( SUPPORTS ?auto_357137 ?auto_357135 ) ( POWER_ON ?auto_357137 ) ( POINTING ?auto_357138 ?auto_357136 ) ( not ( = ?auto_357134 ?auto_357136 ) ) ( HAVE_IMAGE ?auto_357131 ?auto_357132 ) ( not ( = ?auto_357131 ?auto_357134 ) ) ( not ( = ?auto_357131 ?auto_357136 ) ) ( not ( = ?auto_357132 ?auto_357135 ) ) ( HAVE_IMAGE ?auto_357133 ?auto_357130 ) ( not ( = ?auto_357131 ?auto_357133 ) ) ( not ( = ?auto_357132 ?auto_357130 ) ) ( not ( = ?auto_357133 ?auto_357134 ) ) ( not ( = ?auto_357133 ?auto_357136 ) ) ( not ( = ?auto_357130 ?auto_357135 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357131 ?auto_357132 ?auto_357134 ?auto_357135 )
      ( GET-3IMAGE-VERIFY ?auto_357131 ?auto_357132 ?auto_357133 ?auto_357130 ?auto_357134 ?auto_357135 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_357140 - DIRECTION
      ?auto_357141 - MODE
      ?auto_357142 - DIRECTION
      ?auto_357139 - MODE
      ?auto_357143 - DIRECTION
      ?auto_357144 - MODE
    )
    :vars
    (
      ?auto_357146 - INSTRUMENT
      ?auto_357147 - SATELLITE
      ?auto_357145 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_357146 ) ( ON_BOARD ?auto_357146 ?auto_357147 ) ( SUPPORTS ?auto_357146 ?auto_357139 ) ( POWER_ON ?auto_357146 ) ( POINTING ?auto_357147 ?auto_357145 ) ( not ( = ?auto_357142 ?auto_357145 ) ) ( HAVE_IMAGE ?auto_357140 ?auto_357141 ) ( not ( = ?auto_357140 ?auto_357142 ) ) ( not ( = ?auto_357140 ?auto_357145 ) ) ( not ( = ?auto_357141 ?auto_357139 ) ) ( HAVE_IMAGE ?auto_357143 ?auto_357144 ) ( not ( = ?auto_357140 ?auto_357143 ) ) ( not ( = ?auto_357141 ?auto_357144 ) ) ( not ( = ?auto_357142 ?auto_357143 ) ) ( not ( = ?auto_357139 ?auto_357144 ) ) ( not ( = ?auto_357143 ?auto_357145 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357140 ?auto_357141 ?auto_357142 ?auto_357139 )
      ( GET-3IMAGE-VERIFY ?auto_357140 ?auto_357141 ?auto_357142 ?auto_357139 ?auto_357143 ?auto_357144 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_357158 - DIRECTION
      ?auto_357159 - MODE
      ?auto_357160 - DIRECTION
      ?auto_357157 - MODE
      ?auto_357161 - DIRECTION
      ?auto_357162 - MODE
    )
    :vars
    (
      ?auto_357164 - INSTRUMENT
      ?auto_357165 - SATELLITE
      ?auto_357163 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_357164 ) ( ON_BOARD ?auto_357164 ?auto_357165 ) ( SUPPORTS ?auto_357164 ?auto_357159 ) ( POWER_ON ?auto_357164 ) ( POINTING ?auto_357165 ?auto_357163 ) ( not ( = ?auto_357158 ?auto_357163 ) ) ( HAVE_IMAGE ?auto_357161 ?auto_357162 ) ( not ( = ?auto_357161 ?auto_357158 ) ) ( not ( = ?auto_357161 ?auto_357163 ) ) ( not ( = ?auto_357162 ?auto_357159 ) ) ( HAVE_IMAGE ?auto_357160 ?auto_357157 ) ( not ( = ?auto_357158 ?auto_357160 ) ) ( not ( = ?auto_357159 ?auto_357157 ) ) ( not ( = ?auto_357160 ?auto_357161 ) ) ( not ( = ?auto_357160 ?auto_357163 ) ) ( not ( = ?auto_357157 ?auto_357162 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357161 ?auto_357162 ?auto_357158 ?auto_357159 )
      ( GET-3IMAGE-VERIFY ?auto_357158 ?auto_357159 ?auto_357160 ?auto_357157 ?auto_357161 ?auto_357162 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_357196 - DIRECTION
      ?auto_357197 - MODE
      ?auto_357198 - DIRECTION
      ?auto_357195 - MODE
      ?auto_357199 - DIRECTION
      ?auto_357200 - MODE
      ?auto_357201 - DIRECTION
      ?auto_357202 - MODE
    )
    :vars
    (
      ?auto_357204 - INSTRUMENT
      ?auto_357205 - SATELLITE
      ?auto_357203 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_357204 ) ( ON_BOARD ?auto_357204 ?auto_357205 ) ( SUPPORTS ?auto_357204 ?auto_357202 ) ( POWER_ON ?auto_357204 ) ( POINTING ?auto_357205 ?auto_357203 ) ( not ( = ?auto_357201 ?auto_357203 ) ) ( HAVE_IMAGE ?auto_357199 ?auto_357197 ) ( not ( = ?auto_357199 ?auto_357201 ) ) ( not ( = ?auto_357199 ?auto_357203 ) ) ( not ( = ?auto_357197 ?auto_357202 ) ) ( HAVE_IMAGE ?auto_357196 ?auto_357197 ) ( HAVE_IMAGE ?auto_357198 ?auto_357195 ) ( HAVE_IMAGE ?auto_357199 ?auto_357200 ) ( not ( = ?auto_357196 ?auto_357198 ) ) ( not ( = ?auto_357196 ?auto_357199 ) ) ( not ( = ?auto_357196 ?auto_357201 ) ) ( not ( = ?auto_357196 ?auto_357203 ) ) ( not ( = ?auto_357197 ?auto_357195 ) ) ( not ( = ?auto_357197 ?auto_357200 ) ) ( not ( = ?auto_357198 ?auto_357199 ) ) ( not ( = ?auto_357198 ?auto_357201 ) ) ( not ( = ?auto_357198 ?auto_357203 ) ) ( not ( = ?auto_357195 ?auto_357200 ) ) ( not ( = ?auto_357195 ?auto_357202 ) ) ( not ( = ?auto_357200 ?auto_357202 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357199 ?auto_357197 ?auto_357201 ?auto_357202 )
      ( GET-4IMAGE-VERIFY ?auto_357196 ?auto_357197 ?auto_357198 ?auto_357195 ?auto_357199 ?auto_357200 ?auto_357201 ?auto_357202 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_357207 - DIRECTION
      ?auto_357208 - MODE
      ?auto_357209 - DIRECTION
      ?auto_357206 - MODE
      ?auto_357210 - DIRECTION
      ?auto_357211 - MODE
      ?auto_357212 - DIRECTION
      ?auto_357213 - MODE
    )
    :vars
    (
      ?auto_357215 - INSTRUMENT
      ?auto_357216 - SATELLITE
      ?auto_357214 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_357215 ) ( ON_BOARD ?auto_357215 ?auto_357216 ) ( SUPPORTS ?auto_357215 ?auto_357211 ) ( POWER_ON ?auto_357215 ) ( POINTING ?auto_357216 ?auto_357214 ) ( not ( = ?auto_357210 ?auto_357214 ) ) ( HAVE_IMAGE ?auto_357209 ?auto_357208 ) ( not ( = ?auto_357209 ?auto_357210 ) ) ( not ( = ?auto_357209 ?auto_357214 ) ) ( not ( = ?auto_357208 ?auto_357211 ) ) ( HAVE_IMAGE ?auto_357207 ?auto_357208 ) ( HAVE_IMAGE ?auto_357209 ?auto_357206 ) ( HAVE_IMAGE ?auto_357212 ?auto_357213 ) ( not ( = ?auto_357207 ?auto_357209 ) ) ( not ( = ?auto_357207 ?auto_357210 ) ) ( not ( = ?auto_357207 ?auto_357212 ) ) ( not ( = ?auto_357207 ?auto_357214 ) ) ( not ( = ?auto_357208 ?auto_357206 ) ) ( not ( = ?auto_357208 ?auto_357213 ) ) ( not ( = ?auto_357209 ?auto_357212 ) ) ( not ( = ?auto_357206 ?auto_357211 ) ) ( not ( = ?auto_357206 ?auto_357213 ) ) ( not ( = ?auto_357210 ?auto_357212 ) ) ( not ( = ?auto_357211 ?auto_357213 ) ) ( not ( = ?auto_357212 ?auto_357214 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357209 ?auto_357208 ?auto_357210 ?auto_357211 )
      ( GET-4IMAGE-VERIFY ?auto_357207 ?auto_357208 ?auto_357209 ?auto_357206 ?auto_357210 ?auto_357211 ?auto_357212 ?auto_357213 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_357229 - DIRECTION
      ?auto_357230 - MODE
      ?auto_357231 - DIRECTION
      ?auto_357228 - MODE
      ?auto_357232 - DIRECTION
      ?auto_357233 - MODE
      ?auto_357234 - DIRECTION
      ?auto_357235 - MODE
    )
    :vars
    (
      ?auto_357237 - INSTRUMENT
      ?auto_357238 - SATELLITE
      ?auto_357236 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_357237 ) ( ON_BOARD ?auto_357237 ?auto_357238 ) ( SUPPORTS ?auto_357237 ?auto_357228 ) ( POWER_ON ?auto_357237 ) ( POINTING ?auto_357238 ?auto_357236 ) ( not ( = ?auto_357231 ?auto_357236 ) ) ( HAVE_IMAGE ?auto_357232 ?auto_357230 ) ( not ( = ?auto_357232 ?auto_357231 ) ) ( not ( = ?auto_357232 ?auto_357236 ) ) ( not ( = ?auto_357230 ?auto_357228 ) ) ( HAVE_IMAGE ?auto_357229 ?auto_357230 ) ( HAVE_IMAGE ?auto_357232 ?auto_357233 ) ( HAVE_IMAGE ?auto_357234 ?auto_357235 ) ( not ( = ?auto_357229 ?auto_357231 ) ) ( not ( = ?auto_357229 ?auto_357232 ) ) ( not ( = ?auto_357229 ?auto_357234 ) ) ( not ( = ?auto_357229 ?auto_357236 ) ) ( not ( = ?auto_357230 ?auto_357233 ) ) ( not ( = ?auto_357230 ?auto_357235 ) ) ( not ( = ?auto_357231 ?auto_357234 ) ) ( not ( = ?auto_357228 ?auto_357233 ) ) ( not ( = ?auto_357228 ?auto_357235 ) ) ( not ( = ?auto_357232 ?auto_357234 ) ) ( not ( = ?auto_357233 ?auto_357235 ) ) ( not ( = ?auto_357234 ?auto_357236 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357232 ?auto_357230 ?auto_357231 ?auto_357228 )
      ( GET-4IMAGE-VERIFY ?auto_357229 ?auto_357230 ?auto_357231 ?auto_357228 ?auto_357232 ?auto_357233 ?auto_357234 ?auto_357235 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_357273 - DIRECTION
      ?auto_357274 - MODE
      ?auto_357275 - DIRECTION
      ?auto_357272 - MODE
      ?auto_357276 - DIRECTION
      ?auto_357277 - MODE
      ?auto_357278 - DIRECTION
      ?auto_357279 - MODE
    )
    :vars
    (
      ?auto_357281 - INSTRUMENT
      ?auto_357282 - SATELLITE
      ?auto_357280 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_357281 ) ( ON_BOARD ?auto_357281 ?auto_357282 ) ( SUPPORTS ?auto_357281 ?auto_357274 ) ( POWER_ON ?auto_357281 ) ( POINTING ?auto_357282 ?auto_357280 ) ( not ( = ?auto_357273 ?auto_357280 ) ) ( HAVE_IMAGE ?auto_357278 ?auto_357272 ) ( not ( = ?auto_357278 ?auto_357273 ) ) ( not ( = ?auto_357278 ?auto_357280 ) ) ( not ( = ?auto_357272 ?auto_357274 ) ) ( HAVE_IMAGE ?auto_357275 ?auto_357272 ) ( HAVE_IMAGE ?auto_357276 ?auto_357277 ) ( HAVE_IMAGE ?auto_357278 ?auto_357279 ) ( not ( = ?auto_357273 ?auto_357275 ) ) ( not ( = ?auto_357273 ?auto_357276 ) ) ( not ( = ?auto_357274 ?auto_357277 ) ) ( not ( = ?auto_357274 ?auto_357279 ) ) ( not ( = ?auto_357275 ?auto_357276 ) ) ( not ( = ?auto_357275 ?auto_357278 ) ) ( not ( = ?auto_357275 ?auto_357280 ) ) ( not ( = ?auto_357272 ?auto_357277 ) ) ( not ( = ?auto_357272 ?auto_357279 ) ) ( not ( = ?auto_357276 ?auto_357278 ) ) ( not ( = ?auto_357276 ?auto_357280 ) ) ( not ( = ?auto_357277 ?auto_357279 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357278 ?auto_357272 ?auto_357273 ?auto_357274 )
      ( GET-4IMAGE-VERIFY ?auto_357273 ?auto_357274 ?auto_357275 ?auto_357272 ?auto_357276 ?auto_357277 ?auto_357278 ?auto_357279 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_357362 - DIRECTION
      ?auto_357363 - MODE
    )
    :vars
    (
      ?auto_357367 - INSTRUMENT
      ?auto_357368 - SATELLITE
      ?auto_357365 - DIRECTION
      ?auto_357364 - DIRECTION
      ?auto_357366 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_357367 ?auto_357368 ) ( SUPPORTS ?auto_357367 ?auto_357363 ) ( POWER_ON ?auto_357367 ) ( POINTING ?auto_357368 ?auto_357365 ) ( not ( = ?auto_357362 ?auto_357365 ) ) ( HAVE_IMAGE ?auto_357364 ?auto_357366 ) ( not ( = ?auto_357364 ?auto_357362 ) ) ( not ( = ?auto_357364 ?auto_357365 ) ) ( not ( = ?auto_357366 ?auto_357363 ) ) ( CALIBRATION_TARGET ?auto_357367 ?auto_357365 ) ( NOT_CALIBRATED ?auto_357367 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_357368 ?auto_357367 ?auto_357365 )
      ( GET-2IMAGE ?auto_357364 ?auto_357366 ?auto_357362 ?auto_357363 )
      ( GET-1IMAGE-VERIFY ?auto_357362 ?auto_357363 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_357370 - DIRECTION
      ?auto_357371 - MODE
      ?auto_357372 - DIRECTION
      ?auto_357369 - MODE
    )
    :vars
    (
      ?auto_357374 - INSTRUMENT
      ?auto_357375 - SATELLITE
      ?auto_357373 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357374 ?auto_357375 ) ( SUPPORTS ?auto_357374 ?auto_357369 ) ( POWER_ON ?auto_357374 ) ( POINTING ?auto_357375 ?auto_357373 ) ( not ( = ?auto_357372 ?auto_357373 ) ) ( HAVE_IMAGE ?auto_357370 ?auto_357371 ) ( not ( = ?auto_357370 ?auto_357372 ) ) ( not ( = ?auto_357370 ?auto_357373 ) ) ( not ( = ?auto_357371 ?auto_357369 ) ) ( CALIBRATION_TARGET ?auto_357374 ?auto_357373 ) ( NOT_CALIBRATED ?auto_357374 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_357372 ?auto_357369 )
      ( GET-2IMAGE-VERIFY ?auto_357370 ?auto_357371 ?auto_357372 ?auto_357369 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_357377 - DIRECTION
      ?auto_357378 - MODE
      ?auto_357379 - DIRECTION
      ?auto_357376 - MODE
    )
    :vars
    (
      ?auto_357380 - INSTRUMENT
      ?auto_357381 - SATELLITE
      ?auto_357382 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357380 ?auto_357381 ) ( SUPPORTS ?auto_357380 ?auto_357378 ) ( POWER_ON ?auto_357380 ) ( POINTING ?auto_357381 ?auto_357382 ) ( not ( = ?auto_357377 ?auto_357382 ) ) ( HAVE_IMAGE ?auto_357379 ?auto_357376 ) ( not ( = ?auto_357379 ?auto_357377 ) ) ( not ( = ?auto_357379 ?auto_357382 ) ) ( not ( = ?auto_357376 ?auto_357378 ) ) ( CALIBRATION_TARGET ?auto_357380 ?auto_357382 ) ( NOT_CALIBRATED ?auto_357380 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357379 ?auto_357376 ?auto_357377 ?auto_357378 )
      ( GET-2IMAGE-VERIFY ?auto_357377 ?auto_357378 ?auto_357379 ?auto_357376 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_357393 - DIRECTION
      ?auto_357394 - MODE
      ?auto_357395 - DIRECTION
      ?auto_357392 - MODE
      ?auto_357396 - DIRECTION
      ?auto_357397 - MODE
    )
    :vars
    (
      ?auto_357398 - INSTRUMENT
      ?auto_357399 - SATELLITE
      ?auto_357400 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357398 ?auto_357399 ) ( SUPPORTS ?auto_357398 ?auto_357397 ) ( POWER_ON ?auto_357398 ) ( POINTING ?auto_357399 ?auto_357400 ) ( not ( = ?auto_357396 ?auto_357400 ) ) ( HAVE_IMAGE ?auto_357393 ?auto_357394 ) ( not ( = ?auto_357393 ?auto_357396 ) ) ( not ( = ?auto_357393 ?auto_357400 ) ) ( not ( = ?auto_357394 ?auto_357397 ) ) ( CALIBRATION_TARGET ?auto_357398 ?auto_357400 ) ( NOT_CALIBRATED ?auto_357398 ) ( HAVE_IMAGE ?auto_357395 ?auto_357392 ) ( not ( = ?auto_357393 ?auto_357395 ) ) ( not ( = ?auto_357394 ?auto_357392 ) ) ( not ( = ?auto_357395 ?auto_357396 ) ) ( not ( = ?auto_357395 ?auto_357400 ) ) ( not ( = ?auto_357392 ?auto_357397 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357393 ?auto_357394 ?auto_357396 ?auto_357397 )
      ( GET-3IMAGE-VERIFY ?auto_357393 ?auto_357394 ?auto_357395 ?auto_357392 ?auto_357396 ?auto_357397 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_357402 - DIRECTION
      ?auto_357403 - MODE
      ?auto_357404 - DIRECTION
      ?auto_357401 - MODE
      ?auto_357405 - DIRECTION
      ?auto_357406 - MODE
    )
    :vars
    (
      ?auto_357407 - INSTRUMENT
      ?auto_357408 - SATELLITE
      ?auto_357409 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357407 ?auto_357408 ) ( SUPPORTS ?auto_357407 ?auto_357401 ) ( POWER_ON ?auto_357407 ) ( POINTING ?auto_357408 ?auto_357409 ) ( not ( = ?auto_357404 ?auto_357409 ) ) ( HAVE_IMAGE ?auto_357402 ?auto_357403 ) ( not ( = ?auto_357402 ?auto_357404 ) ) ( not ( = ?auto_357402 ?auto_357409 ) ) ( not ( = ?auto_357403 ?auto_357401 ) ) ( CALIBRATION_TARGET ?auto_357407 ?auto_357409 ) ( NOT_CALIBRATED ?auto_357407 ) ( HAVE_IMAGE ?auto_357405 ?auto_357406 ) ( not ( = ?auto_357402 ?auto_357405 ) ) ( not ( = ?auto_357403 ?auto_357406 ) ) ( not ( = ?auto_357404 ?auto_357405 ) ) ( not ( = ?auto_357401 ?auto_357406 ) ) ( not ( = ?auto_357405 ?auto_357409 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357402 ?auto_357403 ?auto_357404 ?auto_357401 )
      ( GET-3IMAGE-VERIFY ?auto_357402 ?auto_357403 ?auto_357404 ?auto_357401 ?auto_357405 ?auto_357406 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_357420 - DIRECTION
      ?auto_357421 - MODE
      ?auto_357422 - DIRECTION
      ?auto_357419 - MODE
      ?auto_357423 - DIRECTION
      ?auto_357424 - MODE
    )
    :vars
    (
      ?auto_357425 - INSTRUMENT
      ?auto_357426 - SATELLITE
      ?auto_357427 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357425 ?auto_357426 ) ( SUPPORTS ?auto_357425 ?auto_357421 ) ( POWER_ON ?auto_357425 ) ( POINTING ?auto_357426 ?auto_357427 ) ( not ( = ?auto_357420 ?auto_357427 ) ) ( HAVE_IMAGE ?auto_357422 ?auto_357424 ) ( not ( = ?auto_357422 ?auto_357420 ) ) ( not ( = ?auto_357422 ?auto_357427 ) ) ( not ( = ?auto_357424 ?auto_357421 ) ) ( CALIBRATION_TARGET ?auto_357425 ?auto_357427 ) ( NOT_CALIBRATED ?auto_357425 ) ( HAVE_IMAGE ?auto_357422 ?auto_357419 ) ( HAVE_IMAGE ?auto_357423 ?auto_357424 ) ( not ( = ?auto_357420 ?auto_357423 ) ) ( not ( = ?auto_357421 ?auto_357419 ) ) ( not ( = ?auto_357422 ?auto_357423 ) ) ( not ( = ?auto_357419 ?auto_357424 ) ) ( not ( = ?auto_357423 ?auto_357427 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357422 ?auto_357424 ?auto_357420 ?auto_357421 )
      ( GET-3IMAGE-VERIFY ?auto_357420 ?auto_357421 ?auto_357422 ?auto_357419 ?auto_357423 ?auto_357424 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_357458 - DIRECTION
      ?auto_357459 - MODE
      ?auto_357460 - DIRECTION
      ?auto_357457 - MODE
      ?auto_357461 - DIRECTION
      ?auto_357462 - MODE
      ?auto_357463 - DIRECTION
      ?auto_357464 - MODE
    )
    :vars
    (
      ?auto_357465 - INSTRUMENT
      ?auto_357466 - SATELLITE
      ?auto_357467 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357465 ?auto_357466 ) ( SUPPORTS ?auto_357465 ?auto_357464 ) ( POWER_ON ?auto_357465 ) ( POINTING ?auto_357466 ?auto_357467 ) ( not ( = ?auto_357463 ?auto_357467 ) ) ( HAVE_IMAGE ?auto_357461 ?auto_357459 ) ( not ( = ?auto_357461 ?auto_357463 ) ) ( not ( = ?auto_357461 ?auto_357467 ) ) ( not ( = ?auto_357459 ?auto_357464 ) ) ( CALIBRATION_TARGET ?auto_357465 ?auto_357467 ) ( NOT_CALIBRATED ?auto_357465 ) ( HAVE_IMAGE ?auto_357458 ?auto_357459 ) ( HAVE_IMAGE ?auto_357460 ?auto_357457 ) ( HAVE_IMAGE ?auto_357461 ?auto_357462 ) ( not ( = ?auto_357458 ?auto_357460 ) ) ( not ( = ?auto_357458 ?auto_357461 ) ) ( not ( = ?auto_357458 ?auto_357463 ) ) ( not ( = ?auto_357458 ?auto_357467 ) ) ( not ( = ?auto_357459 ?auto_357457 ) ) ( not ( = ?auto_357459 ?auto_357462 ) ) ( not ( = ?auto_357460 ?auto_357461 ) ) ( not ( = ?auto_357460 ?auto_357463 ) ) ( not ( = ?auto_357460 ?auto_357467 ) ) ( not ( = ?auto_357457 ?auto_357462 ) ) ( not ( = ?auto_357457 ?auto_357464 ) ) ( not ( = ?auto_357462 ?auto_357464 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357461 ?auto_357459 ?auto_357463 ?auto_357464 )
      ( GET-4IMAGE-VERIFY ?auto_357458 ?auto_357459 ?auto_357460 ?auto_357457 ?auto_357461 ?auto_357462 ?auto_357463 ?auto_357464 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_357469 - DIRECTION
      ?auto_357470 - MODE
      ?auto_357471 - DIRECTION
      ?auto_357468 - MODE
      ?auto_357472 - DIRECTION
      ?auto_357473 - MODE
      ?auto_357474 - DIRECTION
      ?auto_357475 - MODE
    )
    :vars
    (
      ?auto_357476 - INSTRUMENT
      ?auto_357477 - SATELLITE
      ?auto_357478 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357476 ?auto_357477 ) ( SUPPORTS ?auto_357476 ?auto_357473 ) ( POWER_ON ?auto_357476 ) ( POINTING ?auto_357477 ?auto_357478 ) ( not ( = ?auto_357472 ?auto_357478 ) ) ( HAVE_IMAGE ?auto_357474 ?auto_357475 ) ( not ( = ?auto_357474 ?auto_357472 ) ) ( not ( = ?auto_357474 ?auto_357478 ) ) ( not ( = ?auto_357475 ?auto_357473 ) ) ( CALIBRATION_TARGET ?auto_357476 ?auto_357478 ) ( NOT_CALIBRATED ?auto_357476 ) ( HAVE_IMAGE ?auto_357469 ?auto_357470 ) ( HAVE_IMAGE ?auto_357471 ?auto_357468 ) ( not ( = ?auto_357469 ?auto_357471 ) ) ( not ( = ?auto_357469 ?auto_357472 ) ) ( not ( = ?auto_357469 ?auto_357474 ) ) ( not ( = ?auto_357469 ?auto_357478 ) ) ( not ( = ?auto_357470 ?auto_357468 ) ) ( not ( = ?auto_357470 ?auto_357473 ) ) ( not ( = ?auto_357470 ?auto_357475 ) ) ( not ( = ?auto_357471 ?auto_357472 ) ) ( not ( = ?auto_357471 ?auto_357474 ) ) ( not ( = ?auto_357471 ?auto_357478 ) ) ( not ( = ?auto_357468 ?auto_357473 ) ) ( not ( = ?auto_357468 ?auto_357475 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357474 ?auto_357475 ?auto_357472 ?auto_357473 )
      ( GET-4IMAGE-VERIFY ?auto_357469 ?auto_357470 ?auto_357471 ?auto_357468 ?auto_357472 ?auto_357473 ?auto_357474 ?auto_357475 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_357491 - DIRECTION
      ?auto_357492 - MODE
      ?auto_357493 - DIRECTION
      ?auto_357490 - MODE
      ?auto_357494 - DIRECTION
      ?auto_357495 - MODE
      ?auto_357496 - DIRECTION
      ?auto_357497 - MODE
    )
    :vars
    (
      ?auto_357498 - INSTRUMENT
      ?auto_357499 - SATELLITE
      ?auto_357500 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357498 ?auto_357499 ) ( SUPPORTS ?auto_357498 ?auto_357490 ) ( POWER_ON ?auto_357498 ) ( POINTING ?auto_357499 ?auto_357500 ) ( not ( = ?auto_357493 ?auto_357500 ) ) ( HAVE_IMAGE ?auto_357496 ?auto_357492 ) ( not ( = ?auto_357496 ?auto_357493 ) ) ( not ( = ?auto_357496 ?auto_357500 ) ) ( not ( = ?auto_357492 ?auto_357490 ) ) ( CALIBRATION_TARGET ?auto_357498 ?auto_357500 ) ( NOT_CALIBRATED ?auto_357498 ) ( HAVE_IMAGE ?auto_357491 ?auto_357492 ) ( HAVE_IMAGE ?auto_357494 ?auto_357495 ) ( HAVE_IMAGE ?auto_357496 ?auto_357497 ) ( not ( = ?auto_357491 ?auto_357493 ) ) ( not ( = ?auto_357491 ?auto_357494 ) ) ( not ( = ?auto_357491 ?auto_357496 ) ) ( not ( = ?auto_357491 ?auto_357500 ) ) ( not ( = ?auto_357492 ?auto_357495 ) ) ( not ( = ?auto_357492 ?auto_357497 ) ) ( not ( = ?auto_357493 ?auto_357494 ) ) ( not ( = ?auto_357490 ?auto_357495 ) ) ( not ( = ?auto_357490 ?auto_357497 ) ) ( not ( = ?auto_357494 ?auto_357496 ) ) ( not ( = ?auto_357494 ?auto_357500 ) ) ( not ( = ?auto_357495 ?auto_357497 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357496 ?auto_357492 ?auto_357493 ?auto_357490 )
      ( GET-4IMAGE-VERIFY ?auto_357491 ?auto_357492 ?auto_357493 ?auto_357490 ?auto_357494 ?auto_357495 ?auto_357496 ?auto_357497 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_357535 - DIRECTION
      ?auto_357536 - MODE
      ?auto_357537 - DIRECTION
      ?auto_357534 - MODE
      ?auto_357538 - DIRECTION
      ?auto_357539 - MODE
      ?auto_357540 - DIRECTION
      ?auto_357541 - MODE
    )
    :vars
    (
      ?auto_357542 - INSTRUMENT
      ?auto_357543 - SATELLITE
      ?auto_357544 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357542 ?auto_357543 ) ( SUPPORTS ?auto_357542 ?auto_357536 ) ( POWER_ON ?auto_357542 ) ( POINTING ?auto_357543 ?auto_357544 ) ( not ( = ?auto_357535 ?auto_357544 ) ) ( HAVE_IMAGE ?auto_357537 ?auto_357534 ) ( not ( = ?auto_357537 ?auto_357535 ) ) ( not ( = ?auto_357537 ?auto_357544 ) ) ( not ( = ?auto_357534 ?auto_357536 ) ) ( CALIBRATION_TARGET ?auto_357542 ?auto_357544 ) ( NOT_CALIBRATED ?auto_357542 ) ( HAVE_IMAGE ?auto_357538 ?auto_357539 ) ( HAVE_IMAGE ?auto_357540 ?auto_357541 ) ( not ( = ?auto_357535 ?auto_357538 ) ) ( not ( = ?auto_357535 ?auto_357540 ) ) ( not ( = ?auto_357536 ?auto_357539 ) ) ( not ( = ?auto_357536 ?auto_357541 ) ) ( not ( = ?auto_357537 ?auto_357538 ) ) ( not ( = ?auto_357537 ?auto_357540 ) ) ( not ( = ?auto_357534 ?auto_357539 ) ) ( not ( = ?auto_357534 ?auto_357541 ) ) ( not ( = ?auto_357538 ?auto_357540 ) ) ( not ( = ?auto_357538 ?auto_357544 ) ) ( not ( = ?auto_357539 ?auto_357541 ) ) ( not ( = ?auto_357540 ?auto_357544 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357537 ?auto_357534 ?auto_357535 ?auto_357536 )
      ( GET-4IMAGE-VERIFY ?auto_357535 ?auto_357536 ?auto_357537 ?auto_357534 ?auto_357538 ?auto_357539 ?auto_357540 ?auto_357541 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_357624 - DIRECTION
      ?auto_357625 - MODE
    )
    :vars
    (
      ?auto_357627 - INSTRUMENT
      ?auto_357628 - SATELLITE
      ?auto_357630 - DIRECTION
      ?auto_357629 - DIRECTION
      ?auto_357626 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_357627 ?auto_357628 ) ( SUPPORTS ?auto_357627 ?auto_357625 ) ( POINTING ?auto_357628 ?auto_357630 ) ( not ( = ?auto_357624 ?auto_357630 ) ) ( HAVE_IMAGE ?auto_357629 ?auto_357626 ) ( not ( = ?auto_357629 ?auto_357624 ) ) ( not ( = ?auto_357629 ?auto_357630 ) ) ( not ( = ?auto_357626 ?auto_357625 ) ) ( CALIBRATION_TARGET ?auto_357627 ?auto_357630 ) ( POWER_AVAIL ?auto_357628 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_357627 ?auto_357628 )
      ( GET-2IMAGE ?auto_357629 ?auto_357626 ?auto_357624 ?auto_357625 )
      ( GET-1IMAGE-VERIFY ?auto_357624 ?auto_357625 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_357632 - DIRECTION
      ?auto_357633 - MODE
      ?auto_357634 - DIRECTION
      ?auto_357631 - MODE
    )
    :vars
    (
      ?auto_357637 - INSTRUMENT
      ?auto_357635 - SATELLITE
      ?auto_357636 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357637 ?auto_357635 ) ( SUPPORTS ?auto_357637 ?auto_357631 ) ( POINTING ?auto_357635 ?auto_357636 ) ( not ( = ?auto_357634 ?auto_357636 ) ) ( HAVE_IMAGE ?auto_357632 ?auto_357633 ) ( not ( = ?auto_357632 ?auto_357634 ) ) ( not ( = ?auto_357632 ?auto_357636 ) ) ( not ( = ?auto_357633 ?auto_357631 ) ) ( CALIBRATION_TARGET ?auto_357637 ?auto_357636 ) ( POWER_AVAIL ?auto_357635 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_357634 ?auto_357631 )
      ( GET-2IMAGE-VERIFY ?auto_357632 ?auto_357633 ?auto_357634 ?auto_357631 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_357639 - DIRECTION
      ?auto_357640 - MODE
      ?auto_357641 - DIRECTION
      ?auto_357638 - MODE
    )
    :vars
    (
      ?auto_357642 - INSTRUMENT
      ?auto_357643 - SATELLITE
      ?auto_357644 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357642 ?auto_357643 ) ( SUPPORTS ?auto_357642 ?auto_357640 ) ( POINTING ?auto_357643 ?auto_357644 ) ( not ( = ?auto_357639 ?auto_357644 ) ) ( HAVE_IMAGE ?auto_357641 ?auto_357638 ) ( not ( = ?auto_357641 ?auto_357639 ) ) ( not ( = ?auto_357641 ?auto_357644 ) ) ( not ( = ?auto_357638 ?auto_357640 ) ) ( CALIBRATION_TARGET ?auto_357642 ?auto_357644 ) ( POWER_AVAIL ?auto_357643 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357641 ?auto_357638 ?auto_357639 ?auto_357640 )
      ( GET-2IMAGE-VERIFY ?auto_357639 ?auto_357640 ?auto_357641 ?auto_357638 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_357655 - DIRECTION
      ?auto_357656 - MODE
      ?auto_357657 - DIRECTION
      ?auto_357654 - MODE
      ?auto_357658 - DIRECTION
      ?auto_357659 - MODE
    )
    :vars
    (
      ?auto_357660 - INSTRUMENT
      ?auto_357661 - SATELLITE
      ?auto_357662 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357660 ?auto_357661 ) ( SUPPORTS ?auto_357660 ?auto_357659 ) ( POINTING ?auto_357661 ?auto_357662 ) ( not ( = ?auto_357658 ?auto_357662 ) ) ( HAVE_IMAGE ?auto_357657 ?auto_357654 ) ( not ( = ?auto_357657 ?auto_357658 ) ) ( not ( = ?auto_357657 ?auto_357662 ) ) ( not ( = ?auto_357654 ?auto_357659 ) ) ( CALIBRATION_TARGET ?auto_357660 ?auto_357662 ) ( POWER_AVAIL ?auto_357661 ) ( HAVE_IMAGE ?auto_357655 ?auto_357656 ) ( not ( = ?auto_357655 ?auto_357657 ) ) ( not ( = ?auto_357655 ?auto_357658 ) ) ( not ( = ?auto_357655 ?auto_357662 ) ) ( not ( = ?auto_357656 ?auto_357654 ) ) ( not ( = ?auto_357656 ?auto_357659 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357657 ?auto_357654 ?auto_357658 ?auto_357659 )
      ( GET-3IMAGE-VERIFY ?auto_357655 ?auto_357656 ?auto_357657 ?auto_357654 ?auto_357658 ?auto_357659 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_357664 - DIRECTION
      ?auto_357665 - MODE
      ?auto_357666 - DIRECTION
      ?auto_357663 - MODE
      ?auto_357667 - DIRECTION
      ?auto_357668 - MODE
    )
    :vars
    (
      ?auto_357669 - INSTRUMENT
      ?auto_357670 - SATELLITE
      ?auto_357671 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357669 ?auto_357670 ) ( SUPPORTS ?auto_357669 ?auto_357663 ) ( POINTING ?auto_357670 ?auto_357671 ) ( not ( = ?auto_357666 ?auto_357671 ) ) ( HAVE_IMAGE ?auto_357667 ?auto_357668 ) ( not ( = ?auto_357667 ?auto_357666 ) ) ( not ( = ?auto_357667 ?auto_357671 ) ) ( not ( = ?auto_357668 ?auto_357663 ) ) ( CALIBRATION_TARGET ?auto_357669 ?auto_357671 ) ( POWER_AVAIL ?auto_357670 ) ( HAVE_IMAGE ?auto_357664 ?auto_357665 ) ( not ( = ?auto_357664 ?auto_357666 ) ) ( not ( = ?auto_357664 ?auto_357667 ) ) ( not ( = ?auto_357664 ?auto_357671 ) ) ( not ( = ?auto_357665 ?auto_357663 ) ) ( not ( = ?auto_357665 ?auto_357668 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357667 ?auto_357668 ?auto_357666 ?auto_357663 )
      ( GET-3IMAGE-VERIFY ?auto_357664 ?auto_357665 ?auto_357666 ?auto_357663 ?auto_357667 ?auto_357668 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_357682 - DIRECTION
      ?auto_357683 - MODE
      ?auto_357684 - DIRECTION
      ?auto_357681 - MODE
      ?auto_357685 - DIRECTION
      ?auto_357686 - MODE
    )
    :vars
    (
      ?auto_357687 - INSTRUMENT
      ?auto_357688 - SATELLITE
      ?auto_357689 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357687 ?auto_357688 ) ( SUPPORTS ?auto_357687 ?auto_357683 ) ( POINTING ?auto_357688 ?auto_357689 ) ( not ( = ?auto_357682 ?auto_357689 ) ) ( HAVE_IMAGE ?auto_357685 ?auto_357686 ) ( not ( = ?auto_357685 ?auto_357682 ) ) ( not ( = ?auto_357685 ?auto_357689 ) ) ( not ( = ?auto_357686 ?auto_357683 ) ) ( CALIBRATION_TARGET ?auto_357687 ?auto_357689 ) ( POWER_AVAIL ?auto_357688 ) ( HAVE_IMAGE ?auto_357684 ?auto_357681 ) ( not ( = ?auto_357682 ?auto_357684 ) ) ( not ( = ?auto_357683 ?auto_357681 ) ) ( not ( = ?auto_357684 ?auto_357685 ) ) ( not ( = ?auto_357684 ?auto_357689 ) ) ( not ( = ?auto_357681 ?auto_357686 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357685 ?auto_357686 ?auto_357682 ?auto_357683 )
      ( GET-3IMAGE-VERIFY ?auto_357682 ?auto_357683 ?auto_357684 ?auto_357681 ?auto_357685 ?auto_357686 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_357720 - DIRECTION
      ?auto_357721 - MODE
      ?auto_357722 - DIRECTION
      ?auto_357719 - MODE
      ?auto_357723 - DIRECTION
      ?auto_357724 - MODE
      ?auto_357725 - DIRECTION
      ?auto_357726 - MODE
    )
    :vars
    (
      ?auto_357727 - INSTRUMENT
      ?auto_357728 - SATELLITE
      ?auto_357729 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357727 ?auto_357728 ) ( SUPPORTS ?auto_357727 ?auto_357726 ) ( POINTING ?auto_357728 ?auto_357729 ) ( not ( = ?auto_357725 ?auto_357729 ) ) ( HAVE_IMAGE ?auto_357723 ?auto_357721 ) ( not ( = ?auto_357723 ?auto_357725 ) ) ( not ( = ?auto_357723 ?auto_357729 ) ) ( not ( = ?auto_357721 ?auto_357726 ) ) ( CALIBRATION_TARGET ?auto_357727 ?auto_357729 ) ( POWER_AVAIL ?auto_357728 ) ( HAVE_IMAGE ?auto_357720 ?auto_357721 ) ( HAVE_IMAGE ?auto_357722 ?auto_357719 ) ( HAVE_IMAGE ?auto_357723 ?auto_357724 ) ( not ( = ?auto_357720 ?auto_357722 ) ) ( not ( = ?auto_357720 ?auto_357723 ) ) ( not ( = ?auto_357720 ?auto_357725 ) ) ( not ( = ?auto_357720 ?auto_357729 ) ) ( not ( = ?auto_357721 ?auto_357719 ) ) ( not ( = ?auto_357721 ?auto_357724 ) ) ( not ( = ?auto_357722 ?auto_357723 ) ) ( not ( = ?auto_357722 ?auto_357725 ) ) ( not ( = ?auto_357722 ?auto_357729 ) ) ( not ( = ?auto_357719 ?auto_357724 ) ) ( not ( = ?auto_357719 ?auto_357726 ) ) ( not ( = ?auto_357724 ?auto_357726 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357723 ?auto_357721 ?auto_357725 ?auto_357726 )
      ( GET-4IMAGE-VERIFY ?auto_357720 ?auto_357721 ?auto_357722 ?auto_357719 ?auto_357723 ?auto_357724 ?auto_357725 ?auto_357726 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_357731 - DIRECTION
      ?auto_357732 - MODE
      ?auto_357733 - DIRECTION
      ?auto_357730 - MODE
      ?auto_357734 - DIRECTION
      ?auto_357735 - MODE
      ?auto_357736 - DIRECTION
      ?auto_357737 - MODE
    )
    :vars
    (
      ?auto_357738 - INSTRUMENT
      ?auto_357739 - SATELLITE
      ?auto_357740 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357738 ?auto_357739 ) ( SUPPORTS ?auto_357738 ?auto_357735 ) ( POINTING ?auto_357739 ?auto_357740 ) ( not ( = ?auto_357734 ?auto_357740 ) ) ( HAVE_IMAGE ?auto_357731 ?auto_357730 ) ( not ( = ?auto_357731 ?auto_357734 ) ) ( not ( = ?auto_357731 ?auto_357740 ) ) ( not ( = ?auto_357730 ?auto_357735 ) ) ( CALIBRATION_TARGET ?auto_357738 ?auto_357740 ) ( POWER_AVAIL ?auto_357739 ) ( HAVE_IMAGE ?auto_357731 ?auto_357732 ) ( HAVE_IMAGE ?auto_357733 ?auto_357730 ) ( HAVE_IMAGE ?auto_357736 ?auto_357737 ) ( not ( = ?auto_357731 ?auto_357733 ) ) ( not ( = ?auto_357731 ?auto_357736 ) ) ( not ( = ?auto_357732 ?auto_357730 ) ) ( not ( = ?auto_357732 ?auto_357735 ) ) ( not ( = ?auto_357732 ?auto_357737 ) ) ( not ( = ?auto_357733 ?auto_357734 ) ) ( not ( = ?auto_357733 ?auto_357736 ) ) ( not ( = ?auto_357733 ?auto_357740 ) ) ( not ( = ?auto_357730 ?auto_357737 ) ) ( not ( = ?auto_357734 ?auto_357736 ) ) ( not ( = ?auto_357735 ?auto_357737 ) ) ( not ( = ?auto_357736 ?auto_357740 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357731 ?auto_357730 ?auto_357734 ?auto_357735 )
      ( GET-4IMAGE-VERIFY ?auto_357731 ?auto_357732 ?auto_357733 ?auto_357730 ?auto_357734 ?auto_357735 ?auto_357736 ?auto_357737 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_357753 - DIRECTION
      ?auto_357754 - MODE
      ?auto_357755 - DIRECTION
      ?auto_357752 - MODE
      ?auto_357756 - DIRECTION
      ?auto_357757 - MODE
      ?auto_357758 - DIRECTION
      ?auto_357759 - MODE
    )
    :vars
    (
      ?auto_357760 - INSTRUMENT
      ?auto_357761 - SATELLITE
      ?auto_357762 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357760 ?auto_357761 ) ( SUPPORTS ?auto_357760 ?auto_357752 ) ( POINTING ?auto_357761 ?auto_357762 ) ( not ( = ?auto_357755 ?auto_357762 ) ) ( HAVE_IMAGE ?auto_357756 ?auto_357757 ) ( not ( = ?auto_357756 ?auto_357755 ) ) ( not ( = ?auto_357756 ?auto_357762 ) ) ( not ( = ?auto_357757 ?auto_357752 ) ) ( CALIBRATION_TARGET ?auto_357760 ?auto_357762 ) ( POWER_AVAIL ?auto_357761 ) ( HAVE_IMAGE ?auto_357753 ?auto_357754 ) ( HAVE_IMAGE ?auto_357758 ?auto_357759 ) ( not ( = ?auto_357753 ?auto_357755 ) ) ( not ( = ?auto_357753 ?auto_357756 ) ) ( not ( = ?auto_357753 ?auto_357758 ) ) ( not ( = ?auto_357753 ?auto_357762 ) ) ( not ( = ?auto_357754 ?auto_357752 ) ) ( not ( = ?auto_357754 ?auto_357757 ) ) ( not ( = ?auto_357754 ?auto_357759 ) ) ( not ( = ?auto_357755 ?auto_357758 ) ) ( not ( = ?auto_357752 ?auto_357759 ) ) ( not ( = ?auto_357756 ?auto_357758 ) ) ( not ( = ?auto_357757 ?auto_357759 ) ) ( not ( = ?auto_357758 ?auto_357762 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357756 ?auto_357757 ?auto_357755 ?auto_357752 )
      ( GET-4IMAGE-VERIFY ?auto_357753 ?auto_357754 ?auto_357755 ?auto_357752 ?auto_357756 ?auto_357757 ?auto_357758 ?auto_357759 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_357797 - DIRECTION
      ?auto_357798 - MODE
      ?auto_357799 - DIRECTION
      ?auto_357796 - MODE
      ?auto_357800 - DIRECTION
      ?auto_357801 - MODE
      ?auto_357802 - DIRECTION
      ?auto_357803 - MODE
    )
    :vars
    (
      ?auto_357804 - INSTRUMENT
      ?auto_357805 - SATELLITE
      ?auto_357806 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357804 ?auto_357805 ) ( SUPPORTS ?auto_357804 ?auto_357798 ) ( POINTING ?auto_357805 ?auto_357806 ) ( not ( = ?auto_357797 ?auto_357806 ) ) ( HAVE_IMAGE ?auto_357799 ?auto_357803 ) ( not ( = ?auto_357799 ?auto_357797 ) ) ( not ( = ?auto_357799 ?auto_357806 ) ) ( not ( = ?auto_357803 ?auto_357798 ) ) ( CALIBRATION_TARGET ?auto_357804 ?auto_357806 ) ( POWER_AVAIL ?auto_357805 ) ( HAVE_IMAGE ?auto_357799 ?auto_357796 ) ( HAVE_IMAGE ?auto_357800 ?auto_357801 ) ( HAVE_IMAGE ?auto_357802 ?auto_357803 ) ( not ( = ?auto_357797 ?auto_357800 ) ) ( not ( = ?auto_357797 ?auto_357802 ) ) ( not ( = ?auto_357798 ?auto_357796 ) ) ( not ( = ?auto_357798 ?auto_357801 ) ) ( not ( = ?auto_357799 ?auto_357800 ) ) ( not ( = ?auto_357799 ?auto_357802 ) ) ( not ( = ?auto_357796 ?auto_357801 ) ) ( not ( = ?auto_357796 ?auto_357803 ) ) ( not ( = ?auto_357800 ?auto_357802 ) ) ( not ( = ?auto_357800 ?auto_357806 ) ) ( not ( = ?auto_357801 ?auto_357803 ) ) ( not ( = ?auto_357802 ?auto_357806 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357799 ?auto_357803 ?auto_357797 ?auto_357798 )
      ( GET-4IMAGE-VERIFY ?auto_357797 ?auto_357798 ?auto_357799 ?auto_357796 ?auto_357800 ?auto_357801 ?auto_357802 ?auto_357803 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_357886 - DIRECTION
      ?auto_357887 - MODE
    )
    :vars
    (
      ?auto_357888 - INSTRUMENT
      ?auto_357889 - SATELLITE
      ?auto_357891 - DIRECTION
      ?auto_357890 - DIRECTION
      ?auto_357892 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_357888 ?auto_357889 ) ( SUPPORTS ?auto_357888 ?auto_357887 ) ( not ( = ?auto_357886 ?auto_357891 ) ) ( HAVE_IMAGE ?auto_357890 ?auto_357892 ) ( not ( = ?auto_357890 ?auto_357886 ) ) ( not ( = ?auto_357890 ?auto_357891 ) ) ( not ( = ?auto_357892 ?auto_357887 ) ) ( CALIBRATION_TARGET ?auto_357888 ?auto_357891 ) ( POWER_AVAIL ?auto_357889 ) ( POINTING ?auto_357889 ?auto_357890 ) )
    :subtasks
    ( ( !TURN_TO ?auto_357889 ?auto_357891 ?auto_357890 )
      ( GET-2IMAGE ?auto_357890 ?auto_357892 ?auto_357886 ?auto_357887 )
      ( GET-1IMAGE-VERIFY ?auto_357886 ?auto_357887 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_357894 - DIRECTION
      ?auto_357895 - MODE
      ?auto_357896 - DIRECTION
      ?auto_357893 - MODE
    )
    :vars
    (
      ?auto_357899 - INSTRUMENT
      ?auto_357897 - SATELLITE
      ?auto_357898 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357899 ?auto_357897 ) ( SUPPORTS ?auto_357899 ?auto_357893 ) ( not ( = ?auto_357896 ?auto_357898 ) ) ( HAVE_IMAGE ?auto_357894 ?auto_357895 ) ( not ( = ?auto_357894 ?auto_357896 ) ) ( not ( = ?auto_357894 ?auto_357898 ) ) ( not ( = ?auto_357895 ?auto_357893 ) ) ( CALIBRATION_TARGET ?auto_357899 ?auto_357898 ) ( POWER_AVAIL ?auto_357897 ) ( POINTING ?auto_357897 ?auto_357894 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_357896 ?auto_357893 )
      ( GET-2IMAGE-VERIFY ?auto_357894 ?auto_357895 ?auto_357896 ?auto_357893 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_357901 - DIRECTION
      ?auto_357902 - MODE
      ?auto_357903 - DIRECTION
      ?auto_357900 - MODE
    )
    :vars
    (
      ?auto_357904 - INSTRUMENT
      ?auto_357905 - SATELLITE
      ?auto_357906 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357904 ?auto_357905 ) ( SUPPORTS ?auto_357904 ?auto_357902 ) ( not ( = ?auto_357901 ?auto_357906 ) ) ( HAVE_IMAGE ?auto_357903 ?auto_357900 ) ( not ( = ?auto_357903 ?auto_357901 ) ) ( not ( = ?auto_357903 ?auto_357906 ) ) ( not ( = ?auto_357900 ?auto_357902 ) ) ( CALIBRATION_TARGET ?auto_357904 ?auto_357906 ) ( POWER_AVAIL ?auto_357905 ) ( POINTING ?auto_357905 ?auto_357903 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357903 ?auto_357900 ?auto_357901 ?auto_357902 )
      ( GET-2IMAGE-VERIFY ?auto_357901 ?auto_357902 ?auto_357903 ?auto_357900 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_357917 - DIRECTION
      ?auto_357918 - MODE
      ?auto_357919 - DIRECTION
      ?auto_357916 - MODE
      ?auto_357920 - DIRECTION
      ?auto_357921 - MODE
    )
    :vars
    (
      ?auto_357922 - INSTRUMENT
      ?auto_357923 - SATELLITE
      ?auto_357924 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357922 ?auto_357923 ) ( SUPPORTS ?auto_357922 ?auto_357921 ) ( not ( = ?auto_357920 ?auto_357924 ) ) ( HAVE_IMAGE ?auto_357917 ?auto_357918 ) ( not ( = ?auto_357917 ?auto_357920 ) ) ( not ( = ?auto_357917 ?auto_357924 ) ) ( not ( = ?auto_357918 ?auto_357921 ) ) ( CALIBRATION_TARGET ?auto_357922 ?auto_357924 ) ( POWER_AVAIL ?auto_357923 ) ( POINTING ?auto_357923 ?auto_357917 ) ( HAVE_IMAGE ?auto_357919 ?auto_357916 ) ( not ( = ?auto_357917 ?auto_357919 ) ) ( not ( = ?auto_357918 ?auto_357916 ) ) ( not ( = ?auto_357919 ?auto_357920 ) ) ( not ( = ?auto_357919 ?auto_357924 ) ) ( not ( = ?auto_357916 ?auto_357921 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357917 ?auto_357918 ?auto_357920 ?auto_357921 )
      ( GET-3IMAGE-VERIFY ?auto_357917 ?auto_357918 ?auto_357919 ?auto_357916 ?auto_357920 ?auto_357921 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_357926 - DIRECTION
      ?auto_357927 - MODE
      ?auto_357928 - DIRECTION
      ?auto_357925 - MODE
      ?auto_357929 - DIRECTION
      ?auto_357930 - MODE
    )
    :vars
    (
      ?auto_357931 - INSTRUMENT
      ?auto_357932 - SATELLITE
      ?auto_357933 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357931 ?auto_357932 ) ( SUPPORTS ?auto_357931 ?auto_357925 ) ( not ( = ?auto_357928 ?auto_357933 ) ) ( HAVE_IMAGE ?auto_357929 ?auto_357927 ) ( not ( = ?auto_357929 ?auto_357928 ) ) ( not ( = ?auto_357929 ?auto_357933 ) ) ( not ( = ?auto_357927 ?auto_357925 ) ) ( CALIBRATION_TARGET ?auto_357931 ?auto_357933 ) ( POWER_AVAIL ?auto_357932 ) ( POINTING ?auto_357932 ?auto_357929 ) ( HAVE_IMAGE ?auto_357926 ?auto_357927 ) ( HAVE_IMAGE ?auto_357929 ?auto_357930 ) ( not ( = ?auto_357926 ?auto_357928 ) ) ( not ( = ?auto_357926 ?auto_357929 ) ) ( not ( = ?auto_357926 ?auto_357933 ) ) ( not ( = ?auto_357927 ?auto_357930 ) ) ( not ( = ?auto_357925 ?auto_357930 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357929 ?auto_357927 ?auto_357928 ?auto_357925 )
      ( GET-3IMAGE-VERIFY ?auto_357926 ?auto_357927 ?auto_357928 ?auto_357925 ?auto_357929 ?auto_357930 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_357944 - DIRECTION
      ?auto_357945 - MODE
      ?auto_357946 - DIRECTION
      ?auto_357943 - MODE
      ?auto_357947 - DIRECTION
      ?auto_357948 - MODE
    )
    :vars
    (
      ?auto_357949 - INSTRUMENT
      ?auto_357950 - SATELLITE
      ?auto_357951 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357949 ?auto_357950 ) ( SUPPORTS ?auto_357949 ?auto_357945 ) ( not ( = ?auto_357944 ?auto_357951 ) ) ( HAVE_IMAGE ?auto_357947 ?auto_357948 ) ( not ( = ?auto_357947 ?auto_357944 ) ) ( not ( = ?auto_357947 ?auto_357951 ) ) ( not ( = ?auto_357948 ?auto_357945 ) ) ( CALIBRATION_TARGET ?auto_357949 ?auto_357951 ) ( POWER_AVAIL ?auto_357950 ) ( POINTING ?auto_357950 ?auto_357947 ) ( HAVE_IMAGE ?auto_357946 ?auto_357943 ) ( not ( = ?auto_357944 ?auto_357946 ) ) ( not ( = ?auto_357945 ?auto_357943 ) ) ( not ( = ?auto_357946 ?auto_357947 ) ) ( not ( = ?auto_357946 ?auto_357951 ) ) ( not ( = ?auto_357943 ?auto_357948 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357947 ?auto_357948 ?auto_357944 ?auto_357945 )
      ( GET-3IMAGE-VERIFY ?auto_357944 ?auto_357945 ?auto_357946 ?auto_357943 ?auto_357947 ?auto_357948 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_357982 - DIRECTION
      ?auto_357983 - MODE
      ?auto_357984 - DIRECTION
      ?auto_357981 - MODE
      ?auto_357985 - DIRECTION
      ?auto_357986 - MODE
      ?auto_357987 - DIRECTION
      ?auto_357988 - MODE
    )
    :vars
    (
      ?auto_357989 - INSTRUMENT
      ?auto_357990 - SATELLITE
      ?auto_357991 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_357989 ?auto_357990 ) ( SUPPORTS ?auto_357989 ?auto_357988 ) ( not ( = ?auto_357987 ?auto_357991 ) ) ( HAVE_IMAGE ?auto_357982 ?auto_357983 ) ( not ( = ?auto_357982 ?auto_357987 ) ) ( not ( = ?auto_357982 ?auto_357991 ) ) ( not ( = ?auto_357983 ?auto_357988 ) ) ( CALIBRATION_TARGET ?auto_357989 ?auto_357991 ) ( POWER_AVAIL ?auto_357990 ) ( POINTING ?auto_357990 ?auto_357982 ) ( HAVE_IMAGE ?auto_357984 ?auto_357981 ) ( HAVE_IMAGE ?auto_357985 ?auto_357986 ) ( not ( = ?auto_357982 ?auto_357984 ) ) ( not ( = ?auto_357982 ?auto_357985 ) ) ( not ( = ?auto_357983 ?auto_357981 ) ) ( not ( = ?auto_357983 ?auto_357986 ) ) ( not ( = ?auto_357984 ?auto_357985 ) ) ( not ( = ?auto_357984 ?auto_357987 ) ) ( not ( = ?auto_357984 ?auto_357991 ) ) ( not ( = ?auto_357981 ?auto_357986 ) ) ( not ( = ?auto_357981 ?auto_357988 ) ) ( not ( = ?auto_357985 ?auto_357987 ) ) ( not ( = ?auto_357985 ?auto_357991 ) ) ( not ( = ?auto_357986 ?auto_357988 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357982 ?auto_357983 ?auto_357987 ?auto_357988 )
      ( GET-4IMAGE-VERIFY ?auto_357982 ?auto_357983 ?auto_357984 ?auto_357981 ?auto_357985 ?auto_357986 ?auto_357987 ?auto_357988 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_357993 - DIRECTION
      ?auto_357994 - MODE
      ?auto_357995 - DIRECTION
      ?auto_357992 - MODE
      ?auto_357996 - DIRECTION
      ?auto_357997 - MODE
      ?auto_357998 - DIRECTION
      ?auto_357999 - MODE
    )
    :vars
    (
      ?auto_358000 - INSTRUMENT
      ?auto_358001 - SATELLITE
      ?auto_358002 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_358000 ?auto_358001 ) ( SUPPORTS ?auto_358000 ?auto_357997 ) ( not ( = ?auto_357996 ?auto_358002 ) ) ( HAVE_IMAGE ?auto_357993 ?auto_357992 ) ( not ( = ?auto_357993 ?auto_357996 ) ) ( not ( = ?auto_357993 ?auto_358002 ) ) ( not ( = ?auto_357992 ?auto_357997 ) ) ( CALIBRATION_TARGET ?auto_358000 ?auto_358002 ) ( POWER_AVAIL ?auto_358001 ) ( POINTING ?auto_358001 ?auto_357993 ) ( HAVE_IMAGE ?auto_357993 ?auto_357994 ) ( HAVE_IMAGE ?auto_357995 ?auto_357992 ) ( HAVE_IMAGE ?auto_357998 ?auto_357999 ) ( not ( = ?auto_357993 ?auto_357995 ) ) ( not ( = ?auto_357993 ?auto_357998 ) ) ( not ( = ?auto_357994 ?auto_357992 ) ) ( not ( = ?auto_357994 ?auto_357997 ) ) ( not ( = ?auto_357994 ?auto_357999 ) ) ( not ( = ?auto_357995 ?auto_357996 ) ) ( not ( = ?auto_357995 ?auto_357998 ) ) ( not ( = ?auto_357995 ?auto_358002 ) ) ( not ( = ?auto_357992 ?auto_357999 ) ) ( not ( = ?auto_357996 ?auto_357998 ) ) ( not ( = ?auto_357997 ?auto_357999 ) ) ( not ( = ?auto_357998 ?auto_358002 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_357993 ?auto_357992 ?auto_357996 ?auto_357997 )
      ( GET-4IMAGE-VERIFY ?auto_357993 ?auto_357994 ?auto_357995 ?auto_357992 ?auto_357996 ?auto_357997 ?auto_357998 ?auto_357999 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_358015 - DIRECTION
      ?auto_358016 - MODE
      ?auto_358017 - DIRECTION
      ?auto_358014 - MODE
      ?auto_358018 - DIRECTION
      ?auto_358019 - MODE
      ?auto_358020 - DIRECTION
      ?auto_358021 - MODE
    )
    :vars
    (
      ?auto_358022 - INSTRUMENT
      ?auto_358023 - SATELLITE
      ?auto_358024 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_358022 ?auto_358023 ) ( SUPPORTS ?auto_358022 ?auto_358014 ) ( not ( = ?auto_358017 ?auto_358024 ) ) ( HAVE_IMAGE ?auto_358020 ?auto_358021 ) ( not ( = ?auto_358020 ?auto_358017 ) ) ( not ( = ?auto_358020 ?auto_358024 ) ) ( not ( = ?auto_358021 ?auto_358014 ) ) ( CALIBRATION_TARGET ?auto_358022 ?auto_358024 ) ( POWER_AVAIL ?auto_358023 ) ( POINTING ?auto_358023 ?auto_358020 ) ( HAVE_IMAGE ?auto_358015 ?auto_358016 ) ( HAVE_IMAGE ?auto_358018 ?auto_358019 ) ( not ( = ?auto_358015 ?auto_358017 ) ) ( not ( = ?auto_358015 ?auto_358018 ) ) ( not ( = ?auto_358015 ?auto_358020 ) ) ( not ( = ?auto_358015 ?auto_358024 ) ) ( not ( = ?auto_358016 ?auto_358014 ) ) ( not ( = ?auto_358016 ?auto_358019 ) ) ( not ( = ?auto_358016 ?auto_358021 ) ) ( not ( = ?auto_358017 ?auto_358018 ) ) ( not ( = ?auto_358014 ?auto_358019 ) ) ( not ( = ?auto_358018 ?auto_358020 ) ) ( not ( = ?auto_358018 ?auto_358024 ) ) ( not ( = ?auto_358019 ?auto_358021 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358020 ?auto_358021 ?auto_358017 ?auto_358014 )
      ( GET-4IMAGE-VERIFY ?auto_358015 ?auto_358016 ?auto_358017 ?auto_358014 ?auto_358018 ?auto_358019 ?auto_358020 ?auto_358021 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_358059 - DIRECTION
      ?auto_358060 - MODE
      ?auto_358061 - DIRECTION
      ?auto_358058 - MODE
      ?auto_358062 - DIRECTION
      ?auto_358063 - MODE
      ?auto_358064 - DIRECTION
      ?auto_358065 - MODE
    )
    :vars
    (
      ?auto_358066 - INSTRUMENT
      ?auto_358067 - SATELLITE
      ?auto_358068 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_358066 ?auto_358067 ) ( SUPPORTS ?auto_358066 ?auto_358060 ) ( not ( = ?auto_358059 ?auto_358068 ) ) ( HAVE_IMAGE ?auto_358064 ?auto_358065 ) ( not ( = ?auto_358064 ?auto_358059 ) ) ( not ( = ?auto_358064 ?auto_358068 ) ) ( not ( = ?auto_358065 ?auto_358060 ) ) ( CALIBRATION_TARGET ?auto_358066 ?auto_358068 ) ( POWER_AVAIL ?auto_358067 ) ( POINTING ?auto_358067 ?auto_358064 ) ( HAVE_IMAGE ?auto_358061 ?auto_358058 ) ( HAVE_IMAGE ?auto_358062 ?auto_358063 ) ( not ( = ?auto_358059 ?auto_358061 ) ) ( not ( = ?auto_358059 ?auto_358062 ) ) ( not ( = ?auto_358060 ?auto_358058 ) ) ( not ( = ?auto_358060 ?auto_358063 ) ) ( not ( = ?auto_358061 ?auto_358062 ) ) ( not ( = ?auto_358061 ?auto_358064 ) ) ( not ( = ?auto_358061 ?auto_358068 ) ) ( not ( = ?auto_358058 ?auto_358063 ) ) ( not ( = ?auto_358058 ?auto_358065 ) ) ( not ( = ?auto_358062 ?auto_358064 ) ) ( not ( = ?auto_358062 ?auto_358068 ) ) ( not ( = ?auto_358063 ?auto_358065 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358064 ?auto_358065 ?auto_358059 ?auto_358060 )
      ( GET-4IMAGE-VERIFY ?auto_358059 ?auto_358060 ?auto_358061 ?auto_358058 ?auto_358062 ?auto_358063 ?auto_358064 ?auto_358065 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_358148 - DIRECTION
      ?auto_358149 - MODE
    )
    :vars
    (
      ?auto_358151 - INSTRUMENT
      ?auto_358152 - SATELLITE
      ?auto_358154 - DIRECTION
      ?auto_358153 - DIRECTION
      ?auto_358150 - MODE
      ?auto_358155 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358151 ?auto_358152 ) ( SUPPORTS ?auto_358151 ?auto_358149 ) ( not ( = ?auto_358148 ?auto_358154 ) ) ( HAVE_IMAGE ?auto_358153 ?auto_358150 ) ( not ( = ?auto_358153 ?auto_358148 ) ) ( not ( = ?auto_358153 ?auto_358154 ) ) ( not ( = ?auto_358150 ?auto_358149 ) ) ( CALIBRATION_TARGET ?auto_358151 ?auto_358154 ) ( POINTING ?auto_358152 ?auto_358153 ) ( ON_BOARD ?auto_358155 ?auto_358152 ) ( POWER_ON ?auto_358155 ) ( not ( = ?auto_358151 ?auto_358155 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_358155 ?auto_358152 )
      ( GET-2IMAGE ?auto_358153 ?auto_358150 ?auto_358148 ?auto_358149 )
      ( GET-1IMAGE-VERIFY ?auto_358148 ?auto_358149 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_358157 - DIRECTION
      ?auto_358158 - MODE
      ?auto_358159 - DIRECTION
      ?auto_358156 - MODE
    )
    :vars
    (
      ?auto_358162 - INSTRUMENT
      ?auto_358161 - SATELLITE
      ?auto_358163 - DIRECTION
      ?auto_358160 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358162 ?auto_358161 ) ( SUPPORTS ?auto_358162 ?auto_358156 ) ( not ( = ?auto_358159 ?auto_358163 ) ) ( HAVE_IMAGE ?auto_358157 ?auto_358158 ) ( not ( = ?auto_358157 ?auto_358159 ) ) ( not ( = ?auto_358157 ?auto_358163 ) ) ( not ( = ?auto_358158 ?auto_358156 ) ) ( CALIBRATION_TARGET ?auto_358162 ?auto_358163 ) ( POINTING ?auto_358161 ?auto_358157 ) ( ON_BOARD ?auto_358160 ?auto_358161 ) ( POWER_ON ?auto_358160 ) ( not ( = ?auto_358162 ?auto_358160 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_358159 ?auto_358156 )
      ( GET-2IMAGE-VERIFY ?auto_358157 ?auto_358158 ?auto_358159 ?auto_358156 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_358165 - DIRECTION
      ?auto_358166 - MODE
      ?auto_358167 - DIRECTION
      ?auto_358164 - MODE
    )
    :vars
    (
      ?auto_358170 - INSTRUMENT
      ?auto_358168 - SATELLITE
      ?auto_358169 - DIRECTION
      ?auto_358171 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358170 ?auto_358168 ) ( SUPPORTS ?auto_358170 ?auto_358166 ) ( not ( = ?auto_358165 ?auto_358169 ) ) ( HAVE_IMAGE ?auto_358167 ?auto_358164 ) ( not ( = ?auto_358167 ?auto_358165 ) ) ( not ( = ?auto_358167 ?auto_358169 ) ) ( not ( = ?auto_358164 ?auto_358166 ) ) ( CALIBRATION_TARGET ?auto_358170 ?auto_358169 ) ( POINTING ?auto_358168 ?auto_358167 ) ( ON_BOARD ?auto_358171 ?auto_358168 ) ( POWER_ON ?auto_358171 ) ( not ( = ?auto_358170 ?auto_358171 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358167 ?auto_358164 ?auto_358165 ?auto_358166 )
      ( GET-2IMAGE-VERIFY ?auto_358165 ?auto_358166 ?auto_358167 ?auto_358164 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_358183 - DIRECTION
      ?auto_358184 - MODE
      ?auto_358185 - DIRECTION
      ?auto_358182 - MODE
      ?auto_358186 - DIRECTION
      ?auto_358187 - MODE
    )
    :vars
    (
      ?auto_358190 - INSTRUMENT
      ?auto_358188 - SATELLITE
      ?auto_358189 - DIRECTION
      ?auto_358191 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358190 ?auto_358188 ) ( SUPPORTS ?auto_358190 ?auto_358187 ) ( not ( = ?auto_358186 ?auto_358189 ) ) ( HAVE_IMAGE ?auto_358183 ?auto_358184 ) ( not ( = ?auto_358183 ?auto_358186 ) ) ( not ( = ?auto_358183 ?auto_358189 ) ) ( not ( = ?auto_358184 ?auto_358187 ) ) ( CALIBRATION_TARGET ?auto_358190 ?auto_358189 ) ( POINTING ?auto_358188 ?auto_358183 ) ( ON_BOARD ?auto_358191 ?auto_358188 ) ( POWER_ON ?auto_358191 ) ( not ( = ?auto_358190 ?auto_358191 ) ) ( HAVE_IMAGE ?auto_358185 ?auto_358182 ) ( not ( = ?auto_358183 ?auto_358185 ) ) ( not ( = ?auto_358184 ?auto_358182 ) ) ( not ( = ?auto_358185 ?auto_358186 ) ) ( not ( = ?auto_358185 ?auto_358189 ) ) ( not ( = ?auto_358182 ?auto_358187 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358183 ?auto_358184 ?auto_358186 ?auto_358187 )
      ( GET-3IMAGE-VERIFY ?auto_358183 ?auto_358184 ?auto_358185 ?auto_358182 ?auto_358186 ?auto_358187 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_358193 - DIRECTION
      ?auto_358194 - MODE
      ?auto_358195 - DIRECTION
      ?auto_358192 - MODE
      ?auto_358196 - DIRECTION
      ?auto_358197 - MODE
    )
    :vars
    (
      ?auto_358200 - INSTRUMENT
      ?auto_358198 - SATELLITE
      ?auto_358199 - DIRECTION
      ?auto_358201 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358200 ?auto_358198 ) ( SUPPORTS ?auto_358200 ?auto_358192 ) ( not ( = ?auto_358195 ?auto_358199 ) ) ( HAVE_IMAGE ?auto_358193 ?auto_358194 ) ( not ( = ?auto_358193 ?auto_358195 ) ) ( not ( = ?auto_358193 ?auto_358199 ) ) ( not ( = ?auto_358194 ?auto_358192 ) ) ( CALIBRATION_TARGET ?auto_358200 ?auto_358199 ) ( POINTING ?auto_358198 ?auto_358193 ) ( ON_BOARD ?auto_358201 ?auto_358198 ) ( POWER_ON ?auto_358201 ) ( not ( = ?auto_358200 ?auto_358201 ) ) ( HAVE_IMAGE ?auto_358196 ?auto_358197 ) ( not ( = ?auto_358193 ?auto_358196 ) ) ( not ( = ?auto_358194 ?auto_358197 ) ) ( not ( = ?auto_358195 ?auto_358196 ) ) ( not ( = ?auto_358192 ?auto_358197 ) ) ( not ( = ?auto_358196 ?auto_358199 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358193 ?auto_358194 ?auto_358195 ?auto_358192 )
      ( GET-3IMAGE-VERIFY ?auto_358193 ?auto_358194 ?auto_358195 ?auto_358192 ?auto_358196 ?auto_358197 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_358213 - DIRECTION
      ?auto_358214 - MODE
      ?auto_358215 - DIRECTION
      ?auto_358212 - MODE
      ?auto_358216 - DIRECTION
      ?auto_358217 - MODE
    )
    :vars
    (
      ?auto_358220 - INSTRUMENT
      ?auto_358218 - SATELLITE
      ?auto_358219 - DIRECTION
      ?auto_358221 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358220 ?auto_358218 ) ( SUPPORTS ?auto_358220 ?auto_358214 ) ( not ( = ?auto_358213 ?auto_358219 ) ) ( HAVE_IMAGE ?auto_358216 ?auto_358217 ) ( not ( = ?auto_358216 ?auto_358213 ) ) ( not ( = ?auto_358216 ?auto_358219 ) ) ( not ( = ?auto_358217 ?auto_358214 ) ) ( CALIBRATION_TARGET ?auto_358220 ?auto_358219 ) ( POINTING ?auto_358218 ?auto_358216 ) ( ON_BOARD ?auto_358221 ?auto_358218 ) ( POWER_ON ?auto_358221 ) ( not ( = ?auto_358220 ?auto_358221 ) ) ( HAVE_IMAGE ?auto_358215 ?auto_358212 ) ( not ( = ?auto_358213 ?auto_358215 ) ) ( not ( = ?auto_358214 ?auto_358212 ) ) ( not ( = ?auto_358215 ?auto_358216 ) ) ( not ( = ?auto_358215 ?auto_358219 ) ) ( not ( = ?auto_358212 ?auto_358217 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358216 ?auto_358217 ?auto_358213 ?auto_358214 )
      ( GET-3IMAGE-VERIFY ?auto_358213 ?auto_358214 ?auto_358215 ?auto_358212 ?auto_358216 ?auto_358217 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_358255 - DIRECTION
      ?auto_358256 - MODE
      ?auto_358257 - DIRECTION
      ?auto_358254 - MODE
      ?auto_358258 - DIRECTION
      ?auto_358259 - MODE
      ?auto_358260 - DIRECTION
      ?auto_358261 - MODE
    )
    :vars
    (
      ?auto_358264 - INSTRUMENT
      ?auto_358262 - SATELLITE
      ?auto_358263 - DIRECTION
      ?auto_358265 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358264 ?auto_358262 ) ( SUPPORTS ?auto_358264 ?auto_358261 ) ( not ( = ?auto_358260 ?auto_358263 ) ) ( HAVE_IMAGE ?auto_358255 ?auto_358259 ) ( not ( = ?auto_358255 ?auto_358260 ) ) ( not ( = ?auto_358255 ?auto_358263 ) ) ( not ( = ?auto_358259 ?auto_358261 ) ) ( CALIBRATION_TARGET ?auto_358264 ?auto_358263 ) ( POINTING ?auto_358262 ?auto_358255 ) ( ON_BOARD ?auto_358265 ?auto_358262 ) ( POWER_ON ?auto_358265 ) ( not ( = ?auto_358264 ?auto_358265 ) ) ( HAVE_IMAGE ?auto_358255 ?auto_358256 ) ( HAVE_IMAGE ?auto_358257 ?auto_358254 ) ( HAVE_IMAGE ?auto_358258 ?auto_358259 ) ( not ( = ?auto_358255 ?auto_358257 ) ) ( not ( = ?auto_358255 ?auto_358258 ) ) ( not ( = ?auto_358256 ?auto_358254 ) ) ( not ( = ?auto_358256 ?auto_358259 ) ) ( not ( = ?auto_358256 ?auto_358261 ) ) ( not ( = ?auto_358257 ?auto_358258 ) ) ( not ( = ?auto_358257 ?auto_358260 ) ) ( not ( = ?auto_358257 ?auto_358263 ) ) ( not ( = ?auto_358254 ?auto_358259 ) ) ( not ( = ?auto_358254 ?auto_358261 ) ) ( not ( = ?auto_358258 ?auto_358260 ) ) ( not ( = ?auto_358258 ?auto_358263 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358255 ?auto_358259 ?auto_358260 ?auto_358261 )
      ( GET-4IMAGE-VERIFY ?auto_358255 ?auto_358256 ?auto_358257 ?auto_358254 ?auto_358258 ?auto_358259 ?auto_358260 ?auto_358261 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_358267 - DIRECTION
      ?auto_358268 - MODE
      ?auto_358269 - DIRECTION
      ?auto_358266 - MODE
      ?auto_358270 - DIRECTION
      ?auto_358271 - MODE
      ?auto_358272 - DIRECTION
      ?auto_358273 - MODE
    )
    :vars
    (
      ?auto_358276 - INSTRUMENT
      ?auto_358274 - SATELLITE
      ?auto_358275 - DIRECTION
      ?auto_358277 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358276 ?auto_358274 ) ( SUPPORTS ?auto_358276 ?auto_358271 ) ( not ( = ?auto_358270 ?auto_358275 ) ) ( HAVE_IMAGE ?auto_358272 ?auto_358268 ) ( not ( = ?auto_358272 ?auto_358270 ) ) ( not ( = ?auto_358272 ?auto_358275 ) ) ( not ( = ?auto_358268 ?auto_358271 ) ) ( CALIBRATION_TARGET ?auto_358276 ?auto_358275 ) ( POINTING ?auto_358274 ?auto_358272 ) ( ON_BOARD ?auto_358277 ?auto_358274 ) ( POWER_ON ?auto_358277 ) ( not ( = ?auto_358276 ?auto_358277 ) ) ( HAVE_IMAGE ?auto_358267 ?auto_358268 ) ( HAVE_IMAGE ?auto_358269 ?auto_358266 ) ( HAVE_IMAGE ?auto_358272 ?auto_358273 ) ( not ( = ?auto_358267 ?auto_358269 ) ) ( not ( = ?auto_358267 ?auto_358270 ) ) ( not ( = ?auto_358267 ?auto_358272 ) ) ( not ( = ?auto_358267 ?auto_358275 ) ) ( not ( = ?auto_358268 ?auto_358266 ) ) ( not ( = ?auto_358268 ?auto_358273 ) ) ( not ( = ?auto_358269 ?auto_358270 ) ) ( not ( = ?auto_358269 ?auto_358272 ) ) ( not ( = ?auto_358269 ?auto_358275 ) ) ( not ( = ?auto_358266 ?auto_358271 ) ) ( not ( = ?auto_358266 ?auto_358273 ) ) ( not ( = ?auto_358271 ?auto_358273 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358272 ?auto_358268 ?auto_358270 ?auto_358271 )
      ( GET-4IMAGE-VERIFY ?auto_358267 ?auto_358268 ?auto_358269 ?auto_358266 ?auto_358270 ?auto_358271 ?auto_358272 ?auto_358273 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_358291 - DIRECTION
      ?auto_358292 - MODE
      ?auto_358293 - DIRECTION
      ?auto_358290 - MODE
      ?auto_358294 - DIRECTION
      ?auto_358295 - MODE
      ?auto_358296 - DIRECTION
      ?auto_358297 - MODE
    )
    :vars
    (
      ?auto_358300 - INSTRUMENT
      ?auto_358298 - SATELLITE
      ?auto_358299 - DIRECTION
      ?auto_358301 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358300 ?auto_358298 ) ( SUPPORTS ?auto_358300 ?auto_358290 ) ( not ( = ?auto_358293 ?auto_358299 ) ) ( HAVE_IMAGE ?auto_358291 ?auto_358297 ) ( not ( = ?auto_358291 ?auto_358293 ) ) ( not ( = ?auto_358291 ?auto_358299 ) ) ( not ( = ?auto_358297 ?auto_358290 ) ) ( CALIBRATION_TARGET ?auto_358300 ?auto_358299 ) ( POINTING ?auto_358298 ?auto_358291 ) ( ON_BOARD ?auto_358301 ?auto_358298 ) ( POWER_ON ?auto_358301 ) ( not ( = ?auto_358300 ?auto_358301 ) ) ( HAVE_IMAGE ?auto_358291 ?auto_358292 ) ( HAVE_IMAGE ?auto_358294 ?auto_358295 ) ( HAVE_IMAGE ?auto_358296 ?auto_358297 ) ( not ( = ?auto_358291 ?auto_358294 ) ) ( not ( = ?auto_358291 ?auto_358296 ) ) ( not ( = ?auto_358292 ?auto_358290 ) ) ( not ( = ?auto_358292 ?auto_358295 ) ) ( not ( = ?auto_358292 ?auto_358297 ) ) ( not ( = ?auto_358293 ?auto_358294 ) ) ( not ( = ?auto_358293 ?auto_358296 ) ) ( not ( = ?auto_358290 ?auto_358295 ) ) ( not ( = ?auto_358294 ?auto_358296 ) ) ( not ( = ?auto_358294 ?auto_358299 ) ) ( not ( = ?auto_358295 ?auto_358297 ) ) ( not ( = ?auto_358296 ?auto_358299 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358291 ?auto_358297 ?auto_358293 ?auto_358290 )
      ( GET-4IMAGE-VERIFY ?auto_358291 ?auto_358292 ?auto_358293 ?auto_358290 ?auto_358294 ?auto_358295 ?auto_358296 ?auto_358297 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_358339 - DIRECTION
      ?auto_358340 - MODE
      ?auto_358341 - DIRECTION
      ?auto_358338 - MODE
      ?auto_358342 - DIRECTION
      ?auto_358343 - MODE
      ?auto_358344 - DIRECTION
      ?auto_358345 - MODE
    )
    :vars
    (
      ?auto_358348 - INSTRUMENT
      ?auto_358346 - SATELLITE
      ?auto_358347 - DIRECTION
      ?auto_358349 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358348 ?auto_358346 ) ( SUPPORTS ?auto_358348 ?auto_358340 ) ( not ( = ?auto_358339 ?auto_358347 ) ) ( HAVE_IMAGE ?auto_358342 ?auto_358338 ) ( not ( = ?auto_358342 ?auto_358339 ) ) ( not ( = ?auto_358342 ?auto_358347 ) ) ( not ( = ?auto_358338 ?auto_358340 ) ) ( CALIBRATION_TARGET ?auto_358348 ?auto_358347 ) ( POINTING ?auto_358346 ?auto_358342 ) ( ON_BOARD ?auto_358349 ?auto_358346 ) ( POWER_ON ?auto_358349 ) ( not ( = ?auto_358348 ?auto_358349 ) ) ( HAVE_IMAGE ?auto_358341 ?auto_358338 ) ( HAVE_IMAGE ?auto_358342 ?auto_358343 ) ( HAVE_IMAGE ?auto_358344 ?auto_358345 ) ( not ( = ?auto_358339 ?auto_358341 ) ) ( not ( = ?auto_358339 ?auto_358344 ) ) ( not ( = ?auto_358340 ?auto_358343 ) ) ( not ( = ?auto_358340 ?auto_358345 ) ) ( not ( = ?auto_358341 ?auto_358342 ) ) ( not ( = ?auto_358341 ?auto_358344 ) ) ( not ( = ?auto_358341 ?auto_358347 ) ) ( not ( = ?auto_358338 ?auto_358343 ) ) ( not ( = ?auto_358338 ?auto_358345 ) ) ( not ( = ?auto_358342 ?auto_358344 ) ) ( not ( = ?auto_358343 ?auto_358345 ) ) ( not ( = ?auto_358344 ?auto_358347 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358342 ?auto_358338 ?auto_358339 ?auto_358340 )
      ( GET-4IMAGE-VERIFY ?auto_358339 ?auto_358340 ?auto_358341 ?auto_358338 ?auto_358342 ?auto_358343 ?auto_358344 ?auto_358345 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_358436 - DIRECTION
      ?auto_358437 - MODE
    )
    :vars
    (
      ?auto_358441 - INSTRUMENT
      ?auto_358438 - SATELLITE
      ?auto_358439 - DIRECTION
      ?auto_358440 - DIRECTION
      ?auto_358443 - MODE
      ?auto_358442 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358441 ?auto_358438 ) ( SUPPORTS ?auto_358441 ?auto_358437 ) ( not ( = ?auto_358436 ?auto_358439 ) ) ( not ( = ?auto_358440 ?auto_358436 ) ) ( not ( = ?auto_358440 ?auto_358439 ) ) ( not ( = ?auto_358443 ?auto_358437 ) ) ( CALIBRATION_TARGET ?auto_358441 ?auto_358439 ) ( POINTING ?auto_358438 ?auto_358440 ) ( ON_BOARD ?auto_358442 ?auto_358438 ) ( POWER_ON ?auto_358442 ) ( not ( = ?auto_358441 ?auto_358442 ) ) ( CALIBRATED ?auto_358442 ) ( SUPPORTS ?auto_358442 ?auto_358443 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_358440 ?auto_358443 )
      ( GET-2IMAGE ?auto_358440 ?auto_358443 ?auto_358436 ?auto_358437 )
      ( GET-1IMAGE-VERIFY ?auto_358436 ?auto_358437 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_358445 - DIRECTION
      ?auto_358446 - MODE
      ?auto_358447 - DIRECTION
      ?auto_358444 - MODE
    )
    :vars
    (
      ?auto_358448 - INSTRUMENT
      ?auto_358450 - SATELLITE
      ?auto_358449 - DIRECTION
      ?auto_358451 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358448 ?auto_358450 ) ( SUPPORTS ?auto_358448 ?auto_358444 ) ( not ( = ?auto_358447 ?auto_358449 ) ) ( not ( = ?auto_358445 ?auto_358447 ) ) ( not ( = ?auto_358445 ?auto_358449 ) ) ( not ( = ?auto_358446 ?auto_358444 ) ) ( CALIBRATION_TARGET ?auto_358448 ?auto_358449 ) ( POINTING ?auto_358450 ?auto_358445 ) ( ON_BOARD ?auto_358451 ?auto_358450 ) ( POWER_ON ?auto_358451 ) ( not ( = ?auto_358448 ?auto_358451 ) ) ( CALIBRATED ?auto_358451 ) ( SUPPORTS ?auto_358451 ?auto_358446 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_358447 ?auto_358444 )
      ( GET-2IMAGE-VERIFY ?auto_358445 ?auto_358446 ?auto_358447 ?auto_358444 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_358453 - DIRECTION
      ?auto_358454 - MODE
      ?auto_358455 - DIRECTION
      ?auto_358452 - MODE
    )
    :vars
    (
      ?auto_358456 - INSTRUMENT
      ?auto_358457 - SATELLITE
      ?auto_358459 - DIRECTION
      ?auto_358458 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358456 ?auto_358457 ) ( SUPPORTS ?auto_358456 ?auto_358454 ) ( not ( = ?auto_358453 ?auto_358459 ) ) ( not ( = ?auto_358455 ?auto_358453 ) ) ( not ( = ?auto_358455 ?auto_358459 ) ) ( not ( = ?auto_358452 ?auto_358454 ) ) ( CALIBRATION_TARGET ?auto_358456 ?auto_358459 ) ( POINTING ?auto_358457 ?auto_358455 ) ( ON_BOARD ?auto_358458 ?auto_358457 ) ( POWER_ON ?auto_358458 ) ( not ( = ?auto_358456 ?auto_358458 ) ) ( CALIBRATED ?auto_358458 ) ( SUPPORTS ?auto_358458 ?auto_358452 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358455 ?auto_358452 ?auto_358453 ?auto_358454 )
      ( GET-2IMAGE-VERIFY ?auto_358453 ?auto_358454 ?auto_358455 ?auto_358452 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_358724 - DIRECTION
      ?auto_358725 - MODE
    )
    :vars
    (
      ?auto_358726 - INSTRUMENT
      ?auto_358727 - SATELLITE
      ?auto_358729 - DIRECTION
      ?auto_358730 - DIRECTION
      ?auto_358731 - MODE
      ?auto_358728 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358726 ?auto_358727 ) ( SUPPORTS ?auto_358726 ?auto_358725 ) ( not ( = ?auto_358724 ?auto_358729 ) ) ( not ( = ?auto_358730 ?auto_358724 ) ) ( not ( = ?auto_358730 ?auto_358729 ) ) ( not ( = ?auto_358731 ?auto_358725 ) ) ( CALIBRATION_TARGET ?auto_358726 ?auto_358729 ) ( ON_BOARD ?auto_358728 ?auto_358727 ) ( POWER_ON ?auto_358728 ) ( not ( = ?auto_358726 ?auto_358728 ) ) ( CALIBRATED ?auto_358728 ) ( SUPPORTS ?auto_358728 ?auto_358731 ) ( POINTING ?auto_358727 ?auto_358729 ) )
    :subtasks
    ( ( !TURN_TO ?auto_358727 ?auto_358730 ?auto_358729 )
      ( GET-2IMAGE ?auto_358730 ?auto_358731 ?auto_358724 ?auto_358725 )
      ( GET-1IMAGE-VERIFY ?auto_358724 ?auto_358725 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_358733 - DIRECTION
      ?auto_358734 - MODE
      ?auto_358735 - DIRECTION
      ?auto_358732 - MODE
    )
    :vars
    (
      ?auto_358737 - INSTRUMENT
      ?auto_358739 - SATELLITE
      ?auto_358738 - DIRECTION
      ?auto_358736 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358737 ?auto_358739 ) ( SUPPORTS ?auto_358737 ?auto_358732 ) ( not ( = ?auto_358735 ?auto_358738 ) ) ( not ( = ?auto_358733 ?auto_358735 ) ) ( not ( = ?auto_358733 ?auto_358738 ) ) ( not ( = ?auto_358734 ?auto_358732 ) ) ( CALIBRATION_TARGET ?auto_358737 ?auto_358738 ) ( ON_BOARD ?auto_358736 ?auto_358739 ) ( POWER_ON ?auto_358736 ) ( not ( = ?auto_358737 ?auto_358736 ) ) ( CALIBRATED ?auto_358736 ) ( SUPPORTS ?auto_358736 ?auto_358734 ) ( POINTING ?auto_358739 ?auto_358738 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_358735 ?auto_358732 )
      ( GET-2IMAGE-VERIFY ?auto_358733 ?auto_358734 ?auto_358735 ?auto_358732 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_358741 - DIRECTION
      ?auto_358742 - MODE
      ?auto_358743 - DIRECTION
      ?auto_358740 - MODE
    )
    :vars
    (
      ?auto_358747 - INSTRUMENT
      ?auto_358744 - SATELLITE
      ?auto_358745 - DIRECTION
      ?auto_358746 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_358747 ?auto_358744 ) ( SUPPORTS ?auto_358747 ?auto_358742 ) ( not ( = ?auto_358741 ?auto_358745 ) ) ( not ( = ?auto_358743 ?auto_358741 ) ) ( not ( = ?auto_358743 ?auto_358745 ) ) ( not ( = ?auto_358740 ?auto_358742 ) ) ( CALIBRATION_TARGET ?auto_358747 ?auto_358745 ) ( ON_BOARD ?auto_358746 ?auto_358744 ) ( POWER_ON ?auto_358746 ) ( not ( = ?auto_358747 ?auto_358746 ) ) ( CALIBRATED ?auto_358746 ) ( SUPPORTS ?auto_358746 ?auto_358740 ) ( POINTING ?auto_358744 ?auto_358745 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_358743 ?auto_358740 ?auto_358741 ?auto_358742 )
      ( GET-2IMAGE-VERIFY ?auto_358741 ?auto_358742 ?auto_358743 ?auto_358740 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_359012 - DIRECTION
      ?auto_359013 - MODE
    )
    :vars
    (
      ?auto_359019 - INSTRUMENT
      ?auto_359016 - SATELLITE
      ?auto_359017 - DIRECTION
      ?auto_359014 - DIRECTION
      ?auto_359015 - MODE
      ?auto_359018 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_359019 ?auto_359016 ) ( SUPPORTS ?auto_359019 ?auto_359013 ) ( not ( = ?auto_359012 ?auto_359017 ) ) ( not ( = ?auto_359014 ?auto_359012 ) ) ( not ( = ?auto_359014 ?auto_359017 ) ) ( not ( = ?auto_359015 ?auto_359013 ) ) ( CALIBRATION_TARGET ?auto_359019 ?auto_359017 ) ( ON_BOARD ?auto_359018 ?auto_359016 ) ( POWER_ON ?auto_359018 ) ( not ( = ?auto_359019 ?auto_359018 ) ) ( SUPPORTS ?auto_359018 ?auto_359015 ) ( POINTING ?auto_359016 ?auto_359017 ) ( CALIBRATION_TARGET ?auto_359018 ?auto_359017 ) ( NOT_CALIBRATED ?auto_359018 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_359016 ?auto_359018 ?auto_359017 )
      ( GET-2IMAGE ?auto_359014 ?auto_359015 ?auto_359012 ?auto_359013 )
      ( GET-1IMAGE-VERIFY ?auto_359012 ?auto_359013 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_359021 - DIRECTION
      ?auto_359022 - MODE
      ?auto_359023 - DIRECTION
      ?auto_359020 - MODE
    )
    :vars
    (
      ?auto_359027 - INSTRUMENT
      ?auto_359025 - SATELLITE
      ?auto_359026 - DIRECTION
      ?auto_359024 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_359027 ?auto_359025 ) ( SUPPORTS ?auto_359027 ?auto_359020 ) ( not ( = ?auto_359023 ?auto_359026 ) ) ( not ( = ?auto_359021 ?auto_359023 ) ) ( not ( = ?auto_359021 ?auto_359026 ) ) ( not ( = ?auto_359022 ?auto_359020 ) ) ( CALIBRATION_TARGET ?auto_359027 ?auto_359026 ) ( ON_BOARD ?auto_359024 ?auto_359025 ) ( POWER_ON ?auto_359024 ) ( not ( = ?auto_359027 ?auto_359024 ) ) ( SUPPORTS ?auto_359024 ?auto_359022 ) ( POINTING ?auto_359025 ?auto_359026 ) ( CALIBRATION_TARGET ?auto_359024 ?auto_359026 ) ( NOT_CALIBRATED ?auto_359024 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_359023 ?auto_359020 )
      ( GET-2IMAGE-VERIFY ?auto_359021 ?auto_359022 ?auto_359023 ?auto_359020 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_359029 - DIRECTION
      ?auto_359030 - MODE
      ?auto_359031 - DIRECTION
      ?auto_359028 - MODE
    )
    :vars
    (
      ?auto_359033 - INSTRUMENT
      ?auto_359032 - SATELLITE
      ?auto_359035 - DIRECTION
      ?auto_359034 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_359033 ?auto_359032 ) ( SUPPORTS ?auto_359033 ?auto_359030 ) ( not ( = ?auto_359029 ?auto_359035 ) ) ( not ( = ?auto_359031 ?auto_359029 ) ) ( not ( = ?auto_359031 ?auto_359035 ) ) ( not ( = ?auto_359028 ?auto_359030 ) ) ( CALIBRATION_TARGET ?auto_359033 ?auto_359035 ) ( ON_BOARD ?auto_359034 ?auto_359032 ) ( POWER_ON ?auto_359034 ) ( not ( = ?auto_359033 ?auto_359034 ) ) ( SUPPORTS ?auto_359034 ?auto_359028 ) ( POINTING ?auto_359032 ?auto_359035 ) ( CALIBRATION_TARGET ?auto_359034 ?auto_359035 ) ( NOT_CALIBRATED ?auto_359034 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_359031 ?auto_359028 ?auto_359029 ?auto_359030 )
      ( GET-2IMAGE-VERIFY ?auto_359029 ?auto_359030 ?auto_359031 ?auto_359028 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_361385 - DIRECTION
      ?auto_361386 - MODE
      ?auto_361387 - DIRECTION
      ?auto_361384 - MODE
      ?auto_361388 - DIRECTION
      ?auto_361389 - MODE
    )
    :vars
    (
      ?auto_361391 - INSTRUMENT
      ?auto_361394 - SATELLITE
      ?auto_361393 - DIRECTION
      ?auto_361392 - DIRECTION
      ?auto_361390 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_361391 ) ( ON_BOARD ?auto_361391 ?auto_361394 ) ( SUPPORTS ?auto_361391 ?auto_361389 ) ( POWER_ON ?auto_361391 ) ( POINTING ?auto_361394 ?auto_361393 ) ( not ( = ?auto_361388 ?auto_361393 ) ) ( HAVE_IMAGE ?auto_361392 ?auto_361390 ) ( not ( = ?auto_361392 ?auto_361388 ) ) ( not ( = ?auto_361392 ?auto_361393 ) ) ( not ( = ?auto_361390 ?auto_361389 ) ) ( HAVE_IMAGE ?auto_361385 ?auto_361386 ) ( HAVE_IMAGE ?auto_361387 ?auto_361384 ) ( not ( = ?auto_361385 ?auto_361387 ) ) ( not ( = ?auto_361385 ?auto_361388 ) ) ( not ( = ?auto_361385 ?auto_361393 ) ) ( not ( = ?auto_361385 ?auto_361392 ) ) ( not ( = ?auto_361386 ?auto_361384 ) ) ( not ( = ?auto_361386 ?auto_361389 ) ) ( not ( = ?auto_361386 ?auto_361390 ) ) ( not ( = ?auto_361387 ?auto_361388 ) ) ( not ( = ?auto_361387 ?auto_361393 ) ) ( not ( = ?auto_361387 ?auto_361392 ) ) ( not ( = ?auto_361384 ?auto_361389 ) ) ( not ( = ?auto_361384 ?auto_361390 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361392 ?auto_361390 ?auto_361388 ?auto_361389 )
      ( GET-3IMAGE-VERIFY ?auto_361385 ?auto_361386 ?auto_361387 ?auto_361384 ?auto_361388 ?auto_361389 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_361402 - DIRECTION
      ?auto_361403 - MODE
      ?auto_361404 - DIRECTION
      ?auto_361401 - MODE
      ?auto_361405 - DIRECTION
      ?auto_361406 - MODE
    )
    :vars
    (
      ?auto_361408 - INSTRUMENT
      ?auto_361411 - SATELLITE
      ?auto_361410 - DIRECTION
      ?auto_361409 - DIRECTION
      ?auto_361407 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_361408 ) ( ON_BOARD ?auto_361408 ?auto_361411 ) ( SUPPORTS ?auto_361408 ?auto_361401 ) ( POWER_ON ?auto_361408 ) ( POINTING ?auto_361411 ?auto_361410 ) ( not ( = ?auto_361404 ?auto_361410 ) ) ( HAVE_IMAGE ?auto_361409 ?auto_361407 ) ( not ( = ?auto_361409 ?auto_361404 ) ) ( not ( = ?auto_361409 ?auto_361410 ) ) ( not ( = ?auto_361407 ?auto_361401 ) ) ( HAVE_IMAGE ?auto_361402 ?auto_361403 ) ( HAVE_IMAGE ?auto_361405 ?auto_361406 ) ( not ( = ?auto_361402 ?auto_361404 ) ) ( not ( = ?auto_361402 ?auto_361405 ) ) ( not ( = ?auto_361402 ?auto_361410 ) ) ( not ( = ?auto_361402 ?auto_361409 ) ) ( not ( = ?auto_361403 ?auto_361401 ) ) ( not ( = ?auto_361403 ?auto_361406 ) ) ( not ( = ?auto_361403 ?auto_361407 ) ) ( not ( = ?auto_361404 ?auto_361405 ) ) ( not ( = ?auto_361401 ?auto_361406 ) ) ( not ( = ?auto_361405 ?auto_361410 ) ) ( not ( = ?auto_361405 ?auto_361409 ) ) ( not ( = ?auto_361406 ?auto_361407 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361409 ?auto_361407 ?auto_361404 ?auto_361401 )
      ( GET-3IMAGE-VERIFY ?auto_361402 ?auto_361403 ?auto_361404 ?auto_361401 ?auto_361405 ?auto_361406 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_361424 - DIRECTION
      ?auto_361425 - MODE
      ?auto_361426 - DIRECTION
      ?auto_361423 - MODE
      ?auto_361427 - DIRECTION
      ?auto_361428 - MODE
    )
    :vars
    (
      ?auto_361429 - INSTRUMENT
      ?auto_361431 - SATELLITE
      ?auto_361430 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361429 ) ( ON_BOARD ?auto_361429 ?auto_361431 ) ( SUPPORTS ?auto_361429 ?auto_361425 ) ( POWER_ON ?auto_361429 ) ( POINTING ?auto_361431 ?auto_361430 ) ( not ( = ?auto_361424 ?auto_361430 ) ) ( HAVE_IMAGE ?auto_361426 ?auto_361423 ) ( not ( = ?auto_361426 ?auto_361424 ) ) ( not ( = ?auto_361426 ?auto_361430 ) ) ( not ( = ?auto_361423 ?auto_361425 ) ) ( HAVE_IMAGE ?auto_361427 ?auto_361428 ) ( not ( = ?auto_361424 ?auto_361427 ) ) ( not ( = ?auto_361425 ?auto_361428 ) ) ( not ( = ?auto_361426 ?auto_361427 ) ) ( not ( = ?auto_361423 ?auto_361428 ) ) ( not ( = ?auto_361427 ?auto_361430 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361426 ?auto_361423 ?auto_361424 ?auto_361425 )
      ( GET-3IMAGE-VERIFY ?auto_361424 ?auto_361425 ?auto_361426 ?auto_361423 ?auto_361427 ?auto_361428 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_361454 - DIRECTION
      ?auto_361455 - MODE
      ?auto_361456 - DIRECTION
      ?auto_361453 - MODE
      ?auto_361457 - DIRECTION
      ?auto_361458 - MODE
    )
    :vars
    (
      ?auto_361460 - INSTRUMENT
      ?auto_361463 - SATELLITE
      ?auto_361462 - DIRECTION
      ?auto_361461 - DIRECTION
      ?auto_361459 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_361460 ) ( ON_BOARD ?auto_361460 ?auto_361463 ) ( SUPPORTS ?auto_361460 ?auto_361455 ) ( POWER_ON ?auto_361460 ) ( POINTING ?auto_361463 ?auto_361462 ) ( not ( = ?auto_361454 ?auto_361462 ) ) ( HAVE_IMAGE ?auto_361461 ?auto_361459 ) ( not ( = ?auto_361461 ?auto_361454 ) ) ( not ( = ?auto_361461 ?auto_361462 ) ) ( not ( = ?auto_361459 ?auto_361455 ) ) ( HAVE_IMAGE ?auto_361456 ?auto_361453 ) ( HAVE_IMAGE ?auto_361457 ?auto_361458 ) ( not ( = ?auto_361454 ?auto_361456 ) ) ( not ( = ?auto_361454 ?auto_361457 ) ) ( not ( = ?auto_361455 ?auto_361453 ) ) ( not ( = ?auto_361455 ?auto_361458 ) ) ( not ( = ?auto_361456 ?auto_361457 ) ) ( not ( = ?auto_361456 ?auto_361462 ) ) ( not ( = ?auto_361456 ?auto_361461 ) ) ( not ( = ?auto_361453 ?auto_361458 ) ) ( not ( = ?auto_361453 ?auto_361459 ) ) ( not ( = ?auto_361457 ?auto_361462 ) ) ( not ( = ?auto_361457 ?auto_361461 ) ) ( not ( = ?auto_361458 ?auto_361459 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361461 ?auto_361459 ?auto_361454 ?auto_361455 )
      ( GET-3IMAGE-VERIFY ?auto_361454 ?auto_361455 ?auto_361456 ?auto_361453 ?auto_361457 ?auto_361458 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361507 - DIRECTION
      ?auto_361508 - MODE
      ?auto_361509 - DIRECTION
      ?auto_361506 - MODE
      ?auto_361510 - DIRECTION
      ?auto_361511 - MODE
      ?auto_361512 - DIRECTION
      ?auto_361513 - MODE
    )
    :vars
    (
      ?auto_361514 - INSTRUMENT
      ?auto_361516 - SATELLITE
      ?auto_361515 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361514 ) ( ON_BOARD ?auto_361514 ?auto_361516 ) ( SUPPORTS ?auto_361514 ?auto_361513 ) ( POWER_ON ?auto_361514 ) ( POINTING ?auto_361516 ?auto_361515 ) ( not ( = ?auto_361512 ?auto_361515 ) ) ( HAVE_IMAGE ?auto_361509 ?auto_361506 ) ( not ( = ?auto_361509 ?auto_361512 ) ) ( not ( = ?auto_361509 ?auto_361515 ) ) ( not ( = ?auto_361506 ?auto_361513 ) ) ( HAVE_IMAGE ?auto_361507 ?auto_361508 ) ( HAVE_IMAGE ?auto_361510 ?auto_361511 ) ( not ( = ?auto_361507 ?auto_361509 ) ) ( not ( = ?auto_361507 ?auto_361510 ) ) ( not ( = ?auto_361507 ?auto_361512 ) ) ( not ( = ?auto_361507 ?auto_361515 ) ) ( not ( = ?auto_361508 ?auto_361506 ) ) ( not ( = ?auto_361508 ?auto_361511 ) ) ( not ( = ?auto_361508 ?auto_361513 ) ) ( not ( = ?auto_361509 ?auto_361510 ) ) ( not ( = ?auto_361506 ?auto_361511 ) ) ( not ( = ?auto_361510 ?auto_361512 ) ) ( not ( = ?auto_361510 ?auto_361515 ) ) ( not ( = ?auto_361511 ?auto_361513 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361509 ?auto_361506 ?auto_361512 ?auto_361513 )
      ( GET-4IMAGE-VERIFY ?auto_361507 ?auto_361508 ?auto_361509 ?auto_361506 ?auto_361510 ?auto_361511 ?auto_361512 ?auto_361513 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361518 - DIRECTION
      ?auto_361519 - MODE
      ?auto_361520 - DIRECTION
      ?auto_361517 - MODE
      ?auto_361521 - DIRECTION
      ?auto_361522 - MODE
      ?auto_361523 - DIRECTION
      ?auto_361524 - MODE
    )
    :vars
    (
      ?auto_361525 - INSTRUMENT
      ?auto_361527 - SATELLITE
      ?auto_361526 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361525 ) ( ON_BOARD ?auto_361525 ?auto_361527 ) ( SUPPORTS ?auto_361525 ?auto_361524 ) ( POWER_ON ?auto_361525 ) ( POINTING ?auto_361527 ?auto_361526 ) ( not ( = ?auto_361523 ?auto_361526 ) ) ( HAVE_IMAGE ?auto_361520 ?auto_361519 ) ( not ( = ?auto_361520 ?auto_361523 ) ) ( not ( = ?auto_361520 ?auto_361526 ) ) ( not ( = ?auto_361519 ?auto_361524 ) ) ( HAVE_IMAGE ?auto_361518 ?auto_361519 ) ( HAVE_IMAGE ?auto_361520 ?auto_361517 ) ( HAVE_IMAGE ?auto_361521 ?auto_361522 ) ( not ( = ?auto_361518 ?auto_361520 ) ) ( not ( = ?auto_361518 ?auto_361521 ) ) ( not ( = ?auto_361518 ?auto_361523 ) ) ( not ( = ?auto_361518 ?auto_361526 ) ) ( not ( = ?auto_361519 ?auto_361517 ) ) ( not ( = ?auto_361519 ?auto_361522 ) ) ( not ( = ?auto_361520 ?auto_361521 ) ) ( not ( = ?auto_361517 ?auto_361522 ) ) ( not ( = ?auto_361517 ?auto_361524 ) ) ( not ( = ?auto_361521 ?auto_361523 ) ) ( not ( = ?auto_361521 ?auto_361526 ) ) ( not ( = ?auto_361522 ?auto_361524 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361520 ?auto_361519 ?auto_361523 ?auto_361524 )
      ( GET-4IMAGE-VERIFY ?auto_361518 ?auto_361519 ?auto_361520 ?auto_361517 ?auto_361521 ?auto_361522 ?auto_361523 ?auto_361524 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361529 - DIRECTION
      ?auto_361530 - MODE
      ?auto_361531 - DIRECTION
      ?auto_361528 - MODE
      ?auto_361532 - DIRECTION
      ?auto_361533 - MODE
      ?auto_361534 - DIRECTION
      ?auto_361535 - MODE
    )
    :vars
    (
      ?auto_361536 - INSTRUMENT
      ?auto_361538 - SATELLITE
      ?auto_361537 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361536 ) ( ON_BOARD ?auto_361536 ?auto_361538 ) ( SUPPORTS ?auto_361536 ?auto_361533 ) ( POWER_ON ?auto_361536 ) ( POINTING ?auto_361538 ?auto_361537 ) ( not ( = ?auto_361532 ?auto_361537 ) ) ( HAVE_IMAGE ?auto_361534 ?auto_361530 ) ( not ( = ?auto_361534 ?auto_361532 ) ) ( not ( = ?auto_361534 ?auto_361537 ) ) ( not ( = ?auto_361530 ?auto_361533 ) ) ( HAVE_IMAGE ?auto_361529 ?auto_361530 ) ( HAVE_IMAGE ?auto_361531 ?auto_361528 ) ( HAVE_IMAGE ?auto_361534 ?auto_361535 ) ( not ( = ?auto_361529 ?auto_361531 ) ) ( not ( = ?auto_361529 ?auto_361532 ) ) ( not ( = ?auto_361529 ?auto_361534 ) ) ( not ( = ?auto_361529 ?auto_361537 ) ) ( not ( = ?auto_361530 ?auto_361528 ) ) ( not ( = ?auto_361530 ?auto_361535 ) ) ( not ( = ?auto_361531 ?auto_361532 ) ) ( not ( = ?auto_361531 ?auto_361534 ) ) ( not ( = ?auto_361531 ?auto_361537 ) ) ( not ( = ?auto_361528 ?auto_361533 ) ) ( not ( = ?auto_361528 ?auto_361535 ) ) ( not ( = ?auto_361533 ?auto_361535 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361534 ?auto_361530 ?auto_361532 ?auto_361533 )
      ( GET-4IMAGE-VERIFY ?auto_361529 ?auto_361530 ?auto_361531 ?auto_361528 ?auto_361532 ?auto_361533 ?auto_361534 ?auto_361535 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361562 - DIRECTION
      ?auto_361563 - MODE
      ?auto_361564 - DIRECTION
      ?auto_361561 - MODE
      ?auto_361565 - DIRECTION
      ?auto_361566 - MODE
      ?auto_361567 - DIRECTION
      ?auto_361568 - MODE
    )
    :vars
    (
      ?auto_361569 - INSTRUMENT
      ?auto_361571 - SATELLITE
      ?auto_361570 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361569 ) ( ON_BOARD ?auto_361569 ?auto_361571 ) ( SUPPORTS ?auto_361569 ?auto_361568 ) ( POWER_ON ?auto_361569 ) ( POINTING ?auto_361571 ?auto_361570 ) ( not ( = ?auto_361567 ?auto_361570 ) ) ( HAVE_IMAGE ?auto_361562 ?auto_361563 ) ( not ( = ?auto_361562 ?auto_361567 ) ) ( not ( = ?auto_361562 ?auto_361570 ) ) ( not ( = ?auto_361563 ?auto_361568 ) ) ( HAVE_IMAGE ?auto_361564 ?auto_361561 ) ( HAVE_IMAGE ?auto_361565 ?auto_361566 ) ( not ( = ?auto_361562 ?auto_361564 ) ) ( not ( = ?auto_361562 ?auto_361565 ) ) ( not ( = ?auto_361563 ?auto_361561 ) ) ( not ( = ?auto_361563 ?auto_361566 ) ) ( not ( = ?auto_361564 ?auto_361565 ) ) ( not ( = ?auto_361564 ?auto_361567 ) ) ( not ( = ?auto_361564 ?auto_361570 ) ) ( not ( = ?auto_361561 ?auto_361566 ) ) ( not ( = ?auto_361561 ?auto_361568 ) ) ( not ( = ?auto_361565 ?auto_361567 ) ) ( not ( = ?auto_361565 ?auto_361570 ) ) ( not ( = ?auto_361566 ?auto_361568 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361562 ?auto_361563 ?auto_361567 ?auto_361568 )
      ( GET-4IMAGE-VERIFY ?auto_361562 ?auto_361563 ?auto_361564 ?auto_361561 ?auto_361565 ?auto_361566 ?auto_361567 ?auto_361568 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361584 - DIRECTION
      ?auto_361585 - MODE
      ?auto_361586 - DIRECTION
      ?auto_361583 - MODE
      ?auto_361587 - DIRECTION
      ?auto_361588 - MODE
      ?auto_361589 - DIRECTION
      ?auto_361590 - MODE
    )
    :vars
    (
      ?auto_361591 - INSTRUMENT
      ?auto_361593 - SATELLITE
      ?auto_361592 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361591 ) ( ON_BOARD ?auto_361591 ?auto_361593 ) ( SUPPORTS ?auto_361591 ?auto_361588 ) ( POWER_ON ?auto_361591 ) ( POINTING ?auto_361593 ?auto_361592 ) ( not ( = ?auto_361587 ?auto_361592 ) ) ( HAVE_IMAGE ?auto_361589 ?auto_361590 ) ( not ( = ?auto_361589 ?auto_361587 ) ) ( not ( = ?auto_361589 ?auto_361592 ) ) ( not ( = ?auto_361590 ?auto_361588 ) ) ( HAVE_IMAGE ?auto_361584 ?auto_361585 ) ( HAVE_IMAGE ?auto_361586 ?auto_361583 ) ( not ( = ?auto_361584 ?auto_361586 ) ) ( not ( = ?auto_361584 ?auto_361587 ) ) ( not ( = ?auto_361584 ?auto_361589 ) ) ( not ( = ?auto_361584 ?auto_361592 ) ) ( not ( = ?auto_361585 ?auto_361583 ) ) ( not ( = ?auto_361585 ?auto_361588 ) ) ( not ( = ?auto_361585 ?auto_361590 ) ) ( not ( = ?auto_361586 ?auto_361587 ) ) ( not ( = ?auto_361586 ?auto_361589 ) ) ( not ( = ?auto_361586 ?auto_361592 ) ) ( not ( = ?auto_361583 ?auto_361588 ) ) ( not ( = ?auto_361583 ?auto_361590 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361589 ?auto_361590 ?auto_361587 ?auto_361588 )
      ( GET-4IMAGE-VERIFY ?auto_361584 ?auto_361585 ?auto_361586 ?auto_361583 ?auto_361587 ?auto_361588 ?auto_361589 ?auto_361590 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361595 - DIRECTION
      ?auto_361596 - MODE
      ?auto_361597 - DIRECTION
      ?auto_361594 - MODE
      ?auto_361598 - DIRECTION
      ?auto_361599 - MODE
      ?auto_361600 - DIRECTION
      ?auto_361601 - MODE
    )
    :vars
    (
      ?auto_361602 - INSTRUMENT
      ?auto_361604 - SATELLITE
      ?auto_361603 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361602 ) ( ON_BOARD ?auto_361602 ?auto_361604 ) ( SUPPORTS ?auto_361602 ?auto_361599 ) ( POWER_ON ?auto_361602 ) ( POINTING ?auto_361604 ?auto_361603 ) ( not ( = ?auto_361598 ?auto_361603 ) ) ( HAVE_IMAGE ?auto_361595 ?auto_361596 ) ( not ( = ?auto_361595 ?auto_361598 ) ) ( not ( = ?auto_361595 ?auto_361603 ) ) ( not ( = ?auto_361596 ?auto_361599 ) ) ( HAVE_IMAGE ?auto_361597 ?auto_361594 ) ( HAVE_IMAGE ?auto_361600 ?auto_361601 ) ( not ( = ?auto_361595 ?auto_361597 ) ) ( not ( = ?auto_361595 ?auto_361600 ) ) ( not ( = ?auto_361596 ?auto_361594 ) ) ( not ( = ?auto_361596 ?auto_361601 ) ) ( not ( = ?auto_361597 ?auto_361598 ) ) ( not ( = ?auto_361597 ?auto_361600 ) ) ( not ( = ?auto_361597 ?auto_361603 ) ) ( not ( = ?auto_361594 ?auto_361599 ) ) ( not ( = ?auto_361594 ?auto_361601 ) ) ( not ( = ?auto_361598 ?auto_361600 ) ) ( not ( = ?auto_361599 ?auto_361601 ) ) ( not ( = ?auto_361600 ?auto_361603 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361595 ?auto_361596 ?auto_361598 ?auto_361599 )
      ( GET-4IMAGE-VERIFY ?auto_361595 ?auto_361596 ?auto_361597 ?auto_361594 ?auto_361598 ?auto_361599 ?auto_361600 ?auto_361601 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361617 - DIRECTION
      ?auto_361618 - MODE
      ?auto_361619 - DIRECTION
      ?auto_361616 - MODE
      ?auto_361620 - DIRECTION
      ?auto_361621 - MODE
      ?auto_361622 - DIRECTION
      ?auto_361623 - MODE
    )
    :vars
    (
      ?auto_361624 - INSTRUMENT
      ?auto_361626 - SATELLITE
      ?auto_361625 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361624 ) ( ON_BOARD ?auto_361624 ?auto_361626 ) ( SUPPORTS ?auto_361624 ?auto_361616 ) ( POWER_ON ?auto_361624 ) ( POINTING ?auto_361626 ?auto_361625 ) ( not ( = ?auto_361619 ?auto_361625 ) ) ( HAVE_IMAGE ?auto_361617 ?auto_361623 ) ( not ( = ?auto_361617 ?auto_361619 ) ) ( not ( = ?auto_361617 ?auto_361625 ) ) ( not ( = ?auto_361623 ?auto_361616 ) ) ( HAVE_IMAGE ?auto_361617 ?auto_361618 ) ( HAVE_IMAGE ?auto_361620 ?auto_361621 ) ( HAVE_IMAGE ?auto_361622 ?auto_361623 ) ( not ( = ?auto_361617 ?auto_361620 ) ) ( not ( = ?auto_361617 ?auto_361622 ) ) ( not ( = ?auto_361618 ?auto_361616 ) ) ( not ( = ?auto_361618 ?auto_361621 ) ) ( not ( = ?auto_361618 ?auto_361623 ) ) ( not ( = ?auto_361619 ?auto_361620 ) ) ( not ( = ?auto_361619 ?auto_361622 ) ) ( not ( = ?auto_361616 ?auto_361621 ) ) ( not ( = ?auto_361620 ?auto_361622 ) ) ( not ( = ?auto_361620 ?auto_361625 ) ) ( not ( = ?auto_361621 ?auto_361623 ) ) ( not ( = ?auto_361622 ?auto_361625 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361617 ?auto_361623 ?auto_361619 ?auto_361616 )
      ( GET-4IMAGE-VERIFY ?auto_361617 ?auto_361618 ?auto_361619 ?auto_361616 ?auto_361620 ?auto_361621 ?auto_361622 ?auto_361623 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361628 - DIRECTION
      ?auto_361629 - MODE
      ?auto_361630 - DIRECTION
      ?auto_361627 - MODE
      ?auto_361631 - DIRECTION
      ?auto_361632 - MODE
      ?auto_361633 - DIRECTION
      ?auto_361634 - MODE
    )
    :vars
    (
      ?auto_361635 - INSTRUMENT
      ?auto_361637 - SATELLITE
      ?auto_361636 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361635 ) ( ON_BOARD ?auto_361635 ?auto_361637 ) ( SUPPORTS ?auto_361635 ?auto_361627 ) ( POWER_ON ?auto_361635 ) ( POINTING ?auto_361637 ?auto_361636 ) ( not ( = ?auto_361630 ?auto_361636 ) ) ( HAVE_IMAGE ?auto_361631 ?auto_361632 ) ( not ( = ?auto_361631 ?auto_361630 ) ) ( not ( = ?auto_361631 ?auto_361636 ) ) ( not ( = ?auto_361632 ?auto_361627 ) ) ( HAVE_IMAGE ?auto_361628 ?auto_361629 ) ( HAVE_IMAGE ?auto_361633 ?auto_361634 ) ( not ( = ?auto_361628 ?auto_361630 ) ) ( not ( = ?auto_361628 ?auto_361631 ) ) ( not ( = ?auto_361628 ?auto_361633 ) ) ( not ( = ?auto_361628 ?auto_361636 ) ) ( not ( = ?auto_361629 ?auto_361627 ) ) ( not ( = ?auto_361629 ?auto_361632 ) ) ( not ( = ?auto_361629 ?auto_361634 ) ) ( not ( = ?auto_361630 ?auto_361633 ) ) ( not ( = ?auto_361627 ?auto_361634 ) ) ( not ( = ?auto_361631 ?auto_361633 ) ) ( not ( = ?auto_361632 ?auto_361634 ) ) ( not ( = ?auto_361633 ?auto_361636 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361631 ?auto_361632 ?auto_361630 ?auto_361627 )
      ( GET-4IMAGE-VERIFY ?auto_361628 ?auto_361629 ?auto_361630 ?auto_361627 ?auto_361631 ?auto_361632 ?auto_361633 ?auto_361634 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361650 - DIRECTION
      ?auto_361651 - MODE
      ?auto_361652 - DIRECTION
      ?auto_361649 - MODE
      ?auto_361653 - DIRECTION
      ?auto_361654 - MODE
      ?auto_361655 - DIRECTION
      ?auto_361656 - MODE
    )
    :vars
    (
      ?auto_361657 - INSTRUMENT
      ?auto_361659 - SATELLITE
      ?auto_361658 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361657 ) ( ON_BOARD ?auto_361657 ?auto_361659 ) ( SUPPORTS ?auto_361657 ?auto_361649 ) ( POWER_ON ?auto_361657 ) ( POINTING ?auto_361659 ?auto_361658 ) ( not ( = ?auto_361652 ?auto_361658 ) ) ( HAVE_IMAGE ?auto_361650 ?auto_361651 ) ( not ( = ?auto_361650 ?auto_361652 ) ) ( not ( = ?auto_361650 ?auto_361658 ) ) ( not ( = ?auto_361651 ?auto_361649 ) ) ( HAVE_IMAGE ?auto_361653 ?auto_361654 ) ( HAVE_IMAGE ?auto_361655 ?auto_361656 ) ( not ( = ?auto_361650 ?auto_361653 ) ) ( not ( = ?auto_361650 ?auto_361655 ) ) ( not ( = ?auto_361651 ?auto_361654 ) ) ( not ( = ?auto_361651 ?auto_361656 ) ) ( not ( = ?auto_361652 ?auto_361653 ) ) ( not ( = ?auto_361652 ?auto_361655 ) ) ( not ( = ?auto_361649 ?auto_361654 ) ) ( not ( = ?auto_361649 ?auto_361656 ) ) ( not ( = ?auto_361653 ?auto_361655 ) ) ( not ( = ?auto_361653 ?auto_361658 ) ) ( not ( = ?auto_361654 ?auto_361656 ) ) ( not ( = ?auto_361655 ?auto_361658 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361650 ?auto_361651 ?auto_361652 ?auto_361649 )
      ( GET-4IMAGE-VERIFY ?auto_361650 ?auto_361651 ?auto_361652 ?auto_361649 ?auto_361653 ?auto_361654 ?auto_361655 ?auto_361656 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361716 - DIRECTION
      ?auto_361717 - MODE
      ?auto_361718 - DIRECTION
      ?auto_361715 - MODE
      ?auto_361719 - DIRECTION
      ?auto_361720 - MODE
      ?auto_361721 - DIRECTION
      ?auto_361722 - MODE
    )
    :vars
    (
      ?auto_361723 - INSTRUMENT
      ?auto_361725 - SATELLITE
      ?auto_361724 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361723 ) ( ON_BOARD ?auto_361723 ?auto_361725 ) ( SUPPORTS ?auto_361723 ?auto_361722 ) ( POWER_ON ?auto_361723 ) ( POINTING ?auto_361725 ?auto_361724 ) ( not ( = ?auto_361721 ?auto_361724 ) ) ( HAVE_IMAGE ?auto_361719 ?auto_361715 ) ( not ( = ?auto_361719 ?auto_361721 ) ) ( not ( = ?auto_361719 ?auto_361724 ) ) ( not ( = ?auto_361715 ?auto_361722 ) ) ( HAVE_IMAGE ?auto_361716 ?auto_361717 ) ( HAVE_IMAGE ?auto_361718 ?auto_361715 ) ( HAVE_IMAGE ?auto_361719 ?auto_361720 ) ( not ( = ?auto_361716 ?auto_361718 ) ) ( not ( = ?auto_361716 ?auto_361719 ) ) ( not ( = ?auto_361716 ?auto_361721 ) ) ( not ( = ?auto_361716 ?auto_361724 ) ) ( not ( = ?auto_361717 ?auto_361715 ) ) ( not ( = ?auto_361717 ?auto_361720 ) ) ( not ( = ?auto_361717 ?auto_361722 ) ) ( not ( = ?auto_361718 ?auto_361719 ) ) ( not ( = ?auto_361718 ?auto_361721 ) ) ( not ( = ?auto_361718 ?auto_361724 ) ) ( not ( = ?auto_361715 ?auto_361720 ) ) ( not ( = ?auto_361720 ?auto_361722 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361719 ?auto_361715 ?auto_361721 ?auto_361722 )
      ( GET-4IMAGE-VERIFY ?auto_361716 ?auto_361717 ?auto_361718 ?auto_361715 ?auto_361719 ?auto_361720 ?auto_361721 ?auto_361722 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361738 - DIRECTION
      ?auto_361739 - MODE
      ?auto_361740 - DIRECTION
      ?auto_361737 - MODE
      ?auto_361741 - DIRECTION
      ?auto_361742 - MODE
      ?auto_361743 - DIRECTION
      ?auto_361744 - MODE
    )
    :vars
    (
      ?auto_361745 - INSTRUMENT
      ?auto_361747 - SATELLITE
      ?auto_361746 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361745 ) ( ON_BOARD ?auto_361745 ?auto_361747 ) ( SUPPORTS ?auto_361745 ?auto_361742 ) ( POWER_ON ?auto_361745 ) ( POINTING ?auto_361747 ?auto_361746 ) ( not ( = ?auto_361741 ?auto_361746 ) ) ( HAVE_IMAGE ?auto_361740 ?auto_361744 ) ( not ( = ?auto_361740 ?auto_361741 ) ) ( not ( = ?auto_361740 ?auto_361746 ) ) ( not ( = ?auto_361744 ?auto_361742 ) ) ( HAVE_IMAGE ?auto_361738 ?auto_361739 ) ( HAVE_IMAGE ?auto_361740 ?auto_361737 ) ( HAVE_IMAGE ?auto_361743 ?auto_361744 ) ( not ( = ?auto_361738 ?auto_361740 ) ) ( not ( = ?auto_361738 ?auto_361741 ) ) ( not ( = ?auto_361738 ?auto_361743 ) ) ( not ( = ?auto_361738 ?auto_361746 ) ) ( not ( = ?auto_361739 ?auto_361737 ) ) ( not ( = ?auto_361739 ?auto_361742 ) ) ( not ( = ?auto_361739 ?auto_361744 ) ) ( not ( = ?auto_361740 ?auto_361743 ) ) ( not ( = ?auto_361737 ?auto_361742 ) ) ( not ( = ?auto_361737 ?auto_361744 ) ) ( not ( = ?auto_361741 ?auto_361743 ) ) ( not ( = ?auto_361743 ?auto_361746 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361740 ?auto_361744 ?auto_361741 ?auto_361742 )
      ( GET-4IMAGE-VERIFY ?auto_361738 ?auto_361739 ?auto_361740 ?auto_361737 ?auto_361741 ?auto_361742 ?auto_361743 ?auto_361744 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361749 - DIRECTION
      ?auto_361750 - MODE
      ?auto_361751 - DIRECTION
      ?auto_361748 - MODE
      ?auto_361752 - DIRECTION
      ?auto_361753 - MODE
      ?auto_361754 - DIRECTION
      ?auto_361755 - MODE
    )
    :vars
    (
      ?auto_361756 - INSTRUMENT
      ?auto_361758 - SATELLITE
      ?auto_361757 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361756 ) ( ON_BOARD ?auto_361756 ?auto_361758 ) ( SUPPORTS ?auto_361756 ?auto_361753 ) ( POWER_ON ?auto_361756 ) ( POINTING ?auto_361758 ?auto_361757 ) ( not ( = ?auto_361752 ?auto_361757 ) ) ( HAVE_IMAGE ?auto_361751 ?auto_361748 ) ( not ( = ?auto_361751 ?auto_361752 ) ) ( not ( = ?auto_361751 ?auto_361757 ) ) ( not ( = ?auto_361748 ?auto_361753 ) ) ( HAVE_IMAGE ?auto_361749 ?auto_361750 ) ( HAVE_IMAGE ?auto_361754 ?auto_361755 ) ( not ( = ?auto_361749 ?auto_361751 ) ) ( not ( = ?auto_361749 ?auto_361752 ) ) ( not ( = ?auto_361749 ?auto_361754 ) ) ( not ( = ?auto_361749 ?auto_361757 ) ) ( not ( = ?auto_361750 ?auto_361748 ) ) ( not ( = ?auto_361750 ?auto_361753 ) ) ( not ( = ?auto_361750 ?auto_361755 ) ) ( not ( = ?auto_361751 ?auto_361754 ) ) ( not ( = ?auto_361748 ?auto_361755 ) ) ( not ( = ?auto_361752 ?auto_361754 ) ) ( not ( = ?auto_361753 ?auto_361755 ) ) ( not ( = ?auto_361754 ?auto_361757 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361751 ?auto_361748 ?auto_361752 ?auto_361753 )
      ( GET-4IMAGE-VERIFY ?auto_361749 ?auto_361750 ?auto_361751 ?auto_361748 ?auto_361752 ?auto_361753 ?auto_361754 ?auto_361755 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361771 - DIRECTION
      ?auto_361772 - MODE
      ?auto_361773 - DIRECTION
      ?auto_361770 - MODE
      ?auto_361774 - DIRECTION
      ?auto_361775 - MODE
      ?auto_361776 - DIRECTION
      ?auto_361777 - MODE
    )
    :vars
    (
      ?auto_361778 - INSTRUMENT
      ?auto_361780 - SATELLITE
      ?auto_361779 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361778 ) ( ON_BOARD ?auto_361778 ?auto_361780 ) ( SUPPORTS ?auto_361778 ?auto_361777 ) ( POWER_ON ?auto_361778 ) ( POINTING ?auto_361780 ?auto_361779 ) ( not ( = ?auto_361776 ?auto_361779 ) ) ( HAVE_IMAGE ?auto_361774 ?auto_361775 ) ( not ( = ?auto_361774 ?auto_361776 ) ) ( not ( = ?auto_361774 ?auto_361779 ) ) ( not ( = ?auto_361775 ?auto_361777 ) ) ( HAVE_IMAGE ?auto_361771 ?auto_361772 ) ( HAVE_IMAGE ?auto_361773 ?auto_361770 ) ( not ( = ?auto_361771 ?auto_361773 ) ) ( not ( = ?auto_361771 ?auto_361774 ) ) ( not ( = ?auto_361771 ?auto_361776 ) ) ( not ( = ?auto_361771 ?auto_361779 ) ) ( not ( = ?auto_361772 ?auto_361770 ) ) ( not ( = ?auto_361772 ?auto_361775 ) ) ( not ( = ?auto_361772 ?auto_361777 ) ) ( not ( = ?auto_361773 ?auto_361774 ) ) ( not ( = ?auto_361773 ?auto_361776 ) ) ( not ( = ?auto_361773 ?auto_361779 ) ) ( not ( = ?auto_361770 ?auto_361775 ) ) ( not ( = ?auto_361770 ?auto_361777 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361774 ?auto_361775 ?auto_361776 ?auto_361777 )
      ( GET-4IMAGE-VERIFY ?auto_361771 ?auto_361772 ?auto_361773 ?auto_361770 ?auto_361774 ?auto_361775 ?auto_361776 ?auto_361777 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361782 - DIRECTION
      ?auto_361783 - MODE
      ?auto_361784 - DIRECTION
      ?auto_361781 - MODE
      ?auto_361785 - DIRECTION
      ?auto_361786 - MODE
      ?auto_361787 - DIRECTION
      ?auto_361788 - MODE
    )
    :vars
    (
      ?auto_361790 - INSTRUMENT
      ?auto_361793 - SATELLITE
      ?auto_361792 - DIRECTION
      ?auto_361791 - DIRECTION
      ?auto_361789 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_361790 ) ( ON_BOARD ?auto_361790 ?auto_361793 ) ( SUPPORTS ?auto_361790 ?auto_361788 ) ( POWER_ON ?auto_361790 ) ( POINTING ?auto_361793 ?auto_361792 ) ( not ( = ?auto_361787 ?auto_361792 ) ) ( HAVE_IMAGE ?auto_361791 ?auto_361789 ) ( not ( = ?auto_361791 ?auto_361787 ) ) ( not ( = ?auto_361791 ?auto_361792 ) ) ( not ( = ?auto_361789 ?auto_361788 ) ) ( HAVE_IMAGE ?auto_361782 ?auto_361783 ) ( HAVE_IMAGE ?auto_361784 ?auto_361781 ) ( HAVE_IMAGE ?auto_361785 ?auto_361786 ) ( not ( = ?auto_361782 ?auto_361784 ) ) ( not ( = ?auto_361782 ?auto_361785 ) ) ( not ( = ?auto_361782 ?auto_361787 ) ) ( not ( = ?auto_361782 ?auto_361792 ) ) ( not ( = ?auto_361782 ?auto_361791 ) ) ( not ( = ?auto_361783 ?auto_361781 ) ) ( not ( = ?auto_361783 ?auto_361786 ) ) ( not ( = ?auto_361783 ?auto_361788 ) ) ( not ( = ?auto_361783 ?auto_361789 ) ) ( not ( = ?auto_361784 ?auto_361785 ) ) ( not ( = ?auto_361784 ?auto_361787 ) ) ( not ( = ?auto_361784 ?auto_361792 ) ) ( not ( = ?auto_361784 ?auto_361791 ) ) ( not ( = ?auto_361781 ?auto_361786 ) ) ( not ( = ?auto_361781 ?auto_361788 ) ) ( not ( = ?auto_361781 ?auto_361789 ) ) ( not ( = ?auto_361785 ?auto_361787 ) ) ( not ( = ?auto_361785 ?auto_361792 ) ) ( not ( = ?auto_361785 ?auto_361791 ) ) ( not ( = ?auto_361786 ?auto_361788 ) ) ( not ( = ?auto_361786 ?auto_361789 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361791 ?auto_361789 ?auto_361787 ?auto_361788 )
      ( GET-4IMAGE-VERIFY ?auto_361782 ?auto_361783 ?auto_361784 ?auto_361781 ?auto_361785 ?auto_361786 ?auto_361787 ?auto_361788 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361806 - DIRECTION
      ?auto_361807 - MODE
      ?auto_361808 - DIRECTION
      ?auto_361805 - MODE
      ?auto_361809 - DIRECTION
      ?auto_361810 - MODE
      ?auto_361811 - DIRECTION
      ?auto_361812 - MODE
    )
    :vars
    (
      ?auto_361814 - INSTRUMENT
      ?auto_361817 - SATELLITE
      ?auto_361816 - DIRECTION
      ?auto_361815 - DIRECTION
      ?auto_361813 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_361814 ) ( ON_BOARD ?auto_361814 ?auto_361817 ) ( SUPPORTS ?auto_361814 ?auto_361810 ) ( POWER_ON ?auto_361814 ) ( POINTING ?auto_361817 ?auto_361816 ) ( not ( = ?auto_361809 ?auto_361816 ) ) ( HAVE_IMAGE ?auto_361815 ?auto_361813 ) ( not ( = ?auto_361815 ?auto_361809 ) ) ( not ( = ?auto_361815 ?auto_361816 ) ) ( not ( = ?auto_361813 ?auto_361810 ) ) ( HAVE_IMAGE ?auto_361806 ?auto_361807 ) ( HAVE_IMAGE ?auto_361808 ?auto_361805 ) ( HAVE_IMAGE ?auto_361811 ?auto_361812 ) ( not ( = ?auto_361806 ?auto_361808 ) ) ( not ( = ?auto_361806 ?auto_361809 ) ) ( not ( = ?auto_361806 ?auto_361811 ) ) ( not ( = ?auto_361806 ?auto_361816 ) ) ( not ( = ?auto_361806 ?auto_361815 ) ) ( not ( = ?auto_361807 ?auto_361805 ) ) ( not ( = ?auto_361807 ?auto_361810 ) ) ( not ( = ?auto_361807 ?auto_361812 ) ) ( not ( = ?auto_361807 ?auto_361813 ) ) ( not ( = ?auto_361808 ?auto_361809 ) ) ( not ( = ?auto_361808 ?auto_361811 ) ) ( not ( = ?auto_361808 ?auto_361816 ) ) ( not ( = ?auto_361808 ?auto_361815 ) ) ( not ( = ?auto_361805 ?auto_361810 ) ) ( not ( = ?auto_361805 ?auto_361812 ) ) ( not ( = ?auto_361805 ?auto_361813 ) ) ( not ( = ?auto_361809 ?auto_361811 ) ) ( not ( = ?auto_361810 ?auto_361812 ) ) ( not ( = ?auto_361811 ?auto_361816 ) ) ( not ( = ?auto_361811 ?auto_361815 ) ) ( not ( = ?auto_361812 ?auto_361813 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361815 ?auto_361813 ?auto_361809 ?auto_361810 )
      ( GET-4IMAGE-VERIFY ?auto_361806 ?auto_361807 ?auto_361808 ?auto_361805 ?auto_361809 ?auto_361810 ?auto_361811 ?auto_361812 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361832 - DIRECTION
      ?auto_361833 - MODE
      ?auto_361834 - DIRECTION
      ?auto_361831 - MODE
      ?auto_361835 - DIRECTION
      ?auto_361836 - MODE
      ?auto_361837 - DIRECTION
      ?auto_361838 - MODE
    )
    :vars
    (
      ?auto_361839 - INSTRUMENT
      ?auto_361841 - SATELLITE
      ?auto_361840 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361839 ) ( ON_BOARD ?auto_361839 ?auto_361841 ) ( SUPPORTS ?auto_361839 ?auto_361831 ) ( POWER_ON ?auto_361839 ) ( POINTING ?auto_361841 ?auto_361840 ) ( not ( = ?auto_361834 ?auto_361840 ) ) ( HAVE_IMAGE ?auto_361837 ?auto_361838 ) ( not ( = ?auto_361837 ?auto_361834 ) ) ( not ( = ?auto_361837 ?auto_361840 ) ) ( not ( = ?auto_361838 ?auto_361831 ) ) ( HAVE_IMAGE ?auto_361832 ?auto_361833 ) ( HAVE_IMAGE ?auto_361835 ?auto_361836 ) ( not ( = ?auto_361832 ?auto_361834 ) ) ( not ( = ?auto_361832 ?auto_361835 ) ) ( not ( = ?auto_361832 ?auto_361837 ) ) ( not ( = ?auto_361832 ?auto_361840 ) ) ( not ( = ?auto_361833 ?auto_361831 ) ) ( not ( = ?auto_361833 ?auto_361836 ) ) ( not ( = ?auto_361833 ?auto_361838 ) ) ( not ( = ?auto_361834 ?auto_361835 ) ) ( not ( = ?auto_361831 ?auto_361836 ) ) ( not ( = ?auto_361835 ?auto_361837 ) ) ( not ( = ?auto_361835 ?auto_361840 ) ) ( not ( = ?auto_361836 ?auto_361838 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361837 ?auto_361838 ?auto_361834 ?auto_361831 )
      ( GET-4IMAGE-VERIFY ?auto_361832 ?auto_361833 ?auto_361834 ?auto_361831 ?auto_361835 ?auto_361836 ?auto_361837 ?auto_361838 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361876 - DIRECTION
      ?auto_361877 - MODE
      ?auto_361878 - DIRECTION
      ?auto_361875 - MODE
      ?auto_361879 - DIRECTION
      ?auto_361880 - MODE
      ?auto_361881 - DIRECTION
      ?auto_361882 - MODE
    )
    :vars
    (
      ?auto_361884 - INSTRUMENT
      ?auto_361887 - SATELLITE
      ?auto_361886 - DIRECTION
      ?auto_361885 - DIRECTION
      ?auto_361883 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_361884 ) ( ON_BOARD ?auto_361884 ?auto_361887 ) ( SUPPORTS ?auto_361884 ?auto_361875 ) ( POWER_ON ?auto_361884 ) ( POINTING ?auto_361887 ?auto_361886 ) ( not ( = ?auto_361878 ?auto_361886 ) ) ( HAVE_IMAGE ?auto_361885 ?auto_361883 ) ( not ( = ?auto_361885 ?auto_361878 ) ) ( not ( = ?auto_361885 ?auto_361886 ) ) ( not ( = ?auto_361883 ?auto_361875 ) ) ( HAVE_IMAGE ?auto_361876 ?auto_361877 ) ( HAVE_IMAGE ?auto_361879 ?auto_361880 ) ( HAVE_IMAGE ?auto_361881 ?auto_361882 ) ( not ( = ?auto_361876 ?auto_361878 ) ) ( not ( = ?auto_361876 ?auto_361879 ) ) ( not ( = ?auto_361876 ?auto_361881 ) ) ( not ( = ?auto_361876 ?auto_361886 ) ) ( not ( = ?auto_361876 ?auto_361885 ) ) ( not ( = ?auto_361877 ?auto_361875 ) ) ( not ( = ?auto_361877 ?auto_361880 ) ) ( not ( = ?auto_361877 ?auto_361882 ) ) ( not ( = ?auto_361877 ?auto_361883 ) ) ( not ( = ?auto_361878 ?auto_361879 ) ) ( not ( = ?auto_361878 ?auto_361881 ) ) ( not ( = ?auto_361875 ?auto_361880 ) ) ( not ( = ?auto_361875 ?auto_361882 ) ) ( not ( = ?auto_361879 ?auto_361881 ) ) ( not ( = ?auto_361879 ?auto_361886 ) ) ( not ( = ?auto_361879 ?auto_361885 ) ) ( not ( = ?auto_361880 ?auto_361882 ) ) ( not ( = ?auto_361880 ?auto_361883 ) ) ( not ( = ?auto_361881 ?auto_361886 ) ) ( not ( = ?auto_361881 ?auto_361885 ) ) ( not ( = ?auto_361882 ?auto_361883 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361885 ?auto_361883 ?auto_361878 ?auto_361875 )
      ( GET-4IMAGE-VERIFY ?auto_361876 ?auto_361877 ?auto_361878 ?auto_361875 ?auto_361879 ?auto_361880 ?auto_361881 ?auto_361882 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361939 - DIRECTION
      ?auto_361940 - MODE
      ?auto_361941 - DIRECTION
      ?auto_361938 - MODE
      ?auto_361942 - DIRECTION
      ?auto_361943 - MODE
      ?auto_361944 - DIRECTION
      ?auto_361945 - MODE
    )
    :vars
    (
      ?auto_361946 - INSTRUMENT
      ?auto_361948 - SATELLITE
      ?auto_361947 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361946 ) ( ON_BOARD ?auto_361946 ?auto_361948 ) ( SUPPORTS ?auto_361946 ?auto_361940 ) ( POWER_ON ?auto_361946 ) ( POINTING ?auto_361948 ?auto_361947 ) ( not ( = ?auto_361939 ?auto_361947 ) ) ( HAVE_IMAGE ?auto_361941 ?auto_361938 ) ( not ( = ?auto_361941 ?auto_361939 ) ) ( not ( = ?auto_361941 ?auto_361947 ) ) ( not ( = ?auto_361938 ?auto_361940 ) ) ( HAVE_IMAGE ?auto_361942 ?auto_361943 ) ( HAVE_IMAGE ?auto_361944 ?auto_361945 ) ( not ( = ?auto_361939 ?auto_361942 ) ) ( not ( = ?auto_361939 ?auto_361944 ) ) ( not ( = ?auto_361940 ?auto_361943 ) ) ( not ( = ?auto_361940 ?auto_361945 ) ) ( not ( = ?auto_361941 ?auto_361942 ) ) ( not ( = ?auto_361941 ?auto_361944 ) ) ( not ( = ?auto_361938 ?auto_361943 ) ) ( not ( = ?auto_361938 ?auto_361945 ) ) ( not ( = ?auto_361942 ?auto_361944 ) ) ( not ( = ?auto_361942 ?auto_361947 ) ) ( not ( = ?auto_361943 ?auto_361945 ) ) ( not ( = ?auto_361944 ?auto_361947 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361941 ?auto_361938 ?auto_361939 ?auto_361940 )
      ( GET-4IMAGE-VERIFY ?auto_361939 ?auto_361940 ?auto_361941 ?auto_361938 ?auto_361942 ?auto_361943 ?auto_361944 ?auto_361945 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_361950 - DIRECTION
      ?auto_361951 - MODE
      ?auto_361952 - DIRECTION
      ?auto_361949 - MODE
      ?auto_361953 - DIRECTION
      ?auto_361954 - MODE
      ?auto_361955 - DIRECTION
      ?auto_361956 - MODE
    )
    :vars
    (
      ?auto_361957 - INSTRUMENT
      ?auto_361959 - SATELLITE
      ?auto_361958 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_361957 ) ( ON_BOARD ?auto_361957 ?auto_361959 ) ( SUPPORTS ?auto_361957 ?auto_361951 ) ( POWER_ON ?auto_361957 ) ( POINTING ?auto_361959 ?auto_361958 ) ( not ( = ?auto_361950 ?auto_361958 ) ) ( HAVE_IMAGE ?auto_361953 ?auto_361954 ) ( not ( = ?auto_361953 ?auto_361950 ) ) ( not ( = ?auto_361953 ?auto_361958 ) ) ( not ( = ?auto_361954 ?auto_361951 ) ) ( HAVE_IMAGE ?auto_361952 ?auto_361949 ) ( HAVE_IMAGE ?auto_361955 ?auto_361956 ) ( not ( = ?auto_361950 ?auto_361952 ) ) ( not ( = ?auto_361950 ?auto_361955 ) ) ( not ( = ?auto_361951 ?auto_361949 ) ) ( not ( = ?auto_361951 ?auto_361956 ) ) ( not ( = ?auto_361952 ?auto_361953 ) ) ( not ( = ?auto_361952 ?auto_361955 ) ) ( not ( = ?auto_361952 ?auto_361958 ) ) ( not ( = ?auto_361949 ?auto_361954 ) ) ( not ( = ?auto_361949 ?auto_361956 ) ) ( not ( = ?auto_361953 ?auto_361955 ) ) ( not ( = ?auto_361954 ?auto_361956 ) ) ( not ( = ?auto_361955 ?auto_361958 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_361953 ?auto_361954 ?auto_361950 ?auto_361951 )
      ( GET-4IMAGE-VERIFY ?auto_361950 ?auto_361951 ?auto_361952 ?auto_361949 ?auto_361953 ?auto_361954 ?auto_361955 ?auto_361956 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362038 - DIRECTION
      ?auto_362039 - MODE
      ?auto_362040 - DIRECTION
      ?auto_362037 - MODE
      ?auto_362041 - DIRECTION
      ?auto_362042 - MODE
      ?auto_362043 - DIRECTION
      ?auto_362044 - MODE
    )
    :vars
    (
      ?auto_362045 - INSTRUMENT
      ?auto_362047 - SATELLITE
      ?auto_362046 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_362045 ) ( ON_BOARD ?auto_362045 ?auto_362047 ) ( SUPPORTS ?auto_362045 ?auto_362039 ) ( POWER_ON ?auto_362045 ) ( POINTING ?auto_362047 ?auto_362046 ) ( not ( = ?auto_362038 ?auto_362046 ) ) ( HAVE_IMAGE ?auto_362041 ?auto_362044 ) ( not ( = ?auto_362041 ?auto_362038 ) ) ( not ( = ?auto_362041 ?auto_362046 ) ) ( not ( = ?auto_362044 ?auto_362039 ) ) ( HAVE_IMAGE ?auto_362040 ?auto_362037 ) ( HAVE_IMAGE ?auto_362041 ?auto_362042 ) ( HAVE_IMAGE ?auto_362043 ?auto_362044 ) ( not ( = ?auto_362038 ?auto_362040 ) ) ( not ( = ?auto_362038 ?auto_362043 ) ) ( not ( = ?auto_362039 ?auto_362037 ) ) ( not ( = ?auto_362039 ?auto_362042 ) ) ( not ( = ?auto_362040 ?auto_362041 ) ) ( not ( = ?auto_362040 ?auto_362043 ) ) ( not ( = ?auto_362040 ?auto_362046 ) ) ( not ( = ?auto_362037 ?auto_362042 ) ) ( not ( = ?auto_362037 ?auto_362044 ) ) ( not ( = ?auto_362041 ?auto_362043 ) ) ( not ( = ?auto_362042 ?auto_362044 ) ) ( not ( = ?auto_362043 ?auto_362046 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362041 ?auto_362044 ?auto_362038 ?auto_362039 )
      ( GET-4IMAGE-VERIFY ?auto_362038 ?auto_362039 ?auto_362040 ?auto_362037 ?auto_362041 ?auto_362042 ?auto_362043 ?auto_362044 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362071 - DIRECTION
      ?auto_362072 - MODE
      ?auto_362073 - DIRECTION
      ?auto_362070 - MODE
      ?auto_362074 - DIRECTION
      ?auto_362075 - MODE
      ?auto_362076 - DIRECTION
      ?auto_362077 - MODE
    )
    :vars
    (
      ?auto_362078 - INSTRUMENT
      ?auto_362080 - SATELLITE
      ?auto_362079 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_362078 ) ( ON_BOARD ?auto_362078 ?auto_362080 ) ( SUPPORTS ?auto_362078 ?auto_362072 ) ( POWER_ON ?auto_362078 ) ( POINTING ?auto_362080 ?auto_362079 ) ( not ( = ?auto_362071 ?auto_362079 ) ) ( HAVE_IMAGE ?auto_362076 ?auto_362077 ) ( not ( = ?auto_362076 ?auto_362071 ) ) ( not ( = ?auto_362076 ?auto_362079 ) ) ( not ( = ?auto_362077 ?auto_362072 ) ) ( HAVE_IMAGE ?auto_362073 ?auto_362070 ) ( HAVE_IMAGE ?auto_362074 ?auto_362075 ) ( not ( = ?auto_362071 ?auto_362073 ) ) ( not ( = ?auto_362071 ?auto_362074 ) ) ( not ( = ?auto_362072 ?auto_362070 ) ) ( not ( = ?auto_362072 ?auto_362075 ) ) ( not ( = ?auto_362073 ?auto_362074 ) ) ( not ( = ?auto_362073 ?auto_362076 ) ) ( not ( = ?auto_362073 ?auto_362079 ) ) ( not ( = ?auto_362070 ?auto_362075 ) ) ( not ( = ?auto_362070 ?auto_362077 ) ) ( not ( = ?auto_362074 ?auto_362076 ) ) ( not ( = ?auto_362074 ?auto_362079 ) ) ( not ( = ?auto_362075 ?auto_362077 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362076 ?auto_362077 ?auto_362071 ?auto_362072 )
      ( GET-4IMAGE-VERIFY ?auto_362071 ?auto_362072 ?auto_362073 ?auto_362070 ?auto_362074 ?auto_362075 ?auto_362076 ?auto_362077 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362082 - DIRECTION
      ?auto_362083 - MODE
      ?auto_362084 - DIRECTION
      ?auto_362081 - MODE
      ?auto_362085 - DIRECTION
      ?auto_362086 - MODE
      ?auto_362087 - DIRECTION
      ?auto_362088 - MODE
    )
    :vars
    (
      ?auto_362090 - INSTRUMENT
      ?auto_362093 - SATELLITE
      ?auto_362092 - DIRECTION
      ?auto_362091 - DIRECTION
      ?auto_362089 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_362090 ) ( ON_BOARD ?auto_362090 ?auto_362093 ) ( SUPPORTS ?auto_362090 ?auto_362083 ) ( POWER_ON ?auto_362090 ) ( POINTING ?auto_362093 ?auto_362092 ) ( not ( = ?auto_362082 ?auto_362092 ) ) ( HAVE_IMAGE ?auto_362091 ?auto_362089 ) ( not ( = ?auto_362091 ?auto_362082 ) ) ( not ( = ?auto_362091 ?auto_362092 ) ) ( not ( = ?auto_362089 ?auto_362083 ) ) ( HAVE_IMAGE ?auto_362084 ?auto_362081 ) ( HAVE_IMAGE ?auto_362085 ?auto_362086 ) ( HAVE_IMAGE ?auto_362087 ?auto_362088 ) ( not ( = ?auto_362082 ?auto_362084 ) ) ( not ( = ?auto_362082 ?auto_362085 ) ) ( not ( = ?auto_362082 ?auto_362087 ) ) ( not ( = ?auto_362083 ?auto_362081 ) ) ( not ( = ?auto_362083 ?auto_362086 ) ) ( not ( = ?auto_362083 ?auto_362088 ) ) ( not ( = ?auto_362084 ?auto_362085 ) ) ( not ( = ?auto_362084 ?auto_362087 ) ) ( not ( = ?auto_362084 ?auto_362092 ) ) ( not ( = ?auto_362084 ?auto_362091 ) ) ( not ( = ?auto_362081 ?auto_362086 ) ) ( not ( = ?auto_362081 ?auto_362088 ) ) ( not ( = ?auto_362081 ?auto_362089 ) ) ( not ( = ?auto_362085 ?auto_362087 ) ) ( not ( = ?auto_362085 ?auto_362092 ) ) ( not ( = ?auto_362085 ?auto_362091 ) ) ( not ( = ?auto_362086 ?auto_362088 ) ) ( not ( = ?auto_362086 ?auto_362089 ) ) ( not ( = ?auto_362087 ?auto_362092 ) ) ( not ( = ?auto_362087 ?auto_362091 ) ) ( not ( = ?auto_362088 ?auto_362089 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362091 ?auto_362089 ?auto_362082 ?auto_362083 )
      ( GET-4IMAGE-VERIFY ?auto_362082 ?auto_362083 ?auto_362084 ?auto_362081 ?auto_362085 ?auto_362086 ?auto_362087 ?auto_362088 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_362335 - DIRECTION
      ?auto_362336 - MODE
      ?auto_362337 - DIRECTION
      ?auto_362334 - MODE
      ?auto_362338 - DIRECTION
      ?auto_362339 - MODE
    )
    :vars
    (
      ?auto_362344 - INSTRUMENT
      ?auto_362343 - SATELLITE
      ?auto_362342 - DIRECTION
      ?auto_362340 - DIRECTION
      ?auto_362341 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_362344 ?auto_362343 ) ( SUPPORTS ?auto_362344 ?auto_362339 ) ( POWER_ON ?auto_362344 ) ( POINTING ?auto_362343 ?auto_362342 ) ( not ( = ?auto_362338 ?auto_362342 ) ) ( HAVE_IMAGE ?auto_362340 ?auto_362341 ) ( not ( = ?auto_362340 ?auto_362338 ) ) ( not ( = ?auto_362340 ?auto_362342 ) ) ( not ( = ?auto_362341 ?auto_362339 ) ) ( CALIBRATION_TARGET ?auto_362344 ?auto_362342 ) ( NOT_CALIBRATED ?auto_362344 ) ( HAVE_IMAGE ?auto_362335 ?auto_362336 ) ( HAVE_IMAGE ?auto_362337 ?auto_362334 ) ( not ( = ?auto_362335 ?auto_362337 ) ) ( not ( = ?auto_362335 ?auto_362338 ) ) ( not ( = ?auto_362335 ?auto_362342 ) ) ( not ( = ?auto_362335 ?auto_362340 ) ) ( not ( = ?auto_362336 ?auto_362334 ) ) ( not ( = ?auto_362336 ?auto_362339 ) ) ( not ( = ?auto_362336 ?auto_362341 ) ) ( not ( = ?auto_362337 ?auto_362338 ) ) ( not ( = ?auto_362337 ?auto_362342 ) ) ( not ( = ?auto_362337 ?auto_362340 ) ) ( not ( = ?auto_362334 ?auto_362339 ) ) ( not ( = ?auto_362334 ?auto_362341 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362340 ?auto_362341 ?auto_362338 ?auto_362339 )
      ( GET-3IMAGE-VERIFY ?auto_362335 ?auto_362336 ?auto_362337 ?auto_362334 ?auto_362338 ?auto_362339 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_362352 - DIRECTION
      ?auto_362353 - MODE
      ?auto_362354 - DIRECTION
      ?auto_362351 - MODE
      ?auto_362355 - DIRECTION
      ?auto_362356 - MODE
    )
    :vars
    (
      ?auto_362361 - INSTRUMENT
      ?auto_362360 - SATELLITE
      ?auto_362359 - DIRECTION
      ?auto_362357 - DIRECTION
      ?auto_362358 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_362361 ?auto_362360 ) ( SUPPORTS ?auto_362361 ?auto_362351 ) ( POWER_ON ?auto_362361 ) ( POINTING ?auto_362360 ?auto_362359 ) ( not ( = ?auto_362354 ?auto_362359 ) ) ( HAVE_IMAGE ?auto_362357 ?auto_362358 ) ( not ( = ?auto_362357 ?auto_362354 ) ) ( not ( = ?auto_362357 ?auto_362359 ) ) ( not ( = ?auto_362358 ?auto_362351 ) ) ( CALIBRATION_TARGET ?auto_362361 ?auto_362359 ) ( NOT_CALIBRATED ?auto_362361 ) ( HAVE_IMAGE ?auto_362352 ?auto_362353 ) ( HAVE_IMAGE ?auto_362355 ?auto_362356 ) ( not ( = ?auto_362352 ?auto_362354 ) ) ( not ( = ?auto_362352 ?auto_362355 ) ) ( not ( = ?auto_362352 ?auto_362359 ) ) ( not ( = ?auto_362352 ?auto_362357 ) ) ( not ( = ?auto_362353 ?auto_362351 ) ) ( not ( = ?auto_362353 ?auto_362356 ) ) ( not ( = ?auto_362353 ?auto_362358 ) ) ( not ( = ?auto_362354 ?auto_362355 ) ) ( not ( = ?auto_362351 ?auto_362356 ) ) ( not ( = ?auto_362355 ?auto_362359 ) ) ( not ( = ?auto_362355 ?auto_362357 ) ) ( not ( = ?auto_362356 ?auto_362358 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362357 ?auto_362358 ?auto_362354 ?auto_362351 )
      ( GET-3IMAGE-VERIFY ?auto_362352 ?auto_362353 ?auto_362354 ?auto_362351 ?auto_362355 ?auto_362356 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_362383 - DIRECTION
      ?auto_362384 - MODE
      ?auto_362385 - DIRECTION
      ?auto_362382 - MODE
      ?auto_362386 - DIRECTION
      ?auto_362387 - MODE
    )
    :vars
    (
      ?auto_362390 - INSTRUMENT
      ?auto_362389 - SATELLITE
      ?auto_362388 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362390 ?auto_362389 ) ( SUPPORTS ?auto_362390 ?auto_362384 ) ( POWER_ON ?auto_362390 ) ( POINTING ?auto_362389 ?auto_362388 ) ( not ( = ?auto_362383 ?auto_362388 ) ) ( HAVE_IMAGE ?auto_362385 ?auto_362382 ) ( not ( = ?auto_362385 ?auto_362383 ) ) ( not ( = ?auto_362385 ?auto_362388 ) ) ( not ( = ?auto_362382 ?auto_362384 ) ) ( CALIBRATION_TARGET ?auto_362390 ?auto_362388 ) ( NOT_CALIBRATED ?auto_362390 ) ( HAVE_IMAGE ?auto_362386 ?auto_362387 ) ( not ( = ?auto_362383 ?auto_362386 ) ) ( not ( = ?auto_362384 ?auto_362387 ) ) ( not ( = ?auto_362385 ?auto_362386 ) ) ( not ( = ?auto_362382 ?auto_362387 ) ) ( not ( = ?auto_362386 ?auto_362388 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362385 ?auto_362382 ?auto_362383 ?auto_362384 )
      ( GET-3IMAGE-VERIFY ?auto_362383 ?auto_362384 ?auto_362385 ?auto_362382 ?auto_362386 ?auto_362387 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_362407 - DIRECTION
      ?auto_362408 - MODE
      ?auto_362409 - DIRECTION
      ?auto_362406 - MODE
      ?auto_362410 - DIRECTION
      ?auto_362411 - MODE
    )
    :vars
    (
      ?auto_362416 - INSTRUMENT
      ?auto_362415 - SATELLITE
      ?auto_362414 - DIRECTION
      ?auto_362412 - DIRECTION
      ?auto_362413 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_362416 ?auto_362415 ) ( SUPPORTS ?auto_362416 ?auto_362408 ) ( POWER_ON ?auto_362416 ) ( POINTING ?auto_362415 ?auto_362414 ) ( not ( = ?auto_362407 ?auto_362414 ) ) ( HAVE_IMAGE ?auto_362412 ?auto_362413 ) ( not ( = ?auto_362412 ?auto_362407 ) ) ( not ( = ?auto_362412 ?auto_362414 ) ) ( not ( = ?auto_362413 ?auto_362408 ) ) ( CALIBRATION_TARGET ?auto_362416 ?auto_362414 ) ( NOT_CALIBRATED ?auto_362416 ) ( HAVE_IMAGE ?auto_362409 ?auto_362406 ) ( HAVE_IMAGE ?auto_362410 ?auto_362411 ) ( not ( = ?auto_362407 ?auto_362409 ) ) ( not ( = ?auto_362407 ?auto_362410 ) ) ( not ( = ?auto_362408 ?auto_362406 ) ) ( not ( = ?auto_362408 ?auto_362411 ) ) ( not ( = ?auto_362409 ?auto_362410 ) ) ( not ( = ?auto_362409 ?auto_362414 ) ) ( not ( = ?auto_362409 ?auto_362412 ) ) ( not ( = ?auto_362406 ?auto_362411 ) ) ( not ( = ?auto_362406 ?auto_362413 ) ) ( not ( = ?auto_362410 ?auto_362414 ) ) ( not ( = ?auto_362410 ?auto_362412 ) ) ( not ( = ?auto_362411 ?auto_362413 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362412 ?auto_362413 ?auto_362407 ?auto_362408 )
      ( GET-3IMAGE-VERIFY ?auto_362407 ?auto_362408 ?auto_362409 ?auto_362406 ?auto_362410 ?auto_362411 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362460 - DIRECTION
      ?auto_362461 - MODE
      ?auto_362462 - DIRECTION
      ?auto_362459 - MODE
      ?auto_362463 - DIRECTION
      ?auto_362464 - MODE
      ?auto_362465 - DIRECTION
      ?auto_362466 - MODE
    )
    :vars
    (
      ?auto_362469 - INSTRUMENT
      ?auto_362468 - SATELLITE
      ?auto_362467 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362469 ?auto_362468 ) ( SUPPORTS ?auto_362469 ?auto_362466 ) ( POWER_ON ?auto_362469 ) ( POINTING ?auto_362468 ?auto_362467 ) ( not ( = ?auto_362465 ?auto_362467 ) ) ( HAVE_IMAGE ?auto_362460 ?auto_362464 ) ( not ( = ?auto_362460 ?auto_362465 ) ) ( not ( = ?auto_362460 ?auto_362467 ) ) ( not ( = ?auto_362464 ?auto_362466 ) ) ( CALIBRATION_TARGET ?auto_362469 ?auto_362467 ) ( NOT_CALIBRATED ?auto_362469 ) ( HAVE_IMAGE ?auto_362460 ?auto_362461 ) ( HAVE_IMAGE ?auto_362462 ?auto_362459 ) ( HAVE_IMAGE ?auto_362463 ?auto_362464 ) ( not ( = ?auto_362460 ?auto_362462 ) ) ( not ( = ?auto_362460 ?auto_362463 ) ) ( not ( = ?auto_362461 ?auto_362459 ) ) ( not ( = ?auto_362461 ?auto_362464 ) ) ( not ( = ?auto_362461 ?auto_362466 ) ) ( not ( = ?auto_362462 ?auto_362463 ) ) ( not ( = ?auto_362462 ?auto_362465 ) ) ( not ( = ?auto_362462 ?auto_362467 ) ) ( not ( = ?auto_362459 ?auto_362464 ) ) ( not ( = ?auto_362459 ?auto_362466 ) ) ( not ( = ?auto_362463 ?auto_362465 ) ) ( not ( = ?auto_362463 ?auto_362467 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362460 ?auto_362464 ?auto_362465 ?auto_362466 )
      ( GET-4IMAGE-VERIFY ?auto_362460 ?auto_362461 ?auto_362462 ?auto_362459 ?auto_362463 ?auto_362464 ?auto_362465 ?auto_362466 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362471 - DIRECTION
      ?auto_362472 - MODE
      ?auto_362473 - DIRECTION
      ?auto_362470 - MODE
      ?auto_362474 - DIRECTION
      ?auto_362475 - MODE
      ?auto_362476 - DIRECTION
      ?auto_362477 - MODE
    )
    :vars
    (
      ?auto_362480 - INSTRUMENT
      ?auto_362479 - SATELLITE
      ?auto_362478 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362480 ?auto_362479 ) ( SUPPORTS ?auto_362480 ?auto_362477 ) ( POWER_ON ?auto_362480 ) ( POINTING ?auto_362479 ?auto_362478 ) ( not ( = ?auto_362476 ?auto_362478 ) ) ( HAVE_IMAGE ?auto_362473 ?auto_362472 ) ( not ( = ?auto_362473 ?auto_362476 ) ) ( not ( = ?auto_362473 ?auto_362478 ) ) ( not ( = ?auto_362472 ?auto_362477 ) ) ( CALIBRATION_TARGET ?auto_362480 ?auto_362478 ) ( NOT_CALIBRATED ?auto_362480 ) ( HAVE_IMAGE ?auto_362471 ?auto_362472 ) ( HAVE_IMAGE ?auto_362473 ?auto_362470 ) ( HAVE_IMAGE ?auto_362474 ?auto_362475 ) ( not ( = ?auto_362471 ?auto_362473 ) ) ( not ( = ?auto_362471 ?auto_362474 ) ) ( not ( = ?auto_362471 ?auto_362476 ) ) ( not ( = ?auto_362471 ?auto_362478 ) ) ( not ( = ?auto_362472 ?auto_362470 ) ) ( not ( = ?auto_362472 ?auto_362475 ) ) ( not ( = ?auto_362473 ?auto_362474 ) ) ( not ( = ?auto_362470 ?auto_362475 ) ) ( not ( = ?auto_362470 ?auto_362477 ) ) ( not ( = ?auto_362474 ?auto_362476 ) ) ( not ( = ?auto_362474 ?auto_362478 ) ) ( not ( = ?auto_362475 ?auto_362477 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362473 ?auto_362472 ?auto_362476 ?auto_362477 )
      ( GET-4IMAGE-VERIFY ?auto_362471 ?auto_362472 ?auto_362473 ?auto_362470 ?auto_362474 ?auto_362475 ?auto_362476 ?auto_362477 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362482 - DIRECTION
      ?auto_362483 - MODE
      ?auto_362484 - DIRECTION
      ?auto_362481 - MODE
      ?auto_362485 - DIRECTION
      ?auto_362486 - MODE
      ?auto_362487 - DIRECTION
      ?auto_362488 - MODE
    )
    :vars
    (
      ?auto_362491 - INSTRUMENT
      ?auto_362490 - SATELLITE
      ?auto_362489 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362491 ?auto_362490 ) ( SUPPORTS ?auto_362491 ?auto_362486 ) ( POWER_ON ?auto_362491 ) ( POINTING ?auto_362490 ?auto_362489 ) ( not ( = ?auto_362485 ?auto_362489 ) ) ( HAVE_IMAGE ?auto_362487 ?auto_362483 ) ( not ( = ?auto_362487 ?auto_362485 ) ) ( not ( = ?auto_362487 ?auto_362489 ) ) ( not ( = ?auto_362483 ?auto_362486 ) ) ( CALIBRATION_TARGET ?auto_362491 ?auto_362489 ) ( NOT_CALIBRATED ?auto_362491 ) ( HAVE_IMAGE ?auto_362482 ?auto_362483 ) ( HAVE_IMAGE ?auto_362484 ?auto_362481 ) ( HAVE_IMAGE ?auto_362487 ?auto_362488 ) ( not ( = ?auto_362482 ?auto_362484 ) ) ( not ( = ?auto_362482 ?auto_362485 ) ) ( not ( = ?auto_362482 ?auto_362487 ) ) ( not ( = ?auto_362482 ?auto_362489 ) ) ( not ( = ?auto_362483 ?auto_362481 ) ) ( not ( = ?auto_362483 ?auto_362488 ) ) ( not ( = ?auto_362484 ?auto_362485 ) ) ( not ( = ?auto_362484 ?auto_362487 ) ) ( not ( = ?auto_362484 ?auto_362489 ) ) ( not ( = ?auto_362481 ?auto_362486 ) ) ( not ( = ?auto_362481 ?auto_362488 ) ) ( not ( = ?auto_362486 ?auto_362488 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362487 ?auto_362483 ?auto_362485 ?auto_362486 )
      ( GET-4IMAGE-VERIFY ?auto_362482 ?auto_362483 ?auto_362484 ?auto_362481 ?auto_362485 ?auto_362486 ?auto_362487 ?auto_362488 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362493 - DIRECTION
      ?auto_362494 - MODE
      ?auto_362495 - DIRECTION
      ?auto_362492 - MODE
      ?auto_362496 - DIRECTION
      ?auto_362497 - MODE
      ?auto_362498 - DIRECTION
      ?auto_362499 - MODE
    )
    :vars
    (
      ?auto_362502 - INSTRUMENT
      ?auto_362501 - SATELLITE
      ?auto_362500 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362502 ?auto_362501 ) ( SUPPORTS ?auto_362502 ?auto_362497 ) ( POWER_ON ?auto_362502 ) ( POINTING ?auto_362501 ?auto_362500 ) ( not ( = ?auto_362496 ?auto_362500 ) ) ( HAVE_IMAGE ?auto_362495 ?auto_362494 ) ( not ( = ?auto_362495 ?auto_362496 ) ) ( not ( = ?auto_362495 ?auto_362500 ) ) ( not ( = ?auto_362494 ?auto_362497 ) ) ( CALIBRATION_TARGET ?auto_362502 ?auto_362500 ) ( NOT_CALIBRATED ?auto_362502 ) ( HAVE_IMAGE ?auto_362493 ?auto_362494 ) ( HAVE_IMAGE ?auto_362495 ?auto_362492 ) ( HAVE_IMAGE ?auto_362498 ?auto_362499 ) ( not ( = ?auto_362493 ?auto_362495 ) ) ( not ( = ?auto_362493 ?auto_362496 ) ) ( not ( = ?auto_362493 ?auto_362498 ) ) ( not ( = ?auto_362493 ?auto_362500 ) ) ( not ( = ?auto_362494 ?auto_362492 ) ) ( not ( = ?auto_362494 ?auto_362499 ) ) ( not ( = ?auto_362495 ?auto_362498 ) ) ( not ( = ?auto_362492 ?auto_362497 ) ) ( not ( = ?auto_362492 ?auto_362499 ) ) ( not ( = ?auto_362496 ?auto_362498 ) ) ( not ( = ?auto_362497 ?auto_362499 ) ) ( not ( = ?auto_362498 ?auto_362500 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362495 ?auto_362494 ?auto_362496 ?auto_362497 )
      ( GET-4IMAGE-VERIFY ?auto_362493 ?auto_362494 ?auto_362495 ?auto_362492 ?auto_362496 ?auto_362497 ?auto_362498 ?auto_362499 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362526 - DIRECTION
      ?auto_362527 - MODE
      ?auto_362528 - DIRECTION
      ?auto_362525 - MODE
      ?auto_362529 - DIRECTION
      ?auto_362530 - MODE
      ?auto_362531 - DIRECTION
      ?auto_362532 - MODE
    )
    :vars
    (
      ?auto_362535 - INSTRUMENT
      ?auto_362534 - SATELLITE
      ?auto_362533 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362535 ?auto_362534 ) ( SUPPORTS ?auto_362535 ?auto_362532 ) ( POWER_ON ?auto_362535 ) ( POINTING ?auto_362534 ?auto_362533 ) ( not ( = ?auto_362531 ?auto_362533 ) ) ( HAVE_IMAGE ?auto_362526 ?auto_362527 ) ( not ( = ?auto_362526 ?auto_362531 ) ) ( not ( = ?auto_362526 ?auto_362533 ) ) ( not ( = ?auto_362527 ?auto_362532 ) ) ( CALIBRATION_TARGET ?auto_362535 ?auto_362533 ) ( NOT_CALIBRATED ?auto_362535 ) ( HAVE_IMAGE ?auto_362528 ?auto_362525 ) ( HAVE_IMAGE ?auto_362529 ?auto_362530 ) ( not ( = ?auto_362526 ?auto_362528 ) ) ( not ( = ?auto_362526 ?auto_362529 ) ) ( not ( = ?auto_362527 ?auto_362525 ) ) ( not ( = ?auto_362527 ?auto_362530 ) ) ( not ( = ?auto_362528 ?auto_362529 ) ) ( not ( = ?auto_362528 ?auto_362531 ) ) ( not ( = ?auto_362528 ?auto_362533 ) ) ( not ( = ?auto_362525 ?auto_362530 ) ) ( not ( = ?auto_362525 ?auto_362532 ) ) ( not ( = ?auto_362529 ?auto_362531 ) ) ( not ( = ?auto_362529 ?auto_362533 ) ) ( not ( = ?auto_362530 ?auto_362532 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362526 ?auto_362527 ?auto_362531 ?auto_362532 )
      ( GET-4IMAGE-VERIFY ?auto_362526 ?auto_362527 ?auto_362528 ?auto_362525 ?auto_362529 ?auto_362530 ?auto_362531 ?auto_362532 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362548 - DIRECTION
      ?auto_362549 - MODE
      ?auto_362550 - DIRECTION
      ?auto_362547 - MODE
      ?auto_362551 - DIRECTION
      ?auto_362552 - MODE
      ?auto_362553 - DIRECTION
      ?auto_362554 - MODE
    )
    :vars
    (
      ?auto_362557 - INSTRUMENT
      ?auto_362556 - SATELLITE
      ?auto_362555 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362557 ?auto_362556 ) ( SUPPORTS ?auto_362557 ?auto_362552 ) ( POWER_ON ?auto_362557 ) ( POINTING ?auto_362556 ?auto_362555 ) ( not ( = ?auto_362551 ?auto_362555 ) ) ( HAVE_IMAGE ?auto_362548 ?auto_362549 ) ( not ( = ?auto_362548 ?auto_362551 ) ) ( not ( = ?auto_362548 ?auto_362555 ) ) ( not ( = ?auto_362549 ?auto_362552 ) ) ( CALIBRATION_TARGET ?auto_362557 ?auto_362555 ) ( NOT_CALIBRATED ?auto_362557 ) ( HAVE_IMAGE ?auto_362550 ?auto_362547 ) ( HAVE_IMAGE ?auto_362553 ?auto_362554 ) ( not ( = ?auto_362548 ?auto_362550 ) ) ( not ( = ?auto_362548 ?auto_362553 ) ) ( not ( = ?auto_362549 ?auto_362547 ) ) ( not ( = ?auto_362549 ?auto_362554 ) ) ( not ( = ?auto_362550 ?auto_362551 ) ) ( not ( = ?auto_362550 ?auto_362553 ) ) ( not ( = ?auto_362550 ?auto_362555 ) ) ( not ( = ?auto_362547 ?auto_362552 ) ) ( not ( = ?auto_362547 ?auto_362554 ) ) ( not ( = ?auto_362551 ?auto_362553 ) ) ( not ( = ?auto_362552 ?auto_362554 ) ) ( not ( = ?auto_362553 ?auto_362555 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362548 ?auto_362549 ?auto_362551 ?auto_362552 )
      ( GET-4IMAGE-VERIFY ?auto_362548 ?auto_362549 ?auto_362550 ?auto_362547 ?auto_362551 ?auto_362552 ?auto_362553 ?auto_362554 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362570 - DIRECTION
      ?auto_362571 - MODE
      ?auto_362572 - DIRECTION
      ?auto_362569 - MODE
      ?auto_362573 - DIRECTION
      ?auto_362574 - MODE
      ?auto_362575 - DIRECTION
      ?auto_362576 - MODE
    )
    :vars
    (
      ?auto_362579 - INSTRUMENT
      ?auto_362578 - SATELLITE
      ?auto_362577 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362579 ?auto_362578 ) ( SUPPORTS ?auto_362579 ?auto_362569 ) ( POWER_ON ?auto_362579 ) ( POINTING ?auto_362578 ?auto_362577 ) ( not ( = ?auto_362572 ?auto_362577 ) ) ( HAVE_IMAGE ?auto_362573 ?auto_362574 ) ( not ( = ?auto_362573 ?auto_362572 ) ) ( not ( = ?auto_362573 ?auto_362577 ) ) ( not ( = ?auto_362574 ?auto_362569 ) ) ( CALIBRATION_TARGET ?auto_362579 ?auto_362577 ) ( NOT_CALIBRATED ?auto_362579 ) ( HAVE_IMAGE ?auto_362570 ?auto_362571 ) ( HAVE_IMAGE ?auto_362575 ?auto_362576 ) ( not ( = ?auto_362570 ?auto_362572 ) ) ( not ( = ?auto_362570 ?auto_362573 ) ) ( not ( = ?auto_362570 ?auto_362575 ) ) ( not ( = ?auto_362570 ?auto_362577 ) ) ( not ( = ?auto_362571 ?auto_362569 ) ) ( not ( = ?auto_362571 ?auto_362574 ) ) ( not ( = ?auto_362571 ?auto_362576 ) ) ( not ( = ?auto_362572 ?auto_362575 ) ) ( not ( = ?auto_362569 ?auto_362576 ) ) ( not ( = ?auto_362573 ?auto_362575 ) ) ( not ( = ?auto_362574 ?auto_362576 ) ) ( not ( = ?auto_362575 ?auto_362577 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362573 ?auto_362574 ?auto_362572 ?auto_362569 )
      ( GET-4IMAGE-VERIFY ?auto_362570 ?auto_362571 ?auto_362572 ?auto_362569 ?auto_362573 ?auto_362574 ?auto_362575 ?auto_362576 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362603 - DIRECTION
      ?auto_362604 - MODE
      ?auto_362605 - DIRECTION
      ?auto_362602 - MODE
      ?auto_362606 - DIRECTION
      ?auto_362607 - MODE
      ?auto_362608 - DIRECTION
      ?auto_362609 - MODE
    )
    :vars
    (
      ?auto_362612 - INSTRUMENT
      ?auto_362611 - SATELLITE
      ?auto_362610 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362612 ?auto_362611 ) ( SUPPORTS ?auto_362612 ?auto_362602 ) ( POWER_ON ?auto_362612 ) ( POINTING ?auto_362611 ?auto_362610 ) ( not ( = ?auto_362605 ?auto_362610 ) ) ( HAVE_IMAGE ?auto_362608 ?auto_362609 ) ( not ( = ?auto_362608 ?auto_362605 ) ) ( not ( = ?auto_362608 ?auto_362610 ) ) ( not ( = ?auto_362609 ?auto_362602 ) ) ( CALIBRATION_TARGET ?auto_362612 ?auto_362610 ) ( NOT_CALIBRATED ?auto_362612 ) ( HAVE_IMAGE ?auto_362603 ?auto_362604 ) ( HAVE_IMAGE ?auto_362606 ?auto_362607 ) ( not ( = ?auto_362603 ?auto_362605 ) ) ( not ( = ?auto_362603 ?auto_362606 ) ) ( not ( = ?auto_362603 ?auto_362608 ) ) ( not ( = ?auto_362603 ?auto_362610 ) ) ( not ( = ?auto_362604 ?auto_362602 ) ) ( not ( = ?auto_362604 ?auto_362607 ) ) ( not ( = ?auto_362604 ?auto_362609 ) ) ( not ( = ?auto_362605 ?auto_362606 ) ) ( not ( = ?auto_362602 ?auto_362607 ) ) ( not ( = ?auto_362606 ?auto_362608 ) ) ( not ( = ?auto_362606 ?auto_362610 ) ) ( not ( = ?auto_362607 ?auto_362609 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362608 ?auto_362609 ?auto_362605 ?auto_362602 )
      ( GET-4IMAGE-VERIFY ?auto_362603 ?auto_362604 ?auto_362605 ?auto_362602 ?auto_362606 ?auto_362607 ?auto_362608 ?auto_362609 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362614 - DIRECTION
      ?auto_362615 - MODE
      ?auto_362616 - DIRECTION
      ?auto_362613 - MODE
      ?auto_362617 - DIRECTION
      ?auto_362618 - MODE
      ?auto_362619 - DIRECTION
      ?auto_362620 - MODE
    )
    :vars
    (
      ?auto_362623 - INSTRUMENT
      ?auto_362622 - SATELLITE
      ?auto_362621 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362623 ?auto_362622 ) ( SUPPORTS ?auto_362623 ?auto_362613 ) ( POWER_ON ?auto_362623 ) ( POINTING ?auto_362622 ?auto_362621 ) ( not ( = ?auto_362616 ?auto_362621 ) ) ( HAVE_IMAGE ?auto_362614 ?auto_362615 ) ( not ( = ?auto_362614 ?auto_362616 ) ) ( not ( = ?auto_362614 ?auto_362621 ) ) ( not ( = ?auto_362615 ?auto_362613 ) ) ( CALIBRATION_TARGET ?auto_362623 ?auto_362621 ) ( NOT_CALIBRATED ?auto_362623 ) ( HAVE_IMAGE ?auto_362617 ?auto_362618 ) ( HAVE_IMAGE ?auto_362619 ?auto_362620 ) ( not ( = ?auto_362614 ?auto_362617 ) ) ( not ( = ?auto_362614 ?auto_362619 ) ) ( not ( = ?auto_362615 ?auto_362618 ) ) ( not ( = ?auto_362615 ?auto_362620 ) ) ( not ( = ?auto_362616 ?auto_362617 ) ) ( not ( = ?auto_362616 ?auto_362619 ) ) ( not ( = ?auto_362613 ?auto_362618 ) ) ( not ( = ?auto_362613 ?auto_362620 ) ) ( not ( = ?auto_362617 ?auto_362619 ) ) ( not ( = ?auto_362617 ?auto_362621 ) ) ( not ( = ?auto_362618 ?auto_362620 ) ) ( not ( = ?auto_362619 ?auto_362621 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362614 ?auto_362615 ?auto_362616 ?auto_362613 )
      ( GET-4IMAGE-VERIFY ?auto_362614 ?auto_362615 ?auto_362616 ?auto_362613 ?auto_362617 ?auto_362618 ?auto_362619 ?auto_362620 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362669 - DIRECTION
      ?auto_362670 - MODE
      ?auto_362671 - DIRECTION
      ?auto_362668 - MODE
      ?auto_362672 - DIRECTION
      ?auto_362673 - MODE
      ?auto_362674 - DIRECTION
      ?auto_362675 - MODE
    )
    :vars
    (
      ?auto_362678 - INSTRUMENT
      ?auto_362677 - SATELLITE
      ?auto_362676 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362678 ?auto_362677 ) ( SUPPORTS ?auto_362678 ?auto_362675 ) ( POWER_ON ?auto_362678 ) ( POINTING ?auto_362677 ?auto_362676 ) ( not ( = ?auto_362674 ?auto_362676 ) ) ( HAVE_IMAGE ?auto_362671 ?auto_362673 ) ( not ( = ?auto_362671 ?auto_362674 ) ) ( not ( = ?auto_362671 ?auto_362676 ) ) ( not ( = ?auto_362673 ?auto_362675 ) ) ( CALIBRATION_TARGET ?auto_362678 ?auto_362676 ) ( NOT_CALIBRATED ?auto_362678 ) ( HAVE_IMAGE ?auto_362669 ?auto_362670 ) ( HAVE_IMAGE ?auto_362671 ?auto_362668 ) ( HAVE_IMAGE ?auto_362672 ?auto_362673 ) ( not ( = ?auto_362669 ?auto_362671 ) ) ( not ( = ?auto_362669 ?auto_362672 ) ) ( not ( = ?auto_362669 ?auto_362674 ) ) ( not ( = ?auto_362669 ?auto_362676 ) ) ( not ( = ?auto_362670 ?auto_362668 ) ) ( not ( = ?auto_362670 ?auto_362673 ) ) ( not ( = ?auto_362670 ?auto_362675 ) ) ( not ( = ?auto_362671 ?auto_362672 ) ) ( not ( = ?auto_362668 ?auto_362673 ) ) ( not ( = ?auto_362668 ?auto_362675 ) ) ( not ( = ?auto_362672 ?auto_362674 ) ) ( not ( = ?auto_362672 ?auto_362676 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362671 ?auto_362673 ?auto_362674 ?auto_362675 )
      ( GET-4IMAGE-VERIFY ?auto_362669 ?auto_362670 ?auto_362671 ?auto_362668 ?auto_362672 ?auto_362673 ?auto_362674 ?auto_362675 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362680 - DIRECTION
      ?auto_362681 - MODE
      ?auto_362682 - DIRECTION
      ?auto_362679 - MODE
      ?auto_362683 - DIRECTION
      ?auto_362684 - MODE
      ?auto_362685 - DIRECTION
      ?auto_362686 - MODE
    )
    :vars
    (
      ?auto_362689 - INSTRUMENT
      ?auto_362688 - SATELLITE
      ?auto_362687 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362689 ?auto_362688 ) ( SUPPORTS ?auto_362689 ?auto_362686 ) ( POWER_ON ?auto_362689 ) ( POINTING ?auto_362688 ?auto_362687 ) ( not ( = ?auto_362685 ?auto_362687 ) ) ( HAVE_IMAGE ?auto_362682 ?auto_362679 ) ( not ( = ?auto_362682 ?auto_362685 ) ) ( not ( = ?auto_362682 ?auto_362687 ) ) ( not ( = ?auto_362679 ?auto_362686 ) ) ( CALIBRATION_TARGET ?auto_362689 ?auto_362687 ) ( NOT_CALIBRATED ?auto_362689 ) ( HAVE_IMAGE ?auto_362680 ?auto_362681 ) ( HAVE_IMAGE ?auto_362683 ?auto_362684 ) ( not ( = ?auto_362680 ?auto_362682 ) ) ( not ( = ?auto_362680 ?auto_362683 ) ) ( not ( = ?auto_362680 ?auto_362685 ) ) ( not ( = ?auto_362680 ?auto_362687 ) ) ( not ( = ?auto_362681 ?auto_362679 ) ) ( not ( = ?auto_362681 ?auto_362684 ) ) ( not ( = ?auto_362681 ?auto_362686 ) ) ( not ( = ?auto_362682 ?auto_362683 ) ) ( not ( = ?auto_362679 ?auto_362684 ) ) ( not ( = ?auto_362683 ?auto_362685 ) ) ( not ( = ?auto_362683 ?auto_362687 ) ) ( not ( = ?auto_362684 ?auto_362686 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362682 ?auto_362679 ?auto_362685 ?auto_362686 )
      ( GET-4IMAGE-VERIFY ?auto_362680 ?auto_362681 ?auto_362682 ?auto_362679 ?auto_362683 ?auto_362684 ?auto_362685 ?auto_362686 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362691 - DIRECTION
      ?auto_362692 - MODE
      ?auto_362693 - DIRECTION
      ?auto_362690 - MODE
      ?auto_362694 - DIRECTION
      ?auto_362695 - MODE
      ?auto_362696 - DIRECTION
      ?auto_362697 - MODE
    )
    :vars
    (
      ?auto_362700 - INSTRUMENT
      ?auto_362699 - SATELLITE
      ?auto_362698 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362700 ?auto_362699 ) ( SUPPORTS ?auto_362700 ?auto_362695 ) ( POWER_ON ?auto_362700 ) ( POINTING ?auto_362699 ?auto_362698 ) ( not ( = ?auto_362694 ?auto_362698 ) ) ( HAVE_IMAGE ?auto_362696 ?auto_362690 ) ( not ( = ?auto_362696 ?auto_362694 ) ) ( not ( = ?auto_362696 ?auto_362698 ) ) ( not ( = ?auto_362690 ?auto_362695 ) ) ( CALIBRATION_TARGET ?auto_362700 ?auto_362698 ) ( NOT_CALIBRATED ?auto_362700 ) ( HAVE_IMAGE ?auto_362691 ?auto_362692 ) ( HAVE_IMAGE ?auto_362693 ?auto_362690 ) ( HAVE_IMAGE ?auto_362696 ?auto_362697 ) ( not ( = ?auto_362691 ?auto_362693 ) ) ( not ( = ?auto_362691 ?auto_362694 ) ) ( not ( = ?auto_362691 ?auto_362696 ) ) ( not ( = ?auto_362691 ?auto_362698 ) ) ( not ( = ?auto_362692 ?auto_362690 ) ) ( not ( = ?auto_362692 ?auto_362695 ) ) ( not ( = ?auto_362692 ?auto_362697 ) ) ( not ( = ?auto_362693 ?auto_362694 ) ) ( not ( = ?auto_362693 ?auto_362696 ) ) ( not ( = ?auto_362693 ?auto_362698 ) ) ( not ( = ?auto_362690 ?auto_362697 ) ) ( not ( = ?auto_362695 ?auto_362697 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362696 ?auto_362690 ?auto_362694 ?auto_362695 )
      ( GET-4IMAGE-VERIFY ?auto_362691 ?auto_362692 ?auto_362693 ?auto_362690 ?auto_362694 ?auto_362695 ?auto_362696 ?auto_362697 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362702 - DIRECTION
      ?auto_362703 - MODE
      ?auto_362704 - DIRECTION
      ?auto_362701 - MODE
      ?auto_362705 - DIRECTION
      ?auto_362706 - MODE
      ?auto_362707 - DIRECTION
      ?auto_362708 - MODE
    )
    :vars
    (
      ?auto_362711 - INSTRUMENT
      ?auto_362710 - SATELLITE
      ?auto_362709 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362711 ?auto_362710 ) ( SUPPORTS ?auto_362711 ?auto_362706 ) ( POWER_ON ?auto_362711 ) ( POINTING ?auto_362710 ?auto_362709 ) ( not ( = ?auto_362705 ?auto_362709 ) ) ( HAVE_IMAGE ?auto_362704 ?auto_362701 ) ( not ( = ?auto_362704 ?auto_362705 ) ) ( not ( = ?auto_362704 ?auto_362709 ) ) ( not ( = ?auto_362701 ?auto_362706 ) ) ( CALIBRATION_TARGET ?auto_362711 ?auto_362709 ) ( NOT_CALIBRATED ?auto_362711 ) ( HAVE_IMAGE ?auto_362702 ?auto_362703 ) ( HAVE_IMAGE ?auto_362707 ?auto_362708 ) ( not ( = ?auto_362702 ?auto_362704 ) ) ( not ( = ?auto_362702 ?auto_362705 ) ) ( not ( = ?auto_362702 ?auto_362707 ) ) ( not ( = ?auto_362702 ?auto_362709 ) ) ( not ( = ?auto_362703 ?auto_362701 ) ) ( not ( = ?auto_362703 ?auto_362706 ) ) ( not ( = ?auto_362703 ?auto_362708 ) ) ( not ( = ?auto_362704 ?auto_362707 ) ) ( not ( = ?auto_362701 ?auto_362708 ) ) ( not ( = ?auto_362705 ?auto_362707 ) ) ( not ( = ?auto_362706 ?auto_362708 ) ) ( not ( = ?auto_362707 ?auto_362709 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362704 ?auto_362701 ?auto_362705 ?auto_362706 )
      ( GET-4IMAGE-VERIFY ?auto_362702 ?auto_362703 ?auto_362704 ?auto_362701 ?auto_362705 ?auto_362706 ?auto_362707 ?auto_362708 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362724 - DIRECTION
      ?auto_362725 - MODE
      ?auto_362726 - DIRECTION
      ?auto_362723 - MODE
      ?auto_362727 - DIRECTION
      ?auto_362728 - MODE
      ?auto_362729 - DIRECTION
      ?auto_362730 - MODE
    )
    :vars
    (
      ?auto_362733 - INSTRUMENT
      ?auto_362732 - SATELLITE
      ?auto_362731 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362733 ?auto_362732 ) ( SUPPORTS ?auto_362733 ?auto_362730 ) ( POWER_ON ?auto_362733 ) ( POINTING ?auto_362732 ?auto_362731 ) ( not ( = ?auto_362729 ?auto_362731 ) ) ( HAVE_IMAGE ?auto_362727 ?auto_362728 ) ( not ( = ?auto_362727 ?auto_362729 ) ) ( not ( = ?auto_362727 ?auto_362731 ) ) ( not ( = ?auto_362728 ?auto_362730 ) ) ( CALIBRATION_TARGET ?auto_362733 ?auto_362731 ) ( NOT_CALIBRATED ?auto_362733 ) ( HAVE_IMAGE ?auto_362724 ?auto_362725 ) ( HAVE_IMAGE ?auto_362726 ?auto_362723 ) ( not ( = ?auto_362724 ?auto_362726 ) ) ( not ( = ?auto_362724 ?auto_362727 ) ) ( not ( = ?auto_362724 ?auto_362729 ) ) ( not ( = ?auto_362724 ?auto_362731 ) ) ( not ( = ?auto_362725 ?auto_362723 ) ) ( not ( = ?auto_362725 ?auto_362728 ) ) ( not ( = ?auto_362725 ?auto_362730 ) ) ( not ( = ?auto_362726 ?auto_362727 ) ) ( not ( = ?auto_362726 ?auto_362729 ) ) ( not ( = ?auto_362726 ?auto_362731 ) ) ( not ( = ?auto_362723 ?auto_362728 ) ) ( not ( = ?auto_362723 ?auto_362730 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362727 ?auto_362728 ?auto_362729 ?auto_362730 )
      ( GET-4IMAGE-VERIFY ?auto_362724 ?auto_362725 ?auto_362726 ?auto_362723 ?auto_362727 ?auto_362728 ?auto_362729 ?auto_362730 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362735 - DIRECTION
      ?auto_362736 - MODE
      ?auto_362737 - DIRECTION
      ?auto_362734 - MODE
      ?auto_362738 - DIRECTION
      ?auto_362739 - MODE
      ?auto_362740 - DIRECTION
      ?auto_362741 - MODE
    )
    :vars
    (
      ?auto_362746 - INSTRUMENT
      ?auto_362745 - SATELLITE
      ?auto_362744 - DIRECTION
      ?auto_362742 - DIRECTION
      ?auto_362743 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_362746 ?auto_362745 ) ( SUPPORTS ?auto_362746 ?auto_362741 ) ( POWER_ON ?auto_362746 ) ( POINTING ?auto_362745 ?auto_362744 ) ( not ( = ?auto_362740 ?auto_362744 ) ) ( HAVE_IMAGE ?auto_362742 ?auto_362743 ) ( not ( = ?auto_362742 ?auto_362740 ) ) ( not ( = ?auto_362742 ?auto_362744 ) ) ( not ( = ?auto_362743 ?auto_362741 ) ) ( CALIBRATION_TARGET ?auto_362746 ?auto_362744 ) ( NOT_CALIBRATED ?auto_362746 ) ( HAVE_IMAGE ?auto_362735 ?auto_362736 ) ( HAVE_IMAGE ?auto_362737 ?auto_362734 ) ( HAVE_IMAGE ?auto_362738 ?auto_362739 ) ( not ( = ?auto_362735 ?auto_362737 ) ) ( not ( = ?auto_362735 ?auto_362738 ) ) ( not ( = ?auto_362735 ?auto_362740 ) ) ( not ( = ?auto_362735 ?auto_362744 ) ) ( not ( = ?auto_362735 ?auto_362742 ) ) ( not ( = ?auto_362736 ?auto_362734 ) ) ( not ( = ?auto_362736 ?auto_362739 ) ) ( not ( = ?auto_362736 ?auto_362741 ) ) ( not ( = ?auto_362736 ?auto_362743 ) ) ( not ( = ?auto_362737 ?auto_362738 ) ) ( not ( = ?auto_362737 ?auto_362740 ) ) ( not ( = ?auto_362737 ?auto_362744 ) ) ( not ( = ?auto_362737 ?auto_362742 ) ) ( not ( = ?auto_362734 ?auto_362739 ) ) ( not ( = ?auto_362734 ?auto_362741 ) ) ( not ( = ?auto_362734 ?auto_362743 ) ) ( not ( = ?auto_362738 ?auto_362740 ) ) ( not ( = ?auto_362738 ?auto_362744 ) ) ( not ( = ?auto_362738 ?auto_362742 ) ) ( not ( = ?auto_362739 ?auto_362741 ) ) ( not ( = ?auto_362739 ?auto_362743 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362742 ?auto_362743 ?auto_362740 ?auto_362741 )
      ( GET-4IMAGE-VERIFY ?auto_362735 ?auto_362736 ?auto_362737 ?auto_362734 ?auto_362738 ?auto_362739 ?auto_362740 ?auto_362741 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362759 - DIRECTION
      ?auto_362760 - MODE
      ?auto_362761 - DIRECTION
      ?auto_362758 - MODE
      ?auto_362762 - DIRECTION
      ?auto_362763 - MODE
      ?auto_362764 - DIRECTION
      ?auto_362765 - MODE
    )
    :vars
    (
      ?auto_362770 - INSTRUMENT
      ?auto_362769 - SATELLITE
      ?auto_362768 - DIRECTION
      ?auto_362766 - DIRECTION
      ?auto_362767 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_362770 ?auto_362769 ) ( SUPPORTS ?auto_362770 ?auto_362763 ) ( POWER_ON ?auto_362770 ) ( POINTING ?auto_362769 ?auto_362768 ) ( not ( = ?auto_362762 ?auto_362768 ) ) ( HAVE_IMAGE ?auto_362766 ?auto_362767 ) ( not ( = ?auto_362766 ?auto_362762 ) ) ( not ( = ?auto_362766 ?auto_362768 ) ) ( not ( = ?auto_362767 ?auto_362763 ) ) ( CALIBRATION_TARGET ?auto_362770 ?auto_362768 ) ( NOT_CALIBRATED ?auto_362770 ) ( HAVE_IMAGE ?auto_362759 ?auto_362760 ) ( HAVE_IMAGE ?auto_362761 ?auto_362758 ) ( HAVE_IMAGE ?auto_362764 ?auto_362765 ) ( not ( = ?auto_362759 ?auto_362761 ) ) ( not ( = ?auto_362759 ?auto_362762 ) ) ( not ( = ?auto_362759 ?auto_362764 ) ) ( not ( = ?auto_362759 ?auto_362768 ) ) ( not ( = ?auto_362759 ?auto_362766 ) ) ( not ( = ?auto_362760 ?auto_362758 ) ) ( not ( = ?auto_362760 ?auto_362763 ) ) ( not ( = ?auto_362760 ?auto_362765 ) ) ( not ( = ?auto_362760 ?auto_362767 ) ) ( not ( = ?auto_362761 ?auto_362762 ) ) ( not ( = ?auto_362761 ?auto_362764 ) ) ( not ( = ?auto_362761 ?auto_362768 ) ) ( not ( = ?auto_362761 ?auto_362766 ) ) ( not ( = ?auto_362758 ?auto_362763 ) ) ( not ( = ?auto_362758 ?auto_362765 ) ) ( not ( = ?auto_362758 ?auto_362767 ) ) ( not ( = ?auto_362762 ?auto_362764 ) ) ( not ( = ?auto_362763 ?auto_362765 ) ) ( not ( = ?auto_362764 ?auto_362768 ) ) ( not ( = ?auto_362764 ?auto_362766 ) ) ( not ( = ?auto_362765 ?auto_362767 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362766 ?auto_362767 ?auto_362762 ?auto_362763 )
      ( GET-4IMAGE-VERIFY ?auto_362759 ?auto_362760 ?auto_362761 ?auto_362758 ?auto_362762 ?auto_362763 ?auto_362764 ?auto_362765 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362785 - DIRECTION
      ?auto_362786 - MODE
      ?auto_362787 - DIRECTION
      ?auto_362784 - MODE
      ?auto_362788 - DIRECTION
      ?auto_362789 - MODE
      ?auto_362790 - DIRECTION
      ?auto_362791 - MODE
    )
    :vars
    (
      ?auto_362794 - INSTRUMENT
      ?auto_362793 - SATELLITE
      ?auto_362792 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362794 ?auto_362793 ) ( SUPPORTS ?auto_362794 ?auto_362784 ) ( POWER_ON ?auto_362794 ) ( POINTING ?auto_362793 ?auto_362792 ) ( not ( = ?auto_362787 ?auto_362792 ) ) ( HAVE_IMAGE ?auto_362788 ?auto_362791 ) ( not ( = ?auto_362788 ?auto_362787 ) ) ( not ( = ?auto_362788 ?auto_362792 ) ) ( not ( = ?auto_362791 ?auto_362784 ) ) ( CALIBRATION_TARGET ?auto_362794 ?auto_362792 ) ( NOT_CALIBRATED ?auto_362794 ) ( HAVE_IMAGE ?auto_362785 ?auto_362786 ) ( HAVE_IMAGE ?auto_362788 ?auto_362789 ) ( HAVE_IMAGE ?auto_362790 ?auto_362791 ) ( not ( = ?auto_362785 ?auto_362787 ) ) ( not ( = ?auto_362785 ?auto_362788 ) ) ( not ( = ?auto_362785 ?auto_362790 ) ) ( not ( = ?auto_362785 ?auto_362792 ) ) ( not ( = ?auto_362786 ?auto_362784 ) ) ( not ( = ?auto_362786 ?auto_362789 ) ) ( not ( = ?auto_362786 ?auto_362791 ) ) ( not ( = ?auto_362787 ?auto_362790 ) ) ( not ( = ?auto_362784 ?auto_362789 ) ) ( not ( = ?auto_362788 ?auto_362790 ) ) ( not ( = ?auto_362789 ?auto_362791 ) ) ( not ( = ?auto_362790 ?auto_362792 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362788 ?auto_362791 ?auto_362787 ?auto_362784 )
      ( GET-4IMAGE-VERIFY ?auto_362785 ?auto_362786 ?auto_362787 ?auto_362784 ?auto_362788 ?auto_362789 ?auto_362790 ?auto_362791 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362829 - DIRECTION
      ?auto_362830 - MODE
      ?auto_362831 - DIRECTION
      ?auto_362828 - MODE
      ?auto_362832 - DIRECTION
      ?auto_362833 - MODE
      ?auto_362834 - DIRECTION
      ?auto_362835 - MODE
    )
    :vars
    (
      ?auto_362840 - INSTRUMENT
      ?auto_362839 - SATELLITE
      ?auto_362838 - DIRECTION
      ?auto_362836 - DIRECTION
      ?auto_362837 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_362840 ?auto_362839 ) ( SUPPORTS ?auto_362840 ?auto_362828 ) ( POWER_ON ?auto_362840 ) ( POINTING ?auto_362839 ?auto_362838 ) ( not ( = ?auto_362831 ?auto_362838 ) ) ( HAVE_IMAGE ?auto_362836 ?auto_362837 ) ( not ( = ?auto_362836 ?auto_362831 ) ) ( not ( = ?auto_362836 ?auto_362838 ) ) ( not ( = ?auto_362837 ?auto_362828 ) ) ( CALIBRATION_TARGET ?auto_362840 ?auto_362838 ) ( NOT_CALIBRATED ?auto_362840 ) ( HAVE_IMAGE ?auto_362829 ?auto_362830 ) ( HAVE_IMAGE ?auto_362832 ?auto_362833 ) ( HAVE_IMAGE ?auto_362834 ?auto_362835 ) ( not ( = ?auto_362829 ?auto_362831 ) ) ( not ( = ?auto_362829 ?auto_362832 ) ) ( not ( = ?auto_362829 ?auto_362834 ) ) ( not ( = ?auto_362829 ?auto_362838 ) ) ( not ( = ?auto_362829 ?auto_362836 ) ) ( not ( = ?auto_362830 ?auto_362828 ) ) ( not ( = ?auto_362830 ?auto_362833 ) ) ( not ( = ?auto_362830 ?auto_362835 ) ) ( not ( = ?auto_362830 ?auto_362837 ) ) ( not ( = ?auto_362831 ?auto_362832 ) ) ( not ( = ?auto_362831 ?auto_362834 ) ) ( not ( = ?auto_362828 ?auto_362833 ) ) ( not ( = ?auto_362828 ?auto_362835 ) ) ( not ( = ?auto_362832 ?auto_362834 ) ) ( not ( = ?auto_362832 ?auto_362838 ) ) ( not ( = ?auto_362832 ?auto_362836 ) ) ( not ( = ?auto_362833 ?auto_362835 ) ) ( not ( = ?auto_362833 ?auto_362837 ) ) ( not ( = ?auto_362834 ?auto_362838 ) ) ( not ( = ?auto_362834 ?auto_362836 ) ) ( not ( = ?auto_362835 ?auto_362837 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362836 ?auto_362837 ?auto_362831 ?auto_362828 )
      ( GET-4IMAGE-VERIFY ?auto_362829 ?auto_362830 ?auto_362831 ?auto_362828 ?auto_362832 ?auto_362833 ?auto_362834 ?auto_362835 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362892 - DIRECTION
      ?auto_362893 - MODE
      ?auto_362894 - DIRECTION
      ?auto_362891 - MODE
      ?auto_362895 - DIRECTION
      ?auto_362896 - MODE
      ?auto_362897 - DIRECTION
      ?auto_362898 - MODE
    )
    :vars
    (
      ?auto_362901 - INSTRUMENT
      ?auto_362900 - SATELLITE
      ?auto_362899 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362901 ?auto_362900 ) ( SUPPORTS ?auto_362901 ?auto_362893 ) ( POWER_ON ?auto_362901 ) ( POINTING ?auto_362900 ?auto_362899 ) ( not ( = ?auto_362892 ?auto_362899 ) ) ( HAVE_IMAGE ?auto_362895 ?auto_362898 ) ( not ( = ?auto_362895 ?auto_362892 ) ) ( not ( = ?auto_362895 ?auto_362899 ) ) ( not ( = ?auto_362898 ?auto_362893 ) ) ( CALIBRATION_TARGET ?auto_362901 ?auto_362899 ) ( NOT_CALIBRATED ?auto_362901 ) ( HAVE_IMAGE ?auto_362894 ?auto_362891 ) ( HAVE_IMAGE ?auto_362895 ?auto_362896 ) ( HAVE_IMAGE ?auto_362897 ?auto_362898 ) ( not ( = ?auto_362892 ?auto_362894 ) ) ( not ( = ?auto_362892 ?auto_362897 ) ) ( not ( = ?auto_362893 ?auto_362891 ) ) ( not ( = ?auto_362893 ?auto_362896 ) ) ( not ( = ?auto_362894 ?auto_362895 ) ) ( not ( = ?auto_362894 ?auto_362897 ) ) ( not ( = ?auto_362894 ?auto_362899 ) ) ( not ( = ?auto_362891 ?auto_362896 ) ) ( not ( = ?auto_362891 ?auto_362898 ) ) ( not ( = ?auto_362895 ?auto_362897 ) ) ( not ( = ?auto_362896 ?auto_362898 ) ) ( not ( = ?auto_362897 ?auto_362899 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362895 ?auto_362898 ?auto_362892 ?auto_362893 )
      ( GET-4IMAGE-VERIFY ?auto_362892 ?auto_362893 ?auto_362894 ?auto_362891 ?auto_362895 ?auto_362896 ?auto_362897 ?auto_362898 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_362903 - DIRECTION
      ?auto_362904 - MODE
      ?auto_362905 - DIRECTION
      ?auto_362902 - MODE
      ?auto_362906 - DIRECTION
      ?auto_362907 - MODE
      ?auto_362908 - DIRECTION
      ?auto_362909 - MODE
    )
    :vars
    (
      ?auto_362912 - INSTRUMENT
      ?auto_362911 - SATELLITE
      ?auto_362910 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_362912 ?auto_362911 ) ( SUPPORTS ?auto_362912 ?auto_362904 ) ( POWER_ON ?auto_362912 ) ( POINTING ?auto_362911 ?auto_362910 ) ( not ( = ?auto_362903 ?auto_362910 ) ) ( HAVE_IMAGE ?auto_362906 ?auto_362907 ) ( not ( = ?auto_362906 ?auto_362903 ) ) ( not ( = ?auto_362906 ?auto_362910 ) ) ( not ( = ?auto_362907 ?auto_362904 ) ) ( CALIBRATION_TARGET ?auto_362912 ?auto_362910 ) ( NOT_CALIBRATED ?auto_362912 ) ( HAVE_IMAGE ?auto_362905 ?auto_362902 ) ( HAVE_IMAGE ?auto_362908 ?auto_362909 ) ( not ( = ?auto_362903 ?auto_362905 ) ) ( not ( = ?auto_362903 ?auto_362908 ) ) ( not ( = ?auto_362904 ?auto_362902 ) ) ( not ( = ?auto_362904 ?auto_362909 ) ) ( not ( = ?auto_362905 ?auto_362906 ) ) ( not ( = ?auto_362905 ?auto_362908 ) ) ( not ( = ?auto_362905 ?auto_362910 ) ) ( not ( = ?auto_362902 ?auto_362907 ) ) ( not ( = ?auto_362902 ?auto_362909 ) ) ( not ( = ?auto_362906 ?auto_362908 ) ) ( not ( = ?auto_362907 ?auto_362909 ) ) ( not ( = ?auto_362908 ?auto_362910 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_362906 ?auto_362907 ?auto_362903 ?auto_362904 )
      ( GET-4IMAGE-VERIFY ?auto_362903 ?auto_362904 ?auto_362905 ?auto_362902 ?auto_362906 ?auto_362907 ?auto_362908 ?auto_362909 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363024 - DIRECTION
      ?auto_363025 - MODE
      ?auto_363026 - DIRECTION
      ?auto_363023 - MODE
      ?auto_363027 - DIRECTION
      ?auto_363028 - MODE
      ?auto_363029 - DIRECTION
      ?auto_363030 - MODE
    )
    :vars
    (
      ?auto_363033 - INSTRUMENT
      ?auto_363032 - SATELLITE
      ?auto_363031 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363033 ?auto_363032 ) ( SUPPORTS ?auto_363033 ?auto_363025 ) ( POWER_ON ?auto_363033 ) ( POINTING ?auto_363032 ?auto_363031 ) ( not ( = ?auto_363024 ?auto_363031 ) ) ( HAVE_IMAGE ?auto_363029 ?auto_363030 ) ( not ( = ?auto_363029 ?auto_363024 ) ) ( not ( = ?auto_363029 ?auto_363031 ) ) ( not ( = ?auto_363030 ?auto_363025 ) ) ( CALIBRATION_TARGET ?auto_363033 ?auto_363031 ) ( NOT_CALIBRATED ?auto_363033 ) ( HAVE_IMAGE ?auto_363026 ?auto_363023 ) ( HAVE_IMAGE ?auto_363027 ?auto_363028 ) ( not ( = ?auto_363024 ?auto_363026 ) ) ( not ( = ?auto_363024 ?auto_363027 ) ) ( not ( = ?auto_363025 ?auto_363023 ) ) ( not ( = ?auto_363025 ?auto_363028 ) ) ( not ( = ?auto_363026 ?auto_363027 ) ) ( not ( = ?auto_363026 ?auto_363029 ) ) ( not ( = ?auto_363026 ?auto_363031 ) ) ( not ( = ?auto_363023 ?auto_363028 ) ) ( not ( = ?auto_363023 ?auto_363030 ) ) ( not ( = ?auto_363027 ?auto_363029 ) ) ( not ( = ?auto_363027 ?auto_363031 ) ) ( not ( = ?auto_363028 ?auto_363030 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363029 ?auto_363030 ?auto_363024 ?auto_363025 )
      ( GET-4IMAGE-VERIFY ?auto_363024 ?auto_363025 ?auto_363026 ?auto_363023 ?auto_363027 ?auto_363028 ?auto_363029 ?auto_363030 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363035 - DIRECTION
      ?auto_363036 - MODE
      ?auto_363037 - DIRECTION
      ?auto_363034 - MODE
      ?auto_363038 - DIRECTION
      ?auto_363039 - MODE
      ?auto_363040 - DIRECTION
      ?auto_363041 - MODE
    )
    :vars
    (
      ?auto_363046 - INSTRUMENT
      ?auto_363045 - SATELLITE
      ?auto_363044 - DIRECTION
      ?auto_363042 - DIRECTION
      ?auto_363043 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_363046 ?auto_363045 ) ( SUPPORTS ?auto_363046 ?auto_363036 ) ( POWER_ON ?auto_363046 ) ( POINTING ?auto_363045 ?auto_363044 ) ( not ( = ?auto_363035 ?auto_363044 ) ) ( HAVE_IMAGE ?auto_363042 ?auto_363043 ) ( not ( = ?auto_363042 ?auto_363035 ) ) ( not ( = ?auto_363042 ?auto_363044 ) ) ( not ( = ?auto_363043 ?auto_363036 ) ) ( CALIBRATION_TARGET ?auto_363046 ?auto_363044 ) ( NOT_CALIBRATED ?auto_363046 ) ( HAVE_IMAGE ?auto_363037 ?auto_363034 ) ( HAVE_IMAGE ?auto_363038 ?auto_363039 ) ( HAVE_IMAGE ?auto_363040 ?auto_363041 ) ( not ( = ?auto_363035 ?auto_363037 ) ) ( not ( = ?auto_363035 ?auto_363038 ) ) ( not ( = ?auto_363035 ?auto_363040 ) ) ( not ( = ?auto_363036 ?auto_363034 ) ) ( not ( = ?auto_363036 ?auto_363039 ) ) ( not ( = ?auto_363036 ?auto_363041 ) ) ( not ( = ?auto_363037 ?auto_363038 ) ) ( not ( = ?auto_363037 ?auto_363040 ) ) ( not ( = ?auto_363037 ?auto_363044 ) ) ( not ( = ?auto_363037 ?auto_363042 ) ) ( not ( = ?auto_363034 ?auto_363039 ) ) ( not ( = ?auto_363034 ?auto_363041 ) ) ( not ( = ?auto_363034 ?auto_363043 ) ) ( not ( = ?auto_363038 ?auto_363040 ) ) ( not ( = ?auto_363038 ?auto_363044 ) ) ( not ( = ?auto_363038 ?auto_363042 ) ) ( not ( = ?auto_363039 ?auto_363041 ) ) ( not ( = ?auto_363039 ?auto_363043 ) ) ( not ( = ?auto_363040 ?auto_363044 ) ) ( not ( = ?auto_363040 ?auto_363042 ) ) ( not ( = ?auto_363041 ?auto_363043 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363042 ?auto_363043 ?auto_363035 ?auto_363036 )
      ( GET-4IMAGE-VERIFY ?auto_363035 ?auto_363036 ?auto_363037 ?auto_363034 ?auto_363038 ?auto_363039 ?auto_363040 ?auto_363041 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_363243 - DIRECTION
      ?auto_363244 - MODE
      ?auto_363245 - DIRECTION
      ?auto_363242 - MODE
      ?auto_363246 - DIRECTION
      ?auto_363247 - MODE
    )
    :vars
    (
      ?auto_363250 - INSTRUMENT
      ?auto_363249 - SATELLITE
      ?auto_363248 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363250 ?auto_363249 ) ( SUPPORTS ?auto_363250 ?auto_363247 ) ( POINTING ?auto_363249 ?auto_363248 ) ( not ( = ?auto_363246 ?auto_363248 ) ) ( HAVE_IMAGE ?auto_363243 ?auto_363244 ) ( not ( = ?auto_363243 ?auto_363246 ) ) ( not ( = ?auto_363243 ?auto_363248 ) ) ( not ( = ?auto_363244 ?auto_363247 ) ) ( CALIBRATION_TARGET ?auto_363250 ?auto_363248 ) ( POWER_AVAIL ?auto_363249 ) ( HAVE_IMAGE ?auto_363245 ?auto_363242 ) ( not ( = ?auto_363243 ?auto_363245 ) ) ( not ( = ?auto_363244 ?auto_363242 ) ) ( not ( = ?auto_363245 ?auto_363246 ) ) ( not ( = ?auto_363245 ?auto_363248 ) ) ( not ( = ?auto_363242 ?auto_363247 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363243 ?auto_363244 ?auto_363246 ?auto_363247 )
      ( GET-3IMAGE-VERIFY ?auto_363243 ?auto_363244 ?auto_363245 ?auto_363242 ?auto_363246 ?auto_363247 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_363288 - DIRECTION
      ?auto_363289 - MODE
      ?auto_363290 - DIRECTION
      ?auto_363287 - MODE
      ?auto_363291 - DIRECTION
      ?auto_363292 - MODE
    )
    :vars
    (
      ?auto_363296 - INSTRUMENT
      ?auto_363295 - SATELLITE
      ?auto_363293 - DIRECTION
      ?auto_363297 - DIRECTION
      ?auto_363294 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_363296 ?auto_363295 ) ( SUPPORTS ?auto_363296 ?auto_363292 ) ( POINTING ?auto_363295 ?auto_363293 ) ( not ( = ?auto_363291 ?auto_363293 ) ) ( HAVE_IMAGE ?auto_363297 ?auto_363294 ) ( not ( = ?auto_363297 ?auto_363291 ) ) ( not ( = ?auto_363297 ?auto_363293 ) ) ( not ( = ?auto_363294 ?auto_363292 ) ) ( CALIBRATION_TARGET ?auto_363296 ?auto_363293 ) ( POWER_AVAIL ?auto_363295 ) ( HAVE_IMAGE ?auto_363288 ?auto_363289 ) ( HAVE_IMAGE ?auto_363290 ?auto_363287 ) ( not ( = ?auto_363288 ?auto_363290 ) ) ( not ( = ?auto_363288 ?auto_363291 ) ) ( not ( = ?auto_363288 ?auto_363293 ) ) ( not ( = ?auto_363288 ?auto_363297 ) ) ( not ( = ?auto_363289 ?auto_363287 ) ) ( not ( = ?auto_363289 ?auto_363292 ) ) ( not ( = ?auto_363289 ?auto_363294 ) ) ( not ( = ?auto_363290 ?auto_363291 ) ) ( not ( = ?auto_363290 ?auto_363293 ) ) ( not ( = ?auto_363290 ?auto_363297 ) ) ( not ( = ?auto_363287 ?auto_363292 ) ) ( not ( = ?auto_363287 ?auto_363294 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363297 ?auto_363294 ?auto_363291 ?auto_363292 )
      ( GET-3IMAGE-VERIFY ?auto_363288 ?auto_363289 ?auto_363290 ?auto_363287 ?auto_363291 ?auto_363292 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_363305 - DIRECTION
      ?auto_363306 - MODE
      ?auto_363307 - DIRECTION
      ?auto_363304 - MODE
      ?auto_363308 - DIRECTION
      ?auto_363309 - MODE
    )
    :vars
    (
      ?auto_363313 - INSTRUMENT
      ?auto_363312 - SATELLITE
      ?auto_363310 - DIRECTION
      ?auto_363314 - DIRECTION
      ?auto_363311 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_363313 ?auto_363312 ) ( SUPPORTS ?auto_363313 ?auto_363304 ) ( POINTING ?auto_363312 ?auto_363310 ) ( not ( = ?auto_363307 ?auto_363310 ) ) ( HAVE_IMAGE ?auto_363314 ?auto_363311 ) ( not ( = ?auto_363314 ?auto_363307 ) ) ( not ( = ?auto_363314 ?auto_363310 ) ) ( not ( = ?auto_363311 ?auto_363304 ) ) ( CALIBRATION_TARGET ?auto_363313 ?auto_363310 ) ( POWER_AVAIL ?auto_363312 ) ( HAVE_IMAGE ?auto_363305 ?auto_363306 ) ( HAVE_IMAGE ?auto_363308 ?auto_363309 ) ( not ( = ?auto_363305 ?auto_363307 ) ) ( not ( = ?auto_363305 ?auto_363308 ) ) ( not ( = ?auto_363305 ?auto_363310 ) ) ( not ( = ?auto_363305 ?auto_363314 ) ) ( not ( = ?auto_363306 ?auto_363304 ) ) ( not ( = ?auto_363306 ?auto_363309 ) ) ( not ( = ?auto_363306 ?auto_363311 ) ) ( not ( = ?auto_363307 ?auto_363308 ) ) ( not ( = ?auto_363304 ?auto_363309 ) ) ( not ( = ?auto_363308 ?auto_363310 ) ) ( not ( = ?auto_363308 ?auto_363314 ) ) ( not ( = ?auto_363309 ?auto_363311 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363314 ?auto_363311 ?auto_363307 ?auto_363304 )
      ( GET-3IMAGE-VERIFY ?auto_363305 ?auto_363306 ?auto_363307 ?auto_363304 ?auto_363308 ?auto_363309 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_363357 - DIRECTION
      ?auto_363358 - MODE
      ?auto_363359 - DIRECTION
      ?auto_363356 - MODE
      ?auto_363360 - DIRECTION
      ?auto_363361 - MODE
    )
    :vars
    (
      ?auto_363365 - INSTRUMENT
      ?auto_363364 - SATELLITE
      ?auto_363362 - DIRECTION
      ?auto_363366 - DIRECTION
      ?auto_363363 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_363365 ?auto_363364 ) ( SUPPORTS ?auto_363365 ?auto_363358 ) ( POINTING ?auto_363364 ?auto_363362 ) ( not ( = ?auto_363357 ?auto_363362 ) ) ( HAVE_IMAGE ?auto_363366 ?auto_363363 ) ( not ( = ?auto_363366 ?auto_363357 ) ) ( not ( = ?auto_363366 ?auto_363362 ) ) ( not ( = ?auto_363363 ?auto_363358 ) ) ( CALIBRATION_TARGET ?auto_363365 ?auto_363362 ) ( POWER_AVAIL ?auto_363364 ) ( HAVE_IMAGE ?auto_363359 ?auto_363356 ) ( HAVE_IMAGE ?auto_363360 ?auto_363361 ) ( not ( = ?auto_363357 ?auto_363359 ) ) ( not ( = ?auto_363357 ?auto_363360 ) ) ( not ( = ?auto_363358 ?auto_363356 ) ) ( not ( = ?auto_363358 ?auto_363361 ) ) ( not ( = ?auto_363359 ?auto_363360 ) ) ( not ( = ?auto_363359 ?auto_363362 ) ) ( not ( = ?auto_363359 ?auto_363366 ) ) ( not ( = ?auto_363356 ?auto_363361 ) ) ( not ( = ?auto_363356 ?auto_363363 ) ) ( not ( = ?auto_363360 ?auto_363362 ) ) ( not ( = ?auto_363360 ?auto_363366 ) ) ( not ( = ?auto_363361 ?auto_363363 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363366 ?auto_363363 ?auto_363357 ?auto_363358 )
      ( GET-3IMAGE-VERIFY ?auto_363357 ?auto_363358 ?auto_363359 ?auto_363356 ?auto_363360 ?auto_363361 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363410 - DIRECTION
      ?auto_363411 - MODE
      ?auto_363412 - DIRECTION
      ?auto_363409 - MODE
      ?auto_363413 - DIRECTION
      ?auto_363414 - MODE
      ?auto_363415 - DIRECTION
      ?auto_363416 - MODE
    )
    :vars
    (
      ?auto_363419 - INSTRUMENT
      ?auto_363418 - SATELLITE
      ?auto_363417 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363419 ?auto_363418 ) ( SUPPORTS ?auto_363419 ?auto_363416 ) ( POINTING ?auto_363418 ?auto_363417 ) ( not ( = ?auto_363415 ?auto_363417 ) ) ( HAVE_IMAGE ?auto_363413 ?auto_363409 ) ( not ( = ?auto_363413 ?auto_363415 ) ) ( not ( = ?auto_363413 ?auto_363417 ) ) ( not ( = ?auto_363409 ?auto_363416 ) ) ( CALIBRATION_TARGET ?auto_363419 ?auto_363417 ) ( POWER_AVAIL ?auto_363418 ) ( HAVE_IMAGE ?auto_363410 ?auto_363411 ) ( HAVE_IMAGE ?auto_363412 ?auto_363409 ) ( HAVE_IMAGE ?auto_363413 ?auto_363414 ) ( not ( = ?auto_363410 ?auto_363412 ) ) ( not ( = ?auto_363410 ?auto_363413 ) ) ( not ( = ?auto_363410 ?auto_363415 ) ) ( not ( = ?auto_363410 ?auto_363417 ) ) ( not ( = ?auto_363411 ?auto_363409 ) ) ( not ( = ?auto_363411 ?auto_363414 ) ) ( not ( = ?auto_363411 ?auto_363416 ) ) ( not ( = ?auto_363412 ?auto_363413 ) ) ( not ( = ?auto_363412 ?auto_363415 ) ) ( not ( = ?auto_363412 ?auto_363417 ) ) ( not ( = ?auto_363409 ?auto_363414 ) ) ( not ( = ?auto_363414 ?auto_363416 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363413 ?auto_363409 ?auto_363415 ?auto_363416 )
      ( GET-4IMAGE-VERIFY ?auto_363410 ?auto_363411 ?auto_363412 ?auto_363409 ?auto_363413 ?auto_363414 ?auto_363415 ?auto_363416 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363421 - DIRECTION
      ?auto_363422 - MODE
      ?auto_363423 - DIRECTION
      ?auto_363420 - MODE
      ?auto_363424 - DIRECTION
      ?auto_363425 - MODE
      ?auto_363426 - DIRECTION
      ?auto_363427 - MODE
    )
    :vars
    (
      ?auto_363430 - INSTRUMENT
      ?auto_363429 - SATELLITE
      ?auto_363428 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363430 ?auto_363429 ) ( SUPPORTS ?auto_363430 ?auto_363427 ) ( POINTING ?auto_363429 ?auto_363428 ) ( not ( = ?auto_363426 ?auto_363428 ) ) ( HAVE_IMAGE ?auto_363423 ?auto_363422 ) ( not ( = ?auto_363423 ?auto_363426 ) ) ( not ( = ?auto_363423 ?auto_363428 ) ) ( not ( = ?auto_363422 ?auto_363427 ) ) ( CALIBRATION_TARGET ?auto_363430 ?auto_363428 ) ( POWER_AVAIL ?auto_363429 ) ( HAVE_IMAGE ?auto_363421 ?auto_363422 ) ( HAVE_IMAGE ?auto_363423 ?auto_363420 ) ( HAVE_IMAGE ?auto_363424 ?auto_363425 ) ( not ( = ?auto_363421 ?auto_363423 ) ) ( not ( = ?auto_363421 ?auto_363424 ) ) ( not ( = ?auto_363421 ?auto_363426 ) ) ( not ( = ?auto_363421 ?auto_363428 ) ) ( not ( = ?auto_363422 ?auto_363420 ) ) ( not ( = ?auto_363422 ?auto_363425 ) ) ( not ( = ?auto_363423 ?auto_363424 ) ) ( not ( = ?auto_363420 ?auto_363425 ) ) ( not ( = ?auto_363420 ?auto_363427 ) ) ( not ( = ?auto_363424 ?auto_363426 ) ) ( not ( = ?auto_363424 ?auto_363428 ) ) ( not ( = ?auto_363425 ?auto_363427 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363423 ?auto_363422 ?auto_363426 ?auto_363427 )
      ( GET-4IMAGE-VERIFY ?auto_363421 ?auto_363422 ?auto_363423 ?auto_363420 ?auto_363424 ?auto_363425 ?auto_363426 ?auto_363427 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363432 - DIRECTION
      ?auto_363433 - MODE
      ?auto_363434 - DIRECTION
      ?auto_363431 - MODE
      ?auto_363435 - DIRECTION
      ?auto_363436 - MODE
      ?auto_363437 - DIRECTION
      ?auto_363438 - MODE
    )
    :vars
    (
      ?auto_363441 - INSTRUMENT
      ?auto_363440 - SATELLITE
      ?auto_363439 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363441 ?auto_363440 ) ( SUPPORTS ?auto_363441 ?auto_363436 ) ( POINTING ?auto_363440 ?auto_363439 ) ( not ( = ?auto_363435 ?auto_363439 ) ) ( HAVE_IMAGE ?auto_363434 ?auto_363438 ) ( not ( = ?auto_363434 ?auto_363435 ) ) ( not ( = ?auto_363434 ?auto_363439 ) ) ( not ( = ?auto_363438 ?auto_363436 ) ) ( CALIBRATION_TARGET ?auto_363441 ?auto_363439 ) ( POWER_AVAIL ?auto_363440 ) ( HAVE_IMAGE ?auto_363432 ?auto_363433 ) ( HAVE_IMAGE ?auto_363434 ?auto_363431 ) ( HAVE_IMAGE ?auto_363437 ?auto_363438 ) ( not ( = ?auto_363432 ?auto_363434 ) ) ( not ( = ?auto_363432 ?auto_363435 ) ) ( not ( = ?auto_363432 ?auto_363437 ) ) ( not ( = ?auto_363432 ?auto_363439 ) ) ( not ( = ?auto_363433 ?auto_363431 ) ) ( not ( = ?auto_363433 ?auto_363436 ) ) ( not ( = ?auto_363433 ?auto_363438 ) ) ( not ( = ?auto_363434 ?auto_363437 ) ) ( not ( = ?auto_363431 ?auto_363436 ) ) ( not ( = ?auto_363431 ?auto_363438 ) ) ( not ( = ?auto_363435 ?auto_363437 ) ) ( not ( = ?auto_363437 ?auto_363439 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363434 ?auto_363438 ?auto_363435 ?auto_363436 )
      ( GET-4IMAGE-VERIFY ?auto_363432 ?auto_363433 ?auto_363434 ?auto_363431 ?auto_363435 ?auto_363436 ?auto_363437 ?auto_363438 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363443 - DIRECTION
      ?auto_363444 - MODE
      ?auto_363445 - DIRECTION
      ?auto_363442 - MODE
      ?auto_363446 - DIRECTION
      ?auto_363447 - MODE
      ?auto_363448 - DIRECTION
      ?auto_363449 - MODE
    )
    :vars
    (
      ?auto_363452 - INSTRUMENT
      ?auto_363451 - SATELLITE
      ?auto_363450 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363452 ?auto_363451 ) ( SUPPORTS ?auto_363452 ?auto_363447 ) ( POINTING ?auto_363451 ?auto_363450 ) ( not ( = ?auto_363446 ?auto_363450 ) ) ( HAVE_IMAGE ?auto_363445 ?auto_363444 ) ( not ( = ?auto_363445 ?auto_363446 ) ) ( not ( = ?auto_363445 ?auto_363450 ) ) ( not ( = ?auto_363444 ?auto_363447 ) ) ( CALIBRATION_TARGET ?auto_363452 ?auto_363450 ) ( POWER_AVAIL ?auto_363451 ) ( HAVE_IMAGE ?auto_363443 ?auto_363444 ) ( HAVE_IMAGE ?auto_363445 ?auto_363442 ) ( HAVE_IMAGE ?auto_363448 ?auto_363449 ) ( not ( = ?auto_363443 ?auto_363445 ) ) ( not ( = ?auto_363443 ?auto_363446 ) ) ( not ( = ?auto_363443 ?auto_363448 ) ) ( not ( = ?auto_363443 ?auto_363450 ) ) ( not ( = ?auto_363444 ?auto_363442 ) ) ( not ( = ?auto_363444 ?auto_363449 ) ) ( not ( = ?auto_363445 ?auto_363448 ) ) ( not ( = ?auto_363442 ?auto_363447 ) ) ( not ( = ?auto_363442 ?auto_363449 ) ) ( not ( = ?auto_363446 ?auto_363448 ) ) ( not ( = ?auto_363447 ?auto_363449 ) ) ( not ( = ?auto_363448 ?auto_363450 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363445 ?auto_363444 ?auto_363446 ?auto_363447 )
      ( GET-4IMAGE-VERIFY ?auto_363443 ?auto_363444 ?auto_363445 ?auto_363442 ?auto_363446 ?auto_363447 ?auto_363448 ?auto_363449 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363465 - DIRECTION
      ?auto_363466 - MODE
      ?auto_363467 - DIRECTION
      ?auto_363464 - MODE
      ?auto_363468 - DIRECTION
      ?auto_363469 - MODE
      ?auto_363470 - DIRECTION
      ?auto_363471 - MODE
    )
    :vars
    (
      ?auto_363474 - INSTRUMENT
      ?auto_363473 - SATELLITE
      ?auto_363472 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363474 ?auto_363473 ) ( SUPPORTS ?auto_363474 ?auto_363471 ) ( POINTING ?auto_363473 ?auto_363472 ) ( not ( = ?auto_363470 ?auto_363472 ) ) ( HAVE_IMAGE ?auto_363468 ?auto_363469 ) ( not ( = ?auto_363468 ?auto_363470 ) ) ( not ( = ?auto_363468 ?auto_363472 ) ) ( not ( = ?auto_363469 ?auto_363471 ) ) ( CALIBRATION_TARGET ?auto_363474 ?auto_363472 ) ( POWER_AVAIL ?auto_363473 ) ( HAVE_IMAGE ?auto_363465 ?auto_363466 ) ( HAVE_IMAGE ?auto_363467 ?auto_363464 ) ( not ( = ?auto_363465 ?auto_363467 ) ) ( not ( = ?auto_363465 ?auto_363468 ) ) ( not ( = ?auto_363465 ?auto_363470 ) ) ( not ( = ?auto_363465 ?auto_363472 ) ) ( not ( = ?auto_363466 ?auto_363464 ) ) ( not ( = ?auto_363466 ?auto_363469 ) ) ( not ( = ?auto_363466 ?auto_363471 ) ) ( not ( = ?auto_363467 ?auto_363468 ) ) ( not ( = ?auto_363467 ?auto_363470 ) ) ( not ( = ?auto_363467 ?auto_363472 ) ) ( not ( = ?auto_363464 ?auto_363469 ) ) ( not ( = ?auto_363464 ?auto_363471 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363468 ?auto_363469 ?auto_363470 ?auto_363471 )
      ( GET-4IMAGE-VERIFY ?auto_363465 ?auto_363466 ?auto_363467 ?auto_363464 ?auto_363468 ?auto_363469 ?auto_363470 ?auto_363471 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363476 - DIRECTION
      ?auto_363477 - MODE
      ?auto_363478 - DIRECTION
      ?auto_363475 - MODE
      ?auto_363479 - DIRECTION
      ?auto_363480 - MODE
      ?auto_363481 - DIRECTION
      ?auto_363482 - MODE
    )
    :vars
    (
      ?auto_363485 - INSTRUMENT
      ?auto_363484 - SATELLITE
      ?auto_363483 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363485 ?auto_363484 ) ( SUPPORTS ?auto_363485 ?auto_363482 ) ( POINTING ?auto_363484 ?auto_363483 ) ( not ( = ?auto_363481 ?auto_363483 ) ) ( HAVE_IMAGE ?auto_363476 ?auto_363477 ) ( not ( = ?auto_363476 ?auto_363481 ) ) ( not ( = ?auto_363476 ?auto_363483 ) ) ( not ( = ?auto_363477 ?auto_363482 ) ) ( CALIBRATION_TARGET ?auto_363485 ?auto_363483 ) ( POWER_AVAIL ?auto_363484 ) ( HAVE_IMAGE ?auto_363478 ?auto_363475 ) ( HAVE_IMAGE ?auto_363479 ?auto_363480 ) ( not ( = ?auto_363476 ?auto_363478 ) ) ( not ( = ?auto_363476 ?auto_363479 ) ) ( not ( = ?auto_363477 ?auto_363475 ) ) ( not ( = ?auto_363477 ?auto_363480 ) ) ( not ( = ?auto_363478 ?auto_363479 ) ) ( not ( = ?auto_363478 ?auto_363481 ) ) ( not ( = ?auto_363478 ?auto_363483 ) ) ( not ( = ?auto_363475 ?auto_363480 ) ) ( not ( = ?auto_363475 ?auto_363482 ) ) ( not ( = ?auto_363479 ?auto_363481 ) ) ( not ( = ?auto_363479 ?auto_363483 ) ) ( not ( = ?auto_363480 ?auto_363482 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363476 ?auto_363477 ?auto_363481 ?auto_363482 )
      ( GET-4IMAGE-VERIFY ?auto_363476 ?auto_363477 ?auto_363478 ?auto_363475 ?auto_363479 ?auto_363480 ?auto_363481 ?auto_363482 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363487 - DIRECTION
      ?auto_363488 - MODE
      ?auto_363489 - DIRECTION
      ?auto_363486 - MODE
      ?auto_363490 - DIRECTION
      ?auto_363491 - MODE
      ?auto_363492 - DIRECTION
      ?auto_363493 - MODE
    )
    :vars
    (
      ?auto_363496 - INSTRUMENT
      ?auto_363495 - SATELLITE
      ?auto_363494 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363496 ?auto_363495 ) ( SUPPORTS ?auto_363496 ?auto_363491 ) ( POINTING ?auto_363495 ?auto_363494 ) ( not ( = ?auto_363490 ?auto_363494 ) ) ( HAVE_IMAGE ?auto_363487 ?auto_363493 ) ( not ( = ?auto_363487 ?auto_363490 ) ) ( not ( = ?auto_363487 ?auto_363494 ) ) ( not ( = ?auto_363493 ?auto_363491 ) ) ( CALIBRATION_TARGET ?auto_363496 ?auto_363494 ) ( POWER_AVAIL ?auto_363495 ) ( HAVE_IMAGE ?auto_363487 ?auto_363488 ) ( HAVE_IMAGE ?auto_363489 ?auto_363486 ) ( HAVE_IMAGE ?auto_363492 ?auto_363493 ) ( not ( = ?auto_363487 ?auto_363489 ) ) ( not ( = ?auto_363487 ?auto_363492 ) ) ( not ( = ?auto_363488 ?auto_363486 ) ) ( not ( = ?auto_363488 ?auto_363491 ) ) ( not ( = ?auto_363488 ?auto_363493 ) ) ( not ( = ?auto_363489 ?auto_363490 ) ) ( not ( = ?auto_363489 ?auto_363492 ) ) ( not ( = ?auto_363489 ?auto_363494 ) ) ( not ( = ?auto_363486 ?auto_363491 ) ) ( not ( = ?auto_363486 ?auto_363493 ) ) ( not ( = ?auto_363490 ?auto_363492 ) ) ( not ( = ?auto_363492 ?auto_363494 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363487 ?auto_363493 ?auto_363490 ?auto_363491 )
      ( GET-4IMAGE-VERIFY ?auto_363487 ?auto_363488 ?auto_363489 ?auto_363486 ?auto_363490 ?auto_363491 ?auto_363492 ?auto_363493 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363498 - DIRECTION
      ?auto_363499 - MODE
      ?auto_363500 - DIRECTION
      ?auto_363497 - MODE
      ?auto_363501 - DIRECTION
      ?auto_363502 - MODE
      ?auto_363503 - DIRECTION
      ?auto_363504 - MODE
    )
    :vars
    (
      ?auto_363507 - INSTRUMENT
      ?auto_363506 - SATELLITE
      ?auto_363505 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363507 ?auto_363506 ) ( SUPPORTS ?auto_363507 ?auto_363502 ) ( POINTING ?auto_363506 ?auto_363505 ) ( not ( = ?auto_363501 ?auto_363505 ) ) ( HAVE_IMAGE ?auto_363498 ?auto_363499 ) ( not ( = ?auto_363498 ?auto_363501 ) ) ( not ( = ?auto_363498 ?auto_363505 ) ) ( not ( = ?auto_363499 ?auto_363502 ) ) ( CALIBRATION_TARGET ?auto_363507 ?auto_363505 ) ( POWER_AVAIL ?auto_363506 ) ( HAVE_IMAGE ?auto_363500 ?auto_363497 ) ( HAVE_IMAGE ?auto_363503 ?auto_363504 ) ( not ( = ?auto_363498 ?auto_363500 ) ) ( not ( = ?auto_363498 ?auto_363503 ) ) ( not ( = ?auto_363499 ?auto_363497 ) ) ( not ( = ?auto_363499 ?auto_363504 ) ) ( not ( = ?auto_363500 ?auto_363501 ) ) ( not ( = ?auto_363500 ?auto_363503 ) ) ( not ( = ?auto_363500 ?auto_363505 ) ) ( not ( = ?auto_363497 ?auto_363502 ) ) ( not ( = ?auto_363497 ?auto_363504 ) ) ( not ( = ?auto_363501 ?auto_363503 ) ) ( not ( = ?auto_363502 ?auto_363504 ) ) ( not ( = ?auto_363503 ?auto_363505 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363498 ?auto_363499 ?auto_363501 ?auto_363502 )
      ( GET-4IMAGE-VERIFY ?auto_363498 ?auto_363499 ?auto_363500 ?auto_363497 ?auto_363501 ?auto_363502 ?auto_363503 ?auto_363504 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363520 - DIRECTION
      ?auto_363521 - MODE
      ?auto_363522 - DIRECTION
      ?auto_363519 - MODE
      ?auto_363523 - DIRECTION
      ?auto_363524 - MODE
      ?auto_363525 - DIRECTION
      ?auto_363526 - MODE
    )
    :vars
    (
      ?auto_363529 - INSTRUMENT
      ?auto_363528 - SATELLITE
      ?auto_363527 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363529 ?auto_363528 ) ( SUPPORTS ?auto_363529 ?auto_363519 ) ( POINTING ?auto_363528 ?auto_363527 ) ( not ( = ?auto_363522 ?auto_363527 ) ) ( HAVE_IMAGE ?auto_363520 ?auto_363526 ) ( not ( = ?auto_363520 ?auto_363522 ) ) ( not ( = ?auto_363520 ?auto_363527 ) ) ( not ( = ?auto_363526 ?auto_363519 ) ) ( CALIBRATION_TARGET ?auto_363529 ?auto_363527 ) ( POWER_AVAIL ?auto_363528 ) ( HAVE_IMAGE ?auto_363520 ?auto_363521 ) ( HAVE_IMAGE ?auto_363523 ?auto_363524 ) ( HAVE_IMAGE ?auto_363525 ?auto_363526 ) ( not ( = ?auto_363520 ?auto_363523 ) ) ( not ( = ?auto_363520 ?auto_363525 ) ) ( not ( = ?auto_363521 ?auto_363519 ) ) ( not ( = ?auto_363521 ?auto_363524 ) ) ( not ( = ?auto_363521 ?auto_363526 ) ) ( not ( = ?auto_363522 ?auto_363523 ) ) ( not ( = ?auto_363522 ?auto_363525 ) ) ( not ( = ?auto_363519 ?auto_363524 ) ) ( not ( = ?auto_363523 ?auto_363525 ) ) ( not ( = ?auto_363523 ?auto_363527 ) ) ( not ( = ?auto_363524 ?auto_363526 ) ) ( not ( = ?auto_363525 ?auto_363527 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363520 ?auto_363526 ?auto_363522 ?auto_363519 )
      ( GET-4IMAGE-VERIFY ?auto_363520 ?auto_363521 ?auto_363522 ?auto_363519 ?auto_363523 ?auto_363524 ?auto_363525 ?auto_363526 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363553 - DIRECTION
      ?auto_363554 - MODE
      ?auto_363555 - DIRECTION
      ?auto_363552 - MODE
      ?auto_363556 - DIRECTION
      ?auto_363557 - MODE
      ?auto_363558 - DIRECTION
      ?auto_363559 - MODE
    )
    :vars
    (
      ?auto_363562 - INSTRUMENT
      ?auto_363561 - SATELLITE
      ?auto_363560 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363562 ?auto_363561 ) ( SUPPORTS ?auto_363562 ?auto_363552 ) ( POINTING ?auto_363561 ?auto_363560 ) ( not ( = ?auto_363555 ?auto_363560 ) ) ( HAVE_IMAGE ?auto_363558 ?auto_363559 ) ( not ( = ?auto_363558 ?auto_363555 ) ) ( not ( = ?auto_363558 ?auto_363560 ) ) ( not ( = ?auto_363559 ?auto_363552 ) ) ( CALIBRATION_TARGET ?auto_363562 ?auto_363560 ) ( POWER_AVAIL ?auto_363561 ) ( HAVE_IMAGE ?auto_363553 ?auto_363554 ) ( HAVE_IMAGE ?auto_363556 ?auto_363557 ) ( not ( = ?auto_363553 ?auto_363555 ) ) ( not ( = ?auto_363553 ?auto_363556 ) ) ( not ( = ?auto_363553 ?auto_363558 ) ) ( not ( = ?auto_363553 ?auto_363560 ) ) ( not ( = ?auto_363554 ?auto_363552 ) ) ( not ( = ?auto_363554 ?auto_363557 ) ) ( not ( = ?auto_363554 ?auto_363559 ) ) ( not ( = ?auto_363555 ?auto_363556 ) ) ( not ( = ?auto_363552 ?auto_363557 ) ) ( not ( = ?auto_363556 ?auto_363558 ) ) ( not ( = ?auto_363556 ?auto_363560 ) ) ( not ( = ?auto_363557 ?auto_363559 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363558 ?auto_363559 ?auto_363555 ?auto_363552 )
      ( GET-4IMAGE-VERIFY ?auto_363553 ?auto_363554 ?auto_363555 ?auto_363552 ?auto_363556 ?auto_363557 ?auto_363558 ?auto_363559 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363564 - DIRECTION
      ?auto_363565 - MODE
      ?auto_363566 - DIRECTION
      ?auto_363563 - MODE
      ?auto_363567 - DIRECTION
      ?auto_363568 - MODE
      ?auto_363569 - DIRECTION
      ?auto_363570 - MODE
    )
    :vars
    (
      ?auto_363573 - INSTRUMENT
      ?auto_363572 - SATELLITE
      ?auto_363571 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363573 ?auto_363572 ) ( SUPPORTS ?auto_363573 ?auto_363563 ) ( POINTING ?auto_363572 ?auto_363571 ) ( not ( = ?auto_363566 ?auto_363571 ) ) ( HAVE_IMAGE ?auto_363564 ?auto_363565 ) ( not ( = ?auto_363564 ?auto_363566 ) ) ( not ( = ?auto_363564 ?auto_363571 ) ) ( not ( = ?auto_363565 ?auto_363563 ) ) ( CALIBRATION_TARGET ?auto_363573 ?auto_363571 ) ( POWER_AVAIL ?auto_363572 ) ( HAVE_IMAGE ?auto_363567 ?auto_363568 ) ( HAVE_IMAGE ?auto_363569 ?auto_363570 ) ( not ( = ?auto_363564 ?auto_363567 ) ) ( not ( = ?auto_363564 ?auto_363569 ) ) ( not ( = ?auto_363565 ?auto_363568 ) ) ( not ( = ?auto_363565 ?auto_363570 ) ) ( not ( = ?auto_363566 ?auto_363567 ) ) ( not ( = ?auto_363566 ?auto_363569 ) ) ( not ( = ?auto_363563 ?auto_363568 ) ) ( not ( = ?auto_363563 ?auto_363570 ) ) ( not ( = ?auto_363567 ?auto_363569 ) ) ( not ( = ?auto_363567 ?auto_363571 ) ) ( not ( = ?auto_363568 ?auto_363570 ) ) ( not ( = ?auto_363569 ?auto_363571 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363564 ?auto_363565 ?auto_363566 ?auto_363563 )
      ( GET-4IMAGE-VERIFY ?auto_363564 ?auto_363565 ?auto_363566 ?auto_363563 ?auto_363567 ?auto_363568 ?auto_363569 ?auto_363570 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363619 - DIRECTION
      ?auto_363620 - MODE
      ?auto_363621 - DIRECTION
      ?auto_363618 - MODE
      ?auto_363622 - DIRECTION
      ?auto_363623 - MODE
      ?auto_363624 - DIRECTION
      ?auto_363625 - MODE
    )
    :vars
    (
      ?auto_363628 - INSTRUMENT
      ?auto_363627 - SATELLITE
      ?auto_363626 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363628 ?auto_363627 ) ( SUPPORTS ?auto_363628 ?auto_363625 ) ( POINTING ?auto_363627 ?auto_363626 ) ( not ( = ?auto_363624 ?auto_363626 ) ) ( HAVE_IMAGE ?auto_363621 ?auto_363618 ) ( not ( = ?auto_363621 ?auto_363624 ) ) ( not ( = ?auto_363621 ?auto_363626 ) ) ( not ( = ?auto_363618 ?auto_363625 ) ) ( CALIBRATION_TARGET ?auto_363628 ?auto_363626 ) ( POWER_AVAIL ?auto_363627 ) ( HAVE_IMAGE ?auto_363619 ?auto_363620 ) ( HAVE_IMAGE ?auto_363622 ?auto_363623 ) ( not ( = ?auto_363619 ?auto_363621 ) ) ( not ( = ?auto_363619 ?auto_363622 ) ) ( not ( = ?auto_363619 ?auto_363624 ) ) ( not ( = ?auto_363619 ?auto_363626 ) ) ( not ( = ?auto_363620 ?auto_363618 ) ) ( not ( = ?auto_363620 ?auto_363623 ) ) ( not ( = ?auto_363620 ?auto_363625 ) ) ( not ( = ?auto_363621 ?auto_363622 ) ) ( not ( = ?auto_363618 ?auto_363623 ) ) ( not ( = ?auto_363622 ?auto_363624 ) ) ( not ( = ?auto_363622 ?auto_363626 ) ) ( not ( = ?auto_363623 ?auto_363625 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363621 ?auto_363618 ?auto_363624 ?auto_363625 )
      ( GET-4IMAGE-VERIFY ?auto_363619 ?auto_363620 ?auto_363621 ?auto_363618 ?auto_363622 ?auto_363623 ?auto_363624 ?auto_363625 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363652 - DIRECTION
      ?auto_363653 - MODE
      ?auto_363654 - DIRECTION
      ?auto_363651 - MODE
      ?auto_363655 - DIRECTION
      ?auto_363656 - MODE
      ?auto_363657 - DIRECTION
      ?auto_363658 - MODE
    )
    :vars
    (
      ?auto_363661 - INSTRUMENT
      ?auto_363660 - SATELLITE
      ?auto_363659 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363661 ?auto_363660 ) ( SUPPORTS ?auto_363661 ?auto_363656 ) ( POINTING ?auto_363660 ?auto_363659 ) ( not ( = ?auto_363655 ?auto_363659 ) ) ( HAVE_IMAGE ?auto_363654 ?auto_363651 ) ( not ( = ?auto_363654 ?auto_363655 ) ) ( not ( = ?auto_363654 ?auto_363659 ) ) ( not ( = ?auto_363651 ?auto_363656 ) ) ( CALIBRATION_TARGET ?auto_363661 ?auto_363659 ) ( POWER_AVAIL ?auto_363660 ) ( HAVE_IMAGE ?auto_363652 ?auto_363653 ) ( HAVE_IMAGE ?auto_363657 ?auto_363658 ) ( not ( = ?auto_363652 ?auto_363654 ) ) ( not ( = ?auto_363652 ?auto_363655 ) ) ( not ( = ?auto_363652 ?auto_363657 ) ) ( not ( = ?auto_363652 ?auto_363659 ) ) ( not ( = ?auto_363653 ?auto_363651 ) ) ( not ( = ?auto_363653 ?auto_363656 ) ) ( not ( = ?auto_363653 ?auto_363658 ) ) ( not ( = ?auto_363654 ?auto_363657 ) ) ( not ( = ?auto_363651 ?auto_363658 ) ) ( not ( = ?auto_363655 ?auto_363657 ) ) ( not ( = ?auto_363656 ?auto_363658 ) ) ( not ( = ?auto_363657 ?auto_363659 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363654 ?auto_363651 ?auto_363655 ?auto_363656 )
      ( GET-4IMAGE-VERIFY ?auto_363652 ?auto_363653 ?auto_363654 ?auto_363651 ?auto_363655 ?auto_363656 ?auto_363657 ?auto_363658 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363685 - DIRECTION
      ?auto_363686 - MODE
      ?auto_363687 - DIRECTION
      ?auto_363684 - MODE
      ?auto_363688 - DIRECTION
      ?auto_363689 - MODE
      ?auto_363690 - DIRECTION
      ?auto_363691 - MODE
    )
    :vars
    (
      ?auto_363695 - INSTRUMENT
      ?auto_363694 - SATELLITE
      ?auto_363692 - DIRECTION
      ?auto_363696 - DIRECTION
      ?auto_363693 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_363695 ?auto_363694 ) ( SUPPORTS ?auto_363695 ?auto_363691 ) ( POINTING ?auto_363694 ?auto_363692 ) ( not ( = ?auto_363690 ?auto_363692 ) ) ( HAVE_IMAGE ?auto_363696 ?auto_363693 ) ( not ( = ?auto_363696 ?auto_363690 ) ) ( not ( = ?auto_363696 ?auto_363692 ) ) ( not ( = ?auto_363693 ?auto_363691 ) ) ( CALIBRATION_TARGET ?auto_363695 ?auto_363692 ) ( POWER_AVAIL ?auto_363694 ) ( HAVE_IMAGE ?auto_363685 ?auto_363686 ) ( HAVE_IMAGE ?auto_363687 ?auto_363684 ) ( HAVE_IMAGE ?auto_363688 ?auto_363689 ) ( not ( = ?auto_363685 ?auto_363687 ) ) ( not ( = ?auto_363685 ?auto_363688 ) ) ( not ( = ?auto_363685 ?auto_363690 ) ) ( not ( = ?auto_363685 ?auto_363692 ) ) ( not ( = ?auto_363685 ?auto_363696 ) ) ( not ( = ?auto_363686 ?auto_363684 ) ) ( not ( = ?auto_363686 ?auto_363689 ) ) ( not ( = ?auto_363686 ?auto_363691 ) ) ( not ( = ?auto_363686 ?auto_363693 ) ) ( not ( = ?auto_363687 ?auto_363688 ) ) ( not ( = ?auto_363687 ?auto_363690 ) ) ( not ( = ?auto_363687 ?auto_363692 ) ) ( not ( = ?auto_363687 ?auto_363696 ) ) ( not ( = ?auto_363684 ?auto_363689 ) ) ( not ( = ?auto_363684 ?auto_363691 ) ) ( not ( = ?auto_363684 ?auto_363693 ) ) ( not ( = ?auto_363688 ?auto_363690 ) ) ( not ( = ?auto_363688 ?auto_363692 ) ) ( not ( = ?auto_363688 ?auto_363696 ) ) ( not ( = ?auto_363689 ?auto_363691 ) ) ( not ( = ?auto_363689 ?auto_363693 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363696 ?auto_363693 ?auto_363690 ?auto_363691 )
      ( GET-4IMAGE-VERIFY ?auto_363685 ?auto_363686 ?auto_363687 ?auto_363684 ?auto_363688 ?auto_363689 ?auto_363690 ?auto_363691 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363698 - DIRECTION
      ?auto_363699 - MODE
      ?auto_363700 - DIRECTION
      ?auto_363697 - MODE
      ?auto_363701 - DIRECTION
      ?auto_363702 - MODE
      ?auto_363703 - DIRECTION
      ?auto_363704 - MODE
    )
    :vars
    (
      ?auto_363707 - INSTRUMENT
      ?auto_363706 - SATELLITE
      ?auto_363705 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363707 ?auto_363706 ) ( SUPPORTS ?auto_363707 ?auto_363702 ) ( POINTING ?auto_363706 ?auto_363705 ) ( not ( = ?auto_363701 ?auto_363705 ) ) ( HAVE_IMAGE ?auto_363703 ?auto_363704 ) ( not ( = ?auto_363703 ?auto_363701 ) ) ( not ( = ?auto_363703 ?auto_363705 ) ) ( not ( = ?auto_363704 ?auto_363702 ) ) ( CALIBRATION_TARGET ?auto_363707 ?auto_363705 ) ( POWER_AVAIL ?auto_363706 ) ( HAVE_IMAGE ?auto_363698 ?auto_363699 ) ( HAVE_IMAGE ?auto_363700 ?auto_363697 ) ( not ( = ?auto_363698 ?auto_363700 ) ) ( not ( = ?auto_363698 ?auto_363701 ) ) ( not ( = ?auto_363698 ?auto_363703 ) ) ( not ( = ?auto_363698 ?auto_363705 ) ) ( not ( = ?auto_363699 ?auto_363697 ) ) ( not ( = ?auto_363699 ?auto_363702 ) ) ( not ( = ?auto_363699 ?auto_363704 ) ) ( not ( = ?auto_363700 ?auto_363701 ) ) ( not ( = ?auto_363700 ?auto_363703 ) ) ( not ( = ?auto_363700 ?auto_363705 ) ) ( not ( = ?auto_363697 ?auto_363702 ) ) ( not ( = ?auto_363697 ?auto_363704 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363703 ?auto_363704 ?auto_363701 ?auto_363702 )
      ( GET-4IMAGE-VERIFY ?auto_363698 ?auto_363699 ?auto_363700 ?auto_363697 ?auto_363701 ?auto_363702 ?auto_363703 ?auto_363704 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363709 - DIRECTION
      ?auto_363710 - MODE
      ?auto_363711 - DIRECTION
      ?auto_363708 - MODE
      ?auto_363712 - DIRECTION
      ?auto_363713 - MODE
      ?auto_363714 - DIRECTION
      ?auto_363715 - MODE
    )
    :vars
    (
      ?auto_363719 - INSTRUMENT
      ?auto_363718 - SATELLITE
      ?auto_363716 - DIRECTION
      ?auto_363720 - DIRECTION
      ?auto_363717 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_363719 ?auto_363718 ) ( SUPPORTS ?auto_363719 ?auto_363713 ) ( POINTING ?auto_363718 ?auto_363716 ) ( not ( = ?auto_363712 ?auto_363716 ) ) ( HAVE_IMAGE ?auto_363720 ?auto_363717 ) ( not ( = ?auto_363720 ?auto_363712 ) ) ( not ( = ?auto_363720 ?auto_363716 ) ) ( not ( = ?auto_363717 ?auto_363713 ) ) ( CALIBRATION_TARGET ?auto_363719 ?auto_363716 ) ( POWER_AVAIL ?auto_363718 ) ( HAVE_IMAGE ?auto_363709 ?auto_363710 ) ( HAVE_IMAGE ?auto_363711 ?auto_363708 ) ( HAVE_IMAGE ?auto_363714 ?auto_363715 ) ( not ( = ?auto_363709 ?auto_363711 ) ) ( not ( = ?auto_363709 ?auto_363712 ) ) ( not ( = ?auto_363709 ?auto_363714 ) ) ( not ( = ?auto_363709 ?auto_363716 ) ) ( not ( = ?auto_363709 ?auto_363720 ) ) ( not ( = ?auto_363710 ?auto_363708 ) ) ( not ( = ?auto_363710 ?auto_363713 ) ) ( not ( = ?auto_363710 ?auto_363715 ) ) ( not ( = ?auto_363710 ?auto_363717 ) ) ( not ( = ?auto_363711 ?auto_363712 ) ) ( not ( = ?auto_363711 ?auto_363714 ) ) ( not ( = ?auto_363711 ?auto_363716 ) ) ( not ( = ?auto_363711 ?auto_363720 ) ) ( not ( = ?auto_363708 ?auto_363713 ) ) ( not ( = ?auto_363708 ?auto_363715 ) ) ( not ( = ?auto_363708 ?auto_363717 ) ) ( not ( = ?auto_363712 ?auto_363714 ) ) ( not ( = ?auto_363713 ?auto_363715 ) ) ( not ( = ?auto_363714 ?auto_363716 ) ) ( not ( = ?auto_363714 ?auto_363720 ) ) ( not ( = ?auto_363715 ?auto_363717 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363720 ?auto_363717 ?auto_363712 ?auto_363713 )
      ( GET-4IMAGE-VERIFY ?auto_363709 ?auto_363710 ?auto_363711 ?auto_363708 ?auto_363712 ?auto_363713 ?auto_363714 ?auto_363715 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363735 - DIRECTION
      ?auto_363736 - MODE
      ?auto_363737 - DIRECTION
      ?auto_363734 - MODE
      ?auto_363738 - DIRECTION
      ?auto_363739 - MODE
      ?auto_363740 - DIRECTION
      ?auto_363741 - MODE
    )
    :vars
    (
      ?auto_363744 - INSTRUMENT
      ?auto_363743 - SATELLITE
      ?auto_363742 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363744 ?auto_363743 ) ( SUPPORTS ?auto_363744 ?auto_363734 ) ( POINTING ?auto_363743 ?auto_363742 ) ( not ( = ?auto_363737 ?auto_363742 ) ) ( HAVE_IMAGE ?auto_363740 ?auto_363739 ) ( not ( = ?auto_363740 ?auto_363737 ) ) ( not ( = ?auto_363740 ?auto_363742 ) ) ( not ( = ?auto_363739 ?auto_363734 ) ) ( CALIBRATION_TARGET ?auto_363744 ?auto_363742 ) ( POWER_AVAIL ?auto_363743 ) ( HAVE_IMAGE ?auto_363735 ?auto_363736 ) ( HAVE_IMAGE ?auto_363738 ?auto_363739 ) ( HAVE_IMAGE ?auto_363740 ?auto_363741 ) ( not ( = ?auto_363735 ?auto_363737 ) ) ( not ( = ?auto_363735 ?auto_363738 ) ) ( not ( = ?auto_363735 ?auto_363740 ) ) ( not ( = ?auto_363735 ?auto_363742 ) ) ( not ( = ?auto_363736 ?auto_363734 ) ) ( not ( = ?auto_363736 ?auto_363739 ) ) ( not ( = ?auto_363736 ?auto_363741 ) ) ( not ( = ?auto_363737 ?auto_363738 ) ) ( not ( = ?auto_363734 ?auto_363741 ) ) ( not ( = ?auto_363738 ?auto_363740 ) ) ( not ( = ?auto_363738 ?auto_363742 ) ) ( not ( = ?auto_363739 ?auto_363741 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363740 ?auto_363739 ?auto_363737 ?auto_363734 )
      ( GET-4IMAGE-VERIFY ?auto_363735 ?auto_363736 ?auto_363737 ?auto_363734 ?auto_363738 ?auto_363739 ?auto_363740 ?auto_363741 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363779 - DIRECTION
      ?auto_363780 - MODE
      ?auto_363781 - DIRECTION
      ?auto_363778 - MODE
      ?auto_363782 - DIRECTION
      ?auto_363783 - MODE
      ?auto_363784 - DIRECTION
      ?auto_363785 - MODE
    )
    :vars
    (
      ?auto_363789 - INSTRUMENT
      ?auto_363788 - SATELLITE
      ?auto_363786 - DIRECTION
      ?auto_363790 - DIRECTION
      ?auto_363787 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_363789 ?auto_363788 ) ( SUPPORTS ?auto_363789 ?auto_363778 ) ( POINTING ?auto_363788 ?auto_363786 ) ( not ( = ?auto_363781 ?auto_363786 ) ) ( HAVE_IMAGE ?auto_363790 ?auto_363787 ) ( not ( = ?auto_363790 ?auto_363781 ) ) ( not ( = ?auto_363790 ?auto_363786 ) ) ( not ( = ?auto_363787 ?auto_363778 ) ) ( CALIBRATION_TARGET ?auto_363789 ?auto_363786 ) ( POWER_AVAIL ?auto_363788 ) ( HAVE_IMAGE ?auto_363779 ?auto_363780 ) ( HAVE_IMAGE ?auto_363782 ?auto_363783 ) ( HAVE_IMAGE ?auto_363784 ?auto_363785 ) ( not ( = ?auto_363779 ?auto_363781 ) ) ( not ( = ?auto_363779 ?auto_363782 ) ) ( not ( = ?auto_363779 ?auto_363784 ) ) ( not ( = ?auto_363779 ?auto_363786 ) ) ( not ( = ?auto_363779 ?auto_363790 ) ) ( not ( = ?auto_363780 ?auto_363778 ) ) ( not ( = ?auto_363780 ?auto_363783 ) ) ( not ( = ?auto_363780 ?auto_363785 ) ) ( not ( = ?auto_363780 ?auto_363787 ) ) ( not ( = ?auto_363781 ?auto_363782 ) ) ( not ( = ?auto_363781 ?auto_363784 ) ) ( not ( = ?auto_363778 ?auto_363783 ) ) ( not ( = ?auto_363778 ?auto_363785 ) ) ( not ( = ?auto_363782 ?auto_363784 ) ) ( not ( = ?auto_363782 ?auto_363786 ) ) ( not ( = ?auto_363782 ?auto_363790 ) ) ( not ( = ?auto_363783 ?auto_363785 ) ) ( not ( = ?auto_363783 ?auto_363787 ) ) ( not ( = ?auto_363784 ?auto_363786 ) ) ( not ( = ?auto_363784 ?auto_363790 ) ) ( not ( = ?auto_363785 ?auto_363787 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363790 ?auto_363787 ?auto_363781 ?auto_363778 )
      ( GET-4IMAGE-VERIFY ?auto_363779 ?auto_363780 ?auto_363781 ?auto_363778 ?auto_363782 ?auto_363783 ?auto_363784 ?auto_363785 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363842 - DIRECTION
      ?auto_363843 - MODE
      ?auto_363844 - DIRECTION
      ?auto_363841 - MODE
      ?auto_363845 - DIRECTION
      ?auto_363846 - MODE
      ?auto_363847 - DIRECTION
      ?auto_363848 - MODE
    )
    :vars
    (
      ?auto_363851 - INSTRUMENT
      ?auto_363850 - SATELLITE
      ?auto_363849 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363851 ?auto_363850 ) ( SUPPORTS ?auto_363851 ?auto_363843 ) ( POINTING ?auto_363850 ?auto_363849 ) ( not ( = ?auto_363842 ?auto_363849 ) ) ( HAVE_IMAGE ?auto_363845 ?auto_363848 ) ( not ( = ?auto_363845 ?auto_363842 ) ) ( not ( = ?auto_363845 ?auto_363849 ) ) ( not ( = ?auto_363848 ?auto_363843 ) ) ( CALIBRATION_TARGET ?auto_363851 ?auto_363849 ) ( POWER_AVAIL ?auto_363850 ) ( HAVE_IMAGE ?auto_363844 ?auto_363841 ) ( HAVE_IMAGE ?auto_363845 ?auto_363846 ) ( HAVE_IMAGE ?auto_363847 ?auto_363848 ) ( not ( = ?auto_363842 ?auto_363844 ) ) ( not ( = ?auto_363842 ?auto_363847 ) ) ( not ( = ?auto_363843 ?auto_363841 ) ) ( not ( = ?auto_363843 ?auto_363846 ) ) ( not ( = ?auto_363844 ?auto_363845 ) ) ( not ( = ?auto_363844 ?auto_363847 ) ) ( not ( = ?auto_363844 ?auto_363849 ) ) ( not ( = ?auto_363841 ?auto_363846 ) ) ( not ( = ?auto_363841 ?auto_363848 ) ) ( not ( = ?auto_363845 ?auto_363847 ) ) ( not ( = ?auto_363846 ?auto_363848 ) ) ( not ( = ?auto_363847 ?auto_363849 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363845 ?auto_363848 ?auto_363842 ?auto_363843 )
      ( GET-4IMAGE-VERIFY ?auto_363842 ?auto_363843 ?auto_363844 ?auto_363841 ?auto_363845 ?auto_363846 ?auto_363847 ?auto_363848 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363853 - DIRECTION
      ?auto_363854 - MODE
      ?auto_363855 - DIRECTION
      ?auto_363852 - MODE
      ?auto_363856 - DIRECTION
      ?auto_363857 - MODE
      ?auto_363858 - DIRECTION
      ?auto_363859 - MODE
    )
    :vars
    (
      ?auto_363862 - INSTRUMENT
      ?auto_363861 - SATELLITE
      ?auto_363860 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363862 ?auto_363861 ) ( SUPPORTS ?auto_363862 ?auto_363854 ) ( POINTING ?auto_363861 ?auto_363860 ) ( not ( = ?auto_363853 ?auto_363860 ) ) ( HAVE_IMAGE ?auto_363856 ?auto_363857 ) ( not ( = ?auto_363856 ?auto_363853 ) ) ( not ( = ?auto_363856 ?auto_363860 ) ) ( not ( = ?auto_363857 ?auto_363854 ) ) ( CALIBRATION_TARGET ?auto_363862 ?auto_363860 ) ( POWER_AVAIL ?auto_363861 ) ( HAVE_IMAGE ?auto_363855 ?auto_363852 ) ( HAVE_IMAGE ?auto_363858 ?auto_363859 ) ( not ( = ?auto_363853 ?auto_363855 ) ) ( not ( = ?auto_363853 ?auto_363858 ) ) ( not ( = ?auto_363854 ?auto_363852 ) ) ( not ( = ?auto_363854 ?auto_363859 ) ) ( not ( = ?auto_363855 ?auto_363856 ) ) ( not ( = ?auto_363855 ?auto_363858 ) ) ( not ( = ?auto_363855 ?auto_363860 ) ) ( not ( = ?auto_363852 ?auto_363857 ) ) ( not ( = ?auto_363852 ?auto_363859 ) ) ( not ( = ?auto_363856 ?auto_363858 ) ) ( not ( = ?auto_363857 ?auto_363859 ) ) ( not ( = ?auto_363858 ?auto_363860 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363856 ?auto_363857 ?auto_363853 ?auto_363854 )
      ( GET-4IMAGE-VERIFY ?auto_363853 ?auto_363854 ?auto_363855 ?auto_363852 ?auto_363856 ?auto_363857 ?auto_363858 ?auto_363859 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363875 - DIRECTION
      ?auto_363876 - MODE
      ?auto_363877 - DIRECTION
      ?auto_363874 - MODE
      ?auto_363878 - DIRECTION
      ?auto_363879 - MODE
      ?auto_363880 - DIRECTION
      ?auto_363881 - MODE
    )
    :vars
    (
      ?auto_363884 - INSTRUMENT
      ?auto_363883 - SATELLITE
      ?auto_363882 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363884 ?auto_363883 ) ( SUPPORTS ?auto_363884 ?auto_363876 ) ( POINTING ?auto_363883 ?auto_363882 ) ( not ( = ?auto_363875 ?auto_363882 ) ) ( HAVE_IMAGE ?auto_363880 ?auto_363881 ) ( not ( = ?auto_363880 ?auto_363875 ) ) ( not ( = ?auto_363880 ?auto_363882 ) ) ( not ( = ?auto_363881 ?auto_363876 ) ) ( CALIBRATION_TARGET ?auto_363884 ?auto_363882 ) ( POWER_AVAIL ?auto_363883 ) ( HAVE_IMAGE ?auto_363877 ?auto_363874 ) ( HAVE_IMAGE ?auto_363878 ?auto_363879 ) ( not ( = ?auto_363875 ?auto_363877 ) ) ( not ( = ?auto_363875 ?auto_363878 ) ) ( not ( = ?auto_363876 ?auto_363874 ) ) ( not ( = ?auto_363876 ?auto_363879 ) ) ( not ( = ?auto_363877 ?auto_363878 ) ) ( not ( = ?auto_363877 ?auto_363880 ) ) ( not ( = ?auto_363877 ?auto_363882 ) ) ( not ( = ?auto_363874 ?auto_363879 ) ) ( not ( = ?auto_363874 ?auto_363881 ) ) ( not ( = ?auto_363878 ?auto_363880 ) ) ( not ( = ?auto_363878 ?auto_363882 ) ) ( not ( = ?auto_363879 ?auto_363881 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363880 ?auto_363881 ?auto_363875 ?auto_363876 )
      ( GET-4IMAGE-VERIFY ?auto_363875 ?auto_363876 ?auto_363877 ?auto_363874 ?auto_363878 ?auto_363879 ?auto_363880 ?auto_363881 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363886 - DIRECTION
      ?auto_363887 - MODE
      ?auto_363888 - DIRECTION
      ?auto_363885 - MODE
      ?auto_363889 - DIRECTION
      ?auto_363890 - MODE
      ?auto_363891 - DIRECTION
      ?auto_363892 - MODE
    )
    :vars
    (
      ?auto_363895 - INSTRUMENT
      ?auto_363894 - SATELLITE
      ?auto_363893 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_363895 ?auto_363894 ) ( SUPPORTS ?auto_363895 ?auto_363887 ) ( POINTING ?auto_363894 ?auto_363893 ) ( not ( = ?auto_363886 ?auto_363893 ) ) ( HAVE_IMAGE ?auto_363888 ?auto_363885 ) ( not ( = ?auto_363888 ?auto_363886 ) ) ( not ( = ?auto_363888 ?auto_363893 ) ) ( not ( = ?auto_363885 ?auto_363887 ) ) ( CALIBRATION_TARGET ?auto_363895 ?auto_363893 ) ( POWER_AVAIL ?auto_363894 ) ( HAVE_IMAGE ?auto_363889 ?auto_363890 ) ( HAVE_IMAGE ?auto_363891 ?auto_363892 ) ( not ( = ?auto_363886 ?auto_363889 ) ) ( not ( = ?auto_363886 ?auto_363891 ) ) ( not ( = ?auto_363887 ?auto_363890 ) ) ( not ( = ?auto_363887 ?auto_363892 ) ) ( not ( = ?auto_363888 ?auto_363889 ) ) ( not ( = ?auto_363888 ?auto_363891 ) ) ( not ( = ?auto_363885 ?auto_363890 ) ) ( not ( = ?auto_363885 ?auto_363892 ) ) ( not ( = ?auto_363889 ?auto_363891 ) ) ( not ( = ?auto_363889 ?auto_363893 ) ) ( not ( = ?auto_363890 ?auto_363892 ) ) ( not ( = ?auto_363891 ?auto_363893 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363888 ?auto_363885 ?auto_363886 ?auto_363887 )
      ( GET-4IMAGE-VERIFY ?auto_363886 ?auto_363887 ?auto_363888 ?auto_363885 ?auto_363889 ?auto_363890 ?auto_363891 ?auto_363892 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_363985 - DIRECTION
      ?auto_363986 - MODE
      ?auto_363987 - DIRECTION
      ?auto_363984 - MODE
      ?auto_363988 - DIRECTION
      ?auto_363989 - MODE
      ?auto_363990 - DIRECTION
      ?auto_363991 - MODE
    )
    :vars
    (
      ?auto_363995 - INSTRUMENT
      ?auto_363994 - SATELLITE
      ?auto_363992 - DIRECTION
      ?auto_363996 - DIRECTION
      ?auto_363993 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_363995 ?auto_363994 ) ( SUPPORTS ?auto_363995 ?auto_363986 ) ( POINTING ?auto_363994 ?auto_363992 ) ( not ( = ?auto_363985 ?auto_363992 ) ) ( HAVE_IMAGE ?auto_363996 ?auto_363993 ) ( not ( = ?auto_363996 ?auto_363985 ) ) ( not ( = ?auto_363996 ?auto_363992 ) ) ( not ( = ?auto_363993 ?auto_363986 ) ) ( CALIBRATION_TARGET ?auto_363995 ?auto_363992 ) ( POWER_AVAIL ?auto_363994 ) ( HAVE_IMAGE ?auto_363987 ?auto_363984 ) ( HAVE_IMAGE ?auto_363988 ?auto_363989 ) ( HAVE_IMAGE ?auto_363990 ?auto_363991 ) ( not ( = ?auto_363985 ?auto_363987 ) ) ( not ( = ?auto_363985 ?auto_363988 ) ) ( not ( = ?auto_363985 ?auto_363990 ) ) ( not ( = ?auto_363986 ?auto_363984 ) ) ( not ( = ?auto_363986 ?auto_363989 ) ) ( not ( = ?auto_363986 ?auto_363991 ) ) ( not ( = ?auto_363987 ?auto_363988 ) ) ( not ( = ?auto_363987 ?auto_363990 ) ) ( not ( = ?auto_363987 ?auto_363992 ) ) ( not ( = ?auto_363987 ?auto_363996 ) ) ( not ( = ?auto_363984 ?auto_363989 ) ) ( not ( = ?auto_363984 ?auto_363991 ) ) ( not ( = ?auto_363984 ?auto_363993 ) ) ( not ( = ?auto_363988 ?auto_363990 ) ) ( not ( = ?auto_363988 ?auto_363992 ) ) ( not ( = ?auto_363988 ?auto_363996 ) ) ( not ( = ?auto_363989 ?auto_363991 ) ) ( not ( = ?auto_363989 ?auto_363993 ) ) ( not ( = ?auto_363990 ?auto_363992 ) ) ( not ( = ?auto_363990 ?auto_363996 ) ) ( not ( = ?auto_363991 ?auto_363993 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_363996 ?auto_363993 ?auto_363985 ?auto_363986 )
      ( GET-4IMAGE-VERIFY ?auto_363985 ?auto_363986 ?auto_363987 ?auto_363984 ?auto_363988 ?auto_363989 ?auto_363990 ?auto_363991 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_364154 - DIRECTION
      ?auto_364155 - MODE
    )
    :vars
    (
      ?auto_364159 - INSTRUMENT
      ?auto_364158 - SATELLITE
      ?auto_364156 - DIRECTION
      ?auto_364160 - DIRECTION
      ?auto_364157 - MODE
      ?auto_364161 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364159 ?auto_364158 ) ( SUPPORTS ?auto_364159 ?auto_364155 ) ( not ( = ?auto_364154 ?auto_364156 ) ) ( HAVE_IMAGE ?auto_364160 ?auto_364157 ) ( not ( = ?auto_364160 ?auto_364154 ) ) ( not ( = ?auto_364160 ?auto_364156 ) ) ( not ( = ?auto_364157 ?auto_364155 ) ) ( CALIBRATION_TARGET ?auto_364159 ?auto_364156 ) ( POWER_AVAIL ?auto_364158 ) ( POINTING ?auto_364158 ?auto_364161 ) ( not ( = ?auto_364156 ?auto_364161 ) ) ( not ( = ?auto_364154 ?auto_364161 ) ) ( not ( = ?auto_364160 ?auto_364161 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_364158 ?auto_364156 ?auto_364161 )
      ( GET-2IMAGE ?auto_364160 ?auto_364157 ?auto_364154 ?auto_364155 )
      ( GET-1IMAGE-VERIFY ?auto_364154 ?auto_364155 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_364163 - DIRECTION
      ?auto_364164 - MODE
      ?auto_364165 - DIRECTION
      ?auto_364162 - MODE
    )
    :vars
    (
      ?auto_364166 - INSTRUMENT
      ?auto_364169 - SATELLITE
      ?auto_364168 - DIRECTION
      ?auto_364167 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364166 ?auto_364169 ) ( SUPPORTS ?auto_364166 ?auto_364162 ) ( not ( = ?auto_364165 ?auto_364168 ) ) ( HAVE_IMAGE ?auto_364163 ?auto_364164 ) ( not ( = ?auto_364163 ?auto_364165 ) ) ( not ( = ?auto_364163 ?auto_364168 ) ) ( not ( = ?auto_364164 ?auto_364162 ) ) ( CALIBRATION_TARGET ?auto_364166 ?auto_364168 ) ( POWER_AVAIL ?auto_364169 ) ( POINTING ?auto_364169 ?auto_364167 ) ( not ( = ?auto_364168 ?auto_364167 ) ) ( not ( = ?auto_364165 ?auto_364167 ) ) ( not ( = ?auto_364163 ?auto_364167 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_364165 ?auto_364162 )
      ( GET-2IMAGE-VERIFY ?auto_364163 ?auto_364164 ?auto_364165 ?auto_364162 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_364171 - DIRECTION
      ?auto_364172 - MODE
      ?auto_364173 - DIRECTION
      ?auto_364170 - MODE
    )
    :vars
    (
      ?auto_364174 - INSTRUMENT
      ?auto_364175 - SATELLITE
      ?auto_364177 - DIRECTION
      ?auto_364178 - DIRECTION
      ?auto_364176 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_364174 ?auto_364175 ) ( SUPPORTS ?auto_364174 ?auto_364170 ) ( not ( = ?auto_364173 ?auto_364177 ) ) ( HAVE_IMAGE ?auto_364178 ?auto_364176 ) ( not ( = ?auto_364178 ?auto_364173 ) ) ( not ( = ?auto_364178 ?auto_364177 ) ) ( not ( = ?auto_364176 ?auto_364170 ) ) ( CALIBRATION_TARGET ?auto_364174 ?auto_364177 ) ( POWER_AVAIL ?auto_364175 ) ( POINTING ?auto_364175 ?auto_364171 ) ( not ( = ?auto_364177 ?auto_364171 ) ) ( not ( = ?auto_364173 ?auto_364171 ) ) ( not ( = ?auto_364178 ?auto_364171 ) ) ( HAVE_IMAGE ?auto_364171 ?auto_364172 ) ( not ( = ?auto_364172 ?auto_364170 ) ) ( not ( = ?auto_364172 ?auto_364176 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364178 ?auto_364176 ?auto_364173 ?auto_364170 )
      ( GET-2IMAGE-VERIFY ?auto_364171 ?auto_364172 ?auto_364173 ?auto_364170 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_364180 - DIRECTION
      ?auto_364181 - MODE
      ?auto_364182 - DIRECTION
      ?auto_364179 - MODE
    )
    :vars
    (
      ?auto_364184 - INSTRUMENT
      ?auto_364185 - SATELLITE
      ?auto_364186 - DIRECTION
      ?auto_364183 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364184 ?auto_364185 ) ( SUPPORTS ?auto_364184 ?auto_364181 ) ( not ( = ?auto_364180 ?auto_364186 ) ) ( HAVE_IMAGE ?auto_364182 ?auto_364179 ) ( not ( = ?auto_364182 ?auto_364180 ) ) ( not ( = ?auto_364182 ?auto_364186 ) ) ( not ( = ?auto_364179 ?auto_364181 ) ) ( CALIBRATION_TARGET ?auto_364184 ?auto_364186 ) ( POWER_AVAIL ?auto_364185 ) ( POINTING ?auto_364185 ?auto_364183 ) ( not ( = ?auto_364186 ?auto_364183 ) ) ( not ( = ?auto_364180 ?auto_364183 ) ) ( not ( = ?auto_364182 ?auto_364183 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364182 ?auto_364179 ?auto_364180 ?auto_364181 )
      ( GET-2IMAGE-VERIFY ?auto_364180 ?auto_364181 ?auto_364182 ?auto_364179 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_364188 - DIRECTION
      ?auto_364189 - MODE
      ?auto_364190 - DIRECTION
      ?auto_364187 - MODE
    )
    :vars
    (
      ?auto_364191 - INSTRUMENT
      ?auto_364192 - SATELLITE
      ?auto_364194 - DIRECTION
      ?auto_364195 - DIRECTION
      ?auto_364193 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_364191 ?auto_364192 ) ( SUPPORTS ?auto_364191 ?auto_364189 ) ( not ( = ?auto_364188 ?auto_364194 ) ) ( HAVE_IMAGE ?auto_364195 ?auto_364193 ) ( not ( = ?auto_364195 ?auto_364188 ) ) ( not ( = ?auto_364195 ?auto_364194 ) ) ( not ( = ?auto_364193 ?auto_364189 ) ) ( CALIBRATION_TARGET ?auto_364191 ?auto_364194 ) ( POWER_AVAIL ?auto_364192 ) ( POINTING ?auto_364192 ?auto_364190 ) ( not ( = ?auto_364194 ?auto_364190 ) ) ( not ( = ?auto_364188 ?auto_364190 ) ) ( not ( = ?auto_364195 ?auto_364190 ) ) ( HAVE_IMAGE ?auto_364190 ?auto_364187 ) ( not ( = ?auto_364189 ?auto_364187 ) ) ( not ( = ?auto_364187 ?auto_364193 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364195 ?auto_364193 ?auto_364188 ?auto_364189 )
      ( GET-2IMAGE-VERIFY ?auto_364188 ?auto_364189 ?auto_364190 ?auto_364187 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364207 - DIRECTION
      ?auto_364208 - MODE
      ?auto_364209 - DIRECTION
      ?auto_364206 - MODE
      ?auto_364210 - DIRECTION
      ?auto_364211 - MODE
    )
    :vars
    (
      ?auto_364213 - INSTRUMENT
      ?auto_364214 - SATELLITE
      ?auto_364215 - DIRECTION
      ?auto_364212 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364213 ?auto_364214 ) ( SUPPORTS ?auto_364213 ?auto_364211 ) ( not ( = ?auto_364210 ?auto_364215 ) ) ( HAVE_IMAGE ?auto_364209 ?auto_364206 ) ( not ( = ?auto_364209 ?auto_364210 ) ) ( not ( = ?auto_364209 ?auto_364215 ) ) ( not ( = ?auto_364206 ?auto_364211 ) ) ( CALIBRATION_TARGET ?auto_364213 ?auto_364215 ) ( POWER_AVAIL ?auto_364214 ) ( POINTING ?auto_364214 ?auto_364212 ) ( not ( = ?auto_364215 ?auto_364212 ) ) ( not ( = ?auto_364210 ?auto_364212 ) ) ( not ( = ?auto_364209 ?auto_364212 ) ) ( HAVE_IMAGE ?auto_364207 ?auto_364208 ) ( not ( = ?auto_364207 ?auto_364209 ) ) ( not ( = ?auto_364207 ?auto_364210 ) ) ( not ( = ?auto_364207 ?auto_364215 ) ) ( not ( = ?auto_364207 ?auto_364212 ) ) ( not ( = ?auto_364208 ?auto_364206 ) ) ( not ( = ?auto_364208 ?auto_364211 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364209 ?auto_364206 ?auto_364210 ?auto_364211 )
      ( GET-3IMAGE-VERIFY ?auto_364207 ?auto_364208 ?auto_364209 ?auto_364206 ?auto_364210 ?auto_364211 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364217 - DIRECTION
      ?auto_364218 - MODE
      ?auto_364219 - DIRECTION
      ?auto_364216 - MODE
      ?auto_364220 - DIRECTION
      ?auto_364221 - MODE
    )
    :vars
    (
      ?auto_364222 - INSTRUMENT
      ?auto_364223 - SATELLITE
      ?auto_364224 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364222 ?auto_364223 ) ( SUPPORTS ?auto_364222 ?auto_364221 ) ( not ( = ?auto_364220 ?auto_364224 ) ) ( HAVE_IMAGE ?auto_364217 ?auto_364218 ) ( not ( = ?auto_364217 ?auto_364220 ) ) ( not ( = ?auto_364217 ?auto_364224 ) ) ( not ( = ?auto_364218 ?auto_364221 ) ) ( CALIBRATION_TARGET ?auto_364222 ?auto_364224 ) ( POWER_AVAIL ?auto_364223 ) ( POINTING ?auto_364223 ?auto_364219 ) ( not ( = ?auto_364224 ?auto_364219 ) ) ( not ( = ?auto_364220 ?auto_364219 ) ) ( not ( = ?auto_364217 ?auto_364219 ) ) ( HAVE_IMAGE ?auto_364219 ?auto_364216 ) ( not ( = ?auto_364218 ?auto_364216 ) ) ( not ( = ?auto_364216 ?auto_364221 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364217 ?auto_364218 ?auto_364220 ?auto_364221 )
      ( GET-3IMAGE-VERIFY ?auto_364217 ?auto_364218 ?auto_364219 ?auto_364216 ?auto_364220 ?auto_364221 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364226 - DIRECTION
      ?auto_364227 - MODE
      ?auto_364228 - DIRECTION
      ?auto_364225 - MODE
      ?auto_364229 - DIRECTION
      ?auto_364230 - MODE
    )
    :vars
    (
      ?auto_364232 - INSTRUMENT
      ?auto_364233 - SATELLITE
      ?auto_364234 - DIRECTION
      ?auto_364231 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364232 ?auto_364233 ) ( SUPPORTS ?auto_364232 ?auto_364225 ) ( not ( = ?auto_364228 ?auto_364234 ) ) ( HAVE_IMAGE ?auto_364229 ?auto_364230 ) ( not ( = ?auto_364229 ?auto_364228 ) ) ( not ( = ?auto_364229 ?auto_364234 ) ) ( not ( = ?auto_364230 ?auto_364225 ) ) ( CALIBRATION_TARGET ?auto_364232 ?auto_364234 ) ( POWER_AVAIL ?auto_364233 ) ( POINTING ?auto_364233 ?auto_364231 ) ( not ( = ?auto_364234 ?auto_364231 ) ) ( not ( = ?auto_364228 ?auto_364231 ) ) ( not ( = ?auto_364229 ?auto_364231 ) ) ( HAVE_IMAGE ?auto_364226 ?auto_364227 ) ( not ( = ?auto_364226 ?auto_364228 ) ) ( not ( = ?auto_364226 ?auto_364229 ) ) ( not ( = ?auto_364226 ?auto_364234 ) ) ( not ( = ?auto_364226 ?auto_364231 ) ) ( not ( = ?auto_364227 ?auto_364225 ) ) ( not ( = ?auto_364227 ?auto_364230 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364229 ?auto_364230 ?auto_364228 ?auto_364225 )
      ( GET-3IMAGE-VERIFY ?auto_364226 ?auto_364227 ?auto_364228 ?auto_364225 ?auto_364229 ?auto_364230 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364236 - DIRECTION
      ?auto_364237 - MODE
      ?auto_364238 - DIRECTION
      ?auto_364235 - MODE
      ?auto_364239 - DIRECTION
      ?auto_364240 - MODE
    )
    :vars
    (
      ?auto_364241 - INSTRUMENT
      ?auto_364242 - SATELLITE
      ?auto_364243 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364241 ?auto_364242 ) ( SUPPORTS ?auto_364241 ?auto_364235 ) ( not ( = ?auto_364238 ?auto_364243 ) ) ( HAVE_IMAGE ?auto_364236 ?auto_364237 ) ( not ( = ?auto_364236 ?auto_364238 ) ) ( not ( = ?auto_364236 ?auto_364243 ) ) ( not ( = ?auto_364237 ?auto_364235 ) ) ( CALIBRATION_TARGET ?auto_364241 ?auto_364243 ) ( POWER_AVAIL ?auto_364242 ) ( POINTING ?auto_364242 ?auto_364239 ) ( not ( = ?auto_364243 ?auto_364239 ) ) ( not ( = ?auto_364238 ?auto_364239 ) ) ( not ( = ?auto_364236 ?auto_364239 ) ) ( HAVE_IMAGE ?auto_364239 ?auto_364240 ) ( not ( = ?auto_364237 ?auto_364240 ) ) ( not ( = ?auto_364235 ?auto_364240 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364236 ?auto_364237 ?auto_364238 ?auto_364235 )
      ( GET-3IMAGE-VERIFY ?auto_364236 ?auto_364237 ?auto_364238 ?auto_364235 ?auto_364239 ?auto_364240 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364255 - DIRECTION
      ?auto_364256 - MODE
      ?auto_364257 - DIRECTION
      ?auto_364254 - MODE
      ?auto_364258 - DIRECTION
      ?auto_364259 - MODE
    )
    :vars
    (
      ?auto_364260 - INSTRUMENT
      ?auto_364261 - SATELLITE
      ?auto_364262 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364260 ?auto_364261 ) ( SUPPORTS ?auto_364260 ?auto_364259 ) ( not ( = ?auto_364258 ?auto_364262 ) ) ( HAVE_IMAGE ?auto_364257 ?auto_364254 ) ( not ( = ?auto_364257 ?auto_364258 ) ) ( not ( = ?auto_364257 ?auto_364262 ) ) ( not ( = ?auto_364254 ?auto_364259 ) ) ( CALIBRATION_TARGET ?auto_364260 ?auto_364262 ) ( POWER_AVAIL ?auto_364261 ) ( POINTING ?auto_364261 ?auto_364255 ) ( not ( = ?auto_364262 ?auto_364255 ) ) ( not ( = ?auto_364258 ?auto_364255 ) ) ( not ( = ?auto_364257 ?auto_364255 ) ) ( HAVE_IMAGE ?auto_364255 ?auto_364256 ) ( not ( = ?auto_364256 ?auto_364254 ) ) ( not ( = ?auto_364256 ?auto_364259 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364257 ?auto_364254 ?auto_364258 ?auto_364259 )
      ( GET-3IMAGE-VERIFY ?auto_364255 ?auto_364256 ?auto_364257 ?auto_364254 ?auto_364258 ?auto_364259 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364264 - DIRECTION
      ?auto_364265 - MODE
      ?auto_364266 - DIRECTION
      ?auto_364263 - MODE
      ?auto_364267 - DIRECTION
      ?auto_364268 - MODE
    )
    :vars
    (
      ?auto_364269 - INSTRUMENT
      ?auto_364270 - SATELLITE
      ?auto_364272 - DIRECTION
      ?auto_364273 - DIRECTION
      ?auto_364271 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_364269 ?auto_364270 ) ( SUPPORTS ?auto_364269 ?auto_364268 ) ( not ( = ?auto_364267 ?auto_364272 ) ) ( HAVE_IMAGE ?auto_364273 ?auto_364271 ) ( not ( = ?auto_364273 ?auto_364267 ) ) ( not ( = ?auto_364273 ?auto_364272 ) ) ( not ( = ?auto_364271 ?auto_364268 ) ) ( CALIBRATION_TARGET ?auto_364269 ?auto_364272 ) ( POWER_AVAIL ?auto_364270 ) ( POINTING ?auto_364270 ?auto_364264 ) ( not ( = ?auto_364272 ?auto_364264 ) ) ( not ( = ?auto_364267 ?auto_364264 ) ) ( not ( = ?auto_364273 ?auto_364264 ) ) ( HAVE_IMAGE ?auto_364264 ?auto_364265 ) ( HAVE_IMAGE ?auto_364266 ?auto_364263 ) ( not ( = ?auto_364264 ?auto_364266 ) ) ( not ( = ?auto_364265 ?auto_364263 ) ) ( not ( = ?auto_364265 ?auto_364268 ) ) ( not ( = ?auto_364265 ?auto_364271 ) ) ( not ( = ?auto_364266 ?auto_364267 ) ) ( not ( = ?auto_364266 ?auto_364272 ) ) ( not ( = ?auto_364266 ?auto_364273 ) ) ( not ( = ?auto_364263 ?auto_364268 ) ) ( not ( = ?auto_364263 ?auto_364271 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364273 ?auto_364271 ?auto_364267 ?auto_364268 )
      ( GET-3IMAGE-VERIFY ?auto_364264 ?auto_364265 ?auto_364266 ?auto_364263 ?auto_364267 ?auto_364268 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364275 - DIRECTION
      ?auto_364276 - MODE
      ?auto_364277 - DIRECTION
      ?auto_364274 - MODE
      ?auto_364278 - DIRECTION
      ?auto_364279 - MODE
    )
    :vars
    (
      ?auto_364280 - INSTRUMENT
      ?auto_364281 - SATELLITE
      ?auto_364282 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364280 ?auto_364281 ) ( SUPPORTS ?auto_364280 ?auto_364274 ) ( not ( = ?auto_364277 ?auto_364282 ) ) ( HAVE_IMAGE ?auto_364278 ?auto_364279 ) ( not ( = ?auto_364278 ?auto_364277 ) ) ( not ( = ?auto_364278 ?auto_364282 ) ) ( not ( = ?auto_364279 ?auto_364274 ) ) ( CALIBRATION_TARGET ?auto_364280 ?auto_364282 ) ( POWER_AVAIL ?auto_364281 ) ( POINTING ?auto_364281 ?auto_364275 ) ( not ( = ?auto_364282 ?auto_364275 ) ) ( not ( = ?auto_364277 ?auto_364275 ) ) ( not ( = ?auto_364278 ?auto_364275 ) ) ( HAVE_IMAGE ?auto_364275 ?auto_364276 ) ( not ( = ?auto_364276 ?auto_364274 ) ) ( not ( = ?auto_364276 ?auto_364279 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364278 ?auto_364279 ?auto_364277 ?auto_364274 )
      ( GET-3IMAGE-VERIFY ?auto_364275 ?auto_364276 ?auto_364277 ?auto_364274 ?auto_364278 ?auto_364279 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364284 - DIRECTION
      ?auto_364285 - MODE
      ?auto_364286 - DIRECTION
      ?auto_364283 - MODE
      ?auto_364287 - DIRECTION
      ?auto_364288 - MODE
    )
    :vars
    (
      ?auto_364289 - INSTRUMENT
      ?auto_364290 - SATELLITE
      ?auto_364292 - DIRECTION
      ?auto_364293 - DIRECTION
      ?auto_364291 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_364289 ?auto_364290 ) ( SUPPORTS ?auto_364289 ?auto_364283 ) ( not ( = ?auto_364286 ?auto_364292 ) ) ( HAVE_IMAGE ?auto_364293 ?auto_364291 ) ( not ( = ?auto_364293 ?auto_364286 ) ) ( not ( = ?auto_364293 ?auto_364292 ) ) ( not ( = ?auto_364291 ?auto_364283 ) ) ( CALIBRATION_TARGET ?auto_364289 ?auto_364292 ) ( POWER_AVAIL ?auto_364290 ) ( POINTING ?auto_364290 ?auto_364284 ) ( not ( = ?auto_364292 ?auto_364284 ) ) ( not ( = ?auto_364286 ?auto_364284 ) ) ( not ( = ?auto_364293 ?auto_364284 ) ) ( HAVE_IMAGE ?auto_364284 ?auto_364285 ) ( HAVE_IMAGE ?auto_364287 ?auto_364288 ) ( not ( = ?auto_364284 ?auto_364287 ) ) ( not ( = ?auto_364285 ?auto_364283 ) ) ( not ( = ?auto_364285 ?auto_364288 ) ) ( not ( = ?auto_364285 ?auto_364291 ) ) ( not ( = ?auto_364286 ?auto_364287 ) ) ( not ( = ?auto_364283 ?auto_364288 ) ) ( not ( = ?auto_364287 ?auto_364292 ) ) ( not ( = ?auto_364287 ?auto_364293 ) ) ( not ( = ?auto_364288 ?auto_364291 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364293 ?auto_364291 ?auto_364286 ?auto_364283 )
      ( GET-3IMAGE-VERIFY ?auto_364284 ?auto_364285 ?auto_364286 ?auto_364283 ?auto_364287 ?auto_364288 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364306 - DIRECTION
      ?auto_364307 - MODE
      ?auto_364308 - DIRECTION
      ?auto_364305 - MODE
      ?auto_364309 - DIRECTION
      ?auto_364310 - MODE
    )
    :vars
    (
      ?auto_364312 - INSTRUMENT
      ?auto_364313 - SATELLITE
      ?auto_364314 - DIRECTION
      ?auto_364311 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364312 ?auto_364313 ) ( SUPPORTS ?auto_364312 ?auto_364307 ) ( not ( = ?auto_364306 ?auto_364314 ) ) ( HAVE_IMAGE ?auto_364309 ?auto_364310 ) ( not ( = ?auto_364309 ?auto_364306 ) ) ( not ( = ?auto_364309 ?auto_364314 ) ) ( not ( = ?auto_364310 ?auto_364307 ) ) ( CALIBRATION_TARGET ?auto_364312 ?auto_364314 ) ( POWER_AVAIL ?auto_364313 ) ( POINTING ?auto_364313 ?auto_364311 ) ( not ( = ?auto_364314 ?auto_364311 ) ) ( not ( = ?auto_364306 ?auto_364311 ) ) ( not ( = ?auto_364309 ?auto_364311 ) ) ( HAVE_IMAGE ?auto_364308 ?auto_364305 ) ( not ( = ?auto_364306 ?auto_364308 ) ) ( not ( = ?auto_364307 ?auto_364305 ) ) ( not ( = ?auto_364308 ?auto_364309 ) ) ( not ( = ?auto_364308 ?auto_364314 ) ) ( not ( = ?auto_364308 ?auto_364311 ) ) ( not ( = ?auto_364305 ?auto_364310 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364309 ?auto_364310 ?auto_364306 ?auto_364307 )
      ( GET-3IMAGE-VERIFY ?auto_364306 ?auto_364307 ?auto_364308 ?auto_364305 ?auto_364309 ?auto_364310 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364316 - DIRECTION
      ?auto_364317 - MODE
      ?auto_364318 - DIRECTION
      ?auto_364315 - MODE
      ?auto_364319 - DIRECTION
      ?auto_364320 - MODE
    )
    :vars
    (
      ?auto_364321 - INSTRUMENT
      ?auto_364322 - SATELLITE
      ?auto_364323 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364321 ?auto_364322 ) ( SUPPORTS ?auto_364321 ?auto_364317 ) ( not ( = ?auto_364316 ?auto_364323 ) ) ( HAVE_IMAGE ?auto_364318 ?auto_364315 ) ( not ( = ?auto_364318 ?auto_364316 ) ) ( not ( = ?auto_364318 ?auto_364323 ) ) ( not ( = ?auto_364315 ?auto_364317 ) ) ( CALIBRATION_TARGET ?auto_364321 ?auto_364323 ) ( POWER_AVAIL ?auto_364322 ) ( POINTING ?auto_364322 ?auto_364319 ) ( not ( = ?auto_364323 ?auto_364319 ) ) ( not ( = ?auto_364316 ?auto_364319 ) ) ( not ( = ?auto_364318 ?auto_364319 ) ) ( HAVE_IMAGE ?auto_364319 ?auto_364320 ) ( not ( = ?auto_364317 ?auto_364320 ) ) ( not ( = ?auto_364315 ?auto_364320 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364318 ?auto_364315 ?auto_364316 ?auto_364317 )
      ( GET-3IMAGE-VERIFY ?auto_364316 ?auto_364317 ?auto_364318 ?auto_364315 ?auto_364319 ?auto_364320 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364335 - DIRECTION
      ?auto_364336 - MODE
      ?auto_364337 - DIRECTION
      ?auto_364334 - MODE
      ?auto_364338 - DIRECTION
      ?auto_364339 - MODE
    )
    :vars
    (
      ?auto_364340 - INSTRUMENT
      ?auto_364341 - SATELLITE
      ?auto_364342 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364340 ?auto_364341 ) ( SUPPORTS ?auto_364340 ?auto_364336 ) ( not ( = ?auto_364335 ?auto_364342 ) ) ( HAVE_IMAGE ?auto_364338 ?auto_364339 ) ( not ( = ?auto_364338 ?auto_364335 ) ) ( not ( = ?auto_364338 ?auto_364342 ) ) ( not ( = ?auto_364339 ?auto_364336 ) ) ( CALIBRATION_TARGET ?auto_364340 ?auto_364342 ) ( POWER_AVAIL ?auto_364341 ) ( POINTING ?auto_364341 ?auto_364337 ) ( not ( = ?auto_364342 ?auto_364337 ) ) ( not ( = ?auto_364335 ?auto_364337 ) ) ( not ( = ?auto_364338 ?auto_364337 ) ) ( HAVE_IMAGE ?auto_364337 ?auto_364334 ) ( not ( = ?auto_364336 ?auto_364334 ) ) ( not ( = ?auto_364334 ?auto_364339 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364338 ?auto_364339 ?auto_364335 ?auto_364336 )
      ( GET-3IMAGE-VERIFY ?auto_364335 ?auto_364336 ?auto_364337 ?auto_364334 ?auto_364338 ?auto_364339 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_364344 - DIRECTION
      ?auto_364345 - MODE
      ?auto_364346 - DIRECTION
      ?auto_364343 - MODE
      ?auto_364347 - DIRECTION
      ?auto_364348 - MODE
    )
    :vars
    (
      ?auto_364349 - INSTRUMENT
      ?auto_364350 - SATELLITE
      ?auto_364352 - DIRECTION
      ?auto_364353 - DIRECTION
      ?auto_364351 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_364349 ?auto_364350 ) ( SUPPORTS ?auto_364349 ?auto_364345 ) ( not ( = ?auto_364344 ?auto_364352 ) ) ( HAVE_IMAGE ?auto_364353 ?auto_364351 ) ( not ( = ?auto_364353 ?auto_364344 ) ) ( not ( = ?auto_364353 ?auto_364352 ) ) ( not ( = ?auto_364351 ?auto_364345 ) ) ( CALIBRATION_TARGET ?auto_364349 ?auto_364352 ) ( POWER_AVAIL ?auto_364350 ) ( POINTING ?auto_364350 ?auto_364346 ) ( not ( = ?auto_364352 ?auto_364346 ) ) ( not ( = ?auto_364344 ?auto_364346 ) ) ( not ( = ?auto_364353 ?auto_364346 ) ) ( HAVE_IMAGE ?auto_364346 ?auto_364343 ) ( HAVE_IMAGE ?auto_364347 ?auto_364348 ) ( not ( = ?auto_364344 ?auto_364347 ) ) ( not ( = ?auto_364345 ?auto_364343 ) ) ( not ( = ?auto_364345 ?auto_364348 ) ) ( not ( = ?auto_364346 ?auto_364347 ) ) ( not ( = ?auto_364343 ?auto_364348 ) ) ( not ( = ?auto_364343 ?auto_364351 ) ) ( not ( = ?auto_364347 ?auto_364352 ) ) ( not ( = ?auto_364347 ?auto_364353 ) ) ( not ( = ?auto_364348 ?auto_364351 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364353 ?auto_364351 ?auto_364344 ?auto_364345 )
      ( GET-3IMAGE-VERIFY ?auto_364344 ?auto_364345 ?auto_364346 ?auto_364343 ?auto_364347 ?auto_364348 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364399 - DIRECTION
      ?auto_364400 - MODE
      ?auto_364401 - DIRECTION
      ?auto_364398 - MODE
      ?auto_364402 - DIRECTION
      ?auto_364403 - MODE
      ?auto_364404 - DIRECTION
      ?auto_364405 - MODE
    )
    :vars
    (
      ?auto_364407 - INSTRUMENT
      ?auto_364408 - SATELLITE
      ?auto_364409 - DIRECTION
      ?auto_364406 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364407 ?auto_364408 ) ( SUPPORTS ?auto_364407 ?auto_364405 ) ( not ( = ?auto_364404 ?auto_364409 ) ) ( HAVE_IMAGE ?auto_364402 ?auto_364400 ) ( not ( = ?auto_364402 ?auto_364404 ) ) ( not ( = ?auto_364402 ?auto_364409 ) ) ( not ( = ?auto_364400 ?auto_364405 ) ) ( CALIBRATION_TARGET ?auto_364407 ?auto_364409 ) ( POWER_AVAIL ?auto_364408 ) ( POINTING ?auto_364408 ?auto_364406 ) ( not ( = ?auto_364409 ?auto_364406 ) ) ( not ( = ?auto_364404 ?auto_364406 ) ) ( not ( = ?auto_364402 ?auto_364406 ) ) ( HAVE_IMAGE ?auto_364399 ?auto_364400 ) ( HAVE_IMAGE ?auto_364401 ?auto_364398 ) ( HAVE_IMAGE ?auto_364402 ?auto_364403 ) ( not ( = ?auto_364399 ?auto_364401 ) ) ( not ( = ?auto_364399 ?auto_364402 ) ) ( not ( = ?auto_364399 ?auto_364404 ) ) ( not ( = ?auto_364399 ?auto_364409 ) ) ( not ( = ?auto_364399 ?auto_364406 ) ) ( not ( = ?auto_364400 ?auto_364398 ) ) ( not ( = ?auto_364400 ?auto_364403 ) ) ( not ( = ?auto_364401 ?auto_364402 ) ) ( not ( = ?auto_364401 ?auto_364404 ) ) ( not ( = ?auto_364401 ?auto_364409 ) ) ( not ( = ?auto_364401 ?auto_364406 ) ) ( not ( = ?auto_364398 ?auto_364403 ) ) ( not ( = ?auto_364398 ?auto_364405 ) ) ( not ( = ?auto_364403 ?auto_364405 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364402 ?auto_364400 ?auto_364404 ?auto_364405 )
      ( GET-4IMAGE-VERIFY ?auto_364399 ?auto_364400 ?auto_364401 ?auto_364398 ?auto_364402 ?auto_364403 ?auto_364404 ?auto_364405 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364411 - DIRECTION
      ?auto_364412 - MODE
      ?auto_364413 - DIRECTION
      ?auto_364410 - MODE
      ?auto_364414 - DIRECTION
      ?auto_364415 - MODE
      ?auto_364416 - DIRECTION
      ?auto_364417 - MODE
    )
    :vars
    (
      ?auto_364418 - INSTRUMENT
      ?auto_364419 - SATELLITE
      ?auto_364420 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364418 ?auto_364419 ) ( SUPPORTS ?auto_364418 ?auto_364417 ) ( not ( = ?auto_364416 ?auto_364420 ) ) ( HAVE_IMAGE ?auto_364411 ?auto_364410 ) ( not ( = ?auto_364411 ?auto_364416 ) ) ( not ( = ?auto_364411 ?auto_364420 ) ) ( not ( = ?auto_364410 ?auto_364417 ) ) ( CALIBRATION_TARGET ?auto_364418 ?auto_364420 ) ( POWER_AVAIL ?auto_364419 ) ( POINTING ?auto_364419 ?auto_364414 ) ( not ( = ?auto_364420 ?auto_364414 ) ) ( not ( = ?auto_364416 ?auto_364414 ) ) ( not ( = ?auto_364411 ?auto_364414 ) ) ( HAVE_IMAGE ?auto_364411 ?auto_364412 ) ( HAVE_IMAGE ?auto_364413 ?auto_364410 ) ( HAVE_IMAGE ?auto_364414 ?auto_364415 ) ( not ( = ?auto_364411 ?auto_364413 ) ) ( not ( = ?auto_364412 ?auto_364410 ) ) ( not ( = ?auto_364412 ?auto_364415 ) ) ( not ( = ?auto_364412 ?auto_364417 ) ) ( not ( = ?auto_364413 ?auto_364414 ) ) ( not ( = ?auto_364413 ?auto_364416 ) ) ( not ( = ?auto_364413 ?auto_364420 ) ) ( not ( = ?auto_364410 ?auto_364415 ) ) ( not ( = ?auto_364415 ?auto_364417 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364411 ?auto_364410 ?auto_364416 ?auto_364417 )
      ( GET-4IMAGE-VERIFY ?auto_364411 ?auto_364412 ?auto_364413 ?auto_364410 ?auto_364414 ?auto_364415 ?auto_364416 ?auto_364417 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364422 - DIRECTION
      ?auto_364423 - MODE
      ?auto_364424 - DIRECTION
      ?auto_364421 - MODE
      ?auto_364425 - DIRECTION
      ?auto_364426 - MODE
      ?auto_364427 - DIRECTION
      ?auto_364428 - MODE
    )
    :vars
    (
      ?auto_364430 - INSTRUMENT
      ?auto_364431 - SATELLITE
      ?auto_364432 - DIRECTION
      ?auto_364429 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364430 ?auto_364431 ) ( SUPPORTS ?auto_364430 ?auto_364426 ) ( not ( = ?auto_364425 ?auto_364432 ) ) ( HAVE_IMAGE ?auto_364424 ?auto_364428 ) ( not ( = ?auto_364424 ?auto_364425 ) ) ( not ( = ?auto_364424 ?auto_364432 ) ) ( not ( = ?auto_364428 ?auto_364426 ) ) ( CALIBRATION_TARGET ?auto_364430 ?auto_364432 ) ( POWER_AVAIL ?auto_364431 ) ( POINTING ?auto_364431 ?auto_364429 ) ( not ( = ?auto_364432 ?auto_364429 ) ) ( not ( = ?auto_364425 ?auto_364429 ) ) ( not ( = ?auto_364424 ?auto_364429 ) ) ( HAVE_IMAGE ?auto_364422 ?auto_364423 ) ( HAVE_IMAGE ?auto_364424 ?auto_364421 ) ( HAVE_IMAGE ?auto_364427 ?auto_364428 ) ( not ( = ?auto_364422 ?auto_364424 ) ) ( not ( = ?auto_364422 ?auto_364425 ) ) ( not ( = ?auto_364422 ?auto_364427 ) ) ( not ( = ?auto_364422 ?auto_364432 ) ) ( not ( = ?auto_364422 ?auto_364429 ) ) ( not ( = ?auto_364423 ?auto_364421 ) ) ( not ( = ?auto_364423 ?auto_364426 ) ) ( not ( = ?auto_364423 ?auto_364428 ) ) ( not ( = ?auto_364424 ?auto_364427 ) ) ( not ( = ?auto_364421 ?auto_364426 ) ) ( not ( = ?auto_364421 ?auto_364428 ) ) ( not ( = ?auto_364425 ?auto_364427 ) ) ( not ( = ?auto_364427 ?auto_364432 ) ) ( not ( = ?auto_364427 ?auto_364429 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364424 ?auto_364428 ?auto_364425 ?auto_364426 )
      ( GET-4IMAGE-VERIFY ?auto_364422 ?auto_364423 ?auto_364424 ?auto_364421 ?auto_364425 ?auto_364426 ?auto_364427 ?auto_364428 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364434 - DIRECTION
      ?auto_364435 - MODE
      ?auto_364436 - DIRECTION
      ?auto_364433 - MODE
      ?auto_364437 - DIRECTION
      ?auto_364438 - MODE
      ?auto_364439 - DIRECTION
      ?auto_364440 - MODE
    )
    :vars
    (
      ?auto_364441 - INSTRUMENT
      ?auto_364442 - SATELLITE
      ?auto_364443 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364441 ?auto_364442 ) ( SUPPORTS ?auto_364441 ?auto_364438 ) ( not ( = ?auto_364437 ?auto_364443 ) ) ( HAVE_IMAGE ?auto_364436 ?auto_364435 ) ( not ( = ?auto_364436 ?auto_364437 ) ) ( not ( = ?auto_364436 ?auto_364443 ) ) ( not ( = ?auto_364435 ?auto_364438 ) ) ( CALIBRATION_TARGET ?auto_364441 ?auto_364443 ) ( POWER_AVAIL ?auto_364442 ) ( POINTING ?auto_364442 ?auto_364439 ) ( not ( = ?auto_364443 ?auto_364439 ) ) ( not ( = ?auto_364437 ?auto_364439 ) ) ( not ( = ?auto_364436 ?auto_364439 ) ) ( HAVE_IMAGE ?auto_364434 ?auto_364435 ) ( HAVE_IMAGE ?auto_364436 ?auto_364433 ) ( HAVE_IMAGE ?auto_364439 ?auto_364440 ) ( not ( = ?auto_364434 ?auto_364436 ) ) ( not ( = ?auto_364434 ?auto_364437 ) ) ( not ( = ?auto_364434 ?auto_364439 ) ) ( not ( = ?auto_364434 ?auto_364443 ) ) ( not ( = ?auto_364435 ?auto_364433 ) ) ( not ( = ?auto_364435 ?auto_364440 ) ) ( not ( = ?auto_364433 ?auto_364438 ) ) ( not ( = ?auto_364433 ?auto_364440 ) ) ( not ( = ?auto_364438 ?auto_364440 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364436 ?auto_364435 ?auto_364437 ?auto_364438 )
      ( GET-4IMAGE-VERIFY ?auto_364434 ?auto_364435 ?auto_364436 ?auto_364433 ?auto_364437 ?auto_364438 ?auto_364439 ?auto_364440 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364457 - DIRECTION
      ?auto_364458 - MODE
      ?auto_364459 - DIRECTION
      ?auto_364456 - MODE
      ?auto_364460 - DIRECTION
      ?auto_364461 - MODE
      ?auto_364462 - DIRECTION
      ?auto_364463 - MODE
    )
    :vars
    (
      ?auto_364464 - INSTRUMENT
      ?auto_364465 - SATELLITE
      ?auto_364466 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364464 ?auto_364465 ) ( SUPPORTS ?auto_364464 ?auto_364463 ) ( not ( = ?auto_364462 ?auto_364466 ) ) ( HAVE_IMAGE ?auto_364460 ?auto_364461 ) ( not ( = ?auto_364460 ?auto_364462 ) ) ( not ( = ?auto_364460 ?auto_364466 ) ) ( not ( = ?auto_364461 ?auto_364463 ) ) ( CALIBRATION_TARGET ?auto_364464 ?auto_364466 ) ( POWER_AVAIL ?auto_364465 ) ( POINTING ?auto_364465 ?auto_364459 ) ( not ( = ?auto_364466 ?auto_364459 ) ) ( not ( = ?auto_364462 ?auto_364459 ) ) ( not ( = ?auto_364460 ?auto_364459 ) ) ( HAVE_IMAGE ?auto_364457 ?auto_364458 ) ( HAVE_IMAGE ?auto_364459 ?auto_364456 ) ( not ( = ?auto_364457 ?auto_364459 ) ) ( not ( = ?auto_364457 ?auto_364460 ) ) ( not ( = ?auto_364457 ?auto_364462 ) ) ( not ( = ?auto_364457 ?auto_364466 ) ) ( not ( = ?auto_364458 ?auto_364456 ) ) ( not ( = ?auto_364458 ?auto_364461 ) ) ( not ( = ?auto_364458 ?auto_364463 ) ) ( not ( = ?auto_364456 ?auto_364461 ) ) ( not ( = ?auto_364456 ?auto_364463 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364460 ?auto_364461 ?auto_364462 ?auto_364463 )
      ( GET-4IMAGE-VERIFY ?auto_364457 ?auto_364458 ?auto_364459 ?auto_364456 ?auto_364460 ?auto_364461 ?auto_364462 ?auto_364463 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364468 - DIRECTION
      ?auto_364469 - MODE
      ?auto_364470 - DIRECTION
      ?auto_364467 - MODE
      ?auto_364471 - DIRECTION
      ?auto_364472 - MODE
      ?auto_364473 - DIRECTION
      ?auto_364474 - MODE
    )
    :vars
    (
      ?auto_364475 - INSTRUMENT
      ?auto_364476 - SATELLITE
      ?auto_364477 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364475 ?auto_364476 ) ( SUPPORTS ?auto_364475 ?auto_364474 ) ( not ( = ?auto_364473 ?auto_364477 ) ) ( HAVE_IMAGE ?auto_364468 ?auto_364469 ) ( not ( = ?auto_364468 ?auto_364473 ) ) ( not ( = ?auto_364468 ?auto_364477 ) ) ( not ( = ?auto_364469 ?auto_364474 ) ) ( CALIBRATION_TARGET ?auto_364475 ?auto_364477 ) ( POWER_AVAIL ?auto_364476 ) ( POINTING ?auto_364476 ?auto_364471 ) ( not ( = ?auto_364477 ?auto_364471 ) ) ( not ( = ?auto_364473 ?auto_364471 ) ) ( not ( = ?auto_364468 ?auto_364471 ) ) ( HAVE_IMAGE ?auto_364470 ?auto_364467 ) ( HAVE_IMAGE ?auto_364471 ?auto_364472 ) ( not ( = ?auto_364468 ?auto_364470 ) ) ( not ( = ?auto_364469 ?auto_364467 ) ) ( not ( = ?auto_364469 ?auto_364472 ) ) ( not ( = ?auto_364470 ?auto_364471 ) ) ( not ( = ?auto_364470 ?auto_364473 ) ) ( not ( = ?auto_364470 ?auto_364477 ) ) ( not ( = ?auto_364467 ?auto_364472 ) ) ( not ( = ?auto_364467 ?auto_364474 ) ) ( not ( = ?auto_364472 ?auto_364474 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364468 ?auto_364469 ?auto_364473 ?auto_364474 )
      ( GET-4IMAGE-VERIFY ?auto_364468 ?auto_364469 ?auto_364470 ?auto_364467 ?auto_364471 ?auto_364472 ?auto_364473 ?auto_364474 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364479 - DIRECTION
      ?auto_364480 - MODE
      ?auto_364481 - DIRECTION
      ?auto_364478 - MODE
      ?auto_364482 - DIRECTION
      ?auto_364483 - MODE
      ?auto_364484 - DIRECTION
      ?auto_364485 - MODE
    )
    :vars
    (
      ?auto_364486 - INSTRUMENT
      ?auto_364487 - SATELLITE
      ?auto_364488 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364486 ?auto_364487 ) ( SUPPORTS ?auto_364486 ?auto_364483 ) ( not ( = ?auto_364482 ?auto_364488 ) ) ( HAVE_IMAGE ?auto_364479 ?auto_364485 ) ( not ( = ?auto_364479 ?auto_364482 ) ) ( not ( = ?auto_364479 ?auto_364488 ) ) ( not ( = ?auto_364485 ?auto_364483 ) ) ( CALIBRATION_TARGET ?auto_364486 ?auto_364488 ) ( POWER_AVAIL ?auto_364487 ) ( POINTING ?auto_364487 ?auto_364481 ) ( not ( = ?auto_364488 ?auto_364481 ) ) ( not ( = ?auto_364482 ?auto_364481 ) ) ( not ( = ?auto_364479 ?auto_364481 ) ) ( HAVE_IMAGE ?auto_364479 ?auto_364480 ) ( HAVE_IMAGE ?auto_364481 ?auto_364478 ) ( HAVE_IMAGE ?auto_364484 ?auto_364485 ) ( not ( = ?auto_364479 ?auto_364484 ) ) ( not ( = ?auto_364480 ?auto_364478 ) ) ( not ( = ?auto_364480 ?auto_364483 ) ) ( not ( = ?auto_364480 ?auto_364485 ) ) ( not ( = ?auto_364481 ?auto_364484 ) ) ( not ( = ?auto_364478 ?auto_364483 ) ) ( not ( = ?auto_364478 ?auto_364485 ) ) ( not ( = ?auto_364482 ?auto_364484 ) ) ( not ( = ?auto_364484 ?auto_364488 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364479 ?auto_364485 ?auto_364482 ?auto_364483 )
      ( GET-4IMAGE-VERIFY ?auto_364479 ?auto_364480 ?auto_364481 ?auto_364478 ?auto_364482 ?auto_364483 ?auto_364484 ?auto_364485 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364490 - DIRECTION
      ?auto_364491 - MODE
      ?auto_364492 - DIRECTION
      ?auto_364489 - MODE
      ?auto_364493 - DIRECTION
      ?auto_364494 - MODE
      ?auto_364495 - DIRECTION
      ?auto_364496 - MODE
    )
    :vars
    (
      ?auto_364497 - INSTRUMENT
      ?auto_364498 - SATELLITE
      ?auto_364499 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364497 ?auto_364498 ) ( SUPPORTS ?auto_364497 ?auto_364494 ) ( not ( = ?auto_364493 ?auto_364499 ) ) ( HAVE_IMAGE ?auto_364490 ?auto_364491 ) ( not ( = ?auto_364490 ?auto_364493 ) ) ( not ( = ?auto_364490 ?auto_364499 ) ) ( not ( = ?auto_364491 ?auto_364494 ) ) ( CALIBRATION_TARGET ?auto_364497 ?auto_364499 ) ( POWER_AVAIL ?auto_364498 ) ( POINTING ?auto_364498 ?auto_364492 ) ( not ( = ?auto_364499 ?auto_364492 ) ) ( not ( = ?auto_364493 ?auto_364492 ) ) ( not ( = ?auto_364490 ?auto_364492 ) ) ( HAVE_IMAGE ?auto_364492 ?auto_364489 ) ( HAVE_IMAGE ?auto_364495 ?auto_364496 ) ( not ( = ?auto_364490 ?auto_364495 ) ) ( not ( = ?auto_364491 ?auto_364489 ) ) ( not ( = ?auto_364491 ?auto_364496 ) ) ( not ( = ?auto_364492 ?auto_364495 ) ) ( not ( = ?auto_364489 ?auto_364494 ) ) ( not ( = ?auto_364489 ?auto_364496 ) ) ( not ( = ?auto_364493 ?auto_364495 ) ) ( not ( = ?auto_364494 ?auto_364496 ) ) ( not ( = ?auto_364495 ?auto_364499 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364490 ?auto_364491 ?auto_364493 ?auto_364494 )
      ( GET-4IMAGE-VERIFY ?auto_364490 ?auto_364491 ?auto_364492 ?auto_364489 ?auto_364493 ?auto_364494 ?auto_364495 ?auto_364496 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364512 - DIRECTION
      ?auto_364513 - MODE
      ?auto_364514 - DIRECTION
      ?auto_364511 - MODE
      ?auto_364515 - DIRECTION
      ?auto_364516 - MODE
      ?auto_364517 - DIRECTION
      ?auto_364518 - MODE
    )
    :vars
    (
      ?auto_364520 - INSTRUMENT
      ?auto_364521 - SATELLITE
      ?auto_364522 - DIRECTION
      ?auto_364519 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364520 ?auto_364521 ) ( SUPPORTS ?auto_364520 ?auto_364511 ) ( not ( = ?auto_364514 ?auto_364522 ) ) ( HAVE_IMAGE ?auto_364512 ?auto_364518 ) ( not ( = ?auto_364512 ?auto_364514 ) ) ( not ( = ?auto_364512 ?auto_364522 ) ) ( not ( = ?auto_364518 ?auto_364511 ) ) ( CALIBRATION_TARGET ?auto_364520 ?auto_364522 ) ( POWER_AVAIL ?auto_364521 ) ( POINTING ?auto_364521 ?auto_364519 ) ( not ( = ?auto_364522 ?auto_364519 ) ) ( not ( = ?auto_364514 ?auto_364519 ) ) ( not ( = ?auto_364512 ?auto_364519 ) ) ( HAVE_IMAGE ?auto_364512 ?auto_364513 ) ( HAVE_IMAGE ?auto_364515 ?auto_364516 ) ( HAVE_IMAGE ?auto_364517 ?auto_364518 ) ( not ( = ?auto_364512 ?auto_364515 ) ) ( not ( = ?auto_364512 ?auto_364517 ) ) ( not ( = ?auto_364513 ?auto_364511 ) ) ( not ( = ?auto_364513 ?auto_364516 ) ) ( not ( = ?auto_364513 ?auto_364518 ) ) ( not ( = ?auto_364514 ?auto_364515 ) ) ( not ( = ?auto_364514 ?auto_364517 ) ) ( not ( = ?auto_364511 ?auto_364516 ) ) ( not ( = ?auto_364515 ?auto_364517 ) ) ( not ( = ?auto_364515 ?auto_364522 ) ) ( not ( = ?auto_364515 ?auto_364519 ) ) ( not ( = ?auto_364516 ?auto_364518 ) ) ( not ( = ?auto_364517 ?auto_364522 ) ) ( not ( = ?auto_364517 ?auto_364519 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364512 ?auto_364518 ?auto_364514 ?auto_364511 )
      ( GET-4IMAGE-VERIFY ?auto_364512 ?auto_364513 ?auto_364514 ?auto_364511 ?auto_364515 ?auto_364516 ?auto_364517 ?auto_364518 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364524 - DIRECTION
      ?auto_364525 - MODE
      ?auto_364526 - DIRECTION
      ?auto_364523 - MODE
      ?auto_364527 - DIRECTION
      ?auto_364528 - MODE
      ?auto_364529 - DIRECTION
      ?auto_364530 - MODE
    )
    :vars
    (
      ?auto_364531 - INSTRUMENT
      ?auto_364532 - SATELLITE
      ?auto_364533 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364531 ?auto_364532 ) ( SUPPORTS ?auto_364531 ?auto_364523 ) ( not ( = ?auto_364526 ?auto_364533 ) ) ( HAVE_IMAGE ?auto_364527 ?auto_364528 ) ( not ( = ?auto_364527 ?auto_364526 ) ) ( not ( = ?auto_364527 ?auto_364533 ) ) ( not ( = ?auto_364528 ?auto_364523 ) ) ( CALIBRATION_TARGET ?auto_364531 ?auto_364533 ) ( POWER_AVAIL ?auto_364532 ) ( POINTING ?auto_364532 ?auto_364529 ) ( not ( = ?auto_364533 ?auto_364529 ) ) ( not ( = ?auto_364526 ?auto_364529 ) ) ( not ( = ?auto_364527 ?auto_364529 ) ) ( HAVE_IMAGE ?auto_364524 ?auto_364525 ) ( HAVE_IMAGE ?auto_364529 ?auto_364530 ) ( not ( = ?auto_364524 ?auto_364526 ) ) ( not ( = ?auto_364524 ?auto_364527 ) ) ( not ( = ?auto_364524 ?auto_364529 ) ) ( not ( = ?auto_364524 ?auto_364533 ) ) ( not ( = ?auto_364525 ?auto_364523 ) ) ( not ( = ?auto_364525 ?auto_364528 ) ) ( not ( = ?auto_364525 ?auto_364530 ) ) ( not ( = ?auto_364523 ?auto_364530 ) ) ( not ( = ?auto_364528 ?auto_364530 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364527 ?auto_364528 ?auto_364526 ?auto_364523 )
      ( GET-4IMAGE-VERIFY ?auto_364524 ?auto_364525 ?auto_364526 ?auto_364523 ?auto_364527 ?auto_364528 ?auto_364529 ?auto_364530 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364547 - DIRECTION
      ?auto_364548 - MODE
      ?auto_364549 - DIRECTION
      ?auto_364546 - MODE
      ?auto_364550 - DIRECTION
      ?auto_364551 - MODE
      ?auto_364552 - DIRECTION
      ?auto_364553 - MODE
    )
    :vars
    (
      ?auto_364554 - INSTRUMENT
      ?auto_364555 - SATELLITE
      ?auto_364556 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364554 ?auto_364555 ) ( SUPPORTS ?auto_364554 ?auto_364546 ) ( not ( = ?auto_364549 ?auto_364556 ) ) ( HAVE_IMAGE ?auto_364552 ?auto_364553 ) ( not ( = ?auto_364552 ?auto_364549 ) ) ( not ( = ?auto_364552 ?auto_364556 ) ) ( not ( = ?auto_364553 ?auto_364546 ) ) ( CALIBRATION_TARGET ?auto_364554 ?auto_364556 ) ( POWER_AVAIL ?auto_364555 ) ( POINTING ?auto_364555 ?auto_364550 ) ( not ( = ?auto_364556 ?auto_364550 ) ) ( not ( = ?auto_364549 ?auto_364550 ) ) ( not ( = ?auto_364552 ?auto_364550 ) ) ( HAVE_IMAGE ?auto_364547 ?auto_364548 ) ( HAVE_IMAGE ?auto_364550 ?auto_364551 ) ( not ( = ?auto_364547 ?auto_364549 ) ) ( not ( = ?auto_364547 ?auto_364550 ) ) ( not ( = ?auto_364547 ?auto_364552 ) ) ( not ( = ?auto_364547 ?auto_364556 ) ) ( not ( = ?auto_364548 ?auto_364546 ) ) ( not ( = ?auto_364548 ?auto_364551 ) ) ( not ( = ?auto_364548 ?auto_364553 ) ) ( not ( = ?auto_364546 ?auto_364551 ) ) ( not ( = ?auto_364551 ?auto_364553 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364552 ?auto_364553 ?auto_364549 ?auto_364546 )
      ( GET-4IMAGE-VERIFY ?auto_364547 ?auto_364548 ?auto_364549 ?auto_364546 ?auto_364550 ?auto_364551 ?auto_364552 ?auto_364553 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364558 - DIRECTION
      ?auto_364559 - MODE
      ?auto_364560 - DIRECTION
      ?auto_364557 - MODE
      ?auto_364561 - DIRECTION
      ?auto_364562 - MODE
      ?auto_364563 - DIRECTION
      ?auto_364564 - MODE
    )
    :vars
    (
      ?auto_364565 - INSTRUMENT
      ?auto_364566 - SATELLITE
      ?auto_364567 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364565 ?auto_364566 ) ( SUPPORTS ?auto_364565 ?auto_364557 ) ( not ( = ?auto_364560 ?auto_364567 ) ) ( HAVE_IMAGE ?auto_364558 ?auto_364559 ) ( not ( = ?auto_364558 ?auto_364560 ) ) ( not ( = ?auto_364558 ?auto_364567 ) ) ( not ( = ?auto_364559 ?auto_364557 ) ) ( CALIBRATION_TARGET ?auto_364565 ?auto_364567 ) ( POWER_AVAIL ?auto_364566 ) ( POINTING ?auto_364566 ?auto_364561 ) ( not ( = ?auto_364567 ?auto_364561 ) ) ( not ( = ?auto_364560 ?auto_364561 ) ) ( not ( = ?auto_364558 ?auto_364561 ) ) ( HAVE_IMAGE ?auto_364561 ?auto_364562 ) ( HAVE_IMAGE ?auto_364563 ?auto_364564 ) ( not ( = ?auto_364558 ?auto_364563 ) ) ( not ( = ?auto_364559 ?auto_364562 ) ) ( not ( = ?auto_364559 ?auto_364564 ) ) ( not ( = ?auto_364560 ?auto_364563 ) ) ( not ( = ?auto_364557 ?auto_364562 ) ) ( not ( = ?auto_364557 ?auto_364564 ) ) ( not ( = ?auto_364561 ?auto_364563 ) ) ( not ( = ?auto_364562 ?auto_364564 ) ) ( not ( = ?auto_364563 ?auto_364567 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364558 ?auto_364559 ?auto_364560 ?auto_364557 )
      ( GET-4IMAGE-VERIFY ?auto_364558 ?auto_364559 ?auto_364560 ?auto_364557 ?auto_364561 ?auto_364562 ?auto_364563 ?auto_364564 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364615 - DIRECTION
      ?auto_364616 - MODE
      ?auto_364617 - DIRECTION
      ?auto_364614 - MODE
      ?auto_364618 - DIRECTION
      ?auto_364619 - MODE
      ?auto_364620 - DIRECTION
      ?auto_364621 - MODE
    )
    :vars
    (
      ?auto_364622 - INSTRUMENT
      ?auto_364623 - SATELLITE
      ?auto_364624 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364622 ?auto_364623 ) ( SUPPORTS ?auto_364622 ?auto_364621 ) ( not ( = ?auto_364620 ?auto_364624 ) ) ( HAVE_IMAGE ?auto_364618 ?auto_364614 ) ( not ( = ?auto_364618 ?auto_364620 ) ) ( not ( = ?auto_364618 ?auto_364624 ) ) ( not ( = ?auto_364614 ?auto_364621 ) ) ( CALIBRATION_TARGET ?auto_364622 ?auto_364624 ) ( POWER_AVAIL ?auto_364623 ) ( POINTING ?auto_364623 ?auto_364615 ) ( not ( = ?auto_364624 ?auto_364615 ) ) ( not ( = ?auto_364620 ?auto_364615 ) ) ( not ( = ?auto_364618 ?auto_364615 ) ) ( HAVE_IMAGE ?auto_364615 ?auto_364616 ) ( HAVE_IMAGE ?auto_364617 ?auto_364614 ) ( HAVE_IMAGE ?auto_364618 ?auto_364619 ) ( not ( = ?auto_364615 ?auto_364617 ) ) ( not ( = ?auto_364616 ?auto_364614 ) ) ( not ( = ?auto_364616 ?auto_364619 ) ) ( not ( = ?auto_364616 ?auto_364621 ) ) ( not ( = ?auto_364617 ?auto_364618 ) ) ( not ( = ?auto_364617 ?auto_364620 ) ) ( not ( = ?auto_364617 ?auto_364624 ) ) ( not ( = ?auto_364614 ?auto_364619 ) ) ( not ( = ?auto_364619 ?auto_364621 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364618 ?auto_364614 ?auto_364620 ?auto_364621 )
      ( GET-4IMAGE-VERIFY ?auto_364615 ?auto_364616 ?auto_364617 ?auto_364614 ?auto_364618 ?auto_364619 ?auto_364620 ?auto_364621 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364626 - DIRECTION
      ?auto_364627 - MODE
      ?auto_364628 - DIRECTION
      ?auto_364625 - MODE
      ?auto_364629 - DIRECTION
      ?auto_364630 - MODE
      ?auto_364631 - DIRECTION
      ?auto_364632 - MODE
    )
    :vars
    (
      ?auto_364633 - INSTRUMENT
      ?auto_364634 - SATELLITE
      ?auto_364635 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364633 ?auto_364634 ) ( SUPPORTS ?auto_364633 ?auto_364632 ) ( not ( = ?auto_364631 ?auto_364635 ) ) ( HAVE_IMAGE ?auto_364628 ?auto_364625 ) ( not ( = ?auto_364628 ?auto_364631 ) ) ( not ( = ?auto_364628 ?auto_364635 ) ) ( not ( = ?auto_364625 ?auto_364632 ) ) ( CALIBRATION_TARGET ?auto_364633 ?auto_364635 ) ( POWER_AVAIL ?auto_364634 ) ( POINTING ?auto_364634 ?auto_364629 ) ( not ( = ?auto_364635 ?auto_364629 ) ) ( not ( = ?auto_364631 ?auto_364629 ) ) ( not ( = ?auto_364628 ?auto_364629 ) ) ( HAVE_IMAGE ?auto_364626 ?auto_364627 ) ( HAVE_IMAGE ?auto_364629 ?auto_364630 ) ( not ( = ?auto_364626 ?auto_364628 ) ) ( not ( = ?auto_364626 ?auto_364629 ) ) ( not ( = ?auto_364626 ?auto_364631 ) ) ( not ( = ?auto_364626 ?auto_364635 ) ) ( not ( = ?auto_364627 ?auto_364625 ) ) ( not ( = ?auto_364627 ?auto_364630 ) ) ( not ( = ?auto_364627 ?auto_364632 ) ) ( not ( = ?auto_364625 ?auto_364630 ) ) ( not ( = ?auto_364630 ?auto_364632 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364628 ?auto_364625 ?auto_364631 ?auto_364632 )
      ( GET-4IMAGE-VERIFY ?auto_364626 ?auto_364627 ?auto_364628 ?auto_364625 ?auto_364629 ?auto_364630 ?auto_364631 ?auto_364632 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364637 - DIRECTION
      ?auto_364638 - MODE
      ?auto_364639 - DIRECTION
      ?auto_364636 - MODE
      ?auto_364640 - DIRECTION
      ?auto_364641 - MODE
      ?auto_364642 - DIRECTION
      ?auto_364643 - MODE
    )
    :vars
    (
      ?auto_364644 - INSTRUMENT
      ?auto_364645 - SATELLITE
      ?auto_364646 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364644 ?auto_364645 ) ( SUPPORTS ?auto_364644 ?auto_364641 ) ( not ( = ?auto_364640 ?auto_364646 ) ) ( HAVE_IMAGE ?auto_364639 ?auto_364643 ) ( not ( = ?auto_364639 ?auto_364640 ) ) ( not ( = ?auto_364639 ?auto_364646 ) ) ( not ( = ?auto_364643 ?auto_364641 ) ) ( CALIBRATION_TARGET ?auto_364644 ?auto_364646 ) ( POWER_AVAIL ?auto_364645 ) ( POINTING ?auto_364645 ?auto_364637 ) ( not ( = ?auto_364646 ?auto_364637 ) ) ( not ( = ?auto_364640 ?auto_364637 ) ) ( not ( = ?auto_364639 ?auto_364637 ) ) ( HAVE_IMAGE ?auto_364637 ?auto_364638 ) ( HAVE_IMAGE ?auto_364639 ?auto_364636 ) ( HAVE_IMAGE ?auto_364642 ?auto_364643 ) ( not ( = ?auto_364637 ?auto_364642 ) ) ( not ( = ?auto_364638 ?auto_364636 ) ) ( not ( = ?auto_364638 ?auto_364641 ) ) ( not ( = ?auto_364638 ?auto_364643 ) ) ( not ( = ?auto_364639 ?auto_364642 ) ) ( not ( = ?auto_364636 ?auto_364641 ) ) ( not ( = ?auto_364636 ?auto_364643 ) ) ( not ( = ?auto_364640 ?auto_364642 ) ) ( not ( = ?auto_364642 ?auto_364646 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364639 ?auto_364643 ?auto_364640 ?auto_364641 )
      ( GET-4IMAGE-VERIFY ?auto_364637 ?auto_364638 ?auto_364639 ?auto_364636 ?auto_364640 ?auto_364641 ?auto_364642 ?auto_364643 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364648 - DIRECTION
      ?auto_364649 - MODE
      ?auto_364650 - DIRECTION
      ?auto_364647 - MODE
      ?auto_364651 - DIRECTION
      ?auto_364652 - MODE
      ?auto_364653 - DIRECTION
      ?auto_364654 - MODE
    )
    :vars
    (
      ?auto_364655 - INSTRUMENT
      ?auto_364656 - SATELLITE
      ?auto_364657 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364655 ?auto_364656 ) ( SUPPORTS ?auto_364655 ?auto_364652 ) ( not ( = ?auto_364651 ?auto_364657 ) ) ( HAVE_IMAGE ?auto_364650 ?auto_364647 ) ( not ( = ?auto_364650 ?auto_364651 ) ) ( not ( = ?auto_364650 ?auto_364657 ) ) ( not ( = ?auto_364647 ?auto_364652 ) ) ( CALIBRATION_TARGET ?auto_364655 ?auto_364657 ) ( POWER_AVAIL ?auto_364656 ) ( POINTING ?auto_364656 ?auto_364648 ) ( not ( = ?auto_364657 ?auto_364648 ) ) ( not ( = ?auto_364651 ?auto_364648 ) ) ( not ( = ?auto_364650 ?auto_364648 ) ) ( HAVE_IMAGE ?auto_364648 ?auto_364649 ) ( HAVE_IMAGE ?auto_364653 ?auto_364654 ) ( not ( = ?auto_364648 ?auto_364653 ) ) ( not ( = ?auto_364649 ?auto_364647 ) ) ( not ( = ?auto_364649 ?auto_364652 ) ) ( not ( = ?auto_364649 ?auto_364654 ) ) ( not ( = ?auto_364650 ?auto_364653 ) ) ( not ( = ?auto_364647 ?auto_364654 ) ) ( not ( = ?auto_364651 ?auto_364653 ) ) ( not ( = ?auto_364652 ?auto_364654 ) ) ( not ( = ?auto_364653 ?auto_364657 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364650 ?auto_364647 ?auto_364651 ?auto_364652 )
      ( GET-4IMAGE-VERIFY ?auto_364648 ?auto_364649 ?auto_364650 ?auto_364647 ?auto_364651 ?auto_364652 ?auto_364653 ?auto_364654 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364670 - DIRECTION
      ?auto_364671 - MODE
      ?auto_364672 - DIRECTION
      ?auto_364669 - MODE
      ?auto_364673 - DIRECTION
      ?auto_364674 - MODE
      ?auto_364675 - DIRECTION
      ?auto_364676 - MODE
    )
    :vars
    (
      ?auto_364677 - INSTRUMENT
      ?auto_364678 - SATELLITE
      ?auto_364679 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364677 ?auto_364678 ) ( SUPPORTS ?auto_364677 ?auto_364676 ) ( not ( = ?auto_364675 ?auto_364679 ) ) ( HAVE_IMAGE ?auto_364673 ?auto_364674 ) ( not ( = ?auto_364673 ?auto_364675 ) ) ( not ( = ?auto_364673 ?auto_364679 ) ) ( not ( = ?auto_364674 ?auto_364676 ) ) ( CALIBRATION_TARGET ?auto_364677 ?auto_364679 ) ( POWER_AVAIL ?auto_364678 ) ( POINTING ?auto_364678 ?auto_364670 ) ( not ( = ?auto_364679 ?auto_364670 ) ) ( not ( = ?auto_364675 ?auto_364670 ) ) ( not ( = ?auto_364673 ?auto_364670 ) ) ( HAVE_IMAGE ?auto_364670 ?auto_364671 ) ( HAVE_IMAGE ?auto_364672 ?auto_364669 ) ( not ( = ?auto_364670 ?auto_364672 ) ) ( not ( = ?auto_364671 ?auto_364669 ) ) ( not ( = ?auto_364671 ?auto_364674 ) ) ( not ( = ?auto_364671 ?auto_364676 ) ) ( not ( = ?auto_364672 ?auto_364673 ) ) ( not ( = ?auto_364672 ?auto_364675 ) ) ( not ( = ?auto_364672 ?auto_364679 ) ) ( not ( = ?auto_364669 ?auto_364674 ) ) ( not ( = ?auto_364669 ?auto_364676 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364673 ?auto_364674 ?auto_364675 ?auto_364676 )
      ( GET-4IMAGE-VERIFY ?auto_364670 ?auto_364671 ?auto_364672 ?auto_364669 ?auto_364673 ?auto_364674 ?auto_364675 ?auto_364676 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364681 - DIRECTION
      ?auto_364682 - MODE
      ?auto_364683 - DIRECTION
      ?auto_364680 - MODE
      ?auto_364684 - DIRECTION
      ?auto_364685 - MODE
      ?auto_364686 - DIRECTION
      ?auto_364687 - MODE
    )
    :vars
    (
      ?auto_364688 - INSTRUMENT
      ?auto_364689 - SATELLITE
      ?auto_364691 - DIRECTION
      ?auto_364692 - DIRECTION
      ?auto_364690 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_364688 ?auto_364689 ) ( SUPPORTS ?auto_364688 ?auto_364687 ) ( not ( = ?auto_364686 ?auto_364691 ) ) ( HAVE_IMAGE ?auto_364692 ?auto_364690 ) ( not ( = ?auto_364692 ?auto_364686 ) ) ( not ( = ?auto_364692 ?auto_364691 ) ) ( not ( = ?auto_364690 ?auto_364687 ) ) ( CALIBRATION_TARGET ?auto_364688 ?auto_364691 ) ( POWER_AVAIL ?auto_364689 ) ( POINTING ?auto_364689 ?auto_364684 ) ( not ( = ?auto_364691 ?auto_364684 ) ) ( not ( = ?auto_364686 ?auto_364684 ) ) ( not ( = ?auto_364692 ?auto_364684 ) ) ( HAVE_IMAGE ?auto_364681 ?auto_364682 ) ( HAVE_IMAGE ?auto_364683 ?auto_364680 ) ( HAVE_IMAGE ?auto_364684 ?auto_364685 ) ( not ( = ?auto_364681 ?auto_364683 ) ) ( not ( = ?auto_364681 ?auto_364684 ) ) ( not ( = ?auto_364681 ?auto_364686 ) ) ( not ( = ?auto_364681 ?auto_364691 ) ) ( not ( = ?auto_364681 ?auto_364692 ) ) ( not ( = ?auto_364682 ?auto_364680 ) ) ( not ( = ?auto_364682 ?auto_364685 ) ) ( not ( = ?auto_364682 ?auto_364687 ) ) ( not ( = ?auto_364682 ?auto_364690 ) ) ( not ( = ?auto_364683 ?auto_364684 ) ) ( not ( = ?auto_364683 ?auto_364686 ) ) ( not ( = ?auto_364683 ?auto_364691 ) ) ( not ( = ?auto_364683 ?auto_364692 ) ) ( not ( = ?auto_364680 ?auto_364685 ) ) ( not ( = ?auto_364680 ?auto_364687 ) ) ( not ( = ?auto_364680 ?auto_364690 ) ) ( not ( = ?auto_364685 ?auto_364687 ) ) ( not ( = ?auto_364685 ?auto_364690 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364692 ?auto_364690 ?auto_364686 ?auto_364687 )
      ( GET-4IMAGE-VERIFY ?auto_364681 ?auto_364682 ?auto_364683 ?auto_364680 ?auto_364684 ?auto_364685 ?auto_364686 ?auto_364687 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364694 - DIRECTION
      ?auto_364695 - MODE
      ?auto_364696 - DIRECTION
      ?auto_364693 - MODE
      ?auto_364697 - DIRECTION
      ?auto_364698 - MODE
      ?auto_364699 - DIRECTION
      ?auto_364700 - MODE
    )
    :vars
    (
      ?auto_364701 - INSTRUMENT
      ?auto_364702 - SATELLITE
      ?auto_364703 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364701 ?auto_364702 ) ( SUPPORTS ?auto_364701 ?auto_364698 ) ( not ( = ?auto_364697 ?auto_364703 ) ) ( HAVE_IMAGE ?auto_364699 ?auto_364700 ) ( not ( = ?auto_364699 ?auto_364697 ) ) ( not ( = ?auto_364699 ?auto_364703 ) ) ( not ( = ?auto_364700 ?auto_364698 ) ) ( CALIBRATION_TARGET ?auto_364701 ?auto_364703 ) ( POWER_AVAIL ?auto_364702 ) ( POINTING ?auto_364702 ?auto_364694 ) ( not ( = ?auto_364703 ?auto_364694 ) ) ( not ( = ?auto_364697 ?auto_364694 ) ) ( not ( = ?auto_364699 ?auto_364694 ) ) ( HAVE_IMAGE ?auto_364694 ?auto_364695 ) ( HAVE_IMAGE ?auto_364696 ?auto_364693 ) ( not ( = ?auto_364694 ?auto_364696 ) ) ( not ( = ?auto_364695 ?auto_364693 ) ) ( not ( = ?auto_364695 ?auto_364698 ) ) ( not ( = ?auto_364695 ?auto_364700 ) ) ( not ( = ?auto_364696 ?auto_364697 ) ) ( not ( = ?auto_364696 ?auto_364699 ) ) ( not ( = ?auto_364696 ?auto_364703 ) ) ( not ( = ?auto_364693 ?auto_364698 ) ) ( not ( = ?auto_364693 ?auto_364700 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364699 ?auto_364700 ?auto_364697 ?auto_364698 )
      ( GET-4IMAGE-VERIFY ?auto_364694 ?auto_364695 ?auto_364696 ?auto_364693 ?auto_364697 ?auto_364698 ?auto_364699 ?auto_364700 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364705 - DIRECTION
      ?auto_364706 - MODE
      ?auto_364707 - DIRECTION
      ?auto_364704 - MODE
      ?auto_364708 - DIRECTION
      ?auto_364709 - MODE
      ?auto_364710 - DIRECTION
      ?auto_364711 - MODE
    )
    :vars
    (
      ?auto_364712 - INSTRUMENT
      ?auto_364713 - SATELLITE
      ?auto_364715 - DIRECTION
      ?auto_364716 - DIRECTION
      ?auto_364714 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_364712 ?auto_364713 ) ( SUPPORTS ?auto_364712 ?auto_364709 ) ( not ( = ?auto_364708 ?auto_364715 ) ) ( HAVE_IMAGE ?auto_364716 ?auto_364714 ) ( not ( = ?auto_364716 ?auto_364708 ) ) ( not ( = ?auto_364716 ?auto_364715 ) ) ( not ( = ?auto_364714 ?auto_364709 ) ) ( CALIBRATION_TARGET ?auto_364712 ?auto_364715 ) ( POWER_AVAIL ?auto_364713 ) ( POINTING ?auto_364713 ?auto_364707 ) ( not ( = ?auto_364715 ?auto_364707 ) ) ( not ( = ?auto_364708 ?auto_364707 ) ) ( not ( = ?auto_364716 ?auto_364707 ) ) ( HAVE_IMAGE ?auto_364705 ?auto_364706 ) ( HAVE_IMAGE ?auto_364707 ?auto_364704 ) ( HAVE_IMAGE ?auto_364710 ?auto_364711 ) ( not ( = ?auto_364705 ?auto_364707 ) ) ( not ( = ?auto_364705 ?auto_364708 ) ) ( not ( = ?auto_364705 ?auto_364710 ) ) ( not ( = ?auto_364705 ?auto_364715 ) ) ( not ( = ?auto_364705 ?auto_364716 ) ) ( not ( = ?auto_364706 ?auto_364704 ) ) ( not ( = ?auto_364706 ?auto_364709 ) ) ( not ( = ?auto_364706 ?auto_364711 ) ) ( not ( = ?auto_364706 ?auto_364714 ) ) ( not ( = ?auto_364707 ?auto_364710 ) ) ( not ( = ?auto_364704 ?auto_364709 ) ) ( not ( = ?auto_364704 ?auto_364711 ) ) ( not ( = ?auto_364704 ?auto_364714 ) ) ( not ( = ?auto_364708 ?auto_364710 ) ) ( not ( = ?auto_364709 ?auto_364711 ) ) ( not ( = ?auto_364710 ?auto_364715 ) ) ( not ( = ?auto_364710 ?auto_364716 ) ) ( not ( = ?auto_364711 ?auto_364714 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364716 ?auto_364714 ?auto_364708 ?auto_364709 )
      ( GET-4IMAGE-VERIFY ?auto_364705 ?auto_364706 ?auto_364707 ?auto_364704 ?auto_364708 ?auto_364709 ?auto_364710 ?auto_364711 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364731 - DIRECTION
      ?auto_364732 - MODE
      ?auto_364733 - DIRECTION
      ?auto_364730 - MODE
      ?auto_364734 - DIRECTION
      ?auto_364735 - MODE
      ?auto_364736 - DIRECTION
      ?auto_364737 - MODE
    )
    :vars
    (
      ?auto_364738 - INSTRUMENT
      ?auto_364739 - SATELLITE
      ?auto_364740 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364738 ?auto_364739 ) ( SUPPORTS ?auto_364738 ?auto_364730 ) ( not ( = ?auto_364733 ?auto_364740 ) ) ( HAVE_IMAGE ?auto_364734 ?auto_364737 ) ( not ( = ?auto_364734 ?auto_364733 ) ) ( not ( = ?auto_364734 ?auto_364740 ) ) ( not ( = ?auto_364737 ?auto_364730 ) ) ( CALIBRATION_TARGET ?auto_364738 ?auto_364740 ) ( POWER_AVAIL ?auto_364739 ) ( POINTING ?auto_364739 ?auto_364731 ) ( not ( = ?auto_364740 ?auto_364731 ) ) ( not ( = ?auto_364733 ?auto_364731 ) ) ( not ( = ?auto_364734 ?auto_364731 ) ) ( HAVE_IMAGE ?auto_364731 ?auto_364732 ) ( HAVE_IMAGE ?auto_364734 ?auto_364735 ) ( HAVE_IMAGE ?auto_364736 ?auto_364737 ) ( not ( = ?auto_364731 ?auto_364736 ) ) ( not ( = ?auto_364732 ?auto_364730 ) ) ( not ( = ?auto_364732 ?auto_364735 ) ) ( not ( = ?auto_364732 ?auto_364737 ) ) ( not ( = ?auto_364733 ?auto_364736 ) ) ( not ( = ?auto_364730 ?auto_364735 ) ) ( not ( = ?auto_364734 ?auto_364736 ) ) ( not ( = ?auto_364735 ?auto_364737 ) ) ( not ( = ?auto_364736 ?auto_364740 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364734 ?auto_364737 ?auto_364733 ?auto_364730 )
      ( GET-4IMAGE-VERIFY ?auto_364731 ?auto_364732 ?auto_364733 ?auto_364730 ?auto_364734 ?auto_364735 ?auto_364736 ?auto_364737 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364742 - DIRECTION
      ?auto_364743 - MODE
      ?auto_364744 - DIRECTION
      ?auto_364741 - MODE
      ?auto_364745 - DIRECTION
      ?auto_364746 - MODE
      ?auto_364747 - DIRECTION
      ?auto_364748 - MODE
    )
    :vars
    (
      ?auto_364749 - INSTRUMENT
      ?auto_364750 - SATELLITE
      ?auto_364751 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364749 ?auto_364750 ) ( SUPPORTS ?auto_364749 ?auto_364741 ) ( not ( = ?auto_364744 ?auto_364751 ) ) ( HAVE_IMAGE ?auto_364745 ?auto_364746 ) ( not ( = ?auto_364745 ?auto_364744 ) ) ( not ( = ?auto_364745 ?auto_364751 ) ) ( not ( = ?auto_364746 ?auto_364741 ) ) ( CALIBRATION_TARGET ?auto_364749 ?auto_364751 ) ( POWER_AVAIL ?auto_364750 ) ( POINTING ?auto_364750 ?auto_364742 ) ( not ( = ?auto_364751 ?auto_364742 ) ) ( not ( = ?auto_364744 ?auto_364742 ) ) ( not ( = ?auto_364745 ?auto_364742 ) ) ( HAVE_IMAGE ?auto_364742 ?auto_364743 ) ( HAVE_IMAGE ?auto_364747 ?auto_364748 ) ( not ( = ?auto_364742 ?auto_364747 ) ) ( not ( = ?auto_364743 ?auto_364741 ) ) ( not ( = ?auto_364743 ?auto_364746 ) ) ( not ( = ?auto_364743 ?auto_364748 ) ) ( not ( = ?auto_364744 ?auto_364747 ) ) ( not ( = ?auto_364741 ?auto_364748 ) ) ( not ( = ?auto_364745 ?auto_364747 ) ) ( not ( = ?auto_364746 ?auto_364748 ) ) ( not ( = ?auto_364747 ?auto_364751 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364745 ?auto_364746 ?auto_364744 ?auto_364741 )
      ( GET-4IMAGE-VERIFY ?auto_364742 ?auto_364743 ?auto_364744 ?auto_364741 ?auto_364745 ?auto_364746 ?auto_364747 ?auto_364748 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364764 - DIRECTION
      ?auto_364765 - MODE
      ?auto_364766 - DIRECTION
      ?auto_364763 - MODE
      ?auto_364767 - DIRECTION
      ?auto_364768 - MODE
      ?auto_364769 - DIRECTION
      ?auto_364770 - MODE
    )
    :vars
    (
      ?auto_364771 - INSTRUMENT
      ?auto_364772 - SATELLITE
      ?auto_364773 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364771 ?auto_364772 ) ( SUPPORTS ?auto_364771 ?auto_364763 ) ( not ( = ?auto_364766 ?auto_364773 ) ) ( HAVE_IMAGE ?auto_364769 ?auto_364770 ) ( not ( = ?auto_364769 ?auto_364766 ) ) ( not ( = ?auto_364769 ?auto_364773 ) ) ( not ( = ?auto_364770 ?auto_364763 ) ) ( CALIBRATION_TARGET ?auto_364771 ?auto_364773 ) ( POWER_AVAIL ?auto_364772 ) ( POINTING ?auto_364772 ?auto_364764 ) ( not ( = ?auto_364773 ?auto_364764 ) ) ( not ( = ?auto_364766 ?auto_364764 ) ) ( not ( = ?auto_364769 ?auto_364764 ) ) ( HAVE_IMAGE ?auto_364764 ?auto_364765 ) ( HAVE_IMAGE ?auto_364767 ?auto_364768 ) ( not ( = ?auto_364764 ?auto_364767 ) ) ( not ( = ?auto_364765 ?auto_364763 ) ) ( not ( = ?auto_364765 ?auto_364768 ) ) ( not ( = ?auto_364765 ?auto_364770 ) ) ( not ( = ?auto_364766 ?auto_364767 ) ) ( not ( = ?auto_364763 ?auto_364768 ) ) ( not ( = ?auto_364767 ?auto_364769 ) ) ( not ( = ?auto_364767 ?auto_364773 ) ) ( not ( = ?auto_364768 ?auto_364770 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364769 ?auto_364770 ?auto_364766 ?auto_364763 )
      ( GET-4IMAGE-VERIFY ?auto_364764 ?auto_364765 ?auto_364766 ?auto_364763 ?auto_364767 ?auto_364768 ?auto_364769 ?auto_364770 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364775 - DIRECTION
      ?auto_364776 - MODE
      ?auto_364777 - DIRECTION
      ?auto_364774 - MODE
      ?auto_364778 - DIRECTION
      ?auto_364779 - MODE
      ?auto_364780 - DIRECTION
      ?auto_364781 - MODE
    )
    :vars
    (
      ?auto_364782 - INSTRUMENT
      ?auto_364783 - SATELLITE
      ?auto_364785 - DIRECTION
      ?auto_364786 - DIRECTION
      ?auto_364784 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_364782 ?auto_364783 ) ( SUPPORTS ?auto_364782 ?auto_364774 ) ( not ( = ?auto_364777 ?auto_364785 ) ) ( HAVE_IMAGE ?auto_364786 ?auto_364784 ) ( not ( = ?auto_364786 ?auto_364777 ) ) ( not ( = ?auto_364786 ?auto_364785 ) ) ( not ( = ?auto_364784 ?auto_364774 ) ) ( CALIBRATION_TARGET ?auto_364782 ?auto_364785 ) ( POWER_AVAIL ?auto_364783 ) ( POINTING ?auto_364783 ?auto_364778 ) ( not ( = ?auto_364785 ?auto_364778 ) ) ( not ( = ?auto_364777 ?auto_364778 ) ) ( not ( = ?auto_364786 ?auto_364778 ) ) ( HAVE_IMAGE ?auto_364775 ?auto_364776 ) ( HAVE_IMAGE ?auto_364778 ?auto_364779 ) ( HAVE_IMAGE ?auto_364780 ?auto_364781 ) ( not ( = ?auto_364775 ?auto_364777 ) ) ( not ( = ?auto_364775 ?auto_364778 ) ) ( not ( = ?auto_364775 ?auto_364780 ) ) ( not ( = ?auto_364775 ?auto_364785 ) ) ( not ( = ?auto_364775 ?auto_364786 ) ) ( not ( = ?auto_364776 ?auto_364774 ) ) ( not ( = ?auto_364776 ?auto_364779 ) ) ( not ( = ?auto_364776 ?auto_364781 ) ) ( not ( = ?auto_364776 ?auto_364784 ) ) ( not ( = ?auto_364777 ?auto_364780 ) ) ( not ( = ?auto_364774 ?auto_364779 ) ) ( not ( = ?auto_364774 ?auto_364781 ) ) ( not ( = ?auto_364778 ?auto_364780 ) ) ( not ( = ?auto_364779 ?auto_364781 ) ) ( not ( = ?auto_364779 ?auto_364784 ) ) ( not ( = ?auto_364780 ?auto_364785 ) ) ( not ( = ?auto_364780 ?auto_364786 ) ) ( not ( = ?auto_364781 ?auto_364784 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364786 ?auto_364784 ?auto_364777 ?auto_364774 )
      ( GET-4IMAGE-VERIFY ?auto_364775 ?auto_364776 ?auto_364777 ?auto_364774 ?auto_364778 ?auto_364779 ?auto_364780 ?auto_364781 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364838 - DIRECTION
      ?auto_364839 - MODE
      ?auto_364840 - DIRECTION
      ?auto_364837 - MODE
      ?auto_364841 - DIRECTION
      ?auto_364842 - MODE
      ?auto_364843 - DIRECTION
      ?auto_364844 - MODE
    )
    :vars
    (
      ?auto_364846 - INSTRUMENT
      ?auto_364847 - SATELLITE
      ?auto_364848 - DIRECTION
      ?auto_364845 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364846 ?auto_364847 ) ( SUPPORTS ?auto_364846 ?auto_364839 ) ( not ( = ?auto_364838 ?auto_364848 ) ) ( HAVE_IMAGE ?auto_364840 ?auto_364844 ) ( not ( = ?auto_364840 ?auto_364838 ) ) ( not ( = ?auto_364840 ?auto_364848 ) ) ( not ( = ?auto_364844 ?auto_364839 ) ) ( CALIBRATION_TARGET ?auto_364846 ?auto_364848 ) ( POWER_AVAIL ?auto_364847 ) ( POINTING ?auto_364847 ?auto_364845 ) ( not ( = ?auto_364848 ?auto_364845 ) ) ( not ( = ?auto_364838 ?auto_364845 ) ) ( not ( = ?auto_364840 ?auto_364845 ) ) ( HAVE_IMAGE ?auto_364840 ?auto_364837 ) ( HAVE_IMAGE ?auto_364841 ?auto_364842 ) ( HAVE_IMAGE ?auto_364843 ?auto_364844 ) ( not ( = ?auto_364838 ?auto_364841 ) ) ( not ( = ?auto_364838 ?auto_364843 ) ) ( not ( = ?auto_364839 ?auto_364837 ) ) ( not ( = ?auto_364839 ?auto_364842 ) ) ( not ( = ?auto_364840 ?auto_364841 ) ) ( not ( = ?auto_364840 ?auto_364843 ) ) ( not ( = ?auto_364837 ?auto_364842 ) ) ( not ( = ?auto_364837 ?auto_364844 ) ) ( not ( = ?auto_364841 ?auto_364843 ) ) ( not ( = ?auto_364841 ?auto_364848 ) ) ( not ( = ?auto_364841 ?auto_364845 ) ) ( not ( = ?auto_364842 ?auto_364844 ) ) ( not ( = ?auto_364843 ?auto_364848 ) ) ( not ( = ?auto_364843 ?auto_364845 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364840 ?auto_364844 ?auto_364838 ?auto_364839 )
      ( GET-4IMAGE-VERIFY ?auto_364838 ?auto_364839 ?auto_364840 ?auto_364837 ?auto_364841 ?auto_364842 ?auto_364843 ?auto_364844 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364850 - DIRECTION
      ?auto_364851 - MODE
      ?auto_364852 - DIRECTION
      ?auto_364849 - MODE
      ?auto_364853 - DIRECTION
      ?auto_364854 - MODE
      ?auto_364855 - DIRECTION
      ?auto_364856 - MODE
    )
    :vars
    (
      ?auto_364857 - INSTRUMENT
      ?auto_364858 - SATELLITE
      ?auto_364859 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364857 ?auto_364858 ) ( SUPPORTS ?auto_364857 ?auto_364851 ) ( not ( = ?auto_364850 ?auto_364859 ) ) ( HAVE_IMAGE ?auto_364853 ?auto_364849 ) ( not ( = ?auto_364853 ?auto_364850 ) ) ( not ( = ?auto_364853 ?auto_364859 ) ) ( not ( = ?auto_364849 ?auto_364851 ) ) ( CALIBRATION_TARGET ?auto_364857 ?auto_364859 ) ( POWER_AVAIL ?auto_364858 ) ( POINTING ?auto_364858 ?auto_364855 ) ( not ( = ?auto_364859 ?auto_364855 ) ) ( not ( = ?auto_364850 ?auto_364855 ) ) ( not ( = ?auto_364853 ?auto_364855 ) ) ( HAVE_IMAGE ?auto_364852 ?auto_364849 ) ( HAVE_IMAGE ?auto_364853 ?auto_364854 ) ( HAVE_IMAGE ?auto_364855 ?auto_364856 ) ( not ( = ?auto_364850 ?auto_364852 ) ) ( not ( = ?auto_364851 ?auto_364854 ) ) ( not ( = ?auto_364851 ?auto_364856 ) ) ( not ( = ?auto_364852 ?auto_364853 ) ) ( not ( = ?auto_364852 ?auto_364855 ) ) ( not ( = ?auto_364852 ?auto_364859 ) ) ( not ( = ?auto_364849 ?auto_364854 ) ) ( not ( = ?auto_364849 ?auto_364856 ) ) ( not ( = ?auto_364854 ?auto_364856 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364853 ?auto_364849 ?auto_364850 ?auto_364851 )
      ( GET-4IMAGE-VERIFY ?auto_364850 ?auto_364851 ?auto_364852 ?auto_364849 ?auto_364853 ?auto_364854 ?auto_364855 ?auto_364856 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364873 - DIRECTION
      ?auto_364874 - MODE
      ?auto_364875 - DIRECTION
      ?auto_364872 - MODE
      ?auto_364876 - DIRECTION
      ?auto_364877 - MODE
      ?auto_364878 - DIRECTION
      ?auto_364879 - MODE
    )
    :vars
    (
      ?auto_364880 - INSTRUMENT
      ?auto_364881 - SATELLITE
      ?auto_364882 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364880 ?auto_364881 ) ( SUPPORTS ?auto_364880 ?auto_364874 ) ( not ( = ?auto_364873 ?auto_364882 ) ) ( HAVE_IMAGE ?auto_364878 ?auto_364879 ) ( not ( = ?auto_364878 ?auto_364873 ) ) ( not ( = ?auto_364878 ?auto_364882 ) ) ( not ( = ?auto_364879 ?auto_364874 ) ) ( CALIBRATION_TARGET ?auto_364880 ?auto_364882 ) ( POWER_AVAIL ?auto_364881 ) ( POINTING ?auto_364881 ?auto_364876 ) ( not ( = ?auto_364882 ?auto_364876 ) ) ( not ( = ?auto_364873 ?auto_364876 ) ) ( not ( = ?auto_364878 ?auto_364876 ) ) ( HAVE_IMAGE ?auto_364875 ?auto_364872 ) ( HAVE_IMAGE ?auto_364876 ?auto_364877 ) ( not ( = ?auto_364873 ?auto_364875 ) ) ( not ( = ?auto_364874 ?auto_364872 ) ) ( not ( = ?auto_364874 ?auto_364877 ) ) ( not ( = ?auto_364875 ?auto_364876 ) ) ( not ( = ?auto_364875 ?auto_364878 ) ) ( not ( = ?auto_364875 ?auto_364882 ) ) ( not ( = ?auto_364872 ?auto_364877 ) ) ( not ( = ?auto_364872 ?auto_364879 ) ) ( not ( = ?auto_364877 ?auto_364879 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364878 ?auto_364879 ?auto_364873 ?auto_364874 )
      ( GET-4IMAGE-VERIFY ?auto_364873 ?auto_364874 ?auto_364875 ?auto_364872 ?auto_364876 ?auto_364877 ?auto_364878 ?auto_364879 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364884 - DIRECTION
      ?auto_364885 - MODE
      ?auto_364886 - DIRECTION
      ?auto_364883 - MODE
      ?auto_364887 - DIRECTION
      ?auto_364888 - MODE
      ?auto_364889 - DIRECTION
      ?auto_364890 - MODE
    )
    :vars
    (
      ?auto_364891 - INSTRUMENT
      ?auto_364892 - SATELLITE
      ?auto_364893 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364891 ?auto_364892 ) ( SUPPORTS ?auto_364891 ?auto_364885 ) ( not ( = ?auto_364884 ?auto_364893 ) ) ( HAVE_IMAGE ?auto_364886 ?auto_364883 ) ( not ( = ?auto_364886 ?auto_364884 ) ) ( not ( = ?auto_364886 ?auto_364893 ) ) ( not ( = ?auto_364883 ?auto_364885 ) ) ( CALIBRATION_TARGET ?auto_364891 ?auto_364893 ) ( POWER_AVAIL ?auto_364892 ) ( POINTING ?auto_364892 ?auto_364887 ) ( not ( = ?auto_364893 ?auto_364887 ) ) ( not ( = ?auto_364884 ?auto_364887 ) ) ( not ( = ?auto_364886 ?auto_364887 ) ) ( HAVE_IMAGE ?auto_364887 ?auto_364888 ) ( HAVE_IMAGE ?auto_364889 ?auto_364890 ) ( not ( = ?auto_364884 ?auto_364889 ) ) ( not ( = ?auto_364885 ?auto_364888 ) ) ( not ( = ?auto_364885 ?auto_364890 ) ) ( not ( = ?auto_364886 ?auto_364889 ) ) ( not ( = ?auto_364883 ?auto_364888 ) ) ( not ( = ?auto_364883 ?auto_364890 ) ) ( not ( = ?auto_364887 ?auto_364889 ) ) ( not ( = ?auto_364888 ?auto_364890 ) ) ( not ( = ?auto_364889 ?auto_364893 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364886 ?auto_364883 ?auto_364884 ?auto_364885 )
      ( GET-4IMAGE-VERIFY ?auto_364884 ?auto_364885 ?auto_364886 ?auto_364883 ?auto_364887 ?auto_364888 ?auto_364889 ?auto_364890 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364941 - DIRECTION
      ?auto_364942 - MODE
      ?auto_364943 - DIRECTION
      ?auto_364940 - MODE
      ?auto_364944 - DIRECTION
      ?auto_364945 - MODE
      ?auto_364946 - DIRECTION
      ?auto_364947 - MODE
    )
    :vars
    (
      ?auto_364948 - INSTRUMENT
      ?auto_364949 - SATELLITE
      ?auto_364950 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364948 ?auto_364949 ) ( SUPPORTS ?auto_364948 ?auto_364942 ) ( not ( = ?auto_364941 ?auto_364950 ) ) ( HAVE_IMAGE ?auto_364944 ?auto_364947 ) ( not ( = ?auto_364944 ?auto_364941 ) ) ( not ( = ?auto_364944 ?auto_364950 ) ) ( not ( = ?auto_364947 ?auto_364942 ) ) ( CALIBRATION_TARGET ?auto_364948 ?auto_364950 ) ( POWER_AVAIL ?auto_364949 ) ( POINTING ?auto_364949 ?auto_364943 ) ( not ( = ?auto_364950 ?auto_364943 ) ) ( not ( = ?auto_364941 ?auto_364943 ) ) ( not ( = ?auto_364944 ?auto_364943 ) ) ( HAVE_IMAGE ?auto_364943 ?auto_364940 ) ( HAVE_IMAGE ?auto_364944 ?auto_364945 ) ( HAVE_IMAGE ?auto_364946 ?auto_364947 ) ( not ( = ?auto_364941 ?auto_364946 ) ) ( not ( = ?auto_364942 ?auto_364940 ) ) ( not ( = ?auto_364942 ?auto_364945 ) ) ( not ( = ?auto_364943 ?auto_364946 ) ) ( not ( = ?auto_364940 ?auto_364945 ) ) ( not ( = ?auto_364940 ?auto_364947 ) ) ( not ( = ?auto_364944 ?auto_364946 ) ) ( not ( = ?auto_364945 ?auto_364947 ) ) ( not ( = ?auto_364946 ?auto_364950 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364944 ?auto_364947 ?auto_364941 ?auto_364942 )
      ( GET-4IMAGE-VERIFY ?auto_364941 ?auto_364942 ?auto_364943 ?auto_364940 ?auto_364944 ?auto_364945 ?auto_364946 ?auto_364947 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364952 - DIRECTION
      ?auto_364953 - MODE
      ?auto_364954 - DIRECTION
      ?auto_364951 - MODE
      ?auto_364955 - DIRECTION
      ?auto_364956 - MODE
      ?auto_364957 - DIRECTION
      ?auto_364958 - MODE
    )
    :vars
    (
      ?auto_364959 - INSTRUMENT
      ?auto_364960 - SATELLITE
      ?auto_364961 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_364959 ?auto_364960 ) ( SUPPORTS ?auto_364959 ?auto_364953 ) ( not ( = ?auto_364952 ?auto_364961 ) ) ( HAVE_IMAGE ?auto_364955 ?auto_364956 ) ( not ( = ?auto_364955 ?auto_364952 ) ) ( not ( = ?auto_364955 ?auto_364961 ) ) ( not ( = ?auto_364956 ?auto_364953 ) ) ( CALIBRATION_TARGET ?auto_364959 ?auto_364961 ) ( POWER_AVAIL ?auto_364960 ) ( POINTING ?auto_364960 ?auto_364954 ) ( not ( = ?auto_364961 ?auto_364954 ) ) ( not ( = ?auto_364952 ?auto_364954 ) ) ( not ( = ?auto_364955 ?auto_364954 ) ) ( HAVE_IMAGE ?auto_364954 ?auto_364951 ) ( HAVE_IMAGE ?auto_364957 ?auto_364958 ) ( not ( = ?auto_364952 ?auto_364957 ) ) ( not ( = ?auto_364953 ?auto_364951 ) ) ( not ( = ?auto_364953 ?auto_364958 ) ) ( not ( = ?auto_364954 ?auto_364957 ) ) ( not ( = ?auto_364951 ?auto_364956 ) ) ( not ( = ?auto_364951 ?auto_364958 ) ) ( not ( = ?auto_364955 ?auto_364957 ) ) ( not ( = ?auto_364956 ?auto_364958 ) ) ( not ( = ?auto_364957 ?auto_364961 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364955 ?auto_364956 ?auto_364952 ?auto_364953 )
      ( GET-4IMAGE-VERIFY ?auto_364952 ?auto_364953 ?auto_364954 ?auto_364951 ?auto_364955 ?auto_364956 ?auto_364957 ?auto_364958 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_364985 - DIRECTION
      ?auto_364986 - MODE
      ?auto_364987 - DIRECTION
      ?auto_364984 - MODE
      ?auto_364988 - DIRECTION
      ?auto_364989 - MODE
      ?auto_364990 - DIRECTION
      ?auto_364991 - MODE
    )
    :vars
    (
      ?auto_364992 - INSTRUMENT
      ?auto_364993 - SATELLITE
      ?auto_364995 - DIRECTION
      ?auto_364996 - DIRECTION
      ?auto_364994 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_364992 ?auto_364993 ) ( SUPPORTS ?auto_364992 ?auto_364986 ) ( not ( = ?auto_364985 ?auto_364995 ) ) ( HAVE_IMAGE ?auto_364996 ?auto_364994 ) ( not ( = ?auto_364996 ?auto_364985 ) ) ( not ( = ?auto_364996 ?auto_364995 ) ) ( not ( = ?auto_364994 ?auto_364986 ) ) ( CALIBRATION_TARGET ?auto_364992 ?auto_364995 ) ( POWER_AVAIL ?auto_364993 ) ( POINTING ?auto_364993 ?auto_364987 ) ( not ( = ?auto_364995 ?auto_364987 ) ) ( not ( = ?auto_364985 ?auto_364987 ) ) ( not ( = ?auto_364996 ?auto_364987 ) ) ( HAVE_IMAGE ?auto_364987 ?auto_364984 ) ( HAVE_IMAGE ?auto_364988 ?auto_364989 ) ( HAVE_IMAGE ?auto_364990 ?auto_364991 ) ( not ( = ?auto_364985 ?auto_364988 ) ) ( not ( = ?auto_364985 ?auto_364990 ) ) ( not ( = ?auto_364986 ?auto_364984 ) ) ( not ( = ?auto_364986 ?auto_364989 ) ) ( not ( = ?auto_364986 ?auto_364991 ) ) ( not ( = ?auto_364987 ?auto_364988 ) ) ( not ( = ?auto_364987 ?auto_364990 ) ) ( not ( = ?auto_364984 ?auto_364989 ) ) ( not ( = ?auto_364984 ?auto_364991 ) ) ( not ( = ?auto_364984 ?auto_364994 ) ) ( not ( = ?auto_364988 ?auto_364990 ) ) ( not ( = ?auto_364988 ?auto_364995 ) ) ( not ( = ?auto_364988 ?auto_364996 ) ) ( not ( = ?auto_364989 ?auto_364991 ) ) ( not ( = ?auto_364989 ?auto_364994 ) ) ( not ( = ?auto_364990 ?auto_364995 ) ) ( not ( = ?auto_364990 ?auto_364996 ) ) ( not ( = ?auto_364991 ?auto_364994 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_364996 ?auto_364994 ?auto_364985 ?auto_364986 )
      ( GET-4IMAGE-VERIFY ?auto_364985 ?auto_364986 ?auto_364987 ?auto_364984 ?auto_364988 ?auto_364989 ?auto_364990 ?auto_364991 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_365158 - DIRECTION
      ?auto_365159 - MODE
    )
    :vars
    (
      ?auto_365161 - INSTRUMENT
      ?auto_365162 - SATELLITE
      ?auto_365164 - DIRECTION
      ?auto_365165 - DIRECTION
      ?auto_365163 - MODE
      ?auto_365160 - DIRECTION
      ?auto_365166 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365161 ?auto_365162 ) ( SUPPORTS ?auto_365161 ?auto_365159 ) ( not ( = ?auto_365158 ?auto_365164 ) ) ( HAVE_IMAGE ?auto_365165 ?auto_365163 ) ( not ( = ?auto_365165 ?auto_365158 ) ) ( not ( = ?auto_365165 ?auto_365164 ) ) ( not ( = ?auto_365163 ?auto_365159 ) ) ( CALIBRATION_TARGET ?auto_365161 ?auto_365164 ) ( POINTING ?auto_365162 ?auto_365160 ) ( not ( = ?auto_365164 ?auto_365160 ) ) ( not ( = ?auto_365158 ?auto_365160 ) ) ( not ( = ?auto_365165 ?auto_365160 ) ) ( ON_BOARD ?auto_365166 ?auto_365162 ) ( POWER_ON ?auto_365166 ) ( not ( = ?auto_365161 ?auto_365166 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_365166 ?auto_365162 )
      ( GET-2IMAGE ?auto_365165 ?auto_365163 ?auto_365158 ?auto_365159 )
      ( GET-1IMAGE-VERIFY ?auto_365158 ?auto_365159 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_365168 - DIRECTION
      ?auto_365169 - MODE
      ?auto_365170 - DIRECTION
      ?auto_365167 - MODE
    )
    :vars
    (
      ?auto_365172 - INSTRUMENT
      ?auto_365175 - SATELLITE
      ?auto_365173 - DIRECTION
      ?auto_365171 - DIRECTION
      ?auto_365174 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365172 ?auto_365175 ) ( SUPPORTS ?auto_365172 ?auto_365167 ) ( not ( = ?auto_365170 ?auto_365173 ) ) ( HAVE_IMAGE ?auto_365168 ?auto_365169 ) ( not ( = ?auto_365168 ?auto_365170 ) ) ( not ( = ?auto_365168 ?auto_365173 ) ) ( not ( = ?auto_365169 ?auto_365167 ) ) ( CALIBRATION_TARGET ?auto_365172 ?auto_365173 ) ( POINTING ?auto_365175 ?auto_365171 ) ( not ( = ?auto_365173 ?auto_365171 ) ) ( not ( = ?auto_365170 ?auto_365171 ) ) ( not ( = ?auto_365168 ?auto_365171 ) ) ( ON_BOARD ?auto_365174 ?auto_365175 ) ( POWER_ON ?auto_365174 ) ( not ( = ?auto_365172 ?auto_365174 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_365170 ?auto_365167 )
      ( GET-2IMAGE-VERIFY ?auto_365168 ?auto_365169 ?auto_365170 ?auto_365167 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_365177 - DIRECTION
      ?auto_365178 - MODE
      ?auto_365179 - DIRECTION
      ?auto_365176 - MODE
    )
    :vars
    (
      ?auto_365184 - INSTRUMENT
      ?auto_365183 - SATELLITE
      ?auto_365181 - DIRECTION
      ?auto_365185 - DIRECTION
      ?auto_365182 - MODE
      ?auto_365180 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365184 ?auto_365183 ) ( SUPPORTS ?auto_365184 ?auto_365176 ) ( not ( = ?auto_365179 ?auto_365181 ) ) ( HAVE_IMAGE ?auto_365185 ?auto_365182 ) ( not ( = ?auto_365185 ?auto_365179 ) ) ( not ( = ?auto_365185 ?auto_365181 ) ) ( not ( = ?auto_365182 ?auto_365176 ) ) ( CALIBRATION_TARGET ?auto_365184 ?auto_365181 ) ( POINTING ?auto_365183 ?auto_365177 ) ( not ( = ?auto_365181 ?auto_365177 ) ) ( not ( = ?auto_365179 ?auto_365177 ) ) ( not ( = ?auto_365185 ?auto_365177 ) ) ( ON_BOARD ?auto_365180 ?auto_365183 ) ( POWER_ON ?auto_365180 ) ( not ( = ?auto_365184 ?auto_365180 ) ) ( HAVE_IMAGE ?auto_365177 ?auto_365178 ) ( not ( = ?auto_365178 ?auto_365176 ) ) ( not ( = ?auto_365178 ?auto_365182 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365185 ?auto_365182 ?auto_365179 ?auto_365176 )
      ( GET-2IMAGE-VERIFY ?auto_365177 ?auto_365178 ?auto_365179 ?auto_365176 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_365187 - DIRECTION
      ?auto_365188 - MODE
      ?auto_365189 - DIRECTION
      ?auto_365186 - MODE
    )
    :vars
    (
      ?auto_365194 - INSTRUMENT
      ?auto_365193 - SATELLITE
      ?auto_365191 - DIRECTION
      ?auto_365192 - DIRECTION
      ?auto_365190 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365194 ?auto_365193 ) ( SUPPORTS ?auto_365194 ?auto_365188 ) ( not ( = ?auto_365187 ?auto_365191 ) ) ( HAVE_IMAGE ?auto_365189 ?auto_365186 ) ( not ( = ?auto_365189 ?auto_365187 ) ) ( not ( = ?auto_365189 ?auto_365191 ) ) ( not ( = ?auto_365186 ?auto_365188 ) ) ( CALIBRATION_TARGET ?auto_365194 ?auto_365191 ) ( POINTING ?auto_365193 ?auto_365192 ) ( not ( = ?auto_365191 ?auto_365192 ) ) ( not ( = ?auto_365187 ?auto_365192 ) ) ( not ( = ?auto_365189 ?auto_365192 ) ) ( ON_BOARD ?auto_365190 ?auto_365193 ) ( POWER_ON ?auto_365190 ) ( not ( = ?auto_365194 ?auto_365190 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365189 ?auto_365186 ?auto_365187 ?auto_365188 )
      ( GET-2IMAGE-VERIFY ?auto_365187 ?auto_365188 ?auto_365189 ?auto_365186 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_365196 - DIRECTION
      ?auto_365197 - MODE
      ?auto_365198 - DIRECTION
      ?auto_365195 - MODE
    )
    :vars
    (
      ?auto_365203 - INSTRUMENT
      ?auto_365202 - SATELLITE
      ?auto_365200 - DIRECTION
      ?auto_365204 - DIRECTION
      ?auto_365201 - MODE
      ?auto_365199 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365203 ?auto_365202 ) ( SUPPORTS ?auto_365203 ?auto_365197 ) ( not ( = ?auto_365196 ?auto_365200 ) ) ( HAVE_IMAGE ?auto_365204 ?auto_365201 ) ( not ( = ?auto_365204 ?auto_365196 ) ) ( not ( = ?auto_365204 ?auto_365200 ) ) ( not ( = ?auto_365201 ?auto_365197 ) ) ( CALIBRATION_TARGET ?auto_365203 ?auto_365200 ) ( POINTING ?auto_365202 ?auto_365198 ) ( not ( = ?auto_365200 ?auto_365198 ) ) ( not ( = ?auto_365196 ?auto_365198 ) ) ( not ( = ?auto_365204 ?auto_365198 ) ) ( ON_BOARD ?auto_365199 ?auto_365202 ) ( POWER_ON ?auto_365199 ) ( not ( = ?auto_365203 ?auto_365199 ) ) ( HAVE_IMAGE ?auto_365198 ?auto_365195 ) ( not ( = ?auto_365197 ?auto_365195 ) ) ( not ( = ?auto_365195 ?auto_365201 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365204 ?auto_365201 ?auto_365196 ?auto_365197 )
      ( GET-2IMAGE-VERIFY ?auto_365196 ?auto_365197 ?auto_365198 ?auto_365195 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365217 - DIRECTION
      ?auto_365218 - MODE
      ?auto_365219 - DIRECTION
      ?auto_365216 - MODE
      ?auto_365220 - DIRECTION
      ?auto_365221 - MODE
    )
    :vars
    (
      ?auto_365226 - INSTRUMENT
      ?auto_365225 - SATELLITE
      ?auto_365223 - DIRECTION
      ?auto_365224 - DIRECTION
      ?auto_365222 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365226 ?auto_365225 ) ( SUPPORTS ?auto_365226 ?auto_365221 ) ( not ( = ?auto_365220 ?auto_365223 ) ) ( HAVE_IMAGE ?auto_365217 ?auto_365216 ) ( not ( = ?auto_365217 ?auto_365220 ) ) ( not ( = ?auto_365217 ?auto_365223 ) ) ( not ( = ?auto_365216 ?auto_365221 ) ) ( CALIBRATION_TARGET ?auto_365226 ?auto_365223 ) ( POINTING ?auto_365225 ?auto_365224 ) ( not ( = ?auto_365223 ?auto_365224 ) ) ( not ( = ?auto_365220 ?auto_365224 ) ) ( not ( = ?auto_365217 ?auto_365224 ) ) ( ON_BOARD ?auto_365222 ?auto_365225 ) ( POWER_ON ?auto_365222 ) ( not ( = ?auto_365226 ?auto_365222 ) ) ( HAVE_IMAGE ?auto_365217 ?auto_365218 ) ( HAVE_IMAGE ?auto_365219 ?auto_365216 ) ( not ( = ?auto_365217 ?auto_365219 ) ) ( not ( = ?auto_365218 ?auto_365216 ) ) ( not ( = ?auto_365218 ?auto_365221 ) ) ( not ( = ?auto_365219 ?auto_365220 ) ) ( not ( = ?auto_365219 ?auto_365223 ) ) ( not ( = ?auto_365219 ?auto_365224 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365217 ?auto_365216 ?auto_365220 ?auto_365221 )
      ( GET-3IMAGE-VERIFY ?auto_365217 ?auto_365218 ?auto_365219 ?auto_365216 ?auto_365220 ?auto_365221 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365228 - DIRECTION
      ?auto_365229 - MODE
      ?auto_365230 - DIRECTION
      ?auto_365227 - MODE
      ?auto_365231 - DIRECTION
      ?auto_365232 - MODE
    )
    :vars
    (
      ?auto_365236 - INSTRUMENT
      ?auto_365235 - SATELLITE
      ?auto_365234 - DIRECTION
      ?auto_365233 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365236 ?auto_365235 ) ( SUPPORTS ?auto_365236 ?auto_365232 ) ( not ( = ?auto_365231 ?auto_365234 ) ) ( HAVE_IMAGE ?auto_365228 ?auto_365229 ) ( not ( = ?auto_365228 ?auto_365231 ) ) ( not ( = ?auto_365228 ?auto_365234 ) ) ( not ( = ?auto_365229 ?auto_365232 ) ) ( CALIBRATION_TARGET ?auto_365236 ?auto_365234 ) ( POINTING ?auto_365235 ?auto_365230 ) ( not ( = ?auto_365234 ?auto_365230 ) ) ( not ( = ?auto_365231 ?auto_365230 ) ) ( not ( = ?auto_365228 ?auto_365230 ) ) ( ON_BOARD ?auto_365233 ?auto_365235 ) ( POWER_ON ?auto_365233 ) ( not ( = ?auto_365236 ?auto_365233 ) ) ( HAVE_IMAGE ?auto_365230 ?auto_365227 ) ( not ( = ?auto_365229 ?auto_365227 ) ) ( not ( = ?auto_365227 ?auto_365232 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365228 ?auto_365229 ?auto_365231 ?auto_365232 )
      ( GET-3IMAGE-VERIFY ?auto_365228 ?auto_365229 ?auto_365230 ?auto_365227 ?auto_365231 ?auto_365232 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365238 - DIRECTION
      ?auto_365239 - MODE
      ?auto_365240 - DIRECTION
      ?auto_365237 - MODE
      ?auto_365241 - DIRECTION
      ?auto_365242 - MODE
    )
    :vars
    (
      ?auto_365247 - INSTRUMENT
      ?auto_365246 - SATELLITE
      ?auto_365244 - DIRECTION
      ?auto_365245 - DIRECTION
      ?auto_365243 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365247 ?auto_365246 ) ( SUPPORTS ?auto_365247 ?auto_365237 ) ( not ( = ?auto_365240 ?auto_365244 ) ) ( HAVE_IMAGE ?auto_365241 ?auto_365242 ) ( not ( = ?auto_365241 ?auto_365240 ) ) ( not ( = ?auto_365241 ?auto_365244 ) ) ( not ( = ?auto_365242 ?auto_365237 ) ) ( CALIBRATION_TARGET ?auto_365247 ?auto_365244 ) ( POINTING ?auto_365246 ?auto_365245 ) ( not ( = ?auto_365244 ?auto_365245 ) ) ( not ( = ?auto_365240 ?auto_365245 ) ) ( not ( = ?auto_365241 ?auto_365245 ) ) ( ON_BOARD ?auto_365243 ?auto_365246 ) ( POWER_ON ?auto_365243 ) ( not ( = ?auto_365247 ?auto_365243 ) ) ( HAVE_IMAGE ?auto_365238 ?auto_365239 ) ( not ( = ?auto_365238 ?auto_365240 ) ) ( not ( = ?auto_365238 ?auto_365241 ) ) ( not ( = ?auto_365238 ?auto_365244 ) ) ( not ( = ?auto_365238 ?auto_365245 ) ) ( not ( = ?auto_365239 ?auto_365237 ) ) ( not ( = ?auto_365239 ?auto_365242 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365241 ?auto_365242 ?auto_365240 ?auto_365237 )
      ( GET-3IMAGE-VERIFY ?auto_365238 ?auto_365239 ?auto_365240 ?auto_365237 ?auto_365241 ?auto_365242 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365249 - DIRECTION
      ?auto_365250 - MODE
      ?auto_365251 - DIRECTION
      ?auto_365248 - MODE
      ?auto_365252 - DIRECTION
      ?auto_365253 - MODE
    )
    :vars
    (
      ?auto_365257 - INSTRUMENT
      ?auto_365256 - SATELLITE
      ?auto_365255 - DIRECTION
      ?auto_365254 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365257 ?auto_365256 ) ( SUPPORTS ?auto_365257 ?auto_365248 ) ( not ( = ?auto_365251 ?auto_365255 ) ) ( HAVE_IMAGE ?auto_365249 ?auto_365250 ) ( not ( = ?auto_365249 ?auto_365251 ) ) ( not ( = ?auto_365249 ?auto_365255 ) ) ( not ( = ?auto_365250 ?auto_365248 ) ) ( CALIBRATION_TARGET ?auto_365257 ?auto_365255 ) ( POINTING ?auto_365256 ?auto_365252 ) ( not ( = ?auto_365255 ?auto_365252 ) ) ( not ( = ?auto_365251 ?auto_365252 ) ) ( not ( = ?auto_365249 ?auto_365252 ) ) ( ON_BOARD ?auto_365254 ?auto_365256 ) ( POWER_ON ?auto_365254 ) ( not ( = ?auto_365257 ?auto_365254 ) ) ( HAVE_IMAGE ?auto_365252 ?auto_365253 ) ( not ( = ?auto_365250 ?auto_365253 ) ) ( not ( = ?auto_365248 ?auto_365253 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365249 ?auto_365250 ?auto_365251 ?auto_365248 )
      ( GET-3IMAGE-VERIFY ?auto_365249 ?auto_365250 ?auto_365251 ?auto_365248 ?auto_365252 ?auto_365253 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365270 - DIRECTION
      ?auto_365271 - MODE
      ?auto_365272 - DIRECTION
      ?auto_365269 - MODE
      ?auto_365273 - DIRECTION
      ?auto_365274 - MODE
    )
    :vars
    (
      ?auto_365278 - INSTRUMENT
      ?auto_365277 - SATELLITE
      ?auto_365276 - DIRECTION
      ?auto_365275 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365278 ?auto_365277 ) ( SUPPORTS ?auto_365278 ?auto_365274 ) ( not ( = ?auto_365273 ?auto_365276 ) ) ( HAVE_IMAGE ?auto_365272 ?auto_365269 ) ( not ( = ?auto_365272 ?auto_365273 ) ) ( not ( = ?auto_365272 ?auto_365276 ) ) ( not ( = ?auto_365269 ?auto_365274 ) ) ( CALIBRATION_TARGET ?auto_365278 ?auto_365276 ) ( POINTING ?auto_365277 ?auto_365270 ) ( not ( = ?auto_365276 ?auto_365270 ) ) ( not ( = ?auto_365273 ?auto_365270 ) ) ( not ( = ?auto_365272 ?auto_365270 ) ) ( ON_BOARD ?auto_365275 ?auto_365277 ) ( POWER_ON ?auto_365275 ) ( not ( = ?auto_365278 ?auto_365275 ) ) ( HAVE_IMAGE ?auto_365270 ?auto_365271 ) ( not ( = ?auto_365271 ?auto_365269 ) ) ( not ( = ?auto_365271 ?auto_365274 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365272 ?auto_365269 ?auto_365273 ?auto_365274 )
      ( GET-3IMAGE-VERIFY ?auto_365270 ?auto_365271 ?auto_365272 ?auto_365269 ?auto_365273 ?auto_365274 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365280 - DIRECTION
      ?auto_365281 - MODE
      ?auto_365282 - DIRECTION
      ?auto_365279 - MODE
      ?auto_365283 - DIRECTION
      ?auto_365284 - MODE
    )
    :vars
    (
      ?auto_365289 - INSTRUMENT
      ?auto_365288 - SATELLITE
      ?auto_365286 - DIRECTION
      ?auto_365290 - DIRECTION
      ?auto_365287 - MODE
      ?auto_365285 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365289 ?auto_365288 ) ( SUPPORTS ?auto_365289 ?auto_365284 ) ( not ( = ?auto_365283 ?auto_365286 ) ) ( HAVE_IMAGE ?auto_365290 ?auto_365287 ) ( not ( = ?auto_365290 ?auto_365283 ) ) ( not ( = ?auto_365290 ?auto_365286 ) ) ( not ( = ?auto_365287 ?auto_365284 ) ) ( CALIBRATION_TARGET ?auto_365289 ?auto_365286 ) ( POINTING ?auto_365288 ?auto_365282 ) ( not ( = ?auto_365286 ?auto_365282 ) ) ( not ( = ?auto_365283 ?auto_365282 ) ) ( not ( = ?auto_365290 ?auto_365282 ) ) ( ON_BOARD ?auto_365285 ?auto_365288 ) ( POWER_ON ?auto_365285 ) ( not ( = ?auto_365289 ?auto_365285 ) ) ( HAVE_IMAGE ?auto_365280 ?auto_365281 ) ( HAVE_IMAGE ?auto_365282 ?auto_365279 ) ( not ( = ?auto_365280 ?auto_365282 ) ) ( not ( = ?auto_365280 ?auto_365283 ) ) ( not ( = ?auto_365280 ?auto_365286 ) ) ( not ( = ?auto_365280 ?auto_365290 ) ) ( not ( = ?auto_365281 ?auto_365279 ) ) ( not ( = ?auto_365281 ?auto_365284 ) ) ( not ( = ?auto_365281 ?auto_365287 ) ) ( not ( = ?auto_365279 ?auto_365284 ) ) ( not ( = ?auto_365279 ?auto_365287 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365290 ?auto_365287 ?auto_365283 ?auto_365284 )
      ( GET-3IMAGE-VERIFY ?auto_365280 ?auto_365281 ?auto_365282 ?auto_365279 ?auto_365283 ?auto_365284 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365292 - DIRECTION
      ?auto_365293 - MODE
      ?auto_365294 - DIRECTION
      ?auto_365291 - MODE
      ?auto_365295 - DIRECTION
      ?auto_365296 - MODE
    )
    :vars
    (
      ?auto_365300 - INSTRUMENT
      ?auto_365299 - SATELLITE
      ?auto_365298 - DIRECTION
      ?auto_365297 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365300 ?auto_365299 ) ( SUPPORTS ?auto_365300 ?auto_365291 ) ( not ( = ?auto_365294 ?auto_365298 ) ) ( HAVE_IMAGE ?auto_365295 ?auto_365296 ) ( not ( = ?auto_365295 ?auto_365294 ) ) ( not ( = ?auto_365295 ?auto_365298 ) ) ( not ( = ?auto_365296 ?auto_365291 ) ) ( CALIBRATION_TARGET ?auto_365300 ?auto_365298 ) ( POINTING ?auto_365299 ?auto_365292 ) ( not ( = ?auto_365298 ?auto_365292 ) ) ( not ( = ?auto_365294 ?auto_365292 ) ) ( not ( = ?auto_365295 ?auto_365292 ) ) ( ON_BOARD ?auto_365297 ?auto_365299 ) ( POWER_ON ?auto_365297 ) ( not ( = ?auto_365300 ?auto_365297 ) ) ( HAVE_IMAGE ?auto_365292 ?auto_365293 ) ( not ( = ?auto_365293 ?auto_365291 ) ) ( not ( = ?auto_365293 ?auto_365296 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365295 ?auto_365296 ?auto_365294 ?auto_365291 )
      ( GET-3IMAGE-VERIFY ?auto_365292 ?auto_365293 ?auto_365294 ?auto_365291 ?auto_365295 ?auto_365296 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365302 - DIRECTION
      ?auto_365303 - MODE
      ?auto_365304 - DIRECTION
      ?auto_365301 - MODE
      ?auto_365305 - DIRECTION
      ?auto_365306 - MODE
    )
    :vars
    (
      ?auto_365311 - INSTRUMENT
      ?auto_365310 - SATELLITE
      ?auto_365308 - DIRECTION
      ?auto_365312 - DIRECTION
      ?auto_365309 - MODE
      ?auto_365307 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365311 ?auto_365310 ) ( SUPPORTS ?auto_365311 ?auto_365301 ) ( not ( = ?auto_365304 ?auto_365308 ) ) ( HAVE_IMAGE ?auto_365312 ?auto_365309 ) ( not ( = ?auto_365312 ?auto_365304 ) ) ( not ( = ?auto_365312 ?auto_365308 ) ) ( not ( = ?auto_365309 ?auto_365301 ) ) ( CALIBRATION_TARGET ?auto_365311 ?auto_365308 ) ( POINTING ?auto_365310 ?auto_365302 ) ( not ( = ?auto_365308 ?auto_365302 ) ) ( not ( = ?auto_365304 ?auto_365302 ) ) ( not ( = ?auto_365312 ?auto_365302 ) ) ( ON_BOARD ?auto_365307 ?auto_365310 ) ( POWER_ON ?auto_365307 ) ( not ( = ?auto_365311 ?auto_365307 ) ) ( HAVE_IMAGE ?auto_365302 ?auto_365303 ) ( HAVE_IMAGE ?auto_365305 ?auto_365306 ) ( not ( = ?auto_365302 ?auto_365305 ) ) ( not ( = ?auto_365303 ?auto_365301 ) ) ( not ( = ?auto_365303 ?auto_365306 ) ) ( not ( = ?auto_365303 ?auto_365309 ) ) ( not ( = ?auto_365304 ?auto_365305 ) ) ( not ( = ?auto_365301 ?auto_365306 ) ) ( not ( = ?auto_365305 ?auto_365308 ) ) ( not ( = ?auto_365305 ?auto_365312 ) ) ( not ( = ?auto_365306 ?auto_365309 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365312 ?auto_365309 ?auto_365304 ?auto_365301 )
      ( GET-3IMAGE-VERIFY ?auto_365302 ?auto_365303 ?auto_365304 ?auto_365301 ?auto_365305 ?auto_365306 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365326 - DIRECTION
      ?auto_365327 - MODE
      ?auto_365328 - DIRECTION
      ?auto_365325 - MODE
      ?auto_365329 - DIRECTION
      ?auto_365330 - MODE
    )
    :vars
    (
      ?auto_365335 - INSTRUMENT
      ?auto_365334 - SATELLITE
      ?auto_365332 - DIRECTION
      ?auto_365333 - DIRECTION
      ?auto_365331 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365335 ?auto_365334 ) ( SUPPORTS ?auto_365335 ?auto_365327 ) ( not ( = ?auto_365326 ?auto_365332 ) ) ( HAVE_IMAGE ?auto_365328 ?auto_365325 ) ( not ( = ?auto_365328 ?auto_365326 ) ) ( not ( = ?auto_365328 ?auto_365332 ) ) ( not ( = ?auto_365325 ?auto_365327 ) ) ( CALIBRATION_TARGET ?auto_365335 ?auto_365332 ) ( POINTING ?auto_365334 ?auto_365333 ) ( not ( = ?auto_365332 ?auto_365333 ) ) ( not ( = ?auto_365326 ?auto_365333 ) ) ( not ( = ?auto_365328 ?auto_365333 ) ) ( ON_BOARD ?auto_365331 ?auto_365334 ) ( POWER_ON ?auto_365331 ) ( not ( = ?auto_365335 ?auto_365331 ) ) ( HAVE_IMAGE ?auto_365329 ?auto_365330 ) ( not ( = ?auto_365326 ?auto_365329 ) ) ( not ( = ?auto_365327 ?auto_365330 ) ) ( not ( = ?auto_365328 ?auto_365329 ) ) ( not ( = ?auto_365325 ?auto_365330 ) ) ( not ( = ?auto_365329 ?auto_365332 ) ) ( not ( = ?auto_365329 ?auto_365333 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365328 ?auto_365325 ?auto_365326 ?auto_365327 )
      ( GET-3IMAGE-VERIFY ?auto_365326 ?auto_365327 ?auto_365328 ?auto_365325 ?auto_365329 ?auto_365330 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365337 - DIRECTION
      ?auto_365338 - MODE
      ?auto_365339 - DIRECTION
      ?auto_365336 - MODE
      ?auto_365340 - DIRECTION
      ?auto_365341 - MODE
    )
    :vars
    (
      ?auto_365345 - INSTRUMENT
      ?auto_365344 - SATELLITE
      ?auto_365343 - DIRECTION
      ?auto_365342 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365345 ?auto_365344 ) ( SUPPORTS ?auto_365345 ?auto_365338 ) ( not ( = ?auto_365337 ?auto_365343 ) ) ( HAVE_IMAGE ?auto_365339 ?auto_365336 ) ( not ( = ?auto_365339 ?auto_365337 ) ) ( not ( = ?auto_365339 ?auto_365343 ) ) ( not ( = ?auto_365336 ?auto_365338 ) ) ( CALIBRATION_TARGET ?auto_365345 ?auto_365343 ) ( POINTING ?auto_365344 ?auto_365340 ) ( not ( = ?auto_365343 ?auto_365340 ) ) ( not ( = ?auto_365337 ?auto_365340 ) ) ( not ( = ?auto_365339 ?auto_365340 ) ) ( ON_BOARD ?auto_365342 ?auto_365344 ) ( POWER_ON ?auto_365342 ) ( not ( = ?auto_365345 ?auto_365342 ) ) ( HAVE_IMAGE ?auto_365340 ?auto_365341 ) ( not ( = ?auto_365338 ?auto_365341 ) ) ( not ( = ?auto_365336 ?auto_365341 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365339 ?auto_365336 ?auto_365337 ?auto_365338 )
      ( GET-3IMAGE-VERIFY ?auto_365337 ?auto_365338 ?auto_365339 ?auto_365336 ?auto_365340 ?auto_365341 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365358 - DIRECTION
      ?auto_365359 - MODE
      ?auto_365360 - DIRECTION
      ?auto_365357 - MODE
      ?auto_365361 - DIRECTION
      ?auto_365362 - MODE
    )
    :vars
    (
      ?auto_365366 - INSTRUMENT
      ?auto_365365 - SATELLITE
      ?auto_365364 - DIRECTION
      ?auto_365363 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365366 ?auto_365365 ) ( SUPPORTS ?auto_365366 ?auto_365359 ) ( not ( = ?auto_365358 ?auto_365364 ) ) ( HAVE_IMAGE ?auto_365361 ?auto_365362 ) ( not ( = ?auto_365361 ?auto_365358 ) ) ( not ( = ?auto_365361 ?auto_365364 ) ) ( not ( = ?auto_365362 ?auto_365359 ) ) ( CALIBRATION_TARGET ?auto_365366 ?auto_365364 ) ( POINTING ?auto_365365 ?auto_365360 ) ( not ( = ?auto_365364 ?auto_365360 ) ) ( not ( = ?auto_365358 ?auto_365360 ) ) ( not ( = ?auto_365361 ?auto_365360 ) ) ( ON_BOARD ?auto_365363 ?auto_365365 ) ( POWER_ON ?auto_365363 ) ( not ( = ?auto_365366 ?auto_365363 ) ) ( HAVE_IMAGE ?auto_365360 ?auto_365357 ) ( not ( = ?auto_365359 ?auto_365357 ) ) ( not ( = ?auto_365357 ?auto_365362 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365361 ?auto_365362 ?auto_365358 ?auto_365359 )
      ( GET-3IMAGE-VERIFY ?auto_365358 ?auto_365359 ?auto_365360 ?auto_365357 ?auto_365361 ?auto_365362 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_365368 - DIRECTION
      ?auto_365369 - MODE
      ?auto_365370 - DIRECTION
      ?auto_365367 - MODE
      ?auto_365371 - DIRECTION
      ?auto_365372 - MODE
    )
    :vars
    (
      ?auto_365377 - INSTRUMENT
      ?auto_365376 - SATELLITE
      ?auto_365374 - DIRECTION
      ?auto_365378 - DIRECTION
      ?auto_365375 - MODE
      ?auto_365373 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365377 ?auto_365376 ) ( SUPPORTS ?auto_365377 ?auto_365369 ) ( not ( = ?auto_365368 ?auto_365374 ) ) ( HAVE_IMAGE ?auto_365378 ?auto_365375 ) ( not ( = ?auto_365378 ?auto_365368 ) ) ( not ( = ?auto_365378 ?auto_365374 ) ) ( not ( = ?auto_365375 ?auto_365369 ) ) ( CALIBRATION_TARGET ?auto_365377 ?auto_365374 ) ( POINTING ?auto_365376 ?auto_365371 ) ( not ( = ?auto_365374 ?auto_365371 ) ) ( not ( = ?auto_365368 ?auto_365371 ) ) ( not ( = ?auto_365378 ?auto_365371 ) ) ( ON_BOARD ?auto_365373 ?auto_365376 ) ( POWER_ON ?auto_365373 ) ( not ( = ?auto_365377 ?auto_365373 ) ) ( HAVE_IMAGE ?auto_365370 ?auto_365367 ) ( HAVE_IMAGE ?auto_365371 ?auto_365372 ) ( not ( = ?auto_365368 ?auto_365370 ) ) ( not ( = ?auto_365369 ?auto_365367 ) ) ( not ( = ?auto_365369 ?auto_365372 ) ) ( not ( = ?auto_365370 ?auto_365371 ) ) ( not ( = ?auto_365370 ?auto_365374 ) ) ( not ( = ?auto_365370 ?auto_365378 ) ) ( not ( = ?auto_365367 ?auto_365372 ) ) ( not ( = ?auto_365367 ?auto_365375 ) ) ( not ( = ?auto_365372 ?auto_365375 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365378 ?auto_365375 ?auto_365368 ?auto_365369 )
      ( GET-3IMAGE-VERIFY ?auto_365368 ?auto_365369 ?auto_365370 ?auto_365367 ?auto_365371 ?auto_365372 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365428 - DIRECTION
      ?auto_365429 - MODE
      ?auto_365430 - DIRECTION
      ?auto_365427 - MODE
      ?auto_365431 - DIRECTION
      ?auto_365432 - MODE
      ?auto_365433 - DIRECTION
      ?auto_365434 - MODE
    )
    :vars
    (
      ?auto_365439 - INSTRUMENT
      ?auto_365438 - SATELLITE
      ?auto_365436 - DIRECTION
      ?auto_365437 - DIRECTION
      ?auto_365435 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365439 ?auto_365438 ) ( SUPPORTS ?auto_365439 ?auto_365434 ) ( not ( = ?auto_365433 ?auto_365436 ) ) ( HAVE_IMAGE ?auto_365428 ?auto_365429 ) ( not ( = ?auto_365428 ?auto_365433 ) ) ( not ( = ?auto_365428 ?auto_365436 ) ) ( not ( = ?auto_365429 ?auto_365434 ) ) ( CALIBRATION_TARGET ?auto_365439 ?auto_365436 ) ( POINTING ?auto_365438 ?auto_365437 ) ( not ( = ?auto_365436 ?auto_365437 ) ) ( not ( = ?auto_365433 ?auto_365437 ) ) ( not ( = ?auto_365428 ?auto_365437 ) ) ( ON_BOARD ?auto_365435 ?auto_365438 ) ( POWER_ON ?auto_365435 ) ( not ( = ?auto_365439 ?auto_365435 ) ) ( HAVE_IMAGE ?auto_365430 ?auto_365427 ) ( HAVE_IMAGE ?auto_365431 ?auto_365432 ) ( not ( = ?auto_365428 ?auto_365430 ) ) ( not ( = ?auto_365428 ?auto_365431 ) ) ( not ( = ?auto_365429 ?auto_365427 ) ) ( not ( = ?auto_365429 ?auto_365432 ) ) ( not ( = ?auto_365430 ?auto_365431 ) ) ( not ( = ?auto_365430 ?auto_365433 ) ) ( not ( = ?auto_365430 ?auto_365436 ) ) ( not ( = ?auto_365430 ?auto_365437 ) ) ( not ( = ?auto_365427 ?auto_365432 ) ) ( not ( = ?auto_365427 ?auto_365434 ) ) ( not ( = ?auto_365431 ?auto_365433 ) ) ( not ( = ?auto_365431 ?auto_365436 ) ) ( not ( = ?auto_365431 ?auto_365437 ) ) ( not ( = ?auto_365432 ?auto_365434 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365428 ?auto_365429 ?auto_365433 ?auto_365434 )
      ( GET-4IMAGE-VERIFY ?auto_365428 ?auto_365429 ?auto_365430 ?auto_365427 ?auto_365431 ?auto_365432 ?auto_365433 ?auto_365434 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365441 - DIRECTION
      ?auto_365442 - MODE
      ?auto_365443 - DIRECTION
      ?auto_365440 - MODE
      ?auto_365444 - DIRECTION
      ?auto_365445 - MODE
      ?auto_365446 - DIRECTION
      ?auto_365447 - MODE
    )
    :vars
    (
      ?auto_365451 - INSTRUMENT
      ?auto_365450 - SATELLITE
      ?auto_365449 - DIRECTION
      ?auto_365448 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365451 ?auto_365450 ) ( SUPPORTS ?auto_365451 ?auto_365447 ) ( not ( = ?auto_365446 ?auto_365449 ) ) ( HAVE_IMAGE ?auto_365443 ?auto_365442 ) ( not ( = ?auto_365443 ?auto_365446 ) ) ( not ( = ?auto_365443 ?auto_365449 ) ) ( not ( = ?auto_365442 ?auto_365447 ) ) ( CALIBRATION_TARGET ?auto_365451 ?auto_365449 ) ( POINTING ?auto_365450 ?auto_365444 ) ( not ( = ?auto_365449 ?auto_365444 ) ) ( not ( = ?auto_365446 ?auto_365444 ) ) ( not ( = ?auto_365443 ?auto_365444 ) ) ( ON_BOARD ?auto_365448 ?auto_365450 ) ( POWER_ON ?auto_365448 ) ( not ( = ?auto_365451 ?auto_365448 ) ) ( HAVE_IMAGE ?auto_365441 ?auto_365442 ) ( HAVE_IMAGE ?auto_365443 ?auto_365440 ) ( HAVE_IMAGE ?auto_365444 ?auto_365445 ) ( not ( = ?auto_365441 ?auto_365443 ) ) ( not ( = ?auto_365441 ?auto_365444 ) ) ( not ( = ?auto_365441 ?auto_365446 ) ) ( not ( = ?auto_365441 ?auto_365449 ) ) ( not ( = ?auto_365442 ?auto_365440 ) ) ( not ( = ?auto_365442 ?auto_365445 ) ) ( not ( = ?auto_365440 ?auto_365445 ) ) ( not ( = ?auto_365440 ?auto_365447 ) ) ( not ( = ?auto_365445 ?auto_365447 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365443 ?auto_365442 ?auto_365446 ?auto_365447 )
      ( GET-4IMAGE-VERIFY ?auto_365441 ?auto_365442 ?auto_365443 ?auto_365440 ?auto_365444 ?auto_365445 ?auto_365446 ?auto_365447 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365453 - DIRECTION
      ?auto_365454 - MODE
      ?auto_365455 - DIRECTION
      ?auto_365452 - MODE
      ?auto_365456 - DIRECTION
      ?auto_365457 - MODE
      ?auto_365458 - DIRECTION
      ?auto_365459 - MODE
    )
    :vars
    (
      ?auto_365464 - INSTRUMENT
      ?auto_365463 - SATELLITE
      ?auto_365461 - DIRECTION
      ?auto_365462 - DIRECTION
      ?auto_365460 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365464 ?auto_365463 ) ( SUPPORTS ?auto_365464 ?auto_365457 ) ( not ( = ?auto_365456 ?auto_365461 ) ) ( HAVE_IMAGE ?auto_365455 ?auto_365459 ) ( not ( = ?auto_365455 ?auto_365456 ) ) ( not ( = ?auto_365455 ?auto_365461 ) ) ( not ( = ?auto_365459 ?auto_365457 ) ) ( CALIBRATION_TARGET ?auto_365464 ?auto_365461 ) ( POINTING ?auto_365463 ?auto_365462 ) ( not ( = ?auto_365461 ?auto_365462 ) ) ( not ( = ?auto_365456 ?auto_365462 ) ) ( not ( = ?auto_365455 ?auto_365462 ) ) ( ON_BOARD ?auto_365460 ?auto_365463 ) ( POWER_ON ?auto_365460 ) ( not ( = ?auto_365464 ?auto_365460 ) ) ( HAVE_IMAGE ?auto_365453 ?auto_365454 ) ( HAVE_IMAGE ?auto_365455 ?auto_365452 ) ( HAVE_IMAGE ?auto_365458 ?auto_365459 ) ( not ( = ?auto_365453 ?auto_365455 ) ) ( not ( = ?auto_365453 ?auto_365456 ) ) ( not ( = ?auto_365453 ?auto_365458 ) ) ( not ( = ?auto_365453 ?auto_365461 ) ) ( not ( = ?auto_365453 ?auto_365462 ) ) ( not ( = ?auto_365454 ?auto_365452 ) ) ( not ( = ?auto_365454 ?auto_365457 ) ) ( not ( = ?auto_365454 ?auto_365459 ) ) ( not ( = ?auto_365455 ?auto_365458 ) ) ( not ( = ?auto_365452 ?auto_365457 ) ) ( not ( = ?auto_365452 ?auto_365459 ) ) ( not ( = ?auto_365456 ?auto_365458 ) ) ( not ( = ?auto_365458 ?auto_365461 ) ) ( not ( = ?auto_365458 ?auto_365462 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365455 ?auto_365459 ?auto_365456 ?auto_365457 )
      ( GET-4IMAGE-VERIFY ?auto_365453 ?auto_365454 ?auto_365455 ?auto_365452 ?auto_365456 ?auto_365457 ?auto_365458 ?auto_365459 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365466 - DIRECTION
      ?auto_365467 - MODE
      ?auto_365468 - DIRECTION
      ?auto_365465 - MODE
      ?auto_365469 - DIRECTION
      ?auto_365470 - MODE
      ?auto_365471 - DIRECTION
      ?auto_365472 - MODE
    )
    :vars
    (
      ?auto_365476 - INSTRUMENT
      ?auto_365475 - SATELLITE
      ?auto_365474 - DIRECTION
      ?auto_365473 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365476 ?auto_365475 ) ( SUPPORTS ?auto_365476 ?auto_365470 ) ( not ( = ?auto_365469 ?auto_365474 ) ) ( HAVE_IMAGE ?auto_365468 ?auto_365467 ) ( not ( = ?auto_365468 ?auto_365469 ) ) ( not ( = ?auto_365468 ?auto_365474 ) ) ( not ( = ?auto_365467 ?auto_365470 ) ) ( CALIBRATION_TARGET ?auto_365476 ?auto_365474 ) ( POINTING ?auto_365475 ?auto_365471 ) ( not ( = ?auto_365474 ?auto_365471 ) ) ( not ( = ?auto_365469 ?auto_365471 ) ) ( not ( = ?auto_365468 ?auto_365471 ) ) ( ON_BOARD ?auto_365473 ?auto_365475 ) ( POWER_ON ?auto_365473 ) ( not ( = ?auto_365476 ?auto_365473 ) ) ( HAVE_IMAGE ?auto_365466 ?auto_365467 ) ( HAVE_IMAGE ?auto_365468 ?auto_365465 ) ( HAVE_IMAGE ?auto_365471 ?auto_365472 ) ( not ( = ?auto_365466 ?auto_365468 ) ) ( not ( = ?auto_365466 ?auto_365469 ) ) ( not ( = ?auto_365466 ?auto_365471 ) ) ( not ( = ?auto_365466 ?auto_365474 ) ) ( not ( = ?auto_365467 ?auto_365465 ) ) ( not ( = ?auto_365467 ?auto_365472 ) ) ( not ( = ?auto_365465 ?auto_365470 ) ) ( not ( = ?auto_365465 ?auto_365472 ) ) ( not ( = ?auto_365470 ?auto_365472 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365468 ?auto_365467 ?auto_365469 ?auto_365470 )
      ( GET-4IMAGE-VERIFY ?auto_365466 ?auto_365467 ?auto_365468 ?auto_365465 ?auto_365469 ?auto_365470 ?auto_365471 ?auto_365472 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365491 - DIRECTION
      ?auto_365492 - MODE
      ?auto_365493 - DIRECTION
      ?auto_365490 - MODE
      ?auto_365494 - DIRECTION
      ?auto_365495 - MODE
      ?auto_365496 - DIRECTION
      ?auto_365497 - MODE
    )
    :vars
    (
      ?auto_365501 - INSTRUMENT
      ?auto_365500 - SATELLITE
      ?auto_365499 - DIRECTION
      ?auto_365498 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365501 ?auto_365500 ) ( SUPPORTS ?auto_365501 ?auto_365497 ) ( not ( = ?auto_365496 ?auto_365499 ) ) ( HAVE_IMAGE ?auto_365494 ?auto_365495 ) ( not ( = ?auto_365494 ?auto_365496 ) ) ( not ( = ?auto_365494 ?auto_365499 ) ) ( not ( = ?auto_365495 ?auto_365497 ) ) ( CALIBRATION_TARGET ?auto_365501 ?auto_365499 ) ( POINTING ?auto_365500 ?auto_365493 ) ( not ( = ?auto_365499 ?auto_365493 ) ) ( not ( = ?auto_365496 ?auto_365493 ) ) ( not ( = ?auto_365494 ?auto_365493 ) ) ( ON_BOARD ?auto_365498 ?auto_365500 ) ( POWER_ON ?auto_365498 ) ( not ( = ?auto_365501 ?auto_365498 ) ) ( HAVE_IMAGE ?auto_365491 ?auto_365492 ) ( HAVE_IMAGE ?auto_365493 ?auto_365490 ) ( not ( = ?auto_365491 ?auto_365493 ) ) ( not ( = ?auto_365491 ?auto_365494 ) ) ( not ( = ?auto_365491 ?auto_365496 ) ) ( not ( = ?auto_365491 ?auto_365499 ) ) ( not ( = ?auto_365492 ?auto_365490 ) ) ( not ( = ?auto_365492 ?auto_365495 ) ) ( not ( = ?auto_365492 ?auto_365497 ) ) ( not ( = ?auto_365490 ?auto_365495 ) ) ( not ( = ?auto_365490 ?auto_365497 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365494 ?auto_365495 ?auto_365496 ?auto_365497 )
      ( GET-4IMAGE-VERIFY ?auto_365491 ?auto_365492 ?auto_365493 ?auto_365490 ?auto_365494 ?auto_365495 ?auto_365496 ?auto_365497 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365503 - DIRECTION
      ?auto_365504 - MODE
      ?auto_365505 - DIRECTION
      ?auto_365502 - MODE
      ?auto_365506 - DIRECTION
      ?auto_365507 - MODE
      ?auto_365508 - DIRECTION
      ?auto_365509 - MODE
    )
    :vars
    (
      ?auto_365513 - INSTRUMENT
      ?auto_365512 - SATELLITE
      ?auto_365511 - DIRECTION
      ?auto_365510 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365513 ?auto_365512 ) ( SUPPORTS ?auto_365513 ?auto_365509 ) ( not ( = ?auto_365508 ?auto_365511 ) ) ( HAVE_IMAGE ?auto_365503 ?auto_365504 ) ( not ( = ?auto_365503 ?auto_365508 ) ) ( not ( = ?auto_365503 ?auto_365511 ) ) ( not ( = ?auto_365504 ?auto_365509 ) ) ( CALIBRATION_TARGET ?auto_365513 ?auto_365511 ) ( POINTING ?auto_365512 ?auto_365506 ) ( not ( = ?auto_365511 ?auto_365506 ) ) ( not ( = ?auto_365508 ?auto_365506 ) ) ( not ( = ?auto_365503 ?auto_365506 ) ) ( ON_BOARD ?auto_365510 ?auto_365512 ) ( POWER_ON ?auto_365510 ) ( not ( = ?auto_365513 ?auto_365510 ) ) ( HAVE_IMAGE ?auto_365505 ?auto_365502 ) ( HAVE_IMAGE ?auto_365506 ?auto_365507 ) ( not ( = ?auto_365503 ?auto_365505 ) ) ( not ( = ?auto_365504 ?auto_365502 ) ) ( not ( = ?auto_365504 ?auto_365507 ) ) ( not ( = ?auto_365505 ?auto_365506 ) ) ( not ( = ?auto_365505 ?auto_365508 ) ) ( not ( = ?auto_365505 ?auto_365511 ) ) ( not ( = ?auto_365502 ?auto_365507 ) ) ( not ( = ?auto_365502 ?auto_365509 ) ) ( not ( = ?auto_365507 ?auto_365509 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365503 ?auto_365504 ?auto_365508 ?auto_365509 )
      ( GET-4IMAGE-VERIFY ?auto_365503 ?auto_365504 ?auto_365505 ?auto_365502 ?auto_365506 ?auto_365507 ?auto_365508 ?auto_365509 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365515 - DIRECTION
      ?auto_365516 - MODE
      ?auto_365517 - DIRECTION
      ?auto_365514 - MODE
      ?auto_365518 - DIRECTION
      ?auto_365519 - MODE
      ?auto_365520 - DIRECTION
      ?auto_365521 - MODE
    )
    :vars
    (
      ?auto_365525 - INSTRUMENT
      ?auto_365524 - SATELLITE
      ?auto_365523 - DIRECTION
      ?auto_365522 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365525 ?auto_365524 ) ( SUPPORTS ?auto_365525 ?auto_365519 ) ( not ( = ?auto_365518 ?auto_365523 ) ) ( HAVE_IMAGE ?auto_365515 ?auto_365521 ) ( not ( = ?auto_365515 ?auto_365518 ) ) ( not ( = ?auto_365515 ?auto_365523 ) ) ( not ( = ?auto_365521 ?auto_365519 ) ) ( CALIBRATION_TARGET ?auto_365525 ?auto_365523 ) ( POINTING ?auto_365524 ?auto_365517 ) ( not ( = ?auto_365523 ?auto_365517 ) ) ( not ( = ?auto_365518 ?auto_365517 ) ) ( not ( = ?auto_365515 ?auto_365517 ) ) ( ON_BOARD ?auto_365522 ?auto_365524 ) ( POWER_ON ?auto_365522 ) ( not ( = ?auto_365525 ?auto_365522 ) ) ( HAVE_IMAGE ?auto_365515 ?auto_365516 ) ( HAVE_IMAGE ?auto_365517 ?auto_365514 ) ( HAVE_IMAGE ?auto_365520 ?auto_365521 ) ( not ( = ?auto_365515 ?auto_365520 ) ) ( not ( = ?auto_365516 ?auto_365514 ) ) ( not ( = ?auto_365516 ?auto_365519 ) ) ( not ( = ?auto_365516 ?auto_365521 ) ) ( not ( = ?auto_365517 ?auto_365520 ) ) ( not ( = ?auto_365514 ?auto_365519 ) ) ( not ( = ?auto_365514 ?auto_365521 ) ) ( not ( = ?auto_365518 ?auto_365520 ) ) ( not ( = ?auto_365520 ?auto_365523 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365515 ?auto_365521 ?auto_365518 ?auto_365519 )
      ( GET-4IMAGE-VERIFY ?auto_365515 ?auto_365516 ?auto_365517 ?auto_365514 ?auto_365518 ?auto_365519 ?auto_365520 ?auto_365521 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365527 - DIRECTION
      ?auto_365528 - MODE
      ?auto_365529 - DIRECTION
      ?auto_365526 - MODE
      ?auto_365530 - DIRECTION
      ?auto_365531 - MODE
      ?auto_365532 - DIRECTION
      ?auto_365533 - MODE
    )
    :vars
    (
      ?auto_365537 - INSTRUMENT
      ?auto_365536 - SATELLITE
      ?auto_365535 - DIRECTION
      ?auto_365534 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365537 ?auto_365536 ) ( SUPPORTS ?auto_365537 ?auto_365531 ) ( not ( = ?auto_365530 ?auto_365535 ) ) ( HAVE_IMAGE ?auto_365527 ?auto_365528 ) ( not ( = ?auto_365527 ?auto_365530 ) ) ( not ( = ?auto_365527 ?auto_365535 ) ) ( not ( = ?auto_365528 ?auto_365531 ) ) ( CALIBRATION_TARGET ?auto_365537 ?auto_365535 ) ( POINTING ?auto_365536 ?auto_365529 ) ( not ( = ?auto_365535 ?auto_365529 ) ) ( not ( = ?auto_365530 ?auto_365529 ) ) ( not ( = ?auto_365527 ?auto_365529 ) ) ( ON_BOARD ?auto_365534 ?auto_365536 ) ( POWER_ON ?auto_365534 ) ( not ( = ?auto_365537 ?auto_365534 ) ) ( HAVE_IMAGE ?auto_365529 ?auto_365526 ) ( HAVE_IMAGE ?auto_365532 ?auto_365533 ) ( not ( = ?auto_365527 ?auto_365532 ) ) ( not ( = ?auto_365528 ?auto_365526 ) ) ( not ( = ?auto_365528 ?auto_365533 ) ) ( not ( = ?auto_365529 ?auto_365532 ) ) ( not ( = ?auto_365526 ?auto_365531 ) ) ( not ( = ?auto_365526 ?auto_365533 ) ) ( not ( = ?auto_365530 ?auto_365532 ) ) ( not ( = ?auto_365531 ?auto_365533 ) ) ( not ( = ?auto_365532 ?auto_365535 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365527 ?auto_365528 ?auto_365530 ?auto_365531 )
      ( GET-4IMAGE-VERIFY ?auto_365527 ?auto_365528 ?auto_365529 ?auto_365526 ?auto_365530 ?auto_365531 ?auto_365532 ?auto_365533 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365551 - DIRECTION
      ?auto_365552 - MODE
      ?auto_365553 - DIRECTION
      ?auto_365550 - MODE
      ?auto_365554 - DIRECTION
      ?auto_365555 - MODE
      ?auto_365556 - DIRECTION
      ?auto_365557 - MODE
    )
    :vars
    (
      ?auto_365562 - INSTRUMENT
      ?auto_365561 - SATELLITE
      ?auto_365559 - DIRECTION
      ?auto_365560 - DIRECTION
      ?auto_365558 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365562 ?auto_365561 ) ( SUPPORTS ?auto_365562 ?auto_365550 ) ( not ( = ?auto_365553 ?auto_365559 ) ) ( HAVE_IMAGE ?auto_365551 ?auto_365557 ) ( not ( = ?auto_365551 ?auto_365553 ) ) ( not ( = ?auto_365551 ?auto_365559 ) ) ( not ( = ?auto_365557 ?auto_365550 ) ) ( CALIBRATION_TARGET ?auto_365562 ?auto_365559 ) ( POINTING ?auto_365561 ?auto_365560 ) ( not ( = ?auto_365559 ?auto_365560 ) ) ( not ( = ?auto_365553 ?auto_365560 ) ) ( not ( = ?auto_365551 ?auto_365560 ) ) ( ON_BOARD ?auto_365558 ?auto_365561 ) ( POWER_ON ?auto_365558 ) ( not ( = ?auto_365562 ?auto_365558 ) ) ( HAVE_IMAGE ?auto_365551 ?auto_365552 ) ( HAVE_IMAGE ?auto_365554 ?auto_365555 ) ( HAVE_IMAGE ?auto_365556 ?auto_365557 ) ( not ( = ?auto_365551 ?auto_365554 ) ) ( not ( = ?auto_365551 ?auto_365556 ) ) ( not ( = ?auto_365552 ?auto_365550 ) ) ( not ( = ?auto_365552 ?auto_365555 ) ) ( not ( = ?auto_365552 ?auto_365557 ) ) ( not ( = ?auto_365553 ?auto_365554 ) ) ( not ( = ?auto_365553 ?auto_365556 ) ) ( not ( = ?auto_365550 ?auto_365555 ) ) ( not ( = ?auto_365554 ?auto_365556 ) ) ( not ( = ?auto_365554 ?auto_365559 ) ) ( not ( = ?auto_365554 ?auto_365560 ) ) ( not ( = ?auto_365555 ?auto_365557 ) ) ( not ( = ?auto_365556 ?auto_365559 ) ) ( not ( = ?auto_365556 ?auto_365560 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365551 ?auto_365557 ?auto_365553 ?auto_365550 )
      ( GET-4IMAGE-VERIFY ?auto_365551 ?auto_365552 ?auto_365553 ?auto_365550 ?auto_365554 ?auto_365555 ?auto_365556 ?auto_365557 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365564 - DIRECTION
      ?auto_365565 - MODE
      ?auto_365566 - DIRECTION
      ?auto_365563 - MODE
      ?auto_365567 - DIRECTION
      ?auto_365568 - MODE
      ?auto_365569 - DIRECTION
      ?auto_365570 - MODE
    )
    :vars
    (
      ?auto_365574 - INSTRUMENT
      ?auto_365573 - SATELLITE
      ?auto_365572 - DIRECTION
      ?auto_365571 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365574 ?auto_365573 ) ( SUPPORTS ?auto_365574 ?auto_365563 ) ( not ( = ?auto_365566 ?auto_365572 ) ) ( HAVE_IMAGE ?auto_365567 ?auto_365568 ) ( not ( = ?auto_365567 ?auto_365566 ) ) ( not ( = ?auto_365567 ?auto_365572 ) ) ( not ( = ?auto_365568 ?auto_365563 ) ) ( CALIBRATION_TARGET ?auto_365574 ?auto_365572 ) ( POINTING ?auto_365573 ?auto_365569 ) ( not ( = ?auto_365572 ?auto_365569 ) ) ( not ( = ?auto_365566 ?auto_365569 ) ) ( not ( = ?auto_365567 ?auto_365569 ) ) ( ON_BOARD ?auto_365571 ?auto_365573 ) ( POWER_ON ?auto_365571 ) ( not ( = ?auto_365574 ?auto_365571 ) ) ( HAVE_IMAGE ?auto_365564 ?auto_365565 ) ( HAVE_IMAGE ?auto_365569 ?auto_365570 ) ( not ( = ?auto_365564 ?auto_365566 ) ) ( not ( = ?auto_365564 ?auto_365567 ) ) ( not ( = ?auto_365564 ?auto_365569 ) ) ( not ( = ?auto_365564 ?auto_365572 ) ) ( not ( = ?auto_365565 ?auto_365563 ) ) ( not ( = ?auto_365565 ?auto_365568 ) ) ( not ( = ?auto_365565 ?auto_365570 ) ) ( not ( = ?auto_365563 ?auto_365570 ) ) ( not ( = ?auto_365568 ?auto_365570 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365567 ?auto_365568 ?auto_365566 ?auto_365563 )
      ( GET-4IMAGE-VERIFY ?auto_365564 ?auto_365565 ?auto_365566 ?auto_365563 ?auto_365567 ?auto_365568 ?auto_365569 ?auto_365570 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365589 - DIRECTION
      ?auto_365590 - MODE
      ?auto_365591 - DIRECTION
      ?auto_365588 - MODE
      ?auto_365592 - DIRECTION
      ?auto_365593 - MODE
      ?auto_365594 - DIRECTION
      ?auto_365595 - MODE
    )
    :vars
    (
      ?auto_365599 - INSTRUMENT
      ?auto_365598 - SATELLITE
      ?auto_365597 - DIRECTION
      ?auto_365596 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365599 ?auto_365598 ) ( SUPPORTS ?auto_365599 ?auto_365588 ) ( not ( = ?auto_365591 ?auto_365597 ) ) ( HAVE_IMAGE ?auto_365589 ?auto_365595 ) ( not ( = ?auto_365589 ?auto_365591 ) ) ( not ( = ?auto_365589 ?auto_365597 ) ) ( not ( = ?auto_365595 ?auto_365588 ) ) ( CALIBRATION_TARGET ?auto_365599 ?auto_365597 ) ( POINTING ?auto_365598 ?auto_365592 ) ( not ( = ?auto_365597 ?auto_365592 ) ) ( not ( = ?auto_365591 ?auto_365592 ) ) ( not ( = ?auto_365589 ?auto_365592 ) ) ( ON_BOARD ?auto_365596 ?auto_365598 ) ( POWER_ON ?auto_365596 ) ( not ( = ?auto_365599 ?auto_365596 ) ) ( HAVE_IMAGE ?auto_365589 ?auto_365590 ) ( HAVE_IMAGE ?auto_365592 ?auto_365593 ) ( HAVE_IMAGE ?auto_365594 ?auto_365595 ) ( not ( = ?auto_365589 ?auto_365594 ) ) ( not ( = ?auto_365590 ?auto_365588 ) ) ( not ( = ?auto_365590 ?auto_365593 ) ) ( not ( = ?auto_365590 ?auto_365595 ) ) ( not ( = ?auto_365591 ?auto_365594 ) ) ( not ( = ?auto_365588 ?auto_365593 ) ) ( not ( = ?auto_365592 ?auto_365594 ) ) ( not ( = ?auto_365593 ?auto_365595 ) ) ( not ( = ?auto_365594 ?auto_365597 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365589 ?auto_365595 ?auto_365591 ?auto_365588 )
      ( GET-4IMAGE-VERIFY ?auto_365589 ?auto_365590 ?auto_365591 ?auto_365588 ?auto_365592 ?auto_365593 ?auto_365594 ?auto_365595 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365601 - DIRECTION
      ?auto_365602 - MODE
      ?auto_365603 - DIRECTION
      ?auto_365600 - MODE
      ?auto_365604 - DIRECTION
      ?auto_365605 - MODE
      ?auto_365606 - DIRECTION
      ?auto_365607 - MODE
    )
    :vars
    (
      ?auto_365611 - INSTRUMENT
      ?auto_365610 - SATELLITE
      ?auto_365609 - DIRECTION
      ?auto_365608 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365611 ?auto_365610 ) ( SUPPORTS ?auto_365611 ?auto_365600 ) ( not ( = ?auto_365603 ?auto_365609 ) ) ( HAVE_IMAGE ?auto_365601 ?auto_365602 ) ( not ( = ?auto_365601 ?auto_365603 ) ) ( not ( = ?auto_365601 ?auto_365609 ) ) ( not ( = ?auto_365602 ?auto_365600 ) ) ( CALIBRATION_TARGET ?auto_365611 ?auto_365609 ) ( POINTING ?auto_365610 ?auto_365604 ) ( not ( = ?auto_365609 ?auto_365604 ) ) ( not ( = ?auto_365603 ?auto_365604 ) ) ( not ( = ?auto_365601 ?auto_365604 ) ) ( ON_BOARD ?auto_365608 ?auto_365610 ) ( POWER_ON ?auto_365608 ) ( not ( = ?auto_365611 ?auto_365608 ) ) ( HAVE_IMAGE ?auto_365604 ?auto_365605 ) ( HAVE_IMAGE ?auto_365606 ?auto_365607 ) ( not ( = ?auto_365601 ?auto_365606 ) ) ( not ( = ?auto_365602 ?auto_365605 ) ) ( not ( = ?auto_365602 ?auto_365607 ) ) ( not ( = ?auto_365603 ?auto_365606 ) ) ( not ( = ?auto_365600 ?auto_365605 ) ) ( not ( = ?auto_365600 ?auto_365607 ) ) ( not ( = ?auto_365604 ?auto_365606 ) ) ( not ( = ?auto_365605 ?auto_365607 ) ) ( not ( = ?auto_365606 ?auto_365609 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365601 ?auto_365602 ?auto_365603 ?auto_365600 )
      ( GET-4IMAGE-VERIFY ?auto_365601 ?auto_365602 ?auto_365603 ?auto_365600 ?auto_365604 ?auto_365605 ?auto_365606 ?auto_365607 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365663 - DIRECTION
      ?auto_365664 - MODE
      ?auto_365665 - DIRECTION
      ?auto_365662 - MODE
      ?auto_365666 - DIRECTION
      ?auto_365667 - MODE
      ?auto_365668 - DIRECTION
      ?auto_365669 - MODE
    )
    :vars
    (
      ?auto_365673 - INSTRUMENT
      ?auto_365672 - SATELLITE
      ?auto_365671 - DIRECTION
      ?auto_365670 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365673 ?auto_365672 ) ( SUPPORTS ?auto_365673 ?auto_365669 ) ( not ( = ?auto_365668 ?auto_365671 ) ) ( HAVE_IMAGE ?auto_365665 ?auto_365662 ) ( not ( = ?auto_365665 ?auto_365668 ) ) ( not ( = ?auto_365665 ?auto_365671 ) ) ( not ( = ?auto_365662 ?auto_365669 ) ) ( CALIBRATION_TARGET ?auto_365673 ?auto_365671 ) ( POINTING ?auto_365672 ?auto_365663 ) ( not ( = ?auto_365671 ?auto_365663 ) ) ( not ( = ?auto_365668 ?auto_365663 ) ) ( not ( = ?auto_365665 ?auto_365663 ) ) ( ON_BOARD ?auto_365670 ?auto_365672 ) ( POWER_ON ?auto_365670 ) ( not ( = ?auto_365673 ?auto_365670 ) ) ( HAVE_IMAGE ?auto_365663 ?auto_365664 ) ( HAVE_IMAGE ?auto_365666 ?auto_365667 ) ( not ( = ?auto_365663 ?auto_365666 ) ) ( not ( = ?auto_365664 ?auto_365662 ) ) ( not ( = ?auto_365664 ?auto_365667 ) ) ( not ( = ?auto_365664 ?auto_365669 ) ) ( not ( = ?auto_365665 ?auto_365666 ) ) ( not ( = ?auto_365662 ?auto_365667 ) ) ( not ( = ?auto_365666 ?auto_365668 ) ) ( not ( = ?auto_365666 ?auto_365671 ) ) ( not ( = ?auto_365667 ?auto_365669 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365665 ?auto_365662 ?auto_365668 ?auto_365669 )
      ( GET-4IMAGE-VERIFY ?auto_365663 ?auto_365664 ?auto_365665 ?auto_365662 ?auto_365666 ?auto_365667 ?auto_365668 ?auto_365669 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365675 - DIRECTION
      ?auto_365676 - MODE
      ?auto_365677 - DIRECTION
      ?auto_365674 - MODE
      ?auto_365678 - DIRECTION
      ?auto_365679 - MODE
      ?auto_365680 - DIRECTION
      ?auto_365681 - MODE
    )
    :vars
    (
      ?auto_365685 - INSTRUMENT
      ?auto_365684 - SATELLITE
      ?auto_365683 - DIRECTION
      ?auto_365682 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365685 ?auto_365684 ) ( SUPPORTS ?auto_365685 ?auto_365681 ) ( not ( = ?auto_365680 ?auto_365683 ) ) ( HAVE_IMAGE ?auto_365677 ?auto_365674 ) ( not ( = ?auto_365677 ?auto_365680 ) ) ( not ( = ?auto_365677 ?auto_365683 ) ) ( not ( = ?auto_365674 ?auto_365681 ) ) ( CALIBRATION_TARGET ?auto_365685 ?auto_365683 ) ( POINTING ?auto_365684 ?auto_365678 ) ( not ( = ?auto_365683 ?auto_365678 ) ) ( not ( = ?auto_365680 ?auto_365678 ) ) ( not ( = ?auto_365677 ?auto_365678 ) ) ( ON_BOARD ?auto_365682 ?auto_365684 ) ( POWER_ON ?auto_365682 ) ( not ( = ?auto_365685 ?auto_365682 ) ) ( HAVE_IMAGE ?auto_365675 ?auto_365676 ) ( HAVE_IMAGE ?auto_365678 ?auto_365679 ) ( not ( = ?auto_365675 ?auto_365677 ) ) ( not ( = ?auto_365675 ?auto_365678 ) ) ( not ( = ?auto_365675 ?auto_365680 ) ) ( not ( = ?auto_365675 ?auto_365683 ) ) ( not ( = ?auto_365676 ?auto_365674 ) ) ( not ( = ?auto_365676 ?auto_365679 ) ) ( not ( = ?auto_365676 ?auto_365681 ) ) ( not ( = ?auto_365674 ?auto_365679 ) ) ( not ( = ?auto_365679 ?auto_365681 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365677 ?auto_365674 ?auto_365680 ?auto_365681 )
      ( GET-4IMAGE-VERIFY ?auto_365675 ?auto_365676 ?auto_365677 ?auto_365674 ?auto_365678 ?auto_365679 ?auto_365680 ?auto_365681 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365687 - DIRECTION
      ?auto_365688 - MODE
      ?auto_365689 - DIRECTION
      ?auto_365686 - MODE
      ?auto_365690 - DIRECTION
      ?auto_365691 - MODE
      ?auto_365692 - DIRECTION
      ?auto_365693 - MODE
    )
    :vars
    (
      ?auto_365697 - INSTRUMENT
      ?auto_365696 - SATELLITE
      ?auto_365695 - DIRECTION
      ?auto_365694 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365697 ?auto_365696 ) ( SUPPORTS ?auto_365697 ?auto_365691 ) ( not ( = ?auto_365690 ?auto_365695 ) ) ( HAVE_IMAGE ?auto_365689 ?auto_365693 ) ( not ( = ?auto_365689 ?auto_365690 ) ) ( not ( = ?auto_365689 ?auto_365695 ) ) ( not ( = ?auto_365693 ?auto_365691 ) ) ( CALIBRATION_TARGET ?auto_365697 ?auto_365695 ) ( POINTING ?auto_365696 ?auto_365687 ) ( not ( = ?auto_365695 ?auto_365687 ) ) ( not ( = ?auto_365690 ?auto_365687 ) ) ( not ( = ?auto_365689 ?auto_365687 ) ) ( ON_BOARD ?auto_365694 ?auto_365696 ) ( POWER_ON ?auto_365694 ) ( not ( = ?auto_365697 ?auto_365694 ) ) ( HAVE_IMAGE ?auto_365687 ?auto_365688 ) ( HAVE_IMAGE ?auto_365689 ?auto_365686 ) ( HAVE_IMAGE ?auto_365692 ?auto_365693 ) ( not ( = ?auto_365687 ?auto_365692 ) ) ( not ( = ?auto_365688 ?auto_365686 ) ) ( not ( = ?auto_365688 ?auto_365691 ) ) ( not ( = ?auto_365688 ?auto_365693 ) ) ( not ( = ?auto_365689 ?auto_365692 ) ) ( not ( = ?auto_365686 ?auto_365691 ) ) ( not ( = ?auto_365686 ?auto_365693 ) ) ( not ( = ?auto_365690 ?auto_365692 ) ) ( not ( = ?auto_365692 ?auto_365695 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365689 ?auto_365693 ?auto_365690 ?auto_365691 )
      ( GET-4IMAGE-VERIFY ?auto_365687 ?auto_365688 ?auto_365689 ?auto_365686 ?auto_365690 ?auto_365691 ?auto_365692 ?auto_365693 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365699 - DIRECTION
      ?auto_365700 - MODE
      ?auto_365701 - DIRECTION
      ?auto_365698 - MODE
      ?auto_365702 - DIRECTION
      ?auto_365703 - MODE
      ?auto_365704 - DIRECTION
      ?auto_365705 - MODE
    )
    :vars
    (
      ?auto_365709 - INSTRUMENT
      ?auto_365708 - SATELLITE
      ?auto_365707 - DIRECTION
      ?auto_365706 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365709 ?auto_365708 ) ( SUPPORTS ?auto_365709 ?auto_365703 ) ( not ( = ?auto_365702 ?auto_365707 ) ) ( HAVE_IMAGE ?auto_365701 ?auto_365698 ) ( not ( = ?auto_365701 ?auto_365702 ) ) ( not ( = ?auto_365701 ?auto_365707 ) ) ( not ( = ?auto_365698 ?auto_365703 ) ) ( CALIBRATION_TARGET ?auto_365709 ?auto_365707 ) ( POINTING ?auto_365708 ?auto_365699 ) ( not ( = ?auto_365707 ?auto_365699 ) ) ( not ( = ?auto_365702 ?auto_365699 ) ) ( not ( = ?auto_365701 ?auto_365699 ) ) ( ON_BOARD ?auto_365706 ?auto_365708 ) ( POWER_ON ?auto_365706 ) ( not ( = ?auto_365709 ?auto_365706 ) ) ( HAVE_IMAGE ?auto_365699 ?auto_365700 ) ( HAVE_IMAGE ?auto_365704 ?auto_365705 ) ( not ( = ?auto_365699 ?auto_365704 ) ) ( not ( = ?auto_365700 ?auto_365698 ) ) ( not ( = ?auto_365700 ?auto_365703 ) ) ( not ( = ?auto_365700 ?auto_365705 ) ) ( not ( = ?auto_365701 ?auto_365704 ) ) ( not ( = ?auto_365698 ?auto_365705 ) ) ( not ( = ?auto_365702 ?auto_365704 ) ) ( not ( = ?auto_365703 ?auto_365705 ) ) ( not ( = ?auto_365704 ?auto_365707 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365701 ?auto_365698 ?auto_365702 ?auto_365703 )
      ( GET-4IMAGE-VERIFY ?auto_365699 ?auto_365700 ?auto_365701 ?auto_365698 ?auto_365702 ?auto_365703 ?auto_365704 ?auto_365705 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365723 - DIRECTION
      ?auto_365724 - MODE
      ?auto_365725 - DIRECTION
      ?auto_365722 - MODE
      ?auto_365726 - DIRECTION
      ?auto_365727 - MODE
      ?auto_365728 - DIRECTION
      ?auto_365729 - MODE
    )
    :vars
    (
      ?auto_365733 - INSTRUMENT
      ?auto_365732 - SATELLITE
      ?auto_365731 - DIRECTION
      ?auto_365730 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365733 ?auto_365732 ) ( SUPPORTS ?auto_365733 ?auto_365729 ) ( not ( = ?auto_365728 ?auto_365731 ) ) ( HAVE_IMAGE ?auto_365726 ?auto_365727 ) ( not ( = ?auto_365726 ?auto_365728 ) ) ( not ( = ?auto_365726 ?auto_365731 ) ) ( not ( = ?auto_365727 ?auto_365729 ) ) ( CALIBRATION_TARGET ?auto_365733 ?auto_365731 ) ( POINTING ?auto_365732 ?auto_365723 ) ( not ( = ?auto_365731 ?auto_365723 ) ) ( not ( = ?auto_365728 ?auto_365723 ) ) ( not ( = ?auto_365726 ?auto_365723 ) ) ( ON_BOARD ?auto_365730 ?auto_365732 ) ( POWER_ON ?auto_365730 ) ( not ( = ?auto_365733 ?auto_365730 ) ) ( HAVE_IMAGE ?auto_365723 ?auto_365724 ) ( HAVE_IMAGE ?auto_365725 ?auto_365722 ) ( not ( = ?auto_365723 ?auto_365725 ) ) ( not ( = ?auto_365724 ?auto_365722 ) ) ( not ( = ?auto_365724 ?auto_365727 ) ) ( not ( = ?auto_365724 ?auto_365729 ) ) ( not ( = ?auto_365725 ?auto_365726 ) ) ( not ( = ?auto_365725 ?auto_365728 ) ) ( not ( = ?auto_365725 ?auto_365731 ) ) ( not ( = ?auto_365722 ?auto_365727 ) ) ( not ( = ?auto_365722 ?auto_365729 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365726 ?auto_365727 ?auto_365728 ?auto_365729 )
      ( GET-4IMAGE-VERIFY ?auto_365723 ?auto_365724 ?auto_365725 ?auto_365722 ?auto_365726 ?auto_365727 ?auto_365728 ?auto_365729 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365735 - DIRECTION
      ?auto_365736 - MODE
      ?auto_365737 - DIRECTION
      ?auto_365734 - MODE
      ?auto_365738 - DIRECTION
      ?auto_365739 - MODE
      ?auto_365740 - DIRECTION
      ?auto_365741 - MODE
    )
    :vars
    (
      ?auto_365746 - INSTRUMENT
      ?auto_365745 - SATELLITE
      ?auto_365743 - DIRECTION
      ?auto_365747 - DIRECTION
      ?auto_365744 - MODE
      ?auto_365742 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365746 ?auto_365745 ) ( SUPPORTS ?auto_365746 ?auto_365741 ) ( not ( = ?auto_365740 ?auto_365743 ) ) ( HAVE_IMAGE ?auto_365747 ?auto_365744 ) ( not ( = ?auto_365747 ?auto_365740 ) ) ( not ( = ?auto_365747 ?auto_365743 ) ) ( not ( = ?auto_365744 ?auto_365741 ) ) ( CALIBRATION_TARGET ?auto_365746 ?auto_365743 ) ( POINTING ?auto_365745 ?auto_365738 ) ( not ( = ?auto_365743 ?auto_365738 ) ) ( not ( = ?auto_365740 ?auto_365738 ) ) ( not ( = ?auto_365747 ?auto_365738 ) ) ( ON_BOARD ?auto_365742 ?auto_365745 ) ( POWER_ON ?auto_365742 ) ( not ( = ?auto_365746 ?auto_365742 ) ) ( HAVE_IMAGE ?auto_365735 ?auto_365736 ) ( HAVE_IMAGE ?auto_365737 ?auto_365734 ) ( HAVE_IMAGE ?auto_365738 ?auto_365739 ) ( not ( = ?auto_365735 ?auto_365737 ) ) ( not ( = ?auto_365735 ?auto_365738 ) ) ( not ( = ?auto_365735 ?auto_365740 ) ) ( not ( = ?auto_365735 ?auto_365743 ) ) ( not ( = ?auto_365735 ?auto_365747 ) ) ( not ( = ?auto_365736 ?auto_365734 ) ) ( not ( = ?auto_365736 ?auto_365739 ) ) ( not ( = ?auto_365736 ?auto_365741 ) ) ( not ( = ?auto_365736 ?auto_365744 ) ) ( not ( = ?auto_365737 ?auto_365738 ) ) ( not ( = ?auto_365737 ?auto_365740 ) ) ( not ( = ?auto_365737 ?auto_365743 ) ) ( not ( = ?auto_365737 ?auto_365747 ) ) ( not ( = ?auto_365734 ?auto_365739 ) ) ( not ( = ?auto_365734 ?auto_365741 ) ) ( not ( = ?auto_365734 ?auto_365744 ) ) ( not ( = ?auto_365739 ?auto_365741 ) ) ( not ( = ?auto_365739 ?auto_365744 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365747 ?auto_365744 ?auto_365740 ?auto_365741 )
      ( GET-4IMAGE-VERIFY ?auto_365735 ?auto_365736 ?auto_365737 ?auto_365734 ?auto_365738 ?auto_365739 ?auto_365740 ?auto_365741 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365749 - DIRECTION
      ?auto_365750 - MODE
      ?auto_365751 - DIRECTION
      ?auto_365748 - MODE
      ?auto_365752 - DIRECTION
      ?auto_365753 - MODE
      ?auto_365754 - DIRECTION
      ?auto_365755 - MODE
    )
    :vars
    (
      ?auto_365759 - INSTRUMENT
      ?auto_365758 - SATELLITE
      ?auto_365757 - DIRECTION
      ?auto_365756 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365759 ?auto_365758 ) ( SUPPORTS ?auto_365759 ?auto_365753 ) ( not ( = ?auto_365752 ?auto_365757 ) ) ( HAVE_IMAGE ?auto_365754 ?auto_365755 ) ( not ( = ?auto_365754 ?auto_365752 ) ) ( not ( = ?auto_365754 ?auto_365757 ) ) ( not ( = ?auto_365755 ?auto_365753 ) ) ( CALIBRATION_TARGET ?auto_365759 ?auto_365757 ) ( POINTING ?auto_365758 ?auto_365749 ) ( not ( = ?auto_365757 ?auto_365749 ) ) ( not ( = ?auto_365752 ?auto_365749 ) ) ( not ( = ?auto_365754 ?auto_365749 ) ) ( ON_BOARD ?auto_365756 ?auto_365758 ) ( POWER_ON ?auto_365756 ) ( not ( = ?auto_365759 ?auto_365756 ) ) ( HAVE_IMAGE ?auto_365749 ?auto_365750 ) ( HAVE_IMAGE ?auto_365751 ?auto_365748 ) ( not ( = ?auto_365749 ?auto_365751 ) ) ( not ( = ?auto_365750 ?auto_365748 ) ) ( not ( = ?auto_365750 ?auto_365753 ) ) ( not ( = ?auto_365750 ?auto_365755 ) ) ( not ( = ?auto_365751 ?auto_365752 ) ) ( not ( = ?auto_365751 ?auto_365754 ) ) ( not ( = ?auto_365751 ?auto_365757 ) ) ( not ( = ?auto_365748 ?auto_365753 ) ) ( not ( = ?auto_365748 ?auto_365755 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365754 ?auto_365755 ?auto_365752 ?auto_365753 )
      ( GET-4IMAGE-VERIFY ?auto_365749 ?auto_365750 ?auto_365751 ?auto_365748 ?auto_365752 ?auto_365753 ?auto_365754 ?auto_365755 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365761 - DIRECTION
      ?auto_365762 - MODE
      ?auto_365763 - DIRECTION
      ?auto_365760 - MODE
      ?auto_365764 - DIRECTION
      ?auto_365765 - MODE
      ?auto_365766 - DIRECTION
      ?auto_365767 - MODE
    )
    :vars
    (
      ?auto_365772 - INSTRUMENT
      ?auto_365771 - SATELLITE
      ?auto_365769 - DIRECTION
      ?auto_365773 - DIRECTION
      ?auto_365770 - MODE
      ?auto_365768 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365772 ?auto_365771 ) ( SUPPORTS ?auto_365772 ?auto_365765 ) ( not ( = ?auto_365764 ?auto_365769 ) ) ( HAVE_IMAGE ?auto_365773 ?auto_365770 ) ( not ( = ?auto_365773 ?auto_365764 ) ) ( not ( = ?auto_365773 ?auto_365769 ) ) ( not ( = ?auto_365770 ?auto_365765 ) ) ( CALIBRATION_TARGET ?auto_365772 ?auto_365769 ) ( POINTING ?auto_365771 ?auto_365763 ) ( not ( = ?auto_365769 ?auto_365763 ) ) ( not ( = ?auto_365764 ?auto_365763 ) ) ( not ( = ?auto_365773 ?auto_365763 ) ) ( ON_BOARD ?auto_365768 ?auto_365771 ) ( POWER_ON ?auto_365768 ) ( not ( = ?auto_365772 ?auto_365768 ) ) ( HAVE_IMAGE ?auto_365761 ?auto_365762 ) ( HAVE_IMAGE ?auto_365763 ?auto_365760 ) ( HAVE_IMAGE ?auto_365766 ?auto_365767 ) ( not ( = ?auto_365761 ?auto_365763 ) ) ( not ( = ?auto_365761 ?auto_365764 ) ) ( not ( = ?auto_365761 ?auto_365766 ) ) ( not ( = ?auto_365761 ?auto_365769 ) ) ( not ( = ?auto_365761 ?auto_365773 ) ) ( not ( = ?auto_365762 ?auto_365760 ) ) ( not ( = ?auto_365762 ?auto_365765 ) ) ( not ( = ?auto_365762 ?auto_365767 ) ) ( not ( = ?auto_365762 ?auto_365770 ) ) ( not ( = ?auto_365763 ?auto_365766 ) ) ( not ( = ?auto_365760 ?auto_365765 ) ) ( not ( = ?auto_365760 ?auto_365767 ) ) ( not ( = ?auto_365760 ?auto_365770 ) ) ( not ( = ?auto_365764 ?auto_365766 ) ) ( not ( = ?auto_365765 ?auto_365767 ) ) ( not ( = ?auto_365766 ?auto_365769 ) ) ( not ( = ?auto_365766 ?auto_365773 ) ) ( not ( = ?auto_365767 ?auto_365770 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365773 ?auto_365770 ?auto_365764 ?auto_365765 )
      ( GET-4IMAGE-VERIFY ?auto_365761 ?auto_365762 ?auto_365763 ?auto_365760 ?auto_365764 ?auto_365765 ?auto_365766 ?auto_365767 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365789 - DIRECTION
      ?auto_365790 - MODE
      ?auto_365791 - DIRECTION
      ?auto_365788 - MODE
      ?auto_365792 - DIRECTION
      ?auto_365793 - MODE
      ?auto_365794 - DIRECTION
      ?auto_365795 - MODE
    )
    :vars
    (
      ?auto_365799 - INSTRUMENT
      ?auto_365798 - SATELLITE
      ?auto_365797 - DIRECTION
      ?auto_365796 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365799 ?auto_365798 ) ( SUPPORTS ?auto_365799 ?auto_365788 ) ( not ( = ?auto_365791 ?auto_365797 ) ) ( HAVE_IMAGE ?auto_365792 ?auto_365795 ) ( not ( = ?auto_365792 ?auto_365791 ) ) ( not ( = ?auto_365792 ?auto_365797 ) ) ( not ( = ?auto_365795 ?auto_365788 ) ) ( CALIBRATION_TARGET ?auto_365799 ?auto_365797 ) ( POINTING ?auto_365798 ?auto_365789 ) ( not ( = ?auto_365797 ?auto_365789 ) ) ( not ( = ?auto_365791 ?auto_365789 ) ) ( not ( = ?auto_365792 ?auto_365789 ) ) ( ON_BOARD ?auto_365796 ?auto_365798 ) ( POWER_ON ?auto_365796 ) ( not ( = ?auto_365799 ?auto_365796 ) ) ( HAVE_IMAGE ?auto_365789 ?auto_365790 ) ( HAVE_IMAGE ?auto_365792 ?auto_365793 ) ( HAVE_IMAGE ?auto_365794 ?auto_365795 ) ( not ( = ?auto_365789 ?auto_365794 ) ) ( not ( = ?auto_365790 ?auto_365788 ) ) ( not ( = ?auto_365790 ?auto_365793 ) ) ( not ( = ?auto_365790 ?auto_365795 ) ) ( not ( = ?auto_365791 ?auto_365794 ) ) ( not ( = ?auto_365788 ?auto_365793 ) ) ( not ( = ?auto_365792 ?auto_365794 ) ) ( not ( = ?auto_365793 ?auto_365795 ) ) ( not ( = ?auto_365794 ?auto_365797 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365792 ?auto_365795 ?auto_365791 ?auto_365788 )
      ( GET-4IMAGE-VERIFY ?auto_365789 ?auto_365790 ?auto_365791 ?auto_365788 ?auto_365792 ?auto_365793 ?auto_365794 ?auto_365795 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365801 - DIRECTION
      ?auto_365802 - MODE
      ?auto_365803 - DIRECTION
      ?auto_365800 - MODE
      ?auto_365804 - DIRECTION
      ?auto_365805 - MODE
      ?auto_365806 - DIRECTION
      ?auto_365807 - MODE
    )
    :vars
    (
      ?auto_365811 - INSTRUMENT
      ?auto_365810 - SATELLITE
      ?auto_365809 - DIRECTION
      ?auto_365808 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365811 ?auto_365810 ) ( SUPPORTS ?auto_365811 ?auto_365800 ) ( not ( = ?auto_365803 ?auto_365809 ) ) ( HAVE_IMAGE ?auto_365804 ?auto_365805 ) ( not ( = ?auto_365804 ?auto_365803 ) ) ( not ( = ?auto_365804 ?auto_365809 ) ) ( not ( = ?auto_365805 ?auto_365800 ) ) ( CALIBRATION_TARGET ?auto_365811 ?auto_365809 ) ( POINTING ?auto_365810 ?auto_365801 ) ( not ( = ?auto_365809 ?auto_365801 ) ) ( not ( = ?auto_365803 ?auto_365801 ) ) ( not ( = ?auto_365804 ?auto_365801 ) ) ( ON_BOARD ?auto_365808 ?auto_365810 ) ( POWER_ON ?auto_365808 ) ( not ( = ?auto_365811 ?auto_365808 ) ) ( HAVE_IMAGE ?auto_365801 ?auto_365802 ) ( HAVE_IMAGE ?auto_365806 ?auto_365807 ) ( not ( = ?auto_365801 ?auto_365806 ) ) ( not ( = ?auto_365802 ?auto_365800 ) ) ( not ( = ?auto_365802 ?auto_365805 ) ) ( not ( = ?auto_365802 ?auto_365807 ) ) ( not ( = ?auto_365803 ?auto_365806 ) ) ( not ( = ?auto_365800 ?auto_365807 ) ) ( not ( = ?auto_365804 ?auto_365806 ) ) ( not ( = ?auto_365805 ?auto_365807 ) ) ( not ( = ?auto_365806 ?auto_365809 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365804 ?auto_365805 ?auto_365803 ?auto_365800 )
      ( GET-4IMAGE-VERIFY ?auto_365801 ?auto_365802 ?auto_365803 ?auto_365800 ?auto_365804 ?auto_365805 ?auto_365806 ?auto_365807 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365825 - DIRECTION
      ?auto_365826 - MODE
      ?auto_365827 - DIRECTION
      ?auto_365824 - MODE
      ?auto_365828 - DIRECTION
      ?auto_365829 - MODE
      ?auto_365830 - DIRECTION
      ?auto_365831 - MODE
    )
    :vars
    (
      ?auto_365835 - INSTRUMENT
      ?auto_365834 - SATELLITE
      ?auto_365833 - DIRECTION
      ?auto_365832 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365835 ?auto_365834 ) ( SUPPORTS ?auto_365835 ?auto_365824 ) ( not ( = ?auto_365827 ?auto_365833 ) ) ( HAVE_IMAGE ?auto_365830 ?auto_365831 ) ( not ( = ?auto_365830 ?auto_365827 ) ) ( not ( = ?auto_365830 ?auto_365833 ) ) ( not ( = ?auto_365831 ?auto_365824 ) ) ( CALIBRATION_TARGET ?auto_365835 ?auto_365833 ) ( POINTING ?auto_365834 ?auto_365825 ) ( not ( = ?auto_365833 ?auto_365825 ) ) ( not ( = ?auto_365827 ?auto_365825 ) ) ( not ( = ?auto_365830 ?auto_365825 ) ) ( ON_BOARD ?auto_365832 ?auto_365834 ) ( POWER_ON ?auto_365832 ) ( not ( = ?auto_365835 ?auto_365832 ) ) ( HAVE_IMAGE ?auto_365825 ?auto_365826 ) ( HAVE_IMAGE ?auto_365828 ?auto_365829 ) ( not ( = ?auto_365825 ?auto_365828 ) ) ( not ( = ?auto_365826 ?auto_365824 ) ) ( not ( = ?auto_365826 ?auto_365829 ) ) ( not ( = ?auto_365826 ?auto_365831 ) ) ( not ( = ?auto_365827 ?auto_365828 ) ) ( not ( = ?auto_365824 ?auto_365829 ) ) ( not ( = ?auto_365828 ?auto_365830 ) ) ( not ( = ?auto_365828 ?auto_365833 ) ) ( not ( = ?auto_365829 ?auto_365831 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365830 ?auto_365831 ?auto_365827 ?auto_365824 )
      ( GET-4IMAGE-VERIFY ?auto_365825 ?auto_365826 ?auto_365827 ?auto_365824 ?auto_365828 ?auto_365829 ?auto_365830 ?auto_365831 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365837 - DIRECTION
      ?auto_365838 - MODE
      ?auto_365839 - DIRECTION
      ?auto_365836 - MODE
      ?auto_365840 - DIRECTION
      ?auto_365841 - MODE
      ?auto_365842 - DIRECTION
      ?auto_365843 - MODE
    )
    :vars
    (
      ?auto_365848 - INSTRUMENT
      ?auto_365847 - SATELLITE
      ?auto_365845 - DIRECTION
      ?auto_365849 - DIRECTION
      ?auto_365846 - MODE
      ?auto_365844 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365848 ?auto_365847 ) ( SUPPORTS ?auto_365848 ?auto_365836 ) ( not ( = ?auto_365839 ?auto_365845 ) ) ( HAVE_IMAGE ?auto_365849 ?auto_365846 ) ( not ( = ?auto_365849 ?auto_365839 ) ) ( not ( = ?auto_365849 ?auto_365845 ) ) ( not ( = ?auto_365846 ?auto_365836 ) ) ( CALIBRATION_TARGET ?auto_365848 ?auto_365845 ) ( POINTING ?auto_365847 ?auto_365840 ) ( not ( = ?auto_365845 ?auto_365840 ) ) ( not ( = ?auto_365839 ?auto_365840 ) ) ( not ( = ?auto_365849 ?auto_365840 ) ) ( ON_BOARD ?auto_365844 ?auto_365847 ) ( POWER_ON ?auto_365844 ) ( not ( = ?auto_365848 ?auto_365844 ) ) ( HAVE_IMAGE ?auto_365837 ?auto_365838 ) ( HAVE_IMAGE ?auto_365840 ?auto_365841 ) ( HAVE_IMAGE ?auto_365842 ?auto_365843 ) ( not ( = ?auto_365837 ?auto_365839 ) ) ( not ( = ?auto_365837 ?auto_365840 ) ) ( not ( = ?auto_365837 ?auto_365842 ) ) ( not ( = ?auto_365837 ?auto_365845 ) ) ( not ( = ?auto_365837 ?auto_365849 ) ) ( not ( = ?auto_365838 ?auto_365836 ) ) ( not ( = ?auto_365838 ?auto_365841 ) ) ( not ( = ?auto_365838 ?auto_365843 ) ) ( not ( = ?auto_365838 ?auto_365846 ) ) ( not ( = ?auto_365839 ?auto_365842 ) ) ( not ( = ?auto_365836 ?auto_365841 ) ) ( not ( = ?auto_365836 ?auto_365843 ) ) ( not ( = ?auto_365840 ?auto_365842 ) ) ( not ( = ?auto_365841 ?auto_365843 ) ) ( not ( = ?auto_365841 ?auto_365846 ) ) ( not ( = ?auto_365842 ?auto_365845 ) ) ( not ( = ?auto_365842 ?auto_365849 ) ) ( not ( = ?auto_365843 ?auto_365846 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365849 ?auto_365846 ?auto_365839 ?auto_365836 )
      ( GET-4IMAGE-VERIFY ?auto_365837 ?auto_365838 ?auto_365839 ?auto_365836 ?auto_365840 ?auto_365841 ?auto_365842 ?auto_365843 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365905 - DIRECTION
      ?auto_365906 - MODE
      ?auto_365907 - DIRECTION
      ?auto_365904 - MODE
      ?auto_365908 - DIRECTION
      ?auto_365909 - MODE
      ?auto_365910 - DIRECTION
      ?auto_365911 - MODE
    )
    :vars
    (
      ?auto_365916 - INSTRUMENT
      ?auto_365915 - SATELLITE
      ?auto_365913 - DIRECTION
      ?auto_365914 - DIRECTION
      ?auto_365912 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365916 ?auto_365915 ) ( SUPPORTS ?auto_365916 ?auto_365906 ) ( not ( = ?auto_365905 ?auto_365913 ) ) ( HAVE_IMAGE ?auto_365908 ?auto_365911 ) ( not ( = ?auto_365908 ?auto_365905 ) ) ( not ( = ?auto_365908 ?auto_365913 ) ) ( not ( = ?auto_365911 ?auto_365906 ) ) ( CALIBRATION_TARGET ?auto_365916 ?auto_365913 ) ( POINTING ?auto_365915 ?auto_365914 ) ( not ( = ?auto_365913 ?auto_365914 ) ) ( not ( = ?auto_365905 ?auto_365914 ) ) ( not ( = ?auto_365908 ?auto_365914 ) ) ( ON_BOARD ?auto_365912 ?auto_365915 ) ( POWER_ON ?auto_365912 ) ( not ( = ?auto_365916 ?auto_365912 ) ) ( HAVE_IMAGE ?auto_365907 ?auto_365904 ) ( HAVE_IMAGE ?auto_365908 ?auto_365909 ) ( HAVE_IMAGE ?auto_365910 ?auto_365911 ) ( not ( = ?auto_365905 ?auto_365907 ) ) ( not ( = ?auto_365905 ?auto_365910 ) ) ( not ( = ?auto_365906 ?auto_365904 ) ) ( not ( = ?auto_365906 ?auto_365909 ) ) ( not ( = ?auto_365907 ?auto_365908 ) ) ( not ( = ?auto_365907 ?auto_365910 ) ) ( not ( = ?auto_365907 ?auto_365913 ) ) ( not ( = ?auto_365907 ?auto_365914 ) ) ( not ( = ?auto_365904 ?auto_365909 ) ) ( not ( = ?auto_365904 ?auto_365911 ) ) ( not ( = ?auto_365908 ?auto_365910 ) ) ( not ( = ?auto_365909 ?auto_365911 ) ) ( not ( = ?auto_365910 ?auto_365913 ) ) ( not ( = ?auto_365910 ?auto_365914 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365908 ?auto_365911 ?auto_365905 ?auto_365906 )
      ( GET-4IMAGE-VERIFY ?auto_365905 ?auto_365906 ?auto_365907 ?auto_365904 ?auto_365908 ?auto_365909 ?auto_365910 ?auto_365911 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365918 - DIRECTION
      ?auto_365919 - MODE
      ?auto_365920 - DIRECTION
      ?auto_365917 - MODE
      ?auto_365921 - DIRECTION
      ?auto_365922 - MODE
      ?auto_365923 - DIRECTION
      ?auto_365924 - MODE
    )
    :vars
    (
      ?auto_365928 - INSTRUMENT
      ?auto_365927 - SATELLITE
      ?auto_365926 - DIRECTION
      ?auto_365925 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365928 ?auto_365927 ) ( SUPPORTS ?auto_365928 ?auto_365919 ) ( not ( = ?auto_365918 ?auto_365926 ) ) ( HAVE_IMAGE ?auto_365921 ?auto_365917 ) ( not ( = ?auto_365921 ?auto_365918 ) ) ( not ( = ?auto_365921 ?auto_365926 ) ) ( not ( = ?auto_365917 ?auto_365919 ) ) ( CALIBRATION_TARGET ?auto_365928 ?auto_365926 ) ( POINTING ?auto_365927 ?auto_365923 ) ( not ( = ?auto_365926 ?auto_365923 ) ) ( not ( = ?auto_365918 ?auto_365923 ) ) ( not ( = ?auto_365921 ?auto_365923 ) ) ( ON_BOARD ?auto_365925 ?auto_365927 ) ( POWER_ON ?auto_365925 ) ( not ( = ?auto_365928 ?auto_365925 ) ) ( HAVE_IMAGE ?auto_365920 ?auto_365917 ) ( HAVE_IMAGE ?auto_365921 ?auto_365922 ) ( HAVE_IMAGE ?auto_365923 ?auto_365924 ) ( not ( = ?auto_365918 ?auto_365920 ) ) ( not ( = ?auto_365919 ?auto_365922 ) ) ( not ( = ?auto_365919 ?auto_365924 ) ) ( not ( = ?auto_365920 ?auto_365921 ) ) ( not ( = ?auto_365920 ?auto_365923 ) ) ( not ( = ?auto_365920 ?auto_365926 ) ) ( not ( = ?auto_365917 ?auto_365922 ) ) ( not ( = ?auto_365917 ?auto_365924 ) ) ( not ( = ?auto_365922 ?auto_365924 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365921 ?auto_365917 ?auto_365918 ?auto_365919 )
      ( GET-4IMAGE-VERIFY ?auto_365918 ?auto_365919 ?auto_365920 ?auto_365917 ?auto_365921 ?auto_365922 ?auto_365923 ?auto_365924 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365943 - DIRECTION
      ?auto_365944 - MODE
      ?auto_365945 - DIRECTION
      ?auto_365942 - MODE
      ?auto_365946 - DIRECTION
      ?auto_365947 - MODE
      ?auto_365948 - DIRECTION
      ?auto_365949 - MODE
    )
    :vars
    (
      ?auto_365953 - INSTRUMENT
      ?auto_365952 - SATELLITE
      ?auto_365951 - DIRECTION
      ?auto_365950 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365953 ?auto_365952 ) ( SUPPORTS ?auto_365953 ?auto_365944 ) ( not ( = ?auto_365943 ?auto_365951 ) ) ( HAVE_IMAGE ?auto_365945 ?auto_365949 ) ( not ( = ?auto_365945 ?auto_365943 ) ) ( not ( = ?auto_365945 ?auto_365951 ) ) ( not ( = ?auto_365949 ?auto_365944 ) ) ( CALIBRATION_TARGET ?auto_365953 ?auto_365951 ) ( POINTING ?auto_365952 ?auto_365946 ) ( not ( = ?auto_365951 ?auto_365946 ) ) ( not ( = ?auto_365943 ?auto_365946 ) ) ( not ( = ?auto_365945 ?auto_365946 ) ) ( ON_BOARD ?auto_365950 ?auto_365952 ) ( POWER_ON ?auto_365950 ) ( not ( = ?auto_365953 ?auto_365950 ) ) ( HAVE_IMAGE ?auto_365945 ?auto_365942 ) ( HAVE_IMAGE ?auto_365946 ?auto_365947 ) ( HAVE_IMAGE ?auto_365948 ?auto_365949 ) ( not ( = ?auto_365943 ?auto_365948 ) ) ( not ( = ?auto_365944 ?auto_365942 ) ) ( not ( = ?auto_365944 ?auto_365947 ) ) ( not ( = ?auto_365945 ?auto_365948 ) ) ( not ( = ?auto_365942 ?auto_365947 ) ) ( not ( = ?auto_365942 ?auto_365949 ) ) ( not ( = ?auto_365946 ?auto_365948 ) ) ( not ( = ?auto_365947 ?auto_365949 ) ) ( not ( = ?auto_365948 ?auto_365951 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365945 ?auto_365949 ?auto_365943 ?auto_365944 )
      ( GET-4IMAGE-VERIFY ?auto_365943 ?auto_365944 ?auto_365945 ?auto_365942 ?auto_365946 ?auto_365947 ?auto_365948 ?auto_365949 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_365955 - DIRECTION
      ?auto_365956 - MODE
      ?auto_365957 - DIRECTION
      ?auto_365954 - MODE
      ?auto_365958 - DIRECTION
      ?auto_365959 - MODE
      ?auto_365960 - DIRECTION
      ?auto_365961 - MODE
    )
    :vars
    (
      ?auto_365965 - INSTRUMENT
      ?auto_365964 - SATELLITE
      ?auto_365963 - DIRECTION
      ?auto_365962 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_365965 ?auto_365964 ) ( SUPPORTS ?auto_365965 ?auto_365956 ) ( not ( = ?auto_365955 ?auto_365963 ) ) ( HAVE_IMAGE ?auto_365957 ?auto_365954 ) ( not ( = ?auto_365957 ?auto_365955 ) ) ( not ( = ?auto_365957 ?auto_365963 ) ) ( not ( = ?auto_365954 ?auto_365956 ) ) ( CALIBRATION_TARGET ?auto_365965 ?auto_365963 ) ( POINTING ?auto_365964 ?auto_365958 ) ( not ( = ?auto_365963 ?auto_365958 ) ) ( not ( = ?auto_365955 ?auto_365958 ) ) ( not ( = ?auto_365957 ?auto_365958 ) ) ( ON_BOARD ?auto_365962 ?auto_365964 ) ( POWER_ON ?auto_365962 ) ( not ( = ?auto_365965 ?auto_365962 ) ) ( HAVE_IMAGE ?auto_365958 ?auto_365959 ) ( HAVE_IMAGE ?auto_365960 ?auto_365961 ) ( not ( = ?auto_365955 ?auto_365960 ) ) ( not ( = ?auto_365956 ?auto_365959 ) ) ( not ( = ?auto_365956 ?auto_365961 ) ) ( not ( = ?auto_365957 ?auto_365960 ) ) ( not ( = ?auto_365954 ?auto_365959 ) ) ( not ( = ?auto_365954 ?auto_365961 ) ) ( not ( = ?auto_365958 ?auto_365960 ) ) ( not ( = ?auto_365959 ?auto_365961 ) ) ( not ( = ?auto_365960 ?auto_365963 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_365957 ?auto_365954 ?auto_365955 ?auto_365956 )
      ( GET-4IMAGE-VERIFY ?auto_365955 ?auto_365956 ?auto_365957 ?auto_365954 ?auto_365958 ?auto_365959 ?auto_365960 ?auto_365961 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_366017 - DIRECTION
      ?auto_366018 - MODE
      ?auto_366019 - DIRECTION
      ?auto_366016 - MODE
      ?auto_366020 - DIRECTION
      ?auto_366021 - MODE
      ?auto_366022 - DIRECTION
      ?auto_366023 - MODE
    )
    :vars
    (
      ?auto_366027 - INSTRUMENT
      ?auto_366026 - SATELLITE
      ?auto_366025 - DIRECTION
      ?auto_366024 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_366027 ?auto_366026 ) ( SUPPORTS ?auto_366027 ?auto_366018 ) ( not ( = ?auto_366017 ?auto_366025 ) ) ( HAVE_IMAGE ?auto_366020 ?auto_366023 ) ( not ( = ?auto_366020 ?auto_366017 ) ) ( not ( = ?auto_366020 ?auto_366025 ) ) ( not ( = ?auto_366023 ?auto_366018 ) ) ( CALIBRATION_TARGET ?auto_366027 ?auto_366025 ) ( POINTING ?auto_366026 ?auto_366019 ) ( not ( = ?auto_366025 ?auto_366019 ) ) ( not ( = ?auto_366017 ?auto_366019 ) ) ( not ( = ?auto_366020 ?auto_366019 ) ) ( ON_BOARD ?auto_366024 ?auto_366026 ) ( POWER_ON ?auto_366024 ) ( not ( = ?auto_366027 ?auto_366024 ) ) ( HAVE_IMAGE ?auto_366019 ?auto_366016 ) ( HAVE_IMAGE ?auto_366020 ?auto_366021 ) ( HAVE_IMAGE ?auto_366022 ?auto_366023 ) ( not ( = ?auto_366017 ?auto_366022 ) ) ( not ( = ?auto_366018 ?auto_366016 ) ) ( not ( = ?auto_366018 ?auto_366021 ) ) ( not ( = ?auto_366019 ?auto_366022 ) ) ( not ( = ?auto_366016 ?auto_366021 ) ) ( not ( = ?auto_366016 ?auto_366023 ) ) ( not ( = ?auto_366020 ?auto_366022 ) ) ( not ( = ?auto_366021 ?auto_366023 ) ) ( not ( = ?auto_366022 ?auto_366025 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_366020 ?auto_366023 ?auto_366017 ?auto_366018 )
      ( GET-4IMAGE-VERIFY ?auto_366017 ?auto_366018 ?auto_366019 ?auto_366016 ?auto_366020 ?auto_366021 ?auto_366022 ?auto_366023 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_366029 - DIRECTION
      ?auto_366030 - MODE
      ?auto_366031 - DIRECTION
      ?auto_366028 - MODE
      ?auto_366032 - DIRECTION
      ?auto_366033 - MODE
      ?auto_366034 - DIRECTION
      ?auto_366035 - MODE
    )
    :vars
    (
      ?auto_366039 - INSTRUMENT
      ?auto_366038 - SATELLITE
      ?auto_366037 - DIRECTION
      ?auto_366036 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_366039 ?auto_366038 ) ( SUPPORTS ?auto_366039 ?auto_366030 ) ( not ( = ?auto_366029 ?auto_366037 ) ) ( HAVE_IMAGE ?auto_366032 ?auto_366033 ) ( not ( = ?auto_366032 ?auto_366029 ) ) ( not ( = ?auto_366032 ?auto_366037 ) ) ( not ( = ?auto_366033 ?auto_366030 ) ) ( CALIBRATION_TARGET ?auto_366039 ?auto_366037 ) ( POINTING ?auto_366038 ?auto_366031 ) ( not ( = ?auto_366037 ?auto_366031 ) ) ( not ( = ?auto_366029 ?auto_366031 ) ) ( not ( = ?auto_366032 ?auto_366031 ) ) ( ON_BOARD ?auto_366036 ?auto_366038 ) ( POWER_ON ?auto_366036 ) ( not ( = ?auto_366039 ?auto_366036 ) ) ( HAVE_IMAGE ?auto_366031 ?auto_366028 ) ( HAVE_IMAGE ?auto_366034 ?auto_366035 ) ( not ( = ?auto_366029 ?auto_366034 ) ) ( not ( = ?auto_366030 ?auto_366028 ) ) ( not ( = ?auto_366030 ?auto_366035 ) ) ( not ( = ?auto_366031 ?auto_366034 ) ) ( not ( = ?auto_366028 ?auto_366033 ) ) ( not ( = ?auto_366028 ?auto_366035 ) ) ( not ( = ?auto_366032 ?auto_366034 ) ) ( not ( = ?auto_366033 ?auto_366035 ) ) ( not ( = ?auto_366034 ?auto_366037 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_366032 ?auto_366033 ?auto_366029 ?auto_366030 )
      ( GET-4IMAGE-VERIFY ?auto_366029 ?auto_366030 ?auto_366031 ?auto_366028 ?auto_366032 ?auto_366033 ?auto_366034 ?auto_366035 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_366053 - DIRECTION
      ?auto_366054 - MODE
      ?auto_366055 - DIRECTION
      ?auto_366052 - MODE
      ?auto_366056 - DIRECTION
      ?auto_366057 - MODE
      ?auto_366058 - DIRECTION
      ?auto_366059 - MODE
    )
    :vars
    (
      ?auto_366063 - INSTRUMENT
      ?auto_366062 - SATELLITE
      ?auto_366061 - DIRECTION
      ?auto_366060 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_366063 ?auto_366062 ) ( SUPPORTS ?auto_366063 ?auto_366054 ) ( not ( = ?auto_366053 ?auto_366061 ) ) ( HAVE_IMAGE ?auto_366058 ?auto_366059 ) ( not ( = ?auto_366058 ?auto_366053 ) ) ( not ( = ?auto_366058 ?auto_366061 ) ) ( not ( = ?auto_366059 ?auto_366054 ) ) ( CALIBRATION_TARGET ?auto_366063 ?auto_366061 ) ( POINTING ?auto_366062 ?auto_366056 ) ( not ( = ?auto_366061 ?auto_366056 ) ) ( not ( = ?auto_366053 ?auto_366056 ) ) ( not ( = ?auto_366058 ?auto_366056 ) ) ( ON_BOARD ?auto_366060 ?auto_366062 ) ( POWER_ON ?auto_366060 ) ( not ( = ?auto_366063 ?auto_366060 ) ) ( HAVE_IMAGE ?auto_366055 ?auto_366052 ) ( HAVE_IMAGE ?auto_366056 ?auto_366057 ) ( not ( = ?auto_366053 ?auto_366055 ) ) ( not ( = ?auto_366054 ?auto_366052 ) ) ( not ( = ?auto_366054 ?auto_366057 ) ) ( not ( = ?auto_366055 ?auto_366056 ) ) ( not ( = ?auto_366055 ?auto_366058 ) ) ( not ( = ?auto_366055 ?auto_366061 ) ) ( not ( = ?auto_366052 ?auto_366057 ) ) ( not ( = ?auto_366052 ?auto_366059 ) ) ( not ( = ?auto_366057 ?auto_366059 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_366058 ?auto_366059 ?auto_366053 ?auto_366054 )
      ( GET-4IMAGE-VERIFY ?auto_366053 ?auto_366054 ?auto_366055 ?auto_366052 ?auto_366056 ?auto_366057 ?auto_366058 ?auto_366059 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_366065 - DIRECTION
      ?auto_366066 - MODE
      ?auto_366067 - DIRECTION
      ?auto_366064 - MODE
      ?auto_366068 - DIRECTION
      ?auto_366069 - MODE
      ?auto_366070 - DIRECTION
      ?auto_366071 - MODE
    )
    :vars
    (
      ?auto_366076 - INSTRUMENT
      ?auto_366075 - SATELLITE
      ?auto_366073 - DIRECTION
      ?auto_366077 - DIRECTION
      ?auto_366074 - MODE
      ?auto_366072 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_366076 ?auto_366075 ) ( SUPPORTS ?auto_366076 ?auto_366066 ) ( not ( = ?auto_366065 ?auto_366073 ) ) ( HAVE_IMAGE ?auto_366077 ?auto_366074 ) ( not ( = ?auto_366077 ?auto_366065 ) ) ( not ( = ?auto_366077 ?auto_366073 ) ) ( not ( = ?auto_366074 ?auto_366066 ) ) ( CALIBRATION_TARGET ?auto_366076 ?auto_366073 ) ( POINTING ?auto_366075 ?auto_366068 ) ( not ( = ?auto_366073 ?auto_366068 ) ) ( not ( = ?auto_366065 ?auto_366068 ) ) ( not ( = ?auto_366077 ?auto_366068 ) ) ( ON_BOARD ?auto_366072 ?auto_366075 ) ( POWER_ON ?auto_366072 ) ( not ( = ?auto_366076 ?auto_366072 ) ) ( HAVE_IMAGE ?auto_366067 ?auto_366064 ) ( HAVE_IMAGE ?auto_366068 ?auto_366069 ) ( HAVE_IMAGE ?auto_366070 ?auto_366071 ) ( not ( = ?auto_366065 ?auto_366067 ) ) ( not ( = ?auto_366065 ?auto_366070 ) ) ( not ( = ?auto_366066 ?auto_366064 ) ) ( not ( = ?auto_366066 ?auto_366069 ) ) ( not ( = ?auto_366066 ?auto_366071 ) ) ( not ( = ?auto_366067 ?auto_366068 ) ) ( not ( = ?auto_366067 ?auto_366070 ) ) ( not ( = ?auto_366067 ?auto_366073 ) ) ( not ( = ?auto_366067 ?auto_366077 ) ) ( not ( = ?auto_366064 ?auto_366069 ) ) ( not ( = ?auto_366064 ?auto_366071 ) ) ( not ( = ?auto_366064 ?auto_366074 ) ) ( not ( = ?auto_366068 ?auto_366070 ) ) ( not ( = ?auto_366069 ?auto_366071 ) ) ( not ( = ?auto_366069 ?auto_366074 ) ) ( not ( = ?auto_366070 ?auto_366073 ) ) ( not ( = ?auto_366070 ?auto_366077 ) ) ( not ( = ?auto_366071 ?auto_366074 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_366077 ?auto_366074 ?auto_366065 ?auto_366066 )
      ( GET-4IMAGE-VERIFY ?auto_366065 ?auto_366066 ?auto_366067 ?auto_366064 ?auto_366068 ?auto_366069 ?auto_366070 ?auto_366071 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_366315 - DIRECTION
      ?auto_366316 - MODE
      ?auto_366317 - DIRECTION
      ?auto_366314 - MODE
      ?auto_366318 - DIRECTION
      ?auto_366319 - MODE
    )
    :vars
    (
      ?auto_366324 - INSTRUMENT
      ?auto_366323 - SATELLITE
      ?auto_366321 - DIRECTION
      ?auto_366320 - DIRECTION
      ?auto_366322 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_366324 ?auto_366323 ) ( SUPPORTS ?auto_366324 ?auto_366314 ) ( not ( = ?auto_366317 ?auto_366321 ) ) ( HAVE_IMAGE ?auto_366315 ?auto_366316 ) ( not ( = ?auto_366315 ?auto_366317 ) ) ( not ( = ?auto_366315 ?auto_366321 ) ) ( not ( = ?auto_366316 ?auto_366314 ) ) ( CALIBRATION_TARGET ?auto_366324 ?auto_366321 ) ( POINTING ?auto_366323 ?auto_366320 ) ( not ( = ?auto_366321 ?auto_366320 ) ) ( not ( = ?auto_366317 ?auto_366320 ) ) ( not ( = ?auto_366315 ?auto_366320 ) ) ( ON_BOARD ?auto_366322 ?auto_366323 ) ( POWER_ON ?auto_366322 ) ( not ( = ?auto_366324 ?auto_366322 ) ) ( HAVE_IMAGE ?auto_366318 ?auto_366319 ) ( not ( = ?auto_366315 ?auto_366318 ) ) ( not ( = ?auto_366316 ?auto_366319 ) ) ( not ( = ?auto_366317 ?auto_366318 ) ) ( not ( = ?auto_366314 ?auto_366319 ) ) ( not ( = ?auto_366318 ?auto_366321 ) ) ( not ( = ?auto_366318 ?auto_366320 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_366315 ?auto_366316 ?auto_366317 ?auto_366314 )
      ( GET-3IMAGE-VERIFY ?auto_366315 ?auto_366316 ?auto_366317 ?auto_366314 ?auto_366318 ?auto_366319 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_366530 - DIRECTION
      ?auto_366531 - MODE
      ?auto_366532 - DIRECTION
      ?auto_366529 - MODE
      ?auto_366533 - DIRECTION
      ?auto_366534 - MODE
      ?auto_366535 - DIRECTION
      ?auto_366536 - MODE
    )
    :vars
    (
      ?auto_366541 - INSTRUMENT
      ?auto_366540 - SATELLITE
      ?auto_366538 - DIRECTION
      ?auto_366537 - DIRECTION
      ?auto_366539 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_366541 ?auto_366540 ) ( SUPPORTS ?auto_366541 ?auto_366534 ) ( not ( = ?auto_366533 ?auto_366538 ) ) ( HAVE_IMAGE ?auto_366535 ?auto_366536 ) ( not ( = ?auto_366535 ?auto_366533 ) ) ( not ( = ?auto_366535 ?auto_366538 ) ) ( not ( = ?auto_366536 ?auto_366534 ) ) ( CALIBRATION_TARGET ?auto_366541 ?auto_366538 ) ( POINTING ?auto_366540 ?auto_366537 ) ( not ( = ?auto_366538 ?auto_366537 ) ) ( not ( = ?auto_366533 ?auto_366537 ) ) ( not ( = ?auto_366535 ?auto_366537 ) ) ( ON_BOARD ?auto_366539 ?auto_366540 ) ( POWER_ON ?auto_366539 ) ( not ( = ?auto_366541 ?auto_366539 ) ) ( HAVE_IMAGE ?auto_366530 ?auto_366531 ) ( HAVE_IMAGE ?auto_366532 ?auto_366529 ) ( not ( = ?auto_366530 ?auto_366532 ) ) ( not ( = ?auto_366530 ?auto_366533 ) ) ( not ( = ?auto_366530 ?auto_366535 ) ) ( not ( = ?auto_366530 ?auto_366538 ) ) ( not ( = ?auto_366530 ?auto_366537 ) ) ( not ( = ?auto_366531 ?auto_366529 ) ) ( not ( = ?auto_366531 ?auto_366534 ) ) ( not ( = ?auto_366531 ?auto_366536 ) ) ( not ( = ?auto_366532 ?auto_366533 ) ) ( not ( = ?auto_366532 ?auto_366535 ) ) ( not ( = ?auto_366532 ?auto_366538 ) ) ( not ( = ?auto_366532 ?auto_366537 ) ) ( not ( = ?auto_366529 ?auto_366534 ) ) ( not ( = ?auto_366529 ?auto_366536 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_366535 ?auto_366536 ?auto_366533 ?auto_366534 )
      ( GET-4IMAGE-VERIFY ?auto_366530 ?auto_366531 ?auto_366532 ?auto_366529 ?auto_366533 ?auto_366534 ?auto_366535 ?auto_366536 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_366982 - DIRECTION
      ?auto_366983 - MODE
      ?auto_366984 - DIRECTION
      ?auto_366981 - MODE
      ?auto_366985 - DIRECTION
      ?auto_366986 - MODE
      ?auto_366987 - DIRECTION
      ?auto_366988 - MODE
    )
    :vars
    (
      ?auto_366993 - INSTRUMENT
      ?auto_366992 - SATELLITE
      ?auto_366990 - DIRECTION
      ?auto_366989 - DIRECTION
      ?auto_366991 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_366993 ?auto_366992 ) ( SUPPORTS ?auto_366993 ?auto_366983 ) ( not ( = ?auto_366982 ?auto_366990 ) ) ( HAVE_IMAGE ?auto_366984 ?auto_366981 ) ( not ( = ?auto_366984 ?auto_366982 ) ) ( not ( = ?auto_366984 ?auto_366990 ) ) ( not ( = ?auto_366981 ?auto_366983 ) ) ( CALIBRATION_TARGET ?auto_366993 ?auto_366990 ) ( POINTING ?auto_366992 ?auto_366989 ) ( not ( = ?auto_366990 ?auto_366989 ) ) ( not ( = ?auto_366982 ?auto_366989 ) ) ( not ( = ?auto_366984 ?auto_366989 ) ) ( ON_BOARD ?auto_366991 ?auto_366992 ) ( POWER_ON ?auto_366991 ) ( not ( = ?auto_366993 ?auto_366991 ) ) ( HAVE_IMAGE ?auto_366985 ?auto_366986 ) ( HAVE_IMAGE ?auto_366987 ?auto_366988 ) ( not ( = ?auto_366982 ?auto_366985 ) ) ( not ( = ?auto_366982 ?auto_366987 ) ) ( not ( = ?auto_366983 ?auto_366986 ) ) ( not ( = ?auto_366983 ?auto_366988 ) ) ( not ( = ?auto_366984 ?auto_366985 ) ) ( not ( = ?auto_366984 ?auto_366987 ) ) ( not ( = ?auto_366981 ?auto_366986 ) ) ( not ( = ?auto_366981 ?auto_366988 ) ) ( not ( = ?auto_366985 ?auto_366987 ) ) ( not ( = ?auto_366985 ?auto_366990 ) ) ( not ( = ?auto_366985 ?auto_366989 ) ) ( not ( = ?auto_366986 ?auto_366988 ) ) ( not ( = ?auto_366987 ?auto_366990 ) ) ( not ( = ?auto_366987 ?auto_366989 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_366984 ?auto_366981 ?auto_366982 ?auto_366983 )
      ( GET-4IMAGE-VERIFY ?auto_366982 ?auto_366983 ?auto_366984 ?auto_366981 ?auto_366985 ?auto_366986 ?auto_366987 ?auto_366988 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_367329 - DIRECTION
      ?auto_367330 - MODE
    )
    :vars
    (
      ?auto_367336 - INSTRUMENT
      ?auto_367335 - SATELLITE
      ?auto_367333 - DIRECTION
      ?auto_367331 - DIRECTION
      ?auto_367337 - MODE
      ?auto_367332 - DIRECTION
      ?auto_367334 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_367336 ?auto_367335 ) ( SUPPORTS ?auto_367336 ?auto_367330 ) ( not ( = ?auto_367329 ?auto_367333 ) ) ( HAVE_IMAGE ?auto_367331 ?auto_367337 ) ( not ( = ?auto_367331 ?auto_367329 ) ) ( not ( = ?auto_367331 ?auto_367333 ) ) ( not ( = ?auto_367337 ?auto_367330 ) ) ( CALIBRATION_TARGET ?auto_367336 ?auto_367333 ) ( not ( = ?auto_367333 ?auto_367332 ) ) ( not ( = ?auto_367329 ?auto_367332 ) ) ( not ( = ?auto_367331 ?auto_367332 ) ) ( ON_BOARD ?auto_367334 ?auto_367335 ) ( POWER_ON ?auto_367334 ) ( not ( = ?auto_367336 ?auto_367334 ) ) ( POINTING ?auto_367335 ?auto_367333 ) )
    :subtasks
    ( ( !TURN_TO ?auto_367335 ?auto_367332 ?auto_367333 )
      ( GET-2IMAGE ?auto_367331 ?auto_367337 ?auto_367329 ?auto_367330 )
      ( GET-1IMAGE-VERIFY ?auto_367329 ?auto_367330 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_367339 - DIRECTION
      ?auto_367340 - MODE
      ?auto_367341 - DIRECTION
      ?auto_367338 - MODE
    )
    :vars
    (
      ?auto_367343 - INSTRUMENT
      ?auto_367346 - SATELLITE
      ?auto_367345 - DIRECTION
      ?auto_367344 - DIRECTION
      ?auto_367342 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_367343 ?auto_367346 ) ( SUPPORTS ?auto_367343 ?auto_367338 ) ( not ( = ?auto_367341 ?auto_367345 ) ) ( HAVE_IMAGE ?auto_367339 ?auto_367340 ) ( not ( = ?auto_367339 ?auto_367341 ) ) ( not ( = ?auto_367339 ?auto_367345 ) ) ( not ( = ?auto_367340 ?auto_367338 ) ) ( CALIBRATION_TARGET ?auto_367343 ?auto_367345 ) ( not ( = ?auto_367345 ?auto_367344 ) ) ( not ( = ?auto_367341 ?auto_367344 ) ) ( not ( = ?auto_367339 ?auto_367344 ) ) ( ON_BOARD ?auto_367342 ?auto_367346 ) ( POWER_ON ?auto_367342 ) ( not ( = ?auto_367343 ?auto_367342 ) ) ( POINTING ?auto_367346 ?auto_367345 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_367341 ?auto_367338 )
      ( GET-2IMAGE-VERIFY ?auto_367339 ?auto_367340 ?auto_367341 ?auto_367338 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_367358 - DIRECTION
      ?auto_367359 - MODE
      ?auto_367360 - DIRECTION
      ?auto_367357 - MODE
    )
    :vars
    (
      ?auto_367361 - INSTRUMENT
      ?auto_367365 - SATELLITE
      ?auto_367362 - DIRECTION
      ?auto_367363 - DIRECTION
      ?auto_367364 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_367361 ?auto_367365 ) ( SUPPORTS ?auto_367361 ?auto_367359 ) ( not ( = ?auto_367358 ?auto_367362 ) ) ( HAVE_IMAGE ?auto_367360 ?auto_367357 ) ( not ( = ?auto_367360 ?auto_367358 ) ) ( not ( = ?auto_367360 ?auto_367362 ) ) ( not ( = ?auto_367357 ?auto_367359 ) ) ( CALIBRATION_TARGET ?auto_367361 ?auto_367362 ) ( not ( = ?auto_367362 ?auto_367363 ) ) ( not ( = ?auto_367358 ?auto_367363 ) ) ( not ( = ?auto_367360 ?auto_367363 ) ) ( ON_BOARD ?auto_367364 ?auto_367365 ) ( POWER_ON ?auto_367364 ) ( not ( = ?auto_367361 ?auto_367364 ) ) ( POINTING ?auto_367365 ?auto_367362 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_367360 ?auto_367357 ?auto_367358 ?auto_367359 )
      ( GET-2IMAGE-VERIFY ?auto_367358 ?auto_367359 ?auto_367360 ?auto_367357 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_367388 - DIRECTION
      ?auto_367389 - MODE
      ?auto_367390 - DIRECTION
      ?auto_367387 - MODE
      ?auto_367391 - DIRECTION
      ?auto_367392 - MODE
    )
    :vars
    (
      ?auto_367393 - INSTRUMENT
      ?auto_367397 - SATELLITE
      ?auto_367394 - DIRECTION
      ?auto_367395 - DIRECTION
      ?auto_367396 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_367393 ?auto_367397 ) ( SUPPORTS ?auto_367393 ?auto_367392 ) ( not ( = ?auto_367391 ?auto_367394 ) ) ( HAVE_IMAGE ?auto_367390 ?auto_367387 ) ( not ( = ?auto_367390 ?auto_367391 ) ) ( not ( = ?auto_367390 ?auto_367394 ) ) ( not ( = ?auto_367387 ?auto_367392 ) ) ( CALIBRATION_TARGET ?auto_367393 ?auto_367394 ) ( not ( = ?auto_367394 ?auto_367395 ) ) ( not ( = ?auto_367391 ?auto_367395 ) ) ( not ( = ?auto_367390 ?auto_367395 ) ) ( ON_BOARD ?auto_367396 ?auto_367397 ) ( POWER_ON ?auto_367396 ) ( not ( = ?auto_367393 ?auto_367396 ) ) ( POINTING ?auto_367397 ?auto_367394 ) ( HAVE_IMAGE ?auto_367388 ?auto_367389 ) ( not ( = ?auto_367388 ?auto_367390 ) ) ( not ( = ?auto_367388 ?auto_367391 ) ) ( not ( = ?auto_367388 ?auto_367394 ) ) ( not ( = ?auto_367388 ?auto_367395 ) ) ( not ( = ?auto_367389 ?auto_367387 ) ) ( not ( = ?auto_367389 ?auto_367392 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_367390 ?auto_367387 ?auto_367391 ?auto_367392 )
      ( GET-3IMAGE-VERIFY ?auto_367388 ?auto_367389 ?auto_367390 ?auto_367387 ?auto_367391 ?auto_367392 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_367409 - DIRECTION
      ?auto_367410 - MODE
      ?auto_367411 - DIRECTION
      ?auto_367408 - MODE
      ?auto_367412 - DIRECTION
      ?auto_367413 - MODE
    )
    :vars
    (
      ?auto_367414 - INSTRUMENT
      ?auto_367418 - SATELLITE
      ?auto_367415 - DIRECTION
      ?auto_367416 - DIRECTION
      ?auto_367417 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_367414 ?auto_367418 ) ( SUPPORTS ?auto_367414 ?auto_367408 ) ( not ( = ?auto_367411 ?auto_367415 ) ) ( HAVE_IMAGE ?auto_367412 ?auto_367410 ) ( not ( = ?auto_367412 ?auto_367411 ) ) ( not ( = ?auto_367412 ?auto_367415 ) ) ( not ( = ?auto_367410 ?auto_367408 ) ) ( CALIBRATION_TARGET ?auto_367414 ?auto_367415 ) ( not ( = ?auto_367415 ?auto_367416 ) ) ( not ( = ?auto_367411 ?auto_367416 ) ) ( not ( = ?auto_367412 ?auto_367416 ) ) ( ON_BOARD ?auto_367417 ?auto_367418 ) ( POWER_ON ?auto_367417 ) ( not ( = ?auto_367414 ?auto_367417 ) ) ( POINTING ?auto_367418 ?auto_367415 ) ( HAVE_IMAGE ?auto_367409 ?auto_367410 ) ( HAVE_IMAGE ?auto_367412 ?auto_367413 ) ( not ( = ?auto_367409 ?auto_367411 ) ) ( not ( = ?auto_367409 ?auto_367412 ) ) ( not ( = ?auto_367409 ?auto_367415 ) ) ( not ( = ?auto_367409 ?auto_367416 ) ) ( not ( = ?auto_367410 ?auto_367413 ) ) ( not ( = ?auto_367408 ?auto_367413 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_367412 ?auto_367410 ?auto_367411 ?auto_367408 )
      ( GET-3IMAGE-VERIFY ?auto_367409 ?auto_367410 ?auto_367411 ?auto_367408 ?auto_367412 ?auto_367413 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_399233 - DIRECTION
      ?auto_399234 - MODE
      ?auto_399235 - DIRECTION
      ?auto_399232 - MODE
      ?auto_399236 - DIRECTION
      ?auto_399237 - MODE
    )
    :vars
    (
      ?auto_399238 - INSTRUMENT
      ?auto_399240 - SATELLITE
      ?auto_399241 - DIRECTION
      ?auto_399239 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399238 ?auto_399240 ) ( SUPPORTS ?auto_399238 ?auto_399234 ) ( not ( = ?auto_399233 ?auto_399241 ) ) ( HAVE_IMAGE ?auto_399235 ?auto_399232 ) ( not ( = ?auto_399235 ?auto_399233 ) ) ( not ( = ?auto_399235 ?auto_399241 ) ) ( not ( = ?auto_399232 ?auto_399234 ) ) ( CALIBRATION_TARGET ?auto_399238 ?auto_399241 ) ( not ( = ?auto_399241 ?auto_399236 ) ) ( not ( = ?auto_399233 ?auto_399236 ) ) ( not ( = ?auto_399235 ?auto_399236 ) ) ( ON_BOARD ?auto_399239 ?auto_399240 ) ( POWER_ON ?auto_399239 ) ( not ( = ?auto_399238 ?auto_399239 ) ) ( POINTING ?auto_399240 ?auto_399241 ) ( HAVE_IMAGE ?auto_399236 ?auto_399237 ) ( not ( = ?auto_399234 ?auto_399237 ) ) ( not ( = ?auto_399232 ?auto_399237 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399235 ?auto_399232 ?auto_399233 ?auto_399234 )
      ( GET-3IMAGE-VERIFY ?auto_399233 ?auto_399234 ?auto_399235 ?auto_399232 ?auto_399236 ?auto_399237 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_367599 - DIRECTION
      ?auto_367600 - MODE
      ?auto_367601 - DIRECTION
      ?auto_367598 - MODE
      ?auto_367602 - DIRECTION
      ?auto_367603 - MODE
      ?auto_367604 - DIRECTION
      ?auto_367605 - MODE
    )
    :vars
    (
      ?auto_367606 - INSTRUMENT
      ?auto_367610 - SATELLITE
      ?auto_367607 - DIRECTION
      ?auto_367608 - DIRECTION
      ?auto_367609 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_367606 ?auto_367610 ) ( SUPPORTS ?auto_367606 ?auto_367605 ) ( not ( = ?auto_367604 ?auto_367607 ) ) ( HAVE_IMAGE ?auto_367599 ?auto_367598 ) ( not ( = ?auto_367599 ?auto_367604 ) ) ( not ( = ?auto_367599 ?auto_367607 ) ) ( not ( = ?auto_367598 ?auto_367605 ) ) ( CALIBRATION_TARGET ?auto_367606 ?auto_367607 ) ( not ( = ?auto_367607 ?auto_367608 ) ) ( not ( = ?auto_367604 ?auto_367608 ) ) ( not ( = ?auto_367599 ?auto_367608 ) ) ( ON_BOARD ?auto_367609 ?auto_367610 ) ( POWER_ON ?auto_367609 ) ( not ( = ?auto_367606 ?auto_367609 ) ) ( POINTING ?auto_367610 ?auto_367607 ) ( HAVE_IMAGE ?auto_367599 ?auto_367600 ) ( HAVE_IMAGE ?auto_367601 ?auto_367598 ) ( HAVE_IMAGE ?auto_367602 ?auto_367603 ) ( not ( = ?auto_367599 ?auto_367601 ) ) ( not ( = ?auto_367599 ?auto_367602 ) ) ( not ( = ?auto_367600 ?auto_367598 ) ) ( not ( = ?auto_367600 ?auto_367603 ) ) ( not ( = ?auto_367600 ?auto_367605 ) ) ( not ( = ?auto_367601 ?auto_367602 ) ) ( not ( = ?auto_367601 ?auto_367604 ) ) ( not ( = ?auto_367601 ?auto_367607 ) ) ( not ( = ?auto_367601 ?auto_367608 ) ) ( not ( = ?auto_367598 ?auto_367603 ) ) ( not ( = ?auto_367602 ?auto_367604 ) ) ( not ( = ?auto_367602 ?auto_367607 ) ) ( not ( = ?auto_367602 ?auto_367608 ) ) ( not ( = ?auto_367603 ?auto_367605 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_367599 ?auto_367598 ?auto_367604 ?auto_367605 )
      ( GET-4IMAGE-VERIFY ?auto_367599 ?auto_367600 ?auto_367601 ?auto_367598 ?auto_367602 ?auto_367603 ?auto_367604 ?auto_367605 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_399530 - DIRECTION
      ?auto_399531 - MODE
      ?auto_399532 - DIRECTION
      ?auto_399529 - MODE
      ?auto_399533 - DIRECTION
      ?auto_399534 - MODE
      ?auto_399535 - DIRECTION
      ?auto_399536 - MODE
    )
    :vars
    (
      ?auto_399537 - INSTRUMENT
      ?auto_399539 - SATELLITE
      ?auto_399540 - DIRECTION
      ?auto_399538 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399537 ?auto_399539 ) ( SUPPORTS ?auto_399537 ?auto_399534 ) ( not ( = ?auto_399533 ?auto_399540 ) ) ( HAVE_IMAGE ?auto_399530 ?auto_399536 ) ( not ( = ?auto_399530 ?auto_399533 ) ) ( not ( = ?auto_399530 ?auto_399540 ) ) ( not ( = ?auto_399536 ?auto_399534 ) ) ( CALIBRATION_TARGET ?auto_399537 ?auto_399540 ) ( not ( = ?auto_399540 ?auto_399532 ) ) ( not ( = ?auto_399533 ?auto_399532 ) ) ( not ( = ?auto_399530 ?auto_399532 ) ) ( ON_BOARD ?auto_399538 ?auto_399539 ) ( POWER_ON ?auto_399538 ) ( not ( = ?auto_399537 ?auto_399538 ) ) ( POINTING ?auto_399539 ?auto_399540 ) ( HAVE_IMAGE ?auto_399530 ?auto_399531 ) ( HAVE_IMAGE ?auto_399532 ?auto_399529 ) ( HAVE_IMAGE ?auto_399535 ?auto_399536 ) ( not ( = ?auto_399530 ?auto_399535 ) ) ( not ( = ?auto_399531 ?auto_399529 ) ) ( not ( = ?auto_399531 ?auto_399534 ) ) ( not ( = ?auto_399531 ?auto_399536 ) ) ( not ( = ?auto_399532 ?auto_399535 ) ) ( not ( = ?auto_399529 ?auto_399534 ) ) ( not ( = ?auto_399529 ?auto_399536 ) ) ( not ( = ?auto_399533 ?auto_399535 ) ) ( not ( = ?auto_399535 ?auto_399540 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399530 ?auto_399536 ?auto_399533 ?auto_399534 )
      ( GET-4IMAGE-VERIFY ?auto_399530 ?auto_399531 ?auto_399532 ?auto_399529 ?auto_399533 ?auto_399534 ?auto_399535 ?auto_399536 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_399718 - DIRECTION
      ?auto_399719 - MODE
      ?auto_399720 - DIRECTION
      ?auto_399717 - MODE
      ?auto_399721 - DIRECTION
      ?auto_399722 - MODE
      ?auto_399723 - DIRECTION
      ?auto_399724 - MODE
    )
    :vars
    (
      ?auto_399725 - INSTRUMENT
      ?auto_399727 - SATELLITE
      ?auto_399728 - DIRECTION
      ?auto_399726 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399725 ?auto_399727 ) ( SUPPORTS ?auto_399725 ?auto_399717 ) ( not ( = ?auto_399720 ?auto_399728 ) ) ( HAVE_IMAGE ?auto_399718 ?auto_399724 ) ( not ( = ?auto_399718 ?auto_399720 ) ) ( not ( = ?auto_399718 ?auto_399728 ) ) ( not ( = ?auto_399724 ?auto_399717 ) ) ( CALIBRATION_TARGET ?auto_399725 ?auto_399728 ) ( not ( = ?auto_399728 ?auto_399721 ) ) ( not ( = ?auto_399720 ?auto_399721 ) ) ( not ( = ?auto_399718 ?auto_399721 ) ) ( ON_BOARD ?auto_399726 ?auto_399727 ) ( POWER_ON ?auto_399726 ) ( not ( = ?auto_399725 ?auto_399726 ) ) ( POINTING ?auto_399727 ?auto_399728 ) ( HAVE_IMAGE ?auto_399718 ?auto_399719 ) ( HAVE_IMAGE ?auto_399721 ?auto_399722 ) ( HAVE_IMAGE ?auto_399723 ?auto_399724 ) ( not ( = ?auto_399718 ?auto_399723 ) ) ( not ( = ?auto_399719 ?auto_399717 ) ) ( not ( = ?auto_399719 ?auto_399722 ) ) ( not ( = ?auto_399719 ?auto_399724 ) ) ( not ( = ?auto_399720 ?auto_399723 ) ) ( not ( = ?auto_399717 ?auto_399722 ) ) ( not ( = ?auto_399721 ?auto_399723 ) ) ( not ( = ?auto_399722 ?auto_399724 ) ) ( not ( = ?auto_399723 ?auto_399728 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399718 ?auto_399724 ?auto_399720 ?auto_399717 )
      ( GET-4IMAGE-VERIFY ?auto_399718 ?auto_399719 ?auto_399720 ?auto_399717 ?auto_399721 ?auto_399722 ?auto_399723 ?auto_399724 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_400914 - DIRECTION
      ?auto_400915 - MODE
      ?auto_400916 - DIRECTION
      ?auto_400913 - MODE
      ?auto_400917 - DIRECTION
      ?auto_400918 - MODE
      ?auto_400919 - DIRECTION
      ?auto_400920 - MODE
    )
    :vars
    (
      ?auto_400921 - INSTRUMENT
      ?auto_400923 - SATELLITE
      ?auto_400924 - DIRECTION
      ?auto_400922 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_400921 ?auto_400923 ) ( SUPPORTS ?auto_400921 ?auto_400915 ) ( not ( = ?auto_400914 ?auto_400924 ) ) ( HAVE_IMAGE ?auto_400916 ?auto_400913 ) ( not ( = ?auto_400916 ?auto_400914 ) ) ( not ( = ?auto_400916 ?auto_400924 ) ) ( not ( = ?auto_400913 ?auto_400915 ) ) ( CALIBRATION_TARGET ?auto_400921 ?auto_400924 ) ( not ( = ?auto_400924 ?auto_400917 ) ) ( not ( = ?auto_400914 ?auto_400917 ) ) ( not ( = ?auto_400916 ?auto_400917 ) ) ( ON_BOARD ?auto_400922 ?auto_400923 ) ( POWER_ON ?auto_400922 ) ( not ( = ?auto_400921 ?auto_400922 ) ) ( POINTING ?auto_400923 ?auto_400924 ) ( HAVE_IMAGE ?auto_400917 ?auto_400918 ) ( HAVE_IMAGE ?auto_400919 ?auto_400920 ) ( not ( = ?auto_400914 ?auto_400919 ) ) ( not ( = ?auto_400915 ?auto_400918 ) ) ( not ( = ?auto_400915 ?auto_400920 ) ) ( not ( = ?auto_400916 ?auto_400919 ) ) ( not ( = ?auto_400913 ?auto_400918 ) ) ( not ( = ?auto_400913 ?auto_400920 ) ) ( not ( = ?auto_400917 ?auto_400919 ) ) ( not ( = ?auto_400918 ?auto_400920 ) ) ( not ( = ?auto_400919 ?auto_400924 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_400916 ?auto_400913 ?auto_400914 ?auto_400915 )
      ( GET-4IMAGE-VERIFY ?auto_400914 ?auto_400915 ?auto_400916 ?auto_400913 ?auto_400917 ?auto_400918 ?auto_400919 ?auto_400920 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_369555 - DIRECTION
      ?auto_369556 - MODE
      ?auto_369557 - DIRECTION
      ?auto_369554 - MODE
      ?auto_369558 - DIRECTION
      ?auto_369559 - MODE
    )
    :vars
    (
      ?auto_369562 - INSTRUMENT
      ?auto_369560 - SATELLITE
      ?auto_369561 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_369562 ?auto_369560 ) ( SUPPORTS ?auto_369562 ?auto_369559 ) ( POINTING ?auto_369560 ?auto_369561 ) ( not ( = ?auto_369558 ?auto_369561 ) ) ( HAVE_IMAGE ?auto_369555 ?auto_369554 ) ( not ( = ?auto_369555 ?auto_369558 ) ) ( not ( = ?auto_369555 ?auto_369561 ) ) ( not ( = ?auto_369554 ?auto_369559 ) ) ( CALIBRATION_TARGET ?auto_369562 ?auto_369561 ) ( POWER_AVAIL ?auto_369560 ) ( HAVE_IMAGE ?auto_369555 ?auto_369556 ) ( HAVE_IMAGE ?auto_369557 ?auto_369554 ) ( not ( = ?auto_369555 ?auto_369557 ) ) ( not ( = ?auto_369556 ?auto_369554 ) ) ( not ( = ?auto_369556 ?auto_369559 ) ) ( not ( = ?auto_369557 ?auto_369558 ) ) ( not ( = ?auto_369557 ?auto_369561 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_369555 ?auto_369554 ?auto_369558 ?auto_369559 )
      ( GET-3IMAGE-VERIFY ?auto_369555 ?auto_369556 ?auto_369557 ?auto_369554 ?auto_369558 ?auto_369559 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_369573 - DIRECTION
      ?auto_369574 - MODE
      ?auto_369575 - DIRECTION
      ?auto_369572 - MODE
      ?auto_369576 - DIRECTION
      ?auto_369577 - MODE
    )
    :vars
    (
      ?auto_369580 - INSTRUMENT
      ?auto_369578 - SATELLITE
      ?auto_369579 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_369580 ?auto_369578 ) ( SUPPORTS ?auto_369580 ?auto_369572 ) ( POINTING ?auto_369578 ?auto_369579 ) ( not ( = ?auto_369575 ?auto_369579 ) ) ( HAVE_IMAGE ?auto_369576 ?auto_369574 ) ( not ( = ?auto_369576 ?auto_369575 ) ) ( not ( = ?auto_369576 ?auto_369579 ) ) ( not ( = ?auto_369574 ?auto_369572 ) ) ( CALIBRATION_TARGET ?auto_369580 ?auto_369579 ) ( POWER_AVAIL ?auto_369578 ) ( HAVE_IMAGE ?auto_369573 ?auto_369574 ) ( HAVE_IMAGE ?auto_369576 ?auto_369577 ) ( not ( = ?auto_369573 ?auto_369575 ) ) ( not ( = ?auto_369573 ?auto_369576 ) ) ( not ( = ?auto_369573 ?auto_369579 ) ) ( not ( = ?auto_369574 ?auto_369577 ) ) ( not ( = ?auto_369572 ?auto_369577 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_369576 ?auto_369574 ?auto_369575 ?auto_369572 )
      ( GET-3IMAGE-VERIFY ?auto_369573 ?auto_369574 ?auto_369575 ?auto_369572 ?auto_369576 ?auto_369577 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_369651 - DIRECTION
      ?auto_369652 - MODE
      ?auto_369653 - DIRECTION
      ?auto_369650 - MODE
      ?auto_369654 - DIRECTION
      ?auto_369655 - MODE
    )
    :vars
    (
      ?auto_369658 - INSTRUMENT
      ?auto_369656 - SATELLITE
      ?auto_369657 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_369658 ?auto_369656 ) ( SUPPORTS ?auto_369658 ?auto_369652 ) ( POINTING ?auto_369656 ?auto_369657 ) ( not ( = ?auto_369651 ?auto_369657 ) ) ( HAVE_IMAGE ?auto_369653 ?auto_369655 ) ( not ( = ?auto_369653 ?auto_369651 ) ) ( not ( = ?auto_369653 ?auto_369657 ) ) ( not ( = ?auto_369655 ?auto_369652 ) ) ( CALIBRATION_TARGET ?auto_369658 ?auto_369657 ) ( POWER_AVAIL ?auto_369656 ) ( HAVE_IMAGE ?auto_369653 ?auto_369650 ) ( HAVE_IMAGE ?auto_369654 ?auto_369655 ) ( not ( = ?auto_369651 ?auto_369654 ) ) ( not ( = ?auto_369652 ?auto_369650 ) ) ( not ( = ?auto_369653 ?auto_369654 ) ) ( not ( = ?auto_369650 ?auto_369655 ) ) ( not ( = ?auto_369654 ?auto_369657 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_369653 ?auto_369655 ?auto_369651 ?auto_369652 )
      ( GET-3IMAGE-VERIFY ?auto_369651 ?auto_369652 ?auto_369653 ?auto_369650 ?auto_369654 ?auto_369655 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_370522 - DIRECTION
      ?auto_370523 - MODE
      ?auto_370524 - DIRECTION
      ?auto_370521 - MODE
      ?auto_370525 - DIRECTION
      ?auto_370526 - MODE
    )
    :vars
    (
      ?auto_370529 - INSTRUMENT
      ?auto_370527 - SATELLITE
      ?auto_370528 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_370529 ?auto_370527 ) ( SUPPORTS ?auto_370529 ?auto_370526 ) ( not ( = ?auto_370525 ?auto_370528 ) ) ( HAVE_IMAGE ?auto_370522 ?auto_370521 ) ( not ( = ?auto_370522 ?auto_370525 ) ) ( not ( = ?auto_370522 ?auto_370528 ) ) ( not ( = ?auto_370521 ?auto_370526 ) ) ( CALIBRATION_TARGET ?auto_370529 ?auto_370528 ) ( POWER_AVAIL ?auto_370527 ) ( POINTING ?auto_370527 ?auto_370522 ) ( HAVE_IMAGE ?auto_370522 ?auto_370523 ) ( HAVE_IMAGE ?auto_370524 ?auto_370521 ) ( not ( = ?auto_370522 ?auto_370524 ) ) ( not ( = ?auto_370523 ?auto_370521 ) ) ( not ( = ?auto_370523 ?auto_370526 ) ) ( not ( = ?auto_370524 ?auto_370525 ) ) ( not ( = ?auto_370524 ?auto_370528 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_370522 ?auto_370521 ?auto_370525 ?auto_370526 )
      ( GET-3IMAGE-VERIFY ?auto_370522 ?auto_370523 ?auto_370524 ?auto_370521 ?auto_370525 ?auto_370526 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_370540 - DIRECTION
      ?auto_370541 - MODE
      ?auto_370542 - DIRECTION
      ?auto_370539 - MODE
      ?auto_370543 - DIRECTION
      ?auto_370544 - MODE
    )
    :vars
    (
      ?auto_370547 - INSTRUMENT
      ?auto_370545 - SATELLITE
      ?auto_370546 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_370547 ?auto_370545 ) ( SUPPORTS ?auto_370547 ?auto_370539 ) ( not ( = ?auto_370542 ?auto_370546 ) ) ( HAVE_IMAGE ?auto_370543 ?auto_370544 ) ( not ( = ?auto_370543 ?auto_370542 ) ) ( not ( = ?auto_370543 ?auto_370546 ) ) ( not ( = ?auto_370544 ?auto_370539 ) ) ( CALIBRATION_TARGET ?auto_370547 ?auto_370546 ) ( POWER_AVAIL ?auto_370545 ) ( POINTING ?auto_370545 ?auto_370543 ) ( HAVE_IMAGE ?auto_370540 ?auto_370541 ) ( not ( = ?auto_370540 ?auto_370542 ) ) ( not ( = ?auto_370540 ?auto_370543 ) ) ( not ( = ?auto_370540 ?auto_370546 ) ) ( not ( = ?auto_370541 ?auto_370539 ) ) ( not ( = ?auto_370541 ?auto_370544 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_370543 ?auto_370544 ?auto_370542 ?auto_370539 )
      ( GET-3IMAGE-VERIFY ?auto_370540 ?auto_370541 ?auto_370542 ?auto_370539 ?auto_370543 ?auto_370544 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_370707 - DIRECTION
      ?auto_370708 - MODE
      ?auto_370709 - DIRECTION
      ?auto_370706 - MODE
      ?auto_370710 - DIRECTION
      ?auto_370711 - MODE
      ?auto_370712 - DIRECTION
      ?auto_370713 - MODE
    )
    :vars
    (
      ?auto_370716 - INSTRUMENT
      ?auto_370714 - SATELLITE
      ?auto_370715 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_370716 ?auto_370714 ) ( SUPPORTS ?auto_370716 ?auto_370713 ) ( not ( = ?auto_370712 ?auto_370715 ) ) ( HAVE_IMAGE ?auto_370710 ?auto_370711 ) ( not ( = ?auto_370710 ?auto_370712 ) ) ( not ( = ?auto_370710 ?auto_370715 ) ) ( not ( = ?auto_370711 ?auto_370713 ) ) ( CALIBRATION_TARGET ?auto_370716 ?auto_370715 ) ( POWER_AVAIL ?auto_370714 ) ( POINTING ?auto_370714 ?auto_370710 ) ( HAVE_IMAGE ?auto_370707 ?auto_370708 ) ( HAVE_IMAGE ?auto_370709 ?auto_370706 ) ( not ( = ?auto_370707 ?auto_370709 ) ) ( not ( = ?auto_370707 ?auto_370710 ) ) ( not ( = ?auto_370707 ?auto_370712 ) ) ( not ( = ?auto_370707 ?auto_370715 ) ) ( not ( = ?auto_370708 ?auto_370706 ) ) ( not ( = ?auto_370708 ?auto_370711 ) ) ( not ( = ?auto_370708 ?auto_370713 ) ) ( not ( = ?auto_370709 ?auto_370710 ) ) ( not ( = ?auto_370709 ?auto_370712 ) ) ( not ( = ?auto_370709 ?auto_370715 ) ) ( not ( = ?auto_370706 ?auto_370711 ) ) ( not ( = ?auto_370706 ?auto_370713 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_370710 ?auto_370711 ?auto_370712 ?auto_370713 )
      ( GET-4IMAGE-VERIFY ?auto_370707 ?auto_370708 ?auto_370709 ?auto_370706 ?auto_370710 ?auto_370711 ?auto_370712 ?auto_370713 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_370817 - DIRECTION
      ?auto_370818 - MODE
      ?auto_370819 - DIRECTION
      ?auto_370816 - MODE
      ?auto_370820 - DIRECTION
      ?auto_370821 - MODE
      ?auto_370822 - DIRECTION
      ?auto_370823 - MODE
    )
    :vars
    (
      ?auto_370826 - INSTRUMENT
      ?auto_370824 - SATELLITE
      ?auto_370825 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_370826 ?auto_370824 ) ( SUPPORTS ?auto_370826 ?auto_370816 ) ( not ( = ?auto_370819 ?auto_370825 ) ) ( HAVE_IMAGE ?auto_370817 ?auto_370823 ) ( not ( = ?auto_370817 ?auto_370819 ) ) ( not ( = ?auto_370817 ?auto_370825 ) ) ( not ( = ?auto_370823 ?auto_370816 ) ) ( CALIBRATION_TARGET ?auto_370826 ?auto_370825 ) ( POWER_AVAIL ?auto_370824 ) ( POINTING ?auto_370824 ?auto_370817 ) ( HAVE_IMAGE ?auto_370817 ?auto_370818 ) ( HAVE_IMAGE ?auto_370820 ?auto_370821 ) ( HAVE_IMAGE ?auto_370822 ?auto_370823 ) ( not ( = ?auto_370817 ?auto_370820 ) ) ( not ( = ?auto_370817 ?auto_370822 ) ) ( not ( = ?auto_370818 ?auto_370816 ) ) ( not ( = ?auto_370818 ?auto_370821 ) ) ( not ( = ?auto_370818 ?auto_370823 ) ) ( not ( = ?auto_370819 ?auto_370820 ) ) ( not ( = ?auto_370819 ?auto_370822 ) ) ( not ( = ?auto_370816 ?auto_370821 ) ) ( not ( = ?auto_370820 ?auto_370822 ) ) ( not ( = ?auto_370820 ?auto_370825 ) ) ( not ( = ?auto_370821 ?auto_370823 ) ) ( not ( = ?auto_370822 ?auto_370825 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_370817 ?auto_370823 ?auto_370819 ?auto_370816 )
      ( GET-4IMAGE-VERIFY ?auto_370817 ?auto_370818 ?auto_370819 ?auto_370816 ?auto_370820 ?auto_370821 ?auto_370822 ?auto_370823 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_371139 - DIRECTION
      ?auto_371140 - MODE
      ?auto_371141 - DIRECTION
      ?auto_371138 - MODE
      ?auto_371142 - DIRECTION
      ?auto_371143 - MODE
      ?auto_371144 - DIRECTION
      ?auto_371145 - MODE
    )
    :vars
    (
      ?auto_371148 - INSTRUMENT
      ?auto_371146 - SATELLITE
      ?auto_371147 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_371148 ?auto_371146 ) ( SUPPORTS ?auto_371148 ?auto_371140 ) ( not ( = ?auto_371139 ?auto_371147 ) ) ( HAVE_IMAGE ?auto_371141 ?auto_371138 ) ( not ( = ?auto_371141 ?auto_371139 ) ) ( not ( = ?auto_371141 ?auto_371147 ) ) ( not ( = ?auto_371138 ?auto_371140 ) ) ( CALIBRATION_TARGET ?auto_371148 ?auto_371147 ) ( POWER_AVAIL ?auto_371146 ) ( POINTING ?auto_371146 ?auto_371141 ) ( HAVE_IMAGE ?auto_371142 ?auto_371143 ) ( HAVE_IMAGE ?auto_371144 ?auto_371145 ) ( not ( = ?auto_371139 ?auto_371142 ) ) ( not ( = ?auto_371139 ?auto_371144 ) ) ( not ( = ?auto_371140 ?auto_371143 ) ) ( not ( = ?auto_371140 ?auto_371145 ) ) ( not ( = ?auto_371141 ?auto_371142 ) ) ( not ( = ?auto_371141 ?auto_371144 ) ) ( not ( = ?auto_371138 ?auto_371143 ) ) ( not ( = ?auto_371138 ?auto_371145 ) ) ( not ( = ?auto_371142 ?auto_371144 ) ) ( not ( = ?auto_371142 ?auto_371147 ) ) ( not ( = ?auto_371143 ?auto_371145 ) ) ( not ( = ?auto_371144 ?auto_371147 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_371141 ?auto_371138 ?auto_371139 ?auto_371140 )
      ( GET-4IMAGE-VERIFY ?auto_371139 ?auto_371140 ?auto_371141 ?auto_371138 ?auto_371142 ?auto_371143 ?auto_371144 ?auto_371145 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_371492 - DIRECTION
      ?auto_371493 - MODE
      ?auto_371494 - DIRECTION
      ?auto_371491 - MODE
      ?auto_371495 - DIRECTION
      ?auto_371496 - MODE
    )
    :vars
    (
      ?auto_371499 - INSTRUMENT
      ?auto_371500 - SATELLITE
      ?auto_371498 - DIRECTION
      ?auto_371497 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_371499 ?auto_371500 ) ( SUPPORTS ?auto_371499 ?auto_371496 ) ( not ( = ?auto_371495 ?auto_371498 ) ) ( HAVE_IMAGE ?auto_371492 ?auto_371491 ) ( not ( = ?auto_371492 ?auto_371495 ) ) ( not ( = ?auto_371492 ?auto_371498 ) ) ( not ( = ?auto_371491 ?auto_371496 ) ) ( CALIBRATION_TARGET ?auto_371499 ?auto_371498 ) ( POINTING ?auto_371500 ?auto_371492 ) ( ON_BOARD ?auto_371497 ?auto_371500 ) ( POWER_ON ?auto_371497 ) ( not ( = ?auto_371499 ?auto_371497 ) ) ( HAVE_IMAGE ?auto_371492 ?auto_371493 ) ( HAVE_IMAGE ?auto_371494 ?auto_371491 ) ( not ( = ?auto_371492 ?auto_371494 ) ) ( not ( = ?auto_371493 ?auto_371491 ) ) ( not ( = ?auto_371493 ?auto_371496 ) ) ( not ( = ?auto_371494 ?auto_371495 ) ) ( not ( = ?auto_371494 ?auto_371498 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_371492 ?auto_371491 ?auto_371495 ?auto_371496 )
      ( GET-3IMAGE-VERIFY ?auto_371492 ?auto_371493 ?auto_371494 ?auto_371491 ?auto_371495 ?auto_371496 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_371512 - DIRECTION
      ?auto_371513 - MODE
      ?auto_371514 - DIRECTION
      ?auto_371511 - MODE
      ?auto_371515 - DIRECTION
      ?auto_371516 - MODE
    )
    :vars
    (
      ?auto_371519 - INSTRUMENT
      ?auto_371520 - SATELLITE
      ?auto_371518 - DIRECTION
      ?auto_371517 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_371519 ?auto_371520 ) ( SUPPORTS ?auto_371519 ?auto_371511 ) ( not ( = ?auto_371514 ?auto_371518 ) ) ( HAVE_IMAGE ?auto_371515 ?auto_371516 ) ( not ( = ?auto_371515 ?auto_371514 ) ) ( not ( = ?auto_371515 ?auto_371518 ) ) ( not ( = ?auto_371516 ?auto_371511 ) ) ( CALIBRATION_TARGET ?auto_371519 ?auto_371518 ) ( POINTING ?auto_371520 ?auto_371515 ) ( ON_BOARD ?auto_371517 ?auto_371520 ) ( POWER_ON ?auto_371517 ) ( not ( = ?auto_371519 ?auto_371517 ) ) ( HAVE_IMAGE ?auto_371512 ?auto_371513 ) ( not ( = ?auto_371512 ?auto_371514 ) ) ( not ( = ?auto_371512 ?auto_371515 ) ) ( not ( = ?auto_371512 ?auto_371518 ) ) ( not ( = ?auto_371513 ?auto_371511 ) ) ( not ( = ?auto_371513 ?auto_371516 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_371515 ?auto_371516 ?auto_371514 ?auto_371511 )
      ( GET-3IMAGE-VERIFY ?auto_371512 ?auto_371513 ?auto_371514 ?auto_371511 ?auto_371515 ?auto_371516 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_371598 - DIRECTION
      ?auto_371599 - MODE
      ?auto_371600 - DIRECTION
      ?auto_371597 - MODE
      ?auto_371601 - DIRECTION
      ?auto_371602 - MODE
    )
    :vars
    (
      ?auto_371605 - INSTRUMENT
      ?auto_371606 - SATELLITE
      ?auto_371604 - DIRECTION
      ?auto_371603 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_371605 ?auto_371606 ) ( SUPPORTS ?auto_371605 ?auto_371599 ) ( not ( = ?auto_371598 ?auto_371604 ) ) ( HAVE_IMAGE ?auto_371600 ?auto_371602 ) ( not ( = ?auto_371600 ?auto_371598 ) ) ( not ( = ?auto_371600 ?auto_371604 ) ) ( not ( = ?auto_371602 ?auto_371599 ) ) ( CALIBRATION_TARGET ?auto_371605 ?auto_371604 ) ( POINTING ?auto_371606 ?auto_371600 ) ( ON_BOARD ?auto_371603 ?auto_371606 ) ( POWER_ON ?auto_371603 ) ( not ( = ?auto_371605 ?auto_371603 ) ) ( HAVE_IMAGE ?auto_371600 ?auto_371597 ) ( HAVE_IMAGE ?auto_371601 ?auto_371602 ) ( not ( = ?auto_371598 ?auto_371601 ) ) ( not ( = ?auto_371599 ?auto_371597 ) ) ( not ( = ?auto_371600 ?auto_371601 ) ) ( not ( = ?auto_371597 ?auto_371602 ) ) ( not ( = ?auto_371601 ?auto_371604 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_371600 ?auto_371602 ?auto_371598 ?auto_371599 )
      ( GET-3IMAGE-VERIFY ?auto_371598 ?auto_371599 ?auto_371600 ?auto_371597 ?auto_371601 ?auto_371602 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_371696 - DIRECTION
      ?auto_371697 - MODE
      ?auto_371698 - DIRECTION
      ?auto_371695 - MODE
      ?auto_371699 - DIRECTION
      ?auto_371700 - MODE
      ?auto_371701 - DIRECTION
      ?auto_371702 - MODE
    )
    :vars
    (
      ?auto_371705 - INSTRUMENT
      ?auto_371706 - SATELLITE
      ?auto_371704 - DIRECTION
      ?auto_371703 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_371705 ?auto_371706 ) ( SUPPORTS ?auto_371705 ?auto_371702 ) ( not ( = ?auto_371701 ?auto_371704 ) ) ( HAVE_IMAGE ?auto_371696 ?auto_371695 ) ( not ( = ?auto_371696 ?auto_371701 ) ) ( not ( = ?auto_371696 ?auto_371704 ) ) ( not ( = ?auto_371695 ?auto_371702 ) ) ( CALIBRATION_TARGET ?auto_371705 ?auto_371704 ) ( POINTING ?auto_371706 ?auto_371696 ) ( ON_BOARD ?auto_371703 ?auto_371706 ) ( POWER_ON ?auto_371703 ) ( not ( = ?auto_371705 ?auto_371703 ) ) ( HAVE_IMAGE ?auto_371696 ?auto_371697 ) ( HAVE_IMAGE ?auto_371698 ?auto_371695 ) ( HAVE_IMAGE ?auto_371699 ?auto_371700 ) ( not ( = ?auto_371696 ?auto_371698 ) ) ( not ( = ?auto_371696 ?auto_371699 ) ) ( not ( = ?auto_371697 ?auto_371695 ) ) ( not ( = ?auto_371697 ?auto_371700 ) ) ( not ( = ?auto_371697 ?auto_371702 ) ) ( not ( = ?auto_371698 ?auto_371699 ) ) ( not ( = ?auto_371698 ?auto_371701 ) ) ( not ( = ?auto_371698 ?auto_371704 ) ) ( not ( = ?auto_371695 ?auto_371700 ) ) ( not ( = ?auto_371699 ?auto_371701 ) ) ( not ( = ?auto_371699 ?auto_371704 ) ) ( not ( = ?auto_371700 ?auto_371702 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_371696 ?auto_371695 ?auto_371701 ?auto_371702 )
      ( GET-4IMAGE-VERIFY ?auto_371696 ?auto_371697 ?auto_371698 ?auto_371695 ?auto_371699 ?auto_371700 ?auto_371701 ?auto_371702 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_371720 - DIRECTION
      ?auto_371721 - MODE
      ?auto_371722 - DIRECTION
      ?auto_371719 - MODE
      ?auto_371723 - DIRECTION
      ?auto_371724 - MODE
      ?auto_371725 - DIRECTION
      ?auto_371726 - MODE
    )
    :vars
    (
      ?auto_371729 - INSTRUMENT
      ?auto_371730 - SATELLITE
      ?auto_371728 - DIRECTION
      ?auto_371727 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_371729 ?auto_371730 ) ( SUPPORTS ?auto_371729 ?auto_371724 ) ( not ( = ?auto_371723 ?auto_371728 ) ) ( HAVE_IMAGE ?auto_371720 ?auto_371726 ) ( not ( = ?auto_371720 ?auto_371723 ) ) ( not ( = ?auto_371720 ?auto_371728 ) ) ( not ( = ?auto_371726 ?auto_371724 ) ) ( CALIBRATION_TARGET ?auto_371729 ?auto_371728 ) ( POINTING ?auto_371730 ?auto_371720 ) ( ON_BOARD ?auto_371727 ?auto_371730 ) ( POWER_ON ?auto_371727 ) ( not ( = ?auto_371729 ?auto_371727 ) ) ( HAVE_IMAGE ?auto_371720 ?auto_371721 ) ( HAVE_IMAGE ?auto_371722 ?auto_371719 ) ( HAVE_IMAGE ?auto_371725 ?auto_371726 ) ( not ( = ?auto_371720 ?auto_371722 ) ) ( not ( = ?auto_371720 ?auto_371725 ) ) ( not ( = ?auto_371721 ?auto_371719 ) ) ( not ( = ?auto_371721 ?auto_371724 ) ) ( not ( = ?auto_371721 ?auto_371726 ) ) ( not ( = ?auto_371722 ?auto_371723 ) ) ( not ( = ?auto_371722 ?auto_371725 ) ) ( not ( = ?auto_371722 ?auto_371728 ) ) ( not ( = ?auto_371719 ?auto_371724 ) ) ( not ( = ?auto_371719 ?auto_371726 ) ) ( not ( = ?auto_371723 ?auto_371725 ) ) ( not ( = ?auto_371725 ?auto_371728 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_371720 ?auto_371726 ?auto_371723 ?auto_371724 )
      ( GET-4IMAGE-VERIFY ?auto_371720 ?auto_371721 ?auto_371722 ?auto_371719 ?auto_371723 ?auto_371724 ?auto_371725 ?auto_371726 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_371816 - DIRECTION
      ?auto_371817 - MODE
      ?auto_371818 - DIRECTION
      ?auto_371815 - MODE
      ?auto_371819 - DIRECTION
      ?auto_371820 - MODE
      ?auto_371821 - DIRECTION
      ?auto_371822 - MODE
    )
    :vars
    (
      ?auto_371825 - INSTRUMENT
      ?auto_371826 - SATELLITE
      ?auto_371824 - DIRECTION
      ?auto_371823 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_371825 ?auto_371826 ) ( SUPPORTS ?auto_371825 ?auto_371815 ) ( not ( = ?auto_371818 ?auto_371824 ) ) ( HAVE_IMAGE ?auto_371816 ?auto_371817 ) ( not ( = ?auto_371816 ?auto_371818 ) ) ( not ( = ?auto_371816 ?auto_371824 ) ) ( not ( = ?auto_371817 ?auto_371815 ) ) ( CALIBRATION_TARGET ?auto_371825 ?auto_371824 ) ( POINTING ?auto_371826 ?auto_371816 ) ( ON_BOARD ?auto_371823 ?auto_371826 ) ( POWER_ON ?auto_371823 ) ( not ( = ?auto_371825 ?auto_371823 ) ) ( HAVE_IMAGE ?auto_371819 ?auto_371820 ) ( HAVE_IMAGE ?auto_371821 ?auto_371822 ) ( not ( = ?auto_371816 ?auto_371819 ) ) ( not ( = ?auto_371816 ?auto_371821 ) ) ( not ( = ?auto_371817 ?auto_371820 ) ) ( not ( = ?auto_371817 ?auto_371822 ) ) ( not ( = ?auto_371818 ?auto_371819 ) ) ( not ( = ?auto_371818 ?auto_371821 ) ) ( not ( = ?auto_371815 ?auto_371820 ) ) ( not ( = ?auto_371815 ?auto_371822 ) ) ( not ( = ?auto_371819 ?auto_371821 ) ) ( not ( = ?auto_371819 ?auto_371824 ) ) ( not ( = ?auto_371820 ?auto_371822 ) ) ( not ( = ?auto_371821 ?auto_371824 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_371816 ?auto_371817 ?auto_371818 ?auto_371815 )
      ( GET-4IMAGE-VERIFY ?auto_371816 ?auto_371817 ?auto_371818 ?auto_371815 ?auto_371819 ?auto_371820 ?auto_371821 ?auto_371822 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_372166 - DIRECTION
      ?auto_372167 - MODE
      ?auto_372168 - DIRECTION
      ?auto_372165 - MODE
      ?auto_372169 - DIRECTION
      ?auto_372170 - MODE
      ?auto_372171 - DIRECTION
      ?auto_372172 - MODE
    )
    :vars
    (
      ?auto_372175 - INSTRUMENT
      ?auto_372176 - SATELLITE
      ?auto_372174 - DIRECTION
      ?auto_372173 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_372175 ?auto_372176 ) ( SUPPORTS ?auto_372175 ?auto_372167 ) ( not ( = ?auto_372166 ?auto_372174 ) ) ( HAVE_IMAGE ?auto_372171 ?auto_372172 ) ( not ( = ?auto_372171 ?auto_372166 ) ) ( not ( = ?auto_372171 ?auto_372174 ) ) ( not ( = ?auto_372172 ?auto_372167 ) ) ( CALIBRATION_TARGET ?auto_372175 ?auto_372174 ) ( POINTING ?auto_372176 ?auto_372171 ) ( ON_BOARD ?auto_372173 ?auto_372176 ) ( POWER_ON ?auto_372173 ) ( not ( = ?auto_372175 ?auto_372173 ) ) ( HAVE_IMAGE ?auto_372168 ?auto_372165 ) ( HAVE_IMAGE ?auto_372169 ?auto_372170 ) ( not ( = ?auto_372166 ?auto_372168 ) ) ( not ( = ?auto_372166 ?auto_372169 ) ) ( not ( = ?auto_372167 ?auto_372165 ) ) ( not ( = ?auto_372167 ?auto_372170 ) ) ( not ( = ?auto_372168 ?auto_372169 ) ) ( not ( = ?auto_372168 ?auto_372171 ) ) ( not ( = ?auto_372168 ?auto_372174 ) ) ( not ( = ?auto_372165 ?auto_372170 ) ) ( not ( = ?auto_372165 ?auto_372172 ) ) ( not ( = ?auto_372169 ?auto_372171 ) ) ( not ( = ?auto_372169 ?auto_372174 ) ) ( not ( = ?auto_372170 ?auto_372172 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_372171 ?auto_372172 ?auto_372166 ?auto_372167 )
      ( GET-4IMAGE-VERIFY ?auto_372166 ?auto_372167 ?auto_372168 ?auto_372165 ?auto_372169 ?auto_372170 ?auto_372171 ?auto_372172 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_381332 - DIRECTION
      ?auto_381333 - MODE
      ?auto_381334 - DIRECTION
      ?auto_381331 - MODE
      ?auto_381335 - DIRECTION
      ?auto_381336 - MODE
    )
    :vars
    (
      ?auto_381337 - INSTRUMENT
      ?auto_381338 - SATELLITE
      ?auto_381339 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_381337 ) ( ON_BOARD ?auto_381337 ?auto_381338 ) ( SUPPORTS ?auto_381337 ?auto_381331 ) ( POWER_ON ?auto_381337 ) ( POINTING ?auto_381338 ?auto_381339 ) ( not ( = ?auto_381334 ?auto_381339 ) ) ( HAVE_IMAGE ?auto_381332 ?auto_381336 ) ( not ( = ?auto_381332 ?auto_381334 ) ) ( not ( = ?auto_381332 ?auto_381339 ) ) ( not ( = ?auto_381336 ?auto_381331 ) ) ( HAVE_IMAGE ?auto_381332 ?auto_381333 ) ( HAVE_IMAGE ?auto_381335 ?auto_381336 ) ( not ( = ?auto_381332 ?auto_381335 ) ) ( not ( = ?auto_381333 ?auto_381331 ) ) ( not ( = ?auto_381333 ?auto_381336 ) ) ( not ( = ?auto_381334 ?auto_381335 ) ) ( not ( = ?auto_381335 ?auto_381339 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_381332 ?auto_381336 ?auto_381334 ?auto_381331 )
      ( GET-3IMAGE-VERIFY ?auto_381332 ?auto_381333 ?auto_381334 ?auto_381331 ?auto_381335 ?auto_381336 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_381652 - DIRECTION
      ?auto_381653 - MODE
      ?auto_381654 - DIRECTION
      ?auto_381651 - MODE
      ?auto_381655 - DIRECTION
      ?auto_381656 - MODE
      ?auto_381657 - DIRECTION
      ?auto_381658 - MODE
    )
    :vars
    (
      ?auto_381659 - INSTRUMENT
      ?auto_381660 - SATELLITE
      ?auto_381661 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_381659 ) ( ON_BOARD ?auto_381659 ?auto_381660 ) ( SUPPORTS ?auto_381659 ?auto_381656 ) ( POWER_ON ?auto_381659 ) ( POINTING ?auto_381660 ?auto_381661 ) ( not ( = ?auto_381655 ?auto_381661 ) ) ( HAVE_IMAGE ?auto_381652 ?auto_381658 ) ( not ( = ?auto_381652 ?auto_381655 ) ) ( not ( = ?auto_381652 ?auto_381661 ) ) ( not ( = ?auto_381658 ?auto_381656 ) ) ( HAVE_IMAGE ?auto_381652 ?auto_381653 ) ( HAVE_IMAGE ?auto_381654 ?auto_381651 ) ( HAVE_IMAGE ?auto_381657 ?auto_381658 ) ( not ( = ?auto_381652 ?auto_381654 ) ) ( not ( = ?auto_381652 ?auto_381657 ) ) ( not ( = ?auto_381653 ?auto_381651 ) ) ( not ( = ?auto_381653 ?auto_381656 ) ) ( not ( = ?auto_381653 ?auto_381658 ) ) ( not ( = ?auto_381654 ?auto_381655 ) ) ( not ( = ?auto_381654 ?auto_381657 ) ) ( not ( = ?auto_381654 ?auto_381661 ) ) ( not ( = ?auto_381651 ?auto_381656 ) ) ( not ( = ?auto_381651 ?auto_381658 ) ) ( not ( = ?auto_381655 ?auto_381657 ) ) ( not ( = ?auto_381657 ?auto_381661 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_381652 ?auto_381658 ?auto_381655 ?auto_381656 )
      ( GET-4IMAGE-VERIFY ?auto_381652 ?auto_381653 ?auto_381654 ?auto_381651 ?auto_381655 ?auto_381656 ?auto_381657 ?auto_381658 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_381663 - DIRECTION
      ?auto_381664 - MODE
      ?auto_381665 - DIRECTION
      ?auto_381662 - MODE
      ?auto_381666 - DIRECTION
      ?auto_381667 - MODE
      ?auto_381668 - DIRECTION
      ?auto_381669 - MODE
    )
    :vars
    (
      ?auto_381670 - INSTRUMENT
      ?auto_381671 - SATELLITE
      ?auto_381672 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_381670 ) ( ON_BOARD ?auto_381670 ?auto_381671 ) ( SUPPORTS ?auto_381670 ?auto_381667 ) ( POWER_ON ?auto_381670 ) ( POINTING ?auto_381671 ?auto_381672 ) ( not ( = ?auto_381666 ?auto_381672 ) ) ( HAVE_IMAGE ?auto_381663 ?auto_381662 ) ( not ( = ?auto_381663 ?auto_381666 ) ) ( not ( = ?auto_381663 ?auto_381672 ) ) ( not ( = ?auto_381662 ?auto_381667 ) ) ( HAVE_IMAGE ?auto_381663 ?auto_381664 ) ( HAVE_IMAGE ?auto_381665 ?auto_381662 ) ( HAVE_IMAGE ?auto_381668 ?auto_381669 ) ( not ( = ?auto_381663 ?auto_381665 ) ) ( not ( = ?auto_381663 ?auto_381668 ) ) ( not ( = ?auto_381664 ?auto_381662 ) ) ( not ( = ?auto_381664 ?auto_381667 ) ) ( not ( = ?auto_381664 ?auto_381669 ) ) ( not ( = ?auto_381665 ?auto_381666 ) ) ( not ( = ?auto_381665 ?auto_381668 ) ) ( not ( = ?auto_381665 ?auto_381672 ) ) ( not ( = ?auto_381662 ?auto_381669 ) ) ( not ( = ?auto_381666 ?auto_381668 ) ) ( not ( = ?auto_381667 ?auto_381669 ) ) ( not ( = ?auto_381668 ?auto_381672 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_381663 ?auto_381662 ?auto_381666 ?auto_381667 )
      ( GET-4IMAGE-VERIFY ?auto_381663 ?auto_381664 ?auto_381665 ?auto_381662 ?auto_381666 ?auto_381667 ?auto_381668 ?auto_381669 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_381696 - DIRECTION
      ?auto_381697 - MODE
      ?auto_381698 - DIRECTION
      ?auto_381695 - MODE
      ?auto_381699 - DIRECTION
      ?auto_381700 - MODE
      ?auto_381701 - DIRECTION
      ?auto_381702 - MODE
    )
    :vars
    (
      ?auto_381703 - INSTRUMENT
      ?auto_381704 - SATELLITE
      ?auto_381705 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_381703 ) ( ON_BOARD ?auto_381703 ?auto_381704 ) ( SUPPORTS ?auto_381703 ?auto_381702 ) ( POWER_ON ?auto_381703 ) ( POINTING ?auto_381704 ?auto_381705 ) ( not ( = ?auto_381701 ?auto_381705 ) ) ( HAVE_IMAGE ?auto_381696 ?auto_381700 ) ( not ( = ?auto_381696 ?auto_381701 ) ) ( not ( = ?auto_381696 ?auto_381705 ) ) ( not ( = ?auto_381700 ?auto_381702 ) ) ( HAVE_IMAGE ?auto_381696 ?auto_381697 ) ( HAVE_IMAGE ?auto_381698 ?auto_381695 ) ( HAVE_IMAGE ?auto_381699 ?auto_381700 ) ( not ( = ?auto_381696 ?auto_381698 ) ) ( not ( = ?auto_381696 ?auto_381699 ) ) ( not ( = ?auto_381697 ?auto_381695 ) ) ( not ( = ?auto_381697 ?auto_381700 ) ) ( not ( = ?auto_381697 ?auto_381702 ) ) ( not ( = ?auto_381698 ?auto_381699 ) ) ( not ( = ?auto_381698 ?auto_381701 ) ) ( not ( = ?auto_381698 ?auto_381705 ) ) ( not ( = ?auto_381695 ?auto_381700 ) ) ( not ( = ?auto_381695 ?auto_381702 ) ) ( not ( = ?auto_381699 ?auto_381701 ) ) ( not ( = ?auto_381699 ?auto_381705 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_381696 ?auto_381700 ?auto_381701 ?auto_381702 )
      ( GET-4IMAGE-VERIFY ?auto_381696 ?auto_381697 ?auto_381698 ?auto_381695 ?auto_381699 ?auto_381700 ?auto_381701 ?auto_381702 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_382247 - DIRECTION
      ?auto_382248 - MODE
      ?auto_382249 - DIRECTION
      ?auto_382246 - MODE
      ?auto_382250 - DIRECTION
      ?auto_382251 - MODE
      ?auto_382252 - DIRECTION
      ?auto_382253 - MODE
    )
    :vars
    (
      ?auto_382254 - INSTRUMENT
      ?auto_382255 - SATELLITE
      ?auto_382256 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_382254 ) ( ON_BOARD ?auto_382254 ?auto_382255 ) ( SUPPORTS ?auto_382254 ?auto_382246 ) ( POWER_ON ?auto_382254 ) ( POINTING ?auto_382255 ?auto_382256 ) ( not ( = ?auto_382249 ?auto_382256 ) ) ( HAVE_IMAGE ?auto_382250 ?auto_382253 ) ( not ( = ?auto_382250 ?auto_382249 ) ) ( not ( = ?auto_382250 ?auto_382256 ) ) ( not ( = ?auto_382253 ?auto_382246 ) ) ( HAVE_IMAGE ?auto_382247 ?auto_382248 ) ( HAVE_IMAGE ?auto_382250 ?auto_382251 ) ( HAVE_IMAGE ?auto_382252 ?auto_382253 ) ( not ( = ?auto_382247 ?auto_382249 ) ) ( not ( = ?auto_382247 ?auto_382250 ) ) ( not ( = ?auto_382247 ?auto_382252 ) ) ( not ( = ?auto_382247 ?auto_382256 ) ) ( not ( = ?auto_382248 ?auto_382246 ) ) ( not ( = ?auto_382248 ?auto_382251 ) ) ( not ( = ?auto_382248 ?auto_382253 ) ) ( not ( = ?auto_382249 ?auto_382252 ) ) ( not ( = ?auto_382246 ?auto_382251 ) ) ( not ( = ?auto_382250 ?auto_382252 ) ) ( not ( = ?auto_382251 ?auto_382253 ) ) ( not ( = ?auto_382252 ?auto_382256 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_382250 ?auto_382253 ?auto_382249 ?auto_382246 )
      ( GET-4IMAGE-VERIFY ?auto_382247 ?auto_382248 ?auto_382249 ?auto_382246 ?auto_382250 ?auto_382251 ?auto_382252 ?auto_382253 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_382947 - DIRECTION
      ?auto_382948 - MODE
      ?auto_382949 - DIRECTION
      ?auto_382946 - MODE
      ?auto_382950 - DIRECTION
      ?auto_382951 - MODE
      ?auto_382952 - DIRECTION
      ?auto_382953 - MODE
    )
    :vars
    (
      ?auto_382954 - INSTRUMENT
      ?auto_382955 - SATELLITE
      ?auto_382956 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_382954 ) ( ON_BOARD ?auto_382954 ?auto_382955 ) ( SUPPORTS ?auto_382954 ?auto_382948 ) ( POWER_ON ?auto_382954 ) ( POINTING ?auto_382955 ?auto_382956 ) ( not ( = ?auto_382947 ?auto_382956 ) ) ( HAVE_IMAGE ?auto_382949 ?auto_382953 ) ( not ( = ?auto_382949 ?auto_382947 ) ) ( not ( = ?auto_382949 ?auto_382956 ) ) ( not ( = ?auto_382953 ?auto_382948 ) ) ( HAVE_IMAGE ?auto_382949 ?auto_382946 ) ( HAVE_IMAGE ?auto_382950 ?auto_382951 ) ( HAVE_IMAGE ?auto_382952 ?auto_382953 ) ( not ( = ?auto_382947 ?auto_382950 ) ) ( not ( = ?auto_382947 ?auto_382952 ) ) ( not ( = ?auto_382948 ?auto_382946 ) ) ( not ( = ?auto_382948 ?auto_382951 ) ) ( not ( = ?auto_382949 ?auto_382950 ) ) ( not ( = ?auto_382949 ?auto_382952 ) ) ( not ( = ?auto_382946 ?auto_382951 ) ) ( not ( = ?auto_382946 ?auto_382953 ) ) ( not ( = ?auto_382950 ?auto_382952 ) ) ( not ( = ?auto_382950 ?auto_382956 ) ) ( not ( = ?auto_382951 ?auto_382953 ) ) ( not ( = ?auto_382952 ?auto_382956 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_382949 ?auto_382953 ?auto_382947 ?auto_382948 )
      ( GET-4IMAGE-VERIFY ?auto_382947 ?auto_382948 ?auto_382949 ?auto_382946 ?auto_382950 ?auto_382951 ?auto_382952 ?auto_382953 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_383648 - DIRECTION
      ?auto_383649 - MODE
      ?auto_383650 - DIRECTION
      ?auto_383647 - MODE
      ?auto_383651 - DIRECTION
      ?auto_383652 - MODE
    )
    :vars
    (
      ?auto_383653 - INSTRUMENT
      ?auto_383654 - SATELLITE
      ?auto_383655 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_383653 ?auto_383654 ) ( SUPPORTS ?auto_383653 ?auto_383652 ) ( POWER_ON ?auto_383653 ) ( POINTING ?auto_383654 ?auto_383655 ) ( not ( = ?auto_383651 ?auto_383655 ) ) ( HAVE_IMAGE ?auto_383648 ?auto_383647 ) ( not ( = ?auto_383648 ?auto_383651 ) ) ( not ( = ?auto_383648 ?auto_383655 ) ) ( not ( = ?auto_383647 ?auto_383652 ) ) ( CALIBRATION_TARGET ?auto_383653 ?auto_383655 ) ( NOT_CALIBRATED ?auto_383653 ) ( HAVE_IMAGE ?auto_383648 ?auto_383649 ) ( HAVE_IMAGE ?auto_383650 ?auto_383647 ) ( not ( = ?auto_383648 ?auto_383650 ) ) ( not ( = ?auto_383649 ?auto_383647 ) ) ( not ( = ?auto_383649 ?auto_383652 ) ) ( not ( = ?auto_383650 ?auto_383651 ) ) ( not ( = ?auto_383650 ?auto_383655 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_383648 ?auto_383647 ?auto_383651 ?auto_383652 )
      ( GET-3IMAGE-VERIFY ?auto_383648 ?auto_383649 ?auto_383650 ?auto_383647 ?auto_383651 ?auto_383652 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_383672 - DIRECTION
      ?auto_383673 - MODE
      ?auto_383674 - DIRECTION
      ?auto_383671 - MODE
      ?auto_383675 - DIRECTION
      ?auto_383676 - MODE
    )
    :vars
    (
      ?auto_383677 - INSTRUMENT
      ?auto_383678 - SATELLITE
      ?auto_383679 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_383677 ?auto_383678 ) ( SUPPORTS ?auto_383677 ?auto_383671 ) ( POWER_ON ?auto_383677 ) ( POINTING ?auto_383678 ?auto_383679 ) ( not ( = ?auto_383674 ?auto_383679 ) ) ( HAVE_IMAGE ?auto_383672 ?auto_383676 ) ( not ( = ?auto_383672 ?auto_383674 ) ) ( not ( = ?auto_383672 ?auto_383679 ) ) ( not ( = ?auto_383676 ?auto_383671 ) ) ( CALIBRATION_TARGET ?auto_383677 ?auto_383679 ) ( NOT_CALIBRATED ?auto_383677 ) ( HAVE_IMAGE ?auto_383672 ?auto_383673 ) ( HAVE_IMAGE ?auto_383675 ?auto_383676 ) ( not ( = ?auto_383672 ?auto_383675 ) ) ( not ( = ?auto_383673 ?auto_383671 ) ) ( not ( = ?auto_383673 ?auto_383676 ) ) ( not ( = ?auto_383674 ?auto_383675 ) ) ( not ( = ?auto_383675 ?auto_383679 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_383672 ?auto_383676 ?auto_383674 ?auto_383671 )
      ( GET-3IMAGE-VERIFY ?auto_383672 ?auto_383673 ?auto_383674 ?auto_383671 ?auto_383675 ?auto_383676 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_383995 - DIRECTION
      ?auto_383996 - MODE
      ?auto_383997 - DIRECTION
      ?auto_383994 - MODE
      ?auto_383998 - DIRECTION
      ?auto_383999 - MODE
      ?auto_384000 - DIRECTION
      ?auto_384001 - MODE
    )
    :vars
    (
      ?auto_384002 - INSTRUMENT
      ?auto_384003 - SATELLITE
      ?auto_384004 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_384002 ?auto_384003 ) ( SUPPORTS ?auto_384002 ?auto_383999 ) ( POWER_ON ?auto_384002 ) ( POINTING ?auto_384003 ?auto_384004 ) ( not ( = ?auto_383998 ?auto_384004 ) ) ( HAVE_IMAGE ?auto_383995 ?auto_384001 ) ( not ( = ?auto_383995 ?auto_383998 ) ) ( not ( = ?auto_383995 ?auto_384004 ) ) ( not ( = ?auto_384001 ?auto_383999 ) ) ( CALIBRATION_TARGET ?auto_384002 ?auto_384004 ) ( NOT_CALIBRATED ?auto_384002 ) ( HAVE_IMAGE ?auto_383995 ?auto_383996 ) ( HAVE_IMAGE ?auto_383997 ?auto_383994 ) ( HAVE_IMAGE ?auto_384000 ?auto_384001 ) ( not ( = ?auto_383995 ?auto_383997 ) ) ( not ( = ?auto_383995 ?auto_384000 ) ) ( not ( = ?auto_383996 ?auto_383994 ) ) ( not ( = ?auto_383996 ?auto_383999 ) ) ( not ( = ?auto_383996 ?auto_384001 ) ) ( not ( = ?auto_383997 ?auto_383998 ) ) ( not ( = ?auto_383997 ?auto_384000 ) ) ( not ( = ?auto_383997 ?auto_384004 ) ) ( not ( = ?auto_383994 ?auto_383999 ) ) ( not ( = ?auto_383994 ?auto_384001 ) ) ( not ( = ?auto_383998 ?auto_384000 ) ) ( not ( = ?auto_384000 ?auto_384004 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_383995 ?auto_384001 ?auto_383998 ?auto_383999 )
      ( GET-4IMAGE-VERIFY ?auto_383995 ?auto_383996 ?auto_383997 ?auto_383994 ?auto_383998 ?auto_383999 ?auto_384000 ?auto_384001 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_384181 - DIRECTION
      ?auto_384182 - MODE
      ?auto_384183 - DIRECTION
      ?auto_384180 - MODE
      ?auto_384184 - DIRECTION
      ?auto_384185 - MODE
      ?auto_384186 - DIRECTION
      ?auto_384187 - MODE
    )
    :vars
    (
      ?auto_384188 - INSTRUMENT
      ?auto_384189 - SATELLITE
      ?auto_384190 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_384188 ?auto_384189 ) ( SUPPORTS ?auto_384188 ?auto_384180 ) ( POWER_ON ?auto_384188 ) ( POINTING ?auto_384189 ?auto_384190 ) ( not ( = ?auto_384183 ?auto_384190 ) ) ( HAVE_IMAGE ?auto_384181 ?auto_384187 ) ( not ( = ?auto_384181 ?auto_384183 ) ) ( not ( = ?auto_384181 ?auto_384190 ) ) ( not ( = ?auto_384187 ?auto_384180 ) ) ( CALIBRATION_TARGET ?auto_384188 ?auto_384190 ) ( NOT_CALIBRATED ?auto_384188 ) ( HAVE_IMAGE ?auto_384181 ?auto_384182 ) ( HAVE_IMAGE ?auto_384184 ?auto_384185 ) ( HAVE_IMAGE ?auto_384186 ?auto_384187 ) ( not ( = ?auto_384181 ?auto_384184 ) ) ( not ( = ?auto_384181 ?auto_384186 ) ) ( not ( = ?auto_384182 ?auto_384180 ) ) ( not ( = ?auto_384182 ?auto_384185 ) ) ( not ( = ?auto_384182 ?auto_384187 ) ) ( not ( = ?auto_384183 ?auto_384184 ) ) ( not ( = ?auto_384183 ?auto_384186 ) ) ( not ( = ?auto_384180 ?auto_384185 ) ) ( not ( = ?auto_384184 ?auto_384186 ) ) ( not ( = ?auto_384184 ?auto_384190 ) ) ( not ( = ?auto_384185 ?auto_384187 ) ) ( not ( = ?auto_384186 ?auto_384190 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_384181 ?auto_384187 ?auto_384183 ?auto_384180 )
      ( GET-4IMAGE-VERIFY ?auto_384181 ?auto_384182 ?auto_384183 ?auto_384180 ?auto_384184 ?auto_384185 ?auto_384186 ?auto_384187 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_384808 - DIRECTION
      ?auto_384809 - MODE
      ?auto_384810 - DIRECTION
      ?auto_384807 - MODE
      ?auto_384811 - DIRECTION
      ?auto_384812 - MODE
      ?auto_384813 - DIRECTION
      ?auto_384814 - MODE
    )
    :vars
    (
      ?auto_384815 - INSTRUMENT
      ?auto_384816 - SATELLITE
      ?auto_384817 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_384815 ?auto_384816 ) ( SUPPORTS ?auto_384815 ?auto_384812 ) ( POWER_ON ?auto_384815 ) ( POINTING ?auto_384816 ?auto_384817 ) ( not ( = ?auto_384811 ?auto_384817 ) ) ( HAVE_IMAGE ?auto_384810 ?auto_384814 ) ( not ( = ?auto_384810 ?auto_384811 ) ) ( not ( = ?auto_384810 ?auto_384817 ) ) ( not ( = ?auto_384814 ?auto_384812 ) ) ( CALIBRATION_TARGET ?auto_384815 ?auto_384817 ) ( NOT_CALIBRATED ?auto_384815 ) ( HAVE_IMAGE ?auto_384808 ?auto_384809 ) ( HAVE_IMAGE ?auto_384810 ?auto_384807 ) ( HAVE_IMAGE ?auto_384813 ?auto_384814 ) ( not ( = ?auto_384808 ?auto_384810 ) ) ( not ( = ?auto_384808 ?auto_384811 ) ) ( not ( = ?auto_384808 ?auto_384813 ) ) ( not ( = ?auto_384808 ?auto_384817 ) ) ( not ( = ?auto_384809 ?auto_384807 ) ) ( not ( = ?auto_384809 ?auto_384812 ) ) ( not ( = ?auto_384809 ?auto_384814 ) ) ( not ( = ?auto_384810 ?auto_384813 ) ) ( not ( = ?auto_384807 ?auto_384812 ) ) ( not ( = ?auto_384807 ?auto_384814 ) ) ( not ( = ?auto_384811 ?auto_384813 ) ) ( not ( = ?auto_384813 ?auto_384817 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_384810 ?auto_384814 ?auto_384811 ?auto_384812 )
      ( GET-4IMAGE-VERIFY ?auto_384808 ?auto_384809 ?auto_384810 ?auto_384807 ?auto_384811 ?auto_384812 ?auto_384813 ?auto_384814 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_385205 - DIRECTION
      ?auto_385206 - MODE
      ?auto_385207 - DIRECTION
      ?auto_385204 - MODE
      ?auto_385208 - DIRECTION
      ?auto_385209 - MODE
      ?auto_385210 - DIRECTION
      ?auto_385211 - MODE
    )
    :vars
    (
      ?auto_385212 - INSTRUMENT
      ?auto_385213 - SATELLITE
      ?auto_385214 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_385212 ?auto_385213 ) ( SUPPORTS ?auto_385212 ?auto_385206 ) ( POWER_ON ?auto_385212 ) ( POINTING ?auto_385213 ?auto_385214 ) ( not ( = ?auto_385205 ?auto_385214 ) ) ( HAVE_IMAGE ?auto_385210 ?auto_385209 ) ( not ( = ?auto_385210 ?auto_385205 ) ) ( not ( = ?auto_385210 ?auto_385214 ) ) ( not ( = ?auto_385209 ?auto_385206 ) ) ( CALIBRATION_TARGET ?auto_385212 ?auto_385214 ) ( NOT_CALIBRATED ?auto_385212 ) ( HAVE_IMAGE ?auto_385207 ?auto_385204 ) ( HAVE_IMAGE ?auto_385208 ?auto_385209 ) ( HAVE_IMAGE ?auto_385210 ?auto_385211 ) ( not ( = ?auto_385205 ?auto_385207 ) ) ( not ( = ?auto_385205 ?auto_385208 ) ) ( not ( = ?auto_385206 ?auto_385204 ) ) ( not ( = ?auto_385206 ?auto_385211 ) ) ( not ( = ?auto_385207 ?auto_385208 ) ) ( not ( = ?auto_385207 ?auto_385210 ) ) ( not ( = ?auto_385207 ?auto_385214 ) ) ( not ( = ?auto_385204 ?auto_385209 ) ) ( not ( = ?auto_385204 ?auto_385211 ) ) ( not ( = ?auto_385208 ?auto_385210 ) ) ( not ( = ?auto_385208 ?auto_385214 ) ) ( not ( = ?auto_385209 ?auto_385211 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_385210 ?auto_385209 ?auto_385205 ?auto_385206 )
      ( GET-4IMAGE-VERIFY ?auto_385205 ?auto_385206 ?auto_385207 ?auto_385204 ?auto_385208 ?auto_385209 ?auto_385210 ?auto_385211 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_386012 - DIRECTION
      ?auto_386013 - MODE
      ?auto_386014 - DIRECTION
      ?auto_386011 - MODE
      ?auto_386015 - DIRECTION
      ?auto_386016 - MODE
    )
    :vars
    (
      ?auto_386018 - INSTRUMENT
      ?auto_386019 - SATELLITE
      ?auto_386017 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_386018 ?auto_386019 ) ( SUPPORTS ?auto_386018 ?auto_386011 ) ( POINTING ?auto_386019 ?auto_386017 ) ( not ( = ?auto_386014 ?auto_386017 ) ) ( HAVE_IMAGE ?auto_386012 ?auto_386013 ) ( not ( = ?auto_386012 ?auto_386014 ) ) ( not ( = ?auto_386012 ?auto_386017 ) ) ( not ( = ?auto_386013 ?auto_386011 ) ) ( CALIBRATION_TARGET ?auto_386018 ?auto_386017 ) ( POWER_AVAIL ?auto_386019 ) ( HAVE_IMAGE ?auto_386015 ?auto_386016 ) ( not ( = ?auto_386012 ?auto_386015 ) ) ( not ( = ?auto_386013 ?auto_386016 ) ) ( not ( = ?auto_386014 ?auto_386015 ) ) ( not ( = ?auto_386011 ?auto_386016 ) ) ( not ( = ?auto_386015 ?auto_386017 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_386012 ?auto_386013 ?auto_386014 ?auto_386011 )
      ( GET-3IMAGE-VERIFY ?auto_386012 ?auto_386013 ?auto_386014 ?auto_386011 ?auto_386015 ?auto_386016 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_386373 - DIRECTION
      ?auto_386374 - MODE
      ?auto_386375 - DIRECTION
      ?auto_386372 - MODE
      ?auto_386376 - DIRECTION
      ?auto_386377 - MODE
      ?auto_386378 - DIRECTION
      ?auto_386379 - MODE
    )
    :vars
    (
      ?auto_386381 - INSTRUMENT
      ?auto_386382 - SATELLITE
      ?auto_386380 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_386381 ?auto_386382 ) ( SUPPORTS ?auto_386381 ?auto_386379 ) ( POINTING ?auto_386382 ?auto_386380 ) ( not ( = ?auto_386378 ?auto_386380 ) ) ( HAVE_IMAGE ?auto_386373 ?auto_386377 ) ( not ( = ?auto_386373 ?auto_386378 ) ) ( not ( = ?auto_386373 ?auto_386380 ) ) ( not ( = ?auto_386377 ?auto_386379 ) ) ( CALIBRATION_TARGET ?auto_386381 ?auto_386380 ) ( POWER_AVAIL ?auto_386382 ) ( HAVE_IMAGE ?auto_386373 ?auto_386374 ) ( HAVE_IMAGE ?auto_386375 ?auto_386372 ) ( HAVE_IMAGE ?auto_386376 ?auto_386377 ) ( not ( = ?auto_386373 ?auto_386375 ) ) ( not ( = ?auto_386373 ?auto_386376 ) ) ( not ( = ?auto_386374 ?auto_386372 ) ) ( not ( = ?auto_386374 ?auto_386377 ) ) ( not ( = ?auto_386374 ?auto_386379 ) ) ( not ( = ?auto_386375 ?auto_386376 ) ) ( not ( = ?auto_386375 ?auto_386378 ) ) ( not ( = ?auto_386375 ?auto_386380 ) ) ( not ( = ?auto_386372 ?auto_386377 ) ) ( not ( = ?auto_386372 ?auto_386379 ) ) ( not ( = ?auto_386376 ?auto_386378 ) ) ( not ( = ?auto_386376 ?auto_386380 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_386373 ?auto_386377 ?auto_386378 ?auto_386379 )
      ( GET-4IMAGE-VERIFY ?auto_386373 ?auto_386374 ?auto_386375 ?auto_386372 ?auto_386376 ?auto_386377 ?auto_386378 ?auto_386379 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_386403 - DIRECTION
      ?auto_386404 - MODE
      ?auto_386405 - DIRECTION
      ?auto_386402 - MODE
      ?auto_386406 - DIRECTION
      ?auto_386407 - MODE
      ?auto_386408 - DIRECTION
      ?auto_386409 - MODE
    )
    :vars
    (
      ?auto_386411 - INSTRUMENT
      ?auto_386412 - SATELLITE
      ?auto_386410 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_386411 ?auto_386412 ) ( SUPPORTS ?auto_386411 ?auto_386407 ) ( POINTING ?auto_386412 ?auto_386410 ) ( not ( = ?auto_386406 ?auto_386410 ) ) ( HAVE_IMAGE ?auto_386408 ?auto_386404 ) ( not ( = ?auto_386408 ?auto_386406 ) ) ( not ( = ?auto_386408 ?auto_386410 ) ) ( not ( = ?auto_386404 ?auto_386407 ) ) ( CALIBRATION_TARGET ?auto_386411 ?auto_386410 ) ( POWER_AVAIL ?auto_386412 ) ( HAVE_IMAGE ?auto_386403 ?auto_386404 ) ( HAVE_IMAGE ?auto_386405 ?auto_386402 ) ( HAVE_IMAGE ?auto_386408 ?auto_386409 ) ( not ( = ?auto_386403 ?auto_386405 ) ) ( not ( = ?auto_386403 ?auto_386406 ) ) ( not ( = ?auto_386403 ?auto_386408 ) ) ( not ( = ?auto_386403 ?auto_386410 ) ) ( not ( = ?auto_386404 ?auto_386402 ) ) ( not ( = ?auto_386404 ?auto_386409 ) ) ( not ( = ?auto_386405 ?auto_386406 ) ) ( not ( = ?auto_386405 ?auto_386408 ) ) ( not ( = ?auto_386405 ?auto_386410 ) ) ( not ( = ?auto_386402 ?auto_386407 ) ) ( not ( = ?auto_386402 ?auto_386409 ) ) ( not ( = ?auto_386407 ?auto_386409 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_386408 ?auto_386404 ?auto_386406 ?auto_386407 )
      ( GET-4IMAGE-VERIFY ?auto_386403 ?auto_386404 ?auto_386405 ?auto_386402 ?auto_386406 ?auto_386407 ?auto_386408 ?auto_386409 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_386559 - DIRECTION
      ?auto_386560 - MODE
      ?auto_386561 - DIRECTION
      ?auto_386558 - MODE
      ?auto_386562 - DIRECTION
      ?auto_386563 - MODE
      ?auto_386564 - DIRECTION
      ?auto_386565 - MODE
    )
    :vars
    (
      ?auto_386567 - INSTRUMENT
      ?auto_386568 - SATELLITE
      ?auto_386566 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_386567 ?auto_386568 ) ( SUPPORTS ?auto_386567 ?auto_386558 ) ( POINTING ?auto_386568 ?auto_386566 ) ( not ( = ?auto_386561 ?auto_386566 ) ) ( HAVE_IMAGE ?auto_386564 ?auto_386560 ) ( not ( = ?auto_386564 ?auto_386561 ) ) ( not ( = ?auto_386564 ?auto_386566 ) ) ( not ( = ?auto_386560 ?auto_386558 ) ) ( CALIBRATION_TARGET ?auto_386567 ?auto_386566 ) ( POWER_AVAIL ?auto_386568 ) ( HAVE_IMAGE ?auto_386559 ?auto_386560 ) ( HAVE_IMAGE ?auto_386562 ?auto_386563 ) ( HAVE_IMAGE ?auto_386564 ?auto_386565 ) ( not ( = ?auto_386559 ?auto_386561 ) ) ( not ( = ?auto_386559 ?auto_386562 ) ) ( not ( = ?auto_386559 ?auto_386564 ) ) ( not ( = ?auto_386559 ?auto_386566 ) ) ( not ( = ?auto_386560 ?auto_386563 ) ) ( not ( = ?auto_386560 ?auto_386565 ) ) ( not ( = ?auto_386561 ?auto_386562 ) ) ( not ( = ?auto_386558 ?auto_386563 ) ) ( not ( = ?auto_386558 ?auto_386565 ) ) ( not ( = ?auto_386562 ?auto_386564 ) ) ( not ( = ?auto_386562 ?auto_386566 ) ) ( not ( = ?auto_386563 ?auto_386565 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_386564 ?auto_386560 ?auto_386561 ?auto_386558 )
      ( GET-4IMAGE-VERIFY ?auto_386559 ?auto_386560 ?auto_386561 ?auto_386558 ?auto_386562 ?auto_386563 ?auto_386564 ?auto_386565 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_386685 - DIRECTION
      ?auto_386686 - MODE
      ?auto_386687 - DIRECTION
      ?auto_386684 - MODE
      ?auto_386688 - DIRECTION
      ?auto_386689 - MODE
      ?auto_386690 - DIRECTION
      ?auto_386691 - MODE
    )
    :vars
    (
      ?auto_386693 - INSTRUMENT
      ?auto_386694 - SATELLITE
      ?auto_386692 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_386693 ?auto_386694 ) ( SUPPORTS ?auto_386693 ?auto_386691 ) ( POINTING ?auto_386694 ?auto_386692 ) ( not ( = ?auto_386690 ?auto_386692 ) ) ( HAVE_IMAGE ?auto_386687 ?auto_386689 ) ( not ( = ?auto_386687 ?auto_386690 ) ) ( not ( = ?auto_386687 ?auto_386692 ) ) ( not ( = ?auto_386689 ?auto_386691 ) ) ( CALIBRATION_TARGET ?auto_386693 ?auto_386692 ) ( POWER_AVAIL ?auto_386694 ) ( HAVE_IMAGE ?auto_386685 ?auto_386686 ) ( HAVE_IMAGE ?auto_386687 ?auto_386684 ) ( HAVE_IMAGE ?auto_386688 ?auto_386689 ) ( not ( = ?auto_386685 ?auto_386687 ) ) ( not ( = ?auto_386685 ?auto_386688 ) ) ( not ( = ?auto_386685 ?auto_386690 ) ) ( not ( = ?auto_386685 ?auto_386692 ) ) ( not ( = ?auto_386686 ?auto_386684 ) ) ( not ( = ?auto_386686 ?auto_386689 ) ) ( not ( = ?auto_386686 ?auto_386691 ) ) ( not ( = ?auto_386687 ?auto_386688 ) ) ( not ( = ?auto_386684 ?auto_386689 ) ) ( not ( = ?auto_386684 ?auto_386691 ) ) ( not ( = ?auto_386688 ?auto_386690 ) ) ( not ( = ?auto_386688 ?auto_386692 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_386687 ?auto_386689 ?auto_386690 ?auto_386691 )
      ( GET-4IMAGE-VERIFY ?auto_386685 ?auto_386686 ?auto_386687 ?auto_386684 ?auto_386688 ?auto_386689 ?auto_386690 ?auto_386691 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_386715 - DIRECTION
      ?auto_386716 - MODE
      ?auto_386717 - DIRECTION
      ?auto_386714 - MODE
      ?auto_386718 - DIRECTION
      ?auto_386719 - MODE
      ?auto_386720 - DIRECTION
      ?auto_386721 - MODE
    )
    :vars
    (
      ?auto_386723 - INSTRUMENT
      ?auto_386724 - SATELLITE
      ?auto_386722 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_386723 ?auto_386724 ) ( SUPPORTS ?auto_386723 ?auto_386719 ) ( POINTING ?auto_386724 ?auto_386722 ) ( not ( = ?auto_386718 ?auto_386722 ) ) ( HAVE_IMAGE ?auto_386720 ?auto_386714 ) ( not ( = ?auto_386720 ?auto_386718 ) ) ( not ( = ?auto_386720 ?auto_386722 ) ) ( not ( = ?auto_386714 ?auto_386719 ) ) ( CALIBRATION_TARGET ?auto_386723 ?auto_386722 ) ( POWER_AVAIL ?auto_386724 ) ( HAVE_IMAGE ?auto_386715 ?auto_386716 ) ( HAVE_IMAGE ?auto_386717 ?auto_386714 ) ( HAVE_IMAGE ?auto_386720 ?auto_386721 ) ( not ( = ?auto_386715 ?auto_386717 ) ) ( not ( = ?auto_386715 ?auto_386718 ) ) ( not ( = ?auto_386715 ?auto_386720 ) ) ( not ( = ?auto_386715 ?auto_386722 ) ) ( not ( = ?auto_386716 ?auto_386714 ) ) ( not ( = ?auto_386716 ?auto_386719 ) ) ( not ( = ?auto_386716 ?auto_386721 ) ) ( not ( = ?auto_386717 ?auto_386718 ) ) ( not ( = ?auto_386717 ?auto_386720 ) ) ( not ( = ?auto_386717 ?auto_386722 ) ) ( not ( = ?auto_386714 ?auto_386721 ) ) ( not ( = ?auto_386719 ?auto_386721 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_386720 ?auto_386714 ?auto_386718 ?auto_386719 )
      ( GET-4IMAGE-VERIFY ?auto_386715 ?auto_386716 ?auto_386717 ?auto_386714 ?auto_386718 ?auto_386719 ?auto_386720 ?auto_386721 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_386924 - DIRECTION
      ?auto_386925 - MODE
      ?auto_386926 - DIRECTION
      ?auto_386923 - MODE
      ?auto_386927 - DIRECTION
      ?auto_386928 - MODE
      ?auto_386929 - DIRECTION
      ?auto_386930 - MODE
    )
    :vars
    (
      ?auto_386932 - INSTRUMENT
      ?auto_386933 - SATELLITE
      ?auto_386931 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_386932 ?auto_386933 ) ( SUPPORTS ?auto_386932 ?auto_386923 ) ( POINTING ?auto_386933 ?auto_386931 ) ( not ( = ?auto_386926 ?auto_386931 ) ) ( HAVE_IMAGE ?auto_386927 ?auto_386930 ) ( not ( = ?auto_386927 ?auto_386926 ) ) ( not ( = ?auto_386927 ?auto_386931 ) ) ( not ( = ?auto_386930 ?auto_386923 ) ) ( CALIBRATION_TARGET ?auto_386932 ?auto_386931 ) ( POWER_AVAIL ?auto_386933 ) ( HAVE_IMAGE ?auto_386924 ?auto_386925 ) ( HAVE_IMAGE ?auto_386927 ?auto_386928 ) ( HAVE_IMAGE ?auto_386929 ?auto_386930 ) ( not ( = ?auto_386924 ?auto_386926 ) ) ( not ( = ?auto_386924 ?auto_386927 ) ) ( not ( = ?auto_386924 ?auto_386929 ) ) ( not ( = ?auto_386924 ?auto_386931 ) ) ( not ( = ?auto_386925 ?auto_386923 ) ) ( not ( = ?auto_386925 ?auto_386928 ) ) ( not ( = ?auto_386925 ?auto_386930 ) ) ( not ( = ?auto_386926 ?auto_386929 ) ) ( not ( = ?auto_386923 ?auto_386928 ) ) ( not ( = ?auto_386927 ?auto_386929 ) ) ( not ( = ?auto_386928 ?auto_386930 ) ) ( not ( = ?auto_386929 ?auto_386931 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_386927 ?auto_386930 ?auto_386926 ?auto_386923 )
      ( GET-4IMAGE-VERIFY ?auto_386924 ?auto_386925 ?auto_386926 ?auto_386923 ?auto_386927 ?auto_386928 ?auto_386929 ?auto_386930 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_387624 - DIRECTION
      ?auto_387625 - MODE
      ?auto_387626 - DIRECTION
      ?auto_387623 - MODE
      ?auto_387627 - DIRECTION
      ?auto_387628 - MODE
      ?auto_387629 - DIRECTION
      ?auto_387630 - MODE
    )
    :vars
    (
      ?auto_387632 - INSTRUMENT
      ?auto_387633 - SATELLITE
      ?auto_387631 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_387632 ?auto_387633 ) ( SUPPORTS ?auto_387632 ?auto_387625 ) ( POINTING ?auto_387633 ?auto_387631 ) ( not ( = ?auto_387624 ?auto_387631 ) ) ( HAVE_IMAGE ?auto_387629 ?auto_387623 ) ( not ( = ?auto_387629 ?auto_387624 ) ) ( not ( = ?auto_387629 ?auto_387631 ) ) ( not ( = ?auto_387623 ?auto_387625 ) ) ( CALIBRATION_TARGET ?auto_387632 ?auto_387631 ) ( POWER_AVAIL ?auto_387633 ) ( HAVE_IMAGE ?auto_387626 ?auto_387623 ) ( HAVE_IMAGE ?auto_387627 ?auto_387628 ) ( HAVE_IMAGE ?auto_387629 ?auto_387630 ) ( not ( = ?auto_387624 ?auto_387626 ) ) ( not ( = ?auto_387624 ?auto_387627 ) ) ( not ( = ?auto_387625 ?auto_387628 ) ) ( not ( = ?auto_387625 ?auto_387630 ) ) ( not ( = ?auto_387626 ?auto_387627 ) ) ( not ( = ?auto_387626 ?auto_387629 ) ) ( not ( = ?auto_387626 ?auto_387631 ) ) ( not ( = ?auto_387623 ?auto_387628 ) ) ( not ( = ?auto_387623 ?auto_387630 ) ) ( not ( = ?auto_387627 ?auto_387629 ) ) ( not ( = ?auto_387627 ?auto_387631 ) ) ( not ( = ?auto_387628 ?auto_387630 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_387629 ?auto_387623 ?auto_387624 ?auto_387625 )
      ( GET-4IMAGE-VERIFY ?auto_387624 ?auto_387625 ?auto_387626 ?auto_387623 ?auto_387627 ?auto_387628 ?auto_387629 ?auto_387630 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_388339 - DIRECTION
      ?auto_388340 - MODE
      ?auto_388341 - DIRECTION
      ?auto_388338 - MODE
      ?auto_388342 - DIRECTION
      ?auto_388343 - MODE
    )
    :vars
    (
      ?auto_388345 - INSTRUMENT
      ?auto_388346 - SATELLITE
      ?auto_388344 - DIRECTION
      ?auto_388347 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388345 ?auto_388346 ) ( SUPPORTS ?auto_388345 ?auto_388343 ) ( not ( = ?auto_388342 ?auto_388344 ) ) ( HAVE_IMAGE ?auto_388339 ?auto_388340 ) ( not ( = ?auto_388339 ?auto_388342 ) ) ( not ( = ?auto_388339 ?auto_388344 ) ) ( not ( = ?auto_388340 ?auto_388343 ) ) ( CALIBRATION_TARGET ?auto_388345 ?auto_388344 ) ( POWER_AVAIL ?auto_388346 ) ( POINTING ?auto_388346 ?auto_388347 ) ( not ( = ?auto_388344 ?auto_388347 ) ) ( not ( = ?auto_388342 ?auto_388347 ) ) ( not ( = ?auto_388339 ?auto_388347 ) ) ( HAVE_IMAGE ?auto_388341 ?auto_388338 ) ( not ( = ?auto_388339 ?auto_388341 ) ) ( not ( = ?auto_388340 ?auto_388338 ) ) ( not ( = ?auto_388341 ?auto_388342 ) ) ( not ( = ?auto_388341 ?auto_388344 ) ) ( not ( = ?auto_388341 ?auto_388347 ) ) ( not ( = ?auto_388338 ?auto_388343 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388339 ?auto_388340 ?auto_388342 ?auto_388343 )
      ( GET-3IMAGE-VERIFY ?auto_388339 ?auto_388340 ?auto_388341 ?auto_388338 ?auto_388342 ?auto_388343 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_388364 - DIRECTION
      ?auto_388365 - MODE
      ?auto_388366 - DIRECTION
      ?auto_388363 - MODE
      ?auto_388367 - DIRECTION
      ?auto_388368 - MODE
    )
    :vars
    (
      ?auto_388370 - INSTRUMENT
      ?auto_388371 - SATELLITE
      ?auto_388369 - DIRECTION
      ?auto_388372 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388370 ?auto_388371 ) ( SUPPORTS ?auto_388370 ?auto_388363 ) ( not ( = ?auto_388366 ?auto_388369 ) ) ( HAVE_IMAGE ?auto_388364 ?auto_388365 ) ( not ( = ?auto_388364 ?auto_388366 ) ) ( not ( = ?auto_388364 ?auto_388369 ) ) ( not ( = ?auto_388365 ?auto_388363 ) ) ( CALIBRATION_TARGET ?auto_388370 ?auto_388369 ) ( POWER_AVAIL ?auto_388371 ) ( POINTING ?auto_388371 ?auto_388372 ) ( not ( = ?auto_388369 ?auto_388372 ) ) ( not ( = ?auto_388366 ?auto_388372 ) ) ( not ( = ?auto_388364 ?auto_388372 ) ) ( HAVE_IMAGE ?auto_388367 ?auto_388368 ) ( not ( = ?auto_388364 ?auto_388367 ) ) ( not ( = ?auto_388365 ?auto_388368 ) ) ( not ( = ?auto_388366 ?auto_388367 ) ) ( not ( = ?auto_388363 ?auto_388368 ) ) ( not ( = ?auto_388367 ?auto_388369 ) ) ( not ( = ?auto_388367 ?auto_388372 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388364 ?auto_388365 ?auto_388366 ?auto_388363 )
      ( GET-3IMAGE-VERIFY ?auto_388364 ?auto_388365 ?auto_388366 ?auto_388363 ?auto_388367 ?auto_388368 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_388405 - DIRECTION
      ?auto_388406 - MODE
      ?auto_388407 - DIRECTION
      ?auto_388404 - MODE
      ?auto_388408 - DIRECTION
      ?auto_388409 - MODE
    )
    :vars
    (
      ?auto_388413 - INSTRUMENT
      ?auto_388414 - SATELLITE
      ?auto_388410 - DIRECTION
      ?auto_388411 - DIRECTION
      ?auto_388412 - MODE
      ?auto_388415 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388413 ?auto_388414 ) ( SUPPORTS ?auto_388413 ?auto_388409 ) ( not ( = ?auto_388408 ?auto_388410 ) ) ( HAVE_IMAGE ?auto_388411 ?auto_388412 ) ( not ( = ?auto_388411 ?auto_388408 ) ) ( not ( = ?auto_388411 ?auto_388410 ) ) ( not ( = ?auto_388412 ?auto_388409 ) ) ( CALIBRATION_TARGET ?auto_388413 ?auto_388410 ) ( POWER_AVAIL ?auto_388414 ) ( POINTING ?auto_388414 ?auto_388415 ) ( not ( = ?auto_388410 ?auto_388415 ) ) ( not ( = ?auto_388408 ?auto_388415 ) ) ( not ( = ?auto_388411 ?auto_388415 ) ) ( HAVE_IMAGE ?auto_388405 ?auto_388406 ) ( HAVE_IMAGE ?auto_388407 ?auto_388404 ) ( not ( = ?auto_388405 ?auto_388407 ) ) ( not ( = ?auto_388405 ?auto_388408 ) ) ( not ( = ?auto_388405 ?auto_388410 ) ) ( not ( = ?auto_388405 ?auto_388411 ) ) ( not ( = ?auto_388405 ?auto_388415 ) ) ( not ( = ?auto_388406 ?auto_388404 ) ) ( not ( = ?auto_388406 ?auto_388409 ) ) ( not ( = ?auto_388406 ?auto_388412 ) ) ( not ( = ?auto_388407 ?auto_388408 ) ) ( not ( = ?auto_388407 ?auto_388410 ) ) ( not ( = ?auto_388407 ?auto_388411 ) ) ( not ( = ?auto_388407 ?auto_388415 ) ) ( not ( = ?auto_388404 ?auto_388409 ) ) ( not ( = ?auto_388404 ?auto_388412 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388411 ?auto_388412 ?auto_388408 ?auto_388409 )
      ( GET-3IMAGE-VERIFY ?auto_388405 ?auto_388406 ?auto_388407 ?auto_388404 ?auto_388408 ?auto_388409 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_388429 - DIRECTION
      ?auto_388430 - MODE
      ?auto_388431 - DIRECTION
      ?auto_388428 - MODE
      ?auto_388432 - DIRECTION
      ?auto_388433 - MODE
    )
    :vars
    (
      ?auto_388437 - INSTRUMENT
      ?auto_388438 - SATELLITE
      ?auto_388434 - DIRECTION
      ?auto_388435 - DIRECTION
      ?auto_388436 - MODE
      ?auto_388439 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388437 ?auto_388438 ) ( SUPPORTS ?auto_388437 ?auto_388428 ) ( not ( = ?auto_388431 ?auto_388434 ) ) ( HAVE_IMAGE ?auto_388435 ?auto_388436 ) ( not ( = ?auto_388435 ?auto_388431 ) ) ( not ( = ?auto_388435 ?auto_388434 ) ) ( not ( = ?auto_388436 ?auto_388428 ) ) ( CALIBRATION_TARGET ?auto_388437 ?auto_388434 ) ( POWER_AVAIL ?auto_388438 ) ( POINTING ?auto_388438 ?auto_388439 ) ( not ( = ?auto_388434 ?auto_388439 ) ) ( not ( = ?auto_388431 ?auto_388439 ) ) ( not ( = ?auto_388435 ?auto_388439 ) ) ( HAVE_IMAGE ?auto_388429 ?auto_388430 ) ( HAVE_IMAGE ?auto_388432 ?auto_388433 ) ( not ( = ?auto_388429 ?auto_388431 ) ) ( not ( = ?auto_388429 ?auto_388432 ) ) ( not ( = ?auto_388429 ?auto_388434 ) ) ( not ( = ?auto_388429 ?auto_388435 ) ) ( not ( = ?auto_388429 ?auto_388439 ) ) ( not ( = ?auto_388430 ?auto_388428 ) ) ( not ( = ?auto_388430 ?auto_388433 ) ) ( not ( = ?auto_388430 ?auto_388436 ) ) ( not ( = ?auto_388431 ?auto_388432 ) ) ( not ( = ?auto_388428 ?auto_388433 ) ) ( not ( = ?auto_388432 ?auto_388434 ) ) ( not ( = ?auto_388432 ?auto_388435 ) ) ( not ( = ?auto_388432 ?auto_388439 ) ) ( not ( = ?auto_388433 ?auto_388436 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388435 ?auto_388436 ?auto_388431 ?auto_388428 )
      ( GET-3IMAGE-VERIFY ?auto_388429 ?auto_388430 ?auto_388431 ?auto_388428 ?auto_388432 ?auto_388433 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_388474 - DIRECTION
      ?auto_388475 - MODE
      ?auto_388476 - DIRECTION
      ?auto_388473 - MODE
      ?auto_388477 - DIRECTION
      ?auto_388478 - MODE
    )
    :vars
    (
      ?auto_388482 - INSTRUMENT
      ?auto_388483 - SATELLITE
      ?auto_388479 - DIRECTION
      ?auto_388480 - DIRECTION
      ?auto_388481 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_388482 ?auto_388483 ) ( SUPPORTS ?auto_388482 ?auto_388478 ) ( not ( = ?auto_388477 ?auto_388479 ) ) ( HAVE_IMAGE ?auto_388480 ?auto_388481 ) ( not ( = ?auto_388480 ?auto_388477 ) ) ( not ( = ?auto_388480 ?auto_388479 ) ) ( not ( = ?auto_388481 ?auto_388478 ) ) ( CALIBRATION_TARGET ?auto_388482 ?auto_388479 ) ( POWER_AVAIL ?auto_388483 ) ( POINTING ?auto_388483 ?auto_388476 ) ( not ( = ?auto_388479 ?auto_388476 ) ) ( not ( = ?auto_388477 ?auto_388476 ) ) ( not ( = ?auto_388480 ?auto_388476 ) ) ( HAVE_IMAGE ?auto_388474 ?auto_388475 ) ( HAVE_IMAGE ?auto_388476 ?auto_388473 ) ( not ( = ?auto_388474 ?auto_388476 ) ) ( not ( = ?auto_388474 ?auto_388477 ) ) ( not ( = ?auto_388474 ?auto_388479 ) ) ( not ( = ?auto_388474 ?auto_388480 ) ) ( not ( = ?auto_388475 ?auto_388473 ) ) ( not ( = ?auto_388475 ?auto_388478 ) ) ( not ( = ?auto_388475 ?auto_388481 ) ) ( not ( = ?auto_388473 ?auto_388478 ) ) ( not ( = ?auto_388473 ?auto_388481 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388480 ?auto_388481 ?auto_388477 ?auto_388478 )
      ( GET-3IMAGE-VERIFY ?auto_388474 ?auto_388475 ?auto_388476 ?auto_388473 ?auto_388477 ?auto_388478 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_388522 - DIRECTION
      ?auto_388523 - MODE
      ?auto_388524 - DIRECTION
      ?auto_388521 - MODE
      ?auto_388525 - DIRECTION
      ?auto_388526 - MODE
    )
    :vars
    (
      ?auto_388528 - INSTRUMENT
      ?auto_388529 - SATELLITE
      ?auto_388527 - DIRECTION
      ?auto_388530 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388528 ?auto_388529 ) ( SUPPORTS ?auto_388528 ?auto_388523 ) ( not ( = ?auto_388522 ?auto_388527 ) ) ( HAVE_IMAGE ?auto_388525 ?auto_388521 ) ( not ( = ?auto_388525 ?auto_388522 ) ) ( not ( = ?auto_388525 ?auto_388527 ) ) ( not ( = ?auto_388521 ?auto_388523 ) ) ( CALIBRATION_TARGET ?auto_388528 ?auto_388527 ) ( POWER_AVAIL ?auto_388529 ) ( POINTING ?auto_388529 ?auto_388530 ) ( not ( = ?auto_388527 ?auto_388530 ) ) ( not ( = ?auto_388522 ?auto_388530 ) ) ( not ( = ?auto_388525 ?auto_388530 ) ) ( HAVE_IMAGE ?auto_388524 ?auto_388521 ) ( HAVE_IMAGE ?auto_388525 ?auto_388526 ) ( not ( = ?auto_388522 ?auto_388524 ) ) ( not ( = ?auto_388523 ?auto_388526 ) ) ( not ( = ?auto_388524 ?auto_388525 ) ) ( not ( = ?auto_388524 ?auto_388527 ) ) ( not ( = ?auto_388524 ?auto_388530 ) ) ( not ( = ?auto_388521 ?auto_388526 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388525 ?auto_388521 ?auto_388522 ?auto_388523 )
      ( GET-3IMAGE-VERIFY ?auto_388522 ?auto_388523 ?auto_388524 ?auto_388521 ?auto_388525 ?auto_388526 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_388532 - DIRECTION
      ?auto_388533 - MODE
      ?auto_388534 - DIRECTION
      ?auto_388531 - MODE
      ?auto_388535 - DIRECTION
      ?auto_388536 - MODE
    )
    :vars
    (
      ?auto_388538 - INSTRUMENT
      ?auto_388539 - SATELLITE
      ?auto_388537 - DIRECTION
      ?auto_388540 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388538 ?auto_388539 ) ( SUPPORTS ?auto_388538 ?auto_388533 ) ( not ( = ?auto_388532 ?auto_388537 ) ) ( HAVE_IMAGE ?auto_388534 ?auto_388531 ) ( not ( = ?auto_388534 ?auto_388532 ) ) ( not ( = ?auto_388534 ?auto_388537 ) ) ( not ( = ?auto_388531 ?auto_388533 ) ) ( CALIBRATION_TARGET ?auto_388538 ?auto_388537 ) ( POWER_AVAIL ?auto_388539 ) ( POINTING ?auto_388539 ?auto_388540 ) ( not ( = ?auto_388537 ?auto_388540 ) ) ( not ( = ?auto_388532 ?auto_388540 ) ) ( not ( = ?auto_388534 ?auto_388540 ) ) ( HAVE_IMAGE ?auto_388535 ?auto_388536 ) ( not ( = ?auto_388532 ?auto_388535 ) ) ( not ( = ?auto_388533 ?auto_388536 ) ) ( not ( = ?auto_388534 ?auto_388535 ) ) ( not ( = ?auto_388531 ?auto_388536 ) ) ( not ( = ?auto_388535 ?auto_388537 ) ) ( not ( = ?auto_388535 ?auto_388540 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388534 ?auto_388531 ?auto_388532 ?auto_388533 )
      ( GET-3IMAGE-VERIFY ?auto_388532 ?auto_388533 ?auto_388534 ?auto_388531 ?auto_388535 ?auto_388536 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_388567 - DIRECTION
      ?auto_388568 - MODE
      ?auto_388569 - DIRECTION
      ?auto_388566 - MODE
      ?auto_388570 - DIRECTION
      ?auto_388571 - MODE
    )
    :vars
    (
      ?auto_388575 - INSTRUMENT
      ?auto_388576 - SATELLITE
      ?auto_388572 - DIRECTION
      ?auto_388573 - DIRECTION
      ?auto_388574 - MODE
      ?auto_388577 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388575 ?auto_388576 ) ( SUPPORTS ?auto_388575 ?auto_388568 ) ( not ( = ?auto_388567 ?auto_388572 ) ) ( HAVE_IMAGE ?auto_388573 ?auto_388574 ) ( not ( = ?auto_388573 ?auto_388567 ) ) ( not ( = ?auto_388573 ?auto_388572 ) ) ( not ( = ?auto_388574 ?auto_388568 ) ) ( CALIBRATION_TARGET ?auto_388575 ?auto_388572 ) ( POWER_AVAIL ?auto_388576 ) ( POINTING ?auto_388576 ?auto_388577 ) ( not ( = ?auto_388572 ?auto_388577 ) ) ( not ( = ?auto_388567 ?auto_388577 ) ) ( not ( = ?auto_388573 ?auto_388577 ) ) ( HAVE_IMAGE ?auto_388569 ?auto_388566 ) ( HAVE_IMAGE ?auto_388570 ?auto_388571 ) ( not ( = ?auto_388567 ?auto_388569 ) ) ( not ( = ?auto_388567 ?auto_388570 ) ) ( not ( = ?auto_388568 ?auto_388566 ) ) ( not ( = ?auto_388568 ?auto_388571 ) ) ( not ( = ?auto_388569 ?auto_388570 ) ) ( not ( = ?auto_388569 ?auto_388572 ) ) ( not ( = ?auto_388569 ?auto_388573 ) ) ( not ( = ?auto_388569 ?auto_388577 ) ) ( not ( = ?auto_388566 ?auto_388571 ) ) ( not ( = ?auto_388566 ?auto_388574 ) ) ( not ( = ?auto_388570 ?auto_388572 ) ) ( not ( = ?auto_388570 ?auto_388573 ) ) ( not ( = ?auto_388570 ?auto_388577 ) ) ( not ( = ?auto_388571 ?auto_388574 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388573 ?auto_388574 ?auto_388567 ?auto_388568 )
      ( GET-3IMAGE-VERIFY ?auto_388567 ?auto_388568 ?auto_388569 ?auto_388566 ?auto_388570 ?auto_388571 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_388679 - DIRECTION
      ?auto_388680 - MODE
      ?auto_388681 - DIRECTION
      ?auto_388678 - MODE
      ?auto_388682 - DIRECTION
      ?auto_388683 - MODE
      ?auto_388684 - DIRECTION
      ?auto_388685 - MODE
    )
    :vars
    (
      ?auto_388687 - INSTRUMENT
      ?auto_388688 - SATELLITE
      ?auto_388686 - DIRECTION
      ?auto_388689 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388687 ?auto_388688 ) ( SUPPORTS ?auto_388687 ?auto_388685 ) ( not ( = ?auto_388684 ?auto_388686 ) ) ( HAVE_IMAGE ?auto_388681 ?auto_388678 ) ( not ( = ?auto_388681 ?auto_388684 ) ) ( not ( = ?auto_388681 ?auto_388686 ) ) ( not ( = ?auto_388678 ?auto_388685 ) ) ( CALIBRATION_TARGET ?auto_388687 ?auto_388686 ) ( POWER_AVAIL ?auto_388688 ) ( POINTING ?auto_388688 ?auto_388689 ) ( not ( = ?auto_388686 ?auto_388689 ) ) ( not ( = ?auto_388684 ?auto_388689 ) ) ( not ( = ?auto_388681 ?auto_388689 ) ) ( HAVE_IMAGE ?auto_388679 ?auto_388680 ) ( HAVE_IMAGE ?auto_388682 ?auto_388683 ) ( not ( = ?auto_388679 ?auto_388681 ) ) ( not ( = ?auto_388679 ?auto_388682 ) ) ( not ( = ?auto_388679 ?auto_388684 ) ) ( not ( = ?auto_388679 ?auto_388686 ) ) ( not ( = ?auto_388679 ?auto_388689 ) ) ( not ( = ?auto_388680 ?auto_388678 ) ) ( not ( = ?auto_388680 ?auto_388683 ) ) ( not ( = ?auto_388680 ?auto_388685 ) ) ( not ( = ?auto_388681 ?auto_388682 ) ) ( not ( = ?auto_388678 ?auto_388683 ) ) ( not ( = ?auto_388682 ?auto_388684 ) ) ( not ( = ?auto_388682 ?auto_388686 ) ) ( not ( = ?auto_388682 ?auto_388689 ) ) ( not ( = ?auto_388683 ?auto_388685 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388681 ?auto_388678 ?auto_388684 ?auto_388685 )
      ( GET-4IMAGE-VERIFY ?auto_388679 ?auto_388680 ?auto_388681 ?auto_388678 ?auto_388682 ?auto_388683 ?auto_388684 ?auto_388685 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_388714 - DIRECTION
      ?auto_388715 - MODE
      ?auto_388716 - DIRECTION
      ?auto_388713 - MODE
      ?auto_388717 - DIRECTION
      ?auto_388718 - MODE
      ?auto_388719 - DIRECTION
      ?auto_388720 - MODE
    )
    :vars
    (
      ?auto_388722 - INSTRUMENT
      ?auto_388723 - SATELLITE
      ?auto_388721 - DIRECTION
      ?auto_388724 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388722 ?auto_388723 ) ( SUPPORTS ?auto_388722 ?auto_388718 ) ( not ( = ?auto_388717 ?auto_388721 ) ) ( HAVE_IMAGE ?auto_388714 ?auto_388720 ) ( not ( = ?auto_388714 ?auto_388717 ) ) ( not ( = ?auto_388714 ?auto_388721 ) ) ( not ( = ?auto_388720 ?auto_388718 ) ) ( CALIBRATION_TARGET ?auto_388722 ?auto_388721 ) ( POWER_AVAIL ?auto_388723 ) ( POINTING ?auto_388723 ?auto_388724 ) ( not ( = ?auto_388721 ?auto_388724 ) ) ( not ( = ?auto_388717 ?auto_388724 ) ) ( not ( = ?auto_388714 ?auto_388724 ) ) ( HAVE_IMAGE ?auto_388714 ?auto_388715 ) ( HAVE_IMAGE ?auto_388716 ?auto_388713 ) ( HAVE_IMAGE ?auto_388719 ?auto_388720 ) ( not ( = ?auto_388714 ?auto_388716 ) ) ( not ( = ?auto_388714 ?auto_388719 ) ) ( not ( = ?auto_388715 ?auto_388713 ) ) ( not ( = ?auto_388715 ?auto_388718 ) ) ( not ( = ?auto_388715 ?auto_388720 ) ) ( not ( = ?auto_388716 ?auto_388717 ) ) ( not ( = ?auto_388716 ?auto_388719 ) ) ( not ( = ?auto_388716 ?auto_388721 ) ) ( not ( = ?auto_388716 ?auto_388724 ) ) ( not ( = ?auto_388713 ?auto_388718 ) ) ( not ( = ?auto_388713 ?auto_388720 ) ) ( not ( = ?auto_388717 ?auto_388719 ) ) ( not ( = ?auto_388719 ?auto_388721 ) ) ( not ( = ?auto_388719 ?auto_388724 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388714 ?auto_388720 ?auto_388717 ?auto_388718 )
      ( GET-4IMAGE-VERIFY ?auto_388714 ?auto_388715 ?auto_388716 ?auto_388713 ?auto_388717 ?auto_388718 ?auto_388719 ?auto_388720 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_388726 - DIRECTION
      ?auto_388727 - MODE
      ?auto_388728 - DIRECTION
      ?auto_388725 - MODE
      ?auto_388729 - DIRECTION
      ?auto_388730 - MODE
      ?auto_388731 - DIRECTION
      ?auto_388732 - MODE
    )
    :vars
    (
      ?auto_388734 - INSTRUMENT
      ?auto_388735 - SATELLITE
      ?auto_388733 - DIRECTION
      ?auto_388736 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388734 ?auto_388735 ) ( SUPPORTS ?auto_388734 ?auto_388730 ) ( not ( = ?auto_388729 ?auto_388733 ) ) ( HAVE_IMAGE ?auto_388728 ?auto_388727 ) ( not ( = ?auto_388728 ?auto_388729 ) ) ( not ( = ?auto_388728 ?auto_388733 ) ) ( not ( = ?auto_388727 ?auto_388730 ) ) ( CALIBRATION_TARGET ?auto_388734 ?auto_388733 ) ( POWER_AVAIL ?auto_388735 ) ( POINTING ?auto_388735 ?auto_388736 ) ( not ( = ?auto_388733 ?auto_388736 ) ) ( not ( = ?auto_388729 ?auto_388736 ) ) ( not ( = ?auto_388728 ?auto_388736 ) ) ( HAVE_IMAGE ?auto_388726 ?auto_388727 ) ( HAVE_IMAGE ?auto_388728 ?auto_388725 ) ( HAVE_IMAGE ?auto_388731 ?auto_388732 ) ( not ( = ?auto_388726 ?auto_388728 ) ) ( not ( = ?auto_388726 ?auto_388729 ) ) ( not ( = ?auto_388726 ?auto_388731 ) ) ( not ( = ?auto_388726 ?auto_388733 ) ) ( not ( = ?auto_388726 ?auto_388736 ) ) ( not ( = ?auto_388727 ?auto_388725 ) ) ( not ( = ?auto_388727 ?auto_388732 ) ) ( not ( = ?auto_388728 ?auto_388731 ) ) ( not ( = ?auto_388725 ?auto_388730 ) ) ( not ( = ?auto_388725 ?auto_388732 ) ) ( not ( = ?auto_388729 ?auto_388731 ) ) ( not ( = ?auto_388730 ?auto_388732 ) ) ( not ( = ?auto_388731 ?auto_388733 ) ) ( not ( = ?auto_388731 ?auto_388736 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388728 ?auto_388727 ?auto_388729 ?auto_388730 )
      ( GET-4IMAGE-VERIFY ?auto_388726 ?auto_388727 ?auto_388728 ?auto_388725 ?auto_388729 ?auto_388730 ?auto_388731 ?auto_388732 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_388761 - DIRECTION
      ?auto_388762 - MODE
      ?auto_388763 - DIRECTION
      ?auto_388760 - MODE
      ?auto_388764 - DIRECTION
      ?auto_388765 - MODE
      ?auto_388766 - DIRECTION
      ?auto_388767 - MODE
    )
    :vars
    (
      ?auto_388769 - INSTRUMENT
      ?auto_388770 - SATELLITE
      ?auto_388768 - DIRECTION
      ?auto_388771 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388769 ?auto_388770 ) ( SUPPORTS ?auto_388769 ?auto_388767 ) ( not ( = ?auto_388766 ?auto_388768 ) ) ( HAVE_IMAGE ?auto_388761 ?auto_388762 ) ( not ( = ?auto_388761 ?auto_388766 ) ) ( not ( = ?auto_388761 ?auto_388768 ) ) ( not ( = ?auto_388762 ?auto_388767 ) ) ( CALIBRATION_TARGET ?auto_388769 ?auto_388768 ) ( POWER_AVAIL ?auto_388770 ) ( POINTING ?auto_388770 ?auto_388771 ) ( not ( = ?auto_388768 ?auto_388771 ) ) ( not ( = ?auto_388766 ?auto_388771 ) ) ( not ( = ?auto_388761 ?auto_388771 ) ) ( HAVE_IMAGE ?auto_388763 ?auto_388760 ) ( HAVE_IMAGE ?auto_388764 ?auto_388765 ) ( not ( = ?auto_388761 ?auto_388763 ) ) ( not ( = ?auto_388761 ?auto_388764 ) ) ( not ( = ?auto_388762 ?auto_388760 ) ) ( not ( = ?auto_388762 ?auto_388765 ) ) ( not ( = ?auto_388763 ?auto_388764 ) ) ( not ( = ?auto_388763 ?auto_388766 ) ) ( not ( = ?auto_388763 ?auto_388768 ) ) ( not ( = ?auto_388763 ?auto_388771 ) ) ( not ( = ?auto_388760 ?auto_388765 ) ) ( not ( = ?auto_388760 ?auto_388767 ) ) ( not ( = ?auto_388764 ?auto_388766 ) ) ( not ( = ?auto_388764 ?auto_388768 ) ) ( not ( = ?auto_388764 ?auto_388771 ) ) ( not ( = ?auto_388765 ?auto_388767 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388761 ?auto_388762 ?auto_388766 ?auto_388767 )
      ( GET-4IMAGE-VERIFY ?auto_388761 ?auto_388762 ?auto_388763 ?auto_388760 ?auto_388764 ?auto_388765 ?auto_388766 ?auto_388767 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_388793 - DIRECTION
      ?auto_388794 - MODE
      ?auto_388795 - DIRECTION
      ?auto_388792 - MODE
      ?auto_388796 - DIRECTION
      ?auto_388797 - MODE
      ?auto_388798 - DIRECTION
      ?auto_388799 - MODE
    )
    :vars
    (
      ?auto_388801 - INSTRUMENT
      ?auto_388802 - SATELLITE
      ?auto_388800 - DIRECTION
      ?auto_388803 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388801 ?auto_388802 ) ( SUPPORTS ?auto_388801 ?auto_388797 ) ( not ( = ?auto_388796 ?auto_388800 ) ) ( HAVE_IMAGE ?auto_388793 ?auto_388794 ) ( not ( = ?auto_388793 ?auto_388796 ) ) ( not ( = ?auto_388793 ?auto_388800 ) ) ( not ( = ?auto_388794 ?auto_388797 ) ) ( CALIBRATION_TARGET ?auto_388801 ?auto_388800 ) ( POWER_AVAIL ?auto_388802 ) ( POINTING ?auto_388802 ?auto_388803 ) ( not ( = ?auto_388800 ?auto_388803 ) ) ( not ( = ?auto_388796 ?auto_388803 ) ) ( not ( = ?auto_388793 ?auto_388803 ) ) ( HAVE_IMAGE ?auto_388795 ?auto_388792 ) ( HAVE_IMAGE ?auto_388798 ?auto_388799 ) ( not ( = ?auto_388793 ?auto_388795 ) ) ( not ( = ?auto_388793 ?auto_388798 ) ) ( not ( = ?auto_388794 ?auto_388792 ) ) ( not ( = ?auto_388794 ?auto_388799 ) ) ( not ( = ?auto_388795 ?auto_388796 ) ) ( not ( = ?auto_388795 ?auto_388798 ) ) ( not ( = ?auto_388795 ?auto_388800 ) ) ( not ( = ?auto_388795 ?auto_388803 ) ) ( not ( = ?auto_388792 ?auto_388797 ) ) ( not ( = ?auto_388792 ?auto_388799 ) ) ( not ( = ?auto_388796 ?auto_388798 ) ) ( not ( = ?auto_388797 ?auto_388799 ) ) ( not ( = ?auto_388798 ?auto_388800 ) ) ( not ( = ?auto_388798 ?auto_388803 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388793 ?auto_388794 ?auto_388796 ?auto_388797 )
      ( GET-4IMAGE-VERIFY ?auto_388793 ?auto_388794 ?auto_388795 ?auto_388792 ?auto_388796 ?auto_388797 ?auto_388798 ?auto_388799 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_388817 - DIRECTION
      ?auto_388818 - MODE
      ?auto_388819 - DIRECTION
      ?auto_388816 - MODE
      ?auto_388820 - DIRECTION
      ?auto_388821 - MODE
      ?auto_388822 - DIRECTION
      ?auto_388823 - MODE
    )
    :vars
    (
      ?auto_388825 - INSTRUMENT
      ?auto_388826 - SATELLITE
      ?auto_388824 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388825 ?auto_388826 ) ( SUPPORTS ?auto_388825 ?auto_388821 ) ( not ( = ?auto_388820 ?auto_388824 ) ) ( HAVE_IMAGE ?auto_388817 ?auto_388818 ) ( not ( = ?auto_388817 ?auto_388820 ) ) ( not ( = ?auto_388817 ?auto_388824 ) ) ( not ( = ?auto_388818 ?auto_388821 ) ) ( CALIBRATION_TARGET ?auto_388825 ?auto_388824 ) ( POWER_AVAIL ?auto_388826 ) ( POINTING ?auto_388826 ?auto_388822 ) ( not ( = ?auto_388824 ?auto_388822 ) ) ( not ( = ?auto_388820 ?auto_388822 ) ) ( not ( = ?auto_388817 ?auto_388822 ) ) ( HAVE_IMAGE ?auto_388819 ?auto_388816 ) ( HAVE_IMAGE ?auto_388822 ?auto_388823 ) ( not ( = ?auto_388817 ?auto_388819 ) ) ( not ( = ?auto_388818 ?auto_388816 ) ) ( not ( = ?auto_388818 ?auto_388823 ) ) ( not ( = ?auto_388819 ?auto_388820 ) ) ( not ( = ?auto_388819 ?auto_388822 ) ) ( not ( = ?auto_388819 ?auto_388824 ) ) ( not ( = ?auto_388816 ?auto_388821 ) ) ( not ( = ?auto_388816 ?auto_388823 ) ) ( not ( = ?auto_388821 ?auto_388823 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388817 ?auto_388818 ?auto_388820 ?auto_388821 )
      ( GET-4IMAGE-VERIFY ?auto_388817 ?auto_388818 ?auto_388819 ?auto_388816 ?auto_388820 ?auto_388821 ?auto_388822 ?auto_388823 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_388840 - DIRECTION
      ?auto_388841 - MODE
      ?auto_388842 - DIRECTION
      ?auto_388839 - MODE
      ?auto_388843 - DIRECTION
      ?auto_388844 - MODE
      ?auto_388845 - DIRECTION
      ?auto_388846 - MODE
    )
    :vars
    (
      ?auto_388848 - INSTRUMENT
      ?auto_388849 - SATELLITE
      ?auto_388847 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388848 ?auto_388849 ) ( SUPPORTS ?auto_388848 ?auto_388846 ) ( not ( = ?auto_388845 ?auto_388847 ) ) ( HAVE_IMAGE ?auto_388843 ?auto_388841 ) ( not ( = ?auto_388843 ?auto_388845 ) ) ( not ( = ?auto_388843 ?auto_388847 ) ) ( not ( = ?auto_388841 ?auto_388846 ) ) ( CALIBRATION_TARGET ?auto_388848 ?auto_388847 ) ( POWER_AVAIL ?auto_388849 ) ( POINTING ?auto_388849 ?auto_388842 ) ( not ( = ?auto_388847 ?auto_388842 ) ) ( not ( = ?auto_388845 ?auto_388842 ) ) ( not ( = ?auto_388843 ?auto_388842 ) ) ( HAVE_IMAGE ?auto_388840 ?auto_388841 ) ( HAVE_IMAGE ?auto_388842 ?auto_388839 ) ( HAVE_IMAGE ?auto_388843 ?auto_388844 ) ( not ( = ?auto_388840 ?auto_388842 ) ) ( not ( = ?auto_388840 ?auto_388843 ) ) ( not ( = ?auto_388840 ?auto_388845 ) ) ( not ( = ?auto_388840 ?auto_388847 ) ) ( not ( = ?auto_388841 ?auto_388839 ) ) ( not ( = ?auto_388841 ?auto_388844 ) ) ( not ( = ?auto_388839 ?auto_388844 ) ) ( not ( = ?auto_388839 ?auto_388846 ) ) ( not ( = ?auto_388844 ?auto_388846 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388843 ?auto_388841 ?auto_388845 ?auto_388846 )
      ( GET-4IMAGE-VERIFY ?auto_388840 ?auto_388841 ?auto_388842 ?auto_388839 ?auto_388843 ?auto_388844 ?auto_388845 ?auto_388846 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_388851 - DIRECTION
      ?auto_388852 - MODE
      ?auto_388853 - DIRECTION
      ?auto_388850 - MODE
      ?auto_388854 - DIRECTION
      ?auto_388855 - MODE
      ?auto_388856 - DIRECTION
      ?auto_388857 - MODE
    )
    :vars
    (
      ?auto_388859 - INSTRUMENT
      ?auto_388860 - SATELLITE
      ?auto_388858 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388859 ?auto_388860 ) ( SUPPORTS ?auto_388859 ?auto_388857 ) ( not ( = ?auto_388856 ?auto_388858 ) ) ( HAVE_IMAGE ?auto_388851 ?auto_388852 ) ( not ( = ?auto_388851 ?auto_388856 ) ) ( not ( = ?auto_388851 ?auto_388858 ) ) ( not ( = ?auto_388852 ?auto_388857 ) ) ( CALIBRATION_TARGET ?auto_388859 ?auto_388858 ) ( POWER_AVAIL ?auto_388860 ) ( POINTING ?auto_388860 ?auto_388853 ) ( not ( = ?auto_388858 ?auto_388853 ) ) ( not ( = ?auto_388856 ?auto_388853 ) ) ( not ( = ?auto_388851 ?auto_388853 ) ) ( HAVE_IMAGE ?auto_388853 ?auto_388850 ) ( HAVE_IMAGE ?auto_388854 ?auto_388855 ) ( not ( = ?auto_388851 ?auto_388854 ) ) ( not ( = ?auto_388852 ?auto_388850 ) ) ( not ( = ?auto_388852 ?auto_388855 ) ) ( not ( = ?auto_388853 ?auto_388854 ) ) ( not ( = ?auto_388850 ?auto_388855 ) ) ( not ( = ?auto_388850 ?auto_388857 ) ) ( not ( = ?auto_388854 ?auto_388856 ) ) ( not ( = ?auto_388854 ?auto_388858 ) ) ( not ( = ?auto_388855 ?auto_388857 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388851 ?auto_388852 ?auto_388856 ?auto_388857 )
      ( GET-4IMAGE-VERIFY ?auto_388851 ?auto_388852 ?auto_388853 ?auto_388850 ?auto_388854 ?auto_388855 ?auto_388856 ?auto_388857 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_388917 - DIRECTION
      ?auto_388918 - MODE
      ?auto_388919 - DIRECTION
      ?auto_388916 - MODE
      ?auto_388920 - DIRECTION
      ?auto_388921 - MODE
      ?auto_388922 - DIRECTION
      ?auto_388923 - MODE
    )
    :vars
    (
      ?auto_388925 - INSTRUMENT
      ?auto_388926 - SATELLITE
      ?auto_388924 - DIRECTION
      ?auto_388927 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388925 ?auto_388926 ) ( SUPPORTS ?auto_388925 ?auto_388916 ) ( not ( = ?auto_388919 ?auto_388924 ) ) ( HAVE_IMAGE ?auto_388922 ?auto_388923 ) ( not ( = ?auto_388922 ?auto_388919 ) ) ( not ( = ?auto_388922 ?auto_388924 ) ) ( not ( = ?auto_388923 ?auto_388916 ) ) ( CALIBRATION_TARGET ?auto_388925 ?auto_388924 ) ( POWER_AVAIL ?auto_388926 ) ( POINTING ?auto_388926 ?auto_388927 ) ( not ( = ?auto_388924 ?auto_388927 ) ) ( not ( = ?auto_388919 ?auto_388927 ) ) ( not ( = ?auto_388922 ?auto_388927 ) ) ( HAVE_IMAGE ?auto_388917 ?auto_388918 ) ( HAVE_IMAGE ?auto_388920 ?auto_388921 ) ( not ( = ?auto_388917 ?auto_388919 ) ) ( not ( = ?auto_388917 ?auto_388920 ) ) ( not ( = ?auto_388917 ?auto_388922 ) ) ( not ( = ?auto_388917 ?auto_388924 ) ) ( not ( = ?auto_388917 ?auto_388927 ) ) ( not ( = ?auto_388918 ?auto_388916 ) ) ( not ( = ?auto_388918 ?auto_388921 ) ) ( not ( = ?auto_388918 ?auto_388923 ) ) ( not ( = ?auto_388919 ?auto_388920 ) ) ( not ( = ?auto_388916 ?auto_388921 ) ) ( not ( = ?auto_388920 ?auto_388922 ) ) ( not ( = ?auto_388920 ?auto_388924 ) ) ( not ( = ?auto_388920 ?auto_388927 ) ) ( not ( = ?auto_388921 ?auto_388923 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388922 ?auto_388923 ?auto_388919 ?auto_388916 )
      ( GET-4IMAGE-VERIFY ?auto_388917 ?auto_388918 ?auto_388919 ?auto_388916 ?auto_388920 ?auto_388921 ?auto_388922 ?auto_388923 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_388929 - DIRECTION
      ?auto_388930 - MODE
      ?auto_388931 - DIRECTION
      ?auto_388928 - MODE
      ?auto_388932 - DIRECTION
      ?auto_388933 - MODE
      ?auto_388934 - DIRECTION
      ?auto_388935 - MODE
    )
    :vars
    (
      ?auto_388937 - INSTRUMENT
      ?auto_388938 - SATELLITE
      ?auto_388936 - DIRECTION
      ?auto_388939 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_388937 ?auto_388938 ) ( SUPPORTS ?auto_388937 ?auto_388928 ) ( not ( = ?auto_388931 ?auto_388936 ) ) ( HAVE_IMAGE ?auto_388929 ?auto_388930 ) ( not ( = ?auto_388929 ?auto_388931 ) ) ( not ( = ?auto_388929 ?auto_388936 ) ) ( not ( = ?auto_388930 ?auto_388928 ) ) ( CALIBRATION_TARGET ?auto_388937 ?auto_388936 ) ( POWER_AVAIL ?auto_388938 ) ( POINTING ?auto_388938 ?auto_388939 ) ( not ( = ?auto_388936 ?auto_388939 ) ) ( not ( = ?auto_388931 ?auto_388939 ) ) ( not ( = ?auto_388929 ?auto_388939 ) ) ( HAVE_IMAGE ?auto_388932 ?auto_388933 ) ( HAVE_IMAGE ?auto_388934 ?auto_388935 ) ( not ( = ?auto_388929 ?auto_388932 ) ) ( not ( = ?auto_388929 ?auto_388934 ) ) ( not ( = ?auto_388930 ?auto_388933 ) ) ( not ( = ?auto_388930 ?auto_388935 ) ) ( not ( = ?auto_388931 ?auto_388932 ) ) ( not ( = ?auto_388931 ?auto_388934 ) ) ( not ( = ?auto_388928 ?auto_388933 ) ) ( not ( = ?auto_388928 ?auto_388935 ) ) ( not ( = ?auto_388932 ?auto_388934 ) ) ( not ( = ?auto_388932 ?auto_388936 ) ) ( not ( = ?auto_388932 ?auto_388939 ) ) ( not ( = ?auto_388933 ?auto_388935 ) ) ( not ( = ?auto_388934 ?auto_388936 ) ) ( not ( = ?auto_388934 ?auto_388939 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_388929 ?auto_388930 ?auto_388931 ?auto_388928 )
      ( GET-4IMAGE-VERIFY ?auto_388929 ?auto_388930 ?auto_388931 ?auto_388928 ?auto_388932 ?auto_388933 ?auto_388934 ?auto_388935 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389008 - DIRECTION
      ?auto_389009 - MODE
      ?auto_389010 - DIRECTION
      ?auto_389007 - MODE
      ?auto_389011 - DIRECTION
      ?auto_389012 - MODE
      ?auto_389013 - DIRECTION
      ?auto_389014 - MODE
    )
    :vars
    (
      ?auto_389016 - INSTRUMENT
      ?auto_389017 - SATELLITE
      ?auto_389015 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_389016 ?auto_389017 ) ( SUPPORTS ?auto_389016 ?auto_389007 ) ( not ( = ?auto_389010 ?auto_389015 ) ) ( HAVE_IMAGE ?auto_389013 ?auto_389009 ) ( not ( = ?auto_389013 ?auto_389010 ) ) ( not ( = ?auto_389013 ?auto_389015 ) ) ( not ( = ?auto_389009 ?auto_389007 ) ) ( CALIBRATION_TARGET ?auto_389016 ?auto_389015 ) ( POWER_AVAIL ?auto_389017 ) ( POINTING ?auto_389017 ?auto_389011 ) ( not ( = ?auto_389015 ?auto_389011 ) ) ( not ( = ?auto_389010 ?auto_389011 ) ) ( not ( = ?auto_389013 ?auto_389011 ) ) ( HAVE_IMAGE ?auto_389008 ?auto_389009 ) ( HAVE_IMAGE ?auto_389011 ?auto_389012 ) ( HAVE_IMAGE ?auto_389013 ?auto_389014 ) ( not ( = ?auto_389008 ?auto_389010 ) ) ( not ( = ?auto_389008 ?auto_389011 ) ) ( not ( = ?auto_389008 ?auto_389013 ) ) ( not ( = ?auto_389008 ?auto_389015 ) ) ( not ( = ?auto_389009 ?auto_389012 ) ) ( not ( = ?auto_389009 ?auto_389014 ) ) ( not ( = ?auto_389007 ?auto_389012 ) ) ( not ( = ?auto_389007 ?auto_389014 ) ) ( not ( = ?auto_389012 ?auto_389014 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389013 ?auto_389009 ?auto_389010 ?auto_389007 )
      ( GET-4IMAGE-VERIFY ?auto_389008 ?auto_389009 ?auto_389010 ?auto_389007 ?auto_389011 ?auto_389012 ?auto_389013 ?auto_389014 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389030 - DIRECTION
      ?auto_389031 - MODE
      ?auto_389032 - DIRECTION
      ?auto_389029 - MODE
      ?auto_389033 - DIRECTION
      ?auto_389034 - MODE
      ?auto_389035 - DIRECTION
      ?auto_389036 - MODE
    )
    :vars
    (
      ?auto_389038 - INSTRUMENT
      ?auto_389039 - SATELLITE
      ?auto_389037 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_389038 ?auto_389039 ) ( SUPPORTS ?auto_389038 ?auto_389029 ) ( not ( = ?auto_389032 ?auto_389037 ) ) ( HAVE_IMAGE ?auto_389030 ?auto_389031 ) ( not ( = ?auto_389030 ?auto_389032 ) ) ( not ( = ?auto_389030 ?auto_389037 ) ) ( not ( = ?auto_389031 ?auto_389029 ) ) ( CALIBRATION_TARGET ?auto_389038 ?auto_389037 ) ( POWER_AVAIL ?auto_389039 ) ( POINTING ?auto_389039 ?auto_389035 ) ( not ( = ?auto_389037 ?auto_389035 ) ) ( not ( = ?auto_389032 ?auto_389035 ) ) ( not ( = ?auto_389030 ?auto_389035 ) ) ( HAVE_IMAGE ?auto_389033 ?auto_389034 ) ( HAVE_IMAGE ?auto_389035 ?auto_389036 ) ( not ( = ?auto_389030 ?auto_389033 ) ) ( not ( = ?auto_389031 ?auto_389034 ) ) ( not ( = ?auto_389031 ?auto_389036 ) ) ( not ( = ?auto_389032 ?auto_389033 ) ) ( not ( = ?auto_389029 ?auto_389034 ) ) ( not ( = ?auto_389029 ?auto_389036 ) ) ( not ( = ?auto_389033 ?auto_389035 ) ) ( not ( = ?auto_389033 ?auto_389037 ) ) ( not ( = ?auto_389034 ?auto_389036 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389030 ?auto_389031 ?auto_389032 ?auto_389029 )
      ( GET-4IMAGE-VERIFY ?auto_389030 ?auto_389031 ?auto_389032 ?auto_389029 ?auto_389033 ?auto_389034 ?auto_389035 ?auto_389036 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389099 - DIRECTION
      ?auto_389100 - MODE
      ?auto_389101 - DIRECTION
      ?auto_389098 - MODE
      ?auto_389102 - DIRECTION
      ?auto_389103 - MODE
      ?auto_389104 - DIRECTION
      ?auto_389105 - MODE
    )
    :vars
    (
      ?auto_389107 - INSTRUMENT
      ?auto_389108 - SATELLITE
      ?auto_389106 - DIRECTION
      ?auto_389109 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_389107 ?auto_389108 ) ( SUPPORTS ?auto_389107 ?auto_389105 ) ( not ( = ?auto_389104 ?auto_389106 ) ) ( HAVE_IMAGE ?auto_389102 ?auto_389098 ) ( not ( = ?auto_389102 ?auto_389104 ) ) ( not ( = ?auto_389102 ?auto_389106 ) ) ( not ( = ?auto_389098 ?auto_389105 ) ) ( CALIBRATION_TARGET ?auto_389107 ?auto_389106 ) ( POWER_AVAIL ?auto_389108 ) ( POINTING ?auto_389108 ?auto_389109 ) ( not ( = ?auto_389106 ?auto_389109 ) ) ( not ( = ?auto_389104 ?auto_389109 ) ) ( not ( = ?auto_389102 ?auto_389109 ) ) ( HAVE_IMAGE ?auto_389099 ?auto_389100 ) ( HAVE_IMAGE ?auto_389101 ?auto_389098 ) ( HAVE_IMAGE ?auto_389102 ?auto_389103 ) ( not ( = ?auto_389099 ?auto_389101 ) ) ( not ( = ?auto_389099 ?auto_389102 ) ) ( not ( = ?auto_389099 ?auto_389104 ) ) ( not ( = ?auto_389099 ?auto_389106 ) ) ( not ( = ?auto_389099 ?auto_389109 ) ) ( not ( = ?auto_389100 ?auto_389098 ) ) ( not ( = ?auto_389100 ?auto_389103 ) ) ( not ( = ?auto_389100 ?auto_389105 ) ) ( not ( = ?auto_389101 ?auto_389102 ) ) ( not ( = ?auto_389101 ?auto_389104 ) ) ( not ( = ?auto_389101 ?auto_389106 ) ) ( not ( = ?auto_389101 ?auto_389109 ) ) ( not ( = ?auto_389098 ?auto_389103 ) ) ( not ( = ?auto_389103 ?auto_389105 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389102 ?auto_389098 ?auto_389104 ?auto_389105 )
      ( GET-4IMAGE-VERIFY ?auto_389099 ?auto_389100 ?auto_389101 ?auto_389098 ?auto_389102 ?auto_389103 ?auto_389104 ?auto_389105 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389131 - DIRECTION
      ?auto_389132 - MODE
      ?auto_389133 - DIRECTION
      ?auto_389130 - MODE
      ?auto_389134 - DIRECTION
      ?auto_389135 - MODE
      ?auto_389136 - DIRECTION
      ?auto_389137 - MODE
    )
    :vars
    (
      ?auto_389139 - INSTRUMENT
      ?auto_389140 - SATELLITE
      ?auto_389138 - DIRECTION
      ?auto_389141 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_389139 ?auto_389140 ) ( SUPPORTS ?auto_389139 ?auto_389135 ) ( not ( = ?auto_389134 ?auto_389138 ) ) ( HAVE_IMAGE ?auto_389133 ?auto_389130 ) ( not ( = ?auto_389133 ?auto_389134 ) ) ( not ( = ?auto_389133 ?auto_389138 ) ) ( not ( = ?auto_389130 ?auto_389135 ) ) ( CALIBRATION_TARGET ?auto_389139 ?auto_389138 ) ( POWER_AVAIL ?auto_389140 ) ( POINTING ?auto_389140 ?auto_389141 ) ( not ( = ?auto_389138 ?auto_389141 ) ) ( not ( = ?auto_389134 ?auto_389141 ) ) ( not ( = ?auto_389133 ?auto_389141 ) ) ( HAVE_IMAGE ?auto_389131 ?auto_389132 ) ( HAVE_IMAGE ?auto_389136 ?auto_389137 ) ( not ( = ?auto_389131 ?auto_389133 ) ) ( not ( = ?auto_389131 ?auto_389134 ) ) ( not ( = ?auto_389131 ?auto_389136 ) ) ( not ( = ?auto_389131 ?auto_389138 ) ) ( not ( = ?auto_389131 ?auto_389141 ) ) ( not ( = ?auto_389132 ?auto_389130 ) ) ( not ( = ?auto_389132 ?auto_389135 ) ) ( not ( = ?auto_389132 ?auto_389137 ) ) ( not ( = ?auto_389133 ?auto_389136 ) ) ( not ( = ?auto_389130 ?auto_389137 ) ) ( not ( = ?auto_389134 ?auto_389136 ) ) ( not ( = ?auto_389135 ?auto_389137 ) ) ( not ( = ?auto_389136 ?auto_389138 ) ) ( not ( = ?auto_389136 ?auto_389141 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389133 ?auto_389130 ?auto_389134 ?auto_389135 )
      ( GET-4IMAGE-VERIFY ?auto_389131 ?auto_389132 ?auto_389133 ?auto_389130 ?auto_389134 ?auto_389135 ?auto_389136 ?auto_389137 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389175 - DIRECTION
      ?auto_389176 - MODE
      ?auto_389177 - DIRECTION
      ?auto_389174 - MODE
      ?auto_389178 - DIRECTION
      ?auto_389179 - MODE
      ?auto_389180 - DIRECTION
      ?auto_389181 - MODE
    )
    :vars
    (
      ?auto_389183 - INSTRUMENT
      ?auto_389184 - SATELLITE
      ?auto_389182 - DIRECTION
      ?auto_389185 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_389183 ?auto_389184 ) ( SUPPORTS ?auto_389183 ?auto_389181 ) ( not ( = ?auto_389180 ?auto_389182 ) ) ( HAVE_IMAGE ?auto_389178 ?auto_389179 ) ( not ( = ?auto_389178 ?auto_389180 ) ) ( not ( = ?auto_389178 ?auto_389182 ) ) ( not ( = ?auto_389179 ?auto_389181 ) ) ( CALIBRATION_TARGET ?auto_389183 ?auto_389182 ) ( POWER_AVAIL ?auto_389184 ) ( POINTING ?auto_389184 ?auto_389185 ) ( not ( = ?auto_389182 ?auto_389185 ) ) ( not ( = ?auto_389180 ?auto_389185 ) ) ( not ( = ?auto_389178 ?auto_389185 ) ) ( HAVE_IMAGE ?auto_389175 ?auto_389176 ) ( HAVE_IMAGE ?auto_389177 ?auto_389174 ) ( not ( = ?auto_389175 ?auto_389177 ) ) ( not ( = ?auto_389175 ?auto_389178 ) ) ( not ( = ?auto_389175 ?auto_389180 ) ) ( not ( = ?auto_389175 ?auto_389182 ) ) ( not ( = ?auto_389175 ?auto_389185 ) ) ( not ( = ?auto_389176 ?auto_389174 ) ) ( not ( = ?auto_389176 ?auto_389179 ) ) ( not ( = ?auto_389176 ?auto_389181 ) ) ( not ( = ?auto_389177 ?auto_389178 ) ) ( not ( = ?auto_389177 ?auto_389180 ) ) ( not ( = ?auto_389177 ?auto_389182 ) ) ( not ( = ?auto_389177 ?auto_389185 ) ) ( not ( = ?auto_389174 ?auto_389179 ) ) ( not ( = ?auto_389174 ?auto_389181 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389178 ?auto_389179 ?auto_389180 ?auto_389181 )
      ( GET-4IMAGE-VERIFY ?auto_389175 ?auto_389176 ?auto_389177 ?auto_389174 ?auto_389178 ?auto_389179 ?auto_389180 ?auto_389181 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389187 - DIRECTION
      ?auto_389188 - MODE
      ?auto_389189 - DIRECTION
      ?auto_389186 - MODE
      ?auto_389190 - DIRECTION
      ?auto_389191 - MODE
      ?auto_389192 - DIRECTION
      ?auto_389193 - MODE
    )
    :vars
    (
      ?auto_389197 - INSTRUMENT
      ?auto_389198 - SATELLITE
      ?auto_389194 - DIRECTION
      ?auto_389195 - DIRECTION
      ?auto_389196 - MODE
      ?auto_389199 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_389197 ?auto_389198 ) ( SUPPORTS ?auto_389197 ?auto_389193 ) ( not ( = ?auto_389192 ?auto_389194 ) ) ( HAVE_IMAGE ?auto_389195 ?auto_389196 ) ( not ( = ?auto_389195 ?auto_389192 ) ) ( not ( = ?auto_389195 ?auto_389194 ) ) ( not ( = ?auto_389196 ?auto_389193 ) ) ( CALIBRATION_TARGET ?auto_389197 ?auto_389194 ) ( POWER_AVAIL ?auto_389198 ) ( POINTING ?auto_389198 ?auto_389199 ) ( not ( = ?auto_389194 ?auto_389199 ) ) ( not ( = ?auto_389192 ?auto_389199 ) ) ( not ( = ?auto_389195 ?auto_389199 ) ) ( HAVE_IMAGE ?auto_389187 ?auto_389188 ) ( HAVE_IMAGE ?auto_389189 ?auto_389186 ) ( HAVE_IMAGE ?auto_389190 ?auto_389191 ) ( not ( = ?auto_389187 ?auto_389189 ) ) ( not ( = ?auto_389187 ?auto_389190 ) ) ( not ( = ?auto_389187 ?auto_389192 ) ) ( not ( = ?auto_389187 ?auto_389194 ) ) ( not ( = ?auto_389187 ?auto_389195 ) ) ( not ( = ?auto_389187 ?auto_389199 ) ) ( not ( = ?auto_389188 ?auto_389186 ) ) ( not ( = ?auto_389188 ?auto_389191 ) ) ( not ( = ?auto_389188 ?auto_389193 ) ) ( not ( = ?auto_389188 ?auto_389196 ) ) ( not ( = ?auto_389189 ?auto_389190 ) ) ( not ( = ?auto_389189 ?auto_389192 ) ) ( not ( = ?auto_389189 ?auto_389194 ) ) ( not ( = ?auto_389189 ?auto_389195 ) ) ( not ( = ?auto_389189 ?auto_389199 ) ) ( not ( = ?auto_389186 ?auto_389191 ) ) ( not ( = ?auto_389186 ?auto_389193 ) ) ( not ( = ?auto_389186 ?auto_389196 ) ) ( not ( = ?auto_389190 ?auto_389192 ) ) ( not ( = ?auto_389190 ?auto_389194 ) ) ( not ( = ?auto_389190 ?auto_389195 ) ) ( not ( = ?auto_389190 ?auto_389199 ) ) ( not ( = ?auto_389191 ?auto_389193 ) ) ( not ( = ?auto_389191 ?auto_389196 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389195 ?auto_389196 ?auto_389192 ?auto_389193 )
      ( GET-4IMAGE-VERIFY ?auto_389187 ?auto_389188 ?auto_389189 ?auto_389186 ?auto_389190 ?auto_389191 ?auto_389192 ?auto_389193 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389214 - DIRECTION
      ?auto_389215 - MODE
      ?auto_389216 - DIRECTION
      ?auto_389213 - MODE
      ?auto_389217 - DIRECTION
      ?auto_389218 - MODE
      ?auto_389219 - DIRECTION
      ?auto_389220 - MODE
    )
    :vars
    (
      ?auto_389222 - INSTRUMENT
      ?auto_389223 - SATELLITE
      ?auto_389221 - DIRECTION
      ?auto_389224 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_389222 ?auto_389223 ) ( SUPPORTS ?auto_389222 ?auto_389218 ) ( not ( = ?auto_389217 ?auto_389221 ) ) ( HAVE_IMAGE ?auto_389219 ?auto_389220 ) ( not ( = ?auto_389219 ?auto_389217 ) ) ( not ( = ?auto_389219 ?auto_389221 ) ) ( not ( = ?auto_389220 ?auto_389218 ) ) ( CALIBRATION_TARGET ?auto_389222 ?auto_389221 ) ( POWER_AVAIL ?auto_389223 ) ( POINTING ?auto_389223 ?auto_389224 ) ( not ( = ?auto_389221 ?auto_389224 ) ) ( not ( = ?auto_389217 ?auto_389224 ) ) ( not ( = ?auto_389219 ?auto_389224 ) ) ( HAVE_IMAGE ?auto_389214 ?auto_389215 ) ( HAVE_IMAGE ?auto_389216 ?auto_389213 ) ( not ( = ?auto_389214 ?auto_389216 ) ) ( not ( = ?auto_389214 ?auto_389217 ) ) ( not ( = ?auto_389214 ?auto_389219 ) ) ( not ( = ?auto_389214 ?auto_389221 ) ) ( not ( = ?auto_389214 ?auto_389224 ) ) ( not ( = ?auto_389215 ?auto_389213 ) ) ( not ( = ?auto_389215 ?auto_389218 ) ) ( not ( = ?auto_389215 ?auto_389220 ) ) ( not ( = ?auto_389216 ?auto_389217 ) ) ( not ( = ?auto_389216 ?auto_389219 ) ) ( not ( = ?auto_389216 ?auto_389221 ) ) ( not ( = ?auto_389216 ?auto_389224 ) ) ( not ( = ?auto_389213 ?auto_389218 ) ) ( not ( = ?auto_389213 ?auto_389220 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389219 ?auto_389220 ?auto_389217 ?auto_389218 )
      ( GET-4IMAGE-VERIFY ?auto_389214 ?auto_389215 ?auto_389216 ?auto_389213 ?auto_389217 ?auto_389218 ?auto_389219 ?auto_389220 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389226 - DIRECTION
      ?auto_389227 - MODE
      ?auto_389228 - DIRECTION
      ?auto_389225 - MODE
      ?auto_389229 - DIRECTION
      ?auto_389230 - MODE
      ?auto_389231 - DIRECTION
      ?auto_389232 - MODE
    )
    :vars
    (
      ?auto_389236 - INSTRUMENT
      ?auto_389237 - SATELLITE
      ?auto_389233 - DIRECTION
      ?auto_389234 - DIRECTION
      ?auto_389235 - MODE
      ?auto_389238 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_389236 ?auto_389237 ) ( SUPPORTS ?auto_389236 ?auto_389230 ) ( not ( = ?auto_389229 ?auto_389233 ) ) ( HAVE_IMAGE ?auto_389234 ?auto_389235 ) ( not ( = ?auto_389234 ?auto_389229 ) ) ( not ( = ?auto_389234 ?auto_389233 ) ) ( not ( = ?auto_389235 ?auto_389230 ) ) ( CALIBRATION_TARGET ?auto_389236 ?auto_389233 ) ( POWER_AVAIL ?auto_389237 ) ( POINTING ?auto_389237 ?auto_389238 ) ( not ( = ?auto_389233 ?auto_389238 ) ) ( not ( = ?auto_389229 ?auto_389238 ) ) ( not ( = ?auto_389234 ?auto_389238 ) ) ( HAVE_IMAGE ?auto_389226 ?auto_389227 ) ( HAVE_IMAGE ?auto_389228 ?auto_389225 ) ( HAVE_IMAGE ?auto_389231 ?auto_389232 ) ( not ( = ?auto_389226 ?auto_389228 ) ) ( not ( = ?auto_389226 ?auto_389229 ) ) ( not ( = ?auto_389226 ?auto_389231 ) ) ( not ( = ?auto_389226 ?auto_389233 ) ) ( not ( = ?auto_389226 ?auto_389234 ) ) ( not ( = ?auto_389226 ?auto_389238 ) ) ( not ( = ?auto_389227 ?auto_389225 ) ) ( not ( = ?auto_389227 ?auto_389230 ) ) ( not ( = ?auto_389227 ?auto_389232 ) ) ( not ( = ?auto_389227 ?auto_389235 ) ) ( not ( = ?auto_389228 ?auto_389229 ) ) ( not ( = ?auto_389228 ?auto_389231 ) ) ( not ( = ?auto_389228 ?auto_389233 ) ) ( not ( = ?auto_389228 ?auto_389234 ) ) ( not ( = ?auto_389228 ?auto_389238 ) ) ( not ( = ?auto_389225 ?auto_389230 ) ) ( not ( = ?auto_389225 ?auto_389232 ) ) ( not ( = ?auto_389225 ?auto_389235 ) ) ( not ( = ?auto_389229 ?auto_389231 ) ) ( not ( = ?auto_389230 ?auto_389232 ) ) ( not ( = ?auto_389231 ?auto_389233 ) ) ( not ( = ?auto_389231 ?auto_389234 ) ) ( not ( = ?auto_389231 ?auto_389238 ) ) ( not ( = ?auto_389232 ?auto_389235 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389234 ?auto_389235 ?auto_389229 ?auto_389230 )
      ( GET-4IMAGE-VERIFY ?auto_389226 ?auto_389227 ?auto_389228 ?auto_389225 ?auto_389229 ?auto_389230 ?auto_389231 ?auto_389232 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389240 - DIRECTION
      ?auto_389241 - MODE
      ?auto_389242 - DIRECTION
      ?auto_389239 - MODE
      ?auto_389243 - DIRECTION
      ?auto_389244 - MODE
      ?auto_389245 - DIRECTION
      ?auto_389246 - MODE
    )
    :vars
    (
      ?auto_389250 - INSTRUMENT
      ?auto_389251 - SATELLITE
      ?auto_389247 - DIRECTION
      ?auto_389248 - DIRECTION
      ?auto_389249 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_389250 ?auto_389251 ) ( SUPPORTS ?auto_389250 ?auto_389244 ) ( not ( = ?auto_389243 ?auto_389247 ) ) ( HAVE_IMAGE ?auto_389248 ?auto_389249 ) ( not ( = ?auto_389248 ?auto_389243 ) ) ( not ( = ?auto_389248 ?auto_389247 ) ) ( not ( = ?auto_389249 ?auto_389244 ) ) ( CALIBRATION_TARGET ?auto_389250 ?auto_389247 ) ( POWER_AVAIL ?auto_389251 ) ( POINTING ?auto_389251 ?auto_389245 ) ( not ( = ?auto_389247 ?auto_389245 ) ) ( not ( = ?auto_389243 ?auto_389245 ) ) ( not ( = ?auto_389248 ?auto_389245 ) ) ( HAVE_IMAGE ?auto_389240 ?auto_389241 ) ( HAVE_IMAGE ?auto_389242 ?auto_389239 ) ( HAVE_IMAGE ?auto_389245 ?auto_389246 ) ( not ( = ?auto_389240 ?auto_389242 ) ) ( not ( = ?auto_389240 ?auto_389243 ) ) ( not ( = ?auto_389240 ?auto_389245 ) ) ( not ( = ?auto_389240 ?auto_389247 ) ) ( not ( = ?auto_389240 ?auto_389248 ) ) ( not ( = ?auto_389241 ?auto_389239 ) ) ( not ( = ?auto_389241 ?auto_389244 ) ) ( not ( = ?auto_389241 ?auto_389246 ) ) ( not ( = ?auto_389241 ?auto_389249 ) ) ( not ( = ?auto_389242 ?auto_389243 ) ) ( not ( = ?auto_389242 ?auto_389245 ) ) ( not ( = ?auto_389242 ?auto_389247 ) ) ( not ( = ?auto_389242 ?auto_389248 ) ) ( not ( = ?auto_389239 ?auto_389244 ) ) ( not ( = ?auto_389239 ?auto_389246 ) ) ( not ( = ?auto_389239 ?auto_389249 ) ) ( not ( = ?auto_389244 ?auto_389246 ) ) ( not ( = ?auto_389246 ?auto_389249 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389248 ?auto_389249 ?auto_389243 ?auto_389244 )
      ( GET-4IMAGE-VERIFY ?auto_389240 ?auto_389241 ?auto_389242 ?auto_389239 ?auto_389243 ?auto_389244 ?auto_389245 ?auto_389246 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389275 - DIRECTION
      ?auto_389276 - MODE
      ?auto_389277 - DIRECTION
      ?auto_389274 - MODE
      ?auto_389278 - DIRECTION
      ?auto_389279 - MODE
      ?auto_389280 - DIRECTION
      ?auto_389281 - MODE
    )
    :vars
    (
      ?auto_389285 - INSTRUMENT
      ?auto_389286 - SATELLITE
      ?auto_389282 - DIRECTION
      ?auto_389283 - DIRECTION
      ?auto_389284 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_389285 ?auto_389286 ) ( SUPPORTS ?auto_389285 ?auto_389281 ) ( not ( = ?auto_389280 ?auto_389282 ) ) ( HAVE_IMAGE ?auto_389283 ?auto_389284 ) ( not ( = ?auto_389283 ?auto_389280 ) ) ( not ( = ?auto_389283 ?auto_389282 ) ) ( not ( = ?auto_389284 ?auto_389281 ) ) ( CALIBRATION_TARGET ?auto_389285 ?auto_389282 ) ( POWER_AVAIL ?auto_389286 ) ( POINTING ?auto_389286 ?auto_389277 ) ( not ( = ?auto_389282 ?auto_389277 ) ) ( not ( = ?auto_389280 ?auto_389277 ) ) ( not ( = ?auto_389283 ?auto_389277 ) ) ( HAVE_IMAGE ?auto_389275 ?auto_389276 ) ( HAVE_IMAGE ?auto_389277 ?auto_389274 ) ( HAVE_IMAGE ?auto_389278 ?auto_389279 ) ( not ( = ?auto_389275 ?auto_389277 ) ) ( not ( = ?auto_389275 ?auto_389278 ) ) ( not ( = ?auto_389275 ?auto_389280 ) ) ( not ( = ?auto_389275 ?auto_389282 ) ) ( not ( = ?auto_389275 ?auto_389283 ) ) ( not ( = ?auto_389276 ?auto_389274 ) ) ( not ( = ?auto_389276 ?auto_389279 ) ) ( not ( = ?auto_389276 ?auto_389281 ) ) ( not ( = ?auto_389276 ?auto_389284 ) ) ( not ( = ?auto_389277 ?auto_389278 ) ) ( not ( = ?auto_389274 ?auto_389279 ) ) ( not ( = ?auto_389274 ?auto_389281 ) ) ( not ( = ?auto_389274 ?auto_389284 ) ) ( not ( = ?auto_389278 ?auto_389280 ) ) ( not ( = ?auto_389278 ?auto_389282 ) ) ( not ( = ?auto_389278 ?auto_389283 ) ) ( not ( = ?auto_389279 ?auto_389281 ) ) ( not ( = ?auto_389279 ?auto_389284 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389283 ?auto_389284 ?auto_389280 ?auto_389281 )
      ( GET-4IMAGE-VERIFY ?auto_389275 ?auto_389276 ?auto_389277 ?auto_389274 ?auto_389278 ?auto_389279 ?auto_389280 ?auto_389281 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389360 - DIRECTION
      ?auto_389361 - MODE
      ?auto_389362 - DIRECTION
      ?auto_389359 - MODE
      ?auto_389363 - DIRECTION
      ?auto_389364 - MODE
      ?auto_389365 - DIRECTION
      ?auto_389366 - MODE
    )
    :vars
    (
      ?auto_389368 - INSTRUMENT
      ?auto_389369 - SATELLITE
      ?auto_389367 - DIRECTION
      ?auto_389370 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_389368 ?auto_389369 ) ( SUPPORTS ?auto_389368 ?auto_389359 ) ( not ( = ?auto_389362 ?auto_389367 ) ) ( HAVE_IMAGE ?auto_389363 ?auto_389364 ) ( not ( = ?auto_389363 ?auto_389362 ) ) ( not ( = ?auto_389363 ?auto_389367 ) ) ( not ( = ?auto_389364 ?auto_389359 ) ) ( CALIBRATION_TARGET ?auto_389368 ?auto_389367 ) ( POWER_AVAIL ?auto_389369 ) ( POINTING ?auto_389369 ?auto_389370 ) ( not ( = ?auto_389367 ?auto_389370 ) ) ( not ( = ?auto_389362 ?auto_389370 ) ) ( not ( = ?auto_389363 ?auto_389370 ) ) ( HAVE_IMAGE ?auto_389360 ?auto_389361 ) ( HAVE_IMAGE ?auto_389365 ?auto_389366 ) ( not ( = ?auto_389360 ?auto_389362 ) ) ( not ( = ?auto_389360 ?auto_389363 ) ) ( not ( = ?auto_389360 ?auto_389365 ) ) ( not ( = ?auto_389360 ?auto_389367 ) ) ( not ( = ?auto_389360 ?auto_389370 ) ) ( not ( = ?auto_389361 ?auto_389359 ) ) ( not ( = ?auto_389361 ?auto_389364 ) ) ( not ( = ?auto_389361 ?auto_389366 ) ) ( not ( = ?auto_389362 ?auto_389365 ) ) ( not ( = ?auto_389359 ?auto_389366 ) ) ( not ( = ?auto_389363 ?auto_389365 ) ) ( not ( = ?auto_389364 ?auto_389366 ) ) ( not ( = ?auto_389365 ?auto_389367 ) ) ( not ( = ?auto_389365 ?auto_389370 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389363 ?auto_389364 ?auto_389362 ?auto_389359 )
      ( GET-4IMAGE-VERIFY ?auto_389360 ?auto_389361 ?auto_389362 ?auto_389359 ?auto_389363 ?auto_389364 ?auto_389365 ?auto_389366 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389404 - DIRECTION
      ?auto_389405 - MODE
      ?auto_389406 - DIRECTION
      ?auto_389403 - MODE
      ?auto_389407 - DIRECTION
      ?auto_389408 - MODE
      ?auto_389409 - DIRECTION
      ?auto_389410 - MODE
    )
    :vars
    (
      ?auto_389414 - INSTRUMENT
      ?auto_389415 - SATELLITE
      ?auto_389411 - DIRECTION
      ?auto_389412 - DIRECTION
      ?auto_389413 - MODE
      ?auto_389416 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_389414 ?auto_389415 ) ( SUPPORTS ?auto_389414 ?auto_389403 ) ( not ( = ?auto_389406 ?auto_389411 ) ) ( HAVE_IMAGE ?auto_389412 ?auto_389413 ) ( not ( = ?auto_389412 ?auto_389406 ) ) ( not ( = ?auto_389412 ?auto_389411 ) ) ( not ( = ?auto_389413 ?auto_389403 ) ) ( CALIBRATION_TARGET ?auto_389414 ?auto_389411 ) ( POWER_AVAIL ?auto_389415 ) ( POINTING ?auto_389415 ?auto_389416 ) ( not ( = ?auto_389411 ?auto_389416 ) ) ( not ( = ?auto_389406 ?auto_389416 ) ) ( not ( = ?auto_389412 ?auto_389416 ) ) ( HAVE_IMAGE ?auto_389404 ?auto_389405 ) ( HAVE_IMAGE ?auto_389407 ?auto_389408 ) ( HAVE_IMAGE ?auto_389409 ?auto_389410 ) ( not ( = ?auto_389404 ?auto_389406 ) ) ( not ( = ?auto_389404 ?auto_389407 ) ) ( not ( = ?auto_389404 ?auto_389409 ) ) ( not ( = ?auto_389404 ?auto_389411 ) ) ( not ( = ?auto_389404 ?auto_389412 ) ) ( not ( = ?auto_389404 ?auto_389416 ) ) ( not ( = ?auto_389405 ?auto_389403 ) ) ( not ( = ?auto_389405 ?auto_389408 ) ) ( not ( = ?auto_389405 ?auto_389410 ) ) ( not ( = ?auto_389405 ?auto_389413 ) ) ( not ( = ?auto_389406 ?auto_389407 ) ) ( not ( = ?auto_389406 ?auto_389409 ) ) ( not ( = ?auto_389403 ?auto_389408 ) ) ( not ( = ?auto_389403 ?auto_389410 ) ) ( not ( = ?auto_389407 ?auto_389409 ) ) ( not ( = ?auto_389407 ?auto_389411 ) ) ( not ( = ?auto_389407 ?auto_389412 ) ) ( not ( = ?auto_389407 ?auto_389416 ) ) ( not ( = ?auto_389408 ?auto_389410 ) ) ( not ( = ?auto_389408 ?auto_389413 ) ) ( not ( = ?auto_389409 ?auto_389411 ) ) ( not ( = ?auto_389409 ?auto_389412 ) ) ( not ( = ?auto_389409 ?auto_389416 ) ) ( not ( = ?auto_389410 ?auto_389413 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389412 ?auto_389413 ?auto_389406 ?auto_389403 )
      ( GET-4IMAGE-VERIFY ?auto_389404 ?auto_389405 ?auto_389406 ?auto_389403 ?auto_389407 ?auto_389408 ?auto_389409 ?auto_389410 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389418 - DIRECTION
      ?auto_389419 - MODE
      ?auto_389420 - DIRECTION
      ?auto_389417 - MODE
      ?auto_389421 - DIRECTION
      ?auto_389422 - MODE
      ?auto_389423 - DIRECTION
      ?auto_389424 - MODE
    )
    :vars
    (
      ?auto_389428 - INSTRUMENT
      ?auto_389429 - SATELLITE
      ?auto_389425 - DIRECTION
      ?auto_389426 - DIRECTION
      ?auto_389427 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_389428 ?auto_389429 ) ( SUPPORTS ?auto_389428 ?auto_389417 ) ( not ( = ?auto_389420 ?auto_389425 ) ) ( HAVE_IMAGE ?auto_389426 ?auto_389427 ) ( not ( = ?auto_389426 ?auto_389420 ) ) ( not ( = ?auto_389426 ?auto_389425 ) ) ( not ( = ?auto_389427 ?auto_389417 ) ) ( CALIBRATION_TARGET ?auto_389428 ?auto_389425 ) ( POWER_AVAIL ?auto_389429 ) ( POINTING ?auto_389429 ?auto_389423 ) ( not ( = ?auto_389425 ?auto_389423 ) ) ( not ( = ?auto_389420 ?auto_389423 ) ) ( not ( = ?auto_389426 ?auto_389423 ) ) ( HAVE_IMAGE ?auto_389418 ?auto_389419 ) ( HAVE_IMAGE ?auto_389421 ?auto_389422 ) ( HAVE_IMAGE ?auto_389423 ?auto_389424 ) ( not ( = ?auto_389418 ?auto_389420 ) ) ( not ( = ?auto_389418 ?auto_389421 ) ) ( not ( = ?auto_389418 ?auto_389423 ) ) ( not ( = ?auto_389418 ?auto_389425 ) ) ( not ( = ?auto_389418 ?auto_389426 ) ) ( not ( = ?auto_389419 ?auto_389417 ) ) ( not ( = ?auto_389419 ?auto_389422 ) ) ( not ( = ?auto_389419 ?auto_389424 ) ) ( not ( = ?auto_389419 ?auto_389427 ) ) ( not ( = ?auto_389420 ?auto_389421 ) ) ( not ( = ?auto_389417 ?auto_389422 ) ) ( not ( = ?auto_389417 ?auto_389424 ) ) ( not ( = ?auto_389421 ?auto_389423 ) ) ( not ( = ?auto_389421 ?auto_389425 ) ) ( not ( = ?auto_389421 ?auto_389426 ) ) ( not ( = ?auto_389422 ?auto_389424 ) ) ( not ( = ?auto_389422 ?auto_389427 ) ) ( not ( = ?auto_389424 ?auto_389427 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389426 ?auto_389427 ?auto_389420 ?auto_389417 )
      ( GET-4IMAGE-VERIFY ?auto_389418 ?auto_389419 ?auto_389420 ?auto_389417 ?auto_389421 ?auto_389422 ?auto_389423 ?auto_389424 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389545 - DIRECTION
      ?auto_389546 - MODE
      ?auto_389547 - DIRECTION
      ?auto_389544 - MODE
      ?auto_389548 - DIRECTION
      ?auto_389549 - MODE
      ?auto_389550 - DIRECTION
      ?auto_389551 - MODE
    )
    :vars
    (
      ?auto_389553 - INSTRUMENT
      ?auto_389554 - SATELLITE
      ?auto_389552 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_389553 ?auto_389554 ) ( SUPPORTS ?auto_389553 ?auto_389551 ) ( not ( = ?auto_389550 ?auto_389552 ) ) ( HAVE_IMAGE ?auto_389547 ?auto_389549 ) ( not ( = ?auto_389547 ?auto_389550 ) ) ( not ( = ?auto_389547 ?auto_389552 ) ) ( not ( = ?auto_389549 ?auto_389551 ) ) ( CALIBRATION_TARGET ?auto_389553 ?auto_389552 ) ( POWER_AVAIL ?auto_389554 ) ( POINTING ?auto_389554 ?auto_389545 ) ( not ( = ?auto_389552 ?auto_389545 ) ) ( not ( = ?auto_389550 ?auto_389545 ) ) ( not ( = ?auto_389547 ?auto_389545 ) ) ( HAVE_IMAGE ?auto_389545 ?auto_389546 ) ( HAVE_IMAGE ?auto_389547 ?auto_389544 ) ( HAVE_IMAGE ?auto_389548 ?auto_389549 ) ( not ( = ?auto_389545 ?auto_389548 ) ) ( not ( = ?auto_389546 ?auto_389544 ) ) ( not ( = ?auto_389546 ?auto_389549 ) ) ( not ( = ?auto_389546 ?auto_389551 ) ) ( not ( = ?auto_389547 ?auto_389548 ) ) ( not ( = ?auto_389544 ?auto_389549 ) ) ( not ( = ?auto_389544 ?auto_389551 ) ) ( not ( = ?auto_389548 ?auto_389550 ) ) ( not ( = ?auto_389548 ?auto_389552 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389547 ?auto_389549 ?auto_389550 ?auto_389551 )
      ( GET-4IMAGE-VERIFY ?auto_389545 ?auto_389546 ?auto_389547 ?auto_389544 ?auto_389548 ?auto_389549 ?auto_389550 ?auto_389551 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389556 - DIRECTION
      ?auto_389557 - MODE
      ?auto_389558 - DIRECTION
      ?auto_389555 - MODE
      ?auto_389559 - DIRECTION
      ?auto_389560 - MODE
      ?auto_389561 - DIRECTION
      ?auto_389562 - MODE
    )
    :vars
    (
      ?auto_389564 - INSTRUMENT
      ?auto_389565 - SATELLITE
      ?auto_389563 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_389564 ?auto_389565 ) ( SUPPORTS ?auto_389564 ?auto_389562 ) ( not ( = ?auto_389561 ?auto_389563 ) ) ( HAVE_IMAGE ?auto_389558 ?auto_389555 ) ( not ( = ?auto_389558 ?auto_389561 ) ) ( not ( = ?auto_389558 ?auto_389563 ) ) ( not ( = ?auto_389555 ?auto_389562 ) ) ( CALIBRATION_TARGET ?auto_389564 ?auto_389563 ) ( POWER_AVAIL ?auto_389565 ) ( POINTING ?auto_389565 ?auto_389556 ) ( not ( = ?auto_389563 ?auto_389556 ) ) ( not ( = ?auto_389561 ?auto_389556 ) ) ( not ( = ?auto_389558 ?auto_389556 ) ) ( HAVE_IMAGE ?auto_389556 ?auto_389557 ) ( HAVE_IMAGE ?auto_389559 ?auto_389560 ) ( not ( = ?auto_389556 ?auto_389559 ) ) ( not ( = ?auto_389557 ?auto_389555 ) ) ( not ( = ?auto_389557 ?auto_389560 ) ) ( not ( = ?auto_389557 ?auto_389562 ) ) ( not ( = ?auto_389558 ?auto_389559 ) ) ( not ( = ?auto_389555 ?auto_389560 ) ) ( not ( = ?auto_389559 ?auto_389561 ) ) ( not ( = ?auto_389559 ?auto_389563 ) ) ( not ( = ?auto_389560 ?auto_389562 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389558 ?auto_389555 ?auto_389561 ?auto_389562 )
      ( GET-4IMAGE-VERIFY ?auto_389556 ?auto_389557 ?auto_389558 ?auto_389555 ?auto_389559 ?auto_389560 ?auto_389561 ?auto_389562 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389630 - DIRECTION
      ?auto_389631 - MODE
      ?auto_389632 - DIRECTION
      ?auto_389629 - MODE
      ?auto_389633 - DIRECTION
      ?auto_389634 - MODE
      ?auto_389635 - DIRECTION
      ?auto_389636 - MODE
    )
    :vars
    (
      ?auto_389640 - INSTRUMENT
      ?auto_389641 - SATELLITE
      ?auto_389637 - DIRECTION
      ?auto_389638 - DIRECTION
      ?auto_389639 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_389640 ?auto_389641 ) ( SUPPORTS ?auto_389640 ?auto_389636 ) ( not ( = ?auto_389635 ?auto_389637 ) ) ( HAVE_IMAGE ?auto_389638 ?auto_389639 ) ( not ( = ?auto_389638 ?auto_389635 ) ) ( not ( = ?auto_389638 ?auto_389637 ) ) ( not ( = ?auto_389639 ?auto_389636 ) ) ( CALIBRATION_TARGET ?auto_389640 ?auto_389637 ) ( POWER_AVAIL ?auto_389641 ) ( POINTING ?auto_389641 ?auto_389630 ) ( not ( = ?auto_389637 ?auto_389630 ) ) ( not ( = ?auto_389635 ?auto_389630 ) ) ( not ( = ?auto_389638 ?auto_389630 ) ) ( HAVE_IMAGE ?auto_389630 ?auto_389631 ) ( HAVE_IMAGE ?auto_389632 ?auto_389629 ) ( HAVE_IMAGE ?auto_389633 ?auto_389634 ) ( not ( = ?auto_389630 ?auto_389632 ) ) ( not ( = ?auto_389630 ?auto_389633 ) ) ( not ( = ?auto_389631 ?auto_389629 ) ) ( not ( = ?auto_389631 ?auto_389634 ) ) ( not ( = ?auto_389631 ?auto_389636 ) ) ( not ( = ?auto_389631 ?auto_389639 ) ) ( not ( = ?auto_389632 ?auto_389633 ) ) ( not ( = ?auto_389632 ?auto_389635 ) ) ( not ( = ?auto_389632 ?auto_389637 ) ) ( not ( = ?auto_389632 ?auto_389638 ) ) ( not ( = ?auto_389629 ?auto_389634 ) ) ( not ( = ?auto_389629 ?auto_389636 ) ) ( not ( = ?auto_389629 ?auto_389639 ) ) ( not ( = ?auto_389633 ?auto_389635 ) ) ( not ( = ?auto_389633 ?auto_389637 ) ) ( not ( = ?auto_389633 ?auto_389638 ) ) ( not ( = ?auto_389634 ?auto_389636 ) ) ( not ( = ?auto_389634 ?auto_389639 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389638 ?auto_389639 ?auto_389635 ?auto_389636 )
      ( GET-4IMAGE-VERIFY ?auto_389630 ?auto_389631 ?auto_389632 ?auto_389629 ?auto_389633 ?auto_389634 ?auto_389635 ?auto_389636 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389664 - DIRECTION
      ?auto_389665 - MODE
      ?auto_389666 - DIRECTION
      ?auto_389663 - MODE
      ?auto_389667 - DIRECTION
      ?auto_389668 - MODE
      ?auto_389669 - DIRECTION
      ?auto_389670 - MODE
    )
    :vars
    (
      ?auto_389674 - INSTRUMENT
      ?auto_389675 - SATELLITE
      ?auto_389671 - DIRECTION
      ?auto_389672 - DIRECTION
      ?auto_389673 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_389674 ?auto_389675 ) ( SUPPORTS ?auto_389674 ?auto_389668 ) ( not ( = ?auto_389667 ?auto_389671 ) ) ( HAVE_IMAGE ?auto_389672 ?auto_389673 ) ( not ( = ?auto_389672 ?auto_389667 ) ) ( not ( = ?auto_389672 ?auto_389671 ) ) ( not ( = ?auto_389673 ?auto_389668 ) ) ( CALIBRATION_TARGET ?auto_389674 ?auto_389671 ) ( POWER_AVAIL ?auto_389675 ) ( POINTING ?auto_389675 ?auto_389664 ) ( not ( = ?auto_389671 ?auto_389664 ) ) ( not ( = ?auto_389667 ?auto_389664 ) ) ( not ( = ?auto_389672 ?auto_389664 ) ) ( HAVE_IMAGE ?auto_389664 ?auto_389665 ) ( HAVE_IMAGE ?auto_389666 ?auto_389663 ) ( HAVE_IMAGE ?auto_389669 ?auto_389670 ) ( not ( = ?auto_389664 ?auto_389666 ) ) ( not ( = ?auto_389664 ?auto_389669 ) ) ( not ( = ?auto_389665 ?auto_389663 ) ) ( not ( = ?auto_389665 ?auto_389668 ) ) ( not ( = ?auto_389665 ?auto_389670 ) ) ( not ( = ?auto_389665 ?auto_389673 ) ) ( not ( = ?auto_389666 ?auto_389667 ) ) ( not ( = ?auto_389666 ?auto_389669 ) ) ( not ( = ?auto_389666 ?auto_389671 ) ) ( not ( = ?auto_389666 ?auto_389672 ) ) ( not ( = ?auto_389663 ?auto_389668 ) ) ( not ( = ?auto_389663 ?auto_389670 ) ) ( not ( = ?auto_389663 ?auto_389673 ) ) ( not ( = ?auto_389667 ?auto_389669 ) ) ( not ( = ?auto_389668 ?auto_389670 ) ) ( not ( = ?auto_389669 ?auto_389671 ) ) ( not ( = ?auto_389669 ?auto_389672 ) ) ( not ( = ?auto_389670 ?auto_389673 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389672 ?auto_389673 ?auto_389667 ?auto_389668 )
      ( GET-4IMAGE-VERIFY ?auto_389664 ?auto_389665 ?auto_389666 ?auto_389663 ?auto_389667 ?auto_389668 ?auto_389669 ?auto_389670 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389839 - DIRECTION
      ?auto_389840 - MODE
      ?auto_389841 - DIRECTION
      ?auto_389838 - MODE
      ?auto_389842 - DIRECTION
      ?auto_389843 - MODE
      ?auto_389844 - DIRECTION
      ?auto_389845 - MODE
    )
    :vars
    (
      ?auto_389849 - INSTRUMENT
      ?auto_389850 - SATELLITE
      ?auto_389846 - DIRECTION
      ?auto_389847 - DIRECTION
      ?auto_389848 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_389849 ?auto_389850 ) ( SUPPORTS ?auto_389849 ?auto_389838 ) ( not ( = ?auto_389841 ?auto_389846 ) ) ( HAVE_IMAGE ?auto_389847 ?auto_389848 ) ( not ( = ?auto_389847 ?auto_389841 ) ) ( not ( = ?auto_389847 ?auto_389846 ) ) ( not ( = ?auto_389848 ?auto_389838 ) ) ( CALIBRATION_TARGET ?auto_389849 ?auto_389846 ) ( POWER_AVAIL ?auto_389850 ) ( POINTING ?auto_389850 ?auto_389839 ) ( not ( = ?auto_389846 ?auto_389839 ) ) ( not ( = ?auto_389841 ?auto_389839 ) ) ( not ( = ?auto_389847 ?auto_389839 ) ) ( HAVE_IMAGE ?auto_389839 ?auto_389840 ) ( HAVE_IMAGE ?auto_389842 ?auto_389843 ) ( HAVE_IMAGE ?auto_389844 ?auto_389845 ) ( not ( = ?auto_389839 ?auto_389842 ) ) ( not ( = ?auto_389839 ?auto_389844 ) ) ( not ( = ?auto_389840 ?auto_389838 ) ) ( not ( = ?auto_389840 ?auto_389843 ) ) ( not ( = ?auto_389840 ?auto_389845 ) ) ( not ( = ?auto_389840 ?auto_389848 ) ) ( not ( = ?auto_389841 ?auto_389842 ) ) ( not ( = ?auto_389841 ?auto_389844 ) ) ( not ( = ?auto_389838 ?auto_389843 ) ) ( not ( = ?auto_389838 ?auto_389845 ) ) ( not ( = ?auto_389842 ?auto_389844 ) ) ( not ( = ?auto_389842 ?auto_389846 ) ) ( not ( = ?auto_389842 ?auto_389847 ) ) ( not ( = ?auto_389843 ?auto_389845 ) ) ( not ( = ?auto_389843 ?auto_389848 ) ) ( not ( = ?auto_389844 ?auto_389846 ) ) ( not ( = ?auto_389844 ?auto_389847 ) ) ( not ( = ?auto_389845 ?auto_389848 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389847 ?auto_389848 ?auto_389841 ?auto_389838 )
      ( GET-4IMAGE-VERIFY ?auto_389839 ?auto_389840 ?auto_389841 ?auto_389838 ?auto_389842 ?auto_389843 ?auto_389844 ?auto_389845 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389978 - DIRECTION
      ?auto_389979 - MODE
      ?auto_389980 - DIRECTION
      ?auto_389977 - MODE
      ?auto_389981 - DIRECTION
      ?auto_389982 - MODE
      ?auto_389983 - DIRECTION
      ?auto_389984 - MODE
    )
    :vars
    (
      ?auto_389986 - INSTRUMENT
      ?auto_389987 - SATELLITE
      ?auto_389985 - DIRECTION
      ?auto_389988 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_389986 ?auto_389987 ) ( SUPPORTS ?auto_389986 ?auto_389979 ) ( not ( = ?auto_389978 ?auto_389985 ) ) ( HAVE_IMAGE ?auto_389981 ?auto_389977 ) ( not ( = ?auto_389981 ?auto_389978 ) ) ( not ( = ?auto_389981 ?auto_389985 ) ) ( not ( = ?auto_389977 ?auto_389979 ) ) ( CALIBRATION_TARGET ?auto_389986 ?auto_389985 ) ( POWER_AVAIL ?auto_389987 ) ( POINTING ?auto_389987 ?auto_389988 ) ( not ( = ?auto_389985 ?auto_389988 ) ) ( not ( = ?auto_389978 ?auto_389988 ) ) ( not ( = ?auto_389981 ?auto_389988 ) ) ( HAVE_IMAGE ?auto_389980 ?auto_389977 ) ( HAVE_IMAGE ?auto_389981 ?auto_389982 ) ( HAVE_IMAGE ?auto_389983 ?auto_389984 ) ( not ( = ?auto_389978 ?auto_389980 ) ) ( not ( = ?auto_389978 ?auto_389983 ) ) ( not ( = ?auto_389979 ?auto_389982 ) ) ( not ( = ?auto_389979 ?auto_389984 ) ) ( not ( = ?auto_389980 ?auto_389981 ) ) ( not ( = ?auto_389980 ?auto_389983 ) ) ( not ( = ?auto_389980 ?auto_389985 ) ) ( not ( = ?auto_389980 ?auto_389988 ) ) ( not ( = ?auto_389977 ?auto_389982 ) ) ( not ( = ?auto_389977 ?auto_389984 ) ) ( not ( = ?auto_389981 ?auto_389983 ) ) ( not ( = ?auto_389982 ?auto_389984 ) ) ( not ( = ?auto_389983 ?auto_389985 ) ) ( not ( = ?auto_389983 ?auto_389988 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389981 ?auto_389977 ?auto_389978 ?auto_389979 )
      ( GET-4IMAGE-VERIFY ?auto_389978 ?auto_389979 ?auto_389980 ?auto_389977 ?auto_389981 ?auto_389982 ?auto_389983 ?auto_389984 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_389990 - DIRECTION
      ?auto_389991 - MODE
      ?auto_389992 - DIRECTION
      ?auto_389989 - MODE
      ?auto_389993 - DIRECTION
      ?auto_389994 - MODE
      ?auto_389995 - DIRECTION
      ?auto_389996 - MODE
    )
    :vars
    (
      ?auto_389998 - INSTRUMENT
      ?auto_389999 - SATELLITE
      ?auto_389997 - DIRECTION
      ?auto_390000 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_389998 ?auto_389999 ) ( SUPPORTS ?auto_389998 ?auto_389991 ) ( not ( = ?auto_389990 ?auto_389997 ) ) ( HAVE_IMAGE ?auto_389992 ?auto_389994 ) ( not ( = ?auto_389992 ?auto_389990 ) ) ( not ( = ?auto_389992 ?auto_389997 ) ) ( not ( = ?auto_389994 ?auto_389991 ) ) ( CALIBRATION_TARGET ?auto_389998 ?auto_389997 ) ( POWER_AVAIL ?auto_389999 ) ( POINTING ?auto_389999 ?auto_390000 ) ( not ( = ?auto_389997 ?auto_390000 ) ) ( not ( = ?auto_389990 ?auto_390000 ) ) ( not ( = ?auto_389992 ?auto_390000 ) ) ( HAVE_IMAGE ?auto_389992 ?auto_389989 ) ( HAVE_IMAGE ?auto_389993 ?auto_389994 ) ( HAVE_IMAGE ?auto_389995 ?auto_389996 ) ( not ( = ?auto_389990 ?auto_389993 ) ) ( not ( = ?auto_389990 ?auto_389995 ) ) ( not ( = ?auto_389991 ?auto_389989 ) ) ( not ( = ?auto_389991 ?auto_389996 ) ) ( not ( = ?auto_389992 ?auto_389993 ) ) ( not ( = ?auto_389992 ?auto_389995 ) ) ( not ( = ?auto_389989 ?auto_389994 ) ) ( not ( = ?auto_389989 ?auto_389996 ) ) ( not ( = ?auto_389993 ?auto_389995 ) ) ( not ( = ?auto_389993 ?auto_389997 ) ) ( not ( = ?auto_389993 ?auto_390000 ) ) ( not ( = ?auto_389994 ?auto_389996 ) ) ( not ( = ?auto_389995 ?auto_389997 ) ) ( not ( = ?auto_389995 ?auto_390000 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_389992 ?auto_389994 ?auto_389990 ?auto_389991 )
      ( GET-4IMAGE-VERIFY ?auto_389990 ?auto_389991 ?auto_389992 ?auto_389989 ?auto_389993 ?auto_389994 ?auto_389995 ?auto_389996 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390002 - DIRECTION
      ?auto_390003 - MODE
      ?auto_390004 - DIRECTION
      ?auto_390001 - MODE
      ?auto_390005 - DIRECTION
      ?auto_390006 - MODE
      ?auto_390007 - DIRECTION
      ?auto_390008 - MODE
    )
    :vars
    (
      ?auto_390010 - INSTRUMENT
      ?auto_390011 - SATELLITE
      ?auto_390009 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_390010 ?auto_390011 ) ( SUPPORTS ?auto_390010 ?auto_390003 ) ( not ( = ?auto_390002 ?auto_390009 ) ) ( HAVE_IMAGE ?auto_390005 ?auto_390006 ) ( not ( = ?auto_390005 ?auto_390002 ) ) ( not ( = ?auto_390005 ?auto_390009 ) ) ( not ( = ?auto_390006 ?auto_390003 ) ) ( CALIBRATION_TARGET ?auto_390010 ?auto_390009 ) ( POWER_AVAIL ?auto_390011 ) ( POINTING ?auto_390011 ?auto_390007 ) ( not ( = ?auto_390009 ?auto_390007 ) ) ( not ( = ?auto_390002 ?auto_390007 ) ) ( not ( = ?auto_390005 ?auto_390007 ) ) ( HAVE_IMAGE ?auto_390004 ?auto_390001 ) ( HAVE_IMAGE ?auto_390007 ?auto_390008 ) ( not ( = ?auto_390002 ?auto_390004 ) ) ( not ( = ?auto_390003 ?auto_390001 ) ) ( not ( = ?auto_390003 ?auto_390008 ) ) ( not ( = ?auto_390004 ?auto_390005 ) ) ( not ( = ?auto_390004 ?auto_390007 ) ) ( not ( = ?auto_390004 ?auto_390009 ) ) ( not ( = ?auto_390001 ?auto_390006 ) ) ( not ( = ?auto_390001 ?auto_390008 ) ) ( not ( = ?auto_390006 ?auto_390008 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390005 ?auto_390006 ?auto_390002 ?auto_390003 )
      ( GET-4IMAGE-VERIFY ?auto_390002 ?auto_390003 ?auto_390004 ?auto_390001 ?auto_390005 ?auto_390006 ?auto_390007 ?auto_390008 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390025 - DIRECTION
      ?auto_390026 - MODE
      ?auto_390027 - DIRECTION
      ?auto_390024 - MODE
      ?auto_390028 - DIRECTION
      ?auto_390029 - MODE
      ?auto_390030 - DIRECTION
      ?auto_390031 - MODE
    )
    :vars
    (
      ?auto_390033 - INSTRUMENT
      ?auto_390034 - SATELLITE
      ?auto_390032 - DIRECTION
      ?auto_390035 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_390033 ?auto_390034 ) ( SUPPORTS ?auto_390033 ?auto_390026 ) ( not ( = ?auto_390025 ?auto_390032 ) ) ( HAVE_IMAGE ?auto_390030 ?auto_390031 ) ( not ( = ?auto_390030 ?auto_390025 ) ) ( not ( = ?auto_390030 ?auto_390032 ) ) ( not ( = ?auto_390031 ?auto_390026 ) ) ( CALIBRATION_TARGET ?auto_390033 ?auto_390032 ) ( POWER_AVAIL ?auto_390034 ) ( POINTING ?auto_390034 ?auto_390035 ) ( not ( = ?auto_390032 ?auto_390035 ) ) ( not ( = ?auto_390025 ?auto_390035 ) ) ( not ( = ?auto_390030 ?auto_390035 ) ) ( HAVE_IMAGE ?auto_390027 ?auto_390024 ) ( HAVE_IMAGE ?auto_390028 ?auto_390029 ) ( not ( = ?auto_390025 ?auto_390027 ) ) ( not ( = ?auto_390025 ?auto_390028 ) ) ( not ( = ?auto_390026 ?auto_390024 ) ) ( not ( = ?auto_390026 ?auto_390029 ) ) ( not ( = ?auto_390027 ?auto_390028 ) ) ( not ( = ?auto_390027 ?auto_390030 ) ) ( not ( = ?auto_390027 ?auto_390032 ) ) ( not ( = ?auto_390027 ?auto_390035 ) ) ( not ( = ?auto_390024 ?auto_390029 ) ) ( not ( = ?auto_390024 ?auto_390031 ) ) ( not ( = ?auto_390028 ?auto_390030 ) ) ( not ( = ?auto_390028 ?auto_390032 ) ) ( not ( = ?auto_390028 ?auto_390035 ) ) ( not ( = ?auto_390029 ?auto_390031 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390030 ?auto_390031 ?auto_390025 ?auto_390026 )
      ( GET-4IMAGE-VERIFY ?auto_390025 ?auto_390026 ?auto_390027 ?auto_390024 ?auto_390028 ?auto_390029 ?auto_390030 ?auto_390031 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390037 - DIRECTION
      ?auto_390038 - MODE
      ?auto_390039 - DIRECTION
      ?auto_390036 - MODE
      ?auto_390040 - DIRECTION
      ?auto_390041 - MODE
      ?auto_390042 - DIRECTION
      ?auto_390043 - MODE
    )
    :vars
    (
      ?auto_390045 - INSTRUMENT
      ?auto_390046 - SATELLITE
      ?auto_390044 - DIRECTION
      ?auto_390047 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_390045 ?auto_390046 ) ( SUPPORTS ?auto_390045 ?auto_390038 ) ( not ( = ?auto_390037 ?auto_390044 ) ) ( HAVE_IMAGE ?auto_390039 ?auto_390036 ) ( not ( = ?auto_390039 ?auto_390037 ) ) ( not ( = ?auto_390039 ?auto_390044 ) ) ( not ( = ?auto_390036 ?auto_390038 ) ) ( CALIBRATION_TARGET ?auto_390045 ?auto_390044 ) ( POWER_AVAIL ?auto_390046 ) ( POINTING ?auto_390046 ?auto_390047 ) ( not ( = ?auto_390044 ?auto_390047 ) ) ( not ( = ?auto_390037 ?auto_390047 ) ) ( not ( = ?auto_390039 ?auto_390047 ) ) ( HAVE_IMAGE ?auto_390040 ?auto_390041 ) ( HAVE_IMAGE ?auto_390042 ?auto_390043 ) ( not ( = ?auto_390037 ?auto_390040 ) ) ( not ( = ?auto_390037 ?auto_390042 ) ) ( not ( = ?auto_390038 ?auto_390041 ) ) ( not ( = ?auto_390038 ?auto_390043 ) ) ( not ( = ?auto_390039 ?auto_390040 ) ) ( not ( = ?auto_390039 ?auto_390042 ) ) ( not ( = ?auto_390036 ?auto_390041 ) ) ( not ( = ?auto_390036 ?auto_390043 ) ) ( not ( = ?auto_390040 ?auto_390042 ) ) ( not ( = ?auto_390040 ?auto_390044 ) ) ( not ( = ?auto_390040 ?auto_390047 ) ) ( not ( = ?auto_390041 ?auto_390043 ) ) ( not ( = ?auto_390042 ?auto_390044 ) ) ( not ( = ?auto_390042 ?auto_390047 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390039 ?auto_390036 ?auto_390037 ?auto_390038 )
      ( GET-4IMAGE-VERIFY ?auto_390037 ?auto_390038 ?auto_390039 ?auto_390036 ?auto_390040 ?auto_390041 ?auto_390042 ?auto_390043 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390069 - DIRECTION
      ?auto_390070 - MODE
      ?auto_390071 - DIRECTION
      ?auto_390068 - MODE
      ?auto_390072 - DIRECTION
      ?auto_390073 - MODE
      ?auto_390074 - DIRECTION
      ?auto_390075 - MODE
    )
    :vars
    (
      ?auto_390077 - INSTRUMENT
      ?auto_390078 - SATELLITE
      ?auto_390076 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_390077 ?auto_390078 ) ( SUPPORTS ?auto_390077 ?auto_390070 ) ( not ( = ?auto_390069 ?auto_390076 ) ) ( HAVE_IMAGE ?auto_390071 ?auto_390075 ) ( not ( = ?auto_390071 ?auto_390069 ) ) ( not ( = ?auto_390071 ?auto_390076 ) ) ( not ( = ?auto_390075 ?auto_390070 ) ) ( CALIBRATION_TARGET ?auto_390077 ?auto_390076 ) ( POWER_AVAIL ?auto_390078 ) ( POINTING ?auto_390078 ?auto_390072 ) ( not ( = ?auto_390076 ?auto_390072 ) ) ( not ( = ?auto_390069 ?auto_390072 ) ) ( not ( = ?auto_390071 ?auto_390072 ) ) ( HAVE_IMAGE ?auto_390071 ?auto_390068 ) ( HAVE_IMAGE ?auto_390072 ?auto_390073 ) ( HAVE_IMAGE ?auto_390074 ?auto_390075 ) ( not ( = ?auto_390069 ?auto_390074 ) ) ( not ( = ?auto_390070 ?auto_390068 ) ) ( not ( = ?auto_390070 ?auto_390073 ) ) ( not ( = ?auto_390071 ?auto_390074 ) ) ( not ( = ?auto_390068 ?auto_390073 ) ) ( not ( = ?auto_390068 ?auto_390075 ) ) ( not ( = ?auto_390072 ?auto_390074 ) ) ( not ( = ?auto_390073 ?auto_390075 ) ) ( not ( = ?auto_390074 ?auto_390076 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390071 ?auto_390075 ?auto_390069 ?auto_390070 )
      ( GET-4IMAGE-VERIFY ?auto_390069 ?auto_390070 ?auto_390071 ?auto_390068 ?auto_390072 ?auto_390073 ?auto_390074 ?auto_390075 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390091 - DIRECTION
      ?auto_390092 - MODE
      ?auto_390093 - DIRECTION
      ?auto_390090 - MODE
      ?auto_390094 - DIRECTION
      ?auto_390095 - MODE
      ?auto_390096 - DIRECTION
      ?auto_390097 - MODE
    )
    :vars
    (
      ?auto_390099 - INSTRUMENT
      ?auto_390100 - SATELLITE
      ?auto_390098 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_390099 ?auto_390100 ) ( SUPPORTS ?auto_390099 ?auto_390092 ) ( not ( = ?auto_390091 ?auto_390098 ) ) ( HAVE_IMAGE ?auto_390093 ?auto_390090 ) ( not ( = ?auto_390093 ?auto_390091 ) ) ( not ( = ?auto_390093 ?auto_390098 ) ) ( not ( = ?auto_390090 ?auto_390092 ) ) ( CALIBRATION_TARGET ?auto_390099 ?auto_390098 ) ( POWER_AVAIL ?auto_390100 ) ( POINTING ?auto_390100 ?auto_390096 ) ( not ( = ?auto_390098 ?auto_390096 ) ) ( not ( = ?auto_390091 ?auto_390096 ) ) ( not ( = ?auto_390093 ?auto_390096 ) ) ( HAVE_IMAGE ?auto_390094 ?auto_390095 ) ( HAVE_IMAGE ?auto_390096 ?auto_390097 ) ( not ( = ?auto_390091 ?auto_390094 ) ) ( not ( = ?auto_390092 ?auto_390095 ) ) ( not ( = ?auto_390092 ?auto_390097 ) ) ( not ( = ?auto_390093 ?auto_390094 ) ) ( not ( = ?auto_390090 ?auto_390095 ) ) ( not ( = ?auto_390090 ?auto_390097 ) ) ( not ( = ?auto_390094 ?auto_390096 ) ) ( not ( = ?auto_390094 ?auto_390098 ) ) ( not ( = ?auto_390095 ?auto_390097 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390093 ?auto_390090 ?auto_390091 ?auto_390092 )
      ( GET-4IMAGE-VERIFY ?auto_390091 ?auto_390092 ?auto_390093 ?auto_390090 ?auto_390094 ?auto_390095 ?auto_390096 ?auto_390097 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390160 - DIRECTION
      ?auto_390161 - MODE
      ?auto_390162 - DIRECTION
      ?auto_390159 - MODE
      ?auto_390163 - DIRECTION
      ?auto_390164 - MODE
      ?auto_390165 - DIRECTION
      ?auto_390166 - MODE
    )
    :vars
    (
      ?auto_390168 - INSTRUMENT
      ?auto_390169 - SATELLITE
      ?auto_390167 - DIRECTION
      ?auto_390170 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_390168 ?auto_390169 ) ( SUPPORTS ?auto_390168 ?auto_390161 ) ( not ( = ?auto_390160 ?auto_390167 ) ) ( HAVE_IMAGE ?auto_390163 ?auto_390166 ) ( not ( = ?auto_390163 ?auto_390160 ) ) ( not ( = ?auto_390163 ?auto_390167 ) ) ( not ( = ?auto_390166 ?auto_390161 ) ) ( CALIBRATION_TARGET ?auto_390168 ?auto_390167 ) ( POWER_AVAIL ?auto_390169 ) ( POINTING ?auto_390169 ?auto_390170 ) ( not ( = ?auto_390167 ?auto_390170 ) ) ( not ( = ?auto_390160 ?auto_390170 ) ) ( not ( = ?auto_390163 ?auto_390170 ) ) ( HAVE_IMAGE ?auto_390162 ?auto_390159 ) ( HAVE_IMAGE ?auto_390163 ?auto_390164 ) ( HAVE_IMAGE ?auto_390165 ?auto_390166 ) ( not ( = ?auto_390160 ?auto_390162 ) ) ( not ( = ?auto_390160 ?auto_390165 ) ) ( not ( = ?auto_390161 ?auto_390159 ) ) ( not ( = ?auto_390161 ?auto_390164 ) ) ( not ( = ?auto_390162 ?auto_390163 ) ) ( not ( = ?auto_390162 ?auto_390165 ) ) ( not ( = ?auto_390162 ?auto_390167 ) ) ( not ( = ?auto_390162 ?auto_390170 ) ) ( not ( = ?auto_390159 ?auto_390164 ) ) ( not ( = ?auto_390159 ?auto_390166 ) ) ( not ( = ?auto_390163 ?auto_390165 ) ) ( not ( = ?auto_390164 ?auto_390166 ) ) ( not ( = ?auto_390165 ?auto_390167 ) ) ( not ( = ?auto_390165 ?auto_390170 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390163 ?auto_390166 ?auto_390160 ?auto_390161 )
      ( GET-4IMAGE-VERIFY ?auto_390160 ?auto_390161 ?auto_390162 ?auto_390159 ?auto_390163 ?auto_390164 ?auto_390165 ?auto_390166 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390172 - DIRECTION
      ?auto_390173 - MODE
      ?auto_390174 - DIRECTION
      ?auto_390171 - MODE
      ?auto_390175 - DIRECTION
      ?auto_390176 - MODE
      ?auto_390177 - DIRECTION
      ?auto_390178 - MODE
    )
    :vars
    (
      ?auto_390180 - INSTRUMENT
      ?auto_390181 - SATELLITE
      ?auto_390179 - DIRECTION
      ?auto_390182 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_390180 ?auto_390181 ) ( SUPPORTS ?auto_390180 ?auto_390173 ) ( not ( = ?auto_390172 ?auto_390179 ) ) ( HAVE_IMAGE ?auto_390175 ?auto_390176 ) ( not ( = ?auto_390175 ?auto_390172 ) ) ( not ( = ?auto_390175 ?auto_390179 ) ) ( not ( = ?auto_390176 ?auto_390173 ) ) ( CALIBRATION_TARGET ?auto_390180 ?auto_390179 ) ( POWER_AVAIL ?auto_390181 ) ( POINTING ?auto_390181 ?auto_390182 ) ( not ( = ?auto_390179 ?auto_390182 ) ) ( not ( = ?auto_390172 ?auto_390182 ) ) ( not ( = ?auto_390175 ?auto_390182 ) ) ( HAVE_IMAGE ?auto_390174 ?auto_390171 ) ( HAVE_IMAGE ?auto_390177 ?auto_390178 ) ( not ( = ?auto_390172 ?auto_390174 ) ) ( not ( = ?auto_390172 ?auto_390177 ) ) ( not ( = ?auto_390173 ?auto_390171 ) ) ( not ( = ?auto_390173 ?auto_390178 ) ) ( not ( = ?auto_390174 ?auto_390175 ) ) ( not ( = ?auto_390174 ?auto_390177 ) ) ( not ( = ?auto_390174 ?auto_390179 ) ) ( not ( = ?auto_390174 ?auto_390182 ) ) ( not ( = ?auto_390171 ?auto_390176 ) ) ( not ( = ?auto_390171 ?auto_390178 ) ) ( not ( = ?auto_390175 ?auto_390177 ) ) ( not ( = ?auto_390176 ?auto_390178 ) ) ( not ( = ?auto_390177 ?auto_390179 ) ) ( not ( = ?auto_390177 ?auto_390182 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390175 ?auto_390176 ?auto_390172 ?auto_390173 )
      ( GET-4IMAGE-VERIFY ?auto_390172 ?auto_390173 ?auto_390174 ?auto_390171 ?auto_390175 ?auto_390176 ?auto_390177 ?auto_390178 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390216 - DIRECTION
      ?auto_390217 - MODE
      ?auto_390218 - DIRECTION
      ?auto_390215 - MODE
      ?auto_390219 - DIRECTION
      ?auto_390220 - MODE
      ?auto_390221 - DIRECTION
      ?auto_390222 - MODE
    )
    :vars
    (
      ?auto_390226 - INSTRUMENT
      ?auto_390227 - SATELLITE
      ?auto_390223 - DIRECTION
      ?auto_390224 - DIRECTION
      ?auto_390225 - MODE
      ?auto_390228 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_390226 ?auto_390227 ) ( SUPPORTS ?auto_390226 ?auto_390217 ) ( not ( = ?auto_390216 ?auto_390223 ) ) ( HAVE_IMAGE ?auto_390224 ?auto_390225 ) ( not ( = ?auto_390224 ?auto_390216 ) ) ( not ( = ?auto_390224 ?auto_390223 ) ) ( not ( = ?auto_390225 ?auto_390217 ) ) ( CALIBRATION_TARGET ?auto_390226 ?auto_390223 ) ( POWER_AVAIL ?auto_390227 ) ( POINTING ?auto_390227 ?auto_390228 ) ( not ( = ?auto_390223 ?auto_390228 ) ) ( not ( = ?auto_390216 ?auto_390228 ) ) ( not ( = ?auto_390224 ?auto_390228 ) ) ( HAVE_IMAGE ?auto_390218 ?auto_390215 ) ( HAVE_IMAGE ?auto_390219 ?auto_390220 ) ( HAVE_IMAGE ?auto_390221 ?auto_390222 ) ( not ( = ?auto_390216 ?auto_390218 ) ) ( not ( = ?auto_390216 ?auto_390219 ) ) ( not ( = ?auto_390216 ?auto_390221 ) ) ( not ( = ?auto_390217 ?auto_390215 ) ) ( not ( = ?auto_390217 ?auto_390220 ) ) ( not ( = ?auto_390217 ?auto_390222 ) ) ( not ( = ?auto_390218 ?auto_390219 ) ) ( not ( = ?auto_390218 ?auto_390221 ) ) ( not ( = ?auto_390218 ?auto_390223 ) ) ( not ( = ?auto_390218 ?auto_390224 ) ) ( not ( = ?auto_390218 ?auto_390228 ) ) ( not ( = ?auto_390215 ?auto_390220 ) ) ( not ( = ?auto_390215 ?auto_390222 ) ) ( not ( = ?auto_390215 ?auto_390225 ) ) ( not ( = ?auto_390219 ?auto_390221 ) ) ( not ( = ?auto_390219 ?auto_390223 ) ) ( not ( = ?auto_390219 ?auto_390224 ) ) ( not ( = ?auto_390219 ?auto_390228 ) ) ( not ( = ?auto_390220 ?auto_390222 ) ) ( not ( = ?auto_390220 ?auto_390225 ) ) ( not ( = ?auto_390221 ?auto_390223 ) ) ( not ( = ?auto_390221 ?auto_390224 ) ) ( not ( = ?auto_390221 ?auto_390228 ) ) ( not ( = ?auto_390222 ?auto_390225 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390224 ?auto_390225 ?auto_390216 ?auto_390217 )
      ( GET-4IMAGE-VERIFY ?auto_390216 ?auto_390217 ?auto_390218 ?auto_390215 ?auto_390219 ?auto_390220 ?auto_390221 ?auto_390222 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390230 - DIRECTION
      ?auto_390231 - MODE
      ?auto_390232 - DIRECTION
      ?auto_390229 - MODE
      ?auto_390233 - DIRECTION
      ?auto_390234 - MODE
      ?auto_390235 - DIRECTION
      ?auto_390236 - MODE
    )
    :vars
    (
      ?auto_390240 - INSTRUMENT
      ?auto_390241 - SATELLITE
      ?auto_390237 - DIRECTION
      ?auto_390238 - DIRECTION
      ?auto_390239 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_390240 ?auto_390241 ) ( SUPPORTS ?auto_390240 ?auto_390231 ) ( not ( = ?auto_390230 ?auto_390237 ) ) ( HAVE_IMAGE ?auto_390238 ?auto_390239 ) ( not ( = ?auto_390238 ?auto_390230 ) ) ( not ( = ?auto_390238 ?auto_390237 ) ) ( not ( = ?auto_390239 ?auto_390231 ) ) ( CALIBRATION_TARGET ?auto_390240 ?auto_390237 ) ( POWER_AVAIL ?auto_390241 ) ( POINTING ?auto_390241 ?auto_390235 ) ( not ( = ?auto_390237 ?auto_390235 ) ) ( not ( = ?auto_390230 ?auto_390235 ) ) ( not ( = ?auto_390238 ?auto_390235 ) ) ( HAVE_IMAGE ?auto_390232 ?auto_390229 ) ( HAVE_IMAGE ?auto_390233 ?auto_390234 ) ( HAVE_IMAGE ?auto_390235 ?auto_390236 ) ( not ( = ?auto_390230 ?auto_390232 ) ) ( not ( = ?auto_390230 ?auto_390233 ) ) ( not ( = ?auto_390231 ?auto_390229 ) ) ( not ( = ?auto_390231 ?auto_390234 ) ) ( not ( = ?auto_390231 ?auto_390236 ) ) ( not ( = ?auto_390232 ?auto_390233 ) ) ( not ( = ?auto_390232 ?auto_390235 ) ) ( not ( = ?auto_390232 ?auto_390237 ) ) ( not ( = ?auto_390232 ?auto_390238 ) ) ( not ( = ?auto_390229 ?auto_390234 ) ) ( not ( = ?auto_390229 ?auto_390236 ) ) ( not ( = ?auto_390229 ?auto_390239 ) ) ( not ( = ?auto_390233 ?auto_390235 ) ) ( not ( = ?auto_390233 ?auto_390237 ) ) ( not ( = ?auto_390233 ?auto_390238 ) ) ( not ( = ?auto_390234 ?auto_390236 ) ) ( not ( = ?auto_390234 ?auto_390239 ) ) ( not ( = ?auto_390236 ?auto_390239 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390238 ?auto_390239 ?auto_390230 ?auto_390231 )
      ( GET-4IMAGE-VERIFY ?auto_390230 ?auto_390231 ?auto_390232 ?auto_390229 ?auto_390233 ?auto_390234 ?auto_390235 ?auto_390236 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390265 - DIRECTION
      ?auto_390266 - MODE
      ?auto_390267 - DIRECTION
      ?auto_390264 - MODE
      ?auto_390268 - DIRECTION
      ?auto_390269 - MODE
      ?auto_390270 - DIRECTION
      ?auto_390271 - MODE
    )
    :vars
    (
      ?auto_390275 - INSTRUMENT
      ?auto_390276 - SATELLITE
      ?auto_390272 - DIRECTION
      ?auto_390273 - DIRECTION
      ?auto_390274 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_390275 ?auto_390276 ) ( SUPPORTS ?auto_390275 ?auto_390266 ) ( not ( = ?auto_390265 ?auto_390272 ) ) ( HAVE_IMAGE ?auto_390273 ?auto_390274 ) ( not ( = ?auto_390273 ?auto_390265 ) ) ( not ( = ?auto_390273 ?auto_390272 ) ) ( not ( = ?auto_390274 ?auto_390266 ) ) ( CALIBRATION_TARGET ?auto_390275 ?auto_390272 ) ( POWER_AVAIL ?auto_390276 ) ( POINTING ?auto_390276 ?auto_390268 ) ( not ( = ?auto_390272 ?auto_390268 ) ) ( not ( = ?auto_390265 ?auto_390268 ) ) ( not ( = ?auto_390273 ?auto_390268 ) ) ( HAVE_IMAGE ?auto_390267 ?auto_390264 ) ( HAVE_IMAGE ?auto_390268 ?auto_390269 ) ( HAVE_IMAGE ?auto_390270 ?auto_390271 ) ( not ( = ?auto_390265 ?auto_390267 ) ) ( not ( = ?auto_390265 ?auto_390270 ) ) ( not ( = ?auto_390266 ?auto_390264 ) ) ( not ( = ?auto_390266 ?auto_390269 ) ) ( not ( = ?auto_390266 ?auto_390271 ) ) ( not ( = ?auto_390267 ?auto_390268 ) ) ( not ( = ?auto_390267 ?auto_390270 ) ) ( not ( = ?auto_390267 ?auto_390272 ) ) ( not ( = ?auto_390267 ?auto_390273 ) ) ( not ( = ?auto_390264 ?auto_390269 ) ) ( not ( = ?auto_390264 ?auto_390271 ) ) ( not ( = ?auto_390264 ?auto_390274 ) ) ( not ( = ?auto_390268 ?auto_390270 ) ) ( not ( = ?auto_390269 ?auto_390271 ) ) ( not ( = ?auto_390269 ?auto_390274 ) ) ( not ( = ?auto_390270 ?auto_390272 ) ) ( not ( = ?auto_390270 ?auto_390273 ) ) ( not ( = ?auto_390271 ?auto_390274 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390273 ?auto_390274 ?auto_390265 ?auto_390266 )
      ( GET-4IMAGE-VERIFY ?auto_390265 ?auto_390266 ?auto_390267 ?auto_390264 ?auto_390268 ?auto_390269 ?auto_390270 ?auto_390271 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_390448 - DIRECTION
      ?auto_390449 - MODE
      ?auto_390450 - DIRECTION
      ?auto_390447 - MODE
      ?auto_390451 - DIRECTION
      ?auto_390452 - MODE
      ?auto_390453 - DIRECTION
      ?auto_390454 - MODE
    )
    :vars
    (
      ?auto_390456 - INSTRUMENT
      ?auto_390457 - SATELLITE
      ?auto_390455 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_390456 ?auto_390457 ) ( SUPPORTS ?auto_390456 ?auto_390449 ) ( not ( = ?auto_390448 ?auto_390455 ) ) ( HAVE_IMAGE ?auto_390453 ?auto_390454 ) ( not ( = ?auto_390453 ?auto_390448 ) ) ( not ( = ?auto_390453 ?auto_390455 ) ) ( not ( = ?auto_390454 ?auto_390449 ) ) ( CALIBRATION_TARGET ?auto_390456 ?auto_390455 ) ( POWER_AVAIL ?auto_390457 ) ( POINTING ?auto_390457 ?auto_390450 ) ( not ( = ?auto_390455 ?auto_390450 ) ) ( not ( = ?auto_390448 ?auto_390450 ) ) ( not ( = ?auto_390453 ?auto_390450 ) ) ( HAVE_IMAGE ?auto_390450 ?auto_390447 ) ( HAVE_IMAGE ?auto_390451 ?auto_390452 ) ( not ( = ?auto_390448 ?auto_390451 ) ) ( not ( = ?auto_390449 ?auto_390447 ) ) ( not ( = ?auto_390449 ?auto_390452 ) ) ( not ( = ?auto_390450 ?auto_390451 ) ) ( not ( = ?auto_390447 ?auto_390452 ) ) ( not ( = ?auto_390447 ?auto_390454 ) ) ( not ( = ?auto_390451 ?auto_390453 ) ) ( not ( = ?auto_390451 ?auto_390455 ) ) ( not ( = ?auto_390452 ?auto_390454 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390453 ?auto_390454 ?auto_390448 ?auto_390449 )
      ( GET-4IMAGE-VERIFY ?auto_390448 ?auto_390449 ?auto_390450 ?auto_390447 ?auto_390451 ?auto_390452 ?auto_390453 ?auto_390454 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_390817 - DIRECTION
      ?auto_390818 - MODE
      ?auto_390819 - DIRECTION
      ?auto_390816 - MODE
      ?auto_390820 - DIRECTION
      ?auto_390821 - MODE
    )
    :vars
    (
      ?auto_390822 - INSTRUMENT
      ?auto_390825 - SATELLITE
      ?auto_390824 - DIRECTION
      ?auto_390823 - DIRECTION
      ?auto_390826 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_390822 ?auto_390825 ) ( SUPPORTS ?auto_390822 ?auto_390821 ) ( not ( = ?auto_390820 ?auto_390824 ) ) ( HAVE_IMAGE ?auto_390817 ?auto_390818 ) ( not ( = ?auto_390817 ?auto_390820 ) ) ( not ( = ?auto_390817 ?auto_390824 ) ) ( not ( = ?auto_390818 ?auto_390821 ) ) ( CALIBRATION_TARGET ?auto_390822 ?auto_390824 ) ( POINTING ?auto_390825 ?auto_390823 ) ( not ( = ?auto_390824 ?auto_390823 ) ) ( not ( = ?auto_390820 ?auto_390823 ) ) ( not ( = ?auto_390817 ?auto_390823 ) ) ( ON_BOARD ?auto_390826 ?auto_390825 ) ( POWER_ON ?auto_390826 ) ( not ( = ?auto_390822 ?auto_390826 ) ) ( HAVE_IMAGE ?auto_390819 ?auto_390816 ) ( not ( = ?auto_390817 ?auto_390819 ) ) ( not ( = ?auto_390818 ?auto_390816 ) ) ( not ( = ?auto_390819 ?auto_390820 ) ) ( not ( = ?auto_390819 ?auto_390824 ) ) ( not ( = ?auto_390819 ?auto_390823 ) ) ( not ( = ?auto_390816 ?auto_390821 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390817 ?auto_390818 ?auto_390820 ?auto_390821 )
      ( GET-3IMAGE-VERIFY ?auto_390817 ?auto_390818 ?auto_390819 ?auto_390816 ?auto_390820 ?auto_390821 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_390888 - DIRECTION
      ?auto_390889 - MODE
      ?auto_390890 - DIRECTION
      ?auto_390887 - MODE
      ?auto_390891 - DIRECTION
      ?auto_390892 - MODE
    )
    :vars
    (
      ?auto_390893 - INSTRUMENT
      ?auto_390898 - SATELLITE
      ?auto_390897 - DIRECTION
      ?auto_390896 - DIRECTION
      ?auto_390895 - MODE
      ?auto_390894 - DIRECTION
      ?auto_390899 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_390893 ?auto_390898 ) ( SUPPORTS ?auto_390893 ?auto_390892 ) ( not ( = ?auto_390891 ?auto_390897 ) ) ( HAVE_IMAGE ?auto_390896 ?auto_390895 ) ( not ( = ?auto_390896 ?auto_390891 ) ) ( not ( = ?auto_390896 ?auto_390897 ) ) ( not ( = ?auto_390895 ?auto_390892 ) ) ( CALIBRATION_TARGET ?auto_390893 ?auto_390897 ) ( POINTING ?auto_390898 ?auto_390894 ) ( not ( = ?auto_390897 ?auto_390894 ) ) ( not ( = ?auto_390891 ?auto_390894 ) ) ( not ( = ?auto_390896 ?auto_390894 ) ) ( ON_BOARD ?auto_390899 ?auto_390898 ) ( POWER_ON ?auto_390899 ) ( not ( = ?auto_390893 ?auto_390899 ) ) ( HAVE_IMAGE ?auto_390888 ?auto_390889 ) ( HAVE_IMAGE ?auto_390890 ?auto_390887 ) ( not ( = ?auto_390888 ?auto_390890 ) ) ( not ( = ?auto_390888 ?auto_390891 ) ) ( not ( = ?auto_390888 ?auto_390897 ) ) ( not ( = ?auto_390888 ?auto_390896 ) ) ( not ( = ?auto_390888 ?auto_390894 ) ) ( not ( = ?auto_390889 ?auto_390887 ) ) ( not ( = ?auto_390889 ?auto_390892 ) ) ( not ( = ?auto_390889 ?auto_390895 ) ) ( not ( = ?auto_390890 ?auto_390891 ) ) ( not ( = ?auto_390890 ?auto_390897 ) ) ( not ( = ?auto_390890 ?auto_390896 ) ) ( not ( = ?auto_390890 ?auto_390894 ) ) ( not ( = ?auto_390887 ?auto_390892 ) ) ( not ( = ?auto_390887 ?auto_390895 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390896 ?auto_390895 ?auto_390891 ?auto_390892 )
      ( GET-3IMAGE-VERIFY ?auto_390888 ?auto_390889 ?auto_390890 ?auto_390887 ?auto_390891 ?auto_390892 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_390913 - DIRECTION
      ?auto_390914 - MODE
      ?auto_390915 - DIRECTION
      ?auto_390912 - MODE
      ?auto_390916 - DIRECTION
      ?auto_390917 - MODE
    )
    :vars
    (
      ?auto_390918 - INSTRUMENT
      ?auto_390923 - SATELLITE
      ?auto_390922 - DIRECTION
      ?auto_390921 - DIRECTION
      ?auto_390920 - MODE
      ?auto_390919 - DIRECTION
      ?auto_390924 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_390918 ?auto_390923 ) ( SUPPORTS ?auto_390918 ?auto_390912 ) ( not ( = ?auto_390915 ?auto_390922 ) ) ( HAVE_IMAGE ?auto_390921 ?auto_390920 ) ( not ( = ?auto_390921 ?auto_390915 ) ) ( not ( = ?auto_390921 ?auto_390922 ) ) ( not ( = ?auto_390920 ?auto_390912 ) ) ( CALIBRATION_TARGET ?auto_390918 ?auto_390922 ) ( POINTING ?auto_390923 ?auto_390919 ) ( not ( = ?auto_390922 ?auto_390919 ) ) ( not ( = ?auto_390915 ?auto_390919 ) ) ( not ( = ?auto_390921 ?auto_390919 ) ) ( ON_BOARD ?auto_390924 ?auto_390923 ) ( POWER_ON ?auto_390924 ) ( not ( = ?auto_390918 ?auto_390924 ) ) ( HAVE_IMAGE ?auto_390913 ?auto_390914 ) ( HAVE_IMAGE ?auto_390916 ?auto_390917 ) ( not ( = ?auto_390913 ?auto_390915 ) ) ( not ( = ?auto_390913 ?auto_390916 ) ) ( not ( = ?auto_390913 ?auto_390922 ) ) ( not ( = ?auto_390913 ?auto_390921 ) ) ( not ( = ?auto_390913 ?auto_390919 ) ) ( not ( = ?auto_390914 ?auto_390912 ) ) ( not ( = ?auto_390914 ?auto_390917 ) ) ( not ( = ?auto_390914 ?auto_390920 ) ) ( not ( = ?auto_390915 ?auto_390916 ) ) ( not ( = ?auto_390912 ?auto_390917 ) ) ( not ( = ?auto_390916 ?auto_390922 ) ) ( not ( = ?auto_390916 ?auto_390921 ) ) ( not ( = ?auto_390916 ?auto_390919 ) ) ( not ( = ?auto_390917 ?auto_390920 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390921 ?auto_390920 ?auto_390915 ?auto_390912 )
      ( GET-3IMAGE-VERIFY ?auto_390913 ?auto_390914 ?auto_390915 ?auto_390912 ?auto_390916 ?auto_390917 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_390989 - DIRECTION
      ?auto_390990 - MODE
      ?auto_390991 - DIRECTION
      ?auto_390988 - MODE
      ?auto_390992 - DIRECTION
      ?auto_390993 - MODE
    )
    :vars
    (
      ?auto_390994 - INSTRUMENT
      ?auto_390998 - SATELLITE
      ?auto_390997 - DIRECTION
      ?auto_390996 - DIRECTION
      ?auto_390995 - MODE
      ?auto_390999 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_390994 ?auto_390998 ) ( SUPPORTS ?auto_390994 ?auto_390988 ) ( not ( = ?auto_390991 ?auto_390997 ) ) ( HAVE_IMAGE ?auto_390996 ?auto_390995 ) ( not ( = ?auto_390996 ?auto_390991 ) ) ( not ( = ?auto_390996 ?auto_390997 ) ) ( not ( = ?auto_390995 ?auto_390988 ) ) ( CALIBRATION_TARGET ?auto_390994 ?auto_390997 ) ( POINTING ?auto_390998 ?auto_390992 ) ( not ( = ?auto_390997 ?auto_390992 ) ) ( not ( = ?auto_390991 ?auto_390992 ) ) ( not ( = ?auto_390996 ?auto_390992 ) ) ( ON_BOARD ?auto_390999 ?auto_390998 ) ( POWER_ON ?auto_390999 ) ( not ( = ?auto_390994 ?auto_390999 ) ) ( HAVE_IMAGE ?auto_390989 ?auto_390990 ) ( HAVE_IMAGE ?auto_390992 ?auto_390993 ) ( not ( = ?auto_390989 ?auto_390991 ) ) ( not ( = ?auto_390989 ?auto_390992 ) ) ( not ( = ?auto_390989 ?auto_390997 ) ) ( not ( = ?auto_390989 ?auto_390996 ) ) ( not ( = ?auto_390990 ?auto_390988 ) ) ( not ( = ?auto_390990 ?auto_390993 ) ) ( not ( = ?auto_390990 ?auto_390995 ) ) ( not ( = ?auto_390988 ?auto_390993 ) ) ( not ( = ?auto_390993 ?auto_390995 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_390996 ?auto_390995 ?auto_390991 ?auto_390988 )
      ( GET-3IMAGE-VERIFY ?auto_390989 ?auto_390990 ?auto_390991 ?auto_390988 ?auto_390992 ?auto_390993 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_391013 - DIRECTION
      ?auto_391014 - MODE
      ?auto_391015 - DIRECTION
      ?auto_391012 - MODE
      ?auto_391016 - DIRECTION
      ?auto_391017 - MODE
    )
    :vars
    (
      ?auto_391018 - INSTRUMENT
      ?auto_391021 - SATELLITE
      ?auto_391020 - DIRECTION
      ?auto_391019 - DIRECTION
      ?auto_391022 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391018 ?auto_391021 ) ( SUPPORTS ?auto_391018 ?auto_391014 ) ( not ( = ?auto_391013 ?auto_391020 ) ) ( HAVE_IMAGE ?auto_391015 ?auto_391017 ) ( not ( = ?auto_391015 ?auto_391013 ) ) ( not ( = ?auto_391015 ?auto_391020 ) ) ( not ( = ?auto_391017 ?auto_391014 ) ) ( CALIBRATION_TARGET ?auto_391018 ?auto_391020 ) ( POINTING ?auto_391021 ?auto_391019 ) ( not ( = ?auto_391020 ?auto_391019 ) ) ( not ( = ?auto_391013 ?auto_391019 ) ) ( not ( = ?auto_391015 ?auto_391019 ) ) ( ON_BOARD ?auto_391022 ?auto_391021 ) ( POWER_ON ?auto_391022 ) ( not ( = ?auto_391018 ?auto_391022 ) ) ( HAVE_IMAGE ?auto_391015 ?auto_391012 ) ( HAVE_IMAGE ?auto_391016 ?auto_391017 ) ( not ( = ?auto_391013 ?auto_391016 ) ) ( not ( = ?auto_391014 ?auto_391012 ) ) ( not ( = ?auto_391015 ?auto_391016 ) ) ( not ( = ?auto_391012 ?auto_391017 ) ) ( not ( = ?auto_391016 ?auto_391020 ) ) ( not ( = ?auto_391016 ?auto_391019 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391015 ?auto_391017 ?auto_391013 ?auto_391014 )
      ( GET-3IMAGE-VERIFY ?auto_391013 ?auto_391014 ?auto_391015 ?auto_391012 ?auto_391016 ?auto_391017 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_391062 - DIRECTION
      ?auto_391063 - MODE
      ?auto_391064 - DIRECTION
      ?auto_391061 - MODE
      ?auto_391065 - DIRECTION
      ?auto_391066 - MODE
    )
    :vars
    (
      ?auto_391067 - INSTRUMENT
      ?auto_391072 - SATELLITE
      ?auto_391071 - DIRECTION
      ?auto_391070 - DIRECTION
      ?auto_391069 - MODE
      ?auto_391068 - DIRECTION
      ?auto_391073 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391067 ?auto_391072 ) ( SUPPORTS ?auto_391067 ?auto_391063 ) ( not ( = ?auto_391062 ?auto_391071 ) ) ( HAVE_IMAGE ?auto_391070 ?auto_391069 ) ( not ( = ?auto_391070 ?auto_391062 ) ) ( not ( = ?auto_391070 ?auto_391071 ) ) ( not ( = ?auto_391069 ?auto_391063 ) ) ( CALIBRATION_TARGET ?auto_391067 ?auto_391071 ) ( POINTING ?auto_391072 ?auto_391068 ) ( not ( = ?auto_391071 ?auto_391068 ) ) ( not ( = ?auto_391062 ?auto_391068 ) ) ( not ( = ?auto_391070 ?auto_391068 ) ) ( ON_BOARD ?auto_391073 ?auto_391072 ) ( POWER_ON ?auto_391073 ) ( not ( = ?auto_391067 ?auto_391073 ) ) ( HAVE_IMAGE ?auto_391064 ?auto_391061 ) ( HAVE_IMAGE ?auto_391065 ?auto_391066 ) ( not ( = ?auto_391062 ?auto_391064 ) ) ( not ( = ?auto_391062 ?auto_391065 ) ) ( not ( = ?auto_391063 ?auto_391061 ) ) ( not ( = ?auto_391063 ?auto_391066 ) ) ( not ( = ?auto_391064 ?auto_391065 ) ) ( not ( = ?auto_391064 ?auto_391071 ) ) ( not ( = ?auto_391064 ?auto_391070 ) ) ( not ( = ?auto_391064 ?auto_391068 ) ) ( not ( = ?auto_391061 ?auto_391066 ) ) ( not ( = ?auto_391061 ?auto_391069 ) ) ( not ( = ?auto_391065 ?auto_391071 ) ) ( not ( = ?auto_391065 ?auto_391070 ) ) ( not ( = ?auto_391065 ?auto_391068 ) ) ( not ( = ?auto_391066 ?auto_391069 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391070 ?auto_391069 ?auto_391062 ?auto_391063 )
      ( GET-3IMAGE-VERIFY ?auto_391062 ?auto_391063 ?auto_391064 ?auto_391061 ?auto_391065 ?auto_391066 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_391110 - DIRECTION
      ?auto_391111 - MODE
      ?auto_391112 - DIRECTION
      ?auto_391109 - MODE
      ?auto_391113 - DIRECTION
      ?auto_391114 - MODE
    )
    :vars
    (
      ?auto_391115 - INSTRUMENT
      ?auto_391119 - SATELLITE
      ?auto_391118 - DIRECTION
      ?auto_391117 - DIRECTION
      ?auto_391116 - MODE
      ?auto_391120 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391115 ?auto_391119 ) ( SUPPORTS ?auto_391115 ?auto_391111 ) ( not ( = ?auto_391110 ?auto_391118 ) ) ( HAVE_IMAGE ?auto_391117 ?auto_391116 ) ( not ( = ?auto_391117 ?auto_391110 ) ) ( not ( = ?auto_391117 ?auto_391118 ) ) ( not ( = ?auto_391116 ?auto_391111 ) ) ( CALIBRATION_TARGET ?auto_391115 ?auto_391118 ) ( POINTING ?auto_391119 ?auto_391112 ) ( not ( = ?auto_391118 ?auto_391112 ) ) ( not ( = ?auto_391110 ?auto_391112 ) ) ( not ( = ?auto_391117 ?auto_391112 ) ) ( ON_BOARD ?auto_391120 ?auto_391119 ) ( POWER_ON ?auto_391120 ) ( not ( = ?auto_391115 ?auto_391120 ) ) ( HAVE_IMAGE ?auto_391112 ?auto_391109 ) ( HAVE_IMAGE ?auto_391113 ?auto_391114 ) ( not ( = ?auto_391110 ?auto_391113 ) ) ( not ( = ?auto_391111 ?auto_391109 ) ) ( not ( = ?auto_391111 ?auto_391114 ) ) ( not ( = ?auto_391112 ?auto_391113 ) ) ( not ( = ?auto_391109 ?auto_391114 ) ) ( not ( = ?auto_391109 ?auto_391116 ) ) ( not ( = ?auto_391113 ?auto_391118 ) ) ( not ( = ?auto_391113 ?auto_391117 ) ) ( not ( = ?auto_391114 ?auto_391116 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391117 ?auto_391116 ?auto_391110 ?auto_391111 )
      ( GET-3IMAGE-VERIFY ?auto_391110 ?auto_391111 ?auto_391112 ?auto_391109 ?auto_391113 ?auto_391114 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391183 - DIRECTION
      ?auto_391184 - MODE
      ?auto_391185 - DIRECTION
      ?auto_391182 - MODE
      ?auto_391186 - DIRECTION
      ?auto_391187 - MODE
      ?auto_391188 - DIRECTION
      ?auto_391189 - MODE
    )
    :vars
    (
      ?auto_391190 - INSTRUMENT
      ?auto_391193 - SATELLITE
      ?auto_391192 - DIRECTION
      ?auto_391191 - DIRECTION
      ?auto_391194 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391190 ?auto_391193 ) ( SUPPORTS ?auto_391190 ?auto_391189 ) ( not ( = ?auto_391188 ?auto_391192 ) ) ( HAVE_IMAGE ?auto_391186 ?auto_391182 ) ( not ( = ?auto_391186 ?auto_391188 ) ) ( not ( = ?auto_391186 ?auto_391192 ) ) ( not ( = ?auto_391182 ?auto_391189 ) ) ( CALIBRATION_TARGET ?auto_391190 ?auto_391192 ) ( POINTING ?auto_391193 ?auto_391191 ) ( not ( = ?auto_391192 ?auto_391191 ) ) ( not ( = ?auto_391188 ?auto_391191 ) ) ( not ( = ?auto_391186 ?auto_391191 ) ) ( ON_BOARD ?auto_391194 ?auto_391193 ) ( POWER_ON ?auto_391194 ) ( not ( = ?auto_391190 ?auto_391194 ) ) ( HAVE_IMAGE ?auto_391183 ?auto_391184 ) ( HAVE_IMAGE ?auto_391185 ?auto_391182 ) ( HAVE_IMAGE ?auto_391186 ?auto_391187 ) ( not ( = ?auto_391183 ?auto_391185 ) ) ( not ( = ?auto_391183 ?auto_391186 ) ) ( not ( = ?auto_391183 ?auto_391188 ) ) ( not ( = ?auto_391183 ?auto_391192 ) ) ( not ( = ?auto_391183 ?auto_391191 ) ) ( not ( = ?auto_391184 ?auto_391182 ) ) ( not ( = ?auto_391184 ?auto_391187 ) ) ( not ( = ?auto_391184 ?auto_391189 ) ) ( not ( = ?auto_391185 ?auto_391186 ) ) ( not ( = ?auto_391185 ?auto_391188 ) ) ( not ( = ?auto_391185 ?auto_391192 ) ) ( not ( = ?auto_391185 ?auto_391191 ) ) ( not ( = ?auto_391182 ?auto_391187 ) ) ( not ( = ?auto_391187 ?auto_391189 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391186 ?auto_391182 ?auto_391188 ?auto_391189 )
      ( GET-4IMAGE-VERIFY ?auto_391183 ?auto_391184 ?auto_391185 ?auto_391182 ?auto_391186 ?auto_391187 ?auto_391188 ?auto_391189 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391196 - DIRECTION
      ?auto_391197 - MODE
      ?auto_391198 - DIRECTION
      ?auto_391195 - MODE
      ?auto_391199 - DIRECTION
      ?auto_391200 - MODE
      ?auto_391201 - DIRECTION
      ?auto_391202 - MODE
    )
    :vars
    (
      ?auto_391203 - INSTRUMENT
      ?auto_391206 - SATELLITE
      ?auto_391205 - DIRECTION
      ?auto_391204 - DIRECTION
      ?auto_391207 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391203 ?auto_391206 ) ( SUPPORTS ?auto_391203 ?auto_391202 ) ( not ( = ?auto_391201 ?auto_391205 ) ) ( HAVE_IMAGE ?auto_391198 ?auto_391197 ) ( not ( = ?auto_391198 ?auto_391201 ) ) ( not ( = ?auto_391198 ?auto_391205 ) ) ( not ( = ?auto_391197 ?auto_391202 ) ) ( CALIBRATION_TARGET ?auto_391203 ?auto_391205 ) ( POINTING ?auto_391206 ?auto_391204 ) ( not ( = ?auto_391205 ?auto_391204 ) ) ( not ( = ?auto_391201 ?auto_391204 ) ) ( not ( = ?auto_391198 ?auto_391204 ) ) ( ON_BOARD ?auto_391207 ?auto_391206 ) ( POWER_ON ?auto_391207 ) ( not ( = ?auto_391203 ?auto_391207 ) ) ( HAVE_IMAGE ?auto_391196 ?auto_391197 ) ( HAVE_IMAGE ?auto_391198 ?auto_391195 ) ( HAVE_IMAGE ?auto_391199 ?auto_391200 ) ( not ( = ?auto_391196 ?auto_391198 ) ) ( not ( = ?auto_391196 ?auto_391199 ) ) ( not ( = ?auto_391196 ?auto_391201 ) ) ( not ( = ?auto_391196 ?auto_391205 ) ) ( not ( = ?auto_391196 ?auto_391204 ) ) ( not ( = ?auto_391197 ?auto_391195 ) ) ( not ( = ?auto_391197 ?auto_391200 ) ) ( not ( = ?auto_391198 ?auto_391199 ) ) ( not ( = ?auto_391195 ?auto_391200 ) ) ( not ( = ?auto_391195 ?auto_391202 ) ) ( not ( = ?auto_391199 ?auto_391201 ) ) ( not ( = ?auto_391199 ?auto_391205 ) ) ( not ( = ?auto_391199 ?auto_391204 ) ) ( not ( = ?auto_391200 ?auto_391202 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391198 ?auto_391197 ?auto_391201 ?auto_391202 )
      ( GET-4IMAGE-VERIFY ?auto_391196 ?auto_391197 ?auto_391198 ?auto_391195 ?auto_391199 ?auto_391200 ?auto_391201 ?auto_391202 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391234 - DIRECTION
      ?auto_391235 - MODE
      ?auto_391236 - DIRECTION
      ?auto_391233 - MODE
      ?auto_391237 - DIRECTION
      ?auto_391238 - MODE
      ?auto_391239 - DIRECTION
      ?auto_391240 - MODE
    )
    :vars
    (
      ?auto_391241 - INSTRUMENT
      ?auto_391244 - SATELLITE
      ?auto_391243 - DIRECTION
      ?auto_391242 - DIRECTION
      ?auto_391245 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391241 ?auto_391244 ) ( SUPPORTS ?auto_391241 ?auto_391238 ) ( not ( = ?auto_391237 ?auto_391243 ) ) ( HAVE_IMAGE ?auto_391236 ?auto_391235 ) ( not ( = ?auto_391236 ?auto_391237 ) ) ( not ( = ?auto_391236 ?auto_391243 ) ) ( not ( = ?auto_391235 ?auto_391238 ) ) ( CALIBRATION_TARGET ?auto_391241 ?auto_391243 ) ( POINTING ?auto_391244 ?auto_391242 ) ( not ( = ?auto_391243 ?auto_391242 ) ) ( not ( = ?auto_391237 ?auto_391242 ) ) ( not ( = ?auto_391236 ?auto_391242 ) ) ( ON_BOARD ?auto_391245 ?auto_391244 ) ( POWER_ON ?auto_391245 ) ( not ( = ?auto_391241 ?auto_391245 ) ) ( HAVE_IMAGE ?auto_391234 ?auto_391235 ) ( HAVE_IMAGE ?auto_391236 ?auto_391233 ) ( HAVE_IMAGE ?auto_391239 ?auto_391240 ) ( not ( = ?auto_391234 ?auto_391236 ) ) ( not ( = ?auto_391234 ?auto_391237 ) ) ( not ( = ?auto_391234 ?auto_391239 ) ) ( not ( = ?auto_391234 ?auto_391243 ) ) ( not ( = ?auto_391234 ?auto_391242 ) ) ( not ( = ?auto_391235 ?auto_391233 ) ) ( not ( = ?auto_391235 ?auto_391240 ) ) ( not ( = ?auto_391236 ?auto_391239 ) ) ( not ( = ?auto_391233 ?auto_391238 ) ) ( not ( = ?auto_391233 ?auto_391240 ) ) ( not ( = ?auto_391237 ?auto_391239 ) ) ( not ( = ?auto_391238 ?auto_391240 ) ) ( not ( = ?auto_391239 ?auto_391243 ) ) ( not ( = ?auto_391239 ?auto_391242 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391236 ?auto_391235 ?auto_391237 ?auto_391238 )
      ( GET-4IMAGE-VERIFY ?auto_391234 ?auto_391235 ?auto_391236 ?auto_391233 ?auto_391237 ?auto_391238 ?auto_391239 ?auto_391240 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391272 - DIRECTION
      ?auto_391273 - MODE
      ?auto_391274 - DIRECTION
      ?auto_391271 - MODE
      ?auto_391275 - DIRECTION
      ?auto_391276 - MODE
      ?auto_391277 - DIRECTION
      ?auto_391278 - MODE
    )
    :vars
    (
      ?auto_391279 - INSTRUMENT
      ?auto_391282 - SATELLITE
      ?auto_391281 - DIRECTION
      ?auto_391280 - DIRECTION
      ?auto_391283 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391279 ?auto_391282 ) ( SUPPORTS ?auto_391279 ?auto_391278 ) ( not ( = ?auto_391277 ?auto_391281 ) ) ( HAVE_IMAGE ?auto_391272 ?auto_391276 ) ( not ( = ?auto_391272 ?auto_391277 ) ) ( not ( = ?auto_391272 ?auto_391281 ) ) ( not ( = ?auto_391276 ?auto_391278 ) ) ( CALIBRATION_TARGET ?auto_391279 ?auto_391281 ) ( POINTING ?auto_391282 ?auto_391280 ) ( not ( = ?auto_391281 ?auto_391280 ) ) ( not ( = ?auto_391277 ?auto_391280 ) ) ( not ( = ?auto_391272 ?auto_391280 ) ) ( ON_BOARD ?auto_391283 ?auto_391282 ) ( POWER_ON ?auto_391283 ) ( not ( = ?auto_391279 ?auto_391283 ) ) ( HAVE_IMAGE ?auto_391272 ?auto_391273 ) ( HAVE_IMAGE ?auto_391274 ?auto_391271 ) ( HAVE_IMAGE ?auto_391275 ?auto_391276 ) ( not ( = ?auto_391272 ?auto_391274 ) ) ( not ( = ?auto_391272 ?auto_391275 ) ) ( not ( = ?auto_391273 ?auto_391271 ) ) ( not ( = ?auto_391273 ?auto_391276 ) ) ( not ( = ?auto_391273 ?auto_391278 ) ) ( not ( = ?auto_391274 ?auto_391275 ) ) ( not ( = ?auto_391274 ?auto_391277 ) ) ( not ( = ?auto_391274 ?auto_391281 ) ) ( not ( = ?auto_391274 ?auto_391280 ) ) ( not ( = ?auto_391271 ?auto_391276 ) ) ( not ( = ?auto_391271 ?auto_391278 ) ) ( not ( = ?auto_391275 ?auto_391277 ) ) ( not ( = ?auto_391275 ?auto_391281 ) ) ( not ( = ?auto_391275 ?auto_391280 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391272 ?auto_391276 ?auto_391277 ?auto_391278 )
      ( GET-4IMAGE-VERIFY ?auto_391272 ?auto_391273 ?auto_391274 ?auto_391271 ?auto_391275 ?auto_391276 ?auto_391277 ?auto_391278 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391310 - DIRECTION
      ?auto_391311 - MODE
      ?auto_391312 - DIRECTION
      ?auto_391309 - MODE
      ?auto_391313 - DIRECTION
      ?auto_391314 - MODE
      ?auto_391315 - DIRECTION
      ?auto_391316 - MODE
    )
    :vars
    (
      ?auto_391317 - INSTRUMENT
      ?auto_391320 - SATELLITE
      ?auto_391319 - DIRECTION
      ?auto_391318 - DIRECTION
      ?auto_391321 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391317 ?auto_391320 ) ( SUPPORTS ?auto_391317 ?auto_391314 ) ( not ( = ?auto_391313 ?auto_391319 ) ) ( HAVE_IMAGE ?auto_391310 ?auto_391316 ) ( not ( = ?auto_391310 ?auto_391313 ) ) ( not ( = ?auto_391310 ?auto_391319 ) ) ( not ( = ?auto_391316 ?auto_391314 ) ) ( CALIBRATION_TARGET ?auto_391317 ?auto_391319 ) ( POINTING ?auto_391320 ?auto_391318 ) ( not ( = ?auto_391319 ?auto_391318 ) ) ( not ( = ?auto_391313 ?auto_391318 ) ) ( not ( = ?auto_391310 ?auto_391318 ) ) ( ON_BOARD ?auto_391321 ?auto_391320 ) ( POWER_ON ?auto_391321 ) ( not ( = ?auto_391317 ?auto_391321 ) ) ( HAVE_IMAGE ?auto_391310 ?auto_391311 ) ( HAVE_IMAGE ?auto_391312 ?auto_391309 ) ( HAVE_IMAGE ?auto_391315 ?auto_391316 ) ( not ( = ?auto_391310 ?auto_391312 ) ) ( not ( = ?auto_391310 ?auto_391315 ) ) ( not ( = ?auto_391311 ?auto_391309 ) ) ( not ( = ?auto_391311 ?auto_391314 ) ) ( not ( = ?auto_391311 ?auto_391316 ) ) ( not ( = ?auto_391312 ?auto_391313 ) ) ( not ( = ?auto_391312 ?auto_391315 ) ) ( not ( = ?auto_391312 ?auto_391319 ) ) ( not ( = ?auto_391312 ?auto_391318 ) ) ( not ( = ?auto_391309 ?auto_391314 ) ) ( not ( = ?auto_391309 ?auto_391316 ) ) ( not ( = ?auto_391313 ?auto_391315 ) ) ( not ( = ?auto_391315 ?auto_391319 ) ) ( not ( = ?auto_391315 ?auto_391318 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391310 ?auto_391316 ?auto_391313 ?auto_391314 )
      ( GET-4IMAGE-VERIFY ?auto_391310 ?auto_391311 ?auto_391312 ?auto_391309 ?auto_391313 ?auto_391314 ?auto_391315 ?auto_391316 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391323 - DIRECTION
      ?auto_391324 - MODE
      ?auto_391325 - DIRECTION
      ?auto_391322 - MODE
      ?auto_391326 - DIRECTION
      ?auto_391327 - MODE
      ?auto_391328 - DIRECTION
      ?auto_391329 - MODE
    )
    :vars
    (
      ?auto_391330 - INSTRUMENT
      ?auto_391333 - SATELLITE
      ?auto_391332 - DIRECTION
      ?auto_391331 - DIRECTION
      ?auto_391334 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391330 ?auto_391333 ) ( SUPPORTS ?auto_391330 ?auto_391327 ) ( not ( = ?auto_391326 ?auto_391332 ) ) ( HAVE_IMAGE ?auto_391323 ?auto_391324 ) ( not ( = ?auto_391323 ?auto_391326 ) ) ( not ( = ?auto_391323 ?auto_391332 ) ) ( not ( = ?auto_391324 ?auto_391327 ) ) ( CALIBRATION_TARGET ?auto_391330 ?auto_391332 ) ( POINTING ?auto_391333 ?auto_391331 ) ( not ( = ?auto_391332 ?auto_391331 ) ) ( not ( = ?auto_391326 ?auto_391331 ) ) ( not ( = ?auto_391323 ?auto_391331 ) ) ( ON_BOARD ?auto_391334 ?auto_391333 ) ( POWER_ON ?auto_391334 ) ( not ( = ?auto_391330 ?auto_391334 ) ) ( HAVE_IMAGE ?auto_391325 ?auto_391322 ) ( HAVE_IMAGE ?auto_391328 ?auto_391329 ) ( not ( = ?auto_391323 ?auto_391325 ) ) ( not ( = ?auto_391323 ?auto_391328 ) ) ( not ( = ?auto_391324 ?auto_391322 ) ) ( not ( = ?auto_391324 ?auto_391329 ) ) ( not ( = ?auto_391325 ?auto_391326 ) ) ( not ( = ?auto_391325 ?auto_391328 ) ) ( not ( = ?auto_391325 ?auto_391332 ) ) ( not ( = ?auto_391325 ?auto_391331 ) ) ( not ( = ?auto_391322 ?auto_391327 ) ) ( not ( = ?auto_391322 ?auto_391329 ) ) ( not ( = ?auto_391326 ?auto_391328 ) ) ( not ( = ?auto_391327 ?auto_391329 ) ) ( not ( = ?auto_391328 ?auto_391332 ) ) ( not ( = ?auto_391328 ?auto_391331 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391323 ?auto_391324 ?auto_391326 ?auto_391327 )
      ( GET-4IMAGE-VERIFY ?auto_391323 ?auto_391324 ?auto_391325 ?auto_391322 ?auto_391326 ?auto_391327 ?auto_391328 ?auto_391329 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391336 - DIRECTION
      ?auto_391337 - MODE
      ?auto_391338 - DIRECTION
      ?auto_391335 - MODE
      ?auto_391339 - DIRECTION
      ?auto_391340 - MODE
      ?auto_391341 - DIRECTION
      ?auto_391342 - MODE
    )
    :vars
    (
      ?auto_391343 - INSTRUMENT
      ?auto_391345 - SATELLITE
      ?auto_391344 - DIRECTION
      ?auto_391346 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391343 ?auto_391345 ) ( SUPPORTS ?auto_391343 ?auto_391340 ) ( not ( = ?auto_391339 ?auto_391344 ) ) ( HAVE_IMAGE ?auto_391336 ?auto_391337 ) ( not ( = ?auto_391336 ?auto_391339 ) ) ( not ( = ?auto_391336 ?auto_391344 ) ) ( not ( = ?auto_391337 ?auto_391340 ) ) ( CALIBRATION_TARGET ?auto_391343 ?auto_391344 ) ( POINTING ?auto_391345 ?auto_391341 ) ( not ( = ?auto_391344 ?auto_391341 ) ) ( not ( = ?auto_391339 ?auto_391341 ) ) ( not ( = ?auto_391336 ?auto_391341 ) ) ( ON_BOARD ?auto_391346 ?auto_391345 ) ( POWER_ON ?auto_391346 ) ( not ( = ?auto_391343 ?auto_391346 ) ) ( HAVE_IMAGE ?auto_391338 ?auto_391335 ) ( HAVE_IMAGE ?auto_391341 ?auto_391342 ) ( not ( = ?auto_391336 ?auto_391338 ) ) ( not ( = ?auto_391337 ?auto_391335 ) ) ( not ( = ?auto_391337 ?auto_391342 ) ) ( not ( = ?auto_391338 ?auto_391339 ) ) ( not ( = ?auto_391338 ?auto_391341 ) ) ( not ( = ?auto_391338 ?auto_391344 ) ) ( not ( = ?auto_391335 ?auto_391340 ) ) ( not ( = ?auto_391335 ?auto_391342 ) ) ( not ( = ?auto_391340 ?auto_391342 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391336 ?auto_391337 ?auto_391339 ?auto_391340 )
      ( GET-4IMAGE-VERIFY ?auto_391336 ?auto_391337 ?auto_391338 ?auto_391335 ?auto_391339 ?auto_391340 ?auto_391341 ?auto_391342 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391381 - DIRECTION
      ?auto_391382 - MODE
      ?auto_391383 - DIRECTION
      ?auto_391380 - MODE
      ?auto_391384 - DIRECTION
      ?auto_391385 - MODE
      ?auto_391386 - DIRECTION
      ?auto_391387 - MODE
    )
    :vars
    (
      ?auto_391388 - INSTRUMENT
      ?auto_391390 - SATELLITE
      ?auto_391389 - DIRECTION
      ?auto_391391 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391388 ?auto_391390 ) ( SUPPORTS ?auto_391388 ?auto_391387 ) ( not ( = ?auto_391386 ?auto_391389 ) ) ( HAVE_IMAGE ?auto_391381 ?auto_391382 ) ( not ( = ?auto_391381 ?auto_391386 ) ) ( not ( = ?auto_391381 ?auto_391389 ) ) ( not ( = ?auto_391382 ?auto_391387 ) ) ( CALIBRATION_TARGET ?auto_391388 ?auto_391389 ) ( POINTING ?auto_391390 ?auto_391383 ) ( not ( = ?auto_391389 ?auto_391383 ) ) ( not ( = ?auto_391386 ?auto_391383 ) ) ( not ( = ?auto_391381 ?auto_391383 ) ) ( ON_BOARD ?auto_391391 ?auto_391390 ) ( POWER_ON ?auto_391391 ) ( not ( = ?auto_391388 ?auto_391391 ) ) ( HAVE_IMAGE ?auto_391383 ?auto_391380 ) ( HAVE_IMAGE ?auto_391384 ?auto_391385 ) ( not ( = ?auto_391381 ?auto_391384 ) ) ( not ( = ?auto_391382 ?auto_391380 ) ) ( not ( = ?auto_391382 ?auto_391385 ) ) ( not ( = ?auto_391383 ?auto_391384 ) ) ( not ( = ?auto_391380 ?auto_391385 ) ) ( not ( = ?auto_391380 ?auto_391387 ) ) ( not ( = ?auto_391384 ?auto_391386 ) ) ( not ( = ?auto_391384 ?auto_391389 ) ) ( not ( = ?auto_391385 ?auto_391387 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391381 ?auto_391382 ?auto_391386 ?auto_391387 )
      ( GET-4IMAGE-VERIFY ?auto_391381 ?auto_391382 ?auto_391383 ?auto_391380 ?auto_391384 ?auto_391385 ?auto_391386 ?auto_391387 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391441 - DIRECTION
      ?auto_391442 - MODE
      ?auto_391443 - DIRECTION
      ?auto_391440 - MODE
      ?auto_391444 - DIRECTION
      ?auto_391445 - MODE
      ?auto_391446 - DIRECTION
      ?auto_391447 - MODE
    )
    :vars
    (
      ?auto_391448 - INSTRUMENT
      ?auto_391451 - SATELLITE
      ?auto_391450 - DIRECTION
      ?auto_391449 - DIRECTION
      ?auto_391452 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391448 ?auto_391451 ) ( SUPPORTS ?auto_391448 ?auto_391440 ) ( not ( = ?auto_391443 ?auto_391450 ) ) ( HAVE_IMAGE ?auto_391444 ?auto_391445 ) ( not ( = ?auto_391444 ?auto_391443 ) ) ( not ( = ?auto_391444 ?auto_391450 ) ) ( not ( = ?auto_391445 ?auto_391440 ) ) ( CALIBRATION_TARGET ?auto_391448 ?auto_391450 ) ( POINTING ?auto_391451 ?auto_391449 ) ( not ( = ?auto_391450 ?auto_391449 ) ) ( not ( = ?auto_391443 ?auto_391449 ) ) ( not ( = ?auto_391444 ?auto_391449 ) ) ( ON_BOARD ?auto_391452 ?auto_391451 ) ( POWER_ON ?auto_391452 ) ( not ( = ?auto_391448 ?auto_391452 ) ) ( HAVE_IMAGE ?auto_391441 ?auto_391442 ) ( HAVE_IMAGE ?auto_391446 ?auto_391447 ) ( not ( = ?auto_391441 ?auto_391443 ) ) ( not ( = ?auto_391441 ?auto_391444 ) ) ( not ( = ?auto_391441 ?auto_391446 ) ) ( not ( = ?auto_391441 ?auto_391450 ) ) ( not ( = ?auto_391441 ?auto_391449 ) ) ( not ( = ?auto_391442 ?auto_391440 ) ) ( not ( = ?auto_391442 ?auto_391445 ) ) ( not ( = ?auto_391442 ?auto_391447 ) ) ( not ( = ?auto_391443 ?auto_391446 ) ) ( not ( = ?auto_391440 ?auto_391447 ) ) ( not ( = ?auto_391444 ?auto_391446 ) ) ( not ( = ?auto_391445 ?auto_391447 ) ) ( not ( = ?auto_391446 ?auto_391450 ) ) ( not ( = ?auto_391446 ?auto_391449 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391444 ?auto_391445 ?auto_391443 ?auto_391440 )
      ( GET-4IMAGE-VERIFY ?auto_391441 ?auto_391442 ?auto_391443 ?auto_391440 ?auto_391444 ?auto_391445 ?auto_391446 ?auto_391447 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391454 - DIRECTION
      ?auto_391455 - MODE
      ?auto_391456 - DIRECTION
      ?auto_391453 - MODE
      ?auto_391457 - DIRECTION
      ?auto_391458 - MODE
      ?auto_391459 - DIRECTION
      ?auto_391460 - MODE
    )
    :vars
    (
      ?auto_391461 - INSTRUMENT
      ?auto_391464 - SATELLITE
      ?auto_391463 - DIRECTION
      ?auto_391462 - DIRECTION
      ?auto_391465 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391461 ?auto_391464 ) ( SUPPORTS ?auto_391461 ?auto_391453 ) ( not ( = ?auto_391456 ?auto_391463 ) ) ( HAVE_IMAGE ?auto_391454 ?auto_391455 ) ( not ( = ?auto_391454 ?auto_391456 ) ) ( not ( = ?auto_391454 ?auto_391463 ) ) ( not ( = ?auto_391455 ?auto_391453 ) ) ( CALIBRATION_TARGET ?auto_391461 ?auto_391463 ) ( POINTING ?auto_391464 ?auto_391462 ) ( not ( = ?auto_391463 ?auto_391462 ) ) ( not ( = ?auto_391456 ?auto_391462 ) ) ( not ( = ?auto_391454 ?auto_391462 ) ) ( ON_BOARD ?auto_391465 ?auto_391464 ) ( POWER_ON ?auto_391465 ) ( not ( = ?auto_391461 ?auto_391465 ) ) ( HAVE_IMAGE ?auto_391457 ?auto_391458 ) ( HAVE_IMAGE ?auto_391459 ?auto_391460 ) ( not ( = ?auto_391454 ?auto_391457 ) ) ( not ( = ?auto_391454 ?auto_391459 ) ) ( not ( = ?auto_391455 ?auto_391458 ) ) ( not ( = ?auto_391455 ?auto_391460 ) ) ( not ( = ?auto_391456 ?auto_391457 ) ) ( not ( = ?auto_391456 ?auto_391459 ) ) ( not ( = ?auto_391453 ?auto_391458 ) ) ( not ( = ?auto_391453 ?auto_391460 ) ) ( not ( = ?auto_391457 ?auto_391459 ) ) ( not ( = ?auto_391457 ?auto_391463 ) ) ( not ( = ?auto_391457 ?auto_391462 ) ) ( not ( = ?auto_391458 ?auto_391460 ) ) ( not ( = ?auto_391459 ?auto_391463 ) ) ( not ( = ?auto_391459 ?auto_391462 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391454 ?auto_391455 ?auto_391456 ?auto_391453 )
      ( GET-4IMAGE-VERIFY ?auto_391454 ?auto_391455 ?auto_391456 ?auto_391453 ?auto_391457 ?auto_391458 ?auto_391459 ?auto_391460 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391539 - DIRECTION
      ?auto_391540 - MODE
      ?auto_391541 - DIRECTION
      ?auto_391538 - MODE
      ?auto_391542 - DIRECTION
      ?auto_391543 - MODE
      ?auto_391544 - DIRECTION
      ?auto_391545 - MODE
    )
    :vars
    (
      ?auto_391546 - INSTRUMENT
      ?auto_391548 - SATELLITE
      ?auto_391547 - DIRECTION
      ?auto_391549 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391546 ?auto_391548 ) ( SUPPORTS ?auto_391546 ?auto_391538 ) ( not ( = ?auto_391541 ?auto_391547 ) ) ( HAVE_IMAGE ?auto_391544 ?auto_391545 ) ( not ( = ?auto_391544 ?auto_391541 ) ) ( not ( = ?auto_391544 ?auto_391547 ) ) ( not ( = ?auto_391545 ?auto_391538 ) ) ( CALIBRATION_TARGET ?auto_391546 ?auto_391547 ) ( POINTING ?auto_391548 ?auto_391542 ) ( not ( = ?auto_391547 ?auto_391542 ) ) ( not ( = ?auto_391541 ?auto_391542 ) ) ( not ( = ?auto_391544 ?auto_391542 ) ) ( ON_BOARD ?auto_391549 ?auto_391548 ) ( POWER_ON ?auto_391549 ) ( not ( = ?auto_391546 ?auto_391549 ) ) ( HAVE_IMAGE ?auto_391539 ?auto_391540 ) ( HAVE_IMAGE ?auto_391542 ?auto_391543 ) ( not ( = ?auto_391539 ?auto_391541 ) ) ( not ( = ?auto_391539 ?auto_391542 ) ) ( not ( = ?auto_391539 ?auto_391544 ) ) ( not ( = ?auto_391539 ?auto_391547 ) ) ( not ( = ?auto_391540 ?auto_391538 ) ) ( not ( = ?auto_391540 ?auto_391543 ) ) ( not ( = ?auto_391540 ?auto_391545 ) ) ( not ( = ?auto_391538 ?auto_391543 ) ) ( not ( = ?auto_391543 ?auto_391545 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391544 ?auto_391545 ?auto_391541 ?auto_391538 )
      ( GET-4IMAGE-VERIFY ?auto_391539 ?auto_391540 ?auto_391541 ?auto_391538 ?auto_391542 ?auto_391543 ?auto_391544 ?auto_391545 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391634 - DIRECTION
      ?auto_391635 - MODE
      ?auto_391636 - DIRECTION
      ?auto_391633 - MODE
      ?auto_391637 - DIRECTION
      ?auto_391638 - MODE
      ?auto_391639 - DIRECTION
      ?auto_391640 - MODE
    )
    :vars
    (
      ?auto_391641 - INSTRUMENT
      ?auto_391644 - SATELLITE
      ?auto_391643 - DIRECTION
      ?auto_391642 - DIRECTION
      ?auto_391645 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391641 ?auto_391644 ) ( SUPPORTS ?auto_391641 ?auto_391640 ) ( not ( = ?auto_391639 ?auto_391643 ) ) ( HAVE_IMAGE ?auto_391636 ?auto_391638 ) ( not ( = ?auto_391636 ?auto_391639 ) ) ( not ( = ?auto_391636 ?auto_391643 ) ) ( not ( = ?auto_391638 ?auto_391640 ) ) ( CALIBRATION_TARGET ?auto_391641 ?auto_391643 ) ( POINTING ?auto_391644 ?auto_391642 ) ( not ( = ?auto_391643 ?auto_391642 ) ) ( not ( = ?auto_391639 ?auto_391642 ) ) ( not ( = ?auto_391636 ?auto_391642 ) ) ( ON_BOARD ?auto_391645 ?auto_391644 ) ( POWER_ON ?auto_391645 ) ( not ( = ?auto_391641 ?auto_391645 ) ) ( HAVE_IMAGE ?auto_391634 ?auto_391635 ) ( HAVE_IMAGE ?auto_391636 ?auto_391633 ) ( HAVE_IMAGE ?auto_391637 ?auto_391638 ) ( not ( = ?auto_391634 ?auto_391636 ) ) ( not ( = ?auto_391634 ?auto_391637 ) ) ( not ( = ?auto_391634 ?auto_391639 ) ) ( not ( = ?auto_391634 ?auto_391643 ) ) ( not ( = ?auto_391634 ?auto_391642 ) ) ( not ( = ?auto_391635 ?auto_391633 ) ) ( not ( = ?auto_391635 ?auto_391638 ) ) ( not ( = ?auto_391635 ?auto_391640 ) ) ( not ( = ?auto_391636 ?auto_391637 ) ) ( not ( = ?auto_391633 ?auto_391638 ) ) ( not ( = ?auto_391633 ?auto_391640 ) ) ( not ( = ?auto_391637 ?auto_391639 ) ) ( not ( = ?auto_391637 ?auto_391643 ) ) ( not ( = ?auto_391637 ?auto_391642 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391636 ?auto_391638 ?auto_391639 ?auto_391640 )
      ( GET-4IMAGE-VERIFY ?auto_391634 ?auto_391635 ?auto_391636 ?auto_391633 ?auto_391637 ?auto_391638 ?auto_391639 ?auto_391640 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391647 - DIRECTION
      ?auto_391648 - MODE
      ?auto_391649 - DIRECTION
      ?auto_391646 - MODE
      ?auto_391650 - DIRECTION
      ?auto_391651 - MODE
      ?auto_391652 - DIRECTION
      ?auto_391653 - MODE
    )
    :vars
    (
      ?auto_391654 - INSTRUMENT
      ?auto_391657 - SATELLITE
      ?auto_391656 - DIRECTION
      ?auto_391655 - DIRECTION
      ?auto_391658 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391654 ?auto_391657 ) ( SUPPORTS ?auto_391654 ?auto_391653 ) ( not ( = ?auto_391652 ?auto_391656 ) ) ( HAVE_IMAGE ?auto_391649 ?auto_391646 ) ( not ( = ?auto_391649 ?auto_391652 ) ) ( not ( = ?auto_391649 ?auto_391656 ) ) ( not ( = ?auto_391646 ?auto_391653 ) ) ( CALIBRATION_TARGET ?auto_391654 ?auto_391656 ) ( POINTING ?auto_391657 ?auto_391655 ) ( not ( = ?auto_391656 ?auto_391655 ) ) ( not ( = ?auto_391652 ?auto_391655 ) ) ( not ( = ?auto_391649 ?auto_391655 ) ) ( ON_BOARD ?auto_391658 ?auto_391657 ) ( POWER_ON ?auto_391658 ) ( not ( = ?auto_391654 ?auto_391658 ) ) ( HAVE_IMAGE ?auto_391647 ?auto_391648 ) ( HAVE_IMAGE ?auto_391650 ?auto_391651 ) ( not ( = ?auto_391647 ?auto_391649 ) ) ( not ( = ?auto_391647 ?auto_391650 ) ) ( not ( = ?auto_391647 ?auto_391652 ) ) ( not ( = ?auto_391647 ?auto_391656 ) ) ( not ( = ?auto_391647 ?auto_391655 ) ) ( not ( = ?auto_391648 ?auto_391646 ) ) ( not ( = ?auto_391648 ?auto_391651 ) ) ( not ( = ?auto_391648 ?auto_391653 ) ) ( not ( = ?auto_391649 ?auto_391650 ) ) ( not ( = ?auto_391646 ?auto_391651 ) ) ( not ( = ?auto_391650 ?auto_391652 ) ) ( not ( = ?auto_391650 ?auto_391656 ) ) ( not ( = ?auto_391650 ?auto_391655 ) ) ( not ( = ?auto_391651 ?auto_391653 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391649 ?auto_391646 ?auto_391652 ?auto_391653 )
      ( GET-4IMAGE-VERIFY ?auto_391647 ?auto_391648 ?auto_391649 ?auto_391646 ?auto_391650 ?auto_391651 ?auto_391652 ?auto_391653 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391668 - DIRECTION
      ?auto_391669 - MODE
      ?auto_391670 - DIRECTION
      ?auto_391667 - MODE
      ?auto_391671 - DIRECTION
      ?auto_391672 - MODE
      ?auto_391673 - DIRECTION
      ?auto_391674 - MODE
    )
    :vars
    (
      ?auto_391675 - INSTRUMENT
      ?auto_391678 - SATELLITE
      ?auto_391677 - DIRECTION
      ?auto_391676 - DIRECTION
      ?auto_391679 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391675 ?auto_391678 ) ( SUPPORTS ?auto_391675 ?auto_391672 ) ( not ( = ?auto_391671 ?auto_391677 ) ) ( HAVE_IMAGE ?auto_391670 ?auto_391667 ) ( not ( = ?auto_391670 ?auto_391671 ) ) ( not ( = ?auto_391670 ?auto_391677 ) ) ( not ( = ?auto_391667 ?auto_391672 ) ) ( CALIBRATION_TARGET ?auto_391675 ?auto_391677 ) ( POINTING ?auto_391678 ?auto_391676 ) ( not ( = ?auto_391677 ?auto_391676 ) ) ( not ( = ?auto_391671 ?auto_391676 ) ) ( not ( = ?auto_391670 ?auto_391676 ) ) ( ON_BOARD ?auto_391679 ?auto_391678 ) ( POWER_ON ?auto_391679 ) ( not ( = ?auto_391675 ?auto_391679 ) ) ( HAVE_IMAGE ?auto_391668 ?auto_391669 ) ( HAVE_IMAGE ?auto_391673 ?auto_391674 ) ( not ( = ?auto_391668 ?auto_391670 ) ) ( not ( = ?auto_391668 ?auto_391671 ) ) ( not ( = ?auto_391668 ?auto_391673 ) ) ( not ( = ?auto_391668 ?auto_391677 ) ) ( not ( = ?auto_391668 ?auto_391676 ) ) ( not ( = ?auto_391669 ?auto_391667 ) ) ( not ( = ?auto_391669 ?auto_391672 ) ) ( not ( = ?auto_391669 ?auto_391674 ) ) ( not ( = ?auto_391670 ?auto_391673 ) ) ( not ( = ?auto_391667 ?auto_391674 ) ) ( not ( = ?auto_391671 ?auto_391673 ) ) ( not ( = ?auto_391672 ?auto_391674 ) ) ( not ( = ?auto_391673 ?auto_391677 ) ) ( not ( = ?auto_391673 ?auto_391676 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391670 ?auto_391667 ?auto_391671 ?auto_391672 )
      ( GET-4IMAGE-VERIFY ?auto_391668 ?auto_391669 ?auto_391670 ?auto_391667 ?auto_391671 ?auto_391672 ?auto_391673 ?auto_391674 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391715 - DIRECTION
      ?auto_391716 - MODE
      ?auto_391717 - DIRECTION
      ?auto_391714 - MODE
      ?auto_391718 - DIRECTION
      ?auto_391719 - MODE
      ?auto_391720 - DIRECTION
      ?auto_391721 - MODE
    )
    :vars
    (
      ?auto_391722 - INSTRUMENT
      ?auto_391725 - SATELLITE
      ?auto_391724 - DIRECTION
      ?auto_391723 - DIRECTION
      ?auto_391726 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391722 ?auto_391725 ) ( SUPPORTS ?auto_391722 ?auto_391721 ) ( not ( = ?auto_391720 ?auto_391724 ) ) ( HAVE_IMAGE ?auto_391718 ?auto_391719 ) ( not ( = ?auto_391718 ?auto_391720 ) ) ( not ( = ?auto_391718 ?auto_391724 ) ) ( not ( = ?auto_391719 ?auto_391721 ) ) ( CALIBRATION_TARGET ?auto_391722 ?auto_391724 ) ( POINTING ?auto_391725 ?auto_391723 ) ( not ( = ?auto_391724 ?auto_391723 ) ) ( not ( = ?auto_391720 ?auto_391723 ) ) ( not ( = ?auto_391718 ?auto_391723 ) ) ( ON_BOARD ?auto_391726 ?auto_391725 ) ( POWER_ON ?auto_391726 ) ( not ( = ?auto_391722 ?auto_391726 ) ) ( HAVE_IMAGE ?auto_391715 ?auto_391716 ) ( HAVE_IMAGE ?auto_391717 ?auto_391714 ) ( not ( = ?auto_391715 ?auto_391717 ) ) ( not ( = ?auto_391715 ?auto_391718 ) ) ( not ( = ?auto_391715 ?auto_391720 ) ) ( not ( = ?auto_391715 ?auto_391724 ) ) ( not ( = ?auto_391715 ?auto_391723 ) ) ( not ( = ?auto_391716 ?auto_391714 ) ) ( not ( = ?auto_391716 ?auto_391719 ) ) ( not ( = ?auto_391716 ?auto_391721 ) ) ( not ( = ?auto_391717 ?auto_391718 ) ) ( not ( = ?auto_391717 ?auto_391720 ) ) ( not ( = ?auto_391717 ?auto_391724 ) ) ( not ( = ?auto_391717 ?auto_391723 ) ) ( not ( = ?auto_391714 ?auto_391719 ) ) ( not ( = ?auto_391714 ?auto_391721 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391718 ?auto_391719 ?auto_391720 ?auto_391721 )
      ( GET-4IMAGE-VERIFY ?auto_391715 ?auto_391716 ?auto_391717 ?auto_391714 ?auto_391718 ?auto_391719 ?auto_391720 ?auto_391721 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391728 - DIRECTION
      ?auto_391729 - MODE
      ?auto_391730 - DIRECTION
      ?auto_391727 - MODE
      ?auto_391731 - DIRECTION
      ?auto_391732 - MODE
      ?auto_391733 - DIRECTION
      ?auto_391734 - MODE
    )
    :vars
    (
      ?auto_391735 - INSTRUMENT
      ?auto_391740 - SATELLITE
      ?auto_391739 - DIRECTION
      ?auto_391738 - DIRECTION
      ?auto_391737 - MODE
      ?auto_391736 - DIRECTION
      ?auto_391741 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391735 ?auto_391740 ) ( SUPPORTS ?auto_391735 ?auto_391734 ) ( not ( = ?auto_391733 ?auto_391739 ) ) ( HAVE_IMAGE ?auto_391738 ?auto_391737 ) ( not ( = ?auto_391738 ?auto_391733 ) ) ( not ( = ?auto_391738 ?auto_391739 ) ) ( not ( = ?auto_391737 ?auto_391734 ) ) ( CALIBRATION_TARGET ?auto_391735 ?auto_391739 ) ( POINTING ?auto_391740 ?auto_391736 ) ( not ( = ?auto_391739 ?auto_391736 ) ) ( not ( = ?auto_391733 ?auto_391736 ) ) ( not ( = ?auto_391738 ?auto_391736 ) ) ( ON_BOARD ?auto_391741 ?auto_391740 ) ( POWER_ON ?auto_391741 ) ( not ( = ?auto_391735 ?auto_391741 ) ) ( HAVE_IMAGE ?auto_391728 ?auto_391729 ) ( HAVE_IMAGE ?auto_391730 ?auto_391727 ) ( HAVE_IMAGE ?auto_391731 ?auto_391732 ) ( not ( = ?auto_391728 ?auto_391730 ) ) ( not ( = ?auto_391728 ?auto_391731 ) ) ( not ( = ?auto_391728 ?auto_391733 ) ) ( not ( = ?auto_391728 ?auto_391739 ) ) ( not ( = ?auto_391728 ?auto_391738 ) ) ( not ( = ?auto_391728 ?auto_391736 ) ) ( not ( = ?auto_391729 ?auto_391727 ) ) ( not ( = ?auto_391729 ?auto_391732 ) ) ( not ( = ?auto_391729 ?auto_391734 ) ) ( not ( = ?auto_391729 ?auto_391737 ) ) ( not ( = ?auto_391730 ?auto_391731 ) ) ( not ( = ?auto_391730 ?auto_391733 ) ) ( not ( = ?auto_391730 ?auto_391739 ) ) ( not ( = ?auto_391730 ?auto_391738 ) ) ( not ( = ?auto_391730 ?auto_391736 ) ) ( not ( = ?auto_391727 ?auto_391732 ) ) ( not ( = ?auto_391727 ?auto_391734 ) ) ( not ( = ?auto_391727 ?auto_391737 ) ) ( not ( = ?auto_391731 ?auto_391733 ) ) ( not ( = ?auto_391731 ?auto_391739 ) ) ( not ( = ?auto_391731 ?auto_391738 ) ) ( not ( = ?auto_391731 ?auto_391736 ) ) ( not ( = ?auto_391732 ?auto_391734 ) ) ( not ( = ?auto_391732 ?auto_391737 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391738 ?auto_391737 ?auto_391733 ?auto_391734 )
      ( GET-4IMAGE-VERIFY ?auto_391728 ?auto_391729 ?auto_391730 ?auto_391727 ?auto_391731 ?auto_391732 ?auto_391733 ?auto_391734 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391770 - DIRECTION
      ?auto_391771 - MODE
      ?auto_391772 - DIRECTION
      ?auto_391769 - MODE
      ?auto_391773 - DIRECTION
      ?auto_391774 - MODE
      ?auto_391775 - DIRECTION
      ?auto_391776 - MODE
    )
    :vars
    (
      ?auto_391777 - INSTRUMENT
      ?auto_391782 - SATELLITE
      ?auto_391781 - DIRECTION
      ?auto_391780 - DIRECTION
      ?auto_391779 - MODE
      ?auto_391778 - DIRECTION
      ?auto_391783 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391777 ?auto_391782 ) ( SUPPORTS ?auto_391777 ?auto_391774 ) ( not ( = ?auto_391773 ?auto_391781 ) ) ( HAVE_IMAGE ?auto_391780 ?auto_391779 ) ( not ( = ?auto_391780 ?auto_391773 ) ) ( not ( = ?auto_391780 ?auto_391781 ) ) ( not ( = ?auto_391779 ?auto_391774 ) ) ( CALIBRATION_TARGET ?auto_391777 ?auto_391781 ) ( POINTING ?auto_391782 ?auto_391778 ) ( not ( = ?auto_391781 ?auto_391778 ) ) ( not ( = ?auto_391773 ?auto_391778 ) ) ( not ( = ?auto_391780 ?auto_391778 ) ) ( ON_BOARD ?auto_391783 ?auto_391782 ) ( POWER_ON ?auto_391783 ) ( not ( = ?auto_391777 ?auto_391783 ) ) ( HAVE_IMAGE ?auto_391770 ?auto_391771 ) ( HAVE_IMAGE ?auto_391772 ?auto_391769 ) ( HAVE_IMAGE ?auto_391775 ?auto_391776 ) ( not ( = ?auto_391770 ?auto_391772 ) ) ( not ( = ?auto_391770 ?auto_391773 ) ) ( not ( = ?auto_391770 ?auto_391775 ) ) ( not ( = ?auto_391770 ?auto_391781 ) ) ( not ( = ?auto_391770 ?auto_391780 ) ) ( not ( = ?auto_391770 ?auto_391778 ) ) ( not ( = ?auto_391771 ?auto_391769 ) ) ( not ( = ?auto_391771 ?auto_391774 ) ) ( not ( = ?auto_391771 ?auto_391776 ) ) ( not ( = ?auto_391771 ?auto_391779 ) ) ( not ( = ?auto_391772 ?auto_391773 ) ) ( not ( = ?auto_391772 ?auto_391775 ) ) ( not ( = ?auto_391772 ?auto_391781 ) ) ( not ( = ?auto_391772 ?auto_391780 ) ) ( not ( = ?auto_391772 ?auto_391778 ) ) ( not ( = ?auto_391769 ?auto_391774 ) ) ( not ( = ?auto_391769 ?auto_391776 ) ) ( not ( = ?auto_391769 ?auto_391779 ) ) ( not ( = ?auto_391773 ?auto_391775 ) ) ( not ( = ?auto_391774 ?auto_391776 ) ) ( not ( = ?auto_391775 ?auto_391781 ) ) ( not ( = ?auto_391775 ?auto_391780 ) ) ( not ( = ?auto_391775 ?auto_391778 ) ) ( not ( = ?auto_391776 ?auto_391779 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391780 ?auto_391779 ?auto_391773 ?auto_391774 )
      ( GET-4IMAGE-VERIFY ?auto_391770 ?auto_391771 ?auto_391772 ?auto_391769 ?auto_391773 ?auto_391774 ?auto_391775 ?auto_391776 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391785 - DIRECTION
      ?auto_391786 - MODE
      ?auto_391787 - DIRECTION
      ?auto_391784 - MODE
      ?auto_391788 - DIRECTION
      ?auto_391789 - MODE
      ?auto_391790 - DIRECTION
      ?auto_391791 - MODE
    )
    :vars
    (
      ?auto_391792 - INSTRUMENT
      ?auto_391796 - SATELLITE
      ?auto_391795 - DIRECTION
      ?auto_391794 - DIRECTION
      ?auto_391793 - MODE
      ?auto_391797 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391792 ?auto_391796 ) ( SUPPORTS ?auto_391792 ?auto_391789 ) ( not ( = ?auto_391788 ?auto_391795 ) ) ( HAVE_IMAGE ?auto_391794 ?auto_391793 ) ( not ( = ?auto_391794 ?auto_391788 ) ) ( not ( = ?auto_391794 ?auto_391795 ) ) ( not ( = ?auto_391793 ?auto_391789 ) ) ( CALIBRATION_TARGET ?auto_391792 ?auto_391795 ) ( POINTING ?auto_391796 ?auto_391790 ) ( not ( = ?auto_391795 ?auto_391790 ) ) ( not ( = ?auto_391788 ?auto_391790 ) ) ( not ( = ?auto_391794 ?auto_391790 ) ) ( ON_BOARD ?auto_391797 ?auto_391796 ) ( POWER_ON ?auto_391797 ) ( not ( = ?auto_391792 ?auto_391797 ) ) ( HAVE_IMAGE ?auto_391785 ?auto_391786 ) ( HAVE_IMAGE ?auto_391787 ?auto_391784 ) ( HAVE_IMAGE ?auto_391790 ?auto_391791 ) ( not ( = ?auto_391785 ?auto_391787 ) ) ( not ( = ?auto_391785 ?auto_391788 ) ) ( not ( = ?auto_391785 ?auto_391790 ) ) ( not ( = ?auto_391785 ?auto_391795 ) ) ( not ( = ?auto_391785 ?auto_391794 ) ) ( not ( = ?auto_391786 ?auto_391784 ) ) ( not ( = ?auto_391786 ?auto_391789 ) ) ( not ( = ?auto_391786 ?auto_391791 ) ) ( not ( = ?auto_391786 ?auto_391793 ) ) ( not ( = ?auto_391787 ?auto_391788 ) ) ( not ( = ?auto_391787 ?auto_391790 ) ) ( not ( = ?auto_391787 ?auto_391795 ) ) ( not ( = ?auto_391787 ?auto_391794 ) ) ( not ( = ?auto_391784 ?auto_391789 ) ) ( not ( = ?auto_391784 ?auto_391791 ) ) ( not ( = ?auto_391784 ?auto_391793 ) ) ( not ( = ?auto_391789 ?auto_391791 ) ) ( not ( = ?auto_391791 ?auto_391793 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391794 ?auto_391793 ?auto_391788 ?auto_391789 )
      ( GET-4IMAGE-VERIFY ?auto_391785 ?auto_391786 ?auto_391787 ?auto_391784 ?auto_391788 ?auto_391789 ?auto_391790 ?auto_391791 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391822 - DIRECTION
      ?auto_391823 - MODE
      ?auto_391824 - DIRECTION
      ?auto_391821 - MODE
      ?auto_391825 - DIRECTION
      ?auto_391826 - MODE
      ?auto_391827 - DIRECTION
      ?auto_391828 - MODE
    )
    :vars
    (
      ?auto_391829 - INSTRUMENT
      ?auto_391833 - SATELLITE
      ?auto_391832 - DIRECTION
      ?auto_391831 - DIRECTION
      ?auto_391830 - MODE
      ?auto_391834 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391829 ?auto_391833 ) ( SUPPORTS ?auto_391829 ?auto_391828 ) ( not ( = ?auto_391827 ?auto_391832 ) ) ( HAVE_IMAGE ?auto_391831 ?auto_391830 ) ( not ( = ?auto_391831 ?auto_391827 ) ) ( not ( = ?auto_391831 ?auto_391832 ) ) ( not ( = ?auto_391830 ?auto_391828 ) ) ( CALIBRATION_TARGET ?auto_391829 ?auto_391832 ) ( POINTING ?auto_391833 ?auto_391824 ) ( not ( = ?auto_391832 ?auto_391824 ) ) ( not ( = ?auto_391827 ?auto_391824 ) ) ( not ( = ?auto_391831 ?auto_391824 ) ) ( ON_BOARD ?auto_391834 ?auto_391833 ) ( POWER_ON ?auto_391834 ) ( not ( = ?auto_391829 ?auto_391834 ) ) ( HAVE_IMAGE ?auto_391822 ?auto_391823 ) ( HAVE_IMAGE ?auto_391824 ?auto_391821 ) ( HAVE_IMAGE ?auto_391825 ?auto_391826 ) ( not ( = ?auto_391822 ?auto_391824 ) ) ( not ( = ?auto_391822 ?auto_391825 ) ) ( not ( = ?auto_391822 ?auto_391827 ) ) ( not ( = ?auto_391822 ?auto_391832 ) ) ( not ( = ?auto_391822 ?auto_391831 ) ) ( not ( = ?auto_391823 ?auto_391821 ) ) ( not ( = ?auto_391823 ?auto_391826 ) ) ( not ( = ?auto_391823 ?auto_391828 ) ) ( not ( = ?auto_391823 ?auto_391830 ) ) ( not ( = ?auto_391824 ?auto_391825 ) ) ( not ( = ?auto_391821 ?auto_391826 ) ) ( not ( = ?auto_391821 ?auto_391828 ) ) ( not ( = ?auto_391821 ?auto_391830 ) ) ( not ( = ?auto_391825 ?auto_391827 ) ) ( not ( = ?auto_391825 ?auto_391832 ) ) ( not ( = ?auto_391825 ?auto_391831 ) ) ( not ( = ?auto_391826 ?auto_391828 ) ) ( not ( = ?auto_391826 ?auto_391830 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391831 ?auto_391830 ?auto_391827 ?auto_391828 )
      ( GET-4IMAGE-VERIFY ?auto_391822 ?auto_391823 ?auto_391824 ?auto_391821 ?auto_391825 ?auto_391826 ?auto_391827 ?auto_391828 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391900 - DIRECTION
      ?auto_391901 - MODE
      ?auto_391902 - DIRECTION
      ?auto_391899 - MODE
      ?auto_391903 - DIRECTION
      ?auto_391904 - MODE
      ?auto_391905 - DIRECTION
      ?auto_391906 - MODE
    )
    :vars
    (
      ?auto_391907 - INSTRUMENT
      ?auto_391910 - SATELLITE
      ?auto_391909 - DIRECTION
      ?auto_391908 - DIRECTION
      ?auto_391911 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391907 ?auto_391910 ) ( SUPPORTS ?auto_391907 ?auto_391899 ) ( not ( = ?auto_391902 ?auto_391909 ) ) ( HAVE_IMAGE ?auto_391905 ?auto_391904 ) ( not ( = ?auto_391905 ?auto_391902 ) ) ( not ( = ?auto_391905 ?auto_391909 ) ) ( not ( = ?auto_391904 ?auto_391899 ) ) ( CALIBRATION_TARGET ?auto_391907 ?auto_391909 ) ( POINTING ?auto_391910 ?auto_391908 ) ( not ( = ?auto_391909 ?auto_391908 ) ) ( not ( = ?auto_391902 ?auto_391908 ) ) ( not ( = ?auto_391905 ?auto_391908 ) ) ( ON_BOARD ?auto_391911 ?auto_391910 ) ( POWER_ON ?auto_391911 ) ( not ( = ?auto_391907 ?auto_391911 ) ) ( HAVE_IMAGE ?auto_391900 ?auto_391901 ) ( HAVE_IMAGE ?auto_391903 ?auto_391904 ) ( HAVE_IMAGE ?auto_391905 ?auto_391906 ) ( not ( = ?auto_391900 ?auto_391902 ) ) ( not ( = ?auto_391900 ?auto_391903 ) ) ( not ( = ?auto_391900 ?auto_391905 ) ) ( not ( = ?auto_391900 ?auto_391909 ) ) ( not ( = ?auto_391900 ?auto_391908 ) ) ( not ( = ?auto_391901 ?auto_391899 ) ) ( not ( = ?auto_391901 ?auto_391904 ) ) ( not ( = ?auto_391901 ?auto_391906 ) ) ( not ( = ?auto_391902 ?auto_391903 ) ) ( not ( = ?auto_391899 ?auto_391906 ) ) ( not ( = ?auto_391903 ?auto_391905 ) ) ( not ( = ?auto_391903 ?auto_391909 ) ) ( not ( = ?auto_391903 ?auto_391908 ) ) ( not ( = ?auto_391904 ?auto_391906 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391905 ?auto_391904 ?auto_391902 ?auto_391899 )
      ( GET-4IMAGE-VERIFY ?auto_391900 ?auto_391901 ?auto_391902 ?auto_391899 ?auto_391903 ?auto_391904 ?auto_391905 ?auto_391906 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391947 - DIRECTION
      ?auto_391948 - MODE
      ?auto_391949 - DIRECTION
      ?auto_391946 - MODE
      ?auto_391950 - DIRECTION
      ?auto_391951 - MODE
      ?auto_391952 - DIRECTION
      ?auto_391953 - MODE
    )
    :vars
    (
      ?auto_391954 - INSTRUMENT
      ?auto_391957 - SATELLITE
      ?auto_391956 - DIRECTION
      ?auto_391955 - DIRECTION
      ?auto_391958 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391954 ?auto_391957 ) ( SUPPORTS ?auto_391954 ?auto_391946 ) ( not ( = ?auto_391949 ?auto_391956 ) ) ( HAVE_IMAGE ?auto_391952 ?auto_391953 ) ( not ( = ?auto_391952 ?auto_391949 ) ) ( not ( = ?auto_391952 ?auto_391956 ) ) ( not ( = ?auto_391953 ?auto_391946 ) ) ( CALIBRATION_TARGET ?auto_391954 ?auto_391956 ) ( POINTING ?auto_391957 ?auto_391955 ) ( not ( = ?auto_391956 ?auto_391955 ) ) ( not ( = ?auto_391949 ?auto_391955 ) ) ( not ( = ?auto_391952 ?auto_391955 ) ) ( ON_BOARD ?auto_391958 ?auto_391957 ) ( POWER_ON ?auto_391958 ) ( not ( = ?auto_391954 ?auto_391958 ) ) ( HAVE_IMAGE ?auto_391947 ?auto_391948 ) ( HAVE_IMAGE ?auto_391950 ?auto_391951 ) ( not ( = ?auto_391947 ?auto_391949 ) ) ( not ( = ?auto_391947 ?auto_391950 ) ) ( not ( = ?auto_391947 ?auto_391952 ) ) ( not ( = ?auto_391947 ?auto_391956 ) ) ( not ( = ?auto_391947 ?auto_391955 ) ) ( not ( = ?auto_391948 ?auto_391946 ) ) ( not ( = ?auto_391948 ?auto_391951 ) ) ( not ( = ?auto_391948 ?auto_391953 ) ) ( not ( = ?auto_391949 ?auto_391950 ) ) ( not ( = ?auto_391946 ?auto_391951 ) ) ( not ( = ?auto_391950 ?auto_391952 ) ) ( not ( = ?auto_391950 ?auto_391956 ) ) ( not ( = ?auto_391950 ?auto_391955 ) ) ( not ( = ?auto_391951 ?auto_391953 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391952 ?auto_391953 ?auto_391949 ?auto_391946 )
      ( GET-4IMAGE-VERIFY ?auto_391947 ?auto_391948 ?auto_391949 ?auto_391946 ?auto_391950 ?auto_391951 ?auto_391952 ?auto_391953 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391960 - DIRECTION
      ?auto_391961 - MODE
      ?auto_391962 - DIRECTION
      ?auto_391959 - MODE
      ?auto_391963 - DIRECTION
      ?auto_391964 - MODE
      ?auto_391965 - DIRECTION
      ?auto_391966 - MODE
    )
    :vars
    (
      ?auto_391967 - INSTRUMENT
      ?auto_391972 - SATELLITE
      ?auto_391971 - DIRECTION
      ?auto_391970 - DIRECTION
      ?auto_391969 - MODE
      ?auto_391968 - DIRECTION
      ?auto_391973 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391967 ?auto_391972 ) ( SUPPORTS ?auto_391967 ?auto_391959 ) ( not ( = ?auto_391962 ?auto_391971 ) ) ( HAVE_IMAGE ?auto_391970 ?auto_391969 ) ( not ( = ?auto_391970 ?auto_391962 ) ) ( not ( = ?auto_391970 ?auto_391971 ) ) ( not ( = ?auto_391969 ?auto_391959 ) ) ( CALIBRATION_TARGET ?auto_391967 ?auto_391971 ) ( POINTING ?auto_391972 ?auto_391968 ) ( not ( = ?auto_391971 ?auto_391968 ) ) ( not ( = ?auto_391962 ?auto_391968 ) ) ( not ( = ?auto_391970 ?auto_391968 ) ) ( ON_BOARD ?auto_391973 ?auto_391972 ) ( POWER_ON ?auto_391973 ) ( not ( = ?auto_391967 ?auto_391973 ) ) ( HAVE_IMAGE ?auto_391960 ?auto_391961 ) ( HAVE_IMAGE ?auto_391963 ?auto_391964 ) ( HAVE_IMAGE ?auto_391965 ?auto_391966 ) ( not ( = ?auto_391960 ?auto_391962 ) ) ( not ( = ?auto_391960 ?auto_391963 ) ) ( not ( = ?auto_391960 ?auto_391965 ) ) ( not ( = ?auto_391960 ?auto_391971 ) ) ( not ( = ?auto_391960 ?auto_391970 ) ) ( not ( = ?auto_391960 ?auto_391968 ) ) ( not ( = ?auto_391961 ?auto_391959 ) ) ( not ( = ?auto_391961 ?auto_391964 ) ) ( not ( = ?auto_391961 ?auto_391966 ) ) ( not ( = ?auto_391961 ?auto_391969 ) ) ( not ( = ?auto_391962 ?auto_391963 ) ) ( not ( = ?auto_391962 ?auto_391965 ) ) ( not ( = ?auto_391959 ?auto_391964 ) ) ( not ( = ?auto_391959 ?auto_391966 ) ) ( not ( = ?auto_391963 ?auto_391965 ) ) ( not ( = ?auto_391963 ?auto_391971 ) ) ( not ( = ?auto_391963 ?auto_391970 ) ) ( not ( = ?auto_391963 ?auto_391968 ) ) ( not ( = ?auto_391964 ?auto_391966 ) ) ( not ( = ?auto_391964 ?auto_391969 ) ) ( not ( = ?auto_391965 ?auto_391971 ) ) ( not ( = ?auto_391965 ?auto_391970 ) ) ( not ( = ?auto_391965 ?auto_391968 ) ) ( not ( = ?auto_391966 ?auto_391969 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391970 ?auto_391969 ?auto_391962 ?auto_391959 )
      ( GET-4IMAGE-VERIFY ?auto_391960 ?auto_391961 ?auto_391962 ?auto_391959 ?auto_391963 ?auto_391964 ?auto_391965 ?auto_391966 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_391975 - DIRECTION
      ?auto_391976 - MODE
      ?auto_391977 - DIRECTION
      ?auto_391974 - MODE
      ?auto_391978 - DIRECTION
      ?auto_391979 - MODE
      ?auto_391980 - DIRECTION
      ?auto_391981 - MODE
    )
    :vars
    (
      ?auto_391982 - INSTRUMENT
      ?auto_391986 - SATELLITE
      ?auto_391985 - DIRECTION
      ?auto_391984 - DIRECTION
      ?auto_391983 - MODE
      ?auto_391987 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_391982 ?auto_391986 ) ( SUPPORTS ?auto_391982 ?auto_391974 ) ( not ( = ?auto_391977 ?auto_391985 ) ) ( HAVE_IMAGE ?auto_391984 ?auto_391983 ) ( not ( = ?auto_391984 ?auto_391977 ) ) ( not ( = ?auto_391984 ?auto_391985 ) ) ( not ( = ?auto_391983 ?auto_391974 ) ) ( CALIBRATION_TARGET ?auto_391982 ?auto_391985 ) ( POINTING ?auto_391986 ?auto_391980 ) ( not ( = ?auto_391985 ?auto_391980 ) ) ( not ( = ?auto_391977 ?auto_391980 ) ) ( not ( = ?auto_391984 ?auto_391980 ) ) ( ON_BOARD ?auto_391987 ?auto_391986 ) ( POWER_ON ?auto_391987 ) ( not ( = ?auto_391982 ?auto_391987 ) ) ( HAVE_IMAGE ?auto_391975 ?auto_391976 ) ( HAVE_IMAGE ?auto_391978 ?auto_391979 ) ( HAVE_IMAGE ?auto_391980 ?auto_391981 ) ( not ( = ?auto_391975 ?auto_391977 ) ) ( not ( = ?auto_391975 ?auto_391978 ) ) ( not ( = ?auto_391975 ?auto_391980 ) ) ( not ( = ?auto_391975 ?auto_391985 ) ) ( not ( = ?auto_391975 ?auto_391984 ) ) ( not ( = ?auto_391976 ?auto_391974 ) ) ( not ( = ?auto_391976 ?auto_391979 ) ) ( not ( = ?auto_391976 ?auto_391981 ) ) ( not ( = ?auto_391976 ?auto_391983 ) ) ( not ( = ?auto_391977 ?auto_391978 ) ) ( not ( = ?auto_391974 ?auto_391979 ) ) ( not ( = ?auto_391974 ?auto_391981 ) ) ( not ( = ?auto_391978 ?auto_391980 ) ) ( not ( = ?auto_391978 ?auto_391985 ) ) ( not ( = ?auto_391978 ?auto_391984 ) ) ( not ( = ?auto_391979 ?auto_391981 ) ) ( not ( = ?auto_391979 ?auto_391983 ) ) ( not ( = ?auto_391981 ?auto_391983 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_391984 ?auto_391983 ?auto_391977 ?auto_391974 )
      ( GET-4IMAGE-VERIFY ?auto_391975 ?auto_391976 ?auto_391977 ?auto_391974 ?auto_391978 ?auto_391979 ?auto_391980 ?auto_391981 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392111 - DIRECTION
      ?auto_392112 - MODE
      ?auto_392113 - DIRECTION
      ?auto_392110 - MODE
      ?auto_392114 - DIRECTION
      ?auto_392115 - MODE
      ?auto_392116 - DIRECTION
      ?auto_392117 - MODE
    )
    :vars
    (
      ?auto_392118 - INSTRUMENT
      ?auto_392120 - SATELLITE
      ?auto_392119 - DIRECTION
      ?auto_392121 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_392118 ?auto_392120 ) ( SUPPORTS ?auto_392118 ?auto_392117 ) ( not ( = ?auto_392116 ?auto_392119 ) ) ( HAVE_IMAGE ?auto_392113 ?auto_392115 ) ( not ( = ?auto_392113 ?auto_392116 ) ) ( not ( = ?auto_392113 ?auto_392119 ) ) ( not ( = ?auto_392115 ?auto_392117 ) ) ( CALIBRATION_TARGET ?auto_392118 ?auto_392119 ) ( POINTING ?auto_392120 ?auto_392111 ) ( not ( = ?auto_392119 ?auto_392111 ) ) ( not ( = ?auto_392116 ?auto_392111 ) ) ( not ( = ?auto_392113 ?auto_392111 ) ) ( ON_BOARD ?auto_392121 ?auto_392120 ) ( POWER_ON ?auto_392121 ) ( not ( = ?auto_392118 ?auto_392121 ) ) ( HAVE_IMAGE ?auto_392111 ?auto_392112 ) ( HAVE_IMAGE ?auto_392113 ?auto_392110 ) ( HAVE_IMAGE ?auto_392114 ?auto_392115 ) ( not ( = ?auto_392111 ?auto_392114 ) ) ( not ( = ?auto_392112 ?auto_392110 ) ) ( not ( = ?auto_392112 ?auto_392115 ) ) ( not ( = ?auto_392112 ?auto_392117 ) ) ( not ( = ?auto_392113 ?auto_392114 ) ) ( not ( = ?auto_392110 ?auto_392115 ) ) ( not ( = ?auto_392110 ?auto_392117 ) ) ( not ( = ?auto_392114 ?auto_392116 ) ) ( not ( = ?auto_392114 ?auto_392119 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392113 ?auto_392115 ?auto_392116 ?auto_392117 )
      ( GET-4IMAGE-VERIFY ?auto_392111 ?auto_392112 ?auto_392113 ?auto_392110 ?auto_392114 ?auto_392115 ?auto_392116 ?auto_392117 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392203 - DIRECTION
      ?auto_392204 - MODE
      ?auto_392205 - DIRECTION
      ?auto_392202 - MODE
      ?auto_392206 - DIRECTION
      ?auto_392207 - MODE
      ?auto_392208 - DIRECTION
      ?auto_392209 - MODE
    )
    :vars
    (
      ?auto_392210 - INSTRUMENT
      ?auto_392214 - SATELLITE
      ?auto_392213 - DIRECTION
      ?auto_392212 - DIRECTION
      ?auto_392211 - MODE
      ?auto_392215 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_392210 ?auto_392214 ) ( SUPPORTS ?auto_392210 ?auto_392209 ) ( not ( = ?auto_392208 ?auto_392213 ) ) ( HAVE_IMAGE ?auto_392212 ?auto_392211 ) ( not ( = ?auto_392212 ?auto_392208 ) ) ( not ( = ?auto_392212 ?auto_392213 ) ) ( not ( = ?auto_392211 ?auto_392209 ) ) ( CALIBRATION_TARGET ?auto_392210 ?auto_392213 ) ( POINTING ?auto_392214 ?auto_392203 ) ( not ( = ?auto_392213 ?auto_392203 ) ) ( not ( = ?auto_392208 ?auto_392203 ) ) ( not ( = ?auto_392212 ?auto_392203 ) ) ( ON_BOARD ?auto_392215 ?auto_392214 ) ( POWER_ON ?auto_392215 ) ( not ( = ?auto_392210 ?auto_392215 ) ) ( HAVE_IMAGE ?auto_392203 ?auto_392204 ) ( HAVE_IMAGE ?auto_392205 ?auto_392202 ) ( HAVE_IMAGE ?auto_392206 ?auto_392207 ) ( not ( = ?auto_392203 ?auto_392205 ) ) ( not ( = ?auto_392203 ?auto_392206 ) ) ( not ( = ?auto_392204 ?auto_392202 ) ) ( not ( = ?auto_392204 ?auto_392207 ) ) ( not ( = ?auto_392204 ?auto_392209 ) ) ( not ( = ?auto_392204 ?auto_392211 ) ) ( not ( = ?auto_392205 ?auto_392206 ) ) ( not ( = ?auto_392205 ?auto_392208 ) ) ( not ( = ?auto_392205 ?auto_392213 ) ) ( not ( = ?auto_392205 ?auto_392212 ) ) ( not ( = ?auto_392202 ?auto_392207 ) ) ( not ( = ?auto_392202 ?auto_392209 ) ) ( not ( = ?auto_392202 ?auto_392211 ) ) ( not ( = ?auto_392206 ?auto_392208 ) ) ( not ( = ?auto_392206 ?auto_392213 ) ) ( not ( = ?auto_392206 ?auto_392212 ) ) ( not ( = ?auto_392207 ?auto_392209 ) ) ( not ( = ?auto_392207 ?auto_392211 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392212 ?auto_392211 ?auto_392208 ?auto_392209 )
      ( GET-4IMAGE-VERIFY ?auto_392203 ?auto_392204 ?auto_392205 ?auto_392202 ?auto_392206 ?auto_392207 ?auto_392208 ?auto_392209 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392239 - DIRECTION
      ?auto_392240 - MODE
      ?auto_392241 - DIRECTION
      ?auto_392238 - MODE
      ?auto_392242 - DIRECTION
      ?auto_392243 - MODE
      ?auto_392244 - DIRECTION
      ?auto_392245 - MODE
    )
    :vars
    (
      ?auto_392246 - INSTRUMENT
      ?auto_392250 - SATELLITE
      ?auto_392249 - DIRECTION
      ?auto_392248 - DIRECTION
      ?auto_392247 - MODE
      ?auto_392251 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_392246 ?auto_392250 ) ( SUPPORTS ?auto_392246 ?auto_392243 ) ( not ( = ?auto_392242 ?auto_392249 ) ) ( HAVE_IMAGE ?auto_392248 ?auto_392247 ) ( not ( = ?auto_392248 ?auto_392242 ) ) ( not ( = ?auto_392248 ?auto_392249 ) ) ( not ( = ?auto_392247 ?auto_392243 ) ) ( CALIBRATION_TARGET ?auto_392246 ?auto_392249 ) ( POINTING ?auto_392250 ?auto_392239 ) ( not ( = ?auto_392249 ?auto_392239 ) ) ( not ( = ?auto_392242 ?auto_392239 ) ) ( not ( = ?auto_392248 ?auto_392239 ) ) ( ON_BOARD ?auto_392251 ?auto_392250 ) ( POWER_ON ?auto_392251 ) ( not ( = ?auto_392246 ?auto_392251 ) ) ( HAVE_IMAGE ?auto_392239 ?auto_392240 ) ( HAVE_IMAGE ?auto_392241 ?auto_392238 ) ( HAVE_IMAGE ?auto_392244 ?auto_392245 ) ( not ( = ?auto_392239 ?auto_392241 ) ) ( not ( = ?auto_392239 ?auto_392244 ) ) ( not ( = ?auto_392240 ?auto_392238 ) ) ( not ( = ?auto_392240 ?auto_392243 ) ) ( not ( = ?auto_392240 ?auto_392245 ) ) ( not ( = ?auto_392240 ?auto_392247 ) ) ( not ( = ?auto_392241 ?auto_392242 ) ) ( not ( = ?auto_392241 ?auto_392244 ) ) ( not ( = ?auto_392241 ?auto_392249 ) ) ( not ( = ?auto_392241 ?auto_392248 ) ) ( not ( = ?auto_392238 ?auto_392243 ) ) ( not ( = ?auto_392238 ?auto_392245 ) ) ( not ( = ?auto_392238 ?auto_392247 ) ) ( not ( = ?auto_392242 ?auto_392244 ) ) ( not ( = ?auto_392243 ?auto_392245 ) ) ( not ( = ?auto_392244 ?auto_392249 ) ) ( not ( = ?auto_392244 ?auto_392248 ) ) ( not ( = ?auto_392245 ?auto_392247 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392248 ?auto_392247 ?auto_392242 ?auto_392243 )
      ( GET-4IMAGE-VERIFY ?auto_392239 ?auto_392240 ?auto_392241 ?auto_392238 ?auto_392242 ?auto_392243 ?auto_392244 ?auto_392245 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392321 - DIRECTION
      ?auto_392322 - MODE
      ?auto_392323 - DIRECTION
      ?auto_392320 - MODE
      ?auto_392324 - DIRECTION
      ?auto_392325 - MODE
      ?auto_392326 - DIRECTION
      ?auto_392327 - MODE
    )
    :vars
    (
      ?auto_392328 - INSTRUMENT
      ?auto_392330 - SATELLITE
      ?auto_392329 - DIRECTION
      ?auto_392331 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_392328 ?auto_392330 ) ( SUPPORTS ?auto_392328 ?auto_392325 ) ( not ( = ?auto_392324 ?auto_392329 ) ) ( HAVE_IMAGE ?auto_392326 ?auto_392327 ) ( not ( = ?auto_392326 ?auto_392324 ) ) ( not ( = ?auto_392326 ?auto_392329 ) ) ( not ( = ?auto_392327 ?auto_392325 ) ) ( CALIBRATION_TARGET ?auto_392328 ?auto_392329 ) ( POINTING ?auto_392330 ?auto_392323 ) ( not ( = ?auto_392329 ?auto_392323 ) ) ( not ( = ?auto_392324 ?auto_392323 ) ) ( not ( = ?auto_392326 ?auto_392323 ) ) ( ON_BOARD ?auto_392331 ?auto_392330 ) ( POWER_ON ?auto_392331 ) ( not ( = ?auto_392328 ?auto_392331 ) ) ( HAVE_IMAGE ?auto_392321 ?auto_392322 ) ( HAVE_IMAGE ?auto_392323 ?auto_392320 ) ( not ( = ?auto_392321 ?auto_392323 ) ) ( not ( = ?auto_392321 ?auto_392324 ) ) ( not ( = ?auto_392321 ?auto_392326 ) ) ( not ( = ?auto_392321 ?auto_392329 ) ) ( not ( = ?auto_392322 ?auto_392320 ) ) ( not ( = ?auto_392322 ?auto_392325 ) ) ( not ( = ?auto_392322 ?auto_392327 ) ) ( not ( = ?auto_392320 ?auto_392325 ) ) ( not ( = ?auto_392320 ?auto_392327 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392326 ?auto_392327 ?auto_392324 ?auto_392325 )
      ( GET-4IMAGE-VERIFY ?auto_392321 ?auto_392322 ?auto_392323 ?auto_392320 ?auto_392324 ?auto_392325 ?auto_392326 ?auto_392327 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392431 - DIRECTION
      ?auto_392432 - MODE
      ?auto_392433 - DIRECTION
      ?auto_392430 - MODE
      ?auto_392434 - DIRECTION
      ?auto_392435 - MODE
      ?auto_392436 - DIRECTION
      ?auto_392437 - MODE
    )
    :vars
    (
      ?auto_392438 - INSTRUMENT
      ?auto_392442 - SATELLITE
      ?auto_392441 - DIRECTION
      ?auto_392440 - DIRECTION
      ?auto_392439 - MODE
      ?auto_392443 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_392438 ?auto_392442 ) ( SUPPORTS ?auto_392438 ?auto_392430 ) ( not ( = ?auto_392433 ?auto_392441 ) ) ( HAVE_IMAGE ?auto_392440 ?auto_392439 ) ( not ( = ?auto_392440 ?auto_392433 ) ) ( not ( = ?auto_392440 ?auto_392441 ) ) ( not ( = ?auto_392439 ?auto_392430 ) ) ( CALIBRATION_TARGET ?auto_392438 ?auto_392441 ) ( POINTING ?auto_392442 ?auto_392431 ) ( not ( = ?auto_392441 ?auto_392431 ) ) ( not ( = ?auto_392433 ?auto_392431 ) ) ( not ( = ?auto_392440 ?auto_392431 ) ) ( ON_BOARD ?auto_392443 ?auto_392442 ) ( POWER_ON ?auto_392443 ) ( not ( = ?auto_392438 ?auto_392443 ) ) ( HAVE_IMAGE ?auto_392431 ?auto_392432 ) ( HAVE_IMAGE ?auto_392434 ?auto_392435 ) ( HAVE_IMAGE ?auto_392436 ?auto_392437 ) ( not ( = ?auto_392431 ?auto_392434 ) ) ( not ( = ?auto_392431 ?auto_392436 ) ) ( not ( = ?auto_392432 ?auto_392430 ) ) ( not ( = ?auto_392432 ?auto_392435 ) ) ( not ( = ?auto_392432 ?auto_392437 ) ) ( not ( = ?auto_392432 ?auto_392439 ) ) ( not ( = ?auto_392433 ?auto_392434 ) ) ( not ( = ?auto_392433 ?auto_392436 ) ) ( not ( = ?auto_392430 ?auto_392435 ) ) ( not ( = ?auto_392430 ?auto_392437 ) ) ( not ( = ?auto_392434 ?auto_392436 ) ) ( not ( = ?auto_392434 ?auto_392441 ) ) ( not ( = ?auto_392434 ?auto_392440 ) ) ( not ( = ?auto_392435 ?auto_392437 ) ) ( not ( = ?auto_392435 ?auto_392439 ) ) ( not ( = ?auto_392436 ?auto_392441 ) ) ( not ( = ?auto_392436 ?auto_392440 ) ) ( not ( = ?auto_392437 ?auto_392439 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392440 ?auto_392439 ?auto_392433 ?auto_392430 )
      ( GET-4IMAGE-VERIFY ?auto_392431 ?auto_392432 ?auto_392433 ?auto_392430 ?auto_392434 ?auto_392435 ?auto_392436 ?auto_392437 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392581 - DIRECTION
      ?auto_392582 - MODE
      ?auto_392583 - DIRECTION
      ?auto_392580 - MODE
      ?auto_392584 - DIRECTION
      ?auto_392585 - MODE
      ?auto_392586 - DIRECTION
      ?auto_392587 - MODE
    )
    :vars
    (
      ?auto_392588 - INSTRUMENT
      ?auto_392591 - SATELLITE
      ?auto_392590 - DIRECTION
      ?auto_392589 - DIRECTION
      ?auto_392592 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_392588 ?auto_392591 ) ( SUPPORTS ?auto_392588 ?auto_392582 ) ( not ( = ?auto_392581 ?auto_392590 ) ) ( HAVE_IMAGE ?auto_392586 ?auto_392580 ) ( not ( = ?auto_392586 ?auto_392581 ) ) ( not ( = ?auto_392586 ?auto_392590 ) ) ( not ( = ?auto_392580 ?auto_392582 ) ) ( CALIBRATION_TARGET ?auto_392588 ?auto_392590 ) ( POINTING ?auto_392591 ?auto_392589 ) ( not ( = ?auto_392590 ?auto_392589 ) ) ( not ( = ?auto_392581 ?auto_392589 ) ) ( not ( = ?auto_392586 ?auto_392589 ) ) ( ON_BOARD ?auto_392592 ?auto_392591 ) ( POWER_ON ?auto_392592 ) ( not ( = ?auto_392588 ?auto_392592 ) ) ( HAVE_IMAGE ?auto_392583 ?auto_392580 ) ( HAVE_IMAGE ?auto_392584 ?auto_392585 ) ( HAVE_IMAGE ?auto_392586 ?auto_392587 ) ( not ( = ?auto_392581 ?auto_392583 ) ) ( not ( = ?auto_392581 ?auto_392584 ) ) ( not ( = ?auto_392582 ?auto_392585 ) ) ( not ( = ?auto_392582 ?auto_392587 ) ) ( not ( = ?auto_392583 ?auto_392584 ) ) ( not ( = ?auto_392583 ?auto_392586 ) ) ( not ( = ?auto_392583 ?auto_392590 ) ) ( not ( = ?auto_392583 ?auto_392589 ) ) ( not ( = ?auto_392580 ?auto_392585 ) ) ( not ( = ?auto_392580 ?auto_392587 ) ) ( not ( = ?auto_392584 ?auto_392586 ) ) ( not ( = ?auto_392584 ?auto_392590 ) ) ( not ( = ?auto_392584 ?auto_392589 ) ) ( not ( = ?auto_392585 ?auto_392587 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392586 ?auto_392580 ?auto_392581 ?auto_392582 )
      ( GET-4IMAGE-VERIFY ?auto_392581 ?auto_392582 ?auto_392583 ?auto_392580 ?auto_392584 ?auto_392585 ?auto_392586 ?auto_392587 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392607 - DIRECTION
      ?auto_392608 - MODE
      ?auto_392609 - DIRECTION
      ?auto_392606 - MODE
      ?auto_392610 - DIRECTION
      ?auto_392611 - MODE
      ?auto_392612 - DIRECTION
      ?auto_392613 - MODE
    )
    :vars
    (
      ?auto_392614 - INSTRUMENT
      ?auto_392616 - SATELLITE
      ?auto_392615 - DIRECTION
      ?auto_392617 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_392614 ?auto_392616 ) ( SUPPORTS ?auto_392614 ?auto_392608 ) ( not ( = ?auto_392607 ?auto_392615 ) ) ( HAVE_IMAGE ?auto_392609 ?auto_392606 ) ( not ( = ?auto_392609 ?auto_392607 ) ) ( not ( = ?auto_392609 ?auto_392615 ) ) ( not ( = ?auto_392606 ?auto_392608 ) ) ( CALIBRATION_TARGET ?auto_392614 ?auto_392615 ) ( POINTING ?auto_392616 ?auto_392612 ) ( not ( = ?auto_392615 ?auto_392612 ) ) ( not ( = ?auto_392607 ?auto_392612 ) ) ( not ( = ?auto_392609 ?auto_392612 ) ) ( ON_BOARD ?auto_392617 ?auto_392616 ) ( POWER_ON ?auto_392617 ) ( not ( = ?auto_392614 ?auto_392617 ) ) ( HAVE_IMAGE ?auto_392610 ?auto_392611 ) ( HAVE_IMAGE ?auto_392612 ?auto_392613 ) ( not ( = ?auto_392607 ?auto_392610 ) ) ( not ( = ?auto_392608 ?auto_392611 ) ) ( not ( = ?auto_392608 ?auto_392613 ) ) ( not ( = ?auto_392609 ?auto_392610 ) ) ( not ( = ?auto_392606 ?auto_392611 ) ) ( not ( = ?auto_392606 ?auto_392613 ) ) ( not ( = ?auto_392610 ?auto_392612 ) ) ( not ( = ?auto_392610 ?auto_392615 ) ) ( not ( = ?auto_392611 ?auto_392613 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392609 ?auto_392606 ?auto_392607 ?auto_392608 )
      ( GET-4IMAGE-VERIFY ?auto_392607 ?auto_392608 ?auto_392609 ?auto_392606 ?auto_392610 ?auto_392611 ?auto_392612 ?auto_392613 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392632 - DIRECTION
      ?auto_392633 - MODE
      ?auto_392634 - DIRECTION
      ?auto_392631 - MODE
      ?auto_392635 - DIRECTION
      ?auto_392636 - MODE
      ?auto_392637 - DIRECTION
      ?auto_392638 - MODE
    )
    :vars
    (
      ?auto_392639 - INSTRUMENT
      ?auto_392642 - SATELLITE
      ?auto_392641 - DIRECTION
      ?auto_392640 - DIRECTION
      ?auto_392643 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_392639 ?auto_392642 ) ( SUPPORTS ?auto_392639 ?auto_392633 ) ( not ( = ?auto_392632 ?auto_392641 ) ) ( HAVE_IMAGE ?auto_392637 ?auto_392638 ) ( not ( = ?auto_392637 ?auto_392632 ) ) ( not ( = ?auto_392637 ?auto_392641 ) ) ( not ( = ?auto_392638 ?auto_392633 ) ) ( CALIBRATION_TARGET ?auto_392639 ?auto_392641 ) ( POINTING ?auto_392642 ?auto_392640 ) ( not ( = ?auto_392641 ?auto_392640 ) ) ( not ( = ?auto_392632 ?auto_392640 ) ) ( not ( = ?auto_392637 ?auto_392640 ) ) ( ON_BOARD ?auto_392643 ?auto_392642 ) ( POWER_ON ?auto_392643 ) ( not ( = ?auto_392639 ?auto_392643 ) ) ( HAVE_IMAGE ?auto_392634 ?auto_392631 ) ( HAVE_IMAGE ?auto_392635 ?auto_392636 ) ( not ( = ?auto_392632 ?auto_392634 ) ) ( not ( = ?auto_392632 ?auto_392635 ) ) ( not ( = ?auto_392633 ?auto_392631 ) ) ( not ( = ?auto_392633 ?auto_392636 ) ) ( not ( = ?auto_392634 ?auto_392635 ) ) ( not ( = ?auto_392634 ?auto_392637 ) ) ( not ( = ?auto_392634 ?auto_392641 ) ) ( not ( = ?auto_392634 ?auto_392640 ) ) ( not ( = ?auto_392631 ?auto_392636 ) ) ( not ( = ?auto_392631 ?auto_392638 ) ) ( not ( = ?auto_392635 ?auto_392637 ) ) ( not ( = ?auto_392635 ?auto_392641 ) ) ( not ( = ?auto_392635 ?auto_392640 ) ) ( not ( = ?auto_392636 ?auto_392638 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392637 ?auto_392638 ?auto_392632 ?auto_392633 )
      ( GET-4IMAGE-VERIFY ?auto_392632 ?auto_392633 ?auto_392634 ?auto_392631 ?auto_392635 ?auto_392636 ?auto_392637 ?auto_392638 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392774 - DIRECTION
      ?auto_392775 - MODE
      ?auto_392776 - DIRECTION
      ?auto_392773 - MODE
      ?auto_392777 - DIRECTION
      ?auto_392778 - MODE
      ?auto_392779 - DIRECTION
      ?auto_392780 - MODE
    )
    :vars
    (
      ?auto_392781 - INSTRUMENT
      ?auto_392784 - SATELLITE
      ?auto_392783 - DIRECTION
      ?auto_392782 - DIRECTION
      ?auto_392785 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_392781 ?auto_392784 ) ( SUPPORTS ?auto_392781 ?auto_392775 ) ( not ( = ?auto_392774 ?auto_392783 ) ) ( HAVE_IMAGE ?auto_392777 ?auto_392778 ) ( not ( = ?auto_392777 ?auto_392774 ) ) ( not ( = ?auto_392777 ?auto_392783 ) ) ( not ( = ?auto_392778 ?auto_392775 ) ) ( CALIBRATION_TARGET ?auto_392781 ?auto_392783 ) ( POINTING ?auto_392784 ?auto_392782 ) ( not ( = ?auto_392783 ?auto_392782 ) ) ( not ( = ?auto_392774 ?auto_392782 ) ) ( not ( = ?auto_392777 ?auto_392782 ) ) ( ON_BOARD ?auto_392785 ?auto_392784 ) ( POWER_ON ?auto_392785 ) ( not ( = ?auto_392781 ?auto_392785 ) ) ( HAVE_IMAGE ?auto_392776 ?auto_392773 ) ( HAVE_IMAGE ?auto_392779 ?auto_392780 ) ( not ( = ?auto_392774 ?auto_392776 ) ) ( not ( = ?auto_392774 ?auto_392779 ) ) ( not ( = ?auto_392775 ?auto_392773 ) ) ( not ( = ?auto_392775 ?auto_392780 ) ) ( not ( = ?auto_392776 ?auto_392777 ) ) ( not ( = ?auto_392776 ?auto_392779 ) ) ( not ( = ?auto_392776 ?auto_392783 ) ) ( not ( = ?auto_392776 ?auto_392782 ) ) ( not ( = ?auto_392773 ?auto_392778 ) ) ( not ( = ?auto_392773 ?auto_392780 ) ) ( not ( = ?auto_392777 ?auto_392779 ) ) ( not ( = ?auto_392778 ?auto_392780 ) ) ( not ( = ?auto_392779 ?auto_392783 ) ) ( not ( = ?auto_392779 ?auto_392782 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392777 ?auto_392778 ?auto_392774 ?auto_392775 )
      ( GET-4IMAGE-VERIFY ?auto_392774 ?auto_392775 ?auto_392776 ?auto_392773 ?auto_392777 ?auto_392778 ?auto_392779 ?auto_392780 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392834 - DIRECTION
      ?auto_392835 - MODE
      ?auto_392836 - DIRECTION
      ?auto_392833 - MODE
      ?auto_392837 - DIRECTION
      ?auto_392838 - MODE
      ?auto_392839 - DIRECTION
      ?auto_392840 - MODE
    )
    :vars
    (
      ?auto_392841 - INSTRUMENT
      ?auto_392846 - SATELLITE
      ?auto_392845 - DIRECTION
      ?auto_392844 - DIRECTION
      ?auto_392843 - MODE
      ?auto_392842 - DIRECTION
      ?auto_392847 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_392841 ?auto_392846 ) ( SUPPORTS ?auto_392841 ?auto_392835 ) ( not ( = ?auto_392834 ?auto_392845 ) ) ( HAVE_IMAGE ?auto_392844 ?auto_392843 ) ( not ( = ?auto_392844 ?auto_392834 ) ) ( not ( = ?auto_392844 ?auto_392845 ) ) ( not ( = ?auto_392843 ?auto_392835 ) ) ( CALIBRATION_TARGET ?auto_392841 ?auto_392845 ) ( POINTING ?auto_392846 ?auto_392842 ) ( not ( = ?auto_392845 ?auto_392842 ) ) ( not ( = ?auto_392834 ?auto_392842 ) ) ( not ( = ?auto_392844 ?auto_392842 ) ) ( ON_BOARD ?auto_392847 ?auto_392846 ) ( POWER_ON ?auto_392847 ) ( not ( = ?auto_392841 ?auto_392847 ) ) ( HAVE_IMAGE ?auto_392836 ?auto_392833 ) ( HAVE_IMAGE ?auto_392837 ?auto_392838 ) ( HAVE_IMAGE ?auto_392839 ?auto_392840 ) ( not ( = ?auto_392834 ?auto_392836 ) ) ( not ( = ?auto_392834 ?auto_392837 ) ) ( not ( = ?auto_392834 ?auto_392839 ) ) ( not ( = ?auto_392835 ?auto_392833 ) ) ( not ( = ?auto_392835 ?auto_392838 ) ) ( not ( = ?auto_392835 ?auto_392840 ) ) ( not ( = ?auto_392836 ?auto_392837 ) ) ( not ( = ?auto_392836 ?auto_392839 ) ) ( not ( = ?auto_392836 ?auto_392845 ) ) ( not ( = ?auto_392836 ?auto_392844 ) ) ( not ( = ?auto_392836 ?auto_392842 ) ) ( not ( = ?auto_392833 ?auto_392838 ) ) ( not ( = ?auto_392833 ?auto_392840 ) ) ( not ( = ?auto_392833 ?auto_392843 ) ) ( not ( = ?auto_392837 ?auto_392839 ) ) ( not ( = ?auto_392837 ?auto_392845 ) ) ( not ( = ?auto_392837 ?auto_392844 ) ) ( not ( = ?auto_392837 ?auto_392842 ) ) ( not ( = ?auto_392838 ?auto_392840 ) ) ( not ( = ?auto_392838 ?auto_392843 ) ) ( not ( = ?auto_392839 ?auto_392845 ) ) ( not ( = ?auto_392839 ?auto_392844 ) ) ( not ( = ?auto_392839 ?auto_392842 ) ) ( not ( = ?auto_392840 ?auto_392843 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392844 ?auto_392843 ?auto_392834 ?auto_392835 )
      ( GET-4IMAGE-VERIFY ?auto_392834 ?auto_392835 ?auto_392836 ?auto_392833 ?auto_392837 ?auto_392838 ?auto_392839 ?auto_392840 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392849 - DIRECTION
      ?auto_392850 - MODE
      ?auto_392851 - DIRECTION
      ?auto_392848 - MODE
      ?auto_392852 - DIRECTION
      ?auto_392853 - MODE
      ?auto_392854 - DIRECTION
      ?auto_392855 - MODE
    )
    :vars
    (
      ?auto_392856 - INSTRUMENT
      ?auto_392860 - SATELLITE
      ?auto_392859 - DIRECTION
      ?auto_392858 - DIRECTION
      ?auto_392857 - MODE
      ?auto_392861 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_392856 ?auto_392860 ) ( SUPPORTS ?auto_392856 ?auto_392850 ) ( not ( = ?auto_392849 ?auto_392859 ) ) ( HAVE_IMAGE ?auto_392858 ?auto_392857 ) ( not ( = ?auto_392858 ?auto_392849 ) ) ( not ( = ?auto_392858 ?auto_392859 ) ) ( not ( = ?auto_392857 ?auto_392850 ) ) ( CALIBRATION_TARGET ?auto_392856 ?auto_392859 ) ( POINTING ?auto_392860 ?auto_392854 ) ( not ( = ?auto_392859 ?auto_392854 ) ) ( not ( = ?auto_392849 ?auto_392854 ) ) ( not ( = ?auto_392858 ?auto_392854 ) ) ( ON_BOARD ?auto_392861 ?auto_392860 ) ( POWER_ON ?auto_392861 ) ( not ( = ?auto_392856 ?auto_392861 ) ) ( HAVE_IMAGE ?auto_392851 ?auto_392848 ) ( HAVE_IMAGE ?auto_392852 ?auto_392853 ) ( HAVE_IMAGE ?auto_392854 ?auto_392855 ) ( not ( = ?auto_392849 ?auto_392851 ) ) ( not ( = ?auto_392849 ?auto_392852 ) ) ( not ( = ?auto_392850 ?auto_392848 ) ) ( not ( = ?auto_392850 ?auto_392853 ) ) ( not ( = ?auto_392850 ?auto_392855 ) ) ( not ( = ?auto_392851 ?auto_392852 ) ) ( not ( = ?auto_392851 ?auto_392854 ) ) ( not ( = ?auto_392851 ?auto_392859 ) ) ( not ( = ?auto_392851 ?auto_392858 ) ) ( not ( = ?auto_392848 ?auto_392853 ) ) ( not ( = ?auto_392848 ?auto_392855 ) ) ( not ( = ?auto_392848 ?auto_392857 ) ) ( not ( = ?auto_392852 ?auto_392854 ) ) ( not ( = ?auto_392852 ?auto_392859 ) ) ( not ( = ?auto_392852 ?auto_392858 ) ) ( not ( = ?auto_392853 ?auto_392855 ) ) ( not ( = ?auto_392853 ?auto_392857 ) ) ( not ( = ?auto_392855 ?auto_392857 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392858 ?auto_392857 ?auto_392849 ?auto_392850 )
      ( GET-4IMAGE-VERIFY ?auto_392849 ?auto_392850 ?auto_392851 ?auto_392848 ?auto_392852 ?auto_392853 ?auto_392854 ?auto_392855 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_392985 - DIRECTION
      ?auto_392986 - MODE
      ?auto_392987 - DIRECTION
      ?auto_392984 - MODE
      ?auto_392988 - DIRECTION
      ?auto_392989 - MODE
      ?auto_392990 - DIRECTION
      ?auto_392991 - MODE
    )
    :vars
    (
      ?auto_392992 - INSTRUMENT
      ?auto_392994 - SATELLITE
      ?auto_392993 - DIRECTION
      ?auto_392995 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_392992 ?auto_392994 ) ( SUPPORTS ?auto_392992 ?auto_392986 ) ( not ( = ?auto_392985 ?auto_392993 ) ) ( HAVE_IMAGE ?auto_392990 ?auto_392989 ) ( not ( = ?auto_392990 ?auto_392985 ) ) ( not ( = ?auto_392990 ?auto_392993 ) ) ( not ( = ?auto_392989 ?auto_392986 ) ) ( CALIBRATION_TARGET ?auto_392992 ?auto_392993 ) ( POINTING ?auto_392994 ?auto_392987 ) ( not ( = ?auto_392993 ?auto_392987 ) ) ( not ( = ?auto_392985 ?auto_392987 ) ) ( not ( = ?auto_392990 ?auto_392987 ) ) ( ON_BOARD ?auto_392995 ?auto_392994 ) ( POWER_ON ?auto_392995 ) ( not ( = ?auto_392992 ?auto_392995 ) ) ( HAVE_IMAGE ?auto_392987 ?auto_392984 ) ( HAVE_IMAGE ?auto_392988 ?auto_392989 ) ( HAVE_IMAGE ?auto_392990 ?auto_392991 ) ( not ( = ?auto_392985 ?auto_392988 ) ) ( not ( = ?auto_392986 ?auto_392984 ) ) ( not ( = ?auto_392986 ?auto_392991 ) ) ( not ( = ?auto_392987 ?auto_392988 ) ) ( not ( = ?auto_392984 ?auto_392989 ) ) ( not ( = ?auto_392984 ?auto_392991 ) ) ( not ( = ?auto_392988 ?auto_392990 ) ) ( not ( = ?auto_392988 ?auto_392993 ) ) ( not ( = ?auto_392989 ?auto_392991 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_392990 ?auto_392989 ?auto_392985 ?auto_392986 )
      ( GET-4IMAGE-VERIFY ?auto_392985 ?auto_392986 ?auto_392987 ?auto_392984 ?auto_392988 ?auto_392989 ?auto_392990 ?auto_392991 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_393041 - DIRECTION
      ?auto_393042 - MODE
      ?auto_393043 - DIRECTION
      ?auto_393040 - MODE
      ?auto_393044 - DIRECTION
      ?auto_393045 - MODE
      ?auto_393046 - DIRECTION
      ?auto_393047 - MODE
    )
    :vars
    (
      ?auto_393048 - INSTRUMENT
      ?auto_393052 - SATELLITE
      ?auto_393051 - DIRECTION
      ?auto_393050 - DIRECTION
      ?auto_393049 - MODE
      ?auto_393053 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_393048 ?auto_393052 ) ( SUPPORTS ?auto_393048 ?auto_393042 ) ( not ( = ?auto_393041 ?auto_393051 ) ) ( HAVE_IMAGE ?auto_393050 ?auto_393049 ) ( not ( = ?auto_393050 ?auto_393041 ) ) ( not ( = ?auto_393050 ?auto_393051 ) ) ( not ( = ?auto_393049 ?auto_393042 ) ) ( CALIBRATION_TARGET ?auto_393048 ?auto_393051 ) ( POINTING ?auto_393052 ?auto_393043 ) ( not ( = ?auto_393051 ?auto_393043 ) ) ( not ( = ?auto_393041 ?auto_393043 ) ) ( not ( = ?auto_393050 ?auto_393043 ) ) ( ON_BOARD ?auto_393053 ?auto_393052 ) ( POWER_ON ?auto_393053 ) ( not ( = ?auto_393048 ?auto_393053 ) ) ( HAVE_IMAGE ?auto_393043 ?auto_393040 ) ( HAVE_IMAGE ?auto_393044 ?auto_393045 ) ( HAVE_IMAGE ?auto_393046 ?auto_393047 ) ( not ( = ?auto_393041 ?auto_393044 ) ) ( not ( = ?auto_393041 ?auto_393046 ) ) ( not ( = ?auto_393042 ?auto_393040 ) ) ( not ( = ?auto_393042 ?auto_393045 ) ) ( not ( = ?auto_393042 ?auto_393047 ) ) ( not ( = ?auto_393043 ?auto_393044 ) ) ( not ( = ?auto_393043 ?auto_393046 ) ) ( not ( = ?auto_393040 ?auto_393045 ) ) ( not ( = ?auto_393040 ?auto_393047 ) ) ( not ( = ?auto_393040 ?auto_393049 ) ) ( not ( = ?auto_393044 ?auto_393046 ) ) ( not ( = ?auto_393044 ?auto_393051 ) ) ( not ( = ?auto_393044 ?auto_393050 ) ) ( not ( = ?auto_393045 ?auto_393047 ) ) ( not ( = ?auto_393045 ?auto_393049 ) ) ( not ( = ?auto_393046 ?auto_393051 ) ) ( not ( = ?auto_393046 ?auto_393050 ) ) ( not ( = ?auto_393047 ?auto_393049 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_393050 ?auto_393049 ?auto_393041 ?auto_393042 )
      ( GET-4IMAGE-VERIFY ?auto_393041 ?auto_393042 ?auto_393043 ?auto_393040 ?auto_393044 ?auto_393045 ?auto_393046 ?auto_393047 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_393679 - DIRECTION
      ?auto_393680 - MODE
      ?auto_393681 - DIRECTION
      ?auto_393678 - MODE
      ?auto_393682 - DIRECTION
      ?auto_393683 - MODE
    )
    :vars
    (
      ?auto_393684 - INSTRUMENT
      ?auto_393686 - SATELLITE
      ?auto_393685 - DIRECTION
      ?auto_393688 - DIRECTION
      ?auto_393687 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_393684 ?auto_393686 ) ( SUPPORTS ?auto_393684 ?auto_393680 ) ( not ( = ?auto_393679 ?auto_393685 ) ) ( HAVE_IMAGE ?auto_393682 ?auto_393683 ) ( not ( = ?auto_393682 ?auto_393679 ) ) ( not ( = ?auto_393682 ?auto_393685 ) ) ( not ( = ?auto_393683 ?auto_393680 ) ) ( CALIBRATION_TARGET ?auto_393684 ?auto_393685 ) ( POINTING ?auto_393686 ?auto_393688 ) ( not ( = ?auto_393685 ?auto_393688 ) ) ( not ( = ?auto_393679 ?auto_393688 ) ) ( not ( = ?auto_393682 ?auto_393688 ) ) ( ON_BOARD ?auto_393687 ?auto_393686 ) ( POWER_ON ?auto_393687 ) ( not ( = ?auto_393684 ?auto_393687 ) ) ( HAVE_IMAGE ?auto_393681 ?auto_393678 ) ( not ( = ?auto_393679 ?auto_393681 ) ) ( not ( = ?auto_393680 ?auto_393678 ) ) ( not ( = ?auto_393681 ?auto_393682 ) ) ( not ( = ?auto_393681 ?auto_393685 ) ) ( not ( = ?auto_393681 ?auto_393688 ) ) ( not ( = ?auto_393678 ?auto_393683 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_393682 ?auto_393683 ?auto_393679 ?auto_393680 )
      ( GET-3IMAGE-VERIFY ?auto_393679 ?auto_393680 ?auto_393681 ?auto_393678 ?auto_393682 ?auto_393683 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_393894 - DIRECTION
      ?auto_393895 - MODE
      ?auto_393896 - DIRECTION
      ?auto_393893 - MODE
      ?auto_393897 - DIRECTION
      ?auto_393898 - MODE
      ?auto_393899 - DIRECTION
      ?auto_393900 - MODE
    )
    :vars
    (
      ?auto_393901 - INSTRUMENT
      ?auto_393903 - SATELLITE
      ?auto_393902 - DIRECTION
      ?auto_393905 - DIRECTION
      ?auto_393904 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_393901 ?auto_393903 ) ( SUPPORTS ?auto_393901 ?auto_393898 ) ( not ( = ?auto_393897 ?auto_393902 ) ) ( HAVE_IMAGE ?auto_393894 ?auto_393893 ) ( not ( = ?auto_393894 ?auto_393897 ) ) ( not ( = ?auto_393894 ?auto_393902 ) ) ( not ( = ?auto_393893 ?auto_393898 ) ) ( CALIBRATION_TARGET ?auto_393901 ?auto_393902 ) ( POINTING ?auto_393903 ?auto_393905 ) ( not ( = ?auto_393902 ?auto_393905 ) ) ( not ( = ?auto_393897 ?auto_393905 ) ) ( not ( = ?auto_393894 ?auto_393905 ) ) ( ON_BOARD ?auto_393904 ?auto_393903 ) ( POWER_ON ?auto_393904 ) ( not ( = ?auto_393901 ?auto_393904 ) ) ( HAVE_IMAGE ?auto_393894 ?auto_393895 ) ( HAVE_IMAGE ?auto_393896 ?auto_393893 ) ( HAVE_IMAGE ?auto_393899 ?auto_393900 ) ( not ( = ?auto_393894 ?auto_393896 ) ) ( not ( = ?auto_393894 ?auto_393899 ) ) ( not ( = ?auto_393895 ?auto_393893 ) ) ( not ( = ?auto_393895 ?auto_393898 ) ) ( not ( = ?auto_393895 ?auto_393900 ) ) ( not ( = ?auto_393896 ?auto_393897 ) ) ( not ( = ?auto_393896 ?auto_393899 ) ) ( not ( = ?auto_393896 ?auto_393902 ) ) ( not ( = ?auto_393896 ?auto_393905 ) ) ( not ( = ?auto_393893 ?auto_393900 ) ) ( not ( = ?auto_393897 ?auto_393899 ) ) ( not ( = ?auto_393898 ?auto_393900 ) ) ( not ( = ?auto_393899 ?auto_393902 ) ) ( not ( = ?auto_393899 ?auto_393905 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_393894 ?auto_393893 ?auto_393897 ?auto_393898 )
      ( GET-4IMAGE-VERIFY ?auto_393894 ?auto_393895 ?auto_393896 ?auto_393893 ?auto_393897 ?auto_393898 ?auto_393899 ?auto_393900 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_399001 - DIRECTION
      ?auto_399002 - MODE
      ?auto_399003 - DIRECTION
      ?auto_399000 - MODE
      ?auto_399004 - DIRECTION
      ?auto_399005 - MODE
    )
    :vars
    (
      ?auto_399006 - INSTRUMENT
      ?auto_399008 - SATELLITE
      ?auto_399009 - DIRECTION
      ?auto_399007 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399006 ?auto_399008 ) ( SUPPORTS ?auto_399006 ?auto_399005 ) ( not ( = ?auto_399004 ?auto_399009 ) ) ( HAVE_IMAGE ?auto_399001 ?auto_399002 ) ( not ( = ?auto_399001 ?auto_399004 ) ) ( not ( = ?auto_399001 ?auto_399009 ) ) ( not ( = ?auto_399002 ?auto_399005 ) ) ( CALIBRATION_TARGET ?auto_399006 ?auto_399009 ) ( not ( = ?auto_399009 ?auto_399003 ) ) ( not ( = ?auto_399004 ?auto_399003 ) ) ( not ( = ?auto_399001 ?auto_399003 ) ) ( ON_BOARD ?auto_399007 ?auto_399008 ) ( POWER_ON ?auto_399007 ) ( not ( = ?auto_399006 ?auto_399007 ) ) ( POINTING ?auto_399008 ?auto_399009 ) ( HAVE_IMAGE ?auto_399003 ?auto_399000 ) ( not ( = ?auto_399002 ?auto_399000 ) ) ( not ( = ?auto_399000 ?auto_399005 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399001 ?auto_399002 ?auto_399004 ?auto_399005 )
      ( GET-3IMAGE-VERIFY ?auto_399001 ?auto_399002 ?auto_399003 ?auto_399000 ?auto_399004 ?auto_399005 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_399033 - DIRECTION
      ?auto_399034 - MODE
      ?auto_399035 - DIRECTION
      ?auto_399032 - MODE
      ?auto_399036 - DIRECTION
      ?auto_399037 - MODE
    )
    :vars
    (
      ?auto_399038 - INSTRUMENT
      ?auto_399040 - SATELLITE
      ?auto_399041 - DIRECTION
      ?auto_399039 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399038 ?auto_399040 ) ( SUPPORTS ?auto_399038 ?auto_399032 ) ( not ( = ?auto_399035 ?auto_399041 ) ) ( HAVE_IMAGE ?auto_399033 ?auto_399034 ) ( not ( = ?auto_399033 ?auto_399035 ) ) ( not ( = ?auto_399033 ?auto_399041 ) ) ( not ( = ?auto_399034 ?auto_399032 ) ) ( CALIBRATION_TARGET ?auto_399038 ?auto_399041 ) ( not ( = ?auto_399041 ?auto_399036 ) ) ( not ( = ?auto_399035 ?auto_399036 ) ) ( not ( = ?auto_399033 ?auto_399036 ) ) ( ON_BOARD ?auto_399039 ?auto_399040 ) ( POWER_ON ?auto_399039 ) ( not ( = ?auto_399038 ?auto_399039 ) ) ( POINTING ?auto_399040 ?auto_399041 ) ( HAVE_IMAGE ?auto_399036 ?auto_399037 ) ( not ( = ?auto_399034 ?auto_399037 ) ) ( not ( = ?auto_399032 ?auto_399037 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399033 ?auto_399034 ?auto_399035 ?auto_399032 )
      ( GET-3IMAGE-VERIFY ?auto_399033 ?auto_399034 ?auto_399035 ?auto_399032 ?auto_399036 ?auto_399037 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_399071 - DIRECTION
      ?auto_399072 - MODE
      ?auto_399073 - DIRECTION
      ?auto_399070 - MODE
      ?auto_399074 - DIRECTION
      ?auto_399075 - MODE
    )
    :vars
    (
      ?auto_399077 - INSTRUMENT
      ?auto_399080 - SATELLITE
      ?auto_399081 - DIRECTION
      ?auto_399079 - DIRECTION
      ?auto_399076 - MODE
      ?auto_399078 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399077 ?auto_399080 ) ( SUPPORTS ?auto_399077 ?auto_399075 ) ( not ( = ?auto_399074 ?auto_399081 ) ) ( HAVE_IMAGE ?auto_399079 ?auto_399076 ) ( not ( = ?auto_399079 ?auto_399074 ) ) ( not ( = ?auto_399079 ?auto_399081 ) ) ( not ( = ?auto_399076 ?auto_399075 ) ) ( CALIBRATION_TARGET ?auto_399077 ?auto_399081 ) ( not ( = ?auto_399081 ?auto_399073 ) ) ( not ( = ?auto_399074 ?auto_399073 ) ) ( not ( = ?auto_399079 ?auto_399073 ) ) ( ON_BOARD ?auto_399078 ?auto_399080 ) ( POWER_ON ?auto_399078 ) ( not ( = ?auto_399077 ?auto_399078 ) ) ( POINTING ?auto_399080 ?auto_399081 ) ( HAVE_IMAGE ?auto_399071 ?auto_399072 ) ( HAVE_IMAGE ?auto_399073 ?auto_399070 ) ( not ( = ?auto_399071 ?auto_399073 ) ) ( not ( = ?auto_399071 ?auto_399074 ) ) ( not ( = ?auto_399071 ?auto_399081 ) ) ( not ( = ?auto_399071 ?auto_399079 ) ) ( not ( = ?auto_399072 ?auto_399070 ) ) ( not ( = ?auto_399072 ?auto_399075 ) ) ( not ( = ?auto_399072 ?auto_399076 ) ) ( not ( = ?auto_399070 ?auto_399075 ) ) ( not ( = ?auto_399070 ?auto_399076 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399079 ?auto_399076 ?auto_399074 ?auto_399075 )
      ( GET-3IMAGE-VERIFY ?auto_399071 ?auto_399072 ?auto_399073 ?auto_399070 ?auto_399074 ?auto_399075 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_396328 - DIRECTION
      ?auto_396329 - MODE
      ?auto_396330 - DIRECTION
      ?auto_396327 - MODE
      ?auto_396331 - DIRECTION
      ?auto_396332 - MODE
    )
    :vars
    (
      ?auto_396337 - INSTRUMENT
      ?auto_396333 - SATELLITE
      ?auto_396334 - DIRECTION
      ?auto_396336 - DIRECTION
      ?auto_396335 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_396337 ?auto_396333 ) ( SUPPORTS ?auto_396337 ?auto_396327 ) ( not ( = ?auto_396330 ?auto_396334 ) ) ( HAVE_IMAGE ?auto_396331 ?auto_396332 ) ( not ( = ?auto_396331 ?auto_396330 ) ) ( not ( = ?auto_396331 ?auto_396334 ) ) ( not ( = ?auto_396332 ?auto_396327 ) ) ( CALIBRATION_TARGET ?auto_396337 ?auto_396334 ) ( not ( = ?auto_396334 ?auto_396336 ) ) ( not ( = ?auto_396330 ?auto_396336 ) ) ( not ( = ?auto_396331 ?auto_396336 ) ) ( ON_BOARD ?auto_396335 ?auto_396333 ) ( POWER_ON ?auto_396335 ) ( not ( = ?auto_396337 ?auto_396335 ) ) ( POINTING ?auto_396333 ?auto_396334 ) ( HAVE_IMAGE ?auto_396328 ?auto_396329 ) ( not ( = ?auto_396328 ?auto_396330 ) ) ( not ( = ?auto_396328 ?auto_396331 ) ) ( not ( = ?auto_396328 ?auto_396334 ) ) ( not ( = ?auto_396328 ?auto_396336 ) ) ( not ( = ?auto_396329 ?auto_396327 ) ) ( not ( = ?auto_396329 ?auto_396332 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_396331 ?auto_396332 ?auto_396330 ?auto_396327 )
      ( GET-3IMAGE-VERIFY ?auto_396328 ?auto_396329 ?auto_396330 ?auto_396327 ?auto_396331 ?auto_396332 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_399101 - DIRECTION
      ?auto_399102 - MODE
      ?auto_399103 - DIRECTION
      ?auto_399100 - MODE
      ?auto_399104 - DIRECTION
      ?auto_399105 - MODE
    )
    :vars
    (
      ?auto_399107 - INSTRUMENT
      ?auto_399110 - SATELLITE
      ?auto_399111 - DIRECTION
      ?auto_399109 - DIRECTION
      ?auto_399106 - MODE
      ?auto_399108 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399107 ?auto_399110 ) ( SUPPORTS ?auto_399107 ?auto_399100 ) ( not ( = ?auto_399103 ?auto_399111 ) ) ( HAVE_IMAGE ?auto_399109 ?auto_399106 ) ( not ( = ?auto_399109 ?auto_399103 ) ) ( not ( = ?auto_399109 ?auto_399111 ) ) ( not ( = ?auto_399106 ?auto_399100 ) ) ( CALIBRATION_TARGET ?auto_399107 ?auto_399111 ) ( not ( = ?auto_399111 ?auto_399104 ) ) ( not ( = ?auto_399103 ?auto_399104 ) ) ( not ( = ?auto_399109 ?auto_399104 ) ) ( ON_BOARD ?auto_399108 ?auto_399110 ) ( POWER_ON ?auto_399108 ) ( not ( = ?auto_399107 ?auto_399108 ) ) ( POINTING ?auto_399110 ?auto_399111 ) ( HAVE_IMAGE ?auto_399101 ?auto_399102 ) ( HAVE_IMAGE ?auto_399104 ?auto_399105 ) ( not ( = ?auto_399101 ?auto_399103 ) ) ( not ( = ?auto_399101 ?auto_399104 ) ) ( not ( = ?auto_399101 ?auto_399111 ) ) ( not ( = ?auto_399101 ?auto_399109 ) ) ( not ( = ?auto_399102 ?auto_399100 ) ) ( not ( = ?auto_399102 ?auto_399105 ) ) ( not ( = ?auto_399102 ?auto_399106 ) ) ( not ( = ?auto_399100 ?auto_399105 ) ) ( not ( = ?auto_399105 ?auto_399106 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399109 ?auto_399106 ?auto_399103 ?auto_399100 )
      ( GET-3IMAGE-VERIFY ?auto_399101 ?auto_399102 ?auto_399103 ?auto_399100 ?auto_399104 ?auto_399105 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_396457 - DIRECTION
      ?auto_396458 - MODE
      ?auto_396459 - DIRECTION
      ?auto_396456 - MODE
      ?auto_396460 - DIRECTION
      ?auto_396461 - MODE
    )
    :vars
    (
      ?auto_396466 - INSTRUMENT
      ?auto_396462 - SATELLITE
      ?auto_396463 - DIRECTION
      ?auto_396465 - DIRECTION
      ?auto_396464 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_396466 ?auto_396462 ) ( SUPPORTS ?auto_396466 ?auto_396458 ) ( not ( = ?auto_396457 ?auto_396463 ) ) ( HAVE_IMAGE ?auto_396460 ?auto_396461 ) ( not ( = ?auto_396460 ?auto_396457 ) ) ( not ( = ?auto_396460 ?auto_396463 ) ) ( not ( = ?auto_396461 ?auto_396458 ) ) ( CALIBRATION_TARGET ?auto_396466 ?auto_396463 ) ( not ( = ?auto_396463 ?auto_396465 ) ) ( not ( = ?auto_396457 ?auto_396465 ) ) ( not ( = ?auto_396460 ?auto_396465 ) ) ( ON_BOARD ?auto_396464 ?auto_396462 ) ( POWER_ON ?auto_396464 ) ( not ( = ?auto_396466 ?auto_396464 ) ) ( POINTING ?auto_396462 ?auto_396463 ) ( HAVE_IMAGE ?auto_396459 ?auto_396456 ) ( not ( = ?auto_396457 ?auto_396459 ) ) ( not ( = ?auto_396458 ?auto_396456 ) ) ( not ( = ?auto_396459 ?auto_396460 ) ) ( not ( = ?auto_396459 ?auto_396463 ) ) ( not ( = ?auto_396459 ?auto_396465 ) ) ( not ( = ?auto_396456 ?auto_396461 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_396460 ?auto_396461 ?auto_396457 ?auto_396458 )
      ( GET-3IMAGE-VERIFY ?auto_396457 ?auto_396458 ?auto_396459 ?auto_396456 ?auto_396460 ?auto_396461 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_399271 - DIRECTION
      ?auto_399272 - MODE
      ?auto_399273 - DIRECTION
      ?auto_399270 - MODE
      ?auto_399274 - DIRECTION
      ?auto_399275 - MODE
    )
    :vars
    (
      ?auto_399277 - INSTRUMENT
      ?auto_399280 - SATELLITE
      ?auto_399281 - DIRECTION
      ?auto_399279 - DIRECTION
      ?auto_399276 - MODE
      ?auto_399278 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399277 ?auto_399280 ) ( SUPPORTS ?auto_399277 ?auto_399272 ) ( not ( = ?auto_399271 ?auto_399281 ) ) ( HAVE_IMAGE ?auto_399279 ?auto_399276 ) ( not ( = ?auto_399279 ?auto_399271 ) ) ( not ( = ?auto_399279 ?auto_399281 ) ) ( not ( = ?auto_399276 ?auto_399272 ) ) ( CALIBRATION_TARGET ?auto_399277 ?auto_399281 ) ( not ( = ?auto_399281 ?auto_399273 ) ) ( not ( = ?auto_399271 ?auto_399273 ) ) ( not ( = ?auto_399279 ?auto_399273 ) ) ( ON_BOARD ?auto_399278 ?auto_399280 ) ( POWER_ON ?auto_399278 ) ( not ( = ?auto_399277 ?auto_399278 ) ) ( POINTING ?auto_399280 ?auto_399281 ) ( HAVE_IMAGE ?auto_399273 ?auto_399270 ) ( HAVE_IMAGE ?auto_399274 ?auto_399275 ) ( not ( = ?auto_399271 ?auto_399274 ) ) ( not ( = ?auto_399272 ?auto_399270 ) ) ( not ( = ?auto_399272 ?auto_399275 ) ) ( not ( = ?auto_399273 ?auto_399274 ) ) ( not ( = ?auto_399270 ?auto_399275 ) ) ( not ( = ?auto_399270 ?auto_399276 ) ) ( not ( = ?auto_399274 ?auto_399281 ) ) ( not ( = ?auto_399274 ?auto_399279 ) ) ( not ( = ?auto_399275 ?auto_399276 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399279 ?auto_399276 ?auto_399271 ?auto_399272 )
      ( GET-3IMAGE-VERIFY ?auto_399271 ?auto_399272 ?auto_399273 ?auto_399270 ?auto_399274 ?auto_399275 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_399868 - DIRECTION
      ?auto_399869 - MODE
      ?auto_399870 - DIRECTION
      ?auto_399867 - MODE
      ?auto_399871 - DIRECTION
      ?auto_399872 - MODE
      ?auto_399873 - DIRECTION
      ?auto_399874 - MODE
    )
    :vars
    (
      ?auto_399875 - INSTRUMENT
      ?auto_399877 - SATELLITE
      ?auto_399878 - DIRECTION
      ?auto_399876 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399875 ?auto_399877 ) ( SUPPORTS ?auto_399875 ?auto_399874 ) ( not ( = ?auto_399873 ?auto_399878 ) ) ( HAVE_IMAGE ?auto_399870 ?auto_399867 ) ( not ( = ?auto_399870 ?auto_399873 ) ) ( not ( = ?auto_399870 ?auto_399878 ) ) ( not ( = ?auto_399867 ?auto_399874 ) ) ( CALIBRATION_TARGET ?auto_399875 ?auto_399878 ) ( not ( = ?auto_399878 ?auto_399868 ) ) ( not ( = ?auto_399873 ?auto_399868 ) ) ( not ( = ?auto_399870 ?auto_399868 ) ) ( ON_BOARD ?auto_399876 ?auto_399877 ) ( POWER_ON ?auto_399876 ) ( not ( = ?auto_399875 ?auto_399876 ) ) ( POINTING ?auto_399877 ?auto_399878 ) ( HAVE_IMAGE ?auto_399868 ?auto_399869 ) ( HAVE_IMAGE ?auto_399871 ?auto_399872 ) ( not ( = ?auto_399868 ?auto_399871 ) ) ( not ( = ?auto_399869 ?auto_399867 ) ) ( not ( = ?auto_399869 ?auto_399872 ) ) ( not ( = ?auto_399869 ?auto_399874 ) ) ( not ( = ?auto_399870 ?auto_399871 ) ) ( not ( = ?auto_399867 ?auto_399872 ) ) ( not ( = ?auto_399871 ?auto_399873 ) ) ( not ( = ?auto_399871 ?auto_399878 ) ) ( not ( = ?auto_399872 ?auto_399874 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399870 ?auto_399867 ?auto_399873 ?auto_399874 )
      ( GET-4IMAGE-VERIFY ?auto_399868 ?auto_399869 ?auto_399870 ?auto_399867 ?auto_399871 ?auto_399872 ?auto_399873 ?auto_399874 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_396657 - DIRECTION
      ?auto_396658 - MODE
      ?auto_396659 - DIRECTION
      ?auto_396656 - MODE
      ?auto_396660 - DIRECTION
      ?auto_396661 - MODE
      ?auto_396662 - DIRECTION
      ?auto_396663 - MODE
    )
    :vars
    (
      ?auto_396668 - INSTRUMENT
      ?auto_396664 - SATELLITE
      ?auto_396665 - DIRECTION
      ?auto_396667 - DIRECTION
      ?auto_396666 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_396668 ?auto_396664 ) ( SUPPORTS ?auto_396668 ?auto_396663 ) ( not ( = ?auto_396662 ?auto_396665 ) ) ( HAVE_IMAGE ?auto_396659 ?auto_396658 ) ( not ( = ?auto_396659 ?auto_396662 ) ) ( not ( = ?auto_396659 ?auto_396665 ) ) ( not ( = ?auto_396658 ?auto_396663 ) ) ( CALIBRATION_TARGET ?auto_396668 ?auto_396665 ) ( not ( = ?auto_396665 ?auto_396667 ) ) ( not ( = ?auto_396662 ?auto_396667 ) ) ( not ( = ?auto_396659 ?auto_396667 ) ) ( ON_BOARD ?auto_396666 ?auto_396664 ) ( POWER_ON ?auto_396666 ) ( not ( = ?auto_396668 ?auto_396666 ) ) ( POINTING ?auto_396664 ?auto_396665 ) ( HAVE_IMAGE ?auto_396657 ?auto_396658 ) ( HAVE_IMAGE ?auto_396659 ?auto_396656 ) ( HAVE_IMAGE ?auto_396660 ?auto_396661 ) ( not ( = ?auto_396657 ?auto_396659 ) ) ( not ( = ?auto_396657 ?auto_396660 ) ) ( not ( = ?auto_396657 ?auto_396662 ) ) ( not ( = ?auto_396657 ?auto_396665 ) ) ( not ( = ?auto_396657 ?auto_396667 ) ) ( not ( = ?auto_396658 ?auto_396656 ) ) ( not ( = ?auto_396658 ?auto_396661 ) ) ( not ( = ?auto_396659 ?auto_396660 ) ) ( not ( = ?auto_396656 ?auto_396661 ) ) ( not ( = ?auto_396656 ?auto_396663 ) ) ( not ( = ?auto_396660 ?auto_396662 ) ) ( not ( = ?auto_396660 ?auto_396665 ) ) ( not ( = ?auto_396660 ?auto_396667 ) ) ( not ( = ?auto_396661 ?auto_396663 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_396659 ?auto_396658 ?auto_396662 ?auto_396663 )
      ( GET-4IMAGE-VERIFY ?auto_396657 ?auto_396658 ?auto_396659 ?auto_396656 ?auto_396660 ?auto_396661 ?auto_396662 ?auto_396663 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_399456 - DIRECTION
      ?auto_399457 - MODE
      ?auto_399458 - DIRECTION
      ?auto_399455 - MODE
      ?auto_399459 - DIRECTION
      ?auto_399460 - MODE
      ?auto_399461 - DIRECTION
      ?auto_399462 - MODE
    )
    :vars
    (
      ?auto_399463 - INSTRUMENT
      ?auto_399465 - SATELLITE
      ?auto_399466 - DIRECTION
      ?auto_399464 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399463 ?auto_399465 ) ( SUPPORTS ?auto_399463 ?auto_399460 ) ( not ( = ?auto_399459 ?auto_399466 ) ) ( HAVE_IMAGE ?auto_399456 ?auto_399457 ) ( not ( = ?auto_399456 ?auto_399459 ) ) ( not ( = ?auto_399456 ?auto_399466 ) ) ( not ( = ?auto_399457 ?auto_399460 ) ) ( CALIBRATION_TARGET ?auto_399463 ?auto_399466 ) ( not ( = ?auto_399466 ?auto_399461 ) ) ( not ( = ?auto_399459 ?auto_399461 ) ) ( not ( = ?auto_399456 ?auto_399461 ) ) ( ON_BOARD ?auto_399464 ?auto_399465 ) ( POWER_ON ?auto_399464 ) ( not ( = ?auto_399463 ?auto_399464 ) ) ( POINTING ?auto_399465 ?auto_399466 ) ( HAVE_IMAGE ?auto_399458 ?auto_399455 ) ( HAVE_IMAGE ?auto_399461 ?auto_399462 ) ( not ( = ?auto_399456 ?auto_399458 ) ) ( not ( = ?auto_399457 ?auto_399455 ) ) ( not ( = ?auto_399457 ?auto_399462 ) ) ( not ( = ?auto_399458 ?auto_399459 ) ) ( not ( = ?auto_399458 ?auto_399461 ) ) ( not ( = ?auto_399458 ?auto_399466 ) ) ( not ( = ?auto_399455 ?auto_399460 ) ) ( not ( = ?auto_399455 ?auto_399462 ) ) ( not ( = ?auto_399460 ?auto_399462 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399456 ?auto_399457 ?auto_399459 ?auto_399460 )
      ( GET-4IMAGE-VERIFY ?auto_399456 ?auto_399457 ?auto_399458 ?auto_399455 ?auto_399459 ?auto_399460 ?auto_399461 ?auto_399462 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_396733 - DIRECTION
      ?auto_396734 - MODE
      ?auto_396735 - DIRECTION
      ?auto_396732 - MODE
      ?auto_396736 - DIRECTION
      ?auto_396737 - MODE
      ?auto_396738 - DIRECTION
      ?auto_396739 - MODE
    )
    :vars
    (
      ?auto_396744 - INSTRUMENT
      ?auto_396740 - SATELLITE
      ?auto_396741 - DIRECTION
      ?auto_396743 - DIRECTION
      ?auto_396742 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_396744 ?auto_396740 ) ( SUPPORTS ?auto_396744 ?auto_396739 ) ( not ( = ?auto_396738 ?auto_396741 ) ) ( HAVE_IMAGE ?auto_396733 ?auto_396737 ) ( not ( = ?auto_396733 ?auto_396738 ) ) ( not ( = ?auto_396733 ?auto_396741 ) ) ( not ( = ?auto_396737 ?auto_396739 ) ) ( CALIBRATION_TARGET ?auto_396744 ?auto_396741 ) ( not ( = ?auto_396741 ?auto_396743 ) ) ( not ( = ?auto_396738 ?auto_396743 ) ) ( not ( = ?auto_396733 ?auto_396743 ) ) ( ON_BOARD ?auto_396742 ?auto_396740 ) ( POWER_ON ?auto_396742 ) ( not ( = ?auto_396744 ?auto_396742 ) ) ( POINTING ?auto_396740 ?auto_396741 ) ( HAVE_IMAGE ?auto_396733 ?auto_396734 ) ( HAVE_IMAGE ?auto_396735 ?auto_396732 ) ( HAVE_IMAGE ?auto_396736 ?auto_396737 ) ( not ( = ?auto_396733 ?auto_396735 ) ) ( not ( = ?auto_396733 ?auto_396736 ) ) ( not ( = ?auto_396734 ?auto_396732 ) ) ( not ( = ?auto_396734 ?auto_396737 ) ) ( not ( = ?auto_396734 ?auto_396739 ) ) ( not ( = ?auto_396735 ?auto_396736 ) ) ( not ( = ?auto_396735 ?auto_396738 ) ) ( not ( = ?auto_396735 ?auto_396741 ) ) ( not ( = ?auto_396735 ?auto_396743 ) ) ( not ( = ?auto_396732 ?auto_396737 ) ) ( not ( = ?auto_396732 ?auto_396739 ) ) ( not ( = ?auto_396736 ?auto_396738 ) ) ( not ( = ?auto_396736 ?auto_396741 ) ) ( not ( = ?auto_396736 ?auto_396743 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_396733 ?auto_396737 ?auto_396738 ?auto_396739 )
      ( GET-4IMAGE-VERIFY ?auto_396733 ?auto_396734 ?auto_396735 ?auto_396732 ?auto_396736 ?auto_396737 ?auto_396738 ?auto_396739 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_399418 - DIRECTION
      ?auto_399419 - MODE
      ?auto_399420 - DIRECTION
      ?auto_399417 - MODE
      ?auto_399421 - DIRECTION
      ?auto_399422 - MODE
      ?auto_399423 - DIRECTION
      ?auto_399424 - MODE
    )
    :vars
    (
      ?auto_399425 - INSTRUMENT
      ?auto_399427 - SATELLITE
      ?auto_399428 - DIRECTION
      ?auto_399426 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399425 ?auto_399427 ) ( SUPPORTS ?auto_399425 ?auto_399424 ) ( not ( = ?auto_399423 ?auto_399428 ) ) ( HAVE_IMAGE ?auto_399418 ?auto_399419 ) ( not ( = ?auto_399418 ?auto_399423 ) ) ( not ( = ?auto_399418 ?auto_399428 ) ) ( not ( = ?auto_399419 ?auto_399424 ) ) ( CALIBRATION_TARGET ?auto_399425 ?auto_399428 ) ( not ( = ?auto_399428 ?auto_399421 ) ) ( not ( = ?auto_399423 ?auto_399421 ) ) ( not ( = ?auto_399418 ?auto_399421 ) ) ( ON_BOARD ?auto_399426 ?auto_399427 ) ( POWER_ON ?auto_399426 ) ( not ( = ?auto_399425 ?auto_399426 ) ) ( POINTING ?auto_399427 ?auto_399428 ) ( HAVE_IMAGE ?auto_399420 ?auto_399417 ) ( HAVE_IMAGE ?auto_399421 ?auto_399422 ) ( not ( = ?auto_399418 ?auto_399420 ) ) ( not ( = ?auto_399419 ?auto_399417 ) ) ( not ( = ?auto_399419 ?auto_399422 ) ) ( not ( = ?auto_399420 ?auto_399421 ) ) ( not ( = ?auto_399420 ?auto_399423 ) ) ( not ( = ?auto_399420 ?auto_399428 ) ) ( not ( = ?auto_399417 ?auto_399422 ) ) ( not ( = ?auto_399417 ?auto_399424 ) ) ( not ( = ?auto_399422 ?auto_399424 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399418 ?auto_399419 ?auto_399423 ?auto_399424 )
      ( GET-4IMAGE-VERIFY ?auto_399418 ?auto_399419 ?auto_399420 ?auto_399417 ?auto_399421 ?auto_399422 ?auto_399423 ?auto_399424 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_399730 - DIRECTION
      ?auto_399731 - MODE
      ?auto_399732 - DIRECTION
      ?auto_399729 - MODE
      ?auto_399733 - DIRECTION
      ?auto_399734 - MODE
      ?auto_399735 - DIRECTION
      ?auto_399736 - MODE
    )
    :vars
    (
      ?auto_399737 - INSTRUMENT
      ?auto_399739 - SATELLITE
      ?auto_399740 - DIRECTION
      ?auto_399738 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399737 ?auto_399739 ) ( SUPPORTS ?auto_399737 ?auto_399729 ) ( not ( = ?auto_399732 ?auto_399740 ) ) ( HAVE_IMAGE ?auto_399730 ?auto_399731 ) ( not ( = ?auto_399730 ?auto_399732 ) ) ( not ( = ?auto_399730 ?auto_399740 ) ) ( not ( = ?auto_399731 ?auto_399729 ) ) ( CALIBRATION_TARGET ?auto_399737 ?auto_399740 ) ( not ( = ?auto_399740 ?auto_399733 ) ) ( not ( = ?auto_399732 ?auto_399733 ) ) ( not ( = ?auto_399730 ?auto_399733 ) ) ( ON_BOARD ?auto_399738 ?auto_399739 ) ( POWER_ON ?auto_399738 ) ( not ( = ?auto_399737 ?auto_399738 ) ) ( POINTING ?auto_399739 ?auto_399740 ) ( HAVE_IMAGE ?auto_399733 ?auto_399734 ) ( HAVE_IMAGE ?auto_399735 ?auto_399736 ) ( not ( = ?auto_399730 ?auto_399735 ) ) ( not ( = ?auto_399731 ?auto_399734 ) ) ( not ( = ?auto_399731 ?auto_399736 ) ) ( not ( = ?auto_399732 ?auto_399735 ) ) ( not ( = ?auto_399729 ?auto_399734 ) ) ( not ( = ?auto_399729 ?auto_399736 ) ) ( not ( = ?auto_399733 ?auto_399735 ) ) ( not ( = ?auto_399734 ?auto_399736 ) ) ( not ( = ?auto_399735 ?auto_399740 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399730 ?auto_399731 ?auto_399732 ?auto_399729 )
      ( GET-4IMAGE-VERIFY ?auto_399730 ?auto_399731 ?auto_399732 ?auto_399729 ?auto_399733 ?auto_399734 ?auto_399735 ?auto_399736 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_397107 - DIRECTION
      ?auto_397108 - MODE
      ?auto_397109 - DIRECTION
      ?auto_397106 - MODE
      ?auto_397110 - DIRECTION
      ?auto_397111 - MODE
      ?auto_397112 - DIRECTION
      ?auto_397113 - MODE
    )
    :vars
    (
      ?auto_397118 - INSTRUMENT
      ?auto_397114 - SATELLITE
      ?auto_397115 - DIRECTION
      ?auto_397117 - DIRECTION
      ?auto_397116 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_397118 ?auto_397114 ) ( SUPPORTS ?auto_397118 ?auto_397113 ) ( not ( = ?auto_397112 ?auto_397115 ) ) ( HAVE_IMAGE ?auto_397109 ?auto_397111 ) ( not ( = ?auto_397109 ?auto_397112 ) ) ( not ( = ?auto_397109 ?auto_397115 ) ) ( not ( = ?auto_397111 ?auto_397113 ) ) ( CALIBRATION_TARGET ?auto_397118 ?auto_397115 ) ( not ( = ?auto_397115 ?auto_397117 ) ) ( not ( = ?auto_397112 ?auto_397117 ) ) ( not ( = ?auto_397109 ?auto_397117 ) ) ( ON_BOARD ?auto_397116 ?auto_397114 ) ( POWER_ON ?auto_397116 ) ( not ( = ?auto_397118 ?auto_397116 ) ) ( POINTING ?auto_397114 ?auto_397115 ) ( HAVE_IMAGE ?auto_397107 ?auto_397108 ) ( HAVE_IMAGE ?auto_397109 ?auto_397106 ) ( HAVE_IMAGE ?auto_397110 ?auto_397111 ) ( not ( = ?auto_397107 ?auto_397109 ) ) ( not ( = ?auto_397107 ?auto_397110 ) ) ( not ( = ?auto_397107 ?auto_397112 ) ) ( not ( = ?auto_397107 ?auto_397115 ) ) ( not ( = ?auto_397107 ?auto_397117 ) ) ( not ( = ?auto_397108 ?auto_397106 ) ) ( not ( = ?auto_397108 ?auto_397111 ) ) ( not ( = ?auto_397108 ?auto_397113 ) ) ( not ( = ?auto_397109 ?auto_397110 ) ) ( not ( = ?auto_397106 ?auto_397111 ) ) ( not ( = ?auto_397106 ?auto_397113 ) ) ( not ( = ?auto_397110 ?auto_397112 ) ) ( not ( = ?auto_397110 ?auto_397115 ) ) ( not ( = ?auto_397110 ?auto_397117 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_397109 ?auto_397111 ?auto_397112 ?auto_397113 )
      ( GET-4IMAGE-VERIFY ?auto_397107 ?auto_397108 ?auto_397109 ?auto_397106 ?auto_397110 ?auto_397111 ?auto_397112 ?auto_397113 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_399904 - DIRECTION
      ?auto_399905 - MODE
      ?auto_399906 - DIRECTION
      ?auto_399903 - MODE
      ?auto_399907 - DIRECTION
      ?auto_399908 - MODE
      ?auto_399909 - DIRECTION
      ?auto_399910 - MODE
    )
    :vars
    (
      ?auto_399911 - INSTRUMENT
      ?auto_399913 - SATELLITE
      ?auto_399914 - DIRECTION
      ?auto_399912 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399911 ?auto_399913 ) ( SUPPORTS ?auto_399911 ?auto_399908 ) ( not ( = ?auto_399907 ?auto_399914 ) ) ( HAVE_IMAGE ?auto_399906 ?auto_399910 ) ( not ( = ?auto_399906 ?auto_399907 ) ) ( not ( = ?auto_399906 ?auto_399914 ) ) ( not ( = ?auto_399910 ?auto_399908 ) ) ( CALIBRATION_TARGET ?auto_399911 ?auto_399914 ) ( not ( = ?auto_399914 ?auto_399904 ) ) ( not ( = ?auto_399907 ?auto_399904 ) ) ( not ( = ?auto_399906 ?auto_399904 ) ) ( ON_BOARD ?auto_399912 ?auto_399913 ) ( POWER_ON ?auto_399912 ) ( not ( = ?auto_399911 ?auto_399912 ) ) ( POINTING ?auto_399913 ?auto_399914 ) ( HAVE_IMAGE ?auto_399904 ?auto_399905 ) ( HAVE_IMAGE ?auto_399906 ?auto_399903 ) ( HAVE_IMAGE ?auto_399909 ?auto_399910 ) ( not ( = ?auto_399904 ?auto_399909 ) ) ( not ( = ?auto_399905 ?auto_399903 ) ) ( not ( = ?auto_399905 ?auto_399908 ) ) ( not ( = ?auto_399905 ?auto_399910 ) ) ( not ( = ?auto_399906 ?auto_399909 ) ) ( not ( = ?auto_399903 ?auto_399908 ) ) ( not ( = ?auto_399903 ?auto_399910 ) ) ( not ( = ?auto_399907 ?auto_399909 ) ) ( not ( = ?auto_399909 ?auto_399914 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399906 ?auto_399910 ?auto_399907 ?auto_399908 )
      ( GET-4IMAGE-VERIFY ?auto_399904 ?auto_399905 ?auto_399906 ?auto_399903 ?auto_399907 ?auto_399908 ?auto_399909 ?auto_399910 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_399916 - DIRECTION
      ?auto_399917 - MODE
      ?auto_399918 - DIRECTION
      ?auto_399915 - MODE
      ?auto_399919 - DIRECTION
      ?auto_399920 - MODE
      ?auto_399921 - DIRECTION
      ?auto_399922 - MODE
    )
    :vars
    (
      ?auto_399923 - INSTRUMENT
      ?auto_399925 - SATELLITE
      ?auto_399926 - DIRECTION
      ?auto_399924 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399923 ?auto_399925 ) ( SUPPORTS ?auto_399923 ?auto_399920 ) ( not ( = ?auto_399919 ?auto_399926 ) ) ( HAVE_IMAGE ?auto_399918 ?auto_399915 ) ( not ( = ?auto_399918 ?auto_399919 ) ) ( not ( = ?auto_399918 ?auto_399926 ) ) ( not ( = ?auto_399915 ?auto_399920 ) ) ( CALIBRATION_TARGET ?auto_399923 ?auto_399926 ) ( not ( = ?auto_399926 ?auto_399916 ) ) ( not ( = ?auto_399919 ?auto_399916 ) ) ( not ( = ?auto_399918 ?auto_399916 ) ) ( ON_BOARD ?auto_399924 ?auto_399925 ) ( POWER_ON ?auto_399924 ) ( not ( = ?auto_399923 ?auto_399924 ) ) ( POINTING ?auto_399925 ?auto_399926 ) ( HAVE_IMAGE ?auto_399916 ?auto_399917 ) ( HAVE_IMAGE ?auto_399921 ?auto_399922 ) ( not ( = ?auto_399916 ?auto_399921 ) ) ( not ( = ?auto_399917 ?auto_399915 ) ) ( not ( = ?auto_399917 ?auto_399920 ) ) ( not ( = ?auto_399917 ?auto_399922 ) ) ( not ( = ?auto_399918 ?auto_399921 ) ) ( not ( = ?auto_399915 ?auto_399922 ) ) ( not ( = ?auto_399919 ?auto_399921 ) ) ( not ( = ?auto_399920 ?auto_399922 ) ) ( not ( = ?auto_399921 ?auto_399926 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399918 ?auto_399915 ?auto_399919 ?auto_399920 )
      ( GET-4IMAGE-VERIFY ?auto_399916 ?auto_399917 ?auto_399918 ?auto_399915 ?auto_399919 ?auto_399920 ?auto_399921 ?auto_399922 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_399494 - DIRECTION
      ?auto_399495 - MODE
      ?auto_399496 - DIRECTION
      ?auto_399493 - MODE
      ?auto_399497 - DIRECTION
      ?auto_399498 - MODE
      ?auto_399499 - DIRECTION
      ?auto_399500 - MODE
    )
    :vars
    (
      ?auto_399501 - INSTRUMENT
      ?auto_399503 - SATELLITE
      ?auto_399504 - DIRECTION
      ?auto_399502 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399501 ?auto_399503 ) ( SUPPORTS ?auto_399501 ?auto_399500 ) ( not ( = ?auto_399499 ?auto_399504 ) ) ( HAVE_IMAGE ?auto_399497 ?auto_399498 ) ( not ( = ?auto_399497 ?auto_399499 ) ) ( not ( = ?auto_399497 ?auto_399504 ) ) ( not ( = ?auto_399498 ?auto_399500 ) ) ( CALIBRATION_TARGET ?auto_399501 ?auto_399504 ) ( not ( = ?auto_399504 ?auto_399496 ) ) ( not ( = ?auto_399499 ?auto_399496 ) ) ( not ( = ?auto_399497 ?auto_399496 ) ) ( ON_BOARD ?auto_399502 ?auto_399503 ) ( POWER_ON ?auto_399502 ) ( not ( = ?auto_399501 ?auto_399502 ) ) ( POINTING ?auto_399503 ?auto_399504 ) ( HAVE_IMAGE ?auto_399494 ?auto_399495 ) ( HAVE_IMAGE ?auto_399496 ?auto_399493 ) ( not ( = ?auto_399494 ?auto_399496 ) ) ( not ( = ?auto_399494 ?auto_399497 ) ) ( not ( = ?auto_399494 ?auto_399499 ) ) ( not ( = ?auto_399494 ?auto_399504 ) ) ( not ( = ?auto_399495 ?auto_399493 ) ) ( not ( = ?auto_399495 ?auto_399498 ) ) ( not ( = ?auto_399495 ?auto_399500 ) ) ( not ( = ?auto_399493 ?auto_399498 ) ) ( not ( = ?auto_399493 ?auto_399500 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399497 ?auto_399498 ?auto_399499 ?auto_399500 )
      ( GET-4IMAGE-VERIFY ?auto_399494 ?auto_399495 ?auto_399496 ?auto_399493 ?auto_399497 ?auto_399498 ?auto_399499 ?auto_399500 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_399964 - DIRECTION
      ?auto_399965 - MODE
      ?auto_399966 - DIRECTION
      ?auto_399963 - MODE
      ?auto_399967 - DIRECTION
      ?auto_399968 - MODE
      ?auto_399969 - DIRECTION
      ?auto_399970 - MODE
    )
    :vars
    (
      ?auto_399972 - INSTRUMENT
      ?auto_399975 - SATELLITE
      ?auto_399976 - DIRECTION
      ?auto_399974 - DIRECTION
      ?auto_399971 - MODE
      ?auto_399973 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399972 ?auto_399975 ) ( SUPPORTS ?auto_399972 ?auto_399970 ) ( not ( = ?auto_399969 ?auto_399976 ) ) ( HAVE_IMAGE ?auto_399974 ?auto_399971 ) ( not ( = ?auto_399974 ?auto_399969 ) ) ( not ( = ?auto_399974 ?auto_399976 ) ) ( not ( = ?auto_399971 ?auto_399970 ) ) ( CALIBRATION_TARGET ?auto_399972 ?auto_399976 ) ( not ( = ?auto_399976 ?auto_399964 ) ) ( not ( = ?auto_399969 ?auto_399964 ) ) ( not ( = ?auto_399974 ?auto_399964 ) ) ( ON_BOARD ?auto_399973 ?auto_399975 ) ( POWER_ON ?auto_399973 ) ( not ( = ?auto_399972 ?auto_399973 ) ) ( POINTING ?auto_399975 ?auto_399976 ) ( HAVE_IMAGE ?auto_399964 ?auto_399965 ) ( HAVE_IMAGE ?auto_399966 ?auto_399963 ) ( HAVE_IMAGE ?auto_399967 ?auto_399968 ) ( not ( = ?auto_399964 ?auto_399966 ) ) ( not ( = ?auto_399964 ?auto_399967 ) ) ( not ( = ?auto_399965 ?auto_399963 ) ) ( not ( = ?auto_399965 ?auto_399968 ) ) ( not ( = ?auto_399965 ?auto_399970 ) ) ( not ( = ?auto_399965 ?auto_399971 ) ) ( not ( = ?auto_399966 ?auto_399967 ) ) ( not ( = ?auto_399966 ?auto_399969 ) ) ( not ( = ?auto_399966 ?auto_399976 ) ) ( not ( = ?auto_399966 ?auto_399974 ) ) ( not ( = ?auto_399963 ?auto_399968 ) ) ( not ( = ?auto_399963 ?auto_399970 ) ) ( not ( = ?auto_399963 ?auto_399971 ) ) ( not ( = ?auto_399967 ?auto_399969 ) ) ( not ( = ?auto_399967 ?auto_399976 ) ) ( not ( = ?auto_399967 ?auto_399974 ) ) ( not ( = ?auto_399968 ?auto_399970 ) ) ( not ( = ?auto_399968 ?auto_399971 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399974 ?auto_399971 ?auto_399969 ?auto_399970 )
      ( GET-4IMAGE-VERIFY ?auto_399964 ?auto_399965 ?auto_399966 ?auto_399963 ?auto_399967 ?auto_399968 ?auto_399969 ?auto_399970 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_399992 - DIRECTION
      ?auto_399993 - MODE
      ?auto_399994 - DIRECTION
      ?auto_399991 - MODE
      ?auto_399995 - DIRECTION
      ?auto_399996 - MODE
      ?auto_399997 - DIRECTION
      ?auto_399998 - MODE
    )
    :vars
    (
      ?auto_399999 - INSTRUMENT
      ?auto_400001 - SATELLITE
      ?auto_400002 - DIRECTION
      ?auto_400000 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399999 ?auto_400001 ) ( SUPPORTS ?auto_399999 ?auto_399996 ) ( not ( = ?auto_399995 ?auto_400002 ) ) ( HAVE_IMAGE ?auto_399997 ?auto_399998 ) ( not ( = ?auto_399997 ?auto_399995 ) ) ( not ( = ?auto_399997 ?auto_400002 ) ) ( not ( = ?auto_399998 ?auto_399996 ) ) ( CALIBRATION_TARGET ?auto_399999 ?auto_400002 ) ( not ( = ?auto_400002 ?auto_399992 ) ) ( not ( = ?auto_399995 ?auto_399992 ) ) ( not ( = ?auto_399997 ?auto_399992 ) ) ( ON_BOARD ?auto_400000 ?auto_400001 ) ( POWER_ON ?auto_400000 ) ( not ( = ?auto_399999 ?auto_400000 ) ) ( POINTING ?auto_400001 ?auto_400002 ) ( HAVE_IMAGE ?auto_399992 ?auto_399993 ) ( HAVE_IMAGE ?auto_399994 ?auto_399991 ) ( not ( = ?auto_399992 ?auto_399994 ) ) ( not ( = ?auto_399993 ?auto_399991 ) ) ( not ( = ?auto_399993 ?auto_399996 ) ) ( not ( = ?auto_399993 ?auto_399998 ) ) ( not ( = ?auto_399994 ?auto_399995 ) ) ( not ( = ?auto_399994 ?auto_399997 ) ) ( not ( = ?auto_399994 ?auto_400002 ) ) ( not ( = ?auto_399991 ?auto_399996 ) ) ( not ( = ?auto_399991 ?auto_399998 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399997 ?auto_399998 ?auto_399995 ?auto_399996 )
      ( GET-4IMAGE-VERIFY ?auto_399992 ?auto_399993 ?auto_399994 ?auto_399991 ?auto_399995 ?auto_399996 ?auto_399997 ?auto_399998 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_400004 - DIRECTION
      ?auto_400005 - MODE
      ?auto_400006 - DIRECTION
      ?auto_400003 - MODE
      ?auto_400007 - DIRECTION
      ?auto_400008 - MODE
      ?auto_400009 - DIRECTION
      ?auto_400010 - MODE
    )
    :vars
    (
      ?auto_400012 - INSTRUMENT
      ?auto_400015 - SATELLITE
      ?auto_400016 - DIRECTION
      ?auto_400014 - DIRECTION
      ?auto_400011 - MODE
      ?auto_400013 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_400012 ?auto_400015 ) ( SUPPORTS ?auto_400012 ?auto_400008 ) ( not ( = ?auto_400007 ?auto_400016 ) ) ( HAVE_IMAGE ?auto_400014 ?auto_400011 ) ( not ( = ?auto_400014 ?auto_400007 ) ) ( not ( = ?auto_400014 ?auto_400016 ) ) ( not ( = ?auto_400011 ?auto_400008 ) ) ( CALIBRATION_TARGET ?auto_400012 ?auto_400016 ) ( not ( = ?auto_400016 ?auto_400006 ) ) ( not ( = ?auto_400007 ?auto_400006 ) ) ( not ( = ?auto_400014 ?auto_400006 ) ) ( ON_BOARD ?auto_400013 ?auto_400015 ) ( POWER_ON ?auto_400013 ) ( not ( = ?auto_400012 ?auto_400013 ) ) ( POINTING ?auto_400015 ?auto_400016 ) ( HAVE_IMAGE ?auto_400004 ?auto_400005 ) ( HAVE_IMAGE ?auto_400006 ?auto_400003 ) ( HAVE_IMAGE ?auto_400009 ?auto_400010 ) ( not ( = ?auto_400004 ?auto_400006 ) ) ( not ( = ?auto_400004 ?auto_400007 ) ) ( not ( = ?auto_400004 ?auto_400009 ) ) ( not ( = ?auto_400004 ?auto_400016 ) ) ( not ( = ?auto_400004 ?auto_400014 ) ) ( not ( = ?auto_400005 ?auto_400003 ) ) ( not ( = ?auto_400005 ?auto_400008 ) ) ( not ( = ?auto_400005 ?auto_400010 ) ) ( not ( = ?auto_400005 ?auto_400011 ) ) ( not ( = ?auto_400006 ?auto_400009 ) ) ( not ( = ?auto_400003 ?auto_400008 ) ) ( not ( = ?auto_400003 ?auto_400010 ) ) ( not ( = ?auto_400003 ?auto_400011 ) ) ( not ( = ?auto_400007 ?auto_400009 ) ) ( not ( = ?auto_400008 ?auto_400010 ) ) ( not ( = ?auto_400009 ?auto_400016 ) ) ( not ( = ?auto_400009 ?auto_400014 ) ) ( not ( = ?auto_400010 ?auto_400011 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_400014 ?auto_400011 ?auto_400007 ?auto_400008 )
      ( GET-4IMAGE-VERIFY ?auto_400004 ?auto_400005 ?auto_400006 ?auto_400003 ?auto_400007 ?auto_400008 ?auto_400009 ?auto_400010 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_399680 - DIRECTION
      ?auto_399681 - MODE
      ?auto_399682 - DIRECTION
      ?auto_399679 - MODE
      ?auto_399683 - DIRECTION
      ?auto_399684 - MODE
      ?auto_399685 - DIRECTION
      ?auto_399686 - MODE
    )
    :vars
    (
      ?auto_399687 - INSTRUMENT
      ?auto_399689 - SATELLITE
      ?auto_399690 - DIRECTION
      ?auto_399688 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399687 ?auto_399689 ) ( SUPPORTS ?auto_399687 ?auto_399679 ) ( not ( = ?auto_399682 ?auto_399690 ) ) ( HAVE_IMAGE ?auto_399683 ?auto_399684 ) ( not ( = ?auto_399683 ?auto_399682 ) ) ( not ( = ?auto_399683 ?auto_399690 ) ) ( not ( = ?auto_399684 ?auto_399679 ) ) ( CALIBRATION_TARGET ?auto_399687 ?auto_399690 ) ( not ( = ?auto_399690 ?auto_399685 ) ) ( not ( = ?auto_399682 ?auto_399685 ) ) ( not ( = ?auto_399683 ?auto_399685 ) ) ( ON_BOARD ?auto_399688 ?auto_399689 ) ( POWER_ON ?auto_399688 ) ( not ( = ?auto_399687 ?auto_399688 ) ) ( POINTING ?auto_399689 ?auto_399690 ) ( HAVE_IMAGE ?auto_399680 ?auto_399681 ) ( HAVE_IMAGE ?auto_399685 ?auto_399686 ) ( not ( = ?auto_399680 ?auto_399682 ) ) ( not ( = ?auto_399680 ?auto_399683 ) ) ( not ( = ?auto_399680 ?auto_399685 ) ) ( not ( = ?auto_399680 ?auto_399690 ) ) ( not ( = ?auto_399681 ?auto_399679 ) ) ( not ( = ?auto_399681 ?auto_399684 ) ) ( not ( = ?auto_399681 ?auto_399686 ) ) ( not ( = ?auto_399679 ?auto_399686 ) ) ( not ( = ?auto_399684 ?auto_399686 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399683 ?auto_399684 ?auto_399682 ?auto_399679 )
      ( GET-4IMAGE-VERIFY ?auto_399680 ?auto_399681 ?auto_399682 ?auto_399679 ?auto_399683 ?auto_399684 ?auto_399685 ?auto_399686 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_400140 - DIRECTION
      ?auto_400141 - MODE
      ?auto_400142 - DIRECTION
      ?auto_400139 - MODE
      ?auto_400143 - DIRECTION
      ?auto_400144 - MODE
      ?auto_400145 - DIRECTION
      ?auto_400146 - MODE
    )
    :vars
    (
      ?auto_400147 - INSTRUMENT
      ?auto_400149 - SATELLITE
      ?auto_400150 - DIRECTION
      ?auto_400148 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_400147 ?auto_400149 ) ( SUPPORTS ?auto_400147 ?auto_400139 ) ( not ( = ?auto_400142 ?auto_400150 ) ) ( HAVE_IMAGE ?auto_400145 ?auto_400146 ) ( not ( = ?auto_400145 ?auto_400142 ) ) ( not ( = ?auto_400145 ?auto_400150 ) ) ( not ( = ?auto_400146 ?auto_400139 ) ) ( CALIBRATION_TARGET ?auto_400147 ?auto_400150 ) ( not ( = ?auto_400150 ?auto_400140 ) ) ( not ( = ?auto_400142 ?auto_400140 ) ) ( not ( = ?auto_400145 ?auto_400140 ) ) ( ON_BOARD ?auto_400148 ?auto_400149 ) ( POWER_ON ?auto_400148 ) ( not ( = ?auto_400147 ?auto_400148 ) ) ( POINTING ?auto_400149 ?auto_400150 ) ( HAVE_IMAGE ?auto_400140 ?auto_400141 ) ( HAVE_IMAGE ?auto_400143 ?auto_400144 ) ( not ( = ?auto_400140 ?auto_400143 ) ) ( not ( = ?auto_400141 ?auto_400139 ) ) ( not ( = ?auto_400141 ?auto_400144 ) ) ( not ( = ?auto_400141 ?auto_400146 ) ) ( not ( = ?auto_400142 ?auto_400143 ) ) ( not ( = ?auto_400139 ?auto_400144 ) ) ( not ( = ?auto_400143 ?auto_400145 ) ) ( not ( = ?auto_400143 ?auto_400150 ) ) ( not ( = ?auto_400144 ?auto_400146 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_400145 ?auto_400146 ?auto_400142 ?auto_400139 )
      ( GET-4IMAGE-VERIFY ?auto_400140 ?auto_400141 ?auto_400142 ?auto_400139 ?auto_400143 ?auto_400144 ?auto_400145 ?auto_400146 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_400200 - DIRECTION
      ?auto_400201 - MODE
      ?auto_400202 - DIRECTION
      ?auto_400199 - MODE
      ?auto_400203 - DIRECTION
      ?auto_400204 - MODE
      ?auto_400205 - DIRECTION
      ?auto_400206 - MODE
    )
    :vars
    (
      ?auto_400208 - INSTRUMENT
      ?auto_400211 - SATELLITE
      ?auto_400212 - DIRECTION
      ?auto_400210 - DIRECTION
      ?auto_400207 - MODE
      ?auto_400209 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_400208 ?auto_400211 ) ( SUPPORTS ?auto_400208 ?auto_400199 ) ( not ( = ?auto_400202 ?auto_400212 ) ) ( HAVE_IMAGE ?auto_400210 ?auto_400207 ) ( not ( = ?auto_400210 ?auto_400202 ) ) ( not ( = ?auto_400210 ?auto_400212 ) ) ( not ( = ?auto_400207 ?auto_400199 ) ) ( CALIBRATION_TARGET ?auto_400208 ?auto_400212 ) ( not ( = ?auto_400212 ?auto_400205 ) ) ( not ( = ?auto_400202 ?auto_400205 ) ) ( not ( = ?auto_400210 ?auto_400205 ) ) ( ON_BOARD ?auto_400209 ?auto_400211 ) ( POWER_ON ?auto_400209 ) ( not ( = ?auto_400208 ?auto_400209 ) ) ( POINTING ?auto_400211 ?auto_400212 ) ( HAVE_IMAGE ?auto_400200 ?auto_400201 ) ( HAVE_IMAGE ?auto_400203 ?auto_400204 ) ( HAVE_IMAGE ?auto_400205 ?auto_400206 ) ( not ( = ?auto_400200 ?auto_400202 ) ) ( not ( = ?auto_400200 ?auto_400203 ) ) ( not ( = ?auto_400200 ?auto_400205 ) ) ( not ( = ?auto_400200 ?auto_400212 ) ) ( not ( = ?auto_400200 ?auto_400210 ) ) ( not ( = ?auto_400201 ?auto_400199 ) ) ( not ( = ?auto_400201 ?auto_400204 ) ) ( not ( = ?auto_400201 ?auto_400206 ) ) ( not ( = ?auto_400201 ?auto_400207 ) ) ( not ( = ?auto_400202 ?auto_400203 ) ) ( not ( = ?auto_400199 ?auto_400204 ) ) ( not ( = ?auto_400199 ?auto_400206 ) ) ( not ( = ?auto_400203 ?auto_400205 ) ) ( not ( = ?auto_400203 ?auto_400212 ) ) ( not ( = ?auto_400203 ?auto_400210 ) ) ( not ( = ?auto_400204 ?auto_400206 ) ) ( not ( = ?auto_400204 ?auto_400207 ) ) ( not ( = ?auto_400206 ?auto_400207 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_400210 ?auto_400207 ?auto_400202 ?auto_400199 )
      ( GET-4IMAGE-VERIFY ?auto_400200 ?auto_400201 ?auto_400202 ?auto_400199 ?auto_400203 ?auto_400204 ?auto_400205 ?auto_400206 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_400864 - DIRECTION
      ?auto_400865 - MODE
      ?auto_400866 - DIRECTION
      ?auto_400863 - MODE
      ?auto_400867 - DIRECTION
      ?auto_400868 - MODE
      ?auto_400869 - DIRECTION
      ?auto_400870 - MODE
    )
    :vars
    (
      ?auto_400871 - INSTRUMENT
      ?auto_400873 - SATELLITE
      ?auto_400874 - DIRECTION
      ?auto_400872 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_400871 ?auto_400873 ) ( SUPPORTS ?auto_400871 ?auto_400865 ) ( not ( = ?auto_400864 ?auto_400874 ) ) ( HAVE_IMAGE ?auto_400867 ?auto_400863 ) ( not ( = ?auto_400867 ?auto_400864 ) ) ( not ( = ?auto_400867 ?auto_400874 ) ) ( not ( = ?auto_400863 ?auto_400865 ) ) ( CALIBRATION_TARGET ?auto_400871 ?auto_400874 ) ( not ( = ?auto_400874 ?auto_400869 ) ) ( not ( = ?auto_400864 ?auto_400869 ) ) ( not ( = ?auto_400867 ?auto_400869 ) ) ( ON_BOARD ?auto_400872 ?auto_400873 ) ( POWER_ON ?auto_400872 ) ( not ( = ?auto_400871 ?auto_400872 ) ) ( POINTING ?auto_400873 ?auto_400874 ) ( HAVE_IMAGE ?auto_400866 ?auto_400863 ) ( HAVE_IMAGE ?auto_400867 ?auto_400868 ) ( HAVE_IMAGE ?auto_400869 ?auto_400870 ) ( not ( = ?auto_400864 ?auto_400866 ) ) ( not ( = ?auto_400865 ?auto_400868 ) ) ( not ( = ?auto_400865 ?auto_400870 ) ) ( not ( = ?auto_400866 ?auto_400867 ) ) ( not ( = ?auto_400866 ?auto_400869 ) ) ( not ( = ?auto_400866 ?auto_400874 ) ) ( not ( = ?auto_400863 ?auto_400868 ) ) ( not ( = ?auto_400863 ?auto_400870 ) ) ( not ( = ?auto_400868 ?auto_400870 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_400867 ?auto_400863 ?auto_400864 ?auto_400865 )
      ( GET-4IMAGE-VERIFY ?auto_400864 ?auto_400865 ?auto_400866 ?auto_400863 ?auto_400867 ?auto_400868 ?auto_400869 ?auto_400870 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_401052 - DIRECTION
      ?auto_401053 - MODE
      ?auto_401054 - DIRECTION
      ?auto_401051 - MODE
      ?auto_401055 - DIRECTION
      ?auto_401056 - MODE
      ?auto_401057 - DIRECTION
      ?auto_401058 - MODE
    )
    :vars
    (
      ?auto_401059 - INSTRUMENT
      ?auto_401061 - SATELLITE
      ?auto_401062 - DIRECTION
      ?auto_401060 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_401059 ?auto_401061 ) ( SUPPORTS ?auto_401059 ?auto_401053 ) ( not ( = ?auto_401052 ?auto_401062 ) ) ( HAVE_IMAGE ?auto_401057 ?auto_401058 ) ( not ( = ?auto_401057 ?auto_401052 ) ) ( not ( = ?auto_401057 ?auto_401062 ) ) ( not ( = ?auto_401058 ?auto_401053 ) ) ( CALIBRATION_TARGET ?auto_401059 ?auto_401062 ) ( not ( = ?auto_401062 ?auto_401054 ) ) ( not ( = ?auto_401052 ?auto_401054 ) ) ( not ( = ?auto_401057 ?auto_401054 ) ) ( ON_BOARD ?auto_401060 ?auto_401061 ) ( POWER_ON ?auto_401060 ) ( not ( = ?auto_401059 ?auto_401060 ) ) ( POINTING ?auto_401061 ?auto_401062 ) ( HAVE_IMAGE ?auto_401054 ?auto_401051 ) ( HAVE_IMAGE ?auto_401055 ?auto_401056 ) ( not ( = ?auto_401052 ?auto_401055 ) ) ( not ( = ?auto_401053 ?auto_401051 ) ) ( not ( = ?auto_401053 ?auto_401056 ) ) ( not ( = ?auto_401054 ?auto_401055 ) ) ( not ( = ?auto_401051 ?auto_401056 ) ) ( not ( = ?auto_401051 ?auto_401058 ) ) ( not ( = ?auto_401055 ?auto_401057 ) ) ( not ( = ?auto_401055 ?auto_401062 ) ) ( not ( = ?auto_401056 ?auto_401058 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_401057 ?auto_401058 ?auto_401052 ?auto_401053 )
      ( GET-4IMAGE-VERIFY ?auto_401052 ?auto_401053 ?auto_401054 ?auto_401051 ?auto_401055 ?auto_401056 ?auto_401057 ?auto_401058 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_398291 - DIRECTION
      ?auto_398292 - MODE
      ?auto_398293 - DIRECTION
      ?auto_398290 - MODE
      ?auto_398294 - DIRECTION
      ?auto_398295 - MODE
      ?auto_398296 - DIRECTION
      ?auto_398297 - MODE
    )
    :vars
    (
      ?auto_398302 - INSTRUMENT
      ?auto_398298 - SATELLITE
      ?auto_398299 - DIRECTION
      ?auto_398301 - DIRECTION
      ?auto_398300 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_398302 ?auto_398298 ) ( SUPPORTS ?auto_398302 ?auto_398292 ) ( not ( = ?auto_398291 ?auto_398299 ) ) ( HAVE_IMAGE ?auto_398294 ?auto_398297 ) ( not ( = ?auto_398294 ?auto_398291 ) ) ( not ( = ?auto_398294 ?auto_398299 ) ) ( not ( = ?auto_398297 ?auto_398292 ) ) ( CALIBRATION_TARGET ?auto_398302 ?auto_398299 ) ( not ( = ?auto_398299 ?auto_398301 ) ) ( not ( = ?auto_398291 ?auto_398301 ) ) ( not ( = ?auto_398294 ?auto_398301 ) ) ( ON_BOARD ?auto_398300 ?auto_398298 ) ( POWER_ON ?auto_398300 ) ( not ( = ?auto_398302 ?auto_398300 ) ) ( POINTING ?auto_398298 ?auto_398299 ) ( HAVE_IMAGE ?auto_398293 ?auto_398290 ) ( HAVE_IMAGE ?auto_398294 ?auto_398295 ) ( HAVE_IMAGE ?auto_398296 ?auto_398297 ) ( not ( = ?auto_398291 ?auto_398293 ) ) ( not ( = ?auto_398291 ?auto_398296 ) ) ( not ( = ?auto_398292 ?auto_398290 ) ) ( not ( = ?auto_398292 ?auto_398295 ) ) ( not ( = ?auto_398293 ?auto_398294 ) ) ( not ( = ?auto_398293 ?auto_398296 ) ) ( not ( = ?auto_398293 ?auto_398299 ) ) ( not ( = ?auto_398293 ?auto_398301 ) ) ( not ( = ?auto_398290 ?auto_398295 ) ) ( not ( = ?auto_398290 ?auto_398297 ) ) ( not ( = ?auto_398294 ?auto_398296 ) ) ( not ( = ?auto_398295 ?auto_398297 ) ) ( not ( = ?auto_398296 ?auto_398299 ) ) ( not ( = ?auto_398296 ?auto_398301 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_398294 ?auto_398297 ?auto_398291 ?auto_398292 )
      ( GET-4IMAGE-VERIFY ?auto_398291 ?auto_398292 ?auto_398293 ?auto_398290 ?auto_398294 ?auto_398295 ?auto_398296 ?auto_398297 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_401064 - DIRECTION
      ?auto_401065 - MODE
      ?auto_401066 - DIRECTION
      ?auto_401063 - MODE
      ?auto_401067 - DIRECTION
      ?auto_401068 - MODE
      ?auto_401069 - DIRECTION
      ?auto_401070 - MODE
    )
    :vars
    (
      ?auto_401071 - INSTRUMENT
      ?auto_401073 - SATELLITE
      ?auto_401074 - DIRECTION
      ?auto_401072 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_401071 ?auto_401073 ) ( SUPPORTS ?auto_401071 ?auto_401065 ) ( not ( = ?auto_401064 ?auto_401074 ) ) ( HAVE_IMAGE ?auto_401067 ?auto_401068 ) ( not ( = ?auto_401067 ?auto_401064 ) ) ( not ( = ?auto_401067 ?auto_401074 ) ) ( not ( = ?auto_401068 ?auto_401065 ) ) ( CALIBRATION_TARGET ?auto_401071 ?auto_401074 ) ( not ( = ?auto_401074 ?auto_401066 ) ) ( not ( = ?auto_401064 ?auto_401066 ) ) ( not ( = ?auto_401067 ?auto_401066 ) ) ( ON_BOARD ?auto_401072 ?auto_401073 ) ( POWER_ON ?auto_401072 ) ( not ( = ?auto_401071 ?auto_401072 ) ) ( POINTING ?auto_401073 ?auto_401074 ) ( HAVE_IMAGE ?auto_401066 ?auto_401063 ) ( HAVE_IMAGE ?auto_401069 ?auto_401070 ) ( not ( = ?auto_401064 ?auto_401069 ) ) ( not ( = ?auto_401065 ?auto_401063 ) ) ( not ( = ?auto_401065 ?auto_401070 ) ) ( not ( = ?auto_401066 ?auto_401069 ) ) ( not ( = ?auto_401063 ?auto_401068 ) ) ( not ( = ?auto_401063 ?auto_401070 ) ) ( not ( = ?auto_401067 ?auto_401069 ) ) ( not ( = ?auto_401068 ?auto_401070 ) ) ( not ( = ?auto_401069 ?auto_401074 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_401067 ?auto_401068 ?auto_401064 ?auto_401065 )
      ( GET-4IMAGE-VERIFY ?auto_401064 ?auto_401065 ?auto_401066 ?auto_401063 ?auto_401067 ?auto_401068 ?auto_401069 ?auto_401070 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_401112 - DIRECTION
      ?auto_401113 - MODE
      ?auto_401114 - DIRECTION
      ?auto_401111 - MODE
      ?auto_401115 - DIRECTION
      ?auto_401116 - MODE
      ?auto_401117 - DIRECTION
      ?auto_401118 - MODE
    )
    :vars
    (
      ?auto_401120 - INSTRUMENT
      ?auto_401123 - SATELLITE
      ?auto_401124 - DIRECTION
      ?auto_401122 - DIRECTION
      ?auto_401119 - MODE
      ?auto_401121 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_401120 ?auto_401123 ) ( SUPPORTS ?auto_401120 ?auto_401113 ) ( not ( = ?auto_401112 ?auto_401124 ) ) ( HAVE_IMAGE ?auto_401122 ?auto_401119 ) ( not ( = ?auto_401122 ?auto_401112 ) ) ( not ( = ?auto_401122 ?auto_401124 ) ) ( not ( = ?auto_401119 ?auto_401113 ) ) ( CALIBRATION_TARGET ?auto_401120 ?auto_401124 ) ( not ( = ?auto_401124 ?auto_401117 ) ) ( not ( = ?auto_401112 ?auto_401117 ) ) ( not ( = ?auto_401122 ?auto_401117 ) ) ( ON_BOARD ?auto_401121 ?auto_401123 ) ( POWER_ON ?auto_401121 ) ( not ( = ?auto_401120 ?auto_401121 ) ) ( POINTING ?auto_401123 ?auto_401124 ) ( HAVE_IMAGE ?auto_401114 ?auto_401111 ) ( HAVE_IMAGE ?auto_401115 ?auto_401116 ) ( HAVE_IMAGE ?auto_401117 ?auto_401118 ) ( not ( = ?auto_401112 ?auto_401114 ) ) ( not ( = ?auto_401112 ?auto_401115 ) ) ( not ( = ?auto_401113 ?auto_401111 ) ) ( not ( = ?auto_401113 ?auto_401116 ) ) ( not ( = ?auto_401113 ?auto_401118 ) ) ( not ( = ?auto_401114 ?auto_401115 ) ) ( not ( = ?auto_401114 ?auto_401117 ) ) ( not ( = ?auto_401114 ?auto_401124 ) ) ( not ( = ?auto_401114 ?auto_401122 ) ) ( not ( = ?auto_401111 ?auto_401116 ) ) ( not ( = ?auto_401111 ?auto_401118 ) ) ( not ( = ?auto_401111 ?auto_401119 ) ) ( not ( = ?auto_401115 ?auto_401117 ) ) ( not ( = ?auto_401115 ?auto_401124 ) ) ( not ( = ?auto_401115 ?auto_401122 ) ) ( not ( = ?auto_401116 ?auto_401118 ) ) ( not ( = ?auto_401116 ?auto_401119 ) ) ( not ( = ?auto_401118 ?auto_401119 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_401122 ?auto_401119 ?auto_401112 ?auto_401113 )
      ( GET-4IMAGE-VERIFY ?auto_401112 ?auto_401113 ?auto_401114 ?auto_401111 ?auto_401115 ?auto_401116 ?auto_401117 ?auto_401118 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_398990 - DIRECTION
      ?auto_398991 - MODE
      ?auto_398992 - DIRECTION
      ?auto_398989 - MODE
      ?auto_398993 - DIRECTION
      ?auto_398994 - MODE
    )
    :vars
    (
      ?auto_398995 - INSTRUMENT
      ?auto_398998 - SATELLITE
      ?auto_398999 - DIRECTION
      ?auto_398996 - DIRECTION
      ?auto_398997 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_398995 ?auto_398998 ) ( SUPPORTS ?auto_398995 ?auto_398994 ) ( not ( = ?auto_398993 ?auto_398999 ) ) ( HAVE_IMAGE ?auto_398990 ?auto_398989 ) ( not ( = ?auto_398990 ?auto_398993 ) ) ( not ( = ?auto_398990 ?auto_398999 ) ) ( not ( = ?auto_398989 ?auto_398994 ) ) ( CALIBRATION_TARGET ?auto_398995 ?auto_398999 ) ( not ( = ?auto_398999 ?auto_398996 ) ) ( not ( = ?auto_398993 ?auto_398996 ) ) ( not ( = ?auto_398990 ?auto_398996 ) ) ( ON_BOARD ?auto_398997 ?auto_398998 ) ( POWER_ON ?auto_398997 ) ( not ( = ?auto_398995 ?auto_398997 ) ) ( POINTING ?auto_398998 ?auto_398999 ) ( HAVE_IMAGE ?auto_398990 ?auto_398991 ) ( HAVE_IMAGE ?auto_398992 ?auto_398989 ) ( not ( = ?auto_398990 ?auto_398992 ) ) ( not ( = ?auto_398991 ?auto_398989 ) ) ( not ( = ?auto_398991 ?auto_398994 ) ) ( not ( = ?auto_398992 ?auto_398993 ) ) ( not ( = ?auto_398992 ?auto_398999 ) ) ( not ( = ?auto_398992 ?auto_398996 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_398990 ?auto_398989 ?auto_398993 ?auto_398994 )
      ( GET-3IMAGE-VERIFY ?auto_398990 ?auto_398991 ?auto_398992 ?auto_398989 ?auto_398993 ?auto_398994 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_399667 - DIRECTION
      ?auto_399668 - MODE
      ?auto_399669 - DIRECTION
      ?auto_399666 - MODE
      ?auto_399670 - DIRECTION
      ?auto_399671 - MODE
      ?auto_399672 - DIRECTION
      ?auto_399673 - MODE
    )
    :vars
    (
      ?auto_399674 - INSTRUMENT
      ?auto_399677 - SATELLITE
      ?auto_399678 - DIRECTION
      ?auto_399675 - DIRECTION
      ?auto_399676 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_399674 ?auto_399677 ) ( SUPPORTS ?auto_399674 ?auto_399666 ) ( not ( = ?auto_399669 ?auto_399678 ) ) ( HAVE_IMAGE ?auto_399670 ?auto_399668 ) ( not ( = ?auto_399670 ?auto_399669 ) ) ( not ( = ?auto_399670 ?auto_399678 ) ) ( not ( = ?auto_399668 ?auto_399666 ) ) ( CALIBRATION_TARGET ?auto_399674 ?auto_399678 ) ( not ( = ?auto_399678 ?auto_399675 ) ) ( not ( = ?auto_399669 ?auto_399675 ) ) ( not ( = ?auto_399670 ?auto_399675 ) ) ( ON_BOARD ?auto_399676 ?auto_399677 ) ( POWER_ON ?auto_399676 ) ( not ( = ?auto_399674 ?auto_399676 ) ) ( POINTING ?auto_399677 ?auto_399678 ) ( HAVE_IMAGE ?auto_399667 ?auto_399668 ) ( HAVE_IMAGE ?auto_399670 ?auto_399671 ) ( HAVE_IMAGE ?auto_399672 ?auto_399673 ) ( not ( = ?auto_399667 ?auto_399669 ) ) ( not ( = ?auto_399667 ?auto_399670 ) ) ( not ( = ?auto_399667 ?auto_399672 ) ) ( not ( = ?auto_399667 ?auto_399678 ) ) ( not ( = ?auto_399667 ?auto_399675 ) ) ( not ( = ?auto_399668 ?auto_399671 ) ) ( not ( = ?auto_399668 ?auto_399673 ) ) ( not ( = ?auto_399669 ?auto_399672 ) ) ( not ( = ?auto_399666 ?auto_399671 ) ) ( not ( = ?auto_399666 ?auto_399673 ) ) ( not ( = ?auto_399670 ?auto_399672 ) ) ( not ( = ?auto_399671 ?auto_399673 ) ) ( not ( = ?auto_399672 ?auto_399678 ) ) ( not ( = ?auto_399672 ?auto_399675 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_399670 ?auto_399668 ?auto_399669 ?auto_399666 )
      ( GET-4IMAGE-VERIFY ?auto_399667 ?auto_399668 ?auto_399669 ?auto_399666 ?auto_399670 ?auto_399671 ?auto_399672 ?auto_399673 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_400902 - DIRECTION
      ?auto_400903 - MODE
      ?auto_400904 - DIRECTION
      ?auto_400901 - MODE
      ?auto_400905 - DIRECTION
      ?auto_400906 - MODE
      ?auto_400907 - DIRECTION
      ?auto_400908 - MODE
    )
    :vars
    (
      ?auto_400909 - INSTRUMENT
      ?auto_400911 - SATELLITE
      ?auto_400912 - DIRECTION
      ?auto_400910 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_400909 ?auto_400911 ) ( SUPPORTS ?auto_400909 ?auto_400903 ) ( not ( = ?auto_400902 ?auto_400912 ) ) ( HAVE_IMAGE ?auto_400907 ?auto_400901 ) ( not ( = ?auto_400907 ?auto_400902 ) ) ( not ( = ?auto_400907 ?auto_400912 ) ) ( not ( = ?auto_400901 ?auto_400903 ) ) ( CALIBRATION_TARGET ?auto_400909 ?auto_400912 ) ( not ( = ?auto_400912 ?auto_400905 ) ) ( not ( = ?auto_400902 ?auto_400905 ) ) ( not ( = ?auto_400907 ?auto_400905 ) ) ( ON_BOARD ?auto_400910 ?auto_400911 ) ( POWER_ON ?auto_400910 ) ( not ( = ?auto_400909 ?auto_400910 ) ) ( POINTING ?auto_400911 ?auto_400912 ) ( HAVE_IMAGE ?auto_400904 ?auto_400901 ) ( HAVE_IMAGE ?auto_400905 ?auto_400906 ) ( HAVE_IMAGE ?auto_400907 ?auto_400908 ) ( not ( = ?auto_400902 ?auto_400904 ) ) ( not ( = ?auto_400903 ?auto_400906 ) ) ( not ( = ?auto_400903 ?auto_400908 ) ) ( not ( = ?auto_400904 ?auto_400905 ) ) ( not ( = ?auto_400904 ?auto_400907 ) ) ( not ( = ?auto_400904 ?auto_400912 ) ) ( not ( = ?auto_400901 ?auto_400906 ) ) ( not ( = ?auto_400901 ?auto_400908 ) ) ( not ( = ?auto_400906 ?auto_400908 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_400907 ?auto_400901 ?auto_400902 ?auto_400903 )
      ( GET-4IMAGE-VERIFY ?auto_400902 ?auto_400903 ?auto_400904 ?auto_400901 ?auto_400905 ?auto_400906 ?auto_400907 ?auto_400908 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_401769 - DIRECTION
      ?auto_401770 - MODE
      ?auto_401771 - DIRECTION
      ?auto_401768 - MODE
      ?auto_401772 - DIRECTION
      ?auto_401773 - MODE
    )
    :vars
    (
      ?auto_401775 - INSTRUMENT
      ?auto_401774 - SATELLITE
      ?auto_401776 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_401775 ?auto_401774 ) ( SUPPORTS ?auto_401775 ?auto_401768 ) ( POINTING ?auto_401774 ?auto_401776 ) ( not ( = ?auto_401771 ?auto_401776 ) ) ( HAVE_IMAGE ?auto_401769 ?auto_401773 ) ( not ( = ?auto_401769 ?auto_401771 ) ) ( not ( = ?auto_401769 ?auto_401776 ) ) ( not ( = ?auto_401773 ?auto_401768 ) ) ( CALIBRATION_TARGET ?auto_401775 ?auto_401776 ) ( POWER_AVAIL ?auto_401774 ) ( HAVE_IMAGE ?auto_401769 ?auto_401770 ) ( HAVE_IMAGE ?auto_401772 ?auto_401773 ) ( not ( = ?auto_401769 ?auto_401772 ) ) ( not ( = ?auto_401770 ?auto_401768 ) ) ( not ( = ?auto_401770 ?auto_401773 ) ) ( not ( = ?auto_401771 ?auto_401772 ) ) ( not ( = ?auto_401772 ?auto_401776 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_401769 ?auto_401773 ?auto_401771 ?auto_401768 )
      ( GET-3IMAGE-VERIFY ?auto_401769 ?auto_401770 ?auto_401771 ?auto_401768 ?auto_401772 ?auto_401773 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_404201 - DIRECTION
      ?auto_404202 - MODE
      ?auto_404203 - DIRECTION
      ?auto_404200 - MODE
      ?auto_404204 - DIRECTION
      ?auto_404205 - MODE
    )
    :vars
    (
      ?auto_404206 - INSTRUMENT
      ?auto_404208 - SATELLITE
      ?auto_404209 - DIRECTION
      ?auto_404207 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_404206 ?auto_404208 ) ( SUPPORTS ?auto_404206 ?auto_404205 ) ( not ( = ?auto_404204 ?auto_404209 ) ) ( HAVE_IMAGE ?auto_404201 ?auto_404200 ) ( not ( = ?auto_404201 ?auto_404204 ) ) ( not ( = ?auto_404201 ?auto_404209 ) ) ( not ( = ?auto_404200 ?auto_404205 ) ) ( CALIBRATION_TARGET ?auto_404206 ?auto_404209 ) ( POWER_AVAIL ?auto_404208 ) ( POINTING ?auto_404208 ?auto_404207 ) ( not ( = ?auto_404209 ?auto_404207 ) ) ( not ( = ?auto_404204 ?auto_404207 ) ) ( not ( = ?auto_404201 ?auto_404207 ) ) ( HAVE_IMAGE ?auto_404201 ?auto_404202 ) ( HAVE_IMAGE ?auto_404203 ?auto_404200 ) ( not ( = ?auto_404201 ?auto_404203 ) ) ( not ( = ?auto_404202 ?auto_404200 ) ) ( not ( = ?auto_404202 ?auto_404205 ) ) ( not ( = ?auto_404203 ?auto_404204 ) ) ( not ( = ?auto_404203 ?auto_404209 ) ) ( not ( = ?auto_404203 ?auto_404207 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_404201 ?auto_404200 ?auto_404204 ?auto_404205 )
      ( GET-3IMAGE-VERIFY ?auto_404201 ?auto_404202 ?auto_404203 ?auto_404200 ?auto_404204 ?auto_404205 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_404227 - DIRECTION
      ?auto_404228 - MODE
      ?auto_404229 - DIRECTION
      ?auto_404226 - MODE
      ?auto_404230 - DIRECTION
      ?auto_404231 - MODE
    )
    :vars
    (
      ?auto_404232 - INSTRUMENT
      ?auto_404234 - SATELLITE
      ?auto_404235 - DIRECTION
      ?auto_404233 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_404232 ?auto_404234 ) ( SUPPORTS ?auto_404232 ?auto_404226 ) ( not ( = ?auto_404229 ?auto_404235 ) ) ( HAVE_IMAGE ?auto_404227 ?auto_404231 ) ( not ( = ?auto_404227 ?auto_404229 ) ) ( not ( = ?auto_404227 ?auto_404235 ) ) ( not ( = ?auto_404231 ?auto_404226 ) ) ( CALIBRATION_TARGET ?auto_404232 ?auto_404235 ) ( POWER_AVAIL ?auto_404234 ) ( POINTING ?auto_404234 ?auto_404233 ) ( not ( = ?auto_404235 ?auto_404233 ) ) ( not ( = ?auto_404229 ?auto_404233 ) ) ( not ( = ?auto_404227 ?auto_404233 ) ) ( HAVE_IMAGE ?auto_404227 ?auto_404228 ) ( HAVE_IMAGE ?auto_404230 ?auto_404231 ) ( not ( = ?auto_404227 ?auto_404230 ) ) ( not ( = ?auto_404228 ?auto_404226 ) ) ( not ( = ?auto_404228 ?auto_404231 ) ) ( not ( = ?auto_404229 ?auto_404230 ) ) ( not ( = ?auto_404230 ?auto_404235 ) ) ( not ( = ?auto_404230 ?auto_404233 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_404227 ?auto_404231 ?auto_404229 ?auto_404226 )
      ( GET-3IMAGE-VERIFY ?auto_404227 ?auto_404228 ?auto_404229 ?auto_404226 ?auto_404230 ?auto_404231 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_404573 - DIRECTION
      ?auto_404574 - MODE
      ?auto_404575 - DIRECTION
      ?auto_404572 - MODE
      ?auto_404576 - DIRECTION
      ?auto_404577 - MODE
      ?auto_404578 - DIRECTION
      ?auto_404579 - MODE
    )
    :vars
    (
      ?auto_404580 - INSTRUMENT
      ?auto_404582 - SATELLITE
      ?auto_404583 - DIRECTION
      ?auto_404581 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_404580 ?auto_404582 ) ( SUPPORTS ?auto_404580 ?auto_404579 ) ( not ( = ?auto_404578 ?auto_404583 ) ) ( HAVE_IMAGE ?auto_404575 ?auto_404574 ) ( not ( = ?auto_404575 ?auto_404578 ) ) ( not ( = ?auto_404575 ?auto_404583 ) ) ( not ( = ?auto_404574 ?auto_404579 ) ) ( CALIBRATION_TARGET ?auto_404580 ?auto_404583 ) ( POWER_AVAIL ?auto_404582 ) ( POINTING ?auto_404582 ?auto_404581 ) ( not ( = ?auto_404583 ?auto_404581 ) ) ( not ( = ?auto_404578 ?auto_404581 ) ) ( not ( = ?auto_404575 ?auto_404581 ) ) ( HAVE_IMAGE ?auto_404573 ?auto_404574 ) ( HAVE_IMAGE ?auto_404575 ?auto_404572 ) ( HAVE_IMAGE ?auto_404576 ?auto_404577 ) ( not ( = ?auto_404573 ?auto_404575 ) ) ( not ( = ?auto_404573 ?auto_404576 ) ) ( not ( = ?auto_404573 ?auto_404578 ) ) ( not ( = ?auto_404573 ?auto_404583 ) ) ( not ( = ?auto_404573 ?auto_404581 ) ) ( not ( = ?auto_404574 ?auto_404572 ) ) ( not ( = ?auto_404574 ?auto_404577 ) ) ( not ( = ?auto_404575 ?auto_404576 ) ) ( not ( = ?auto_404572 ?auto_404577 ) ) ( not ( = ?auto_404572 ?auto_404579 ) ) ( not ( = ?auto_404576 ?auto_404578 ) ) ( not ( = ?auto_404576 ?auto_404583 ) ) ( not ( = ?auto_404576 ?auto_404581 ) ) ( not ( = ?auto_404577 ?auto_404579 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_404575 ?auto_404574 ?auto_404578 ?auto_404579 )
      ( GET-4IMAGE-VERIFY ?auto_404573 ?auto_404574 ?auto_404575 ?auto_404572 ?auto_404576 ?auto_404577 ?auto_404578 ?auto_404579 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_404585 - DIRECTION
      ?auto_404586 - MODE
      ?auto_404587 - DIRECTION
      ?auto_404584 - MODE
      ?auto_404588 - DIRECTION
      ?auto_404589 - MODE
      ?auto_404590 - DIRECTION
      ?auto_404591 - MODE
    )
    :vars
    (
      ?auto_404592 - INSTRUMENT
      ?auto_404593 - SATELLITE
      ?auto_404594 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_404592 ?auto_404593 ) ( SUPPORTS ?auto_404592 ?auto_404591 ) ( not ( = ?auto_404590 ?auto_404594 ) ) ( HAVE_IMAGE ?auto_404587 ?auto_404586 ) ( not ( = ?auto_404587 ?auto_404590 ) ) ( not ( = ?auto_404587 ?auto_404594 ) ) ( not ( = ?auto_404586 ?auto_404591 ) ) ( CALIBRATION_TARGET ?auto_404592 ?auto_404594 ) ( POWER_AVAIL ?auto_404593 ) ( POINTING ?auto_404593 ?auto_404588 ) ( not ( = ?auto_404594 ?auto_404588 ) ) ( not ( = ?auto_404590 ?auto_404588 ) ) ( not ( = ?auto_404587 ?auto_404588 ) ) ( HAVE_IMAGE ?auto_404585 ?auto_404586 ) ( HAVE_IMAGE ?auto_404587 ?auto_404584 ) ( HAVE_IMAGE ?auto_404588 ?auto_404589 ) ( not ( = ?auto_404585 ?auto_404587 ) ) ( not ( = ?auto_404585 ?auto_404588 ) ) ( not ( = ?auto_404585 ?auto_404590 ) ) ( not ( = ?auto_404585 ?auto_404594 ) ) ( not ( = ?auto_404586 ?auto_404584 ) ) ( not ( = ?auto_404586 ?auto_404589 ) ) ( not ( = ?auto_404584 ?auto_404589 ) ) ( not ( = ?auto_404584 ?auto_404591 ) ) ( not ( = ?auto_404589 ?auto_404591 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_404587 ?auto_404586 ?auto_404590 ?auto_404591 )
      ( GET-4IMAGE-VERIFY ?auto_404585 ?auto_404586 ?auto_404587 ?auto_404584 ?auto_404588 ?auto_404589 ?auto_404590 ?auto_404591 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_404655 - DIRECTION
      ?auto_404656 - MODE
      ?auto_404657 - DIRECTION
      ?auto_404654 - MODE
      ?auto_404658 - DIRECTION
      ?auto_404659 - MODE
      ?auto_404660 - DIRECTION
      ?auto_404661 - MODE
    )
    :vars
    (
      ?auto_404662 - INSTRUMENT
      ?auto_404663 - SATELLITE
      ?auto_404664 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_404662 ?auto_404663 ) ( SUPPORTS ?auto_404662 ?auto_404661 ) ( not ( = ?auto_404660 ?auto_404664 ) ) ( HAVE_IMAGE ?auto_404655 ?auto_404659 ) ( not ( = ?auto_404655 ?auto_404660 ) ) ( not ( = ?auto_404655 ?auto_404664 ) ) ( not ( = ?auto_404659 ?auto_404661 ) ) ( CALIBRATION_TARGET ?auto_404662 ?auto_404664 ) ( POWER_AVAIL ?auto_404663 ) ( POINTING ?auto_404663 ?auto_404657 ) ( not ( = ?auto_404664 ?auto_404657 ) ) ( not ( = ?auto_404660 ?auto_404657 ) ) ( not ( = ?auto_404655 ?auto_404657 ) ) ( HAVE_IMAGE ?auto_404655 ?auto_404656 ) ( HAVE_IMAGE ?auto_404657 ?auto_404654 ) ( HAVE_IMAGE ?auto_404658 ?auto_404659 ) ( not ( = ?auto_404655 ?auto_404658 ) ) ( not ( = ?auto_404656 ?auto_404654 ) ) ( not ( = ?auto_404656 ?auto_404659 ) ) ( not ( = ?auto_404656 ?auto_404661 ) ) ( not ( = ?auto_404657 ?auto_404658 ) ) ( not ( = ?auto_404654 ?auto_404659 ) ) ( not ( = ?auto_404654 ?auto_404661 ) ) ( not ( = ?auto_404658 ?auto_404660 ) ) ( not ( = ?auto_404658 ?auto_404664 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_404655 ?auto_404659 ?auto_404660 ?auto_404661 )
      ( GET-4IMAGE-VERIFY ?auto_404655 ?auto_404656 ?auto_404657 ?auto_404654 ?auto_404658 ?auto_404659 ?auto_404660 ?auto_404661 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_404688 - DIRECTION
      ?auto_404689 - MODE
      ?auto_404690 - DIRECTION
      ?auto_404687 - MODE
      ?auto_404691 - DIRECTION
      ?auto_404692 - MODE
      ?auto_404693 - DIRECTION
      ?auto_404694 - MODE
    )
    :vars
    (
      ?auto_404695 - INSTRUMENT
      ?auto_404696 - SATELLITE
      ?auto_404697 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_404695 ?auto_404696 ) ( SUPPORTS ?auto_404695 ?auto_404692 ) ( not ( = ?auto_404691 ?auto_404697 ) ) ( HAVE_IMAGE ?auto_404693 ?auto_404694 ) ( not ( = ?auto_404693 ?auto_404691 ) ) ( not ( = ?auto_404693 ?auto_404697 ) ) ( not ( = ?auto_404694 ?auto_404692 ) ) ( CALIBRATION_TARGET ?auto_404695 ?auto_404697 ) ( POWER_AVAIL ?auto_404696 ) ( POINTING ?auto_404696 ?auto_404690 ) ( not ( = ?auto_404697 ?auto_404690 ) ) ( not ( = ?auto_404691 ?auto_404690 ) ) ( not ( = ?auto_404693 ?auto_404690 ) ) ( HAVE_IMAGE ?auto_404688 ?auto_404689 ) ( HAVE_IMAGE ?auto_404690 ?auto_404687 ) ( not ( = ?auto_404688 ?auto_404690 ) ) ( not ( = ?auto_404688 ?auto_404691 ) ) ( not ( = ?auto_404688 ?auto_404693 ) ) ( not ( = ?auto_404688 ?auto_404697 ) ) ( not ( = ?auto_404689 ?auto_404687 ) ) ( not ( = ?auto_404689 ?auto_404692 ) ) ( not ( = ?auto_404689 ?auto_404694 ) ) ( not ( = ?auto_404687 ?auto_404692 ) ) ( not ( = ?auto_404687 ?auto_404694 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_404693 ?auto_404694 ?auto_404691 ?auto_404692 )
      ( GET-4IMAGE-VERIFY ?auto_404688 ?auto_404689 ?auto_404690 ?auto_404687 ?auto_404691 ?auto_404692 ?auto_404693 ?auto_404694 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_404861 - DIRECTION
      ?auto_404862 - MODE
      ?auto_404863 - DIRECTION
      ?auto_404860 - MODE
      ?auto_404864 - DIRECTION
      ?auto_404865 - MODE
      ?auto_404866 - DIRECTION
      ?auto_404867 - MODE
    )
    :vars
    (
      ?auto_404868 - INSTRUMENT
      ?auto_404869 - SATELLITE
      ?auto_404870 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_404868 ?auto_404869 ) ( SUPPORTS ?auto_404868 ?auto_404860 ) ( not ( = ?auto_404863 ?auto_404870 ) ) ( HAVE_IMAGE ?auto_404861 ?auto_404867 ) ( not ( = ?auto_404861 ?auto_404863 ) ) ( not ( = ?auto_404861 ?auto_404870 ) ) ( not ( = ?auto_404867 ?auto_404860 ) ) ( CALIBRATION_TARGET ?auto_404868 ?auto_404870 ) ( POWER_AVAIL ?auto_404869 ) ( POINTING ?auto_404869 ?auto_404864 ) ( not ( = ?auto_404870 ?auto_404864 ) ) ( not ( = ?auto_404863 ?auto_404864 ) ) ( not ( = ?auto_404861 ?auto_404864 ) ) ( HAVE_IMAGE ?auto_404861 ?auto_404862 ) ( HAVE_IMAGE ?auto_404864 ?auto_404865 ) ( HAVE_IMAGE ?auto_404866 ?auto_404867 ) ( not ( = ?auto_404861 ?auto_404866 ) ) ( not ( = ?auto_404862 ?auto_404860 ) ) ( not ( = ?auto_404862 ?auto_404865 ) ) ( not ( = ?auto_404862 ?auto_404867 ) ) ( not ( = ?auto_404863 ?auto_404866 ) ) ( not ( = ?auto_404860 ?auto_404865 ) ) ( not ( = ?auto_404864 ?auto_404866 ) ) ( not ( = ?auto_404865 ?auto_404867 ) ) ( not ( = ?auto_404866 ?auto_404870 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_404861 ?auto_404867 ?auto_404863 ?auto_404860 )
      ( GET-4IMAGE-VERIFY ?auto_404861 ?auto_404862 ?auto_404863 ?auto_404860 ?auto_404864 ?auto_404865 ?auto_404866 ?auto_404867 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_405032 - DIRECTION
      ?auto_405033 - MODE
      ?auto_405034 - DIRECTION
      ?auto_405031 - MODE
      ?auto_405035 - DIRECTION
      ?auto_405036 - MODE
      ?auto_405037 - DIRECTION
      ?auto_405038 - MODE
    )
    :vars
    (
      ?auto_405039 - INSTRUMENT
      ?auto_405040 - SATELLITE
      ?auto_405041 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_405039 ?auto_405040 ) ( SUPPORTS ?auto_405039 ?auto_405036 ) ( not ( = ?auto_405035 ?auto_405041 ) ) ( HAVE_IMAGE ?auto_405037 ?auto_405031 ) ( not ( = ?auto_405037 ?auto_405035 ) ) ( not ( = ?auto_405037 ?auto_405041 ) ) ( not ( = ?auto_405031 ?auto_405036 ) ) ( CALIBRATION_TARGET ?auto_405039 ?auto_405041 ) ( POWER_AVAIL ?auto_405040 ) ( POINTING ?auto_405040 ?auto_405032 ) ( not ( = ?auto_405041 ?auto_405032 ) ) ( not ( = ?auto_405035 ?auto_405032 ) ) ( not ( = ?auto_405037 ?auto_405032 ) ) ( HAVE_IMAGE ?auto_405032 ?auto_405033 ) ( HAVE_IMAGE ?auto_405034 ?auto_405031 ) ( HAVE_IMAGE ?auto_405037 ?auto_405038 ) ( not ( = ?auto_405032 ?auto_405034 ) ) ( not ( = ?auto_405033 ?auto_405031 ) ) ( not ( = ?auto_405033 ?auto_405036 ) ) ( not ( = ?auto_405033 ?auto_405038 ) ) ( not ( = ?auto_405034 ?auto_405035 ) ) ( not ( = ?auto_405034 ?auto_405037 ) ) ( not ( = ?auto_405034 ?auto_405041 ) ) ( not ( = ?auto_405031 ?auto_405038 ) ) ( not ( = ?auto_405036 ?auto_405038 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_405037 ?auto_405031 ?auto_405035 ?auto_405036 )
      ( GET-4IMAGE-VERIFY ?auto_405032 ?auto_405033 ?auto_405034 ?auto_405031 ?auto_405035 ?auto_405036 ?auto_405037 ?auto_405038 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_405250 - DIRECTION
      ?auto_405251 - MODE
      ?auto_405252 - DIRECTION
      ?auto_405249 - MODE
      ?auto_405253 - DIRECTION
      ?auto_405254 - MODE
      ?auto_405255 - DIRECTION
      ?auto_405256 - MODE
    )
    :vars
    (
      ?auto_405257 - INSTRUMENT
      ?auto_405258 - SATELLITE
      ?auto_405259 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_405257 ?auto_405258 ) ( SUPPORTS ?auto_405257 ?auto_405249 ) ( not ( = ?auto_405252 ?auto_405259 ) ) ( HAVE_IMAGE ?auto_405255 ?auto_405254 ) ( not ( = ?auto_405255 ?auto_405252 ) ) ( not ( = ?auto_405255 ?auto_405259 ) ) ( not ( = ?auto_405254 ?auto_405249 ) ) ( CALIBRATION_TARGET ?auto_405257 ?auto_405259 ) ( POWER_AVAIL ?auto_405258 ) ( POINTING ?auto_405258 ?auto_405250 ) ( not ( = ?auto_405259 ?auto_405250 ) ) ( not ( = ?auto_405252 ?auto_405250 ) ) ( not ( = ?auto_405255 ?auto_405250 ) ) ( HAVE_IMAGE ?auto_405250 ?auto_405251 ) ( HAVE_IMAGE ?auto_405253 ?auto_405254 ) ( HAVE_IMAGE ?auto_405255 ?auto_405256 ) ( not ( = ?auto_405250 ?auto_405253 ) ) ( not ( = ?auto_405251 ?auto_405249 ) ) ( not ( = ?auto_405251 ?auto_405254 ) ) ( not ( = ?auto_405251 ?auto_405256 ) ) ( not ( = ?auto_405252 ?auto_405253 ) ) ( not ( = ?auto_405249 ?auto_405256 ) ) ( not ( = ?auto_405253 ?auto_405255 ) ) ( not ( = ?auto_405253 ?auto_405259 ) ) ( not ( = ?auto_405254 ?auto_405256 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_405255 ?auto_405254 ?auto_405252 ?auto_405249 )
      ( GET-4IMAGE-VERIFY ?auto_405250 ?auto_405251 ?auto_405252 ?auto_405249 ?auto_405253 ?auto_405254 ?auto_405255 ?auto_405256 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_405955 - DIRECTION
      ?auto_405956 - MODE
      ?auto_405957 - DIRECTION
      ?auto_405954 - MODE
      ?auto_405958 - DIRECTION
      ?auto_405959 - MODE
      ?auto_405960 - DIRECTION
      ?auto_405961 - MODE
    )
    :vars
    (
      ?auto_405962 - INSTRUMENT
      ?auto_405963 - SATELLITE
      ?auto_405964 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_405962 ?auto_405963 ) ( SUPPORTS ?auto_405962 ?auto_405956 ) ( not ( = ?auto_405955 ?auto_405964 ) ) ( HAVE_IMAGE ?auto_405960 ?auto_405954 ) ( not ( = ?auto_405960 ?auto_405955 ) ) ( not ( = ?auto_405960 ?auto_405964 ) ) ( not ( = ?auto_405954 ?auto_405956 ) ) ( CALIBRATION_TARGET ?auto_405962 ?auto_405964 ) ( POWER_AVAIL ?auto_405963 ) ( POINTING ?auto_405963 ?auto_405958 ) ( not ( = ?auto_405964 ?auto_405958 ) ) ( not ( = ?auto_405955 ?auto_405958 ) ) ( not ( = ?auto_405960 ?auto_405958 ) ) ( HAVE_IMAGE ?auto_405957 ?auto_405954 ) ( HAVE_IMAGE ?auto_405958 ?auto_405959 ) ( HAVE_IMAGE ?auto_405960 ?auto_405961 ) ( not ( = ?auto_405955 ?auto_405957 ) ) ( not ( = ?auto_405956 ?auto_405959 ) ) ( not ( = ?auto_405956 ?auto_405961 ) ) ( not ( = ?auto_405957 ?auto_405958 ) ) ( not ( = ?auto_405957 ?auto_405960 ) ) ( not ( = ?auto_405957 ?auto_405964 ) ) ( not ( = ?auto_405954 ?auto_405959 ) ) ( not ( = ?auto_405954 ?auto_405961 ) ) ( not ( = ?auto_405959 ?auto_405961 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_405960 ?auto_405954 ?auto_405955 ?auto_405956 )
      ( GET-4IMAGE-VERIFY ?auto_405955 ?auto_405956 ?auto_405957 ?auto_405954 ?auto_405958 ?auto_405959 ?auto_405960 ?auto_405961 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_406772 - DIRECTION
      ?auto_406773 - MODE
      ?auto_406774 - DIRECTION
      ?auto_406771 - MODE
      ?auto_406775 - DIRECTION
      ?auto_406776 - MODE
    )
    :vars
    (
      ?auto_406781 - INSTRUMENT
      ?auto_406780 - SATELLITE
      ?auto_406777 - DIRECTION
      ?auto_406779 - DIRECTION
      ?auto_406778 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_406781 ?auto_406780 ) ( SUPPORTS ?auto_406781 ?auto_406771 ) ( not ( = ?auto_406774 ?auto_406777 ) ) ( HAVE_IMAGE ?auto_406772 ?auto_406776 ) ( not ( = ?auto_406772 ?auto_406774 ) ) ( not ( = ?auto_406772 ?auto_406777 ) ) ( not ( = ?auto_406776 ?auto_406771 ) ) ( CALIBRATION_TARGET ?auto_406781 ?auto_406777 ) ( POINTING ?auto_406780 ?auto_406779 ) ( not ( = ?auto_406777 ?auto_406779 ) ) ( not ( = ?auto_406774 ?auto_406779 ) ) ( not ( = ?auto_406772 ?auto_406779 ) ) ( ON_BOARD ?auto_406778 ?auto_406780 ) ( POWER_ON ?auto_406778 ) ( not ( = ?auto_406781 ?auto_406778 ) ) ( HAVE_IMAGE ?auto_406772 ?auto_406773 ) ( HAVE_IMAGE ?auto_406775 ?auto_406776 ) ( not ( = ?auto_406772 ?auto_406775 ) ) ( not ( = ?auto_406773 ?auto_406771 ) ) ( not ( = ?auto_406773 ?auto_406776 ) ) ( not ( = ?auto_406774 ?auto_406775 ) ) ( not ( = ?auto_406775 ?auto_406777 ) ) ( not ( = ?auto_406775 ?auto_406779 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_406772 ?auto_406776 ?auto_406774 ?auto_406771 )
      ( GET-3IMAGE-VERIFY ?auto_406772 ?auto_406773 ?auto_406774 ?auto_406771 ?auto_406775 ?auto_406776 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_407422 - DIRECTION
      ?auto_407423 - MODE
      ?auto_407424 - DIRECTION
      ?auto_407421 - MODE
      ?auto_407425 - DIRECTION
      ?auto_407426 - MODE
      ?auto_407427 - DIRECTION
      ?auto_407428 - MODE
    )
    :vars
    (
      ?auto_407432 - INSTRUMENT
      ?auto_407431 - SATELLITE
      ?auto_407429 - DIRECTION
      ?auto_407430 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_407432 ?auto_407431 ) ( SUPPORTS ?auto_407432 ?auto_407421 ) ( not ( = ?auto_407424 ?auto_407429 ) ) ( HAVE_IMAGE ?auto_407422 ?auto_407423 ) ( not ( = ?auto_407422 ?auto_407424 ) ) ( not ( = ?auto_407422 ?auto_407429 ) ) ( not ( = ?auto_407423 ?auto_407421 ) ) ( CALIBRATION_TARGET ?auto_407432 ?auto_407429 ) ( POINTING ?auto_407431 ?auto_407427 ) ( not ( = ?auto_407429 ?auto_407427 ) ) ( not ( = ?auto_407424 ?auto_407427 ) ) ( not ( = ?auto_407422 ?auto_407427 ) ) ( ON_BOARD ?auto_407430 ?auto_407431 ) ( POWER_ON ?auto_407430 ) ( not ( = ?auto_407432 ?auto_407430 ) ) ( HAVE_IMAGE ?auto_407425 ?auto_407426 ) ( HAVE_IMAGE ?auto_407427 ?auto_407428 ) ( not ( = ?auto_407422 ?auto_407425 ) ) ( not ( = ?auto_407423 ?auto_407426 ) ) ( not ( = ?auto_407423 ?auto_407428 ) ) ( not ( = ?auto_407424 ?auto_407425 ) ) ( not ( = ?auto_407421 ?auto_407426 ) ) ( not ( = ?auto_407421 ?auto_407428 ) ) ( not ( = ?auto_407425 ?auto_407427 ) ) ( not ( = ?auto_407425 ?auto_407429 ) ) ( not ( = ?auto_407426 ?auto_407428 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_407422 ?auto_407423 ?auto_407424 ?auto_407421 )
      ( GET-4IMAGE-VERIFY ?auto_407422 ?auto_407423 ?auto_407424 ?auto_407421 ?auto_407425 ?auto_407426 ?auto_407427 ?auto_407428 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_407610 - DIRECTION
      ?auto_407611 - MODE
      ?auto_407612 - DIRECTION
      ?auto_407609 - MODE
      ?auto_407613 - DIRECTION
      ?auto_407614 - MODE
      ?auto_407615 - DIRECTION
      ?auto_407616 - MODE
    )
    :vars
    (
      ?auto_407620 - INSTRUMENT
      ?auto_407619 - SATELLITE
      ?auto_407617 - DIRECTION
      ?auto_407618 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_407620 ?auto_407619 ) ( SUPPORTS ?auto_407620 ?auto_407616 ) ( not ( = ?auto_407615 ?auto_407617 ) ) ( HAVE_IMAGE ?auto_407613 ?auto_407609 ) ( not ( = ?auto_407613 ?auto_407615 ) ) ( not ( = ?auto_407613 ?auto_407617 ) ) ( not ( = ?auto_407609 ?auto_407616 ) ) ( CALIBRATION_TARGET ?auto_407620 ?auto_407617 ) ( POINTING ?auto_407619 ?auto_407610 ) ( not ( = ?auto_407617 ?auto_407610 ) ) ( not ( = ?auto_407615 ?auto_407610 ) ) ( not ( = ?auto_407613 ?auto_407610 ) ) ( ON_BOARD ?auto_407618 ?auto_407619 ) ( POWER_ON ?auto_407618 ) ( not ( = ?auto_407620 ?auto_407618 ) ) ( HAVE_IMAGE ?auto_407610 ?auto_407611 ) ( HAVE_IMAGE ?auto_407612 ?auto_407609 ) ( HAVE_IMAGE ?auto_407613 ?auto_407614 ) ( not ( = ?auto_407610 ?auto_407612 ) ) ( not ( = ?auto_407611 ?auto_407609 ) ) ( not ( = ?auto_407611 ?auto_407614 ) ) ( not ( = ?auto_407611 ?auto_407616 ) ) ( not ( = ?auto_407612 ?auto_407613 ) ) ( not ( = ?auto_407612 ?auto_407615 ) ) ( not ( = ?auto_407612 ?auto_407617 ) ) ( not ( = ?auto_407609 ?auto_407614 ) ) ( not ( = ?auto_407614 ?auto_407616 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_407613 ?auto_407609 ?auto_407615 ?auto_407616 )
      ( GET-4IMAGE-VERIFY ?auto_407610 ?auto_407611 ?auto_407612 ?auto_407609 ?auto_407613 ?auto_407614 ?auto_407615 ?auto_407616 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_408842 - DIRECTION
      ?auto_408843 - MODE
      ?auto_408844 - DIRECTION
      ?auto_408841 - MODE
      ?auto_408845 - DIRECTION
      ?auto_408846 - MODE
      ?auto_408847 - DIRECTION
      ?auto_408848 - MODE
    )
    :vars
    (
      ?auto_408852 - INSTRUMENT
      ?auto_408851 - SATELLITE
      ?auto_408849 - DIRECTION
      ?auto_408850 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_408852 ?auto_408851 ) ( SUPPORTS ?auto_408852 ?auto_408843 ) ( not ( = ?auto_408842 ?auto_408849 ) ) ( HAVE_IMAGE ?auto_408847 ?auto_408848 ) ( not ( = ?auto_408847 ?auto_408842 ) ) ( not ( = ?auto_408847 ?auto_408849 ) ) ( not ( = ?auto_408848 ?auto_408843 ) ) ( CALIBRATION_TARGET ?auto_408852 ?auto_408849 ) ( POINTING ?auto_408851 ?auto_408844 ) ( not ( = ?auto_408849 ?auto_408844 ) ) ( not ( = ?auto_408842 ?auto_408844 ) ) ( not ( = ?auto_408847 ?auto_408844 ) ) ( ON_BOARD ?auto_408850 ?auto_408851 ) ( POWER_ON ?auto_408850 ) ( not ( = ?auto_408852 ?auto_408850 ) ) ( HAVE_IMAGE ?auto_408844 ?auto_408841 ) ( HAVE_IMAGE ?auto_408845 ?auto_408846 ) ( not ( = ?auto_408842 ?auto_408845 ) ) ( not ( = ?auto_408843 ?auto_408841 ) ) ( not ( = ?auto_408843 ?auto_408846 ) ) ( not ( = ?auto_408844 ?auto_408845 ) ) ( not ( = ?auto_408841 ?auto_408846 ) ) ( not ( = ?auto_408841 ?auto_408848 ) ) ( not ( = ?auto_408845 ?auto_408847 ) ) ( not ( = ?auto_408845 ?auto_408849 ) ) ( not ( = ?auto_408846 ?auto_408848 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_408847 ?auto_408848 ?auto_408842 ?auto_408843 )
      ( GET-4IMAGE-VERIFY ?auto_408842 ?auto_408843 ?auto_408844 ?auto_408841 ?auto_408845 ?auto_408846 ?auto_408847 ?auto_408848 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_409932 - DIRECTION
      ?auto_409933 - MODE
      ?auto_409934 - DIRECTION
      ?auto_409931 - MODE
      ?auto_409935 - DIRECTION
      ?auto_409936 - MODE
      ?auto_409937 - DIRECTION
      ?auto_409938 - MODE
    )
    :vars
    (
      ?auto_409943 - INSTRUMENT
      ?auto_409942 - SATELLITE
      ?auto_409941 - DIRECTION
      ?auto_409939 - DIRECTION
      ?auto_409940 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_409943 ?auto_409942 ) ( SUPPORTS ?auto_409943 ?auto_409938 ) ( not ( = ?auto_409937 ?auto_409941 ) ) ( HAVE_IMAGE ?auto_409932 ?auto_409931 ) ( not ( = ?auto_409932 ?auto_409937 ) ) ( not ( = ?auto_409932 ?auto_409941 ) ) ( not ( = ?auto_409931 ?auto_409938 ) ) ( CALIBRATION_TARGET ?auto_409943 ?auto_409941 ) ( POINTING ?auto_409942 ?auto_409939 ) ( not ( = ?auto_409941 ?auto_409939 ) ) ( not ( = ?auto_409937 ?auto_409939 ) ) ( not ( = ?auto_409932 ?auto_409939 ) ) ( ON_BOARD ?auto_409940 ?auto_409942 ) ( POWER_ON ?auto_409940 ) ( not ( = ?auto_409943 ?auto_409940 ) ) ( HAVE_IMAGE ?auto_409932 ?auto_409933 ) ( HAVE_IMAGE ?auto_409934 ?auto_409931 ) ( HAVE_IMAGE ?auto_409935 ?auto_409936 ) ( not ( = ?auto_409932 ?auto_409934 ) ) ( not ( = ?auto_409932 ?auto_409935 ) ) ( not ( = ?auto_409933 ?auto_409931 ) ) ( not ( = ?auto_409933 ?auto_409936 ) ) ( not ( = ?auto_409933 ?auto_409938 ) ) ( not ( = ?auto_409934 ?auto_409935 ) ) ( not ( = ?auto_409934 ?auto_409937 ) ) ( not ( = ?auto_409934 ?auto_409941 ) ) ( not ( = ?auto_409934 ?auto_409939 ) ) ( not ( = ?auto_409931 ?auto_409936 ) ) ( not ( = ?auto_409935 ?auto_409937 ) ) ( not ( = ?auto_409935 ?auto_409941 ) ) ( not ( = ?auto_409935 ?auto_409939 ) ) ( not ( = ?auto_409936 ?auto_409938 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_409932 ?auto_409931 ?auto_409937 ?auto_409938 )
      ( GET-4IMAGE-VERIFY ?auto_409932 ?auto_409933 ?auto_409934 ?auto_409931 ?auto_409935 ?auto_409936 ?auto_409937 ?auto_409938 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_410194 - DIRECTION
      ?auto_410195 - MODE
      ?auto_410196 - DIRECTION
      ?auto_410193 - MODE
      ?auto_410197 - DIRECTION
      ?auto_410198 - MODE
      ?auto_410199 - DIRECTION
      ?auto_410200 - MODE
    )
    :vars
    (
      ?auto_410205 - INSTRUMENT
      ?auto_410204 - SATELLITE
      ?auto_410203 - DIRECTION
      ?auto_410201 - DIRECTION
      ?auto_410202 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_410205 ?auto_410204 ) ( SUPPORTS ?auto_410205 ?auto_410193 ) ( not ( = ?auto_410196 ?auto_410203 ) ) ( HAVE_IMAGE ?auto_410197 ?auto_410195 ) ( not ( = ?auto_410197 ?auto_410196 ) ) ( not ( = ?auto_410197 ?auto_410203 ) ) ( not ( = ?auto_410195 ?auto_410193 ) ) ( CALIBRATION_TARGET ?auto_410205 ?auto_410203 ) ( POINTING ?auto_410204 ?auto_410201 ) ( not ( = ?auto_410203 ?auto_410201 ) ) ( not ( = ?auto_410196 ?auto_410201 ) ) ( not ( = ?auto_410197 ?auto_410201 ) ) ( ON_BOARD ?auto_410202 ?auto_410204 ) ( POWER_ON ?auto_410202 ) ( not ( = ?auto_410205 ?auto_410202 ) ) ( HAVE_IMAGE ?auto_410194 ?auto_410195 ) ( HAVE_IMAGE ?auto_410197 ?auto_410198 ) ( HAVE_IMAGE ?auto_410199 ?auto_410200 ) ( not ( = ?auto_410194 ?auto_410196 ) ) ( not ( = ?auto_410194 ?auto_410197 ) ) ( not ( = ?auto_410194 ?auto_410199 ) ) ( not ( = ?auto_410194 ?auto_410203 ) ) ( not ( = ?auto_410194 ?auto_410201 ) ) ( not ( = ?auto_410195 ?auto_410198 ) ) ( not ( = ?auto_410195 ?auto_410200 ) ) ( not ( = ?auto_410196 ?auto_410199 ) ) ( not ( = ?auto_410193 ?auto_410198 ) ) ( not ( = ?auto_410193 ?auto_410200 ) ) ( not ( = ?auto_410197 ?auto_410199 ) ) ( not ( = ?auto_410198 ?auto_410200 ) ) ( not ( = ?auto_410199 ?auto_410203 ) ) ( not ( = ?auto_410199 ?auto_410201 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_410197 ?auto_410195 ?auto_410196 ?auto_410193 )
      ( GET-4IMAGE-VERIFY ?auto_410194 ?auto_410195 ?auto_410196 ?auto_410193 ?auto_410197 ?auto_410198 ?auto_410199 ?auto_410200 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_412547 - DIRECTION
      ?auto_412548 - MODE
      ?auto_412549 - DIRECTION
      ?auto_412546 - MODE
      ?auto_412550 - DIRECTION
      ?auto_412551 - MODE
    )
    :vars
    (
      ?auto_412554 - INSTRUMENT
      ?auto_412555 - SATELLITE
      ?auto_412553 - DIRECTION
      ?auto_412552 - DIRECTION
      ?auto_412556 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_412554 ?auto_412555 ) ( SUPPORTS ?auto_412554 ?auto_412548 ) ( not ( = ?auto_412547 ?auto_412553 ) ) ( HAVE_IMAGE ?auto_412549 ?auto_412551 ) ( not ( = ?auto_412549 ?auto_412547 ) ) ( not ( = ?auto_412549 ?auto_412553 ) ) ( not ( = ?auto_412551 ?auto_412548 ) ) ( CALIBRATION_TARGET ?auto_412554 ?auto_412553 ) ( not ( = ?auto_412553 ?auto_412552 ) ) ( not ( = ?auto_412547 ?auto_412552 ) ) ( not ( = ?auto_412549 ?auto_412552 ) ) ( ON_BOARD ?auto_412556 ?auto_412555 ) ( POWER_ON ?auto_412556 ) ( not ( = ?auto_412554 ?auto_412556 ) ) ( POINTING ?auto_412555 ?auto_412553 ) ( HAVE_IMAGE ?auto_412549 ?auto_412546 ) ( HAVE_IMAGE ?auto_412550 ?auto_412551 ) ( not ( = ?auto_412547 ?auto_412550 ) ) ( not ( = ?auto_412548 ?auto_412546 ) ) ( not ( = ?auto_412549 ?auto_412550 ) ) ( not ( = ?auto_412546 ?auto_412551 ) ) ( not ( = ?auto_412550 ?auto_412553 ) ) ( not ( = ?auto_412550 ?auto_412552 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_412549 ?auto_412551 ?auto_412547 ?auto_412548 )
      ( GET-3IMAGE-VERIFY ?auto_412547 ?auto_412548 ?auto_412549 ?auto_412546 ?auto_412550 ?auto_412551 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_414180 - DIRECTION
      ?auto_414181 - MODE
      ?auto_414182 - DIRECTION
      ?auto_414179 - MODE
      ?auto_414183 - DIRECTION
      ?auto_414184 - MODE
      ?auto_414185 - DIRECTION
      ?auto_414186 - MODE
    )
    :vars
    (
      ?auto_414189 - INSTRUMENT
      ?auto_414190 - SATELLITE
      ?auto_414188 - DIRECTION
      ?auto_414187 - DIRECTION
      ?auto_414191 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_414189 ?auto_414190 ) ( SUPPORTS ?auto_414189 ?auto_414181 ) ( not ( = ?auto_414180 ?auto_414188 ) ) ( HAVE_IMAGE ?auto_414182 ?auto_414186 ) ( not ( = ?auto_414182 ?auto_414180 ) ) ( not ( = ?auto_414182 ?auto_414188 ) ) ( not ( = ?auto_414186 ?auto_414181 ) ) ( CALIBRATION_TARGET ?auto_414189 ?auto_414188 ) ( not ( = ?auto_414188 ?auto_414187 ) ) ( not ( = ?auto_414180 ?auto_414187 ) ) ( not ( = ?auto_414182 ?auto_414187 ) ) ( ON_BOARD ?auto_414191 ?auto_414190 ) ( POWER_ON ?auto_414191 ) ( not ( = ?auto_414189 ?auto_414191 ) ) ( POINTING ?auto_414190 ?auto_414188 ) ( HAVE_IMAGE ?auto_414182 ?auto_414179 ) ( HAVE_IMAGE ?auto_414183 ?auto_414184 ) ( HAVE_IMAGE ?auto_414185 ?auto_414186 ) ( not ( = ?auto_414180 ?auto_414183 ) ) ( not ( = ?auto_414180 ?auto_414185 ) ) ( not ( = ?auto_414181 ?auto_414179 ) ) ( not ( = ?auto_414181 ?auto_414184 ) ) ( not ( = ?auto_414182 ?auto_414183 ) ) ( not ( = ?auto_414182 ?auto_414185 ) ) ( not ( = ?auto_414179 ?auto_414184 ) ) ( not ( = ?auto_414179 ?auto_414186 ) ) ( not ( = ?auto_414183 ?auto_414185 ) ) ( not ( = ?auto_414183 ?auto_414188 ) ) ( not ( = ?auto_414183 ?auto_414187 ) ) ( not ( = ?auto_414184 ?auto_414186 ) ) ( not ( = ?auto_414185 ?auto_414188 ) ) ( not ( = ?auto_414185 ?auto_414187 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_414182 ?auto_414186 ?auto_414180 ?auto_414181 )
      ( GET-4IMAGE-VERIFY ?auto_414180 ?auto_414181 ?auto_414182 ?auto_414179 ?auto_414183 ?auto_414184 ?auto_414185 ?auto_414186 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_420394 - DIRECTION
      ?auto_420395 - MODE
      ?auto_420396 - DIRECTION
      ?auto_420393 - MODE
      ?auto_420397 - DIRECTION
      ?auto_420398 - MODE
    )
    :vars
    (
      ?auto_420399 - INSTRUMENT
      ?auto_420401 - SATELLITE
      ?auto_420400 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_420399 ?auto_420401 ) ( SUPPORTS ?auto_420399 ?auto_420393 ) ( not ( = ?auto_420396 ?auto_420400 ) ) ( HAVE_IMAGE ?auto_420394 ?auto_420395 ) ( not ( = ?auto_420394 ?auto_420396 ) ) ( not ( = ?auto_420394 ?auto_420400 ) ) ( not ( = ?auto_420395 ?auto_420393 ) ) ( CALIBRATION_TARGET ?auto_420399 ?auto_420400 ) ( POWER_AVAIL ?auto_420401 ) ( POINTING ?auto_420401 ?auto_420394 ) ( HAVE_IMAGE ?auto_420397 ?auto_420398 ) ( not ( = ?auto_420394 ?auto_420397 ) ) ( not ( = ?auto_420395 ?auto_420398 ) ) ( not ( = ?auto_420396 ?auto_420397 ) ) ( not ( = ?auto_420393 ?auto_420398 ) ) ( not ( = ?auto_420397 ?auto_420400 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_420394 ?auto_420395 ?auto_420396 ?auto_420393 )
      ( GET-3IMAGE-VERIFY ?auto_420394 ?auto_420395 ?auto_420396 ?auto_420393 ?auto_420397 ?auto_420398 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_420576 - DIRECTION
      ?auto_420577 - MODE
      ?auto_420578 - DIRECTION
      ?auto_420575 - MODE
      ?auto_420579 - DIRECTION
      ?auto_420580 - MODE
    )
    :vars
    (
      ?auto_420581 - INSTRUMENT
      ?auto_420583 - SATELLITE
      ?auto_420582 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_420581 ?auto_420583 ) ( SUPPORTS ?auto_420581 ?auto_420577 ) ( not ( = ?auto_420576 ?auto_420582 ) ) ( HAVE_IMAGE ?auto_420578 ?auto_420580 ) ( not ( = ?auto_420578 ?auto_420576 ) ) ( not ( = ?auto_420578 ?auto_420582 ) ) ( not ( = ?auto_420580 ?auto_420577 ) ) ( CALIBRATION_TARGET ?auto_420581 ?auto_420582 ) ( POWER_AVAIL ?auto_420583 ) ( POINTING ?auto_420583 ?auto_420578 ) ( HAVE_IMAGE ?auto_420578 ?auto_420575 ) ( HAVE_IMAGE ?auto_420579 ?auto_420580 ) ( not ( = ?auto_420576 ?auto_420579 ) ) ( not ( = ?auto_420577 ?auto_420575 ) ) ( not ( = ?auto_420578 ?auto_420579 ) ) ( not ( = ?auto_420575 ?auto_420580 ) ) ( not ( = ?auto_420579 ?auto_420582 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_420578 ?auto_420580 ?auto_420576 ?auto_420577 )
      ( GET-3IMAGE-VERIFY ?auto_420576 ?auto_420577 ?auto_420578 ?auto_420575 ?auto_420579 ?auto_420580 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_420738 - DIRECTION
      ?auto_420739 - MODE
      ?auto_420740 - DIRECTION
      ?auto_420737 - MODE
      ?auto_420741 - DIRECTION
      ?auto_420742 - MODE
      ?auto_420743 - DIRECTION
      ?auto_420744 - MODE
    )
    :vars
    (
      ?auto_420745 - INSTRUMENT
      ?auto_420747 - SATELLITE
      ?auto_420746 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_420745 ?auto_420747 ) ( SUPPORTS ?auto_420745 ?auto_420744 ) ( not ( = ?auto_420743 ?auto_420746 ) ) ( HAVE_IMAGE ?auto_420741 ?auto_420739 ) ( not ( = ?auto_420741 ?auto_420743 ) ) ( not ( = ?auto_420741 ?auto_420746 ) ) ( not ( = ?auto_420739 ?auto_420744 ) ) ( CALIBRATION_TARGET ?auto_420745 ?auto_420746 ) ( POWER_AVAIL ?auto_420747 ) ( POINTING ?auto_420747 ?auto_420741 ) ( HAVE_IMAGE ?auto_420738 ?auto_420739 ) ( HAVE_IMAGE ?auto_420740 ?auto_420737 ) ( HAVE_IMAGE ?auto_420741 ?auto_420742 ) ( not ( = ?auto_420738 ?auto_420740 ) ) ( not ( = ?auto_420738 ?auto_420741 ) ) ( not ( = ?auto_420738 ?auto_420743 ) ) ( not ( = ?auto_420738 ?auto_420746 ) ) ( not ( = ?auto_420739 ?auto_420737 ) ) ( not ( = ?auto_420739 ?auto_420742 ) ) ( not ( = ?auto_420740 ?auto_420741 ) ) ( not ( = ?auto_420740 ?auto_420743 ) ) ( not ( = ?auto_420740 ?auto_420746 ) ) ( not ( = ?auto_420737 ?auto_420742 ) ) ( not ( = ?auto_420737 ?auto_420744 ) ) ( not ( = ?auto_420742 ?auto_420744 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_420741 ?auto_420739 ?auto_420743 ?auto_420744 )
      ( GET-4IMAGE-VERIFY ?auto_420738 ?auto_420739 ?auto_420740 ?auto_420737 ?auto_420741 ?auto_420742 ?auto_420743 ?auto_420744 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_420771 - DIRECTION
      ?auto_420772 - MODE
      ?auto_420773 - DIRECTION
      ?auto_420770 - MODE
      ?auto_420774 - DIRECTION
      ?auto_420775 - MODE
      ?auto_420776 - DIRECTION
      ?auto_420777 - MODE
    )
    :vars
    (
      ?auto_420778 - INSTRUMENT
      ?auto_420780 - SATELLITE
      ?auto_420779 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_420778 ?auto_420780 ) ( SUPPORTS ?auto_420778 ?auto_420775 ) ( not ( = ?auto_420774 ?auto_420779 ) ) ( HAVE_IMAGE ?auto_420776 ?auto_420777 ) ( not ( = ?auto_420776 ?auto_420774 ) ) ( not ( = ?auto_420776 ?auto_420779 ) ) ( not ( = ?auto_420777 ?auto_420775 ) ) ( CALIBRATION_TARGET ?auto_420778 ?auto_420779 ) ( POWER_AVAIL ?auto_420780 ) ( POINTING ?auto_420780 ?auto_420776 ) ( HAVE_IMAGE ?auto_420771 ?auto_420772 ) ( HAVE_IMAGE ?auto_420773 ?auto_420770 ) ( not ( = ?auto_420771 ?auto_420773 ) ) ( not ( = ?auto_420771 ?auto_420774 ) ) ( not ( = ?auto_420771 ?auto_420776 ) ) ( not ( = ?auto_420771 ?auto_420779 ) ) ( not ( = ?auto_420772 ?auto_420770 ) ) ( not ( = ?auto_420772 ?auto_420775 ) ) ( not ( = ?auto_420772 ?auto_420777 ) ) ( not ( = ?auto_420773 ?auto_420774 ) ) ( not ( = ?auto_420773 ?auto_420776 ) ) ( not ( = ?auto_420773 ?auto_420779 ) ) ( not ( = ?auto_420770 ?auto_420775 ) ) ( not ( = ?auto_420770 ?auto_420777 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_420776 ?auto_420777 ?auto_420774 ?auto_420775 )
      ( GET-4IMAGE-VERIFY ?auto_420771 ?auto_420772 ?auto_420773 ?auto_420770 ?auto_420774 ?auto_420775 ?auto_420776 ?auto_420777 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_422035 - DIRECTION
      ?auto_422036 - MODE
      ?auto_422037 - DIRECTION
      ?auto_422034 - MODE
      ?auto_422038 - DIRECTION
      ?auto_422039 - MODE
      ?auto_422040 - DIRECTION
      ?auto_422041 - MODE
    )
    :vars
    (
      ?auto_422042 - INSTRUMENT
      ?auto_422044 - SATELLITE
      ?auto_422043 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_422042 ?auto_422044 ) ( SUPPORTS ?auto_422042 ?auto_422036 ) ( not ( = ?auto_422035 ?auto_422043 ) ) ( HAVE_IMAGE ?auto_422037 ?auto_422041 ) ( not ( = ?auto_422037 ?auto_422035 ) ) ( not ( = ?auto_422037 ?auto_422043 ) ) ( not ( = ?auto_422041 ?auto_422036 ) ) ( CALIBRATION_TARGET ?auto_422042 ?auto_422043 ) ( POWER_AVAIL ?auto_422044 ) ( POINTING ?auto_422044 ?auto_422037 ) ( HAVE_IMAGE ?auto_422037 ?auto_422034 ) ( HAVE_IMAGE ?auto_422038 ?auto_422039 ) ( HAVE_IMAGE ?auto_422040 ?auto_422041 ) ( not ( = ?auto_422035 ?auto_422038 ) ) ( not ( = ?auto_422035 ?auto_422040 ) ) ( not ( = ?auto_422036 ?auto_422034 ) ) ( not ( = ?auto_422036 ?auto_422039 ) ) ( not ( = ?auto_422037 ?auto_422038 ) ) ( not ( = ?auto_422037 ?auto_422040 ) ) ( not ( = ?auto_422034 ?auto_422039 ) ) ( not ( = ?auto_422034 ?auto_422041 ) ) ( not ( = ?auto_422038 ?auto_422040 ) ) ( not ( = ?auto_422038 ?auto_422043 ) ) ( not ( = ?auto_422039 ?auto_422041 ) ) ( not ( = ?auto_422040 ?auto_422043 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_422037 ?auto_422041 ?auto_422035 ?auto_422036 )
      ( GET-4IMAGE-VERIFY ?auto_422035 ?auto_422036 ?auto_422037 ?auto_422034 ?auto_422038 ?auto_422039 ?auto_422040 ?auto_422041 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_423297 - DIRECTION
      ?auto_423298 - MODE
      ?auto_423299 - DIRECTION
      ?auto_423296 - MODE
      ?auto_423300 - DIRECTION
      ?auto_423301 - MODE
      ?auto_423302 - DIRECTION
      ?auto_423303 - MODE
    )
    :vars
    (
      ?auto_423306 - INSTRUMENT
      ?auto_423305 - SATELLITE
      ?auto_423307 - DIRECTION
      ?auto_423304 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_423306 ?auto_423305 ) ( SUPPORTS ?auto_423306 ?auto_423301 ) ( not ( = ?auto_423300 ?auto_423307 ) ) ( HAVE_IMAGE ?auto_423302 ?auto_423303 ) ( not ( = ?auto_423302 ?auto_423300 ) ) ( not ( = ?auto_423302 ?auto_423307 ) ) ( not ( = ?auto_423303 ?auto_423301 ) ) ( CALIBRATION_TARGET ?auto_423306 ?auto_423307 ) ( POINTING ?auto_423305 ?auto_423302 ) ( ON_BOARD ?auto_423304 ?auto_423305 ) ( POWER_ON ?auto_423304 ) ( not ( = ?auto_423306 ?auto_423304 ) ) ( HAVE_IMAGE ?auto_423297 ?auto_423298 ) ( HAVE_IMAGE ?auto_423299 ?auto_423296 ) ( not ( = ?auto_423297 ?auto_423299 ) ) ( not ( = ?auto_423297 ?auto_423300 ) ) ( not ( = ?auto_423297 ?auto_423302 ) ) ( not ( = ?auto_423297 ?auto_423307 ) ) ( not ( = ?auto_423298 ?auto_423296 ) ) ( not ( = ?auto_423298 ?auto_423301 ) ) ( not ( = ?auto_423298 ?auto_423303 ) ) ( not ( = ?auto_423299 ?auto_423300 ) ) ( not ( = ?auto_423299 ?auto_423302 ) ) ( not ( = ?auto_423299 ?auto_423307 ) ) ( not ( = ?auto_423296 ?auto_423301 ) ) ( not ( = ?auto_423296 ?auto_423303 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_423302 ?auto_423303 ?auto_423300 ?auto_423301 )
      ( GET-4IMAGE-VERIFY ?auto_423297 ?auto_423298 ?auto_423299 ?auto_423296 ?auto_423300 ?auto_423301 ?auto_423302 ?auto_423303 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_423513 - DIRECTION
      ?auto_423514 - MODE
      ?auto_423515 - DIRECTION
      ?auto_423512 - MODE
      ?auto_423516 - DIRECTION
      ?auto_423517 - MODE
      ?auto_423518 - DIRECTION
      ?auto_423519 - MODE
    )
    :vars
    (
      ?auto_423522 - INSTRUMENT
      ?auto_423521 - SATELLITE
      ?auto_423523 - DIRECTION
      ?auto_423520 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_423522 ?auto_423521 ) ( SUPPORTS ?auto_423522 ?auto_423512 ) ( not ( = ?auto_423515 ?auto_423523 ) ) ( HAVE_IMAGE ?auto_423513 ?auto_423517 ) ( not ( = ?auto_423513 ?auto_423515 ) ) ( not ( = ?auto_423513 ?auto_423523 ) ) ( not ( = ?auto_423517 ?auto_423512 ) ) ( CALIBRATION_TARGET ?auto_423522 ?auto_423523 ) ( POINTING ?auto_423521 ?auto_423513 ) ( ON_BOARD ?auto_423520 ?auto_423521 ) ( POWER_ON ?auto_423520 ) ( not ( = ?auto_423522 ?auto_423520 ) ) ( HAVE_IMAGE ?auto_423513 ?auto_423514 ) ( HAVE_IMAGE ?auto_423516 ?auto_423517 ) ( HAVE_IMAGE ?auto_423518 ?auto_423519 ) ( not ( = ?auto_423513 ?auto_423516 ) ) ( not ( = ?auto_423513 ?auto_423518 ) ) ( not ( = ?auto_423514 ?auto_423512 ) ) ( not ( = ?auto_423514 ?auto_423517 ) ) ( not ( = ?auto_423514 ?auto_423519 ) ) ( not ( = ?auto_423515 ?auto_423516 ) ) ( not ( = ?auto_423515 ?auto_423518 ) ) ( not ( = ?auto_423512 ?auto_423519 ) ) ( not ( = ?auto_423516 ?auto_423518 ) ) ( not ( = ?auto_423516 ?auto_423523 ) ) ( not ( = ?auto_423517 ?auto_423519 ) ) ( not ( = ?auto_423518 ?auto_423523 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_423513 ?auto_423517 ?auto_423515 ?auto_423512 )
      ( GET-4IMAGE-VERIFY ?auto_423513 ?auto_423514 ?auto_423515 ?auto_423512 ?auto_423516 ?auto_423517 ?auto_423518 ?auto_423519 ) )
  )

)

