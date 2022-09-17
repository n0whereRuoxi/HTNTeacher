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
      ?auto_1915 - DIRECTION
      ?auto_1916 - MODE
    )
    :vars
    (
      ?auto_1917 - INSTRUMENT
      ?auto_1918 - SATELLITE
      ?auto_1919 - DIRECTION
      ?auto_1920 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1917 ?auto_1918 ) ( SUPPORTS ?auto_1917 ?auto_1916 ) ( not ( = ?auto_1915 ?auto_1919 ) ) ( CALIBRATION_TARGET ?auto_1917 ?auto_1919 ) ( POWER_AVAIL ?auto_1918 ) ( POINTING ?auto_1918 ?auto_1920 ) ( not ( = ?auto_1919 ?auto_1920 ) ) ( not ( = ?auto_1915 ?auto_1920 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1918 ?auto_1919 ?auto_1920 )
      ( !SWITCH_ON ?auto_1917 ?auto_1918 )
      ( !CALIBRATE ?auto_1918 ?auto_1917 ?auto_1919 )
      ( !TURN_TO ?auto_1918 ?auto_1915 ?auto_1919 )
      ( !TAKE_IMAGE ?auto_1918 ?auto_1915 ?auto_1917 ?auto_1916 )
      ( GET-1IMAGE-VERIFY ?auto_1915 ?auto_1916 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1923 - DIRECTION
      ?auto_1924 - MODE
    )
    :vars
    (
      ?auto_1925 - INSTRUMENT
      ?auto_1926 - SATELLITE
      ?auto_1927 - DIRECTION
      ?auto_1928 - DIRECTION
      ?auto_1929 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1925 ?auto_1926 ) ( SUPPORTS ?auto_1925 ?auto_1924 ) ( not ( = ?auto_1923 ?auto_1927 ) ) ( CALIBRATION_TARGET ?auto_1925 ?auto_1927 ) ( POINTING ?auto_1926 ?auto_1928 ) ( not ( = ?auto_1927 ?auto_1928 ) ) ( ON_BOARD ?auto_1929 ?auto_1926 ) ( POWER_ON ?auto_1929 ) ( not ( = ?auto_1923 ?auto_1928 ) ) ( not ( = ?auto_1925 ?auto_1929 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1929 ?auto_1926 )
      ( !TURN_TO ?auto_1926 ?auto_1927 ?auto_1928 )
      ( !SWITCH_ON ?auto_1925 ?auto_1926 )
      ( !CALIBRATE ?auto_1926 ?auto_1925 ?auto_1927 )
      ( !TURN_TO ?auto_1926 ?auto_1923 ?auto_1927 )
      ( !TAKE_IMAGE ?auto_1926 ?auto_1923 ?auto_1925 ?auto_1924 )
      ( GET-1IMAGE-VERIFY ?auto_1923 ?auto_1924 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1942 - DIRECTION
      ?auto_1943 - MODE
      ?auto_1945 - DIRECTION
      ?auto_1944 - MODE
    )
    :vars
    (
      ?auto_1948 - INSTRUMENT
      ?auto_1949 - SATELLITE
      ?auto_1946 - DIRECTION
      ?auto_1947 - INSTRUMENT
      ?auto_1950 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1948 ?auto_1949 ) ( SUPPORTS ?auto_1948 ?auto_1944 ) ( not ( = ?auto_1945 ?auto_1946 ) ) ( CALIBRATION_TARGET ?auto_1948 ?auto_1946 ) ( not ( = ?auto_1946 ?auto_1942 ) ) ( ON_BOARD ?auto_1947 ?auto_1949 ) ( not ( = ?auto_1945 ?auto_1942 ) ) ( not ( = ?auto_1948 ?auto_1947 ) ) ( SUPPORTS ?auto_1947 ?auto_1943 ) ( CALIBRATION_TARGET ?auto_1947 ?auto_1946 ) ( POWER_AVAIL ?auto_1949 ) ( POINTING ?auto_1949 ?auto_1950 ) ( not ( = ?auto_1946 ?auto_1950 ) ) ( not ( = ?auto_1942 ?auto_1950 ) ) ( not ( = ?auto_1943 ?auto_1944 ) ) ( not ( = ?auto_1945 ?auto_1950 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1942 ?auto_1943 )
      ( GET-1IMAGE ?auto_1945 ?auto_1944 )
      ( GET-2IMAGE-VERIFY ?auto_1942 ?auto_1943 ?auto_1945 ?auto_1944 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2103 - DIRECTION
      ?auto_2104 - MODE
      ?auto_2106 - DIRECTION
      ?auto_2105 - MODE
      ?auto_2107 - DIRECTION
      ?auto_2108 - MODE
    )
    :vars
    (
      ?auto_2109 - INSTRUMENT
      ?auto_2110 - SATELLITE
      ?auto_2112 - DIRECTION
      ?auto_2111 - INSTRUMENT
      ?auto_2114 - INSTRUMENT
      ?auto_2113 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2109 ?auto_2110 ) ( SUPPORTS ?auto_2109 ?auto_2108 ) ( not ( = ?auto_2107 ?auto_2112 ) ) ( CALIBRATION_TARGET ?auto_2109 ?auto_2112 ) ( not ( = ?auto_2112 ?auto_2106 ) ) ( ON_BOARD ?auto_2111 ?auto_2110 ) ( not ( = ?auto_2107 ?auto_2106 ) ) ( not ( = ?auto_2109 ?auto_2111 ) ) ( SUPPORTS ?auto_2111 ?auto_2105 ) ( CALIBRATION_TARGET ?auto_2111 ?auto_2112 ) ( not ( = ?auto_2112 ?auto_2103 ) ) ( ON_BOARD ?auto_2114 ?auto_2110 ) ( not ( = ?auto_2106 ?auto_2103 ) ) ( not ( = ?auto_2111 ?auto_2114 ) ) ( SUPPORTS ?auto_2114 ?auto_2104 ) ( CALIBRATION_TARGET ?auto_2114 ?auto_2112 ) ( POWER_AVAIL ?auto_2110 ) ( POINTING ?auto_2110 ?auto_2113 ) ( not ( = ?auto_2112 ?auto_2113 ) ) ( not ( = ?auto_2103 ?auto_2113 ) ) ( not ( = ?auto_2104 ?auto_2105 ) ) ( not ( = ?auto_2106 ?auto_2113 ) ) ( not ( = ?auto_2103 ?auto_2107 ) ) ( not ( = ?auto_2104 ?auto_2108 ) ) ( not ( = ?auto_2105 ?auto_2108 ) ) ( not ( = ?auto_2107 ?auto_2113 ) ) ( not ( = ?auto_2109 ?auto_2114 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2103 ?auto_2104 ?auto_2106 ?auto_2105 )
      ( GET-1IMAGE ?auto_2107 ?auto_2108 )
      ( GET-3IMAGE-VERIFY ?auto_2103 ?auto_2104 ?auto_2106 ?auto_2105 ?auto_2107 ?auto_2108 ) )
  )

)

