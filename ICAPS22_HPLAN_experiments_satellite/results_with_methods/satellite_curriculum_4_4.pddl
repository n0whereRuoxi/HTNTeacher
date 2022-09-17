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
      ?auto_21994 - INSTRUMENT
      ?auto_21993 - SATELLITE
      ?auto_21992 - DIRECTION
      ?auto_21995 - INSTRUMENT
      ?auto_21996 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_21991 ?auto_21988 ) ) ( ON_BOARD ?auto_21994 ?auto_21993 ) ( SUPPORTS ?auto_21994 ?auto_21990 ) ( not ( = ?auto_21991 ?auto_21992 ) ) ( CALIBRATION_TARGET ?auto_21994 ?auto_21992 ) ( not ( = ?auto_21992 ?auto_21988 ) ) ( ON_BOARD ?auto_21995 ?auto_21993 ) ( not ( = ?auto_21994 ?auto_21995 ) ) ( SUPPORTS ?auto_21995 ?auto_21989 ) ( CALIBRATION_TARGET ?auto_21995 ?auto_21992 ) ( POWER_AVAIL ?auto_21993 ) ( POINTING ?auto_21993 ?auto_21996 ) ( not ( = ?auto_21992 ?auto_21996 ) ) ( not ( = ?auto_21988 ?auto_21996 ) ) ( not ( = ?auto_21989 ?auto_21990 ) ) ( not ( = ?auto_21991 ?auto_21996 ) ) )
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
      ?auto_22002 - DIRECTION
      ?auto_22003 - INSTRUMENT
      ?auto_22004 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22000 ?auto_21997 ) ) ( ON_BOARD ?auto_22001 ?auto_22005 ) ( SUPPORTS ?auto_22001 ?auto_21998 ) ( not ( = ?auto_21997 ?auto_22002 ) ) ( CALIBRATION_TARGET ?auto_22001 ?auto_22002 ) ( not ( = ?auto_22002 ?auto_22000 ) ) ( ON_BOARD ?auto_22003 ?auto_22005 ) ( not ( = ?auto_22001 ?auto_22003 ) ) ( SUPPORTS ?auto_22003 ?auto_21999 ) ( CALIBRATION_TARGET ?auto_22003 ?auto_22002 ) ( POWER_AVAIL ?auto_22005 ) ( POINTING ?auto_22005 ?auto_22004 ) ( not ( = ?auto_22002 ?auto_22004 ) ) ( not ( = ?auto_22000 ?auto_22004 ) ) ( not ( = ?auto_21999 ?auto_21998 ) ) ( not ( = ?auto_21997 ?auto_22004 ) ) )
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
      ?auto_22161 - SATELLITE
      ?auto_22163 - DIRECTION
      ?auto_22162 - INSTRUMENT
      ?auto_22165 - INSTRUMENT
      ?auto_22164 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22157 ?auto_22154 ) ) ( not ( = ?auto_22158 ?auto_22154 ) ) ( not ( = ?auto_22158 ?auto_22157 ) ) ( ON_BOARD ?auto_22160 ?auto_22161 ) ( SUPPORTS ?auto_22160 ?auto_22159 ) ( not ( = ?auto_22158 ?auto_22163 ) ) ( CALIBRATION_TARGET ?auto_22160 ?auto_22163 ) ( not ( = ?auto_22163 ?auto_22157 ) ) ( ON_BOARD ?auto_22162 ?auto_22161 ) ( not ( = ?auto_22160 ?auto_22162 ) ) ( SUPPORTS ?auto_22162 ?auto_22156 ) ( CALIBRATION_TARGET ?auto_22162 ?auto_22163 ) ( not ( = ?auto_22163 ?auto_22154 ) ) ( ON_BOARD ?auto_22165 ?auto_22161 ) ( not ( = ?auto_22162 ?auto_22165 ) ) ( SUPPORTS ?auto_22165 ?auto_22155 ) ( CALIBRATION_TARGET ?auto_22165 ?auto_22163 ) ( POWER_AVAIL ?auto_22161 ) ( POINTING ?auto_22161 ?auto_22164 ) ( not ( = ?auto_22163 ?auto_22164 ) ) ( not ( = ?auto_22154 ?auto_22164 ) ) ( not ( = ?auto_22155 ?auto_22156 ) ) ( not ( = ?auto_22157 ?auto_22164 ) ) ( not ( = ?auto_22155 ?auto_22159 ) ) ( not ( = ?auto_22156 ?auto_22159 ) ) ( not ( = ?auto_22158 ?auto_22164 ) ) ( not ( = ?auto_22160 ?auto_22165 ) ) )
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
      ?auto_22189 - INSTRUMENT
      ?auto_22191 - SATELLITE
      ?auto_22190 - DIRECTION
      ?auto_22186 - INSTRUMENT
      ?auto_22188 - INSTRUMENT
      ?auto_22187 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22183 ?auto_22180 ) ) ( not ( = ?auto_22184 ?auto_22180 ) ) ( not ( = ?auto_22184 ?auto_22183 ) ) ( ON_BOARD ?auto_22189 ?auto_22191 ) ( SUPPORTS ?auto_22189 ?auto_22182 ) ( not ( = ?auto_22183 ?auto_22190 ) ) ( CALIBRATION_TARGET ?auto_22189 ?auto_22190 ) ( not ( = ?auto_22190 ?auto_22184 ) ) ( ON_BOARD ?auto_22186 ?auto_22191 ) ( not ( = ?auto_22189 ?auto_22186 ) ) ( SUPPORTS ?auto_22186 ?auto_22185 ) ( CALIBRATION_TARGET ?auto_22186 ?auto_22190 ) ( not ( = ?auto_22190 ?auto_22180 ) ) ( ON_BOARD ?auto_22188 ?auto_22191 ) ( not ( = ?auto_22186 ?auto_22188 ) ) ( SUPPORTS ?auto_22188 ?auto_22181 ) ( CALIBRATION_TARGET ?auto_22188 ?auto_22190 ) ( POWER_AVAIL ?auto_22191 ) ( POINTING ?auto_22191 ?auto_22187 ) ( not ( = ?auto_22190 ?auto_22187 ) ) ( not ( = ?auto_22180 ?auto_22187 ) ) ( not ( = ?auto_22181 ?auto_22185 ) ) ( not ( = ?auto_22184 ?auto_22187 ) ) ( not ( = ?auto_22181 ?auto_22182 ) ) ( not ( = ?auto_22185 ?auto_22182 ) ) ( not ( = ?auto_22183 ?auto_22187 ) ) ( not ( = ?auto_22189 ?auto_22188 ) ) )
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
      ?auto_22212 - SATELLITE
      ?auto_22217 - DIRECTION
      ?auto_22215 - INSTRUMENT
      ?auto_22214 - INSTRUMENT
      ?auto_22213 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22209 ?auto_22206 ) ) ( not ( = ?auto_22210 ?auto_22206 ) ) ( not ( = ?auto_22210 ?auto_22209 ) ) ( ON_BOARD ?auto_22216 ?auto_22212 ) ( SUPPORTS ?auto_22216 ?auto_22211 ) ( not ( = ?auto_22210 ?auto_22217 ) ) ( CALIBRATION_TARGET ?auto_22216 ?auto_22217 ) ( not ( = ?auto_22217 ?auto_22206 ) ) ( ON_BOARD ?auto_22215 ?auto_22212 ) ( not ( = ?auto_22216 ?auto_22215 ) ) ( SUPPORTS ?auto_22215 ?auto_22207 ) ( CALIBRATION_TARGET ?auto_22215 ?auto_22217 ) ( not ( = ?auto_22217 ?auto_22209 ) ) ( ON_BOARD ?auto_22214 ?auto_22212 ) ( not ( = ?auto_22215 ?auto_22214 ) ) ( SUPPORTS ?auto_22214 ?auto_22208 ) ( CALIBRATION_TARGET ?auto_22214 ?auto_22217 ) ( POWER_AVAIL ?auto_22212 ) ( POINTING ?auto_22212 ?auto_22213 ) ( not ( = ?auto_22217 ?auto_22213 ) ) ( not ( = ?auto_22209 ?auto_22213 ) ) ( not ( = ?auto_22208 ?auto_22207 ) ) ( not ( = ?auto_22206 ?auto_22213 ) ) ( not ( = ?auto_22208 ?auto_22211 ) ) ( not ( = ?auto_22207 ?auto_22211 ) ) ( not ( = ?auto_22210 ?auto_22213 ) ) ( not ( = ?auto_22216 ?auto_22214 ) ) )
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
      ?auto_22238 - SATELLITE
      ?auto_22243 - DIRECTION
      ?auto_22241 - INSTRUMENT
      ?auto_22240 - INSTRUMENT
      ?auto_22239 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22235 ?auto_22232 ) ) ( not ( = ?auto_22236 ?auto_22232 ) ) ( not ( = ?auto_22236 ?auto_22235 ) ) ( ON_BOARD ?auto_22242 ?auto_22238 ) ( SUPPORTS ?auto_22242 ?auto_22234 ) ( not ( = ?auto_22235 ?auto_22243 ) ) ( CALIBRATION_TARGET ?auto_22242 ?auto_22243 ) ( not ( = ?auto_22243 ?auto_22232 ) ) ( ON_BOARD ?auto_22241 ?auto_22238 ) ( not ( = ?auto_22242 ?auto_22241 ) ) ( SUPPORTS ?auto_22241 ?auto_22233 ) ( CALIBRATION_TARGET ?auto_22241 ?auto_22243 ) ( not ( = ?auto_22243 ?auto_22236 ) ) ( ON_BOARD ?auto_22240 ?auto_22238 ) ( not ( = ?auto_22241 ?auto_22240 ) ) ( SUPPORTS ?auto_22240 ?auto_22237 ) ( CALIBRATION_TARGET ?auto_22240 ?auto_22243 ) ( POWER_AVAIL ?auto_22238 ) ( POINTING ?auto_22238 ?auto_22239 ) ( not ( = ?auto_22243 ?auto_22239 ) ) ( not ( = ?auto_22236 ?auto_22239 ) ) ( not ( = ?auto_22237 ?auto_22233 ) ) ( not ( = ?auto_22232 ?auto_22239 ) ) ( not ( = ?auto_22237 ?auto_22234 ) ) ( not ( = ?auto_22233 ?auto_22234 ) ) ( not ( = ?auto_22235 ?auto_22239 ) ) ( not ( = ?auto_22242 ?auto_22240 ) ) )
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
      ?auto_22292 - SATELLITE
      ?auto_22297 - DIRECTION
      ?auto_22295 - INSTRUMENT
      ?auto_22294 - INSTRUMENT
      ?auto_22293 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22289 ?auto_22286 ) ) ( not ( = ?auto_22290 ?auto_22286 ) ) ( not ( = ?auto_22290 ?auto_22289 ) ) ( ON_BOARD ?auto_22296 ?auto_22292 ) ( SUPPORTS ?auto_22296 ?auto_22287 ) ( not ( = ?auto_22286 ?auto_22297 ) ) ( CALIBRATION_TARGET ?auto_22296 ?auto_22297 ) ( not ( = ?auto_22297 ?auto_22290 ) ) ( ON_BOARD ?auto_22295 ?auto_22292 ) ( not ( = ?auto_22296 ?auto_22295 ) ) ( SUPPORTS ?auto_22295 ?auto_22291 ) ( CALIBRATION_TARGET ?auto_22295 ?auto_22297 ) ( not ( = ?auto_22297 ?auto_22289 ) ) ( ON_BOARD ?auto_22294 ?auto_22292 ) ( not ( = ?auto_22295 ?auto_22294 ) ) ( SUPPORTS ?auto_22294 ?auto_22288 ) ( CALIBRATION_TARGET ?auto_22294 ?auto_22297 ) ( POWER_AVAIL ?auto_22292 ) ( POINTING ?auto_22292 ?auto_22293 ) ( not ( = ?auto_22297 ?auto_22293 ) ) ( not ( = ?auto_22289 ?auto_22293 ) ) ( not ( = ?auto_22288 ?auto_22291 ) ) ( not ( = ?auto_22290 ?auto_22293 ) ) ( not ( = ?auto_22288 ?auto_22287 ) ) ( not ( = ?auto_22291 ?auto_22287 ) ) ( not ( = ?auto_22286 ?auto_22293 ) ) ( not ( = ?auto_22296 ?auto_22294 ) ) )
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
      ?auto_22318 - SATELLITE
      ?auto_22323 - DIRECTION
      ?auto_22321 - INSTRUMENT
      ?auto_22320 - INSTRUMENT
      ?auto_22319 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22315 ?auto_22312 ) ) ( not ( = ?auto_22316 ?auto_22312 ) ) ( not ( = ?auto_22316 ?auto_22315 ) ) ( ON_BOARD ?auto_22322 ?auto_22318 ) ( SUPPORTS ?auto_22322 ?auto_22313 ) ( not ( = ?auto_22312 ?auto_22323 ) ) ( CALIBRATION_TARGET ?auto_22322 ?auto_22323 ) ( not ( = ?auto_22323 ?auto_22315 ) ) ( ON_BOARD ?auto_22321 ?auto_22318 ) ( not ( = ?auto_22322 ?auto_22321 ) ) ( SUPPORTS ?auto_22321 ?auto_22314 ) ( CALIBRATION_TARGET ?auto_22321 ?auto_22323 ) ( not ( = ?auto_22323 ?auto_22316 ) ) ( ON_BOARD ?auto_22320 ?auto_22318 ) ( not ( = ?auto_22321 ?auto_22320 ) ) ( SUPPORTS ?auto_22320 ?auto_22317 ) ( CALIBRATION_TARGET ?auto_22320 ?auto_22323 ) ( POWER_AVAIL ?auto_22318 ) ( POINTING ?auto_22318 ?auto_22319 ) ( not ( = ?auto_22323 ?auto_22319 ) ) ( not ( = ?auto_22316 ?auto_22319 ) ) ( not ( = ?auto_22317 ?auto_22314 ) ) ( not ( = ?auto_22315 ?auto_22319 ) ) ( not ( = ?auto_22317 ?auto_22313 ) ) ( not ( = ?auto_22314 ?auto_22313 ) ) ( not ( = ?auto_22312 ?auto_22319 ) ) ( not ( = ?auto_22322 ?auto_22320 ) ) )
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
      ?auto_23972 - INSTRUMENT
      ?auto_23974 - SATELLITE
      ?auto_23973 - DIRECTION
      ?auto_23975 - INSTRUMENT
      ?auto_23978 - INSTRUMENT
      ?auto_23977 - INSTRUMENT
      ?auto_23976 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_23967 ?auto_23964 ) ) ( not ( = ?auto_23968 ?auto_23964 ) ) ( not ( = ?auto_23968 ?auto_23967 ) ) ( not ( = ?auto_23970 ?auto_23964 ) ) ( not ( = ?auto_23970 ?auto_23967 ) ) ( not ( = ?auto_23970 ?auto_23968 ) ) ( ON_BOARD ?auto_23972 ?auto_23974 ) ( SUPPORTS ?auto_23972 ?auto_23971 ) ( not ( = ?auto_23970 ?auto_23973 ) ) ( CALIBRATION_TARGET ?auto_23972 ?auto_23973 ) ( not ( = ?auto_23973 ?auto_23968 ) ) ( ON_BOARD ?auto_23975 ?auto_23974 ) ( not ( = ?auto_23972 ?auto_23975 ) ) ( SUPPORTS ?auto_23975 ?auto_23969 ) ( CALIBRATION_TARGET ?auto_23975 ?auto_23973 ) ( not ( = ?auto_23973 ?auto_23967 ) ) ( ON_BOARD ?auto_23978 ?auto_23974 ) ( not ( = ?auto_23975 ?auto_23978 ) ) ( SUPPORTS ?auto_23978 ?auto_23966 ) ( CALIBRATION_TARGET ?auto_23978 ?auto_23973 ) ( not ( = ?auto_23973 ?auto_23964 ) ) ( ON_BOARD ?auto_23977 ?auto_23974 ) ( not ( = ?auto_23978 ?auto_23977 ) ) ( SUPPORTS ?auto_23977 ?auto_23965 ) ( CALIBRATION_TARGET ?auto_23977 ?auto_23973 ) ( POWER_AVAIL ?auto_23974 ) ( POINTING ?auto_23974 ?auto_23976 ) ( not ( = ?auto_23973 ?auto_23976 ) ) ( not ( = ?auto_23964 ?auto_23976 ) ) ( not ( = ?auto_23965 ?auto_23966 ) ) ( not ( = ?auto_23967 ?auto_23976 ) ) ( not ( = ?auto_23965 ?auto_23969 ) ) ( not ( = ?auto_23966 ?auto_23969 ) ) ( not ( = ?auto_23968 ?auto_23976 ) ) ( not ( = ?auto_23975 ?auto_23977 ) ) ( not ( = ?auto_23965 ?auto_23971 ) ) ( not ( = ?auto_23966 ?auto_23971 ) ) ( not ( = ?auto_23969 ?auto_23971 ) ) ( not ( = ?auto_23970 ?auto_23976 ) ) ( not ( = ?auto_23972 ?auto_23978 ) ) ( not ( = ?auto_23972 ?auto_23977 ) ) )
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
      ?auto_24026 - INSTRUMENT
      ?auto_24022 - SATELLITE
      ?auto_24024 - DIRECTION
      ?auto_24025 - INSTRUMENT
      ?auto_24021 - INSTRUMENT
      ?auto_24027 - INSTRUMENT
      ?auto_24023 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_24016 ?auto_24013 ) ) ( not ( = ?auto_24017 ?auto_24013 ) ) ( not ( = ?auto_24017 ?auto_24016 ) ) ( not ( = ?auto_24019 ?auto_24013 ) ) ( not ( = ?auto_24019 ?auto_24016 ) ) ( not ( = ?auto_24019 ?auto_24017 ) ) ( ON_BOARD ?auto_24026 ?auto_24022 ) ( SUPPORTS ?auto_24026 ?auto_24018 ) ( not ( = ?auto_24017 ?auto_24024 ) ) ( CALIBRATION_TARGET ?auto_24026 ?auto_24024 ) ( not ( = ?auto_24024 ?auto_24019 ) ) ( ON_BOARD ?auto_24025 ?auto_24022 ) ( not ( = ?auto_24026 ?auto_24025 ) ) ( SUPPORTS ?auto_24025 ?auto_24020 ) ( CALIBRATION_TARGET ?auto_24025 ?auto_24024 ) ( not ( = ?auto_24024 ?auto_24016 ) ) ( ON_BOARD ?auto_24021 ?auto_24022 ) ( not ( = ?auto_24025 ?auto_24021 ) ) ( SUPPORTS ?auto_24021 ?auto_24015 ) ( CALIBRATION_TARGET ?auto_24021 ?auto_24024 ) ( not ( = ?auto_24024 ?auto_24013 ) ) ( ON_BOARD ?auto_24027 ?auto_24022 ) ( not ( = ?auto_24021 ?auto_24027 ) ) ( SUPPORTS ?auto_24027 ?auto_24014 ) ( CALIBRATION_TARGET ?auto_24027 ?auto_24024 ) ( POWER_AVAIL ?auto_24022 ) ( POINTING ?auto_24022 ?auto_24023 ) ( not ( = ?auto_24024 ?auto_24023 ) ) ( not ( = ?auto_24013 ?auto_24023 ) ) ( not ( = ?auto_24014 ?auto_24015 ) ) ( not ( = ?auto_24016 ?auto_24023 ) ) ( not ( = ?auto_24014 ?auto_24020 ) ) ( not ( = ?auto_24015 ?auto_24020 ) ) ( not ( = ?auto_24019 ?auto_24023 ) ) ( not ( = ?auto_24025 ?auto_24027 ) ) ( not ( = ?auto_24014 ?auto_24018 ) ) ( not ( = ?auto_24015 ?auto_24018 ) ) ( not ( = ?auto_24020 ?auto_24018 ) ) ( not ( = ?auto_24017 ?auto_24023 ) ) ( not ( = ?auto_24026 ?auto_24021 ) ) ( not ( = ?auto_24026 ?auto_24027 ) ) )
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
      ?auto_24074 - INSTRUMENT
      ?auto_24075 - SATELLITE
      ?auto_24073 - DIRECTION
      ?auto_24070 - INSTRUMENT
      ?auto_24072 - INSTRUMENT
      ?auto_24076 - INSTRUMENT
      ?auto_24071 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_24065 ?auto_24062 ) ) ( not ( = ?auto_24066 ?auto_24062 ) ) ( not ( = ?auto_24066 ?auto_24065 ) ) ( not ( = ?auto_24068 ?auto_24062 ) ) ( not ( = ?auto_24068 ?auto_24065 ) ) ( not ( = ?auto_24068 ?auto_24066 ) ) ( ON_BOARD ?auto_24074 ?auto_24075 ) ( SUPPORTS ?auto_24074 ?auto_24069 ) ( not ( = ?auto_24068 ?auto_24073 ) ) ( CALIBRATION_TARGET ?auto_24074 ?auto_24073 ) ( not ( = ?auto_24073 ?auto_24065 ) ) ( ON_BOARD ?auto_24070 ?auto_24075 ) ( not ( = ?auto_24074 ?auto_24070 ) ) ( SUPPORTS ?auto_24070 ?auto_24064 ) ( CALIBRATION_TARGET ?auto_24070 ?auto_24073 ) ( not ( = ?auto_24073 ?auto_24066 ) ) ( ON_BOARD ?auto_24072 ?auto_24075 ) ( not ( = ?auto_24070 ?auto_24072 ) ) ( SUPPORTS ?auto_24072 ?auto_24067 ) ( CALIBRATION_TARGET ?auto_24072 ?auto_24073 ) ( not ( = ?auto_24073 ?auto_24062 ) ) ( ON_BOARD ?auto_24076 ?auto_24075 ) ( not ( = ?auto_24072 ?auto_24076 ) ) ( SUPPORTS ?auto_24076 ?auto_24063 ) ( CALIBRATION_TARGET ?auto_24076 ?auto_24073 ) ( POWER_AVAIL ?auto_24075 ) ( POINTING ?auto_24075 ?auto_24071 ) ( not ( = ?auto_24073 ?auto_24071 ) ) ( not ( = ?auto_24062 ?auto_24071 ) ) ( not ( = ?auto_24063 ?auto_24067 ) ) ( not ( = ?auto_24066 ?auto_24071 ) ) ( not ( = ?auto_24063 ?auto_24064 ) ) ( not ( = ?auto_24067 ?auto_24064 ) ) ( not ( = ?auto_24065 ?auto_24071 ) ) ( not ( = ?auto_24070 ?auto_24076 ) ) ( not ( = ?auto_24063 ?auto_24069 ) ) ( not ( = ?auto_24067 ?auto_24069 ) ) ( not ( = ?auto_24064 ?auto_24069 ) ) ( not ( = ?auto_24068 ?auto_24071 ) ) ( not ( = ?auto_24074 ?auto_24072 ) ) ( not ( = ?auto_24074 ?auto_24076 ) ) )
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
      ?auto_24123 - INSTRUMENT
      ?auto_24124 - SATELLITE
      ?auto_24122 - DIRECTION
      ?auto_24119 - INSTRUMENT
      ?auto_24121 - INSTRUMENT
      ?auto_24125 - INSTRUMENT
      ?auto_24120 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_24114 ?auto_24111 ) ) ( not ( = ?auto_24115 ?auto_24111 ) ) ( not ( = ?auto_24115 ?auto_24114 ) ) ( not ( = ?auto_24117 ?auto_24111 ) ) ( not ( = ?auto_24117 ?auto_24114 ) ) ( not ( = ?auto_24117 ?auto_24115 ) ) ( ON_BOARD ?auto_24123 ?auto_24124 ) ( SUPPORTS ?auto_24123 ?auto_24116 ) ( not ( = ?auto_24115 ?auto_24122 ) ) ( CALIBRATION_TARGET ?auto_24123 ?auto_24122 ) ( not ( = ?auto_24122 ?auto_24114 ) ) ( ON_BOARD ?auto_24119 ?auto_24124 ) ( not ( = ?auto_24123 ?auto_24119 ) ) ( SUPPORTS ?auto_24119 ?auto_24113 ) ( CALIBRATION_TARGET ?auto_24119 ?auto_24122 ) ( not ( = ?auto_24122 ?auto_24117 ) ) ( ON_BOARD ?auto_24121 ?auto_24124 ) ( not ( = ?auto_24119 ?auto_24121 ) ) ( SUPPORTS ?auto_24121 ?auto_24118 ) ( CALIBRATION_TARGET ?auto_24121 ?auto_24122 ) ( not ( = ?auto_24122 ?auto_24111 ) ) ( ON_BOARD ?auto_24125 ?auto_24124 ) ( not ( = ?auto_24121 ?auto_24125 ) ) ( SUPPORTS ?auto_24125 ?auto_24112 ) ( CALIBRATION_TARGET ?auto_24125 ?auto_24122 ) ( POWER_AVAIL ?auto_24124 ) ( POINTING ?auto_24124 ?auto_24120 ) ( not ( = ?auto_24122 ?auto_24120 ) ) ( not ( = ?auto_24111 ?auto_24120 ) ) ( not ( = ?auto_24112 ?auto_24118 ) ) ( not ( = ?auto_24117 ?auto_24120 ) ) ( not ( = ?auto_24112 ?auto_24113 ) ) ( not ( = ?auto_24118 ?auto_24113 ) ) ( not ( = ?auto_24114 ?auto_24120 ) ) ( not ( = ?auto_24119 ?auto_24125 ) ) ( not ( = ?auto_24112 ?auto_24116 ) ) ( not ( = ?auto_24118 ?auto_24116 ) ) ( not ( = ?auto_24113 ?auto_24116 ) ) ( not ( = ?auto_24115 ?auto_24120 ) ) ( not ( = ?auto_24123 ?auto_24121 ) ) ( not ( = ?auto_24123 ?auto_24125 ) ) )
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
      ?auto_24278 - INSTRUMENT
      ?auto_24279 - SATELLITE
      ?auto_24277 - DIRECTION
      ?auto_24274 - INSTRUMENT
      ?auto_24276 - INSTRUMENT
      ?auto_24280 - INSTRUMENT
      ?auto_24275 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_24269 ?auto_24266 ) ) ( not ( = ?auto_24270 ?auto_24266 ) ) ( not ( = ?auto_24270 ?auto_24269 ) ) ( not ( = ?auto_24272 ?auto_24266 ) ) ( not ( = ?auto_24272 ?auto_24269 ) ) ( not ( = ?auto_24272 ?auto_24270 ) ) ( ON_BOARD ?auto_24278 ?auto_24279 ) ( SUPPORTS ?auto_24278 ?auto_24268 ) ( not ( = ?auto_24269 ?auto_24277 ) ) ( CALIBRATION_TARGET ?auto_24278 ?auto_24277 ) ( not ( = ?auto_24277 ?auto_24272 ) ) ( ON_BOARD ?auto_24274 ?auto_24279 ) ( not ( = ?auto_24278 ?auto_24274 ) ) ( SUPPORTS ?auto_24274 ?auto_24273 ) ( CALIBRATION_TARGET ?auto_24274 ?auto_24277 ) ( not ( = ?auto_24277 ?auto_24270 ) ) ( ON_BOARD ?auto_24276 ?auto_24279 ) ( not ( = ?auto_24274 ?auto_24276 ) ) ( SUPPORTS ?auto_24276 ?auto_24271 ) ( CALIBRATION_TARGET ?auto_24276 ?auto_24277 ) ( not ( = ?auto_24277 ?auto_24266 ) ) ( ON_BOARD ?auto_24280 ?auto_24279 ) ( not ( = ?auto_24276 ?auto_24280 ) ) ( SUPPORTS ?auto_24280 ?auto_24267 ) ( CALIBRATION_TARGET ?auto_24280 ?auto_24277 ) ( POWER_AVAIL ?auto_24279 ) ( POINTING ?auto_24279 ?auto_24275 ) ( not ( = ?auto_24277 ?auto_24275 ) ) ( not ( = ?auto_24266 ?auto_24275 ) ) ( not ( = ?auto_24267 ?auto_24271 ) ) ( not ( = ?auto_24270 ?auto_24275 ) ) ( not ( = ?auto_24267 ?auto_24273 ) ) ( not ( = ?auto_24271 ?auto_24273 ) ) ( not ( = ?auto_24272 ?auto_24275 ) ) ( not ( = ?auto_24274 ?auto_24280 ) ) ( not ( = ?auto_24267 ?auto_24268 ) ) ( not ( = ?auto_24271 ?auto_24268 ) ) ( not ( = ?auto_24273 ?auto_24268 ) ) ( not ( = ?auto_24269 ?auto_24275 ) ) ( not ( = ?auto_24278 ?auto_24276 ) ) ( not ( = ?auto_24278 ?auto_24280 ) ) )
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
      ?auto_24327 - INSTRUMENT
      ?auto_24328 - SATELLITE
      ?auto_24326 - DIRECTION
      ?auto_24323 - INSTRUMENT
      ?auto_24325 - INSTRUMENT
      ?auto_24329 - INSTRUMENT
      ?auto_24324 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_24318 ?auto_24315 ) ) ( not ( = ?auto_24319 ?auto_24315 ) ) ( not ( = ?auto_24319 ?auto_24318 ) ) ( not ( = ?auto_24321 ?auto_24315 ) ) ( not ( = ?auto_24321 ?auto_24318 ) ) ( not ( = ?auto_24321 ?auto_24319 ) ) ( ON_BOARD ?auto_24327 ?auto_24328 ) ( SUPPORTS ?auto_24327 ?auto_24317 ) ( not ( = ?auto_24318 ?auto_24326 ) ) ( CALIBRATION_TARGET ?auto_24327 ?auto_24326 ) ( not ( = ?auto_24326 ?auto_24319 ) ) ( ON_BOARD ?auto_24323 ?auto_24328 ) ( not ( = ?auto_24327 ?auto_24323 ) ) ( SUPPORTS ?auto_24323 ?auto_24320 ) ( CALIBRATION_TARGET ?auto_24323 ?auto_24326 ) ( not ( = ?auto_24326 ?auto_24321 ) ) ( ON_BOARD ?auto_24325 ?auto_24328 ) ( not ( = ?auto_24323 ?auto_24325 ) ) ( SUPPORTS ?auto_24325 ?auto_24322 ) ( CALIBRATION_TARGET ?auto_24325 ?auto_24326 ) ( not ( = ?auto_24326 ?auto_24315 ) ) ( ON_BOARD ?auto_24329 ?auto_24328 ) ( not ( = ?auto_24325 ?auto_24329 ) ) ( SUPPORTS ?auto_24329 ?auto_24316 ) ( CALIBRATION_TARGET ?auto_24329 ?auto_24326 ) ( POWER_AVAIL ?auto_24328 ) ( POINTING ?auto_24328 ?auto_24324 ) ( not ( = ?auto_24326 ?auto_24324 ) ) ( not ( = ?auto_24315 ?auto_24324 ) ) ( not ( = ?auto_24316 ?auto_24322 ) ) ( not ( = ?auto_24321 ?auto_24324 ) ) ( not ( = ?auto_24316 ?auto_24320 ) ) ( not ( = ?auto_24322 ?auto_24320 ) ) ( not ( = ?auto_24319 ?auto_24324 ) ) ( not ( = ?auto_24323 ?auto_24329 ) ) ( not ( = ?auto_24316 ?auto_24317 ) ) ( not ( = ?auto_24322 ?auto_24317 ) ) ( not ( = ?auto_24320 ?auto_24317 ) ) ( not ( = ?auto_24318 ?auto_24324 ) ) ( not ( = ?auto_24327 ?auto_24325 ) ) ( not ( = ?auto_24327 ?auto_24329 ) ) )
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
      ?auto_24482 - INSTRUMENT
      ?auto_24483 - SATELLITE
      ?auto_24481 - DIRECTION
      ?auto_24478 - INSTRUMENT
      ?auto_24480 - INSTRUMENT
      ?auto_24484 - INSTRUMENT
      ?auto_24479 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_24473 ?auto_24470 ) ) ( not ( = ?auto_24474 ?auto_24470 ) ) ( not ( = ?auto_24474 ?auto_24473 ) ) ( not ( = ?auto_24476 ?auto_24470 ) ) ( not ( = ?auto_24476 ?auto_24473 ) ) ( not ( = ?auto_24476 ?auto_24474 ) ) ( ON_BOARD ?auto_24482 ?auto_24483 ) ( SUPPORTS ?auto_24482 ?auto_24477 ) ( not ( = ?auto_24476 ?auto_24481 ) ) ( CALIBRATION_TARGET ?auto_24482 ?auto_24481 ) ( not ( = ?auto_24481 ?auto_24474 ) ) ( ON_BOARD ?auto_24478 ?auto_24483 ) ( not ( = ?auto_24482 ?auto_24478 ) ) ( SUPPORTS ?auto_24478 ?auto_24475 ) ( CALIBRATION_TARGET ?auto_24478 ?auto_24481 ) ( not ( = ?auto_24481 ?auto_24470 ) ) ( ON_BOARD ?auto_24480 ?auto_24483 ) ( not ( = ?auto_24478 ?auto_24480 ) ) ( SUPPORTS ?auto_24480 ?auto_24471 ) ( CALIBRATION_TARGET ?auto_24480 ?auto_24481 ) ( not ( = ?auto_24481 ?auto_24473 ) ) ( ON_BOARD ?auto_24484 ?auto_24483 ) ( not ( = ?auto_24480 ?auto_24484 ) ) ( SUPPORTS ?auto_24484 ?auto_24472 ) ( CALIBRATION_TARGET ?auto_24484 ?auto_24481 ) ( POWER_AVAIL ?auto_24483 ) ( POINTING ?auto_24483 ?auto_24479 ) ( not ( = ?auto_24481 ?auto_24479 ) ) ( not ( = ?auto_24473 ?auto_24479 ) ) ( not ( = ?auto_24472 ?auto_24471 ) ) ( not ( = ?auto_24470 ?auto_24479 ) ) ( not ( = ?auto_24472 ?auto_24475 ) ) ( not ( = ?auto_24471 ?auto_24475 ) ) ( not ( = ?auto_24474 ?auto_24479 ) ) ( not ( = ?auto_24478 ?auto_24484 ) ) ( not ( = ?auto_24472 ?auto_24477 ) ) ( not ( = ?auto_24471 ?auto_24477 ) ) ( not ( = ?auto_24475 ?auto_24477 ) ) ( not ( = ?auto_24476 ?auto_24479 ) ) ( not ( = ?auto_24482 ?auto_24480 ) ) ( not ( = ?auto_24482 ?auto_24484 ) ) )
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
      ?auto_24531 - INSTRUMENT
      ?auto_24532 - SATELLITE
      ?auto_24530 - DIRECTION
      ?auto_24527 - INSTRUMENT
      ?auto_24529 - INSTRUMENT
      ?auto_24533 - INSTRUMENT
      ?auto_24528 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_24522 ?auto_24519 ) ) ( not ( = ?auto_24523 ?auto_24519 ) ) ( not ( = ?auto_24523 ?auto_24522 ) ) ( not ( = ?auto_24525 ?auto_24519 ) ) ( not ( = ?auto_24525 ?auto_24522 ) ) ( not ( = ?auto_24525 ?auto_24523 ) ) ( ON_BOARD ?auto_24531 ?auto_24532 ) ( SUPPORTS ?auto_24531 ?auto_24524 ) ( not ( = ?auto_24523 ?auto_24530 ) ) ( CALIBRATION_TARGET ?auto_24531 ?auto_24530 ) ( not ( = ?auto_24530 ?auto_24525 ) ) ( ON_BOARD ?auto_24527 ?auto_24532 ) ( not ( = ?auto_24531 ?auto_24527 ) ) ( SUPPORTS ?auto_24527 ?auto_24526 ) ( CALIBRATION_TARGET ?auto_24527 ?auto_24530 ) ( not ( = ?auto_24530 ?auto_24519 ) ) ( ON_BOARD ?auto_24529 ?auto_24532 ) ( not ( = ?auto_24527 ?auto_24529 ) ) ( SUPPORTS ?auto_24529 ?auto_24520 ) ( CALIBRATION_TARGET ?auto_24529 ?auto_24530 ) ( not ( = ?auto_24530 ?auto_24522 ) ) ( ON_BOARD ?auto_24533 ?auto_24532 ) ( not ( = ?auto_24529 ?auto_24533 ) ) ( SUPPORTS ?auto_24533 ?auto_24521 ) ( CALIBRATION_TARGET ?auto_24533 ?auto_24530 ) ( POWER_AVAIL ?auto_24532 ) ( POINTING ?auto_24532 ?auto_24528 ) ( not ( = ?auto_24530 ?auto_24528 ) ) ( not ( = ?auto_24522 ?auto_24528 ) ) ( not ( = ?auto_24521 ?auto_24520 ) ) ( not ( = ?auto_24519 ?auto_24528 ) ) ( not ( = ?auto_24521 ?auto_24526 ) ) ( not ( = ?auto_24520 ?auto_24526 ) ) ( not ( = ?auto_24525 ?auto_24528 ) ) ( not ( = ?auto_24527 ?auto_24533 ) ) ( not ( = ?auto_24521 ?auto_24524 ) ) ( not ( = ?auto_24520 ?auto_24524 ) ) ( not ( = ?auto_24526 ?auto_24524 ) ) ( not ( = ?auto_24523 ?auto_24528 ) ) ( not ( = ?auto_24531 ?auto_24529 ) ) ( not ( = ?auto_24531 ?auto_24533 ) ) )
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
      ?auto_24688 - INSTRUMENT
      ?auto_24689 - SATELLITE
      ?auto_24687 - DIRECTION
      ?auto_24684 - INSTRUMENT
      ?auto_24686 - INSTRUMENT
      ?auto_24690 - INSTRUMENT
      ?auto_24685 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_24679 ?auto_24676 ) ) ( not ( = ?auto_24680 ?auto_24676 ) ) ( not ( = ?auto_24680 ?auto_24679 ) ) ( not ( = ?auto_24682 ?auto_24676 ) ) ( not ( = ?auto_24682 ?auto_24679 ) ) ( not ( = ?auto_24682 ?auto_24680 ) ) ( ON_BOARD ?auto_24688 ?auto_24689 ) ( SUPPORTS ?auto_24688 ?auto_24683 ) ( not ( = ?auto_24682 ?auto_24687 ) ) ( CALIBRATION_TARGET ?auto_24688 ?auto_24687 ) ( not ( = ?auto_24687 ?auto_24679 ) ) ( ON_BOARD ?auto_24684 ?auto_24689 ) ( not ( = ?auto_24688 ?auto_24684 ) ) ( SUPPORTS ?auto_24684 ?auto_24678 ) ( CALIBRATION_TARGET ?auto_24684 ?auto_24687 ) ( not ( = ?auto_24687 ?auto_24676 ) ) ( ON_BOARD ?auto_24686 ?auto_24689 ) ( not ( = ?auto_24684 ?auto_24686 ) ) ( SUPPORTS ?auto_24686 ?auto_24677 ) ( CALIBRATION_TARGET ?auto_24686 ?auto_24687 ) ( not ( = ?auto_24687 ?auto_24680 ) ) ( ON_BOARD ?auto_24690 ?auto_24689 ) ( not ( = ?auto_24686 ?auto_24690 ) ) ( SUPPORTS ?auto_24690 ?auto_24681 ) ( CALIBRATION_TARGET ?auto_24690 ?auto_24687 ) ( POWER_AVAIL ?auto_24689 ) ( POINTING ?auto_24689 ?auto_24685 ) ( not ( = ?auto_24687 ?auto_24685 ) ) ( not ( = ?auto_24680 ?auto_24685 ) ) ( not ( = ?auto_24681 ?auto_24677 ) ) ( not ( = ?auto_24676 ?auto_24685 ) ) ( not ( = ?auto_24681 ?auto_24678 ) ) ( not ( = ?auto_24677 ?auto_24678 ) ) ( not ( = ?auto_24679 ?auto_24685 ) ) ( not ( = ?auto_24684 ?auto_24690 ) ) ( not ( = ?auto_24681 ?auto_24683 ) ) ( not ( = ?auto_24677 ?auto_24683 ) ) ( not ( = ?auto_24678 ?auto_24683 ) ) ( not ( = ?auto_24682 ?auto_24685 ) ) ( not ( = ?auto_24688 ?auto_24686 ) ) ( not ( = ?auto_24688 ?auto_24690 ) ) )
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
      ?auto_24737 - INSTRUMENT
      ?auto_24738 - SATELLITE
      ?auto_24736 - DIRECTION
      ?auto_24733 - INSTRUMENT
      ?auto_24735 - INSTRUMENT
      ?auto_24739 - INSTRUMENT
      ?auto_24734 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_24728 ?auto_24725 ) ) ( not ( = ?auto_24729 ?auto_24725 ) ) ( not ( = ?auto_24729 ?auto_24728 ) ) ( not ( = ?auto_24731 ?auto_24725 ) ) ( not ( = ?auto_24731 ?auto_24728 ) ) ( not ( = ?auto_24731 ?auto_24729 ) ) ( ON_BOARD ?auto_24737 ?auto_24738 ) ( SUPPORTS ?auto_24737 ?auto_24730 ) ( not ( = ?auto_24729 ?auto_24736 ) ) ( CALIBRATION_TARGET ?auto_24737 ?auto_24736 ) ( not ( = ?auto_24736 ?auto_24728 ) ) ( ON_BOARD ?auto_24733 ?auto_24738 ) ( not ( = ?auto_24737 ?auto_24733 ) ) ( SUPPORTS ?auto_24733 ?auto_24727 ) ( CALIBRATION_TARGET ?auto_24733 ?auto_24736 ) ( not ( = ?auto_24736 ?auto_24725 ) ) ( ON_BOARD ?auto_24735 ?auto_24738 ) ( not ( = ?auto_24733 ?auto_24735 ) ) ( SUPPORTS ?auto_24735 ?auto_24726 ) ( CALIBRATION_TARGET ?auto_24735 ?auto_24736 ) ( not ( = ?auto_24736 ?auto_24731 ) ) ( ON_BOARD ?auto_24739 ?auto_24738 ) ( not ( = ?auto_24735 ?auto_24739 ) ) ( SUPPORTS ?auto_24739 ?auto_24732 ) ( CALIBRATION_TARGET ?auto_24739 ?auto_24736 ) ( POWER_AVAIL ?auto_24738 ) ( POINTING ?auto_24738 ?auto_24734 ) ( not ( = ?auto_24736 ?auto_24734 ) ) ( not ( = ?auto_24731 ?auto_24734 ) ) ( not ( = ?auto_24732 ?auto_24726 ) ) ( not ( = ?auto_24725 ?auto_24734 ) ) ( not ( = ?auto_24732 ?auto_24727 ) ) ( not ( = ?auto_24726 ?auto_24727 ) ) ( not ( = ?auto_24728 ?auto_24734 ) ) ( not ( = ?auto_24733 ?auto_24739 ) ) ( not ( = ?auto_24732 ?auto_24730 ) ) ( not ( = ?auto_24726 ?auto_24730 ) ) ( not ( = ?auto_24727 ?auto_24730 ) ) ( not ( = ?auto_24729 ?auto_24734 ) ) ( not ( = ?auto_24737 ?auto_24735 ) ) ( not ( = ?auto_24737 ?auto_24739 ) ) )
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
      ?auto_24837 - INSTRUMENT
      ?auto_24838 - SATELLITE
      ?auto_24836 - DIRECTION
      ?auto_24833 - INSTRUMENT
      ?auto_24835 - INSTRUMENT
      ?auto_24839 - INSTRUMENT
      ?auto_24834 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_24828 ?auto_24825 ) ) ( not ( = ?auto_24829 ?auto_24825 ) ) ( not ( = ?auto_24829 ?auto_24828 ) ) ( not ( = ?auto_24831 ?auto_24825 ) ) ( not ( = ?auto_24831 ?auto_24828 ) ) ( not ( = ?auto_24831 ?auto_24829 ) ) ( ON_BOARD ?auto_24837 ?auto_24838 ) ( SUPPORTS ?auto_24837 ?auto_24827 ) ( not ( = ?auto_24828 ?auto_24836 ) ) ( CALIBRATION_TARGET ?auto_24837 ?auto_24836 ) ( not ( = ?auto_24836 ?auto_24831 ) ) ( ON_BOARD ?auto_24833 ?auto_24838 ) ( not ( = ?auto_24837 ?auto_24833 ) ) ( SUPPORTS ?auto_24833 ?auto_24832 ) ( CALIBRATION_TARGET ?auto_24833 ?auto_24836 ) ( not ( = ?auto_24836 ?auto_24825 ) ) ( ON_BOARD ?auto_24835 ?auto_24838 ) ( not ( = ?auto_24833 ?auto_24835 ) ) ( SUPPORTS ?auto_24835 ?auto_24826 ) ( CALIBRATION_TARGET ?auto_24835 ?auto_24836 ) ( not ( = ?auto_24836 ?auto_24829 ) ) ( ON_BOARD ?auto_24839 ?auto_24838 ) ( not ( = ?auto_24835 ?auto_24839 ) ) ( SUPPORTS ?auto_24839 ?auto_24830 ) ( CALIBRATION_TARGET ?auto_24839 ?auto_24836 ) ( POWER_AVAIL ?auto_24838 ) ( POINTING ?auto_24838 ?auto_24834 ) ( not ( = ?auto_24836 ?auto_24834 ) ) ( not ( = ?auto_24829 ?auto_24834 ) ) ( not ( = ?auto_24830 ?auto_24826 ) ) ( not ( = ?auto_24825 ?auto_24834 ) ) ( not ( = ?auto_24830 ?auto_24832 ) ) ( not ( = ?auto_24826 ?auto_24832 ) ) ( not ( = ?auto_24831 ?auto_24834 ) ) ( not ( = ?auto_24833 ?auto_24839 ) ) ( not ( = ?auto_24830 ?auto_24827 ) ) ( not ( = ?auto_24826 ?auto_24827 ) ) ( not ( = ?auto_24832 ?auto_24827 ) ) ( not ( = ?auto_24828 ?auto_24834 ) ) ( not ( = ?auto_24837 ?auto_24835 ) ) ( not ( = ?auto_24837 ?auto_24839 ) ) )
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
      ?auto_24941 - INSTRUMENT
      ?auto_24942 - SATELLITE
      ?auto_24940 - DIRECTION
      ?auto_24937 - INSTRUMENT
      ?auto_24939 - INSTRUMENT
      ?auto_24943 - INSTRUMENT
      ?auto_24938 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_24932 ?auto_24929 ) ) ( not ( = ?auto_24933 ?auto_24929 ) ) ( not ( = ?auto_24933 ?auto_24932 ) ) ( not ( = ?auto_24935 ?auto_24929 ) ) ( not ( = ?auto_24935 ?auto_24932 ) ) ( not ( = ?auto_24935 ?auto_24933 ) ) ( ON_BOARD ?auto_24941 ?auto_24942 ) ( SUPPORTS ?auto_24941 ?auto_24931 ) ( not ( = ?auto_24932 ?auto_24940 ) ) ( CALIBRATION_TARGET ?auto_24941 ?auto_24940 ) ( not ( = ?auto_24940 ?auto_24933 ) ) ( ON_BOARD ?auto_24937 ?auto_24942 ) ( not ( = ?auto_24941 ?auto_24937 ) ) ( SUPPORTS ?auto_24937 ?auto_24934 ) ( CALIBRATION_TARGET ?auto_24937 ?auto_24940 ) ( not ( = ?auto_24940 ?auto_24929 ) ) ( ON_BOARD ?auto_24939 ?auto_24942 ) ( not ( = ?auto_24937 ?auto_24939 ) ) ( SUPPORTS ?auto_24939 ?auto_24930 ) ( CALIBRATION_TARGET ?auto_24939 ?auto_24940 ) ( not ( = ?auto_24940 ?auto_24935 ) ) ( ON_BOARD ?auto_24943 ?auto_24942 ) ( not ( = ?auto_24939 ?auto_24943 ) ) ( SUPPORTS ?auto_24943 ?auto_24936 ) ( CALIBRATION_TARGET ?auto_24943 ?auto_24940 ) ( POWER_AVAIL ?auto_24942 ) ( POINTING ?auto_24942 ?auto_24938 ) ( not ( = ?auto_24940 ?auto_24938 ) ) ( not ( = ?auto_24935 ?auto_24938 ) ) ( not ( = ?auto_24936 ?auto_24930 ) ) ( not ( = ?auto_24929 ?auto_24938 ) ) ( not ( = ?auto_24936 ?auto_24934 ) ) ( not ( = ?auto_24930 ?auto_24934 ) ) ( not ( = ?auto_24933 ?auto_24938 ) ) ( not ( = ?auto_24937 ?auto_24943 ) ) ( not ( = ?auto_24936 ?auto_24931 ) ) ( not ( = ?auto_24930 ?auto_24931 ) ) ( not ( = ?auto_24934 ?auto_24931 ) ) ( not ( = ?auto_24932 ?auto_24938 ) ) ( not ( = ?auto_24941 ?auto_24939 ) ) ( not ( = ?auto_24941 ?auto_24943 ) ) )
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
      ?auto_25096 - INSTRUMENT
      ?auto_25097 - SATELLITE
      ?auto_25095 - DIRECTION
      ?auto_25092 - INSTRUMENT
      ?auto_25094 - INSTRUMENT
      ?auto_25098 - INSTRUMENT
      ?auto_25093 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25087 ?auto_25084 ) ) ( not ( = ?auto_25088 ?auto_25084 ) ) ( not ( = ?auto_25088 ?auto_25087 ) ) ( not ( = ?auto_25090 ?auto_25084 ) ) ( not ( = ?auto_25090 ?auto_25087 ) ) ( not ( = ?auto_25090 ?auto_25088 ) ) ( ON_BOARD ?auto_25096 ?auto_25097 ) ( SUPPORTS ?auto_25096 ?auto_25091 ) ( not ( = ?auto_25090 ?auto_25095 ) ) ( CALIBRATION_TARGET ?auto_25096 ?auto_25095 ) ( not ( = ?auto_25095 ?auto_25084 ) ) ( ON_BOARD ?auto_25092 ?auto_25097 ) ( not ( = ?auto_25096 ?auto_25092 ) ) ( SUPPORTS ?auto_25092 ?auto_25085 ) ( CALIBRATION_TARGET ?auto_25092 ?auto_25095 ) ( not ( = ?auto_25095 ?auto_25088 ) ) ( ON_BOARD ?auto_25094 ?auto_25097 ) ( not ( = ?auto_25092 ?auto_25094 ) ) ( SUPPORTS ?auto_25094 ?auto_25089 ) ( CALIBRATION_TARGET ?auto_25094 ?auto_25095 ) ( not ( = ?auto_25095 ?auto_25087 ) ) ( ON_BOARD ?auto_25098 ?auto_25097 ) ( not ( = ?auto_25094 ?auto_25098 ) ) ( SUPPORTS ?auto_25098 ?auto_25086 ) ( CALIBRATION_TARGET ?auto_25098 ?auto_25095 ) ( POWER_AVAIL ?auto_25097 ) ( POINTING ?auto_25097 ?auto_25093 ) ( not ( = ?auto_25095 ?auto_25093 ) ) ( not ( = ?auto_25087 ?auto_25093 ) ) ( not ( = ?auto_25086 ?auto_25089 ) ) ( not ( = ?auto_25088 ?auto_25093 ) ) ( not ( = ?auto_25086 ?auto_25085 ) ) ( not ( = ?auto_25089 ?auto_25085 ) ) ( not ( = ?auto_25084 ?auto_25093 ) ) ( not ( = ?auto_25092 ?auto_25098 ) ) ( not ( = ?auto_25086 ?auto_25091 ) ) ( not ( = ?auto_25089 ?auto_25091 ) ) ( not ( = ?auto_25085 ?auto_25091 ) ) ( not ( = ?auto_25090 ?auto_25093 ) ) ( not ( = ?auto_25096 ?auto_25094 ) ) ( not ( = ?auto_25096 ?auto_25098 ) ) )
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
      ?auto_25145 - INSTRUMENT
      ?auto_25146 - SATELLITE
      ?auto_25144 - DIRECTION
      ?auto_25141 - INSTRUMENT
      ?auto_25143 - INSTRUMENT
      ?auto_25147 - INSTRUMENT
      ?auto_25142 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25136 ?auto_25133 ) ) ( not ( = ?auto_25137 ?auto_25133 ) ) ( not ( = ?auto_25137 ?auto_25136 ) ) ( not ( = ?auto_25139 ?auto_25133 ) ) ( not ( = ?auto_25139 ?auto_25136 ) ) ( not ( = ?auto_25139 ?auto_25137 ) ) ( ON_BOARD ?auto_25145 ?auto_25146 ) ( SUPPORTS ?auto_25145 ?auto_25138 ) ( not ( = ?auto_25137 ?auto_25144 ) ) ( CALIBRATION_TARGET ?auto_25145 ?auto_25144 ) ( not ( = ?auto_25144 ?auto_25133 ) ) ( ON_BOARD ?auto_25141 ?auto_25146 ) ( not ( = ?auto_25145 ?auto_25141 ) ) ( SUPPORTS ?auto_25141 ?auto_25134 ) ( CALIBRATION_TARGET ?auto_25141 ?auto_25144 ) ( not ( = ?auto_25144 ?auto_25139 ) ) ( ON_BOARD ?auto_25143 ?auto_25146 ) ( not ( = ?auto_25141 ?auto_25143 ) ) ( SUPPORTS ?auto_25143 ?auto_25140 ) ( CALIBRATION_TARGET ?auto_25143 ?auto_25144 ) ( not ( = ?auto_25144 ?auto_25136 ) ) ( ON_BOARD ?auto_25147 ?auto_25146 ) ( not ( = ?auto_25143 ?auto_25147 ) ) ( SUPPORTS ?auto_25147 ?auto_25135 ) ( CALIBRATION_TARGET ?auto_25147 ?auto_25144 ) ( POWER_AVAIL ?auto_25146 ) ( POINTING ?auto_25146 ?auto_25142 ) ( not ( = ?auto_25144 ?auto_25142 ) ) ( not ( = ?auto_25136 ?auto_25142 ) ) ( not ( = ?auto_25135 ?auto_25140 ) ) ( not ( = ?auto_25139 ?auto_25142 ) ) ( not ( = ?auto_25135 ?auto_25134 ) ) ( not ( = ?auto_25140 ?auto_25134 ) ) ( not ( = ?auto_25133 ?auto_25142 ) ) ( not ( = ?auto_25141 ?auto_25147 ) ) ( not ( = ?auto_25135 ?auto_25138 ) ) ( not ( = ?auto_25140 ?auto_25138 ) ) ( not ( = ?auto_25134 ?auto_25138 ) ) ( not ( = ?auto_25137 ?auto_25142 ) ) ( not ( = ?auto_25145 ?auto_25143 ) ) ( not ( = ?auto_25145 ?auto_25147 ) ) )
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
      ?auto_25194 - INSTRUMENT
      ?auto_25195 - SATELLITE
      ?auto_25193 - DIRECTION
      ?auto_25190 - INSTRUMENT
      ?auto_25192 - INSTRUMENT
      ?auto_25196 - INSTRUMENT
      ?auto_25191 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25185 ?auto_25182 ) ) ( not ( = ?auto_25186 ?auto_25182 ) ) ( not ( = ?auto_25186 ?auto_25185 ) ) ( not ( = ?auto_25188 ?auto_25182 ) ) ( not ( = ?auto_25188 ?auto_25185 ) ) ( not ( = ?auto_25188 ?auto_25186 ) ) ( ON_BOARD ?auto_25194 ?auto_25195 ) ( SUPPORTS ?auto_25194 ?auto_25189 ) ( not ( = ?auto_25188 ?auto_25193 ) ) ( CALIBRATION_TARGET ?auto_25194 ?auto_25193 ) ( not ( = ?auto_25193 ?auto_25182 ) ) ( ON_BOARD ?auto_25190 ?auto_25195 ) ( not ( = ?auto_25194 ?auto_25190 ) ) ( SUPPORTS ?auto_25190 ?auto_25183 ) ( CALIBRATION_TARGET ?auto_25190 ?auto_25193 ) ( not ( = ?auto_25193 ?auto_25185 ) ) ( ON_BOARD ?auto_25192 ?auto_25195 ) ( not ( = ?auto_25190 ?auto_25192 ) ) ( SUPPORTS ?auto_25192 ?auto_25184 ) ( CALIBRATION_TARGET ?auto_25192 ?auto_25193 ) ( not ( = ?auto_25193 ?auto_25186 ) ) ( ON_BOARD ?auto_25196 ?auto_25195 ) ( not ( = ?auto_25192 ?auto_25196 ) ) ( SUPPORTS ?auto_25196 ?auto_25187 ) ( CALIBRATION_TARGET ?auto_25196 ?auto_25193 ) ( POWER_AVAIL ?auto_25195 ) ( POINTING ?auto_25195 ?auto_25191 ) ( not ( = ?auto_25193 ?auto_25191 ) ) ( not ( = ?auto_25186 ?auto_25191 ) ) ( not ( = ?auto_25187 ?auto_25184 ) ) ( not ( = ?auto_25185 ?auto_25191 ) ) ( not ( = ?auto_25187 ?auto_25183 ) ) ( not ( = ?auto_25184 ?auto_25183 ) ) ( not ( = ?auto_25182 ?auto_25191 ) ) ( not ( = ?auto_25190 ?auto_25196 ) ) ( not ( = ?auto_25187 ?auto_25189 ) ) ( not ( = ?auto_25184 ?auto_25189 ) ) ( not ( = ?auto_25183 ?auto_25189 ) ) ( not ( = ?auto_25188 ?auto_25191 ) ) ( not ( = ?auto_25194 ?auto_25192 ) ) ( not ( = ?auto_25194 ?auto_25196 ) ) )
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
      ?auto_25243 - INSTRUMENT
      ?auto_25244 - SATELLITE
      ?auto_25242 - DIRECTION
      ?auto_25239 - INSTRUMENT
      ?auto_25241 - INSTRUMENT
      ?auto_25245 - INSTRUMENT
      ?auto_25240 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25234 ?auto_25231 ) ) ( not ( = ?auto_25235 ?auto_25231 ) ) ( not ( = ?auto_25235 ?auto_25234 ) ) ( not ( = ?auto_25237 ?auto_25231 ) ) ( not ( = ?auto_25237 ?auto_25234 ) ) ( not ( = ?auto_25237 ?auto_25235 ) ) ( ON_BOARD ?auto_25243 ?auto_25244 ) ( SUPPORTS ?auto_25243 ?auto_25236 ) ( not ( = ?auto_25235 ?auto_25242 ) ) ( CALIBRATION_TARGET ?auto_25243 ?auto_25242 ) ( not ( = ?auto_25242 ?auto_25231 ) ) ( ON_BOARD ?auto_25239 ?auto_25244 ) ( not ( = ?auto_25243 ?auto_25239 ) ) ( SUPPORTS ?auto_25239 ?auto_25232 ) ( CALIBRATION_TARGET ?auto_25239 ?auto_25242 ) ( not ( = ?auto_25242 ?auto_25234 ) ) ( ON_BOARD ?auto_25241 ?auto_25244 ) ( not ( = ?auto_25239 ?auto_25241 ) ) ( SUPPORTS ?auto_25241 ?auto_25233 ) ( CALIBRATION_TARGET ?auto_25241 ?auto_25242 ) ( not ( = ?auto_25242 ?auto_25237 ) ) ( ON_BOARD ?auto_25245 ?auto_25244 ) ( not ( = ?auto_25241 ?auto_25245 ) ) ( SUPPORTS ?auto_25245 ?auto_25238 ) ( CALIBRATION_TARGET ?auto_25245 ?auto_25242 ) ( POWER_AVAIL ?auto_25244 ) ( POINTING ?auto_25244 ?auto_25240 ) ( not ( = ?auto_25242 ?auto_25240 ) ) ( not ( = ?auto_25237 ?auto_25240 ) ) ( not ( = ?auto_25238 ?auto_25233 ) ) ( not ( = ?auto_25234 ?auto_25240 ) ) ( not ( = ?auto_25238 ?auto_25232 ) ) ( not ( = ?auto_25233 ?auto_25232 ) ) ( not ( = ?auto_25231 ?auto_25240 ) ) ( not ( = ?auto_25239 ?auto_25245 ) ) ( not ( = ?auto_25238 ?auto_25236 ) ) ( not ( = ?auto_25233 ?auto_25236 ) ) ( not ( = ?auto_25232 ?auto_25236 ) ) ( not ( = ?auto_25235 ?auto_25240 ) ) ( not ( = ?auto_25243 ?auto_25241 ) ) ( not ( = ?auto_25243 ?auto_25245 ) ) )
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
      ?auto_25451 - INSTRUMENT
      ?auto_25452 - SATELLITE
      ?auto_25450 - DIRECTION
      ?auto_25447 - INSTRUMENT
      ?auto_25449 - INSTRUMENT
      ?auto_25453 - INSTRUMENT
      ?auto_25448 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25442 ?auto_25439 ) ) ( not ( = ?auto_25443 ?auto_25439 ) ) ( not ( = ?auto_25443 ?auto_25442 ) ) ( not ( = ?auto_25445 ?auto_25439 ) ) ( not ( = ?auto_25445 ?auto_25442 ) ) ( not ( = ?auto_25445 ?auto_25443 ) ) ( ON_BOARD ?auto_25451 ?auto_25452 ) ( SUPPORTS ?auto_25451 ?auto_25441 ) ( not ( = ?auto_25442 ?auto_25450 ) ) ( CALIBRATION_TARGET ?auto_25451 ?auto_25450 ) ( not ( = ?auto_25450 ?auto_25439 ) ) ( ON_BOARD ?auto_25447 ?auto_25452 ) ( not ( = ?auto_25451 ?auto_25447 ) ) ( SUPPORTS ?auto_25447 ?auto_25440 ) ( CALIBRATION_TARGET ?auto_25447 ?auto_25450 ) ( not ( = ?auto_25450 ?auto_25445 ) ) ( ON_BOARD ?auto_25449 ?auto_25452 ) ( not ( = ?auto_25447 ?auto_25449 ) ) ( SUPPORTS ?auto_25449 ?auto_25446 ) ( CALIBRATION_TARGET ?auto_25449 ?auto_25450 ) ( not ( = ?auto_25450 ?auto_25443 ) ) ( ON_BOARD ?auto_25453 ?auto_25452 ) ( not ( = ?auto_25449 ?auto_25453 ) ) ( SUPPORTS ?auto_25453 ?auto_25444 ) ( CALIBRATION_TARGET ?auto_25453 ?auto_25450 ) ( POWER_AVAIL ?auto_25452 ) ( POINTING ?auto_25452 ?auto_25448 ) ( not ( = ?auto_25450 ?auto_25448 ) ) ( not ( = ?auto_25443 ?auto_25448 ) ) ( not ( = ?auto_25444 ?auto_25446 ) ) ( not ( = ?auto_25445 ?auto_25448 ) ) ( not ( = ?auto_25444 ?auto_25440 ) ) ( not ( = ?auto_25446 ?auto_25440 ) ) ( not ( = ?auto_25439 ?auto_25448 ) ) ( not ( = ?auto_25447 ?auto_25453 ) ) ( not ( = ?auto_25444 ?auto_25441 ) ) ( not ( = ?auto_25446 ?auto_25441 ) ) ( not ( = ?auto_25440 ?auto_25441 ) ) ( not ( = ?auto_25442 ?auto_25448 ) ) ( not ( = ?auto_25451 ?auto_25449 ) ) ( not ( = ?auto_25451 ?auto_25453 ) ) )
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
      ?auto_25500 - INSTRUMENT
      ?auto_25501 - SATELLITE
      ?auto_25499 - DIRECTION
      ?auto_25496 - INSTRUMENT
      ?auto_25498 - INSTRUMENT
      ?auto_25502 - INSTRUMENT
      ?auto_25497 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25491 ?auto_25488 ) ) ( not ( = ?auto_25492 ?auto_25488 ) ) ( not ( = ?auto_25492 ?auto_25491 ) ) ( not ( = ?auto_25494 ?auto_25488 ) ) ( not ( = ?auto_25494 ?auto_25491 ) ) ( not ( = ?auto_25494 ?auto_25492 ) ) ( ON_BOARD ?auto_25500 ?auto_25501 ) ( SUPPORTS ?auto_25500 ?auto_25490 ) ( not ( = ?auto_25491 ?auto_25499 ) ) ( CALIBRATION_TARGET ?auto_25500 ?auto_25499 ) ( not ( = ?auto_25499 ?auto_25488 ) ) ( ON_BOARD ?auto_25496 ?auto_25501 ) ( not ( = ?auto_25500 ?auto_25496 ) ) ( SUPPORTS ?auto_25496 ?auto_25489 ) ( CALIBRATION_TARGET ?auto_25496 ?auto_25499 ) ( not ( = ?auto_25499 ?auto_25492 ) ) ( ON_BOARD ?auto_25498 ?auto_25501 ) ( not ( = ?auto_25496 ?auto_25498 ) ) ( SUPPORTS ?auto_25498 ?auto_25493 ) ( CALIBRATION_TARGET ?auto_25498 ?auto_25499 ) ( not ( = ?auto_25499 ?auto_25494 ) ) ( ON_BOARD ?auto_25502 ?auto_25501 ) ( not ( = ?auto_25498 ?auto_25502 ) ) ( SUPPORTS ?auto_25502 ?auto_25495 ) ( CALIBRATION_TARGET ?auto_25502 ?auto_25499 ) ( POWER_AVAIL ?auto_25501 ) ( POINTING ?auto_25501 ?auto_25497 ) ( not ( = ?auto_25499 ?auto_25497 ) ) ( not ( = ?auto_25494 ?auto_25497 ) ) ( not ( = ?auto_25495 ?auto_25493 ) ) ( not ( = ?auto_25492 ?auto_25497 ) ) ( not ( = ?auto_25495 ?auto_25489 ) ) ( not ( = ?auto_25493 ?auto_25489 ) ) ( not ( = ?auto_25488 ?auto_25497 ) ) ( not ( = ?auto_25496 ?auto_25502 ) ) ( not ( = ?auto_25495 ?auto_25490 ) ) ( not ( = ?auto_25493 ?auto_25490 ) ) ( not ( = ?auto_25489 ?auto_25490 ) ) ( not ( = ?auto_25491 ?auto_25497 ) ) ( not ( = ?auto_25500 ?auto_25498 ) ) ( not ( = ?auto_25500 ?auto_25502 ) ) )
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
      ?auto_25816 - INSTRUMENT
      ?auto_25817 - SATELLITE
      ?auto_25815 - DIRECTION
      ?auto_25812 - INSTRUMENT
      ?auto_25814 - INSTRUMENT
      ?auto_25818 - INSTRUMENT
      ?auto_25813 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25807 ?auto_25804 ) ) ( not ( = ?auto_25808 ?auto_25804 ) ) ( not ( = ?auto_25808 ?auto_25807 ) ) ( not ( = ?auto_25810 ?auto_25804 ) ) ( not ( = ?auto_25810 ?auto_25807 ) ) ( not ( = ?auto_25810 ?auto_25808 ) ) ( ON_BOARD ?auto_25816 ?auto_25817 ) ( SUPPORTS ?auto_25816 ?auto_25805 ) ( not ( = ?auto_25804 ?auto_25815 ) ) ( CALIBRATION_TARGET ?auto_25816 ?auto_25815 ) ( not ( = ?auto_25815 ?auto_25810 ) ) ( ON_BOARD ?auto_25812 ?auto_25817 ) ( not ( = ?auto_25816 ?auto_25812 ) ) ( SUPPORTS ?auto_25812 ?auto_25811 ) ( CALIBRATION_TARGET ?auto_25812 ?auto_25815 ) ( not ( = ?auto_25815 ?auto_25808 ) ) ( ON_BOARD ?auto_25814 ?auto_25817 ) ( not ( = ?auto_25812 ?auto_25814 ) ) ( SUPPORTS ?auto_25814 ?auto_25809 ) ( CALIBRATION_TARGET ?auto_25814 ?auto_25815 ) ( not ( = ?auto_25815 ?auto_25807 ) ) ( ON_BOARD ?auto_25818 ?auto_25817 ) ( not ( = ?auto_25814 ?auto_25818 ) ) ( SUPPORTS ?auto_25818 ?auto_25806 ) ( CALIBRATION_TARGET ?auto_25818 ?auto_25815 ) ( POWER_AVAIL ?auto_25817 ) ( POINTING ?auto_25817 ?auto_25813 ) ( not ( = ?auto_25815 ?auto_25813 ) ) ( not ( = ?auto_25807 ?auto_25813 ) ) ( not ( = ?auto_25806 ?auto_25809 ) ) ( not ( = ?auto_25808 ?auto_25813 ) ) ( not ( = ?auto_25806 ?auto_25811 ) ) ( not ( = ?auto_25809 ?auto_25811 ) ) ( not ( = ?auto_25810 ?auto_25813 ) ) ( not ( = ?auto_25812 ?auto_25818 ) ) ( not ( = ?auto_25806 ?auto_25805 ) ) ( not ( = ?auto_25809 ?auto_25805 ) ) ( not ( = ?auto_25811 ?auto_25805 ) ) ( not ( = ?auto_25804 ?auto_25813 ) ) ( not ( = ?auto_25816 ?auto_25814 ) ) ( not ( = ?auto_25816 ?auto_25818 ) ) )
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
      ?auto_25865 - INSTRUMENT
      ?auto_25866 - SATELLITE
      ?auto_25864 - DIRECTION
      ?auto_25861 - INSTRUMENT
      ?auto_25863 - INSTRUMENT
      ?auto_25867 - INSTRUMENT
      ?auto_25862 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25856 ?auto_25853 ) ) ( not ( = ?auto_25857 ?auto_25853 ) ) ( not ( = ?auto_25857 ?auto_25856 ) ) ( not ( = ?auto_25859 ?auto_25853 ) ) ( not ( = ?auto_25859 ?auto_25856 ) ) ( not ( = ?auto_25859 ?auto_25857 ) ) ( ON_BOARD ?auto_25865 ?auto_25866 ) ( SUPPORTS ?auto_25865 ?auto_25854 ) ( not ( = ?auto_25853 ?auto_25864 ) ) ( CALIBRATION_TARGET ?auto_25865 ?auto_25864 ) ( not ( = ?auto_25864 ?auto_25857 ) ) ( ON_BOARD ?auto_25861 ?auto_25866 ) ( not ( = ?auto_25865 ?auto_25861 ) ) ( SUPPORTS ?auto_25861 ?auto_25858 ) ( CALIBRATION_TARGET ?auto_25861 ?auto_25864 ) ( not ( = ?auto_25864 ?auto_25859 ) ) ( ON_BOARD ?auto_25863 ?auto_25866 ) ( not ( = ?auto_25861 ?auto_25863 ) ) ( SUPPORTS ?auto_25863 ?auto_25860 ) ( CALIBRATION_TARGET ?auto_25863 ?auto_25864 ) ( not ( = ?auto_25864 ?auto_25856 ) ) ( ON_BOARD ?auto_25867 ?auto_25866 ) ( not ( = ?auto_25863 ?auto_25867 ) ) ( SUPPORTS ?auto_25867 ?auto_25855 ) ( CALIBRATION_TARGET ?auto_25867 ?auto_25864 ) ( POWER_AVAIL ?auto_25866 ) ( POINTING ?auto_25866 ?auto_25862 ) ( not ( = ?auto_25864 ?auto_25862 ) ) ( not ( = ?auto_25856 ?auto_25862 ) ) ( not ( = ?auto_25855 ?auto_25860 ) ) ( not ( = ?auto_25859 ?auto_25862 ) ) ( not ( = ?auto_25855 ?auto_25858 ) ) ( not ( = ?auto_25860 ?auto_25858 ) ) ( not ( = ?auto_25857 ?auto_25862 ) ) ( not ( = ?auto_25861 ?auto_25867 ) ) ( not ( = ?auto_25855 ?auto_25854 ) ) ( not ( = ?auto_25860 ?auto_25854 ) ) ( not ( = ?auto_25858 ?auto_25854 ) ) ( not ( = ?auto_25853 ?auto_25862 ) ) ( not ( = ?auto_25865 ?auto_25863 ) ) ( not ( = ?auto_25865 ?auto_25867 ) ) )
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
      ?auto_26020 - INSTRUMENT
      ?auto_26021 - SATELLITE
      ?auto_26019 - DIRECTION
      ?auto_26016 - INSTRUMENT
      ?auto_26018 - INSTRUMENT
      ?auto_26022 - INSTRUMENT
      ?auto_26017 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26011 ?auto_26008 ) ) ( not ( = ?auto_26012 ?auto_26008 ) ) ( not ( = ?auto_26012 ?auto_26011 ) ) ( not ( = ?auto_26014 ?auto_26008 ) ) ( not ( = ?auto_26014 ?auto_26011 ) ) ( not ( = ?auto_26014 ?auto_26012 ) ) ( ON_BOARD ?auto_26020 ?auto_26021 ) ( SUPPORTS ?auto_26020 ?auto_26009 ) ( not ( = ?auto_26008 ?auto_26019 ) ) ( CALIBRATION_TARGET ?auto_26020 ?auto_26019 ) ( not ( = ?auto_26019 ?auto_26014 ) ) ( ON_BOARD ?auto_26016 ?auto_26021 ) ( not ( = ?auto_26020 ?auto_26016 ) ) ( SUPPORTS ?auto_26016 ?auto_26015 ) ( CALIBRATION_TARGET ?auto_26016 ?auto_26019 ) ( not ( = ?auto_26019 ?auto_26011 ) ) ( ON_BOARD ?auto_26018 ?auto_26021 ) ( not ( = ?auto_26016 ?auto_26018 ) ) ( SUPPORTS ?auto_26018 ?auto_26010 ) ( CALIBRATION_TARGET ?auto_26018 ?auto_26019 ) ( not ( = ?auto_26019 ?auto_26012 ) ) ( ON_BOARD ?auto_26022 ?auto_26021 ) ( not ( = ?auto_26018 ?auto_26022 ) ) ( SUPPORTS ?auto_26022 ?auto_26013 ) ( CALIBRATION_TARGET ?auto_26022 ?auto_26019 ) ( POWER_AVAIL ?auto_26021 ) ( POINTING ?auto_26021 ?auto_26017 ) ( not ( = ?auto_26019 ?auto_26017 ) ) ( not ( = ?auto_26012 ?auto_26017 ) ) ( not ( = ?auto_26013 ?auto_26010 ) ) ( not ( = ?auto_26011 ?auto_26017 ) ) ( not ( = ?auto_26013 ?auto_26015 ) ) ( not ( = ?auto_26010 ?auto_26015 ) ) ( not ( = ?auto_26014 ?auto_26017 ) ) ( not ( = ?auto_26016 ?auto_26022 ) ) ( not ( = ?auto_26013 ?auto_26009 ) ) ( not ( = ?auto_26010 ?auto_26009 ) ) ( not ( = ?auto_26015 ?auto_26009 ) ) ( not ( = ?auto_26008 ?auto_26017 ) ) ( not ( = ?auto_26020 ?auto_26018 ) ) ( not ( = ?auto_26020 ?auto_26022 ) ) )
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
      ?auto_26124 - INSTRUMENT
      ?auto_26125 - SATELLITE
      ?auto_26123 - DIRECTION
      ?auto_26120 - INSTRUMENT
      ?auto_26122 - INSTRUMENT
      ?auto_26126 - INSTRUMENT
      ?auto_26121 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26115 ?auto_26112 ) ) ( not ( = ?auto_26116 ?auto_26112 ) ) ( not ( = ?auto_26116 ?auto_26115 ) ) ( not ( = ?auto_26118 ?auto_26112 ) ) ( not ( = ?auto_26118 ?auto_26115 ) ) ( not ( = ?auto_26118 ?auto_26116 ) ) ( ON_BOARD ?auto_26124 ?auto_26125 ) ( SUPPORTS ?auto_26124 ?auto_26113 ) ( not ( = ?auto_26112 ?auto_26123 ) ) ( CALIBRATION_TARGET ?auto_26124 ?auto_26123 ) ( not ( = ?auto_26123 ?auto_26116 ) ) ( ON_BOARD ?auto_26120 ?auto_26125 ) ( not ( = ?auto_26124 ?auto_26120 ) ) ( SUPPORTS ?auto_26120 ?auto_26117 ) ( CALIBRATION_TARGET ?auto_26120 ?auto_26123 ) ( not ( = ?auto_26123 ?auto_26115 ) ) ( ON_BOARD ?auto_26122 ?auto_26125 ) ( not ( = ?auto_26120 ?auto_26122 ) ) ( SUPPORTS ?auto_26122 ?auto_26114 ) ( CALIBRATION_TARGET ?auto_26122 ?auto_26123 ) ( not ( = ?auto_26123 ?auto_26118 ) ) ( ON_BOARD ?auto_26126 ?auto_26125 ) ( not ( = ?auto_26122 ?auto_26126 ) ) ( SUPPORTS ?auto_26126 ?auto_26119 ) ( CALIBRATION_TARGET ?auto_26126 ?auto_26123 ) ( POWER_AVAIL ?auto_26125 ) ( POINTING ?auto_26125 ?auto_26121 ) ( not ( = ?auto_26123 ?auto_26121 ) ) ( not ( = ?auto_26118 ?auto_26121 ) ) ( not ( = ?auto_26119 ?auto_26114 ) ) ( not ( = ?auto_26115 ?auto_26121 ) ) ( not ( = ?auto_26119 ?auto_26117 ) ) ( not ( = ?auto_26114 ?auto_26117 ) ) ( not ( = ?auto_26116 ?auto_26121 ) ) ( not ( = ?auto_26120 ?auto_26126 ) ) ( not ( = ?auto_26119 ?auto_26113 ) ) ( not ( = ?auto_26114 ?auto_26113 ) ) ( not ( = ?auto_26117 ?auto_26113 ) ) ( not ( = ?auto_26112 ?auto_26121 ) ) ( not ( = ?auto_26124 ?auto_26122 ) ) ( not ( = ?auto_26124 ?auto_26126 ) ) )
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
      ?auto_26279 - INSTRUMENT
      ?auto_26280 - SATELLITE
      ?auto_26278 - DIRECTION
      ?auto_26275 - INSTRUMENT
      ?auto_26277 - INSTRUMENT
      ?auto_26281 - INSTRUMENT
      ?auto_26276 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26270 ?auto_26267 ) ) ( not ( = ?auto_26271 ?auto_26267 ) ) ( not ( = ?auto_26271 ?auto_26270 ) ) ( not ( = ?auto_26273 ?auto_26267 ) ) ( not ( = ?auto_26273 ?auto_26270 ) ) ( not ( = ?auto_26273 ?auto_26271 ) ) ( ON_BOARD ?auto_26279 ?auto_26280 ) ( SUPPORTS ?auto_26279 ?auto_26268 ) ( not ( = ?auto_26267 ?auto_26278 ) ) ( CALIBRATION_TARGET ?auto_26279 ?auto_26278 ) ( not ( = ?auto_26278 ?auto_26270 ) ) ( ON_BOARD ?auto_26275 ?auto_26280 ) ( not ( = ?auto_26279 ?auto_26275 ) ) ( SUPPORTS ?auto_26275 ?auto_26269 ) ( CALIBRATION_TARGET ?auto_26275 ?auto_26278 ) ( not ( = ?auto_26278 ?auto_26273 ) ) ( ON_BOARD ?auto_26277 ?auto_26280 ) ( not ( = ?auto_26275 ?auto_26277 ) ) ( SUPPORTS ?auto_26277 ?auto_26274 ) ( CALIBRATION_TARGET ?auto_26277 ?auto_26278 ) ( not ( = ?auto_26278 ?auto_26271 ) ) ( ON_BOARD ?auto_26281 ?auto_26280 ) ( not ( = ?auto_26277 ?auto_26281 ) ) ( SUPPORTS ?auto_26281 ?auto_26272 ) ( CALIBRATION_TARGET ?auto_26281 ?auto_26278 ) ( POWER_AVAIL ?auto_26280 ) ( POINTING ?auto_26280 ?auto_26276 ) ( not ( = ?auto_26278 ?auto_26276 ) ) ( not ( = ?auto_26271 ?auto_26276 ) ) ( not ( = ?auto_26272 ?auto_26274 ) ) ( not ( = ?auto_26273 ?auto_26276 ) ) ( not ( = ?auto_26272 ?auto_26269 ) ) ( not ( = ?auto_26274 ?auto_26269 ) ) ( not ( = ?auto_26270 ?auto_26276 ) ) ( not ( = ?auto_26275 ?auto_26281 ) ) ( not ( = ?auto_26272 ?auto_26268 ) ) ( not ( = ?auto_26274 ?auto_26268 ) ) ( not ( = ?auto_26269 ?auto_26268 ) ) ( not ( = ?auto_26267 ?auto_26276 ) ) ( not ( = ?auto_26279 ?auto_26277 ) ) ( not ( = ?auto_26279 ?auto_26281 ) ) )
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
      ?auto_26328 - INSTRUMENT
      ?auto_26329 - SATELLITE
      ?auto_26327 - DIRECTION
      ?auto_26324 - INSTRUMENT
      ?auto_26326 - INSTRUMENT
      ?auto_26330 - INSTRUMENT
      ?auto_26325 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26319 ?auto_26316 ) ) ( not ( = ?auto_26320 ?auto_26316 ) ) ( not ( = ?auto_26320 ?auto_26319 ) ) ( not ( = ?auto_26322 ?auto_26316 ) ) ( not ( = ?auto_26322 ?auto_26319 ) ) ( not ( = ?auto_26322 ?auto_26320 ) ) ( ON_BOARD ?auto_26328 ?auto_26329 ) ( SUPPORTS ?auto_26328 ?auto_26317 ) ( not ( = ?auto_26316 ?auto_26327 ) ) ( CALIBRATION_TARGET ?auto_26328 ?auto_26327 ) ( not ( = ?auto_26327 ?auto_26319 ) ) ( ON_BOARD ?auto_26324 ?auto_26329 ) ( not ( = ?auto_26328 ?auto_26324 ) ) ( SUPPORTS ?auto_26324 ?auto_26318 ) ( CALIBRATION_TARGET ?auto_26324 ?auto_26327 ) ( not ( = ?auto_26327 ?auto_26320 ) ) ( ON_BOARD ?auto_26326 ?auto_26329 ) ( not ( = ?auto_26324 ?auto_26326 ) ) ( SUPPORTS ?auto_26326 ?auto_26321 ) ( CALIBRATION_TARGET ?auto_26326 ?auto_26327 ) ( not ( = ?auto_26327 ?auto_26322 ) ) ( ON_BOARD ?auto_26330 ?auto_26329 ) ( not ( = ?auto_26326 ?auto_26330 ) ) ( SUPPORTS ?auto_26330 ?auto_26323 ) ( CALIBRATION_TARGET ?auto_26330 ?auto_26327 ) ( POWER_AVAIL ?auto_26329 ) ( POINTING ?auto_26329 ?auto_26325 ) ( not ( = ?auto_26327 ?auto_26325 ) ) ( not ( = ?auto_26322 ?auto_26325 ) ) ( not ( = ?auto_26323 ?auto_26321 ) ) ( not ( = ?auto_26320 ?auto_26325 ) ) ( not ( = ?auto_26323 ?auto_26318 ) ) ( not ( = ?auto_26321 ?auto_26318 ) ) ( not ( = ?auto_26319 ?auto_26325 ) ) ( not ( = ?auto_26324 ?auto_26330 ) ) ( not ( = ?auto_26323 ?auto_26317 ) ) ( not ( = ?auto_26321 ?auto_26317 ) ) ( not ( = ?auto_26318 ?auto_26317 ) ) ( not ( = ?auto_26316 ?auto_26325 ) ) ( not ( = ?auto_26328 ?auto_26326 ) ) ( not ( = ?auto_26328 ?auto_26330 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_26322 ?auto_26323 ?auto_26320 ?auto_26321 ?auto_26316 ?auto_26317 ?auto_26319 ?auto_26318 )
      ( GET-4IMAGE-VERIFY ?auto_26316 ?auto_26317 ?auto_26319 ?auto_26318 ?auto_26320 ?auto_26321 ?auto_26322 ?auto_26323 ) )
  )

)

