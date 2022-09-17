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
      ?auto_274614 - DIRECTION
      ?auto_274615 - MODE
    )
    :vars
    (
      ?auto_274616 - INSTRUMENT
      ?auto_274617 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_274616 ) ( ON_BOARD ?auto_274616 ?auto_274617 ) ( SUPPORTS ?auto_274616 ?auto_274615 ) ( POWER_ON ?auto_274616 ) ( POINTING ?auto_274617 ?auto_274614 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_274617 ?auto_274614 ?auto_274616 ?auto_274615 )
      ( GET-1IMAGE-VERIFY ?auto_274614 ?auto_274615 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_274642 - DIRECTION
      ?auto_274643 - MODE
    )
    :vars
    (
      ?auto_274645 - INSTRUMENT
      ?auto_274644 - SATELLITE
      ?auto_274646 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_274645 ) ( ON_BOARD ?auto_274645 ?auto_274644 ) ( SUPPORTS ?auto_274645 ?auto_274643 ) ( POWER_ON ?auto_274645 ) ( POINTING ?auto_274644 ?auto_274646 ) ( not ( = ?auto_274642 ?auto_274646 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_274644 ?auto_274642 ?auto_274646 )
      ( GET-1IMAGE ?auto_274642 ?auto_274643 )
      ( GET-1IMAGE-VERIFY ?auto_274642 ?auto_274643 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_274674 - DIRECTION
      ?auto_274675 - MODE
    )
    :vars
    (
      ?auto_274677 - INSTRUMENT
      ?auto_274676 - SATELLITE
      ?auto_274678 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_274677 ?auto_274676 ) ( SUPPORTS ?auto_274677 ?auto_274675 ) ( POWER_ON ?auto_274677 ) ( POINTING ?auto_274676 ?auto_274678 ) ( not ( = ?auto_274674 ?auto_274678 ) ) ( CALIBRATION_TARGET ?auto_274677 ?auto_274678 ) ( NOT_CALIBRATED ?auto_274677 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_274676 ?auto_274677 ?auto_274678 )
      ( GET-1IMAGE ?auto_274674 ?auto_274675 )
      ( GET-1IMAGE-VERIFY ?auto_274674 ?auto_274675 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_274706 - DIRECTION
      ?auto_274707 - MODE
    )
    :vars
    (
      ?auto_274708 - INSTRUMENT
      ?auto_274710 - SATELLITE
      ?auto_274709 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_274708 ?auto_274710 ) ( SUPPORTS ?auto_274708 ?auto_274707 ) ( POINTING ?auto_274710 ?auto_274709 ) ( not ( = ?auto_274706 ?auto_274709 ) ) ( CALIBRATION_TARGET ?auto_274708 ?auto_274709 ) ( POWER_AVAIL ?auto_274710 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_274708 ?auto_274710 )
      ( GET-1IMAGE ?auto_274706 ?auto_274707 )
      ( GET-1IMAGE-VERIFY ?auto_274706 ?auto_274707 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_274738 - DIRECTION
      ?auto_274739 - MODE
    )
    :vars
    (
      ?auto_274741 - INSTRUMENT
      ?auto_274740 - SATELLITE
      ?auto_274742 - DIRECTION
      ?auto_274743 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_274741 ?auto_274740 ) ( SUPPORTS ?auto_274741 ?auto_274739 ) ( not ( = ?auto_274738 ?auto_274742 ) ) ( CALIBRATION_TARGET ?auto_274741 ?auto_274742 ) ( POWER_AVAIL ?auto_274740 ) ( POINTING ?auto_274740 ?auto_274743 ) ( not ( = ?auto_274742 ?auto_274743 ) ) ( not ( = ?auto_274738 ?auto_274743 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_274740 ?auto_274742 ?auto_274743 )
      ( GET-1IMAGE ?auto_274738 ?auto_274739 )
      ( GET-1IMAGE-VERIFY ?auto_274738 ?auto_274739 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_274955 - DIRECTION
      ?auto_274956 - MODE
      ?auto_274957 - DIRECTION
      ?auto_274954 - MODE
    )
    :vars
    (
      ?auto_274958 - INSTRUMENT
      ?auto_274959 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_274958 ) ( ON_BOARD ?auto_274958 ?auto_274959 ) ( SUPPORTS ?auto_274958 ?auto_274954 ) ( POWER_ON ?auto_274958 ) ( POINTING ?auto_274959 ?auto_274957 ) ( HAVE_IMAGE ?auto_274955 ?auto_274956 ) ( not ( = ?auto_274955 ?auto_274957 ) ) ( not ( = ?auto_274956 ?auto_274954 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_274957 ?auto_274954 )
      ( GET-2IMAGE-VERIFY ?auto_274955 ?auto_274956 ?auto_274957 ?auto_274954 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_274961 - DIRECTION
      ?auto_274962 - MODE
      ?auto_274963 - DIRECTION
      ?auto_274960 - MODE
    )
    :vars
    (
      ?auto_274964 - INSTRUMENT
      ?auto_274965 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_274964 ) ( ON_BOARD ?auto_274964 ?auto_274965 ) ( SUPPORTS ?auto_274964 ?auto_274962 ) ( POWER_ON ?auto_274964 ) ( POINTING ?auto_274965 ?auto_274961 ) ( HAVE_IMAGE ?auto_274963 ?auto_274960 ) ( not ( = ?auto_274961 ?auto_274963 ) ) ( not ( = ?auto_274962 ?auto_274960 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_274961 ?auto_274962 )
      ( GET-2IMAGE-VERIFY ?auto_274961 ?auto_274962 ?auto_274963 ?auto_274960 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_274973 - DIRECTION
      ?auto_274974 - MODE
      ?auto_274975 - DIRECTION
      ?auto_274972 - MODE
      ?auto_274976 - DIRECTION
      ?auto_274977 - MODE
    )
    :vars
    (
      ?auto_274978 - INSTRUMENT
      ?auto_274979 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_274978 ) ( ON_BOARD ?auto_274978 ?auto_274979 ) ( SUPPORTS ?auto_274978 ?auto_274977 ) ( POWER_ON ?auto_274978 ) ( POINTING ?auto_274979 ?auto_274976 ) ( HAVE_IMAGE ?auto_274973 ?auto_274974 ) ( HAVE_IMAGE ?auto_274975 ?auto_274972 ) ( not ( = ?auto_274973 ?auto_274975 ) ) ( not ( = ?auto_274973 ?auto_274976 ) ) ( not ( = ?auto_274974 ?auto_274972 ) ) ( not ( = ?auto_274974 ?auto_274977 ) ) ( not ( = ?auto_274975 ?auto_274976 ) ) ( not ( = ?auto_274972 ?auto_274977 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_274976 ?auto_274977 )
      ( GET-3IMAGE-VERIFY ?auto_274973 ?auto_274974 ?auto_274975 ?auto_274972 ?auto_274976 ?auto_274977 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_274981 - DIRECTION
      ?auto_274982 - MODE
      ?auto_274983 - DIRECTION
      ?auto_274980 - MODE
      ?auto_274984 - DIRECTION
      ?auto_274985 - MODE
    )
    :vars
    (
      ?auto_274986 - INSTRUMENT
      ?auto_274987 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_274986 ) ( ON_BOARD ?auto_274986 ?auto_274987 ) ( SUPPORTS ?auto_274986 ?auto_274980 ) ( POWER_ON ?auto_274986 ) ( POINTING ?auto_274987 ?auto_274983 ) ( HAVE_IMAGE ?auto_274981 ?auto_274982 ) ( HAVE_IMAGE ?auto_274984 ?auto_274985 ) ( not ( = ?auto_274981 ?auto_274983 ) ) ( not ( = ?auto_274981 ?auto_274984 ) ) ( not ( = ?auto_274982 ?auto_274980 ) ) ( not ( = ?auto_274982 ?auto_274985 ) ) ( not ( = ?auto_274983 ?auto_274984 ) ) ( not ( = ?auto_274980 ?auto_274985 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_274983 ?auto_274980 )
      ( GET-3IMAGE-VERIFY ?auto_274981 ?auto_274982 ?auto_274983 ?auto_274980 ?auto_274984 ?auto_274985 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_274997 - DIRECTION
      ?auto_274998 - MODE
      ?auto_274999 - DIRECTION
      ?auto_274996 - MODE
      ?auto_275000 - DIRECTION
      ?auto_275001 - MODE
    )
    :vars
    (
      ?auto_275002 - INSTRUMENT
      ?auto_275003 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_275002 ) ( ON_BOARD ?auto_275002 ?auto_275003 ) ( SUPPORTS ?auto_275002 ?auto_274998 ) ( POWER_ON ?auto_275002 ) ( POINTING ?auto_275003 ?auto_274997 ) ( HAVE_IMAGE ?auto_274999 ?auto_274996 ) ( HAVE_IMAGE ?auto_275000 ?auto_275001 ) ( not ( = ?auto_274997 ?auto_274999 ) ) ( not ( = ?auto_274997 ?auto_275000 ) ) ( not ( = ?auto_274998 ?auto_274996 ) ) ( not ( = ?auto_274998 ?auto_275001 ) ) ( not ( = ?auto_274999 ?auto_275000 ) ) ( not ( = ?auto_274996 ?auto_275001 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_274997 ?auto_274998 )
      ( GET-3IMAGE-VERIFY ?auto_274997 ?auto_274998 ?auto_274999 ?auto_274996 ?auto_275000 ?auto_275001 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275029 - DIRECTION
      ?auto_275030 - MODE
      ?auto_275031 - DIRECTION
      ?auto_275028 - MODE
      ?auto_275032 - DIRECTION
      ?auto_275033 - MODE
      ?auto_275034 - DIRECTION
      ?auto_275035 - MODE
    )
    :vars
    (
      ?auto_275036 - INSTRUMENT
      ?auto_275037 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_275036 ) ( ON_BOARD ?auto_275036 ?auto_275037 ) ( SUPPORTS ?auto_275036 ?auto_275035 ) ( POWER_ON ?auto_275036 ) ( POINTING ?auto_275037 ?auto_275034 ) ( HAVE_IMAGE ?auto_275029 ?auto_275030 ) ( HAVE_IMAGE ?auto_275031 ?auto_275028 ) ( HAVE_IMAGE ?auto_275032 ?auto_275033 ) ( not ( = ?auto_275029 ?auto_275031 ) ) ( not ( = ?auto_275029 ?auto_275032 ) ) ( not ( = ?auto_275029 ?auto_275034 ) ) ( not ( = ?auto_275030 ?auto_275028 ) ) ( not ( = ?auto_275030 ?auto_275033 ) ) ( not ( = ?auto_275030 ?auto_275035 ) ) ( not ( = ?auto_275031 ?auto_275032 ) ) ( not ( = ?auto_275031 ?auto_275034 ) ) ( not ( = ?auto_275028 ?auto_275033 ) ) ( not ( = ?auto_275028 ?auto_275035 ) ) ( not ( = ?auto_275032 ?auto_275034 ) ) ( not ( = ?auto_275033 ?auto_275035 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_275034 ?auto_275035 )
      ( GET-4IMAGE-VERIFY ?auto_275029 ?auto_275030 ?auto_275031 ?auto_275028 ?auto_275032 ?auto_275033 ?auto_275034 ?auto_275035 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275039 - DIRECTION
      ?auto_275040 - MODE
      ?auto_275041 - DIRECTION
      ?auto_275038 - MODE
      ?auto_275042 - DIRECTION
      ?auto_275043 - MODE
      ?auto_275044 - DIRECTION
      ?auto_275045 - MODE
    )
    :vars
    (
      ?auto_275046 - INSTRUMENT
      ?auto_275047 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_275046 ) ( ON_BOARD ?auto_275046 ?auto_275047 ) ( SUPPORTS ?auto_275046 ?auto_275043 ) ( POWER_ON ?auto_275046 ) ( POINTING ?auto_275047 ?auto_275042 ) ( HAVE_IMAGE ?auto_275039 ?auto_275040 ) ( HAVE_IMAGE ?auto_275041 ?auto_275038 ) ( HAVE_IMAGE ?auto_275044 ?auto_275045 ) ( not ( = ?auto_275039 ?auto_275041 ) ) ( not ( = ?auto_275039 ?auto_275042 ) ) ( not ( = ?auto_275039 ?auto_275044 ) ) ( not ( = ?auto_275040 ?auto_275038 ) ) ( not ( = ?auto_275040 ?auto_275043 ) ) ( not ( = ?auto_275040 ?auto_275045 ) ) ( not ( = ?auto_275041 ?auto_275042 ) ) ( not ( = ?auto_275041 ?auto_275044 ) ) ( not ( = ?auto_275038 ?auto_275043 ) ) ( not ( = ?auto_275038 ?auto_275045 ) ) ( not ( = ?auto_275042 ?auto_275044 ) ) ( not ( = ?auto_275043 ?auto_275045 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_275042 ?auto_275043 )
      ( GET-4IMAGE-VERIFY ?auto_275039 ?auto_275040 ?auto_275041 ?auto_275038 ?auto_275042 ?auto_275043 ?auto_275044 ?auto_275045 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275059 - DIRECTION
      ?auto_275060 - MODE
      ?auto_275061 - DIRECTION
      ?auto_275058 - MODE
      ?auto_275062 - DIRECTION
      ?auto_275063 - MODE
      ?auto_275064 - DIRECTION
      ?auto_275065 - MODE
    )
    :vars
    (
      ?auto_275066 - INSTRUMENT
      ?auto_275067 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_275066 ) ( ON_BOARD ?auto_275066 ?auto_275067 ) ( SUPPORTS ?auto_275066 ?auto_275058 ) ( POWER_ON ?auto_275066 ) ( POINTING ?auto_275067 ?auto_275061 ) ( HAVE_IMAGE ?auto_275059 ?auto_275060 ) ( HAVE_IMAGE ?auto_275062 ?auto_275063 ) ( HAVE_IMAGE ?auto_275064 ?auto_275065 ) ( not ( = ?auto_275059 ?auto_275061 ) ) ( not ( = ?auto_275059 ?auto_275062 ) ) ( not ( = ?auto_275059 ?auto_275064 ) ) ( not ( = ?auto_275060 ?auto_275058 ) ) ( not ( = ?auto_275060 ?auto_275063 ) ) ( not ( = ?auto_275060 ?auto_275065 ) ) ( not ( = ?auto_275061 ?auto_275062 ) ) ( not ( = ?auto_275061 ?auto_275064 ) ) ( not ( = ?auto_275058 ?auto_275063 ) ) ( not ( = ?auto_275058 ?auto_275065 ) ) ( not ( = ?auto_275062 ?auto_275064 ) ) ( not ( = ?auto_275063 ?auto_275065 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_275061 ?auto_275058 )
      ( GET-4IMAGE-VERIFY ?auto_275059 ?auto_275060 ?auto_275061 ?auto_275058 ?auto_275062 ?auto_275063 ?auto_275064 ?auto_275065 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275099 - DIRECTION
      ?auto_275100 - MODE
      ?auto_275101 - DIRECTION
      ?auto_275098 - MODE
      ?auto_275102 - DIRECTION
      ?auto_275103 - MODE
      ?auto_275104 - DIRECTION
      ?auto_275105 - MODE
    )
    :vars
    (
      ?auto_275106 - INSTRUMENT
      ?auto_275107 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_275106 ) ( ON_BOARD ?auto_275106 ?auto_275107 ) ( SUPPORTS ?auto_275106 ?auto_275100 ) ( POWER_ON ?auto_275106 ) ( POINTING ?auto_275107 ?auto_275099 ) ( HAVE_IMAGE ?auto_275101 ?auto_275098 ) ( HAVE_IMAGE ?auto_275102 ?auto_275103 ) ( HAVE_IMAGE ?auto_275104 ?auto_275105 ) ( not ( = ?auto_275099 ?auto_275101 ) ) ( not ( = ?auto_275099 ?auto_275102 ) ) ( not ( = ?auto_275099 ?auto_275104 ) ) ( not ( = ?auto_275100 ?auto_275098 ) ) ( not ( = ?auto_275100 ?auto_275103 ) ) ( not ( = ?auto_275100 ?auto_275105 ) ) ( not ( = ?auto_275101 ?auto_275102 ) ) ( not ( = ?auto_275101 ?auto_275104 ) ) ( not ( = ?auto_275098 ?auto_275103 ) ) ( not ( = ?auto_275098 ?auto_275105 ) ) ( not ( = ?auto_275102 ?auto_275104 ) ) ( not ( = ?auto_275103 ?auto_275105 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_275099 ?auto_275100 )
      ( GET-4IMAGE-VERIFY ?auto_275099 ?auto_275100 ?auto_275101 ?auto_275098 ?auto_275102 ?auto_275103 ?auto_275104 ?auto_275105 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_275184 - DIRECTION
      ?auto_275185 - MODE
      ?auto_275186 - DIRECTION
      ?auto_275183 - MODE
    )
    :vars
    (
      ?auto_275189 - INSTRUMENT
      ?auto_275188 - SATELLITE
      ?auto_275187 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_275189 ) ( ON_BOARD ?auto_275189 ?auto_275188 ) ( SUPPORTS ?auto_275189 ?auto_275183 ) ( POWER_ON ?auto_275189 ) ( POINTING ?auto_275188 ?auto_275187 ) ( not ( = ?auto_275186 ?auto_275187 ) ) ( HAVE_IMAGE ?auto_275184 ?auto_275185 ) ( not ( = ?auto_275184 ?auto_275186 ) ) ( not ( = ?auto_275184 ?auto_275187 ) ) ( not ( = ?auto_275185 ?auto_275183 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_275186 ?auto_275183 )
      ( GET-2IMAGE-VERIFY ?auto_275184 ?auto_275185 ?auto_275186 ?auto_275183 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_275191 - DIRECTION
      ?auto_275192 - MODE
      ?auto_275193 - DIRECTION
      ?auto_275190 - MODE
    )
    :vars
    (
      ?auto_275196 - INSTRUMENT
      ?auto_275195 - SATELLITE
      ?auto_275194 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_275196 ) ( ON_BOARD ?auto_275196 ?auto_275195 ) ( SUPPORTS ?auto_275196 ?auto_275192 ) ( POWER_ON ?auto_275196 ) ( POINTING ?auto_275195 ?auto_275194 ) ( not ( = ?auto_275191 ?auto_275194 ) ) ( HAVE_IMAGE ?auto_275193 ?auto_275190 ) ( not ( = ?auto_275193 ?auto_275191 ) ) ( not ( = ?auto_275193 ?auto_275194 ) ) ( not ( = ?auto_275190 ?auto_275192 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275193 ?auto_275190 ?auto_275191 ?auto_275192 )
      ( GET-2IMAGE-VERIFY ?auto_275191 ?auto_275192 ?auto_275193 ?auto_275190 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_275207 - DIRECTION
      ?auto_275208 - MODE
      ?auto_275209 - DIRECTION
      ?auto_275206 - MODE
      ?auto_275210 - DIRECTION
      ?auto_275211 - MODE
    )
    :vars
    (
      ?auto_275214 - INSTRUMENT
      ?auto_275213 - SATELLITE
      ?auto_275212 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_275214 ) ( ON_BOARD ?auto_275214 ?auto_275213 ) ( SUPPORTS ?auto_275214 ?auto_275211 ) ( POWER_ON ?auto_275214 ) ( POINTING ?auto_275213 ?auto_275212 ) ( not ( = ?auto_275210 ?auto_275212 ) ) ( HAVE_IMAGE ?auto_275207 ?auto_275208 ) ( not ( = ?auto_275207 ?auto_275210 ) ) ( not ( = ?auto_275207 ?auto_275212 ) ) ( not ( = ?auto_275208 ?auto_275211 ) ) ( HAVE_IMAGE ?auto_275209 ?auto_275206 ) ( not ( = ?auto_275207 ?auto_275209 ) ) ( not ( = ?auto_275208 ?auto_275206 ) ) ( not ( = ?auto_275209 ?auto_275210 ) ) ( not ( = ?auto_275209 ?auto_275212 ) ) ( not ( = ?auto_275206 ?auto_275211 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275207 ?auto_275208 ?auto_275210 ?auto_275211 )
      ( GET-3IMAGE-VERIFY ?auto_275207 ?auto_275208 ?auto_275209 ?auto_275206 ?auto_275210 ?auto_275211 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_275216 - DIRECTION
      ?auto_275217 - MODE
      ?auto_275218 - DIRECTION
      ?auto_275215 - MODE
      ?auto_275219 - DIRECTION
      ?auto_275220 - MODE
    )
    :vars
    (
      ?auto_275223 - INSTRUMENT
      ?auto_275222 - SATELLITE
      ?auto_275221 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_275223 ) ( ON_BOARD ?auto_275223 ?auto_275222 ) ( SUPPORTS ?auto_275223 ?auto_275215 ) ( POWER_ON ?auto_275223 ) ( POINTING ?auto_275222 ?auto_275221 ) ( not ( = ?auto_275218 ?auto_275221 ) ) ( HAVE_IMAGE ?auto_275216 ?auto_275217 ) ( not ( = ?auto_275216 ?auto_275218 ) ) ( not ( = ?auto_275216 ?auto_275221 ) ) ( not ( = ?auto_275217 ?auto_275215 ) ) ( HAVE_IMAGE ?auto_275219 ?auto_275220 ) ( not ( = ?auto_275216 ?auto_275219 ) ) ( not ( = ?auto_275217 ?auto_275220 ) ) ( not ( = ?auto_275218 ?auto_275219 ) ) ( not ( = ?auto_275215 ?auto_275220 ) ) ( not ( = ?auto_275219 ?auto_275221 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275216 ?auto_275217 ?auto_275218 ?auto_275215 )
      ( GET-3IMAGE-VERIFY ?auto_275216 ?auto_275217 ?auto_275218 ?auto_275215 ?auto_275219 ?auto_275220 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_275234 - DIRECTION
      ?auto_275235 - MODE
      ?auto_275236 - DIRECTION
      ?auto_275233 - MODE
      ?auto_275237 - DIRECTION
      ?auto_275238 - MODE
    )
    :vars
    (
      ?auto_275241 - INSTRUMENT
      ?auto_275240 - SATELLITE
      ?auto_275239 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_275241 ) ( ON_BOARD ?auto_275241 ?auto_275240 ) ( SUPPORTS ?auto_275241 ?auto_275235 ) ( POWER_ON ?auto_275241 ) ( POINTING ?auto_275240 ?auto_275239 ) ( not ( = ?auto_275234 ?auto_275239 ) ) ( HAVE_IMAGE ?auto_275236 ?auto_275238 ) ( not ( = ?auto_275236 ?auto_275234 ) ) ( not ( = ?auto_275236 ?auto_275239 ) ) ( not ( = ?auto_275238 ?auto_275235 ) ) ( HAVE_IMAGE ?auto_275236 ?auto_275233 ) ( HAVE_IMAGE ?auto_275237 ?auto_275238 ) ( not ( = ?auto_275234 ?auto_275237 ) ) ( not ( = ?auto_275235 ?auto_275233 ) ) ( not ( = ?auto_275236 ?auto_275237 ) ) ( not ( = ?auto_275233 ?auto_275238 ) ) ( not ( = ?auto_275237 ?auto_275239 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275236 ?auto_275238 ?auto_275234 ?auto_275235 )
      ( GET-3IMAGE-VERIFY ?auto_275234 ?auto_275235 ?auto_275236 ?auto_275233 ?auto_275237 ?auto_275238 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275272 - DIRECTION
      ?auto_275273 - MODE
      ?auto_275274 - DIRECTION
      ?auto_275271 - MODE
      ?auto_275275 - DIRECTION
      ?auto_275276 - MODE
      ?auto_275277 - DIRECTION
      ?auto_275278 - MODE
    )
    :vars
    (
      ?auto_275281 - INSTRUMENT
      ?auto_275280 - SATELLITE
      ?auto_275279 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_275281 ) ( ON_BOARD ?auto_275281 ?auto_275280 ) ( SUPPORTS ?auto_275281 ?auto_275278 ) ( POWER_ON ?auto_275281 ) ( POINTING ?auto_275280 ?auto_275279 ) ( not ( = ?auto_275277 ?auto_275279 ) ) ( HAVE_IMAGE ?auto_275275 ?auto_275276 ) ( not ( = ?auto_275275 ?auto_275277 ) ) ( not ( = ?auto_275275 ?auto_275279 ) ) ( not ( = ?auto_275276 ?auto_275278 ) ) ( HAVE_IMAGE ?auto_275272 ?auto_275273 ) ( HAVE_IMAGE ?auto_275274 ?auto_275271 ) ( not ( = ?auto_275272 ?auto_275274 ) ) ( not ( = ?auto_275272 ?auto_275275 ) ) ( not ( = ?auto_275272 ?auto_275277 ) ) ( not ( = ?auto_275272 ?auto_275279 ) ) ( not ( = ?auto_275273 ?auto_275271 ) ) ( not ( = ?auto_275273 ?auto_275276 ) ) ( not ( = ?auto_275273 ?auto_275278 ) ) ( not ( = ?auto_275274 ?auto_275275 ) ) ( not ( = ?auto_275274 ?auto_275277 ) ) ( not ( = ?auto_275274 ?auto_275279 ) ) ( not ( = ?auto_275271 ?auto_275276 ) ) ( not ( = ?auto_275271 ?auto_275278 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275275 ?auto_275276 ?auto_275277 ?auto_275278 )
      ( GET-4IMAGE-VERIFY ?auto_275272 ?auto_275273 ?auto_275274 ?auto_275271 ?auto_275275 ?auto_275276 ?auto_275277 ?auto_275278 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275283 - DIRECTION
      ?auto_275284 - MODE
      ?auto_275285 - DIRECTION
      ?auto_275282 - MODE
      ?auto_275286 - DIRECTION
      ?auto_275287 - MODE
      ?auto_275288 - DIRECTION
      ?auto_275289 - MODE
    )
    :vars
    (
      ?auto_275292 - INSTRUMENT
      ?auto_275291 - SATELLITE
      ?auto_275290 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_275292 ) ( ON_BOARD ?auto_275292 ?auto_275291 ) ( SUPPORTS ?auto_275292 ?auto_275287 ) ( POWER_ON ?auto_275292 ) ( POINTING ?auto_275291 ?auto_275290 ) ( not ( = ?auto_275286 ?auto_275290 ) ) ( HAVE_IMAGE ?auto_275288 ?auto_275282 ) ( not ( = ?auto_275288 ?auto_275286 ) ) ( not ( = ?auto_275288 ?auto_275290 ) ) ( not ( = ?auto_275282 ?auto_275287 ) ) ( HAVE_IMAGE ?auto_275283 ?auto_275284 ) ( HAVE_IMAGE ?auto_275285 ?auto_275282 ) ( HAVE_IMAGE ?auto_275288 ?auto_275289 ) ( not ( = ?auto_275283 ?auto_275285 ) ) ( not ( = ?auto_275283 ?auto_275286 ) ) ( not ( = ?auto_275283 ?auto_275288 ) ) ( not ( = ?auto_275283 ?auto_275290 ) ) ( not ( = ?auto_275284 ?auto_275282 ) ) ( not ( = ?auto_275284 ?auto_275287 ) ) ( not ( = ?auto_275284 ?auto_275289 ) ) ( not ( = ?auto_275285 ?auto_275286 ) ) ( not ( = ?auto_275285 ?auto_275288 ) ) ( not ( = ?auto_275285 ?auto_275290 ) ) ( not ( = ?auto_275282 ?auto_275289 ) ) ( not ( = ?auto_275287 ?auto_275289 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275288 ?auto_275282 ?auto_275286 ?auto_275287 )
      ( GET-4IMAGE-VERIFY ?auto_275283 ?auto_275284 ?auto_275285 ?auto_275282 ?auto_275286 ?auto_275287 ?auto_275288 ?auto_275289 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275305 - DIRECTION
      ?auto_275306 - MODE
      ?auto_275307 - DIRECTION
      ?auto_275304 - MODE
      ?auto_275308 - DIRECTION
      ?auto_275309 - MODE
      ?auto_275310 - DIRECTION
      ?auto_275311 - MODE
    )
    :vars
    (
      ?auto_275314 - INSTRUMENT
      ?auto_275313 - SATELLITE
      ?auto_275312 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_275314 ) ( ON_BOARD ?auto_275314 ?auto_275313 ) ( SUPPORTS ?auto_275314 ?auto_275304 ) ( POWER_ON ?auto_275314 ) ( POINTING ?auto_275313 ?auto_275312 ) ( not ( = ?auto_275307 ?auto_275312 ) ) ( HAVE_IMAGE ?auto_275308 ?auto_275309 ) ( not ( = ?auto_275308 ?auto_275307 ) ) ( not ( = ?auto_275308 ?auto_275312 ) ) ( not ( = ?auto_275309 ?auto_275304 ) ) ( HAVE_IMAGE ?auto_275305 ?auto_275306 ) ( HAVE_IMAGE ?auto_275310 ?auto_275311 ) ( not ( = ?auto_275305 ?auto_275307 ) ) ( not ( = ?auto_275305 ?auto_275308 ) ) ( not ( = ?auto_275305 ?auto_275310 ) ) ( not ( = ?auto_275305 ?auto_275312 ) ) ( not ( = ?auto_275306 ?auto_275304 ) ) ( not ( = ?auto_275306 ?auto_275309 ) ) ( not ( = ?auto_275306 ?auto_275311 ) ) ( not ( = ?auto_275307 ?auto_275310 ) ) ( not ( = ?auto_275304 ?auto_275311 ) ) ( not ( = ?auto_275308 ?auto_275310 ) ) ( not ( = ?auto_275309 ?auto_275311 ) ) ( not ( = ?auto_275310 ?auto_275312 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275308 ?auto_275309 ?auto_275307 ?auto_275304 )
      ( GET-4IMAGE-VERIFY ?auto_275305 ?auto_275306 ?auto_275307 ?auto_275304 ?auto_275308 ?auto_275309 ?auto_275310 ?auto_275311 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275349 - DIRECTION
      ?auto_275350 - MODE
      ?auto_275351 - DIRECTION
      ?auto_275348 - MODE
      ?auto_275352 - DIRECTION
      ?auto_275353 - MODE
      ?auto_275354 - DIRECTION
      ?auto_275355 - MODE
    )
    :vars
    (
      ?auto_275358 - INSTRUMENT
      ?auto_275357 - SATELLITE
      ?auto_275356 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_275358 ) ( ON_BOARD ?auto_275358 ?auto_275357 ) ( SUPPORTS ?auto_275358 ?auto_275350 ) ( POWER_ON ?auto_275358 ) ( POINTING ?auto_275357 ?auto_275356 ) ( not ( = ?auto_275349 ?auto_275356 ) ) ( HAVE_IMAGE ?auto_275354 ?auto_275355 ) ( not ( = ?auto_275354 ?auto_275349 ) ) ( not ( = ?auto_275354 ?auto_275356 ) ) ( not ( = ?auto_275355 ?auto_275350 ) ) ( HAVE_IMAGE ?auto_275351 ?auto_275348 ) ( HAVE_IMAGE ?auto_275352 ?auto_275353 ) ( not ( = ?auto_275349 ?auto_275351 ) ) ( not ( = ?auto_275349 ?auto_275352 ) ) ( not ( = ?auto_275350 ?auto_275348 ) ) ( not ( = ?auto_275350 ?auto_275353 ) ) ( not ( = ?auto_275351 ?auto_275352 ) ) ( not ( = ?auto_275351 ?auto_275354 ) ) ( not ( = ?auto_275351 ?auto_275356 ) ) ( not ( = ?auto_275348 ?auto_275353 ) ) ( not ( = ?auto_275348 ?auto_275355 ) ) ( not ( = ?auto_275352 ?auto_275354 ) ) ( not ( = ?auto_275352 ?auto_275356 ) ) ( not ( = ?auto_275353 ?auto_275355 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275354 ?auto_275355 ?auto_275349 ?auto_275350 )
      ( GET-4IMAGE-VERIFY ?auto_275349 ?auto_275350 ?auto_275351 ?auto_275348 ?auto_275352 ?auto_275353 ?auto_275354 ?auto_275355 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_275438 - DIRECTION
      ?auto_275439 - MODE
    )
    :vars
    (
      ?auto_275444 - INSTRUMENT
      ?auto_275443 - SATELLITE
      ?auto_275441 - DIRECTION
      ?auto_275442 - DIRECTION
      ?auto_275440 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_275444 ?auto_275443 ) ( SUPPORTS ?auto_275444 ?auto_275439 ) ( POWER_ON ?auto_275444 ) ( POINTING ?auto_275443 ?auto_275441 ) ( not ( = ?auto_275438 ?auto_275441 ) ) ( HAVE_IMAGE ?auto_275442 ?auto_275440 ) ( not ( = ?auto_275442 ?auto_275438 ) ) ( not ( = ?auto_275442 ?auto_275441 ) ) ( not ( = ?auto_275440 ?auto_275439 ) ) ( CALIBRATION_TARGET ?auto_275444 ?auto_275441 ) ( NOT_CALIBRATED ?auto_275444 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_275443 ?auto_275444 ?auto_275441 )
      ( GET-2IMAGE ?auto_275442 ?auto_275440 ?auto_275438 ?auto_275439 )
      ( GET-1IMAGE-VERIFY ?auto_275438 ?auto_275439 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_275446 - DIRECTION
      ?auto_275447 - MODE
      ?auto_275448 - DIRECTION
      ?auto_275445 - MODE
    )
    :vars
    (
      ?auto_275449 - INSTRUMENT
      ?auto_275450 - SATELLITE
      ?auto_275451 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275449 ?auto_275450 ) ( SUPPORTS ?auto_275449 ?auto_275445 ) ( POWER_ON ?auto_275449 ) ( POINTING ?auto_275450 ?auto_275451 ) ( not ( = ?auto_275448 ?auto_275451 ) ) ( HAVE_IMAGE ?auto_275446 ?auto_275447 ) ( not ( = ?auto_275446 ?auto_275448 ) ) ( not ( = ?auto_275446 ?auto_275451 ) ) ( not ( = ?auto_275447 ?auto_275445 ) ) ( CALIBRATION_TARGET ?auto_275449 ?auto_275451 ) ( NOT_CALIBRATED ?auto_275449 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_275448 ?auto_275445 )
      ( GET-2IMAGE-VERIFY ?auto_275446 ?auto_275447 ?auto_275448 ?auto_275445 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_275453 - DIRECTION
      ?auto_275454 - MODE
      ?auto_275455 - DIRECTION
      ?auto_275452 - MODE
    )
    :vars
    (
      ?auto_275456 - INSTRUMENT
      ?auto_275458 - SATELLITE
      ?auto_275457 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275456 ?auto_275458 ) ( SUPPORTS ?auto_275456 ?auto_275454 ) ( POWER_ON ?auto_275456 ) ( POINTING ?auto_275458 ?auto_275457 ) ( not ( = ?auto_275453 ?auto_275457 ) ) ( HAVE_IMAGE ?auto_275455 ?auto_275452 ) ( not ( = ?auto_275455 ?auto_275453 ) ) ( not ( = ?auto_275455 ?auto_275457 ) ) ( not ( = ?auto_275452 ?auto_275454 ) ) ( CALIBRATION_TARGET ?auto_275456 ?auto_275457 ) ( NOT_CALIBRATED ?auto_275456 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275455 ?auto_275452 ?auto_275453 ?auto_275454 )
      ( GET-2IMAGE-VERIFY ?auto_275453 ?auto_275454 ?auto_275455 ?auto_275452 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_275469 - DIRECTION
      ?auto_275470 - MODE
      ?auto_275471 - DIRECTION
      ?auto_275468 - MODE
      ?auto_275472 - DIRECTION
      ?auto_275473 - MODE
    )
    :vars
    (
      ?auto_275474 - INSTRUMENT
      ?auto_275476 - SATELLITE
      ?auto_275475 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275474 ?auto_275476 ) ( SUPPORTS ?auto_275474 ?auto_275473 ) ( POWER_ON ?auto_275474 ) ( POINTING ?auto_275476 ?auto_275475 ) ( not ( = ?auto_275472 ?auto_275475 ) ) ( HAVE_IMAGE ?auto_275471 ?auto_275468 ) ( not ( = ?auto_275471 ?auto_275472 ) ) ( not ( = ?auto_275471 ?auto_275475 ) ) ( not ( = ?auto_275468 ?auto_275473 ) ) ( CALIBRATION_TARGET ?auto_275474 ?auto_275475 ) ( NOT_CALIBRATED ?auto_275474 ) ( HAVE_IMAGE ?auto_275469 ?auto_275470 ) ( not ( = ?auto_275469 ?auto_275471 ) ) ( not ( = ?auto_275469 ?auto_275472 ) ) ( not ( = ?auto_275469 ?auto_275475 ) ) ( not ( = ?auto_275470 ?auto_275468 ) ) ( not ( = ?auto_275470 ?auto_275473 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275471 ?auto_275468 ?auto_275472 ?auto_275473 )
      ( GET-3IMAGE-VERIFY ?auto_275469 ?auto_275470 ?auto_275471 ?auto_275468 ?auto_275472 ?auto_275473 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_275478 - DIRECTION
      ?auto_275479 - MODE
      ?auto_275480 - DIRECTION
      ?auto_275477 - MODE
      ?auto_275481 - DIRECTION
      ?auto_275482 - MODE
    )
    :vars
    (
      ?auto_275483 - INSTRUMENT
      ?auto_275485 - SATELLITE
      ?auto_275484 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275483 ?auto_275485 ) ( SUPPORTS ?auto_275483 ?auto_275477 ) ( POWER_ON ?auto_275483 ) ( POINTING ?auto_275485 ?auto_275484 ) ( not ( = ?auto_275480 ?auto_275484 ) ) ( HAVE_IMAGE ?auto_275478 ?auto_275482 ) ( not ( = ?auto_275478 ?auto_275480 ) ) ( not ( = ?auto_275478 ?auto_275484 ) ) ( not ( = ?auto_275482 ?auto_275477 ) ) ( CALIBRATION_TARGET ?auto_275483 ?auto_275484 ) ( NOT_CALIBRATED ?auto_275483 ) ( HAVE_IMAGE ?auto_275478 ?auto_275479 ) ( HAVE_IMAGE ?auto_275481 ?auto_275482 ) ( not ( = ?auto_275478 ?auto_275481 ) ) ( not ( = ?auto_275479 ?auto_275477 ) ) ( not ( = ?auto_275479 ?auto_275482 ) ) ( not ( = ?auto_275480 ?auto_275481 ) ) ( not ( = ?auto_275481 ?auto_275484 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275478 ?auto_275482 ?auto_275480 ?auto_275477 )
      ( GET-3IMAGE-VERIFY ?auto_275478 ?auto_275479 ?auto_275480 ?auto_275477 ?auto_275481 ?auto_275482 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_275496 - DIRECTION
      ?auto_275497 - MODE
      ?auto_275498 - DIRECTION
      ?auto_275495 - MODE
      ?auto_275499 - DIRECTION
      ?auto_275500 - MODE
    )
    :vars
    (
      ?auto_275501 - INSTRUMENT
      ?auto_275503 - SATELLITE
      ?auto_275502 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275501 ?auto_275503 ) ( SUPPORTS ?auto_275501 ?auto_275497 ) ( POWER_ON ?auto_275501 ) ( POINTING ?auto_275503 ?auto_275502 ) ( not ( = ?auto_275496 ?auto_275502 ) ) ( HAVE_IMAGE ?auto_275499 ?auto_275495 ) ( not ( = ?auto_275499 ?auto_275496 ) ) ( not ( = ?auto_275499 ?auto_275502 ) ) ( not ( = ?auto_275495 ?auto_275497 ) ) ( CALIBRATION_TARGET ?auto_275501 ?auto_275502 ) ( NOT_CALIBRATED ?auto_275501 ) ( HAVE_IMAGE ?auto_275498 ?auto_275495 ) ( HAVE_IMAGE ?auto_275499 ?auto_275500 ) ( not ( = ?auto_275496 ?auto_275498 ) ) ( not ( = ?auto_275497 ?auto_275500 ) ) ( not ( = ?auto_275498 ?auto_275499 ) ) ( not ( = ?auto_275498 ?auto_275502 ) ) ( not ( = ?auto_275495 ?auto_275500 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275499 ?auto_275495 ?auto_275496 ?auto_275497 )
      ( GET-3IMAGE-VERIFY ?auto_275496 ?auto_275497 ?auto_275498 ?auto_275495 ?auto_275499 ?auto_275500 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275534 - DIRECTION
      ?auto_275535 - MODE
      ?auto_275536 - DIRECTION
      ?auto_275533 - MODE
      ?auto_275537 - DIRECTION
      ?auto_275538 - MODE
      ?auto_275539 - DIRECTION
      ?auto_275540 - MODE
    )
    :vars
    (
      ?auto_275541 - INSTRUMENT
      ?auto_275543 - SATELLITE
      ?auto_275542 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275541 ?auto_275543 ) ( SUPPORTS ?auto_275541 ?auto_275540 ) ( POWER_ON ?auto_275541 ) ( POINTING ?auto_275543 ?auto_275542 ) ( not ( = ?auto_275539 ?auto_275542 ) ) ( HAVE_IMAGE ?auto_275537 ?auto_275535 ) ( not ( = ?auto_275537 ?auto_275539 ) ) ( not ( = ?auto_275537 ?auto_275542 ) ) ( not ( = ?auto_275535 ?auto_275540 ) ) ( CALIBRATION_TARGET ?auto_275541 ?auto_275542 ) ( NOT_CALIBRATED ?auto_275541 ) ( HAVE_IMAGE ?auto_275534 ?auto_275535 ) ( HAVE_IMAGE ?auto_275536 ?auto_275533 ) ( HAVE_IMAGE ?auto_275537 ?auto_275538 ) ( not ( = ?auto_275534 ?auto_275536 ) ) ( not ( = ?auto_275534 ?auto_275537 ) ) ( not ( = ?auto_275534 ?auto_275539 ) ) ( not ( = ?auto_275534 ?auto_275542 ) ) ( not ( = ?auto_275535 ?auto_275533 ) ) ( not ( = ?auto_275535 ?auto_275538 ) ) ( not ( = ?auto_275536 ?auto_275537 ) ) ( not ( = ?auto_275536 ?auto_275539 ) ) ( not ( = ?auto_275536 ?auto_275542 ) ) ( not ( = ?auto_275533 ?auto_275538 ) ) ( not ( = ?auto_275533 ?auto_275540 ) ) ( not ( = ?auto_275538 ?auto_275540 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275537 ?auto_275535 ?auto_275539 ?auto_275540 )
      ( GET-4IMAGE-VERIFY ?auto_275534 ?auto_275535 ?auto_275536 ?auto_275533 ?auto_275537 ?auto_275538 ?auto_275539 ?auto_275540 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275545 - DIRECTION
      ?auto_275546 - MODE
      ?auto_275547 - DIRECTION
      ?auto_275544 - MODE
      ?auto_275548 - DIRECTION
      ?auto_275549 - MODE
      ?auto_275550 - DIRECTION
      ?auto_275551 - MODE
    )
    :vars
    (
      ?auto_275552 - INSTRUMENT
      ?auto_275554 - SATELLITE
      ?auto_275553 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275552 ?auto_275554 ) ( SUPPORTS ?auto_275552 ?auto_275549 ) ( POWER_ON ?auto_275552 ) ( POINTING ?auto_275554 ?auto_275553 ) ( not ( = ?auto_275548 ?auto_275553 ) ) ( HAVE_IMAGE ?auto_275550 ?auto_275551 ) ( not ( = ?auto_275550 ?auto_275548 ) ) ( not ( = ?auto_275550 ?auto_275553 ) ) ( not ( = ?auto_275551 ?auto_275549 ) ) ( CALIBRATION_TARGET ?auto_275552 ?auto_275553 ) ( NOT_CALIBRATED ?auto_275552 ) ( HAVE_IMAGE ?auto_275545 ?auto_275546 ) ( HAVE_IMAGE ?auto_275547 ?auto_275544 ) ( not ( = ?auto_275545 ?auto_275547 ) ) ( not ( = ?auto_275545 ?auto_275548 ) ) ( not ( = ?auto_275545 ?auto_275550 ) ) ( not ( = ?auto_275545 ?auto_275553 ) ) ( not ( = ?auto_275546 ?auto_275544 ) ) ( not ( = ?auto_275546 ?auto_275549 ) ) ( not ( = ?auto_275546 ?auto_275551 ) ) ( not ( = ?auto_275547 ?auto_275548 ) ) ( not ( = ?auto_275547 ?auto_275550 ) ) ( not ( = ?auto_275547 ?auto_275553 ) ) ( not ( = ?auto_275544 ?auto_275549 ) ) ( not ( = ?auto_275544 ?auto_275551 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275550 ?auto_275551 ?auto_275548 ?auto_275549 )
      ( GET-4IMAGE-VERIFY ?auto_275545 ?auto_275546 ?auto_275547 ?auto_275544 ?auto_275548 ?auto_275549 ?auto_275550 ?auto_275551 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275567 - DIRECTION
      ?auto_275568 - MODE
      ?auto_275569 - DIRECTION
      ?auto_275566 - MODE
      ?auto_275570 - DIRECTION
      ?auto_275571 - MODE
      ?auto_275572 - DIRECTION
      ?auto_275573 - MODE
    )
    :vars
    (
      ?auto_275574 - INSTRUMENT
      ?auto_275576 - SATELLITE
      ?auto_275575 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275574 ?auto_275576 ) ( SUPPORTS ?auto_275574 ?auto_275566 ) ( POWER_ON ?auto_275574 ) ( POINTING ?auto_275576 ?auto_275575 ) ( not ( = ?auto_275569 ?auto_275575 ) ) ( HAVE_IMAGE ?auto_275567 ?auto_275571 ) ( not ( = ?auto_275567 ?auto_275569 ) ) ( not ( = ?auto_275567 ?auto_275575 ) ) ( not ( = ?auto_275571 ?auto_275566 ) ) ( CALIBRATION_TARGET ?auto_275574 ?auto_275575 ) ( NOT_CALIBRATED ?auto_275574 ) ( HAVE_IMAGE ?auto_275567 ?auto_275568 ) ( HAVE_IMAGE ?auto_275570 ?auto_275571 ) ( HAVE_IMAGE ?auto_275572 ?auto_275573 ) ( not ( = ?auto_275567 ?auto_275570 ) ) ( not ( = ?auto_275567 ?auto_275572 ) ) ( not ( = ?auto_275568 ?auto_275566 ) ) ( not ( = ?auto_275568 ?auto_275571 ) ) ( not ( = ?auto_275568 ?auto_275573 ) ) ( not ( = ?auto_275569 ?auto_275570 ) ) ( not ( = ?auto_275569 ?auto_275572 ) ) ( not ( = ?auto_275566 ?auto_275573 ) ) ( not ( = ?auto_275570 ?auto_275572 ) ) ( not ( = ?auto_275570 ?auto_275575 ) ) ( not ( = ?auto_275571 ?auto_275573 ) ) ( not ( = ?auto_275572 ?auto_275575 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275567 ?auto_275571 ?auto_275569 ?auto_275566 )
      ( GET-4IMAGE-VERIFY ?auto_275567 ?auto_275568 ?auto_275569 ?auto_275566 ?auto_275570 ?auto_275571 ?auto_275572 ?auto_275573 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275611 - DIRECTION
      ?auto_275612 - MODE
      ?auto_275613 - DIRECTION
      ?auto_275610 - MODE
      ?auto_275614 - DIRECTION
      ?auto_275615 - MODE
      ?auto_275616 - DIRECTION
      ?auto_275617 - MODE
    )
    :vars
    (
      ?auto_275618 - INSTRUMENT
      ?auto_275620 - SATELLITE
      ?auto_275619 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275618 ?auto_275620 ) ( SUPPORTS ?auto_275618 ?auto_275612 ) ( POWER_ON ?auto_275618 ) ( POINTING ?auto_275620 ?auto_275619 ) ( not ( = ?auto_275611 ?auto_275619 ) ) ( HAVE_IMAGE ?auto_275613 ?auto_275610 ) ( not ( = ?auto_275613 ?auto_275611 ) ) ( not ( = ?auto_275613 ?auto_275619 ) ) ( not ( = ?auto_275610 ?auto_275612 ) ) ( CALIBRATION_TARGET ?auto_275618 ?auto_275619 ) ( NOT_CALIBRATED ?auto_275618 ) ( HAVE_IMAGE ?auto_275614 ?auto_275615 ) ( HAVE_IMAGE ?auto_275616 ?auto_275617 ) ( not ( = ?auto_275611 ?auto_275614 ) ) ( not ( = ?auto_275611 ?auto_275616 ) ) ( not ( = ?auto_275612 ?auto_275615 ) ) ( not ( = ?auto_275612 ?auto_275617 ) ) ( not ( = ?auto_275613 ?auto_275614 ) ) ( not ( = ?auto_275613 ?auto_275616 ) ) ( not ( = ?auto_275610 ?auto_275615 ) ) ( not ( = ?auto_275610 ?auto_275617 ) ) ( not ( = ?auto_275614 ?auto_275616 ) ) ( not ( = ?auto_275614 ?auto_275619 ) ) ( not ( = ?auto_275615 ?auto_275617 ) ) ( not ( = ?auto_275616 ?auto_275619 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275613 ?auto_275610 ?auto_275611 ?auto_275612 )
      ( GET-4IMAGE-VERIFY ?auto_275611 ?auto_275612 ?auto_275613 ?auto_275610 ?auto_275614 ?auto_275615 ?auto_275616 ?auto_275617 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_275700 - DIRECTION
      ?auto_275701 - MODE
    )
    :vars
    (
      ?auto_275703 - INSTRUMENT
      ?auto_275706 - SATELLITE
      ?auto_275705 - DIRECTION
      ?auto_275704 - DIRECTION
      ?auto_275702 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_275703 ?auto_275706 ) ( SUPPORTS ?auto_275703 ?auto_275701 ) ( POINTING ?auto_275706 ?auto_275705 ) ( not ( = ?auto_275700 ?auto_275705 ) ) ( HAVE_IMAGE ?auto_275704 ?auto_275702 ) ( not ( = ?auto_275704 ?auto_275700 ) ) ( not ( = ?auto_275704 ?auto_275705 ) ) ( not ( = ?auto_275702 ?auto_275701 ) ) ( CALIBRATION_TARGET ?auto_275703 ?auto_275705 ) ( POWER_AVAIL ?auto_275706 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_275703 ?auto_275706 )
      ( GET-2IMAGE ?auto_275704 ?auto_275702 ?auto_275700 ?auto_275701 )
      ( GET-1IMAGE-VERIFY ?auto_275700 ?auto_275701 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_275708 - DIRECTION
      ?auto_275709 - MODE
      ?auto_275710 - DIRECTION
      ?auto_275707 - MODE
    )
    :vars
    (
      ?auto_275713 - INSTRUMENT
      ?auto_275711 - SATELLITE
      ?auto_275712 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275713 ?auto_275711 ) ( SUPPORTS ?auto_275713 ?auto_275707 ) ( POINTING ?auto_275711 ?auto_275712 ) ( not ( = ?auto_275710 ?auto_275712 ) ) ( HAVE_IMAGE ?auto_275708 ?auto_275709 ) ( not ( = ?auto_275708 ?auto_275710 ) ) ( not ( = ?auto_275708 ?auto_275712 ) ) ( not ( = ?auto_275709 ?auto_275707 ) ) ( CALIBRATION_TARGET ?auto_275713 ?auto_275712 ) ( POWER_AVAIL ?auto_275711 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_275710 ?auto_275707 )
      ( GET-2IMAGE-VERIFY ?auto_275708 ?auto_275709 ?auto_275710 ?auto_275707 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_275715 - DIRECTION
      ?auto_275716 - MODE
      ?auto_275717 - DIRECTION
      ?auto_275714 - MODE
    )
    :vars
    (
      ?auto_275720 - INSTRUMENT
      ?auto_275719 - SATELLITE
      ?auto_275718 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275720 ?auto_275719 ) ( SUPPORTS ?auto_275720 ?auto_275716 ) ( POINTING ?auto_275719 ?auto_275718 ) ( not ( = ?auto_275715 ?auto_275718 ) ) ( HAVE_IMAGE ?auto_275717 ?auto_275714 ) ( not ( = ?auto_275717 ?auto_275715 ) ) ( not ( = ?auto_275717 ?auto_275718 ) ) ( not ( = ?auto_275714 ?auto_275716 ) ) ( CALIBRATION_TARGET ?auto_275720 ?auto_275718 ) ( POWER_AVAIL ?auto_275719 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275717 ?auto_275714 ?auto_275715 ?auto_275716 )
      ( GET-2IMAGE-VERIFY ?auto_275715 ?auto_275716 ?auto_275717 ?auto_275714 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_275731 - DIRECTION
      ?auto_275732 - MODE
      ?auto_275733 - DIRECTION
      ?auto_275730 - MODE
      ?auto_275734 - DIRECTION
      ?auto_275735 - MODE
    )
    :vars
    (
      ?auto_275738 - INSTRUMENT
      ?auto_275737 - SATELLITE
      ?auto_275736 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275738 ?auto_275737 ) ( SUPPORTS ?auto_275738 ?auto_275735 ) ( POINTING ?auto_275737 ?auto_275736 ) ( not ( = ?auto_275734 ?auto_275736 ) ) ( HAVE_IMAGE ?auto_275731 ?auto_275730 ) ( not ( = ?auto_275731 ?auto_275734 ) ) ( not ( = ?auto_275731 ?auto_275736 ) ) ( not ( = ?auto_275730 ?auto_275735 ) ) ( CALIBRATION_TARGET ?auto_275738 ?auto_275736 ) ( POWER_AVAIL ?auto_275737 ) ( HAVE_IMAGE ?auto_275731 ?auto_275732 ) ( HAVE_IMAGE ?auto_275733 ?auto_275730 ) ( not ( = ?auto_275731 ?auto_275733 ) ) ( not ( = ?auto_275732 ?auto_275730 ) ) ( not ( = ?auto_275732 ?auto_275735 ) ) ( not ( = ?auto_275733 ?auto_275734 ) ) ( not ( = ?auto_275733 ?auto_275736 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275731 ?auto_275730 ?auto_275734 ?auto_275735 )
      ( GET-3IMAGE-VERIFY ?auto_275731 ?auto_275732 ?auto_275733 ?auto_275730 ?auto_275734 ?auto_275735 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_275740 - DIRECTION
      ?auto_275741 - MODE
      ?auto_275742 - DIRECTION
      ?auto_275739 - MODE
      ?auto_275743 - DIRECTION
      ?auto_275744 - MODE
    )
    :vars
    (
      ?auto_275747 - INSTRUMENT
      ?auto_275746 - SATELLITE
      ?auto_275745 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275747 ?auto_275746 ) ( SUPPORTS ?auto_275747 ?auto_275739 ) ( POINTING ?auto_275746 ?auto_275745 ) ( not ( = ?auto_275742 ?auto_275745 ) ) ( HAVE_IMAGE ?auto_275743 ?auto_275744 ) ( not ( = ?auto_275743 ?auto_275742 ) ) ( not ( = ?auto_275743 ?auto_275745 ) ) ( not ( = ?auto_275744 ?auto_275739 ) ) ( CALIBRATION_TARGET ?auto_275747 ?auto_275745 ) ( POWER_AVAIL ?auto_275746 ) ( HAVE_IMAGE ?auto_275740 ?auto_275741 ) ( not ( = ?auto_275740 ?auto_275742 ) ) ( not ( = ?auto_275740 ?auto_275743 ) ) ( not ( = ?auto_275740 ?auto_275745 ) ) ( not ( = ?auto_275741 ?auto_275739 ) ) ( not ( = ?auto_275741 ?auto_275744 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275743 ?auto_275744 ?auto_275742 ?auto_275739 )
      ( GET-3IMAGE-VERIFY ?auto_275740 ?auto_275741 ?auto_275742 ?auto_275739 ?auto_275743 ?auto_275744 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_275758 - DIRECTION
      ?auto_275759 - MODE
      ?auto_275760 - DIRECTION
      ?auto_275757 - MODE
      ?auto_275761 - DIRECTION
      ?auto_275762 - MODE
    )
    :vars
    (
      ?auto_275765 - INSTRUMENT
      ?auto_275764 - SATELLITE
      ?auto_275763 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275765 ?auto_275764 ) ( SUPPORTS ?auto_275765 ?auto_275759 ) ( POINTING ?auto_275764 ?auto_275763 ) ( not ( = ?auto_275758 ?auto_275763 ) ) ( HAVE_IMAGE ?auto_275760 ?auto_275757 ) ( not ( = ?auto_275760 ?auto_275758 ) ) ( not ( = ?auto_275760 ?auto_275763 ) ) ( not ( = ?auto_275757 ?auto_275759 ) ) ( CALIBRATION_TARGET ?auto_275765 ?auto_275763 ) ( POWER_AVAIL ?auto_275764 ) ( HAVE_IMAGE ?auto_275761 ?auto_275762 ) ( not ( = ?auto_275758 ?auto_275761 ) ) ( not ( = ?auto_275759 ?auto_275762 ) ) ( not ( = ?auto_275760 ?auto_275761 ) ) ( not ( = ?auto_275757 ?auto_275762 ) ) ( not ( = ?auto_275761 ?auto_275763 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275760 ?auto_275757 ?auto_275758 ?auto_275759 )
      ( GET-3IMAGE-VERIFY ?auto_275758 ?auto_275759 ?auto_275760 ?auto_275757 ?auto_275761 ?auto_275762 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275796 - DIRECTION
      ?auto_275797 - MODE
      ?auto_275798 - DIRECTION
      ?auto_275795 - MODE
      ?auto_275799 - DIRECTION
      ?auto_275800 - MODE
      ?auto_275801 - DIRECTION
      ?auto_275802 - MODE
    )
    :vars
    (
      ?auto_275805 - INSTRUMENT
      ?auto_275804 - SATELLITE
      ?auto_275803 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275805 ?auto_275804 ) ( SUPPORTS ?auto_275805 ?auto_275802 ) ( POINTING ?auto_275804 ?auto_275803 ) ( not ( = ?auto_275801 ?auto_275803 ) ) ( HAVE_IMAGE ?auto_275798 ?auto_275797 ) ( not ( = ?auto_275798 ?auto_275801 ) ) ( not ( = ?auto_275798 ?auto_275803 ) ) ( not ( = ?auto_275797 ?auto_275802 ) ) ( CALIBRATION_TARGET ?auto_275805 ?auto_275803 ) ( POWER_AVAIL ?auto_275804 ) ( HAVE_IMAGE ?auto_275796 ?auto_275797 ) ( HAVE_IMAGE ?auto_275798 ?auto_275795 ) ( HAVE_IMAGE ?auto_275799 ?auto_275800 ) ( not ( = ?auto_275796 ?auto_275798 ) ) ( not ( = ?auto_275796 ?auto_275799 ) ) ( not ( = ?auto_275796 ?auto_275801 ) ) ( not ( = ?auto_275796 ?auto_275803 ) ) ( not ( = ?auto_275797 ?auto_275795 ) ) ( not ( = ?auto_275797 ?auto_275800 ) ) ( not ( = ?auto_275798 ?auto_275799 ) ) ( not ( = ?auto_275795 ?auto_275800 ) ) ( not ( = ?auto_275795 ?auto_275802 ) ) ( not ( = ?auto_275799 ?auto_275801 ) ) ( not ( = ?auto_275799 ?auto_275803 ) ) ( not ( = ?auto_275800 ?auto_275802 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275798 ?auto_275797 ?auto_275801 ?auto_275802 )
      ( GET-4IMAGE-VERIFY ?auto_275796 ?auto_275797 ?auto_275798 ?auto_275795 ?auto_275799 ?auto_275800 ?auto_275801 ?auto_275802 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275807 - DIRECTION
      ?auto_275808 - MODE
      ?auto_275809 - DIRECTION
      ?auto_275806 - MODE
      ?auto_275810 - DIRECTION
      ?auto_275811 - MODE
      ?auto_275812 - DIRECTION
      ?auto_275813 - MODE
    )
    :vars
    (
      ?auto_275816 - INSTRUMENT
      ?auto_275815 - SATELLITE
      ?auto_275814 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275816 ?auto_275815 ) ( SUPPORTS ?auto_275816 ?auto_275811 ) ( POINTING ?auto_275815 ?auto_275814 ) ( not ( = ?auto_275810 ?auto_275814 ) ) ( HAVE_IMAGE ?auto_275809 ?auto_275806 ) ( not ( = ?auto_275809 ?auto_275810 ) ) ( not ( = ?auto_275809 ?auto_275814 ) ) ( not ( = ?auto_275806 ?auto_275811 ) ) ( CALIBRATION_TARGET ?auto_275816 ?auto_275814 ) ( POWER_AVAIL ?auto_275815 ) ( HAVE_IMAGE ?auto_275807 ?auto_275808 ) ( HAVE_IMAGE ?auto_275812 ?auto_275813 ) ( not ( = ?auto_275807 ?auto_275809 ) ) ( not ( = ?auto_275807 ?auto_275810 ) ) ( not ( = ?auto_275807 ?auto_275812 ) ) ( not ( = ?auto_275807 ?auto_275814 ) ) ( not ( = ?auto_275808 ?auto_275806 ) ) ( not ( = ?auto_275808 ?auto_275811 ) ) ( not ( = ?auto_275808 ?auto_275813 ) ) ( not ( = ?auto_275809 ?auto_275812 ) ) ( not ( = ?auto_275806 ?auto_275813 ) ) ( not ( = ?auto_275810 ?auto_275812 ) ) ( not ( = ?auto_275811 ?auto_275813 ) ) ( not ( = ?auto_275812 ?auto_275814 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275809 ?auto_275806 ?auto_275810 ?auto_275811 )
      ( GET-4IMAGE-VERIFY ?auto_275807 ?auto_275808 ?auto_275809 ?auto_275806 ?auto_275810 ?auto_275811 ?auto_275812 ?auto_275813 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275829 - DIRECTION
      ?auto_275830 - MODE
      ?auto_275831 - DIRECTION
      ?auto_275828 - MODE
      ?auto_275832 - DIRECTION
      ?auto_275833 - MODE
      ?auto_275834 - DIRECTION
      ?auto_275835 - MODE
    )
    :vars
    (
      ?auto_275838 - INSTRUMENT
      ?auto_275837 - SATELLITE
      ?auto_275836 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275838 ?auto_275837 ) ( SUPPORTS ?auto_275838 ?auto_275828 ) ( POINTING ?auto_275837 ?auto_275836 ) ( not ( = ?auto_275831 ?auto_275836 ) ) ( HAVE_IMAGE ?auto_275832 ?auto_275830 ) ( not ( = ?auto_275832 ?auto_275831 ) ) ( not ( = ?auto_275832 ?auto_275836 ) ) ( not ( = ?auto_275830 ?auto_275828 ) ) ( CALIBRATION_TARGET ?auto_275838 ?auto_275836 ) ( POWER_AVAIL ?auto_275837 ) ( HAVE_IMAGE ?auto_275829 ?auto_275830 ) ( HAVE_IMAGE ?auto_275832 ?auto_275833 ) ( HAVE_IMAGE ?auto_275834 ?auto_275835 ) ( not ( = ?auto_275829 ?auto_275831 ) ) ( not ( = ?auto_275829 ?auto_275832 ) ) ( not ( = ?auto_275829 ?auto_275834 ) ) ( not ( = ?auto_275829 ?auto_275836 ) ) ( not ( = ?auto_275830 ?auto_275833 ) ) ( not ( = ?auto_275830 ?auto_275835 ) ) ( not ( = ?auto_275831 ?auto_275834 ) ) ( not ( = ?auto_275828 ?auto_275833 ) ) ( not ( = ?auto_275828 ?auto_275835 ) ) ( not ( = ?auto_275832 ?auto_275834 ) ) ( not ( = ?auto_275833 ?auto_275835 ) ) ( not ( = ?auto_275834 ?auto_275836 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275832 ?auto_275830 ?auto_275831 ?auto_275828 )
      ( GET-4IMAGE-VERIFY ?auto_275829 ?auto_275830 ?auto_275831 ?auto_275828 ?auto_275832 ?auto_275833 ?auto_275834 ?auto_275835 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_275873 - DIRECTION
      ?auto_275874 - MODE
      ?auto_275875 - DIRECTION
      ?auto_275872 - MODE
      ?auto_275876 - DIRECTION
      ?auto_275877 - MODE
      ?auto_275878 - DIRECTION
      ?auto_275879 - MODE
    )
    :vars
    (
      ?auto_275882 - INSTRUMENT
      ?auto_275881 - SATELLITE
      ?auto_275880 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275882 ?auto_275881 ) ( SUPPORTS ?auto_275882 ?auto_275874 ) ( POINTING ?auto_275881 ?auto_275880 ) ( not ( = ?auto_275873 ?auto_275880 ) ) ( HAVE_IMAGE ?auto_275875 ?auto_275877 ) ( not ( = ?auto_275875 ?auto_275873 ) ) ( not ( = ?auto_275875 ?auto_275880 ) ) ( not ( = ?auto_275877 ?auto_275874 ) ) ( CALIBRATION_TARGET ?auto_275882 ?auto_275880 ) ( POWER_AVAIL ?auto_275881 ) ( HAVE_IMAGE ?auto_275875 ?auto_275872 ) ( HAVE_IMAGE ?auto_275876 ?auto_275877 ) ( HAVE_IMAGE ?auto_275878 ?auto_275879 ) ( not ( = ?auto_275873 ?auto_275876 ) ) ( not ( = ?auto_275873 ?auto_275878 ) ) ( not ( = ?auto_275874 ?auto_275872 ) ) ( not ( = ?auto_275874 ?auto_275879 ) ) ( not ( = ?auto_275875 ?auto_275876 ) ) ( not ( = ?auto_275875 ?auto_275878 ) ) ( not ( = ?auto_275872 ?auto_275877 ) ) ( not ( = ?auto_275872 ?auto_275879 ) ) ( not ( = ?auto_275876 ?auto_275878 ) ) ( not ( = ?auto_275876 ?auto_275880 ) ) ( not ( = ?auto_275877 ?auto_275879 ) ) ( not ( = ?auto_275878 ?auto_275880 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275875 ?auto_275877 ?auto_275873 ?auto_275874 )
      ( GET-4IMAGE-VERIFY ?auto_275873 ?auto_275874 ?auto_275875 ?auto_275872 ?auto_275876 ?auto_275877 ?auto_275878 ?auto_275879 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_275962 - DIRECTION
      ?auto_275963 - MODE
    )
    :vars
    (
      ?auto_275968 - INSTRUMENT
      ?auto_275967 - SATELLITE
      ?auto_275964 - DIRECTION
      ?auto_275965 - DIRECTION
      ?auto_275966 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_275968 ?auto_275967 ) ( SUPPORTS ?auto_275968 ?auto_275963 ) ( not ( = ?auto_275962 ?auto_275964 ) ) ( HAVE_IMAGE ?auto_275965 ?auto_275966 ) ( not ( = ?auto_275965 ?auto_275962 ) ) ( not ( = ?auto_275965 ?auto_275964 ) ) ( not ( = ?auto_275966 ?auto_275963 ) ) ( CALIBRATION_TARGET ?auto_275968 ?auto_275964 ) ( POWER_AVAIL ?auto_275967 ) ( POINTING ?auto_275967 ?auto_275965 ) )
    :subtasks
    ( ( !TURN_TO ?auto_275967 ?auto_275964 ?auto_275965 )
      ( GET-2IMAGE ?auto_275965 ?auto_275966 ?auto_275962 ?auto_275963 )
      ( GET-1IMAGE-VERIFY ?auto_275962 ?auto_275963 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_275970 - DIRECTION
      ?auto_275971 - MODE
      ?auto_275972 - DIRECTION
      ?auto_275969 - MODE
    )
    :vars
    (
      ?auto_275974 - INSTRUMENT
      ?auto_275975 - SATELLITE
      ?auto_275973 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275974 ?auto_275975 ) ( SUPPORTS ?auto_275974 ?auto_275969 ) ( not ( = ?auto_275972 ?auto_275973 ) ) ( HAVE_IMAGE ?auto_275970 ?auto_275971 ) ( not ( = ?auto_275970 ?auto_275972 ) ) ( not ( = ?auto_275970 ?auto_275973 ) ) ( not ( = ?auto_275971 ?auto_275969 ) ) ( CALIBRATION_TARGET ?auto_275974 ?auto_275973 ) ( POWER_AVAIL ?auto_275975 ) ( POINTING ?auto_275975 ?auto_275970 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_275972 ?auto_275969 )
      ( GET-2IMAGE-VERIFY ?auto_275970 ?auto_275971 ?auto_275972 ?auto_275969 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_275977 - DIRECTION
      ?auto_275978 - MODE
      ?auto_275979 - DIRECTION
      ?auto_275976 - MODE
    )
    :vars
    (
      ?auto_275980 - INSTRUMENT
      ?auto_275981 - SATELLITE
      ?auto_275982 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275980 ?auto_275981 ) ( SUPPORTS ?auto_275980 ?auto_275978 ) ( not ( = ?auto_275977 ?auto_275982 ) ) ( HAVE_IMAGE ?auto_275979 ?auto_275976 ) ( not ( = ?auto_275979 ?auto_275977 ) ) ( not ( = ?auto_275979 ?auto_275982 ) ) ( not ( = ?auto_275976 ?auto_275978 ) ) ( CALIBRATION_TARGET ?auto_275980 ?auto_275982 ) ( POWER_AVAIL ?auto_275981 ) ( POINTING ?auto_275981 ?auto_275979 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275979 ?auto_275976 ?auto_275977 ?auto_275978 )
      ( GET-2IMAGE-VERIFY ?auto_275977 ?auto_275978 ?auto_275979 ?auto_275976 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_275993 - DIRECTION
      ?auto_275994 - MODE
      ?auto_275995 - DIRECTION
      ?auto_275992 - MODE
      ?auto_275996 - DIRECTION
      ?auto_275997 - MODE
    )
    :vars
    (
      ?auto_275998 - INSTRUMENT
      ?auto_275999 - SATELLITE
      ?auto_276000 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275998 ?auto_275999 ) ( SUPPORTS ?auto_275998 ?auto_275997 ) ( not ( = ?auto_275996 ?auto_276000 ) ) ( HAVE_IMAGE ?auto_275993 ?auto_275992 ) ( not ( = ?auto_275993 ?auto_275996 ) ) ( not ( = ?auto_275993 ?auto_276000 ) ) ( not ( = ?auto_275992 ?auto_275997 ) ) ( CALIBRATION_TARGET ?auto_275998 ?auto_276000 ) ( POWER_AVAIL ?auto_275999 ) ( POINTING ?auto_275999 ?auto_275993 ) ( HAVE_IMAGE ?auto_275993 ?auto_275994 ) ( HAVE_IMAGE ?auto_275995 ?auto_275992 ) ( not ( = ?auto_275993 ?auto_275995 ) ) ( not ( = ?auto_275994 ?auto_275992 ) ) ( not ( = ?auto_275994 ?auto_275997 ) ) ( not ( = ?auto_275995 ?auto_275996 ) ) ( not ( = ?auto_275995 ?auto_276000 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275993 ?auto_275992 ?auto_275996 ?auto_275997 )
      ( GET-3IMAGE-VERIFY ?auto_275993 ?auto_275994 ?auto_275995 ?auto_275992 ?auto_275996 ?auto_275997 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_276002 - DIRECTION
      ?auto_276003 - MODE
      ?auto_276004 - DIRECTION
      ?auto_276001 - MODE
      ?auto_276005 - DIRECTION
      ?auto_276006 - MODE
    )
    :vars
    (
      ?auto_276007 - INSTRUMENT
      ?auto_276008 - SATELLITE
      ?auto_276009 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_276007 ?auto_276008 ) ( SUPPORTS ?auto_276007 ?auto_276001 ) ( not ( = ?auto_276004 ?auto_276009 ) ) ( HAVE_IMAGE ?auto_276002 ?auto_276006 ) ( not ( = ?auto_276002 ?auto_276004 ) ) ( not ( = ?auto_276002 ?auto_276009 ) ) ( not ( = ?auto_276006 ?auto_276001 ) ) ( CALIBRATION_TARGET ?auto_276007 ?auto_276009 ) ( POWER_AVAIL ?auto_276008 ) ( POINTING ?auto_276008 ?auto_276002 ) ( HAVE_IMAGE ?auto_276002 ?auto_276003 ) ( HAVE_IMAGE ?auto_276005 ?auto_276006 ) ( not ( = ?auto_276002 ?auto_276005 ) ) ( not ( = ?auto_276003 ?auto_276001 ) ) ( not ( = ?auto_276003 ?auto_276006 ) ) ( not ( = ?auto_276004 ?auto_276005 ) ) ( not ( = ?auto_276005 ?auto_276009 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276002 ?auto_276006 ?auto_276004 ?auto_276001 )
      ( GET-3IMAGE-VERIFY ?auto_276002 ?auto_276003 ?auto_276004 ?auto_276001 ?auto_276005 ?auto_276006 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_276020 - DIRECTION
      ?auto_276021 - MODE
      ?auto_276022 - DIRECTION
      ?auto_276019 - MODE
      ?auto_276023 - DIRECTION
      ?auto_276024 - MODE
    )
    :vars
    (
      ?auto_276025 - INSTRUMENT
      ?auto_276026 - SATELLITE
      ?auto_276027 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_276025 ?auto_276026 ) ( SUPPORTS ?auto_276025 ?auto_276021 ) ( not ( = ?auto_276020 ?auto_276027 ) ) ( HAVE_IMAGE ?auto_276023 ?auto_276024 ) ( not ( = ?auto_276023 ?auto_276020 ) ) ( not ( = ?auto_276023 ?auto_276027 ) ) ( not ( = ?auto_276024 ?auto_276021 ) ) ( CALIBRATION_TARGET ?auto_276025 ?auto_276027 ) ( POWER_AVAIL ?auto_276026 ) ( POINTING ?auto_276026 ?auto_276023 ) ( HAVE_IMAGE ?auto_276022 ?auto_276019 ) ( not ( = ?auto_276020 ?auto_276022 ) ) ( not ( = ?auto_276021 ?auto_276019 ) ) ( not ( = ?auto_276022 ?auto_276023 ) ) ( not ( = ?auto_276022 ?auto_276027 ) ) ( not ( = ?auto_276019 ?auto_276024 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276023 ?auto_276024 ?auto_276020 ?auto_276021 )
      ( GET-3IMAGE-VERIFY ?auto_276020 ?auto_276021 ?auto_276022 ?auto_276019 ?auto_276023 ?auto_276024 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_276058 - DIRECTION
      ?auto_276059 - MODE
      ?auto_276060 - DIRECTION
      ?auto_276057 - MODE
      ?auto_276061 - DIRECTION
      ?auto_276062 - MODE
      ?auto_276063 - DIRECTION
      ?auto_276064 - MODE
    )
    :vars
    (
      ?auto_276065 - INSTRUMENT
      ?auto_276066 - SATELLITE
      ?auto_276067 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_276065 ?auto_276066 ) ( SUPPORTS ?auto_276065 ?auto_276064 ) ( not ( = ?auto_276063 ?auto_276067 ) ) ( HAVE_IMAGE ?auto_276060 ?auto_276057 ) ( not ( = ?auto_276060 ?auto_276063 ) ) ( not ( = ?auto_276060 ?auto_276067 ) ) ( not ( = ?auto_276057 ?auto_276064 ) ) ( CALIBRATION_TARGET ?auto_276065 ?auto_276067 ) ( POWER_AVAIL ?auto_276066 ) ( POINTING ?auto_276066 ?auto_276060 ) ( HAVE_IMAGE ?auto_276058 ?auto_276059 ) ( HAVE_IMAGE ?auto_276061 ?auto_276062 ) ( not ( = ?auto_276058 ?auto_276060 ) ) ( not ( = ?auto_276058 ?auto_276061 ) ) ( not ( = ?auto_276058 ?auto_276063 ) ) ( not ( = ?auto_276058 ?auto_276067 ) ) ( not ( = ?auto_276059 ?auto_276057 ) ) ( not ( = ?auto_276059 ?auto_276062 ) ) ( not ( = ?auto_276059 ?auto_276064 ) ) ( not ( = ?auto_276060 ?auto_276061 ) ) ( not ( = ?auto_276057 ?auto_276062 ) ) ( not ( = ?auto_276061 ?auto_276063 ) ) ( not ( = ?auto_276061 ?auto_276067 ) ) ( not ( = ?auto_276062 ?auto_276064 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276060 ?auto_276057 ?auto_276063 ?auto_276064 )
      ( GET-4IMAGE-VERIFY ?auto_276058 ?auto_276059 ?auto_276060 ?auto_276057 ?auto_276061 ?auto_276062 ?auto_276063 ?auto_276064 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_276069 - DIRECTION
      ?auto_276070 - MODE
      ?auto_276071 - DIRECTION
      ?auto_276068 - MODE
      ?auto_276072 - DIRECTION
      ?auto_276073 - MODE
      ?auto_276074 - DIRECTION
      ?auto_276075 - MODE
    )
    :vars
    (
      ?auto_276076 - INSTRUMENT
      ?auto_276077 - SATELLITE
      ?auto_276078 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_276076 ?auto_276077 ) ( SUPPORTS ?auto_276076 ?auto_276073 ) ( not ( = ?auto_276072 ?auto_276078 ) ) ( HAVE_IMAGE ?auto_276074 ?auto_276068 ) ( not ( = ?auto_276074 ?auto_276072 ) ) ( not ( = ?auto_276074 ?auto_276078 ) ) ( not ( = ?auto_276068 ?auto_276073 ) ) ( CALIBRATION_TARGET ?auto_276076 ?auto_276078 ) ( POWER_AVAIL ?auto_276077 ) ( POINTING ?auto_276077 ?auto_276074 ) ( HAVE_IMAGE ?auto_276069 ?auto_276070 ) ( HAVE_IMAGE ?auto_276071 ?auto_276068 ) ( HAVE_IMAGE ?auto_276074 ?auto_276075 ) ( not ( = ?auto_276069 ?auto_276071 ) ) ( not ( = ?auto_276069 ?auto_276072 ) ) ( not ( = ?auto_276069 ?auto_276074 ) ) ( not ( = ?auto_276069 ?auto_276078 ) ) ( not ( = ?auto_276070 ?auto_276068 ) ) ( not ( = ?auto_276070 ?auto_276073 ) ) ( not ( = ?auto_276070 ?auto_276075 ) ) ( not ( = ?auto_276071 ?auto_276072 ) ) ( not ( = ?auto_276071 ?auto_276074 ) ) ( not ( = ?auto_276071 ?auto_276078 ) ) ( not ( = ?auto_276068 ?auto_276075 ) ) ( not ( = ?auto_276073 ?auto_276075 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276074 ?auto_276068 ?auto_276072 ?auto_276073 )
      ( GET-4IMAGE-VERIFY ?auto_276069 ?auto_276070 ?auto_276071 ?auto_276068 ?auto_276072 ?auto_276073 ?auto_276074 ?auto_276075 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_276091 - DIRECTION
      ?auto_276092 - MODE
      ?auto_276093 - DIRECTION
      ?auto_276090 - MODE
      ?auto_276094 - DIRECTION
      ?auto_276095 - MODE
      ?auto_276096 - DIRECTION
      ?auto_276097 - MODE
    )
    :vars
    (
      ?auto_276098 - INSTRUMENT
      ?auto_276099 - SATELLITE
      ?auto_276100 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_276098 ?auto_276099 ) ( SUPPORTS ?auto_276098 ?auto_276090 ) ( not ( = ?auto_276093 ?auto_276100 ) ) ( HAVE_IMAGE ?auto_276091 ?auto_276095 ) ( not ( = ?auto_276091 ?auto_276093 ) ) ( not ( = ?auto_276091 ?auto_276100 ) ) ( not ( = ?auto_276095 ?auto_276090 ) ) ( CALIBRATION_TARGET ?auto_276098 ?auto_276100 ) ( POWER_AVAIL ?auto_276099 ) ( POINTING ?auto_276099 ?auto_276091 ) ( HAVE_IMAGE ?auto_276091 ?auto_276092 ) ( HAVE_IMAGE ?auto_276094 ?auto_276095 ) ( HAVE_IMAGE ?auto_276096 ?auto_276097 ) ( not ( = ?auto_276091 ?auto_276094 ) ) ( not ( = ?auto_276091 ?auto_276096 ) ) ( not ( = ?auto_276092 ?auto_276090 ) ) ( not ( = ?auto_276092 ?auto_276095 ) ) ( not ( = ?auto_276092 ?auto_276097 ) ) ( not ( = ?auto_276093 ?auto_276094 ) ) ( not ( = ?auto_276093 ?auto_276096 ) ) ( not ( = ?auto_276090 ?auto_276097 ) ) ( not ( = ?auto_276094 ?auto_276096 ) ) ( not ( = ?auto_276094 ?auto_276100 ) ) ( not ( = ?auto_276095 ?auto_276097 ) ) ( not ( = ?auto_276096 ?auto_276100 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276091 ?auto_276095 ?auto_276093 ?auto_276090 )
      ( GET-4IMAGE-VERIFY ?auto_276091 ?auto_276092 ?auto_276093 ?auto_276090 ?auto_276094 ?auto_276095 ?auto_276096 ?auto_276097 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_276135 - DIRECTION
      ?auto_276136 - MODE
      ?auto_276137 - DIRECTION
      ?auto_276134 - MODE
      ?auto_276138 - DIRECTION
      ?auto_276139 - MODE
      ?auto_276140 - DIRECTION
      ?auto_276141 - MODE
    )
    :vars
    (
      ?auto_276142 - INSTRUMENT
      ?auto_276143 - SATELLITE
      ?auto_276144 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_276142 ?auto_276143 ) ( SUPPORTS ?auto_276142 ?auto_276136 ) ( not ( = ?auto_276135 ?auto_276144 ) ) ( HAVE_IMAGE ?auto_276138 ?auto_276141 ) ( not ( = ?auto_276138 ?auto_276135 ) ) ( not ( = ?auto_276138 ?auto_276144 ) ) ( not ( = ?auto_276141 ?auto_276136 ) ) ( CALIBRATION_TARGET ?auto_276142 ?auto_276144 ) ( POWER_AVAIL ?auto_276143 ) ( POINTING ?auto_276143 ?auto_276138 ) ( HAVE_IMAGE ?auto_276137 ?auto_276134 ) ( HAVE_IMAGE ?auto_276138 ?auto_276139 ) ( HAVE_IMAGE ?auto_276140 ?auto_276141 ) ( not ( = ?auto_276135 ?auto_276137 ) ) ( not ( = ?auto_276135 ?auto_276140 ) ) ( not ( = ?auto_276136 ?auto_276134 ) ) ( not ( = ?auto_276136 ?auto_276139 ) ) ( not ( = ?auto_276137 ?auto_276138 ) ) ( not ( = ?auto_276137 ?auto_276140 ) ) ( not ( = ?auto_276137 ?auto_276144 ) ) ( not ( = ?auto_276134 ?auto_276139 ) ) ( not ( = ?auto_276134 ?auto_276141 ) ) ( not ( = ?auto_276138 ?auto_276140 ) ) ( not ( = ?auto_276139 ?auto_276141 ) ) ( not ( = ?auto_276140 ?auto_276144 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276138 ?auto_276141 ?auto_276135 ?auto_276136 )
      ( GET-4IMAGE-VERIFY ?auto_276135 ?auto_276136 ?auto_276137 ?auto_276134 ?auto_276138 ?auto_276139 ?auto_276140 ?auto_276141 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_276224 - DIRECTION
      ?auto_276225 - MODE
    )
    :vars
    (
      ?auto_276227 - INSTRUMENT
      ?auto_276229 - SATELLITE
      ?auto_276230 - DIRECTION
      ?auto_276228 - DIRECTION
      ?auto_276226 - MODE
      ?auto_276231 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276227 ?auto_276229 ) ( SUPPORTS ?auto_276227 ?auto_276225 ) ( not ( = ?auto_276224 ?auto_276230 ) ) ( HAVE_IMAGE ?auto_276228 ?auto_276226 ) ( not ( = ?auto_276228 ?auto_276224 ) ) ( not ( = ?auto_276228 ?auto_276230 ) ) ( not ( = ?auto_276226 ?auto_276225 ) ) ( CALIBRATION_TARGET ?auto_276227 ?auto_276230 ) ( POINTING ?auto_276229 ?auto_276228 ) ( ON_BOARD ?auto_276231 ?auto_276229 ) ( POWER_ON ?auto_276231 ) ( not ( = ?auto_276227 ?auto_276231 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_276231 ?auto_276229 )
      ( GET-2IMAGE ?auto_276228 ?auto_276226 ?auto_276224 ?auto_276225 )
      ( GET-1IMAGE-VERIFY ?auto_276224 ?auto_276225 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_276233 - DIRECTION
      ?auto_276234 - MODE
      ?auto_276235 - DIRECTION
      ?auto_276232 - MODE
    )
    :vars
    (
      ?auto_276239 - INSTRUMENT
      ?auto_276238 - SATELLITE
      ?auto_276236 - DIRECTION
      ?auto_276237 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276239 ?auto_276238 ) ( SUPPORTS ?auto_276239 ?auto_276232 ) ( not ( = ?auto_276235 ?auto_276236 ) ) ( HAVE_IMAGE ?auto_276233 ?auto_276234 ) ( not ( = ?auto_276233 ?auto_276235 ) ) ( not ( = ?auto_276233 ?auto_276236 ) ) ( not ( = ?auto_276234 ?auto_276232 ) ) ( CALIBRATION_TARGET ?auto_276239 ?auto_276236 ) ( POINTING ?auto_276238 ?auto_276233 ) ( ON_BOARD ?auto_276237 ?auto_276238 ) ( POWER_ON ?auto_276237 ) ( not ( = ?auto_276239 ?auto_276237 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_276235 ?auto_276232 )
      ( GET-2IMAGE-VERIFY ?auto_276233 ?auto_276234 ?auto_276235 ?auto_276232 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_276241 - DIRECTION
      ?auto_276242 - MODE
      ?auto_276243 - DIRECTION
      ?auto_276240 - MODE
    )
    :vars
    (
      ?auto_276244 - INSTRUMENT
      ?auto_276246 - SATELLITE
      ?auto_276247 - DIRECTION
      ?auto_276245 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276244 ?auto_276246 ) ( SUPPORTS ?auto_276244 ?auto_276242 ) ( not ( = ?auto_276241 ?auto_276247 ) ) ( HAVE_IMAGE ?auto_276243 ?auto_276240 ) ( not ( = ?auto_276243 ?auto_276241 ) ) ( not ( = ?auto_276243 ?auto_276247 ) ) ( not ( = ?auto_276240 ?auto_276242 ) ) ( CALIBRATION_TARGET ?auto_276244 ?auto_276247 ) ( POINTING ?auto_276246 ?auto_276243 ) ( ON_BOARD ?auto_276245 ?auto_276246 ) ( POWER_ON ?auto_276245 ) ( not ( = ?auto_276244 ?auto_276245 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276243 ?auto_276240 ?auto_276241 ?auto_276242 )
      ( GET-2IMAGE-VERIFY ?auto_276241 ?auto_276242 ?auto_276243 ?auto_276240 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_276259 - DIRECTION
      ?auto_276260 - MODE
      ?auto_276261 - DIRECTION
      ?auto_276258 - MODE
      ?auto_276262 - DIRECTION
      ?auto_276263 - MODE
    )
    :vars
    (
      ?auto_276264 - INSTRUMENT
      ?auto_276266 - SATELLITE
      ?auto_276267 - DIRECTION
      ?auto_276265 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276264 ?auto_276266 ) ( SUPPORTS ?auto_276264 ?auto_276263 ) ( not ( = ?auto_276262 ?auto_276267 ) ) ( HAVE_IMAGE ?auto_276259 ?auto_276260 ) ( not ( = ?auto_276259 ?auto_276262 ) ) ( not ( = ?auto_276259 ?auto_276267 ) ) ( not ( = ?auto_276260 ?auto_276263 ) ) ( CALIBRATION_TARGET ?auto_276264 ?auto_276267 ) ( POINTING ?auto_276266 ?auto_276259 ) ( ON_BOARD ?auto_276265 ?auto_276266 ) ( POWER_ON ?auto_276265 ) ( not ( = ?auto_276264 ?auto_276265 ) ) ( HAVE_IMAGE ?auto_276261 ?auto_276258 ) ( not ( = ?auto_276259 ?auto_276261 ) ) ( not ( = ?auto_276260 ?auto_276258 ) ) ( not ( = ?auto_276261 ?auto_276262 ) ) ( not ( = ?auto_276261 ?auto_276267 ) ) ( not ( = ?auto_276258 ?auto_276263 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276259 ?auto_276260 ?auto_276262 ?auto_276263 )
      ( GET-3IMAGE-VERIFY ?auto_276259 ?auto_276260 ?auto_276261 ?auto_276258 ?auto_276262 ?auto_276263 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_276269 - DIRECTION
      ?auto_276270 - MODE
      ?auto_276271 - DIRECTION
      ?auto_276268 - MODE
      ?auto_276272 - DIRECTION
      ?auto_276273 - MODE
    )
    :vars
    (
      ?auto_276274 - INSTRUMENT
      ?auto_276276 - SATELLITE
      ?auto_276277 - DIRECTION
      ?auto_276275 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276274 ?auto_276276 ) ( SUPPORTS ?auto_276274 ?auto_276268 ) ( not ( = ?auto_276271 ?auto_276277 ) ) ( HAVE_IMAGE ?auto_276272 ?auto_276273 ) ( not ( = ?auto_276272 ?auto_276271 ) ) ( not ( = ?auto_276272 ?auto_276277 ) ) ( not ( = ?auto_276273 ?auto_276268 ) ) ( CALIBRATION_TARGET ?auto_276274 ?auto_276277 ) ( POINTING ?auto_276276 ?auto_276272 ) ( ON_BOARD ?auto_276275 ?auto_276276 ) ( POWER_ON ?auto_276275 ) ( not ( = ?auto_276274 ?auto_276275 ) ) ( HAVE_IMAGE ?auto_276269 ?auto_276270 ) ( not ( = ?auto_276269 ?auto_276271 ) ) ( not ( = ?auto_276269 ?auto_276272 ) ) ( not ( = ?auto_276269 ?auto_276277 ) ) ( not ( = ?auto_276270 ?auto_276268 ) ) ( not ( = ?auto_276270 ?auto_276273 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276272 ?auto_276273 ?auto_276271 ?auto_276268 )
      ( GET-3IMAGE-VERIFY ?auto_276269 ?auto_276270 ?auto_276271 ?auto_276268 ?auto_276272 ?auto_276273 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_276289 - DIRECTION
      ?auto_276290 - MODE
      ?auto_276291 - DIRECTION
      ?auto_276288 - MODE
      ?auto_276292 - DIRECTION
      ?auto_276293 - MODE
    )
    :vars
    (
      ?auto_276294 - INSTRUMENT
      ?auto_276296 - SATELLITE
      ?auto_276297 - DIRECTION
      ?auto_276295 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276294 ?auto_276296 ) ( SUPPORTS ?auto_276294 ?auto_276290 ) ( not ( = ?auto_276289 ?auto_276297 ) ) ( HAVE_IMAGE ?auto_276292 ?auto_276288 ) ( not ( = ?auto_276292 ?auto_276289 ) ) ( not ( = ?auto_276292 ?auto_276297 ) ) ( not ( = ?auto_276288 ?auto_276290 ) ) ( CALIBRATION_TARGET ?auto_276294 ?auto_276297 ) ( POINTING ?auto_276296 ?auto_276292 ) ( ON_BOARD ?auto_276295 ?auto_276296 ) ( POWER_ON ?auto_276295 ) ( not ( = ?auto_276294 ?auto_276295 ) ) ( HAVE_IMAGE ?auto_276291 ?auto_276288 ) ( HAVE_IMAGE ?auto_276292 ?auto_276293 ) ( not ( = ?auto_276289 ?auto_276291 ) ) ( not ( = ?auto_276290 ?auto_276293 ) ) ( not ( = ?auto_276291 ?auto_276292 ) ) ( not ( = ?auto_276291 ?auto_276297 ) ) ( not ( = ?auto_276288 ?auto_276293 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276292 ?auto_276288 ?auto_276289 ?auto_276290 )
      ( GET-3IMAGE-VERIFY ?auto_276289 ?auto_276290 ?auto_276291 ?auto_276288 ?auto_276292 ?auto_276293 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_276331 - DIRECTION
      ?auto_276332 - MODE
      ?auto_276333 - DIRECTION
      ?auto_276330 - MODE
      ?auto_276334 - DIRECTION
      ?auto_276335 - MODE
      ?auto_276336 - DIRECTION
      ?auto_276337 - MODE
    )
    :vars
    (
      ?auto_276338 - INSTRUMENT
      ?auto_276340 - SATELLITE
      ?auto_276341 - DIRECTION
      ?auto_276339 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276338 ?auto_276340 ) ( SUPPORTS ?auto_276338 ?auto_276337 ) ( not ( = ?auto_276336 ?auto_276341 ) ) ( HAVE_IMAGE ?auto_276334 ?auto_276330 ) ( not ( = ?auto_276334 ?auto_276336 ) ) ( not ( = ?auto_276334 ?auto_276341 ) ) ( not ( = ?auto_276330 ?auto_276337 ) ) ( CALIBRATION_TARGET ?auto_276338 ?auto_276341 ) ( POINTING ?auto_276340 ?auto_276334 ) ( ON_BOARD ?auto_276339 ?auto_276340 ) ( POWER_ON ?auto_276339 ) ( not ( = ?auto_276338 ?auto_276339 ) ) ( HAVE_IMAGE ?auto_276331 ?auto_276332 ) ( HAVE_IMAGE ?auto_276333 ?auto_276330 ) ( HAVE_IMAGE ?auto_276334 ?auto_276335 ) ( not ( = ?auto_276331 ?auto_276333 ) ) ( not ( = ?auto_276331 ?auto_276334 ) ) ( not ( = ?auto_276331 ?auto_276336 ) ) ( not ( = ?auto_276331 ?auto_276341 ) ) ( not ( = ?auto_276332 ?auto_276330 ) ) ( not ( = ?auto_276332 ?auto_276335 ) ) ( not ( = ?auto_276332 ?auto_276337 ) ) ( not ( = ?auto_276333 ?auto_276334 ) ) ( not ( = ?auto_276333 ?auto_276336 ) ) ( not ( = ?auto_276333 ?auto_276341 ) ) ( not ( = ?auto_276330 ?auto_276335 ) ) ( not ( = ?auto_276335 ?auto_276337 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276334 ?auto_276330 ?auto_276336 ?auto_276337 )
      ( GET-4IMAGE-VERIFY ?auto_276331 ?auto_276332 ?auto_276333 ?auto_276330 ?auto_276334 ?auto_276335 ?auto_276336 ?auto_276337 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_276343 - DIRECTION
      ?auto_276344 - MODE
      ?auto_276345 - DIRECTION
      ?auto_276342 - MODE
      ?auto_276346 - DIRECTION
      ?auto_276347 - MODE
      ?auto_276348 - DIRECTION
      ?auto_276349 - MODE
    )
    :vars
    (
      ?auto_276350 - INSTRUMENT
      ?auto_276352 - SATELLITE
      ?auto_276353 - DIRECTION
      ?auto_276351 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276350 ?auto_276352 ) ( SUPPORTS ?auto_276350 ?auto_276347 ) ( not ( = ?auto_276346 ?auto_276353 ) ) ( HAVE_IMAGE ?auto_276345 ?auto_276349 ) ( not ( = ?auto_276345 ?auto_276346 ) ) ( not ( = ?auto_276345 ?auto_276353 ) ) ( not ( = ?auto_276349 ?auto_276347 ) ) ( CALIBRATION_TARGET ?auto_276350 ?auto_276353 ) ( POINTING ?auto_276352 ?auto_276345 ) ( ON_BOARD ?auto_276351 ?auto_276352 ) ( POWER_ON ?auto_276351 ) ( not ( = ?auto_276350 ?auto_276351 ) ) ( HAVE_IMAGE ?auto_276343 ?auto_276344 ) ( HAVE_IMAGE ?auto_276345 ?auto_276342 ) ( HAVE_IMAGE ?auto_276348 ?auto_276349 ) ( not ( = ?auto_276343 ?auto_276345 ) ) ( not ( = ?auto_276343 ?auto_276346 ) ) ( not ( = ?auto_276343 ?auto_276348 ) ) ( not ( = ?auto_276343 ?auto_276353 ) ) ( not ( = ?auto_276344 ?auto_276342 ) ) ( not ( = ?auto_276344 ?auto_276347 ) ) ( not ( = ?auto_276344 ?auto_276349 ) ) ( not ( = ?auto_276345 ?auto_276348 ) ) ( not ( = ?auto_276342 ?auto_276347 ) ) ( not ( = ?auto_276342 ?auto_276349 ) ) ( not ( = ?auto_276346 ?auto_276348 ) ) ( not ( = ?auto_276348 ?auto_276353 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276345 ?auto_276349 ?auto_276346 ?auto_276347 )
      ( GET-4IMAGE-VERIFY ?auto_276343 ?auto_276344 ?auto_276345 ?auto_276342 ?auto_276346 ?auto_276347 ?auto_276348 ?auto_276349 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_276367 - DIRECTION
      ?auto_276368 - MODE
      ?auto_276369 - DIRECTION
      ?auto_276366 - MODE
      ?auto_276370 - DIRECTION
      ?auto_276371 - MODE
      ?auto_276372 - DIRECTION
      ?auto_276373 - MODE
    )
    :vars
    (
      ?auto_276374 - INSTRUMENT
      ?auto_276376 - SATELLITE
      ?auto_276377 - DIRECTION
      ?auto_276375 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276374 ?auto_276376 ) ( SUPPORTS ?auto_276374 ?auto_276366 ) ( not ( = ?auto_276369 ?auto_276377 ) ) ( HAVE_IMAGE ?auto_276372 ?auto_276373 ) ( not ( = ?auto_276372 ?auto_276369 ) ) ( not ( = ?auto_276372 ?auto_276377 ) ) ( not ( = ?auto_276373 ?auto_276366 ) ) ( CALIBRATION_TARGET ?auto_276374 ?auto_276377 ) ( POINTING ?auto_276376 ?auto_276372 ) ( ON_BOARD ?auto_276375 ?auto_276376 ) ( POWER_ON ?auto_276375 ) ( not ( = ?auto_276374 ?auto_276375 ) ) ( HAVE_IMAGE ?auto_276367 ?auto_276368 ) ( HAVE_IMAGE ?auto_276370 ?auto_276371 ) ( not ( = ?auto_276367 ?auto_276369 ) ) ( not ( = ?auto_276367 ?auto_276370 ) ) ( not ( = ?auto_276367 ?auto_276372 ) ) ( not ( = ?auto_276367 ?auto_276377 ) ) ( not ( = ?auto_276368 ?auto_276366 ) ) ( not ( = ?auto_276368 ?auto_276371 ) ) ( not ( = ?auto_276368 ?auto_276373 ) ) ( not ( = ?auto_276369 ?auto_276370 ) ) ( not ( = ?auto_276366 ?auto_276371 ) ) ( not ( = ?auto_276370 ?auto_276372 ) ) ( not ( = ?auto_276370 ?auto_276377 ) ) ( not ( = ?auto_276371 ?auto_276373 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276372 ?auto_276373 ?auto_276369 ?auto_276366 )
      ( GET-4IMAGE-VERIFY ?auto_276367 ?auto_276368 ?auto_276369 ?auto_276366 ?auto_276370 ?auto_276371 ?auto_276372 ?auto_276373 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_276415 - DIRECTION
      ?auto_276416 - MODE
      ?auto_276417 - DIRECTION
      ?auto_276414 - MODE
      ?auto_276418 - DIRECTION
      ?auto_276419 - MODE
      ?auto_276420 - DIRECTION
      ?auto_276421 - MODE
    )
    :vars
    (
      ?auto_276422 - INSTRUMENT
      ?auto_276424 - SATELLITE
      ?auto_276425 - DIRECTION
      ?auto_276423 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276422 ?auto_276424 ) ( SUPPORTS ?auto_276422 ?auto_276416 ) ( not ( = ?auto_276415 ?auto_276425 ) ) ( HAVE_IMAGE ?auto_276417 ?auto_276421 ) ( not ( = ?auto_276417 ?auto_276415 ) ) ( not ( = ?auto_276417 ?auto_276425 ) ) ( not ( = ?auto_276421 ?auto_276416 ) ) ( CALIBRATION_TARGET ?auto_276422 ?auto_276425 ) ( POINTING ?auto_276424 ?auto_276417 ) ( ON_BOARD ?auto_276423 ?auto_276424 ) ( POWER_ON ?auto_276423 ) ( not ( = ?auto_276422 ?auto_276423 ) ) ( HAVE_IMAGE ?auto_276417 ?auto_276414 ) ( HAVE_IMAGE ?auto_276418 ?auto_276419 ) ( HAVE_IMAGE ?auto_276420 ?auto_276421 ) ( not ( = ?auto_276415 ?auto_276418 ) ) ( not ( = ?auto_276415 ?auto_276420 ) ) ( not ( = ?auto_276416 ?auto_276414 ) ) ( not ( = ?auto_276416 ?auto_276419 ) ) ( not ( = ?auto_276417 ?auto_276418 ) ) ( not ( = ?auto_276417 ?auto_276420 ) ) ( not ( = ?auto_276414 ?auto_276419 ) ) ( not ( = ?auto_276414 ?auto_276421 ) ) ( not ( = ?auto_276418 ?auto_276420 ) ) ( not ( = ?auto_276418 ?auto_276425 ) ) ( not ( = ?auto_276419 ?auto_276421 ) ) ( not ( = ?auto_276420 ?auto_276425 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276417 ?auto_276421 ?auto_276415 ?auto_276416 )
      ( GET-4IMAGE-VERIFY ?auto_276415 ?auto_276416 ?auto_276417 ?auto_276414 ?auto_276418 ?auto_276419 ?auto_276420 ?auto_276421 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_276512 - DIRECTION
      ?auto_276513 - MODE
    )
    :vars
    (
      ?auto_276514 - INSTRUMENT
      ?auto_276517 - SATELLITE
      ?auto_276518 - DIRECTION
      ?auto_276516 - DIRECTION
      ?auto_276519 - MODE
      ?auto_276515 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276514 ?auto_276517 ) ( SUPPORTS ?auto_276514 ?auto_276513 ) ( not ( = ?auto_276512 ?auto_276518 ) ) ( not ( = ?auto_276516 ?auto_276512 ) ) ( not ( = ?auto_276516 ?auto_276518 ) ) ( not ( = ?auto_276519 ?auto_276513 ) ) ( CALIBRATION_TARGET ?auto_276514 ?auto_276518 ) ( POINTING ?auto_276517 ?auto_276516 ) ( ON_BOARD ?auto_276515 ?auto_276517 ) ( POWER_ON ?auto_276515 ) ( not ( = ?auto_276514 ?auto_276515 ) ) ( CALIBRATED ?auto_276515 ) ( SUPPORTS ?auto_276515 ?auto_276519 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_276516 ?auto_276519 )
      ( GET-2IMAGE ?auto_276516 ?auto_276519 ?auto_276512 ?auto_276513 )
      ( GET-1IMAGE-VERIFY ?auto_276512 ?auto_276513 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_276521 - DIRECTION
      ?auto_276522 - MODE
      ?auto_276523 - DIRECTION
      ?auto_276520 - MODE
    )
    :vars
    (
      ?auto_276527 - INSTRUMENT
      ?auto_276524 - SATELLITE
      ?auto_276526 - DIRECTION
      ?auto_276525 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276527 ?auto_276524 ) ( SUPPORTS ?auto_276527 ?auto_276520 ) ( not ( = ?auto_276523 ?auto_276526 ) ) ( not ( = ?auto_276521 ?auto_276523 ) ) ( not ( = ?auto_276521 ?auto_276526 ) ) ( not ( = ?auto_276522 ?auto_276520 ) ) ( CALIBRATION_TARGET ?auto_276527 ?auto_276526 ) ( POINTING ?auto_276524 ?auto_276521 ) ( ON_BOARD ?auto_276525 ?auto_276524 ) ( POWER_ON ?auto_276525 ) ( not ( = ?auto_276527 ?auto_276525 ) ) ( CALIBRATED ?auto_276525 ) ( SUPPORTS ?auto_276525 ?auto_276522 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_276523 ?auto_276520 )
      ( GET-2IMAGE-VERIFY ?auto_276521 ?auto_276522 ?auto_276523 ?auto_276520 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_276529 - DIRECTION
      ?auto_276530 - MODE
      ?auto_276531 - DIRECTION
      ?auto_276528 - MODE
    )
    :vars
    (
      ?auto_276533 - INSTRUMENT
      ?auto_276532 - SATELLITE
      ?auto_276534 - DIRECTION
      ?auto_276535 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276533 ?auto_276532 ) ( SUPPORTS ?auto_276533 ?auto_276530 ) ( not ( = ?auto_276529 ?auto_276534 ) ) ( not ( = ?auto_276531 ?auto_276529 ) ) ( not ( = ?auto_276531 ?auto_276534 ) ) ( not ( = ?auto_276528 ?auto_276530 ) ) ( CALIBRATION_TARGET ?auto_276533 ?auto_276534 ) ( POINTING ?auto_276532 ?auto_276531 ) ( ON_BOARD ?auto_276535 ?auto_276532 ) ( POWER_ON ?auto_276535 ) ( not ( = ?auto_276533 ?auto_276535 ) ) ( CALIBRATED ?auto_276535 ) ( SUPPORTS ?auto_276535 ?auto_276528 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276531 ?auto_276528 ?auto_276529 ?auto_276530 )
      ( GET-2IMAGE-VERIFY ?auto_276529 ?auto_276530 ?auto_276531 ?auto_276528 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_276800 - DIRECTION
      ?auto_276801 - MODE
    )
    :vars
    (
      ?auto_276803 - INSTRUMENT
      ?auto_276802 - SATELLITE
      ?auto_276804 - DIRECTION
      ?auto_276806 - DIRECTION
      ?auto_276805 - MODE
      ?auto_276807 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276803 ?auto_276802 ) ( SUPPORTS ?auto_276803 ?auto_276801 ) ( not ( = ?auto_276800 ?auto_276804 ) ) ( not ( = ?auto_276806 ?auto_276800 ) ) ( not ( = ?auto_276806 ?auto_276804 ) ) ( not ( = ?auto_276805 ?auto_276801 ) ) ( CALIBRATION_TARGET ?auto_276803 ?auto_276804 ) ( ON_BOARD ?auto_276807 ?auto_276802 ) ( POWER_ON ?auto_276807 ) ( not ( = ?auto_276803 ?auto_276807 ) ) ( CALIBRATED ?auto_276807 ) ( SUPPORTS ?auto_276807 ?auto_276805 ) ( POINTING ?auto_276802 ?auto_276804 ) )
    :subtasks
    ( ( !TURN_TO ?auto_276802 ?auto_276806 ?auto_276804 )
      ( GET-2IMAGE ?auto_276806 ?auto_276805 ?auto_276800 ?auto_276801 )
      ( GET-1IMAGE-VERIFY ?auto_276800 ?auto_276801 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_276809 - DIRECTION
      ?auto_276810 - MODE
      ?auto_276811 - DIRECTION
      ?auto_276808 - MODE
    )
    :vars
    (
      ?auto_276813 - INSTRUMENT
      ?auto_276812 - SATELLITE
      ?auto_276815 - DIRECTION
      ?auto_276814 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276813 ?auto_276812 ) ( SUPPORTS ?auto_276813 ?auto_276808 ) ( not ( = ?auto_276811 ?auto_276815 ) ) ( not ( = ?auto_276809 ?auto_276811 ) ) ( not ( = ?auto_276809 ?auto_276815 ) ) ( not ( = ?auto_276810 ?auto_276808 ) ) ( CALIBRATION_TARGET ?auto_276813 ?auto_276815 ) ( ON_BOARD ?auto_276814 ?auto_276812 ) ( POWER_ON ?auto_276814 ) ( not ( = ?auto_276813 ?auto_276814 ) ) ( CALIBRATED ?auto_276814 ) ( SUPPORTS ?auto_276814 ?auto_276810 ) ( POINTING ?auto_276812 ?auto_276815 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_276811 ?auto_276808 )
      ( GET-2IMAGE-VERIFY ?auto_276809 ?auto_276810 ?auto_276811 ?auto_276808 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_276817 - DIRECTION
      ?auto_276818 - MODE
      ?auto_276819 - DIRECTION
      ?auto_276816 - MODE
    )
    :vars
    (
      ?auto_276823 - INSTRUMENT
      ?auto_276822 - SATELLITE
      ?auto_276821 - DIRECTION
      ?auto_276820 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_276823 ?auto_276822 ) ( SUPPORTS ?auto_276823 ?auto_276818 ) ( not ( = ?auto_276817 ?auto_276821 ) ) ( not ( = ?auto_276819 ?auto_276817 ) ) ( not ( = ?auto_276819 ?auto_276821 ) ) ( not ( = ?auto_276816 ?auto_276818 ) ) ( CALIBRATION_TARGET ?auto_276823 ?auto_276821 ) ( ON_BOARD ?auto_276820 ?auto_276822 ) ( POWER_ON ?auto_276820 ) ( not ( = ?auto_276823 ?auto_276820 ) ) ( CALIBRATED ?auto_276820 ) ( SUPPORTS ?auto_276820 ?auto_276816 ) ( POINTING ?auto_276822 ?auto_276821 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276819 ?auto_276816 ?auto_276817 ?auto_276818 )
      ( GET-2IMAGE-VERIFY ?auto_276817 ?auto_276818 ?auto_276819 ?auto_276816 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_277088 - DIRECTION
      ?auto_277089 - MODE
    )
    :vars
    (
      ?auto_277095 - INSTRUMENT
      ?auto_277092 - SATELLITE
      ?auto_277091 - DIRECTION
      ?auto_277094 - DIRECTION
      ?auto_277093 - MODE
      ?auto_277090 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_277095 ?auto_277092 ) ( SUPPORTS ?auto_277095 ?auto_277089 ) ( not ( = ?auto_277088 ?auto_277091 ) ) ( not ( = ?auto_277094 ?auto_277088 ) ) ( not ( = ?auto_277094 ?auto_277091 ) ) ( not ( = ?auto_277093 ?auto_277089 ) ) ( CALIBRATION_TARGET ?auto_277095 ?auto_277091 ) ( ON_BOARD ?auto_277090 ?auto_277092 ) ( POWER_ON ?auto_277090 ) ( not ( = ?auto_277095 ?auto_277090 ) ) ( SUPPORTS ?auto_277090 ?auto_277093 ) ( POINTING ?auto_277092 ?auto_277091 ) ( CALIBRATION_TARGET ?auto_277090 ?auto_277091 ) ( NOT_CALIBRATED ?auto_277090 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_277092 ?auto_277090 ?auto_277091 )
      ( GET-2IMAGE ?auto_277094 ?auto_277093 ?auto_277088 ?auto_277089 )
      ( GET-1IMAGE-VERIFY ?auto_277088 ?auto_277089 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_277097 - DIRECTION
      ?auto_277098 - MODE
      ?auto_277099 - DIRECTION
      ?auto_277096 - MODE
    )
    :vars
    (
      ?auto_277101 - INSTRUMENT
      ?auto_277102 - SATELLITE
      ?auto_277103 - DIRECTION
      ?auto_277100 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_277101 ?auto_277102 ) ( SUPPORTS ?auto_277101 ?auto_277096 ) ( not ( = ?auto_277099 ?auto_277103 ) ) ( not ( = ?auto_277097 ?auto_277099 ) ) ( not ( = ?auto_277097 ?auto_277103 ) ) ( not ( = ?auto_277098 ?auto_277096 ) ) ( CALIBRATION_TARGET ?auto_277101 ?auto_277103 ) ( ON_BOARD ?auto_277100 ?auto_277102 ) ( POWER_ON ?auto_277100 ) ( not ( = ?auto_277101 ?auto_277100 ) ) ( SUPPORTS ?auto_277100 ?auto_277098 ) ( POINTING ?auto_277102 ?auto_277103 ) ( CALIBRATION_TARGET ?auto_277100 ?auto_277103 ) ( NOT_CALIBRATED ?auto_277100 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_277099 ?auto_277096 )
      ( GET-2IMAGE-VERIFY ?auto_277097 ?auto_277098 ?auto_277099 ?auto_277096 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_277105 - DIRECTION
      ?auto_277106 - MODE
      ?auto_277107 - DIRECTION
      ?auto_277104 - MODE
    )
    :vars
    (
      ?auto_277109 - INSTRUMENT
      ?auto_277111 - SATELLITE
      ?auto_277108 - DIRECTION
      ?auto_277110 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_277109 ?auto_277111 ) ( SUPPORTS ?auto_277109 ?auto_277106 ) ( not ( = ?auto_277105 ?auto_277108 ) ) ( not ( = ?auto_277107 ?auto_277105 ) ) ( not ( = ?auto_277107 ?auto_277108 ) ) ( not ( = ?auto_277104 ?auto_277106 ) ) ( CALIBRATION_TARGET ?auto_277109 ?auto_277108 ) ( ON_BOARD ?auto_277110 ?auto_277111 ) ( POWER_ON ?auto_277110 ) ( not ( = ?auto_277109 ?auto_277110 ) ) ( SUPPORTS ?auto_277110 ?auto_277104 ) ( POINTING ?auto_277111 ?auto_277108 ) ( CALIBRATION_TARGET ?auto_277110 ?auto_277108 ) ( NOT_CALIBRATED ?auto_277110 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_277107 ?auto_277104 ?auto_277105 ?auto_277106 )
      ( GET-2IMAGE-VERIFY ?auto_277105 ?auto_277106 ?auto_277107 ?auto_277104 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_279416 - DIRECTION
      ?auto_279417 - MODE
      ?auto_279418 - DIRECTION
      ?auto_279415 - MODE
      ?auto_279419 - DIRECTION
      ?auto_279420 - MODE
    )
    :vars
    (
      ?auto_279423 - INSTRUMENT
      ?auto_279421 - SATELLITE
      ?auto_279422 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279423 ) ( ON_BOARD ?auto_279423 ?auto_279421 ) ( SUPPORTS ?auto_279423 ?auto_279420 ) ( POWER_ON ?auto_279423 ) ( POINTING ?auto_279421 ?auto_279422 ) ( not ( = ?auto_279419 ?auto_279422 ) ) ( HAVE_IMAGE ?auto_279418 ?auto_279417 ) ( not ( = ?auto_279418 ?auto_279419 ) ) ( not ( = ?auto_279418 ?auto_279422 ) ) ( not ( = ?auto_279417 ?auto_279420 ) ) ( HAVE_IMAGE ?auto_279416 ?auto_279417 ) ( HAVE_IMAGE ?auto_279418 ?auto_279415 ) ( not ( = ?auto_279416 ?auto_279418 ) ) ( not ( = ?auto_279416 ?auto_279419 ) ) ( not ( = ?auto_279416 ?auto_279422 ) ) ( not ( = ?auto_279417 ?auto_279415 ) ) ( not ( = ?auto_279415 ?auto_279420 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279418 ?auto_279417 ?auto_279419 ?auto_279420 )
      ( GET-3IMAGE-VERIFY ?auto_279416 ?auto_279417 ?auto_279418 ?auto_279415 ?auto_279419 ?auto_279420 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_279434 - DIRECTION
      ?auto_279435 - MODE
      ?auto_279436 - DIRECTION
      ?auto_279433 - MODE
      ?auto_279437 - DIRECTION
      ?auto_279438 - MODE
    )
    :vars
    (
      ?auto_279441 - INSTRUMENT
      ?auto_279439 - SATELLITE
      ?auto_279440 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279441 ) ( ON_BOARD ?auto_279441 ?auto_279439 ) ( SUPPORTS ?auto_279441 ?auto_279433 ) ( POWER_ON ?auto_279441 ) ( POINTING ?auto_279439 ?auto_279440 ) ( not ( = ?auto_279436 ?auto_279440 ) ) ( HAVE_IMAGE ?auto_279437 ?auto_279438 ) ( not ( = ?auto_279437 ?auto_279436 ) ) ( not ( = ?auto_279437 ?auto_279440 ) ) ( not ( = ?auto_279438 ?auto_279433 ) ) ( HAVE_IMAGE ?auto_279434 ?auto_279435 ) ( not ( = ?auto_279434 ?auto_279436 ) ) ( not ( = ?auto_279434 ?auto_279437 ) ) ( not ( = ?auto_279434 ?auto_279440 ) ) ( not ( = ?auto_279435 ?auto_279433 ) ) ( not ( = ?auto_279435 ?auto_279438 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279437 ?auto_279438 ?auto_279436 ?auto_279433 )
      ( GET-3IMAGE-VERIFY ?auto_279434 ?auto_279435 ?auto_279436 ?auto_279433 ?auto_279437 ?auto_279438 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_279464 - DIRECTION
      ?auto_279465 - MODE
      ?auto_279466 - DIRECTION
      ?auto_279463 - MODE
      ?auto_279467 - DIRECTION
      ?auto_279468 - MODE
    )
    :vars
    (
      ?auto_279471 - INSTRUMENT
      ?auto_279469 - SATELLITE
      ?auto_279470 - DIRECTION
      ?auto_279473 - DIRECTION
      ?auto_279472 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_279471 ) ( ON_BOARD ?auto_279471 ?auto_279469 ) ( SUPPORTS ?auto_279471 ?auto_279468 ) ( POWER_ON ?auto_279471 ) ( POINTING ?auto_279469 ?auto_279470 ) ( not ( = ?auto_279467 ?auto_279470 ) ) ( HAVE_IMAGE ?auto_279473 ?auto_279472 ) ( not ( = ?auto_279473 ?auto_279467 ) ) ( not ( = ?auto_279473 ?auto_279470 ) ) ( not ( = ?auto_279472 ?auto_279468 ) ) ( HAVE_IMAGE ?auto_279464 ?auto_279465 ) ( HAVE_IMAGE ?auto_279466 ?auto_279463 ) ( not ( = ?auto_279464 ?auto_279466 ) ) ( not ( = ?auto_279464 ?auto_279467 ) ) ( not ( = ?auto_279464 ?auto_279470 ) ) ( not ( = ?auto_279464 ?auto_279473 ) ) ( not ( = ?auto_279465 ?auto_279463 ) ) ( not ( = ?auto_279465 ?auto_279468 ) ) ( not ( = ?auto_279465 ?auto_279472 ) ) ( not ( = ?auto_279466 ?auto_279467 ) ) ( not ( = ?auto_279466 ?auto_279470 ) ) ( not ( = ?auto_279466 ?auto_279473 ) ) ( not ( = ?auto_279463 ?auto_279468 ) ) ( not ( = ?auto_279463 ?auto_279472 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279473 ?auto_279472 ?auto_279467 ?auto_279468 )
      ( GET-3IMAGE-VERIFY ?auto_279464 ?auto_279465 ?auto_279466 ?auto_279463 ?auto_279467 ?auto_279468 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_279481 - DIRECTION
      ?auto_279482 - MODE
      ?auto_279483 - DIRECTION
      ?auto_279480 - MODE
      ?auto_279484 - DIRECTION
      ?auto_279485 - MODE
    )
    :vars
    (
      ?auto_279488 - INSTRUMENT
      ?auto_279486 - SATELLITE
      ?auto_279487 - DIRECTION
      ?auto_279490 - DIRECTION
      ?auto_279489 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_279488 ) ( ON_BOARD ?auto_279488 ?auto_279486 ) ( SUPPORTS ?auto_279488 ?auto_279480 ) ( POWER_ON ?auto_279488 ) ( POINTING ?auto_279486 ?auto_279487 ) ( not ( = ?auto_279483 ?auto_279487 ) ) ( HAVE_IMAGE ?auto_279490 ?auto_279489 ) ( not ( = ?auto_279490 ?auto_279483 ) ) ( not ( = ?auto_279490 ?auto_279487 ) ) ( not ( = ?auto_279489 ?auto_279480 ) ) ( HAVE_IMAGE ?auto_279481 ?auto_279482 ) ( HAVE_IMAGE ?auto_279484 ?auto_279485 ) ( not ( = ?auto_279481 ?auto_279483 ) ) ( not ( = ?auto_279481 ?auto_279484 ) ) ( not ( = ?auto_279481 ?auto_279487 ) ) ( not ( = ?auto_279481 ?auto_279490 ) ) ( not ( = ?auto_279482 ?auto_279480 ) ) ( not ( = ?auto_279482 ?auto_279485 ) ) ( not ( = ?auto_279482 ?auto_279489 ) ) ( not ( = ?auto_279483 ?auto_279484 ) ) ( not ( = ?auto_279480 ?auto_279485 ) ) ( not ( = ?auto_279484 ?auto_279487 ) ) ( not ( = ?auto_279484 ?auto_279490 ) ) ( not ( = ?auto_279485 ?auto_279489 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279490 ?auto_279489 ?auto_279483 ?auto_279480 )
      ( GET-3IMAGE-VERIFY ?auto_279481 ?auto_279482 ?auto_279483 ?auto_279480 ?auto_279484 ?auto_279485 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_279503 - DIRECTION
      ?auto_279504 - MODE
      ?auto_279505 - DIRECTION
      ?auto_279502 - MODE
      ?auto_279506 - DIRECTION
      ?auto_279507 - MODE
    )
    :vars
    (
      ?auto_279510 - INSTRUMENT
      ?auto_279508 - SATELLITE
      ?auto_279509 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279510 ) ( ON_BOARD ?auto_279510 ?auto_279508 ) ( SUPPORTS ?auto_279510 ?auto_279504 ) ( POWER_ON ?auto_279510 ) ( POINTING ?auto_279508 ?auto_279509 ) ( not ( = ?auto_279503 ?auto_279509 ) ) ( HAVE_IMAGE ?auto_279506 ?auto_279502 ) ( not ( = ?auto_279506 ?auto_279503 ) ) ( not ( = ?auto_279506 ?auto_279509 ) ) ( not ( = ?auto_279502 ?auto_279504 ) ) ( HAVE_IMAGE ?auto_279505 ?auto_279502 ) ( HAVE_IMAGE ?auto_279506 ?auto_279507 ) ( not ( = ?auto_279503 ?auto_279505 ) ) ( not ( = ?auto_279504 ?auto_279507 ) ) ( not ( = ?auto_279505 ?auto_279506 ) ) ( not ( = ?auto_279505 ?auto_279509 ) ) ( not ( = ?auto_279502 ?auto_279507 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279506 ?auto_279502 ?auto_279503 ?auto_279504 )
      ( GET-3IMAGE-VERIFY ?auto_279503 ?auto_279504 ?auto_279505 ?auto_279502 ?auto_279506 ?auto_279507 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_279512 - DIRECTION
      ?auto_279513 - MODE
      ?auto_279514 - DIRECTION
      ?auto_279511 - MODE
      ?auto_279515 - DIRECTION
      ?auto_279516 - MODE
    )
    :vars
    (
      ?auto_279519 - INSTRUMENT
      ?auto_279517 - SATELLITE
      ?auto_279518 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279519 ) ( ON_BOARD ?auto_279519 ?auto_279517 ) ( SUPPORTS ?auto_279519 ?auto_279513 ) ( POWER_ON ?auto_279519 ) ( POINTING ?auto_279517 ?auto_279518 ) ( not ( = ?auto_279512 ?auto_279518 ) ) ( HAVE_IMAGE ?auto_279514 ?auto_279511 ) ( not ( = ?auto_279514 ?auto_279512 ) ) ( not ( = ?auto_279514 ?auto_279518 ) ) ( not ( = ?auto_279511 ?auto_279513 ) ) ( HAVE_IMAGE ?auto_279515 ?auto_279516 ) ( not ( = ?auto_279512 ?auto_279515 ) ) ( not ( = ?auto_279513 ?auto_279516 ) ) ( not ( = ?auto_279514 ?auto_279515 ) ) ( not ( = ?auto_279511 ?auto_279516 ) ) ( not ( = ?auto_279515 ?auto_279518 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279514 ?auto_279511 ?auto_279512 ?auto_279513 )
      ( GET-3IMAGE-VERIFY ?auto_279512 ?auto_279513 ?auto_279514 ?auto_279511 ?auto_279515 ?auto_279516 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_279536 - DIRECTION
      ?auto_279537 - MODE
      ?auto_279538 - DIRECTION
      ?auto_279535 - MODE
      ?auto_279539 - DIRECTION
      ?auto_279540 - MODE
    )
    :vars
    (
      ?auto_279543 - INSTRUMENT
      ?auto_279541 - SATELLITE
      ?auto_279542 - DIRECTION
      ?auto_279545 - DIRECTION
      ?auto_279544 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_279543 ) ( ON_BOARD ?auto_279543 ?auto_279541 ) ( SUPPORTS ?auto_279543 ?auto_279537 ) ( POWER_ON ?auto_279543 ) ( POINTING ?auto_279541 ?auto_279542 ) ( not ( = ?auto_279536 ?auto_279542 ) ) ( HAVE_IMAGE ?auto_279545 ?auto_279544 ) ( not ( = ?auto_279545 ?auto_279536 ) ) ( not ( = ?auto_279545 ?auto_279542 ) ) ( not ( = ?auto_279544 ?auto_279537 ) ) ( HAVE_IMAGE ?auto_279538 ?auto_279535 ) ( HAVE_IMAGE ?auto_279539 ?auto_279540 ) ( not ( = ?auto_279536 ?auto_279538 ) ) ( not ( = ?auto_279536 ?auto_279539 ) ) ( not ( = ?auto_279537 ?auto_279535 ) ) ( not ( = ?auto_279537 ?auto_279540 ) ) ( not ( = ?auto_279538 ?auto_279539 ) ) ( not ( = ?auto_279538 ?auto_279542 ) ) ( not ( = ?auto_279538 ?auto_279545 ) ) ( not ( = ?auto_279535 ?auto_279540 ) ) ( not ( = ?auto_279535 ?auto_279544 ) ) ( not ( = ?auto_279539 ?auto_279542 ) ) ( not ( = ?auto_279539 ?auto_279545 ) ) ( not ( = ?auto_279540 ?auto_279544 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279545 ?auto_279544 ?auto_279536 ?auto_279537 )
      ( GET-3IMAGE-VERIFY ?auto_279536 ?auto_279537 ?auto_279538 ?auto_279535 ?auto_279539 ?auto_279540 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279589 - DIRECTION
      ?auto_279590 - MODE
      ?auto_279591 - DIRECTION
      ?auto_279588 - MODE
      ?auto_279592 - DIRECTION
      ?auto_279593 - MODE
      ?auto_279594 - DIRECTION
      ?auto_279595 - MODE
    )
    :vars
    (
      ?auto_279598 - INSTRUMENT
      ?auto_279596 - SATELLITE
      ?auto_279597 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279598 ) ( ON_BOARD ?auto_279598 ?auto_279596 ) ( SUPPORTS ?auto_279598 ?auto_279595 ) ( POWER_ON ?auto_279598 ) ( POINTING ?auto_279596 ?auto_279597 ) ( not ( = ?auto_279594 ?auto_279597 ) ) ( HAVE_IMAGE ?auto_279592 ?auto_279588 ) ( not ( = ?auto_279592 ?auto_279594 ) ) ( not ( = ?auto_279592 ?auto_279597 ) ) ( not ( = ?auto_279588 ?auto_279595 ) ) ( HAVE_IMAGE ?auto_279589 ?auto_279590 ) ( HAVE_IMAGE ?auto_279591 ?auto_279588 ) ( HAVE_IMAGE ?auto_279592 ?auto_279593 ) ( not ( = ?auto_279589 ?auto_279591 ) ) ( not ( = ?auto_279589 ?auto_279592 ) ) ( not ( = ?auto_279589 ?auto_279594 ) ) ( not ( = ?auto_279589 ?auto_279597 ) ) ( not ( = ?auto_279590 ?auto_279588 ) ) ( not ( = ?auto_279590 ?auto_279593 ) ) ( not ( = ?auto_279590 ?auto_279595 ) ) ( not ( = ?auto_279591 ?auto_279592 ) ) ( not ( = ?auto_279591 ?auto_279594 ) ) ( not ( = ?auto_279591 ?auto_279597 ) ) ( not ( = ?auto_279588 ?auto_279593 ) ) ( not ( = ?auto_279593 ?auto_279595 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279592 ?auto_279588 ?auto_279594 ?auto_279595 )
      ( GET-4IMAGE-VERIFY ?auto_279589 ?auto_279590 ?auto_279591 ?auto_279588 ?auto_279592 ?auto_279593 ?auto_279594 ?auto_279595 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279600 - DIRECTION
      ?auto_279601 - MODE
      ?auto_279602 - DIRECTION
      ?auto_279599 - MODE
      ?auto_279603 - DIRECTION
      ?auto_279604 - MODE
      ?auto_279605 - DIRECTION
      ?auto_279606 - MODE
    )
    :vars
    (
      ?auto_279609 - INSTRUMENT
      ?auto_279607 - SATELLITE
      ?auto_279608 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279609 ) ( ON_BOARD ?auto_279609 ?auto_279607 ) ( SUPPORTS ?auto_279609 ?auto_279606 ) ( POWER_ON ?auto_279609 ) ( POINTING ?auto_279607 ?auto_279608 ) ( not ( = ?auto_279605 ?auto_279608 ) ) ( HAVE_IMAGE ?auto_279600 ?auto_279599 ) ( not ( = ?auto_279600 ?auto_279605 ) ) ( not ( = ?auto_279600 ?auto_279608 ) ) ( not ( = ?auto_279599 ?auto_279606 ) ) ( HAVE_IMAGE ?auto_279600 ?auto_279601 ) ( HAVE_IMAGE ?auto_279602 ?auto_279599 ) ( HAVE_IMAGE ?auto_279603 ?auto_279604 ) ( not ( = ?auto_279600 ?auto_279602 ) ) ( not ( = ?auto_279600 ?auto_279603 ) ) ( not ( = ?auto_279601 ?auto_279599 ) ) ( not ( = ?auto_279601 ?auto_279604 ) ) ( not ( = ?auto_279601 ?auto_279606 ) ) ( not ( = ?auto_279602 ?auto_279603 ) ) ( not ( = ?auto_279602 ?auto_279605 ) ) ( not ( = ?auto_279602 ?auto_279608 ) ) ( not ( = ?auto_279599 ?auto_279604 ) ) ( not ( = ?auto_279603 ?auto_279605 ) ) ( not ( = ?auto_279603 ?auto_279608 ) ) ( not ( = ?auto_279604 ?auto_279606 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279600 ?auto_279599 ?auto_279605 ?auto_279606 )
      ( GET-4IMAGE-VERIFY ?auto_279600 ?auto_279601 ?auto_279602 ?auto_279599 ?auto_279603 ?auto_279604 ?auto_279605 ?auto_279606 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279611 - DIRECTION
      ?auto_279612 - MODE
      ?auto_279613 - DIRECTION
      ?auto_279610 - MODE
      ?auto_279614 - DIRECTION
      ?auto_279615 - MODE
      ?auto_279616 - DIRECTION
      ?auto_279617 - MODE
    )
    :vars
    (
      ?auto_279620 - INSTRUMENT
      ?auto_279618 - SATELLITE
      ?auto_279619 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279620 ) ( ON_BOARD ?auto_279620 ?auto_279618 ) ( SUPPORTS ?auto_279620 ?auto_279615 ) ( POWER_ON ?auto_279620 ) ( POINTING ?auto_279618 ?auto_279619 ) ( not ( = ?auto_279614 ?auto_279619 ) ) ( HAVE_IMAGE ?auto_279616 ?auto_279612 ) ( not ( = ?auto_279616 ?auto_279614 ) ) ( not ( = ?auto_279616 ?auto_279619 ) ) ( not ( = ?auto_279612 ?auto_279615 ) ) ( HAVE_IMAGE ?auto_279611 ?auto_279612 ) ( HAVE_IMAGE ?auto_279613 ?auto_279610 ) ( HAVE_IMAGE ?auto_279616 ?auto_279617 ) ( not ( = ?auto_279611 ?auto_279613 ) ) ( not ( = ?auto_279611 ?auto_279614 ) ) ( not ( = ?auto_279611 ?auto_279616 ) ) ( not ( = ?auto_279611 ?auto_279619 ) ) ( not ( = ?auto_279612 ?auto_279610 ) ) ( not ( = ?auto_279612 ?auto_279617 ) ) ( not ( = ?auto_279613 ?auto_279614 ) ) ( not ( = ?auto_279613 ?auto_279616 ) ) ( not ( = ?auto_279613 ?auto_279619 ) ) ( not ( = ?auto_279610 ?auto_279615 ) ) ( not ( = ?auto_279610 ?auto_279617 ) ) ( not ( = ?auto_279615 ?auto_279617 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279616 ?auto_279612 ?auto_279614 ?auto_279615 )
      ( GET-4IMAGE-VERIFY ?auto_279611 ?auto_279612 ?auto_279613 ?auto_279610 ?auto_279614 ?auto_279615 ?auto_279616 ?auto_279617 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279622 - DIRECTION
      ?auto_279623 - MODE
      ?auto_279624 - DIRECTION
      ?auto_279621 - MODE
      ?auto_279625 - DIRECTION
      ?auto_279626 - MODE
      ?auto_279627 - DIRECTION
      ?auto_279628 - MODE
    )
    :vars
    (
      ?auto_279631 - INSTRUMENT
      ?auto_279629 - SATELLITE
      ?auto_279630 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279631 ) ( ON_BOARD ?auto_279631 ?auto_279629 ) ( SUPPORTS ?auto_279631 ?auto_279626 ) ( POWER_ON ?auto_279631 ) ( POINTING ?auto_279629 ?auto_279630 ) ( not ( = ?auto_279625 ?auto_279630 ) ) ( HAVE_IMAGE ?auto_279624 ?auto_279623 ) ( not ( = ?auto_279624 ?auto_279625 ) ) ( not ( = ?auto_279624 ?auto_279630 ) ) ( not ( = ?auto_279623 ?auto_279626 ) ) ( HAVE_IMAGE ?auto_279622 ?auto_279623 ) ( HAVE_IMAGE ?auto_279624 ?auto_279621 ) ( HAVE_IMAGE ?auto_279627 ?auto_279628 ) ( not ( = ?auto_279622 ?auto_279624 ) ) ( not ( = ?auto_279622 ?auto_279625 ) ) ( not ( = ?auto_279622 ?auto_279627 ) ) ( not ( = ?auto_279622 ?auto_279630 ) ) ( not ( = ?auto_279623 ?auto_279621 ) ) ( not ( = ?auto_279623 ?auto_279628 ) ) ( not ( = ?auto_279624 ?auto_279627 ) ) ( not ( = ?auto_279621 ?auto_279626 ) ) ( not ( = ?auto_279621 ?auto_279628 ) ) ( not ( = ?auto_279625 ?auto_279627 ) ) ( not ( = ?auto_279626 ?auto_279628 ) ) ( not ( = ?auto_279627 ?auto_279630 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279624 ?auto_279623 ?auto_279625 ?auto_279626 )
      ( GET-4IMAGE-VERIFY ?auto_279622 ?auto_279623 ?auto_279624 ?auto_279621 ?auto_279625 ?auto_279626 ?auto_279627 ?auto_279628 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279644 - DIRECTION
      ?auto_279645 - MODE
      ?auto_279646 - DIRECTION
      ?auto_279643 - MODE
      ?auto_279647 - DIRECTION
      ?auto_279648 - MODE
      ?auto_279649 - DIRECTION
      ?auto_279650 - MODE
    )
    :vars
    (
      ?auto_279653 - INSTRUMENT
      ?auto_279651 - SATELLITE
      ?auto_279652 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279653 ) ( ON_BOARD ?auto_279653 ?auto_279651 ) ( SUPPORTS ?auto_279653 ?auto_279650 ) ( POWER_ON ?auto_279653 ) ( POINTING ?auto_279651 ?auto_279652 ) ( not ( = ?auto_279649 ?auto_279652 ) ) ( HAVE_IMAGE ?auto_279644 ?auto_279648 ) ( not ( = ?auto_279644 ?auto_279649 ) ) ( not ( = ?auto_279644 ?auto_279652 ) ) ( not ( = ?auto_279648 ?auto_279650 ) ) ( HAVE_IMAGE ?auto_279644 ?auto_279645 ) ( HAVE_IMAGE ?auto_279646 ?auto_279643 ) ( HAVE_IMAGE ?auto_279647 ?auto_279648 ) ( not ( = ?auto_279644 ?auto_279646 ) ) ( not ( = ?auto_279644 ?auto_279647 ) ) ( not ( = ?auto_279645 ?auto_279643 ) ) ( not ( = ?auto_279645 ?auto_279648 ) ) ( not ( = ?auto_279645 ?auto_279650 ) ) ( not ( = ?auto_279646 ?auto_279647 ) ) ( not ( = ?auto_279646 ?auto_279649 ) ) ( not ( = ?auto_279646 ?auto_279652 ) ) ( not ( = ?auto_279643 ?auto_279648 ) ) ( not ( = ?auto_279643 ?auto_279650 ) ) ( not ( = ?auto_279647 ?auto_279649 ) ) ( not ( = ?auto_279647 ?auto_279652 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279644 ?auto_279648 ?auto_279649 ?auto_279650 )
      ( GET-4IMAGE-VERIFY ?auto_279644 ?auto_279645 ?auto_279646 ?auto_279643 ?auto_279647 ?auto_279648 ?auto_279649 ?auto_279650 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279655 - DIRECTION
      ?auto_279656 - MODE
      ?auto_279657 - DIRECTION
      ?auto_279654 - MODE
      ?auto_279658 - DIRECTION
      ?auto_279659 - MODE
      ?auto_279660 - DIRECTION
      ?auto_279661 - MODE
    )
    :vars
    (
      ?auto_279664 - INSTRUMENT
      ?auto_279662 - SATELLITE
      ?auto_279663 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279664 ) ( ON_BOARD ?auto_279664 ?auto_279662 ) ( SUPPORTS ?auto_279664 ?auto_279661 ) ( POWER_ON ?auto_279664 ) ( POINTING ?auto_279662 ?auto_279663 ) ( not ( = ?auto_279660 ?auto_279663 ) ) ( HAVE_IMAGE ?auto_279655 ?auto_279656 ) ( not ( = ?auto_279655 ?auto_279660 ) ) ( not ( = ?auto_279655 ?auto_279663 ) ) ( not ( = ?auto_279656 ?auto_279661 ) ) ( HAVE_IMAGE ?auto_279657 ?auto_279654 ) ( HAVE_IMAGE ?auto_279658 ?auto_279659 ) ( not ( = ?auto_279655 ?auto_279657 ) ) ( not ( = ?auto_279655 ?auto_279658 ) ) ( not ( = ?auto_279656 ?auto_279654 ) ) ( not ( = ?auto_279656 ?auto_279659 ) ) ( not ( = ?auto_279657 ?auto_279658 ) ) ( not ( = ?auto_279657 ?auto_279660 ) ) ( not ( = ?auto_279657 ?auto_279663 ) ) ( not ( = ?auto_279654 ?auto_279659 ) ) ( not ( = ?auto_279654 ?auto_279661 ) ) ( not ( = ?auto_279658 ?auto_279660 ) ) ( not ( = ?auto_279658 ?auto_279663 ) ) ( not ( = ?auto_279659 ?auto_279661 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279655 ?auto_279656 ?auto_279660 ?auto_279661 )
      ( GET-4IMAGE-VERIFY ?auto_279655 ?auto_279656 ?auto_279657 ?auto_279654 ?auto_279658 ?auto_279659 ?auto_279660 ?auto_279661 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279666 - DIRECTION
      ?auto_279667 - MODE
      ?auto_279668 - DIRECTION
      ?auto_279665 - MODE
      ?auto_279669 - DIRECTION
      ?auto_279670 - MODE
      ?auto_279671 - DIRECTION
      ?auto_279672 - MODE
    )
    :vars
    (
      ?auto_279675 - INSTRUMENT
      ?auto_279673 - SATELLITE
      ?auto_279674 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279675 ) ( ON_BOARD ?auto_279675 ?auto_279673 ) ( SUPPORTS ?auto_279675 ?auto_279670 ) ( POWER_ON ?auto_279675 ) ( POINTING ?auto_279673 ?auto_279674 ) ( not ( = ?auto_279669 ?auto_279674 ) ) ( HAVE_IMAGE ?auto_279671 ?auto_279672 ) ( not ( = ?auto_279671 ?auto_279669 ) ) ( not ( = ?auto_279671 ?auto_279674 ) ) ( not ( = ?auto_279672 ?auto_279670 ) ) ( HAVE_IMAGE ?auto_279666 ?auto_279667 ) ( HAVE_IMAGE ?auto_279668 ?auto_279665 ) ( not ( = ?auto_279666 ?auto_279668 ) ) ( not ( = ?auto_279666 ?auto_279669 ) ) ( not ( = ?auto_279666 ?auto_279671 ) ) ( not ( = ?auto_279666 ?auto_279674 ) ) ( not ( = ?auto_279667 ?auto_279665 ) ) ( not ( = ?auto_279667 ?auto_279670 ) ) ( not ( = ?auto_279667 ?auto_279672 ) ) ( not ( = ?auto_279668 ?auto_279669 ) ) ( not ( = ?auto_279668 ?auto_279671 ) ) ( not ( = ?auto_279668 ?auto_279674 ) ) ( not ( = ?auto_279665 ?auto_279670 ) ) ( not ( = ?auto_279665 ?auto_279672 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279671 ?auto_279672 ?auto_279669 ?auto_279670 )
      ( GET-4IMAGE-VERIFY ?auto_279666 ?auto_279667 ?auto_279668 ?auto_279665 ?auto_279669 ?auto_279670 ?auto_279671 ?auto_279672 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279677 - DIRECTION
      ?auto_279678 - MODE
      ?auto_279679 - DIRECTION
      ?auto_279676 - MODE
      ?auto_279680 - DIRECTION
      ?auto_279681 - MODE
      ?auto_279682 - DIRECTION
      ?auto_279683 - MODE
    )
    :vars
    (
      ?auto_279686 - INSTRUMENT
      ?auto_279684 - SATELLITE
      ?auto_279685 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279686 ) ( ON_BOARD ?auto_279686 ?auto_279684 ) ( SUPPORTS ?auto_279686 ?auto_279681 ) ( POWER_ON ?auto_279686 ) ( POINTING ?auto_279684 ?auto_279685 ) ( not ( = ?auto_279680 ?auto_279685 ) ) ( HAVE_IMAGE ?auto_279677 ?auto_279678 ) ( not ( = ?auto_279677 ?auto_279680 ) ) ( not ( = ?auto_279677 ?auto_279685 ) ) ( not ( = ?auto_279678 ?auto_279681 ) ) ( HAVE_IMAGE ?auto_279679 ?auto_279676 ) ( HAVE_IMAGE ?auto_279682 ?auto_279683 ) ( not ( = ?auto_279677 ?auto_279679 ) ) ( not ( = ?auto_279677 ?auto_279682 ) ) ( not ( = ?auto_279678 ?auto_279676 ) ) ( not ( = ?auto_279678 ?auto_279683 ) ) ( not ( = ?auto_279679 ?auto_279680 ) ) ( not ( = ?auto_279679 ?auto_279682 ) ) ( not ( = ?auto_279679 ?auto_279685 ) ) ( not ( = ?auto_279676 ?auto_279681 ) ) ( not ( = ?auto_279676 ?auto_279683 ) ) ( not ( = ?auto_279680 ?auto_279682 ) ) ( not ( = ?auto_279681 ?auto_279683 ) ) ( not ( = ?auto_279682 ?auto_279685 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279677 ?auto_279678 ?auto_279680 ?auto_279681 )
      ( GET-4IMAGE-VERIFY ?auto_279677 ?auto_279678 ?auto_279679 ?auto_279676 ?auto_279680 ?auto_279681 ?auto_279682 ?auto_279683 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279699 - DIRECTION
      ?auto_279700 - MODE
      ?auto_279701 - DIRECTION
      ?auto_279698 - MODE
      ?auto_279702 - DIRECTION
      ?auto_279703 - MODE
      ?auto_279704 - DIRECTION
      ?auto_279705 - MODE
    )
    :vars
    (
      ?auto_279708 - INSTRUMENT
      ?auto_279706 - SATELLITE
      ?auto_279707 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279708 ) ( ON_BOARD ?auto_279708 ?auto_279706 ) ( SUPPORTS ?auto_279708 ?auto_279698 ) ( POWER_ON ?auto_279708 ) ( POINTING ?auto_279706 ?auto_279707 ) ( not ( = ?auto_279701 ?auto_279707 ) ) ( HAVE_IMAGE ?auto_279699 ?auto_279703 ) ( not ( = ?auto_279699 ?auto_279701 ) ) ( not ( = ?auto_279699 ?auto_279707 ) ) ( not ( = ?auto_279703 ?auto_279698 ) ) ( HAVE_IMAGE ?auto_279699 ?auto_279700 ) ( HAVE_IMAGE ?auto_279702 ?auto_279703 ) ( HAVE_IMAGE ?auto_279704 ?auto_279705 ) ( not ( = ?auto_279699 ?auto_279702 ) ) ( not ( = ?auto_279699 ?auto_279704 ) ) ( not ( = ?auto_279700 ?auto_279698 ) ) ( not ( = ?auto_279700 ?auto_279703 ) ) ( not ( = ?auto_279700 ?auto_279705 ) ) ( not ( = ?auto_279701 ?auto_279702 ) ) ( not ( = ?auto_279701 ?auto_279704 ) ) ( not ( = ?auto_279698 ?auto_279705 ) ) ( not ( = ?auto_279702 ?auto_279704 ) ) ( not ( = ?auto_279702 ?auto_279707 ) ) ( not ( = ?auto_279703 ?auto_279705 ) ) ( not ( = ?auto_279704 ?auto_279707 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279699 ?auto_279703 ?auto_279701 ?auto_279698 )
      ( GET-4IMAGE-VERIFY ?auto_279699 ?auto_279700 ?auto_279701 ?auto_279698 ?auto_279702 ?auto_279703 ?auto_279704 ?auto_279705 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279710 - DIRECTION
      ?auto_279711 - MODE
      ?auto_279712 - DIRECTION
      ?auto_279709 - MODE
      ?auto_279713 - DIRECTION
      ?auto_279714 - MODE
      ?auto_279715 - DIRECTION
      ?auto_279716 - MODE
    )
    :vars
    (
      ?auto_279719 - INSTRUMENT
      ?auto_279717 - SATELLITE
      ?auto_279718 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279719 ) ( ON_BOARD ?auto_279719 ?auto_279717 ) ( SUPPORTS ?auto_279719 ?auto_279709 ) ( POWER_ON ?auto_279719 ) ( POINTING ?auto_279717 ?auto_279718 ) ( not ( = ?auto_279712 ?auto_279718 ) ) ( HAVE_IMAGE ?auto_279710 ?auto_279711 ) ( not ( = ?auto_279710 ?auto_279712 ) ) ( not ( = ?auto_279710 ?auto_279718 ) ) ( not ( = ?auto_279711 ?auto_279709 ) ) ( HAVE_IMAGE ?auto_279713 ?auto_279714 ) ( HAVE_IMAGE ?auto_279715 ?auto_279716 ) ( not ( = ?auto_279710 ?auto_279713 ) ) ( not ( = ?auto_279710 ?auto_279715 ) ) ( not ( = ?auto_279711 ?auto_279714 ) ) ( not ( = ?auto_279711 ?auto_279716 ) ) ( not ( = ?auto_279712 ?auto_279713 ) ) ( not ( = ?auto_279712 ?auto_279715 ) ) ( not ( = ?auto_279709 ?auto_279714 ) ) ( not ( = ?auto_279709 ?auto_279716 ) ) ( not ( = ?auto_279713 ?auto_279715 ) ) ( not ( = ?auto_279713 ?auto_279718 ) ) ( not ( = ?auto_279714 ?auto_279716 ) ) ( not ( = ?auto_279715 ?auto_279718 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279710 ?auto_279711 ?auto_279712 ?auto_279709 )
      ( GET-4IMAGE-VERIFY ?auto_279710 ?auto_279711 ?auto_279712 ?auto_279709 ?auto_279713 ?auto_279714 ?auto_279715 ?auto_279716 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279732 - DIRECTION
      ?auto_279733 - MODE
      ?auto_279734 - DIRECTION
      ?auto_279731 - MODE
      ?auto_279735 - DIRECTION
      ?auto_279736 - MODE
      ?auto_279737 - DIRECTION
      ?auto_279738 - MODE
    )
    :vars
    (
      ?auto_279741 - INSTRUMENT
      ?auto_279739 - SATELLITE
      ?auto_279740 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279741 ) ( ON_BOARD ?auto_279741 ?auto_279739 ) ( SUPPORTS ?auto_279741 ?auto_279731 ) ( POWER_ON ?auto_279741 ) ( POINTING ?auto_279739 ?auto_279740 ) ( not ( = ?auto_279734 ?auto_279740 ) ) ( HAVE_IMAGE ?auto_279737 ?auto_279733 ) ( not ( = ?auto_279737 ?auto_279734 ) ) ( not ( = ?auto_279737 ?auto_279740 ) ) ( not ( = ?auto_279733 ?auto_279731 ) ) ( HAVE_IMAGE ?auto_279732 ?auto_279733 ) ( HAVE_IMAGE ?auto_279735 ?auto_279736 ) ( HAVE_IMAGE ?auto_279737 ?auto_279738 ) ( not ( = ?auto_279732 ?auto_279734 ) ) ( not ( = ?auto_279732 ?auto_279735 ) ) ( not ( = ?auto_279732 ?auto_279737 ) ) ( not ( = ?auto_279732 ?auto_279740 ) ) ( not ( = ?auto_279733 ?auto_279736 ) ) ( not ( = ?auto_279733 ?auto_279738 ) ) ( not ( = ?auto_279734 ?auto_279735 ) ) ( not ( = ?auto_279731 ?auto_279736 ) ) ( not ( = ?auto_279731 ?auto_279738 ) ) ( not ( = ?auto_279735 ?auto_279737 ) ) ( not ( = ?auto_279735 ?auto_279740 ) ) ( not ( = ?auto_279736 ?auto_279738 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279737 ?auto_279733 ?auto_279734 ?auto_279731 )
      ( GET-4IMAGE-VERIFY ?auto_279732 ?auto_279733 ?auto_279734 ?auto_279731 ?auto_279735 ?auto_279736 ?auto_279737 ?auto_279738 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279809 - DIRECTION
      ?auto_279810 - MODE
      ?auto_279811 - DIRECTION
      ?auto_279808 - MODE
      ?auto_279812 - DIRECTION
      ?auto_279813 - MODE
      ?auto_279814 - DIRECTION
      ?auto_279815 - MODE
    )
    :vars
    (
      ?auto_279818 - INSTRUMENT
      ?auto_279816 - SATELLITE
      ?auto_279817 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279818 ) ( ON_BOARD ?auto_279818 ?auto_279816 ) ( SUPPORTS ?auto_279818 ?auto_279815 ) ( POWER_ON ?auto_279818 ) ( POINTING ?auto_279816 ?auto_279817 ) ( not ( = ?auto_279814 ?auto_279817 ) ) ( HAVE_IMAGE ?auto_279811 ?auto_279808 ) ( not ( = ?auto_279811 ?auto_279814 ) ) ( not ( = ?auto_279811 ?auto_279817 ) ) ( not ( = ?auto_279808 ?auto_279815 ) ) ( HAVE_IMAGE ?auto_279809 ?auto_279810 ) ( HAVE_IMAGE ?auto_279812 ?auto_279813 ) ( not ( = ?auto_279809 ?auto_279811 ) ) ( not ( = ?auto_279809 ?auto_279812 ) ) ( not ( = ?auto_279809 ?auto_279814 ) ) ( not ( = ?auto_279809 ?auto_279817 ) ) ( not ( = ?auto_279810 ?auto_279808 ) ) ( not ( = ?auto_279810 ?auto_279813 ) ) ( not ( = ?auto_279810 ?auto_279815 ) ) ( not ( = ?auto_279811 ?auto_279812 ) ) ( not ( = ?auto_279808 ?auto_279813 ) ) ( not ( = ?auto_279812 ?auto_279814 ) ) ( not ( = ?auto_279812 ?auto_279817 ) ) ( not ( = ?auto_279813 ?auto_279815 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279811 ?auto_279808 ?auto_279814 ?auto_279815 )
      ( GET-4IMAGE-VERIFY ?auto_279809 ?auto_279810 ?auto_279811 ?auto_279808 ?auto_279812 ?auto_279813 ?auto_279814 ?auto_279815 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279831 - DIRECTION
      ?auto_279832 - MODE
      ?auto_279833 - DIRECTION
      ?auto_279830 - MODE
      ?auto_279834 - DIRECTION
      ?auto_279835 - MODE
      ?auto_279836 - DIRECTION
      ?auto_279837 - MODE
    )
    :vars
    (
      ?auto_279840 - INSTRUMENT
      ?auto_279838 - SATELLITE
      ?auto_279839 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279840 ) ( ON_BOARD ?auto_279840 ?auto_279838 ) ( SUPPORTS ?auto_279840 ?auto_279835 ) ( POWER_ON ?auto_279840 ) ( POINTING ?auto_279838 ?auto_279839 ) ( not ( = ?auto_279834 ?auto_279839 ) ) ( HAVE_IMAGE ?auto_279833 ?auto_279830 ) ( not ( = ?auto_279833 ?auto_279834 ) ) ( not ( = ?auto_279833 ?auto_279839 ) ) ( not ( = ?auto_279830 ?auto_279835 ) ) ( HAVE_IMAGE ?auto_279831 ?auto_279832 ) ( HAVE_IMAGE ?auto_279836 ?auto_279837 ) ( not ( = ?auto_279831 ?auto_279833 ) ) ( not ( = ?auto_279831 ?auto_279834 ) ) ( not ( = ?auto_279831 ?auto_279836 ) ) ( not ( = ?auto_279831 ?auto_279839 ) ) ( not ( = ?auto_279832 ?auto_279830 ) ) ( not ( = ?auto_279832 ?auto_279835 ) ) ( not ( = ?auto_279832 ?auto_279837 ) ) ( not ( = ?auto_279833 ?auto_279836 ) ) ( not ( = ?auto_279830 ?auto_279837 ) ) ( not ( = ?auto_279834 ?auto_279836 ) ) ( not ( = ?auto_279835 ?auto_279837 ) ) ( not ( = ?auto_279836 ?auto_279839 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279833 ?auto_279830 ?auto_279834 ?auto_279835 )
      ( GET-4IMAGE-VERIFY ?auto_279831 ?auto_279832 ?auto_279833 ?auto_279830 ?auto_279834 ?auto_279835 ?auto_279836 ?auto_279837 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279864 - DIRECTION
      ?auto_279865 - MODE
      ?auto_279866 - DIRECTION
      ?auto_279863 - MODE
      ?auto_279867 - DIRECTION
      ?auto_279868 - MODE
      ?auto_279869 - DIRECTION
      ?auto_279870 - MODE
    )
    :vars
    (
      ?auto_279873 - INSTRUMENT
      ?auto_279871 - SATELLITE
      ?auto_279872 - DIRECTION
      ?auto_279875 - DIRECTION
      ?auto_279874 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_279873 ) ( ON_BOARD ?auto_279873 ?auto_279871 ) ( SUPPORTS ?auto_279873 ?auto_279870 ) ( POWER_ON ?auto_279873 ) ( POINTING ?auto_279871 ?auto_279872 ) ( not ( = ?auto_279869 ?auto_279872 ) ) ( HAVE_IMAGE ?auto_279875 ?auto_279874 ) ( not ( = ?auto_279875 ?auto_279869 ) ) ( not ( = ?auto_279875 ?auto_279872 ) ) ( not ( = ?auto_279874 ?auto_279870 ) ) ( HAVE_IMAGE ?auto_279864 ?auto_279865 ) ( HAVE_IMAGE ?auto_279866 ?auto_279863 ) ( HAVE_IMAGE ?auto_279867 ?auto_279868 ) ( not ( = ?auto_279864 ?auto_279866 ) ) ( not ( = ?auto_279864 ?auto_279867 ) ) ( not ( = ?auto_279864 ?auto_279869 ) ) ( not ( = ?auto_279864 ?auto_279872 ) ) ( not ( = ?auto_279864 ?auto_279875 ) ) ( not ( = ?auto_279865 ?auto_279863 ) ) ( not ( = ?auto_279865 ?auto_279868 ) ) ( not ( = ?auto_279865 ?auto_279870 ) ) ( not ( = ?auto_279865 ?auto_279874 ) ) ( not ( = ?auto_279866 ?auto_279867 ) ) ( not ( = ?auto_279866 ?auto_279869 ) ) ( not ( = ?auto_279866 ?auto_279872 ) ) ( not ( = ?auto_279866 ?auto_279875 ) ) ( not ( = ?auto_279863 ?auto_279868 ) ) ( not ( = ?auto_279863 ?auto_279870 ) ) ( not ( = ?auto_279863 ?auto_279874 ) ) ( not ( = ?auto_279867 ?auto_279869 ) ) ( not ( = ?auto_279867 ?auto_279872 ) ) ( not ( = ?auto_279867 ?auto_279875 ) ) ( not ( = ?auto_279868 ?auto_279870 ) ) ( not ( = ?auto_279868 ?auto_279874 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279875 ?auto_279874 ?auto_279869 ?auto_279870 )
      ( GET-4IMAGE-VERIFY ?auto_279864 ?auto_279865 ?auto_279866 ?auto_279863 ?auto_279867 ?auto_279868 ?auto_279869 ?auto_279870 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279888 - DIRECTION
      ?auto_279889 - MODE
      ?auto_279890 - DIRECTION
      ?auto_279887 - MODE
      ?auto_279891 - DIRECTION
      ?auto_279892 - MODE
      ?auto_279893 - DIRECTION
      ?auto_279894 - MODE
    )
    :vars
    (
      ?auto_279897 - INSTRUMENT
      ?auto_279895 - SATELLITE
      ?auto_279896 - DIRECTION
      ?auto_279899 - DIRECTION
      ?auto_279898 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_279897 ) ( ON_BOARD ?auto_279897 ?auto_279895 ) ( SUPPORTS ?auto_279897 ?auto_279892 ) ( POWER_ON ?auto_279897 ) ( POINTING ?auto_279895 ?auto_279896 ) ( not ( = ?auto_279891 ?auto_279896 ) ) ( HAVE_IMAGE ?auto_279899 ?auto_279898 ) ( not ( = ?auto_279899 ?auto_279891 ) ) ( not ( = ?auto_279899 ?auto_279896 ) ) ( not ( = ?auto_279898 ?auto_279892 ) ) ( HAVE_IMAGE ?auto_279888 ?auto_279889 ) ( HAVE_IMAGE ?auto_279890 ?auto_279887 ) ( HAVE_IMAGE ?auto_279893 ?auto_279894 ) ( not ( = ?auto_279888 ?auto_279890 ) ) ( not ( = ?auto_279888 ?auto_279891 ) ) ( not ( = ?auto_279888 ?auto_279893 ) ) ( not ( = ?auto_279888 ?auto_279896 ) ) ( not ( = ?auto_279888 ?auto_279899 ) ) ( not ( = ?auto_279889 ?auto_279887 ) ) ( not ( = ?auto_279889 ?auto_279892 ) ) ( not ( = ?auto_279889 ?auto_279894 ) ) ( not ( = ?auto_279889 ?auto_279898 ) ) ( not ( = ?auto_279890 ?auto_279891 ) ) ( not ( = ?auto_279890 ?auto_279893 ) ) ( not ( = ?auto_279890 ?auto_279896 ) ) ( not ( = ?auto_279890 ?auto_279899 ) ) ( not ( = ?auto_279887 ?auto_279892 ) ) ( not ( = ?auto_279887 ?auto_279894 ) ) ( not ( = ?auto_279887 ?auto_279898 ) ) ( not ( = ?auto_279891 ?auto_279893 ) ) ( not ( = ?auto_279892 ?auto_279894 ) ) ( not ( = ?auto_279893 ?auto_279896 ) ) ( not ( = ?auto_279893 ?auto_279899 ) ) ( not ( = ?auto_279894 ?auto_279898 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279899 ?auto_279898 ?auto_279891 ?auto_279892 )
      ( GET-4IMAGE-VERIFY ?auto_279888 ?auto_279889 ?auto_279890 ?auto_279887 ?auto_279891 ?auto_279892 ?auto_279893 ?auto_279894 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279947 - DIRECTION
      ?auto_279948 - MODE
      ?auto_279949 - DIRECTION
      ?auto_279946 - MODE
      ?auto_279950 - DIRECTION
      ?auto_279951 - MODE
      ?auto_279952 - DIRECTION
      ?auto_279953 - MODE
    )
    :vars
    (
      ?auto_279956 - INSTRUMENT
      ?auto_279954 - SATELLITE
      ?auto_279955 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_279956 ) ( ON_BOARD ?auto_279956 ?auto_279954 ) ( SUPPORTS ?auto_279956 ?auto_279946 ) ( POWER_ON ?auto_279956 ) ( POINTING ?auto_279954 ?auto_279955 ) ( not ( = ?auto_279949 ?auto_279955 ) ) ( HAVE_IMAGE ?auto_279952 ?auto_279953 ) ( not ( = ?auto_279952 ?auto_279949 ) ) ( not ( = ?auto_279952 ?auto_279955 ) ) ( not ( = ?auto_279953 ?auto_279946 ) ) ( HAVE_IMAGE ?auto_279947 ?auto_279948 ) ( HAVE_IMAGE ?auto_279950 ?auto_279951 ) ( not ( = ?auto_279947 ?auto_279949 ) ) ( not ( = ?auto_279947 ?auto_279950 ) ) ( not ( = ?auto_279947 ?auto_279952 ) ) ( not ( = ?auto_279947 ?auto_279955 ) ) ( not ( = ?auto_279948 ?auto_279946 ) ) ( not ( = ?auto_279948 ?auto_279951 ) ) ( not ( = ?auto_279948 ?auto_279953 ) ) ( not ( = ?auto_279949 ?auto_279950 ) ) ( not ( = ?auto_279946 ?auto_279951 ) ) ( not ( = ?auto_279950 ?auto_279952 ) ) ( not ( = ?auto_279950 ?auto_279955 ) ) ( not ( = ?auto_279951 ?auto_279953 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279952 ?auto_279953 ?auto_279949 ?auto_279946 )
      ( GET-4IMAGE-VERIFY ?auto_279947 ?auto_279948 ?auto_279949 ?auto_279946 ?auto_279950 ?auto_279951 ?auto_279952 ?auto_279953 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_279958 - DIRECTION
      ?auto_279959 - MODE
      ?auto_279960 - DIRECTION
      ?auto_279957 - MODE
      ?auto_279961 - DIRECTION
      ?auto_279962 - MODE
      ?auto_279963 - DIRECTION
      ?auto_279964 - MODE
    )
    :vars
    (
      ?auto_279967 - INSTRUMENT
      ?auto_279965 - SATELLITE
      ?auto_279966 - DIRECTION
      ?auto_279969 - DIRECTION
      ?auto_279968 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_279967 ) ( ON_BOARD ?auto_279967 ?auto_279965 ) ( SUPPORTS ?auto_279967 ?auto_279957 ) ( POWER_ON ?auto_279967 ) ( POINTING ?auto_279965 ?auto_279966 ) ( not ( = ?auto_279960 ?auto_279966 ) ) ( HAVE_IMAGE ?auto_279969 ?auto_279968 ) ( not ( = ?auto_279969 ?auto_279960 ) ) ( not ( = ?auto_279969 ?auto_279966 ) ) ( not ( = ?auto_279968 ?auto_279957 ) ) ( HAVE_IMAGE ?auto_279958 ?auto_279959 ) ( HAVE_IMAGE ?auto_279961 ?auto_279962 ) ( HAVE_IMAGE ?auto_279963 ?auto_279964 ) ( not ( = ?auto_279958 ?auto_279960 ) ) ( not ( = ?auto_279958 ?auto_279961 ) ) ( not ( = ?auto_279958 ?auto_279963 ) ) ( not ( = ?auto_279958 ?auto_279966 ) ) ( not ( = ?auto_279958 ?auto_279969 ) ) ( not ( = ?auto_279959 ?auto_279957 ) ) ( not ( = ?auto_279959 ?auto_279962 ) ) ( not ( = ?auto_279959 ?auto_279964 ) ) ( not ( = ?auto_279959 ?auto_279968 ) ) ( not ( = ?auto_279960 ?auto_279961 ) ) ( not ( = ?auto_279960 ?auto_279963 ) ) ( not ( = ?auto_279957 ?auto_279962 ) ) ( not ( = ?auto_279957 ?auto_279964 ) ) ( not ( = ?auto_279961 ?auto_279963 ) ) ( not ( = ?auto_279961 ?auto_279966 ) ) ( not ( = ?auto_279961 ?auto_279969 ) ) ( not ( = ?auto_279962 ?auto_279964 ) ) ( not ( = ?auto_279962 ?auto_279968 ) ) ( not ( = ?auto_279963 ?auto_279966 ) ) ( not ( = ?auto_279963 ?auto_279969 ) ) ( not ( = ?auto_279964 ?auto_279968 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279969 ?auto_279968 ?auto_279960 ?auto_279957 )
      ( GET-4IMAGE-VERIFY ?auto_279958 ?auto_279959 ?auto_279960 ?auto_279957 ?auto_279961 ?auto_279962 ?auto_279963 ?auto_279964 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280021 - DIRECTION
      ?auto_280022 - MODE
      ?auto_280023 - DIRECTION
      ?auto_280020 - MODE
      ?auto_280024 - DIRECTION
      ?auto_280025 - MODE
      ?auto_280026 - DIRECTION
      ?auto_280027 - MODE
    )
    :vars
    (
      ?auto_280030 - INSTRUMENT
      ?auto_280028 - SATELLITE
      ?auto_280029 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_280030 ) ( ON_BOARD ?auto_280030 ?auto_280028 ) ( SUPPORTS ?auto_280030 ?auto_280022 ) ( POWER_ON ?auto_280030 ) ( POINTING ?auto_280028 ?auto_280029 ) ( not ( = ?auto_280021 ?auto_280029 ) ) ( HAVE_IMAGE ?auto_280023 ?auto_280020 ) ( not ( = ?auto_280023 ?auto_280021 ) ) ( not ( = ?auto_280023 ?auto_280029 ) ) ( not ( = ?auto_280020 ?auto_280022 ) ) ( HAVE_IMAGE ?auto_280024 ?auto_280025 ) ( HAVE_IMAGE ?auto_280026 ?auto_280027 ) ( not ( = ?auto_280021 ?auto_280024 ) ) ( not ( = ?auto_280021 ?auto_280026 ) ) ( not ( = ?auto_280022 ?auto_280025 ) ) ( not ( = ?auto_280022 ?auto_280027 ) ) ( not ( = ?auto_280023 ?auto_280024 ) ) ( not ( = ?auto_280023 ?auto_280026 ) ) ( not ( = ?auto_280020 ?auto_280025 ) ) ( not ( = ?auto_280020 ?auto_280027 ) ) ( not ( = ?auto_280024 ?auto_280026 ) ) ( not ( = ?auto_280024 ?auto_280029 ) ) ( not ( = ?auto_280025 ?auto_280027 ) ) ( not ( = ?auto_280026 ?auto_280029 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280023 ?auto_280020 ?auto_280021 ?auto_280022 )
      ( GET-4IMAGE-VERIFY ?auto_280021 ?auto_280022 ?auto_280023 ?auto_280020 ?auto_280024 ?auto_280025 ?auto_280026 ?auto_280027 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280032 - DIRECTION
      ?auto_280033 - MODE
      ?auto_280034 - DIRECTION
      ?auto_280031 - MODE
      ?auto_280035 - DIRECTION
      ?auto_280036 - MODE
      ?auto_280037 - DIRECTION
      ?auto_280038 - MODE
    )
    :vars
    (
      ?auto_280041 - INSTRUMENT
      ?auto_280039 - SATELLITE
      ?auto_280040 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_280041 ) ( ON_BOARD ?auto_280041 ?auto_280039 ) ( SUPPORTS ?auto_280041 ?auto_280033 ) ( POWER_ON ?auto_280041 ) ( POINTING ?auto_280039 ?auto_280040 ) ( not ( = ?auto_280032 ?auto_280040 ) ) ( HAVE_IMAGE ?auto_280035 ?auto_280036 ) ( not ( = ?auto_280035 ?auto_280032 ) ) ( not ( = ?auto_280035 ?auto_280040 ) ) ( not ( = ?auto_280036 ?auto_280033 ) ) ( HAVE_IMAGE ?auto_280034 ?auto_280031 ) ( HAVE_IMAGE ?auto_280037 ?auto_280038 ) ( not ( = ?auto_280032 ?auto_280034 ) ) ( not ( = ?auto_280032 ?auto_280037 ) ) ( not ( = ?auto_280033 ?auto_280031 ) ) ( not ( = ?auto_280033 ?auto_280038 ) ) ( not ( = ?auto_280034 ?auto_280035 ) ) ( not ( = ?auto_280034 ?auto_280037 ) ) ( not ( = ?auto_280034 ?auto_280040 ) ) ( not ( = ?auto_280031 ?auto_280036 ) ) ( not ( = ?auto_280031 ?auto_280038 ) ) ( not ( = ?auto_280035 ?auto_280037 ) ) ( not ( = ?auto_280036 ?auto_280038 ) ) ( not ( = ?auto_280037 ?auto_280040 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280035 ?auto_280036 ?auto_280032 ?auto_280033 )
      ( GET-4IMAGE-VERIFY ?auto_280032 ?auto_280033 ?auto_280034 ?auto_280031 ?auto_280035 ?auto_280036 ?auto_280037 ?auto_280038 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280054 - DIRECTION
      ?auto_280055 - MODE
      ?auto_280056 - DIRECTION
      ?auto_280053 - MODE
      ?auto_280057 - DIRECTION
      ?auto_280058 - MODE
      ?auto_280059 - DIRECTION
      ?auto_280060 - MODE
    )
    :vars
    (
      ?auto_280063 - INSTRUMENT
      ?auto_280061 - SATELLITE
      ?auto_280062 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_280063 ) ( ON_BOARD ?auto_280063 ?auto_280061 ) ( SUPPORTS ?auto_280063 ?auto_280055 ) ( POWER_ON ?auto_280063 ) ( POINTING ?auto_280061 ?auto_280062 ) ( not ( = ?auto_280054 ?auto_280062 ) ) ( HAVE_IMAGE ?auto_280056 ?auto_280060 ) ( not ( = ?auto_280056 ?auto_280054 ) ) ( not ( = ?auto_280056 ?auto_280062 ) ) ( not ( = ?auto_280060 ?auto_280055 ) ) ( HAVE_IMAGE ?auto_280056 ?auto_280053 ) ( HAVE_IMAGE ?auto_280057 ?auto_280058 ) ( HAVE_IMAGE ?auto_280059 ?auto_280060 ) ( not ( = ?auto_280054 ?auto_280057 ) ) ( not ( = ?auto_280054 ?auto_280059 ) ) ( not ( = ?auto_280055 ?auto_280053 ) ) ( not ( = ?auto_280055 ?auto_280058 ) ) ( not ( = ?auto_280056 ?auto_280057 ) ) ( not ( = ?auto_280056 ?auto_280059 ) ) ( not ( = ?auto_280053 ?auto_280058 ) ) ( not ( = ?auto_280053 ?auto_280060 ) ) ( not ( = ?auto_280057 ?auto_280059 ) ) ( not ( = ?auto_280057 ?auto_280062 ) ) ( not ( = ?auto_280058 ?auto_280060 ) ) ( not ( = ?auto_280059 ?auto_280062 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280056 ?auto_280060 ?auto_280054 ?auto_280055 )
      ( GET-4IMAGE-VERIFY ?auto_280054 ?auto_280055 ?auto_280056 ?auto_280053 ?auto_280057 ?auto_280058 ?auto_280059 ?auto_280060 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280120 - DIRECTION
      ?auto_280121 - MODE
      ?auto_280122 - DIRECTION
      ?auto_280119 - MODE
      ?auto_280123 - DIRECTION
      ?auto_280124 - MODE
      ?auto_280125 - DIRECTION
      ?auto_280126 - MODE
    )
    :vars
    (
      ?auto_280129 - INSTRUMENT
      ?auto_280127 - SATELLITE
      ?auto_280128 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_280129 ) ( ON_BOARD ?auto_280129 ?auto_280127 ) ( SUPPORTS ?auto_280129 ?auto_280121 ) ( POWER_ON ?auto_280129 ) ( POINTING ?auto_280127 ?auto_280128 ) ( not ( = ?auto_280120 ?auto_280128 ) ) ( HAVE_IMAGE ?auto_280123 ?auto_280126 ) ( not ( = ?auto_280123 ?auto_280120 ) ) ( not ( = ?auto_280123 ?auto_280128 ) ) ( not ( = ?auto_280126 ?auto_280121 ) ) ( HAVE_IMAGE ?auto_280122 ?auto_280119 ) ( HAVE_IMAGE ?auto_280123 ?auto_280124 ) ( HAVE_IMAGE ?auto_280125 ?auto_280126 ) ( not ( = ?auto_280120 ?auto_280122 ) ) ( not ( = ?auto_280120 ?auto_280125 ) ) ( not ( = ?auto_280121 ?auto_280119 ) ) ( not ( = ?auto_280121 ?auto_280124 ) ) ( not ( = ?auto_280122 ?auto_280123 ) ) ( not ( = ?auto_280122 ?auto_280125 ) ) ( not ( = ?auto_280122 ?auto_280128 ) ) ( not ( = ?auto_280119 ?auto_280124 ) ) ( not ( = ?auto_280119 ?auto_280126 ) ) ( not ( = ?auto_280123 ?auto_280125 ) ) ( not ( = ?auto_280124 ?auto_280126 ) ) ( not ( = ?auto_280125 ?auto_280128 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280123 ?auto_280126 ?auto_280120 ?auto_280121 )
      ( GET-4IMAGE-VERIFY ?auto_280120 ?auto_280121 ?auto_280122 ?auto_280119 ?auto_280123 ?auto_280124 ?auto_280125 ?auto_280126 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280164 - DIRECTION
      ?auto_280165 - MODE
      ?auto_280166 - DIRECTION
      ?auto_280163 - MODE
      ?auto_280167 - DIRECTION
      ?auto_280168 - MODE
      ?auto_280169 - DIRECTION
      ?auto_280170 - MODE
    )
    :vars
    (
      ?auto_280173 - INSTRUMENT
      ?auto_280171 - SATELLITE
      ?auto_280172 - DIRECTION
      ?auto_280175 - DIRECTION
      ?auto_280174 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_280173 ) ( ON_BOARD ?auto_280173 ?auto_280171 ) ( SUPPORTS ?auto_280173 ?auto_280165 ) ( POWER_ON ?auto_280173 ) ( POINTING ?auto_280171 ?auto_280172 ) ( not ( = ?auto_280164 ?auto_280172 ) ) ( HAVE_IMAGE ?auto_280175 ?auto_280174 ) ( not ( = ?auto_280175 ?auto_280164 ) ) ( not ( = ?auto_280175 ?auto_280172 ) ) ( not ( = ?auto_280174 ?auto_280165 ) ) ( HAVE_IMAGE ?auto_280166 ?auto_280163 ) ( HAVE_IMAGE ?auto_280167 ?auto_280168 ) ( HAVE_IMAGE ?auto_280169 ?auto_280170 ) ( not ( = ?auto_280164 ?auto_280166 ) ) ( not ( = ?auto_280164 ?auto_280167 ) ) ( not ( = ?auto_280164 ?auto_280169 ) ) ( not ( = ?auto_280165 ?auto_280163 ) ) ( not ( = ?auto_280165 ?auto_280168 ) ) ( not ( = ?auto_280165 ?auto_280170 ) ) ( not ( = ?auto_280166 ?auto_280167 ) ) ( not ( = ?auto_280166 ?auto_280169 ) ) ( not ( = ?auto_280166 ?auto_280172 ) ) ( not ( = ?auto_280166 ?auto_280175 ) ) ( not ( = ?auto_280163 ?auto_280168 ) ) ( not ( = ?auto_280163 ?auto_280170 ) ) ( not ( = ?auto_280163 ?auto_280174 ) ) ( not ( = ?auto_280167 ?auto_280169 ) ) ( not ( = ?auto_280167 ?auto_280172 ) ) ( not ( = ?auto_280167 ?auto_280175 ) ) ( not ( = ?auto_280168 ?auto_280170 ) ) ( not ( = ?auto_280168 ?auto_280174 ) ) ( not ( = ?auto_280169 ?auto_280172 ) ) ( not ( = ?auto_280169 ?auto_280175 ) ) ( not ( = ?auto_280170 ?auto_280174 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280175 ?auto_280174 ?auto_280164 ?auto_280165 )
      ( GET-4IMAGE-VERIFY ?auto_280164 ?auto_280165 ?auto_280166 ?auto_280163 ?auto_280167 ?auto_280168 ?auto_280169 ?auto_280170 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_280372 - DIRECTION
      ?auto_280373 - MODE
      ?auto_280374 - DIRECTION
      ?auto_280371 - MODE
      ?auto_280375 - DIRECTION
      ?auto_280376 - MODE
    )
    :vars
    (
      ?auto_280377 - INSTRUMENT
      ?auto_280378 - SATELLITE
      ?auto_280379 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280377 ?auto_280378 ) ( SUPPORTS ?auto_280377 ?auto_280376 ) ( POWER_ON ?auto_280377 ) ( POINTING ?auto_280378 ?auto_280379 ) ( not ( = ?auto_280375 ?auto_280379 ) ) ( HAVE_IMAGE ?auto_280372 ?auto_280373 ) ( not ( = ?auto_280372 ?auto_280375 ) ) ( not ( = ?auto_280372 ?auto_280379 ) ) ( not ( = ?auto_280373 ?auto_280376 ) ) ( CALIBRATION_TARGET ?auto_280377 ?auto_280379 ) ( NOT_CALIBRATED ?auto_280377 ) ( HAVE_IMAGE ?auto_280374 ?auto_280371 ) ( not ( = ?auto_280372 ?auto_280374 ) ) ( not ( = ?auto_280373 ?auto_280371 ) ) ( not ( = ?auto_280374 ?auto_280375 ) ) ( not ( = ?auto_280374 ?auto_280379 ) ) ( not ( = ?auto_280371 ?auto_280376 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280372 ?auto_280373 ?auto_280375 ?auto_280376 )
      ( GET-3IMAGE-VERIFY ?auto_280372 ?auto_280373 ?auto_280374 ?auto_280371 ?auto_280375 ?auto_280376 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_280387 - DIRECTION
      ?auto_280388 - MODE
      ?auto_280389 - DIRECTION
      ?auto_280386 - MODE
      ?auto_280390 - DIRECTION
      ?auto_280391 - MODE
    )
    :vars
    (
      ?auto_280392 - INSTRUMENT
      ?auto_280393 - SATELLITE
      ?auto_280394 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280392 ?auto_280393 ) ( SUPPORTS ?auto_280392 ?auto_280386 ) ( POWER_ON ?auto_280392 ) ( POINTING ?auto_280393 ?auto_280394 ) ( not ( = ?auto_280389 ?auto_280394 ) ) ( HAVE_IMAGE ?auto_280390 ?auto_280391 ) ( not ( = ?auto_280390 ?auto_280389 ) ) ( not ( = ?auto_280390 ?auto_280394 ) ) ( not ( = ?auto_280391 ?auto_280386 ) ) ( CALIBRATION_TARGET ?auto_280392 ?auto_280394 ) ( NOT_CALIBRATED ?auto_280392 ) ( HAVE_IMAGE ?auto_280387 ?auto_280388 ) ( not ( = ?auto_280387 ?auto_280389 ) ) ( not ( = ?auto_280387 ?auto_280390 ) ) ( not ( = ?auto_280387 ?auto_280394 ) ) ( not ( = ?auto_280388 ?auto_280386 ) ) ( not ( = ?auto_280388 ?auto_280391 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280390 ?auto_280391 ?auto_280389 ?auto_280386 )
      ( GET-3IMAGE-VERIFY ?auto_280387 ?auto_280388 ?auto_280389 ?auto_280386 ?auto_280390 ?auto_280391 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_280417 - DIRECTION
      ?auto_280418 - MODE
      ?auto_280419 - DIRECTION
      ?auto_280416 - MODE
      ?auto_280420 - DIRECTION
      ?auto_280421 - MODE
    )
    :vars
    (
      ?auto_280422 - INSTRUMENT
      ?auto_280423 - SATELLITE
      ?auto_280424 - DIRECTION
      ?auto_280426 - DIRECTION
      ?auto_280425 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_280422 ?auto_280423 ) ( SUPPORTS ?auto_280422 ?auto_280421 ) ( POWER_ON ?auto_280422 ) ( POINTING ?auto_280423 ?auto_280424 ) ( not ( = ?auto_280420 ?auto_280424 ) ) ( HAVE_IMAGE ?auto_280426 ?auto_280425 ) ( not ( = ?auto_280426 ?auto_280420 ) ) ( not ( = ?auto_280426 ?auto_280424 ) ) ( not ( = ?auto_280425 ?auto_280421 ) ) ( CALIBRATION_TARGET ?auto_280422 ?auto_280424 ) ( NOT_CALIBRATED ?auto_280422 ) ( HAVE_IMAGE ?auto_280417 ?auto_280418 ) ( HAVE_IMAGE ?auto_280419 ?auto_280416 ) ( not ( = ?auto_280417 ?auto_280419 ) ) ( not ( = ?auto_280417 ?auto_280420 ) ) ( not ( = ?auto_280417 ?auto_280424 ) ) ( not ( = ?auto_280417 ?auto_280426 ) ) ( not ( = ?auto_280418 ?auto_280416 ) ) ( not ( = ?auto_280418 ?auto_280421 ) ) ( not ( = ?auto_280418 ?auto_280425 ) ) ( not ( = ?auto_280419 ?auto_280420 ) ) ( not ( = ?auto_280419 ?auto_280424 ) ) ( not ( = ?auto_280419 ?auto_280426 ) ) ( not ( = ?auto_280416 ?auto_280421 ) ) ( not ( = ?auto_280416 ?auto_280425 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280426 ?auto_280425 ?auto_280420 ?auto_280421 )
      ( GET-3IMAGE-VERIFY ?auto_280417 ?auto_280418 ?auto_280419 ?auto_280416 ?auto_280420 ?auto_280421 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_280434 - DIRECTION
      ?auto_280435 - MODE
      ?auto_280436 - DIRECTION
      ?auto_280433 - MODE
      ?auto_280437 - DIRECTION
      ?auto_280438 - MODE
    )
    :vars
    (
      ?auto_280439 - INSTRUMENT
      ?auto_280440 - SATELLITE
      ?auto_280441 - DIRECTION
      ?auto_280443 - DIRECTION
      ?auto_280442 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_280439 ?auto_280440 ) ( SUPPORTS ?auto_280439 ?auto_280433 ) ( POWER_ON ?auto_280439 ) ( POINTING ?auto_280440 ?auto_280441 ) ( not ( = ?auto_280436 ?auto_280441 ) ) ( HAVE_IMAGE ?auto_280443 ?auto_280442 ) ( not ( = ?auto_280443 ?auto_280436 ) ) ( not ( = ?auto_280443 ?auto_280441 ) ) ( not ( = ?auto_280442 ?auto_280433 ) ) ( CALIBRATION_TARGET ?auto_280439 ?auto_280441 ) ( NOT_CALIBRATED ?auto_280439 ) ( HAVE_IMAGE ?auto_280434 ?auto_280435 ) ( HAVE_IMAGE ?auto_280437 ?auto_280438 ) ( not ( = ?auto_280434 ?auto_280436 ) ) ( not ( = ?auto_280434 ?auto_280437 ) ) ( not ( = ?auto_280434 ?auto_280441 ) ) ( not ( = ?auto_280434 ?auto_280443 ) ) ( not ( = ?auto_280435 ?auto_280433 ) ) ( not ( = ?auto_280435 ?auto_280438 ) ) ( not ( = ?auto_280435 ?auto_280442 ) ) ( not ( = ?auto_280436 ?auto_280437 ) ) ( not ( = ?auto_280433 ?auto_280438 ) ) ( not ( = ?auto_280437 ?auto_280441 ) ) ( not ( = ?auto_280437 ?auto_280443 ) ) ( not ( = ?auto_280438 ?auto_280442 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280443 ?auto_280442 ?auto_280436 ?auto_280433 )
      ( GET-3IMAGE-VERIFY ?auto_280434 ?auto_280435 ?auto_280436 ?auto_280433 ?auto_280437 ?auto_280438 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_280456 - DIRECTION
      ?auto_280457 - MODE
      ?auto_280458 - DIRECTION
      ?auto_280455 - MODE
      ?auto_280459 - DIRECTION
      ?auto_280460 - MODE
    )
    :vars
    (
      ?auto_280461 - INSTRUMENT
      ?auto_280462 - SATELLITE
      ?auto_280463 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280461 ?auto_280462 ) ( SUPPORTS ?auto_280461 ?auto_280457 ) ( POWER_ON ?auto_280461 ) ( POINTING ?auto_280462 ?auto_280463 ) ( not ( = ?auto_280456 ?auto_280463 ) ) ( HAVE_IMAGE ?auto_280459 ?auto_280460 ) ( not ( = ?auto_280459 ?auto_280456 ) ) ( not ( = ?auto_280459 ?auto_280463 ) ) ( not ( = ?auto_280460 ?auto_280457 ) ) ( CALIBRATION_TARGET ?auto_280461 ?auto_280463 ) ( NOT_CALIBRATED ?auto_280461 ) ( HAVE_IMAGE ?auto_280458 ?auto_280455 ) ( not ( = ?auto_280456 ?auto_280458 ) ) ( not ( = ?auto_280457 ?auto_280455 ) ) ( not ( = ?auto_280458 ?auto_280459 ) ) ( not ( = ?auto_280458 ?auto_280463 ) ) ( not ( = ?auto_280455 ?auto_280460 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280459 ?auto_280460 ?auto_280456 ?auto_280457 )
      ( GET-3IMAGE-VERIFY ?auto_280456 ?auto_280457 ?auto_280458 ?auto_280455 ?auto_280459 ?auto_280460 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_280486 - DIRECTION
      ?auto_280487 - MODE
      ?auto_280488 - DIRECTION
      ?auto_280485 - MODE
      ?auto_280489 - DIRECTION
      ?auto_280490 - MODE
    )
    :vars
    (
      ?auto_280491 - INSTRUMENT
      ?auto_280492 - SATELLITE
      ?auto_280493 - DIRECTION
      ?auto_280495 - DIRECTION
      ?auto_280494 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_280491 ?auto_280492 ) ( SUPPORTS ?auto_280491 ?auto_280487 ) ( POWER_ON ?auto_280491 ) ( POINTING ?auto_280492 ?auto_280493 ) ( not ( = ?auto_280486 ?auto_280493 ) ) ( HAVE_IMAGE ?auto_280495 ?auto_280494 ) ( not ( = ?auto_280495 ?auto_280486 ) ) ( not ( = ?auto_280495 ?auto_280493 ) ) ( not ( = ?auto_280494 ?auto_280487 ) ) ( CALIBRATION_TARGET ?auto_280491 ?auto_280493 ) ( NOT_CALIBRATED ?auto_280491 ) ( HAVE_IMAGE ?auto_280488 ?auto_280485 ) ( HAVE_IMAGE ?auto_280489 ?auto_280490 ) ( not ( = ?auto_280486 ?auto_280488 ) ) ( not ( = ?auto_280486 ?auto_280489 ) ) ( not ( = ?auto_280487 ?auto_280485 ) ) ( not ( = ?auto_280487 ?auto_280490 ) ) ( not ( = ?auto_280488 ?auto_280489 ) ) ( not ( = ?auto_280488 ?auto_280493 ) ) ( not ( = ?auto_280488 ?auto_280495 ) ) ( not ( = ?auto_280485 ?auto_280490 ) ) ( not ( = ?auto_280485 ?auto_280494 ) ) ( not ( = ?auto_280489 ?auto_280493 ) ) ( not ( = ?auto_280489 ?auto_280495 ) ) ( not ( = ?auto_280490 ?auto_280494 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280495 ?auto_280494 ?auto_280486 ?auto_280487 )
      ( GET-3IMAGE-VERIFY ?auto_280486 ?auto_280487 ?auto_280488 ?auto_280485 ?auto_280489 ?auto_280490 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280539 - DIRECTION
      ?auto_280540 - MODE
      ?auto_280541 - DIRECTION
      ?auto_280538 - MODE
      ?auto_280542 - DIRECTION
      ?auto_280543 - MODE
      ?auto_280544 - DIRECTION
      ?auto_280545 - MODE
    )
    :vars
    (
      ?auto_280546 - INSTRUMENT
      ?auto_280547 - SATELLITE
      ?auto_280548 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280546 ?auto_280547 ) ( SUPPORTS ?auto_280546 ?auto_280545 ) ( POWER_ON ?auto_280546 ) ( POINTING ?auto_280547 ?auto_280548 ) ( not ( = ?auto_280544 ?auto_280548 ) ) ( HAVE_IMAGE ?auto_280539 ?auto_280543 ) ( not ( = ?auto_280539 ?auto_280544 ) ) ( not ( = ?auto_280539 ?auto_280548 ) ) ( not ( = ?auto_280543 ?auto_280545 ) ) ( CALIBRATION_TARGET ?auto_280546 ?auto_280548 ) ( NOT_CALIBRATED ?auto_280546 ) ( HAVE_IMAGE ?auto_280539 ?auto_280540 ) ( HAVE_IMAGE ?auto_280541 ?auto_280538 ) ( HAVE_IMAGE ?auto_280542 ?auto_280543 ) ( not ( = ?auto_280539 ?auto_280541 ) ) ( not ( = ?auto_280539 ?auto_280542 ) ) ( not ( = ?auto_280540 ?auto_280538 ) ) ( not ( = ?auto_280540 ?auto_280543 ) ) ( not ( = ?auto_280540 ?auto_280545 ) ) ( not ( = ?auto_280541 ?auto_280542 ) ) ( not ( = ?auto_280541 ?auto_280544 ) ) ( not ( = ?auto_280541 ?auto_280548 ) ) ( not ( = ?auto_280538 ?auto_280543 ) ) ( not ( = ?auto_280538 ?auto_280545 ) ) ( not ( = ?auto_280542 ?auto_280544 ) ) ( not ( = ?auto_280542 ?auto_280548 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280539 ?auto_280543 ?auto_280544 ?auto_280545 )
      ( GET-4IMAGE-VERIFY ?auto_280539 ?auto_280540 ?auto_280541 ?auto_280538 ?auto_280542 ?auto_280543 ?auto_280544 ?auto_280545 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280550 - DIRECTION
      ?auto_280551 - MODE
      ?auto_280552 - DIRECTION
      ?auto_280549 - MODE
      ?auto_280553 - DIRECTION
      ?auto_280554 - MODE
      ?auto_280555 - DIRECTION
      ?auto_280556 - MODE
    )
    :vars
    (
      ?auto_280557 - INSTRUMENT
      ?auto_280558 - SATELLITE
      ?auto_280559 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280557 ?auto_280558 ) ( SUPPORTS ?auto_280557 ?auto_280556 ) ( POWER_ON ?auto_280557 ) ( POINTING ?auto_280558 ?auto_280559 ) ( not ( = ?auto_280555 ?auto_280559 ) ) ( HAVE_IMAGE ?auto_280552 ?auto_280551 ) ( not ( = ?auto_280552 ?auto_280555 ) ) ( not ( = ?auto_280552 ?auto_280559 ) ) ( not ( = ?auto_280551 ?auto_280556 ) ) ( CALIBRATION_TARGET ?auto_280557 ?auto_280559 ) ( NOT_CALIBRATED ?auto_280557 ) ( HAVE_IMAGE ?auto_280550 ?auto_280551 ) ( HAVE_IMAGE ?auto_280552 ?auto_280549 ) ( HAVE_IMAGE ?auto_280553 ?auto_280554 ) ( not ( = ?auto_280550 ?auto_280552 ) ) ( not ( = ?auto_280550 ?auto_280553 ) ) ( not ( = ?auto_280550 ?auto_280555 ) ) ( not ( = ?auto_280550 ?auto_280559 ) ) ( not ( = ?auto_280551 ?auto_280549 ) ) ( not ( = ?auto_280551 ?auto_280554 ) ) ( not ( = ?auto_280552 ?auto_280553 ) ) ( not ( = ?auto_280549 ?auto_280554 ) ) ( not ( = ?auto_280549 ?auto_280556 ) ) ( not ( = ?auto_280553 ?auto_280555 ) ) ( not ( = ?auto_280553 ?auto_280559 ) ) ( not ( = ?auto_280554 ?auto_280556 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280552 ?auto_280551 ?auto_280555 ?auto_280556 )
      ( GET-4IMAGE-VERIFY ?auto_280550 ?auto_280551 ?auto_280552 ?auto_280549 ?auto_280553 ?auto_280554 ?auto_280555 ?auto_280556 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280561 - DIRECTION
      ?auto_280562 - MODE
      ?auto_280563 - DIRECTION
      ?auto_280560 - MODE
      ?auto_280564 - DIRECTION
      ?auto_280565 - MODE
      ?auto_280566 - DIRECTION
      ?auto_280567 - MODE
    )
    :vars
    (
      ?auto_280568 - INSTRUMENT
      ?auto_280569 - SATELLITE
      ?auto_280570 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280568 ?auto_280569 ) ( SUPPORTS ?auto_280568 ?auto_280565 ) ( POWER_ON ?auto_280568 ) ( POINTING ?auto_280569 ?auto_280570 ) ( not ( = ?auto_280564 ?auto_280570 ) ) ( HAVE_IMAGE ?auto_280566 ?auto_280562 ) ( not ( = ?auto_280566 ?auto_280564 ) ) ( not ( = ?auto_280566 ?auto_280570 ) ) ( not ( = ?auto_280562 ?auto_280565 ) ) ( CALIBRATION_TARGET ?auto_280568 ?auto_280570 ) ( NOT_CALIBRATED ?auto_280568 ) ( HAVE_IMAGE ?auto_280561 ?auto_280562 ) ( HAVE_IMAGE ?auto_280563 ?auto_280560 ) ( HAVE_IMAGE ?auto_280566 ?auto_280567 ) ( not ( = ?auto_280561 ?auto_280563 ) ) ( not ( = ?auto_280561 ?auto_280564 ) ) ( not ( = ?auto_280561 ?auto_280566 ) ) ( not ( = ?auto_280561 ?auto_280570 ) ) ( not ( = ?auto_280562 ?auto_280560 ) ) ( not ( = ?auto_280562 ?auto_280567 ) ) ( not ( = ?auto_280563 ?auto_280564 ) ) ( not ( = ?auto_280563 ?auto_280566 ) ) ( not ( = ?auto_280563 ?auto_280570 ) ) ( not ( = ?auto_280560 ?auto_280565 ) ) ( not ( = ?auto_280560 ?auto_280567 ) ) ( not ( = ?auto_280565 ?auto_280567 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280566 ?auto_280562 ?auto_280564 ?auto_280565 )
      ( GET-4IMAGE-VERIFY ?auto_280561 ?auto_280562 ?auto_280563 ?auto_280560 ?auto_280564 ?auto_280565 ?auto_280566 ?auto_280567 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280572 - DIRECTION
      ?auto_280573 - MODE
      ?auto_280574 - DIRECTION
      ?auto_280571 - MODE
      ?auto_280575 - DIRECTION
      ?auto_280576 - MODE
      ?auto_280577 - DIRECTION
      ?auto_280578 - MODE
    )
    :vars
    (
      ?auto_280579 - INSTRUMENT
      ?auto_280580 - SATELLITE
      ?auto_280581 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280579 ?auto_280580 ) ( SUPPORTS ?auto_280579 ?auto_280576 ) ( POWER_ON ?auto_280579 ) ( POINTING ?auto_280580 ?auto_280581 ) ( not ( = ?auto_280575 ?auto_280581 ) ) ( HAVE_IMAGE ?auto_280574 ?auto_280573 ) ( not ( = ?auto_280574 ?auto_280575 ) ) ( not ( = ?auto_280574 ?auto_280581 ) ) ( not ( = ?auto_280573 ?auto_280576 ) ) ( CALIBRATION_TARGET ?auto_280579 ?auto_280581 ) ( NOT_CALIBRATED ?auto_280579 ) ( HAVE_IMAGE ?auto_280572 ?auto_280573 ) ( HAVE_IMAGE ?auto_280574 ?auto_280571 ) ( HAVE_IMAGE ?auto_280577 ?auto_280578 ) ( not ( = ?auto_280572 ?auto_280574 ) ) ( not ( = ?auto_280572 ?auto_280575 ) ) ( not ( = ?auto_280572 ?auto_280577 ) ) ( not ( = ?auto_280572 ?auto_280581 ) ) ( not ( = ?auto_280573 ?auto_280571 ) ) ( not ( = ?auto_280573 ?auto_280578 ) ) ( not ( = ?auto_280574 ?auto_280577 ) ) ( not ( = ?auto_280571 ?auto_280576 ) ) ( not ( = ?auto_280571 ?auto_280578 ) ) ( not ( = ?auto_280575 ?auto_280577 ) ) ( not ( = ?auto_280576 ?auto_280578 ) ) ( not ( = ?auto_280577 ?auto_280581 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280574 ?auto_280573 ?auto_280575 ?auto_280576 )
      ( GET-4IMAGE-VERIFY ?auto_280572 ?auto_280573 ?auto_280574 ?auto_280571 ?auto_280575 ?auto_280576 ?auto_280577 ?auto_280578 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280605 - DIRECTION
      ?auto_280606 - MODE
      ?auto_280607 - DIRECTION
      ?auto_280604 - MODE
      ?auto_280608 - DIRECTION
      ?auto_280609 - MODE
      ?auto_280610 - DIRECTION
      ?auto_280611 - MODE
    )
    :vars
    (
      ?auto_280612 - INSTRUMENT
      ?auto_280613 - SATELLITE
      ?auto_280614 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280612 ?auto_280613 ) ( SUPPORTS ?auto_280612 ?auto_280611 ) ( POWER_ON ?auto_280612 ) ( POINTING ?auto_280613 ?auto_280614 ) ( not ( = ?auto_280610 ?auto_280614 ) ) ( HAVE_IMAGE ?auto_280605 ?auto_280606 ) ( not ( = ?auto_280605 ?auto_280610 ) ) ( not ( = ?auto_280605 ?auto_280614 ) ) ( not ( = ?auto_280606 ?auto_280611 ) ) ( CALIBRATION_TARGET ?auto_280612 ?auto_280614 ) ( NOT_CALIBRATED ?auto_280612 ) ( HAVE_IMAGE ?auto_280607 ?auto_280604 ) ( HAVE_IMAGE ?auto_280608 ?auto_280609 ) ( not ( = ?auto_280605 ?auto_280607 ) ) ( not ( = ?auto_280605 ?auto_280608 ) ) ( not ( = ?auto_280606 ?auto_280604 ) ) ( not ( = ?auto_280606 ?auto_280609 ) ) ( not ( = ?auto_280607 ?auto_280608 ) ) ( not ( = ?auto_280607 ?auto_280610 ) ) ( not ( = ?auto_280607 ?auto_280614 ) ) ( not ( = ?auto_280604 ?auto_280609 ) ) ( not ( = ?auto_280604 ?auto_280611 ) ) ( not ( = ?auto_280608 ?auto_280610 ) ) ( not ( = ?auto_280608 ?auto_280614 ) ) ( not ( = ?auto_280609 ?auto_280611 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280605 ?auto_280606 ?auto_280610 ?auto_280611 )
      ( GET-4IMAGE-VERIFY ?auto_280605 ?auto_280606 ?auto_280607 ?auto_280604 ?auto_280608 ?auto_280609 ?auto_280610 ?auto_280611 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280627 - DIRECTION
      ?auto_280628 - MODE
      ?auto_280629 - DIRECTION
      ?auto_280626 - MODE
      ?auto_280630 - DIRECTION
      ?auto_280631 - MODE
      ?auto_280632 - DIRECTION
      ?auto_280633 - MODE
    )
    :vars
    (
      ?auto_280634 - INSTRUMENT
      ?auto_280635 - SATELLITE
      ?auto_280636 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280634 ?auto_280635 ) ( SUPPORTS ?auto_280634 ?auto_280631 ) ( POWER_ON ?auto_280634 ) ( POINTING ?auto_280635 ?auto_280636 ) ( not ( = ?auto_280630 ?auto_280636 ) ) ( HAVE_IMAGE ?auto_280627 ?auto_280628 ) ( not ( = ?auto_280627 ?auto_280630 ) ) ( not ( = ?auto_280627 ?auto_280636 ) ) ( not ( = ?auto_280628 ?auto_280631 ) ) ( CALIBRATION_TARGET ?auto_280634 ?auto_280636 ) ( NOT_CALIBRATED ?auto_280634 ) ( HAVE_IMAGE ?auto_280629 ?auto_280626 ) ( HAVE_IMAGE ?auto_280632 ?auto_280633 ) ( not ( = ?auto_280627 ?auto_280629 ) ) ( not ( = ?auto_280627 ?auto_280632 ) ) ( not ( = ?auto_280628 ?auto_280626 ) ) ( not ( = ?auto_280628 ?auto_280633 ) ) ( not ( = ?auto_280629 ?auto_280630 ) ) ( not ( = ?auto_280629 ?auto_280632 ) ) ( not ( = ?auto_280629 ?auto_280636 ) ) ( not ( = ?auto_280626 ?auto_280631 ) ) ( not ( = ?auto_280626 ?auto_280633 ) ) ( not ( = ?auto_280630 ?auto_280632 ) ) ( not ( = ?auto_280631 ?auto_280633 ) ) ( not ( = ?auto_280632 ?auto_280636 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280627 ?auto_280628 ?auto_280630 ?auto_280631 )
      ( GET-4IMAGE-VERIFY ?auto_280627 ?auto_280628 ?auto_280629 ?auto_280626 ?auto_280630 ?auto_280631 ?auto_280632 ?auto_280633 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280660 - DIRECTION
      ?auto_280661 - MODE
      ?auto_280662 - DIRECTION
      ?auto_280659 - MODE
      ?auto_280663 - DIRECTION
      ?auto_280664 - MODE
      ?auto_280665 - DIRECTION
      ?auto_280666 - MODE
    )
    :vars
    (
      ?auto_280667 - INSTRUMENT
      ?auto_280668 - SATELLITE
      ?auto_280669 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280667 ?auto_280668 ) ( SUPPORTS ?auto_280667 ?auto_280659 ) ( POWER_ON ?auto_280667 ) ( POINTING ?auto_280668 ?auto_280669 ) ( not ( = ?auto_280662 ?auto_280669 ) ) ( HAVE_IMAGE ?auto_280660 ?auto_280661 ) ( not ( = ?auto_280660 ?auto_280662 ) ) ( not ( = ?auto_280660 ?auto_280669 ) ) ( not ( = ?auto_280661 ?auto_280659 ) ) ( CALIBRATION_TARGET ?auto_280667 ?auto_280669 ) ( NOT_CALIBRATED ?auto_280667 ) ( HAVE_IMAGE ?auto_280663 ?auto_280664 ) ( HAVE_IMAGE ?auto_280665 ?auto_280666 ) ( not ( = ?auto_280660 ?auto_280663 ) ) ( not ( = ?auto_280660 ?auto_280665 ) ) ( not ( = ?auto_280661 ?auto_280664 ) ) ( not ( = ?auto_280661 ?auto_280666 ) ) ( not ( = ?auto_280662 ?auto_280663 ) ) ( not ( = ?auto_280662 ?auto_280665 ) ) ( not ( = ?auto_280659 ?auto_280664 ) ) ( not ( = ?auto_280659 ?auto_280666 ) ) ( not ( = ?auto_280663 ?auto_280665 ) ) ( not ( = ?auto_280663 ?auto_280669 ) ) ( not ( = ?auto_280664 ?auto_280666 ) ) ( not ( = ?auto_280665 ?auto_280669 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280660 ?auto_280661 ?auto_280662 ?auto_280659 )
      ( GET-4IMAGE-VERIFY ?auto_280660 ?auto_280661 ?auto_280662 ?auto_280659 ?auto_280663 ?auto_280664 ?auto_280665 ?auto_280666 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280682 - DIRECTION
      ?auto_280683 - MODE
      ?auto_280684 - DIRECTION
      ?auto_280681 - MODE
      ?auto_280685 - DIRECTION
      ?auto_280686 - MODE
      ?auto_280687 - DIRECTION
      ?auto_280688 - MODE
    )
    :vars
    (
      ?auto_280689 - INSTRUMENT
      ?auto_280690 - SATELLITE
      ?auto_280691 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280689 ?auto_280690 ) ( SUPPORTS ?auto_280689 ?auto_280681 ) ( POWER_ON ?auto_280689 ) ( POINTING ?auto_280690 ?auto_280691 ) ( not ( = ?auto_280684 ?auto_280691 ) ) ( HAVE_IMAGE ?auto_280687 ?auto_280688 ) ( not ( = ?auto_280687 ?auto_280684 ) ) ( not ( = ?auto_280687 ?auto_280691 ) ) ( not ( = ?auto_280688 ?auto_280681 ) ) ( CALIBRATION_TARGET ?auto_280689 ?auto_280691 ) ( NOT_CALIBRATED ?auto_280689 ) ( HAVE_IMAGE ?auto_280682 ?auto_280683 ) ( HAVE_IMAGE ?auto_280685 ?auto_280686 ) ( not ( = ?auto_280682 ?auto_280684 ) ) ( not ( = ?auto_280682 ?auto_280685 ) ) ( not ( = ?auto_280682 ?auto_280687 ) ) ( not ( = ?auto_280682 ?auto_280691 ) ) ( not ( = ?auto_280683 ?auto_280681 ) ) ( not ( = ?auto_280683 ?auto_280686 ) ) ( not ( = ?auto_280683 ?auto_280688 ) ) ( not ( = ?auto_280684 ?auto_280685 ) ) ( not ( = ?auto_280681 ?auto_280686 ) ) ( not ( = ?auto_280685 ?auto_280687 ) ) ( not ( = ?auto_280685 ?auto_280691 ) ) ( not ( = ?auto_280686 ?auto_280688 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280687 ?auto_280688 ?auto_280684 ?auto_280681 )
      ( GET-4IMAGE-VERIFY ?auto_280682 ?auto_280683 ?auto_280684 ?auto_280681 ?auto_280685 ?auto_280686 ?auto_280687 ?auto_280688 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280748 - DIRECTION
      ?auto_280749 - MODE
      ?auto_280750 - DIRECTION
      ?auto_280747 - MODE
      ?auto_280751 - DIRECTION
      ?auto_280752 - MODE
      ?auto_280753 - DIRECTION
      ?auto_280754 - MODE
    )
    :vars
    (
      ?auto_280755 - INSTRUMENT
      ?auto_280756 - SATELLITE
      ?auto_280757 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280755 ?auto_280756 ) ( SUPPORTS ?auto_280755 ?auto_280754 ) ( POWER_ON ?auto_280755 ) ( POINTING ?auto_280756 ?auto_280757 ) ( not ( = ?auto_280753 ?auto_280757 ) ) ( HAVE_IMAGE ?auto_280750 ?auto_280752 ) ( not ( = ?auto_280750 ?auto_280753 ) ) ( not ( = ?auto_280750 ?auto_280757 ) ) ( not ( = ?auto_280752 ?auto_280754 ) ) ( CALIBRATION_TARGET ?auto_280755 ?auto_280757 ) ( NOT_CALIBRATED ?auto_280755 ) ( HAVE_IMAGE ?auto_280748 ?auto_280749 ) ( HAVE_IMAGE ?auto_280750 ?auto_280747 ) ( HAVE_IMAGE ?auto_280751 ?auto_280752 ) ( not ( = ?auto_280748 ?auto_280750 ) ) ( not ( = ?auto_280748 ?auto_280751 ) ) ( not ( = ?auto_280748 ?auto_280753 ) ) ( not ( = ?auto_280748 ?auto_280757 ) ) ( not ( = ?auto_280749 ?auto_280747 ) ) ( not ( = ?auto_280749 ?auto_280752 ) ) ( not ( = ?auto_280749 ?auto_280754 ) ) ( not ( = ?auto_280750 ?auto_280751 ) ) ( not ( = ?auto_280747 ?auto_280752 ) ) ( not ( = ?auto_280747 ?auto_280754 ) ) ( not ( = ?auto_280751 ?auto_280753 ) ) ( not ( = ?auto_280751 ?auto_280757 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280750 ?auto_280752 ?auto_280753 ?auto_280754 )
      ( GET-4IMAGE-VERIFY ?auto_280748 ?auto_280749 ?auto_280750 ?auto_280747 ?auto_280751 ?auto_280752 ?auto_280753 ?auto_280754 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280759 - DIRECTION
      ?auto_280760 - MODE
      ?auto_280761 - DIRECTION
      ?auto_280758 - MODE
      ?auto_280762 - DIRECTION
      ?auto_280763 - MODE
      ?auto_280764 - DIRECTION
      ?auto_280765 - MODE
    )
    :vars
    (
      ?auto_280766 - INSTRUMENT
      ?auto_280767 - SATELLITE
      ?auto_280768 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280766 ?auto_280767 ) ( SUPPORTS ?auto_280766 ?auto_280765 ) ( POWER_ON ?auto_280766 ) ( POINTING ?auto_280767 ?auto_280768 ) ( not ( = ?auto_280764 ?auto_280768 ) ) ( HAVE_IMAGE ?auto_280761 ?auto_280758 ) ( not ( = ?auto_280761 ?auto_280764 ) ) ( not ( = ?auto_280761 ?auto_280768 ) ) ( not ( = ?auto_280758 ?auto_280765 ) ) ( CALIBRATION_TARGET ?auto_280766 ?auto_280768 ) ( NOT_CALIBRATED ?auto_280766 ) ( HAVE_IMAGE ?auto_280759 ?auto_280760 ) ( HAVE_IMAGE ?auto_280762 ?auto_280763 ) ( not ( = ?auto_280759 ?auto_280761 ) ) ( not ( = ?auto_280759 ?auto_280762 ) ) ( not ( = ?auto_280759 ?auto_280764 ) ) ( not ( = ?auto_280759 ?auto_280768 ) ) ( not ( = ?auto_280760 ?auto_280758 ) ) ( not ( = ?auto_280760 ?auto_280763 ) ) ( not ( = ?auto_280760 ?auto_280765 ) ) ( not ( = ?auto_280761 ?auto_280762 ) ) ( not ( = ?auto_280758 ?auto_280763 ) ) ( not ( = ?auto_280762 ?auto_280764 ) ) ( not ( = ?auto_280762 ?auto_280768 ) ) ( not ( = ?auto_280763 ?auto_280765 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280761 ?auto_280758 ?auto_280764 ?auto_280765 )
      ( GET-4IMAGE-VERIFY ?auto_280759 ?auto_280760 ?auto_280761 ?auto_280758 ?auto_280762 ?auto_280763 ?auto_280764 ?auto_280765 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280770 - DIRECTION
      ?auto_280771 - MODE
      ?auto_280772 - DIRECTION
      ?auto_280769 - MODE
      ?auto_280773 - DIRECTION
      ?auto_280774 - MODE
      ?auto_280775 - DIRECTION
      ?auto_280776 - MODE
    )
    :vars
    (
      ?auto_280777 - INSTRUMENT
      ?auto_280778 - SATELLITE
      ?auto_280779 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280777 ?auto_280778 ) ( SUPPORTS ?auto_280777 ?auto_280774 ) ( POWER_ON ?auto_280777 ) ( POINTING ?auto_280778 ?auto_280779 ) ( not ( = ?auto_280773 ?auto_280779 ) ) ( HAVE_IMAGE ?auto_280775 ?auto_280769 ) ( not ( = ?auto_280775 ?auto_280773 ) ) ( not ( = ?auto_280775 ?auto_280779 ) ) ( not ( = ?auto_280769 ?auto_280774 ) ) ( CALIBRATION_TARGET ?auto_280777 ?auto_280779 ) ( NOT_CALIBRATED ?auto_280777 ) ( HAVE_IMAGE ?auto_280770 ?auto_280771 ) ( HAVE_IMAGE ?auto_280772 ?auto_280769 ) ( HAVE_IMAGE ?auto_280775 ?auto_280776 ) ( not ( = ?auto_280770 ?auto_280772 ) ) ( not ( = ?auto_280770 ?auto_280773 ) ) ( not ( = ?auto_280770 ?auto_280775 ) ) ( not ( = ?auto_280770 ?auto_280779 ) ) ( not ( = ?auto_280771 ?auto_280769 ) ) ( not ( = ?auto_280771 ?auto_280774 ) ) ( not ( = ?auto_280771 ?auto_280776 ) ) ( not ( = ?auto_280772 ?auto_280773 ) ) ( not ( = ?auto_280772 ?auto_280775 ) ) ( not ( = ?auto_280772 ?auto_280779 ) ) ( not ( = ?auto_280769 ?auto_280776 ) ) ( not ( = ?auto_280774 ?auto_280776 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280775 ?auto_280769 ?auto_280773 ?auto_280774 )
      ( GET-4IMAGE-VERIFY ?auto_280770 ?auto_280771 ?auto_280772 ?auto_280769 ?auto_280773 ?auto_280774 ?auto_280775 ?auto_280776 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280781 - DIRECTION
      ?auto_280782 - MODE
      ?auto_280783 - DIRECTION
      ?auto_280780 - MODE
      ?auto_280784 - DIRECTION
      ?auto_280785 - MODE
      ?auto_280786 - DIRECTION
      ?auto_280787 - MODE
    )
    :vars
    (
      ?auto_280788 - INSTRUMENT
      ?auto_280789 - SATELLITE
      ?auto_280790 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280788 ?auto_280789 ) ( SUPPORTS ?auto_280788 ?auto_280785 ) ( POWER_ON ?auto_280788 ) ( POINTING ?auto_280789 ?auto_280790 ) ( not ( = ?auto_280784 ?auto_280790 ) ) ( HAVE_IMAGE ?auto_280783 ?auto_280780 ) ( not ( = ?auto_280783 ?auto_280784 ) ) ( not ( = ?auto_280783 ?auto_280790 ) ) ( not ( = ?auto_280780 ?auto_280785 ) ) ( CALIBRATION_TARGET ?auto_280788 ?auto_280790 ) ( NOT_CALIBRATED ?auto_280788 ) ( HAVE_IMAGE ?auto_280781 ?auto_280782 ) ( HAVE_IMAGE ?auto_280786 ?auto_280787 ) ( not ( = ?auto_280781 ?auto_280783 ) ) ( not ( = ?auto_280781 ?auto_280784 ) ) ( not ( = ?auto_280781 ?auto_280786 ) ) ( not ( = ?auto_280781 ?auto_280790 ) ) ( not ( = ?auto_280782 ?auto_280780 ) ) ( not ( = ?auto_280782 ?auto_280785 ) ) ( not ( = ?auto_280782 ?auto_280787 ) ) ( not ( = ?auto_280783 ?auto_280786 ) ) ( not ( = ?auto_280780 ?auto_280787 ) ) ( not ( = ?auto_280784 ?auto_280786 ) ) ( not ( = ?auto_280785 ?auto_280787 ) ) ( not ( = ?auto_280786 ?auto_280790 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280783 ?auto_280780 ?auto_280784 ?auto_280785 )
      ( GET-4IMAGE-VERIFY ?auto_280781 ?auto_280782 ?auto_280783 ?auto_280780 ?auto_280784 ?auto_280785 ?auto_280786 ?auto_280787 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280803 - DIRECTION
      ?auto_280804 - MODE
      ?auto_280805 - DIRECTION
      ?auto_280802 - MODE
      ?auto_280806 - DIRECTION
      ?auto_280807 - MODE
      ?auto_280808 - DIRECTION
      ?auto_280809 - MODE
    )
    :vars
    (
      ?auto_280810 - INSTRUMENT
      ?auto_280811 - SATELLITE
      ?auto_280812 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280810 ?auto_280811 ) ( SUPPORTS ?auto_280810 ?auto_280809 ) ( POWER_ON ?auto_280810 ) ( POINTING ?auto_280811 ?auto_280812 ) ( not ( = ?auto_280808 ?auto_280812 ) ) ( HAVE_IMAGE ?auto_280806 ?auto_280807 ) ( not ( = ?auto_280806 ?auto_280808 ) ) ( not ( = ?auto_280806 ?auto_280812 ) ) ( not ( = ?auto_280807 ?auto_280809 ) ) ( CALIBRATION_TARGET ?auto_280810 ?auto_280812 ) ( NOT_CALIBRATED ?auto_280810 ) ( HAVE_IMAGE ?auto_280803 ?auto_280804 ) ( HAVE_IMAGE ?auto_280805 ?auto_280802 ) ( not ( = ?auto_280803 ?auto_280805 ) ) ( not ( = ?auto_280803 ?auto_280806 ) ) ( not ( = ?auto_280803 ?auto_280808 ) ) ( not ( = ?auto_280803 ?auto_280812 ) ) ( not ( = ?auto_280804 ?auto_280802 ) ) ( not ( = ?auto_280804 ?auto_280807 ) ) ( not ( = ?auto_280804 ?auto_280809 ) ) ( not ( = ?auto_280805 ?auto_280806 ) ) ( not ( = ?auto_280805 ?auto_280808 ) ) ( not ( = ?auto_280805 ?auto_280812 ) ) ( not ( = ?auto_280802 ?auto_280807 ) ) ( not ( = ?auto_280802 ?auto_280809 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280806 ?auto_280807 ?auto_280808 ?auto_280809 )
      ( GET-4IMAGE-VERIFY ?auto_280803 ?auto_280804 ?auto_280805 ?auto_280802 ?auto_280806 ?auto_280807 ?auto_280808 ?auto_280809 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280814 - DIRECTION
      ?auto_280815 - MODE
      ?auto_280816 - DIRECTION
      ?auto_280813 - MODE
      ?auto_280817 - DIRECTION
      ?auto_280818 - MODE
      ?auto_280819 - DIRECTION
      ?auto_280820 - MODE
    )
    :vars
    (
      ?auto_280821 - INSTRUMENT
      ?auto_280822 - SATELLITE
      ?auto_280823 - DIRECTION
      ?auto_280825 - DIRECTION
      ?auto_280824 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_280821 ?auto_280822 ) ( SUPPORTS ?auto_280821 ?auto_280820 ) ( POWER_ON ?auto_280821 ) ( POINTING ?auto_280822 ?auto_280823 ) ( not ( = ?auto_280819 ?auto_280823 ) ) ( HAVE_IMAGE ?auto_280825 ?auto_280824 ) ( not ( = ?auto_280825 ?auto_280819 ) ) ( not ( = ?auto_280825 ?auto_280823 ) ) ( not ( = ?auto_280824 ?auto_280820 ) ) ( CALIBRATION_TARGET ?auto_280821 ?auto_280823 ) ( NOT_CALIBRATED ?auto_280821 ) ( HAVE_IMAGE ?auto_280814 ?auto_280815 ) ( HAVE_IMAGE ?auto_280816 ?auto_280813 ) ( HAVE_IMAGE ?auto_280817 ?auto_280818 ) ( not ( = ?auto_280814 ?auto_280816 ) ) ( not ( = ?auto_280814 ?auto_280817 ) ) ( not ( = ?auto_280814 ?auto_280819 ) ) ( not ( = ?auto_280814 ?auto_280823 ) ) ( not ( = ?auto_280814 ?auto_280825 ) ) ( not ( = ?auto_280815 ?auto_280813 ) ) ( not ( = ?auto_280815 ?auto_280818 ) ) ( not ( = ?auto_280815 ?auto_280820 ) ) ( not ( = ?auto_280815 ?auto_280824 ) ) ( not ( = ?auto_280816 ?auto_280817 ) ) ( not ( = ?auto_280816 ?auto_280819 ) ) ( not ( = ?auto_280816 ?auto_280823 ) ) ( not ( = ?auto_280816 ?auto_280825 ) ) ( not ( = ?auto_280813 ?auto_280818 ) ) ( not ( = ?auto_280813 ?auto_280820 ) ) ( not ( = ?auto_280813 ?auto_280824 ) ) ( not ( = ?auto_280817 ?auto_280819 ) ) ( not ( = ?auto_280817 ?auto_280823 ) ) ( not ( = ?auto_280817 ?auto_280825 ) ) ( not ( = ?auto_280818 ?auto_280820 ) ) ( not ( = ?auto_280818 ?auto_280824 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280825 ?auto_280824 ?auto_280819 ?auto_280820 )
      ( GET-4IMAGE-VERIFY ?auto_280814 ?auto_280815 ?auto_280816 ?auto_280813 ?auto_280817 ?auto_280818 ?auto_280819 ?auto_280820 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280838 - DIRECTION
      ?auto_280839 - MODE
      ?auto_280840 - DIRECTION
      ?auto_280837 - MODE
      ?auto_280841 - DIRECTION
      ?auto_280842 - MODE
      ?auto_280843 - DIRECTION
      ?auto_280844 - MODE
    )
    :vars
    (
      ?auto_280845 - INSTRUMENT
      ?auto_280846 - SATELLITE
      ?auto_280847 - DIRECTION
      ?auto_280849 - DIRECTION
      ?auto_280848 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_280845 ?auto_280846 ) ( SUPPORTS ?auto_280845 ?auto_280842 ) ( POWER_ON ?auto_280845 ) ( POINTING ?auto_280846 ?auto_280847 ) ( not ( = ?auto_280841 ?auto_280847 ) ) ( HAVE_IMAGE ?auto_280849 ?auto_280848 ) ( not ( = ?auto_280849 ?auto_280841 ) ) ( not ( = ?auto_280849 ?auto_280847 ) ) ( not ( = ?auto_280848 ?auto_280842 ) ) ( CALIBRATION_TARGET ?auto_280845 ?auto_280847 ) ( NOT_CALIBRATED ?auto_280845 ) ( HAVE_IMAGE ?auto_280838 ?auto_280839 ) ( HAVE_IMAGE ?auto_280840 ?auto_280837 ) ( HAVE_IMAGE ?auto_280843 ?auto_280844 ) ( not ( = ?auto_280838 ?auto_280840 ) ) ( not ( = ?auto_280838 ?auto_280841 ) ) ( not ( = ?auto_280838 ?auto_280843 ) ) ( not ( = ?auto_280838 ?auto_280847 ) ) ( not ( = ?auto_280838 ?auto_280849 ) ) ( not ( = ?auto_280839 ?auto_280837 ) ) ( not ( = ?auto_280839 ?auto_280842 ) ) ( not ( = ?auto_280839 ?auto_280844 ) ) ( not ( = ?auto_280839 ?auto_280848 ) ) ( not ( = ?auto_280840 ?auto_280841 ) ) ( not ( = ?auto_280840 ?auto_280843 ) ) ( not ( = ?auto_280840 ?auto_280847 ) ) ( not ( = ?auto_280840 ?auto_280849 ) ) ( not ( = ?auto_280837 ?auto_280842 ) ) ( not ( = ?auto_280837 ?auto_280844 ) ) ( not ( = ?auto_280837 ?auto_280848 ) ) ( not ( = ?auto_280841 ?auto_280843 ) ) ( not ( = ?auto_280842 ?auto_280844 ) ) ( not ( = ?auto_280843 ?auto_280847 ) ) ( not ( = ?auto_280843 ?auto_280849 ) ) ( not ( = ?auto_280844 ?auto_280848 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280849 ?auto_280848 ?auto_280841 ?auto_280842 )
      ( GET-4IMAGE-VERIFY ?auto_280838 ?auto_280839 ?auto_280840 ?auto_280837 ?auto_280841 ?auto_280842 ?auto_280843 ?auto_280844 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280864 - DIRECTION
      ?auto_280865 - MODE
      ?auto_280866 - DIRECTION
      ?auto_280863 - MODE
      ?auto_280867 - DIRECTION
      ?auto_280868 - MODE
      ?auto_280869 - DIRECTION
      ?auto_280870 - MODE
    )
    :vars
    (
      ?auto_280871 - INSTRUMENT
      ?auto_280872 - SATELLITE
      ?auto_280873 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280871 ?auto_280872 ) ( SUPPORTS ?auto_280871 ?auto_280863 ) ( POWER_ON ?auto_280871 ) ( POINTING ?auto_280872 ?auto_280873 ) ( not ( = ?auto_280866 ?auto_280873 ) ) ( HAVE_IMAGE ?auto_280867 ?auto_280868 ) ( not ( = ?auto_280867 ?auto_280866 ) ) ( not ( = ?auto_280867 ?auto_280873 ) ) ( not ( = ?auto_280868 ?auto_280863 ) ) ( CALIBRATION_TARGET ?auto_280871 ?auto_280873 ) ( NOT_CALIBRATED ?auto_280871 ) ( HAVE_IMAGE ?auto_280864 ?auto_280865 ) ( HAVE_IMAGE ?auto_280869 ?auto_280870 ) ( not ( = ?auto_280864 ?auto_280866 ) ) ( not ( = ?auto_280864 ?auto_280867 ) ) ( not ( = ?auto_280864 ?auto_280869 ) ) ( not ( = ?auto_280864 ?auto_280873 ) ) ( not ( = ?auto_280865 ?auto_280863 ) ) ( not ( = ?auto_280865 ?auto_280868 ) ) ( not ( = ?auto_280865 ?auto_280870 ) ) ( not ( = ?auto_280866 ?auto_280869 ) ) ( not ( = ?auto_280863 ?auto_280870 ) ) ( not ( = ?auto_280867 ?auto_280869 ) ) ( not ( = ?auto_280868 ?auto_280870 ) ) ( not ( = ?auto_280869 ?auto_280873 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280867 ?auto_280868 ?auto_280866 ?auto_280863 )
      ( GET-4IMAGE-VERIFY ?auto_280864 ?auto_280865 ?auto_280866 ?auto_280863 ?auto_280867 ?auto_280868 ?auto_280869 ?auto_280870 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280908 - DIRECTION
      ?auto_280909 - MODE
      ?auto_280910 - DIRECTION
      ?auto_280907 - MODE
      ?auto_280911 - DIRECTION
      ?auto_280912 - MODE
      ?auto_280913 - DIRECTION
      ?auto_280914 - MODE
    )
    :vars
    (
      ?auto_280915 - INSTRUMENT
      ?auto_280916 - SATELLITE
      ?auto_280917 - DIRECTION
      ?auto_280919 - DIRECTION
      ?auto_280918 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_280915 ?auto_280916 ) ( SUPPORTS ?auto_280915 ?auto_280907 ) ( POWER_ON ?auto_280915 ) ( POINTING ?auto_280916 ?auto_280917 ) ( not ( = ?auto_280910 ?auto_280917 ) ) ( HAVE_IMAGE ?auto_280919 ?auto_280918 ) ( not ( = ?auto_280919 ?auto_280910 ) ) ( not ( = ?auto_280919 ?auto_280917 ) ) ( not ( = ?auto_280918 ?auto_280907 ) ) ( CALIBRATION_TARGET ?auto_280915 ?auto_280917 ) ( NOT_CALIBRATED ?auto_280915 ) ( HAVE_IMAGE ?auto_280908 ?auto_280909 ) ( HAVE_IMAGE ?auto_280911 ?auto_280912 ) ( HAVE_IMAGE ?auto_280913 ?auto_280914 ) ( not ( = ?auto_280908 ?auto_280910 ) ) ( not ( = ?auto_280908 ?auto_280911 ) ) ( not ( = ?auto_280908 ?auto_280913 ) ) ( not ( = ?auto_280908 ?auto_280917 ) ) ( not ( = ?auto_280908 ?auto_280919 ) ) ( not ( = ?auto_280909 ?auto_280907 ) ) ( not ( = ?auto_280909 ?auto_280912 ) ) ( not ( = ?auto_280909 ?auto_280914 ) ) ( not ( = ?auto_280909 ?auto_280918 ) ) ( not ( = ?auto_280910 ?auto_280911 ) ) ( not ( = ?auto_280910 ?auto_280913 ) ) ( not ( = ?auto_280907 ?auto_280912 ) ) ( not ( = ?auto_280907 ?auto_280914 ) ) ( not ( = ?auto_280911 ?auto_280913 ) ) ( not ( = ?auto_280911 ?auto_280917 ) ) ( not ( = ?auto_280911 ?auto_280919 ) ) ( not ( = ?auto_280912 ?auto_280914 ) ) ( not ( = ?auto_280912 ?auto_280918 ) ) ( not ( = ?auto_280913 ?auto_280917 ) ) ( not ( = ?auto_280913 ?auto_280919 ) ) ( not ( = ?auto_280914 ?auto_280918 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280919 ?auto_280918 ?auto_280910 ?auto_280907 )
      ( GET-4IMAGE-VERIFY ?auto_280908 ?auto_280909 ?auto_280910 ?auto_280907 ?auto_280911 ?auto_280912 ?auto_280913 ?auto_280914 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280971 - DIRECTION
      ?auto_280972 - MODE
      ?auto_280973 - DIRECTION
      ?auto_280970 - MODE
      ?auto_280974 - DIRECTION
      ?auto_280975 - MODE
      ?auto_280976 - DIRECTION
      ?auto_280977 - MODE
    )
    :vars
    (
      ?auto_280978 - INSTRUMENT
      ?auto_280979 - SATELLITE
      ?auto_280980 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280978 ?auto_280979 ) ( SUPPORTS ?auto_280978 ?auto_280972 ) ( POWER_ON ?auto_280978 ) ( POINTING ?auto_280979 ?auto_280980 ) ( not ( = ?auto_280971 ?auto_280980 ) ) ( HAVE_IMAGE ?auto_280973 ?auto_280977 ) ( not ( = ?auto_280973 ?auto_280971 ) ) ( not ( = ?auto_280973 ?auto_280980 ) ) ( not ( = ?auto_280977 ?auto_280972 ) ) ( CALIBRATION_TARGET ?auto_280978 ?auto_280980 ) ( NOT_CALIBRATED ?auto_280978 ) ( HAVE_IMAGE ?auto_280973 ?auto_280970 ) ( HAVE_IMAGE ?auto_280974 ?auto_280975 ) ( HAVE_IMAGE ?auto_280976 ?auto_280977 ) ( not ( = ?auto_280971 ?auto_280974 ) ) ( not ( = ?auto_280971 ?auto_280976 ) ) ( not ( = ?auto_280972 ?auto_280970 ) ) ( not ( = ?auto_280972 ?auto_280975 ) ) ( not ( = ?auto_280973 ?auto_280974 ) ) ( not ( = ?auto_280973 ?auto_280976 ) ) ( not ( = ?auto_280970 ?auto_280975 ) ) ( not ( = ?auto_280970 ?auto_280977 ) ) ( not ( = ?auto_280974 ?auto_280976 ) ) ( not ( = ?auto_280974 ?auto_280980 ) ) ( not ( = ?auto_280975 ?auto_280977 ) ) ( not ( = ?auto_280976 ?auto_280980 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280973 ?auto_280977 ?auto_280971 ?auto_280972 )
      ( GET-4IMAGE-VERIFY ?auto_280971 ?auto_280972 ?auto_280973 ?auto_280970 ?auto_280974 ?auto_280975 ?auto_280976 ?auto_280977 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_280982 - DIRECTION
      ?auto_280983 - MODE
      ?auto_280984 - DIRECTION
      ?auto_280981 - MODE
      ?auto_280985 - DIRECTION
      ?auto_280986 - MODE
      ?auto_280987 - DIRECTION
      ?auto_280988 - MODE
    )
    :vars
    (
      ?auto_280989 - INSTRUMENT
      ?auto_280990 - SATELLITE
      ?auto_280991 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280989 ?auto_280990 ) ( SUPPORTS ?auto_280989 ?auto_280983 ) ( POWER_ON ?auto_280989 ) ( POINTING ?auto_280990 ?auto_280991 ) ( not ( = ?auto_280982 ?auto_280991 ) ) ( HAVE_IMAGE ?auto_280985 ?auto_280986 ) ( not ( = ?auto_280985 ?auto_280982 ) ) ( not ( = ?auto_280985 ?auto_280991 ) ) ( not ( = ?auto_280986 ?auto_280983 ) ) ( CALIBRATION_TARGET ?auto_280989 ?auto_280991 ) ( NOT_CALIBRATED ?auto_280989 ) ( HAVE_IMAGE ?auto_280984 ?auto_280981 ) ( HAVE_IMAGE ?auto_280987 ?auto_280988 ) ( not ( = ?auto_280982 ?auto_280984 ) ) ( not ( = ?auto_280982 ?auto_280987 ) ) ( not ( = ?auto_280983 ?auto_280981 ) ) ( not ( = ?auto_280983 ?auto_280988 ) ) ( not ( = ?auto_280984 ?auto_280985 ) ) ( not ( = ?auto_280984 ?auto_280987 ) ) ( not ( = ?auto_280984 ?auto_280991 ) ) ( not ( = ?auto_280981 ?auto_280986 ) ) ( not ( = ?auto_280981 ?auto_280988 ) ) ( not ( = ?auto_280985 ?auto_280987 ) ) ( not ( = ?auto_280986 ?auto_280988 ) ) ( not ( = ?auto_280987 ?auto_280991 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280985 ?auto_280986 ?auto_280982 ?auto_280983 )
      ( GET-4IMAGE-VERIFY ?auto_280982 ?auto_280983 ?auto_280984 ?auto_280981 ?auto_280985 ?auto_280986 ?auto_280987 ?auto_280988 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281070 - DIRECTION
      ?auto_281071 - MODE
      ?auto_281072 - DIRECTION
      ?auto_281069 - MODE
      ?auto_281073 - DIRECTION
      ?auto_281074 - MODE
      ?auto_281075 - DIRECTION
      ?auto_281076 - MODE
    )
    :vars
    (
      ?auto_281077 - INSTRUMENT
      ?auto_281078 - SATELLITE
      ?auto_281079 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281077 ?auto_281078 ) ( SUPPORTS ?auto_281077 ?auto_281071 ) ( POWER_ON ?auto_281077 ) ( POINTING ?auto_281078 ?auto_281079 ) ( not ( = ?auto_281070 ?auto_281079 ) ) ( HAVE_IMAGE ?auto_281075 ?auto_281076 ) ( not ( = ?auto_281075 ?auto_281070 ) ) ( not ( = ?auto_281075 ?auto_281079 ) ) ( not ( = ?auto_281076 ?auto_281071 ) ) ( CALIBRATION_TARGET ?auto_281077 ?auto_281079 ) ( NOT_CALIBRATED ?auto_281077 ) ( HAVE_IMAGE ?auto_281072 ?auto_281069 ) ( HAVE_IMAGE ?auto_281073 ?auto_281074 ) ( not ( = ?auto_281070 ?auto_281072 ) ) ( not ( = ?auto_281070 ?auto_281073 ) ) ( not ( = ?auto_281071 ?auto_281069 ) ) ( not ( = ?auto_281071 ?auto_281074 ) ) ( not ( = ?auto_281072 ?auto_281073 ) ) ( not ( = ?auto_281072 ?auto_281075 ) ) ( not ( = ?auto_281072 ?auto_281079 ) ) ( not ( = ?auto_281069 ?auto_281074 ) ) ( not ( = ?auto_281069 ?auto_281076 ) ) ( not ( = ?auto_281073 ?auto_281075 ) ) ( not ( = ?auto_281073 ?auto_281079 ) ) ( not ( = ?auto_281074 ?auto_281076 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281075 ?auto_281076 ?auto_281070 ?auto_281071 )
      ( GET-4IMAGE-VERIFY ?auto_281070 ?auto_281071 ?auto_281072 ?auto_281069 ?auto_281073 ?auto_281074 ?auto_281075 ?auto_281076 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281114 - DIRECTION
      ?auto_281115 - MODE
      ?auto_281116 - DIRECTION
      ?auto_281113 - MODE
      ?auto_281117 - DIRECTION
      ?auto_281118 - MODE
      ?auto_281119 - DIRECTION
      ?auto_281120 - MODE
    )
    :vars
    (
      ?auto_281121 - INSTRUMENT
      ?auto_281122 - SATELLITE
      ?auto_281123 - DIRECTION
      ?auto_281125 - DIRECTION
      ?auto_281124 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_281121 ?auto_281122 ) ( SUPPORTS ?auto_281121 ?auto_281115 ) ( POWER_ON ?auto_281121 ) ( POINTING ?auto_281122 ?auto_281123 ) ( not ( = ?auto_281114 ?auto_281123 ) ) ( HAVE_IMAGE ?auto_281125 ?auto_281124 ) ( not ( = ?auto_281125 ?auto_281114 ) ) ( not ( = ?auto_281125 ?auto_281123 ) ) ( not ( = ?auto_281124 ?auto_281115 ) ) ( CALIBRATION_TARGET ?auto_281121 ?auto_281123 ) ( NOT_CALIBRATED ?auto_281121 ) ( HAVE_IMAGE ?auto_281116 ?auto_281113 ) ( HAVE_IMAGE ?auto_281117 ?auto_281118 ) ( HAVE_IMAGE ?auto_281119 ?auto_281120 ) ( not ( = ?auto_281114 ?auto_281116 ) ) ( not ( = ?auto_281114 ?auto_281117 ) ) ( not ( = ?auto_281114 ?auto_281119 ) ) ( not ( = ?auto_281115 ?auto_281113 ) ) ( not ( = ?auto_281115 ?auto_281118 ) ) ( not ( = ?auto_281115 ?auto_281120 ) ) ( not ( = ?auto_281116 ?auto_281117 ) ) ( not ( = ?auto_281116 ?auto_281119 ) ) ( not ( = ?auto_281116 ?auto_281123 ) ) ( not ( = ?auto_281116 ?auto_281125 ) ) ( not ( = ?auto_281113 ?auto_281118 ) ) ( not ( = ?auto_281113 ?auto_281120 ) ) ( not ( = ?auto_281113 ?auto_281124 ) ) ( not ( = ?auto_281117 ?auto_281119 ) ) ( not ( = ?auto_281117 ?auto_281123 ) ) ( not ( = ?auto_281117 ?auto_281125 ) ) ( not ( = ?auto_281118 ?auto_281120 ) ) ( not ( = ?auto_281118 ?auto_281124 ) ) ( not ( = ?auto_281119 ?auto_281123 ) ) ( not ( = ?auto_281119 ?auto_281125 ) ) ( not ( = ?auto_281120 ?auto_281124 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281125 ?auto_281124 ?auto_281114 ?auto_281115 )
      ( GET-4IMAGE-VERIFY ?auto_281114 ?auto_281115 ?auto_281116 ?auto_281113 ?auto_281117 ?auto_281118 ?auto_281119 ?auto_281120 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_281322 - DIRECTION
      ?auto_281323 - MODE
      ?auto_281324 - DIRECTION
      ?auto_281321 - MODE
      ?auto_281325 - DIRECTION
      ?auto_281326 - MODE
    )
    :vars
    (
      ?auto_281327 - INSTRUMENT
      ?auto_281329 - SATELLITE
      ?auto_281328 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281327 ?auto_281329 ) ( SUPPORTS ?auto_281327 ?auto_281326 ) ( POINTING ?auto_281329 ?auto_281328 ) ( not ( = ?auto_281325 ?auto_281328 ) ) ( HAVE_IMAGE ?auto_281322 ?auto_281323 ) ( not ( = ?auto_281322 ?auto_281325 ) ) ( not ( = ?auto_281322 ?auto_281328 ) ) ( not ( = ?auto_281323 ?auto_281326 ) ) ( CALIBRATION_TARGET ?auto_281327 ?auto_281328 ) ( POWER_AVAIL ?auto_281329 ) ( HAVE_IMAGE ?auto_281324 ?auto_281321 ) ( not ( = ?auto_281322 ?auto_281324 ) ) ( not ( = ?auto_281323 ?auto_281321 ) ) ( not ( = ?auto_281324 ?auto_281325 ) ) ( not ( = ?auto_281324 ?auto_281328 ) ) ( not ( = ?auto_281321 ?auto_281326 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281322 ?auto_281323 ?auto_281325 ?auto_281326 )
      ( GET-3IMAGE-VERIFY ?auto_281322 ?auto_281323 ?auto_281324 ?auto_281321 ?auto_281325 ?auto_281326 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_281367 - DIRECTION
      ?auto_281368 - MODE
      ?auto_281369 - DIRECTION
      ?auto_281366 - MODE
      ?auto_281370 - DIRECTION
      ?auto_281371 - MODE
    )
    :vars
    (
      ?auto_281372 - INSTRUMENT
      ?auto_281374 - SATELLITE
      ?auto_281373 - DIRECTION
      ?auto_281375 - DIRECTION
      ?auto_281376 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_281372 ?auto_281374 ) ( SUPPORTS ?auto_281372 ?auto_281371 ) ( POINTING ?auto_281374 ?auto_281373 ) ( not ( = ?auto_281370 ?auto_281373 ) ) ( HAVE_IMAGE ?auto_281375 ?auto_281376 ) ( not ( = ?auto_281375 ?auto_281370 ) ) ( not ( = ?auto_281375 ?auto_281373 ) ) ( not ( = ?auto_281376 ?auto_281371 ) ) ( CALIBRATION_TARGET ?auto_281372 ?auto_281373 ) ( POWER_AVAIL ?auto_281374 ) ( HAVE_IMAGE ?auto_281367 ?auto_281368 ) ( HAVE_IMAGE ?auto_281369 ?auto_281366 ) ( not ( = ?auto_281367 ?auto_281369 ) ) ( not ( = ?auto_281367 ?auto_281370 ) ) ( not ( = ?auto_281367 ?auto_281373 ) ) ( not ( = ?auto_281367 ?auto_281375 ) ) ( not ( = ?auto_281368 ?auto_281366 ) ) ( not ( = ?auto_281368 ?auto_281371 ) ) ( not ( = ?auto_281368 ?auto_281376 ) ) ( not ( = ?auto_281369 ?auto_281370 ) ) ( not ( = ?auto_281369 ?auto_281373 ) ) ( not ( = ?auto_281369 ?auto_281375 ) ) ( not ( = ?auto_281366 ?auto_281371 ) ) ( not ( = ?auto_281366 ?auto_281376 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281375 ?auto_281376 ?auto_281370 ?auto_281371 )
      ( GET-3IMAGE-VERIFY ?auto_281367 ?auto_281368 ?auto_281369 ?auto_281366 ?auto_281370 ?auto_281371 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_281384 - DIRECTION
      ?auto_281385 - MODE
      ?auto_281386 - DIRECTION
      ?auto_281383 - MODE
      ?auto_281387 - DIRECTION
      ?auto_281388 - MODE
    )
    :vars
    (
      ?auto_281389 - INSTRUMENT
      ?auto_281391 - SATELLITE
      ?auto_281390 - DIRECTION
      ?auto_281392 - DIRECTION
      ?auto_281393 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_281389 ?auto_281391 ) ( SUPPORTS ?auto_281389 ?auto_281383 ) ( POINTING ?auto_281391 ?auto_281390 ) ( not ( = ?auto_281386 ?auto_281390 ) ) ( HAVE_IMAGE ?auto_281392 ?auto_281393 ) ( not ( = ?auto_281392 ?auto_281386 ) ) ( not ( = ?auto_281392 ?auto_281390 ) ) ( not ( = ?auto_281393 ?auto_281383 ) ) ( CALIBRATION_TARGET ?auto_281389 ?auto_281390 ) ( POWER_AVAIL ?auto_281391 ) ( HAVE_IMAGE ?auto_281384 ?auto_281385 ) ( HAVE_IMAGE ?auto_281387 ?auto_281388 ) ( not ( = ?auto_281384 ?auto_281386 ) ) ( not ( = ?auto_281384 ?auto_281387 ) ) ( not ( = ?auto_281384 ?auto_281390 ) ) ( not ( = ?auto_281384 ?auto_281392 ) ) ( not ( = ?auto_281385 ?auto_281383 ) ) ( not ( = ?auto_281385 ?auto_281388 ) ) ( not ( = ?auto_281385 ?auto_281393 ) ) ( not ( = ?auto_281386 ?auto_281387 ) ) ( not ( = ?auto_281383 ?auto_281388 ) ) ( not ( = ?auto_281387 ?auto_281390 ) ) ( not ( = ?auto_281387 ?auto_281392 ) ) ( not ( = ?auto_281388 ?auto_281393 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281392 ?auto_281393 ?auto_281386 ?auto_281383 )
      ( GET-3IMAGE-VERIFY ?auto_281384 ?auto_281385 ?auto_281386 ?auto_281383 ?auto_281387 ?auto_281388 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_281436 - DIRECTION
      ?auto_281437 - MODE
      ?auto_281438 - DIRECTION
      ?auto_281435 - MODE
      ?auto_281439 - DIRECTION
      ?auto_281440 - MODE
    )
    :vars
    (
      ?auto_281441 - INSTRUMENT
      ?auto_281443 - SATELLITE
      ?auto_281442 - DIRECTION
      ?auto_281444 - DIRECTION
      ?auto_281445 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_281441 ?auto_281443 ) ( SUPPORTS ?auto_281441 ?auto_281437 ) ( POINTING ?auto_281443 ?auto_281442 ) ( not ( = ?auto_281436 ?auto_281442 ) ) ( HAVE_IMAGE ?auto_281444 ?auto_281445 ) ( not ( = ?auto_281444 ?auto_281436 ) ) ( not ( = ?auto_281444 ?auto_281442 ) ) ( not ( = ?auto_281445 ?auto_281437 ) ) ( CALIBRATION_TARGET ?auto_281441 ?auto_281442 ) ( POWER_AVAIL ?auto_281443 ) ( HAVE_IMAGE ?auto_281438 ?auto_281435 ) ( HAVE_IMAGE ?auto_281439 ?auto_281440 ) ( not ( = ?auto_281436 ?auto_281438 ) ) ( not ( = ?auto_281436 ?auto_281439 ) ) ( not ( = ?auto_281437 ?auto_281435 ) ) ( not ( = ?auto_281437 ?auto_281440 ) ) ( not ( = ?auto_281438 ?auto_281439 ) ) ( not ( = ?auto_281438 ?auto_281442 ) ) ( not ( = ?auto_281438 ?auto_281444 ) ) ( not ( = ?auto_281435 ?auto_281440 ) ) ( not ( = ?auto_281435 ?auto_281445 ) ) ( not ( = ?auto_281439 ?auto_281442 ) ) ( not ( = ?auto_281439 ?auto_281444 ) ) ( not ( = ?auto_281440 ?auto_281445 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281444 ?auto_281445 ?auto_281436 ?auto_281437 )
      ( GET-3IMAGE-VERIFY ?auto_281436 ?auto_281437 ?auto_281438 ?auto_281435 ?auto_281439 ?auto_281440 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281489 - DIRECTION
      ?auto_281490 - MODE
      ?auto_281491 - DIRECTION
      ?auto_281488 - MODE
      ?auto_281492 - DIRECTION
      ?auto_281493 - MODE
      ?auto_281494 - DIRECTION
      ?auto_281495 - MODE
    )
    :vars
    (
      ?auto_281496 - INSTRUMENT
      ?auto_281498 - SATELLITE
      ?auto_281497 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281496 ?auto_281498 ) ( SUPPORTS ?auto_281496 ?auto_281495 ) ( POINTING ?auto_281498 ?auto_281497 ) ( not ( = ?auto_281494 ?auto_281497 ) ) ( HAVE_IMAGE ?auto_281489 ?auto_281490 ) ( not ( = ?auto_281489 ?auto_281494 ) ) ( not ( = ?auto_281489 ?auto_281497 ) ) ( not ( = ?auto_281490 ?auto_281495 ) ) ( CALIBRATION_TARGET ?auto_281496 ?auto_281497 ) ( POWER_AVAIL ?auto_281498 ) ( HAVE_IMAGE ?auto_281491 ?auto_281488 ) ( HAVE_IMAGE ?auto_281492 ?auto_281493 ) ( not ( = ?auto_281489 ?auto_281491 ) ) ( not ( = ?auto_281489 ?auto_281492 ) ) ( not ( = ?auto_281490 ?auto_281488 ) ) ( not ( = ?auto_281490 ?auto_281493 ) ) ( not ( = ?auto_281491 ?auto_281492 ) ) ( not ( = ?auto_281491 ?auto_281494 ) ) ( not ( = ?auto_281491 ?auto_281497 ) ) ( not ( = ?auto_281488 ?auto_281493 ) ) ( not ( = ?auto_281488 ?auto_281495 ) ) ( not ( = ?auto_281492 ?auto_281494 ) ) ( not ( = ?auto_281492 ?auto_281497 ) ) ( not ( = ?auto_281493 ?auto_281495 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281489 ?auto_281490 ?auto_281494 ?auto_281495 )
      ( GET-4IMAGE-VERIFY ?auto_281489 ?auto_281490 ?auto_281491 ?auto_281488 ?auto_281492 ?auto_281493 ?auto_281494 ?auto_281495 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281511 - DIRECTION
      ?auto_281512 - MODE
      ?auto_281513 - DIRECTION
      ?auto_281510 - MODE
      ?auto_281514 - DIRECTION
      ?auto_281515 - MODE
      ?auto_281516 - DIRECTION
      ?auto_281517 - MODE
    )
    :vars
    (
      ?auto_281518 - INSTRUMENT
      ?auto_281520 - SATELLITE
      ?auto_281519 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281518 ?auto_281520 ) ( SUPPORTS ?auto_281518 ?auto_281515 ) ( POINTING ?auto_281520 ?auto_281519 ) ( not ( = ?auto_281514 ?auto_281519 ) ) ( HAVE_IMAGE ?auto_281511 ?auto_281517 ) ( not ( = ?auto_281511 ?auto_281514 ) ) ( not ( = ?auto_281511 ?auto_281519 ) ) ( not ( = ?auto_281517 ?auto_281515 ) ) ( CALIBRATION_TARGET ?auto_281518 ?auto_281519 ) ( POWER_AVAIL ?auto_281520 ) ( HAVE_IMAGE ?auto_281511 ?auto_281512 ) ( HAVE_IMAGE ?auto_281513 ?auto_281510 ) ( HAVE_IMAGE ?auto_281516 ?auto_281517 ) ( not ( = ?auto_281511 ?auto_281513 ) ) ( not ( = ?auto_281511 ?auto_281516 ) ) ( not ( = ?auto_281512 ?auto_281510 ) ) ( not ( = ?auto_281512 ?auto_281515 ) ) ( not ( = ?auto_281512 ?auto_281517 ) ) ( not ( = ?auto_281513 ?auto_281514 ) ) ( not ( = ?auto_281513 ?auto_281516 ) ) ( not ( = ?auto_281513 ?auto_281519 ) ) ( not ( = ?auto_281510 ?auto_281515 ) ) ( not ( = ?auto_281510 ?auto_281517 ) ) ( not ( = ?auto_281514 ?auto_281516 ) ) ( not ( = ?auto_281516 ?auto_281519 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281511 ?auto_281517 ?auto_281514 ?auto_281515 )
      ( GET-4IMAGE-VERIFY ?auto_281511 ?auto_281512 ?auto_281513 ?auto_281510 ?auto_281514 ?auto_281515 ?auto_281516 ?auto_281517 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281522 - DIRECTION
      ?auto_281523 - MODE
      ?auto_281524 - DIRECTION
      ?auto_281521 - MODE
      ?auto_281525 - DIRECTION
      ?auto_281526 - MODE
      ?auto_281527 - DIRECTION
      ?auto_281528 - MODE
    )
    :vars
    (
      ?auto_281529 - INSTRUMENT
      ?auto_281531 - SATELLITE
      ?auto_281530 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281529 ?auto_281531 ) ( SUPPORTS ?auto_281529 ?auto_281526 ) ( POINTING ?auto_281531 ?auto_281530 ) ( not ( = ?auto_281525 ?auto_281530 ) ) ( HAVE_IMAGE ?auto_281524 ?auto_281523 ) ( not ( = ?auto_281524 ?auto_281525 ) ) ( not ( = ?auto_281524 ?auto_281530 ) ) ( not ( = ?auto_281523 ?auto_281526 ) ) ( CALIBRATION_TARGET ?auto_281529 ?auto_281530 ) ( POWER_AVAIL ?auto_281531 ) ( HAVE_IMAGE ?auto_281522 ?auto_281523 ) ( HAVE_IMAGE ?auto_281524 ?auto_281521 ) ( HAVE_IMAGE ?auto_281527 ?auto_281528 ) ( not ( = ?auto_281522 ?auto_281524 ) ) ( not ( = ?auto_281522 ?auto_281525 ) ) ( not ( = ?auto_281522 ?auto_281527 ) ) ( not ( = ?auto_281522 ?auto_281530 ) ) ( not ( = ?auto_281523 ?auto_281521 ) ) ( not ( = ?auto_281523 ?auto_281528 ) ) ( not ( = ?auto_281524 ?auto_281527 ) ) ( not ( = ?auto_281521 ?auto_281526 ) ) ( not ( = ?auto_281521 ?auto_281528 ) ) ( not ( = ?auto_281525 ?auto_281527 ) ) ( not ( = ?auto_281526 ?auto_281528 ) ) ( not ( = ?auto_281527 ?auto_281530 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281524 ?auto_281523 ?auto_281525 ?auto_281526 )
      ( GET-4IMAGE-VERIFY ?auto_281522 ?auto_281523 ?auto_281524 ?auto_281521 ?auto_281525 ?auto_281526 ?auto_281527 ?auto_281528 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281544 - DIRECTION
      ?auto_281545 - MODE
      ?auto_281546 - DIRECTION
      ?auto_281543 - MODE
      ?auto_281547 - DIRECTION
      ?auto_281548 - MODE
      ?auto_281549 - DIRECTION
      ?auto_281550 - MODE
    )
    :vars
    (
      ?auto_281551 - INSTRUMENT
      ?auto_281553 - SATELLITE
      ?auto_281552 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281551 ?auto_281553 ) ( SUPPORTS ?auto_281551 ?auto_281550 ) ( POINTING ?auto_281553 ?auto_281552 ) ( not ( = ?auto_281549 ?auto_281552 ) ) ( HAVE_IMAGE ?auto_281544 ?auto_281548 ) ( not ( = ?auto_281544 ?auto_281549 ) ) ( not ( = ?auto_281544 ?auto_281552 ) ) ( not ( = ?auto_281548 ?auto_281550 ) ) ( CALIBRATION_TARGET ?auto_281551 ?auto_281552 ) ( POWER_AVAIL ?auto_281553 ) ( HAVE_IMAGE ?auto_281544 ?auto_281545 ) ( HAVE_IMAGE ?auto_281546 ?auto_281543 ) ( HAVE_IMAGE ?auto_281547 ?auto_281548 ) ( not ( = ?auto_281544 ?auto_281546 ) ) ( not ( = ?auto_281544 ?auto_281547 ) ) ( not ( = ?auto_281545 ?auto_281543 ) ) ( not ( = ?auto_281545 ?auto_281548 ) ) ( not ( = ?auto_281545 ?auto_281550 ) ) ( not ( = ?auto_281546 ?auto_281547 ) ) ( not ( = ?auto_281546 ?auto_281549 ) ) ( not ( = ?auto_281546 ?auto_281552 ) ) ( not ( = ?auto_281543 ?auto_281548 ) ) ( not ( = ?auto_281543 ?auto_281550 ) ) ( not ( = ?auto_281547 ?auto_281549 ) ) ( not ( = ?auto_281547 ?auto_281552 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281544 ?auto_281548 ?auto_281549 ?auto_281550 )
      ( GET-4IMAGE-VERIFY ?auto_281544 ?auto_281545 ?auto_281546 ?auto_281543 ?auto_281547 ?auto_281548 ?auto_281549 ?auto_281550 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281577 - DIRECTION
      ?auto_281578 - MODE
      ?auto_281579 - DIRECTION
      ?auto_281576 - MODE
      ?auto_281580 - DIRECTION
      ?auto_281581 - MODE
      ?auto_281582 - DIRECTION
      ?auto_281583 - MODE
    )
    :vars
    (
      ?auto_281584 - INSTRUMENT
      ?auto_281586 - SATELLITE
      ?auto_281585 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281584 ?auto_281586 ) ( SUPPORTS ?auto_281584 ?auto_281581 ) ( POINTING ?auto_281586 ?auto_281585 ) ( not ( = ?auto_281580 ?auto_281585 ) ) ( HAVE_IMAGE ?auto_281577 ?auto_281578 ) ( not ( = ?auto_281577 ?auto_281580 ) ) ( not ( = ?auto_281577 ?auto_281585 ) ) ( not ( = ?auto_281578 ?auto_281581 ) ) ( CALIBRATION_TARGET ?auto_281584 ?auto_281585 ) ( POWER_AVAIL ?auto_281586 ) ( HAVE_IMAGE ?auto_281579 ?auto_281576 ) ( HAVE_IMAGE ?auto_281582 ?auto_281583 ) ( not ( = ?auto_281577 ?auto_281579 ) ) ( not ( = ?auto_281577 ?auto_281582 ) ) ( not ( = ?auto_281578 ?auto_281576 ) ) ( not ( = ?auto_281578 ?auto_281583 ) ) ( not ( = ?auto_281579 ?auto_281580 ) ) ( not ( = ?auto_281579 ?auto_281582 ) ) ( not ( = ?auto_281579 ?auto_281585 ) ) ( not ( = ?auto_281576 ?auto_281581 ) ) ( not ( = ?auto_281576 ?auto_281583 ) ) ( not ( = ?auto_281580 ?auto_281582 ) ) ( not ( = ?auto_281581 ?auto_281583 ) ) ( not ( = ?auto_281582 ?auto_281585 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281577 ?auto_281578 ?auto_281580 ?auto_281581 )
      ( GET-4IMAGE-VERIFY ?auto_281577 ?auto_281578 ?auto_281579 ?auto_281576 ?auto_281580 ?auto_281581 ?auto_281582 ?auto_281583 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281599 - DIRECTION
      ?auto_281600 - MODE
      ?auto_281601 - DIRECTION
      ?auto_281598 - MODE
      ?auto_281602 - DIRECTION
      ?auto_281603 - MODE
      ?auto_281604 - DIRECTION
      ?auto_281605 - MODE
    )
    :vars
    (
      ?auto_281606 - INSTRUMENT
      ?auto_281608 - SATELLITE
      ?auto_281607 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281606 ?auto_281608 ) ( SUPPORTS ?auto_281606 ?auto_281598 ) ( POINTING ?auto_281608 ?auto_281607 ) ( not ( = ?auto_281601 ?auto_281607 ) ) ( HAVE_IMAGE ?auto_281604 ?auto_281600 ) ( not ( = ?auto_281604 ?auto_281601 ) ) ( not ( = ?auto_281604 ?auto_281607 ) ) ( not ( = ?auto_281600 ?auto_281598 ) ) ( CALIBRATION_TARGET ?auto_281606 ?auto_281607 ) ( POWER_AVAIL ?auto_281608 ) ( HAVE_IMAGE ?auto_281599 ?auto_281600 ) ( HAVE_IMAGE ?auto_281602 ?auto_281603 ) ( HAVE_IMAGE ?auto_281604 ?auto_281605 ) ( not ( = ?auto_281599 ?auto_281601 ) ) ( not ( = ?auto_281599 ?auto_281602 ) ) ( not ( = ?auto_281599 ?auto_281604 ) ) ( not ( = ?auto_281599 ?auto_281607 ) ) ( not ( = ?auto_281600 ?auto_281603 ) ) ( not ( = ?auto_281600 ?auto_281605 ) ) ( not ( = ?auto_281601 ?auto_281602 ) ) ( not ( = ?auto_281598 ?auto_281603 ) ) ( not ( = ?auto_281598 ?auto_281605 ) ) ( not ( = ?auto_281602 ?auto_281604 ) ) ( not ( = ?auto_281602 ?auto_281607 ) ) ( not ( = ?auto_281603 ?auto_281605 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281604 ?auto_281600 ?auto_281601 ?auto_281598 )
      ( GET-4IMAGE-VERIFY ?auto_281599 ?auto_281600 ?auto_281601 ?auto_281598 ?auto_281602 ?auto_281603 ?auto_281604 ?auto_281605 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281610 - DIRECTION
      ?auto_281611 - MODE
      ?auto_281612 - DIRECTION
      ?auto_281609 - MODE
      ?auto_281613 - DIRECTION
      ?auto_281614 - MODE
      ?auto_281615 - DIRECTION
      ?auto_281616 - MODE
    )
    :vars
    (
      ?auto_281617 - INSTRUMENT
      ?auto_281619 - SATELLITE
      ?auto_281618 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281617 ?auto_281619 ) ( SUPPORTS ?auto_281617 ?auto_281609 ) ( POINTING ?auto_281619 ?auto_281618 ) ( not ( = ?auto_281612 ?auto_281618 ) ) ( HAVE_IMAGE ?auto_281613 ?auto_281614 ) ( not ( = ?auto_281613 ?auto_281612 ) ) ( not ( = ?auto_281613 ?auto_281618 ) ) ( not ( = ?auto_281614 ?auto_281609 ) ) ( CALIBRATION_TARGET ?auto_281617 ?auto_281618 ) ( POWER_AVAIL ?auto_281619 ) ( HAVE_IMAGE ?auto_281610 ?auto_281611 ) ( HAVE_IMAGE ?auto_281615 ?auto_281616 ) ( not ( = ?auto_281610 ?auto_281612 ) ) ( not ( = ?auto_281610 ?auto_281613 ) ) ( not ( = ?auto_281610 ?auto_281615 ) ) ( not ( = ?auto_281610 ?auto_281618 ) ) ( not ( = ?auto_281611 ?auto_281609 ) ) ( not ( = ?auto_281611 ?auto_281614 ) ) ( not ( = ?auto_281611 ?auto_281616 ) ) ( not ( = ?auto_281612 ?auto_281615 ) ) ( not ( = ?auto_281609 ?auto_281616 ) ) ( not ( = ?auto_281613 ?auto_281615 ) ) ( not ( = ?auto_281614 ?auto_281616 ) ) ( not ( = ?auto_281615 ?auto_281618 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281613 ?auto_281614 ?auto_281612 ?auto_281609 )
      ( GET-4IMAGE-VERIFY ?auto_281610 ?auto_281611 ?auto_281612 ?auto_281609 ?auto_281613 ?auto_281614 ?auto_281615 ?auto_281616 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281632 - DIRECTION
      ?auto_281633 - MODE
      ?auto_281634 - DIRECTION
      ?auto_281631 - MODE
      ?auto_281635 - DIRECTION
      ?auto_281636 - MODE
      ?auto_281637 - DIRECTION
      ?auto_281638 - MODE
    )
    :vars
    (
      ?auto_281639 - INSTRUMENT
      ?auto_281641 - SATELLITE
      ?auto_281640 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281639 ?auto_281641 ) ( SUPPORTS ?auto_281639 ?auto_281631 ) ( POINTING ?auto_281641 ?auto_281640 ) ( not ( = ?auto_281634 ?auto_281640 ) ) ( HAVE_IMAGE ?auto_281632 ?auto_281638 ) ( not ( = ?auto_281632 ?auto_281634 ) ) ( not ( = ?auto_281632 ?auto_281640 ) ) ( not ( = ?auto_281638 ?auto_281631 ) ) ( CALIBRATION_TARGET ?auto_281639 ?auto_281640 ) ( POWER_AVAIL ?auto_281641 ) ( HAVE_IMAGE ?auto_281632 ?auto_281633 ) ( HAVE_IMAGE ?auto_281635 ?auto_281636 ) ( HAVE_IMAGE ?auto_281637 ?auto_281638 ) ( not ( = ?auto_281632 ?auto_281635 ) ) ( not ( = ?auto_281632 ?auto_281637 ) ) ( not ( = ?auto_281633 ?auto_281631 ) ) ( not ( = ?auto_281633 ?auto_281636 ) ) ( not ( = ?auto_281633 ?auto_281638 ) ) ( not ( = ?auto_281634 ?auto_281635 ) ) ( not ( = ?auto_281634 ?auto_281637 ) ) ( not ( = ?auto_281631 ?auto_281636 ) ) ( not ( = ?auto_281635 ?auto_281637 ) ) ( not ( = ?auto_281635 ?auto_281640 ) ) ( not ( = ?auto_281636 ?auto_281638 ) ) ( not ( = ?auto_281637 ?auto_281640 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281632 ?auto_281638 ?auto_281634 ?auto_281631 )
      ( GET-4IMAGE-VERIFY ?auto_281632 ?auto_281633 ?auto_281634 ?auto_281631 ?auto_281635 ?auto_281636 ?auto_281637 ?auto_281638 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281643 - DIRECTION
      ?auto_281644 - MODE
      ?auto_281645 - DIRECTION
      ?auto_281642 - MODE
      ?auto_281646 - DIRECTION
      ?auto_281647 - MODE
      ?auto_281648 - DIRECTION
      ?auto_281649 - MODE
    )
    :vars
    (
      ?auto_281650 - INSTRUMENT
      ?auto_281652 - SATELLITE
      ?auto_281651 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281650 ?auto_281652 ) ( SUPPORTS ?auto_281650 ?auto_281642 ) ( POINTING ?auto_281652 ?auto_281651 ) ( not ( = ?auto_281645 ?auto_281651 ) ) ( HAVE_IMAGE ?auto_281643 ?auto_281644 ) ( not ( = ?auto_281643 ?auto_281645 ) ) ( not ( = ?auto_281643 ?auto_281651 ) ) ( not ( = ?auto_281644 ?auto_281642 ) ) ( CALIBRATION_TARGET ?auto_281650 ?auto_281651 ) ( POWER_AVAIL ?auto_281652 ) ( HAVE_IMAGE ?auto_281646 ?auto_281647 ) ( HAVE_IMAGE ?auto_281648 ?auto_281649 ) ( not ( = ?auto_281643 ?auto_281646 ) ) ( not ( = ?auto_281643 ?auto_281648 ) ) ( not ( = ?auto_281644 ?auto_281647 ) ) ( not ( = ?auto_281644 ?auto_281649 ) ) ( not ( = ?auto_281645 ?auto_281646 ) ) ( not ( = ?auto_281645 ?auto_281648 ) ) ( not ( = ?auto_281642 ?auto_281647 ) ) ( not ( = ?auto_281642 ?auto_281649 ) ) ( not ( = ?auto_281646 ?auto_281648 ) ) ( not ( = ?auto_281646 ?auto_281651 ) ) ( not ( = ?auto_281647 ?auto_281649 ) ) ( not ( = ?auto_281648 ?auto_281651 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281643 ?auto_281644 ?auto_281645 ?auto_281642 )
      ( GET-4IMAGE-VERIFY ?auto_281643 ?auto_281644 ?auto_281645 ?auto_281642 ?auto_281646 ?auto_281647 ?auto_281648 ?auto_281649 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281698 - DIRECTION
      ?auto_281699 - MODE
      ?auto_281700 - DIRECTION
      ?auto_281697 - MODE
      ?auto_281701 - DIRECTION
      ?auto_281702 - MODE
      ?auto_281703 - DIRECTION
      ?auto_281704 - MODE
    )
    :vars
    (
      ?auto_281705 - INSTRUMENT
      ?auto_281707 - SATELLITE
      ?auto_281706 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281705 ?auto_281707 ) ( SUPPORTS ?auto_281705 ?auto_281704 ) ( POINTING ?auto_281707 ?auto_281706 ) ( not ( = ?auto_281703 ?auto_281706 ) ) ( HAVE_IMAGE ?auto_281700 ?auto_281702 ) ( not ( = ?auto_281700 ?auto_281703 ) ) ( not ( = ?auto_281700 ?auto_281706 ) ) ( not ( = ?auto_281702 ?auto_281704 ) ) ( CALIBRATION_TARGET ?auto_281705 ?auto_281706 ) ( POWER_AVAIL ?auto_281707 ) ( HAVE_IMAGE ?auto_281698 ?auto_281699 ) ( HAVE_IMAGE ?auto_281700 ?auto_281697 ) ( HAVE_IMAGE ?auto_281701 ?auto_281702 ) ( not ( = ?auto_281698 ?auto_281700 ) ) ( not ( = ?auto_281698 ?auto_281701 ) ) ( not ( = ?auto_281698 ?auto_281703 ) ) ( not ( = ?auto_281698 ?auto_281706 ) ) ( not ( = ?auto_281699 ?auto_281697 ) ) ( not ( = ?auto_281699 ?auto_281702 ) ) ( not ( = ?auto_281699 ?auto_281704 ) ) ( not ( = ?auto_281700 ?auto_281701 ) ) ( not ( = ?auto_281697 ?auto_281702 ) ) ( not ( = ?auto_281697 ?auto_281704 ) ) ( not ( = ?auto_281701 ?auto_281703 ) ) ( not ( = ?auto_281701 ?auto_281706 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281700 ?auto_281702 ?auto_281703 ?auto_281704 )
      ( GET-4IMAGE-VERIFY ?auto_281698 ?auto_281699 ?auto_281700 ?auto_281697 ?auto_281701 ?auto_281702 ?auto_281703 ?auto_281704 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281709 - DIRECTION
      ?auto_281710 - MODE
      ?auto_281711 - DIRECTION
      ?auto_281708 - MODE
      ?auto_281712 - DIRECTION
      ?auto_281713 - MODE
      ?auto_281714 - DIRECTION
      ?auto_281715 - MODE
    )
    :vars
    (
      ?auto_281716 - INSTRUMENT
      ?auto_281718 - SATELLITE
      ?auto_281717 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281716 ?auto_281718 ) ( SUPPORTS ?auto_281716 ?auto_281715 ) ( POINTING ?auto_281718 ?auto_281717 ) ( not ( = ?auto_281714 ?auto_281717 ) ) ( HAVE_IMAGE ?auto_281711 ?auto_281708 ) ( not ( = ?auto_281711 ?auto_281714 ) ) ( not ( = ?auto_281711 ?auto_281717 ) ) ( not ( = ?auto_281708 ?auto_281715 ) ) ( CALIBRATION_TARGET ?auto_281716 ?auto_281717 ) ( POWER_AVAIL ?auto_281718 ) ( HAVE_IMAGE ?auto_281709 ?auto_281710 ) ( HAVE_IMAGE ?auto_281712 ?auto_281713 ) ( not ( = ?auto_281709 ?auto_281711 ) ) ( not ( = ?auto_281709 ?auto_281712 ) ) ( not ( = ?auto_281709 ?auto_281714 ) ) ( not ( = ?auto_281709 ?auto_281717 ) ) ( not ( = ?auto_281710 ?auto_281708 ) ) ( not ( = ?auto_281710 ?auto_281713 ) ) ( not ( = ?auto_281710 ?auto_281715 ) ) ( not ( = ?auto_281711 ?auto_281712 ) ) ( not ( = ?auto_281708 ?auto_281713 ) ) ( not ( = ?auto_281712 ?auto_281714 ) ) ( not ( = ?auto_281712 ?auto_281717 ) ) ( not ( = ?auto_281713 ?auto_281715 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281711 ?auto_281708 ?auto_281714 ?auto_281715 )
      ( GET-4IMAGE-VERIFY ?auto_281709 ?auto_281710 ?auto_281711 ?auto_281708 ?auto_281712 ?auto_281713 ?auto_281714 ?auto_281715 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281720 - DIRECTION
      ?auto_281721 - MODE
      ?auto_281722 - DIRECTION
      ?auto_281719 - MODE
      ?auto_281723 - DIRECTION
      ?auto_281724 - MODE
      ?auto_281725 - DIRECTION
      ?auto_281726 - MODE
    )
    :vars
    (
      ?auto_281727 - INSTRUMENT
      ?auto_281729 - SATELLITE
      ?auto_281728 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281727 ?auto_281729 ) ( SUPPORTS ?auto_281727 ?auto_281724 ) ( POINTING ?auto_281729 ?auto_281728 ) ( not ( = ?auto_281723 ?auto_281728 ) ) ( HAVE_IMAGE ?auto_281722 ?auto_281726 ) ( not ( = ?auto_281722 ?auto_281723 ) ) ( not ( = ?auto_281722 ?auto_281728 ) ) ( not ( = ?auto_281726 ?auto_281724 ) ) ( CALIBRATION_TARGET ?auto_281727 ?auto_281728 ) ( POWER_AVAIL ?auto_281729 ) ( HAVE_IMAGE ?auto_281720 ?auto_281721 ) ( HAVE_IMAGE ?auto_281722 ?auto_281719 ) ( HAVE_IMAGE ?auto_281725 ?auto_281726 ) ( not ( = ?auto_281720 ?auto_281722 ) ) ( not ( = ?auto_281720 ?auto_281723 ) ) ( not ( = ?auto_281720 ?auto_281725 ) ) ( not ( = ?auto_281720 ?auto_281728 ) ) ( not ( = ?auto_281721 ?auto_281719 ) ) ( not ( = ?auto_281721 ?auto_281724 ) ) ( not ( = ?auto_281721 ?auto_281726 ) ) ( not ( = ?auto_281722 ?auto_281725 ) ) ( not ( = ?auto_281719 ?auto_281724 ) ) ( not ( = ?auto_281719 ?auto_281726 ) ) ( not ( = ?auto_281723 ?auto_281725 ) ) ( not ( = ?auto_281725 ?auto_281728 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281722 ?auto_281726 ?auto_281723 ?auto_281724 )
      ( GET-4IMAGE-VERIFY ?auto_281720 ?auto_281721 ?auto_281722 ?auto_281719 ?auto_281723 ?auto_281724 ?auto_281725 ?auto_281726 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281753 - DIRECTION
      ?auto_281754 - MODE
      ?auto_281755 - DIRECTION
      ?auto_281752 - MODE
      ?auto_281756 - DIRECTION
      ?auto_281757 - MODE
      ?auto_281758 - DIRECTION
      ?auto_281759 - MODE
    )
    :vars
    (
      ?auto_281760 - INSTRUMENT
      ?auto_281762 - SATELLITE
      ?auto_281761 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281760 ?auto_281762 ) ( SUPPORTS ?auto_281760 ?auto_281759 ) ( POINTING ?auto_281762 ?auto_281761 ) ( not ( = ?auto_281758 ?auto_281761 ) ) ( HAVE_IMAGE ?auto_281756 ?auto_281757 ) ( not ( = ?auto_281756 ?auto_281758 ) ) ( not ( = ?auto_281756 ?auto_281761 ) ) ( not ( = ?auto_281757 ?auto_281759 ) ) ( CALIBRATION_TARGET ?auto_281760 ?auto_281761 ) ( POWER_AVAIL ?auto_281762 ) ( HAVE_IMAGE ?auto_281753 ?auto_281754 ) ( HAVE_IMAGE ?auto_281755 ?auto_281752 ) ( not ( = ?auto_281753 ?auto_281755 ) ) ( not ( = ?auto_281753 ?auto_281756 ) ) ( not ( = ?auto_281753 ?auto_281758 ) ) ( not ( = ?auto_281753 ?auto_281761 ) ) ( not ( = ?auto_281754 ?auto_281752 ) ) ( not ( = ?auto_281754 ?auto_281757 ) ) ( not ( = ?auto_281754 ?auto_281759 ) ) ( not ( = ?auto_281755 ?auto_281756 ) ) ( not ( = ?auto_281755 ?auto_281758 ) ) ( not ( = ?auto_281755 ?auto_281761 ) ) ( not ( = ?auto_281752 ?auto_281757 ) ) ( not ( = ?auto_281752 ?auto_281759 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281756 ?auto_281757 ?auto_281758 ?auto_281759 )
      ( GET-4IMAGE-VERIFY ?auto_281753 ?auto_281754 ?auto_281755 ?auto_281752 ?auto_281756 ?auto_281757 ?auto_281758 ?auto_281759 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281764 - DIRECTION
      ?auto_281765 - MODE
      ?auto_281766 - DIRECTION
      ?auto_281763 - MODE
      ?auto_281767 - DIRECTION
      ?auto_281768 - MODE
      ?auto_281769 - DIRECTION
      ?auto_281770 - MODE
    )
    :vars
    (
      ?auto_281771 - INSTRUMENT
      ?auto_281773 - SATELLITE
      ?auto_281772 - DIRECTION
      ?auto_281774 - DIRECTION
      ?auto_281775 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_281771 ?auto_281773 ) ( SUPPORTS ?auto_281771 ?auto_281770 ) ( POINTING ?auto_281773 ?auto_281772 ) ( not ( = ?auto_281769 ?auto_281772 ) ) ( HAVE_IMAGE ?auto_281774 ?auto_281775 ) ( not ( = ?auto_281774 ?auto_281769 ) ) ( not ( = ?auto_281774 ?auto_281772 ) ) ( not ( = ?auto_281775 ?auto_281770 ) ) ( CALIBRATION_TARGET ?auto_281771 ?auto_281772 ) ( POWER_AVAIL ?auto_281773 ) ( HAVE_IMAGE ?auto_281764 ?auto_281765 ) ( HAVE_IMAGE ?auto_281766 ?auto_281763 ) ( HAVE_IMAGE ?auto_281767 ?auto_281768 ) ( not ( = ?auto_281764 ?auto_281766 ) ) ( not ( = ?auto_281764 ?auto_281767 ) ) ( not ( = ?auto_281764 ?auto_281769 ) ) ( not ( = ?auto_281764 ?auto_281772 ) ) ( not ( = ?auto_281764 ?auto_281774 ) ) ( not ( = ?auto_281765 ?auto_281763 ) ) ( not ( = ?auto_281765 ?auto_281768 ) ) ( not ( = ?auto_281765 ?auto_281770 ) ) ( not ( = ?auto_281765 ?auto_281775 ) ) ( not ( = ?auto_281766 ?auto_281767 ) ) ( not ( = ?auto_281766 ?auto_281769 ) ) ( not ( = ?auto_281766 ?auto_281772 ) ) ( not ( = ?auto_281766 ?auto_281774 ) ) ( not ( = ?auto_281763 ?auto_281768 ) ) ( not ( = ?auto_281763 ?auto_281770 ) ) ( not ( = ?auto_281763 ?auto_281775 ) ) ( not ( = ?auto_281767 ?auto_281769 ) ) ( not ( = ?auto_281767 ?auto_281772 ) ) ( not ( = ?auto_281767 ?auto_281774 ) ) ( not ( = ?auto_281768 ?auto_281770 ) ) ( not ( = ?auto_281768 ?auto_281775 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281774 ?auto_281775 ?auto_281769 ?auto_281770 )
      ( GET-4IMAGE-VERIFY ?auto_281764 ?auto_281765 ?auto_281766 ?auto_281763 ?auto_281767 ?auto_281768 ?auto_281769 ?auto_281770 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281777 - DIRECTION
      ?auto_281778 - MODE
      ?auto_281779 - DIRECTION
      ?auto_281776 - MODE
      ?auto_281780 - DIRECTION
      ?auto_281781 - MODE
      ?auto_281782 - DIRECTION
      ?auto_281783 - MODE
    )
    :vars
    (
      ?auto_281784 - INSTRUMENT
      ?auto_281786 - SATELLITE
      ?auto_281785 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281784 ?auto_281786 ) ( SUPPORTS ?auto_281784 ?auto_281781 ) ( POINTING ?auto_281786 ?auto_281785 ) ( not ( = ?auto_281780 ?auto_281785 ) ) ( HAVE_IMAGE ?auto_281782 ?auto_281783 ) ( not ( = ?auto_281782 ?auto_281780 ) ) ( not ( = ?auto_281782 ?auto_281785 ) ) ( not ( = ?auto_281783 ?auto_281781 ) ) ( CALIBRATION_TARGET ?auto_281784 ?auto_281785 ) ( POWER_AVAIL ?auto_281786 ) ( HAVE_IMAGE ?auto_281777 ?auto_281778 ) ( HAVE_IMAGE ?auto_281779 ?auto_281776 ) ( not ( = ?auto_281777 ?auto_281779 ) ) ( not ( = ?auto_281777 ?auto_281780 ) ) ( not ( = ?auto_281777 ?auto_281782 ) ) ( not ( = ?auto_281777 ?auto_281785 ) ) ( not ( = ?auto_281778 ?auto_281776 ) ) ( not ( = ?auto_281778 ?auto_281781 ) ) ( not ( = ?auto_281778 ?auto_281783 ) ) ( not ( = ?auto_281779 ?auto_281780 ) ) ( not ( = ?auto_281779 ?auto_281782 ) ) ( not ( = ?auto_281779 ?auto_281785 ) ) ( not ( = ?auto_281776 ?auto_281781 ) ) ( not ( = ?auto_281776 ?auto_281783 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281782 ?auto_281783 ?auto_281780 ?auto_281781 )
      ( GET-4IMAGE-VERIFY ?auto_281777 ?auto_281778 ?auto_281779 ?auto_281776 ?auto_281780 ?auto_281781 ?auto_281782 ?auto_281783 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281788 - DIRECTION
      ?auto_281789 - MODE
      ?auto_281790 - DIRECTION
      ?auto_281787 - MODE
      ?auto_281791 - DIRECTION
      ?auto_281792 - MODE
      ?auto_281793 - DIRECTION
      ?auto_281794 - MODE
    )
    :vars
    (
      ?auto_281795 - INSTRUMENT
      ?auto_281797 - SATELLITE
      ?auto_281796 - DIRECTION
      ?auto_281798 - DIRECTION
      ?auto_281799 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_281795 ?auto_281797 ) ( SUPPORTS ?auto_281795 ?auto_281792 ) ( POINTING ?auto_281797 ?auto_281796 ) ( not ( = ?auto_281791 ?auto_281796 ) ) ( HAVE_IMAGE ?auto_281798 ?auto_281799 ) ( not ( = ?auto_281798 ?auto_281791 ) ) ( not ( = ?auto_281798 ?auto_281796 ) ) ( not ( = ?auto_281799 ?auto_281792 ) ) ( CALIBRATION_TARGET ?auto_281795 ?auto_281796 ) ( POWER_AVAIL ?auto_281797 ) ( HAVE_IMAGE ?auto_281788 ?auto_281789 ) ( HAVE_IMAGE ?auto_281790 ?auto_281787 ) ( HAVE_IMAGE ?auto_281793 ?auto_281794 ) ( not ( = ?auto_281788 ?auto_281790 ) ) ( not ( = ?auto_281788 ?auto_281791 ) ) ( not ( = ?auto_281788 ?auto_281793 ) ) ( not ( = ?auto_281788 ?auto_281796 ) ) ( not ( = ?auto_281788 ?auto_281798 ) ) ( not ( = ?auto_281789 ?auto_281787 ) ) ( not ( = ?auto_281789 ?auto_281792 ) ) ( not ( = ?auto_281789 ?auto_281794 ) ) ( not ( = ?auto_281789 ?auto_281799 ) ) ( not ( = ?auto_281790 ?auto_281791 ) ) ( not ( = ?auto_281790 ?auto_281793 ) ) ( not ( = ?auto_281790 ?auto_281796 ) ) ( not ( = ?auto_281790 ?auto_281798 ) ) ( not ( = ?auto_281787 ?auto_281792 ) ) ( not ( = ?auto_281787 ?auto_281794 ) ) ( not ( = ?auto_281787 ?auto_281799 ) ) ( not ( = ?auto_281791 ?auto_281793 ) ) ( not ( = ?auto_281792 ?auto_281794 ) ) ( not ( = ?auto_281793 ?auto_281796 ) ) ( not ( = ?auto_281793 ?auto_281798 ) ) ( not ( = ?auto_281794 ?auto_281799 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281798 ?auto_281799 ?auto_281791 ?auto_281792 )
      ( GET-4IMAGE-VERIFY ?auto_281788 ?auto_281789 ?auto_281790 ?auto_281787 ?auto_281791 ?auto_281792 ?auto_281793 ?auto_281794 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281814 - DIRECTION
      ?auto_281815 - MODE
      ?auto_281816 - DIRECTION
      ?auto_281813 - MODE
      ?auto_281817 - DIRECTION
      ?auto_281818 - MODE
      ?auto_281819 - DIRECTION
      ?auto_281820 - MODE
    )
    :vars
    (
      ?auto_281821 - INSTRUMENT
      ?auto_281823 - SATELLITE
      ?auto_281822 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281821 ?auto_281823 ) ( SUPPORTS ?auto_281821 ?auto_281813 ) ( POINTING ?auto_281823 ?auto_281822 ) ( not ( = ?auto_281816 ?auto_281822 ) ) ( HAVE_IMAGE ?auto_281817 ?auto_281820 ) ( not ( = ?auto_281817 ?auto_281816 ) ) ( not ( = ?auto_281817 ?auto_281822 ) ) ( not ( = ?auto_281820 ?auto_281813 ) ) ( CALIBRATION_TARGET ?auto_281821 ?auto_281822 ) ( POWER_AVAIL ?auto_281823 ) ( HAVE_IMAGE ?auto_281814 ?auto_281815 ) ( HAVE_IMAGE ?auto_281817 ?auto_281818 ) ( HAVE_IMAGE ?auto_281819 ?auto_281820 ) ( not ( = ?auto_281814 ?auto_281816 ) ) ( not ( = ?auto_281814 ?auto_281817 ) ) ( not ( = ?auto_281814 ?auto_281819 ) ) ( not ( = ?auto_281814 ?auto_281822 ) ) ( not ( = ?auto_281815 ?auto_281813 ) ) ( not ( = ?auto_281815 ?auto_281818 ) ) ( not ( = ?auto_281815 ?auto_281820 ) ) ( not ( = ?auto_281816 ?auto_281819 ) ) ( not ( = ?auto_281813 ?auto_281818 ) ) ( not ( = ?auto_281817 ?auto_281819 ) ) ( not ( = ?auto_281818 ?auto_281820 ) ) ( not ( = ?auto_281819 ?auto_281822 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281817 ?auto_281820 ?auto_281816 ?auto_281813 )
      ( GET-4IMAGE-VERIFY ?auto_281814 ?auto_281815 ?auto_281816 ?auto_281813 ?auto_281817 ?auto_281818 ?auto_281819 ?auto_281820 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281847 - DIRECTION
      ?auto_281848 - MODE
      ?auto_281849 - DIRECTION
      ?auto_281846 - MODE
      ?auto_281850 - DIRECTION
      ?auto_281851 - MODE
      ?auto_281852 - DIRECTION
      ?auto_281853 - MODE
    )
    :vars
    (
      ?auto_281854 - INSTRUMENT
      ?auto_281856 - SATELLITE
      ?auto_281855 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281854 ?auto_281856 ) ( SUPPORTS ?auto_281854 ?auto_281846 ) ( POINTING ?auto_281856 ?auto_281855 ) ( not ( = ?auto_281849 ?auto_281855 ) ) ( HAVE_IMAGE ?auto_281852 ?auto_281853 ) ( not ( = ?auto_281852 ?auto_281849 ) ) ( not ( = ?auto_281852 ?auto_281855 ) ) ( not ( = ?auto_281853 ?auto_281846 ) ) ( CALIBRATION_TARGET ?auto_281854 ?auto_281855 ) ( POWER_AVAIL ?auto_281856 ) ( HAVE_IMAGE ?auto_281847 ?auto_281848 ) ( HAVE_IMAGE ?auto_281850 ?auto_281851 ) ( not ( = ?auto_281847 ?auto_281849 ) ) ( not ( = ?auto_281847 ?auto_281850 ) ) ( not ( = ?auto_281847 ?auto_281852 ) ) ( not ( = ?auto_281847 ?auto_281855 ) ) ( not ( = ?auto_281848 ?auto_281846 ) ) ( not ( = ?auto_281848 ?auto_281851 ) ) ( not ( = ?auto_281848 ?auto_281853 ) ) ( not ( = ?auto_281849 ?auto_281850 ) ) ( not ( = ?auto_281846 ?auto_281851 ) ) ( not ( = ?auto_281850 ?auto_281852 ) ) ( not ( = ?auto_281850 ?auto_281855 ) ) ( not ( = ?auto_281851 ?auto_281853 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281852 ?auto_281853 ?auto_281849 ?auto_281846 )
      ( GET-4IMAGE-VERIFY ?auto_281847 ?auto_281848 ?auto_281849 ?auto_281846 ?auto_281850 ?auto_281851 ?auto_281852 ?auto_281853 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281858 - DIRECTION
      ?auto_281859 - MODE
      ?auto_281860 - DIRECTION
      ?auto_281857 - MODE
      ?auto_281861 - DIRECTION
      ?auto_281862 - MODE
      ?auto_281863 - DIRECTION
      ?auto_281864 - MODE
    )
    :vars
    (
      ?auto_281865 - INSTRUMENT
      ?auto_281867 - SATELLITE
      ?auto_281866 - DIRECTION
      ?auto_281868 - DIRECTION
      ?auto_281869 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_281865 ?auto_281867 ) ( SUPPORTS ?auto_281865 ?auto_281857 ) ( POINTING ?auto_281867 ?auto_281866 ) ( not ( = ?auto_281860 ?auto_281866 ) ) ( HAVE_IMAGE ?auto_281868 ?auto_281869 ) ( not ( = ?auto_281868 ?auto_281860 ) ) ( not ( = ?auto_281868 ?auto_281866 ) ) ( not ( = ?auto_281869 ?auto_281857 ) ) ( CALIBRATION_TARGET ?auto_281865 ?auto_281866 ) ( POWER_AVAIL ?auto_281867 ) ( HAVE_IMAGE ?auto_281858 ?auto_281859 ) ( HAVE_IMAGE ?auto_281861 ?auto_281862 ) ( HAVE_IMAGE ?auto_281863 ?auto_281864 ) ( not ( = ?auto_281858 ?auto_281860 ) ) ( not ( = ?auto_281858 ?auto_281861 ) ) ( not ( = ?auto_281858 ?auto_281863 ) ) ( not ( = ?auto_281858 ?auto_281866 ) ) ( not ( = ?auto_281858 ?auto_281868 ) ) ( not ( = ?auto_281859 ?auto_281857 ) ) ( not ( = ?auto_281859 ?auto_281862 ) ) ( not ( = ?auto_281859 ?auto_281864 ) ) ( not ( = ?auto_281859 ?auto_281869 ) ) ( not ( = ?auto_281860 ?auto_281861 ) ) ( not ( = ?auto_281860 ?auto_281863 ) ) ( not ( = ?auto_281857 ?auto_281862 ) ) ( not ( = ?auto_281857 ?auto_281864 ) ) ( not ( = ?auto_281861 ?auto_281863 ) ) ( not ( = ?auto_281861 ?auto_281866 ) ) ( not ( = ?auto_281861 ?auto_281868 ) ) ( not ( = ?auto_281862 ?auto_281864 ) ) ( not ( = ?auto_281862 ?auto_281869 ) ) ( not ( = ?auto_281863 ?auto_281866 ) ) ( not ( = ?auto_281863 ?auto_281868 ) ) ( not ( = ?auto_281864 ?auto_281869 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281868 ?auto_281869 ?auto_281860 ?auto_281857 )
      ( GET-4IMAGE-VERIFY ?auto_281858 ?auto_281859 ?auto_281860 ?auto_281857 ?auto_281861 ?auto_281862 ?auto_281863 ?auto_281864 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281921 - DIRECTION
      ?auto_281922 - MODE
      ?auto_281923 - DIRECTION
      ?auto_281920 - MODE
      ?auto_281924 - DIRECTION
      ?auto_281925 - MODE
      ?auto_281926 - DIRECTION
      ?auto_281927 - MODE
    )
    :vars
    (
      ?auto_281928 - INSTRUMENT
      ?auto_281930 - SATELLITE
      ?auto_281929 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281928 ?auto_281930 ) ( SUPPORTS ?auto_281928 ?auto_281922 ) ( POINTING ?auto_281930 ?auto_281929 ) ( not ( = ?auto_281921 ?auto_281929 ) ) ( HAVE_IMAGE ?auto_281926 ?auto_281927 ) ( not ( = ?auto_281926 ?auto_281921 ) ) ( not ( = ?auto_281926 ?auto_281929 ) ) ( not ( = ?auto_281927 ?auto_281922 ) ) ( CALIBRATION_TARGET ?auto_281928 ?auto_281929 ) ( POWER_AVAIL ?auto_281930 ) ( HAVE_IMAGE ?auto_281923 ?auto_281920 ) ( HAVE_IMAGE ?auto_281924 ?auto_281925 ) ( not ( = ?auto_281921 ?auto_281923 ) ) ( not ( = ?auto_281921 ?auto_281924 ) ) ( not ( = ?auto_281922 ?auto_281920 ) ) ( not ( = ?auto_281922 ?auto_281925 ) ) ( not ( = ?auto_281923 ?auto_281924 ) ) ( not ( = ?auto_281923 ?auto_281926 ) ) ( not ( = ?auto_281923 ?auto_281929 ) ) ( not ( = ?auto_281920 ?auto_281925 ) ) ( not ( = ?auto_281920 ?auto_281927 ) ) ( not ( = ?auto_281924 ?auto_281926 ) ) ( not ( = ?auto_281924 ?auto_281929 ) ) ( not ( = ?auto_281925 ?auto_281927 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281926 ?auto_281927 ?auto_281921 ?auto_281922 )
      ( GET-4IMAGE-VERIFY ?auto_281921 ?auto_281922 ?auto_281923 ?auto_281920 ?auto_281924 ?auto_281925 ?auto_281926 ?auto_281927 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_281965 - DIRECTION
      ?auto_281966 - MODE
      ?auto_281967 - DIRECTION
      ?auto_281964 - MODE
      ?auto_281968 - DIRECTION
      ?auto_281969 - MODE
      ?auto_281970 - DIRECTION
      ?auto_281971 - MODE
    )
    :vars
    (
      ?auto_281972 - INSTRUMENT
      ?auto_281974 - SATELLITE
      ?auto_281973 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281972 ?auto_281974 ) ( SUPPORTS ?auto_281972 ?auto_281966 ) ( POINTING ?auto_281974 ?auto_281973 ) ( not ( = ?auto_281965 ?auto_281973 ) ) ( HAVE_IMAGE ?auto_281967 ?auto_281964 ) ( not ( = ?auto_281967 ?auto_281965 ) ) ( not ( = ?auto_281967 ?auto_281973 ) ) ( not ( = ?auto_281964 ?auto_281966 ) ) ( CALIBRATION_TARGET ?auto_281972 ?auto_281973 ) ( POWER_AVAIL ?auto_281974 ) ( HAVE_IMAGE ?auto_281968 ?auto_281969 ) ( HAVE_IMAGE ?auto_281970 ?auto_281971 ) ( not ( = ?auto_281965 ?auto_281968 ) ) ( not ( = ?auto_281965 ?auto_281970 ) ) ( not ( = ?auto_281966 ?auto_281969 ) ) ( not ( = ?auto_281966 ?auto_281971 ) ) ( not ( = ?auto_281967 ?auto_281968 ) ) ( not ( = ?auto_281967 ?auto_281970 ) ) ( not ( = ?auto_281964 ?auto_281969 ) ) ( not ( = ?auto_281964 ?auto_281971 ) ) ( not ( = ?auto_281968 ?auto_281970 ) ) ( not ( = ?auto_281968 ?auto_281973 ) ) ( not ( = ?auto_281969 ?auto_281971 ) ) ( not ( = ?auto_281970 ?auto_281973 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281967 ?auto_281964 ?auto_281965 ?auto_281966 )
      ( GET-4IMAGE-VERIFY ?auto_281965 ?auto_281966 ?auto_281967 ?auto_281964 ?auto_281968 ?auto_281969 ?auto_281970 ?auto_281971 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282031 - DIRECTION
      ?auto_282032 - MODE
      ?auto_282033 - DIRECTION
      ?auto_282030 - MODE
      ?auto_282034 - DIRECTION
      ?auto_282035 - MODE
      ?auto_282036 - DIRECTION
      ?auto_282037 - MODE
    )
    :vars
    (
      ?auto_282038 - INSTRUMENT
      ?auto_282040 - SATELLITE
      ?auto_282039 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282038 ?auto_282040 ) ( SUPPORTS ?auto_282038 ?auto_282032 ) ( POINTING ?auto_282040 ?auto_282039 ) ( not ( = ?auto_282031 ?auto_282039 ) ) ( HAVE_IMAGE ?auto_282034 ?auto_282035 ) ( not ( = ?auto_282034 ?auto_282031 ) ) ( not ( = ?auto_282034 ?auto_282039 ) ) ( not ( = ?auto_282035 ?auto_282032 ) ) ( CALIBRATION_TARGET ?auto_282038 ?auto_282039 ) ( POWER_AVAIL ?auto_282040 ) ( HAVE_IMAGE ?auto_282033 ?auto_282030 ) ( HAVE_IMAGE ?auto_282036 ?auto_282037 ) ( not ( = ?auto_282031 ?auto_282033 ) ) ( not ( = ?auto_282031 ?auto_282036 ) ) ( not ( = ?auto_282032 ?auto_282030 ) ) ( not ( = ?auto_282032 ?auto_282037 ) ) ( not ( = ?auto_282033 ?auto_282034 ) ) ( not ( = ?auto_282033 ?auto_282036 ) ) ( not ( = ?auto_282033 ?auto_282039 ) ) ( not ( = ?auto_282030 ?auto_282035 ) ) ( not ( = ?auto_282030 ?auto_282037 ) ) ( not ( = ?auto_282034 ?auto_282036 ) ) ( not ( = ?auto_282035 ?auto_282037 ) ) ( not ( = ?auto_282036 ?auto_282039 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282034 ?auto_282035 ?auto_282031 ?auto_282032 )
      ( GET-4IMAGE-VERIFY ?auto_282031 ?auto_282032 ?auto_282033 ?auto_282030 ?auto_282034 ?auto_282035 ?auto_282036 ?auto_282037 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282064 - DIRECTION
      ?auto_282065 - MODE
      ?auto_282066 - DIRECTION
      ?auto_282063 - MODE
      ?auto_282067 - DIRECTION
      ?auto_282068 - MODE
      ?auto_282069 - DIRECTION
      ?auto_282070 - MODE
    )
    :vars
    (
      ?auto_282071 - INSTRUMENT
      ?auto_282073 - SATELLITE
      ?auto_282072 - DIRECTION
      ?auto_282074 - DIRECTION
      ?auto_282075 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_282071 ?auto_282073 ) ( SUPPORTS ?auto_282071 ?auto_282065 ) ( POINTING ?auto_282073 ?auto_282072 ) ( not ( = ?auto_282064 ?auto_282072 ) ) ( HAVE_IMAGE ?auto_282074 ?auto_282075 ) ( not ( = ?auto_282074 ?auto_282064 ) ) ( not ( = ?auto_282074 ?auto_282072 ) ) ( not ( = ?auto_282075 ?auto_282065 ) ) ( CALIBRATION_TARGET ?auto_282071 ?auto_282072 ) ( POWER_AVAIL ?auto_282073 ) ( HAVE_IMAGE ?auto_282066 ?auto_282063 ) ( HAVE_IMAGE ?auto_282067 ?auto_282068 ) ( HAVE_IMAGE ?auto_282069 ?auto_282070 ) ( not ( = ?auto_282064 ?auto_282066 ) ) ( not ( = ?auto_282064 ?auto_282067 ) ) ( not ( = ?auto_282064 ?auto_282069 ) ) ( not ( = ?auto_282065 ?auto_282063 ) ) ( not ( = ?auto_282065 ?auto_282068 ) ) ( not ( = ?auto_282065 ?auto_282070 ) ) ( not ( = ?auto_282066 ?auto_282067 ) ) ( not ( = ?auto_282066 ?auto_282069 ) ) ( not ( = ?auto_282066 ?auto_282072 ) ) ( not ( = ?auto_282066 ?auto_282074 ) ) ( not ( = ?auto_282063 ?auto_282068 ) ) ( not ( = ?auto_282063 ?auto_282070 ) ) ( not ( = ?auto_282063 ?auto_282075 ) ) ( not ( = ?auto_282067 ?auto_282069 ) ) ( not ( = ?auto_282067 ?auto_282072 ) ) ( not ( = ?auto_282067 ?auto_282074 ) ) ( not ( = ?auto_282068 ?auto_282070 ) ) ( not ( = ?auto_282068 ?auto_282075 ) ) ( not ( = ?auto_282069 ?auto_282072 ) ) ( not ( = ?auto_282069 ?auto_282074 ) ) ( not ( = ?auto_282070 ?auto_282075 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282074 ?auto_282075 ?auto_282064 ?auto_282065 )
      ( GET-4IMAGE-VERIFY ?auto_282064 ?auto_282065 ?auto_282066 ?auto_282063 ?auto_282067 ?auto_282068 ?auto_282069 ?auto_282070 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_282233 - DIRECTION
      ?auto_282234 - MODE
    )
    :vars
    (
      ?auto_282235 - INSTRUMENT
      ?auto_282237 - SATELLITE
      ?auto_282236 - DIRECTION
      ?auto_282238 - DIRECTION
      ?auto_282239 - MODE
      ?auto_282240 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282235 ?auto_282237 ) ( SUPPORTS ?auto_282235 ?auto_282234 ) ( not ( = ?auto_282233 ?auto_282236 ) ) ( HAVE_IMAGE ?auto_282238 ?auto_282239 ) ( not ( = ?auto_282238 ?auto_282233 ) ) ( not ( = ?auto_282238 ?auto_282236 ) ) ( not ( = ?auto_282239 ?auto_282234 ) ) ( CALIBRATION_TARGET ?auto_282235 ?auto_282236 ) ( POWER_AVAIL ?auto_282237 ) ( POINTING ?auto_282237 ?auto_282240 ) ( not ( = ?auto_282236 ?auto_282240 ) ) ( not ( = ?auto_282233 ?auto_282240 ) ) ( not ( = ?auto_282238 ?auto_282240 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_282237 ?auto_282236 ?auto_282240 )
      ( GET-2IMAGE ?auto_282238 ?auto_282239 ?auto_282233 ?auto_282234 )
      ( GET-1IMAGE-VERIFY ?auto_282233 ?auto_282234 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_282242 - DIRECTION
      ?auto_282243 - MODE
      ?auto_282244 - DIRECTION
      ?auto_282241 - MODE
    )
    :vars
    (
      ?auto_282247 - INSTRUMENT
      ?auto_282248 - SATELLITE
      ?auto_282246 - DIRECTION
      ?auto_282245 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282247 ?auto_282248 ) ( SUPPORTS ?auto_282247 ?auto_282241 ) ( not ( = ?auto_282244 ?auto_282246 ) ) ( HAVE_IMAGE ?auto_282242 ?auto_282243 ) ( not ( = ?auto_282242 ?auto_282244 ) ) ( not ( = ?auto_282242 ?auto_282246 ) ) ( not ( = ?auto_282243 ?auto_282241 ) ) ( CALIBRATION_TARGET ?auto_282247 ?auto_282246 ) ( POWER_AVAIL ?auto_282248 ) ( POINTING ?auto_282248 ?auto_282245 ) ( not ( = ?auto_282246 ?auto_282245 ) ) ( not ( = ?auto_282244 ?auto_282245 ) ) ( not ( = ?auto_282242 ?auto_282245 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_282244 ?auto_282241 )
      ( GET-2IMAGE-VERIFY ?auto_282242 ?auto_282243 ?auto_282244 ?auto_282241 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_282250 - DIRECTION
      ?auto_282251 - MODE
      ?auto_282252 - DIRECTION
      ?auto_282249 - MODE
    )
    :vars
    (
      ?auto_282256 - INSTRUMENT
      ?auto_282254 - SATELLITE
      ?auto_282253 - DIRECTION
      ?auto_282255 - DIRECTION
      ?auto_282257 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_282256 ?auto_282254 ) ( SUPPORTS ?auto_282256 ?auto_282249 ) ( not ( = ?auto_282252 ?auto_282253 ) ) ( HAVE_IMAGE ?auto_282255 ?auto_282257 ) ( not ( = ?auto_282255 ?auto_282252 ) ) ( not ( = ?auto_282255 ?auto_282253 ) ) ( not ( = ?auto_282257 ?auto_282249 ) ) ( CALIBRATION_TARGET ?auto_282256 ?auto_282253 ) ( POWER_AVAIL ?auto_282254 ) ( POINTING ?auto_282254 ?auto_282250 ) ( not ( = ?auto_282253 ?auto_282250 ) ) ( not ( = ?auto_282252 ?auto_282250 ) ) ( not ( = ?auto_282255 ?auto_282250 ) ) ( HAVE_IMAGE ?auto_282250 ?auto_282251 ) ( not ( = ?auto_282251 ?auto_282249 ) ) ( not ( = ?auto_282251 ?auto_282257 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282255 ?auto_282257 ?auto_282252 ?auto_282249 )
      ( GET-2IMAGE-VERIFY ?auto_282250 ?auto_282251 ?auto_282252 ?auto_282249 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_282259 - DIRECTION
      ?auto_282260 - MODE
      ?auto_282261 - DIRECTION
      ?auto_282258 - MODE
    )
    :vars
    (
      ?auto_282265 - INSTRUMENT
      ?auto_282263 - SATELLITE
      ?auto_282262 - DIRECTION
      ?auto_282264 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282265 ?auto_282263 ) ( SUPPORTS ?auto_282265 ?auto_282260 ) ( not ( = ?auto_282259 ?auto_282262 ) ) ( HAVE_IMAGE ?auto_282261 ?auto_282258 ) ( not ( = ?auto_282261 ?auto_282259 ) ) ( not ( = ?auto_282261 ?auto_282262 ) ) ( not ( = ?auto_282258 ?auto_282260 ) ) ( CALIBRATION_TARGET ?auto_282265 ?auto_282262 ) ( POWER_AVAIL ?auto_282263 ) ( POINTING ?auto_282263 ?auto_282264 ) ( not ( = ?auto_282262 ?auto_282264 ) ) ( not ( = ?auto_282259 ?auto_282264 ) ) ( not ( = ?auto_282261 ?auto_282264 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282261 ?auto_282258 ?auto_282259 ?auto_282260 )
      ( GET-2IMAGE-VERIFY ?auto_282259 ?auto_282260 ?auto_282261 ?auto_282258 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_282267 - DIRECTION
      ?auto_282268 - MODE
      ?auto_282269 - DIRECTION
      ?auto_282266 - MODE
    )
    :vars
    (
      ?auto_282273 - INSTRUMENT
      ?auto_282271 - SATELLITE
      ?auto_282270 - DIRECTION
      ?auto_282272 - DIRECTION
      ?auto_282274 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_282273 ?auto_282271 ) ( SUPPORTS ?auto_282273 ?auto_282268 ) ( not ( = ?auto_282267 ?auto_282270 ) ) ( HAVE_IMAGE ?auto_282272 ?auto_282274 ) ( not ( = ?auto_282272 ?auto_282267 ) ) ( not ( = ?auto_282272 ?auto_282270 ) ) ( not ( = ?auto_282274 ?auto_282268 ) ) ( CALIBRATION_TARGET ?auto_282273 ?auto_282270 ) ( POWER_AVAIL ?auto_282271 ) ( POINTING ?auto_282271 ?auto_282269 ) ( not ( = ?auto_282270 ?auto_282269 ) ) ( not ( = ?auto_282267 ?auto_282269 ) ) ( not ( = ?auto_282272 ?auto_282269 ) ) ( HAVE_IMAGE ?auto_282269 ?auto_282266 ) ( not ( = ?auto_282268 ?auto_282266 ) ) ( not ( = ?auto_282266 ?auto_282274 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282272 ?auto_282274 ?auto_282267 ?auto_282268 )
      ( GET-2IMAGE-VERIFY ?auto_282267 ?auto_282268 ?auto_282269 ?auto_282266 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282286 - DIRECTION
      ?auto_282287 - MODE
      ?auto_282288 - DIRECTION
      ?auto_282285 - MODE
      ?auto_282289 - DIRECTION
      ?auto_282290 - MODE
    )
    :vars
    (
      ?auto_282294 - INSTRUMENT
      ?auto_282292 - SATELLITE
      ?auto_282291 - DIRECTION
      ?auto_282293 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282294 ?auto_282292 ) ( SUPPORTS ?auto_282294 ?auto_282290 ) ( not ( = ?auto_282289 ?auto_282291 ) ) ( HAVE_IMAGE ?auto_282288 ?auto_282285 ) ( not ( = ?auto_282288 ?auto_282289 ) ) ( not ( = ?auto_282288 ?auto_282291 ) ) ( not ( = ?auto_282285 ?auto_282290 ) ) ( CALIBRATION_TARGET ?auto_282294 ?auto_282291 ) ( POWER_AVAIL ?auto_282292 ) ( POINTING ?auto_282292 ?auto_282293 ) ( not ( = ?auto_282291 ?auto_282293 ) ) ( not ( = ?auto_282289 ?auto_282293 ) ) ( not ( = ?auto_282288 ?auto_282293 ) ) ( HAVE_IMAGE ?auto_282286 ?auto_282287 ) ( not ( = ?auto_282286 ?auto_282288 ) ) ( not ( = ?auto_282286 ?auto_282289 ) ) ( not ( = ?auto_282286 ?auto_282291 ) ) ( not ( = ?auto_282286 ?auto_282293 ) ) ( not ( = ?auto_282287 ?auto_282285 ) ) ( not ( = ?auto_282287 ?auto_282290 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282288 ?auto_282285 ?auto_282289 ?auto_282290 )
      ( GET-3IMAGE-VERIFY ?auto_282286 ?auto_282287 ?auto_282288 ?auto_282285 ?auto_282289 ?auto_282290 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282296 - DIRECTION
      ?auto_282297 - MODE
      ?auto_282298 - DIRECTION
      ?auto_282295 - MODE
      ?auto_282299 - DIRECTION
      ?auto_282300 - MODE
    )
    :vars
    (
      ?auto_282303 - INSTRUMENT
      ?auto_282302 - SATELLITE
      ?auto_282301 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282303 ?auto_282302 ) ( SUPPORTS ?auto_282303 ?auto_282300 ) ( not ( = ?auto_282299 ?auto_282301 ) ) ( HAVE_IMAGE ?auto_282296 ?auto_282297 ) ( not ( = ?auto_282296 ?auto_282299 ) ) ( not ( = ?auto_282296 ?auto_282301 ) ) ( not ( = ?auto_282297 ?auto_282300 ) ) ( CALIBRATION_TARGET ?auto_282303 ?auto_282301 ) ( POWER_AVAIL ?auto_282302 ) ( POINTING ?auto_282302 ?auto_282298 ) ( not ( = ?auto_282301 ?auto_282298 ) ) ( not ( = ?auto_282299 ?auto_282298 ) ) ( not ( = ?auto_282296 ?auto_282298 ) ) ( HAVE_IMAGE ?auto_282298 ?auto_282295 ) ( not ( = ?auto_282297 ?auto_282295 ) ) ( not ( = ?auto_282295 ?auto_282300 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282296 ?auto_282297 ?auto_282299 ?auto_282300 )
      ( GET-3IMAGE-VERIFY ?auto_282296 ?auto_282297 ?auto_282298 ?auto_282295 ?auto_282299 ?auto_282300 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282305 - DIRECTION
      ?auto_282306 - MODE
      ?auto_282307 - DIRECTION
      ?auto_282304 - MODE
      ?auto_282308 - DIRECTION
      ?auto_282309 - MODE
    )
    :vars
    (
      ?auto_282313 - INSTRUMENT
      ?auto_282311 - SATELLITE
      ?auto_282310 - DIRECTION
      ?auto_282312 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282313 ?auto_282311 ) ( SUPPORTS ?auto_282313 ?auto_282304 ) ( not ( = ?auto_282307 ?auto_282310 ) ) ( HAVE_IMAGE ?auto_282308 ?auto_282309 ) ( not ( = ?auto_282308 ?auto_282307 ) ) ( not ( = ?auto_282308 ?auto_282310 ) ) ( not ( = ?auto_282309 ?auto_282304 ) ) ( CALIBRATION_TARGET ?auto_282313 ?auto_282310 ) ( POWER_AVAIL ?auto_282311 ) ( POINTING ?auto_282311 ?auto_282312 ) ( not ( = ?auto_282310 ?auto_282312 ) ) ( not ( = ?auto_282307 ?auto_282312 ) ) ( not ( = ?auto_282308 ?auto_282312 ) ) ( HAVE_IMAGE ?auto_282305 ?auto_282306 ) ( not ( = ?auto_282305 ?auto_282307 ) ) ( not ( = ?auto_282305 ?auto_282308 ) ) ( not ( = ?auto_282305 ?auto_282310 ) ) ( not ( = ?auto_282305 ?auto_282312 ) ) ( not ( = ?auto_282306 ?auto_282304 ) ) ( not ( = ?auto_282306 ?auto_282309 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282308 ?auto_282309 ?auto_282307 ?auto_282304 )
      ( GET-3IMAGE-VERIFY ?auto_282305 ?auto_282306 ?auto_282307 ?auto_282304 ?auto_282308 ?auto_282309 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282315 - DIRECTION
      ?auto_282316 - MODE
      ?auto_282317 - DIRECTION
      ?auto_282314 - MODE
      ?auto_282318 - DIRECTION
      ?auto_282319 - MODE
    )
    :vars
    (
      ?auto_282322 - INSTRUMENT
      ?auto_282321 - SATELLITE
      ?auto_282320 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282322 ?auto_282321 ) ( SUPPORTS ?auto_282322 ?auto_282314 ) ( not ( = ?auto_282317 ?auto_282320 ) ) ( HAVE_IMAGE ?auto_282315 ?auto_282316 ) ( not ( = ?auto_282315 ?auto_282317 ) ) ( not ( = ?auto_282315 ?auto_282320 ) ) ( not ( = ?auto_282316 ?auto_282314 ) ) ( CALIBRATION_TARGET ?auto_282322 ?auto_282320 ) ( POWER_AVAIL ?auto_282321 ) ( POINTING ?auto_282321 ?auto_282318 ) ( not ( = ?auto_282320 ?auto_282318 ) ) ( not ( = ?auto_282317 ?auto_282318 ) ) ( not ( = ?auto_282315 ?auto_282318 ) ) ( HAVE_IMAGE ?auto_282318 ?auto_282319 ) ( not ( = ?auto_282316 ?auto_282319 ) ) ( not ( = ?auto_282314 ?auto_282319 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282315 ?auto_282316 ?auto_282317 ?auto_282314 )
      ( GET-3IMAGE-VERIFY ?auto_282315 ?auto_282316 ?auto_282317 ?auto_282314 ?auto_282318 ?auto_282319 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282334 - DIRECTION
      ?auto_282335 - MODE
      ?auto_282336 - DIRECTION
      ?auto_282333 - MODE
      ?auto_282337 - DIRECTION
      ?auto_282338 - MODE
    )
    :vars
    (
      ?auto_282341 - INSTRUMENT
      ?auto_282340 - SATELLITE
      ?auto_282339 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282341 ?auto_282340 ) ( SUPPORTS ?auto_282341 ?auto_282338 ) ( not ( = ?auto_282337 ?auto_282339 ) ) ( HAVE_IMAGE ?auto_282336 ?auto_282333 ) ( not ( = ?auto_282336 ?auto_282337 ) ) ( not ( = ?auto_282336 ?auto_282339 ) ) ( not ( = ?auto_282333 ?auto_282338 ) ) ( CALIBRATION_TARGET ?auto_282341 ?auto_282339 ) ( POWER_AVAIL ?auto_282340 ) ( POINTING ?auto_282340 ?auto_282334 ) ( not ( = ?auto_282339 ?auto_282334 ) ) ( not ( = ?auto_282337 ?auto_282334 ) ) ( not ( = ?auto_282336 ?auto_282334 ) ) ( HAVE_IMAGE ?auto_282334 ?auto_282335 ) ( not ( = ?auto_282335 ?auto_282333 ) ) ( not ( = ?auto_282335 ?auto_282338 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282336 ?auto_282333 ?auto_282337 ?auto_282338 )
      ( GET-3IMAGE-VERIFY ?auto_282334 ?auto_282335 ?auto_282336 ?auto_282333 ?auto_282337 ?auto_282338 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282343 - DIRECTION
      ?auto_282344 - MODE
      ?auto_282345 - DIRECTION
      ?auto_282342 - MODE
      ?auto_282346 - DIRECTION
      ?auto_282347 - MODE
    )
    :vars
    (
      ?auto_282351 - INSTRUMENT
      ?auto_282349 - SATELLITE
      ?auto_282348 - DIRECTION
      ?auto_282350 - DIRECTION
      ?auto_282352 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_282351 ?auto_282349 ) ( SUPPORTS ?auto_282351 ?auto_282347 ) ( not ( = ?auto_282346 ?auto_282348 ) ) ( HAVE_IMAGE ?auto_282350 ?auto_282352 ) ( not ( = ?auto_282350 ?auto_282346 ) ) ( not ( = ?auto_282350 ?auto_282348 ) ) ( not ( = ?auto_282352 ?auto_282347 ) ) ( CALIBRATION_TARGET ?auto_282351 ?auto_282348 ) ( POWER_AVAIL ?auto_282349 ) ( POINTING ?auto_282349 ?auto_282343 ) ( not ( = ?auto_282348 ?auto_282343 ) ) ( not ( = ?auto_282346 ?auto_282343 ) ) ( not ( = ?auto_282350 ?auto_282343 ) ) ( HAVE_IMAGE ?auto_282343 ?auto_282344 ) ( HAVE_IMAGE ?auto_282345 ?auto_282342 ) ( not ( = ?auto_282343 ?auto_282345 ) ) ( not ( = ?auto_282344 ?auto_282342 ) ) ( not ( = ?auto_282344 ?auto_282347 ) ) ( not ( = ?auto_282344 ?auto_282352 ) ) ( not ( = ?auto_282345 ?auto_282346 ) ) ( not ( = ?auto_282345 ?auto_282348 ) ) ( not ( = ?auto_282345 ?auto_282350 ) ) ( not ( = ?auto_282342 ?auto_282347 ) ) ( not ( = ?auto_282342 ?auto_282352 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282350 ?auto_282352 ?auto_282346 ?auto_282347 )
      ( GET-3IMAGE-VERIFY ?auto_282343 ?auto_282344 ?auto_282345 ?auto_282342 ?auto_282346 ?auto_282347 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282354 - DIRECTION
      ?auto_282355 - MODE
      ?auto_282356 - DIRECTION
      ?auto_282353 - MODE
      ?auto_282357 - DIRECTION
      ?auto_282358 - MODE
    )
    :vars
    (
      ?auto_282361 - INSTRUMENT
      ?auto_282360 - SATELLITE
      ?auto_282359 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282361 ?auto_282360 ) ( SUPPORTS ?auto_282361 ?auto_282353 ) ( not ( = ?auto_282356 ?auto_282359 ) ) ( HAVE_IMAGE ?auto_282357 ?auto_282358 ) ( not ( = ?auto_282357 ?auto_282356 ) ) ( not ( = ?auto_282357 ?auto_282359 ) ) ( not ( = ?auto_282358 ?auto_282353 ) ) ( CALIBRATION_TARGET ?auto_282361 ?auto_282359 ) ( POWER_AVAIL ?auto_282360 ) ( POINTING ?auto_282360 ?auto_282354 ) ( not ( = ?auto_282359 ?auto_282354 ) ) ( not ( = ?auto_282356 ?auto_282354 ) ) ( not ( = ?auto_282357 ?auto_282354 ) ) ( HAVE_IMAGE ?auto_282354 ?auto_282355 ) ( not ( = ?auto_282355 ?auto_282353 ) ) ( not ( = ?auto_282355 ?auto_282358 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282357 ?auto_282358 ?auto_282356 ?auto_282353 )
      ( GET-3IMAGE-VERIFY ?auto_282354 ?auto_282355 ?auto_282356 ?auto_282353 ?auto_282357 ?auto_282358 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282363 - DIRECTION
      ?auto_282364 - MODE
      ?auto_282365 - DIRECTION
      ?auto_282362 - MODE
      ?auto_282366 - DIRECTION
      ?auto_282367 - MODE
    )
    :vars
    (
      ?auto_282371 - INSTRUMENT
      ?auto_282369 - SATELLITE
      ?auto_282368 - DIRECTION
      ?auto_282370 - DIRECTION
      ?auto_282372 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_282371 ?auto_282369 ) ( SUPPORTS ?auto_282371 ?auto_282362 ) ( not ( = ?auto_282365 ?auto_282368 ) ) ( HAVE_IMAGE ?auto_282370 ?auto_282372 ) ( not ( = ?auto_282370 ?auto_282365 ) ) ( not ( = ?auto_282370 ?auto_282368 ) ) ( not ( = ?auto_282372 ?auto_282362 ) ) ( CALIBRATION_TARGET ?auto_282371 ?auto_282368 ) ( POWER_AVAIL ?auto_282369 ) ( POINTING ?auto_282369 ?auto_282363 ) ( not ( = ?auto_282368 ?auto_282363 ) ) ( not ( = ?auto_282365 ?auto_282363 ) ) ( not ( = ?auto_282370 ?auto_282363 ) ) ( HAVE_IMAGE ?auto_282363 ?auto_282364 ) ( HAVE_IMAGE ?auto_282366 ?auto_282367 ) ( not ( = ?auto_282363 ?auto_282366 ) ) ( not ( = ?auto_282364 ?auto_282362 ) ) ( not ( = ?auto_282364 ?auto_282367 ) ) ( not ( = ?auto_282364 ?auto_282372 ) ) ( not ( = ?auto_282365 ?auto_282366 ) ) ( not ( = ?auto_282362 ?auto_282367 ) ) ( not ( = ?auto_282366 ?auto_282368 ) ) ( not ( = ?auto_282366 ?auto_282370 ) ) ( not ( = ?auto_282367 ?auto_282372 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282370 ?auto_282372 ?auto_282365 ?auto_282362 )
      ( GET-3IMAGE-VERIFY ?auto_282363 ?auto_282364 ?auto_282365 ?auto_282362 ?auto_282366 ?auto_282367 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282385 - DIRECTION
      ?auto_282386 - MODE
      ?auto_282387 - DIRECTION
      ?auto_282384 - MODE
      ?auto_282388 - DIRECTION
      ?auto_282389 - MODE
    )
    :vars
    (
      ?auto_282393 - INSTRUMENT
      ?auto_282391 - SATELLITE
      ?auto_282390 - DIRECTION
      ?auto_282392 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282393 ?auto_282391 ) ( SUPPORTS ?auto_282393 ?auto_282386 ) ( not ( = ?auto_282385 ?auto_282390 ) ) ( HAVE_IMAGE ?auto_282387 ?auto_282389 ) ( not ( = ?auto_282387 ?auto_282385 ) ) ( not ( = ?auto_282387 ?auto_282390 ) ) ( not ( = ?auto_282389 ?auto_282386 ) ) ( CALIBRATION_TARGET ?auto_282393 ?auto_282390 ) ( POWER_AVAIL ?auto_282391 ) ( POINTING ?auto_282391 ?auto_282392 ) ( not ( = ?auto_282390 ?auto_282392 ) ) ( not ( = ?auto_282385 ?auto_282392 ) ) ( not ( = ?auto_282387 ?auto_282392 ) ) ( HAVE_IMAGE ?auto_282387 ?auto_282384 ) ( HAVE_IMAGE ?auto_282388 ?auto_282389 ) ( not ( = ?auto_282385 ?auto_282388 ) ) ( not ( = ?auto_282386 ?auto_282384 ) ) ( not ( = ?auto_282387 ?auto_282388 ) ) ( not ( = ?auto_282384 ?auto_282389 ) ) ( not ( = ?auto_282388 ?auto_282390 ) ) ( not ( = ?auto_282388 ?auto_282392 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282387 ?auto_282389 ?auto_282385 ?auto_282386 )
      ( GET-3IMAGE-VERIFY ?auto_282385 ?auto_282386 ?auto_282387 ?auto_282384 ?auto_282388 ?auto_282389 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282395 - DIRECTION
      ?auto_282396 - MODE
      ?auto_282397 - DIRECTION
      ?auto_282394 - MODE
      ?auto_282398 - DIRECTION
      ?auto_282399 - MODE
    )
    :vars
    (
      ?auto_282402 - INSTRUMENT
      ?auto_282401 - SATELLITE
      ?auto_282400 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282402 ?auto_282401 ) ( SUPPORTS ?auto_282402 ?auto_282396 ) ( not ( = ?auto_282395 ?auto_282400 ) ) ( HAVE_IMAGE ?auto_282397 ?auto_282394 ) ( not ( = ?auto_282397 ?auto_282395 ) ) ( not ( = ?auto_282397 ?auto_282400 ) ) ( not ( = ?auto_282394 ?auto_282396 ) ) ( CALIBRATION_TARGET ?auto_282402 ?auto_282400 ) ( POWER_AVAIL ?auto_282401 ) ( POINTING ?auto_282401 ?auto_282398 ) ( not ( = ?auto_282400 ?auto_282398 ) ) ( not ( = ?auto_282395 ?auto_282398 ) ) ( not ( = ?auto_282397 ?auto_282398 ) ) ( HAVE_IMAGE ?auto_282398 ?auto_282399 ) ( not ( = ?auto_282396 ?auto_282399 ) ) ( not ( = ?auto_282394 ?auto_282399 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282397 ?auto_282394 ?auto_282395 ?auto_282396 )
      ( GET-3IMAGE-VERIFY ?auto_282395 ?auto_282396 ?auto_282397 ?auto_282394 ?auto_282398 ?auto_282399 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282414 - DIRECTION
      ?auto_282415 - MODE
      ?auto_282416 - DIRECTION
      ?auto_282413 - MODE
      ?auto_282417 - DIRECTION
      ?auto_282418 - MODE
    )
    :vars
    (
      ?auto_282421 - INSTRUMENT
      ?auto_282420 - SATELLITE
      ?auto_282419 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282421 ?auto_282420 ) ( SUPPORTS ?auto_282421 ?auto_282415 ) ( not ( = ?auto_282414 ?auto_282419 ) ) ( HAVE_IMAGE ?auto_282417 ?auto_282418 ) ( not ( = ?auto_282417 ?auto_282414 ) ) ( not ( = ?auto_282417 ?auto_282419 ) ) ( not ( = ?auto_282418 ?auto_282415 ) ) ( CALIBRATION_TARGET ?auto_282421 ?auto_282419 ) ( POWER_AVAIL ?auto_282420 ) ( POINTING ?auto_282420 ?auto_282416 ) ( not ( = ?auto_282419 ?auto_282416 ) ) ( not ( = ?auto_282414 ?auto_282416 ) ) ( not ( = ?auto_282417 ?auto_282416 ) ) ( HAVE_IMAGE ?auto_282416 ?auto_282413 ) ( not ( = ?auto_282415 ?auto_282413 ) ) ( not ( = ?auto_282413 ?auto_282418 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282417 ?auto_282418 ?auto_282414 ?auto_282415 )
      ( GET-3IMAGE-VERIFY ?auto_282414 ?auto_282415 ?auto_282416 ?auto_282413 ?auto_282417 ?auto_282418 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282423 - DIRECTION
      ?auto_282424 - MODE
      ?auto_282425 - DIRECTION
      ?auto_282422 - MODE
      ?auto_282426 - DIRECTION
      ?auto_282427 - MODE
    )
    :vars
    (
      ?auto_282431 - INSTRUMENT
      ?auto_282429 - SATELLITE
      ?auto_282428 - DIRECTION
      ?auto_282430 - DIRECTION
      ?auto_282432 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_282431 ?auto_282429 ) ( SUPPORTS ?auto_282431 ?auto_282424 ) ( not ( = ?auto_282423 ?auto_282428 ) ) ( HAVE_IMAGE ?auto_282430 ?auto_282432 ) ( not ( = ?auto_282430 ?auto_282423 ) ) ( not ( = ?auto_282430 ?auto_282428 ) ) ( not ( = ?auto_282432 ?auto_282424 ) ) ( CALIBRATION_TARGET ?auto_282431 ?auto_282428 ) ( POWER_AVAIL ?auto_282429 ) ( POINTING ?auto_282429 ?auto_282426 ) ( not ( = ?auto_282428 ?auto_282426 ) ) ( not ( = ?auto_282423 ?auto_282426 ) ) ( not ( = ?auto_282430 ?auto_282426 ) ) ( HAVE_IMAGE ?auto_282425 ?auto_282422 ) ( HAVE_IMAGE ?auto_282426 ?auto_282427 ) ( not ( = ?auto_282423 ?auto_282425 ) ) ( not ( = ?auto_282424 ?auto_282422 ) ) ( not ( = ?auto_282424 ?auto_282427 ) ) ( not ( = ?auto_282425 ?auto_282426 ) ) ( not ( = ?auto_282425 ?auto_282428 ) ) ( not ( = ?auto_282425 ?auto_282430 ) ) ( not ( = ?auto_282422 ?auto_282427 ) ) ( not ( = ?auto_282422 ?auto_282432 ) ) ( not ( = ?auto_282427 ?auto_282432 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282430 ?auto_282432 ?auto_282423 ?auto_282424 )
      ( GET-3IMAGE-VERIFY ?auto_282423 ?auto_282424 ?auto_282425 ?auto_282422 ?auto_282426 ?auto_282427 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282478 - DIRECTION
      ?auto_282479 - MODE
      ?auto_282480 - DIRECTION
      ?auto_282477 - MODE
      ?auto_282481 - DIRECTION
      ?auto_282482 - MODE
      ?auto_282483 - DIRECTION
      ?auto_282484 - MODE
    )
    :vars
    (
      ?auto_282488 - INSTRUMENT
      ?auto_282486 - SATELLITE
      ?auto_282485 - DIRECTION
      ?auto_282487 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282488 ?auto_282486 ) ( SUPPORTS ?auto_282488 ?auto_282484 ) ( not ( = ?auto_282483 ?auto_282485 ) ) ( HAVE_IMAGE ?auto_282480 ?auto_282479 ) ( not ( = ?auto_282480 ?auto_282483 ) ) ( not ( = ?auto_282480 ?auto_282485 ) ) ( not ( = ?auto_282479 ?auto_282484 ) ) ( CALIBRATION_TARGET ?auto_282488 ?auto_282485 ) ( POWER_AVAIL ?auto_282486 ) ( POINTING ?auto_282486 ?auto_282487 ) ( not ( = ?auto_282485 ?auto_282487 ) ) ( not ( = ?auto_282483 ?auto_282487 ) ) ( not ( = ?auto_282480 ?auto_282487 ) ) ( HAVE_IMAGE ?auto_282478 ?auto_282479 ) ( HAVE_IMAGE ?auto_282480 ?auto_282477 ) ( HAVE_IMAGE ?auto_282481 ?auto_282482 ) ( not ( = ?auto_282478 ?auto_282480 ) ) ( not ( = ?auto_282478 ?auto_282481 ) ) ( not ( = ?auto_282478 ?auto_282483 ) ) ( not ( = ?auto_282478 ?auto_282485 ) ) ( not ( = ?auto_282478 ?auto_282487 ) ) ( not ( = ?auto_282479 ?auto_282477 ) ) ( not ( = ?auto_282479 ?auto_282482 ) ) ( not ( = ?auto_282480 ?auto_282481 ) ) ( not ( = ?auto_282477 ?auto_282482 ) ) ( not ( = ?auto_282477 ?auto_282484 ) ) ( not ( = ?auto_282481 ?auto_282483 ) ) ( not ( = ?auto_282481 ?auto_282485 ) ) ( not ( = ?auto_282481 ?auto_282487 ) ) ( not ( = ?auto_282482 ?auto_282484 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282480 ?auto_282479 ?auto_282483 ?auto_282484 )
      ( GET-4IMAGE-VERIFY ?auto_282478 ?auto_282479 ?auto_282480 ?auto_282477 ?auto_282481 ?auto_282482 ?auto_282483 ?auto_282484 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282490 - DIRECTION
      ?auto_282491 - MODE
      ?auto_282492 - DIRECTION
      ?auto_282489 - MODE
      ?auto_282493 - DIRECTION
      ?auto_282494 - MODE
      ?auto_282495 - DIRECTION
      ?auto_282496 - MODE
    )
    :vars
    (
      ?auto_282499 - INSTRUMENT
      ?auto_282498 - SATELLITE
      ?auto_282497 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282499 ?auto_282498 ) ( SUPPORTS ?auto_282499 ?auto_282496 ) ( not ( = ?auto_282495 ?auto_282497 ) ) ( HAVE_IMAGE ?auto_282490 ?auto_282491 ) ( not ( = ?auto_282490 ?auto_282495 ) ) ( not ( = ?auto_282490 ?auto_282497 ) ) ( not ( = ?auto_282491 ?auto_282496 ) ) ( CALIBRATION_TARGET ?auto_282499 ?auto_282497 ) ( POWER_AVAIL ?auto_282498 ) ( POINTING ?auto_282498 ?auto_282493 ) ( not ( = ?auto_282497 ?auto_282493 ) ) ( not ( = ?auto_282495 ?auto_282493 ) ) ( not ( = ?auto_282490 ?auto_282493 ) ) ( HAVE_IMAGE ?auto_282492 ?auto_282489 ) ( HAVE_IMAGE ?auto_282493 ?auto_282494 ) ( not ( = ?auto_282490 ?auto_282492 ) ) ( not ( = ?auto_282491 ?auto_282489 ) ) ( not ( = ?auto_282491 ?auto_282494 ) ) ( not ( = ?auto_282492 ?auto_282493 ) ) ( not ( = ?auto_282492 ?auto_282495 ) ) ( not ( = ?auto_282492 ?auto_282497 ) ) ( not ( = ?auto_282489 ?auto_282494 ) ) ( not ( = ?auto_282489 ?auto_282496 ) ) ( not ( = ?auto_282494 ?auto_282496 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282490 ?auto_282491 ?auto_282495 ?auto_282496 )
      ( GET-4IMAGE-VERIFY ?auto_282490 ?auto_282491 ?auto_282492 ?auto_282489 ?auto_282493 ?auto_282494 ?auto_282495 ?auto_282496 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282501 - DIRECTION
      ?auto_282502 - MODE
      ?auto_282503 - DIRECTION
      ?auto_282500 - MODE
      ?auto_282504 - DIRECTION
      ?auto_282505 - MODE
      ?auto_282506 - DIRECTION
      ?auto_282507 - MODE
    )
    :vars
    (
      ?auto_282511 - INSTRUMENT
      ?auto_282509 - SATELLITE
      ?auto_282508 - DIRECTION
      ?auto_282510 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282511 ?auto_282509 ) ( SUPPORTS ?auto_282511 ?auto_282505 ) ( not ( = ?auto_282504 ?auto_282508 ) ) ( HAVE_IMAGE ?auto_282503 ?auto_282507 ) ( not ( = ?auto_282503 ?auto_282504 ) ) ( not ( = ?auto_282503 ?auto_282508 ) ) ( not ( = ?auto_282507 ?auto_282505 ) ) ( CALIBRATION_TARGET ?auto_282511 ?auto_282508 ) ( POWER_AVAIL ?auto_282509 ) ( POINTING ?auto_282509 ?auto_282510 ) ( not ( = ?auto_282508 ?auto_282510 ) ) ( not ( = ?auto_282504 ?auto_282510 ) ) ( not ( = ?auto_282503 ?auto_282510 ) ) ( HAVE_IMAGE ?auto_282501 ?auto_282502 ) ( HAVE_IMAGE ?auto_282503 ?auto_282500 ) ( HAVE_IMAGE ?auto_282506 ?auto_282507 ) ( not ( = ?auto_282501 ?auto_282503 ) ) ( not ( = ?auto_282501 ?auto_282504 ) ) ( not ( = ?auto_282501 ?auto_282506 ) ) ( not ( = ?auto_282501 ?auto_282508 ) ) ( not ( = ?auto_282501 ?auto_282510 ) ) ( not ( = ?auto_282502 ?auto_282500 ) ) ( not ( = ?auto_282502 ?auto_282505 ) ) ( not ( = ?auto_282502 ?auto_282507 ) ) ( not ( = ?auto_282503 ?auto_282506 ) ) ( not ( = ?auto_282500 ?auto_282505 ) ) ( not ( = ?auto_282500 ?auto_282507 ) ) ( not ( = ?auto_282504 ?auto_282506 ) ) ( not ( = ?auto_282506 ?auto_282508 ) ) ( not ( = ?auto_282506 ?auto_282510 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282503 ?auto_282507 ?auto_282504 ?auto_282505 )
      ( GET-4IMAGE-VERIFY ?auto_282501 ?auto_282502 ?auto_282503 ?auto_282500 ?auto_282504 ?auto_282505 ?auto_282506 ?auto_282507 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282513 - DIRECTION
      ?auto_282514 - MODE
      ?auto_282515 - DIRECTION
      ?auto_282512 - MODE
      ?auto_282516 - DIRECTION
      ?auto_282517 - MODE
      ?auto_282518 - DIRECTION
      ?auto_282519 - MODE
    )
    :vars
    (
      ?auto_282522 - INSTRUMENT
      ?auto_282521 - SATELLITE
      ?auto_282520 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282522 ?auto_282521 ) ( SUPPORTS ?auto_282522 ?auto_282517 ) ( not ( = ?auto_282516 ?auto_282520 ) ) ( HAVE_IMAGE ?auto_282515 ?auto_282514 ) ( not ( = ?auto_282515 ?auto_282516 ) ) ( not ( = ?auto_282515 ?auto_282520 ) ) ( not ( = ?auto_282514 ?auto_282517 ) ) ( CALIBRATION_TARGET ?auto_282522 ?auto_282520 ) ( POWER_AVAIL ?auto_282521 ) ( POINTING ?auto_282521 ?auto_282518 ) ( not ( = ?auto_282520 ?auto_282518 ) ) ( not ( = ?auto_282516 ?auto_282518 ) ) ( not ( = ?auto_282515 ?auto_282518 ) ) ( HAVE_IMAGE ?auto_282513 ?auto_282514 ) ( HAVE_IMAGE ?auto_282515 ?auto_282512 ) ( HAVE_IMAGE ?auto_282518 ?auto_282519 ) ( not ( = ?auto_282513 ?auto_282515 ) ) ( not ( = ?auto_282513 ?auto_282516 ) ) ( not ( = ?auto_282513 ?auto_282518 ) ) ( not ( = ?auto_282513 ?auto_282520 ) ) ( not ( = ?auto_282514 ?auto_282512 ) ) ( not ( = ?auto_282514 ?auto_282519 ) ) ( not ( = ?auto_282512 ?auto_282517 ) ) ( not ( = ?auto_282512 ?auto_282519 ) ) ( not ( = ?auto_282517 ?auto_282519 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282515 ?auto_282514 ?auto_282516 ?auto_282517 )
      ( GET-4IMAGE-VERIFY ?auto_282513 ?auto_282514 ?auto_282515 ?auto_282512 ?auto_282516 ?auto_282517 ?auto_282518 ?auto_282519 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282536 - DIRECTION
      ?auto_282537 - MODE
      ?auto_282538 - DIRECTION
      ?auto_282535 - MODE
      ?auto_282539 - DIRECTION
      ?auto_282540 - MODE
      ?auto_282541 - DIRECTION
      ?auto_282542 - MODE
    )
    :vars
    (
      ?auto_282545 - INSTRUMENT
      ?auto_282544 - SATELLITE
      ?auto_282543 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282545 ?auto_282544 ) ( SUPPORTS ?auto_282545 ?auto_282542 ) ( not ( = ?auto_282541 ?auto_282543 ) ) ( HAVE_IMAGE ?auto_282539 ?auto_282540 ) ( not ( = ?auto_282539 ?auto_282541 ) ) ( not ( = ?auto_282539 ?auto_282543 ) ) ( not ( = ?auto_282540 ?auto_282542 ) ) ( CALIBRATION_TARGET ?auto_282545 ?auto_282543 ) ( POWER_AVAIL ?auto_282544 ) ( POINTING ?auto_282544 ?auto_282538 ) ( not ( = ?auto_282543 ?auto_282538 ) ) ( not ( = ?auto_282541 ?auto_282538 ) ) ( not ( = ?auto_282539 ?auto_282538 ) ) ( HAVE_IMAGE ?auto_282536 ?auto_282537 ) ( HAVE_IMAGE ?auto_282538 ?auto_282535 ) ( not ( = ?auto_282536 ?auto_282538 ) ) ( not ( = ?auto_282536 ?auto_282539 ) ) ( not ( = ?auto_282536 ?auto_282541 ) ) ( not ( = ?auto_282536 ?auto_282543 ) ) ( not ( = ?auto_282537 ?auto_282535 ) ) ( not ( = ?auto_282537 ?auto_282540 ) ) ( not ( = ?auto_282537 ?auto_282542 ) ) ( not ( = ?auto_282535 ?auto_282540 ) ) ( not ( = ?auto_282535 ?auto_282542 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282539 ?auto_282540 ?auto_282541 ?auto_282542 )
      ( GET-4IMAGE-VERIFY ?auto_282536 ?auto_282537 ?auto_282538 ?auto_282535 ?auto_282539 ?auto_282540 ?auto_282541 ?auto_282542 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282558 - DIRECTION
      ?auto_282559 - MODE
      ?auto_282560 - DIRECTION
      ?auto_282557 - MODE
      ?auto_282561 - DIRECTION
      ?auto_282562 - MODE
      ?auto_282563 - DIRECTION
      ?auto_282564 - MODE
    )
    :vars
    (
      ?auto_282567 - INSTRUMENT
      ?auto_282566 - SATELLITE
      ?auto_282565 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282567 ?auto_282566 ) ( SUPPORTS ?auto_282567 ?auto_282562 ) ( not ( = ?auto_282561 ?auto_282565 ) ) ( HAVE_IMAGE ?auto_282558 ?auto_282564 ) ( not ( = ?auto_282558 ?auto_282561 ) ) ( not ( = ?auto_282558 ?auto_282565 ) ) ( not ( = ?auto_282564 ?auto_282562 ) ) ( CALIBRATION_TARGET ?auto_282567 ?auto_282565 ) ( POWER_AVAIL ?auto_282566 ) ( POINTING ?auto_282566 ?auto_282560 ) ( not ( = ?auto_282565 ?auto_282560 ) ) ( not ( = ?auto_282561 ?auto_282560 ) ) ( not ( = ?auto_282558 ?auto_282560 ) ) ( HAVE_IMAGE ?auto_282558 ?auto_282559 ) ( HAVE_IMAGE ?auto_282560 ?auto_282557 ) ( HAVE_IMAGE ?auto_282563 ?auto_282564 ) ( not ( = ?auto_282558 ?auto_282563 ) ) ( not ( = ?auto_282559 ?auto_282557 ) ) ( not ( = ?auto_282559 ?auto_282562 ) ) ( not ( = ?auto_282559 ?auto_282564 ) ) ( not ( = ?auto_282560 ?auto_282563 ) ) ( not ( = ?auto_282557 ?auto_282562 ) ) ( not ( = ?auto_282557 ?auto_282564 ) ) ( not ( = ?auto_282561 ?auto_282563 ) ) ( not ( = ?auto_282563 ?auto_282565 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282558 ?auto_282564 ?auto_282561 ?auto_282562 )
      ( GET-4IMAGE-VERIFY ?auto_282558 ?auto_282559 ?auto_282560 ?auto_282557 ?auto_282561 ?auto_282562 ?auto_282563 ?auto_282564 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282569 - DIRECTION
      ?auto_282570 - MODE
      ?auto_282571 - DIRECTION
      ?auto_282568 - MODE
      ?auto_282572 - DIRECTION
      ?auto_282573 - MODE
      ?auto_282574 - DIRECTION
      ?auto_282575 - MODE
    )
    :vars
    (
      ?auto_282578 - INSTRUMENT
      ?auto_282577 - SATELLITE
      ?auto_282576 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282578 ?auto_282577 ) ( SUPPORTS ?auto_282578 ?auto_282573 ) ( not ( = ?auto_282572 ?auto_282576 ) ) ( HAVE_IMAGE ?auto_282569 ?auto_282570 ) ( not ( = ?auto_282569 ?auto_282572 ) ) ( not ( = ?auto_282569 ?auto_282576 ) ) ( not ( = ?auto_282570 ?auto_282573 ) ) ( CALIBRATION_TARGET ?auto_282578 ?auto_282576 ) ( POWER_AVAIL ?auto_282577 ) ( POINTING ?auto_282577 ?auto_282571 ) ( not ( = ?auto_282576 ?auto_282571 ) ) ( not ( = ?auto_282572 ?auto_282571 ) ) ( not ( = ?auto_282569 ?auto_282571 ) ) ( HAVE_IMAGE ?auto_282571 ?auto_282568 ) ( HAVE_IMAGE ?auto_282574 ?auto_282575 ) ( not ( = ?auto_282569 ?auto_282574 ) ) ( not ( = ?auto_282570 ?auto_282568 ) ) ( not ( = ?auto_282570 ?auto_282575 ) ) ( not ( = ?auto_282571 ?auto_282574 ) ) ( not ( = ?auto_282568 ?auto_282573 ) ) ( not ( = ?auto_282568 ?auto_282575 ) ) ( not ( = ?auto_282572 ?auto_282574 ) ) ( not ( = ?auto_282573 ?auto_282575 ) ) ( not ( = ?auto_282574 ?auto_282576 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282569 ?auto_282570 ?auto_282572 ?auto_282573 )
      ( GET-4IMAGE-VERIFY ?auto_282569 ?auto_282570 ?auto_282571 ?auto_282568 ?auto_282572 ?auto_282573 ?auto_282574 ?auto_282575 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282591 - DIRECTION
      ?auto_282592 - MODE
      ?auto_282593 - DIRECTION
      ?auto_282590 - MODE
      ?auto_282594 - DIRECTION
      ?auto_282595 - MODE
      ?auto_282596 - DIRECTION
      ?auto_282597 - MODE
    )
    :vars
    (
      ?auto_282601 - INSTRUMENT
      ?auto_282599 - SATELLITE
      ?auto_282598 - DIRECTION
      ?auto_282600 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282601 ?auto_282599 ) ( SUPPORTS ?auto_282601 ?auto_282590 ) ( not ( = ?auto_282593 ?auto_282598 ) ) ( HAVE_IMAGE ?auto_282591 ?auto_282597 ) ( not ( = ?auto_282591 ?auto_282593 ) ) ( not ( = ?auto_282591 ?auto_282598 ) ) ( not ( = ?auto_282597 ?auto_282590 ) ) ( CALIBRATION_TARGET ?auto_282601 ?auto_282598 ) ( POWER_AVAIL ?auto_282599 ) ( POINTING ?auto_282599 ?auto_282600 ) ( not ( = ?auto_282598 ?auto_282600 ) ) ( not ( = ?auto_282593 ?auto_282600 ) ) ( not ( = ?auto_282591 ?auto_282600 ) ) ( HAVE_IMAGE ?auto_282591 ?auto_282592 ) ( HAVE_IMAGE ?auto_282594 ?auto_282595 ) ( HAVE_IMAGE ?auto_282596 ?auto_282597 ) ( not ( = ?auto_282591 ?auto_282594 ) ) ( not ( = ?auto_282591 ?auto_282596 ) ) ( not ( = ?auto_282592 ?auto_282590 ) ) ( not ( = ?auto_282592 ?auto_282595 ) ) ( not ( = ?auto_282592 ?auto_282597 ) ) ( not ( = ?auto_282593 ?auto_282594 ) ) ( not ( = ?auto_282593 ?auto_282596 ) ) ( not ( = ?auto_282590 ?auto_282595 ) ) ( not ( = ?auto_282594 ?auto_282596 ) ) ( not ( = ?auto_282594 ?auto_282598 ) ) ( not ( = ?auto_282594 ?auto_282600 ) ) ( not ( = ?auto_282595 ?auto_282597 ) ) ( not ( = ?auto_282596 ?auto_282598 ) ) ( not ( = ?auto_282596 ?auto_282600 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282591 ?auto_282597 ?auto_282593 ?auto_282590 )
      ( GET-4IMAGE-VERIFY ?auto_282591 ?auto_282592 ?auto_282593 ?auto_282590 ?auto_282594 ?auto_282595 ?auto_282596 ?auto_282597 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282603 - DIRECTION
      ?auto_282604 - MODE
      ?auto_282605 - DIRECTION
      ?auto_282602 - MODE
      ?auto_282606 - DIRECTION
      ?auto_282607 - MODE
      ?auto_282608 - DIRECTION
      ?auto_282609 - MODE
    )
    :vars
    (
      ?auto_282612 - INSTRUMENT
      ?auto_282611 - SATELLITE
      ?auto_282610 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282612 ?auto_282611 ) ( SUPPORTS ?auto_282612 ?auto_282602 ) ( not ( = ?auto_282605 ?auto_282610 ) ) ( HAVE_IMAGE ?auto_282606 ?auto_282607 ) ( not ( = ?auto_282606 ?auto_282605 ) ) ( not ( = ?auto_282606 ?auto_282610 ) ) ( not ( = ?auto_282607 ?auto_282602 ) ) ( CALIBRATION_TARGET ?auto_282612 ?auto_282610 ) ( POWER_AVAIL ?auto_282611 ) ( POINTING ?auto_282611 ?auto_282608 ) ( not ( = ?auto_282610 ?auto_282608 ) ) ( not ( = ?auto_282605 ?auto_282608 ) ) ( not ( = ?auto_282606 ?auto_282608 ) ) ( HAVE_IMAGE ?auto_282603 ?auto_282604 ) ( HAVE_IMAGE ?auto_282608 ?auto_282609 ) ( not ( = ?auto_282603 ?auto_282605 ) ) ( not ( = ?auto_282603 ?auto_282606 ) ) ( not ( = ?auto_282603 ?auto_282608 ) ) ( not ( = ?auto_282603 ?auto_282610 ) ) ( not ( = ?auto_282604 ?auto_282602 ) ) ( not ( = ?auto_282604 ?auto_282607 ) ) ( not ( = ?auto_282604 ?auto_282609 ) ) ( not ( = ?auto_282602 ?auto_282609 ) ) ( not ( = ?auto_282607 ?auto_282609 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282606 ?auto_282607 ?auto_282605 ?auto_282602 )
      ( GET-4IMAGE-VERIFY ?auto_282603 ?auto_282604 ?auto_282605 ?auto_282602 ?auto_282606 ?auto_282607 ?auto_282608 ?auto_282609 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282626 - DIRECTION
      ?auto_282627 - MODE
      ?auto_282628 - DIRECTION
      ?auto_282625 - MODE
      ?auto_282629 - DIRECTION
      ?auto_282630 - MODE
      ?auto_282631 - DIRECTION
      ?auto_282632 - MODE
    )
    :vars
    (
      ?auto_282635 - INSTRUMENT
      ?auto_282634 - SATELLITE
      ?auto_282633 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282635 ?auto_282634 ) ( SUPPORTS ?auto_282635 ?auto_282625 ) ( not ( = ?auto_282628 ?auto_282633 ) ) ( HAVE_IMAGE ?auto_282631 ?auto_282632 ) ( not ( = ?auto_282631 ?auto_282628 ) ) ( not ( = ?auto_282631 ?auto_282633 ) ) ( not ( = ?auto_282632 ?auto_282625 ) ) ( CALIBRATION_TARGET ?auto_282635 ?auto_282633 ) ( POWER_AVAIL ?auto_282634 ) ( POINTING ?auto_282634 ?auto_282629 ) ( not ( = ?auto_282633 ?auto_282629 ) ) ( not ( = ?auto_282628 ?auto_282629 ) ) ( not ( = ?auto_282631 ?auto_282629 ) ) ( HAVE_IMAGE ?auto_282626 ?auto_282627 ) ( HAVE_IMAGE ?auto_282629 ?auto_282630 ) ( not ( = ?auto_282626 ?auto_282628 ) ) ( not ( = ?auto_282626 ?auto_282629 ) ) ( not ( = ?auto_282626 ?auto_282631 ) ) ( not ( = ?auto_282626 ?auto_282633 ) ) ( not ( = ?auto_282627 ?auto_282625 ) ) ( not ( = ?auto_282627 ?auto_282630 ) ) ( not ( = ?auto_282627 ?auto_282632 ) ) ( not ( = ?auto_282625 ?auto_282630 ) ) ( not ( = ?auto_282630 ?auto_282632 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282631 ?auto_282632 ?auto_282628 ?auto_282625 )
      ( GET-4IMAGE-VERIFY ?auto_282626 ?auto_282627 ?auto_282628 ?auto_282625 ?auto_282629 ?auto_282630 ?auto_282631 ?auto_282632 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282637 - DIRECTION
      ?auto_282638 - MODE
      ?auto_282639 - DIRECTION
      ?auto_282636 - MODE
      ?auto_282640 - DIRECTION
      ?auto_282641 - MODE
      ?auto_282642 - DIRECTION
      ?auto_282643 - MODE
    )
    :vars
    (
      ?auto_282646 - INSTRUMENT
      ?auto_282645 - SATELLITE
      ?auto_282644 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282646 ?auto_282645 ) ( SUPPORTS ?auto_282646 ?auto_282636 ) ( not ( = ?auto_282639 ?auto_282644 ) ) ( HAVE_IMAGE ?auto_282637 ?auto_282638 ) ( not ( = ?auto_282637 ?auto_282639 ) ) ( not ( = ?auto_282637 ?auto_282644 ) ) ( not ( = ?auto_282638 ?auto_282636 ) ) ( CALIBRATION_TARGET ?auto_282646 ?auto_282644 ) ( POWER_AVAIL ?auto_282645 ) ( POINTING ?auto_282645 ?auto_282640 ) ( not ( = ?auto_282644 ?auto_282640 ) ) ( not ( = ?auto_282639 ?auto_282640 ) ) ( not ( = ?auto_282637 ?auto_282640 ) ) ( HAVE_IMAGE ?auto_282640 ?auto_282641 ) ( HAVE_IMAGE ?auto_282642 ?auto_282643 ) ( not ( = ?auto_282637 ?auto_282642 ) ) ( not ( = ?auto_282638 ?auto_282641 ) ) ( not ( = ?auto_282638 ?auto_282643 ) ) ( not ( = ?auto_282639 ?auto_282642 ) ) ( not ( = ?auto_282636 ?auto_282641 ) ) ( not ( = ?auto_282636 ?auto_282643 ) ) ( not ( = ?auto_282640 ?auto_282642 ) ) ( not ( = ?auto_282641 ?auto_282643 ) ) ( not ( = ?auto_282642 ?auto_282644 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282637 ?auto_282638 ?auto_282639 ?auto_282636 )
      ( GET-4IMAGE-VERIFY ?auto_282637 ?auto_282638 ?auto_282639 ?auto_282636 ?auto_282640 ?auto_282641 ?auto_282642 ?auto_282643 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282694 - DIRECTION
      ?auto_282695 - MODE
      ?auto_282696 - DIRECTION
      ?auto_282693 - MODE
      ?auto_282697 - DIRECTION
      ?auto_282698 - MODE
      ?auto_282699 - DIRECTION
      ?auto_282700 - MODE
    )
    :vars
    (
      ?auto_282703 - INSTRUMENT
      ?auto_282702 - SATELLITE
      ?auto_282701 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282703 ?auto_282702 ) ( SUPPORTS ?auto_282703 ?auto_282700 ) ( not ( = ?auto_282699 ?auto_282701 ) ) ( HAVE_IMAGE ?auto_282697 ?auto_282693 ) ( not ( = ?auto_282697 ?auto_282699 ) ) ( not ( = ?auto_282697 ?auto_282701 ) ) ( not ( = ?auto_282693 ?auto_282700 ) ) ( CALIBRATION_TARGET ?auto_282703 ?auto_282701 ) ( POWER_AVAIL ?auto_282702 ) ( POINTING ?auto_282702 ?auto_282694 ) ( not ( = ?auto_282701 ?auto_282694 ) ) ( not ( = ?auto_282699 ?auto_282694 ) ) ( not ( = ?auto_282697 ?auto_282694 ) ) ( HAVE_IMAGE ?auto_282694 ?auto_282695 ) ( HAVE_IMAGE ?auto_282696 ?auto_282693 ) ( HAVE_IMAGE ?auto_282697 ?auto_282698 ) ( not ( = ?auto_282694 ?auto_282696 ) ) ( not ( = ?auto_282695 ?auto_282693 ) ) ( not ( = ?auto_282695 ?auto_282698 ) ) ( not ( = ?auto_282695 ?auto_282700 ) ) ( not ( = ?auto_282696 ?auto_282697 ) ) ( not ( = ?auto_282696 ?auto_282699 ) ) ( not ( = ?auto_282696 ?auto_282701 ) ) ( not ( = ?auto_282693 ?auto_282698 ) ) ( not ( = ?auto_282698 ?auto_282700 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282697 ?auto_282693 ?auto_282699 ?auto_282700 )
      ( GET-4IMAGE-VERIFY ?auto_282694 ?auto_282695 ?auto_282696 ?auto_282693 ?auto_282697 ?auto_282698 ?auto_282699 ?auto_282700 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282705 - DIRECTION
      ?auto_282706 - MODE
      ?auto_282707 - DIRECTION
      ?auto_282704 - MODE
      ?auto_282708 - DIRECTION
      ?auto_282709 - MODE
      ?auto_282710 - DIRECTION
      ?auto_282711 - MODE
    )
    :vars
    (
      ?auto_282714 - INSTRUMENT
      ?auto_282713 - SATELLITE
      ?auto_282712 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282714 ?auto_282713 ) ( SUPPORTS ?auto_282714 ?auto_282711 ) ( not ( = ?auto_282710 ?auto_282712 ) ) ( HAVE_IMAGE ?auto_282707 ?auto_282704 ) ( not ( = ?auto_282707 ?auto_282710 ) ) ( not ( = ?auto_282707 ?auto_282712 ) ) ( not ( = ?auto_282704 ?auto_282711 ) ) ( CALIBRATION_TARGET ?auto_282714 ?auto_282712 ) ( POWER_AVAIL ?auto_282713 ) ( POINTING ?auto_282713 ?auto_282708 ) ( not ( = ?auto_282712 ?auto_282708 ) ) ( not ( = ?auto_282710 ?auto_282708 ) ) ( not ( = ?auto_282707 ?auto_282708 ) ) ( HAVE_IMAGE ?auto_282705 ?auto_282706 ) ( HAVE_IMAGE ?auto_282708 ?auto_282709 ) ( not ( = ?auto_282705 ?auto_282707 ) ) ( not ( = ?auto_282705 ?auto_282708 ) ) ( not ( = ?auto_282705 ?auto_282710 ) ) ( not ( = ?auto_282705 ?auto_282712 ) ) ( not ( = ?auto_282706 ?auto_282704 ) ) ( not ( = ?auto_282706 ?auto_282709 ) ) ( not ( = ?auto_282706 ?auto_282711 ) ) ( not ( = ?auto_282704 ?auto_282709 ) ) ( not ( = ?auto_282709 ?auto_282711 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282707 ?auto_282704 ?auto_282710 ?auto_282711 )
      ( GET-4IMAGE-VERIFY ?auto_282705 ?auto_282706 ?auto_282707 ?auto_282704 ?auto_282708 ?auto_282709 ?auto_282710 ?auto_282711 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282716 - DIRECTION
      ?auto_282717 - MODE
      ?auto_282718 - DIRECTION
      ?auto_282715 - MODE
      ?auto_282719 - DIRECTION
      ?auto_282720 - MODE
      ?auto_282721 - DIRECTION
      ?auto_282722 - MODE
    )
    :vars
    (
      ?auto_282725 - INSTRUMENT
      ?auto_282724 - SATELLITE
      ?auto_282723 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282725 ?auto_282724 ) ( SUPPORTS ?auto_282725 ?auto_282720 ) ( not ( = ?auto_282719 ?auto_282723 ) ) ( HAVE_IMAGE ?auto_282718 ?auto_282722 ) ( not ( = ?auto_282718 ?auto_282719 ) ) ( not ( = ?auto_282718 ?auto_282723 ) ) ( not ( = ?auto_282722 ?auto_282720 ) ) ( CALIBRATION_TARGET ?auto_282725 ?auto_282723 ) ( POWER_AVAIL ?auto_282724 ) ( POINTING ?auto_282724 ?auto_282716 ) ( not ( = ?auto_282723 ?auto_282716 ) ) ( not ( = ?auto_282719 ?auto_282716 ) ) ( not ( = ?auto_282718 ?auto_282716 ) ) ( HAVE_IMAGE ?auto_282716 ?auto_282717 ) ( HAVE_IMAGE ?auto_282718 ?auto_282715 ) ( HAVE_IMAGE ?auto_282721 ?auto_282722 ) ( not ( = ?auto_282716 ?auto_282721 ) ) ( not ( = ?auto_282717 ?auto_282715 ) ) ( not ( = ?auto_282717 ?auto_282720 ) ) ( not ( = ?auto_282717 ?auto_282722 ) ) ( not ( = ?auto_282718 ?auto_282721 ) ) ( not ( = ?auto_282715 ?auto_282720 ) ) ( not ( = ?auto_282715 ?auto_282722 ) ) ( not ( = ?auto_282719 ?auto_282721 ) ) ( not ( = ?auto_282721 ?auto_282723 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282718 ?auto_282722 ?auto_282719 ?auto_282720 )
      ( GET-4IMAGE-VERIFY ?auto_282716 ?auto_282717 ?auto_282718 ?auto_282715 ?auto_282719 ?auto_282720 ?auto_282721 ?auto_282722 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282727 - DIRECTION
      ?auto_282728 - MODE
      ?auto_282729 - DIRECTION
      ?auto_282726 - MODE
      ?auto_282730 - DIRECTION
      ?auto_282731 - MODE
      ?auto_282732 - DIRECTION
      ?auto_282733 - MODE
    )
    :vars
    (
      ?auto_282736 - INSTRUMENT
      ?auto_282735 - SATELLITE
      ?auto_282734 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282736 ?auto_282735 ) ( SUPPORTS ?auto_282736 ?auto_282731 ) ( not ( = ?auto_282730 ?auto_282734 ) ) ( HAVE_IMAGE ?auto_282729 ?auto_282726 ) ( not ( = ?auto_282729 ?auto_282730 ) ) ( not ( = ?auto_282729 ?auto_282734 ) ) ( not ( = ?auto_282726 ?auto_282731 ) ) ( CALIBRATION_TARGET ?auto_282736 ?auto_282734 ) ( POWER_AVAIL ?auto_282735 ) ( POINTING ?auto_282735 ?auto_282727 ) ( not ( = ?auto_282734 ?auto_282727 ) ) ( not ( = ?auto_282730 ?auto_282727 ) ) ( not ( = ?auto_282729 ?auto_282727 ) ) ( HAVE_IMAGE ?auto_282727 ?auto_282728 ) ( HAVE_IMAGE ?auto_282732 ?auto_282733 ) ( not ( = ?auto_282727 ?auto_282732 ) ) ( not ( = ?auto_282728 ?auto_282726 ) ) ( not ( = ?auto_282728 ?auto_282731 ) ) ( not ( = ?auto_282728 ?auto_282733 ) ) ( not ( = ?auto_282729 ?auto_282732 ) ) ( not ( = ?auto_282726 ?auto_282733 ) ) ( not ( = ?auto_282730 ?auto_282732 ) ) ( not ( = ?auto_282731 ?auto_282733 ) ) ( not ( = ?auto_282732 ?auto_282734 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282729 ?auto_282726 ?auto_282730 ?auto_282731 )
      ( GET-4IMAGE-VERIFY ?auto_282727 ?auto_282728 ?auto_282729 ?auto_282726 ?auto_282730 ?auto_282731 ?auto_282732 ?auto_282733 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282749 - DIRECTION
      ?auto_282750 - MODE
      ?auto_282751 - DIRECTION
      ?auto_282748 - MODE
      ?auto_282752 - DIRECTION
      ?auto_282753 - MODE
      ?auto_282754 - DIRECTION
      ?auto_282755 - MODE
    )
    :vars
    (
      ?auto_282758 - INSTRUMENT
      ?auto_282757 - SATELLITE
      ?auto_282756 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282758 ?auto_282757 ) ( SUPPORTS ?auto_282758 ?auto_282755 ) ( not ( = ?auto_282754 ?auto_282756 ) ) ( HAVE_IMAGE ?auto_282752 ?auto_282753 ) ( not ( = ?auto_282752 ?auto_282754 ) ) ( not ( = ?auto_282752 ?auto_282756 ) ) ( not ( = ?auto_282753 ?auto_282755 ) ) ( CALIBRATION_TARGET ?auto_282758 ?auto_282756 ) ( POWER_AVAIL ?auto_282757 ) ( POINTING ?auto_282757 ?auto_282749 ) ( not ( = ?auto_282756 ?auto_282749 ) ) ( not ( = ?auto_282754 ?auto_282749 ) ) ( not ( = ?auto_282752 ?auto_282749 ) ) ( HAVE_IMAGE ?auto_282749 ?auto_282750 ) ( HAVE_IMAGE ?auto_282751 ?auto_282748 ) ( not ( = ?auto_282749 ?auto_282751 ) ) ( not ( = ?auto_282750 ?auto_282748 ) ) ( not ( = ?auto_282750 ?auto_282753 ) ) ( not ( = ?auto_282750 ?auto_282755 ) ) ( not ( = ?auto_282751 ?auto_282752 ) ) ( not ( = ?auto_282751 ?auto_282754 ) ) ( not ( = ?auto_282751 ?auto_282756 ) ) ( not ( = ?auto_282748 ?auto_282753 ) ) ( not ( = ?auto_282748 ?auto_282755 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282752 ?auto_282753 ?auto_282754 ?auto_282755 )
      ( GET-4IMAGE-VERIFY ?auto_282749 ?auto_282750 ?auto_282751 ?auto_282748 ?auto_282752 ?auto_282753 ?auto_282754 ?auto_282755 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282760 - DIRECTION
      ?auto_282761 - MODE
      ?auto_282762 - DIRECTION
      ?auto_282759 - MODE
      ?auto_282763 - DIRECTION
      ?auto_282764 - MODE
      ?auto_282765 - DIRECTION
      ?auto_282766 - MODE
    )
    :vars
    (
      ?auto_282770 - INSTRUMENT
      ?auto_282768 - SATELLITE
      ?auto_282767 - DIRECTION
      ?auto_282769 - DIRECTION
      ?auto_282771 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_282770 ?auto_282768 ) ( SUPPORTS ?auto_282770 ?auto_282766 ) ( not ( = ?auto_282765 ?auto_282767 ) ) ( HAVE_IMAGE ?auto_282769 ?auto_282771 ) ( not ( = ?auto_282769 ?auto_282765 ) ) ( not ( = ?auto_282769 ?auto_282767 ) ) ( not ( = ?auto_282771 ?auto_282766 ) ) ( CALIBRATION_TARGET ?auto_282770 ?auto_282767 ) ( POWER_AVAIL ?auto_282768 ) ( POINTING ?auto_282768 ?auto_282763 ) ( not ( = ?auto_282767 ?auto_282763 ) ) ( not ( = ?auto_282765 ?auto_282763 ) ) ( not ( = ?auto_282769 ?auto_282763 ) ) ( HAVE_IMAGE ?auto_282760 ?auto_282761 ) ( HAVE_IMAGE ?auto_282762 ?auto_282759 ) ( HAVE_IMAGE ?auto_282763 ?auto_282764 ) ( not ( = ?auto_282760 ?auto_282762 ) ) ( not ( = ?auto_282760 ?auto_282763 ) ) ( not ( = ?auto_282760 ?auto_282765 ) ) ( not ( = ?auto_282760 ?auto_282767 ) ) ( not ( = ?auto_282760 ?auto_282769 ) ) ( not ( = ?auto_282761 ?auto_282759 ) ) ( not ( = ?auto_282761 ?auto_282764 ) ) ( not ( = ?auto_282761 ?auto_282766 ) ) ( not ( = ?auto_282761 ?auto_282771 ) ) ( not ( = ?auto_282762 ?auto_282763 ) ) ( not ( = ?auto_282762 ?auto_282765 ) ) ( not ( = ?auto_282762 ?auto_282767 ) ) ( not ( = ?auto_282762 ?auto_282769 ) ) ( not ( = ?auto_282759 ?auto_282764 ) ) ( not ( = ?auto_282759 ?auto_282766 ) ) ( not ( = ?auto_282759 ?auto_282771 ) ) ( not ( = ?auto_282764 ?auto_282766 ) ) ( not ( = ?auto_282764 ?auto_282771 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282769 ?auto_282771 ?auto_282765 ?auto_282766 )
      ( GET-4IMAGE-VERIFY ?auto_282760 ?auto_282761 ?auto_282762 ?auto_282759 ?auto_282763 ?auto_282764 ?auto_282765 ?auto_282766 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282773 - DIRECTION
      ?auto_282774 - MODE
      ?auto_282775 - DIRECTION
      ?auto_282772 - MODE
      ?auto_282776 - DIRECTION
      ?auto_282777 - MODE
      ?auto_282778 - DIRECTION
      ?auto_282779 - MODE
    )
    :vars
    (
      ?auto_282782 - INSTRUMENT
      ?auto_282781 - SATELLITE
      ?auto_282780 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282782 ?auto_282781 ) ( SUPPORTS ?auto_282782 ?auto_282777 ) ( not ( = ?auto_282776 ?auto_282780 ) ) ( HAVE_IMAGE ?auto_282778 ?auto_282779 ) ( not ( = ?auto_282778 ?auto_282776 ) ) ( not ( = ?auto_282778 ?auto_282780 ) ) ( not ( = ?auto_282779 ?auto_282777 ) ) ( CALIBRATION_TARGET ?auto_282782 ?auto_282780 ) ( POWER_AVAIL ?auto_282781 ) ( POINTING ?auto_282781 ?auto_282773 ) ( not ( = ?auto_282780 ?auto_282773 ) ) ( not ( = ?auto_282776 ?auto_282773 ) ) ( not ( = ?auto_282778 ?auto_282773 ) ) ( HAVE_IMAGE ?auto_282773 ?auto_282774 ) ( HAVE_IMAGE ?auto_282775 ?auto_282772 ) ( not ( = ?auto_282773 ?auto_282775 ) ) ( not ( = ?auto_282774 ?auto_282772 ) ) ( not ( = ?auto_282774 ?auto_282777 ) ) ( not ( = ?auto_282774 ?auto_282779 ) ) ( not ( = ?auto_282775 ?auto_282776 ) ) ( not ( = ?auto_282775 ?auto_282778 ) ) ( not ( = ?auto_282775 ?auto_282780 ) ) ( not ( = ?auto_282772 ?auto_282777 ) ) ( not ( = ?auto_282772 ?auto_282779 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282778 ?auto_282779 ?auto_282776 ?auto_282777 )
      ( GET-4IMAGE-VERIFY ?auto_282773 ?auto_282774 ?auto_282775 ?auto_282772 ?auto_282776 ?auto_282777 ?auto_282778 ?auto_282779 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282784 - DIRECTION
      ?auto_282785 - MODE
      ?auto_282786 - DIRECTION
      ?auto_282783 - MODE
      ?auto_282787 - DIRECTION
      ?auto_282788 - MODE
      ?auto_282789 - DIRECTION
      ?auto_282790 - MODE
    )
    :vars
    (
      ?auto_282794 - INSTRUMENT
      ?auto_282792 - SATELLITE
      ?auto_282791 - DIRECTION
      ?auto_282793 - DIRECTION
      ?auto_282795 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_282794 ?auto_282792 ) ( SUPPORTS ?auto_282794 ?auto_282788 ) ( not ( = ?auto_282787 ?auto_282791 ) ) ( HAVE_IMAGE ?auto_282793 ?auto_282795 ) ( not ( = ?auto_282793 ?auto_282787 ) ) ( not ( = ?auto_282793 ?auto_282791 ) ) ( not ( = ?auto_282795 ?auto_282788 ) ) ( CALIBRATION_TARGET ?auto_282794 ?auto_282791 ) ( POWER_AVAIL ?auto_282792 ) ( POINTING ?auto_282792 ?auto_282786 ) ( not ( = ?auto_282791 ?auto_282786 ) ) ( not ( = ?auto_282787 ?auto_282786 ) ) ( not ( = ?auto_282793 ?auto_282786 ) ) ( HAVE_IMAGE ?auto_282784 ?auto_282785 ) ( HAVE_IMAGE ?auto_282786 ?auto_282783 ) ( HAVE_IMAGE ?auto_282789 ?auto_282790 ) ( not ( = ?auto_282784 ?auto_282786 ) ) ( not ( = ?auto_282784 ?auto_282787 ) ) ( not ( = ?auto_282784 ?auto_282789 ) ) ( not ( = ?auto_282784 ?auto_282791 ) ) ( not ( = ?auto_282784 ?auto_282793 ) ) ( not ( = ?auto_282785 ?auto_282783 ) ) ( not ( = ?auto_282785 ?auto_282788 ) ) ( not ( = ?auto_282785 ?auto_282790 ) ) ( not ( = ?auto_282785 ?auto_282795 ) ) ( not ( = ?auto_282786 ?auto_282789 ) ) ( not ( = ?auto_282783 ?auto_282788 ) ) ( not ( = ?auto_282783 ?auto_282790 ) ) ( not ( = ?auto_282783 ?auto_282795 ) ) ( not ( = ?auto_282787 ?auto_282789 ) ) ( not ( = ?auto_282788 ?auto_282790 ) ) ( not ( = ?auto_282789 ?auto_282791 ) ) ( not ( = ?auto_282789 ?auto_282793 ) ) ( not ( = ?auto_282790 ?auto_282795 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282793 ?auto_282795 ?auto_282787 ?auto_282788 )
      ( GET-4IMAGE-VERIFY ?auto_282784 ?auto_282785 ?auto_282786 ?auto_282783 ?auto_282787 ?auto_282788 ?auto_282789 ?auto_282790 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282810 - DIRECTION
      ?auto_282811 - MODE
      ?auto_282812 - DIRECTION
      ?auto_282809 - MODE
      ?auto_282813 - DIRECTION
      ?auto_282814 - MODE
      ?auto_282815 - DIRECTION
      ?auto_282816 - MODE
    )
    :vars
    (
      ?auto_282819 - INSTRUMENT
      ?auto_282818 - SATELLITE
      ?auto_282817 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282819 ?auto_282818 ) ( SUPPORTS ?auto_282819 ?auto_282809 ) ( not ( = ?auto_282812 ?auto_282817 ) ) ( HAVE_IMAGE ?auto_282813 ?auto_282816 ) ( not ( = ?auto_282813 ?auto_282812 ) ) ( not ( = ?auto_282813 ?auto_282817 ) ) ( not ( = ?auto_282816 ?auto_282809 ) ) ( CALIBRATION_TARGET ?auto_282819 ?auto_282817 ) ( POWER_AVAIL ?auto_282818 ) ( POINTING ?auto_282818 ?auto_282810 ) ( not ( = ?auto_282817 ?auto_282810 ) ) ( not ( = ?auto_282812 ?auto_282810 ) ) ( not ( = ?auto_282813 ?auto_282810 ) ) ( HAVE_IMAGE ?auto_282810 ?auto_282811 ) ( HAVE_IMAGE ?auto_282813 ?auto_282814 ) ( HAVE_IMAGE ?auto_282815 ?auto_282816 ) ( not ( = ?auto_282810 ?auto_282815 ) ) ( not ( = ?auto_282811 ?auto_282809 ) ) ( not ( = ?auto_282811 ?auto_282814 ) ) ( not ( = ?auto_282811 ?auto_282816 ) ) ( not ( = ?auto_282812 ?auto_282815 ) ) ( not ( = ?auto_282809 ?auto_282814 ) ) ( not ( = ?auto_282813 ?auto_282815 ) ) ( not ( = ?auto_282814 ?auto_282816 ) ) ( not ( = ?auto_282815 ?auto_282817 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282813 ?auto_282816 ?auto_282812 ?auto_282809 )
      ( GET-4IMAGE-VERIFY ?auto_282810 ?auto_282811 ?auto_282812 ?auto_282809 ?auto_282813 ?auto_282814 ?auto_282815 ?auto_282816 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282821 - DIRECTION
      ?auto_282822 - MODE
      ?auto_282823 - DIRECTION
      ?auto_282820 - MODE
      ?auto_282824 - DIRECTION
      ?auto_282825 - MODE
      ?auto_282826 - DIRECTION
      ?auto_282827 - MODE
    )
    :vars
    (
      ?auto_282830 - INSTRUMENT
      ?auto_282829 - SATELLITE
      ?auto_282828 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282830 ?auto_282829 ) ( SUPPORTS ?auto_282830 ?auto_282820 ) ( not ( = ?auto_282823 ?auto_282828 ) ) ( HAVE_IMAGE ?auto_282824 ?auto_282825 ) ( not ( = ?auto_282824 ?auto_282823 ) ) ( not ( = ?auto_282824 ?auto_282828 ) ) ( not ( = ?auto_282825 ?auto_282820 ) ) ( CALIBRATION_TARGET ?auto_282830 ?auto_282828 ) ( POWER_AVAIL ?auto_282829 ) ( POINTING ?auto_282829 ?auto_282821 ) ( not ( = ?auto_282828 ?auto_282821 ) ) ( not ( = ?auto_282823 ?auto_282821 ) ) ( not ( = ?auto_282824 ?auto_282821 ) ) ( HAVE_IMAGE ?auto_282821 ?auto_282822 ) ( HAVE_IMAGE ?auto_282826 ?auto_282827 ) ( not ( = ?auto_282821 ?auto_282826 ) ) ( not ( = ?auto_282822 ?auto_282820 ) ) ( not ( = ?auto_282822 ?auto_282825 ) ) ( not ( = ?auto_282822 ?auto_282827 ) ) ( not ( = ?auto_282823 ?auto_282826 ) ) ( not ( = ?auto_282820 ?auto_282827 ) ) ( not ( = ?auto_282824 ?auto_282826 ) ) ( not ( = ?auto_282825 ?auto_282827 ) ) ( not ( = ?auto_282826 ?auto_282828 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282824 ?auto_282825 ?auto_282823 ?auto_282820 )
      ( GET-4IMAGE-VERIFY ?auto_282821 ?auto_282822 ?auto_282823 ?auto_282820 ?auto_282824 ?auto_282825 ?auto_282826 ?auto_282827 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282843 - DIRECTION
      ?auto_282844 - MODE
      ?auto_282845 - DIRECTION
      ?auto_282842 - MODE
      ?auto_282846 - DIRECTION
      ?auto_282847 - MODE
      ?auto_282848 - DIRECTION
      ?auto_282849 - MODE
    )
    :vars
    (
      ?auto_282852 - INSTRUMENT
      ?auto_282851 - SATELLITE
      ?auto_282850 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282852 ?auto_282851 ) ( SUPPORTS ?auto_282852 ?auto_282842 ) ( not ( = ?auto_282845 ?auto_282850 ) ) ( HAVE_IMAGE ?auto_282848 ?auto_282849 ) ( not ( = ?auto_282848 ?auto_282845 ) ) ( not ( = ?auto_282848 ?auto_282850 ) ) ( not ( = ?auto_282849 ?auto_282842 ) ) ( CALIBRATION_TARGET ?auto_282852 ?auto_282850 ) ( POWER_AVAIL ?auto_282851 ) ( POINTING ?auto_282851 ?auto_282843 ) ( not ( = ?auto_282850 ?auto_282843 ) ) ( not ( = ?auto_282845 ?auto_282843 ) ) ( not ( = ?auto_282848 ?auto_282843 ) ) ( HAVE_IMAGE ?auto_282843 ?auto_282844 ) ( HAVE_IMAGE ?auto_282846 ?auto_282847 ) ( not ( = ?auto_282843 ?auto_282846 ) ) ( not ( = ?auto_282844 ?auto_282842 ) ) ( not ( = ?auto_282844 ?auto_282847 ) ) ( not ( = ?auto_282844 ?auto_282849 ) ) ( not ( = ?auto_282845 ?auto_282846 ) ) ( not ( = ?auto_282842 ?auto_282847 ) ) ( not ( = ?auto_282846 ?auto_282848 ) ) ( not ( = ?auto_282846 ?auto_282850 ) ) ( not ( = ?auto_282847 ?auto_282849 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282848 ?auto_282849 ?auto_282845 ?auto_282842 )
      ( GET-4IMAGE-VERIFY ?auto_282843 ?auto_282844 ?auto_282845 ?auto_282842 ?auto_282846 ?auto_282847 ?auto_282848 ?auto_282849 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282854 - DIRECTION
      ?auto_282855 - MODE
      ?auto_282856 - DIRECTION
      ?auto_282853 - MODE
      ?auto_282857 - DIRECTION
      ?auto_282858 - MODE
      ?auto_282859 - DIRECTION
      ?auto_282860 - MODE
    )
    :vars
    (
      ?auto_282864 - INSTRUMENT
      ?auto_282862 - SATELLITE
      ?auto_282861 - DIRECTION
      ?auto_282863 - DIRECTION
      ?auto_282865 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_282864 ?auto_282862 ) ( SUPPORTS ?auto_282864 ?auto_282853 ) ( not ( = ?auto_282856 ?auto_282861 ) ) ( HAVE_IMAGE ?auto_282863 ?auto_282865 ) ( not ( = ?auto_282863 ?auto_282856 ) ) ( not ( = ?auto_282863 ?auto_282861 ) ) ( not ( = ?auto_282865 ?auto_282853 ) ) ( CALIBRATION_TARGET ?auto_282864 ?auto_282861 ) ( POWER_AVAIL ?auto_282862 ) ( POINTING ?auto_282862 ?auto_282857 ) ( not ( = ?auto_282861 ?auto_282857 ) ) ( not ( = ?auto_282856 ?auto_282857 ) ) ( not ( = ?auto_282863 ?auto_282857 ) ) ( HAVE_IMAGE ?auto_282854 ?auto_282855 ) ( HAVE_IMAGE ?auto_282857 ?auto_282858 ) ( HAVE_IMAGE ?auto_282859 ?auto_282860 ) ( not ( = ?auto_282854 ?auto_282856 ) ) ( not ( = ?auto_282854 ?auto_282857 ) ) ( not ( = ?auto_282854 ?auto_282859 ) ) ( not ( = ?auto_282854 ?auto_282861 ) ) ( not ( = ?auto_282854 ?auto_282863 ) ) ( not ( = ?auto_282855 ?auto_282853 ) ) ( not ( = ?auto_282855 ?auto_282858 ) ) ( not ( = ?auto_282855 ?auto_282860 ) ) ( not ( = ?auto_282855 ?auto_282865 ) ) ( not ( = ?auto_282856 ?auto_282859 ) ) ( not ( = ?auto_282853 ?auto_282858 ) ) ( not ( = ?auto_282853 ?auto_282860 ) ) ( not ( = ?auto_282857 ?auto_282859 ) ) ( not ( = ?auto_282858 ?auto_282860 ) ) ( not ( = ?auto_282858 ?auto_282865 ) ) ( not ( = ?auto_282859 ?auto_282861 ) ) ( not ( = ?auto_282859 ?auto_282863 ) ) ( not ( = ?auto_282860 ?auto_282865 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282863 ?auto_282865 ?auto_282856 ?auto_282853 )
      ( GET-4IMAGE-VERIFY ?auto_282854 ?auto_282855 ?auto_282856 ?auto_282853 ?auto_282857 ?auto_282858 ?auto_282859 ?auto_282860 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282917 - DIRECTION
      ?auto_282918 - MODE
      ?auto_282919 - DIRECTION
      ?auto_282916 - MODE
      ?auto_282920 - DIRECTION
      ?auto_282921 - MODE
      ?auto_282922 - DIRECTION
      ?auto_282923 - MODE
    )
    :vars
    (
      ?auto_282927 - INSTRUMENT
      ?auto_282925 - SATELLITE
      ?auto_282924 - DIRECTION
      ?auto_282926 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282927 ?auto_282925 ) ( SUPPORTS ?auto_282927 ?auto_282918 ) ( not ( = ?auto_282917 ?auto_282924 ) ) ( HAVE_IMAGE ?auto_282919 ?auto_282923 ) ( not ( = ?auto_282919 ?auto_282917 ) ) ( not ( = ?auto_282919 ?auto_282924 ) ) ( not ( = ?auto_282923 ?auto_282918 ) ) ( CALIBRATION_TARGET ?auto_282927 ?auto_282924 ) ( POWER_AVAIL ?auto_282925 ) ( POINTING ?auto_282925 ?auto_282926 ) ( not ( = ?auto_282924 ?auto_282926 ) ) ( not ( = ?auto_282917 ?auto_282926 ) ) ( not ( = ?auto_282919 ?auto_282926 ) ) ( HAVE_IMAGE ?auto_282919 ?auto_282916 ) ( HAVE_IMAGE ?auto_282920 ?auto_282921 ) ( HAVE_IMAGE ?auto_282922 ?auto_282923 ) ( not ( = ?auto_282917 ?auto_282920 ) ) ( not ( = ?auto_282917 ?auto_282922 ) ) ( not ( = ?auto_282918 ?auto_282916 ) ) ( not ( = ?auto_282918 ?auto_282921 ) ) ( not ( = ?auto_282919 ?auto_282920 ) ) ( not ( = ?auto_282919 ?auto_282922 ) ) ( not ( = ?auto_282916 ?auto_282921 ) ) ( not ( = ?auto_282916 ?auto_282923 ) ) ( not ( = ?auto_282920 ?auto_282922 ) ) ( not ( = ?auto_282920 ?auto_282924 ) ) ( not ( = ?auto_282920 ?auto_282926 ) ) ( not ( = ?auto_282921 ?auto_282923 ) ) ( not ( = ?auto_282922 ?auto_282924 ) ) ( not ( = ?auto_282922 ?auto_282926 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282919 ?auto_282923 ?auto_282917 ?auto_282918 )
      ( GET-4IMAGE-VERIFY ?auto_282917 ?auto_282918 ?auto_282919 ?auto_282916 ?auto_282920 ?auto_282921 ?auto_282922 ?auto_282923 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282929 - DIRECTION
      ?auto_282930 - MODE
      ?auto_282931 - DIRECTION
      ?auto_282928 - MODE
      ?auto_282932 - DIRECTION
      ?auto_282933 - MODE
      ?auto_282934 - DIRECTION
      ?auto_282935 - MODE
    )
    :vars
    (
      ?auto_282938 - INSTRUMENT
      ?auto_282937 - SATELLITE
      ?auto_282936 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282938 ?auto_282937 ) ( SUPPORTS ?auto_282938 ?auto_282930 ) ( not ( = ?auto_282929 ?auto_282936 ) ) ( HAVE_IMAGE ?auto_282932 ?auto_282933 ) ( not ( = ?auto_282932 ?auto_282929 ) ) ( not ( = ?auto_282932 ?auto_282936 ) ) ( not ( = ?auto_282933 ?auto_282930 ) ) ( CALIBRATION_TARGET ?auto_282938 ?auto_282936 ) ( POWER_AVAIL ?auto_282937 ) ( POINTING ?auto_282937 ?auto_282934 ) ( not ( = ?auto_282936 ?auto_282934 ) ) ( not ( = ?auto_282929 ?auto_282934 ) ) ( not ( = ?auto_282932 ?auto_282934 ) ) ( HAVE_IMAGE ?auto_282931 ?auto_282928 ) ( HAVE_IMAGE ?auto_282934 ?auto_282935 ) ( not ( = ?auto_282929 ?auto_282931 ) ) ( not ( = ?auto_282930 ?auto_282928 ) ) ( not ( = ?auto_282930 ?auto_282935 ) ) ( not ( = ?auto_282931 ?auto_282932 ) ) ( not ( = ?auto_282931 ?auto_282934 ) ) ( not ( = ?auto_282931 ?auto_282936 ) ) ( not ( = ?auto_282928 ?auto_282933 ) ) ( not ( = ?auto_282928 ?auto_282935 ) ) ( not ( = ?auto_282933 ?auto_282935 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282932 ?auto_282933 ?auto_282929 ?auto_282930 )
      ( GET-4IMAGE-VERIFY ?auto_282929 ?auto_282930 ?auto_282931 ?auto_282928 ?auto_282932 ?auto_282933 ?auto_282934 ?auto_282935 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282952 - DIRECTION
      ?auto_282953 - MODE
      ?auto_282954 - DIRECTION
      ?auto_282951 - MODE
      ?auto_282955 - DIRECTION
      ?auto_282956 - MODE
      ?auto_282957 - DIRECTION
      ?auto_282958 - MODE
    )
    :vars
    (
      ?auto_282961 - INSTRUMENT
      ?auto_282960 - SATELLITE
      ?auto_282959 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282961 ?auto_282960 ) ( SUPPORTS ?auto_282961 ?auto_282953 ) ( not ( = ?auto_282952 ?auto_282959 ) ) ( HAVE_IMAGE ?auto_282957 ?auto_282958 ) ( not ( = ?auto_282957 ?auto_282952 ) ) ( not ( = ?auto_282957 ?auto_282959 ) ) ( not ( = ?auto_282958 ?auto_282953 ) ) ( CALIBRATION_TARGET ?auto_282961 ?auto_282959 ) ( POWER_AVAIL ?auto_282960 ) ( POINTING ?auto_282960 ?auto_282955 ) ( not ( = ?auto_282959 ?auto_282955 ) ) ( not ( = ?auto_282952 ?auto_282955 ) ) ( not ( = ?auto_282957 ?auto_282955 ) ) ( HAVE_IMAGE ?auto_282954 ?auto_282951 ) ( HAVE_IMAGE ?auto_282955 ?auto_282956 ) ( not ( = ?auto_282952 ?auto_282954 ) ) ( not ( = ?auto_282953 ?auto_282951 ) ) ( not ( = ?auto_282953 ?auto_282956 ) ) ( not ( = ?auto_282954 ?auto_282955 ) ) ( not ( = ?auto_282954 ?auto_282957 ) ) ( not ( = ?auto_282954 ?auto_282959 ) ) ( not ( = ?auto_282951 ?auto_282956 ) ) ( not ( = ?auto_282951 ?auto_282958 ) ) ( not ( = ?auto_282956 ?auto_282958 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282957 ?auto_282958 ?auto_282952 ?auto_282953 )
      ( GET-4IMAGE-VERIFY ?auto_282952 ?auto_282953 ?auto_282954 ?auto_282951 ?auto_282955 ?auto_282956 ?auto_282957 ?auto_282958 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_282963 - DIRECTION
      ?auto_282964 - MODE
      ?auto_282965 - DIRECTION
      ?auto_282962 - MODE
      ?auto_282966 - DIRECTION
      ?auto_282967 - MODE
      ?auto_282968 - DIRECTION
      ?auto_282969 - MODE
    )
    :vars
    (
      ?auto_282972 - INSTRUMENT
      ?auto_282971 - SATELLITE
      ?auto_282970 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282972 ?auto_282971 ) ( SUPPORTS ?auto_282972 ?auto_282964 ) ( not ( = ?auto_282963 ?auto_282970 ) ) ( HAVE_IMAGE ?auto_282965 ?auto_282962 ) ( not ( = ?auto_282965 ?auto_282963 ) ) ( not ( = ?auto_282965 ?auto_282970 ) ) ( not ( = ?auto_282962 ?auto_282964 ) ) ( CALIBRATION_TARGET ?auto_282972 ?auto_282970 ) ( POWER_AVAIL ?auto_282971 ) ( POINTING ?auto_282971 ?auto_282966 ) ( not ( = ?auto_282970 ?auto_282966 ) ) ( not ( = ?auto_282963 ?auto_282966 ) ) ( not ( = ?auto_282965 ?auto_282966 ) ) ( HAVE_IMAGE ?auto_282966 ?auto_282967 ) ( HAVE_IMAGE ?auto_282968 ?auto_282969 ) ( not ( = ?auto_282963 ?auto_282968 ) ) ( not ( = ?auto_282964 ?auto_282967 ) ) ( not ( = ?auto_282964 ?auto_282969 ) ) ( not ( = ?auto_282965 ?auto_282968 ) ) ( not ( = ?auto_282962 ?auto_282967 ) ) ( not ( = ?auto_282962 ?auto_282969 ) ) ( not ( = ?auto_282966 ?auto_282968 ) ) ( not ( = ?auto_282967 ?auto_282969 ) ) ( not ( = ?auto_282968 ?auto_282970 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282965 ?auto_282962 ?auto_282963 ?auto_282964 )
      ( GET-4IMAGE-VERIFY ?auto_282963 ?auto_282964 ?auto_282965 ?auto_282962 ?auto_282966 ?auto_282967 ?auto_282968 ?auto_282969 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283020 - DIRECTION
      ?auto_283021 - MODE
      ?auto_283022 - DIRECTION
      ?auto_283019 - MODE
      ?auto_283023 - DIRECTION
      ?auto_283024 - MODE
      ?auto_283025 - DIRECTION
      ?auto_283026 - MODE
    )
    :vars
    (
      ?auto_283029 - INSTRUMENT
      ?auto_283028 - SATELLITE
      ?auto_283027 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_283029 ?auto_283028 ) ( SUPPORTS ?auto_283029 ?auto_283021 ) ( not ( = ?auto_283020 ?auto_283027 ) ) ( HAVE_IMAGE ?auto_283023 ?auto_283026 ) ( not ( = ?auto_283023 ?auto_283020 ) ) ( not ( = ?auto_283023 ?auto_283027 ) ) ( not ( = ?auto_283026 ?auto_283021 ) ) ( CALIBRATION_TARGET ?auto_283029 ?auto_283027 ) ( POWER_AVAIL ?auto_283028 ) ( POINTING ?auto_283028 ?auto_283022 ) ( not ( = ?auto_283027 ?auto_283022 ) ) ( not ( = ?auto_283020 ?auto_283022 ) ) ( not ( = ?auto_283023 ?auto_283022 ) ) ( HAVE_IMAGE ?auto_283022 ?auto_283019 ) ( HAVE_IMAGE ?auto_283023 ?auto_283024 ) ( HAVE_IMAGE ?auto_283025 ?auto_283026 ) ( not ( = ?auto_283020 ?auto_283025 ) ) ( not ( = ?auto_283021 ?auto_283019 ) ) ( not ( = ?auto_283021 ?auto_283024 ) ) ( not ( = ?auto_283022 ?auto_283025 ) ) ( not ( = ?auto_283019 ?auto_283024 ) ) ( not ( = ?auto_283019 ?auto_283026 ) ) ( not ( = ?auto_283023 ?auto_283025 ) ) ( not ( = ?auto_283024 ?auto_283026 ) ) ( not ( = ?auto_283025 ?auto_283027 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283023 ?auto_283026 ?auto_283020 ?auto_283021 )
      ( GET-4IMAGE-VERIFY ?auto_283020 ?auto_283021 ?auto_283022 ?auto_283019 ?auto_283023 ?auto_283024 ?auto_283025 ?auto_283026 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283031 - DIRECTION
      ?auto_283032 - MODE
      ?auto_283033 - DIRECTION
      ?auto_283030 - MODE
      ?auto_283034 - DIRECTION
      ?auto_283035 - MODE
      ?auto_283036 - DIRECTION
      ?auto_283037 - MODE
    )
    :vars
    (
      ?auto_283040 - INSTRUMENT
      ?auto_283039 - SATELLITE
      ?auto_283038 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_283040 ?auto_283039 ) ( SUPPORTS ?auto_283040 ?auto_283032 ) ( not ( = ?auto_283031 ?auto_283038 ) ) ( HAVE_IMAGE ?auto_283034 ?auto_283035 ) ( not ( = ?auto_283034 ?auto_283031 ) ) ( not ( = ?auto_283034 ?auto_283038 ) ) ( not ( = ?auto_283035 ?auto_283032 ) ) ( CALIBRATION_TARGET ?auto_283040 ?auto_283038 ) ( POWER_AVAIL ?auto_283039 ) ( POINTING ?auto_283039 ?auto_283033 ) ( not ( = ?auto_283038 ?auto_283033 ) ) ( not ( = ?auto_283031 ?auto_283033 ) ) ( not ( = ?auto_283034 ?auto_283033 ) ) ( HAVE_IMAGE ?auto_283033 ?auto_283030 ) ( HAVE_IMAGE ?auto_283036 ?auto_283037 ) ( not ( = ?auto_283031 ?auto_283036 ) ) ( not ( = ?auto_283032 ?auto_283030 ) ) ( not ( = ?auto_283032 ?auto_283037 ) ) ( not ( = ?auto_283033 ?auto_283036 ) ) ( not ( = ?auto_283030 ?auto_283035 ) ) ( not ( = ?auto_283030 ?auto_283037 ) ) ( not ( = ?auto_283034 ?auto_283036 ) ) ( not ( = ?auto_283035 ?auto_283037 ) ) ( not ( = ?auto_283036 ?auto_283038 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283034 ?auto_283035 ?auto_283031 ?auto_283032 )
      ( GET-4IMAGE-VERIFY ?auto_283031 ?auto_283032 ?auto_283033 ?auto_283030 ?auto_283034 ?auto_283035 ?auto_283036 ?auto_283037 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283064 - DIRECTION
      ?auto_283065 - MODE
      ?auto_283066 - DIRECTION
      ?auto_283063 - MODE
      ?auto_283067 - DIRECTION
      ?auto_283068 - MODE
      ?auto_283069 - DIRECTION
      ?auto_283070 - MODE
    )
    :vars
    (
      ?auto_283074 - INSTRUMENT
      ?auto_283072 - SATELLITE
      ?auto_283071 - DIRECTION
      ?auto_283073 - DIRECTION
      ?auto_283075 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_283074 ?auto_283072 ) ( SUPPORTS ?auto_283074 ?auto_283065 ) ( not ( = ?auto_283064 ?auto_283071 ) ) ( HAVE_IMAGE ?auto_283073 ?auto_283075 ) ( not ( = ?auto_283073 ?auto_283064 ) ) ( not ( = ?auto_283073 ?auto_283071 ) ) ( not ( = ?auto_283075 ?auto_283065 ) ) ( CALIBRATION_TARGET ?auto_283074 ?auto_283071 ) ( POWER_AVAIL ?auto_283072 ) ( POINTING ?auto_283072 ?auto_283066 ) ( not ( = ?auto_283071 ?auto_283066 ) ) ( not ( = ?auto_283064 ?auto_283066 ) ) ( not ( = ?auto_283073 ?auto_283066 ) ) ( HAVE_IMAGE ?auto_283066 ?auto_283063 ) ( HAVE_IMAGE ?auto_283067 ?auto_283068 ) ( HAVE_IMAGE ?auto_283069 ?auto_283070 ) ( not ( = ?auto_283064 ?auto_283067 ) ) ( not ( = ?auto_283064 ?auto_283069 ) ) ( not ( = ?auto_283065 ?auto_283063 ) ) ( not ( = ?auto_283065 ?auto_283068 ) ) ( not ( = ?auto_283065 ?auto_283070 ) ) ( not ( = ?auto_283066 ?auto_283067 ) ) ( not ( = ?auto_283066 ?auto_283069 ) ) ( not ( = ?auto_283063 ?auto_283068 ) ) ( not ( = ?auto_283063 ?auto_283070 ) ) ( not ( = ?auto_283063 ?auto_283075 ) ) ( not ( = ?auto_283067 ?auto_283069 ) ) ( not ( = ?auto_283067 ?auto_283071 ) ) ( not ( = ?auto_283067 ?auto_283073 ) ) ( not ( = ?auto_283068 ?auto_283070 ) ) ( not ( = ?auto_283068 ?auto_283075 ) ) ( not ( = ?auto_283069 ?auto_283071 ) ) ( not ( = ?auto_283069 ?auto_283073 ) ) ( not ( = ?auto_283070 ?auto_283075 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283073 ?auto_283075 ?auto_283064 ?auto_283065 )
      ( GET-4IMAGE-VERIFY ?auto_283064 ?auto_283065 ?auto_283066 ?auto_283063 ?auto_283067 ?auto_283068 ?auto_283069 ?auto_283070 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_283237 - DIRECTION
      ?auto_283238 - MODE
    )
    :vars
    (
      ?auto_283243 - INSTRUMENT
      ?auto_283240 - SATELLITE
      ?auto_283239 - DIRECTION
      ?auto_283242 - DIRECTION
      ?auto_283244 - MODE
      ?auto_283241 - DIRECTION
      ?auto_283245 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283243 ?auto_283240 ) ( SUPPORTS ?auto_283243 ?auto_283238 ) ( not ( = ?auto_283237 ?auto_283239 ) ) ( HAVE_IMAGE ?auto_283242 ?auto_283244 ) ( not ( = ?auto_283242 ?auto_283237 ) ) ( not ( = ?auto_283242 ?auto_283239 ) ) ( not ( = ?auto_283244 ?auto_283238 ) ) ( CALIBRATION_TARGET ?auto_283243 ?auto_283239 ) ( POINTING ?auto_283240 ?auto_283241 ) ( not ( = ?auto_283239 ?auto_283241 ) ) ( not ( = ?auto_283237 ?auto_283241 ) ) ( not ( = ?auto_283242 ?auto_283241 ) ) ( ON_BOARD ?auto_283245 ?auto_283240 ) ( POWER_ON ?auto_283245 ) ( not ( = ?auto_283243 ?auto_283245 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_283245 ?auto_283240 )
      ( GET-2IMAGE ?auto_283242 ?auto_283244 ?auto_283237 ?auto_283238 )
      ( GET-1IMAGE-VERIFY ?auto_283237 ?auto_283238 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_283247 - DIRECTION
      ?auto_283248 - MODE
      ?auto_283249 - DIRECTION
      ?auto_283246 - MODE
    )
    :vars
    (
      ?auto_283253 - INSTRUMENT
      ?auto_283250 - SATELLITE
      ?auto_283251 - DIRECTION
      ?auto_283252 - DIRECTION
      ?auto_283254 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283253 ?auto_283250 ) ( SUPPORTS ?auto_283253 ?auto_283246 ) ( not ( = ?auto_283249 ?auto_283251 ) ) ( HAVE_IMAGE ?auto_283247 ?auto_283248 ) ( not ( = ?auto_283247 ?auto_283249 ) ) ( not ( = ?auto_283247 ?auto_283251 ) ) ( not ( = ?auto_283248 ?auto_283246 ) ) ( CALIBRATION_TARGET ?auto_283253 ?auto_283251 ) ( POINTING ?auto_283250 ?auto_283252 ) ( not ( = ?auto_283251 ?auto_283252 ) ) ( not ( = ?auto_283249 ?auto_283252 ) ) ( not ( = ?auto_283247 ?auto_283252 ) ) ( ON_BOARD ?auto_283254 ?auto_283250 ) ( POWER_ON ?auto_283254 ) ( not ( = ?auto_283253 ?auto_283254 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_283249 ?auto_283246 )
      ( GET-2IMAGE-VERIFY ?auto_283247 ?auto_283248 ?auto_283249 ?auto_283246 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_283256 - DIRECTION
      ?auto_283257 - MODE
      ?auto_283258 - DIRECTION
      ?auto_283255 - MODE
    )
    :vars
    (
      ?auto_283260 - INSTRUMENT
      ?auto_283262 - SATELLITE
      ?auto_283264 - DIRECTION
      ?auto_283259 - DIRECTION
      ?auto_283263 - MODE
      ?auto_283261 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283260 ?auto_283262 ) ( SUPPORTS ?auto_283260 ?auto_283255 ) ( not ( = ?auto_283258 ?auto_283264 ) ) ( HAVE_IMAGE ?auto_283259 ?auto_283263 ) ( not ( = ?auto_283259 ?auto_283258 ) ) ( not ( = ?auto_283259 ?auto_283264 ) ) ( not ( = ?auto_283263 ?auto_283255 ) ) ( CALIBRATION_TARGET ?auto_283260 ?auto_283264 ) ( POINTING ?auto_283262 ?auto_283256 ) ( not ( = ?auto_283264 ?auto_283256 ) ) ( not ( = ?auto_283258 ?auto_283256 ) ) ( not ( = ?auto_283259 ?auto_283256 ) ) ( ON_BOARD ?auto_283261 ?auto_283262 ) ( POWER_ON ?auto_283261 ) ( not ( = ?auto_283260 ?auto_283261 ) ) ( HAVE_IMAGE ?auto_283256 ?auto_283257 ) ( not ( = ?auto_283257 ?auto_283255 ) ) ( not ( = ?auto_283257 ?auto_283263 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283259 ?auto_283263 ?auto_283258 ?auto_283255 )
      ( GET-2IMAGE-VERIFY ?auto_283256 ?auto_283257 ?auto_283258 ?auto_283255 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_283266 - DIRECTION
      ?auto_283267 - MODE
      ?auto_283268 - DIRECTION
      ?auto_283265 - MODE
    )
    :vars
    (
      ?auto_283269 - INSTRUMENT
      ?auto_283271 - SATELLITE
      ?auto_283273 - DIRECTION
      ?auto_283272 - DIRECTION
      ?auto_283270 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283269 ?auto_283271 ) ( SUPPORTS ?auto_283269 ?auto_283267 ) ( not ( = ?auto_283266 ?auto_283273 ) ) ( HAVE_IMAGE ?auto_283268 ?auto_283265 ) ( not ( = ?auto_283268 ?auto_283266 ) ) ( not ( = ?auto_283268 ?auto_283273 ) ) ( not ( = ?auto_283265 ?auto_283267 ) ) ( CALIBRATION_TARGET ?auto_283269 ?auto_283273 ) ( POINTING ?auto_283271 ?auto_283272 ) ( not ( = ?auto_283273 ?auto_283272 ) ) ( not ( = ?auto_283266 ?auto_283272 ) ) ( not ( = ?auto_283268 ?auto_283272 ) ) ( ON_BOARD ?auto_283270 ?auto_283271 ) ( POWER_ON ?auto_283270 ) ( not ( = ?auto_283269 ?auto_283270 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283268 ?auto_283265 ?auto_283266 ?auto_283267 )
      ( GET-2IMAGE-VERIFY ?auto_283266 ?auto_283267 ?auto_283268 ?auto_283265 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_283275 - DIRECTION
      ?auto_283276 - MODE
      ?auto_283277 - DIRECTION
      ?auto_283274 - MODE
    )
    :vars
    (
      ?auto_283279 - INSTRUMENT
      ?auto_283281 - SATELLITE
      ?auto_283283 - DIRECTION
      ?auto_283278 - DIRECTION
      ?auto_283282 - MODE
      ?auto_283280 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283279 ?auto_283281 ) ( SUPPORTS ?auto_283279 ?auto_283276 ) ( not ( = ?auto_283275 ?auto_283283 ) ) ( HAVE_IMAGE ?auto_283278 ?auto_283282 ) ( not ( = ?auto_283278 ?auto_283275 ) ) ( not ( = ?auto_283278 ?auto_283283 ) ) ( not ( = ?auto_283282 ?auto_283276 ) ) ( CALIBRATION_TARGET ?auto_283279 ?auto_283283 ) ( POINTING ?auto_283281 ?auto_283277 ) ( not ( = ?auto_283283 ?auto_283277 ) ) ( not ( = ?auto_283275 ?auto_283277 ) ) ( not ( = ?auto_283278 ?auto_283277 ) ) ( ON_BOARD ?auto_283280 ?auto_283281 ) ( POWER_ON ?auto_283280 ) ( not ( = ?auto_283279 ?auto_283280 ) ) ( HAVE_IMAGE ?auto_283277 ?auto_283274 ) ( not ( = ?auto_283276 ?auto_283274 ) ) ( not ( = ?auto_283274 ?auto_283282 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283278 ?auto_283282 ?auto_283275 ?auto_283276 )
      ( GET-2IMAGE-VERIFY ?auto_283275 ?auto_283276 ?auto_283277 ?auto_283274 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283296 - DIRECTION
      ?auto_283297 - MODE
      ?auto_283298 - DIRECTION
      ?auto_283295 - MODE
      ?auto_283299 - DIRECTION
      ?auto_283300 - MODE
    )
    :vars
    (
      ?auto_283301 - INSTRUMENT
      ?auto_283303 - SATELLITE
      ?auto_283305 - DIRECTION
      ?auto_283304 - DIRECTION
      ?auto_283302 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283301 ?auto_283303 ) ( SUPPORTS ?auto_283301 ?auto_283300 ) ( not ( = ?auto_283299 ?auto_283305 ) ) ( HAVE_IMAGE ?auto_283296 ?auto_283295 ) ( not ( = ?auto_283296 ?auto_283299 ) ) ( not ( = ?auto_283296 ?auto_283305 ) ) ( not ( = ?auto_283295 ?auto_283300 ) ) ( CALIBRATION_TARGET ?auto_283301 ?auto_283305 ) ( POINTING ?auto_283303 ?auto_283304 ) ( not ( = ?auto_283305 ?auto_283304 ) ) ( not ( = ?auto_283299 ?auto_283304 ) ) ( not ( = ?auto_283296 ?auto_283304 ) ) ( ON_BOARD ?auto_283302 ?auto_283303 ) ( POWER_ON ?auto_283302 ) ( not ( = ?auto_283301 ?auto_283302 ) ) ( HAVE_IMAGE ?auto_283296 ?auto_283297 ) ( HAVE_IMAGE ?auto_283298 ?auto_283295 ) ( not ( = ?auto_283296 ?auto_283298 ) ) ( not ( = ?auto_283297 ?auto_283295 ) ) ( not ( = ?auto_283297 ?auto_283300 ) ) ( not ( = ?auto_283298 ?auto_283299 ) ) ( not ( = ?auto_283298 ?auto_283305 ) ) ( not ( = ?auto_283298 ?auto_283304 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283296 ?auto_283295 ?auto_283299 ?auto_283300 )
      ( GET-3IMAGE-VERIFY ?auto_283296 ?auto_283297 ?auto_283298 ?auto_283295 ?auto_283299 ?auto_283300 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283307 - DIRECTION
      ?auto_283308 - MODE
      ?auto_283309 - DIRECTION
      ?auto_283306 - MODE
      ?auto_283310 - DIRECTION
      ?auto_283311 - MODE
    )
    :vars
    (
      ?auto_283312 - INSTRUMENT
      ?auto_283314 - SATELLITE
      ?auto_283315 - DIRECTION
      ?auto_283313 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283312 ?auto_283314 ) ( SUPPORTS ?auto_283312 ?auto_283311 ) ( not ( = ?auto_283310 ?auto_283315 ) ) ( HAVE_IMAGE ?auto_283307 ?auto_283308 ) ( not ( = ?auto_283307 ?auto_283310 ) ) ( not ( = ?auto_283307 ?auto_283315 ) ) ( not ( = ?auto_283308 ?auto_283311 ) ) ( CALIBRATION_TARGET ?auto_283312 ?auto_283315 ) ( POINTING ?auto_283314 ?auto_283309 ) ( not ( = ?auto_283315 ?auto_283309 ) ) ( not ( = ?auto_283310 ?auto_283309 ) ) ( not ( = ?auto_283307 ?auto_283309 ) ) ( ON_BOARD ?auto_283313 ?auto_283314 ) ( POWER_ON ?auto_283313 ) ( not ( = ?auto_283312 ?auto_283313 ) ) ( HAVE_IMAGE ?auto_283309 ?auto_283306 ) ( not ( = ?auto_283308 ?auto_283306 ) ) ( not ( = ?auto_283306 ?auto_283311 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283307 ?auto_283308 ?auto_283310 ?auto_283311 )
      ( GET-3IMAGE-VERIFY ?auto_283307 ?auto_283308 ?auto_283309 ?auto_283306 ?auto_283310 ?auto_283311 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283317 - DIRECTION
      ?auto_283318 - MODE
      ?auto_283319 - DIRECTION
      ?auto_283316 - MODE
      ?auto_283320 - DIRECTION
      ?auto_283321 - MODE
    )
    :vars
    (
      ?auto_283322 - INSTRUMENT
      ?auto_283324 - SATELLITE
      ?auto_283326 - DIRECTION
      ?auto_283325 - DIRECTION
      ?auto_283323 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283322 ?auto_283324 ) ( SUPPORTS ?auto_283322 ?auto_283316 ) ( not ( = ?auto_283319 ?auto_283326 ) ) ( HAVE_IMAGE ?auto_283320 ?auto_283321 ) ( not ( = ?auto_283320 ?auto_283319 ) ) ( not ( = ?auto_283320 ?auto_283326 ) ) ( not ( = ?auto_283321 ?auto_283316 ) ) ( CALIBRATION_TARGET ?auto_283322 ?auto_283326 ) ( POINTING ?auto_283324 ?auto_283325 ) ( not ( = ?auto_283326 ?auto_283325 ) ) ( not ( = ?auto_283319 ?auto_283325 ) ) ( not ( = ?auto_283320 ?auto_283325 ) ) ( ON_BOARD ?auto_283323 ?auto_283324 ) ( POWER_ON ?auto_283323 ) ( not ( = ?auto_283322 ?auto_283323 ) ) ( HAVE_IMAGE ?auto_283317 ?auto_283318 ) ( not ( = ?auto_283317 ?auto_283319 ) ) ( not ( = ?auto_283317 ?auto_283320 ) ) ( not ( = ?auto_283317 ?auto_283326 ) ) ( not ( = ?auto_283317 ?auto_283325 ) ) ( not ( = ?auto_283318 ?auto_283316 ) ) ( not ( = ?auto_283318 ?auto_283321 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283320 ?auto_283321 ?auto_283319 ?auto_283316 )
      ( GET-3IMAGE-VERIFY ?auto_283317 ?auto_283318 ?auto_283319 ?auto_283316 ?auto_283320 ?auto_283321 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283328 - DIRECTION
      ?auto_283329 - MODE
      ?auto_283330 - DIRECTION
      ?auto_283327 - MODE
      ?auto_283331 - DIRECTION
      ?auto_283332 - MODE
    )
    :vars
    (
      ?auto_283333 - INSTRUMENT
      ?auto_283335 - SATELLITE
      ?auto_283336 - DIRECTION
      ?auto_283334 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283333 ?auto_283335 ) ( SUPPORTS ?auto_283333 ?auto_283327 ) ( not ( = ?auto_283330 ?auto_283336 ) ) ( HAVE_IMAGE ?auto_283328 ?auto_283329 ) ( not ( = ?auto_283328 ?auto_283330 ) ) ( not ( = ?auto_283328 ?auto_283336 ) ) ( not ( = ?auto_283329 ?auto_283327 ) ) ( CALIBRATION_TARGET ?auto_283333 ?auto_283336 ) ( POINTING ?auto_283335 ?auto_283331 ) ( not ( = ?auto_283336 ?auto_283331 ) ) ( not ( = ?auto_283330 ?auto_283331 ) ) ( not ( = ?auto_283328 ?auto_283331 ) ) ( ON_BOARD ?auto_283334 ?auto_283335 ) ( POWER_ON ?auto_283334 ) ( not ( = ?auto_283333 ?auto_283334 ) ) ( HAVE_IMAGE ?auto_283331 ?auto_283332 ) ( not ( = ?auto_283329 ?auto_283332 ) ) ( not ( = ?auto_283327 ?auto_283332 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283328 ?auto_283329 ?auto_283330 ?auto_283327 )
      ( GET-3IMAGE-VERIFY ?auto_283328 ?auto_283329 ?auto_283330 ?auto_283327 ?auto_283331 ?auto_283332 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283349 - DIRECTION
      ?auto_283350 - MODE
      ?auto_283351 - DIRECTION
      ?auto_283348 - MODE
      ?auto_283352 - DIRECTION
      ?auto_283353 - MODE
    )
    :vars
    (
      ?auto_283354 - INSTRUMENT
      ?auto_283356 - SATELLITE
      ?auto_283357 - DIRECTION
      ?auto_283355 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283354 ?auto_283356 ) ( SUPPORTS ?auto_283354 ?auto_283353 ) ( not ( = ?auto_283352 ?auto_283357 ) ) ( HAVE_IMAGE ?auto_283351 ?auto_283348 ) ( not ( = ?auto_283351 ?auto_283352 ) ) ( not ( = ?auto_283351 ?auto_283357 ) ) ( not ( = ?auto_283348 ?auto_283353 ) ) ( CALIBRATION_TARGET ?auto_283354 ?auto_283357 ) ( POINTING ?auto_283356 ?auto_283349 ) ( not ( = ?auto_283357 ?auto_283349 ) ) ( not ( = ?auto_283352 ?auto_283349 ) ) ( not ( = ?auto_283351 ?auto_283349 ) ) ( ON_BOARD ?auto_283355 ?auto_283356 ) ( POWER_ON ?auto_283355 ) ( not ( = ?auto_283354 ?auto_283355 ) ) ( HAVE_IMAGE ?auto_283349 ?auto_283350 ) ( not ( = ?auto_283350 ?auto_283348 ) ) ( not ( = ?auto_283350 ?auto_283353 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283351 ?auto_283348 ?auto_283352 ?auto_283353 )
      ( GET-3IMAGE-VERIFY ?auto_283349 ?auto_283350 ?auto_283351 ?auto_283348 ?auto_283352 ?auto_283353 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283359 - DIRECTION
      ?auto_283360 - MODE
      ?auto_283361 - DIRECTION
      ?auto_283358 - MODE
      ?auto_283362 - DIRECTION
      ?auto_283363 - MODE
    )
    :vars
    (
      ?auto_283365 - INSTRUMENT
      ?auto_283367 - SATELLITE
      ?auto_283369 - DIRECTION
      ?auto_283364 - DIRECTION
      ?auto_283368 - MODE
      ?auto_283366 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283365 ?auto_283367 ) ( SUPPORTS ?auto_283365 ?auto_283363 ) ( not ( = ?auto_283362 ?auto_283369 ) ) ( HAVE_IMAGE ?auto_283364 ?auto_283368 ) ( not ( = ?auto_283364 ?auto_283362 ) ) ( not ( = ?auto_283364 ?auto_283369 ) ) ( not ( = ?auto_283368 ?auto_283363 ) ) ( CALIBRATION_TARGET ?auto_283365 ?auto_283369 ) ( POINTING ?auto_283367 ?auto_283361 ) ( not ( = ?auto_283369 ?auto_283361 ) ) ( not ( = ?auto_283362 ?auto_283361 ) ) ( not ( = ?auto_283364 ?auto_283361 ) ) ( ON_BOARD ?auto_283366 ?auto_283367 ) ( POWER_ON ?auto_283366 ) ( not ( = ?auto_283365 ?auto_283366 ) ) ( HAVE_IMAGE ?auto_283359 ?auto_283360 ) ( HAVE_IMAGE ?auto_283361 ?auto_283358 ) ( not ( = ?auto_283359 ?auto_283361 ) ) ( not ( = ?auto_283359 ?auto_283362 ) ) ( not ( = ?auto_283359 ?auto_283369 ) ) ( not ( = ?auto_283359 ?auto_283364 ) ) ( not ( = ?auto_283360 ?auto_283358 ) ) ( not ( = ?auto_283360 ?auto_283363 ) ) ( not ( = ?auto_283360 ?auto_283368 ) ) ( not ( = ?auto_283358 ?auto_283363 ) ) ( not ( = ?auto_283358 ?auto_283368 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283364 ?auto_283368 ?auto_283362 ?auto_283363 )
      ( GET-3IMAGE-VERIFY ?auto_283359 ?auto_283360 ?auto_283361 ?auto_283358 ?auto_283362 ?auto_283363 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283371 - DIRECTION
      ?auto_283372 - MODE
      ?auto_283373 - DIRECTION
      ?auto_283370 - MODE
      ?auto_283374 - DIRECTION
      ?auto_283375 - MODE
    )
    :vars
    (
      ?auto_283376 - INSTRUMENT
      ?auto_283378 - SATELLITE
      ?auto_283379 - DIRECTION
      ?auto_283377 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283376 ?auto_283378 ) ( SUPPORTS ?auto_283376 ?auto_283370 ) ( not ( = ?auto_283373 ?auto_283379 ) ) ( HAVE_IMAGE ?auto_283374 ?auto_283375 ) ( not ( = ?auto_283374 ?auto_283373 ) ) ( not ( = ?auto_283374 ?auto_283379 ) ) ( not ( = ?auto_283375 ?auto_283370 ) ) ( CALIBRATION_TARGET ?auto_283376 ?auto_283379 ) ( POINTING ?auto_283378 ?auto_283371 ) ( not ( = ?auto_283379 ?auto_283371 ) ) ( not ( = ?auto_283373 ?auto_283371 ) ) ( not ( = ?auto_283374 ?auto_283371 ) ) ( ON_BOARD ?auto_283377 ?auto_283378 ) ( POWER_ON ?auto_283377 ) ( not ( = ?auto_283376 ?auto_283377 ) ) ( HAVE_IMAGE ?auto_283371 ?auto_283372 ) ( not ( = ?auto_283372 ?auto_283370 ) ) ( not ( = ?auto_283372 ?auto_283375 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283374 ?auto_283375 ?auto_283373 ?auto_283370 )
      ( GET-3IMAGE-VERIFY ?auto_283371 ?auto_283372 ?auto_283373 ?auto_283370 ?auto_283374 ?auto_283375 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283381 - DIRECTION
      ?auto_283382 - MODE
      ?auto_283383 - DIRECTION
      ?auto_283380 - MODE
      ?auto_283384 - DIRECTION
      ?auto_283385 - MODE
    )
    :vars
    (
      ?auto_283387 - INSTRUMENT
      ?auto_283389 - SATELLITE
      ?auto_283391 - DIRECTION
      ?auto_283386 - DIRECTION
      ?auto_283390 - MODE
      ?auto_283388 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283387 ?auto_283389 ) ( SUPPORTS ?auto_283387 ?auto_283380 ) ( not ( = ?auto_283383 ?auto_283391 ) ) ( HAVE_IMAGE ?auto_283386 ?auto_283390 ) ( not ( = ?auto_283386 ?auto_283383 ) ) ( not ( = ?auto_283386 ?auto_283391 ) ) ( not ( = ?auto_283390 ?auto_283380 ) ) ( CALIBRATION_TARGET ?auto_283387 ?auto_283391 ) ( POINTING ?auto_283389 ?auto_283381 ) ( not ( = ?auto_283391 ?auto_283381 ) ) ( not ( = ?auto_283383 ?auto_283381 ) ) ( not ( = ?auto_283386 ?auto_283381 ) ) ( ON_BOARD ?auto_283388 ?auto_283389 ) ( POWER_ON ?auto_283388 ) ( not ( = ?auto_283387 ?auto_283388 ) ) ( HAVE_IMAGE ?auto_283381 ?auto_283382 ) ( HAVE_IMAGE ?auto_283384 ?auto_283385 ) ( not ( = ?auto_283381 ?auto_283384 ) ) ( not ( = ?auto_283382 ?auto_283380 ) ) ( not ( = ?auto_283382 ?auto_283385 ) ) ( not ( = ?auto_283382 ?auto_283390 ) ) ( not ( = ?auto_283383 ?auto_283384 ) ) ( not ( = ?auto_283380 ?auto_283385 ) ) ( not ( = ?auto_283384 ?auto_283391 ) ) ( not ( = ?auto_283384 ?auto_283386 ) ) ( not ( = ?auto_283385 ?auto_283390 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283386 ?auto_283390 ?auto_283383 ?auto_283380 )
      ( GET-3IMAGE-VERIFY ?auto_283381 ?auto_283382 ?auto_283383 ?auto_283380 ?auto_283384 ?auto_283385 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283405 - DIRECTION
      ?auto_283406 - MODE
      ?auto_283407 - DIRECTION
      ?auto_283404 - MODE
      ?auto_283408 - DIRECTION
      ?auto_283409 - MODE
    )
    :vars
    (
      ?auto_283410 - INSTRUMENT
      ?auto_283412 - SATELLITE
      ?auto_283414 - DIRECTION
      ?auto_283413 - DIRECTION
      ?auto_283411 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283410 ?auto_283412 ) ( SUPPORTS ?auto_283410 ?auto_283406 ) ( not ( = ?auto_283405 ?auto_283414 ) ) ( HAVE_IMAGE ?auto_283407 ?auto_283404 ) ( not ( = ?auto_283407 ?auto_283405 ) ) ( not ( = ?auto_283407 ?auto_283414 ) ) ( not ( = ?auto_283404 ?auto_283406 ) ) ( CALIBRATION_TARGET ?auto_283410 ?auto_283414 ) ( POINTING ?auto_283412 ?auto_283413 ) ( not ( = ?auto_283414 ?auto_283413 ) ) ( not ( = ?auto_283405 ?auto_283413 ) ) ( not ( = ?auto_283407 ?auto_283413 ) ) ( ON_BOARD ?auto_283411 ?auto_283412 ) ( POWER_ON ?auto_283411 ) ( not ( = ?auto_283410 ?auto_283411 ) ) ( HAVE_IMAGE ?auto_283408 ?auto_283409 ) ( not ( = ?auto_283405 ?auto_283408 ) ) ( not ( = ?auto_283406 ?auto_283409 ) ) ( not ( = ?auto_283407 ?auto_283408 ) ) ( not ( = ?auto_283404 ?auto_283409 ) ) ( not ( = ?auto_283408 ?auto_283414 ) ) ( not ( = ?auto_283408 ?auto_283413 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283407 ?auto_283404 ?auto_283405 ?auto_283406 )
      ( GET-3IMAGE-VERIFY ?auto_283405 ?auto_283406 ?auto_283407 ?auto_283404 ?auto_283408 ?auto_283409 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283416 - DIRECTION
      ?auto_283417 - MODE
      ?auto_283418 - DIRECTION
      ?auto_283415 - MODE
      ?auto_283419 - DIRECTION
      ?auto_283420 - MODE
    )
    :vars
    (
      ?auto_283421 - INSTRUMENT
      ?auto_283423 - SATELLITE
      ?auto_283424 - DIRECTION
      ?auto_283422 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283421 ?auto_283423 ) ( SUPPORTS ?auto_283421 ?auto_283417 ) ( not ( = ?auto_283416 ?auto_283424 ) ) ( HAVE_IMAGE ?auto_283418 ?auto_283415 ) ( not ( = ?auto_283418 ?auto_283416 ) ) ( not ( = ?auto_283418 ?auto_283424 ) ) ( not ( = ?auto_283415 ?auto_283417 ) ) ( CALIBRATION_TARGET ?auto_283421 ?auto_283424 ) ( POINTING ?auto_283423 ?auto_283419 ) ( not ( = ?auto_283424 ?auto_283419 ) ) ( not ( = ?auto_283416 ?auto_283419 ) ) ( not ( = ?auto_283418 ?auto_283419 ) ) ( ON_BOARD ?auto_283422 ?auto_283423 ) ( POWER_ON ?auto_283422 ) ( not ( = ?auto_283421 ?auto_283422 ) ) ( HAVE_IMAGE ?auto_283419 ?auto_283420 ) ( not ( = ?auto_283417 ?auto_283420 ) ) ( not ( = ?auto_283415 ?auto_283420 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283418 ?auto_283415 ?auto_283416 ?auto_283417 )
      ( GET-3IMAGE-VERIFY ?auto_283416 ?auto_283417 ?auto_283418 ?auto_283415 ?auto_283419 ?auto_283420 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283437 - DIRECTION
      ?auto_283438 - MODE
      ?auto_283439 - DIRECTION
      ?auto_283436 - MODE
      ?auto_283440 - DIRECTION
      ?auto_283441 - MODE
    )
    :vars
    (
      ?auto_283442 - INSTRUMENT
      ?auto_283444 - SATELLITE
      ?auto_283445 - DIRECTION
      ?auto_283443 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283442 ?auto_283444 ) ( SUPPORTS ?auto_283442 ?auto_283438 ) ( not ( = ?auto_283437 ?auto_283445 ) ) ( HAVE_IMAGE ?auto_283440 ?auto_283441 ) ( not ( = ?auto_283440 ?auto_283437 ) ) ( not ( = ?auto_283440 ?auto_283445 ) ) ( not ( = ?auto_283441 ?auto_283438 ) ) ( CALIBRATION_TARGET ?auto_283442 ?auto_283445 ) ( POINTING ?auto_283444 ?auto_283439 ) ( not ( = ?auto_283445 ?auto_283439 ) ) ( not ( = ?auto_283437 ?auto_283439 ) ) ( not ( = ?auto_283440 ?auto_283439 ) ) ( ON_BOARD ?auto_283443 ?auto_283444 ) ( POWER_ON ?auto_283443 ) ( not ( = ?auto_283442 ?auto_283443 ) ) ( HAVE_IMAGE ?auto_283439 ?auto_283436 ) ( not ( = ?auto_283438 ?auto_283436 ) ) ( not ( = ?auto_283436 ?auto_283441 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283440 ?auto_283441 ?auto_283437 ?auto_283438 )
      ( GET-3IMAGE-VERIFY ?auto_283437 ?auto_283438 ?auto_283439 ?auto_283436 ?auto_283440 ?auto_283441 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283447 - DIRECTION
      ?auto_283448 - MODE
      ?auto_283449 - DIRECTION
      ?auto_283446 - MODE
      ?auto_283450 - DIRECTION
      ?auto_283451 - MODE
    )
    :vars
    (
      ?auto_283453 - INSTRUMENT
      ?auto_283455 - SATELLITE
      ?auto_283457 - DIRECTION
      ?auto_283452 - DIRECTION
      ?auto_283456 - MODE
      ?auto_283454 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283453 ?auto_283455 ) ( SUPPORTS ?auto_283453 ?auto_283448 ) ( not ( = ?auto_283447 ?auto_283457 ) ) ( HAVE_IMAGE ?auto_283452 ?auto_283456 ) ( not ( = ?auto_283452 ?auto_283447 ) ) ( not ( = ?auto_283452 ?auto_283457 ) ) ( not ( = ?auto_283456 ?auto_283448 ) ) ( CALIBRATION_TARGET ?auto_283453 ?auto_283457 ) ( POINTING ?auto_283455 ?auto_283450 ) ( not ( = ?auto_283457 ?auto_283450 ) ) ( not ( = ?auto_283447 ?auto_283450 ) ) ( not ( = ?auto_283452 ?auto_283450 ) ) ( ON_BOARD ?auto_283454 ?auto_283455 ) ( POWER_ON ?auto_283454 ) ( not ( = ?auto_283453 ?auto_283454 ) ) ( HAVE_IMAGE ?auto_283449 ?auto_283446 ) ( HAVE_IMAGE ?auto_283450 ?auto_283451 ) ( not ( = ?auto_283447 ?auto_283449 ) ) ( not ( = ?auto_283448 ?auto_283446 ) ) ( not ( = ?auto_283448 ?auto_283451 ) ) ( not ( = ?auto_283449 ?auto_283450 ) ) ( not ( = ?auto_283449 ?auto_283457 ) ) ( not ( = ?auto_283449 ?auto_283452 ) ) ( not ( = ?auto_283446 ?auto_283451 ) ) ( not ( = ?auto_283446 ?auto_283456 ) ) ( not ( = ?auto_283451 ?auto_283456 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283452 ?auto_283456 ?auto_283447 ?auto_283448 )
      ( GET-3IMAGE-VERIFY ?auto_283447 ?auto_283448 ?auto_283449 ?auto_283446 ?auto_283450 ?auto_283451 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283507 - DIRECTION
      ?auto_283508 - MODE
      ?auto_283509 - DIRECTION
      ?auto_283506 - MODE
      ?auto_283510 - DIRECTION
      ?auto_283511 - MODE
      ?auto_283512 - DIRECTION
      ?auto_283513 - MODE
    )
    :vars
    (
      ?auto_283514 - INSTRUMENT
      ?auto_283516 - SATELLITE
      ?auto_283518 - DIRECTION
      ?auto_283517 - DIRECTION
      ?auto_283515 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283514 ?auto_283516 ) ( SUPPORTS ?auto_283514 ?auto_283513 ) ( not ( = ?auto_283512 ?auto_283518 ) ) ( HAVE_IMAGE ?auto_283507 ?auto_283508 ) ( not ( = ?auto_283507 ?auto_283512 ) ) ( not ( = ?auto_283507 ?auto_283518 ) ) ( not ( = ?auto_283508 ?auto_283513 ) ) ( CALIBRATION_TARGET ?auto_283514 ?auto_283518 ) ( POINTING ?auto_283516 ?auto_283517 ) ( not ( = ?auto_283518 ?auto_283517 ) ) ( not ( = ?auto_283512 ?auto_283517 ) ) ( not ( = ?auto_283507 ?auto_283517 ) ) ( ON_BOARD ?auto_283515 ?auto_283516 ) ( POWER_ON ?auto_283515 ) ( not ( = ?auto_283514 ?auto_283515 ) ) ( HAVE_IMAGE ?auto_283509 ?auto_283506 ) ( HAVE_IMAGE ?auto_283510 ?auto_283511 ) ( not ( = ?auto_283507 ?auto_283509 ) ) ( not ( = ?auto_283507 ?auto_283510 ) ) ( not ( = ?auto_283508 ?auto_283506 ) ) ( not ( = ?auto_283508 ?auto_283511 ) ) ( not ( = ?auto_283509 ?auto_283510 ) ) ( not ( = ?auto_283509 ?auto_283512 ) ) ( not ( = ?auto_283509 ?auto_283518 ) ) ( not ( = ?auto_283509 ?auto_283517 ) ) ( not ( = ?auto_283506 ?auto_283511 ) ) ( not ( = ?auto_283506 ?auto_283513 ) ) ( not ( = ?auto_283510 ?auto_283512 ) ) ( not ( = ?auto_283510 ?auto_283518 ) ) ( not ( = ?auto_283510 ?auto_283517 ) ) ( not ( = ?auto_283511 ?auto_283513 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283507 ?auto_283508 ?auto_283512 ?auto_283513 )
      ( GET-4IMAGE-VERIFY ?auto_283507 ?auto_283508 ?auto_283509 ?auto_283506 ?auto_283510 ?auto_283511 ?auto_283512 ?auto_283513 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283520 - DIRECTION
      ?auto_283521 - MODE
      ?auto_283522 - DIRECTION
      ?auto_283519 - MODE
      ?auto_283523 - DIRECTION
      ?auto_283524 - MODE
      ?auto_283525 - DIRECTION
      ?auto_283526 - MODE
    )
    :vars
    (
      ?auto_283527 - INSTRUMENT
      ?auto_283529 - SATELLITE
      ?auto_283530 - DIRECTION
      ?auto_283528 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283527 ?auto_283529 ) ( SUPPORTS ?auto_283527 ?auto_283526 ) ( not ( = ?auto_283525 ?auto_283530 ) ) ( HAVE_IMAGE ?auto_283522 ?auto_283521 ) ( not ( = ?auto_283522 ?auto_283525 ) ) ( not ( = ?auto_283522 ?auto_283530 ) ) ( not ( = ?auto_283521 ?auto_283526 ) ) ( CALIBRATION_TARGET ?auto_283527 ?auto_283530 ) ( POINTING ?auto_283529 ?auto_283523 ) ( not ( = ?auto_283530 ?auto_283523 ) ) ( not ( = ?auto_283525 ?auto_283523 ) ) ( not ( = ?auto_283522 ?auto_283523 ) ) ( ON_BOARD ?auto_283528 ?auto_283529 ) ( POWER_ON ?auto_283528 ) ( not ( = ?auto_283527 ?auto_283528 ) ) ( HAVE_IMAGE ?auto_283520 ?auto_283521 ) ( HAVE_IMAGE ?auto_283522 ?auto_283519 ) ( HAVE_IMAGE ?auto_283523 ?auto_283524 ) ( not ( = ?auto_283520 ?auto_283522 ) ) ( not ( = ?auto_283520 ?auto_283523 ) ) ( not ( = ?auto_283520 ?auto_283525 ) ) ( not ( = ?auto_283520 ?auto_283530 ) ) ( not ( = ?auto_283521 ?auto_283519 ) ) ( not ( = ?auto_283521 ?auto_283524 ) ) ( not ( = ?auto_283519 ?auto_283524 ) ) ( not ( = ?auto_283519 ?auto_283526 ) ) ( not ( = ?auto_283524 ?auto_283526 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283522 ?auto_283521 ?auto_283525 ?auto_283526 )
      ( GET-4IMAGE-VERIFY ?auto_283520 ?auto_283521 ?auto_283522 ?auto_283519 ?auto_283523 ?auto_283524 ?auto_283525 ?auto_283526 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283532 - DIRECTION
      ?auto_283533 - MODE
      ?auto_283534 - DIRECTION
      ?auto_283531 - MODE
      ?auto_283535 - DIRECTION
      ?auto_283536 - MODE
      ?auto_283537 - DIRECTION
      ?auto_283538 - MODE
    )
    :vars
    (
      ?auto_283539 - INSTRUMENT
      ?auto_283541 - SATELLITE
      ?auto_283543 - DIRECTION
      ?auto_283542 - DIRECTION
      ?auto_283540 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283539 ?auto_283541 ) ( SUPPORTS ?auto_283539 ?auto_283536 ) ( not ( = ?auto_283535 ?auto_283543 ) ) ( HAVE_IMAGE ?auto_283534 ?auto_283538 ) ( not ( = ?auto_283534 ?auto_283535 ) ) ( not ( = ?auto_283534 ?auto_283543 ) ) ( not ( = ?auto_283538 ?auto_283536 ) ) ( CALIBRATION_TARGET ?auto_283539 ?auto_283543 ) ( POINTING ?auto_283541 ?auto_283542 ) ( not ( = ?auto_283543 ?auto_283542 ) ) ( not ( = ?auto_283535 ?auto_283542 ) ) ( not ( = ?auto_283534 ?auto_283542 ) ) ( ON_BOARD ?auto_283540 ?auto_283541 ) ( POWER_ON ?auto_283540 ) ( not ( = ?auto_283539 ?auto_283540 ) ) ( HAVE_IMAGE ?auto_283532 ?auto_283533 ) ( HAVE_IMAGE ?auto_283534 ?auto_283531 ) ( HAVE_IMAGE ?auto_283537 ?auto_283538 ) ( not ( = ?auto_283532 ?auto_283534 ) ) ( not ( = ?auto_283532 ?auto_283535 ) ) ( not ( = ?auto_283532 ?auto_283537 ) ) ( not ( = ?auto_283532 ?auto_283543 ) ) ( not ( = ?auto_283532 ?auto_283542 ) ) ( not ( = ?auto_283533 ?auto_283531 ) ) ( not ( = ?auto_283533 ?auto_283536 ) ) ( not ( = ?auto_283533 ?auto_283538 ) ) ( not ( = ?auto_283534 ?auto_283537 ) ) ( not ( = ?auto_283531 ?auto_283536 ) ) ( not ( = ?auto_283531 ?auto_283538 ) ) ( not ( = ?auto_283535 ?auto_283537 ) ) ( not ( = ?auto_283537 ?auto_283543 ) ) ( not ( = ?auto_283537 ?auto_283542 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283534 ?auto_283538 ?auto_283535 ?auto_283536 )
      ( GET-4IMAGE-VERIFY ?auto_283532 ?auto_283533 ?auto_283534 ?auto_283531 ?auto_283535 ?auto_283536 ?auto_283537 ?auto_283538 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283545 - DIRECTION
      ?auto_283546 - MODE
      ?auto_283547 - DIRECTION
      ?auto_283544 - MODE
      ?auto_283548 - DIRECTION
      ?auto_283549 - MODE
      ?auto_283550 - DIRECTION
      ?auto_283551 - MODE
    )
    :vars
    (
      ?auto_283552 - INSTRUMENT
      ?auto_283554 - SATELLITE
      ?auto_283555 - DIRECTION
      ?auto_283553 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283552 ?auto_283554 ) ( SUPPORTS ?auto_283552 ?auto_283549 ) ( not ( = ?auto_283548 ?auto_283555 ) ) ( HAVE_IMAGE ?auto_283547 ?auto_283546 ) ( not ( = ?auto_283547 ?auto_283548 ) ) ( not ( = ?auto_283547 ?auto_283555 ) ) ( not ( = ?auto_283546 ?auto_283549 ) ) ( CALIBRATION_TARGET ?auto_283552 ?auto_283555 ) ( POINTING ?auto_283554 ?auto_283550 ) ( not ( = ?auto_283555 ?auto_283550 ) ) ( not ( = ?auto_283548 ?auto_283550 ) ) ( not ( = ?auto_283547 ?auto_283550 ) ) ( ON_BOARD ?auto_283553 ?auto_283554 ) ( POWER_ON ?auto_283553 ) ( not ( = ?auto_283552 ?auto_283553 ) ) ( HAVE_IMAGE ?auto_283545 ?auto_283546 ) ( HAVE_IMAGE ?auto_283547 ?auto_283544 ) ( HAVE_IMAGE ?auto_283550 ?auto_283551 ) ( not ( = ?auto_283545 ?auto_283547 ) ) ( not ( = ?auto_283545 ?auto_283548 ) ) ( not ( = ?auto_283545 ?auto_283550 ) ) ( not ( = ?auto_283545 ?auto_283555 ) ) ( not ( = ?auto_283546 ?auto_283544 ) ) ( not ( = ?auto_283546 ?auto_283551 ) ) ( not ( = ?auto_283544 ?auto_283549 ) ) ( not ( = ?auto_283544 ?auto_283551 ) ) ( not ( = ?auto_283549 ?auto_283551 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283547 ?auto_283546 ?auto_283548 ?auto_283549 )
      ( GET-4IMAGE-VERIFY ?auto_283545 ?auto_283546 ?auto_283547 ?auto_283544 ?auto_283548 ?auto_283549 ?auto_283550 ?auto_283551 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283570 - DIRECTION
      ?auto_283571 - MODE
      ?auto_283572 - DIRECTION
      ?auto_283569 - MODE
      ?auto_283573 - DIRECTION
      ?auto_283574 - MODE
      ?auto_283575 - DIRECTION
      ?auto_283576 - MODE
    )
    :vars
    (
      ?auto_283577 - INSTRUMENT
      ?auto_283579 - SATELLITE
      ?auto_283580 - DIRECTION
      ?auto_283578 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283577 ?auto_283579 ) ( SUPPORTS ?auto_283577 ?auto_283576 ) ( not ( = ?auto_283575 ?auto_283580 ) ) ( HAVE_IMAGE ?auto_283573 ?auto_283574 ) ( not ( = ?auto_283573 ?auto_283575 ) ) ( not ( = ?auto_283573 ?auto_283580 ) ) ( not ( = ?auto_283574 ?auto_283576 ) ) ( CALIBRATION_TARGET ?auto_283577 ?auto_283580 ) ( POINTING ?auto_283579 ?auto_283572 ) ( not ( = ?auto_283580 ?auto_283572 ) ) ( not ( = ?auto_283575 ?auto_283572 ) ) ( not ( = ?auto_283573 ?auto_283572 ) ) ( ON_BOARD ?auto_283578 ?auto_283579 ) ( POWER_ON ?auto_283578 ) ( not ( = ?auto_283577 ?auto_283578 ) ) ( HAVE_IMAGE ?auto_283570 ?auto_283571 ) ( HAVE_IMAGE ?auto_283572 ?auto_283569 ) ( not ( = ?auto_283570 ?auto_283572 ) ) ( not ( = ?auto_283570 ?auto_283573 ) ) ( not ( = ?auto_283570 ?auto_283575 ) ) ( not ( = ?auto_283570 ?auto_283580 ) ) ( not ( = ?auto_283571 ?auto_283569 ) ) ( not ( = ?auto_283571 ?auto_283574 ) ) ( not ( = ?auto_283571 ?auto_283576 ) ) ( not ( = ?auto_283569 ?auto_283574 ) ) ( not ( = ?auto_283569 ?auto_283576 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283573 ?auto_283574 ?auto_283575 ?auto_283576 )
      ( GET-4IMAGE-VERIFY ?auto_283570 ?auto_283571 ?auto_283572 ?auto_283569 ?auto_283573 ?auto_283574 ?auto_283575 ?auto_283576 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283582 - DIRECTION
      ?auto_283583 - MODE
      ?auto_283584 - DIRECTION
      ?auto_283581 - MODE
      ?auto_283585 - DIRECTION
      ?auto_283586 - MODE
      ?auto_283587 - DIRECTION
      ?auto_283588 - MODE
    )
    :vars
    (
      ?auto_283589 - INSTRUMENT
      ?auto_283591 - SATELLITE
      ?auto_283592 - DIRECTION
      ?auto_283590 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283589 ?auto_283591 ) ( SUPPORTS ?auto_283589 ?auto_283588 ) ( not ( = ?auto_283587 ?auto_283592 ) ) ( HAVE_IMAGE ?auto_283582 ?auto_283583 ) ( not ( = ?auto_283582 ?auto_283587 ) ) ( not ( = ?auto_283582 ?auto_283592 ) ) ( not ( = ?auto_283583 ?auto_283588 ) ) ( CALIBRATION_TARGET ?auto_283589 ?auto_283592 ) ( POINTING ?auto_283591 ?auto_283585 ) ( not ( = ?auto_283592 ?auto_283585 ) ) ( not ( = ?auto_283587 ?auto_283585 ) ) ( not ( = ?auto_283582 ?auto_283585 ) ) ( ON_BOARD ?auto_283590 ?auto_283591 ) ( POWER_ON ?auto_283590 ) ( not ( = ?auto_283589 ?auto_283590 ) ) ( HAVE_IMAGE ?auto_283584 ?auto_283581 ) ( HAVE_IMAGE ?auto_283585 ?auto_283586 ) ( not ( = ?auto_283582 ?auto_283584 ) ) ( not ( = ?auto_283583 ?auto_283581 ) ) ( not ( = ?auto_283583 ?auto_283586 ) ) ( not ( = ?auto_283584 ?auto_283585 ) ) ( not ( = ?auto_283584 ?auto_283587 ) ) ( not ( = ?auto_283584 ?auto_283592 ) ) ( not ( = ?auto_283581 ?auto_283586 ) ) ( not ( = ?auto_283581 ?auto_283588 ) ) ( not ( = ?auto_283586 ?auto_283588 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283582 ?auto_283583 ?auto_283587 ?auto_283588 )
      ( GET-4IMAGE-VERIFY ?auto_283582 ?auto_283583 ?auto_283584 ?auto_283581 ?auto_283585 ?auto_283586 ?auto_283587 ?auto_283588 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283594 - DIRECTION
      ?auto_283595 - MODE
      ?auto_283596 - DIRECTION
      ?auto_283593 - MODE
      ?auto_283597 - DIRECTION
      ?auto_283598 - MODE
      ?auto_283599 - DIRECTION
      ?auto_283600 - MODE
    )
    :vars
    (
      ?auto_283601 - INSTRUMENT
      ?auto_283603 - SATELLITE
      ?auto_283604 - DIRECTION
      ?auto_283602 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283601 ?auto_283603 ) ( SUPPORTS ?auto_283601 ?auto_283598 ) ( not ( = ?auto_283597 ?auto_283604 ) ) ( HAVE_IMAGE ?auto_283594 ?auto_283600 ) ( not ( = ?auto_283594 ?auto_283597 ) ) ( not ( = ?auto_283594 ?auto_283604 ) ) ( not ( = ?auto_283600 ?auto_283598 ) ) ( CALIBRATION_TARGET ?auto_283601 ?auto_283604 ) ( POINTING ?auto_283603 ?auto_283596 ) ( not ( = ?auto_283604 ?auto_283596 ) ) ( not ( = ?auto_283597 ?auto_283596 ) ) ( not ( = ?auto_283594 ?auto_283596 ) ) ( ON_BOARD ?auto_283602 ?auto_283603 ) ( POWER_ON ?auto_283602 ) ( not ( = ?auto_283601 ?auto_283602 ) ) ( HAVE_IMAGE ?auto_283594 ?auto_283595 ) ( HAVE_IMAGE ?auto_283596 ?auto_283593 ) ( HAVE_IMAGE ?auto_283599 ?auto_283600 ) ( not ( = ?auto_283594 ?auto_283599 ) ) ( not ( = ?auto_283595 ?auto_283593 ) ) ( not ( = ?auto_283595 ?auto_283598 ) ) ( not ( = ?auto_283595 ?auto_283600 ) ) ( not ( = ?auto_283596 ?auto_283599 ) ) ( not ( = ?auto_283593 ?auto_283598 ) ) ( not ( = ?auto_283593 ?auto_283600 ) ) ( not ( = ?auto_283597 ?auto_283599 ) ) ( not ( = ?auto_283599 ?auto_283604 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283594 ?auto_283600 ?auto_283597 ?auto_283598 )
      ( GET-4IMAGE-VERIFY ?auto_283594 ?auto_283595 ?auto_283596 ?auto_283593 ?auto_283597 ?auto_283598 ?auto_283599 ?auto_283600 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283606 - DIRECTION
      ?auto_283607 - MODE
      ?auto_283608 - DIRECTION
      ?auto_283605 - MODE
      ?auto_283609 - DIRECTION
      ?auto_283610 - MODE
      ?auto_283611 - DIRECTION
      ?auto_283612 - MODE
    )
    :vars
    (
      ?auto_283613 - INSTRUMENT
      ?auto_283615 - SATELLITE
      ?auto_283616 - DIRECTION
      ?auto_283614 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283613 ?auto_283615 ) ( SUPPORTS ?auto_283613 ?auto_283610 ) ( not ( = ?auto_283609 ?auto_283616 ) ) ( HAVE_IMAGE ?auto_283606 ?auto_283607 ) ( not ( = ?auto_283606 ?auto_283609 ) ) ( not ( = ?auto_283606 ?auto_283616 ) ) ( not ( = ?auto_283607 ?auto_283610 ) ) ( CALIBRATION_TARGET ?auto_283613 ?auto_283616 ) ( POINTING ?auto_283615 ?auto_283608 ) ( not ( = ?auto_283616 ?auto_283608 ) ) ( not ( = ?auto_283609 ?auto_283608 ) ) ( not ( = ?auto_283606 ?auto_283608 ) ) ( ON_BOARD ?auto_283614 ?auto_283615 ) ( POWER_ON ?auto_283614 ) ( not ( = ?auto_283613 ?auto_283614 ) ) ( HAVE_IMAGE ?auto_283608 ?auto_283605 ) ( HAVE_IMAGE ?auto_283611 ?auto_283612 ) ( not ( = ?auto_283606 ?auto_283611 ) ) ( not ( = ?auto_283607 ?auto_283605 ) ) ( not ( = ?auto_283607 ?auto_283612 ) ) ( not ( = ?auto_283608 ?auto_283611 ) ) ( not ( = ?auto_283605 ?auto_283610 ) ) ( not ( = ?auto_283605 ?auto_283612 ) ) ( not ( = ?auto_283609 ?auto_283611 ) ) ( not ( = ?auto_283610 ?auto_283612 ) ) ( not ( = ?auto_283611 ?auto_283616 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283606 ?auto_283607 ?auto_283609 ?auto_283610 )
      ( GET-4IMAGE-VERIFY ?auto_283606 ?auto_283607 ?auto_283608 ?auto_283605 ?auto_283609 ?auto_283610 ?auto_283611 ?auto_283612 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283630 - DIRECTION
      ?auto_283631 - MODE
      ?auto_283632 - DIRECTION
      ?auto_283629 - MODE
      ?auto_283633 - DIRECTION
      ?auto_283634 - MODE
      ?auto_283635 - DIRECTION
      ?auto_283636 - MODE
    )
    :vars
    (
      ?auto_283637 - INSTRUMENT
      ?auto_283639 - SATELLITE
      ?auto_283641 - DIRECTION
      ?auto_283640 - DIRECTION
      ?auto_283638 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283637 ?auto_283639 ) ( SUPPORTS ?auto_283637 ?auto_283629 ) ( not ( = ?auto_283632 ?auto_283641 ) ) ( HAVE_IMAGE ?auto_283630 ?auto_283636 ) ( not ( = ?auto_283630 ?auto_283632 ) ) ( not ( = ?auto_283630 ?auto_283641 ) ) ( not ( = ?auto_283636 ?auto_283629 ) ) ( CALIBRATION_TARGET ?auto_283637 ?auto_283641 ) ( POINTING ?auto_283639 ?auto_283640 ) ( not ( = ?auto_283641 ?auto_283640 ) ) ( not ( = ?auto_283632 ?auto_283640 ) ) ( not ( = ?auto_283630 ?auto_283640 ) ) ( ON_BOARD ?auto_283638 ?auto_283639 ) ( POWER_ON ?auto_283638 ) ( not ( = ?auto_283637 ?auto_283638 ) ) ( HAVE_IMAGE ?auto_283630 ?auto_283631 ) ( HAVE_IMAGE ?auto_283633 ?auto_283634 ) ( HAVE_IMAGE ?auto_283635 ?auto_283636 ) ( not ( = ?auto_283630 ?auto_283633 ) ) ( not ( = ?auto_283630 ?auto_283635 ) ) ( not ( = ?auto_283631 ?auto_283629 ) ) ( not ( = ?auto_283631 ?auto_283634 ) ) ( not ( = ?auto_283631 ?auto_283636 ) ) ( not ( = ?auto_283632 ?auto_283633 ) ) ( not ( = ?auto_283632 ?auto_283635 ) ) ( not ( = ?auto_283629 ?auto_283634 ) ) ( not ( = ?auto_283633 ?auto_283635 ) ) ( not ( = ?auto_283633 ?auto_283641 ) ) ( not ( = ?auto_283633 ?auto_283640 ) ) ( not ( = ?auto_283634 ?auto_283636 ) ) ( not ( = ?auto_283635 ?auto_283641 ) ) ( not ( = ?auto_283635 ?auto_283640 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283630 ?auto_283636 ?auto_283632 ?auto_283629 )
      ( GET-4IMAGE-VERIFY ?auto_283630 ?auto_283631 ?auto_283632 ?auto_283629 ?auto_283633 ?auto_283634 ?auto_283635 ?auto_283636 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283643 - DIRECTION
      ?auto_283644 - MODE
      ?auto_283645 - DIRECTION
      ?auto_283642 - MODE
      ?auto_283646 - DIRECTION
      ?auto_283647 - MODE
      ?auto_283648 - DIRECTION
      ?auto_283649 - MODE
    )
    :vars
    (
      ?auto_283650 - INSTRUMENT
      ?auto_283652 - SATELLITE
      ?auto_283653 - DIRECTION
      ?auto_283651 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283650 ?auto_283652 ) ( SUPPORTS ?auto_283650 ?auto_283642 ) ( not ( = ?auto_283645 ?auto_283653 ) ) ( HAVE_IMAGE ?auto_283646 ?auto_283647 ) ( not ( = ?auto_283646 ?auto_283645 ) ) ( not ( = ?auto_283646 ?auto_283653 ) ) ( not ( = ?auto_283647 ?auto_283642 ) ) ( CALIBRATION_TARGET ?auto_283650 ?auto_283653 ) ( POINTING ?auto_283652 ?auto_283648 ) ( not ( = ?auto_283653 ?auto_283648 ) ) ( not ( = ?auto_283645 ?auto_283648 ) ) ( not ( = ?auto_283646 ?auto_283648 ) ) ( ON_BOARD ?auto_283651 ?auto_283652 ) ( POWER_ON ?auto_283651 ) ( not ( = ?auto_283650 ?auto_283651 ) ) ( HAVE_IMAGE ?auto_283643 ?auto_283644 ) ( HAVE_IMAGE ?auto_283648 ?auto_283649 ) ( not ( = ?auto_283643 ?auto_283645 ) ) ( not ( = ?auto_283643 ?auto_283646 ) ) ( not ( = ?auto_283643 ?auto_283648 ) ) ( not ( = ?auto_283643 ?auto_283653 ) ) ( not ( = ?auto_283644 ?auto_283642 ) ) ( not ( = ?auto_283644 ?auto_283647 ) ) ( not ( = ?auto_283644 ?auto_283649 ) ) ( not ( = ?auto_283642 ?auto_283649 ) ) ( not ( = ?auto_283647 ?auto_283649 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283646 ?auto_283647 ?auto_283645 ?auto_283642 )
      ( GET-4IMAGE-VERIFY ?auto_283643 ?auto_283644 ?auto_283645 ?auto_283642 ?auto_283646 ?auto_283647 ?auto_283648 ?auto_283649 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283668 - DIRECTION
      ?auto_283669 - MODE
      ?auto_283670 - DIRECTION
      ?auto_283667 - MODE
      ?auto_283671 - DIRECTION
      ?auto_283672 - MODE
      ?auto_283673 - DIRECTION
      ?auto_283674 - MODE
    )
    :vars
    (
      ?auto_283675 - INSTRUMENT
      ?auto_283677 - SATELLITE
      ?auto_283678 - DIRECTION
      ?auto_283676 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283675 ?auto_283677 ) ( SUPPORTS ?auto_283675 ?auto_283667 ) ( not ( = ?auto_283670 ?auto_283678 ) ) ( HAVE_IMAGE ?auto_283668 ?auto_283674 ) ( not ( = ?auto_283668 ?auto_283670 ) ) ( not ( = ?auto_283668 ?auto_283678 ) ) ( not ( = ?auto_283674 ?auto_283667 ) ) ( CALIBRATION_TARGET ?auto_283675 ?auto_283678 ) ( POINTING ?auto_283677 ?auto_283671 ) ( not ( = ?auto_283678 ?auto_283671 ) ) ( not ( = ?auto_283670 ?auto_283671 ) ) ( not ( = ?auto_283668 ?auto_283671 ) ) ( ON_BOARD ?auto_283676 ?auto_283677 ) ( POWER_ON ?auto_283676 ) ( not ( = ?auto_283675 ?auto_283676 ) ) ( HAVE_IMAGE ?auto_283668 ?auto_283669 ) ( HAVE_IMAGE ?auto_283671 ?auto_283672 ) ( HAVE_IMAGE ?auto_283673 ?auto_283674 ) ( not ( = ?auto_283668 ?auto_283673 ) ) ( not ( = ?auto_283669 ?auto_283667 ) ) ( not ( = ?auto_283669 ?auto_283672 ) ) ( not ( = ?auto_283669 ?auto_283674 ) ) ( not ( = ?auto_283670 ?auto_283673 ) ) ( not ( = ?auto_283667 ?auto_283672 ) ) ( not ( = ?auto_283671 ?auto_283673 ) ) ( not ( = ?auto_283672 ?auto_283674 ) ) ( not ( = ?auto_283673 ?auto_283678 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283668 ?auto_283674 ?auto_283670 ?auto_283667 )
      ( GET-4IMAGE-VERIFY ?auto_283668 ?auto_283669 ?auto_283670 ?auto_283667 ?auto_283671 ?auto_283672 ?auto_283673 ?auto_283674 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283680 - DIRECTION
      ?auto_283681 - MODE
      ?auto_283682 - DIRECTION
      ?auto_283679 - MODE
      ?auto_283683 - DIRECTION
      ?auto_283684 - MODE
      ?auto_283685 - DIRECTION
      ?auto_283686 - MODE
    )
    :vars
    (
      ?auto_283687 - INSTRUMENT
      ?auto_283689 - SATELLITE
      ?auto_283690 - DIRECTION
      ?auto_283688 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283687 ?auto_283689 ) ( SUPPORTS ?auto_283687 ?auto_283679 ) ( not ( = ?auto_283682 ?auto_283690 ) ) ( HAVE_IMAGE ?auto_283680 ?auto_283681 ) ( not ( = ?auto_283680 ?auto_283682 ) ) ( not ( = ?auto_283680 ?auto_283690 ) ) ( not ( = ?auto_283681 ?auto_283679 ) ) ( CALIBRATION_TARGET ?auto_283687 ?auto_283690 ) ( POINTING ?auto_283689 ?auto_283683 ) ( not ( = ?auto_283690 ?auto_283683 ) ) ( not ( = ?auto_283682 ?auto_283683 ) ) ( not ( = ?auto_283680 ?auto_283683 ) ) ( ON_BOARD ?auto_283688 ?auto_283689 ) ( POWER_ON ?auto_283688 ) ( not ( = ?auto_283687 ?auto_283688 ) ) ( HAVE_IMAGE ?auto_283683 ?auto_283684 ) ( HAVE_IMAGE ?auto_283685 ?auto_283686 ) ( not ( = ?auto_283680 ?auto_283685 ) ) ( not ( = ?auto_283681 ?auto_283684 ) ) ( not ( = ?auto_283681 ?auto_283686 ) ) ( not ( = ?auto_283682 ?auto_283685 ) ) ( not ( = ?auto_283679 ?auto_283684 ) ) ( not ( = ?auto_283679 ?auto_283686 ) ) ( not ( = ?auto_283683 ?auto_283685 ) ) ( not ( = ?auto_283684 ?auto_283686 ) ) ( not ( = ?auto_283685 ?auto_283690 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283680 ?auto_283681 ?auto_283682 ?auto_283679 )
      ( GET-4IMAGE-VERIFY ?auto_283680 ?auto_283681 ?auto_283682 ?auto_283679 ?auto_283683 ?auto_283684 ?auto_283685 ?auto_283686 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283742 - DIRECTION
      ?auto_283743 - MODE
      ?auto_283744 - DIRECTION
      ?auto_283741 - MODE
      ?auto_283745 - DIRECTION
      ?auto_283746 - MODE
      ?auto_283747 - DIRECTION
      ?auto_283748 - MODE
    )
    :vars
    (
      ?auto_283749 - INSTRUMENT
      ?auto_283751 - SATELLITE
      ?auto_283752 - DIRECTION
      ?auto_283750 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283749 ?auto_283751 ) ( SUPPORTS ?auto_283749 ?auto_283748 ) ( not ( = ?auto_283747 ?auto_283752 ) ) ( HAVE_IMAGE ?auto_283744 ?auto_283741 ) ( not ( = ?auto_283744 ?auto_283747 ) ) ( not ( = ?auto_283744 ?auto_283752 ) ) ( not ( = ?auto_283741 ?auto_283748 ) ) ( CALIBRATION_TARGET ?auto_283749 ?auto_283752 ) ( POINTING ?auto_283751 ?auto_283742 ) ( not ( = ?auto_283752 ?auto_283742 ) ) ( not ( = ?auto_283747 ?auto_283742 ) ) ( not ( = ?auto_283744 ?auto_283742 ) ) ( ON_BOARD ?auto_283750 ?auto_283751 ) ( POWER_ON ?auto_283750 ) ( not ( = ?auto_283749 ?auto_283750 ) ) ( HAVE_IMAGE ?auto_283742 ?auto_283743 ) ( HAVE_IMAGE ?auto_283745 ?auto_283746 ) ( not ( = ?auto_283742 ?auto_283745 ) ) ( not ( = ?auto_283743 ?auto_283741 ) ) ( not ( = ?auto_283743 ?auto_283746 ) ) ( not ( = ?auto_283743 ?auto_283748 ) ) ( not ( = ?auto_283744 ?auto_283745 ) ) ( not ( = ?auto_283741 ?auto_283746 ) ) ( not ( = ?auto_283745 ?auto_283747 ) ) ( not ( = ?auto_283745 ?auto_283752 ) ) ( not ( = ?auto_283746 ?auto_283748 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283744 ?auto_283741 ?auto_283747 ?auto_283748 )
      ( GET-4IMAGE-VERIFY ?auto_283742 ?auto_283743 ?auto_283744 ?auto_283741 ?auto_283745 ?auto_283746 ?auto_283747 ?auto_283748 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283754 - DIRECTION
      ?auto_283755 - MODE
      ?auto_283756 - DIRECTION
      ?auto_283753 - MODE
      ?auto_283757 - DIRECTION
      ?auto_283758 - MODE
      ?auto_283759 - DIRECTION
      ?auto_283760 - MODE
    )
    :vars
    (
      ?auto_283761 - INSTRUMENT
      ?auto_283763 - SATELLITE
      ?auto_283764 - DIRECTION
      ?auto_283762 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283761 ?auto_283763 ) ( SUPPORTS ?auto_283761 ?auto_283760 ) ( not ( = ?auto_283759 ?auto_283764 ) ) ( HAVE_IMAGE ?auto_283756 ?auto_283753 ) ( not ( = ?auto_283756 ?auto_283759 ) ) ( not ( = ?auto_283756 ?auto_283764 ) ) ( not ( = ?auto_283753 ?auto_283760 ) ) ( CALIBRATION_TARGET ?auto_283761 ?auto_283764 ) ( POINTING ?auto_283763 ?auto_283757 ) ( not ( = ?auto_283764 ?auto_283757 ) ) ( not ( = ?auto_283759 ?auto_283757 ) ) ( not ( = ?auto_283756 ?auto_283757 ) ) ( ON_BOARD ?auto_283762 ?auto_283763 ) ( POWER_ON ?auto_283762 ) ( not ( = ?auto_283761 ?auto_283762 ) ) ( HAVE_IMAGE ?auto_283754 ?auto_283755 ) ( HAVE_IMAGE ?auto_283757 ?auto_283758 ) ( not ( = ?auto_283754 ?auto_283756 ) ) ( not ( = ?auto_283754 ?auto_283757 ) ) ( not ( = ?auto_283754 ?auto_283759 ) ) ( not ( = ?auto_283754 ?auto_283764 ) ) ( not ( = ?auto_283755 ?auto_283753 ) ) ( not ( = ?auto_283755 ?auto_283758 ) ) ( not ( = ?auto_283755 ?auto_283760 ) ) ( not ( = ?auto_283753 ?auto_283758 ) ) ( not ( = ?auto_283758 ?auto_283760 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283756 ?auto_283753 ?auto_283759 ?auto_283760 )
      ( GET-4IMAGE-VERIFY ?auto_283754 ?auto_283755 ?auto_283756 ?auto_283753 ?auto_283757 ?auto_283758 ?auto_283759 ?auto_283760 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283766 - DIRECTION
      ?auto_283767 - MODE
      ?auto_283768 - DIRECTION
      ?auto_283765 - MODE
      ?auto_283769 - DIRECTION
      ?auto_283770 - MODE
      ?auto_283771 - DIRECTION
      ?auto_283772 - MODE
    )
    :vars
    (
      ?auto_283773 - INSTRUMENT
      ?auto_283775 - SATELLITE
      ?auto_283776 - DIRECTION
      ?auto_283774 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283773 ?auto_283775 ) ( SUPPORTS ?auto_283773 ?auto_283770 ) ( not ( = ?auto_283769 ?auto_283776 ) ) ( HAVE_IMAGE ?auto_283768 ?auto_283772 ) ( not ( = ?auto_283768 ?auto_283769 ) ) ( not ( = ?auto_283768 ?auto_283776 ) ) ( not ( = ?auto_283772 ?auto_283770 ) ) ( CALIBRATION_TARGET ?auto_283773 ?auto_283776 ) ( POINTING ?auto_283775 ?auto_283766 ) ( not ( = ?auto_283776 ?auto_283766 ) ) ( not ( = ?auto_283769 ?auto_283766 ) ) ( not ( = ?auto_283768 ?auto_283766 ) ) ( ON_BOARD ?auto_283774 ?auto_283775 ) ( POWER_ON ?auto_283774 ) ( not ( = ?auto_283773 ?auto_283774 ) ) ( HAVE_IMAGE ?auto_283766 ?auto_283767 ) ( HAVE_IMAGE ?auto_283768 ?auto_283765 ) ( HAVE_IMAGE ?auto_283771 ?auto_283772 ) ( not ( = ?auto_283766 ?auto_283771 ) ) ( not ( = ?auto_283767 ?auto_283765 ) ) ( not ( = ?auto_283767 ?auto_283770 ) ) ( not ( = ?auto_283767 ?auto_283772 ) ) ( not ( = ?auto_283768 ?auto_283771 ) ) ( not ( = ?auto_283765 ?auto_283770 ) ) ( not ( = ?auto_283765 ?auto_283772 ) ) ( not ( = ?auto_283769 ?auto_283771 ) ) ( not ( = ?auto_283771 ?auto_283776 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283768 ?auto_283772 ?auto_283769 ?auto_283770 )
      ( GET-4IMAGE-VERIFY ?auto_283766 ?auto_283767 ?auto_283768 ?auto_283765 ?auto_283769 ?auto_283770 ?auto_283771 ?auto_283772 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283778 - DIRECTION
      ?auto_283779 - MODE
      ?auto_283780 - DIRECTION
      ?auto_283777 - MODE
      ?auto_283781 - DIRECTION
      ?auto_283782 - MODE
      ?auto_283783 - DIRECTION
      ?auto_283784 - MODE
    )
    :vars
    (
      ?auto_283785 - INSTRUMENT
      ?auto_283787 - SATELLITE
      ?auto_283788 - DIRECTION
      ?auto_283786 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283785 ?auto_283787 ) ( SUPPORTS ?auto_283785 ?auto_283782 ) ( not ( = ?auto_283781 ?auto_283788 ) ) ( HAVE_IMAGE ?auto_283780 ?auto_283777 ) ( not ( = ?auto_283780 ?auto_283781 ) ) ( not ( = ?auto_283780 ?auto_283788 ) ) ( not ( = ?auto_283777 ?auto_283782 ) ) ( CALIBRATION_TARGET ?auto_283785 ?auto_283788 ) ( POINTING ?auto_283787 ?auto_283778 ) ( not ( = ?auto_283788 ?auto_283778 ) ) ( not ( = ?auto_283781 ?auto_283778 ) ) ( not ( = ?auto_283780 ?auto_283778 ) ) ( ON_BOARD ?auto_283786 ?auto_283787 ) ( POWER_ON ?auto_283786 ) ( not ( = ?auto_283785 ?auto_283786 ) ) ( HAVE_IMAGE ?auto_283778 ?auto_283779 ) ( HAVE_IMAGE ?auto_283783 ?auto_283784 ) ( not ( = ?auto_283778 ?auto_283783 ) ) ( not ( = ?auto_283779 ?auto_283777 ) ) ( not ( = ?auto_283779 ?auto_283782 ) ) ( not ( = ?auto_283779 ?auto_283784 ) ) ( not ( = ?auto_283780 ?auto_283783 ) ) ( not ( = ?auto_283777 ?auto_283784 ) ) ( not ( = ?auto_283781 ?auto_283783 ) ) ( not ( = ?auto_283782 ?auto_283784 ) ) ( not ( = ?auto_283783 ?auto_283788 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283780 ?auto_283777 ?auto_283781 ?auto_283782 )
      ( GET-4IMAGE-VERIFY ?auto_283778 ?auto_283779 ?auto_283780 ?auto_283777 ?auto_283781 ?auto_283782 ?auto_283783 ?auto_283784 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283802 - DIRECTION
      ?auto_283803 - MODE
      ?auto_283804 - DIRECTION
      ?auto_283801 - MODE
      ?auto_283805 - DIRECTION
      ?auto_283806 - MODE
      ?auto_283807 - DIRECTION
      ?auto_283808 - MODE
    )
    :vars
    (
      ?auto_283809 - INSTRUMENT
      ?auto_283811 - SATELLITE
      ?auto_283812 - DIRECTION
      ?auto_283810 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283809 ?auto_283811 ) ( SUPPORTS ?auto_283809 ?auto_283808 ) ( not ( = ?auto_283807 ?auto_283812 ) ) ( HAVE_IMAGE ?auto_283805 ?auto_283806 ) ( not ( = ?auto_283805 ?auto_283807 ) ) ( not ( = ?auto_283805 ?auto_283812 ) ) ( not ( = ?auto_283806 ?auto_283808 ) ) ( CALIBRATION_TARGET ?auto_283809 ?auto_283812 ) ( POINTING ?auto_283811 ?auto_283802 ) ( not ( = ?auto_283812 ?auto_283802 ) ) ( not ( = ?auto_283807 ?auto_283802 ) ) ( not ( = ?auto_283805 ?auto_283802 ) ) ( ON_BOARD ?auto_283810 ?auto_283811 ) ( POWER_ON ?auto_283810 ) ( not ( = ?auto_283809 ?auto_283810 ) ) ( HAVE_IMAGE ?auto_283802 ?auto_283803 ) ( HAVE_IMAGE ?auto_283804 ?auto_283801 ) ( not ( = ?auto_283802 ?auto_283804 ) ) ( not ( = ?auto_283803 ?auto_283801 ) ) ( not ( = ?auto_283803 ?auto_283806 ) ) ( not ( = ?auto_283803 ?auto_283808 ) ) ( not ( = ?auto_283804 ?auto_283805 ) ) ( not ( = ?auto_283804 ?auto_283807 ) ) ( not ( = ?auto_283804 ?auto_283812 ) ) ( not ( = ?auto_283801 ?auto_283806 ) ) ( not ( = ?auto_283801 ?auto_283808 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283805 ?auto_283806 ?auto_283807 ?auto_283808 )
      ( GET-4IMAGE-VERIFY ?auto_283802 ?auto_283803 ?auto_283804 ?auto_283801 ?auto_283805 ?auto_283806 ?auto_283807 ?auto_283808 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283814 - DIRECTION
      ?auto_283815 - MODE
      ?auto_283816 - DIRECTION
      ?auto_283813 - MODE
      ?auto_283817 - DIRECTION
      ?auto_283818 - MODE
      ?auto_283819 - DIRECTION
      ?auto_283820 - MODE
    )
    :vars
    (
      ?auto_283822 - INSTRUMENT
      ?auto_283824 - SATELLITE
      ?auto_283826 - DIRECTION
      ?auto_283821 - DIRECTION
      ?auto_283825 - MODE
      ?auto_283823 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283822 ?auto_283824 ) ( SUPPORTS ?auto_283822 ?auto_283820 ) ( not ( = ?auto_283819 ?auto_283826 ) ) ( HAVE_IMAGE ?auto_283821 ?auto_283825 ) ( not ( = ?auto_283821 ?auto_283819 ) ) ( not ( = ?auto_283821 ?auto_283826 ) ) ( not ( = ?auto_283825 ?auto_283820 ) ) ( CALIBRATION_TARGET ?auto_283822 ?auto_283826 ) ( POINTING ?auto_283824 ?auto_283817 ) ( not ( = ?auto_283826 ?auto_283817 ) ) ( not ( = ?auto_283819 ?auto_283817 ) ) ( not ( = ?auto_283821 ?auto_283817 ) ) ( ON_BOARD ?auto_283823 ?auto_283824 ) ( POWER_ON ?auto_283823 ) ( not ( = ?auto_283822 ?auto_283823 ) ) ( HAVE_IMAGE ?auto_283814 ?auto_283815 ) ( HAVE_IMAGE ?auto_283816 ?auto_283813 ) ( HAVE_IMAGE ?auto_283817 ?auto_283818 ) ( not ( = ?auto_283814 ?auto_283816 ) ) ( not ( = ?auto_283814 ?auto_283817 ) ) ( not ( = ?auto_283814 ?auto_283819 ) ) ( not ( = ?auto_283814 ?auto_283826 ) ) ( not ( = ?auto_283814 ?auto_283821 ) ) ( not ( = ?auto_283815 ?auto_283813 ) ) ( not ( = ?auto_283815 ?auto_283818 ) ) ( not ( = ?auto_283815 ?auto_283820 ) ) ( not ( = ?auto_283815 ?auto_283825 ) ) ( not ( = ?auto_283816 ?auto_283817 ) ) ( not ( = ?auto_283816 ?auto_283819 ) ) ( not ( = ?auto_283816 ?auto_283826 ) ) ( not ( = ?auto_283816 ?auto_283821 ) ) ( not ( = ?auto_283813 ?auto_283818 ) ) ( not ( = ?auto_283813 ?auto_283820 ) ) ( not ( = ?auto_283813 ?auto_283825 ) ) ( not ( = ?auto_283818 ?auto_283820 ) ) ( not ( = ?auto_283818 ?auto_283825 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283821 ?auto_283825 ?auto_283819 ?auto_283820 )
      ( GET-4IMAGE-VERIFY ?auto_283814 ?auto_283815 ?auto_283816 ?auto_283813 ?auto_283817 ?auto_283818 ?auto_283819 ?auto_283820 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283828 - DIRECTION
      ?auto_283829 - MODE
      ?auto_283830 - DIRECTION
      ?auto_283827 - MODE
      ?auto_283831 - DIRECTION
      ?auto_283832 - MODE
      ?auto_283833 - DIRECTION
      ?auto_283834 - MODE
    )
    :vars
    (
      ?auto_283835 - INSTRUMENT
      ?auto_283837 - SATELLITE
      ?auto_283838 - DIRECTION
      ?auto_283836 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283835 ?auto_283837 ) ( SUPPORTS ?auto_283835 ?auto_283832 ) ( not ( = ?auto_283831 ?auto_283838 ) ) ( HAVE_IMAGE ?auto_283833 ?auto_283834 ) ( not ( = ?auto_283833 ?auto_283831 ) ) ( not ( = ?auto_283833 ?auto_283838 ) ) ( not ( = ?auto_283834 ?auto_283832 ) ) ( CALIBRATION_TARGET ?auto_283835 ?auto_283838 ) ( POINTING ?auto_283837 ?auto_283828 ) ( not ( = ?auto_283838 ?auto_283828 ) ) ( not ( = ?auto_283831 ?auto_283828 ) ) ( not ( = ?auto_283833 ?auto_283828 ) ) ( ON_BOARD ?auto_283836 ?auto_283837 ) ( POWER_ON ?auto_283836 ) ( not ( = ?auto_283835 ?auto_283836 ) ) ( HAVE_IMAGE ?auto_283828 ?auto_283829 ) ( HAVE_IMAGE ?auto_283830 ?auto_283827 ) ( not ( = ?auto_283828 ?auto_283830 ) ) ( not ( = ?auto_283829 ?auto_283827 ) ) ( not ( = ?auto_283829 ?auto_283832 ) ) ( not ( = ?auto_283829 ?auto_283834 ) ) ( not ( = ?auto_283830 ?auto_283831 ) ) ( not ( = ?auto_283830 ?auto_283833 ) ) ( not ( = ?auto_283830 ?auto_283838 ) ) ( not ( = ?auto_283827 ?auto_283832 ) ) ( not ( = ?auto_283827 ?auto_283834 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283833 ?auto_283834 ?auto_283831 ?auto_283832 )
      ( GET-4IMAGE-VERIFY ?auto_283828 ?auto_283829 ?auto_283830 ?auto_283827 ?auto_283831 ?auto_283832 ?auto_283833 ?auto_283834 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283840 - DIRECTION
      ?auto_283841 - MODE
      ?auto_283842 - DIRECTION
      ?auto_283839 - MODE
      ?auto_283843 - DIRECTION
      ?auto_283844 - MODE
      ?auto_283845 - DIRECTION
      ?auto_283846 - MODE
    )
    :vars
    (
      ?auto_283848 - INSTRUMENT
      ?auto_283850 - SATELLITE
      ?auto_283852 - DIRECTION
      ?auto_283847 - DIRECTION
      ?auto_283851 - MODE
      ?auto_283849 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283848 ?auto_283850 ) ( SUPPORTS ?auto_283848 ?auto_283844 ) ( not ( = ?auto_283843 ?auto_283852 ) ) ( HAVE_IMAGE ?auto_283847 ?auto_283851 ) ( not ( = ?auto_283847 ?auto_283843 ) ) ( not ( = ?auto_283847 ?auto_283852 ) ) ( not ( = ?auto_283851 ?auto_283844 ) ) ( CALIBRATION_TARGET ?auto_283848 ?auto_283852 ) ( POINTING ?auto_283850 ?auto_283842 ) ( not ( = ?auto_283852 ?auto_283842 ) ) ( not ( = ?auto_283843 ?auto_283842 ) ) ( not ( = ?auto_283847 ?auto_283842 ) ) ( ON_BOARD ?auto_283849 ?auto_283850 ) ( POWER_ON ?auto_283849 ) ( not ( = ?auto_283848 ?auto_283849 ) ) ( HAVE_IMAGE ?auto_283840 ?auto_283841 ) ( HAVE_IMAGE ?auto_283842 ?auto_283839 ) ( HAVE_IMAGE ?auto_283845 ?auto_283846 ) ( not ( = ?auto_283840 ?auto_283842 ) ) ( not ( = ?auto_283840 ?auto_283843 ) ) ( not ( = ?auto_283840 ?auto_283845 ) ) ( not ( = ?auto_283840 ?auto_283852 ) ) ( not ( = ?auto_283840 ?auto_283847 ) ) ( not ( = ?auto_283841 ?auto_283839 ) ) ( not ( = ?auto_283841 ?auto_283844 ) ) ( not ( = ?auto_283841 ?auto_283846 ) ) ( not ( = ?auto_283841 ?auto_283851 ) ) ( not ( = ?auto_283842 ?auto_283845 ) ) ( not ( = ?auto_283839 ?auto_283844 ) ) ( not ( = ?auto_283839 ?auto_283846 ) ) ( not ( = ?auto_283839 ?auto_283851 ) ) ( not ( = ?auto_283843 ?auto_283845 ) ) ( not ( = ?auto_283844 ?auto_283846 ) ) ( not ( = ?auto_283845 ?auto_283852 ) ) ( not ( = ?auto_283845 ?auto_283847 ) ) ( not ( = ?auto_283846 ?auto_283851 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283847 ?auto_283851 ?auto_283843 ?auto_283844 )
      ( GET-4IMAGE-VERIFY ?auto_283840 ?auto_283841 ?auto_283842 ?auto_283839 ?auto_283843 ?auto_283844 ?auto_283845 ?auto_283846 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283868 - DIRECTION
      ?auto_283869 - MODE
      ?auto_283870 - DIRECTION
      ?auto_283867 - MODE
      ?auto_283871 - DIRECTION
      ?auto_283872 - MODE
      ?auto_283873 - DIRECTION
      ?auto_283874 - MODE
    )
    :vars
    (
      ?auto_283875 - INSTRUMENT
      ?auto_283877 - SATELLITE
      ?auto_283878 - DIRECTION
      ?auto_283876 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283875 ?auto_283877 ) ( SUPPORTS ?auto_283875 ?auto_283867 ) ( not ( = ?auto_283870 ?auto_283878 ) ) ( HAVE_IMAGE ?auto_283871 ?auto_283874 ) ( not ( = ?auto_283871 ?auto_283870 ) ) ( not ( = ?auto_283871 ?auto_283878 ) ) ( not ( = ?auto_283874 ?auto_283867 ) ) ( CALIBRATION_TARGET ?auto_283875 ?auto_283878 ) ( POINTING ?auto_283877 ?auto_283868 ) ( not ( = ?auto_283878 ?auto_283868 ) ) ( not ( = ?auto_283870 ?auto_283868 ) ) ( not ( = ?auto_283871 ?auto_283868 ) ) ( ON_BOARD ?auto_283876 ?auto_283877 ) ( POWER_ON ?auto_283876 ) ( not ( = ?auto_283875 ?auto_283876 ) ) ( HAVE_IMAGE ?auto_283868 ?auto_283869 ) ( HAVE_IMAGE ?auto_283871 ?auto_283872 ) ( HAVE_IMAGE ?auto_283873 ?auto_283874 ) ( not ( = ?auto_283868 ?auto_283873 ) ) ( not ( = ?auto_283869 ?auto_283867 ) ) ( not ( = ?auto_283869 ?auto_283872 ) ) ( not ( = ?auto_283869 ?auto_283874 ) ) ( not ( = ?auto_283870 ?auto_283873 ) ) ( not ( = ?auto_283867 ?auto_283872 ) ) ( not ( = ?auto_283871 ?auto_283873 ) ) ( not ( = ?auto_283872 ?auto_283874 ) ) ( not ( = ?auto_283873 ?auto_283878 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283871 ?auto_283874 ?auto_283870 ?auto_283867 )
      ( GET-4IMAGE-VERIFY ?auto_283868 ?auto_283869 ?auto_283870 ?auto_283867 ?auto_283871 ?auto_283872 ?auto_283873 ?auto_283874 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283880 - DIRECTION
      ?auto_283881 - MODE
      ?auto_283882 - DIRECTION
      ?auto_283879 - MODE
      ?auto_283883 - DIRECTION
      ?auto_283884 - MODE
      ?auto_283885 - DIRECTION
      ?auto_283886 - MODE
    )
    :vars
    (
      ?auto_283887 - INSTRUMENT
      ?auto_283889 - SATELLITE
      ?auto_283890 - DIRECTION
      ?auto_283888 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283887 ?auto_283889 ) ( SUPPORTS ?auto_283887 ?auto_283879 ) ( not ( = ?auto_283882 ?auto_283890 ) ) ( HAVE_IMAGE ?auto_283883 ?auto_283884 ) ( not ( = ?auto_283883 ?auto_283882 ) ) ( not ( = ?auto_283883 ?auto_283890 ) ) ( not ( = ?auto_283884 ?auto_283879 ) ) ( CALIBRATION_TARGET ?auto_283887 ?auto_283890 ) ( POINTING ?auto_283889 ?auto_283880 ) ( not ( = ?auto_283890 ?auto_283880 ) ) ( not ( = ?auto_283882 ?auto_283880 ) ) ( not ( = ?auto_283883 ?auto_283880 ) ) ( ON_BOARD ?auto_283888 ?auto_283889 ) ( POWER_ON ?auto_283888 ) ( not ( = ?auto_283887 ?auto_283888 ) ) ( HAVE_IMAGE ?auto_283880 ?auto_283881 ) ( HAVE_IMAGE ?auto_283885 ?auto_283886 ) ( not ( = ?auto_283880 ?auto_283885 ) ) ( not ( = ?auto_283881 ?auto_283879 ) ) ( not ( = ?auto_283881 ?auto_283884 ) ) ( not ( = ?auto_283881 ?auto_283886 ) ) ( not ( = ?auto_283882 ?auto_283885 ) ) ( not ( = ?auto_283879 ?auto_283886 ) ) ( not ( = ?auto_283883 ?auto_283885 ) ) ( not ( = ?auto_283884 ?auto_283886 ) ) ( not ( = ?auto_283885 ?auto_283890 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283883 ?auto_283884 ?auto_283882 ?auto_283879 )
      ( GET-4IMAGE-VERIFY ?auto_283880 ?auto_283881 ?auto_283882 ?auto_283879 ?auto_283883 ?auto_283884 ?auto_283885 ?auto_283886 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283904 - DIRECTION
      ?auto_283905 - MODE
      ?auto_283906 - DIRECTION
      ?auto_283903 - MODE
      ?auto_283907 - DIRECTION
      ?auto_283908 - MODE
      ?auto_283909 - DIRECTION
      ?auto_283910 - MODE
    )
    :vars
    (
      ?auto_283911 - INSTRUMENT
      ?auto_283913 - SATELLITE
      ?auto_283914 - DIRECTION
      ?auto_283912 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283911 ?auto_283913 ) ( SUPPORTS ?auto_283911 ?auto_283903 ) ( not ( = ?auto_283906 ?auto_283914 ) ) ( HAVE_IMAGE ?auto_283909 ?auto_283910 ) ( not ( = ?auto_283909 ?auto_283906 ) ) ( not ( = ?auto_283909 ?auto_283914 ) ) ( not ( = ?auto_283910 ?auto_283903 ) ) ( CALIBRATION_TARGET ?auto_283911 ?auto_283914 ) ( POINTING ?auto_283913 ?auto_283904 ) ( not ( = ?auto_283914 ?auto_283904 ) ) ( not ( = ?auto_283906 ?auto_283904 ) ) ( not ( = ?auto_283909 ?auto_283904 ) ) ( ON_BOARD ?auto_283912 ?auto_283913 ) ( POWER_ON ?auto_283912 ) ( not ( = ?auto_283911 ?auto_283912 ) ) ( HAVE_IMAGE ?auto_283904 ?auto_283905 ) ( HAVE_IMAGE ?auto_283907 ?auto_283908 ) ( not ( = ?auto_283904 ?auto_283907 ) ) ( not ( = ?auto_283905 ?auto_283903 ) ) ( not ( = ?auto_283905 ?auto_283908 ) ) ( not ( = ?auto_283905 ?auto_283910 ) ) ( not ( = ?auto_283906 ?auto_283907 ) ) ( not ( = ?auto_283903 ?auto_283908 ) ) ( not ( = ?auto_283907 ?auto_283909 ) ) ( not ( = ?auto_283907 ?auto_283914 ) ) ( not ( = ?auto_283908 ?auto_283910 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283909 ?auto_283910 ?auto_283906 ?auto_283903 )
      ( GET-4IMAGE-VERIFY ?auto_283904 ?auto_283905 ?auto_283906 ?auto_283903 ?auto_283907 ?auto_283908 ?auto_283909 ?auto_283910 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283916 - DIRECTION
      ?auto_283917 - MODE
      ?auto_283918 - DIRECTION
      ?auto_283915 - MODE
      ?auto_283919 - DIRECTION
      ?auto_283920 - MODE
      ?auto_283921 - DIRECTION
      ?auto_283922 - MODE
    )
    :vars
    (
      ?auto_283924 - INSTRUMENT
      ?auto_283926 - SATELLITE
      ?auto_283928 - DIRECTION
      ?auto_283923 - DIRECTION
      ?auto_283927 - MODE
      ?auto_283925 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283924 ?auto_283926 ) ( SUPPORTS ?auto_283924 ?auto_283915 ) ( not ( = ?auto_283918 ?auto_283928 ) ) ( HAVE_IMAGE ?auto_283923 ?auto_283927 ) ( not ( = ?auto_283923 ?auto_283918 ) ) ( not ( = ?auto_283923 ?auto_283928 ) ) ( not ( = ?auto_283927 ?auto_283915 ) ) ( CALIBRATION_TARGET ?auto_283924 ?auto_283928 ) ( POINTING ?auto_283926 ?auto_283919 ) ( not ( = ?auto_283928 ?auto_283919 ) ) ( not ( = ?auto_283918 ?auto_283919 ) ) ( not ( = ?auto_283923 ?auto_283919 ) ) ( ON_BOARD ?auto_283925 ?auto_283926 ) ( POWER_ON ?auto_283925 ) ( not ( = ?auto_283924 ?auto_283925 ) ) ( HAVE_IMAGE ?auto_283916 ?auto_283917 ) ( HAVE_IMAGE ?auto_283919 ?auto_283920 ) ( HAVE_IMAGE ?auto_283921 ?auto_283922 ) ( not ( = ?auto_283916 ?auto_283918 ) ) ( not ( = ?auto_283916 ?auto_283919 ) ) ( not ( = ?auto_283916 ?auto_283921 ) ) ( not ( = ?auto_283916 ?auto_283928 ) ) ( not ( = ?auto_283916 ?auto_283923 ) ) ( not ( = ?auto_283917 ?auto_283915 ) ) ( not ( = ?auto_283917 ?auto_283920 ) ) ( not ( = ?auto_283917 ?auto_283922 ) ) ( not ( = ?auto_283917 ?auto_283927 ) ) ( not ( = ?auto_283918 ?auto_283921 ) ) ( not ( = ?auto_283915 ?auto_283920 ) ) ( not ( = ?auto_283915 ?auto_283922 ) ) ( not ( = ?auto_283919 ?auto_283921 ) ) ( not ( = ?auto_283920 ?auto_283922 ) ) ( not ( = ?auto_283920 ?auto_283927 ) ) ( not ( = ?auto_283921 ?auto_283928 ) ) ( not ( = ?auto_283921 ?auto_283923 ) ) ( not ( = ?auto_283922 ?auto_283927 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283923 ?auto_283927 ?auto_283918 ?auto_283915 )
      ( GET-4IMAGE-VERIFY ?auto_283916 ?auto_283917 ?auto_283918 ?auto_283915 ?auto_283919 ?auto_283920 ?auto_283921 ?auto_283922 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283984 - DIRECTION
      ?auto_283985 - MODE
      ?auto_283986 - DIRECTION
      ?auto_283983 - MODE
      ?auto_283987 - DIRECTION
      ?auto_283988 - MODE
      ?auto_283989 - DIRECTION
      ?auto_283990 - MODE
    )
    :vars
    (
      ?auto_283991 - INSTRUMENT
      ?auto_283993 - SATELLITE
      ?auto_283995 - DIRECTION
      ?auto_283994 - DIRECTION
      ?auto_283992 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_283991 ?auto_283993 ) ( SUPPORTS ?auto_283991 ?auto_283985 ) ( not ( = ?auto_283984 ?auto_283995 ) ) ( HAVE_IMAGE ?auto_283987 ?auto_283990 ) ( not ( = ?auto_283987 ?auto_283984 ) ) ( not ( = ?auto_283987 ?auto_283995 ) ) ( not ( = ?auto_283990 ?auto_283985 ) ) ( CALIBRATION_TARGET ?auto_283991 ?auto_283995 ) ( POINTING ?auto_283993 ?auto_283994 ) ( not ( = ?auto_283995 ?auto_283994 ) ) ( not ( = ?auto_283984 ?auto_283994 ) ) ( not ( = ?auto_283987 ?auto_283994 ) ) ( ON_BOARD ?auto_283992 ?auto_283993 ) ( POWER_ON ?auto_283992 ) ( not ( = ?auto_283991 ?auto_283992 ) ) ( HAVE_IMAGE ?auto_283986 ?auto_283983 ) ( HAVE_IMAGE ?auto_283987 ?auto_283988 ) ( HAVE_IMAGE ?auto_283989 ?auto_283990 ) ( not ( = ?auto_283984 ?auto_283986 ) ) ( not ( = ?auto_283984 ?auto_283989 ) ) ( not ( = ?auto_283985 ?auto_283983 ) ) ( not ( = ?auto_283985 ?auto_283988 ) ) ( not ( = ?auto_283986 ?auto_283987 ) ) ( not ( = ?auto_283986 ?auto_283989 ) ) ( not ( = ?auto_283986 ?auto_283995 ) ) ( not ( = ?auto_283986 ?auto_283994 ) ) ( not ( = ?auto_283983 ?auto_283988 ) ) ( not ( = ?auto_283983 ?auto_283990 ) ) ( not ( = ?auto_283987 ?auto_283989 ) ) ( not ( = ?auto_283988 ?auto_283990 ) ) ( not ( = ?auto_283989 ?auto_283995 ) ) ( not ( = ?auto_283989 ?auto_283994 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283987 ?auto_283990 ?auto_283984 ?auto_283985 )
      ( GET-4IMAGE-VERIFY ?auto_283984 ?auto_283985 ?auto_283986 ?auto_283983 ?auto_283987 ?auto_283988 ?auto_283989 ?auto_283990 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_283997 - DIRECTION
      ?auto_283998 - MODE
      ?auto_283999 - DIRECTION
      ?auto_283996 - MODE
      ?auto_284000 - DIRECTION
      ?auto_284001 - MODE
      ?auto_284002 - DIRECTION
      ?auto_284003 - MODE
    )
    :vars
    (
      ?auto_284004 - INSTRUMENT
      ?auto_284006 - SATELLITE
      ?auto_284007 - DIRECTION
      ?auto_284005 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_284004 ?auto_284006 ) ( SUPPORTS ?auto_284004 ?auto_283998 ) ( not ( = ?auto_283997 ?auto_284007 ) ) ( HAVE_IMAGE ?auto_284000 ?auto_284001 ) ( not ( = ?auto_284000 ?auto_283997 ) ) ( not ( = ?auto_284000 ?auto_284007 ) ) ( not ( = ?auto_284001 ?auto_283998 ) ) ( CALIBRATION_TARGET ?auto_284004 ?auto_284007 ) ( POINTING ?auto_284006 ?auto_284002 ) ( not ( = ?auto_284007 ?auto_284002 ) ) ( not ( = ?auto_283997 ?auto_284002 ) ) ( not ( = ?auto_284000 ?auto_284002 ) ) ( ON_BOARD ?auto_284005 ?auto_284006 ) ( POWER_ON ?auto_284005 ) ( not ( = ?auto_284004 ?auto_284005 ) ) ( HAVE_IMAGE ?auto_283999 ?auto_283996 ) ( HAVE_IMAGE ?auto_284002 ?auto_284003 ) ( not ( = ?auto_283997 ?auto_283999 ) ) ( not ( = ?auto_283998 ?auto_283996 ) ) ( not ( = ?auto_283998 ?auto_284003 ) ) ( not ( = ?auto_283999 ?auto_284000 ) ) ( not ( = ?auto_283999 ?auto_284002 ) ) ( not ( = ?auto_283999 ?auto_284007 ) ) ( not ( = ?auto_283996 ?auto_284001 ) ) ( not ( = ?auto_283996 ?auto_284003 ) ) ( not ( = ?auto_284001 ?auto_284003 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_284000 ?auto_284001 ?auto_283997 ?auto_283998 )
      ( GET-4IMAGE-VERIFY ?auto_283997 ?auto_283998 ?auto_283999 ?auto_283996 ?auto_284000 ?auto_284001 ?auto_284002 ?auto_284003 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_284022 - DIRECTION
      ?auto_284023 - MODE
      ?auto_284024 - DIRECTION
      ?auto_284021 - MODE
      ?auto_284025 - DIRECTION
      ?auto_284026 - MODE
      ?auto_284027 - DIRECTION
      ?auto_284028 - MODE
    )
    :vars
    (
      ?auto_284029 - INSTRUMENT
      ?auto_284031 - SATELLITE
      ?auto_284032 - DIRECTION
      ?auto_284030 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_284029 ?auto_284031 ) ( SUPPORTS ?auto_284029 ?auto_284023 ) ( not ( = ?auto_284022 ?auto_284032 ) ) ( HAVE_IMAGE ?auto_284024 ?auto_284028 ) ( not ( = ?auto_284024 ?auto_284022 ) ) ( not ( = ?auto_284024 ?auto_284032 ) ) ( not ( = ?auto_284028 ?auto_284023 ) ) ( CALIBRATION_TARGET ?auto_284029 ?auto_284032 ) ( POINTING ?auto_284031 ?auto_284025 ) ( not ( = ?auto_284032 ?auto_284025 ) ) ( not ( = ?auto_284022 ?auto_284025 ) ) ( not ( = ?auto_284024 ?auto_284025 ) ) ( ON_BOARD ?auto_284030 ?auto_284031 ) ( POWER_ON ?auto_284030 ) ( not ( = ?auto_284029 ?auto_284030 ) ) ( HAVE_IMAGE ?auto_284024 ?auto_284021 ) ( HAVE_IMAGE ?auto_284025 ?auto_284026 ) ( HAVE_IMAGE ?auto_284027 ?auto_284028 ) ( not ( = ?auto_284022 ?auto_284027 ) ) ( not ( = ?auto_284023 ?auto_284021 ) ) ( not ( = ?auto_284023 ?auto_284026 ) ) ( not ( = ?auto_284024 ?auto_284027 ) ) ( not ( = ?auto_284021 ?auto_284026 ) ) ( not ( = ?auto_284021 ?auto_284028 ) ) ( not ( = ?auto_284025 ?auto_284027 ) ) ( not ( = ?auto_284026 ?auto_284028 ) ) ( not ( = ?auto_284027 ?auto_284032 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_284024 ?auto_284028 ?auto_284022 ?auto_284023 )
      ( GET-4IMAGE-VERIFY ?auto_284022 ?auto_284023 ?auto_284024 ?auto_284021 ?auto_284025 ?auto_284026 ?auto_284027 ?auto_284028 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_284034 - DIRECTION
      ?auto_284035 - MODE
      ?auto_284036 - DIRECTION
      ?auto_284033 - MODE
      ?auto_284037 - DIRECTION
      ?auto_284038 - MODE
      ?auto_284039 - DIRECTION
      ?auto_284040 - MODE
    )
    :vars
    (
      ?auto_284041 - INSTRUMENT
      ?auto_284043 - SATELLITE
      ?auto_284044 - DIRECTION
      ?auto_284042 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_284041 ?auto_284043 ) ( SUPPORTS ?auto_284041 ?auto_284035 ) ( not ( = ?auto_284034 ?auto_284044 ) ) ( HAVE_IMAGE ?auto_284036 ?auto_284033 ) ( not ( = ?auto_284036 ?auto_284034 ) ) ( not ( = ?auto_284036 ?auto_284044 ) ) ( not ( = ?auto_284033 ?auto_284035 ) ) ( CALIBRATION_TARGET ?auto_284041 ?auto_284044 ) ( POINTING ?auto_284043 ?auto_284037 ) ( not ( = ?auto_284044 ?auto_284037 ) ) ( not ( = ?auto_284034 ?auto_284037 ) ) ( not ( = ?auto_284036 ?auto_284037 ) ) ( ON_BOARD ?auto_284042 ?auto_284043 ) ( POWER_ON ?auto_284042 ) ( not ( = ?auto_284041 ?auto_284042 ) ) ( HAVE_IMAGE ?auto_284037 ?auto_284038 ) ( HAVE_IMAGE ?auto_284039 ?auto_284040 ) ( not ( = ?auto_284034 ?auto_284039 ) ) ( not ( = ?auto_284035 ?auto_284038 ) ) ( not ( = ?auto_284035 ?auto_284040 ) ) ( not ( = ?auto_284036 ?auto_284039 ) ) ( not ( = ?auto_284033 ?auto_284038 ) ) ( not ( = ?auto_284033 ?auto_284040 ) ) ( not ( = ?auto_284037 ?auto_284039 ) ) ( not ( = ?auto_284038 ?auto_284040 ) ) ( not ( = ?auto_284039 ?auto_284044 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_284036 ?auto_284033 ?auto_284034 ?auto_284035 )
      ( GET-4IMAGE-VERIFY ?auto_284034 ?auto_284035 ?auto_284036 ?auto_284033 ?auto_284037 ?auto_284038 ?auto_284039 ?auto_284040 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_284096 - DIRECTION
      ?auto_284097 - MODE
      ?auto_284098 - DIRECTION
      ?auto_284095 - MODE
      ?auto_284099 - DIRECTION
      ?auto_284100 - MODE
      ?auto_284101 - DIRECTION
      ?auto_284102 - MODE
    )
    :vars
    (
      ?auto_284103 - INSTRUMENT
      ?auto_284105 - SATELLITE
      ?auto_284106 - DIRECTION
      ?auto_284104 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_284103 ?auto_284105 ) ( SUPPORTS ?auto_284103 ?auto_284097 ) ( not ( = ?auto_284096 ?auto_284106 ) ) ( HAVE_IMAGE ?auto_284099 ?auto_284102 ) ( not ( = ?auto_284099 ?auto_284096 ) ) ( not ( = ?auto_284099 ?auto_284106 ) ) ( not ( = ?auto_284102 ?auto_284097 ) ) ( CALIBRATION_TARGET ?auto_284103 ?auto_284106 ) ( POINTING ?auto_284105 ?auto_284098 ) ( not ( = ?auto_284106 ?auto_284098 ) ) ( not ( = ?auto_284096 ?auto_284098 ) ) ( not ( = ?auto_284099 ?auto_284098 ) ) ( ON_BOARD ?auto_284104 ?auto_284105 ) ( POWER_ON ?auto_284104 ) ( not ( = ?auto_284103 ?auto_284104 ) ) ( HAVE_IMAGE ?auto_284098 ?auto_284095 ) ( HAVE_IMAGE ?auto_284099 ?auto_284100 ) ( HAVE_IMAGE ?auto_284101 ?auto_284102 ) ( not ( = ?auto_284096 ?auto_284101 ) ) ( not ( = ?auto_284097 ?auto_284095 ) ) ( not ( = ?auto_284097 ?auto_284100 ) ) ( not ( = ?auto_284098 ?auto_284101 ) ) ( not ( = ?auto_284095 ?auto_284100 ) ) ( not ( = ?auto_284095 ?auto_284102 ) ) ( not ( = ?auto_284099 ?auto_284101 ) ) ( not ( = ?auto_284100 ?auto_284102 ) ) ( not ( = ?auto_284101 ?auto_284106 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_284099 ?auto_284102 ?auto_284096 ?auto_284097 )
      ( GET-4IMAGE-VERIFY ?auto_284096 ?auto_284097 ?auto_284098 ?auto_284095 ?auto_284099 ?auto_284100 ?auto_284101 ?auto_284102 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_284108 - DIRECTION
      ?auto_284109 - MODE
      ?auto_284110 - DIRECTION
      ?auto_284107 - MODE
      ?auto_284111 - DIRECTION
      ?auto_284112 - MODE
      ?auto_284113 - DIRECTION
      ?auto_284114 - MODE
    )
    :vars
    (
      ?auto_284115 - INSTRUMENT
      ?auto_284117 - SATELLITE
      ?auto_284118 - DIRECTION
      ?auto_284116 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_284115 ?auto_284117 ) ( SUPPORTS ?auto_284115 ?auto_284109 ) ( not ( = ?auto_284108 ?auto_284118 ) ) ( HAVE_IMAGE ?auto_284111 ?auto_284112 ) ( not ( = ?auto_284111 ?auto_284108 ) ) ( not ( = ?auto_284111 ?auto_284118 ) ) ( not ( = ?auto_284112 ?auto_284109 ) ) ( CALIBRATION_TARGET ?auto_284115 ?auto_284118 ) ( POINTING ?auto_284117 ?auto_284110 ) ( not ( = ?auto_284118 ?auto_284110 ) ) ( not ( = ?auto_284108 ?auto_284110 ) ) ( not ( = ?auto_284111 ?auto_284110 ) ) ( ON_BOARD ?auto_284116 ?auto_284117 ) ( POWER_ON ?auto_284116 ) ( not ( = ?auto_284115 ?auto_284116 ) ) ( HAVE_IMAGE ?auto_284110 ?auto_284107 ) ( HAVE_IMAGE ?auto_284113 ?auto_284114 ) ( not ( = ?auto_284108 ?auto_284113 ) ) ( not ( = ?auto_284109 ?auto_284107 ) ) ( not ( = ?auto_284109 ?auto_284114 ) ) ( not ( = ?auto_284110 ?auto_284113 ) ) ( not ( = ?auto_284107 ?auto_284112 ) ) ( not ( = ?auto_284107 ?auto_284114 ) ) ( not ( = ?auto_284111 ?auto_284113 ) ) ( not ( = ?auto_284112 ?auto_284114 ) ) ( not ( = ?auto_284113 ?auto_284118 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_284111 ?auto_284112 ?auto_284108 ?auto_284109 )
      ( GET-4IMAGE-VERIFY ?auto_284108 ?auto_284109 ?auto_284110 ?auto_284107 ?auto_284111 ?auto_284112 ?auto_284113 ?auto_284114 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_284132 - DIRECTION
      ?auto_284133 - MODE
      ?auto_284134 - DIRECTION
      ?auto_284131 - MODE
      ?auto_284135 - DIRECTION
      ?auto_284136 - MODE
      ?auto_284137 - DIRECTION
      ?auto_284138 - MODE
    )
    :vars
    (
      ?auto_284139 - INSTRUMENT
      ?auto_284141 - SATELLITE
      ?auto_284142 - DIRECTION
      ?auto_284140 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_284139 ?auto_284141 ) ( SUPPORTS ?auto_284139 ?auto_284133 ) ( not ( = ?auto_284132 ?auto_284142 ) ) ( HAVE_IMAGE ?auto_284137 ?auto_284138 ) ( not ( = ?auto_284137 ?auto_284132 ) ) ( not ( = ?auto_284137 ?auto_284142 ) ) ( not ( = ?auto_284138 ?auto_284133 ) ) ( CALIBRATION_TARGET ?auto_284139 ?auto_284142 ) ( POINTING ?auto_284141 ?auto_284135 ) ( not ( = ?auto_284142 ?auto_284135 ) ) ( not ( = ?auto_284132 ?auto_284135 ) ) ( not ( = ?auto_284137 ?auto_284135 ) ) ( ON_BOARD ?auto_284140 ?auto_284141 ) ( POWER_ON ?auto_284140 ) ( not ( = ?auto_284139 ?auto_284140 ) ) ( HAVE_IMAGE ?auto_284134 ?auto_284131 ) ( HAVE_IMAGE ?auto_284135 ?auto_284136 ) ( not ( = ?auto_284132 ?auto_284134 ) ) ( not ( = ?auto_284133 ?auto_284131 ) ) ( not ( = ?auto_284133 ?auto_284136 ) ) ( not ( = ?auto_284134 ?auto_284135 ) ) ( not ( = ?auto_284134 ?auto_284137 ) ) ( not ( = ?auto_284134 ?auto_284142 ) ) ( not ( = ?auto_284131 ?auto_284136 ) ) ( not ( = ?auto_284131 ?auto_284138 ) ) ( not ( = ?auto_284136 ?auto_284138 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_284137 ?auto_284138 ?auto_284132 ?auto_284133 )
      ( GET-4IMAGE-VERIFY ?auto_284132 ?auto_284133 ?auto_284134 ?auto_284131 ?auto_284135 ?auto_284136 ?auto_284137 ?auto_284138 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_284144 - DIRECTION
      ?auto_284145 - MODE
      ?auto_284146 - DIRECTION
      ?auto_284143 - MODE
      ?auto_284147 - DIRECTION
      ?auto_284148 - MODE
      ?auto_284149 - DIRECTION
      ?auto_284150 - MODE
    )
    :vars
    (
      ?auto_284152 - INSTRUMENT
      ?auto_284154 - SATELLITE
      ?auto_284156 - DIRECTION
      ?auto_284151 - DIRECTION
      ?auto_284155 - MODE
      ?auto_284153 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_284152 ?auto_284154 ) ( SUPPORTS ?auto_284152 ?auto_284145 ) ( not ( = ?auto_284144 ?auto_284156 ) ) ( HAVE_IMAGE ?auto_284151 ?auto_284155 ) ( not ( = ?auto_284151 ?auto_284144 ) ) ( not ( = ?auto_284151 ?auto_284156 ) ) ( not ( = ?auto_284155 ?auto_284145 ) ) ( CALIBRATION_TARGET ?auto_284152 ?auto_284156 ) ( POINTING ?auto_284154 ?auto_284147 ) ( not ( = ?auto_284156 ?auto_284147 ) ) ( not ( = ?auto_284144 ?auto_284147 ) ) ( not ( = ?auto_284151 ?auto_284147 ) ) ( ON_BOARD ?auto_284153 ?auto_284154 ) ( POWER_ON ?auto_284153 ) ( not ( = ?auto_284152 ?auto_284153 ) ) ( HAVE_IMAGE ?auto_284146 ?auto_284143 ) ( HAVE_IMAGE ?auto_284147 ?auto_284148 ) ( HAVE_IMAGE ?auto_284149 ?auto_284150 ) ( not ( = ?auto_284144 ?auto_284146 ) ) ( not ( = ?auto_284144 ?auto_284149 ) ) ( not ( = ?auto_284145 ?auto_284143 ) ) ( not ( = ?auto_284145 ?auto_284148 ) ) ( not ( = ?auto_284145 ?auto_284150 ) ) ( not ( = ?auto_284146 ?auto_284147 ) ) ( not ( = ?auto_284146 ?auto_284149 ) ) ( not ( = ?auto_284146 ?auto_284156 ) ) ( not ( = ?auto_284146 ?auto_284151 ) ) ( not ( = ?auto_284143 ?auto_284148 ) ) ( not ( = ?auto_284143 ?auto_284150 ) ) ( not ( = ?auto_284143 ?auto_284155 ) ) ( not ( = ?auto_284147 ?auto_284149 ) ) ( not ( = ?auto_284148 ?auto_284150 ) ) ( not ( = ?auto_284148 ?auto_284155 ) ) ( not ( = ?auto_284149 ?auto_284156 ) ) ( not ( = ?auto_284149 ?auto_284151 ) ) ( not ( = ?auto_284150 ?auto_284155 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_284151 ?auto_284155 ?auto_284144 ?auto_284145 )
      ( GET-4IMAGE-VERIFY ?auto_284144 ?auto_284145 ?auto_284146 ?auto_284143 ?auto_284147 ?auto_284148 ?auto_284149 ?auto_284150 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_284394 - DIRECTION
      ?auto_284395 - MODE
      ?auto_284396 - DIRECTION
      ?auto_284393 - MODE
      ?auto_284397 - DIRECTION
      ?auto_284398 - MODE
    )
    :vars
    (
      ?auto_284401 - INSTRUMENT
      ?auto_284403 - SATELLITE
      ?auto_284399 - DIRECTION
      ?auto_284402 - DIRECTION
      ?auto_284400 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_284401 ?auto_284403 ) ( SUPPORTS ?auto_284401 ?auto_284393 ) ( not ( = ?auto_284396 ?auto_284399 ) ) ( HAVE_IMAGE ?auto_284394 ?auto_284395 ) ( not ( = ?auto_284394 ?auto_284396 ) ) ( not ( = ?auto_284394 ?auto_284399 ) ) ( not ( = ?auto_284395 ?auto_284393 ) ) ( CALIBRATION_TARGET ?auto_284401 ?auto_284399 ) ( POINTING ?auto_284403 ?auto_284402 ) ( not ( = ?auto_284399 ?auto_284402 ) ) ( not ( = ?auto_284396 ?auto_284402 ) ) ( not ( = ?auto_284394 ?auto_284402 ) ) ( ON_BOARD ?auto_284400 ?auto_284403 ) ( POWER_ON ?auto_284400 ) ( not ( = ?auto_284401 ?auto_284400 ) ) ( HAVE_IMAGE ?auto_284397 ?auto_284398 ) ( not ( = ?auto_284394 ?auto_284397 ) ) ( not ( = ?auto_284395 ?auto_284398 ) ) ( not ( = ?auto_284396 ?auto_284397 ) ) ( not ( = ?auto_284393 ?auto_284398 ) ) ( not ( = ?auto_284397 ?auto_284399 ) ) ( not ( = ?auto_284397 ?auto_284402 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_284394 ?auto_284395 ?auto_284396 ?auto_284393 )
      ( GET-3IMAGE-VERIFY ?auto_284394 ?auto_284395 ?auto_284396 ?auto_284393 ?auto_284397 ?auto_284398 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_284609 - DIRECTION
      ?auto_284610 - MODE
      ?auto_284611 - DIRECTION
      ?auto_284608 - MODE
      ?auto_284612 - DIRECTION
      ?auto_284613 - MODE
      ?auto_284614 - DIRECTION
      ?auto_284615 - MODE
    )
    :vars
    (
      ?auto_284618 - INSTRUMENT
      ?auto_284620 - SATELLITE
      ?auto_284616 - DIRECTION
      ?auto_284619 - DIRECTION
      ?auto_284617 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_284618 ?auto_284620 ) ( SUPPORTS ?auto_284618 ?auto_284613 ) ( not ( = ?auto_284612 ?auto_284616 ) ) ( HAVE_IMAGE ?auto_284614 ?auto_284615 ) ( not ( = ?auto_284614 ?auto_284612 ) ) ( not ( = ?auto_284614 ?auto_284616 ) ) ( not ( = ?auto_284615 ?auto_284613 ) ) ( CALIBRATION_TARGET ?auto_284618 ?auto_284616 ) ( POINTING ?auto_284620 ?auto_284619 ) ( not ( = ?auto_284616 ?auto_284619 ) ) ( not ( = ?auto_284612 ?auto_284619 ) ) ( not ( = ?auto_284614 ?auto_284619 ) ) ( ON_BOARD ?auto_284617 ?auto_284620 ) ( POWER_ON ?auto_284617 ) ( not ( = ?auto_284618 ?auto_284617 ) ) ( HAVE_IMAGE ?auto_284609 ?auto_284610 ) ( HAVE_IMAGE ?auto_284611 ?auto_284608 ) ( not ( = ?auto_284609 ?auto_284611 ) ) ( not ( = ?auto_284609 ?auto_284612 ) ) ( not ( = ?auto_284609 ?auto_284614 ) ) ( not ( = ?auto_284609 ?auto_284616 ) ) ( not ( = ?auto_284609 ?auto_284619 ) ) ( not ( = ?auto_284610 ?auto_284608 ) ) ( not ( = ?auto_284610 ?auto_284613 ) ) ( not ( = ?auto_284610 ?auto_284615 ) ) ( not ( = ?auto_284611 ?auto_284612 ) ) ( not ( = ?auto_284611 ?auto_284614 ) ) ( not ( = ?auto_284611 ?auto_284616 ) ) ( not ( = ?auto_284611 ?auto_284619 ) ) ( not ( = ?auto_284608 ?auto_284613 ) ) ( not ( = ?auto_284608 ?auto_284615 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_284614 ?auto_284615 ?auto_284612 ?auto_284613 )
      ( GET-4IMAGE-VERIFY ?auto_284609 ?auto_284610 ?auto_284611 ?auto_284608 ?auto_284612 ?auto_284613 ?auto_284614 ?auto_284615 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_285061 - DIRECTION
      ?auto_285062 - MODE
      ?auto_285063 - DIRECTION
      ?auto_285060 - MODE
      ?auto_285064 - DIRECTION
      ?auto_285065 - MODE
      ?auto_285066 - DIRECTION
      ?auto_285067 - MODE
    )
    :vars
    (
      ?auto_285070 - INSTRUMENT
      ?auto_285072 - SATELLITE
      ?auto_285068 - DIRECTION
      ?auto_285071 - DIRECTION
      ?auto_285069 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_285070 ?auto_285072 ) ( SUPPORTS ?auto_285070 ?auto_285062 ) ( not ( = ?auto_285061 ?auto_285068 ) ) ( HAVE_IMAGE ?auto_285063 ?auto_285067 ) ( not ( = ?auto_285063 ?auto_285061 ) ) ( not ( = ?auto_285063 ?auto_285068 ) ) ( not ( = ?auto_285067 ?auto_285062 ) ) ( CALIBRATION_TARGET ?auto_285070 ?auto_285068 ) ( POINTING ?auto_285072 ?auto_285071 ) ( not ( = ?auto_285068 ?auto_285071 ) ) ( not ( = ?auto_285061 ?auto_285071 ) ) ( not ( = ?auto_285063 ?auto_285071 ) ) ( ON_BOARD ?auto_285069 ?auto_285072 ) ( POWER_ON ?auto_285069 ) ( not ( = ?auto_285070 ?auto_285069 ) ) ( HAVE_IMAGE ?auto_285063 ?auto_285060 ) ( HAVE_IMAGE ?auto_285064 ?auto_285065 ) ( HAVE_IMAGE ?auto_285066 ?auto_285067 ) ( not ( = ?auto_285061 ?auto_285064 ) ) ( not ( = ?auto_285061 ?auto_285066 ) ) ( not ( = ?auto_285062 ?auto_285060 ) ) ( not ( = ?auto_285062 ?auto_285065 ) ) ( not ( = ?auto_285063 ?auto_285064 ) ) ( not ( = ?auto_285063 ?auto_285066 ) ) ( not ( = ?auto_285060 ?auto_285065 ) ) ( not ( = ?auto_285060 ?auto_285067 ) ) ( not ( = ?auto_285064 ?auto_285066 ) ) ( not ( = ?auto_285064 ?auto_285068 ) ) ( not ( = ?auto_285064 ?auto_285071 ) ) ( not ( = ?auto_285065 ?auto_285067 ) ) ( not ( = ?auto_285066 ?auto_285068 ) ) ( not ( = ?auto_285066 ?auto_285071 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_285063 ?auto_285067 ?auto_285061 ?auto_285062 )
      ( GET-4IMAGE-VERIFY ?auto_285061 ?auto_285062 ?auto_285063 ?auto_285060 ?auto_285064 ?auto_285065 ?auto_285066 ?auto_285067 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_285408 - DIRECTION
      ?auto_285409 - MODE
    )
    :vars
    (
      ?auto_285413 - INSTRUMENT
      ?auto_285415 - SATELLITE
      ?auto_285411 - DIRECTION
      ?auto_285410 - DIRECTION
      ?auto_285416 - MODE
      ?auto_285414 - DIRECTION
      ?auto_285412 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_285413 ?auto_285415 ) ( SUPPORTS ?auto_285413 ?auto_285409 ) ( not ( = ?auto_285408 ?auto_285411 ) ) ( HAVE_IMAGE ?auto_285410 ?auto_285416 ) ( not ( = ?auto_285410 ?auto_285408 ) ) ( not ( = ?auto_285410 ?auto_285411 ) ) ( not ( = ?auto_285416 ?auto_285409 ) ) ( CALIBRATION_TARGET ?auto_285413 ?auto_285411 ) ( not ( = ?auto_285411 ?auto_285414 ) ) ( not ( = ?auto_285408 ?auto_285414 ) ) ( not ( = ?auto_285410 ?auto_285414 ) ) ( ON_BOARD ?auto_285412 ?auto_285415 ) ( POWER_ON ?auto_285412 ) ( not ( = ?auto_285413 ?auto_285412 ) ) ( POINTING ?auto_285415 ?auto_285411 ) )
    :subtasks
    ( ( !TURN_TO ?auto_285415 ?auto_285414 ?auto_285411 )
      ( GET-2IMAGE ?auto_285410 ?auto_285416 ?auto_285408 ?auto_285409 )
      ( GET-1IMAGE-VERIFY ?auto_285408 ?auto_285409 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_285418 - DIRECTION
      ?auto_285419 - MODE
      ?auto_285420 - DIRECTION
      ?auto_285417 - MODE
    )
    :vars
    (
      ?auto_285425 - INSTRUMENT
      ?auto_285423 - SATELLITE
      ?auto_285422 - DIRECTION
      ?auto_285421 - DIRECTION
      ?auto_285424 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_285425 ?auto_285423 ) ( SUPPORTS ?auto_285425 ?auto_285417 ) ( not ( = ?auto_285420 ?auto_285422 ) ) ( HAVE_IMAGE ?auto_285418 ?auto_285419 ) ( not ( = ?auto_285418 ?auto_285420 ) ) ( not ( = ?auto_285418 ?auto_285422 ) ) ( not ( = ?auto_285419 ?auto_285417 ) ) ( CALIBRATION_TARGET ?auto_285425 ?auto_285422 ) ( not ( = ?auto_285422 ?auto_285421 ) ) ( not ( = ?auto_285420 ?auto_285421 ) ) ( not ( = ?auto_285418 ?auto_285421 ) ) ( ON_BOARD ?auto_285424 ?auto_285423 ) ( POWER_ON ?auto_285424 ) ( not ( = ?auto_285425 ?auto_285424 ) ) ( POINTING ?auto_285423 ?auto_285422 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_285420 ?auto_285417 )
      ( GET-2IMAGE-VERIFY ?auto_285418 ?auto_285419 ?auto_285420 ?auto_285417 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_285437 - DIRECTION
      ?auto_285438 - MODE
      ?auto_285439 - DIRECTION
      ?auto_285436 - MODE
    )
    :vars
    (
      ?auto_285441 - INSTRUMENT
      ?auto_285442 - SATELLITE
      ?auto_285444 - DIRECTION
      ?auto_285440 - DIRECTION
      ?auto_285443 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_285441 ?auto_285442 ) ( SUPPORTS ?auto_285441 ?auto_285438 ) ( not ( = ?auto_285437 ?auto_285444 ) ) ( HAVE_IMAGE ?auto_285439 ?auto_285436 ) ( not ( = ?auto_285439 ?auto_285437 ) ) ( not ( = ?auto_285439 ?auto_285444 ) ) ( not ( = ?auto_285436 ?auto_285438 ) ) ( CALIBRATION_TARGET ?auto_285441 ?auto_285444 ) ( not ( = ?auto_285444 ?auto_285440 ) ) ( not ( = ?auto_285437 ?auto_285440 ) ) ( not ( = ?auto_285439 ?auto_285440 ) ) ( ON_BOARD ?auto_285443 ?auto_285442 ) ( POWER_ON ?auto_285443 ) ( not ( = ?auto_285441 ?auto_285443 ) ) ( POINTING ?auto_285442 ?auto_285444 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_285439 ?auto_285436 ?auto_285437 ?auto_285438 )
      ( GET-2IMAGE-VERIFY ?auto_285437 ?auto_285438 ?auto_285439 ?auto_285436 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_317086 - DIRECTION
      ?auto_317087 - MODE
      ?auto_317088 - DIRECTION
      ?auto_317085 - MODE
      ?auto_317089 - DIRECTION
      ?auto_317090 - MODE
    )
    :vars
    (
      ?auto_317092 - INSTRUMENT
      ?auto_317094 - SATELLITE
      ?auto_317093 - DIRECTION
      ?auto_317091 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317092 ?auto_317094 ) ( SUPPORTS ?auto_317092 ?auto_317090 ) ( not ( = ?auto_317089 ?auto_317093 ) ) ( HAVE_IMAGE ?auto_317086 ?auto_317087 ) ( not ( = ?auto_317086 ?auto_317089 ) ) ( not ( = ?auto_317086 ?auto_317093 ) ) ( not ( = ?auto_317087 ?auto_317090 ) ) ( CALIBRATION_TARGET ?auto_317092 ?auto_317093 ) ( not ( = ?auto_317093 ?auto_317088 ) ) ( not ( = ?auto_317089 ?auto_317088 ) ) ( not ( = ?auto_317086 ?auto_317088 ) ) ( ON_BOARD ?auto_317091 ?auto_317094 ) ( POWER_ON ?auto_317091 ) ( not ( = ?auto_317092 ?auto_317091 ) ) ( POINTING ?auto_317094 ?auto_317093 ) ( HAVE_IMAGE ?auto_317088 ?auto_317085 ) ( not ( = ?auto_317087 ?auto_317085 ) ) ( not ( = ?auto_317085 ?auto_317090 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317086 ?auto_317087 ?auto_317089 ?auto_317090 )
      ( GET-3IMAGE-VERIFY ?auto_317086 ?auto_317087 ?auto_317088 ?auto_317085 ?auto_317089 ?auto_317090 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_285488 - DIRECTION
      ?auto_285489 - MODE
      ?auto_285490 - DIRECTION
      ?auto_285487 - MODE
      ?auto_285491 - DIRECTION
      ?auto_285492 - MODE
    )
    :vars
    (
      ?auto_285494 - INSTRUMENT
      ?auto_285495 - SATELLITE
      ?auto_285497 - DIRECTION
      ?auto_285493 - DIRECTION
      ?auto_285496 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_285494 ?auto_285495 ) ( SUPPORTS ?auto_285494 ?auto_285487 ) ( not ( = ?auto_285490 ?auto_285497 ) ) ( HAVE_IMAGE ?auto_285491 ?auto_285489 ) ( not ( = ?auto_285491 ?auto_285490 ) ) ( not ( = ?auto_285491 ?auto_285497 ) ) ( not ( = ?auto_285489 ?auto_285487 ) ) ( CALIBRATION_TARGET ?auto_285494 ?auto_285497 ) ( not ( = ?auto_285497 ?auto_285493 ) ) ( not ( = ?auto_285490 ?auto_285493 ) ) ( not ( = ?auto_285491 ?auto_285493 ) ) ( ON_BOARD ?auto_285496 ?auto_285495 ) ( POWER_ON ?auto_285496 ) ( not ( = ?auto_285494 ?auto_285496 ) ) ( POINTING ?auto_285495 ?auto_285497 ) ( HAVE_IMAGE ?auto_285488 ?auto_285489 ) ( HAVE_IMAGE ?auto_285491 ?auto_285492 ) ( not ( = ?auto_285488 ?auto_285490 ) ) ( not ( = ?auto_285488 ?auto_285491 ) ) ( not ( = ?auto_285488 ?auto_285497 ) ) ( not ( = ?auto_285488 ?auto_285493 ) ) ( not ( = ?auto_285489 ?auto_285492 ) ) ( not ( = ?auto_285487 ?auto_285492 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_285491 ?auto_285489 ?auto_285490 ?auto_285487 )
      ( GET-3IMAGE-VERIFY ?auto_285488 ?auto_285489 ?auto_285490 ?auto_285487 ?auto_285491 ?auto_285492 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_317318 - DIRECTION
      ?auto_317319 - MODE
      ?auto_317320 - DIRECTION
      ?auto_317317 - MODE
      ?auto_317321 - DIRECTION
      ?auto_317322 - MODE
    )
    :vars
    (
      ?auto_317324 - INSTRUMENT
      ?auto_317326 - SATELLITE
      ?auto_317325 - DIRECTION
      ?auto_317323 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317324 ?auto_317326 ) ( SUPPORTS ?auto_317324 ?auto_317319 ) ( not ( = ?auto_317318 ?auto_317325 ) ) ( HAVE_IMAGE ?auto_317320 ?auto_317317 ) ( not ( = ?auto_317320 ?auto_317318 ) ) ( not ( = ?auto_317320 ?auto_317325 ) ) ( not ( = ?auto_317317 ?auto_317319 ) ) ( CALIBRATION_TARGET ?auto_317324 ?auto_317325 ) ( not ( = ?auto_317325 ?auto_317321 ) ) ( not ( = ?auto_317318 ?auto_317321 ) ) ( not ( = ?auto_317320 ?auto_317321 ) ) ( ON_BOARD ?auto_317323 ?auto_317326 ) ( POWER_ON ?auto_317323 ) ( not ( = ?auto_317324 ?auto_317323 ) ) ( POINTING ?auto_317326 ?auto_317325 ) ( HAVE_IMAGE ?auto_317321 ?auto_317322 ) ( not ( = ?auto_317319 ?auto_317322 ) ) ( not ( = ?auto_317317 ?auto_317322 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317320 ?auto_317317 ?auto_317318 ?auto_317319 )
      ( GET-3IMAGE-VERIFY ?auto_317318 ?auto_317319 ?auto_317320 ?auto_317317 ?auto_317321 ?auto_317322 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_285678 - DIRECTION
      ?auto_285679 - MODE
      ?auto_285680 - DIRECTION
      ?auto_285677 - MODE
      ?auto_285681 - DIRECTION
      ?auto_285682 - MODE
      ?auto_285683 - DIRECTION
      ?auto_285684 - MODE
    )
    :vars
    (
      ?auto_285686 - INSTRUMENT
      ?auto_285687 - SATELLITE
      ?auto_285689 - DIRECTION
      ?auto_285685 - DIRECTION
      ?auto_285688 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_285686 ?auto_285687 ) ( SUPPORTS ?auto_285686 ?auto_285684 ) ( not ( = ?auto_285683 ?auto_285689 ) ) ( HAVE_IMAGE ?auto_285680 ?auto_285679 ) ( not ( = ?auto_285680 ?auto_285683 ) ) ( not ( = ?auto_285680 ?auto_285689 ) ) ( not ( = ?auto_285679 ?auto_285684 ) ) ( CALIBRATION_TARGET ?auto_285686 ?auto_285689 ) ( not ( = ?auto_285689 ?auto_285685 ) ) ( not ( = ?auto_285683 ?auto_285685 ) ) ( not ( = ?auto_285680 ?auto_285685 ) ) ( ON_BOARD ?auto_285688 ?auto_285687 ) ( POWER_ON ?auto_285688 ) ( not ( = ?auto_285686 ?auto_285688 ) ) ( POINTING ?auto_285687 ?auto_285689 ) ( HAVE_IMAGE ?auto_285678 ?auto_285679 ) ( HAVE_IMAGE ?auto_285680 ?auto_285677 ) ( HAVE_IMAGE ?auto_285681 ?auto_285682 ) ( not ( = ?auto_285678 ?auto_285680 ) ) ( not ( = ?auto_285678 ?auto_285681 ) ) ( not ( = ?auto_285678 ?auto_285683 ) ) ( not ( = ?auto_285678 ?auto_285689 ) ) ( not ( = ?auto_285678 ?auto_285685 ) ) ( not ( = ?auto_285679 ?auto_285677 ) ) ( not ( = ?auto_285679 ?auto_285682 ) ) ( not ( = ?auto_285680 ?auto_285681 ) ) ( not ( = ?auto_285677 ?auto_285682 ) ) ( not ( = ?auto_285677 ?auto_285684 ) ) ( not ( = ?auto_285681 ?auto_285683 ) ) ( not ( = ?auto_285681 ?auto_285689 ) ) ( not ( = ?auto_285681 ?auto_285685 ) ) ( not ( = ?auto_285682 ?auto_285684 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_285680 ?auto_285679 ?auto_285683 ?auto_285684 )
      ( GET-4IMAGE-VERIFY ?auto_285678 ?auto_285679 ?auto_285680 ?auto_285677 ?auto_285681 ?auto_285682 ?auto_285683 ?auto_285684 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_285703 - DIRECTION
      ?auto_285704 - MODE
      ?auto_285705 - DIRECTION
      ?auto_285702 - MODE
      ?auto_285706 - DIRECTION
      ?auto_285707 - MODE
      ?auto_285708 - DIRECTION
      ?auto_285709 - MODE
    )
    :vars
    (
      ?auto_285711 - INSTRUMENT
      ?auto_285712 - SATELLITE
      ?auto_285714 - DIRECTION
      ?auto_285710 - DIRECTION
      ?auto_285713 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_285711 ?auto_285712 ) ( SUPPORTS ?auto_285711 ?auto_285707 ) ( not ( = ?auto_285706 ?auto_285714 ) ) ( HAVE_IMAGE ?auto_285703 ?auto_285709 ) ( not ( = ?auto_285703 ?auto_285706 ) ) ( not ( = ?auto_285703 ?auto_285714 ) ) ( not ( = ?auto_285709 ?auto_285707 ) ) ( CALIBRATION_TARGET ?auto_285711 ?auto_285714 ) ( not ( = ?auto_285714 ?auto_285710 ) ) ( not ( = ?auto_285706 ?auto_285710 ) ) ( not ( = ?auto_285703 ?auto_285710 ) ) ( ON_BOARD ?auto_285713 ?auto_285712 ) ( POWER_ON ?auto_285713 ) ( not ( = ?auto_285711 ?auto_285713 ) ) ( POINTING ?auto_285712 ?auto_285714 ) ( HAVE_IMAGE ?auto_285703 ?auto_285704 ) ( HAVE_IMAGE ?auto_285705 ?auto_285702 ) ( HAVE_IMAGE ?auto_285708 ?auto_285709 ) ( not ( = ?auto_285703 ?auto_285705 ) ) ( not ( = ?auto_285703 ?auto_285708 ) ) ( not ( = ?auto_285704 ?auto_285702 ) ) ( not ( = ?auto_285704 ?auto_285707 ) ) ( not ( = ?auto_285704 ?auto_285709 ) ) ( not ( = ?auto_285705 ?auto_285706 ) ) ( not ( = ?auto_285705 ?auto_285708 ) ) ( not ( = ?auto_285705 ?auto_285714 ) ) ( not ( = ?auto_285705 ?auto_285710 ) ) ( not ( = ?auto_285702 ?auto_285707 ) ) ( not ( = ?auto_285702 ?auto_285709 ) ) ( not ( = ?auto_285706 ?auto_285708 ) ) ( not ( = ?auto_285708 ?auto_285714 ) ) ( not ( = ?auto_285708 ?auto_285710 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_285703 ?auto_285709 ?auto_285706 ?auto_285707 )
      ( GET-4IMAGE-VERIFY ?auto_285703 ?auto_285704 ?auto_285705 ?auto_285702 ?auto_285706 ?auto_285707 ?auto_285708 ?auto_285709 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_285801 - DIRECTION
      ?auto_285802 - MODE
      ?auto_285803 - DIRECTION
      ?auto_285800 - MODE
      ?auto_285804 - DIRECTION
      ?auto_285805 - MODE
      ?auto_285806 - DIRECTION
      ?auto_285807 - MODE
    )
    :vars
    (
      ?auto_285809 - INSTRUMENT
      ?auto_285810 - SATELLITE
      ?auto_285812 - DIRECTION
      ?auto_285808 - DIRECTION
      ?auto_285811 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_285809 ?auto_285810 ) ( SUPPORTS ?auto_285809 ?auto_285800 ) ( not ( = ?auto_285803 ?auto_285812 ) ) ( HAVE_IMAGE ?auto_285801 ?auto_285807 ) ( not ( = ?auto_285801 ?auto_285803 ) ) ( not ( = ?auto_285801 ?auto_285812 ) ) ( not ( = ?auto_285807 ?auto_285800 ) ) ( CALIBRATION_TARGET ?auto_285809 ?auto_285812 ) ( not ( = ?auto_285812 ?auto_285808 ) ) ( not ( = ?auto_285803 ?auto_285808 ) ) ( not ( = ?auto_285801 ?auto_285808 ) ) ( ON_BOARD ?auto_285811 ?auto_285810 ) ( POWER_ON ?auto_285811 ) ( not ( = ?auto_285809 ?auto_285811 ) ) ( POINTING ?auto_285810 ?auto_285812 ) ( HAVE_IMAGE ?auto_285801 ?auto_285802 ) ( HAVE_IMAGE ?auto_285804 ?auto_285805 ) ( HAVE_IMAGE ?auto_285806 ?auto_285807 ) ( not ( = ?auto_285801 ?auto_285804 ) ) ( not ( = ?auto_285801 ?auto_285806 ) ) ( not ( = ?auto_285802 ?auto_285800 ) ) ( not ( = ?auto_285802 ?auto_285805 ) ) ( not ( = ?auto_285802 ?auto_285807 ) ) ( not ( = ?auto_285803 ?auto_285804 ) ) ( not ( = ?auto_285803 ?auto_285806 ) ) ( not ( = ?auto_285800 ?auto_285805 ) ) ( not ( = ?auto_285804 ?auto_285806 ) ) ( not ( = ?auto_285804 ?auto_285812 ) ) ( not ( = ?auto_285804 ?auto_285808 ) ) ( not ( = ?auto_285805 ?auto_285807 ) ) ( not ( = ?auto_285806 ?auto_285812 ) ) ( not ( = ?auto_285806 ?auto_285808 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_285801 ?auto_285807 ?auto_285803 ?auto_285800 )
      ( GET-4IMAGE-VERIFY ?auto_285801 ?auto_285802 ?auto_285803 ?auto_285800 ?auto_285804 ?auto_285805 ?auto_285806 ?auto_285807 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_286155 - DIRECTION
      ?auto_286156 - MODE
      ?auto_286157 - DIRECTION
      ?auto_286154 - MODE
      ?auto_286158 - DIRECTION
      ?auto_286159 - MODE
      ?auto_286160 - DIRECTION
      ?auto_286161 - MODE
    )
    :vars
    (
      ?auto_286163 - INSTRUMENT
      ?auto_286164 - SATELLITE
      ?auto_286166 - DIRECTION
      ?auto_286162 - DIRECTION
      ?auto_286165 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_286163 ?auto_286164 ) ( SUPPORTS ?auto_286163 ?auto_286156 ) ( not ( = ?auto_286155 ?auto_286166 ) ) ( HAVE_IMAGE ?auto_286157 ?auto_286161 ) ( not ( = ?auto_286157 ?auto_286155 ) ) ( not ( = ?auto_286157 ?auto_286166 ) ) ( not ( = ?auto_286161 ?auto_286156 ) ) ( CALIBRATION_TARGET ?auto_286163 ?auto_286166 ) ( not ( = ?auto_286166 ?auto_286162 ) ) ( not ( = ?auto_286155 ?auto_286162 ) ) ( not ( = ?auto_286157 ?auto_286162 ) ) ( ON_BOARD ?auto_286165 ?auto_286164 ) ( POWER_ON ?auto_286165 ) ( not ( = ?auto_286163 ?auto_286165 ) ) ( POINTING ?auto_286164 ?auto_286166 ) ( HAVE_IMAGE ?auto_286157 ?auto_286154 ) ( HAVE_IMAGE ?auto_286158 ?auto_286159 ) ( HAVE_IMAGE ?auto_286160 ?auto_286161 ) ( not ( = ?auto_286155 ?auto_286158 ) ) ( not ( = ?auto_286155 ?auto_286160 ) ) ( not ( = ?auto_286156 ?auto_286154 ) ) ( not ( = ?auto_286156 ?auto_286159 ) ) ( not ( = ?auto_286157 ?auto_286158 ) ) ( not ( = ?auto_286157 ?auto_286160 ) ) ( not ( = ?auto_286154 ?auto_286159 ) ) ( not ( = ?auto_286154 ?auto_286161 ) ) ( not ( = ?auto_286158 ?auto_286160 ) ) ( not ( = ?auto_286158 ?auto_286166 ) ) ( not ( = ?auto_286158 ?auto_286162 ) ) ( not ( = ?auto_286159 ?auto_286161 ) ) ( not ( = ?auto_286160 ?auto_286166 ) ) ( not ( = ?auto_286160 ?auto_286162 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_286157 ?auto_286161 ?auto_286155 ?auto_286156 )
      ( GET-4IMAGE-VERIFY ?auto_286155 ?auto_286156 ?auto_286157 ?auto_286154 ?auto_286158 ?auto_286159 ?auto_286160 ?auto_286161 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_287652 - DIRECTION
      ?auto_287653 - MODE
      ?auto_287654 - DIRECTION
      ?auto_287651 - MODE
      ?auto_287655 - DIRECTION
      ?auto_287656 - MODE
    )
    :vars
    (
      ?auto_287659 - INSTRUMENT
      ?auto_287657 - SATELLITE
      ?auto_287658 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_287659 ?auto_287657 ) ( SUPPORTS ?auto_287659 ?auto_287651 ) ( POINTING ?auto_287657 ?auto_287658 ) ( not ( = ?auto_287654 ?auto_287658 ) ) ( HAVE_IMAGE ?auto_287655 ?auto_287653 ) ( not ( = ?auto_287655 ?auto_287654 ) ) ( not ( = ?auto_287655 ?auto_287658 ) ) ( not ( = ?auto_287653 ?auto_287651 ) ) ( CALIBRATION_TARGET ?auto_287659 ?auto_287658 ) ( POWER_AVAIL ?auto_287657 ) ( HAVE_IMAGE ?auto_287652 ?auto_287653 ) ( HAVE_IMAGE ?auto_287655 ?auto_287656 ) ( not ( = ?auto_287652 ?auto_287654 ) ) ( not ( = ?auto_287652 ?auto_287655 ) ) ( not ( = ?auto_287652 ?auto_287658 ) ) ( not ( = ?auto_287653 ?auto_287656 ) ) ( not ( = ?auto_287651 ?auto_287656 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_287655 ?auto_287653 ?auto_287654 ?auto_287651 )
      ( GET-3IMAGE-VERIFY ?auto_287652 ?auto_287653 ?auto_287654 ?auto_287651 ?auto_287655 ?auto_287656 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_287929 - DIRECTION
      ?auto_287930 - MODE
      ?auto_287931 - DIRECTION
      ?auto_287928 - MODE
      ?auto_287932 - DIRECTION
      ?auto_287933 - MODE
      ?auto_287934 - DIRECTION
      ?auto_287935 - MODE
    )
    :vars
    (
      ?auto_287938 - INSTRUMENT
      ?auto_287936 - SATELLITE
      ?auto_287937 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_287938 ?auto_287936 ) ( SUPPORTS ?auto_287938 ?auto_287928 ) ( POINTING ?auto_287936 ?auto_287937 ) ( not ( = ?auto_287931 ?auto_287937 ) ) ( HAVE_IMAGE ?auto_287934 ?auto_287933 ) ( not ( = ?auto_287934 ?auto_287931 ) ) ( not ( = ?auto_287934 ?auto_287937 ) ) ( not ( = ?auto_287933 ?auto_287928 ) ) ( CALIBRATION_TARGET ?auto_287938 ?auto_287937 ) ( POWER_AVAIL ?auto_287936 ) ( HAVE_IMAGE ?auto_287929 ?auto_287930 ) ( HAVE_IMAGE ?auto_287932 ?auto_287933 ) ( HAVE_IMAGE ?auto_287934 ?auto_287935 ) ( not ( = ?auto_287929 ?auto_287931 ) ) ( not ( = ?auto_287929 ?auto_287932 ) ) ( not ( = ?auto_287929 ?auto_287934 ) ) ( not ( = ?auto_287929 ?auto_287937 ) ) ( not ( = ?auto_287930 ?auto_287928 ) ) ( not ( = ?auto_287930 ?auto_287933 ) ) ( not ( = ?auto_287930 ?auto_287935 ) ) ( not ( = ?auto_287931 ?auto_287932 ) ) ( not ( = ?auto_287928 ?auto_287935 ) ) ( not ( = ?auto_287932 ?auto_287934 ) ) ( not ( = ?auto_287932 ?auto_287937 ) ) ( not ( = ?auto_287933 ?auto_287935 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_287934 ?auto_287933 ?auto_287931 ?auto_287928 )
      ( GET-4IMAGE-VERIFY ?auto_287929 ?auto_287930 ?auto_287931 ?auto_287928 ?auto_287932 ?auto_287933 ?auto_287934 ?auto_287935 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_288619 - DIRECTION
      ?auto_288620 - MODE
      ?auto_288621 - DIRECTION
      ?auto_288618 - MODE
      ?auto_288622 - DIRECTION
      ?auto_288623 - MODE
    )
    :vars
    (
      ?auto_288626 - INSTRUMENT
      ?auto_288624 - SATELLITE
      ?auto_288625 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_288626 ?auto_288624 ) ( SUPPORTS ?auto_288626 ?auto_288618 ) ( not ( = ?auto_288621 ?auto_288625 ) ) ( HAVE_IMAGE ?auto_288622 ?auto_288620 ) ( not ( = ?auto_288622 ?auto_288621 ) ) ( not ( = ?auto_288622 ?auto_288625 ) ) ( not ( = ?auto_288620 ?auto_288618 ) ) ( CALIBRATION_TARGET ?auto_288626 ?auto_288625 ) ( POWER_AVAIL ?auto_288624 ) ( POINTING ?auto_288624 ?auto_288622 ) ( HAVE_IMAGE ?auto_288619 ?auto_288620 ) ( HAVE_IMAGE ?auto_288622 ?auto_288623 ) ( not ( = ?auto_288619 ?auto_288621 ) ) ( not ( = ?auto_288619 ?auto_288622 ) ) ( not ( = ?auto_288619 ?auto_288625 ) ) ( not ( = ?auto_288620 ?auto_288623 ) ) ( not ( = ?auto_288618 ?auto_288623 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_288622 ?auto_288620 ?auto_288621 ?auto_288618 )
      ( GET-3IMAGE-VERIFY ?auto_288619 ?auto_288620 ?auto_288621 ?auto_288618 ?auto_288622 ?auto_288623 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_288697 - DIRECTION
      ?auto_288698 - MODE
      ?auto_288699 - DIRECTION
      ?auto_288696 - MODE
      ?auto_288700 - DIRECTION
      ?auto_288701 - MODE
    )
    :vars
    (
      ?auto_288704 - INSTRUMENT
      ?auto_288702 - SATELLITE
      ?auto_288703 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_288704 ?auto_288702 ) ( SUPPORTS ?auto_288704 ?auto_288698 ) ( not ( = ?auto_288697 ?auto_288703 ) ) ( HAVE_IMAGE ?auto_288699 ?auto_288696 ) ( not ( = ?auto_288699 ?auto_288697 ) ) ( not ( = ?auto_288699 ?auto_288703 ) ) ( not ( = ?auto_288696 ?auto_288698 ) ) ( CALIBRATION_TARGET ?auto_288704 ?auto_288703 ) ( POWER_AVAIL ?auto_288702 ) ( POINTING ?auto_288702 ?auto_288699 ) ( HAVE_IMAGE ?auto_288700 ?auto_288701 ) ( not ( = ?auto_288697 ?auto_288700 ) ) ( not ( = ?auto_288698 ?auto_288701 ) ) ( not ( = ?auto_288699 ?auto_288700 ) ) ( not ( = ?auto_288696 ?auto_288701 ) ) ( not ( = ?auto_288700 ?auto_288703 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_288699 ?auto_288696 ?auto_288697 ?auto_288698 )
      ( GET-3IMAGE-VERIFY ?auto_288697 ?auto_288698 ?auto_288699 ?auto_288696 ?auto_288700 ?auto_288701 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_288786 - DIRECTION
      ?auto_288787 - MODE
      ?auto_288788 - DIRECTION
      ?auto_288785 - MODE
      ?auto_288789 - DIRECTION
      ?auto_288790 - MODE
      ?auto_288791 - DIRECTION
      ?auto_288792 - MODE
    )
    :vars
    (
      ?auto_288795 - INSTRUMENT
      ?auto_288793 - SATELLITE
      ?auto_288794 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_288795 ?auto_288793 ) ( SUPPORTS ?auto_288795 ?auto_288792 ) ( not ( = ?auto_288791 ?auto_288794 ) ) ( HAVE_IMAGE ?auto_288786 ?auto_288787 ) ( not ( = ?auto_288786 ?auto_288791 ) ) ( not ( = ?auto_288786 ?auto_288794 ) ) ( not ( = ?auto_288787 ?auto_288792 ) ) ( CALIBRATION_TARGET ?auto_288795 ?auto_288794 ) ( POWER_AVAIL ?auto_288793 ) ( POINTING ?auto_288793 ?auto_288786 ) ( HAVE_IMAGE ?auto_288788 ?auto_288785 ) ( HAVE_IMAGE ?auto_288789 ?auto_288790 ) ( not ( = ?auto_288786 ?auto_288788 ) ) ( not ( = ?auto_288786 ?auto_288789 ) ) ( not ( = ?auto_288787 ?auto_288785 ) ) ( not ( = ?auto_288787 ?auto_288790 ) ) ( not ( = ?auto_288788 ?auto_288789 ) ) ( not ( = ?auto_288788 ?auto_288791 ) ) ( not ( = ?auto_288788 ?auto_288794 ) ) ( not ( = ?auto_288785 ?auto_288790 ) ) ( not ( = ?auto_288785 ?auto_288792 ) ) ( not ( = ?auto_288789 ?auto_288791 ) ) ( not ( = ?auto_288789 ?auto_288794 ) ) ( not ( = ?auto_288790 ?auto_288792 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_288786 ?auto_288787 ?auto_288791 ?auto_288792 )
      ( GET-4IMAGE-VERIFY ?auto_288786 ?auto_288787 ?auto_288788 ?auto_288785 ?auto_288789 ?auto_288790 ?auto_288791 ?auto_288792 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_288808 - DIRECTION
      ?auto_288809 - MODE
      ?auto_288810 - DIRECTION
      ?auto_288807 - MODE
      ?auto_288811 - DIRECTION
      ?auto_288812 - MODE
      ?auto_288813 - DIRECTION
      ?auto_288814 - MODE
    )
    :vars
    (
      ?auto_288817 - INSTRUMENT
      ?auto_288815 - SATELLITE
      ?auto_288816 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_288817 ?auto_288815 ) ( SUPPORTS ?auto_288817 ?auto_288812 ) ( not ( = ?auto_288811 ?auto_288816 ) ) ( HAVE_IMAGE ?auto_288808 ?auto_288814 ) ( not ( = ?auto_288808 ?auto_288811 ) ) ( not ( = ?auto_288808 ?auto_288816 ) ) ( not ( = ?auto_288814 ?auto_288812 ) ) ( CALIBRATION_TARGET ?auto_288817 ?auto_288816 ) ( POWER_AVAIL ?auto_288815 ) ( POINTING ?auto_288815 ?auto_288808 ) ( HAVE_IMAGE ?auto_288808 ?auto_288809 ) ( HAVE_IMAGE ?auto_288810 ?auto_288807 ) ( HAVE_IMAGE ?auto_288813 ?auto_288814 ) ( not ( = ?auto_288808 ?auto_288810 ) ) ( not ( = ?auto_288808 ?auto_288813 ) ) ( not ( = ?auto_288809 ?auto_288807 ) ) ( not ( = ?auto_288809 ?auto_288812 ) ) ( not ( = ?auto_288809 ?auto_288814 ) ) ( not ( = ?auto_288810 ?auto_288811 ) ) ( not ( = ?auto_288810 ?auto_288813 ) ) ( not ( = ?auto_288810 ?auto_288816 ) ) ( not ( = ?auto_288807 ?auto_288812 ) ) ( not ( = ?auto_288807 ?auto_288814 ) ) ( not ( = ?auto_288811 ?auto_288813 ) ) ( not ( = ?auto_288813 ?auto_288816 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_288808 ?auto_288814 ?auto_288811 ?auto_288812 )
      ( GET-4IMAGE-VERIFY ?auto_288808 ?auto_288809 ?auto_288810 ?auto_288807 ?auto_288811 ?auto_288812 ?auto_288813 ?auto_288814 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_288896 - DIRECTION
      ?auto_288897 - MODE
      ?auto_288898 - DIRECTION
      ?auto_288895 - MODE
      ?auto_288899 - DIRECTION
      ?auto_288900 - MODE
      ?auto_288901 - DIRECTION
      ?auto_288902 - MODE
    )
    :vars
    (
      ?auto_288905 - INSTRUMENT
      ?auto_288903 - SATELLITE
      ?auto_288904 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_288905 ?auto_288903 ) ( SUPPORTS ?auto_288905 ?auto_288895 ) ( not ( = ?auto_288898 ?auto_288904 ) ) ( HAVE_IMAGE ?auto_288899 ?auto_288897 ) ( not ( = ?auto_288899 ?auto_288898 ) ) ( not ( = ?auto_288899 ?auto_288904 ) ) ( not ( = ?auto_288897 ?auto_288895 ) ) ( CALIBRATION_TARGET ?auto_288905 ?auto_288904 ) ( POWER_AVAIL ?auto_288903 ) ( POINTING ?auto_288903 ?auto_288899 ) ( HAVE_IMAGE ?auto_288896 ?auto_288897 ) ( HAVE_IMAGE ?auto_288899 ?auto_288900 ) ( HAVE_IMAGE ?auto_288901 ?auto_288902 ) ( not ( = ?auto_288896 ?auto_288898 ) ) ( not ( = ?auto_288896 ?auto_288899 ) ) ( not ( = ?auto_288896 ?auto_288901 ) ) ( not ( = ?auto_288896 ?auto_288904 ) ) ( not ( = ?auto_288897 ?auto_288900 ) ) ( not ( = ?auto_288897 ?auto_288902 ) ) ( not ( = ?auto_288898 ?auto_288901 ) ) ( not ( = ?auto_288895 ?auto_288900 ) ) ( not ( = ?auto_288895 ?auto_288902 ) ) ( not ( = ?auto_288899 ?auto_288901 ) ) ( not ( = ?auto_288900 ?auto_288902 ) ) ( not ( = ?auto_288901 ?auto_288904 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_288899 ?auto_288897 ?auto_288898 ?auto_288895 )
      ( GET-4IMAGE-VERIFY ?auto_288896 ?auto_288897 ?auto_288898 ?auto_288895 ?auto_288899 ?auto_288900 ?auto_288901 ?auto_288902 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_289218 - DIRECTION
      ?auto_289219 - MODE
      ?auto_289220 - DIRECTION
      ?auto_289217 - MODE
      ?auto_289221 - DIRECTION
      ?auto_289222 - MODE
      ?auto_289223 - DIRECTION
      ?auto_289224 - MODE
    )
    :vars
    (
      ?auto_289227 - INSTRUMENT
      ?auto_289225 - SATELLITE
      ?auto_289226 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_289227 ?auto_289225 ) ( SUPPORTS ?auto_289227 ?auto_289219 ) ( not ( = ?auto_289218 ?auto_289226 ) ) ( HAVE_IMAGE ?auto_289220 ?auto_289222 ) ( not ( = ?auto_289220 ?auto_289218 ) ) ( not ( = ?auto_289220 ?auto_289226 ) ) ( not ( = ?auto_289222 ?auto_289219 ) ) ( CALIBRATION_TARGET ?auto_289227 ?auto_289226 ) ( POWER_AVAIL ?auto_289225 ) ( POINTING ?auto_289225 ?auto_289220 ) ( HAVE_IMAGE ?auto_289220 ?auto_289217 ) ( HAVE_IMAGE ?auto_289221 ?auto_289222 ) ( HAVE_IMAGE ?auto_289223 ?auto_289224 ) ( not ( = ?auto_289218 ?auto_289221 ) ) ( not ( = ?auto_289218 ?auto_289223 ) ) ( not ( = ?auto_289219 ?auto_289217 ) ) ( not ( = ?auto_289219 ?auto_289224 ) ) ( not ( = ?auto_289220 ?auto_289221 ) ) ( not ( = ?auto_289220 ?auto_289223 ) ) ( not ( = ?auto_289217 ?auto_289222 ) ) ( not ( = ?auto_289217 ?auto_289224 ) ) ( not ( = ?auto_289221 ?auto_289223 ) ) ( not ( = ?auto_289221 ?auto_289226 ) ) ( not ( = ?auto_289222 ?auto_289224 ) ) ( not ( = ?auto_289223 ?auto_289226 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_289220 ?auto_289222 ?auto_289218 ?auto_289219 )
      ( GET-4IMAGE-VERIFY ?auto_289218 ?auto_289219 ?auto_289220 ?auto_289217 ?auto_289221 ?auto_289222 ?auto_289223 ?auto_289224 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_289571 - DIRECTION
      ?auto_289572 - MODE
      ?auto_289573 - DIRECTION
      ?auto_289570 - MODE
      ?auto_289574 - DIRECTION
      ?auto_289575 - MODE
    )
    :vars
    (
      ?auto_289579 - INSTRUMENT
      ?auto_289578 - SATELLITE
      ?auto_289576 - DIRECTION
      ?auto_289577 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_289579 ?auto_289578 ) ( SUPPORTS ?auto_289579 ?auto_289575 ) ( not ( = ?auto_289574 ?auto_289576 ) ) ( HAVE_IMAGE ?auto_289571 ?auto_289570 ) ( not ( = ?auto_289571 ?auto_289574 ) ) ( not ( = ?auto_289571 ?auto_289576 ) ) ( not ( = ?auto_289570 ?auto_289575 ) ) ( CALIBRATION_TARGET ?auto_289579 ?auto_289576 ) ( POINTING ?auto_289578 ?auto_289571 ) ( ON_BOARD ?auto_289577 ?auto_289578 ) ( POWER_ON ?auto_289577 ) ( not ( = ?auto_289579 ?auto_289577 ) ) ( HAVE_IMAGE ?auto_289571 ?auto_289572 ) ( HAVE_IMAGE ?auto_289573 ?auto_289570 ) ( not ( = ?auto_289571 ?auto_289573 ) ) ( not ( = ?auto_289572 ?auto_289570 ) ) ( not ( = ?auto_289572 ?auto_289575 ) ) ( not ( = ?auto_289573 ?auto_289574 ) ) ( not ( = ?auto_289573 ?auto_289576 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_289571 ?auto_289570 ?auto_289574 ?auto_289575 )
      ( GET-3IMAGE-VERIFY ?auto_289571 ?auto_289572 ?auto_289573 ?auto_289570 ?auto_289574 ?auto_289575 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_289677 - DIRECTION
      ?auto_289678 - MODE
      ?auto_289679 - DIRECTION
      ?auto_289676 - MODE
      ?auto_289680 - DIRECTION
      ?auto_289681 - MODE
    )
    :vars
    (
      ?auto_289685 - INSTRUMENT
      ?auto_289684 - SATELLITE
      ?auto_289682 - DIRECTION
      ?auto_289683 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_289685 ?auto_289684 ) ( SUPPORTS ?auto_289685 ?auto_289678 ) ( not ( = ?auto_289677 ?auto_289682 ) ) ( HAVE_IMAGE ?auto_289679 ?auto_289681 ) ( not ( = ?auto_289679 ?auto_289677 ) ) ( not ( = ?auto_289679 ?auto_289682 ) ) ( not ( = ?auto_289681 ?auto_289678 ) ) ( CALIBRATION_TARGET ?auto_289685 ?auto_289682 ) ( POINTING ?auto_289684 ?auto_289679 ) ( ON_BOARD ?auto_289683 ?auto_289684 ) ( POWER_ON ?auto_289683 ) ( not ( = ?auto_289685 ?auto_289683 ) ) ( HAVE_IMAGE ?auto_289679 ?auto_289676 ) ( HAVE_IMAGE ?auto_289680 ?auto_289681 ) ( not ( = ?auto_289677 ?auto_289680 ) ) ( not ( = ?auto_289678 ?auto_289676 ) ) ( not ( = ?auto_289679 ?auto_289680 ) ) ( not ( = ?auto_289676 ?auto_289681 ) ) ( not ( = ?auto_289680 ?auto_289682 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_289679 ?auto_289681 ?auto_289677 ?auto_289678 )
      ( GET-3IMAGE-VERIFY ?auto_289677 ?auto_289678 ?auto_289679 ?auto_289676 ?auto_289680 ?auto_289681 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_289775 - DIRECTION
      ?auto_289776 - MODE
      ?auto_289777 - DIRECTION
      ?auto_289774 - MODE
      ?auto_289778 - DIRECTION
      ?auto_289779 - MODE
      ?auto_289780 - DIRECTION
      ?auto_289781 - MODE
    )
    :vars
    (
      ?auto_289785 - INSTRUMENT
      ?auto_289784 - SATELLITE
      ?auto_289782 - DIRECTION
      ?auto_289783 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_289785 ?auto_289784 ) ( SUPPORTS ?auto_289785 ?auto_289781 ) ( not ( = ?auto_289780 ?auto_289782 ) ) ( HAVE_IMAGE ?auto_289775 ?auto_289774 ) ( not ( = ?auto_289775 ?auto_289780 ) ) ( not ( = ?auto_289775 ?auto_289782 ) ) ( not ( = ?auto_289774 ?auto_289781 ) ) ( CALIBRATION_TARGET ?auto_289785 ?auto_289782 ) ( POINTING ?auto_289784 ?auto_289775 ) ( ON_BOARD ?auto_289783 ?auto_289784 ) ( POWER_ON ?auto_289783 ) ( not ( = ?auto_289785 ?auto_289783 ) ) ( HAVE_IMAGE ?auto_289775 ?auto_289776 ) ( HAVE_IMAGE ?auto_289777 ?auto_289774 ) ( HAVE_IMAGE ?auto_289778 ?auto_289779 ) ( not ( = ?auto_289775 ?auto_289777 ) ) ( not ( = ?auto_289775 ?auto_289778 ) ) ( not ( = ?auto_289776 ?auto_289774 ) ) ( not ( = ?auto_289776 ?auto_289779 ) ) ( not ( = ?auto_289776 ?auto_289781 ) ) ( not ( = ?auto_289777 ?auto_289778 ) ) ( not ( = ?auto_289777 ?auto_289780 ) ) ( not ( = ?auto_289777 ?auto_289782 ) ) ( not ( = ?auto_289774 ?auto_289779 ) ) ( not ( = ?auto_289778 ?auto_289780 ) ) ( not ( = ?auto_289778 ?auto_289782 ) ) ( not ( = ?auto_289779 ?auto_289781 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_289775 ?auto_289774 ?auto_289780 ?auto_289781 )
      ( GET-4IMAGE-VERIFY ?auto_289775 ?auto_289776 ?auto_289777 ?auto_289774 ?auto_289778 ?auto_289779 ?auto_289780 ?auto_289781 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_289799 - DIRECTION
      ?auto_289800 - MODE
      ?auto_289801 - DIRECTION
      ?auto_289798 - MODE
      ?auto_289802 - DIRECTION
      ?auto_289803 - MODE
      ?auto_289804 - DIRECTION
      ?auto_289805 - MODE
    )
    :vars
    (
      ?auto_289809 - INSTRUMENT
      ?auto_289808 - SATELLITE
      ?auto_289806 - DIRECTION
      ?auto_289807 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_289809 ?auto_289808 ) ( SUPPORTS ?auto_289809 ?auto_289803 ) ( not ( = ?auto_289802 ?auto_289806 ) ) ( HAVE_IMAGE ?auto_289799 ?auto_289805 ) ( not ( = ?auto_289799 ?auto_289802 ) ) ( not ( = ?auto_289799 ?auto_289806 ) ) ( not ( = ?auto_289805 ?auto_289803 ) ) ( CALIBRATION_TARGET ?auto_289809 ?auto_289806 ) ( POINTING ?auto_289808 ?auto_289799 ) ( ON_BOARD ?auto_289807 ?auto_289808 ) ( POWER_ON ?auto_289807 ) ( not ( = ?auto_289809 ?auto_289807 ) ) ( HAVE_IMAGE ?auto_289799 ?auto_289800 ) ( HAVE_IMAGE ?auto_289801 ?auto_289798 ) ( HAVE_IMAGE ?auto_289804 ?auto_289805 ) ( not ( = ?auto_289799 ?auto_289801 ) ) ( not ( = ?auto_289799 ?auto_289804 ) ) ( not ( = ?auto_289800 ?auto_289798 ) ) ( not ( = ?auto_289800 ?auto_289803 ) ) ( not ( = ?auto_289800 ?auto_289805 ) ) ( not ( = ?auto_289801 ?auto_289802 ) ) ( not ( = ?auto_289801 ?auto_289804 ) ) ( not ( = ?auto_289801 ?auto_289806 ) ) ( not ( = ?auto_289798 ?auto_289803 ) ) ( not ( = ?auto_289798 ?auto_289805 ) ) ( not ( = ?auto_289802 ?auto_289804 ) ) ( not ( = ?auto_289804 ?auto_289806 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_289799 ?auto_289805 ?auto_289802 ?auto_289803 )
      ( GET-4IMAGE-VERIFY ?auto_289799 ?auto_289800 ?auto_289801 ?auto_289798 ?auto_289802 ?auto_289803 ?auto_289804 ?auto_289805 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_289895 - DIRECTION
      ?auto_289896 - MODE
      ?auto_289897 - DIRECTION
      ?auto_289894 - MODE
      ?auto_289898 - DIRECTION
      ?auto_289899 - MODE
      ?auto_289900 - DIRECTION
      ?auto_289901 - MODE
    )
    :vars
    (
      ?auto_289905 - INSTRUMENT
      ?auto_289904 - SATELLITE
      ?auto_289902 - DIRECTION
      ?auto_289903 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_289905 ?auto_289904 ) ( SUPPORTS ?auto_289905 ?auto_289894 ) ( not ( = ?auto_289897 ?auto_289902 ) ) ( HAVE_IMAGE ?auto_289900 ?auto_289896 ) ( not ( = ?auto_289900 ?auto_289897 ) ) ( not ( = ?auto_289900 ?auto_289902 ) ) ( not ( = ?auto_289896 ?auto_289894 ) ) ( CALIBRATION_TARGET ?auto_289905 ?auto_289902 ) ( POINTING ?auto_289904 ?auto_289900 ) ( ON_BOARD ?auto_289903 ?auto_289904 ) ( POWER_ON ?auto_289903 ) ( not ( = ?auto_289905 ?auto_289903 ) ) ( HAVE_IMAGE ?auto_289895 ?auto_289896 ) ( HAVE_IMAGE ?auto_289898 ?auto_289899 ) ( HAVE_IMAGE ?auto_289900 ?auto_289901 ) ( not ( = ?auto_289895 ?auto_289897 ) ) ( not ( = ?auto_289895 ?auto_289898 ) ) ( not ( = ?auto_289895 ?auto_289900 ) ) ( not ( = ?auto_289895 ?auto_289902 ) ) ( not ( = ?auto_289896 ?auto_289899 ) ) ( not ( = ?auto_289896 ?auto_289901 ) ) ( not ( = ?auto_289897 ?auto_289898 ) ) ( not ( = ?auto_289894 ?auto_289899 ) ) ( not ( = ?auto_289894 ?auto_289901 ) ) ( not ( = ?auto_289898 ?auto_289900 ) ) ( not ( = ?auto_289898 ?auto_289902 ) ) ( not ( = ?auto_289899 ?auto_289901 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_289900 ?auto_289896 ?auto_289897 ?auto_289894 )
      ( GET-4IMAGE-VERIFY ?auto_289895 ?auto_289896 ?auto_289897 ?auto_289894 ?auto_289898 ?auto_289899 ?auto_289900 ?auto_289901 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_290245 - DIRECTION
      ?auto_290246 - MODE
      ?auto_290247 - DIRECTION
      ?auto_290244 - MODE
      ?auto_290248 - DIRECTION
      ?auto_290249 - MODE
      ?auto_290250 - DIRECTION
      ?auto_290251 - MODE
    )
    :vars
    (
      ?auto_290255 - INSTRUMENT
      ?auto_290254 - SATELLITE
      ?auto_290252 - DIRECTION
      ?auto_290253 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_290255 ?auto_290254 ) ( SUPPORTS ?auto_290255 ?auto_290246 ) ( not ( = ?auto_290245 ?auto_290252 ) ) ( HAVE_IMAGE ?auto_290250 ?auto_290244 ) ( not ( = ?auto_290250 ?auto_290245 ) ) ( not ( = ?auto_290250 ?auto_290252 ) ) ( not ( = ?auto_290244 ?auto_290246 ) ) ( CALIBRATION_TARGET ?auto_290255 ?auto_290252 ) ( POINTING ?auto_290254 ?auto_290250 ) ( ON_BOARD ?auto_290253 ?auto_290254 ) ( POWER_ON ?auto_290253 ) ( not ( = ?auto_290255 ?auto_290253 ) ) ( HAVE_IMAGE ?auto_290247 ?auto_290244 ) ( HAVE_IMAGE ?auto_290248 ?auto_290249 ) ( HAVE_IMAGE ?auto_290250 ?auto_290251 ) ( not ( = ?auto_290245 ?auto_290247 ) ) ( not ( = ?auto_290245 ?auto_290248 ) ) ( not ( = ?auto_290246 ?auto_290249 ) ) ( not ( = ?auto_290246 ?auto_290251 ) ) ( not ( = ?auto_290247 ?auto_290248 ) ) ( not ( = ?auto_290247 ?auto_290250 ) ) ( not ( = ?auto_290247 ?auto_290252 ) ) ( not ( = ?auto_290244 ?auto_290249 ) ) ( not ( = ?auto_290244 ?auto_290251 ) ) ( not ( = ?auto_290248 ?auto_290250 ) ) ( not ( = ?auto_290248 ?auto_290252 ) ) ( not ( = ?auto_290249 ?auto_290251 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_290250 ?auto_290244 ?auto_290245 ?auto_290246 )
      ( GET-4IMAGE-VERIFY ?auto_290245 ?auto_290246 ?auto_290247 ?auto_290244 ?auto_290248 ?auto_290249 ?auto_290250 ?auto_290251 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_299411 - DIRECTION
      ?auto_299412 - MODE
      ?auto_299413 - DIRECTION
      ?auto_299410 - MODE
      ?auto_299414 - DIRECTION
      ?auto_299415 - MODE
    )
    :vars
    (
      ?auto_299417 - INSTRUMENT
      ?auto_299418 - SATELLITE
      ?auto_299416 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_299417 ) ( ON_BOARD ?auto_299417 ?auto_299418 ) ( SUPPORTS ?auto_299417 ?auto_299410 ) ( POWER_ON ?auto_299417 ) ( POINTING ?auto_299418 ?auto_299416 ) ( not ( = ?auto_299413 ?auto_299416 ) ) ( HAVE_IMAGE ?auto_299411 ?auto_299415 ) ( not ( = ?auto_299411 ?auto_299413 ) ) ( not ( = ?auto_299411 ?auto_299416 ) ) ( not ( = ?auto_299415 ?auto_299410 ) ) ( HAVE_IMAGE ?auto_299411 ?auto_299412 ) ( HAVE_IMAGE ?auto_299414 ?auto_299415 ) ( not ( = ?auto_299411 ?auto_299414 ) ) ( not ( = ?auto_299412 ?auto_299410 ) ) ( not ( = ?auto_299412 ?auto_299415 ) ) ( not ( = ?auto_299413 ?auto_299414 ) ) ( not ( = ?auto_299414 ?auto_299416 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_299411 ?auto_299415 ?auto_299413 ?auto_299410 )
      ( GET-3IMAGE-VERIFY ?auto_299411 ?auto_299412 ?auto_299413 ?auto_299410 ?auto_299414 ?auto_299415 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_299734 - DIRECTION
      ?auto_299735 - MODE
      ?auto_299736 - DIRECTION
      ?auto_299733 - MODE
      ?auto_299737 - DIRECTION
      ?auto_299738 - MODE
      ?auto_299739 - DIRECTION
      ?auto_299740 - MODE
    )
    :vars
    (
      ?auto_299742 - INSTRUMENT
      ?auto_299743 - SATELLITE
      ?auto_299741 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_299742 ) ( ON_BOARD ?auto_299742 ?auto_299743 ) ( SUPPORTS ?auto_299742 ?auto_299738 ) ( POWER_ON ?auto_299742 ) ( POINTING ?auto_299743 ?auto_299741 ) ( not ( = ?auto_299737 ?auto_299741 ) ) ( HAVE_IMAGE ?auto_299734 ?auto_299740 ) ( not ( = ?auto_299734 ?auto_299737 ) ) ( not ( = ?auto_299734 ?auto_299741 ) ) ( not ( = ?auto_299740 ?auto_299738 ) ) ( HAVE_IMAGE ?auto_299734 ?auto_299735 ) ( HAVE_IMAGE ?auto_299736 ?auto_299733 ) ( HAVE_IMAGE ?auto_299739 ?auto_299740 ) ( not ( = ?auto_299734 ?auto_299736 ) ) ( not ( = ?auto_299734 ?auto_299739 ) ) ( not ( = ?auto_299735 ?auto_299733 ) ) ( not ( = ?auto_299735 ?auto_299738 ) ) ( not ( = ?auto_299735 ?auto_299740 ) ) ( not ( = ?auto_299736 ?auto_299737 ) ) ( not ( = ?auto_299736 ?auto_299739 ) ) ( not ( = ?auto_299736 ?auto_299741 ) ) ( not ( = ?auto_299733 ?auto_299738 ) ) ( not ( = ?auto_299733 ?auto_299740 ) ) ( not ( = ?auto_299737 ?auto_299739 ) ) ( not ( = ?auto_299739 ?auto_299741 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_299734 ?auto_299740 ?auto_299737 ?auto_299738 )
      ( GET-4IMAGE-VERIFY ?auto_299734 ?auto_299735 ?auto_299736 ?auto_299733 ?auto_299737 ?auto_299738 ?auto_299739 ?auto_299740 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_299745 - DIRECTION
      ?auto_299746 - MODE
      ?auto_299747 - DIRECTION
      ?auto_299744 - MODE
      ?auto_299748 - DIRECTION
      ?auto_299749 - MODE
      ?auto_299750 - DIRECTION
      ?auto_299751 - MODE
    )
    :vars
    (
      ?auto_299753 - INSTRUMENT
      ?auto_299754 - SATELLITE
      ?auto_299752 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_299753 ) ( ON_BOARD ?auto_299753 ?auto_299754 ) ( SUPPORTS ?auto_299753 ?auto_299749 ) ( POWER_ON ?auto_299753 ) ( POINTING ?auto_299754 ?auto_299752 ) ( not ( = ?auto_299748 ?auto_299752 ) ) ( HAVE_IMAGE ?auto_299745 ?auto_299744 ) ( not ( = ?auto_299745 ?auto_299748 ) ) ( not ( = ?auto_299745 ?auto_299752 ) ) ( not ( = ?auto_299744 ?auto_299749 ) ) ( HAVE_IMAGE ?auto_299745 ?auto_299746 ) ( HAVE_IMAGE ?auto_299747 ?auto_299744 ) ( HAVE_IMAGE ?auto_299750 ?auto_299751 ) ( not ( = ?auto_299745 ?auto_299747 ) ) ( not ( = ?auto_299745 ?auto_299750 ) ) ( not ( = ?auto_299746 ?auto_299744 ) ) ( not ( = ?auto_299746 ?auto_299749 ) ) ( not ( = ?auto_299746 ?auto_299751 ) ) ( not ( = ?auto_299747 ?auto_299748 ) ) ( not ( = ?auto_299747 ?auto_299750 ) ) ( not ( = ?auto_299747 ?auto_299752 ) ) ( not ( = ?auto_299744 ?auto_299751 ) ) ( not ( = ?auto_299748 ?auto_299750 ) ) ( not ( = ?auto_299749 ?auto_299751 ) ) ( not ( = ?auto_299750 ?auto_299752 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_299745 ?auto_299744 ?auto_299748 ?auto_299749 )
      ( GET-4IMAGE-VERIFY ?auto_299745 ?auto_299746 ?auto_299747 ?auto_299744 ?auto_299748 ?auto_299749 ?auto_299750 ?auto_299751 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_300005 - DIRECTION
      ?auto_300006 - MODE
      ?auto_300007 - DIRECTION
      ?auto_300004 - MODE
      ?auto_300008 - DIRECTION
      ?auto_300009 - MODE
      ?auto_300010 - DIRECTION
      ?auto_300011 - MODE
    )
    :vars
    (
      ?auto_300013 - INSTRUMENT
      ?auto_300014 - SATELLITE
      ?auto_300012 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_300013 ) ( ON_BOARD ?auto_300013 ?auto_300014 ) ( SUPPORTS ?auto_300013 ?auto_300004 ) ( POWER_ON ?auto_300013 ) ( POINTING ?auto_300014 ?auto_300012 ) ( not ( = ?auto_300007 ?auto_300012 ) ) ( HAVE_IMAGE ?auto_300005 ?auto_300011 ) ( not ( = ?auto_300005 ?auto_300007 ) ) ( not ( = ?auto_300005 ?auto_300012 ) ) ( not ( = ?auto_300011 ?auto_300004 ) ) ( HAVE_IMAGE ?auto_300005 ?auto_300006 ) ( HAVE_IMAGE ?auto_300008 ?auto_300009 ) ( HAVE_IMAGE ?auto_300010 ?auto_300011 ) ( not ( = ?auto_300005 ?auto_300008 ) ) ( not ( = ?auto_300005 ?auto_300010 ) ) ( not ( = ?auto_300006 ?auto_300004 ) ) ( not ( = ?auto_300006 ?auto_300009 ) ) ( not ( = ?auto_300006 ?auto_300011 ) ) ( not ( = ?auto_300007 ?auto_300008 ) ) ( not ( = ?auto_300007 ?auto_300010 ) ) ( not ( = ?auto_300004 ?auto_300009 ) ) ( not ( = ?auto_300008 ?auto_300010 ) ) ( not ( = ?auto_300008 ?auto_300012 ) ) ( not ( = ?auto_300009 ?auto_300011 ) ) ( not ( = ?auto_300010 ?auto_300012 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_300005 ?auto_300011 ?auto_300007 ?auto_300004 )
      ( GET-4IMAGE-VERIFY ?auto_300005 ?auto_300006 ?auto_300007 ?auto_300004 ?auto_300008 ?auto_300009 ?auto_300010 ?auto_300011 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_300329 - DIRECTION
      ?auto_300330 - MODE
      ?auto_300331 - DIRECTION
      ?auto_300328 - MODE
      ?auto_300332 - DIRECTION
      ?auto_300333 - MODE
      ?auto_300334 - DIRECTION
      ?auto_300335 - MODE
    )
    :vars
    (
      ?auto_300337 - INSTRUMENT
      ?auto_300338 - SATELLITE
      ?auto_300336 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_300337 ) ( ON_BOARD ?auto_300337 ?auto_300338 ) ( SUPPORTS ?auto_300337 ?auto_300328 ) ( POWER_ON ?auto_300337 ) ( POINTING ?auto_300338 ?auto_300336 ) ( not ( = ?auto_300331 ?auto_300336 ) ) ( HAVE_IMAGE ?auto_300332 ?auto_300335 ) ( not ( = ?auto_300332 ?auto_300331 ) ) ( not ( = ?auto_300332 ?auto_300336 ) ) ( not ( = ?auto_300335 ?auto_300328 ) ) ( HAVE_IMAGE ?auto_300329 ?auto_300330 ) ( HAVE_IMAGE ?auto_300332 ?auto_300333 ) ( HAVE_IMAGE ?auto_300334 ?auto_300335 ) ( not ( = ?auto_300329 ?auto_300331 ) ) ( not ( = ?auto_300329 ?auto_300332 ) ) ( not ( = ?auto_300329 ?auto_300334 ) ) ( not ( = ?auto_300329 ?auto_300336 ) ) ( not ( = ?auto_300330 ?auto_300328 ) ) ( not ( = ?auto_300330 ?auto_300333 ) ) ( not ( = ?auto_300330 ?auto_300335 ) ) ( not ( = ?auto_300331 ?auto_300334 ) ) ( not ( = ?auto_300328 ?auto_300333 ) ) ( not ( = ?auto_300332 ?auto_300334 ) ) ( not ( = ?auto_300333 ?auto_300335 ) ) ( not ( = ?auto_300334 ?auto_300336 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_300332 ?auto_300335 ?auto_300331 ?auto_300328 )
      ( GET-4IMAGE-VERIFY ?auto_300329 ?auto_300330 ?auto_300331 ?auto_300328 ?auto_300332 ?auto_300333 ?auto_300334 ?auto_300335 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_300547 - DIRECTION
      ?auto_300548 - MODE
      ?auto_300549 - DIRECTION
      ?auto_300546 - MODE
      ?auto_300550 - DIRECTION
      ?auto_300551 - MODE
      ?auto_300552 - DIRECTION
      ?auto_300553 - MODE
    )
    :vars
    (
      ?auto_300555 - INSTRUMENT
      ?auto_300556 - SATELLITE
      ?auto_300554 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_300555 ) ( ON_BOARD ?auto_300555 ?auto_300556 ) ( SUPPORTS ?auto_300555 ?auto_300551 ) ( POWER_ON ?auto_300555 ) ( POINTING ?auto_300556 ?auto_300554 ) ( not ( = ?auto_300550 ?auto_300554 ) ) ( HAVE_IMAGE ?auto_300549 ?auto_300553 ) ( not ( = ?auto_300549 ?auto_300550 ) ) ( not ( = ?auto_300549 ?auto_300554 ) ) ( not ( = ?auto_300553 ?auto_300551 ) ) ( HAVE_IMAGE ?auto_300547 ?auto_300548 ) ( HAVE_IMAGE ?auto_300549 ?auto_300546 ) ( HAVE_IMAGE ?auto_300552 ?auto_300553 ) ( not ( = ?auto_300547 ?auto_300549 ) ) ( not ( = ?auto_300547 ?auto_300550 ) ) ( not ( = ?auto_300547 ?auto_300552 ) ) ( not ( = ?auto_300547 ?auto_300554 ) ) ( not ( = ?auto_300548 ?auto_300546 ) ) ( not ( = ?auto_300548 ?auto_300551 ) ) ( not ( = ?auto_300548 ?auto_300553 ) ) ( not ( = ?auto_300549 ?auto_300552 ) ) ( not ( = ?auto_300546 ?auto_300551 ) ) ( not ( = ?auto_300546 ?auto_300553 ) ) ( not ( = ?auto_300550 ?auto_300552 ) ) ( not ( = ?auto_300552 ?auto_300554 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_300549 ?auto_300553 ?auto_300550 ?auto_300551 )
      ( GET-4IMAGE-VERIFY ?auto_300547 ?auto_300548 ?auto_300549 ?auto_300546 ?auto_300550 ?auto_300551 ?auto_300552 ?auto_300553 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_301730 - DIRECTION
      ?auto_301731 - MODE
      ?auto_301732 - DIRECTION
      ?auto_301729 - MODE
      ?auto_301733 - DIRECTION
      ?auto_301734 - MODE
    )
    :vars
    (
      ?auto_301736 - INSTRUMENT
      ?auto_301737 - SATELLITE
      ?auto_301735 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_301736 ?auto_301737 ) ( SUPPORTS ?auto_301736 ?auto_301734 ) ( POWER_ON ?auto_301736 ) ( POINTING ?auto_301737 ?auto_301735 ) ( not ( = ?auto_301733 ?auto_301735 ) ) ( HAVE_IMAGE ?auto_301730 ?auto_301729 ) ( not ( = ?auto_301730 ?auto_301733 ) ) ( not ( = ?auto_301730 ?auto_301735 ) ) ( not ( = ?auto_301729 ?auto_301734 ) ) ( CALIBRATION_TARGET ?auto_301736 ?auto_301735 ) ( NOT_CALIBRATED ?auto_301736 ) ( HAVE_IMAGE ?auto_301730 ?auto_301731 ) ( HAVE_IMAGE ?auto_301732 ?auto_301729 ) ( not ( = ?auto_301730 ?auto_301732 ) ) ( not ( = ?auto_301731 ?auto_301729 ) ) ( not ( = ?auto_301731 ?auto_301734 ) ) ( not ( = ?auto_301732 ?auto_301733 ) ) ( not ( = ?auto_301732 ?auto_301735 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_301730 ?auto_301729 ?auto_301733 ?auto_301734 )
      ( GET-3IMAGE-VERIFY ?auto_301730 ?auto_301731 ?auto_301732 ?auto_301729 ?auto_301733 ?auto_301734 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_301763 - DIRECTION
      ?auto_301764 - MODE
      ?auto_301765 - DIRECTION
      ?auto_301762 - MODE
      ?auto_301766 - DIRECTION
      ?auto_301767 - MODE
    )
    :vars
    (
      ?auto_301769 - INSTRUMENT
      ?auto_301770 - SATELLITE
      ?auto_301768 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_301769 ?auto_301770 ) ( SUPPORTS ?auto_301769 ?auto_301762 ) ( POWER_ON ?auto_301769 ) ( POINTING ?auto_301770 ?auto_301768 ) ( not ( = ?auto_301765 ?auto_301768 ) ) ( HAVE_IMAGE ?auto_301763 ?auto_301764 ) ( not ( = ?auto_301763 ?auto_301765 ) ) ( not ( = ?auto_301763 ?auto_301768 ) ) ( not ( = ?auto_301764 ?auto_301762 ) ) ( CALIBRATION_TARGET ?auto_301769 ?auto_301768 ) ( NOT_CALIBRATED ?auto_301769 ) ( HAVE_IMAGE ?auto_301766 ?auto_301767 ) ( not ( = ?auto_301763 ?auto_301766 ) ) ( not ( = ?auto_301764 ?auto_301767 ) ) ( not ( = ?auto_301765 ?auto_301766 ) ) ( not ( = ?auto_301762 ?auto_301767 ) ) ( not ( = ?auto_301766 ?auto_301768 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_301763 ?auto_301764 ?auto_301765 ?auto_301762 )
      ( GET-3IMAGE-VERIFY ?auto_301763 ?auto_301764 ?auto_301765 ?auto_301762 ?auto_301766 ?auto_301767 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_301901 - DIRECTION
      ?auto_301902 - MODE
      ?auto_301903 - DIRECTION
      ?auto_301900 - MODE
      ?auto_301904 - DIRECTION
      ?auto_301905 - MODE
    )
    :vars
    (
      ?auto_301907 - INSTRUMENT
      ?auto_301908 - SATELLITE
      ?auto_301906 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_301907 ?auto_301908 ) ( SUPPORTS ?auto_301907 ?auto_301902 ) ( POWER_ON ?auto_301907 ) ( POINTING ?auto_301908 ?auto_301906 ) ( not ( = ?auto_301901 ?auto_301906 ) ) ( HAVE_IMAGE ?auto_301903 ?auto_301905 ) ( not ( = ?auto_301903 ?auto_301901 ) ) ( not ( = ?auto_301903 ?auto_301906 ) ) ( not ( = ?auto_301905 ?auto_301902 ) ) ( CALIBRATION_TARGET ?auto_301907 ?auto_301906 ) ( NOT_CALIBRATED ?auto_301907 ) ( HAVE_IMAGE ?auto_301903 ?auto_301900 ) ( HAVE_IMAGE ?auto_301904 ?auto_301905 ) ( not ( = ?auto_301901 ?auto_301904 ) ) ( not ( = ?auto_301902 ?auto_301900 ) ) ( not ( = ?auto_301903 ?auto_301904 ) ) ( not ( = ?auto_301900 ?auto_301905 ) ) ( not ( = ?auto_301904 ?auto_301906 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_301903 ?auto_301905 ?auto_301901 ?auto_301902 )
      ( GET-3IMAGE-VERIFY ?auto_301901 ?auto_301902 ?auto_301903 ?auto_301900 ?auto_301904 ?auto_301905 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_301910 - DIRECTION
      ?auto_301911 - MODE
      ?auto_301912 - DIRECTION
      ?auto_301909 - MODE
      ?auto_301913 - DIRECTION
      ?auto_301914 - MODE
    )
    :vars
    (
      ?auto_301916 - INSTRUMENT
      ?auto_301917 - SATELLITE
      ?auto_301915 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_301916 ?auto_301917 ) ( SUPPORTS ?auto_301916 ?auto_301911 ) ( POWER_ON ?auto_301916 ) ( POINTING ?auto_301917 ?auto_301915 ) ( not ( = ?auto_301910 ?auto_301915 ) ) ( HAVE_IMAGE ?auto_301912 ?auto_301909 ) ( not ( = ?auto_301912 ?auto_301910 ) ) ( not ( = ?auto_301912 ?auto_301915 ) ) ( not ( = ?auto_301909 ?auto_301911 ) ) ( CALIBRATION_TARGET ?auto_301916 ?auto_301915 ) ( NOT_CALIBRATED ?auto_301916 ) ( HAVE_IMAGE ?auto_301913 ?auto_301914 ) ( not ( = ?auto_301910 ?auto_301913 ) ) ( not ( = ?auto_301911 ?auto_301914 ) ) ( not ( = ?auto_301912 ?auto_301913 ) ) ( not ( = ?auto_301909 ?auto_301914 ) ) ( not ( = ?auto_301913 ?auto_301915 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_301912 ?auto_301909 ?auto_301910 ?auto_301911 )
      ( GET-3IMAGE-VERIFY ?auto_301910 ?auto_301911 ?auto_301912 ?auto_301909 ?auto_301913 ?auto_301914 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_302077 - DIRECTION
      ?auto_302078 - MODE
      ?auto_302079 - DIRECTION
      ?auto_302076 - MODE
      ?auto_302080 - DIRECTION
      ?auto_302081 - MODE
      ?auto_302082 - DIRECTION
      ?auto_302083 - MODE
    )
    :vars
    (
      ?auto_302085 - INSTRUMENT
      ?auto_302086 - SATELLITE
      ?auto_302084 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_302085 ?auto_302086 ) ( SUPPORTS ?auto_302085 ?auto_302081 ) ( POWER_ON ?auto_302085 ) ( POINTING ?auto_302086 ?auto_302084 ) ( not ( = ?auto_302080 ?auto_302084 ) ) ( HAVE_IMAGE ?auto_302077 ?auto_302083 ) ( not ( = ?auto_302077 ?auto_302080 ) ) ( not ( = ?auto_302077 ?auto_302084 ) ) ( not ( = ?auto_302083 ?auto_302081 ) ) ( CALIBRATION_TARGET ?auto_302085 ?auto_302084 ) ( NOT_CALIBRATED ?auto_302085 ) ( HAVE_IMAGE ?auto_302077 ?auto_302078 ) ( HAVE_IMAGE ?auto_302079 ?auto_302076 ) ( HAVE_IMAGE ?auto_302082 ?auto_302083 ) ( not ( = ?auto_302077 ?auto_302079 ) ) ( not ( = ?auto_302077 ?auto_302082 ) ) ( not ( = ?auto_302078 ?auto_302076 ) ) ( not ( = ?auto_302078 ?auto_302081 ) ) ( not ( = ?auto_302078 ?auto_302083 ) ) ( not ( = ?auto_302079 ?auto_302080 ) ) ( not ( = ?auto_302079 ?auto_302082 ) ) ( not ( = ?auto_302079 ?auto_302084 ) ) ( not ( = ?auto_302076 ?auto_302081 ) ) ( not ( = ?auto_302076 ?auto_302083 ) ) ( not ( = ?auto_302080 ?auto_302082 ) ) ( not ( = ?auto_302082 ?auto_302084 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_302077 ?auto_302083 ?auto_302080 ?auto_302081 )
      ( GET-4IMAGE-VERIFY ?auto_302077 ?auto_302078 ?auto_302079 ?auto_302076 ?auto_302080 ?auto_302081 ?auto_302082 ?auto_302083 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_302263 - DIRECTION
      ?auto_302264 - MODE
      ?auto_302265 - DIRECTION
      ?auto_302262 - MODE
      ?auto_302266 - DIRECTION
      ?auto_302267 - MODE
      ?auto_302268 - DIRECTION
      ?auto_302269 - MODE
    )
    :vars
    (
      ?auto_302271 - INSTRUMENT
      ?auto_302272 - SATELLITE
      ?auto_302270 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_302271 ?auto_302272 ) ( SUPPORTS ?auto_302271 ?auto_302262 ) ( POWER_ON ?auto_302271 ) ( POINTING ?auto_302272 ?auto_302270 ) ( not ( = ?auto_302265 ?auto_302270 ) ) ( HAVE_IMAGE ?auto_302263 ?auto_302269 ) ( not ( = ?auto_302263 ?auto_302265 ) ) ( not ( = ?auto_302263 ?auto_302270 ) ) ( not ( = ?auto_302269 ?auto_302262 ) ) ( CALIBRATION_TARGET ?auto_302271 ?auto_302270 ) ( NOT_CALIBRATED ?auto_302271 ) ( HAVE_IMAGE ?auto_302263 ?auto_302264 ) ( HAVE_IMAGE ?auto_302266 ?auto_302267 ) ( HAVE_IMAGE ?auto_302268 ?auto_302269 ) ( not ( = ?auto_302263 ?auto_302266 ) ) ( not ( = ?auto_302263 ?auto_302268 ) ) ( not ( = ?auto_302264 ?auto_302262 ) ) ( not ( = ?auto_302264 ?auto_302267 ) ) ( not ( = ?auto_302264 ?auto_302269 ) ) ( not ( = ?auto_302265 ?auto_302266 ) ) ( not ( = ?auto_302265 ?auto_302268 ) ) ( not ( = ?auto_302262 ?auto_302267 ) ) ( not ( = ?auto_302266 ?auto_302268 ) ) ( not ( = ?auto_302266 ?auto_302270 ) ) ( not ( = ?auto_302267 ?auto_302269 ) ) ( not ( = ?auto_302268 ?auto_302270 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_302263 ?auto_302269 ?auto_302265 ?auto_302262 )
      ( GET-4IMAGE-VERIFY ?auto_302263 ?auto_302264 ?auto_302265 ?auto_302262 ?auto_302266 ?auto_302267 ?auto_302268 ?auto_302269 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_302672 - DIRECTION
      ?auto_302673 - MODE
      ?auto_302674 - DIRECTION
      ?auto_302671 - MODE
      ?auto_302675 - DIRECTION
      ?auto_302676 - MODE
      ?auto_302677 - DIRECTION
      ?auto_302678 - MODE
    )
    :vars
    (
      ?auto_302680 - INSTRUMENT
      ?auto_302681 - SATELLITE
      ?auto_302679 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_302680 ?auto_302681 ) ( SUPPORTS ?auto_302680 ?auto_302671 ) ( POWER_ON ?auto_302680 ) ( POINTING ?auto_302681 ?auto_302679 ) ( not ( = ?auto_302674 ?auto_302679 ) ) ( HAVE_IMAGE ?auto_302677 ?auto_302676 ) ( not ( = ?auto_302677 ?auto_302674 ) ) ( not ( = ?auto_302677 ?auto_302679 ) ) ( not ( = ?auto_302676 ?auto_302671 ) ) ( CALIBRATION_TARGET ?auto_302680 ?auto_302679 ) ( NOT_CALIBRATED ?auto_302680 ) ( HAVE_IMAGE ?auto_302672 ?auto_302673 ) ( HAVE_IMAGE ?auto_302675 ?auto_302676 ) ( HAVE_IMAGE ?auto_302677 ?auto_302678 ) ( not ( = ?auto_302672 ?auto_302674 ) ) ( not ( = ?auto_302672 ?auto_302675 ) ) ( not ( = ?auto_302672 ?auto_302677 ) ) ( not ( = ?auto_302672 ?auto_302679 ) ) ( not ( = ?auto_302673 ?auto_302671 ) ) ( not ( = ?auto_302673 ?auto_302676 ) ) ( not ( = ?auto_302673 ?auto_302678 ) ) ( not ( = ?auto_302674 ?auto_302675 ) ) ( not ( = ?auto_302671 ?auto_302678 ) ) ( not ( = ?auto_302675 ?auto_302677 ) ) ( not ( = ?auto_302675 ?auto_302679 ) ) ( not ( = ?auto_302676 ?auto_302678 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_302677 ?auto_302676 ?auto_302674 ?auto_302671 )
      ( GET-4IMAGE-VERIFY ?auto_302672 ?auto_302673 ?auto_302674 ?auto_302671 ?auto_302675 ?auto_302676 ?auto_302677 ?auto_302678 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_302890 - DIRECTION
      ?auto_302891 - MODE
      ?auto_302892 - DIRECTION
      ?auto_302889 - MODE
      ?auto_302893 - DIRECTION
      ?auto_302894 - MODE
      ?auto_302895 - DIRECTION
      ?auto_302896 - MODE
    )
    :vars
    (
      ?auto_302898 - INSTRUMENT
      ?auto_302899 - SATELLITE
      ?auto_302897 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_302898 ?auto_302899 ) ( SUPPORTS ?auto_302898 ?auto_302894 ) ( POWER_ON ?auto_302898 ) ( POINTING ?auto_302899 ?auto_302897 ) ( not ( = ?auto_302893 ?auto_302897 ) ) ( HAVE_IMAGE ?auto_302892 ?auto_302896 ) ( not ( = ?auto_302892 ?auto_302893 ) ) ( not ( = ?auto_302892 ?auto_302897 ) ) ( not ( = ?auto_302896 ?auto_302894 ) ) ( CALIBRATION_TARGET ?auto_302898 ?auto_302897 ) ( NOT_CALIBRATED ?auto_302898 ) ( HAVE_IMAGE ?auto_302890 ?auto_302891 ) ( HAVE_IMAGE ?auto_302892 ?auto_302889 ) ( HAVE_IMAGE ?auto_302895 ?auto_302896 ) ( not ( = ?auto_302890 ?auto_302892 ) ) ( not ( = ?auto_302890 ?auto_302893 ) ) ( not ( = ?auto_302890 ?auto_302895 ) ) ( not ( = ?auto_302890 ?auto_302897 ) ) ( not ( = ?auto_302891 ?auto_302889 ) ) ( not ( = ?auto_302891 ?auto_302894 ) ) ( not ( = ?auto_302891 ?auto_302896 ) ) ( not ( = ?auto_302892 ?auto_302895 ) ) ( not ( = ?auto_302889 ?auto_302894 ) ) ( not ( = ?auto_302889 ?auto_302896 ) ) ( not ( = ?auto_302893 ?auto_302895 ) ) ( not ( = ?auto_302895 ?auto_302897 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_302892 ?auto_302896 ?auto_302893 ?auto_302894 )
      ( GET-4IMAGE-VERIFY ?auto_302890 ?auto_302891 ?auto_302892 ?auto_302889 ?auto_302893 ?auto_302894 ?auto_302895 ?auto_302896 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_303287 - DIRECTION
      ?auto_303288 - MODE
      ?auto_303289 - DIRECTION
      ?auto_303286 - MODE
      ?auto_303290 - DIRECTION
      ?auto_303291 - MODE
      ?auto_303292 - DIRECTION
      ?auto_303293 - MODE
    )
    :vars
    (
      ?auto_303295 - INSTRUMENT
      ?auto_303296 - SATELLITE
      ?auto_303294 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_303295 ?auto_303296 ) ( SUPPORTS ?auto_303295 ?auto_303288 ) ( POWER_ON ?auto_303295 ) ( POINTING ?auto_303296 ?auto_303294 ) ( not ( = ?auto_303287 ?auto_303294 ) ) ( HAVE_IMAGE ?auto_303289 ?auto_303291 ) ( not ( = ?auto_303289 ?auto_303287 ) ) ( not ( = ?auto_303289 ?auto_303294 ) ) ( not ( = ?auto_303291 ?auto_303288 ) ) ( CALIBRATION_TARGET ?auto_303295 ?auto_303294 ) ( NOT_CALIBRATED ?auto_303295 ) ( HAVE_IMAGE ?auto_303289 ?auto_303286 ) ( HAVE_IMAGE ?auto_303290 ?auto_303291 ) ( HAVE_IMAGE ?auto_303292 ?auto_303293 ) ( not ( = ?auto_303287 ?auto_303290 ) ) ( not ( = ?auto_303287 ?auto_303292 ) ) ( not ( = ?auto_303288 ?auto_303286 ) ) ( not ( = ?auto_303288 ?auto_303293 ) ) ( not ( = ?auto_303289 ?auto_303290 ) ) ( not ( = ?auto_303289 ?auto_303292 ) ) ( not ( = ?auto_303286 ?auto_303291 ) ) ( not ( = ?auto_303286 ?auto_303293 ) ) ( not ( = ?auto_303290 ?auto_303292 ) ) ( not ( = ?auto_303290 ?auto_303294 ) ) ( not ( = ?auto_303291 ?auto_303293 ) ) ( not ( = ?auto_303292 ?auto_303294 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_303289 ?auto_303291 ?auto_303287 ?auto_303288 )
      ( GET-4IMAGE-VERIFY ?auto_303287 ?auto_303288 ?auto_303289 ?auto_303286 ?auto_303290 ?auto_303291 ?auto_303292 ?auto_303293 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_303457 - DIRECTION
      ?auto_303458 - MODE
      ?auto_303459 - DIRECTION
      ?auto_303456 - MODE
      ?auto_303460 - DIRECTION
      ?auto_303461 - MODE
      ?auto_303462 - DIRECTION
      ?auto_303463 - MODE
    )
    :vars
    (
      ?auto_303465 - INSTRUMENT
      ?auto_303466 - SATELLITE
      ?auto_303464 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_303465 ?auto_303466 ) ( SUPPORTS ?auto_303465 ?auto_303458 ) ( POWER_ON ?auto_303465 ) ( POINTING ?auto_303466 ?auto_303464 ) ( not ( = ?auto_303457 ?auto_303464 ) ) ( HAVE_IMAGE ?auto_303462 ?auto_303461 ) ( not ( = ?auto_303462 ?auto_303457 ) ) ( not ( = ?auto_303462 ?auto_303464 ) ) ( not ( = ?auto_303461 ?auto_303458 ) ) ( CALIBRATION_TARGET ?auto_303465 ?auto_303464 ) ( NOT_CALIBRATED ?auto_303465 ) ( HAVE_IMAGE ?auto_303459 ?auto_303456 ) ( HAVE_IMAGE ?auto_303460 ?auto_303461 ) ( HAVE_IMAGE ?auto_303462 ?auto_303463 ) ( not ( = ?auto_303457 ?auto_303459 ) ) ( not ( = ?auto_303457 ?auto_303460 ) ) ( not ( = ?auto_303458 ?auto_303456 ) ) ( not ( = ?auto_303458 ?auto_303463 ) ) ( not ( = ?auto_303459 ?auto_303460 ) ) ( not ( = ?auto_303459 ?auto_303462 ) ) ( not ( = ?auto_303459 ?auto_303464 ) ) ( not ( = ?auto_303456 ?auto_303461 ) ) ( not ( = ?auto_303456 ?auto_303463 ) ) ( not ( = ?auto_303460 ?auto_303462 ) ) ( not ( = ?auto_303460 ?auto_303464 ) ) ( not ( = ?auto_303461 ?auto_303463 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_303462 ?auto_303461 ?auto_303457 ?auto_303458 )
      ( GET-4IMAGE-VERIFY ?auto_303457 ?auto_303458 ?auto_303459 ?auto_303456 ?auto_303460 ?auto_303461 ?auto_303462 ?auto_303463 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_304073 - DIRECTION
      ?auto_304074 - MODE
      ?auto_304075 - DIRECTION
      ?auto_304072 - MODE
      ?auto_304076 - DIRECTION
      ?auto_304077 - MODE
    )
    :vars
    (
      ?auto_304080 - INSTRUMENT
      ?auto_304078 - SATELLITE
      ?auto_304079 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_304080 ?auto_304078 ) ( SUPPORTS ?auto_304080 ?auto_304077 ) ( POINTING ?auto_304078 ?auto_304079 ) ( not ( = ?auto_304076 ?auto_304079 ) ) ( HAVE_IMAGE ?auto_304075 ?auto_304072 ) ( not ( = ?auto_304075 ?auto_304076 ) ) ( not ( = ?auto_304075 ?auto_304079 ) ) ( not ( = ?auto_304072 ?auto_304077 ) ) ( CALIBRATION_TARGET ?auto_304080 ?auto_304079 ) ( POWER_AVAIL ?auto_304078 ) ( HAVE_IMAGE ?auto_304073 ?auto_304074 ) ( not ( = ?auto_304073 ?auto_304075 ) ) ( not ( = ?auto_304073 ?auto_304076 ) ) ( not ( = ?auto_304073 ?auto_304079 ) ) ( not ( = ?auto_304074 ?auto_304072 ) ) ( not ( = ?auto_304074 ?auto_304077 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_304075 ?auto_304072 ?auto_304076 ?auto_304077 )
      ( GET-3IMAGE-VERIFY ?auto_304073 ?auto_304074 ?auto_304075 ?auto_304072 ?auto_304076 ?auto_304077 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_304238 - DIRECTION
      ?auto_304239 - MODE
      ?auto_304240 - DIRECTION
      ?auto_304237 - MODE
      ?auto_304241 - DIRECTION
      ?auto_304242 - MODE
    )
    :vars
    (
      ?auto_304245 - INSTRUMENT
      ?auto_304243 - SATELLITE
      ?auto_304244 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_304245 ?auto_304243 ) ( SUPPORTS ?auto_304245 ?auto_304239 ) ( POINTING ?auto_304243 ?auto_304244 ) ( not ( = ?auto_304238 ?auto_304244 ) ) ( HAVE_IMAGE ?auto_304241 ?auto_304237 ) ( not ( = ?auto_304241 ?auto_304238 ) ) ( not ( = ?auto_304241 ?auto_304244 ) ) ( not ( = ?auto_304237 ?auto_304239 ) ) ( CALIBRATION_TARGET ?auto_304245 ?auto_304244 ) ( POWER_AVAIL ?auto_304243 ) ( HAVE_IMAGE ?auto_304240 ?auto_304237 ) ( HAVE_IMAGE ?auto_304241 ?auto_304242 ) ( not ( = ?auto_304238 ?auto_304240 ) ) ( not ( = ?auto_304239 ?auto_304242 ) ) ( not ( = ?auto_304240 ?auto_304241 ) ) ( not ( = ?auto_304240 ?auto_304244 ) ) ( not ( = ?auto_304237 ?auto_304242 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_304241 ?auto_304237 ?auto_304238 ?auto_304239 )
      ( GET-3IMAGE-VERIFY ?auto_304238 ?auto_304239 ?auto_304240 ?auto_304237 ?auto_304241 ?auto_304242 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_304458 - DIRECTION
      ?auto_304459 - MODE
      ?auto_304460 - DIRECTION
      ?auto_304457 - MODE
      ?auto_304461 - DIRECTION
      ?auto_304462 - MODE
      ?auto_304463 - DIRECTION
      ?auto_304464 - MODE
    )
    :vars
    (
      ?auto_304467 - INSTRUMENT
      ?auto_304465 - SATELLITE
      ?auto_304466 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_304467 ?auto_304465 ) ( SUPPORTS ?auto_304467 ?auto_304464 ) ( POINTING ?auto_304465 ?auto_304466 ) ( not ( = ?auto_304463 ?auto_304466 ) ) ( HAVE_IMAGE ?auto_304461 ?auto_304459 ) ( not ( = ?auto_304461 ?auto_304463 ) ) ( not ( = ?auto_304461 ?auto_304466 ) ) ( not ( = ?auto_304459 ?auto_304464 ) ) ( CALIBRATION_TARGET ?auto_304467 ?auto_304466 ) ( POWER_AVAIL ?auto_304465 ) ( HAVE_IMAGE ?auto_304458 ?auto_304459 ) ( HAVE_IMAGE ?auto_304460 ?auto_304457 ) ( HAVE_IMAGE ?auto_304461 ?auto_304462 ) ( not ( = ?auto_304458 ?auto_304460 ) ) ( not ( = ?auto_304458 ?auto_304461 ) ) ( not ( = ?auto_304458 ?auto_304463 ) ) ( not ( = ?auto_304458 ?auto_304466 ) ) ( not ( = ?auto_304459 ?auto_304457 ) ) ( not ( = ?auto_304459 ?auto_304462 ) ) ( not ( = ?auto_304460 ?auto_304461 ) ) ( not ( = ?auto_304460 ?auto_304463 ) ) ( not ( = ?auto_304460 ?auto_304466 ) ) ( not ( = ?auto_304457 ?auto_304462 ) ) ( not ( = ?auto_304457 ?auto_304464 ) ) ( not ( = ?auto_304462 ?auto_304464 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_304461 ?auto_304459 ?auto_304463 ?auto_304464 )
      ( GET-4IMAGE-VERIFY ?auto_304458 ?auto_304459 ?auto_304460 ?auto_304457 ?auto_304461 ?auto_304462 ?auto_304463 ?auto_304464 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_304488 - DIRECTION
      ?auto_304489 - MODE
      ?auto_304490 - DIRECTION
      ?auto_304487 - MODE
      ?auto_304491 - DIRECTION
      ?auto_304492 - MODE
      ?auto_304493 - DIRECTION
      ?auto_304494 - MODE
    )
    :vars
    (
      ?auto_304497 - INSTRUMENT
      ?auto_304495 - SATELLITE
      ?auto_304496 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_304497 ?auto_304495 ) ( SUPPORTS ?auto_304497 ?auto_304492 ) ( POINTING ?auto_304495 ?auto_304496 ) ( not ( = ?auto_304491 ?auto_304496 ) ) ( HAVE_IMAGE ?auto_304493 ?auto_304489 ) ( not ( = ?auto_304493 ?auto_304491 ) ) ( not ( = ?auto_304493 ?auto_304496 ) ) ( not ( = ?auto_304489 ?auto_304492 ) ) ( CALIBRATION_TARGET ?auto_304497 ?auto_304496 ) ( POWER_AVAIL ?auto_304495 ) ( HAVE_IMAGE ?auto_304488 ?auto_304489 ) ( HAVE_IMAGE ?auto_304490 ?auto_304487 ) ( HAVE_IMAGE ?auto_304493 ?auto_304494 ) ( not ( = ?auto_304488 ?auto_304490 ) ) ( not ( = ?auto_304488 ?auto_304491 ) ) ( not ( = ?auto_304488 ?auto_304493 ) ) ( not ( = ?auto_304488 ?auto_304496 ) ) ( not ( = ?auto_304489 ?auto_304487 ) ) ( not ( = ?auto_304489 ?auto_304494 ) ) ( not ( = ?auto_304490 ?auto_304491 ) ) ( not ( = ?auto_304490 ?auto_304493 ) ) ( not ( = ?auto_304490 ?auto_304496 ) ) ( not ( = ?auto_304487 ?auto_304492 ) ) ( not ( = ?auto_304487 ?auto_304494 ) ) ( not ( = ?auto_304492 ?auto_304494 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_304493 ?auto_304489 ?auto_304491 ?auto_304492 )
      ( GET-4IMAGE-VERIFY ?auto_304488 ?auto_304489 ?auto_304490 ?auto_304487 ?auto_304491 ?auto_304492 ?auto_304493 ?auto_304494 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_305668 - DIRECTION
      ?auto_305669 - MODE
      ?auto_305670 - DIRECTION
      ?auto_305667 - MODE
      ?auto_305671 - DIRECTION
      ?auto_305672 - MODE
      ?auto_305673 - DIRECTION
      ?auto_305674 - MODE
    )
    :vars
    (
      ?auto_305677 - INSTRUMENT
      ?auto_305675 - SATELLITE
      ?auto_305676 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_305677 ?auto_305675 ) ( SUPPORTS ?auto_305677 ?auto_305669 ) ( POINTING ?auto_305675 ?auto_305676 ) ( not ( = ?auto_305668 ?auto_305676 ) ) ( HAVE_IMAGE ?auto_305673 ?auto_305667 ) ( not ( = ?auto_305673 ?auto_305668 ) ) ( not ( = ?auto_305673 ?auto_305676 ) ) ( not ( = ?auto_305667 ?auto_305669 ) ) ( CALIBRATION_TARGET ?auto_305677 ?auto_305676 ) ( POWER_AVAIL ?auto_305675 ) ( HAVE_IMAGE ?auto_305670 ?auto_305667 ) ( HAVE_IMAGE ?auto_305671 ?auto_305672 ) ( HAVE_IMAGE ?auto_305673 ?auto_305674 ) ( not ( = ?auto_305668 ?auto_305670 ) ) ( not ( = ?auto_305668 ?auto_305671 ) ) ( not ( = ?auto_305669 ?auto_305672 ) ) ( not ( = ?auto_305669 ?auto_305674 ) ) ( not ( = ?auto_305670 ?auto_305671 ) ) ( not ( = ?auto_305670 ?auto_305673 ) ) ( not ( = ?auto_305670 ?auto_305676 ) ) ( not ( = ?auto_305667 ?auto_305672 ) ) ( not ( = ?auto_305667 ?auto_305674 ) ) ( not ( = ?auto_305671 ?auto_305673 ) ) ( not ( = ?auto_305671 ?auto_305676 ) ) ( not ( = ?auto_305672 ?auto_305674 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_305673 ?auto_305667 ?auto_305668 ?auto_305669 )
      ( GET-4IMAGE-VERIFY ?auto_305668 ?auto_305669 ?auto_305670 ?auto_305667 ?auto_305671 ?auto_305672 ?auto_305673 ?auto_305674 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_305709 - DIRECTION
      ?auto_305710 - MODE
      ?auto_305711 - DIRECTION
      ?auto_305708 - MODE
      ?auto_305712 - DIRECTION
      ?auto_305713 - MODE
      ?auto_305714 - DIRECTION
      ?auto_305715 - MODE
    )
    :vars
    (
      ?auto_305718 - INSTRUMENT
      ?auto_305716 - SATELLITE
      ?auto_305717 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_305718 ?auto_305716 ) ( SUPPORTS ?auto_305718 ?auto_305710 ) ( POINTING ?auto_305716 ?auto_305717 ) ( not ( = ?auto_305709 ?auto_305717 ) ) ( HAVE_IMAGE ?auto_305711 ?auto_305715 ) ( not ( = ?auto_305711 ?auto_305709 ) ) ( not ( = ?auto_305711 ?auto_305717 ) ) ( not ( = ?auto_305715 ?auto_305710 ) ) ( CALIBRATION_TARGET ?auto_305718 ?auto_305717 ) ( POWER_AVAIL ?auto_305716 ) ( HAVE_IMAGE ?auto_305711 ?auto_305708 ) ( HAVE_IMAGE ?auto_305712 ?auto_305713 ) ( HAVE_IMAGE ?auto_305714 ?auto_305715 ) ( not ( = ?auto_305709 ?auto_305712 ) ) ( not ( = ?auto_305709 ?auto_305714 ) ) ( not ( = ?auto_305710 ?auto_305708 ) ) ( not ( = ?auto_305710 ?auto_305713 ) ) ( not ( = ?auto_305711 ?auto_305712 ) ) ( not ( = ?auto_305711 ?auto_305714 ) ) ( not ( = ?auto_305708 ?auto_305713 ) ) ( not ( = ?auto_305708 ?auto_305715 ) ) ( not ( = ?auto_305712 ?auto_305714 ) ) ( not ( = ?auto_305712 ?auto_305717 ) ) ( not ( = ?auto_305713 ?auto_305715 ) ) ( not ( = ?auto_305714 ?auto_305717 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_305711 ?auto_305715 ?auto_305709 ?auto_305710 )
      ( GET-4IMAGE-VERIFY ?auto_305709 ?auto_305710 ?auto_305711 ?auto_305708 ?auto_305712 ?auto_305713 ?auto_305714 ?auto_305715 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_306424 - DIRECTION
      ?auto_306425 - MODE
      ?auto_306426 - DIRECTION
      ?auto_306423 - MODE
      ?auto_306427 - DIRECTION
      ?auto_306428 - MODE
    )
    :vars
    (
      ?auto_306430 - INSTRUMENT
      ?auto_306429 - SATELLITE
      ?auto_306431 - DIRECTION
      ?auto_306432 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_306430 ?auto_306429 ) ( SUPPORTS ?auto_306430 ?auto_306428 ) ( not ( = ?auto_306427 ?auto_306431 ) ) ( HAVE_IMAGE ?auto_306424 ?auto_306425 ) ( not ( = ?auto_306424 ?auto_306427 ) ) ( not ( = ?auto_306424 ?auto_306431 ) ) ( not ( = ?auto_306425 ?auto_306428 ) ) ( CALIBRATION_TARGET ?auto_306430 ?auto_306431 ) ( POWER_AVAIL ?auto_306429 ) ( POINTING ?auto_306429 ?auto_306432 ) ( not ( = ?auto_306431 ?auto_306432 ) ) ( not ( = ?auto_306427 ?auto_306432 ) ) ( not ( = ?auto_306424 ?auto_306432 ) ) ( HAVE_IMAGE ?auto_306426 ?auto_306423 ) ( not ( = ?auto_306424 ?auto_306426 ) ) ( not ( = ?auto_306425 ?auto_306423 ) ) ( not ( = ?auto_306426 ?auto_306427 ) ) ( not ( = ?auto_306426 ?auto_306431 ) ) ( not ( = ?auto_306426 ?auto_306432 ) ) ( not ( = ?auto_306423 ?auto_306428 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306424 ?auto_306425 ?auto_306427 ?auto_306428 )
      ( GET-3IMAGE-VERIFY ?auto_306424 ?auto_306425 ?auto_306426 ?auto_306423 ?auto_306427 ?auto_306428 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_306449 - DIRECTION
      ?auto_306450 - MODE
      ?auto_306451 - DIRECTION
      ?auto_306448 - MODE
      ?auto_306452 - DIRECTION
      ?auto_306453 - MODE
    )
    :vars
    (
      ?auto_306455 - INSTRUMENT
      ?auto_306454 - SATELLITE
      ?auto_306456 - DIRECTION
      ?auto_306457 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_306455 ?auto_306454 ) ( SUPPORTS ?auto_306455 ?auto_306448 ) ( not ( = ?auto_306451 ?auto_306456 ) ) ( HAVE_IMAGE ?auto_306449 ?auto_306450 ) ( not ( = ?auto_306449 ?auto_306451 ) ) ( not ( = ?auto_306449 ?auto_306456 ) ) ( not ( = ?auto_306450 ?auto_306448 ) ) ( CALIBRATION_TARGET ?auto_306455 ?auto_306456 ) ( POWER_AVAIL ?auto_306454 ) ( POINTING ?auto_306454 ?auto_306457 ) ( not ( = ?auto_306456 ?auto_306457 ) ) ( not ( = ?auto_306451 ?auto_306457 ) ) ( not ( = ?auto_306449 ?auto_306457 ) ) ( HAVE_IMAGE ?auto_306452 ?auto_306453 ) ( not ( = ?auto_306449 ?auto_306452 ) ) ( not ( = ?auto_306450 ?auto_306453 ) ) ( not ( = ?auto_306451 ?auto_306452 ) ) ( not ( = ?auto_306448 ?auto_306453 ) ) ( not ( = ?auto_306452 ?auto_306456 ) ) ( not ( = ?auto_306452 ?auto_306457 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306449 ?auto_306450 ?auto_306451 ?auto_306448 )
      ( GET-3IMAGE-VERIFY ?auto_306449 ?auto_306450 ?auto_306451 ?auto_306448 ?auto_306452 ?auto_306453 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_306490 - DIRECTION
      ?auto_306491 - MODE
      ?auto_306492 - DIRECTION
      ?auto_306489 - MODE
      ?auto_306493 - DIRECTION
      ?auto_306494 - MODE
    )
    :vars
    (
      ?auto_306498 - INSTRUMENT
      ?auto_306497 - SATELLITE
      ?auto_306499 - DIRECTION
      ?auto_306495 - DIRECTION
      ?auto_306496 - MODE
      ?auto_306500 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_306498 ?auto_306497 ) ( SUPPORTS ?auto_306498 ?auto_306494 ) ( not ( = ?auto_306493 ?auto_306499 ) ) ( HAVE_IMAGE ?auto_306495 ?auto_306496 ) ( not ( = ?auto_306495 ?auto_306493 ) ) ( not ( = ?auto_306495 ?auto_306499 ) ) ( not ( = ?auto_306496 ?auto_306494 ) ) ( CALIBRATION_TARGET ?auto_306498 ?auto_306499 ) ( POWER_AVAIL ?auto_306497 ) ( POINTING ?auto_306497 ?auto_306500 ) ( not ( = ?auto_306499 ?auto_306500 ) ) ( not ( = ?auto_306493 ?auto_306500 ) ) ( not ( = ?auto_306495 ?auto_306500 ) ) ( HAVE_IMAGE ?auto_306490 ?auto_306491 ) ( HAVE_IMAGE ?auto_306492 ?auto_306489 ) ( not ( = ?auto_306490 ?auto_306492 ) ) ( not ( = ?auto_306490 ?auto_306493 ) ) ( not ( = ?auto_306490 ?auto_306499 ) ) ( not ( = ?auto_306490 ?auto_306495 ) ) ( not ( = ?auto_306490 ?auto_306500 ) ) ( not ( = ?auto_306491 ?auto_306489 ) ) ( not ( = ?auto_306491 ?auto_306494 ) ) ( not ( = ?auto_306491 ?auto_306496 ) ) ( not ( = ?auto_306492 ?auto_306493 ) ) ( not ( = ?auto_306492 ?auto_306499 ) ) ( not ( = ?auto_306492 ?auto_306495 ) ) ( not ( = ?auto_306492 ?auto_306500 ) ) ( not ( = ?auto_306489 ?auto_306494 ) ) ( not ( = ?auto_306489 ?auto_306496 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306495 ?auto_306496 ?auto_306493 ?auto_306494 )
      ( GET-3IMAGE-VERIFY ?auto_306490 ?auto_306491 ?auto_306492 ?auto_306489 ?auto_306493 ?auto_306494 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_306514 - DIRECTION
      ?auto_306515 - MODE
      ?auto_306516 - DIRECTION
      ?auto_306513 - MODE
      ?auto_306517 - DIRECTION
      ?auto_306518 - MODE
    )
    :vars
    (
      ?auto_306522 - INSTRUMENT
      ?auto_306521 - SATELLITE
      ?auto_306523 - DIRECTION
      ?auto_306519 - DIRECTION
      ?auto_306520 - MODE
      ?auto_306524 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_306522 ?auto_306521 ) ( SUPPORTS ?auto_306522 ?auto_306513 ) ( not ( = ?auto_306516 ?auto_306523 ) ) ( HAVE_IMAGE ?auto_306519 ?auto_306520 ) ( not ( = ?auto_306519 ?auto_306516 ) ) ( not ( = ?auto_306519 ?auto_306523 ) ) ( not ( = ?auto_306520 ?auto_306513 ) ) ( CALIBRATION_TARGET ?auto_306522 ?auto_306523 ) ( POWER_AVAIL ?auto_306521 ) ( POINTING ?auto_306521 ?auto_306524 ) ( not ( = ?auto_306523 ?auto_306524 ) ) ( not ( = ?auto_306516 ?auto_306524 ) ) ( not ( = ?auto_306519 ?auto_306524 ) ) ( HAVE_IMAGE ?auto_306514 ?auto_306515 ) ( HAVE_IMAGE ?auto_306517 ?auto_306518 ) ( not ( = ?auto_306514 ?auto_306516 ) ) ( not ( = ?auto_306514 ?auto_306517 ) ) ( not ( = ?auto_306514 ?auto_306523 ) ) ( not ( = ?auto_306514 ?auto_306519 ) ) ( not ( = ?auto_306514 ?auto_306524 ) ) ( not ( = ?auto_306515 ?auto_306513 ) ) ( not ( = ?auto_306515 ?auto_306518 ) ) ( not ( = ?auto_306515 ?auto_306520 ) ) ( not ( = ?auto_306516 ?auto_306517 ) ) ( not ( = ?auto_306513 ?auto_306518 ) ) ( not ( = ?auto_306517 ?auto_306523 ) ) ( not ( = ?auto_306517 ?auto_306519 ) ) ( not ( = ?auto_306517 ?auto_306524 ) ) ( not ( = ?auto_306518 ?auto_306520 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306519 ?auto_306520 ?auto_306516 ?auto_306513 )
      ( GET-3IMAGE-VERIFY ?auto_306514 ?auto_306515 ?auto_306516 ?auto_306513 ?auto_306517 ?auto_306518 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_306559 - DIRECTION
      ?auto_306560 - MODE
      ?auto_306561 - DIRECTION
      ?auto_306558 - MODE
      ?auto_306562 - DIRECTION
      ?auto_306563 - MODE
    )
    :vars
    (
      ?auto_306567 - INSTRUMENT
      ?auto_306566 - SATELLITE
      ?auto_306568 - DIRECTION
      ?auto_306564 - DIRECTION
      ?auto_306565 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_306567 ?auto_306566 ) ( SUPPORTS ?auto_306567 ?auto_306563 ) ( not ( = ?auto_306562 ?auto_306568 ) ) ( HAVE_IMAGE ?auto_306564 ?auto_306565 ) ( not ( = ?auto_306564 ?auto_306562 ) ) ( not ( = ?auto_306564 ?auto_306568 ) ) ( not ( = ?auto_306565 ?auto_306563 ) ) ( CALIBRATION_TARGET ?auto_306567 ?auto_306568 ) ( POWER_AVAIL ?auto_306566 ) ( POINTING ?auto_306566 ?auto_306561 ) ( not ( = ?auto_306568 ?auto_306561 ) ) ( not ( = ?auto_306562 ?auto_306561 ) ) ( not ( = ?auto_306564 ?auto_306561 ) ) ( HAVE_IMAGE ?auto_306559 ?auto_306560 ) ( HAVE_IMAGE ?auto_306561 ?auto_306558 ) ( not ( = ?auto_306559 ?auto_306561 ) ) ( not ( = ?auto_306559 ?auto_306562 ) ) ( not ( = ?auto_306559 ?auto_306568 ) ) ( not ( = ?auto_306559 ?auto_306564 ) ) ( not ( = ?auto_306560 ?auto_306558 ) ) ( not ( = ?auto_306560 ?auto_306563 ) ) ( not ( = ?auto_306560 ?auto_306565 ) ) ( not ( = ?auto_306558 ?auto_306563 ) ) ( not ( = ?auto_306558 ?auto_306565 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306564 ?auto_306565 ?auto_306562 ?auto_306563 )
      ( GET-3IMAGE-VERIFY ?auto_306559 ?auto_306560 ?auto_306561 ?auto_306558 ?auto_306562 ?auto_306563 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_306607 - DIRECTION
      ?auto_306608 - MODE
      ?auto_306609 - DIRECTION
      ?auto_306606 - MODE
      ?auto_306610 - DIRECTION
      ?auto_306611 - MODE
    )
    :vars
    (
      ?auto_306613 - INSTRUMENT
      ?auto_306612 - SATELLITE
      ?auto_306614 - DIRECTION
      ?auto_306615 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_306613 ?auto_306612 ) ( SUPPORTS ?auto_306613 ?auto_306608 ) ( not ( = ?auto_306607 ?auto_306614 ) ) ( HAVE_IMAGE ?auto_306610 ?auto_306606 ) ( not ( = ?auto_306610 ?auto_306607 ) ) ( not ( = ?auto_306610 ?auto_306614 ) ) ( not ( = ?auto_306606 ?auto_306608 ) ) ( CALIBRATION_TARGET ?auto_306613 ?auto_306614 ) ( POWER_AVAIL ?auto_306612 ) ( POINTING ?auto_306612 ?auto_306615 ) ( not ( = ?auto_306614 ?auto_306615 ) ) ( not ( = ?auto_306607 ?auto_306615 ) ) ( not ( = ?auto_306610 ?auto_306615 ) ) ( HAVE_IMAGE ?auto_306609 ?auto_306606 ) ( HAVE_IMAGE ?auto_306610 ?auto_306611 ) ( not ( = ?auto_306607 ?auto_306609 ) ) ( not ( = ?auto_306608 ?auto_306611 ) ) ( not ( = ?auto_306609 ?auto_306610 ) ) ( not ( = ?auto_306609 ?auto_306614 ) ) ( not ( = ?auto_306609 ?auto_306615 ) ) ( not ( = ?auto_306606 ?auto_306611 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306610 ?auto_306606 ?auto_306607 ?auto_306608 )
      ( GET-3IMAGE-VERIFY ?auto_306607 ?auto_306608 ?auto_306609 ?auto_306606 ?auto_306610 ?auto_306611 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_306617 - DIRECTION
      ?auto_306618 - MODE
      ?auto_306619 - DIRECTION
      ?auto_306616 - MODE
      ?auto_306620 - DIRECTION
      ?auto_306621 - MODE
    )
    :vars
    (
      ?auto_306623 - INSTRUMENT
      ?auto_306622 - SATELLITE
      ?auto_306624 - DIRECTION
      ?auto_306625 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_306623 ?auto_306622 ) ( SUPPORTS ?auto_306623 ?auto_306618 ) ( not ( = ?auto_306617 ?auto_306624 ) ) ( HAVE_IMAGE ?auto_306619 ?auto_306616 ) ( not ( = ?auto_306619 ?auto_306617 ) ) ( not ( = ?auto_306619 ?auto_306624 ) ) ( not ( = ?auto_306616 ?auto_306618 ) ) ( CALIBRATION_TARGET ?auto_306623 ?auto_306624 ) ( POWER_AVAIL ?auto_306622 ) ( POINTING ?auto_306622 ?auto_306625 ) ( not ( = ?auto_306624 ?auto_306625 ) ) ( not ( = ?auto_306617 ?auto_306625 ) ) ( not ( = ?auto_306619 ?auto_306625 ) ) ( HAVE_IMAGE ?auto_306620 ?auto_306621 ) ( not ( = ?auto_306617 ?auto_306620 ) ) ( not ( = ?auto_306618 ?auto_306621 ) ) ( not ( = ?auto_306619 ?auto_306620 ) ) ( not ( = ?auto_306616 ?auto_306621 ) ) ( not ( = ?auto_306620 ?auto_306624 ) ) ( not ( = ?auto_306620 ?auto_306625 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306619 ?auto_306616 ?auto_306617 ?auto_306618 )
      ( GET-3IMAGE-VERIFY ?auto_306617 ?auto_306618 ?auto_306619 ?auto_306616 ?auto_306620 ?auto_306621 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_306652 - DIRECTION
      ?auto_306653 - MODE
      ?auto_306654 - DIRECTION
      ?auto_306651 - MODE
      ?auto_306655 - DIRECTION
      ?auto_306656 - MODE
    )
    :vars
    (
      ?auto_306660 - INSTRUMENT
      ?auto_306659 - SATELLITE
      ?auto_306661 - DIRECTION
      ?auto_306657 - DIRECTION
      ?auto_306658 - MODE
      ?auto_306662 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_306660 ?auto_306659 ) ( SUPPORTS ?auto_306660 ?auto_306653 ) ( not ( = ?auto_306652 ?auto_306661 ) ) ( HAVE_IMAGE ?auto_306657 ?auto_306658 ) ( not ( = ?auto_306657 ?auto_306652 ) ) ( not ( = ?auto_306657 ?auto_306661 ) ) ( not ( = ?auto_306658 ?auto_306653 ) ) ( CALIBRATION_TARGET ?auto_306660 ?auto_306661 ) ( POWER_AVAIL ?auto_306659 ) ( POINTING ?auto_306659 ?auto_306662 ) ( not ( = ?auto_306661 ?auto_306662 ) ) ( not ( = ?auto_306652 ?auto_306662 ) ) ( not ( = ?auto_306657 ?auto_306662 ) ) ( HAVE_IMAGE ?auto_306654 ?auto_306651 ) ( HAVE_IMAGE ?auto_306655 ?auto_306656 ) ( not ( = ?auto_306652 ?auto_306654 ) ) ( not ( = ?auto_306652 ?auto_306655 ) ) ( not ( = ?auto_306653 ?auto_306651 ) ) ( not ( = ?auto_306653 ?auto_306656 ) ) ( not ( = ?auto_306654 ?auto_306655 ) ) ( not ( = ?auto_306654 ?auto_306661 ) ) ( not ( = ?auto_306654 ?auto_306657 ) ) ( not ( = ?auto_306654 ?auto_306662 ) ) ( not ( = ?auto_306651 ?auto_306656 ) ) ( not ( = ?auto_306651 ?auto_306658 ) ) ( not ( = ?auto_306655 ?auto_306661 ) ) ( not ( = ?auto_306655 ?auto_306657 ) ) ( not ( = ?auto_306655 ?auto_306662 ) ) ( not ( = ?auto_306656 ?auto_306658 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306657 ?auto_306658 ?auto_306652 ?auto_306653 )
      ( GET-3IMAGE-VERIFY ?auto_306652 ?auto_306653 ?auto_306654 ?auto_306651 ?auto_306655 ?auto_306656 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_306697 - DIRECTION
      ?auto_306698 - MODE
      ?auto_306699 - DIRECTION
      ?auto_306696 - MODE
      ?auto_306700 - DIRECTION
      ?auto_306701 - MODE
    )
    :vars
    (
      ?auto_306705 - INSTRUMENT
      ?auto_306704 - SATELLITE
      ?auto_306706 - DIRECTION
      ?auto_306702 - DIRECTION
      ?auto_306703 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_306705 ?auto_306704 ) ( SUPPORTS ?auto_306705 ?auto_306698 ) ( not ( = ?auto_306697 ?auto_306706 ) ) ( HAVE_IMAGE ?auto_306702 ?auto_306703 ) ( not ( = ?auto_306702 ?auto_306697 ) ) ( not ( = ?auto_306702 ?auto_306706 ) ) ( not ( = ?auto_306703 ?auto_306698 ) ) ( CALIBRATION_TARGET ?auto_306705 ?auto_306706 ) ( POWER_AVAIL ?auto_306704 ) ( POINTING ?auto_306704 ?auto_306699 ) ( not ( = ?auto_306706 ?auto_306699 ) ) ( not ( = ?auto_306697 ?auto_306699 ) ) ( not ( = ?auto_306702 ?auto_306699 ) ) ( HAVE_IMAGE ?auto_306699 ?auto_306696 ) ( HAVE_IMAGE ?auto_306700 ?auto_306701 ) ( not ( = ?auto_306697 ?auto_306700 ) ) ( not ( = ?auto_306698 ?auto_306696 ) ) ( not ( = ?auto_306698 ?auto_306701 ) ) ( not ( = ?auto_306699 ?auto_306700 ) ) ( not ( = ?auto_306696 ?auto_306701 ) ) ( not ( = ?auto_306696 ?auto_306703 ) ) ( not ( = ?auto_306700 ?auto_306706 ) ) ( not ( = ?auto_306700 ?auto_306702 ) ) ( not ( = ?auto_306701 ?auto_306703 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306702 ?auto_306703 ?auto_306697 ?auto_306698 )
      ( GET-3IMAGE-VERIFY ?auto_306697 ?auto_306698 ?auto_306699 ?auto_306696 ?auto_306700 ?auto_306701 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_306764 - DIRECTION
      ?auto_306765 - MODE
      ?auto_306766 - DIRECTION
      ?auto_306763 - MODE
      ?auto_306767 - DIRECTION
      ?auto_306768 - MODE
      ?auto_306769 - DIRECTION
      ?auto_306770 - MODE
    )
    :vars
    (
      ?auto_306772 - INSTRUMENT
      ?auto_306771 - SATELLITE
      ?auto_306773 - DIRECTION
      ?auto_306774 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_306772 ?auto_306771 ) ( SUPPORTS ?auto_306772 ?auto_306770 ) ( not ( = ?auto_306769 ?auto_306773 ) ) ( HAVE_IMAGE ?auto_306766 ?auto_306763 ) ( not ( = ?auto_306766 ?auto_306769 ) ) ( not ( = ?auto_306766 ?auto_306773 ) ) ( not ( = ?auto_306763 ?auto_306770 ) ) ( CALIBRATION_TARGET ?auto_306772 ?auto_306773 ) ( POWER_AVAIL ?auto_306771 ) ( POINTING ?auto_306771 ?auto_306774 ) ( not ( = ?auto_306773 ?auto_306774 ) ) ( not ( = ?auto_306769 ?auto_306774 ) ) ( not ( = ?auto_306766 ?auto_306774 ) ) ( HAVE_IMAGE ?auto_306764 ?auto_306765 ) ( HAVE_IMAGE ?auto_306767 ?auto_306768 ) ( not ( = ?auto_306764 ?auto_306766 ) ) ( not ( = ?auto_306764 ?auto_306767 ) ) ( not ( = ?auto_306764 ?auto_306769 ) ) ( not ( = ?auto_306764 ?auto_306773 ) ) ( not ( = ?auto_306764 ?auto_306774 ) ) ( not ( = ?auto_306765 ?auto_306763 ) ) ( not ( = ?auto_306765 ?auto_306768 ) ) ( not ( = ?auto_306765 ?auto_306770 ) ) ( not ( = ?auto_306766 ?auto_306767 ) ) ( not ( = ?auto_306763 ?auto_306768 ) ) ( not ( = ?auto_306767 ?auto_306769 ) ) ( not ( = ?auto_306767 ?auto_306773 ) ) ( not ( = ?auto_306767 ?auto_306774 ) ) ( not ( = ?auto_306768 ?auto_306770 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306766 ?auto_306763 ?auto_306769 ?auto_306770 )
      ( GET-4IMAGE-VERIFY ?auto_306764 ?auto_306765 ?auto_306766 ?auto_306763 ?auto_306767 ?auto_306768 ?auto_306769 ?auto_306770 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_306799 - DIRECTION
      ?auto_306800 - MODE
      ?auto_306801 - DIRECTION
      ?auto_306798 - MODE
      ?auto_306802 - DIRECTION
      ?auto_306803 - MODE
      ?auto_306804 - DIRECTION
      ?auto_306805 - MODE
    )
    :vars
    (
      ?auto_306807 - INSTRUMENT
      ?auto_306806 - SATELLITE
      ?auto_306808 - DIRECTION
      ?auto_306809 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_306807 ?auto_306806 ) ( SUPPORTS ?auto_306807 ?auto_306803 ) ( not ( = ?auto_306802 ?auto_306808 ) ) ( HAVE_IMAGE ?auto_306799 ?auto_306805 ) ( not ( = ?auto_306799 ?auto_306802 ) ) ( not ( = ?auto_306799 ?auto_306808 ) ) ( not ( = ?auto_306805 ?auto_306803 ) ) ( CALIBRATION_TARGET ?auto_306807 ?auto_306808 ) ( POWER_AVAIL ?auto_306806 ) ( POINTING ?auto_306806 ?auto_306809 ) ( not ( = ?auto_306808 ?auto_306809 ) ) ( not ( = ?auto_306802 ?auto_306809 ) ) ( not ( = ?auto_306799 ?auto_306809 ) ) ( HAVE_IMAGE ?auto_306799 ?auto_306800 ) ( HAVE_IMAGE ?auto_306801 ?auto_306798 ) ( HAVE_IMAGE ?auto_306804 ?auto_306805 ) ( not ( = ?auto_306799 ?auto_306801 ) ) ( not ( = ?auto_306799 ?auto_306804 ) ) ( not ( = ?auto_306800 ?auto_306798 ) ) ( not ( = ?auto_306800 ?auto_306803 ) ) ( not ( = ?auto_306800 ?auto_306805 ) ) ( not ( = ?auto_306801 ?auto_306802 ) ) ( not ( = ?auto_306801 ?auto_306804 ) ) ( not ( = ?auto_306801 ?auto_306808 ) ) ( not ( = ?auto_306801 ?auto_306809 ) ) ( not ( = ?auto_306798 ?auto_306803 ) ) ( not ( = ?auto_306798 ?auto_306805 ) ) ( not ( = ?auto_306802 ?auto_306804 ) ) ( not ( = ?auto_306804 ?auto_306808 ) ) ( not ( = ?auto_306804 ?auto_306809 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306799 ?auto_306805 ?auto_306802 ?auto_306803 )
      ( GET-4IMAGE-VERIFY ?auto_306799 ?auto_306800 ?auto_306801 ?auto_306798 ?auto_306802 ?auto_306803 ?auto_306804 ?auto_306805 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_306811 - DIRECTION
      ?auto_306812 - MODE
      ?auto_306813 - DIRECTION
      ?auto_306810 - MODE
      ?auto_306814 - DIRECTION
      ?auto_306815 - MODE
      ?auto_306816 - DIRECTION
      ?auto_306817 - MODE
    )
    :vars
    (
      ?auto_306819 - INSTRUMENT
      ?auto_306818 - SATELLITE
      ?auto_306820 - DIRECTION
      ?auto_306821 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_306819 ?auto_306818 ) ( SUPPORTS ?auto_306819 ?auto_306815 ) ( not ( = ?auto_306814 ?auto_306820 ) ) ( HAVE_IMAGE ?auto_306813 ?auto_306812 ) ( not ( = ?auto_306813 ?auto_306814 ) ) ( not ( = ?auto_306813 ?auto_306820 ) ) ( not ( = ?auto_306812 ?auto_306815 ) ) ( CALIBRATION_TARGET ?auto_306819 ?auto_306820 ) ( POWER_AVAIL ?auto_306818 ) ( POINTING ?auto_306818 ?auto_306821 ) ( not ( = ?auto_306820 ?auto_306821 ) ) ( not ( = ?auto_306814 ?auto_306821 ) ) ( not ( = ?auto_306813 ?auto_306821 ) ) ( HAVE_IMAGE ?auto_306811 ?auto_306812 ) ( HAVE_IMAGE ?auto_306813 ?auto_306810 ) ( HAVE_IMAGE ?auto_306816 ?auto_306817 ) ( not ( = ?auto_306811 ?auto_306813 ) ) ( not ( = ?auto_306811 ?auto_306814 ) ) ( not ( = ?auto_306811 ?auto_306816 ) ) ( not ( = ?auto_306811 ?auto_306820 ) ) ( not ( = ?auto_306811 ?auto_306821 ) ) ( not ( = ?auto_306812 ?auto_306810 ) ) ( not ( = ?auto_306812 ?auto_306817 ) ) ( not ( = ?auto_306813 ?auto_306816 ) ) ( not ( = ?auto_306810 ?auto_306815 ) ) ( not ( = ?auto_306810 ?auto_306817 ) ) ( not ( = ?auto_306814 ?auto_306816 ) ) ( not ( = ?auto_306815 ?auto_306817 ) ) ( not ( = ?auto_306816 ?auto_306820 ) ) ( not ( = ?auto_306816 ?auto_306821 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306813 ?auto_306812 ?auto_306814 ?auto_306815 )
      ( GET-4IMAGE-VERIFY ?auto_306811 ?auto_306812 ?auto_306813 ?auto_306810 ?auto_306814 ?auto_306815 ?auto_306816 ?auto_306817 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_306846 - DIRECTION
      ?auto_306847 - MODE
      ?auto_306848 - DIRECTION
      ?auto_306845 - MODE
      ?auto_306849 - DIRECTION
      ?auto_306850 - MODE
      ?auto_306851 - DIRECTION
      ?auto_306852 - MODE
    )
    :vars
    (
      ?auto_306854 - INSTRUMENT
      ?auto_306853 - SATELLITE
      ?auto_306855 - DIRECTION
      ?auto_306856 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_306854 ?auto_306853 ) ( SUPPORTS ?auto_306854 ?auto_306852 ) ( not ( = ?auto_306851 ?auto_306855 ) ) ( HAVE_IMAGE ?auto_306846 ?auto_306847 ) ( not ( = ?auto_306846 ?auto_306851 ) ) ( not ( = ?auto_306846 ?auto_306855 ) ) ( not ( = ?auto_306847 ?auto_306852 ) ) ( CALIBRATION_TARGET ?auto_306854 ?auto_306855 ) ( POWER_AVAIL ?auto_306853 ) ( POINTING ?auto_306853 ?auto_306856 ) ( not ( = ?auto_306855 ?auto_306856 ) ) ( not ( = ?auto_306851 ?auto_306856 ) ) ( not ( = ?auto_306846 ?auto_306856 ) ) ( HAVE_IMAGE ?auto_306848 ?auto_306845 ) ( HAVE_IMAGE ?auto_306849 ?auto_306850 ) ( not ( = ?auto_306846 ?auto_306848 ) ) ( not ( = ?auto_306846 ?auto_306849 ) ) ( not ( = ?auto_306847 ?auto_306845 ) ) ( not ( = ?auto_306847 ?auto_306850 ) ) ( not ( = ?auto_306848 ?auto_306849 ) ) ( not ( = ?auto_306848 ?auto_306851 ) ) ( not ( = ?auto_306848 ?auto_306855 ) ) ( not ( = ?auto_306848 ?auto_306856 ) ) ( not ( = ?auto_306845 ?auto_306850 ) ) ( not ( = ?auto_306845 ?auto_306852 ) ) ( not ( = ?auto_306849 ?auto_306851 ) ) ( not ( = ?auto_306849 ?auto_306855 ) ) ( not ( = ?auto_306849 ?auto_306856 ) ) ( not ( = ?auto_306850 ?auto_306852 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306846 ?auto_306847 ?auto_306851 ?auto_306852 )
      ( GET-4IMAGE-VERIFY ?auto_306846 ?auto_306847 ?auto_306848 ?auto_306845 ?auto_306849 ?auto_306850 ?auto_306851 ?auto_306852 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_306890 - DIRECTION
      ?auto_306891 - MODE
      ?auto_306892 - DIRECTION
      ?auto_306889 - MODE
      ?auto_306893 - DIRECTION
      ?auto_306894 - MODE
      ?auto_306895 - DIRECTION
      ?auto_306896 - MODE
    )
    :vars
    (
      ?auto_306898 - INSTRUMENT
      ?auto_306897 - SATELLITE
      ?auto_306899 - DIRECTION
      ?auto_306900 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_306898 ?auto_306897 ) ( SUPPORTS ?auto_306898 ?auto_306894 ) ( not ( = ?auto_306893 ?auto_306899 ) ) ( HAVE_IMAGE ?auto_306890 ?auto_306891 ) ( not ( = ?auto_306890 ?auto_306893 ) ) ( not ( = ?auto_306890 ?auto_306899 ) ) ( not ( = ?auto_306891 ?auto_306894 ) ) ( CALIBRATION_TARGET ?auto_306898 ?auto_306899 ) ( POWER_AVAIL ?auto_306897 ) ( POINTING ?auto_306897 ?auto_306900 ) ( not ( = ?auto_306899 ?auto_306900 ) ) ( not ( = ?auto_306893 ?auto_306900 ) ) ( not ( = ?auto_306890 ?auto_306900 ) ) ( HAVE_IMAGE ?auto_306892 ?auto_306889 ) ( HAVE_IMAGE ?auto_306895 ?auto_306896 ) ( not ( = ?auto_306890 ?auto_306892 ) ) ( not ( = ?auto_306890 ?auto_306895 ) ) ( not ( = ?auto_306891 ?auto_306889 ) ) ( not ( = ?auto_306891 ?auto_306896 ) ) ( not ( = ?auto_306892 ?auto_306893 ) ) ( not ( = ?auto_306892 ?auto_306895 ) ) ( not ( = ?auto_306892 ?auto_306899 ) ) ( not ( = ?auto_306892 ?auto_306900 ) ) ( not ( = ?auto_306889 ?auto_306894 ) ) ( not ( = ?auto_306889 ?auto_306896 ) ) ( not ( = ?auto_306893 ?auto_306895 ) ) ( not ( = ?auto_306894 ?auto_306896 ) ) ( not ( = ?auto_306895 ?auto_306899 ) ) ( not ( = ?auto_306895 ?auto_306900 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306890 ?auto_306891 ?auto_306893 ?auto_306894 )
      ( GET-4IMAGE-VERIFY ?auto_306890 ?auto_306891 ?auto_306892 ?auto_306889 ?auto_306893 ?auto_306894 ?auto_306895 ?auto_306896 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_306902 - DIRECTION
      ?auto_306903 - MODE
      ?auto_306904 - DIRECTION
      ?auto_306901 - MODE
      ?auto_306905 - DIRECTION
      ?auto_306906 - MODE
      ?auto_306907 - DIRECTION
      ?auto_306908 - MODE
    )
    :vars
    (
      ?auto_306910 - INSTRUMENT
      ?auto_306909 - SATELLITE
      ?auto_306911 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_306910 ?auto_306909 ) ( SUPPORTS ?auto_306910 ?auto_306906 ) ( not ( = ?auto_306905 ?auto_306911 ) ) ( HAVE_IMAGE ?auto_306902 ?auto_306903 ) ( not ( = ?auto_306902 ?auto_306905 ) ) ( not ( = ?auto_306902 ?auto_306911 ) ) ( not ( = ?auto_306903 ?auto_306906 ) ) ( CALIBRATION_TARGET ?auto_306910 ?auto_306911 ) ( POWER_AVAIL ?auto_306909 ) ( POINTING ?auto_306909 ?auto_306907 ) ( not ( = ?auto_306911 ?auto_306907 ) ) ( not ( = ?auto_306905 ?auto_306907 ) ) ( not ( = ?auto_306902 ?auto_306907 ) ) ( HAVE_IMAGE ?auto_306904 ?auto_306901 ) ( HAVE_IMAGE ?auto_306907 ?auto_306908 ) ( not ( = ?auto_306902 ?auto_306904 ) ) ( not ( = ?auto_306903 ?auto_306901 ) ) ( not ( = ?auto_306903 ?auto_306908 ) ) ( not ( = ?auto_306904 ?auto_306905 ) ) ( not ( = ?auto_306904 ?auto_306907 ) ) ( not ( = ?auto_306904 ?auto_306911 ) ) ( not ( = ?auto_306901 ?auto_306906 ) ) ( not ( = ?auto_306901 ?auto_306908 ) ) ( not ( = ?auto_306906 ?auto_306908 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306902 ?auto_306903 ?auto_306905 ?auto_306906 )
      ( GET-4IMAGE-VERIFY ?auto_306902 ?auto_306903 ?auto_306904 ?auto_306901 ?auto_306905 ?auto_306906 ?auto_306907 ?auto_306908 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307011 - DIRECTION
      ?auto_307012 - MODE
      ?auto_307013 - DIRECTION
      ?auto_307010 - MODE
      ?auto_307014 - DIRECTION
      ?auto_307015 - MODE
      ?auto_307016 - DIRECTION
      ?auto_307017 - MODE
    )
    :vars
    (
      ?auto_307019 - INSTRUMENT
      ?auto_307018 - SATELLITE
      ?auto_307020 - DIRECTION
      ?auto_307021 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_307019 ?auto_307018 ) ( SUPPORTS ?auto_307019 ?auto_307010 ) ( not ( = ?auto_307013 ?auto_307020 ) ) ( HAVE_IMAGE ?auto_307011 ?auto_307012 ) ( not ( = ?auto_307011 ?auto_307013 ) ) ( not ( = ?auto_307011 ?auto_307020 ) ) ( not ( = ?auto_307012 ?auto_307010 ) ) ( CALIBRATION_TARGET ?auto_307019 ?auto_307020 ) ( POWER_AVAIL ?auto_307018 ) ( POINTING ?auto_307018 ?auto_307021 ) ( not ( = ?auto_307020 ?auto_307021 ) ) ( not ( = ?auto_307013 ?auto_307021 ) ) ( not ( = ?auto_307011 ?auto_307021 ) ) ( HAVE_IMAGE ?auto_307014 ?auto_307015 ) ( HAVE_IMAGE ?auto_307016 ?auto_307017 ) ( not ( = ?auto_307011 ?auto_307014 ) ) ( not ( = ?auto_307011 ?auto_307016 ) ) ( not ( = ?auto_307012 ?auto_307015 ) ) ( not ( = ?auto_307012 ?auto_307017 ) ) ( not ( = ?auto_307013 ?auto_307014 ) ) ( not ( = ?auto_307013 ?auto_307016 ) ) ( not ( = ?auto_307010 ?auto_307015 ) ) ( not ( = ?auto_307010 ?auto_307017 ) ) ( not ( = ?auto_307014 ?auto_307016 ) ) ( not ( = ?auto_307014 ?auto_307020 ) ) ( not ( = ?auto_307014 ?auto_307021 ) ) ( not ( = ?auto_307015 ?auto_307017 ) ) ( not ( = ?auto_307016 ?auto_307020 ) ) ( not ( = ?auto_307016 ?auto_307021 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307011 ?auto_307012 ?auto_307013 ?auto_307010 )
      ( GET-4IMAGE-VERIFY ?auto_307011 ?auto_307012 ?auto_307013 ?auto_307010 ?auto_307014 ?auto_307015 ?auto_307016 ?auto_307017 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307046 - DIRECTION
      ?auto_307047 - MODE
      ?auto_307048 - DIRECTION
      ?auto_307045 - MODE
      ?auto_307049 - DIRECTION
      ?auto_307050 - MODE
      ?auto_307051 - DIRECTION
      ?auto_307052 - MODE
    )
    :vars
    (
      ?auto_307054 - INSTRUMENT
      ?auto_307053 - SATELLITE
      ?auto_307055 - DIRECTION
      ?auto_307056 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_307054 ?auto_307053 ) ( SUPPORTS ?auto_307054 ?auto_307045 ) ( not ( = ?auto_307048 ?auto_307055 ) ) ( HAVE_IMAGE ?auto_307051 ?auto_307052 ) ( not ( = ?auto_307051 ?auto_307048 ) ) ( not ( = ?auto_307051 ?auto_307055 ) ) ( not ( = ?auto_307052 ?auto_307045 ) ) ( CALIBRATION_TARGET ?auto_307054 ?auto_307055 ) ( POWER_AVAIL ?auto_307053 ) ( POINTING ?auto_307053 ?auto_307056 ) ( not ( = ?auto_307055 ?auto_307056 ) ) ( not ( = ?auto_307048 ?auto_307056 ) ) ( not ( = ?auto_307051 ?auto_307056 ) ) ( HAVE_IMAGE ?auto_307046 ?auto_307047 ) ( HAVE_IMAGE ?auto_307049 ?auto_307050 ) ( not ( = ?auto_307046 ?auto_307048 ) ) ( not ( = ?auto_307046 ?auto_307049 ) ) ( not ( = ?auto_307046 ?auto_307051 ) ) ( not ( = ?auto_307046 ?auto_307055 ) ) ( not ( = ?auto_307046 ?auto_307056 ) ) ( not ( = ?auto_307047 ?auto_307045 ) ) ( not ( = ?auto_307047 ?auto_307050 ) ) ( not ( = ?auto_307047 ?auto_307052 ) ) ( not ( = ?auto_307048 ?auto_307049 ) ) ( not ( = ?auto_307045 ?auto_307050 ) ) ( not ( = ?auto_307049 ?auto_307051 ) ) ( not ( = ?auto_307049 ?auto_307055 ) ) ( not ( = ?auto_307049 ?auto_307056 ) ) ( not ( = ?auto_307050 ?auto_307052 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307051 ?auto_307052 ?auto_307048 ?auto_307045 )
      ( GET-4IMAGE-VERIFY ?auto_307046 ?auto_307047 ?auto_307048 ?auto_307045 ?auto_307049 ?auto_307050 ?auto_307051 ?auto_307052 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307109 - DIRECTION
      ?auto_307110 - MODE
      ?auto_307111 - DIRECTION
      ?auto_307108 - MODE
      ?auto_307112 - DIRECTION
      ?auto_307113 - MODE
      ?auto_307114 - DIRECTION
      ?auto_307115 - MODE
    )
    :vars
    (
      ?auto_307117 - INSTRUMENT
      ?auto_307116 - SATELLITE
      ?auto_307118 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_307117 ?auto_307116 ) ( SUPPORTS ?auto_307117 ?auto_307108 ) ( not ( = ?auto_307111 ?auto_307118 ) ) ( HAVE_IMAGE ?auto_307109 ?auto_307110 ) ( not ( = ?auto_307109 ?auto_307111 ) ) ( not ( = ?auto_307109 ?auto_307118 ) ) ( not ( = ?auto_307110 ?auto_307108 ) ) ( CALIBRATION_TARGET ?auto_307117 ?auto_307118 ) ( POWER_AVAIL ?auto_307116 ) ( POINTING ?auto_307116 ?auto_307114 ) ( not ( = ?auto_307118 ?auto_307114 ) ) ( not ( = ?auto_307111 ?auto_307114 ) ) ( not ( = ?auto_307109 ?auto_307114 ) ) ( HAVE_IMAGE ?auto_307112 ?auto_307113 ) ( HAVE_IMAGE ?auto_307114 ?auto_307115 ) ( not ( = ?auto_307109 ?auto_307112 ) ) ( not ( = ?auto_307110 ?auto_307113 ) ) ( not ( = ?auto_307110 ?auto_307115 ) ) ( not ( = ?auto_307111 ?auto_307112 ) ) ( not ( = ?auto_307108 ?auto_307113 ) ) ( not ( = ?auto_307108 ?auto_307115 ) ) ( not ( = ?auto_307112 ?auto_307114 ) ) ( not ( = ?auto_307112 ?auto_307118 ) ) ( not ( = ?auto_307113 ?auto_307115 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307109 ?auto_307110 ?auto_307111 ?auto_307108 )
      ( GET-4IMAGE-VERIFY ?auto_307109 ?auto_307110 ?auto_307111 ?auto_307108 ?auto_307112 ?auto_307113 ?auto_307114 ?auto_307115 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307178 - DIRECTION
      ?auto_307179 - MODE
      ?auto_307180 - DIRECTION
      ?auto_307177 - MODE
      ?auto_307181 - DIRECTION
      ?auto_307182 - MODE
      ?auto_307183 - DIRECTION
      ?auto_307184 - MODE
    )
    :vars
    (
      ?auto_307186 - INSTRUMENT
      ?auto_307185 - SATELLITE
      ?auto_307187 - DIRECTION
      ?auto_307188 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_307186 ?auto_307185 ) ( SUPPORTS ?auto_307186 ?auto_307184 ) ( not ( = ?auto_307183 ?auto_307187 ) ) ( HAVE_IMAGE ?auto_307180 ?auto_307182 ) ( not ( = ?auto_307180 ?auto_307183 ) ) ( not ( = ?auto_307180 ?auto_307187 ) ) ( not ( = ?auto_307182 ?auto_307184 ) ) ( CALIBRATION_TARGET ?auto_307186 ?auto_307187 ) ( POWER_AVAIL ?auto_307185 ) ( POINTING ?auto_307185 ?auto_307188 ) ( not ( = ?auto_307187 ?auto_307188 ) ) ( not ( = ?auto_307183 ?auto_307188 ) ) ( not ( = ?auto_307180 ?auto_307188 ) ) ( HAVE_IMAGE ?auto_307178 ?auto_307179 ) ( HAVE_IMAGE ?auto_307180 ?auto_307177 ) ( HAVE_IMAGE ?auto_307181 ?auto_307182 ) ( not ( = ?auto_307178 ?auto_307180 ) ) ( not ( = ?auto_307178 ?auto_307181 ) ) ( not ( = ?auto_307178 ?auto_307183 ) ) ( not ( = ?auto_307178 ?auto_307187 ) ) ( not ( = ?auto_307178 ?auto_307188 ) ) ( not ( = ?auto_307179 ?auto_307177 ) ) ( not ( = ?auto_307179 ?auto_307182 ) ) ( not ( = ?auto_307179 ?auto_307184 ) ) ( not ( = ?auto_307180 ?auto_307181 ) ) ( not ( = ?auto_307177 ?auto_307182 ) ) ( not ( = ?auto_307177 ?auto_307184 ) ) ( not ( = ?auto_307181 ?auto_307183 ) ) ( not ( = ?auto_307181 ?auto_307187 ) ) ( not ( = ?auto_307181 ?auto_307188 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307180 ?auto_307182 ?auto_307183 ?auto_307184 )
      ( GET-4IMAGE-VERIFY ?auto_307178 ?auto_307179 ?auto_307180 ?auto_307177 ?auto_307181 ?auto_307182 ?auto_307183 ?auto_307184 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307210 - DIRECTION
      ?auto_307211 - MODE
      ?auto_307212 - DIRECTION
      ?auto_307209 - MODE
      ?auto_307213 - DIRECTION
      ?auto_307214 - MODE
      ?auto_307215 - DIRECTION
      ?auto_307216 - MODE
    )
    :vars
    (
      ?auto_307218 - INSTRUMENT
      ?auto_307217 - SATELLITE
      ?auto_307219 - DIRECTION
      ?auto_307220 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_307218 ?auto_307217 ) ( SUPPORTS ?auto_307218 ?auto_307214 ) ( not ( = ?auto_307213 ?auto_307219 ) ) ( HAVE_IMAGE ?auto_307212 ?auto_307209 ) ( not ( = ?auto_307212 ?auto_307213 ) ) ( not ( = ?auto_307212 ?auto_307219 ) ) ( not ( = ?auto_307209 ?auto_307214 ) ) ( CALIBRATION_TARGET ?auto_307218 ?auto_307219 ) ( POWER_AVAIL ?auto_307217 ) ( POINTING ?auto_307217 ?auto_307220 ) ( not ( = ?auto_307219 ?auto_307220 ) ) ( not ( = ?auto_307213 ?auto_307220 ) ) ( not ( = ?auto_307212 ?auto_307220 ) ) ( HAVE_IMAGE ?auto_307210 ?auto_307211 ) ( HAVE_IMAGE ?auto_307215 ?auto_307216 ) ( not ( = ?auto_307210 ?auto_307212 ) ) ( not ( = ?auto_307210 ?auto_307213 ) ) ( not ( = ?auto_307210 ?auto_307215 ) ) ( not ( = ?auto_307210 ?auto_307219 ) ) ( not ( = ?auto_307210 ?auto_307220 ) ) ( not ( = ?auto_307211 ?auto_307209 ) ) ( not ( = ?auto_307211 ?auto_307214 ) ) ( not ( = ?auto_307211 ?auto_307216 ) ) ( not ( = ?auto_307212 ?auto_307215 ) ) ( not ( = ?auto_307209 ?auto_307216 ) ) ( not ( = ?auto_307213 ?auto_307215 ) ) ( not ( = ?auto_307214 ?auto_307216 ) ) ( not ( = ?auto_307215 ?auto_307219 ) ) ( not ( = ?auto_307215 ?auto_307220 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307212 ?auto_307209 ?auto_307213 ?auto_307214 )
      ( GET-4IMAGE-VERIFY ?auto_307210 ?auto_307211 ?auto_307212 ?auto_307209 ?auto_307213 ?auto_307214 ?auto_307215 ?auto_307216 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307254 - DIRECTION
      ?auto_307255 - MODE
      ?auto_307256 - DIRECTION
      ?auto_307253 - MODE
      ?auto_307257 - DIRECTION
      ?auto_307258 - MODE
      ?auto_307259 - DIRECTION
      ?auto_307260 - MODE
    )
    :vars
    (
      ?auto_307262 - INSTRUMENT
      ?auto_307261 - SATELLITE
      ?auto_307263 - DIRECTION
      ?auto_307264 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_307262 ?auto_307261 ) ( SUPPORTS ?auto_307262 ?auto_307260 ) ( not ( = ?auto_307259 ?auto_307263 ) ) ( HAVE_IMAGE ?auto_307257 ?auto_307258 ) ( not ( = ?auto_307257 ?auto_307259 ) ) ( not ( = ?auto_307257 ?auto_307263 ) ) ( not ( = ?auto_307258 ?auto_307260 ) ) ( CALIBRATION_TARGET ?auto_307262 ?auto_307263 ) ( POWER_AVAIL ?auto_307261 ) ( POINTING ?auto_307261 ?auto_307264 ) ( not ( = ?auto_307263 ?auto_307264 ) ) ( not ( = ?auto_307259 ?auto_307264 ) ) ( not ( = ?auto_307257 ?auto_307264 ) ) ( HAVE_IMAGE ?auto_307254 ?auto_307255 ) ( HAVE_IMAGE ?auto_307256 ?auto_307253 ) ( not ( = ?auto_307254 ?auto_307256 ) ) ( not ( = ?auto_307254 ?auto_307257 ) ) ( not ( = ?auto_307254 ?auto_307259 ) ) ( not ( = ?auto_307254 ?auto_307263 ) ) ( not ( = ?auto_307254 ?auto_307264 ) ) ( not ( = ?auto_307255 ?auto_307253 ) ) ( not ( = ?auto_307255 ?auto_307258 ) ) ( not ( = ?auto_307255 ?auto_307260 ) ) ( not ( = ?auto_307256 ?auto_307257 ) ) ( not ( = ?auto_307256 ?auto_307259 ) ) ( not ( = ?auto_307256 ?auto_307263 ) ) ( not ( = ?auto_307256 ?auto_307264 ) ) ( not ( = ?auto_307253 ?auto_307258 ) ) ( not ( = ?auto_307253 ?auto_307260 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307257 ?auto_307258 ?auto_307259 ?auto_307260 )
      ( GET-4IMAGE-VERIFY ?auto_307254 ?auto_307255 ?auto_307256 ?auto_307253 ?auto_307257 ?auto_307258 ?auto_307259 ?auto_307260 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307266 - DIRECTION
      ?auto_307267 - MODE
      ?auto_307268 - DIRECTION
      ?auto_307265 - MODE
      ?auto_307269 - DIRECTION
      ?auto_307270 - MODE
      ?auto_307271 - DIRECTION
      ?auto_307272 - MODE
    )
    :vars
    (
      ?auto_307276 - INSTRUMENT
      ?auto_307275 - SATELLITE
      ?auto_307277 - DIRECTION
      ?auto_307273 - DIRECTION
      ?auto_307274 - MODE
      ?auto_307278 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_307276 ?auto_307275 ) ( SUPPORTS ?auto_307276 ?auto_307272 ) ( not ( = ?auto_307271 ?auto_307277 ) ) ( HAVE_IMAGE ?auto_307273 ?auto_307274 ) ( not ( = ?auto_307273 ?auto_307271 ) ) ( not ( = ?auto_307273 ?auto_307277 ) ) ( not ( = ?auto_307274 ?auto_307272 ) ) ( CALIBRATION_TARGET ?auto_307276 ?auto_307277 ) ( POWER_AVAIL ?auto_307275 ) ( POINTING ?auto_307275 ?auto_307278 ) ( not ( = ?auto_307277 ?auto_307278 ) ) ( not ( = ?auto_307271 ?auto_307278 ) ) ( not ( = ?auto_307273 ?auto_307278 ) ) ( HAVE_IMAGE ?auto_307266 ?auto_307267 ) ( HAVE_IMAGE ?auto_307268 ?auto_307265 ) ( HAVE_IMAGE ?auto_307269 ?auto_307270 ) ( not ( = ?auto_307266 ?auto_307268 ) ) ( not ( = ?auto_307266 ?auto_307269 ) ) ( not ( = ?auto_307266 ?auto_307271 ) ) ( not ( = ?auto_307266 ?auto_307277 ) ) ( not ( = ?auto_307266 ?auto_307273 ) ) ( not ( = ?auto_307266 ?auto_307278 ) ) ( not ( = ?auto_307267 ?auto_307265 ) ) ( not ( = ?auto_307267 ?auto_307270 ) ) ( not ( = ?auto_307267 ?auto_307272 ) ) ( not ( = ?auto_307267 ?auto_307274 ) ) ( not ( = ?auto_307268 ?auto_307269 ) ) ( not ( = ?auto_307268 ?auto_307271 ) ) ( not ( = ?auto_307268 ?auto_307277 ) ) ( not ( = ?auto_307268 ?auto_307273 ) ) ( not ( = ?auto_307268 ?auto_307278 ) ) ( not ( = ?auto_307265 ?auto_307270 ) ) ( not ( = ?auto_307265 ?auto_307272 ) ) ( not ( = ?auto_307265 ?auto_307274 ) ) ( not ( = ?auto_307269 ?auto_307271 ) ) ( not ( = ?auto_307269 ?auto_307277 ) ) ( not ( = ?auto_307269 ?auto_307273 ) ) ( not ( = ?auto_307269 ?auto_307278 ) ) ( not ( = ?auto_307270 ?auto_307272 ) ) ( not ( = ?auto_307270 ?auto_307274 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307273 ?auto_307274 ?auto_307271 ?auto_307272 )
      ( GET-4IMAGE-VERIFY ?auto_307266 ?auto_307267 ?auto_307268 ?auto_307265 ?auto_307269 ?auto_307270 ?auto_307271 ?auto_307272 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307293 - DIRECTION
      ?auto_307294 - MODE
      ?auto_307295 - DIRECTION
      ?auto_307292 - MODE
      ?auto_307296 - DIRECTION
      ?auto_307297 - MODE
      ?auto_307298 - DIRECTION
      ?auto_307299 - MODE
    )
    :vars
    (
      ?auto_307301 - INSTRUMENT
      ?auto_307300 - SATELLITE
      ?auto_307302 - DIRECTION
      ?auto_307303 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_307301 ?auto_307300 ) ( SUPPORTS ?auto_307301 ?auto_307297 ) ( not ( = ?auto_307296 ?auto_307302 ) ) ( HAVE_IMAGE ?auto_307298 ?auto_307299 ) ( not ( = ?auto_307298 ?auto_307296 ) ) ( not ( = ?auto_307298 ?auto_307302 ) ) ( not ( = ?auto_307299 ?auto_307297 ) ) ( CALIBRATION_TARGET ?auto_307301 ?auto_307302 ) ( POWER_AVAIL ?auto_307300 ) ( POINTING ?auto_307300 ?auto_307303 ) ( not ( = ?auto_307302 ?auto_307303 ) ) ( not ( = ?auto_307296 ?auto_307303 ) ) ( not ( = ?auto_307298 ?auto_307303 ) ) ( HAVE_IMAGE ?auto_307293 ?auto_307294 ) ( HAVE_IMAGE ?auto_307295 ?auto_307292 ) ( not ( = ?auto_307293 ?auto_307295 ) ) ( not ( = ?auto_307293 ?auto_307296 ) ) ( not ( = ?auto_307293 ?auto_307298 ) ) ( not ( = ?auto_307293 ?auto_307302 ) ) ( not ( = ?auto_307293 ?auto_307303 ) ) ( not ( = ?auto_307294 ?auto_307292 ) ) ( not ( = ?auto_307294 ?auto_307297 ) ) ( not ( = ?auto_307294 ?auto_307299 ) ) ( not ( = ?auto_307295 ?auto_307296 ) ) ( not ( = ?auto_307295 ?auto_307298 ) ) ( not ( = ?auto_307295 ?auto_307302 ) ) ( not ( = ?auto_307295 ?auto_307303 ) ) ( not ( = ?auto_307292 ?auto_307297 ) ) ( not ( = ?auto_307292 ?auto_307299 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307298 ?auto_307299 ?auto_307296 ?auto_307297 )
      ( GET-4IMAGE-VERIFY ?auto_307293 ?auto_307294 ?auto_307295 ?auto_307292 ?auto_307296 ?auto_307297 ?auto_307298 ?auto_307299 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307305 - DIRECTION
      ?auto_307306 - MODE
      ?auto_307307 - DIRECTION
      ?auto_307304 - MODE
      ?auto_307308 - DIRECTION
      ?auto_307309 - MODE
      ?auto_307310 - DIRECTION
      ?auto_307311 - MODE
    )
    :vars
    (
      ?auto_307315 - INSTRUMENT
      ?auto_307314 - SATELLITE
      ?auto_307316 - DIRECTION
      ?auto_307312 - DIRECTION
      ?auto_307313 - MODE
      ?auto_307317 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_307315 ?auto_307314 ) ( SUPPORTS ?auto_307315 ?auto_307309 ) ( not ( = ?auto_307308 ?auto_307316 ) ) ( HAVE_IMAGE ?auto_307312 ?auto_307313 ) ( not ( = ?auto_307312 ?auto_307308 ) ) ( not ( = ?auto_307312 ?auto_307316 ) ) ( not ( = ?auto_307313 ?auto_307309 ) ) ( CALIBRATION_TARGET ?auto_307315 ?auto_307316 ) ( POWER_AVAIL ?auto_307314 ) ( POINTING ?auto_307314 ?auto_307317 ) ( not ( = ?auto_307316 ?auto_307317 ) ) ( not ( = ?auto_307308 ?auto_307317 ) ) ( not ( = ?auto_307312 ?auto_307317 ) ) ( HAVE_IMAGE ?auto_307305 ?auto_307306 ) ( HAVE_IMAGE ?auto_307307 ?auto_307304 ) ( HAVE_IMAGE ?auto_307310 ?auto_307311 ) ( not ( = ?auto_307305 ?auto_307307 ) ) ( not ( = ?auto_307305 ?auto_307308 ) ) ( not ( = ?auto_307305 ?auto_307310 ) ) ( not ( = ?auto_307305 ?auto_307316 ) ) ( not ( = ?auto_307305 ?auto_307312 ) ) ( not ( = ?auto_307305 ?auto_307317 ) ) ( not ( = ?auto_307306 ?auto_307304 ) ) ( not ( = ?auto_307306 ?auto_307309 ) ) ( not ( = ?auto_307306 ?auto_307311 ) ) ( not ( = ?auto_307306 ?auto_307313 ) ) ( not ( = ?auto_307307 ?auto_307308 ) ) ( not ( = ?auto_307307 ?auto_307310 ) ) ( not ( = ?auto_307307 ?auto_307316 ) ) ( not ( = ?auto_307307 ?auto_307312 ) ) ( not ( = ?auto_307307 ?auto_307317 ) ) ( not ( = ?auto_307304 ?auto_307309 ) ) ( not ( = ?auto_307304 ?auto_307311 ) ) ( not ( = ?auto_307304 ?auto_307313 ) ) ( not ( = ?auto_307308 ?auto_307310 ) ) ( not ( = ?auto_307309 ?auto_307311 ) ) ( not ( = ?auto_307310 ?auto_307316 ) ) ( not ( = ?auto_307310 ?auto_307312 ) ) ( not ( = ?auto_307310 ?auto_307317 ) ) ( not ( = ?auto_307311 ?auto_307313 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307312 ?auto_307313 ?auto_307308 ?auto_307309 )
      ( GET-4IMAGE-VERIFY ?auto_307305 ?auto_307306 ?auto_307307 ?auto_307304 ?auto_307308 ?auto_307309 ?auto_307310 ?auto_307311 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307319 - DIRECTION
      ?auto_307320 - MODE
      ?auto_307321 - DIRECTION
      ?auto_307318 - MODE
      ?auto_307322 - DIRECTION
      ?auto_307323 - MODE
      ?auto_307324 - DIRECTION
      ?auto_307325 - MODE
    )
    :vars
    (
      ?auto_307329 - INSTRUMENT
      ?auto_307328 - SATELLITE
      ?auto_307330 - DIRECTION
      ?auto_307326 - DIRECTION
      ?auto_307327 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_307329 ?auto_307328 ) ( SUPPORTS ?auto_307329 ?auto_307323 ) ( not ( = ?auto_307322 ?auto_307330 ) ) ( HAVE_IMAGE ?auto_307326 ?auto_307327 ) ( not ( = ?auto_307326 ?auto_307322 ) ) ( not ( = ?auto_307326 ?auto_307330 ) ) ( not ( = ?auto_307327 ?auto_307323 ) ) ( CALIBRATION_TARGET ?auto_307329 ?auto_307330 ) ( POWER_AVAIL ?auto_307328 ) ( POINTING ?auto_307328 ?auto_307324 ) ( not ( = ?auto_307330 ?auto_307324 ) ) ( not ( = ?auto_307322 ?auto_307324 ) ) ( not ( = ?auto_307326 ?auto_307324 ) ) ( HAVE_IMAGE ?auto_307319 ?auto_307320 ) ( HAVE_IMAGE ?auto_307321 ?auto_307318 ) ( HAVE_IMAGE ?auto_307324 ?auto_307325 ) ( not ( = ?auto_307319 ?auto_307321 ) ) ( not ( = ?auto_307319 ?auto_307322 ) ) ( not ( = ?auto_307319 ?auto_307324 ) ) ( not ( = ?auto_307319 ?auto_307330 ) ) ( not ( = ?auto_307319 ?auto_307326 ) ) ( not ( = ?auto_307320 ?auto_307318 ) ) ( not ( = ?auto_307320 ?auto_307323 ) ) ( not ( = ?auto_307320 ?auto_307325 ) ) ( not ( = ?auto_307320 ?auto_307327 ) ) ( not ( = ?auto_307321 ?auto_307322 ) ) ( not ( = ?auto_307321 ?auto_307324 ) ) ( not ( = ?auto_307321 ?auto_307330 ) ) ( not ( = ?auto_307321 ?auto_307326 ) ) ( not ( = ?auto_307318 ?auto_307323 ) ) ( not ( = ?auto_307318 ?auto_307325 ) ) ( not ( = ?auto_307318 ?auto_307327 ) ) ( not ( = ?auto_307323 ?auto_307325 ) ) ( not ( = ?auto_307325 ?auto_307327 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307326 ?auto_307327 ?auto_307322 ?auto_307323 )
      ( GET-4IMAGE-VERIFY ?auto_307319 ?auto_307320 ?auto_307321 ?auto_307318 ?auto_307322 ?auto_307323 ?auto_307324 ?auto_307325 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307354 - DIRECTION
      ?auto_307355 - MODE
      ?auto_307356 - DIRECTION
      ?auto_307353 - MODE
      ?auto_307357 - DIRECTION
      ?auto_307358 - MODE
      ?auto_307359 - DIRECTION
      ?auto_307360 - MODE
    )
    :vars
    (
      ?auto_307364 - INSTRUMENT
      ?auto_307363 - SATELLITE
      ?auto_307365 - DIRECTION
      ?auto_307361 - DIRECTION
      ?auto_307362 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_307364 ?auto_307363 ) ( SUPPORTS ?auto_307364 ?auto_307360 ) ( not ( = ?auto_307359 ?auto_307365 ) ) ( HAVE_IMAGE ?auto_307361 ?auto_307362 ) ( not ( = ?auto_307361 ?auto_307359 ) ) ( not ( = ?auto_307361 ?auto_307365 ) ) ( not ( = ?auto_307362 ?auto_307360 ) ) ( CALIBRATION_TARGET ?auto_307364 ?auto_307365 ) ( POWER_AVAIL ?auto_307363 ) ( POINTING ?auto_307363 ?auto_307356 ) ( not ( = ?auto_307365 ?auto_307356 ) ) ( not ( = ?auto_307359 ?auto_307356 ) ) ( not ( = ?auto_307361 ?auto_307356 ) ) ( HAVE_IMAGE ?auto_307354 ?auto_307355 ) ( HAVE_IMAGE ?auto_307356 ?auto_307353 ) ( HAVE_IMAGE ?auto_307357 ?auto_307358 ) ( not ( = ?auto_307354 ?auto_307356 ) ) ( not ( = ?auto_307354 ?auto_307357 ) ) ( not ( = ?auto_307354 ?auto_307359 ) ) ( not ( = ?auto_307354 ?auto_307365 ) ) ( not ( = ?auto_307354 ?auto_307361 ) ) ( not ( = ?auto_307355 ?auto_307353 ) ) ( not ( = ?auto_307355 ?auto_307358 ) ) ( not ( = ?auto_307355 ?auto_307360 ) ) ( not ( = ?auto_307355 ?auto_307362 ) ) ( not ( = ?auto_307356 ?auto_307357 ) ) ( not ( = ?auto_307353 ?auto_307358 ) ) ( not ( = ?auto_307353 ?auto_307360 ) ) ( not ( = ?auto_307353 ?auto_307362 ) ) ( not ( = ?auto_307357 ?auto_307359 ) ) ( not ( = ?auto_307357 ?auto_307365 ) ) ( not ( = ?auto_307357 ?auto_307361 ) ) ( not ( = ?auto_307358 ?auto_307360 ) ) ( not ( = ?auto_307358 ?auto_307362 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307361 ?auto_307362 ?auto_307359 ?auto_307360 )
      ( GET-4IMAGE-VERIFY ?auto_307354 ?auto_307355 ?auto_307356 ?auto_307353 ?auto_307357 ?auto_307358 ?auto_307359 ?auto_307360 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307439 - DIRECTION
      ?auto_307440 - MODE
      ?auto_307441 - DIRECTION
      ?auto_307438 - MODE
      ?auto_307442 - DIRECTION
      ?auto_307443 - MODE
      ?auto_307444 - DIRECTION
      ?auto_307445 - MODE
    )
    :vars
    (
      ?auto_307447 - INSTRUMENT
      ?auto_307446 - SATELLITE
      ?auto_307448 - DIRECTION
      ?auto_307449 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_307447 ?auto_307446 ) ( SUPPORTS ?auto_307447 ?auto_307438 ) ( not ( = ?auto_307441 ?auto_307448 ) ) ( HAVE_IMAGE ?auto_307442 ?auto_307443 ) ( not ( = ?auto_307442 ?auto_307441 ) ) ( not ( = ?auto_307442 ?auto_307448 ) ) ( not ( = ?auto_307443 ?auto_307438 ) ) ( CALIBRATION_TARGET ?auto_307447 ?auto_307448 ) ( POWER_AVAIL ?auto_307446 ) ( POINTING ?auto_307446 ?auto_307449 ) ( not ( = ?auto_307448 ?auto_307449 ) ) ( not ( = ?auto_307441 ?auto_307449 ) ) ( not ( = ?auto_307442 ?auto_307449 ) ) ( HAVE_IMAGE ?auto_307439 ?auto_307440 ) ( HAVE_IMAGE ?auto_307444 ?auto_307445 ) ( not ( = ?auto_307439 ?auto_307441 ) ) ( not ( = ?auto_307439 ?auto_307442 ) ) ( not ( = ?auto_307439 ?auto_307444 ) ) ( not ( = ?auto_307439 ?auto_307448 ) ) ( not ( = ?auto_307439 ?auto_307449 ) ) ( not ( = ?auto_307440 ?auto_307438 ) ) ( not ( = ?auto_307440 ?auto_307443 ) ) ( not ( = ?auto_307440 ?auto_307445 ) ) ( not ( = ?auto_307441 ?auto_307444 ) ) ( not ( = ?auto_307438 ?auto_307445 ) ) ( not ( = ?auto_307442 ?auto_307444 ) ) ( not ( = ?auto_307443 ?auto_307445 ) ) ( not ( = ?auto_307444 ?auto_307448 ) ) ( not ( = ?auto_307444 ?auto_307449 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307442 ?auto_307443 ?auto_307441 ?auto_307438 )
      ( GET-4IMAGE-VERIFY ?auto_307439 ?auto_307440 ?auto_307441 ?auto_307438 ?auto_307442 ?auto_307443 ?auto_307444 ?auto_307445 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307483 - DIRECTION
      ?auto_307484 - MODE
      ?auto_307485 - DIRECTION
      ?auto_307482 - MODE
      ?auto_307486 - DIRECTION
      ?auto_307487 - MODE
      ?auto_307488 - DIRECTION
      ?auto_307489 - MODE
    )
    :vars
    (
      ?auto_307493 - INSTRUMENT
      ?auto_307492 - SATELLITE
      ?auto_307494 - DIRECTION
      ?auto_307490 - DIRECTION
      ?auto_307491 - MODE
      ?auto_307495 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_307493 ?auto_307492 ) ( SUPPORTS ?auto_307493 ?auto_307482 ) ( not ( = ?auto_307485 ?auto_307494 ) ) ( HAVE_IMAGE ?auto_307490 ?auto_307491 ) ( not ( = ?auto_307490 ?auto_307485 ) ) ( not ( = ?auto_307490 ?auto_307494 ) ) ( not ( = ?auto_307491 ?auto_307482 ) ) ( CALIBRATION_TARGET ?auto_307493 ?auto_307494 ) ( POWER_AVAIL ?auto_307492 ) ( POINTING ?auto_307492 ?auto_307495 ) ( not ( = ?auto_307494 ?auto_307495 ) ) ( not ( = ?auto_307485 ?auto_307495 ) ) ( not ( = ?auto_307490 ?auto_307495 ) ) ( HAVE_IMAGE ?auto_307483 ?auto_307484 ) ( HAVE_IMAGE ?auto_307486 ?auto_307487 ) ( HAVE_IMAGE ?auto_307488 ?auto_307489 ) ( not ( = ?auto_307483 ?auto_307485 ) ) ( not ( = ?auto_307483 ?auto_307486 ) ) ( not ( = ?auto_307483 ?auto_307488 ) ) ( not ( = ?auto_307483 ?auto_307494 ) ) ( not ( = ?auto_307483 ?auto_307490 ) ) ( not ( = ?auto_307483 ?auto_307495 ) ) ( not ( = ?auto_307484 ?auto_307482 ) ) ( not ( = ?auto_307484 ?auto_307487 ) ) ( not ( = ?auto_307484 ?auto_307489 ) ) ( not ( = ?auto_307484 ?auto_307491 ) ) ( not ( = ?auto_307485 ?auto_307486 ) ) ( not ( = ?auto_307485 ?auto_307488 ) ) ( not ( = ?auto_307482 ?auto_307487 ) ) ( not ( = ?auto_307482 ?auto_307489 ) ) ( not ( = ?auto_307486 ?auto_307488 ) ) ( not ( = ?auto_307486 ?auto_307494 ) ) ( not ( = ?auto_307486 ?auto_307490 ) ) ( not ( = ?auto_307486 ?auto_307495 ) ) ( not ( = ?auto_307487 ?auto_307489 ) ) ( not ( = ?auto_307487 ?auto_307491 ) ) ( not ( = ?auto_307488 ?auto_307494 ) ) ( not ( = ?auto_307488 ?auto_307490 ) ) ( not ( = ?auto_307488 ?auto_307495 ) ) ( not ( = ?auto_307489 ?auto_307491 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307490 ?auto_307491 ?auto_307485 ?auto_307482 )
      ( GET-4IMAGE-VERIFY ?auto_307483 ?auto_307484 ?auto_307485 ?auto_307482 ?auto_307486 ?auto_307487 ?auto_307488 ?auto_307489 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307497 - DIRECTION
      ?auto_307498 - MODE
      ?auto_307499 - DIRECTION
      ?auto_307496 - MODE
      ?auto_307500 - DIRECTION
      ?auto_307501 - MODE
      ?auto_307502 - DIRECTION
      ?auto_307503 - MODE
    )
    :vars
    (
      ?auto_307507 - INSTRUMENT
      ?auto_307506 - SATELLITE
      ?auto_307508 - DIRECTION
      ?auto_307504 - DIRECTION
      ?auto_307505 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_307507 ?auto_307506 ) ( SUPPORTS ?auto_307507 ?auto_307496 ) ( not ( = ?auto_307499 ?auto_307508 ) ) ( HAVE_IMAGE ?auto_307504 ?auto_307505 ) ( not ( = ?auto_307504 ?auto_307499 ) ) ( not ( = ?auto_307504 ?auto_307508 ) ) ( not ( = ?auto_307505 ?auto_307496 ) ) ( CALIBRATION_TARGET ?auto_307507 ?auto_307508 ) ( POWER_AVAIL ?auto_307506 ) ( POINTING ?auto_307506 ?auto_307502 ) ( not ( = ?auto_307508 ?auto_307502 ) ) ( not ( = ?auto_307499 ?auto_307502 ) ) ( not ( = ?auto_307504 ?auto_307502 ) ) ( HAVE_IMAGE ?auto_307497 ?auto_307498 ) ( HAVE_IMAGE ?auto_307500 ?auto_307501 ) ( HAVE_IMAGE ?auto_307502 ?auto_307503 ) ( not ( = ?auto_307497 ?auto_307499 ) ) ( not ( = ?auto_307497 ?auto_307500 ) ) ( not ( = ?auto_307497 ?auto_307502 ) ) ( not ( = ?auto_307497 ?auto_307508 ) ) ( not ( = ?auto_307497 ?auto_307504 ) ) ( not ( = ?auto_307498 ?auto_307496 ) ) ( not ( = ?auto_307498 ?auto_307501 ) ) ( not ( = ?auto_307498 ?auto_307503 ) ) ( not ( = ?auto_307498 ?auto_307505 ) ) ( not ( = ?auto_307499 ?auto_307500 ) ) ( not ( = ?auto_307496 ?auto_307501 ) ) ( not ( = ?auto_307496 ?auto_307503 ) ) ( not ( = ?auto_307500 ?auto_307502 ) ) ( not ( = ?auto_307500 ?auto_307508 ) ) ( not ( = ?auto_307500 ?auto_307504 ) ) ( not ( = ?auto_307501 ?auto_307503 ) ) ( not ( = ?auto_307501 ?auto_307505 ) ) ( not ( = ?auto_307503 ?auto_307505 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307504 ?auto_307505 ?auto_307499 ?auto_307496 )
      ( GET-4IMAGE-VERIFY ?auto_307497 ?auto_307498 ?auto_307499 ?auto_307496 ?auto_307500 ?auto_307501 ?auto_307502 ?auto_307503 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307706 - DIRECTION
      ?auto_307707 - MODE
      ?auto_307708 - DIRECTION
      ?auto_307705 - MODE
      ?auto_307709 - DIRECTION
      ?auto_307710 - MODE
      ?auto_307711 - DIRECTION
      ?auto_307712 - MODE
    )
    :vars
    (
      ?auto_307716 - INSTRUMENT
      ?auto_307715 - SATELLITE
      ?auto_307717 - DIRECTION
      ?auto_307713 - DIRECTION
      ?auto_307714 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_307716 ?auto_307715 ) ( SUPPORTS ?auto_307716 ?auto_307712 ) ( not ( = ?auto_307711 ?auto_307717 ) ) ( HAVE_IMAGE ?auto_307713 ?auto_307714 ) ( not ( = ?auto_307713 ?auto_307711 ) ) ( not ( = ?auto_307713 ?auto_307717 ) ) ( not ( = ?auto_307714 ?auto_307712 ) ) ( CALIBRATION_TARGET ?auto_307716 ?auto_307717 ) ( POWER_AVAIL ?auto_307715 ) ( POINTING ?auto_307715 ?auto_307706 ) ( not ( = ?auto_307717 ?auto_307706 ) ) ( not ( = ?auto_307711 ?auto_307706 ) ) ( not ( = ?auto_307713 ?auto_307706 ) ) ( HAVE_IMAGE ?auto_307706 ?auto_307707 ) ( HAVE_IMAGE ?auto_307708 ?auto_307705 ) ( HAVE_IMAGE ?auto_307709 ?auto_307710 ) ( not ( = ?auto_307706 ?auto_307708 ) ) ( not ( = ?auto_307706 ?auto_307709 ) ) ( not ( = ?auto_307707 ?auto_307705 ) ) ( not ( = ?auto_307707 ?auto_307710 ) ) ( not ( = ?auto_307707 ?auto_307712 ) ) ( not ( = ?auto_307707 ?auto_307714 ) ) ( not ( = ?auto_307708 ?auto_307709 ) ) ( not ( = ?auto_307708 ?auto_307711 ) ) ( not ( = ?auto_307708 ?auto_307717 ) ) ( not ( = ?auto_307708 ?auto_307713 ) ) ( not ( = ?auto_307705 ?auto_307710 ) ) ( not ( = ?auto_307705 ?auto_307712 ) ) ( not ( = ?auto_307705 ?auto_307714 ) ) ( not ( = ?auto_307709 ?auto_307711 ) ) ( not ( = ?auto_307709 ?auto_307717 ) ) ( not ( = ?auto_307709 ?auto_307713 ) ) ( not ( = ?auto_307710 ?auto_307712 ) ) ( not ( = ?auto_307710 ?auto_307714 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307713 ?auto_307714 ?auto_307711 ?auto_307712 )
      ( GET-4IMAGE-VERIFY ?auto_307706 ?auto_307707 ?auto_307708 ?auto_307705 ?auto_307709 ?auto_307710 ?auto_307711 ?auto_307712 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307740 - DIRECTION
      ?auto_307741 - MODE
      ?auto_307742 - DIRECTION
      ?auto_307739 - MODE
      ?auto_307743 - DIRECTION
      ?auto_307744 - MODE
      ?auto_307745 - DIRECTION
      ?auto_307746 - MODE
    )
    :vars
    (
      ?auto_307750 - INSTRUMENT
      ?auto_307749 - SATELLITE
      ?auto_307751 - DIRECTION
      ?auto_307747 - DIRECTION
      ?auto_307748 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_307750 ?auto_307749 ) ( SUPPORTS ?auto_307750 ?auto_307744 ) ( not ( = ?auto_307743 ?auto_307751 ) ) ( HAVE_IMAGE ?auto_307747 ?auto_307748 ) ( not ( = ?auto_307747 ?auto_307743 ) ) ( not ( = ?auto_307747 ?auto_307751 ) ) ( not ( = ?auto_307748 ?auto_307744 ) ) ( CALIBRATION_TARGET ?auto_307750 ?auto_307751 ) ( POWER_AVAIL ?auto_307749 ) ( POINTING ?auto_307749 ?auto_307740 ) ( not ( = ?auto_307751 ?auto_307740 ) ) ( not ( = ?auto_307743 ?auto_307740 ) ) ( not ( = ?auto_307747 ?auto_307740 ) ) ( HAVE_IMAGE ?auto_307740 ?auto_307741 ) ( HAVE_IMAGE ?auto_307742 ?auto_307739 ) ( HAVE_IMAGE ?auto_307745 ?auto_307746 ) ( not ( = ?auto_307740 ?auto_307742 ) ) ( not ( = ?auto_307740 ?auto_307745 ) ) ( not ( = ?auto_307741 ?auto_307739 ) ) ( not ( = ?auto_307741 ?auto_307744 ) ) ( not ( = ?auto_307741 ?auto_307746 ) ) ( not ( = ?auto_307741 ?auto_307748 ) ) ( not ( = ?auto_307742 ?auto_307743 ) ) ( not ( = ?auto_307742 ?auto_307745 ) ) ( not ( = ?auto_307742 ?auto_307751 ) ) ( not ( = ?auto_307742 ?auto_307747 ) ) ( not ( = ?auto_307739 ?auto_307744 ) ) ( not ( = ?auto_307739 ?auto_307746 ) ) ( not ( = ?auto_307739 ?auto_307748 ) ) ( not ( = ?auto_307743 ?auto_307745 ) ) ( not ( = ?auto_307744 ?auto_307746 ) ) ( not ( = ?auto_307745 ?auto_307751 ) ) ( not ( = ?auto_307745 ?auto_307747 ) ) ( not ( = ?auto_307746 ?auto_307748 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307747 ?auto_307748 ?auto_307743 ?auto_307744 )
      ( GET-4IMAGE-VERIFY ?auto_307740 ?auto_307741 ?auto_307742 ?auto_307739 ?auto_307743 ?auto_307744 ?auto_307745 ?auto_307746 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307915 - DIRECTION
      ?auto_307916 - MODE
      ?auto_307917 - DIRECTION
      ?auto_307914 - MODE
      ?auto_307918 - DIRECTION
      ?auto_307919 - MODE
      ?auto_307920 - DIRECTION
      ?auto_307921 - MODE
    )
    :vars
    (
      ?auto_307925 - INSTRUMENT
      ?auto_307924 - SATELLITE
      ?auto_307926 - DIRECTION
      ?auto_307922 - DIRECTION
      ?auto_307923 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_307925 ?auto_307924 ) ( SUPPORTS ?auto_307925 ?auto_307914 ) ( not ( = ?auto_307917 ?auto_307926 ) ) ( HAVE_IMAGE ?auto_307922 ?auto_307923 ) ( not ( = ?auto_307922 ?auto_307917 ) ) ( not ( = ?auto_307922 ?auto_307926 ) ) ( not ( = ?auto_307923 ?auto_307914 ) ) ( CALIBRATION_TARGET ?auto_307925 ?auto_307926 ) ( POWER_AVAIL ?auto_307924 ) ( POINTING ?auto_307924 ?auto_307915 ) ( not ( = ?auto_307926 ?auto_307915 ) ) ( not ( = ?auto_307917 ?auto_307915 ) ) ( not ( = ?auto_307922 ?auto_307915 ) ) ( HAVE_IMAGE ?auto_307915 ?auto_307916 ) ( HAVE_IMAGE ?auto_307918 ?auto_307919 ) ( HAVE_IMAGE ?auto_307920 ?auto_307921 ) ( not ( = ?auto_307915 ?auto_307918 ) ) ( not ( = ?auto_307915 ?auto_307920 ) ) ( not ( = ?auto_307916 ?auto_307914 ) ) ( not ( = ?auto_307916 ?auto_307919 ) ) ( not ( = ?auto_307916 ?auto_307921 ) ) ( not ( = ?auto_307916 ?auto_307923 ) ) ( not ( = ?auto_307917 ?auto_307918 ) ) ( not ( = ?auto_307917 ?auto_307920 ) ) ( not ( = ?auto_307914 ?auto_307919 ) ) ( not ( = ?auto_307914 ?auto_307921 ) ) ( not ( = ?auto_307918 ?auto_307920 ) ) ( not ( = ?auto_307918 ?auto_307926 ) ) ( not ( = ?auto_307918 ?auto_307922 ) ) ( not ( = ?auto_307919 ?auto_307921 ) ) ( not ( = ?auto_307919 ?auto_307923 ) ) ( not ( = ?auto_307920 ?auto_307926 ) ) ( not ( = ?auto_307920 ?auto_307922 ) ) ( not ( = ?auto_307921 ?auto_307923 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307922 ?auto_307923 ?auto_307917 ?auto_307914 )
      ( GET-4IMAGE-VERIFY ?auto_307915 ?auto_307916 ?auto_307917 ?auto_307914 ?auto_307918 ?auto_307919 ?auto_307920 ?auto_307921 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308054 - DIRECTION
      ?auto_308055 - MODE
      ?auto_308056 - DIRECTION
      ?auto_308053 - MODE
      ?auto_308057 - DIRECTION
      ?auto_308058 - MODE
      ?auto_308059 - DIRECTION
      ?auto_308060 - MODE
    )
    :vars
    (
      ?auto_308062 - INSTRUMENT
      ?auto_308061 - SATELLITE
      ?auto_308063 - DIRECTION
      ?auto_308064 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_308062 ?auto_308061 ) ( SUPPORTS ?auto_308062 ?auto_308055 ) ( not ( = ?auto_308054 ?auto_308063 ) ) ( HAVE_IMAGE ?auto_308057 ?auto_308053 ) ( not ( = ?auto_308057 ?auto_308054 ) ) ( not ( = ?auto_308057 ?auto_308063 ) ) ( not ( = ?auto_308053 ?auto_308055 ) ) ( CALIBRATION_TARGET ?auto_308062 ?auto_308063 ) ( POWER_AVAIL ?auto_308061 ) ( POINTING ?auto_308061 ?auto_308064 ) ( not ( = ?auto_308063 ?auto_308064 ) ) ( not ( = ?auto_308054 ?auto_308064 ) ) ( not ( = ?auto_308057 ?auto_308064 ) ) ( HAVE_IMAGE ?auto_308056 ?auto_308053 ) ( HAVE_IMAGE ?auto_308057 ?auto_308058 ) ( HAVE_IMAGE ?auto_308059 ?auto_308060 ) ( not ( = ?auto_308054 ?auto_308056 ) ) ( not ( = ?auto_308054 ?auto_308059 ) ) ( not ( = ?auto_308055 ?auto_308058 ) ) ( not ( = ?auto_308055 ?auto_308060 ) ) ( not ( = ?auto_308056 ?auto_308057 ) ) ( not ( = ?auto_308056 ?auto_308059 ) ) ( not ( = ?auto_308056 ?auto_308063 ) ) ( not ( = ?auto_308056 ?auto_308064 ) ) ( not ( = ?auto_308053 ?auto_308058 ) ) ( not ( = ?auto_308053 ?auto_308060 ) ) ( not ( = ?auto_308057 ?auto_308059 ) ) ( not ( = ?auto_308058 ?auto_308060 ) ) ( not ( = ?auto_308059 ?auto_308063 ) ) ( not ( = ?auto_308059 ?auto_308064 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308057 ?auto_308053 ?auto_308054 ?auto_308055 )
      ( GET-4IMAGE-VERIFY ?auto_308054 ?auto_308055 ?auto_308056 ?auto_308053 ?auto_308057 ?auto_308058 ?auto_308059 ?auto_308060 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308066 - DIRECTION
      ?auto_308067 - MODE
      ?auto_308068 - DIRECTION
      ?auto_308065 - MODE
      ?auto_308069 - DIRECTION
      ?auto_308070 - MODE
      ?auto_308071 - DIRECTION
      ?auto_308072 - MODE
    )
    :vars
    (
      ?auto_308074 - INSTRUMENT
      ?auto_308073 - SATELLITE
      ?auto_308075 - DIRECTION
      ?auto_308076 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_308074 ?auto_308073 ) ( SUPPORTS ?auto_308074 ?auto_308067 ) ( not ( = ?auto_308066 ?auto_308075 ) ) ( HAVE_IMAGE ?auto_308068 ?auto_308065 ) ( not ( = ?auto_308068 ?auto_308066 ) ) ( not ( = ?auto_308068 ?auto_308075 ) ) ( not ( = ?auto_308065 ?auto_308067 ) ) ( CALIBRATION_TARGET ?auto_308074 ?auto_308075 ) ( POWER_AVAIL ?auto_308073 ) ( POINTING ?auto_308073 ?auto_308076 ) ( not ( = ?auto_308075 ?auto_308076 ) ) ( not ( = ?auto_308066 ?auto_308076 ) ) ( not ( = ?auto_308068 ?auto_308076 ) ) ( HAVE_IMAGE ?auto_308069 ?auto_308070 ) ( HAVE_IMAGE ?auto_308071 ?auto_308072 ) ( not ( = ?auto_308066 ?auto_308069 ) ) ( not ( = ?auto_308066 ?auto_308071 ) ) ( not ( = ?auto_308067 ?auto_308070 ) ) ( not ( = ?auto_308067 ?auto_308072 ) ) ( not ( = ?auto_308068 ?auto_308069 ) ) ( not ( = ?auto_308068 ?auto_308071 ) ) ( not ( = ?auto_308065 ?auto_308070 ) ) ( not ( = ?auto_308065 ?auto_308072 ) ) ( not ( = ?auto_308069 ?auto_308071 ) ) ( not ( = ?auto_308069 ?auto_308075 ) ) ( not ( = ?auto_308069 ?auto_308076 ) ) ( not ( = ?auto_308070 ?auto_308072 ) ) ( not ( = ?auto_308071 ?auto_308075 ) ) ( not ( = ?auto_308071 ?auto_308076 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308068 ?auto_308065 ?auto_308066 ?auto_308067 )
      ( GET-4IMAGE-VERIFY ?auto_308066 ?auto_308067 ?auto_308068 ?auto_308065 ?auto_308069 ?auto_308070 ?auto_308071 ?auto_308072 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308101 - DIRECTION
      ?auto_308102 - MODE
      ?auto_308103 - DIRECTION
      ?auto_308100 - MODE
      ?auto_308104 - DIRECTION
      ?auto_308105 - MODE
      ?auto_308106 - DIRECTION
      ?auto_308107 - MODE
    )
    :vars
    (
      ?auto_308109 - INSTRUMENT
      ?auto_308108 - SATELLITE
      ?auto_308110 - DIRECTION
      ?auto_308111 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_308109 ?auto_308108 ) ( SUPPORTS ?auto_308109 ?auto_308102 ) ( not ( = ?auto_308101 ?auto_308110 ) ) ( HAVE_IMAGE ?auto_308106 ?auto_308107 ) ( not ( = ?auto_308106 ?auto_308101 ) ) ( not ( = ?auto_308106 ?auto_308110 ) ) ( not ( = ?auto_308107 ?auto_308102 ) ) ( CALIBRATION_TARGET ?auto_308109 ?auto_308110 ) ( POWER_AVAIL ?auto_308108 ) ( POINTING ?auto_308108 ?auto_308111 ) ( not ( = ?auto_308110 ?auto_308111 ) ) ( not ( = ?auto_308101 ?auto_308111 ) ) ( not ( = ?auto_308106 ?auto_308111 ) ) ( HAVE_IMAGE ?auto_308103 ?auto_308100 ) ( HAVE_IMAGE ?auto_308104 ?auto_308105 ) ( not ( = ?auto_308101 ?auto_308103 ) ) ( not ( = ?auto_308101 ?auto_308104 ) ) ( not ( = ?auto_308102 ?auto_308100 ) ) ( not ( = ?auto_308102 ?auto_308105 ) ) ( not ( = ?auto_308103 ?auto_308104 ) ) ( not ( = ?auto_308103 ?auto_308106 ) ) ( not ( = ?auto_308103 ?auto_308110 ) ) ( not ( = ?auto_308103 ?auto_308111 ) ) ( not ( = ?auto_308100 ?auto_308105 ) ) ( not ( = ?auto_308100 ?auto_308107 ) ) ( not ( = ?auto_308104 ?auto_308106 ) ) ( not ( = ?auto_308104 ?auto_308110 ) ) ( not ( = ?auto_308104 ?auto_308111 ) ) ( not ( = ?auto_308105 ?auto_308107 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308106 ?auto_308107 ?auto_308101 ?auto_308102 )
      ( GET-4IMAGE-VERIFY ?auto_308101 ?auto_308102 ?auto_308103 ?auto_308100 ?auto_308104 ?auto_308105 ?auto_308106 ?auto_308107 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308145 - DIRECTION
      ?auto_308146 - MODE
      ?auto_308147 - DIRECTION
      ?auto_308144 - MODE
      ?auto_308148 - DIRECTION
      ?auto_308149 - MODE
      ?auto_308150 - DIRECTION
      ?auto_308151 - MODE
    )
    :vars
    (
      ?auto_308153 - INSTRUMENT
      ?auto_308152 - SATELLITE
      ?auto_308154 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_308153 ?auto_308152 ) ( SUPPORTS ?auto_308153 ?auto_308146 ) ( not ( = ?auto_308145 ?auto_308154 ) ) ( HAVE_IMAGE ?auto_308147 ?auto_308151 ) ( not ( = ?auto_308147 ?auto_308145 ) ) ( not ( = ?auto_308147 ?auto_308154 ) ) ( not ( = ?auto_308151 ?auto_308146 ) ) ( CALIBRATION_TARGET ?auto_308153 ?auto_308154 ) ( POWER_AVAIL ?auto_308152 ) ( POINTING ?auto_308152 ?auto_308148 ) ( not ( = ?auto_308154 ?auto_308148 ) ) ( not ( = ?auto_308145 ?auto_308148 ) ) ( not ( = ?auto_308147 ?auto_308148 ) ) ( HAVE_IMAGE ?auto_308147 ?auto_308144 ) ( HAVE_IMAGE ?auto_308148 ?auto_308149 ) ( HAVE_IMAGE ?auto_308150 ?auto_308151 ) ( not ( = ?auto_308145 ?auto_308150 ) ) ( not ( = ?auto_308146 ?auto_308144 ) ) ( not ( = ?auto_308146 ?auto_308149 ) ) ( not ( = ?auto_308147 ?auto_308150 ) ) ( not ( = ?auto_308144 ?auto_308149 ) ) ( not ( = ?auto_308144 ?auto_308151 ) ) ( not ( = ?auto_308148 ?auto_308150 ) ) ( not ( = ?auto_308149 ?auto_308151 ) ) ( not ( = ?auto_308150 ?auto_308154 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308147 ?auto_308151 ?auto_308145 ?auto_308146 )
      ( GET-4IMAGE-VERIFY ?auto_308145 ?auto_308146 ?auto_308147 ?auto_308144 ?auto_308148 ?auto_308149 ?auto_308150 ?auto_308151 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308167 - DIRECTION
      ?auto_308168 - MODE
      ?auto_308169 - DIRECTION
      ?auto_308166 - MODE
      ?auto_308170 - DIRECTION
      ?auto_308171 - MODE
      ?auto_308172 - DIRECTION
      ?auto_308173 - MODE
    )
    :vars
    (
      ?auto_308175 - INSTRUMENT
      ?auto_308174 - SATELLITE
      ?auto_308176 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_308175 ?auto_308174 ) ( SUPPORTS ?auto_308175 ?auto_308168 ) ( not ( = ?auto_308167 ?auto_308176 ) ) ( HAVE_IMAGE ?auto_308169 ?auto_308166 ) ( not ( = ?auto_308169 ?auto_308167 ) ) ( not ( = ?auto_308169 ?auto_308176 ) ) ( not ( = ?auto_308166 ?auto_308168 ) ) ( CALIBRATION_TARGET ?auto_308175 ?auto_308176 ) ( POWER_AVAIL ?auto_308174 ) ( POINTING ?auto_308174 ?auto_308172 ) ( not ( = ?auto_308176 ?auto_308172 ) ) ( not ( = ?auto_308167 ?auto_308172 ) ) ( not ( = ?auto_308169 ?auto_308172 ) ) ( HAVE_IMAGE ?auto_308170 ?auto_308171 ) ( HAVE_IMAGE ?auto_308172 ?auto_308173 ) ( not ( = ?auto_308167 ?auto_308170 ) ) ( not ( = ?auto_308168 ?auto_308171 ) ) ( not ( = ?auto_308168 ?auto_308173 ) ) ( not ( = ?auto_308169 ?auto_308170 ) ) ( not ( = ?auto_308166 ?auto_308171 ) ) ( not ( = ?auto_308166 ?auto_308173 ) ) ( not ( = ?auto_308170 ?auto_308172 ) ) ( not ( = ?auto_308170 ?auto_308176 ) ) ( not ( = ?auto_308171 ?auto_308173 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308169 ?auto_308166 ?auto_308167 ?auto_308168 )
      ( GET-4IMAGE-VERIFY ?auto_308167 ?auto_308168 ?auto_308169 ?auto_308166 ?auto_308170 ?auto_308171 ?auto_308172 ?auto_308173 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308236 - DIRECTION
      ?auto_308237 - MODE
      ?auto_308238 - DIRECTION
      ?auto_308235 - MODE
      ?auto_308239 - DIRECTION
      ?auto_308240 - MODE
      ?auto_308241 - DIRECTION
      ?auto_308242 - MODE
    )
    :vars
    (
      ?auto_308244 - INSTRUMENT
      ?auto_308243 - SATELLITE
      ?auto_308245 - DIRECTION
      ?auto_308246 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_308244 ?auto_308243 ) ( SUPPORTS ?auto_308244 ?auto_308237 ) ( not ( = ?auto_308236 ?auto_308245 ) ) ( HAVE_IMAGE ?auto_308239 ?auto_308242 ) ( not ( = ?auto_308239 ?auto_308236 ) ) ( not ( = ?auto_308239 ?auto_308245 ) ) ( not ( = ?auto_308242 ?auto_308237 ) ) ( CALIBRATION_TARGET ?auto_308244 ?auto_308245 ) ( POWER_AVAIL ?auto_308243 ) ( POINTING ?auto_308243 ?auto_308246 ) ( not ( = ?auto_308245 ?auto_308246 ) ) ( not ( = ?auto_308236 ?auto_308246 ) ) ( not ( = ?auto_308239 ?auto_308246 ) ) ( HAVE_IMAGE ?auto_308238 ?auto_308235 ) ( HAVE_IMAGE ?auto_308239 ?auto_308240 ) ( HAVE_IMAGE ?auto_308241 ?auto_308242 ) ( not ( = ?auto_308236 ?auto_308238 ) ) ( not ( = ?auto_308236 ?auto_308241 ) ) ( not ( = ?auto_308237 ?auto_308235 ) ) ( not ( = ?auto_308237 ?auto_308240 ) ) ( not ( = ?auto_308238 ?auto_308239 ) ) ( not ( = ?auto_308238 ?auto_308241 ) ) ( not ( = ?auto_308238 ?auto_308245 ) ) ( not ( = ?auto_308238 ?auto_308246 ) ) ( not ( = ?auto_308235 ?auto_308240 ) ) ( not ( = ?auto_308235 ?auto_308242 ) ) ( not ( = ?auto_308239 ?auto_308241 ) ) ( not ( = ?auto_308240 ?auto_308242 ) ) ( not ( = ?auto_308241 ?auto_308245 ) ) ( not ( = ?auto_308241 ?auto_308246 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308239 ?auto_308242 ?auto_308236 ?auto_308237 )
      ( GET-4IMAGE-VERIFY ?auto_308236 ?auto_308237 ?auto_308238 ?auto_308235 ?auto_308239 ?auto_308240 ?auto_308241 ?auto_308242 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308248 - DIRECTION
      ?auto_308249 - MODE
      ?auto_308250 - DIRECTION
      ?auto_308247 - MODE
      ?auto_308251 - DIRECTION
      ?auto_308252 - MODE
      ?auto_308253 - DIRECTION
      ?auto_308254 - MODE
    )
    :vars
    (
      ?auto_308256 - INSTRUMENT
      ?auto_308255 - SATELLITE
      ?auto_308257 - DIRECTION
      ?auto_308258 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_308256 ?auto_308255 ) ( SUPPORTS ?auto_308256 ?auto_308249 ) ( not ( = ?auto_308248 ?auto_308257 ) ) ( HAVE_IMAGE ?auto_308251 ?auto_308252 ) ( not ( = ?auto_308251 ?auto_308248 ) ) ( not ( = ?auto_308251 ?auto_308257 ) ) ( not ( = ?auto_308252 ?auto_308249 ) ) ( CALIBRATION_TARGET ?auto_308256 ?auto_308257 ) ( POWER_AVAIL ?auto_308255 ) ( POINTING ?auto_308255 ?auto_308258 ) ( not ( = ?auto_308257 ?auto_308258 ) ) ( not ( = ?auto_308248 ?auto_308258 ) ) ( not ( = ?auto_308251 ?auto_308258 ) ) ( HAVE_IMAGE ?auto_308250 ?auto_308247 ) ( HAVE_IMAGE ?auto_308253 ?auto_308254 ) ( not ( = ?auto_308248 ?auto_308250 ) ) ( not ( = ?auto_308248 ?auto_308253 ) ) ( not ( = ?auto_308249 ?auto_308247 ) ) ( not ( = ?auto_308249 ?auto_308254 ) ) ( not ( = ?auto_308250 ?auto_308251 ) ) ( not ( = ?auto_308250 ?auto_308253 ) ) ( not ( = ?auto_308250 ?auto_308257 ) ) ( not ( = ?auto_308250 ?auto_308258 ) ) ( not ( = ?auto_308247 ?auto_308252 ) ) ( not ( = ?auto_308247 ?auto_308254 ) ) ( not ( = ?auto_308251 ?auto_308253 ) ) ( not ( = ?auto_308252 ?auto_308254 ) ) ( not ( = ?auto_308253 ?auto_308257 ) ) ( not ( = ?auto_308253 ?auto_308258 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308251 ?auto_308252 ?auto_308248 ?auto_308249 )
      ( GET-4IMAGE-VERIFY ?auto_308248 ?auto_308249 ?auto_308250 ?auto_308247 ?auto_308251 ?auto_308252 ?auto_308253 ?auto_308254 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308292 - DIRECTION
      ?auto_308293 - MODE
      ?auto_308294 - DIRECTION
      ?auto_308291 - MODE
      ?auto_308295 - DIRECTION
      ?auto_308296 - MODE
      ?auto_308297 - DIRECTION
      ?auto_308298 - MODE
    )
    :vars
    (
      ?auto_308302 - INSTRUMENT
      ?auto_308301 - SATELLITE
      ?auto_308303 - DIRECTION
      ?auto_308299 - DIRECTION
      ?auto_308300 - MODE
      ?auto_308304 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_308302 ?auto_308301 ) ( SUPPORTS ?auto_308302 ?auto_308293 ) ( not ( = ?auto_308292 ?auto_308303 ) ) ( HAVE_IMAGE ?auto_308299 ?auto_308300 ) ( not ( = ?auto_308299 ?auto_308292 ) ) ( not ( = ?auto_308299 ?auto_308303 ) ) ( not ( = ?auto_308300 ?auto_308293 ) ) ( CALIBRATION_TARGET ?auto_308302 ?auto_308303 ) ( POWER_AVAIL ?auto_308301 ) ( POINTING ?auto_308301 ?auto_308304 ) ( not ( = ?auto_308303 ?auto_308304 ) ) ( not ( = ?auto_308292 ?auto_308304 ) ) ( not ( = ?auto_308299 ?auto_308304 ) ) ( HAVE_IMAGE ?auto_308294 ?auto_308291 ) ( HAVE_IMAGE ?auto_308295 ?auto_308296 ) ( HAVE_IMAGE ?auto_308297 ?auto_308298 ) ( not ( = ?auto_308292 ?auto_308294 ) ) ( not ( = ?auto_308292 ?auto_308295 ) ) ( not ( = ?auto_308292 ?auto_308297 ) ) ( not ( = ?auto_308293 ?auto_308291 ) ) ( not ( = ?auto_308293 ?auto_308296 ) ) ( not ( = ?auto_308293 ?auto_308298 ) ) ( not ( = ?auto_308294 ?auto_308295 ) ) ( not ( = ?auto_308294 ?auto_308297 ) ) ( not ( = ?auto_308294 ?auto_308303 ) ) ( not ( = ?auto_308294 ?auto_308299 ) ) ( not ( = ?auto_308294 ?auto_308304 ) ) ( not ( = ?auto_308291 ?auto_308296 ) ) ( not ( = ?auto_308291 ?auto_308298 ) ) ( not ( = ?auto_308291 ?auto_308300 ) ) ( not ( = ?auto_308295 ?auto_308297 ) ) ( not ( = ?auto_308295 ?auto_308303 ) ) ( not ( = ?auto_308295 ?auto_308299 ) ) ( not ( = ?auto_308295 ?auto_308304 ) ) ( not ( = ?auto_308296 ?auto_308298 ) ) ( not ( = ?auto_308296 ?auto_308300 ) ) ( not ( = ?auto_308297 ?auto_308303 ) ) ( not ( = ?auto_308297 ?auto_308299 ) ) ( not ( = ?auto_308297 ?auto_308304 ) ) ( not ( = ?auto_308298 ?auto_308300 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308299 ?auto_308300 ?auto_308292 ?auto_308293 )
      ( GET-4IMAGE-VERIFY ?auto_308292 ?auto_308293 ?auto_308294 ?auto_308291 ?auto_308295 ?auto_308296 ?auto_308297 ?auto_308298 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308306 - DIRECTION
      ?auto_308307 - MODE
      ?auto_308308 - DIRECTION
      ?auto_308305 - MODE
      ?auto_308309 - DIRECTION
      ?auto_308310 - MODE
      ?auto_308311 - DIRECTION
      ?auto_308312 - MODE
    )
    :vars
    (
      ?auto_308316 - INSTRUMENT
      ?auto_308315 - SATELLITE
      ?auto_308317 - DIRECTION
      ?auto_308313 - DIRECTION
      ?auto_308314 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_308316 ?auto_308315 ) ( SUPPORTS ?auto_308316 ?auto_308307 ) ( not ( = ?auto_308306 ?auto_308317 ) ) ( HAVE_IMAGE ?auto_308313 ?auto_308314 ) ( not ( = ?auto_308313 ?auto_308306 ) ) ( not ( = ?auto_308313 ?auto_308317 ) ) ( not ( = ?auto_308314 ?auto_308307 ) ) ( CALIBRATION_TARGET ?auto_308316 ?auto_308317 ) ( POWER_AVAIL ?auto_308315 ) ( POINTING ?auto_308315 ?auto_308311 ) ( not ( = ?auto_308317 ?auto_308311 ) ) ( not ( = ?auto_308306 ?auto_308311 ) ) ( not ( = ?auto_308313 ?auto_308311 ) ) ( HAVE_IMAGE ?auto_308308 ?auto_308305 ) ( HAVE_IMAGE ?auto_308309 ?auto_308310 ) ( HAVE_IMAGE ?auto_308311 ?auto_308312 ) ( not ( = ?auto_308306 ?auto_308308 ) ) ( not ( = ?auto_308306 ?auto_308309 ) ) ( not ( = ?auto_308307 ?auto_308305 ) ) ( not ( = ?auto_308307 ?auto_308310 ) ) ( not ( = ?auto_308307 ?auto_308312 ) ) ( not ( = ?auto_308308 ?auto_308309 ) ) ( not ( = ?auto_308308 ?auto_308311 ) ) ( not ( = ?auto_308308 ?auto_308317 ) ) ( not ( = ?auto_308308 ?auto_308313 ) ) ( not ( = ?auto_308305 ?auto_308310 ) ) ( not ( = ?auto_308305 ?auto_308312 ) ) ( not ( = ?auto_308305 ?auto_308314 ) ) ( not ( = ?auto_308309 ?auto_308311 ) ) ( not ( = ?auto_308309 ?auto_308317 ) ) ( not ( = ?auto_308309 ?auto_308313 ) ) ( not ( = ?auto_308310 ?auto_308312 ) ) ( not ( = ?auto_308310 ?auto_308314 ) ) ( not ( = ?auto_308312 ?auto_308314 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308313 ?auto_308314 ?auto_308306 ?auto_308307 )
      ( GET-4IMAGE-VERIFY ?auto_308306 ?auto_308307 ?auto_308308 ?auto_308305 ?auto_308309 ?auto_308310 ?auto_308311 ?auto_308312 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308341 - DIRECTION
      ?auto_308342 - MODE
      ?auto_308343 - DIRECTION
      ?auto_308340 - MODE
      ?auto_308344 - DIRECTION
      ?auto_308345 - MODE
      ?auto_308346 - DIRECTION
      ?auto_308347 - MODE
    )
    :vars
    (
      ?auto_308351 - INSTRUMENT
      ?auto_308350 - SATELLITE
      ?auto_308352 - DIRECTION
      ?auto_308348 - DIRECTION
      ?auto_308349 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_308351 ?auto_308350 ) ( SUPPORTS ?auto_308351 ?auto_308342 ) ( not ( = ?auto_308341 ?auto_308352 ) ) ( HAVE_IMAGE ?auto_308348 ?auto_308349 ) ( not ( = ?auto_308348 ?auto_308341 ) ) ( not ( = ?auto_308348 ?auto_308352 ) ) ( not ( = ?auto_308349 ?auto_308342 ) ) ( CALIBRATION_TARGET ?auto_308351 ?auto_308352 ) ( POWER_AVAIL ?auto_308350 ) ( POINTING ?auto_308350 ?auto_308344 ) ( not ( = ?auto_308352 ?auto_308344 ) ) ( not ( = ?auto_308341 ?auto_308344 ) ) ( not ( = ?auto_308348 ?auto_308344 ) ) ( HAVE_IMAGE ?auto_308343 ?auto_308340 ) ( HAVE_IMAGE ?auto_308344 ?auto_308345 ) ( HAVE_IMAGE ?auto_308346 ?auto_308347 ) ( not ( = ?auto_308341 ?auto_308343 ) ) ( not ( = ?auto_308341 ?auto_308346 ) ) ( not ( = ?auto_308342 ?auto_308340 ) ) ( not ( = ?auto_308342 ?auto_308345 ) ) ( not ( = ?auto_308342 ?auto_308347 ) ) ( not ( = ?auto_308343 ?auto_308344 ) ) ( not ( = ?auto_308343 ?auto_308346 ) ) ( not ( = ?auto_308343 ?auto_308352 ) ) ( not ( = ?auto_308343 ?auto_308348 ) ) ( not ( = ?auto_308340 ?auto_308345 ) ) ( not ( = ?auto_308340 ?auto_308347 ) ) ( not ( = ?auto_308340 ?auto_308349 ) ) ( not ( = ?auto_308344 ?auto_308346 ) ) ( not ( = ?auto_308345 ?auto_308347 ) ) ( not ( = ?auto_308345 ?auto_308349 ) ) ( not ( = ?auto_308346 ?auto_308352 ) ) ( not ( = ?auto_308346 ?auto_308348 ) ) ( not ( = ?auto_308347 ?auto_308349 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308348 ?auto_308349 ?auto_308341 ?auto_308342 )
      ( GET-4IMAGE-VERIFY ?auto_308341 ?auto_308342 ?auto_308343 ?auto_308340 ?auto_308344 ?auto_308345 ?auto_308346 ?auto_308347 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308433 - DIRECTION
      ?auto_308434 - MODE
      ?auto_308435 - DIRECTION
      ?auto_308432 - MODE
      ?auto_308436 - DIRECTION
      ?auto_308437 - MODE
      ?auto_308438 - DIRECTION
      ?auto_308439 - MODE
    )
    :vars
    (
      ?auto_308441 - INSTRUMENT
      ?auto_308440 - SATELLITE
      ?auto_308442 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_308441 ?auto_308440 ) ( SUPPORTS ?auto_308441 ?auto_308434 ) ( not ( = ?auto_308433 ?auto_308442 ) ) ( HAVE_IMAGE ?auto_308438 ?auto_308437 ) ( not ( = ?auto_308438 ?auto_308433 ) ) ( not ( = ?auto_308438 ?auto_308442 ) ) ( not ( = ?auto_308437 ?auto_308434 ) ) ( CALIBRATION_TARGET ?auto_308441 ?auto_308442 ) ( POWER_AVAIL ?auto_308440 ) ( POINTING ?auto_308440 ?auto_308435 ) ( not ( = ?auto_308442 ?auto_308435 ) ) ( not ( = ?auto_308433 ?auto_308435 ) ) ( not ( = ?auto_308438 ?auto_308435 ) ) ( HAVE_IMAGE ?auto_308435 ?auto_308432 ) ( HAVE_IMAGE ?auto_308436 ?auto_308437 ) ( HAVE_IMAGE ?auto_308438 ?auto_308439 ) ( not ( = ?auto_308433 ?auto_308436 ) ) ( not ( = ?auto_308434 ?auto_308432 ) ) ( not ( = ?auto_308434 ?auto_308439 ) ) ( not ( = ?auto_308435 ?auto_308436 ) ) ( not ( = ?auto_308432 ?auto_308437 ) ) ( not ( = ?auto_308432 ?auto_308439 ) ) ( not ( = ?auto_308436 ?auto_308438 ) ) ( not ( = ?auto_308436 ?auto_308442 ) ) ( not ( = ?auto_308437 ?auto_308439 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308438 ?auto_308437 ?auto_308433 ?auto_308434 )
      ( GET-4IMAGE-VERIFY ?auto_308433 ?auto_308434 ?auto_308435 ?auto_308432 ?auto_308436 ?auto_308437 ?auto_308438 ?auto_308439 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308524 - DIRECTION
      ?auto_308525 - MODE
      ?auto_308526 - DIRECTION
      ?auto_308523 - MODE
      ?auto_308527 - DIRECTION
      ?auto_308528 - MODE
      ?auto_308529 - DIRECTION
      ?auto_308530 - MODE
    )
    :vars
    (
      ?auto_308532 - INSTRUMENT
      ?auto_308531 - SATELLITE
      ?auto_308533 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_308532 ?auto_308531 ) ( SUPPORTS ?auto_308532 ?auto_308525 ) ( not ( = ?auto_308524 ?auto_308533 ) ) ( HAVE_IMAGE ?auto_308529 ?auto_308530 ) ( not ( = ?auto_308529 ?auto_308524 ) ) ( not ( = ?auto_308529 ?auto_308533 ) ) ( not ( = ?auto_308530 ?auto_308525 ) ) ( CALIBRATION_TARGET ?auto_308532 ?auto_308533 ) ( POWER_AVAIL ?auto_308531 ) ( POINTING ?auto_308531 ?auto_308526 ) ( not ( = ?auto_308533 ?auto_308526 ) ) ( not ( = ?auto_308524 ?auto_308526 ) ) ( not ( = ?auto_308529 ?auto_308526 ) ) ( HAVE_IMAGE ?auto_308526 ?auto_308523 ) ( HAVE_IMAGE ?auto_308527 ?auto_308528 ) ( not ( = ?auto_308524 ?auto_308527 ) ) ( not ( = ?auto_308525 ?auto_308523 ) ) ( not ( = ?auto_308525 ?auto_308528 ) ) ( not ( = ?auto_308526 ?auto_308527 ) ) ( not ( = ?auto_308523 ?auto_308528 ) ) ( not ( = ?auto_308523 ?auto_308530 ) ) ( not ( = ?auto_308527 ?auto_308529 ) ) ( not ( = ?auto_308527 ?auto_308533 ) ) ( not ( = ?auto_308528 ?auto_308530 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308529 ?auto_308530 ?auto_308524 ?auto_308525 )
      ( GET-4IMAGE-VERIFY ?auto_308524 ?auto_308525 ?auto_308526 ?auto_308523 ?auto_308527 ?auto_308528 ?auto_308529 ?auto_308530 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_308893 - DIRECTION
      ?auto_308894 - MODE
      ?auto_308895 - DIRECTION
      ?auto_308892 - MODE
      ?auto_308896 - DIRECTION
      ?auto_308897 - MODE
    )
    :vars
    (
      ?auto_308899 - INSTRUMENT
      ?auto_308902 - SATELLITE
      ?auto_308898 - DIRECTION
      ?auto_308901 - DIRECTION
      ?auto_308900 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_308899 ?auto_308902 ) ( SUPPORTS ?auto_308899 ?auto_308897 ) ( not ( = ?auto_308896 ?auto_308898 ) ) ( HAVE_IMAGE ?auto_308895 ?auto_308894 ) ( not ( = ?auto_308895 ?auto_308896 ) ) ( not ( = ?auto_308895 ?auto_308898 ) ) ( not ( = ?auto_308894 ?auto_308897 ) ) ( CALIBRATION_TARGET ?auto_308899 ?auto_308898 ) ( POINTING ?auto_308902 ?auto_308901 ) ( not ( = ?auto_308898 ?auto_308901 ) ) ( not ( = ?auto_308896 ?auto_308901 ) ) ( not ( = ?auto_308895 ?auto_308901 ) ) ( ON_BOARD ?auto_308900 ?auto_308902 ) ( POWER_ON ?auto_308900 ) ( not ( = ?auto_308899 ?auto_308900 ) ) ( HAVE_IMAGE ?auto_308893 ?auto_308894 ) ( HAVE_IMAGE ?auto_308895 ?auto_308892 ) ( not ( = ?auto_308893 ?auto_308895 ) ) ( not ( = ?auto_308893 ?auto_308896 ) ) ( not ( = ?auto_308893 ?auto_308898 ) ) ( not ( = ?auto_308893 ?auto_308901 ) ) ( not ( = ?auto_308894 ?auto_308892 ) ) ( not ( = ?auto_308892 ?auto_308897 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308895 ?auto_308894 ?auto_308896 ?auto_308897 )
      ( GET-3IMAGE-VERIFY ?auto_308893 ?auto_308894 ?auto_308895 ?auto_308892 ?auto_308896 ?auto_308897 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_308904 - DIRECTION
      ?auto_308905 - MODE
      ?auto_308906 - DIRECTION
      ?auto_308903 - MODE
      ?auto_308907 - DIRECTION
      ?auto_308908 - MODE
    )
    :vars
    (
      ?auto_308910 - INSTRUMENT
      ?auto_308913 - SATELLITE
      ?auto_308909 - DIRECTION
      ?auto_308912 - DIRECTION
      ?auto_308911 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_308910 ?auto_308913 ) ( SUPPORTS ?auto_308910 ?auto_308908 ) ( not ( = ?auto_308907 ?auto_308909 ) ) ( HAVE_IMAGE ?auto_308904 ?auto_308905 ) ( not ( = ?auto_308904 ?auto_308907 ) ) ( not ( = ?auto_308904 ?auto_308909 ) ) ( not ( = ?auto_308905 ?auto_308908 ) ) ( CALIBRATION_TARGET ?auto_308910 ?auto_308909 ) ( POINTING ?auto_308913 ?auto_308912 ) ( not ( = ?auto_308909 ?auto_308912 ) ) ( not ( = ?auto_308907 ?auto_308912 ) ) ( not ( = ?auto_308904 ?auto_308912 ) ) ( ON_BOARD ?auto_308911 ?auto_308913 ) ( POWER_ON ?auto_308911 ) ( not ( = ?auto_308910 ?auto_308911 ) ) ( HAVE_IMAGE ?auto_308906 ?auto_308903 ) ( not ( = ?auto_308904 ?auto_308906 ) ) ( not ( = ?auto_308905 ?auto_308903 ) ) ( not ( = ?auto_308906 ?auto_308907 ) ) ( not ( = ?auto_308906 ?auto_308909 ) ) ( not ( = ?auto_308906 ?auto_308912 ) ) ( not ( = ?auto_308903 ?auto_308908 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308904 ?auto_308905 ?auto_308907 ?auto_308908 )
      ( GET-3IMAGE-VERIFY ?auto_308904 ?auto_308905 ?auto_308906 ?auto_308903 ?auto_308907 ?auto_308908 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_308969 - DIRECTION
      ?auto_308970 - MODE
      ?auto_308971 - DIRECTION
      ?auto_308968 - MODE
      ?auto_308972 - DIRECTION
      ?auto_308973 - MODE
    )
    :vars
    (
      ?auto_308975 - INSTRUMENT
      ?auto_308980 - SATELLITE
      ?auto_308974 - DIRECTION
      ?auto_308979 - DIRECTION
      ?auto_308977 - MODE
      ?auto_308978 - DIRECTION
      ?auto_308976 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_308975 ?auto_308980 ) ( SUPPORTS ?auto_308975 ?auto_308973 ) ( not ( = ?auto_308972 ?auto_308974 ) ) ( HAVE_IMAGE ?auto_308979 ?auto_308977 ) ( not ( = ?auto_308979 ?auto_308972 ) ) ( not ( = ?auto_308979 ?auto_308974 ) ) ( not ( = ?auto_308977 ?auto_308973 ) ) ( CALIBRATION_TARGET ?auto_308975 ?auto_308974 ) ( POINTING ?auto_308980 ?auto_308978 ) ( not ( = ?auto_308974 ?auto_308978 ) ) ( not ( = ?auto_308972 ?auto_308978 ) ) ( not ( = ?auto_308979 ?auto_308978 ) ) ( ON_BOARD ?auto_308976 ?auto_308980 ) ( POWER_ON ?auto_308976 ) ( not ( = ?auto_308975 ?auto_308976 ) ) ( HAVE_IMAGE ?auto_308969 ?auto_308970 ) ( HAVE_IMAGE ?auto_308971 ?auto_308968 ) ( not ( = ?auto_308969 ?auto_308971 ) ) ( not ( = ?auto_308969 ?auto_308972 ) ) ( not ( = ?auto_308969 ?auto_308974 ) ) ( not ( = ?auto_308969 ?auto_308979 ) ) ( not ( = ?auto_308969 ?auto_308978 ) ) ( not ( = ?auto_308970 ?auto_308968 ) ) ( not ( = ?auto_308970 ?auto_308973 ) ) ( not ( = ?auto_308970 ?auto_308977 ) ) ( not ( = ?auto_308971 ?auto_308972 ) ) ( not ( = ?auto_308971 ?auto_308974 ) ) ( not ( = ?auto_308971 ?auto_308979 ) ) ( not ( = ?auto_308971 ?auto_308978 ) ) ( not ( = ?auto_308968 ?auto_308973 ) ) ( not ( = ?auto_308968 ?auto_308977 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308979 ?auto_308977 ?auto_308972 ?auto_308973 )
      ( GET-3IMAGE-VERIFY ?auto_308969 ?auto_308970 ?auto_308971 ?auto_308968 ?auto_308972 ?auto_308973 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_308994 - DIRECTION
      ?auto_308995 - MODE
      ?auto_308996 - DIRECTION
      ?auto_308993 - MODE
      ?auto_308997 - DIRECTION
      ?auto_308998 - MODE
    )
    :vars
    (
      ?auto_309000 - INSTRUMENT
      ?auto_309005 - SATELLITE
      ?auto_308999 - DIRECTION
      ?auto_309004 - DIRECTION
      ?auto_309002 - MODE
      ?auto_309003 - DIRECTION
      ?auto_309001 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309000 ?auto_309005 ) ( SUPPORTS ?auto_309000 ?auto_308993 ) ( not ( = ?auto_308996 ?auto_308999 ) ) ( HAVE_IMAGE ?auto_309004 ?auto_309002 ) ( not ( = ?auto_309004 ?auto_308996 ) ) ( not ( = ?auto_309004 ?auto_308999 ) ) ( not ( = ?auto_309002 ?auto_308993 ) ) ( CALIBRATION_TARGET ?auto_309000 ?auto_308999 ) ( POINTING ?auto_309005 ?auto_309003 ) ( not ( = ?auto_308999 ?auto_309003 ) ) ( not ( = ?auto_308996 ?auto_309003 ) ) ( not ( = ?auto_309004 ?auto_309003 ) ) ( ON_BOARD ?auto_309001 ?auto_309005 ) ( POWER_ON ?auto_309001 ) ( not ( = ?auto_309000 ?auto_309001 ) ) ( HAVE_IMAGE ?auto_308994 ?auto_308995 ) ( HAVE_IMAGE ?auto_308997 ?auto_308998 ) ( not ( = ?auto_308994 ?auto_308996 ) ) ( not ( = ?auto_308994 ?auto_308997 ) ) ( not ( = ?auto_308994 ?auto_308999 ) ) ( not ( = ?auto_308994 ?auto_309004 ) ) ( not ( = ?auto_308994 ?auto_309003 ) ) ( not ( = ?auto_308995 ?auto_308993 ) ) ( not ( = ?auto_308995 ?auto_308998 ) ) ( not ( = ?auto_308995 ?auto_309002 ) ) ( not ( = ?auto_308996 ?auto_308997 ) ) ( not ( = ?auto_308993 ?auto_308998 ) ) ( not ( = ?auto_308997 ?auto_308999 ) ) ( not ( = ?auto_308997 ?auto_309004 ) ) ( not ( = ?auto_308997 ?auto_309003 ) ) ( not ( = ?auto_308998 ?auto_309002 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309004 ?auto_309002 ?auto_308996 ?auto_308993 )
      ( GET-3IMAGE-VERIFY ?auto_308994 ?auto_308995 ?auto_308996 ?auto_308993 ?auto_308997 ?auto_308998 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_309070 - DIRECTION
      ?auto_309071 - MODE
      ?auto_309072 - DIRECTION
      ?auto_309069 - MODE
      ?auto_309073 - DIRECTION
      ?auto_309074 - MODE
    )
    :vars
    (
      ?auto_309076 - INSTRUMENT
      ?auto_309080 - SATELLITE
      ?auto_309075 - DIRECTION
      ?auto_309079 - DIRECTION
      ?auto_309078 - MODE
      ?auto_309077 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309076 ?auto_309080 ) ( SUPPORTS ?auto_309076 ?auto_309069 ) ( not ( = ?auto_309072 ?auto_309075 ) ) ( HAVE_IMAGE ?auto_309079 ?auto_309078 ) ( not ( = ?auto_309079 ?auto_309072 ) ) ( not ( = ?auto_309079 ?auto_309075 ) ) ( not ( = ?auto_309078 ?auto_309069 ) ) ( CALIBRATION_TARGET ?auto_309076 ?auto_309075 ) ( POINTING ?auto_309080 ?auto_309073 ) ( not ( = ?auto_309075 ?auto_309073 ) ) ( not ( = ?auto_309072 ?auto_309073 ) ) ( not ( = ?auto_309079 ?auto_309073 ) ) ( ON_BOARD ?auto_309077 ?auto_309080 ) ( POWER_ON ?auto_309077 ) ( not ( = ?auto_309076 ?auto_309077 ) ) ( HAVE_IMAGE ?auto_309070 ?auto_309071 ) ( HAVE_IMAGE ?auto_309073 ?auto_309074 ) ( not ( = ?auto_309070 ?auto_309072 ) ) ( not ( = ?auto_309070 ?auto_309073 ) ) ( not ( = ?auto_309070 ?auto_309075 ) ) ( not ( = ?auto_309070 ?auto_309079 ) ) ( not ( = ?auto_309071 ?auto_309069 ) ) ( not ( = ?auto_309071 ?auto_309074 ) ) ( not ( = ?auto_309071 ?auto_309078 ) ) ( not ( = ?auto_309069 ?auto_309074 ) ) ( not ( = ?auto_309074 ?auto_309078 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309079 ?auto_309078 ?auto_309072 ?auto_309069 )
      ( GET-3IMAGE-VERIFY ?auto_309070 ?auto_309071 ?auto_309072 ?auto_309069 ?auto_309073 ?auto_309074 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_309094 - DIRECTION
      ?auto_309095 - MODE
      ?auto_309096 - DIRECTION
      ?auto_309093 - MODE
      ?auto_309097 - DIRECTION
      ?auto_309098 - MODE
    )
    :vars
    (
      ?auto_309100 - INSTRUMENT
      ?auto_309103 - SATELLITE
      ?auto_309099 - DIRECTION
      ?auto_309102 - DIRECTION
      ?auto_309101 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309100 ?auto_309103 ) ( SUPPORTS ?auto_309100 ?auto_309095 ) ( not ( = ?auto_309094 ?auto_309099 ) ) ( HAVE_IMAGE ?auto_309096 ?auto_309098 ) ( not ( = ?auto_309096 ?auto_309094 ) ) ( not ( = ?auto_309096 ?auto_309099 ) ) ( not ( = ?auto_309098 ?auto_309095 ) ) ( CALIBRATION_TARGET ?auto_309100 ?auto_309099 ) ( POINTING ?auto_309103 ?auto_309102 ) ( not ( = ?auto_309099 ?auto_309102 ) ) ( not ( = ?auto_309094 ?auto_309102 ) ) ( not ( = ?auto_309096 ?auto_309102 ) ) ( ON_BOARD ?auto_309101 ?auto_309103 ) ( POWER_ON ?auto_309101 ) ( not ( = ?auto_309100 ?auto_309101 ) ) ( HAVE_IMAGE ?auto_309096 ?auto_309093 ) ( HAVE_IMAGE ?auto_309097 ?auto_309098 ) ( not ( = ?auto_309094 ?auto_309097 ) ) ( not ( = ?auto_309095 ?auto_309093 ) ) ( not ( = ?auto_309096 ?auto_309097 ) ) ( not ( = ?auto_309093 ?auto_309098 ) ) ( not ( = ?auto_309097 ?auto_309099 ) ) ( not ( = ?auto_309097 ?auto_309102 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309096 ?auto_309098 ?auto_309094 ?auto_309095 )
      ( GET-3IMAGE-VERIFY ?auto_309094 ?auto_309095 ?auto_309096 ?auto_309093 ?auto_309097 ?auto_309098 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_309143 - DIRECTION
      ?auto_309144 - MODE
      ?auto_309145 - DIRECTION
      ?auto_309142 - MODE
      ?auto_309146 - DIRECTION
      ?auto_309147 - MODE
    )
    :vars
    (
      ?auto_309149 - INSTRUMENT
      ?auto_309154 - SATELLITE
      ?auto_309148 - DIRECTION
      ?auto_309153 - DIRECTION
      ?auto_309151 - MODE
      ?auto_309152 - DIRECTION
      ?auto_309150 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309149 ?auto_309154 ) ( SUPPORTS ?auto_309149 ?auto_309144 ) ( not ( = ?auto_309143 ?auto_309148 ) ) ( HAVE_IMAGE ?auto_309153 ?auto_309151 ) ( not ( = ?auto_309153 ?auto_309143 ) ) ( not ( = ?auto_309153 ?auto_309148 ) ) ( not ( = ?auto_309151 ?auto_309144 ) ) ( CALIBRATION_TARGET ?auto_309149 ?auto_309148 ) ( POINTING ?auto_309154 ?auto_309152 ) ( not ( = ?auto_309148 ?auto_309152 ) ) ( not ( = ?auto_309143 ?auto_309152 ) ) ( not ( = ?auto_309153 ?auto_309152 ) ) ( ON_BOARD ?auto_309150 ?auto_309154 ) ( POWER_ON ?auto_309150 ) ( not ( = ?auto_309149 ?auto_309150 ) ) ( HAVE_IMAGE ?auto_309145 ?auto_309142 ) ( HAVE_IMAGE ?auto_309146 ?auto_309147 ) ( not ( = ?auto_309143 ?auto_309145 ) ) ( not ( = ?auto_309143 ?auto_309146 ) ) ( not ( = ?auto_309144 ?auto_309142 ) ) ( not ( = ?auto_309144 ?auto_309147 ) ) ( not ( = ?auto_309145 ?auto_309146 ) ) ( not ( = ?auto_309145 ?auto_309148 ) ) ( not ( = ?auto_309145 ?auto_309153 ) ) ( not ( = ?auto_309145 ?auto_309152 ) ) ( not ( = ?auto_309142 ?auto_309147 ) ) ( not ( = ?auto_309142 ?auto_309151 ) ) ( not ( = ?auto_309146 ?auto_309148 ) ) ( not ( = ?auto_309146 ?auto_309153 ) ) ( not ( = ?auto_309146 ?auto_309152 ) ) ( not ( = ?auto_309147 ?auto_309151 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309153 ?auto_309151 ?auto_309143 ?auto_309144 )
      ( GET-3IMAGE-VERIFY ?auto_309143 ?auto_309144 ?auto_309145 ?auto_309142 ?auto_309146 ?auto_309147 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309277 - DIRECTION
      ?auto_309278 - MODE
      ?auto_309279 - DIRECTION
      ?auto_309276 - MODE
      ?auto_309280 - DIRECTION
      ?auto_309281 - MODE
      ?auto_309282 - DIRECTION
      ?auto_309283 - MODE
    )
    :vars
    (
      ?auto_309285 - INSTRUMENT
      ?auto_309288 - SATELLITE
      ?auto_309284 - DIRECTION
      ?auto_309287 - DIRECTION
      ?auto_309286 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309285 ?auto_309288 ) ( SUPPORTS ?auto_309285 ?auto_309283 ) ( not ( = ?auto_309282 ?auto_309284 ) ) ( HAVE_IMAGE ?auto_309279 ?auto_309278 ) ( not ( = ?auto_309279 ?auto_309282 ) ) ( not ( = ?auto_309279 ?auto_309284 ) ) ( not ( = ?auto_309278 ?auto_309283 ) ) ( CALIBRATION_TARGET ?auto_309285 ?auto_309284 ) ( POINTING ?auto_309288 ?auto_309287 ) ( not ( = ?auto_309284 ?auto_309287 ) ) ( not ( = ?auto_309282 ?auto_309287 ) ) ( not ( = ?auto_309279 ?auto_309287 ) ) ( ON_BOARD ?auto_309286 ?auto_309288 ) ( POWER_ON ?auto_309286 ) ( not ( = ?auto_309285 ?auto_309286 ) ) ( HAVE_IMAGE ?auto_309277 ?auto_309278 ) ( HAVE_IMAGE ?auto_309279 ?auto_309276 ) ( HAVE_IMAGE ?auto_309280 ?auto_309281 ) ( not ( = ?auto_309277 ?auto_309279 ) ) ( not ( = ?auto_309277 ?auto_309280 ) ) ( not ( = ?auto_309277 ?auto_309282 ) ) ( not ( = ?auto_309277 ?auto_309284 ) ) ( not ( = ?auto_309277 ?auto_309287 ) ) ( not ( = ?auto_309278 ?auto_309276 ) ) ( not ( = ?auto_309278 ?auto_309281 ) ) ( not ( = ?auto_309279 ?auto_309280 ) ) ( not ( = ?auto_309276 ?auto_309281 ) ) ( not ( = ?auto_309276 ?auto_309283 ) ) ( not ( = ?auto_309280 ?auto_309282 ) ) ( not ( = ?auto_309280 ?auto_309284 ) ) ( not ( = ?auto_309280 ?auto_309287 ) ) ( not ( = ?auto_309281 ?auto_309283 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309279 ?auto_309278 ?auto_309282 ?auto_309283 )
      ( GET-4IMAGE-VERIFY ?auto_309277 ?auto_309278 ?auto_309279 ?auto_309276 ?auto_309280 ?auto_309281 ?auto_309282 ?auto_309283 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309315 - DIRECTION
      ?auto_309316 - MODE
      ?auto_309317 - DIRECTION
      ?auto_309314 - MODE
      ?auto_309318 - DIRECTION
      ?auto_309319 - MODE
      ?auto_309320 - DIRECTION
      ?auto_309321 - MODE
    )
    :vars
    (
      ?auto_309323 - INSTRUMENT
      ?auto_309326 - SATELLITE
      ?auto_309322 - DIRECTION
      ?auto_309325 - DIRECTION
      ?auto_309324 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309323 ?auto_309326 ) ( SUPPORTS ?auto_309323 ?auto_309319 ) ( not ( = ?auto_309318 ?auto_309322 ) ) ( HAVE_IMAGE ?auto_309317 ?auto_309316 ) ( not ( = ?auto_309317 ?auto_309318 ) ) ( not ( = ?auto_309317 ?auto_309322 ) ) ( not ( = ?auto_309316 ?auto_309319 ) ) ( CALIBRATION_TARGET ?auto_309323 ?auto_309322 ) ( POINTING ?auto_309326 ?auto_309325 ) ( not ( = ?auto_309322 ?auto_309325 ) ) ( not ( = ?auto_309318 ?auto_309325 ) ) ( not ( = ?auto_309317 ?auto_309325 ) ) ( ON_BOARD ?auto_309324 ?auto_309326 ) ( POWER_ON ?auto_309324 ) ( not ( = ?auto_309323 ?auto_309324 ) ) ( HAVE_IMAGE ?auto_309315 ?auto_309316 ) ( HAVE_IMAGE ?auto_309317 ?auto_309314 ) ( HAVE_IMAGE ?auto_309320 ?auto_309321 ) ( not ( = ?auto_309315 ?auto_309317 ) ) ( not ( = ?auto_309315 ?auto_309318 ) ) ( not ( = ?auto_309315 ?auto_309320 ) ) ( not ( = ?auto_309315 ?auto_309322 ) ) ( not ( = ?auto_309315 ?auto_309325 ) ) ( not ( = ?auto_309316 ?auto_309314 ) ) ( not ( = ?auto_309316 ?auto_309321 ) ) ( not ( = ?auto_309317 ?auto_309320 ) ) ( not ( = ?auto_309314 ?auto_309319 ) ) ( not ( = ?auto_309314 ?auto_309321 ) ) ( not ( = ?auto_309318 ?auto_309320 ) ) ( not ( = ?auto_309319 ?auto_309321 ) ) ( not ( = ?auto_309320 ?auto_309322 ) ) ( not ( = ?auto_309320 ?auto_309325 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309317 ?auto_309316 ?auto_309318 ?auto_309319 )
      ( GET-4IMAGE-VERIFY ?auto_309315 ?auto_309316 ?auto_309317 ?auto_309314 ?auto_309318 ?auto_309319 ?auto_309320 ?auto_309321 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309353 - DIRECTION
      ?auto_309354 - MODE
      ?auto_309355 - DIRECTION
      ?auto_309352 - MODE
      ?auto_309356 - DIRECTION
      ?auto_309357 - MODE
      ?auto_309358 - DIRECTION
      ?auto_309359 - MODE
    )
    :vars
    (
      ?auto_309361 - INSTRUMENT
      ?auto_309364 - SATELLITE
      ?auto_309360 - DIRECTION
      ?auto_309363 - DIRECTION
      ?auto_309362 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309361 ?auto_309364 ) ( SUPPORTS ?auto_309361 ?auto_309359 ) ( not ( = ?auto_309358 ?auto_309360 ) ) ( HAVE_IMAGE ?auto_309353 ?auto_309357 ) ( not ( = ?auto_309353 ?auto_309358 ) ) ( not ( = ?auto_309353 ?auto_309360 ) ) ( not ( = ?auto_309357 ?auto_309359 ) ) ( CALIBRATION_TARGET ?auto_309361 ?auto_309360 ) ( POINTING ?auto_309364 ?auto_309363 ) ( not ( = ?auto_309360 ?auto_309363 ) ) ( not ( = ?auto_309358 ?auto_309363 ) ) ( not ( = ?auto_309353 ?auto_309363 ) ) ( ON_BOARD ?auto_309362 ?auto_309364 ) ( POWER_ON ?auto_309362 ) ( not ( = ?auto_309361 ?auto_309362 ) ) ( HAVE_IMAGE ?auto_309353 ?auto_309354 ) ( HAVE_IMAGE ?auto_309355 ?auto_309352 ) ( HAVE_IMAGE ?auto_309356 ?auto_309357 ) ( not ( = ?auto_309353 ?auto_309355 ) ) ( not ( = ?auto_309353 ?auto_309356 ) ) ( not ( = ?auto_309354 ?auto_309352 ) ) ( not ( = ?auto_309354 ?auto_309357 ) ) ( not ( = ?auto_309354 ?auto_309359 ) ) ( not ( = ?auto_309355 ?auto_309356 ) ) ( not ( = ?auto_309355 ?auto_309358 ) ) ( not ( = ?auto_309355 ?auto_309360 ) ) ( not ( = ?auto_309355 ?auto_309363 ) ) ( not ( = ?auto_309352 ?auto_309357 ) ) ( not ( = ?auto_309352 ?auto_309359 ) ) ( not ( = ?auto_309356 ?auto_309358 ) ) ( not ( = ?auto_309356 ?auto_309360 ) ) ( not ( = ?auto_309356 ?auto_309363 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309353 ?auto_309357 ?auto_309358 ?auto_309359 )
      ( GET-4IMAGE-VERIFY ?auto_309353 ?auto_309354 ?auto_309355 ?auto_309352 ?auto_309356 ?auto_309357 ?auto_309358 ?auto_309359 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309391 - DIRECTION
      ?auto_309392 - MODE
      ?auto_309393 - DIRECTION
      ?auto_309390 - MODE
      ?auto_309394 - DIRECTION
      ?auto_309395 - MODE
      ?auto_309396 - DIRECTION
      ?auto_309397 - MODE
    )
    :vars
    (
      ?auto_309399 - INSTRUMENT
      ?auto_309402 - SATELLITE
      ?auto_309398 - DIRECTION
      ?auto_309401 - DIRECTION
      ?auto_309400 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309399 ?auto_309402 ) ( SUPPORTS ?auto_309399 ?auto_309395 ) ( not ( = ?auto_309394 ?auto_309398 ) ) ( HAVE_IMAGE ?auto_309391 ?auto_309397 ) ( not ( = ?auto_309391 ?auto_309394 ) ) ( not ( = ?auto_309391 ?auto_309398 ) ) ( not ( = ?auto_309397 ?auto_309395 ) ) ( CALIBRATION_TARGET ?auto_309399 ?auto_309398 ) ( POINTING ?auto_309402 ?auto_309401 ) ( not ( = ?auto_309398 ?auto_309401 ) ) ( not ( = ?auto_309394 ?auto_309401 ) ) ( not ( = ?auto_309391 ?auto_309401 ) ) ( ON_BOARD ?auto_309400 ?auto_309402 ) ( POWER_ON ?auto_309400 ) ( not ( = ?auto_309399 ?auto_309400 ) ) ( HAVE_IMAGE ?auto_309391 ?auto_309392 ) ( HAVE_IMAGE ?auto_309393 ?auto_309390 ) ( HAVE_IMAGE ?auto_309396 ?auto_309397 ) ( not ( = ?auto_309391 ?auto_309393 ) ) ( not ( = ?auto_309391 ?auto_309396 ) ) ( not ( = ?auto_309392 ?auto_309390 ) ) ( not ( = ?auto_309392 ?auto_309395 ) ) ( not ( = ?auto_309392 ?auto_309397 ) ) ( not ( = ?auto_309393 ?auto_309394 ) ) ( not ( = ?auto_309393 ?auto_309396 ) ) ( not ( = ?auto_309393 ?auto_309398 ) ) ( not ( = ?auto_309393 ?auto_309401 ) ) ( not ( = ?auto_309390 ?auto_309395 ) ) ( not ( = ?auto_309390 ?auto_309397 ) ) ( not ( = ?auto_309394 ?auto_309396 ) ) ( not ( = ?auto_309396 ?auto_309398 ) ) ( not ( = ?auto_309396 ?auto_309401 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309391 ?auto_309397 ?auto_309394 ?auto_309395 )
      ( GET-4IMAGE-VERIFY ?auto_309391 ?auto_309392 ?auto_309393 ?auto_309390 ?auto_309394 ?auto_309395 ?auto_309396 ?auto_309397 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309404 - DIRECTION
      ?auto_309405 - MODE
      ?auto_309406 - DIRECTION
      ?auto_309403 - MODE
      ?auto_309407 - DIRECTION
      ?auto_309408 - MODE
      ?auto_309409 - DIRECTION
      ?auto_309410 - MODE
    )
    :vars
    (
      ?auto_309412 - INSTRUMENT
      ?auto_309415 - SATELLITE
      ?auto_309411 - DIRECTION
      ?auto_309414 - DIRECTION
      ?auto_309413 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309412 ?auto_309415 ) ( SUPPORTS ?auto_309412 ?auto_309408 ) ( not ( = ?auto_309407 ?auto_309411 ) ) ( HAVE_IMAGE ?auto_309404 ?auto_309405 ) ( not ( = ?auto_309404 ?auto_309407 ) ) ( not ( = ?auto_309404 ?auto_309411 ) ) ( not ( = ?auto_309405 ?auto_309408 ) ) ( CALIBRATION_TARGET ?auto_309412 ?auto_309411 ) ( POINTING ?auto_309415 ?auto_309414 ) ( not ( = ?auto_309411 ?auto_309414 ) ) ( not ( = ?auto_309407 ?auto_309414 ) ) ( not ( = ?auto_309404 ?auto_309414 ) ) ( ON_BOARD ?auto_309413 ?auto_309415 ) ( POWER_ON ?auto_309413 ) ( not ( = ?auto_309412 ?auto_309413 ) ) ( HAVE_IMAGE ?auto_309406 ?auto_309403 ) ( HAVE_IMAGE ?auto_309409 ?auto_309410 ) ( not ( = ?auto_309404 ?auto_309406 ) ) ( not ( = ?auto_309404 ?auto_309409 ) ) ( not ( = ?auto_309405 ?auto_309403 ) ) ( not ( = ?auto_309405 ?auto_309410 ) ) ( not ( = ?auto_309406 ?auto_309407 ) ) ( not ( = ?auto_309406 ?auto_309409 ) ) ( not ( = ?auto_309406 ?auto_309411 ) ) ( not ( = ?auto_309406 ?auto_309414 ) ) ( not ( = ?auto_309403 ?auto_309408 ) ) ( not ( = ?auto_309403 ?auto_309410 ) ) ( not ( = ?auto_309407 ?auto_309409 ) ) ( not ( = ?auto_309408 ?auto_309410 ) ) ( not ( = ?auto_309409 ?auto_309411 ) ) ( not ( = ?auto_309409 ?auto_309414 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309404 ?auto_309405 ?auto_309407 ?auto_309408 )
      ( GET-4IMAGE-VERIFY ?auto_309404 ?auto_309405 ?auto_309406 ?auto_309403 ?auto_309407 ?auto_309408 ?auto_309409 ?auto_309410 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309417 - DIRECTION
      ?auto_309418 - MODE
      ?auto_309419 - DIRECTION
      ?auto_309416 - MODE
      ?auto_309420 - DIRECTION
      ?auto_309421 - MODE
      ?auto_309422 - DIRECTION
      ?auto_309423 - MODE
    )
    :vars
    (
      ?auto_309425 - INSTRUMENT
      ?auto_309427 - SATELLITE
      ?auto_309424 - DIRECTION
      ?auto_309426 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309425 ?auto_309427 ) ( SUPPORTS ?auto_309425 ?auto_309421 ) ( not ( = ?auto_309420 ?auto_309424 ) ) ( HAVE_IMAGE ?auto_309417 ?auto_309418 ) ( not ( = ?auto_309417 ?auto_309420 ) ) ( not ( = ?auto_309417 ?auto_309424 ) ) ( not ( = ?auto_309418 ?auto_309421 ) ) ( CALIBRATION_TARGET ?auto_309425 ?auto_309424 ) ( POINTING ?auto_309427 ?auto_309422 ) ( not ( = ?auto_309424 ?auto_309422 ) ) ( not ( = ?auto_309420 ?auto_309422 ) ) ( not ( = ?auto_309417 ?auto_309422 ) ) ( ON_BOARD ?auto_309426 ?auto_309427 ) ( POWER_ON ?auto_309426 ) ( not ( = ?auto_309425 ?auto_309426 ) ) ( HAVE_IMAGE ?auto_309419 ?auto_309416 ) ( HAVE_IMAGE ?auto_309422 ?auto_309423 ) ( not ( = ?auto_309417 ?auto_309419 ) ) ( not ( = ?auto_309418 ?auto_309416 ) ) ( not ( = ?auto_309418 ?auto_309423 ) ) ( not ( = ?auto_309419 ?auto_309420 ) ) ( not ( = ?auto_309419 ?auto_309422 ) ) ( not ( = ?auto_309419 ?auto_309424 ) ) ( not ( = ?auto_309416 ?auto_309421 ) ) ( not ( = ?auto_309416 ?auto_309423 ) ) ( not ( = ?auto_309421 ?auto_309423 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309417 ?auto_309418 ?auto_309420 ?auto_309421 )
      ( GET-4IMAGE-VERIFY ?auto_309417 ?auto_309418 ?auto_309419 ?auto_309416 ?auto_309420 ?auto_309421 ?auto_309422 ?auto_309423 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309462 - DIRECTION
      ?auto_309463 - MODE
      ?auto_309464 - DIRECTION
      ?auto_309461 - MODE
      ?auto_309465 - DIRECTION
      ?auto_309466 - MODE
      ?auto_309467 - DIRECTION
      ?auto_309468 - MODE
    )
    :vars
    (
      ?auto_309470 - INSTRUMENT
      ?auto_309472 - SATELLITE
      ?auto_309469 - DIRECTION
      ?auto_309471 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309470 ?auto_309472 ) ( SUPPORTS ?auto_309470 ?auto_309468 ) ( not ( = ?auto_309467 ?auto_309469 ) ) ( HAVE_IMAGE ?auto_309462 ?auto_309463 ) ( not ( = ?auto_309462 ?auto_309467 ) ) ( not ( = ?auto_309462 ?auto_309469 ) ) ( not ( = ?auto_309463 ?auto_309468 ) ) ( CALIBRATION_TARGET ?auto_309470 ?auto_309469 ) ( POINTING ?auto_309472 ?auto_309464 ) ( not ( = ?auto_309469 ?auto_309464 ) ) ( not ( = ?auto_309467 ?auto_309464 ) ) ( not ( = ?auto_309462 ?auto_309464 ) ) ( ON_BOARD ?auto_309471 ?auto_309472 ) ( POWER_ON ?auto_309471 ) ( not ( = ?auto_309470 ?auto_309471 ) ) ( HAVE_IMAGE ?auto_309464 ?auto_309461 ) ( HAVE_IMAGE ?auto_309465 ?auto_309466 ) ( not ( = ?auto_309462 ?auto_309465 ) ) ( not ( = ?auto_309463 ?auto_309461 ) ) ( not ( = ?auto_309463 ?auto_309466 ) ) ( not ( = ?auto_309464 ?auto_309465 ) ) ( not ( = ?auto_309461 ?auto_309466 ) ) ( not ( = ?auto_309461 ?auto_309468 ) ) ( not ( = ?auto_309465 ?auto_309467 ) ) ( not ( = ?auto_309465 ?auto_309469 ) ) ( not ( = ?auto_309466 ?auto_309468 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309462 ?auto_309463 ?auto_309467 ?auto_309468 )
      ( GET-4IMAGE-VERIFY ?auto_309462 ?auto_309463 ?auto_309464 ?auto_309461 ?auto_309465 ?auto_309466 ?auto_309467 ?auto_309468 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309535 - DIRECTION
      ?auto_309536 - MODE
      ?auto_309537 - DIRECTION
      ?auto_309534 - MODE
      ?auto_309538 - DIRECTION
      ?auto_309539 - MODE
      ?auto_309540 - DIRECTION
      ?auto_309541 - MODE
    )
    :vars
    (
      ?auto_309543 - INSTRUMENT
      ?auto_309546 - SATELLITE
      ?auto_309542 - DIRECTION
      ?auto_309545 - DIRECTION
      ?auto_309544 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309543 ?auto_309546 ) ( SUPPORTS ?auto_309543 ?auto_309534 ) ( not ( = ?auto_309537 ?auto_309542 ) ) ( HAVE_IMAGE ?auto_309535 ?auto_309536 ) ( not ( = ?auto_309535 ?auto_309537 ) ) ( not ( = ?auto_309535 ?auto_309542 ) ) ( not ( = ?auto_309536 ?auto_309534 ) ) ( CALIBRATION_TARGET ?auto_309543 ?auto_309542 ) ( POINTING ?auto_309546 ?auto_309545 ) ( not ( = ?auto_309542 ?auto_309545 ) ) ( not ( = ?auto_309537 ?auto_309545 ) ) ( not ( = ?auto_309535 ?auto_309545 ) ) ( ON_BOARD ?auto_309544 ?auto_309546 ) ( POWER_ON ?auto_309544 ) ( not ( = ?auto_309543 ?auto_309544 ) ) ( HAVE_IMAGE ?auto_309538 ?auto_309539 ) ( HAVE_IMAGE ?auto_309540 ?auto_309541 ) ( not ( = ?auto_309535 ?auto_309538 ) ) ( not ( = ?auto_309535 ?auto_309540 ) ) ( not ( = ?auto_309536 ?auto_309539 ) ) ( not ( = ?auto_309536 ?auto_309541 ) ) ( not ( = ?auto_309537 ?auto_309538 ) ) ( not ( = ?auto_309537 ?auto_309540 ) ) ( not ( = ?auto_309534 ?auto_309539 ) ) ( not ( = ?auto_309534 ?auto_309541 ) ) ( not ( = ?auto_309538 ?auto_309540 ) ) ( not ( = ?auto_309538 ?auto_309542 ) ) ( not ( = ?auto_309538 ?auto_309545 ) ) ( not ( = ?auto_309539 ?auto_309541 ) ) ( not ( = ?auto_309540 ?auto_309542 ) ) ( not ( = ?auto_309540 ?auto_309545 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309535 ?auto_309536 ?auto_309537 ?auto_309534 )
      ( GET-4IMAGE-VERIFY ?auto_309535 ?auto_309536 ?auto_309537 ?auto_309534 ?auto_309538 ?auto_309539 ?auto_309540 ?auto_309541 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309548 - DIRECTION
      ?auto_309549 - MODE
      ?auto_309550 - DIRECTION
      ?auto_309547 - MODE
      ?auto_309551 - DIRECTION
      ?auto_309552 - MODE
      ?auto_309553 - DIRECTION
      ?auto_309554 - MODE
    )
    :vars
    (
      ?auto_309556 - INSTRUMENT
      ?auto_309558 - SATELLITE
      ?auto_309555 - DIRECTION
      ?auto_309557 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309556 ?auto_309558 ) ( SUPPORTS ?auto_309556 ?auto_309547 ) ( not ( = ?auto_309550 ?auto_309555 ) ) ( HAVE_IMAGE ?auto_309548 ?auto_309552 ) ( not ( = ?auto_309548 ?auto_309550 ) ) ( not ( = ?auto_309548 ?auto_309555 ) ) ( not ( = ?auto_309552 ?auto_309547 ) ) ( CALIBRATION_TARGET ?auto_309556 ?auto_309555 ) ( POINTING ?auto_309558 ?auto_309553 ) ( not ( = ?auto_309555 ?auto_309553 ) ) ( not ( = ?auto_309550 ?auto_309553 ) ) ( not ( = ?auto_309548 ?auto_309553 ) ) ( ON_BOARD ?auto_309557 ?auto_309558 ) ( POWER_ON ?auto_309557 ) ( not ( = ?auto_309556 ?auto_309557 ) ) ( HAVE_IMAGE ?auto_309548 ?auto_309549 ) ( HAVE_IMAGE ?auto_309551 ?auto_309552 ) ( HAVE_IMAGE ?auto_309553 ?auto_309554 ) ( not ( = ?auto_309548 ?auto_309551 ) ) ( not ( = ?auto_309549 ?auto_309547 ) ) ( not ( = ?auto_309549 ?auto_309552 ) ) ( not ( = ?auto_309549 ?auto_309554 ) ) ( not ( = ?auto_309550 ?auto_309551 ) ) ( not ( = ?auto_309547 ?auto_309554 ) ) ( not ( = ?auto_309551 ?auto_309553 ) ) ( not ( = ?auto_309551 ?auto_309555 ) ) ( not ( = ?auto_309552 ?auto_309554 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309548 ?auto_309552 ?auto_309550 ?auto_309547 )
      ( GET-4IMAGE-VERIFY ?auto_309548 ?auto_309549 ?auto_309550 ?auto_309547 ?auto_309551 ?auto_309552 ?auto_309553 ?auto_309554 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309599 - DIRECTION
      ?auto_309600 - MODE
      ?auto_309601 - DIRECTION
      ?auto_309598 - MODE
      ?auto_309602 - DIRECTION
      ?auto_309603 - MODE
      ?auto_309604 - DIRECTION
      ?auto_309605 - MODE
    )
    :vars
    (
      ?auto_309607 - INSTRUMENT
      ?auto_309609 - SATELLITE
      ?auto_309606 - DIRECTION
      ?auto_309608 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309607 ?auto_309609 ) ( SUPPORTS ?auto_309607 ?auto_309598 ) ( not ( = ?auto_309601 ?auto_309606 ) ) ( HAVE_IMAGE ?auto_309599 ?auto_309600 ) ( not ( = ?auto_309599 ?auto_309601 ) ) ( not ( = ?auto_309599 ?auto_309606 ) ) ( not ( = ?auto_309600 ?auto_309598 ) ) ( CALIBRATION_TARGET ?auto_309607 ?auto_309606 ) ( POINTING ?auto_309609 ?auto_309604 ) ( not ( = ?auto_309606 ?auto_309604 ) ) ( not ( = ?auto_309601 ?auto_309604 ) ) ( not ( = ?auto_309599 ?auto_309604 ) ) ( ON_BOARD ?auto_309608 ?auto_309609 ) ( POWER_ON ?auto_309608 ) ( not ( = ?auto_309607 ?auto_309608 ) ) ( HAVE_IMAGE ?auto_309602 ?auto_309603 ) ( HAVE_IMAGE ?auto_309604 ?auto_309605 ) ( not ( = ?auto_309599 ?auto_309602 ) ) ( not ( = ?auto_309600 ?auto_309603 ) ) ( not ( = ?auto_309600 ?auto_309605 ) ) ( not ( = ?auto_309601 ?auto_309602 ) ) ( not ( = ?auto_309598 ?auto_309603 ) ) ( not ( = ?auto_309598 ?auto_309605 ) ) ( not ( = ?auto_309602 ?auto_309604 ) ) ( not ( = ?auto_309602 ?auto_309606 ) ) ( not ( = ?auto_309603 ?auto_309605 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309599 ?auto_309600 ?auto_309601 ?auto_309598 )
      ( GET-4IMAGE-VERIFY ?auto_309599 ?auto_309600 ?auto_309601 ?auto_309598 ?auto_309602 ?auto_309603 ?auto_309604 ?auto_309605 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309723 - DIRECTION
      ?auto_309724 - MODE
      ?auto_309725 - DIRECTION
      ?auto_309722 - MODE
      ?auto_309726 - DIRECTION
      ?auto_309727 - MODE
      ?auto_309728 - DIRECTION
      ?auto_309729 - MODE
    )
    :vars
    (
      ?auto_309731 - INSTRUMENT
      ?auto_309734 - SATELLITE
      ?auto_309730 - DIRECTION
      ?auto_309733 - DIRECTION
      ?auto_309732 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309731 ?auto_309734 ) ( SUPPORTS ?auto_309731 ?auto_309729 ) ( not ( = ?auto_309728 ?auto_309730 ) ) ( HAVE_IMAGE ?auto_309725 ?auto_309727 ) ( not ( = ?auto_309725 ?auto_309728 ) ) ( not ( = ?auto_309725 ?auto_309730 ) ) ( not ( = ?auto_309727 ?auto_309729 ) ) ( CALIBRATION_TARGET ?auto_309731 ?auto_309730 ) ( POINTING ?auto_309734 ?auto_309733 ) ( not ( = ?auto_309730 ?auto_309733 ) ) ( not ( = ?auto_309728 ?auto_309733 ) ) ( not ( = ?auto_309725 ?auto_309733 ) ) ( ON_BOARD ?auto_309732 ?auto_309734 ) ( POWER_ON ?auto_309732 ) ( not ( = ?auto_309731 ?auto_309732 ) ) ( HAVE_IMAGE ?auto_309723 ?auto_309724 ) ( HAVE_IMAGE ?auto_309725 ?auto_309722 ) ( HAVE_IMAGE ?auto_309726 ?auto_309727 ) ( not ( = ?auto_309723 ?auto_309725 ) ) ( not ( = ?auto_309723 ?auto_309726 ) ) ( not ( = ?auto_309723 ?auto_309728 ) ) ( not ( = ?auto_309723 ?auto_309730 ) ) ( not ( = ?auto_309723 ?auto_309733 ) ) ( not ( = ?auto_309724 ?auto_309722 ) ) ( not ( = ?auto_309724 ?auto_309727 ) ) ( not ( = ?auto_309724 ?auto_309729 ) ) ( not ( = ?auto_309725 ?auto_309726 ) ) ( not ( = ?auto_309722 ?auto_309727 ) ) ( not ( = ?auto_309722 ?auto_309729 ) ) ( not ( = ?auto_309726 ?auto_309728 ) ) ( not ( = ?auto_309726 ?auto_309730 ) ) ( not ( = ?auto_309726 ?auto_309733 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309725 ?auto_309727 ?auto_309728 ?auto_309729 )
      ( GET-4IMAGE-VERIFY ?auto_309723 ?auto_309724 ?auto_309725 ?auto_309722 ?auto_309726 ?auto_309727 ?auto_309728 ?auto_309729 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309736 - DIRECTION
      ?auto_309737 - MODE
      ?auto_309738 - DIRECTION
      ?auto_309735 - MODE
      ?auto_309739 - DIRECTION
      ?auto_309740 - MODE
      ?auto_309741 - DIRECTION
      ?auto_309742 - MODE
    )
    :vars
    (
      ?auto_309744 - INSTRUMENT
      ?auto_309747 - SATELLITE
      ?auto_309743 - DIRECTION
      ?auto_309746 - DIRECTION
      ?auto_309745 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309744 ?auto_309747 ) ( SUPPORTS ?auto_309744 ?auto_309742 ) ( not ( = ?auto_309741 ?auto_309743 ) ) ( HAVE_IMAGE ?auto_309738 ?auto_309735 ) ( not ( = ?auto_309738 ?auto_309741 ) ) ( not ( = ?auto_309738 ?auto_309743 ) ) ( not ( = ?auto_309735 ?auto_309742 ) ) ( CALIBRATION_TARGET ?auto_309744 ?auto_309743 ) ( POINTING ?auto_309747 ?auto_309746 ) ( not ( = ?auto_309743 ?auto_309746 ) ) ( not ( = ?auto_309741 ?auto_309746 ) ) ( not ( = ?auto_309738 ?auto_309746 ) ) ( ON_BOARD ?auto_309745 ?auto_309747 ) ( POWER_ON ?auto_309745 ) ( not ( = ?auto_309744 ?auto_309745 ) ) ( HAVE_IMAGE ?auto_309736 ?auto_309737 ) ( HAVE_IMAGE ?auto_309739 ?auto_309740 ) ( not ( = ?auto_309736 ?auto_309738 ) ) ( not ( = ?auto_309736 ?auto_309739 ) ) ( not ( = ?auto_309736 ?auto_309741 ) ) ( not ( = ?auto_309736 ?auto_309743 ) ) ( not ( = ?auto_309736 ?auto_309746 ) ) ( not ( = ?auto_309737 ?auto_309735 ) ) ( not ( = ?auto_309737 ?auto_309740 ) ) ( not ( = ?auto_309737 ?auto_309742 ) ) ( not ( = ?auto_309738 ?auto_309739 ) ) ( not ( = ?auto_309735 ?auto_309740 ) ) ( not ( = ?auto_309739 ?auto_309741 ) ) ( not ( = ?auto_309739 ?auto_309743 ) ) ( not ( = ?auto_309739 ?auto_309746 ) ) ( not ( = ?auto_309740 ?auto_309742 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309738 ?auto_309735 ?auto_309741 ?auto_309742 )
      ( GET-4IMAGE-VERIFY ?auto_309736 ?auto_309737 ?auto_309738 ?auto_309735 ?auto_309739 ?auto_309740 ?auto_309741 ?auto_309742 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309757 - DIRECTION
      ?auto_309758 - MODE
      ?auto_309759 - DIRECTION
      ?auto_309756 - MODE
      ?auto_309760 - DIRECTION
      ?auto_309761 - MODE
      ?auto_309762 - DIRECTION
      ?auto_309763 - MODE
    )
    :vars
    (
      ?auto_309765 - INSTRUMENT
      ?auto_309768 - SATELLITE
      ?auto_309764 - DIRECTION
      ?auto_309767 - DIRECTION
      ?auto_309766 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309765 ?auto_309768 ) ( SUPPORTS ?auto_309765 ?auto_309761 ) ( not ( = ?auto_309760 ?auto_309764 ) ) ( HAVE_IMAGE ?auto_309762 ?auto_309756 ) ( not ( = ?auto_309762 ?auto_309760 ) ) ( not ( = ?auto_309762 ?auto_309764 ) ) ( not ( = ?auto_309756 ?auto_309761 ) ) ( CALIBRATION_TARGET ?auto_309765 ?auto_309764 ) ( POINTING ?auto_309768 ?auto_309767 ) ( not ( = ?auto_309764 ?auto_309767 ) ) ( not ( = ?auto_309760 ?auto_309767 ) ) ( not ( = ?auto_309762 ?auto_309767 ) ) ( ON_BOARD ?auto_309766 ?auto_309768 ) ( POWER_ON ?auto_309766 ) ( not ( = ?auto_309765 ?auto_309766 ) ) ( HAVE_IMAGE ?auto_309757 ?auto_309758 ) ( HAVE_IMAGE ?auto_309759 ?auto_309756 ) ( HAVE_IMAGE ?auto_309762 ?auto_309763 ) ( not ( = ?auto_309757 ?auto_309759 ) ) ( not ( = ?auto_309757 ?auto_309760 ) ) ( not ( = ?auto_309757 ?auto_309762 ) ) ( not ( = ?auto_309757 ?auto_309764 ) ) ( not ( = ?auto_309757 ?auto_309767 ) ) ( not ( = ?auto_309758 ?auto_309756 ) ) ( not ( = ?auto_309758 ?auto_309761 ) ) ( not ( = ?auto_309758 ?auto_309763 ) ) ( not ( = ?auto_309759 ?auto_309760 ) ) ( not ( = ?auto_309759 ?auto_309762 ) ) ( not ( = ?auto_309759 ?auto_309764 ) ) ( not ( = ?auto_309759 ?auto_309767 ) ) ( not ( = ?auto_309756 ?auto_309763 ) ) ( not ( = ?auto_309761 ?auto_309763 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309762 ?auto_309756 ?auto_309760 ?auto_309761 )
      ( GET-4IMAGE-VERIFY ?auto_309757 ?auto_309758 ?auto_309759 ?auto_309756 ?auto_309760 ?auto_309761 ?auto_309762 ?auto_309763 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309770 - DIRECTION
      ?auto_309771 - MODE
      ?auto_309772 - DIRECTION
      ?auto_309769 - MODE
      ?auto_309773 - DIRECTION
      ?auto_309774 - MODE
      ?auto_309775 - DIRECTION
      ?auto_309776 - MODE
    )
    :vars
    (
      ?auto_309778 - INSTRUMENT
      ?auto_309781 - SATELLITE
      ?auto_309777 - DIRECTION
      ?auto_309780 - DIRECTION
      ?auto_309779 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309778 ?auto_309781 ) ( SUPPORTS ?auto_309778 ?auto_309774 ) ( not ( = ?auto_309773 ?auto_309777 ) ) ( HAVE_IMAGE ?auto_309772 ?auto_309769 ) ( not ( = ?auto_309772 ?auto_309773 ) ) ( not ( = ?auto_309772 ?auto_309777 ) ) ( not ( = ?auto_309769 ?auto_309774 ) ) ( CALIBRATION_TARGET ?auto_309778 ?auto_309777 ) ( POINTING ?auto_309781 ?auto_309780 ) ( not ( = ?auto_309777 ?auto_309780 ) ) ( not ( = ?auto_309773 ?auto_309780 ) ) ( not ( = ?auto_309772 ?auto_309780 ) ) ( ON_BOARD ?auto_309779 ?auto_309781 ) ( POWER_ON ?auto_309779 ) ( not ( = ?auto_309778 ?auto_309779 ) ) ( HAVE_IMAGE ?auto_309770 ?auto_309771 ) ( HAVE_IMAGE ?auto_309775 ?auto_309776 ) ( not ( = ?auto_309770 ?auto_309772 ) ) ( not ( = ?auto_309770 ?auto_309773 ) ) ( not ( = ?auto_309770 ?auto_309775 ) ) ( not ( = ?auto_309770 ?auto_309777 ) ) ( not ( = ?auto_309770 ?auto_309780 ) ) ( not ( = ?auto_309771 ?auto_309769 ) ) ( not ( = ?auto_309771 ?auto_309774 ) ) ( not ( = ?auto_309771 ?auto_309776 ) ) ( not ( = ?auto_309772 ?auto_309775 ) ) ( not ( = ?auto_309769 ?auto_309776 ) ) ( not ( = ?auto_309773 ?auto_309775 ) ) ( not ( = ?auto_309774 ?auto_309776 ) ) ( not ( = ?auto_309775 ?auto_309777 ) ) ( not ( = ?auto_309775 ?auto_309780 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309772 ?auto_309769 ?auto_309773 ?auto_309774 )
      ( GET-4IMAGE-VERIFY ?auto_309770 ?auto_309771 ?auto_309772 ?auto_309769 ?auto_309773 ?auto_309774 ?auto_309775 ?auto_309776 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309804 - DIRECTION
      ?auto_309805 - MODE
      ?auto_309806 - DIRECTION
      ?auto_309803 - MODE
      ?auto_309807 - DIRECTION
      ?auto_309808 - MODE
      ?auto_309809 - DIRECTION
      ?auto_309810 - MODE
    )
    :vars
    (
      ?auto_309812 - INSTRUMENT
      ?auto_309815 - SATELLITE
      ?auto_309811 - DIRECTION
      ?auto_309814 - DIRECTION
      ?auto_309813 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309812 ?auto_309815 ) ( SUPPORTS ?auto_309812 ?auto_309810 ) ( not ( = ?auto_309809 ?auto_309811 ) ) ( HAVE_IMAGE ?auto_309807 ?auto_309808 ) ( not ( = ?auto_309807 ?auto_309809 ) ) ( not ( = ?auto_309807 ?auto_309811 ) ) ( not ( = ?auto_309808 ?auto_309810 ) ) ( CALIBRATION_TARGET ?auto_309812 ?auto_309811 ) ( POINTING ?auto_309815 ?auto_309814 ) ( not ( = ?auto_309811 ?auto_309814 ) ) ( not ( = ?auto_309809 ?auto_309814 ) ) ( not ( = ?auto_309807 ?auto_309814 ) ) ( ON_BOARD ?auto_309813 ?auto_309815 ) ( POWER_ON ?auto_309813 ) ( not ( = ?auto_309812 ?auto_309813 ) ) ( HAVE_IMAGE ?auto_309804 ?auto_309805 ) ( HAVE_IMAGE ?auto_309806 ?auto_309803 ) ( not ( = ?auto_309804 ?auto_309806 ) ) ( not ( = ?auto_309804 ?auto_309807 ) ) ( not ( = ?auto_309804 ?auto_309809 ) ) ( not ( = ?auto_309804 ?auto_309811 ) ) ( not ( = ?auto_309804 ?auto_309814 ) ) ( not ( = ?auto_309805 ?auto_309803 ) ) ( not ( = ?auto_309805 ?auto_309808 ) ) ( not ( = ?auto_309805 ?auto_309810 ) ) ( not ( = ?auto_309806 ?auto_309807 ) ) ( not ( = ?auto_309806 ?auto_309809 ) ) ( not ( = ?auto_309806 ?auto_309811 ) ) ( not ( = ?auto_309806 ?auto_309814 ) ) ( not ( = ?auto_309803 ?auto_309808 ) ) ( not ( = ?auto_309803 ?auto_309810 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309807 ?auto_309808 ?auto_309809 ?auto_309810 )
      ( GET-4IMAGE-VERIFY ?auto_309804 ?auto_309805 ?auto_309806 ?auto_309803 ?auto_309807 ?auto_309808 ?auto_309809 ?auto_309810 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309817 - DIRECTION
      ?auto_309818 - MODE
      ?auto_309819 - DIRECTION
      ?auto_309816 - MODE
      ?auto_309820 - DIRECTION
      ?auto_309821 - MODE
      ?auto_309822 - DIRECTION
      ?auto_309823 - MODE
    )
    :vars
    (
      ?auto_309825 - INSTRUMENT
      ?auto_309830 - SATELLITE
      ?auto_309824 - DIRECTION
      ?auto_309829 - DIRECTION
      ?auto_309827 - MODE
      ?auto_309828 - DIRECTION
      ?auto_309826 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309825 ?auto_309830 ) ( SUPPORTS ?auto_309825 ?auto_309823 ) ( not ( = ?auto_309822 ?auto_309824 ) ) ( HAVE_IMAGE ?auto_309829 ?auto_309827 ) ( not ( = ?auto_309829 ?auto_309822 ) ) ( not ( = ?auto_309829 ?auto_309824 ) ) ( not ( = ?auto_309827 ?auto_309823 ) ) ( CALIBRATION_TARGET ?auto_309825 ?auto_309824 ) ( POINTING ?auto_309830 ?auto_309828 ) ( not ( = ?auto_309824 ?auto_309828 ) ) ( not ( = ?auto_309822 ?auto_309828 ) ) ( not ( = ?auto_309829 ?auto_309828 ) ) ( ON_BOARD ?auto_309826 ?auto_309830 ) ( POWER_ON ?auto_309826 ) ( not ( = ?auto_309825 ?auto_309826 ) ) ( HAVE_IMAGE ?auto_309817 ?auto_309818 ) ( HAVE_IMAGE ?auto_309819 ?auto_309816 ) ( HAVE_IMAGE ?auto_309820 ?auto_309821 ) ( not ( = ?auto_309817 ?auto_309819 ) ) ( not ( = ?auto_309817 ?auto_309820 ) ) ( not ( = ?auto_309817 ?auto_309822 ) ) ( not ( = ?auto_309817 ?auto_309824 ) ) ( not ( = ?auto_309817 ?auto_309829 ) ) ( not ( = ?auto_309817 ?auto_309828 ) ) ( not ( = ?auto_309818 ?auto_309816 ) ) ( not ( = ?auto_309818 ?auto_309821 ) ) ( not ( = ?auto_309818 ?auto_309823 ) ) ( not ( = ?auto_309818 ?auto_309827 ) ) ( not ( = ?auto_309819 ?auto_309820 ) ) ( not ( = ?auto_309819 ?auto_309822 ) ) ( not ( = ?auto_309819 ?auto_309824 ) ) ( not ( = ?auto_309819 ?auto_309829 ) ) ( not ( = ?auto_309819 ?auto_309828 ) ) ( not ( = ?auto_309816 ?auto_309821 ) ) ( not ( = ?auto_309816 ?auto_309823 ) ) ( not ( = ?auto_309816 ?auto_309827 ) ) ( not ( = ?auto_309820 ?auto_309822 ) ) ( not ( = ?auto_309820 ?auto_309824 ) ) ( not ( = ?auto_309820 ?auto_309829 ) ) ( not ( = ?auto_309820 ?auto_309828 ) ) ( not ( = ?auto_309821 ?auto_309823 ) ) ( not ( = ?auto_309821 ?auto_309827 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309829 ?auto_309827 ?auto_309822 ?auto_309823 )
      ( GET-4IMAGE-VERIFY ?auto_309817 ?auto_309818 ?auto_309819 ?auto_309816 ?auto_309820 ?auto_309821 ?auto_309822 ?auto_309823 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309859 - DIRECTION
      ?auto_309860 - MODE
      ?auto_309861 - DIRECTION
      ?auto_309858 - MODE
      ?auto_309862 - DIRECTION
      ?auto_309863 - MODE
      ?auto_309864 - DIRECTION
      ?auto_309865 - MODE
    )
    :vars
    (
      ?auto_309867 - INSTRUMENT
      ?auto_309872 - SATELLITE
      ?auto_309866 - DIRECTION
      ?auto_309871 - DIRECTION
      ?auto_309869 - MODE
      ?auto_309870 - DIRECTION
      ?auto_309868 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309867 ?auto_309872 ) ( SUPPORTS ?auto_309867 ?auto_309863 ) ( not ( = ?auto_309862 ?auto_309866 ) ) ( HAVE_IMAGE ?auto_309871 ?auto_309869 ) ( not ( = ?auto_309871 ?auto_309862 ) ) ( not ( = ?auto_309871 ?auto_309866 ) ) ( not ( = ?auto_309869 ?auto_309863 ) ) ( CALIBRATION_TARGET ?auto_309867 ?auto_309866 ) ( POINTING ?auto_309872 ?auto_309870 ) ( not ( = ?auto_309866 ?auto_309870 ) ) ( not ( = ?auto_309862 ?auto_309870 ) ) ( not ( = ?auto_309871 ?auto_309870 ) ) ( ON_BOARD ?auto_309868 ?auto_309872 ) ( POWER_ON ?auto_309868 ) ( not ( = ?auto_309867 ?auto_309868 ) ) ( HAVE_IMAGE ?auto_309859 ?auto_309860 ) ( HAVE_IMAGE ?auto_309861 ?auto_309858 ) ( HAVE_IMAGE ?auto_309864 ?auto_309865 ) ( not ( = ?auto_309859 ?auto_309861 ) ) ( not ( = ?auto_309859 ?auto_309862 ) ) ( not ( = ?auto_309859 ?auto_309864 ) ) ( not ( = ?auto_309859 ?auto_309866 ) ) ( not ( = ?auto_309859 ?auto_309871 ) ) ( not ( = ?auto_309859 ?auto_309870 ) ) ( not ( = ?auto_309860 ?auto_309858 ) ) ( not ( = ?auto_309860 ?auto_309863 ) ) ( not ( = ?auto_309860 ?auto_309865 ) ) ( not ( = ?auto_309860 ?auto_309869 ) ) ( not ( = ?auto_309861 ?auto_309862 ) ) ( not ( = ?auto_309861 ?auto_309864 ) ) ( not ( = ?auto_309861 ?auto_309866 ) ) ( not ( = ?auto_309861 ?auto_309871 ) ) ( not ( = ?auto_309861 ?auto_309870 ) ) ( not ( = ?auto_309858 ?auto_309863 ) ) ( not ( = ?auto_309858 ?auto_309865 ) ) ( not ( = ?auto_309858 ?auto_309869 ) ) ( not ( = ?auto_309862 ?auto_309864 ) ) ( not ( = ?auto_309863 ?auto_309865 ) ) ( not ( = ?auto_309864 ?auto_309866 ) ) ( not ( = ?auto_309864 ?auto_309871 ) ) ( not ( = ?auto_309864 ?auto_309870 ) ) ( not ( = ?auto_309865 ?auto_309869 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309871 ?auto_309869 ?auto_309862 ?auto_309863 )
      ( GET-4IMAGE-VERIFY ?auto_309859 ?auto_309860 ?auto_309861 ?auto_309858 ?auto_309862 ?auto_309863 ?auto_309864 ?auto_309865 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309874 - DIRECTION
      ?auto_309875 - MODE
      ?auto_309876 - DIRECTION
      ?auto_309873 - MODE
      ?auto_309877 - DIRECTION
      ?auto_309878 - MODE
      ?auto_309879 - DIRECTION
      ?auto_309880 - MODE
    )
    :vars
    (
      ?auto_309882 - INSTRUMENT
      ?auto_309886 - SATELLITE
      ?auto_309881 - DIRECTION
      ?auto_309885 - DIRECTION
      ?auto_309884 - MODE
      ?auto_309883 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309882 ?auto_309886 ) ( SUPPORTS ?auto_309882 ?auto_309878 ) ( not ( = ?auto_309877 ?auto_309881 ) ) ( HAVE_IMAGE ?auto_309885 ?auto_309884 ) ( not ( = ?auto_309885 ?auto_309877 ) ) ( not ( = ?auto_309885 ?auto_309881 ) ) ( not ( = ?auto_309884 ?auto_309878 ) ) ( CALIBRATION_TARGET ?auto_309882 ?auto_309881 ) ( POINTING ?auto_309886 ?auto_309879 ) ( not ( = ?auto_309881 ?auto_309879 ) ) ( not ( = ?auto_309877 ?auto_309879 ) ) ( not ( = ?auto_309885 ?auto_309879 ) ) ( ON_BOARD ?auto_309883 ?auto_309886 ) ( POWER_ON ?auto_309883 ) ( not ( = ?auto_309882 ?auto_309883 ) ) ( HAVE_IMAGE ?auto_309874 ?auto_309875 ) ( HAVE_IMAGE ?auto_309876 ?auto_309873 ) ( HAVE_IMAGE ?auto_309879 ?auto_309880 ) ( not ( = ?auto_309874 ?auto_309876 ) ) ( not ( = ?auto_309874 ?auto_309877 ) ) ( not ( = ?auto_309874 ?auto_309879 ) ) ( not ( = ?auto_309874 ?auto_309881 ) ) ( not ( = ?auto_309874 ?auto_309885 ) ) ( not ( = ?auto_309875 ?auto_309873 ) ) ( not ( = ?auto_309875 ?auto_309878 ) ) ( not ( = ?auto_309875 ?auto_309880 ) ) ( not ( = ?auto_309875 ?auto_309884 ) ) ( not ( = ?auto_309876 ?auto_309877 ) ) ( not ( = ?auto_309876 ?auto_309879 ) ) ( not ( = ?auto_309876 ?auto_309881 ) ) ( not ( = ?auto_309876 ?auto_309885 ) ) ( not ( = ?auto_309873 ?auto_309878 ) ) ( not ( = ?auto_309873 ?auto_309880 ) ) ( not ( = ?auto_309873 ?auto_309884 ) ) ( not ( = ?auto_309878 ?auto_309880 ) ) ( not ( = ?auto_309880 ?auto_309884 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309885 ?auto_309884 ?auto_309877 ?auto_309878 )
      ( GET-4IMAGE-VERIFY ?auto_309874 ?auto_309875 ?auto_309876 ?auto_309873 ?auto_309877 ?auto_309878 ?auto_309879 ?auto_309880 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309911 - DIRECTION
      ?auto_309912 - MODE
      ?auto_309913 - DIRECTION
      ?auto_309910 - MODE
      ?auto_309914 - DIRECTION
      ?auto_309915 - MODE
      ?auto_309916 - DIRECTION
      ?auto_309917 - MODE
    )
    :vars
    (
      ?auto_309919 - INSTRUMENT
      ?auto_309923 - SATELLITE
      ?auto_309918 - DIRECTION
      ?auto_309922 - DIRECTION
      ?auto_309921 - MODE
      ?auto_309920 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309919 ?auto_309923 ) ( SUPPORTS ?auto_309919 ?auto_309917 ) ( not ( = ?auto_309916 ?auto_309918 ) ) ( HAVE_IMAGE ?auto_309922 ?auto_309921 ) ( not ( = ?auto_309922 ?auto_309916 ) ) ( not ( = ?auto_309922 ?auto_309918 ) ) ( not ( = ?auto_309921 ?auto_309917 ) ) ( CALIBRATION_TARGET ?auto_309919 ?auto_309918 ) ( POINTING ?auto_309923 ?auto_309913 ) ( not ( = ?auto_309918 ?auto_309913 ) ) ( not ( = ?auto_309916 ?auto_309913 ) ) ( not ( = ?auto_309922 ?auto_309913 ) ) ( ON_BOARD ?auto_309920 ?auto_309923 ) ( POWER_ON ?auto_309920 ) ( not ( = ?auto_309919 ?auto_309920 ) ) ( HAVE_IMAGE ?auto_309911 ?auto_309912 ) ( HAVE_IMAGE ?auto_309913 ?auto_309910 ) ( HAVE_IMAGE ?auto_309914 ?auto_309915 ) ( not ( = ?auto_309911 ?auto_309913 ) ) ( not ( = ?auto_309911 ?auto_309914 ) ) ( not ( = ?auto_309911 ?auto_309916 ) ) ( not ( = ?auto_309911 ?auto_309918 ) ) ( not ( = ?auto_309911 ?auto_309922 ) ) ( not ( = ?auto_309912 ?auto_309910 ) ) ( not ( = ?auto_309912 ?auto_309915 ) ) ( not ( = ?auto_309912 ?auto_309917 ) ) ( not ( = ?auto_309912 ?auto_309921 ) ) ( not ( = ?auto_309913 ?auto_309914 ) ) ( not ( = ?auto_309910 ?auto_309915 ) ) ( not ( = ?auto_309910 ?auto_309917 ) ) ( not ( = ?auto_309910 ?auto_309921 ) ) ( not ( = ?auto_309914 ?auto_309916 ) ) ( not ( = ?auto_309914 ?auto_309918 ) ) ( not ( = ?auto_309914 ?auto_309922 ) ) ( not ( = ?auto_309915 ?auto_309917 ) ) ( not ( = ?auto_309915 ?auto_309921 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309922 ?auto_309921 ?auto_309916 ?auto_309917 )
      ( GET-4IMAGE-VERIFY ?auto_309911 ?auto_309912 ?auto_309913 ?auto_309910 ?auto_309914 ?auto_309915 ?auto_309916 ?auto_309917 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309989 - DIRECTION
      ?auto_309990 - MODE
      ?auto_309991 - DIRECTION
      ?auto_309988 - MODE
      ?auto_309992 - DIRECTION
      ?auto_309993 - MODE
      ?auto_309994 - DIRECTION
      ?auto_309995 - MODE
    )
    :vars
    (
      ?auto_309997 - INSTRUMENT
      ?auto_310000 - SATELLITE
      ?auto_309996 - DIRECTION
      ?auto_309999 - DIRECTION
      ?auto_309998 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_309997 ?auto_310000 ) ( SUPPORTS ?auto_309997 ?auto_309988 ) ( not ( = ?auto_309991 ?auto_309996 ) ) ( HAVE_IMAGE ?auto_309992 ?auto_309993 ) ( not ( = ?auto_309992 ?auto_309991 ) ) ( not ( = ?auto_309992 ?auto_309996 ) ) ( not ( = ?auto_309993 ?auto_309988 ) ) ( CALIBRATION_TARGET ?auto_309997 ?auto_309996 ) ( POINTING ?auto_310000 ?auto_309999 ) ( not ( = ?auto_309996 ?auto_309999 ) ) ( not ( = ?auto_309991 ?auto_309999 ) ) ( not ( = ?auto_309992 ?auto_309999 ) ) ( ON_BOARD ?auto_309998 ?auto_310000 ) ( POWER_ON ?auto_309998 ) ( not ( = ?auto_309997 ?auto_309998 ) ) ( HAVE_IMAGE ?auto_309989 ?auto_309990 ) ( HAVE_IMAGE ?auto_309994 ?auto_309995 ) ( not ( = ?auto_309989 ?auto_309991 ) ) ( not ( = ?auto_309989 ?auto_309992 ) ) ( not ( = ?auto_309989 ?auto_309994 ) ) ( not ( = ?auto_309989 ?auto_309996 ) ) ( not ( = ?auto_309989 ?auto_309999 ) ) ( not ( = ?auto_309990 ?auto_309988 ) ) ( not ( = ?auto_309990 ?auto_309993 ) ) ( not ( = ?auto_309990 ?auto_309995 ) ) ( not ( = ?auto_309991 ?auto_309994 ) ) ( not ( = ?auto_309988 ?auto_309995 ) ) ( not ( = ?auto_309992 ?auto_309994 ) ) ( not ( = ?auto_309993 ?auto_309995 ) ) ( not ( = ?auto_309994 ?auto_309996 ) ) ( not ( = ?auto_309994 ?auto_309999 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309992 ?auto_309993 ?auto_309991 ?auto_309988 )
      ( GET-4IMAGE-VERIFY ?auto_309989 ?auto_309990 ?auto_309991 ?auto_309988 ?auto_309992 ?auto_309993 ?auto_309994 ?auto_309995 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310036 - DIRECTION
      ?auto_310037 - MODE
      ?auto_310038 - DIRECTION
      ?auto_310035 - MODE
      ?auto_310039 - DIRECTION
      ?auto_310040 - MODE
      ?auto_310041 - DIRECTION
      ?auto_310042 - MODE
    )
    :vars
    (
      ?auto_310044 - INSTRUMENT
      ?auto_310047 - SATELLITE
      ?auto_310043 - DIRECTION
      ?auto_310046 - DIRECTION
      ?auto_310045 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_310044 ?auto_310047 ) ( SUPPORTS ?auto_310044 ?auto_310035 ) ( not ( = ?auto_310038 ?auto_310043 ) ) ( HAVE_IMAGE ?auto_310041 ?auto_310042 ) ( not ( = ?auto_310041 ?auto_310038 ) ) ( not ( = ?auto_310041 ?auto_310043 ) ) ( not ( = ?auto_310042 ?auto_310035 ) ) ( CALIBRATION_TARGET ?auto_310044 ?auto_310043 ) ( POINTING ?auto_310047 ?auto_310046 ) ( not ( = ?auto_310043 ?auto_310046 ) ) ( not ( = ?auto_310038 ?auto_310046 ) ) ( not ( = ?auto_310041 ?auto_310046 ) ) ( ON_BOARD ?auto_310045 ?auto_310047 ) ( POWER_ON ?auto_310045 ) ( not ( = ?auto_310044 ?auto_310045 ) ) ( HAVE_IMAGE ?auto_310036 ?auto_310037 ) ( HAVE_IMAGE ?auto_310039 ?auto_310040 ) ( not ( = ?auto_310036 ?auto_310038 ) ) ( not ( = ?auto_310036 ?auto_310039 ) ) ( not ( = ?auto_310036 ?auto_310041 ) ) ( not ( = ?auto_310036 ?auto_310043 ) ) ( not ( = ?auto_310036 ?auto_310046 ) ) ( not ( = ?auto_310037 ?auto_310035 ) ) ( not ( = ?auto_310037 ?auto_310040 ) ) ( not ( = ?auto_310037 ?auto_310042 ) ) ( not ( = ?auto_310038 ?auto_310039 ) ) ( not ( = ?auto_310035 ?auto_310040 ) ) ( not ( = ?auto_310039 ?auto_310041 ) ) ( not ( = ?auto_310039 ?auto_310043 ) ) ( not ( = ?auto_310039 ?auto_310046 ) ) ( not ( = ?auto_310040 ?auto_310042 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310041 ?auto_310042 ?auto_310038 ?auto_310035 )
      ( GET-4IMAGE-VERIFY ?auto_310036 ?auto_310037 ?auto_310038 ?auto_310035 ?auto_310039 ?auto_310040 ?auto_310041 ?auto_310042 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310049 - DIRECTION
      ?auto_310050 - MODE
      ?auto_310051 - DIRECTION
      ?auto_310048 - MODE
      ?auto_310052 - DIRECTION
      ?auto_310053 - MODE
      ?auto_310054 - DIRECTION
      ?auto_310055 - MODE
    )
    :vars
    (
      ?auto_310057 - INSTRUMENT
      ?auto_310062 - SATELLITE
      ?auto_310056 - DIRECTION
      ?auto_310061 - DIRECTION
      ?auto_310059 - MODE
      ?auto_310060 - DIRECTION
      ?auto_310058 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_310057 ?auto_310062 ) ( SUPPORTS ?auto_310057 ?auto_310048 ) ( not ( = ?auto_310051 ?auto_310056 ) ) ( HAVE_IMAGE ?auto_310061 ?auto_310059 ) ( not ( = ?auto_310061 ?auto_310051 ) ) ( not ( = ?auto_310061 ?auto_310056 ) ) ( not ( = ?auto_310059 ?auto_310048 ) ) ( CALIBRATION_TARGET ?auto_310057 ?auto_310056 ) ( POINTING ?auto_310062 ?auto_310060 ) ( not ( = ?auto_310056 ?auto_310060 ) ) ( not ( = ?auto_310051 ?auto_310060 ) ) ( not ( = ?auto_310061 ?auto_310060 ) ) ( ON_BOARD ?auto_310058 ?auto_310062 ) ( POWER_ON ?auto_310058 ) ( not ( = ?auto_310057 ?auto_310058 ) ) ( HAVE_IMAGE ?auto_310049 ?auto_310050 ) ( HAVE_IMAGE ?auto_310052 ?auto_310053 ) ( HAVE_IMAGE ?auto_310054 ?auto_310055 ) ( not ( = ?auto_310049 ?auto_310051 ) ) ( not ( = ?auto_310049 ?auto_310052 ) ) ( not ( = ?auto_310049 ?auto_310054 ) ) ( not ( = ?auto_310049 ?auto_310056 ) ) ( not ( = ?auto_310049 ?auto_310061 ) ) ( not ( = ?auto_310049 ?auto_310060 ) ) ( not ( = ?auto_310050 ?auto_310048 ) ) ( not ( = ?auto_310050 ?auto_310053 ) ) ( not ( = ?auto_310050 ?auto_310055 ) ) ( not ( = ?auto_310050 ?auto_310059 ) ) ( not ( = ?auto_310051 ?auto_310052 ) ) ( not ( = ?auto_310051 ?auto_310054 ) ) ( not ( = ?auto_310048 ?auto_310053 ) ) ( not ( = ?auto_310048 ?auto_310055 ) ) ( not ( = ?auto_310052 ?auto_310054 ) ) ( not ( = ?auto_310052 ?auto_310056 ) ) ( not ( = ?auto_310052 ?auto_310061 ) ) ( not ( = ?auto_310052 ?auto_310060 ) ) ( not ( = ?auto_310053 ?auto_310055 ) ) ( not ( = ?auto_310053 ?auto_310059 ) ) ( not ( = ?auto_310054 ?auto_310056 ) ) ( not ( = ?auto_310054 ?auto_310061 ) ) ( not ( = ?auto_310054 ?auto_310060 ) ) ( not ( = ?auto_310055 ?auto_310059 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310061 ?auto_310059 ?auto_310051 ?auto_310048 )
      ( GET-4IMAGE-VERIFY ?auto_310049 ?auto_310050 ?auto_310051 ?auto_310048 ?auto_310052 ?auto_310053 ?auto_310054 ?auto_310055 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310064 - DIRECTION
      ?auto_310065 - MODE
      ?auto_310066 - DIRECTION
      ?auto_310063 - MODE
      ?auto_310067 - DIRECTION
      ?auto_310068 - MODE
      ?auto_310069 - DIRECTION
      ?auto_310070 - MODE
    )
    :vars
    (
      ?auto_310072 - INSTRUMENT
      ?auto_310076 - SATELLITE
      ?auto_310071 - DIRECTION
      ?auto_310075 - DIRECTION
      ?auto_310074 - MODE
      ?auto_310073 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_310072 ?auto_310076 ) ( SUPPORTS ?auto_310072 ?auto_310063 ) ( not ( = ?auto_310066 ?auto_310071 ) ) ( HAVE_IMAGE ?auto_310075 ?auto_310074 ) ( not ( = ?auto_310075 ?auto_310066 ) ) ( not ( = ?auto_310075 ?auto_310071 ) ) ( not ( = ?auto_310074 ?auto_310063 ) ) ( CALIBRATION_TARGET ?auto_310072 ?auto_310071 ) ( POINTING ?auto_310076 ?auto_310069 ) ( not ( = ?auto_310071 ?auto_310069 ) ) ( not ( = ?auto_310066 ?auto_310069 ) ) ( not ( = ?auto_310075 ?auto_310069 ) ) ( ON_BOARD ?auto_310073 ?auto_310076 ) ( POWER_ON ?auto_310073 ) ( not ( = ?auto_310072 ?auto_310073 ) ) ( HAVE_IMAGE ?auto_310064 ?auto_310065 ) ( HAVE_IMAGE ?auto_310067 ?auto_310068 ) ( HAVE_IMAGE ?auto_310069 ?auto_310070 ) ( not ( = ?auto_310064 ?auto_310066 ) ) ( not ( = ?auto_310064 ?auto_310067 ) ) ( not ( = ?auto_310064 ?auto_310069 ) ) ( not ( = ?auto_310064 ?auto_310071 ) ) ( not ( = ?auto_310064 ?auto_310075 ) ) ( not ( = ?auto_310065 ?auto_310063 ) ) ( not ( = ?auto_310065 ?auto_310068 ) ) ( not ( = ?auto_310065 ?auto_310070 ) ) ( not ( = ?auto_310065 ?auto_310074 ) ) ( not ( = ?auto_310066 ?auto_310067 ) ) ( not ( = ?auto_310063 ?auto_310068 ) ) ( not ( = ?auto_310063 ?auto_310070 ) ) ( not ( = ?auto_310067 ?auto_310069 ) ) ( not ( = ?auto_310067 ?auto_310071 ) ) ( not ( = ?auto_310067 ?auto_310075 ) ) ( not ( = ?auto_310068 ?auto_310070 ) ) ( not ( = ?auto_310068 ?auto_310074 ) ) ( not ( = ?auto_310070 ?auto_310074 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310075 ?auto_310074 ?auto_310066 ?auto_310063 )
      ( GET-4IMAGE-VERIFY ?auto_310064 ?auto_310065 ?auto_310066 ?auto_310063 ?auto_310067 ?auto_310068 ?auto_310069 ?auto_310070 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310200 - DIRECTION
      ?auto_310201 - MODE
      ?auto_310202 - DIRECTION
      ?auto_310199 - MODE
      ?auto_310203 - DIRECTION
      ?auto_310204 - MODE
      ?auto_310205 - DIRECTION
      ?auto_310206 - MODE
    )
    :vars
    (
      ?auto_310208 - INSTRUMENT
      ?auto_310210 - SATELLITE
      ?auto_310207 - DIRECTION
      ?auto_310209 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_310208 ?auto_310210 ) ( SUPPORTS ?auto_310208 ?auto_310206 ) ( not ( = ?auto_310205 ?auto_310207 ) ) ( HAVE_IMAGE ?auto_310202 ?auto_310204 ) ( not ( = ?auto_310202 ?auto_310205 ) ) ( not ( = ?auto_310202 ?auto_310207 ) ) ( not ( = ?auto_310204 ?auto_310206 ) ) ( CALIBRATION_TARGET ?auto_310208 ?auto_310207 ) ( POINTING ?auto_310210 ?auto_310200 ) ( not ( = ?auto_310207 ?auto_310200 ) ) ( not ( = ?auto_310205 ?auto_310200 ) ) ( not ( = ?auto_310202 ?auto_310200 ) ) ( ON_BOARD ?auto_310209 ?auto_310210 ) ( POWER_ON ?auto_310209 ) ( not ( = ?auto_310208 ?auto_310209 ) ) ( HAVE_IMAGE ?auto_310200 ?auto_310201 ) ( HAVE_IMAGE ?auto_310202 ?auto_310199 ) ( HAVE_IMAGE ?auto_310203 ?auto_310204 ) ( not ( = ?auto_310200 ?auto_310203 ) ) ( not ( = ?auto_310201 ?auto_310199 ) ) ( not ( = ?auto_310201 ?auto_310204 ) ) ( not ( = ?auto_310201 ?auto_310206 ) ) ( not ( = ?auto_310202 ?auto_310203 ) ) ( not ( = ?auto_310199 ?auto_310204 ) ) ( not ( = ?auto_310199 ?auto_310206 ) ) ( not ( = ?auto_310203 ?auto_310205 ) ) ( not ( = ?auto_310203 ?auto_310207 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310202 ?auto_310204 ?auto_310205 ?auto_310206 )
      ( GET-4IMAGE-VERIFY ?auto_310200 ?auto_310201 ?auto_310202 ?auto_310199 ?auto_310203 ?auto_310204 ?auto_310205 ?auto_310206 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310292 - DIRECTION
      ?auto_310293 - MODE
      ?auto_310294 - DIRECTION
      ?auto_310291 - MODE
      ?auto_310295 - DIRECTION
      ?auto_310296 - MODE
      ?auto_310297 - DIRECTION
      ?auto_310298 - MODE
    )
    :vars
    (
      ?auto_310300 - INSTRUMENT
      ?auto_310304 - SATELLITE
      ?auto_310299 - DIRECTION
      ?auto_310303 - DIRECTION
      ?auto_310302 - MODE
      ?auto_310301 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_310300 ?auto_310304 ) ( SUPPORTS ?auto_310300 ?auto_310298 ) ( not ( = ?auto_310297 ?auto_310299 ) ) ( HAVE_IMAGE ?auto_310303 ?auto_310302 ) ( not ( = ?auto_310303 ?auto_310297 ) ) ( not ( = ?auto_310303 ?auto_310299 ) ) ( not ( = ?auto_310302 ?auto_310298 ) ) ( CALIBRATION_TARGET ?auto_310300 ?auto_310299 ) ( POINTING ?auto_310304 ?auto_310292 ) ( not ( = ?auto_310299 ?auto_310292 ) ) ( not ( = ?auto_310297 ?auto_310292 ) ) ( not ( = ?auto_310303 ?auto_310292 ) ) ( ON_BOARD ?auto_310301 ?auto_310304 ) ( POWER_ON ?auto_310301 ) ( not ( = ?auto_310300 ?auto_310301 ) ) ( HAVE_IMAGE ?auto_310292 ?auto_310293 ) ( HAVE_IMAGE ?auto_310294 ?auto_310291 ) ( HAVE_IMAGE ?auto_310295 ?auto_310296 ) ( not ( = ?auto_310292 ?auto_310294 ) ) ( not ( = ?auto_310292 ?auto_310295 ) ) ( not ( = ?auto_310293 ?auto_310291 ) ) ( not ( = ?auto_310293 ?auto_310296 ) ) ( not ( = ?auto_310293 ?auto_310298 ) ) ( not ( = ?auto_310293 ?auto_310302 ) ) ( not ( = ?auto_310294 ?auto_310295 ) ) ( not ( = ?auto_310294 ?auto_310297 ) ) ( not ( = ?auto_310294 ?auto_310299 ) ) ( not ( = ?auto_310294 ?auto_310303 ) ) ( not ( = ?auto_310291 ?auto_310296 ) ) ( not ( = ?auto_310291 ?auto_310298 ) ) ( not ( = ?auto_310291 ?auto_310302 ) ) ( not ( = ?auto_310295 ?auto_310297 ) ) ( not ( = ?auto_310295 ?auto_310299 ) ) ( not ( = ?auto_310295 ?auto_310303 ) ) ( not ( = ?auto_310296 ?auto_310298 ) ) ( not ( = ?auto_310296 ?auto_310302 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310303 ?auto_310302 ?auto_310297 ?auto_310298 )
      ( GET-4IMAGE-VERIFY ?auto_310292 ?auto_310293 ?auto_310294 ?auto_310291 ?auto_310295 ?auto_310296 ?auto_310297 ?auto_310298 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310328 - DIRECTION
      ?auto_310329 - MODE
      ?auto_310330 - DIRECTION
      ?auto_310327 - MODE
      ?auto_310331 - DIRECTION
      ?auto_310332 - MODE
      ?auto_310333 - DIRECTION
      ?auto_310334 - MODE
    )
    :vars
    (
      ?auto_310336 - INSTRUMENT
      ?auto_310340 - SATELLITE
      ?auto_310335 - DIRECTION
      ?auto_310339 - DIRECTION
      ?auto_310338 - MODE
      ?auto_310337 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_310336 ?auto_310340 ) ( SUPPORTS ?auto_310336 ?auto_310332 ) ( not ( = ?auto_310331 ?auto_310335 ) ) ( HAVE_IMAGE ?auto_310339 ?auto_310338 ) ( not ( = ?auto_310339 ?auto_310331 ) ) ( not ( = ?auto_310339 ?auto_310335 ) ) ( not ( = ?auto_310338 ?auto_310332 ) ) ( CALIBRATION_TARGET ?auto_310336 ?auto_310335 ) ( POINTING ?auto_310340 ?auto_310328 ) ( not ( = ?auto_310335 ?auto_310328 ) ) ( not ( = ?auto_310331 ?auto_310328 ) ) ( not ( = ?auto_310339 ?auto_310328 ) ) ( ON_BOARD ?auto_310337 ?auto_310340 ) ( POWER_ON ?auto_310337 ) ( not ( = ?auto_310336 ?auto_310337 ) ) ( HAVE_IMAGE ?auto_310328 ?auto_310329 ) ( HAVE_IMAGE ?auto_310330 ?auto_310327 ) ( HAVE_IMAGE ?auto_310333 ?auto_310334 ) ( not ( = ?auto_310328 ?auto_310330 ) ) ( not ( = ?auto_310328 ?auto_310333 ) ) ( not ( = ?auto_310329 ?auto_310327 ) ) ( not ( = ?auto_310329 ?auto_310332 ) ) ( not ( = ?auto_310329 ?auto_310334 ) ) ( not ( = ?auto_310329 ?auto_310338 ) ) ( not ( = ?auto_310330 ?auto_310331 ) ) ( not ( = ?auto_310330 ?auto_310333 ) ) ( not ( = ?auto_310330 ?auto_310335 ) ) ( not ( = ?auto_310330 ?auto_310339 ) ) ( not ( = ?auto_310327 ?auto_310332 ) ) ( not ( = ?auto_310327 ?auto_310334 ) ) ( not ( = ?auto_310327 ?auto_310338 ) ) ( not ( = ?auto_310331 ?auto_310333 ) ) ( not ( = ?auto_310332 ?auto_310334 ) ) ( not ( = ?auto_310333 ?auto_310335 ) ) ( not ( = ?auto_310333 ?auto_310339 ) ) ( not ( = ?auto_310334 ?auto_310338 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310339 ?auto_310338 ?auto_310331 ?auto_310332 )
      ( GET-4IMAGE-VERIFY ?auto_310328 ?auto_310329 ?auto_310330 ?auto_310327 ?auto_310331 ?auto_310332 ?auto_310333 ?auto_310334 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310410 - DIRECTION
      ?auto_310411 - MODE
      ?auto_310412 - DIRECTION
      ?auto_310409 - MODE
      ?auto_310413 - DIRECTION
      ?auto_310414 - MODE
      ?auto_310415 - DIRECTION
      ?auto_310416 - MODE
    )
    :vars
    (
      ?auto_310418 - INSTRUMENT
      ?auto_310420 - SATELLITE
      ?auto_310417 - DIRECTION
      ?auto_310419 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_310418 ?auto_310420 ) ( SUPPORTS ?auto_310418 ?auto_310414 ) ( not ( = ?auto_310413 ?auto_310417 ) ) ( HAVE_IMAGE ?auto_310415 ?auto_310416 ) ( not ( = ?auto_310415 ?auto_310413 ) ) ( not ( = ?auto_310415 ?auto_310417 ) ) ( not ( = ?auto_310416 ?auto_310414 ) ) ( CALIBRATION_TARGET ?auto_310418 ?auto_310417 ) ( POINTING ?auto_310420 ?auto_310412 ) ( not ( = ?auto_310417 ?auto_310412 ) ) ( not ( = ?auto_310413 ?auto_310412 ) ) ( not ( = ?auto_310415 ?auto_310412 ) ) ( ON_BOARD ?auto_310419 ?auto_310420 ) ( POWER_ON ?auto_310419 ) ( not ( = ?auto_310418 ?auto_310419 ) ) ( HAVE_IMAGE ?auto_310410 ?auto_310411 ) ( HAVE_IMAGE ?auto_310412 ?auto_310409 ) ( not ( = ?auto_310410 ?auto_310412 ) ) ( not ( = ?auto_310410 ?auto_310413 ) ) ( not ( = ?auto_310410 ?auto_310415 ) ) ( not ( = ?auto_310410 ?auto_310417 ) ) ( not ( = ?auto_310411 ?auto_310409 ) ) ( not ( = ?auto_310411 ?auto_310414 ) ) ( not ( = ?auto_310411 ?auto_310416 ) ) ( not ( = ?auto_310409 ?auto_310414 ) ) ( not ( = ?auto_310409 ?auto_310416 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310415 ?auto_310416 ?auto_310413 ?auto_310414 )
      ( GET-4IMAGE-VERIFY ?auto_310410 ?auto_310411 ?auto_310412 ?auto_310409 ?auto_310413 ?auto_310414 ?auto_310415 ?auto_310416 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310520 - DIRECTION
      ?auto_310521 - MODE
      ?auto_310522 - DIRECTION
      ?auto_310519 - MODE
      ?auto_310523 - DIRECTION
      ?auto_310524 - MODE
      ?auto_310525 - DIRECTION
      ?auto_310526 - MODE
    )
    :vars
    (
      ?auto_310528 - INSTRUMENT
      ?auto_310532 - SATELLITE
      ?auto_310527 - DIRECTION
      ?auto_310531 - DIRECTION
      ?auto_310530 - MODE
      ?auto_310529 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_310528 ?auto_310532 ) ( SUPPORTS ?auto_310528 ?auto_310519 ) ( not ( = ?auto_310522 ?auto_310527 ) ) ( HAVE_IMAGE ?auto_310531 ?auto_310530 ) ( not ( = ?auto_310531 ?auto_310522 ) ) ( not ( = ?auto_310531 ?auto_310527 ) ) ( not ( = ?auto_310530 ?auto_310519 ) ) ( CALIBRATION_TARGET ?auto_310528 ?auto_310527 ) ( POINTING ?auto_310532 ?auto_310520 ) ( not ( = ?auto_310527 ?auto_310520 ) ) ( not ( = ?auto_310522 ?auto_310520 ) ) ( not ( = ?auto_310531 ?auto_310520 ) ) ( ON_BOARD ?auto_310529 ?auto_310532 ) ( POWER_ON ?auto_310529 ) ( not ( = ?auto_310528 ?auto_310529 ) ) ( HAVE_IMAGE ?auto_310520 ?auto_310521 ) ( HAVE_IMAGE ?auto_310523 ?auto_310524 ) ( HAVE_IMAGE ?auto_310525 ?auto_310526 ) ( not ( = ?auto_310520 ?auto_310523 ) ) ( not ( = ?auto_310520 ?auto_310525 ) ) ( not ( = ?auto_310521 ?auto_310519 ) ) ( not ( = ?auto_310521 ?auto_310524 ) ) ( not ( = ?auto_310521 ?auto_310526 ) ) ( not ( = ?auto_310521 ?auto_310530 ) ) ( not ( = ?auto_310522 ?auto_310523 ) ) ( not ( = ?auto_310522 ?auto_310525 ) ) ( not ( = ?auto_310519 ?auto_310524 ) ) ( not ( = ?auto_310519 ?auto_310526 ) ) ( not ( = ?auto_310523 ?auto_310525 ) ) ( not ( = ?auto_310523 ?auto_310527 ) ) ( not ( = ?auto_310523 ?auto_310531 ) ) ( not ( = ?auto_310524 ?auto_310526 ) ) ( not ( = ?auto_310524 ?auto_310530 ) ) ( not ( = ?auto_310525 ?auto_310527 ) ) ( not ( = ?auto_310525 ?auto_310531 ) ) ( not ( = ?auto_310526 ?auto_310530 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310531 ?auto_310530 ?auto_310522 ?auto_310519 )
      ( GET-4IMAGE-VERIFY ?auto_310520 ?auto_310521 ?auto_310522 ?auto_310519 ?auto_310523 ?auto_310524 ?auto_310525 ?auto_310526 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310562 - DIRECTION
      ?auto_310563 - MODE
      ?auto_310564 - DIRECTION
      ?auto_310561 - MODE
      ?auto_310565 - DIRECTION
      ?auto_310566 - MODE
      ?auto_310567 - DIRECTION
      ?auto_310568 - MODE
    )
    :vars
    (
      ?auto_310570 - INSTRUMENT
      ?auto_310572 - SATELLITE
      ?auto_310569 - DIRECTION
      ?auto_310571 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_310570 ?auto_310572 ) ( SUPPORTS ?auto_310570 ?auto_310561 ) ( not ( = ?auto_310564 ?auto_310569 ) ) ( HAVE_IMAGE ?auto_310567 ?auto_310568 ) ( not ( = ?auto_310567 ?auto_310564 ) ) ( not ( = ?auto_310567 ?auto_310569 ) ) ( not ( = ?auto_310568 ?auto_310561 ) ) ( CALIBRATION_TARGET ?auto_310570 ?auto_310569 ) ( POINTING ?auto_310572 ?auto_310565 ) ( not ( = ?auto_310569 ?auto_310565 ) ) ( not ( = ?auto_310564 ?auto_310565 ) ) ( not ( = ?auto_310567 ?auto_310565 ) ) ( ON_BOARD ?auto_310571 ?auto_310572 ) ( POWER_ON ?auto_310571 ) ( not ( = ?auto_310570 ?auto_310571 ) ) ( HAVE_IMAGE ?auto_310562 ?auto_310563 ) ( HAVE_IMAGE ?auto_310565 ?auto_310566 ) ( not ( = ?auto_310562 ?auto_310564 ) ) ( not ( = ?auto_310562 ?auto_310565 ) ) ( not ( = ?auto_310562 ?auto_310567 ) ) ( not ( = ?auto_310562 ?auto_310569 ) ) ( not ( = ?auto_310563 ?auto_310561 ) ) ( not ( = ?auto_310563 ?auto_310566 ) ) ( not ( = ?auto_310563 ?auto_310568 ) ) ( not ( = ?auto_310561 ?auto_310566 ) ) ( not ( = ?auto_310566 ?auto_310568 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310567 ?auto_310568 ?auto_310564 ?auto_310561 )
      ( GET-4IMAGE-VERIFY ?auto_310562 ?auto_310563 ?auto_310564 ?auto_310561 ?auto_310565 ?auto_310566 ?auto_310567 ?auto_310568 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310670 - DIRECTION
      ?auto_310671 - MODE
      ?auto_310672 - DIRECTION
      ?auto_310669 - MODE
      ?auto_310673 - DIRECTION
      ?auto_310674 - MODE
      ?auto_310675 - DIRECTION
      ?auto_310676 - MODE
    )
    :vars
    (
      ?auto_310678 - INSTRUMENT
      ?auto_310681 - SATELLITE
      ?auto_310677 - DIRECTION
      ?auto_310680 - DIRECTION
      ?auto_310679 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_310678 ?auto_310681 ) ( SUPPORTS ?auto_310678 ?auto_310671 ) ( not ( = ?auto_310670 ?auto_310677 ) ) ( HAVE_IMAGE ?auto_310672 ?auto_310669 ) ( not ( = ?auto_310672 ?auto_310670 ) ) ( not ( = ?auto_310672 ?auto_310677 ) ) ( not ( = ?auto_310669 ?auto_310671 ) ) ( CALIBRATION_TARGET ?auto_310678 ?auto_310677 ) ( POINTING ?auto_310681 ?auto_310680 ) ( not ( = ?auto_310677 ?auto_310680 ) ) ( not ( = ?auto_310670 ?auto_310680 ) ) ( not ( = ?auto_310672 ?auto_310680 ) ) ( ON_BOARD ?auto_310679 ?auto_310681 ) ( POWER_ON ?auto_310679 ) ( not ( = ?auto_310678 ?auto_310679 ) ) ( HAVE_IMAGE ?auto_310673 ?auto_310674 ) ( HAVE_IMAGE ?auto_310675 ?auto_310676 ) ( not ( = ?auto_310670 ?auto_310673 ) ) ( not ( = ?auto_310670 ?auto_310675 ) ) ( not ( = ?auto_310671 ?auto_310674 ) ) ( not ( = ?auto_310671 ?auto_310676 ) ) ( not ( = ?auto_310672 ?auto_310673 ) ) ( not ( = ?auto_310672 ?auto_310675 ) ) ( not ( = ?auto_310669 ?auto_310674 ) ) ( not ( = ?auto_310669 ?auto_310676 ) ) ( not ( = ?auto_310673 ?auto_310675 ) ) ( not ( = ?auto_310673 ?auto_310677 ) ) ( not ( = ?auto_310673 ?auto_310680 ) ) ( not ( = ?auto_310674 ?auto_310676 ) ) ( not ( = ?auto_310675 ?auto_310677 ) ) ( not ( = ?auto_310675 ?auto_310680 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310672 ?auto_310669 ?auto_310670 ?auto_310671 )
      ( GET-4IMAGE-VERIFY ?auto_310670 ?auto_310671 ?auto_310672 ?auto_310669 ?auto_310673 ?auto_310674 ?auto_310675 ?auto_310676 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310683 - DIRECTION
      ?auto_310684 - MODE
      ?auto_310685 - DIRECTION
      ?auto_310682 - MODE
      ?auto_310686 - DIRECTION
      ?auto_310687 - MODE
      ?auto_310688 - DIRECTION
      ?auto_310689 - MODE
    )
    :vars
    (
      ?auto_310691 - INSTRUMENT
      ?auto_310694 - SATELLITE
      ?auto_310690 - DIRECTION
      ?auto_310693 - DIRECTION
      ?auto_310692 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_310691 ?auto_310694 ) ( SUPPORTS ?auto_310691 ?auto_310684 ) ( not ( = ?auto_310683 ?auto_310690 ) ) ( HAVE_IMAGE ?auto_310686 ?auto_310687 ) ( not ( = ?auto_310686 ?auto_310683 ) ) ( not ( = ?auto_310686 ?auto_310690 ) ) ( not ( = ?auto_310687 ?auto_310684 ) ) ( CALIBRATION_TARGET ?auto_310691 ?auto_310690 ) ( POINTING ?auto_310694 ?auto_310693 ) ( not ( = ?auto_310690 ?auto_310693 ) ) ( not ( = ?auto_310683 ?auto_310693 ) ) ( not ( = ?auto_310686 ?auto_310693 ) ) ( ON_BOARD ?auto_310692 ?auto_310694 ) ( POWER_ON ?auto_310692 ) ( not ( = ?auto_310691 ?auto_310692 ) ) ( HAVE_IMAGE ?auto_310685 ?auto_310682 ) ( HAVE_IMAGE ?auto_310688 ?auto_310689 ) ( not ( = ?auto_310683 ?auto_310685 ) ) ( not ( = ?auto_310683 ?auto_310688 ) ) ( not ( = ?auto_310684 ?auto_310682 ) ) ( not ( = ?auto_310684 ?auto_310689 ) ) ( not ( = ?auto_310685 ?auto_310686 ) ) ( not ( = ?auto_310685 ?auto_310688 ) ) ( not ( = ?auto_310685 ?auto_310690 ) ) ( not ( = ?auto_310685 ?auto_310693 ) ) ( not ( = ?auto_310682 ?auto_310687 ) ) ( not ( = ?auto_310682 ?auto_310689 ) ) ( not ( = ?auto_310686 ?auto_310688 ) ) ( not ( = ?auto_310687 ?auto_310689 ) ) ( not ( = ?auto_310688 ?auto_310690 ) ) ( not ( = ?auto_310688 ?auto_310693 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310686 ?auto_310687 ?auto_310683 ?auto_310684 )
      ( GET-4IMAGE-VERIFY ?auto_310683 ?auto_310684 ?auto_310685 ?auto_310682 ?auto_310686 ?auto_310687 ?auto_310688 ?auto_310689 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310788 - DIRECTION
      ?auto_310789 - MODE
      ?auto_310790 - DIRECTION
      ?auto_310787 - MODE
      ?auto_310791 - DIRECTION
      ?auto_310792 - MODE
      ?auto_310793 - DIRECTION
      ?auto_310794 - MODE
    )
    :vars
    (
      ?auto_310796 - INSTRUMENT
      ?auto_310798 - SATELLITE
      ?auto_310795 - DIRECTION
      ?auto_310797 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_310796 ?auto_310798 ) ( SUPPORTS ?auto_310796 ?auto_310789 ) ( not ( = ?auto_310788 ?auto_310795 ) ) ( HAVE_IMAGE ?auto_310790 ?auto_310787 ) ( not ( = ?auto_310790 ?auto_310788 ) ) ( not ( = ?auto_310790 ?auto_310795 ) ) ( not ( = ?auto_310787 ?auto_310789 ) ) ( CALIBRATION_TARGET ?auto_310796 ?auto_310795 ) ( POINTING ?auto_310798 ?auto_310793 ) ( not ( = ?auto_310795 ?auto_310793 ) ) ( not ( = ?auto_310788 ?auto_310793 ) ) ( not ( = ?auto_310790 ?auto_310793 ) ) ( ON_BOARD ?auto_310797 ?auto_310798 ) ( POWER_ON ?auto_310797 ) ( not ( = ?auto_310796 ?auto_310797 ) ) ( HAVE_IMAGE ?auto_310791 ?auto_310792 ) ( HAVE_IMAGE ?auto_310793 ?auto_310794 ) ( not ( = ?auto_310788 ?auto_310791 ) ) ( not ( = ?auto_310789 ?auto_310792 ) ) ( not ( = ?auto_310789 ?auto_310794 ) ) ( not ( = ?auto_310790 ?auto_310791 ) ) ( not ( = ?auto_310787 ?auto_310792 ) ) ( not ( = ?auto_310787 ?auto_310794 ) ) ( not ( = ?auto_310791 ?auto_310793 ) ) ( not ( = ?auto_310791 ?auto_310795 ) ) ( not ( = ?auto_310792 ?auto_310794 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310790 ?auto_310787 ?auto_310788 ?auto_310789 )
      ( GET-4IMAGE-VERIFY ?auto_310788 ?auto_310789 ?auto_310790 ?auto_310787 ?auto_310791 ?auto_310792 ?auto_310793 ?auto_310794 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310863 - DIRECTION
      ?auto_310864 - MODE
      ?auto_310865 - DIRECTION
      ?auto_310862 - MODE
      ?auto_310866 - DIRECTION
      ?auto_310867 - MODE
      ?auto_310868 - DIRECTION
      ?auto_310869 - MODE
    )
    :vars
    (
      ?auto_310871 - INSTRUMENT
      ?auto_310874 - SATELLITE
      ?auto_310870 - DIRECTION
      ?auto_310873 - DIRECTION
      ?auto_310872 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_310871 ?auto_310874 ) ( SUPPORTS ?auto_310871 ?auto_310864 ) ( not ( = ?auto_310863 ?auto_310870 ) ) ( HAVE_IMAGE ?auto_310868 ?auto_310869 ) ( not ( = ?auto_310868 ?auto_310863 ) ) ( not ( = ?auto_310868 ?auto_310870 ) ) ( not ( = ?auto_310869 ?auto_310864 ) ) ( CALIBRATION_TARGET ?auto_310871 ?auto_310870 ) ( POINTING ?auto_310874 ?auto_310873 ) ( not ( = ?auto_310870 ?auto_310873 ) ) ( not ( = ?auto_310863 ?auto_310873 ) ) ( not ( = ?auto_310868 ?auto_310873 ) ) ( ON_BOARD ?auto_310872 ?auto_310874 ) ( POWER_ON ?auto_310872 ) ( not ( = ?auto_310871 ?auto_310872 ) ) ( HAVE_IMAGE ?auto_310865 ?auto_310862 ) ( HAVE_IMAGE ?auto_310866 ?auto_310867 ) ( not ( = ?auto_310863 ?auto_310865 ) ) ( not ( = ?auto_310863 ?auto_310866 ) ) ( not ( = ?auto_310864 ?auto_310862 ) ) ( not ( = ?auto_310864 ?auto_310867 ) ) ( not ( = ?auto_310865 ?auto_310866 ) ) ( not ( = ?auto_310865 ?auto_310868 ) ) ( not ( = ?auto_310865 ?auto_310870 ) ) ( not ( = ?auto_310865 ?auto_310873 ) ) ( not ( = ?auto_310862 ?auto_310867 ) ) ( not ( = ?auto_310862 ?auto_310869 ) ) ( not ( = ?auto_310866 ?auto_310868 ) ) ( not ( = ?auto_310866 ?auto_310870 ) ) ( not ( = ?auto_310866 ?auto_310873 ) ) ( not ( = ?auto_310867 ?auto_310869 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310868 ?auto_310869 ?auto_310863 ?auto_310864 )
      ( GET-4IMAGE-VERIFY ?auto_310863 ?auto_310864 ?auto_310865 ?auto_310862 ?auto_310866 ?auto_310867 ?auto_310868 ?auto_310869 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310923 - DIRECTION
      ?auto_310924 - MODE
      ?auto_310925 - DIRECTION
      ?auto_310922 - MODE
      ?auto_310926 - DIRECTION
      ?auto_310927 - MODE
      ?auto_310928 - DIRECTION
      ?auto_310929 - MODE
    )
    :vars
    (
      ?auto_310931 - INSTRUMENT
      ?auto_310936 - SATELLITE
      ?auto_310930 - DIRECTION
      ?auto_310935 - DIRECTION
      ?auto_310933 - MODE
      ?auto_310934 - DIRECTION
      ?auto_310932 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_310931 ?auto_310936 ) ( SUPPORTS ?auto_310931 ?auto_310924 ) ( not ( = ?auto_310923 ?auto_310930 ) ) ( HAVE_IMAGE ?auto_310935 ?auto_310933 ) ( not ( = ?auto_310935 ?auto_310923 ) ) ( not ( = ?auto_310935 ?auto_310930 ) ) ( not ( = ?auto_310933 ?auto_310924 ) ) ( CALIBRATION_TARGET ?auto_310931 ?auto_310930 ) ( POINTING ?auto_310936 ?auto_310934 ) ( not ( = ?auto_310930 ?auto_310934 ) ) ( not ( = ?auto_310923 ?auto_310934 ) ) ( not ( = ?auto_310935 ?auto_310934 ) ) ( ON_BOARD ?auto_310932 ?auto_310936 ) ( POWER_ON ?auto_310932 ) ( not ( = ?auto_310931 ?auto_310932 ) ) ( HAVE_IMAGE ?auto_310925 ?auto_310922 ) ( HAVE_IMAGE ?auto_310926 ?auto_310927 ) ( HAVE_IMAGE ?auto_310928 ?auto_310929 ) ( not ( = ?auto_310923 ?auto_310925 ) ) ( not ( = ?auto_310923 ?auto_310926 ) ) ( not ( = ?auto_310923 ?auto_310928 ) ) ( not ( = ?auto_310924 ?auto_310922 ) ) ( not ( = ?auto_310924 ?auto_310927 ) ) ( not ( = ?auto_310924 ?auto_310929 ) ) ( not ( = ?auto_310925 ?auto_310926 ) ) ( not ( = ?auto_310925 ?auto_310928 ) ) ( not ( = ?auto_310925 ?auto_310930 ) ) ( not ( = ?auto_310925 ?auto_310935 ) ) ( not ( = ?auto_310925 ?auto_310934 ) ) ( not ( = ?auto_310922 ?auto_310927 ) ) ( not ( = ?auto_310922 ?auto_310929 ) ) ( not ( = ?auto_310922 ?auto_310933 ) ) ( not ( = ?auto_310926 ?auto_310928 ) ) ( not ( = ?auto_310926 ?auto_310930 ) ) ( not ( = ?auto_310926 ?auto_310935 ) ) ( not ( = ?auto_310926 ?auto_310934 ) ) ( not ( = ?auto_310927 ?auto_310929 ) ) ( not ( = ?auto_310927 ?auto_310933 ) ) ( not ( = ?auto_310928 ?auto_310930 ) ) ( not ( = ?auto_310928 ?auto_310935 ) ) ( not ( = ?auto_310928 ?auto_310934 ) ) ( not ( = ?auto_310929 ?auto_310933 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310935 ?auto_310933 ?auto_310923 ?auto_310924 )
      ( GET-4IMAGE-VERIFY ?auto_310923 ?auto_310924 ?auto_310925 ?auto_310922 ?auto_310926 ?auto_310927 ?auto_310928 ?auto_310929 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310938 - DIRECTION
      ?auto_310939 - MODE
      ?auto_310940 - DIRECTION
      ?auto_310937 - MODE
      ?auto_310941 - DIRECTION
      ?auto_310942 - MODE
      ?auto_310943 - DIRECTION
      ?auto_310944 - MODE
    )
    :vars
    (
      ?auto_310946 - INSTRUMENT
      ?auto_310950 - SATELLITE
      ?auto_310945 - DIRECTION
      ?auto_310949 - DIRECTION
      ?auto_310948 - MODE
      ?auto_310947 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_310946 ?auto_310950 ) ( SUPPORTS ?auto_310946 ?auto_310939 ) ( not ( = ?auto_310938 ?auto_310945 ) ) ( HAVE_IMAGE ?auto_310949 ?auto_310948 ) ( not ( = ?auto_310949 ?auto_310938 ) ) ( not ( = ?auto_310949 ?auto_310945 ) ) ( not ( = ?auto_310948 ?auto_310939 ) ) ( CALIBRATION_TARGET ?auto_310946 ?auto_310945 ) ( POINTING ?auto_310950 ?auto_310943 ) ( not ( = ?auto_310945 ?auto_310943 ) ) ( not ( = ?auto_310938 ?auto_310943 ) ) ( not ( = ?auto_310949 ?auto_310943 ) ) ( ON_BOARD ?auto_310947 ?auto_310950 ) ( POWER_ON ?auto_310947 ) ( not ( = ?auto_310946 ?auto_310947 ) ) ( HAVE_IMAGE ?auto_310940 ?auto_310937 ) ( HAVE_IMAGE ?auto_310941 ?auto_310942 ) ( HAVE_IMAGE ?auto_310943 ?auto_310944 ) ( not ( = ?auto_310938 ?auto_310940 ) ) ( not ( = ?auto_310938 ?auto_310941 ) ) ( not ( = ?auto_310939 ?auto_310937 ) ) ( not ( = ?auto_310939 ?auto_310942 ) ) ( not ( = ?auto_310939 ?auto_310944 ) ) ( not ( = ?auto_310940 ?auto_310941 ) ) ( not ( = ?auto_310940 ?auto_310943 ) ) ( not ( = ?auto_310940 ?auto_310945 ) ) ( not ( = ?auto_310940 ?auto_310949 ) ) ( not ( = ?auto_310937 ?auto_310942 ) ) ( not ( = ?auto_310937 ?auto_310944 ) ) ( not ( = ?auto_310937 ?auto_310948 ) ) ( not ( = ?auto_310941 ?auto_310943 ) ) ( not ( = ?auto_310941 ?auto_310945 ) ) ( not ( = ?auto_310941 ?auto_310949 ) ) ( not ( = ?auto_310942 ?auto_310944 ) ) ( not ( = ?auto_310942 ?auto_310948 ) ) ( not ( = ?auto_310944 ?auto_310948 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310949 ?auto_310948 ?auto_310938 ?auto_310939 )
      ( GET-4IMAGE-VERIFY ?auto_310938 ?auto_310939 ?auto_310940 ?auto_310937 ?auto_310941 ?auto_310942 ?auto_310943 ?auto_310944 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_311126 - DIRECTION
      ?auto_311127 - MODE
      ?auto_311128 - DIRECTION
      ?auto_311125 - MODE
      ?auto_311129 - DIRECTION
      ?auto_311130 - MODE
      ?auto_311131 - DIRECTION
      ?auto_311132 - MODE
    )
    :vars
    (
      ?auto_311134 - INSTRUMENT
      ?auto_311138 - SATELLITE
      ?auto_311133 - DIRECTION
      ?auto_311137 - DIRECTION
      ?auto_311136 - MODE
      ?auto_311135 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_311134 ?auto_311138 ) ( SUPPORTS ?auto_311134 ?auto_311127 ) ( not ( = ?auto_311126 ?auto_311133 ) ) ( HAVE_IMAGE ?auto_311137 ?auto_311136 ) ( not ( = ?auto_311137 ?auto_311126 ) ) ( not ( = ?auto_311137 ?auto_311133 ) ) ( not ( = ?auto_311136 ?auto_311127 ) ) ( CALIBRATION_TARGET ?auto_311134 ?auto_311133 ) ( POINTING ?auto_311138 ?auto_311128 ) ( not ( = ?auto_311133 ?auto_311128 ) ) ( not ( = ?auto_311126 ?auto_311128 ) ) ( not ( = ?auto_311137 ?auto_311128 ) ) ( ON_BOARD ?auto_311135 ?auto_311138 ) ( POWER_ON ?auto_311135 ) ( not ( = ?auto_311134 ?auto_311135 ) ) ( HAVE_IMAGE ?auto_311128 ?auto_311125 ) ( HAVE_IMAGE ?auto_311129 ?auto_311130 ) ( HAVE_IMAGE ?auto_311131 ?auto_311132 ) ( not ( = ?auto_311126 ?auto_311129 ) ) ( not ( = ?auto_311126 ?auto_311131 ) ) ( not ( = ?auto_311127 ?auto_311125 ) ) ( not ( = ?auto_311127 ?auto_311130 ) ) ( not ( = ?auto_311127 ?auto_311132 ) ) ( not ( = ?auto_311128 ?auto_311129 ) ) ( not ( = ?auto_311128 ?auto_311131 ) ) ( not ( = ?auto_311125 ?auto_311130 ) ) ( not ( = ?auto_311125 ?auto_311132 ) ) ( not ( = ?auto_311125 ?auto_311136 ) ) ( not ( = ?auto_311129 ?auto_311131 ) ) ( not ( = ?auto_311129 ?auto_311133 ) ) ( not ( = ?auto_311129 ?auto_311137 ) ) ( not ( = ?auto_311130 ?auto_311132 ) ) ( not ( = ?auto_311130 ?auto_311136 ) ) ( not ( = ?auto_311131 ?auto_311133 ) ) ( not ( = ?auto_311131 ?auto_311137 ) ) ( not ( = ?auto_311132 ?auto_311136 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_311137 ?auto_311136 ?auto_311126 ?auto_311127 )
      ( GET-4IMAGE-VERIFY ?auto_311126 ?auto_311127 ?auto_311128 ?auto_311125 ?auto_311129 ?auto_311130 ?auto_311131 ?auto_311132 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_311168 - DIRECTION
      ?auto_311169 - MODE
      ?auto_311170 - DIRECTION
      ?auto_311167 - MODE
      ?auto_311171 - DIRECTION
      ?auto_311172 - MODE
      ?auto_311173 - DIRECTION
      ?auto_311174 - MODE
    )
    :vars
    (
      ?auto_311176 - INSTRUMENT
      ?auto_311178 - SATELLITE
      ?auto_311175 - DIRECTION
      ?auto_311177 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_311176 ?auto_311178 ) ( SUPPORTS ?auto_311176 ?auto_311169 ) ( not ( = ?auto_311168 ?auto_311175 ) ) ( HAVE_IMAGE ?auto_311173 ?auto_311174 ) ( not ( = ?auto_311173 ?auto_311168 ) ) ( not ( = ?auto_311173 ?auto_311175 ) ) ( not ( = ?auto_311174 ?auto_311169 ) ) ( CALIBRATION_TARGET ?auto_311176 ?auto_311175 ) ( POINTING ?auto_311178 ?auto_311170 ) ( not ( = ?auto_311175 ?auto_311170 ) ) ( not ( = ?auto_311168 ?auto_311170 ) ) ( not ( = ?auto_311173 ?auto_311170 ) ) ( ON_BOARD ?auto_311177 ?auto_311178 ) ( POWER_ON ?auto_311177 ) ( not ( = ?auto_311176 ?auto_311177 ) ) ( HAVE_IMAGE ?auto_311170 ?auto_311167 ) ( HAVE_IMAGE ?auto_311171 ?auto_311172 ) ( not ( = ?auto_311168 ?auto_311171 ) ) ( not ( = ?auto_311169 ?auto_311167 ) ) ( not ( = ?auto_311169 ?auto_311172 ) ) ( not ( = ?auto_311170 ?auto_311171 ) ) ( not ( = ?auto_311167 ?auto_311172 ) ) ( not ( = ?auto_311167 ?auto_311174 ) ) ( not ( = ?auto_311171 ?auto_311173 ) ) ( not ( = ?auto_311171 ?auto_311175 ) ) ( not ( = ?auto_311172 ?auto_311174 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_311173 ?auto_311174 ?auto_311168 ?auto_311169 )
      ( GET-4IMAGE-VERIFY ?auto_311168 ?auto_311169 ?auto_311170 ?auto_311167 ?auto_311171 ?auto_311172 ?auto_311173 ?auto_311174 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_311764 - DIRECTION
      ?auto_311765 - MODE
      ?auto_311766 - DIRECTION
      ?auto_311763 - MODE
      ?auto_311767 - DIRECTION
      ?auto_311768 - MODE
    )
    :vars
    (
      ?auto_311769 - INSTRUMENT
      ?auto_311771 - SATELLITE
      ?auto_311772 - DIRECTION
      ?auto_311773 - DIRECTION
      ?auto_311770 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_311769 ?auto_311771 ) ( SUPPORTS ?auto_311769 ?auto_311765 ) ( not ( = ?auto_311764 ?auto_311772 ) ) ( HAVE_IMAGE ?auto_311767 ?auto_311768 ) ( not ( = ?auto_311767 ?auto_311764 ) ) ( not ( = ?auto_311767 ?auto_311772 ) ) ( not ( = ?auto_311768 ?auto_311765 ) ) ( CALIBRATION_TARGET ?auto_311769 ?auto_311772 ) ( POINTING ?auto_311771 ?auto_311773 ) ( not ( = ?auto_311772 ?auto_311773 ) ) ( not ( = ?auto_311764 ?auto_311773 ) ) ( not ( = ?auto_311767 ?auto_311773 ) ) ( ON_BOARD ?auto_311770 ?auto_311771 ) ( POWER_ON ?auto_311770 ) ( not ( = ?auto_311769 ?auto_311770 ) ) ( HAVE_IMAGE ?auto_311766 ?auto_311763 ) ( not ( = ?auto_311764 ?auto_311766 ) ) ( not ( = ?auto_311765 ?auto_311763 ) ) ( not ( = ?auto_311766 ?auto_311767 ) ) ( not ( = ?auto_311766 ?auto_311772 ) ) ( not ( = ?auto_311766 ?auto_311773 ) ) ( not ( = ?auto_311763 ?auto_311768 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_311767 ?auto_311768 ?auto_311764 ?auto_311765 )
      ( GET-3IMAGE-VERIFY ?auto_311764 ?auto_311765 ?auto_311766 ?auto_311763 ?auto_311767 ?auto_311768 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_312686 - DIRECTION
      ?auto_312687 - MODE
      ?auto_312688 - DIRECTION
      ?auto_312685 - MODE
      ?auto_312689 - DIRECTION
      ?auto_312690 - MODE
      ?auto_312691 - DIRECTION
      ?auto_312692 - MODE
    )
    :vars
    (
      ?auto_312693 - INSTRUMENT
      ?auto_312695 - SATELLITE
      ?auto_312696 - DIRECTION
      ?auto_312697 - DIRECTION
      ?auto_312694 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_312693 ?auto_312695 ) ( SUPPORTS ?auto_312693 ?auto_312685 ) ( not ( = ?auto_312688 ?auto_312696 ) ) ( HAVE_IMAGE ?auto_312691 ?auto_312690 ) ( not ( = ?auto_312691 ?auto_312688 ) ) ( not ( = ?auto_312691 ?auto_312696 ) ) ( not ( = ?auto_312690 ?auto_312685 ) ) ( CALIBRATION_TARGET ?auto_312693 ?auto_312696 ) ( POINTING ?auto_312695 ?auto_312697 ) ( not ( = ?auto_312696 ?auto_312697 ) ) ( not ( = ?auto_312688 ?auto_312697 ) ) ( not ( = ?auto_312691 ?auto_312697 ) ) ( ON_BOARD ?auto_312694 ?auto_312695 ) ( POWER_ON ?auto_312694 ) ( not ( = ?auto_312693 ?auto_312694 ) ) ( HAVE_IMAGE ?auto_312686 ?auto_312687 ) ( HAVE_IMAGE ?auto_312689 ?auto_312690 ) ( HAVE_IMAGE ?auto_312691 ?auto_312692 ) ( not ( = ?auto_312686 ?auto_312688 ) ) ( not ( = ?auto_312686 ?auto_312689 ) ) ( not ( = ?auto_312686 ?auto_312691 ) ) ( not ( = ?auto_312686 ?auto_312696 ) ) ( not ( = ?auto_312686 ?auto_312697 ) ) ( not ( = ?auto_312687 ?auto_312685 ) ) ( not ( = ?auto_312687 ?auto_312690 ) ) ( not ( = ?auto_312687 ?auto_312692 ) ) ( not ( = ?auto_312688 ?auto_312689 ) ) ( not ( = ?auto_312685 ?auto_312692 ) ) ( not ( = ?auto_312689 ?auto_312691 ) ) ( not ( = ?auto_312689 ?auto_312696 ) ) ( not ( = ?auto_312689 ?auto_312697 ) ) ( not ( = ?auto_312690 ?auto_312692 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_312691 ?auto_312690 ?auto_312688 ?auto_312685 )
      ( GET-4IMAGE-VERIFY ?auto_312686 ?auto_312687 ?auto_312688 ?auto_312685 ?auto_312689 ?auto_312690 ?auto_312691 ?auto_312692 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_317118 - DIRECTION
      ?auto_317119 - MODE
      ?auto_317120 - DIRECTION
      ?auto_317117 - MODE
      ?auto_317121 - DIRECTION
      ?auto_317122 - MODE
    )
    :vars
    (
      ?auto_317124 - INSTRUMENT
      ?auto_317126 - SATELLITE
      ?auto_317125 - DIRECTION
      ?auto_317123 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317124 ?auto_317126 ) ( SUPPORTS ?auto_317124 ?auto_317117 ) ( not ( = ?auto_317120 ?auto_317125 ) ) ( HAVE_IMAGE ?auto_317118 ?auto_317119 ) ( not ( = ?auto_317118 ?auto_317120 ) ) ( not ( = ?auto_317118 ?auto_317125 ) ) ( not ( = ?auto_317119 ?auto_317117 ) ) ( CALIBRATION_TARGET ?auto_317124 ?auto_317125 ) ( not ( = ?auto_317125 ?auto_317121 ) ) ( not ( = ?auto_317120 ?auto_317121 ) ) ( not ( = ?auto_317118 ?auto_317121 ) ) ( ON_BOARD ?auto_317123 ?auto_317126 ) ( POWER_ON ?auto_317123 ) ( not ( = ?auto_317124 ?auto_317123 ) ) ( POINTING ?auto_317126 ?auto_317125 ) ( HAVE_IMAGE ?auto_317121 ?auto_317122 ) ( not ( = ?auto_317119 ?auto_317122 ) ) ( not ( = ?auto_317117 ?auto_317122 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317118 ?auto_317119 ?auto_317120 ?auto_317117 )
      ( GET-3IMAGE-VERIFY ?auto_317118 ?auto_317119 ?auto_317120 ?auto_317117 ?auto_317121 ?auto_317122 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_314377 - DIRECTION
      ?auto_314378 - MODE
      ?auto_314379 - DIRECTION
      ?auto_314376 - MODE
      ?auto_314380 - DIRECTION
      ?auto_314381 - MODE
    )
    :vars
    (
      ?auto_314383 - INSTRUMENT
      ?auto_314385 - SATELLITE
      ?auto_314382 - DIRECTION
      ?auto_314386 - DIRECTION
      ?auto_314384 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_314383 ?auto_314385 ) ( SUPPORTS ?auto_314383 ?auto_314381 ) ( not ( = ?auto_314380 ?auto_314382 ) ) ( HAVE_IMAGE ?auto_314379 ?auto_314376 ) ( not ( = ?auto_314379 ?auto_314380 ) ) ( not ( = ?auto_314379 ?auto_314382 ) ) ( not ( = ?auto_314376 ?auto_314381 ) ) ( CALIBRATION_TARGET ?auto_314383 ?auto_314382 ) ( not ( = ?auto_314382 ?auto_314386 ) ) ( not ( = ?auto_314380 ?auto_314386 ) ) ( not ( = ?auto_314379 ?auto_314386 ) ) ( ON_BOARD ?auto_314384 ?auto_314385 ) ( POWER_ON ?auto_314384 ) ( not ( = ?auto_314383 ?auto_314384 ) ) ( POINTING ?auto_314385 ?auto_314382 ) ( HAVE_IMAGE ?auto_314377 ?auto_314378 ) ( not ( = ?auto_314377 ?auto_314379 ) ) ( not ( = ?auto_314377 ?auto_314380 ) ) ( not ( = ?auto_314377 ?auto_314382 ) ) ( not ( = ?auto_314377 ?auto_314386 ) ) ( not ( = ?auto_314378 ?auto_314376 ) ) ( not ( = ?auto_314378 ?auto_314381 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_314379 ?auto_314376 ?auto_314380 ?auto_314381 )
      ( GET-3IMAGE-VERIFY ?auto_314377 ?auto_314378 ?auto_314379 ?auto_314376 ?auto_314380 ?auto_314381 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_317156 - DIRECTION
      ?auto_317157 - MODE
      ?auto_317158 - DIRECTION
      ?auto_317155 - MODE
      ?auto_317159 - DIRECTION
      ?auto_317160 - MODE
    )
    :vars
    (
      ?auto_317162 - INSTRUMENT
      ?auto_317165 - SATELLITE
      ?auto_317163 - DIRECTION
      ?auto_317164 - DIRECTION
      ?auto_317166 - MODE
      ?auto_317161 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317162 ?auto_317165 ) ( SUPPORTS ?auto_317162 ?auto_317160 ) ( not ( = ?auto_317159 ?auto_317163 ) ) ( HAVE_IMAGE ?auto_317164 ?auto_317166 ) ( not ( = ?auto_317164 ?auto_317159 ) ) ( not ( = ?auto_317164 ?auto_317163 ) ) ( not ( = ?auto_317166 ?auto_317160 ) ) ( CALIBRATION_TARGET ?auto_317162 ?auto_317163 ) ( not ( = ?auto_317163 ?auto_317156 ) ) ( not ( = ?auto_317159 ?auto_317156 ) ) ( not ( = ?auto_317164 ?auto_317156 ) ) ( ON_BOARD ?auto_317161 ?auto_317165 ) ( POWER_ON ?auto_317161 ) ( not ( = ?auto_317162 ?auto_317161 ) ) ( POINTING ?auto_317165 ?auto_317163 ) ( HAVE_IMAGE ?auto_317156 ?auto_317157 ) ( HAVE_IMAGE ?auto_317158 ?auto_317155 ) ( not ( = ?auto_317156 ?auto_317158 ) ) ( not ( = ?auto_317157 ?auto_317155 ) ) ( not ( = ?auto_317157 ?auto_317160 ) ) ( not ( = ?auto_317157 ?auto_317166 ) ) ( not ( = ?auto_317158 ?auto_317159 ) ) ( not ( = ?auto_317158 ?auto_317163 ) ) ( not ( = ?auto_317158 ?auto_317164 ) ) ( not ( = ?auto_317155 ?auto_317160 ) ) ( not ( = ?auto_317155 ?auto_317166 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317164 ?auto_317166 ?auto_317159 ?auto_317160 )
      ( GET-3IMAGE-VERIFY ?auto_317156 ?auto_317157 ?auto_317158 ?auto_317155 ?auto_317159 ?auto_317160 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_314413 - DIRECTION
      ?auto_314414 - MODE
      ?auto_314415 - DIRECTION
      ?auto_314412 - MODE
      ?auto_314416 - DIRECTION
      ?auto_314417 - MODE
    )
    :vars
    (
      ?auto_314419 - INSTRUMENT
      ?auto_314421 - SATELLITE
      ?auto_314418 - DIRECTION
      ?auto_314422 - DIRECTION
      ?auto_314420 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_314419 ?auto_314421 ) ( SUPPORTS ?auto_314419 ?auto_314412 ) ( not ( = ?auto_314415 ?auto_314418 ) ) ( HAVE_IMAGE ?auto_314416 ?auto_314417 ) ( not ( = ?auto_314416 ?auto_314415 ) ) ( not ( = ?auto_314416 ?auto_314418 ) ) ( not ( = ?auto_314417 ?auto_314412 ) ) ( CALIBRATION_TARGET ?auto_314419 ?auto_314418 ) ( not ( = ?auto_314418 ?auto_314422 ) ) ( not ( = ?auto_314415 ?auto_314422 ) ) ( not ( = ?auto_314416 ?auto_314422 ) ) ( ON_BOARD ?auto_314420 ?auto_314421 ) ( POWER_ON ?auto_314420 ) ( not ( = ?auto_314419 ?auto_314420 ) ) ( POINTING ?auto_314421 ?auto_314418 ) ( HAVE_IMAGE ?auto_314413 ?auto_314414 ) ( not ( = ?auto_314413 ?auto_314415 ) ) ( not ( = ?auto_314413 ?auto_314416 ) ) ( not ( = ?auto_314413 ?auto_314418 ) ) ( not ( = ?auto_314413 ?auto_314422 ) ) ( not ( = ?auto_314414 ?auto_314412 ) ) ( not ( = ?auto_314414 ?auto_314417 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_314416 ?auto_314417 ?auto_314415 ?auto_314412 )
      ( GET-3IMAGE-VERIFY ?auto_314413 ?auto_314414 ?auto_314415 ?auto_314412 ?auto_314416 ?auto_314417 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_317186 - DIRECTION
      ?auto_317187 - MODE
      ?auto_317188 - DIRECTION
      ?auto_317185 - MODE
      ?auto_317189 - DIRECTION
      ?auto_317190 - MODE
    )
    :vars
    (
      ?auto_317192 - INSTRUMENT
      ?auto_317195 - SATELLITE
      ?auto_317193 - DIRECTION
      ?auto_317194 - DIRECTION
      ?auto_317196 - MODE
      ?auto_317191 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317192 ?auto_317195 ) ( SUPPORTS ?auto_317192 ?auto_317185 ) ( not ( = ?auto_317188 ?auto_317193 ) ) ( HAVE_IMAGE ?auto_317194 ?auto_317196 ) ( not ( = ?auto_317194 ?auto_317188 ) ) ( not ( = ?auto_317194 ?auto_317193 ) ) ( not ( = ?auto_317196 ?auto_317185 ) ) ( CALIBRATION_TARGET ?auto_317192 ?auto_317193 ) ( not ( = ?auto_317193 ?auto_317189 ) ) ( not ( = ?auto_317188 ?auto_317189 ) ) ( not ( = ?auto_317194 ?auto_317189 ) ) ( ON_BOARD ?auto_317191 ?auto_317195 ) ( POWER_ON ?auto_317191 ) ( not ( = ?auto_317192 ?auto_317191 ) ) ( POINTING ?auto_317195 ?auto_317193 ) ( HAVE_IMAGE ?auto_317186 ?auto_317187 ) ( HAVE_IMAGE ?auto_317189 ?auto_317190 ) ( not ( = ?auto_317186 ?auto_317188 ) ) ( not ( = ?auto_317186 ?auto_317189 ) ) ( not ( = ?auto_317186 ?auto_317193 ) ) ( not ( = ?auto_317186 ?auto_317194 ) ) ( not ( = ?auto_317187 ?auto_317185 ) ) ( not ( = ?auto_317187 ?auto_317190 ) ) ( not ( = ?auto_317187 ?auto_317196 ) ) ( not ( = ?auto_317185 ?auto_317190 ) ) ( not ( = ?auto_317190 ?auto_317196 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317194 ?auto_317196 ?auto_317188 ?auto_317185 )
      ( GET-3IMAGE-VERIFY ?auto_317186 ?auto_317187 ?auto_317188 ?auto_317185 ?auto_317189 ?auto_317190 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_314542 - DIRECTION
      ?auto_314543 - MODE
      ?auto_314544 - DIRECTION
      ?auto_314541 - MODE
      ?auto_314545 - DIRECTION
      ?auto_314546 - MODE
    )
    :vars
    (
      ?auto_314548 - INSTRUMENT
      ?auto_314550 - SATELLITE
      ?auto_314547 - DIRECTION
      ?auto_314551 - DIRECTION
      ?auto_314549 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_314548 ?auto_314550 ) ( SUPPORTS ?auto_314548 ?auto_314543 ) ( not ( = ?auto_314542 ?auto_314547 ) ) ( HAVE_IMAGE ?auto_314545 ?auto_314546 ) ( not ( = ?auto_314545 ?auto_314542 ) ) ( not ( = ?auto_314545 ?auto_314547 ) ) ( not ( = ?auto_314546 ?auto_314543 ) ) ( CALIBRATION_TARGET ?auto_314548 ?auto_314547 ) ( not ( = ?auto_314547 ?auto_314551 ) ) ( not ( = ?auto_314542 ?auto_314551 ) ) ( not ( = ?auto_314545 ?auto_314551 ) ) ( ON_BOARD ?auto_314549 ?auto_314550 ) ( POWER_ON ?auto_314549 ) ( not ( = ?auto_314548 ?auto_314549 ) ) ( POINTING ?auto_314550 ?auto_314547 ) ( HAVE_IMAGE ?auto_314544 ?auto_314541 ) ( not ( = ?auto_314542 ?auto_314544 ) ) ( not ( = ?auto_314543 ?auto_314541 ) ) ( not ( = ?auto_314544 ?auto_314545 ) ) ( not ( = ?auto_314544 ?auto_314547 ) ) ( not ( = ?auto_314544 ?auto_314551 ) ) ( not ( = ?auto_314541 ?auto_314546 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_314545 ?auto_314546 ?auto_314542 ?auto_314543 )
      ( GET-3IMAGE-VERIFY ?auto_314542 ?auto_314543 ?auto_314544 ?auto_314541 ?auto_314545 ?auto_314546 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_317356 - DIRECTION
      ?auto_317357 - MODE
      ?auto_317358 - DIRECTION
      ?auto_317355 - MODE
      ?auto_317359 - DIRECTION
      ?auto_317360 - MODE
    )
    :vars
    (
      ?auto_317362 - INSTRUMENT
      ?auto_317365 - SATELLITE
      ?auto_317363 - DIRECTION
      ?auto_317364 - DIRECTION
      ?auto_317366 - MODE
      ?auto_317361 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317362 ?auto_317365 ) ( SUPPORTS ?auto_317362 ?auto_317357 ) ( not ( = ?auto_317356 ?auto_317363 ) ) ( HAVE_IMAGE ?auto_317364 ?auto_317366 ) ( not ( = ?auto_317364 ?auto_317356 ) ) ( not ( = ?auto_317364 ?auto_317363 ) ) ( not ( = ?auto_317366 ?auto_317357 ) ) ( CALIBRATION_TARGET ?auto_317362 ?auto_317363 ) ( not ( = ?auto_317363 ?auto_317358 ) ) ( not ( = ?auto_317356 ?auto_317358 ) ) ( not ( = ?auto_317364 ?auto_317358 ) ) ( ON_BOARD ?auto_317361 ?auto_317365 ) ( POWER_ON ?auto_317361 ) ( not ( = ?auto_317362 ?auto_317361 ) ) ( POINTING ?auto_317365 ?auto_317363 ) ( HAVE_IMAGE ?auto_317358 ?auto_317355 ) ( HAVE_IMAGE ?auto_317359 ?auto_317360 ) ( not ( = ?auto_317356 ?auto_317359 ) ) ( not ( = ?auto_317357 ?auto_317355 ) ) ( not ( = ?auto_317357 ?auto_317360 ) ) ( not ( = ?auto_317358 ?auto_317359 ) ) ( not ( = ?auto_317355 ?auto_317360 ) ) ( not ( = ?auto_317355 ?auto_317366 ) ) ( not ( = ?auto_317359 ?auto_317363 ) ) ( not ( = ?auto_317359 ?auto_317364 ) ) ( not ( = ?auto_317360 ?auto_317366 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317364 ?auto_317366 ?auto_317356 ?auto_317357 )
      ( GET-3IMAGE-VERIFY ?auto_317356 ?auto_317357 ?auto_317358 ?auto_317355 ?auto_317359 ?auto_317360 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_317503 - DIRECTION
      ?auto_317504 - MODE
      ?auto_317505 - DIRECTION
      ?auto_317502 - MODE
      ?auto_317506 - DIRECTION
      ?auto_317507 - MODE
      ?auto_317508 - DIRECTION
      ?auto_317509 - MODE
    )
    :vars
    (
      ?auto_317511 - INSTRUMENT
      ?auto_317513 - SATELLITE
      ?auto_317512 - DIRECTION
      ?auto_317510 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317511 ?auto_317513 ) ( SUPPORTS ?auto_317511 ?auto_317509 ) ( not ( = ?auto_317508 ?auto_317512 ) ) ( HAVE_IMAGE ?auto_317503 ?auto_317504 ) ( not ( = ?auto_317503 ?auto_317508 ) ) ( not ( = ?auto_317503 ?auto_317512 ) ) ( not ( = ?auto_317504 ?auto_317509 ) ) ( CALIBRATION_TARGET ?auto_317511 ?auto_317512 ) ( not ( = ?auto_317512 ?auto_317506 ) ) ( not ( = ?auto_317508 ?auto_317506 ) ) ( not ( = ?auto_317503 ?auto_317506 ) ) ( ON_BOARD ?auto_317510 ?auto_317513 ) ( POWER_ON ?auto_317510 ) ( not ( = ?auto_317511 ?auto_317510 ) ) ( POINTING ?auto_317513 ?auto_317512 ) ( HAVE_IMAGE ?auto_317505 ?auto_317502 ) ( HAVE_IMAGE ?auto_317506 ?auto_317507 ) ( not ( = ?auto_317503 ?auto_317505 ) ) ( not ( = ?auto_317504 ?auto_317502 ) ) ( not ( = ?auto_317504 ?auto_317507 ) ) ( not ( = ?auto_317505 ?auto_317506 ) ) ( not ( = ?auto_317505 ?auto_317508 ) ) ( not ( = ?auto_317505 ?auto_317512 ) ) ( not ( = ?auto_317502 ?auto_317507 ) ) ( not ( = ?auto_317502 ?auto_317509 ) ) ( not ( = ?auto_317507 ?auto_317509 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317503 ?auto_317504 ?auto_317508 ?auto_317509 )
      ( GET-4IMAGE-VERIFY ?auto_317503 ?auto_317504 ?auto_317505 ?auto_317502 ?auto_317506 ?auto_317507 ?auto_317508 ?auto_317509 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_317541 - DIRECTION
      ?auto_317542 - MODE
      ?auto_317543 - DIRECTION
      ?auto_317540 - MODE
      ?auto_317544 - DIRECTION
      ?auto_317545 - MODE
      ?auto_317546 - DIRECTION
      ?auto_317547 - MODE
    )
    :vars
    (
      ?auto_317549 - INSTRUMENT
      ?auto_317551 - SATELLITE
      ?auto_317550 - DIRECTION
      ?auto_317548 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317549 ?auto_317551 ) ( SUPPORTS ?auto_317549 ?auto_317545 ) ( not ( = ?auto_317544 ?auto_317550 ) ) ( HAVE_IMAGE ?auto_317541 ?auto_317542 ) ( not ( = ?auto_317541 ?auto_317544 ) ) ( not ( = ?auto_317541 ?auto_317550 ) ) ( not ( = ?auto_317542 ?auto_317545 ) ) ( CALIBRATION_TARGET ?auto_317549 ?auto_317550 ) ( not ( = ?auto_317550 ?auto_317546 ) ) ( not ( = ?auto_317544 ?auto_317546 ) ) ( not ( = ?auto_317541 ?auto_317546 ) ) ( ON_BOARD ?auto_317548 ?auto_317551 ) ( POWER_ON ?auto_317548 ) ( not ( = ?auto_317549 ?auto_317548 ) ) ( POINTING ?auto_317551 ?auto_317550 ) ( HAVE_IMAGE ?auto_317543 ?auto_317540 ) ( HAVE_IMAGE ?auto_317546 ?auto_317547 ) ( not ( = ?auto_317541 ?auto_317543 ) ) ( not ( = ?auto_317542 ?auto_317540 ) ) ( not ( = ?auto_317542 ?auto_317547 ) ) ( not ( = ?auto_317543 ?auto_317544 ) ) ( not ( = ?auto_317543 ?auto_317546 ) ) ( not ( = ?auto_317543 ?auto_317550 ) ) ( not ( = ?auto_317540 ?auto_317545 ) ) ( not ( = ?auto_317540 ?auto_317547 ) ) ( not ( = ?auto_317545 ?auto_317547 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317541 ?auto_317542 ?auto_317544 ?auto_317545 )
      ( GET-4IMAGE-VERIFY ?auto_317541 ?auto_317542 ?auto_317543 ?auto_317540 ?auto_317544 ?auto_317545 ?auto_317546 ?auto_317547 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_314818 - DIRECTION
      ?auto_314819 - MODE
      ?auto_314820 - DIRECTION
      ?auto_314817 - MODE
      ?auto_314821 - DIRECTION
      ?auto_314822 - MODE
      ?auto_314823 - DIRECTION
      ?auto_314824 - MODE
    )
    :vars
    (
      ?auto_314826 - INSTRUMENT
      ?auto_314828 - SATELLITE
      ?auto_314825 - DIRECTION
      ?auto_314829 - DIRECTION
      ?auto_314827 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_314826 ?auto_314828 ) ( SUPPORTS ?auto_314826 ?auto_314824 ) ( not ( = ?auto_314823 ?auto_314825 ) ) ( HAVE_IMAGE ?auto_314818 ?auto_314822 ) ( not ( = ?auto_314818 ?auto_314823 ) ) ( not ( = ?auto_314818 ?auto_314825 ) ) ( not ( = ?auto_314822 ?auto_314824 ) ) ( CALIBRATION_TARGET ?auto_314826 ?auto_314825 ) ( not ( = ?auto_314825 ?auto_314829 ) ) ( not ( = ?auto_314823 ?auto_314829 ) ) ( not ( = ?auto_314818 ?auto_314829 ) ) ( ON_BOARD ?auto_314827 ?auto_314828 ) ( POWER_ON ?auto_314827 ) ( not ( = ?auto_314826 ?auto_314827 ) ) ( POINTING ?auto_314828 ?auto_314825 ) ( HAVE_IMAGE ?auto_314818 ?auto_314819 ) ( HAVE_IMAGE ?auto_314820 ?auto_314817 ) ( HAVE_IMAGE ?auto_314821 ?auto_314822 ) ( not ( = ?auto_314818 ?auto_314820 ) ) ( not ( = ?auto_314818 ?auto_314821 ) ) ( not ( = ?auto_314819 ?auto_314817 ) ) ( not ( = ?auto_314819 ?auto_314822 ) ) ( not ( = ?auto_314819 ?auto_314824 ) ) ( not ( = ?auto_314820 ?auto_314821 ) ) ( not ( = ?auto_314820 ?auto_314823 ) ) ( not ( = ?auto_314820 ?auto_314825 ) ) ( not ( = ?auto_314820 ?auto_314829 ) ) ( not ( = ?auto_314817 ?auto_314822 ) ) ( not ( = ?auto_314817 ?auto_314824 ) ) ( not ( = ?auto_314821 ?auto_314823 ) ) ( not ( = ?auto_314821 ?auto_314825 ) ) ( not ( = ?auto_314821 ?auto_314829 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_314818 ?auto_314822 ?auto_314823 ?auto_314824 )
      ( GET-4IMAGE-VERIFY ?auto_314818 ?auto_314819 ?auto_314820 ?auto_314817 ?auto_314821 ?auto_314822 ?auto_314823 ?auto_314824 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_317803 - DIRECTION
      ?auto_317804 - MODE
      ?auto_317805 - DIRECTION
      ?auto_317802 - MODE
      ?auto_317806 - DIRECTION
      ?auto_317807 - MODE
      ?auto_317808 - DIRECTION
      ?auto_317809 - MODE
    )
    :vars
    (
      ?auto_317811 - INSTRUMENT
      ?auto_317813 - SATELLITE
      ?auto_317812 - DIRECTION
      ?auto_317810 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317811 ?auto_317813 ) ( SUPPORTS ?auto_317811 ?auto_317802 ) ( not ( = ?auto_317805 ?auto_317812 ) ) ( HAVE_IMAGE ?auto_317808 ?auto_317809 ) ( not ( = ?auto_317808 ?auto_317805 ) ) ( not ( = ?auto_317808 ?auto_317812 ) ) ( not ( = ?auto_317809 ?auto_317802 ) ) ( CALIBRATION_TARGET ?auto_317811 ?auto_317812 ) ( not ( = ?auto_317812 ?auto_317806 ) ) ( not ( = ?auto_317805 ?auto_317806 ) ) ( not ( = ?auto_317808 ?auto_317806 ) ) ( ON_BOARD ?auto_317810 ?auto_317813 ) ( POWER_ON ?auto_317810 ) ( not ( = ?auto_317811 ?auto_317810 ) ) ( POINTING ?auto_317813 ?auto_317812 ) ( HAVE_IMAGE ?auto_317803 ?auto_317804 ) ( HAVE_IMAGE ?auto_317806 ?auto_317807 ) ( not ( = ?auto_317803 ?auto_317805 ) ) ( not ( = ?auto_317803 ?auto_317806 ) ) ( not ( = ?auto_317803 ?auto_317808 ) ) ( not ( = ?auto_317803 ?auto_317812 ) ) ( not ( = ?auto_317804 ?auto_317802 ) ) ( not ( = ?auto_317804 ?auto_317807 ) ) ( not ( = ?auto_317804 ?auto_317809 ) ) ( not ( = ?auto_317802 ?auto_317807 ) ) ( not ( = ?auto_317807 ?auto_317809 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317808 ?auto_317809 ?auto_317805 ?auto_317802 )
      ( GET-4IMAGE-VERIFY ?auto_317803 ?auto_317804 ?auto_317805 ?auto_317802 ?auto_317806 ?auto_317807 ?auto_317808 ?auto_317809 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_318237 - DIRECTION
      ?auto_318238 - MODE
      ?auto_318239 - DIRECTION
      ?auto_318236 - MODE
      ?auto_318240 - DIRECTION
      ?auto_318241 - MODE
      ?auto_318242 - DIRECTION
      ?auto_318243 - MODE
    )
    :vars
    (
      ?auto_318245 - INSTRUMENT
      ?auto_318247 - SATELLITE
      ?auto_318246 - DIRECTION
      ?auto_318244 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_318245 ?auto_318247 ) ( SUPPORTS ?auto_318245 ?auto_318236 ) ( not ( = ?auto_318239 ?auto_318246 ) ) ( HAVE_IMAGE ?auto_318240 ?auto_318241 ) ( not ( = ?auto_318240 ?auto_318239 ) ) ( not ( = ?auto_318240 ?auto_318246 ) ) ( not ( = ?auto_318241 ?auto_318236 ) ) ( CALIBRATION_TARGET ?auto_318245 ?auto_318246 ) ( not ( = ?auto_318246 ?auto_318237 ) ) ( not ( = ?auto_318239 ?auto_318237 ) ) ( not ( = ?auto_318240 ?auto_318237 ) ) ( ON_BOARD ?auto_318244 ?auto_318247 ) ( POWER_ON ?auto_318244 ) ( not ( = ?auto_318245 ?auto_318244 ) ) ( POINTING ?auto_318247 ?auto_318246 ) ( HAVE_IMAGE ?auto_318237 ?auto_318238 ) ( HAVE_IMAGE ?auto_318242 ?auto_318243 ) ( not ( = ?auto_318237 ?auto_318242 ) ) ( not ( = ?auto_318238 ?auto_318236 ) ) ( not ( = ?auto_318238 ?auto_318241 ) ) ( not ( = ?auto_318238 ?auto_318243 ) ) ( not ( = ?auto_318239 ?auto_318242 ) ) ( not ( = ?auto_318236 ?auto_318243 ) ) ( not ( = ?auto_318240 ?auto_318242 ) ) ( not ( = ?auto_318241 ?auto_318243 ) ) ( not ( = ?auto_318242 ?auto_318246 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_318240 ?auto_318241 ?auto_318239 ?auto_318236 )
      ( GET-4IMAGE-VERIFY ?auto_318237 ?auto_318238 ?auto_318239 ?auto_318236 ?auto_318240 ?auto_318241 ?auto_318242 ?auto_318243 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_317765 - DIRECTION
      ?auto_317766 - MODE
      ?auto_317767 - DIRECTION
      ?auto_317764 - MODE
      ?auto_317768 - DIRECTION
      ?auto_317769 - MODE
      ?auto_317770 - DIRECTION
      ?auto_317771 - MODE
    )
    :vars
    (
      ?auto_317773 - INSTRUMENT
      ?auto_317775 - SATELLITE
      ?auto_317774 - DIRECTION
      ?auto_317772 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317773 ?auto_317775 ) ( SUPPORTS ?auto_317773 ?auto_317764 ) ( not ( = ?auto_317767 ?auto_317774 ) ) ( HAVE_IMAGE ?auto_317765 ?auto_317766 ) ( not ( = ?auto_317765 ?auto_317767 ) ) ( not ( = ?auto_317765 ?auto_317774 ) ) ( not ( = ?auto_317766 ?auto_317764 ) ) ( CALIBRATION_TARGET ?auto_317773 ?auto_317774 ) ( not ( = ?auto_317774 ?auto_317770 ) ) ( not ( = ?auto_317767 ?auto_317770 ) ) ( not ( = ?auto_317765 ?auto_317770 ) ) ( ON_BOARD ?auto_317772 ?auto_317775 ) ( POWER_ON ?auto_317772 ) ( not ( = ?auto_317773 ?auto_317772 ) ) ( POINTING ?auto_317775 ?auto_317774 ) ( HAVE_IMAGE ?auto_317768 ?auto_317769 ) ( HAVE_IMAGE ?auto_317770 ?auto_317771 ) ( not ( = ?auto_317765 ?auto_317768 ) ) ( not ( = ?auto_317766 ?auto_317769 ) ) ( not ( = ?auto_317766 ?auto_317771 ) ) ( not ( = ?auto_317767 ?auto_317768 ) ) ( not ( = ?auto_317764 ?auto_317769 ) ) ( not ( = ?auto_317764 ?auto_317771 ) ) ( not ( = ?auto_317768 ?auto_317770 ) ) ( not ( = ?auto_317768 ?auto_317774 ) ) ( not ( = ?auto_317769 ?auto_317771 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317765 ?auto_317766 ?auto_317767 ?auto_317764 )
      ( GET-4IMAGE-VERIFY ?auto_317765 ?auto_317766 ?auto_317767 ?auto_317764 ?auto_317768 ?auto_317769 ?auto_317770 ?auto_317771 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_317965 - DIRECTION
      ?auto_317966 - MODE
      ?auto_317967 - DIRECTION
      ?auto_317964 - MODE
      ?auto_317968 - DIRECTION
      ?auto_317969 - MODE
      ?auto_317970 - DIRECTION
      ?auto_317971 - MODE
    )
    :vars
    (
      ?auto_317973 - INSTRUMENT
      ?auto_317975 - SATELLITE
      ?auto_317974 - DIRECTION
      ?auto_317972 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317973 ?auto_317975 ) ( SUPPORTS ?auto_317973 ?auto_317971 ) ( not ( = ?auto_317970 ?auto_317974 ) ) ( HAVE_IMAGE ?auto_317967 ?auto_317964 ) ( not ( = ?auto_317967 ?auto_317970 ) ) ( not ( = ?auto_317967 ?auto_317974 ) ) ( not ( = ?auto_317964 ?auto_317971 ) ) ( CALIBRATION_TARGET ?auto_317973 ?auto_317974 ) ( not ( = ?auto_317974 ?auto_317968 ) ) ( not ( = ?auto_317970 ?auto_317968 ) ) ( not ( = ?auto_317967 ?auto_317968 ) ) ( ON_BOARD ?auto_317972 ?auto_317975 ) ( POWER_ON ?auto_317972 ) ( not ( = ?auto_317973 ?auto_317972 ) ) ( POINTING ?auto_317975 ?auto_317974 ) ( HAVE_IMAGE ?auto_317965 ?auto_317966 ) ( HAVE_IMAGE ?auto_317968 ?auto_317969 ) ( not ( = ?auto_317965 ?auto_317967 ) ) ( not ( = ?auto_317965 ?auto_317968 ) ) ( not ( = ?auto_317965 ?auto_317970 ) ) ( not ( = ?auto_317965 ?auto_317974 ) ) ( not ( = ?auto_317966 ?auto_317964 ) ) ( not ( = ?auto_317966 ?auto_317969 ) ) ( not ( = ?auto_317966 ?auto_317971 ) ) ( not ( = ?auto_317964 ?auto_317969 ) ) ( not ( = ?auto_317969 ?auto_317971 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317967 ?auto_317964 ?auto_317970 ?auto_317971 )
      ( GET-4IMAGE-VERIFY ?auto_317965 ?auto_317966 ?auto_317967 ?auto_317964 ?auto_317968 ?auto_317969 ?auto_317970 ?auto_317971 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_317989 - DIRECTION
      ?auto_317990 - MODE
      ?auto_317991 - DIRECTION
      ?auto_317988 - MODE
      ?auto_317992 - DIRECTION
      ?auto_317993 - MODE
      ?auto_317994 - DIRECTION
      ?auto_317995 - MODE
    )
    :vars
    (
      ?auto_317997 - INSTRUMENT
      ?auto_317999 - SATELLITE
      ?auto_317998 - DIRECTION
      ?auto_317996 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317997 ?auto_317999 ) ( SUPPORTS ?auto_317997 ?auto_317993 ) ( not ( = ?auto_317992 ?auto_317998 ) ) ( HAVE_IMAGE ?auto_317991 ?auto_317995 ) ( not ( = ?auto_317991 ?auto_317992 ) ) ( not ( = ?auto_317991 ?auto_317998 ) ) ( not ( = ?auto_317995 ?auto_317993 ) ) ( CALIBRATION_TARGET ?auto_317997 ?auto_317998 ) ( not ( = ?auto_317998 ?auto_317989 ) ) ( not ( = ?auto_317992 ?auto_317989 ) ) ( not ( = ?auto_317991 ?auto_317989 ) ) ( ON_BOARD ?auto_317996 ?auto_317999 ) ( POWER_ON ?auto_317996 ) ( not ( = ?auto_317997 ?auto_317996 ) ) ( POINTING ?auto_317999 ?auto_317998 ) ( HAVE_IMAGE ?auto_317989 ?auto_317990 ) ( HAVE_IMAGE ?auto_317991 ?auto_317988 ) ( HAVE_IMAGE ?auto_317994 ?auto_317995 ) ( not ( = ?auto_317989 ?auto_317994 ) ) ( not ( = ?auto_317990 ?auto_317988 ) ) ( not ( = ?auto_317990 ?auto_317993 ) ) ( not ( = ?auto_317990 ?auto_317995 ) ) ( not ( = ?auto_317991 ?auto_317994 ) ) ( not ( = ?auto_317988 ?auto_317993 ) ) ( not ( = ?auto_317988 ?auto_317995 ) ) ( not ( = ?auto_317992 ?auto_317994 ) ) ( not ( = ?auto_317994 ?auto_317998 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317991 ?auto_317995 ?auto_317992 ?auto_317993 )
      ( GET-4IMAGE-VERIFY ?auto_317989 ?auto_317990 ?auto_317991 ?auto_317988 ?auto_317992 ?auto_317993 ?auto_317994 ?auto_317995 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_318001 - DIRECTION
      ?auto_318002 - MODE
      ?auto_318003 - DIRECTION
      ?auto_318000 - MODE
      ?auto_318004 - DIRECTION
      ?auto_318005 - MODE
      ?auto_318006 - DIRECTION
      ?auto_318007 - MODE
    )
    :vars
    (
      ?auto_318009 - INSTRUMENT
      ?auto_318011 - SATELLITE
      ?auto_318010 - DIRECTION
      ?auto_318008 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_318009 ?auto_318011 ) ( SUPPORTS ?auto_318009 ?auto_318005 ) ( not ( = ?auto_318004 ?auto_318010 ) ) ( HAVE_IMAGE ?auto_318003 ?auto_318000 ) ( not ( = ?auto_318003 ?auto_318004 ) ) ( not ( = ?auto_318003 ?auto_318010 ) ) ( not ( = ?auto_318000 ?auto_318005 ) ) ( CALIBRATION_TARGET ?auto_318009 ?auto_318010 ) ( not ( = ?auto_318010 ?auto_318001 ) ) ( not ( = ?auto_318004 ?auto_318001 ) ) ( not ( = ?auto_318003 ?auto_318001 ) ) ( ON_BOARD ?auto_318008 ?auto_318011 ) ( POWER_ON ?auto_318008 ) ( not ( = ?auto_318009 ?auto_318008 ) ) ( POINTING ?auto_318011 ?auto_318010 ) ( HAVE_IMAGE ?auto_318001 ?auto_318002 ) ( HAVE_IMAGE ?auto_318006 ?auto_318007 ) ( not ( = ?auto_318001 ?auto_318006 ) ) ( not ( = ?auto_318002 ?auto_318000 ) ) ( not ( = ?auto_318002 ?auto_318005 ) ) ( not ( = ?auto_318002 ?auto_318007 ) ) ( not ( = ?auto_318003 ?auto_318006 ) ) ( not ( = ?auto_318000 ?auto_318007 ) ) ( not ( = ?auto_318004 ?auto_318006 ) ) ( not ( = ?auto_318005 ?auto_318007 ) ) ( not ( = ?auto_318006 ?auto_318010 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_318003 ?auto_318000 ?auto_318004 ?auto_318005 )
      ( GET-4IMAGE-VERIFY ?auto_318001 ?auto_318002 ?auto_318003 ?auto_318000 ?auto_318004 ?auto_318005 ?auto_318006 ?auto_318007 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_317953 - DIRECTION
      ?auto_317954 - MODE
      ?auto_317955 - DIRECTION
      ?auto_317952 - MODE
      ?auto_317956 - DIRECTION
      ?auto_317957 - MODE
      ?auto_317958 - DIRECTION
      ?auto_317959 - MODE
    )
    :vars
    (
      ?auto_317961 - INSTRUMENT
      ?auto_317963 - SATELLITE
      ?auto_317962 - DIRECTION
      ?auto_317960 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317961 ?auto_317963 ) ( SUPPORTS ?auto_317961 ?auto_317959 ) ( not ( = ?auto_317958 ?auto_317962 ) ) ( HAVE_IMAGE ?auto_317956 ?auto_317957 ) ( not ( = ?auto_317956 ?auto_317958 ) ) ( not ( = ?auto_317956 ?auto_317962 ) ) ( not ( = ?auto_317957 ?auto_317959 ) ) ( CALIBRATION_TARGET ?auto_317961 ?auto_317962 ) ( not ( = ?auto_317962 ?auto_317953 ) ) ( not ( = ?auto_317958 ?auto_317953 ) ) ( not ( = ?auto_317956 ?auto_317953 ) ) ( ON_BOARD ?auto_317960 ?auto_317963 ) ( POWER_ON ?auto_317960 ) ( not ( = ?auto_317961 ?auto_317960 ) ) ( POINTING ?auto_317963 ?auto_317962 ) ( HAVE_IMAGE ?auto_317953 ?auto_317954 ) ( HAVE_IMAGE ?auto_317955 ?auto_317952 ) ( not ( = ?auto_317953 ?auto_317955 ) ) ( not ( = ?auto_317954 ?auto_317952 ) ) ( not ( = ?auto_317954 ?auto_317957 ) ) ( not ( = ?auto_317954 ?auto_317959 ) ) ( not ( = ?auto_317955 ?auto_317956 ) ) ( not ( = ?auto_317955 ?auto_317958 ) ) ( not ( = ?auto_317955 ?auto_317962 ) ) ( not ( = ?auto_317952 ?auto_317957 ) ) ( not ( = ?auto_317952 ?auto_317959 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317956 ?auto_317957 ?auto_317958 ?auto_317959 )
      ( GET-4IMAGE-VERIFY ?auto_317953 ?auto_317954 ?auto_317955 ?auto_317952 ?auto_317956 ?auto_317957 ?auto_317958 ?auto_317959 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_318049 - DIRECTION
      ?auto_318050 - MODE
      ?auto_318051 - DIRECTION
      ?auto_318048 - MODE
      ?auto_318052 - DIRECTION
      ?auto_318053 - MODE
      ?auto_318054 - DIRECTION
      ?auto_318055 - MODE
    )
    :vars
    (
      ?auto_318057 - INSTRUMENT
      ?auto_318060 - SATELLITE
      ?auto_318058 - DIRECTION
      ?auto_318059 - DIRECTION
      ?auto_318061 - MODE
      ?auto_318056 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_318057 ?auto_318060 ) ( SUPPORTS ?auto_318057 ?auto_318055 ) ( not ( = ?auto_318054 ?auto_318058 ) ) ( HAVE_IMAGE ?auto_318059 ?auto_318061 ) ( not ( = ?auto_318059 ?auto_318054 ) ) ( not ( = ?auto_318059 ?auto_318058 ) ) ( not ( = ?auto_318061 ?auto_318055 ) ) ( CALIBRATION_TARGET ?auto_318057 ?auto_318058 ) ( not ( = ?auto_318058 ?auto_318049 ) ) ( not ( = ?auto_318054 ?auto_318049 ) ) ( not ( = ?auto_318059 ?auto_318049 ) ) ( ON_BOARD ?auto_318056 ?auto_318060 ) ( POWER_ON ?auto_318056 ) ( not ( = ?auto_318057 ?auto_318056 ) ) ( POINTING ?auto_318060 ?auto_318058 ) ( HAVE_IMAGE ?auto_318049 ?auto_318050 ) ( HAVE_IMAGE ?auto_318051 ?auto_318048 ) ( HAVE_IMAGE ?auto_318052 ?auto_318053 ) ( not ( = ?auto_318049 ?auto_318051 ) ) ( not ( = ?auto_318049 ?auto_318052 ) ) ( not ( = ?auto_318050 ?auto_318048 ) ) ( not ( = ?auto_318050 ?auto_318053 ) ) ( not ( = ?auto_318050 ?auto_318055 ) ) ( not ( = ?auto_318050 ?auto_318061 ) ) ( not ( = ?auto_318051 ?auto_318052 ) ) ( not ( = ?auto_318051 ?auto_318054 ) ) ( not ( = ?auto_318051 ?auto_318058 ) ) ( not ( = ?auto_318051 ?auto_318059 ) ) ( not ( = ?auto_318048 ?auto_318053 ) ) ( not ( = ?auto_318048 ?auto_318055 ) ) ( not ( = ?auto_318048 ?auto_318061 ) ) ( not ( = ?auto_318052 ?auto_318054 ) ) ( not ( = ?auto_318052 ?auto_318058 ) ) ( not ( = ?auto_318052 ?auto_318059 ) ) ( not ( = ?auto_318053 ?auto_318055 ) ) ( not ( = ?auto_318053 ?auto_318061 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_318059 ?auto_318061 ?auto_318054 ?auto_318055 )
      ( GET-4IMAGE-VERIFY ?auto_318049 ?auto_318050 ?auto_318051 ?auto_318048 ?auto_318052 ?auto_318053 ?auto_318054 ?auto_318055 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_318077 - DIRECTION
      ?auto_318078 - MODE
      ?auto_318079 - DIRECTION
      ?auto_318076 - MODE
      ?auto_318080 - DIRECTION
      ?auto_318081 - MODE
      ?auto_318082 - DIRECTION
      ?auto_318083 - MODE
    )
    :vars
    (
      ?auto_318085 - INSTRUMENT
      ?auto_318087 - SATELLITE
      ?auto_318086 - DIRECTION
      ?auto_318084 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_318085 ?auto_318087 ) ( SUPPORTS ?auto_318085 ?auto_318081 ) ( not ( = ?auto_318080 ?auto_318086 ) ) ( HAVE_IMAGE ?auto_318082 ?auto_318083 ) ( not ( = ?auto_318082 ?auto_318080 ) ) ( not ( = ?auto_318082 ?auto_318086 ) ) ( not ( = ?auto_318083 ?auto_318081 ) ) ( CALIBRATION_TARGET ?auto_318085 ?auto_318086 ) ( not ( = ?auto_318086 ?auto_318077 ) ) ( not ( = ?auto_318080 ?auto_318077 ) ) ( not ( = ?auto_318082 ?auto_318077 ) ) ( ON_BOARD ?auto_318084 ?auto_318087 ) ( POWER_ON ?auto_318084 ) ( not ( = ?auto_318085 ?auto_318084 ) ) ( POINTING ?auto_318087 ?auto_318086 ) ( HAVE_IMAGE ?auto_318077 ?auto_318078 ) ( HAVE_IMAGE ?auto_318079 ?auto_318076 ) ( not ( = ?auto_318077 ?auto_318079 ) ) ( not ( = ?auto_318078 ?auto_318076 ) ) ( not ( = ?auto_318078 ?auto_318081 ) ) ( not ( = ?auto_318078 ?auto_318083 ) ) ( not ( = ?auto_318079 ?auto_318080 ) ) ( not ( = ?auto_318079 ?auto_318082 ) ) ( not ( = ?auto_318079 ?auto_318086 ) ) ( not ( = ?auto_318076 ?auto_318081 ) ) ( not ( = ?auto_318076 ?auto_318083 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_318082 ?auto_318083 ?auto_318080 ?auto_318081 )
      ( GET-4IMAGE-VERIFY ?auto_318077 ?auto_318078 ?auto_318079 ?auto_318076 ?auto_318080 ?auto_318081 ?auto_318082 ?auto_318083 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_318089 - DIRECTION
      ?auto_318090 - MODE
      ?auto_318091 - DIRECTION
      ?auto_318088 - MODE
      ?auto_318092 - DIRECTION
      ?auto_318093 - MODE
      ?auto_318094 - DIRECTION
      ?auto_318095 - MODE
    )
    :vars
    (
      ?auto_318097 - INSTRUMENT
      ?auto_318100 - SATELLITE
      ?auto_318098 - DIRECTION
      ?auto_318099 - DIRECTION
      ?auto_318101 - MODE
      ?auto_318096 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_318097 ?auto_318100 ) ( SUPPORTS ?auto_318097 ?auto_318093 ) ( not ( = ?auto_318092 ?auto_318098 ) ) ( HAVE_IMAGE ?auto_318099 ?auto_318101 ) ( not ( = ?auto_318099 ?auto_318092 ) ) ( not ( = ?auto_318099 ?auto_318098 ) ) ( not ( = ?auto_318101 ?auto_318093 ) ) ( CALIBRATION_TARGET ?auto_318097 ?auto_318098 ) ( not ( = ?auto_318098 ?auto_318091 ) ) ( not ( = ?auto_318092 ?auto_318091 ) ) ( not ( = ?auto_318099 ?auto_318091 ) ) ( ON_BOARD ?auto_318096 ?auto_318100 ) ( POWER_ON ?auto_318096 ) ( not ( = ?auto_318097 ?auto_318096 ) ) ( POINTING ?auto_318100 ?auto_318098 ) ( HAVE_IMAGE ?auto_318089 ?auto_318090 ) ( HAVE_IMAGE ?auto_318091 ?auto_318088 ) ( HAVE_IMAGE ?auto_318094 ?auto_318095 ) ( not ( = ?auto_318089 ?auto_318091 ) ) ( not ( = ?auto_318089 ?auto_318092 ) ) ( not ( = ?auto_318089 ?auto_318094 ) ) ( not ( = ?auto_318089 ?auto_318098 ) ) ( not ( = ?auto_318089 ?auto_318099 ) ) ( not ( = ?auto_318090 ?auto_318088 ) ) ( not ( = ?auto_318090 ?auto_318093 ) ) ( not ( = ?auto_318090 ?auto_318095 ) ) ( not ( = ?auto_318090 ?auto_318101 ) ) ( not ( = ?auto_318091 ?auto_318094 ) ) ( not ( = ?auto_318088 ?auto_318093 ) ) ( not ( = ?auto_318088 ?auto_318095 ) ) ( not ( = ?auto_318088 ?auto_318101 ) ) ( not ( = ?auto_318092 ?auto_318094 ) ) ( not ( = ?auto_318093 ?auto_318095 ) ) ( not ( = ?auto_318094 ?auto_318098 ) ) ( not ( = ?auto_318094 ?auto_318099 ) ) ( not ( = ?auto_318095 ?auto_318101 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_318099 ?auto_318101 ?auto_318092 ?auto_318093 )
      ( GET-4IMAGE-VERIFY ?auto_318089 ?auto_318090 ?auto_318091 ?auto_318088 ?auto_318092 ?auto_318093 ?auto_318094 ?auto_318095 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_318225 - DIRECTION
      ?auto_318226 - MODE
      ?auto_318227 - DIRECTION
      ?auto_318224 - MODE
      ?auto_318228 - DIRECTION
      ?auto_318229 - MODE
      ?auto_318230 - DIRECTION
      ?auto_318231 - MODE
    )
    :vars
    (
      ?auto_318233 - INSTRUMENT
      ?auto_318235 - SATELLITE
      ?auto_318234 - DIRECTION
      ?auto_318232 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_318233 ?auto_318235 ) ( SUPPORTS ?auto_318233 ?auto_318224 ) ( not ( = ?auto_318227 ?auto_318234 ) ) ( HAVE_IMAGE ?auto_318228 ?auto_318231 ) ( not ( = ?auto_318228 ?auto_318227 ) ) ( not ( = ?auto_318228 ?auto_318234 ) ) ( not ( = ?auto_318231 ?auto_318224 ) ) ( CALIBRATION_TARGET ?auto_318233 ?auto_318234 ) ( not ( = ?auto_318234 ?auto_318225 ) ) ( not ( = ?auto_318227 ?auto_318225 ) ) ( not ( = ?auto_318228 ?auto_318225 ) ) ( ON_BOARD ?auto_318232 ?auto_318235 ) ( POWER_ON ?auto_318232 ) ( not ( = ?auto_318233 ?auto_318232 ) ) ( POINTING ?auto_318235 ?auto_318234 ) ( HAVE_IMAGE ?auto_318225 ?auto_318226 ) ( HAVE_IMAGE ?auto_318228 ?auto_318229 ) ( HAVE_IMAGE ?auto_318230 ?auto_318231 ) ( not ( = ?auto_318225 ?auto_318230 ) ) ( not ( = ?auto_318226 ?auto_318224 ) ) ( not ( = ?auto_318226 ?auto_318229 ) ) ( not ( = ?auto_318226 ?auto_318231 ) ) ( not ( = ?auto_318227 ?auto_318230 ) ) ( not ( = ?auto_318224 ?auto_318229 ) ) ( not ( = ?auto_318228 ?auto_318230 ) ) ( not ( = ?auto_318229 ?auto_318231 ) ) ( not ( = ?auto_318230 ?auto_318234 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_318228 ?auto_318231 ?auto_318227 ?auto_318224 )
      ( GET-4IMAGE-VERIFY ?auto_318225 ?auto_318226 ?auto_318227 ?auto_318224 ?auto_318228 ?auto_318229 ?auto_318230 ?auto_318231 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_318285 - DIRECTION
      ?auto_318286 - MODE
      ?auto_318287 - DIRECTION
      ?auto_318284 - MODE
      ?auto_318288 - DIRECTION
      ?auto_318289 - MODE
      ?auto_318290 - DIRECTION
      ?auto_318291 - MODE
    )
    :vars
    (
      ?auto_318293 - INSTRUMENT
      ?auto_318296 - SATELLITE
      ?auto_318294 - DIRECTION
      ?auto_318295 - DIRECTION
      ?auto_318297 - MODE
      ?auto_318292 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_318293 ?auto_318296 ) ( SUPPORTS ?auto_318293 ?auto_318284 ) ( not ( = ?auto_318287 ?auto_318294 ) ) ( HAVE_IMAGE ?auto_318295 ?auto_318297 ) ( not ( = ?auto_318295 ?auto_318287 ) ) ( not ( = ?auto_318295 ?auto_318294 ) ) ( not ( = ?auto_318297 ?auto_318284 ) ) ( CALIBRATION_TARGET ?auto_318293 ?auto_318294 ) ( not ( = ?auto_318294 ?auto_318290 ) ) ( not ( = ?auto_318287 ?auto_318290 ) ) ( not ( = ?auto_318295 ?auto_318290 ) ) ( ON_BOARD ?auto_318292 ?auto_318296 ) ( POWER_ON ?auto_318292 ) ( not ( = ?auto_318293 ?auto_318292 ) ) ( POINTING ?auto_318296 ?auto_318294 ) ( HAVE_IMAGE ?auto_318285 ?auto_318286 ) ( HAVE_IMAGE ?auto_318288 ?auto_318289 ) ( HAVE_IMAGE ?auto_318290 ?auto_318291 ) ( not ( = ?auto_318285 ?auto_318287 ) ) ( not ( = ?auto_318285 ?auto_318288 ) ) ( not ( = ?auto_318285 ?auto_318290 ) ) ( not ( = ?auto_318285 ?auto_318294 ) ) ( not ( = ?auto_318285 ?auto_318295 ) ) ( not ( = ?auto_318286 ?auto_318284 ) ) ( not ( = ?auto_318286 ?auto_318289 ) ) ( not ( = ?auto_318286 ?auto_318291 ) ) ( not ( = ?auto_318286 ?auto_318297 ) ) ( not ( = ?auto_318287 ?auto_318288 ) ) ( not ( = ?auto_318284 ?auto_318289 ) ) ( not ( = ?auto_318284 ?auto_318291 ) ) ( not ( = ?auto_318288 ?auto_318290 ) ) ( not ( = ?auto_318288 ?auto_318294 ) ) ( not ( = ?auto_318288 ?auto_318295 ) ) ( not ( = ?auto_318289 ?auto_318291 ) ) ( not ( = ?auto_318289 ?auto_318297 ) ) ( not ( = ?auto_318291 ?auto_318297 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_318295 ?auto_318297 ?auto_318287 ?auto_318284 )
      ( GET-4IMAGE-VERIFY ?auto_318285 ?auto_318286 ?auto_318287 ?auto_318284 ?auto_318288 ?auto_318289 ?auto_318290 ?auto_318291 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_318999 - DIRECTION
      ?auto_319000 - MODE
      ?auto_319001 - DIRECTION
      ?auto_318998 - MODE
      ?auto_319002 - DIRECTION
      ?auto_319003 - MODE
      ?auto_319004 - DIRECTION
      ?auto_319005 - MODE
    )
    :vars
    (
      ?auto_319007 - INSTRUMENT
      ?auto_319009 - SATELLITE
      ?auto_319008 - DIRECTION
      ?auto_319006 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_319007 ?auto_319009 ) ( SUPPORTS ?auto_319007 ?auto_319000 ) ( not ( = ?auto_318999 ?auto_319008 ) ) ( HAVE_IMAGE ?auto_319001 ?auto_318998 ) ( not ( = ?auto_319001 ?auto_318999 ) ) ( not ( = ?auto_319001 ?auto_319008 ) ) ( not ( = ?auto_318998 ?auto_319000 ) ) ( CALIBRATION_TARGET ?auto_319007 ?auto_319008 ) ( not ( = ?auto_319008 ?auto_319002 ) ) ( not ( = ?auto_318999 ?auto_319002 ) ) ( not ( = ?auto_319001 ?auto_319002 ) ) ( ON_BOARD ?auto_319006 ?auto_319009 ) ( POWER_ON ?auto_319006 ) ( not ( = ?auto_319007 ?auto_319006 ) ) ( POINTING ?auto_319009 ?auto_319008 ) ( HAVE_IMAGE ?auto_319002 ?auto_319003 ) ( HAVE_IMAGE ?auto_319004 ?auto_319005 ) ( not ( = ?auto_318999 ?auto_319004 ) ) ( not ( = ?auto_319000 ?auto_319003 ) ) ( not ( = ?auto_319000 ?auto_319005 ) ) ( not ( = ?auto_319001 ?auto_319004 ) ) ( not ( = ?auto_318998 ?auto_319003 ) ) ( not ( = ?auto_318998 ?auto_319005 ) ) ( not ( = ?auto_319002 ?auto_319004 ) ) ( not ( = ?auto_319003 ?auto_319005 ) ) ( not ( = ?auto_319004 ?auto_319008 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_319001 ?auto_318998 ?auto_318999 ?auto_319000 )
      ( GET-4IMAGE-VERIFY ?auto_318999 ?auto_319000 ?auto_319001 ?auto_318998 ?auto_319002 ?auto_319003 ?auto_319004 ?auto_319005 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_319149 - DIRECTION
      ?auto_319150 - MODE
      ?auto_319151 - DIRECTION
      ?auto_319148 - MODE
      ?auto_319152 - DIRECTION
      ?auto_319153 - MODE
      ?auto_319154 - DIRECTION
      ?auto_319155 - MODE
    )
    :vars
    (
      ?auto_319157 - INSTRUMENT
      ?auto_319159 - SATELLITE
      ?auto_319158 - DIRECTION
      ?auto_319156 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_319157 ?auto_319159 ) ( SUPPORTS ?auto_319157 ?auto_319150 ) ( not ( = ?auto_319149 ?auto_319158 ) ) ( HAVE_IMAGE ?auto_319152 ?auto_319153 ) ( not ( = ?auto_319152 ?auto_319149 ) ) ( not ( = ?auto_319152 ?auto_319158 ) ) ( not ( = ?auto_319153 ?auto_319150 ) ) ( CALIBRATION_TARGET ?auto_319157 ?auto_319158 ) ( not ( = ?auto_319158 ?auto_319154 ) ) ( not ( = ?auto_319149 ?auto_319154 ) ) ( not ( = ?auto_319152 ?auto_319154 ) ) ( ON_BOARD ?auto_319156 ?auto_319159 ) ( POWER_ON ?auto_319156 ) ( not ( = ?auto_319157 ?auto_319156 ) ) ( POINTING ?auto_319159 ?auto_319158 ) ( HAVE_IMAGE ?auto_319151 ?auto_319148 ) ( HAVE_IMAGE ?auto_319154 ?auto_319155 ) ( not ( = ?auto_319149 ?auto_319151 ) ) ( not ( = ?auto_319150 ?auto_319148 ) ) ( not ( = ?auto_319150 ?auto_319155 ) ) ( not ( = ?auto_319151 ?auto_319152 ) ) ( not ( = ?auto_319151 ?auto_319154 ) ) ( not ( = ?auto_319151 ?auto_319158 ) ) ( not ( = ?auto_319148 ?auto_319153 ) ) ( not ( = ?auto_319148 ?auto_319155 ) ) ( not ( = ?auto_319153 ?auto_319155 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_319152 ?auto_319153 ?auto_319149 ?auto_319150 )
      ( GET-4IMAGE-VERIFY ?auto_319149 ?auto_319150 ?auto_319151 ?auto_319148 ?auto_319152 ?auto_319153 ?auto_319154 ?auto_319155 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_318987 - DIRECTION
      ?auto_318988 - MODE
      ?auto_318989 - DIRECTION
      ?auto_318986 - MODE
      ?auto_318990 - DIRECTION
      ?auto_318991 - MODE
      ?auto_318992 - DIRECTION
      ?auto_318993 - MODE
    )
    :vars
    (
      ?auto_318995 - INSTRUMENT
      ?auto_318997 - SATELLITE
      ?auto_318996 - DIRECTION
      ?auto_318994 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_318995 ?auto_318997 ) ( SUPPORTS ?auto_318995 ?auto_318988 ) ( not ( = ?auto_318987 ?auto_318996 ) ) ( HAVE_IMAGE ?auto_318992 ?auto_318993 ) ( not ( = ?auto_318992 ?auto_318987 ) ) ( not ( = ?auto_318992 ?auto_318996 ) ) ( not ( = ?auto_318993 ?auto_318988 ) ) ( CALIBRATION_TARGET ?auto_318995 ?auto_318996 ) ( not ( = ?auto_318996 ?auto_318990 ) ) ( not ( = ?auto_318987 ?auto_318990 ) ) ( not ( = ?auto_318992 ?auto_318990 ) ) ( ON_BOARD ?auto_318994 ?auto_318997 ) ( POWER_ON ?auto_318994 ) ( not ( = ?auto_318995 ?auto_318994 ) ) ( POINTING ?auto_318997 ?auto_318996 ) ( HAVE_IMAGE ?auto_318989 ?auto_318986 ) ( HAVE_IMAGE ?auto_318990 ?auto_318991 ) ( not ( = ?auto_318987 ?auto_318989 ) ) ( not ( = ?auto_318988 ?auto_318986 ) ) ( not ( = ?auto_318988 ?auto_318991 ) ) ( not ( = ?auto_318989 ?auto_318990 ) ) ( not ( = ?auto_318989 ?auto_318992 ) ) ( not ( = ?auto_318989 ?auto_318996 ) ) ( not ( = ?auto_318986 ?auto_318991 ) ) ( not ( = ?auto_318986 ?auto_318993 ) ) ( not ( = ?auto_318991 ?auto_318993 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_318992 ?auto_318993 ?auto_318987 ?auto_318988 )
      ( GET-4IMAGE-VERIFY ?auto_318987 ?auto_318988 ?auto_318989 ?auto_318986 ?auto_318990 ?auto_318991 ?auto_318992 ?auto_318993 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_319197 - DIRECTION
      ?auto_319198 - MODE
      ?auto_319199 - DIRECTION
      ?auto_319196 - MODE
      ?auto_319200 - DIRECTION
      ?auto_319201 - MODE
      ?auto_319202 - DIRECTION
      ?auto_319203 - MODE
    )
    :vars
    (
      ?auto_319205 - INSTRUMENT
      ?auto_319208 - SATELLITE
      ?auto_319206 - DIRECTION
      ?auto_319207 - DIRECTION
      ?auto_319209 - MODE
      ?auto_319204 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_319205 ?auto_319208 ) ( SUPPORTS ?auto_319205 ?auto_319198 ) ( not ( = ?auto_319197 ?auto_319206 ) ) ( HAVE_IMAGE ?auto_319207 ?auto_319209 ) ( not ( = ?auto_319207 ?auto_319197 ) ) ( not ( = ?auto_319207 ?auto_319206 ) ) ( not ( = ?auto_319209 ?auto_319198 ) ) ( CALIBRATION_TARGET ?auto_319205 ?auto_319206 ) ( not ( = ?auto_319206 ?auto_319202 ) ) ( not ( = ?auto_319197 ?auto_319202 ) ) ( not ( = ?auto_319207 ?auto_319202 ) ) ( ON_BOARD ?auto_319204 ?auto_319208 ) ( POWER_ON ?auto_319204 ) ( not ( = ?auto_319205 ?auto_319204 ) ) ( POINTING ?auto_319208 ?auto_319206 ) ( HAVE_IMAGE ?auto_319199 ?auto_319196 ) ( HAVE_IMAGE ?auto_319200 ?auto_319201 ) ( HAVE_IMAGE ?auto_319202 ?auto_319203 ) ( not ( = ?auto_319197 ?auto_319199 ) ) ( not ( = ?auto_319197 ?auto_319200 ) ) ( not ( = ?auto_319198 ?auto_319196 ) ) ( not ( = ?auto_319198 ?auto_319201 ) ) ( not ( = ?auto_319198 ?auto_319203 ) ) ( not ( = ?auto_319199 ?auto_319200 ) ) ( not ( = ?auto_319199 ?auto_319202 ) ) ( not ( = ?auto_319199 ?auto_319206 ) ) ( not ( = ?auto_319199 ?auto_319207 ) ) ( not ( = ?auto_319196 ?auto_319201 ) ) ( not ( = ?auto_319196 ?auto_319203 ) ) ( not ( = ?auto_319196 ?auto_319209 ) ) ( not ( = ?auto_319200 ?auto_319202 ) ) ( not ( = ?auto_319200 ?auto_319206 ) ) ( not ( = ?auto_319200 ?auto_319207 ) ) ( not ( = ?auto_319201 ?auto_319203 ) ) ( not ( = ?auto_319201 ?auto_319209 ) ) ( not ( = ?auto_319203 ?auto_319209 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_319207 ?auto_319209 ?auto_319197 ?auto_319198 )
      ( GET-4IMAGE-VERIFY ?auto_319197 ?auto_319198 ?auto_319199 ?auto_319196 ?auto_319200 ?auto_319201 ?auto_319202 ?auto_319203 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_317075 - DIRECTION
      ?auto_317076 - MODE
      ?auto_317077 - DIRECTION
      ?auto_317074 - MODE
      ?auto_317078 - DIRECTION
      ?auto_317079 - MODE
    )
    :vars
    (
      ?auto_317081 - INSTRUMENT
      ?auto_317083 - SATELLITE
      ?auto_317082 - DIRECTION
      ?auto_317084 - DIRECTION
      ?auto_317080 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317081 ?auto_317083 ) ( SUPPORTS ?auto_317081 ?auto_317079 ) ( not ( = ?auto_317078 ?auto_317082 ) ) ( HAVE_IMAGE ?auto_317075 ?auto_317074 ) ( not ( = ?auto_317075 ?auto_317078 ) ) ( not ( = ?auto_317075 ?auto_317082 ) ) ( not ( = ?auto_317074 ?auto_317079 ) ) ( CALIBRATION_TARGET ?auto_317081 ?auto_317082 ) ( not ( = ?auto_317082 ?auto_317084 ) ) ( not ( = ?auto_317078 ?auto_317084 ) ) ( not ( = ?auto_317075 ?auto_317084 ) ) ( ON_BOARD ?auto_317080 ?auto_317083 ) ( POWER_ON ?auto_317080 ) ( not ( = ?auto_317081 ?auto_317080 ) ) ( POINTING ?auto_317083 ?auto_317082 ) ( HAVE_IMAGE ?auto_317075 ?auto_317076 ) ( HAVE_IMAGE ?auto_317077 ?auto_317074 ) ( not ( = ?auto_317075 ?auto_317077 ) ) ( not ( = ?auto_317076 ?auto_317074 ) ) ( not ( = ?auto_317076 ?auto_317079 ) ) ( not ( = ?auto_317077 ?auto_317078 ) ) ( not ( = ?auto_317077 ?auto_317082 ) ) ( not ( = ?auto_317077 ?auto_317084 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317075 ?auto_317074 ?auto_317078 ?auto_317079 )
      ( GET-3IMAGE-VERIFY ?auto_317075 ?auto_317076 ?auto_317077 ?auto_317074 ?auto_317078 ?auto_317079 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_317307 - DIRECTION
      ?auto_317308 - MODE
      ?auto_317309 - DIRECTION
      ?auto_317306 - MODE
      ?auto_317310 - DIRECTION
      ?auto_317311 - MODE
    )
    :vars
    (
      ?auto_317313 - INSTRUMENT
      ?auto_317315 - SATELLITE
      ?auto_317314 - DIRECTION
      ?auto_317316 - DIRECTION
      ?auto_317312 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317313 ?auto_317315 ) ( SUPPORTS ?auto_317313 ?auto_317308 ) ( not ( = ?auto_317307 ?auto_317314 ) ) ( HAVE_IMAGE ?auto_317309 ?auto_317311 ) ( not ( = ?auto_317309 ?auto_317307 ) ) ( not ( = ?auto_317309 ?auto_317314 ) ) ( not ( = ?auto_317311 ?auto_317308 ) ) ( CALIBRATION_TARGET ?auto_317313 ?auto_317314 ) ( not ( = ?auto_317314 ?auto_317316 ) ) ( not ( = ?auto_317307 ?auto_317316 ) ) ( not ( = ?auto_317309 ?auto_317316 ) ) ( ON_BOARD ?auto_317312 ?auto_317315 ) ( POWER_ON ?auto_317312 ) ( not ( = ?auto_317313 ?auto_317312 ) ) ( POINTING ?auto_317315 ?auto_317314 ) ( HAVE_IMAGE ?auto_317309 ?auto_317306 ) ( HAVE_IMAGE ?auto_317310 ?auto_317311 ) ( not ( = ?auto_317307 ?auto_317310 ) ) ( not ( = ?auto_317308 ?auto_317306 ) ) ( not ( = ?auto_317309 ?auto_317310 ) ) ( not ( = ?auto_317306 ?auto_317311 ) ) ( not ( = ?auto_317310 ?auto_317314 ) ) ( not ( = ?auto_317310 ?auto_317316 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317309 ?auto_317311 ?auto_317307 ?auto_317308 )
      ( GET-3IMAGE-VERIFY ?auto_317307 ?auto_317308 ?auto_317309 ?auto_317306 ?auto_317310 ?auto_317311 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_318949 - DIRECTION
      ?auto_318950 - MODE
      ?auto_318951 - DIRECTION
      ?auto_318948 - MODE
      ?auto_318952 - DIRECTION
      ?auto_318953 - MODE
      ?auto_318954 - DIRECTION
      ?auto_318955 - MODE
    )
    :vars
    (
      ?auto_318957 - INSTRUMENT
      ?auto_318959 - SATELLITE
      ?auto_318958 - DIRECTION
      ?auto_318956 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_318957 ?auto_318959 ) ( SUPPORTS ?auto_318957 ?auto_318950 ) ( not ( = ?auto_318949 ?auto_318958 ) ) ( HAVE_IMAGE ?auto_318952 ?auto_318948 ) ( not ( = ?auto_318952 ?auto_318949 ) ) ( not ( = ?auto_318952 ?auto_318958 ) ) ( not ( = ?auto_318948 ?auto_318950 ) ) ( CALIBRATION_TARGET ?auto_318957 ?auto_318958 ) ( not ( = ?auto_318958 ?auto_318954 ) ) ( not ( = ?auto_318949 ?auto_318954 ) ) ( not ( = ?auto_318952 ?auto_318954 ) ) ( ON_BOARD ?auto_318956 ?auto_318959 ) ( POWER_ON ?auto_318956 ) ( not ( = ?auto_318957 ?auto_318956 ) ) ( POINTING ?auto_318959 ?auto_318958 ) ( HAVE_IMAGE ?auto_318951 ?auto_318948 ) ( HAVE_IMAGE ?auto_318952 ?auto_318953 ) ( HAVE_IMAGE ?auto_318954 ?auto_318955 ) ( not ( = ?auto_318949 ?auto_318951 ) ) ( not ( = ?auto_318950 ?auto_318953 ) ) ( not ( = ?auto_318950 ?auto_318955 ) ) ( not ( = ?auto_318951 ?auto_318952 ) ) ( not ( = ?auto_318951 ?auto_318954 ) ) ( not ( = ?auto_318951 ?auto_318958 ) ) ( not ( = ?auto_318948 ?auto_318953 ) ) ( not ( = ?auto_318948 ?auto_318955 ) ) ( not ( = ?auto_318953 ?auto_318955 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_318952 ?auto_318948 ?auto_318949 ?auto_318950 )
      ( GET-4IMAGE-VERIFY ?auto_318949 ?auto_318950 ?auto_318951 ?auto_318948 ?auto_318952 ?auto_318953 ?auto_318954 ?auto_318955 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_319854 - DIRECTION
      ?auto_319855 - MODE
      ?auto_319856 - DIRECTION
      ?auto_319853 - MODE
      ?auto_319857 - DIRECTION
      ?auto_319858 - MODE
    )
    :vars
    (
      ?auto_319859 - INSTRUMENT
      ?auto_319860 - SATELLITE
      ?auto_319861 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_319859 ?auto_319860 ) ( SUPPORTS ?auto_319859 ?auto_319853 ) ( POINTING ?auto_319860 ?auto_319861 ) ( not ( = ?auto_319856 ?auto_319861 ) ) ( HAVE_IMAGE ?auto_319854 ?auto_319855 ) ( not ( = ?auto_319854 ?auto_319856 ) ) ( not ( = ?auto_319854 ?auto_319861 ) ) ( not ( = ?auto_319855 ?auto_319853 ) ) ( CALIBRATION_TARGET ?auto_319859 ?auto_319861 ) ( POWER_AVAIL ?auto_319860 ) ( HAVE_IMAGE ?auto_319857 ?auto_319858 ) ( not ( = ?auto_319854 ?auto_319857 ) ) ( not ( = ?auto_319855 ?auto_319858 ) ) ( not ( = ?auto_319856 ?auto_319857 ) ) ( not ( = ?auto_319853 ?auto_319858 ) ) ( not ( = ?auto_319857 ?auto_319861 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_319854 ?auto_319855 ?auto_319856 ?auto_319853 )
      ( GET-3IMAGE-VERIFY ?auto_319854 ?auto_319855 ?auto_319856 ?auto_319853 ?auto_319857 ?auto_319858 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_321656 - DIRECTION
      ?auto_321657 - MODE
      ?auto_321658 - DIRECTION
      ?auto_321655 - MODE
      ?auto_321659 - DIRECTION
      ?auto_321660 - MODE
      ?auto_321661 - DIRECTION
      ?auto_321662 - MODE
    )
    :vars
    (
      ?auto_321663 - INSTRUMENT
      ?auto_321664 - SATELLITE
      ?auto_321665 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_321663 ?auto_321664 ) ( SUPPORTS ?auto_321663 ?auto_321657 ) ( POINTING ?auto_321664 ?auto_321665 ) ( not ( = ?auto_321656 ?auto_321665 ) ) ( HAVE_IMAGE ?auto_321661 ?auto_321660 ) ( not ( = ?auto_321661 ?auto_321656 ) ) ( not ( = ?auto_321661 ?auto_321665 ) ) ( not ( = ?auto_321660 ?auto_321657 ) ) ( CALIBRATION_TARGET ?auto_321663 ?auto_321665 ) ( POWER_AVAIL ?auto_321664 ) ( HAVE_IMAGE ?auto_321658 ?auto_321655 ) ( HAVE_IMAGE ?auto_321659 ?auto_321660 ) ( HAVE_IMAGE ?auto_321661 ?auto_321662 ) ( not ( = ?auto_321656 ?auto_321658 ) ) ( not ( = ?auto_321656 ?auto_321659 ) ) ( not ( = ?auto_321657 ?auto_321655 ) ) ( not ( = ?auto_321657 ?auto_321662 ) ) ( not ( = ?auto_321658 ?auto_321659 ) ) ( not ( = ?auto_321658 ?auto_321661 ) ) ( not ( = ?auto_321658 ?auto_321665 ) ) ( not ( = ?auto_321655 ?auto_321660 ) ) ( not ( = ?auto_321655 ?auto_321662 ) ) ( not ( = ?auto_321659 ?auto_321661 ) ) ( not ( = ?auto_321659 ?auto_321665 ) ) ( not ( = ?auto_321660 ?auto_321662 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_321661 ?auto_321660 ?auto_321656 ?auto_321657 )
      ( GET-4IMAGE-VERIFY ?auto_321656 ?auto_321657 ?auto_321658 ?auto_321655 ?auto_321659 ?auto_321660 ?auto_321661 ?auto_321662 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_322286 - DIRECTION
      ?auto_322287 - MODE
      ?auto_322288 - DIRECTION
      ?auto_322285 - MODE
      ?auto_322289 - DIRECTION
      ?auto_322290 - MODE
    )
    :vars
    (
      ?auto_322294 - INSTRUMENT
      ?auto_322293 - SATELLITE
      ?auto_322291 - DIRECTION
      ?auto_322292 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_322294 ?auto_322293 ) ( SUPPORTS ?auto_322294 ?auto_322290 ) ( not ( = ?auto_322289 ?auto_322291 ) ) ( HAVE_IMAGE ?auto_322286 ?auto_322285 ) ( not ( = ?auto_322286 ?auto_322289 ) ) ( not ( = ?auto_322286 ?auto_322291 ) ) ( not ( = ?auto_322285 ?auto_322290 ) ) ( CALIBRATION_TARGET ?auto_322294 ?auto_322291 ) ( POWER_AVAIL ?auto_322293 ) ( POINTING ?auto_322293 ?auto_322292 ) ( not ( = ?auto_322291 ?auto_322292 ) ) ( not ( = ?auto_322289 ?auto_322292 ) ) ( not ( = ?auto_322286 ?auto_322292 ) ) ( HAVE_IMAGE ?auto_322286 ?auto_322287 ) ( HAVE_IMAGE ?auto_322288 ?auto_322285 ) ( not ( = ?auto_322286 ?auto_322288 ) ) ( not ( = ?auto_322287 ?auto_322285 ) ) ( not ( = ?auto_322287 ?auto_322290 ) ) ( not ( = ?auto_322288 ?auto_322289 ) ) ( not ( = ?auto_322288 ?auto_322291 ) ) ( not ( = ?auto_322288 ?auto_322292 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_322286 ?auto_322285 ?auto_322289 ?auto_322290 )
      ( GET-3IMAGE-VERIFY ?auto_322286 ?auto_322287 ?auto_322288 ?auto_322285 ?auto_322289 ?auto_322290 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_322382 - DIRECTION
      ?auto_322383 - MODE
      ?auto_322384 - DIRECTION
      ?auto_322381 - MODE
      ?auto_322385 - DIRECTION
      ?auto_322386 - MODE
    )
    :vars
    (
      ?auto_322390 - INSTRUMENT
      ?auto_322389 - SATELLITE
      ?auto_322388 - DIRECTION
      ?auto_322387 - DIRECTION
      ?auto_322391 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_322390 ?auto_322389 ) ( SUPPORTS ?auto_322390 ?auto_322381 ) ( not ( = ?auto_322384 ?auto_322388 ) ) ( HAVE_IMAGE ?auto_322387 ?auto_322391 ) ( not ( = ?auto_322387 ?auto_322384 ) ) ( not ( = ?auto_322387 ?auto_322388 ) ) ( not ( = ?auto_322391 ?auto_322381 ) ) ( CALIBRATION_TARGET ?auto_322390 ?auto_322388 ) ( POWER_AVAIL ?auto_322389 ) ( POINTING ?auto_322389 ?auto_322385 ) ( not ( = ?auto_322388 ?auto_322385 ) ) ( not ( = ?auto_322384 ?auto_322385 ) ) ( not ( = ?auto_322387 ?auto_322385 ) ) ( HAVE_IMAGE ?auto_322382 ?auto_322383 ) ( HAVE_IMAGE ?auto_322385 ?auto_322386 ) ( not ( = ?auto_322382 ?auto_322384 ) ) ( not ( = ?auto_322382 ?auto_322385 ) ) ( not ( = ?auto_322382 ?auto_322388 ) ) ( not ( = ?auto_322382 ?auto_322387 ) ) ( not ( = ?auto_322383 ?auto_322381 ) ) ( not ( = ?auto_322383 ?auto_322386 ) ) ( not ( = ?auto_322383 ?auto_322391 ) ) ( not ( = ?auto_322381 ?auto_322386 ) ) ( not ( = ?auto_322386 ?auto_322391 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_322387 ?auto_322391 ?auto_322384 ?auto_322381 )
      ( GET-3IMAGE-VERIFY ?auto_322382 ?auto_322383 ?auto_322384 ?auto_322381 ?auto_322385 ?auto_322386 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_322693 - DIRECTION
      ?auto_322694 - MODE
      ?auto_322695 - DIRECTION
      ?auto_322692 - MODE
      ?auto_322696 - DIRECTION
      ?auto_322697 - MODE
      ?auto_322698 - DIRECTION
      ?auto_322699 - MODE
    )
    :vars
    (
      ?auto_322703 - INSTRUMENT
      ?auto_322702 - SATELLITE
      ?auto_322700 - DIRECTION
      ?auto_322701 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_322703 ?auto_322702 ) ( SUPPORTS ?auto_322703 ?auto_322697 ) ( not ( = ?auto_322696 ?auto_322700 ) ) ( HAVE_IMAGE ?auto_322698 ?auto_322694 ) ( not ( = ?auto_322698 ?auto_322696 ) ) ( not ( = ?auto_322698 ?auto_322700 ) ) ( not ( = ?auto_322694 ?auto_322697 ) ) ( CALIBRATION_TARGET ?auto_322703 ?auto_322700 ) ( POWER_AVAIL ?auto_322702 ) ( POINTING ?auto_322702 ?auto_322701 ) ( not ( = ?auto_322700 ?auto_322701 ) ) ( not ( = ?auto_322696 ?auto_322701 ) ) ( not ( = ?auto_322698 ?auto_322701 ) ) ( HAVE_IMAGE ?auto_322693 ?auto_322694 ) ( HAVE_IMAGE ?auto_322695 ?auto_322692 ) ( HAVE_IMAGE ?auto_322698 ?auto_322699 ) ( not ( = ?auto_322693 ?auto_322695 ) ) ( not ( = ?auto_322693 ?auto_322696 ) ) ( not ( = ?auto_322693 ?auto_322698 ) ) ( not ( = ?auto_322693 ?auto_322700 ) ) ( not ( = ?auto_322693 ?auto_322701 ) ) ( not ( = ?auto_322694 ?auto_322692 ) ) ( not ( = ?auto_322694 ?auto_322699 ) ) ( not ( = ?auto_322695 ?auto_322696 ) ) ( not ( = ?auto_322695 ?auto_322698 ) ) ( not ( = ?auto_322695 ?auto_322700 ) ) ( not ( = ?auto_322695 ?auto_322701 ) ) ( not ( = ?auto_322692 ?auto_322697 ) ) ( not ( = ?auto_322692 ?auto_322699 ) ) ( not ( = ?auto_322697 ?auto_322699 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_322698 ?auto_322694 ?auto_322696 ?auto_322697 )
      ( GET-4IMAGE-VERIFY ?auto_322693 ?auto_322694 ?auto_322695 ?auto_322692 ?auto_322696 ?auto_322697 ?auto_322698 ?auto_322699 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_322740 - DIRECTION
      ?auto_322741 - MODE
      ?auto_322742 - DIRECTION
      ?auto_322739 - MODE
      ?auto_322743 - DIRECTION
      ?auto_322744 - MODE
      ?auto_322745 - DIRECTION
      ?auto_322746 - MODE
    )
    :vars
    (
      ?auto_322749 - INSTRUMENT
      ?auto_322748 - SATELLITE
      ?auto_322747 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_322749 ?auto_322748 ) ( SUPPORTS ?auto_322749 ?auto_322746 ) ( not ( = ?auto_322745 ?auto_322747 ) ) ( HAVE_IMAGE ?auto_322740 ?auto_322744 ) ( not ( = ?auto_322740 ?auto_322745 ) ) ( not ( = ?auto_322740 ?auto_322747 ) ) ( not ( = ?auto_322744 ?auto_322746 ) ) ( CALIBRATION_TARGET ?auto_322749 ?auto_322747 ) ( POWER_AVAIL ?auto_322748 ) ( POINTING ?auto_322748 ?auto_322742 ) ( not ( = ?auto_322747 ?auto_322742 ) ) ( not ( = ?auto_322745 ?auto_322742 ) ) ( not ( = ?auto_322740 ?auto_322742 ) ) ( HAVE_IMAGE ?auto_322740 ?auto_322741 ) ( HAVE_IMAGE ?auto_322742 ?auto_322739 ) ( HAVE_IMAGE ?auto_322743 ?auto_322744 ) ( not ( = ?auto_322740 ?auto_322743 ) ) ( not ( = ?auto_322741 ?auto_322739 ) ) ( not ( = ?auto_322741 ?auto_322744 ) ) ( not ( = ?auto_322741 ?auto_322746 ) ) ( not ( = ?auto_322742 ?auto_322743 ) ) ( not ( = ?auto_322739 ?auto_322744 ) ) ( not ( = ?auto_322739 ?auto_322746 ) ) ( not ( = ?auto_322743 ?auto_322745 ) ) ( not ( = ?auto_322743 ?auto_322747 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_322740 ?auto_322744 ?auto_322745 ?auto_322746 )
      ( GET-4IMAGE-VERIFY ?auto_322740 ?auto_322741 ?auto_322742 ?auto_322739 ?auto_322743 ?auto_322744 ?auto_322745 ?auto_322746 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_322899 - DIRECTION
      ?auto_322900 - MODE
      ?auto_322901 - DIRECTION
      ?auto_322898 - MODE
      ?auto_322902 - DIRECTION
      ?auto_322903 - MODE
      ?auto_322904 - DIRECTION
      ?auto_322905 - MODE
    )
    :vars
    (
      ?auto_322909 - INSTRUMENT
      ?auto_322908 - SATELLITE
      ?auto_322906 - DIRECTION
      ?auto_322907 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_322909 ?auto_322908 ) ( SUPPORTS ?auto_322909 ?auto_322898 ) ( not ( = ?auto_322901 ?auto_322906 ) ) ( HAVE_IMAGE ?auto_322904 ?auto_322903 ) ( not ( = ?auto_322904 ?auto_322901 ) ) ( not ( = ?auto_322904 ?auto_322906 ) ) ( not ( = ?auto_322903 ?auto_322898 ) ) ( CALIBRATION_TARGET ?auto_322909 ?auto_322906 ) ( POWER_AVAIL ?auto_322908 ) ( POINTING ?auto_322908 ?auto_322907 ) ( not ( = ?auto_322906 ?auto_322907 ) ) ( not ( = ?auto_322901 ?auto_322907 ) ) ( not ( = ?auto_322904 ?auto_322907 ) ) ( HAVE_IMAGE ?auto_322899 ?auto_322900 ) ( HAVE_IMAGE ?auto_322902 ?auto_322903 ) ( HAVE_IMAGE ?auto_322904 ?auto_322905 ) ( not ( = ?auto_322899 ?auto_322901 ) ) ( not ( = ?auto_322899 ?auto_322902 ) ) ( not ( = ?auto_322899 ?auto_322904 ) ) ( not ( = ?auto_322899 ?auto_322906 ) ) ( not ( = ?auto_322899 ?auto_322907 ) ) ( not ( = ?auto_322900 ?auto_322898 ) ) ( not ( = ?auto_322900 ?auto_322903 ) ) ( not ( = ?auto_322900 ?auto_322905 ) ) ( not ( = ?auto_322901 ?auto_322902 ) ) ( not ( = ?auto_322898 ?auto_322905 ) ) ( not ( = ?auto_322902 ?auto_322904 ) ) ( not ( = ?auto_322902 ?auto_322906 ) ) ( not ( = ?auto_322902 ?auto_322907 ) ) ( not ( = ?auto_322903 ?auto_322905 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_322904 ?auto_322903 ?auto_322901 ?auto_322898 )
      ( GET-4IMAGE-VERIFY ?auto_322899 ?auto_322900 ?auto_322901 ?auto_322898 ?auto_322902 ?auto_322903 ?auto_322904 ?auto_322905 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_322946 - DIRECTION
      ?auto_322947 - MODE
      ?auto_322948 - DIRECTION
      ?auto_322945 - MODE
      ?auto_322949 - DIRECTION
      ?auto_322950 - MODE
      ?auto_322951 - DIRECTION
      ?auto_322952 - MODE
    )
    :vars
    (
      ?auto_322955 - INSTRUMENT
      ?auto_322954 - SATELLITE
      ?auto_322953 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_322955 ?auto_322954 ) ( SUPPORTS ?auto_322955 ?auto_322945 ) ( not ( = ?auto_322948 ?auto_322953 ) ) ( HAVE_IMAGE ?auto_322946 ?auto_322952 ) ( not ( = ?auto_322946 ?auto_322948 ) ) ( not ( = ?auto_322946 ?auto_322953 ) ) ( not ( = ?auto_322952 ?auto_322945 ) ) ( CALIBRATION_TARGET ?auto_322955 ?auto_322953 ) ( POWER_AVAIL ?auto_322954 ) ( POINTING ?auto_322954 ?auto_322949 ) ( not ( = ?auto_322953 ?auto_322949 ) ) ( not ( = ?auto_322948 ?auto_322949 ) ) ( not ( = ?auto_322946 ?auto_322949 ) ) ( HAVE_IMAGE ?auto_322946 ?auto_322947 ) ( HAVE_IMAGE ?auto_322949 ?auto_322950 ) ( HAVE_IMAGE ?auto_322951 ?auto_322952 ) ( not ( = ?auto_322946 ?auto_322951 ) ) ( not ( = ?auto_322947 ?auto_322945 ) ) ( not ( = ?auto_322947 ?auto_322950 ) ) ( not ( = ?auto_322947 ?auto_322952 ) ) ( not ( = ?auto_322948 ?auto_322951 ) ) ( not ( = ?auto_322945 ?auto_322950 ) ) ( not ( = ?auto_322949 ?auto_322951 ) ) ( not ( = ?auto_322950 ?auto_322952 ) ) ( not ( = ?auto_322951 ?auto_322953 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_322946 ?auto_322952 ?auto_322948 ?auto_322945 )
      ( GET-4IMAGE-VERIFY ?auto_322946 ?auto_322947 ?auto_322948 ?auto_322945 ?auto_322949 ?auto_322950 ?auto_322951 ?auto_322952 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_323095 - DIRECTION
      ?auto_323096 - MODE
      ?auto_323097 - DIRECTION
      ?auto_323094 - MODE
      ?auto_323098 - DIRECTION
      ?auto_323099 - MODE
      ?auto_323100 - DIRECTION
      ?auto_323101 - MODE
    )
    :vars
    (
      ?auto_323104 - INSTRUMENT
      ?auto_323103 - SATELLITE
      ?auto_323102 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_323104 ?auto_323103 ) ( SUPPORTS ?auto_323104 ?auto_323101 ) ( not ( = ?auto_323100 ?auto_323102 ) ) ( HAVE_IMAGE ?auto_323097 ?auto_323094 ) ( not ( = ?auto_323097 ?auto_323100 ) ) ( not ( = ?auto_323097 ?auto_323102 ) ) ( not ( = ?auto_323094 ?auto_323101 ) ) ( CALIBRATION_TARGET ?auto_323104 ?auto_323102 ) ( POWER_AVAIL ?auto_323103 ) ( POINTING ?auto_323103 ?auto_323095 ) ( not ( = ?auto_323102 ?auto_323095 ) ) ( not ( = ?auto_323100 ?auto_323095 ) ) ( not ( = ?auto_323097 ?auto_323095 ) ) ( HAVE_IMAGE ?auto_323095 ?auto_323096 ) ( HAVE_IMAGE ?auto_323098 ?auto_323099 ) ( not ( = ?auto_323095 ?auto_323098 ) ) ( not ( = ?auto_323096 ?auto_323094 ) ) ( not ( = ?auto_323096 ?auto_323099 ) ) ( not ( = ?auto_323096 ?auto_323101 ) ) ( not ( = ?auto_323097 ?auto_323098 ) ) ( not ( = ?auto_323094 ?auto_323099 ) ) ( not ( = ?auto_323098 ?auto_323100 ) ) ( not ( = ?auto_323098 ?auto_323102 ) ) ( not ( = ?auto_323099 ?auto_323101 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_323097 ?auto_323094 ?auto_323100 ?auto_323101 )
      ( GET-4IMAGE-VERIFY ?auto_323095 ?auto_323096 ?auto_323097 ?auto_323094 ?auto_323098 ?auto_323099 ?auto_323100 ?auto_323101 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_323198 - DIRECTION
      ?auto_323199 - MODE
      ?auto_323200 - DIRECTION
      ?auto_323197 - MODE
      ?auto_323201 - DIRECTION
      ?auto_323202 - MODE
      ?auto_323203 - DIRECTION
      ?auto_323204 - MODE
    )
    :vars
    (
      ?auto_323207 - INSTRUMENT
      ?auto_323206 - SATELLITE
      ?auto_323205 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_323207 ?auto_323206 ) ( SUPPORTS ?auto_323207 ?auto_323202 ) ( not ( = ?auto_323201 ?auto_323205 ) ) ( HAVE_IMAGE ?auto_323203 ?auto_323204 ) ( not ( = ?auto_323203 ?auto_323201 ) ) ( not ( = ?auto_323203 ?auto_323205 ) ) ( not ( = ?auto_323204 ?auto_323202 ) ) ( CALIBRATION_TARGET ?auto_323207 ?auto_323205 ) ( POWER_AVAIL ?auto_323206 ) ( POINTING ?auto_323206 ?auto_323200 ) ( not ( = ?auto_323205 ?auto_323200 ) ) ( not ( = ?auto_323201 ?auto_323200 ) ) ( not ( = ?auto_323203 ?auto_323200 ) ) ( HAVE_IMAGE ?auto_323198 ?auto_323199 ) ( HAVE_IMAGE ?auto_323200 ?auto_323197 ) ( not ( = ?auto_323198 ?auto_323200 ) ) ( not ( = ?auto_323198 ?auto_323201 ) ) ( not ( = ?auto_323198 ?auto_323203 ) ) ( not ( = ?auto_323198 ?auto_323205 ) ) ( not ( = ?auto_323199 ?auto_323197 ) ) ( not ( = ?auto_323199 ?auto_323202 ) ) ( not ( = ?auto_323199 ?auto_323204 ) ) ( not ( = ?auto_323197 ?auto_323202 ) ) ( not ( = ?auto_323197 ?auto_323204 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_323203 ?auto_323204 ?auto_323201 ?auto_323202 )
      ( GET-4IMAGE-VERIFY ?auto_323198 ?auto_323199 ?auto_323200 ?auto_323197 ?auto_323201 ?auto_323202 ?auto_323203 ?auto_323204 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_323335 - DIRECTION
      ?auto_323336 - MODE
      ?auto_323337 - DIRECTION
      ?auto_323334 - MODE
      ?auto_323338 - DIRECTION
      ?auto_323339 - MODE
      ?auto_323340 - DIRECTION
      ?auto_323341 - MODE
    )
    :vars
    (
      ?auto_323344 - INSTRUMENT
      ?auto_323343 - SATELLITE
      ?auto_323342 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_323344 ?auto_323343 ) ( SUPPORTS ?auto_323344 ?auto_323334 ) ( not ( = ?auto_323337 ?auto_323342 ) ) ( HAVE_IMAGE ?auto_323340 ?auto_323339 ) ( not ( = ?auto_323340 ?auto_323337 ) ) ( not ( = ?auto_323340 ?auto_323342 ) ) ( not ( = ?auto_323339 ?auto_323334 ) ) ( CALIBRATION_TARGET ?auto_323344 ?auto_323342 ) ( POWER_AVAIL ?auto_323343 ) ( POINTING ?auto_323343 ?auto_323335 ) ( not ( = ?auto_323342 ?auto_323335 ) ) ( not ( = ?auto_323337 ?auto_323335 ) ) ( not ( = ?auto_323340 ?auto_323335 ) ) ( HAVE_IMAGE ?auto_323335 ?auto_323336 ) ( HAVE_IMAGE ?auto_323338 ?auto_323339 ) ( HAVE_IMAGE ?auto_323340 ?auto_323341 ) ( not ( = ?auto_323335 ?auto_323338 ) ) ( not ( = ?auto_323336 ?auto_323334 ) ) ( not ( = ?auto_323336 ?auto_323339 ) ) ( not ( = ?auto_323336 ?auto_323341 ) ) ( not ( = ?auto_323337 ?auto_323338 ) ) ( not ( = ?auto_323334 ?auto_323341 ) ) ( not ( = ?auto_323338 ?auto_323340 ) ) ( not ( = ?auto_323338 ?auto_323342 ) ) ( not ( = ?auto_323339 ?auto_323341 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_323340 ?auto_323339 ?auto_323337 ?auto_323334 )
      ( GET-4IMAGE-VERIFY ?auto_323335 ?auto_323336 ?auto_323337 ?auto_323334 ?auto_323338 ?auto_323339 ?auto_323340 ?auto_323341 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_324857 - DIRECTION
      ?auto_324858 - MODE
      ?auto_324859 - DIRECTION
      ?auto_324856 - MODE
      ?auto_324860 - DIRECTION
      ?auto_324861 - MODE
    )
    :vars
    (
      ?auto_324865 - INSTRUMENT
      ?auto_324866 - SATELLITE
      ?auto_324863 - DIRECTION
      ?auto_324864 - DIRECTION
      ?auto_324862 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_324865 ?auto_324866 ) ( SUPPORTS ?auto_324865 ?auto_324856 ) ( not ( = ?auto_324859 ?auto_324863 ) ) ( HAVE_IMAGE ?auto_324857 ?auto_324861 ) ( not ( = ?auto_324857 ?auto_324859 ) ) ( not ( = ?auto_324857 ?auto_324863 ) ) ( not ( = ?auto_324861 ?auto_324856 ) ) ( CALIBRATION_TARGET ?auto_324865 ?auto_324863 ) ( POINTING ?auto_324866 ?auto_324864 ) ( not ( = ?auto_324863 ?auto_324864 ) ) ( not ( = ?auto_324859 ?auto_324864 ) ) ( not ( = ?auto_324857 ?auto_324864 ) ) ( ON_BOARD ?auto_324862 ?auto_324866 ) ( POWER_ON ?auto_324862 ) ( not ( = ?auto_324865 ?auto_324862 ) ) ( HAVE_IMAGE ?auto_324857 ?auto_324858 ) ( HAVE_IMAGE ?auto_324860 ?auto_324861 ) ( not ( = ?auto_324857 ?auto_324860 ) ) ( not ( = ?auto_324858 ?auto_324856 ) ) ( not ( = ?auto_324858 ?auto_324861 ) ) ( not ( = ?auto_324859 ?auto_324860 ) ) ( not ( = ?auto_324860 ?auto_324863 ) ) ( not ( = ?auto_324860 ?auto_324864 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_324857 ?auto_324861 ?auto_324859 ?auto_324856 )
      ( GET-3IMAGE-VERIFY ?auto_324857 ?auto_324858 ?auto_324859 ?auto_324856 ?auto_324860 ?auto_324861 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_325098 - DIRECTION
      ?auto_325099 - MODE
      ?auto_325100 - DIRECTION
      ?auto_325097 - MODE
      ?auto_325101 - DIRECTION
      ?auto_325102 - MODE
    )
    :vars
    (
      ?auto_325107 - INSTRUMENT
      ?auto_325108 - SATELLITE
      ?auto_325104 - DIRECTION
      ?auto_325105 - DIRECTION
      ?auto_325106 - MODE
      ?auto_325103 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_325107 ?auto_325108 ) ( SUPPORTS ?auto_325107 ?auto_325099 ) ( not ( = ?auto_325098 ?auto_325104 ) ) ( HAVE_IMAGE ?auto_325105 ?auto_325106 ) ( not ( = ?auto_325105 ?auto_325098 ) ) ( not ( = ?auto_325105 ?auto_325104 ) ) ( not ( = ?auto_325106 ?auto_325099 ) ) ( CALIBRATION_TARGET ?auto_325107 ?auto_325104 ) ( POINTING ?auto_325108 ?auto_325100 ) ( not ( = ?auto_325104 ?auto_325100 ) ) ( not ( = ?auto_325098 ?auto_325100 ) ) ( not ( = ?auto_325105 ?auto_325100 ) ) ( ON_BOARD ?auto_325103 ?auto_325108 ) ( POWER_ON ?auto_325103 ) ( not ( = ?auto_325107 ?auto_325103 ) ) ( HAVE_IMAGE ?auto_325100 ?auto_325097 ) ( HAVE_IMAGE ?auto_325101 ?auto_325102 ) ( not ( = ?auto_325098 ?auto_325101 ) ) ( not ( = ?auto_325099 ?auto_325097 ) ) ( not ( = ?auto_325099 ?auto_325102 ) ) ( not ( = ?auto_325100 ?auto_325101 ) ) ( not ( = ?auto_325097 ?auto_325102 ) ) ( not ( = ?auto_325097 ?auto_325106 ) ) ( not ( = ?auto_325101 ?auto_325104 ) ) ( not ( = ?auto_325101 ?auto_325105 ) ) ( not ( = ?auto_325102 ?auto_325106 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_325105 ?auto_325106 ?auto_325098 ?auto_325099 )
      ( GET-3IMAGE-VERIFY ?auto_325098 ?auto_325099 ?auto_325100 ?auto_325097 ?auto_325101 ?auto_325102 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_325232 - DIRECTION
      ?auto_325233 - MODE
      ?auto_325234 - DIRECTION
      ?auto_325231 - MODE
      ?auto_325235 - DIRECTION
      ?auto_325236 - MODE
      ?auto_325237 - DIRECTION
      ?auto_325238 - MODE
    )
    :vars
    (
      ?auto_325242 - INSTRUMENT
      ?auto_325243 - SATELLITE
      ?auto_325240 - DIRECTION
      ?auto_325241 - DIRECTION
      ?auto_325239 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_325242 ?auto_325243 ) ( SUPPORTS ?auto_325242 ?auto_325238 ) ( not ( = ?auto_325237 ?auto_325240 ) ) ( HAVE_IMAGE ?auto_325232 ?auto_325231 ) ( not ( = ?auto_325232 ?auto_325237 ) ) ( not ( = ?auto_325232 ?auto_325240 ) ) ( not ( = ?auto_325231 ?auto_325238 ) ) ( CALIBRATION_TARGET ?auto_325242 ?auto_325240 ) ( POINTING ?auto_325243 ?auto_325241 ) ( not ( = ?auto_325240 ?auto_325241 ) ) ( not ( = ?auto_325237 ?auto_325241 ) ) ( not ( = ?auto_325232 ?auto_325241 ) ) ( ON_BOARD ?auto_325239 ?auto_325243 ) ( POWER_ON ?auto_325239 ) ( not ( = ?auto_325242 ?auto_325239 ) ) ( HAVE_IMAGE ?auto_325232 ?auto_325233 ) ( HAVE_IMAGE ?auto_325234 ?auto_325231 ) ( HAVE_IMAGE ?auto_325235 ?auto_325236 ) ( not ( = ?auto_325232 ?auto_325234 ) ) ( not ( = ?auto_325232 ?auto_325235 ) ) ( not ( = ?auto_325233 ?auto_325231 ) ) ( not ( = ?auto_325233 ?auto_325236 ) ) ( not ( = ?auto_325233 ?auto_325238 ) ) ( not ( = ?auto_325234 ?auto_325235 ) ) ( not ( = ?auto_325234 ?auto_325237 ) ) ( not ( = ?auto_325234 ?auto_325240 ) ) ( not ( = ?auto_325234 ?auto_325241 ) ) ( not ( = ?auto_325231 ?auto_325236 ) ) ( not ( = ?auto_325235 ?auto_325237 ) ) ( not ( = ?auto_325235 ?auto_325240 ) ) ( not ( = ?auto_325235 ?auto_325241 ) ) ( not ( = ?auto_325236 ?auto_325238 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_325232 ?auto_325231 ?auto_325237 ?auto_325238 )
      ( GET-4IMAGE-VERIFY ?auto_325232 ?auto_325233 ?auto_325234 ?auto_325231 ?auto_325235 ?auto_325236 ?auto_325237 ?auto_325238 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_325321 - DIRECTION
      ?auto_325322 - MODE
      ?auto_325323 - DIRECTION
      ?auto_325320 - MODE
      ?auto_325324 - DIRECTION
      ?auto_325325 - MODE
      ?auto_325326 - DIRECTION
      ?auto_325327 - MODE
    )
    :vars
    (
      ?auto_325330 - INSTRUMENT
      ?auto_325331 - SATELLITE
      ?auto_325329 - DIRECTION
      ?auto_325328 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_325330 ?auto_325331 ) ( SUPPORTS ?auto_325330 ?auto_325327 ) ( not ( = ?auto_325326 ?auto_325329 ) ) ( HAVE_IMAGE ?auto_325321 ?auto_325325 ) ( not ( = ?auto_325321 ?auto_325326 ) ) ( not ( = ?auto_325321 ?auto_325329 ) ) ( not ( = ?auto_325325 ?auto_325327 ) ) ( CALIBRATION_TARGET ?auto_325330 ?auto_325329 ) ( POINTING ?auto_325331 ?auto_325323 ) ( not ( = ?auto_325329 ?auto_325323 ) ) ( not ( = ?auto_325326 ?auto_325323 ) ) ( not ( = ?auto_325321 ?auto_325323 ) ) ( ON_BOARD ?auto_325328 ?auto_325331 ) ( POWER_ON ?auto_325328 ) ( not ( = ?auto_325330 ?auto_325328 ) ) ( HAVE_IMAGE ?auto_325321 ?auto_325322 ) ( HAVE_IMAGE ?auto_325323 ?auto_325320 ) ( HAVE_IMAGE ?auto_325324 ?auto_325325 ) ( not ( = ?auto_325321 ?auto_325324 ) ) ( not ( = ?auto_325322 ?auto_325320 ) ) ( not ( = ?auto_325322 ?auto_325325 ) ) ( not ( = ?auto_325322 ?auto_325327 ) ) ( not ( = ?auto_325323 ?auto_325324 ) ) ( not ( = ?auto_325320 ?auto_325325 ) ) ( not ( = ?auto_325320 ?auto_325327 ) ) ( not ( = ?auto_325324 ?auto_325326 ) ) ( not ( = ?auto_325324 ?auto_325329 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_325321 ?auto_325325 ?auto_325326 ?auto_325327 )
      ( GET-4IMAGE-VERIFY ?auto_325321 ?auto_325322 ?auto_325323 ?auto_325320 ?auto_325324 ?auto_325325 ?auto_325326 ?auto_325327 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_325494 - DIRECTION
      ?auto_325495 - MODE
      ?auto_325496 - DIRECTION
      ?auto_325493 - MODE
      ?auto_325497 - DIRECTION
      ?auto_325498 - MODE
      ?auto_325499 - DIRECTION
      ?auto_325500 - MODE
    )
    :vars
    (
      ?auto_325504 - INSTRUMENT
      ?auto_325505 - SATELLITE
      ?auto_325502 - DIRECTION
      ?auto_325503 - DIRECTION
      ?auto_325501 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_325504 ?auto_325505 ) ( SUPPORTS ?auto_325504 ?auto_325493 ) ( not ( = ?auto_325496 ?auto_325502 ) ) ( HAVE_IMAGE ?auto_325497 ?auto_325495 ) ( not ( = ?auto_325497 ?auto_325496 ) ) ( not ( = ?auto_325497 ?auto_325502 ) ) ( not ( = ?auto_325495 ?auto_325493 ) ) ( CALIBRATION_TARGET ?auto_325504 ?auto_325502 ) ( POINTING ?auto_325505 ?auto_325503 ) ( not ( = ?auto_325502 ?auto_325503 ) ) ( not ( = ?auto_325496 ?auto_325503 ) ) ( not ( = ?auto_325497 ?auto_325503 ) ) ( ON_BOARD ?auto_325501 ?auto_325505 ) ( POWER_ON ?auto_325501 ) ( not ( = ?auto_325504 ?auto_325501 ) ) ( HAVE_IMAGE ?auto_325494 ?auto_325495 ) ( HAVE_IMAGE ?auto_325497 ?auto_325498 ) ( HAVE_IMAGE ?auto_325499 ?auto_325500 ) ( not ( = ?auto_325494 ?auto_325496 ) ) ( not ( = ?auto_325494 ?auto_325497 ) ) ( not ( = ?auto_325494 ?auto_325499 ) ) ( not ( = ?auto_325494 ?auto_325502 ) ) ( not ( = ?auto_325494 ?auto_325503 ) ) ( not ( = ?auto_325495 ?auto_325498 ) ) ( not ( = ?auto_325495 ?auto_325500 ) ) ( not ( = ?auto_325496 ?auto_325499 ) ) ( not ( = ?auto_325493 ?auto_325498 ) ) ( not ( = ?auto_325493 ?auto_325500 ) ) ( not ( = ?auto_325497 ?auto_325499 ) ) ( not ( = ?auto_325498 ?auto_325500 ) ) ( not ( = ?auto_325499 ?auto_325502 ) ) ( not ( = ?auto_325499 ?auto_325503 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_325497 ?auto_325495 ?auto_325496 ?auto_325493 )
      ( GET-4IMAGE-VERIFY ?auto_325494 ?auto_325495 ?auto_325496 ?auto_325493 ?auto_325497 ?auto_325498 ?auto_325499 ?auto_325500 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_326729 - DIRECTION
      ?auto_326730 - MODE
      ?auto_326731 - DIRECTION
      ?auto_326728 - MODE
      ?auto_326732 - DIRECTION
      ?auto_326733 - MODE
      ?auto_326734 - DIRECTION
      ?auto_326735 - MODE
    )
    :vars
    (
      ?auto_326738 - INSTRUMENT
      ?auto_326739 - SATELLITE
      ?auto_326737 - DIRECTION
      ?auto_326736 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_326738 ?auto_326739 ) ( SUPPORTS ?auto_326738 ?auto_326730 ) ( not ( = ?auto_326729 ?auto_326737 ) ) ( HAVE_IMAGE ?auto_326734 ?auto_326728 ) ( not ( = ?auto_326734 ?auto_326729 ) ) ( not ( = ?auto_326734 ?auto_326737 ) ) ( not ( = ?auto_326728 ?auto_326730 ) ) ( CALIBRATION_TARGET ?auto_326738 ?auto_326737 ) ( POINTING ?auto_326739 ?auto_326732 ) ( not ( = ?auto_326737 ?auto_326732 ) ) ( not ( = ?auto_326729 ?auto_326732 ) ) ( not ( = ?auto_326734 ?auto_326732 ) ) ( ON_BOARD ?auto_326736 ?auto_326739 ) ( POWER_ON ?auto_326736 ) ( not ( = ?auto_326738 ?auto_326736 ) ) ( HAVE_IMAGE ?auto_326731 ?auto_326728 ) ( HAVE_IMAGE ?auto_326732 ?auto_326733 ) ( HAVE_IMAGE ?auto_326734 ?auto_326735 ) ( not ( = ?auto_326729 ?auto_326731 ) ) ( not ( = ?auto_326730 ?auto_326733 ) ) ( not ( = ?auto_326730 ?auto_326735 ) ) ( not ( = ?auto_326731 ?auto_326732 ) ) ( not ( = ?auto_326731 ?auto_326734 ) ) ( not ( = ?auto_326731 ?auto_326737 ) ) ( not ( = ?auto_326728 ?auto_326733 ) ) ( not ( = ?auto_326728 ?auto_326735 ) ) ( not ( = ?auto_326733 ?auto_326735 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_326734 ?auto_326728 ?auto_326729 ?auto_326730 )
      ( GET-4IMAGE-VERIFY ?auto_326729 ?auto_326730 ?auto_326731 ?auto_326728 ?auto_326732 ?auto_326733 ?auto_326734 ?auto_326735 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_326879 - DIRECTION
      ?auto_326880 - MODE
      ?auto_326881 - DIRECTION
      ?auto_326878 - MODE
      ?auto_326882 - DIRECTION
      ?auto_326883 - MODE
      ?auto_326884 - DIRECTION
      ?auto_326885 - MODE
    )
    :vars
    (
      ?auto_326888 - INSTRUMENT
      ?auto_326889 - SATELLITE
      ?auto_326887 - DIRECTION
      ?auto_326886 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_326888 ?auto_326889 ) ( SUPPORTS ?auto_326888 ?auto_326880 ) ( not ( = ?auto_326879 ?auto_326887 ) ) ( HAVE_IMAGE ?auto_326884 ?auto_326883 ) ( not ( = ?auto_326884 ?auto_326879 ) ) ( not ( = ?auto_326884 ?auto_326887 ) ) ( not ( = ?auto_326883 ?auto_326880 ) ) ( CALIBRATION_TARGET ?auto_326888 ?auto_326887 ) ( POINTING ?auto_326889 ?auto_326881 ) ( not ( = ?auto_326887 ?auto_326881 ) ) ( not ( = ?auto_326879 ?auto_326881 ) ) ( not ( = ?auto_326884 ?auto_326881 ) ) ( ON_BOARD ?auto_326886 ?auto_326889 ) ( POWER_ON ?auto_326886 ) ( not ( = ?auto_326888 ?auto_326886 ) ) ( HAVE_IMAGE ?auto_326881 ?auto_326878 ) ( HAVE_IMAGE ?auto_326882 ?auto_326883 ) ( HAVE_IMAGE ?auto_326884 ?auto_326885 ) ( not ( = ?auto_326879 ?auto_326882 ) ) ( not ( = ?auto_326880 ?auto_326878 ) ) ( not ( = ?auto_326880 ?auto_326885 ) ) ( not ( = ?auto_326881 ?auto_326882 ) ) ( not ( = ?auto_326878 ?auto_326883 ) ) ( not ( = ?auto_326878 ?auto_326885 ) ) ( not ( = ?auto_326882 ?auto_326884 ) ) ( not ( = ?auto_326882 ?auto_326887 ) ) ( not ( = ?auto_326883 ?auto_326885 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_326884 ?auto_326883 ?auto_326879 ?auto_326880 )
      ( GET-4IMAGE-VERIFY ?auto_326879 ?auto_326880 ?auto_326881 ?auto_326878 ?auto_326882 ?auto_326883 ?auto_326884 ?auto_326885 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_327830 - DIRECTION
      ?auto_327831 - MODE
      ?auto_327832 - DIRECTION
      ?auto_327829 - MODE
      ?auto_327833 - DIRECTION
      ?auto_327834 - MODE
    )
    :vars
    (
      ?auto_327836 - INSTRUMENT
      ?auto_327835 - SATELLITE
      ?auto_327837 - DIRECTION
      ?auto_327839 - DIRECTION
      ?auto_327838 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_327836 ?auto_327835 ) ( SUPPORTS ?auto_327836 ?auto_327831 ) ( not ( = ?auto_327830 ?auto_327837 ) ) ( HAVE_IMAGE ?auto_327833 ?auto_327829 ) ( not ( = ?auto_327833 ?auto_327830 ) ) ( not ( = ?auto_327833 ?auto_327837 ) ) ( not ( = ?auto_327829 ?auto_327831 ) ) ( CALIBRATION_TARGET ?auto_327836 ?auto_327837 ) ( POINTING ?auto_327835 ?auto_327839 ) ( not ( = ?auto_327837 ?auto_327839 ) ) ( not ( = ?auto_327830 ?auto_327839 ) ) ( not ( = ?auto_327833 ?auto_327839 ) ) ( ON_BOARD ?auto_327838 ?auto_327835 ) ( POWER_ON ?auto_327838 ) ( not ( = ?auto_327836 ?auto_327838 ) ) ( HAVE_IMAGE ?auto_327832 ?auto_327829 ) ( HAVE_IMAGE ?auto_327833 ?auto_327834 ) ( not ( = ?auto_327830 ?auto_327832 ) ) ( not ( = ?auto_327831 ?auto_327834 ) ) ( not ( = ?auto_327832 ?auto_327833 ) ) ( not ( = ?auto_327832 ?auto_327837 ) ) ( not ( = ?auto_327832 ?auto_327839 ) ) ( not ( = ?auto_327829 ?auto_327834 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_327833 ?auto_327829 ?auto_327830 ?auto_327831 )
      ( GET-3IMAGE-VERIFY ?auto_327830 ?auto_327831 ?auto_327832 ?auto_327829 ?auto_327833 ?auto_327834 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_331081 - DIRECTION
      ?auto_331082 - MODE
      ?auto_331083 - DIRECTION
      ?auto_331080 - MODE
      ?auto_331084 - DIRECTION
      ?auto_331085 - MODE
      ?auto_331086 - DIRECTION
      ?auto_331087 - MODE
    )
    :vars
    (
      ?auto_331090 - INSTRUMENT
      ?auto_331091 - SATELLITE
      ?auto_331089 - DIRECTION
      ?auto_331092 - DIRECTION
      ?auto_331088 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_331090 ?auto_331091 ) ( SUPPORTS ?auto_331090 ?auto_331080 ) ( not ( = ?auto_331083 ?auto_331089 ) ) ( HAVE_IMAGE ?auto_331084 ?auto_331082 ) ( not ( = ?auto_331084 ?auto_331083 ) ) ( not ( = ?auto_331084 ?auto_331089 ) ) ( not ( = ?auto_331082 ?auto_331080 ) ) ( CALIBRATION_TARGET ?auto_331090 ?auto_331089 ) ( not ( = ?auto_331089 ?auto_331092 ) ) ( not ( = ?auto_331083 ?auto_331092 ) ) ( not ( = ?auto_331084 ?auto_331092 ) ) ( ON_BOARD ?auto_331088 ?auto_331091 ) ( POWER_ON ?auto_331088 ) ( not ( = ?auto_331090 ?auto_331088 ) ) ( POINTING ?auto_331091 ?auto_331089 ) ( HAVE_IMAGE ?auto_331081 ?auto_331082 ) ( HAVE_IMAGE ?auto_331084 ?auto_331085 ) ( HAVE_IMAGE ?auto_331086 ?auto_331087 ) ( not ( = ?auto_331081 ?auto_331083 ) ) ( not ( = ?auto_331081 ?auto_331084 ) ) ( not ( = ?auto_331081 ?auto_331086 ) ) ( not ( = ?auto_331081 ?auto_331089 ) ) ( not ( = ?auto_331081 ?auto_331092 ) ) ( not ( = ?auto_331082 ?auto_331085 ) ) ( not ( = ?auto_331082 ?auto_331087 ) ) ( not ( = ?auto_331083 ?auto_331086 ) ) ( not ( = ?auto_331080 ?auto_331085 ) ) ( not ( = ?auto_331080 ?auto_331087 ) ) ( not ( = ?auto_331084 ?auto_331086 ) ) ( not ( = ?auto_331085 ?auto_331087 ) ) ( not ( = ?auto_331086 ?auto_331089 ) ) ( not ( = ?auto_331086 ?auto_331092 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_331084 ?auto_331082 ?auto_331083 ?auto_331080 )
      ( GET-4IMAGE-VERIFY ?auto_331081 ?auto_331082 ?auto_331083 ?auto_331080 ?auto_331084 ?auto_331085 ?auto_331086 ?auto_331087 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_338823 - DIRECTION
      ?auto_338824 - MODE
      ?auto_338825 - DIRECTION
      ?auto_338822 - MODE
      ?auto_338826 - DIRECTION
      ?auto_338827 - MODE
      ?auto_338828 - DIRECTION
      ?auto_338829 - MODE
    )
    :vars
    (
      ?auto_338832 - INSTRUMENT
      ?auto_338831 - SATELLITE
      ?auto_338830 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_338832 ?auto_338831 ) ( SUPPORTS ?auto_338832 ?auto_338829 ) ( not ( = ?auto_338828 ?auto_338830 ) ) ( HAVE_IMAGE ?auto_338826 ?auto_338824 ) ( not ( = ?auto_338826 ?auto_338828 ) ) ( not ( = ?auto_338826 ?auto_338830 ) ) ( not ( = ?auto_338824 ?auto_338829 ) ) ( CALIBRATION_TARGET ?auto_338832 ?auto_338830 ) ( POWER_AVAIL ?auto_338831 ) ( POINTING ?auto_338831 ?auto_338826 ) ( HAVE_IMAGE ?auto_338823 ?auto_338824 ) ( HAVE_IMAGE ?auto_338825 ?auto_338822 ) ( HAVE_IMAGE ?auto_338826 ?auto_338827 ) ( not ( = ?auto_338823 ?auto_338825 ) ) ( not ( = ?auto_338823 ?auto_338826 ) ) ( not ( = ?auto_338823 ?auto_338828 ) ) ( not ( = ?auto_338823 ?auto_338830 ) ) ( not ( = ?auto_338824 ?auto_338822 ) ) ( not ( = ?auto_338824 ?auto_338827 ) ) ( not ( = ?auto_338825 ?auto_338826 ) ) ( not ( = ?auto_338825 ?auto_338828 ) ) ( not ( = ?auto_338825 ?auto_338830 ) ) ( not ( = ?auto_338822 ?auto_338827 ) ) ( not ( = ?auto_338822 ?auto_338829 ) ) ( not ( = ?auto_338827 ?auto_338829 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_338826 ?auto_338824 ?auto_338828 ?auto_338829 )
      ( GET-4IMAGE-VERIFY ?auto_338823 ?auto_338824 ?auto_338825 ?auto_338822 ?auto_338826 ?auto_338827 ?auto_338828 ?auto_338829 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_339054 - DIRECTION
      ?auto_339055 - MODE
      ?auto_339056 - DIRECTION
      ?auto_339053 - MODE
      ?auto_339057 - DIRECTION
      ?auto_339058 - MODE
      ?auto_339059 - DIRECTION
      ?auto_339060 - MODE
    )
    :vars
    (
      ?auto_339063 - INSTRUMENT
      ?auto_339062 - SATELLITE
      ?auto_339061 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_339063 ?auto_339062 ) ( SUPPORTS ?auto_339063 ?auto_339053 ) ( not ( = ?auto_339056 ?auto_339061 ) ) ( HAVE_IMAGE ?auto_339059 ?auto_339055 ) ( not ( = ?auto_339059 ?auto_339056 ) ) ( not ( = ?auto_339059 ?auto_339061 ) ) ( not ( = ?auto_339055 ?auto_339053 ) ) ( CALIBRATION_TARGET ?auto_339063 ?auto_339061 ) ( POWER_AVAIL ?auto_339062 ) ( POINTING ?auto_339062 ?auto_339059 ) ( HAVE_IMAGE ?auto_339054 ?auto_339055 ) ( HAVE_IMAGE ?auto_339057 ?auto_339058 ) ( HAVE_IMAGE ?auto_339059 ?auto_339060 ) ( not ( = ?auto_339054 ?auto_339056 ) ) ( not ( = ?auto_339054 ?auto_339057 ) ) ( not ( = ?auto_339054 ?auto_339059 ) ) ( not ( = ?auto_339054 ?auto_339061 ) ) ( not ( = ?auto_339055 ?auto_339058 ) ) ( not ( = ?auto_339055 ?auto_339060 ) ) ( not ( = ?auto_339056 ?auto_339057 ) ) ( not ( = ?auto_339053 ?auto_339058 ) ) ( not ( = ?auto_339053 ?auto_339060 ) ) ( not ( = ?auto_339057 ?auto_339059 ) ) ( not ( = ?auto_339057 ?auto_339061 ) ) ( not ( = ?auto_339058 ?auto_339060 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_339059 ?auto_339055 ?auto_339056 ?auto_339053 )
      ( GET-4IMAGE-VERIFY ?auto_339054 ?auto_339055 ?auto_339056 ?auto_339053 ?auto_339057 ?auto_339058 ?auto_339059 ?auto_339060 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_340968 - DIRECTION
      ?auto_340969 - MODE
      ?auto_340970 - DIRECTION
      ?auto_340967 - MODE
      ?auto_340971 - DIRECTION
      ?auto_340972 - MODE
    )
    :vars
    (
      ?auto_340974 - INSTRUMENT
      ?auto_340975 - SATELLITE
      ?auto_340973 - DIRECTION
      ?auto_340976 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_340974 ?auto_340975 ) ( SUPPORTS ?auto_340974 ?auto_340967 ) ( not ( = ?auto_340970 ?auto_340973 ) ) ( HAVE_IMAGE ?auto_340968 ?auto_340972 ) ( not ( = ?auto_340968 ?auto_340970 ) ) ( not ( = ?auto_340968 ?auto_340973 ) ) ( not ( = ?auto_340972 ?auto_340967 ) ) ( CALIBRATION_TARGET ?auto_340974 ?auto_340973 ) ( POINTING ?auto_340975 ?auto_340968 ) ( ON_BOARD ?auto_340976 ?auto_340975 ) ( POWER_ON ?auto_340976 ) ( not ( = ?auto_340974 ?auto_340976 ) ) ( HAVE_IMAGE ?auto_340968 ?auto_340969 ) ( HAVE_IMAGE ?auto_340971 ?auto_340972 ) ( not ( = ?auto_340968 ?auto_340971 ) ) ( not ( = ?auto_340969 ?auto_340967 ) ) ( not ( = ?auto_340969 ?auto_340972 ) ) ( not ( = ?auto_340970 ?auto_340971 ) ) ( not ( = ?auto_340971 ?auto_340973 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_340968 ?auto_340972 ?auto_340970 ?auto_340967 )
      ( GET-3IMAGE-VERIFY ?auto_340968 ?auto_340969 ?auto_340970 ?auto_340967 ?auto_340971 ?auto_340972 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_341168 - DIRECTION
      ?auto_341169 - MODE
      ?auto_341170 - DIRECTION
      ?auto_341167 - MODE
      ?auto_341171 - DIRECTION
      ?auto_341172 - MODE
    )
    :vars
    (
      ?auto_341174 - INSTRUMENT
      ?auto_341175 - SATELLITE
      ?auto_341173 - DIRECTION
      ?auto_341176 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_341174 ?auto_341175 ) ( SUPPORTS ?auto_341174 ?auto_341169 ) ( not ( = ?auto_341168 ?auto_341173 ) ) ( HAVE_IMAGE ?auto_341170 ?auto_341167 ) ( not ( = ?auto_341170 ?auto_341168 ) ) ( not ( = ?auto_341170 ?auto_341173 ) ) ( not ( = ?auto_341167 ?auto_341169 ) ) ( CALIBRATION_TARGET ?auto_341174 ?auto_341173 ) ( POINTING ?auto_341175 ?auto_341170 ) ( ON_BOARD ?auto_341176 ?auto_341175 ) ( POWER_ON ?auto_341176 ) ( not ( = ?auto_341174 ?auto_341176 ) ) ( HAVE_IMAGE ?auto_341171 ?auto_341172 ) ( not ( = ?auto_341168 ?auto_341171 ) ) ( not ( = ?auto_341169 ?auto_341172 ) ) ( not ( = ?auto_341170 ?auto_341171 ) ) ( not ( = ?auto_341167 ?auto_341172 ) ) ( not ( = ?auto_341171 ?auto_341173 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_341170 ?auto_341167 ?auto_341168 ?auto_341169 )
      ( GET-3IMAGE-VERIFY ?auto_341168 ?auto_341169 ?auto_341170 ?auto_341167 ?auto_341171 ?auto_341172 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_341346 - DIRECTION
      ?auto_341347 - MODE
      ?auto_341348 - DIRECTION
      ?auto_341345 - MODE
      ?auto_341349 - DIRECTION
      ?auto_341350 - MODE
      ?auto_341351 - DIRECTION
      ?auto_341352 - MODE
    )
    :vars
    (
      ?auto_341354 - INSTRUMENT
      ?auto_341355 - SATELLITE
      ?auto_341353 - DIRECTION
      ?auto_341356 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_341354 ?auto_341355 ) ( SUPPORTS ?auto_341354 ?auto_341352 ) ( not ( = ?auto_341351 ?auto_341353 ) ) ( HAVE_IMAGE ?auto_341349 ?auto_341350 ) ( not ( = ?auto_341349 ?auto_341351 ) ) ( not ( = ?auto_341349 ?auto_341353 ) ) ( not ( = ?auto_341350 ?auto_341352 ) ) ( CALIBRATION_TARGET ?auto_341354 ?auto_341353 ) ( POINTING ?auto_341355 ?auto_341349 ) ( ON_BOARD ?auto_341356 ?auto_341355 ) ( POWER_ON ?auto_341356 ) ( not ( = ?auto_341354 ?auto_341356 ) ) ( HAVE_IMAGE ?auto_341346 ?auto_341347 ) ( HAVE_IMAGE ?auto_341348 ?auto_341345 ) ( not ( = ?auto_341346 ?auto_341348 ) ) ( not ( = ?auto_341346 ?auto_341349 ) ) ( not ( = ?auto_341346 ?auto_341351 ) ) ( not ( = ?auto_341346 ?auto_341353 ) ) ( not ( = ?auto_341347 ?auto_341345 ) ) ( not ( = ?auto_341347 ?auto_341350 ) ) ( not ( = ?auto_341347 ?auto_341352 ) ) ( not ( = ?auto_341348 ?auto_341349 ) ) ( not ( = ?auto_341348 ?auto_341351 ) ) ( not ( = ?auto_341348 ?auto_341353 ) ) ( not ( = ?auto_341345 ?auto_341350 ) ) ( not ( = ?auto_341345 ?auto_341352 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_341349 ?auto_341350 ?auto_341351 ?auto_341352 )
      ( GET-4IMAGE-VERIFY ?auto_341346 ?auto_341347 ?auto_341348 ?auto_341345 ?auto_341349 ?auto_341350 ?auto_341351 ?auto_341352 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_341598 - DIRECTION
      ?auto_341599 - MODE
      ?auto_341600 - DIRECTION
      ?auto_341597 - MODE
      ?auto_341601 - DIRECTION
      ?auto_341602 - MODE
      ?auto_341603 - DIRECTION
      ?auto_341604 - MODE
    )
    :vars
    (
      ?auto_341606 - INSTRUMENT
      ?auto_341607 - SATELLITE
      ?auto_341605 - DIRECTION
      ?auto_341608 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_341606 ?auto_341607 ) ( SUPPORTS ?auto_341606 ?auto_341597 ) ( not ( = ?auto_341600 ?auto_341605 ) ) ( HAVE_IMAGE ?auto_341603 ?auto_341602 ) ( not ( = ?auto_341603 ?auto_341600 ) ) ( not ( = ?auto_341603 ?auto_341605 ) ) ( not ( = ?auto_341602 ?auto_341597 ) ) ( CALIBRATION_TARGET ?auto_341606 ?auto_341605 ) ( POINTING ?auto_341607 ?auto_341603 ) ( ON_BOARD ?auto_341608 ?auto_341607 ) ( POWER_ON ?auto_341608 ) ( not ( = ?auto_341606 ?auto_341608 ) ) ( HAVE_IMAGE ?auto_341598 ?auto_341599 ) ( HAVE_IMAGE ?auto_341601 ?auto_341602 ) ( HAVE_IMAGE ?auto_341603 ?auto_341604 ) ( not ( = ?auto_341598 ?auto_341600 ) ) ( not ( = ?auto_341598 ?auto_341601 ) ) ( not ( = ?auto_341598 ?auto_341603 ) ) ( not ( = ?auto_341598 ?auto_341605 ) ) ( not ( = ?auto_341599 ?auto_341597 ) ) ( not ( = ?auto_341599 ?auto_341602 ) ) ( not ( = ?auto_341599 ?auto_341604 ) ) ( not ( = ?auto_341600 ?auto_341601 ) ) ( not ( = ?auto_341597 ?auto_341604 ) ) ( not ( = ?auto_341601 ?auto_341603 ) ) ( not ( = ?auto_341601 ?auto_341605 ) ) ( not ( = ?auto_341602 ?auto_341604 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_341603 ?auto_341602 ?auto_341600 ?auto_341597 )
      ( GET-4IMAGE-VERIFY ?auto_341598 ?auto_341599 ?auto_341600 ?auto_341597 ?auto_341601 ?auto_341602 ?auto_341603 ?auto_341604 ) )
  )

)

