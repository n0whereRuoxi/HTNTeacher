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
      ?auto_21961 - DIRECTION
      ?auto_21962 - MODE
    )
    :vars
    (
      ?auto_21963 - INSTRUMENT
      ?auto_21964 - SATELLITE
      ?auto_21965 - DIRECTION
      ?auto_21966 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21963 ?auto_21964 ) ( SUPPORTS ?auto_21963 ?auto_21962 ) ( not ( = ?auto_21961 ?auto_21965 ) ) ( CALIBRATION_TARGET ?auto_21963 ?auto_21965 ) ( POWER_AVAIL ?auto_21964 ) ( POINTING ?auto_21964 ?auto_21966 ) ( not ( = ?auto_21965 ?auto_21966 ) ) ( not ( = ?auto_21961 ?auto_21966 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_21964 ?auto_21965 ?auto_21966 )
      ( !SWITCH_ON ?auto_21963 ?auto_21964 )
      ( !CALIBRATE ?auto_21964 ?auto_21963 ?auto_21965 )
      ( !TURN_TO ?auto_21964 ?auto_21961 ?auto_21965 )
      ( !TAKE_IMAGE ?auto_21964 ?auto_21961 ?auto_21963 ?auto_21962 )
      ( GET-1IMAGE-VERIFY ?auto_21961 ?auto_21962 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_21969 - DIRECTION
      ?auto_21970 - MODE
    )
    :vars
    (
      ?auto_21971 - INSTRUMENT
      ?auto_21972 - SATELLITE
      ?auto_21973 - DIRECTION
      ?auto_21974 - DIRECTION
      ?auto_21975 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21971 ?auto_21972 ) ( SUPPORTS ?auto_21971 ?auto_21970 ) ( not ( = ?auto_21969 ?auto_21973 ) ) ( CALIBRATION_TARGET ?auto_21971 ?auto_21973 ) ( POINTING ?auto_21972 ?auto_21974 ) ( not ( = ?auto_21973 ?auto_21974 ) ) ( ON_BOARD ?auto_21975 ?auto_21972 ) ( POWER_ON ?auto_21975 ) ( not ( = ?auto_21969 ?auto_21974 ) ) ( not ( = ?auto_21971 ?auto_21975 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_21975 ?auto_21972 )
      ( !TURN_TO ?auto_21972 ?auto_21973 ?auto_21974 )
      ( !SWITCH_ON ?auto_21971 ?auto_21972 )
      ( !CALIBRATE ?auto_21972 ?auto_21971 ?auto_21973 )
      ( !TURN_TO ?auto_21972 ?auto_21969 ?auto_21973 )
      ( !TAKE_IMAGE ?auto_21972 ?auto_21969 ?auto_21971 ?auto_21970 )
      ( GET-1IMAGE-VERIFY ?auto_21969 ?auto_21970 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21988 - DIRECTION
      ?auto_21989 - MODE
      ?auto_21991 - DIRECTION
      ?auto_21990 - MODE
    )
    :vars
    (
      ?auto_21992 - INSTRUMENT
      ?auto_21995 - SATELLITE
      ?auto_21993 - DIRECTION
      ?auto_21994 - INSTRUMENT
      ?auto_21996 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21992 ?auto_21995 ) ( SUPPORTS ?auto_21992 ?auto_21990 ) ( not ( = ?auto_21991 ?auto_21993 ) ) ( CALIBRATION_TARGET ?auto_21992 ?auto_21993 ) ( not ( = ?auto_21993 ?auto_21988 ) ) ( ON_BOARD ?auto_21994 ?auto_21995 ) ( not ( = ?auto_21991 ?auto_21988 ) ) ( not ( = ?auto_21992 ?auto_21994 ) ) ( SUPPORTS ?auto_21994 ?auto_21989 ) ( CALIBRATION_TARGET ?auto_21994 ?auto_21993 ) ( POWER_AVAIL ?auto_21995 ) ( POINTING ?auto_21995 ?auto_21996 ) ( not ( = ?auto_21993 ?auto_21996 ) ) ( not ( = ?auto_21988 ?auto_21996 ) ) ( not ( = ?auto_21989 ?auto_21990 ) ) ( not ( = ?auto_21991 ?auto_21996 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21988 ?auto_21989 )
      ( GET-1IMAGE ?auto_21991 ?auto_21990 )
      ( GET-2IMAGE-VERIFY ?auto_21988 ?auto_21989 ?auto_21991 ?auto_21990 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21997 - DIRECTION
      ?auto_21998 - MODE
      ?auto_22000 - DIRECTION
      ?auto_21999 - MODE
    )
    :vars
    (
      ?auto_22001 - INSTRUMENT
      ?auto_22005 - SATELLITE
      ?auto_22003 - DIRECTION
      ?auto_22002 - INSTRUMENT
      ?auto_22004 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22001 ?auto_22005 ) ( SUPPORTS ?auto_22001 ?auto_21998 ) ( not ( = ?auto_21997 ?auto_22003 ) ) ( CALIBRATION_TARGET ?auto_22001 ?auto_22003 ) ( not ( = ?auto_22003 ?auto_22000 ) ) ( ON_BOARD ?auto_22002 ?auto_22005 ) ( not ( = ?auto_21997 ?auto_22000 ) ) ( not ( = ?auto_22001 ?auto_22002 ) ) ( SUPPORTS ?auto_22002 ?auto_21999 ) ( CALIBRATION_TARGET ?auto_22002 ?auto_22003 ) ( POWER_AVAIL ?auto_22005 ) ( POINTING ?auto_22005 ?auto_22004 ) ( not ( = ?auto_22003 ?auto_22004 ) ) ( not ( = ?auto_22000 ?auto_22004 ) ) ( not ( = ?auto_21999 ?auto_21998 ) ) ( not ( = ?auto_21997 ?auto_22004 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22000 ?auto_21999 ?auto_21997 ?auto_21998 )
      ( GET-2IMAGE-VERIFY ?auto_21997 ?auto_21998 ?auto_22000 ?auto_21999 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_22019 - DIRECTION
      ?auto_22020 - MODE
    )
    :vars
    (
      ?auto_22021 - INSTRUMENT
      ?auto_22022 - SATELLITE
      ?auto_22023 - DIRECTION
      ?auto_22024 - DIRECTION
      ?auto_22025 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_22021 ?auto_22022 ) ( SUPPORTS ?auto_22021 ?auto_22020 ) ( not ( = ?auto_22019 ?auto_22023 ) ) ( CALIBRATION_TARGET ?auto_22021 ?auto_22023 ) ( POINTING ?auto_22022 ?auto_22024 ) ( not ( = ?auto_22023 ?auto_22024 ) ) ( ON_BOARD ?auto_22025 ?auto_22022 ) ( POWER_ON ?auto_22025 ) ( not ( = ?auto_22019 ?auto_22024 ) ) ( not ( = ?auto_22021 ?auto_22025 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_22025 ?auto_22022 )
      ( !TURN_TO ?auto_22022 ?auto_22023 ?auto_22024 )
      ( !SWITCH_ON ?auto_22021 ?auto_22022 )
      ( !CALIBRATE ?auto_22022 ?auto_22021 ?auto_22023 )
      ( !TURN_TO ?auto_22022 ?auto_22019 ?auto_22023 )
      ( !TAKE_IMAGE ?auto_22022 ?auto_22019 ?auto_22021 ?auto_22020 )
      ( GET-1IMAGE-VERIFY ?auto_22019 ?auto_22020 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22154 - DIRECTION
      ?auto_22155 - MODE
      ?auto_22157 - DIRECTION
      ?auto_22156 - MODE
      ?auto_22158 - DIRECTION
      ?auto_22159 - MODE
    )
    :vars
    (
      ?auto_22160 - INSTRUMENT
      ?auto_22163 - SATELLITE
      ?auto_22161 - DIRECTION
      ?auto_22162 - INSTRUMENT
      ?auto_22164 - INSTRUMENT
      ?auto_22165 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22160 ?auto_22163 ) ( SUPPORTS ?auto_22160 ?auto_22159 ) ( not ( = ?auto_22158 ?auto_22161 ) ) ( CALIBRATION_TARGET ?auto_22160 ?auto_22161 ) ( not ( = ?auto_22161 ?auto_22157 ) ) ( ON_BOARD ?auto_22162 ?auto_22163 ) ( not ( = ?auto_22158 ?auto_22157 ) ) ( not ( = ?auto_22160 ?auto_22162 ) ) ( SUPPORTS ?auto_22162 ?auto_22156 ) ( CALIBRATION_TARGET ?auto_22162 ?auto_22161 ) ( not ( = ?auto_22161 ?auto_22154 ) ) ( ON_BOARD ?auto_22164 ?auto_22163 ) ( not ( = ?auto_22157 ?auto_22154 ) ) ( not ( = ?auto_22162 ?auto_22164 ) ) ( SUPPORTS ?auto_22164 ?auto_22155 ) ( CALIBRATION_TARGET ?auto_22164 ?auto_22161 ) ( POWER_AVAIL ?auto_22163 ) ( POINTING ?auto_22163 ?auto_22165 ) ( not ( = ?auto_22161 ?auto_22165 ) ) ( not ( = ?auto_22154 ?auto_22165 ) ) ( not ( = ?auto_22155 ?auto_22156 ) ) ( not ( = ?auto_22157 ?auto_22165 ) ) ( not ( = ?auto_22154 ?auto_22158 ) ) ( not ( = ?auto_22155 ?auto_22159 ) ) ( not ( = ?auto_22156 ?auto_22159 ) ) ( not ( = ?auto_22158 ?auto_22165 ) ) ( not ( = ?auto_22160 ?auto_22164 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22157 ?auto_22156 ?auto_22154 ?auto_22155 )
      ( GET-1IMAGE ?auto_22158 ?auto_22159 )
      ( GET-3IMAGE-VERIFY ?auto_22154 ?auto_22155 ?auto_22157 ?auto_22156 ?auto_22158 ?auto_22159 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22180 - DIRECTION
      ?auto_22181 - MODE
      ?auto_22183 - DIRECTION
      ?auto_22182 - MODE
      ?auto_22184 - DIRECTION
      ?auto_22185 - MODE
    )
    :vars
    (
      ?auto_22190 - INSTRUMENT
      ?auto_22188 - SATELLITE
      ?auto_22189 - DIRECTION
      ?auto_22187 - INSTRUMENT
      ?auto_22191 - INSTRUMENT
      ?auto_22186 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22190 ?auto_22188 ) ( SUPPORTS ?auto_22190 ?auto_22182 ) ( not ( = ?auto_22183 ?auto_22189 ) ) ( CALIBRATION_TARGET ?auto_22190 ?auto_22189 ) ( not ( = ?auto_22189 ?auto_22184 ) ) ( ON_BOARD ?auto_22187 ?auto_22188 ) ( not ( = ?auto_22183 ?auto_22184 ) ) ( not ( = ?auto_22190 ?auto_22187 ) ) ( SUPPORTS ?auto_22187 ?auto_22185 ) ( CALIBRATION_TARGET ?auto_22187 ?auto_22189 ) ( not ( = ?auto_22189 ?auto_22180 ) ) ( ON_BOARD ?auto_22191 ?auto_22188 ) ( not ( = ?auto_22184 ?auto_22180 ) ) ( not ( = ?auto_22187 ?auto_22191 ) ) ( SUPPORTS ?auto_22191 ?auto_22181 ) ( CALIBRATION_TARGET ?auto_22191 ?auto_22189 ) ( POWER_AVAIL ?auto_22188 ) ( POINTING ?auto_22188 ?auto_22186 ) ( not ( = ?auto_22189 ?auto_22186 ) ) ( not ( = ?auto_22180 ?auto_22186 ) ) ( not ( = ?auto_22181 ?auto_22185 ) ) ( not ( = ?auto_22184 ?auto_22186 ) ) ( not ( = ?auto_22180 ?auto_22183 ) ) ( not ( = ?auto_22181 ?auto_22182 ) ) ( not ( = ?auto_22185 ?auto_22182 ) ) ( not ( = ?auto_22183 ?auto_22186 ) ) ( not ( = ?auto_22190 ?auto_22191 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_22180 ?auto_22181 ?auto_22184 ?auto_22185 ?auto_22183 ?auto_22182 )
      ( GET-3IMAGE-VERIFY ?auto_22180 ?auto_22181 ?auto_22183 ?auto_22182 ?auto_22184 ?auto_22185 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22206 - DIRECTION
      ?auto_22207 - MODE
      ?auto_22209 - DIRECTION
      ?auto_22208 - MODE
      ?auto_22210 - DIRECTION
      ?auto_22211 - MODE
    )
    :vars
    (
      ?auto_22216 - INSTRUMENT
      ?auto_22214 - SATELLITE
      ?auto_22213 - DIRECTION
      ?auto_22212 - INSTRUMENT
      ?auto_22215 - INSTRUMENT
      ?auto_22217 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22216 ?auto_22214 ) ( SUPPORTS ?auto_22216 ?auto_22211 ) ( not ( = ?auto_22210 ?auto_22213 ) ) ( CALIBRATION_TARGET ?auto_22216 ?auto_22213 ) ( not ( = ?auto_22213 ?auto_22206 ) ) ( ON_BOARD ?auto_22212 ?auto_22214 ) ( not ( = ?auto_22210 ?auto_22206 ) ) ( not ( = ?auto_22216 ?auto_22212 ) ) ( SUPPORTS ?auto_22212 ?auto_22207 ) ( CALIBRATION_TARGET ?auto_22212 ?auto_22213 ) ( not ( = ?auto_22213 ?auto_22209 ) ) ( ON_BOARD ?auto_22215 ?auto_22214 ) ( not ( = ?auto_22206 ?auto_22209 ) ) ( not ( = ?auto_22212 ?auto_22215 ) ) ( SUPPORTS ?auto_22215 ?auto_22208 ) ( CALIBRATION_TARGET ?auto_22215 ?auto_22213 ) ( POWER_AVAIL ?auto_22214 ) ( POINTING ?auto_22214 ?auto_22217 ) ( not ( = ?auto_22213 ?auto_22217 ) ) ( not ( = ?auto_22209 ?auto_22217 ) ) ( not ( = ?auto_22208 ?auto_22207 ) ) ( not ( = ?auto_22206 ?auto_22217 ) ) ( not ( = ?auto_22209 ?auto_22210 ) ) ( not ( = ?auto_22208 ?auto_22211 ) ) ( not ( = ?auto_22207 ?auto_22211 ) ) ( not ( = ?auto_22210 ?auto_22217 ) ) ( not ( = ?auto_22216 ?auto_22215 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_22209 ?auto_22208 ?auto_22210 ?auto_22211 ?auto_22206 ?auto_22207 )
      ( GET-3IMAGE-VERIFY ?auto_22206 ?auto_22207 ?auto_22209 ?auto_22208 ?auto_22210 ?auto_22211 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22232 - DIRECTION
      ?auto_22233 - MODE
      ?auto_22235 - DIRECTION
      ?auto_22234 - MODE
      ?auto_22236 - DIRECTION
      ?auto_22237 - MODE
    )
    :vars
    (
      ?auto_22242 - INSTRUMENT
      ?auto_22240 - SATELLITE
      ?auto_22239 - DIRECTION
      ?auto_22238 - INSTRUMENT
      ?auto_22241 - INSTRUMENT
      ?auto_22243 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22242 ?auto_22240 ) ( SUPPORTS ?auto_22242 ?auto_22234 ) ( not ( = ?auto_22235 ?auto_22239 ) ) ( CALIBRATION_TARGET ?auto_22242 ?auto_22239 ) ( not ( = ?auto_22239 ?auto_22232 ) ) ( ON_BOARD ?auto_22238 ?auto_22240 ) ( not ( = ?auto_22235 ?auto_22232 ) ) ( not ( = ?auto_22242 ?auto_22238 ) ) ( SUPPORTS ?auto_22238 ?auto_22233 ) ( CALIBRATION_TARGET ?auto_22238 ?auto_22239 ) ( not ( = ?auto_22239 ?auto_22236 ) ) ( ON_BOARD ?auto_22241 ?auto_22240 ) ( not ( = ?auto_22232 ?auto_22236 ) ) ( not ( = ?auto_22238 ?auto_22241 ) ) ( SUPPORTS ?auto_22241 ?auto_22237 ) ( CALIBRATION_TARGET ?auto_22241 ?auto_22239 ) ( POWER_AVAIL ?auto_22240 ) ( POINTING ?auto_22240 ?auto_22243 ) ( not ( = ?auto_22239 ?auto_22243 ) ) ( not ( = ?auto_22236 ?auto_22243 ) ) ( not ( = ?auto_22237 ?auto_22233 ) ) ( not ( = ?auto_22232 ?auto_22243 ) ) ( not ( = ?auto_22236 ?auto_22235 ) ) ( not ( = ?auto_22237 ?auto_22234 ) ) ( not ( = ?auto_22233 ?auto_22234 ) ) ( not ( = ?auto_22235 ?auto_22243 ) ) ( not ( = ?auto_22242 ?auto_22241 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_22236 ?auto_22237 ?auto_22235 ?auto_22234 ?auto_22232 ?auto_22233 )
      ( GET-3IMAGE-VERIFY ?auto_22232 ?auto_22233 ?auto_22235 ?auto_22234 ?auto_22236 ?auto_22237 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22286 - DIRECTION
      ?auto_22287 - MODE
      ?auto_22289 - DIRECTION
      ?auto_22288 - MODE
      ?auto_22290 - DIRECTION
      ?auto_22291 - MODE
    )
    :vars
    (
      ?auto_22296 - INSTRUMENT
      ?auto_22294 - SATELLITE
      ?auto_22293 - DIRECTION
      ?auto_22292 - INSTRUMENT
      ?auto_22295 - INSTRUMENT
      ?auto_22297 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22296 ?auto_22294 ) ( SUPPORTS ?auto_22296 ?auto_22287 ) ( not ( = ?auto_22286 ?auto_22293 ) ) ( CALIBRATION_TARGET ?auto_22296 ?auto_22293 ) ( not ( = ?auto_22293 ?auto_22290 ) ) ( ON_BOARD ?auto_22292 ?auto_22294 ) ( not ( = ?auto_22286 ?auto_22290 ) ) ( not ( = ?auto_22296 ?auto_22292 ) ) ( SUPPORTS ?auto_22292 ?auto_22291 ) ( CALIBRATION_TARGET ?auto_22292 ?auto_22293 ) ( not ( = ?auto_22293 ?auto_22289 ) ) ( ON_BOARD ?auto_22295 ?auto_22294 ) ( not ( = ?auto_22290 ?auto_22289 ) ) ( not ( = ?auto_22292 ?auto_22295 ) ) ( SUPPORTS ?auto_22295 ?auto_22288 ) ( CALIBRATION_TARGET ?auto_22295 ?auto_22293 ) ( POWER_AVAIL ?auto_22294 ) ( POINTING ?auto_22294 ?auto_22297 ) ( not ( = ?auto_22293 ?auto_22297 ) ) ( not ( = ?auto_22289 ?auto_22297 ) ) ( not ( = ?auto_22288 ?auto_22291 ) ) ( not ( = ?auto_22290 ?auto_22297 ) ) ( not ( = ?auto_22289 ?auto_22286 ) ) ( not ( = ?auto_22288 ?auto_22287 ) ) ( not ( = ?auto_22291 ?auto_22287 ) ) ( not ( = ?auto_22286 ?auto_22297 ) ) ( not ( = ?auto_22296 ?auto_22295 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_22289 ?auto_22288 ?auto_22286 ?auto_22287 ?auto_22290 ?auto_22291 )
      ( GET-3IMAGE-VERIFY ?auto_22286 ?auto_22287 ?auto_22289 ?auto_22288 ?auto_22290 ?auto_22291 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22312 - DIRECTION
      ?auto_22313 - MODE
      ?auto_22315 - DIRECTION
      ?auto_22314 - MODE
      ?auto_22316 - DIRECTION
      ?auto_22317 - MODE
    )
    :vars
    (
      ?auto_22322 - INSTRUMENT
      ?auto_22320 - SATELLITE
      ?auto_22319 - DIRECTION
      ?auto_22318 - INSTRUMENT
      ?auto_22321 - INSTRUMENT
      ?auto_22323 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22322 ?auto_22320 ) ( SUPPORTS ?auto_22322 ?auto_22313 ) ( not ( = ?auto_22312 ?auto_22319 ) ) ( CALIBRATION_TARGET ?auto_22322 ?auto_22319 ) ( not ( = ?auto_22319 ?auto_22315 ) ) ( ON_BOARD ?auto_22318 ?auto_22320 ) ( not ( = ?auto_22312 ?auto_22315 ) ) ( not ( = ?auto_22322 ?auto_22318 ) ) ( SUPPORTS ?auto_22318 ?auto_22314 ) ( CALIBRATION_TARGET ?auto_22318 ?auto_22319 ) ( not ( = ?auto_22319 ?auto_22316 ) ) ( ON_BOARD ?auto_22321 ?auto_22320 ) ( not ( = ?auto_22315 ?auto_22316 ) ) ( not ( = ?auto_22318 ?auto_22321 ) ) ( SUPPORTS ?auto_22321 ?auto_22317 ) ( CALIBRATION_TARGET ?auto_22321 ?auto_22319 ) ( POWER_AVAIL ?auto_22320 ) ( POINTING ?auto_22320 ?auto_22323 ) ( not ( = ?auto_22319 ?auto_22323 ) ) ( not ( = ?auto_22316 ?auto_22323 ) ) ( not ( = ?auto_22317 ?auto_22314 ) ) ( not ( = ?auto_22315 ?auto_22323 ) ) ( not ( = ?auto_22316 ?auto_22312 ) ) ( not ( = ?auto_22317 ?auto_22313 ) ) ( not ( = ?auto_22314 ?auto_22313 ) ) ( not ( = ?auto_22312 ?auto_22323 ) ) ( not ( = ?auto_22322 ?auto_22321 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_22316 ?auto_22317 ?auto_22312 ?auto_22313 ?auto_22315 ?auto_22314 )
      ( GET-3IMAGE-VERIFY ?auto_22312 ?auto_22313 ?auto_22315 ?auto_22314 ?auto_22316 ?auto_22317 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_22398 - DIRECTION
      ?auto_22399 - MODE
    )
    :vars
    (
      ?auto_22400 - INSTRUMENT
      ?auto_22401 - SATELLITE
      ?auto_22402 - DIRECTION
      ?auto_22403 - DIRECTION
      ?auto_22404 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_22400 ?auto_22401 ) ( SUPPORTS ?auto_22400 ?auto_22399 ) ( not ( = ?auto_22398 ?auto_22402 ) ) ( CALIBRATION_TARGET ?auto_22400 ?auto_22402 ) ( POINTING ?auto_22401 ?auto_22403 ) ( not ( = ?auto_22402 ?auto_22403 ) ) ( ON_BOARD ?auto_22404 ?auto_22401 ) ( POWER_ON ?auto_22404 ) ( not ( = ?auto_22398 ?auto_22403 ) ) ( not ( = ?auto_22400 ?auto_22404 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_22404 ?auto_22401 )
      ( !TURN_TO ?auto_22401 ?auto_22402 ?auto_22403 )
      ( !SWITCH_ON ?auto_22400 ?auto_22401 )
      ( !CALIBRATE ?auto_22401 ?auto_22400 ?auto_22402 )
      ( !TURN_TO ?auto_22401 ?auto_22398 ?auto_22402 )
      ( !TAKE_IMAGE ?auto_22401 ?auto_22398 ?auto_22400 ?auto_22399 )
      ( GET-1IMAGE-VERIFY ?auto_22398 ?auto_22399 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_23964 - DIRECTION
      ?auto_23965 - MODE
      ?auto_23967 - DIRECTION
      ?auto_23966 - MODE
      ?auto_23968 - DIRECTION
      ?auto_23969 - MODE
      ?auto_23970 - DIRECTION
      ?auto_23971 - MODE
    )
    :vars
    (
      ?auto_23974 - INSTRUMENT
      ?auto_23975 - SATELLITE
      ?auto_23973 - DIRECTION
      ?auto_23972 - INSTRUMENT
      ?auto_23976 - INSTRUMENT
      ?auto_23977 - INSTRUMENT
      ?auto_23978 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_23974 ?auto_23975 ) ( SUPPORTS ?auto_23974 ?auto_23971 ) ( not ( = ?auto_23970 ?auto_23973 ) ) ( CALIBRATION_TARGET ?auto_23974 ?auto_23973 ) ( not ( = ?auto_23973 ?auto_23968 ) ) ( ON_BOARD ?auto_23972 ?auto_23975 ) ( not ( = ?auto_23970 ?auto_23968 ) ) ( not ( = ?auto_23974 ?auto_23972 ) ) ( SUPPORTS ?auto_23972 ?auto_23969 ) ( CALIBRATION_TARGET ?auto_23972 ?auto_23973 ) ( not ( = ?auto_23973 ?auto_23967 ) ) ( ON_BOARD ?auto_23976 ?auto_23975 ) ( not ( = ?auto_23968 ?auto_23967 ) ) ( not ( = ?auto_23972 ?auto_23976 ) ) ( SUPPORTS ?auto_23976 ?auto_23966 ) ( CALIBRATION_TARGET ?auto_23976 ?auto_23973 ) ( not ( = ?auto_23973 ?auto_23964 ) ) ( ON_BOARD ?auto_23977 ?auto_23975 ) ( not ( = ?auto_23967 ?auto_23964 ) ) ( not ( = ?auto_23976 ?auto_23977 ) ) ( SUPPORTS ?auto_23977 ?auto_23965 ) ( CALIBRATION_TARGET ?auto_23977 ?auto_23973 ) ( POWER_AVAIL ?auto_23975 ) ( POINTING ?auto_23975 ?auto_23978 ) ( not ( = ?auto_23973 ?auto_23978 ) ) ( not ( = ?auto_23964 ?auto_23978 ) ) ( not ( = ?auto_23965 ?auto_23966 ) ) ( not ( = ?auto_23967 ?auto_23978 ) ) ( not ( = ?auto_23964 ?auto_23968 ) ) ( not ( = ?auto_23965 ?auto_23969 ) ) ( not ( = ?auto_23966 ?auto_23969 ) ) ( not ( = ?auto_23968 ?auto_23978 ) ) ( not ( = ?auto_23972 ?auto_23977 ) ) ( not ( = ?auto_23964 ?auto_23970 ) ) ( not ( = ?auto_23965 ?auto_23971 ) ) ( not ( = ?auto_23967 ?auto_23970 ) ) ( not ( = ?auto_23966 ?auto_23971 ) ) ( not ( = ?auto_23969 ?auto_23971 ) ) ( not ( = ?auto_23970 ?auto_23978 ) ) ( not ( = ?auto_23974 ?auto_23976 ) ) ( not ( = ?auto_23974 ?auto_23977 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_23964 ?auto_23965 ?auto_23968 ?auto_23969 ?auto_23967 ?auto_23966 )
      ( GET-1IMAGE ?auto_23970 ?auto_23971 )
      ( GET-4IMAGE-VERIFY ?auto_23964 ?auto_23965 ?auto_23967 ?auto_23966 ?auto_23968 ?auto_23969 ?auto_23970 ?auto_23971 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_24013 - DIRECTION
      ?auto_24014 - MODE
      ?auto_24016 - DIRECTION
      ?auto_24015 - MODE
      ?auto_24017 - DIRECTION
      ?auto_24018 - MODE
      ?auto_24019 - DIRECTION
      ?auto_24020 - MODE
    )
    :vars
    (
      ?auto_24024 - INSTRUMENT
      ?auto_24022 - SATELLITE
      ?auto_24026 - DIRECTION
      ?auto_24025 - INSTRUMENT
      ?auto_24023 - INSTRUMENT
      ?auto_24027 - INSTRUMENT
      ?auto_24021 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24024 ?auto_24022 ) ( SUPPORTS ?auto_24024 ?auto_24018 ) ( not ( = ?auto_24017 ?auto_24026 ) ) ( CALIBRATION_TARGET ?auto_24024 ?auto_24026 ) ( not ( = ?auto_24026 ?auto_24019 ) ) ( ON_BOARD ?auto_24025 ?auto_24022 ) ( not ( = ?auto_24017 ?auto_24019 ) ) ( not ( = ?auto_24024 ?auto_24025 ) ) ( SUPPORTS ?auto_24025 ?auto_24020 ) ( CALIBRATION_TARGET ?auto_24025 ?auto_24026 ) ( not ( = ?auto_24026 ?auto_24016 ) ) ( ON_BOARD ?auto_24023 ?auto_24022 ) ( not ( = ?auto_24019 ?auto_24016 ) ) ( not ( = ?auto_24025 ?auto_24023 ) ) ( SUPPORTS ?auto_24023 ?auto_24015 ) ( CALIBRATION_TARGET ?auto_24023 ?auto_24026 ) ( not ( = ?auto_24026 ?auto_24013 ) ) ( ON_BOARD ?auto_24027 ?auto_24022 ) ( not ( = ?auto_24016 ?auto_24013 ) ) ( not ( = ?auto_24023 ?auto_24027 ) ) ( SUPPORTS ?auto_24027 ?auto_24014 ) ( CALIBRATION_TARGET ?auto_24027 ?auto_24026 ) ( POWER_AVAIL ?auto_24022 ) ( POINTING ?auto_24022 ?auto_24021 ) ( not ( = ?auto_24026 ?auto_24021 ) ) ( not ( = ?auto_24013 ?auto_24021 ) ) ( not ( = ?auto_24014 ?auto_24015 ) ) ( not ( = ?auto_24016 ?auto_24021 ) ) ( not ( = ?auto_24013 ?auto_24019 ) ) ( not ( = ?auto_24014 ?auto_24020 ) ) ( not ( = ?auto_24015 ?auto_24020 ) ) ( not ( = ?auto_24019 ?auto_24021 ) ) ( not ( = ?auto_24025 ?auto_24027 ) ) ( not ( = ?auto_24013 ?auto_24017 ) ) ( not ( = ?auto_24014 ?auto_24018 ) ) ( not ( = ?auto_24016 ?auto_24017 ) ) ( not ( = ?auto_24015 ?auto_24018 ) ) ( not ( = ?auto_24020 ?auto_24018 ) ) ( not ( = ?auto_24017 ?auto_24021 ) ) ( not ( = ?auto_24024 ?auto_24023 ) ) ( not ( = ?auto_24024 ?auto_24027 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_24013 ?auto_24014 ?auto_24016 ?auto_24015 ?auto_24019 ?auto_24020 ?auto_24017 ?auto_24018 )
      ( GET-4IMAGE-VERIFY ?auto_24013 ?auto_24014 ?auto_24016 ?auto_24015 ?auto_24017 ?auto_24018 ?auto_24019 ?auto_24020 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_24062 - DIRECTION
      ?auto_24063 - MODE
      ?auto_24065 - DIRECTION
      ?auto_24064 - MODE
      ?auto_24066 - DIRECTION
      ?auto_24067 - MODE
      ?auto_24068 - DIRECTION
      ?auto_24069 - MODE
    )
    :vars
    (
      ?auto_24072 - INSTRUMENT
      ?auto_24074 - SATELLITE
      ?auto_24076 - DIRECTION
      ?auto_24073 - INSTRUMENT
      ?auto_24075 - INSTRUMENT
      ?auto_24071 - INSTRUMENT
      ?auto_24070 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24072 ?auto_24074 ) ( SUPPORTS ?auto_24072 ?auto_24069 ) ( not ( = ?auto_24068 ?auto_24076 ) ) ( CALIBRATION_TARGET ?auto_24072 ?auto_24076 ) ( not ( = ?auto_24076 ?auto_24065 ) ) ( ON_BOARD ?auto_24073 ?auto_24074 ) ( not ( = ?auto_24068 ?auto_24065 ) ) ( not ( = ?auto_24072 ?auto_24073 ) ) ( SUPPORTS ?auto_24073 ?auto_24064 ) ( CALIBRATION_TARGET ?auto_24073 ?auto_24076 ) ( not ( = ?auto_24076 ?auto_24066 ) ) ( ON_BOARD ?auto_24075 ?auto_24074 ) ( not ( = ?auto_24065 ?auto_24066 ) ) ( not ( = ?auto_24073 ?auto_24075 ) ) ( SUPPORTS ?auto_24075 ?auto_24067 ) ( CALIBRATION_TARGET ?auto_24075 ?auto_24076 ) ( not ( = ?auto_24076 ?auto_24062 ) ) ( ON_BOARD ?auto_24071 ?auto_24074 ) ( not ( = ?auto_24066 ?auto_24062 ) ) ( not ( = ?auto_24075 ?auto_24071 ) ) ( SUPPORTS ?auto_24071 ?auto_24063 ) ( CALIBRATION_TARGET ?auto_24071 ?auto_24076 ) ( POWER_AVAIL ?auto_24074 ) ( POINTING ?auto_24074 ?auto_24070 ) ( not ( = ?auto_24076 ?auto_24070 ) ) ( not ( = ?auto_24062 ?auto_24070 ) ) ( not ( = ?auto_24063 ?auto_24067 ) ) ( not ( = ?auto_24066 ?auto_24070 ) ) ( not ( = ?auto_24062 ?auto_24065 ) ) ( not ( = ?auto_24063 ?auto_24064 ) ) ( not ( = ?auto_24067 ?auto_24064 ) ) ( not ( = ?auto_24065 ?auto_24070 ) ) ( not ( = ?auto_24073 ?auto_24071 ) ) ( not ( = ?auto_24062 ?auto_24068 ) ) ( not ( = ?auto_24063 ?auto_24069 ) ) ( not ( = ?auto_24066 ?auto_24068 ) ) ( not ( = ?auto_24067 ?auto_24069 ) ) ( not ( = ?auto_24064 ?auto_24069 ) ) ( not ( = ?auto_24068 ?auto_24070 ) ) ( not ( = ?auto_24072 ?auto_24075 ) ) ( not ( = ?auto_24072 ?auto_24071 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_24062 ?auto_24063 ?auto_24066 ?auto_24067 ?auto_24068 ?auto_24069 ?auto_24065 ?auto_24064 )
      ( GET-4IMAGE-VERIFY ?auto_24062 ?auto_24063 ?auto_24065 ?auto_24064 ?auto_24066 ?auto_24067 ?auto_24068 ?auto_24069 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_24111 - DIRECTION
      ?auto_24112 - MODE
      ?auto_24114 - DIRECTION
      ?auto_24113 - MODE
      ?auto_24115 - DIRECTION
      ?auto_24116 - MODE
      ?auto_24117 - DIRECTION
      ?auto_24118 - MODE
    )
    :vars
    (
      ?auto_24121 - INSTRUMENT
      ?auto_24123 - SATELLITE
      ?auto_24125 - DIRECTION
      ?auto_24122 - INSTRUMENT
      ?auto_24124 - INSTRUMENT
      ?auto_24120 - INSTRUMENT
      ?auto_24119 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24121 ?auto_24123 ) ( SUPPORTS ?auto_24121 ?auto_24116 ) ( not ( = ?auto_24115 ?auto_24125 ) ) ( CALIBRATION_TARGET ?auto_24121 ?auto_24125 ) ( not ( = ?auto_24125 ?auto_24114 ) ) ( ON_BOARD ?auto_24122 ?auto_24123 ) ( not ( = ?auto_24115 ?auto_24114 ) ) ( not ( = ?auto_24121 ?auto_24122 ) ) ( SUPPORTS ?auto_24122 ?auto_24113 ) ( CALIBRATION_TARGET ?auto_24122 ?auto_24125 ) ( not ( = ?auto_24125 ?auto_24117 ) ) ( ON_BOARD ?auto_24124 ?auto_24123 ) ( not ( = ?auto_24114 ?auto_24117 ) ) ( not ( = ?auto_24122 ?auto_24124 ) ) ( SUPPORTS ?auto_24124 ?auto_24118 ) ( CALIBRATION_TARGET ?auto_24124 ?auto_24125 ) ( not ( = ?auto_24125 ?auto_24111 ) ) ( ON_BOARD ?auto_24120 ?auto_24123 ) ( not ( = ?auto_24117 ?auto_24111 ) ) ( not ( = ?auto_24124 ?auto_24120 ) ) ( SUPPORTS ?auto_24120 ?auto_24112 ) ( CALIBRATION_TARGET ?auto_24120 ?auto_24125 ) ( POWER_AVAIL ?auto_24123 ) ( POINTING ?auto_24123 ?auto_24119 ) ( not ( = ?auto_24125 ?auto_24119 ) ) ( not ( = ?auto_24111 ?auto_24119 ) ) ( not ( = ?auto_24112 ?auto_24118 ) ) ( not ( = ?auto_24117 ?auto_24119 ) ) ( not ( = ?auto_24111 ?auto_24114 ) ) ( not ( = ?auto_24112 ?auto_24113 ) ) ( not ( = ?auto_24118 ?auto_24113 ) ) ( not ( = ?auto_24114 ?auto_24119 ) ) ( not ( = ?auto_24122 ?auto_24120 ) ) ( not ( = ?auto_24111 ?auto_24115 ) ) ( not ( = ?auto_24112 ?auto_24116 ) ) ( not ( = ?auto_24117 ?auto_24115 ) ) ( not ( = ?auto_24118 ?auto_24116 ) ) ( not ( = ?auto_24113 ?auto_24116 ) ) ( not ( = ?auto_24115 ?auto_24119 ) ) ( not ( = ?auto_24121 ?auto_24124 ) ) ( not ( = ?auto_24121 ?auto_24120 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_24111 ?auto_24112 ?auto_24117 ?auto_24118 ?auto_24115 ?auto_24116 ?auto_24114 ?auto_24113 )
      ( GET-4IMAGE-VERIFY ?auto_24111 ?auto_24112 ?auto_24114 ?auto_24113 ?auto_24115 ?auto_24116 ?auto_24117 ?auto_24118 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_24266 - DIRECTION
      ?auto_24267 - MODE
      ?auto_24269 - DIRECTION
      ?auto_24268 - MODE
      ?auto_24270 - DIRECTION
      ?auto_24271 - MODE
      ?auto_24272 - DIRECTION
      ?auto_24273 - MODE
    )
    :vars
    (
      ?auto_24276 - INSTRUMENT
      ?auto_24278 - SATELLITE
      ?auto_24280 - DIRECTION
      ?auto_24277 - INSTRUMENT
      ?auto_24279 - INSTRUMENT
      ?auto_24275 - INSTRUMENT
      ?auto_24274 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24276 ?auto_24278 ) ( SUPPORTS ?auto_24276 ?auto_24268 ) ( not ( = ?auto_24269 ?auto_24280 ) ) ( CALIBRATION_TARGET ?auto_24276 ?auto_24280 ) ( not ( = ?auto_24280 ?auto_24272 ) ) ( ON_BOARD ?auto_24277 ?auto_24278 ) ( not ( = ?auto_24269 ?auto_24272 ) ) ( not ( = ?auto_24276 ?auto_24277 ) ) ( SUPPORTS ?auto_24277 ?auto_24273 ) ( CALIBRATION_TARGET ?auto_24277 ?auto_24280 ) ( not ( = ?auto_24280 ?auto_24270 ) ) ( ON_BOARD ?auto_24279 ?auto_24278 ) ( not ( = ?auto_24272 ?auto_24270 ) ) ( not ( = ?auto_24277 ?auto_24279 ) ) ( SUPPORTS ?auto_24279 ?auto_24271 ) ( CALIBRATION_TARGET ?auto_24279 ?auto_24280 ) ( not ( = ?auto_24280 ?auto_24266 ) ) ( ON_BOARD ?auto_24275 ?auto_24278 ) ( not ( = ?auto_24270 ?auto_24266 ) ) ( not ( = ?auto_24279 ?auto_24275 ) ) ( SUPPORTS ?auto_24275 ?auto_24267 ) ( CALIBRATION_TARGET ?auto_24275 ?auto_24280 ) ( POWER_AVAIL ?auto_24278 ) ( POINTING ?auto_24278 ?auto_24274 ) ( not ( = ?auto_24280 ?auto_24274 ) ) ( not ( = ?auto_24266 ?auto_24274 ) ) ( not ( = ?auto_24267 ?auto_24271 ) ) ( not ( = ?auto_24270 ?auto_24274 ) ) ( not ( = ?auto_24266 ?auto_24272 ) ) ( not ( = ?auto_24267 ?auto_24273 ) ) ( not ( = ?auto_24271 ?auto_24273 ) ) ( not ( = ?auto_24272 ?auto_24274 ) ) ( not ( = ?auto_24277 ?auto_24275 ) ) ( not ( = ?auto_24266 ?auto_24269 ) ) ( not ( = ?auto_24267 ?auto_24268 ) ) ( not ( = ?auto_24270 ?auto_24269 ) ) ( not ( = ?auto_24271 ?auto_24268 ) ) ( not ( = ?auto_24273 ?auto_24268 ) ) ( not ( = ?auto_24269 ?auto_24274 ) ) ( not ( = ?auto_24276 ?auto_24279 ) ) ( not ( = ?auto_24276 ?auto_24275 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_24266 ?auto_24267 ?auto_24270 ?auto_24271 ?auto_24269 ?auto_24268 ?auto_24272 ?auto_24273 )
      ( GET-4IMAGE-VERIFY ?auto_24266 ?auto_24267 ?auto_24269 ?auto_24268 ?auto_24270 ?auto_24271 ?auto_24272 ?auto_24273 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_24315 - DIRECTION
      ?auto_24316 - MODE
      ?auto_24318 - DIRECTION
      ?auto_24317 - MODE
      ?auto_24319 - DIRECTION
      ?auto_24320 - MODE
      ?auto_24321 - DIRECTION
      ?auto_24322 - MODE
    )
    :vars
    (
      ?auto_24325 - INSTRUMENT
      ?auto_24327 - SATELLITE
      ?auto_24329 - DIRECTION
      ?auto_24326 - INSTRUMENT
      ?auto_24328 - INSTRUMENT
      ?auto_24324 - INSTRUMENT
      ?auto_24323 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24325 ?auto_24327 ) ( SUPPORTS ?auto_24325 ?auto_24317 ) ( not ( = ?auto_24318 ?auto_24329 ) ) ( CALIBRATION_TARGET ?auto_24325 ?auto_24329 ) ( not ( = ?auto_24329 ?auto_24319 ) ) ( ON_BOARD ?auto_24326 ?auto_24327 ) ( not ( = ?auto_24318 ?auto_24319 ) ) ( not ( = ?auto_24325 ?auto_24326 ) ) ( SUPPORTS ?auto_24326 ?auto_24320 ) ( CALIBRATION_TARGET ?auto_24326 ?auto_24329 ) ( not ( = ?auto_24329 ?auto_24321 ) ) ( ON_BOARD ?auto_24328 ?auto_24327 ) ( not ( = ?auto_24319 ?auto_24321 ) ) ( not ( = ?auto_24326 ?auto_24328 ) ) ( SUPPORTS ?auto_24328 ?auto_24322 ) ( CALIBRATION_TARGET ?auto_24328 ?auto_24329 ) ( not ( = ?auto_24329 ?auto_24315 ) ) ( ON_BOARD ?auto_24324 ?auto_24327 ) ( not ( = ?auto_24321 ?auto_24315 ) ) ( not ( = ?auto_24328 ?auto_24324 ) ) ( SUPPORTS ?auto_24324 ?auto_24316 ) ( CALIBRATION_TARGET ?auto_24324 ?auto_24329 ) ( POWER_AVAIL ?auto_24327 ) ( POINTING ?auto_24327 ?auto_24323 ) ( not ( = ?auto_24329 ?auto_24323 ) ) ( not ( = ?auto_24315 ?auto_24323 ) ) ( not ( = ?auto_24316 ?auto_24322 ) ) ( not ( = ?auto_24321 ?auto_24323 ) ) ( not ( = ?auto_24315 ?auto_24319 ) ) ( not ( = ?auto_24316 ?auto_24320 ) ) ( not ( = ?auto_24322 ?auto_24320 ) ) ( not ( = ?auto_24319 ?auto_24323 ) ) ( not ( = ?auto_24326 ?auto_24324 ) ) ( not ( = ?auto_24315 ?auto_24318 ) ) ( not ( = ?auto_24316 ?auto_24317 ) ) ( not ( = ?auto_24321 ?auto_24318 ) ) ( not ( = ?auto_24322 ?auto_24317 ) ) ( not ( = ?auto_24320 ?auto_24317 ) ) ( not ( = ?auto_24318 ?auto_24323 ) ) ( not ( = ?auto_24325 ?auto_24328 ) ) ( not ( = ?auto_24325 ?auto_24324 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_24315 ?auto_24316 ?auto_24321 ?auto_24322 ?auto_24318 ?auto_24317 ?auto_24319 ?auto_24320 )
      ( GET-4IMAGE-VERIFY ?auto_24315 ?auto_24316 ?auto_24318 ?auto_24317 ?auto_24319 ?auto_24320 ?auto_24321 ?auto_24322 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_24470 - DIRECTION
      ?auto_24471 - MODE
      ?auto_24473 - DIRECTION
      ?auto_24472 - MODE
      ?auto_24474 - DIRECTION
      ?auto_24475 - MODE
      ?auto_24476 - DIRECTION
      ?auto_24477 - MODE
    )
    :vars
    (
      ?auto_24480 - INSTRUMENT
      ?auto_24482 - SATELLITE
      ?auto_24484 - DIRECTION
      ?auto_24481 - INSTRUMENT
      ?auto_24483 - INSTRUMENT
      ?auto_24479 - INSTRUMENT
      ?auto_24478 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24480 ?auto_24482 ) ( SUPPORTS ?auto_24480 ?auto_24477 ) ( not ( = ?auto_24476 ?auto_24484 ) ) ( CALIBRATION_TARGET ?auto_24480 ?auto_24484 ) ( not ( = ?auto_24484 ?auto_24474 ) ) ( ON_BOARD ?auto_24481 ?auto_24482 ) ( not ( = ?auto_24476 ?auto_24474 ) ) ( not ( = ?auto_24480 ?auto_24481 ) ) ( SUPPORTS ?auto_24481 ?auto_24475 ) ( CALIBRATION_TARGET ?auto_24481 ?auto_24484 ) ( not ( = ?auto_24484 ?auto_24470 ) ) ( ON_BOARD ?auto_24483 ?auto_24482 ) ( not ( = ?auto_24474 ?auto_24470 ) ) ( not ( = ?auto_24481 ?auto_24483 ) ) ( SUPPORTS ?auto_24483 ?auto_24471 ) ( CALIBRATION_TARGET ?auto_24483 ?auto_24484 ) ( not ( = ?auto_24484 ?auto_24473 ) ) ( ON_BOARD ?auto_24479 ?auto_24482 ) ( not ( = ?auto_24470 ?auto_24473 ) ) ( not ( = ?auto_24483 ?auto_24479 ) ) ( SUPPORTS ?auto_24479 ?auto_24472 ) ( CALIBRATION_TARGET ?auto_24479 ?auto_24484 ) ( POWER_AVAIL ?auto_24482 ) ( POINTING ?auto_24482 ?auto_24478 ) ( not ( = ?auto_24484 ?auto_24478 ) ) ( not ( = ?auto_24473 ?auto_24478 ) ) ( not ( = ?auto_24472 ?auto_24471 ) ) ( not ( = ?auto_24470 ?auto_24478 ) ) ( not ( = ?auto_24473 ?auto_24474 ) ) ( not ( = ?auto_24472 ?auto_24475 ) ) ( not ( = ?auto_24471 ?auto_24475 ) ) ( not ( = ?auto_24474 ?auto_24478 ) ) ( not ( = ?auto_24481 ?auto_24479 ) ) ( not ( = ?auto_24473 ?auto_24476 ) ) ( not ( = ?auto_24472 ?auto_24477 ) ) ( not ( = ?auto_24470 ?auto_24476 ) ) ( not ( = ?auto_24471 ?auto_24477 ) ) ( not ( = ?auto_24475 ?auto_24477 ) ) ( not ( = ?auto_24476 ?auto_24478 ) ) ( not ( = ?auto_24480 ?auto_24483 ) ) ( not ( = ?auto_24480 ?auto_24479 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_24473 ?auto_24472 ?auto_24470 ?auto_24471 ?auto_24476 ?auto_24477 ?auto_24474 ?auto_24475 )
      ( GET-4IMAGE-VERIFY ?auto_24470 ?auto_24471 ?auto_24473 ?auto_24472 ?auto_24474 ?auto_24475 ?auto_24476 ?auto_24477 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_24519 - DIRECTION
      ?auto_24520 - MODE
      ?auto_24522 - DIRECTION
      ?auto_24521 - MODE
      ?auto_24523 - DIRECTION
      ?auto_24524 - MODE
      ?auto_24525 - DIRECTION
      ?auto_24526 - MODE
    )
    :vars
    (
      ?auto_24529 - INSTRUMENT
      ?auto_24531 - SATELLITE
      ?auto_24533 - DIRECTION
      ?auto_24530 - INSTRUMENT
      ?auto_24532 - INSTRUMENT
      ?auto_24528 - INSTRUMENT
      ?auto_24527 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24529 ?auto_24531 ) ( SUPPORTS ?auto_24529 ?auto_24524 ) ( not ( = ?auto_24523 ?auto_24533 ) ) ( CALIBRATION_TARGET ?auto_24529 ?auto_24533 ) ( not ( = ?auto_24533 ?auto_24525 ) ) ( ON_BOARD ?auto_24530 ?auto_24531 ) ( not ( = ?auto_24523 ?auto_24525 ) ) ( not ( = ?auto_24529 ?auto_24530 ) ) ( SUPPORTS ?auto_24530 ?auto_24526 ) ( CALIBRATION_TARGET ?auto_24530 ?auto_24533 ) ( not ( = ?auto_24533 ?auto_24519 ) ) ( ON_BOARD ?auto_24532 ?auto_24531 ) ( not ( = ?auto_24525 ?auto_24519 ) ) ( not ( = ?auto_24530 ?auto_24532 ) ) ( SUPPORTS ?auto_24532 ?auto_24520 ) ( CALIBRATION_TARGET ?auto_24532 ?auto_24533 ) ( not ( = ?auto_24533 ?auto_24522 ) ) ( ON_BOARD ?auto_24528 ?auto_24531 ) ( not ( = ?auto_24519 ?auto_24522 ) ) ( not ( = ?auto_24532 ?auto_24528 ) ) ( SUPPORTS ?auto_24528 ?auto_24521 ) ( CALIBRATION_TARGET ?auto_24528 ?auto_24533 ) ( POWER_AVAIL ?auto_24531 ) ( POINTING ?auto_24531 ?auto_24527 ) ( not ( = ?auto_24533 ?auto_24527 ) ) ( not ( = ?auto_24522 ?auto_24527 ) ) ( not ( = ?auto_24521 ?auto_24520 ) ) ( not ( = ?auto_24519 ?auto_24527 ) ) ( not ( = ?auto_24522 ?auto_24525 ) ) ( not ( = ?auto_24521 ?auto_24526 ) ) ( not ( = ?auto_24520 ?auto_24526 ) ) ( not ( = ?auto_24525 ?auto_24527 ) ) ( not ( = ?auto_24530 ?auto_24528 ) ) ( not ( = ?auto_24522 ?auto_24523 ) ) ( not ( = ?auto_24521 ?auto_24524 ) ) ( not ( = ?auto_24519 ?auto_24523 ) ) ( not ( = ?auto_24520 ?auto_24524 ) ) ( not ( = ?auto_24526 ?auto_24524 ) ) ( not ( = ?auto_24523 ?auto_24527 ) ) ( not ( = ?auto_24529 ?auto_24532 ) ) ( not ( = ?auto_24529 ?auto_24528 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_24522 ?auto_24521 ?auto_24519 ?auto_24520 ?auto_24523 ?auto_24524 ?auto_24525 ?auto_24526 )
      ( GET-4IMAGE-VERIFY ?auto_24519 ?auto_24520 ?auto_24522 ?auto_24521 ?auto_24523 ?auto_24524 ?auto_24525 ?auto_24526 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_24676 - DIRECTION
      ?auto_24677 - MODE
      ?auto_24679 - DIRECTION
      ?auto_24678 - MODE
      ?auto_24680 - DIRECTION
      ?auto_24681 - MODE
      ?auto_24682 - DIRECTION
      ?auto_24683 - MODE
    )
    :vars
    (
      ?auto_24686 - INSTRUMENT
      ?auto_24688 - SATELLITE
      ?auto_24690 - DIRECTION
      ?auto_24687 - INSTRUMENT
      ?auto_24689 - INSTRUMENT
      ?auto_24685 - INSTRUMENT
      ?auto_24684 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24686 ?auto_24688 ) ( SUPPORTS ?auto_24686 ?auto_24683 ) ( not ( = ?auto_24682 ?auto_24690 ) ) ( CALIBRATION_TARGET ?auto_24686 ?auto_24690 ) ( not ( = ?auto_24690 ?auto_24679 ) ) ( ON_BOARD ?auto_24687 ?auto_24688 ) ( not ( = ?auto_24682 ?auto_24679 ) ) ( not ( = ?auto_24686 ?auto_24687 ) ) ( SUPPORTS ?auto_24687 ?auto_24678 ) ( CALIBRATION_TARGET ?auto_24687 ?auto_24690 ) ( not ( = ?auto_24690 ?auto_24676 ) ) ( ON_BOARD ?auto_24689 ?auto_24688 ) ( not ( = ?auto_24679 ?auto_24676 ) ) ( not ( = ?auto_24687 ?auto_24689 ) ) ( SUPPORTS ?auto_24689 ?auto_24677 ) ( CALIBRATION_TARGET ?auto_24689 ?auto_24690 ) ( not ( = ?auto_24690 ?auto_24680 ) ) ( ON_BOARD ?auto_24685 ?auto_24688 ) ( not ( = ?auto_24676 ?auto_24680 ) ) ( not ( = ?auto_24689 ?auto_24685 ) ) ( SUPPORTS ?auto_24685 ?auto_24681 ) ( CALIBRATION_TARGET ?auto_24685 ?auto_24690 ) ( POWER_AVAIL ?auto_24688 ) ( POINTING ?auto_24688 ?auto_24684 ) ( not ( = ?auto_24690 ?auto_24684 ) ) ( not ( = ?auto_24680 ?auto_24684 ) ) ( not ( = ?auto_24681 ?auto_24677 ) ) ( not ( = ?auto_24676 ?auto_24684 ) ) ( not ( = ?auto_24680 ?auto_24679 ) ) ( not ( = ?auto_24681 ?auto_24678 ) ) ( not ( = ?auto_24677 ?auto_24678 ) ) ( not ( = ?auto_24679 ?auto_24684 ) ) ( not ( = ?auto_24687 ?auto_24685 ) ) ( not ( = ?auto_24680 ?auto_24682 ) ) ( not ( = ?auto_24681 ?auto_24683 ) ) ( not ( = ?auto_24676 ?auto_24682 ) ) ( not ( = ?auto_24677 ?auto_24683 ) ) ( not ( = ?auto_24678 ?auto_24683 ) ) ( not ( = ?auto_24682 ?auto_24684 ) ) ( not ( = ?auto_24686 ?auto_24689 ) ) ( not ( = ?auto_24686 ?auto_24685 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_24680 ?auto_24681 ?auto_24676 ?auto_24677 ?auto_24682 ?auto_24683 ?auto_24679 ?auto_24678 )
      ( GET-4IMAGE-VERIFY ?auto_24676 ?auto_24677 ?auto_24679 ?auto_24678 ?auto_24680 ?auto_24681 ?auto_24682 ?auto_24683 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_24725 - DIRECTION
      ?auto_24726 - MODE
      ?auto_24728 - DIRECTION
      ?auto_24727 - MODE
      ?auto_24729 - DIRECTION
      ?auto_24730 - MODE
      ?auto_24731 - DIRECTION
      ?auto_24732 - MODE
    )
    :vars
    (
      ?auto_24735 - INSTRUMENT
      ?auto_24737 - SATELLITE
      ?auto_24739 - DIRECTION
      ?auto_24736 - INSTRUMENT
      ?auto_24738 - INSTRUMENT
      ?auto_24734 - INSTRUMENT
      ?auto_24733 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24735 ?auto_24737 ) ( SUPPORTS ?auto_24735 ?auto_24730 ) ( not ( = ?auto_24729 ?auto_24739 ) ) ( CALIBRATION_TARGET ?auto_24735 ?auto_24739 ) ( not ( = ?auto_24739 ?auto_24728 ) ) ( ON_BOARD ?auto_24736 ?auto_24737 ) ( not ( = ?auto_24729 ?auto_24728 ) ) ( not ( = ?auto_24735 ?auto_24736 ) ) ( SUPPORTS ?auto_24736 ?auto_24727 ) ( CALIBRATION_TARGET ?auto_24736 ?auto_24739 ) ( not ( = ?auto_24739 ?auto_24725 ) ) ( ON_BOARD ?auto_24738 ?auto_24737 ) ( not ( = ?auto_24728 ?auto_24725 ) ) ( not ( = ?auto_24736 ?auto_24738 ) ) ( SUPPORTS ?auto_24738 ?auto_24726 ) ( CALIBRATION_TARGET ?auto_24738 ?auto_24739 ) ( not ( = ?auto_24739 ?auto_24731 ) ) ( ON_BOARD ?auto_24734 ?auto_24737 ) ( not ( = ?auto_24725 ?auto_24731 ) ) ( not ( = ?auto_24738 ?auto_24734 ) ) ( SUPPORTS ?auto_24734 ?auto_24732 ) ( CALIBRATION_TARGET ?auto_24734 ?auto_24739 ) ( POWER_AVAIL ?auto_24737 ) ( POINTING ?auto_24737 ?auto_24733 ) ( not ( = ?auto_24739 ?auto_24733 ) ) ( not ( = ?auto_24731 ?auto_24733 ) ) ( not ( = ?auto_24732 ?auto_24726 ) ) ( not ( = ?auto_24725 ?auto_24733 ) ) ( not ( = ?auto_24731 ?auto_24728 ) ) ( not ( = ?auto_24732 ?auto_24727 ) ) ( not ( = ?auto_24726 ?auto_24727 ) ) ( not ( = ?auto_24728 ?auto_24733 ) ) ( not ( = ?auto_24736 ?auto_24734 ) ) ( not ( = ?auto_24731 ?auto_24729 ) ) ( not ( = ?auto_24732 ?auto_24730 ) ) ( not ( = ?auto_24725 ?auto_24729 ) ) ( not ( = ?auto_24726 ?auto_24730 ) ) ( not ( = ?auto_24727 ?auto_24730 ) ) ( not ( = ?auto_24729 ?auto_24733 ) ) ( not ( = ?auto_24735 ?auto_24738 ) ) ( not ( = ?auto_24735 ?auto_24734 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_24731 ?auto_24732 ?auto_24725 ?auto_24726 ?auto_24729 ?auto_24730 ?auto_24728 ?auto_24727 )
      ( GET-4IMAGE-VERIFY ?auto_24725 ?auto_24726 ?auto_24728 ?auto_24727 ?auto_24729 ?auto_24730 ?auto_24731 ?auto_24732 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_24825 - DIRECTION
      ?auto_24826 - MODE
      ?auto_24828 - DIRECTION
      ?auto_24827 - MODE
      ?auto_24829 - DIRECTION
      ?auto_24830 - MODE
      ?auto_24831 - DIRECTION
      ?auto_24832 - MODE
    )
    :vars
    (
      ?auto_24835 - INSTRUMENT
      ?auto_24837 - SATELLITE
      ?auto_24839 - DIRECTION
      ?auto_24836 - INSTRUMENT
      ?auto_24838 - INSTRUMENT
      ?auto_24834 - INSTRUMENT
      ?auto_24833 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24835 ?auto_24837 ) ( SUPPORTS ?auto_24835 ?auto_24827 ) ( not ( = ?auto_24828 ?auto_24839 ) ) ( CALIBRATION_TARGET ?auto_24835 ?auto_24839 ) ( not ( = ?auto_24839 ?auto_24831 ) ) ( ON_BOARD ?auto_24836 ?auto_24837 ) ( not ( = ?auto_24828 ?auto_24831 ) ) ( not ( = ?auto_24835 ?auto_24836 ) ) ( SUPPORTS ?auto_24836 ?auto_24832 ) ( CALIBRATION_TARGET ?auto_24836 ?auto_24839 ) ( not ( = ?auto_24839 ?auto_24825 ) ) ( ON_BOARD ?auto_24838 ?auto_24837 ) ( not ( = ?auto_24831 ?auto_24825 ) ) ( not ( = ?auto_24836 ?auto_24838 ) ) ( SUPPORTS ?auto_24838 ?auto_24826 ) ( CALIBRATION_TARGET ?auto_24838 ?auto_24839 ) ( not ( = ?auto_24839 ?auto_24829 ) ) ( ON_BOARD ?auto_24834 ?auto_24837 ) ( not ( = ?auto_24825 ?auto_24829 ) ) ( not ( = ?auto_24838 ?auto_24834 ) ) ( SUPPORTS ?auto_24834 ?auto_24830 ) ( CALIBRATION_TARGET ?auto_24834 ?auto_24839 ) ( POWER_AVAIL ?auto_24837 ) ( POINTING ?auto_24837 ?auto_24833 ) ( not ( = ?auto_24839 ?auto_24833 ) ) ( not ( = ?auto_24829 ?auto_24833 ) ) ( not ( = ?auto_24830 ?auto_24826 ) ) ( not ( = ?auto_24825 ?auto_24833 ) ) ( not ( = ?auto_24829 ?auto_24831 ) ) ( not ( = ?auto_24830 ?auto_24832 ) ) ( not ( = ?auto_24826 ?auto_24832 ) ) ( not ( = ?auto_24831 ?auto_24833 ) ) ( not ( = ?auto_24836 ?auto_24834 ) ) ( not ( = ?auto_24829 ?auto_24828 ) ) ( not ( = ?auto_24830 ?auto_24827 ) ) ( not ( = ?auto_24825 ?auto_24828 ) ) ( not ( = ?auto_24826 ?auto_24827 ) ) ( not ( = ?auto_24832 ?auto_24827 ) ) ( not ( = ?auto_24828 ?auto_24833 ) ) ( not ( = ?auto_24835 ?auto_24838 ) ) ( not ( = ?auto_24835 ?auto_24834 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_24829 ?auto_24830 ?auto_24825 ?auto_24826 ?auto_24828 ?auto_24827 ?auto_24831 ?auto_24832 )
      ( GET-4IMAGE-VERIFY ?auto_24825 ?auto_24826 ?auto_24828 ?auto_24827 ?auto_24829 ?auto_24830 ?auto_24831 ?auto_24832 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_24929 - DIRECTION
      ?auto_24930 - MODE
      ?auto_24932 - DIRECTION
      ?auto_24931 - MODE
      ?auto_24933 - DIRECTION
      ?auto_24934 - MODE
      ?auto_24935 - DIRECTION
      ?auto_24936 - MODE
    )
    :vars
    (
      ?auto_24939 - INSTRUMENT
      ?auto_24941 - SATELLITE
      ?auto_24943 - DIRECTION
      ?auto_24940 - INSTRUMENT
      ?auto_24942 - INSTRUMENT
      ?auto_24938 - INSTRUMENT
      ?auto_24937 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24939 ?auto_24941 ) ( SUPPORTS ?auto_24939 ?auto_24931 ) ( not ( = ?auto_24932 ?auto_24943 ) ) ( CALIBRATION_TARGET ?auto_24939 ?auto_24943 ) ( not ( = ?auto_24943 ?auto_24933 ) ) ( ON_BOARD ?auto_24940 ?auto_24941 ) ( not ( = ?auto_24932 ?auto_24933 ) ) ( not ( = ?auto_24939 ?auto_24940 ) ) ( SUPPORTS ?auto_24940 ?auto_24934 ) ( CALIBRATION_TARGET ?auto_24940 ?auto_24943 ) ( not ( = ?auto_24943 ?auto_24929 ) ) ( ON_BOARD ?auto_24942 ?auto_24941 ) ( not ( = ?auto_24933 ?auto_24929 ) ) ( not ( = ?auto_24940 ?auto_24942 ) ) ( SUPPORTS ?auto_24942 ?auto_24930 ) ( CALIBRATION_TARGET ?auto_24942 ?auto_24943 ) ( not ( = ?auto_24943 ?auto_24935 ) ) ( ON_BOARD ?auto_24938 ?auto_24941 ) ( not ( = ?auto_24929 ?auto_24935 ) ) ( not ( = ?auto_24942 ?auto_24938 ) ) ( SUPPORTS ?auto_24938 ?auto_24936 ) ( CALIBRATION_TARGET ?auto_24938 ?auto_24943 ) ( POWER_AVAIL ?auto_24941 ) ( POINTING ?auto_24941 ?auto_24937 ) ( not ( = ?auto_24943 ?auto_24937 ) ) ( not ( = ?auto_24935 ?auto_24937 ) ) ( not ( = ?auto_24936 ?auto_24930 ) ) ( not ( = ?auto_24929 ?auto_24937 ) ) ( not ( = ?auto_24935 ?auto_24933 ) ) ( not ( = ?auto_24936 ?auto_24934 ) ) ( not ( = ?auto_24930 ?auto_24934 ) ) ( not ( = ?auto_24933 ?auto_24937 ) ) ( not ( = ?auto_24940 ?auto_24938 ) ) ( not ( = ?auto_24935 ?auto_24932 ) ) ( not ( = ?auto_24936 ?auto_24931 ) ) ( not ( = ?auto_24929 ?auto_24932 ) ) ( not ( = ?auto_24930 ?auto_24931 ) ) ( not ( = ?auto_24934 ?auto_24931 ) ) ( not ( = ?auto_24932 ?auto_24937 ) ) ( not ( = ?auto_24939 ?auto_24942 ) ) ( not ( = ?auto_24939 ?auto_24938 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_24935 ?auto_24936 ?auto_24929 ?auto_24930 ?auto_24932 ?auto_24931 ?auto_24933 ?auto_24934 )
      ( GET-4IMAGE-VERIFY ?auto_24929 ?auto_24930 ?auto_24932 ?auto_24931 ?auto_24933 ?auto_24934 ?auto_24935 ?auto_24936 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_25084 - DIRECTION
      ?auto_25085 - MODE
      ?auto_25087 - DIRECTION
      ?auto_25086 - MODE
      ?auto_25088 - DIRECTION
      ?auto_25089 - MODE
      ?auto_25090 - DIRECTION
      ?auto_25091 - MODE
    )
    :vars
    (
      ?auto_25094 - INSTRUMENT
      ?auto_25096 - SATELLITE
      ?auto_25098 - DIRECTION
      ?auto_25095 - INSTRUMENT
      ?auto_25097 - INSTRUMENT
      ?auto_25093 - INSTRUMENT
      ?auto_25092 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25094 ?auto_25096 ) ( SUPPORTS ?auto_25094 ?auto_25091 ) ( not ( = ?auto_25090 ?auto_25098 ) ) ( CALIBRATION_TARGET ?auto_25094 ?auto_25098 ) ( not ( = ?auto_25098 ?auto_25084 ) ) ( ON_BOARD ?auto_25095 ?auto_25096 ) ( not ( = ?auto_25090 ?auto_25084 ) ) ( not ( = ?auto_25094 ?auto_25095 ) ) ( SUPPORTS ?auto_25095 ?auto_25085 ) ( CALIBRATION_TARGET ?auto_25095 ?auto_25098 ) ( not ( = ?auto_25098 ?auto_25088 ) ) ( ON_BOARD ?auto_25097 ?auto_25096 ) ( not ( = ?auto_25084 ?auto_25088 ) ) ( not ( = ?auto_25095 ?auto_25097 ) ) ( SUPPORTS ?auto_25097 ?auto_25089 ) ( CALIBRATION_TARGET ?auto_25097 ?auto_25098 ) ( not ( = ?auto_25098 ?auto_25087 ) ) ( ON_BOARD ?auto_25093 ?auto_25096 ) ( not ( = ?auto_25088 ?auto_25087 ) ) ( not ( = ?auto_25097 ?auto_25093 ) ) ( SUPPORTS ?auto_25093 ?auto_25086 ) ( CALIBRATION_TARGET ?auto_25093 ?auto_25098 ) ( POWER_AVAIL ?auto_25096 ) ( POINTING ?auto_25096 ?auto_25092 ) ( not ( = ?auto_25098 ?auto_25092 ) ) ( not ( = ?auto_25087 ?auto_25092 ) ) ( not ( = ?auto_25086 ?auto_25089 ) ) ( not ( = ?auto_25088 ?auto_25092 ) ) ( not ( = ?auto_25087 ?auto_25084 ) ) ( not ( = ?auto_25086 ?auto_25085 ) ) ( not ( = ?auto_25089 ?auto_25085 ) ) ( not ( = ?auto_25084 ?auto_25092 ) ) ( not ( = ?auto_25095 ?auto_25093 ) ) ( not ( = ?auto_25087 ?auto_25090 ) ) ( not ( = ?auto_25086 ?auto_25091 ) ) ( not ( = ?auto_25088 ?auto_25090 ) ) ( not ( = ?auto_25089 ?auto_25091 ) ) ( not ( = ?auto_25085 ?auto_25091 ) ) ( not ( = ?auto_25090 ?auto_25092 ) ) ( not ( = ?auto_25094 ?auto_25097 ) ) ( not ( = ?auto_25094 ?auto_25093 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_25087 ?auto_25086 ?auto_25088 ?auto_25089 ?auto_25090 ?auto_25091 ?auto_25084 ?auto_25085 )
      ( GET-4IMAGE-VERIFY ?auto_25084 ?auto_25085 ?auto_25087 ?auto_25086 ?auto_25088 ?auto_25089 ?auto_25090 ?auto_25091 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_25133 - DIRECTION
      ?auto_25134 - MODE
      ?auto_25136 - DIRECTION
      ?auto_25135 - MODE
      ?auto_25137 - DIRECTION
      ?auto_25138 - MODE
      ?auto_25139 - DIRECTION
      ?auto_25140 - MODE
    )
    :vars
    (
      ?auto_25143 - INSTRUMENT
      ?auto_25145 - SATELLITE
      ?auto_25147 - DIRECTION
      ?auto_25144 - INSTRUMENT
      ?auto_25146 - INSTRUMENT
      ?auto_25142 - INSTRUMENT
      ?auto_25141 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25143 ?auto_25145 ) ( SUPPORTS ?auto_25143 ?auto_25138 ) ( not ( = ?auto_25137 ?auto_25147 ) ) ( CALIBRATION_TARGET ?auto_25143 ?auto_25147 ) ( not ( = ?auto_25147 ?auto_25133 ) ) ( ON_BOARD ?auto_25144 ?auto_25145 ) ( not ( = ?auto_25137 ?auto_25133 ) ) ( not ( = ?auto_25143 ?auto_25144 ) ) ( SUPPORTS ?auto_25144 ?auto_25134 ) ( CALIBRATION_TARGET ?auto_25144 ?auto_25147 ) ( not ( = ?auto_25147 ?auto_25139 ) ) ( ON_BOARD ?auto_25146 ?auto_25145 ) ( not ( = ?auto_25133 ?auto_25139 ) ) ( not ( = ?auto_25144 ?auto_25146 ) ) ( SUPPORTS ?auto_25146 ?auto_25140 ) ( CALIBRATION_TARGET ?auto_25146 ?auto_25147 ) ( not ( = ?auto_25147 ?auto_25136 ) ) ( ON_BOARD ?auto_25142 ?auto_25145 ) ( not ( = ?auto_25139 ?auto_25136 ) ) ( not ( = ?auto_25146 ?auto_25142 ) ) ( SUPPORTS ?auto_25142 ?auto_25135 ) ( CALIBRATION_TARGET ?auto_25142 ?auto_25147 ) ( POWER_AVAIL ?auto_25145 ) ( POINTING ?auto_25145 ?auto_25141 ) ( not ( = ?auto_25147 ?auto_25141 ) ) ( not ( = ?auto_25136 ?auto_25141 ) ) ( not ( = ?auto_25135 ?auto_25140 ) ) ( not ( = ?auto_25139 ?auto_25141 ) ) ( not ( = ?auto_25136 ?auto_25133 ) ) ( not ( = ?auto_25135 ?auto_25134 ) ) ( not ( = ?auto_25140 ?auto_25134 ) ) ( not ( = ?auto_25133 ?auto_25141 ) ) ( not ( = ?auto_25144 ?auto_25142 ) ) ( not ( = ?auto_25136 ?auto_25137 ) ) ( not ( = ?auto_25135 ?auto_25138 ) ) ( not ( = ?auto_25139 ?auto_25137 ) ) ( not ( = ?auto_25140 ?auto_25138 ) ) ( not ( = ?auto_25134 ?auto_25138 ) ) ( not ( = ?auto_25137 ?auto_25141 ) ) ( not ( = ?auto_25143 ?auto_25146 ) ) ( not ( = ?auto_25143 ?auto_25142 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_25136 ?auto_25135 ?auto_25139 ?auto_25140 ?auto_25137 ?auto_25138 ?auto_25133 ?auto_25134 )
      ( GET-4IMAGE-VERIFY ?auto_25133 ?auto_25134 ?auto_25136 ?auto_25135 ?auto_25137 ?auto_25138 ?auto_25139 ?auto_25140 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_25182 - DIRECTION
      ?auto_25183 - MODE
      ?auto_25185 - DIRECTION
      ?auto_25184 - MODE
      ?auto_25186 - DIRECTION
      ?auto_25187 - MODE
      ?auto_25188 - DIRECTION
      ?auto_25189 - MODE
    )
    :vars
    (
      ?auto_25192 - INSTRUMENT
      ?auto_25194 - SATELLITE
      ?auto_25196 - DIRECTION
      ?auto_25193 - INSTRUMENT
      ?auto_25195 - INSTRUMENT
      ?auto_25191 - INSTRUMENT
      ?auto_25190 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25192 ?auto_25194 ) ( SUPPORTS ?auto_25192 ?auto_25189 ) ( not ( = ?auto_25188 ?auto_25196 ) ) ( CALIBRATION_TARGET ?auto_25192 ?auto_25196 ) ( not ( = ?auto_25196 ?auto_25182 ) ) ( ON_BOARD ?auto_25193 ?auto_25194 ) ( not ( = ?auto_25188 ?auto_25182 ) ) ( not ( = ?auto_25192 ?auto_25193 ) ) ( SUPPORTS ?auto_25193 ?auto_25183 ) ( CALIBRATION_TARGET ?auto_25193 ?auto_25196 ) ( not ( = ?auto_25196 ?auto_25185 ) ) ( ON_BOARD ?auto_25195 ?auto_25194 ) ( not ( = ?auto_25182 ?auto_25185 ) ) ( not ( = ?auto_25193 ?auto_25195 ) ) ( SUPPORTS ?auto_25195 ?auto_25184 ) ( CALIBRATION_TARGET ?auto_25195 ?auto_25196 ) ( not ( = ?auto_25196 ?auto_25186 ) ) ( ON_BOARD ?auto_25191 ?auto_25194 ) ( not ( = ?auto_25185 ?auto_25186 ) ) ( not ( = ?auto_25195 ?auto_25191 ) ) ( SUPPORTS ?auto_25191 ?auto_25187 ) ( CALIBRATION_TARGET ?auto_25191 ?auto_25196 ) ( POWER_AVAIL ?auto_25194 ) ( POINTING ?auto_25194 ?auto_25190 ) ( not ( = ?auto_25196 ?auto_25190 ) ) ( not ( = ?auto_25186 ?auto_25190 ) ) ( not ( = ?auto_25187 ?auto_25184 ) ) ( not ( = ?auto_25185 ?auto_25190 ) ) ( not ( = ?auto_25186 ?auto_25182 ) ) ( not ( = ?auto_25187 ?auto_25183 ) ) ( not ( = ?auto_25184 ?auto_25183 ) ) ( not ( = ?auto_25182 ?auto_25190 ) ) ( not ( = ?auto_25193 ?auto_25191 ) ) ( not ( = ?auto_25186 ?auto_25188 ) ) ( not ( = ?auto_25187 ?auto_25189 ) ) ( not ( = ?auto_25185 ?auto_25188 ) ) ( not ( = ?auto_25184 ?auto_25189 ) ) ( not ( = ?auto_25183 ?auto_25189 ) ) ( not ( = ?auto_25188 ?auto_25190 ) ) ( not ( = ?auto_25192 ?auto_25195 ) ) ( not ( = ?auto_25192 ?auto_25191 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_25186 ?auto_25187 ?auto_25185 ?auto_25184 ?auto_25188 ?auto_25189 ?auto_25182 ?auto_25183 )
      ( GET-4IMAGE-VERIFY ?auto_25182 ?auto_25183 ?auto_25185 ?auto_25184 ?auto_25186 ?auto_25187 ?auto_25188 ?auto_25189 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_25231 - DIRECTION
      ?auto_25232 - MODE
      ?auto_25234 - DIRECTION
      ?auto_25233 - MODE
      ?auto_25235 - DIRECTION
      ?auto_25236 - MODE
      ?auto_25237 - DIRECTION
      ?auto_25238 - MODE
    )
    :vars
    (
      ?auto_25241 - INSTRUMENT
      ?auto_25243 - SATELLITE
      ?auto_25245 - DIRECTION
      ?auto_25242 - INSTRUMENT
      ?auto_25244 - INSTRUMENT
      ?auto_25240 - INSTRUMENT
      ?auto_25239 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25241 ?auto_25243 ) ( SUPPORTS ?auto_25241 ?auto_25236 ) ( not ( = ?auto_25235 ?auto_25245 ) ) ( CALIBRATION_TARGET ?auto_25241 ?auto_25245 ) ( not ( = ?auto_25245 ?auto_25231 ) ) ( ON_BOARD ?auto_25242 ?auto_25243 ) ( not ( = ?auto_25235 ?auto_25231 ) ) ( not ( = ?auto_25241 ?auto_25242 ) ) ( SUPPORTS ?auto_25242 ?auto_25232 ) ( CALIBRATION_TARGET ?auto_25242 ?auto_25245 ) ( not ( = ?auto_25245 ?auto_25234 ) ) ( ON_BOARD ?auto_25244 ?auto_25243 ) ( not ( = ?auto_25231 ?auto_25234 ) ) ( not ( = ?auto_25242 ?auto_25244 ) ) ( SUPPORTS ?auto_25244 ?auto_25233 ) ( CALIBRATION_TARGET ?auto_25244 ?auto_25245 ) ( not ( = ?auto_25245 ?auto_25237 ) ) ( ON_BOARD ?auto_25240 ?auto_25243 ) ( not ( = ?auto_25234 ?auto_25237 ) ) ( not ( = ?auto_25244 ?auto_25240 ) ) ( SUPPORTS ?auto_25240 ?auto_25238 ) ( CALIBRATION_TARGET ?auto_25240 ?auto_25245 ) ( POWER_AVAIL ?auto_25243 ) ( POINTING ?auto_25243 ?auto_25239 ) ( not ( = ?auto_25245 ?auto_25239 ) ) ( not ( = ?auto_25237 ?auto_25239 ) ) ( not ( = ?auto_25238 ?auto_25233 ) ) ( not ( = ?auto_25234 ?auto_25239 ) ) ( not ( = ?auto_25237 ?auto_25231 ) ) ( not ( = ?auto_25238 ?auto_25232 ) ) ( not ( = ?auto_25233 ?auto_25232 ) ) ( not ( = ?auto_25231 ?auto_25239 ) ) ( not ( = ?auto_25242 ?auto_25240 ) ) ( not ( = ?auto_25237 ?auto_25235 ) ) ( not ( = ?auto_25238 ?auto_25236 ) ) ( not ( = ?auto_25234 ?auto_25235 ) ) ( not ( = ?auto_25233 ?auto_25236 ) ) ( not ( = ?auto_25232 ?auto_25236 ) ) ( not ( = ?auto_25235 ?auto_25239 ) ) ( not ( = ?auto_25241 ?auto_25244 ) ) ( not ( = ?auto_25241 ?auto_25240 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_25237 ?auto_25238 ?auto_25234 ?auto_25233 ?auto_25235 ?auto_25236 ?auto_25231 ?auto_25232 )
      ( GET-4IMAGE-VERIFY ?auto_25231 ?auto_25232 ?auto_25234 ?auto_25233 ?auto_25235 ?auto_25236 ?auto_25237 ?auto_25238 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_25439 - DIRECTION
      ?auto_25440 - MODE
      ?auto_25442 - DIRECTION
      ?auto_25441 - MODE
      ?auto_25443 - DIRECTION
      ?auto_25444 - MODE
      ?auto_25445 - DIRECTION
      ?auto_25446 - MODE
    )
    :vars
    (
      ?auto_25449 - INSTRUMENT
      ?auto_25451 - SATELLITE
      ?auto_25453 - DIRECTION
      ?auto_25450 - INSTRUMENT
      ?auto_25452 - INSTRUMENT
      ?auto_25448 - INSTRUMENT
      ?auto_25447 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25449 ?auto_25451 ) ( SUPPORTS ?auto_25449 ?auto_25441 ) ( not ( = ?auto_25442 ?auto_25453 ) ) ( CALIBRATION_TARGET ?auto_25449 ?auto_25453 ) ( not ( = ?auto_25453 ?auto_25439 ) ) ( ON_BOARD ?auto_25450 ?auto_25451 ) ( not ( = ?auto_25442 ?auto_25439 ) ) ( not ( = ?auto_25449 ?auto_25450 ) ) ( SUPPORTS ?auto_25450 ?auto_25440 ) ( CALIBRATION_TARGET ?auto_25450 ?auto_25453 ) ( not ( = ?auto_25453 ?auto_25445 ) ) ( ON_BOARD ?auto_25452 ?auto_25451 ) ( not ( = ?auto_25439 ?auto_25445 ) ) ( not ( = ?auto_25450 ?auto_25452 ) ) ( SUPPORTS ?auto_25452 ?auto_25446 ) ( CALIBRATION_TARGET ?auto_25452 ?auto_25453 ) ( not ( = ?auto_25453 ?auto_25443 ) ) ( ON_BOARD ?auto_25448 ?auto_25451 ) ( not ( = ?auto_25445 ?auto_25443 ) ) ( not ( = ?auto_25452 ?auto_25448 ) ) ( SUPPORTS ?auto_25448 ?auto_25444 ) ( CALIBRATION_TARGET ?auto_25448 ?auto_25453 ) ( POWER_AVAIL ?auto_25451 ) ( POINTING ?auto_25451 ?auto_25447 ) ( not ( = ?auto_25453 ?auto_25447 ) ) ( not ( = ?auto_25443 ?auto_25447 ) ) ( not ( = ?auto_25444 ?auto_25446 ) ) ( not ( = ?auto_25445 ?auto_25447 ) ) ( not ( = ?auto_25443 ?auto_25439 ) ) ( not ( = ?auto_25444 ?auto_25440 ) ) ( not ( = ?auto_25446 ?auto_25440 ) ) ( not ( = ?auto_25439 ?auto_25447 ) ) ( not ( = ?auto_25450 ?auto_25448 ) ) ( not ( = ?auto_25443 ?auto_25442 ) ) ( not ( = ?auto_25444 ?auto_25441 ) ) ( not ( = ?auto_25445 ?auto_25442 ) ) ( not ( = ?auto_25446 ?auto_25441 ) ) ( not ( = ?auto_25440 ?auto_25441 ) ) ( not ( = ?auto_25442 ?auto_25447 ) ) ( not ( = ?auto_25449 ?auto_25452 ) ) ( not ( = ?auto_25449 ?auto_25448 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_25443 ?auto_25444 ?auto_25445 ?auto_25446 ?auto_25442 ?auto_25441 ?auto_25439 ?auto_25440 )
      ( GET-4IMAGE-VERIFY ?auto_25439 ?auto_25440 ?auto_25442 ?auto_25441 ?auto_25443 ?auto_25444 ?auto_25445 ?auto_25446 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_25488 - DIRECTION
      ?auto_25489 - MODE
      ?auto_25491 - DIRECTION
      ?auto_25490 - MODE
      ?auto_25492 - DIRECTION
      ?auto_25493 - MODE
      ?auto_25494 - DIRECTION
      ?auto_25495 - MODE
    )
    :vars
    (
      ?auto_25498 - INSTRUMENT
      ?auto_25500 - SATELLITE
      ?auto_25502 - DIRECTION
      ?auto_25499 - INSTRUMENT
      ?auto_25501 - INSTRUMENT
      ?auto_25497 - INSTRUMENT
      ?auto_25496 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25498 ?auto_25500 ) ( SUPPORTS ?auto_25498 ?auto_25490 ) ( not ( = ?auto_25491 ?auto_25502 ) ) ( CALIBRATION_TARGET ?auto_25498 ?auto_25502 ) ( not ( = ?auto_25502 ?auto_25488 ) ) ( ON_BOARD ?auto_25499 ?auto_25500 ) ( not ( = ?auto_25491 ?auto_25488 ) ) ( not ( = ?auto_25498 ?auto_25499 ) ) ( SUPPORTS ?auto_25499 ?auto_25489 ) ( CALIBRATION_TARGET ?auto_25499 ?auto_25502 ) ( not ( = ?auto_25502 ?auto_25492 ) ) ( ON_BOARD ?auto_25501 ?auto_25500 ) ( not ( = ?auto_25488 ?auto_25492 ) ) ( not ( = ?auto_25499 ?auto_25501 ) ) ( SUPPORTS ?auto_25501 ?auto_25493 ) ( CALIBRATION_TARGET ?auto_25501 ?auto_25502 ) ( not ( = ?auto_25502 ?auto_25494 ) ) ( ON_BOARD ?auto_25497 ?auto_25500 ) ( not ( = ?auto_25492 ?auto_25494 ) ) ( not ( = ?auto_25501 ?auto_25497 ) ) ( SUPPORTS ?auto_25497 ?auto_25495 ) ( CALIBRATION_TARGET ?auto_25497 ?auto_25502 ) ( POWER_AVAIL ?auto_25500 ) ( POINTING ?auto_25500 ?auto_25496 ) ( not ( = ?auto_25502 ?auto_25496 ) ) ( not ( = ?auto_25494 ?auto_25496 ) ) ( not ( = ?auto_25495 ?auto_25493 ) ) ( not ( = ?auto_25492 ?auto_25496 ) ) ( not ( = ?auto_25494 ?auto_25488 ) ) ( not ( = ?auto_25495 ?auto_25489 ) ) ( not ( = ?auto_25493 ?auto_25489 ) ) ( not ( = ?auto_25488 ?auto_25496 ) ) ( not ( = ?auto_25499 ?auto_25497 ) ) ( not ( = ?auto_25494 ?auto_25491 ) ) ( not ( = ?auto_25495 ?auto_25490 ) ) ( not ( = ?auto_25492 ?auto_25491 ) ) ( not ( = ?auto_25493 ?auto_25490 ) ) ( not ( = ?auto_25489 ?auto_25490 ) ) ( not ( = ?auto_25491 ?auto_25496 ) ) ( not ( = ?auto_25498 ?auto_25501 ) ) ( not ( = ?auto_25498 ?auto_25497 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_25494 ?auto_25495 ?auto_25492 ?auto_25493 ?auto_25491 ?auto_25490 ?auto_25488 ?auto_25489 )
      ( GET-4IMAGE-VERIFY ?auto_25488 ?auto_25489 ?auto_25491 ?auto_25490 ?auto_25492 ?auto_25493 ?auto_25494 ?auto_25495 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_25804 - DIRECTION
      ?auto_25805 - MODE
      ?auto_25807 - DIRECTION
      ?auto_25806 - MODE
      ?auto_25808 - DIRECTION
      ?auto_25809 - MODE
      ?auto_25810 - DIRECTION
      ?auto_25811 - MODE
    )
    :vars
    (
      ?auto_25814 - INSTRUMENT
      ?auto_25816 - SATELLITE
      ?auto_25818 - DIRECTION
      ?auto_25815 - INSTRUMENT
      ?auto_25817 - INSTRUMENT
      ?auto_25813 - INSTRUMENT
      ?auto_25812 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25814 ?auto_25816 ) ( SUPPORTS ?auto_25814 ?auto_25805 ) ( not ( = ?auto_25804 ?auto_25818 ) ) ( CALIBRATION_TARGET ?auto_25814 ?auto_25818 ) ( not ( = ?auto_25818 ?auto_25810 ) ) ( ON_BOARD ?auto_25815 ?auto_25816 ) ( not ( = ?auto_25804 ?auto_25810 ) ) ( not ( = ?auto_25814 ?auto_25815 ) ) ( SUPPORTS ?auto_25815 ?auto_25811 ) ( CALIBRATION_TARGET ?auto_25815 ?auto_25818 ) ( not ( = ?auto_25818 ?auto_25808 ) ) ( ON_BOARD ?auto_25817 ?auto_25816 ) ( not ( = ?auto_25810 ?auto_25808 ) ) ( not ( = ?auto_25815 ?auto_25817 ) ) ( SUPPORTS ?auto_25817 ?auto_25809 ) ( CALIBRATION_TARGET ?auto_25817 ?auto_25818 ) ( not ( = ?auto_25818 ?auto_25807 ) ) ( ON_BOARD ?auto_25813 ?auto_25816 ) ( not ( = ?auto_25808 ?auto_25807 ) ) ( not ( = ?auto_25817 ?auto_25813 ) ) ( SUPPORTS ?auto_25813 ?auto_25806 ) ( CALIBRATION_TARGET ?auto_25813 ?auto_25818 ) ( POWER_AVAIL ?auto_25816 ) ( POINTING ?auto_25816 ?auto_25812 ) ( not ( = ?auto_25818 ?auto_25812 ) ) ( not ( = ?auto_25807 ?auto_25812 ) ) ( not ( = ?auto_25806 ?auto_25809 ) ) ( not ( = ?auto_25808 ?auto_25812 ) ) ( not ( = ?auto_25807 ?auto_25810 ) ) ( not ( = ?auto_25806 ?auto_25811 ) ) ( not ( = ?auto_25809 ?auto_25811 ) ) ( not ( = ?auto_25810 ?auto_25812 ) ) ( not ( = ?auto_25815 ?auto_25813 ) ) ( not ( = ?auto_25807 ?auto_25804 ) ) ( not ( = ?auto_25806 ?auto_25805 ) ) ( not ( = ?auto_25808 ?auto_25804 ) ) ( not ( = ?auto_25809 ?auto_25805 ) ) ( not ( = ?auto_25811 ?auto_25805 ) ) ( not ( = ?auto_25804 ?auto_25812 ) ) ( not ( = ?auto_25814 ?auto_25817 ) ) ( not ( = ?auto_25814 ?auto_25813 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_25807 ?auto_25806 ?auto_25808 ?auto_25809 ?auto_25804 ?auto_25805 ?auto_25810 ?auto_25811 )
      ( GET-4IMAGE-VERIFY ?auto_25804 ?auto_25805 ?auto_25807 ?auto_25806 ?auto_25808 ?auto_25809 ?auto_25810 ?auto_25811 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_25853 - DIRECTION
      ?auto_25854 - MODE
      ?auto_25856 - DIRECTION
      ?auto_25855 - MODE
      ?auto_25857 - DIRECTION
      ?auto_25858 - MODE
      ?auto_25859 - DIRECTION
      ?auto_25860 - MODE
    )
    :vars
    (
      ?auto_25863 - INSTRUMENT
      ?auto_25865 - SATELLITE
      ?auto_25867 - DIRECTION
      ?auto_25864 - INSTRUMENT
      ?auto_25866 - INSTRUMENT
      ?auto_25862 - INSTRUMENT
      ?auto_25861 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25863 ?auto_25865 ) ( SUPPORTS ?auto_25863 ?auto_25854 ) ( not ( = ?auto_25853 ?auto_25867 ) ) ( CALIBRATION_TARGET ?auto_25863 ?auto_25867 ) ( not ( = ?auto_25867 ?auto_25857 ) ) ( ON_BOARD ?auto_25864 ?auto_25865 ) ( not ( = ?auto_25853 ?auto_25857 ) ) ( not ( = ?auto_25863 ?auto_25864 ) ) ( SUPPORTS ?auto_25864 ?auto_25858 ) ( CALIBRATION_TARGET ?auto_25864 ?auto_25867 ) ( not ( = ?auto_25867 ?auto_25859 ) ) ( ON_BOARD ?auto_25866 ?auto_25865 ) ( not ( = ?auto_25857 ?auto_25859 ) ) ( not ( = ?auto_25864 ?auto_25866 ) ) ( SUPPORTS ?auto_25866 ?auto_25860 ) ( CALIBRATION_TARGET ?auto_25866 ?auto_25867 ) ( not ( = ?auto_25867 ?auto_25856 ) ) ( ON_BOARD ?auto_25862 ?auto_25865 ) ( not ( = ?auto_25859 ?auto_25856 ) ) ( not ( = ?auto_25866 ?auto_25862 ) ) ( SUPPORTS ?auto_25862 ?auto_25855 ) ( CALIBRATION_TARGET ?auto_25862 ?auto_25867 ) ( POWER_AVAIL ?auto_25865 ) ( POINTING ?auto_25865 ?auto_25861 ) ( not ( = ?auto_25867 ?auto_25861 ) ) ( not ( = ?auto_25856 ?auto_25861 ) ) ( not ( = ?auto_25855 ?auto_25860 ) ) ( not ( = ?auto_25859 ?auto_25861 ) ) ( not ( = ?auto_25856 ?auto_25857 ) ) ( not ( = ?auto_25855 ?auto_25858 ) ) ( not ( = ?auto_25860 ?auto_25858 ) ) ( not ( = ?auto_25857 ?auto_25861 ) ) ( not ( = ?auto_25864 ?auto_25862 ) ) ( not ( = ?auto_25856 ?auto_25853 ) ) ( not ( = ?auto_25855 ?auto_25854 ) ) ( not ( = ?auto_25859 ?auto_25853 ) ) ( not ( = ?auto_25860 ?auto_25854 ) ) ( not ( = ?auto_25858 ?auto_25854 ) ) ( not ( = ?auto_25853 ?auto_25861 ) ) ( not ( = ?auto_25863 ?auto_25866 ) ) ( not ( = ?auto_25863 ?auto_25862 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_25856 ?auto_25855 ?auto_25859 ?auto_25860 ?auto_25853 ?auto_25854 ?auto_25857 ?auto_25858 )
      ( GET-4IMAGE-VERIFY ?auto_25853 ?auto_25854 ?auto_25856 ?auto_25855 ?auto_25857 ?auto_25858 ?auto_25859 ?auto_25860 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_26008 - DIRECTION
      ?auto_26009 - MODE
      ?auto_26011 - DIRECTION
      ?auto_26010 - MODE
      ?auto_26012 - DIRECTION
      ?auto_26013 - MODE
      ?auto_26014 - DIRECTION
      ?auto_26015 - MODE
    )
    :vars
    (
      ?auto_26018 - INSTRUMENT
      ?auto_26020 - SATELLITE
      ?auto_26022 - DIRECTION
      ?auto_26019 - INSTRUMENT
      ?auto_26021 - INSTRUMENT
      ?auto_26017 - INSTRUMENT
      ?auto_26016 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26018 ?auto_26020 ) ( SUPPORTS ?auto_26018 ?auto_26009 ) ( not ( = ?auto_26008 ?auto_26022 ) ) ( CALIBRATION_TARGET ?auto_26018 ?auto_26022 ) ( not ( = ?auto_26022 ?auto_26014 ) ) ( ON_BOARD ?auto_26019 ?auto_26020 ) ( not ( = ?auto_26008 ?auto_26014 ) ) ( not ( = ?auto_26018 ?auto_26019 ) ) ( SUPPORTS ?auto_26019 ?auto_26015 ) ( CALIBRATION_TARGET ?auto_26019 ?auto_26022 ) ( not ( = ?auto_26022 ?auto_26011 ) ) ( ON_BOARD ?auto_26021 ?auto_26020 ) ( not ( = ?auto_26014 ?auto_26011 ) ) ( not ( = ?auto_26019 ?auto_26021 ) ) ( SUPPORTS ?auto_26021 ?auto_26010 ) ( CALIBRATION_TARGET ?auto_26021 ?auto_26022 ) ( not ( = ?auto_26022 ?auto_26012 ) ) ( ON_BOARD ?auto_26017 ?auto_26020 ) ( not ( = ?auto_26011 ?auto_26012 ) ) ( not ( = ?auto_26021 ?auto_26017 ) ) ( SUPPORTS ?auto_26017 ?auto_26013 ) ( CALIBRATION_TARGET ?auto_26017 ?auto_26022 ) ( POWER_AVAIL ?auto_26020 ) ( POINTING ?auto_26020 ?auto_26016 ) ( not ( = ?auto_26022 ?auto_26016 ) ) ( not ( = ?auto_26012 ?auto_26016 ) ) ( not ( = ?auto_26013 ?auto_26010 ) ) ( not ( = ?auto_26011 ?auto_26016 ) ) ( not ( = ?auto_26012 ?auto_26014 ) ) ( not ( = ?auto_26013 ?auto_26015 ) ) ( not ( = ?auto_26010 ?auto_26015 ) ) ( not ( = ?auto_26014 ?auto_26016 ) ) ( not ( = ?auto_26019 ?auto_26017 ) ) ( not ( = ?auto_26012 ?auto_26008 ) ) ( not ( = ?auto_26013 ?auto_26009 ) ) ( not ( = ?auto_26011 ?auto_26008 ) ) ( not ( = ?auto_26010 ?auto_26009 ) ) ( not ( = ?auto_26015 ?auto_26009 ) ) ( not ( = ?auto_26008 ?auto_26016 ) ) ( not ( = ?auto_26018 ?auto_26021 ) ) ( not ( = ?auto_26018 ?auto_26017 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_26012 ?auto_26013 ?auto_26011 ?auto_26010 ?auto_26008 ?auto_26009 ?auto_26014 ?auto_26015 )
      ( GET-4IMAGE-VERIFY ?auto_26008 ?auto_26009 ?auto_26011 ?auto_26010 ?auto_26012 ?auto_26013 ?auto_26014 ?auto_26015 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_26112 - DIRECTION
      ?auto_26113 - MODE
      ?auto_26115 - DIRECTION
      ?auto_26114 - MODE
      ?auto_26116 - DIRECTION
      ?auto_26117 - MODE
      ?auto_26118 - DIRECTION
      ?auto_26119 - MODE
    )
    :vars
    (
      ?auto_26122 - INSTRUMENT
      ?auto_26124 - SATELLITE
      ?auto_26126 - DIRECTION
      ?auto_26123 - INSTRUMENT
      ?auto_26125 - INSTRUMENT
      ?auto_26121 - INSTRUMENT
      ?auto_26120 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26122 ?auto_26124 ) ( SUPPORTS ?auto_26122 ?auto_26113 ) ( not ( = ?auto_26112 ?auto_26126 ) ) ( CALIBRATION_TARGET ?auto_26122 ?auto_26126 ) ( not ( = ?auto_26126 ?auto_26116 ) ) ( ON_BOARD ?auto_26123 ?auto_26124 ) ( not ( = ?auto_26112 ?auto_26116 ) ) ( not ( = ?auto_26122 ?auto_26123 ) ) ( SUPPORTS ?auto_26123 ?auto_26117 ) ( CALIBRATION_TARGET ?auto_26123 ?auto_26126 ) ( not ( = ?auto_26126 ?auto_26115 ) ) ( ON_BOARD ?auto_26125 ?auto_26124 ) ( not ( = ?auto_26116 ?auto_26115 ) ) ( not ( = ?auto_26123 ?auto_26125 ) ) ( SUPPORTS ?auto_26125 ?auto_26114 ) ( CALIBRATION_TARGET ?auto_26125 ?auto_26126 ) ( not ( = ?auto_26126 ?auto_26118 ) ) ( ON_BOARD ?auto_26121 ?auto_26124 ) ( not ( = ?auto_26115 ?auto_26118 ) ) ( not ( = ?auto_26125 ?auto_26121 ) ) ( SUPPORTS ?auto_26121 ?auto_26119 ) ( CALIBRATION_TARGET ?auto_26121 ?auto_26126 ) ( POWER_AVAIL ?auto_26124 ) ( POINTING ?auto_26124 ?auto_26120 ) ( not ( = ?auto_26126 ?auto_26120 ) ) ( not ( = ?auto_26118 ?auto_26120 ) ) ( not ( = ?auto_26119 ?auto_26114 ) ) ( not ( = ?auto_26115 ?auto_26120 ) ) ( not ( = ?auto_26118 ?auto_26116 ) ) ( not ( = ?auto_26119 ?auto_26117 ) ) ( not ( = ?auto_26114 ?auto_26117 ) ) ( not ( = ?auto_26116 ?auto_26120 ) ) ( not ( = ?auto_26123 ?auto_26121 ) ) ( not ( = ?auto_26118 ?auto_26112 ) ) ( not ( = ?auto_26119 ?auto_26113 ) ) ( not ( = ?auto_26115 ?auto_26112 ) ) ( not ( = ?auto_26114 ?auto_26113 ) ) ( not ( = ?auto_26117 ?auto_26113 ) ) ( not ( = ?auto_26112 ?auto_26120 ) ) ( not ( = ?auto_26122 ?auto_26125 ) ) ( not ( = ?auto_26122 ?auto_26121 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_26118 ?auto_26119 ?auto_26115 ?auto_26114 ?auto_26112 ?auto_26113 ?auto_26116 ?auto_26117 )
      ( GET-4IMAGE-VERIFY ?auto_26112 ?auto_26113 ?auto_26115 ?auto_26114 ?auto_26116 ?auto_26117 ?auto_26118 ?auto_26119 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_26267 - DIRECTION
      ?auto_26268 - MODE
      ?auto_26270 - DIRECTION
      ?auto_26269 - MODE
      ?auto_26271 - DIRECTION
      ?auto_26272 - MODE
      ?auto_26273 - DIRECTION
      ?auto_26274 - MODE
    )
    :vars
    (
      ?auto_26277 - INSTRUMENT
      ?auto_26279 - SATELLITE
      ?auto_26281 - DIRECTION
      ?auto_26278 - INSTRUMENT
      ?auto_26280 - INSTRUMENT
      ?auto_26276 - INSTRUMENT
      ?auto_26275 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26277 ?auto_26279 ) ( SUPPORTS ?auto_26277 ?auto_26268 ) ( not ( = ?auto_26267 ?auto_26281 ) ) ( CALIBRATION_TARGET ?auto_26277 ?auto_26281 ) ( not ( = ?auto_26281 ?auto_26270 ) ) ( ON_BOARD ?auto_26278 ?auto_26279 ) ( not ( = ?auto_26267 ?auto_26270 ) ) ( not ( = ?auto_26277 ?auto_26278 ) ) ( SUPPORTS ?auto_26278 ?auto_26269 ) ( CALIBRATION_TARGET ?auto_26278 ?auto_26281 ) ( not ( = ?auto_26281 ?auto_26273 ) ) ( ON_BOARD ?auto_26280 ?auto_26279 ) ( not ( = ?auto_26270 ?auto_26273 ) ) ( not ( = ?auto_26278 ?auto_26280 ) ) ( SUPPORTS ?auto_26280 ?auto_26274 ) ( CALIBRATION_TARGET ?auto_26280 ?auto_26281 ) ( not ( = ?auto_26281 ?auto_26271 ) ) ( ON_BOARD ?auto_26276 ?auto_26279 ) ( not ( = ?auto_26273 ?auto_26271 ) ) ( not ( = ?auto_26280 ?auto_26276 ) ) ( SUPPORTS ?auto_26276 ?auto_26272 ) ( CALIBRATION_TARGET ?auto_26276 ?auto_26281 ) ( POWER_AVAIL ?auto_26279 ) ( POINTING ?auto_26279 ?auto_26275 ) ( not ( = ?auto_26281 ?auto_26275 ) ) ( not ( = ?auto_26271 ?auto_26275 ) ) ( not ( = ?auto_26272 ?auto_26274 ) ) ( not ( = ?auto_26273 ?auto_26275 ) ) ( not ( = ?auto_26271 ?auto_26270 ) ) ( not ( = ?auto_26272 ?auto_26269 ) ) ( not ( = ?auto_26274 ?auto_26269 ) ) ( not ( = ?auto_26270 ?auto_26275 ) ) ( not ( = ?auto_26278 ?auto_26276 ) ) ( not ( = ?auto_26271 ?auto_26267 ) ) ( not ( = ?auto_26272 ?auto_26268 ) ) ( not ( = ?auto_26273 ?auto_26267 ) ) ( not ( = ?auto_26274 ?auto_26268 ) ) ( not ( = ?auto_26269 ?auto_26268 ) ) ( not ( = ?auto_26267 ?auto_26275 ) ) ( not ( = ?auto_26277 ?auto_26280 ) ) ( not ( = ?auto_26277 ?auto_26276 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_26271 ?auto_26272 ?auto_26273 ?auto_26274 ?auto_26267 ?auto_26268 ?auto_26270 ?auto_26269 )
      ( GET-4IMAGE-VERIFY ?auto_26267 ?auto_26268 ?auto_26270 ?auto_26269 ?auto_26271 ?auto_26272 ?auto_26273 ?auto_26274 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_26316 - DIRECTION
      ?auto_26317 - MODE
      ?auto_26319 - DIRECTION
      ?auto_26318 - MODE
      ?auto_26320 - DIRECTION
      ?auto_26321 - MODE
      ?auto_26322 - DIRECTION
      ?auto_26323 - MODE
    )
    :vars
    (
      ?auto_26326 - INSTRUMENT
      ?auto_26328 - SATELLITE
      ?auto_26330 - DIRECTION
      ?auto_26327 - INSTRUMENT
      ?auto_26329 - INSTRUMENT
      ?auto_26325 - INSTRUMENT
      ?auto_26324 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26326 ?auto_26328 ) ( SUPPORTS ?auto_26326 ?auto_26317 ) ( not ( = ?auto_26316 ?auto_26330 ) ) ( CALIBRATION_TARGET ?auto_26326 ?auto_26330 ) ( not ( = ?auto_26330 ?auto_26319 ) ) ( ON_BOARD ?auto_26327 ?auto_26328 ) ( not ( = ?auto_26316 ?auto_26319 ) ) ( not ( = ?auto_26326 ?auto_26327 ) ) ( SUPPORTS ?auto_26327 ?auto_26318 ) ( CALIBRATION_TARGET ?auto_26327 ?auto_26330 ) ( not ( = ?auto_26330 ?auto_26320 ) ) ( ON_BOARD ?auto_26329 ?auto_26328 ) ( not ( = ?auto_26319 ?auto_26320 ) ) ( not ( = ?auto_26327 ?auto_26329 ) ) ( SUPPORTS ?auto_26329 ?auto_26321 ) ( CALIBRATION_TARGET ?auto_26329 ?auto_26330 ) ( not ( = ?auto_26330 ?auto_26322 ) ) ( ON_BOARD ?auto_26325 ?auto_26328 ) ( not ( = ?auto_26320 ?auto_26322 ) ) ( not ( = ?auto_26329 ?auto_26325 ) ) ( SUPPORTS ?auto_26325 ?auto_26323 ) ( CALIBRATION_TARGET ?auto_26325 ?auto_26330 ) ( POWER_AVAIL ?auto_26328 ) ( POINTING ?auto_26328 ?auto_26324 ) ( not ( = ?auto_26330 ?auto_26324 ) ) ( not ( = ?auto_26322 ?auto_26324 ) ) ( not ( = ?auto_26323 ?auto_26321 ) ) ( not ( = ?auto_26320 ?auto_26324 ) ) ( not ( = ?auto_26322 ?auto_26319 ) ) ( not ( = ?auto_26323 ?auto_26318 ) ) ( not ( = ?auto_26321 ?auto_26318 ) ) ( not ( = ?auto_26319 ?auto_26324 ) ) ( not ( = ?auto_26327 ?auto_26325 ) ) ( not ( = ?auto_26322 ?auto_26316 ) ) ( not ( = ?auto_26323 ?auto_26317 ) ) ( not ( = ?auto_26320 ?auto_26316 ) ) ( not ( = ?auto_26321 ?auto_26317 ) ) ( not ( = ?auto_26318 ?auto_26317 ) ) ( not ( = ?auto_26316 ?auto_26324 ) ) ( not ( = ?auto_26326 ?auto_26329 ) ) ( not ( = ?auto_26326 ?auto_26325 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_26322 ?auto_26323 ?auto_26320 ?auto_26321 ?auto_26316 ?auto_26317 ?auto_26319 ?auto_26318 )
      ( GET-4IMAGE-VERIFY ?auto_26316 ?auto_26317 ?auto_26319 ?auto_26318 ?auto_26320 ?auto_26321 ?auto_26322 ?auto_26323 ) )
  )

)

