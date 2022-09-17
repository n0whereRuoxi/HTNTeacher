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
      ?auto_28876 - DIRECTION
      ?auto_28877 - MODE
    )
    :vars
    (
      ?auto_28878 - INSTRUMENT
      ?auto_28879 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_28878 ) ( ON_BOARD ?auto_28878 ?auto_28879 ) ( SUPPORTS ?auto_28878 ?auto_28877 ) ( POWER_ON ?auto_28878 ) ( POINTING ?auto_28879 ?auto_28876 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_28879 ?auto_28876 ?auto_28878 ?auto_28877 )
      ( GET-1IMAGE-VERIFY ?auto_28876 ?auto_28877 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_28904 - DIRECTION
      ?auto_28905 - MODE
    )
    :vars
    (
      ?auto_28906 - INSTRUMENT
      ?auto_28907 - SATELLITE
      ?auto_28908 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_28906 ) ( ON_BOARD ?auto_28906 ?auto_28907 ) ( SUPPORTS ?auto_28906 ?auto_28905 ) ( POWER_ON ?auto_28906 ) ( POINTING ?auto_28907 ?auto_28908 ) ( not ( = ?auto_28904 ?auto_28908 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_28907 ?auto_28904 ?auto_28908 )
      ( GET-1IMAGE ?auto_28904 ?auto_28905 )
      ( GET-1IMAGE-VERIFY ?auto_28904 ?auto_28905 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_28936 - DIRECTION
      ?auto_28937 - MODE
    )
    :vars
    (
      ?auto_28939 - INSTRUMENT
      ?auto_28938 - SATELLITE
      ?auto_28940 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28939 ?auto_28938 ) ( SUPPORTS ?auto_28939 ?auto_28937 ) ( POWER_ON ?auto_28939 ) ( POINTING ?auto_28938 ?auto_28940 ) ( not ( = ?auto_28936 ?auto_28940 ) ) ( CALIBRATION_TARGET ?auto_28939 ?auto_28940 ) ( NOT_CALIBRATED ?auto_28939 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_28938 ?auto_28939 ?auto_28940 )
      ( GET-1IMAGE ?auto_28936 ?auto_28937 )
      ( GET-1IMAGE-VERIFY ?auto_28936 ?auto_28937 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_28968 - DIRECTION
      ?auto_28969 - MODE
    )
    :vars
    (
      ?auto_28971 - INSTRUMENT
      ?auto_28970 - SATELLITE
      ?auto_28972 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_28971 ?auto_28970 ) ( SUPPORTS ?auto_28971 ?auto_28969 ) ( POINTING ?auto_28970 ?auto_28972 ) ( not ( = ?auto_28968 ?auto_28972 ) ) ( CALIBRATION_TARGET ?auto_28971 ?auto_28972 ) ( POWER_AVAIL ?auto_28970 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_28971 ?auto_28970 )
      ( GET-1IMAGE ?auto_28968 ?auto_28969 )
      ( GET-1IMAGE-VERIFY ?auto_28968 ?auto_28969 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_29000 - DIRECTION
      ?auto_29001 - MODE
    )
    :vars
    (
      ?auto_29002 - INSTRUMENT
      ?auto_29003 - SATELLITE
      ?auto_29004 - DIRECTION
      ?auto_29005 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29002 ?auto_29003 ) ( SUPPORTS ?auto_29002 ?auto_29001 ) ( not ( = ?auto_29000 ?auto_29004 ) ) ( CALIBRATION_TARGET ?auto_29002 ?auto_29004 ) ( POWER_AVAIL ?auto_29003 ) ( POINTING ?auto_29003 ?auto_29005 ) ( not ( = ?auto_29004 ?auto_29005 ) ) ( not ( = ?auto_29000 ?auto_29005 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_29003 ?auto_29004 ?auto_29005 )
      ( GET-1IMAGE ?auto_29000 ?auto_29001 )
      ( GET-1IMAGE-VERIFY ?auto_29000 ?auto_29001 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29217 - DIRECTION
      ?auto_29218 - MODE
      ?auto_29219 - DIRECTION
      ?auto_29216 - MODE
    )
    :vars
    (
      ?auto_29221 - INSTRUMENT
      ?auto_29220 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_29221 ) ( ON_BOARD ?auto_29221 ?auto_29220 ) ( SUPPORTS ?auto_29221 ?auto_29216 ) ( POWER_ON ?auto_29221 ) ( POINTING ?auto_29220 ?auto_29219 ) ( HAVE_IMAGE ?auto_29217 ?auto_29218 ) ( not ( = ?auto_29217 ?auto_29219 ) ) ( not ( = ?auto_29218 ?auto_29216 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29219 ?auto_29216 )
      ( GET-2IMAGE-VERIFY ?auto_29217 ?auto_29218 ?auto_29219 ?auto_29216 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29223 - DIRECTION
      ?auto_29224 - MODE
      ?auto_29225 - DIRECTION
      ?auto_29222 - MODE
    )
    :vars
    (
      ?auto_29227 - INSTRUMENT
      ?auto_29226 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_29227 ) ( ON_BOARD ?auto_29227 ?auto_29226 ) ( SUPPORTS ?auto_29227 ?auto_29224 ) ( POWER_ON ?auto_29227 ) ( POINTING ?auto_29226 ?auto_29223 ) ( HAVE_IMAGE ?auto_29225 ?auto_29222 ) ( not ( = ?auto_29223 ?auto_29225 ) ) ( not ( = ?auto_29224 ?auto_29222 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29223 ?auto_29224 )
      ( GET-2IMAGE-VERIFY ?auto_29223 ?auto_29224 ?auto_29225 ?auto_29222 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29235 - DIRECTION
      ?auto_29236 - MODE
      ?auto_29237 - DIRECTION
      ?auto_29234 - MODE
      ?auto_29238 - DIRECTION
      ?auto_29239 - MODE
    )
    :vars
    (
      ?auto_29241 - INSTRUMENT
      ?auto_29240 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_29241 ) ( ON_BOARD ?auto_29241 ?auto_29240 ) ( SUPPORTS ?auto_29241 ?auto_29239 ) ( POWER_ON ?auto_29241 ) ( POINTING ?auto_29240 ?auto_29238 ) ( HAVE_IMAGE ?auto_29235 ?auto_29236 ) ( HAVE_IMAGE ?auto_29237 ?auto_29234 ) ( not ( = ?auto_29235 ?auto_29237 ) ) ( not ( = ?auto_29235 ?auto_29238 ) ) ( not ( = ?auto_29236 ?auto_29234 ) ) ( not ( = ?auto_29236 ?auto_29239 ) ) ( not ( = ?auto_29237 ?auto_29238 ) ) ( not ( = ?auto_29234 ?auto_29239 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29238 ?auto_29239 )
      ( GET-3IMAGE-VERIFY ?auto_29235 ?auto_29236 ?auto_29237 ?auto_29234 ?auto_29238 ?auto_29239 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29243 - DIRECTION
      ?auto_29244 - MODE
      ?auto_29245 - DIRECTION
      ?auto_29242 - MODE
      ?auto_29246 - DIRECTION
      ?auto_29247 - MODE
    )
    :vars
    (
      ?auto_29249 - INSTRUMENT
      ?auto_29248 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_29249 ) ( ON_BOARD ?auto_29249 ?auto_29248 ) ( SUPPORTS ?auto_29249 ?auto_29242 ) ( POWER_ON ?auto_29249 ) ( POINTING ?auto_29248 ?auto_29245 ) ( HAVE_IMAGE ?auto_29243 ?auto_29244 ) ( HAVE_IMAGE ?auto_29246 ?auto_29247 ) ( not ( = ?auto_29243 ?auto_29245 ) ) ( not ( = ?auto_29243 ?auto_29246 ) ) ( not ( = ?auto_29244 ?auto_29242 ) ) ( not ( = ?auto_29244 ?auto_29247 ) ) ( not ( = ?auto_29245 ?auto_29246 ) ) ( not ( = ?auto_29242 ?auto_29247 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29245 ?auto_29242 )
      ( GET-3IMAGE-VERIFY ?auto_29243 ?auto_29244 ?auto_29245 ?auto_29242 ?auto_29246 ?auto_29247 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29259 - DIRECTION
      ?auto_29260 - MODE
      ?auto_29261 - DIRECTION
      ?auto_29258 - MODE
      ?auto_29262 - DIRECTION
      ?auto_29263 - MODE
    )
    :vars
    (
      ?auto_29265 - INSTRUMENT
      ?auto_29264 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_29265 ) ( ON_BOARD ?auto_29265 ?auto_29264 ) ( SUPPORTS ?auto_29265 ?auto_29260 ) ( POWER_ON ?auto_29265 ) ( POINTING ?auto_29264 ?auto_29259 ) ( HAVE_IMAGE ?auto_29261 ?auto_29258 ) ( HAVE_IMAGE ?auto_29262 ?auto_29263 ) ( not ( = ?auto_29259 ?auto_29261 ) ) ( not ( = ?auto_29259 ?auto_29262 ) ) ( not ( = ?auto_29260 ?auto_29258 ) ) ( not ( = ?auto_29260 ?auto_29263 ) ) ( not ( = ?auto_29261 ?auto_29262 ) ) ( not ( = ?auto_29258 ?auto_29263 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29259 ?auto_29260 )
      ( GET-3IMAGE-VERIFY ?auto_29259 ?auto_29260 ?auto_29261 ?auto_29258 ?auto_29262 ?auto_29263 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29291 - DIRECTION
      ?auto_29292 - MODE
      ?auto_29293 - DIRECTION
      ?auto_29290 - MODE
      ?auto_29294 - DIRECTION
      ?auto_29295 - MODE
      ?auto_29296 - DIRECTION
      ?auto_29297 - MODE
    )
    :vars
    (
      ?auto_29299 - INSTRUMENT
      ?auto_29298 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_29299 ) ( ON_BOARD ?auto_29299 ?auto_29298 ) ( SUPPORTS ?auto_29299 ?auto_29297 ) ( POWER_ON ?auto_29299 ) ( POINTING ?auto_29298 ?auto_29296 ) ( HAVE_IMAGE ?auto_29291 ?auto_29292 ) ( HAVE_IMAGE ?auto_29293 ?auto_29290 ) ( HAVE_IMAGE ?auto_29294 ?auto_29295 ) ( not ( = ?auto_29291 ?auto_29293 ) ) ( not ( = ?auto_29291 ?auto_29294 ) ) ( not ( = ?auto_29291 ?auto_29296 ) ) ( not ( = ?auto_29292 ?auto_29290 ) ) ( not ( = ?auto_29292 ?auto_29295 ) ) ( not ( = ?auto_29292 ?auto_29297 ) ) ( not ( = ?auto_29293 ?auto_29294 ) ) ( not ( = ?auto_29293 ?auto_29296 ) ) ( not ( = ?auto_29290 ?auto_29295 ) ) ( not ( = ?auto_29290 ?auto_29297 ) ) ( not ( = ?auto_29294 ?auto_29296 ) ) ( not ( = ?auto_29295 ?auto_29297 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29296 ?auto_29297 )
      ( GET-4IMAGE-VERIFY ?auto_29291 ?auto_29292 ?auto_29293 ?auto_29290 ?auto_29294 ?auto_29295 ?auto_29296 ?auto_29297 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29301 - DIRECTION
      ?auto_29302 - MODE
      ?auto_29303 - DIRECTION
      ?auto_29300 - MODE
      ?auto_29304 - DIRECTION
      ?auto_29305 - MODE
      ?auto_29306 - DIRECTION
      ?auto_29307 - MODE
    )
    :vars
    (
      ?auto_29309 - INSTRUMENT
      ?auto_29308 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_29309 ) ( ON_BOARD ?auto_29309 ?auto_29308 ) ( SUPPORTS ?auto_29309 ?auto_29305 ) ( POWER_ON ?auto_29309 ) ( POINTING ?auto_29308 ?auto_29304 ) ( HAVE_IMAGE ?auto_29301 ?auto_29302 ) ( HAVE_IMAGE ?auto_29303 ?auto_29300 ) ( HAVE_IMAGE ?auto_29306 ?auto_29307 ) ( not ( = ?auto_29301 ?auto_29303 ) ) ( not ( = ?auto_29301 ?auto_29304 ) ) ( not ( = ?auto_29301 ?auto_29306 ) ) ( not ( = ?auto_29302 ?auto_29300 ) ) ( not ( = ?auto_29302 ?auto_29305 ) ) ( not ( = ?auto_29302 ?auto_29307 ) ) ( not ( = ?auto_29303 ?auto_29304 ) ) ( not ( = ?auto_29303 ?auto_29306 ) ) ( not ( = ?auto_29300 ?auto_29305 ) ) ( not ( = ?auto_29300 ?auto_29307 ) ) ( not ( = ?auto_29304 ?auto_29306 ) ) ( not ( = ?auto_29305 ?auto_29307 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29304 ?auto_29305 )
      ( GET-4IMAGE-VERIFY ?auto_29301 ?auto_29302 ?auto_29303 ?auto_29300 ?auto_29304 ?auto_29305 ?auto_29306 ?auto_29307 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29321 - DIRECTION
      ?auto_29322 - MODE
      ?auto_29323 - DIRECTION
      ?auto_29320 - MODE
      ?auto_29324 - DIRECTION
      ?auto_29325 - MODE
      ?auto_29326 - DIRECTION
      ?auto_29327 - MODE
    )
    :vars
    (
      ?auto_29329 - INSTRUMENT
      ?auto_29328 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_29329 ) ( ON_BOARD ?auto_29329 ?auto_29328 ) ( SUPPORTS ?auto_29329 ?auto_29320 ) ( POWER_ON ?auto_29329 ) ( POINTING ?auto_29328 ?auto_29323 ) ( HAVE_IMAGE ?auto_29321 ?auto_29322 ) ( HAVE_IMAGE ?auto_29324 ?auto_29325 ) ( HAVE_IMAGE ?auto_29326 ?auto_29327 ) ( not ( = ?auto_29321 ?auto_29323 ) ) ( not ( = ?auto_29321 ?auto_29324 ) ) ( not ( = ?auto_29321 ?auto_29326 ) ) ( not ( = ?auto_29322 ?auto_29320 ) ) ( not ( = ?auto_29322 ?auto_29325 ) ) ( not ( = ?auto_29322 ?auto_29327 ) ) ( not ( = ?auto_29323 ?auto_29324 ) ) ( not ( = ?auto_29323 ?auto_29326 ) ) ( not ( = ?auto_29320 ?auto_29325 ) ) ( not ( = ?auto_29320 ?auto_29327 ) ) ( not ( = ?auto_29324 ?auto_29326 ) ) ( not ( = ?auto_29325 ?auto_29327 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29323 ?auto_29320 )
      ( GET-4IMAGE-VERIFY ?auto_29321 ?auto_29322 ?auto_29323 ?auto_29320 ?auto_29324 ?auto_29325 ?auto_29326 ?auto_29327 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29361 - DIRECTION
      ?auto_29362 - MODE
      ?auto_29363 - DIRECTION
      ?auto_29360 - MODE
      ?auto_29364 - DIRECTION
      ?auto_29365 - MODE
      ?auto_29366 - DIRECTION
      ?auto_29367 - MODE
    )
    :vars
    (
      ?auto_29369 - INSTRUMENT
      ?auto_29368 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_29369 ) ( ON_BOARD ?auto_29369 ?auto_29368 ) ( SUPPORTS ?auto_29369 ?auto_29362 ) ( POWER_ON ?auto_29369 ) ( POINTING ?auto_29368 ?auto_29361 ) ( HAVE_IMAGE ?auto_29363 ?auto_29360 ) ( HAVE_IMAGE ?auto_29364 ?auto_29365 ) ( HAVE_IMAGE ?auto_29366 ?auto_29367 ) ( not ( = ?auto_29361 ?auto_29363 ) ) ( not ( = ?auto_29361 ?auto_29364 ) ) ( not ( = ?auto_29361 ?auto_29366 ) ) ( not ( = ?auto_29362 ?auto_29360 ) ) ( not ( = ?auto_29362 ?auto_29365 ) ) ( not ( = ?auto_29362 ?auto_29367 ) ) ( not ( = ?auto_29363 ?auto_29364 ) ) ( not ( = ?auto_29363 ?auto_29366 ) ) ( not ( = ?auto_29360 ?auto_29365 ) ) ( not ( = ?auto_29360 ?auto_29367 ) ) ( not ( = ?auto_29364 ?auto_29366 ) ) ( not ( = ?auto_29365 ?auto_29367 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29361 ?auto_29362 )
      ( GET-4IMAGE-VERIFY ?auto_29361 ?auto_29362 ?auto_29363 ?auto_29360 ?auto_29364 ?auto_29365 ?auto_29366 ?auto_29367 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29446 - DIRECTION
      ?auto_29447 - MODE
      ?auto_29448 - DIRECTION
      ?auto_29445 - MODE
    )
    :vars
    (
      ?auto_29449 - INSTRUMENT
      ?auto_29451 - SATELLITE
      ?auto_29450 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_29449 ) ( ON_BOARD ?auto_29449 ?auto_29451 ) ( SUPPORTS ?auto_29449 ?auto_29445 ) ( POWER_ON ?auto_29449 ) ( POINTING ?auto_29451 ?auto_29450 ) ( not ( = ?auto_29448 ?auto_29450 ) ) ( HAVE_IMAGE ?auto_29446 ?auto_29447 ) ( not ( = ?auto_29446 ?auto_29448 ) ) ( not ( = ?auto_29446 ?auto_29450 ) ) ( not ( = ?auto_29447 ?auto_29445 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29448 ?auto_29445 )
      ( GET-2IMAGE-VERIFY ?auto_29446 ?auto_29447 ?auto_29448 ?auto_29445 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29453 - DIRECTION
      ?auto_29454 - MODE
      ?auto_29455 - DIRECTION
      ?auto_29452 - MODE
    )
    :vars
    (
      ?auto_29457 - INSTRUMENT
      ?auto_29456 - SATELLITE
      ?auto_29458 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_29457 ) ( ON_BOARD ?auto_29457 ?auto_29456 ) ( SUPPORTS ?auto_29457 ?auto_29454 ) ( POWER_ON ?auto_29457 ) ( POINTING ?auto_29456 ?auto_29458 ) ( not ( = ?auto_29453 ?auto_29458 ) ) ( HAVE_IMAGE ?auto_29455 ?auto_29452 ) ( not ( = ?auto_29455 ?auto_29453 ) ) ( not ( = ?auto_29455 ?auto_29458 ) ) ( not ( = ?auto_29452 ?auto_29454 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29455 ?auto_29452 ?auto_29453 ?auto_29454 )
      ( GET-2IMAGE-VERIFY ?auto_29453 ?auto_29454 ?auto_29455 ?auto_29452 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29469 - DIRECTION
      ?auto_29470 - MODE
      ?auto_29471 - DIRECTION
      ?auto_29468 - MODE
      ?auto_29472 - DIRECTION
      ?auto_29473 - MODE
    )
    :vars
    (
      ?auto_29475 - INSTRUMENT
      ?auto_29474 - SATELLITE
      ?auto_29476 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_29475 ) ( ON_BOARD ?auto_29475 ?auto_29474 ) ( SUPPORTS ?auto_29475 ?auto_29473 ) ( POWER_ON ?auto_29475 ) ( POINTING ?auto_29474 ?auto_29476 ) ( not ( = ?auto_29472 ?auto_29476 ) ) ( HAVE_IMAGE ?auto_29471 ?auto_29468 ) ( not ( = ?auto_29471 ?auto_29472 ) ) ( not ( = ?auto_29471 ?auto_29476 ) ) ( not ( = ?auto_29468 ?auto_29473 ) ) ( HAVE_IMAGE ?auto_29469 ?auto_29470 ) ( not ( = ?auto_29469 ?auto_29471 ) ) ( not ( = ?auto_29469 ?auto_29472 ) ) ( not ( = ?auto_29469 ?auto_29476 ) ) ( not ( = ?auto_29470 ?auto_29468 ) ) ( not ( = ?auto_29470 ?auto_29473 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29471 ?auto_29468 ?auto_29472 ?auto_29473 )
      ( GET-3IMAGE-VERIFY ?auto_29469 ?auto_29470 ?auto_29471 ?auto_29468 ?auto_29472 ?auto_29473 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29478 - DIRECTION
      ?auto_29479 - MODE
      ?auto_29480 - DIRECTION
      ?auto_29477 - MODE
      ?auto_29481 - DIRECTION
      ?auto_29482 - MODE
    )
    :vars
    (
      ?auto_29484 - INSTRUMENT
      ?auto_29483 - SATELLITE
      ?auto_29485 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_29484 ) ( ON_BOARD ?auto_29484 ?auto_29483 ) ( SUPPORTS ?auto_29484 ?auto_29477 ) ( POWER_ON ?auto_29484 ) ( POINTING ?auto_29483 ?auto_29485 ) ( not ( = ?auto_29480 ?auto_29485 ) ) ( HAVE_IMAGE ?auto_29481 ?auto_29482 ) ( not ( = ?auto_29481 ?auto_29480 ) ) ( not ( = ?auto_29481 ?auto_29485 ) ) ( not ( = ?auto_29482 ?auto_29477 ) ) ( HAVE_IMAGE ?auto_29478 ?auto_29479 ) ( not ( = ?auto_29478 ?auto_29480 ) ) ( not ( = ?auto_29478 ?auto_29481 ) ) ( not ( = ?auto_29478 ?auto_29485 ) ) ( not ( = ?auto_29479 ?auto_29477 ) ) ( not ( = ?auto_29479 ?auto_29482 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29481 ?auto_29482 ?auto_29480 ?auto_29477 )
      ( GET-3IMAGE-VERIFY ?auto_29478 ?auto_29479 ?auto_29480 ?auto_29477 ?auto_29481 ?auto_29482 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29496 - DIRECTION
      ?auto_29497 - MODE
      ?auto_29498 - DIRECTION
      ?auto_29495 - MODE
      ?auto_29499 - DIRECTION
      ?auto_29500 - MODE
    )
    :vars
    (
      ?auto_29502 - INSTRUMENT
      ?auto_29501 - SATELLITE
      ?auto_29503 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_29502 ) ( ON_BOARD ?auto_29502 ?auto_29501 ) ( SUPPORTS ?auto_29502 ?auto_29497 ) ( POWER_ON ?auto_29502 ) ( POINTING ?auto_29501 ?auto_29503 ) ( not ( = ?auto_29496 ?auto_29503 ) ) ( HAVE_IMAGE ?auto_29498 ?auto_29500 ) ( not ( = ?auto_29498 ?auto_29496 ) ) ( not ( = ?auto_29498 ?auto_29503 ) ) ( not ( = ?auto_29500 ?auto_29497 ) ) ( HAVE_IMAGE ?auto_29498 ?auto_29495 ) ( HAVE_IMAGE ?auto_29499 ?auto_29500 ) ( not ( = ?auto_29496 ?auto_29499 ) ) ( not ( = ?auto_29497 ?auto_29495 ) ) ( not ( = ?auto_29498 ?auto_29499 ) ) ( not ( = ?auto_29495 ?auto_29500 ) ) ( not ( = ?auto_29499 ?auto_29503 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29498 ?auto_29500 ?auto_29496 ?auto_29497 )
      ( GET-3IMAGE-VERIFY ?auto_29496 ?auto_29497 ?auto_29498 ?auto_29495 ?auto_29499 ?auto_29500 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29534 - DIRECTION
      ?auto_29535 - MODE
      ?auto_29536 - DIRECTION
      ?auto_29533 - MODE
      ?auto_29537 - DIRECTION
      ?auto_29538 - MODE
      ?auto_29539 - DIRECTION
      ?auto_29540 - MODE
    )
    :vars
    (
      ?auto_29542 - INSTRUMENT
      ?auto_29541 - SATELLITE
      ?auto_29543 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_29542 ) ( ON_BOARD ?auto_29542 ?auto_29541 ) ( SUPPORTS ?auto_29542 ?auto_29540 ) ( POWER_ON ?auto_29542 ) ( POINTING ?auto_29541 ?auto_29543 ) ( not ( = ?auto_29539 ?auto_29543 ) ) ( HAVE_IMAGE ?auto_29537 ?auto_29538 ) ( not ( = ?auto_29537 ?auto_29539 ) ) ( not ( = ?auto_29537 ?auto_29543 ) ) ( not ( = ?auto_29538 ?auto_29540 ) ) ( HAVE_IMAGE ?auto_29534 ?auto_29535 ) ( HAVE_IMAGE ?auto_29536 ?auto_29533 ) ( not ( = ?auto_29534 ?auto_29536 ) ) ( not ( = ?auto_29534 ?auto_29537 ) ) ( not ( = ?auto_29534 ?auto_29539 ) ) ( not ( = ?auto_29534 ?auto_29543 ) ) ( not ( = ?auto_29535 ?auto_29533 ) ) ( not ( = ?auto_29535 ?auto_29538 ) ) ( not ( = ?auto_29535 ?auto_29540 ) ) ( not ( = ?auto_29536 ?auto_29537 ) ) ( not ( = ?auto_29536 ?auto_29539 ) ) ( not ( = ?auto_29536 ?auto_29543 ) ) ( not ( = ?auto_29533 ?auto_29538 ) ) ( not ( = ?auto_29533 ?auto_29540 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29537 ?auto_29538 ?auto_29539 ?auto_29540 )
      ( GET-4IMAGE-VERIFY ?auto_29534 ?auto_29535 ?auto_29536 ?auto_29533 ?auto_29537 ?auto_29538 ?auto_29539 ?auto_29540 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29545 - DIRECTION
      ?auto_29546 - MODE
      ?auto_29547 - DIRECTION
      ?auto_29544 - MODE
      ?auto_29548 - DIRECTION
      ?auto_29549 - MODE
      ?auto_29550 - DIRECTION
      ?auto_29551 - MODE
    )
    :vars
    (
      ?auto_29553 - INSTRUMENT
      ?auto_29552 - SATELLITE
      ?auto_29554 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_29553 ) ( ON_BOARD ?auto_29553 ?auto_29552 ) ( SUPPORTS ?auto_29553 ?auto_29549 ) ( POWER_ON ?auto_29553 ) ( POINTING ?auto_29552 ?auto_29554 ) ( not ( = ?auto_29548 ?auto_29554 ) ) ( HAVE_IMAGE ?auto_29550 ?auto_29551 ) ( not ( = ?auto_29550 ?auto_29548 ) ) ( not ( = ?auto_29550 ?auto_29554 ) ) ( not ( = ?auto_29551 ?auto_29549 ) ) ( HAVE_IMAGE ?auto_29545 ?auto_29546 ) ( HAVE_IMAGE ?auto_29547 ?auto_29544 ) ( not ( = ?auto_29545 ?auto_29547 ) ) ( not ( = ?auto_29545 ?auto_29548 ) ) ( not ( = ?auto_29545 ?auto_29550 ) ) ( not ( = ?auto_29545 ?auto_29554 ) ) ( not ( = ?auto_29546 ?auto_29544 ) ) ( not ( = ?auto_29546 ?auto_29549 ) ) ( not ( = ?auto_29546 ?auto_29551 ) ) ( not ( = ?auto_29547 ?auto_29548 ) ) ( not ( = ?auto_29547 ?auto_29550 ) ) ( not ( = ?auto_29547 ?auto_29554 ) ) ( not ( = ?auto_29544 ?auto_29549 ) ) ( not ( = ?auto_29544 ?auto_29551 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29550 ?auto_29551 ?auto_29548 ?auto_29549 )
      ( GET-4IMAGE-VERIFY ?auto_29545 ?auto_29546 ?auto_29547 ?auto_29544 ?auto_29548 ?auto_29549 ?auto_29550 ?auto_29551 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29567 - DIRECTION
      ?auto_29568 - MODE
      ?auto_29569 - DIRECTION
      ?auto_29566 - MODE
      ?auto_29570 - DIRECTION
      ?auto_29571 - MODE
      ?auto_29572 - DIRECTION
      ?auto_29573 - MODE
    )
    :vars
    (
      ?auto_29575 - INSTRUMENT
      ?auto_29574 - SATELLITE
      ?auto_29576 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_29575 ) ( ON_BOARD ?auto_29575 ?auto_29574 ) ( SUPPORTS ?auto_29575 ?auto_29566 ) ( POWER_ON ?auto_29575 ) ( POINTING ?auto_29574 ?auto_29576 ) ( not ( = ?auto_29569 ?auto_29576 ) ) ( HAVE_IMAGE ?auto_29570 ?auto_29573 ) ( not ( = ?auto_29570 ?auto_29569 ) ) ( not ( = ?auto_29570 ?auto_29576 ) ) ( not ( = ?auto_29573 ?auto_29566 ) ) ( HAVE_IMAGE ?auto_29567 ?auto_29568 ) ( HAVE_IMAGE ?auto_29570 ?auto_29571 ) ( HAVE_IMAGE ?auto_29572 ?auto_29573 ) ( not ( = ?auto_29567 ?auto_29569 ) ) ( not ( = ?auto_29567 ?auto_29570 ) ) ( not ( = ?auto_29567 ?auto_29572 ) ) ( not ( = ?auto_29567 ?auto_29576 ) ) ( not ( = ?auto_29568 ?auto_29566 ) ) ( not ( = ?auto_29568 ?auto_29571 ) ) ( not ( = ?auto_29568 ?auto_29573 ) ) ( not ( = ?auto_29569 ?auto_29572 ) ) ( not ( = ?auto_29566 ?auto_29571 ) ) ( not ( = ?auto_29570 ?auto_29572 ) ) ( not ( = ?auto_29571 ?auto_29573 ) ) ( not ( = ?auto_29572 ?auto_29576 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29570 ?auto_29573 ?auto_29569 ?auto_29566 )
      ( GET-4IMAGE-VERIFY ?auto_29567 ?auto_29568 ?auto_29569 ?auto_29566 ?auto_29570 ?auto_29571 ?auto_29572 ?auto_29573 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29611 - DIRECTION
      ?auto_29612 - MODE
      ?auto_29613 - DIRECTION
      ?auto_29610 - MODE
      ?auto_29614 - DIRECTION
      ?auto_29615 - MODE
      ?auto_29616 - DIRECTION
      ?auto_29617 - MODE
    )
    :vars
    (
      ?auto_29619 - INSTRUMENT
      ?auto_29618 - SATELLITE
      ?auto_29620 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_29619 ) ( ON_BOARD ?auto_29619 ?auto_29618 ) ( SUPPORTS ?auto_29619 ?auto_29612 ) ( POWER_ON ?auto_29619 ) ( POINTING ?auto_29618 ?auto_29620 ) ( not ( = ?auto_29611 ?auto_29620 ) ) ( HAVE_IMAGE ?auto_29613 ?auto_29610 ) ( not ( = ?auto_29613 ?auto_29611 ) ) ( not ( = ?auto_29613 ?auto_29620 ) ) ( not ( = ?auto_29610 ?auto_29612 ) ) ( HAVE_IMAGE ?auto_29614 ?auto_29615 ) ( HAVE_IMAGE ?auto_29616 ?auto_29617 ) ( not ( = ?auto_29611 ?auto_29614 ) ) ( not ( = ?auto_29611 ?auto_29616 ) ) ( not ( = ?auto_29612 ?auto_29615 ) ) ( not ( = ?auto_29612 ?auto_29617 ) ) ( not ( = ?auto_29613 ?auto_29614 ) ) ( not ( = ?auto_29613 ?auto_29616 ) ) ( not ( = ?auto_29610 ?auto_29615 ) ) ( not ( = ?auto_29610 ?auto_29617 ) ) ( not ( = ?auto_29614 ?auto_29616 ) ) ( not ( = ?auto_29614 ?auto_29620 ) ) ( not ( = ?auto_29615 ?auto_29617 ) ) ( not ( = ?auto_29616 ?auto_29620 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29613 ?auto_29610 ?auto_29611 ?auto_29612 )
      ( GET-4IMAGE-VERIFY ?auto_29611 ?auto_29612 ?auto_29613 ?auto_29610 ?auto_29614 ?auto_29615 ?auto_29616 ?auto_29617 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_29700 - DIRECTION
      ?auto_29701 - MODE
    )
    :vars
    (
      ?auto_29704 - INSTRUMENT
      ?auto_29703 - SATELLITE
      ?auto_29706 - DIRECTION
      ?auto_29702 - DIRECTION
      ?auto_29705 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29704 ?auto_29703 ) ( SUPPORTS ?auto_29704 ?auto_29701 ) ( POWER_ON ?auto_29704 ) ( POINTING ?auto_29703 ?auto_29706 ) ( not ( = ?auto_29700 ?auto_29706 ) ) ( HAVE_IMAGE ?auto_29702 ?auto_29705 ) ( not ( = ?auto_29702 ?auto_29700 ) ) ( not ( = ?auto_29702 ?auto_29706 ) ) ( not ( = ?auto_29705 ?auto_29701 ) ) ( CALIBRATION_TARGET ?auto_29704 ?auto_29706 ) ( NOT_CALIBRATED ?auto_29704 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_29703 ?auto_29704 ?auto_29706 )
      ( GET-2IMAGE ?auto_29702 ?auto_29705 ?auto_29700 ?auto_29701 )
      ( GET-1IMAGE-VERIFY ?auto_29700 ?auto_29701 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29708 - DIRECTION
      ?auto_29709 - MODE
      ?auto_29710 - DIRECTION
      ?auto_29707 - MODE
    )
    :vars
    (
      ?auto_29711 - INSTRUMENT
      ?auto_29713 - SATELLITE
      ?auto_29712 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29711 ?auto_29713 ) ( SUPPORTS ?auto_29711 ?auto_29707 ) ( POWER_ON ?auto_29711 ) ( POINTING ?auto_29713 ?auto_29712 ) ( not ( = ?auto_29710 ?auto_29712 ) ) ( HAVE_IMAGE ?auto_29708 ?auto_29709 ) ( not ( = ?auto_29708 ?auto_29710 ) ) ( not ( = ?auto_29708 ?auto_29712 ) ) ( not ( = ?auto_29709 ?auto_29707 ) ) ( CALIBRATION_TARGET ?auto_29711 ?auto_29712 ) ( NOT_CALIBRATED ?auto_29711 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29710 ?auto_29707 )
      ( GET-2IMAGE-VERIFY ?auto_29708 ?auto_29709 ?auto_29710 ?auto_29707 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29715 - DIRECTION
      ?auto_29716 - MODE
      ?auto_29717 - DIRECTION
      ?auto_29714 - MODE
    )
    :vars
    (
      ?auto_29719 - INSTRUMENT
      ?auto_29720 - SATELLITE
      ?auto_29718 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29719 ?auto_29720 ) ( SUPPORTS ?auto_29719 ?auto_29716 ) ( POWER_ON ?auto_29719 ) ( POINTING ?auto_29720 ?auto_29718 ) ( not ( = ?auto_29715 ?auto_29718 ) ) ( HAVE_IMAGE ?auto_29717 ?auto_29714 ) ( not ( = ?auto_29717 ?auto_29715 ) ) ( not ( = ?auto_29717 ?auto_29718 ) ) ( not ( = ?auto_29714 ?auto_29716 ) ) ( CALIBRATION_TARGET ?auto_29719 ?auto_29718 ) ( NOT_CALIBRATED ?auto_29719 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29717 ?auto_29714 ?auto_29715 ?auto_29716 )
      ( GET-2IMAGE-VERIFY ?auto_29715 ?auto_29716 ?auto_29717 ?auto_29714 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29731 - DIRECTION
      ?auto_29732 - MODE
      ?auto_29733 - DIRECTION
      ?auto_29730 - MODE
      ?auto_29734 - DIRECTION
      ?auto_29735 - MODE
    )
    :vars
    (
      ?auto_29737 - INSTRUMENT
      ?auto_29738 - SATELLITE
      ?auto_29736 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29737 ?auto_29738 ) ( SUPPORTS ?auto_29737 ?auto_29735 ) ( POWER_ON ?auto_29737 ) ( POINTING ?auto_29738 ?auto_29736 ) ( not ( = ?auto_29734 ?auto_29736 ) ) ( HAVE_IMAGE ?auto_29733 ?auto_29730 ) ( not ( = ?auto_29733 ?auto_29734 ) ) ( not ( = ?auto_29733 ?auto_29736 ) ) ( not ( = ?auto_29730 ?auto_29735 ) ) ( CALIBRATION_TARGET ?auto_29737 ?auto_29736 ) ( NOT_CALIBRATED ?auto_29737 ) ( HAVE_IMAGE ?auto_29731 ?auto_29732 ) ( not ( = ?auto_29731 ?auto_29733 ) ) ( not ( = ?auto_29731 ?auto_29734 ) ) ( not ( = ?auto_29731 ?auto_29736 ) ) ( not ( = ?auto_29732 ?auto_29730 ) ) ( not ( = ?auto_29732 ?auto_29735 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29733 ?auto_29730 ?auto_29734 ?auto_29735 )
      ( GET-3IMAGE-VERIFY ?auto_29731 ?auto_29732 ?auto_29733 ?auto_29730 ?auto_29734 ?auto_29735 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29740 - DIRECTION
      ?auto_29741 - MODE
      ?auto_29742 - DIRECTION
      ?auto_29739 - MODE
      ?auto_29743 - DIRECTION
      ?auto_29744 - MODE
    )
    :vars
    (
      ?auto_29746 - INSTRUMENT
      ?auto_29747 - SATELLITE
      ?auto_29745 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29746 ?auto_29747 ) ( SUPPORTS ?auto_29746 ?auto_29739 ) ( POWER_ON ?auto_29746 ) ( POINTING ?auto_29747 ?auto_29745 ) ( not ( = ?auto_29742 ?auto_29745 ) ) ( HAVE_IMAGE ?auto_29743 ?auto_29744 ) ( not ( = ?auto_29743 ?auto_29742 ) ) ( not ( = ?auto_29743 ?auto_29745 ) ) ( not ( = ?auto_29744 ?auto_29739 ) ) ( CALIBRATION_TARGET ?auto_29746 ?auto_29745 ) ( NOT_CALIBRATED ?auto_29746 ) ( HAVE_IMAGE ?auto_29740 ?auto_29741 ) ( not ( = ?auto_29740 ?auto_29742 ) ) ( not ( = ?auto_29740 ?auto_29743 ) ) ( not ( = ?auto_29740 ?auto_29745 ) ) ( not ( = ?auto_29741 ?auto_29739 ) ) ( not ( = ?auto_29741 ?auto_29744 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29743 ?auto_29744 ?auto_29742 ?auto_29739 )
      ( GET-3IMAGE-VERIFY ?auto_29740 ?auto_29741 ?auto_29742 ?auto_29739 ?auto_29743 ?auto_29744 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29758 - DIRECTION
      ?auto_29759 - MODE
      ?auto_29760 - DIRECTION
      ?auto_29757 - MODE
      ?auto_29761 - DIRECTION
      ?auto_29762 - MODE
    )
    :vars
    (
      ?auto_29764 - INSTRUMENT
      ?auto_29765 - SATELLITE
      ?auto_29763 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29764 ?auto_29765 ) ( SUPPORTS ?auto_29764 ?auto_29759 ) ( POWER_ON ?auto_29764 ) ( POINTING ?auto_29765 ?auto_29763 ) ( not ( = ?auto_29758 ?auto_29763 ) ) ( HAVE_IMAGE ?auto_29761 ?auto_29757 ) ( not ( = ?auto_29761 ?auto_29758 ) ) ( not ( = ?auto_29761 ?auto_29763 ) ) ( not ( = ?auto_29757 ?auto_29759 ) ) ( CALIBRATION_TARGET ?auto_29764 ?auto_29763 ) ( NOT_CALIBRATED ?auto_29764 ) ( HAVE_IMAGE ?auto_29760 ?auto_29757 ) ( HAVE_IMAGE ?auto_29761 ?auto_29762 ) ( not ( = ?auto_29758 ?auto_29760 ) ) ( not ( = ?auto_29759 ?auto_29762 ) ) ( not ( = ?auto_29760 ?auto_29761 ) ) ( not ( = ?auto_29760 ?auto_29763 ) ) ( not ( = ?auto_29757 ?auto_29762 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29761 ?auto_29757 ?auto_29758 ?auto_29759 )
      ( GET-3IMAGE-VERIFY ?auto_29758 ?auto_29759 ?auto_29760 ?auto_29757 ?auto_29761 ?auto_29762 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29796 - DIRECTION
      ?auto_29797 - MODE
      ?auto_29798 - DIRECTION
      ?auto_29795 - MODE
      ?auto_29799 - DIRECTION
      ?auto_29800 - MODE
      ?auto_29801 - DIRECTION
      ?auto_29802 - MODE
    )
    :vars
    (
      ?auto_29804 - INSTRUMENT
      ?auto_29805 - SATELLITE
      ?auto_29803 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29804 ?auto_29805 ) ( SUPPORTS ?auto_29804 ?auto_29802 ) ( POWER_ON ?auto_29804 ) ( POINTING ?auto_29805 ?auto_29803 ) ( not ( = ?auto_29801 ?auto_29803 ) ) ( HAVE_IMAGE ?auto_29799 ?auto_29797 ) ( not ( = ?auto_29799 ?auto_29801 ) ) ( not ( = ?auto_29799 ?auto_29803 ) ) ( not ( = ?auto_29797 ?auto_29802 ) ) ( CALIBRATION_TARGET ?auto_29804 ?auto_29803 ) ( NOT_CALIBRATED ?auto_29804 ) ( HAVE_IMAGE ?auto_29796 ?auto_29797 ) ( HAVE_IMAGE ?auto_29798 ?auto_29795 ) ( HAVE_IMAGE ?auto_29799 ?auto_29800 ) ( not ( = ?auto_29796 ?auto_29798 ) ) ( not ( = ?auto_29796 ?auto_29799 ) ) ( not ( = ?auto_29796 ?auto_29801 ) ) ( not ( = ?auto_29796 ?auto_29803 ) ) ( not ( = ?auto_29797 ?auto_29795 ) ) ( not ( = ?auto_29797 ?auto_29800 ) ) ( not ( = ?auto_29798 ?auto_29799 ) ) ( not ( = ?auto_29798 ?auto_29801 ) ) ( not ( = ?auto_29798 ?auto_29803 ) ) ( not ( = ?auto_29795 ?auto_29800 ) ) ( not ( = ?auto_29795 ?auto_29802 ) ) ( not ( = ?auto_29800 ?auto_29802 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29799 ?auto_29797 ?auto_29801 ?auto_29802 )
      ( GET-4IMAGE-VERIFY ?auto_29796 ?auto_29797 ?auto_29798 ?auto_29795 ?auto_29799 ?auto_29800 ?auto_29801 ?auto_29802 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29807 - DIRECTION
      ?auto_29808 - MODE
      ?auto_29809 - DIRECTION
      ?auto_29806 - MODE
      ?auto_29810 - DIRECTION
      ?auto_29811 - MODE
      ?auto_29812 - DIRECTION
      ?auto_29813 - MODE
    )
    :vars
    (
      ?auto_29815 - INSTRUMENT
      ?auto_29816 - SATELLITE
      ?auto_29814 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29815 ?auto_29816 ) ( SUPPORTS ?auto_29815 ?auto_29811 ) ( POWER_ON ?auto_29815 ) ( POINTING ?auto_29816 ?auto_29814 ) ( not ( = ?auto_29810 ?auto_29814 ) ) ( HAVE_IMAGE ?auto_29812 ?auto_29808 ) ( not ( = ?auto_29812 ?auto_29810 ) ) ( not ( = ?auto_29812 ?auto_29814 ) ) ( not ( = ?auto_29808 ?auto_29811 ) ) ( CALIBRATION_TARGET ?auto_29815 ?auto_29814 ) ( NOT_CALIBRATED ?auto_29815 ) ( HAVE_IMAGE ?auto_29807 ?auto_29808 ) ( HAVE_IMAGE ?auto_29809 ?auto_29806 ) ( HAVE_IMAGE ?auto_29812 ?auto_29813 ) ( not ( = ?auto_29807 ?auto_29809 ) ) ( not ( = ?auto_29807 ?auto_29810 ) ) ( not ( = ?auto_29807 ?auto_29812 ) ) ( not ( = ?auto_29807 ?auto_29814 ) ) ( not ( = ?auto_29808 ?auto_29806 ) ) ( not ( = ?auto_29808 ?auto_29813 ) ) ( not ( = ?auto_29809 ?auto_29810 ) ) ( not ( = ?auto_29809 ?auto_29812 ) ) ( not ( = ?auto_29809 ?auto_29814 ) ) ( not ( = ?auto_29806 ?auto_29811 ) ) ( not ( = ?auto_29806 ?auto_29813 ) ) ( not ( = ?auto_29811 ?auto_29813 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29812 ?auto_29808 ?auto_29810 ?auto_29811 )
      ( GET-4IMAGE-VERIFY ?auto_29807 ?auto_29808 ?auto_29809 ?auto_29806 ?auto_29810 ?auto_29811 ?auto_29812 ?auto_29813 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29829 - DIRECTION
      ?auto_29830 - MODE
      ?auto_29831 - DIRECTION
      ?auto_29828 - MODE
      ?auto_29832 - DIRECTION
      ?auto_29833 - MODE
      ?auto_29834 - DIRECTION
      ?auto_29835 - MODE
    )
    :vars
    (
      ?auto_29837 - INSTRUMENT
      ?auto_29838 - SATELLITE
      ?auto_29836 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29837 ?auto_29838 ) ( SUPPORTS ?auto_29837 ?auto_29828 ) ( POWER_ON ?auto_29837 ) ( POINTING ?auto_29838 ?auto_29836 ) ( not ( = ?auto_29831 ?auto_29836 ) ) ( HAVE_IMAGE ?auto_29829 ?auto_29835 ) ( not ( = ?auto_29829 ?auto_29831 ) ) ( not ( = ?auto_29829 ?auto_29836 ) ) ( not ( = ?auto_29835 ?auto_29828 ) ) ( CALIBRATION_TARGET ?auto_29837 ?auto_29836 ) ( NOT_CALIBRATED ?auto_29837 ) ( HAVE_IMAGE ?auto_29829 ?auto_29830 ) ( HAVE_IMAGE ?auto_29832 ?auto_29833 ) ( HAVE_IMAGE ?auto_29834 ?auto_29835 ) ( not ( = ?auto_29829 ?auto_29832 ) ) ( not ( = ?auto_29829 ?auto_29834 ) ) ( not ( = ?auto_29830 ?auto_29828 ) ) ( not ( = ?auto_29830 ?auto_29833 ) ) ( not ( = ?auto_29830 ?auto_29835 ) ) ( not ( = ?auto_29831 ?auto_29832 ) ) ( not ( = ?auto_29831 ?auto_29834 ) ) ( not ( = ?auto_29828 ?auto_29833 ) ) ( not ( = ?auto_29832 ?auto_29834 ) ) ( not ( = ?auto_29832 ?auto_29836 ) ) ( not ( = ?auto_29833 ?auto_29835 ) ) ( not ( = ?auto_29834 ?auto_29836 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29829 ?auto_29835 ?auto_29831 ?auto_29828 )
      ( GET-4IMAGE-VERIFY ?auto_29829 ?auto_29830 ?auto_29831 ?auto_29828 ?auto_29832 ?auto_29833 ?auto_29834 ?auto_29835 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29873 - DIRECTION
      ?auto_29874 - MODE
      ?auto_29875 - DIRECTION
      ?auto_29872 - MODE
      ?auto_29876 - DIRECTION
      ?auto_29877 - MODE
      ?auto_29878 - DIRECTION
      ?auto_29879 - MODE
    )
    :vars
    (
      ?auto_29881 - INSTRUMENT
      ?auto_29882 - SATELLITE
      ?auto_29880 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29881 ?auto_29882 ) ( SUPPORTS ?auto_29881 ?auto_29874 ) ( POWER_ON ?auto_29881 ) ( POINTING ?auto_29882 ?auto_29880 ) ( not ( = ?auto_29873 ?auto_29880 ) ) ( HAVE_IMAGE ?auto_29875 ?auto_29879 ) ( not ( = ?auto_29875 ?auto_29873 ) ) ( not ( = ?auto_29875 ?auto_29880 ) ) ( not ( = ?auto_29879 ?auto_29874 ) ) ( CALIBRATION_TARGET ?auto_29881 ?auto_29880 ) ( NOT_CALIBRATED ?auto_29881 ) ( HAVE_IMAGE ?auto_29875 ?auto_29872 ) ( HAVE_IMAGE ?auto_29876 ?auto_29877 ) ( HAVE_IMAGE ?auto_29878 ?auto_29879 ) ( not ( = ?auto_29873 ?auto_29876 ) ) ( not ( = ?auto_29873 ?auto_29878 ) ) ( not ( = ?auto_29874 ?auto_29872 ) ) ( not ( = ?auto_29874 ?auto_29877 ) ) ( not ( = ?auto_29875 ?auto_29876 ) ) ( not ( = ?auto_29875 ?auto_29878 ) ) ( not ( = ?auto_29872 ?auto_29877 ) ) ( not ( = ?auto_29872 ?auto_29879 ) ) ( not ( = ?auto_29876 ?auto_29878 ) ) ( not ( = ?auto_29876 ?auto_29880 ) ) ( not ( = ?auto_29877 ?auto_29879 ) ) ( not ( = ?auto_29878 ?auto_29880 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29875 ?auto_29879 ?auto_29873 ?auto_29874 )
      ( GET-4IMAGE-VERIFY ?auto_29873 ?auto_29874 ?auto_29875 ?auto_29872 ?auto_29876 ?auto_29877 ?auto_29878 ?auto_29879 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_29962 - DIRECTION
      ?auto_29963 - MODE
    )
    :vars
    (
      ?auto_29967 - INSTRUMENT
      ?auto_29968 - SATELLITE
      ?auto_29966 - DIRECTION
      ?auto_29965 - DIRECTION
      ?auto_29964 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_29967 ?auto_29968 ) ( SUPPORTS ?auto_29967 ?auto_29963 ) ( POINTING ?auto_29968 ?auto_29966 ) ( not ( = ?auto_29962 ?auto_29966 ) ) ( HAVE_IMAGE ?auto_29965 ?auto_29964 ) ( not ( = ?auto_29965 ?auto_29962 ) ) ( not ( = ?auto_29965 ?auto_29966 ) ) ( not ( = ?auto_29964 ?auto_29963 ) ) ( CALIBRATION_TARGET ?auto_29967 ?auto_29966 ) ( POWER_AVAIL ?auto_29968 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_29967 ?auto_29968 )
      ( GET-2IMAGE ?auto_29965 ?auto_29964 ?auto_29962 ?auto_29963 )
      ( GET-1IMAGE-VERIFY ?auto_29962 ?auto_29963 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29970 - DIRECTION
      ?auto_29971 - MODE
      ?auto_29972 - DIRECTION
      ?auto_29969 - MODE
    )
    :vars
    (
      ?auto_29975 - INSTRUMENT
      ?auto_29973 - SATELLITE
      ?auto_29974 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29975 ?auto_29973 ) ( SUPPORTS ?auto_29975 ?auto_29969 ) ( POINTING ?auto_29973 ?auto_29974 ) ( not ( = ?auto_29972 ?auto_29974 ) ) ( HAVE_IMAGE ?auto_29970 ?auto_29971 ) ( not ( = ?auto_29970 ?auto_29972 ) ) ( not ( = ?auto_29970 ?auto_29974 ) ) ( not ( = ?auto_29971 ?auto_29969 ) ) ( CALIBRATION_TARGET ?auto_29975 ?auto_29974 ) ( POWER_AVAIL ?auto_29973 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29972 ?auto_29969 )
      ( GET-2IMAGE-VERIFY ?auto_29970 ?auto_29971 ?auto_29972 ?auto_29969 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29977 - DIRECTION
      ?auto_29978 - MODE
      ?auto_29979 - DIRECTION
      ?auto_29976 - MODE
    )
    :vars
    (
      ?auto_29982 - INSTRUMENT
      ?auto_29981 - SATELLITE
      ?auto_29980 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29982 ?auto_29981 ) ( SUPPORTS ?auto_29982 ?auto_29978 ) ( POINTING ?auto_29981 ?auto_29980 ) ( not ( = ?auto_29977 ?auto_29980 ) ) ( HAVE_IMAGE ?auto_29979 ?auto_29976 ) ( not ( = ?auto_29979 ?auto_29977 ) ) ( not ( = ?auto_29979 ?auto_29980 ) ) ( not ( = ?auto_29976 ?auto_29978 ) ) ( CALIBRATION_TARGET ?auto_29982 ?auto_29980 ) ( POWER_AVAIL ?auto_29981 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29979 ?auto_29976 ?auto_29977 ?auto_29978 )
      ( GET-2IMAGE-VERIFY ?auto_29977 ?auto_29978 ?auto_29979 ?auto_29976 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_29993 - DIRECTION
      ?auto_29994 - MODE
      ?auto_29995 - DIRECTION
      ?auto_29992 - MODE
      ?auto_29996 - DIRECTION
      ?auto_29997 - MODE
    )
    :vars
    (
      ?auto_30000 - INSTRUMENT
      ?auto_29999 - SATELLITE
      ?auto_29998 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30000 ?auto_29999 ) ( SUPPORTS ?auto_30000 ?auto_29997 ) ( POINTING ?auto_29999 ?auto_29998 ) ( not ( = ?auto_29996 ?auto_29998 ) ) ( HAVE_IMAGE ?auto_29993 ?auto_29994 ) ( not ( = ?auto_29993 ?auto_29996 ) ) ( not ( = ?auto_29993 ?auto_29998 ) ) ( not ( = ?auto_29994 ?auto_29997 ) ) ( CALIBRATION_TARGET ?auto_30000 ?auto_29998 ) ( POWER_AVAIL ?auto_29999 ) ( HAVE_IMAGE ?auto_29995 ?auto_29992 ) ( not ( = ?auto_29993 ?auto_29995 ) ) ( not ( = ?auto_29994 ?auto_29992 ) ) ( not ( = ?auto_29995 ?auto_29996 ) ) ( not ( = ?auto_29995 ?auto_29998 ) ) ( not ( = ?auto_29992 ?auto_29997 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29993 ?auto_29994 ?auto_29996 ?auto_29997 )
      ( GET-3IMAGE-VERIFY ?auto_29993 ?auto_29994 ?auto_29995 ?auto_29992 ?auto_29996 ?auto_29997 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30002 - DIRECTION
      ?auto_30003 - MODE
      ?auto_30004 - DIRECTION
      ?auto_30001 - MODE
      ?auto_30005 - DIRECTION
      ?auto_30006 - MODE
    )
    :vars
    (
      ?auto_30009 - INSTRUMENT
      ?auto_30008 - SATELLITE
      ?auto_30007 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30009 ?auto_30008 ) ( SUPPORTS ?auto_30009 ?auto_30001 ) ( POINTING ?auto_30008 ?auto_30007 ) ( not ( = ?auto_30004 ?auto_30007 ) ) ( HAVE_IMAGE ?auto_30005 ?auto_30003 ) ( not ( = ?auto_30005 ?auto_30004 ) ) ( not ( = ?auto_30005 ?auto_30007 ) ) ( not ( = ?auto_30003 ?auto_30001 ) ) ( CALIBRATION_TARGET ?auto_30009 ?auto_30007 ) ( POWER_AVAIL ?auto_30008 ) ( HAVE_IMAGE ?auto_30002 ?auto_30003 ) ( HAVE_IMAGE ?auto_30005 ?auto_30006 ) ( not ( = ?auto_30002 ?auto_30004 ) ) ( not ( = ?auto_30002 ?auto_30005 ) ) ( not ( = ?auto_30002 ?auto_30007 ) ) ( not ( = ?auto_30003 ?auto_30006 ) ) ( not ( = ?auto_30001 ?auto_30006 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30005 ?auto_30003 ?auto_30004 ?auto_30001 )
      ( GET-3IMAGE-VERIFY ?auto_30002 ?auto_30003 ?auto_30004 ?auto_30001 ?auto_30005 ?auto_30006 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30020 - DIRECTION
      ?auto_30021 - MODE
      ?auto_30022 - DIRECTION
      ?auto_30019 - MODE
      ?auto_30023 - DIRECTION
      ?auto_30024 - MODE
    )
    :vars
    (
      ?auto_30027 - INSTRUMENT
      ?auto_30026 - SATELLITE
      ?auto_30025 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30027 ?auto_30026 ) ( SUPPORTS ?auto_30027 ?auto_30021 ) ( POINTING ?auto_30026 ?auto_30025 ) ( not ( = ?auto_30020 ?auto_30025 ) ) ( HAVE_IMAGE ?auto_30023 ?auto_30024 ) ( not ( = ?auto_30023 ?auto_30020 ) ) ( not ( = ?auto_30023 ?auto_30025 ) ) ( not ( = ?auto_30024 ?auto_30021 ) ) ( CALIBRATION_TARGET ?auto_30027 ?auto_30025 ) ( POWER_AVAIL ?auto_30026 ) ( HAVE_IMAGE ?auto_30022 ?auto_30019 ) ( not ( = ?auto_30020 ?auto_30022 ) ) ( not ( = ?auto_30021 ?auto_30019 ) ) ( not ( = ?auto_30022 ?auto_30023 ) ) ( not ( = ?auto_30022 ?auto_30025 ) ) ( not ( = ?auto_30019 ?auto_30024 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30023 ?auto_30024 ?auto_30020 ?auto_30021 )
      ( GET-3IMAGE-VERIFY ?auto_30020 ?auto_30021 ?auto_30022 ?auto_30019 ?auto_30023 ?auto_30024 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30058 - DIRECTION
      ?auto_30059 - MODE
      ?auto_30060 - DIRECTION
      ?auto_30057 - MODE
      ?auto_30061 - DIRECTION
      ?auto_30062 - MODE
      ?auto_30063 - DIRECTION
      ?auto_30064 - MODE
    )
    :vars
    (
      ?auto_30067 - INSTRUMENT
      ?auto_30066 - SATELLITE
      ?auto_30065 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30067 ?auto_30066 ) ( SUPPORTS ?auto_30067 ?auto_30064 ) ( POINTING ?auto_30066 ?auto_30065 ) ( not ( = ?auto_30063 ?auto_30065 ) ) ( HAVE_IMAGE ?auto_30060 ?auto_30057 ) ( not ( = ?auto_30060 ?auto_30063 ) ) ( not ( = ?auto_30060 ?auto_30065 ) ) ( not ( = ?auto_30057 ?auto_30064 ) ) ( CALIBRATION_TARGET ?auto_30067 ?auto_30065 ) ( POWER_AVAIL ?auto_30066 ) ( HAVE_IMAGE ?auto_30058 ?auto_30059 ) ( HAVE_IMAGE ?auto_30061 ?auto_30062 ) ( not ( = ?auto_30058 ?auto_30060 ) ) ( not ( = ?auto_30058 ?auto_30061 ) ) ( not ( = ?auto_30058 ?auto_30063 ) ) ( not ( = ?auto_30058 ?auto_30065 ) ) ( not ( = ?auto_30059 ?auto_30057 ) ) ( not ( = ?auto_30059 ?auto_30062 ) ) ( not ( = ?auto_30059 ?auto_30064 ) ) ( not ( = ?auto_30060 ?auto_30061 ) ) ( not ( = ?auto_30057 ?auto_30062 ) ) ( not ( = ?auto_30061 ?auto_30063 ) ) ( not ( = ?auto_30061 ?auto_30065 ) ) ( not ( = ?auto_30062 ?auto_30064 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30060 ?auto_30057 ?auto_30063 ?auto_30064 )
      ( GET-4IMAGE-VERIFY ?auto_30058 ?auto_30059 ?auto_30060 ?auto_30057 ?auto_30061 ?auto_30062 ?auto_30063 ?auto_30064 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30069 - DIRECTION
      ?auto_30070 - MODE
      ?auto_30071 - DIRECTION
      ?auto_30068 - MODE
      ?auto_30072 - DIRECTION
      ?auto_30073 - MODE
      ?auto_30074 - DIRECTION
      ?auto_30075 - MODE
    )
    :vars
    (
      ?auto_30078 - INSTRUMENT
      ?auto_30077 - SATELLITE
      ?auto_30076 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30078 ?auto_30077 ) ( SUPPORTS ?auto_30078 ?auto_30073 ) ( POINTING ?auto_30077 ?auto_30076 ) ( not ( = ?auto_30072 ?auto_30076 ) ) ( HAVE_IMAGE ?auto_30074 ?auto_30070 ) ( not ( = ?auto_30074 ?auto_30072 ) ) ( not ( = ?auto_30074 ?auto_30076 ) ) ( not ( = ?auto_30070 ?auto_30073 ) ) ( CALIBRATION_TARGET ?auto_30078 ?auto_30076 ) ( POWER_AVAIL ?auto_30077 ) ( HAVE_IMAGE ?auto_30069 ?auto_30070 ) ( HAVE_IMAGE ?auto_30071 ?auto_30068 ) ( HAVE_IMAGE ?auto_30074 ?auto_30075 ) ( not ( = ?auto_30069 ?auto_30071 ) ) ( not ( = ?auto_30069 ?auto_30072 ) ) ( not ( = ?auto_30069 ?auto_30074 ) ) ( not ( = ?auto_30069 ?auto_30076 ) ) ( not ( = ?auto_30070 ?auto_30068 ) ) ( not ( = ?auto_30070 ?auto_30075 ) ) ( not ( = ?auto_30071 ?auto_30072 ) ) ( not ( = ?auto_30071 ?auto_30074 ) ) ( not ( = ?auto_30071 ?auto_30076 ) ) ( not ( = ?auto_30068 ?auto_30073 ) ) ( not ( = ?auto_30068 ?auto_30075 ) ) ( not ( = ?auto_30073 ?auto_30075 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30074 ?auto_30070 ?auto_30072 ?auto_30073 )
      ( GET-4IMAGE-VERIFY ?auto_30069 ?auto_30070 ?auto_30071 ?auto_30068 ?auto_30072 ?auto_30073 ?auto_30074 ?auto_30075 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30091 - DIRECTION
      ?auto_30092 - MODE
      ?auto_30093 - DIRECTION
      ?auto_30090 - MODE
      ?auto_30094 - DIRECTION
      ?auto_30095 - MODE
      ?auto_30096 - DIRECTION
      ?auto_30097 - MODE
    )
    :vars
    (
      ?auto_30100 - INSTRUMENT
      ?auto_30099 - SATELLITE
      ?auto_30098 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30100 ?auto_30099 ) ( SUPPORTS ?auto_30100 ?auto_30090 ) ( POINTING ?auto_30099 ?auto_30098 ) ( not ( = ?auto_30093 ?auto_30098 ) ) ( HAVE_IMAGE ?auto_30091 ?auto_30097 ) ( not ( = ?auto_30091 ?auto_30093 ) ) ( not ( = ?auto_30091 ?auto_30098 ) ) ( not ( = ?auto_30097 ?auto_30090 ) ) ( CALIBRATION_TARGET ?auto_30100 ?auto_30098 ) ( POWER_AVAIL ?auto_30099 ) ( HAVE_IMAGE ?auto_30091 ?auto_30092 ) ( HAVE_IMAGE ?auto_30094 ?auto_30095 ) ( HAVE_IMAGE ?auto_30096 ?auto_30097 ) ( not ( = ?auto_30091 ?auto_30094 ) ) ( not ( = ?auto_30091 ?auto_30096 ) ) ( not ( = ?auto_30092 ?auto_30090 ) ) ( not ( = ?auto_30092 ?auto_30095 ) ) ( not ( = ?auto_30092 ?auto_30097 ) ) ( not ( = ?auto_30093 ?auto_30094 ) ) ( not ( = ?auto_30093 ?auto_30096 ) ) ( not ( = ?auto_30090 ?auto_30095 ) ) ( not ( = ?auto_30094 ?auto_30096 ) ) ( not ( = ?auto_30094 ?auto_30098 ) ) ( not ( = ?auto_30095 ?auto_30097 ) ) ( not ( = ?auto_30096 ?auto_30098 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30091 ?auto_30097 ?auto_30093 ?auto_30090 )
      ( GET-4IMAGE-VERIFY ?auto_30091 ?auto_30092 ?auto_30093 ?auto_30090 ?auto_30094 ?auto_30095 ?auto_30096 ?auto_30097 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30135 - DIRECTION
      ?auto_30136 - MODE
      ?auto_30137 - DIRECTION
      ?auto_30134 - MODE
      ?auto_30138 - DIRECTION
      ?auto_30139 - MODE
      ?auto_30140 - DIRECTION
      ?auto_30141 - MODE
    )
    :vars
    (
      ?auto_30144 - INSTRUMENT
      ?auto_30143 - SATELLITE
      ?auto_30142 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30144 ?auto_30143 ) ( SUPPORTS ?auto_30144 ?auto_30136 ) ( POINTING ?auto_30143 ?auto_30142 ) ( not ( = ?auto_30135 ?auto_30142 ) ) ( HAVE_IMAGE ?auto_30137 ?auto_30141 ) ( not ( = ?auto_30137 ?auto_30135 ) ) ( not ( = ?auto_30137 ?auto_30142 ) ) ( not ( = ?auto_30141 ?auto_30136 ) ) ( CALIBRATION_TARGET ?auto_30144 ?auto_30142 ) ( POWER_AVAIL ?auto_30143 ) ( HAVE_IMAGE ?auto_30137 ?auto_30134 ) ( HAVE_IMAGE ?auto_30138 ?auto_30139 ) ( HAVE_IMAGE ?auto_30140 ?auto_30141 ) ( not ( = ?auto_30135 ?auto_30138 ) ) ( not ( = ?auto_30135 ?auto_30140 ) ) ( not ( = ?auto_30136 ?auto_30134 ) ) ( not ( = ?auto_30136 ?auto_30139 ) ) ( not ( = ?auto_30137 ?auto_30138 ) ) ( not ( = ?auto_30137 ?auto_30140 ) ) ( not ( = ?auto_30134 ?auto_30139 ) ) ( not ( = ?auto_30134 ?auto_30141 ) ) ( not ( = ?auto_30138 ?auto_30140 ) ) ( not ( = ?auto_30138 ?auto_30142 ) ) ( not ( = ?auto_30139 ?auto_30141 ) ) ( not ( = ?auto_30140 ?auto_30142 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30137 ?auto_30141 ?auto_30135 ?auto_30136 )
      ( GET-4IMAGE-VERIFY ?auto_30135 ?auto_30136 ?auto_30137 ?auto_30134 ?auto_30138 ?auto_30139 ?auto_30140 ?auto_30141 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_30224 - DIRECTION
      ?auto_30225 - MODE
    )
    :vars
    (
      ?auto_30230 - INSTRUMENT
      ?auto_30229 - SATELLITE
      ?auto_30228 - DIRECTION
      ?auto_30226 - DIRECTION
      ?auto_30227 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_30230 ?auto_30229 ) ( SUPPORTS ?auto_30230 ?auto_30225 ) ( not ( = ?auto_30224 ?auto_30228 ) ) ( HAVE_IMAGE ?auto_30226 ?auto_30227 ) ( not ( = ?auto_30226 ?auto_30224 ) ) ( not ( = ?auto_30226 ?auto_30228 ) ) ( not ( = ?auto_30227 ?auto_30225 ) ) ( CALIBRATION_TARGET ?auto_30230 ?auto_30228 ) ( POWER_AVAIL ?auto_30229 ) ( POINTING ?auto_30229 ?auto_30226 ) )
    :subtasks
    ( ( !TURN_TO ?auto_30229 ?auto_30228 ?auto_30226 )
      ( GET-2IMAGE ?auto_30226 ?auto_30227 ?auto_30224 ?auto_30225 )
      ( GET-1IMAGE-VERIFY ?auto_30224 ?auto_30225 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30232 - DIRECTION
      ?auto_30233 - MODE
      ?auto_30234 - DIRECTION
      ?auto_30231 - MODE
    )
    :vars
    (
      ?auto_30236 - INSTRUMENT
      ?auto_30235 - SATELLITE
      ?auto_30237 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30236 ?auto_30235 ) ( SUPPORTS ?auto_30236 ?auto_30231 ) ( not ( = ?auto_30234 ?auto_30237 ) ) ( HAVE_IMAGE ?auto_30232 ?auto_30233 ) ( not ( = ?auto_30232 ?auto_30234 ) ) ( not ( = ?auto_30232 ?auto_30237 ) ) ( not ( = ?auto_30233 ?auto_30231 ) ) ( CALIBRATION_TARGET ?auto_30236 ?auto_30237 ) ( POWER_AVAIL ?auto_30235 ) ( POINTING ?auto_30235 ?auto_30232 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_30234 ?auto_30231 )
      ( GET-2IMAGE-VERIFY ?auto_30232 ?auto_30233 ?auto_30234 ?auto_30231 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30239 - DIRECTION
      ?auto_30240 - MODE
      ?auto_30241 - DIRECTION
      ?auto_30238 - MODE
    )
    :vars
    (
      ?auto_30242 - INSTRUMENT
      ?auto_30244 - SATELLITE
      ?auto_30243 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30242 ?auto_30244 ) ( SUPPORTS ?auto_30242 ?auto_30240 ) ( not ( = ?auto_30239 ?auto_30243 ) ) ( HAVE_IMAGE ?auto_30241 ?auto_30238 ) ( not ( = ?auto_30241 ?auto_30239 ) ) ( not ( = ?auto_30241 ?auto_30243 ) ) ( not ( = ?auto_30238 ?auto_30240 ) ) ( CALIBRATION_TARGET ?auto_30242 ?auto_30243 ) ( POWER_AVAIL ?auto_30244 ) ( POINTING ?auto_30244 ?auto_30241 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30241 ?auto_30238 ?auto_30239 ?auto_30240 )
      ( GET-2IMAGE-VERIFY ?auto_30239 ?auto_30240 ?auto_30241 ?auto_30238 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30255 - DIRECTION
      ?auto_30256 - MODE
      ?auto_30257 - DIRECTION
      ?auto_30254 - MODE
      ?auto_30258 - DIRECTION
      ?auto_30259 - MODE
    )
    :vars
    (
      ?auto_30260 - INSTRUMENT
      ?auto_30262 - SATELLITE
      ?auto_30261 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30260 ?auto_30262 ) ( SUPPORTS ?auto_30260 ?auto_30259 ) ( not ( = ?auto_30258 ?auto_30261 ) ) ( HAVE_IMAGE ?auto_30257 ?auto_30256 ) ( not ( = ?auto_30257 ?auto_30258 ) ) ( not ( = ?auto_30257 ?auto_30261 ) ) ( not ( = ?auto_30256 ?auto_30259 ) ) ( CALIBRATION_TARGET ?auto_30260 ?auto_30261 ) ( POWER_AVAIL ?auto_30262 ) ( POINTING ?auto_30262 ?auto_30257 ) ( HAVE_IMAGE ?auto_30255 ?auto_30256 ) ( HAVE_IMAGE ?auto_30257 ?auto_30254 ) ( not ( = ?auto_30255 ?auto_30257 ) ) ( not ( = ?auto_30255 ?auto_30258 ) ) ( not ( = ?auto_30255 ?auto_30261 ) ) ( not ( = ?auto_30256 ?auto_30254 ) ) ( not ( = ?auto_30254 ?auto_30259 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30257 ?auto_30256 ?auto_30258 ?auto_30259 )
      ( GET-3IMAGE-VERIFY ?auto_30255 ?auto_30256 ?auto_30257 ?auto_30254 ?auto_30258 ?auto_30259 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30264 - DIRECTION
      ?auto_30265 - MODE
      ?auto_30266 - DIRECTION
      ?auto_30263 - MODE
      ?auto_30267 - DIRECTION
      ?auto_30268 - MODE
    )
    :vars
    (
      ?auto_30269 - INSTRUMENT
      ?auto_30271 - SATELLITE
      ?auto_30270 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30269 ?auto_30271 ) ( SUPPORTS ?auto_30269 ?auto_30263 ) ( not ( = ?auto_30266 ?auto_30270 ) ) ( HAVE_IMAGE ?auto_30267 ?auto_30265 ) ( not ( = ?auto_30267 ?auto_30266 ) ) ( not ( = ?auto_30267 ?auto_30270 ) ) ( not ( = ?auto_30265 ?auto_30263 ) ) ( CALIBRATION_TARGET ?auto_30269 ?auto_30270 ) ( POWER_AVAIL ?auto_30271 ) ( POINTING ?auto_30271 ?auto_30267 ) ( HAVE_IMAGE ?auto_30264 ?auto_30265 ) ( HAVE_IMAGE ?auto_30267 ?auto_30268 ) ( not ( = ?auto_30264 ?auto_30266 ) ) ( not ( = ?auto_30264 ?auto_30267 ) ) ( not ( = ?auto_30264 ?auto_30270 ) ) ( not ( = ?auto_30265 ?auto_30268 ) ) ( not ( = ?auto_30263 ?auto_30268 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30267 ?auto_30265 ?auto_30266 ?auto_30263 )
      ( GET-3IMAGE-VERIFY ?auto_30264 ?auto_30265 ?auto_30266 ?auto_30263 ?auto_30267 ?auto_30268 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30282 - DIRECTION
      ?auto_30283 - MODE
      ?auto_30284 - DIRECTION
      ?auto_30281 - MODE
      ?auto_30285 - DIRECTION
      ?auto_30286 - MODE
    )
    :vars
    (
      ?auto_30287 - INSTRUMENT
      ?auto_30289 - SATELLITE
      ?auto_30288 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30287 ?auto_30289 ) ( SUPPORTS ?auto_30287 ?auto_30283 ) ( not ( = ?auto_30282 ?auto_30288 ) ) ( HAVE_IMAGE ?auto_30284 ?auto_30281 ) ( not ( = ?auto_30284 ?auto_30282 ) ) ( not ( = ?auto_30284 ?auto_30288 ) ) ( not ( = ?auto_30281 ?auto_30283 ) ) ( CALIBRATION_TARGET ?auto_30287 ?auto_30288 ) ( POWER_AVAIL ?auto_30289 ) ( POINTING ?auto_30289 ?auto_30284 ) ( HAVE_IMAGE ?auto_30285 ?auto_30286 ) ( not ( = ?auto_30282 ?auto_30285 ) ) ( not ( = ?auto_30283 ?auto_30286 ) ) ( not ( = ?auto_30284 ?auto_30285 ) ) ( not ( = ?auto_30281 ?auto_30286 ) ) ( not ( = ?auto_30285 ?auto_30288 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30284 ?auto_30281 ?auto_30282 ?auto_30283 )
      ( GET-3IMAGE-VERIFY ?auto_30282 ?auto_30283 ?auto_30284 ?auto_30281 ?auto_30285 ?auto_30286 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30320 - DIRECTION
      ?auto_30321 - MODE
      ?auto_30322 - DIRECTION
      ?auto_30319 - MODE
      ?auto_30323 - DIRECTION
      ?auto_30324 - MODE
      ?auto_30325 - DIRECTION
      ?auto_30326 - MODE
    )
    :vars
    (
      ?auto_30327 - INSTRUMENT
      ?auto_30329 - SATELLITE
      ?auto_30328 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30327 ?auto_30329 ) ( SUPPORTS ?auto_30327 ?auto_30326 ) ( not ( = ?auto_30325 ?auto_30328 ) ) ( HAVE_IMAGE ?auto_30323 ?auto_30324 ) ( not ( = ?auto_30323 ?auto_30325 ) ) ( not ( = ?auto_30323 ?auto_30328 ) ) ( not ( = ?auto_30324 ?auto_30326 ) ) ( CALIBRATION_TARGET ?auto_30327 ?auto_30328 ) ( POWER_AVAIL ?auto_30329 ) ( POINTING ?auto_30329 ?auto_30323 ) ( HAVE_IMAGE ?auto_30320 ?auto_30321 ) ( HAVE_IMAGE ?auto_30322 ?auto_30319 ) ( not ( = ?auto_30320 ?auto_30322 ) ) ( not ( = ?auto_30320 ?auto_30323 ) ) ( not ( = ?auto_30320 ?auto_30325 ) ) ( not ( = ?auto_30320 ?auto_30328 ) ) ( not ( = ?auto_30321 ?auto_30319 ) ) ( not ( = ?auto_30321 ?auto_30324 ) ) ( not ( = ?auto_30321 ?auto_30326 ) ) ( not ( = ?auto_30322 ?auto_30323 ) ) ( not ( = ?auto_30322 ?auto_30325 ) ) ( not ( = ?auto_30322 ?auto_30328 ) ) ( not ( = ?auto_30319 ?auto_30324 ) ) ( not ( = ?auto_30319 ?auto_30326 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30323 ?auto_30324 ?auto_30325 ?auto_30326 )
      ( GET-4IMAGE-VERIFY ?auto_30320 ?auto_30321 ?auto_30322 ?auto_30319 ?auto_30323 ?auto_30324 ?auto_30325 ?auto_30326 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30331 - DIRECTION
      ?auto_30332 - MODE
      ?auto_30333 - DIRECTION
      ?auto_30330 - MODE
      ?auto_30334 - DIRECTION
      ?auto_30335 - MODE
      ?auto_30336 - DIRECTION
      ?auto_30337 - MODE
    )
    :vars
    (
      ?auto_30338 - INSTRUMENT
      ?auto_30340 - SATELLITE
      ?auto_30339 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30338 ?auto_30340 ) ( SUPPORTS ?auto_30338 ?auto_30335 ) ( not ( = ?auto_30334 ?auto_30339 ) ) ( HAVE_IMAGE ?auto_30333 ?auto_30337 ) ( not ( = ?auto_30333 ?auto_30334 ) ) ( not ( = ?auto_30333 ?auto_30339 ) ) ( not ( = ?auto_30337 ?auto_30335 ) ) ( CALIBRATION_TARGET ?auto_30338 ?auto_30339 ) ( POWER_AVAIL ?auto_30340 ) ( POINTING ?auto_30340 ?auto_30333 ) ( HAVE_IMAGE ?auto_30331 ?auto_30332 ) ( HAVE_IMAGE ?auto_30333 ?auto_30330 ) ( HAVE_IMAGE ?auto_30336 ?auto_30337 ) ( not ( = ?auto_30331 ?auto_30333 ) ) ( not ( = ?auto_30331 ?auto_30334 ) ) ( not ( = ?auto_30331 ?auto_30336 ) ) ( not ( = ?auto_30331 ?auto_30339 ) ) ( not ( = ?auto_30332 ?auto_30330 ) ) ( not ( = ?auto_30332 ?auto_30335 ) ) ( not ( = ?auto_30332 ?auto_30337 ) ) ( not ( = ?auto_30333 ?auto_30336 ) ) ( not ( = ?auto_30330 ?auto_30335 ) ) ( not ( = ?auto_30330 ?auto_30337 ) ) ( not ( = ?auto_30334 ?auto_30336 ) ) ( not ( = ?auto_30336 ?auto_30339 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30333 ?auto_30337 ?auto_30334 ?auto_30335 )
      ( GET-4IMAGE-VERIFY ?auto_30331 ?auto_30332 ?auto_30333 ?auto_30330 ?auto_30334 ?auto_30335 ?auto_30336 ?auto_30337 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30353 - DIRECTION
      ?auto_30354 - MODE
      ?auto_30355 - DIRECTION
      ?auto_30352 - MODE
      ?auto_30356 - DIRECTION
      ?auto_30357 - MODE
      ?auto_30358 - DIRECTION
      ?auto_30359 - MODE
    )
    :vars
    (
      ?auto_30360 - INSTRUMENT
      ?auto_30362 - SATELLITE
      ?auto_30361 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30360 ?auto_30362 ) ( SUPPORTS ?auto_30360 ?auto_30352 ) ( not ( = ?auto_30355 ?auto_30361 ) ) ( HAVE_IMAGE ?auto_30353 ?auto_30359 ) ( not ( = ?auto_30353 ?auto_30355 ) ) ( not ( = ?auto_30353 ?auto_30361 ) ) ( not ( = ?auto_30359 ?auto_30352 ) ) ( CALIBRATION_TARGET ?auto_30360 ?auto_30361 ) ( POWER_AVAIL ?auto_30362 ) ( POINTING ?auto_30362 ?auto_30353 ) ( HAVE_IMAGE ?auto_30353 ?auto_30354 ) ( HAVE_IMAGE ?auto_30356 ?auto_30357 ) ( HAVE_IMAGE ?auto_30358 ?auto_30359 ) ( not ( = ?auto_30353 ?auto_30356 ) ) ( not ( = ?auto_30353 ?auto_30358 ) ) ( not ( = ?auto_30354 ?auto_30352 ) ) ( not ( = ?auto_30354 ?auto_30357 ) ) ( not ( = ?auto_30354 ?auto_30359 ) ) ( not ( = ?auto_30355 ?auto_30356 ) ) ( not ( = ?auto_30355 ?auto_30358 ) ) ( not ( = ?auto_30352 ?auto_30357 ) ) ( not ( = ?auto_30356 ?auto_30358 ) ) ( not ( = ?auto_30356 ?auto_30361 ) ) ( not ( = ?auto_30357 ?auto_30359 ) ) ( not ( = ?auto_30358 ?auto_30361 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30353 ?auto_30359 ?auto_30355 ?auto_30352 )
      ( GET-4IMAGE-VERIFY ?auto_30353 ?auto_30354 ?auto_30355 ?auto_30352 ?auto_30356 ?auto_30357 ?auto_30358 ?auto_30359 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30397 - DIRECTION
      ?auto_30398 - MODE
      ?auto_30399 - DIRECTION
      ?auto_30396 - MODE
      ?auto_30400 - DIRECTION
      ?auto_30401 - MODE
      ?auto_30402 - DIRECTION
      ?auto_30403 - MODE
    )
    :vars
    (
      ?auto_30404 - INSTRUMENT
      ?auto_30406 - SATELLITE
      ?auto_30405 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_30404 ?auto_30406 ) ( SUPPORTS ?auto_30404 ?auto_30398 ) ( not ( = ?auto_30397 ?auto_30405 ) ) ( HAVE_IMAGE ?auto_30399 ?auto_30403 ) ( not ( = ?auto_30399 ?auto_30397 ) ) ( not ( = ?auto_30399 ?auto_30405 ) ) ( not ( = ?auto_30403 ?auto_30398 ) ) ( CALIBRATION_TARGET ?auto_30404 ?auto_30405 ) ( POWER_AVAIL ?auto_30406 ) ( POINTING ?auto_30406 ?auto_30399 ) ( HAVE_IMAGE ?auto_30399 ?auto_30396 ) ( HAVE_IMAGE ?auto_30400 ?auto_30401 ) ( HAVE_IMAGE ?auto_30402 ?auto_30403 ) ( not ( = ?auto_30397 ?auto_30400 ) ) ( not ( = ?auto_30397 ?auto_30402 ) ) ( not ( = ?auto_30398 ?auto_30396 ) ) ( not ( = ?auto_30398 ?auto_30401 ) ) ( not ( = ?auto_30399 ?auto_30400 ) ) ( not ( = ?auto_30399 ?auto_30402 ) ) ( not ( = ?auto_30396 ?auto_30401 ) ) ( not ( = ?auto_30396 ?auto_30403 ) ) ( not ( = ?auto_30400 ?auto_30402 ) ) ( not ( = ?auto_30400 ?auto_30405 ) ) ( not ( = ?auto_30401 ?auto_30403 ) ) ( not ( = ?auto_30402 ?auto_30405 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30399 ?auto_30403 ?auto_30397 ?auto_30398 )
      ( GET-4IMAGE-VERIFY ?auto_30397 ?auto_30398 ?auto_30399 ?auto_30396 ?auto_30400 ?auto_30401 ?auto_30402 ?auto_30403 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_30486 - DIRECTION
      ?auto_30487 - MODE
    )
    :vars
    (
      ?auto_30488 - INSTRUMENT
      ?auto_30490 - SATELLITE
      ?auto_30489 - DIRECTION
      ?auto_30492 - DIRECTION
      ?auto_30491 - MODE
      ?auto_30493 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30488 ?auto_30490 ) ( SUPPORTS ?auto_30488 ?auto_30487 ) ( not ( = ?auto_30486 ?auto_30489 ) ) ( HAVE_IMAGE ?auto_30492 ?auto_30491 ) ( not ( = ?auto_30492 ?auto_30486 ) ) ( not ( = ?auto_30492 ?auto_30489 ) ) ( not ( = ?auto_30491 ?auto_30487 ) ) ( CALIBRATION_TARGET ?auto_30488 ?auto_30489 ) ( POINTING ?auto_30490 ?auto_30492 ) ( ON_BOARD ?auto_30493 ?auto_30490 ) ( POWER_ON ?auto_30493 ) ( not ( = ?auto_30488 ?auto_30493 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_30493 ?auto_30490 )
      ( GET-2IMAGE ?auto_30492 ?auto_30491 ?auto_30486 ?auto_30487 )
      ( GET-1IMAGE-VERIFY ?auto_30486 ?auto_30487 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30495 - DIRECTION
      ?auto_30496 - MODE
      ?auto_30497 - DIRECTION
      ?auto_30494 - MODE
    )
    :vars
    (
      ?auto_30499 - INSTRUMENT
      ?auto_30500 - SATELLITE
      ?auto_30501 - DIRECTION
      ?auto_30498 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30499 ?auto_30500 ) ( SUPPORTS ?auto_30499 ?auto_30494 ) ( not ( = ?auto_30497 ?auto_30501 ) ) ( HAVE_IMAGE ?auto_30495 ?auto_30496 ) ( not ( = ?auto_30495 ?auto_30497 ) ) ( not ( = ?auto_30495 ?auto_30501 ) ) ( not ( = ?auto_30496 ?auto_30494 ) ) ( CALIBRATION_TARGET ?auto_30499 ?auto_30501 ) ( POINTING ?auto_30500 ?auto_30495 ) ( ON_BOARD ?auto_30498 ?auto_30500 ) ( POWER_ON ?auto_30498 ) ( not ( = ?auto_30499 ?auto_30498 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_30497 ?auto_30494 )
      ( GET-2IMAGE-VERIFY ?auto_30495 ?auto_30496 ?auto_30497 ?auto_30494 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30503 - DIRECTION
      ?auto_30504 - MODE
      ?auto_30505 - DIRECTION
      ?auto_30502 - MODE
    )
    :vars
    (
      ?auto_30508 - INSTRUMENT
      ?auto_30509 - SATELLITE
      ?auto_30506 - DIRECTION
      ?auto_30507 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30508 ?auto_30509 ) ( SUPPORTS ?auto_30508 ?auto_30504 ) ( not ( = ?auto_30503 ?auto_30506 ) ) ( HAVE_IMAGE ?auto_30505 ?auto_30502 ) ( not ( = ?auto_30505 ?auto_30503 ) ) ( not ( = ?auto_30505 ?auto_30506 ) ) ( not ( = ?auto_30502 ?auto_30504 ) ) ( CALIBRATION_TARGET ?auto_30508 ?auto_30506 ) ( POINTING ?auto_30509 ?auto_30505 ) ( ON_BOARD ?auto_30507 ?auto_30509 ) ( POWER_ON ?auto_30507 ) ( not ( = ?auto_30508 ?auto_30507 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30505 ?auto_30502 ?auto_30503 ?auto_30504 )
      ( GET-2IMAGE-VERIFY ?auto_30503 ?auto_30504 ?auto_30505 ?auto_30502 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30521 - DIRECTION
      ?auto_30522 - MODE
      ?auto_30523 - DIRECTION
      ?auto_30520 - MODE
      ?auto_30524 - DIRECTION
      ?auto_30525 - MODE
    )
    :vars
    (
      ?auto_30528 - INSTRUMENT
      ?auto_30529 - SATELLITE
      ?auto_30526 - DIRECTION
      ?auto_30527 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30528 ?auto_30529 ) ( SUPPORTS ?auto_30528 ?auto_30525 ) ( not ( = ?auto_30524 ?auto_30526 ) ) ( HAVE_IMAGE ?auto_30521 ?auto_30520 ) ( not ( = ?auto_30521 ?auto_30524 ) ) ( not ( = ?auto_30521 ?auto_30526 ) ) ( not ( = ?auto_30520 ?auto_30525 ) ) ( CALIBRATION_TARGET ?auto_30528 ?auto_30526 ) ( POINTING ?auto_30529 ?auto_30521 ) ( ON_BOARD ?auto_30527 ?auto_30529 ) ( POWER_ON ?auto_30527 ) ( not ( = ?auto_30528 ?auto_30527 ) ) ( HAVE_IMAGE ?auto_30521 ?auto_30522 ) ( HAVE_IMAGE ?auto_30523 ?auto_30520 ) ( not ( = ?auto_30521 ?auto_30523 ) ) ( not ( = ?auto_30522 ?auto_30520 ) ) ( not ( = ?auto_30522 ?auto_30525 ) ) ( not ( = ?auto_30523 ?auto_30524 ) ) ( not ( = ?auto_30523 ?auto_30526 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30521 ?auto_30520 ?auto_30524 ?auto_30525 )
      ( GET-3IMAGE-VERIFY ?auto_30521 ?auto_30522 ?auto_30523 ?auto_30520 ?auto_30524 ?auto_30525 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30531 - DIRECTION
      ?auto_30532 - MODE
      ?auto_30533 - DIRECTION
      ?auto_30530 - MODE
      ?auto_30534 - DIRECTION
      ?auto_30535 - MODE
    )
    :vars
    (
      ?auto_30538 - INSTRUMENT
      ?auto_30539 - SATELLITE
      ?auto_30536 - DIRECTION
      ?auto_30537 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30538 ?auto_30539 ) ( SUPPORTS ?auto_30538 ?auto_30530 ) ( not ( = ?auto_30533 ?auto_30536 ) ) ( HAVE_IMAGE ?auto_30531 ?auto_30532 ) ( not ( = ?auto_30531 ?auto_30533 ) ) ( not ( = ?auto_30531 ?auto_30536 ) ) ( not ( = ?auto_30532 ?auto_30530 ) ) ( CALIBRATION_TARGET ?auto_30538 ?auto_30536 ) ( POINTING ?auto_30539 ?auto_30531 ) ( ON_BOARD ?auto_30537 ?auto_30539 ) ( POWER_ON ?auto_30537 ) ( not ( = ?auto_30538 ?auto_30537 ) ) ( HAVE_IMAGE ?auto_30534 ?auto_30535 ) ( not ( = ?auto_30531 ?auto_30534 ) ) ( not ( = ?auto_30532 ?auto_30535 ) ) ( not ( = ?auto_30533 ?auto_30534 ) ) ( not ( = ?auto_30530 ?auto_30535 ) ) ( not ( = ?auto_30534 ?auto_30536 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30531 ?auto_30532 ?auto_30533 ?auto_30530 )
      ( GET-3IMAGE-VERIFY ?auto_30531 ?auto_30532 ?auto_30533 ?auto_30530 ?auto_30534 ?auto_30535 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_30551 - DIRECTION
      ?auto_30552 - MODE
      ?auto_30553 - DIRECTION
      ?auto_30550 - MODE
      ?auto_30554 - DIRECTION
      ?auto_30555 - MODE
    )
    :vars
    (
      ?auto_30558 - INSTRUMENT
      ?auto_30559 - SATELLITE
      ?auto_30556 - DIRECTION
      ?auto_30557 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30558 ?auto_30559 ) ( SUPPORTS ?auto_30558 ?auto_30552 ) ( not ( = ?auto_30551 ?auto_30556 ) ) ( HAVE_IMAGE ?auto_30554 ?auto_30550 ) ( not ( = ?auto_30554 ?auto_30551 ) ) ( not ( = ?auto_30554 ?auto_30556 ) ) ( not ( = ?auto_30550 ?auto_30552 ) ) ( CALIBRATION_TARGET ?auto_30558 ?auto_30556 ) ( POINTING ?auto_30559 ?auto_30554 ) ( ON_BOARD ?auto_30557 ?auto_30559 ) ( POWER_ON ?auto_30557 ) ( not ( = ?auto_30558 ?auto_30557 ) ) ( HAVE_IMAGE ?auto_30553 ?auto_30550 ) ( HAVE_IMAGE ?auto_30554 ?auto_30555 ) ( not ( = ?auto_30551 ?auto_30553 ) ) ( not ( = ?auto_30552 ?auto_30555 ) ) ( not ( = ?auto_30553 ?auto_30554 ) ) ( not ( = ?auto_30553 ?auto_30556 ) ) ( not ( = ?auto_30550 ?auto_30555 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30554 ?auto_30550 ?auto_30551 ?auto_30552 )
      ( GET-3IMAGE-VERIFY ?auto_30551 ?auto_30552 ?auto_30553 ?auto_30550 ?auto_30554 ?auto_30555 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30593 - DIRECTION
      ?auto_30594 - MODE
      ?auto_30595 - DIRECTION
      ?auto_30592 - MODE
      ?auto_30596 - DIRECTION
      ?auto_30597 - MODE
      ?auto_30598 - DIRECTION
      ?auto_30599 - MODE
    )
    :vars
    (
      ?auto_30602 - INSTRUMENT
      ?auto_30603 - SATELLITE
      ?auto_30600 - DIRECTION
      ?auto_30601 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30602 ?auto_30603 ) ( SUPPORTS ?auto_30602 ?auto_30599 ) ( not ( = ?auto_30598 ?auto_30600 ) ) ( HAVE_IMAGE ?auto_30593 ?auto_30594 ) ( not ( = ?auto_30593 ?auto_30598 ) ) ( not ( = ?auto_30593 ?auto_30600 ) ) ( not ( = ?auto_30594 ?auto_30599 ) ) ( CALIBRATION_TARGET ?auto_30602 ?auto_30600 ) ( POINTING ?auto_30603 ?auto_30593 ) ( ON_BOARD ?auto_30601 ?auto_30603 ) ( POWER_ON ?auto_30601 ) ( not ( = ?auto_30602 ?auto_30601 ) ) ( HAVE_IMAGE ?auto_30595 ?auto_30592 ) ( HAVE_IMAGE ?auto_30596 ?auto_30597 ) ( not ( = ?auto_30593 ?auto_30595 ) ) ( not ( = ?auto_30593 ?auto_30596 ) ) ( not ( = ?auto_30594 ?auto_30592 ) ) ( not ( = ?auto_30594 ?auto_30597 ) ) ( not ( = ?auto_30595 ?auto_30596 ) ) ( not ( = ?auto_30595 ?auto_30598 ) ) ( not ( = ?auto_30595 ?auto_30600 ) ) ( not ( = ?auto_30592 ?auto_30597 ) ) ( not ( = ?auto_30592 ?auto_30599 ) ) ( not ( = ?auto_30596 ?auto_30598 ) ) ( not ( = ?auto_30596 ?auto_30600 ) ) ( not ( = ?auto_30597 ?auto_30599 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30593 ?auto_30594 ?auto_30598 ?auto_30599 )
      ( GET-4IMAGE-VERIFY ?auto_30593 ?auto_30594 ?auto_30595 ?auto_30592 ?auto_30596 ?auto_30597 ?auto_30598 ?auto_30599 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30605 - DIRECTION
      ?auto_30606 - MODE
      ?auto_30607 - DIRECTION
      ?auto_30604 - MODE
      ?auto_30608 - DIRECTION
      ?auto_30609 - MODE
      ?auto_30610 - DIRECTION
      ?auto_30611 - MODE
    )
    :vars
    (
      ?auto_30614 - INSTRUMENT
      ?auto_30615 - SATELLITE
      ?auto_30612 - DIRECTION
      ?auto_30613 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30614 ?auto_30615 ) ( SUPPORTS ?auto_30614 ?auto_30609 ) ( not ( = ?auto_30608 ?auto_30612 ) ) ( HAVE_IMAGE ?auto_30607 ?auto_30611 ) ( not ( = ?auto_30607 ?auto_30608 ) ) ( not ( = ?auto_30607 ?auto_30612 ) ) ( not ( = ?auto_30611 ?auto_30609 ) ) ( CALIBRATION_TARGET ?auto_30614 ?auto_30612 ) ( POINTING ?auto_30615 ?auto_30607 ) ( ON_BOARD ?auto_30613 ?auto_30615 ) ( POWER_ON ?auto_30613 ) ( not ( = ?auto_30614 ?auto_30613 ) ) ( HAVE_IMAGE ?auto_30605 ?auto_30606 ) ( HAVE_IMAGE ?auto_30607 ?auto_30604 ) ( HAVE_IMAGE ?auto_30610 ?auto_30611 ) ( not ( = ?auto_30605 ?auto_30607 ) ) ( not ( = ?auto_30605 ?auto_30608 ) ) ( not ( = ?auto_30605 ?auto_30610 ) ) ( not ( = ?auto_30605 ?auto_30612 ) ) ( not ( = ?auto_30606 ?auto_30604 ) ) ( not ( = ?auto_30606 ?auto_30609 ) ) ( not ( = ?auto_30606 ?auto_30611 ) ) ( not ( = ?auto_30607 ?auto_30610 ) ) ( not ( = ?auto_30604 ?auto_30609 ) ) ( not ( = ?auto_30604 ?auto_30611 ) ) ( not ( = ?auto_30608 ?auto_30610 ) ) ( not ( = ?auto_30610 ?auto_30612 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30607 ?auto_30611 ?auto_30608 ?auto_30609 )
      ( GET-4IMAGE-VERIFY ?auto_30605 ?auto_30606 ?auto_30607 ?auto_30604 ?auto_30608 ?auto_30609 ?auto_30610 ?auto_30611 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30629 - DIRECTION
      ?auto_30630 - MODE
      ?auto_30631 - DIRECTION
      ?auto_30628 - MODE
      ?auto_30632 - DIRECTION
      ?auto_30633 - MODE
      ?auto_30634 - DIRECTION
      ?auto_30635 - MODE
    )
    :vars
    (
      ?auto_30638 - INSTRUMENT
      ?auto_30639 - SATELLITE
      ?auto_30636 - DIRECTION
      ?auto_30637 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30638 ?auto_30639 ) ( SUPPORTS ?auto_30638 ?auto_30628 ) ( not ( = ?auto_30631 ?auto_30636 ) ) ( HAVE_IMAGE ?auto_30629 ?auto_30635 ) ( not ( = ?auto_30629 ?auto_30631 ) ) ( not ( = ?auto_30629 ?auto_30636 ) ) ( not ( = ?auto_30635 ?auto_30628 ) ) ( CALIBRATION_TARGET ?auto_30638 ?auto_30636 ) ( POINTING ?auto_30639 ?auto_30629 ) ( ON_BOARD ?auto_30637 ?auto_30639 ) ( POWER_ON ?auto_30637 ) ( not ( = ?auto_30638 ?auto_30637 ) ) ( HAVE_IMAGE ?auto_30629 ?auto_30630 ) ( HAVE_IMAGE ?auto_30632 ?auto_30633 ) ( HAVE_IMAGE ?auto_30634 ?auto_30635 ) ( not ( = ?auto_30629 ?auto_30632 ) ) ( not ( = ?auto_30629 ?auto_30634 ) ) ( not ( = ?auto_30630 ?auto_30628 ) ) ( not ( = ?auto_30630 ?auto_30633 ) ) ( not ( = ?auto_30630 ?auto_30635 ) ) ( not ( = ?auto_30631 ?auto_30632 ) ) ( not ( = ?auto_30631 ?auto_30634 ) ) ( not ( = ?auto_30628 ?auto_30633 ) ) ( not ( = ?auto_30632 ?auto_30634 ) ) ( not ( = ?auto_30632 ?auto_30636 ) ) ( not ( = ?auto_30633 ?auto_30635 ) ) ( not ( = ?auto_30634 ?auto_30636 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30629 ?auto_30635 ?auto_30631 ?auto_30628 )
      ( GET-4IMAGE-VERIFY ?auto_30629 ?auto_30630 ?auto_30631 ?auto_30628 ?auto_30632 ?auto_30633 ?auto_30634 ?auto_30635 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30677 - DIRECTION
      ?auto_30678 - MODE
      ?auto_30679 - DIRECTION
      ?auto_30676 - MODE
      ?auto_30680 - DIRECTION
      ?auto_30681 - MODE
      ?auto_30682 - DIRECTION
      ?auto_30683 - MODE
    )
    :vars
    (
      ?auto_30686 - INSTRUMENT
      ?auto_30687 - SATELLITE
      ?auto_30684 - DIRECTION
      ?auto_30685 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30686 ?auto_30687 ) ( SUPPORTS ?auto_30686 ?auto_30678 ) ( not ( = ?auto_30677 ?auto_30684 ) ) ( HAVE_IMAGE ?auto_30682 ?auto_30683 ) ( not ( = ?auto_30682 ?auto_30677 ) ) ( not ( = ?auto_30682 ?auto_30684 ) ) ( not ( = ?auto_30683 ?auto_30678 ) ) ( CALIBRATION_TARGET ?auto_30686 ?auto_30684 ) ( POINTING ?auto_30687 ?auto_30682 ) ( ON_BOARD ?auto_30685 ?auto_30687 ) ( POWER_ON ?auto_30685 ) ( not ( = ?auto_30686 ?auto_30685 ) ) ( HAVE_IMAGE ?auto_30679 ?auto_30676 ) ( HAVE_IMAGE ?auto_30680 ?auto_30681 ) ( not ( = ?auto_30677 ?auto_30679 ) ) ( not ( = ?auto_30677 ?auto_30680 ) ) ( not ( = ?auto_30678 ?auto_30676 ) ) ( not ( = ?auto_30678 ?auto_30681 ) ) ( not ( = ?auto_30679 ?auto_30680 ) ) ( not ( = ?auto_30679 ?auto_30682 ) ) ( not ( = ?auto_30679 ?auto_30684 ) ) ( not ( = ?auto_30676 ?auto_30681 ) ) ( not ( = ?auto_30676 ?auto_30683 ) ) ( not ( = ?auto_30680 ?auto_30682 ) ) ( not ( = ?auto_30680 ?auto_30684 ) ) ( not ( = ?auto_30681 ?auto_30683 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30682 ?auto_30683 ?auto_30677 ?auto_30678 )
      ( GET-4IMAGE-VERIFY ?auto_30677 ?auto_30678 ?auto_30679 ?auto_30676 ?auto_30680 ?auto_30681 ?auto_30682 ?auto_30683 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_30774 - DIRECTION
      ?auto_30775 - MODE
    )
    :vars
    (
      ?auto_30778 - INSTRUMENT
      ?auto_30779 - SATELLITE
      ?auto_30776 - DIRECTION
      ?auto_30781 - DIRECTION
      ?auto_30780 - MODE
      ?auto_30777 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30778 ?auto_30779 ) ( SUPPORTS ?auto_30778 ?auto_30775 ) ( not ( = ?auto_30774 ?auto_30776 ) ) ( not ( = ?auto_30781 ?auto_30774 ) ) ( not ( = ?auto_30781 ?auto_30776 ) ) ( not ( = ?auto_30780 ?auto_30775 ) ) ( CALIBRATION_TARGET ?auto_30778 ?auto_30776 ) ( POINTING ?auto_30779 ?auto_30781 ) ( ON_BOARD ?auto_30777 ?auto_30779 ) ( POWER_ON ?auto_30777 ) ( not ( = ?auto_30778 ?auto_30777 ) ) ( CALIBRATED ?auto_30777 ) ( SUPPORTS ?auto_30777 ?auto_30780 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_30781 ?auto_30780 )
      ( GET-2IMAGE ?auto_30781 ?auto_30780 ?auto_30774 ?auto_30775 )
      ( GET-1IMAGE-VERIFY ?auto_30774 ?auto_30775 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30783 - DIRECTION
      ?auto_30784 - MODE
      ?auto_30785 - DIRECTION
      ?auto_30782 - MODE
    )
    :vars
    (
      ?auto_30789 - INSTRUMENT
      ?auto_30788 - SATELLITE
      ?auto_30787 - DIRECTION
      ?auto_30786 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30789 ?auto_30788 ) ( SUPPORTS ?auto_30789 ?auto_30782 ) ( not ( = ?auto_30785 ?auto_30787 ) ) ( not ( = ?auto_30783 ?auto_30785 ) ) ( not ( = ?auto_30783 ?auto_30787 ) ) ( not ( = ?auto_30784 ?auto_30782 ) ) ( CALIBRATION_TARGET ?auto_30789 ?auto_30787 ) ( POINTING ?auto_30788 ?auto_30783 ) ( ON_BOARD ?auto_30786 ?auto_30788 ) ( POWER_ON ?auto_30786 ) ( not ( = ?auto_30789 ?auto_30786 ) ) ( CALIBRATED ?auto_30786 ) ( SUPPORTS ?auto_30786 ?auto_30784 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_30785 ?auto_30782 )
      ( GET-2IMAGE-VERIFY ?auto_30783 ?auto_30784 ?auto_30785 ?auto_30782 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30791 - DIRECTION
      ?auto_30792 - MODE
      ?auto_30793 - DIRECTION
      ?auto_30790 - MODE
    )
    :vars
    (
      ?auto_30796 - INSTRUMENT
      ?auto_30797 - SATELLITE
      ?auto_30794 - DIRECTION
      ?auto_30795 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_30796 ?auto_30797 ) ( SUPPORTS ?auto_30796 ?auto_30792 ) ( not ( = ?auto_30791 ?auto_30794 ) ) ( not ( = ?auto_30793 ?auto_30791 ) ) ( not ( = ?auto_30793 ?auto_30794 ) ) ( not ( = ?auto_30790 ?auto_30792 ) ) ( CALIBRATION_TARGET ?auto_30796 ?auto_30794 ) ( POINTING ?auto_30797 ?auto_30793 ) ( ON_BOARD ?auto_30795 ?auto_30797 ) ( POWER_ON ?auto_30795 ) ( not ( = ?auto_30796 ?auto_30795 ) ) ( CALIBRATED ?auto_30795 ) ( SUPPORTS ?auto_30795 ?auto_30790 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30793 ?auto_30790 ?auto_30791 ?auto_30792 )
      ( GET-2IMAGE-VERIFY ?auto_30791 ?auto_30792 ?auto_30793 ?auto_30790 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_31062 - DIRECTION
      ?auto_31063 - MODE
    )
    :vars
    (
      ?auto_31066 - INSTRUMENT
      ?auto_31067 - SATELLITE
      ?auto_31064 - DIRECTION
      ?auto_31068 - DIRECTION
      ?auto_31069 - MODE
      ?auto_31065 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31066 ?auto_31067 ) ( SUPPORTS ?auto_31066 ?auto_31063 ) ( not ( = ?auto_31062 ?auto_31064 ) ) ( not ( = ?auto_31068 ?auto_31062 ) ) ( not ( = ?auto_31068 ?auto_31064 ) ) ( not ( = ?auto_31069 ?auto_31063 ) ) ( CALIBRATION_TARGET ?auto_31066 ?auto_31064 ) ( ON_BOARD ?auto_31065 ?auto_31067 ) ( POWER_ON ?auto_31065 ) ( not ( = ?auto_31066 ?auto_31065 ) ) ( CALIBRATED ?auto_31065 ) ( SUPPORTS ?auto_31065 ?auto_31069 ) ( POINTING ?auto_31067 ?auto_31064 ) )
    :subtasks
    ( ( !TURN_TO ?auto_31067 ?auto_31068 ?auto_31064 )
      ( GET-2IMAGE ?auto_31068 ?auto_31069 ?auto_31062 ?auto_31063 )
      ( GET-1IMAGE-VERIFY ?auto_31062 ?auto_31063 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31071 - DIRECTION
      ?auto_31072 - MODE
      ?auto_31073 - DIRECTION
      ?auto_31070 - MODE
    )
    :vars
    (
      ?auto_31074 - INSTRUMENT
      ?auto_31077 - SATELLITE
      ?auto_31076 - DIRECTION
      ?auto_31075 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31074 ?auto_31077 ) ( SUPPORTS ?auto_31074 ?auto_31070 ) ( not ( = ?auto_31073 ?auto_31076 ) ) ( not ( = ?auto_31071 ?auto_31073 ) ) ( not ( = ?auto_31071 ?auto_31076 ) ) ( not ( = ?auto_31072 ?auto_31070 ) ) ( CALIBRATION_TARGET ?auto_31074 ?auto_31076 ) ( ON_BOARD ?auto_31075 ?auto_31077 ) ( POWER_ON ?auto_31075 ) ( not ( = ?auto_31074 ?auto_31075 ) ) ( CALIBRATED ?auto_31075 ) ( SUPPORTS ?auto_31075 ?auto_31072 ) ( POINTING ?auto_31077 ?auto_31076 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_31073 ?auto_31070 )
      ( GET-2IMAGE-VERIFY ?auto_31071 ?auto_31072 ?auto_31073 ?auto_31070 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31079 - DIRECTION
      ?auto_31080 - MODE
      ?auto_31081 - DIRECTION
      ?auto_31078 - MODE
    )
    :vars
    (
      ?auto_31085 - INSTRUMENT
      ?auto_31084 - SATELLITE
      ?auto_31082 - DIRECTION
      ?auto_31083 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31085 ?auto_31084 ) ( SUPPORTS ?auto_31085 ?auto_31080 ) ( not ( = ?auto_31079 ?auto_31082 ) ) ( not ( = ?auto_31081 ?auto_31079 ) ) ( not ( = ?auto_31081 ?auto_31082 ) ) ( not ( = ?auto_31078 ?auto_31080 ) ) ( CALIBRATION_TARGET ?auto_31085 ?auto_31082 ) ( ON_BOARD ?auto_31083 ?auto_31084 ) ( POWER_ON ?auto_31083 ) ( not ( = ?auto_31085 ?auto_31083 ) ) ( CALIBRATED ?auto_31083 ) ( SUPPORTS ?auto_31083 ?auto_31078 ) ( POINTING ?auto_31084 ?auto_31082 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31081 ?auto_31078 ?auto_31079 ?auto_31080 )
      ( GET-2IMAGE-VERIFY ?auto_31079 ?auto_31080 ?auto_31081 ?auto_31078 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_31350 - DIRECTION
      ?auto_31351 - MODE
    )
    :vars
    (
      ?auto_31355 - INSTRUMENT
      ?auto_31354 - SATELLITE
      ?auto_31352 - DIRECTION
      ?auto_31357 - DIRECTION
      ?auto_31356 - MODE
      ?auto_31353 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31355 ?auto_31354 ) ( SUPPORTS ?auto_31355 ?auto_31351 ) ( not ( = ?auto_31350 ?auto_31352 ) ) ( not ( = ?auto_31357 ?auto_31350 ) ) ( not ( = ?auto_31357 ?auto_31352 ) ) ( not ( = ?auto_31356 ?auto_31351 ) ) ( CALIBRATION_TARGET ?auto_31355 ?auto_31352 ) ( ON_BOARD ?auto_31353 ?auto_31354 ) ( POWER_ON ?auto_31353 ) ( not ( = ?auto_31355 ?auto_31353 ) ) ( SUPPORTS ?auto_31353 ?auto_31356 ) ( POINTING ?auto_31354 ?auto_31352 ) ( CALIBRATION_TARGET ?auto_31353 ?auto_31352 ) ( NOT_CALIBRATED ?auto_31353 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_31354 ?auto_31353 ?auto_31352 )
      ( GET-2IMAGE ?auto_31357 ?auto_31356 ?auto_31350 ?auto_31351 )
      ( GET-1IMAGE-VERIFY ?auto_31350 ?auto_31351 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31359 - DIRECTION
      ?auto_31360 - MODE
      ?auto_31361 - DIRECTION
      ?auto_31358 - MODE
    )
    :vars
    (
      ?auto_31363 - INSTRUMENT
      ?auto_31365 - SATELLITE
      ?auto_31362 - DIRECTION
      ?auto_31364 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31363 ?auto_31365 ) ( SUPPORTS ?auto_31363 ?auto_31358 ) ( not ( = ?auto_31361 ?auto_31362 ) ) ( not ( = ?auto_31359 ?auto_31361 ) ) ( not ( = ?auto_31359 ?auto_31362 ) ) ( not ( = ?auto_31360 ?auto_31358 ) ) ( CALIBRATION_TARGET ?auto_31363 ?auto_31362 ) ( ON_BOARD ?auto_31364 ?auto_31365 ) ( POWER_ON ?auto_31364 ) ( not ( = ?auto_31363 ?auto_31364 ) ) ( SUPPORTS ?auto_31364 ?auto_31360 ) ( POINTING ?auto_31365 ?auto_31362 ) ( CALIBRATION_TARGET ?auto_31364 ?auto_31362 ) ( NOT_CALIBRATED ?auto_31364 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_31361 ?auto_31358 )
      ( GET-2IMAGE-VERIFY ?auto_31359 ?auto_31360 ?auto_31361 ?auto_31358 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31367 - DIRECTION
      ?auto_31368 - MODE
      ?auto_31369 - DIRECTION
      ?auto_31366 - MODE
    )
    :vars
    (
      ?auto_31371 - INSTRUMENT
      ?auto_31370 - SATELLITE
      ?auto_31372 - DIRECTION
      ?auto_31373 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31371 ?auto_31370 ) ( SUPPORTS ?auto_31371 ?auto_31368 ) ( not ( = ?auto_31367 ?auto_31372 ) ) ( not ( = ?auto_31369 ?auto_31367 ) ) ( not ( = ?auto_31369 ?auto_31372 ) ) ( not ( = ?auto_31366 ?auto_31368 ) ) ( CALIBRATION_TARGET ?auto_31371 ?auto_31372 ) ( ON_BOARD ?auto_31373 ?auto_31370 ) ( POWER_ON ?auto_31373 ) ( not ( = ?auto_31371 ?auto_31373 ) ) ( SUPPORTS ?auto_31373 ?auto_31366 ) ( POINTING ?auto_31370 ?auto_31372 ) ( CALIBRATION_TARGET ?auto_31373 ?auto_31372 ) ( NOT_CALIBRATED ?auto_31373 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31369 ?auto_31366 ?auto_31367 ?auto_31368 )
      ( GET-2IMAGE-VERIFY ?auto_31367 ?auto_31368 ?auto_31369 ?auto_31366 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_33678 - DIRECTION
      ?auto_33679 - MODE
      ?auto_33680 - DIRECTION
      ?auto_33677 - MODE
      ?auto_33681 - DIRECTION
      ?auto_33682 - MODE
    )
    :vars
    (
      ?auto_33685 - INSTRUMENT
      ?auto_33683 - SATELLITE
      ?auto_33684 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_33685 ) ( ON_BOARD ?auto_33685 ?auto_33683 ) ( SUPPORTS ?auto_33685 ?auto_33682 ) ( POWER_ON ?auto_33685 ) ( POINTING ?auto_33683 ?auto_33684 ) ( not ( = ?auto_33681 ?auto_33684 ) ) ( HAVE_IMAGE ?auto_33678 ?auto_33679 ) ( not ( = ?auto_33678 ?auto_33681 ) ) ( not ( = ?auto_33678 ?auto_33684 ) ) ( not ( = ?auto_33679 ?auto_33682 ) ) ( HAVE_IMAGE ?auto_33680 ?auto_33677 ) ( not ( = ?auto_33678 ?auto_33680 ) ) ( not ( = ?auto_33679 ?auto_33677 ) ) ( not ( = ?auto_33680 ?auto_33681 ) ) ( not ( = ?auto_33680 ?auto_33684 ) ) ( not ( = ?auto_33677 ?auto_33682 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33678 ?auto_33679 ?auto_33681 ?auto_33682 )
      ( GET-3IMAGE-VERIFY ?auto_33678 ?auto_33679 ?auto_33680 ?auto_33677 ?auto_33681 ?auto_33682 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_33693 - DIRECTION
      ?auto_33694 - MODE
      ?auto_33695 - DIRECTION
      ?auto_33692 - MODE
      ?auto_33696 - DIRECTION
      ?auto_33697 - MODE
    )
    :vars
    (
      ?auto_33700 - INSTRUMENT
      ?auto_33698 - SATELLITE
      ?auto_33699 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_33700 ) ( ON_BOARD ?auto_33700 ?auto_33698 ) ( SUPPORTS ?auto_33700 ?auto_33692 ) ( POWER_ON ?auto_33700 ) ( POINTING ?auto_33698 ?auto_33699 ) ( not ( = ?auto_33695 ?auto_33699 ) ) ( HAVE_IMAGE ?auto_33696 ?auto_33694 ) ( not ( = ?auto_33696 ?auto_33695 ) ) ( not ( = ?auto_33696 ?auto_33699 ) ) ( not ( = ?auto_33694 ?auto_33692 ) ) ( HAVE_IMAGE ?auto_33693 ?auto_33694 ) ( HAVE_IMAGE ?auto_33696 ?auto_33697 ) ( not ( = ?auto_33693 ?auto_33695 ) ) ( not ( = ?auto_33693 ?auto_33696 ) ) ( not ( = ?auto_33693 ?auto_33699 ) ) ( not ( = ?auto_33694 ?auto_33697 ) ) ( not ( = ?auto_33692 ?auto_33697 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33696 ?auto_33694 ?auto_33695 ?auto_33692 )
      ( GET-3IMAGE-VERIFY ?auto_33693 ?auto_33694 ?auto_33695 ?auto_33692 ?auto_33696 ?auto_33697 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_33702 - DIRECTION
      ?auto_33703 - MODE
      ?auto_33704 - DIRECTION
      ?auto_33701 - MODE
      ?auto_33705 - DIRECTION
      ?auto_33706 - MODE
    )
    :vars
    (
      ?auto_33709 - INSTRUMENT
      ?auto_33707 - SATELLITE
      ?auto_33708 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_33709 ) ( ON_BOARD ?auto_33709 ?auto_33707 ) ( SUPPORTS ?auto_33709 ?auto_33701 ) ( POWER_ON ?auto_33709 ) ( POINTING ?auto_33707 ?auto_33708 ) ( not ( = ?auto_33704 ?auto_33708 ) ) ( HAVE_IMAGE ?auto_33702 ?auto_33703 ) ( not ( = ?auto_33702 ?auto_33704 ) ) ( not ( = ?auto_33702 ?auto_33708 ) ) ( not ( = ?auto_33703 ?auto_33701 ) ) ( HAVE_IMAGE ?auto_33705 ?auto_33706 ) ( not ( = ?auto_33702 ?auto_33705 ) ) ( not ( = ?auto_33703 ?auto_33706 ) ) ( not ( = ?auto_33704 ?auto_33705 ) ) ( not ( = ?auto_33701 ?auto_33706 ) ) ( not ( = ?auto_33705 ?auto_33708 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33702 ?auto_33703 ?auto_33704 ?auto_33701 )
      ( GET-3IMAGE-VERIFY ?auto_33702 ?auto_33703 ?auto_33704 ?auto_33701 ?auto_33705 ?auto_33706 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_33726 - DIRECTION
      ?auto_33727 - MODE
      ?auto_33728 - DIRECTION
      ?auto_33725 - MODE
      ?auto_33729 - DIRECTION
      ?auto_33730 - MODE
    )
    :vars
    (
      ?auto_33734 - INSTRUMENT
      ?auto_33732 - SATELLITE
      ?auto_33733 - DIRECTION
      ?auto_33735 - DIRECTION
      ?auto_33731 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_33734 ) ( ON_BOARD ?auto_33734 ?auto_33732 ) ( SUPPORTS ?auto_33734 ?auto_33730 ) ( POWER_ON ?auto_33734 ) ( POINTING ?auto_33732 ?auto_33733 ) ( not ( = ?auto_33729 ?auto_33733 ) ) ( HAVE_IMAGE ?auto_33735 ?auto_33731 ) ( not ( = ?auto_33735 ?auto_33729 ) ) ( not ( = ?auto_33735 ?auto_33733 ) ) ( not ( = ?auto_33731 ?auto_33730 ) ) ( HAVE_IMAGE ?auto_33726 ?auto_33727 ) ( HAVE_IMAGE ?auto_33728 ?auto_33725 ) ( not ( = ?auto_33726 ?auto_33728 ) ) ( not ( = ?auto_33726 ?auto_33729 ) ) ( not ( = ?auto_33726 ?auto_33733 ) ) ( not ( = ?auto_33726 ?auto_33735 ) ) ( not ( = ?auto_33727 ?auto_33725 ) ) ( not ( = ?auto_33727 ?auto_33730 ) ) ( not ( = ?auto_33727 ?auto_33731 ) ) ( not ( = ?auto_33728 ?auto_33729 ) ) ( not ( = ?auto_33728 ?auto_33733 ) ) ( not ( = ?auto_33728 ?auto_33735 ) ) ( not ( = ?auto_33725 ?auto_33730 ) ) ( not ( = ?auto_33725 ?auto_33731 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33735 ?auto_33731 ?auto_33729 ?auto_33730 )
      ( GET-3IMAGE-VERIFY ?auto_33726 ?auto_33727 ?auto_33728 ?auto_33725 ?auto_33729 ?auto_33730 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_33743 - DIRECTION
      ?auto_33744 - MODE
      ?auto_33745 - DIRECTION
      ?auto_33742 - MODE
      ?auto_33746 - DIRECTION
      ?auto_33747 - MODE
    )
    :vars
    (
      ?auto_33751 - INSTRUMENT
      ?auto_33749 - SATELLITE
      ?auto_33750 - DIRECTION
      ?auto_33752 - DIRECTION
      ?auto_33748 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_33751 ) ( ON_BOARD ?auto_33751 ?auto_33749 ) ( SUPPORTS ?auto_33751 ?auto_33742 ) ( POWER_ON ?auto_33751 ) ( POINTING ?auto_33749 ?auto_33750 ) ( not ( = ?auto_33745 ?auto_33750 ) ) ( HAVE_IMAGE ?auto_33752 ?auto_33748 ) ( not ( = ?auto_33752 ?auto_33745 ) ) ( not ( = ?auto_33752 ?auto_33750 ) ) ( not ( = ?auto_33748 ?auto_33742 ) ) ( HAVE_IMAGE ?auto_33743 ?auto_33744 ) ( HAVE_IMAGE ?auto_33746 ?auto_33747 ) ( not ( = ?auto_33743 ?auto_33745 ) ) ( not ( = ?auto_33743 ?auto_33746 ) ) ( not ( = ?auto_33743 ?auto_33750 ) ) ( not ( = ?auto_33743 ?auto_33752 ) ) ( not ( = ?auto_33744 ?auto_33742 ) ) ( not ( = ?auto_33744 ?auto_33747 ) ) ( not ( = ?auto_33744 ?auto_33748 ) ) ( not ( = ?auto_33745 ?auto_33746 ) ) ( not ( = ?auto_33742 ?auto_33747 ) ) ( not ( = ?auto_33746 ?auto_33750 ) ) ( not ( = ?auto_33746 ?auto_33752 ) ) ( not ( = ?auto_33747 ?auto_33748 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33752 ?auto_33748 ?auto_33745 ?auto_33742 )
      ( GET-3IMAGE-VERIFY ?auto_33743 ?auto_33744 ?auto_33745 ?auto_33742 ?auto_33746 ?auto_33747 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_33765 - DIRECTION
      ?auto_33766 - MODE
      ?auto_33767 - DIRECTION
      ?auto_33764 - MODE
      ?auto_33768 - DIRECTION
      ?auto_33769 - MODE
    )
    :vars
    (
      ?auto_33772 - INSTRUMENT
      ?auto_33770 - SATELLITE
      ?auto_33771 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_33772 ) ( ON_BOARD ?auto_33772 ?auto_33770 ) ( SUPPORTS ?auto_33772 ?auto_33766 ) ( POWER_ON ?auto_33772 ) ( POINTING ?auto_33770 ?auto_33771 ) ( not ( = ?auto_33765 ?auto_33771 ) ) ( HAVE_IMAGE ?auto_33767 ?auto_33764 ) ( not ( = ?auto_33767 ?auto_33765 ) ) ( not ( = ?auto_33767 ?auto_33771 ) ) ( not ( = ?auto_33764 ?auto_33766 ) ) ( HAVE_IMAGE ?auto_33768 ?auto_33769 ) ( not ( = ?auto_33765 ?auto_33768 ) ) ( not ( = ?auto_33766 ?auto_33769 ) ) ( not ( = ?auto_33767 ?auto_33768 ) ) ( not ( = ?auto_33764 ?auto_33769 ) ) ( not ( = ?auto_33768 ?auto_33771 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33767 ?auto_33764 ?auto_33765 ?auto_33766 )
      ( GET-3IMAGE-VERIFY ?auto_33765 ?auto_33766 ?auto_33767 ?auto_33764 ?auto_33768 ?auto_33769 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_33795 - DIRECTION
      ?auto_33796 - MODE
      ?auto_33797 - DIRECTION
      ?auto_33794 - MODE
      ?auto_33798 - DIRECTION
      ?auto_33799 - MODE
    )
    :vars
    (
      ?auto_33803 - INSTRUMENT
      ?auto_33801 - SATELLITE
      ?auto_33802 - DIRECTION
      ?auto_33804 - DIRECTION
      ?auto_33800 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_33803 ) ( ON_BOARD ?auto_33803 ?auto_33801 ) ( SUPPORTS ?auto_33803 ?auto_33796 ) ( POWER_ON ?auto_33803 ) ( POINTING ?auto_33801 ?auto_33802 ) ( not ( = ?auto_33795 ?auto_33802 ) ) ( HAVE_IMAGE ?auto_33804 ?auto_33800 ) ( not ( = ?auto_33804 ?auto_33795 ) ) ( not ( = ?auto_33804 ?auto_33802 ) ) ( not ( = ?auto_33800 ?auto_33796 ) ) ( HAVE_IMAGE ?auto_33797 ?auto_33794 ) ( HAVE_IMAGE ?auto_33798 ?auto_33799 ) ( not ( = ?auto_33795 ?auto_33797 ) ) ( not ( = ?auto_33795 ?auto_33798 ) ) ( not ( = ?auto_33796 ?auto_33794 ) ) ( not ( = ?auto_33796 ?auto_33799 ) ) ( not ( = ?auto_33797 ?auto_33798 ) ) ( not ( = ?auto_33797 ?auto_33802 ) ) ( not ( = ?auto_33797 ?auto_33804 ) ) ( not ( = ?auto_33794 ?auto_33799 ) ) ( not ( = ?auto_33794 ?auto_33800 ) ) ( not ( = ?auto_33798 ?auto_33802 ) ) ( not ( = ?auto_33798 ?auto_33804 ) ) ( not ( = ?auto_33799 ?auto_33800 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33804 ?auto_33800 ?auto_33795 ?auto_33796 )
      ( GET-3IMAGE-VERIFY ?auto_33795 ?auto_33796 ?auto_33797 ?auto_33794 ?auto_33798 ?auto_33799 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_33848 - DIRECTION
      ?auto_33849 - MODE
      ?auto_33850 - DIRECTION
      ?auto_33847 - MODE
      ?auto_33851 - DIRECTION
      ?auto_33852 - MODE
      ?auto_33853 - DIRECTION
      ?auto_33854 - MODE
    )
    :vars
    (
      ?auto_33857 - INSTRUMENT
      ?auto_33855 - SATELLITE
      ?auto_33856 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_33857 ) ( ON_BOARD ?auto_33857 ?auto_33855 ) ( SUPPORTS ?auto_33857 ?auto_33854 ) ( POWER_ON ?auto_33857 ) ( POINTING ?auto_33855 ?auto_33856 ) ( not ( = ?auto_33853 ?auto_33856 ) ) ( HAVE_IMAGE ?auto_33848 ?auto_33847 ) ( not ( = ?auto_33848 ?auto_33853 ) ) ( not ( = ?auto_33848 ?auto_33856 ) ) ( not ( = ?auto_33847 ?auto_33854 ) ) ( HAVE_IMAGE ?auto_33848 ?auto_33849 ) ( HAVE_IMAGE ?auto_33850 ?auto_33847 ) ( HAVE_IMAGE ?auto_33851 ?auto_33852 ) ( not ( = ?auto_33848 ?auto_33850 ) ) ( not ( = ?auto_33848 ?auto_33851 ) ) ( not ( = ?auto_33849 ?auto_33847 ) ) ( not ( = ?auto_33849 ?auto_33852 ) ) ( not ( = ?auto_33849 ?auto_33854 ) ) ( not ( = ?auto_33850 ?auto_33851 ) ) ( not ( = ?auto_33850 ?auto_33853 ) ) ( not ( = ?auto_33850 ?auto_33856 ) ) ( not ( = ?auto_33847 ?auto_33852 ) ) ( not ( = ?auto_33851 ?auto_33853 ) ) ( not ( = ?auto_33851 ?auto_33856 ) ) ( not ( = ?auto_33852 ?auto_33854 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33848 ?auto_33847 ?auto_33853 ?auto_33854 )
      ( GET-4IMAGE-VERIFY ?auto_33848 ?auto_33849 ?auto_33850 ?auto_33847 ?auto_33851 ?auto_33852 ?auto_33853 ?auto_33854 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_33859 - DIRECTION
      ?auto_33860 - MODE
      ?auto_33861 - DIRECTION
      ?auto_33858 - MODE
      ?auto_33862 - DIRECTION
      ?auto_33863 - MODE
      ?auto_33864 - DIRECTION
      ?auto_33865 - MODE
    )
    :vars
    (
      ?auto_33868 - INSTRUMENT
      ?auto_33866 - SATELLITE
      ?auto_33867 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_33868 ) ( ON_BOARD ?auto_33868 ?auto_33866 ) ( SUPPORTS ?auto_33868 ?auto_33865 ) ( POWER_ON ?auto_33868 ) ( POINTING ?auto_33866 ?auto_33867 ) ( not ( = ?auto_33864 ?auto_33867 ) ) ( HAVE_IMAGE ?auto_33861 ?auto_33860 ) ( not ( = ?auto_33861 ?auto_33864 ) ) ( not ( = ?auto_33861 ?auto_33867 ) ) ( not ( = ?auto_33860 ?auto_33865 ) ) ( HAVE_IMAGE ?auto_33859 ?auto_33860 ) ( HAVE_IMAGE ?auto_33861 ?auto_33858 ) ( HAVE_IMAGE ?auto_33862 ?auto_33863 ) ( not ( = ?auto_33859 ?auto_33861 ) ) ( not ( = ?auto_33859 ?auto_33862 ) ) ( not ( = ?auto_33859 ?auto_33864 ) ) ( not ( = ?auto_33859 ?auto_33867 ) ) ( not ( = ?auto_33860 ?auto_33858 ) ) ( not ( = ?auto_33860 ?auto_33863 ) ) ( not ( = ?auto_33861 ?auto_33862 ) ) ( not ( = ?auto_33858 ?auto_33863 ) ) ( not ( = ?auto_33858 ?auto_33865 ) ) ( not ( = ?auto_33862 ?auto_33864 ) ) ( not ( = ?auto_33862 ?auto_33867 ) ) ( not ( = ?auto_33863 ?auto_33865 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33861 ?auto_33860 ?auto_33864 ?auto_33865 )
      ( GET-4IMAGE-VERIFY ?auto_33859 ?auto_33860 ?auto_33861 ?auto_33858 ?auto_33862 ?auto_33863 ?auto_33864 ?auto_33865 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_33870 - DIRECTION
      ?auto_33871 - MODE
      ?auto_33872 - DIRECTION
      ?auto_33869 - MODE
      ?auto_33873 - DIRECTION
      ?auto_33874 - MODE
      ?auto_33875 - DIRECTION
      ?auto_33876 - MODE
    )
    :vars
    (
      ?auto_33879 - INSTRUMENT
      ?auto_33877 - SATELLITE
      ?auto_33878 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_33879 ) ( ON_BOARD ?auto_33879 ?auto_33877 ) ( SUPPORTS ?auto_33879 ?auto_33874 ) ( POWER_ON ?auto_33879 ) ( POINTING ?auto_33877 ?auto_33878 ) ( not ( = ?auto_33873 ?auto_33878 ) ) ( HAVE_IMAGE ?auto_33872 ?auto_33876 ) ( not ( = ?auto_33872 ?auto_33873 ) ) ( not ( = ?auto_33872 ?auto_33878 ) ) ( not ( = ?auto_33876 ?auto_33874 ) ) ( HAVE_IMAGE ?auto_33870 ?auto_33871 ) ( HAVE_IMAGE ?auto_33872 ?auto_33869 ) ( HAVE_IMAGE ?auto_33875 ?auto_33876 ) ( not ( = ?auto_33870 ?auto_33872 ) ) ( not ( = ?auto_33870 ?auto_33873 ) ) ( not ( = ?auto_33870 ?auto_33875 ) ) ( not ( = ?auto_33870 ?auto_33878 ) ) ( not ( = ?auto_33871 ?auto_33869 ) ) ( not ( = ?auto_33871 ?auto_33874 ) ) ( not ( = ?auto_33871 ?auto_33876 ) ) ( not ( = ?auto_33872 ?auto_33875 ) ) ( not ( = ?auto_33869 ?auto_33874 ) ) ( not ( = ?auto_33869 ?auto_33876 ) ) ( not ( = ?auto_33873 ?auto_33875 ) ) ( not ( = ?auto_33875 ?auto_33878 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33872 ?auto_33876 ?auto_33873 ?auto_33874 )
      ( GET-4IMAGE-VERIFY ?auto_33870 ?auto_33871 ?auto_33872 ?auto_33869 ?auto_33873 ?auto_33874 ?auto_33875 ?auto_33876 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_33881 - DIRECTION
      ?auto_33882 - MODE
      ?auto_33883 - DIRECTION
      ?auto_33880 - MODE
      ?auto_33884 - DIRECTION
      ?auto_33885 - MODE
      ?auto_33886 - DIRECTION
      ?auto_33887 - MODE
    )
    :vars
    (
      ?auto_33890 - INSTRUMENT
      ?auto_33888 - SATELLITE
      ?auto_33889 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_33890 ) ( ON_BOARD ?auto_33890 ?auto_33888 ) ( SUPPORTS ?auto_33890 ?auto_33885 ) ( POWER_ON ?auto_33890 ) ( POINTING ?auto_33888 ?auto_33889 ) ( not ( = ?auto_33884 ?auto_33889 ) ) ( HAVE_IMAGE ?auto_33883 ?auto_33882 ) ( not ( = ?auto_33883 ?auto_33884 ) ) ( not ( = ?auto_33883 ?auto_33889 ) ) ( not ( = ?auto_33882 ?auto_33885 ) ) ( HAVE_IMAGE ?auto_33881 ?auto_33882 ) ( HAVE_IMAGE ?auto_33883 ?auto_33880 ) ( HAVE_IMAGE ?auto_33886 ?auto_33887 ) ( not ( = ?auto_33881 ?auto_33883 ) ) ( not ( = ?auto_33881 ?auto_33884 ) ) ( not ( = ?auto_33881 ?auto_33886 ) ) ( not ( = ?auto_33881 ?auto_33889 ) ) ( not ( = ?auto_33882 ?auto_33880 ) ) ( not ( = ?auto_33882 ?auto_33887 ) ) ( not ( = ?auto_33883 ?auto_33886 ) ) ( not ( = ?auto_33880 ?auto_33885 ) ) ( not ( = ?auto_33880 ?auto_33887 ) ) ( not ( = ?auto_33884 ?auto_33886 ) ) ( not ( = ?auto_33885 ?auto_33887 ) ) ( not ( = ?auto_33886 ?auto_33889 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33883 ?auto_33882 ?auto_33884 ?auto_33885 )
      ( GET-4IMAGE-VERIFY ?auto_33881 ?auto_33882 ?auto_33883 ?auto_33880 ?auto_33884 ?auto_33885 ?auto_33886 ?auto_33887 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_33903 - DIRECTION
      ?auto_33904 - MODE
      ?auto_33905 - DIRECTION
      ?auto_33902 - MODE
      ?auto_33906 - DIRECTION
      ?auto_33907 - MODE
      ?auto_33908 - DIRECTION
      ?auto_33909 - MODE
    )
    :vars
    (
      ?auto_33912 - INSTRUMENT
      ?auto_33910 - SATELLITE
      ?auto_33911 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_33912 ) ( ON_BOARD ?auto_33912 ?auto_33910 ) ( SUPPORTS ?auto_33912 ?auto_33909 ) ( POWER_ON ?auto_33912 ) ( POINTING ?auto_33910 ?auto_33911 ) ( not ( = ?auto_33908 ?auto_33911 ) ) ( HAVE_IMAGE ?auto_33903 ?auto_33904 ) ( not ( = ?auto_33903 ?auto_33908 ) ) ( not ( = ?auto_33903 ?auto_33911 ) ) ( not ( = ?auto_33904 ?auto_33909 ) ) ( HAVE_IMAGE ?auto_33905 ?auto_33902 ) ( HAVE_IMAGE ?auto_33906 ?auto_33907 ) ( not ( = ?auto_33903 ?auto_33905 ) ) ( not ( = ?auto_33903 ?auto_33906 ) ) ( not ( = ?auto_33904 ?auto_33902 ) ) ( not ( = ?auto_33904 ?auto_33907 ) ) ( not ( = ?auto_33905 ?auto_33906 ) ) ( not ( = ?auto_33905 ?auto_33908 ) ) ( not ( = ?auto_33905 ?auto_33911 ) ) ( not ( = ?auto_33902 ?auto_33907 ) ) ( not ( = ?auto_33902 ?auto_33909 ) ) ( not ( = ?auto_33906 ?auto_33908 ) ) ( not ( = ?auto_33906 ?auto_33911 ) ) ( not ( = ?auto_33907 ?auto_33909 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33903 ?auto_33904 ?auto_33908 ?auto_33909 )
      ( GET-4IMAGE-VERIFY ?auto_33903 ?auto_33904 ?auto_33905 ?auto_33902 ?auto_33906 ?auto_33907 ?auto_33908 ?auto_33909 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_33925 - DIRECTION
      ?auto_33926 - MODE
      ?auto_33927 - DIRECTION
      ?auto_33924 - MODE
      ?auto_33928 - DIRECTION
      ?auto_33929 - MODE
      ?auto_33930 - DIRECTION
      ?auto_33931 - MODE
    )
    :vars
    (
      ?auto_33934 - INSTRUMENT
      ?auto_33932 - SATELLITE
      ?auto_33933 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_33934 ) ( ON_BOARD ?auto_33934 ?auto_33932 ) ( SUPPORTS ?auto_33934 ?auto_33929 ) ( POWER_ON ?auto_33934 ) ( POINTING ?auto_33932 ?auto_33933 ) ( not ( = ?auto_33928 ?auto_33933 ) ) ( HAVE_IMAGE ?auto_33925 ?auto_33931 ) ( not ( = ?auto_33925 ?auto_33928 ) ) ( not ( = ?auto_33925 ?auto_33933 ) ) ( not ( = ?auto_33931 ?auto_33929 ) ) ( HAVE_IMAGE ?auto_33925 ?auto_33926 ) ( HAVE_IMAGE ?auto_33927 ?auto_33924 ) ( HAVE_IMAGE ?auto_33930 ?auto_33931 ) ( not ( = ?auto_33925 ?auto_33927 ) ) ( not ( = ?auto_33925 ?auto_33930 ) ) ( not ( = ?auto_33926 ?auto_33924 ) ) ( not ( = ?auto_33926 ?auto_33929 ) ) ( not ( = ?auto_33926 ?auto_33931 ) ) ( not ( = ?auto_33927 ?auto_33928 ) ) ( not ( = ?auto_33927 ?auto_33930 ) ) ( not ( = ?auto_33927 ?auto_33933 ) ) ( not ( = ?auto_33924 ?auto_33929 ) ) ( not ( = ?auto_33924 ?auto_33931 ) ) ( not ( = ?auto_33928 ?auto_33930 ) ) ( not ( = ?auto_33930 ?auto_33933 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33925 ?auto_33931 ?auto_33928 ?auto_33929 )
      ( GET-4IMAGE-VERIFY ?auto_33925 ?auto_33926 ?auto_33927 ?auto_33924 ?auto_33928 ?auto_33929 ?auto_33930 ?auto_33931 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_33936 - DIRECTION
      ?auto_33937 - MODE
      ?auto_33938 - DIRECTION
      ?auto_33935 - MODE
      ?auto_33939 - DIRECTION
      ?auto_33940 - MODE
      ?auto_33941 - DIRECTION
      ?auto_33942 - MODE
    )
    :vars
    (
      ?auto_33945 - INSTRUMENT
      ?auto_33943 - SATELLITE
      ?auto_33944 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_33945 ) ( ON_BOARD ?auto_33945 ?auto_33943 ) ( SUPPORTS ?auto_33945 ?auto_33940 ) ( POWER_ON ?auto_33945 ) ( POINTING ?auto_33943 ?auto_33944 ) ( not ( = ?auto_33939 ?auto_33944 ) ) ( HAVE_IMAGE ?auto_33936 ?auto_33937 ) ( not ( = ?auto_33936 ?auto_33939 ) ) ( not ( = ?auto_33936 ?auto_33944 ) ) ( not ( = ?auto_33937 ?auto_33940 ) ) ( HAVE_IMAGE ?auto_33938 ?auto_33935 ) ( HAVE_IMAGE ?auto_33941 ?auto_33942 ) ( not ( = ?auto_33936 ?auto_33938 ) ) ( not ( = ?auto_33936 ?auto_33941 ) ) ( not ( = ?auto_33937 ?auto_33935 ) ) ( not ( = ?auto_33937 ?auto_33942 ) ) ( not ( = ?auto_33938 ?auto_33939 ) ) ( not ( = ?auto_33938 ?auto_33941 ) ) ( not ( = ?auto_33938 ?auto_33944 ) ) ( not ( = ?auto_33935 ?auto_33940 ) ) ( not ( = ?auto_33935 ?auto_33942 ) ) ( not ( = ?auto_33939 ?auto_33941 ) ) ( not ( = ?auto_33940 ?auto_33942 ) ) ( not ( = ?auto_33941 ?auto_33944 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33936 ?auto_33937 ?auto_33939 ?auto_33940 )
      ( GET-4IMAGE-VERIFY ?auto_33936 ?auto_33937 ?auto_33938 ?auto_33935 ?auto_33939 ?auto_33940 ?auto_33941 ?auto_33942 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_33958 - DIRECTION
      ?auto_33959 - MODE
      ?auto_33960 - DIRECTION
      ?auto_33957 - MODE
      ?auto_33961 - DIRECTION
      ?auto_33962 - MODE
      ?auto_33963 - DIRECTION
      ?auto_33964 - MODE
    )
    :vars
    (
      ?auto_33967 - INSTRUMENT
      ?auto_33965 - SATELLITE
      ?auto_33966 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_33967 ) ( ON_BOARD ?auto_33967 ?auto_33965 ) ( SUPPORTS ?auto_33967 ?auto_33957 ) ( POWER_ON ?auto_33967 ) ( POINTING ?auto_33965 ?auto_33966 ) ( not ( = ?auto_33960 ?auto_33966 ) ) ( HAVE_IMAGE ?auto_33958 ?auto_33964 ) ( not ( = ?auto_33958 ?auto_33960 ) ) ( not ( = ?auto_33958 ?auto_33966 ) ) ( not ( = ?auto_33964 ?auto_33957 ) ) ( HAVE_IMAGE ?auto_33958 ?auto_33959 ) ( HAVE_IMAGE ?auto_33961 ?auto_33962 ) ( HAVE_IMAGE ?auto_33963 ?auto_33964 ) ( not ( = ?auto_33958 ?auto_33961 ) ) ( not ( = ?auto_33958 ?auto_33963 ) ) ( not ( = ?auto_33959 ?auto_33957 ) ) ( not ( = ?auto_33959 ?auto_33962 ) ) ( not ( = ?auto_33959 ?auto_33964 ) ) ( not ( = ?auto_33960 ?auto_33961 ) ) ( not ( = ?auto_33960 ?auto_33963 ) ) ( not ( = ?auto_33957 ?auto_33962 ) ) ( not ( = ?auto_33961 ?auto_33963 ) ) ( not ( = ?auto_33961 ?auto_33966 ) ) ( not ( = ?auto_33962 ?auto_33964 ) ) ( not ( = ?auto_33963 ?auto_33966 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33958 ?auto_33964 ?auto_33960 ?auto_33957 )
      ( GET-4IMAGE-VERIFY ?auto_33958 ?auto_33959 ?auto_33960 ?auto_33957 ?auto_33961 ?auto_33962 ?auto_33963 ?auto_33964 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_33969 - DIRECTION
      ?auto_33970 - MODE
      ?auto_33971 - DIRECTION
      ?auto_33968 - MODE
      ?auto_33972 - DIRECTION
      ?auto_33973 - MODE
      ?auto_33974 - DIRECTION
      ?auto_33975 - MODE
    )
    :vars
    (
      ?auto_33978 - INSTRUMENT
      ?auto_33976 - SATELLITE
      ?auto_33977 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_33978 ) ( ON_BOARD ?auto_33978 ?auto_33976 ) ( SUPPORTS ?auto_33978 ?auto_33968 ) ( POWER_ON ?auto_33978 ) ( POINTING ?auto_33976 ?auto_33977 ) ( not ( = ?auto_33971 ?auto_33977 ) ) ( HAVE_IMAGE ?auto_33972 ?auto_33973 ) ( not ( = ?auto_33972 ?auto_33971 ) ) ( not ( = ?auto_33972 ?auto_33977 ) ) ( not ( = ?auto_33973 ?auto_33968 ) ) ( HAVE_IMAGE ?auto_33969 ?auto_33970 ) ( HAVE_IMAGE ?auto_33974 ?auto_33975 ) ( not ( = ?auto_33969 ?auto_33971 ) ) ( not ( = ?auto_33969 ?auto_33972 ) ) ( not ( = ?auto_33969 ?auto_33974 ) ) ( not ( = ?auto_33969 ?auto_33977 ) ) ( not ( = ?auto_33970 ?auto_33968 ) ) ( not ( = ?auto_33970 ?auto_33973 ) ) ( not ( = ?auto_33970 ?auto_33975 ) ) ( not ( = ?auto_33971 ?auto_33974 ) ) ( not ( = ?auto_33968 ?auto_33975 ) ) ( not ( = ?auto_33972 ?auto_33974 ) ) ( not ( = ?auto_33973 ?auto_33975 ) ) ( not ( = ?auto_33974 ?auto_33977 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33972 ?auto_33973 ?auto_33971 ?auto_33968 )
      ( GET-4IMAGE-VERIFY ?auto_33969 ?auto_33970 ?auto_33971 ?auto_33968 ?auto_33972 ?auto_33973 ?auto_33974 ?auto_33975 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34002 - DIRECTION
      ?auto_34003 - MODE
      ?auto_34004 - DIRECTION
      ?auto_34001 - MODE
      ?auto_34005 - DIRECTION
      ?auto_34006 - MODE
      ?auto_34007 - DIRECTION
      ?auto_34008 - MODE
    )
    :vars
    (
      ?auto_34011 - INSTRUMENT
      ?auto_34009 - SATELLITE
      ?auto_34010 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_34011 ) ( ON_BOARD ?auto_34011 ?auto_34009 ) ( SUPPORTS ?auto_34011 ?auto_34001 ) ( POWER_ON ?auto_34011 ) ( POINTING ?auto_34009 ?auto_34010 ) ( not ( = ?auto_34004 ?auto_34010 ) ) ( HAVE_IMAGE ?auto_34002 ?auto_34003 ) ( not ( = ?auto_34002 ?auto_34004 ) ) ( not ( = ?auto_34002 ?auto_34010 ) ) ( not ( = ?auto_34003 ?auto_34001 ) ) ( HAVE_IMAGE ?auto_34005 ?auto_34006 ) ( HAVE_IMAGE ?auto_34007 ?auto_34008 ) ( not ( = ?auto_34002 ?auto_34005 ) ) ( not ( = ?auto_34002 ?auto_34007 ) ) ( not ( = ?auto_34003 ?auto_34006 ) ) ( not ( = ?auto_34003 ?auto_34008 ) ) ( not ( = ?auto_34004 ?auto_34005 ) ) ( not ( = ?auto_34004 ?auto_34007 ) ) ( not ( = ?auto_34001 ?auto_34006 ) ) ( not ( = ?auto_34001 ?auto_34008 ) ) ( not ( = ?auto_34005 ?auto_34007 ) ) ( not ( = ?auto_34005 ?auto_34010 ) ) ( not ( = ?auto_34006 ?auto_34008 ) ) ( not ( = ?auto_34007 ?auto_34010 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34002 ?auto_34003 ?auto_34004 ?auto_34001 )
      ( GET-4IMAGE-VERIFY ?auto_34002 ?auto_34003 ?auto_34004 ?auto_34001 ?auto_34005 ?auto_34006 ?auto_34007 ?auto_34008 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34057 - DIRECTION
      ?auto_34058 - MODE
      ?auto_34059 - DIRECTION
      ?auto_34056 - MODE
      ?auto_34060 - DIRECTION
      ?auto_34061 - MODE
      ?auto_34062 - DIRECTION
      ?auto_34063 - MODE
    )
    :vars
    (
      ?auto_34066 - INSTRUMENT
      ?auto_34064 - SATELLITE
      ?auto_34065 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_34066 ) ( ON_BOARD ?auto_34066 ?auto_34064 ) ( SUPPORTS ?auto_34066 ?auto_34063 ) ( POWER_ON ?auto_34066 ) ( POINTING ?auto_34064 ?auto_34065 ) ( not ( = ?auto_34062 ?auto_34065 ) ) ( HAVE_IMAGE ?auto_34059 ?auto_34056 ) ( not ( = ?auto_34059 ?auto_34062 ) ) ( not ( = ?auto_34059 ?auto_34065 ) ) ( not ( = ?auto_34056 ?auto_34063 ) ) ( HAVE_IMAGE ?auto_34057 ?auto_34058 ) ( HAVE_IMAGE ?auto_34060 ?auto_34061 ) ( not ( = ?auto_34057 ?auto_34059 ) ) ( not ( = ?auto_34057 ?auto_34060 ) ) ( not ( = ?auto_34057 ?auto_34062 ) ) ( not ( = ?auto_34057 ?auto_34065 ) ) ( not ( = ?auto_34058 ?auto_34056 ) ) ( not ( = ?auto_34058 ?auto_34061 ) ) ( not ( = ?auto_34058 ?auto_34063 ) ) ( not ( = ?auto_34059 ?auto_34060 ) ) ( not ( = ?auto_34056 ?auto_34061 ) ) ( not ( = ?auto_34060 ?auto_34062 ) ) ( not ( = ?auto_34060 ?auto_34065 ) ) ( not ( = ?auto_34061 ?auto_34063 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34059 ?auto_34056 ?auto_34062 ?auto_34063 )
      ( GET-4IMAGE-VERIFY ?auto_34057 ?auto_34058 ?auto_34059 ?auto_34056 ?auto_34060 ?auto_34061 ?auto_34062 ?auto_34063 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34090 - DIRECTION
      ?auto_34091 - MODE
      ?auto_34092 - DIRECTION
      ?auto_34089 - MODE
      ?auto_34093 - DIRECTION
      ?auto_34094 - MODE
      ?auto_34095 - DIRECTION
      ?auto_34096 - MODE
    )
    :vars
    (
      ?auto_34099 - INSTRUMENT
      ?auto_34097 - SATELLITE
      ?auto_34098 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_34099 ) ( ON_BOARD ?auto_34099 ?auto_34097 ) ( SUPPORTS ?auto_34099 ?auto_34094 ) ( POWER_ON ?auto_34099 ) ( POINTING ?auto_34097 ?auto_34098 ) ( not ( = ?auto_34093 ?auto_34098 ) ) ( HAVE_IMAGE ?auto_34092 ?auto_34089 ) ( not ( = ?auto_34092 ?auto_34093 ) ) ( not ( = ?auto_34092 ?auto_34098 ) ) ( not ( = ?auto_34089 ?auto_34094 ) ) ( HAVE_IMAGE ?auto_34090 ?auto_34091 ) ( HAVE_IMAGE ?auto_34095 ?auto_34096 ) ( not ( = ?auto_34090 ?auto_34092 ) ) ( not ( = ?auto_34090 ?auto_34093 ) ) ( not ( = ?auto_34090 ?auto_34095 ) ) ( not ( = ?auto_34090 ?auto_34098 ) ) ( not ( = ?auto_34091 ?auto_34089 ) ) ( not ( = ?auto_34091 ?auto_34094 ) ) ( not ( = ?auto_34091 ?auto_34096 ) ) ( not ( = ?auto_34092 ?auto_34095 ) ) ( not ( = ?auto_34089 ?auto_34096 ) ) ( not ( = ?auto_34093 ?auto_34095 ) ) ( not ( = ?auto_34094 ?auto_34096 ) ) ( not ( = ?auto_34095 ?auto_34098 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34092 ?auto_34089 ?auto_34093 ?auto_34094 )
      ( GET-4IMAGE-VERIFY ?auto_34090 ?auto_34091 ?auto_34092 ?auto_34089 ?auto_34093 ?auto_34094 ?auto_34095 ?auto_34096 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34123 - DIRECTION
      ?auto_34124 - MODE
      ?auto_34125 - DIRECTION
      ?auto_34122 - MODE
      ?auto_34126 - DIRECTION
      ?auto_34127 - MODE
      ?auto_34128 - DIRECTION
      ?auto_34129 - MODE
    )
    :vars
    (
      ?auto_34133 - INSTRUMENT
      ?auto_34131 - SATELLITE
      ?auto_34132 - DIRECTION
      ?auto_34134 - DIRECTION
      ?auto_34130 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_34133 ) ( ON_BOARD ?auto_34133 ?auto_34131 ) ( SUPPORTS ?auto_34133 ?auto_34129 ) ( POWER_ON ?auto_34133 ) ( POINTING ?auto_34131 ?auto_34132 ) ( not ( = ?auto_34128 ?auto_34132 ) ) ( HAVE_IMAGE ?auto_34134 ?auto_34130 ) ( not ( = ?auto_34134 ?auto_34128 ) ) ( not ( = ?auto_34134 ?auto_34132 ) ) ( not ( = ?auto_34130 ?auto_34129 ) ) ( HAVE_IMAGE ?auto_34123 ?auto_34124 ) ( HAVE_IMAGE ?auto_34125 ?auto_34122 ) ( HAVE_IMAGE ?auto_34126 ?auto_34127 ) ( not ( = ?auto_34123 ?auto_34125 ) ) ( not ( = ?auto_34123 ?auto_34126 ) ) ( not ( = ?auto_34123 ?auto_34128 ) ) ( not ( = ?auto_34123 ?auto_34132 ) ) ( not ( = ?auto_34123 ?auto_34134 ) ) ( not ( = ?auto_34124 ?auto_34122 ) ) ( not ( = ?auto_34124 ?auto_34127 ) ) ( not ( = ?auto_34124 ?auto_34129 ) ) ( not ( = ?auto_34124 ?auto_34130 ) ) ( not ( = ?auto_34125 ?auto_34126 ) ) ( not ( = ?auto_34125 ?auto_34128 ) ) ( not ( = ?auto_34125 ?auto_34132 ) ) ( not ( = ?auto_34125 ?auto_34134 ) ) ( not ( = ?auto_34122 ?auto_34127 ) ) ( not ( = ?auto_34122 ?auto_34129 ) ) ( not ( = ?auto_34122 ?auto_34130 ) ) ( not ( = ?auto_34126 ?auto_34128 ) ) ( not ( = ?auto_34126 ?auto_34132 ) ) ( not ( = ?auto_34126 ?auto_34134 ) ) ( not ( = ?auto_34127 ?auto_34129 ) ) ( not ( = ?auto_34127 ?auto_34130 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34134 ?auto_34130 ?auto_34128 ?auto_34129 )
      ( GET-4IMAGE-VERIFY ?auto_34123 ?auto_34124 ?auto_34125 ?auto_34122 ?auto_34126 ?auto_34127 ?auto_34128 ?auto_34129 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34147 - DIRECTION
      ?auto_34148 - MODE
      ?auto_34149 - DIRECTION
      ?auto_34146 - MODE
      ?auto_34150 - DIRECTION
      ?auto_34151 - MODE
      ?auto_34152 - DIRECTION
      ?auto_34153 - MODE
    )
    :vars
    (
      ?auto_34157 - INSTRUMENT
      ?auto_34155 - SATELLITE
      ?auto_34156 - DIRECTION
      ?auto_34158 - DIRECTION
      ?auto_34154 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_34157 ) ( ON_BOARD ?auto_34157 ?auto_34155 ) ( SUPPORTS ?auto_34157 ?auto_34151 ) ( POWER_ON ?auto_34157 ) ( POINTING ?auto_34155 ?auto_34156 ) ( not ( = ?auto_34150 ?auto_34156 ) ) ( HAVE_IMAGE ?auto_34158 ?auto_34154 ) ( not ( = ?auto_34158 ?auto_34150 ) ) ( not ( = ?auto_34158 ?auto_34156 ) ) ( not ( = ?auto_34154 ?auto_34151 ) ) ( HAVE_IMAGE ?auto_34147 ?auto_34148 ) ( HAVE_IMAGE ?auto_34149 ?auto_34146 ) ( HAVE_IMAGE ?auto_34152 ?auto_34153 ) ( not ( = ?auto_34147 ?auto_34149 ) ) ( not ( = ?auto_34147 ?auto_34150 ) ) ( not ( = ?auto_34147 ?auto_34152 ) ) ( not ( = ?auto_34147 ?auto_34156 ) ) ( not ( = ?auto_34147 ?auto_34158 ) ) ( not ( = ?auto_34148 ?auto_34146 ) ) ( not ( = ?auto_34148 ?auto_34151 ) ) ( not ( = ?auto_34148 ?auto_34153 ) ) ( not ( = ?auto_34148 ?auto_34154 ) ) ( not ( = ?auto_34149 ?auto_34150 ) ) ( not ( = ?auto_34149 ?auto_34152 ) ) ( not ( = ?auto_34149 ?auto_34156 ) ) ( not ( = ?auto_34149 ?auto_34158 ) ) ( not ( = ?auto_34146 ?auto_34151 ) ) ( not ( = ?auto_34146 ?auto_34153 ) ) ( not ( = ?auto_34146 ?auto_34154 ) ) ( not ( = ?auto_34150 ?auto_34152 ) ) ( not ( = ?auto_34151 ?auto_34153 ) ) ( not ( = ?auto_34152 ?auto_34156 ) ) ( not ( = ?auto_34152 ?auto_34158 ) ) ( not ( = ?auto_34153 ?auto_34154 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34158 ?auto_34154 ?auto_34150 ?auto_34151 )
      ( GET-4IMAGE-VERIFY ?auto_34147 ?auto_34148 ?auto_34149 ?auto_34146 ?auto_34150 ?auto_34151 ?auto_34152 ?auto_34153 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34206 - DIRECTION
      ?auto_34207 - MODE
      ?auto_34208 - DIRECTION
      ?auto_34205 - MODE
      ?auto_34209 - DIRECTION
      ?auto_34210 - MODE
      ?auto_34211 - DIRECTION
      ?auto_34212 - MODE
    )
    :vars
    (
      ?auto_34215 - INSTRUMENT
      ?auto_34213 - SATELLITE
      ?auto_34214 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_34215 ) ( ON_BOARD ?auto_34215 ?auto_34213 ) ( SUPPORTS ?auto_34215 ?auto_34205 ) ( POWER_ON ?auto_34215 ) ( POINTING ?auto_34213 ?auto_34214 ) ( not ( = ?auto_34208 ?auto_34214 ) ) ( HAVE_IMAGE ?auto_34211 ?auto_34212 ) ( not ( = ?auto_34211 ?auto_34208 ) ) ( not ( = ?auto_34211 ?auto_34214 ) ) ( not ( = ?auto_34212 ?auto_34205 ) ) ( HAVE_IMAGE ?auto_34206 ?auto_34207 ) ( HAVE_IMAGE ?auto_34209 ?auto_34210 ) ( not ( = ?auto_34206 ?auto_34208 ) ) ( not ( = ?auto_34206 ?auto_34209 ) ) ( not ( = ?auto_34206 ?auto_34211 ) ) ( not ( = ?auto_34206 ?auto_34214 ) ) ( not ( = ?auto_34207 ?auto_34205 ) ) ( not ( = ?auto_34207 ?auto_34210 ) ) ( not ( = ?auto_34207 ?auto_34212 ) ) ( not ( = ?auto_34208 ?auto_34209 ) ) ( not ( = ?auto_34205 ?auto_34210 ) ) ( not ( = ?auto_34209 ?auto_34211 ) ) ( not ( = ?auto_34209 ?auto_34214 ) ) ( not ( = ?auto_34210 ?auto_34212 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34211 ?auto_34212 ?auto_34208 ?auto_34205 )
      ( GET-4IMAGE-VERIFY ?auto_34206 ?auto_34207 ?auto_34208 ?auto_34205 ?auto_34209 ?auto_34210 ?auto_34211 ?auto_34212 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34217 - DIRECTION
      ?auto_34218 - MODE
      ?auto_34219 - DIRECTION
      ?auto_34216 - MODE
      ?auto_34220 - DIRECTION
      ?auto_34221 - MODE
      ?auto_34222 - DIRECTION
      ?auto_34223 - MODE
    )
    :vars
    (
      ?auto_34227 - INSTRUMENT
      ?auto_34225 - SATELLITE
      ?auto_34226 - DIRECTION
      ?auto_34228 - DIRECTION
      ?auto_34224 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_34227 ) ( ON_BOARD ?auto_34227 ?auto_34225 ) ( SUPPORTS ?auto_34227 ?auto_34216 ) ( POWER_ON ?auto_34227 ) ( POINTING ?auto_34225 ?auto_34226 ) ( not ( = ?auto_34219 ?auto_34226 ) ) ( HAVE_IMAGE ?auto_34228 ?auto_34224 ) ( not ( = ?auto_34228 ?auto_34219 ) ) ( not ( = ?auto_34228 ?auto_34226 ) ) ( not ( = ?auto_34224 ?auto_34216 ) ) ( HAVE_IMAGE ?auto_34217 ?auto_34218 ) ( HAVE_IMAGE ?auto_34220 ?auto_34221 ) ( HAVE_IMAGE ?auto_34222 ?auto_34223 ) ( not ( = ?auto_34217 ?auto_34219 ) ) ( not ( = ?auto_34217 ?auto_34220 ) ) ( not ( = ?auto_34217 ?auto_34222 ) ) ( not ( = ?auto_34217 ?auto_34226 ) ) ( not ( = ?auto_34217 ?auto_34228 ) ) ( not ( = ?auto_34218 ?auto_34216 ) ) ( not ( = ?auto_34218 ?auto_34221 ) ) ( not ( = ?auto_34218 ?auto_34223 ) ) ( not ( = ?auto_34218 ?auto_34224 ) ) ( not ( = ?auto_34219 ?auto_34220 ) ) ( not ( = ?auto_34219 ?auto_34222 ) ) ( not ( = ?auto_34216 ?auto_34221 ) ) ( not ( = ?auto_34216 ?auto_34223 ) ) ( not ( = ?auto_34220 ?auto_34222 ) ) ( not ( = ?auto_34220 ?auto_34226 ) ) ( not ( = ?auto_34220 ?auto_34228 ) ) ( not ( = ?auto_34221 ?auto_34223 ) ) ( not ( = ?auto_34221 ?auto_34224 ) ) ( not ( = ?auto_34222 ?auto_34226 ) ) ( not ( = ?auto_34222 ?auto_34228 ) ) ( not ( = ?auto_34223 ?auto_34224 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34228 ?auto_34224 ?auto_34219 ?auto_34216 )
      ( GET-4IMAGE-VERIFY ?auto_34217 ?auto_34218 ?auto_34219 ?auto_34216 ?auto_34220 ?auto_34221 ?auto_34222 ?auto_34223 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34280 - DIRECTION
      ?auto_34281 - MODE
      ?auto_34282 - DIRECTION
      ?auto_34279 - MODE
      ?auto_34283 - DIRECTION
      ?auto_34284 - MODE
      ?auto_34285 - DIRECTION
      ?auto_34286 - MODE
    )
    :vars
    (
      ?auto_34289 - INSTRUMENT
      ?auto_34287 - SATELLITE
      ?auto_34288 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_34289 ) ( ON_BOARD ?auto_34289 ?auto_34287 ) ( SUPPORTS ?auto_34289 ?auto_34281 ) ( POWER_ON ?auto_34289 ) ( POINTING ?auto_34287 ?auto_34288 ) ( not ( = ?auto_34280 ?auto_34288 ) ) ( HAVE_IMAGE ?auto_34285 ?auto_34286 ) ( not ( = ?auto_34285 ?auto_34280 ) ) ( not ( = ?auto_34285 ?auto_34288 ) ) ( not ( = ?auto_34286 ?auto_34281 ) ) ( HAVE_IMAGE ?auto_34282 ?auto_34279 ) ( HAVE_IMAGE ?auto_34283 ?auto_34284 ) ( not ( = ?auto_34280 ?auto_34282 ) ) ( not ( = ?auto_34280 ?auto_34283 ) ) ( not ( = ?auto_34281 ?auto_34279 ) ) ( not ( = ?auto_34281 ?auto_34284 ) ) ( not ( = ?auto_34282 ?auto_34283 ) ) ( not ( = ?auto_34282 ?auto_34285 ) ) ( not ( = ?auto_34282 ?auto_34288 ) ) ( not ( = ?auto_34279 ?auto_34284 ) ) ( not ( = ?auto_34279 ?auto_34286 ) ) ( not ( = ?auto_34283 ?auto_34285 ) ) ( not ( = ?auto_34283 ?auto_34288 ) ) ( not ( = ?auto_34284 ?auto_34286 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34285 ?auto_34286 ?auto_34280 ?auto_34281 )
      ( GET-4IMAGE-VERIFY ?auto_34280 ?auto_34281 ?auto_34282 ?auto_34279 ?auto_34283 ?auto_34284 ?auto_34285 ?auto_34286 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34291 - DIRECTION
      ?auto_34292 - MODE
      ?auto_34293 - DIRECTION
      ?auto_34290 - MODE
      ?auto_34294 - DIRECTION
      ?auto_34295 - MODE
      ?auto_34296 - DIRECTION
      ?auto_34297 - MODE
    )
    :vars
    (
      ?auto_34300 - INSTRUMENT
      ?auto_34298 - SATELLITE
      ?auto_34299 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_34300 ) ( ON_BOARD ?auto_34300 ?auto_34298 ) ( SUPPORTS ?auto_34300 ?auto_34292 ) ( POWER_ON ?auto_34300 ) ( POINTING ?auto_34298 ?auto_34299 ) ( not ( = ?auto_34291 ?auto_34299 ) ) ( HAVE_IMAGE ?auto_34294 ?auto_34295 ) ( not ( = ?auto_34294 ?auto_34291 ) ) ( not ( = ?auto_34294 ?auto_34299 ) ) ( not ( = ?auto_34295 ?auto_34292 ) ) ( HAVE_IMAGE ?auto_34293 ?auto_34290 ) ( HAVE_IMAGE ?auto_34296 ?auto_34297 ) ( not ( = ?auto_34291 ?auto_34293 ) ) ( not ( = ?auto_34291 ?auto_34296 ) ) ( not ( = ?auto_34292 ?auto_34290 ) ) ( not ( = ?auto_34292 ?auto_34297 ) ) ( not ( = ?auto_34293 ?auto_34294 ) ) ( not ( = ?auto_34293 ?auto_34296 ) ) ( not ( = ?auto_34293 ?auto_34299 ) ) ( not ( = ?auto_34290 ?auto_34295 ) ) ( not ( = ?auto_34290 ?auto_34297 ) ) ( not ( = ?auto_34294 ?auto_34296 ) ) ( not ( = ?auto_34295 ?auto_34297 ) ) ( not ( = ?auto_34296 ?auto_34299 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34294 ?auto_34295 ?auto_34291 ?auto_34292 )
      ( GET-4IMAGE-VERIFY ?auto_34291 ?auto_34292 ?auto_34293 ?auto_34290 ?auto_34294 ?auto_34295 ?auto_34296 ?auto_34297 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34313 - DIRECTION
      ?auto_34314 - MODE
      ?auto_34315 - DIRECTION
      ?auto_34312 - MODE
      ?auto_34316 - DIRECTION
      ?auto_34317 - MODE
      ?auto_34318 - DIRECTION
      ?auto_34319 - MODE
    )
    :vars
    (
      ?auto_34322 - INSTRUMENT
      ?auto_34320 - SATELLITE
      ?auto_34321 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_34322 ) ( ON_BOARD ?auto_34322 ?auto_34320 ) ( SUPPORTS ?auto_34322 ?auto_34314 ) ( POWER_ON ?auto_34322 ) ( POINTING ?auto_34320 ?auto_34321 ) ( not ( = ?auto_34313 ?auto_34321 ) ) ( HAVE_IMAGE ?auto_34315 ?auto_34319 ) ( not ( = ?auto_34315 ?auto_34313 ) ) ( not ( = ?auto_34315 ?auto_34321 ) ) ( not ( = ?auto_34319 ?auto_34314 ) ) ( HAVE_IMAGE ?auto_34315 ?auto_34312 ) ( HAVE_IMAGE ?auto_34316 ?auto_34317 ) ( HAVE_IMAGE ?auto_34318 ?auto_34319 ) ( not ( = ?auto_34313 ?auto_34316 ) ) ( not ( = ?auto_34313 ?auto_34318 ) ) ( not ( = ?auto_34314 ?auto_34312 ) ) ( not ( = ?auto_34314 ?auto_34317 ) ) ( not ( = ?auto_34315 ?auto_34316 ) ) ( not ( = ?auto_34315 ?auto_34318 ) ) ( not ( = ?auto_34312 ?auto_34317 ) ) ( not ( = ?auto_34312 ?auto_34319 ) ) ( not ( = ?auto_34316 ?auto_34318 ) ) ( not ( = ?auto_34316 ?auto_34321 ) ) ( not ( = ?auto_34317 ?auto_34319 ) ) ( not ( = ?auto_34318 ?auto_34321 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34315 ?auto_34319 ?auto_34313 ?auto_34314 )
      ( GET-4IMAGE-VERIFY ?auto_34313 ?auto_34314 ?auto_34315 ?auto_34312 ?auto_34316 ?auto_34317 ?auto_34318 ?auto_34319 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34379 - DIRECTION
      ?auto_34380 - MODE
      ?auto_34381 - DIRECTION
      ?auto_34378 - MODE
      ?auto_34382 - DIRECTION
      ?auto_34383 - MODE
      ?auto_34384 - DIRECTION
      ?auto_34385 - MODE
    )
    :vars
    (
      ?auto_34388 - INSTRUMENT
      ?auto_34386 - SATELLITE
      ?auto_34387 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_34388 ) ( ON_BOARD ?auto_34388 ?auto_34386 ) ( SUPPORTS ?auto_34388 ?auto_34380 ) ( POWER_ON ?auto_34388 ) ( POINTING ?auto_34386 ?auto_34387 ) ( not ( = ?auto_34379 ?auto_34387 ) ) ( HAVE_IMAGE ?auto_34382 ?auto_34385 ) ( not ( = ?auto_34382 ?auto_34379 ) ) ( not ( = ?auto_34382 ?auto_34387 ) ) ( not ( = ?auto_34385 ?auto_34380 ) ) ( HAVE_IMAGE ?auto_34381 ?auto_34378 ) ( HAVE_IMAGE ?auto_34382 ?auto_34383 ) ( HAVE_IMAGE ?auto_34384 ?auto_34385 ) ( not ( = ?auto_34379 ?auto_34381 ) ) ( not ( = ?auto_34379 ?auto_34384 ) ) ( not ( = ?auto_34380 ?auto_34378 ) ) ( not ( = ?auto_34380 ?auto_34383 ) ) ( not ( = ?auto_34381 ?auto_34382 ) ) ( not ( = ?auto_34381 ?auto_34384 ) ) ( not ( = ?auto_34381 ?auto_34387 ) ) ( not ( = ?auto_34378 ?auto_34383 ) ) ( not ( = ?auto_34378 ?auto_34385 ) ) ( not ( = ?auto_34382 ?auto_34384 ) ) ( not ( = ?auto_34383 ?auto_34385 ) ) ( not ( = ?auto_34384 ?auto_34387 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34382 ?auto_34385 ?auto_34379 ?auto_34380 )
      ( GET-4IMAGE-VERIFY ?auto_34379 ?auto_34380 ?auto_34381 ?auto_34378 ?auto_34382 ?auto_34383 ?auto_34384 ?auto_34385 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34423 - DIRECTION
      ?auto_34424 - MODE
      ?auto_34425 - DIRECTION
      ?auto_34422 - MODE
      ?auto_34426 - DIRECTION
      ?auto_34427 - MODE
      ?auto_34428 - DIRECTION
      ?auto_34429 - MODE
    )
    :vars
    (
      ?auto_34433 - INSTRUMENT
      ?auto_34431 - SATELLITE
      ?auto_34432 - DIRECTION
      ?auto_34434 - DIRECTION
      ?auto_34430 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_34433 ) ( ON_BOARD ?auto_34433 ?auto_34431 ) ( SUPPORTS ?auto_34433 ?auto_34424 ) ( POWER_ON ?auto_34433 ) ( POINTING ?auto_34431 ?auto_34432 ) ( not ( = ?auto_34423 ?auto_34432 ) ) ( HAVE_IMAGE ?auto_34434 ?auto_34430 ) ( not ( = ?auto_34434 ?auto_34423 ) ) ( not ( = ?auto_34434 ?auto_34432 ) ) ( not ( = ?auto_34430 ?auto_34424 ) ) ( HAVE_IMAGE ?auto_34425 ?auto_34422 ) ( HAVE_IMAGE ?auto_34426 ?auto_34427 ) ( HAVE_IMAGE ?auto_34428 ?auto_34429 ) ( not ( = ?auto_34423 ?auto_34425 ) ) ( not ( = ?auto_34423 ?auto_34426 ) ) ( not ( = ?auto_34423 ?auto_34428 ) ) ( not ( = ?auto_34424 ?auto_34422 ) ) ( not ( = ?auto_34424 ?auto_34427 ) ) ( not ( = ?auto_34424 ?auto_34429 ) ) ( not ( = ?auto_34425 ?auto_34426 ) ) ( not ( = ?auto_34425 ?auto_34428 ) ) ( not ( = ?auto_34425 ?auto_34432 ) ) ( not ( = ?auto_34425 ?auto_34434 ) ) ( not ( = ?auto_34422 ?auto_34427 ) ) ( not ( = ?auto_34422 ?auto_34429 ) ) ( not ( = ?auto_34422 ?auto_34430 ) ) ( not ( = ?auto_34426 ?auto_34428 ) ) ( not ( = ?auto_34426 ?auto_34432 ) ) ( not ( = ?auto_34426 ?auto_34434 ) ) ( not ( = ?auto_34427 ?auto_34429 ) ) ( not ( = ?auto_34427 ?auto_34430 ) ) ( not ( = ?auto_34428 ?auto_34432 ) ) ( not ( = ?auto_34428 ?auto_34434 ) ) ( not ( = ?auto_34429 ?auto_34430 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34434 ?auto_34430 ?auto_34423 ?auto_34424 )
      ( GET-4IMAGE-VERIFY ?auto_34423 ?auto_34424 ?auto_34425 ?auto_34422 ?auto_34426 ?auto_34427 ?auto_34428 ?auto_34429 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_34631 - DIRECTION
      ?auto_34632 - MODE
      ?auto_34633 - DIRECTION
      ?auto_34630 - MODE
      ?auto_34634 - DIRECTION
      ?auto_34635 - MODE
    )
    :vars
    (
      ?auto_34638 - INSTRUMENT
      ?auto_34637 - SATELLITE
      ?auto_34636 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34638 ?auto_34637 ) ( SUPPORTS ?auto_34638 ?auto_34635 ) ( POWER_ON ?auto_34638 ) ( POINTING ?auto_34637 ?auto_34636 ) ( not ( = ?auto_34634 ?auto_34636 ) ) ( HAVE_IMAGE ?auto_34633 ?auto_34632 ) ( not ( = ?auto_34633 ?auto_34634 ) ) ( not ( = ?auto_34633 ?auto_34636 ) ) ( not ( = ?auto_34632 ?auto_34635 ) ) ( CALIBRATION_TARGET ?auto_34638 ?auto_34636 ) ( NOT_CALIBRATED ?auto_34638 ) ( HAVE_IMAGE ?auto_34631 ?auto_34632 ) ( HAVE_IMAGE ?auto_34633 ?auto_34630 ) ( not ( = ?auto_34631 ?auto_34633 ) ) ( not ( = ?auto_34631 ?auto_34634 ) ) ( not ( = ?auto_34631 ?auto_34636 ) ) ( not ( = ?auto_34632 ?auto_34630 ) ) ( not ( = ?auto_34630 ?auto_34635 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34633 ?auto_34632 ?auto_34634 ?auto_34635 )
      ( GET-3IMAGE-VERIFY ?auto_34631 ?auto_34632 ?auto_34633 ?auto_34630 ?auto_34634 ?auto_34635 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_34640 - DIRECTION
      ?auto_34641 - MODE
      ?auto_34642 - DIRECTION
      ?auto_34639 - MODE
      ?auto_34643 - DIRECTION
      ?auto_34644 - MODE
    )
    :vars
    (
      ?auto_34647 - INSTRUMENT
      ?auto_34646 - SATELLITE
      ?auto_34645 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34647 ?auto_34646 ) ( SUPPORTS ?auto_34647 ?auto_34644 ) ( POWER_ON ?auto_34647 ) ( POINTING ?auto_34646 ?auto_34645 ) ( not ( = ?auto_34643 ?auto_34645 ) ) ( HAVE_IMAGE ?auto_34640 ?auto_34641 ) ( not ( = ?auto_34640 ?auto_34643 ) ) ( not ( = ?auto_34640 ?auto_34645 ) ) ( not ( = ?auto_34641 ?auto_34644 ) ) ( CALIBRATION_TARGET ?auto_34647 ?auto_34645 ) ( NOT_CALIBRATED ?auto_34647 ) ( HAVE_IMAGE ?auto_34642 ?auto_34639 ) ( not ( = ?auto_34640 ?auto_34642 ) ) ( not ( = ?auto_34641 ?auto_34639 ) ) ( not ( = ?auto_34642 ?auto_34643 ) ) ( not ( = ?auto_34642 ?auto_34645 ) ) ( not ( = ?auto_34639 ?auto_34644 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34640 ?auto_34641 ?auto_34643 ?auto_34644 )
      ( GET-3IMAGE-VERIFY ?auto_34640 ?auto_34641 ?auto_34642 ?auto_34639 ?auto_34643 ?auto_34644 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_34679 - DIRECTION
      ?auto_34680 - MODE
      ?auto_34681 - DIRECTION
      ?auto_34678 - MODE
      ?auto_34682 - DIRECTION
      ?auto_34683 - MODE
    )
    :vars
    (
      ?auto_34686 - INSTRUMENT
      ?auto_34685 - SATELLITE
      ?auto_34684 - DIRECTION
      ?auto_34687 - DIRECTION
      ?auto_34688 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_34686 ?auto_34685 ) ( SUPPORTS ?auto_34686 ?auto_34683 ) ( POWER_ON ?auto_34686 ) ( POINTING ?auto_34685 ?auto_34684 ) ( not ( = ?auto_34682 ?auto_34684 ) ) ( HAVE_IMAGE ?auto_34687 ?auto_34688 ) ( not ( = ?auto_34687 ?auto_34682 ) ) ( not ( = ?auto_34687 ?auto_34684 ) ) ( not ( = ?auto_34688 ?auto_34683 ) ) ( CALIBRATION_TARGET ?auto_34686 ?auto_34684 ) ( NOT_CALIBRATED ?auto_34686 ) ( HAVE_IMAGE ?auto_34679 ?auto_34680 ) ( HAVE_IMAGE ?auto_34681 ?auto_34678 ) ( not ( = ?auto_34679 ?auto_34681 ) ) ( not ( = ?auto_34679 ?auto_34682 ) ) ( not ( = ?auto_34679 ?auto_34684 ) ) ( not ( = ?auto_34679 ?auto_34687 ) ) ( not ( = ?auto_34680 ?auto_34678 ) ) ( not ( = ?auto_34680 ?auto_34683 ) ) ( not ( = ?auto_34680 ?auto_34688 ) ) ( not ( = ?auto_34681 ?auto_34682 ) ) ( not ( = ?auto_34681 ?auto_34684 ) ) ( not ( = ?auto_34681 ?auto_34687 ) ) ( not ( = ?auto_34678 ?auto_34683 ) ) ( not ( = ?auto_34678 ?auto_34688 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34687 ?auto_34688 ?auto_34682 ?auto_34683 )
      ( GET-3IMAGE-VERIFY ?auto_34679 ?auto_34680 ?auto_34681 ?auto_34678 ?auto_34682 ?auto_34683 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_34696 - DIRECTION
      ?auto_34697 - MODE
      ?auto_34698 - DIRECTION
      ?auto_34695 - MODE
      ?auto_34699 - DIRECTION
      ?auto_34700 - MODE
    )
    :vars
    (
      ?auto_34703 - INSTRUMENT
      ?auto_34702 - SATELLITE
      ?auto_34701 - DIRECTION
      ?auto_34704 - DIRECTION
      ?auto_34705 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_34703 ?auto_34702 ) ( SUPPORTS ?auto_34703 ?auto_34695 ) ( POWER_ON ?auto_34703 ) ( POINTING ?auto_34702 ?auto_34701 ) ( not ( = ?auto_34698 ?auto_34701 ) ) ( HAVE_IMAGE ?auto_34704 ?auto_34705 ) ( not ( = ?auto_34704 ?auto_34698 ) ) ( not ( = ?auto_34704 ?auto_34701 ) ) ( not ( = ?auto_34705 ?auto_34695 ) ) ( CALIBRATION_TARGET ?auto_34703 ?auto_34701 ) ( NOT_CALIBRATED ?auto_34703 ) ( HAVE_IMAGE ?auto_34696 ?auto_34697 ) ( HAVE_IMAGE ?auto_34699 ?auto_34700 ) ( not ( = ?auto_34696 ?auto_34698 ) ) ( not ( = ?auto_34696 ?auto_34699 ) ) ( not ( = ?auto_34696 ?auto_34701 ) ) ( not ( = ?auto_34696 ?auto_34704 ) ) ( not ( = ?auto_34697 ?auto_34695 ) ) ( not ( = ?auto_34697 ?auto_34700 ) ) ( not ( = ?auto_34697 ?auto_34705 ) ) ( not ( = ?auto_34698 ?auto_34699 ) ) ( not ( = ?auto_34695 ?auto_34700 ) ) ( not ( = ?auto_34699 ?auto_34701 ) ) ( not ( = ?auto_34699 ?auto_34704 ) ) ( not ( = ?auto_34700 ?auto_34705 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34704 ?auto_34705 ?auto_34698 ?auto_34695 )
      ( GET-3IMAGE-VERIFY ?auto_34696 ?auto_34697 ?auto_34698 ?auto_34695 ?auto_34699 ?auto_34700 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_34718 - DIRECTION
      ?auto_34719 - MODE
      ?auto_34720 - DIRECTION
      ?auto_34717 - MODE
      ?auto_34721 - DIRECTION
      ?auto_34722 - MODE
    )
    :vars
    (
      ?auto_34725 - INSTRUMENT
      ?auto_34724 - SATELLITE
      ?auto_34723 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34725 ?auto_34724 ) ( SUPPORTS ?auto_34725 ?auto_34719 ) ( POWER_ON ?auto_34725 ) ( POINTING ?auto_34724 ?auto_34723 ) ( not ( = ?auto_34718 ?auto_34723 ) ) ( HAVE_IMAGE ?auto_34720 ?auto_34722 ) ( not ( = ?auto_34720 ?auto_34718 ) ) ( not ( = ?auto_34720 ?auto_34723 ) ) ( not ( = ?auto_34722 ?auto_34719 ) ) ( CALIBRATION_TARGET ?auto_34725 ?auto_34723 ) ( NOT_CALIBRATED ?auto_34725 ) ( HAVE_IMAGE ?auto_34720 ?auto_34717 ) ( HAVE_IMAGE ?auto_34721 ?auto_34722 ) ( not ( = ?auto_34718 ?auto_34721 ) ) ( not ( = ?auto_34719 ?auto_34717 ) ) ( not ( = ?auto_34720 ?auto_34721 ) ) ( not ( = ?auto_34717 ?auto_34722 ) ) ( not ( = ?auto_34721 ?auto_34723 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34720 ?auto_34722 ?auto_34718 ?auto_34719 )
      ( GET-3IMAGE-VERIFY ?auto_34718 ?auto_34719 ?auto_34720 ?auto_34717 ?auto_34721 ?auto_34722 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_34727 - DIRECTION
      ?auto_34728 - MODE
      ?auto_34729 - DIRECTION
      ?auto_34726 - MODE
      ?auto_34730 - DIRECTION
      ?auto_34731 - MODE
    )
    :vars
    (
      ?auto_34734 - INSTRUMENT
      ?auto_34733 - SATELLITE
      ?auto_34732 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34734 ?auto_34733 ) ( SUPPORTS ?auto_34734 ?auto_34728 ) ( POWER_ON ?auto_34734 ) ( POINTING ?auto_34733 ?auto_34732 ) ( not ( = ?auto_34727 ?auto_34732 ) ) ( HAVE_IMAGE ?auto_34729 ?auto_34726 ) ( not ( = ?auto_34729 ?auto_34727 ) ) ( not ( = ?auto_34729 ?auto_34732 ) ) ( not ( = ?auto_34726 ?auto_34728 ) ) ( CALIBRATION_TARGET ?auto_34734 ?auto_34732 ) ( NOT_CALIBRATED ?auto_34734 ) ( HAVE_IMAGE ?auto_34730 ?auto_34731 ) ( not ( = ?auto_34727 ?auto_34730 ) ) ( not ( = ?auto_34728 ?auto_34731 ) ) ( not ( = ?auto_34729 ?auto_34730 ) ) ( not ( = ?auto_34726 ?auto_34731 ) ) ( not ( = ?auto_34730 ?auto_34732 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34729 ?auto_34726 ?auto_34727 ?auto_34728 )
      ( GET-3IMAGE-VERIFY ?auto_34727 ?auto_34728 ?auto_34729 ?auto_34726 ?auto_34730 ?auto_34731 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_34751 - DIRECTION
      ?auto_34752 - MODE
      ?auto_34753 - DIRECTION
      ?auto_34750 - MODE
      ?auto_34754 - DIRECTION
      ?auto_34755 - MODE
    )
    :vars
    (
      ?auto_34758 - INSTRUMENT
      ?auto_34757 - SATELLITE
      ?auto_34756 - DIRECTION
      ?auto_34759 - DIRECTION
      ?auto_34760 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_34758 ?auto_34757 ) ( SUPPORTS ?auto_34758 ?auto_34752 ) ( POWER_ON ?auto_34758 ) ( POINTING ?auto_34757 ?auto_34756 ) ( not ( = ?auto_34751 ?auto_34756 ) ) ( HAVE_IMAGE ?auto_34759 ?auto_34760 ) ( not ( = ?auto_34759 ?auto_34751 ) ) ( not ( = ?auto_34759 ?auto_34756 ) ) ( not ( = ?auto_34760 ?auto_34752 ) ) ( CALIBRATION_TARGET ?auto_34758 ?auto_34756 ) ( NOT_CALIBRATED ?auto_34758 ) ( HAVE_IMAGE ?auto_34753 ?auto_34750 ) ( HAVE_IMAGE ?auto_34754 ?auto_34755 ) ( not ( = ?auto_34751 ?auto_34753 ) ) ( not ( = ?auto_34751 ?auto_34754 ) ) ( not ( = ?auto_34752 ?auto_34750 ) ) ( not ( = ?auto_34752 ?auto_34755 ) ) ( not ( = ?auto_34753 ?auto_34754 ) ) ( not ( = ?auto_34753 ?auto_34756 ) ) ( not ( = ?auto_34753 ?auto_34759 ) ) ( not ( = ?auto_34750 ?auto_34755 ) ) ( not ( = ?auto_34750 ?auto_34760 ) ) ( not ( = ?auto_34754 ?auto_34756 ) ) ( not ( = ?auto_34754 ?auto_34759 ) ) ( not ( = ?auto_34755 ?auto_34760 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34759 ?auto_34760 ?auto_34751 ?auto_34752 )
      ( GET-3IMAGE-VERIFY ?auto_34751 ?auto_34752 ?auto_34753 ?auto_34750 ?auto_34754 ?auto_34755 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34804 - DIRECTION
      ?auto_34805 - MODE
      ?auto_34806 - DIRECTION
      ?auto_34803 - MODE
      ?auto_34807 - DIRECTION
      ?auto_34808 - MODE
      ?auto_34809 - DIRECTION
      ?auto_34810 - MODE
    )
    :vars
    (
      ?auto_34813 - INSTRUMENT
      ?auto_34812 - SATELLITE
      ?auto_34811 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34813 ?auto_34812 ) ( SUPPORTS ?auto_34813 ?auto_34810 ) ( POWER_ON ?auto_34813 ) ( POINTING ?auto_34812 ?auto_34811 ) ( not ( = ?auto_34809 ?auto_34811 ) ) ( HAVE_IMAGE ?auto_34804 ?auto_34808 ) ( not ( = ?auto_34804 ?auto_34809 ) ) ( not ( = ?auto_34804 ?auto_34811 ) ) ( not ( = ?auto_34808 ?auto_34810 ) ) ( CALIBRATION_TARGET ?auto_34813 ?auto_34811 ) ( NOT_CALIBRATED ?auto_34813 ) ( HAVE_IMAGE ?auto_34804 ?auto_34805 ) ( HAVE_IMAGE ?auto_34806 ?auto_34803 ) ( HAVE_IMAGE ?auto_34807 ?auto_34808 ) ( not ( = ?auto_34804 ?auto_34806 ) ) ( not ( = ?auto_34804 ?auto_34807 ) ) ( not ( = ?auto_34805 ?auto_34803 ) ) ( not ( = ?auto_34805 ?auto_34808 ) ) ( not ( = ?auto_34805 ?auto_34810 ) ) ( not ( = ?auto_34806 ?auto_34807 ) ) ( not ( = ?auto_34806 ?auto_34809 ) ) ( not ( = ?auto_34806 ?auto_34811 ) ) ( not ( = ?auto_34803 ?auto_34808 ) ) ( not ( = ?auto_34803 ?auto_34810 ) ) ( not ( = ?auto_34807 ?auto_34809 ) ) ( not ( = ?auto_34807 ?auto_34811 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34804 ?auto_34808 ?auto_34809 ?auto_34810 )
      ( GET-4IMAGE-VERIFY ?auto_34804 ?auto_34805 ?auto_34806 ?auto_34803 ?auto_34807 ?auto_34808 ?auto_34809 ?auto_34810 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34815 - DIRECTION
      ?auto_34816 - MODE
      ?auto_34817 - DIRECTION
      ?auto_34814 - MODE
      ?auto_34818 - DIRECTION
      ?auto_34819 - MODE
      ?auto_34820 - DIRECTION
      ?auto_34821 - MODE
    )
    :vars
    (
      ?auto_34824 - INSTRUMENT
      ?auto_34823 - SATELLITE
      ?auto_34822 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34824 ?auto_34823 ) ( SUPPORTS ?auto_34824 ?auto_34821 ) ( POWER_ON ?auto_34824 ) ( POINTING ?auto_34823 ?auto_34822 ) ( not ( = ?auto_34820 ?auto_34822 ) ) ( HAVE_IMAGE ?auto_34817 ?auto_34816 ) ( not ( = ?auto_34817 ?auto_34820 ) ) ( not ( = ?auto_34817 ?auto_34822 ) ) ( not ( = ?auto_34816 ?auto_34821 ) ) ( CALIBRATION_TARGET ?auto_34824 ?auto_34822 ) ( NOT_CALIBRATED ?auto_34824 ) ( HAVE_IMAGE ?auto_34815 ?auto_34816 ) ( HAVE_IMAGE ?auto_34817 ?auto_34814 ) ( HAVE_IMAGE ?auto_34818 ?auto_34819 ) ( not ( = ?auto_34815 ?auto_34817 ) ) ( not ( = ?auto_34815 ?auto_34818 ) ) ( not ( = ?auto_34815 ?auto_34820 ) ) ( not ( = ?auto_34815 ?auto_34822 ) ) ( not ( = ?auto_34816 ?auto_34814 ) ) ( not ( = ?auto_34816 ?auto_34819 ) ) ( not ( = ?auto_34817 ?auto_34818 ) ) ( not ( = ?auto_34814 ?auto_34819 ) ) ( not ( = ?auto_34814 ?auto_34821 ) ) ( not ( = ?auto_34818 ?auto_34820 ) ) ( not ( = ?auto_34818 ?auto_34822 ) ) ( not ( = ?auto_34819 ?auto_34821 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34817 ?auto_34816 ?auto_34820 ?auto_34821 )
      ( GET-4IMAGE-VERIFY ?auto_34815 ?auto_34816 ?auto_34817 ?auto_34814 ?auto_34818 ?auto_34819 ?auto_34820 ?auto_34821 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34826 - DIRECTION
      ?auto_34827 - MODE
      ?auto_34828 - DIRECTION
      ?auto_34825 - MODE
      ?auto_34829 - DIRECTION
      ?auto_34830 - MODE
      ?auto_34831 - DIRECTION
      ?auto_34832 - MODE
    )
    :vars
    (
      ?auto_34835 - INSTRUMENT
      ?auto_34834 - SATELLITE
      ?auto_34833 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34835 ?auto_34834 ) ( SUPPORTS ?auto_34835 ?auto_34830 ) ( POWER_ON ?auto_34835 ) ( POINTING ?auto_34834 ?auto_34833 ) ( not ( = ?auto_34829 ?auto_34833 ) ) ( HAVE_IMAGE ?auto_34828 ?auto_34832 ) ( not ( = ?auto_34828 ?auto_34829 ) ) ( not ( = ?auto_34828 ?auto_34833 ) ) ( not ( = ?auto_34832 ?auto_34830 ) ) ( CALIBRATION_TARGET ?auto_34835 ?auto_34833 ) ( NOT_CALIBRATED ?auto_34835 ) ( HAVE_IMAGE ?auto_34826 ?auto_34827 ) ( HAVE_IMAGE ?auto_34828 ?auto_34825 ) ( HAVE_IMAGE ?auto_34831 ?auto_34832 ) ( not ( = ?auto_34826 ?auto_34828 ) ) ( not ( = ?auto_34826 ?auto_34829 ) ) ( not ( = ?auto_34826 ?auto_34831 ) ) ( not ( = ?auto_34826 ?auto_34833 ) ) ( not ( = ?auto_34827 ?auto_34825 ) ) ( not ( = ?auto_34827 ?auto_34830 ) ) ( not ( = ?auto_34827 ?auto_34832 ) ) ( not ( = ?auto_34828 ?auto_34831 ) ) ( not ( = ?auto_34825 ?auto_34830 ) ) ( not ( = ?auto_34825 ?auto_34832 ) ) ( not ( = ?auto_34829 ?auto_34831 ) ) ( not ( = ?auto_34831 ?auto_34833 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34828 ?auto_34832 ?auto_34829 ?auto_34830 )
      ( GET-4IMAGE-VERIFY ?auto_34826 ?auto_34827 ?auto_34828 ?auto_34825 ?auto_34829 ?auto_34830 ?auto_34831 ?auto_34832 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34837 - DIRECTION
      ?auto_34838 - MODE
      ?auto_34839 - DIRECTION
      ?auto_34836 - MODE
      ?auto_34840 - DIRECTION
      ?auto_34841 - MODE
      ?auto_34842 - DIRECTION
      ?auto_34843 - MODE
    )
    :vars
    (
      ?auto_34846 - INSTRUMENT
      ?auto_34845 - SATELLITE
      ?auto_34844 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34846 ?auto_34845 ) ( SUPPORTS ?auto_34846 ?auto_34841 ) ( POWER_ON ?auto_34846 ) ( POINTING ?auto_34845 ?auto_34844 ) ( not ( = ?auto_34840 ?auto_34844 ) ) ( HAVE_IMAGE ?auto_34839 ?auto_34838 ) ( not ( = ?auto_34839 ?auto_34840 ) ) ( not ( = ?auto_34839 ?auto_34844 ) ) ( not ( = ?auto_34838 ?auto_34841 ) ) ( CALIBRATION_TARGET ?auto_34846 ?auto_34844 ) ( NOT_CALIBRATED ?auto_34846 ) ( HAVE_IMAGE ?auto_34837 ?auto_34838 ) ( HAVE_IMAGE ?auto_34839 ?auto_34836 ) ( HAVE_IMAGE ?auto_34842 ?auto_34843 ) ( not ( = ?auto_34837 ?auto_34839 ) ) ( not ( = ?auto_34837 ?auto_34840 ) ) ( not ( = ?auto_34837 ?auto_34842 ) ) ( not ( = ?auto_34837 ?auto_34844 ) ) ( not ( = ?auto_34838 ?auto_34836 ) ) ( not ( = ?auto_34838 ?auto_34843 ) ) ( not ( = ?auto_34839 ?auto_34842 ) ) ( not ( = ?auto_34836 ?auto_34841 ) ) ( not ( = ?auto_34836 ?auto_34843 ) ) ( not ( = ?auto_34840 ?auto_34842 ) ) ( not ( = ?auto_34841 ?auto_34843 ) ) ( not ( = ?auto_34842 ?auto_34844 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34839 ?auto_34838 ?auto_34840 ?auto_34841 )
      ( GET-4IMAGE-VERIFY ?auto_34837 ?auto_34838 ?auto_34839 ?auto_34836 ?auto_34840 ?auto_34841 ?auto_34842 ?auto_34843 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34859 - DIRECTION
      ?auto_34860 - MODE
      ?auto_34861 - DIRECTION
      ?auto_34858 - MODE
      ?auto_34862 - DIRECTION
      ?auto_34863 - MODE
      ?auto_34864 - DIRECTION
      ?auto_34865 - MODE
    )
    :vars
    (
      ?auto_34868 - INSTRUMENT
      ?auto_34867 - SATELLITE
      ?auto_34866 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34868 ?auto_34867 ) ( SUPPORTS ?auto_34868 ?auto_34865 ) ( POWER_ON ?auto_34868 ) ( POINTING ?auto_34867 ?auto_34866 ) ( not ( = ?auto_34864 ?auto_34866 ) ) ( HAVE_IMAGE ?auto_34862 ?auto_34863 ) ( not ( = ?auto_34862 ?auto_34864 ) ) ( not ( = ?auto_34862 ?auto_34866 ) ) ( not ( = ?auto_34863 ?auto_34865 ) ) ( CALIBRATION_TARGET ?auto_34868 ?auto_34866 ) ( NOT_CALIBRATED ?auto_34868 ) ( HAVE_IMAGE ?auto_34859 ?auto_34860 ) ( HAVE_IMAGE ?auto_34861 ?auto_34858 ) ( not ( = ?auto_34859 ?auto_34861 ) ) ( not ( = ?auto_34859 ?auto_34862 ) ) ( not ( = ?auto_34859 ?auto_34864 ) ) ( not ( = ?auto_34859 ?auto_34866 ) ) ( not ( = ?auto_34860 ?auto_34858 ) ) ( not ( = ?auto_34860 ?auto_34863 ) ) ( not ( = ?auto_34860 ?auto_34865 ) ) ( not ( = ?auto_34861 ?auto_34862 ) ) ( not ( = ?auto_34861 ?auto_34864 ) ) ( not ( = ?auto_34861 ?auto_34866 ) ) ( not ( = ?auto_34858 ?auto_34863 ) ) ( not ( = ?auto_34858 ?auto_34865 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34862 ?auto_34863 ?auto_34864 ?auto_34865 )
      ( GET-4IMAGE-VERIFY ?auto_34859 ?auto_34860 ?auto_34861 ?auto_34858 ?auto_34862 ?auto_34863 ?auto_34864 ?auto_34865 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34870 - DIRECTION
      ?auto_34871 - MODE
      ?auto_34872 - DIRECTION
      ?auto_34869 - MODE
      ?auto_34873 - DIRECTION
      ?auto_34874 - MODE
      ?auto_34875 - DIRECTION
      ?auto_34876 - MODE
    )
    :vars
    (
      ?auto_34879 - INSTRUMENT
      ?auto_34878 - SATELLITE
      ?auto_34877 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34879 ?auto_34878 ) ( SUPPORTS ?auto_34879 ?auto_34876 ) ( POWER_ON ?auto_34879 ) ( POINTING ?auto_34878 ?auto_34877 ) ( not ( = ?auto_34875 ?auto_34877 ) ) ( HAVE_IMAGE ?auto_34870 ?auto_34871 ) ( not ( = ?auto_34870 ?auto_34875 ) ) ( not ( = ?auto_34870 ?auto_34877 ) ) ( not ( = ?auto_34871 ?auto_34876 ) ) ( CALIBRATION_TARGET ?auto_34879 ?auto_34877 ) ( NOT_CALIBRATED ?auto_34879 ) ( HAVE_IMAGE ?auto_34872 ?auto_34869 ) ( HAVE_IMAGE ?auto_34873 ?auto_34874 ) ( not ( = ?auto_34870 ?auto_34872 ) ) ( not ( = ?auto_34870 ?auto_34873 ) ) ( not ( = ?auto_34871 ?auto_34869 ) ) ( not ( = ?auto_34871 ?auto_34874 ) ) ( not ( = ?auto_34872 ?auto_34873 ) ) ( not ( = ?auto_34872 ?auto_34875 ) ) ( not ( = ?auto_34872 ?auto_34877 ) ) ( not ( = ?auto_34869 ?auto_34874 ) ) ( not ( = ?auto_34869 ?auto_34876 ) ) ( not ( = ?auto_34873 ?auto_34875 ) ) ( not ( = ?auto_34873 ?auto_34877 ) ) ( not ( = ?auto_34874 ?auto_34876 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34870 ?auto_34871 ?auto_34875 ?auto_34876 )
      ( GET-4IMAGE-VERIFY ?auto_34870 ?auto_34871 ?auto_34872 ?auto_34869 ?auto_34873 ?auto_34874 ?auto_34875 ?auto_34876 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34881 - DIRECTION
      ?auto_34882 - MODE
      ?auto_34883 - DIRECTION
      ?auto_34880 - MODE
      ?auto_34884 - DIRECTION
      ?auto_34885 - MODE
      ?auto_34886 - DIRECTION
      ?auto_34887 - MODE
    )
    :vars
    (
      ?auto_34890 - INSTRUMENT
      ?auto_34889 - SATELLITE
      ?auto_34888 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34890 ?auto_34889 ) ( SUPPORTS ?auto_34890 ?auto_34885 ) ( POWER_ON ?auto_34890 ) ( POINTING ?auto_34889 ?auto_34888 ) ( not ( = ?auto_34884 ?auto_34888 ) ) ( HAVE_IMAGE ?auto_34881 ?auto_34887 ) ( not ( = ?auto_34881 ?auto_34884 ) ) ( not ( = ?auto_34881 ?auto_34888 ) ) ( not ( = ?auto_34887 ?auto_34885 ) ) ( CALIBRATION_TARGET ?auto_34890 ?auto_34888 ) ( NOT_CALIBRATED ?auto_34890 ) ( HAVE_IMAGE ?auto_34881 ?auto_34882 ) ( HAVE_IMAGE ?auto_34883 ?auto_34880 ) ( HAVE_IMAGE ?auto_34886 ?auto_34887 ) ( not ( = ?auto_34881 ?auto_34883 ) ) ( not ( = ?auto_34881 ?auto_34886 ) ) ( not ( = ?auto_34882 ?auto_34880 ) ) ( not ( = ?auto_34882 ?auto_34885 ) ) ( not ( = ?auto_34882 ?auto_34887 ) ) ( not ( = ?auto_34883 ?auto_34884 ) ) ( not ( = ?auto_34883 ?auto_34886 ) ) ( not ( = ?auto_34883 ?auto_34888 ) ) ( not ( = ?auto_34880 ?auto_34885 ) ) ( not ( = ?auto_34880 ?auto_34887 ) ) ( not ( = ?auto_34884 ?auto_34886 ) ) ( not ( = ?auto_34886 ?auto_34888 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34881 ?auto_34887 ?auto_34884 ?auto_34885 )
      ( GET-4IMAGE-VERIFY ?auto_34881 ?auto_34882 ?auto_34883 ?auto_34880 ?auto_34884 ?auto_34885 ?auto_34886 ?auto_34887 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34892 - DIRECTION
      ?auto_34893 - MODE
      ?auto_34894 - DIRECTION
      ?auto_34891 - MODE
      ?auto_34895 - DIRECTION
      ?auto_34896 - MODE
      ?auto_34897 - DIRECTION
      ?auto_34898 - MODE
    )
    :vars
    (
      ?auto_34901 - INSTRUMENT
      ?auto_34900 - SATELLITE
      ?auto_34899 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34901 ?auto_34900 ) ( SUPPORTS ?auto_34901 ?auto_34896 ) ( POWER_ON ?auto_34901 ) ( POINTING ?auto_34900 ?auto_34899 ) ( not ( = ?auto_34895 ?auto_34899 ) ) ( HAVE_IMAGE ?auto_34892 ?auto_34893 ) ( not ( = ?auto_34892 ?auto_34895 ) ) ( not ( = ?auto_34892 ?auto_34899 ) ) ( not ( = ?auto_34893 ?auto_34896 ) ) ( CALIBRATION_TARGET ?auto_34901 ?auto_34899 ) ( NOT_CALIBRATED ?auto_34901 ) ( HAVE_IMAGE ?auto_34894 ?auto_34891 ) ( HAVE_IMAGE ?auto_34897 ?auto_34898 ) ( not ( = ?auto_34892 ?auto_34894 ) ) ( not ( = ?auto_34892 ?auto_34897 ) ) ( not ( = ?auto_34893 ?auto_34891 ) ) ( not ( = ?auto_34893 ?auto_34898 ) ) ( not ( = ?auto_34894 ?auto_34895 ) ) ( not ( = ?auto_34894 ?auto_34897 ) ) ( not ( = ?auto_34894 ?auto_34899 ) ) ( not ( = ?auto_34891 ?auto_34896 ) ) ( not ( = ?auto_34891 ?auto_34898 ) ) ( not ( = ?auto_34895 ?auto_34897 ) ) ( not ( = ?auto_34896 ?auto_34898 ) ) ( not ( = ?auto_34897 ?auto_34899 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34892 ?auto_34893 ?auto_34895 ?auto_34896 )
      ( GET-4IMAGE-VERIFY ?auto_34892 ?auto_34893 ?auto_34894 ?auto_34891 ?auto_34895 ?auto_34896 ?auto_34897 ?auto_34898 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34914 - DIRECTION
      ?auto_34915 - MODE
      ?auto_34916 - DIRECTION
      ?auto_34913 - MODE
      ?auto_34917 - DIRECTION
      ?auto_34918 - MODE
      ?auto_34919 - DIRECTION
      ?auto_34920 - MODE
    )
    :vars
    (
      ?auto_34923 - INSTRUMENT
      ?auto_34922 - SATELLITE
      ?auto_34921 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34923 ?auto_34922 ) ( SUPPORTS ?auto_34923 ?auto_34913 ) ( POWER_ON ?auto_34923 ) ( POINTING ?auto_34922 ?auto_34921 ) ( not ( = ?auto_34916 ?auto_34921 ) ) ( HAVE_IMAGE ?auto_34917 ?auto_34920 ) ( not ( = ?auto_34917 ?auto_34916 ) ) ( not ( = ?auto_34917 ?auto_34921 ) ) ( not ( = ?auto_34920 ?auto_34913 ) ) ( CALIBRATION_TARGET ?auto_34923 ?auto_34921 ) ( NOT_CALIBRATED ?auto_34923 ) ( HAVE_IMAGE ?auto_34914 ?auto_34915 ) ( HAVE_IMAGE ?auto_34917 ?auto_34918 ) ( HAVE_IMAGE ?auto_34919 ?auto_34920 ) ( not ( = ?auto_34914 ?auto_34916 ) ) ( not ( = ?auto_34914 ?auto_34917 ) ) ( not ( = ?auto_34914 ?auto_34919 ) ) ( not ( = ?auto_34914 ?auto_34921 ) ) ( not ( = ?auto_34915 ?auto_34913 ) ) ( not ( = ?auto_34915 ?auto_34918 ) ) ( not ( = ?auto_34915 ?auto_34920 ) ) ( not ( = ?auto_34916 ?auto_34919 ) ) ( not ( = ?auto_34913 ?auto_34918 ) ) ( not ( = ?auto_34917 ?auto_34919 ) ) ( not ( = ?auto_34918 ?auto_34920 ) ) ( not ( = ?auto_34919 ?auto_34921 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34917 ?auto_34920 ?auto_34916 ?auto_34913 )
      ( GET-4IMAGE-VERIFY ?auto_34914 ?auto_34915 ?auto_34916 ?auto_34913 ?auto_34917 ?auto_34918 ?auto_34919 ?auto_34920 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34925 - DIRECTION
      ?auto_34926 - MODE
      ?auto_34927 - DIRECTION
      ?auto_34924 - MODE
      ?auto_34928 - DIRECTION
      ?auto_34929 - MODE
      ?auto_34930 - DIRECTION
      ?auto_34931 - MODE
    )
    :vars
    (
      ?auto_34934 - INSTRUMENT
      ?auto_34933 - SATELLITE
      ?auto_34932 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34934 ?auto_34933 ) ( SUPPORTS ?auto_34934 ?auto_34924 ) ( POWER_ON ?auto_34934 ) ( POINTING ?auto_34933 ?auto_34932 ) ( not ( = ?auto_34927 ?auto_34932 ) ) ( HAVE_IMAGE ?auto_34928 ?auto_34929 ) ( not ( = ?auto_34928 ?auto_34927 ) ) ( not ( = ?auto_34928 ?auto_34932 ) ) ( not ( = ?auto_34929 ?auto_34924 ) ) ( CALIBRATION_TARGET ?auto_34934 ?auto_34932 ) ( NOT_CALIBRATED ?auto_34934 ) ( HAVE_IMAGE ?auto_34925 ?auto_34926 ) ( HAVE_IMAGE ?auto_34930 ?auto_34931 ) ( not ( = ?auto_34925 ?auto_34927 ) ) ( not ( = ?auto_34925 ?auto_34928 ) ) ( not ( = ?auto_34925 ?auto_34930 ) ) ( not ( = ?auto_34925 ?auto_34932 ) ) ( not ( = ?auto_34926 ?auto_34924 ) ) ( not ( = ?auto_34926 ?auto_34929 ) ) ( not ( = ?auto_34926 ?auto_34931 ) ) ( not ( = ?auto_34927 ?auto_34930 ) ) ( not ( = ?auto_34924 ?auto_34931 ) ) ( not ( = ?auto_34928 ?auto_34930 ) ) ( not ( = ?auto_34929 ?auto_34931 ) ) ( not ( = ?auto_34930 ?auto_34932 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34928 ?auto_34929 ?auto_34927 ?auto_34924 )
      ( GET-4IMAGE-VERIFY ?auto_34925 ?auto_34926 ?auto_34927 ?auto_34924 ?auto_34928 ?auto_34929 ?auto_34930 ?auto_34931 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34947 - DIRECTION
      ?auto_34948 - MODE
      ?auto_34949 - DIRECTION
      ?auto_34946 - MODE
      ?auto_34950 - DIRECTION
      ?auto_34951 - MODE
      ?auto_34952 - DIRECTION
      ?auto_34953 - MODE
    )
    :vars
    (
      ?auto_34956 - INSTRUMENT
      ?auto_34955 - SATELLITE
      ?auto_34954 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34956 ?auto_34955 ) ( SUPPORTS ?auto_34956 ?auto_34946 ) ( POWER_ON ?auto_34956 ) ( POINTING ?auto_34955 ?auto_34954 ) ( not ( = ?auto_34949 ?auto_34954 ) ) ( HAVE_IMAGE ?auto_34952 ?auto_34953 ) ( not ( = ?auto_34952 ?auto_34949 ) ) ( not ( = ?auto_34952 ?auto_34954 ) ) ( not ( = ?auto_34953 ?auto_34946 ) ) ( CALIBRATION_TARGET ?auto_34956 ?auto_34954 ) ( NOT_CALIBRATED ?auto_34956 ) ( HAVE_IMAGE ?auto_34947 ?auto_34948 ) ( HAVE_IMAGE ?auto_34950 ?auto_34951 ) ( not ( = ?auto_34947 ?auto_34949 ) ) ( not ( = ?auto_34947 ?auto_34950 ) ) ( not ( = ?auto_34947 ?auto_34952 ) ) ( not ( = ?auto_34947 ?auto_34954 ) ) ( not ( = ?auto_34948 ?auto_34946 ) ) ( not ( = ?auto_34948 ?auto_34951 ) ) ( not ( = ?auto_34948 ?auto_34953 ) ) ( not ( = ?auto_34949 ?auto_34950 ) ) ( not ( = ?auto_34946 ?auto_34951 ) ) ( not ( = ?auto_34950 ?auto_34952 ) ) ( not ( = ?auto_34950 ?auto_34954 ) ) ( not ( = ?auto_34951 ?auto_34953 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34952 ?auto_34953 ?auto_34949 ?auto_34946 )
      ( GET-4IMAGE-VERIFY ?auto_34947 ?auto_34948 ?auto_34949 ?auto_34946 ?auto_34950 ?auto_34951 ?auto_34952 ?auto_34953 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_34958 - DIRECTION
      ?auto_34959 - MODE
      ?auto_34960 - DIRECTION
      ?auto_34957 - MODE
      ?auto_34961 - DIRECTION
      ?auto_34962 - MODE
      ?auto_34963 - DIRECTION
      ?auto_34964 - MODE
    )
    :vars
    (
      ?auto_34967 - INSTRUMENT
      ?auto_34966 - SATELLITE
      ?auto_34965 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_34967 ?auto_34966 ) ( SUPPORTS ?auto_34967 ?auto_34957 ) ( POWER_ON ?auto_34967 ) ( POINTING ?auto_34966 ?auto_34965 ) ( not ( = ?auto_34960 ?auto_34965 ) ) ( HAVE_IMAGE ?auto_34958 ?auto_34959 ) ( not ( = ?auto_34958 ?auto_34960 ) ) ( not ( = ?auto_34958 ?auto_34965 ) ) ( not ( = ?auto_34959 ?auto_34957 ) ) ( CALIBRATION_TARGET ?auto_34967 ?auto_34965 ) ( NOT_CALIBRATED ?auto_34967 ) ( HAVE_IMAGE ?auto_34961 ?auto_34962 ) ( HAVE_IMAGE ?auto_34963 ?auto_34964 ) ( not ( = ?auto_34958 ?auto_34961 ) ) ( not ( = ?auto_34958 ?auto_34963 ) ) ( not ( = ?auto_34959 ?auto_34962 ) ) ( not ( = ?auto_34959 ?auto_34964 ) ) ( not ( = ?auto_34960 ?auto_34961 ) ) ( not ( = ?auto_34960 ?auto_34963 ) ) ( not ( = ?auto_34957 ?auto_34962 ) ) ( not ( = ?auto_34957 ?auto_34964 ) ) ( not ( = ?auto_34961 ?auto_34963 ) ) ( not ( = ?auto_34961 ?auto_34965 ) ) ( not ( = ?auto_34962 ?auto_34964 ) ) ( not ( = ?auto_34963 ?auto_34965 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34958 ?auto_34959 ?auto_34960 ?auto_34957 )
      ( GET-4IMAGE-VERIFY ?auto_34958 ?auto_34959 ?auto_34960 ?auto_34957 ?auto_34961 ?auto_34962 ?auto_34963 ?auto_34964 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35013 - DIRECTION
      ?auto_35014 - MODE
      ?auto_35015 - DIRECTION
      ?auto_35012 - MODE
      ?auto_35016 - DIRECTION
      ?auto_35017 - MODE
      ?auto_35018 - DIRECTION
      ?auto_35019 - MODE
    )
    :vars
    (
      ?auto_35022 - INSTRUMENT
      ?auto_35021 - SATELLITE
      ?auto_35020 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35022 ?auto_35021 ) ( SUPPORTS ?auto_35022 ?auto_35019 ) ( POWER_ON ?auto_35022 ) ( POINTING ?auto_35021 ?auto_35020 ) ( not ( = ?auto_35018 ?auto_35020 ) ) ( HAVE_IMAGE ?auto_35015 ?auto_35017 ) ( not ( = ?auto_35015 ?auto_35018 ) ) ( not ( = ?auto_35015 ?auto_35020 ) ) ( not ( = ?auto_35017 ?auto_35019 ) ) ( CALIBRATION_TARGET ?auto_35022 ?auto_35020 ) ( NOT_CALIBRATED ?auto_35022 ) ( HAVE_IMAGE ?auto_35013 ?auto_35014 ) ( HAVE_IMAGE ?auto_35015 ?auto_35012 ) ( HAVE_IMAGE ?auto_35016 ?auto_35017 ) ( not ( = ?auto_35013 ?auto_35015 ) ) ( not ( = ?auto_35013 ?auto_35016 ) ) ( not ( = ?auto_35013 ?auto_35018 ) ) ( not ( = ?auto_35013 ?auto_35020 ) ) ( not ( = ?auto_35014 ?auto_35012 ) ) ( not ( = ?auto_35014 ?auto_35017 ) ) ( not ( = ?auto_35014 ?auto_35019 ) ) ( not ( = ?auto_35015 ?auto_35016 ) ) ( not ( = ?auto_35012 ?auto_35017 ) ) ( not ( = ?auto_35012 ?auto_35019 ) ) ( not ( = ?auto_35016 ?auto_35018 ) ) ( not ( = ?auto_35016 ?auto_35020 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35015 ?auto_35017 ?auto_35018 ?auto_35019 )
      ( GET-4IMAGE-VERIFY ?auto_35013 ?auto_35014 ?auto_35015 ?auto_35012 ?auto_35016 ?auto_35017 ?auto_35018 ?auto_35019 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35024 - DIRECTION
      ?auto_35025 - MODE
      ?auto_35026 - DIRECTION
      ?auto_35023 - MODE
      ?auto_35027 - DIRECTION
      ?auto_35028 - MODE
      ?auto_35029 - DIRECTION
      ?auto_35030 - MODE
    )
    :vars
    (
      ?auto_35033 - INSTRUMENT
      ?auto_35032 - SATELLITE
      ?auto_35031 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35033 ?auto_35032 ) ( SUPPORTS ?auto_35033 ?auto_35030 ) ( POWER_ON ?auto_35033 ) ( POINTING ?auto_35032 ?auto_35031 ) ( not ( = ?auto_35029 ?auto_35031 ) ) ( HAVE_IMAGE ?auto_35026 ?auto_35023 ) ( not ( = ?auto_35026 ?auto_35029 ) ) ( not ( = ?auto_35026 ?auto_35031 ) ) ( not ( = ?auto_35023 ?auto_35030 ) ) ( CALIBRATION_TARGET ?auto_35033 ?auto_35031 ) ( NOT_CALIBRATED ?auto_35033 ) ( HAVE_IMAGE ?auto_35024 ?auto_35025 ) ( HAVE_IMAGE ?auto_35027 ?auto_35028 ) ( not ( = ?auto_35024 ?auto_35026 ) ) ( not ( = ?auto_35024 ?auto_35027 ) ) ( not ( = ?auto_35024 ?auto_35029 ) ) ( not ( = ?auto_35024 ?auto_35031 ) ) ( not ( = ?auto_35025 ?auto_35023 ) ) ( not ( = ?auto_35025 ?auto_35028 ) ) ( not ( = ?auto_35025 ?auto_35030 ) ) ( not ( = ?auto_35026 ?auto_35027 ) ) ( not ( = ?auto_35023 ?auto_35028 ) ) ( not ( = ?auto_35027 ?auto_35029 ) ) ( not ( = ?auto_35027 ?auto_35031 ) ) ( not ( = ?auto_35028 ?auto_35030 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35026 ?auto_35023 ?auto_35029 ?auto_35030 )
      ( GET-4IMAGE-VERIFY ?auto_35024 ?auto_35025 ?auto_35026 ?auto_35023 ?auto_35027 ?auto_35028 ?auto_35029 ?auto_35030 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35046 - DIRECTION
      ?auto_35047 - MODE
      ?auto_35048 - DIRECTION
      ?auto_35045 - MODE
      ?auto_35049 - DIRECTION
      ?auto_35050 - MODE
      ?auto_35051 - DIRECTION
      ?auto_35052 - MODE
    )
    :vars
    (
      ?auto_35055 - INSTRUMENT
      ?auto_35054 - SATELLITE
      ?auto_35053 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35055 ?auto_35054 ) ( SUPPORTS ?auto_35055 ?auto_35050 ) ( POWER_ON ?auto_35055 ) ( POINTING ?auto_35054 ?auto_35053 ) ( not ( = ?auto_35049 ?auto_35053 ) ) ( HAVE_IMAGE ?auto_35048 ?auto_35045 ) ( not ( = ?auto_35048 ?auto_35049 ) ) ( not ( = ?auto_35048 ?auto_35053 ) ) ( not ( = ?auto_35045 ?auto_35050 ) ) ( CALIBRATION_TARGET ?auto_35055 ?auto_35053 ) ( NOT_CALIBRATED ?auto_35055 ) ( HAVE_IMAGE ?auto_35046 ?auto_35047 ) ( HAVE_IMAGE ?auto_35051 ?auto_35052 ) ( not ( = ?auto_35046 ?auto_35048 ) ) ( not ( = ?auto_35046 ?auto_35049 ) ) ( not ( = ?auto_35046 ?auto_35051 ) ) ( not ( = ?auto_35046 ?auto_35053 ) ) ( not ( = ?auto_35047 ?auto_35045 ) ) ( not ( = ?auto_35047 ?auto_35050 ) ) ( not ( = ?auto_35047 ?auto_35052 ) ) ( not ( = ?auto_35048 ?auto_35051 ) ) ( not ( = ?auto_35045 ?auto_35052 ) ) ( not ( = ?auto_35049 ?auto_35051 ) ) ( not ( = ?auto_35050 ?auto_35052 ) ) ( not ( = ?auto_35051 ?auto_35053 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35048 ?auto_35045 ?auto_35049 ?auto_35050 )
      ( GET-4IMAGE-VERIFY ?auto_35046 ?auto_35047 ?auto_35048 ?auto_35045 ?auto_35049 ?auto_35050 ?auto_35051 ?auto_35052 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35079 - DIRECTION
      ?auto_35080 - MODE
      ?auto_35081 - DIRECTION
      ?auto_35078 - MODE
      ?auto_35082 - DIRECTION
      ?auto_35083 - MODE
      ?auto_35084 - DIRECTION
      ?auto_35085 - MODE
    )
    :vars
    (
      ?auto_35088 - INSTRUMENT
      ?auto_35087 - SATELLITE
      ?auto_35086 - DIRECTION
      ?auto_35089 - DIRECTION
      ?auto_35090 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_35088 ?auto_35087 ) ( SUPPORTS ?auto_35088 ?auto_35085 ) ( POWER_ON ?auto_35088 ) ( POINTING ?auto_35087 ?auto_35086 ) ( not ( = ?auto_35084 ?auto_35086 ) ) ( HAVE_IMAGE ?auto_35089 ?auto_35090 ) ( not ( = ?auto_35089 ?auto_35084 ) ) ( not ( = ?auto_35089 ?auto_35086 ) ) ( not ( = ?auto_35090 ?auto_35085 ) ) ( CALIBRATION_TARGET ?auto_35088 ?auto_35086 ) ( NOT_CALIBRATED ?auto_35088 ) ( HAVE_IMAGE ?auto_35079 ?auto_35080 ) ( HAVE_IMAGE ?auto_35081 ?auto_35078 ) ( HAVE_IMAGE ?auto_35082 ?auto_35083 ) ( not ( = ?auto_35079 ?auto_35081 ) ) ( not ( = ?auto_35079 ?auto_35082 ) ) ( not ( = ?auto_35079 ?auto_35084 ) ) ( not ( = ?auto_35079 ?auto_35086 ) ) ( not ( = ?auto_35079 ?auto_35089 ) ) ( not ( = ?auto_35080 ?auto_35078 ) ) ( not ( = ?auto_35080 ?auto_35083 ) ) ( not ( = ?auto_35080 ?auto_35085 ) ) ( not ( = ?auto_35080 ?auto_35090 ) ) ( not ( = ?auto_35081 ?auto_35082 ) ) ( not ( = ?auto_35081 ?auto_35084 ) ) ( not ( = ?auto_35081 ?auto_35086 ) ) ( not ( = ?auto_35081 ?auto_35089 ) ) ( not ( = ?auto_35078 ?auto_35083 ) ) ( not ( = ?auto_35078 ?auto_35085 ) ) ( not ( = ?auto_35078 ?auto_35090 ) ) ( not ( = ?auto_35082 ?auto_35084 ) ) ( not ( = ?auto_35082 ?auto_35086 ) ) ( not ( = ?auto_35082 ?auto_35089 ) ) ( not ( = ?auto_35083 ?auto_35085 ) ) ( not ( = ?auto_35083 ?auto_35090 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35089 ?auto_35090 ?auto_35084 ?auto_35085 )
      ( GET-4IMAGE-VERIFY ?auto_35079 ?auto_35080 ?auto_35081 ?auto_35078 ?auto_35082 ?auto_35083 ?auto_35084 ?auto_35085 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35092 - DIRECTION
      ?auto_35093 - MODE
      ?auto_35094 - DIRECTION
      ?auto_35091 - MODE
      ?auto_35095 - DIRECTION
      ?auto_35096 - MODE
      ?auto_35097 - DIRECTION
      ?auto_35098 - MODE
    )
    :vars
    (
      ?auto_35101 - INSTRUMENT
      ?auto_35100 - SATELLITE
      ?auto_35099 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35101 ?auto_35100 ) ( SUPPORTS ?auto_35101 ?auto_35096 ) ( POWER_ON ?auto_35101 ) ( POINTING ?auto_35100 ?auto_35099 ) ( not ( = ?auto_35095 ?auto_35099 ) ) ( HAVE_IMAGE ?auto_35097 ?auto_35098 ) ( not ( = ?auto_35097 ?auto_35095 ) ) ( not ( = ?auto_35097 ?auto_35099 ) ) ( not ( = ?auto_35098 ?auto_35096 ) ) ( CALIBRATION_TARGET ?auto_35101 ?auto_35099 ) ( NOT_CALIBRATED ?auto_35101 ) ( HAVE_IMAGE ?auto_35092 ?auto_35093 ) ( HAVE_IMAGE ?auto_35094 ?auto_35091 ) ( not ( = ?auto_35092 ?auto_35094 ) ) ( not ( = ?auto_35092 ?auto_35095 ) ) ( not ( = ?auto_35092 ?auto_35097 ) ) ( not ( = ?auto_35092 ?auto_35099 ) ) ( not ( = ?auto_35093 ?auto_35091 ) ) ( not ( = ?auto_35093 ?auto_35096 ) ) ( not ( = ?auto_35093 ?auto_35098 ) ) ( not ( = ?auto_35094 ?auto_35095 ) ) ( not ( = ?auto_35094 ?auto_35097 ) ) ( not ( = ?auto_35094 ?auto_35099 ) ) ( not ( = ?auto_35091 ?auto_35096 ) ) ( not ( = ?auto_35091 ?auto_35098 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35097 ?auto_35098 ?auto_35095 ?auto_35096 )
      ( GET-4IMAGE-VERIFY ?auto_35092 ?auto_35093 ?auto_35094 ?auto_35091 ?auto_35095 ?auto_35096 ?auto_35097 ?auto_35098 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35103 - DIRECTION
      ?auto_35104 - MODE
      ?auto_35105 - DIRECTION
      ?auto_35102 - MODE
      ?auto_35106 - DIRECTION
      ?auto_35107 - MODE
      ?auto_35108 - DIRECTION
      ?auto_35109 - MODE
    )
    :vars
    (
      ?auto_35112 - INSTRUMENT
      ?auto_35111 - SATELLITE
      ?auto_35110 - DIRECTION
      ?auto_35113 - DIRECTION
      ?auto_35114 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_35112 ?auto_35111 ) ( SUPPORTS ?auto_35112 ?auto_35107 ) ( POWER_ON ?auto_35112 ) ( POINTING ?auto_35111 ?auto_35110 ) ( not ( = ?auto_35106 ?auto_35110 ) ) ( HAVE_IMAGE ?auto_35113 ?auto_35114 ) ( not ( = ?auto_35113 ?auto_35106 ) ) ( not ( = ?auto_35113 ?auto_35110 ) ) ( not ( = ?auto_35114 ?auto_35107 ) ) ( CALIBRATION_TARGET ?auto_35112 ?auto_35110 ) ( NOT_CALIBRATED ?auto_35112 ) ( HAVE_IMAGE ?auto_35103 ?auto_35104 ) ( HAVE_IMAGE ?auto_35105 ?auto_35102 ) ( HAVE_IMAGE ?auto_35108 ?auto_35109 ) ( not ( = ?auto_35103 ?auto_35105 ) ) ( not ( = ?auto_35103 ?auto_35106 ) ) ( not ( = ?auto_35103 ?auto_35108 ) ) ( not ( = ?auto_35103 ?auto_35110 ) ) ( not ( = ?auto_35103 ?auto_35113 ) ) ( not ( = ?auto_35104 ?auto_35102 ) ) ( not ( = ?auto_35104 ?auto_35107 ) ) ( not ( = ?auto_35104 ?auto_35109 ) ) ( not ( = ?auto_35104 ?auto_35114 ) ) ( not ( = ?auto_35105 ?auto_35106 ) ) ( not ( = ?auto_35105 ?auto_35108 ) ) ( not ( = ?auto_35105 ?auto_35110 ) ) ( not ( = ?auto_35105 ?auto_35113 ) ) ( not ( = ?auto_35102 ?auto_35107 ) ) ( not ( = ?auto_35102 ?auto_35109 ) ) ( not ( = ?auto_35102 ?auto_35114 ) ) ( not ( = ?auto_35106 ?auto_35108 ) ) ( not ( = ?auto_35107 ?auto_35109 ) ) ( not ( = ?auto_35108 ?auto_35110 ) ) ( not ( = ?auto_35108 ?auto_35113 ) ) ( not ( = ?auto_35109 ?auto_35114 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35113 ?auto_35114 ?auto_35106 ?auto_35107 )
      ( GET-4IMAGE-VERIFY ?auto_35103 ?auto_35104 ?auto_35105 ?auto_35102 ?auto_35106 ?auto_35107 ?auto_35108 ?auto_35109 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35129 - DIRECTION
      ?auto_35130 - MODE
      ?auto_35131 - DIRECTION
      ?auto_35128 - MODE
      ?auto_35132 - DIRECTION
      ?auto_35133 - MODE
      ?auto_35134 - DIRECTION
      ?auto_35135 - MODE
    )
    :vars
    (
      ?auto_35138 - INSTRUMENT
      ?auto_35137 - SATELLITE
      ?auto_35136 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35138 ?auto_35137 ) ( SUPPORTS ?auto_35138 ?auto_35128 ) ( POWER_ON ?auto_35138 ) ( POINTING ?auto_35137 ?auto_35136 ) ( not ( = ?auto_35131 ?auto_35136 ) ) ( HAVE_IMAGE ?auto_35134 ?auto_35133 ) ( not ( = ?auto_35134 ?auto_35131 ) ) ( not ( = ?auto_35134 ?auto_35136 ) ) ( not ( = ?auto_35133 ?auto_35128 ) ) ( CALIBRATION_TARGET ?auto_35138 ?auto_35136 ) ( NOT_CALIBRATED ?auto_35138 ) ( HAVE_IMAGE ?auto_35129 ?auto_35130 ) ( HAVE_IMAGE ?auto_35132 ?auto_35133 ) ( HAVE_IMAGE ?auto_35134 ?auto_35135 ) ( not ( = ?auto_35129 ?auto_35131 ) ) ( not ( = ?auto_35129 ?auto_35132 ) ) ( not ( = ?auto_35129 ?auto_35134 ) ) ( not ( = ?auto_35129 ?auto_35136 ) ) ( not ( = ?auto_35130 ?auto_35128 ) ) ( not ( = ?auto_35130 ?auto_35133 ) ) ( not ( = ?auto_35130 ?auto_35135 ) ) ( not ( = ?auto_35131 ?auto_35132 ) ) ( not ( = ?auto_35128 ?auto_35135 ) ) ( not ( = ?auto_35132 ?auto_35134 ) ) ( not ( = ?auto_35132 ?auto_35136 ) ) ( not ( = ?auto_35133 ?auto_35135 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35134 ?auto_35133 ?auto_35131 ?auto_35128 )
      ( GET-4IMAGE-VERIFY ?auto_35129 ?auto_35130 ?auto_35131 ?auto_35128 ?auto_35132 ?auto_35133 ?auto_35134 ?auto_35135 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35173 - DIRECTION
      ?auto_35174 - MODE
      ?auto_35175 - DIRECTION
      ?auto_35172 - MODE
      ?auto_35176 - DIRECTION
      ?auto_35177 - MODE
      ?auto_35178 - DIRECTION
      ?auto_35179 - MODE
    )
    :vars
    (
      ?auto_35182 - INSTRUMENT
      ?auto_35181 - SATELLITE
      ?auto_35180 - DIRECTION
      ?auto_35183 - DIRECTION
      ?auto_35184 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_35182 ?auto_35181 ) ( SUPPORTS ?auto_35182 ?auto_35172 ) ( POWER_ON ?auto_35182 ) ( POINTING ?auto_35181 ?auto_35180 ) ( not ( = ?auto_35175 ?auto_35180 ) ) ( HAVE_IMAGE ?auto_35183 ?auto_35184 ) ( not ( = ?auto_35183 ?auto_35175 ) ) ( not ( = ?auto_35183 ?auto_35180 ) ) ( not ( = ?auto_35184 ?auto_35172 ) ) ( CALIBRATION_TARGET ?auto_35182 ?auto_35180 ) ( NOT_CALIBRATED ?auto_35182 ) ( HAVE_IMAGE ?auto_35173 ?auto_35174 ) ( HAVE_IMAGE ?auto_35176 ?auto_35177 ) ( HAVE_IMAGE ?auto_35178 ?auto_35179 ) ( not ( = ?auto_35173 ?auto_35175 ) ) ( not ( = ?auto_35173 ?auto_35176 ) ) ( not ( = ?auto_35173 ?auto_35178 ) ) ( not ( = ?auto_35173 ?auto_35180 ) ) ( not ( = ?auto_35173 ?auto_35183 ) ) ( not ( = ?auto_35174 ?auto_35172 ) ) ( not ( = ?auto_35174 ?auto_35177 ) ) ( not ( = ?auto_35174 ?auto_35179 ) ) ( not ( = ?auto_35174 ?auto_35184 ) ) ( not ( = ?auto_35175 ?auto_35176 ) ) ( not ( = ?auto_35175 ?auto_35178 ) ) ( not ( = ?auto_35172 ?auto_35177 ) ) ( not ( = ?auto_35172 ?auto_35179 ) ) ( not ( = ?auto_35176 ?auto_35178 ) ) ( not ( = ?auto_35176 ?auto_35180 ) ) ( not ( = ?auto_35176 ?auto_35183 ) ) ( not ( = ?auto_35177 ?auto_35179 ) ) ( not ( = ?auto_35177 ?auto_35184 ) ) ( not ( = ?auto_35178 ?auto_35180 ) ) ( not ( = ?auto_35178 ?auto_35183 ) ) ( not ( = ?auto_35179 ?auto_35184 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35183 ?auto_35184 ?auto_35175 ?auto_35172 )
      ( GET-4IMAGE-VERIFY ?auto_35173 ?auto_35174 ?auto_35175 ?auto_35172 ?auto_35176 ?auto_35177 ?auto_35178 ?auto_35179 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35247 - DIRECTION
      ?auto_35248 - MODE
      ?auto_35249 - DIRECTION
      ?auto_35246 - MODE
      ?auto_35250 - DIRECTION
      ?auto_35251 - MODE
      ?auto_35252 - DIRECTION
      ?auto_35253 - MODE
    )
    :vars
    (
      ?auto_35256 - INSTRUMENT
      ?auto_35255 - SATELLITE
      ?auto_35254 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35256 ?auto_35255 ) ( SUPPORTS ?auto_35256 ?auto_35248 ) ( POWER_ON ?auto_35256 ) ( POINTING ?auto_35255 ?auto_35254 ) ( not ( = ?auto_35247 ?auto_35254 ) ) ( HAVE_IMAGE ?auto_35249 ?auto_35246 ) ( not ( = ?auto_35249 ?auto_35247 ) ) ( not ( = ?auto_35249 ?auto_35254 ) ) ( not ( = ?auto_35246 ?auto_35248 ) ) ( CALIBRATION_TARGET ?auto_35256 ?auto_35254 ) ( NOT_CALIBRATED ?auto_35256 ) ( HAVE_IMAGE ?auto_35250 ?auto_35251 ) ( HAVE_IMAGE ?auto_35252 ?auto_35253 ) ( not ( = ?auto_35247 ?auto_35250 ) ) ( not ( = ?auto_35247 ?auto_35252 ) ) ( not ( = ?auto_35248 ?auto_35251 ) ) ( not ( = ?auto_35248 ?auto_35253 ) ) ( not ( = ?auto_35249 ?auto_35250 ) ) ( not ( = ?auto_35249 ?auto_35252 ) ) ( not ( = ?auto_35246 ?auto_35251 ) ) ( not ( = ?auto_35246 ?auto_35253 ) ) ( not ( = ?auto_35250 ?auto_35252 ) ) ( not ( = ?auto_35250 ?auto_35254 ) ) ( not ( = ?auto_35251 ?auto_35253 ) ) ( not ( = ?auto_35252 ?auto_35254 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35249 ?auto_35246 ?auto_35247 ?auto_35248 )
      ( GET-4IMAGE-VERIFY ?auto_35247 ?auto_35248 ?auto_35249 ?auto_35246 ?auto_35250 ?auto_35251 ?auto_35252 ?auto_35253 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35335 - DIRECTION
      ?auto_35336 - MODE
      ?auto_35337 - DIRECTION
      ?auto_35334 - MODE
      ?auto_35338 - DIRECTION
      ?auto_35339 - MODE
      ?auto_35340 - DIRECTION
      ?auto_35341 - MODE
    )
    :vars
    (
      ?auto_35344 - INSTRUMENT
      ?auto_35343 - SATELLITE
      ?auto_35342 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35344 ?auto_35343 ) ( SUPPORTS ?auto_35344 ?auto_35336 ) ( POWER_ON ?auto_35344 ) ( POINTING ?auto_35343 ?auto_35342 ) ( not ( = ?auto_35335 ?auto_35342 ) ) ( HAVE_IMAGE ?auto_35338 ?auto_35339 ) ( not ( = ?auto_35338 ?auto_35335 ) ) ( not ( = ?auto_35338 ?auto_35342 ) ) ( not ( = ?auto_35339 ?auto_35336 ) ) ( CALIBRATION_TARGET ?auto_35344 ?auto_35342 ) ( NOT_CALIBRATED ?auto_35344 ) ( HAVE_IMAGE ?auto_35337 ?auto_35334 ) ( HAVE_IMAGE ?auto_35340 ?auto_35341 ) ( not ( = ?auto_35335 ?auto_35337 ) ) ( not ( = ?auto_35335 ?auto_35340 ) ) ( not ( = ?auto_35336 ?auto_35334 ) ) ( not ( = ?auto_35336 ?auto_35341 ) ) ( not ( = ?auto_35337 ?auto_35338 ) ) ( not ( = ?auto_35337 ?auto_35340 ) ) ( not ( = ?auto_35337 ?auto_35342 ) ) ( not ( = ?auto_35334 ?auto_35339 ) ) ( not ( = ?auto_35334 ?auto_35341 ) ) ( not ( = ?auto_35338 ?auto_35340 ) ) ( not ( = ?auto_35339 ?auto_35341 ) ) ( not ( = ?auto_35340 ?auto_35342 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35338 ?auto_35339 ?auto_35335 ?auto_35336 )
      ( GET-4IMAGE-VERIFY ?auto_35335 ?auto_35336 ?auto_35337 ?auto_35334 ?auto_35338 ?auto_35339 ?auto_35340 ?auto_35341 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35368 - DIRECTION
      ?auto_35369 - MODE
      ?auto_35370 - DIRECTION
      ?auto_35367 - MODE
      ?auto_35371 - DIRECTION
      ?auto_35372 - MODE
      ?auto_35373 - DIRECTION
      ?auto_35374 - MODE
    )
    :vars
    (
      ?auto_35377 - INSTRUMENT
      ?auto_35376 - SATELLITE
      ?auto_35375 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35377 ?auto_35376 ) ( SUPPORTS ?auto_35377 ?auto_35369 ) ( POWER_ON ?auto_35377 ) ( POINTING ?auto_35376 ?auto_35375 ) ( not ( = ?auto_35368 ?auto_35375 ) ) ( HAVE_IMAGE ?auto_35373 ?auto_35374 ) ( not ( = ?auto_35373 ?auto_35368 ) ) ( not ( = ?auto_35373 ?auto_35375 ) ) ( not ( = ?auto_35374 ?auto_35369 ) ) ( CALIBRATION_TARGET ?auto_35377 ?auto_35375 ) ( NOT_CALIBRATED ?auto_35377 ) ( HAVE_IMAGE ?auto_35370 ?auto_35367 ) ( HAVE_IMAGE ?auto_35371 ?auto_35372 ) ( not ( = ?auto_35368 ?auto_35370 ) ) ( not ( = ?auto_35368 ?auto_35371 ) ) ( not ( = ?auto_35369 ?auto_35367 ) ) ( not ( = ?auto_35369 ?auto_35372 ) ) ( not ( = ?auto_35370 ?auto_35371 ) ) ( not ( = ?auto_35370 ?auto_35373 ) ) ( not ( = ?auto_35370 ?auto_35375 ) ) ( not ( = ?auto_35367 ?auto_35372 ) ) ( not ( = ?auto_35367 ?auto_35374 ) ) ( not ( = ?auto_35371 ?auto_35373 ) ) ( not ( = ?auto_35371 ?auto_35375 ) ) ( not ( = ?auto_35372 ?auto_35374 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35373 ?auto_35374 ?auto_35368 ?auto_35369 )
      ( GET-4IMAGE-VERIFY ?auto_35368 ?auto_35369 ?auto_35370 ?auto_35367 ?auto_35371 ?auto_35372 ?auto_35373 ?auto_35374 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35379 - DIRECTION
      ?auto_35380 - MODE
      ?auto_35381 - DIRECTION
      ?auto_35378 - MODE
      ?auto_35382 - DIRECTION
      ?auto_35383 - MODE
      ?auto_35384 - DIRECTION
      ?auto_35385 - MODE
    )
    :vars
    (
      ?auto_35388 - INSTRUMENT
      ?auto_35387 - SATELLITE
      ?auto_35386 - DIRECTION
      ?auto_35389 - DIRECTION
      ?auto_35390 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_35388 ?auto_35387 ) ( SUPPORTS ?auto_35388 ?auto_35380 ) ( POWER_ON ?auto_35388 ) ( POINTING ?auto_35387 ?auto_35386 ) ( not ( = ?auto_35379 ?auto_35386 ) ) ( HAVE_IMAGE ?auto_35389 ?auto_35390 ) ( not ( = ?auto_35389 ?auto_35379 ) ) ( not ( = ?auto_35389 ?auto_35386 ) ) ( not ( = ?auto_35390 ?auto_35380 ) ) ( CALIBRATION_TARGET ?auto_35388 ?auto_35386 ) ( NOT_CALIBRATED ?auto_35388 ) ( HAVE_IMAGE ?auto_35381 ?auto_35378 ) ( HAVE_IMAGE ?auto_35382 ?auto_35383 ) ( HAVE_IMAGE ?auto_35384 ?auto_35385 ) ( not ( = ?auto_35379 ?auto_35381 ) ) ( not ( = ?auto_35379 ?auto_35382 ) ) ( not ( = ?auto_35379 ?auto_35384 ) ) ( not ( = ?auto_35380 ?auto_35378 ) ) ( not ( = ?auto_35380 ?auto_35383 ) ) ( not ( = ?auto_35380 ?auto_35385 ) ) ( not ( = ?auto_35381 ?auto_35382 ) ) ( not ( = ?auto_35381 ?auto_35384 ) ) ( not ( = ?auto_35381 ?auto_35386 ) ) ( not ( = ?auto_35381 ?auto_35389 ) ) ( not ( = ?auto_35378 ?auto_35383 ) ) ( not ( = ?auto_35378 ?auto_35385 ) ) ( not ( = ?auto_35378 ?auto_35390 ) ) ( not ( = ?auto_35382 ?auto_35384 ) ) ( not ( = ?auto_35382 ?auto_35386 ) ) ( not ( = ?auto_35382 ?auto_35389 ) ) ( not ( = ?auto_35383 ?auto_35385 ) ) ( not ( = ?auto_35383 ?auto_35390 ) ) ( not ( = ?auto_35384 ?auto_35386 ) ) ( not ( = ?auto_35384 ?auto_35389 ) ) ( not ( = ?auto_35385 ?auto_35390 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35389 ?auto_35390 ?auto_35379 ?auto_35380 )
      ( GET-4IMAGE-VERIFY ?auto_35379 ?auto_35380 ?auto_35381 ?auto_35378 ?auto_35382 ?auto_35383 ?auto_35384 ?auto_35385 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_35602 - DIRECTION
      ?auto_35603 - MODE
      ?auto_35604 - DIRECTION
      ?auto_35601 - MODE
      ?auto_35605 - DIRECTION
      ?auto_35606 - MODE
    )
    :vars
    (
      ?auto_35608 - INSTRUMENT
      ?auto_35609 - SATELLITE
      ?auto_35607 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35608 ?auto_35609 ) ( SUPPORTS ?auto_35608 ?auto_35601 ) ( POINTING ?auto_35609 ?auto_35607 ) ( not ( = ?auto_35604 ?auto_35607 ) ) ( HAVE_IMAGE ?auto_35602 ?auto_35603 ) ( not ( = ?auto_35602 ?auto_35604 ) ) ( not ( = ?auto_35602 ?auto_35607 ) ) ( not ( = ?auto_35603 ?auto_35601 ) ) ( CALIBRATION_TARGET ?auto_35608 ?auto_35607 ) ( POWER_AVAIL ?auto_35609 ) ( HAVE_IMAGE ?auto_35605 ?auto_35606 ) ( not ( = ?auto_35602 ?auto_35605 ) ) ( not ( = ?auto_35603 ?auto_35606 ) ) ( not ( = ?auto_35604 ?auto_35605 ) ) ( not ( = ?auto_35601 ?auto_35606 ) ) ( not ( = ?auto_35605 ?auto_35607 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35602 ?auto_35603 ?auto_35604 ?auto_35601 )
      ( GET-3IMAGE-VERIFY ?auto_35602 ?auto_35603 ?auto_35604 ?auto_35601 ?auto_35605 ?auto_35606 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_35632 - DIRECTION
      ?auto_35633 - MODE
      ?auto_35634 - DIRECTION
      ?auto_35631 - MODE
      ?auto_35635 - DIRECTION
      ?auto_35636 - MODE
    )
    :vars
    (
      ?auto_35639 - INSTRUMENT
      ?auto_35640 - SATELLITE
      ?auto_35638 - DIRECTION
      ?auto_35641 - DIRECTION
      ?auto_35637 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_35639 ?auto_35640 ) ( SUPPORTS ?auto_35639 ?auto_35636 ) ( POINTING ?auto_35640 ?auto_35638 ) ( not ( = ?auto_35635 ?auto_35638 ) ) ( HAVE_IMAGE ?auto_35641 ?auto_35637 ) ( not ( = ?auto_35641 ?auto_35635 ) ) ( not ( = ?auto_35641 ?auto_35638 ) ) ( not ( = ?auto_35637 ?auto_35636 ) ) ( CALIBRATION_TARGET ?auto_35639 ?auto_35638 ) ( POWER_AVAIL ?auto_35640 ) ( HAVE_IMAGE ?auto_35632 ?auto_35633 ) ( HAVE_IMAGE ?auto_35634 ?auto_35631 ) ( not ( = ?auto_35632 ?auto_35634 ) ) ( not ( = ?auto_35632 ?auto_35635 ) ) ( not ( = ?auto_35632 ?auto_35638 ) ) ( not ( = ?auto_35632 ?auto_35641 ) ) ( not ( = ?auto_35633 ?auto_35631 ) ) ( not ( = ?auto_35633 ?auto_35636 ) ) ( not ( = ?auto_35633 ?auto_35637 ) ) ( not ( = ?auto_35634 ?auto_35635 ) ) ( not ( = ?auto_35634 ?auto_35638 ) ) ( not ( = ?auto_35634 ?auto_35641 ) ) ( not ( = ?auto_35631 ?auto_35636 ) ) ( not ( = ?auto_35631 ?auto_35637 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35641 ?auto_35637 ?auto_35635 ?auto_35636 )
      ( GET-3IMAGE-VERIFY ?auto_35632 ?auto_35633 ?auto_35634 ?auto_35631 ?auto_35635 ?auto_35636 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_35649 - DIRECTION
      ?auto_35650 - MODE
      ?auto_35651 - DIRECTION
      ?auto_35648 - MODE
      ?auto_35652 - DIRECTION
      ?auto_35653 - MODE
    )
    :vars
    (
      ?auto_35656 - INSTRUMENT
      ?auto_35657 - SATELLITE
      ?auto_35655 - DIRECTION
      ?auto_35658 - DIRECTION
      ?auto_35654 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_35656 ?auto_35657 ) ( SUPPORTS ?auto_35656 ?auto_35648 ) ( POINTING ?auto_35657 ?auto_35655 ) ( not ( = ?auto_35651 ?auto_35655 ) ) ( HAVE_IMAGE ?auto_35658 ?auto_35654 ) ( not ( = ?auto_35658 ?auto_35651 ) ) ( not ( = ?auto_35658 ?auto_35655 ) ) ( not ( = ?auto_35654 ?auto_35648 ) ) ( CALIBRATION_TARGET ?auto_35656 ?auto_35655 ) ( POWER_AVAIL ?auto_35657 ) ( HAVE_IMAGE ?auto_35649 ?auto_35650 ) ( HAVE_IMAGE ?auto_35652 ?auto_35653 ) ( not ( = ?auto_35649 ?auto_35651 ) ) ( not ( = ?auto_35649 ?auto_35652 ) ) ( not ( = ?auto_35649 ?auto_35655 ) ) ( not ( = ?auto_35649 ?auto_35658 ) ) ( not ( = ?auto_35650 ?auto_35648 ) ) ( not ( = ?auto_35650 ?auto_35653 ) ) ( not ( = ?auto_35650 ?auto_35654 ) ) ( not ( = ?auto_35651 ?auto_35652 ) ) ( not ( = ?auto_35648 ?auto_35653 ) ) ( not ( = ?auto_35652 ?auto_35655 ) ) ( not ( = ?auto_35652 ?auto_35658 ) ) ( not ( = ?auto_35653 ?auto_35654 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35658 ?auto_35654 ?auto_35651 ?auto_35648 )
      ( GET-3IMAGE-VERIFY ?auto_35649 ?auto_35650 ?auto_35651 ?auto_35648 ?auto_35652 ?auto_35653 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_35701 - DIRECTION
      ?auto_35702 - MODE
      ?auto_35703 - DIRECTION
      ?auto_35700 - MODE
      ?auto_35704 - DIRECTION
      ?auto_35705 - MODE
    )
    :vars
    (
      ?auto_35708 - INSTRUMENT
      ?auto_35709 - SATELLITE
      ?auto_35707 - DIRECTION
      ?auto_35710 - DIRECTION
      ?auto_35706 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_35708 ?auto_35709 ) ( SUPPORTS ?auto_35708 ?auto_35702 ) ( POINTING ?auto_35709 ?auto_35707 ) ( not ( = ?auto_35701 ?auto_35707 ) ) ( HAVE_IMAGE ?auto_35710 ?auto_35706 ) ( not ( = ?auto_35710 ?auto_35701 ) ) ( not ( = ?auto_35710 ?auto_35707 ) ) ( not ( = ?auto_35706 ?auto_35702 ) ) ( CALIBRATION_TARGET ?auto_35708 ?auto_35707 ) ( POWER_AVAIL ?auto_35709 ) ( HAVE_IMAGE ?auto_35703 ?auto_35700 ) ( HAVE_IMAGE ?auto_35704 ?auto_35705 ) ( not ( = ?auto_35701 ?auto_35703 ) ) ( not ( = ?auto_35701 ?auto_35704 ) ) ( not ( = ?auto_35702 ?auto_35700 ) ) ( not ( = ?auto_35702 ?auto_35705 ) ) ( not ( = ?auto_35703 ?auto_35704 ) ) ( not ( = ?auto_35703 ?auto_35707 ) ) ( not ( = ?auto_35703 ?auto_35710 ) ) ( not ( = ?auto_35700 ?auto_35705 ) ) ( not ( = ?auto_35700 ?auto_35706 ) ) ( not ( = ?auto_35704 ?auto_35707 ) ) ( not ( = ?auto_35704 ?auto_35710 ) ) ( not ( = ?auto_35705 ?auto_35706 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35710 ?auto_35706 ?auto_35701 ?auto_35702 )
      ( GET-3IMAGE-VERIFY ?auto_35701 ?auto_35702 ?auto_35703 ?auto_35700 ?auto_35704 ?auto_35705 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35754 - DIRECTION
      ?auto_35755 - MODE
      ?auto_35756 - DIRECTION
      ?auto_35753 - MODE
      ?auto_35757 - DIRECTION
      ?auto_35758 - MODE
      ?auto_35759 - DIRECTION
      ?auto_35760 - MODE
    )
    :vars
    (
      ?auto_35762 - INSTRUMENT
      ?auto_35763 - SATELLITE
      ?auto_35761 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35762 ?auto_35763 ) ( SUPPORTS ?auto_35762 ?auto_35760 ) ( POINTING ?auto_35763 ?auto_35761 ) ( not ( = ?auto_35759 ?auto_35761 ) ) ( HAVE_IMAGE ?auto_35757 ?auto_35758 ) ( not ( = ?auto_35757 ?auto_35759 ) ) ( not ( = ?auto_35757 ?auto_35761 ) ) ( not ( = ?auto_35758 ?auto_35760 ) ) ( CALIBRATION_TARGET ?auto_35762 ?auto_35761 ) ( POWER_AVAIL ?auto_35763 ) ( HAVE_IMAGE ?auto_35754 ?auto_35755 ) ( HAVE_IMAGE ?auto_35756 ?auto_35753 ) ( not ( = ?auto_35754 ?auto_35756 ) ) ( not ( = ?auto_35754 ?auto_35757 ) ) ( not ( = ?auto_35754 ?auto_35759 ) ) ( not ( = ?auto_35754 ?auto_35761 ) ) ( not ( = ?auto_35755 ?auto_35753 ) ) ( not ( = ?auto_35755 ?auto_35758 ) ) ( not ( = ?auto_35755 ?auto_35760 ) ) ( not ( = ?auto_35756 ?auto_35757 ) ) ( not ( = ?auto_35756 ?auto_35759 ) ) ( not ( = ?auto_35756 ?auto_35761 ) ) ( not ( = ?auto_35753 ?auto_35758 ) ) ( not ( = ?auto_35753 ?auto_35760 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35757 ?auto_35758 ?auto_35759 ?auto_35760 )
      ( GET-4IMAGE-VERIFY ?auto_35754 ?auto_35755 ?auto_35756 ?auto_35753 ?auto_35757 ?auto_35758 ?auto_35759 ?auto_35760 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35765 - DIRECTION
      ?auto_35766 - MODE
      ?auto_35767 - DIRECTION
      ?auto_35764 - MODE
      ?auto_35768 - DIRECTION
      ?auto_35769 - MODE
      ?auto_35770 - DIRECTION
      ?auto_35771 - MODE
    )
    :vars
    (
      ?auto_35773 - INSTRUMENT
      ?auto_35774 - SATELLITE
      ?auto_35772 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35773 ?auto_35774 ) ( SUPPORTS ?auto_35773 ?auto_35771 ) ( POINTING ?auto_35774 ?auto_35772 ) ( not ( = ?auto_35770 ?auto_35772 ) ) ( HAVE_IMAGE ?auto_35767 ?auto_35766 ) ( not ( = ?auto_35767 ?auto_35770 ) ) ( not ( = ?auto_35767 ?auto_35772 ) ) ( not ( = ?auto_35766 ?auto_35771 ) ) ( CALIBRATION_TARGET ?auto_35773 ?auto_35772 ) ( POWER_AVAIL ?auto_35774 ) ( HAVE_IMAGE ?auto_35765 ?auto_35766 ) ( HAVE_IMAGE ?auto_35767 ?auto_35764 ) ( HAVE_IMAGE ?auto_35768 ?auto_35769 ) ( not ( = ?auto_35765 ?auto_35767 ) ) ( not ( = ?auto_35765 ?auto_35768 ) ) ( not ( = ?auto_35765 ?auto_35770 ) ) ( not ( = ?auto_35765 ?auto_35772 ) ) ( not ( = ?auto_35766 ?auto_35764 ) ) ( not ( = ?auto_35766 ?auto_35769 ) ) ( not ( = ?auto_35767 ?auto_35768 ) ) ( not ( = ?auto_35764 ?auto_35769 ) ) ( not ( = ?auto_35764 ?auto_35771 ) ) ( not ( = ?auto_35768 ?auto_35770 ) ) ( not ( = ?auto_35768 ?auto_35772 ) ) ( not ( = ?auto_35769 ?auto_35771 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35767 ?auto_35766 ?auto_35770 ?auto_35771 )
      ( GET-4IMAGE-VERIFY ?auto_35765 ?auto_35766 ?auto_35767 ?auto_35764 ?auto_35768 ?auto_35769 ?auto_35770 ?auto_35771 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35776 - DIRECTION
      ?auto_35777 - MODE
      ?auto_35778 - DIRECTION
      ?auto_35775 - MODE
      ?auto_35779 - DIRECTION
      ?auto_35780 - MODE
      ?auto_35781 - DIRECTION
      ?auto_35782 - MODE
    )
    :vars
    (
      ?auto_35784 - INSTRUMENT
      ?auto_35785 - SATELLITE
      ?auto_35783 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35784 ?auto_35785 ) ( SUPPORTS ?auto_35784 ?auto_35780 ) ( POINTING ?auto_35785 ?auto_35783 ) ( not ( = ?auto_35779 ?auto_35783 ) ) ( HAVE_IMAGE ?auto_35778 ?auto_35782 ) ( not ( = ?auto_35778 ?auto_35779 ) ) ( not ( = ?auto_35778 ?auto_35783 ) ) ( not ( = ?auto_35782 ?auto_35780 ) ) ( CALIBRATION_TARGET ?auto_35784 ?auto_35783 ) ( POWER_AVAIL ?auto_35785 ) ( HAVE_IMAGE ?auto_35776 ?auto_35777 ) ( HAVE_IMAGE ?auto_35778 ?auto_35775 ) ( HAVE_IMAGE ?auto_35781 ?auto_35782 ) ( not ( = ?auto_35776 ?auto_35778 ) ) ( not ( = ?auto_35776 ?auto_35779 ) ) ( not ( = ?auto_35776 ?auto_35781 ) ) ( not ( = ?auto_35776 ?auto_35783 ) ) ( not ( = ?auto_35777 ?auto_35775 ) ) ( not ( = ?auto_35777 ?auto_35780 ) ) ( not ( = ?auto_35777 ?auto_35782 ) ) ( not ( = ?auto_35778 ?auto_35781 ) ) ( not ( = ?auto_35775 ?auto_35780 ) ) ( not ( = ?auto_35775 ?auto_35782 ) ) ( not ( = ?auto_35779 ?auto_35781 ) ) ( not ( = ?auto_35781 ?auto_35783 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35778 ?auto_35782 ?auto_35779 ?auto_35780 )
      ( GET-4IMAGE-VERIFY ?auto_35776 ?auto_35777 ?auto_35778 ?auto_35775 ?auto_35779 ?auto_35780 ?auto_35781 ?auto_35782 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35787 - DIRECTION
      ?auto_35788 - MODE
      ?auto_35789 - DIRECTION
      ?auto_35786 - MODE
      ?auto_35790 - DIRECTION
      ?auto_35791 - MODE
      ?auto_35792 - DIRECTION
      ?auto_35793 - MODE
    )
    :vars
    (
      ?auto_35795 - INSTRUMENT
      ?auto_35796 - SATELLITE
      ?auto_35794 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35795 ?auto_35796 ) ( SUPPORTS ?auto_35795 ?auto_35791 ) ( POINTING ?auto_35796 ?auto_35794 ) ( not ( = ?auto_35790 ?auto_35794 ) ) ( HAVE_IMAGE ?auto_35789 ?auto_35788 ) ( not ( = ?auto_35789 ?auto_35790 ) ) ( not ( = ?auto_35789 ?auto_35794 ) ) ( not ( = ?auto_35788 ?auto_35791 ) ) ( CALIBRATION_TARGET ?auto_35795 ?auto_35794 ) ( POWER_AVAIL ?auto_35796 ) ( HAVE_IMAGE ?auto_35787 ?auto_35788 ) ( HAVE_IMAGE ?auto_35789 ?auto_35786 ) ( HAVE_IMAGE ?auto_35792 ?auto_35793 ) ( not ( = ?auto_35787 ?auto_35789 ) ) ( not ( = ?auto_35787 ?auto_35790 ) ) ( not ( = ?auto_35787 ?auto_35792 ) ) ( not ( = ?auto_35787 ?auto_35794 ) ) ( not ( = ?auto_35788 ?auto_35786 ) ) ( not ( = ?auto_35788 ?auto_35793 ) ) ( not ( = ?auto_35789 ?auto_35792 ) ) ( not ( = ?auto_35786 ?auto_35791 ) ) ( not ( = ?auto_35786 ?auto_35793 ) ) ( not ( = ?auto_35790 ?auto_35792 ) ) ( not ( = ?auto_35791 ?auto_35793 ) ) ( not ( = ?auto_35792 ?auto_35794 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35789 ?auto_35788 ?auto_35790 ?auto_35791 )
      ( GET-4IMAGE-VERIFY ?auto_35787 ?auto_35788 ?auto_35789 ?auto_35786 ?auto_35790 ?auto_35791 ?auto_35792 ?auto_35793 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35820 - DIRECTION
      ?auto_35821 - MODE
      ?auto_35822 - DIRECTION
      ?auto_35819 - MODE
      ?auto_35823 - DIRECTION
      ?auto_35824 - MODE
      ?auto_35825 - DIRECTION
      ?auto_35826 - MODE
    )
    :vars
    (
      ?auto_35828 - INSTRUMENT
      ?auto_35829 - SATELLITE
      ?auto_35827 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35828 ?auto_35829 ) ( SUPPORTS ?auto_35828 ?auto_35826 ) ( POINTING ?auto_35829 ?auto_35827 ) ( not ( = ?auto_35825 ?auto_35827 ) ) ( HAVE_IMAGE ?auto_35820 ?auto_35821 ) ( not ( = ?auto_35820 ?auto_35825 ) ) ( not ( = ?auto_35820 ?auto_35827 ) ) ( not ( = ?auto_35821 ?auto_35826 ) ) ( CALIBRATION_TARGET ?auto_35828 ?auto_35827 ) ( POWER_AVAIL ?auto_35829 ) ( HAVE_IMAGE ?auto_35822 ?auto_35819 ) ( HAVE_IMAGE ?auto_35823 ?auto_35824 ) ( not ( = ?auto_35820 ?auto_35822 ) ) ( not ( = ?auto_35820 ?auto_35823 ) ) ( not ( = ?auto_35821 ?auto_35819 ) ) ( not ( = ?auto_35821 ?auto_35824 ) ) ( not ( = ?auto_35822 ?auto_35823 ) ) ( not ( = ?auto_35822 ?auto_35825 ) ) ( not ( = ?auto_35822 ?auto_35827 ) ) ( not ( = ?auto_35819 ?auto_35824 ) ) ( not ( = ?auto_35819 ?auto_35826 ) ) ( not ( = ?auto_35823 ?auto_35825 ) ) ( not ( = ?auto_35823 ?auto_35827 ) ) ( not ( = ?auto_35824 ?auto_35826 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35820 ?auto_35821 ?auto_35825 ?auto_35826 )
      ( GET-4IMAGE-VERIFY ?auto_35820 ?auto_35821 ?auto_35822 ?auto_35819 ?auto_35823 ?auto_35824 ?auto_35825 ?auto_35826 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35831 - DIRECTION
      ?auto_35832 - MODE
      ?auto_35833 - DIRECTION
      ?auto_35830 - MODE
      ?auto_35834 - DIRECTION
      ?auto_35835 - MODE
      ?auto_35836 - DIRECTION
      ?auto_35837 - MODE
    )
    :vars
    (
      ?auto_35839 - INSTRUMENT
      ?auto_35840 - SATELLITE
      ?auto_35838 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35839 ?auto_35840 ) ( SUPPORTS ?auto_35839 ?auto_35835 ) ( POINTING ?auto_35840 ?auto_35838 ) ( not ( = ?auto_35834 ?auto_35838 ) ) ( HAVE_IMAGE ?auto_35831 ?auto_35837 ) ( not ( = ?auto_35831 ?auto_35834 ) ) ( not ( = ?auto_35831 ?auto_35838 ) ) ( not ( = ?auto_35837 ?auto_35835 ) ) ( CALIBRATION_TARGET ?auto_35839 ?auto_35838 ) ( POWER_AVAIL ?auto_35840 ) ( HAVE_IMAGE ?auto_35831 ?auto_35832 ) ( HAVE_IMAGE ?auto_35833 ?auto_35830 ) ( HAVE_IMAGE ?auto_35836 ?auto_35837 ) ( not ( = ?auto_35831 ?auto_35833 ) ) ( not ( = ?auto_35831 ?auto_35836 ) ) ( not ( = ?auto_35832 ?auto_35830 ) ) ( not ( = ?auto_35832 ?auto_35835 ) ) ( not ( = ?auto_35832 ?auto_35837 ) ) ( not ( = ?auto_35833 ?auto_35834 ) ) ( not ( = ?auto_35833 ?auto_35836 ) ) ( not ( = ?auto_35833 ?auto_35838 ) ) ( not ( = ?auto_35830 ?auto_35835 ) ) ( not ( = ?auto_35830 ?auto_35837 ) ) ( not ( = ?auto_35834 ?auto_35836 ) ) ( not ( = ?auto_35836 ?auto_35838 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35831 ?auto_35837 ?auto_35834 ?auto_35835 )
      ( GET-4IMAGE-VERIFY ?auto_35831 ?auto_35832 ?auto_35833 ?auto_35830 ?auto_35834 ?auto_35835 ?auto_35836 ?auto_35837 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35842 - DIRECTION
      ?auto_35843 - MODE
      ?auto_35844 - DIRECTION
      ?auto_35841 - MODE
      ?auto_35845 - DIRECTION
      ?auto_35846 - MODE
      ?auto_35847 - DIRECTION
      ?auto_35848 - MODE
    )
    :vars
    (
      ?auto_35850 - INSTRUMENT
      ?auto_35851 - SATELLITE
      ?auto_35849 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35850 ?auto_35851 ) ( SUPPORTS ?auto_35850 ?auto_35846 ) ( POINTING ?auto_35851 ?auto_35849 ) ( not ( = ?auto_35845 ?auto_35849 ) ) ( HAVE_IMAGE ?auto_35842 ?auto_35843 ) ( not ( = ?auto_35842 ?auto_35845 ) ) ( not ( = ?auto_35842 ?auto_35849 ) ) ( not ( = ?auto_35843 ?auto_35846 ) ) ( CALIBRATION_TARGET ?auto_35850 ?auto_35849 ) ( POWER_AVAIL ?auto_35851 ) ( HAVE_IMAGE ?auto_35844 ?auto_35841 ) ( HAVE_IMAGE ?auto_35847 ?auto_35848 ) ( not ( = ?auto_35842 ?auto_35844 ) ) ( not ( = ?auto_35842 ?auto_35847 ) ) ( not ( = ?auto_35843 ?auto_35841 ) ) ( not ( = ?auto_35843 ?auto_35848 ) ) ( not ( = ?auto_35844 ?auto_35845 ) ) ( not ( = ?auto_35844 ?auto_35847 ) ) ( not ( = ?auto_35844 ?auto_35849 ) ) ( not ( = ?auto_35841 ?auto_35846 ) ) ( not ( = ?auto_35841 ?auto_35848 ) ) ( not ( = ?auto_35845 ?auto_35847 ) ) ( not ( = ?auto_35846 ?auto_35848 ) ) ( not ( = ?auto_35847 ?auto_35849 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35842 ?auto_35843 ?auto_35845 ?auto_35846 )
      ( GET-4IMAGE-VERIFY ?auto_35842 ?auto_35843 ?auto_35844 ?auto_35841 ?auto_35845 ?auto_35846 ?auto_35847 ?auto_35848 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35875 - DIRECTION
      ?auto_35876 - MODE
      ?auto_35877 - DIRECTION
      ?auto_35874 - MODE
      ?auto_35878 - DIRECTION
      ?auto_35879 - MODE
      ?auto_35880 - DIRECTION
      ?auto_35881 - MODE
    )
    :vars
    (
      ?auto_35883 - INSTRUMENT
      ?auto_35884 - SATELLITE
      ?auto_35882 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35883 ?auto_35884 ) ( SUPPORTS ?auto_35883 ?auto_35874 ) ( POINTING ?auto_35884 ?auto_35882 ) ( not ( = ?auto_35877 ?auto_35882 ) ) ( HAVE_IMAGE ?auto_35875 ?auto_35876 ) ( not ( = ?auto_35875 ?auto_35877 ) ) ( not ( = ?auto_35875 ?auto_35882 ) ) ( not ( = ?auto_35876 ?auto_35874 ) ) ( CALIBRATION_TARGET ?auto_35883 ?auto_35882 ) ( POWER_AVAIL ?auto_35884 ) ( HAVE_IMAGE ?auto_35878 ?auto_35879 ) ( HAVE_IMAGE ?auto_35880 ?auto_35881 ) ( not ( = ?auto_35875 ?auto_35878 ) ) ( not ( = ?auto_35875 ?auto_35880 ) ) ( not ( = ?auto_35876 ?auto_35879 ) ) ( not ( = ?auto_35876 ?auto_35881 ) ) ( not ( = ?auto_35877 ?auto_35878 ) ) ( not ( = ?auto_35877 ?auto_35880 ) ) ( not ( = ?auto_35874 ?auto_35879 ) ) ( not ( = ?auto_35874 ?auto_35881 ) ) ( not ( = ?auto_35878 ?auto_35880 ) ) ( not ( = ?auto_35878 ?auto_35882 ) ) ( not ( = ?auto_35879 ?auto_35881 ) ) ( not ( = ?auto_35880 ?auto_35882 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35875 ?auto_35876 ?auto_35877 ?auto_35874 )
      ( GET-4IMAGE-VERIFY ?auto_35875 ?auto_35876 ?auto_35877 ?auto_35874 ?auto_35878 ?auto_35879 ?auto_35880 ?auto_35881 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35897 - DIRECTION
      ?auto_35898 - MODE
      ?auto_35899 - DIRECTION
      ?auto_35896 - MODE
      ?auto_35900 - DIRECTION
      ?auto_35901 - MODE
      ?auto_35902 - DIRECTION
      ?auto_35903 - MODE
    )
    :vars
    (
      ?auto_35905 - INSTRUMENT
      ?auto_35906 - SATELLITE
      ?auto_35904 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35905 ?auto_35906 ) ( SUPPORTS ?auto_35905 ?auto_35896 ) ( POINTING ?auto_35906 ?auto_35904 ) ( not ( = ?auto_35899 ?auto_35904 ) ) ( HAVE_IMAGE ?auto_35902 ?auto_35903 ) ( not ( = ?auto_35902 ?auto_35899 ) ) ( not ( = ?auto_35902 ?auto_35904 ) ) ( not ( = ?auto_35903 ?auto_35896 ) ) ( CALIBRATION_TARGET ?auto_35905 ?auto_35904 ) ( POWER_AVAIL ?auto_35906 ) ( HAVE_IMAGE ?auto_35897 ?auto_35898 ) ( HAVE_IMAGE ?auto_35900 ?auto_35901 ) ( not ( = ?auto_35897 ?auto_35899 ) ) ( not ( = ?auto_35897 ?auto_35900 ) ) ( not ( = ?auto_35897 ?auto_35902 ) ) ( not ( = ?auto_35897 ?auto_35904 ) ) ( not ( = ?auto_35898 ?auto_35896 ) ) ( not ( = ?auto_35898 ?auto_35901 ) ) ( not ( = ?auto_35898 ?auto_35903 ) ) ( not ( = ?auto_35899 ?auto_35900 ) ) ( not ( = ?auto_35896 ?auto_35901 ) ) ( not ( = ?auto_35900 ?auto_35902 ) ) ( not ( = ?auto_35900 ?auto_35904 ) ) ( not ( = ?auto_35901 ?auto_35903 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35902 ?auto_35903 ?auto_35899 ?auto_35896 )
      ( GET-4IMAGE-VERIFY ?auto_35897 ?auto_35898 ?auto_35899 ?auto_35896 ?auto_35900 ?auto_35901 ?auto_35902 ?auto_35903 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35963 - DIRECTION
      ?auto_35964 - MODE
      ?auto_35965 - DIRECTION
      ?auto_35962 - MODE
      ?auto_35966 - DIRECTION
      ?auto_35967 - MODE
      ?auto_35968 - DIRECTION
      ?auto_35969 - MODE
    )
    :vars
    (
      ?auto_35971 - INSTRUMENT
      ?auto_35972 - SATELLITE
      ?auto_35970 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_35971 ?auto_35972 ) ( SUPPORTS ?auto_35971 ?auto_35969 ) ( POINTING ?auto_35972 ?auto_35970 ) ( not ( = ?auto_35968 ?auto_35970 ) ) ( HAVE_IMAGE ?auto_35965 ?auto_35967 ) ( not ( = ?auto_35965 ?auto_35968 ) ) ( not ( = ?auto_35965 ?auto_35970 ) ) ( not ( = ?auto_35967 ?auto_35969 ) ) ( CALIBRATION_TARGET ?auto_35971 ?auto_35970 ) ( POWER_AVAIL ?auto_35972 ) ( HAVE_IMAGE ?auto_35963 ?auto_35964 ) ( HAVE_IMAGE ?auto_35965 ?auto_35962 ) ( HAVE_IMAGE ?auto_35966 ?auto_35967 ) ( not ( = ?auto_35963 ?auto_35965 ) ) ( not ( = ?auto_35963 ?auto_35966 ) ) ( not ( = ?auto_35963 ?auto_35968 ) ) ( not ( = ?auto_35963 ?auto_35970 ) ) ( not ( = ?auto_35964 ?auto_35962 ) ) ( not ( = ?auto_35964 ?auto_35967 ) ) ( not ( = ?auto_35964 ?auto_35969 ) ) ( not ( = ?auto_35965 ?auto_35966 ) ) ( not ( = ?auto_35962 ?auto_35967 ) ) ( not ( = ?auto_35962 ?auto_35969 ) ) ( not ( = ?auto_35966 ?auto_35968 ) ) ( not ( = ?auto_35966 ?auto_35970 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35965 ?auto_35967 ?auto_35968 ?auto_35969 )
      ( GET-4IMAGE-VERIFY ?auto_35963 ?auto_35964 ?auto_35965 ?auto_35962 ?auto_35966 ?auto_35967 ?auto_35968 ?auto_35969 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_35996 - DIRECTION
      ?auto_35997 - MODE
      ?auto_35998 - DIRECTION
      ?auto_35995 - MODE
      ?auto_35999 - DIRECTION
      ?auto_36000 - MODE
      ?auto_36001 - DIRECTION
      ?auto_36002 - MODE
    )
    :vars
    (
      ?auto_36004 - INSTRUMENT
      ?auto_36005 - SATELLITE
      ?auto_36003 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36004 ?auto_36005 ) ( SUPPORTS ?auto_36004 ?auto_36000 ) ( POINTING ?auto_36005 ?auto_36003 ) ( not ( = ?auto_35999 ?auto_36003 ) ) ( HAVE_IMAGE ?auto_35998 ?auto_35995 ) ( not ( = ?auto_35998 ?auto_35999 ) ) ( not ( = ?auto_35998 ?auto_36003 ) ) ( not ( = ?auto_35995 ?auto_36000 ) ) ( CALIBRATION_TARGET ?auto_36004 ?auto_36003 ) ( POWER_AVAIL ?auto_36005 ) ( HAVE_IMAGE ?auto_35996 ?auto_35997 ) ( HAVE_IMAGE ?auto_36001 ?auto_36002 ) ( not ( = ?auto_35996 ?auto_35998 ) ) ( not ( = ?auto_35996 ?auto_35999 ) ) ( not ( = ?auto_35996 ?auto_36001 ) ) ( not ( = ?auto_35996 ?auto_36003 ) ) ( not ( = ?auto_35997 ?auto_35995 ) ) ( not ( = ?auto_35997 ?auto_36000 ) ) ( not ( = ?auto_35997 ?auto_36002 ) ) ( not ( = ?auto_35998 ?auto_36001 ) ) ( not ( = ?auto_35995 ?auto_36002 ) ) ( not ( = ?auto_35999 ?auto_36001 ) ) ( not ( = ?auto_36000 ?auto_36002 ) ) ( not ( = ?auto_36001 ?auto_36003 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35998 ?auto_35995 ?auto_35999 ?auto_36000 )
      ( GET-4IMAGE-VERIFY ?auto_35996 ?auto_35997 ?auto_35998 ?auto_35995 ?auto_35999 ?auto_36000 ?auto_36001 ?auto_36002 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36029 - DIRECTION
      ?auto_36030 - MODE
      ?auto_36031 - DIRECTION
      ?auto_36028 - MODE
      ?auto_36032 - DIRECTION
      ?auto_36033 - MODE
      ?auto_36034 - DIRECTION
      ?auto_36035 - MODE
    )
    :vars
    (
      ?auto_36038 - INSTRUMENT
      ?auto_36039 - SATELLITE
      ?auto_36037 - DIRECTION
      ?auto_36040 - DIRECTION
      ?auto_36036 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_36038 ?auto_36039 ) ( SUPPORTS ?auto_36038 ?auto_36035 ) ( POINTING ?auto_36039 ?auto_36037 ) ( not ( = ?auto_36034 ?auto_36037 ) ) ( HAVE_IMAGE ?auto_36040 ?auto_36036 ) ( not ( = ?auto_36040 ?auto_36034 ) ) ( not ( = ?auto_36040 ?auto_36037 ) ) ( not ( = ?auto_36036 ?auto_36035 ) ) ( CALIBRATION_TARGET ?auto_36038 ?auto_36037 ) ( POWER_AVAIL ?auto_36039 ) ( HAVE_IMAGE ?auto_36029 ?auto_36030 ) ( HAVE_IMAGE ?auto_36031 ?auto_36028 ) ( HAVE_IMAGE ?auto_36032 ?auto_36033 ) ( not ( = ?auto_36029 ?auto_36031 ) ) ( not ( = ?auto_36029 ?auto_36032 ) ) ( not ( = ?auto_36029 ?auto_36034 ) ) ( not ( = ?auto_36029 ?auto_36037 ) ) ( not ( = ?auto_36029 ?auto_36040 ) ) ( not ( = ?auto_36030 ?auto_36028 ) ) ( not ( = ?auto_36030 ?auto_36033 ) ) ( not ( = ?auto_36030 ?auto_36035 ) ) ( not ( = ?auto_36030 ?auto_36036 ) ) ( not ( = ?auto_36031 ?auto_36032 ) ) ( not ( = ?auto_36031 ?auto_36034 ) ) ( not ( = ?auto_36031 ?auto_36037 ) ) ( not ( = ?auto_36031 ?auto_36040 ) ) ( not ( = ?auto_36028 ?auto_36033 ) ) ( not ( = ?auto_36028 ?auto_36035 ) ) ( not ( = ?auto_36028 ?auto_36036 ) ) ( not ( = ?auto_36032 ?auto_36034 ) ) ( not ( = ?auto_36032 ?auto_36037 ) ) ( not ( = ?auto_36032 ?auto_36040 ) ) ( not ( = ?auto_36033 ?auto_36035 ) ) ( not ( = ?auto_36033 ?auto_36036 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36040 ?auto_36036 ?auto_36034 ?auto_36035 )
      ( GET-4IMAGE-VERIFY ?auto_36029 ?auto_36030 ?auto_36031 ?auto_36028 ?auto_36032 ?auto_36033 ?auto_36034 ?auto_36035 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36042 - DIRECTION
      ?auto_36043 - MODE
      ?auto_36044 - DIRECTION
      ?auto_36041 - MODE
      ?auto_36045 - DIRECTION
      ?auto_36046 - MODE
      ?auto_36047 - DIRECTION
      ?auto_36048 - MODE
    )
    :vars
    (
      ?auto_36050 - INSTRUMENT
      ?auto_36051 - SATELLITE
      ?auto_36049 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36050 ?auto_36051 ) ( SUPPORTS ?auto_36050 ?auto_36046 ) ( POINTING ?auto_36051 ?auto_36049 ) ( not ( = ?auto_36045 ?auto_36049 ) ) ( HAVE_IMAGE ?auto_36047 ?auto_36048 ) ( not ( = ?auto_36047 ?auto_36045 ) ) ( not ( = ?auto_36047 ?auto_36049 ) ) ( not ( = ?auto_36048 ?auto_36046 ) ) ( CALIBRATION_TARGET ?auto_36050 ?auto_36049 ) ( POWER_AVAIL ?auto_36051 ) ( HAVE_IMAGE ?auto_36042 ?auto_36043 ) ( HAVE_IMAGE ?auto_36044 ?auto_36041 ) ( not ( = ?auto_36042 ?auto_36044 ) ) ( not ( = ?auto_36042 ?auto_36045 ) ) ( not ( = ?auto_36042 ?auto_36047 ) ) ( not ( = ?auto_36042 ?auto_36049 ) ) ( not ( = ?auto_36043 ?auto_36041 ) ) ( not ( = ?auto_36043 ?auto_36046 ) ) ( not ( = ?auto_36043 ?auto_36048 ) ) ( not ( = ?auto_36044 ?auto_36045 ) ) ( not ( = ?auto_36044 ?auto_36047 ) ) ( not ( = ?auto_36044 ?auto_36049 ) ) ( not ( = ?auto_36041 ?auto_36046 ) ) ( not ( = ?auto_36041 ?auto_36048 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36047 ?auto_36048 ?auto_36045 ?auto_36046 )
      ( GET-4IMAGE-VERIFY ?auto_36042 ?auto_36043 ?auto_36044 ?auto_36041 ?auto_36045 ?auto_36046 ?auto_36047 ?auto_36048 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36053 - DIRECTION
      ?auto_36054 - MODE
      ?auto_36055 - DIRECTION
      ?auto_36052 - MODE
      ?auto_36056 - DIRECTION
      ?auto_36057 - MODE
      ?auto_36058 - DIRECTION
      ?auto_36059 - MODE
    )
    :vars
    (
      ?auto_36062 - INSTRUMENT
      ?auto_36063 - SATELLITE
      ?auto_36061 - DIRECTION
      ?auto_36064 - DIRECTION
      ?auto_36060 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_36062 ?auto_36063 ) ( SUPPORTS ?auto_36062 ?auto_36057 ) ( POINTING ?auto_36063 ?auto_36061 ) ( not ( = ?auto_36056 ?auto_36061 ) ) ( HAVE_IMAGE ?auto_36064 ?auto_36060 ) ( not ( = ?auto_36064 ?auto_36056 ) ) ( not ( = ?auto_36064 ?auto_36061 ) ) ( not ( = ?auto_36060 ?auto_36057 ) ) ( CALIBRATION_TARGET ?auto_36062 ?auto_36061 ) ( POWER_AVAIL ?auto_36063 ) ( HAVE_IMAGE ?auto_36053 ?auto_36054 ) ( HAVE_IMAGE ?auto_36055 ?auto_36052 ) ( HAVE_IMAGE ?auto_36058 ?auto_36059 ) ( not ( = ?auto_36053 ?auto_36055 ) ) ( not ( = ?auto_36053 ?auto_36056 ) ) ( not ( = ?auto_36053 ?auto_36058 ) ) ( not ( = ?auto_36053 ?auto_36061 ) ) ( not ( = ?auto_36053 ?auto_36064 ) ) ( not ( = ?auto_36054 ?auto_36052 ) ) ( not ( = ?auto_36054 ?auto_36057 ) ) ( not ( = ?auto_36054 ?auto_36059 ) ) ( not ( = ?auto_36054 ?auto_36060 ) ) ( not ( = ?auto_36055 ?auto_36056 ) ) ( not ( = ?auto_36055 ?auto_36058 ) ) ( not ( = ?auto_36055 ?auto_36061 ) ) ( not ( = ?auto_36055 ?auto_36064 ) ) ( not ( = ?auto_36052 ?auto_36057 ) ) ( not ( = ?auto_36052 ?auto_36059 ) ) ( not ( = ?auto_36052 ?auto_36060 ) ) ( not ( = ?auto_36056 ?auto_36058 ) ) ( not ( = ?auto_36057 ?auto_36059 ) ) ( not ( = ?auto_36058 ?auto_36061 ) ) ( not ( = ?auto_36058 ?auto_36064 ) ) ( not ( = ?auto_36059 ?auto_36060 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36064 ?auto_36060 ?auto_36056 ?auto_36057 )
      ( GET-4IMAGE-VERIFY ?auto_36053 ?auto_36054 ?auto_36055 ?auto_36052 ?auto_36056 ?auto_36057 ?auto_36058 ?auto_36059 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36079 - DIRECTION
      ?auto_36080 - MODE
      ?auto_36081 - DIRECTION
      ?auto_36078 - MODE
      ?auto_36082 - DIRECTION
      ?auto_36083 - MODE
      ?auto_36084 - DIRECTION
      ?auto_36085 - MODE
    )
    :vars
    (
      ?auto_36087 - INSTRUMENT
      ?auto_36088 - SATELLITE
      ?auto_36086 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36087 ?auto_36088 ) ( SUPPORTS ?auto_36087 ?auto_36078 ) ( POINTING ?auto_36088 ?auto_36086 ) ( not ( = ?auto_36081 ?auto_36086 ) ) ( HAVE_IMAGE ?auto_36082 ?auto_36085 ) ( not ( = ?auto_36082 ?auto_36081 ) ) ( not ( = ?auto_36082 ?auto_36086 ) ) ( not ( = ?auto_36085 ?auto_36078 ) ) ( CALIBRATION_TARGET ?auto_36087 ?auto_36086 ) ( POWER_AVAIL ?auto_36088 ) ( HAVE_IMAGE ?auto_36079 ?auto_36080 ) ( HAVE_IMAGE ?auto_36082 ?auto_36083 ) ( HAVE_IMAGE ?auto_36084 ?auto_36085 ) ( not ( = ?auto_36079 ?auto_36081 ) ) ( not ( = ?auto_36079 ?auto_36082 ) ) ( not ( = ?auto_36079 ?auto_36084 ) ) ( not ( = ?auto_36079 ?auto_36086 ) ) ( not ( = ?auto_36080 ?auto_36078 ) ) ( not ( = ?auto_36080 ?auto_36083 ) ) ( not ( = ?auto_36080 ?auto_36085 ) ) ( not ( = ?auto_36081 ?auto_36084 ) ) ( not ( = ?auto_36078 ?auto_36083 ) ) ( not ( = ?auto_36082 ?auto_36084 ) ) ( not ( = ?auto_36083 ?auto_36085 ) ) ( not ( = ?auto_36084 ?auto_36086 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36082 ?auto_36085 ?auto_36081 ?auto_36078 )
      ( GET-4IMAGE-VERIFY ?auto_36079 ?auto_36080 ?auto_36081 ?auto_36078 ?auto_36082 ?auto_36083 ?auto_36084 ?auto_36085 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36090 - DIRECTION
      ?auto_36091 - MODE
      ?auto_36092 - DIRECTION
      ?auto_36089 - MODE
      ?auto_36093 - DIRECTION
      ?auto_36094 - MODE
      ?auto_36095 - DIRECTION
      ?auto_36096 - MODE
    )
    :vars
    (
      ?auto_36098 - INSTRUMENT
      ?auto_36099 - SATELLITE
      ?auto_36097 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36098 ?auto_36099 ) ( SUPPORTS ?auto_36098 ?auto_36089 ) ( POINTING ?auto_36099 ?auto_36097 ) ( not ( = ?auto_36092 ?auto_36097 ) ) ( HAVE_IMAGE ?auto_36093 ?auto_36094 ) ( not ( = ?auto_36093 ?auto_36092 ) ) ( not ( = ?auto_36093 ?auto_36097 ) ) ( not ( = ?auto_36094 ?auto_36089 ) ) ( CALIBRATION_TARGET ?auto_36098 ?auto_36097 ) ( POWER_AVAIL ?auto_36099 ) ( HAVE_IMAGE ?auto_36090 ?auto_36091 ) ( HAVE_IMAGE ?auto_36095 ?auto_36096 ) ( not ( = ?auto_36090 ?auto_36092 ) ) ( not ( = ?auto_36090 ?auto_36093 ) ) ( not ( = ?auto_36090 ?auto_36095 ) ) ( not ( = ?auto_36090 ?auto_36097 ) ) ( not ( = ?auto_36091 ?auto_36089 ) ) ( not ( = ?auto_36091 ?auto_36094 ) ) ( not ( = ?auto_36091 ?auto_36096 ) ) ( not ( = ?auto_36092 ?auto_36095 ) ) ( not ( = ?auto_36089 ?auto_36096 ) ) ( not ( = ?auto_36093 ?auto_36095 ) ) ( not ( = ?auto_36094 ?auto_36096 ) ) ( not ( = ?auto_36095 ?auto_36097 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36093 ?auto_36094 ?auto_36092 ?auto_36089 )
      ( GET-4IMAGE-VERIFY ?auto_36090 ?auto_36091 ?auto_36092 ?auto_36089 ?auto_36093 ?auto_36094 ?auto_36095 ?auto_36096 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36123 - DIRECTION
      ?auto_36124 - MODE
      ?auto_36125 - DIRECTION
      ?auto_36122 - MODE
      ?auto_36126 - DIRECTION
      ?auto_36127 - MODE
      ?auto_36128 - DIRECTION
      ?auto_36129 - MODE
    )
    :vars
    (
      ?auto_36132 - INSTRUMENT
      ?auto_36133 - SATELLITE
      ?auto_36131 - DIRECTION
      ?auto_36134 - DIRECTION
      ?auto_36130 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_36132 ?auto_36133 ) ( SUPPORTS ?auto_36132 ?auto_36122 ) ( POINTING ?auto_36133 ?auto_36131 ) ( not ( = ?auto_36125 ?auto_36131 ) ) ( HAVE_IMAGE ?auto_36134 ?auto_36130 ) ( not ( = ?auto_36134 ?auto_36125 ) ) ( not ( = ?auto_36134 ?auto_36131 ) ) ( not ( = ?auto_36130 ?auto_36122 ) ) ( CALIBRATION_TARGET ?auto_36132 ?auto_36131 ) ( POWER_AVAIL ?auto_36133 ) ( HAVE_IMAGE ?auto_36123 ?auto_36124 ) ( HAVE_IMAGE ?auto_36126 ?auto_36127 ) ( HAVE_IMAGE ?auto_36128 ?auto_36129 ) ( not ( = ?auto_36123 ?auto_36125 ) ) ( not ( = ?auto_36123 ?auto_36126 ) ) ( not ( = ?auto_36123 ?auto_36128 ) ) ( not ( = ?auto_36123 ?auto_36131 ) ) ( not ( = ?auto_36123 ?auto_36134 ) ) ( not ( = ?auto_36124 ?auto_36122 ) ) ( not ( = ?auto_36124 ?auto_36127 ) ) ( not ( = ?auto_36124 ?auto_36129 ) ) ( not ( = ?auto_36124 ?auto_36130 ) ) ( not ( = ?auto_36125 ?auto_36126 ) ) ( not ( = ?auto_36125 ?auto_36128 ) ) ( not ( = ?auto_36122 ?auto_36127 ) ) ( not ( = ?auto_36122 ?auto_36129 ) ) ( not ( = ?auto_36126 ?auto_36128 ) ) ( not ( = ?auto_36126 ?auto_36131 ) ) ( not ( = ?auto_36126 ?auto_36134 ) ) ( not ( = ?auto_36127 ?auto_36129 ) ) ( not ( = ?auto_36127 ?auto_36130 ) ) ( not ( = ?auto_36128 ?auto_36131 ) ) ( not ( = ?auto_36128 ?auto_36134 ) ) ( not ( = ?auto_36129 ?auto_36130 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36134 ?auto_36130 ?auto_36125 ?auto_36122 )
      ( GET-4IMAGE-VERIFY ?auto_36123 ?auto_36124 ?auto_36125 ?auto_36122 ?auto_36126 ?auto_36127 ?auto_36128 ?auto_36129 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36186 - DIRECTION
      ?auto_36187 - MODE
      ?auto_36188 - DIRECTION
      ?auto_36185 - MODE
      ?auto_36189 - DIRECTION
      ?auto_36190 - MODE
      ?auto_36191 - DIRECTION
      ?auto_36192 - MODE
    )
    :vars
    (
      ?auto_36194 - INSTRUMENT
      ?auto_36195 - SATELLITE
      ?auto_36193 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36194 ?auto_36195 ) ( SUPPORTS ?auto_36194 ?auto_36187 ) ( POINTING ?auto_36195 ?auto_36193 ) ( not ( = ?auto_36186 ?auto_36193 ) ) ( HAVE_IMAGE ?auto_36191 ?auto_36192 ) ( not ( = ?auto_36191 ?auto_36186 ) ) ( not ( = ?auto_36191 ?auto_36193 ) ) ( not ( = ?auto_36192 ?auto_36187 ) ) ( CALIBRATION_TARGET ?auto_36194 ?auto_36193 ) ( POWER_AVAIL ?auto_36195 ) ( HAVE_IMAGE ?auto_36188 ?auto_36185 ) ( HAVE_IMAGE ?auto_36189 ?auto_36190 ) ( not ( = ?auto_36186 ?auto_36188 ) ) ( not ( = ?auto_36186 ?auto_36189 ) ) ( not ( = ?auto_36187 ?auto_36185 ) ) ( not ( = ?auto_36187 ?auto_36190 ) ) ( not ( = ?auto_36188 ?auto_36189 ) ) ( not ( = ?auto_36188 ?auto_36191 ) ) ( not ( = ?auto_36188 ?auto_36193 ) ) ( not ( = ?auto_36185 ?auto_36190 ) ) ( not ( = ?auto_36185 ?auto_36192 ) ) ( not ( = ?auto_36189 ?auto_36191 ) ) ( not ( = ?auto_36189 ?auto_36193 ) ) ( not ( = ?auto_36190 ?auto_36192 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36191 ?auto_36192 ?auto_36186 ?auto_36187 )
      ( GET-4IMAGE-VERIFY ?auto_36186 ?auto_36187 ?auto_36188 ?auto_36185 ?auto_36189 ?auto_36190 ?auto_36191 ?auto_36192 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36197 - DIRECTION
      ?auto_36198 - MODE
      ?auto_36199 - DIRECTION
      ?auto_36196 - MODE
      ?auto_36200 - DIRECTION
      ?auto_36201 - MODE
      ?auto_36202 - DIRECTION
      ?auto_36203 - MODE
    )
    :vars
    (
      ?auto_36205 - INSTRUMENT
      ?auto_36206 - SATELLITE
      ?auto_36204 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36205 ?auto_36206 ) ( SUPPORTS ?auto_36205 ?auto_36198 ) ( POINTING ?auto_36206 ?auto_36204 ) ( not ( = ?auto_36197 ?auto_36204 ) ) ( HAVE_IMAGE ?auto_36200 ?auto_36201 ) ( not ( = ?auto_36200 ?auto_36197 ) ) ( not ( = ?auto_36200 ?auto_36204 ) ) ( not ( = ?auto_36201 ?auto_36198 ) ) ( CALIBRATION_TARGET ?auto_36205 ?auto_36204 ) ( POWER_AVAIL ?auto_36206 ) ( HAVE_IMAGE ?auto_36199 ?auto_36196 ) ( HAVE_IMAGE ?auto_36202 ?auto_36203 ) ( not ( = ?auto_36197 ?auto_36199 ) ) ( not ( = ?auto_36197 ?auto_36202 ) ) ( not ( = ?auto_36198 ?auto_36196 ) ) ( not ( = ?auto_36198 ?auto_36203 ) ) ( not ( = ?auto_36199 ?auto_36200 ) ) ( not ( = ?auto_36199 ?auto_36202 ) ) ( not ( = ?auto_36199 ?auto_36204 ) ) ( not ( = ?auto_36196 ?auto_36201 ) ) ( not ( = ?auto_36196 ?auto_36203 ) ) ( not ( = ?auto_36200 ?auto_36202 ) ) ( not ( = ?auto_36201 ?auto_36203 ) ) ( not ( = ?auto_36202 ?auto_36204 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36200 ?auto_36201 ?auto_36197 ?auto_36198 )
      ( GET-4IMAGE-VERIFY ?auto_36197 ?auto_36198 ?auto_36199 ?auto_36196 ?auto_36200 ?auto_36201 ?auto_36202 ?auto_36203 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36230 - DIRECTION
      ?auto_36231 - MODE
      ?auto_36232 - DIRECTION
      ?auto_36229 - MODE
      ?auto_36233 - DIRECTION
      ?auto_36234 - MODE
      ?auto_36235 - DIRECTION
      ?auto_36236 - MODE
    )
    :vars
    (
      ?auto_36238 - INSTRUMENT
      ?auto_36239 - SATELLITE
      ?auto_36237 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36238 ?auto_36239 ) ( SUPPORTS ?auto_36238 ?auto_36231 ) ( POINTING ?auto_36239 ?auto_36237 ) ( not ( = ?auto_36230 ?auto_36237 ) ) ( HAVE_IMAGE ?auto_36232 ?auto_36229 ) ( not ( = ?auto_36232 ?auto_36230 ) ) ( not ( = ?auto_36232 ?auto_36237 ) ) ( not ( = ?auto_36229 ?auto_36231 ) ) ( CALIBRATION_TARGET ?auto_36238 ?auto_36237 ) ( POWER_AVAIL ?auto_36239 ) ( HAVE_IMAGE ?auto_36233 ?auto_36234 ) ( HAVE_IMAGE ?auto_36235 ?auto_36236 ) ( not ( = ?auto_36230 ?auto_36233 ) ) ( not ( = ?auto_36230 ?auto_36235 ) ) ( not ( = ?auto_36231 ?auto_36234 ) ) ( not ( = ?auto_36231 ?auto_36236 ) ) ( not ( = ?auto_36232 ?auto_36233 ) ) ( not ( = ?auto_36232 ?auto_36235 ) ) ( not ( = ?auto_36229 ?auto_36234 ) ) ( not ( = ?auto_36229 ?auto_36236 ) ) ( not ( = ?auto_36233 ?auto_36235 ) ) ( not ( = ?auto_36233 ?auto_36237 ) ) ( not ( = ?auto_36234 ?auto_36236 ) ) ( not ( = ?auto_36235 ?auto_36237 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36232 ?auto_36229 ?auto_36230 ?auto_36231 )
      ( GET-4IMAGE-VERIFY ?auto_36230 ?auto_36231 ?auto_36232 ?auto_36229 ?auto_36233 ?auto_36234 ?auto_36235 ?auto_36236 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36329 - DIRECTION
      ?auto_36330 - MODE
      ?auto_36331 - DIRECTION
      ?auto_36328 - MODE
      ?auto_36332 - DIRECTION
      ?auto_36333 - MODE
      ?auto_36334 - DIRECTION
      ?auto_36335 - MODE
    )
    :vars
    (
      ?auto_36338 - INSTRUMENT
      ?auto_36339 - SATELLITE
      ?auto_36337 - DIRECTION
      ?auto_36340 - DIRECTION
      ?auto_36336 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_36338 ?auto_36339 ) ( SUPPORTS ?auto_36338 ?auto_36330 ) ( POINTING ?auto_36339 ?auto_36337 ) ( not ( = ?auto_36329 ?auto_36337 ) ) ( HAVE_IMAGE ?auto_36340 ?auto_36336 ) ( not ( = ?auto_36340 ?auto_36329 ) ) ( not ( = ?auto_36340 ?auto_36337 ) ) ( not ( = ?auto_36336 ?auto_36330 ) ) ( CALIBRATION_TARGET ?auto_36338 ?auto_36337 ) ( POWER_AVAIL ?auto_36339 ) ( HAVE_IMAGE ?auto_36331 ?auto_36328 ) ( HAVE_IMAGE ?auto_36332 ?auto_36333 ) ( HAVE_IMAGE ?auto_36334 ?auto_36335 ) ( not ( = ?auto_36329 ?auto_36331 ) ) ( not ( = ?auto_36329 ?auto_36332 ) ) ( not ( = ?auto_36329 ?auto_36334 ) ) ( not ( = ?auto_36330 ?auto_36328 ) ) ( not ( = ?auto_36330 ?auto_36333 ) ) ( not ( = ?auto_36330 ?auto_36335 ) ) ( not ( = ?auto_36331 ?auto_36332 ) ) ( not ( = ?auto_36331 ?auto_36334 ) ) ( not ( = ?auto_36331 ?auto_36337 ) ) ( not ( = ?auto_36331 ?auto_36340 ) ) ( not ( = ?auto_36328 ?auto_36333 ) ) ( not ( = ?auto_36328 ?auto_36335 ) ) ( not ( = ?auto_36328 ?auto_36336 ) ) ( not ( = ?auto_36332 ?auto_36334 ) ) ( not ( = ?auto_36332 ?auto_36337 ) ) ( not ( = ?auto_36332 ?auto_36340 ) ) ( not ( = ?auto_36333 ?auto_36335 ) ) ( not ( = ?auto_36333 ?auto_36336 ) ) ( not ( = ?auto_36334 ?auto_36337 ) ) ( not ( = ?auto_36334 ?auto_36340 ) ) ( not ( = ?auto_36335 ?auto_36336 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36340 ?auto_36336 ?auto_36329 ?auto_36330 )
      ( GET-4IMAGE-VERIFY ?auto_36329 ?auto_36330 ?auto_36331 ?auto_36328 ?auto_36332 ?auto_36333 ?auto_36334 ?auto_36335 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_36498 - DIRECTION
      ?auto_36499 - MODE
    )
    :vars
    (
      ?auto_36502 - INSTRUMENT
      ?auto_36503 - SATELLITE
      ?auto_36501 - DIRECTION
      ?auto_36504 - DIRECTION
      ?auto_36500 - MODE
      ?auto_36505 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36502 ?auto_36503 ) ( SUPPORTS ?auto_36502 ?auto_36499 ) ( not ( = ?auto_36498 ?auto_36501 ) ) ( HAVE_IMAGE ?auto_36504 ?auto_36500 ) ( not ( = ?auto_36504 ?auto_36498 ) ) ( not ( = ?auto_36504 ?auto_36501 ) ) ( not ( = ?auto_36500 ?auto_36499 ) ) ( CALIBRATION_TARGET ?auto_36502 ?auto_36501 ) ( POWER_AVAIL ?auto_36503 ) ( POINTING ?auto_36503 ?auto_36505 ) ( not ( = ?auto_36501 ?auto_36505 ) ) ( not ( = ?auto_36498 ?auto_36505 ) ) ( not ( = ?auto_36504 ?auto_36505 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_36503 ?auto_36501 ?auto_36505 )
      ( GET-2IMAGE ?auto_36504 ?auto_36500 ?auto_36498 ?auto_36499 )
      ( GET-1IMAGE-VERIFY ?auto_36498 ?auto_36499 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_36507 - DIRECTION
      ?auto_36508 - MODE
      ?auto_36509 - DIRECTION
      ?auto_36506 - MODE
    )
    :vars
    (
      ?auto_36512 - INSTRUMENT
      ?auto_36510 - SATELLITE
      ?auto_36511 - DIRECTION
      ?auto_36513 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36512 ?auto_36510 ) ( SUPPORTS ?auto_36512 ?auto_36506 ) ( not ( = ?auto_36509 ?auto_36511 ) ) ( HAVE_IMAGE ?auto_36507 ?auto_36508 ) ( not ( = ?auto_36507 ?auto_36509 ) ) ( not ( = ?auto_36507 ?auto_36511 ) ) ( not ( = ?auto_36508 ?auto_36506 ) ) ( CALIBRATION_TARGET ?auto_36512 ?auto_36511 ) ( POWER_AVAIL ?auto_36510 ) ( POINTING ?auto_36510 ?auto_36513 ) ( not ( = ?auto_36511 ?auto_36513 ) ) ( not ( = ?auto_36509 ?auto_36513 ) ) ( not ( = ?auto_36507 ?auto_36513 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_36509 ?auto_36506 )
      ( GET-2IMAGE-VERIFY ?auto_36507 ?auto_36508 ?auto_36509 ?auto_36506 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_36515 - DIRECTION
      ?auto_36516 - MODE
      ?auto_36517 - DIRECTION
      ?auto_36514 - MODE
    )
    :vars
    (
      ?auto_36521 - INSTRUMENT
      ?auto_36520 - SATELLITE
      ?auto_36518 - DIRECTION
      ?auto_36519 - DIRECTION
      ?auto_36522 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_36521 ?auto_36520 ) ( SUPPORTS ?auto_36521 ?auto_36514 ) ( not ( = ?auto_36517 ?auto_36518 ) ) ( HAVE_IMAGE ?auto_36519 ?auto_36522 ) ( not ( = ?auto_36519 ?auto_36517 ) ) ( not ( = ?auto_36519 ?auto_36518 ) ) ( not ( = ?auto_36522 ?auto_36514 ) ) ( CALIBRATION_TARGET ?auto_36521 ?auto_36518 ) ( POWER_AVAIL ?auto_36520 ) ( POINTING ?auto_36520 ?auto_36515 ) ( not ( = ?auto_36518 ?auto_36515 ) ) ( not ( = ?auto_36517 ?auto_36515 ) ) ( not ( = ?auto_36519 ?auto_36515 ) ) ( HAVE_IMAGE ?auto_36515 ?auto_36516 ) ( not ( = ?auto_36516 ?auto_36514 ) ) ( not ( = ?auto_36516 ?auto_36522 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36519 ?auto_36522 ?auto_36517 ?auto_36514 )
      ( GET-2IMAGE-VERIFY ?auto_36515 ?auto_36516 ?auto_36517 ?auto_36514 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_36524 - DIRECTION
      ?auto_36525 - MODE
      ?auto_36526 - DIRECTION
      ?auto_36523 - MODE
    )
    :vars
    (
      ?auto_36530 - INSTRUMENT
      ?auto_36528 - SATELLITE
      ?auto_36527 - DIRECTION
      ?auto_36529 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36530 ?auto_36528 ) ( SUPPORTS ?auto_36530 ?auto_36525 ) ( not ( = ?auto_36524 ?auto_36527 ) ) ( HAVE_IMAGE ?auto_36526 ?auto_36523 ) ( not ( = ?auto_36526 ?auto_36524 ) ) ( not ( = ?auto_36526 ?auto_36527 ) ) ( not ( = ?auto_36523 ?auto_36525 ) ) ( CALIBRATION_TARGET ?auto_36530 ?auto_36527 ) ( POWER_AVAIL ?auto_36528 ) ( POINTING ?auto_36528 ?auto_36529 ) ( not ( = ?auto_36527 ?auto_36529 ) ) ( not ( = ?auto_36524 ?auto_36529 ) ) ( not ( = ?auto_36526 ?auto_36529 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36526 ?auto_36523 ?auto_36524 ?auto_36525 )
      ( GET-2IMAGE-VERIFY ?auto_36524 ?auto_36525 ?auto_36526 ?auto_36523 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_36532 - DIRECTION
      ?auto_36533 - MODE
      ?auto_36534 - DIRECTION
      ?auto_36531 - MODE
    )
    :vars
    (
      ?auto_36538 - INSTRUMENT
      ?auto_36537 - SATELLITE
      ?auto_36535 - DIRECTION
      ?auto_36536 - DIRECTION
      ?auto_36539 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_36538 ?auto_36537 ) ( SUPPORTS ?auto_36538 ?auto_36533 ) ( not ( = ?auto_36532 ?auto_36535 ) ) ( HAVE_IMAGE ?auto_36536 ?auto_36539 ) ( not ( = ?auto_36536 ?auto_36532 ) ) ( not ( = ?auto_36536 ?auto_36535 ) ) ( not ( = ?auto_36539 ?auto_36533 ) ) ( CALIBRATION_TARGET ?auto_36538 ?auto_36535 ) ( POWER_AVAIL ?auto_36537 ) ( POINTING ?auto_36537 ?auto_36534 ) ( not ( = ?auto_36535 ?auto_36534 ) ) ( not ( = ?auto_36532 ?auto_36534 ) ) ( not ( = ?auto_36536 ?auto_36534 ) ) ( HAVE_IMAGE ?auto_36534 ?auto_36531 ) ( not ( = ?auto_36533 ?auto_36531 ) ) ( not ( = ?auto_36531 ?auto_36539 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36536 ?auto_36539 ?auto_36532 ?auto_36533 )
      ( GET-2IMAGE-VERIFY ?auto_36532 ?auto_36533 ?auto_36534 ?auto_36531 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36551 - DIRECTION
      ?auto_36552 - MODE
      ?auto_36553 - DIRECTION
      ?auto_36550 - MODE
      ?auto_36554 - DIRECTION
      ?auto_36555 - MODE
    )
    :vars
    (
      ?auto_36559 - INSTRUMENT
      ?auto_36557 - SATELLITE
      ?auto_36556 - DIRECTION
      ?auto_36558 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36559 ?auto_36557 ) ( SUPPORTS ?auto_36559 ?auto_36555 ) ( not ( = ?auto_36554 ?auto_36556 ) ) ( HAVE_IMAGE ?auto_36553 ?auto_36550 ) ( not ( = ?auto_36553 ?auto_36554 ) ) ( not ( = ?auto_36553 ?auto_36556 ) ) ( not ( = ?auto_36550 ?auto_36555 ) ) ( CALIBRATION_TARGET ?auto_36559 ?auto_36556 ) ( POWER_AVAIL ?auto_36557 ) ( POINTING ?auto_36557 ?auto_36558 ) ( not ( = ?auto_36556 ?auto_36558 ) ) ( not ( = ?auto_36554 ?auto_36558 ) ) ( not ( = ?auto_36553 ?auto_36558 ) ) ( HAVE_IMAGE ?auto_36551 ?auto_36552 ) ( not ( = ?auto_36551 ?auto_36553 ) ) ( not ( = ?auto_36551 ?auto_36554 ) ) ( not ( = ?auto_36551 ?auto_36556 ) ) ( not ( = ?auto_36551 ?auto_36558 ) ) ( not ( = ?auto_36552 ?auto_36550 ) ) ( not ( = ?auto_36552 ?auto_36555 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36553 ?auto_36550 ?auto_36554 ?auto_36555 )
      ( GET-3IMAGE-VERIFY ?auto_36551 ?auto_36552 ?auto_36553 ?auto_36550 ?auto_36554 ?auto_36555 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36561 - DIRECTION
      ?auto_36562 - MODE
      ?auto_36563 - DIRECTION
      ?auto_36560 - MODE
      ?auto_36564 - DIRECTION
      ?auto_36565 - MODE
    )
    :vars
    (
      ?auto_36568 - INSTRUMENT
      ?auto_36567 - SATELLITE
      ?auto_36566 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36568 ?auto_36567 ) ( SUPPORTS ?auto_36568 ?auto_36565 ) ( not ( = ?auto_36564 ?auto_36566 ) ) ( HAVE_IMAGE ?auto_36561 ?auto_36562 ) ( not ( = ?auto_36561 ?auto_36564 ) ) ( not ( = ?auto_36561 ?auto_36566 ) ) ( not ( = ?auto_36562 ?auto_36565 ) ) ( CALIBRATION_TARGET ?auto_36568 ?auto_36566 ) ( POWER_AVAIL ?auto_36567 ) ( POINTING ?auto_36567 ?auto_36563 ) ( not ( = ?auto_36566 ?auto_36563 ) ) ( not ( = ?auto_36564 ?auto_36563 ) ) ( not ( = ?auto_36561 ?auto_36563 ) ) ( HAVE_IMAGE ?auto_36563 ?auto_36560 ) ( not ( = ?auto_36562 ?auto_36560 ) ) ( not ( = ?auto_36560 ?auto_36565 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36561 ?auto_36562 ?auto_36564 ?auto_36565 )
      ( GET-3IMAGE-VERIFY ?auto_36561 ?auto_36562 ?auto_36563 ?auto_36560 ?auto_36564 ?auto_36565 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36570 - DIRECTION
      ?auto_36571 - MODE
      ?auto_36572 - DIRECTION
      ?auto_36569 - MODE
      ?auto_36573 - DIRECTION
      ?auto_36574 - MODE
    )
    :vars
    (
      ?auto_36578 - INSTRUMENT
      ?auto_36576 - SATELLITE
      ?auto_36575 - DIRECTION
      ?auto_36577 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36578 ?auto_36576 ) ( SUPPORTS ?auto_36578 ?auto_36569 ) ( not ( = ?auto_36572 ?auto_36575 ) ) ( HAVE_IMAGE ?auto_36573 ?auto_36574 ) ( not ( = ?auto_36573 ?auto_36572 ) ) ( not ( = ?auto_36573 ?auto_36575 ) ) ( not ( = ?auto_36574 ?auto_36569 ) ) ( CALIBRATION_TARGET ?auto_36578 ?auto_36575 ) ( POWER_AVAIL ?auto_36576 ) ( POINTING ?auto_36576 ?auto_36577 ) ( not ( = ?auto_36575 ?auto_36577 ) ) ( not ( = ?auto_36572 ?auto_36577 ) ) ( not ( = ?auto_36573 ?auto_36577 ) ) ( HAVE_IMAGE ?auto_36570 ?auto_36571 ) ( not ( = ?auto_36570 ?auto_36572 ) ) ( not ( = ?auto_36570 ?auto_36573 ) ) ( not ( = ?auto_36570 ?auto_36575 ) ) ( not ( = ?auto_36570 ?auto_36577 ) ) ( not ( = ?auto_36571 ?auto_36569 ) ) ( not ( = ?auto_36571 ?auto_36574 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36573 ?auto_36574 ?auto_36572 ?auto_36569 )
      ( GET-3IMAGE-VERIFY ?auto_36570 ?auto_36571 ?auto_36572 ?auto_36569 ?auto_36573 ?auto_36574 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36580 - DIRECTION
      ?auto_36581 - MODE
      ?auto_36582 - DIRECTION
      ?auto_36579 - MODE
      ?auto_36583 - DIRECTION
      ?auto_36584 - MODE
    )
    :vars
    (
      ?auto_36587 - INSTRUMENT
      ?auto_36586 - SATELLITE
      ?auto_36585 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36587 ?auto_36586 ) ( SUPPORTS ?auto_36587 ?auto_36579 ) ( not ( = ?auto_36582 ?auto_36585 ) ) ( HAVE_IMAGE ?auto_36580 ?auto_36581 ) ( not ( = ?auto_36580 ?auto_36582 ) ) ( not ( = ?auto_36580 ?auto_36585 ) ) ( not ( = ?auto_36581 ?auto_36579 ) ) ( CALIBRATION_TARGET ?auto_36587 ?auto_36585 ) ( POWER_AVAIL ?auto_36586 ) ( POINTING ?auto_36586 ?auto_36583 ) ( not ( = ?auto_36585 ?auto_36583 ) ) ( not ( = ?auto_36582 ?auto_36583 ) ) ( not ( = ?auto_36580 ?auto_36583 ) ) ( HAVE_IMAGE ?auto_36583 ?auto_36584 ) ( not ( = ?auto_36581 ?auto_36584 ) ) ( not ( = ?auto_36579 ?auto_36584 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36580 ?auto_36581 ?auto_36582 ?auto_36579 )
      ( GET-3IMAGE-VERIFY ?auto_36580 ?auto_36581 ?auto_36582 ?auto_36579 ?auto_36583 ?auto_36584 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36599 - DIRECTION
      ?auto_36600 - MODE
      ?auto_36601 - DIRECTION
      ?auto_36598 - MODE
      ?auto_36602 - DIRECTION
      ?auto_36603 - MODE
    )
    :vars
    (
      ?auto_36606 - INSTRUMENT
      ?auto_36605 - SATELLITE
      ?auto_36604 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36606 ?auto_36605 ) ( SUPPORTS ?auto_36606 ?auto_36603 ) ( not ( = ?auto_36602 ?auto_36604 ) ) ( HAVE_IMAGE ?auto_36601 ?auto_36598 ) ( not ( = ?auto_36601 ?auto_36602 ) ) ( not ( = ?auto_36601 ?auto_36604 ) ) ( not ( = ?auto_36598 ?auto_36603 ) ) ( CALIBRATION_TARGET ?auto_36606 ?auto_36604 ) ( POWER_AVAIL ?auto_36605 ) ( POINTING ?auto_36605 ?auto_36599 ) ( not ( = ?auto_36604 ?auto_36599 ) ) ( not ( = ?auto_36602 ?auto_36599 ) ) ( not ( = ?auto_36601 ?auto_36599 ) ) ( HAVE_IMAGE ?auto_36599 ?auto_36600 ) ( not ( = ?auto_36600 ?auto_36598 ) ) ( not ( = ?auto_36600 ?auto_36603 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36601 ?auto_36598 ?auto_36602 ?auto_36603 )
      ( GET-3IMAGE-VERIFY ?auto_36599 ?auto_36600 ?auto_36601 ?auto_36598 ?auto_36602 ?auto_36603 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36608 - DIRECTION
      ?auto_36609 - MODE
      ?auto_36610 - DIRECTION
      ?auto_36607 - MODE
      ?auto_36611 - DIRECTION
      ?auto_36612 - MODE
    )
    :vars
    (
      ?auto_36616 - INSTRUMENT
      ?auto_36615 - SATELLITE
      ?auto_36613 - DIRECTION
      ?auto_36614 - DIRECTION
      ?auto_36617 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_36616 ?auto_36615 ) ( SUPPORTS ?auto_36616 ?auto_36612 ) ( not ( = ?auto_36611 ?auto_36613 ) ) ( HAVE_IMAGE ?auto_36614 ?auto_36617 ) ( not ( = ?auto_36614 ?auto_36611 ) ) ( not ( = ?auto_36614 ?auto_36613 ) ) ( not ( = ?auto_36617 ?auto_36612 ) ) ( CALIBRATION_TARGET ?auto_36616 ?auto_36613 ) ( POWER_AVAIL ?auto_36615 ) ( POINTING ?auto_36615 ?auto_36608 ) ( not ( = ?auto_36613 ?auto_36608 ) ) ( not ( = ?auto_36611 ?auto_36608 ) ) ( not ( = ?auto_36614 ?auto_36608 ) ) ( HAVE_IMAGE ?auto_36608 ?auto_36609 ) ( HAVE_IMAGE ?auto_36610 ?auto_36607 ) ( not ( = ?auto_36608 ?auto_36610 ) ) ( not ( = ?auto_36609 ?auto_36607 ) ) ( not ( = ?auto_36609 ?auto_36612 ) ) ( not ( = ?auto_36609 ?auto_36617 ) ) ( not ( = ?auto_36610 ?auto_36611 ) ) ( not ( = ?auto_36610 ?auto_36613 ) ) ( not ( = ?auto_36610 ?auto_36614 ) ) ( not ( = ?auto_36607 ?auto_36612 ) ) ( not ( = ?auto_36607 ?auto_36617 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36614 ?auto_36617 ?auto_36611 ?auto_36612 )
      ( GET-3IMAGE-VERIFY ?auto_36608 ?auto_36609 ?auto_36610 ?auto_36607 ?auto_36611 ?auto_36612 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36619 - DIRECTION
      ?auto_36620 - MODE
      ?auto_36621 - DIRECTION
      ?auto_36618 - MODE
      ?auto_36622 - DIRECTION
      ?auto_36623 - MODE
    )
    :vars
    (
      ?auto_36626 - INSTRUMENT
      ?auto_36625 - SATELLITE
      ?auto_36624 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36626 ?auto_36625 ) ( SUPPORTS ?auto_36626 ?auto_36618 ) ( not ( = ?auto_36621 ?auto_36624 ) ) ( HAVE_IMAGE ?auto_36622 ?auto_36623 ) ( not ( = ?auto_36622 ?auto_36621 ) ) ( not ( = ?auto_36622 ?auto_36624 ) ) ( not ( = ?auto_36623 ?auto_36618 ) ) ( CALIBRATION_TARGET ?auto_36626 ?auto_36624 ) ( POWER_AVAIL ?auto_36625 ) ( POINTING ?auto_36625 ?auto_36619 ) ( not ( = ?auto_36624 ?auto_36619 ) ) ( not ( = ?auto_36621 ?auto_36619 ) ) ( not ( = ?auto_36622 ?auto_36619 ) ) ( HAVE_IMAGE ?auto_36619 ?auto_36620 ) ( not ( = ?auto_36620 ?auto_36618 ) ) ( not ( = ?auto_36620 ?auto_36623 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36622 ?auto_36623 ?auto_36621 ?auto_36618 )
      ( GET-3IMAGE-VERIFY ?auto_36619 ?auto_36620 ?auto_36621 ?auto_36618 ?auto_36622 ?auto_36623 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36628 - DIRECTION
      ?auto_36629 - MODE
      ?auto_36630 - DIRECTION
      ?auto_36627 - MODE
      ?auto_36631 - DIRECTION
      ?auto_36632 - MODE
    )
    :vars
    (
      ?auto_36636 - INSTRUMENT
      ?auto_36635 - SATELLITE
      ?auto_36633 - DIRECTION
      ?auto_36634 - DIRECTION
      ?auto_36637 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_36636 ?auto_36635 ) ( SUPPORTS ?auto_36636 ?auto_36627 ) ( not ( = ?auto_36630 ?auto_36633 ) ) ( HAVE_IMAGE ?auto_36634 ?auto_36637 ) ( not ( = ?auto_36634 ?auto_36630 ) ) ( not ( = ?auto_36634 ?auto_36633 ) ) ( not ( = ?auto_36637 ?auto_36627 ) ) ( CALIBRATION_TARGET ?auto_36636 ?auto_36633 ) ( POWER_AVAIL ?auto_36635 ) ( POINTING ?auto_36635 ?auto_36628 ) ( not ( = ?auto_36633 ?auto_36628 ) ) ( not ( = ?auto_36630 ?auto_36628 ) ) ( not ( = ?auto_36634 ?auto_36628 ) ) ( HAVE_IMAGE ?auto_36628 ?auto_36629 ) ( HAVE_IMAGE ?auto_36631 ?auto_36632 ) ( not ( = ?auto_36628 ?auto_36631 ) ) ( not ( = ?auto_36629 ?auto_36627 ) ) ( not ( = ?auto_36629 ?auto_36632 ) ) ( not ( = ?auto_36629 ?auto_36637 ) ) ( not ( = ?auto_36630 ?auto_36631 ) ) ( not ( = ?auto_36627 ?auto_36632 ) ) ( not ( = ?auto_36631 ?auto_36633 ) ) ( not ( = ?auto_36631 ?auto_36634 ) ) ( not ( = ?auto_36632 ?auto_36637 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36634 ?auto_36637 ?auto_36630 ?auto_36627 )
      ( GET-3IMAGE-VERIFY ?auto_36628 ?auto_36629 ?auto_36630 ?auto_36627 ?auto_36631 ?auto_36632 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36650 - DIRECTION
      ?auto_36651 - MODE
      ?auto_36652 - DIRECTION
      ?auto_36649 - MODE
      ?auto_36653 - DIRECTION
      ?auto_36654 - MODE
    )
    :vars
    (
      ?auto_36658 - INSTRUMENT
      ?auto_36656 - SATELLITE
      ?auto_36655 - DIRECTION
      ?auto_36657 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36658 ?auto_36656 ) ( SUPPORTS ?auto_36658 ?auto_36651 ) ( not ( = ?auto_36650 ?auto_36655 ) ) ( HAVE_IMAGE ?auto_36652 ?auto_36654 ) ( not ( = ?auto_36652 ?auto_36650 ) ) ( not ( = ?auto_36652 ?auto_36655 ) ) ( not ( = ?auto_36654 ?auto_36651 ) ) ( CALIBRATION_TARGET ?auto_36658 ?auto_36655 ) ( POWER_AVAIL ?auto_36656 ) ( POINTING ?auto_36656 ?auto_36657 ) ( not ( = ?auto_36655 ?auto_36657 ) ) ( not ( = ?auto_36650 ?auto_36657 ) ) ( not ( = ?auto_36652 ?auto_36657 ) ) ( HAVE_IMAGE ?auto_36652 ?auto_36649 ) ( HAVE_IMAGE ?auto_36653 ?auto_36654 ) ( not ( = ?auto_36650 ?auto_36653 ) ) ( not ( = ?auto_36651 ?auto_36649 ) ) ( not ( = ?auto_36652 ?auto_36653 ) ) ( not ( = ?auto_36649 ?auto_36654 ) ) ( not ( = ?auto_36653 ?auto_36655 ) ) ( not ( = ?auto_36653 ?auto_36657 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36652 ?auto_36654 ?auto_36650 ?auto_36651 )
      ( GET-3IMAGE-VERIFY ?auto_36650 ?auto_36651 ?auto_36652 ?auto_36649 ?auto_36653 ?auto_36654 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36660 - DIRECTION
      ?auto_36661 - MODE
      ?auto_36662 - DIRECTION
      ?auto_36659 - MODE
      ?auto_36663 - DIRECTION
      ?auto_36664 - MODE
    )
    :vars
    (
      ?auto_36667 - INSTRUMENT
      ?auto_36666 - SATELLITE
      ?auto_36665 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36667 ?auto_36666 ) ( SUPPORTS ?auto_36667 ?auto_36661 ) ( not ( = ?auto_36660 ?auto_36665 ) ) ( HAVE_IMAGE ?auto_36662 ?auto_36659 ) ( not ( = ?auto_36662 ?auto_36660 ) ) ( not ( = ?auto_36662 ?auto_36665 ) ) ( not ( = ?auto_36659 ?auto_36661 ) ) ( CALIBRATION_TARGET ?auto_36667 ?auto_36665 ) ( POWER_AVAIL ?auto_36666 ) ( POINTING ?auto_36666 ?auto_36663 ) ( not ( = ?auto_36665 ?auto_36663 ) ) ( not ( = ?auto_36660 ?auto_36663 ) ) ( not ( = ?auto_36662 ?auto_36663 ) ) ( HAVE_IMAGE ?auto_36663 ?auto_36664 ) ( not ( = ?auto_36661 ?auto_36664 ) ) ( not ( = ?auto_36659 ?auto_36664 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36662 ?auto_36659 ?auto_36660 ?auto_36661 )
      ( GET-3IMAGE-VERIFY ?auto_36660 ?auto_36661 ?auto_36662 ?auto_36659 ?auto_36663 ?auto_36664 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36679 - DIRECTION
      ?auto_36680 - MODE
      ?auto_36681 - DIRECTION
      ?auto_36678 - MODE
      ?auto_36682 - DIRECTION
      ?auto_36683 - MODE
    )
    :vars
    (
      ?auto_36686 - INSTRUMENT
      ?auto_36685 - SATELLITE
      ?auto_36684 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36686 ?auto_36685 ) ( SUPPORTS ?auto_36686 ?auto_36680 ) ( not ( = ?auto_36679 ?auto_36684 ) ) ( HAVE_IMAGE ?auto_36682 ?auto_36683 ) ( not ( = ?auto_36682 ?auto_36679 ) ) ( not ( = ?auto_36682 ?auto_36684 ) ) ( not ( = ?auto_36683 ?auto_36680 ) ) ( CALIBRATION_TARGET ?auto_36686 ?auto_36684 ) ( POWER_AVAIL ?auto_36685 ) ( POINTING ?auto_36685 ?auto_36681 ) ( not ( = ?auto_36684 ?auto_36681 ) ) ( not ( = ?auto_36679 ?auto_36681 ) ) ( not ( = ?auto_36682 ?auto_36681 ) ) ( HAVE_IMAGE ?auto_36681 ?auto_36678 ) ( not ( = ?auto_36680 ?auto_36678 ) ) ( not ( = ?auto_36678 ?auto_36683 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36682 ?auto_36683 ?auto_36679 ?auto_36680 )
      ( GET-3IMAGE-VERIFY ?auto_36679 ?auto_36680 ?auto_36681 ?auto_36678 ?auto_36682 ?auto_36683 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36688 - DIRECTION
      ?auto_36689 - MODE
      ?auto_36690 - DIRECTION
      ?auto_36687 - MODE
      ?auto_36691 - DIRECTION
      ?auto_36692 - MODE
    )
    :vars
    (
      ?auto_36696 - INSTRUMENT
      ?auto_36695 - SATELLITE
      ?auto_36693 - DIRECTION
      ?auto_36694 - DIRECTION
      ?auto_36697 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_36696 ?auto_36695 ) ( SUPPORTS ?auto_36696 ?auto_36689 ) ( not ( = ?auto_36688 ?auto_36693 ) ) ( HAVE_IMAGE ?auto_36694 ?auto_36697 ) ( not ( = ?auto_36694 ?auto_36688 ) ) ( not ( = ?auto_36694 ?auto_36693 ) ) ( not ( = ?auto_36697 ?auto_36689 ) ) ( CALIBRATION_TARGET ?auto_36696 ?auto_36693 ) ( POWER_AVAIL ?auto_36695 ) ( POINTING ?auto_36695 ?auto_36691 ) ( not ( = ?auto_36693 ?auto_36691 ) ) ( not ( = ?auto_36688 ?auto_36691 ) ) ( not ( = ?auto_36694 ?auto_36691 ) ) ( HAVE_IMAGE ?auto_36690 ?auto_36687 ) ( HAVE_IMAGE ?auto_36691 ?auto_36692 ) ( not ( = ?auto_36688 ?auto_36690 ) ) ( not ( = ?auto_36689 ?auto_36687 ) ) ( not ( = ?auto_36689 ?auto_36692 ) ) ( not ( = ?auto_36690 ?auto_36691 ) ) ( not ( = ?auto_36690 ?auto_36693 ) ) ( not ( = ?auto_36690 ?auto_36694 ) ) ( not ( = ?auto_36687 ?auto_36692 ) ) ( not ( = ?auto_36687 ?auto_36697 ) ) ( not ( = ?auto_36692 ?auto_36697 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36694 ?auto_36697 ?auto_36688 ?auto_36689 )
      ( GET-3IMAGE-VERIFY ?auto_36688 ?auto_36689 ?auto_36690 ?auto_36687 ?auto_36691 ?auto_36692 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36743 - DIRECTION
      ?auto_36744 - MODE
      ?auto_36745 - DIRECTION
      ?auto_36742 - MODE
      ?auto_36746 - DIRECTION
      ?auto_36747 - MODE
      ?auto_36748 - DIRECTION
      ?auto_36749 - MODE
    )
    :vars
    (
      ?auto_36753 - INSTRUMENT
      ?auto_36751 - SATELLITE
      ?auto_36750 - DIRECTION
      ?auto_36752 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36753 ?auto_36751 ) ( SUPPORTS ?auto_36753 ?auto_36749 ) ( not ( = ?auto_36748 ?auto_36750 ) ) ( HAVE_IMAGE ?auto_36745 ?auto_36744 ) ( not ( = ?auto_36745 ?auto_36748 ) ) ( not ( = ?auto_36745 ?auto_36750 ) ) ( not ( = ?auto_36744 ?auto_36749 ) ) ( CALIBRATION_TARGET ?auto_36753 ?auto_36750 ) ( POWER_AVAIL ?auto_36751 ) ( POINTING ?auto_36751 ?auto_36752 ) ( not ( = ?auto_36750 ?auto_36752 ) ) ( not ( = ?auto_36748 ?auto_36752 ) ) ( not ( = ?auto_36745 ?auto_36752 ) ) ( HAVE_IMAGE ?auto_36743 ?auto_36744 ) ( HAVE_IMAGE ?auto_36745 ?auto_36742 ) ( HAVE_IMAGE ?auto_36746 ?auto_36747 ) ( not ( = ?auto_36743 ?auto_36745 ) ) ( not ( = ?auto_36743 ?auto_36746 ) ) ( not ( = ?auto_36743 ?auto_36748 ) ) ( not ( = ?auto_36743 ?auto_36750 ) ) ( not ( = ?auto_36743 ?auto_36752 ) ) ( not ( = ?auto_36744 ?auto_36742 ) ) ( not ( = ?auto_36744 ?auto_36747 ) ) ( not ( = ?auto_36745 ?auto_36746 ) ) ( not ( = ?auto_36742 ?auto_36747 ) ) ( not ( = ?auto_36742 ?auto_36749 ) ) ( not ( = ?auto_36746 ?auto_36748 ) ) ( not ( = ?auto_36746 ?auto_36750 ) ) ( not ( = ?auto_36746 ?auto_36752 ) ) ( not ( = ?auto_36747 ?auto_36749 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36745 ?auto_36744 ?auto_36748 ?auto_36749 )
      ( GET-4IMAGE-VERIFY ?auto_36743 ?auto_36744 ?auto_36745 ?auto_36742 ?auto_36746 ?auto_36747 ?auto_36748 ?auto_36749 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36755 - DIRECTION
      ?auto_36756 - MODE
      ?auto_36757 - DIRECTION
      ?auto_36754 - MODE
      ?auto_36758 - DIRECTION
      ?auto_36759 - MODE
      ?auto_36760 - DIRECTION
      ?auto_36761 - MODE
    )
    :vars
    (
      ?auto_36764 - INSTRUMENT
      ?auto_36763 - SATELLITE
      ?auto_36762 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36764 ?auto_36763 ) ( SUPPORTS ?auto_36764 ?auto_36761 ) ( not ( = ?auto_36760 ?auto_36762 ) ) ( HAVE_IMAGE ?auto_36757 ?auto_36756 ) ( not ( = ?auto_36757 ?auto_36760 ) ) ( not ( = ?auto_36757 ?auto_36762 ) ) ( not ( = ?auto_36756 ?auto_36761 ) ) ( CALIBRATION_TARGET ?auto_36764 ?auto_36762 ) ( POWER_AVAIL ?auto_36763 ) ( POINTING ?auto_36763 ?auto_36758 ) ( not ( = ?auto_36762 ?auto_36758 ) ) ( not ( = ?auto_36760 ?auto_36758 ) ) ( not ( = ?auto_36757 ?auto_36758 ) ) ( HAVE_IMAGE ?auto_36755 ?auto_36756 ) ( HAVE_IMAGE ?auto_36757 ?auto_36754 ) ( HAVE_IMAGE ?auto_36758 ?auto_36759 ) ( not ( = ?auto_36755 ?auto_36757 ) ) ( not ( = ?auto_36755 ?auto_36758 ) ) ( not ( = ?auto_36755 ?auto_36760 ) ) ( not ( = ?auto_36755 ?auto_36762 ) ) ( not ( = ?auto_36756 ?auto_36754 ) ) ( not ( = ?auto_36756 ?auto_36759 ) ) ( not ( = ?auto_36754 ?auto_36759 ) ) ( not ( = ?auto_36754 ?auto_36761 ) ) ( not ( = ?auto_36759 ?auto_36761 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36757 ?auto_36756 ?auto_36760 ?auto_36761 )
      ( GET-4IMAGE-VERIFY ?auto_36755 ?auto_36756 ?auto_36757 ?auto_36754 ?auto_36758 ?auto_36759 ?auto_36760 ?auto_36761 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36766 - DIRECTION
      ?auto_36767 - MODE
      ?auto_36768 - DIRECTION
      ?auto_36765 - MODE
      ?auto_36769 - DIRECTION
      ?auto_36770 - MODE
      ?auto_36771 - DIRECTION
      ?auto_36772 - MODE
    )
    :vars
    (
      ?auto_36776 - INSTRUMENT
      ?auto_36774 - SATELLITE
      ?auto_36773 - DIRECTION
      ?auto_36775 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36776 ?auto_36774 ) ( SUPPORTS ?auto_36776 ?auto_36770 ) ( not ( = ?auto_36769 ?auto_36773 ) ) ( HAVE_IMAGE ?auto_36766 ?auto_36772 ) ( not ( = ?auto_36766 ?auto_36769 ) ) ( not ( = ?auto_36766 ?auto_36773 ) ) ( not ( = ?auto_36772 ?auto_36770 ) ) ( CALIBRATION_TARGET ?auto_36776 ?auto_36773 ) ( POWER_AVAIL ?auto_36774 ) ( POINTING ?auto_36774 ?auto_36775 ) ( not ( = ?auto_36773 ?auto_36775 ) ) ( not ( = ?auto_36769 ?auto_36775 ) ) ( not ( = ?auto_36766 ?auto_36775 ) ) ( HAVE_IMAGE ?auto_36766 ?auto_36767 ) ( HAVE_IMAGE ?auto_36768 ?auto_36765 ) ( HAVE_IMAGE ?auto_36771 ?auto_36772 ) ( not ( = ?auto_36766 ?auto_36768 ) ) ( not ( = ?auto_36766 ?auto_36771 ) ) ( not ( = ?auto_36767 ?auto_36765 ) ) ( not ( = ?auto_36767 ?auto_36770 ) ) ( not ( = ?auto_36767 ?auto_36772 ) ) ( not ( = ?auto_36768 ?auto_36769 ) ) ( not ( = ?auto_36768 ?auto_36771 ) ) ( not ( = ?auto_36768 ?auto_36773 ) ) ( not ( = ?auto_36768 ?auto_36775 ) ) ( not ( = ?auto_36765 ?auto_36770 ) ) ( not ( = ?auto_36765 ?auto_36772 ) ) ( not ( = ?auto_36769 ?auto_36771 ) ) ( not ( = ?auto_36771 ?auto_36773 ) ) ( not ( = ?auto_36771 ?auto_36775 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36766 ?auto_36772 ?auto_36769 ?auto_36770 )
      ( GET-4IMAGE-VERIFY ?auto_36766 ?auto_36767 ?auto_36768 ?auto_36765 ?auto_36769 ?auto_36770 ?auto_36771 ?auto_36772 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36778 - DIRECTION
      ?auto_36779 - MODE
      ?auto_36780 - DIRECTION
      ?auto_36777 - MODE
      ?auto_36781 - DIRECTION
      ?auto_36782 - MODE
      ?auto_36783 - DIRECTION
      ?auto_36784 - MODE
    )
    :vars
    (
      ?auto_36787 - INSTRUMENT
      ?auto_36786 - SATELLITE
      ?auto_36785 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36787 ?auto_36786 ) ( SUPPORTS ?auto_36787 ?auto_36782 ) ( not ( = ?auto_36781 ?auto_36785 ) ) ( HAVE_IMAGE ?auto_36780 ?auto_36779 ) ( not ( = ?auto_36780 ?auto_36781 ) ) ( not ( = ?auto_36780 ?auto_36785 ) ) ( not ( = ?auto_36779 ?auto_36782 ) ) ( CALIBRATION_TARGET ?auto_36787 ?auto_36785 ) ( POWER_AVAIL ?auto_36786 ) ( POINTING ?auto_36786 ?auto_36783 ) ( not ( = ?auto_36785 ?auto_36783 ) ) ( not ( = ?auto_36781 ?auto_36783 ) ) ( not ( = ?auto_36780 ?auto_36783 ) ) ( HAVE_IMAGE ?auto_36778 ?auto_36779 ) ( HAVE_IMAGE ?auto_36780 ?auto_36777 ) ( HAVE_IMAGE ?auto_36783 ?auto_36784 ) ( not ( = ?auto_36778 ?auto_36780 ) ) ( not ( = ?auto_36778 ?auto_36781 ) ) ( not ( = ?auto_36778 ?auto_36783 ) ) ( not ( = ?auto_36778 ?auto_36785 ) ) ( not ( = ?auto_36779 ?auto_36777 ) ) ( not ( = ?auto_36779 ?auto_36784 ) ) ( not ( = ?auto_36777 ?auto_36782 ) ) ( not ( = ?auto_36777 ?auto_36784 ) ) ( not ( = ?auto_36782 ?auto_36784 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36780 ?auto_36779 ?auto_36781 ?auto_36782 )
      ( GET-4IMAGE-VERIFY ?auto_36778 ?auto_36779 ?auto_36780 ?auto_36777 ?auto_36781 ?auto_36782 ?auto_36783 ?auto_36784 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36801 - DIRECTION
      ?auto_36802 - MODE
      ?auto_36803 - DIRECTION
      ?auto_36800 - MODE
      ?auto_36804 - DIRECTION
      ?auto_36805 - MODE
      ?auto_36806 - DIRECTION
      ?auto_36807 - MODE
    )
    :vars
    (
      ?auto_36810 - INSTRUMENT
      ?auto_36809 - SATELLITE
      ?auto_36808 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36810 ?auto_36809 ) ( SUPPORTS ?auto_36810 ?auto_36807 ) ( not ( = ?auto_36806 ?auto_36808 ) ) ( HAVE_IMAGE ?auto_36804 ?auto_36805 ) ( not ( = ?auto_36804 ?auto_36806 ) ) ( not ( = ?auto_36804 ?auto_36808 ) ) ( not ( = ?auto_36805 ?auto_36807 ) ) ( CALIBRATION_TARGET ?auto_36810 ?auto_36808 ) ( POWER_AVAIL ?auto_36809 ) ( POINTING ?auto_36809 ?auto_36803 ) ( not ( = ?auto_36808 ?auto_36803 ) ) ( not ( = ?auto_36806 ?auto_36803 ) ) ( not ( = ?auto_36804 ?auto_36803 ) ) ( HAVE_IMAGE ?auto_36801 ?auto_36802 ) ( HAVE_IMAGE ?auto_36803 ?auto_36800 ) ( not ( = ?auto_36801 ?auto_36803 ) ) ( not ( = ?auto_36801 ?auto_36804 ) ) ( not ( = ?auto_36801 ?auto_36806 ) ) ( not ( = ?auto_36801 ?auto_36808 ) ) ( not ( = ?auto_36802 ?auto_36800 ) ) ( not ( = ?auto_36802 ?auto_36805 ) ) ( not ( = ?auto_36802 ?auto_36807 ) ) ( not ( = ?auto_36800 ?auto_36805 ) ) ( not ( = ?auto_36800 ?auto_36807 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36804 ?auto_36805 ?auto_36806 ?auto_36807 )
      ( GET-4IMAGE-VERIFY ?auto_36801 ?auto_36802 ?auto_36803 ?auto_36800 ?auto_36804 ?auto_36805 ?auto_36806 ?auto_36807 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36812 - DIRECTION
      ?auto_36813 - MODE
      ?auto_36814 - DIRECTION
      ?auto_36811 - MODE
      ?auto_36815 - DIRECTION
      ?auto_36816 - MODE
      ?auto_36817 - DIRECTION
      ?auto_36818 - MODE
    )
    :vars
    (
      ?auto_36821 - INSTRUMENT
      ?auto_36820 - SATELLITE
      ?auto_36819 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36821 ?auto_36820 ) ( SUPPORTS ?auto_36821 ?auto_36818 ) ( not ( = ?auto_36817 ?auto_36819 ) ) ( HAVE_IMAGE ?auto_36812 ?auto_36813 ) ( not ( = ?auto_36812 ?auto_36817 ) ) ( not ( = ?auto_36812 ?auto_36819 ) ) ( not ( = ?auto_36813 ?auto_36818 ) ) ( CALIBRATION_TARGET ?auto_36821 ?auto_36819 ) ( POWER_AVAIL ?auto_36820 ) ( POINTING ?auto_36820 ?auto_36815 ) ( not ( = ?auto_36819 ?auto_36815 ) ) ( not ( = ?auto_36817 ?auto_36815 ) ) ( not ( = ?auto_36812 ?auto_36815 ) ) ( HAVE_IMAGE ?auto_36814 ?auto_36811 ) ( HAVE_IMAGE ?auto_36815 ?auto_36816 ) ( not ( = ?auto_36812 ?auto_36814 ) ) ( not ( = ?auto_36813 ?auto_36811 ) ) ( not ( = ?auto_36813 ?auto_36816 ) ) ( not ( = ?auto_36814 ?auto_36815 ) ) ( not ( = ?auto_36814 ?auto_36817 ) ) ( not ( = ?auto_36814 ?auto_36819 ) ) ( not ( = ?auto_36811 ?auto_36816 ) ) ( not ( = ?auto_36811 ?auto_36818 ) ) ( not ( = ?auto_36816 ?auto_36818 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36812 ?auto_36813 ?auto_36817 ?auto_36818 )
      ( GET-4IMAGE-VERIFY ?auto_36812 ?auto_36813 ?auto_36814 ?auto_36811 ?auto_36815 ?auto_36816 ?auto_36817 ?auto_36818 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36823 - DIRECTION
      ?auto_36824 - MODE
      ?auto_36825 - DIRECTION
      ?auto_36822 - MODE
      ?auto_36826 - DIRECTION
      ?auto_36827 - MODE
      ?auto_36828 - DIRECTION
      ?auto_36829 - MODE
    )
    :vars
    (
      ?auto_36832 - INSTRUMENT
      ?auto_36831 - SATELLITE
      ?auto_36830 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36832 ?auto_36831 ) ( SUPPORTS ?auto_36832 ?auto_36827 ) ( not ( = ?auto_36826 ?auto_36830 ) ) ( HAVE_IMAGE ?auto_36823 ?auto_36829 ) ( not ( = ?auto_36823 ?auto_36826 ) ) ( not ( = ?auto_36823 ?auto_36830 ) ) ( not ( = ?auto_36829 ?auto_36827 ) ) ( CALIBRATION_TARGET ?auto_36832 ?auto_36830 ) ( POWER_AVAIL ?auto_36831 ) ( POINTING ?auto_36831 ?auto_36825 ) ( not ( = ?auto_36830 ?auto_36825 ) ) ( not ( = ?auto_36826 ?auto_36825 ) ) ( not ( = ?auto_36823 ?auto_36825 ) ) ( HAVE_IMAGE ?auto_36823 ?auto_36824 ) ( HAVE_IMAGE ?auto_36825 ?auto_36822 ) ( HAVE_IMAGE ?auto_36828 ?auto_36829 ) ( not ( = ?auto_36823 ?auto_36828 ) ) ( not ( = ?auto_36824 ?auto_36822 ) ) ( not ( = ?auto_36824 ?auto_36827 ) ) ( not ( = ?auto_36824 ?auto_36829 ) ) ( not ( = ?auto_36825 ?auto_36828 ) ) ( not ( = ?auto_36822 ?auto_36827 ) ) ( not ( = ?auto_36822 ?auto_36829 ) ) ( not ( = ?auto_36826 ?auto_36828 ) ) ( not ( = ?auto_36828 ?auto_36830 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36823 ?auto_36829 ?auto_36826 ?auto_36827 )
      ( GET-4IMAGE-VERIFY ?auto_36823 ?auto_36824 ?auto_36825 ?auto_36822 ?auto_36826 ?auto_36827 ?auto_36828 ?auto_36829 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36834 - DIRECTION
      ?auto_36835 - MODE
      ?auto_36836 - DIRECTION
      ?auto_36833 - MODE
      ?auto_36837 - DIRECTION
      ?auto_36838 - MODE
      ?auto_36839 - DIRECTION
      ?auto_36840 - MODE
    )
    :vars
    (
      ?auto_36843 - INSTRUMENT
      ?auto_36842 - SATELLITE
      ?auto_36841 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36843 ?auto_36842 ) ( SUPPORTS ?auto_36843 ?auto_36838 ) ( not ( = ?auto_36837 ?auto_36841 ) ) ( HAVE_IMAGE ?auto_36834 ?auto_36835 ) ( not ( = ?auto_36834 ?auto_36837 ) ) ( not ( = ?auto_36834 ?auto_36841 ) ) ( not ( = ?auto_36835 ?auto_36838 ) ) ( CALIBRATION_TARGET ?auto_36843 ?auto_36841 ) ( POWER_AVAIL ?auto_36842 ) ( POINTING ?auto_36842 ?auto_36836 ) ( not ( = ?auto_36841 ?auto_36836 ) ) ( not ( = ?auto_36837 ?auto_36836 ) ) ( not ( = ?auto_36834 ?auto_36836 ) ) ( HAVE_IMAGE ?auto_36836 ?auto_36833 ) ( HAVE_IMAGE ?auto_36839 ?auto_36840 ) ( not ( = ?auto_36834 ?auto_36839 ) ) ( not ( = ?auto_36835 ?auto_36833 ) ) ( not ( = ?auto_36835 ?auto_36840 ) ) ( not ( = ?auto_36836 ?auto_36839 ) ) ( not ( = ?auto_36833 ?auto_36838 ) ) ( not ( = ?auto_36833 ?auto_36840 ) ) ( not ( = ?auto_36837 ?auto_36839 ) ) ( not ( = ?auto_36838 ?auto_36840 ) ) ( not ( = ?auto_36839 ?auto_36841 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36834 ?auto_36835 ?auto_36837 ?auto_36838 )
      ( GET-4IMAGE-VERIFY ?auto_36834 ?auto_36835 ?auto_36836 ?auto_36833 ?auto_36837 ?auto_36838 ?auto_36839 ?auto_36840 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36856 - DIRECTION
      ?auto_36857 - MODE
      ?auto_36858 - DIRECTION
      ?auto_36855 - MODE
      ?auto_36859 - DIRECTION
      ?auto_36860 - MODE
      ?auto_36861 - DIRECTION
      ?auto_36862 - MODE
    )
    :vars
    (
      ?auto_36866 - INSTRUMENT
      ?auto_36864 - SATELLITE
      ?auto_36863 - DIRECTION
      ?auto_36865 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36866 ?auto_36864 ) ( SUPPORTS ?auto_36866 ?auto_36855 ) ( not ( = ?auto_36858 ?auto_36863 ) ) ( HAVE_IMAGE ?auto_36861 ?auto_36862 ) ( not ( = ?auto_36861 ?auto_36858 ) ) ( not ( = ?auto_36861 ?auto_36863 ) ) ( not ( = ?auto_36862 ?auto_36855 ) ) ( CALIBRATION_TARGET ?auto_36866 ?auto_36863 ) ( POWER_AVAIL ?auto_36864 ) ( POINTING ?auto_36864 ?auto_36865 ) ( not ( = ?auto_36863 ?auto_36865 ) ) ( not ( = ?auto_36858 ?auto_36865 ) ) ( not ( = ?auto_36861 ?auto_36865 ) ) ( HAVE_IMAGE ?auto_36856 ?auto_36857 ) ( HAVE_IMAGE ?auto_36859 ?auto_36860 ) ( not ( = ?auto_36856 ?auto_36858 ) ) ( not ( = ?auto_36856 ?auto_36859 ) ) ( not ( = ?auto_36856 ?auto_36861 ) ) ( not ( = ?auto_36856 ?auto_36863 ) ) ( not ( = ?auto_36856 ?auto_36865 ) ) ( not ( = ?auto_36857 ?auto_36855 ) ) ( not ( = ?auto_36857 ?auto_36860 ) ) ( not ( = ?auto_36857 ?auto_36862 ) ) ( not ( = ?auto_36858 ?auto_36859 ) ) ( not ( = ?auto_36855 ?auto_36860 ) ) ( not ( = ?auto_36859 ?auto_36861 ) ) ( not ( = ?auto_36859 ?auto_36863 ) ) ( not ( = ?auto_36859 ?auto_36865 ) ) ( not ( = ?auto_36860 ?auto_36862 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36861 ?auto_36862 ?auto_36858 ?auto_36855 )
      ( GET-4IMAGE-VERIFY ?auto_36856 ?auto_36857 ?auto_36858 ?auto_36855 ?auto_36859 ?auto_36860 ?auto_36861 ?auto_36862 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36868 - DIRECTION
      ?auto_36869 - MODE
      ?auto_36870 - DIRECTION
      ?auto_36867 - MODE
      ?auto_36871 - DIRECTION
      ?auto_36872 - MODE
      ?auto_36873 - DIRECTION
      ?auto_36874 - MODE
    )
    :vars
    (
      ?auto_36877 - INSTRUMENT
      ?auto_36876 - SATELLITE
      ?auto_36875 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36877 ?auto_36876 ) ( SUPPORTS ?auto_36877 ?auto_36867 ) ( not ( = ?auto_36870 ?auto_36875 ) ) ( HAVE_IMAGE ?auto_36871 ?auto_36872 ) ( not ( = ?auto_36871 ?auto_36870 ) ) ( not ( = ?auto_36871 ?auto_36875 ) ) ( not ( = ?auto_36872 ?auto_36867 ) ) ( CALIBRATION_TARGET ?auto_36877 ?auto_36875 ) ( POWER_AVAIL ?auto_36876 ) ( POINTING ?auto_36876 ?auto_36873 ) ( not ( = ?auto_36875 ?auto_36873 ) ) ( not ( = ?auto_36870 ?auto_36873 ) ) ( not ( = ?auto_36871 ?auto_36873 ) ) ( HAVE_IMAGE ?auto_36868 ?auto_36869 ) ( HAVE_IMAGE ?auto_36873 ?auto_36874 ) ( not ( = ?auto_36868 ?auto_36870 ) ) ( not ( = ?auto_36868 ?auto_36871 ) ) ( not ( = ?auto_36868 ?auto_36873 ) ) ( not ( = ?auto_36868 ?auto_36875 ) ) ( not ( = ?auto_36869 ?auto_36867 ) ) ( not ( = ?auto_36869 ?auto_36872 ) ) ( not ( = ?auto_36869 ?auto_36874 ) ) ( not ( = ?auto_36867 ?auto_36874 ) ) ( not ( = ?auto_36872 ?auto_36874 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36871 ?auto_36872 ?auto_36870 ?auto_36867 )
      ( GET-4IMAGE-VERIFY ?auto_36868 ?auto_36869 ?auto_36870 ?auto_36867 ?auto_36871 ?auto_36872 ?auto_36873 ?auto_36874 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36891 - DIRECTION
      ?auto_36892 - MODE
      ?auto_36893 - DIRECTION
      ?auto_36890 - MODE
      ?auto_36894 - DIRECTION
      ?auto_36895 - MODE
      ?auto_36896 - DIRECTION
      ?auto_36897 - MODE
    )
    :vars
    (
      ?auto_36900 - INSTRUMENT
      ?auto_36899 - SATELLITE
      ?auto_36898 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36900 ?auto_36899 ) ( SUPPORTS ?auto_36900 ?auto_36890 ) ( not ( = ?auto_36893 ?auto_36898 ) ) ( HAVE_IMAGE ?auto_36896 ?auto_36897 ) ( not ( = ?auto_36896 ?auto_36893 ) ) ( not ( = ?auto_36896 ?auto_36898 ) ) ( not ( = ?auto_36897 ?auto_36890 ) ) ( CALIBRATION_TARGET ?auto_36900 ?auto_36898 ) ( POWER_AVAIL ?auto_36899 ) ( POINTING ?auto_36899 ?auto_36894 ) ( not ( = ?auto_36898 ?auto_36894 ) ) ( not ( = ?auto_36893 ?auto_36894 ) ) ( not ( = ?auto_36896 ?auto_36894 ) ) ( HAVE_IMAGE ?auto_36891 ?auto_36892 ) ( HAVE_IMAGE ?auto_36894 ?auto_36895 ) ( not ( = ?auto_36891 ?auto_36893 ) ) ( not ( = ?auto_36891 ?auto_36894 ) ) ( not ( = ?auto_36891 ?auto_36896 ) ) ( not ( = ?auto_36891 ?auto_36898 ) ) ( not ( = ?auto_36892 ?auto_36890 ) ) ( not ( = ?auto_36892 ?auto_36895 ) ) ( not ( = ?auto_36892 ?auto_36897 ) ) ( not ( = ?auto_36890 ?auto_36895 ) ) ( not ( = ?auto_36895 ?auto_36897 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36896 ?auto_36897 ?auto_36893 ?auto_36890 )
      ( GET-4IMAGE-VERIFY ?auto_36891 ?auto_36892 ?auto_36893 ?auto_36890 ?auto_36894 ?auto_36895 ?auto_36896 ?auto_36897 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36902 - DIRECTION
      ?auto_36903 - MODE
      ?auto_36904 - DIRECTION
      ?auto_36901 - MODE
      ?auto_36905 - DIRECTION
      ?auto_36906 - MODE
      ?auto_36907 - DIRECTION
      ?auto_36908 - MODE
    )
    :vars
    (
      ?auto_36911 - INSTRUMENT
      ?auto_36910 - SATELLITE
      ?auto_36909 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36911 ?auto_36910 ) ( SUPPORTS ?auto_36911 ?auto_36901 ) ( not ( = ?auto_36904 ?auto_36909 ) ) ( HAVE_IMAGE ?auto_36902 ?auto_36903 ) ( not ( = ?auto_36902 ?auto_36904 ) ) ( not ( = ?auto_36902 ?auto_36909 ) ) ( not ( = ?auto_36903 ?auto_36901 ) ) ( CALIBRATION_TARGET ?auto_36911 ?auto_36909 ) ( POWER_AVAIL ?auto_36910 ) ( POINTING ?auto_36910 ?auto_36905 ) ( not ( = ?auto_36909 ?auto_36905 ) ) ( not ( = ?auto_36904 ?auto_36905 ) ) ( not ( = ?auto_36902 ?auto_36905 ) ) ( HAVE_IMAGE ?auto_36905 ?auto_36906 ) ( HAVE_IMAGE ?auto_36907 ?auto_36908 ) ( not ( = ?auto_36902 ?auto_36907 ) ) ( not ( = ?auto_36903 ?auto_36906 ) ) ( not ( = ?auto_36903 ?auto_36908 ) ) ( not ( = ?auto_36904 ?auto_36907 ) ) ( not ( = ?auto_36901 ?auto_36906 ) ) ( not ( = ?auto_36901 ?auto_36908 ) ) ( not ( = ?auto_36905 ?auto_36907 ) ) ( not ( = ?auto_36906 ?auto_36908 ) ) ( not ( = ?auto_36907 ?auto_36909 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36902 ?auto_36903 ?auto_36904 ?auto_36901 )
      ( GET-4IMAGE-VERIFY ?auto_36902 ?auto_36903 ?auto_36904 ?auto_36901 ?auto_36905 ?auto_36906 ?auto_36907 ?auto_36908 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36959 - DIRECTION
      ?auto_36960 - MODE
      ?auto_36961 - DIRECTION
      ?auto_36958 - MODE
      ?auto_36962 - DIRECTION
      ?auto_36963 - MODE
      ?auto_36964 - DIRECTION
      ?auto_36965 - MODE
    )
    :vars
    (
      ?auto_36968 - INSTRUMENT
      ?auto_36967 - SATELLITE
      ?auto_36966 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36968 ?auto_36967 ) ( SUPPORTS ?auto_36968 ?auto_36965 ) ( not ( = ?auto_36964 ?auto_36966 ) ) ( HAVE_IMAGE ?auto_36962 ?auto_36958 ) ( not ( = ?auto_36962 ?auto_36964 ) ) ( not ( = ?auto_36962 ?auto_36966 ) ) ( not ( = ?auto_36958 ?auto_36965 ) ) ( CALIBRATION_TARGET ?auto_36968 ?auto_36966 ) ( POWER_AVAIL ?auto_36967 ) ( POINTING ?auto_36967 ?auto_36959 ) ( not ( = ?auto_36966 ?auto_36959 ) ) ( not ( = ?auto_36964 ?auto_36959 ) ) ( not ( = ?auto_36962 ?auto_36959 ) ) ( HAVE_IMAGE ?auto_36959 ?auto_36960 ) ( HAVE_IMAGE ?auto_36961 ?auto_36958 ) ( HAVE_IMAGE ?auto_36962 ?auto_36963 ) ( not ( = ?auto_36959 ?auto_36961 ) ) ( not ( = ?auto_36960 ?auto_36958 ) ) ( not ( = ?auto_36960 ?auto_36963 ) ) ( not ( = ?auto_36960 ?auto_36965 ) ) ( not ( = ?auto_36961 ?auto_36962 ) ) ( not ( = ?auto_36961 ?auto_36964 ) ) ( not ( = ?auto_36961 ?auto_36966 ) ) ( not ( = ?auto_36958 ?auto_36963 ) ) ( not ( = ?auto_36963 ?auto_36965 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36962 ?auto_36958 ?auto_36964 ?auto_36965 )
      ( GET-4IMAGE-VERIFY ?auto_36959 ?auto_36960 ?auto_36961 ?auto_36958 ?auto_36962 ?auto_36963 ?auto_36964 ?auto_36965 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36970 - DIRECTION
      ?auto_36971 - MODE
      ?auto_36972 - DIRECTION
      ?auto_36969 - MODE
      ?auto_36973 - DIRECTION
      ?auto_36974 - MODE
      ?auto_36975 - DIRECTION
      ?auto_36976 - MODE
    )
    :vars
    (
      ?auto_36979 - INSTRUMENT
      ?auto_36978 - SATELLITE
      ?auto_36977 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36979 ?auto_36978 ) ( SUPPORTS ?auto_36979 ?auto_36976 ) ( not ( = ?auto_36975 ?auto_36977 ) ) ( HAVE_IMAGE ?auto_36972 ?auto_36969 ) ( not ( = ?auto_36972 ?auto_36975 ) ) ( not ( = ?auto_36972 ?auto_36977 ) ) ( not ( = ?auto_36969 ?auto_36976 ) ) ( CALIBRATION_TARGET ?auto_36979 ?auto_36977 ) ( POWER_AVAIL ?auto_36978 ) ( POINTING ?auto_36978 ?auto_36973 ) ( not ( = ?auto_36977 ?auto_36973 ) ) ( not ( = ?auto_36975 ?auto_36973 ) ) ( not ( = ?auto_36972 ?auto_36973 ) ) ( HAVE_IMAGE ?auto_36970 ?auto_36971 ) ( HAVE_IMAGE ?auto_36973 ?auto_36974 ) ( not ( = ?auto_36970 ?auto_36972 ) ) ( not ( = ?auto_36970 ?auto_36973 ) ) ( not ( = ?auto_36970 ?auto_36975 ) ) ( not ( = ?auto_36970 ?auto_36977 ) ) ( not ( = ?auto_36971 ?auto_36969 ) ) ( not ( = ?auto_36971 ?auto_36974 ) ) ( not ( = ?auto_36971 ?auto_36976 ) ) ( not ( = ?auto_36969 ?auto_36974 ) ) ( not ( = ?auto_36974 ?auto_36976 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36972 ?auto_36969 ?auto_36975 ?auto_36976 )
      ( GET-4IMAGE-VERIFY ?auto_36970 ?auto_36971 ?auto_36972 ?auto_36969 ?auto_36973 ?auto_36974 ?auto_36975 ?auto_36976 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36981 - DIRECTION
      ?auto_36982 - MODE
      ?auto_36983 - DIRECTION
      ?auto_36980 - MODE
      ?auto_36984 - DIRECTION
      ?auto_36985 - MODE
      ?auto_36986 - DIRECTION
      ?auto_36987 - MODE
    )
    :vars
    (
      ?auto_36990 - INSTRUMENT
      ?auto_36989 - SATELLITE
      ?auto_36988 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_36990 ?auto_36989 ) ( SUPPORTS ?auto_36990 ?auto_36985 ) ( not ( = ?auto_36984 ?auto_36988 ) ) ( HAVE_IMAGE ?auto_36983 ?auto_36987 ) ( not ( = ?auto_36983 ?auto_36984 ) ) ( not ( = ?auto_36983 ?auto_36988 ) ) ( not ( = ?auto_36987 ?auto_36985 ) ) ( CALIBRATION_TARGET ?auto_36990 ?auto_36988 ) ( POWER_AVAIL ?auto_36989 ) ( POINTING ?auto_36989 ?auto_36981 ) ( not ( = ?auto_36988 ?auto_36981 ) ) ( not ( = ?auto_36984 ?auto_36981 ) ) ( not ( = ?auto_36983 ?auto_36981 ) ) ( HAVE_IMAGE ?auto_36981 ?auto_36982 ) ( HAVE_IMAGE ?auto_36983 ?auto_36980 ) ( HAVE_IMAGE ?auto_36986 ?auto_36987 ) ( not ( = ?auto_36981 ?auto_36986 ) ) ( not ( = ?auto_36982 ?auto_36980 ) ) ( not ( = ?auto_36982 ?auto_36985 ) ) ( not ( = ?auto_36982 ?auto_36987 ) ) ( not ( = ?auto_36983 ?auto_36986 ) ) ( not ( = ?auto_36980 ?auto_36985 ) ) ( not ( = ?auto_36980 ?auto_36987 ) ) ( not ( = ?auto_36984 ?auto_36986 ) ) ( not ( = ?auto_36986 ?auto_36988 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36983 ?auto_36987 ?auto_36984 ?auto_36985 )
      ( GET-4IMAGE-VERIFY ?auto_36981 ?auto_36982 ?auto_36983 ?auto_36980 ?auto_36984 ?auto_36985 ?auto_36986 ?auto_36987 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_36992 - DIRECTION
      ?auto_36993 - MODE
      ?auto_36994 - DIRECTION
      ?auto_36991 - MODE
      ?auto_36995 - DIRECTION
      ?auto_36996 - MODE
      ?auto_36997 - DIRECTION
      ?auto_36998 - MODE
    )
    :vars
    (
      ?auto_37001 - INSTRUMENT
      ?auto_37000 - SATELLITE
      ?auto_36999 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_37001 ?auto_37000 ) ( SUPPORTS ?auto_37001 ?auto_36996 ) ( not ( = ?auto_36995 ?auto_36999 ) ) ( HAVE_IMAGE ?auto_36994 ?auto_36991 ) ( not ( = ?auto_36994 ?auto_36995 ) ) ( not ( = ?auto_36994 ?auto_36999 ) ) ( not ( = ?auto_36991 ?auto_36996 ) ) ( CALIBRATION_TARGET ?auto_37001 ?auto_36999 ) ( POWER_AVAIL ?auto_37000 ) ( POINTING ?auto_37000 ?auto_36992 ) ( not ( = ?auto_36999 ?auto_36992 ) ) ( not ( = ?auto_36995 ?auto_36992 ) ) ( not ( = ?auto_36994 ?auto_36992 ) ) ( HAVE_IMAGE ?auto_36992 ?auto_36993 ) ( HAVE_IMAGE ?auto_36997 ?auto_36998 ) ( not ( = ?auto_36992 ?auto_36997 ) ) ( not ( = ?auto_36993 ?auto_36991 ) ) ( not ( = ?auto_36993 ?auto_36996 ) ) ( not ( = ?auto_36993 ?auto_36998 ) ) ( not ( = ?auto_36994 ?auto_36997 ) ) ( not ( = ?auto_36991 ?auto_36998 ) ) ( not ( = ?auto_36995 ?auto_36997 ) ) ( not ( = ?auto_36996 ?auto_36998 ) ) ( not ( = ?auto_36997 ?auto_36999 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36994 ?auto_36991 ?auto_36995 ?auto_36996 )
      ( GET-4IMAGE-VERIFY ?auto_36992 ?auto_36993 ?auto_36994 ?auto_36991 ?auto_36995 ?auto_36996 ?auto_36997 ?auto_36998 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37014 - DIRECTION
      ?auto_37015 - MODE
      ?auto_37016 - DIRECTION
      ?auto_37013 - MODE
      ?auto_37017 - DIRECTION
      ?auto_37018 - MODE
      ?auto_37019 - DIRECTION
      ?auto_37020 - MODE
    )
    :vars
    (
      ?auto_37023 - INSTRUMENT
      ?auto_37022 - SATELLITE
      ?auto_37021 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_37023 ?auto_37022 ) ( SUPPORTS ?auto_37023 ?auto_37020 ) ( not ( = ?auto_37019 ?auto_37021 ) ) ( HAVE_IMAGE ?auto_37017 ?auto_37018 ) ( not ( = ?auto_37017 ?auto_37019 ) ) ( not ( = ?auto_37017 ?auto_37021 ) ) ( not ( = ?auto_37018 ?auto_37020 ) ) ( CALIBRATION_TARGET ?auto_37023 ?auto_37021 ) ( POWER_AVAIL ?auto_37022 ) ( POINTING ?auto_37022 ?auto_37014 ) ( not ( = ?auto_37021 ?auto_37014 ) ) ( not ( = ?auto_37019 ?auto_37014 ) ) ( not ( = ?auto_37017 ?auto_37014 ) ) ( HAVE_IMAGE ?auto_37014 ?auto_37015 ) ( HAVE_IMAGE ?auto_37016 ?auto_37013 ) ( not ( = ?auto_37014 ?auto_37016 ) ) ( not ( = ?auto_37015 ?auto_37013 ) ) ( not ( = ?auto_37015 ?auto_37018 ) ) ( not ( = ?auto_37015 ?auto_37020 ) ) ( not ( = ?auto_37016 ?auto_37017 ) ) ( not ( = ?auto_37016 ?auto_37019 ) ) ( not ( = ?auto_37016 ?auto_37021 ) ) ( not ( = ?auto_37013 ?auto_37018 ) ) ( not ( = ?auto_37013 ?auto_37020 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37017 ?auto_37018 ?auto_37019 ?auto_37020 )
      ( GET-4IMAGE-VERIFY ?auto_37014 ?auto_37015 ?auto_37016 ?auto_37013 ?auto_37017 ?auto_37018 ?auto_37019 ?auto_37020 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37025 - DIRECTION
      ?auto_37026 - MODE
      ?auto_37027 - DIRECTION
      ?auto_37024 - MODE
      ?auto_37028 - DIRECTION
      ?auto_37029 - MODE
      ?auto_37030 - DIRECTION
      ?auto_37031 - MODE
    )
    :vars
    (
      ?auto_37035 - INSTRUMENT
      ?auto_37034 - SATELLITE
      ?auto_37032 - DIRECTION
      ?auto_37033 - DIRECTION
      ?auto_37036 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_37035 ?auto_37034 ) ( SUPPORTS ?auto_37035 ?auto_37031 ) ( not ( = ?auto_37030 ?auto_37032 ) ) ( HAVE_IMAGE ?auto_37033 ?auto_37036 ) ( not ( = ?auto_37033 ?auto_37030 ) ) ( not ( = ?auto_37033 ?auto_37032 ) ) ( not ( = ?auto_37036 ?auto_37031 ) ) ( CALIBRATION_TARGET ?auto_37035 ?auto_37032 ) ( POWER_AVAIL ?auto_37034 ) ( POINTING ?auto_37034 ?auto_37028 ) ( not ( = ?auto_37032 ?auto_37028 ) ) ( not ( = ?auto_37030 ?auto_37028 ) ) ( not ( = ?auto_37033 ?auto_37028 ) ) ( HAVE_IMAGE ?auto_37025 ?auto_37026 ) ( HAVE_IMAGE ?auto_37027 ?auto_37024 ) ( HAVE_IMAGE ?auto_37028 ?auto_37029 ) ( not ( = ?auto_37025 ?auto_37027 ) ) ( not ( = ?auto_37025 ?auto_37028 ) ) ( not ( = ?auto_37025 ?auto_37030 ) ) ( not ( = ?auto_37025 ?auto_37032 ) ) ( not ( = ?auto_37025 ?auto_37033 ) ) ( not ( = ?auto_37026 ?auto_37024 ) ) ( not ( = ?auto_37026 ?auto_37029 ) ) ( not ( = ?auto_37026 ?auto_37031 ) ) ( not ( = ?auto_37026 ?auto_37036 ) ) ( not ( = ?auto_37027 ?auto_37028 ) ) ( not ( = ?auto_37027 ?auto_37030 ) ) ( not ( = ?auto_37027 ?auto_37032 ) ) ( not ( = ?auto_37027 ?auto_37033 ) ) ( not ( = ?auto_37024 ?auto_37029 ) ) ( not ( = ?auto_37024 ?auto_37031 ) ) ( not ( = ?auto_37024 ?auto_37036 ) ) ( not ( = ?auto_37029 ?auto_37031 ) ) ( not ( = ?auto_37029 ?auto_37036 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37033 ?auto_37036 ?auto_37030 ?auto_37031 )
      ( GET-4IMAGE-VERIFY ?auto_37025 ?auto_37026 ?auto_37027 ?auto_37024 ?auto_37028 ?auto_37029 ?auto_37030 ?auto_37031 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37038 - DIRECTION
      ?auto_37039 - MODE
      ?auto_37040 - DIRECTION
      ?auto_37037 - MODE
      ?auto_37041 - DIRECTION
      ?auto_37042 - MODE
      ?auto_37043 - DIRECTION
      ?auto_37044 - MODE
    )
    :vars
    (
      ?auto_37047 - INSTRUMENT
      ?auto_37046 - SATELLITE
      ?auto_37045 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_37047 ?auto_37046 ) ( SUPPORTS ?auto_37047 ?auto_37042 ) ( not ( = ?auto_37041 ?auto_37045 ) ) ( HAVE_IMAGE ?auto_37043 ?auto_37044 ) ( not ( = ?auto_37043 ?auto_37041 ) ) ( not ( = ?auto_37043 ?auto_37045 ) ) ( not ( = ?auto_37044 ?auto_37042 ) ) ( CALIBRATION_TARGET ?auto_37047 ?auto_37045 ) ( POWER_AVAIL ?auto_37046 ) ( POINTING ?auto_37046 ?auto_37038 ) ( not ( = ?auto_37045 ?auto_37038 ) ) ( not ( = ?auto_37041 ?auto_37038 ) ) ( not ( = ?auto_37043 ?auto_37038 ) ) ( HAVE_IMAGE ?auto_37038 ?auto_37039 ) ( HAVE_IMAGE ?auto_37040 ?auto_37037 ) ( not ( = ?auto_37038 ?auto_37040 ) ) ( not ( = ?auto_37039 ?auto_37037 ) ) ( not ( = ?auto_37039 ?auto_37042 ) ) ( not ( = ?auto_37039 ?auto_37044 ) ) ( not ( = ?auto_37040 ?auto_37041 ) ) ( not ( = ?auto_37040 ?auto_37043 ) ) ( not ( = ?auto_37040 ?auto_37045 ) ) ( not ( = ?auto_37037 ?auto_37042 ) ) ( not ( = ?auto_37037 ?auto_37044 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37043 ?auto_37044 ?auto_37041 ?auto_37042 )
      ( GET-4IMAGE-VERIFY ?auto_37038 ?auto_37039 ?auto_37040 ?auto_37037 ?auto_37041 ?auto_37042 ?auto_37043 ?auto_37044 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37049 - DIRECTION
      ?auto_37050 - MODE
      ?auto_37051 - DIRECTION
      ?auto_37048 - MODE
      ?auto_37052 - DIRECTION
      ?auto_37053 - MODE
      ?auto_37054 - DIRECTION
      ?auto_37055 - MODE
    )
    :vars
    (
      ?auto_37059 - INSTRUMENT
      ?auto_37058 - SATELLITE
      ?auto_37056 - DIRECTION
      ?auto_37057 - DIRECTION
      ?auto_37060 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_37059 ?auto_37058 ) ( SUPPORTS ?auto_37059 ?auto_37053 ) ( not ( = ?auto_37052 ?auto_37056 ) ) ( HAVE_IMAGE ?auto_37057 ?auto_37060 ) ( not ( = ?auto_37057 ?auto_37052 ) ) ( not ( = ?auto_37057 ?auto_37056 ) ) ( not ( = ?auto_37060 ?auto_37053 ) ) ( CALIBRATION_TARGET ?auto_37059 ?auto_37056 ) ( POWER_AVAIL ?auto_37058 ) ( POINTING ?auto_37058 ?auto_37051 ) ( not ( = ?auto_37056 ?auto_37051 ) ) ( not ( = ?auto_37052 ?auto_37051 ) ) ( not ( = ?auto_37057 ?auto_37051 ) ) ( HAVE_IMAGE ?auto_37049 ?auto_37050 ) ( HAVE_IMAGE ?auto_37051 ?auto_37048 ) ( HAVE_IMAGE ?auto_37054 ?auto_37055 ) ( not ( = ?auto_37049 ?auto_37051 ) ) ( not ( = ?auto_37049 ?auto_37052 ) ) ( not ( = ?auto_37049 ?auto_37054 ) ) ( not ( = ?auto_37049 ?auto_37056 ) ) ( not ( = ?auto_37049 ?auto_37057 ) ) ( not ( = ?auto_37050 ?auto_37048 ) ) ( not ( = ?auto_37050 ?auto_37053 ) ) ( not ( = ?auto_37050 ?auto_37055 ) ) ( not ( = ?auto_37050 ?auto_37060 ) ) ( not ( = ?auto_37051 ?auto_37054 ) ) ( not ( = ?auto_37048 ?auto_37053 ) ) ( not ( = ?auto_37048 ?auto_37055 ) ) ( not ( = ?auto_37048 ?auto_37060 ) ) ( not ( = ?auto_37052 ?auto_37054 ) ) ( not ( = ?auto_37053 ?auto_37055 ) ) ( not ( = ?auto_37054 ?auto_37056 ) ) ( not ( = ?auto_37054 ?auto_37057 ) ) ( not ( = ?auto_37055 ?auto_37060 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37057 ?auto_37060 ?auto_37052 ?auto_37053 )
      ( GET-4IMAGE-VERIFY ?auto_37049 ?auto_37050 ?auto_37051 ?auto_37048 ?auto_37052 ?auto_37053 ?auto_37054 ?auto_37055 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37075 - DIRECTION
      ?auto_37076 - MODE
      ?auto_37077 - DIRECTION
      ?auto_37074 - MODE
      ?auto_37078 - DIRECTION
      ?auto_37079 - MODE
      ?auto_37080 - DIRECTION
      ?auto_37081 - MODE
    )
    :vars
    (
      ?auto_37084 - INSTRUMENT
      ?auto_37083 - SATELLITE
      ?auto_37082 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_37084 ?auto_37083 ) ( SUPPORTS ?auto_37084 ?auto_37074 ) ( not ( = ?auto_37077 ?auto_37082 ) ) ( HAVE_IMAGE ?auto_37078 ?auto_37081 ) ( not ( = ?auto_37078 ?auto_37077 ) ) ( not ( = ?auto_37078 ?auto_37082 ) ) ( not ( = ?auto_37081 ?auto_37074 ) ) ( CALIBRATION_TARGET ?auto_37084 ?auto_37082 ) ( POWER_AVAIL ?auto_37083 ) ( POINTING ?auto_37083 ?auto_37075 ) ( not ( = ?auto_37082 ?auto_37075 ) ) ( not ( = ?auto_37077 ?auto_37075 ) ) ( not ( = ?auto_37078 ?auto_37075 ) ) ( HAVE_IMAGE ?auto_37075 ?auto_37076 ) ( HAVE_IMAGE ?auto_37078 ?auto_37079 ) ( HAVE_IMAGE ?auto_37080 ?auto_37081 ) ( not ( = ?auto_37075 ?auto_37080 ) ) ( not ( = ?auto_37076 ?auto_37074 ) ) ( not ( = ?auto_37076 ?auto_37079 ) ) ( not ( = ?auto_37076 ?auto_37081 ) ) ( not ( = ?auto_37077 ?auto_37080 ) ) ( not ( = ?auto_37074 ?auto_37079 ) ) ( not ( = ?auto_37078 ?auto_37080 ) ) ( not ( = ?auto_37079 ?auto_37081 ) ) ( not ( = ?auto_37080 ?auto_37082 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37078 ?auto_37081 ?auto_37077 ?auto_37074 )
      ( GET-4IMAGE-VERIFY ?auto_37075 ?auto_37076 ?auto_37077 ?auto_37074 ?auto_37078 ?auto_37079 ?auto_37080 ?auto_37081 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37086 - DIRECTION
      ?auto_37087 - MODE
      ?auto_37088 - DIRECTION
      ?auto_37085 - MODE
      ?auto_37089 - DIRECTION
      ?auto_37090 - MODE
      ?auto_37091 - DIRECTION
      ?auto_37092 - MODE
    )
    :vars
    (
      ?auto_37095 - INSTRUMENT
      ?auto_37094 - SATELLITE
      ?auto_37093 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_37095 ?auto_37094 ) ( SUPPORTS ?auto_37095 ?auto_37085 ) ( not ( = ?auto_37088 ?auto_37093 ) ) ( HAVE_IMAGE ?auto_37089 ?auto_37090 ) ( not ( = ?auto_37089 ?auto_37088 ) ) ( not ( = ?auto_37089 ?auto_37093 ) ) ( not ( = ?auto_37090 ?auto_37085 ) ) ( CALIBRATION_TARGET ?auto_37095 ?auto_37093 ) ( POWER_AVAIL ?auto_37094 ) ( POINTING ?auto_37094 ?auto_37086 ) ( not ( = ?auto_37093 ?auto_37086 ) ) ( not ( = ?auto_37088 ?auto_37086 ) ) ( not ( = ?auto_37089 ?auto_37086 ) ) ( HAVE_IMAGE ?auto_37086 ?auto_37087 ) ( HAVE_IMAGE ?auto_37091 ?auto_37092 ) ( not ( = ?auto_37086 ?auto_37091 ) ) ( not ( = ?auto_37087 ?auto_37085 ) ) ( not ( = ?auto_37087 ?auto_37090 ) ) ( not ( = ?auto_37087 ?auto_37092 ) ) ( not ( = ?auto_37088 ?auto_37091 ) ) ( not ( = ?auto_37085 ?auto_37092 ) ) ( not ( = ?auto_37089 ?auto_37091 ) ) ( not ( = ?auto_37090 ?auto_37092 ) ) ( not ( = ?auto_37091 ?auto_37093 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37089 ?auto_37090 ?auto_37088 ?auto_37085 )
      ( GET-4IMAGE-VERIFY ?auto_37086 ?auto_37087 ?auto_37088 ?auto_37085 ?auto_37089 ?auto_37090 ?auto_37091 ?auto_37092 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37108 - DIRECTION
      ?auto_37109 - MODE
      ?auto_37110 - DIRECTION
      ?auto_37107 - MODE
      ?auto_37111 - DIRECTION
      ?auto_37112 - MODE
      ?auto_37113 - DIRECTION
      ?auto_37114 - MODE
    )
    :vars
    (
      ?auto_37117 - INSTRUMENT
      ?auto_37116 - SATELLITE
      ?auto_37115 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_37117 ?auto_37116 ) ( SUPPORTS ?auto_37117 ?auto_37107 ) ( not ( = ?auto_37110 ?auto_37115 ) ) ( HAVE_IMAGE ?auto_37113 ?auto_37114 ) ( not ( = ?auto_37113 ?auto_37110 ) ) ( not ( = ?auto_37113 ?auto_37115 ) ) ( not ( = ?auto_37114 ?auto_37107 ) ) ( CALIBRATION_TARGET ?auto_37117 ?auto_37115 ) ( POWER_AVAIL ?auto_37116 ) ( POINTING ?auto_37116 ?auto_37108 ) ( not ( = ?auto_37115 ?auto_37108 ) ) ( not ( = ?auto_37110 ?auto_37108 ) ) ( not ( = ?auto_37113 ?auto_37108 ) ) ( HAVE_IMAGE ?auto_37108 ?auto_37109 ) ( HAVE_IMAGE ?auto_37111 ?auto_37112 ) ( not ( = ?auto_37108 ?auto_37111 ) ) ( not ( = ?auto_37109 ?auto_37107 ) ) ( not ( = ?auto_37109 ?auto_37112 ) ) ( not ( = ?auto_37109 ?auto_37114 ) ) ( not ( = ?auto_37110 ?auto_37111 ) ) ( not ( = ?auto_37107 ?auto_37112 ) ) ( not ( = ?auto_37111 ?auto_37113 ) ) ( not ( = ?auto_37111 ?auto_37115 ) ) ( not ( = ?auto_37112 ?auto_37114 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37113 ?auto_37114 ?auto_37110 ?auto_37107 )
      ( GET-4IMAGE-VERIFY ?auto_37108 ?auto_37109 ?auto_37110 ?auto_37107 ?auto_37111 ?auto_37112 ?auto_37113 ?auto_37114 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37119 - DIRECTION
      ?auto_37120 - MODE
      ?auto_37121 - DIRECTION
      ?auto_37118 - MODE
      ?auto_37122 - DIRECTION
      ?auto_37123 - MODE
      ?auto_37124 - DIRECTION
      ?auto_37125 - MODE
    )
    :vars
    (
      ?auto_37129 - INSTRUMENT
      ?auto_37128 - SATELLITE
      ?auto_37126 - DIRECTION
      ?auto_37127 - DIRECTION
      ?auto_37130 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_37129 ?auto_37128 ) ( SUPPORTS ?auto_37129 ?auto_37118 ) ( not ( = ?auto_37121 ?auto_37126 ) ) ( HAVE_IMAGE ?auto_37127 ?auto_37130 ) ( not ( = ?auto_37127 ?auto_37121 ) ) ( not ( = ?auto_37127 ?auto_37126 ) ) ( not ( = ?auto_37130 ?auto_37118 ) ) ( CALIBRATION_TARGET ?auto_37129 ?auto_37126 ) ( POWER_AVAIL ?auto_37128 ) ( POINTING ?auto_37128 ?auto_37122 ) ( not ( = ?auto_37126 ?auto_37122 ) ) ( not ( = ?auto_37121 ?auto_37122 ) ) ( not ( = ?auto_37127 ?auto_37122 ) ) ( HAVE_IMAGE ?auto_37119 ?auto_37120 ) ( HAVE_IMAGE ?auto_37122 ?auto_37123 ) ( HAVE_IMAGE ?auto_37124 ?auto_37125 ) ( not ( = ?auto_37119 ?auto_37121 ) ) ( not ( = ?auto_37119 ?auto_37122 ) ) ( not ( = ?auto_37119 ?auto_37124 ) ) ( not ( = ?auto_37119 ?auto_37126 ) ) ( not ( = ?auto_37119 ?auto_37127 ) ) ( not ( = ?auto_37120 ?auto_37118 ) ) ( not ( = ?auto_37120 ?auto_37123 ) ) ( not ( = ?auto_37120 ?auto_37125 ) ) ( not ( = ?auto_37120 ?auto_37130 ) ) ( not ( = ?auto_37121 ?auto_37124 ) ) ( not ( = ?auto_37118 ?auto_37123 ) ) ( not ( = ?auto_37118 ?auto_37125 ) ) ( not ( = ?auto_37122 ?auto_37124 ) ) ( not ( = ?auto_37123 ?auto_37125 ) ) ( not ( = ?auto_37123 ?auto_37130 ) ) ( not ( = ?auto_37124 ?auto_37126 ) ) ( not ( = ?auto_37124 ?auto_37127 ) ) ( not ( = ?auto_37125 ?auto_37130 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37127 ?auto_37130 ?auto_37121 ?auto_37118 )
      ( GET-4IMAGE-VERIFY ?auto_37119 ?auto_37120 ?auto_37121 ?auto_37118 ?auto_37122 ?auto_37123 ?auto_37124 ?auto_37125 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37182 - DIRECTION
      ?auto_37183 - MODE
      ?auto_37184 - DIRECTION
      ?auto_37181 - MODE
      ?auto_37185 - DIRECTION
      ?auto_37186 - MODE
      ?auto_37187 - DIRECTION
      ?auto_37188 - MODE
    )
    :vars
    (
      ?auto_37192 - INSTRUMENT
      ?auto_37190 - SATELLITE
      ?auto_37189 - DIRECTION
      ?auto_37191 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_37192 ?auto_37190 ) ( SUPPORTS ?auto_37192 ?auto_37183 ) ( not ( = ?auto_37182 ?auto_37189 ) ) ( HAVE_IMAGE ?auto_37184 ?auto_37188 ) ( not ( = ?auto_37184 ?auto_37182 ) ) ( not ( = ?auto_37184 ?auto_37189 ) ) ( not ( = ?auto_37188 ?auto_37183 ) ) ( CALIBRATION_TARGET ?auto_37192 ?auto_37189 ) ( POWER_AVAIL ?auto_37190 ) ( POINTING ?auto_37190 ?auto_37191 ) ( not ( = ?auto_37189 ?auto_37191 ) ) ( not ( = ?auto_37182 ?auto_37191 ) ) ( not ( = ?auto_37184 ?auto_37191 ) ) ( HAVE_IMAGE ?auto_37184 ?auto_37181 ) ( HAVE_IMAGE ?auto_37185 ?auto_37186 ) ( HAVE_IMAGE ?auto_37187 ?auto_37188 ) ( not ( = ?auto_37182 ?auto_37185 ) ) ( not ( = ?auto_37182 ?auto_37187 ) ) ( not ( = ?auto_37183 ?auto_37181 ) ) ( not ( = ?auto_37183 ?auto_37186 ) ) ( not ( = ?auto_37184 ?auto_37185 ) ) ( not ( = ?auto_37184 ?auto_37187 ) ) ( not ( = ?auto_37181 ?auto_37186 ) ) ( not ( = ?auto_37181 ?auto_37188 ) ) ( not ( = ?auto_37185 ?auto_37187 ) ) ( not ( = ?auto_37185 ?auto_37189 ) ) ( not ( = ?auto_37185 ?auto_37191 ) ) ( not ( = ?auto_37186 ?auto_37188 ) ) ( not ( = ?auto_37187 ?auto_37189 ) ) ( not ( = ?auto_37187 ?auto_37191 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37184 ?auto_37188 ?auto_37182 ?auto_37183 )
      ( GET-4IMAGE-VERIFY ?auto_37182 ?auto_37183 ?auto_37184 ?auto_37181 ?auto_37185 ?auto_37186 ?auto_37187 ?auto_37188 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37194 - DIRECTION
      ?auto_37195 - MODE
      ?auto_37196 - DIRECTION
      ?auto_37193 - MODE
      ?auto_37197 - DIRECTION
      ?auto_37198 - MODE
      ?auto_37199 - DIRECTION
      ?auto_37200 - MODE
    )
    :vars
    (
      ?auto_37203 - INSTRUMENT
      ?auto_37202 - SATELLITE
      ?auto_37201 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_37203 ?auto_37202 ) ( SUPPORTS ?auto_37203 ?auto_37195 ) ( not ( = ?auto_37194 ?auto_37201 ) ) ( HAVE_IMAGE ?auto_37197 ?auto_37193 ) ( not ( = ?auto_37197 ?auto_37194 ) ) ( not ( = ?auto_37197 ?auto_37201 ) ) ( not ( = ?auto_37193 ?auto_37195 ) ) ( CALIBRATION_TARGET ?auto_37203 ?auto_37201 ) ( POWER_AVAIL ?auto_37202 ) ( POINTING ?auto_37202 ?auto_37199 ) ( not ( = ?auto_37201 ?auto_37199 ) ) ( not ( = ?auto_37194 ?auto_37199 ) ) ( not ( = ?auto_37197 ?auto_37199 ) ) ( HAVE_IMAGE ?auto_37196 ?auto_37193 ) ( HAVE_IMAGE ?auto_37197 ?auto_37198 ) ( HAVE_IMAGE ?auto_37199 ?auto_37200 ) ( not ( = ?auto_37194 ?auto_37196 ) ) ( not ( = ?auto_37195 ?auto_37198 ) ) ( not ( = ?auto_37195 ?auto_37200 ) ) ( not ( = ?auto_37196 ?auto_37197 ) ) ( not ( = ?auto_37196 ?auto_37199 ) ) ( not ( = ?auto_37196 ?auto_37201 ) ) ( not ( = ?auto_37193 ?auto_37198 ) ) ( not ( = ?auto_37193 ?auto_37200 ) ) ( not ( = ?auto_37198 ?auto_37200 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37197 ?auto_37193 ?auto_37194 ?auto_37195 )
      ( GET-4IMAGE-VERIFY ?auto_37194 ?auto_37195 ?auto_37196 ?auto_37193 ?auto_37197 ?auto_37198 ?auto_37199 ?auto_37200 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37217 - DIRECTION
      ?auto_37218 - MODE
      ?auto_37219 - DIRECTION
      ?auto_37216 - MODE
      ?auto_37220 - DIRECTION
      ?auto_37221 - MODE
      ?auto_37222 - DIRECTION
      ?auto_37223 - MODE
    )
    :vars
    (
      ?auto_37226 - INSTRUMENT
      ?auto_37225 - SATELLITE
      ?auto_37224 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_37226 ?auto_37225 ) ( SUPPORTS ?auto_37226 ?auto_37218 ) ( not ( = ?auto_37217 ?auto_37224 ) ) ( HAVE_IMAGE ?auto_37222 ?auto_37223 ) ( not ( = ?auto_37222 ?auto_37217 ) ) ( not ( = ?auto_37222 ?auto_37224 ) ) ( not ( = ?auto_37223 ?auto_37218 ) ) ( CALIBRATION_TARGET ?auto_37226 ?auto_37224 ) ( POWER_AVAIL ?auto_37225 ) ( POINTING ?auto_37225 ?auto_37220 ) ( not ( = ?auto_37224 ?auto_37220 ) ) ( not ( = ?auto_37217 ?auto_37220 ) ) ( not ( = ?auto_37222 ?auto_37220 ) ) ( HAVE_IMAGE ?auto_37219 ?auto_37216 ) ( HAVE_IMAGE ?auto_37220 ?auto_37221 ) ( not ( = ?auto_37217 ?auto_37219 ) ) ( not ( = ?auto_37218 ?auto_37216 ) ) ( not ( = ?auto_37218 ?auto_37221 ) ) ( not ( = ?auto_37219 ?auto_37220 ) ) ( not ( = ?auto_37219 ?auto_37222 ) ) ( not ( = ?auto_37219 ?auto_37224 ) ) ( not ( = ?auto_37216 ?auto_37221 ) ) ( not ( = ?auto_37216 ?auto_37223 ) ) ( not ( = ?auto_37221 ?auto_37223 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37222 ?auto_37223 ?auto_37217 ?auto_37218 )
      ( GET-4IMAGE-VERIFY ?auto_37217 ?auto_37218 ?auto_37219 ?auto_37216 ?auto_37220 ?auto_37221 ?auto_37222 ?auto_37223 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37228 - DIRECTION
      ?auto_37229 - MODE
      ?auto_37230 - DIRECTION
      ?auto_37227 - MODE
      ?auto_37231 - DIRECTION
      ?auto_37232 - MODE
      ?auto_37233 - DIRECTION
      ?auto_37234 - MODE
    )
    :vars
    (
      ?auto_37237 - INSTRUMENT
      ?auto_37236 - SATELLITE
      ?auto_37235 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_37237 ?auto_37236 ) ( SUPPORTS ?auto_37237 ?auto_37229 ) ( not ( = ?auto_37228 ?auto_37235 ) ) ( HAVE_IMAGE ?auto_37230 ?auto_37227 ) ( not ( = ?auto_37230 ?auto_37228 ) ) ( not ( = ?auto_37230 ?auto_37235 ) ) ( not ( = ?auto_37227 ?auto_37229 ) ) ( CALIBRATION_TARGET ?auto_37237 ?auto_37235 ) ( POWER_AVAIL ?auto_37236 ) ( POINTING ?auto_37236 ?auto_37231 ) ( not ( = ?auto_37235 ?auto_37231 ) ) ( not ( = ?auto_37228 ?auto_37231 ) ) ( not ( = ?auto_37230 ?auto_37231 ) ) ( HAVE_IMAGE ?auto_37231 ?auto_37232 ) ( HAVE_IMAGE ?auto_37233 ?auto_37234 ) ( not ( = ?auto_37228 ?auto_37233 ) ) ( not ( = ?auto_37229 ?auto_37232 ) ) ( not ( = ?auto_37229 ?auto_37234 ) ) ( not ( = ?auto_37230 ?auto_37233 ) ) ( not ( = ?auto_37227 ?auto_37232 ) ) ( not ( = ?auto_37227 ?auto_37234 ) ) ( not ( = ?auto_37231 ?auto_37233 ) ) ( not ( = ?auto_37232 ?auto_37234 ) ) ( not ( = ?auto_37233 ?auto_37235 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37230 ?auto_37227 ?auto_37228 ?auto_37229 )
      ( GET-4IMAGE-VERIFY ?auto_37228 ?auto_37229 ?auto_37230 ?auto_37227 ?auto_37231 ?auto_37232 ?auto_37233 ?auto_37234 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37285 - DIRECTION
      ?auto_37286 - MODE
      ?auto_37287 - DIRECTION
      ?auto_37284 - MODE
      ?auto_37288 - DIRECTION
      ?auto_37289 - MODE
      ?auto_37290 - DIRECTION
      ?auto_37291 - MODE
    )
    :vars
    (
      ?auto_37294 - INSTRUMENT
      ?auto_37293 - SATELLITE
      ?auto_37292 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_37294 ?auto_37293 ) ( SUPPORTS ?auto_37294 ?auto_37286 ) ( not ( = ?auto_37285 ?auto_37292 ) ) ( HAVE_IMAGE ?auto_37288 ?auto_37291 ) ( not ( = ?auto_37288 ?auto_37285 ) ) ( not ( = ?auto_37288 ?auto_37292 ) ) ( not ( = ?auto_37291 ?auto_37286 ) ) ( CALIBRATION_TARGET ?auto_37294 ?auto_37292 ) ( POWER_AVAIL ?auto_37293 ) ( POINTING ?auto_37293 ?auto_37287 ) ( not ( = ?auto_37292 ?auto_37287 ) ) ( not ( = ?auto_37285 ?auto_37287 ) ) ( not ( = ?auto_37288 ?auto_37287 ) ) ( HAVE_IMAGE ?auto_37287 ?auto_37284 ) ( HAVE_IMAGE ?auto_37288 ?auto_37289 ) ( HAVE_IMAGE ?auto_37290 ?auto_37291 ) ( not ( = ?auto_37285 ?auto_37290 ) ) ( not ( = ?auto_37286 ?auto_37284 ) ) ( not ( = ?auto_37286 ?auto_37289 ) ) ( not ( = ?auto_37287 ?auto_37290 ) ) ( not ( = ?auto_37284 ?auto_37289 ) ) ( not ( = ?auto_37284 ?auto_37291 ) ) ( not ( = ?auto_37288 ?auto_37290 ) ) ( not ( = ?auto_37289 ?auto_37291 ) ) ( not ( = ?auto_37290 ?auto_37292 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37288 ?auto_37291 ?auto_37285 ?auto_37286 )
      ( GET-4IMAGE-VERIFY ?auto_37285 ?auto_37286 ?auto_37287 ?auto_37284 ?auto_37288 ?auto_37289 ?auto_37290 ?auto_37291 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37296 - DIRECTION
      ?auto_37297 - MODE
      ?auto_37298 - DIRECTION
      ?auto_37295 - MODE
      ?auto_37299 - DIRECTION
      ?auto_37300 - MODE
      ?auto_37301 - DIRECTION
      ?auto_37302 - MODE
    )
    :vars
    (
      ?auto_37305 - INSTRUMENT
      ?auto_37304 - SATELLITE
      ?auto_37303 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_37305 ?auto_37304 ) ( SUPPORTS ?auto_37305 ?auto_37297 ) ( not ( = ?auto_37296 ?auto_37303 ) ) ( HAVE_IMAGE ?auto_37299 ?auto_37300 ) ( not ( = ?auto_37299 ?auto_37296 ) ) ( not ( = ?auto_37299 ?auto_37303 ) ) ( not ( = ?auto_37300 ?auto_37297 ) ) ( CALIBRATION_TARGET ?auto_37305 ?auto_37303 ) ( POWER_AVAIL ?auto_37304 ) ( POINTING ?auto_37304 ?auto_37298 ) ( not ( = ?auto_37303 ?auto_37298 ) ) ( not ( = ?auto_37296 ?auto_37298 ) ) ( not ( = ?auto_37299 ?auto_37298 ) ) ( HAVE_IMAGE ?auto_37298 ?auto_37295 ) ( HAVE_IMAGE ?auto_37301 ?auto_37302 ) ( not ( = ?auto_37296 ?auto_37301 ) ) ( not ( = ?auto_37297 ?auto_37295 ) ) ( not ( = ?auto_37297 ?auto_37302 ) ) ( not ( = ?auto_37298 ?auto_37301 ) ) ( not ( = ?auto_37295 ?auto_37300 ) ) ( not ( = ?auto_37295 ?auto_37302 ) ) ( not ( = ?auto_37299 ?auto_37301 ) ) ( not ( = ?auto_37300 ?auto_37302 ) ) ( not ( = ?auto_37301 ?auto_37303 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37299 ?auto_37300 ?auto_37296 ?auto_37297 )
      ( GET-4IMAGE-VERIFY ?auto_37296 ?auto_37297 ?auto_37298 ?auto_37295 ?auto_37299 ?auto_37300 ?auto_37301 ?auto_37302 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37329 - DIRECTION
      ?auto_37330 - MODE
      ?auto_37331 - DIRECTION
      ?auto_37328 - MODE
      ?auto_37332 - DIRECTION
      ?auto_37333 - MODE
      ?auto_37334 - DIRECTION
      ?auto_37335 - MODE
    )
    :vars
    (
      ?auto_37339 - INSTRUMENT
      ?auto_37338 - SATELLITE
      ?auto_37336 - DIRECTION
      ?auto_37337 - DIRECTION
      ?auto_37340 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_37339 ?auto_37338 ) ( SUPPORTS ?auto_37339 ?auto_37330 ) ( not ( = ?auto_37329 ?auto_37336 ) ) ( HAVE_IMAGE ?auto_37337 ?auto_37340 ) ( not ( = ?auto_37337 ?auto_37329 ) ) ( not ( = ?auto_37337 ?auto_37336 ) ) ( not ( = ?auto_37340 ?auto_37330 ) ) ( CALIBRATION_TARGET ?auto_37339 ?auto_37336 ) ( POWER_AVAIL ?auto_37338 ) ( POINTING ?auto_37338 ?auto_37331 ) ( not ( = ?auto_37336 ?auto_37331 ) ) ( not ( = ?auto_37329 ?auto_37331 ) ) ( not ( = ?auto_37337 ?auto_37331 ) ) ( HAVE_IMAGE ?auto_37331 ?auto_37328 ) ( HAVE_IMAGE ?auto_37332 ?auto_37333 ) ( HAVE_IMAGE ?auto_37334 ?auto_37335 ) ( not ( = ?auto_37329 ?auto_37332 ) ) ( not ( = ?auto_37329 ?auto_37334 ) ) ( not ( = ?auto_37330 ?auto_37328 ) ) ( not ( = ?auto_37330 ?auto_37333 ) ) ( not ( = ?auto_37330 ?auto_37335 ) ) ( not ( = ?auto_37331 ?auto_37332 ) ) ( not ( = ?auto_37331 ?auto_37334 ) ) ( not ( = ?auto_37328 ?auto_37333 ) ) ( not ( = ?auto_37328 ?auto_37335 ) ) ( not ( = ?auto_37328 ?auto_37340 ) ) ( not ( = ?auto_37332 ?auto_37334 ) ) ( not ( = ?auto_37332 ?auto_37336 ) ) ( not ( = ?auto_37332 ?auto_37337 ) ) ( not ( = ?auto_37333 ?auto_37335 ) ) ( not ( = ?auto_37333 ?auto_37340 ) ) ( not ( = ?auto_37334 ?auto_37336 ) ) ( not ( = ?auto_37334 ?auto_37337 ) ) ( not ( = ?auto_37335 ?auto_37340 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37337 ?auto_37340 ?auto_37329 ?auto_37330 )
      ( GET-4IMAGE-VERIFY ?auto_37329 ?auto_37330 ?auto_37331 ?auto_37328 ?auto_37332 ?auto_37333 ?auto_37334 ?auto_37335 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_37502 - DIRECTION
      ?auto_37503 - MODE
    )
    :vars
    (
      ?auto_37508 - INSTRUMENT
      ?auto_37506 - SATELLITE
      ?auto_37504 - DIRECTION
      ?auto_37505 - DIRECTION
      ?auto_37509 - MODE
      ?auto_37507 - DIRECTION
      ?auto_37510 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37508 ?auto_37506 ) ( SUPPORTS ?auto_37508 ?auto_37503 ) ( not ( = ?auto_37502 ?auto_37504 ) ) ( HAVE_IMAGE ?auto_37505 ?auto_37509 ) ( not ( = ?auto_37505 ?auto_37502 ) ) ( not ( = ?auto_37505 ?auto_37504 ) ) ( not ( = ?auto_37509 ?auto_37503 ) ) ( CALIBRATION_TARGET ?auto_37508 ?auto_37504 ) ( POINTING ?auto_37506 ?auto_37507 ) ( not ( = ?auto_37504 ?auto_37507 ) ) ( not ( = ?auto_37502 ?auto_37507 ) ) ( not ( = ?auto_37505 ?auto_37507 ) ) ( ON_BOARD ?auto_37510 ?auto_37506 ) ( POWER_ON ?auto_37510 ) ( not ( = ?auto_37508 ?auto_37510 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_37510 ?auto_37506 )
      ( GET-2IMAGE ?auto_37505 ?auto_37509 ?auto_37502 ?auto_37503 )
      ( GET-1IMAGE-VERIFY ?auto_37502 ?auto_37503 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_37512 - DIRECTION
      ?auto_37513 - MODE
      ?auto_37514 - DIRECTION
      ?auto_37511 - MODE
    )
    :vars
    (
      ?auto_37516 - INSTRUMENT
      ?auto_37515 - SATELLITE
      ?auto_37519 - DIRECTION
      ?auto_37518 - DIRECTION
      ?auto_37517 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37516 ?auto_37515 ) ( SUPPORTS ?auto_37516 ?auto_37511 ) ( not ( = ?auto_37514 ?auto_37519 ) ) ( HAVE_IMAGE ?auto_37512 ?auto_37513 ) ( not ( = ?auto_37512 ?auto_37514 ) ) ( not ( = ?auto_37512 ?auto_37519 ) ) ( not ( = ?auto_37513 ?auto_37511 ) ) ( CALIBRATION_TARGET ?auto_37516 ?auto_37519 ) ( POINTING ?auto_37515 ?auto_37518 ) ( not ( = ?auto_37519 ?auto_37518 ) ) ( not ( = ?auto_37514 ?auto_37518 ) ) ( not ( = ?auto_37512 ?auto_37518 ) ) ( ON_BOARD ?auto_37517 ?auto_37515 ) ( POWER_ON ?auto_37517 ) ( not ( = ?auto_37516 ?auto_37517 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_37514 ?auto_37511 )
      ( GET-2IMAGE-VERIFY ?auto_37512 ?auto_37513 ?auto_37514 ?auto_37511 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_37521 - DIRECTION
      ?auto_37522 - MODE
      ?auto_37523 - DIRECTION
      ?auto_37520 - MODE
    )
    :vars
    (
      ?auto_37525 - INSTRUMENT
      ?auto_37527 - SATELLITE
      ?auto_37524 - DIRECTION
      ?auto_37526 - DIRECTION
      ?auto_37529 - MODE
      ?auto_37528 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37525 ?auto_37527 ) ( SUPPORTS ?auto_37525 ?auto_37520 ) ( not ( = ?auto_37523 ?auto_37524 ) ) ( HAVE_IMAGE ?auto_37526 ?auto_37529 ) ( not ( = ?auto_37526 ?auto_37523 ) ) ( not ( = ?auto_37526 ?auto_37524 ) ) ( not ( = ?auto_37529 ?auto_37520 ) ) ( CALIBRATION_TARGET ?auto_37525 ?auto_37524 ) ( POINTING ?auto_37527 ?auto_37521 ) ( not ( = ?auto_37524 ?auto_37521 ) ) ( not ( = ?auto_37523 ?auto_37521 ) ) ( not ( = ?auto_37526 ?auto_37521 ) ) ( ON_BOARD ?auto_37528 ?auto_37527 ) ( POWER_ON ?auto_37528 ) ( not ( = ?auto_37525 ?auto_37528 ) ) ( HAVE_IMAGE ?auto_37521 ?auto_37522 ) ( not ( = ?auto_37522 ?auto_37520 ) ) ( not ( = ?auto_37522 ?auto_37529 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37526 ?auto_37529 ?auto_37523 ?auto_37520 )
      ( GET-2IMAGE-VERIFY ?auto_37521 ?auto_37522 ?auto_37523 ?auto_37520 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_37531 - DIRECTION
      ?auto_37532 - MODE
      ?auto_37533 - DIRECTION
      ?auto_37530 - MODE
    )
    :vars
    (
      ?auto_37535 - INSTRUMENT
      ?auto_37536 - SATELLITE
      ?auto_37534 - DIRECTION
      ?auto_37538 - DIRECTION
      ?auto_37537 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37535 ?auto_37536 ) ( SUPPORTS ?auto_37535 ?auto_37532 ) ( not ( = ?auto_37531 ?auto_37534 ) ) ( HAVE_IMAGE ?auto_37533 ?auto_37530 ) ( not ( = ?auto_37533 ?auto_37531 ) ) ( not ( = ?auto_37533 ?auto_37534 ) ) ( not ( = ?auto_37530 ?auto_37532 ) ) ( CALIBRATION_TARGET ?auto_37535 ?auto_37534 ) ( POINTING ?auto_37536 ?auto_37538 ) ( not ( = ?auto_37534 ?auto_37538 ) ) ( not ( = ?auto_37531 ?auto_37538 ) ) ( not ( = ?auto_37533 ?auto_37538 ) ) ( ON_BOARD ?auto_37537 ?auto_37536 ) ( POWER_ON ?auto_37537 ) ( not ( = ?auto_37535 ?auto_37537 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37533 ?auto_37530 ?auto_37531 ?auto_37532 )
      ( GET-2IMAGE-VERIFY ?auto_37531 ?auto_37532 ?auto_37533 ?auto_37530 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_37540 - DIRECTION
      ?auto_37541 - MODE
      ?auto_37542 - DIRECTION
      ?auto_37539 - MODE
    )
    :vars
    (
      ?auto_37544 - INSTRUMENT
      ?auto_37546 - SATELLITE
      ?auto_37543 - DIRECTION
      ?auto_37545 - DIRECTION
      ?auto_37548 - MODE
      ?auto_37547 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37544 ?auto_37546 ) ( SUPPORTS ?auto_37544 ?auto_37541 ) ( not ( = ?auto_37540 ?auto_37543 ) ) ( HAVE_IMAGE ?auto_37545 ?auto_37548 ) ( not ( = ?auto_37545 ?auto_37540 ) ) ( not ( = ?auto_37545 ?auto_37543 ) ) ( not ( = ?auto_37548 ?auto_37541 ) ) ( CALIBRATION_TARGET ?auto_37544 ?auto_37543 ) ( POINTING ?auto_37546 ?auto_37542 ) ( not ( = ?auto_37543 ?auto_37542 ) ) ( not ( = ?auto_37540 ?auto_37542 ) ) ( not ( = ?auto_37545 ?auto_37542 ) ) ( ON_BOARD ?auto_37547 ?auto_37546 ) ( POWER_ON ?auto_37547 ) ( not ( = ?auto_37544 ?auto_37547 ) ) ( HAVE_IMAGE ?auto_37542 ?auto_37539 ) ( not ( = ?auto_37541 ?auto_37539 ) ) ( not ( = ?auto_37539 ?auto_37548 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37545 ?auto_37548 ?auto_37540 ?auto_37541 )
      ( GET-2IMAGE-VERIFY ?auto_37540 ?auto_37541 ?auto_37542 ?auto_37539 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37561 - DIRECTION
      ?auto_37562 - MODE
      ?auto_37563 - DIRECTION
      ?auto_37560 - MODE
      ?auto_37564 - DIRECTION
      ?auto_37565 - MODE
    )
    :vars
    (
      ?auto_37567 - INSTRUMENT
      ?auto_37568 - SATELLITE
      ?auto_37566 - DIRECTION
      ?auto_37570 - DIRECTION
      ?auto_37569 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37567 ?auto_37568 ) ( SUPPORTS ?auto_37567 ?auto_37565 ) ( not ( = ?auto_37564 ?auto_37566 ) ) ( HAVE_IMAGE ?auto_37561 ?auto_37560 ) ( not ( = ?auto_37561 ?auto_37564 ) ) ( not ( = ?auto_37561 ?auto_37566 ) ) ( not ( = ?auto_37560 ?auto_37565 ) ) ( CALIBRATION_TARGET ?auto_37567 ?auto_37566 ) ( POINTING ?auto_37568 ?auto_37570 ) ( not ( = ?auto_37566 ?auto_37570 ) ) ( not ( = ?auto_37564 ?auto_37570 ) ) ( not ( = ?auto_37561 ?auto_37570 ) ) ( ON_BOARD ?auto_37569 ?auto_37568 ) ( POWER_ON ?auto_37569 ) ( not ( = ?auto_37567 ?auto_37569 ) ) ( HAVE_IMAGE ?auto_37561 ?auto_37562 ) ( HAVE_IMAGE ?auto_37563 ?auto_37560 ) ( not ( = ?auto_37561 ?auto_37563 ) ) ( not ( = ?auto_37562 ?auto_37560 ) ) ( not ( = ?auto_37562 ?auto_37565 ) ) ( not ( = ?auto_37563 ?auto_37564 ) ) ( not ( = ?auto_37563 ?auto_37566 ) ) ( not ( = ?auto_37563 ?auto_37570 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37561 ?auto_37560 ?auto_37564 ?auto_37565 )
      ( GET-3IMAGE-VERIFY ?auto_37561 ?auto_37562 ?auto_37563 ?auto_37560 ?auto_37564 ?auto_37565 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37572 - DIRECTION
      ?auto_37573 - MODE
      ?auto_37574 - DIRECTION
      ?auto_37571 - MODE
      ?auto_37575 - DIRECTION
      ?auto_37576 - MODE
    )
    :vars
    (
      ?auto_37578 - INSTRUMENT
      ?auto_37579 - SATELLITE
      ?auto_37577 - DIRECTION
      ?auto_37580 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37578 ?auto_37579 ) ( SUPPORTS ?auto_37578 ?auto_37576 ) ( not ( = ?auto_37575 ?auto_37577 ) ) ( HAVE_IMAGE ?auto_37572 ?auto_37573 ) ( not ( = ?auto_37572 ?auto_37575 ) ) ( not ( = ?auto_37572 ?auto_37577 ) ) ( not ( = ?auto_37573 ?auto_37576 ) ) ( CALIBRATION_TARGET ?auto_37578 ?auto_37577 ) ( POINTING ?auto_37579 ?auto_37574 ) ( not ( = ?auto_37577 ?auto_37574 ) ) ( not ( = ?auto_37575 ?auto_37574 ) ) ( not ( = ?auto_37572 ?auto_37574 ) ) ( ON_BOARD ?auto_37580 ?auto_37579 ) ( POWER_ON ?auto_37580 ) ( not ( = ?auto_37578 ?auto_37580 ) ) ( HAVE_IMAGE ?auto_37574 ?auto_37571 ) ( not ( = ?auto_37573 ?auto_37571 ) ) ( not ( = ?auto_37571 ?auto_37576 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37572 ?auto_37573 ?auto_37575 ?auto_37576 )
      ( GET-3IMAGE-VERIFY ?auto_37572 ?auto_37573 ?auto_37574 ?auto_37571 ?auto_37575 ?auto_37576 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37582 - DIRECTION
      ?auto_37583 - MODE
      ?auto_37584 - DIRECTION
      ?auto_37581 - MODE
      ?auto_37585 - DIRECTION
      ?auto_37586 - MODE
    )
    :vars
    (
      ?auto_37588 - INSTRUMENT
      ?auto_37589 - SATELLITE
      ?auto_37587 - DIRECTION
      ?auto_37591 - DIRECTION
      ?auto_37590 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37588 ?auto_37589 ) ( SUPPORTS ?auto_37588 ?auto_37581 ) ( not ( = ?auto_37584 ?auto_37587 ) ) ( HAVE_IMAGE ?auto_37585 ?auto_37586 ) ( not ( = ?auto_37585 ?auto_37584 ) ) ( not ( = ?auto_37585 ?auto_37587 ) ) ( not ( = ?auto_37586 ?auto_37581 ) ) ( CALIBRATION_TARGET ?auto_37588 ?auto_37587 ) ( POINTING ?auto_37589 ?auto_37591 ) ( not ( = ?auto_37587 ?auto_37591 ) ) ( not ( = ?auto_37584 ?auto_37591 ) ) ( not ( = ?auto_37585 ?auto_37591 ) ) ( ON_BOARD ?auto_37590 ?auto_37589 ) ( POWER_ON ?auto_37590 ) ( not ( = ?auto_37588 ?auto_37590 ) ) ( HAVE_IMAGE ?auto_37582 ?auto_37583 ) ( not ( = ?auto_37582 ?auto_37584 ) ) ( not ( = ?auto_37582 ?auto_37585 ) ) ( not ( = ?auto_37582 ?auto_37587 ) ) ( not ( = ?auto_37582 ?auto_37591 ) ) ( not ( = ?auto_37583 ?auto_37581 ) ) ( not ( = ?auto_37583 ?auto_37586 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37585 ?auto_37586 ?auto_37584 ?auto_37581 )
      ( GET-3IMAGE-VERIFY ?auto_37582 ?auto_37583 ?auto_37584 ?auto_37581 ?auto_37585 ?auto_37586 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37593 - DIRECTION
      ?auto_37594 - MODE
      ?auto_37595 - DIRECTION
      ?auto_37592 - MODE
      ?auto_37596 - DIRECTION
      ?auto_37597 - MODE
    )
    :vars
    (
      ?auto_37599 - INSTRUMENT
      ?auto_37600 - SATELLITE
      ?auto_37598 - DIRECTION
      ?auto_37601 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37599 ?auto_37600 ) ( SUPPORTS ?auto_37599 ?auto_37592 ) ( not ( = ?auto_37595 ?auto_37598 ) ) ( HAVE_IMAGE ?auto_37593 ?auto_37594 ) ( not ( = ?auto_37593 ?auto_37595 ) ) ( not ( = ?auto_37593 ?auto_37598 ) ) ( not ( = ?auto_37594 ?auto_37592 ) ) ( CALIBRATION_TARGET ?auto_37599 ?auto_37598 ) ( POINTING ?auto_37600 ?auto_37596 ) ( not ( = ?auto_37598 ?auto_37596 ) ) ( not ( = ?auto_37595 ?auto_37596 ) ) ( not ( = ?auto_37593 ?auto_37596 ) ) ( ON_BOARD ?auto_37601 ?auto_37600 ) ( POWER_ON ?auto_37601 ) ( not ( = ?auto_37599 ?auto_37601 ) ) ( HAVE_IMAGE ?auto_37596 ?auto_37597 ) ( not ( = ?auto_37594 ?auto_37597 ) ) ( not ( = ?auto_37592 ?auto_37597 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37593 ?auto_37594 ?auto_37595 ?auto_37592 )
      ( GET-3IMAGE-VERIFY ?auto_37593 ?auto_37594 ?auto_37595 ?auto_37592 ?auto_37596 ?auto_37597 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37614 - DIRECTION
      ?auto_37615 - MODE
      ?auto_37616 - DIRECTION
      ?auto_37613 - MODE
      ?auto_37617 - DIRECTION
      ?auto_37618 - MODE
    )
    :vars
    (
      ?auto_37620 - INSTRUMENT
      ?auto_37621 - SATELLITE
      ?auto_37619 - DIRECTION
      ?auto_37622 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37620 ?auto_37621 ) ( SUPPORTS ?auto_37620 ?auto_37618 ) ( not ( = ?auto_37617 ?auto_37619 ) ) ( HAVE_IMAGE ?auto_37616 ?auto_37613 ) ( not ( = ?auto_37616 ?auto_37617 ) ) ( not ( = ?auto_37616 ?auto_37619 ) ) ( not ( = ?auto_37613 ?auto_37618 ) ) ( CALIBRATION_TARGET ?auto_37620 ?auto_37619 ) ( POINTING ?auto_37621 ?auto_37614 ) ( not ( = ?auto_37619 ?auto_37614 ) ) ( not ( = ?auto_37617 ?auto_37614 ) ) ( not ( = ?auto_37616 ?auto_37614 ) ) ( ON_BOARD ?auto_37622 ?auto_37621 ) ( POWER_ON ?auto_37622 ) ( not ( = ?auto_37620 ?auto_37622 ) ) ( HAVE_IMAGE ?auto_37614 ?auto_37615 ) ( not ( = ?auto_37615 ?auto_37613 ) ) ( not ( = ?auto_37615 ?auto_37618 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37616 ?auto_37613 ?auto_37617 ?auto_37618 )
      ( GET-3IMAGE-VERIFY ?auto_37614 ?auto_37615 ?auto_37616 ?auto_37613 ?auto_37617 ?auto_37618 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37624 - DIRECTION
      ?auto_37625 - MODE
      ?auto_37626 - DIRECTION
      ?auto_37623 - MODE
      ?auto_37627 - DIRECTION
      ?auto_37628 - MODE
    )
    :vars
    (
      ?auto_37630 - INSTRUMENT
      ?auto_37632 - SATELLITE
      ?auto_37629 - DIRECTION
      ?auto_37631 - DIRECTION
      ?auto_37634 - MODE
      ?auto_37633 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37630 ?auto_37632 ) ( SUPPORTS ?auto_37630 ?auto_37628 ) ( not ( = ?auto_37627 ?auto_37629 ) ) ( HAVE_IMAGE ?auto_37631 ?auto_37634 ) ( not ( = ?auto_37631 ?auto_37627 ) ) ( not ( = ?auto_37631 ?auto_37629 ) ) ( not ( = ?auto_37634 ?auto_37628 ) ) ( CALIBRATION_TARGET ?auto_37630 ?auto_37629 ) ( POINTING ?auto_37632 ?auto_37626 ) ( not ( = ?auto_37629 ?auto_37626 ) ) ( not ( = ?auto_37627 ?auto_37626 ) ) ( not ( = ?auto_37631 ?auto_37626 ) ) ( ON_BOARD ?auto_37633 ?auto_37632 ) ( POWER_ON ?auto_37633 ) ( not ( = ?auto_37630 ?auto_37633 ) ) ( HAVE_IMAGE ?auto_37624 ?auto_37625 ) ( HAVE_IMAGE ?auto_37626 ?auto_37623 ) ( not ( = ?auto_37624 ?auto_37626 ) ) ( not ( = ?auto_37624 ?auto_37627 ) ) ( not ( = ?auto_37624 ?auto_37629 ) ) ( not ( = ?auto_37624 ?auto_37631 ) ) ( not ( = ?auto_37625 ?auto_37623 ) ) ( not ( = ?auto_37625 ?auto_37628 ) ) ( not ( = ?auto_37625 ?auto_37634 ) ) ( not ( = ?auto_37623 ?auto_37628 ) ) ( not ( = ?auto_37623 ?auto_37634 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37631 ?auto_37634 ?auto_37627 ?auto_37628 )
      ( GET-3IMAGE-VERIFY ?auto_37624 ?auto_37625 ?auto_37626 ?auto_37623 ?auto_37627 ?auto_37628 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37636 - DIRECTION
      ?auto_37637 - MODE
      ?auto_37638 - DIRECTION
      ?auto_37635 - MODE
      ?auto_37639 - DIRECTION
      ?auto_37640 - MODE
    )
    :vars
    (
      ?auto_37642 - INSTRUMENT
      ?auto_37643 - SATELLITE
      ?auto_37641 - DIRECTION
      ?auto_37644 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37642 ?auto_37643 ) ( SUPPORTS ?auto_37642 ?auto_37635 ) ( not ( = ?auto_37638 ?auto_37641 ) ) ( HAVE_IMAGE ?auto_37639 ?auto_37640 ) ( not ( = ?auto_37639 ?auto_37638 ) ) ( not ( = ?auto_37639 ?auto_37641 ) ) ( not ( = ?auto_37640 ?auto_37635 ) ) ( CALIBRATION_TARGET ?auto_37642 ?auto_37641 ) ( POINTING ?auto_37643 ?auto_37636 ) ( not ( = ?auto_37641 ?auto_37636 ) ) ( not ( = ?auto_37638 ?auto_37636 ) ) ( not ( = ?auto_37639 ?auto_37636 ) ) ( ON_BOARD ?auto_37644 ?auto_37643 ) ( POWER_ON ?auto_37644 ) ( not ( = ?auto_37642 ?auto_37644 ) ) ( HAVE_IMAGE ?auto_37636 ?auto_37637 ) ( not ( = ?auto_37637 ?auto_37635 ) ) ( not ( = ?auto_37637 ?auto_37640 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37639 ?auto_37640 ?auto_37638 ?auto_37635 )
      ( GET-3IMAGE-VERIFY ?auto_37636 ?auto_37637 ?auto_37638 ?auto_37635 ?auto_37639 ?auto_37640 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37646 - DIRECTION
      ?auto_37647 - MODE
      ?auto_37648 - DIRECTION
      ?auto_37645 - MODE
      ?auto_37649 - DIRECTION
      ?auto_37650 - MODE
    )
    :vars
    (
      ?auto_37652 - INSTRUMENT
      ?auto_37654 - SATELLITE
      ?auto_37651 - DIRECTION
      ?auto_37653 - DIRECTION
      ?auto_37656 - MODE
      ?auto_37655 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37652 ?auto_37654 ) ( SUPPORTS ?auto_37652 ?auto_37645 ) ( not ( = ?auto_37648 ?auto_37651 ) ) ( HAVE_IMAGE ?auto_37653 ?auto_37656 ) ( not ( = ?auto_37653 ?auto_37648 ) ) ( not ( = ?auto_37653 ?auto_37651 ) ) ( not ( = ?auto_37656 ?auto_37645 ) ) ( CALIBRATION_TARGET ?auto_37652 ?auto_37651 ) ( POINTING ?auto_37654 ?auto_37646 ) ( not ( = ?auto_37651 ?auto_37646 ) ) ( not ( = ?auto_37648 ?auto_37646 ) ) ( not ( = ?auto_37653 ?auto_37646 ) ) ( ON_BOARD ?auto_37655 ?auto_37654 ) ( POWER_ON ?auto_37655 ) ( not ( = ?auto_37652 ?auto_37655 ) ) ( HAVE_IMAGE ?auto_37646 ?auto_37647 ) ( HAVE_IMAGE ?auto_37649 ?auto_37650 ) ( not ( = ?auto_37646 ?auto_37649 ) ) ( not ( = ?auto_37647 ?auto_37645 ) ) ( not ( = ?auto_37647 ?auto_37650 ) ) ( not ( = ?auto_37647 ?auto_37656 ) ) ( not ( = ?auto_37648 ?auto_37649 ) ) ( not ( = ?auto_37645 ?auto_37650 ) ) ( not ( = ?auto_37649 ?auto_37651 ) ) ( not ( = ?auto_37649 ?auto_37653 ) ) ( not ( = ?auto_37650 ?auto_37656 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37653 ?auto_37656 ?auto_37648 ?auto_37645 )
      ( GET-3IMAGE-VERIFY ?auto_37646 ?auto_37647 ?auto_37648 ?auto_37645 ?auto_37649 ?auto_37650 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37670 - DIRECTION
      ?auto_37671 - MODE
      ?auto_37672 - DIRECTION
      ?auto_37669 - MODE
      ?auto_37673 - DIRECTION
      ?auto_37674 - MODE
    )
    :vars
    (
      ?auto_37676 - INSTRUMENT
      ?auto_37677 - SATELLITE
      ?auto_37675 - DIRECTION
      ?auto_37679 - DIRECTION
      ?auto_37678 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37676 ?auto_37677 ) ( SUPPORTS ?auto_37676 ?auto_37671 ) ( not ( = ?auto_37670 ?auto_37675 ) ) ( HAVE_IMAGE ?auto_37672 ?auto_37674 ) ( not ( = ?auto_37672 ?auto_37670 ) ) ( not ( = ?auto_37672 ?auto_37675 ) ) ( not ( = ?auto_37674 ?auto_37671 ) ) ( CALIBRATION_TARGET ?auto_37676 ?auto_37675 ) ( POINTING ?auto_37677 ?auto_37679 ) ( not ( = ?auto_37675 ?auto_37679 ) ) ( not ( = ?auto_37670 ?auto_37679 ) ) ( not ( = ?auto_37672 ?auto_37679 ) ) ( ON_BOARD ?auto_37678 ?auto_37677 ) ( POWER_ON ?auto_37678 ) ( not ( = ?auto_37676 ?auto_37678 ) ) ( HAVE_IMAGE ?auto_37672 ?auto_37669 ) ( HAVE_IMAGE ?auto_37673 ?auto_37674 ) ( not ( = ?auto_37670 ?auto_37673 ) ) ( not ( = ?auto_37671 ?auto_37669 ) ) ( not ( = ?auto_37672 ?auto_37673 ) ) ( not ( = ?auto_37669 ?auto_37674 ) ) ( not ( = ?auto_37673 ?auto_37675 ) ) ( not ( = ?auto_37673 ?auto_37679 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37672 ?auto_37674 ?auto_37670 ?auto_37671 )
      ( GET-3IMAGE-VERIFY ?auto_37670 ?auto_37671 ?auto_37672 ?auto_37669 ?auto_37673 ?auto_37674 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37681 - DIRECTION
      ?auto_37682 - MODE
      ?auto_37683 - DIRECTION
      ?auto_37680 - MODE
      ?auto_37684 - DIRECTION
      ?auto_37685 - MODE
    )
    :vars
    (
      ?auto_37687 - INSTRUMENT
      ?auto_37688 - SATELLITE
      ?auto_37686 - DIRECTION
      ?auto_37689 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37687 ?auto_37688 ) ( SUPPORTS ?auto_37687 ?auto_37682 ) ( not ( = ?auto_37681 ?auto_37686 ) ) ( HAVE_IMAGE ?auto_37683 ?auto_37680 ) ( not ( = ?auto_37683 ?auto_37681 ) ) ( not ( = ?auto_37683 ?auto_37686 ) ) ( not ( = ?auto_37680 ?auto_37682 ) ) ( CALIBRATION_TARGET ?auto_37687 ?auto_37686 ) ( POINTING ?auto_37688 ?auto_37684 ) ( not ( = ?auto_37686 ?auto_37684 ) ) ( not ( = ?auto_37681 ?auto_37684 ) ) ( not ( = ?auto_37683 ?auto_37684 ) ) ( ON_BOARD ?auto_37689 ?auto_37688 ) ( POWER_ON ?auto_37689 ) ( not ( = ?auto_37687 ?auto_37689 ) ) ( HAVE_IMAGE ?auto_37684 ?auto_37685 ) ( not ( = ?auto_37682 ?auto_37685 ) ) ( not ( = ?auto_37680 ?auto_37685 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37683 ?auto_37680 ?auto_37681 ?auto_37682 )
      ( GET-3IMAGE-VERIFY ?auto_37681 ?auto_37682 ?auto_37683 ?auto_37680 ?auto_37684 ?auto_37685 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37702 - DIRECTION
      ?auto_37703 - MODE
      ?auto_37704 - DIRECTION
      ?auto_37701 - MODE
      ?auto_37705 - DIRECTION
      ?auto_37706 - MODE
    )
    :vars
    (
      ?auto_37708 - INSTRUMENT
      ?auto_37709 - SATELLITE
      ?auto_37707 - DIRECTION
      ?auto_37710 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37708 ?auto_37709 ) ( SUPPORTS ?auto_37708 ?auto_37703 ) ( not ( = ?auto_37702 ?auto_37707 ) ) ( HAVE_IMAGE ?auto_37705 ?auto_37706 ) ( not ( = ?auto_37705 ?auto_37702 ) ) ( not ( = ?auto_37705 ?auto_37707 ) ) ( not ( = ?auto_37706 ?auto_37703 ) ) ( CALIBRATION_TARGET ?auto_37708 ?auto_37707 ) ( POINTING ?auto_37709 ?auto_37704 ) ( not ( = ?auto_37707 ?auto_37704 ) ) ( not ( = ?auto_37702 ?auto_37704 ) ) ( not ( = ?auto_37705 ?auto_37704 ) ) ( ON_BOARD ?auto_37710 ?auto_37709 ) ( POWER_ON ?auto_37710 ) ( not ( = ?auto_37708 ?auto_37710 ) ) ( HAVE_IMAGE ?auto_37704 ?auto_37701 ) ( not ( = ?auto_37703 ?auto_37701 ) ) ( not ( = ?auto_37701 ?auto_37706 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37705 ?auto_37706 ?auto_37702 ?auto_37703 )
      ( GET-3IMAGE-VERIFY ?auto_37702 ?auto_37703 ?auto_37704 ?auto_37701 ?auto_37705 ?auto_37706 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37712 - DIRECTION
      ?auto_37713 - MODE
      ?auto_37714 - DIRECTION
      ?auto_37711 - MODE
      ?auto_37715 - DIRECTION
      ?auto_37716 - MODE
    )
    :vars
    (
      ?auto_37718 - INSTRUMENT
      ?auto_37720 - SATELLITE
      ?auto_37717 - DIRECTION
      ?auto_37719 - DIRECTION
      ?auto_37722 - MODE
      ?auto_37721 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37718 ?auto_37720 ) ( SUPPORTS ?auto_37718 ?auto_37713 ) ( not ( = ?auto_37712 ?auto_37717 ) ) ( HAVE_IMAGE ?auto_37719 ?auto_37722 ) ( not ( = ?auto_37719 ?auto_37712 ) ) ( not ( = ?auto_37719 ?auto_37717 ) ) ( not ( = ?auto_37722 ?auto_37713 ) ) ( CALIBRATION_TARGET ?auto_37718 ?auto_37717 ) ( POINTING ?auto_37720 ?auto_37715 ) ( not ( = ?auto_37717 ?auto_37715 ) ) ( not ( = ?auto_37712 ?auto_37715 ) ) ( not ( = ?auto_37719 ?auto_37715 ) ) ( ON_BOARD ?auto_37721 ?auto_37720 ) ( POWER_ON ?auto_37721 ) ( not ( = ?auto_37718 ?auto_37721 ) ) ( HAVE_IMAGE ?auto_37714 ?auto_37711 ) ( HAVE_IMAGE ?auto_37715 ?auto_37716 ) ( not ( = ?auto_37712 ?auto_37714 ) ) ( not ( = ?auto_37713 ?auto_37711 ) ) ( not ( = ?auto_37713 ?auto_37716 ) ) ( not ( = ?auto_37714 ?auto_37715 ) ) ( not ( = ?auto_37714 ?auto_37717 ) ) ( not ( = ?auto_37714 ?auto_37719 ) ) ( not ( = ?auto_37711 ?auto_37716 ) ) ( not ( = ?auto_37711 ?auto_37722 ) ) ( not ( = ?auto_37716 ?auto_37722 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37719 ?auto_37722 ?auto_37712 ?auto_37713 )
      ( GET-3IMAGE-VERIFY ?auto_37712 ?auto_37713 ?auto_37714 ?auto_37711 ?auto_37715 ?auto_37716 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37772 - DIRECTION
      ?auto_37773 - MODE
      ?auto_37774 - DIRECTION
      ?auto_37771 - MODE
      ?auto_37775 - DIRECTION
      ?auto_37776 - MODE
      ?auto_37777 - DIRECTION
      ?auto_37778 - MODE
    )
    :vars
    (
      ?auto_37780 - INSTRUMENT
      ?auto_37781 - SATELLITE
      ?auto_37779 - DIRECTION
      ?auto_37783 - DIRECTION
      ?auto_37782 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37780 ?auto_37781 ) ( SUPPORTS ?auto_37780 ?auto_37778 ) ( not ( = ?auto_37777 ?auto_37779 ) ) ( HAVE_IMAGE ?auto_37772 ?auto_37773 ) ( not ( = ?auto_37772 ?auto_37777 ) ) ( not ( = ?auto_37772 ?auto_37779 ) ) ( not ( = ?auto_37773 ?auto_37778 ) ) ( CALIBRATION_TARGET ?auto_37780 ?auto_37779 ) ( POINTING ?auto_37781 ?auto_37783 ) ( not ( = ?auto_37779 ?auto_37783 ) ) ( not ( = ?auto_37777 ?auto_37783 ) ) ( not ( = ?auto_37772 ?auto_37783 ) ) ( ON_BOARD ?auto_37782 ?auto_37781 ) ( POWER_ON ?auto_37782 ) ( not ( = ?auto_37780 ?auto_37782 ) ) ( HAVE_IMAGE ?auto_37774 ?auto_37771 ) ( HAVE_IMAGE ?auto_37775 ?auto_37776 ) ( not ( = ?auto_37772 ?auto_37774 ) ) ( not ( = ?auto_37772 ?auto_37775 ) ) ( not ( = ?auto_37773 ?auto_37771 ) ) ( not ( = ?auto_37773 ?auto_37776 ) ) ( not ( = ?auto_37774 ?auto_37775 ) ) ( not ( = ?auto_37774 ?auto_37777 ) ) ( not ( = ?auto_37774 ?auto_37779 ) ) ( not ( = ?auto_37774 ?auto_37783 ) ) ( not ( = ?auto_37771 ?auto_37776 ) ) ( not ( = ?auto_37771 ?auto_37778 ) ) ( not ( = ?auto_37775 ?auto_37777 ) ) ( not ( = ?auto_37775 ?auto_37779 ) ) ( not ( = ?auto_37775 ?auto_37783 ) ) ( not ( = ?auto_37776 ?auto_37778 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37772 ?auto_37773 ?auto_37777 ?auto_37778 )
      ( GET-4IMAGE-VERIFY ?auto_37772 ?auto_37773 ?auto_37774 ?auto_37771 ?auto_37775 ?auto_37776 ?auto_37777 ?auto_37778 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37785 - DIRECTION
      ?auto_37786 - MODE
      ?auto_37787 - DIRECTION
      ?auto_37784 - MODE
      ?auto_37788 - DIRECTION
      ?auto_37789 - MODE
      ?auto_37790 - DIRECTION
      ?auto_37791 - MODE
    )
    :vars
    (
      ?auto_37793 - INSTRUMENT
      ?auto_37794 - SATELLITE
      ?auto_37792 - DIRECTION
      ?auto_37795 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37793 ?auto_37794 ) ( SUPPORTS ?auto_37793 ?auto_37791 ) ( not ( = ?auto_37790 ?auto_37792 ) ) ( HAVE_IMAGE ?auto_37787 ?auto_37786 ) ( not ( = ?auto_37787 ?auto_37790 ) ) ( not ( = ?auto_37787 ?auto_37792 ) ) ( not ( = ?auto_37786 ?auto_37791 ) ) ( CALIBRATION_TARGET ?auto_37793 ?auto_37792 ) ( POINTING ?auto_37794 ?auto_37788 ) ( not ( = ?auto_37792 ?auto_37788 ) ) ( not ( = ?auto_37790 ?auto_37788 ) ) ( not ( = ?auto_37787 ?auto_37788 ) ) ( ON_BOARD ?auto_37795 ?auto_37794 ) ( POWER_ON ?auto_37795 ) ( not ( = ?auto_37793 ?auto_37795 ) ) ( HAVE_IMAGE ?auto_37785 ?auto_37786 ) ( HAVE_IMAGE ?auto_37787 ?auto_37784 ) ( HAVE_IMAGE ?auto_37788 ?auto_37789 ) ( not ( = ?auto_37785 ?auto_37787 ) ) ( not ( = ?auto_37785 ?auto_37788 ) ) ( not ( = ?auto_37785 ?auto_37790 ) ) ( not ( = ?auto_37785 ?auto_37792 ) ) ( not ( = ?auto_37786 ?auto_37784 ) ) ( not ( = ?auto_37786 ?auto_37789 ) ) ( not ( = ?auto_37784 ?auto_37789 ) ) ( not ( = ?auto_37784 ?auto_37791 ) ) ( not ( = ?auto_37789 ?auto_37791 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37787 ?auto_37786 ?auto_37790 ?auto_37791 )
      ( GET-4IMAGE-VERIFY ?auto_37785 ?auto_37786 ?auto_37787 ?auto_37784 ?auto_37788 ?auto_37789 ?auto_37790 ?auto_37791 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37797 - DIRECTION
      ?auto_37798 - MODE
      ?auto_37799 - DIRECTION
      ?auto_37796 - MODE
      ?auto_37800 - DIRECTION
      ?auto_37801 - MODE
      ?auto_37802 - DIRECTION
      ?auto_37803 - MODE
    )
    :vars
    (
      ?auto_37805 - INSTRUMENT
      ?auto_37806 - SATELLITE
      ?auto_37804 - DIRECTION
      ?auto_37808 - DIRECTION
      ?auto_37807 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37805 ?auto_37806 ) ( SUPPORTS ?auto_37805 ?auto_37801 ) ( not ( = ?auto_37800 ?auto_37804 ) ) ( HAVE_IMAGE ?auto_37799 ?auto_37803 ) ( not ( = ?auto_37799 ?auto_37800 ) ) ( not ( = ?auto_37799 ?auto_37804 ) ) ( not ( = ?auto_37803 ?auto_37801 ) ) ( CALIBRATION_TARGET ?auto_37805 ?auto_37804 ) ( POINTING ?auto_37806 ?auto_37808 ) ( not ( = ?auto_37804 ?auto_37808 ) ) ( not ( = ?auto_37800 ?auto_37808 ) ) ( not ( = ?auto_37799 ?auto_37808 ) ) ( ON_BOARD ?auto_37807 ?auto_37806 ) ( POWER_ON ?auto_37807 ) ( not ( = ?auto_37805 ?auto_37807 ) ) ( HAVE_IMAGE ?auto_37797 ?auto_37798 ) ( HAVE_IMAGE ?auto_37799 ?auto_37796 ) ( HAVE_IMAGE ?auto_37802 ?auto_37803 ) ( not ( = ?auto_37797 ?auto_37799 ) ) ( not ( = ?auto_37797 ?auto_37800 ) ) ( not ( = ?auto_37797 ?auto_37802 ) ) ( not ( = ?auto_37797 ?auto_37804 ) ) ( not ( = ?auto_37797 ?auto_37808 ) ) ( not ( = ?auto_37798 ?auto_37796 ) ) ( not ( = ?auto_37798 ?auto_37801 ) ) ( not ( = ?auto_37798 ?auto_37803 ) ) ( not ( = ?auto_37799 ?auto_37802 ) ) ( not ( = ?auto_37796 ?auto_37801 ) ) ( not ( = ?auto_37796 ?auto_37803 ) ) ( not ( = ?auto_37800 ?auto_37802 ) ) ( not ( = ?auto_37802 ?auto_37804 ) ) ( not ( = ?auto_37802 ?auto_37808 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37799 ?auto_37803 ?auto_37800 ?auto_37801 )
      ( GET-4IMAGE-VERIFY ?auto_37797 ?auto_37798 ?auto_37799 ?auto_37796 ?auto_37800 ?auto_37801 ?auto_37802 ?auto_37803 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37810 - DIRECTION
      ?auto_37811 - MODE
      ?auto_37812 - DIRECTION
      ?auto_37809 - MODE
      ?auto_37813 - DIRECTION
      ?auto_37814 - MODE
      ?auto_37815 - DIRECTION
      ?auto_37816 - MODE
    )
    :vars
    (
      ?auto_37818 - INSTRUMENT
      ?auto_37819 - SATELLITE
      ?auto_37817 - DIRECTION
      ?auto_37820 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37818 ?auto_37819 ) ( SUPPORTS ?auto_37818 ?auto_37814 ) ( not ( = ?auto_37813 ?auto_37817 ) ) ( HAVE_IMAGE ?auto_37812 ?auto_37811 ) ( not ( = ?auto_37812 ?auto_37813 ) ) ( not ( = ?auto_37812 ?auto_37817 ) ) ( not ( = ?auto_37811 ?auto_37814 ) ) ( CALIBRATION_TARGET ?auto_37818 ?auto_37817 ) ( POINTING ?auto_37819 ?auto_37815 ) ( not ( = ?auto_37817 ?auto_37815 ) ) ( not ( = ?auto_37813 ?auto_37815 ) ) ( not ( = ?auto_37812 ?auto_37815 ) ) ( ON_BOARD ?auto_37820 ?auto_37819 ) ( POWER_ON ?auto_37820 ) ( not ( = ?auto_37818 ?auto_37820 ) ) ( HAVE_IMAGE ?auto_37810 ?auto_37811 ) ( HAVE_IMAGE ?auto_37812 ?auto_37809 ) ( HAVE_IMAGE ?auto_37815 ?auto_37816 ) ( not ( = ?auto_37810 ?auto_37812 ) ) ( not ( = ?auto_37810 ?auto_37813 ) ) ( not ( = ?auto_37810 ?auto_37815 ) ) ( not ( = ?auto_37810 ?auto_37817 ) ) ( not ( = ?auto_37811 ?auto_37809 ) ) ( not ( = ?auto_37811 ?auto_37816 ) ) ( not ( = ?auto_37809 ?auto_37814 ) ) ( not ( = ?auto_37809 ?auto_37816 ) ) ( not ( = ?auto_37814 ?auto_37816 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37812 ?auto_37811 ?auto_37813 ?auto_37814 )
      ( GET-4IMAGE-VERIFY ?auto_37810 ?auto_37811 ?auto_37812 ?auto_37809 ?auto_37813 ?auto_37814 ?auto_37815 ?auto_37816 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37835 - DIRECTION
      ?auto_37836 - MODE
      ?auto_37837 - DIRECTION
      ?auto_37834 - MODE
      ?auto_37838 - DIRECTION
      ?auto_37839 - MODE
      ?auto_37840 - DIRECTION
      ?auto_37841 - MODE
    )
    :vars
    (
      ?auto_37843 - INSTRUMENT
      ?auto_37844 - SATELLITE
      ?auto_37842 - DIRECTION
      ?auto_37845 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37843 ?auto_37844 ) ( SUPPORTS ?auto_37843 ?auto_37841 ) ( not ( = ?auto_37840 ?auto_37842 ) ) ( HAVE_IMAGE ?auto_37838 ?auto_37839 ) ( not ( = ?auto_37838 ?auto_37840 ) ) ( not ( = ?auto_37838 ?auto_37842 ) ) ( not ( = ?auto_37839 ?auto_37841 ) ) ( CALIBRATION_TARGET ?auto_37843 ?auto_37842 ) ( POINTING ?auto_37844 ?auto_37837 ) ( not ( = ?auto_37842 ?auto_37837 ) ) ( not ( = ?auto_37840 ?auto_37837 ) ) ( not ( = ?auto_37838 ?auto_37837 ) ) ( ON_BOARD ?auto_37845 ?auto_37844 ) ( POWER_ON ?auto_37845 ) ( not ( = ?auto_37843 ?auto_37845 ) ) ( HAVE_IMAGE ?auto_37835 ?auto_37836 ) ( HAVE_IMAGE ?auto_37837 ?auto_37834 ) ( not ( = ?auto_37835 ?auto_37837 ) ) ( not ( = ?auto_37835 ?auto_37838 ) ) ( not ( = ?auto_37835 ?auto_37840 ) ) ( not ( = ?auto_37835 ?auto_37842 ) ) ( not ( = ?auto_37836 ?auto_37834 ) ) ( not ( = ?auto_37836 ?auto_37839 ) ) ( not ( = ?auto_37836 ?auto_37841 ) ) ( not ( = ?auto_37834 ?auto_37839 ) ) ( not ( = ?auto_37834 ?auto_37841 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37838 ?auto_37839 ?auto_37840 ?auto_37841 )
      ( GET-4IMAGE-VERIFY ?auto_37835 ?auto_37836 ?auto_37837 ?auto_37834 ?auto_37838 ?auto_37839 ?auto_37840 ?auto_37841 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37847 - DIRECTION
      ?auto_37848 - MODE
      ?auto_37849 - DIRECTION
      ?auto_37846 - MODE
      ?auto_37850 - DIRECTION
      ?auto_37851 - MODE
      ?auto_37852 - DIRECTION
      ?auto_37853 - MODE
    )
    :vars
    (
      ?auto_37855 - INSTRUMENT
      ?auto_37856 - SATELLITE
      ?auto_37854 - DIRECTION
      ?auto_37857 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37855 ?auto_37856 ) ( SUPPORTS ?auto_37855 ?auto_37853 ) ( not ( = ?auto_37852 ?auto_37854 ) ) ( HAVE_IMAGE ?auto_37847 ?auto_37848 ) ( not ( = ?auto_37847 ?auto_37852 ) ) ( not ( = ?auto_37847 ?auto_37854 ) ) ( not ( = ?auto_37848 ?auto_37853 ) ) ( CALIBRATION_TARGET ?auto_37855 ?auto_37854 ) ( POINTING ?auto_37856 ?auto_37850 ) ( not ( = ?auto_37854 ?auto_37850 ) ) ( not ( = ?auto_37852 ?auto_37850 ) ) ( not ( = ?auto_37847 ?auto_37850 ) ) ( ON_BOARD ?auto_37857 ?auto_37856 ) ( POWER_ON ?auto_37857 ) ( not ( = ?auto_37855 ?auto_37857 ) ) ( HAVE_IMAGE ?auto_37849 ?auto_37846 ) ( HAVE_IMAGE ?auto_37850 ?auto_37851 ) ( not ( = ?auto_37847 ?auto_37849 ) ) ( not ( = ?auto_37848 ?auto_37846 ) ) ( not ( = ?auto_37848 ?auto_37851 ) ) ( not ( = ?auto_37849 ?auto_37850 ) ) ( not ( = ?auto_37849 ?auto_37852 ) ) ( not ( = ?auto_37849 ?auto_37854 ) ) ( not ( = ?auto_37846 ?auto_37851 ) ) ( not ( = ?auto_37846 ?auto_37853 ) ) ( not ( = ?auto_37851 ?auto_37853 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37847 ?auto_37848 ?auto_37852 ?auto_37853 )
      ( GET-4IMAGE-VERIFY ?auto_37847 ?auto_37848 ?auto_37849 ?auto_37846 ?auto_37850 ?auto_37851 ?auto_37852 ?auto_37853 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37859 - DIRECTION
      ?auto_37860 - MODE
      ?auto_37861 - DIRECTION
      ?auto_37858 - MODE
      ?auto_37862 - DIRECTION
      ?auto_37863 - MODE
      ?auto_37864 - DIRECTION
      ?auto_37865 - MODE
    )
    :vars
    (
      ?auto_37867 - INSTRUMENT
      ?auto_37868 - SATELLITE
      ?auto_37866 - DIRECTION
      ?auto_37869 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37867 ?auto_37868 ) ( SUPPORTS ?auto_37867 ?auto_37863 ) ( not ( = ?auto_37862 ?auto_37866 ) ) ( HAVE_IMAGE ?auto_37859 ?auto_37865 ) ( not ( = ?auto_37859 ?auto_37862 ) ) ( not ( = ?auto_37859 ?auto_37866 ) ) ( not ( = ?auto_37865 ?auto_37863 ) ) ( CALIBRATION_TARGET ?auto_37867 ?auto_37866 ) ( POINTING ?auto_37868 ?auto_37861 ) ( not ( = ?auto_37866 ?auto_37861 ) ) ( not ( = ?auto_37862 ?auto_37861 ) ) ( not ( = ?auto_37859 ?auto_37861 ) ) ( ON_BOARD ?auto_37869 ?auto_37868 ) ( POWER_ON ?auto_37869 ) ( not ( = ?auto_37867 ?auto_37869 ) ) ( HAVE_IMAGE ?auto_37859 ?auto_37860 ) ( HAVE_IMAGE ?auto_37861 ?auto_37858 ) ( HAVE_IMAGE ?auto_37864 ?auto_37865 ) ( not ( = ?auto_37859 ?auto_37864 ) ) ( not ( = ?auto_37860 ?auto_37858 ) ) ( not ( = ?auto_37860 ?auto_37863 ) ) ( not ( = ?auto_37860 ?auto_37865 ) ) ( not ( = ?auto_37861 ?auto_37864 ) ) ( not ( = ?auto_37858 ?auto_37863 ) ) ( not ( = ?auto_37858 ?auto_37865 ) ) ( not ( = ?auto_37862 ?auto_37864 ) ) ( not ( = ?auto_37864 ?auto_37866 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37859 ?auto_37865 ?auto_37862 ?auto_37863 )
      ( GET-4IMAGE-VERIFY ?auto_37859 ?auto_37860 ?auto_37861 ?auto_37858 ?auto_37862 ?auto_37863 ?auto_37864 ?auto_37865 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37871 - DIRECTION
      ?auto_37872 - MODE
      ?auto_37873 - DIRECTION
      ?auto_37870 - MODE
      ?auto_37874 - DIRECTION
      ?auto_37875 - MODE
      ?auto_37876 - DIRECTION
      ?auto_37877 - MODE
    )
    :vars
    (
      ?auto_37879 - INSTRUMENT
      ?auto_37880 - SATELLITE
      ?auto_37878 - DIRECTION
      ?auto_37881 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37879 ?auto_37880 ) ( SUPPORTS ?auto_37879 ?auto_37875 ) ( not ( = ?auto_37874 ?auto_37878 ) ) ( HAVE_IMAGE ?auto_37871 ?auto_37872 ) ( not ( = ?auto_37871 ?auto_37874 ) ) ( not ( = ?auto_37871 ?auto_37878 ) ) ( not ( = ?auto_37872 ?auto_37875 ) ) ( CALIBRATION_TARGET ?auto_37879 ?auto_37878 ) ( POINTING ?auto_37880 ?auto_37873 ) ( not ( = ?auto_37878 ?auto_37873 ) ) ( not ( = ?auto_37874 ?auto_37873 ) ) ( not ( = ?auto_37871 ?auto_37873 ) ) ( ON_BOARD ?auto_37881 ?auto_37880 ) ( POWER_ON ?auto_37881 ) ( not ( = ?auto_37879 ?auto_37881 ) ) ( HAVE_IMAGE ?auto_37873 ?auto_37870 ) ( HAVE_IMAGE ?auto_37876 ?auto_37877 ) ( not ( = ?auto_37871 ?auto_37876 ) ) ( not ( = ?auto_37872 ?auto_37870 ) ) ( not ( = ?auto_37872 ?auto_37877 ) ) ( not ( = ?auto_37873 ?auto_37876 ) ) ( not ( = ?auto_37870 ?auto_37875 ) ) ( not ( = ?auto_37870 ?auto_37877 ) ) ( not ( = ?auto_37874 ?auto_37876 ) ) ( not ( = ?auto_37875 ?auto_37877 ) ) ( not ( = ?auto_37876 ?auto_37878 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37871 ?auto_37872 ?auto_37874 ?auto_37875 )
      ( GET-4IMAGE-VERIFY ?auto_37871 ?auto_37872 ?auto_37873 ?auto_37870 ?auto_37874 ?auto_37875 ?auto_37876 ?auto_37877 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37895 - DIRECTION
      ?auto_37896 - MODE
      ?auto_37897 - DIRECTION
      ?auto_37894 - MODE
      ?auto_37898 - DIRECTION
      ?auto_37899 - MODE
      ?auto_37900 - DIRECTION
      ?auto_37901 - MODE
    )
    :vars
    (
      ?auto_37903 - INSTRUMENT
      ?auto_37904 - SATELLITE
      ?auto_37902 - DIRECTION
      ?auto_37906 - DIRECTION
      ?auto_37905 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37903 ?auto_37904 ) ( SUPPORTS ?auto_37903 ?auto_37894 ) ( not ( = ?auto_37897 ?auto_37902 ) ) ( HAVE_IMAGE ?auto_37895 ?auto_37901 ) ( not ( = ?auto_37895 ?auto_37897 ) ) ( not ( = ?auto_37895 ?auto_37902 ) ) ( not ( = ?auto_37901 ?auto_37894 ) ) ( CALIBRATION_TARGET ?auto_37903 ?auto_37902 ) ( POINTING ?auto_37904 ?auto_37906 ) ( not ( = ?auto_37902 ?auto_37906 ) ) ( not ( = ?auto_37897 ?auto_37906 ) ) ( not ( = ?auto_37895 ?auto_37906 ) ) ( ON_BOARD ?auto_37905 ?auto_37904 ) ( POWER_ON ?auto_37905 ) ( not ( = ?auto_37903 ?auto_37905 ) ) ( HAVE_IMAGE ?auto_37895 ?auto_37896 ) ( HAVE_IMAGE ?auto_37898 ?auto_37899 ) ( HAVE_IMAGE ?auto_37900 ?auto_37901 ) ( not ( = ?auto_37895 ?auto_37898 ) ) ( not ( = ?auto_37895 ?auto_37900 ) ) ( not ( = ?auto_37896 ?auto_37894 ) ) ( not ( = ?auto_37896 ?auto_37899 ) ) ( not ( = ?auto_37896 ?auto_37901 ) ) ( not ( = ?auto_37897 ?auto_37898 ) ) ( not ( = ?auto_37897 ?auto_37900 ) ) ( not ( = ?auto_37894 ?auto_37899 ) ) ( not ( = ?auto_37898 ?auto_37900 ) ) ( not ( = ?auto_37898 ?auto_37902 ) ) ( not ( = ?auto_37898 ?auto_37906 ) ) ( not ( = ?auto_37899 ?auto_37901 ) ) ( not ( = ?auto_37900 ?auto_37902 ) ) ( not ( = ?auto_37900 ?auto_37906 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37895 ?auto_37901 ?auto_37897 ?auto_37894 )
      ( GET-4IMAGE-VERIFY ?auto_37895 ?auto_37896 ?auto_37897 ?auto_37894 ?auto_37898 ?auto_37899 ?auto_37900 ?auto_37901 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37908 - DIRECTION
      ?auto_37909 - MODE
      ?auto_37910 - DIRECTION
      ?auto_37907 - MODE
      ?auto_37911 - DIRECTION
      ?auto_37912 - MODE
      ?auto_37913 - DIRECTION
      ?auto_37914 - MODE
    )
    :vars
    (
      ?auto_37916 - INSTRUMENT
      ?auto_37917 - SATELLITE
      ?auto_37915 - DIRECTION
      ?auto_37918 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37916 ?auto_37917 ) ( SUPPORTS ?auto_37916 ?auto_37907 ) ( not ( = ?auto_37910 ?auto_37915 ) ) ( HAVE_IMAGE ?auto_37911 ?auto_37912 ) ( not ( = ?auto_37911 ?auto_37910 ) ) ( not ( = ?auto_37911 ?auto_37915 ) ) ( not ( = ?auto_37912 ?auto_37907 ) ) ( CALIBRATION_TARGET ?auto_37916 ?auto_37915 ) ( POINTING ?auto_37917 ?auto_37913 ) ( not ( = ?auto_37915 ?auto_37913 ) ) ( not ( = ?auto_37910 ?auto_37913 ) ) ( not ( = ?auto_37911 ?auto_37913 ) ) ( ON_BOARD ?auto_37918 ?auto_37917 ) ( POWER_ON ?auto_37918 ) ( not ( = ?auto_37916 ?auto_37918 ) ) ( HAVE_IMAGE ?auto_37908 ?auto_37909 ) ( HAVE_IMAGE ?auto_37913 ?auto_37914 ) ( not ( = ?auto_37908 ?auto_37910 ) ) ( not ( = ?auto_37908 ?auto_37911 ) ) ( not ( = ?auto_37908 ?auto_37913 ) ) ( not ( = ?auto_37908 ?auto_37915 ) ) ( not ( = ?auto_37909 ?auto_37907 ) ) ( not ( = ?auto_37909 ?auto_37912 ) ) ( not ( = ?auto_37909 ?auto_37914 ) ) ( not ( = ?auto_37907 ?auto_37914 ) ) ( not ( = ?auto_37912 ?auto_37914 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37911 ?auto_37912 ?auto_37910 ?auto_37907 )
      ( GET-4IMAGE-VERIFY ?auto_37908 ?auto_37909 ?auto_37910 ?auto_37907 ?auto_37911 ?auto_37912 ?auto_37913 ?auto_37914 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37933 - DIRECTION
      ?auto_37934 - MODE
      ?auto_37935 - DIRECTION
      ?auto_37932 - MODE
      ?auto_37936 - DIRECTION
      ?auto_37937 - MODE
      ?auto_37938 - DIRECTION
      ?auto_37939 - MODE
    )
    :vars
    (
      ?auto_37941 - INSTRUMENT
      ?auto_37942 - SATELLITE
      ?auto_37940 - DIRECTION
      ?auto_37943 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37941 ?auto_37942 ) ( SUPPORTS ?auto_37941 ?auto_37932 ) ( not ( = ?auto_37935 ?auto_37940 ) ) ( HAVE_IMAGE ?auto_37933 ?auto_37939 ) ( not ( = ?auto_37933 ?auto_37935 ) ) ( not ( = ?auto_37933 ?auto_37940 ) ) ( not ( = ?auto_37939 ?auto_37932 ) ) ( CALIBRATION_TARGET ?auto_37941 ?auto_37940 ) ( POINTING ?auto_37942 ?auto_37936 ) ( not ( = ?auto_37940 ?auto_37936 ) ) ( not ( = ?auto_37935 ?auto_37936 ) ) ( not ( = ?auto_37933 ?auto_37936 ) ) ( ON_BOARD ?auto_37943 ?auto_37942 ) ( POWER_ON ?auto_37943 ) ( not ( = ?auto_37941 ?auto_37943 ) ) ( HAVE_IMAGE ?auto_37933 ?auto_37934 ) ( HAVE_IMAGE ?auto_37936 ?auto_37937 ) ( HAVE_IMAGE ?auto_37938 ?auto_37939 ) ( not ( = ?auto_37933 ?auto_37938 ) ) ( not ( = ?auto_37934 ?auto_37932 ) ) ( not ( = ?auto_37934 ?auto_37937 ) ) ( not ( = ?auto_37934 ?auto_37939 ) ) ( not ( = ?auto_37935 ?auto_37938 ) ) ( not ( = ?auto_37932 ?auto_37937 ) ) ( not ( = ?auto_37936 ?auto_37938 ) ) ( not ( = ?auto_37937 ?auto_37939 ) ) ( not ( = ?auto_37938 ?auto_37940 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37933 ?auto_37939 ?auto_37935 ?auto_37932 )
      ( GET-4IMAGE-VERIFY ?auto_37933 ?auto_37934 ?auto_37935 ?auto_37932 ?auto_37936 ?auto_37937 ?auto_37938 ?auto_37939 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_37945 - DIRECTION
      ?auto_37946 - MODE
      ?auto_37947 - DIRECTION
      ?auto_37944 - MODE
      ?auto_37948 - DIRECTION
      ?auto_37949 - MODE
      ?auto_37950 - DIRECTION
      ?auto_37951 - MODE
    )
    :vars
    (
      ?auto_37953 - INSTRUMENT
      ?auto_37954 - SATELLITE
      ?auto_37952 - DIRECTION
      ?auto_37955 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_37953 ?auto_37954 ) ( SUPPORTS ?auto_37953 ?auto_37944 ) ( not ( = ?auto_37947 ?auto_37952 ) ) ( HAVE_IMAGE ?auto_37945 ?auto_37946 ) ( not ( = ?auto_37945 ?auto_37947 ) ) ( not ( = ?auto_37945 ?auto_37952 ) ) ( not ( = ?auto_37946 ?auto_37944 ) ) ( CALIBRATION_TARGET ?auto_37953 ?auto_37952 ) ( POINTING ?auto_37954 ?auto_37948 ) ( not ( = ?auto_37952 ?auto_37948 ) ) ( not ( = ?auto_37947 ?auto_37948 ) ) ( not ( = ?auto_37945 ?auto_37948 ) ) ( ON_BOARD ?auto_37955 ?auto_37954 ) ( POWER_ON ?auto_37955 ) ( not ( = ?auto_37953 ?auto_37955 ) ) ( HAVE_IMAGE ?auto_37948 ?auto_37949 ) ( HAVE_IMAGE ?auto_37950 ?auto_37951 ) ( not ( = ?auto_37945 ?auto_37950 ) ) ( not ( = ?auto_37946 ?auto_37949 ) ) ( not ( = ?auto_37946 ?auto_37951 ) ) ( not ( = ?auto_37947 ?auto_37950 ) ) ( not ( = ?auto_37944 ?auto_37949 ) ) ( not ( = ?auto_37944 ?auto_37951 ) ) ( not ( = ?auto_37948 ?auto_37950 ) ) ( not ( = ?auto_37949 ?auto_37951 ) ) ( not ( = ?auto_37950 ?auto_37952 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37945 ?auto_37946 ?auto_37947 ?auto_37944 )
      ( GET-4IMAGE-VERIFY ?auto_37945 ?auto_37946 ?auto_37947 ?auto_37944 ?auto_37948 ?auto_37949 ?auto_37950 ?auto_37951 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38007 - DIRECTION
      ?auto_38008 - MODE
      ?auto_38009 - DIRECTION
      ?auto_38006 - MODE
      ?auto_38010 - DIRECTION
      ?auto_38011 - MODE
      ?auto_38012 - DIRECTION
      ?auto_38013 - MODE
    )
    :vars
    (
      ?auto_38015 - INSTRUMENT
      ?auto_38016 - SATELLITE
      ?auto_38014 - DIRECTION
      ?auto_38017 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38015 ?auto_38016 ) ( SUPPORTS ?auto_38015 ?auto_38013 ) ( not ( = ?auto_38012 ?auto_38014 ) ) ( HAVE_IMAGE ?auto_38009 ?auto_38006 ) ( not ( = ?auto_38009 ?auto_38012 ) ) ( not ( = ?auto_38009 ?auto_38014 ) ) ( not ( = ?auto_38006 ?auto_38013 ) ) ( CALIBRATION_TARGET ?auto_38015 ?auto_38014 ) ( POINTING ?auto_38016 ?auto_38007 ) ( not ( = ?auto_38014 ?auto_38007 ) ) ( not ( = ?auto_38012 ?auto_38007 ) ) ( not ( = ?auto_38009 ?auto_38007 ) ) ( ON_BOARD ?auto_38017 ?auto_38016 ) ( POWER_ON ?auto_38017 ) ( not ( = ?auto_38015 ?auto_38017 ) ) ( HAVE_IMAGE ?auto_38007 ?auto_38008 ) ( HAVE_IMAGE ?auto_38010 ?auto_38011 ) ( not ( = ?auto_38007 ?auto_38010 ) ) ( not ( = ?auto_38008 ?auto_38006 ) ) ( not ( = ?auto_38008 ?auto_38011 ) ) ( not ( = ?auto_38008 ?auto_38013 ) ) ( not ( = ?auto_38009 ?auto_38010 ) ) ( not ( = ?auto_38006 ?auto_38011 ) ) ( not ( = ?auto_38010 ?auto_38012 ) ) ( not ( = ?auto_38010 ?auto_38014 ) ) ( not ( = ?auto_38011 ?auto_38013 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38009 ?auto_38006 ?auto_38012 ?auto_38013 )
      ( GET-4IMAGE-VERIFY ?auto_38007 ?auto_38008 ?auto_38009 ?auto_38006 ?auto_38010 ?auto_38011 ?auto_38012 ?auto_38013 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38019 - DIRECTION
      ?auto_38020 - MODE
      ?auto_38021 - DIRECTION
      ?auto_38018 - MODE
      ?auto_38022 - DIRECTION
      ?auto_38023 - MODE
      ?auto_38024 - DIRECTION
      ?auto_38025 - MODE
    )
    :vars
    (
      ?auto_38027 - INSTRUMENT
      ?auto_38028 - SATELLITE
      ?auto_38026 - DIRECTION
      ?auto_38029 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38027 ?auto_38028 ) ( SUPPORTS ?auto_38027 ?auto_38025 ) ( not ( = ?auto_38024 ?auto_38026 ) ) ( HAVE_IMAGE ?auto_38021 ?auto_38018 ) ( not ( = ?auto_38021 ?auto_38024 ) ) ( not ( = ?auto_38021 ?auto_38026 ) ) ( not ( = ?auto_38018 ?auto_38025 ) ) ( CALIBRATION_TARGET ?auto_38027 ?auto_38026 ) ( POINTING ?auto_38028 ?auto_38022 ) ( not ( = ?auto_38026 ?auto_38022 ) ) ( not ( = ?auto_38024 ?auto_38022 ) ) ( not ( = ?auto_38021 ?auto_38022 ) ) ( ON_BOARD ?auto_38029 ?auto_38028 ) ( POWER_ON ?auto_38029 ) ( not ( = ?auto_38027 ?auto_38029 ) ) ( HAVE_IMAGE ?auto_38019 ?auto_38020 ) ( HAVE_IMAGE ?auto_38022 ?auto_38023 ) ( not ( = ?auto_38019 ?auto_38021 ) ) ( not ( = ?auto_38019 ?auto_38022 ) ) ( not ( = ?auto_38019 ?auto_38024 ) ) ( not ( = ?auto_38019 ?auto_38026 ) ) ( not ( = ?auto_38020 ?auto_38018 ) ) ( not ( = ?auto_38020 ?auto_38023 ) ) ( not ( = ?auto_38020 ?auto_38025 ) ) ( not ( = ?auto_38018 ?auto_38023 ) ) ( not ( = ?auto_38023 ?auto_38025 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38021 ?auto_38018 ?auto_38024 ?auto_38025 )
      ( GET-4IMAGE-VERIFY ?auto_38019 ?auto_38020 ?auto_38021 ?auto_38018 ?auto_38022 ?auto_38023 ?auto_38024 ?auto_38025 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38031 - DIRECTION
      ?auto_38032 - MODE
      ?auto_38033 - DIRECTION
      ?auto_38030 - MODE
      ?auto_38034 - DIRECTION
      ?auto_38035 - MODE
      ?auto_38036 - DIRECTION
      ?auto_38037 - MODE
    )
    :vars
    (
      ?auto_38039 - INSTRUMENT
      ?auto_38040 - SATELLITE
      ?auto_38038 - DIRECTION
      ?auto_38041 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38039 ?auto_38040 ) ( SUPPORTS ?auto_38039 ?auto_38035 ) ( not ( = ?auto_38034 ?auto_38038 ) ) ( HAVE_IMAGE ?auto_38033 ?auto_38037 ) ( not ( = ?auto_38033 ?auto_38034 ) ) ( not ( = ?auto_38033 ?auto_38038 ) ) ( not ( = ?auto_38037 ?auto_38035 ) ) ( CALIBRATION_TARGET ?auto_38039 ?auto_38038 ) ( POINTING ?auto_38040 ?auto_38031 ) ( not ( = ?auto_38038 ?auto_38031 ) ) ( not ( = ?auto_38034 ?auto_38031 ) ) ( not ( = ?auto_38033 ?auto_38031 ) ) ( ON_BOARD ?auto_38041 ?auto_38040 ) ( POWER_ON ?auto_38041 ) ( not ( = ?auto_38039 ?auto_38041 ) ) ( HAVE_IMAGE ?auto_38031 ?auto_38032 ) ( HAVE_IMAGE ?auto_38033 ?auto_38030 ) ( HAVE_IMAGE ?auto_38036 ?auto_38037 ) ( not ( = ?auto_38031 ?auto_38036 ) ) ( not ( = ?auto_38032 ?auto_38030 ) ) ( not ( = ?auto_38032 ?auto_38035 ) ) ( not ( = ?auto_38032 ?auto_38037 ) ) ( not ( = ?auto_38033 ?auto_38036 ) ) ( not ( = ?auto_38030 ?auto_38035 ) ) ( not ( = ?auto_38030 ?auto_38037 ) ) ( not ( = ?auto_38034 ?auto_38036 ) ) ( not ( = ?auto_38036 ?auto_38038 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38033 ?auto_38037 ?auto_38034 ?auto_38035 )
      ( GET-4IMAGE-VERIFY ?auto_38031 ?auto_38032 ?auto_38033 ?auto_38030 ?auto_38034 ?auto_38035 ?auto_38036 ?auto_38037 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38043 - DIRECTION
      ?auto_38044 - MODE
      ?auto_38045 - DIRECTION
      ?auto_38042 - MODE
      ?auto_38046 - DIRECTION
      ?auto_38047 - MODE
      ?auto_38048 - DIRECTION
      ?auto_38049 - MODE
    )
    :vars
    (
      ?auto_38051 - INSTRUMENT
      ?auto_38052 - SATELLITE
      ?auto_38050 - DIRECTION
      ?auto_38053 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38051 ?auto_38052 ) ( SUPPORTS ?auto_38051 ?auto_38047 ) ( not ( = ?auto_38046 ?auto_38050 ) ) ( HAVE_IMAGE ?auto_38045 ?auto_38042 ) ( not ( = ?auto_38045 ?auto_38046 ) ) ( not ( = ?auto_38045 ?auto_38050 ) ) ( not ( = ?auto_38042 ?auto_38047 ) ) ( CALIBRATION_TARGET ?auto_38051 ?auto_38050 ) ( POINTING ?auto_38052 ?auto_38043 ) ( not ( = ?auto_38050 ?auto_38043 ) ) ( not ( = ?auto_38046 ?auto_38043 ) ) ( not ( = ?auto_38045 ?auto_38043 ) ) ( ON_BOARD ?auto_38053 ?auto_38052 ) ( POWER_ON ?auto_38053 ) ( not ( = ?auto_38051 ?auto_38053 ) ) ( HAVE_IMAGE ?auto_38043 ?auto_38044 ) ( HAVE_IMAGE ?auto_38048 ?auto_38049 ) ( not ( = ?auto_38043 ?auto_38048 ) ) ( not ( = ?auto_38044 ?auto_38042 ) ) ( not ( = ?auto_38044 ?auto_38047 ) ) ( not ( = ?auto_38044 ?auto_38049 ) ) ( not ( = ?auto_38045 ?auto_38048 ) ) ( not ( = ?auto_38042 ?auto_38049 ) ) ( not ( = ?auto_38046 ?auto_38048 ) ) ( not ( = ?auto_38047 ?auto_38049 ) ) ( not ( = ?auto_38048 ?auto_38050 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38045 ?auto_38042 ?auto_38046 ?auto_38047 )
      ( GET-4IMAGE-VERIFY ?auto_38043 ?auto_38044 ?auto_38045 ?auto_38042 ?auto_38046 ?auto_38047 ?auto_38048 ?auto_38049 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38067 - DIRECTION
      ?auto_38068 - MODE
      ?auto_38069 - DIRECTION
      ?auto_38066 - MODE
      ?auto_38070 - DIRECTION
      ?auto_38071 - MODE
      ?auto_38072 - DIRECTION
      ?auto_38073 - MODE
    )
    :vars
    (
      ?auto_38075 - INSTRUMENT
      ?auto_38076 - SATELLITE
      ?auto_38074 - DIRECTION
      ?auto_38077 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38075 ?auto_38076 ) ( SUPPORTS ?auto_38075 ?auto_38073 ) ( not ( = ?auto_38072 ?auto_38074 ) ) ( HAVE_IMAGE ?auto_38070 ?auto_38071 ) ( not ( = ?auto_38070 ?auto_38072 ) ) ( not ( = ?auto_38070 ?auto_38074 ) ) ( not ( = ?auto_38071 ?auto_38073 ) ) ( CALIBRATION_TARGET ?auto_38075 ?auto_38074 ) ( POINTING ?auto_38076 ?auto_38067 ) ( not ( = ?auto_38074 ?auto_38067 ) ) ( not ( = ?auto_38072 ?auto_38067 ) ) ( not ( = ?auto_38070 ?auto_38067 ) ) ( ON_BOARD ?auto_38077 ?auto_38076 ) ( POWER_ON ?auto_38077 ) ( not ( = ?auto_38075 ?auto_38077 ) ) ( HAVE_IMAGE ?auto_38067 ?auto_38068 ) ( HAVE_IMAGE ?auto_38069 ?auto_38066 ) ( not ( = ?auto_38067 ?auto_38069 ) ) ( not ( = ?auto_38068 ?auto_38066 ) ) ( not ( = ?auto_38068 ?auto_38071 ) ) ( not ( = ?auto_38068 ?auto_38073 ) ) ( not ( = ?auto_38069 ?auto_38070 ) ) ( not ( = ?auto_38069 ?auto_38072 ) ) ( not ( = ?auto_38069 ?auto_38074 ) ) ( not ( = ?auto_38066 ?auto_38071 ) ) ( not ( = ?auto_38066 ?auto_38073 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38070 ?auto_38071 ?auto_38072 ?auto_38073 )
      ( GET-4IMAGE-VERIFY ?auto_38067 ?auto_38068 ?auto_38069 ?auto_38066 ?auto_38070 ?auto_38071 ?auto_38072 ?auto_38073 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38079 - DIRECTION
      ?auto_38080 - MODE
      ?auto_38081 - DIRECTION
      ?auto_38078 - MODE
      ?auto_38082 - DIRECTION
      ?auto_38083 - MODE
      ?auto_38084 - DIRECTION
      ?auto_38085 - MODE
    )
    :vars
    (
      ?auto_38087 - INSTRUMENT
      ?auto_38089 - SATELLITE
      ?auto_38086 - DIRECTION
      ?auto_38088 - DIRECTION
      ?auto_38091 - MODE
      ?auto_38090 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38087 ?auto_38089 ) ( SUPPORTS ?auto_38087 ?auto_38085 ) ( not ( = ?auto_38084 ?auto_38086 ) ) ( HAVE_IMAGE ?auto_38088 ?auto_38091 ) ( not ( = ?auto_38088 ?auto_38084 ) ) ( not ( = ?auto_38088 ?auto_38086 ) ) ( not ( = ?auto_38091 ?auto_38085 ) ) ( CALIBRATION_TARGET ?auto_38087 ?auto_38086 ) ( POINTING ?auto_38089 ?auto_38082 ) ( not ( = ?auto_38086 ?auto_38082 ) ) ( not ( = ?auto_38084 ?auto_38082 ) ) ( not ( = ?auto_38088 ?auto_38082 ) ) ( ON_BOARD ?auto_38090 ?auto_38089 ) ( POWER_ON ?auto_38090 ) ( not ( = ?auto_38087 ?auto_38090 ) ) ( HAVE_IMAGE ?auto_38079 ?auto_38080 ) ( HAVE_IMAGE ?auto_38081 ?auto_38078 ) ( HAVE_IMAGE ?auto_38082 ?auto_38083 ) ( not ( = ?auto_38079 ?auto_38081 ) ) ( not ( = ?auto_38079 ?auto_38082 ) ) ( not ( = ?auto_38079 ?auto_38084 ) ) ( not ( = ?auto_38079 ?auto_38086 ) ) ( not ( = ?auto_38079 ?auto_38088 ) ) ( not ( = ?auto_38080 ?auto_38078 ) ) ( not ( = ?auto_38080 ?auto_38083 ) ) ( not ( = ?auto_38080 ?auto_38085 ) ) ( not ( = ?auto_38080 ?auto_38091 ) ) ( not ( = ?auto_38081 ?auto_38082 ) ) ( not ( = ?auto_38081 ?auto_38084 ) ) ( not ( = ?auto_38081 ?auto_38086 ) ) ( not ( = ?auto_38081 ?auto_38088 ) ) ( not ( = ?auto_38078 ?auto_38083 ) ) ( not ( = ?auto_38078 ?auto_38085 ) ) ( not ( = ?auto_38078 ?auto_38091 ) ) ( not ( = ?auto_38083 ?auto_38085 ) ) ( not ( = ?auto_38083 ?auto_38091 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38088 ?auto_38091 ?auto_38084 ?auto_38085 )
      ( GET-4IMAGE-VERIFY ?auto_38079 ?auto_38080 ?auto_38081 ?auto_38078 ?auto_38082 ?auto_38083 ?auto_38084 ?auto_38085 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38093 - DIRECTION
      ?auto_38094 - MODE
      ?auto_38095 - DIRECTION
      ?auto_38092 - MODE
      ?auto_38096 - DIRECTION
      ?auto_38097 - MODE
      ?auto_38098 - DIRECTION
      ?auto_38099 - MODE
    )
    :vars
    (
      ?auto_38101 - INSTRUMENT
      ?auto_38102 - SATELLITE
      ?auto_38100 - DIRECTION
      ?auto_38103 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38101 ?auto_38102 ) ( SUPPORTS ?auto_38101 ?auto_38097 ) ( not ( = ?auto_38096 ?auto_38100 ) ) ( HAVE_IMAGE ?auto_38098 ?auto_38099 ) ( not ( = ?auto_38098 ?auto_38096 ) ) ( not ( = ?auto_38098 ?auto_38100 ) ) ( not ( = ?auto_38099 ?auto_38097 ) ) ( CALIBRATION_TARGET ?auto_38101 ?auto_38100 ) ( POINTING ?auto_38102 ?auto_38093 ) ( not ( = ?auto_38100 ?auto_38093 ) ) ( not ( = ?auto_38096 ?auto_38093 ) ) ( not ( = ?auto_38098 ?auto_38093 ) ) ( ON_BOARD ?auto_38103 ?auto_38102 ) ( POWER_ON ?auto_38103 ) ( not ( = ?auto_38101 ?auto_38103 ) ) ( HAVE_IMAGE ?auto_38093 ?auto_38094 ) ( HAVE_IMAGE ?auto_38095 ?auto_38092 ) ( not ( = ?auto_38093 ?auto_38095 ) ) ( not ( = ?auto_38094 ?auto_38092 ) ) ( not ( = ?auto_38094 ?auto_38097 ) ) ( not ( = ?auto_38094 ?auto_38099 ) ) ( not ( = ?auto_38095 ?auto_38096 ) ) ( not ( = ?auto_38095 ?auto_38098 ) ) ( not ( = ?auto_38095 ?auto_38100 ) ) ( not ( = ?auto_38092 ?auto_38097 ) ) ( not ( = ?auto_38092 ?auto_38099 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38098 ?auto_38099 ?auto_38096 ?auto_38097 )
      ( GET-4IMAGE-VERIFY ?auto_38093 ?auto_38094 ?auto_38095 ?auto_38092 ?auto_38096 ?auto_38097 ?auto_38098 ?auto_38099 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38105 - DIRECTION
      ?auto_38106 - MODE
      ?auto_38107 - DIRECTION
      ?auto_38104 - MODE
      ?auto_38108 - DIRECTION
      ?auto_38109 - MODE
      ?auto_38110 - DIRECTION
      ?auto_38111 - MODE
    )
    :vars
    (
      ?auto_38113 - INSTRUMENT
      ?auto_38115 - SATELLITE
      ?auto_38112 - DIRECTION
      ?auto_38114 - DIRECTION
      ?auto_38117 - MODE
      ?auto_38116 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38113 ?auto_38115 ) ( SUPPORTS ?auto_38113 ?auto_38109 ) ( not ( = ?auto_38108 ?auto_38112 ) ) ( HAVE_IMAGE ?auto_38114 ?auto_38117 ) ( not ( = ?auto_38114 ?auto_38108 ) ) ( not ( = ?auto_38114 ?auto_38112 ) ) ( not ( = ?auto_38117 ?auto_38109 ) ) ( CALIBRATION_TARGET ?auto_38113 ?auto_38112 ) ( POINTING ?auto_38115 ?auto_38107 ) ( not ( = ?auto_38112 ?auto_38107 ) ) ( not ( = ?auto_38108 ?auto_38107 ) ) ( not ( = ?auto_38114 ?auto_38107 ) ) ( ON_BOARD ?auto_38116 ?auto_38115 ) ( POWER_ON ?auto_38116 ) ( not ( = ?auto_38113 ?auto_38116 ) ) ( HAVE_IMAGE ?auto_38105 ?auto_38106 ) ( HAVE_IMAGE ?auto_38107 ?auto_38104 ) ( HAVE_IMAGE ?auto_38110 ?auto_38111 ) ( not ( = ?auto_38105 ?auto_38107 ) ) ( not ( = ?auto_38105 ?auto_38108 ) ) ( not ( = ?auto_38105 ?auto_38110 ) ) ( not ( = ?auto_38105 ?auto_38112 ) ) ( not ( = ?auto_38105 ?auto_38114 ) ) ( not ( = ?auto_38106 ?auto_38104 ) ) ( not ( = ?auto_38106 ?auto_38109 ) ) ( not ( = ?auto_38106 ?auto_38111 ) ) ( not ( = ?auto_38106 ?auto_38117 ) ) ( not ( = ?auto_38107 ?auto_38110 ) ) ( not ( = ?auto_38104 ?auto_38109 ) ) ( not ( = ?auto_38104 ?auto_38111 ) ) ( not ( = ?auto_38104 ?auto_38117 ) ) ( not ( = ?auto_38108 ?auto_38110 ) ) ( not ( = ?auto_38109 ?auto_38111 ) ) ( not ( = ?auto_38110 ?auto_38112 ) ) ( not ( = ?auto_38110 ?auto_38114 ) ) ( not ( = ?auto_38111 ?auto_38117 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38114 ?auto_38117 ?auto_38108 ?auto_38109 )
      ( GET-4IMAGE-VERIFY ?auto_38105 ?auto_38106 ?auto_38107 ?auto_38104 ?auto_38108 ?auto_38109 ?auto_38110 ?auto_38111 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38133 - DIRECTION
      ?auto_38134 - MODE
      ?auto_38135 - DIRECTION
      ?auto_38132 - MODE
      ?auto_38136 - DIRECTION
      ?auto_38137 - MODE
      ?auto_38138 - DIRECTION
      ?auto_38139 - MODE
    )
    :vars
    (
      ?auto_38141 - INSTRUMENT
      ?auto_38142 - SATELLITE
      ?auto_38140 - DIRECTION
      ?auto_38143 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38141 ?auto_38142 ) ( SUPPORTS ?auto_38141 ?auto_38132 ) ( not ( = ?auto_38135 ?auto_38140 ) ) ( HAVE_IMAGE ?auto_38136 ?auto_38139 ) ( not ( = ?auto_38136 ?auto_38135 ) ) ( not ( = ?auto_38136 ?auto_38140 ) ) ( not ( = ?auto_38139 ?auto_38132 ) ) ( CALIBRATION_TARGET ?auto_38141 ?auto_38140 ) ( POINTING ?auto_38142 ?auto_38133 ) ( not ( = ?auto_38140 ?auto_38133 ) ) ( not ( = ?auto_38135 ?auto_38133 ) ) ( not ( = ?auto_38136 ?auto_38133 ) ) ( ON_BOARD ?auto_38143 ?auto_38142 ) ( POWER_ON ?auto_38143 ) ( not ( = ?auto_38141 ?auto_38143 ) ) ( HAVE_IMAGE ?auto_38133 ?auto_38134 ) ( HAVE_IMAGE ?auto_38136 ?auto_38137 ) ( HAVE_IMAGE ?auto_38138 ?auto_38139 ) ( not ( = ?auto_38133 ?auto_38138 ) ) ( not ( = ?auto_38134 ?auto_38132 ) ) ( not ( = ?auto_38134 ?auto_38137 ) ) ( not ( = ?auto_38134 ?auto_38139 ) ) ( not ( = ?auto_38135 ?auto_38138 ) ) ( not ( = ?auto_38132 ?auto_38137 ) ) ( not ( = ?auto_38136 ?auto_38138 ) ) ( not ( = ?auto_38137 ?auto_38139 ) ) ( not ( = ?auto_38138 ?auto_38140 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38136 ?auto_38139 ?auto_38135 ?auto_38132 )
      ( GET-4IMAGE-VERIFY ?auto_38133 ?auto_38134 ?auto_38135 ?auto_38132 ?auto_38136 ?auto_38137 ?auto_38138 ?auto_38139 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38145 - DIRECTION
      ?auto_38146 - MODE
      ?auto_38147 - DIRECTION
      ?auto_38144 - MODE
      ?auto_38148 - DIRECTION
      ?auto_38149 - MODE
      ?auto_38150 - DIRECTION
      ?auto_38151 - MODE
    )
    :vars
    (
      ?auto_38153 - INSTRUMENT
      ?auto_38154 - SATELLITE
      ?auto_38152 - DIRECTION
      ?auto_38155 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38153 ?auto_38154 ) ( SUPPORTS ?auto_38153 ?auto_38144 ) ( not ( = ?auto_38147 ?auto_38152 ) ) ( HAVE_IMAGE ?auto_38148 ?auto_38149 ) ( not ( = ?auto_38148 ?auto_38147 ) ) ( not ( = ?auto_38148 ?auto_38152 ) ) ( not ( = ?auto_38149 ?auto_38144 ) ) ( CALIBRATION_TARGET ?auto_38153 ?auto_38152 ) ( POINTING ?auto_38154 ?auto_38145 ) ( not ( = ?auto_38152 ?auto_38145 ) ) ( not ( = ?auto_38147 ?auto_38145 ) ) ( not ( = ?auto_38148 ?auto_38145 ) ) ( ON_BOARD ?auto_38155 ?auto_38154 ) ( POWER_ON ?auto_38155 ) ( not ( = ?auto_38153 ?auto_38155 ) ) ( HAVE_IMAGE ?auto_38145 ?auto_38146 ) ( HAVE_IMAGE ?auto_38150 ?auto_38151 ) ( not ( = ?auto_38145 ?auto_38150 ) ) ( not ( = ?auto_38146 ?auto_38144 ) ) ( not ( = ?auto_38146 ?auto_38149 ) ) ( not ( = ?auto_38146 ?auto_38151 ) ) ( not ( = ?auto_38147 ?auto_38150 ) ) ( not ( = ?auto_38144 ?auto_38151 ) ) ( not ( = ?auto_38148 ?auto_38150 ) ) ( not ( = ?auto_38149 ?auto_38151 ) ) ( not ( = ?auto_38150 ?auto_38152 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38148 ?auto_38149 ?auto_38147 ?auto_38144 )
      ( GET-4IMAGE-VERIFY ?auto_38145 ?auto_38146 ?auto_38147 ?auto_38144 ?auto_38148 ?auto_38149 ?auto_38150 ?auto_38151 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38169 - DIRECTION
      ?auto_38170 - MODE
      ?auto_38171 - DIRECTION
      ?auto_38168 - MODE
      ?auto_38172 - DIRECTION
      ?auto_38173 - MODE
      ?auto_38174 - DIRECTION
      ?auto_38175 - MODE
    )
    :vars
    (
      ?auto_38177 - INSTRUMENT
      ?auto_38178 - SATELLITE
      ?auto_38176 - DIRECTION
      ?auto_38179 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38177 ?auto_38178 ) ( SUPPORTS ?auto_38177 ?auto_38168 ) ( not ( = ?auto_38171 ?auto_38176 ) ) ( HAVE_IMAGE ?auto_38174 ?auto_38175 ) ( not ( = ?auto_38174 ?auto_38171 ) ) ( not ( = ?auto_38174 ?auto_38176 ) ) ( not ( = ?auto_38175 ?auto_38168 ) ) ( CALIBRATION_TARGET ?auto_38177 ?auto_38176 ) ( POINTING ?auto_38178 ?auto_38169 ) ( not ( = ?auto_38176 ?auto_38169 ) ) ( not ( = ?auto_38171 ?auto_38169 ) ) ( not ( = ?auto_38174 ?auto_38169 ) ) ( ON_BOARD ?auto_38179 ?auto_38178 ) ( POWER_ON ?auto_38179 ) ( not ( = ?auto_38177 ?auto_38179 ) ) ( HAVE_IMAGE ?auto_38169 ?auto_38170 ) ( HAVE_IMAGE ?auto_38172 ?auto_38173 ) ( not ( = ?auto_38169 ?auto_38172 ) ) ( not ( = ?auto_38170 ?auto_38168 ) ) ( not ( = ?auto_38170 ?auto_38173 ) ) ( not ( = ?auto_38170 ?auto_38175 ) ) ( not ( = ?auto_38171 ?auto_38172 ) ) ( not ( = ?auto_38168 ?auto_38173 ) ) ( not ( = ?auto_38172 ?auto_38174 ) ) ( not ( = ?auto_38172 ?auto_38176 ) ) ( not ( = ?auto_38173 ?auto_38175 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38174 ?auto_38175 ?auto_38171 ?auto_38168 )
      ( GET-4IMAGE-VERIFY ?auto_38169 ?auto_38170 ?auto_38171 ?auto_38168 ?auto_38172 ?auto_38173 ?auto_38174 ?auto_38175 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38181 - DIRECTION
      ?auto_38182 - MODE
      ?auto_38183 - DIRECTION
      ?auto_38180 - MODE
      ?auto_38184 - DIRECTION
      ?auto_38185 - MODE
      ?auto_38186 - DIRECTION
      ?auto_38187 - MODE
    )
    :vars
    (
      ?auto_38189 - INSTRUMENT
      ?auto_38191 - SATELLITE
      ?auto_38188 - DIRECTION
      ?auto_38190 - DIRECTION
      ?auto_38193 - MODE
      ?auto_38192 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38189 ?auto_38191 ) ( SUPPORTS ?auto_38189 ?auto_38180 ) ( not ( = ?auto_38183 ?auto_38188 ) ) ( HAVE_IMAGE ?auto_38190 ?auto_38193 ) ( not ( = ?auto_38190 ?auto_38183 ) ) ( not ( = ?auto_38190 ?auto_38188 ) ) ( not ( = ?auto_38193 ?auto_38180 ) ) ( CALIBRATION_TARGET ?auto_38189 ?auto_38188 ) ( POINTING ?auto_38191 ?auto_38184 ) ( not ( = ?auto_38188 ?auto_38184 ) ) ( not ( = ?auto_38183 ?auto_38184 ) ) ( not ( = ?auto_38190 ?auto_38184 ) ) ( ON_BOARD ?auto_38192 ?auto_38191 ) ( POWER_ON ?auto_38192 ) ( not ( = ?auto_38189 ?auto_38192 ) ) ( HAVE_IMAGE ?auto_38181 ?auto_38182 ) ( HAVE_IMAGE ?auto_38184 ?auto_38185 ) ( HAVE_IMAGE ?auto_38186 ?auto_38187 ) ( not ( = ?auto_38181 ?auto_38183 ) ) ( not ( = ?auto_38181 ?auto_38184 ) ) ( not ( = ?auto_38181 ?auto_38186 ) ) ( not ( = ?auto_38181 ?auto_38188 ) ) ( not ( = ?auto_38181 ?auto_38190 ) ) ( not ( = ?auto_38182 ?auto_38180 ) ) ( not ( = ?auto_38182 ?auto_38185 ) ) ( not ( = ?auto_38182 ?auto_38187 ) ) ( not ( = ?auto_38182 ?auto_38193 ) ) ( not ( = ?auto_38183 ?auto_38186 ) ) ( not ( = ?auto_38180 ?auto_38185 ) ) ( not ( = ?auto_38180 ?auto_38187 ) ) ( not ( = ?auto_38184 ?auto_38186 ) ) ( not ( = ?auto_38185 ?auto_38187 ) ) ( not ( = ?auto_38185 ?auto_38193 ) ) ( not ( = ?auto_38186 ?auto_38188 ) ) ( not ( = ?auto_38186 ?auto_38190 ) ) ( not ( = ?auto_38187 ?auto_38193 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38190 ?auto_38193 ?auto_38183 ?auto_38180 )
      ( GET-4IMAGE-VERIFY ?auto_38181 ?auto_38182 ?auto_38183 ?auto_38180 ?auto_38184 ?auto_38185 ?auto_38186 ?auto_38187 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38249 - DIRECTION
      ?auto_38250 - MODE
      ?auto_38251 - DIRECTION
      ?auto_38248 - MODE
      ?auto_38252 - DIRECTION
      ?auto_38253 - MODE
      ?auto_38254 - DIRECTION
      ?auto_38255 - MODE
    )
    :vars
    (
      ?auto_38257 - INSTRUMENT
      ?auto_38258 - SATELLITE
      ?auto_38256 - DIRECTION
      ?auto_38260 - DIRECTION
      ?auto_38259 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38257 ?auto_38258 ) ( SUPPORTS ?auto_38257 ?auto_38250 ) ( not ( = ?auto_38249 ?auto_38256 ) ) ( HAVE_IMAGE ?auto_38252 ?auto_38255 ) ( not ( = ?auto_38252 ?auto_38249 ) ) ( not ( = ?auto_38252 ?auto_38256 ) ) ( not ( = ?auto_38255 ?auto_38250 ) ) ( CALIBRATION_TARGET ?auto_38257 ?auto_38256 ) ( POINTING ?auto_38258 ?auto_38260 ) ( not ( = ?auto_38256 ?auto_38260 ) ) ( not ( = ?auto_38249 ?auto_38260 ) ) ( not ( = ?auto_38252 ?auto_38260 ) ) ( ON_BOARD ?auto_38259 ?auto_38258 ) ( POWER_ON ?auto_38259 ) ( not ( = ?auto_38257 ?auto_38259 ) ) ( HAVE_IMAGE ?auto_38251 ?auto_38248 ) ( HAVE_IMAGE ?auto_38252 ?auto_38253 ) ( HAVE_IMAGE ?auto_38254 ?auto_38255 ) ( not ( = ?auto_38249 ?auto_38251 ) ) ( not ( = ?auto_38249 ?auto_38254 ) ) ( not ( = ?auto_38250 ?auto_38248 ) ) ( not ( = ?auto_38250 ?auto_38253 ) ) ( not ( = ?auto_38251 ?auto_38252 ) ) ( not ( = ?auto_38251 ?auto_38254 ) ) ( not ( = ?auto_38251 ?auto_38256 ) ) ( not ( = ?auto_38251 ?auto_38260 ) ) ( not ( = ?auto_38248 ?auto_38253 ) ) ( not ( = ?auto_38248 ?auto_38255 ) ) ( not ( = ?auto_38252 ?auto_38254 ) ) ( not ( = ?auto_38253 ?auto_38255 ) ) ( not ( = ?auto_38254 ?auto_38256 ) ) ( not ( = ?auto_38254 ?auto_38260 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38252 ?auto_38255 ?auto_38249 ?auto_38250 )
      ( GET-4IMAGE-VERIFY ?auto_38249 ?auto_38250 ?auto_38251 ?auto_38248 ?auto_38252 ?auto_38253 ?auto_38254 ?auto_38255 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38262 - DIRECTION
      ?auto_38263 - MODE
      ?auto_38264 - DIRECTION
      ?auto_38261 - MODE
      ?auto_38265 - DIRECTION
      ?auto_38266 - MODE
      ?auto_38267 - DIRECTION
      ?auto_38268 - MODE
    )
    :vars
    (
      ?auto_38270 - INSTRUMENT
      ?auto_38271 - SATELLITE
      ?auto_38269 - DIRECTION
      ?auto_38272 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38270 ?auto_38271 ) ( SUPPORTS ?auto_38270 ?auto_38263 ) ( not ( = ?auto_38262 ?auto_38269 ) ) ( HAVE_IMAGE ?auto_38265 ?auto_38261 ) ( not ( = ?auto_38265 ?auto_38262 ) ) ( not ( = ?auto_38265 ?auto_38269 ) ) ( not ( = ?auto_38261 ?auto_38263 ) ) ( CALIBRATION_TARGET ?auto_38270 ?auto_38269 ) ( POINTING ?auto_38271 ?auto_38267 ) ( not ( = ?auto_38269 ?auto_38267 ) ) ( not ( = ?auto_38262 ?auto_38267 ) ) ( not ( = ?auto_38265 ?auto_38267 ) ) ( ON_BOARD ?auto_38272 ?auto_38271 ) ( POWER_ON ?auto_38272 ) ( not ( = ?auto_38270 ?auto_38272 ) ) ( HAVE_IMAGE ?auto_38264 ?auto_38261 ) ( HAVE_IMAGE ?auto_38265 ?auto_38266 ) ( HAVE_IMAGE ?auto_38267 ?auto_38268 ) ( not ( = ?auto_38262 ?auto_38264 ) ) ( not ( = ?auto_38263 ?auto_38266 ) ) ( not ( = ?auto_38263 ?auto_38268 ) ) ( not ( = ?auto_38264 ?auto_38265 ) ) ( not ( = ?auto_38264 ?auto_38267 ) ) ( not ( = ?auto_38264 ?auto_38269 ) ) ( not ( = ?auto_38261 ?auto_38266 ) ) ( not ( = ?auto_38261 ?auto_38268 ) ) ( not ( = ?auto_38266 ?auto_38268 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38265 ?auto_38261 ?auto_38262 ?auto_38263 )
      ( GET-4IMAGE-VERIFY ?auto_38262 ?auto_38263 ?auto_38264 ?auto_38261 ?auto_38265 ?auto_38266 ?auto_38267 ?auto_38268 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38287 - DIRECTION
      ?auto_38288 - MODE
      ?auto_38289 - DIRECTION
      ?auto_38286 - MODE
      ?auto_38290 - DIRECTION
      ?auto_38291 - MODE
      ?auto_38292 - DIRECTION
      ?auto_38293 - MODE
    )
    :vars
    (
      ?auto_38295 - INSTRUMENT
      ?auto_38296 - SATELLITE
      ?auto_38294 - DIRECTION
      ?auto_38297 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38295 ?auto_38296 ) ( SUPPORTS ?auto_38295 ?auto_38288 ) ( not ( = ?auto_38287 ?auto_38294 ) ) ( HAVE_IMAGE ?auto_38289 ?auto_38293 ) ( not ( = ?auto_38289 ?auto_38287 ) ) ( not ( = ?auto_38289 ?auto_38294 ) ) ( not ( = ?auto_38293 ?auto_38288 ) ) ( CALIBRATION_TARGET ?auto_38295 ?auto_38294 ) ( POINTING ?auto_38296 ?auto_38290 ) ( not ( = ?auto_38294 ?auto_38290 ) ) ( not ( = ?auto_38287 ?auto_38290 ) ) ( not ( = ?auto_38289 ?auto_38290 ) ) ( ON_BOARD ?auto_38297 ?auto_38296 ) ( POWER_ON ?auto_38297 ) ( not ( = ?auto_38295 ?auto_38297 ) ) ( HAVE_IMAGE ?auto_38289 ?auto_38286 ) ( HAVE_IMAGE ?auto_38290 ?auto_38291 ) ( HAVE_IMAGE ?auto_38292 ?auto_38293 ) ( not ( = ?auto_38287 ?auto_38292 ) ) ( not ( = ?auto_38288 ?auto_38286 ) ) ( not ( = ?auto_38288 ?auto_38291 ) ) ( not ( = ?auto_38289 ?auto_38292 ) ) ( not ( = ?auto_38286 ?auto_38291 ) ) ( not ( = ?auto_38286 ?auto_38293 ) ) ( not ( = ?auto_38290 ?auto_38292 ) ) ( not ( = ?auto_38291 ?auto_38293 ) ) ( not ( = ?auto_38292 ?auto_38294 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38289 ?auto_38293 ?auto_38287 ?auto_38288 )
      ( GET-4IMAGE-VERIFY ?auto_38287 ?auto_38288 ?auto_38289 ?auto_38286 ?auto_38290 ?auto_38291 ?auto_38292 ?auto_38293 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38299 - DIRECTION
      ?auto_38300 - MODE
      ?auto_38301 - DIRECTION
      ?auto_38298 - MODE
      ?auto_38302 - DIRECTION
      ?auto_38303 - MODE
      ?auto_38304 - DIRECTION
      ?auto_38305 - MODE
    )
    :vars
    (
      ?auto_38307 - INSTRUMENT
      ?auto_38308 - SATELLITE
      ?auto_38306 - DIRECTION
      ?auto_38309 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38307 ?auto_38308 ) ( SUPPORTS ?auto_38307 ?auto_38300 ) ( not ( = ?auto_38299 ?auto_38306 ) ) ( HAVE_IMAGE ?auto_38301 ?auto_38298 ) ( not ( = ?auto_38301 ?auto_38299 ) ) ( not ( = ?auto_38301 ?auto_38306 ) ) ( not ( = ?auto_38298 ?auto_38300 ) ) ( CALIBRATION_TARGET ?auto_38307 ?auto_38306 ) ( POINTING ?auto_38308 ?auto_38302 ) ( not ( = ?auto_38306 ?auto_38302 ) ) ( not ( = ?auto_38299 ?auto_38302 ) ) ( not ( = ?auto_38301 ?auto_38302 ) ) ( ON_BOARD ?auto_38309 ?auto_38308 ) ( POWER_ON ?auto_38309 ) ( not ( = ?auto_38307 ?auto_38309 ) ) ( HAVE_IMAGE ?auto_38302 ?auto_38303 ) ( HAVE_IMAGE ?auto_38304 ?auto_38305 ) ( not ( = ?auto_38299 ?auto_38304 ) ) ( not ( = ?auto_38300 ?auto_38303 ) ) ( not ( = ?auto_38300 ?auto_38305 ) ) ( not ( = ?auto_38301 ?auto_38304 ) ) ( not ( = ?auto_38298 ?auto_38303 ) ) ( not ( = ?auto_38298 ?auto_38305 ) ) ( not ( = ?auto_38302 ?auto_38304 ) ) ( not ( = ?auto_38303 ?auto_38305 ) ) ( not ( = ?auto_38304 ?auto_38306 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38301 ?auto_38298 ?auto_38299 ?auto_38300 )
      ( GET-4IMAGE-VERIFY ?auto_38299 ?auto_38300 ?auto_38301 ?auto_38298 ?auto_38302 ?auto_38303 ?auto_38304 ?auto_38305 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38361 - DIRECTION
      ?auto_38362 - MODE
      ?auto_38363 - DIRECTION
      ?auto_38360 - MODE
      ?auto_38364 - DIRECTION
      ?auto_38365 - MODE
      ?auto_38366 - DIRECTION
      ?auto_38367 - MODE
    )
    :vars
    (
      ?auto_38369 - INSTRUMENT
      ?auto_38370 - SATELLITE
      ?auto_38368 - DIRECTION
      ?auto_38371 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38369 ?auto_38370 ) ( SUPPORTS ?auto_38369 ?auto_38362 ) ( not ( = ?auto_38361 ?auto_38368 ) ) ( HAVE_IMAGE ?auto_38364 ?auto_38367 ) ( not ( = ?auto_38364 ?auto_38361 ) ) ( not ( = ?auto_38364 ?auto_38368 ) ) ( not ( = ?auto_38367 ?auto_38362 ) ) ( CALIBRATION_TARGET ?auto_38369 ?auto_38368 ) ( POINTING ?auto_38370 ?auto_38363 ) ( not ( = ?auto_38368 ?auto_38363 ) ) ( not ( = ?auto_38361 ?auto_38363 ) ) ( not ( = ?auto_38364 ?auto_38363 ) ) ( ON_BOARD ?auto_38371 ?auto_38370 ) ( POWER_ON ?auto_38371 ) ( not ( = ?auto_38369 ?auto_38371 ) ) ( HAVE_IMAGE ?auto_38363 ?auto_38360 ) ( HAVE_IMAGE ?auto_38364 ?auto_38365 ) ( HAVE_IMAGE ?auto_38366 ?auto_38367 ) ( not ( = ?auto_38361 ?auto_38366 ) ) ( not ( = ?auto_38362 ?auto_38360 ) ) ( not ( = ?auto_38362 ?auto_38365 ) ) ( not ( = ?auto_38363 ?auto_38366 ) ) ( not ( = ?auto_38360 ?auto_38365 ) ) ( not ( = ?auto_38360 ?auto_38367 ) ) ( not ( = ?auto_38364 ?auto_38366 ) ) ( not ( = ?auto_38365 ?auto_38367 ) ) ( not ( = ?auto_38366 ?auto_38368 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38364 ?auto_38367 ?auto_38361 ?auto_38362 )
      ( GET-4IMAGE-VERIFY ?auto_38361 ?auto_38362 ?auto_38363 ?auto_38360 ?auto_38364 ?auto_38365 ?auto_38366 ?auto_38367 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38373 - DIRECTION
      ?auto_38374 - MODE
      ?auto_38375 - DIRECTION
      ?auto_38372 - MODE
      ?auto_38376 - DIRECTION
      ?auto_38377 - MODE
      ?auto_38378 - DIRECTION
      ?auto_38379 - MODE
    )
    :vars
    (
      ?auto_38381 - INSTRUMENT
      ?auto_38382 - SATELLITE
      ?auto_38380 - DIRECTION
      ?auto_38383 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38381 ?auto_38382 ) ( SUPPORTS ?auto_38381 ?auto_38374 ) ( not ( = ?auto_38373 ?auto_38380 ) ) ( HAVE_IMAGE ?auto_38376 ?auto_38377 ) ( not ( = ?auto_38376 ?auto_38373 ) ) ( not ( = ?auto_38376 ?auto_38380 ) ) ( not ( = ?auto_38377 ?auto_38374 ) ) ( CALIBRATION_TARGET ?auto_38381 ?auto_38380 ) ( POINTING ?auto_38382 ?auto_38375 ) ( not ( = ?auto_38380 ?auto_38375 ) ) ( not ( = ?auto_38373 ?auto_38375 ) ) ( not ( = ?auto_38376 ?auto_38375 ) ) ( ON_BOARD ?auto_38383 ?auto_38382 ) ( POWER_ON ?auto_38383 ) ( not ( = ?auto_38381 ?auto_38383 ) ) ( HAVE_IMAGE ?auto_38375 ?auto_38372 ) ( HAVE_IMAGE ?auto_38378 ?auto_38379 ) ( not ( = ?auto_38373 ?auto_38378 ) ) ( not ( = ?auto_38374 ?auto_38372 ) ) ( not ( = ?auto_38374 ?auto_38379 ) ) ( not ( = ?auto_38375 ?auto_38378 ) ) ( not ( = ?auto_38372 ?auto_38377 ) ) ( not ( = ?auto_38372 ?auto_38379 ) ) ( not ( = ?auto_38376 ?auto_38378 ) ) ( not ( = ?auto_38377 ?auto_38379 ) ) ( not ( = ?auto_38378 ?auto_38380 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38376 ?auto_38377 ?auto_38373 ?auto_38374 )
      ( GET-4IMAGE-VERIFY ?auto_38373 ?auto_38374 ?auto_38375 ?auto_38372 ?auto_38376 ?auto_38377 ?auto_38378 ?auto_38379 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38397 - DIRECTION
      ?auto_38398 - MODE
      ?auto_38399 - DIRECTION
      ?auto_38396 - MODE
      ?auto_38400 - DIRECTION
      ?auto_38401 - MODE
      ?auto_38402 - DIRECTION
      ?auto_38403 - MODE
    )
    :vars
    (
      ?auto_38405 - INSTRUMENT
      ?auto_38406 - SATELLITE
      ?auto_38404 - DIRECTION
      ?auto_38407 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38405 ?auto_38406 ) ( SUPPORTS ?auto_38405 ?auto_38398 ) ( not ( = ?auto_38397 ?auto_38404 ) ) ( HAVE_IMAGE ?auto_38402 ?auto_38403 ) ( not ( = ?auto_38402 ?auto_38397 ) ) ( not ( = ?auto_38402 ?auto_38404 ) ) ( not ( = ?auto_38403 ?auto_38398 ) ) ( CALIBRATION_TARGET ?auto_38405 ?auto_38404 ) ( POINTING ?auto_38406 ?auto_38399 ) ( not ( = ?auto_38404 ?auto_38399 ) ) ( not ( = ?auto_38397 ?auto_38399 ) ) ( not ( = ?auto_38402 ?auto_38399 ) ) ( ON_BOARD ?auto_38407 ?auto_38406 ) ( POWER_ON ?auto_38407 ) ( not ( = ?auto_38405 ?auto_38407 ) ) ( HAVE_IMAGE ?auto_38399 ?auto_38396 ) ( HAVE_IMAGE ?auto_38400 ?auto_38401 ) ( not ( = ?auto_38397 ?auto_38400 ) ) ( not ( = ?auto_38398 ?auto_38396 ) ) ( not ( = ?auto_38398 ?auto_38401 ) ) ( not ( = ?auto_38399 ?auto_38400 ) ) ( not ( = ?auto_38396 ?auto_38401 ) ) ( not ( = ?auto_38396 ?auto_38403 ) ) ( not ( = ?auto_38400 ?auto_38402 ) ) ( not ( = ?auto_38400 ?auto_38404 ) ) ( not ( = ?auto_38401 ?auto_38403 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38402 ?auto_38403 ?auto_38397 ?auto_38398 )
      ( GET-4IMAGE-VERIFY ?auto_38397 ?auto_38398 ?auto_38399 ?auto_38396 ?auto_38400 ?auto_38401 ?auto_38402 ?auto_38403 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38409 - DIRECTION
      ?auto_38410 - MODE
      ?auto_38411 - DIRECTION
      ?auto_38408 - MODE
      ?auto_38412 - DIRECTION
      ?auto_38413 - MODE
      ?auto_38414 - DIRECTION
      ?auto_38415 - MODE
    )
    :vars
    (
      ?auto_38417 - INSTRUMENT
      ?auto_38419 - SATELLITE
      ?auto_38416 - DIRECTION
      ?auto_38418 - DIRECTION
      ?auto_38421 - MODE
      ?auto_38420 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38417 ?auto_38419 ) ( SUPPORTS ?auto_38417 ?auto_38410 ) ( not ( = ?auto_38409 ?auto_38416 ) ) ( HAVE_IMAGE ?auto_38418 ?auto_38421 ) ( not ( = ?auto_38418 ?auto_38409 ) ) ( not ( = ?auto_38418 ?auto_38416 ) ) ( not ( = ?auto_38421 ?auto_38410 ) ) ( CALIBRATION_TARGET ?auto_38417 ?auto_38416 ) ( POINTING ?auto_38419 ?auto_38412 ) ( not ( = ?auto_38416 ?auto_38412 ) ) ( not ( = ?auto_38409 ?auto_38412 ) ) ( not ( = ?auto_38418 ?auto_38412 ) ) ( ON_BOARD ?auto_38420 ?auto_38419 ) ( POWER_ON ?auto_38420 ) ( not ( = ?auto_38417 ?auto_38420 ) ) ( HAVE_IMAGE ?auto_38411 ?auto_38408 ) ( HAVE_IMAGE ?auto_38412 ?auto_38413 ) ( HAVE_IMAGE ?auto_38414 ?auto_38415 ) ( not ( = ?auto_38409 ?auto_38411 ) ) ( not ( = ?auto_38409 ?auto_38414 ) ) ( not ( = ?auto_38410 ?auto_38408 ) ) ( not ( = ?auto_38410 ?auto_38413 ) ) ( not ( = ?auto_38410 ?auto_38415 ) ) ( not ( = ?auto_38411 ?auto_38412 ) ) ( not ( = ?auto_38411 ?auto_38414 ) ) ( not ( = ?auto_38411 ?auto_38416 ) ) ( not ( = ?auto_38411 ?auto_38418 ) ) ( not ( = ?auto_38408 ?auto_38413 ) ) ( not ( = ?auto_38408 ?auto_38415 ) ) ( not ( = ?auto_38408 ?auto_38421 ) ) ( not ( = ?auto_38412 ?auto_38414 ) ) ( not ( = ?auto_38413 ?auto_38415 ) ) ( not ( = ?auto_38413 ?auto_38421 ) ) ( not ( = ?auto_38414 ?auto_38416 ) ) ( not ( = ?auto_38414 ?auto_38418 ) ) ( not ( = ?auto_38415 ?auto_38421 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38418 ?auto_38421 ?auto_38409 ?auto_38410 )
      ( GET-4IMAGE-VERIFY ?auto_38409 ?auto_38410 ?auto_38411 ?auto_38408 ?auto_38412 ?auto_38413 ?auto_38414 ?auto_38415 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_38659 - DIRECTION
      ?auto_38660 - MODE
      ?auto_38661 - DIRECTION
      ?auto_38658 - MODE
      ?auto_38662 - DIRECTION
      ?auto_38663 - MODE
    )
    :vars
    (
      ?auto_38664 - INSTRUMENT
      ?auto_38668 - SATELLITE
      ?auto_38665 - DIRECTION
      ?auto_38666 - DIRECTION
      ?auto_38667 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38664 ?auto_38668 ) ( SUPPORTS ?auto_38664 ?auto_38658 ) ( not ( = ?auto_38661 ?auto_38665 ) ) ( HAVE_IMAGE ?auto_38659 ?auto_38660 ) ( not ( = ?auto_38659 ?auto_38661 ) ) ( not ( = ?auto_38659 ?auto_38665 ) ) ( not ( = ?auto_38660 ?auto_38658 ) ) ( CALIBRATION_TARGET ?auto_38664 ?auto_38665 ) ( POINTING ?auto_38668 ?auto_38666 ) ( not ( = ?auto_38665 ?auto_38666 ) ) ( not ( = ?auto_38661 ?auto_38666 ) ) ( not ( = ?auto_38659 ?auto_38666 ) ) ( ON_BOARD ?auto_38667 ?auto_38668 ) ( POWER_ON ?auto_38667 ) ( not ( = ?auto_38664 ?auto_38667 ) ) ( HAVE_IMAGE ?auto_38662 ?auto_38663 ) ( not ( = ?auto_38659 ?auto_38662 ) ) ( not ( = ?auto_38660 ?auto_38663 ) ) ( not ( = ?auto_38661 ?auto_38662 ) ) ( not ( = ?auto_38658 ?auto_38663 ) ) ( not ( = ?auto_38662 ?auto_38665 ) ) ( not ( = ?auto_38662 ?auto_38666 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38659 ?auto_38660 ?auto_38661 ?auto_38658 )
      ( GET-3IMAGE-VERIFY ?auto_38659 ?auto_38660 ?auto_38661 ?auto_38658 ?auto_38662 ?auto_38663 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_38747 - DIRECTION
      ?auto_38748 - MODE
      ?auto_38749 - DIRECTION
      ?auto_38746 - MODE
      ?auto_38750 - DIRECTION
      ?auto_38751 - MODE
    )
    :vars
    (
      ?auto_38752 - INSTRUMENT
      ?auto_38756 - SATELLITE
      ?auto_38753 - DIRECTION
      ?auto_38754 - DIRECTION
      ?auto_38755 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38752 ?auto_38756 ) ( SUPPORTS ?auto_38752 ?auto_38748 ) ( not ( = ?auto_38747 ?auto_38753 ) ) ( HAVE_IMAGE ?auto_38749 ?auto_38746 ) ( not ( = ?auto_38749 ?auto_38747 ) ) ( not ( = ?auto_38749 ?auto_38753 ) ) ( not ( = ?auto_38746 ?auto_38748 ) ) ( CALIBRATION_TARGET ?auto_38752 ?auto_38753 ) ( POINTING ?auto_38756 ?auto_38754 ) ( not ( = ?auto_38753 ?auto_38754 ) ) ( not ( = ?auto_38747 ?auto_38754 ) ) ( not ( = ?auto_38749 ?auto_38754 ) ) ( ON_BOARD ?auto_38755 ?auto_38756 ) ( POWER_ON ?auto_38755 ) ( not ( = ?auto_38752 ?auto_38755 ) ) ( HAVE_IMAGE ?auto_38750 ?auto_38751 ) ( not ( = ?auto_38747 ?auto_38750 ) ) ( not ( = ?auto_38748 ?auto_38751 ) ) ( not ( = ?auto_38749 ?auto_38750 ) ) ( not ( = ?auto_38746 ?auto_38751 ) ) ( not ( = ?auto_38750 ?auto_38753 ) ) ( not ( = ?auto_38750 ?auto_38754 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38749 ?auto_38746 ?auto_38747 ?auto_38748 )
      ( GET-3IMAGE-VERIFY ?auto_38747 ?auto_38748 ?auto_38749 ?auto_38746 ?auto_38750 ?auto_38751 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38849 - DIRECTION
      ?auto_38850 - MODE
      ?auto_38851 - DIRECTION
      ?auto_38848 - MODE
      ?auto_38852 - DIRECTION
      ?auto_38853 - MODE
      ?auto_38854 - DIRECTION
      ?auto_38855 - MODE
    )
    :vars
    (
      ?auto_38856 - INSTRUMENT
      ?auto_38860 - SATELLITE
      ?auto_38857 - DIRECTION
      ?auto_38858 - DIRECTION
      ?auto_38859 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38856 ?auto_38860 ) ( SUPPORTS ?auto_38856 ?auto_38855 ) ( not ( = ?auto_38854 ?auto_38857 ) ) ( HAVE_IMAGE ?auto_38852 ?auto_38853 ) ( not ( = ?auto_38852 ?auto_38854 ) ) ( not ( = ?auto_38852 ?auto_38857 ) ) ( not ( = ?auto_38853 ?auto_38855 ) ) ( CALIBRATION_TARGET ?auto_38856 ?auto_38857 ) ( POINTING ?auto_38860 ?auto_38858 ) ( not ( = ?auto_38857 ?auto_38858 ) ) ( not ( = ?auto_38854 ?auto_38858 ) ) ( not ( = ?auto_38852 ?auto_38858 ) ) ( ON_BOARD ?auto_38859 ?auto_38860 ) ( POWER_ON ?auto_38859 ) ( not ( = ?auto_38856 ?auto_38859 ) ) ( HAVE_IMAGE ?auto_38849 ?auto_38850 ) ( HAVE_IMAGE ?auto_38851 ?auto_38848 ) ( not ( = ?auto_38849 ?auto_38851 ) ) ( not ( = ?auto_38849 ?auto_38852 ) ) ( not ( = ?auto_38849 ?auto_38854 ) ) ( not ( = ?auto_38849 ?auto_38857 ) ) ( not ( = ?auto_38849 ?auto_38858 ) ) ( not ( = ?auto_38850 ?auto_38848 ) ) ( not ( = ?auto_38850 ?auto_38853 ) ) ( not ( = ?auto_38850 ?auto_38855 ) ) ( not ( = ?auto_38851 ?auto_38852 ) ) ( not ( = ?auto_38851 ?auto_38854 ) ) ( not ( = ?auto_38851 ?auto_38857 ) ) ( not ( = ?auto_38851 ?auto_38858 ) ) ( not ( = ?auto_38848 ?auto_38853 ) ) ( not ( = ?auto_38848 ?auto_38855 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38852 ?auto_38853 ?auto_38854 ?auto_38855 )
      ( GET-4IMAGE-VERIFY ?auto_38849 ?auto_38850 ?auto_38851 ?auto_38848 ?auto_38852 ?auto_38853 ?auto_38854 ?auto_38855 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_38874 - DIRECTION
      ?auto_38875 - MODE
      ?auto_38876 - DIRECTION
      ?auto_38873 - MODE
      ?auto_38877 - DIRECTION
      ?auto_38878 - MODE
      ?auto_38879 - DIRECTION
      ?auto_38880 - MODE
    )
    :vars
    (
      ?auto_38881 - INSTRUMENT
      ?auto_38885 - SATELLITE
      ?auto_38882 - DIRECTION
      ?auto_38883 - DIRECTION
      ?auto_38884 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_38881 ?auto_38885 ) ( SUPPORTS ?auto_38881 ?auto_38878 ) ( not ( = ?auto_38877 ?auto_38882 ) ) ( HAVE_IMAGE ?auto_38874 ?auto_38880 ) ( not ( = ?auto_38874 ?auto_38877 ) ) ( not ( = ?auto_38874 ?auto_38882 ) ) ( not ( = ?auto_38880 ?auto_38878 ) ) ( CALIBRATION_TARGET ?auto_38881 ?auto_38882 ) ( POINTING ?auto_38885 ?auto_38883 ) ( not ( = ?auto_38882 ?auto_38883 ) ) ( not ( = ?auto_38877 ?auto_38883 ) ) ( not ( = ?auto_38874 ?auto_38883 ) ) ( ON_BOARD ?auto_38884 ?auto_38885 ) ( POWER_ON ?auto_38884 ) ( not ( = ?auto_38881 ?auto_38884 ) ) ( HAVE_IMAGE ?auto_38874 ?auto_38875 ) ( HAVE_IMAGE ?auto_38876 ?auto_38873 ) ( HAVE_IMAGE ?auto_38879 ?auto_38880 ) ( not ( = ?auto_38874 ?auto_38876 ) ) ( not ( = ?auto_38874 ?auto_38879 ) ) ( not ( = ?auto_38875 ?auto_38873 ) ) ( not ( = ?auto_38875 ?auto_38878 ) ) ( not ( = ?auto_38875 ?auto_38880 ) ) ( not ( = ?auto_38876 ?auto_38877 ) ) ( not ( = ?auto_38876 ?auto_38879 ) ) ( not ( = ?auto_38876 ?auto_38882 ) ) ( not ( = ?auto_38876 ?auto_38883 ) ) ( not ( = ?auto_38873 ?auto_38878 ) ) ( not ( = ?auto_38873 ?auto_38880 ) ) ( not ( = ?auto_38877 ?auto_38879 ) ) ( not ( = ?auto_38879 ?auto_38882 ) ) ( not ( = ?auto_38879 ?auto_38883 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_38874 ?auto_38880 ?auto_38877 ?auto_38878 )
      ( GET-4IMAGE-VERIFY ?auto_38874 ?auto_38875 ?auto_38876 ?auto_38873 ?auto_38877 ?auto_38878 ?auto_38879 ?auto_38880 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_39326 - DIRECTION
      ?auto_39327 - MODE
      ?auto_39328 - DIRECTION
      ?auto_39325 - MODE
      ?auto_39329 - DIRECTION
      ?auto_39330 - MODE
      ?auto_39331 - DIRECTION
      ?auto_39332 - MODE
    )
    :vars
    (
      ?auto_39333 - INSTRUMENT
      ?auto_39337 - SATELLITE
      ?auto_39334 - DIRECTION
      ?auto_39335 - DIRECTION
      ?auto_39336 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_39333 ?auto_39337 ) ( SUPPORTS ?auto_39333 ?auto_39327 ) ( not ( = ?auto_39326 ?auto_39334 ) ) ( HAVE_IMAGE ?auto_39328 ?auto_39330 ) ( not ( = ?auto_39328 ?auto_39326 ) ) ( not ( = ?auto_39328 ?auto_39334 ) ) ( not ( = ?auto_39330 ?auto_39327 ) ) ( CALIBRATION_TARGET ?auto_39333 ?auto_39334 ) ( POINTING ?auto_39337 ?auto_39335 ) ( not ( = ?auto_39334 ?auto_39335 ) ) ( not ( = ?auto_39326 ?auto_39335 ) ) ( not ( = ?auto_39328 ?auto_39335 ) ) ( ON_BOARD ?auto_39336 ?auto_39337 ) ( POWER_ON ?auto_39336 ) ( not ( = ?auto_39333 ?auto_39336 ) ) ( HAVE_IMAGE ?auto_39328 ?auto_39325 ) ( HAVE_IMAGE ?auto_39329 ?auto_39330 ) ( HAVE_IMAGE ?auto_39331 ?auto_39332 ) ( not ( = ?auto_39326 ?auto_39329 ) ) ( not ( = ?auto_39326 ?auto_39331 ) ) ( not ( = ?auto_39327 ?auto_39325 ) ) ( not ( = ?auto_39327 ?auto_39332 ) ) ( not ( = ?auto_39328 ?auto_39329 ) ) ( not ( = ?auto_39328 ?auto_39331 ) ) ( not ( = ?auto_39325 ?auto_39330 ) ) ( not ( = ?auto_39325 ?auto_39332 ) ) ( not ( = ?auto_39329 ?auto_39331 ) ) ( not ( = ?auto_39329 ?auto_39334 ) ) ( not ( = ?auto_39329 ?auto_39335 ) ) ( not ( = ?auto_39330 ?auto_39332 ) ) ( not ( = ?auto_39331 ?auto_39334 ) ) ( not ( = ?auto_39331 ?auto_39335 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_39328 ?auto_39330 ?auto_39326 ?auto_39327 )
      ( GET-4IMAGE-VERIFY ?auto_39326 ?auto_39327 ?auto_39328 ?auto_39325 ?auto_39329 ?auto_39330 ?auto_39331 ?auto_39332 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_39673 - DIRECTION
      ?auto_39674 - MODE
    )
    :vars
    (
      ?auto_39677 - INSTRUMENT
      ?auto_39681 - SATELLITE
      ?auto_39678 - DIRECTION
      ?auto_39676 - DIRECTION
      ?auto_39675 - MODE
      ?auto_39679 - DIRECTION
      ?auto_39680 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_39677 ?auto_39681 ) ( SUPPORTS ?auto_39677 ?auto_39674 ) ( not ( = ?auto_39673 ?auto_39678 ) ) ( HAVE_IMAGE ?auto_39676 ?auto_39675 ) ( not ( = ?auto_39676 ?auto_39673 ) ) ( not ( = ?auto_39676 ?auto_39678 ) ) ( not ( = ?auto_39675 ?auto_39674 ) ) ( CALIBRATION_TARGET ?auto_39677 ?auto_39678 ) ( not ( = ?auto_39678 ?auto_39679 ) ) ( not ( = ?auto_39673 ?auto_39679 ) ) ( not ( = ?auto_39676 ?auto_39679 ) ) ( ON_BOARD ?auto_39680 ?auto_39681 ) ( POWER_ON ?auto_39680 ) ( not ( = ?auto_39677 ?auto_39680 ) ) ( POINTING ?auto_39681 ?auto_39678 ) )
    :subtasks
    ( ( !TURN_TO ?auto_39681 ?auto_39679 ?auto_39678 )
      ( GET-2IMAGE ?auto_39676 ?auto_39675 ?auto_39673 ?auto_39674 )
      ( GET-1IMAGE-VERIFY ?auto_39673 ?auto_39674 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_39683 - DIRECTION
      ?auto_39684 - MODE
      ?auto_39685 - DIRECTION
      ?auto_39682 - MODE
    )
    :vars
    (
      ?auto_39689 - INSTRUMENT
      ?auto_39687 - SATELLITE
      ?auto_39688 - DIRECTION
      ?auto_39686 - DIRECTION
      ?auto_39690 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_39689 ?auto_39687 ) ( SUPPORTS ?auto_39689 ?auto_39682 ) ( not ( = ?auto_39685 ?auto_39688 ) ) ( HAVE_IMAGE ?auto_39683 ?auto_39684 ) ( not ( = ?auto_39683 ?auto_39685 ) ) ( not ( = ?auto_39683 ?auto_39688 ) ) ( not ( = ?auto_39684 ?auto_39682 ) ) ( CALIBRATION_TARGET ?auto_39689 ?auto_39688 ) ( not ( = ?auto_39688 ?auto_39686 ) ) ( not ( = ?auto_39685 ?auto_39686 ) ) ( not ( = ?auto_39683 ?auto_39686 ) ) ( ON_BOARD ?auto_39690 ?auto_39687 ) ( POWER_ON ?auto_39690 ) ( not ( = ?auto_39689 ?auto_39690 ) ) ( POINTING ?auto_39687 ?auto_39688 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_39685 ?auto_39682 )
      ( GET-2IMAGE-VERIFY ?auto_39683 ?auto_39684 ?auto_39685 ?auto_39682 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_39702 - DIRECTION
      ?auto_39703 - MODE
      ?auto_39704 - DIRECTION
      ?auto_39701 - MODE
    )
    :vars
    (
      ?auto_39709 - INSTRUMENT
      ?auto_39708 - SATELLITE
      ?auto_39705 - DIRECTION
      ?auto_39706 - DIRECTION
      ?auto_39707 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_39709 ?auto_39708 ) ( SUPPORTS ?auto_39709 ?auto_39703 ) ( not ( = ?auto_39702 ?auto_39705 ) ) ( HAVE_IMAGE ?auto_39704 ?auto_39701 ) ( not ( = ?auto_39704 ?auto_39702 ) ) ( not ( = ?auto_39704 ?auto_39705 ) ) ( not ( = ?auto_39701 ?auto_39703 ) ) ( CALIBRATION_TARGET ?auto_39709 ?auto_39705 ) ( not ( = ?auto_39705 ?auto_39706 ) ) ( not ( = ?auto_39702 ?auto_39706 ) ) ( not ( = ?auto_39704 ?auto_39706 ) ) ( ON_BOARD ?auto_39707 ?auto_39708 ) ( POWER_ON ?auto_39707 ) ( not ( = ?auto_39709 ?auto_39707 ) ) ( POINTING ?auto_39708 ?auto_39705 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_39704 ?auto_39701 ?auto_39702 ?auto_39703 )
      ( GET-2IMAGE-VERIFY ?auto_39702 ?auto_39703 ?auto_39704 ?auto_39701 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_39732 - DIRECTION
      ?auto_39733 - MODE
      ?auto_39734 - DIRECTION
      ?auto_39731 - MODE
      ?auto_39735 - DIRECTION
      ?auto_39736 - MODE
    )
    :vars
    (
      ?auto_39741 - INSTRUMENT
      ?auto_39740 - SATELLITE
      ?auto_39737 - DIRECTION
      ?auto_39738 - DIRECTION
      ?auto_39739 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_39741 ?auto_39740 ) ( SUPPORTS ?auto_39741 ?auto_39736 ) ( not ( = ?auto_39735 ?auto_39737 ) ) ( HAVE_IMAGE ?auto_39734 ?auto_39731 ) ( not ( = ?auto_39734 ?auto_39735 ) ) ( not ( = ?auto_39734 ?auto_39737 ) ) ( not ( = ?auto_39731 ?auto_39736 ) ) ( CALIBRATION_TARGET ?auto_39741 ?auto_39737 ) ( not ( = ?auto_39737 ?auto_39738 ) ) ( not ( = ?auto_39735 ?auto_39738 ) ) ( not ( = ?auto_39734 ?auto_39738 ) ) ( ON_BOARD ?auto_39739 ?auto_39740 ) ( POWER_ON ?auto_39739 ) ( not ( = ?auto_39741 ?auto_39739 ) ) ( POINTING ?auto_39740 ?auto_39737 ) ( HAVE_IMAGE ?auto_39732 ?auto_39733 ) ( not ( = ?auto_39732 ?auto_39734 ) ) ( not ( = ?auto_39732 ?auto_39735 ) ) ( not ( = ?auto_39732 ?auto_39737 ) ) ( not ( = ?auto_39732 ?auto_39738 ) ) ( not ( = ?auto_39733 ?auto_39731 ) ) ( not ( = ?auto_39733 ?auto_39736 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_39734 ?auto_39731 ?auto_39735 ?auto_39736 )
      ( GET-3IMAGE-VERIFY ?auto_39732 ?auto_39733 ?auto_39734 ?auto_39731 ?auto_39735 ?auto_39736 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_71347 - DIRECTION
      ?auto_71348 - MODE
      ?auto_71349 - DIRECTION
      ?auto_71346 - MODE
      ?auto_71350 - DIRECTION
      ?auto_71351 - MODE
    )
    :vars
    (
      ?auto_71353 - INSTRUMENT
      ?auto_71354 - SATELLITE
      ?auto_71352 - DIRECTION
      ?auto_71355 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_71353 ?auto_71354 ) ( SUPPORTS ?auto_71353 ?auto_71346 ) ( not ( = ?auto_71349 ?auto_71352 ) ) ( HAVE_IMAGE ?auto_71347 ?auto_71348 ) ( not ( = ?auto_71347 ?auto_71349 ) ) ( not ( = ?auto_71347 ?auto_71352 ) ) ( not ( = ?auto_71348 ?auto_71346 ) ) ( CALIBRATION_TARGET ?auto_71353 ?auto_71352 ) ( not ( = ?auto_71352 ?auto_71350 ) ) ( not ( = ?auto_71349 ?auto_71350 ) ) ( not ( = ?auto_71347 ?auto_71350 ) ) ( ON_BOARD ?auto_71355 ?auto_71354 ) ( POWER_ON ?auto_71355 ) ( not ( = ?auto_71353 ?auto_71355 ) ) ( POINTING ?auto_71354 ?auto_71352 ) ( HAVE_IMAGE ?auto_71350 ?auto_71351 ) ( not ( = ?auto_71348 ?auto_71351 ) ) ( not ( = ?auto_71346 ?auto_71351 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_71347 ?auto_71348 ?auto_71349 ?auto_71346 )
      ( GET-3IMAGE-VERIFY ?auto_71347 ?auto_71348 ?auto_71349 ?auto_71346 ?auto_71350 ?auto_71351 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_39841 - DIRECTION
      ?auto_39842 - MODE
      ?auto_39843 - DIRECTION
      ?auto_39840 - MODE
      ?auto_39844 - DIRECTION
      ?auto_39845 - MODE
    )
    :vars
    (
      ?auto_39850 - INSTRUMENT
      ?auto_39849 - SATELLITE
      ?auto_39846 - DIRECTION
      ?auto_39847 - DIRECTION
      ?auto_39848 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_39850 ?auto_39849 ) ( SUPPORTS ?auto_39850 ?auto_39842 ) ( not ( = ?auto_39841 ?auto_39846 ) ) ( HAVE_IMAGE ?auto_39844 ?auto_39845 ) ( not ( = ?auto_39844 ?auto_39841 ) ) ( not ( = ?auto_39844 ?auto_39846 ) ) ( not ( = ?auto_39845 ?auto_39842 ) ) ( CALIBRATION_TARGET ?auto_39850 ?auto_39846 ) ( not ( = ?auto_39846 ?auto_39847 ) ) ( not ( = ?auto_39841 ?auto_39847 ) ) ( not ( = ?auto_39844 ?auto_39847 ) ) ( ON_BOARD ?auto_39848 ?auto_39849 ) ( POWER_ON ?auto_39848 ) ( not ( = ?auto_39850 ?auto_39848 ) ) ( POINTING ?auto_39849 ?auto_39846 ) ( HAVE_IMAGE ?auto_39843 ?auto_39840 ) ( not ( = ?auto_39841 ?auto_39843 ) ) ( not ( = ?auto_39842 ?auto_39840 ) ) ( not ( = ?auto_39843 ?auto_39844 ) ) ( not ( = ?auto_39843 ?auto_39846 ) ) ( not ( = ?auto_39843 ?auto_39847 ) ) ( not ( = ?auto_39840 ?auto_39845 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_39844 ?auto_39845 ?auto_39841 ?auto_39842 )
      ( GET-3IMAGE-VERIFY ?auto_39841 ?auto_39842 ?auto_39843 ?auto_39840 ?auto_39844 ?auto_39845 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_39943 - DIRECTION
      ?auto_39944 - MODE
      ?auto_39945 - DIRECTION
      ?auto_39942 - MODE
      ?auto_39946 - DIRECTION
      ?auto_39947 - MODE
      ?auto_39948 - DIRECTION
      ?auto_39949 - MODE
    )
    :vars
    (
      ?auto_39954 - INSTRUMENT
      ?auto_39953 - SATELLITE
      ?auto_39950 - DIRECTION
      ?auto_39951 - DIRECTION
      ?auto_39952 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_39954 ?auto_39953 ) ( SUPPORTS ?auto_39954 ?auto_39949 ) ( not ( = ?auto_39948 ?auto_39950 ) ) ( HAVE_IMAGE ?auto_39943 ?auto_39942 ) ( not ( = ?auto_39943 ?auto_39948 ) ) ( not ( = ?auto_39943 ?auto_39950 ) ) ( not ( = ?auto_39942 ?auto_39949 ) ) ( CALIBRATION_TARGET ?auto_39954 ?auto_39950 ) ( not ( = ?auto_39950 ?auto_39951 ) ) ( not ( = ?auto_39948 ?auto_39951 ) ) ( not ( = ?auto_39943 ?auto_39951 ) ) ( ON_BOARD ?auto_39952 ?auto_39953 ) ( POWER_ON ?auto_39952 ) ( not ( = ?auto_39954 ?auto_39952 ) ) ( POINTING ?auto_39953 ?auto_39950 ) ( HAVE_IMAGE ?auto_39943 ?auto_39944 ) ( HAVE_IMAGE ?auto_39945 ?auto_39942 ) ( HAVE_IMAGE ?auto_39946 ?auto_39947 ) ( not ( = ?auto_39943 ?auto_39945 ) ) ( not ( = ?auto_39943 ?auto_39946 ) ) ( not ( = ?auto_39944 ?auto_39942 ) ) ( not ( = ?auto_39944 ?auto_39947 ) ) ( not ( = ?auto_39944 ?auto_39949 ) ) ( not ( = ?auto_39945 ?auto_39946 ) ) ( not ( = ?auto_39945 ?auto_39948 ) ) ( not ( = ?auto_39945 ?auto_39950 ) ) ( not ( = ?auto_39945 ?auto_39951 ) ) ( not ( = ?auto_39942 ?auto_39947 ) ) ( not ( = ?auto_39946 ?auto_39948 ) ) ( not ( = ?auto_39946 ?auto_39950 ) ) ( not ( = ?auto_39946 ?auto_39951 ) ) ( not ( = ?auto_39947 ?auto_39949 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_39943 ?auto_39942 ?auto_39948 ?auto_39949 )
      ( GET-4IMAGE-VERIFY ?auto_39943 ?auto_39944 ?auto_39945 ?auto_39942 ?auto_39946 ?auto_39947 ?auto_39948 ?auto_39949 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_71844 - DIRECTION
      ?auto_71845 - MODE
      ?auto_71846 - DIRECTION
      ?auto_71843 - MODE
      ?auto_71847 - DIRECTION
      ?auto_71848 - MODE
      ?auto_71849 - DIRECTION
      ?auto_71850 - MODE
    )
    :vars
    (
      ?auto_71852 - INSTRUMENT
      ?auto_71853 - SATELLITE
      ?auto_71851 - DIRECTION
      ?auto_71854 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_71852 ?auto_71853 ) ( SUPPORTS ?auto_71852 ?auto_71848 ) ( not ( = ?auto_71847 ?auto_71851 ) ) ( HAVE_IMAGE ?auto_71844 ?auto_71850 ) ( not ( = ?auto_71844 ?auto_71847 ) ) ( not ( = ?auto_71844 ?auto_71851 ) ) ( not ( = ?auto_71850 ?auto_71848 ) ) ( CALIBRATION_TARGET ?auto_71852 ?auto_71851 ) ( not ( = ?auto_71851 ?auto_71846 ) ) ( not ( = ?auto_71847 ?auto_71846 ) ) ( not ( = ?auto_71844 ?auto_71846 ) ) ( ON_BOARD ?auto_71854 ?auto_71853 ) ( POWER_ON ?auto_71854 ) ( not ( = ?auto_71852 ?auto_71854 ) ) ( POINTING ?auto_71853 ?auto_71851 ) ( HAVE_IMAGE ?auto_71844 ?auto_71845 ) ( HAVE_IMAGE ?auto_71846 ?auto_71843 ) ( HAVE_IMAGE ?auto_71849 ?auto_71850 ) ( not ( = ?auto_71844 ?auto_71849 ) ) ( not ( = ?auto_71845 ?auto_71843 ) ) ( not ( = ?auto_71845 ?auto_71848 ) ) ( not ( = ?auto_71845 ?auto_71850 ) ) ( not ( = ?auto_71846 ?auto_71849 ) ) ( not ( = ?auto_71843 ?auto_71848 ) ) ( not ( = ?auto_71843 ?auto_71850 ) ) ( not ( = ?auto_71847 ?auto_71849 ) ) ( not ( = ?auto_71849 ?auto_71851 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_71844 ?auto_71850 ?auto_71847 ?auto_71848 )
      ( GET-4IMAGE-VERIFY ?auto_71844 ?auto_71845 ?auto_71846 ?auto_71843 ?auto_71847 ?auto_71848 ?auto_71849 ?auto_71850 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_71994 - DIRECTION
      ?auto_71995 - MODE
      ?auto_71996 - DIRECTION
      ?auto_71993 - MODE
      ?auto_71997 - DIRECTION
      ?auto_71998 - MODE
      ?auto_71999 - DIRECTION
      ?auto_72000 - MODE
    )
    :vars
    (
      ?auto_72002 - INSTRUMENT
      ?auto_72003 - SATELLITE
      ?auto_72001 - DIRECTION
      ?auto_72004 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_72002 ?auto_72003 ) ( SUPPORTS ?auto_72002 ?auto_71993 ) ( not ( = ?auto_71996 ?auto_72001 ) ) ( HAVE_IMAGE ?auto_71994 ?auto_71995 ) ( not ( = ?auto_71994 ?auto_71996 ) ) ( not ( = ?auto_71994 ?auto_72001 ) ) ( not ( = ?auto_71995 ?auto_71993 ) ) ( CALIBRATION_TARGET ?auto_72002 ?auto_72001 ) ( not ( = ?auto_72001 ?auto_71999 ) ) ( not ( = ?auto_71996 ?auto_71999 ) ) ( not ( = ?auto_71994 ?auto_71999 ) ) ( ON_BOARD ?auto_72004 ?auto_72003 ) ( POWER_ON ?auto_72004 ) ( not ( = ?auto_72002 ?auto_72004 ) ) ( POINTING ?auto_72003 ?auto_72001 ) ( HAVE_IMAGE ?auto_71997 ?auto_71998 ) ( HAVE_IMAGE ?auto_71999 ?auto_72000 ) ( not ( = ?auto_71994 ?auto_71997 ) ) ( not ( = ?auto_71995 ?auto_71998 ) ) ( not ( = ?auto_71995 ?auto_72000 ) ) ( not ( = ?auto_71996 ?auto_71997 ) ) ( not ( = ?auto_71993 ?auto_71998 ) ) ( not ( = ?auto_71993 ?auto_72000 ) ) ( not ( = ?auto_71997 ?auto_71999 ) ) ( not ( = ?auto_71997 ?auto_72001 ) ) ( not ( = ?auto_71998 ?auto_72000 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_71994 ?auto_71995 ?auto_71996 ?auto_71993 )
      ( GET-4IMAGE-VERIFY ?auto_71994 ?auto_71995 ?auto_71996 ?auto_71993 ?auto_71997 ?auto_71998 ?auto_71999 ?auto_72000 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_73228 - DIRECTION
      ?auto_73229 - MODE
      ?auto_73230 - DIRECTION
      ?auto_73227 - MODE
      ?auto_73231 - DIRECTION
      ?auto_73232 - MODE
      ?auto_73233 - DIRECTION
      ?auto_73234 - MODE
    )
    :vars
    (
      ?auto_73236 - INSTRUMENT
      ?auto_73237 - SATELLITE
      ?auto_73235 - DIRECTION
      ?auto_73238 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_73236 ?auto_73237 ) ( SUPPORTS ?auto_73236 ?auto_73229 ) ( not ( = ?auto_73228 ?auto_73235 ) ) ( HAVE_IMAGE ?auto_73230 ?auto_73227 ) ( not ( = ?auto_73230 ?auto_73228 ) ) ( not ( = ?auto_73230 ?auto_73235 ) ) ( not ( = ?auto_73227 ?auto_73229 ) ) ( CALIBRATION_TARGET ?auto_73236 ?auto_73235 ) ( not ( = ?auto_73235 ?auto_73233 ) ) ( not ( = ?auto_73228 ?auto_73233 ) ) ( not ( = ?auto_73230 ?auto_73233 ) ) ( ON_BOARD ?auto_73238 ?auto_73237 ) ( POWER_ON ?auto_73238 ) ( not ( = ?auto_73236 ?auto_73238 ) ) ( POINTING ?auto_73237 ?auto_73235 ) ( HAVE_IMAGE ?auto_73231 ?auto_73232 ) ( HAVE_IMAGE ?auto_73233 ?auto_73234 ) ( not ( = ?auto_73228 ?auto_73231 ) ) ( not ( = ?auto_73229 ?auto_73232 ) ) ( not ( = ?auto_73229 ?auto_73234 ) ) ( not ( = ?auto_73230 ?auto_73231 ) ) ( not ( = ?auto_73227 ?auto_73232 ) ) ( not ( = ?auto_73227 ?auto_73234 ) ) ( not ( = ?auto_73231 ?auto_73233 ) ) ( not ( = ?auto_73231 ?auto_73235 ) ) ( not ( = ?auto_73232 ?auto_73234 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_73230 ?auto_73227 ?auto_73228 ?auto_73229 )
      ( GET-4IMAGE-VERIFY ?auto_73228 ?auto_73229 ?auto_73230 ?auto_73227 ?auto_73231 ?auto_73232 ?auto_73233 ?auto_73234 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_41899 - DIRECTION
      ?auto_41900 - MODE
      ?auto_41901 - DIRECTION
      ?auto_41898 - MODE
      ?auto_41902 - DIRECTION
      ?auto_41903 - MODE
    )
    :vars
    (
      ?auto_41905 - INSTRUMENT
      ?auto_41906 - SATELLITE
      ?auto_41904 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_41905 ?auto_41906 ) ( SUPPORTS ?auto_41905 ?auto_41903 ) ( POINTING ?auto_41906 ?auto_41904 ) ( not ( = ?auto_41902 ?auto_41904 ) ) ( HAVE_IMAGE ?auto_41899 ?auto_41898 ) ( not ( = ?auto_41899 ?auto_41902 ) ) ( not ( = ?auto_41899 ?auto_41904 ) ) ( not ( = ?auto_41898 ?auto_41903 ) ) ( CALIBRATION_TARGET ?auto_41905 ?auto_41904 ) ( POWER_AVAIL ?auto_41906 ) ( HAVE_IMAGE ?auto_41899 ?auto_41900 ) ( HAVE_IMAGE ?auto_41901 ?auto_41898 ) ( not ( = ?auto_41899 ?auto_41901 ) ) ( not ( = ?auto_41900 ?auto_41898 ) ) ( not ( = ?auto_41900 ?auto_41903 ) ) ( not ( = ?auto_41901 ?auto_41902 ) ) ( not ( = ?auto_41901 ?auto_41904 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_41899 ?auto_41898 ?auto_41902 ?auto_41903 )
      ( GET-3IMAGE-VERIFY ?auto_41899 ?auto_41900 ?auto_41901 ?auto_41898 ?auto_41902 ?auto_41903 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_41917 - DIRECTION
      ?auto_41918 - MODE
      ?auto_41919 - DIRECTION
      ?auto_41916 - MODE
      ?auto_41920 - DIRECTION
      ?auto_41921 - MODE
    )
    :vars
    (
      ?auto_41923 - INSTRUMENT
      ?auto_41924 - SATELLITE
      ?auto_41922 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_41923 ?auto_41924 ) ( SUPPORTS ?auto_41923 ?auto_41916 ) ( POINTING ?auto_41924 ?auto_41922 ) ( not ( = ?auto_41919 ?auto_41922 ) ) ( HAVE_IMAGE ?auto_41920 ?auto_41921 ) ( not ( = ?auto_41920 ?auto_41919 ) ) ( not ( = ?auto_41920 ?auto_41922 ) ) ( not ( = ?auto_41921 ?auto_41916 ) ) ( CALIBRATION_TARGET ?auto_41923 ?auto_41922 ) ( POWER_AVAIL ?auto_41924 ) ( HAVE_IMAGE ?auto_41917 ?auto_41918 ) ( not ( = ?auto_41917 ?auto_41919 ) ) ( not ( = ?auto_41917 ?auto_41920 ) ) ( not ( = ?auto_41917 ?auto_41922 ) ) ( not ( = ?auto_41918 ?auto_41916 ) ) ( not ( = ?auto_41918 ?auto_41921 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_41920 ?auto_41921 ?auto_41919 ?auto_41916 )
      ( GET-3IMAGE-VERIFY ?auto_41917 ?auto_41918 ?auto_41919 ?auto_41916 ?auto_41920 ?auto_41921 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_41995 - DIRECTION
      ?auto_41996 - MODE
      ?auto_41997 - DIRECTION
      ?auto_41994 - MODE
      ?auto_41998 - DIRECTION
      ?auto_41999 - MODE
    )
    :vars
    (
      ?auto_42001 - INSTRUMENT
      ?auto_42002 - SATELLITE
      ?auto_42000 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_42001 ?auto_42002 ) ( SUPPORTS ?auto_42001 ?auto_41996 ) ( POINTING ?auto_42002 ?auto_42000 ) ( not ( = ?auto_41995 ?auto_42000 ) ) ( HAVE_IMAGE ?auto_41997 ?auto_41994 ) ( not ( = ?auto_41997 ?auto_41995 ) ) ( not ( = ?auto_41997 ?auto_42000 ) ) ( not ( = ?auto_41994 ?auto_41996 ) ) ( CALIBRATION_TARGET ?auto_42001 ?auto_42000 ) ( POWER_AVAIL ?auto_42002 ) ( HAVE_IMAGE ?auto_41998 ?auto_41999 ) ( not ( = ?auto_41995 ?auto_41998 ) ) ( not ( = ?auto_41996 ?auto_41999 ) ) ( not ( = ?auto_41997 ?auto_41998 ) ) ( not ( = ?auto_41994 ?auto_41999 ) ) ( not ( = ?auto_41998 ?auto_42000 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_41997 ?auto_41994 ?auto_41995 ?auto_41996 )
      ( GET-3IMAGE-VERIFY ?auto_41995 ?auto_41996 ?auto_41997 ?auto_41994 ?auto_41998 ?auto_41999 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_42084 - DIRECTION
      ?auto_42085 - MODE
      ?auto_42086 - DIRECTION
      ?auto_42083 - MODE
      ?auto_42087 - DIRECTION
      ?auto_42088 - MODE
      ?auto_42089 - DIRECTION
      ?auto_42090 - MODE
    )
    :vars
    (
      ?auto_42092 - INSTRUMENT
      ?auto_42093 - SATELLITE
      ?auto_42091 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_42092 ?auto_42093 ) ( SUPPORTS ?auto_42092 ?auto_42090 ) ( POINTING ?auto_42093 ?auto_42091 ) ( not ( = ?auto_42089 ?auto_42091 ) ) ( HAVE_IMAGE ?auto_42084 ?auto_42083 ) ( not ( = ?auto_42084 ?auto_42089 ) ) ( not ( = ?auto_42084 ?auto_42091 ) ) ( not ( = ?auto_42083 ?auto_42090 ) ) ( CALIBRATION_TARGET ?auto_42092 ?auto_42091 ) ( POWER_AVAIL ?auto_42093 ) ( HAVE_IMAGE ?auto_42084 ?auto_42085 ) ( HAVE_IMAGE ?auto_42086 ?auto_42083 ) ( HAVE_IMAGE ?auto_42087 ?auto_42088 ) ( not ( = ?auto_42084 ?auto_42086 ) ) ( not ( = ?auto_42084 ?auto_42087 ) ) ( not ( = ?auto_42085 ?auto_42083 ) ) ( not ( = ?auto_42085 ?auto_42088 ) ) ( not ( = ?auto_42085 ?auto_42090 ) ) ( not ( = ?auto_42086 ?auto_42087 ) ) ( not ( = ?auto_42086 ?auto_42089 ) ) ( not ( = ?auto_42086 ?auto_42091 ) ) ( not ( = ?auto_42083 ?auto_42088 ) ) ( not ( = ?auto_42087 ?auto_42089 ) ) ( not ( = ?auto_42087 ?auto_42091 ) ) ( not ( = ?auto_42088 ?auto_42090 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_42084 ?auto_42083 ?auto_42089 ?auto_42090 )
      ( GET-4IMAGE-VERIFY ?auto_42084 ?auto_42085 ?auto_42086 ?auto_42083 ?auto_42087 ?auto_42088 ?auto_42089 ?auto_42090 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_42866 - DIRECTION
      ?auto_42867 - MODE
      ?auto_42868 - DIRECTION
      ?auto_42865 - MODE
      ?auto_42869 - DIRECTION
      ?auto_42870 - MODE
    )
    :vars
    (
      ?auto_42871 - INSTRUMENT
      ?auto_42873 - SATELLITE
      ?auto_42872 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_42871 ?auto_42873 ) ( SUPPORTS ?auto_42871 ?auto_42870 ) ( not ( = ?auto_42869 ?auto_42872 ) ) ( HAVE_IMAGE ?auto_42866 ?auto_42865 ) ( not ( = ?auto_42866 ?auto_42869 ) ) ( not ( = ?auto_42866 ?auto_42872 ) ) ( not ( = ?auto_42865 ?auto_42870 ) ) ( CALIBRATION_TARGET ?auto_42871 ?auto_42872 ) ( POWER_AVAIL ?auto_42873 ) ( POINTING ?auto_42873 ?auto_42866 ) ( HAVE_IMAGE ?auto_42866 ?auto_42867 ) ( HAVE_IMAGE ?auto_42868 ?auto_42865 ) ( not ( = ?auto_42866 ?auto_42868 ) ) ( not ( = ?auto_42867 ?auto_42865 ) ) ( not ( = ?auto_42867 ?auto_42870 ) ) ( not ( = ?auto_42868 ?auto_42869 ) ) ( not ( = ?auto_42868 ?auto_42872 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_42866 ?auto_42865 ?auto_42869 ?auto_42870 )
      ( GET-3IMAGE-VERIFY ?auto_42866 ?auto_42867 ?auto_42868 ?auto_42865 ?auto_42869 ?auto_42870 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_42884 - DIRECTION
      ?auto_42885 - MODE
      ?auto_42886 - DIRECTION
      ?auto_42883 - MODE
      ?auto_42887 - DIRECTION
      ?auto_42888 - MODE
    )
    :vars
    (
      ?auto_42889 - INSTRUMENT
      ?auto_42891 - SATELLITE
      ?auto_42890 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_42889 ?auto_42891 ) ( SUPPORTS ?auto_42889 ?auto_42883 ) ( not ( = ?auto_42886 ?auto_42890 ) ) ( HAVE_IMAGE ?auto_42887 ?auto_42888 ) ( not ( = ?auto_42887 ?auto_42886 ) ) ( not ( = ?auto_42887 ?auto_42890 ) ) ( not ( = ?auto_42888 ?auto_42883 ) ) ( CALIBRATION_TARGET ?auto_42889 ?auto_42890 ) ( POWER_AVAIL ?auto_42891 ) ( POINTING ?auto_42891 ?auto_42887 ) ( HAVE_IMAGE ?auto_42884 ?auto_42885 ) ( not ( = ?auto_42884 ?auto_42886 ) ) ( not ( = ?auto_42884 ?auto_42887 ) ) ( not ( = ?auto_42884 ?auto_42890 ) ) ( not ( = ?auto_42885 ?auto_42883 ) ) ( not ( = ?auto_42885 ?auto_42888 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_42887 ?auto_42888 ?auto_42886 ?auto_42883 )
      ( GET-3IMAGE-VERIFY ?auto_42884 ?auto_42885 ?auto_42886 ?auto_42883 ?auto_42887 ?auto_42888 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_42962 - DIRECTION
      ?auto_42963 - MODE
      ?auto_42964 - DIRECTION
      ?auto_42961 - MODE
      ?auto_42965 - DIRECTION
      ?auto_42966 - MODE
    )
    :vars
    (
      ?auto_42967 - INSTRUMENT
      ?auto_42969 - SATELLITE
      ?auto_42968 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_42967 ?auto_42969 ) ( SUPPORTS ?auto_42967 ?auto_42963 ) ( not ( = ?auto_42962 ?auto_42968 ) ) ( HAVE_IMAGE ?auto_42965 ?auto_42966 ) ( not ( = ?auto_42965 ?auto_42962 ) ) ( not ( = ?auto_42965 ?auto_42968 ) ) ( not ( = ?auto_42966 ?auto_42963 ) ) ( CALIBRATION_TARGET ?auto_42967 ?auto_42968 ) ( POWER_AVAIL ?auto_42969 ) ( POINTING ?auto_42969 ?auto_42965 ) ( HAVE_IMAGE ?auto_42964 ?auto_42961 ) ( not ( = ?auto_42962 ?auto_42964 ) ) ( not ( = ?auto_42963 ?auto_42961 ) ) ( not ( = ?auto_42964 ?auto_42965 ) ) ( not ( = ?auto_42964 ?auto_42968 ) ) ( not ( = ?auto_42961 ?auto_42966 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_42965 ?auto_42966 ?auto_42962 ?auto_42963 )
      ( GET-3IMAGE-VERIFY ?auto_42962 ?auto_42963 ?auto_42964 ?auto_42961 ?auto_42965 ?auto_42966 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_43051 - DIRECTION
      ?auto_43052 - MODE
      ?auto_43053 - DIRECTION
      ?auto_43050 - MODE
      ?auto_43054 - DIRECTION
      ?auto_43055 - MODE
      ?auto_43056 - DIRECTION
      ?auto_43057 - MODE
    )
    :vars
    (
      ?auto_43058 - INSTRUMENT
      ?auto_43060 - SATELLITE
      ?auto_43059 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_43058 ?auto_43060 ) ( SUPPORTS ?auto_43058 ?auto_43057 ) ( not ( = ?auto_43056 ?auto_43059 ) ) ( HAVE_IMAGE ?auto_43053 ?auto_43055 ) ( not ( = ?auto_43053 ?auto_43056 ) ) ( not ( = ?auto_43053 ?auto_43059 ) ) ( not ( = ?auto_43055 ?auto_43057 ) ) ( CALIBRATION_TARGET ?auto_43058 ?auto_43059 ) ( POWER_AVAIL ?auto_43060 ) ( POINTING ?auto_43060 ?auto_43053 ) ( HAVE_IMAGE ?auto_43051 ?auto_43052 ) ( HAVE_IMAGE ?auto_43053 ?auto_43050 ) ( HAVE_IMAGE ?auto_43054 ?auto_43055 ) ( not ( = ?auto_43051 ?auto_43053 ) ) ( not ( = ?auto_43051 ?auto_43054 ) ) ( not ( = ?auto_43051 ?auto_43056 ) ) ( not ( = ?auto_43051 ?auto_43059 ) ) ( not ( = ?auto_43052 ?auto_43050 ) ) ( not ( = ?auto_43052 ?auto_43055 ) ) ( not ( = ?auto_43052 ?auto_43057 ) ) ( not ( = ?auto_43053 ?auto_43054 ) ) ( not ( = ?auto_43050 ?auto_43055 ) ) ( not ( = ?auto_43050 ?auto_43057 ) ) ( not ( = ?auto_43054 ?auto_43056 ) ) ( not ( = ?auto_43054 ?auto_43059 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_43053 ?auto_43055 ?auto_43056 ?auto_43057 )
      ( GET-4IMAGE-VERIFY ?auto_43051 ?auto_43052 ?auto_43053 ?auto_43050 ?auto_43054 ?auto_43055 ?auto_43056 ?auto_43057 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_43073 - DIRECTION
      ?auto_43074 - MODE
      ?auto_43075 - DIRECTION
      ?auto_43072 - MODE
      ?auto_43076 - DIRECTION
      ?auto_43077 - MODE
      ?auto_43078 - DIRECTION
      ?auto_43079 - MODE
    )
    :vars
    (
      ?auto_43080 - INSTRUMENT
      ?auto_43082 - SATELLITE
      ?auto_43081 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_43080 ?auto_43082 ) ( SUPPORTS ?auto_43080 ?auto_43077 ) ( not ( = ?auto_43076 ?auto_43081 ) ) ( HAVE_IMAGE ?auto_43075 ?auto_43074 ) ( not ( = ?auto_43075 ?auto_43076 ) ) ( not ( = ?auto_43075 ?auto_43081 ) ) ( not ( = ?auto_43074 ?auto_43077 ) ) ( CALIBRATION_TARGET ?auto_43080 ?auto_43081 ) ( POWER_AVAIL ?auto_43082 ) ( POINTING ?auto_43082 ?auto_43075 ) ( HAVE_IMAGE ?auto_43073 ?auto_43074 ) ( HAVE_IMAGE ?auto_43075 ?auto_43072 ) ( HAVE_IMAGE ?auto_43078 ?auto_43079 ) ( not ( = ?auto_43073 ?auto_43075 ) ) ( not ( = ?auto_43073 ?auto_43076 ) ) ( not ( = ?auto_43073 ?auto_43078 ) ) ( not ( = ?auto_43073 ?auto_43081 ) ) ( not ( = ?auto_43074 ?auto_43072 ) ) ( not ( = ?auto_43074 ?auto_43079 ) ) ( not ( = ?auto_43075 ?auto_43078 ) ) ( not ( = ?auto_43072 ?auto_43077 ) ) ( not ( = ?auto_43072 ?auto_43079 ) ) ( not ( = ?auto_43076 ?auto_43078 ) ) ( not ( = ?auto_43077 ?auto_43079 ) ) ( not ( = ?auto_43078 ?auto_43081 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_43075 ?auto_43074 ?auto_43076 ?auto_43077 )
      ( GET-4IMAGE-VERIFY ?auto_43073 ?auto_43074 ?auto_43075 ?auto_43072 ?auto_43076 ?auto_43077 ?auto_43078 ?auto_43079 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_43483 - DIRECTION
      ?auto_43484 - MODE
      ?auto_43485 - DIRECTION
      ?auto_43482 - MODE
      ?auto_43486 - DIRECTION
      ?auto_43487 - MODE
      ?auto_43488 - DIRECTION
      ?auto_43489 - MODE
    )
    :vars
    (
      ?auto_43490 - INSTRUMENT
      ?auto_43492 - SATELLITE
      ?auto_43491 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_43490 ?auto_43492 ) ( SUPPORTS ?auto_43490 ?auto_43484 ) ( not ( = ?auto_43483 ?auto_43491 ) ) ( HAVE_IMAGE ?auto_43486 ?auto_43482 ) ( not ( = ?auto_43486 ?auto_43483 ) ) ( not ( = ?auto_43486 ?auto_43491 ) ) ( not ( = ?auto_43482 ?auto_43484 ) ) ( CALIBRATION_TARGET ?auto_43490 ?auto_43491 ) ( POWER_AVAIL ?auto_43492 ) ( POINTING ?auto_43492 ?auto_43486 ) ( HAVE_IMAGE ?auto_43485 ?auto_43482 ) ( HAVE_IMAGE ?auto_43486 ?auto_43487 ) ( HAVE_IMAGE ?auto_43488 ?auto_43489 ) ( not ( = ?auto_43483 ?auto_43485 ) ) ( not ( = ?auto_43483 ?auto_43488 ) ) ( not ( = ?auto_43484 ?auto_43487 ) ) ( not ( = ?auto_43484 ?auto_43489 ) ) ( not ( = ?auto_43485 ?auto_43486 ) ) ( not ( = ?auto_43485 ?auto_43488 ) ) ( not ( = ?auto_43485 ?auto_43491 ) ) ( not ( = ?auto_43482 ?auto_43487 ) ) ( not ( = ?auto_43482 ?auto_43489 ) ) ( not ( = ?auto_43486 ?auto_43488 ) ) ( not ( = ?auto_43487 ?auto_43489 ) ) ( not ( = ?auto_43488 ?auto_43491 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_43486 ?auto_43482 ?auto_43483 ?auto_43484 )
      ( GET-4IMAGE-VERIFY ?auto_43483 ?auto_43484 ?auto_43485 ?auto_43482 ?auto_43486 ?auto_43487 ?auto_43488 ?auto_43489 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_43856 - DIRECTION
      ?auto_43857 - MODE
      ?auto_43858 - DIRECTION
      ?auto_43855 - MODE
      ?auto_43859 - DIRECTION
      ?auto_43860 - MODE
    )
    :vars
    (
      ?auto_43864 - INSTRUMENT
      ?auto_43862 - SATELLITE
      ?auto_43863 - DIRECTION
      ?auto_43861 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_43864 ?auto_43862 ) ( SUPPORTS ?auto_43864 ?auto_43855 ) ( not ( = ?auto_43858 ?auto_43863 ) ) ( HAVE_IMAGE ?auto_43859 ?auto_43860 ) ( not ( = ?auto_43859 ?auto_43858 ) ) ( not ( = ?auto_43859 ?auto_43863 ) ) ( not ( = ?auto_43860 ?auto_43855 ) ) ( CALIBRATION_TARGET ?auto_43864 ?auto_43863 ) ( POINTING ?auto_43862 ?auto_43859 ) ( ON_BOARD ?auto_43861 ?auto_43862 ) ( POWER_ON ?auto_43861 ) ( not ( = ?auto_43864 ?auto_43861 ) ) ( HAVE_IMAGE ?auto_43856 ?auto_43857 ) ( not ( = ?auto_43856 ?auto_43858 ) ) ( not ( = ?auto_43856 ?auto_43859 ) ) ( not ( = ?auto_43856 ?auto_43863 ) ) ( not ( = ?auto_43857 ?auto_43855 ) ) ( not ( = ?auto_43857 ?auto_43860 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_43859 ?auto_43860 ?auto_43858 ?auto_43855 )
      ( GET-3IMAGE-VERIFY ?auto_43856 ?auto_43857 ?auto_43858 ?auto_43855 ?auto_43859 ?auto_43860 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_43942 - DIRECTION
      ?auto_43943 - MODE
      ?auto_43944 - DIRECTION
      ?auto_43941 - MODE
      ?auto_43945 - DIRECTION
      ?auto_43946 - MODE
    )
    :vars
    (
      ?auto_43950 - INSTRUMENT
      ?auto_43948 - SATELLITE
      ?auto_43949 - DIRECTION
      ?auto_43947 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_43950 ?auto_43948 ) ( SUPPORTS ?auto_43950 ?auto_43943 ) ( not ( = ?auto_43942 ?auto_43949 ) ) ( HAVE_IMAGE ?auto_43944 ?auto_43941 ) ( not ( = ?auto_43944 ?auto_43942 ) ) ( not ( = ?auto_43944 ?auto_43949 ) ) ( not ( = ?auto_43941 ?auto_43943 ) ) ( CALIBRATION_TARGET ?auto_43950 ?auto_43949 ) ( POINTING ?auto_43948 ?auto_43944 ) ( ON_BOARD ?auto_43947 ?auto_43948 ) ( POWER_ON ?auto_43947 ) ( not ( = ?auto_43950 ?auto_43947 ) ) ( HAVE_IMAGE ?auto_43945 ?auto_43946 ) ( not ( = ?auto_43942 ?auto_43945 ) ) ( not ( = ?auto_43943 ?auto_43946 ) ) ( not ( = ?auto_43944 ?auto_43945 ) ) ( not ( = ?auto_43941 ?auto_43946 ) ) ( not ( = ?auto_43945 ?auto_43949 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_43944 ?auto_43941 ?auto_43942 ?auto_43943 )
      ( GET-3IMAGE-VERIFY ?auto_43942 ?auto_43943 ?auto_43944 ?auto_43941 ?auto_43945 ?auto_43946 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_44040 - DIRECTION
      ?auto_44041 - MODE
      ?auto_44042 - DIRECTION
      ?auto_44039 - MODE
      ?auto_44043 - DIRECTION
      ?auto_44044 - MODE
      ?auto_44045 - DIRECTION
      ?auto_44046 - MODE
    )
    :vars
    (
      ?auto_44050 - INSTRUMENT
      ?auto_44048 - SATELLITE
      ?auto_44049 - DIRECTION
      ?auto_44047 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_44050 ?auto_44048 ) ( SUPPORTS ?auto_44050 ?auto_44046 ) ( not ( = ?auto_44045 ?auto_44049 ) ) ( HAVE_IMAGE ?auto_44040 ?auto_44039 ) ( not ( = ?auto_44040 ?auto_44045 ) ) ( not ( = ?auto_44040 ?auto_44049 ) ) ( not ( = ?auto_44039 ?auto_44046 ) ) ( CALIBRATION_TARGET ?auto_44050 ?auto_44049 ) ( POINTING ?auto_44048 ?auto_44040 ) ( ON_BOARD ?auto_44047 ?auto_44048 ) ( POWER_ON ?auto_44047 ) ( not ( = ?auto_44050 ?auto_44047 ) ) ( HAVE_IMAGE ?auto_44040 ?auto_44041 ) ( HAVE_IMAGE ?auto_44042 ?auto_44039 ) ( HAVE_IMAGE ?auto_44043 ?auto_44044 ) ( not ( = ?auto_44040 ?auto_44042 ) ) ( not ( = ?auto_44040 ?auto_44043 ) ) ( not ( = ?auto_44041 ?auto_44039 ) ) ( not ( = ?auto_44041 ?auto_44044 ) ) ( not ( = ?auto_44041 ?auto_44046 ) ) ( not ( = ?auto_44042 ?auto_44043 ) ) ( not ( = ?auto_44042 ?auto_44045 ) ) ( not ( = ?auto_44042 ?auto_44049 ) ) ( not ( = ?auto_44039 ?auto_44044 ) ) ( not ( = ?auto_44043 ?auto_44045 ) ) ( not ( = ?auto_44043 ?auto_44049 ) ) ( not ( = ?auto_44044 ?auto_44046 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_44040 ?auto_44039 ?auto_44045 ?auto_44046 )
      ( GET-4IMAGE-VERIFY ?auto_44040 ?auto_44041 ?auto_44042 ?auto_44039 ?auto_44043 ?auto_44044 ?auto_44045 ?auto_44046 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_44064 - DIRECTION
      ?auto_44065 - MODE
      ?auto_44066 - DIRECTION
      ?auto_44063 - MODE
      ?auto_44067 - DIRECTION
      ?auto_44068 - MODE
      ?auto_44069 - DIRECTION
      ?auto_44070 - MODE
    )
    :vars
    (
      ?auto_44074 - INSTRUMENT
      ?auto_44072 - SATELLITE
      ?auto_44073 - DIRECTION
      ?auto_44071 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_44074 ?auto_44072 ) ( SUPPORTS ?auto_44074 ?auto_44068 ) ( not ( = ?auto_44067 ?auto_44073 ) ) ( HAVE_IMAGE ?auto_44064 ?auto_44070 ) ( not ( = ?auto_44064 ?auto_44067 ) ) ( not ( = ?auto_44064 ?auto_44073 ) ) ( not ( = ?auto_44070 ?auto_44068 ) ) ( CALIBRATION_TARGET ?auto_44074 ?auto_44073 ) ( POINTING ?auto_44072 ?auto_44064 ) ( ON_BOARD ?auto_44071 ?auto_44072 ) ( POWER_ON ?auto_44071 ) ( not ( = ?auto_44074 ?auto_44071 ) ) ( HAVE_IMAGE ?auto_44064 ?auto_44065 ) ( HAVE_IMAGE ?auto_44066 ?auto_44063 ) ( HAVE_IMAGE ?auto_44069 ?auto_44070 ) ( not ( = ?auto_44064 ?auto_44066 ) ) ( not ( = ?auto_44064 ?auto_44069 ) ) ( not ( = ?auto_44065 ?auto_44063 ) ) ( not ( = ?auto_44065 ?auto_44068 ) ) ( not ( = ?auto_44065 ?auto_44070 ) ) ( not ( = ?auto_44066 ?auto_44067 ) ) ( not ( = ?auto_44066 ?auto_44069 ) ) ( not ( = ?auto_44066 ?auto_44073 ) ) ( not ( = ?auto_44063 ?auto_44068 ) ) ( not ( = ?auto_44063 ?auto_44070 ) ) ( not ( = ?auto_44067 ?auto_44069 ) ) ( not ( = ?auto_44069 ?auto_44073 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_44064 ?auto_44070 ?auto_44067 ?auto_44068 )
      ( GET-4IMAGE-VERIFY ?auto_44064 ?auto_44065 ?auto_44066 ?auto_44063 ?auto_44067 ?auto_44068 ?auto_44069 ?auto_44070 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_44160 - DIRECTION
      ?auto_44161 - MODE
      ?auto_44162 - DIRECTION
      ?auto_44159 - MODE
      ?auto_44163 - DIRECTION
      ?auto_44164 - MODE
      ?auto_44165 - DIRECTION
      ?auto_44166 - MODE
    )
    :vars
    (
      ?auto_44170 - INSTRUMENT
      ?auto_44168 - SATELLITE
      ?auto_44169 - DIRECTION
      ?auto_44167 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_44170 ?auto_44168 ) ( SUPPORTS ?auto_44170 ?auto_44159 ) ( not ( = ?auto_44162 ?auto_44169 ) ) ( HAVE_IMAGE ?auto_44165 ?auto_44166 ) ( not ( = ?auto_44165 ?auto_44162 ) ) ( not ( = ?auto_44165 ?auto_44169 ) ) ( not ( = ?auto_44166 ?auto_44159 ) ) ( CALIBRATION_TARGET ?auto_44170 ?auto_44169 ) ( POINTING ?auto_44168 ?auto_44165 ) ( ON_BOARD ?auto_44167 ?auto_44168 ) ( POWER_ON ?auto_44167 ) ( not ( = ?auto_44170 ?auto_44167 ) ) ( HAVE_IMAGE ?auto_44160 ?auto_44161 ) ( HAVE_IMAGE ?auto_44163 ?auto_44164 ) ( not ( = ?auto_44160 ?auto_44162 ) ) ( not ( = ?auto_44160 ?auto_44163 ) ) ( not ( = ?auto_44160 ?auto_44165 ) ) ( not ( = ?auto_44160 ?auto_44169 ) ) ( not ( = ?auto_44161 ?auto_44159 ) ) ( not ( = ?auto_44161 ?auto_44164 ) ) ( not ( = ?auto_44161 ?auto_44166 ) ) ( not ( = ?auto_44162 ?auto_44163 ) ) ( not ( = ?auto_44159 ?auto_44164 ) ) ( not ( = ?auto_44163 ?auto_44165 ) ) ( not ( = ?auto_44163 ?auto_44169 ) ) ( not ( = ?auto_44164 ?auto_44166 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_44165 ?auto_44166 ?auto_44162 ?auto_44159 )
      ( GET-4IMAGE-VERIFY ?auto_44160 ?auto_44161 ?auto_44162 ?auto_44159 ?auto_44163 ?auto_44164 ?auto_44165 ?auto_44166 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_44510 - DIRECTION
      ?auto_44511 - MODE
      ?auto_44512 - DIRECTION
      ?auto_44509 - MODE
      ?auto_44513 - DIRECTION
      ?auto_44514 - MODE
      ?auto_44515 - DIRECTION
      ?auto_44516 - MODE
    )
    :vars
    (
      ?auto_44520 - INSTRUMENT
      ?auto_44518 - SATELLITE
      ?auto_44519 - DIRECTION
      ?auto_44517 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_44520 ?auto_44518 ) ( SUPPORTS ?auto_44520 ?auto_44511 ) ( not ( = ?auto_44510 ?auto_44519 ) ) ( HAVE_IMAGE ?auto_44515 ?auto_44514 ) ( not ( = ?auto_44515 ?auto_44510 ) ) ( not ( = ?auto_44515 ?auto_44519 ) ) ( not ( = ?auto_44514 ?auto_44511 ) ) ( CALIBRATION_TARGET ?auto_44520 ?auto_44519 ) ( POINTING ?auto_44518 ?auto_44515 ) ( ON_BOARD ?auto_44517 ?auto_44518 ) ( POWER_ON ?auto_44517 ) ( not ( = ?auto_44520 ?auto_44517 ) ) ( HAVE_IMAGE ?auto_44512 ?auto_44509 ) ( HAVE_IMAGE ?auto_44513 ?auto_44514 ) ( HAVE_IMAGE ?auto_44515 ?auto_44516 ) ( not ( = ?auto_44510 ?auto_44512 ) ) ( not ( = ?auto_44510 ?auto_44513 ) ) ( not ( = ?auto_44511 ?auto_44509 ) ) ( not ( = ?auto_44511 ?auto_44516 ) ) ( not ( = ?auto_44512 ?auto_44513 ) ) ( not ( = ?auto_44512 ?auto_44515 ) ) ( not ( = ?auto_44512 ?auto_44519 ) ) ( not ( = ?auto_44509 ?auto_44514 ) ) ( not ( = ?auto_44509 ?auto_44516 ) ) ( not ( = ?auto_44513 ?auto_44515 ) ) ( not ( = ?auto_44513 ?auto_44519 ) ) ( not ( = ?auto_44514 ?auto_44516 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_44515 ?auto_44514 ?auto_44510 ?auto_44511 )
      ( GET-4IMAGE-VERIFY ?auto_44510 ?auto_44511 ?auto_44512 ?auto_44509 ?auto_44513 ?auto_44514 ?auto_44515 ?auto_44516 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_53676 - DIRECTION
      ?auto_53677 - MODE
      ?auto_53678 - DIRECTION
      ?auto_53675 - MODE
      ?auto_53679 - DIRECTION
      ?auto_53680 - MODE
    )
    :vars
    (
      ?auto_53681 - INSTRUMENT
      ?auto_53683 - SATELLITE
      ?auto_53682 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_53681 ) ( ON_BOARD ?auto_53681 ?auto_53683 ) ( SUPPORTS ?auto_53681 ?auto_53675 ) ( POWER_ON ?auto_53681 ) ( POINTING ?auto_53683 ?auto_53682 ) ( not ( = ?auto_53678 ?auto_53682 ) ) ( HAVE_IMAGE ?auto_53676 ?auto_53680 ) ( not ( = ?auto_53676 ?auto_53678 ) ) ( not ( = ?auto_53676 ?auto_53682 ) ) ( not ( = ?auto_53680 ?auto_53675 ) ) ( HAVE_IMAGE ?auto_53676 ?auto_53677 ) ( HAVE_IMAGE ?auto_53679 ?auto_53680 ) ( not ( = ?auto_53676 ?auto_53679 ) ) ( not ( = ?auto_53677 ?auto_53675 ) ) ( not ( = ?auto_53677 ?auto_53680 ) ) ( not ( = ?auto_53678 ?auto_53679 ) ) ( not ( = ?auto_53679 ?auto_53682 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_53676 ?auto_53680 ?auto_53678 ?auto_53675 )
      ( GET-3IMAGE-VERIFY ?auto_53676 ?auto_53677 ?auto_53678 ?auto_53675 ?auto_53679 ?auto_53680 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_54355 - DIRECTION
      ?auto_54356 - MODE
      ?auto_54357 - DIRECTION
      ?auto_54354 - MODE
      ?auto_54358 - DIRECTION
      ?auto_54359 - MODE
      ?auto_54360 - DIRECTION
      ?auto_54361 - MODE
    )
    :vars
    (
      ?auto_54362 - INSTRUMENT
      ?auto_54364 - SATELLITE
      ?auto_54363 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_54362 ) ( ON_BOARD ?auto_54362 ?auto_54364 ) ( SUPPORTS ?auto_54362 ?auto_54361 ) ( POWER_ON ?auto_54362 ) ( POINTING ?auto_54364 ?auto_54363 ) ( not ( = ?auto_54360 ?auto_54363 ) ) ( HAVE_IMAGE ?auto_54358 ?auto_54354 ) ( not ( = ?auto_54358 ?auto_54360 ) ) ( not ( = ?auto_54358 ?auto_54363 ) ) ( not ( = ?auto_54354 ?auto_54361 ) ) ( HAVE_IMAGE ?auto_54355 ?auto_54356 ) ( HAVE_IMAGE ?auto_54357 ?auto_54354 ) ( HAVE_IMAGE ?auto_54358 ?auto_54359 ) ( not ( = ?auto_54355 ?auto_54357 ) ) ( not ( = ?auto_54355 ?auto_54358 ) ) ( not ( = ?auto_54355 ?auto_54360 ) ) ( not ( = ?auto_54355 ?auto_54363 ) ) ( not ( = ?auto_54356 ?auto_54354 ) ) ( not ( = ?auto_54356 ?auto_54359 ) ) ( not ( = ?auto_54356 ?auto_54361 ) ) ( not ( = ?auto_54357 ?auto_54358 ) ) ( not ( = ?auto_54357 ?auto_54360 ) ) ( not ( = ?auto_54357 ?auto_54363 ) ) ( not ( = ?auto_54354 ?auto_54359 ) ) ( not ( = ?auto_54359 ?auto_54361 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_54358 ?auto_54354 ?auto_54360 ?auto_54361 )
      ( GET-4IMAGE-VERIFY ?auto_54355 ?auto_54356 ?auto_54357 ?auto_54354 ?auto_54358 ?auto_54359 ?auto_54360 ?auto_54361 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_55567 - DIRECTION
      ?auto_55568 - MODE
      ?auto_55569 - DIRECTION
      ?auto_55566 - MODE
      ?auto_55570 - DIRECTION
      ?auto_55571 - MODE
      ?auto_55572 - DIRECTION
      ?auto_55573 - MODE
    )
    :vars
    (
      ?auto_55574 - INSTRUMENT
      ?auto_55576 - SATELLITE
      ?auto_55575 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_55574 ) ( ON_BOARD ?auto_55574 ?auto_55576 ) ( SUPPORTS ?auto_55574 ?auto_55568 ) ( POWER_ON ?auto_55574 ) ( POINTING ?auto_55576 ?auto_55575 ) ( not ( = ?auto_55567 ?auto_55575 ) ) ( HAVE_IMAGE ?auto_55572 ?auto_55571 ) ( not ( = ?auto_55572 ?auto_55567 ) ) ( not ( = ?auto_55572 ?auto_55575 ) ) ( not ( = ?auto_55571 ?auto_55568 ) ) ( HAVE_IMAGE ?auto_55569 ?auto_55566 ) ( HAVE_IMAGE ?auto_55570 ?auto_55571 ) ( HAVE_IMAGE ?auto_55572 ?auto_55573 ) ( not ( = ?auto_55567 ?auto_55569 ) ) ( not ( = ?auto_55567 ?auto_55570 ) ) ( not ( = ?auto_55568 ?auto_55566 ) ) ( not ( = ?auto_55568 ?auto_55573 ) ) ( not ( = ?auto_55569 ?auto_55570 ) ) ( not ( = ?auto_55569 ?auto_55572 ) ) ( not ( = ?auto_55569 ?auto_55575 ) ) ( not ( = ?auto_55566 ?auto_55571 ) ) ( not ( = ?auto_55566 ?auto_55573 ) ) ( not ( = ?auto_55570 ?auto_55572 ) ) ( not ( = ?auto_55570 ?auto_55575 ) ) ( not ( = ?auto_55571 ?auto_55573 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_55572 ?auto_55571 ?auto_55567 ?auto_55568 )
      ( GET-4IMAGE-VERIFY ?auto_55567 ?auto_55568 ?auto_55569 ?auto_55566 ?auto_55570 ?auto_55571 ?auto_55572 ?auto_55573 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_55995 - DIRECTION
      ?auto_55996 - MODE
      ?auto_55997 - DIRECTION
      ?auto_55994 - MODE
      ?auto_55998 - DIRECTION
      ?auto_55999 - MODE
    )
    :vars
    (
      ?auto_56002 - INSTRUMENT
      ?auto_56000 - SATELLITE
      ?auto_56001 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_56002 ?auto_56000 ) ( SUPPORTS ?auto_56002 ?auto_55999 ) ( POWER_ON ?auto_56002 ) ( POINTING ?auto_56000 ?auto_56001 ) ( not ( = ?auto_55998 ?auto_56001 ) ) ( HAVE_IMAGE ?auto_55995 ?auto_55994 ) ( not ( = ?auto_55995 ?auto_55998 ) ) ( not ( = ?auto_55995 ?auto_56001 ) ) ( not ( = ?auto_55994 ?auto_55999 ) ) ( CALIBRATION_TARGET ?auto_56002 ?auto_56001 ) ( NOT_CALIBRATED ?auto_56002 ) ( HAVE_IMAGE ?auto_55995 ?auto_55996 ) ( HAVE_IMAGE ?auto_55997 ?auto_55994 ) ( not ( = ?auto_55995 ?auto_55997 ) ) ( not ( = ?auto_55996 ?auto_55994 ) ) ( not ( = ?auto_55996 ?auto_55999 ) ) ( not ( = ?auto_55997 ?auto_55998 ) ) ( not ( = ?auto_55997 ?auto_56001 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_55995 ?auto_55994 ?auto_55998 ?auto_55999 )
      ( GET-3IMAGE-VERIFY ?auto_55995 ?auto_55996 ?auto_55997 ?auto_55994 ?auto_55998 ?auto_55999 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_56019 - DIRECTION
      ?auto_56020 - MODE
      ?auto_56021 - DIRECTION
      ?auto_56018 - MODE
      ?auto_56022 - DIRECTION
      ?auto_56023 - MODE
    )
    :vars
    (
      ?auto_56026 - INSTRUMENT
      ?auto_56024 - SATELLITE
      ?auto_56025 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_56026 ?auto_56024 ) ( SUPPORTS ?auto_56026 ?auto_56018 ) ( POWER_ON ?auto_56026 ) ( POINTING ?auto_56024 ?auto_56025 ) ( not ( = ?auto_56021 ?auto_56025 ) ) ( HAVE_IMAGE ?auto_56019 ?auto_56023 ) ( not ( = ?auto_56019 ?auto_56021 ) ) ( not ( = ?auto_56019 ?auto_56025 ) ) ( not ( = ?auto_56023 ?auto_56018 ) ) ( CALIBRATION_TARGET ?auto_56026 ?auto_56025 ) ( NOT_CALIBRATED ?auto_56026 ) ( HAVE_IMAGE ?auto_56019 ?auto_56020 ) ( HAVE_IMAGE ?auto_56022 ?auto_56023 ) ( not ( = ?auto_56019 ?auto_56022 ) ) ( not ( = ?auto_56020 ?auto_56018 ) ) ( not ( = ?auto_56020 ?auto_56023 ) ) ( not ( = ?auto_56021 ?auto_56022 ) ) ( not ( = ?auto_56022 ?auto_56025 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_56019 ?auto_56023 ?auto_56021 ?auto_56018 )
      ( GET-3IMAGE-VERIFY ?auto_56019 ?auto_56020 ?auto_56021 ?auto_56018 ?auto_56022 ?auto_56023 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_56028 - DIRECTION
      ?auto_56029 - MODE
      ?auto_56030 - DIRECTION
      ?auto_56027 - MODE
      ?auto_56031 - DIRECTION
      ?auto_56032 - MODE
    )
    :vars
    (
      ?auto_56035 - INSTRUMENT
      ?auto_56033 - SATELLITE
      ?auto_56034 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_56035 ?auto_56033 ) ( SUPPORTS ?auto_56035 ?auto_56027 ) ( POWER_ON ?auto_56035 ) ( POINTING ?auto_56033 ?auto_56034 ) ( not ( = ?auto_56030 ?auto_56034 ) ) ( HAVE_IMAGE ?auto_56028 ?auto_56029 ) ( not ( = ?auto_56028 ?auto_56030 ) ) ( not ( = ?auto_56028 ?auto_56034 ) ) ( not ( = ?auto_56029 ?auto_56027 ) ) ( CALIBRATION_TARGET ?auto_56035 ?auto_56034 ) ( NOT_CALIBRATED ?auto_56035 ) ( HAVE_IMAGE ?auto_56031 ?auto_56032 ) ( not ( = ?auto_56028 ?auto_56031 ) ) ( not ( = ?auto_56029 ?auto_56032 ) ) ( not ( = ?auto_56030 ?auto_56031 ) ) ( not ( = ?auto_56027 ?auto_56032 ) ) ( not ( = ?auto_56031 ?auto_56034 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_56028 ?auto_56029 ?auto_56030 ?auto_56027 )
      ( GET-3IMAGE-VERIFY ?auto_56028 ?auto_56029 ?auto_56030 ?auto_56027 ?auto_56031 ?auto_56032 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_56166 - DIRECTION
      ?auto_56167 - MODE
      ?auto_56168 - DIRECTION
      ?auto_56165 - MODE
      ?auto_56169 - DIRECTION
      ?auto_56170 - MODE
    )
    :vars
    (
      ?auto_56173 - INSTRUMENT
      ?auto_56171 - SATELLITE
      ?auto_56172 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_56173 ?auto_56171 ) ( SUPPORTS ?auto_56173 ?auto_56167 ) ( POWER_ON ?auto_56173 ) ( POINTING ?auto_56171 ?auto_56172 ) ( not ( = ?auto_56166 ?auto_56172 ) ) ( HAVE_IMAGE ?auto_56169 ?auto_56170 ) ( not ( = ?auto_56169 ?auto_56166 ) ) ( not ( = ?auto_56169 ?auto_56172 ) ) ( not ( = ?auto_56170 ?auto_56167 ) ) ( CALIBRATION_TARGET ?auto_56173 ?auto_56172 ) ( NOT_CALIBRATED ?auto_56173 ) ( HAVE_IMAGE ?auto_56168 ?auto_56165 ) ( not ( = ?auto_56166 ?auto_56168 ) ) ( not ( = ?auto_56167 ?auto_56165 ) ) ( not ( = ?auto_56168 ?auto_56169 ) ) ( not ( = ?auto_56168 ?auto_56172 ) ) ( not ( = ?auto_56165 ?auto_56170 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_56169 ?auto_56170 ?auto_56166 ?auto_56167 )
      ( GET-3IMAGE-VERIFY ?auto_56166 ?auto_56167 ?auto_56168 ?auto_56165 ?auto_56169 ?auto_56170 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_56725 - DIRECTION
      ?auto_56726 - MODE
      ?auto_56727 - DIRECTION
      ?auto_56724 - MODE
      ?auto_56728 - DIRECTION
      ?auto_56729 - MODE
      ?auto_56730 - DIRECTION
      ?auto_56731 - MODE
    )
    :vars
    (
      ?auto_56734 - INSTRUMENT
      ?auto_56732 - SATELLITE
      ?auto_56733 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_56734 ?auto_56732 ) ( SUPPORTS ?auto_56734 ?auto_56729 ) ( POWER_ON ?auto_56734 ) ( POINTING ?auto_56732 ?auto_56733 ) ( not ( = ?auto_56728 ?auto_56733 ) ) ( HAVE_IMAGE ?auto_56730 ?auto_56724 ) ( not ( = ?auto_56730 ?auto_56728 ) ) ( not ( = ?auto_56730 ?auto_56733 ) ) ( not ( = ?auto_56724 ?auto_56729 ) ) ( CALIBRATION_TARGET ?auto_56734 ?auto_56733 ) ( NOT_CALIBRATED ?auto_56734 ) ( HAVE_IMAGE ?auto_56725 ?auto_56726 ) ( HAVE_IMAGE ?auto_56727 ?auto_56724 ) ( HAVE_IMAGE ?auto_56730 ?auto_56731 ) ( not ( = ?auto_56725 ?auto_56727 ) ) ( not ( = ?auto_56725 ?auto_56728 ) ) ( not ( = ?auto_56725 ?auto_56730 ) ) ( not ( = ?auto_56725 ?auto_56733 ) ) ( not ( = ?auto_56726 ?auto_56724 ) ) ( not ( = ?auto_56726 ?auto_56729 ) ) ( not ( = ?auto_56726 ?auto_56731 ) ) ( not ( = ?auto_56727 ?auto_56728 ) ) ( not ( = ?auto_56727 ?auto_56730 ) ) ( not ( = ?auto_56727 ?auto_56733 ) ) ( not ( = ?auto_56724 ?auto_56731 ) ) ( not ( = ?auto_56729 ?auto_56731 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_56730 ?auto_56724 ?auto_56728 ?auto_56729 )
      ( GET-4IMAGE-VERIFY ?auto_56725 ?auto_56726 ?auto_56727 ?auto_56724 ?auto_56728 ?auto_56729 ?auto_56730 ?auto_56731 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_57549 - DIRECTION
      ?auto_57550 - MODE
      ?auto_57551 - DIRECTION
      ?auto_57548 - MODE
      ?auto_57552 - DIRECTION
      ?auto_57553 - MODE
      ?auto_57554 - DIRECTION
      ?auto_57555 - MODE
    )
    :vars
    (
      ?auto_57558 - INSTRUMENT
      ?auto_57556 - SATELLITE
      ?auto_57557 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_57558 ?auto_57556 ) ( SUPPORTS ?auto_57558 ?auto_57550 ) ( POWER_ON ?auto_57558 ) ( POINTING ?auto_57556 ?auto_57557 ) ( not ( = ?auto_57549 ?auto_57557 ) ) ( HAVE_IMAGE ?auto_57551 ?auto_57553 ) ( not ( = ?auto_57551 ?auto_57549 ) ) ( not ( = ?auto_57551 ?auto_57557 ) ) ( not ( = ?auto_57553 ?auto_57550 ) ) ( CALIBRATION_TARGET ?auto_57558 ?auto_57557 ) ( NOT_CALIBRATED ?auto_57558 ) ( HAVE_IMAGE ?auto_57551 ?auto_57548 ) ( HAVE_IMAGE ?auto_57552 ?auto_57553 ) ( HAVE_IMAGE ?auto_57554 ?auto_57555 ) ( not ( = ?auto_57549 ?auto_57552 ) ) ( not ( = ?auto_57549 ?auto_57554 ) ) ( not ( = ?auto_57550 ?auto_57548 ) ) ( not ( = ?auto_57550 ?auto_57555 ) ) ( not ( = ?auto_57551 ?auto_57552 ) ) ( not ( = ?auto_57551 ?auto_57554 ) ) ( not ( = ?auto_57548 ?auto_57553 ) ) ( not ( = ?auto_57548 ?auto_57555 ) ) ( not ( = ?auto_57552 ?auto_57554 ) ) ( not ( = ?auto_57552 ?auto_57557 ) ) ( not ( = ?auto_57553 ?auto_57555 ) ) ( not ( = ?auto_57554 ?auto_57557 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_57551 ?auto_57553 ?auto_57549 ?auto_57550 )
      ( GET-4IMAGE-VERIFY ?auto_57549 ?auto_57550 ?auto_57551 ?auto_57548 ?auto_57552 ?auto_57553 ?auto_57554 ?auto_57555 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_57907 - DIRECTION
      ?auto_57908 - MODE
      ?auto_57909 - DIRECTION
      ?auto_57906 - MODE
      ?auto_57910 - DIRECTION
      ?auto_57911 - MODE
      ?auto_57912 - DIRECTION
      ?auto_57913 - MODE
    )
    :vars
    (
      ?auto_57916 - INSTRUMENT
      ?auto_57914 - SATELLITE
      ?auto_57915 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_57916 ?auto_57914 ) ( SUPPORTS ?auto_57916 ?auto_57908 ) ( POWER_ON ?auto_57916 ) ( POINTING ?auto_57914 ?auto_57915 ) ( not ( = ?auto_57907 ?auto_57915 ) ) ( HAVE_IMAGE ?auto_57912 ?auto_57911 ) ( not ( = ?auto_57912 ?auto_57907 ) ) ( not ( = ?auto_57912 ?auto_57915 ) ) ( not ( = ?auto_57911 ?auto_57908 ) ) ( CALIBRATION_TARGET ?auto_57916 ?auto_57915 ) ( NOT_CALIBRATED ?auto_57916 ) ( HAVE_IMAGE ?auto_57909 ?auto_57906 ) ( HAVE_IMAGE ?auto_57910 ?auto_57911 ) ( HAVE_IMAGE ?auto_57912 ?auto_57913 ) ( not ( = ?auto_57907 ?auto_57909 ) ) ( not ( = ?auto_57907 ?auto_57910 ) ) ( not ( = ?auto_57908 ?auto_57906 ) ) ( not ( = ?auto_57908 ?auto_57913 ) ) ( not ( = ?auto_57909 ?auto_57910 ) ) ( not ( = ?auto_57909 ?auto_57912 ) ) ( not ( = ?auto_57909 ?auto_57915 ) ) ( not ( = ?auto_57906 ?auto_57911 ) ) ( not ( = ?auto_57906 ?auto_57913 ) ) ( not ( = ?auto_57910 ?auto_57912 ) ) ( not ( = ?auto_57910 ?auto_57915 ) ) ( not ( = ?auto_57911 ?auto_57913 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_57912 ?auto_57911 ?auto_57907 ?auto_57908 )
      ( GET-4IMAGE-VERIFY ?auto_57907 ?auto_57908 ?auto_57909 ?auto_57906 ?auto_57910 ?auto_57911 ?auto_57912 ?auto_57913 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_58335 - DIRECTION
      ?auto_58336 - MODE
      ?auto_58337 - DIRECTION
      ?auto_58334 - MODE
      ?auto_58338 - DIRECTION
      ?auto_58339 - MODE
    )
    :vars
    (
      ?auto_58342 - INSTRUMENT
      ?auto_58341 - SATELLITE
      ?auto_58340 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_58342 ?auto_58341 ) ( SUPPORTS ?auto_58342 ?auto_58339 ) ( POINTING ?auto_58341 ?auto_58340 ) ( not ( = ?auto_58338 ?auto_58340 ) ) ( HAVE_IMAGE ?auto_58337 ?auto_58334 ) ( not ( = ?auto_58337 ?auto_58338 ) ) ( not ( = ?auto_58337 ?auto_58340 ) ) ( not ( = ?auto_58334 ?auto_58339 ) ) ( CALIBRATION_TARGET ?auto_58342 ?auto_58340 ) ( POWER_AVAIL ?auto_58341 ) ( HAVE_IMAGE ?auto_58335 ?auto_58336 ) ( not ( = ?auto_58335 ?auto_58337 ) ) ( not ( = ?auto_58335 ?auto_58338 ) ) ( not ( = ?auto_58335 ?auto_58340 ) ) ( not ( = ?auto_58336 ?auto_58334 ) ) ( not ( = ?auto_58336 ?auto_58339 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_58337 ?auto_58334 ?auto_58338 ?auto_58339 )
      ( GET-3IMAGE-VERIFY ?auto_58335 ?auto_58336 ?auto_58337 ?auto_58334 ?auto_58338 ?auto_58339 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_58717 - DIRECTION
      ?auto_58718 - MODE
      ?auto_58719 - DIRECTION
      ?auto_58716 - MODE
      ?auto_58720 - DIRECTION
      ?auto_58721 - MODE
      ?auto_58722 - DIRECTION
      ?auto_58723 - MODE
    )
    :vars
    (
      ?auto_58726 - INSTRUMENT
      ?auto_58725 - SATELLITE
      ?auto_58724 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_58726 ?auto_58725 ) ( SUPPORTS ?auto_58726 ?auto_58723 ) ( POINTING ?auto_58725 ?auto_58724 ) ( not ( = ?auto_58722 ?auto_58724 ) ) ( HAVE_IMAGE ?auto_58720 ?auto_58718 ) ( not ( = ?auto_58720 ?auto_58722 ) ) ( not ( = ?auto_58720 ?auto_58724 ) ) ( not ( = ?auto_58718 ?auto_58723 ) ) ( CALIBRATION_TARGET ?auto_58726 ?auto_58724 ) ( POWER_AVAIL ?auto_58725 ) ( HAVE_IMAGE ?auto_58717 ?auto_58718 ) ( HAVE_IMAGE ?auto_58719 ?auto_58716 ) ( HAVE_IMAGE ?auto_58720 ?auto_58721 ) ( not ( = ?auto_58717 ?auto_58719 ) ) ( not ( = ?auto_58717 ?auto_58720 ) ) ( not ( = ?auto_58717 ?auto_58722 ) ) ( not ( = ?auto_58717 ?auto_58724 ) ) ( not ( = ?auto_58718 ?auto_58716 ) ) ( not ( = ?auto_58718 ?auto_58721 ) ) ( not ( = ?auto_58719 ?auto_58720 ) ) ( not ( = ?auto_58719 ?auto_58722 ) ) ( not ( = ?auto_58719 ?auto_58724 ) ) ( not ( = ?auto_58716 ?auto_58721 ) ) ( not ( = ?auto_58716 ?auto_58723 ) ) ( not ( = ?auto_58721 ?auto_58723 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_58720 ?auto_58718 ?auto_58722 ?auto_58723 )
      ( GET-4IMAGE-VERIFY ?auto_58717 ?auto_58718 ?auto_58719 ?auto_58716 ?auto_58720 ?auto_58721 ?auto_58722 ?auto_58723 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_59268 - DIRECTION
      ?auto_59269 - MODE
      ?auto_59270 - DIRECTION
      ?auto_59267 - MODE
      ?auto_59271 - DIRECTION
      ?auto_59272 - MODE
      ?auto_59273 - DIRECTION
      ?auto_59274 - MODE
    )
    :vars
    (
      ?auto_59277 - INSTRUMENT
      ?auto_59276 - SATELLITE
      ?auto_59275 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_59277 ?auto_59276 ) ( SUPPORTS ?auto_59277 ?auto_59267 ) ( POINTING ?auto_59276 ?auto_59275 ) ( not ( = ?auto_59270 ?auto_59275 ) ) ( HAVE_IMAGE ?auto_59273 ?auto_59272 ) ( not ( = ?auto_59273 ?auto_59270 ) ) ( not ( = ?auto_59273 ?auto_59275 ) ) ( not ( = ?auto_59272 ?auto_59267 ) ) ( CALIBRATION_TARGET ?auto_59277 ?auto_59275 ) ( POWER_AVAIL ?auto_59276 ) ( HAVE_IMAGE ?auto_59268 ?auto_59269 ) ( HAVE_IMAGE ?auto_59271 ?auto_59272 ) ( HAVE_IMAGE ?auto_59273 ?auto_59274 ) ( not ( = ?auto_59268 ?auto_59270 ) ) ( not ( = ?auto_59268 ?auto_59271 ) ) ( not ( = ?auto_59268 ?auto_59273 ) ) ( not ( = ?auto_59268 ?auto_59275 ) ) ( not ( = ?auto_59269 ?auto_59267 ) ) ( not ( = ?auto_59269 ?auto_59272 ) ) ( not ( = ?auto_59269 ?auto_59274 ) ) ( not ( = ?auto_59270 ?auto_59271 ) ) ( not ( = ?auto_59267 ?auto_59274 ) ) ( not ( = ?auto_59271 ?auto_59273 ) ) ( not ( = ?auto_59271 ?auto_59275 ) ) ( not ( = ?auto_59272 ?auto_59274 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_59273 ?auto_59272 ?auto_59270 ?auto_59267 )
      ( GET-4IMAGE-VERIFY ?auto_59268 ?auto_59269 ?auto_59270 ?auto_59267 ?auto_59271 ?auto_59272 ?auto_59273 ?auto_59274 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_60683 - DIRECTION
      ?auto_60684 - MODE
      ?auto_60685 - DIRECTION
      ?auto_60682 - MODE
      ?auto_60686 - DIRECTION
      ?auto_60687 - MODE
    )
    :vars
    (
      ?auto_60690 - INSTRUMENT
      ?auto_60688 - SATELLITE
      ?auto_60689 - DIRECTION
      ?auto_60691 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_60690 ?auto_60688 ) ( SUPPORTS ?auto_60690 ?auto_60687 ) ( not ( = ?auto_60686 ?auto_60689 ) ) ( HAVE_IMAGE ?auto_60683 ?auto_60684 ) ( not ( = ?auto_60683 ?auto_60686 ) ) ( not ( = ?auto_60683 ?auto_60689 ) ) ( not ( = ?auto_60684 ?auto_60687 ) ) ( CALIBRATION_TARGET ?auto_60690 ?auto_60689 ) ( POWER_AVAIL ?auto_60688 ) ( POINTING ?auto_60688 ?auto_60691 ) ( not ( = ?auto_60689 ?auto_60691 ) ) ( not ( = ?auto_60686 ?auto_60691 ) ) ( not ( = ?auto_60683 ?auto_60691 ) ) ( HAVE_IMAGE ?auto_60685 ?auto_60682 ) ( not ( = ?auto_60683 ?auto_60685 ) ) ( not ( = ?auto_60684 ?auto_60682 ) ) ( not ( = ?auto_60685 ?auto_60686 ) ) ( not ( = ?auto_60685 ?auto_60689 ) ) ( not ( = ?auto_60685 ?auto_60691 ) ) ( not ( = ?auto_60682 ?auto_60687 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_60683 ?auto_60684 ?auto_60686 ?auto_60687 )
      ( GET-3IMAGE-VERIFY ?auto_60683 ?auto_60684 ?auto_60685 ?auto_60682 ?auto_60686 ?auto_60687 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_60708 - DIRECTION
      ?auto_60709 - MODE
      ?auto_60710 - DIRECTION
      ?auto_60707 - MODE
      ?auto_60711 - DIRECTION
      ?auto_60712 - MODE
    )
    :vars
    (
      ?auto_60715 - INSTRUMENT
      ?auto_60713 - SATELLITE
      ?auto_60714 - DIRECTION
      ?auto_60716 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_60715 ?auto_60713 ) ( SUPPORTS ?auto_60715 ?auto_60707 ) ( not ( = ?auto_60710 ?auto_60714 ) ) ( HAVE_IMAGE ?auto_60708 ?auto_60709 ) ( not ( = ?auto_60708 ?auto_60710 ) ) ( not ( = ?auto_60708 ?auto_60714 ) ) ( not ( = ?auto_60709 ?auto_60707 ) ) ( CALIBRATION_TARGET ?auto_60715 ?auto_60714 ) ( POWER_AVAIL ?auto_60713 ) ( POINTING ?auto_60713 ?auto_60716 ) ( not ( = ?auto_60714 ?auto_60716 ) ) ( not ( = ?auto_60710 ?auto_60716 ) ) ( not ( = ?auto_60708 ?auto_60716 ) ) ( HAVE_IMAGE ?auto_60711 ?auto_60712 ) ( not ( = ?auto_60708 ?auto_60711 ) ) ( not ( = ?auto_60709 ?auto_60712 ) ) ( not ( = ?auto_60710 ?auto_60711 ) ) ( not ( = ?auto_60707 ?auto_60712 ) ) ( not ( = ?auto_60711 ?auto_60714 ) ) ( not ( = ?auto_60711 ?auto_60716 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_60708 ?auto_60709 ?auto_60710 ?auto_60707 )
      ( GET-3IMAGE-VERIFY ?auto_60708 ?auto_60709 ?auto_60710 ?auto_60707 ?auto_60711 ?auto_60712 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_60749 - DIRECTION
      ?auto_60750 - MODE
      ?auto_60751 - DIRECTION
      ?auto_60748 - MODE
      ?auto_60752 - DIRECTION
      ?auto_60753 - MODE
    )
    :vars
    (
      ?auto_60758 - INSTRUMENT
      ?auto_60754 - SATELLITE
      ?auto_60755 - DIRECTION
      ?auto_60756 - DIRECTION
      ?auto_60757 - MODE
      ?auto_60759 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_60758 ?auto_60754 ) ( SUPPORTS ?auto_60758 ?auto_60753 ) ( not ( = ?auto_60752 ?auto_60755 ) ) ( HAVE_IMAGE ?auto_60756 ?auto_60757 ) ( not ( = ?auto_60756 ?auto_60752 ) ) ( not ( = ?auto_60756 ?auto_60755 ) ) ( not ( = ?auto_60757 ?auto_60753 ) ) ( CALIBRATION_TARGET ?auto_60758 ?auto_60755 ) ( POWER_AVAIL ?auto_60754 ) ( POINTING ?auto_60754 ?auto_60759 ) ( not ( = ?auto_60755 ?auto_60759 ) ) ( not ( = ?auto_60752 ?auto_60759 ) ) ( not ( = ?auto_60756 ?auto_60759 ) ) ( HAVE_IMAGE ?auto_60749 ?auto_60750 ) ( HAVE_IMAGE ?auto_60751 ?auto_60748 ) ( not ( = ?auto_60749 ?auto_60751 ) ) ( not ( = ?auto_60749 ?auto_60752 ) ) ( not ( = ?auto_60749 ?auto_60755 ) ) ( not ( = ?auto_60749 ?auto_60756 ) ) ( not ( = ?auto_60749 ?auto_60759 ) ) ( not ( = ?auto_60750 ?auto_60748 ) ) ( not ( = ?auto_60750 ?auto_60753 ) ) ( not ( = ?auto_60750 ?auto_60757 ) ) ( not ( = ?auto_60751 ?auto_60752 ) ) ( not ( = ?auto_60751 ?auto_60755 ) ) ( not ( = ?auto_60751 ?auto_60756 ) ) ( not ( = ?auto_60751 ?auto_60759 ) ) ( not ( = ?auto_60748 ?auto_60753 ) ) ( not ( = ?auto_60748 ?auto_60757 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_60756 ?auto_60757 ?auto_60752 ?auto_60753 )
      ( GET-3IMAGE-VERIFY ?auto_60749 ?auto_60750 ?auto_60751 ?auto_60748 ?auto_60752 ?auto_60753 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_60773 - DIRECTION
      ?auto_60774 - MODE
      ?auto_60775 - DIRECTION
      ?auto_60772 - MODE
      ?auto_60776 - DIRECTION
      ?auto_60777 - MODE
    )
    :vars
    (
      ?auto_60782 - INSTRUMENT
      ?auto_60778 - SATELLITE
      ?auto_60779 - DIRECTION
      ?auto_60780 - DIRECTION
      ?auto_60781 - MODE
      ?auto_60783 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_60782 ?auto_60778 ) ( SUPPORTS ?auto_60782 ?auto_60772 ) ( not ( = ?auto_60775 ?auto_60779 ) ) ( HAVE_IMAGE ?auto_60780 ?auto_60781 ) ( not ( = ?auto_60780 ?auto_60775 ) ) ( not ( = ?auto_60780 ?auto_60779 ) ) ( not ( = ?auto_60781 ?auto_60772 ) ) ( CALIBRATION_TARGET ?auto_60782 ?auto_60779 ) ( POWER_AVAIL ?auto_60778 ) ( POINTING ?auto_60778 ?auto_60783 ) ( not ( = ?auto_60779 ?auto_60783 ) ) ( not ( = ?auto_60775 ?auto_60783 ) ) ( not ( = ?auto_60780 ?auto_60783 ) ) ( HAVE_IMAGE ?auto_60773 ?auto_60774 ) ( HAVE_IMAGE ?auto_60776 ?auto_60777 ) ( not ( = ?auto_60773 ?auto_60775 ) ) ( not ( = ?auto_60773 ?auto_60776 ) ) ( not ( = ?auto_60773 ?auto_60779 ) ) ( not ( = ?auto_60773 ?auto_60780 ) ) ( not ( = ?auto_60773 ?auto_60783 ) ) ( not ( = ?auto_60774 ?auto_60772 ) ) ( not ( = ?auto_60774 ?auto_60777 ) ) ( not ( = ?auto_60774 ?auto_60781 ) ) ( not ( = ?auto_60775 ?auto_60776 ) ) ( not ( = ?auto_60772 ?auto_60777 ) ) ( not ( = ?auto_60776 ?auto_60779 ) ) ( not ( = ?auto_60776 ?auto_60780 ) ) ( not ( = ?auto_60776 ?auto_60783 ) ) ( not ( = ?auto_60777 ?auto_60781 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_60780 ?auto_60781 ?auto_60775 ?auto_60772 )
      ( GET-3IMAGE-VERIFY ?auto_60773 ?auto_60774 ?auto_60775 ?auto_60772 ?auto_60776 ?auto_60777 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_60818 - DIRECTION
      ?auto_60819 - MODE
      ?auto_60820 - DIRECTION
      ?auto_60817 - MODE
      ?auto_60821 - DIRECTION
      ?auto_60822 - MODE
    )
    :vars
    (
      ?auto_60827 - INSTRUMENT
      ?auto_60823 - SATELLITE
      ?auto_60824 - DIRECTION
      ?auto_60825 - DIRECTION
      ?auto_60826 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_60827 ?auto_60823 ) ( SUPPORTS ?auto_60827 ?auto_60822 ) ( not ( = ?auto_60821 ?auto_60824 ) ) ( HAVE_IMAGE ?auto_60825 ?auto_60826 ) ( not ( = ?auto_60825 ?auto_60821 ) ) ( not ( = ?auto_60825 ?auto_60824 ) ) ( not ( = ?auto_60826 ?auto_60822 ) ) ( CALIBRATION_TARGET ?auto_60827 ?auto_60824 ) ( POWER_AVAIL ?auto_60823 ) ( POINTING ?auto_60823 ?auto_60820 ) ( not ( = ?auto_60824 ?auto_60820 ) ) ( not ( = ?auto_60821 ?auto_60820 ) ) ( not ( = ?auto_60825 ?auto_60820 ) ) ( HAVE_IMAGE ?auto_60818 ?auto_60819 ) ( HAVE_IMAGE ?auto_60820 ?auto_60817 ) ( not ( = ?auto_60818 ?auto_60820 ) ) ( not ( = ?auto_60818 ?auto_60821 ) ) ( not ( = ?auto_60818 ?auto_60824 ) ) ( not ( = ?auto_60818 ?auto_60825 ) ) ( not ( = ?auto_60819 ?auto_60817 ) ) ( not ( = ?auto_60819 ?auto_60822 ) ) ( not ( = ?auto_60819 ?auto_60826 ) ) ( not ( = ?auto_60817 ?auto_60822 ) ) ( not ( = ?auto_60817 ?auto_60826 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_60825 ?auto_60826 ?auto_60821 ?auto_60822 )
      ( GET-3IMAGE-VERIFY ?auto_60818 ?auto_60819 ?auto_60820 ?auto_60817 ?auto_60821 ?auto_60822 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_60866 - DIRECTION
      ?auto_60867 - MODE
      ?auto_60868 - DIRECTION
      ?auto_60865 - MODE
      ?auto_60869 - DIRECTION
      ?auto_60870 - MODE
    )
    :vars
    (
      ?auto_60873 - INSTRUMENT
      ?auto_60871 - SATELLITE
      ?auto_60872 - DIRECTION
      ?auto_60874 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_60873 ?auto_60871 ) ( SUPPORTS ?auto_60873 ?auto_60867 ) ( not ( = ?auto_60866 ?auto_60872 ) ) ( HAVE_IMAGE ?auto_60869 ?auto_60865 ) ( not ( = ?auto_60869 ?auto_60866 ) ) ( not ( = ?auto_60869 ?auto_60872 ) ) ( not ( = ?auto_60865 ?auto_60867 ) ) ( CALIBRATION_TARGET ?auto_60873 ?auto_60872 ) ( POWER_AVAIL ?auto_60871 ) ( POINTING ?auto_60871 ?auto_60874 ) ( not ( = ?auto_60872 ?auto_60874 ) ) ( not ( = ?auto_60866 ?auto_60874 ) ) ( not ( = ?auto_60869 ?auto_60874 ) ) ( HAVE_IMAGE ?auto_60868 ?auto_60865 ) ( HAVE_IMAGE ?auto_60869 ?auto_60870 ) ( not ( = ?auto_60866 ?auto_60868 ) ) ( not ( = ?auto_60867 ?auto_60870 ) ) ( not ( = ?auto_60868 ?auto_60869 ) ) ( not ( = ?auto_60868 ?auto_60872 ) ) ( not ( = ?auto_60868 ?auto_60874 ) ) ( not ( = ?auto_60865 ?auto_60870 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_60869 ?auto_60865 ?auto_60866 ?auto_60867 )
      ( GET-3IMAGE-VERIFY ?auto_60866 ?auto_60867 ?auto_60868 ?auto_60865 ?auto_60869 ?auto_60870 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_60876 - DIRECTION
      ?auto_60877 - MODE
      ?auto_60878 - DIRECTION
      ?auto_60875 - MODE
      ?auto_60879 - DIRECTION
      ?auto_60880 - MODE
    )
    :vars
    (
      ?auto_60883 - INSTRUMENT
      ?auto_60881 - SATELLITE
      ?auto_60882 - DIRECTION
      ?auto_60884 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_60883 ?auto_60881 ) ( SUPPORTS ?auto_60883 ?auto_60877 ) ( not ( = ?auto_60876 ?auto_60882 ) ) ( HAVE_IMAGE ?auto_60878 ?auto_60875 ) ( not ( = ?auto_60878 ?auto_60876 ) ) ( not ( = ?auto_60878 ?auto_60882 ) ) ( not ( = ?auto_60875 ?auto_60877 ) ) ( CALIBRATION_TARGET ?auto_60883 ?auto_60882 ) ( POWER_AVAIL ?auto_60881 ) ( POINTING ?auto_60881 ?auto_60884 ) ( not ( = ?auto_60882 ?auto_60884 ) ) ( not ( = ?auto_60876 ?auto_60884 ) ) ( not ( = ?auto_60878 ?auto_60884 ) ) ( HAVE_IMAGE ?auto_60879 ?auto_60880 ) ( not ( = ?auto_60876 ?auto_60879 ) ) ( not ( = ?auto_60877 ?auto_60880 ) ) ( not ( = ?auto_60878 ?auto_60879 ) ) ( not ( = ?auto_60875 ?auto_60880 ) ) ( not ( = ?auto_60879 ?auto_60882 ) ) ( not ( = ?auto_60879 ?auto_60884 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_60878 ?auto_60875 ?auto_60876 ?auto_60877 )
      ( GET-3IMAGE-VERIFY ?auto_60876 ?auto_60877 ?auto_60878 ?auto_60875 ?auto_60879 ?auto_60880 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_60911 - DIRECTION
      ?auto_60912 - MODE
      ?auto_60913 - DIRECTION
      ?auto_60910 - MODE
      ?auto_60914 - DIRECTION
      ?auto_60915 - MODE
    )
    :vars
    (
      ?auto_60920 - INSTRUMENT
      ?auto_60916 - SATELLITE
      ?auto_60917 - DIRECTION
      ?auto_60918 - DIRECTION
      ?auto_60919 - MODE
      ?auto_60921 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_60920 ?auto_60916 ) ( SUPPORTS ?auto_60920 ?auto_60912 ) ( not ( = ?auto_60911 ?auto_60917 ) ) ( HAVE_IMAGE ?auto_60918 ?auto_60919 ) ( not ( = ?auto_60918 ?auto_60911 ) ) ( not ( = ?auto_60918 ?auto_60917 ) ) ( not ( = ?auto_60919 ?auto_60912 ) ) ( CALIBRATION_TARGET ?auto_60920 ?auto_60917 ) ( POWER_AVAIL ?auto_60916 ) ( POINTING ?auto_60916 ?auto_60921 ) ( not ( = ?auto_60917 ?auto_60921 ) ) ( not ( = ?auto_60911 ?auto_60921 ) ) ( not ( = ?auto_60918 ?auto_60921 ) ) ( HAVE_IMAGE ?auto_60913 ?auto_60910 ) ( HAVE_IMAGE ?auto_60914 ?auto_60915 ) ( not ( = ?auto_60911 ?auto_60913 ) ) ( not ( = ?auto_60911 ?auto_60914 ) ) ( not ( = ?auto_60912 ?auto_60910 ) ) ( not ( = ?auto_60912 ?auto_60915 ) ) ( not ( = ?auto_60913 ?auto_60914 ) ) ( not ( = ?auto_60913 ?auto_60917 ) ) ( not ( = ?auto_60913 ?auto_60918 ) ) ( not ( = ?auto_60913 ?auto_60921 ) ) ( not ( = ?auto_60910 ?auto_60915 ) ) ( not ( = ?auto_60910 ?auto_60919 ) ) ( not ( = ?auto_60914 ?auto_60917 ) ) ( not ( = ?auto_60914 ?auto_60918 ) ) ( not ( = ?auto_60914 ?auto_60921 ) ) ( not ( = ?auto_60915 ?auto_60919 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_60918 ?auto_60919 ?auto_60911 ?auto_60912 )
      ( GET-3IMAGE-VERIFY ?auto_60911 ?auto_60912 ?auto_60913 ?auto_60910 ?auto_60914 ?auto_60915 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_60956 - DIRECTION
      ?auto_60957 - MODE
      ?auto_60958 - DIRECTION
      ?auto_60955 - MODE
      ?auto_60959 - DIRECTION
      ?auto_60960 - MODE
    )
    :vars
    (
      ?auto_60965 - INSTRUMENT
      ?auto_60961 - SATELLITE
      ?auto_60962 - DIRECTION
      ?auto_60963 - DIRECTION
      ?auto_60964 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_60965 ?auto_60961 ) ( SUPPORTS ?auto_60965 ?auto_60957 ) ( not ( = ?auto_60956 ?auto_60962 ) ) ( HAVE_IMAGE ?auto_60963 ?auto_60964 ) ( not ( = ?auto_60963 ?auto_60956 ) ) ( not ( = ?auto_60963 ?auto_60962 ) ) ( not ( = ?auto_60964 ?auto_60957 ) ) ( CALIBRATION_TARGET ?auto_60965 ?auto_60962 ) ( POWER_AVAIL ?auto_60961 ) ( POINTING ?auto_60961 ?auto_60958 ) ( not ( = ?auto_60962 ?auto_60958 ) ) ( not ( = ?auto_60956 ?auto_60958 ) ) ( not ( = ?auto_60963 ?auto_60958 ) ) ( HAVE_IMAGE ?auto_60958 ?auto_60955 ) ( HAVE_IMAGE ?auto_60959 ?auto_60960 ) ( not ( = ?auto_60956 ?auto_60959 ) ) ( not ( = ?auto_60957 ?auto_60955 ) ) ( not ( = ?auto_60957 ?auto_60960 ) ) ( not ( = ?auto_60958 ?auto_60959 ) ) ( not ( = ?auto_60955 ?auto_60960 ) ) ( not ( = ?auto_60955 ?auto_60964 ) ) ( not ( = ?auto_60959 ?auto_60962 ) ) ( not ( = ?auto_60959 ?auto_60963 ) ) ( not ( = ?auto_60960 ?auto_60964 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_60963 ?auto_60964 ?auto_60956 ?auto_60957 )
      ( GET-3IMAGE-VERIFY ?auto_60956 ?auto_60957 ?auto_60958 ?auto_60955 ?auto_60959 ?auto_60960 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61023 - DIRECTION
      ?auto_61024 - MODE
      ?auto_61025 - DIRECTION
      ?auto_61022 - MODE
      ?auto_61026 - DIRECTION
      ?auto_61027 - MODE
      ?auto_61028 - DIRECTION
      ?auto_61029 - MODE
    )
    :vars
    (
      ?auto_61032 - INSTRUMENT
      ?auto_61030 - SATELLITE
      ?auto_61031 - DIRECTION
      ?auto_61033 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_61032 ?auto_61030 ) ( SUPPORTS ?auto_61032 ?auto_61029 ) ( not ( = ?auto_61028 ?auto_61031 ) ) ( HAVE_IMAGE ?auto_61026 ?auto_61027 ) ( not ( = ?auto_61026 ?auto_61028 ) ) ( not ( = ?auto_61026 ?auto_61031 ) ) ( not ( = ?auto_61027 ?auto_61029 ) ) ( CALIBRATION_TARGET ?auto_61032 ?auto_61031 ) ( POWER_AVAIL ?auto_61030 ) ( POINTING ?auto_61030 ?auto_61033 ) ( not ( = ?auto_61031 ?auto_61033 ) ) ( not ( = ?auto_61028 ?auto_61033 ) ) ( not ( = ?auto_61026 ?auto_61033 ) ) ( HAVE_IMAGE ?auto_61023 ?auto_61024 ) ( HAVE_IMAGE ?auto_61025 ?auto_61022 ) ( not ( = ?auto_61023 ?auto_61025 ) ) ( not ( = ?auto_61023 ?auto_61026 ) ) ( not ( = ?auto_61023 ?auto_61028 ) ) ( not ( = ?auto_61023 ?auto_61031 ) ) ( not ( = ?auto_61023 ?auto_61033 ) ) ( not ( = ?auto_61024 ?auto_61022 ) ) ( not ( = ?auto_61024 ?auto_61027 ) ) ( not ( = ?auto_61024 ?auto_61029 ) ) ( not ( = ?auto_61025 ?auto_61026 ) ) ( not ( = ?auto_61025 ?auto_61028 ) ) ( not ( = ?auto_61025 ?auto_61031 ) ) ( not ( = ?auto_61025 ?auto_61033 ) ) ( not ( = ?auto_61022 ?auto_61027 ) ) ( not ( = ?auto_61022 ?auto_61029 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61026 ?auto_61027 ?auto_61028 ?auto_61029 )
      ( GET-4IMAGE-VERIFY ?auto_61023 ?auto_61024 ?auto_61025 ?auto_61022 ?auto_61026 ?auto_61027 ?auto_61028 ?auto_61029 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61070 - DIRECTION
      ?auto_61071 - MODE
      ?auto_61072 - DIRECTION
      ?auto_61069 - MODE
      ?auto_61073 - DIRECTION
      ?auto_61074 - MODE
      ?auto_61075 - DIRECTION
      ?auto_61076 - MODE
    )
    :vars
    (
      ?auto_61079 - INSTRUMENT
      ?auto_61077 - SATELLITE
      ?auto_61078 - DIRECTION
      ?auto_61080 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_61079 ?auto_61077 ) ( SUPPORTS ?auto_61079 ?auto_61074 ) ( not ( = ?auto_61073 ?auto_61078 ) ) ( HAVE_IMAGE ?auto_61070 ?auto_61071 ) ( not ( = ?auto_61070 ?auto_61073 ) ) ( not ( = ?auto_61070 ?auto_61078 ) ) ( not ( = ?auto_61071 ?auto_61074 ) ) ( CALIBRATION_TARGET ?auto_61079 ?auto_61078 ) ( POWER_AVAIL ?auto_61077 ) ( POINTING ?auto_61077 ?auto_61080 ) ( not ( = ?auto_61078 ?auto_61080 ) ) ( not ( = ?auto_61073 ?auto_61080 ) ) ( not ( = ?auto_61070 ?auto_61080 ) ) ( HAVE_IMAGE ?auto_61072 ?auto_61069 ) ( HAVE_IMAGE ?auto_61075 ?auto_61076 ) ( not ( = ?auto_61070 ?auto_61072 ) ) ( not ( = ?auto_61070 ?auto_61075 ) ) ( not ( = ?auto_61071 ?auto_61069 ) ) ( not ( = ?auto_61071 ?auto_61076 ) ) ( not ( = ?auto_61072 ?auto_61073 ) ) ( not ( = ?auto_61072 ?auto_61075 ) ) ( not ( = ?auto_61072 ?auto_61078 ) ) ( not ( = ?auto_61072 ?auto_61080 ) ) ( not ( = ?auto_61069 ?auto_61074 ) ) ( not ( = ?auto_61069 ?auto_61076 ) ) ( not ( = ?auto_61073 ?auto_61075 ) ) ( not ( = ?auto_61074 ?auto_61076 ) ) ( not ( = ?auto_61075 ?auto_61078 ) ) ( not ( = ?auto_61075 ?auto_61080 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61070 ?auto_61071 ?auto_61073 ?auto_61074 )
      ( GET-4IMAGE-VERIFY ?auto_61070 ?auto_61071 ?auto_61072 ?auto_61069 ?auto_61073 ?auto_61074 ?auto_61075 ?auto_61076 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61082 - DIRECTION
      ?auto_61083 - MODE
      ?auto_61084 - DIRECTION
      ?auto_61081 - MODE
      ?auto_61085 - DIRECTION
      ?auto_61086 - MODE
      ?auto_61087 - DIRECTION
      ?auto_61088 - MODE
    )
    :vars
    (
      ?auto_61091 - INSTRUMENT
      ?auto_61089 - SATELLITE
      ?auto_61090 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_61091 ?auto_61089 ) ( SUPPORTS ?auto_61091 ?auto_61086 ) ( not ( = ?auto_61085 ?auto_61090 ) ) ( HAVE_IMAGE ?auto_61082 ?auto_61083 ) ( not ( = ?auto_61082 ?auto_61085 ) ) ( not ( = ?auto_61082 ?auto_61090 ) ) ( not ( = ?auto_61083 ?auto_61086 ) ) ( CALIBRATION_TARGET ?auto_61091 ?auto_61090 ) ( POWER_AVAIL ?auto_61089 ) ( POINTING ?auto_61089 ?auto_61087 ) ( not ( = ?auto_61090 ?auto_61087 ) ) ( not ( = ?auto_61085 ?auto_61087 ) ) ( not ( = ?auto_61082 ?auto_61087 ) ) ( HAVE_IMAGE ?auto_61084 ?auto_61081 ) ( HAVE_IMAGE ?auto_61087 ?auto_61088 ) ( not ( = ?auto_61082 ?auto_61084 ) ) ( not ( = ?auto_61083 ?auto_61081 ) ) ( not ( = ?auto_61083 ?auto_61088 ) ) ( not ( = ?auto_61084 ?auto_61085 ) ) ( not ( = ?auto_61084 ?auto_61087 ) ) ( not ( = ?auto_61084 ?auto_61090 ) ) ( not ( = ?auto_61081 ?auto_61086 ) ) ( not ( = ?auto_61081 ?auto_61088 ) ) ( not ( = ?auto_61086 ?auto_61088 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61082 ?auto_61083 ?auto_61085 ?auto_61086 )
      ( GET-4IMAGE-VERIFY ?auto_61082 ?auto_61083 ?auto_61084 ?auto_61081 ?auto_61085 ?auto_61086 ?auto_61087 ?auto_61088 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61117 - DIRECTION
      ?auto_61118 - MODE
      ?auto_61119 - DIRECTION
      ?auto_61116 - MODE
      ?auto_61120 - DIRECTION
      ?auto_61121 - MODE
      ?auto_61122 - DIRECTION
      ?auto_61123 - MODE
    )
    :vars
    (
      ?auto_61126 - INSTRUMENT
      ?auto_61124 - SATELLITE
      ?auto_61125 - DIRECTION
      ?auto_61127 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_61126 ?auto_61124 ) ( SUPPORTS ?auto_61126 ?auto_61123 ) ( not ( = ?auto_61122 ?auto_61125 ) ) ( HAVE_IMAGE ?auto_61117 ?auto_61118 ) ( not ( = ?auto_61117 ?auto_61122 ) ) ( not ( = ?auto_61117 ?auto_61125 ) ) ( not ( = ?auto_61118 ?auto_61123 ) ) ( CALIBRATION_TARGET ?auto_61126 ?auto_61125 ) ( POWER_AVAIL ?auto_61124 ) ( POINTING ?auto_61124 ?auto_61127 ) ( not ( = ?auto_61125 ?auto_61127 ) ) ( not ( = ?auto_61122 ?auto_61127 ) ) ( not ( = ?auto_61117 ?auto_61127 ) ) ( HAVE_IMAGE ?auto_61119 ?auto_61116 ) ( HAVE_IMAGE ?auto_61120 ?auto_61121 ) ( not ( = ?auto_61117 ?auto_61119 ) ) ( not ( = ?auto_61117 ?auto_61120 ) ) ( not ( = ?auto_61118 ?auto_61116 ) ) ( not ( = ?auto_61118 ?auto_61121 ) ) ( not ( = ?auto_61119 ?auto_61120 ) ) ( not ( = ?auto_61119 ?auto_61122 ) ) ( not ( = ?auto_61119 ?auto_61125 ) ) ( not ( = ?auto_61119 ?auto_61127 ) ) ( not ( = ?auto_61116 ?auto_61121 ) ) ( not ( = ?auto_61116 ?auto_61123 ) ) ( not ( = ?auto_61120 ?auto_61122 ) ) ( not ( = ?auto_61120 ?auto_61125 ) ) ( not ( = ?auto_61120 ?auto_61127 ) ) ( not ( = ?auto_61121 ?auto_61123 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61117 ?auto_61118 ?auto_61122 ?auto_61123 )
      ( GET-4IMAGE-VERIFY ?auto_61117 ?auto_61118 ?auto_61119 ?auto_61116 ?auto_61120 ?auto_61121 ?auto_61122 ?auto_61123 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61267 - DIRECTION
      ?auto_61268 - MODE
      ?auto_61269 - DIRECTION
      ?auto_61266 - MODE
      ?auto_61270 - DIRECTION
      ?auto_61271 - MODE
      ?auto_61272 - DIRECTION
      ?auto_61273 - MODE
    )
    :vars
    (
      ?auto_61276 - INSTRUMENT
      ?auto_61274 - SATELLITE
      ?auto_61275 - DIRECTION
      ?auto_61277 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_61276 ?auto_61274 ) ( SUPPORTS ?auto_61276 ?auto_61266 ) ( not ( = ?auto_61269 ?auto_61275 ) ) ( HAVE_IMAGE ?auto_61267 ?auto_61268 ) ( not ( = ?auto_61267 ?auto_61269 ) ) ( not ( = ?auto_61267 ?auto_61275 ) ) ( not ( = ?auto_61268 ?auto_61266 ) ) ( CALIBRATION_TARGET ?auto_61276 ?auto_61275 ) ( POWER_AVAIL ?auto_61274 ) ( POINTING ?auto_61274 ?auto_61277 ) ( not ( = ?auto_61275 ?auto_61277 ) ) ( not ( = ?auto_61269 ?auto_61277 ) ) ( not ( = ?auto_61267 ?auto_61277 ) ) ( HAVE_IMAGE ?auto_61270 ?auto_61271 ) ( HAVE_IMAGE ?auto_61272 ?auto_61273 ) ( not ( = ?auto_61267 ?auto_61270 ) ) ( not ( = ?auto_61267 ?auto_61272 ) ) ( not ( = ?auto_61268 ?auto_61271 ) ) ( not ( = ?auto_61268 ?auto_61273 ) ) ( not ( = ?auto_61269 ?auto_61270 ) ) ( not ( = ?auto_61269 ?auto_61272 ) ) ( not ( = ?auto_61266 ?auto_61271 ) ) ( not ( = ?auto_61266 ?auto_61273 ) ) ( not ( = ?auto_61270 ?auto_61272 ) ) ( not ( = ?auto_61270 ?auto_61275 ) ) ( not ( = ?auto_61270 ?auto_61277 ) ) ( not ( = ?auto_61271 ?auto_61273 ) ) ( not ( = ?auto_61272 ?auto_61275 ) ) ( not ( = ?auto_61272 ?auto_61277 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61267 ?auto_61268 ?auto_61269 ?auto_61266 )
      ( GET-4IMAGE-VERIFY ?auto_61267 ?auto_61268 ?auto_61269 ?auto_61266 ?auto_61270 ?auto_61271 ?auto_61272 ?auto_61273 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61365 - DIRECTION
      ?auto_61366 - MODE
      ?auto_61367 - DIRECTION
      ?auto_61364 - MODE
      ?auto_61368 - DIRECTION
      ?auto_61369 - MODE
      ?auto_61370 - DIRECTION
      ?auto_61371 - MODE
    )
    :vars
    (
      ?auto_61374 - INSTRUMENT
      ?auto_61372 - SATELLITE
      ?auto_61373 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_61374 ?auto_61372 ) ( SUPPORTS ?auto_61374 ?auto_61364 ) ( not ( = ?auto_61367 ?auto_61373 ) ) ( HAVE_IMAGE ?auto_61365 ?auto_61366 ) ( not ( = ?auto_61365 ?auto_61367 ) ) ( not ( = ?auto_61365 ?auto_61373 ) ) ( not ( = ?auto_61366 ?auto_61364 ) ) ( CALIBRATION_TARGET ?auto_61374 ?auto_61373 ) ( POWER_AVAIL ?auto_61372 ) ( POINTING ?auto_61372 ?auto_61370 ) ( not ( = ?auto_61373 ?auto_61370 ) ) ( not ( = ?auto_61367 ?auto_61370 ) ) ( not ( = ?auto_61365 ?auto_61370 ) ) ( HAVE_IMAGE ?auto_61368 ?auto_61369 ) ( HAVE_IMAGE ?auto_61370 ?auto_61371 ) ( not ( = ?auto_61365 ?auto_61368 ) ) ( not ( = ?auto_61366 ?auto_61369 ) ) ( not ( = ?auto_61366 ?auto_61371 ) ) ( not ( = ?auto_61367 ?auto_61368 ) ) ( not ( = ?auto_61364 ?auto_61369 ) ) ( not ( = ?auto_61364 ?auto_61371 ) ) ( not ( = ?auto_61368 ?auto_61370 ) ) ( not ( = ?auto_61368 ?auto_61373 ) ) ( not ( = ?auto_61369 ?auto_61371 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61365 ?auto_61366 ?auto_61367 ?auto_61364 )
      ( GET-4IMAGE-VERIFY ?auto_61365 ?auto_61366 ?auto_61367 ?auto_61364 ?auto_61368 ?auto_61369 ?auto_61370 ?auto_61371 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61434 - DIRECTION
      ?auto_61435 - MODE
      ?auto_61436 - DIRECTION
      ?auto_61433 - MODE
      ?auto_61437 - DIRECTION
      ?auto_61438 - MODE
      ?auto_61439 - DIRECTION
      ?auto_61440 - MODE
    )
    :vars
    (
      ?auto_61443 - INSTRUMENT
      ?auto_61441 - SATELLITE
      ?auto_61442 - DIRECTION
      ?auto_61444 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_61443 ?auto_61441 ) ( SUPPORTS ?auto_61443 ?auto_61440 ) ( not ( = ?auto_61439 ?auto_61442 ) ) ( HAVE_IMAGE ?auto_61436 ?auto_61438 ) ( not ( = ?auto_61436 ?auto_61439 ) ) ( not ( = ?auto_61436 ?auto_61442 ) ) ( not ( = ?auto_61438 ?auto_61440 ) ) ( CALIBRATION_TARGET ?auto_61443 ?auto_61442 ) ( POWER_AVAIL ?auto_61441 ) ( POINTING ?auto_61441 ?auto_61444 ) ( not ( = ?auto_61442 ?auto_61444 ) ) ( not ( = ?auto_61439 ?auto_61444 ) ) ( not ( = ?auto_61436 ?auto_61444 ) ) ( HAVE_IMAGE ?auto_61434 ?auto_61435 ) ( HAVE_IMAGE ?auto_61436 ?auto_61433 ) ( HAVE_IMAGE ?auto_61437 ?auto_61438 ) ( not ( = ?auto_61434 ?auto_61436 ) ) ( not ( = ?auto_61434 ?auto_61437 ) ) ( not ( = ?auto_61434 ?auto_61439 ) ) ( not ( = ?auto_61434 ?auto_61442 ) ) ( not ( = ?auto_61434 ?auto_61444 ) ) ( not ( = ?auto_61435 ?auto_61433 ) ) ( not ( = ?auto_61435 ?auto_61438 ) ) ( not ( = ?auto_61435 ?auto_61440 ) ) ( not ( = ?auto_61436 ?auto_61437 ) ) ( not ( = ?auto_61433 ?auto_61438 ) ) ( not ( = ?auto_61433 ?auto_61440 ) ) ( not ( = ?auto_61437 ?auto_61439 ) ) ( not ( = ?auto_61437 ?auto_61442 ) ) ( not ( = ?auto_61437 ?auto_61444 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61436 ?auto_61438 ?auto_61439 ?auto_61440 )
      ( GET-4IMAGE-VERIFY ?auto_61434 ?auto_61435 ?auto_61436 ?auto_61433 ?auto_61437 ?auto_61438 ?auto_61439 ?auto_61440 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61446 - DIRECTION
      ?auto_61447 - MODE
      ?auto_61448 - DIRECTION
      ?auto_61445 - MODE
      ?auto_61449 - DIRECTION
      ?auto_61450 - MODE
      ?auto_61451 - DIRECTION
      ?auto_61452 - MODE
    )
    :vars
    (
      ?auto_61455 - INSTRUMENT
      ?auto_61453 - SATELLITE
      ?auto_61454 - DIRECTION
      ?auto_61456 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_61455 ?auto_61453 ) ( SUPPORTS ?auto_61455 ?auto_61452 ) ( not ( = ?auto_61451 ?auto_61454 ) ) ( HAVE_IMAGE ?auto_61448 ?auto_61445 ) ( not ( = ?auto_61448 ?auto_61451 ) ) ( not ( = ?auto_61448 ?auto_61454 ) ) ( not ( = ?auto_61445 ?auto_61452 ) ) ( CALIBRATION_TARGET ?auto_61455 ?auto_61454 ) ( POWER_AVAIL ?auto_61453 ) ( POINTING ?auto_61453 ?auto_61456 ) ( not ( = ?auto_61454 ?auto_61456 ) ) ( not ( = ?auto_61451 ?auto_61456 ) ) ( not ( = ?auto_61448 ?auto_61456 ) ) ( HAVE_IMAGE ?auto_61446 ?auto_61447 ) ( HAVE_IMAGE ?auto_61449 ?auto_61450 ) ( not ( = ?auto_61446 ?auto_61448 ) ) ( not ( = ?auto_61446 ?auto_61449 ) ) ( not ( = ?auto_61446 ?auto_61451 ) ) ( not ( = ?auto_61446 ?auto_61454 ) ) ( not ( = ?auto_61446 ?auto_61456 ) ) ( not ( = ?auto_61447 ?auto_61445 ) ) ( not ( = ?auto_61447 ?auto_61450 ) ) ( not ( = ?auto_61447 ?auto_61452 ) ) ( not ( = ?auto_61448 ?auto_61449 ) ) ( not ( = ?auto_61445 ?auto_61450 ) ) ( not ( = ?auto_61449 ?auto_61451 ) ) ( not ( = ?auto_61449 ?auto_61454 ) ) ( not ( = ?auto_61449 ?auto_61456 ) ) ( not ( = ?auto_61450 ?auto_61452 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61448 ?auto_61445 ?auto_61451 ?auto_61452 )
      ( GET-4IMAGE-VERIFY ?auto_61446 ?auto_61447 ?auto_61448 ?auto_61445 ?auto_61449 ?auto_61450 ?auto_61451 ?auto_61452 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61466 - DIRECTION
      ?auto_61467 - MODE
      ?auto_61468 - DIRECTION
      ?auto_61465 - MODE
      ?auto_61469 - DIRECTION
      ?auto_61470 - MODE
      ?auto_61471 - DIRECTION
      ?auto_61472 - MODE
    )
    :vars
    (
      ?auto_61475 - INSTRUMENT
      ?auto_61473 - SATELLITE
      ?auto_61474 - DIRECTION
      ?auto_61476 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_61475 ?auto_61473 ) ( SUPPORTS ?auto_61475 ?auto_61470 ) ( not ( = ?auto_61469 ?auto_61474 ) ) ( HAVE_IMAGE ?auto_61471 ?auto_61472 ) ( not ( = ?auto_61471 ?auto_61469 ) ) ( not ( = ?auto_61471 ?auto_61474 ) ) ( not ( = ?auto_61472 ?auto_61470 ) ) ( CALIBRATION_TARGET ?auto_61475 ?auto_61474 ) ( POWER_AVAIL ?auto_61473 ) ( POINTING ?auto_61473 ?auto_61476 ) ( not ( = ?auto_61474 ?auto_61476 ) ) ( not ( = ?auto_61469 ?auto_61476 ) ) ( not ( = ?auto_61471 ?auto_61476 ) ) ( HAVE_IMAGE ?auto_61466 ?auto_61467 ) ( HAVE_IMAGE ?auto_61468 ?auto_61465 ) ( not ( = ?auto_61466 ?auto_61468 ) ) ( not ( = ?auto_61466 ?auto_61469 ) ) ( not ( = ?auto_61466 ?auto_61471 ) ) ( not ( = ?auto_61466 ?auto_61474 ) ) ( not ( = ?auto_61466 ?auto_61476 ) ) ( not ( = ?auto_61467 ?auto_61465 ) ) ( not ( = ?auto_61467 ?auto_61470 ) ) ( not ( = ?auto_61467 ?auto_61472 ) ) ( not ( = ?auto_61468 ?auto_61469 ) ) ( not ( = ?auto_61468 ?auto_61471 ) ) ( not ( = ?auto_61468 ?auto_61474 ) ) ( not ( = ?auto_61468 ?auto_61476 ) ) ( not ( = ?auto_61465 ?auto_61470 ) ) ( not ( = ?auto_61465 ?auto_61472 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61471 ?auto_61472 ?auto_61469 ?auto_61470 )
      ( GET-4IMAGE-VERIFY ?auto_61466 ?auto_61467 ?auto_61468 ?auto_61465 ?auto_61469 ?auto_61470 ?auto_61471 ?auto_61472 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61478 - DIRECTION
      ?auto_61479 - MODE
      ?auto_61480 - DIRECTION
      ?auto_61477 - MODE
      ?auto_61481 - DIRECTION
      ?auto_61482 - MODE
      ?auto_61483 - DIRECTION
      ?auto_61484 - MODE
    )
    :vars
    (
      ?auto_61487 - INSTRUMENT
      ?auto_61485 - SATELLITE
      ?auto_61486 - DIRECTION
      ?auto_61488 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_61487 ?auto_61485 ) ( SUPPORTS ?auto_61487 ?auto_61482 ) ( not ( = ?auto_61481 ?auto_61486 ) ) ( HAVE_IMAGE ?auto_61480 ?auto_61477 ) ( not ( = ?auto_61480 ?auto_61481 ) ) ( not ( = ?auto_61480 ?auto_61486 ) ) ( not ( = ?auto_61477 ?auto_61482 ) ) ( CALIBRATION_TARGET ?auto_61487 ?auto_61486 ) ( POWER_AVAIL ?auto_61485 ) ( POINTING ?auto_61485 ?auto_61488 ) ( not ( = ?auto_61486 ?auto_61488 ) ) ( not ( = ?auto_61481 ?auto_61488 ) ) ( not ( = ?auto_61480 ?auto_61488 ) ) ( HAVE_IMAGE ?auto_61478 ?auto_61479 ) ( HAVE_IMAGE ?auto_61483 ?auto_61484 ) ( not ( = ?auto_61478 ?auto_61480 ) ) ( not ( = ?auto_61478 ?auto_61481 ) ) ( not ( = ?auto_61478 ?auto_61483 ) ) ( not ( = ?auto_61478 ?auto_61486 ) ) ( not ( = ?auto_61478 ?auto_61488 ) ) ( not ( = ?auto_61479 ?auto_61477 ) ) ( not ( = ?auto_61479 ?auto_61482 ) ) ( not ( = ?auto_61479 ?auto_61484 ) ) ( not ( = ?auto_61480 ?auto_61483 ) ) ( not ( = ?auto_61477 ?auto_61484 ) ) ( not ( = ?auto_61481 ?auto_61483 ) ) ( not ( = ?auto_61482 ?auto_61484 ) ) ( not ( = ?auto_61483 ?auto_61486 ) ) ( not ( = ?auto_61483 ?auto_61488 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61480 ?auto_61477 ?auto_61481 ?auto_61482 )
      ( GET-4IMAGE-VERIFY ?auto_61478 ?auto_61479 ?auto_61480 ?auto_61477 ?auto_61481 ?auto_61482 ?auto_61483 ?auto_61484 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61522 - DIRECTION
      ?auto_61523 - MODE
      ?auto_61524 - DIRECTION
      ?auto_61521 - MODE
      ?auto_61525 - DIRECTION
      ?auto_61526 - MODE
      ?auto_61527 - DIRECTION
      ?auto_61528 - MODE
    )
    :vars
    (
      ?auto_61533 - INSTRUMENT
      ?auto_61529 - SATELLITE
      ?auto_61530 - DIRECTION
      ?auto_61531 - DIRECTION
      ?auto_61532 - MODE
      ?auto_61534 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_61533 ?auto_61529 ) ( SUPPORTS ?auto_61533 ?auto_61528 ) ( not ( = ?auto_61527 ?auto_61530 ) ) ( HAVE_IMAGE ?auto_61531 ?auto_61532 ) ( not ( = ?auto_61531 ?auto_61527 ) ) ( not ( = ?auto_61531 ?auto_61530 ) ) ( not ( = ?auto_61532 ?auto_61528 ) ) ( CALIBRATION_TARGET ?auto_61533 ?auto_61530 ) ( POWER_AVAIL ?auto_61529 ) ( POINTING ?auto_61529 ?auto_61534 ) ( not ( = ?auto_61530 ?auto_61534 ) ) ( not ( = ?auto_61527 ?auto_61534 ) ) ( not ( = ?auto_61531 ?auto_61534 ) ) ( HAVE_IMAGE ?auto_61522 ?auto_61523 ) ( HAVE_IMAGE ?auto_61524 ?auto_61521 ) ( HAVE_IMAGE ?auto_61525 ?auto_61526 ) ( not ( = ?auto_61522 ?auto_61524 ) ) ( not ( = ?auto_61522 ?auto_61525 ) ) ( not ( = ?auto_61522 ?auto_61527 ) ) ( not ( = ?auto_61522 ?auto_61530 ) ) ( not ( = ?auto_61522 ?auto_61531 ) ) ( not ( = ?auto_61522 ?auto_61534 ) ) ( not ( = ?auto_61523 ?auto_61521 ) ) ( not ( = ?auto_61523 ?auto_61526 ) ) ( not ( = ?auto_61523 ?auto_61528 ) ) ( not ( = ?auto_61523 ?auto_61532 ) ) ( not ( = ?auto_61524 ?auto_61525 ) ) ( not ( = ?auto_61524 ?auto_61527 ) ) ( not ( = ?auto_61524 ?auto_61530 ) ) ( not ( = ?auto_61524 ?auto_61531 ) ) ( not ( = ?auto_61524 ?auto_61534 ) ) ( not ( = ?auto_61521 ?auto_61526 ) ) ( not ( = ?auto_61521 ?auto_61528 ) ) ( not ( = ?auto_61521 ?auto_61532 ) ) ( not ( = ?auto_61525 ?auto_61527 ) ) ( not ( = ?auto_61525 ?auto_61530 ) ) ( not ( = ?auto_61525 ?auto_61531 ) ) ( not ( = ?auto_61525 ?auto_61534 ) ) ( not ( = ?auto_61526 ?auto_61528 ) ) ( not ( = ?auto_61526 ?auto_61532 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61531 ?auto_61532 ?auto_61527 ?auto_61528 )
      ( GET-4IMAGE-VERIFY ?auto_61522 ?auto_61523 ?auto_61524 ?auto_61521 ?auto_61525 ?auto_61526 ?auto_61527 ?auto_61528 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61561 - DIRECTION
      ?auto_61562 - MODE
      ?auto_61563 - DIRECTION
      ?auto_61560 - MODE
      ?auto_61564 - DIRECTION
      ?auto_61565 - MODE
      ?auto_61566 - DIRECTION
      ?auto_61567 - MODE
    )
    :vars
    (
      ?auto_61572 - INSTRUMENT
      ?auto_61568 - SATELLITE
      ?auto_61569 - DIRECTION
      ?auto_61570 - DIRECTION
      ?auto_61571 - MODE
      ?auto_61573 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_61572 ?auto_61568 ) ( SUPPORTS ?auto_61572 ?auto_61565 ) ( not ( = ?auto_61564 ?auto_61569 ) ) ( HAVE_IMAGE ?auto_61570 ?auto_61571 ) ( not ( = ?auto_61570 ?auto_61564 ) ) ( not ( = ?auto_61570 ?auto_61569 ) ) ( not ( = ?auto_61571 ?auto_61565 ) ) ( CALIBRATION_TARGET ?auto_61572 ?auto_61569 ) ( POWER_AVAIL ?auto_61568 ) ( POINTING ?auto_61568 ?auto_61573 ) ( not ( = ?auto_61569 ?auto_61573 ) ) ( not ( = ?auto_61564 ?auto_61573 ) ) ( not ( = ?auto_61570 ?auto_61573 ) ) ( HAVE_IMAGE ?auto_61561 ?auto_61562 ) ( HAVE_IMAGE ?auto_61563 ?auto_61560 ) ( HAVE_IMAGE ?auto_61566 ?auto_61567 ) ( not ( = ?auto_61561 ?auto_61563 ) ) ( not ( = ?auto_61561 ?auto_61564 ) ) ( not ( = ?auto_61561 ?auto_61566 ) ) ( not ( = ?auto_61561 ?auto_61569 ) ) ( not ( = ?auto_61561 ?auto_61570 ) ) ( not ( = ?auto_61561 ?auto_61573 ) ) ( not ( = ?auto_61562 ?auto_61560 ) ) ( not ( = ?auto_61562 ?auto_61565 ) ) ( not ( = ?auto_61562 ?auto_61567 ) ) ( not ( = ?auto_61562 ?auto_61571 ) ) ( not ( = ?auto_61563 ?auto_61564 ) ) ( not ( = ?auto_61563 ?auto_61566 ) ) ( not ( = ?auto_61563 ?auto_61569 ) ) ( not ( = ?auto_61563 ?auto_61570 ) ) ( not ( = ?auto_61563 ?auto_61573 ) ) ( not ( = ?auto_61560 ?auto_61565 ) ) ( not ( = ?auto_61560 ?auto_61567 ) ) ( not ( = ?auto_61560 ?auto_61571 ) ) ( not ( = ?auto_61564 ?auto_61566 ) ) ( not ( = ?auto_61565 ?auto_61567 ) ) ( not ( = ?auto_61566 ?auto_61569 ) ) ( not ( = ?auto_61566 ?auto_61570 ) ) ( not ( = ?auto_61566 ?auto_61573 ) ) ( not ( = ?auto_61567 ?auto_61571 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61570 ?auto_61571 ?auto_61564 ?auto_61565 )
      ( GET-4IMAGE-VERIFY ?auto_61561 ?auto_61562 ?auto_61563 ?auto_61560 ?auto_61564 ?auto_61565 ?auto_61566 ?auto_61567 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61575 - DIRECTION
      ?auto_61576 - MODE
      ?auto_61577 - DIRECTION
      ?auto_61574 - MODE
      ?auto_61578 - DIRECTION
      ?auto_61579 - MODE
      ?auto_61580 - DIRECTION
      ?auto_61581 - MODE
    )
    :vars
    (
      ?auto_61586 - INSTRUMENT
      ?auto_61582 - SATELLITE
      ?auto_61583 - DIRECTION
      ?auto_61584 - DIRECTION
      ?auto_61585 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_61586 ?auto_61582 ) ( SUPPORTS ?auto_61586 ?auto_61579 ) ( not ( = ?auto_61578 ?auto_61583 ) ) ( HAVE_IMAGE ?auto_61584 ?auto_61585 ) ( not ( = ?auto_61584 ?auto_61578 ) ) ( not ( = ?auto_61584 ?auto_61583 ) ) ( not ( = ?auto_61585 ?auto_61579 ) ) ( CALIBRATION_TARGET ?auto_61586 ?auto_61583 ) ( POWER_AVAIL ?auto_61582 ) ( POINTING ?auto_61582 ?auto_61580 ) ( not ( = ?auto_61583 ?auto_61580 ) ) ( not ( = ?auto_61578 ?auto_61580 ) ) ( not ( = ?auto_61584 ?auto_61580 ) ) ( HAVE_IMAGE ?auto_61575 ?auto_61576 ) ( HAVE_IMAGE ?auto_61577 ?auto_61574 ) ( HAVE_IMAGE ?auto_61580 ?auto_61581 ) ( not ( = ?auto_61575 ?auto_61577 ) ) ( not ( = ?auto_61575 ?auto_61578 ) ) ( not ( = ?auto_61575 ?auto_61580 ) ) ( not ( = ?auto_61575 ?auto_61583 ) ) ( not ( = ?auto_61575 ?auto_61584 ) ) ( not ( = ?auto_61576 ?auto_61574 ) ) ( not ( = ?auto_61576 ?auto_61579 ) ) ( not ( = ?auto_61576 ?auto_61581 ) ) ( not ( = ?auto_61576 ?auto_61585 ) ) ( not ( = ?auto_61577 ?auto_61578 ) ) ( not ( = ?auto_61577 ?auto_61580 ) ) ( not ( = ?auto_61577 ?auto_61583 ) ) ( not ( = ?auto_61577 ?auto_61584 ) ) ( not ( = ?auto_61574 ?auto_61579 ) ) ( not ( = ?auto_61574 ?auto_61581 ) ) ( not ( = ?auto_61574 ?auto_61585 ) ) ( not ( = ?auto_61579 ?auto_61581 ) ) ( not ( = ?auto_61581 ?auto_61585 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61584 ?auto_61585 ?auto_61578 ?auto_61579 )
      ( GET-4IMAGE-VERIFY ?auto_61575 ?auto_61576 ?auto_61577 ?auto_61574 ?auto_61578 ?auto_61579 ?auto_61580 ?auto_61581 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61610 - DIRECTION
      ?auto_61611 - MODE
      ?auto_61612 - DIRECTION
      ?auto_61609 - MODE
      ?auto_61613 - DIRECTION
      ?auto_61614 - MODE
      ?auto_61615 - DIRECTION
      ?auto_61616 - MODE
    )
    :vars
    (
      ?auto_61621 - INSTRUMENT
      ?auto_61617 - SATELLITE
      ?auto_61618 - DIRECTION
      ?auto_61619 - DIRECTION
      ?auto_61620 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_61621 ?auto_61617 ) ( SUPPORTS ?auto_61621 ?auto_61616 ) ( not ( = ?auto_61615 ?auto_61618 ) ) ( HAVE_IMAGE ?auto_61619 ?auto_61620 ) ( not ( = ?auto_61619 ?auto_61615 ) ) ( not ( = ?auto_61619 ?auto_61618 ) ) ( not ( = ?auto_61620 ?auto_61616 ) ) ( CALIBRATION_TARGET ?auto_61621 ?auto_61618 ) ( POWER_AVAIL ?auto_61617 ) ( POINTING ?auto_61617 ?auto_61612 ) ( not ( = ?auto_61618 ?auto_61612 ) ) ( not ( = ?auto_61615 ?auto_61612 ) ) ( not ( = ?auto_61619 ?auto_61612 ) ) ( HAVE_IMAGE ?auto_61610 ?auto_61611 ) ( HAVE_IMAGE ?auto_61612 ?auto_61609 ) ( HAVE_IMAGE ?auto_61613 ?auto_61614 ) ( not ( = ?auto_61610 ?auto_61612 ) ) ( not ( = ?auto_61610 ?auto_61613 ) ) ( not ( = ?auto_61610 ?auto_61615 ) ) ( not ( = ?auto_61610 ?auto_61618 ) ) ( not ( = ?auto_61610 ?auto_61619 ) ) ( not ( = ?auto_61611 ?auto_61609 ) ) ( not ( = ?auto_61611 ?auto_61614 ) ) ( not ( = ?auto_61611 ?auto_61616 ) ) ( not ( = ?auto_61611 ?auto_61620 ) ) ( not ( = ?auto_61612 ?auto_61613 ) ) ( not ( = ?auto_61609 ?auto_61614 ) ) ( not ( = ?auto_61609 ?auto_61616 ) ) ( not ( = ?auto_61609 ?auto_61620 ) ) ( not ( = ?auto_61613 ?auto_61615 ) ) ( not ( = ?auto_61613 ?auto_61618 ) ) ( not ( = ?auto_61613 ?auto_61619 ) ) ( not ( = ?auto_61614 ?auto_61616 ) ) ( not ( = ?auto_61614 ?auto_61620 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61619 ?auto_61620 ?auto_61615 ?auto_61616 )
      ( GET-4IMAGE-VERIFY ?auto_61610 ?auto_61611 ?auto_61612 ?auto_61609 ?auto_61613 ?auto_61614 ?auto_61615 ?auto_61616 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61695 - DIRECTION
      ?auto_61696 - MODE
      ?auto_61697 - DIRECTION
      ?auto_61694 - MODE
      ?auto_61698 - DIRECTION
      ?auto_61699 - MODE
      ?auto_61700 - DIRECTION
      ?auto_61701 - MODE
    )
    :vars
    (
      ?auto_61704 - INSTRUMENT
      ?auto_61702 - SATELLITE
      ?auto_61703 - DIRECTION
      ?auto_61705 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_61704 ?auto_61702 ) ( SUPPORTS ?auto_61704 ?auto_61694 ) ( not ( = ?auto_61697 ?auto_61703 ) ) ( HAVE_IMAGE ?auto_61698 ?auto_61699 ) ( not ( = ?auto_61698 ?auto_61697 ) ) ( not ( = ?auto_61698 ?auto_61703 ) ) ( not ( = ?auto_61699 ?auto_61694 ) ) ( CALIBRATION_TARGET ?auto_61704 ?auto_61703 ) ( POWER_AVAIL ?auto_61702 ) ( POINTING ?auto_61702 ?auto_61705 ) ( not ( = ?auto_61703 ?auto_61705 ) ) ( not ( = ?auto_61697 ?auto_61705 ) ) ( not ( = ?auto_61698 ?auto_61705 ) ) ( HAVE_IMAGE ?auto_61695 ?auto_61696 ) ( HAVE_IMAGE ?auto_61700 ?auto_61701 ) ( not ( = ?auto_61695 ?auto_61697 ) ) ( not ( = ?auto_61695 ?auto_61698 ) ) ( not ( = ?auto_61695 ?auto_61700 ) ) ( not ( = ?auto_61695 ?auto_61703 ) ) ( not ( = ?auto_61695 ?auto_61705 ) ) ( not ( = ?auto_61696 ?auto_61694 ) ) ( not ( = ?auto_61696 ?auto_61699 ) ) ( not ( = ?auto_61696 ?auto_61701 ) ) ( not ( = ?auto_61697 ?auto_61700 ) ) ( not ( = ?auto_61694 ?auto_61701 ) ) ( not ( = ?auto_61698 ?auto_61700 ) ) ( not ( = ?auto_61699 ?auto_61701 ) ) ( not ( = ?auto_61700 ?auto_61703 ) ) ( not ( = ?auto_61700 ?auto_61705 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61698 ?auto_61699 ?auto_61697 ?auto_61694 )
      ( GET-4IMAGE-VERIFY ?auto_61695 ?auto_61696 ?auto_61697 ?auto_61694 ?auto_61698 ?auto_61699 ?auto_61700 ?auto_61701 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61739 - DIRECTION
      ?auto_61740 - MODE
      ?auto_61741 - DIRECTION
      ?auto_61738 - MODE
      ?auto_61742 - DIRECTION
      ?auto_61743 - MODE
      ?auto_61744 - DIRECTION
      ?auto_61745 - MODE
    )
    :vars
    (
      ?auto_61750 - INSTRUMENT
      ?auto_61746 - SATELLITE
      ?auto_61747 - DIRECTION
      ?auto_61748 - DIRECTION
      ?auto_61749 - MODE
      ?auto_61751 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_61750 ?auto_61746 ) ( SUPPORTS ?auto_61750 ?auto_61738 ) ( not ( = ?auto_61741 ?auto_61747 ) ) ( HAVE_IMAGE ?auto_61748 ?auto_61749 ) ( not ( = ?auto_61748 ?auto_61741 ) ) ( not ( = ?auto_61748 ?auto_61747 ) ) ( not ( = ?auto_61749 ?auto_61738 ) ) ( CALIBRATION_TARGET ?auto_61750 ?auto_61747 ) ( POWER_AVAIL ?auto_61746 ) ( POINTING ?auto_61746 ?auto_61751 ) ( not ( = ?auto_61747 ?auto_61751 ) ) ( not ( = ?auto_61741 ?auto_61751 ) ) ( not ( = ?auto_61748 ?auto_61751 ) ) ( HAVE_IMAGE ?auto_61739 ?auto_61740 ) ( HAVE_IMAGE ?auto_61742 ?auto_61743 ) ( HAVE_IMAGE ?auto_61744 ?auto_61745 ) ( not ( = ?auto_61739 ?auto_61741 ) ) ( not ( = ?auto_61739 ?auto_61742 ) ) ( not ( = ?auto_61739 ?auto_61744 ) ) ( not ( = ?auto_61739 ?auto_61747 ) ) ( not ( = ?auto_61739 ?auto_61748 ) ) ( not ( = ?auto_61739 ?auto_61751 ) ) ( not ( = ?auto_61740 ?auto_61738 ) ) ( not ( = ?auto_61740 ?auto_61743 ) ) ( not ( = ?auto_61740 ?auto_61745 ) ) ( not ( = ?auto_61740 ?auto_61749 ) ) ( not ( = ?auto_61741 ?auto_61742 ) ) ( not ( = ?auto_61741 ?auto_61744 ) ) ( not ( = ?auto_61738 ?auto_61743 ) ) ( not ( = ?auto_61738 ?auto_61745 ) ) ( not ( = ?auto_61742 ?auto_61744 ) ) ( not ( = ?auto_61742 ?auto_61747 ) ) ( not ( = ?auto_61742 ?auto_61748 ) ) ( not ( = ?auto_61742 ?auto_61751 ) ) ( not ( = ?auto_61743 ?auto_61745 ) ) ( not ( = ?auto_61743 ?auto_61749 ) ) ( not ( = ?auto_61744 ?auto_61747 ) ) ( not ( = ?auto_61744 ?auto_61748 ) ) ( not ( = ?auto_61744 ?auto_61751 ) ) ( not ( = ?auto_61745 ?auto_61749 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61748 ?auto_61749 ?auto_61741 ?auto_61738 )
      ( GET-4IMAGE-VERIFY ?auto_61739 ?auto_61740 ?auto_61741 ?auto_61738 ?auto_61742 ?auto_61743 ?auto_61744 ?auto_61745 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61753 - DIRECTION
      ?auto_61754 - MODE
      ?auto_61755 - DIRECTION
      ?auto_61752 - MODE
      ?auto_61756 - DIRECTION
      ?auto_61757 - MODE
      ?auto_61758 - DIRECTION
      ?auto_61759 - MODE
    )
    :vars
    (
      ?auto_61764 - INSTRUMENT
      ?auto_61760 - SATELLITE
      ?auto_61761 - DIRECTION
      ?auto_61762 - DIRECTION
      ?auto_61763 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_61764 ?auto_61760 ) ( SUPPORTS ?auto_61764 ?auto_61752 ) ( not ( = ?auto_61755 ?auto_61761 ) ) ( HAVE_IMAGE ?auto_61762 ?auto_61763 ) ( not ( = ?auto_61762 ?auto_61755 ) ) ( not ( = ?auto_61762 ?auto_61761 ) ) ( not ( = ?auto_61763 ?auto_61752 ) ) ( CALIBRATION_TARGET ?auto_61764 ?auto_61761 ) ( POWER_AVAIL ?auto_61760 ) ( POINTING ?auto_61760 ?auto_61758 ) ( not ( = ?auto_61761 ?auto_61758 ) ) ( not ( = ?auto_61755 ?auto_61758 ) ) ( not ( = ?auto_61762 ?auto_61758 ) ) ( HAVE_IMAGE ?auto_61753 ?auto_61754 ) ( HAVE_IMAGE ?auto_61756 ?auto_61757 ) ( HAVE_IMAGE ?auto_61758 ?auto_61759 ) ( not ( = ?auto_61753 ?auto_61755 ) ) ( not ( = ?auto_61753 ?auto_61756 ) ) ( not ( = ?auto_61753 ?auto_61758 ) ) ( not ( = ?auto_61753 ?auto_61761 ) ) ( not ( = ?auto_61753 ?auto_61762 ) ) ( not ( = ?auto_61754 ?auto_61752 ) ) ( not ( = ?auto_61754 ?auto_61757 ) ) ( not ( = ?auto_61754 ?auto_61759 ) ) ( not ( = ?auto_61754 ?auto_61763 ) ) ( not ( = ?auto_61755 ?auto_61756 ) ) ( not ( = ?auto_61752 ?auto_61757 ) ) ( not ( = ?auto_61752 ?auto_61759 ) ) ( not ( = ?auto_61756 ?auto_61758 ) ) ( not ( = ?auto_61756 ?auto_61761 ) ) ( not ( = ?auto_61756 ?auto_61762 ) ) ( not ( = ?auto_61757 ?auto_61759 ) ) ( not ( = ?auto_61757 ?auto_61763 ) ) ( not ( = ?auto_61759 ?auto_61763 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61762 ?auto_61763 ?auto_61755 ?auto_61752 )
      ( GET-4IMAGE-VERIFY ?auto_61753 ?auto_61754 ?auto_61755 ?auto_61752 ?auto_61756 ?auto_61757 ?auto_61758 ?auto_61759 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61899 - DIRECTION
      ?auto_61900 - MODE
      ?auto_61901 - DIRECTION
      ?auto_61898 - MODE
      ?auto_61902 - DIRECTION
      ?auto_61903 - MODE
      ?auto_61904 - DIRECTION
      ?auto_61905 - MODE
    )
    :vars
    (
      ?auto_61908 - INSTRUMENT
      ?auto_61906 - SATELLITE
      ?auto_61907 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_61908 ?auto_61906 ) ( SUPPORTS ?auto_61908 ?auto_61905 ) ( not ( = ?auto_61904 ?auto_61907 ) ) ( HAVE_IMAGE ?auto_61901 ?auto_61898 ) ( not ( = ?auto_61901 ?auto_61904 ) ) ( not ( = ?auto_61901 ?auto_61907 ) ) ( not ( = ?auto_61898 ?auto_61905 ) ) ( CALIBRATION_TARGET ?auto_61908 ?auto_61907 ) ( POWER_AVAIL ?auto_61906 ) ( POINTING ?auto_61906 ?auto_61899 ) ( not ( = ?auto_61907 ?auto_61899 ) ) ( not ( = ?auto_61904 ?auto_61899 ) ) ( not ( = ?auto_61901 ?auto_61899 ) ) ( HAVE_IMAGE ?auto_61899 ?auto_61900 ) ( HAVE_IMAGE ?auto_61902 ?auto_61903 ) ( not ( = ?auto_61899 ?auto_61902 ) ) ( not ( = ?auto_61900 ?auto_61898 ) ) ( not ( = ?auto_61900 ?auto_61903 ) ) ( not ( = ?auto_61900 ?auto_61905 ) ) ( not ( = ?auto_61901 ?auto_61902 ) ) ( not ( = ?auto_61898 ?auto_61903 ) ) ( not ( = ?auto_61902 ?auto_61904 ) ) ( not ( = ?auto_61902 ?auto_61907 ) ) ( not ( = ?auto_61903 ?auto_61905 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61901 ?auto_61898 ?auto_61904 ?auto_61905 )
      ( GET-4IMAGE-VERIFY ?auto_61899 ?auto_61900 ?auto_61901 ?auto_61898 ?auto_61902 ?auto_61903 ?auto_61904 ?auto_61905 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61962 - DIRECTION
      ?auto_61963 - MODE
      ?auto_61964 - DIRECTION
      ?auto_61961 - MODE
      ?auto_61965 - DIRECTION
      ?auto_61966 - MODE
      ?auto_61967 - DIRECTION
      ?auto_61968 - MODE
    )
    :vars
    (
      ?auto_61973 - INSTRUMENT
      ?auto_61969 - SATELLITE
      ?auto_61970 - DIRECTION
      ?auto_61971 - DIRECTION
      ?auto_61972 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_61973 ?auto_61969 ) ( SUPPORTS ?auto_61973 ?auto_61968 ) ( not ( = ?auto_61967 ?auto_61970 ) ) ( HAVE_IMAGE ?auto_61971 ?auto_61972 ) ( not ( = ?auto_61971 ?auto_61967 ) ) ( not ( = ?auto_61971 ?auto_61970 ) ) ( not ( = ?auto_61972 ?auto_61968 ) ) ( CALIBRATION_TARGET ?auto_61973 ?auto_61970 ) ( POWER_AVAIL ?auto_61969 ) ( POINTING ?auto_61969 ?auto_61962 ) ( not ( = ?auto_61970 ?auto_61962 ) ) ( not ( = ?auto_61967 ?auto_61962 ) ) ( not ( = ?auto_61971 ?auto_61962 ) ) ( HAVE_IMAGE ?auto_61962 ?auto_61963 ) ( HAVE_IMAGE ?auto_61964 ?auto_61961 ) ( HAVE_IMAGE ?auto_61965 ?auto_61966 ) ( not ( = ?auto_61962 ?auto_61964 ) ) ( not ( = ?auto_61962 ?auto_61965 ) ) ( not ( = ?auto_61963 ?auto_61961 ) ) ( not ( = ?auto_61963 ?auto_61966 ) ) ( not ( = ?auto_61963 ?auto_61968 ) ) ( not ( = ?auto_61963 ?auto_61972 ) ) ( not ( = ?auto_61964 ?auto_61965 ) ) ( not ( = ?auto_61964 ?auto_61967 ) ) ( not ( = ?auto_61964 ?auto_61970 ) ) ( not ( = ?auto_61964 ?auto_61971 ) ) ( not ( = ?auto_61961 ?auto_61966 ) ) ( not ( = ?auto_61961 ?auto_61968 ) ) ( not ( = ?auto_61961 ?auto_61972 ) ) ( not ( = ?auto_61965 ?auto_61967 ) ) ( not ( = ?auto_61965 ?auto_61970 ) ) ( not ( = ?auto_61965 ?auto_61971 ) ) ( not ( = ?auto_61966 ?auto_61968 ) ) ( not ( = ?auto_61966 ?auto_61972 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61971 ?auto_61972 ?auto_61967 ?auto_61968 )
      ( GET-4IMAGE-VERIFY ?auto_61962 ?auto_61963 ?auto_61964 ?auto_61961 ?auto_61965 ?auto_61966 ?auto_61967 ?auto_61968 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61996 - DIRECTION
      ?auto_61997 - MODE
      ?auto_61998 - DIRECTION
      ?auto_61995 - MODE
      ?auto_61999 - DIRECTION
      ?auto_62000 - MODE
      ?auto_62001 - DIRECTION
      ?auto_62002 - MODE
    )
    :vars
    (
      ?auto_62007 - INSTRUMENT
      ?auto_62003 - SATELLITE
      ?auto_62004 - DIRECTION
      ?auto_62005 - DIRECTION
      ?auto_62006 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_62007 ?auto_62003 ) ( SUPPORTS ?auto_62007 ?auto_62000 ) ( not ( = ?auto_61999 ?auto_62004 ) ) ( HAVE_IMAGE ?auto_62005 ?auto_62006 ) ( not ( = ?auto_62005 ?auto_61999 ) ) ( not ( = ?auto_62005 ?auto_62004 ) ) ( not ( = ?auto_62006 ?auto_62000 ) ) ( CALIBRATION_TARGET ?auto_62007 ?auto_62004 ) ( POWER_AVAIL ?auto_62003 ) ( POINTING ?auto_62003 ?auto_61996 ) ( not ( = ?auto_62004 ?auto_61996 ) ) ( not ( = ?auto_61999 ?auto_61996 ) ) ( not ( = ?auto_62005 ?auto_61996 ) ) ( HAVE_IMAGE ?auto_61996 ?auto_61997 ) ( HAVE_IMAGE ?auto_61998 ?auto_61995 ) ( HAVE_IMAGE ?auto_62001 ?auto_62002 ) ( not ( = ?auto_61996 ?auto_61998 ) ) ( not ( = ?auto_61996 ?auto_62001 ) ) ( not ( = ?auto_61997 ?auto_61995 ) ) ( not ( = ?auto_61997 ?auto_62000 ) ) ( not ( = ?auto_61997 ?auto_62002 ) ) ( not ( = ?auto_61997 ?auto_62006 ) ) ( not ( = ?auto_61998 ?auto_61999 ) ) ( not ( = ?auto_61998 ?auto_62001 ) ) ( not ( = ?auto_61998 ?auto_62004 ) ) ( not ( = ?auto_61998 ?auto_62005 ) ) ( not ( = ?auto_61995 ?auto_62000 ) ) ( not ( = ?auto_61995 ?auto_62002 ) ) ( not ( = ?auto_61995 ?auto_62006 ) ) ( not ( = ?auto_61999 ?auto_62001 ) ) ( not ( = ?auto_62000 ?auto_62002 ) ) ( not ( = ?auto_62001 ?auto_62004 ) ) ( not ( = ?auto_62001 ?auto_62005 ) ) ( not ( = ?auto_62002 ?auto_62006 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62005 ?auto_62006 ?auto_61999 ?auto_62000 )
      ( GET-4IMAGE-VERIFY ?auto_61996 ?auto_61997 ?auto_61998 ?auto_61995 ?auto_61999 ?auto_62000 ?auto_62001 ?auto_62002 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62171 - DIRECTION
      ?auto_62172 - MODE
      ?auto_62173 - DIRECTION
      ?auto_62170 - MODE
      ?auto_62174 - DIRECTION
      ?auto_62175 - MODE
      ?auto_62176 - DIRECTION
      ?auto_62177 - MODE
    )
    :vars
    (
      ?auto_62182 - INSTRUMENT
      ?auto_62178 - SATELLITE
      ?auto_62179 - DIRECTION
      ?auto_62180 - DIRECTION
      ?auto_62181 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_62182 ?auto_62178 ) ( SUPPORTS ?auto_62182 ?auto_62170 ) ( not ( = ?auto_62173 ?auto_62179 ) ) ( HAVE_IMAGE ?auto_62180 ?auto_62181 ) ( not ( = ?auto_62180 ?auto_62173 ) ) ( not ( = ?auto_62180 ?auto_62179 ) ) ( not ( = ?auto_62181 ?auto_62170 ) ) ( CALIBRATION_TARGET ?auto_62182 ?auto_62179 ) ( POWER_AVAIL ?auto_62178 ) ( POINTING ?auto_62178 ?auto_62171 ) ( not ( = ?auto_62179 ?auto_62171 ) ) ( not ( = ?auto_62173 ?auto_62171 ) ) ( not ( = ?auto_62180 ?auto_62171 ) ) ( HAVE_IMAGE ?auto_62171 ?auto_62172 ) ( HAVE_IMAGE ?auto_62174 ?auto_62175 ) ( HAVE_IMAGE ?auto_62176 ?auto_62177 ) ( not ( = ?auto_62171 ?auto_62174 ) ) ( not ( = ?auto_62171 ?auto_62176 ) ) ( not ( = ?auto_62172 ?auto_62170 ) ) ( not ( = ?auto_62172 ?auto_62175 ) ) ( not ( = ?auto_62172 ?auto_62177 ) ) ( not ( = ?auto_62172 ?auto_62181 ) ) ( not ( = ?auto_62173 ?auto_62174 ) ) ( not ( = ?auto_62173 ?auto_62176 ) ) ( not ( = ?auto_62170 ?auto_62175 ) ) ( not ( = ?auto_62170 ?auto_62177 ) ) ( not ( = ?auto_62174 ?auto_62176 ) ) ( not ( = ?auto_62174 ?auto_62179 ) ) ( not ( = ?auto_62174 ?auto_62180 ) ) ( not ( = ?auto_62175 ?auto_62177 ) ) ( not ( = ?auto_62175 ?auto_62181 ) ) ( not ( = ?auto_62176 ?auto_62179 ) ) ( not ( = ?auto_62176 ?auto_62180 ) ) ( not ( = ?auto_62177 ?auto_62181 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62180 ?auto_62181 ?auto_62173 ?auto_62170 )
      ( GET-4IMAGE-VERIFY ?auto_62171 ?auto_62172 ?auto_62173 ?auto_62170 ?auto_62174 ?auto_62175 ?auto_62176 ?auto_62177 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62310 - DIRECTION
      ?auto_62311 - MODE
      ?auto_62312 - DIRECTION
      ?auto_62309 - MODE
      ?auto_62313 - DIRECTION
      ?auto_62314 - MODE
      ?auto_62315 - DIRECTION
      ?auto_62316 - MODE
    )
    :vars
    (
      ?auto_62319 - INSTRUMENT
      ?auto_62317 - SATELLITE
      ?auto_62318 - DIRECTION
      ?auto_62320 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_62319 ?auto_62317 ) ( SUPPORTS ?auto_62319 ?auto_62311 ) ( not ( = ?auto_62310 ?auto_62318 ) ) ( HAVE_IMAGE ?auto_62313 ?auto_62309 ) ( not ( = ?auto_62313 ?auto_62310 ) ) ( not ( = ?auto_62313 ?auto_62318 ) ) ( not ( = ?auto_62309 ?auto_62311 ) ) ( CALIBRATION_TARGET ?auto_62319 ?auto_62318 ) ( POWER_AVAIL ?auto_62317 ) ( POINTING ?auto_62317 ?auto_62320 ) ( not ( = ?auto_62318 ?auto_62320 ) ) ( not ( = ?auto_62310 ?auto_62320 ) ) ( not ( = ?auto_62313 ?auto_62320 ) ) ( HAVE_IMAGE ?auto_62312 ?auto_62309 ) ( HAVE_IMAGE ?auto_62313 ?auto_62314 ) ( HAVE_IMAGE ?auto_62315 ?auto_62316 ) ( not ( = ?auto_62310 ?auto_62312 ) ) ( not ( = ?auto_62310 ?auto_62315 ) ) ( not ( = ?auto_62311 ?auto_62314 ) ) ( not ( = ?auto_62311 ?auto_62316 ) ) ( not ( = ?auto_62312 ?auto_62313 ) ) ( not ( = ?auto_62312 ?auto_62315 ) ) ( not ( = ?auto_62312 ?auto_62318 ) ) ( not ( = ?auto_62312 ?auto_62320 ) ) ( not ( = ?auto_62309 ?auto_62314 ) ) ( not ( = ?auto_62309 ?auto_62316 ) ) ( not ( = ?auto_62313 ?auto_62315 ) ) ( not ( = ?auto_62314 ?auto_62316 ) ) ( not ( = ?auto_62315 ?auto_62318 ) ) ( not ( = ?auto_62315 ?auto_62320 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62313 ?auto_62309 ?auto_62310 ?auto_62311 )
      ( GET-4IMAGE-VERIFY ?auto_62310 ?auto_62311 ?auto_62312 ?auto_62309 ?auto_62313 ?auto_62314 ?auto_62315 ?auto_62316 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62334 - DIRECTION
      ?auto_62335 - MODE
      ?auto_62336 - DIRECTION
      ?auto_62333 - MODE
      ?auto_62337 - DIRECTION
      ?auto_62338 - MODE
      ?auto_62339 - DIRECTION
      ?auto_62340 - MODE
    )
    :vars
    (
      ?auto_62343 - INSTRUMENT
      ?auto_62341 - SATELLITE
      ?auto_62342 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_62343 ?auto_62341 ) ( SUPPORTS ?auto_62343 ?auto_62335 ) ( not ( = ?auto_62334 ?auto_62342 ) ) ( HAVE_IMAGE ?auto_62336 ?auto_62333 ) ( not ( = ?auto_62336 ?auto_62334 ) ) ( not ( = ?auto_62336 ?auto_62342 ) ) ( not ( = ?auto_62333 ?auto_62335 ) ) ( CALIBRATION_TARGET ?auto_62343 ?auto_62342 ) ( POWER_AVAIL ?auto_62341 ) ( POINTING ?auto_62341 ?auto_62339 ) ( not ( = ?auto_62342 ?auto_62339 ) ) ( not ( = ?auto_62334 ?auto_62339 ) ) ( not ( = ?auto_62336 ?auto_62339 ) ) ( HAVE_IMAGE ?auto_62337 ?auto_62338 ) ( HAVE_IMAGE ?auto_62339 ?auto_62340 ) ( not ( = ?auto_62334 ?auto_62337 ) ) ( not ( = ?auto_62335 ?auto_62338 ) ) ( not ( = ?auto_62335 ?auto_62340 ) ) ( not ( = ?auto_62336 ?auto_62337 ) ) ( not ( = ?auto_62333 ?auto_62338 ) ) ( not ( = ?auto_62333 ?auto_62340 ) ) ( not ( = ?auto_62337 ?auto_62339 ) ) ( not ( = ?auto_62337 ?auto_62342 ) ) ( not ( = ?auto_62338 ?auto_62340 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62336 ?auto_62333 ?auto_62334 ?auto_62335 )
      ( GET-4IMAGE-VERIFY ?auto_62334 ?auto_62335 ?auto_62336 ?auto_62333 ?auto_62337 ?auto_62338 ?auto_62339 ?auto_62340 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62357 - DIRECTION
      ?auto_62358 - MODE
      ?auto_62359 - DIRECTION
      ?auto_62356 - MODE
      ?auto_62360 - DIRECTION
      ?auto_62361 - MODE
      ?auto_62362 - DIRECTION
      ?auto_62363 - MODE
    )
    :vars
    (
      ?auto_62366 - INSTRUMENT
      ?auto_62364 - SATELLITE
      ?auto_62365 - DIRECTION
      ?auto_62367 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_62366 ?auto_62364 ) ( SUPPORTS ?auto_62366 ?auto_62358 ) ( not ( = ?auto_62357 ?auto_62365 ) ) ( HAVE_IMAGE ?auto_62362 ?auto_62363 ) ( not ( = ?auto_62362 ?auto_62357 ) ) ( not ( = ?auto_62362 ?auto_62365 ) ) ( not ( = ?auto_62363 ?auto_62358 ) ) ( CALIBRATION_TARGET ?auto_62366 ?auto_62365 ) ( POWER_AVAIL ?auto_62364 ) ( POINTING ?auto_62364 ?auto_62367 ) ( not ( = ?auto_62365 ?auto_62367 ) ) ( not ( = ?auto_62357 ?auto_62367 ) ) ( not ( = ?auto_62362 ?auto_62367 ) ) ( HAVE_IMAGE ?auto_62359 ?auto_62356 ) ( HAVE_IMAGE ?auto_62360 ?auto_62361 ) ( not ( = ?auto_62357 ?auto_62359 ) ) ( not ( = ?auto_62357 ?auto_62360 ) ) ( not ( = ?auto_62358 ?auto_62356 ) ) ( not ( = ?auto_62358 ?auto_62361 ) ) ( not ( = ?auto_62359 ?auto_62360 ) ) ( not ( = ?auto_62359 ?auto_62362 ) ) ( not ( = ?auto_62359 ?auto_62365 ) ) ( not ( = ?auto_62359 ?auto_62367 ) ) ( not ( = ?auto_62356 ?auto_62361 ) ) ( not ( = ?auto_62356 ?auto_62363 ) ) ( not ( = ?auto_62360 ?auto_62362 ) ) ( not ( = ?auto_62360 ?auto_62365 ) ) ( not ( = ?auto_62360 ?auto_62367 ) ) ( not ( = ?auto_62361 ?auto_62363 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62362 ?auto_62363 ?auto_62357 ?auto_62358 )
      ( GET-4IMAGE-VERIFY ?auto_62357 ?auto_62358 ?auto_62359 ?auto_62356 ?auto_62360 ?auto_62361 ?auto_62362 ?auto_62363 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62369 - DIRECTION
      ?auto_62370 - MODE
      ?auto_62371 - DIRECTION
      ?auto_62368 - MODE
      ?auto_62372 - DIRECTION
      ?auto_62373 - MODE
      ?auto_62374 - DIRECTION
      ?auto_62375 - MODE
    )
    :vars
    (
      ?auto_62378 - INSTRUMENT
      ?auto_62376 - SATELLITE
      ?auto_62377 - DIRECTION
      ?auto_62379 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_62378 ?auto_62376 ) ( SUPPORTS ?auto_62378 ?auto_62370 ) ( not ( = ?auto_62369 ?auto_62377 ) ) ( HAVE_IMAGE ?auto_62371 ?auto_62368 ) ( not ( = ?auto_62371 ?auto_62369 ) ) ( not ( = ?auto_62371 ?auto_62377 ) ) ( not ( = ?auto_62368 ?auto_62370 ) ) ( CALIBRATION_TARGET ?auto_62378 ?auto_62377 ) ( POWER_AVAIL ?auto_62376 ) ( POINTING ?auto_62376 ?auto_62379 ) ( not ( = ?auto_62377 ?auto_62379 ) ) ( not ( = ?auto_62369 ?auto_62379 ) ) ( not ( = ?auto_62371 ?auto_62379 ) ) ( HAVE_IMAGE ?auto_62372 ?auto_62373 ) ( HAVE_IMAGE ?auto_62374 ?auto_62375 ) ( not ( = ?auto_62369 ?auto_62372 ) ) ( not ( = ?auto_62369 ?auto_62374 ) ) ( not ( = ?auto_62370 ?auto_62373 ) ) ( not ( = ?auto_62370 ?auto_62375 ) ) ( not ( = ?auto_62371 ?auto_62372 ) ) ( not ( = ?auto_62371 ?auto_62374 ) ) ( not ( = ?auto_62368 ?auto_62373 ) ) ( not ( = ?auto_62368 ?auto_62375 ) ) ( not ( = ?auto_62372 ?auto_62374 ) ) ( not ( = ?auto_62372 ?auto_62377 ) ) ( not ( = ?auto_62372 ?auto_62379 ) ) ( not ( = ?auto_62373 ?auto_62375 ) ) ( not ( = ?auto_62374 ?auto_62377 ) ) ( not ( = ?auto_62374 ?auto_62379 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62371 ?auto_62368 ?auto_62369 ?auto_62370 )
      ( GET-4IMAGE-VERIFY ?auto_62369 ?auto_62370 ?auto_62371 ?auto_62368 ?auto_62372 ?auto_62373 ?auto_62374 ?auto_62375 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62489 - DIRECTION
      ?auto_62490 - MODE
      ?auto_62491 - DIRECTION
      ?auto_62488 - MODE
      ?auto_62492 - DIRECTION
      ?auto_62493 - MODE
      ?auto_62494 - DIRECTION
      ?auto_62495 - MODE
    )
    :vars
    (
      ?auto_62498 - INSTRUMENT
      ?auto_62496 - SATELLITE
      ?auto_62497 - DIRECTION
      ?auto_62499 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_62498 ?auto_62496 ) ( SUPPORTS ?auto_62498 ?auto_62490 ) ( not ( = ?auto_62489 ?auto_62497 ) ) ( HAVE_IMAGE ?auto_62492 ?auto_62495 ) ( not ( = ?auto_62492 ?auto_62489 ) ) ( not ( = ?auto_62492 ?auto_62497 ) ) ( not ( = ?auto_62495 ?auto_62490 ) ) ( CALIBRATION_TARGET ?auto_62498 ?auto_62497 ) ( POWER_AVAIL ?auto_62496 ) ( POINTING ?auto_62496 ?auto_62499 ) ( not ( = ?auto_62497 ?auto_62499 ) ) ( not ( = ?auto_62489 ?auto_62499 ) ) ( not ( = ?auto_62492 ?auto_62499 ) ) ( HAVE_IMAGE ?auto_62491 ?auto_62488 ) ( HAVE_IMAGE ?auto_62492 ?auto_62493 ) ( HAVE_IMAGE ?auto_62494 ?auto_62495 ) ( not ( = ?auto_62489 ?auto_62491 ) ) ( not ( = ?auto_62489 ?auto_62494 ) ) ( not ( = ?auto_62490 ?auto_62488 ) ) ( not ( = ?auto_62490 ?auto_62493 ) ) ( not ( = ?auto_62491 ?auto_62492 ) ) ( not ( = ?auto_62491 ?auto_62494 ) ) ( not ( = ?auto_62491 ?auto_62497 ) ) ( not ( = ?auto_62491 ?auto_62499 ) ) ( not ( = ?auto_62488 ?auto_62493 ) ) ( not ( = ?auto_62488 ?auto_62495 ) ) ( not ( = ?auto_62492 ?auto_62494 ) ) ( not ( = ?auto_62493 ?auto_62495 ) ) ( not ( = ?auto_62494 ?auto_62497 ) ) ( not ( = ?auto_62494 ?auto_62499 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62492 ?auto_62495 ?auto_62489 ?auto_62490 )
      ( GET-4IMAGE-VERIFY ?auto_62489 ?auto_62490 ?auto_62491 ?auto_62488 ?auto_62492 ?auto_62493 ?auto_62494 ?auto_62495 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62501 - DIRECTION
      ?auto_62502 - MODE
      ?auto_62503 - DIRECTION
      ?auto_62500 - MODE
      ?auto_62504 - DIRECTION
      ?auto_62505 - MODE
      ?auto_62506 - DIRECTION
      ?auto_62507 - MODE
    )
    :vars
    (
      ?auto_62510 - INSTRUMENT
      ?auto_62508 - SATELLITE
      ?auto_62509 - DIRECTION
      ?auto_62511 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_62510 ?auto_62508 ) ( SUPPORTS ?auto_62510 ?auto_62502 ) ( not ( = ?auto_62501 ?auto_62509 ) ) ( HAVE_IMAGE ?auto_62504 ?auto_62505 ) ( not ( = ?auto_62504 ?auto_62501 ) ) ( not ( = ?auto_62504 ?auto_62509 ) ) ( not ( = ?auto_62505 ?auto_62502 ) ) ( CALIBRATION_TARGET ?auto_62510 ?auto_62509 ) ( POWER_AVAIL ?auto_62508 ) ( POINTING ?auto_62508 ?auto_62511 ) ( not ( = ?auto_62509 ?auto_62511 ) ) ( not ( = ?auto_62501 ?auto_62511 ) ) ( not ( = ?auto_62504 ?auto_62511 ) ) ( HAVE_IMAGE ?auto_62503 ?auto_62500 ) ( HAVE_IMAGE ?auto_62506 ?auto_62507 ) ( not ( = ?auto_62501 ?auto_62503 ) ) ( not ( = ?auto_62501 ?auto_62506 ) ) ( not ( = ?auto_62502 ?auto_62500 ) ) ( not ( = ?auto_62502 ?auto_62507 ) ) ( not ( = ?auto_62503 ?auto_62504 ) ) ( not ( = ?auto_62503 ?auto_62506 ) ) ( not ( = ?auto_62503 ?auto_62509 ) ) ( not ( = ?auto_62503 ?auto_62511 ) ) ( not ( = ?auto_62500 ?auto_62505 ) ) ( not ( = ?auto_62500 ?auto_62507 ) ) ( not ( = ?auto_62504 ?auto_62506 ) ) ( not ( = ?auto_62505 ?auto_62507 ) ) ( not ( = ?auto_62506 ?auto_62509 ) ) ( not ( = ?auto_62506 ?auto_62511 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62504 ?auto_62505 ?auto_62501 ?auto_62502 )
      ( GET-4IMAGE-VERIFY ?auto_62501 ?auto_62502 ?auto_62503 ?auto_62500 ?auto_62504 ?auto_62505 ?auto_62506 ?auto_62507 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62545 - DIRECTION
      ?auto_62546 - MODE
      ?auto_62547 - DIRECTION
      ?auto_62544 - MODE
      ?auto_62548 - DIRECTION
      ?auto_62549 - MODE
      ?auto_62550 - DIRECTION
      ?auto_62551 - MODE
    )
    :vars
    (
      ?auto_62556 - INSTRUMENT
      ?auto_62552 - SATELLITE
      ?auto_62553 - DIRECTION
      ?auto_62554 - DIRECTION
      ?auto_62555 - MODE
      ?auto_62557 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_62556 ?auto_62552 ) ( SUPPORTS ?auto_62556 ?auto_62546 ) ( not ( = ?auto_62545 ?auto_62553 ) ) ( HAVE_IMAGE ?auto_62554 ?auto_62555 ) ( not ( = ?auto_62554 ?auto_62545 ) ) ( not ( = ?auto_62554 ?auto_62553 ) ) ( not ( = ?auto_62555 ?auto_62546 ) ) ( CALIBRATION_TARGET ?auto_62556 ?auto_62553 ) ( POWER_AVAIL ?auto_62552 ) ( POINTING ?auto_62552 ?auto_62557 ) ( not ( = ?auto_62553 ?auto_62557 ) ) ( not ( = ?auto_62545 ?auto_62557 ) ) ( not ( = ?auto_62554 ?auto_62557 ) ) ( HAVE_IMAGE ?auto_62547 ?auto_62544 ) ( HAVE_IMAGE ?auto_62548 ?auto_62549 ) ( HAVE_IMAGE ?auto_62550 ?auto_62551 ) ( not ( = ?auto_62545 ?auto_62547 ) ) ( not ( = ?auto_62545 ?auto_62548 ) ) ( not ( = ?auto_62545 ?auto_62550 ) ) ( not ( = ?auto_62546 ?auto_62544 ) ) ( not ( = ?auto_62546 ?auto_62549 ) ) ( not ( = ?auto_62546 ?auto_62551 ) ) ( not ( = ?auto_62547 ?auto_62548 ) ) ( not ( = ?auto_62547 ?auto_62550 ) ) ( not ( = ?auto_62547 ?auto_62553 ) ) ( not ( = ?auto_62547 ?auto_62554 ) ) ( not ( = ?auto_62547 ?auto_62557 ) ) ( not ( = ?auto_62544 ?auto_62549 ) ) ( not ( = ?auto_62544 ?auto_62551 ) ) ( not ( = ?auto_62544 ?auto_62555 ) ) ( not ( = ?auto_62548 ?auto_62550 ) ) ( not ( = ?auto_62548 ?auto_62553 ) ) ( not ( = ?auto_62548 ?auto_62554 ) ) ( not ( = ?auto_62548 ?auto_62557 ) ) ( not ( = ?auto_62549 ?auto_62551 ) ) ( not ( = ?auto_62549 ?auto_62555 ) ) ( not ( = ?auto_62550 ?auto_62553 ) ) ( not ( = ?auto_62550 ?auto_62554 ) ) ( not ( = ?auto_62550 ?auto_62557 ) ) ( not ( = ?auto_62551 ?auto_62555 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62554 ?auto_62555 ?auto_62545 ?auto_62546 )
      ( GET-4IMAGE-VERIFY ?auto_62545 ?auto_62546 ?auto_62547 ?auto_62544 ?auto_62548 ?auto_62549 ?auto_62550 ?auto_62551 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62559 - DIRECTION
      ?auto_62560 - MODE
      ?auto_62561 - DIRECTION
      ?auto_62558 - MODE
      ?auto_62562 - DIRECTION
      ?auto_62563 - MODE
      ?auto_62564 - DIRECTION
      ?auto_62565 - MODE
    )
    :vars
    (
      ?auto_62570 - INSTRUMENT
      ?auto_62566 - SATELLITE
      ?auto_62567 - DIRECTION
      ?auto_62568 - DIRECTION
      ?auto_62569 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_62570 ?auto_62566 ) ( SUPPORTS ?auto_62570 ?auto_62560 ) ( not ( = ?auto_62559 ?auto_62567 ) ) ( HAVE_IMAGE ?auto_62568 ?auto_62569 ) ( not ( = ?auto_62568 ?auto_62559 ) ) ( not ( = ?auto_62568 ?auto_62567 ) ) ( not ( = ?auto_62569 ?auto_62560 ) ) ( CALIBRATION_TARGET ?auto_62570 ?auto_62567 ) ( POWER_AVAIL ?auto_62566 ) ( POINTING ?auto_62566 ?auto_62564 ) ( not ( = ?auto_62567 ?auto_62564 ) ) ( not ( = ?auto_62559 ?auto_62564 ) ) ( not ( = ?auto_62568 ?auto_62564 ) ) ( HAVE_IMAGE ?auto_62561 ?auto_62558 ) ( HAVE_IMAGE ?auto_62562 ?auto_62563 ) ( HAVE_IMAGE ?auto_62564 ?auto_62565 ) ( not ( = ?auto_62559 ?auto_62561 ) ) ( not ( = ?auto_62559 ?auto_62562 ) ) ( not ( = ?auto_62560 ?auto_62558 ) ) ( not ( = ?auto_62560 ?auto_62563 ) ) ( not ( = ?auto_62560 ?auto_62565 ) ) ( not ( = ?auto_62561 ?auto_62562 ) ) ( not ( = ?auto_62561 ?auto_62564 ) ) ( not ( = ?auto_62561 ?auto_62567 ) ) ( not ( = ?auto_62561 ?auto_62568 ) ) ( not ( = ?auto_62558 ?auto_62563 ) ) ( not ( = ?auto_62558 ?auto_62565 ) ) ( not ( = ?auto_62558 ?auto_62569 ) ) ( not ( = ?auto_62562 ?auto_62564 ) ) ( not ( = ?auto_62562 ?auto_62567 ) ) ( not ( = ?auto_62562 ?auto_62568 ) ) ( not ( = ?auto_62563 ?auto_62565 ) ) ( not ( = ?auto_62563 ?auto_62569 ) ) ( not ( = ?auto_62565 ?auto_62569 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62568 ?auto_62569 ?auto_62559 ?auto_62560 )
      ( GET-4IMAGE-VERIFY ?auto_62559 ?auto_62560 ?auto_62561 ?auto_62558 ?auto_62562 ?auto_62563 ?auto_62564 ?auto_62565 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62594 - DIRECTION
      ?auto_62595 - MODE
      ?auto_62596 - DIRECTION
      ?auto_62593 - MODE
      ?auto_62597 - DIRECTION
      ?auto_62598 - MODE
      ?auto_62599 - DIRECTION
      ?auto_62600 - MODE
    )
    :vars
    (
      ?auto_62605 - INSTRUMENT
      ?auto_62601 - SATELLITE
      ?auto_62602 - DIRECTION
      ?auto_62603 - DIRECTION
      ?auto_62604 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_62605 ?auto_62601 ) ( SUPPORTS ?auto_62605 ?auto_62595 ) ( not ( = ?auto_62594 ?auto_62602 ) ) ( HAVE_IMAGE ?auto_62603 ?auto_62604 ) ( not ( = ?auto_62603 ?auto_62594 ) ) ( not ( = ?auto_62603 ?auto_62602 ) ) ( not ( = ?auto_62604 ?auto_62595 ) ) ( CALIBRATION_TARGET ?auto_62605 ?auto_62602 ) ( POWER_AVAIL ?auto_62601 ) ( POINTING ?auto_62601 ?auto_62597 ) ( not ( = ?auto_62602 ?auto_62597 ) ) ( not ( = ?auto_62594 ?auto_62597 ) ) ( not ( = ?auto_62603 ?auto_62597 ) ) ( HAVE_IMAGE ?auto_62596 ?auto_62593 ) ( HAVE_IMAGE ?auto_62597 ?auto_62598 ) ( HAVE_IMAGE ?auto_62599 ?auto_62600 ) ( not ( = ?auto_62594 ?auto_62596 ) ) ( not ( = ?auto_62594 ?auto_62599 ) ) ( not ( = ?auto_62595 ?auto_62593 ) ) ( not ( = ?auto_62595 ?auto_62598 ) ) ( not ( = ?auto_62595 ?auto_62600 ) ) ( not ( = ?auto_62596 ?auto_62597 ) ) ( not ( = ?auto_62596 ?auto_62599 ) ) ( not ( = ?auto_62596 ?auto_62602 ) ) ( not ( = ?auto_62596 ?auto_62603 ) ) ( not ( = ?auto_62593 ?auto_62598 ) ) ( not ( = ?auto_62593 ?auto_62600 ) ) ( not ( = ?auto_62593 ?auto_62604 ) ) ( not ( = ?auto_62597 ?auto_62599 ) ) ( not ( = ?auto_62598 ?auto_62600 ) ) ( not ( = ?auto_62598 ?auto_62604 ) ) ( not ( = ?auto_62599 ?auto_62602 ) ) ( not ( = ?auto_62599 ?auto_62603 ) ) ( not ( = ?auto_62600 ?auto_62604 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62603 ?auto_62604 ?auto_62594 ?auto_62595 )
      ( GET-4IMAGE-VERIFY ?auto_62594 ?auto_62595 ?auto_62596 ?auto_62593 ?auto_62597 ?auto_62598 ?auto_62599 ?auto_62600 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_63143 - DIRECTION
      ?auto_63144 - MODE
      ?auto_63145 - DIRECTION
      ?auto_63142 - MODE
      ?auto_63146 - DIRECTION
      ?auto_63147 - MODE
    )
    :vars
    (
      ?auto_63152 - INSTRUMENT
      ?auto_63150 - SATELLITE
      ?auto_63148 - DIRECTION
      ?auto_63151 - DIRECTION
      ?auto_63149 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63152 ?auto_63150 ) ( SUPPORTS ?auto_63152 ?auto_63147 ) ( not ( = ?auto_63146 ?auto_63148 ) ) ( HAVE_IMAGE ?auto_63145 ?auto_63144 ) ( not ( = ?auto_63145 ?auto_63146 ) ) ( not ( = ?auto_63145 ?auto_63148 ) ) ( not ( = ?auto_63144 ?auto_63147 ) ) ( CALIBRATION_TARGET ?auto_63152 ?auto_63148 ) ( POINTING ?auto_63150 ?auto_63151 ) ( not ( = ?auto_63148 ?auto_63151 ) ) ( not ( = ?auto_63146 ?auto_63151 ) ) ( not ( = ?auto_63145 ?auto_63151 ) ) ( ON_BOARD ?auto_63149 ?auto_63150 ) ( POWER_ON ?auto_63149 ) ( not ( = ?auto_63152 ?auto_63149 ) ) ( HAVE_IMAGE ?auto_63143 ?auto_63144 ) ( HAVE_IMAGE ?auto_63145 ?auto_63142 ) ( not ( = ?auto_63143 ?auto_63145 ) ) ( not ( = ?auto_63143 ?auto_63146 ) ) ( not ( = ?auto_63143 ?auto_63148 ) ) ( not ( = ?auto_63143 ?auto_63151 ) ) ( not ( = ?auto_63144 ?auto_63142 ) ) ( not ( = ?auto_63142 ?auto_63147 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63145 ?auto_63144 ?auto_63146 ?auto_63147 )
      ( GET-3IMAGE-VERIFY ?auto_63143 ?auto_63144 ?auto_63145 ?auto_63142 ?auto_63146 ?auto_63147 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_63154 - DIRECTION
      ?auto_63155 - MODE
      ?auto_63156 - DIRECTION
      ?auto_63153 - MODE
      ?auto_63157 - DIRECTION
      ?auto_63158 - MODE
    )
    :vars
    (
      ?auto_63163 - INSTRUMENT
      ?auto_63161 - SATELLITE
      ?auto_63159 - DIRECTION
      ?auto_63162 - DIRECTION
      ?auto_63160 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63163 ?auto_63161 ) ( SUPPORTS ?auto_63163 ?auto_63158 ) ( not ( = ?auto_63157 ?auto_63159 ) ) ( HAVE_IMAGE ?auto_63154 ?auto_63155 ) ( not ( = ?auto_63154 ?auto_63157 ) ) ( not ( = ?auto_63154 ?auto_63159 ) ) ( not ( = ?auto_63155 ?auto_63158 ) ) ( CALIBRATION_TARGET ?auto_63163 ?auto_63159 ) ( POINTING ?auto_63161 ?auto_63162 ) ( not ( = ?auto_63159 ?auto_63162 ) ) ( not ( = ?auto_63157 ?auto_63162 ) ) ( not ( = ?auto_63154 ?auto_63162 ) ) ( ON_BOARD ?auto_63160 ?auto_63161 ) ( POWER_ON ?auto_63160 ) ( not ( = ?auto_63163 ?auto_63160 ) ) ( HAVE_IMAGE ?auto_63156 ?auto_63153 ) ( not ( = ?auto_63154 ?auto_63156 ) ) ( not ( = ?auto_63155 ?auto_63153 ) ) ( not ( = ?auto_63156 ?auto_63157 ) ) ( not ( = ?auto_63156 ?auto_63159 ) ) ( not ( = ?auto_63156 ?auto_63162 ) ) ( not ( = ?auto_63153 ?auto_63158 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63154 ?auto_63155 ?auto_63157 ?auto_63158 )
      ( GET-3IMAGE-VERIFY ?auto_63154 ?auto_63155 ?auto_63156 ?auto_63153 ?auto_63157 ?auto_63158 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_63219 - DIRECTION
      ?auto_63220 - MODE
      ?auto_63221 - DIRECTION
      ?auto_63218 - MODE
      ?auto_63222 - DIRECTION
      ?auto_63223 - MODE
    )
    :vars
    (
      ?auto_63229 - INSTRUMENT
      ?auto_63226 - SATELLITE
      ?auto_63224 - DIRECTION
      ?auto_63227 - DIRECTION
      ?auto_63230 - MODE
      ?auto_63228 - DIRECTION
      ?auto_63225 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63229 ?auto_63226 ) ( SUPPORTS ?auto_63229 ?auto_63223 ) ( not ( = ?auto_63222 ?auto_63224 ) ) ( HAVE_IMAGE ?auto_63227 ?auto_63230 ) ( not ( = ?auto_63227 ?auto_63222 ) ) ( not ( = ?auto_63227 ?auto_63224 ) ) ( not ( = ?auto_63230 ?auto_63223 ) ) ( CALIBRATION_TARGET ?auto_63229 ?auto_63224 ) ( POINTING ?auto_63226 ?auto_63228 ) ( not ( = ?auto_63224 ?auto_63228 ) ) ( not ( = ?auto_63222 ?auto_63228 ) ) ( not ( = ?auto_63227 ?auto_63228 ) ) ( ON_BOARD ?auto_63225 ?auto_63226 ) ( POWER_ON ?auto_63225 ) ( not ( = ?auto_63229 ?auto_63225 ) ) ( HAVE_IMAGE ?auto_63219 ?auto_63220 ) ( HAVE_IMAGE ?auto_63221 ?auto_63218 ) ( not ( = ?auto_63219 ?auto_63221 ) ) ( not ( = ?auto_63219 ?auto_63222 ) ) ( not ( = ?auto_63219 ?auto_63224 ) ) ( not ( = ?auto_63219 ?auto_63227 ) ) ( not ( = ?auto_63219 ?auto_63228 ) ) ( not ( = ?auto_63220 ?auto_63218 ) ) ( not ( = ?auto_63220 ?auto_63223 ) ) ( not ( = ?auto_63220 ?auto_63230 ) ) ( not ( = ?auto_63221 ?auto_63222 ) ) ( not ( = ?auto_63221 ?auto_63224 ) ) ( not ( = ?auto_63221 ?auto_63227 ) ) ( not ( = ?auto_63221 ?auto_63228 ) ) ( not ( = ?auto_63218 ?auto_63223 ) ) ( not ( = ?auto_63218 ?auto_63230 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63227 ?auto_63230 ?auto_63222 ?auto_63223 )
      ( GET-3IMAGE-VERIFY ?auto_63219 ?auto_63220 ?auto_63221 ?auto_63218 ?auto_63222 ?auto_63223 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_63244 - DIRECTION
      ?auto_63245 - MODE
      ?auto_63246 - DIRECTION
      ?auto_63243 - MODE
      ?auto_63247 - DIRECTION
      ?auto_63248 - MODE
    )
    :vars
    (
      ?auto_63254 - INSTRUMENT
      ?auto_63251 - SATELLITE
      ?auto_63249 - DIRECTION
      ?auto_63252 - DIRECTION
      ?auto_63255 - MODE
      ?auto_63253 - DIRECTION
      ?auto_63250 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63254 ?auto_63251 ) ( SUPPORTS ?auto_63254 ?auto_63243 ) ( not ( = ?auto_63246 ?auto_63249 ) ) ( HAVE_IMAGE ?auto_63252 ?auto_63255 ) ( not ( = ?auto_63252 ?auto_63246 ) ) ( not ( = ?auto_63252 ?auto_63249 ) ) ( not ( = ?auto_63255 ?auto_63243 ) ) ( CALIBRATION_TARGET ?auto_63254 ?auto_63249 ) ( POINTING ?auto_63251 ?auto_63253 ) ( not ( = ?auto_63249 ?auto_63253 ) ) ( not ( = ?auto_63246 ?auto_63253 ) ) ( not ( = ?auto_63252 ?auto_63253 ) ) ( ON_BOARD ?auto_63250 ?auto_63251 ) ( POWER_ON ?auto_63250 ) ( not ( = ?auto_63254 ?auto_63250 ) ) ( HAVE_IMAGE ?auto_63244 ?auto_63245 ) ( HAVE_IMAGE ?auto_63247 ?auto_63248 ) ( not ( = ?auto_63244 ?auto_63246 ) ) ( not ( = ?auto_63244 ?auto_63247 ) ) ( not ( = ?auto_63244 ?auto_63249 ) ) ( not ( = ?auto_63244 ?auto_63252 ) ) ( not ( = ?auto_63244 ?auto_63253 ) ) ( not ( = ?auto_63245 ?auto_63243 ) ) ( not ( = ?auto_63245 ?auto_63248 ) ) ( not ( = ?auto_63245 ?auto_63255 ) ) ( not ( = ?auto_63246 ?auto_63247 ) ) ( not ( = ?auto_63243 ?auto_63248 ) ) ( not ( = ?auto_63247 ?auto_63249 ) ) ( not ( = ?auto_63247 ?auto_63252 ) ) ( not ( = ?auto_63247 ?auto_63253 ) ) ( not ( = ?auto_63248 ?auto_63255 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63252 ?auto_63255 ?auto_63246 ?auto_63243 )
      ( GET-3IMAGE-VERIFY ?auto_63244 ?auto_63245 ?auto_63246 ?auto_63243 ?auto_63247 ?auto_63248 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_63320 - DIRECTION
      ?auto_63321 - MODE
      ?auto_63322 - DIRECTION
      ?auto_63319 - MODE
      ?auto_63323 - DIRECTION
      ?auto_63324 - MODE
    )
    :vars
    (
      ?auto_63329 - INSTRUMENT
      ?auto_63327 - SATELLITE
      ?auto_63325 - DIRECTION
      ?auto_63328 - DIRECTION
      ?auto_63330 - MODE
      ?auto_63326 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63329 ?auto_63327 ) ( SUPPORTS ?auto_63329 ?auto_63319 ) ( not ( = ?auto_63322 ?auto_63325 ) ) ( HAVE_IMAGE ?auto_63328 ?auto_63330 ) ( not ( = ?auto_63328 ?auto_63322 ) ) ( not ( = ?auto_63328 ?auto_63325 ) ) ( not ( = ?auto_63330 ?auto_63319 ) ) ( CALIBRATION_TARGET ?auto_63329 ?auto_63325 ) ( POINTING ?auto_63327 ?auto_63323 ) ( not ( = ?auto_63325 ?auto_63323 ) ) ( not ( = ?auto_63322 ?auto_63323 ) ) ( not ( = ?auto_63328 ?auto_63323 ) ) ( ON_BOARD ?auto_63326 ?auto_63327 ) ( POWER_ON ?auto_63326 ) ( not ( = ?auto_63329 ?auto_63326 ) ) ( HAVE_IMAGE ?auto_63320 ?auto_63321 ) ( HAVE_IMAGE ?auto_63323 ?auto_63324 ) ( not ( = ?auto_63320 ?auto_63322 ) ) ( not ( = ?auto_63320 ?auto_63323 ) ) ( not ( = ?auto_63320 ?auto_63325 ) ) ( not ( = ?auto_63320 ?auto_63328 ) ) ( not ( = ?auto_63321 ?auto_63319 ) ) ( not ( = ?auto_63321 ?auto_63324 ) ) ( not ( = ?auto_63321 ?auto_63330 ) ) ( not ( = ?auto_63319 ?auto_63324 ) ) ( not ( = ?auto_63324 ?auto_63330 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63328 ?auto_63330 ?auto_63322 ?auto_63319 )
      ( GET-3IMAGE-VERIFY ?auto_63320 ?auto_63321 ?auto_63322 ?auto_63319 ?auto_63323 ?auto_63324 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_63344 - DIRECTION
      ?auto_63345 - MODE
      ?auto_63346 - DIRECTION
      ?auto_63343 - MODE
      ?auto_63347 - DIRECTION
      ?auto_63348 - MODE
    )
    :vars
    (
      ?auto_63353 - INSTRUMENT
      ?auto_63351 - SATELLITE
      ?auto_63349 - DIRECTION
      ?auto_63352 - DIRECTION
      ?auto_63350 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63353 ?auto_63351 ) ( SUPPORTS ?auto_63353 ?auto_63345 ) ( not ( = ?auto_63344 ?auto_63349 ) ) ( HAVE_IMAGE ?auto_63347 ?auto_63348 ) ( not ( = ?auto_63347 ?auto_63344 ) ) ( not ( = ?auto_63347 ?auto_63349 ) ) ( not ( = ?auto_63348 ?auto_63345 ) ) ( CALIBRATION_TARGET ?auto_63353 ?auto_63349 ) ( POINTING ?auto_63351 ?auto_63352 ) ( not ( = ?auto_63349 ?auto_63352 ) ) ( not ( = ?auto_63344 ?auto_63352 ) ) ( not ( = ?auto_63347 ?auto_63352 ) ) ( ON_BOARD ?auto_63350 ?auto_63351 ) ( POWER_ON ?auto_63350 ) ( not ( = ?auto_63353 ?auto_63350 ) ) ( HAVE_IMAGE ?auto_63346 ?auto_63343 ) ( not ( = ?auto_63344 ?auto_63346 ) ) ( not ( = ?auto_63345 ?auto_63343 ) ) ( not ( = ?auto_63346 ?auto_63347 ) ) ( not ( = ?auto_63346 ?auto_63349 ) ) ( not ( = ?auto_63346 ?auto_63352 ) ) ( not ( = ?auto_63343 ?auto_63348 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63347 ?auto_63348 ?auto_63344 ?auto_63345 )
      ( GET-3IMAGE-VERIFY ?auto_63344 ?auto_63345 ?auto_63346 ?auto_63343 ?auto_63347 ?auto_63348 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_63388 - DIRECTION
      ?auto_63389 - MODE
      ?auto_63390 - DIRECTION
      ?auto_63387 - MODE
      ?auto_63391 - DIRECTION
      ?auto_63392 - MODE
    )
    :vars
    (
      ?auto_63398 - INSTRUMENT
      ?auto_63395 - SATELLITE
      ?auto_63393 - DIRECTION
      ?auto_63396 - DIRECTION
      ?auto_63399 - MODE
      ?auto_63397 - DIRECTION
      ?auto_63394 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63398 ?auto_63395 ) ( SUPPORTS ?auto_63398 ?auto_63389 ) ( not ( = ?auto_63388 ?auto_63393 ) ) ( HAVE_IMAGE ?auto_63396 ?auto_63399 ) ( not ( = ?auto_63396 ?auto_63388 ) ) ( not ( = ?auto_63396 ?auto_63393 ) ) ( not ( = ?auto_63399 ?auto_63389 ) ) ( CALIBRATION_TARGET ?auto_63398 ?auto_63393 ) ( POINTING ?auto_63395 ?auto_63397 ) ( not ( = ?auto_63393 ?auto_63397 ) ) ( not ( = ?auto_63388 ?auto_63397 ) ) ( not ( = ?auto_63396 ?auto_63397 ) ) ( ON_BOARD ?auto_63394 ?auto_63395 ) ( POWER_ON ?auto_63394 ) ( not ( = ?auto_63398 ?auto_63394 ) ) ( HAVE_IMAGE ?auto_63390 ?auto_63387 ) ( HAVE_IMAGE ?auto_63391 ?auto_63392 ) ( not ( = ?auto_63388 ?auto_63390 ) ) ( not ( = ?auto_63388 ?auto_63391 ) ) ( not ( = ?auto_63389 ?auto_63387 ) ) ( not ( = ?auto_63389 ?auto_63392 ) ) ( not ( = ?auto_63390 ?auto_63391 ) ) ( not ( = ?auto_63390 ?auto_63393 ) ) ( not ( = ?auto_63390 ?auto_63396 ) ) ( not ( = ?auto_63390 ?auto_63397 ) ) ( not ( = ?auto_63387 ?auto_63392 ) ) ( not ( = ?auto_63387 ?auto_63399 ) ) ( not ( = ?auto_63391 ?auto_63393 ) ) ( not ( = ?auto_63391 ?auto_63396 ) ) ( not ( = ?auto_63391 ?auto_63397 ) ) ( not ( = ?auto_63392 ?auto_63399 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63396 ?auto_63399 ?auto_63388 ?auto_63389 )
      ( GET-3IMAGE-VERIFY ?auto_63388 ?auto_63389 ?auto_63390 ?auto_63387 ?auto_63391 ?auto_63392 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_63522 - DIRECTION
      ?auto_63523 - MODE
      ?auto_63524 - DIRECTION
      ?auto_63521 - MODE
      ?auto_63525 - DIRECTION
      ?auto_63526 - MODE
      ?auto_63527 - DIRECTION
      ?auto_63528 - MODE
    )
    :vars
    (
      ?auto_63533 - INSTRUMENT
      ?auto_63531 - SATELLITE
      ?auto_63529 - DIRECTION
      ?auto_63532 - DIRECTION
      ?auto_63530 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63533 ?auto_63531 ) ( SUPPORTS ?auto_63533 ?auto_63528 ) ( not ( = ?auto_63527 ?auto_63529 ) ) ( HAVE_IMAGE ?auto_63524 ?auto_63523 ) ( not ( = ?auto_63524 ?auto_63527 ) ) ( not ( = ?auto_63524 ?auto_63529 ) ) ( not ( = ?auto_63523 ?auto_63528 ) ) ( CALIBRATION_TARGET ?auto_63533 ?auto_63529 ) ( POINTING ?auto_63531 ?auto_63532 ) ( not ( = ?auto_63529 ?auto_63532 ) ) ( not ( = ?auto_63527 ?auto_63532 ) ) ( not ( = ?auto_63524 ?auto_63532 ) ) ( ON_BOARD ?auto_63530 ?auto_63531 ) ( POWER_ON ?auto_63530 ) ( not ( = ?auto_63533 ?auto_63530 ) ) ( HAVE_IMAGE ?auto_63522 ?auto_63523 ) ( HAVE_IMAGE ?auto_63524 ?auto_63521 ) ( HAVE_IMAGE ?auto_63525 ?auto_63526 ) ( not ( = ?auto_63522 ?auto_63524 ) ) ( not ( = ?auto_63522 ?auto_63525 ) ) ( not ( = ?auto_63522 ?auto_63527 ) ) ( not ( = ?auto_63522 ?auto_63529 ) ) ( not ( = ?auto_63522 ?auto_63532 ) ) ( not ( = ?auto_63523 ?auto_63521 ) ) ( not ( = ?auto_63523 ?auto_63526 ) ) ( not ( = ?auto_63524 ?auto_63525 ) ) ( not ( = ?auto_63521 ?auto_63526 ) ) ( not ( = ?auto_63521 ?auto_63528 ) ) ( not ( = ?auto_63525 ?auto_63527 ) ) ( not ( = ?auto_63525 ?auto_63529 ) ) ( not ( = ?auto_63525 ?auto_63532 ) ) ( not ( = ?auto_63526 ?auto_63528 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63524 ?auto_63523 ?auto_63527 ?auto_63528 )
      ( GET-4IMAGE-VERIFY ?auto_63522 ?auto_63523 ?auto_63524 ?auto_63521 ?auto_63525 ?auto_63526 ?auto_63527 ?auto_63528 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_63560 - DIRECTION
      ?auto_63561 - MODE
      ?auto_63562 - DIRECTION
      ?auto_63559 - MODE
      ?auto_63563 - DIRECTION
      ?auto_63564 - MODE
      ?auto_63565 - DIRECTION
      ?auto_63566 - MODE
    )
    :vars
    (
      ?auto_63571 - INSTRUMENT
      ?auto_63569 - SATELLITE
      ?auto_63567 - DIRECTION
      ?auto_63570 - DIRECTION
      ?auto_63568 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63571 ?auto_63569 ) ( SUPPORTS ?auto_63571 ?auto_63564 ) ( not ( = ?auto_63563 ?auto_63567 ) ) ( HAVE_IMAGE ?auto_63562 ?auto_63561 ) ( not ( = ?auto_63562 ?auto_63563 ) ) ( not ( = ?auto_63562 ?auto_63567 ) ) ( not ( = ?auto_63561 ?auto_63564 ) ) ( CALIBRATION_TARGET ?auto_63571 ?auto_63567 ) ( POINTING ?auto_63569 ?auto_63570 ) ( not ( = ?auto_63567 ?auto_63570 ) ) ( not ( = ?auto_63563 ?auto_63570 ) ) ( not ( = ?auto_63562 ?auto_63570 ) ) ( ON_BOARD ?auto_63568 ?auto_63569 ) ( POWER_ON ?auto_63568 ) ( not ( = ?auto_63571 ?auto_63568 ) ) ( HAVE_IMAGE ?auto_63560 ?auto_63561 ) ( HAVE_IMAGE ?auto_63562 ?auto_63559 ) ( HAVE_IMAGE ?auto_63565 ?auto_63566 ) ( not ( = ?auto_63560 ?auto_63562 ) ) ( not ( = ?auto_63560 ?auto_63563 ) ) ( not ( = ?auto_63560 ?auto_63565 ) ) ( not ( = ?auto_63560 ?auto_63567 ) ) ( not ( = ?auto_63560 ?auto_63570 ) ) ( not ( = ?auto_63561 ?auto_63559 ) ) ( not ( = ?auto_63561 ?auto_63566 ) ) ( not ( = ?auto_63562 ?auto_63565 ) ) ( not ( = ?auto_63559 ?auto_63564 ) ) ( not ( = ?auto_63559 ?auto_63566 ) ) ( not ( = ?auto_63563 ?auto_63565 ) ) ( not ( = ?auto_63564 ?auto_63566 ) ) ( not ( = ?auto_63565 ?auto_63567 ) ) ( not ( = ?auto_63565 ?auto_63570 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63562 ?auto_63561 ?auto_63563 ?auto_63564 )
      ( GET-4IMAGE-VERIFY ?auto_63560 ?auto_63561 ?auto_63562 ?auto_63559 ?auto_63563 ?auto_63564 ?auto_63565 ?auto_63566 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_63598 - DIRECTION
      ?auto_63599 - MODE
      ?auto_63600 - DIRECTION
      ?auto_63597 - MODE
      ?auto_63601 - DIRECTION
      ?auto_63602 - MODE
      ?auto_63603 - DIRECTION
      ?auto_63604 - MODE
    )
    :vars
    (
      ?auto_63609 - INSTRUMENT
      ?auto_63607 - SATELLITE
      ?auto_63605 - DIRECTION
      ?auto_63608 - DIRECTION
      ?auto_63606 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63609 ?auto_63607 ) ( SUPPORTS ?auto_63609 ?auto_63604 ) ( not ( = ?auto_63603 ?auto_63605 ) ) ( HAVE_IMAGE ?auto_63598 ?auto_63602 ) ( not ( = ?auto_63598 ?auto_63603 ) ) ( not ( = ?auto_63598 ?auto_63605 ) ) ( not ( = ?auto_63602 ?auto_63604 ) ) ( CALIBRATION_TARGET ?auto_63609 ?auto_63605 ) ( POINTING ?auto_63607 ?auto_63608 ) ( not ( = ?auto_63605 ?auto_63608 ) ) ( not ( = ?auto_63603 ?auto_63608 ) ) ( not ( = ?auto_63598 ?auto_63608 ) ) ( ON_BOARD ?auto_63606 ?auto_63607 ) ( POWER_ON ?auto_63606 ) ( not ( = ?auto_63609 ?auto_63606 ) ) ( HAVE_IMAGE ?auto_63598 ?auto_63599 ) ( HAVE_IMAGE ?auto_63600 ?auto_63597 ) ( HAVE_IMAGE ?auto_63601 ?auto_63602 ) ( not ( = ?auto_63598 ?auto_63600 ) ) ( not ( = ?auto_63598 ?auto_63601 ) ) ( not ( = ?auto_63599 ?auto_63597 ) ) ( not ( = ?auto_63599 ?auto_63602 ) ) ( not ( = ?auto_63599 ?auto_63604 ) ) ( not ( = ?auto_63600 ?auto_63601 ) ) ( not ( = ?auto_63600 ?auto_63603 ) ) ( not ( = ?auto_63600 ?auto_63605 ) ) ( not ( = ?auto_63600 ?auto_63608 ) ) ( not ( = ?auto_63597 ?auto_63602 ) ) ( not ( = ?auto_63597 ?auto_63604 ) ) ( not ( = ?auto_63601 ?auto_63603 ) ) ( not ( = ?auto_63601 ?auto_63605 ) ) ( not ( = ?auto_63601 ?auto_63608 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63598 ?auto_63602 ?auto_63603 ?auto_63604 )
      ( GET-4IMAGE-VERIFY ?auto_63598 ?auto_63599 ?auto_63600 ?auto_63597 ?auto_63601 ?auto_63602 ?auto_63603 ?auto_63604 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_63632 - DIRECTION
      ?auto_63633 - MODE
      ?auto_63634 - DIRECTION
      ?auto_63631 - MODE
      ?auto_63635 - DIRECTION
      ?auto_63636 - MODE
      ?auto_63637 - DIRECTION
      ?auto_63638 - MODE
    )
    :vars
    (
      ?auto_63643 - INSTRUMENT
      ?auto_63641 - SATELLITE
      ?auto_63639 - DIRECTION
      ?auto_63642 - DIRECTION
      ?auto_63640 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63643 ?auto_63641 ) ( SUPPORTS ?auto_63643 ?auto_63636 ) ( not ( = ?auto_63635 ?auto_63639 ) ) ( HAVE_IMAGE ?auto_63632 ?auto_63633 ) ( not ( = ?auto_63632 ?auto_63635 ) ) ( not ( = ?auto_63632 ?auto_63639 ) ) ( not ( = ?auto_63633 ?auto_63636 ) ) ( CALIBRATION_TARGET ?auto_63643 ?auto_63639 ) ( POINTING ?auto_63641 ?auto_63642 ) ( not ( = ?auto_63639 ?auto_63642 ) ) ( not ( = ?auto_63635 ?auto_63642 ) ) ( not ( = ?auto_63632 ?auto_63642 ) ) ( ON_BOARD ?auto_63640 ?auto_63641 ) ( POWER_ON ?auto_63640 ) ( not ( = ?auto_63643 ?auto_63640 ) ) ( HAVE_IMAGE ?auto_63634 ?auto_63631 ) ( HAVE_IMAGE ?auto_63637 ?auto_63638 ) ( not ( = ?auto_63632 ?auto_63634 ) ) ( not ( = ?auto_63632 ?auto_63637 ) ) ( not ( = ?auto_63633 ?auto_63631 ) ) ( not ( = ?auto_63633 ?auto_63638 ) ) ( not ( = ?auto_63634 ?auto_63635 ) ) ( not ( = ?auto_63634 ?auto_63637 ) ) ( not ( = ?auto_63634 ?auto_63639 ) ) ( not ( = ?auto_63634 ?auto_63642 ) ) ( not ( = ?auto_63631 ?auto_63636 ) ) ( not ( = ?auto_63631 ?auto_63638 ) ) ( not ( = ?auto_63635 ?auto_63637 ) ) ( not ( = ?auto_63636 ?auto_63638 ) ) ( not ( = ?auto_63637 ?auto_63639 ) ) ( not ( = ?auto_63637 ?auto_63642 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63632 ?auto_63633 ?auto_63635 ?auto_63636 )
      ( GET-4IMAGE-VERIFY ?auto_63632 ?auto_63633 ?auto_63634 ?auto_63631 ?auto_63635 ?auto_63636 ?auto_63637 ?auto_63638 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_63658 - DIRECTION
      ?auto_63659 - MODE
      ?auto_63660 - DIRECTION
      ?auto_63657 - MODE
      ?auto_63661 - DIRECTION
      ?auto_63662 - MODE
      ?auto_63663 - DIRECTION
      ?auto_63664 - MODE
    )
    :vars
    (
      ?auto_63668 - INSTRUMENT
      ?auto_63667 - SATELLITE
      ?auto_63665 - DIRECTION
      ?auto_63666 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63668 ?auto_63667 ) ( SUPPORTS ?auto_63668 ?auto_63662 ) ( not ( = ?auto_63661 ?auto_63665 ) ) ( HAVE_IMAGE ?auto_63658 ?auto_63659 ) ( not ( = ?auto_63658 ?auto_63661 ) ) ( not ( = ?auto_63658 ?auto_63665 ) ) ( not ( = ?auto_63659 ?auto_63662 ) ) ( CALIBRATION_TARGET ?auto_63668 ?auto_63665 ) ( POINTING ?auto_63667 ?auto_63663 ) ( not ( = ?auto_63665 ?auto_63663 ) ) ( not ( = ?auto_63661 ?auto_63663 ) ) ( not ( = ?auto_63658 ?auto_63663 ) ) ( ON_BOARD ?auto_63666 ?auto_63667 ) ( POWER_ON ?auto_63666 ) ( not ( = ?auto_63668 ?auto_63666 ) ) ( HAVE_IMAGE ?auto_63660 ?auto_63657 ) ( HAVE_IMAGE ?auto_63663 ?auto_63664 ) ( not ( = ?auto_63658 ?auto_63660 ) ) ( not ( = ?auto_63659 ?auto_63657 ) ) ( not ( = ?auto_63659 ?auto_63664 ) ) ( not ( = ?auto_63660 ?auto_63661 ) ) ( not ( = ?auto_63660 ?auto_63663 ) ) ( not ( = ?auto_63660 ?auto_63665 ) ) ( not ( = ?auto_63657 ?auto_63662 ) ) ( not ( = ?auto_63657 ?auto_63664 ) ) ( not ( = ?auto_63662 ?auto_63664 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63658 ?auto_63659 ?auto_63661 ?auto_63662 )
      ( GET-4IMAGE-VERIFY ?auto_63658 ?auto_63659 ?auto_63660 ?auto_63657 ?auto_63661 ?auto_63662 ?auto_63663 ?auto_63664 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_63683 - DIRECTION
      ?auto_63684 - MODE
      ?auto_63685 - DIRECTION
      ?auto_63682 - MODE
      ?auto_63686 - DIRECTION
      ?auto_63687 - MODE
      ?auto_63688 - DIRECTION
      ?auto_63689 - MODE
    )
    :vars
    (
      ?auto_63693 - INSTRUMENT
      ?auto_63692 - SATELLITE
      ?auto_63690 - DIRECTION
      ?auto_63691 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63693 ?auto_63692 ) ( SUPPORTS ?auto_63693 ?auto_63689 ) ( not ( = ?auto_63688 ?auto_63690 ) ) ( HAVE_IMAGE ?auto_63683 ?auto_63684 ) ( not ( = ?auto_63683 ?auto_63688 ) ) ( not ( = ?auto_63683 ?auto_63690 ) ) ( not ( = ?auto_63684 ?auto_63689 ) ) ( CALIBRATION_TARGET ?auto_63693 ?auto_63690 ) ( POINTING ?auto_63692 ?auto_63685 ) ( not ( = ?auto_63690 ?auto_63685 ) ) ( not ( = ?auto_63688 ?auto_63685 ) ) ( not ( = ?auto_63683 ?auto_63685 ) ) ( ON_BOARD ?auto_63691 ?auto_63692 ) ( POWER_ON ?auto_63691 ) ( not ( = ?auto_63693 ?auto_63691 ) ) ( HAVE_IMAGE ?auto_63685 ?auto_63682 ) ( HAVE_IMAGE ?auto_63686 ?auto_63687 ) ( not ( = ?auto_63683 ?auto_63686 ) ) ( not ( = ?auto_63684 ?auto_63682 ) ) ( not ( = ?auto_63684 ?auto_63687 ) ) ( not ( = ?auto_63685 ?auto_63686 ) ) ( not ( = ?auto_63682 ?auto_63687 ) ) ( not ( = ?auto_63682 ?auto_63689 ) ) ( not ( = ?auto_63686 ?auto_63688 ) ) ( not ( = ?auto_63686 ?auto_63690 ) ) ( not ( = ?auto_63687 ?auto_63689 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63683 ?auto_63684 ?auto_63688 ?auto_63689 )
      ( GET-4IMAGE-VERIFY ?auto_63683 ?auto_63684 ?auto_63685 ?auto_63682 ?auto_63686 ?auto_63687 ?auto_63688 ?auto_63689 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_63763 - DIRECTION
      ?auto_63764 - MODE
      ?auto_63765 - DIRECTION
      ?auto_63762 - MODE
      ?auto_63766 - DIRECTION
      ?auto_63767 - MODE
      ?auto_63768 - DIRECTION
      ?auto_63769 - MODE
    )
    :vars
    (
      ?auto_63774 - INSTRUMENT
      ?auto_63772 - SATELLITE
      ?auto_63770 - DIRECTION
      ?auto_63773 - DIRECTION
      ?auto_63771 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63774 ?auto_63772 ) ( SUPPORTS ?auto_63774 ?auto_63762 ) ( not ( = ?auto_63765 ?auto_63770 ) ) ( HAVE_IMAGE ?auto_63768 ?auto_63769 ) ( not ( = ?auto_63768 ?auto_63765 ) ) ( not ( = ?auto_63768 ?auto_63770 ) ) ( not ( = ?auto_63769 ?auto_63762 ) ) ( CALIBRATION_TARGET ?auto_63774 ?auto_63770 ) ( POINTING ?auto_63772 ?auto_63773 ) ( not ( = ?auto_63770 ?auto_63773 ) ) ( not ( = ?auto_63765 ?auto_63773 ) ) ( not ( = ?auto_63768 ?auto_63773 ) ) ( ON_BOARD ?auto_63771 ?auto_63772 ) ( POWER_ON ?auto_63771 ) ( not ( = ?auto_63774 ?auto_63771 ) ) ( HAVE_IMAGE ?auto_63763 ?auto_63764 ) ( HAVE_IMAGE ?auto_63766 ?auto_63767 ) ( not ( = ?auto_63763 ?auto_63765 ) ) ( not ( = ?auto_63763 ?auto_63766 ) ) ( not ( = ?auto_63763 ?auto_63768 ) ) ( not ( = ?auto_63763 ?auto_63770 ) ) ( not ( = ?auto_63763 ?auto_63773 ) ) ( not ( = ?auto_63764 ?auto_63762 ) ) ( not ( = ?auto_63764 ?auto_63767 ) ) ( not ( = ?auto_63764 ?auto_63769 ) ) ( not ( = ?auto_63765 ?auto_63766 ) ) ( not ( = ?auto_63762 ?auto_63767 ) ) ( not ( = ?auto_63766 ?auto_63768 ) ) ( not ( = ?auto_63766 ?auto_63770 ) ) ( not ( = ?auto_63766 ?auto_63773 ) ) ( not ( = ?auto_63767 ?auto_63769 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63768 ?auto_63769 ?auto_63765 ?auto_63762 )
      ( GET-4IMAGE-VERIFY ?auto_63763 ?auto_63764 ?auto_63765 ?auto_63762 ?auto_63766 ?auto_63767 ?auto_63768 ?auto_63769 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_63776 - DIRECTION
      ?auto_63777 - MODE
      ?auto_63778 - DIRECTION
      ?auto_63775 - MODE
      ?auto_63779 - DIRECTION
      ?auto_63780 - MODE
      ?auto_63781 - DIRECTION
      ?auto_63782 - MODE
    )
    :vars
    (
      ?auto_63787 - INSTRUMENT
      ?auto_63785 - SATELLITE
      ?auto_63783 - DIRECTION
      ?auto_63786 - DIRECTION
      ?auto_63784 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63787 ?auto_63785 ) ( SUPPORTS ?auto_63787 ?auto_63775 ) ( not ( = ?auto_63778 ?auto_63783 ) ) ( HAVE_IMAGE ?auto_63776 ?auto_63777 ) ( not ( = ?auto_63776 ?auto_63778 ) ) ( not ( = ?auto_63776 ?auto_63783 ) ) ( not ( = ?auto_63777 ?auto_63775 ) ) ( CALIBRATION_TARGET ?auto_63787 ?auto_63783 ) ( POINTING ?auto_63785 ?auto_63786 ) ( not ( = ?auto_63783 ?auto_63786 ) ) ( not ( = ?auto_63778 ?auto_63786 ) ) ( not ( = ?auto_63776 ?auto_63786 ) ) ( ON_BOARD ?auto_63784 ?auto_63785 ) ( POWER_ON ?auto_63784 ) ( not ( = ?auto_63787 ?auto_63784 ) ) ( HAVE_IMAGE ?auto_63779 ?auto_63780 ) ( HAVE_IMAGE ?auto_63781 ?auto_63782 ) ( not ( = ?auto_63776 ?auto_63779 ) ) ( not ( = ?auto_63776 ?auto_63781 ) ) ( not ( = ?auto_63777 ?auto_63780 ) ) ( not ( = ?auto_63777 ?auto_63782 ) ) ( not ( = ?auto_63778 ?auto_63779 ) ) ( not ( = ?auto_63778 ?auto_63781 ) ) ( not ( = ?auto_63775 ?auto_63780 ) ) ( not ( = ?auto_63775 ?auto_63782 ) ) ( not ( = ?auto_63779 ?auto_63781 ) ) ( not ( = ?auto_63779 ?auto_63783 ) ) ( not ( = ?auto_63779 ?auto_63786 ) ) ( not ( = ?auto_63780 ?auto_63782 ) ) ( not ( = ?auto_63781 ?auto_63783 ) ) ( not ( = ?auto_63781 ?auto_63786 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63776 ?auto_63777 ?auto_63778 ?auto_63775 )
      ( GET-4IMAGE-VERIFY ?auto_63776 ?auto_63777 ?auto_63778 ?auto_63775 ?auto_63779 ?auto_63780 ?auto_63781 ?auto_63782 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_63861 - DIRECTION
      ?auto_63862 - MODE
      ?auto_63863 - DIRECTION
      ?auto_63860 - MODE
      ?auto_63864 - DIRECTION
      ?auto_63865 - MODE
      ?auto_63866 - DIRECTION
      ?auto_63867 - MODE
    )
    :vars
    (
      ?auto_63871 - INSTRUMENT
      ?auto_63870 - SATELLITE
      ?auto_63868 - DIRECTION
      ?auto_63869 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63871 ?auto_63870 ) ( SUPPORTS ?auto_63871 ?auto_63860 ) ( not ( = ?auto_63863 ?auto_63868 ) ) ( HAVE_IMAGE ?auto_63866 ?auto_63867 ) ( not ( = ?auto_63866 ?auto_63863 ) ) ( not ( = ?auto_63866 ?auto_63868 ) ) ( not ( = ?auto_63867 ?auto_63860 ) ) ( CALIBRATION_TARGET ?auto_63871 ?auto_63868 ) ( POINTING ?auto_63870 ?auto_63864 ) ( not ( = ?auto_63868 ?auto_63864 ) ) ( not ( = ?auto_63863 ?auto_63864 ) ) ( not ( = ?auto_63866 ?auto_63864 ) ) ( ON_BOARD ?auto_63869 ?auto_63870 ) ( POWER_ON ?auto_63869 ) ( not ( = ?auto_63871 ?auto_63869 ) ) ( HAVE_IMAGE ?auto_63861 ?auto_63862 ) ( HAVE_IMAGE ?auto_63864 ?auto_63865 ) ( not ( = ?auto_63861 ?auto_63863 ) ) ( not ( = ?auto_63861 ?auto_63864 ) ) ( not ( = ?auto_63861 ?auto_63866 ) ) ( not ( = ?auto_63861 ?auto_63868 ) ) ( not ( = ?auto_63862 ?auto_63860 ) ) ( not ( = ?auto_63862 ?auto_63865 ) ) ( not ( = ?auto_63862 ?auto_63867 ) ) ( not ( = ?auto_63860 ?auto_63865 ) ) ( not ( = ?auto_63865 ?auto_63867 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63866 ?auto_63867 ?auto_63863 ?auto_63860 )
      ( GET-4IMAGE-VERIFY ?auto_63861 ?auto_63862 ?auto_63863 ?auto_63860 ?auto_63864 ?auto_63865 ?auto_63866 ?auto_63867 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_63956 - DIRECTION
      ?auto_63957 - MODE
      ?auto_63958 - DIRECTION
      ?auto_63955 - MODE
      ?auto_63959 - DIRECTION
      ?auto_63960 - MODE
      ?auto_63961 - DIRECTION
      ?auto_63962 - MODE
    )
    :vars
    (
      ?auto_63967 - INSTRUMENT
      ?auto_63965 - SATELLITE
      ?auto_63963 - DIRECTION
      ?auto_63966 - DIRECTION
      ?auto_63964 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_63967 ?auto_63965 ) ( SUPPORTS ?auto_63967 ?auto_63962 ) ( not ( = ?auto_63961 ?auto_63963 ) ) ( HAVE_IMAGE ?auto_63958 ?auto_63955 ) ( not ( = ?auto_63958 ?auto_63961 ) ) ( not ( = ?auto_63958 ?auto_63963 ) ) ( not ( = ?auto_63955 ?auto_63962 ) ) ( CALIBRATION_TARGET ?auto_63967 ?auto_63963 ) ( POINTING ?auto_63965 ?auto_63966 ) ( not ( = ?auto_63963 ?auto_63966 ) ) ( not ( = ?auto_63961 ?auto_63966 ) ) ( not ( = ?auto_63958 ?auto_63966 ) ) ( ON_BOARD ?auto_63964 ?auto_63965 ) ( POWER_ON ?auto_63964 ) ( not ( = ?auto_63967 ?auto_63964 ) ) ( HAVE_IMAGE ?auto_63956 ?auto_63957 ) ( HAVE_IMAGE ?auto_63959 ?auto_63960 ) ( not ( = ?auto_63956 ?auto_63958 ) ) ( not ( = ?auto_63956 ?auto_63959 ) ) ( not ( = ?auto_63956 ?auto_63961 ) ) ( not ( = ?auto_63956 ?auto_63963 ) ) ( not ( = ?auto_63956 ?auto_63966 ) ) ( not ( = ?auto_63957 ?auto_63955 ) ) ( not ( = ?auto_63957 ?auto_63960 ) ) ( not ( = ?auto_63957 ?auto_63962 ) ) ( not ( = ?auto_63958 ?auto_63959 ) ) ( not ( = ?auto_63955 ?auto_63960 ) ) ( not ( = ?auto_63959 ?auto_63961 ) ) ( not ( = ?auto_63959 ?auto_63963 ) ) ( not ( = ?auto_63959 ?auto_63966 ) ) ( not ( = ?auto_63960 ?auto_63962 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63958 ?auto_63955 ?auto_63961 ?auto_63962 )
      ( GET-4IMAGE-VERIFY ?auto_63956 ?auto_63957 ?auto_63958 ?auto_63955 ?auto_63959 ?auto_63960 ?auto_63961 ?auto_63962 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_63990 - DIRECTION
      ?auto_63991 - MODE
      ?auto_63992 - DIRECTION
      ?auto_63989 - MODE
      ?auto_63993 - DIRECTION
      ?auto_63994 - MODE
      ?auto_63995 - DIRECTION
      ?auto_63996 - MODE
    )
    :vars
    (
      ?auto_64001 - INSTRUMENT
      ?auto_63999 - SATELLITE
      ?auto_63997 - DIRECTION
      ?auto_64000 - DIRECTION
      ?auto_63998 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64001 ?auto_63999 ) ( SUPPORTS ?auto_64001 ?auto_63994 ) ( not ( = ?auto_63993 ?auto_63997 ) ) ( HAVE_IMAGE ?auto_63992 ?auto_63989 ) ( not ( = ?auto_63992 ?auto_63993 ) ) ( not ( = ?auto_63992 ?auto_63997 ) ) ( not ( = ?auto_63989 ?auto_63994 ) ) ( CALIBRATION_TARGET ?auto_64001 ?auto_63997 ) ( POINTING ?auto_63999 ?auto_64000 ) ( not ( = ?auto_63997 ?auto_64000 ) ) ( not ( = ?auto_63993 ?auto_64000 ) ) ( not ( = ?auto_63992 ?auto_64000 ) ) ( ON_BOARD ?auto_63998 ?auto_63999 ) ( POWER_ON ?auto_63998 ) ( not ( = ?auto_64001 ?auto_63998 ) ) ( HAVE_IMAGE ?auto_63990 ?auto_63991 ) ( HAVE_IMAGE ?auto_63995 ?auto_63996 ) ( not ( = ?auto_63990 ?auto_63992 ) ) ( not ( = ?auto_63990 ?auto_63993 ) ) ( not ( = ?auto_63990 ?auto_63995 ) ) ( not ( = ?auto_63990 ?auto_63997 ) ) ( not ( = ?auto_63990 ?auto_64000 ) ) ( not ( = ?auto_63991 ?auto_63989 ) ) ( not ( = ?auto_63991 ?auto_63994 ) ) ( not ( = ?auto_63991 ?auto_63996 ) ) ( not ( = ?auto_63992 ?auto_63995 ) ) ( not ( = ?auto_63989 ?auto_63996 ) ) ( not ( = ?auto_63993 ?auto_63995 ) ) ( not ( = ?auto_63994 ?auto_63996 ) ) ( not ( = ?auto_63995 ?auto_63997 ) ) ( not ( = ?auto_63995 ?auto_64000 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63992 ?auto_63989 ?auto_63993 ?auto_63994 )
      ( GET-4IMAGE-VERIFY ?auto_63990 ?auto_63991 ?auto_63992 ?auto_63989 ?auto_63993 ?auto_63994 ?auto_63995 ?auto_63996 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64050 - DIRECTION
      ?auto_64051 - MODE
      ?auto_64052 - DIRECTION
      ?auto_64049 - MODE
      ?auto_64053 - DIRECTION
      ?auto_64054 - MODE
      ?auto_64055 - DIRECTION
      ?auto_64056 - MODE
    )
    :vars
    (
      ?auto_64062 - INSTRUMENT
      ?auto_64059 - SATELLITE
      ?auto_64057 - DIRECTION
      ?auto_64060 - DIRECTION
      ?auto_64063 - MODE
      ?auto_64061 - DIRECTION
      ?auto_64058 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64062 ?auto_64059 ) ( SUPPORTS ?auto_64062 ?auto_64056 ) ( not ( = ?auto_64055 ?auto_64057 ) ) ( HAVE_IMAGE ?auto_64060 ?auto_64063 ) ( not ( = ?auto_64060 ?auto_64055 ) ) ( not ( = ?auto_64060 ?auto_64057 ) ) ( not ( = ?auto_64063 ?auto_64056 ) ) ( CALIBRATION_TARGET ?auto_64062 ?auto_64057 ) ( POINTING ?auto_64059 ?auto_64061 ) ( not ( = ?auto_64057 ?auto_64061 ) ) ( not ( = ?auto_64055 ?auto_64061 ) ) ( not ( = ?auto_64060 ?auto_64061 ) ) ( ON_BOARD ?auto_64058 ?auto_64059 ) ( POWER_ON ?auto_64058 ) ( not ( = ?auto_64062 ?auto_64058 ) ) ( HAVE_IMAGE ?auto_64050 ?auto_64051 ) ( HAVE_IMAGE ?auto_64052 ?auto_64049 ) ( HAVE_IMAGE ?auto_64053 ?auto_64054 ) ( not ( = ?auto_64050 ?auto_64052 ) ) ( not ( = ?auto_64050 ?auto_64053 ) ) ( not ( = ?auto_64050 ?auto_64055 ) ) ( not ( = ?auto_64050 ?auto_64057 ) ) ( not ( = ?auto_64050 ?auto_64060 ) ) ( not ( = ?auto_64050 ?auto_64061 ) ) ( not ( = ?auto_64051 ?auto_64049 ) ) ( not ( = ?auto_64051 ?auto_64054 ) ) ( not ( = ?auto_64051 ?auto_64056 ) ) ( not ( = ?auto_64051 ?auto_64063 ) ) ( not ( = ?auto_64052 ?auto_64053 ) ) ( not ( = ?auto_64052 ?auto_64055 ) ) ( not ( = ?auto_64052 ?auto_64057 ) ) ( not ( = ?auto_64052 ?auto_64060 ) ) ( not ( = ?auto_64052 ?auto_64061 ) ) ( not ( = ?auto_64049 ?auto_64054 ) ) ( not ( = ?auto_64049 ?auto_64056 ) ) ( not ( = ?auto_64049 ?auto_64063 ) ) ( not ( = ?auto_64053 ?auto_64055 ) ) ( not ( = ?auto_64053 ?auto_64057 ) ) ( not ( = ?auto_64053 ?auto_64060 ) ) ( not ( = ?auto_64053 ?auto_64061 ) ) ( not ( = ?auto_64054 ?auto_64056 ) ) ( not ( = ?auto_64054 ?auto_64063 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64060 ?auto_64063 ?auto_64055 ?auto_64056 )
      ( GET-4IMAGE-VERIFY ?auto_64050 ?auto_64051 ?auto_64052 ?auto_64049 ?auto_64053 ?auto_64054 ?auto_64055 ?auto_64056 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64079 - DIRECTION
      ?auto_64080 - MODE
      ?auto_64081 - DIRECTION
      ?auto_64078 - MODE
      ?auto_64082 - DIRECTION
      ?auto_64083 - MODE
      ?auto_64084 - DIRECTION
      ?auto_64085 - MODE
    )
    :vars
    (
      ?auto_64090 - INSTRUMENT
      ?auto_64088 - SATELLITE
      ?auto_64086 - DIRECTION
      ?auto_64089 - DIRECTION
      ?auto_64087 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64090 ?auto_64088 ) ( SUPPORTS ?auto_64090 ?auto_64083 ) ( not ( = ?auto_64082 ?auto_64086 ) ) ( HAVE_IMAGE ?auto_64084 ?auto_64085 ) ( not ( = ?auto_64084 ?auto_64082 ) ) ( not ( = ?auto_64084 ?auto_64086 ) ) ( not ( = ?auto_64085 ?auto_64083 ) ) ( CALIBRATION_TARGET ?auto_64090 ?auto_64086 ) ( POINTING ?auto_64088 ?auto_64089 ) ( not ( = ?auto_64086 ?auto_64089 ) ) ( not ( = ?auto_64082 ?auto_64089 ) ) ( not ( = ?auto_64084 ?auto_64089 ) ) ( ON_BOARD ?auto_64087 ?auto_64088 ) ( POWER_ON ?auto_64087 ) ( not ( = ?auto_64090 ?auto_64087 ) ) ( HAVE_IMAGE ?auto_64079 ?auto_64080 ) ( HAVE_IMAGE ?auto_64081 ?auto_64078 ) ( not ( = ?auto_64079 ?auto_64081 ) ) ( not ( = ?auto_64079 ?auto_64082 ) ) ( not ( = ?auto_64079 ?auto_64084 ) ) ( not ( = ?auto_64079 ?auto_64086 ) ) ( not ( = ?auto_64079 ?auto_64089 ) ) ( not ( = ?auto_64080 ?auto_64078 ) ) ( not ( = ?auto_64080 ?auto_64083 ) ) ( not ( = ?auto_64080 ?auto_64085 ) ) ( not ( = ?auto_64081 ?auto_64082 ) ) ( not ( = ?auto_64081 ?auto_64084 ) ) ( not ( = ?auto_64081 ?auto_64086 ) ) ( not ( = ?auto_64081 ?auto_64089 ) ) ( not ( = ?auto_64078 ?auto_64083 ) ) ( not ( = ?auto_64078 ?auto_64085 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64084 ?auto_64085 ?auto_64082 ?auto_64083 )
      ( GET-4IMAGE-VERIFY ?auto_64079 ?auto_64080 ?auto_64081 ?auto_64078 ?auto_64082 ?auto_64083 ?auto_64084 ?auto_64085 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64092 - DIRECTION
      ?auto_64093 - MODE
      ?auto_64094 - DIRECTION
      ?auto_64091 - MODE
      ?auto_64095 - DIRECTION
      ?auto_64096 - MODE
      ?auto_64097 - DIRECTION
      ?auto_64098 - MODE
    )
    :vars
    (
      ?auto_64104 - INSTRUMENT
      ?auto_64101 - SATELLITE
      ?auto_64099 - DIRECTION
      ?auto_64102 - DIRECTION
      ?auto_64105 - MODE
      ?auto_64103 - DIRECTION
      ?auto_64100 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64104 ?auto_64101 ) ( SUPPORTS ?auto_64104 ?auto_64096 ) ( not ( = ?auto_64095 ?auto_64099 ) ) ( HAVE_IMAGE ?auto_64102 ?auto_64105 ) ( not ( = ?auto_64102 ?auto_64095 ) ) ( not ( = ?auto_64102 ?auto_64099 ) ) ( not ( = ?auto_64105 ?auto_64096 ) ) ( CALIBRATION_TARGET ?auto_64104 ?auto_64099 ) ( POINTING ?auto_64101 ?auto_64103 ) ( not ( = ?auto_64099 ?auto_64103 ) ) ( not ( = ?auto_64095 ?auto_64103 ) ) ( not ( = ?auto_64102 ?auto_64103 ) ) ( ON_BOARD ?auto_64100 ?auto_64101 ) ( POWER_ON ?auto_64100 ) ( not ( = ?auto_64104 ?auto_64100 ) ) ( HAVE_IMAGE ?auto_64092 ?auto_64093 ) ( HAVE_IMAGE ?auto_64094 ?auto_64091 ) ( HAVE_IMAGE ?auto_64097 ?auto_64098 ) ( not ( = ?auto_64092 ?auto_64094 ) ) ( not ( = ?auto_64092 ?auto_64095 ) ) ( not ( = ?auto_64092 ?auto_64097 ) ) ( not ( = ?auto_64092 ?auto_64099 ) ) ( not ( = ?auto_64092 ?auto_64102 ) ) ( not ( = ?auto_64092 ?auto_64103 ) ) ( not ( = ?auto_64093 ?auto_64091 ) ) ( not ( = ?auto_64093 ?auto_64096 ) ) ( not ( = ?auto_64093 ?auto_64098 ) ) ( not ( = ?auto_64093 ?auto_64105 ) ) ( not ( = ?auto_64094 ?auto_64095 ) ) ( not ( = ?auto_64094 ?auto_64097 ) ) ( not ( = ?auto_64094 ?auto_64099 ) ) ( not ( = ?auto_64094 ?auto_64102 ) ) ( not ( = ?auto_64094 ?auto_64103 ) ) ( not ( = ?auto_64091 ?auto_64096 ) ) ( not ( = ?auto_64091 ?auto_64098 ) ) ( not ( = ?auto_64091 ?auto_64105 ) ) ( not ( = ?auto_64095 ?auto_64097 ) ) ( not ( = ?auto_64096 ?auto_64098 ) ) ( not ( = ?auto_64097 ?auto_64099 ) ) ( not ( = ?auto_64097 ?auto_64102 ) ) ( not ( = ?auto_64097 ?auto_64103 ) ) ( not ( = ?auto_64098 ?auto_64105 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64102 ?auto_64105 ?auto_64095 ?auto_64096 )
      ( GET-4IMAGE-VERIFY ?auto_64092 ?auto_64093 ?auto_64094 ?auto_64091 ?auto_64095 ?auto_64096 ?auto_64097 ?auto_64098 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64107 - DIRECTION
      ?auto_64108 - MODE
      ?auto_64109 - DIRECTION
      ?auto_64106 - MODE
      ?auto_64110 - DIRECTION
      ?auto_64111 - MODE
      ?auto_64112 - DIRECTION
      ?auto_64113 - MODE
    )
    :vars
    (
      ?auto_64118 - INSTRUMENT
      ?auto_64116 - SATELLITE
      ?auto_64114 - DIRECTION
      ?auto_64117 - DIRECTION
      ?auto_64119 - MODE
      ?auto_64115 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64118 ?auto_64116 ) ( SUPPORTS ?auto_64118 ?auto_64111 ) ( not ( = ?auto_64110 ?auto_64114 ) ) ( HAVE_IMAGE ?auto_64117 ?auto_64119 ) ( not ( = ?auto_64117 ?auto_64110 ) ) ( not ( = ?auto_64117 ?auto_64114 ) ) ( not ( = ?auto_64119 ?auto_64111 ) ) ( CALIBRATION_TARGET ?auto_64118 ?auto_64114 ) ( POINTING ?auto_64116 ?auto_64112 ) ( not ( = ?auto_64114 ?auto_64112 ) ) ( not ( = ?auto_64110 ?auto_64112 ) ) ( not ( = ?auto_64117 ?auto_64112 ) ) ( ON_BOARD ?auto_64115 ?auto_64116 ) ( POWER_ON ?auto_64115 ) ( not ( = ?auto_64118 ?auto_64115 ) ) ( HAVE_IMAGE ?auto_64107 ?auto_64108 ) ( HAVE_IMAGE ?auto_64109 ?auto_64106 ) ( HAVE_IMAGE ?auto_64112 ?auto_64113 ) ( not ( = ?auto_64107 ?auto_64109 ) ) ( not ( = ?auto_64107 ?auto_64110 ) ) ( not ( = ?auto_64107 ?auto_64112 ) ) ( not ( = ?auto_64107 ?auto_64114 ) ) ( not ( = ?auto_64107 ?auto_64117 ) ) ( not ( = ?auto_64108 ?auto_64106 ) ) ( not ( = ?auto_64108 ?auto_64111 ) ) ( not ( = ?auto_64108 ?auto_64113 ) ) ( not ( = ?auto_64108 ?auto_64119 ) ) ( not ( = ?auto_64109 ?auto_64110 ) ) ( not ( = ?auto_64109 ?auto_64112 ) ) ( not ( = ?auto_64109 ?auto_64114 ) ) ( not ( = ?auto_64109 ?auto_64117 ) ) ( not ( = ?auto_64106 ?auto_64111 ) ) ( not ( = ?auto_64106 ?auto_64113 ) ) ( not ( = ?auto_64106 ?auto_64119 ) ) ( not ( = ?auto_64111 ?auto_64113 ) ) ( not ( = ?auto_64113 ?auto_64119 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64117 ?auto_64119 ?auto_64110 ?auto_64111 )
      ( GET-4IMAGE-VERIFY ?auto_64107 ?auto_64108 ?auto_64109 ?auto_64106 ?auto_64110 ?auto_64111 ?auto_64112 ?auto_64113 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64144 - DIRECTION
      ?auto_64145 - MODE
      ?auto_64146 - DIRECTION
      ?auto_64143 - MODE
      ?auto_64147 - DIRECTION
      ?auto_64148 - MODE
      ?auto_64149 - DIRECTION
      ?auto_64150 - MODE
    )
    :vars
    (
      ?auto_64155 - INSTRUMENT
      ?auto_64153 - SATELLITE
      ?auto_64151 - DIRECTION
      ?auto_64154 - DIRECTION
      ?auto_64156 - MODE
      ?auto_64152 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64155 ?auto_64153 ) ( SUPPORTS ?auto_64155 ?auto_64150 ) ( not ( = ?auto_64149 ?auto_64151 ) ) ( HAVE_IMAGE ?auto_64154 ?auto_64156 ) ( not ( = ?auto_64154 ?auto_64149 ) ) ( not ( = ?auto_64154 ?auto_64151 ) ) ( not ( = ?auto_64156 ?auto_64150 ) ) ( CALIBRATION_TARGET ?auto_64155 ?auto_64151 ) ( POINTING ?auto_64153 ?auto_64146 ) ( not ( = ?auto_64151 ?auto_64146 ) ) ( not ( = ?auto_64149 ?auto_64146 ) ) ( not ( = ?auto_64154 ?auto_64146 ) ) ( ON_BOARD ?auto_64152 ?auto_64153 ) ( POWER_ON ?auto_64152 ) ( not ( = ?auto_64155 ?auto_64152 ) ) ( HAVE_IMAGE ?auto_64144 ?auto_64145 ) ( HAVE_IMAGE ?auto_64146 ?auto_64143 ) ( HAVE_IMAGE ?auto_64147 ?auto_64148 ) ( not ( = ?auto_64144 ?auto_64146 ) ) ( not ( = ?auto_64144 ?auto_64147 ) ) ( not ( = ?auto_64144 ?auto_64149 ) ) ( not ( = ?auto_64144 ?auto_64151 ) ) ( not ( = ?auto_64144 ?auto_64154 ) ) ( not ( = ?auto_64145 ?auto_64143 ) ) ( not ( = ?auto_64145 ?auto_64148 ) ) ( not ( = ?auto_64145 ?auto_64150 ) ) ( not ( = ?auto_64145 ?auto_64156 ) ) ( not ( = ?auto_64146 ?auto_64147 ) ) ( not ( = ?auto_64143 ?auto_64148 ) ) ( not ( = ?auto_64143 ?auto_64150 ) ) ( not ( = ?auto_64143 ?auto_64156 ) ) ( not ( = ?auto_64147 ?auto_64149 ) ) ( not ( = ?auto_64147 ?auto_64151 ) ) ( not ( = ?auto_64147 ?auto_64154 ) ) ( not ( = ?auto_64148 ?auto_64150 ) ) ( not ( = ?auto_64148 ?auto_64156 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64154 ?auto_64156 ?auto_64149 ?auto_64150 )
      ( GET-4IMAGE-VERIFY ?auto_64144 ?auto_64145 ?auto_64146 ?auto_64143 ?auto_64147 ?auto_64148 ?auto_64149 ?auto_64150 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64222 - DIRECTION
      ?auto_64223 - MODE
      ?auto_64224 - DIRECTION
      ?auto_64221 - MODE
      ?auto_64225 - DIRECTION
      ?auto_64226 - MODE
      ?auto_64227 - DIRECTION
      ?auto_64228 - MODE
    )
    :vars
    (
      ?auto_64233 - INSTRUMENT
      ?auto_64231 - SATELLITE
      ?auto_64229 - DIRECTION
      ?auto_64232 - DIRECTION
      ?auto_64230 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64233 ?auto_64231 ) ( SUPPORTS ?auto_64233 ?auto_64221 ) ( not ( = ?auto_64224 ?auto_64229 ) ) ( HAVE_IMAGE ?auto_64227 ?auto_64226 ) ( not ( = ?auto_64227 ?auto_64224 ) ) ( not ( = ?auto_64227 ?auto_64229 ) ) ( not ( = ?auto_64226 ?auto_64221 ) ) ( CALIBRATION_TARGET ?auto_64233 ?auto_64229 ) ( POINTING ?auto_64231 ?auto_64232 ) ( not ( = ?auto_64229 ?auto_64232 ) ) ( not ( = ?auto_64224 ?auto_64232 ) ) ( not ( = ?auto_64227 ?auto_64232 ) ) ( ON_BOARD ?auto_64230 ?auto_64231 ) ( POWER_ON ?auto_64230 ) ( not ( = ?auto_64233 ?auto_64230 ) ) ( HAVE_IMAGE ?auto_64222 ?auto_64223 ) ( HAVE_IMAGE ?auto_64225 ?auto_64226 ) ( HAVE_IMAGE ?auto_64227 ?auto_64228 ) ( not ( = ?auto_64222 ?auto_64224 ) ) ( not ( = ?auto_64222 ?auto_64225 ) ) ( not ( = ?auto_64222 ?auto_64227 ) ) ( not ( = ?auto_64222 ?auto_64229 ) ) ( not ( = ?auto_64222 ?auto_64232 ) ) ( not ( = ?auto_64223 ?auto_64221 ) ) ( not ( = ?auto_64223 ?auto_64226 ) ) ( not ( = ?auto_64223 ?auto_64228 ) ) ( not ( = ?auto_64224 ?auto_64225 ) ) ( not ( = ?auto_64221 ?auto_64228 ) ) ( not ( = ?auto_64225 ?auto_64227 ) ) ( not ( = ?auto_64225 ?auto_64229 ) ) ( not ( = ?auto_64225 ?auto_64232 ) ) ( not ( = ?auto_64226 ?auto_64228 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64227 ?auto_64226 ?auto_64224 ?auto_64221 )
      ( GET-4IMAGE-VERIFY ?auto_64222 ?auto_64223 ?auto_64224 ?auto_64221 ?auto_64225 ?auto_64226 ?auto_64227 ?auto_64228 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64235 - DIRECTION
      ?auto_64236 - MODE
      ?auto_64237 - DIRECTION
      ?auto_64234 - MODE
      ?auto_64238 - DIRECTION
      ?auto_64239 - MODE
      ?auto_64240 - DIRECTION
      ?auto_64241 - MODE
    )
    :vars
    (
      ?auto_64246 - INSTRUMENT
      ?auto_64244 - SATELLITE
      ?auto_64242 - DIRECTION
      ?auto_64245 - DIRECTION
      ?auto_64243 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64246 ?auto_64244 ) ( SUPPORTS ?auto_64246 ?auto_64234 ) ( not ( = ?auto_64237 ?auto_64242 ) ) ( HAVE_IMAGE ?auto_64238 ?auto_64239 ) ( not ( = ?auto_64238 ?auto_64237 ) ) ( not ( = ?auto_64238 ?auto_64242 ) ) ( not ( = ?auto_64239 ?auto_64234 ) ) ( CALIBRATION_TARGET ?auto_64246 ?auto_64242 ) ( POINTING ?auto_64244 ?auto_64245 ) ( not ( = ?auto_64242 ?auto_64245 ) ) ( not ( = ?auto_64237 ?auto_64245 ) ) ( not ( = ?auto_64238 ?auto_64245 ) ) ( ON_BOARD ?auto_64243 ?auto_64244 ) ( POWER_ON ?auto_64243 ) ( not ( = ?auto_64246 ?auto_64243 ) ) ( HAVE_IMAGE ?auto_64235 ?auto_64236 ) ( HAVE_IMAGE ?auto_64240 ?auto_64241 ) ( not ( = ?auto_64235 ?auto_64237 ) ) ( not ( = ?auto_64235 ?auto_64238 ) ) ( not ( = ?auto_64235 ?auto_64240 ) ) ( not ( = ?auto_64235 ?auto_64242 ) ) ( not ( = ?auto_64235 ?auto_64245 ) ) ( not ( = ?auto_64236 ?auto_64234 ) ) ( not ( = ?auto_64236 ?auto_64239 ) ) ( not ( = ?auto_64236 ?auto_64241 ) ) ( not ( = ?auto_64237 ?auto_64240 ) ) ( not ( = ?auto_64234 ?auto_64241 ) ) ( not ( = ?auto_64238 ?auto_64240 ) ) ( not ( = ?auto_64239 ?auto_64241 ) ) ( not ( = ?auto_64240 ?auto_64242 ) ) ( not ( = ?auto_64240 ?auto_64245 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64238 ?auto_64239 ?auto_64237 ?auto_64234 )
      ( GET-4IMAGE-VERIFY ?auto_64235 ?auto_64236 ?auto_64237 ?auto_64234 ?auto_64238 ?auto_64239 ?auto_64240 ?auto_64241 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64282 - DIRECTION
      ?auto_64283 - MODE
      ?auto_64284 - DIRECTION
      ?auto_64281 - MODE
      ?auto_64285 - DIRECTION
      ?auto_64286 - MODE
      ?auto_64287 - DIRECTION
      ?auto_64288 - MODE
    )
    :vars
    (
      ?auto_64294 - INSTRUMENT
      ?auto_64291 - SATELLITE
      ?auto_64289 - DIRECTION
      ?auto_64292 - DIRECTION
      ?auto_64295 - MODE
      ?auto_64293 - DIRECTION
      ?auto_64290 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64294 ?auto_64291 ) ( SUPPORTS ?auto_64294 ?auto_64281 ) ( not ( = ?auto_64284 ?auto_64289 ) ) ( HAVE_IMAGE ?auto_64292 ?auto_64295 ) ( not ( = ?auto_64292 ?auto_64284 ) ) ( not ( = ?auto_64292 ?auto_64289 ) ) ( not ( = ?auto_64295 ?auto_64281 ) ) ( CALIBRATION_TARGET ?auto_64294 ?auto_64289 ) ( POINTING ?auto_64291 ?auto_64293 ) ( not ( = ?auto_64289 ?auto_64293 ) ) ( not ( = ?auto_64284 ?auto_64293 ) ) ( not ( = ?auto_64292 ?auto_64293 ) ) ( ON_BOARD ?auto_64290 ?auto_64291 ) ( POWER_ON ?auto_64290 ) ( not ( = ?auto_64294 ?auto_64290 ) ) ( HAVE_IMAGE ?auto_64282 ?auto_64283 ) ( HAVE_IMAGE ?auto_64285 ?auto_64286 ) ( HAVE_IMAGE ?auto_64287 ?auto_64288 ) ( not ( = ?auto_64282 ?auto_64284 ) ) ( not ( = ?auto_64282 ?auto_64285 ) ) ( not ( = ?auto_64282 ?auto_64287 ) ) ( not ( = ?auto_64282 ?auto_64289 ) ) ( not ( = ?auto_64282 ?auto_64292 ) ) ( not ( = ?auto_64282 ?auto_64293 ) ) ( not ( = ?auto_64283 ?auto_64281 ) ) ( not ( = ?auto_64283 ?auto_64286 ) ) ( not ( = ?auto_64283 ?auto_64288 ) ) ( not ( = ?auto_64283 ?auto_64295 ) ) ( not ( = ?auto_64284 ?auto_64285 ) ) ( not ( = ?auto_64284 ?auto_64287 ) ) ( not ( = ?auto_64281 ?auto_64286 ) ) ( not ( = ?auto_64281 ?auto_64288 ) ) ( not ( = ?auto_64285 ?auto_64287 ) ) ( not ( = ?auto_64285 ?auto_64289 ) ) ( not ( = ?auto_64285 ?auto_64292 ) ) ( not ( = ?auto_64285 ?auto_64293 ) ) ( not ( = ?auto_64286 ?auto_64288 ) ) ( not ( = ?auto_64286 ?auto_64295 ) ) ( not ( = ?auto_64287 ?auto_64289 ) ) ( not ( = ?auto_64287 ?auto_64292 ) ) ( not ( = ?auto_64287 ?auto_64293 ) ) ( not ( = ?auto_64288 ?auto_64295 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64292 ?auto_64295 ?auto_64284 ?auto_64281 )
      ( GET-4IMAGE-VERIFY ?auto_64282 ?auto_64283 ?auto_64284 ?auto_64281 ?auto_64285 ?auto_64286 ?auto_64287 ?auto_64288 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64297 - DIRECTION
      ?auto_64298 - MODE
      ?auto_64299 - DIRECTION
      ?auto_64296 - MODE
      ?auto_64300 - DIRECTION
      ?auto_64301 - MODE
      ?auto_64302 - DIRECTION
      ?auto_64303 - MODE
    )
    :vars
    (
      ?auto_64308 - INSTRUMENT
      ?auto_64306 - SATELLITE
      ?auto_64304 - DIRECTION
      ?auto_64307 - DIRECTION
      ?auto_64309 - MODE
      ?auto_64305 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64308 ?auto_64306 ) ( SUPPORTS ?auto_64308 ?auto_64296 ) ( not ( = ?auto_64299 ?auto_64304 ) ) ( HAVE_IMAGE ?auto_64307 ?auto_64309 ) ( not ( = ?auto_64307 ?auto_64299 ) ) ( not ( = ?auto_64307 ?auto_64304 ) ) ( not ( = ?auto_64309 ?auto_64296 ) ) ( CALIBRATION_TARGET ?auto_64308 ?auto_64304 ) ( POINTING ?auto_64306 ?auto_64302 ) ( not ( = ?auto_64304 ?auto_64302 ) ) ( not ( = ?auto_64299 ?auto_64302 ) ) ( not ( = ?auto_64307 ?auto_64302 ) ) ( ON_BOARD ?auto_64305 ?auto_64306 ) ( POWER_ON ?auto_64305 ) ( not ( = ?auto_64308 ?auto_64305 ) ) ( HAVE_IMAGE ?auto_64297 ?auto_64298 ) ( HAVE_IMAGE ?auto_64300 ?auto_64301 ) ( HAVE_IMAGE ?auto_64302 ?auto_64303 ) ( not ( = ?auto_64297 ?auto_64299 ) ) ( not ( = ?auto_64297 ?auto_64300 ) ) ( not ( = ?auto_64297 ?auto_64302 ) ) ( not ( = ?auto_64297 ?auto_64304 ) ) ( not ( = ?auto_64297 ?auto_64307 ) ) ( not ( = ?auto_64298 ?auto_64296 ) ) ( not ( = ?auto_64298 ?auto_64301 ) ) ( not ( = ?auto_64298 ?auto_64303 ) ) ( not ( = ?auto_64298 ?auto_64309 ) ) ( not ( = ?auto_64299 ?auto_64300 ) ) ( not ( = ?auto_64296 ?auto_64301 ) ) ( not ( = ?auto_64296 ?auto_64303 ) ) ( not ( = ?auto_64300 ?auto_64302 ) ) ( not ( = ?auto_64300 ?auto_64304 ) ) ( not ( = ?auto_64300 ?auto_64307 ) ) ( not ( = ?auto_64301 ?auto_64303 ) ) ( not ( = ?auto_64301 ?auto_64309 ) ) ( not ( = ?auto_64303 ?auto_64309 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64307 ?auto_64309 ?auto_64299 ?auto_64296 )
      ( GET-4IMAGE-VERIFY ?auto_64297 ?auto_64298 ?auto_64299 ?auto_64296 ?auto_64300 ?auto_64301 ?auto_64302 ?auto_64303 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64521 - DIRECTION
      ?auto_64522 - MODE
      ?auto_64523 - DIRECTION
      ?auto_64520 - MODE
      ?auto_64524 - DIRECTION
      ?auto_64525 - MODE
      ?auto_64526 - DIRECTION
      ?auto_64527 - MODE
    )
    :vars
    (
      ?auto_64532 - INSTRUMENT
      ?auto_64530 - SATELLITE
      ?auto_64528 - DIRECTION
      ?auto_64531 - DIRECTION
      ?auto_64533 - MODE
      ?auto_64529 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64532 ?auto_64530 ) ( SUPPORTS ?auto_64532 ?auto_64527 ) ( not ( = ?auto_64526 ?auto_64528 ) ) ( HAVE_IMAGE ?auto_64531 ?auto_64533 ) ( not ( = ?auto_64531 ?auto_64526 ) ) ( not ( = ?auto_64531 ?auto_64528 ) ) ( not ( = ?auto_64533 ?auto_64527 ) ) ( CALIBRATION_TARGET ?auto_64532 ?auto_64528 ) ( POINTING ?auto_64530 ?auto_64521 ) ( not ( = ?auto_64528 ?auto_64521 ) ) ( not ( = ?auto_64526 ?auto_64521 ) ) ( not ( = ?auto_64531 ?auto_64521 ) ) ( ON_BOARD ?auto_64529 ?auto_64530 ) ( POWER_ON ?auto_64529 ) ( not ( = ?auto_64532 ?auto_64529 ) ) ( HAVE_IMAGE ?auto_64521 ?auto_64522 ) ( HAVE_IMAGE ?auto_64523 ?auto_64520 ) ( HAVE_IMAGE ?auto_64524 ?auto_64525 ) ( not ( = ?auto_64521 ?auto_64523 ) ) ( not ( = ?auto_64521 ?auto_64524 ) ) ( not ( = ?auto_64522 ?auto_64520 ) ) ( not ( = ?auto_64522 ?auto_64525 ) ) ( not ( = ?auto_64522 ?auto_64527 ) ) ( not ( = ?auto_64522 ?auto_64533 ) ) ( not ( = ?auto_64523 ?auto_64524 ) ) ( not ( = ?auto_64523 ?auto_64526 ) ) ( not ( = ?auto_64523 ?auto_64528 ) ) ( not ( = ?auto_64523 ?auto_64531 ) ) ( not ( = ?auto_64520 ?auto_64525 ) ) ( not ( = ?auto_64520 ?auto_64527 ) ) ( not ( = ?auto_64520 ?auto_64533 ) ) ( not ( = ?auto_64524 ?auto_64526 ) ) ( not ( = ?auto_64524 ?auto_64528 ) ) ( not ( = ?auto_64524 ?auto_64531 ) ) ( not ( = ?auto_64525 ?auto_64527 ) ) ( not ( = ?auto_64525 ?auto_64533 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64531 ?auto_64533 ?auto_64526 ?auto_64527 )
      ( GET-4IMAGE-VERIFY ?auto_64521 ?auto_64522 ?auto_64523 ?auto_64520 ?auto_64524 ?auto_64525 ?auto_64526 ?auto_64527 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64557 - DIRECTION
      ?auto_64558 - MODE
      ?auto_64559 - DIRECTION
      ?auto_64556 - MODE
      ?auto_64560 - DIRECTION
      ?auto_64561 - MODE
      ?auto_64562 - DIRECTION
      ?auto_64563 - MODE
    )
    :vars
    (
      ?auto_64568 - INSTRUMENT
      ?auto_64566 - SATELLITE
      ?auto_64564 - DIRECTION
      ?auto_64567 - DIRECTION
      ?auto_64569 - MODE
      ?auto_64565 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64568 ?auto_64566 ) ( SUPPORTS ?auto_64568 ?auto_64561 ) ( not ( = ?auto_64560 ?auto_64564 ) ) ( HAVE_IMAGE ?auto_64567 ?auto_64569 ) ( not ( = ?auto_64567 ?auto_64560 ) ) ( not ( = ?auto_64567 ?auto_64564 ) ) ( not ( = ?auto_64569 ?auto_64561 ) ) ( CALIBRATION_TARGET ?auto_64568 ?auto_64564 ) ( POINTING ?auto_64566 ?auto_64557 ) ( not ( = ?auto_64564 ?auto_64557 ) ) ( not ( = ?auto_64560 ?auto_64557 ) ) ( not ( = ?auto_64567 ?auto_64557 ) ) ( ON_BOARD ?auto_64565 ?auto_64566 ) ( POWER_ON ?auto_64565 ) ( not ( = ?auto_64568 ?auto_64565 ) ) ( HAVE_IMAGE ?auto_64557 ?auto_64558 ) ( HAVE_IMAGE ?auto_64559 ?auto_64556 ) ( HAVE_IMAGE ?auto_64562 ?auto_64563 ) ( not ( = ?auto_64557 ?auto_64559 ) ) ( not ( = ?auto_64557 ?auto_64562 ) ) ( not ( = ?auto_64558 ?auto_64556 ) ) ( not ( = ?auto_64558 ?auto_64561 ) ) ( not ( = ?auto_64558 ?auto_64563 ) ) ( not ( = ?auto_64558 ?auto_64569 ) ) ( not ( = ?auto_64559 ?auto_64560 ) ) ( not ( = ?auto_64559 ?auto_64562 ) ) ( not ( = ?auto_64559 ?auto_64564 ) ) ( not ( = ?auto_64559 ?auto_64567 ) ) ( not ( = ?auto_64556 ?auto_64561 ) ) ( not ( = ?auto_64556 ?auto_64563 ) ) ( not ( = ?auto_64556 ?auto_64569 ) ) ( not ( = ?auto_64560 ?auto_64562 ) ) ( not ( = ?auto_64561 ?auto_64563 ) ) ( not ( = ?auto_64562 ?auto_64564 ) ) ( not ( = ?auto_64562 ?auto_64567 ) ) ( not ( = ?auto_64563 ?auto_64569 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64567 ?auto_64569 ?auto_64560 ?auto_64561 )
      ( GET-4IMAGE-VERIFY ?auto_64557 ?auto_64558 ?auto_64559 ?auto_64556 ?auto_64560 ?auto_64561 ?auto_64562 ?auto_64563 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64639 - DIRECTION
      ?auto_64640 - MODE
      ?auto_64641 - DIRECTION
      ?auto_64638 - MODE
      ?auto_64642 - DIRECTION
      ?auto_64643 - MODE
      ?auto_64644 - DIRECTION
      ?auto_64645 - MODE
    )
    :vars
    (
      ?auto_64649 - INSTRUMENT
      ?auto_64648 - SATELLITE
      ?auto_64646 - DIRECTION
      ?auto_64647 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64649 ?auto_64648 ) ( SUPPORTS ?auto_64649 ?auto_64643 ) ( not ( = ?auto_64642 ?auto_64646 ) ) ( HAVE_IMAGE ?auto_64644 ?auto_64645 ) ( not ( = ?auto_64644 ?auto_64642 ) ) ( not ( = ?auto_64644 ?auto_64646 ) ) ( not ( = ?auto_64645 ?auto_64643 ) ) ( CALIBRATION_TARGET ?auto_64649 ?auto_64646 ) ( POINTING ?auto_64648 ?auto_64641 ) ( not ( = ?auto_64646 ?auto_64641 ) ) ( not ( = ?auto_64642 ?auto_64641 ) ) ( not ( = ?auto_64644 ?auto_64641 ) ) ( ON_BOARD ?auto_64647 ?auto_64648 ) ( POWER_ON ?auto_64647 ) ( not ( = ?auto_64649 ?auto_64647 ) ) ( HAVE_IMAGE ?auto_64639 ?auto_64640 ) ( HAVE_IMAGE ?auto_64641 ?auto_64638 ) ( not ( = ?auto_64639 ?auto_64641 ) ) ( not ( = ?auto_64639 ?auto_64642 ) ) ( not ( = ?auto_64639 ?auto_64644 ) ) ( not ( = ?auto_64639 ?auto_64646 ) ) ( not ( = ?auto_64640 ?auto_64638 ) ) ( not ( = ?auto_64640 ?auto_64643 ) ) ( not ( = ?auto_64640 ?auto_64645 ) ) ( not ( = ?auto_64638 ?auto_64643 ) ) ( not ( = ?auto_64638 ?auto_64645 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64644 ?auto_64645 ?auto_64642 ?auto_64643 )
      ( GET-4IMAGE-VERIFY ?auto_64639 ?auto_64640 ?auto_64641 ?auto_64638 ?auto_64642 ?auto_64643 ?auto_64644 ?auto_64645 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64745 - DIRECTION
      ?auto_64746 - MODE
      ?auto_64747 - DIRECTION
      ?auto_64744 - MODE
      ?auto_64748 - DIRECTION
      ?auto_64749 - MODE
      ?auto_64750 - DIRECTION
      ?auto_64751 - MODE
    )
    :vars
    (
      ?auto_64756 - INSTRUMENT
      ?auto_64754 - SATELLITE
      ?auto_64752 - DIRECTION
      ?auto_64755 - DIRECTION
      ?auto_64757 - MODE
      ?auto_64753 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64756 ?auto_64754 ) ( SUPPORTS ?auto_64756 ?auto_64744 ) ( not ( = ?auto_64747 ?auto_64752 ) ) ( HAVE_IMAGE ?auto_64755 ?auto_64757 ) ( not ( = ?auto_64755 ?auto_64747 ) ) ( not ( = ?auto_64755 ?auto_64752 ) ) ( not ( = ?auto_64757 ?auto_64744 ) ) ( CALIBRATION_TARGET ?auto_64756 ?auto_64752 ) ( POINTING ?auto_64754 ?auto_64745 ) ( not ( = ?auto_64752 ?auto_64745 ) ) ( not ( = ?auto_64747 ?auto_64745 ) ) ( not ( = ?auto_64755 ?auto_64745 ) ) ( ON_BOARD ?auto_64753 ?auto_64754 ) ( POWER_ON ?auto_64753 ) ( not ( = ?auto_64756 ?auto_64753 ) ) ( HAVE_IMAGE ?auto_64745 ?auto_64746 ) ( HAVE_IMAGE ?auto_64748 ?auto_64749 ) ( HAVE_IMAGE ?auto_64750 ?auto_64751 ) ( not ( = ?auto_64745 ?auto_64748 ) ) ( not ( = ?auto_64745 ?auto_64750 ) ) ( not ( = ?auto_64746 ?auto_64744 ) ) ( not ( = ?auto_64746 ?auto_64749 ) ) ( not ( = ?auto_64746 ?auto_64751 ) ) ( not ( = ?auto_64746 ?auto_64757 ) ) ( not ( = ?auto_64747 ?auto_64748 ) ) ( not ( = ?auto_64747 ?auto_64750 ) ) ( not ( = ?auto_64744 ?auto_64749 ) ) ( not ( = ?auto_64744 ?auto_64751 ) ) ( not ( = ?auto_64748 ?auto_64750 ) ) ( not ( = ?auto_64748 ?auto_64752 ) ) ( not ( = ?auto_64748 ?auto_64755 ) ) ( not ( = ?auto_64749 ?auto_64751 ) ) ( not ( = ?auto_64749 ?auto_64757 ) ) ( not ( = ?auto_64750 ?auto_64752 ) ) ( not ( = ?auto_64750 ?auto_64755 ) ) ( not ( = ?auto_64751 ?auto_64757 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64755 ?auto_64757 ?auto_64747 ?auto_64744 )
      ( GET-4IMAGE-VERIFY ?auto_64745 ?auto_64746 ?auto_64747 ?auto_64744 ?auto_64748 ?auto_64749 ?auto_64750 ?auto_64751 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64895 - DIRECTION
      ?auto_64896 - MODE
      ?auto_64897 - DIRECTION
      ?auto_64894 - MODE
      ?auto_64898 - DIRECTION
      ?auto_64899 - MODE
      ?auto_64900 - DIRECTION
      ?auto_64901 - MODE
    )
    :vars
    (
      ?auto_64906 - INSTRUMENT
      ?auto_64904 - SATELLITE
      ?auto_64902 - DIRECTION
      ?auto_64905 - DIRECTION
      ?auto_64903 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64906 ?auto_64904 ) ( SUPPORTS ?auto_64906 ?auto_64896 ) ( not ( = ?auto_64895 ?auto_64902 ) ) ( HAVE_IMAGE ?auto_64900 ?auto_64899 ) ( not ( = ?auto_64900 ?auto_64895 ) ) ( not ( = ?auto_64900 ?auto_64902 ) ) ( not ( = ?auto_64899 ?auto_64896 ) ) ( CALIBRATION_TARGET ?auto_64906 ?auto_64902 ) ( POINTING ?auto_64904 ?auto_64905 ) ( not ( = ?auto_64902 ?auto_64905 ) ) ( not ( = ?auto_64895 ?auto_64905 ) ) ( not ( = ?auto_64900 ?auto_64905 ) ) ( ON_BOARD ?auto_64903 ?auto_64904 ) ( POWER_ON ?auto_64903 ) ( not ( = ?auto_64906 ?auto_64903 ) ) ( HAVE_IMAGE ?auto_64897 ?auto_64894 ) ( HAVE_IMAGE ?auto_64898 ?auto_64899 ) ( HAVE_IMAGE ?auto_64900 ?auto_64901 ) ( not ( = ?auto_64895 ?auto_64897 ) ) ( not ( = ?auto_64895 ?auto_64898 ) ) ( not ( = ?auto_64896 ?auto_64894 ) ) ( not ( = ?auto_64896 ?auto_64901 ) ) ( not ( = ?auto_64897 ?auto_64898 ) ) ( not ( = ?auto_64897 ?auto_64900 ) ) ( not ( = ?auto_64897 ?auto_64902 ) ) ( not ( = ?auto_64897 ?auto_64905 ) ) ( not ( = ?auto_64894 ?auto_64899 ) ) ( not ( = ?auto_64894 ?auto_64901 ) ) ( not ( = ?auto_64898 ?auto_64900 ) ) ( not ( = ?auto_64898 ?auto_64902 ) ) ( not ( = ?auto_64898 ?auto_64905 ) ) ( not ( = ?auto_64899 ?auto_64901 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64900 ?auto_64899 ?auto_64895 ?auto_64896 )
      ( GET-4IMAGE-VERIFY ?auto_64895 ?auto_64896 ?auto_64897 ?auto_64894 ?auto_64898 ?auto_64899 ?auto_64900 ?auto_64901 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64921 - DIRECTION
      ?auto_64922 - MODE
      ?auto_64923 - DIRECTION
      ?auto_64920 - MODE
      ?auto_64924 - DIRECTION
      ?auto_64925 - MODE
      ?auto_64926 - DIRECTION
      ?auto_64927 - MODE
    )
    :vars
    (
      ?auto_64931 - INSTRUMENT
      ?auto_64930 - SATELLITE
      ?auto_64928 - DIRECTION
      ?auto_64929 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64931 ?auto_64930 ) ( SUPPORTS ?auto_64931 ?auto_64922 ) ( not ( = ?auto_64921 ?auto_64928 ) ) ( HAVE_IMAGE ?auto_64923 ?auto_64920 ) ( not ( = ?auto_64923 ?auto_64921 ) ) ( not ( = ?auto_64923 ?auto_64928 ) ) ( not ( = ?auto_64920 ?auto_64922 ) ) ( CALIBRATION_TARGET ?auto_64931 ?auto_64928 ) ( POINTING ?auto_64930 ?auto_64926 ) ( not ( = ?auto_64928 ?auto_64926 ) ) ( not ( = ?auto_64921 ?auto_64926 ) ) ( not ( = ?auto_64923 ?auto_64926 ) ) ( ON_BOARD ?auto_64929 ?auto_64930 ) ( POWER_ON ?auto_64929 ) ( not ( = ?auto_64931 ?auto_64929 ) ) ( HAVE_IMAGE ?auto_64924 ?auto_64925 ) ( HAVE_IMAGE ?auto_64926 ?auto_64927 ) ( not ( = ?auto_64921 ?auto_64924 ) ) ( not ( = ?auto_64922 ?auto_64925 ) ) ( not ( = ?auto_64922 ?auto_64927 ) ) ( not ( = ?auto_64923 ?auto_64924 ) ) ( not ( = ?auto_64920 ?auto_64925 ) ) ( not ( = ?auto_64920 ?auto_64927 ) ) ( not ( = ?auto_64924 ?auto_64926 ) ) ( not ( = ?auto_64924 ?auto_64928 ) ) ( not ( = ?auto_64925 ?auto_64927 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64923 ?auto_64920 ?auto_64921 ?auto_64922 )
      ( GET-4IMAGE-VERIFY ?auto_64921 ?auto_64922 ?auto_64923 ?auto_64920 ?auto_64924 ?auto_64925 ?auto_64926 ?auto_64927 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64946 - DIRECTION
      ?auto_64947 - MODE
      ?auto_64948 - DIRECTION
      ?auto_64945 - MODE
      ?auto_64949 - DIRECTION
      ?auto_64950 - MODE
      ?auto_64951 - DIRECTION
      ?auto_64952 - MODE
    )
    :vars
    (
      ?auto_64957 - INSTRUMENT
      ?auto_64955 - SATELLITE
      ?auto_64953 - DIRECTION
      ?auto_64956 - DIRECTION
      ?auto_64954 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64957 ?auto_64955 ) ( SUPPORTS ?auto_64957 ?auto_64947 ) ( not ( = ?auto_64946 ?auto_64953 ) ) ( HAVE_IMAGE ?auto_64948 ?auto_64952 ) ( not ( = ?auto_64948 ?auto_64946 ) ) ( not ( = ?auto_64948 ?auto_64953 ) ) ( not ( = ?auto_64952 ?auto_64947 ) ) ( CALIBRATION_TARGET ?auto_64957 ?auto_64953 ) ( POINTING ?auto_64955 ?auto_64956 ) ( not ( = ?auto_64953 ?auto_64956 ) ) ( not ( = ?auto_64946 ?auto_64956 ) ) ( not ( = ?auto_64948 ?auto_64956 ) ) ( ON_BOARD ?auto_64954 ?auto_64955 ) ( POWER_ON ?auto_64954 ) ( not ( = ?auto_64957 ?auto_64954 ) ) ( HAVE_IMAGE ?auto_64948 ?auto_64945 ) ( HAVE_IMAGE ?auto_64949 ?auto_64950 ) ( HAVE_IMAGE ?auto_64951 ?auto_64952 ) ( not ( = ?auto_64946 ?auto_64949 ) ) ( not ( = ?auto_64946 ?auto_64951 ) ) ( not ( = ?auto_64947 ?auto_64945 ) ) ( not ( = ?auto_64947 ?auto_64950 ) ) ( not ( = ?auto_64948 ?auto_64949 ) ) ( not ( = ?auto_64948 ?auto_64951 ) ) ( not ( = ?auto_64945 ?auto_64950 ) ) ( not ( = ?auto_64945 ?auto_64952 ) ) ( not ( = ?auto_64949 ?auto_64951 ) ) ( not ( = ?auto_64949 ?auto_64953 ) ) ( not ( = ?auto_64949 ?auto_64956 ) ) ( not ( = ?auto_64950 ?auto_64952 ) ) ( not ( = ?auto_64951 ?auto_64953 ) ) ( not ( = ?auto_64951 ?auto_64956 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64948 ?auto_64952 ?auto_64946 ?auto_64947 )
      ( GET-4IMAGE-VERIFY ?auto_64946 ?auto_64947 ?auto_64948 ?auto_64945 ?auto_64949 ?auto_64950 ?auto_64951 ?auto_64952 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64959 - DIRECTION
      ?auto_64960 - MODE
      ?auto_64961 - DIRECTION
      ?auto_64958 - MODE
      ?auto_64962 - DIRECTION
      ?auto_64963 - MODE
      ?auto_64964 - DIRECTION
      ?auto_64965 - MODE
    )
    :vars
    (
      ?auto_64970 - INSTRUMENT
      ?auto_64968 - SATELLITE
      ?auto_64966 - DIRECTION
      ?auto_64969 - DIRECTION
      ?auto_64967 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_64970 ?auto_64968 ) ( SUPPORTS ?auto_64970 ?auto_64960 ) ( not ( = ?auto_64959 ?auto_64966 ) ) ( HAVE_IMAGE ?auto_64961 ?auto_64958 ) ( not ( = ?auto_64961 ?auto_64959 ) ) ( not ( = ?auto_64961 ?auto_64966 ) ) ( not ( = ?auto_64958 ?auto_64960 ) ) ( CALIBRATION_TARGET ?auto_64970 ?auto_64966 ) ( POINTING ?auto_64968 ?auto_64969 ) ( not ( = ?auto_64966 ?auto_64969 ) ) ( not ( = ?auto_64959 ?auto_64969 ) ) ( not ( = ?auto_64961 ?auto_64969 ) ) ( ON_BOARD ?auto_64967 ?auto_64968 ) ( POWER_ON ?auto_64967 ) ( not ( = ?auto_64970 ?auto_64967 ) ) ( HAVE_IMAGE ?auto_64962 ?auto_64963 ) ( HAVE_IMAGE ?auto_64964 ?auto_64965 ) ( not ( = ?auto_64959 ?auto_64962 ) ) ( not ( = ?auto_64959 ?auto_64964 ) ) ( not ( = ?auto_64960 ?auto_64963 ) ) ( not ( = ?auto_64960 ?auto_64965 ) ) ( not ( = ?auto_64961 ?auto_64962 ) ) ( not ( = ?auto_64961 ?auto_64964 ) ) ( not ( = ?auto_64958 ?auto_64963 ) ) ( not ( = ?auto_64958 ?auto_64965 ) ) ( not ( = ?auto_64962 ?auto_64964 ) ) ( not ( = ?auto_64962 ?auto_64966 ) ) ( not ( = ?auto_64962 ?auto_64969 ) ) ( not ( = ?auto_64963 ?auto_64965 ) ) ( not ( = ?auto_64964 ?auto_64966 ) ) ( not ( = ?auto_64964 ?auto_64969 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64961 ?auto_64958 ?auto_64959 ?auto_64960 )
      ( GET-4IMAGE-VERIFY ?auto_64959 ?auto_64960 ?auto_64961 ?auto_64958 ?auto_64962 ?auto_64963 ?auto_64964 ?auto_64965 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_65101 - DIRECTION
      ?auto_65102 - MODE
      ?auto_65103 - DIRECTION
      ?auto_65100 - MODE
      ?auto_65104 - DIRECTION
      ?auto_65105 - MODE
      ?auto_65106 - DIRECTION
      ?auto_65107 - MODE
    )
    :vars
    (
      ?auto_65112 - INSTRUMENT
      ?auto_65110 - SATELLITE
      ?auto_65108 - DIRECTION
      ?auto_65111 - DIRECTION
      ?auto_65109 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_65112 ?auto_65110 ) ( SUPPORTS ?auto_65112 ?auto_65102 ) ( not ( = ?auto_65101 ?auto_65108 ) ) ( HAVE_IMAGE ?auto_65104 ?auto_65105 ) ( not ( = ?auto_65104 ?auto_65101 ) ) ( not ( = ?auto_65104 ?auto_65108 ) ) ( not ( = ?auto_65105 ?auto_65102 ) ) ( CALIBRATION_TARGET ?auto_65112 ?auto_65108 ) ( POINTING ?auto_65110 ?auto_65111 ) ( not ( = ?auto_65108 ?auto_65111 ) ) ( not ( = ?auto_65101 ?auto_65111 ) ) ( not ( = ?auto_65104 ?auto_65111 ) ) ( ON_BOARD ?auto_65109 ?auto_65110 ) ( POWER_ON ?auto_65109 ) ( not ( = ?auto_65112 ?auto_65109 ) ) ( HAVE_IMAGE ?auto_65103 ?auto_65100 ) ( HAVE_IMAGE ?auto_65106 ?auto_65107 ) ( not ( = ?auto_65101 ?auto_65103 ) ) ( not ( = ?auto_65101 ?auto_65106 ) ) ( not ( = ?auto_65102 ?auto_65100 ) ) ( not ( = ?auto_65102 ?auto_65107 ) ) ( not ( = ?auto_65103 ?auto_65104 ) ) ( not ( = ?auto_65103 ?auto_65106 ) ) ( not ( = ?auto_65103 ?auto_65108 ) ) ( not ( = ?auto_65103 ?auto_65111 ) ) ( not ( = ?auto_65100 ?auto_65105 ) ) ( not ( = ?auto_65100 ?auto_65107 ) ) ( not ( = ?auto_65104 ?auto_65106 ) ) ( not ( = ?auto_65105 ?auto_65107 ) ) ( not ( = ?auto_65106 ?auto_65108 ) ) ( not ( = ?auto_65106 ?auto_65111 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_65104 ?auto_65105 ?auto_65101 ?auto_65102 )
      ( GET-4IMAGE-VERIFY ?auto_65101 ?auto_65102 ?auto_65103 ?auto_65100 ?auto_65104 ?auto_65105 ?auto_65106 ?auto_65107 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_65135 - DIRECTION
      ?auto_65136 - MODE
      ?auto_65137 - DIRECTION
      ?auto_65134 - MODE
      ?auto_65138 - DIRECTION
      ?auto_65139 - MODE
      ?auto_65140 - DIRECTION
      ?auto_65141 - MODE
    )
    :vars
    (
      ?auto_65146 - INSTRUMENT
      ?auto_65144 - SATELLITE
      ?auto_65142 - DIRECTION
      ?auto_65145 - DIRECTION
      ?auto_65143 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_65146 ?auto_65144 ) ( SUPPORTS ?auto_65146 ?auto_65136 ) ( not ( = ?auto_65135 ?auto_65142 ) ) ( HAVE_IMAGE ?auto_65140 ?auto_65141 ) ( not ( = ?auto_65140 ?auto_65135 ) ) ( not ( = ?auto_65140 ?auto_65142 ) ) ( not ( = ?auto_65141 ?auto_65136 ) ) ( CALIBRATION_TARGET ?auto_65146 ?auto_65142 ) ( POINTING ?auto_65144 ?auto_65145 ) ( not ( = ?auto_65142 ?auto_65145 ) ) ( not ( = ?auto_65135 ?auto_65145 ) ) ( not ( = ?auto_65140 ?auto_65145 ) ) ( ON_BOARD ?auto_65143 ?auto_65144 ) ( POWER_ON ?auto_65143 ) ( not ( = ?auto_65146 ?auto_65143 ) ) ( HAVE_IMAGE ?auto_65137 ?auto_65134 ) ( HAVE_IMAGE ?auto_65138 ?auto_65139 ) ( not ( = ?auto_65135 ?auto_65137 ) ) ( not ( = ?auto_65135 ?auto_65138 ) ) ( not ( = ?auto_65136 ?auto_65134 ) ) ( not ( = ?auto_65136 ?auto_65139 ) ) ( not ( = ?auto_65137 ?auto_65138 ) ) ( not ( = ?auto_65137 ?auto_65140 ) ) ( not ( = ?auto_65137 ?auto_65142 ) ) ( not ( = ?auto_65137 ?auto_65145 ) ) ( not ( = ?auto_65134 ?auto_65139 ) ) ( not ( = ?auto_65134 ?auto_65141 ) ) ( not ( = ?auto_65138 ?auto_65140 ) ) ( not ( = ?auto_65138 ?auto_65142 ) ) ( not ( = ?auto_65138 ?auto_65145 ) ) ( not ( = ?auto_65139 ?auto_65141 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_65140 ?auto_65141 ?auto_65135 ?auto_65136 )
      ( GET-4IMAGE-VERIFY ?auto_65135 ?auto_65136 ?auto_65137 ?auto_65134 ?auto_65138 ?auto_65139 ?auto_65140 ?auto_65141 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_65148 - DIRECTION
      ?auto_65149 - MODE
      ?auto_65150 - DIRECTION
      ?auto_65147 - MODE
      ?auto_65151 - DIRECTION
      ?auto_65152 - MODE
      ?auto_65153 - DIRECTION
      ?auto_65154 - MODE
    )
    :vars
    (
      ?auto_65160 - INSTRUMENT
      ?auto_65157 - SATELLITE
      ?auto_65155 - DIRECTION
      ?auto_65158 - DIRECTION
      ?auto_65161 - MODE
      ?auto_65159 - DIRECTION
      ?auto_65156 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_65160 ?auto_65157 ) ( SUPPORTS ?auto_65160 ?auto_65149 ) ( not ( = ?auto_65148 ?auto_65155 ) ) ( HAVE_IMAGE ?auto_65158 ?auto_65161 ) ( not ( = ?auto_65158 ?auto_65148 ) ) ( not ( = ?auto_65158 ?auto_65155 ) ) ( not ( = ?auto_65161 ?auto_65149 ) ) ( CALIBRATION_TARGET ?auto_65160 ?auto_65155 ) ( POINTING ?auto_65157 ?auto_65159 ) ( not ( = ?auto_65155 ?auto_65159 ) ) ( not ( = ?auto_65148 ?auto_65159 ) ) ( not ( = ?auto_65158 ?auto_65159 ) ) ( ON_BOARD ?auto_65156 ?auto_65157 ) ( POWER_ON ?auto_65156 ) ( not ( = ?auto_65160 ?auto_65156 ) ) ( HAVE_IMAGE ?auto_65150 ?auto_65147 ) ( HAVE_IMAGE ?auto_65151 ?auto_65152 ) ( HAVE_IMAGE ?auto_65153 ?auto_65154 ) ( not ( = ?auto_65148 ?auto_65150 ) ) ( not ( = ?auto_65148 ?auto_65151 ) ) ( not ( = ?auto_65148 ?auto_65153 ) ) ( not ( = ?auto_65149 ?auto_65147 ) ) ( not ( = ?auto_65149 ?auto_65152 ) ) ( not ( = ?auto_65149 ?auto_65154 ) ) ( not ( = ?auto_65150 ?auto_65151 ) ) ( not ( = ?auto_65150 ?auto_65153 ) ) ( not ( = ?auto_65150 ?auto_65155 ) ) ( not ( = ?auto_65150 ?auto_65158 ) ) ( not ( = ?auto_65150 ?auto_65159 ) ) ( not ( = ?auto_65147 ?auto_65152 ) ) ( not ( = ?auto_65147 ?auto_65154 ) ) ( not ( = ?auto_65147 ?auto_65161 ) ) ( not ( = ?auto_65151 ?auto_65153 ) ) ( not ( = ?auto_65151 ?auto_65155 ) ) ( not ( = ?auto_65151 ?auto_65158 ) ) ( not ( = ?auto_65151 ?auto_65159 ) ) ( not ( = ?auto_65152 ?auto_65154 ) ) ( not ( = ?auto_65152 ?auto_65161 ) ) ( not ( = ?auto_65153 ?auto_65155 ) ) ( not ( = ?auto_65153 ?auto_65158 ) ) ( not ( = ?auto_65153 ?auto_65159 ) ) ( not ( = ?auto_65154 ?auto_65161 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_65158 ?auto_65161 ?auto_65148 ?auto_65149 )
      ( GET-4IMAGE-VERIFY ?auto_65148 ?auto_65149 ?auto_65150 ?auto_65147 ?auto_65151 ?auto_65152 ?auto_65153 ?auto_65154 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_65163 - DIRECTION
      ?auto_65164 - MODE
      ?auto_65165 - DIRECTION
      ?auto_65162 - MODE
      ?auto_65166 - DIRECTION
      ?auto_65167 - MODE
      ?auto_65168 - DIRECTION
      ?auto_65169 - MODE
    )
    :vars
    (
      ?auto_65174 - INSTRUMENT
      ?auto_65172 - SATELLITE
      ?auto_65170 - DIRECTION
      ?auto_65173 - DIRECTION
      ?auto_65175 - MODE
      ?auto_65171 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_65174 ?auto_65172 ) ( SUPPORTS ?auto_65174 ?auto_65164 ) ( not ( = ?auto_65163 ?auto_65170 ) ) ( HAVE_IMAGE ?auto_65173 ?auto_65175 ) ( not ( = ?auto_65173 ?auto_65163 ) ) ( not ( = ?auto_65173 ?auto_65170 ) ) ( not ( = ?auto_65175 ?auto_65164 ) ) ( CALIBRATION_TARGET ?auto_65174 ?auto_65170 ) ( POINTING ?auto_65172 ?auto_65168 ) ( not ( = ?auto_65170 ?auto_65168 ) ) ( not ( = ?auto_65163 ?auto_65168 ) ) ( not ( = ?auto_65173 ?auto_65168 ) ) ( ON_BOARD ?auto_65171 ?auto_65172 ) ( POWER_ON ?auto_65171 ) ( not ( = ?auto_65174 ?auto_65171 ) ) ( HAVE_IMAGE ?auto_65165 ?auto_65162 ) ( HAVE_IMAGE ?auto_65166 ?auto_65167 ) ( HAVE_IMAGE ?auto_65168 ?auto_65169 ) ( not ( = ?auto_65163 ?auto_65165 ) ) ( not ( = ?auto_65163 ?auto_65166 ) ) ( not ( = ?auto_65164 ?auto_65162 ) ) ( not ( = ?auto_65164 ?auto_65167 ) ) ( not ( = ?auto_65164 ?auto_65169 ) ) ( not ( = ?auto_65165 ?auto_65166 ) ) ( not ( = ?auto_65165 ?auto_65168 ) ) ( not ( = ?auto_65165 ?auto_65170 ) ) ( not ( = ?auto_65165 ?auto_65173 ) ) ( not ( = ?auto_65162 ?auto_65167 ) ) ( not ( = ?auto_65162 ?auto_65169 ) ) ( not ( = ?auto_65162 ?auto_65175 ) ) ( not ( = ?auto_65166 ?auto_65168 ) ) ( not ( = ?auto_65166 ?auto_65170 ) ) ( not ( = ?auto_65166 ?auto_65173 ) ) ( not ( = ?auto_65167 ?auto_65169 ) ) ( not ( = ?auto_65167 ?auto_65175 ) ) ( not ( = ?auto_65169 ?auto_65175 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_65173 ?auto_65175 ?auto_65163 ?auto_65164 )
      ( GET-4IMAGE-VERIFY ?auto_65163 ?auto_65164 ?auto_65165 ?auto_65162 ?auto_65166 ?auto_65167 ?auto_65168 ?auto_65169 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_65355 - DIRECTION
      ?auto_65356 - MODE
      ?auto_65357 - DIRECTION
      ?auto_65354 - MODE
      ?auto_65358 - DIRECTION
      ?auto_65359 - MODE
      ?auto_65360 - DIRECTION
      ?auto_65361 - MODE
    )
    :vars
    (
      ?auto_65366 - INSTRUMENT
      ?auto_65364 - SATELLITE
      ?auto_65362 - DIRECTION
      ?auto_65365 - DIRECTION
      ?auto_65367 - MODE
      ?auto_65363 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_65366 ?auto_65364 ) ( SUPPORTS ?auto_65366 ?auto_65356 ) ( not ( = ?auto_65355 ?auto_65362 ) ) ( HAVE_IMAGE ?auto_65365 ?auto_65367 ) ( not ( = ?auto_65365 ?auto_65355 ) ) ( not ( = ?auto_65365 ?auto_65362 ) ) ( not ( = ?auto_65367 ?auto_65356 ) ) ( CALIBRATION_TARGET ?auto_65366 ?auto_65362 ) ( POINTING ?auto_65364 ?auto_65357 ) ( not ( = ?auto_65362 ?auto_65357 ) ) ( not ( = ?auto_65355 ?auto_65357 ) ) ( not ( = ?auto_65365 ?auto_65357 ) ) ( ON_BOARD ?auto_65363 ?auto_65364 ) ( POWER_ON ?auto_65363 ) ( not ( = ?auto_65366 ?auto_65363 ) ) ( HAVE_IMAGE ?auto_65357 ?auto_65354 ) ( HAVE_IMAGE ?auto_65358 ?auto_65359 ) ( HAVE_IMAGE ?auto_65360 ?auto_65361 ) ( not ( = ?auto_65355 ?auto_65358 ) ) ( not ( = ?auto_65355 ?auto_65360 ) ) ( not ( = ?auto_65356 ?auto_65354 ) ) ( not ( = ?auto_65356 ?auto_65359 ) ) ( not ( = ?auto_65356 ?auto_65361 ) ) ( not ( = ?auto_65357 ?auto_65358 ) ) ( not ( = ?auto_65357 ?auto_65360 ) ) ( not ( = ?auto_65354 ?auto_65359 ) ) ( not ( = ?auto_65354 ?auto_65361 ) ) ( not ( = ?auto_65354 ?auto_65367 ) ) ( not ( = ?auto_65358 ?auto_65360 ) ) ( not ( = ?auto_65358 ?auto_65362 ) ) ( not ( = ?auto_65358 ?auto_65365 ) ) ( not ( = ?auto_65359 ?auto_65361 ) ) ( not ( = ?auto_65359 ?auto_65367 ) ) ( not ( = ?auto_65360 ?auto_65362 ) ) ( not ( = ?auto_65360 ?auto_65365 ) ) ( not ( = ?auto_65361 ?auto_65367 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_65365 ?auto_65367 ?auto_65355 ?auto_65356 )
      ( GET-4IMAGE-VERIFY ?auto_65355 ?auto_65356 ?auto_65357 ?auto_65354 ?auto_65358 ?auto_65359 ?auto_65360 ?auto_65361 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_65993 - DIRECTION
      ?auto_65994 - MODE
      ?auto_65995 - DIRECTION
      ?auto_65992 - MODE
      ?auto_65996 - DIRECTION
      ?auto_65997 - MODE
    )
    :vars
    (
      ?auto_66002 - INSTRUMENT
      ?auto_66001 - SATELLITE
      ?auto_66000 - DIRECTION
      ?auto_65999 - DIRECTION
      ?auto_65998 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_66002 ?auto_66001 ) ( SUPPORTS ?auto_66002 ?auto_65994 ) ( not ( = ?auto_65993 ?auto_66000 ) ) ( HAVE_IMAGE ?auto_65996 ?auto_65992 ) ( not ( = ?auto_65996 ?auto_65993 ) ) ( not ( = ?auto_65996 ?auto_66000 ) ) ( not ( = ?auto_65992 ?auto_65994 ) ) ( CALIBRATION_TARGET ?auto_66002 ?auto_66000 ) ( POINTING ?auto_66001 ?auto_65999 ) ( not ( = ?auto_66000 ?auto_65999 ) ) ( not ( = ?auto_65993 ?auto_65999 ) ) ( not ( = ?auto_65996 ?auto_65999 ) ) ( ON_BOARD ?auto_65998 ?auto_66001 ) ( POWER_ON ?auto_65998 ) ( not ( = ?auto_66002 ?auto_65998 ) ) ( HAVE_IMAGE ?auto_65995 ?auto_65992 ) ( HAVE_IMAGE ?auto_65996 ?auto_65997 ) ( not ( = ?auto_65993 ?auto_65995 ) ) ( not ( = ?auto_65994 ?auto_65997 ) ) ( not ( = ?auto_65995 ?auto_65996 ) ) ( not ( = ?auto_65995 ?auto_66000 ) ) ( not ( = ?auto_65995 ?auto_65999 ) ) ( not ( = ?auto_65992 ?auto_65997 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_65996 ?auto_65992 ?auto_65993 ?auto_65994 )
      ( GET-3IMAGE-VERIFY ?auto_65993 ?auto_65994 ?auto_65995 ?auto_65992 ?auto_65996 ?auto_65997 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_66633 - DIRECTION
      ?auto_66634 - MODE
      ?auto_66635 - DIRECTION
      ?auto_66632 - MODE
      ?auto_66636 - DIRECTION
      ?auto_66637 - MODE
      ?auto_66638 - DIRECTION
      ?auto_66639 - MODE
    )
    :vars
    (
      ?auto_66644 - INSTRUMENT
      ?auto_66643 - SATELLITE
      ?auto_66642 - DIRECTION
      ?auto_66641 - DIRECTION
      ?auto_66640 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_66644 ?auto_66643 ) ( SUPPORTS ?auto_66644 ?auto_66639 ) ( not ( = ?auto_66638 ?auto_66642 ) ) ( HAVE_IMAGE ?auto_66635 ?auto_66637 ) ( not ( = ?auto_66635 ?auto_66638 ) ) ( not ( = ?auto_66635 ?auto_66642 ) ) ( not ( = ?auto_66637 ?auto_66639 ) ) ( CALIBRATION_TARGET ?auto_66644 ?auto_66642 ) ( POINTING ?auto_66643 ?auto_66641 ) ( not ( = ?auto_66642 ?auto_66641 ) ) ( not ( = ?auto_66638 ?auto_66641 ) ) ( not ( = ?auto_66635 ?auto_66641 ) ) ( ON_BOARD ?auto_66640 ?auto_66643 ) ( POWER_ON ?auto_66640 ) ( not ( = ?auto_66644 ?auto_66640 ) ) ( HAVE_IMAGE ?auto_66633 ?auto_66634 ) ( HAVE_IMAGE ?auto_66635 ?auto_66632 ) ( HAVE_IMAGE ?auto_66636 ?auto_66637 ) ( not ( = ?auto_66633 ?auto_66635 ) ) ( not ( = ?auto_66633 ?auto_66636 ) ) ( not ( = ?auto_66633 ?auto_66638 ) ) ( not ( = ?auto_66633 ?auto_66642 ) ) ( not ( = ?auto_66633 ?auto_66641 ) ) ( not ( = ?auto_66634 ?auto_66632 ) ) ( not ( = ?auto_66634 ?auto_66637 ) ) ( not ( = ?auto_66634 ?auto_66639 ) ) ( not ( = ?auto_66635 ?auto_66636 ) ) ( not ( = ?auto_66632 ?auto_66637 ) ) ( not ( = ?auto_66632 ?auto_66639 ) ) ( not ( = ?auto_66636 ?auto_66638 ) ) ( not ( = ?auto_66636 ?auto_66642 ) ) ( not ( = ?auto_66636 ?auto_66641 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_66635 ?auto_66637 ?auto_66638 ?auto_66639 )
      ( GET-4IMAGE-VERIFY ?auto_66633 ?auto_66634 ?auto_66635 ?auto_66632 ?auto_66636 ?auto_66637 ?auto_66638 ?auto_66639 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_66915 - DIRECTION
      ?auto_66916 - MODE
      ?auto_66917 - DIRECTION
      ?auto_66914 - MODE
      ?auto_66918 - DIRECTION
      ?auto_66919 - MODE
      ?auto_66920 - DIRECTION
      ?auto_66921 - MODE
    )
    :vars
    (
      ?auto_66926 - INSTRUMENT
      ?auto_66925 - SATELLITE
      ?auto_66924 - DIRECTION
      ?auto_66923 - DIRECTION
      ?auto_66922 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_66926 ?auto_66925 ) ( SUPPORTS ?auto_66926 ?auto_66914 ) ( not ( = ?auto_66917 ?auto_66924 ) ) ( HAVE_IMAGE ?auto_66918 ?auto_66921 ) ( not ( = ?auto_66918 ?auto_66917 ) ) ( not ( = ?auto_66918 ?auto_66924 ) ) ( not ( = ?auto_66921 ?auto_66914 ) ) ( CALIBRATION_TARGET ?auto_66926 ?auto_66924 ) ( POINTING ?auto_66925 ?auto_66923 ) ( not ( = ?auto_66924 ?auto_66923 ) ) ( not ( = ?auto_66917 ?auto_66923 ) ) ( not ( = ?auto_66918 ?auto_66923 ) ) ( ON_BOARD ?auto_66922 ?auto_66925 ) ( POWER_ON ?auto_66922 ) ( not ( = ?auto_66926 ?auto_66922 ) ) ( HAVE_IMAGE ?auto_66915 ?auto_66916 ) ( HAVE_IMAGE ?auto_66918 ?auto_66919 ) ( HAVE_IMAGE ?auto_66920 ?auto_66921 ) ( not ( = ?auto_66915 ?auto_66917 ) ) ( not ( = ?auto_66915 ?auto_66918 ) ) ( not ( = ?auto_66915 ?auto_66920 ) ) ( not ( = ?auto_66915 ?auto_66924 ) ) ( not ( = ?auto_66915 ?auto_66923 ) ) ( not ( = ?auto_66916 ?auto_66914 ) ) ( not ( = ?auto_66916 ?auto_66919 ) ) ( not ( = ?auto_66916 ?auto_66921 ) ) ( not ( = ?auto_66917 ?auto_66920 ) ) ( not ( = ?auto_66914 ?auto_66919 ) ) ( not ( = ?auto_66918 ?auto_66920 ) ) ( not ( = ?auto_66919 ?auto_66921 ) ) ( not ( = ?auto_66920 ?auto_66924 ) ) ( not ( = ?auto_66920 ?auto_66923 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_66918 ?auto_66921 ?auto_66917 ?auto_66914 )
      ( GET-4IMAGE-VERIFY ?auto_66915 ?auto_66916 ?auto_66917 ?auto_66914 ?auto_66918 ?auto_66919 ?auto_66920 ?auto_66921 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_71315 - DIRECTION
      ?auto_71316 - MODE
      ?auto_71317 - DIRECTION
      ?auto_71314 - MODE
      ?auto_71318 - DIRECTION
      ?auto_71319 - MODE
    )
    :vars
    (
      ?auto_71321 - INSTRUMENT
      ?auto_71322 - SATELLITE
      ?auto_71320 - DIRECTION
      ?auto_71323 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_71321 ?auto_71322 ) ( SUPPORTS ?auto_71321 ?auto_71319 ) ( not ( = ?auto_71318 ?auto_71320 ) ) ( HAVE_IMAGE ?auto_71315 ?auto_71316 ) ( not ( = ?auto_71315 ?auto_71318 ) ) ( not ( = ?auto_71315 ?auto_71320 ) ) ( not ( = ?auto_71316 ?auto_71319 ) ) ( CALIBRATION_TARGET ?auto_71321 ?auto_71320 ) ( not ( = ?auto_71320 ?auto_71317 ) ) ( not ( = ?auto_71318 ?auto_71317 ) ) ( not ( = ?auto_71315 ?auto_71317 ) ) ( ON_BOARD ?auto_71323 ?auto_71322 ) ( POWER_ON ?auto_71323 ) ( not ( = ?auto_71321 ?auto_71323 ) ) ( POINTING ?auto_71322 ?auto_71320 ) ( HAVE_IMAGE ?auto_71317 ?auto_71314 ) ( not ( = ?auto_71316 ?auto_71314 ) ) ( not ( = ?auto_71314 ?auto_71319 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_71315 ?auto_71316 ?auto_71318 ?auto_71319 )
      ( GET-3IMAGE-VERIFY ?auto_71315 ?auto_71316 ?auto_71317 ?auto_71314 ?auto_71318 ?auto_71319 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_68563 - DIRECTION
      ?auto_68564 - MODE
      ?auto_68565 - DIRECTION
      ?auto_68562 - MODE
      ?auto_68566 - DIRECTION
      ?auto_68567 - MODE
    )
    :vars
    (
      ?auto_68572 - INSTRUMENT
      ?auto_68568 - SATELLITE
      ?auto_68570 - DIRECTION
      ?auto_68571 - DIRECTION
      ?auto_68569 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_68572 ?auto_68568 ) ( SUPPORTS ?auto_68572 ?auto_68562 ) ( not ( = ?auto_68565 ?auto_68570 ) ) ( HAVE_IMAGE ?auto_68566 ?auto_68567 ) ( not ( = ?auto_68566 ?auto_68565 ) ) ( not ( = ?auto_68566 ?auto_68570 ) ) ( not ( = ?auto_68567 ?auto_68562 ) ) ( CALIBRATION_TARGET ?auto_68572 ?auto_68570 ) ( not ( = ?auto_68570 ?auto_68571 ) ) ( not ( = ?auto_68565 ?auto_68571 ) ) ( not ( = ?auto_68566 ?auto_68571 ) ) ( ON_BOARD ?auto_68569 ?auto_68568 ) ( POWER_ON ?auto_68569 ) ( not ( = ?auto_68572 ?auto_68569 ) ) ( POINTING ?auto_68568 ?auto_68570 ) ( HAVE_IMAGE ?auto_68563 ?auto_68564 ) ( not ( = ?auto_68563 ?auto_68565 ) ) ( not ( = ?auto_68563 ?auto_68566 ) ) ( not ( = ?auto_68563 ?auto_68570 ) ) ( not ( = ?auto_68563 ?auto_68571 ) ) ( not ( = ?auto_68564 ?auto_68562 ) ) ( not ( = ?auto_68564 ?auto_68567 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_68566 ?auto_68567 ?auto_68565 ?auto_68562 )
      ( GET-3IMAGE-VERIFY ?auto_68563 ?auto_68564 ?auto_68565 ?auto_68562 ?auto_68566 ?auto_68567 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_71385 - DIRECTION
      ?auto_71386 - MODE
      ?auto_71387 - DIRECTION
      ?auto_71384 - MODE
      ?auto_71388 - DIRECTION
      ?auto_71389 - MODE
    )
    :vars
    (
      ?auto_71393 - INSTRUMENT
      ?auto_71394 - SATELLITE
      ?auto_71392 - DIRECTION
      ?auto_71390 - DIRECTION
      ?auto_71391 - MODE
      ?auto_71395 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_71393 ?auto_71394 ) ( SUPPORTS ?auto_71393 ?auto_71389 ) ( not ( = ?auto_71388 ?auto_71392 ) ) ( HAVE_IMAGE ?auto_71390 ?auto_71391 ) ( not ( = ?auto_71390 ?auto_71388 ) ) ( not ( = ?auto_71390 ?auto_71392 ) ) ( not ( = ?auto_71391 ?auto_71389 ) ) ( CALIBRATION_TARGET ?auto_71393 ?auto_71392 ) ( not ( = ?auto_71392 ?auto_71385 ) ) ( not ( = ?auto_71388 ?auto_71385 ) ) ( not ( = ?auto_71390 ?auto_71385 ) ) ( ON_BOARD ?auto_71395 ?auto_71394 ) ( POWER_ON ?auto_71395 ) ( not ( = ?auto_71393 ?auto_71395 ) ) ( POINTING ?auto_71394 ?auto_71392 ) ( HAVE_IMAGE ?auto_71385 ?auto_71386 ) ( HAVE_IMAGE ?auto_71387 ?auto_71384 ) ( not ( = ?auto_71385 ?auto_71387 ) ) ( not ( = ?auto_71386 ?auto_71384 ) ) ( not ( = ?auto_71386 ?auto_71389 ) ) ( not ( = ?auto_71386 ?auto_71391 ) ) ( not ( = ?auto_71387 ?auto_71388 ) ) ( not ( = ?auto_71387 ?auto_71392 ) ) ( not ( = ?auto_71387 ?auto_71390 ) ) ( not ( = ?auto_71384 ?auto_71389 ) ) ( not ( = ?auto_71384 ?auto_71391 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_71390 ?auto_71391 ?auto_71388 ?auto_71389 )
      ( GET-3IMAGE-VERIFY ?auto_71385 ?auto_71386 ?auto_71387 ?auto_71384 ?auto_71388 ?auto_71389 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_71415 - DIRECTION
      ?auto_71416 - MODE
      ?auto_71417 - DIRECTION
      ?auto_71414 - MODE
      ?auto_71418 - DIRECTION
      ?auto_71419 - MODE
    )
    :vars
    (
      ?auto_71423 - INSTRUMENT
      ?auto_71424 - SATELLITE
      ?auto_71422 - DIRECTION
      ?auto_71420 - DIRECTION
      ?auto_71421 - MODE
      ?auto_71425 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_71423 ?auto_71424 ) ( SUPPORTS ?auto_71423 ?auto_71414 ) ( not ( = ?auto_71417 ?auto_71422 ) ) ( HAVE_IMAGE ?auto_71420 ?auto_71421 ) ( not ( = ?auto_71420 ?auto_71417 ) ) ( not ( = ?auto_71420 ?auto_71422 ) ) ( not ( = ?auto_71421 ?auto_71414 ) ) ( CALIBRATION_TARGET ?auto_71423 ?auto_71422 ) ( not ( = ?auto_71422 ?auto_71418 ) ) ( not ( = ?auto_71417 ?auto_71418 ) ) ( not ( = ?auto_71420 ?auto_71418 ) ) ( ON_BOARD ?auto_71425 ?auto_71424 ) ( POWER_ON ?auto_71425 ) ( not ( = ?auto_71423 ?auto_71425 ) ) ( POINTING ?auto_71424 ?auto_71422 ) ( HAVE_IMAGE ?auto_71415 ?auto_71416 ) ( HAVE_IMAGE ?auto_71418 ?auto_71419 ) ( not ( = ?auto_71415 ?auto_71417 ) ) ( not ( = ?auto_71415 ?auto_71418 ) ) ( not ( = ?auto_71415 ?auto_71422 ) ) ( not ( = ?auto_71415 ?auto_71420 ) ) ( not ( = ?auto_71416 ?auto_71414 ) ) ( not ( = ?auto_71416 ?auto_71419 ) ) ( not ( = ?auto_71416 ?auto_71421 ) ) ( not ( = ?auto_71414 ?auto_71419 ) ) ( not ( = ?auto_71419 ?auto_71421 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_71420 ?auto_71421 ?auto_71417 ?auto_71414 )
      ( GET-3IMAGE-VERIFY ?auto_71415 ?auto_71416 ?auto_71417 ?auto_71414 ?auto_71418 ?auto_71419 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_68771 - DIRECTION
      ?auto_68772 - MODE
      ?auto_68773 - DIRECTION
      ?auto_68770 - MODE
      ?auto_68774 - DIRECTION
      ?auto_68775 - MODE
    )
    :vars
    (
      ?auto_68780 - INSTRUMENT
      ?auto_68776 - SATELLITE
      ?auto_68778 - DIRECTION
      ?auto_68779 - DIRECTION
      ?auto_68777 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_68780 ?auto_68776 ) ( SUPPORTS ?auto_68780 ?auto_68772 ) ( not ( = ?auto_68771 ?auto_68778 ) ) ( HAVE_IMAGE ?auto_68773 ?auto_68775 ) ( not ( = ?auto_68773 ?auto_68771 ) ) ( not ( = ?auto_68773 ?auto_68778 ) ) ( not ( = ?auto_68775 ?auto_68772 ) ) ( CALIBRATION_TARGET ?auto_68780 ?auto_68778 ) ( not ( = ?auto_68778 ?auto_68779 ) ) ( not ( = ?auto_68771 ?auto_68779 ) ) ( not ( = ?auto_68773 ?auto_68779 ) ) ( ON_BOARD ?auto_68777 ?auto_68776 ) ( POWER_ON ?auto_68777 ) ( not ( = ?auto_68780 ?auto_68777 ) ) ( POINTING ?auto_68776 ?auto_68778 ) ( HAVE_IMAGE ?auto_68773 ?auto_68770 ) ( HAVE_IMAGE ?auto_68774 ?auto_68775 ) ( not ( = ?auto_68771 ?auto_68774 ) ) ( not ( = ?auto_68772 ?auto_68770 ) ) ( not ( = ?auto_68773 ?auto_68774 ) ) ( not ( = ?auto_68770 ?auto_68775 ) ) ( not ( = ?auto_68774 ?auto_68778 ) ) ( not ( = ?auto_68774 ?auto_68779 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_68773 ?auto_68775 ?auto_68771 ?auto_68772 )
      ( GET-3IMAGE-VERIFY ?auto_68771 ?auto_68772 ?auto_68773 ?auto_68770 ?auto_68774 ?auto_68775 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_71547 - DIRECTION
      ?auto_71548 - MODE
      ?auto_71549 - DIRECTION
      ?auto_71546 - MODE
      ?auto_71550 - DIRECTION
      ?auto_71551 - MODE
    )
    :vars
    (
      ?auto_71553 - INSTRUMENT
      ?auto_71554 - SATELLITE
      ?auto_71552 - DIRECTION
      ?auto_71555 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_71553 ?auto_71554 ) ( SUPPORTS ?auto_71553 ?auto_71548 ) ( not ( = ?auto_71547 ?auto_71552 ) ) ( HAVE_IMAGE ?auto_71549 ?auto_71546 ) ( not ( = ?auto_71549 ?auto_71547 ) ) ( not ( = ?auto_71549 ?auto_71552 ) ) ( not ( = ?auto_71546 ?auto_71548 ) ) ( CALIBRATION_TARGET ?auto_71553 ?auto_71552 ) ( not ( = ?auto_71552 ?auto_71550 ) ) ( not ( = ?auto_71547 ?auto_71550 ) ) ( not ( = ?auto_71549 ?auto_71550 ) ) ( ON_BOARD ?auto_71555 ?auto_71554 ) ( POWER_ON ?auto_71555 ) ( not ( = ?auto_71553 ?auto_71555 ) ) ( POINTING ?auto_71554 ?auto_71552 ) ( HAVE_IMAGE ?auto_71550 ?auto_71551 ) ( not ( = ?auto_71548 ?auto_71551 ) ) ( not ( = ?auto_71546 ?auto_71551 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_71549 ?auto_71546 ?auto_71547 ?auto_71548 )
      ( GET-3IMAGE-VERIFY ?auto_71547 ?auto_71548 ?auto_71549 ?auto_71546 ?auto_71550 ?auto_71551 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_71585 - DIRECTION
      ?auto_71586 - MODE
      ?auto_71587 - DIRECTION
      ?auto_71584 - MODE
      ?auto_71588 - DIRECTION
      ?auto_71589 - MODE
    )
    :vars
    (
      ?auto_71593 - INSTRUMENT
      ?auto_71594 - SATELLITE
      ?auto_71592 - DIRECTION
      ?auto_71590 - DIRECTION
      ?auto_71591 - MODE
      ?auto_71595 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_71593 ?auto_71594 ) ( SUPPORTS ?auto_71593 ?auto_71586 ) ( not ( = ?auto_71585 ?auto_71592 ) ) ( HAVE_IMAGE ?auto_71590 ?auto_71591 ) ( not ( = ?auto_71590 ?auto_71585 ) ) ( not ( = ?auto_71590 ?auto_71592 ) ) ( not ( = ?auto_71591 ?auto_71586 ) ) ( CALIBRATION_TARGET ?auto_71593 ?auto_71592 ) ( not ( = ?auto_71592 ?auto_71587 ) ) ( not ( = ?auto_71585 ?auto_71587 ) ) ( not ( = ?auto_71590 ?auto_71587 ) ) ( ON_BOARD ?auto_71595 ?auto_71594 ) ( POWER_ON ?auto_71595 ) ( not ( = ?auto_71593 ?auto_71595 ) ) ( POINTING ?auto_71594 ?auto_71592 ) ( HAVE_IMAGE ?auto_71587 ?auto_71584 ) ( HAVE_IMAGE ?auto_71588 ?auto_71589 ) ( not ( = ?auto_71585 ?auto_71588 ) ) ( not ( = ?auto_71586 ?auto_71584 ) ) ( not ( = ?auto_71586 ?auto_71589 ) ) ( not ( = ?auto_71587 ?auto_71588 ) ) ( not ( = ?auto_71584 ?auto_71589 ) ) ( not ( = ?auto_71584 ?auto_71591 ) ) ( not ( = ?auto_71588 ?auto_71592 ) ) ( not ( = ?auto_71588 ?auto_71590 ) ) ( not ( = ?auto_71589 ?auto_71591 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_71590 ?auto_71591 ?auto_71585 ?auto_71586 )
      ( GET-3IMAGE-VERIFY ?auto_71585 ?auto_71586 ?auto_71587 ?auto_71584 ?auto_71588 ?auto_71589 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_71732 - DIRECTION
      ?auto_71733 - MODE
      ?auto_71734 - DIRECTION
      ?auto_71731 - MODE
      ?auto_71735 - DIRECTION
      ?auto_71736 - MODE
      ?auto_71737 - DIRECTION
      ?auto_71738 - MODE
    )
    :vars
    (
      ?auto_71740 - INSTRUMENT
      ?auto_71741 - SATELLITE
      ?auto_71739 - DIRECTION
      ?auto_71742 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_71740 ?auto_71741 ) ( SUPPORTS ?auto_71740 ?auto_71738 ) ( not ( = ?auto_71737 ?auto_71739 ) ) ( HAVE_IMAGE ?auto_71732 ?auto_71733 ) ( not ( = ?auto_71732 ?auto_71737 ) ) ( not ( = ?auto_71732 ?auto_71739 ) ) ( not ( = ?auto_71733 ?auto_71738 ) ) ( CALIBRATION_TARGET ?auto_71740 ?auto_71739 ) ( not ( = ?auto_71739 ?auto_71735 ) ) ( not ( = ?auto_71737 ?auto_71735 ) ) ( not ( = ?auto_71732 ?auto_71735 ) ) ( ON_BOARD ?auto_71742 ?auto_71741 ) ( POWER_ON ?auto_71742 ) ( not ( = ?auto_71740 ?auto_71742 ) ) ( POINTING ?auto_71741 ?auto_71739 ) ( HAVE_IMAGE ?auto_71734 ?auto_71731 ) ( HAVE_IMAGE ?auto_71735 ?auto_71736 ) ( not ( = ?auto_71732 ?auto_71734 ) ) ( not ( = ?auto_71733 ?auto_71731 ) ) ( not ( = ?auto_71733 ?auto_71736 ) ) ( not ( = ?auto_71734 ?auto_71735 ) ) ( not ( = ?auto_71734 ?auto_71737 ) ) ( not ( = ?auto_71734 ?auto_71739 ) ) ( not ( = ?auto_71731 ?auto_71736 ) ) ( not ( = ?auto_71731 ?auto_71738 ) ) ( not ( = ?auto_71736 ?auto_71738 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_71732 ?auto_71733 ?auto_71737 ?auto_71738 )
      ( GET-4IMAGE-VERIFY ?auto_71732 ?auto_71733 ?auto_71734 ?auto_71731 ?auto_71735 ?auto_71736 ?auto_71737 ?auto_71738 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_72218 - DIRECTION
      ?auto_72219 - MODE
      ?auto_72220 - DIRECTION
      ?auto_72217 - MODE
      ?auto_72221 - DIRECTION
      ?auto_72222 - MODE
      ?auto_72223 - DIRECTION
      ?auto_72224 - MODE
    )
    :vars
    (
      ?auto_72226 - INSTRUMENT
      ?auto_72227 - SATELLITE
      ?auto_72225 - DIRECTION
      ?auto_72228 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_72226 ?auto_72227 ) ( SUPPORTS ?auto_72226 ?auto_72222 ) ( not ( = ?auto_72221 ?auto_72225 ) ) ( HAVE_IMAGE ?auto_72220 ?auto_72224 ) ( not ( = ?auto_72220 ?auto_72221 ) ) ( not ( = ?auto_72220 ?auto_72225 ) ) ( not ( = ?auto_72224 ?auto_72222 ) ) ( CALIBRATION_TARGET ?auto_72226 ?auto_72225 ) ( not ( = ?auto_72225 ?auto_72218 ) ) ( not ( = ?auto_72221 ?auto_72218 ) ) ( not ( = ?auto_72220 ?auto_72218 ) ) ( ON_BOARD ?auto_72228 ?auto_72227 ) ( POWER_ON ?auto_72228 ) ( not ( = ?auto_72226 ?auto_72228 ) ) ( POINTING ?auto_72227 ?auto_72225 ) ( HAVE_IMAGE ?auto_72218 ?auto_72219 ) ( HAVE_IMAGE ?auto_72220 ?auto_72217 ) ( HAVE_IMAGE ?auto_72223 ?auto_72224 ) ( not ( = ?auto_72218 ?auto_72223 ) ) ( not ( = ?auto_72219 ?auto_72217 ) ) ( not ( = ?auto_72219 ?auto_72222 ) ) ( not ( = ?auto_72219 ?auto_72224 ) ) ( not ( = ?auto_72220 ?auto_72223 ) ) ( not ( = ?auto_72217 ?auto_72222 ) ) ( not ( = ?auto_72217 ?auto_72224 ) ) ( not ( = ?auto_72221 ?auto_72223 ) ) ( not ( = ?auto_72223 ?auto_72225 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_72220 ?auto_72224 ?auto_72221 ?auto_72222 )
      ( GET-4IMAGE-VERIFY ?auto_72218 ?auto_72219 ?auto_72220 ?auto_72217 ?auto_72221 ?auto_72222 ?auto_72223 ?auto_72224 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_69009 - DIRECTION
      ?auto_69010 - MODE
      ?auto_69011 - DIRECTION
      ?auto_69008 - MODE
      ?auto_69012 - DIRECTION
      ?auto_69013 - MODE
      ?auto_69014 - DIRECTION
      ?auto_69015 - MODE
    )
    :vars
    (
      ?auto_69020 - INSTRUMENT
      ?auto_69016 - SATELLITE
      ?auto_69018 - DIRECTION
      ?auto_69019 - DIRECTION
      ?auto_69017 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_69020 ?auto_69016 ) ( SUPPORTS ?auto_69020 ?auto_69013 ) ( not ( = ?auto_69012 ?auto_69018 ) ) ( HAVE_IMAGE ?auto_69011 ?auto_69010 ) ( not ( = ?auto_69011 ?auto_69012 ) ) ( not ( = ?auto_69011 ?auto_69018 ) ) ( not ( = ?auto_69010 ?auto_69013 ) ) ( CALIBRATION_TARGET ?auto_69020 ?auto_69018 ) ( not ( = ?auto_69018 ?auto_69019 ) ) ( not ( = ?auto_69012 ?auto_69019 ) ) ( not ( = ?auto_69011 ?auto_69019 ) ) ( ON_BOARD ?auto_69017 ?auto_69016 ) ( POWER_ON ?auto_69017 ) ( not ( = ?auto_69020 ?auto_69017 ) ) ( POINTING ?auto_69016 ?auto_69018 ) ( HAVE_IMAGE ?auto_69009 ?auto_69010 ) ( HAVE_IMAGE ?auto_69011 ?auto_69008 ) ( HAVE_IMAGE ?auto_69014 ?auto_69015 ) ( not ( = ?auto_69009 ?auto_69011 ) ) ( not ( = ?auto_69009 ?auto_69012 ) ) ( not ( = ?auto_69009 ?auto_69014 ) ) ( not ( = ?auto_69009 ?auto_69018 ) ) ( not ( = ?auto_69009 ?auto_69019 ) ) ( not ( = ?auto_69010 ?auto_69008 ) ) ( not ( = ?auto_69010 ?auto_69015 ) ) ( not ( = ?auto_69011 ?auto_69014 ) ) ( not ( = ?auto_69008 ?auto_69013 ) ) ( not ( = ?auto_69008 ?auto_69015 ) ) ( not ( = ?auto_69012 ?auto_69014 ) ) ( not ( = ?auto_69013 ?auto_69015 ) ) ( not ( = ?auto_69014 ?auto_69018 ) ) ( not ( = ?auto_69014 ?auto_69019 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_69011 ?auto_69010 ?auto_69012 ?auto_69013 )
      ( GET-4IMAGE-VERIFY ?auto_69009 ?auto_69010 ?auto_69011 ?auto_69008 ?auto_69012 ?auto_69013 ?auto_69014 ?auto_69015 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_71808 - DIRECTION
      ?auto_71809 - MODE
      ?auto_71810 - DIRECTION
      ?auto_71807 - MODE
      ?auto_71811 - DIRECTION
      ?auto_71812 - MODE
      ?auto_71813 - DIRECTION
      ?auto_71814 - MODE
    )
    :vars
    (
      ?auto_71816 - INSTRUMENT
      ?auto_71817 - SATELLITE
      ?auto_71815 - DIRECTION
      ?auto_71818 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_71816 ?auto_71817 ) ( SUPPORTS ?auto_71816 ?auto_71814 ) ( not ( = ?auto_71813 ?auto_71815 ) ) ( HAVE_IMAGE ?auto_71808 ?auto_71812 ) ( not ( = ?auto_71808 ?auto_71813 ) ) ( not ( = ?auto_71808 ?auto_71815 ) ) ( not ( = ?auto_71812 ?auto_71814 ) ) ( CALIBRATION_TARGET ?auto_71816 ?auto_71815 ) ( not ( = ?auto_71815 ?auto_71810 ) ) ( not ( = ?auto_71813 ?auto_71810 ) ) ( not ( = ?auto_71808 ?auto_71810 ) ) ( ON_BOARD ?auto_71818 ?auto_71817 ) ( POWER_ON ?auto_71818 ) ( not ( = ?auto_71816 ?auto_71818 ) ) ( POINTING ?auto_71817 ?auto_71815 ) ( HAVE_IMAGE ?auto_71808 ?auto_71809 ) ( HAVE_IMAGE ?auto_71810 ?auto_71807 ) ( HAVE_IMAGE ?auto_71811 ?auto_71812 ) ( not ( = ?auto_71808 ?auto_71811 ) ) ( not ( = ?auto_71809 ?auto_71807 ) ) ( not ( = ?auto_71809 ?auto_71812 ) ) ( not ( = ?auto_71809 ?auto_71814 ) ) ( not ( = ?auto_71810 ?auto_71811 ) ) ( not ( = ?auto_71807 ?auto_71812 ) ) ( not ( = ?auto_71807 ?auto_71814 ) ) ( not ( = ?auto_71811 ?auto_71813 ) ) ( not ( = ?auto_71811 ?auto_71815 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_71808 ?auto_71812 ?auto_71813 ?auto_71814 )
      ( GET-4IMAGE-VERIFY ?auto_71808 ?auto_71809 ?auto_71810 ?auto_71807 ?auto_71811 ?auto_71812 ?auto_71813 ?auto_71814 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_71770 - DIRECTION
      ?auto_71771 - MODE
      ?auto_71772 - DIRECTION
      ?auto_71769 - MODE
      ?auto_71773 - DIRECTION
      ?auto_71774 - MODE
      ?auto_71775 - DIRECTION
      ?auto_71776 - MODE
    )
    :vars
    (
      ?auto_71778 - INSTRUMENT
      ?auto_71779 - SATELLITE
      ?auto_71777 - DIRECTION
      ?auto_71780 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_71778 ?auto_71779 ) ( SUPPORTS ?auto_71778 ?auto_71774 ) ( not ( = ?auto_71773 ?auto_71777 ) ) ( HAVE_IMAGE ?auto_71770 ?auto_71771 ) ( not ( = ?auto_71770 ?auto_71773 ) ) ( not ( = ?auto_71770 ?auto_71777 ) ) ( not ( = ?auto_71771 ?auto_71774 ) ) ( CALIBRATION_TARGET ?auto_71778 ?auto_71777 ) ( not ( = ?auto_71777 ?auto_71775 ) ) ( not ( = ?auto_71773 ?auto_71775 ) ) ( not ( = ?auto_71770 ?auto_71775 ) ) ( ON_BOARD ?auto_71780 ?auto_71779 ) ( POWER_ON ?auto_71780 ) ( not ( = ?auto_71778 ?auto_71780 ) ) ( POINTING ?auto_71779 ?auto_71777 ) ( HAVE_IMAGE ?auto_71772 ?auto_71769 ) ( HAVE_IMAGE ?auto_71775 ?auto_71776 ) ( not ( = ?auto_71770 ?auto_71772 ) ) ( not ( = ?auto_71771 ?auto_71769 ) ) ( not ( = ?auto_71771 ?auto_71776 ) ) ( not ( = ?auto_71772 ?auto_71773 ) ) ( not ( = ?auto_71772 ?auto_71775 ) ) ( not ( = ?auto_71772 ?auto_71777 ) ) ( not ( = ?auto_71769 ?auto_71774 ) ) ( not ( = ?auto_71769 ?auto_71776 ) ) ( not ( = ?auto_71774 ?auto_71776 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_71770 ?auto_71771 ?auto_71773 ?auto_71774 )
      ( GET-4IMAGE-VERIFY ?auto_71770 ?auto_71771 ?auto_71772 ?auto_71769 ?auto_71773 ?auto_71774 ?auto_71775 ?auto_71776 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_72032 - DIRECTION
      ?auto_72033 - MODE
      ?auto_72034 - DIRECTION
      ?auto_72031 - MODE
      ?auto_72035 - DIRECTION
      ?auto_72036 - MODE
      ?auto_72037 - DIRECTION
      ?auto_72038 - MODE
    )
    :vars
    (
      ?auto_72040 - INSTRUMENT
      ?auto_72041 - SATELLITE
      ?auto_72039 - DIRECTION
      ?auto_72042 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_72040 ?auto_72041 ) ( SUPPORTS ?auto_72040 ?auto_72031 ) ( not ( = ?auto_72034 ?auto_72039 ) ) ( HAVE_IMAGE ?auto_72032 ?auto_72038 ) ( not ( = ?auto_72032 ?auto_72034 ) ) ( not ( = ?auto_72032 ?auto_72039 ) ) ( not ( = ?auto_72038 ?auto_72031 ) ) ( CALIBRATION_TARGET ?auto_72040 ?auto_72039 ) ( not ( = ?auto_72039 ?auto_72035 ) ) ( not ( = ?auto_72034 ?auto_72035 ) ) ( not ( = ?auto_72032 ?auto_72035 ) ) ( ON_BOARD ?auto_72042 ?auto_72041 ) ( POWER_ON ?auto_72042 ) ( not ( = ?auto_72040 ?auto_72042 ) ) ( POINTING ?auto_72041 ?auto_72039 ) ( HAVE_IMAGE ?auto_72032 ?auto_72033 ) ( HAVE_IMAGE ?auto_72035 ?auto_72036 ) ( HAVE_IMAGE ?auto_72037 ?auto_72038 ) ( not ( = ?auto_72032 ?auto_72037 ) ) ( not ( = ?auto_72033 ?auto_72031 ) ) ( not ( = ?auto_72033 ?auto_72036 ) ) ( not ( = ?auto_72033 ?auto_72038 ) ) ( not ( = ?auto_72034 ?auto_72037 ) ) ( not ( = ?auto_72031 ?auto_72036 ) ) ( not ( = ?auto_72035 ?auto_72037 ) ) ( not ( = ?auto_72036 ?auto_72038 ) ) ( not ( = ?auto_72037 ?auto_72039 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_72032 ?auto_72038 ?auto_72034 ?auto_72031 )
      ( GET-4IMAGE-VERIFY ?auto_72032 ?auto_72033 ?auto_72034 ?auto_72031 ?auto_72035 ?auto_72036 ?auto_72037 ?auto_72038 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_72466 - DIRECTION
      ?auto_72467 - MODE
      ?auto_72468 - DIRECTION
      ?auto_72465 - MODE
      ?auto_72469 - DIRECTION
      ?auto_72470 - MODE
      ?auto_72471 - DIRECTION
      ?auto_72472 - MODE
    )
    :vars
    (
      ?auto_72474 - INSTRUMENT
      ?auto_72475 - SATELLITE
      ?auto_72473 - DIRECTION
      ?auto_72476 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_72474 ?auto_72475 ) ( SUPPORTS ?auto_72474 ?auto_72465 ) ( not ( = ?auto_72468 ?auto_72473 ) ) ( HAVE_IMAGE ?auto_72469 ?auto_72470 ) ( not ( = ?auto_72469 ?auto_72468 ) ) ( not ( = ?auto_72469 ?auto_72473 ) ) ( not ( = ?auto_72470 ?auto_72465 ) ) ( CALIBRATION_TARGET ?auto_72474 ?auto_72473 ) ( not ( = ?auto_72473 ?auto_72466 ) ) ( not ( = ?auto_72468 ?auto_72466 ) ) ( not ( = ?auto_72469 ?auto_72466 ) ) ( ON_BOARD ?auto_72476 ?auto_72475 ) ( POWER_ON ?auto_72476 ) ( not ( = ?auto_72474 ?auto_72476 ) ) ( POINTING ?auto_72475 ?auto_72473 ) ( HAVE_IMAGE ?auto_72466 ?auto_72467 ) ( HAVE_IMAGE ?auto_72471 ?auto_72472 ) ( not ( = ?auto_72466 ?auto_72471 ) ) ( not ( = ?auto_72467 ?auto_72465 ) ) ( not ( = ?auto_72467 ?auto_72470 ) ) ( not ( = ?auto_72467 ?auto_72472 ) ) ( not ( = ?auto_72468 ?auto_72471 ) ) ( not ( = ?auto_72465 ?auto_72472 ) ) ( not ( = ?auto_72469 ?auto_72471 ) ) ( not ( = ?auto_72470 ?auto_72472 ) ) ( not ( = ?auto_72471 ?auto_72473 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_72469 ?auto_72470 ?auto_72468 ?auto_72465 )
      ( GET-4IMAGE-VERIFY ?auto_72466 ?auto_72467 ?auto_72468 ?auto_72465 ?auto_72469 ?auto_72470 ?auto_72471 ?auto_72472 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_72454 - DIRECTION
      ?auto_72455 - MODE
      ?auto_72456 - DIRECTION
      ?auto_72453 - MODE
      ?auto_72457 - DIRECTION
      ?auto_72458 - MODE
      ?auto_72459 - DIRECTION
      ?auto_72460 - MODE
    )
    :vars
    (
      ?auto_72462 - INSTRUMENT
      ?auto_72463 - SATELLITE
      ?auto_72461 - DIRECTION
      ?auto_72464 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_72462 ?auto_72463 ) ( SUPPORTS ?auto_72462 ?auto_72453 ) ( not ( = ?auto_72456 ?auto_72461 ) ) ( HAVE_IMAGE ?auto_72459 ?auto_72460 ) ( not ( = ?auto_72459 ?auto_72456 ) ) ( not ( = ?auto_72459 ?auto_72461 ) ) ( not ( = ?auto_72460 ?auto_72453 ) ) ( CALIBRATION_TARGET ?auto_72462 ?auto_72461 ) ( not ( = ?auto_72461 ?auto_72454 ) ) ( not ( = ?auto_72456 ?auto_72454 ) ) ( not ( = ?auto_72459 ?auto_72454 ) ) ( ON_BOARD ?auto_72464 ?auto_72463 ) ( POWER_ON ?auto_72464 ) ( not ( = ?auto_72462 ?auto_72464 ) ) ( POINTING ?auto_72463 ?auto_72461 ) ( HAVE_IMAGE ?auto_72454 ?auto_72455 ) ( HAVE_IMAGE ?auto_72457 ?auto_72458 ) ( not ( = ?auto_72454 ?auto_72457 ) ) ( not ( = ?auto_72455 ?auto_72453 ) ) ( not ( = ?auto_72455 ?auto_72458 ) ) ( not ( = ?auto_72455 ?auto_72460 ) ) ( not ( = ?auto_72456 ?auto_72457 ) ) ( not ( = ?auto_72453 ?auto_72458 ) ) ( not ( = ?auto_72457 ?auto_72459 ) ) ( not ( = ?auto_72457 ?auto_72461 ) ) ( not ( = ?auto_72458 ?auto_72460 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_72459 ?auto_72460 ?auto_72456 ?auto_72453 )
      ( GET-4IMAGE-VERIFY ?auto_72454 ?auto_72455 ?auto_72456 ?auto_72453 ?auto_72457 ?auto_72458 ?auto_72459 ?auto_72460 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_72194 - DIRECTION
      ?auto_72195 - MODE
      ?auto_72196 - DIRECTION
      ?auto_72193 - MODE
      ?auto_72197 - DIRECTION
      ?auto_72198 - MODE
      ?auto_72199 - DIRECTION
      ?auto_72200 - MODE
    )
    :vars
    (
      ?auto_72202 - INSTRUMENT
      ?auto_72203 - SATELLITE
      ?auto_72201 - DIRECTION
      ?auto_72204 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_72202 ?auto_72203 ) ( SUPPORTS ?auto_72202 ?auto_72200 ) ( not ( = ?auto_72199 ?auto_72201 ) ) ( HAVE_IMAGE ?auto_72196 ?auto_72193 ) ( not ( = ?auto_72196 ?auto_72199 ) ) ( not ( = ?auto_72196 ?auto_72201 ) ) ( not ( = ?auto_72193 ?auto_72200 ) ) ( CALIBRATION_TARGET ?auto_72202 ?auto_72201 ) ( not ( = ?auto_72201 ?auto_72194 ) ) ( not ( = ?auto_72199 ?auto_72194 ) ) ( not ( = ?auto_72196 ?auto_72194 ) ) ( ON_BOARD ?auto_72204 ?auto_72203 ) ( POWER_ON ?auto_72204 ) ( not ( = ?auto_72202 ?auto_72204 ) ) ( POINTING ?auto_72203 ?auto_72201 ) ( HAVE_IMAGE ?auto_72194 ?auto_72195 ) ( HAVE_IMAGE ?auto_72197 ?auto_72198 ) ( not ( = ?auto_72194 ?auto_72197 ) ) ( not ( = ?auto_72195 ?auto_72193 ) ) ( not ( = ?auto_72195 ?auto_72198 ) ) ( not ( = ?auto_72195 ?auto_72200 ) ) ( not ( = ?auto_72196 ?auto_72197 ) ) ( not ( = ?auto_72193 ?auto_72198 ) ) ( not ( = ?auto_72197 ?auto_72199 ) ) ( not ( = ?auto_72197 ?auto_72201 ) ) ( not ( = ?auto_72198 ?auto_72200 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_72196 ?auto_72193 ?auto_72199 ?auto_72200 )
      ( GET-4IMAGE-VERIFY ?auto_72194 ?auto_72195 ?auto_72196 ?auto_72193 ?auto_72197 ?auto_72198 ?auto_72199 ?auto_72200 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_72230 - DIRECTION
      ?auto_72231 - MODE
      ?auto_72232 - DIRECTION
      ?auto_72229 - MODE
      ?auto_72233 - DIRECTION
      ?auto_72234 - MODE
      ?auto_72235 - DIRECTION
      ?auto_72236 - MODE
    )
    :vars
    (
      ?auto_72238 - INSTRUMENT
      ?auto_72239 - SATELLITE
      ?auto_72237 - DIRECTION
      ?auto_72240 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_72238 ?auto_72239 ) ( SUPPORTS ?auto_72238 ?auto_72234 ) ( not ( = ?auto_72233 ?auto_72237 ) ) ( HAVE_IMAGE ?auto_72232 ?auto_72229 ) ( not ( = ?auto_72232 ?auto_72233 ) ) ( not ( = ?auto_72232 ?auto_72237 ) ) ( not ( = ?auto_72229 ?auto_72234 ) ) ( CALIBRATION_TARGET ?auto_72238 ?auto_72237 ) ( not ( = ?auto_72237 ?auto_72230 ) ) ( not ( = ?auto_72233 ?auto_72230 ) ) ( not ( = ?auto_72232 ?auto_72230 ) ) ( ON_BOARD ?auto_72240 ?auto_72239 ) ( POWER_ON ?auto_72240 ) ( not ( = ?auto_72238 ?auto_72240 ) ) ( POINTING ?auto_72239 ?auto_72237 ) ( HAVE_IMAGE ?auto_72230 ?auto_72231 ) ( HAVE_IMAGE ?auto_72235 ?auto_72236 ) ( not ( = ?auto_72230 ?auto_72235 ) ) ( not ( = ?auto_72231 ?auto_72229 ) ) ( not ( = ?auto_72231 ?auto_72234 ) ) ( not ( = ?auto_72231 ?auto_72236 ) ) ( not ( = ?auto_72232 ?auto_72235 ) ) ( not ( = ?auto_72229 ?auto_72236 ) ) ( not ( = ?auto_72233 ?auto_72235 ) ) ( not ( = ?auto_72234 ?auto_72236 ) ) ( not ( = ?auto_72235 ?auto_72237 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_72232 ?auto_72229 ?auto_72233 ?auto_72234 )
      ( GET-4IMAGE-VERIFY ?auto_72230 ?auto_72231 ?auto_72232 ?auto_72229 ?auto_72233 ?auto_72234 ?auto_72235 ?auto_72236 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_72182 - DIRECTION
      ?auto_72183 - MODE
      ?auto_72184 - DIRECTION
      ?auto_72181 - MODE
      ?auto_72185 - DIRECTION
      ?auto_72186 - MODE
      ?auto_72187 - DIRECTION
      ?auto_72188 - MODE
    )
    :vars
    (
      ?auto_72190 - INSTRUMENT
      ?auto_72191 - SATELLITE
      ?auto_72189 - DIRECTION
      ?auto_72192 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_72190 ?auto_72191 ) ( SUPPORTS ?auto_72190 ?auto_72188 ) ( not ( = ?auto_72187 ?auto_72189 ) ) ( HAVE_IMAGE ?auto_72185 ?auto_72186 ) ( not ( = ?auto_72185 ?auto_72187 ) ) ( not ( = ?auto_72185 ?auto_72189 ) ) ( not ( = ?auto_72186 ?auto_72188 ) ) ( CALIBRATION_TARGET ?auto_72190 ?auto_72189 ) ( not ( = ?auto_72189 ?auto_72182 ) ) ( not ( = ?auto_72187 ?auto_72182 ) ) ( not ( = ?auto_72185 ?auto_72182 ) ) ( ON_BOARD ?auto_72192 ?auto_72191 ) ( POWER_ON ?auto_72192 ) ( not ( = ?auto_72190 ?auto_72192 ) ) ( POINTING ?auto_72191 ?auto_72189 ) ( HAVE_IMAGE ?auto_72182 ?auto_72183 ) ( HAVE_IMAGE ?auto_72184 ?auto_72181 ) ( not ( = ?auto_72182 ?auto_72184 ) ) ( not ( = ?auto_72183 ?auto_72181 ) ) ( not ( = ?auto_72183 ?auto_72186 ) ) ( not ( = ?auto_72183 ?auto_72188 ) ) ( not ( = ?auto_72184 ?auto_72185 ) ) ( not ( = ?auto_72184 ?auto_72187 ) ) ( not ( = ?auto_72184 ?auto_72189 ) ) ( not ( = ?auto_72181 ?auto_72186 ) ) ( not ( = ?auto_72181 ?auto_72188 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_72185 ?auto_72186 ?auto_72187 ?auto_72188 )
      ( GET-4IMAGE-VERIFY ?auto_72182 ?auto_72183 ?auto_72184 ?auto_72181 ?auto_72185 ?auto_72186 ?auto_72187 ?auto_72188 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_72278 - DIRECTION
      ?auto_72279 - MODE
      ?auto_72280 - DIRECTION
      ?auto_72277 - MODE
      ?auto_72281 - DIRECTION
      ?auto_72282 - MODE
      ?auto_72283 - DIRECTION
      ?auto_72284 - MODE
    )
    :vars
    (
      ?auto_72288 - INSTRUMENT
      ?auto_72289 - SATELLITE
      ?auto_72287 - DIRECTION
      ?auto_72285 - DIRECTION
      ?auto_72286 - MODE
      ?auto_72290 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_72288 ?auto_72289 ) ( SUPPORTS ?auto_72288 ?auto_72284 ) ( not ( = ?auto_72283 ?auto_72287 ) ) ( HAVE_IMAGE ?auto_72285 ?auto_72286 ) ( not ( = ?auto_72285 ?auto_72283 ) ) ( not ( = ?auto_72285 ?auto_72287 ) ) ( not ( = ?auto_72286 ?auto_72284 ) ) ( CALIBRATION_TARGET ?auto_72288 ?auto_72287 ) ( not ( = ?auto_72287 ?auto_72278 ) ) ( not ( = ?auto_72283 ?auto_72278 ) ) ( not ( = ?auto_72285 ?auto_72278 ) ) ( ON_BOARD ?auto_72290 ?auto_72289 ) ( POWER_ON ?auto_72290 ) ( not ( = ?auto_72288 ?auto_72290 ) ) ( POINTING ?auto_72289 ?auto_72287 ) ( HAVE_IMAGE ?auto_72278 ?auto_72279 ) ( HAVE_IMAGE ?auto_72280 ?auto_72277 ) ( HAVE_IMAGE ?auto_72281 ?auto_72282 ) ( not ( = ?auto_72278 ?auto_72280 ) ) ( not ( = ?auto_72278 ?auto_72281 ) ) ( not ( = ?auto_72279 ?auto_72277 ) ) ( not ( = ?auto_72279 ?auto_72282 ) ) ( not ( = ?auto_72279 ?auto_72284 ) ) ( not ( = ?auto_72279 ?auto_72286 ) ) ( not ( = ?auto_72280 ?auto_72281 ) ) ( not ( = ?auto_72280 ?auto_72283 ) ) ( not ( = ?auto_72280 ?auto_72287 ) ) ( not ( = ?auto_72280 ?auto_72285 ) ) ( not ( = ?auto_72277 ?auto_72282 ) ) ( not ( = ?auto_72277 ?auto_72284 ) ) ( not ( = ?auto_72277 ?auto_72286 ) ) ( not ( = ?auto_72281 ?auto_72283 ) ) ( not ( = ?auto_72281 ?auto_72287 ) ) ( not ( = ?auto_72281 ?auto_72285 ) ) ( not ( = ?auto_72282 ?auto_72284 ) ) ( not ( = ?auto_72282 ?auto_72286 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_72285 ?auto_72286 ?auto_72283 ?auto_72284 )
      ( GET-4IMAGE-VERIFY ?auto_72278 ?auto_72279 ?auto_72280 ?auto_72277 ?auto_72281 ?auto_72282 ?auto_72283 ?auto_72284 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_72306 - DIRECTION
      ?auto_72307 - MODE
      ?auto_72308 - DIRECTION
      ?auto_72305 - MODE
      ?auto_72309 - DIRECTION
      ?auto_72310 - MODE
      ?auto_72311 - DIRECTION
      ?auto_72312 - MODE
    )
    :vars
    (
      ?auto_72314 - INSTRUMENT
      ?auto_72315 - SATELLITE
      ?auto_72313 - DIRECTION
      ?auto_72316 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_72314 ?auto_72315 ) ( SUPPORTS ?auto_72314 ?auto_72310 ) ( not ( = ?auto_72309 ?auto_72313 ) ) ( HAVE_IMAGE ?auto_72311 ?auto_72312 ) ( not ( = ?auto_72311 ?auto_72309 ) ) ( not ( = ?auto_72311 ?auto_72313 ) ) ( not ( = ?auto_72312 ?auto_72310 ) ) ( CALIBRATION_TARGET ?auto_72314 ?auto_72313 ) ( not ( = ?auto_72313 ?auto_72306 ) ) ( not ( = ?auto_72309 ?auto_72306 ) ) ( not ( = ?auto_72311 ?auto_72306 ) ) ( ON_BOARD ?auto_72316 ?auto_72315 ) ( POWER_ON ?auto_72316 ) ( not ( = ?auto_72314 ?auto_72316 ) ) ( POINTING ?auto_72315 ?auto_72313 ) ( HAVE_IMAGE ?auto_72306 ?auto_72307 ) ( HAVE_IMAGE ?auto_72308 ?auto_72305 ) ( not ( = ?auto_72306 ?auto_72308 ) ) ( not ( = ?auto_72307 ?auto_72305 ) ) ( not ( = ?auto_72307 ?auto_72310 ) ) ( not ( = ?auto_72307 ?auto_72312 ) ) ( not ( = ?auto_72308 ?auto_72309 ) ) ( not ( = ?auto_72308 ?auto_72311 ) ) ( not ( = ?auto_72308 ?auto_72313 ) ) ( not ( = ?auto_72305 ?auto_72310 ) ) ( not ( = ?auto_72305 ?auto_72312 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_72311 ?auto_72312 ?auto_72309 ?auto_72310 )
      ( GET-4IMAGE-VERIFY ?auto_72306 ?auto_72307 ?auto_72308 ?auto_72305 ?auto_72309 ?auto_72310 ?auto_72311 ?auto_72312 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_72318 - DIRECTION
      ?auto_72319 - MODE
      ?auto_72320 - DIRECTION
      ?auto_72317 - MODE
      ?auto_72321 - DIRECTION
      ?auto_72322 - MODE
      ?auto_72323 - DIRECTION
      ?auto_72324 - MODE
    )
    :vars
    (
      ?auto_72328 - INSTRUMENT
      ?auto_72329 - SATELLITE
      ?auto_72327 - DIRECTION
      ?auto_72325 - DIRECTION
      ?auto_72326 - MODE
      ?auto_72330 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_72328 ?auto_72329 ) ( SUPPORTS ?auto_72328 ?auto_72322 ) ( not ( = ?auto_72321 ?auto_72327 ) ) ( HAVE_IMAGE ?auto_72325 ?auto_72326 ) ( not ( = ?auto_72325 ?auto_72321 ) ) ( not ( = ?auto_72325 ?auto_72327 ) ) ( not ( = ?auto_72326 ?auto_72322 ) ) ( CALIBRATION_TARGET ?auto_72328 ?auto_72327 ) ( not ( = ?auto_72327 ?auto_72320 ) ) ( not ( = ?auto_72321 ?auto_72320 ) ) ( not ( = ?auto_72325 ?auto_72320 ) ) ( ON_BOARD ?auto_72330 ?auto_72329 ) ( POWER_ON ?auto_72330 ) ( not ( = ?auto_72328 ?auto_72330 ) ) ( POINTING ?auto_72329 ?auto_72327 ) ( HAVE_IMAGE ?auto_72318 ?auto_72319 ) ( HAVE_IMAGE ?auto_72320 ?auto_72317 ) ( HAVE_IMAGE ?auto_72323 ?auto_72324 ) ( not ( = ?auto_72318 ?auto_72320 ) ) ( not ( = ?auto_72318 ?auto_72321 ) ) ( not ( = ?auto_72318 ?auto_72323 ) ) ( not ( = ?auto_72318 ?auto_72327 ) ) ( not ( = ?auto_72318 ?auto_72325 ) ) ( not ( = ?auto_72319 ?auto_72317 ) ) ( not ( = ?auto_72319 ?auto_72322 ) ) ( not ( = ?auto_72319 ?auto_72324 ) ) ( not ( = ?auto_72319 ?auto_72326 ) ) ( not ( = ?auto_72320 ?auto_72323 ) ) ( not ( = ?auto_72317 ?auto_72322 ) ) ( not ( = ?auto_72317 ?auto_72324 ) ) ( not ( = ?auto_72317 ?auto_72326 ) ) ( not ( = ?auto_72321 ?auto_72323 ) ) ( not ( = ?auto_72322 ?auto_72324 ) ) ( not ( = ?auto_72323 ?auto_72327 ) ) ( not ( = ?auto_72323 ?auto_72325 ) ) ( not ( = ?auto_72324 ?auto_72326 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_72325 ?auto_72326 ?auto_72321 ?auto_72322 )
      ( GET-4IMAGE-VERIFY ?auto_72318 ?auto_72319 ?auto_72320 ?auto_72317 ?auto_72321 ?auto_72322 ?auto_72323 ?auto_72324 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_69703 - DIRECTION
      ?auto_69704 - MODE
      ?auto_69705 - DIRECTION
      ?auto_69702 - MODE
      ?auto_69706 - DIRECTION
      ?auto_69707 - MODE
      ?auto_69708 - DIRECTION
      ?auto_69709 - MODE
    )
    :vars
    (
      ?auto_69714 - INSTRUMENT
      ?auto_69710 - SATELLITE
      ?auto_69712 - DIRECTION
      ?auto_69713 - DIRECTION
      ?auto_69711 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_69714 ?auto_69710 ) ( SUPPORTS ?auto_69714 ?auto_69702 ) ( not ( = ?auto_69705 ?auto_69712 ) ) ( HAVE_IMAGE ?auto_69706 ?auto_69709 ) ( not ( = ?auto_69706 ?auto_69705 ) ) ( not ( = ?auto_69706 ?auto_69712 ) ) ( not ( = ?auto_69709 ?auto_69702 ) ) ( CALIBRATION_TARGET ?auto_69714 ?auto_69712 ) ( not ( = ?auto_69712 ?auto_69713 ) ) ( not ( = ?auto_69705 ?auto_69713 ) ) ( not ( = ?auto_69706 ?auto_69713 ) ) ( ON_BOARD ?auto_69711 ?auto_69710 ) ( POWER_ON ?auto_69711 ) ( not ( = ?auto_69714 ?auto_69711 ) ) ( POINTING ?auto_69710 ?auto_69712 ) ( HAVE_IMAGE ?auto_69703 ?auto_69704 ) ( HAVE_IMAGE ?auto_69706 ?auto_69707 ) ( HAVE_IMAGE ?auto_69708 ?auto_69709 ) ( not ( = ?auto_69703 ?auto_69705 ) ) ( not ( = ?auto_69703 ?auto_69706 ) ) ( not ( = ?auto_69703 ?auto_69708 ) ) ( not ( = ?auto_69703 ?auto_69712 ) ) ( not ( = ?auto_69703 ?auto_69713 ) ) ( not ( = ?auto_69704 ?auto_69702 ) ) ( not ( = ?auto_69704 ?auto_69707 ) ) ( not ( = ?auto_69704 ?auto_69709 ) ) ( not ( = ?auto_69705 ?auto_69708 ) ) ( not ( = ?auto_69702 ?auto_69707 ) ) ( not ( = ?auto_69706 ?auto_69708 ) ) ( not ( = ?auto_69707 ?auto_69709 ) ) ( not ( = ?auto_69708 ?auto_69712 ) ) ( not ( = ?auto_69708 ?auto_69713 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_69706 ?auto_69709 ?auto_69705 ?auto_69702 )
      ( GET-4IMAGE-VERIFY ?auto_69703 ?auto_69704 ?auto_69705 ?auto_69702 ?auto_69706 ?auto_69707 ?auto_69708 ?auto_69709 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_72514 - DIRECTION
      ?auto_72515 - MODE
      ?auto_72516 - DIRECTION
      ?auto_72513 - MODE
      ?auto_72517 - DIRECTION
      ?auto_72518 - MODE
      ?auto_72519 - DIRECTION
      ?auto_72520 - MODE
    )
    :vars
    (
      ?auto_72524 - INSTRUMENT
      ?auto_72525 - SATELLITE
      ?auto_72523 - DIRECTION
      ?auto_72521 - DIRECTION
      ?auto_72522 - MODE
      ?auto_72526 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_72524 ?auto_72525 ) ( SUPPORTS ?auto_72524 ?auto_72513 ) ( not ( = ?auto_72516 ?auto_72523 ) ) ( HAVE_IMAGE ?auto_72521 ?auto_72522 ) ( not ( = ?auto_72521 ?auto_72516 ) ) ( not ( = ?auto_72521 ?auto_72523 ) ) ( not ( = ?auto_72522 ?auto_72513 ) ) ( CALIBRATION_TARGET ?auto_72524 ?auto_72523 ) ( not ( = ?auto_72523 ?auto_72519 ) ) ( not ( = ?auto_72516 ?auto_72519 ) ) ( not ( = ?auto_72521 ?auto_72519 ) ) ( ON_BOARD ?auto_72526 ?auto_72525 ) ( POWER_ON ?auto_72526 ) ( not ( = ?auto_72524 ?auto_72526 ) ) ( POINTING ?auto_72525 ?auto_72523 ) ( HAVE_IMAGE ?auto_72514 ?auto_72515 ) ( HAVE_IMAGE ?auto_72517 ?auto_72518 ) ( HAVE_IMAGE ?auto_72519 ?auto_72520 ) ( not ( = ?auto_72514 ?auto_72516 ) ) ( not ( = ?auto_72514 ?auto_72517 ) ) ( not ( = ?auto_72514 ?auto_72519 ) ) ( not ( = ?auto_72514 ?auto_72523 ) ) ( not ( = ?auto_72514 ?auto_72521 ) ) ( not ( = ?auto_72515 ?auto_72513 ) ) ( not ( = ?auto_72515 ?auto_72518 ) ) ( not ( = ?auto_72515 ?auto_72520 ) ) ( not ( = ?auto_72515 ?auto_72522 ) ) ( not ( = ?auto_72516 ?auto_72517 ) ) ( not ( = ?auto_72513 ?auto_72518 ) ) ( not ( = ?auto_72513 ?auto_72520 ) ) ( not ( = ?auto_72517 ?auto_72519 ) ) ( not ( = ?auto_72517 ?auto_72523 ) ) ( not ( = ?auto_72517 ?auto_72521 ) ) ( not ( = ?auto_72518 ?auto_72520 ) ) ( not ( = ?auto_72518 ?auto_72522 ) ) ( not ( = ?auto_72520 ?auto_72522 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_72521 ?auto_72522 ?auto_72516 ?auto_72513 )
      ( GET-4IMAGE-VERIFY ?auto_72514 ?auto_72515 ?auto_72516 ?auto_72513 ?auto_72517 ?auto_72518 ?auto_72519 ?auto_72520 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_70417 - DIRECTION
      ?auto_70418 - MODE
      ?auto_70419 - DIRECTION
      ?auto_70416 - MODE
      ?auto_70420 - DIRECTION
      ?auto_70421 - MODE
      ?auto_70422 - DIRECTION
      ?auto_70423 - MODE
    )
    :vars
    (
      ?auto_70428 - INSTRUMENT
      ?auto_70424 - SATELLITE
      ?auto_70426 - DIRECTION
      ?auto_70427 - DIRECTION
      ?auto_70425 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_70428 ?auto_70424 ) ( SUPPORTS ?auto_70428 ?auto_70418 ) ( not ( = ?auto_70417 ?auto_70426 ) ) ( HAVE_IMAGE ?auto_70420 ?auto_70416 ) ( not ( = ?auto_70420 ?auto_70417 ) ) ( not ( = ?auto_70420 ?auto_70426 ) ) ( not ( = ?auto_70416 ?auto_70418 ) ) ( CALIBRATION_TARGET ?auto_70428 ?auto_70426 ) ( not ( = ?auto_70426 ?auto_70427 ) ) ( not ( = ?auto_70417 ?auto_70427 ) ) ( not ( = ?auto_70420 ?auto_70427 ) ) ( ON_BOARD ?auto_70425 ?auto_70424 ) ( POWER_ON ?auto_70425 ) ( not ( = ?auto_70428 ?auto_70425 ) ) ( POINTING ?auto_70424 ?auto_70426 ) ( HAVE_IMAGE ?auto_70419 ?auto_70416 ) ( HAVE_IMAGE ?auto_70420 ?auto_70421 ) ( HAVE_IMAGE ?auto_70422 ?auto_70423 ) ( not ( = ?auto_70417 ?auto_70419 ) ) ( not ( = ?auto_70417 ?auto_70422 ) ) ( not ( = ?auto_70418 ?auto_70421 ) ) ( not ( = ?auto_70418 ?auto_70423 ) ) ( not ( = ?auto_70419 ?auto_70420 ) ) ( not ( = ?auto_70419 ?auto_70422 ) ) ( not ( = ?auto_70419 ?auto_70426 ) ) ( not ( = ?auto_70419 ?auto_70427 ) ) ( not ( = ?auto_70416 ?auto_70421 ) ) ( not ( = ?auto_70416 ?auto_70423 ) ) ( not ( = ?auto_70420 ?auto_70422 ) ) ( not ( = ?auto_70421 ?auto_70423 ) ) ( not ( = ?auto_70422 ?auto_70426 ) ) ( not ( = ?auto_70422 ?auto_70427 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_70420 ?auto_70416 ?auto_70417 ?auto_70418 )
      ( GET-4IMAGE-VERIFY ?auto_70417 ?auto_70418 ?auto_70419 ?auto_70416 ?auto_70420 ?auto_70421 ?auto_70422 ?auto_70423 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_73366 - DIRECTION
      ?auto_73367 - MODE
      ?auto_73368 - DIRECTION
      ?auto_73365 - MODE
      ?auto_73369 - DIRECTION
      ?auto_73370 - MODE
      ?auto_73371 - DIRECTION
      ?auto_73372 - MODE
    )
    :vars
    (
      ?auto_73374 - INSTRUMENT
      ?auto_73375 - SATELLITE
      ?auto_73373 - DIRECTION
      ?auto_73376 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_73374 ?auto_73375 ) ( SUPPORTS ?auto_73374 ?auto_73367 ) ( not ( = ?auto_73366 ?auto_73373 ) ) ( HAVE_IMAGE ?auto_73371 ?auto_73372 ) ( not ( = ?auto_73371 ?auto_73366 ) ) ( not ( = ?auto_73371 ?auto_73373 ) ) ( not ( = ?auto_73372 ?auto_73367 ) ) ( CALIBRATION_TARGET ?auto_73374 ?auto_73373 ) ( not ( = ?auto_73373 ?auto_73368 ) ) ( not ( = ?auto_73366 ?auto_73368 ) ) ( not ( = ?auto_73371 ?auto_73368 ) ) ( ON_BOARD ?auto_73376 ?auto_73375 ) ( POWER_ON ?auto_73376 ) ( not ( = ?auto_73374 ?auto_73376 ) ) ( POINTING ?auto_73375 ?auto_73373 ) ( HAVE_IMAGE ?auto_73368 ?auto_73365 ) ( HAVE_IMAGE ?auto_73369 ?auto_73370 ) ( not ( = ?auto_73366 ?auto_73369 ) ) ( not ( = ?auto_73367 ?auto_73365 ) ) ( not ( = ?auto_73367 ?auto_73370 ) ) ( not ( = ?auto_73368 ?auto_73369 ) ) ( not ( = ?auto_73365 ?auto_73370 ) ) ( not ( = ?auto_73365 ?auto_73372 ) ) ( not ( = ?auto_73369 ?auto_73371 ) ) ( not ( = ?auto_73369 ?auto_73373 ) ) ( not ( = ?auto_73370 ?auto_73372 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_73371 ?auto_73372 ?auto_73366 ?auto_73367 )
      ( GET-4IMAGE-VERIFY ?auto_73366 ?auto_73367 ?auto_73368 ?auto_73365 ?auto_73369 ?auto_73370 ?auto_73371 ?auto_73372 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_70605 - DIRECTION
      ?auto_70606 - MODE
      ?auto_70607 - DIRECTION
      ?auto_70604 - MODE
      ?auto_70608 - DIRECTION
      ?auto_70609 - MODE
      ?auto_70610 - DIRECTION
      ?auto_70611 - MODE
    )
    :vars
    (
      ?auto_70616 - INSTRUMENT
      ?auto_70612 - SATELLITE
      ?auto_70614 - DIRECTION
      ?auto_70615 - DIRECTION
      ?auto_70613 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_70616 ?auto_70612 ) ( SUPPORTS ?auto_70616 ?auto_70606 ) ( not ( = ?auto_70605 ?auto_70614 ) ) ( HAVE_IMAGE ?auto_70608 ?auto_70611 ) ( not ( = ?auto_70608 ?auto_70605 ) ) ( not ( = ?auto_70608 ?auto_70614 ) ) ( not ( = ?auto_70611 ?auto_70606 ) ) ( CALIBRATION_TARGET ?auto_70616 ?auto_70614 ) ( not ( = ?auto_70614 ?auto_70615 ) ) ( not ( = ?auto_70605 ?auto_70615 ) ) ( not ( = ?auto_70608 ?auto_70615 ) ) ( ON_BOARD ?auto_70613 ?auto_70612 ) ( POWER_ON ?auto_70613 ) ( not ( = ?auto_70616 ?auto_70613 ) ) ( POINTING ?auto_70612 ?auto_70614 ) ( HAVE_IMAGE ?auto_70607 ?auto_70604 ) ( HAVE_IMAGE ?auto_70608 ?auto_70609 ) ( HAVE_IMAGE ?auto_70610 ?auto_70611 ) ( not ( = ?auto_70605 ?auto_70607 ) ) ( not ( = ?auto_70605 ?auto_70610 ) ) ( not ( = ?auto_70606 ?auto_70604 ) ) ( not ( = ?auto_70606 ?auto_70609 ) ) ( not ( = ?auto_70607 ?auto_70608 ) ) ( not ( = ?auto_70607 ?auto_70610 ) ) ( not ( = ?auto_70607 ?auto_70614 ) ) ( not ( = ?auto_70607 ?auto_70615 ) ) ( not ( = ?auto_70604 ?auto_70609 ) ) ( not ( = ?auto_70604 ?auto_70611 ) ) ( not ( = ?auto_70608 ?auto_70610 ) ) ( not ( = ?auto_70609 ?auto_70611 ) ) ( not ( = ?auto_70610 ?auto_70614 ) ) ( not ( = ?auto_70610 ?auto_70615 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_70608 ?auto_70611 ?auto_70605 ?auto_70606 )
      ( GET-4IMAGE-VERIFY ?auto_70605 ?auto_70606 ?auto_70607 ?auto_70604 ?auto_70608 ?auto_70609 ?auto_70610 ?auto_70611 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_73178 - DIRECTION
      ?auto_73179 - MODE
      ?auto_73180 - DIRECTION
      ?auto_73177 - MODE
      ?auto_73181 - DIRECTION
      ?auto_73182 - MODE
      ?auto_73183 - DIRECTION
      ?auto_73184 - MODE
    )
    :vars
    (
      ?auto_73186 - INSTRUMENT
      ?auto_73187 - SATELLITE
      ?auto_73185 - DIRECTION
      ?auto_73188 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_73186 ?auto_73187 ) ( SUPPORTS ?auto_73186 ?auto_73179 ) ( not ( = ?auto_73178 ?auto_73185 ) ) ( HAVE_IMAGE ?auto_73181 ?auto_73182 ) ( not ( = ?auto_73181 ?auto_73178 ) ) ( not ( = ?auto_73181 ?auto_73185 ) ) ( not ( = ?auto_73182 ?auto_73179 ) ) ( CALIBRATION_TARGET ?auto_73186 ?auto_73185 ) ( not ( = ?auto_73185 ?auto_73183 ) ) ( not ( = ?auto_73178 ?auto_73183 ) ) ( not ( = ?auto_73181 ?auto_73183 ) ) ( ON_BOARD ?auto_73188 ?auto_73187 ) ( POWER_ON ?auto_73188 ) ( not ( = ?auto_73186 ?auto_73188 ) ) ( POINTING ?auto_73187 ?auto_73185 ) ( HAVE_IMAGE ?auto_73180 ?auto_73177 ) ( HAVE_IMAGE ?auto_73183 ?auto_73184 ) ( not ( = ?auto_73178 ?auto_73180 ) ) ( not ( = ?auto_73179 ?auto_73177 ) ) ( not ( = ?auto_73179 ?auto_73184 ) ) ( not ( = ?auto_73180 ?auto_73181 ) ) ( not ( = ?auto_73180 ?auto_73183 ) ) ( not ( = ?auto_73180 ?auto_73185 ) ) ( not ( = ?auto_73177 ?auto_73182 ) ) ( not ( = ?auto_73177 ?auto_73184 ) ) ( not ( = ?auto_73182 ?auto_73184 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_73181 ?auto_73182 ?auto_73178 ?auto_73179 )
      ( GET-4IMAGE-VERIFY ?auto_73178 ?auto_73179 ?auto_73180 ?auto_73177 ?auto_73181 ?auto_73182 ?auto_73183 ?auto_73184 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_73426 - DIRECTION
      ?auto_73427 - MODE
      ?auto_73428 - DIRECTION
      ?auto_73425 - MODE
      ?auto_73429 - DIRECTION
      ?auto_73430 - MODE
      ?auto_73431 - DIRECTION
      ?auto_73432 - MODE
    )
    :vars
    (
      ?auto_73436 - INSTRUMENT
      ?auto_73437 - SATELLITE
      ?auto_73435 - DIRECTION
      ?auto_73433 - DIRECTION
      ?auto_73434 - MODE
      ?auto_73438 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_73436 ?auto_73437 ) ( SUPPORTS ?auto_73436 ?auto_73427 ) ( not ( = ?auto_73426 ?auto_73435 ) ) ( HAVE_IMAGE ?auto_73433 ?auto_73434 ) ( not ( = ?auto_73433 ?auto_73426 ) ) ( not ( = ?auto_73433 ?auto_73435 ) ) ( not ( = ?auto_73434 ?auto_73427 ) ) ( CALIBRATION_TARGET ?auto_73436 ?auto_73435 ) ( not ( = ?auto_73435 ?auto_73431 ) ) ( not ( = ?auto_73426 ?auto_73431 ) ) ( not ( = ?auto_73433 ?auto_73431 ) ) ( ON_BOARD ?auto_73438 ?auto_73437 ) ( POWER_ON ?auto_73438 ) ( not ( = ?auto_73436 ?auto_73438 ) ) ( POINTING ?auto_73437 ?auto_73435 ) ( HAVE_IMAGE ?auto_73428 ?auto_73425 ) ( HAVE_IMAGE ?auto_73429 ?auto_73430 ) ( HAVE_IMAGE ?auto_73431 ?auto_73432 ) ( not ( = ?auto_73426 ?auto_73428 ) ) ( not ( = ?auto_73426 ?auto_73429 ) ) ( not ( = ?auto_73427 ?auto_73425 ) ) ( not ( = ?auto_73427 ?auto_73430 ) ) ( not ( = ?auto_73427 ?auto_73432 ) ) ( not ( = ?auto_73428 ?auto_73429 ) ) ( not ( = ?auto_73428 ?auto_73431 ) ) ( not ( = ?auto_73428 ?auto_73435 ) ) ( not ( = ?auto_73428 ?auto_73433 ) ) ( not ( = ?auto_73425 ?auto_73430 ) ) ( not ( = ?auto_73425 ?auto_73432 ) ) ( not ( = ?auto_73425 ?auto_73434 ) ) ( not ( = ?auto_73429 ?auto_73431 ) ) ( not ( = ?auto_73429 ?auto_73435 ) ) ( not ( = ?auto_73429 ?auto_73433 ) ) ( not ( = ?auto_73430 ?auto_73432 ) ) ( not ( = ?auto_73430 ?auto_73434 ) ) ( not ( = ?auto_73432 ?auto_73434 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_73433 ?auto_73434 ?auto_73426 ?auto_73427 )
      ( GET-4IMAGE-VERIFY ?auto_73426 ?auto_73427 ?auto_73428 ?auto_73425 ?auto_73429 ?auto_73430 ?auto_73431 ?auto_73432 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_71304 - DIRECTION
      ?auto_71305 - MODE
      ?auto_71306 - DIRECTION
      ?auto_71303 - MODE
      ?auto_71307 - DIRECTION
      ?auto_71308 - MODE
    )
    :vars
    (
      ?auto_71310 - INSTRUMENT
      ?auto_71311 - SATELLITE
      ?auto_71309 - DIRECTION
      ?auto_71312 - DIRECTION
      ?auto_71313 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_71310 ?auto_71311 ) ( SUPPORTS ?auto_71310 ?auto_71308 ) ( not ( = ?auto_71307 ?auto_71309 ) ) ( HAVE_IMAGE ?auto_71304 ?auto_71303 ) ( not ( = ?auto_71304 ?auto_71307 ) ) ( not ( = ?auto_71304 ?auto_71309 ) ) ( not ( = ?auto_71303 ?auto_71308 ) ) ( CALIBRATION_TARGET ?auto_71310 ?auto_71309 ) ( not ( = ?auto_71309 ?auto_71312 ) ) ( not ( = ?auto_71307 ?auto_71312 ) ) ( not ( = ?auto_71304 ?auto_71312 ) ) ( ON_BOARD ?auto_71313 ?auto_71311 ) ( POWER_ON ?auto_71313 ) ( not ( = ?auto_71310 ?auto_71313 ) ) ( POINTING ?auto_71311 ?auto_71309 ) ( HAVE_IMAGE ?auto_71304 ?auto_71305 ) ( HAVE_IMAGE ?auto_71306 ?auto_71303 ) ( not ( = ?auto_71304 ?auto_71306 ) ) ( not ( = ?auto_71305 ?auto_71303 ) ) ( not ( = ?auto_71305 ?auto_71308 ) ) ( not ( = ?auto_71306 ?auto_71307 ) ) ( not ( = ?auto_71306 ?auto_71309 ) ) ( not ( = ?auto_71306 ?auto_71312 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_71304 ?auto_71303 ?auto_71307 ?auto_71308 )
      ( GET-3IMAGE-VERIFY ?auto_71304 ?auto_71305 ?auto_71306 ?auto_71303 ?auto_71307 ?auto_71308 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_73216 - DIRECTION
      ?auto_73217 - MODE
      ?auto_73218 - DIRECTION
      ?auto_73215 - MODE
      ?auto_73219 - DIRECTION
      ?auto_73220 - MODE
      ?auto_73221 - DIRECTION
      ?auto_73222 - MODE
    )
    :vars
    (
      ?auto_73224 - INSTRUMENT
      ?auto_73225 - SATELLITE
      ?auto_73223 - DIRECTION
      ?auto_73226 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_73224 ?auto_73225 ) ( SUPPORTS ?auto_73224 ?auto_73217 ) ( not ( = ?auto_73216 ?auto_73223 ) ) ( HAVE_IMAGE ?auto_73218 ?auto_73222 ) ( not ( = ?auto_73218 ?auto_73216 ) ) ( not ( = ?auto_73218 ?auto_73223 ) ) ( not ( = ?auto_73222 ?auto_73217 ) ) ( CALIBRATION_TARGET ?auto_73224 ?auto_73223 ) ( not ( = ?auto_73223 ?auto_73219 ) ) ( not ( = ?auto_73216 ?auto_73219 ) ) ( not ( = ?auto_73218 ?auto_73219 ) ) ( ON_BOARD ?auto_73226 ?auto_73225 ) ( POWER_ON ?auto_73226 ) ( not ( = ?auto_73224 ?auto_73226 ) ) ( POINTING ?auto_73225 ?auto_73223 ) ( HAVE_IMAGE ?auto_73218 ?auto_73215 ) ( HAVE_IMAGE ?auto_73219 ?auto_73220 ) ( HAVE_IMAGE ?auto_73221 ?auto_73222 ) ( not ( = ?auto_73216 ?auto_73221 ) ) ( not ( = ?auto_73217 ?auto_73215 ) ) ( not ( = ?auto_73217 ?auto_73220 ) ) ( not ( = ?auto_73218 ?auto_73221 ) ) ( not ( = ?auto_73215 ?auto_73220 ) ) ( not ( = ?auto_73215 ?auto_73222 ) ) ( not ( = ?auto_73219 ?auto_73221 ) ) ( not ( = ?auto_73220 ?auto_73222 ) ) ( not ( = ?auto_73221 ?auto_73223 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_73218 ?auto_73222 ?auto_73216 ?auto_73217 )
      ( GET-4IMAGE-VERIFY ?auto_73216 ?auto_73217 ?auto_73218 ?auto_73215 ?auto_73219 ?auto_73220 ?auto_73221 ?auto_73222 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_74256 - DIRECTION
      ?auto_74257 - MODE
      ?auto_74258 - DIRECTION
      ?auto_74255 - MODE
      ?auto_74259 - DIRECTION
      ?auto_74260 - MODE
    )
    :vars
    (
      ?auto_74263 - INSTRUMENT
      ?auto_74261 - SATELLITE
      ?auto_74262 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_74263 ?auto_74261 ) ( SUPPORTS ?auto_74263 ?auto_74257 ) ( POINTING ?auto_74261 ?auto_74262 ) ( not ( = ?auto_74256 ?auto_74262 ) ) ( HAVE_IMAGE ?auto_74259 ?auto_74255 ) ( not ( = ?auto_74259 ?auto_74256 ) ) ( not ( = ?auto_74259 ?auto_74262 ) ) ( not ( = ?auto_74255 ?auto_74257 ) ) ( CALIBRATION_TARGET ?auto_74263 ?auto_74262 ) ( POWER_AVAIL ?auto_74261 ) ( HAVE_IMAGE ?auto_74258 ?auto_74255 ) ( HAVE_IMAGE ?auto_74259 ?auto_74260 ) ( not ( = ?auto_74256 ?auto_74258 ) ) ( not ( = ?auto_74257 ?auto_74260 ) ) ( not ( = ?auto_74258 ?auto_74259 ) ) ( not ( = ?auto_74258 ?auto_74262 ) ) ( not ( = ?auto_74255 ?auto_74260 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_74259 ?auto_74255 ?auto_74256 ?auto_74257 )
      ( GET-3IMAGE-VERIFY ?auto_74256 ?auto_74257 ?auto_74258 ?auto_74255 ?auto_74259 ?auto_74260 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_74412 - DIRECTION
      ?auto_74413 - MODE
      ?auto_74414 - DIRECTION
      ?auto_74411 - MODE
      ?auto_74415 - DIRECTION
      ?auto_74416 - MODE
      ?auto_74417 - DIRECTION
      ?auto_74418 - MODE
    )
    :vars
    (
      ?auto_74421 - INSTRUMENT
      ?auto_74419 - SATELLITE
      ?auto_74420 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_74421 ?auto_74419 ) ( SUPPORTS ?auto_74421 ?auto_74418 ) ( POINTING ?auto_74419 ?auto_74420 ) ( not ( = ?auto_74417 ?auto_74420 ) ) ( HAVE_IMAGE ?auto_74412 ?auto_74416 ) ( not ( = ?auto_74412 ?auto_74417 ) ) ( not ( = ?auto_74412 ?auto_74420 ) ) ( not ( = ?auto_74416 ?auto_74418 ) ) ( CALIBRATION_TARGET ?auto_74421 ?auto_74420 ) ( POWER_AVAIL ?auto_74419 ) ( HAVE_IMAGE ?auto_74412 ?auto_74413 ) ( HAVE_IMAGE ?auto_74414 ?auto_74411 ) ( HAVE_IMAGE ?auto_74415 ?auto_74416 ) ( not ( = ?auto_74412 ?auto_74414 ) ) ( not ( = ?auto_74412 ?auto_74415 ) ) ( not ( = ?auto_74413 ?auto_74411 ) ) ( not ( = ?auto_74413 ?auto_74416 ) ) ( not ( = ?auto_74413 ?auto_74418 ) ) ( not ( = ?auto_74414 ?auto_74415 ) ) ( not ( = ?auto_74414 ?auto_74417 ) ) ( not ( = ?auto_74414 ?auto_74420 ) ) ( not ( = ?auto_74411 ?auto_74416 ) ) ( not ( = ?auto_74411 ?auto_74418 ) ) ( not ( = ?auto_74415 ?auto_74417 ) ) ( not ( = ?auto_74415 ?auto_74420 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_74412 ?auto_74416 ?auto_74417 ?auto_74418 )
      ( GET-4IMAGE-VERIFY ?auto_74412 ?auto_74413 ?auto_74414 ?auto_74411 ?auto_74415 ?auto_74416 ?auto_74417 ?auto_74418 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_74852 - DIRECTION
      ?auto_74853 - MODE
      ?auto_74854 - DIRECTION
      ?auto_74851 - MODE
      ?auto_74855 - DIRECTION
      ?auto_74856 - MODE
      ?auto_74857 - DIRECTION
      ?auto_74858 - MODE
    )
    :vars
    (
      ?auto_74861 - INSTRUMENT
      ?auto_74859 - SATELLITE
      ?auto_74860 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_74861 ?auto_74859 ) ( SUPPORTS ?auto_74861 ?auto_74856 ) ( POINTING ?auto_74859 ?auto_74860 ) ( not ( = ?auto_74855 ?auto_74860 ) ) ( HAVE_IMAGE ?auto_74857 ?auto_74851 ) ( not ( = ?auto_74857 ?auto_74855 ) ) ( not ( = ?auto_74857 ?auto_74860 ) ) ( not ( = ?auto_74851 ?auto_74856 ) ) ( CALIBRATION_TARGET ?auto_74861 ?auto_74860 ) ( POWER_AVAIL ?auto_74859 ) ( HAVE_IMAGE ?auto_74852 ?auto_74853 ) ( HAVE_IMAGE ?auto_74854 ?auto_74851 ) ( HAVE_IMAGE ?auto_74857 ?auto_74858 ) ( not ( = ?auto_74852 ?auto_74854 ) ) ( not ( = ?auto_74852 ?auto_74855 ) ) ( not ( = ?auto_74852 ?auto_74857 ) ) ( not ( = ?auto_74852 ?auto_74860 ) ) ( not ( = ?auto_74853 ?auto_74851 ) ) ( not ( = ?auto_74853 ?auto_74856 ) ) ( not ( = ?auto_74853 ?auto_74858 ) ) ( not ( = ?auto_74854 ?auto_74855 ) ) ( not ( = ?auto_74854 ?auto_74857 ) ) ( not ( = ?auto_74854 ?auto_74860 ) ) ( not ( = ?auto_74851 ?auto_74858 ) ) ( not ( = ?auto_74856 ?auto_74858 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_74857 ?auto_74851 ?auto_74855 ?auto_74856 )
      ( GET-4IMAGE-VERIFY ?auto_74852 ?auto_74853 ?auto_74854 ?auto_74851 ?auto_74855 ?auto_74856 ?auto_74857 ?auto_74858 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_75885 - DIRECTION
      ?auto_75886 - MODE
      ?auto_75887 - DIRECTION
      ?auto_75884 - MODE
      ?auto_75888 - DIRECTION
      ?auto_75889 - MODE
      ?auto_75890 - DIRECTION
      ?auto_75891 - MODE
    )
    :vars
    (
      ?auto_75894 - INSTRUMENT
      ?auto_75892 - SATELLITE
      ?auto_75893 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_75894 ?auto_75892 ) ( SUPPORTS ?auto_75894 ?auto_75886 ) ( POINTING ?auto_75892 ?auto_75893 ) ( not ( = ?auto_75885 ?auto_75893 ) ) ( HAVE_IMAGE ?auto_75890 ?auto_75889 ) ( not ( = ?auto_75890 ?auto_75885 ) ) ( not ( = ?auto_75890 ?auto_75893 ) ) ( not ( = ?auto_75889 ?auto_75886 ) ) ( CALIBRATION_TARGET ?auto_75894 ?auto_75893 ) ( POWER_AVAIL ?auto_75892 ) ( HAVE_IMAGE ?auto_75887 ?auto_75884 ) ( HAVE_IMAGE ?auto_75888 ?auto_75889 ) ( HAVE_IMAGE ?auto_75890 ?auto_75891 ) ( not ( = ?auto_75885 ?auto_75887 ) ) ( not ( = ?auto_75885 ?auto_75888 ) ) ( not ( = ?auto_75886 ?auto_75884 ) ) ( not ( = ?auto_75886 ?auto_75891 ) ) ( not ( = ?auto_75887 ?auto_75888 ) ) ( not ( = ?auto_75887 ?auto_75890 ) ) ( not ( = ?auto_75887 ?auto_75893 ) ) ( not ( = ?auto_75884 ?auto_75889 ) ) ( not ( = ?auto_75884 ?auto_75891 ) ) ( not ( = ?auto_75888 ?auto_75890 ) ) ( not ( = ?auto_75888 ?auto_75893 ) ) ( not ( = ?auto_75889 ?auto_75891 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_75890 ?auto_75889 ?auto_75885 ?auto_75886 )
      ( GET-4IMAGE-VERIFY ?auto_75885 ?auto_75886 ?auto_75887 ?auto_75884 ?auto_75888 ?auto_75889 ?auto_75890 ?auto_75891 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_76515 - DIRECTION
      ?auto_76516 - MODE
      ?auto_76517 - DIRECTION
      ?auto_76514 - MODE
      ?auto_76518 - DIRECTION
      ?auto_76519 - MODE
    )
    :vars
    (
      ?auto_76522 - INSTRUMENT
      ?auto_76520 - SATELLITE
      ?auto_76523 - DIRECTION
      ?auto_76521 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_76522 ?auto_76520 ) ( SUPPORTS ?auto_76522 ?auto_76519 ) ( not ( = ?auto_76518 ?auto_76523 ) ) ( HAVE_IMAGE ?auto_76515 ?auto_76514 ) ( not ( = ?auto_76515 ?auto_76518 ) ) ( not ( = ?auto_76515 ?auto_76523 ) ) ( not ( = ?auto_76514 ?auto_76519 ) ) ( CALIBRATION_TARGET ?auto_76522 ?auto_76523 ) ( POWER_AVAIL ?auto_76520 ) ( POINTING ?auto_76520 ?auto_76521 ) ( not ( = ?auto_76523 ?auto_76521 ) ) ( not ( = ?auto_76518 ?auto_76521 ) ) ( not ( = ?auto_76515 ?auto_76521 ) ) ( HAVE_IMAGE ?auto_76515 ?auto_76516 ) ( HAVE_IMAGE ?auto_76517 ?auto_76514 ) ( not ( = ?auto_76515 ?auto_76517 ) ) ( not ( = ?auto_76516 ?auto_76514 ) ) ( not ( = ?auto_76516 ?auto_76519 ) ) ( not ( = ?auto_76517 ?auto_76518 ) ) ( not ( = ?auto_76517 ?auto_76523 ) ) ( not ( = ?auto_76517 ?auto_76521 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_76515 ?auto_76514 ?auto_76518 ?auto_76519 )
      ( GET-3IMAGE-VERIFY ?auto_76515 ?auto_76516 ?auto_76517 ?auto_76514 ?auto_76518 ?auto_76519 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_76980 - DIRECTION
      ?auto_76981 - MODE
      ?auto_76982 - DIRECTION
      ?auto_76979 - MODE
      ?auto_76983 - DIRECTION
      ?auto_76984 - MODE
      ?auto_76985 - DIRECTION
      ?auto_76986 - MODE
    )
    :vars
    (
      ?auto_76988 - INSTRUMENT
      ?auto_76987 - SATELLITE
      ?auto_76989 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_76988 ?auto_76987 ) ( SUPPORTS ?auto_76988 ?auto_76986 ) ( not ( = ?auto_76985 ?auto_76989 ) ) ( HAVE_IMAGE ?auto_76980 ?auto_76981 ) ( not ( = ?auto_76980 ?auto_76985 ) ) ( not ( = ?auto_76980 ?auto_76989 ) ) ( not ( = ?auto_76981 ?auto_76986 ) ) ( CALIBRATION_TARGET ?auto_76988 ?auto_76989 ) ( POWER_AVAIL ?auto_76987 ) ( POINTING ?auto_76987 ?auto_76982 ) ( not ( = ?auto_76989 ?auto_76982 ) ) ( not ( = ?auto_76985 ?auto_76982 ) ) ( not ( = ?auto_76980 ?auto_76982 ) ) ( HAVE_IMAGE ?auto_76982 ?auto_76979 ) ( HAVE_IMAGE ?auto_76983 ?auto_76984 ) ( not ( = ?auto_76980 ?auto_76983 ) ) ( not ( = ?auto_76981 ?auto_76979 ) ) ( not ( = ?auto_76981 ?auto_76984 ) ) ( not ( = ?auto_76982 ?auto_76983 ) ) ( not ( = ?auto_76979 ?auto_76984 ) ) ( not ( = ?auto_76979 ?auto_76986 ) ) ( not ( = ?auto_76983 ?auto_76985 ) ) ( not ( = ?auto_76983 ?auto_76989 ) ) ( not ( = ?auto_76984 ?auto_76986 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_76980 ?auto_76981 ?auto_76985 ?auto_76986 )
      ( GET-4IMAGE-VERIFY ?auto_76980 ?auto_76981 ?auto_76982 ?auto_76979 ?auto_76983 ?auto_76984 ?auto_76985 ?auto_76986 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_77002 - DIRECTION
      ?auto_77003 - MODE
      ?auto_77004 - DIRECTION
      ?auto_77001 - MODE
      ?auto_77005 - DIRECTION
      ?auto_77006 - MODE
      ?auto_77007 - DIRECTION
      ?auto_77008 - MODE
    )
    :vars
    (
      ?auto_77010 - INSTRUMENT
      ?auto_77009 - SATELLITE
      ?auto_77011 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_77010 ?auto_77009 ) ( SUPPORTS ?auto_77010 ?auto_77006 ) ( not ( = ?auto_77005 ?auto_77011 ) ) ( HAVE_IMAGE ?auto_77007 ?auto_77008 ) ( not ( = ?auto_77007 ?auto_77005 ) ) ( not ( = ?auto_77007 ?auto_77011 ) ) ( not ( = ?auto_77008 ?auto_77006 ) ) ( CALIBRATION_TARGET ?auto_77010 ?auto_77011 ) ( POWER_AVAIL ?auto_77009 ) ( POINTING ?auto_77009 ?auto_77004 ) ( not ( = ?auto_77011 ?auto_77004 ) ) ( not ( = ?auto_77005 ?auto_77004 ) ) ( not ( = ?auto_77007 ?auto_77004 ) ) ( HAVE_IMAGE ?auto_77002 ?auto_77003 ) ( HAVE_IMAGE ?auto_77004 ?auto_77001 ) ( not ( = ?auto_77002 ?auto_77004 ) ) ( not ( = ?auto_77002 ?auto_77005 ) ) ( not ( = ?auto_77002 ?auto_77007 ) ) ( not ( = ?auto_77002 ?auto_77011 ) ) ( not ( = ?auto_77003 ?auto_77001 ) ) ( not ( = ?auto_77003 ?auto_77006 ) ) ( not ( = ?auto_77003 ?auto_77008 ) ) ( not ( = ?auto_77001 ?auto_77006 ) ) ( not ( = ?auto_77001 ?auto_77008 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_77007 ?auto_77008 ?auto_77005 ?auto_77006 )
      ( GET-4IMAGE-VERIFY ?auto_77002 ?auto_77003 ?auto_77004 ?auto_77001 ?auto_77005 ?auto_77006 ?auto_77007 ?auto_77008 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_77128 - DIRECTION
      ?auto_77129 - MODE
      ?auto_77130 - DIRECTION
      ?auto_77127 - MODE
      ?auto_77131 - DIRECTION
      ?auto_77132 - MODE
      ?auto_77133 - DIRECTION
      ?auto_77134 - MODE
    )
    :vars
    (
      ?auto_77137 - INSTRUMENT
      ?auto_77135 - SATELLITE
      ?auto_77138 - DIRECTION
      ?auto_77136 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_77137 ?auto_77135 ) ( SUPPORTS ?auto_77137 ?auto_77127 ) ( not ( = ?auto_77130 ?auto_77138 ) ) ( HAVE_IMAGE ?auto_77131 ?auto_77129 ) ( not ( = ?auto_77131 ?auto_77130 ) ) ( not ( = ?auto_77131 ?auto_77138 ) ) ( not ( = ?auto_77129 ?auto_77127 ) ) ( CALIBRATION_TARGET ?auto_77137 ?auto_77138 ) ( POWER_AVAIL ?auto_77135 ) ( POINTING ?auto_77135 ?auto_77136 ) ( not ( = ?auto_77138 ?auto_77136 ) ) ( not ( = ?auto_77130 ?auto_77136 ) ) ( not ( = ?auto_77131 ?auto_77136 ) ) ( HAVE_IMAGE ?auto_77128 ?auto_77129 ) ( HAVE_IMAGE ?auto_77131 ?auto_77132 ) ( HAVE_IMAGE ?auto_77133 ?auto_77134 ) ( not ( = ?auto_77128 ?auto_77130 ) ) ( not ( = ?auto_77128 ?auto_77131 ) ) ( not ( = ?auto_77128 ?auto_77133 ) ) ( not ( = ?auto_77128 ?auto_77138 ) ) ( not ( = ?auto_77128 ?auto_77136 ) ) ( not ( = ?auto_77129 ?auto_77132 ) ) ( not ( = ?auto_77129 ?auto_77134 ) ) ( not ( = ?auto_77130 ?auto_77133 ) ) ( not ( = ?auto_77127 ?auto_77132 ) ) ( not ( = ?auto_77127 ?auto_77134 ) ) ( not ( = ?auto_77131 ?auto_77133 ) ) ( not ( = ?auto_77132 ?auto_77134 ) ) ( not ( = ?auto_77133 ?auto_77138 ) ) ( not ( = ?auto_77133 ?auto_77136 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_77131 ?auto_77129 ?auto_77130 ?auto_77127 )
      ( GET-4IMAGE-VERIFY ?auto_77128 ?auto_77129 ?auto_77130 ?auto_77127 ?auto_77131 ?auto_77132 ?auto_77133 ?auto_77134 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_77564 - DIRECTION
      ?auto_77565 - MODE
      ?auto_77566 - DIRECTION
      ?auto_77563 - MODE
      ?auto_77567 - DIRECTION
      ?auto_77568 - MODE
      ?auto_77569 - DIRECTION
      ?auto_77570 - MODE
    )
    :vars
    (
      ?auto_77572 - INSTRUMENT
      ?auto_77571 - SATELLITE
      ?auto_77573 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_77572 ?auto_77571 ) ( SUPPORTS ?auto_77572 ?auto_77563 ) ( not ( = ?auto_77566 ?auto_77573 ) ) ( HAVE_IMAGE ?auto_77569 ?auto_77568 ) ( not ( = ?auto_77569 ?auto_77566 ) ) ( not ( = ?auto_77569 ?auto_77573 ) ) ( not ( = ?auto_77568 ?auto_77563 ) ) ( CALIBRATION_TARGET ?auto_77572 ?auto_77573 ) ( POWER_AVAIL ?auto_77571 ) ( POINTING ?auto_77571 ?auto_77564 ) ( not ( = ?auto_77573 ?auto_77564 ) ) ( not ( = ?auto_77566 ?auto_77564 ) ) ( not ( = ?auto_77569 ?auto_77564 ) ) ( HAVE_IMAGE ?auto_77564 ?auto_77565 ) ( HAVE_IMAGE ?auto_77567 ?auto_77568 ) ( HAVE_IMAGE ?auto_77569 ?auto_77570 ) ( not ( = ?auto_77564 ?auto_77567 ) ) ( not ( = ?auto_77565 ?auto_77563 ) ) ( not ( = ?auto_77565 ?auto_77568 ) ) ( not ( = ?auto_77565 ?auto_77570 ) ) ( not ( = ?auto_77566 ?auto_77567 ) ) ( not ( = ?auto_77563 ?auto_77570 ) ) ( not ( = ?auto_77567 ?auto_77569 ) ) ( not ( = ?auto_77567 ?auto_77573 ) ) ( not ( = ?auto_77568 ?auto_77570 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_77569 ?auto_77568 ?auto_77566 ?auto_77563 )
      ( GET-4IMAGE-VERIFY ?auto_77564 ?auto_77565 ?auto_77566 ?auto_77563 ?auto_77567 ?auto_77568 ?auto_77569 ?auto_77570 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_79086 - DIRECTION
      ?auto_79087 - MODE
      ?auto_79088 - DIRECTION
      ?auto_79085 - MODE
      ?auto_79089 - DIRECTION
      ?auto_79090 - MODE
    )
    :vars
    (
      ?auto_79092 - INSTRUMENT
      ?auto_79093 - SATELLITE
      ?auto_79091 - DIRECTION
      ?auto_79095 - DIRECTION
      ?auto_79094 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_79092 ?auto_79093 ) ( SUPPORTS ?auto_79092 ?auto_79085 ) ( not ( = ?auto_79088 ?auto_79091 ) ) ( HAVE_IMAGE ?auto_79086 ?auto_79090 ) ( not ( = ?auto_79086 ?auto_79088 ) ) ( not ( = ?auto_79086 ?auto_79091 ) ) ( not ( = ?auto_79090 ?auto_79085 ) ) ( CALIBRATION_TARGET ?auto_79092 ?auto_79091 ) ( POINTING ?auto_79093 ?auto_79095 ) ( not ( = ?auto_79091 ?auto_79095 ) ) ( not ( = ?auto_79088 ?auto_79095 ) ) ( not ( = ?auto_79086 ?auto_79095 ) ) ( ON_BOARD ?auto_79094 ?auto_79093 ) ( POWER_ON ?auto_79094 ) ( not ( = ?auto_79092 ?auto_79094 ) ) ( HAVE_IMAGE ?auto_79086 ?auto_79087 ) ( HAVE_IMAGE ?auto_79089 ?auto_79090 ) ( not ( = ?auto_79086 ?auto_79089 ) ) ( not ( = ?auto_79087 ?auto_79085 ) ) ( not ( = ?auto_79087 ?auto_79090 ) ) ( not ( = ?auto_79088 ?auto_79089 ) ) ( not ( = ?auto_79089 ?auto_79091 ) ) ( not ( = ?auto_79089 ?auto_79095 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_79086 ?auto_79090 ?auto_79088 ?auto_79085 )
      ( GET-3IMAGE-VERIFY ?auto_79086 ?auto_79087 ?auto_79088 ?auto_79085 ?auto_79089 ?auto_79090 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_79550 - DIRECTION
      ?auto_79551 - MODE
      ?auto_79552 - DIRECTION
      ?auto_79549 - MODE
      ?auto_79553 - DIRECTION
      ?auto_79554 - MODE
      ?auto_79555 - DIRECTION
      ?auto_79556 - MODE
    )
    :vars
    (
      ?auto_79558 - INSTRUMENT
      ?auto_79559 - SATELLITE
      ?auto_79557 - DIRECTION
      ?auto_79560 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_79558 ?auto_79559 ) ( SUPPORTS ?auto_79558 ?auto_79556 ) ( not ( = ?auto_79555 ?auto_79557 ) ) ( HAVE_IMAGE ?auto_79550 ?auto_79554 ) ( not ( = ?auto_79550 ?auto_79555 ) ) ( not ( = ?auto_79550 ?auto_79557 ) ) ( not ( = ?auto_79554 ?auto_79556 ) ) ( CALIBRATION_TARGET ?auto_79558 ?auto_79557 ) ( POINTING ?auto_79559 ?auto_79552 ) ( not ( = ?auto_79557 ?auto_79552 ) ) ( not ( = ?auto_79555 ?auto_79552 ) ) ( not ( = ?auto_79550 ?auto_79552 ) ) ( ON_BOARD ?auto_79560 ?auto_79559 ) ( POWER_ON ?auto_79560 ) ( not ( = ?auto_79558 ?auto_79560 ) ) ( HAVE_IMAGE ?auto_79550 ?auto_79551 ) ( HAVE_IMAGE ?auto_79552 ?auto_79549 ) ( HAVE_IMAGE ?auto_79553 ?auto_79554 ) ( not ( = ?auto_79550 ?auto_79553 ) ) ( not ( = ?auto_79551 ?auto_79549 ) ) ( not ( = ?auto_79551 ?auto_79554 ) ) ( not ( = ?auto_79551 ?auto_79556 ) ) ( not ( = ?auto_79552 ?auto_79553 ) ) ( not ( = ?auto_79549 ?auto_79554 ) ) ( not ( = ?auto_79549 ?auto_79556 ) ) ( not ( = ?auto_79553 ?auto_79555 ) ) ( not ( = ?auto_79553 ?auto_79557 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_79550 ?auto_79554 ?auto_79555 ?auto_79556 )
      ( GET-4IMAGE-VERIFY ?auto_79550 ?auto_79551 ?auto_79552 ?auto_79549 ?auto_79553 ?auto_79554 ?auto_79555 ?auto_79556 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_79723 - DIRECTION
      ?auto_79724 - MODE
      ?auto_79725 - DIRECTION
      ?auto_79722 - MODE
      ?auto_79726 - DIRECTION
      ?auto_79727 - MODE
      ?auto_79728 - DIRECTION
      ?auto_79729 - MODE
    )
    :vars
    (
      ?auto_79731 - INSTRUMENT
      ?auto_79732 - SATELLITE
      ?auto_79730 - DIRECTION
      ?auto_79734 - DIRECTION
      ?auto_79733 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_79731 ?auto_79732 ) ( SUPPORTS ?auto_79731 ?auto_79722 ) ( not ( = ?auto_79725 ?auto_79730 ) ) ( HAVE_IMAGE ?auto_79726 ?auto_79724 ) ( not ( = ?auto_79726 ?auto_79725 ) ) ( not ( = ?auto_79726 ?auto_79730 ) ) ( not ( = ?auto_79724 ?auto_79722 ) ) ( CALIBRATION_TARGET ?auto_79731 ?auto_79730 ) ( POINTING ?auto_79732 ?auto_79734 ) ( not ( = ?auto_79730 ?auto_79734 ) ) ( not ( = ?auto_79725 ?auto_79734 ) ) ( not ( = ?auto_79726 ?auto_79734 ) ) ( ON_BOARD ?auto_79733 ?auto_79732 ) ( POWER_ON ?auto_79733 ) ( not ( = ?auto_79731 ?auto_79733 ) ) ( HAVE_IMAGE ?auto_79723 ?auto_79724 ) ( HAVE_IMAGE ?auto_79726 ?auto_79727 ) ( HAVE_IMAGE ?auto_79728 ?auto_79729 ) ( not ( = ?auto_79723 ?auto_79725 ) ) ( not ( = ?auto_79723 ?auto_79726 ) ) ( not ( = ?auto_79723 ?auto_79728 ) ) ( not ( = ?auto_79723 ?auto_79730 ) ) ( not ( = ?auto_79723 ?auto_79734 ) ) ( not ( = ?auto_79724 ?auto_79727 ) ) ( not ( = ?auto_79724 ?auto_79729 ) ) ( not ( = ?auto_79725 ?auto_79728 ) ) ( not ( = ?auto_79722 ?auto_79727 ) ) ( not ( = ?auto_79722 ?auto_79729 ) ) ( not ( = ?auto_79726 ?auto_79728 ) ) ( not ( = ?auto_79727 ?auto_79729 ) ) ( not ( = ?auto_79728 ?auto_79730 ) ) ( not ( = ?auto_79728 ?auto_79734 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_79726 ?auto_79724 ?auto_79725 ?auto_79722 )
      ( GET-4IMAGE-VERIFY ?auto_79723 ?auto_79724 ?auto_79725 ?auto_79722 ?auto_79726 ?auto_79727 ?auto_79728 ?auto_79729 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_79736 - DIRECTION
      ?auto_79737 - MODE
      ?auto_79738 - DIRECTION
      ?auto_79735 - MODE
      ?auto_79739 - DIRECTION
      ?auto_79740 - MODE
      ?auto_79741 - DIRECTION
      ?auto_79742 - MODE
    )
    :vars
    (
      ?auto_79744 - INSTRUMENT
      ?auto_79745 - SATELLITE
      ?auto_79743 - DIRECTION
      ?auto_79746 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_79744 ?auto_79745 ) ( SUPPORTS ?auto_79744 ?auto_79735 ) ( not ( = ?auto_79738 ?auto_79743 ) ) ( HAVE_IMAGE ?auto_79736 ?auto_79740 ) ( not ( = ?auto_79736 ?auto_79738 ) ) ( not ( = ?auto_79736 ?auto_79743 ) ) ( not ( = ?auto_79740 ?auto_79735 ) ) ( CALIBRATION_TARGET ?auto_79744 ?auto_79743 ) ( POINTING ?auto_79745 ?auto_79741 ) ( not ( = ?auto_79743 ?auto_79741 ) ) ( not ( = ?auto_79738 ?auto_79741 ) ) ( not ( = ?auto_79736 ?auto_79741 ) ) ( ON_BOARD ?auto_79746 ?auto_79745 ) ( POWER_ON ?auto_79746 ) ( not ( = ?auto_79744 ?auto_79746 ) ) ( HAVE_IMAGE ?auto_79736 ?auto_79737 ) ( HAVE_IMAGE ?auto_79739 ?auto_79740 ) ( HAVE_IMAGE ?auto_79741 ?auto_79742 ) ( not ( = ?auto_79736 ?auto_79739 ) ) ( not ( = ?auto_79737 ?auto_79735 ) ) ( not ( = ?auto_79737 ?auto_79740 ) ) ( not ( = ?auto_79737 ?auto_79742 ) ) ( not ( = ?auto_79738 ?auto_79739 ) ) ( not ( = ?auto_79735 ?auto_79742 ) ) ( not ( = ?auto_79739 ?auto_79741 ) ) ( not ( = ?auto_79739 ?auto_79743 ) ) ( not ( = ?auto_79740 ?auto_79742 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_79736 ?auto_79740 ?auto_79738 ?auto_79735 )
      ( GET-4IMAGE-VERIFY ?auto_79736 ?auto_79737 ?auto_79738 ?auto_79735 ?auto_79739 ?auto_79740 ?auto_79741 ?auto_79742 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_79786 - DIRECTION
      ?auto_79787 - MODE
      ?auto_79788 - DIRECTION
      ?auto_79785 - MODE
      ?auto_79789 - DIRECTION
      ?auto_79790 - MODE
      ?auto_79791 - DIRECTION
      ?auto_79792 - MODE
    )
    :vars
    (
      ?auto_79794 - INSTRUMENT
      ?auto_79795 - SATELLITE
      ?auto_79793 - DIRECTION
      ?auto_79796 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_79794 ?auto_79795 ) ( SUPPORTS ?auto_79794 ?auto_79785 ) ( not ( = ?auto_79788 ?auto_79793 ) ) ( HAVE_IMAGE ?auto_79786 ?auto_79787 ) ( not ( = ?auto_79786 ?auto_79788 ) ) ( not ( = ?auto_79786 ?auto_79793 ) ) ( not ( = ?auto_79787 ?auto_79785 ) ) ( CALIBRATION_TARGET ?auto_79794 ?auto_79793 ) ( POINTING ?auto_79795 ?auto_79791 ) ( not ( = ?auto_79793 ?auto_79791 ) ) ( not ( = ?auto_79788 ?auto_79791 ) ) ( not ( = ?auto_79786 ?auto_79791 ) ) ( ON_BOARD ?auto_79796 ?auto_79795 ) ( POWER_ON ?auto_79796 ) ( not ( = ?auto_79794 ?auto_79796 ) ) ( HAVE_IMAGE ?auto_79789 ?auto_79790 ) ( HAVE_IMAGE ?auto_79791 ?auto_79792 ) ( not ( = ?auto_79786 ?auto_79789 ) ) ( not ( = ?auto_79787 ?auto_79790 ) ) ( not ( = ?auto_79787 ?auto_79792 ) ) ( not ( = ?auto_79788 ?auto_79789 ) ) ( not ( = ?auto_79785 ?auto_79790 ) ) ( not ( = ?auto_79785 ?auto_79792 ) ) ( not ( = ?auto_79789 ?auto_79791 ) ) ( not ( = ?auto_79789 ?auto_79793 ) ) ( not ( = ?auto_79790 ?auto_79792 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_79786 ?auto_79787 ?auto_79788 ?auto_79785 )
      ( GET-4IMAGE-VERIFY ?auto_79786 ?auto_79787 ?auto_79788 ?auto_79785 ?auto_79789 ?auto_79790 ?auto_79791 ?auto_79792 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_80196 - DIRECTION
      ?auto_80197 - MODE
      ?auto_80198 - DIRECTION
      ?auto_80195 - MODE
      ?auto_80199 - DIRECTION
      ?auto_80200 - MODE
      ?auto_80201 - DIRECTION
      ?auto_80202 - MODE
    )
    :vars
    (
      ?auto_80204 - INSTRUMENT
      ?auto_80205 - SATELLITE
      ?auto_80203 - DIRECTION
      ?auto_80206 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_80204 ?auto_80205 ) ( SUPPORTS ?auto_80204 ?auto_80195 ) ( not ( = ?auto_80198 ?auto_80203 ) ) ( HAVE_IMAGE ?auto_80201 ?auto_80200 ) ( not ( = ?auto_80201 ?auto_80198 ) ) ( not ( = ?auto_80201 ?auto_80203 ) ) ( not ( = ?auto_80200 ?auto_80195 ) ) ( CALIBRATION_TARGET ?auto_80204 ?auto_80203 ) ( POINTING ?auto_80205 ?auto_80196 ) ( not ( = ?auto_80203 ?auto_80196 ) ) ( not ( = ?auto_80198 ?auto_80196 ) ) ( not ( = ?auto_80201 ?auto_80196 ) ) ( ON_BOARD ?auto_80206 ?auto_80205 ) ( POWER_ON ?auto_80206 ) ( not ( = ?auto_80204 ?auto_80206 ) ) ( HAVE_IMAGE ?auto_80196 ?auto_80197 ) ( HAVE_IMAGE ?auto_80199 ?auto_80200 ) ( HAVE_IMAGE ?auto_80201 ?auto_80202 ) ( not ( = ?auto_80196 ?auto_80199 ) ) ( not ( = ?auto_80197 ?auto_80195 ) ) ( not ( = ?auto_80197 ?auto_80200 ) ) ( not ( = ?auto_80197 ?auto_80202 ) ) ( not ( = ?auto_80198 ?auto_80199 ) ) ( not ( = ?auto_80195 ?auto_80202 ) ) ( not ( = ?auto_80199 ?auto_80201 ) ) ( not ( = ?auto_80199 ?auto_80203 ) ) ( not ( = ?auto_80200 ?auto_80202 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_80201 ?auto_80200 ?auto_80198 ?auto_80195 )
      ( GET-4IMAGE-VERIFY ?auto_80196 ?auto_80197 ?auto_80198 ?auto_80195 ?auto_80199 ?auto_80200 ?auto_80201 ?auto_80202 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_81108 - DIRECTION
      ?auto_81109 - MODE
      ?auto_81110 - DIRECTION
      ?auto_81107 - MODE
      ?auto_81111 - DIRECTION
      ?auto_81112 - MODE
      ?auto_81113 - DIRECTION
      ?auto_81114 - MODE
    )
    :vars
    (
      ?auto_81116 - INSTRUMENT
      ?auto_81117 - SATELLITE
      ?auto_81115 - DIRECTION
      ?auto_81118 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_81116 ?auto_81117 ) ( SUPPORTS ?auto_81116 ?auto_81109 ) ( not ( = ?auto_81108 ?auto_81115 ) ) ( HAVE_IMAGE ?auto_81113 ?auto_81112 ) ( not ( = ?auto_81113 ?auto_81108 ) ) ( not ( = ?auto_81113 ?auto_81115 ) ) ( not ( = ?auto_81112 ?auto_81109 ) ) ( CALIBRATION_TARGET ?auto_81116 ?auto_81115 ) ( POINTING ?auto_81117 ?auto_81110 ) ( not ( = ?auto_81115 ?auto_81110 ) ) ( not ( = ?auto_81108 ?auto_81110 ) ) ( not ( = ?auto_81113 ?auto_81110 ) ) ( ON_BOARD ?auto_81118 ?auto_81117 ) ( POWER_ON ?auto_81118 ) ( not ( = ?auto_81116 ?auto_81118 ) ) ( HAVE_IMAGE ?auto_81110 ?auto_81107 ) ( HAVE_IMAGE ?auto_81111 ?auto_81112 ) ( HAVE_IMAGE ?auto_81113 ?auto_81114 ) ( not ( = ?auto_81108 ?auto_81111 ) ) ( not ( = ?auto_81109 ?auto_81107 ) ) ( not ( = ?auto_81109 ?auto_81114 ) ) ( not ( = ?auto_81110 ?auto_81111 ) ) ( not ( = ?auto_81107 ?auto_81112 ) ) ( not ( = ?auto_81107 ?auto_81114 ) ) ( not ( = ?auto_81111 ?auto_81113 ) ) ( not ( = ?auto_81111 ?auto_81115 ) ) ( not ( = ?auto_81112 ?auto_81114 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_81113 ?auto_81112 ?auto_81108 ?auto_81109 )
      ( GET-4IMAGE-VERIFY ?auto_81108 ?auto_81109 ?auto_81110 ?auto_81107 ?auto_81111 ?auto_81112 ?auto_81113 ?auto_81114 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_84621 - DIRECTION
      ?auto_84622 - MODE
      ?auto_84623 - DIRECTION
      ?auto_84620 - MODE
      ?auto_84624 - DIRECTION
      ?auto_84625 - MODE
    )
    :vars
    (
      ?auto_84628 - INSTRUMENT
      ?auto_84626 - SATELLITE
      ?auto_84629 - DIRECTION
      ?auto_84627 - DIRECTION
      ?auto_84630 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_84628 ?auto_84626 ) ( SUPPORTS ?auto_84628 ?auto_84625 ) ( not ( = ?auto_84624 ?auto_84629 ) ) ( HAVE_IMAGE ?auto_84623 ?auto_84622 ) ( not ( = ?auto_84623 ?auto_84624 ) ) ( not ( = ?auto_84623 ?auto_84629 ) ) ( not ( = ?auto_84622 ?auto_84625 ) ) ( CALIBRATION_TARGET ?auto_84628 ?auto_84629 ) ( not ( = ?auto_84629 ?auto_84627 ) ) ( not ( = ?auto_84624 ?auto_84627 ) ) ( not ( = ?auto_84623 ?auto_84627 ) ) ( ON_BOARD ?auto_84630 ?auto_84626 ) ( POWER_ON ?auto_84630 ) ( not ( = ?auto_84628 ?auto_84630 ) ) ( POINTING ?auto_84626 ?auto_84629 ) ( HAVE_IMAGE ?auto_84621 ?auto_84622 ) ( HAVE_IMAGE ?auto_84623 ?auto_84620 ) ( not ( = ?auto_84621 ?auto_84623 ) ) ( not ( = ?auto_84621 ?auto_84624 ) ) ( not ( = ?auto_84621 ?auto_84629 ) ) ( not ( = ?auto_84621 ?auto_84627 ) ) ( not ( = ?auto_84622 ?auto_84620 ) ) ( not ( = ?auto_84620 ?auto_84625 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_84623 ?auto_84622 ?auto_84624 ?auto_84625 )
      ( GET-3IMAGE-VERIFY ?auto_84621 ?auto_84622 ?auto_84623 ?auto_84620 ?auto_84624 ?auto_84625 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_85310 - DIRECTION
      ?auto_85311 - MODE
      ?auto_85312 - DIRECTION
      ?auto_85309 - MODE
      ?auto_85313 - DIRECTION
      ?auto_85314 - MODE
      ?auto_85315 - DIRECTION
      ?auto_85316 - MODE
    )
    :vars
    (
      ?auto_85319 - INSTRUMENT
      ?auto_85317 - SATELLITE
      ?auto_85320 - DIRECTION
      ?auto_85318 - DIRECTION
      ?auto_85321 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_85319 ?auto_85317 ) ( SUPPORTS ?auto_85319 ?auto_85309 ) ( not ( = ?auto_85312 ?auto_85320 ) ) ( HAVE_IMAGE ?auto_85313 ?auto_85311 ) ( not ( = ?auto_85313 ?auto_85312 ) ) ( not ( = ?auto_85313 ?auto_85320 ) ) ( not ( = ?auto_85311 ?auto_85309 ) ) ( CALIBRATION_TARGET ?auto_85319 ?auto_85320 ) ( not ( = ?auto_85320 ?auto_85318 ) ) ( not ( = ?auto_85312 ?auto_85318 ) ) ( not ( = ?auto_85313 ?auto_85318 ) ) ( ON_BOARD ?auto_85321 ?auto_85317 ) ( POWER_ON ?auto_85321 ) ( not ( = ?auto_85319 ?auto_85321 ) ) ( POINTING ?auto_85317 ?auto_85320 ) ( HAVE_IMAGE ?auto_85310 ?auto_85311 ) ( HAVE_IMAGE ?auto_85313 ?auto_85314 ) ( HAVE_IMAGE ?auto_85315 ?auto_85316 ) ( not ( = ?auto_85310 ?auto_85312 ) ) ( not ( = ?auto_85310 ?auto_85313 ) ) ( not ( = ?auto_85310 ?auto_85315 ) ) ( not ( = ?auto_85310 ?auto_85320 ) ) ( not ( = ?auto_85310 ?auto_85318 ) ) ( not ( = ?auto_85311 ?auto_85314 ) ) ( not ( = ?auto_85311 ?auto_85316 ) ) ( not ( = ?auto_85312 ?auto_85315 ) ) ( not ( = ?auto_85309 ?auto_85314 ) ) ( not ( = ?auto_85309 ?auto_85316 ) ) ( not ( = ?auto_85313 ?auto_85315 ) ) ( not ( = ?auto_85314 ?auto_85316 ) ) ( not ( = ?auto_85315 ?auto_85320 ) ) ( not ( = ?auto_85315 ?auto_85318 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_85313 ?auto_85311 ?auto_85312 ?auto_85309 )
      ( GET-4IMAGE-VERIFY ?auto_85310 ?auto_85311 ?auto_85312 ?auto_85309 ?auto_85313 ?auto_85314 ?auto_85315 ?auto_85316 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_91868 - DIRECTION
      ?auto_91869 - MODE
      ?auto_91870 - DIRECTION
      ?auto_91867 - MODE
      ?auto_91871 - DIRECTION
      ?auto_91872 - MODE
      ?auto_91873 - DIRECTION
      ?auto_91874 - MODE
    )
    :vars
    (
      ?auto_91875 - INSTRUMENT
      ?auto_91876 - SATELLITE
      ?auto_91877 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_91875 ?auto_91876 ) ( SUPPORTS ?auto_91875 ?auto_91869 ) ( POINTING ?auto_91876 ?auto_91877 ) ( not ( = ?auto_91868 ?auto_91877 ) ) ( HAVE_IMAGE ?auto_91873 ?auto_91867 ) ( not ( = ?auto_91873 ?auto_91868 ) ) ( not ( = ?auto_91873 ?auto_91877 ) ) ( not ( = ?auto_91867 ?auto_91869 ) ) ( CALIBRATION_TARGET ?auto_91875 ?auto_91877 ) ( POWER_AVAIL ?auto_91876 ) ( HAVE_IMAGE ?auto_91870 ?auto_91867 ) ( HAVE_IMAGE ?auto_91871 ?auto_91872 ) ( HAVE_IMAGE ?auto_91873 ?auto_91874 ) ( not ( = ?auto_91868 ?auto_91870 ) ) ( not ( = ?auto_91868 ?auto_91871 ) ) ( not ( = ?auto_91869 ?auto_91872 ) ) ( not ( = ?auto_91869 ?auto_91874 ) ) ( not ( = ?auto_91870 ?auto_91871 ) ) ( not ( = ?auto_91870 ?auto_91873 ) ) ( not ( = ?auto_91870 ?auto_91877 ) ) ( not ( = ?auto_91867 ?auto_91872 ) ) ( not ( = ?auto_91867 ?auto_91874 ) ) ( not ( = ?auto_91871 ?auto_91873 ) ) ( not ( = ?auto_91871 ?auto_91877 ) ) ( not ( = ?auto_91872 ?auto_91874 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_91873 ?auto_91867 ?auto_91868 ?auto_91869 )
      ( GET-4IMAGE-VERIFY ?auto_91868 ?auto_91869 ?auto_91870 ?auto_91867 ?auto_91871 ?auto_91872 ?auto_91873 ?auto_91874 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_92708 - DIRECTION
      ?auto_92709 - MODE
      ?auto_92710 - DIRECTION
      ?auto_92707 - MODE
      ?auto_92711 - DIRECTION
      ?auto_92712 - MODE
    )
    :vars
    (
      ?auto_92713 - INSTRUMENT
      ?auto_92714 - SATELLITE
      ?auto_92715 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_92713 ?auto_92714 ) ( SUPPORTS ?auto_92713 ?auto_92707 ) ( not ( = ?auto_92710 ?auto_92715 ) ) ( HAVE_IMAGE ?auto_92708 ?auto_92709 ) ( not ( = ?auto_92708 ?auto_92710 ) ) ( not ( = ?auto_92708 ?auto_92715 ) ) ( not ( = ?auto_92709 ?auto_92707 ) ) ( CALIBRATION_TARGET ?auto_92713 ?auto_92715 ) ( POWER_AVAIL ?auto_92714 ) ( POINTING ?auto_92714 ?auto_92708 ) ( HAVE_IMAGE ?auto_92711 ?auto_92712 ) ( not ( = ?auto_92708 ?auto_92711 ) ) ( not ( = ?auto_92709 ?auto_92712 ) ) ( not ( = ?auto_92710 ?auto_92711 ) ) ( not ( = ?auto_92707 ?auto_92712 ) ) ( not ( = ?auto_92711 ?auto_92715 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_92708 ?auto_92709 ?auto_92710 ?auto_92707 )
      ( GET-3IMAGE-VERIFY ?auto_92708 ?auto_92709 ?auto_92710 ?auto_92707 ?auto_92711 ?auto_92712 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_92890 - DIRECTION
      ?auto_92891 - MODE
      ?auto_92892 - DIRECTION
      ?auto_92889 - MODE
      ?auto_92893 - DIRECTION
      ?auto_92894 - MODE
    )
    :vars
    (
      ?auto_92895 - INSTRUMENT
      ?auto_92896 - SATELLITE
      ?auto_92897 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_92895 ?auto_92896 ) ( SUPPORTS ?auto_92895 ?auto_92891 ) ( not ( = ?auto_92890 ?auto_92897 ) ) ( HAVE_IMAGE ?auto_92892 ?auto_92894 ) ( not ( = ?auto_92892 ?auto_92890 ) ) ( not ( = ?auto_92892 ?auto_92897 ) ) ( not ( = ?auto_92894 ?auto_92891 ) ) ( CALIBRATION_TARGET ?auto_92895 ?auto_92897 ) ( POWER_AVAIL ?auto_92896 ) ( POINTING ?auto_92896 ?auto_92892 ) ( HAVE_IMAGE ?auto_92892 ?auto_92889 ) ( HAVE_IMAGE ?auto_92893 ?auto_92894 ) ( not ( = ?auto_92890 ?auto_92893 ) ) ( not ( = ?auto_92891 ?auto_92889 ) ) ( not ( = ?auto_92892 ?auto_92893 ) ) ( not ( = ?auto_92889 ?auto_92894 ) ) ( not ( = ?auto_92893 ?auto_92897 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_92892 ?auto_92894 ?auto_92890 ?auto_92891 )
      ( GET-3IMAGE-VERIFY ?auto_92890 ?auto_92891 ?auto_92892 ?auto_92889 ?auto_92893 ?auto_92894 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_93052 - DIRECTION
      ?auto_93053 - MODE
      ?auto_93054 - DIRECTION
      ?auto_93051 - MODE
      ?auto_93055 - DIRECTION
      ?auto_93056 - MODE
      ?auto_93057 - DIRECTION
      ?auto_93058 - MODE
    )
    :vars
    (
      ?auto_93059 - INSTRUMENT
      ?auto_93060 - SATELLITE
      ?auto_93061 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_93059 ?auto_93060 ) ( SUPPORTS ?auto_93059 ?auto_93058 ) ( not ( = ?auto_93057 ?auto_93061 ) ) ( HAVE_IMAGE ?auto_93054 ?auto_93051 ) ( not ( = ?auto_93054 ?auto_93057 ) ) ( not ( = ?auto_93054 ?auto_93061 ) ) ( not ( = ?auto_93051 ?auto_93058 ) ) ( CALIBRATION_TARGET ?auto_93059 ?auto_93061 ) ( POWER_AVAIL ?auto_93060 ) ( POINTING ?auto_93060 ?auto_93054 ) ( HAVE_IMAGE ?auto_93052 ?auto_93053 ) ( HAVE_IMAGE ?auto_93055 ?auto_93056 ) ( not ( = ?auto_93052 ?auto_93054 ) ) ( not ( = ?auto_93052 ?auto_93055 ) ) ( not ( = ?auto_93052 ?auto_93057 ) ) ( not ( = ?auto_93052 ?auto_93061 ) ) ( not ( = ?auto_93053 ?auto_93051 ) ) ( not ( = ?auto_93053 ?auto_93056 ) ) ( not ( = ?auto_93053 ?auto_93058 ) ) ( not ( = ?auto_93054 ?auto_93055 ) ) ( not ( = ?auto_93051 ?auto_93056 ) ) ( not ( = ?auto_93055 ?auto_93057 ) ) ( not ( = ?auto_93055 ?auto_93061 ) ) ( not ( = ?auto_93056 ?auto_93058 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_93054 ?auto_93051 ?auto_93057 ?auto_93058 )
      ( GET-4IMAGE-VERIFY ?auto_93052 ?auto_93053 ?auto_93054 ?auto_93051 ?auto_93055 ?auto_93056 ?auto_93057 ?auto_93058 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_93085 - DIRECTION
      ?auto_93086 - MODE
      ?auto_93087 - DIRECTION
      ?auto_93084 - MODE
      ?auto_93088 - DIRECTION
      ?auto_93089 - MODE
      ?auto_93090 - DIRECTION
      ?auto_93091 - MODE
    )
    :vars
    (
      ?auto_93092 - INSTRUMENT
      ?auto_93093 - SATELLITE
      ?auto_93094 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_93092 ?auto_93093 ) ( SUPPORTS ?auto_93092 ?auto_93089 ) ( not ( = ?auto_93088 ?auto_93094 ) ) ( HAVE_IMAGE ?auto_93085 ?auto_93084 ) ( not ( = ?auto_93085 ?auto_93088 ) ) ( not ( = ?auto_93085 ?auto_93094 ) ) ( not ( = ?auto_93084 ?auto_93089 ) ) ( CALIBRATION_TARGET ?auto_93092 ?auto_93094 ) ( POWER_AVAIL ?auto_93093 ) ( POINTING ?auto_93093 ?auto_93085 ) ( HAVE_IMAGE ?auto_93085 ?auto_93086 ) ( HAVE_IMAGE ?auto_93087 ?auto_93084 ) ( HAVE_IMAGE ?auto_93090 ?auto_93091 ) ( not ( = ?auto_93085 ?auto_93087 ) ) ( not ( = ?auto_93085 ?auto_93090 ) ) ( not ( = ?auto_93086 ?auto_93084 ) ) ( not ( = ?auto_93086 ?auto_93089 ) ) ( not ( = ?auto_93086 ?auto_93091 ) ) ( not ( = ?auto_93087 ?auto_93088 ) ) ( not ( = ?auto_93087 ?auto_93090 ) ) ( not ( = ?auto_93087 ?auto_93094 ) ) ( not ( = ?auto_93084 ?auto_93091 ) ) ( not ( = ?auto_93088 ?auto_93090 ) ) ( not ( = ?auto_93089 ?auto_93091 ) ) ( not ( = ?auto_93090 ?auto_93094 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_93085 ?auto_93084 ?auto_93088 ?auto_93089 )
      ( GET-4IMAGE-VERIFY ?auto_93085 ?auto_93086 ?auto_93087 ?auto_93084 ?auto_93088 ?auto_93089 ?auto_93090 ?auto_93091 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_93283 - DIRECTION
      ?auto_93284 - MODE
      ?auto_93285 - DIRECTION
      ?auto_93282 - MODE
      ?auto_93286 - DIRECTION
      ?auto_93287 - MODE
      ?auto_93288 - DIRECTION
      ?auto_93289 - MODE
    )
    :vars
    (
      ?auto_93290 - INSTRUMENT
      ?auto_93291 - SATELLITE
      ?auto_93292 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_93290 ?auto_93291 ) ( SUPPORTS ?auto_93290 ?auto_93282 ) ( not ( = ?auto_93285 ?auto_93292 ) ) ( HAVE_IMAGE ?auto_93286 ?auto_93287 ) ( not ( = ?auto_93286 ?auto_93285 ) ) ( not ( = ?auto_93286 ?auto_93292 ) ) ( not ( = ?auto_93287 ?auto_93282 ) ) ( CALIBRATION_TARGET ?auto_93290 ?auto_93292 ) ( POWER_AVAIL ?auto_93291 ) ( POINTING ?auto_93291 ?auto_93286 ) ( HAVE_IMAGE ?auto_93283 ?auto_93284 ) ( HAVE_IMAGE ?auto_93288 ?auto_93289 ) ( not ( = ?auto_93283 ?auto_93285 ) ) ( not ( = ?auto_93283 ?auto_93286 ) ) ( not ( = ?auto_93283 ?auto_93288 ) ) ( not ( = ?auto_93283 ?auto_93292 ) ) ( not ( = ?auto_93284 ?auto_93282 ) ) ( not ( = ?auto_93284 ?auto_93287 ) ) ( not ( = ?auto_93284 ?auto_93289 ) ) ( not ( = ?auto_93285 ?auto_93288 ) ) ( not ( = ?auto_93282 ?auto_93289 ) ) ( not ( = ?auto_93286 ?auto_93288 ) ) ( not ( = ?auto_93287 ?auto_93289 ) ) ( not ( = ?auto_93288 ?auto_93292 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_93286 ?auto_93287 ?auto_93285 ?auto_93282 )
      ( GET-4IMAGE-VERIFY ?auto_93283 ?auto_93284 ?auto_93285 ?auto_93282 ?auto_93286 ?auto_93287 ?auto_93288 ?auto_93289 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_95197 - DIRECTION
      ?auto_95198 - MODE
      ?auto_95199 - DIRECTION
      ?auto_95196 - MODE
      ?auto_95200 - DIRECTION
      ?auto_95201 - MODE
    )
    :vars
    (
      ?auto_95204 - INSTRUMENT
      ?auto_95203 - SATELLITE
      ?auto_95202 - DIRECTION
      ?auto_95205 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_95204 ?auto_95203 ) ( SUPPORTS ?auto_95204 ?auto_95196 ) ( not ( = ?auto_95199 ?auto_95202 ) ) ( HAVE_IMAGE ?auto_95197 ?auto_95201 ) ( not ( = ?auto_95197 ?auto_95199 ) ) ( not ( = ?auto_95197 ?auto_95202 ) ) ( not ( = ?auto_95201 ?auto_95196 ) ) ( CALIBRATION_TARGET ?auto_95204 ?auto_95202 ) ( POINTING ?auto_95203 ?auto_95197 ) ( ON_BOARD ?auto_95205 ?auto_95203 ) ( POWER_ON ?auto_95205 ) ( not ( = ?auto_95204 ?auto_95205 ) ) ( HAVE_IMAGE ?auto_95197 ?auto_95198 ) ( HAVE_IMAGE ?auto_95200 ?auto_95201 ) ( not ( = ?auto_95197 ?auto_95200 ) ) ( not ( = ?auto_95198 ?auto_95196 ) ) ( not ( = ?auto_95198 ?auto_95201 ) ) ( not ( = ?auto_95199 ?auto_95200 ) ) ( not ( = ?auto_95200 ?auto_95202 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_95197 ?auto_95201 ?auto_95199 ?auto_95196 )
      ( GET-3IMAGE-VERIFY ?auto_95197 ?auto_95198 ?auto_95199 ?auto_95196 ?auto_95200 ?auto_95201 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_95397 - DIRECTION
      ?auto_95398 - MODE
      ?auto_95399 - DIRECTION
      ?auto_95396 - MODE
      ?auto_95400 - DIRECTION
      ?auto_95401 - MODE
    )
    :vars
    (
      ?auto_95404 - INSTRUMENT
      ?auto_95403 - SATELLITE
      ?auto_95402 - DIRECTION
      ?auto_95405 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_95404 ?auto_95403 ) ( SUPPORTS ?auto_95404 ?auto_95398 ) ( not ( = ?auto_95397 ?auto_95402 ) ) ( HAVE_IMAGE ?auto_95400 ?auto_95401 ) ( not ( = ?auto_95400 ?auto_95397 ) ) ( not ( = ?auto_95400 ?auto_95402 ) ) ( not ( = ?auto_95401 ?auto_95398 ) ) ( CALIBRATION_TARGET ?auto_95404 ?auto_95402 ) ( POINTING ?auto_95403 ?auto_95400 ) ( ON_BOARD ?auto_95405 ?auto_95403 ) ( POWER_ON ?auto_95405 ) ( not ( = ?auto_95404 ?auto_95405 ) ) ( HAVE_IMAGE ?auto_95399 ?auto_95396 ) ( not ( = ?auto_95397 ?auto_95399 ) ) ( not ( = ?auto_95398 ?auto_95396 ) ) ( not ( = ?auto_95399 ?auto_95400 ) ) ( not ( = ?auto_95399 ?auto_95402 ) ) ( not ( = ?auto_95396 ?auto_95401 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_95400 ?auto_95401 ?auto_95397 ?auto_95398 )
      ( GET-3IMAGE-VERIFY ?auto_95397 ?auto_95398 ?auto_95399 ?auto_95396 ?auto_95400 ?auto_95401 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_95611 - DIRECTION
      ?auto_95612 - MODE
      ?auto_95613 - DIRECTION
      ?auto_95610 - MODE
      ?auto_95614 - DIRECTION
      ?auto_95615 - MODE
      ?auto_95616 - DIRECTION
      ?auto_95617 - MODE
    )
    :vars
    (
      ?auto_95620 - INSTRUMENT
      ?auto_95619 - SATELLITE
      ?auto_95618 - DIRECTION
      ?auto_95621 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_95620 ?auto_95619 ) ( SUPPORTS ?auto_95620 ?auto_95615 ) ( not ( = ?auto_95614 ?auto_95618 ) ) ( HAVE_IMAGE ?auto_95611 ?auto_95612 ) ( not ( = ?auto_95611 ?auto_95614 ) ) ( not ( = ?auto_95611 ?auto_95618 ) ) ( not ( = ?auto_95612 ?auto_95615 ) ) ( CALIBRATION_TARGET ?auto_95620 ?auto_95618 ) ( POINTING ?auto_95619 ?auto_95611 ) ( ON_BOARD ?auto_95621 ?auto_95619 ) ( POWER_ON ?auto_95621 ) ( not ( = ?auto_95620 ?auto_95621 ) ) ( HAVE_IMAGE ?auto_95613 ?auto_95610 ) ( HAVE_IMAGE ?auto_95616 ?auto_95617 ) ( not ( = ?auto_95611 ?auto_95613 ) ) ( not ( = ?auto_95611 ?auto_95616 ) ) ( not ( = ?auto_95612 ?auto_95610 ) ) ( not ( = ?auto_95612 ?auto_95617 ) ) ( not ( = ?auto_95613 ?auto_95614 ) ) ( not ( = ?auto_95613 ?auto_95616 ) ) ( not ( = ?auto_95613 ?auto_95618 ) ) ( not ( = ?auto_95610 ?auto_95615 ) ) ( not ( = ?auto_95610 ?auto_95617 ) ) ( not ( = ?auto_95614 ?auto_95616 ) ) ( not ( = ?auto_95615 ?auto_95617 ) ) ( not ( = ?auto_95616 ?auto_95618 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_95611 ?auto_95612 ?auto_95614 ?auto_95615 )
      ( GET-4IMAGE-VERIFY ?auto_95611 ?auto_95612 ?auto_95613 ?auto_95610 ?auto_95614 ?auto_95615 ?auto_95616 ?auto_95617 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_95827 - DIRECTION
      ?auto_95828 - MODE
      ?auto_95829 - DIRECTION
      ?auto_95826 - MODE
      ?auto_95830 - DIRECTION
      ?auto_95831 - MODE
      ?auto_95832 - DIRECTION
      ?auto_95833 - MODE
    )
    :vars
    (
      ?auto_95836 - INSTRUMENT
      ?auto_95835 - SATELLITE
      ?auto_95834 - DIRECTION
      ?auto_95837 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_95836 ?auto_95835 ) ( SUPPORTS ?auto_95836 ?auto_95826 ) ( not ( = ?auto_95829 ?auto_95834 ) ) ( HAVE_IMAGE ?auto_95832 ?auto_95831 ) ( not ( = ?auto_95832 ?auto_95829 ) ) ( not ( = ?auto_95832 ?auto_95834 ) ) ( not ( = ?auto_95831 ?auto_95826 ) ) ( CALIBRATION_TARGET ?auto_95836 ?auto_95834 ) ( POINTING ?auto_95835 ?auto_95832 ) ( ON_BOARD ?auto_95837 ?auto_95835 ) ( POWER_ON ?auto_95837 ) ( not ( = ?auto_95836 ?auto_95837 ) ) ( HAVE_IMAGE ?auto_95827 ?auto_95828 ) ( HAVE_IMAGE ?auto_95830 ?auto_95831 ) ( HAVE_IMAGE ?auto_95832 ?auto_95833 ) ( not ( = ?auto_95827 ?auto_95829 ) ) ( not ( = ?auto_95827 ?auto_95830 ) ) ( not ( = ?auto_95827 ?auto_95832 ) ) ( not ( = ?auto_95827 ?auto_95834 ) ) ( not ( = ?auto_95828 ?auto_95826 ) ) ( not ( = ?auto_95828 ?auto_95831 ) ) ( not ( = ?auto_95828 ?auto_95833 ) ) ( not ( = ?auto_95829 ?auto_95830 ) ) ( not ( = ?auto_95826 ?auto_95833 ) ) ( not ( = ?auto_95830 ?auto_95832 ) ) ( not ( = ?auto_95830 ?auto_95834 ) ) ( not ( = ?auto_95831 ?auto_95833 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_95832 ?auto_95831 ?auto_95829 ?auto_95826 )
      ( GET-4IMAGE-VERIFY ?auto_95827 ?auto_95828 ?auto_95829 ?auto_95826 ?auto_95830 ?auto_95831 ?auto_95832 ?auto_95833 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_96983 - DIRECTION
      ?auto_96984 - MODE
      ?auto_96985 - DIRECTION
      ?auto_96982 - MODE
      ?auto_96986 - DIRECTION
      ?auto_96987 - MODE
      ?auto_96988 - DIRECTION
      ?auto_96989 - MODE
    )
    :vars
    (
      ?auto_96992 - INSTRUMENT
      ?auto_96991 - SATELLITE
      ?auto_96990 - DIRECTION
      ?auto_96993 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_96992 ?auto_96991 ) ( SUPPORTS ?auto_96992 ?auto_96984 ) ( not ( = ?auto_96983 ?auto_96990 ) ) ( HAVE_IMAGE ?auto_96986 ?auto_96982 ) ( not ( = ?auto_96986 ?auto_96983 ) ) ( not ( = ?auto_96986 ?auto_96990 ) ) ( not ( = ?auto_96982 ?auto_96984 ) ) ( CALIBRATION_TARGET ?auto_96992 ?auto_96990 ) ( POINTING ?auto_96991 ?auto_96986 ) ( ON_BOARD ?auto_96993 ?auto_96991 ) ( POWER_ON ?auto_96993 ) ( not ( = ?auto_96992 ?auto_96993 ) ) ( HAVE_IMAGE ?auto_96985 ?auto_96982 ) ( HAVE_IMAGE ?auto_96986 ?auto_96987 ) ( HAVE_IMAGE ?auto_96988 ?auto_96989 ) ( not ( = ?auto_96983 ?auto_96985 ) ) ( not ( = ?auto_96983 ?auto_96988 ) ) ( not ( = ?auto_96984 ?auto_96987 ) ) ( not ( = ?auto_96984 ?auto_96989 ) ) ( not ( = ?auto_96985 ?auto_96986 ) ) ( not ( = ?auto_96985 ?auto_96988 ) ) ( not ( = ?auto_96985 ?auto_96990 ) ) ( not ( = ?auto_96982 ?auto_96987 ) ) ( not ( = ?auto_96982 ?auto_96989 ) ) ( not ( = ?auto_96986 ?auto_96988 ) ) ( not ( = ?auto_96987 ?auto_96989 ) ) ( not ( = ?auto_96988 ?auto_96990 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_96986 ?auto_96982 ?auto_96983 ?auto_96984 )
      ( GET-4IMAGE-VERIFY ?auto_96983 ?auto_96984 ?auto_96985 ?auto_96982 ?auto_96986 ?auto_96987 ?auto_96988 ?auto_96989 ) )
  )

)

