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
      ?auto_18192 - DIRECTION
      ?auto_18193 - MODE
    )
    :vars
    (
      ?auto_18194 - INSTRUMENT
      ?auto_18195 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_18194 ) ( ON_BOARD ?auto_18194 ?auto_18195 ) ( SUPPORTS ?auto_18194 ?auto_18193 ) ( POWER_ON ?auto_18194 ) ( POINTING ?auto_18195 ?auto_18192 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_18195 ?auto_18192 ?auto_18194 ?auto_18193 )
      ( GET-1IMAGE-VERIFY ?auto_18192 ?auto_18193 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18210 - DIRECTION
      ?auto_18211 - MODE
    )
    :vars
    (
      ?auto_18212 - INSTRUMENT
      ?auto_18213 - SATELLITE
      ?auto_18214 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_18212 ) ( ON_BOARD ?auto_18212 ?auto_18213 ) ( SUPPORTS ?auto_18212 ?auto_18211 ) ( POWER_ON ?auto_18212 ) ( POINTING ?auto_18213 ?auto_18214 ) ( not ( = ?auto_18210 ?auto_18214 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_18213 ?auto_18210 ?auto_18214 )
      ( GET-1IMAGE ?auto_18210 ?auto_18211 )
      ( GET-1IMAGE-VERIFY ?auto_18210 ?auto_18211 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18231 - DIRECTION
      ?auto_18232 - MODE
    )
    :vars
    (
      ?auto_18233 - INSTRUMENT
      ?auto_18234 - SATELLITE
      ?auto_18235 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18233 ?auto_18234 ) ( SUPPORTS ?auto_18233 ?auto_18232 ) ( POWER_ON ?auto_18233 ) ( POINTING ?auto_18234 ?auto_18235 ) ( not ( = ?auto_18231 ?auto_18235 ) ) ( CALIBRATION_TARGET ?auto_18233 ?auto_18235 ) ( NOT_CALIBRATED ?auto_18233 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_18234 ?auto_18233 ?auto_18235 )
      ( GET-1IMAGE ?auto_18231 ?auto_18232 )
      ( GET-1IMAGE-VERIFY ?auto_18231 ?auto_18232 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18252 - DIRECTION
      ?auto_18253 - MODE
    )
    :vars
    (
      ?auto_18254 - INSTRUMENT
      ?auto_18256 - SATELLITE
      ?auto_18255 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18254 ?auto_18256 ) ( SUPPORTS ?auto_18254 ?auto_18253 ) ( POINTING ?auto_18256 ?auto_18255 ) ( not ( = ?auto_18252 ?auto_18255 ) ) ( CALIBRATION_TARGET ?auto_18254 ?auto_18255 ) ( POWER_AVAIL ?auto_18256 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_18254 ?auto_18256 )
      ( GET-1IMAGE ?auto_18252 ?auto_18253 )
      ( GET-1IMAGE-VERIFY ?auto_18252 ?auto_18253 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18273 - DIRECTION
      ?auto_18274 - MODE
    )
    :vars
    (
      ?auto_18277 - INSTRUMENT
      ?auto_18276 - SATELLITE
      ?auto_18275 - DIRECTION
      ?auto_18278 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18277 ?auto_18276 ) ( SUPPORTS ?auto_18277 ?auto_18274 ) ( not ( = ?auto_18273 ?auto_18275 ) ) ( CALIBRATION_TARGET ?auto_18277 ?auto_18275 ) ( POWER_AVAIL ?auto_18276 ) ( POINTING ?auto_18276 ?auto_18278 ) ( not ( = ?auto_18275 ?auto_18278 ) ) ( not ( = ?auto_18273 ?auto_18278 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_18276 ?auto_18275 ?auto_18278 )
      ( GET-1IMAGE ?auto_18273 ?auto_18274 )
      ( GET-1IMAGE-VERIFY ?auto_18273 ?auto_18274 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18358 - DIRECTION
      ?auto_18359 - MODE
      ?auto_18360 - DIRECTION
      ?auto_18357 - MODE
    )
    :vars
    (
      ?auto_18361 - INSTRUMENT
      ?auto_18362 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_18361 ) ( ON_BOARD ?auto_18361 ?auto_18362 ) ( SUPPORTS ?auto_18361 ?auto_18357 ) ( POWER_ON ?auto_18361 ) ( POINTING ?auto_18362 ?auto_18360 ) ( HAVE_IMAGE ?auto_18358 ?auto_18359 ) ( not ( = ?auto_18358 ?auto_18360 ) ) ( not ( = ?auto_18359 ?auto_18357 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18360 ?auto_18357 )
      ( GET-2IMAGE-VERIFY ?auto_18358 ?auto_18359 ?auto_18360 ?auto_18357 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18364 - DIRECTION
      ?auto_18365 - MODE
      ?auto_18366 - DIRECTION
      ?auto_18363 - MODE
    )
    :vars
    (
      ?auto_18367 - INSTRUMENT
      ?auto_18368 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_18367 ) ( ON_BOARD ?auto_18367 ?auto_18368 ) ( SUPPORTS ?auto_18367 ?auto_18365 ) ( POWER_ON ?auto_18367 ) ( POINTING ?auto_18368 ?auto_18364 ) ( HAVE_IMAGE ?auto_18366 ?auto_18363 ) ( not ( = ?auto_18364 ?auto_18366 ) ) ( not ( = ?auto_18365 ?auto_18363 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18364 ?auto_18365 )
      ( GET-2IMAGE-VERIFY ?auto_18364 ?auto_18365 ?auto_18366 ?auto_18363 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18376 - DIRECTION
      ?auto_18377 - MODE
      ?auto_18378 - DIRECTION
      ?auto_18375 - MODE
      ?auto_18379 - DIRECTION
      ?auto_18380 - MODE
    )
    :vars
    (
      ?auto_18381 - INSTRUMENT
      ?auto_18382 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_18381 ) ( ON_BOARD ?auto_18381 ?auto_18382 ) ( SUPPORTS ?auto_18381 ?auto_18380 ) ( POWER_ON ?auto_18381 ) ( POINTING ?auto_18382 ?auto_18379 ) ( HAVE_IMAGE ?auto_18376 ?auto_18377 ) ( HAVE_IMAGE ?auto_18378 ?auto_18375 ) ( not ( = ?auto_18376 ?auto_18378 ) ) ( not ( = ?auto_18376 ?auto_18379 ) ) ( not ( = ?auto_18377 ?auto_18375 ) ) ( not ( = ?auto_18377 ?auto_18380 ) ) ( not ( = ?auto_18378 ?auto_18379 ) ) ( not ( = ?auto_18375 ?auto_18380 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18379 ?auto_18380 )
      ( GET-3IMAGE-VERIFY ?auto_18376 ?auto_18377 ?auto_18378 ?auto_18375 ?auto_18379 ?auto_18380 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18384 - DIRECTION
      ?auto_18385 - MODE
      ?auto_18386 - DIRECTION
      ?auto_18383 - MODE
      ?auto_18387 - DIRECTION
      ?auto_18388 - MODE
    )
    :vars
    (
      ?auto_18389 - INSTRUMENT
      ?auto_18390 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_18389 ) ( ON_BOARD ?auto_18389 ?auto_18390 ) ( SUPPORTS ?auto_18389 ?auto_18383 ) ( POWER_ON ?auto_18389 ) ( POINTING ?auto_18390 ?auto_18386 ) ( HAVE_IMAGE ?auto_18384 ?auto_18385 ) ( HAVE_IMAGE ?auto_18387 ?auto_18388 ) ( not ( = ?auto_18384 ?auto_18386 ) ) ( not ( = ?auto_18384 ?auto_18387 ) ) ( not ( = ?auto_18385 ?auto_18383 ) ) ( not ( = ?auto_18385 ?auto_18388 ) ) ( not ( = ?auto_18386 ?auto_18387 ) ) ( not ( = ?auto_18383 ?auto_18388 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18386 ?auto_18383 )
      ( GET-3IMAGE-VERIFY ?auto_18384 ?auto_18385 ?auto_18386 ?auto_18383 ?auto_18387 ?auto_18388 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18400 - DIRECTION
      ?auto_18401 - MODE
      ?auto_18402 - DIRECTION
      ?auto_18399 - MODE
      ?auto_18403 - DIRECTION
      ?auto_18404 - MODE
    )
    :vars
    (
      ?auto_18405 - INSTRUMENT
      ?auto_18406 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_18405 ) ( ON_BOARD ?auto_18405 ?auto_18406 ) ( SUPPORTS ?auto_18405 ?auto_18401 ) ( POWER_ON ?auto_18405 ) ( POINTING ?auto_18406 ?auto_18400 ) ( HAVE_IMAGE ?auto_18402 ?auto_18399 ) ( HAVE_IMAGE ?auto_18403 ?auto_18404 ) ( not ( = ?auto_18400 ?auto_18402 ) ) ( not ( = ?auto_18400 ?auto_18403 ) ) ( not ( = ?auto_18401 ?auto_18399 ) ) ( not ( = ?auto_18401 ?auto_18404 ) ) ( not ( = ?auto_18402 ?auto_18403 ) ) ( not ( = ?auto_18399 ?auto_18404 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18400 ?auto_18401 )
      ( GET-3IMAGE-VERIFY ?auto_18400 ?auto_18401 ?auto_18402 ?auto_18399 ?auto_18403 ?auto_18404 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18437 - DIRECTION
      ?auto_18438 - MODE
      ?auto_18439 - DIRECTION
      ?auto_18436 - MODE
    )
    :vars
    (
      ?auto_18440 - INSTRUMENT
      ?auto_18442 - SATELLITE
      ?auto_18441 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_18440 ) ( ON_BOARD ?auto_18440 ?auto_18442 ) ( SUPPORTS ?auto_18440 ?auto_18436 ) ( POWER_ON ?auto_18440 ) ( POINTING ?auto_18442 ?auto_18441 ) ( not ( = ?auto_18439 ?auto_18441 ) ) ( HAVE_IMAGE ?auto_18437 ?auto_18438 ) ( not ( = ?auto_18437 ?auto_18439 ) ) ( not ( = ?auto_18437 ?auto_18441 ) ) ( not ( = ?auto_18438 ?auto_18436 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18439 ?auto_18436 )
      ( GET-2IMAGE-VERIFY ?auto_18437 ?auto_18438 ?auto_18439 ?auto_18436 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18444 - DIRECTION
      ?auto_18445 - MODE
      ?auto_18446 - DIRECTION
      ?auto_18443 - MODE
    )
    :vars
    (
      ?auto_18449 - INSTRUMENT
      ?auto_18448 - SATELLITE
      ?auto_18447 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_18449 ) ( ON_BOARD ?auto_18449 ?auto_18448 ) ( SUPPORTS ?auto_18449 ?auto_18445 ) ( POWER_ON ?auto_18449 ) ( POINTING ?auto_18448 ?auto_18447 ) ( not ( = ?auto_18444 ?auto_18447 ) ) ( HAVE_IMAGE ?auto_18446 ?auto_18443 ) ( not ( = ?auto_18446 ?auto_18444 ) ) ( not ( = ?auto_18446 ?auto_18447 ) ) ( not ( = ?auto_18443 ?auto_18445 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18446 ?auto_18443 ?auto_18444 ?auto_18445 )
      ( GET-2IMAGE-VERIFY ?auto_18444 ?auto_18445 ?auto_18446 ?auto_18443 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18460 - DIRECTION
      ?auto_18461 - MODE
      ?auto_18462 - DIRECTION
      ?auto_18459 - MODE
      ?auto_18463 - DIRECTION
      ?auto_18464 - MODE
    )
    :vars
    (
      ?auto_18467 - INSTRUMENT
      ?auto_18466 - SATELLITE
      ?auto_18465 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_18467 ) ( ON_BOARD ?auto_18467 ?auto_18466 ) ( SUPPORTS ?auto_18467 ?auto_18464 ) ( POWER_ON ?auto_18467 ) ( POINTING ?auto_18466 ?auto_18465 ) ( not ( = ?auto_18463 ?auto_18465 ) ) ( HAVE_IMAGE ?auto_18460 ?auto_18461 ) ( not ( = ?auto_18460 ?auto_18463 ) ) ( not ( = ?auto_18460 ?auto_18465 ) ) ( not ( = ?auto_18461 ?auto_18464 ) ) ( HAVE_IMAGE ?auto_18462 ?auto_18459 ) ( not ( = ?auto_18460 ?auto_18462 ) ) ( not ( = ?auto_18461 ?auto_18459 ) ) ( not ( = ?auto_18462 ?auto_18463 ) ) ( not ( = ?auto_18462 ?auto_18465 ) ) ( not ( = ?auto_18459 ?auto_18464 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18460 ?auto_18461 ?auto_18463 ?auto_18464 )
      ( GET-3IMAGE-VERIFY ?auto_18460 ?auto_18461 ?auto_18462 ?auto_18459 ?auto_18463 ?auto_18464 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18469 - DIRECTION
      ?auto_18470 - MODE
      ?auto_18471 - DIRECTION
      ?auto_18468 - MODE
      ?auto_18472 - DIRECTION
      ?auto_18473 - MODE
    )
    :vars
    (
      ?auto_18476 - INSTRUMENT
      ?auto_18475 - SATELLITE
      ?auto_18474 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_18476 ) ( ON_BOARD ?auto_18476 ?auto_18475 ) ( SUPPORTS ?auto_18476 ?auto_18468 ) ( POWER_ON ?auto_18476 ) ( POINTING ?auto_18475 ?auto_18474 ) ( not ( = ?auto_18471 ?auto_18474 ) ) ( HAVE_IMAGE ?auto_18469 ?auto_18473 ) ( not ( = ?auto_18469 ?auto_18471 ) ) ( not ( = ?auto_18469 ?auto_18474 ) ) ( not ( = ?auto_18473 ?auto_18468 ) ) ( HAVE_IMAGE ?auto_18469 ?auto_18470 ) ( HAVE_IMAGE ?auto_18472 ?auto_18473 ) ( not ( = ?auto_18469 ?auto_18472 ) ) ( not ( = ?auto_18470 ?auto_18468 ) ) ( not ( = ?auto_18470 ?auto_18473 ) ) ( not ( = ?auto_18471 ?auto_18472 ) ) ( not ( = ?auto_18472 ?auto_18474 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18469 ?auto_18473 ?auto_18471 ?auto_18468 )
      ( GET-3IMAGE-VERIFY ?auto_18469 ?auto_18470 ?auto_18471 ?auto_18468 ?auto_18472 ?auto_18473 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18487 - DIRECTION
      ?auto_18488 - MODE
      ?auto_18489 - DIRECTION
      ?auto_18486 - MODE
      ?auto_18490 - DIRECTION
      ?auto_18491 - MODE
    )
    :vars
    (
      ?auto_18494 - INSTRUMENT
      ?auto_18493 - SATELLITE
      ?auto_18492 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_18494 ) ( ON_BOARD ?auto_18494 ?auto_18493 ) ( SUPPORTS ?auto_18494 ?auto_18488 ) ( POWER_ON ?auto_18494 ) ( POINTING ?auto_18493 ?auto_18492 ) ( not ( = ?auto_18487 ?auto_18492 ) ) ( HAVE_IMAGE ?auto_18490 ?auto_18491 ) ( not ( = ?auto_18490 ?auto_18487 ) ) ( not ( = ?auto_18490 ?auto_18492 ) ) ( not ( = ?auto_18491 ?auto_18488 ) ) ( HAVE_IMAGE ?auto_18489 ?auto_18486 ) ( not ( = ?auto_18487 ?auto_18489 ) ) ( not ( = ?auto_18488 ?auto_18486 ) ) ( not ( = ?auto_18489 ?auto_18490 ) ) ( not ( = ?auto_18489 ?auto_18492 ) ) ( not ( = ?auto_18486 ?auto_18491 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18490 ?auto_18491 ?auto_18487 ?auto_18488 )
      ( GET-3IMAGE-VERIFY ?auto_18487 ?auto_18488 ?auto_18489 ?auto_18486 ?auto_18490 ?auto_18491 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18524 - DIRECTION
      ?auto_18525 - MODE
    )
    :vars
    (
      ?auto_18529 - INSTRUMENT
      ?auto_18528 - SATELLITE
      ?auto_18527 - DIRECTION
      ?auto_18526 - DIRECTION
      ?auto_18530 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_18529 ?auto_18528 ) ( SUPPORTS ?auto_18529 ?auto_18525 ) ( POWER_ON ?auto_18529 ) ( POINTING ?auto_18528 ?auto_18527 ) ( not ( = ?auto_18524 ?auto_18527 ) ) ( HAVE_IMAGE ?auto_18526 ?auto_18530 ) ( not ( = ?auto_18526 ?auto_18524 ) ) ( not ( = ?auto_18526 ?auto_18527 ) ) ( not ( = ?auto_18530 ?auto_18525 ) ) ( CALIBRATION_TARGET ?auto_18529 ?auto_18527 ) ( NOT_CALIBRATED ?auto_18529 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_18528 ?auto_18529 ?auto_18527 )
      ( GET-2IMAGE ?auto_18526 ?auto_18530 ?auto_18524 ?auto_18525 )
      ( GET-1IMAGE-VERIFY ?auto_18524 ?auto_18525 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18532 - DIRECTION
      ?auto_18533 - MODE
      ?auto_18534 - DIRECTION
      ?auto_18531 - MODE
    )
    :vars
    (
      ?auto_18535 - INSTRUMENT
      ?auto_18537 - SATELLITE
      ?auto_18536 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18535 ?auto_18537 ) ( SUPPORTS ?auto_18535 ?auto_18531 ) ( POWER_ON ?auto_18535 ) ( POINTING ?auto_18537 ?auto_18536 ) ( not ( = ?auto_18534 ?auto_18536 ) ) ( HAVE_IMAGE ?auto_18532 ?auto_18533 ) ( not ( = ?auto_18532 ?auto_18534 ) ) ( not ( = ?auto_18532 ?auto_18536 ) ) ( not ( = ?auto_18533 ?auto_18531 ) ) ( CALIBRATION_TARGET ?auto_18535 ?auto_18536 ) ( NOT_CALIBRATED ?auto_18535 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18534 ?auto_18531 )
      ( GET-2IMAGE-VERIFY ?auto_18532 ?auto_18533 ?auto_18534 ?auto_18531 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18539 - DIRECTION
      ?auto_18540 - MODE
      ?auto_18541 - DIRECTION
      ?auto_18538 - MODE
    )
    :vars
    (
      ?auto_18543 - INSTRUMENT
      ?auto_18542 - SATELLITE
      ?auto_18544 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18543 ?auto_18542 ) ( SUPPORTS ?auto_18543 ?auto_18540 ) ( POWER_ON ?auto_18543 ) ( POINTING ?auto_18542 ?auto_18544 ) ( not ( = ?auto_18539 ?auto_18544 ) ) ( HAVE_IMAGE ?auto_18541 ?auto_18538 ) ( not ( = ?auto_18541 ?auto_18539 ) ) ( not ( = ?auto_18541 ?auto_18544 ) ) ( not ( = ?auto_18538 ?auto_18540 ) ) ( CALIBRATION_TARGET ?auto_18543 ?auto_18544 ) ( NOT_CALIBRATED ?auto_18543 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18541 ?auto_18538 ?auto_18539 ?auto_18540 )
      ( GET-2IMAGE-VERIFY ?auto_18539 ?auto_18540 ?auto_18541 ?auto_18538 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18555 - DIRECTION
      ?auto_18556 - MODE
      ?auto_18557 - DIRECTION
      ?auto_18554 - MODE
      ?auto_18558 - DIRECTION
      ?auto_18559 - MODE
    )
    :vars
    (
      ?auto_18561 - INSTRUMENT
      ?auto_18560 - SATELLITE
      ?auto_18562 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18561 ?auto_18560 ) ( SUPPORTS ?auto_18561 ?auto_18559 ) ( POWER_ON ?auto_18561 ) ( POINTING ?auto_18560 ?auto_18562 ) ( not ( = ?auto_18558 ?auto_18562 ) ) ( HAVE_IMAGE ?auto_18557 ?auto_18556 ) ( not ( = ?auto_18557 ?auto_18558 ) ) ( not ( = ?auto_18557 ?auto_18562 ) ) ( not ( = ?auto_18556 ?auto_18559 ) ) ( CALIBRATION_TARGET ?auto_18561 ?auto_18562 ) ( NOT_CALIBRATED ?auto_18561 ) ( HAVE_IMAGE ?auto_18555 ?auto_18556 ) ( HAVE_IMAGE ?auto_18557 ?auto_18554 ) ( not ( = ?auto_18555 ?auto_18557 ) ) ( not ( = ?auto_18555 ?auto_18558 ) ) ( not ( = ?auto_18555 ?auto_18562 ) ) ( not ( = ?auto_18556 ?auto_18554 ) ) ( not ( = ?auto_18554 ?auto_18559 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18557 ?auto_18556 ?auto_18558 ?auto_18559 )
      ( GET-3IMAGE-VERIFY ?auto_18555 ?auto_18556 ?auto_18557 ?auto_18554 ?auto_18558 ?auto_18559 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18564 - DIRECTION
      ?auto_18565 - MODE
      ?auto_18566 - DIRECTION
      ?auto_18563 - MODE
      ?auto_18567 - DIRECTION
      ?auto_18568 - MODE
    )
    :vars
    (
      ?auto_18570 - INSTRUMENT
      ?auto_18569 - SATELLITE
      ?auto_18571 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18570 ?auto_18569 ) ( SUPPORTS ?auto_18570 ?auto_18563 ) ( POWER_ON ?auto_18570 ) ( POINTING ?auto_18569 ?auto_18571 ) ( not ( = ?auto_18566 ?auto_18571 ) ) ( HAVE_IMAGE ?auto_18567 ?auto_18565 ) ( not ( = ?auto_18567 ?auto_18566 ) ) ( not ( = ?auto_18567 ?auto_18571 ) ) ( not ( = ?auto_18565 ?auto_18563 ) ) ( CALIBRATION_TARGET ?auto_18570 ?auto_18571 ) ( NOT_CALIBRATED ?auto_18570 ) ( HAVE_IMAGE ?auto_18564 ?auto_18565 ) ( HAVE_IMAGE ?auto_18567 ?auto_18568 ) ( not ( = ?auto_18564 ?auto_18566 ) ) ( not ( = ?auto_18564 ?auto_18567 ) ) ( not ( = ?auto_18564 ?auto_18571 ) ) ( not ( = ?auto_18565 ?auto_18568 ) ) ( not ( = ?auto_18563 ?auto_18568 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18567 ?auto_18565 ?auto_18566 ?auto_18563 )
      ( GET-3IMAGE-VERIFY ?auto_18564 ?auto_18565 ?auto_18566 ?auto_18563 ?auto_18567 ?auto_18568 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18582 - DIRECTION
      ?auto_18583 - MODE
      ?auto_18584 - DIRECTION
      ?auto_18581 - MODE
      ?auto_18585 - DIRECTION
      ?auto_18586 - MODE
    )
    :vars
    (
      ?auto_18588 - INSTRUMENT
      ?auto_18587 - SATELLITE
      ?auto_18589 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18588 ?auto_18587 ) ( SUPPORTS ?auto_18588 ?auto_18583 ) ( POWER_ON ?auto_18588 ) ( POINTING ?auto_18587 ?auto_18589 ) ( not ( = ?auto_18582 ?auto_18589 ) ) ( HAVE_IMAGE ?auto_18584 ?auto_18581 ) ( not ( = ?auto_18584 ?auto_18582 ) ) ( not ( = ?auto_18584 ?auto_18589 ) ) ( not ( = ?auto_18581 ?auto_18583 ) ) ( CALIBRATION_TARGET ?auto_18588 ?auto_18589 ) ( NOT_CALIBRATED ?auto_18588 ) ( HAVE_IMAGE ?auto_18585 ?auto_18586 ) ( not ( = ?auto_18582 ?auto_18585 ) ) ( not ( = ?auto_18583 ?auto_18586 ) ) ( not ( = ?auto_18584 ?auto_18585 ) ) ( not ( = ?auto_18581 ?auto_18586 ) ) ( not ( = ?auto_18585 ?auto_18589 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18584 ?auto_18581 ?auto_18582 ?auto_18583 )
      ( GET-3IMAGE-VERIFY ?auto_18582 ?auto_18583 ?auto_18584 ?auto_18581 ?auto_18585 ?auto_18586 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18619 - DIRECTION
      ?auto_18620 - MODE
    )
    :vars
    (
      ?auto_18624 - INSTRUMENT
      ?auto_18621 - SATELLITE
      ?auto_18625 - DIRECTION
      ?auto_18623 - DIRECTION
      ?auto_18622 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_18624 ?auto_18621 ) ( SUPPORTS ?auto_18624 ?auto_18620 ) ( POINTING ?auto_18621 ?auto_18625 ) ( not ( = ?auto_18619 ?auto_18625 ) ) ( HAVE_IMAGE ?auto_18623 ?auto_18622 ) ( not ( = ?auto_18623 ?auto_18619 ) ) ( not ( = ?auto_18623 ?auto_18625 ) ) ( not ( = ?auto_18622 ?auto_18620 ) ) ( CALIBRATION_TARGET ?auto_18624 ?auto_18625 ) ( POWER_AVAIL ?auto_18621 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_18624 ?auto_18621 )
      ( GET-2IMAGE ?auto_18623 ?auto_18622 ?auto_18619 ?auto_18620 )
      ( GET-1IMAGE-VERIFY ?auto_18619 ?auto_18620 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18627 - DIRECTION
      ?auto_18628 - MODE
      ?auto_18629 - DIRECTION
      ?auto_18626 - MODE
    )
    :vars
    (
      ?auto_18632 - INSTRUMENT
      ?auto_18631 - SATELLITE
      ?auto_18630 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18632 ?auto_18631 ) ( SUPPORTS ?auto_18632 ?auto_18626 ) ( POINTING ?auto_18631 ?auto_18630 ) ( not ( = ?auto_18629 ?auto_18630 ) ) ( HAVE_IMAGE ?auto_18627 ?auto_18628 ) ( not ( = ?auto_18627 ?auto_18629 ) ) ( not ( = ?auto_18627 ?auto_18630 ) ) ( not ( = ?auto_18628 ?auto_18626 ) ) ( CALIBRATION_TARGET ?auto_18632 ?auto_18630 ) ( POWER_AVAIL ?auto_18631 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18629 ?auto_18626 )
      ( GET-2IMAGE-VERIFY ?auto_18627 ?auto_18628 ?auto_18629 ?auto_18626 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18634 - DIRECTION
      ?auto_18635 - MODE
      ?auto_18636 - DIRECTION
      ?auto_18633 - MODE
    )
    :vars
    (
      ?auto_18637 - INSTRUMENT
      ?auto_18639 - SATELLITE
      ?auto_18638 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18637 ?auto_18639 ) ( SUPPORTS ?auto_18637 ?auto_18635 ) ( POINTING ?auto_18639 ?auto_18638 ) ( not ( = ?auto_18634 ?auto_18638 ) ) ( HAVE_IMAGE ?auto_18636 ?auto_18633 ) ( not ( = ?auto_18636 ?auto_18634 ) ) ( not ( = ?auto_18636 ?auto_18638 ) ) ( not ( = ?auto_18633 ?auto_18635 ) ) ( CALIBRATION_TARGET ?auto_18637 ?auto_18638 ) ( POWER_AVAIL ?auto_18639 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18636 ?auto_18633 ?auto_18634 ?auto_18635 )
      ( GET-2IMAGE-VERIFY ?auto_18634 ?auto_18635 ?auto_18636 ?auto_18633 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18650 - DIRECTION
      ?auto_18651 - MODE
      ?auto_18652 - DIRECTION
      ?auto_18649 - MODE
      ?auto_18653 - DIRECTION
      ?auto_18654 - MODE
    )
    :vars
    (
      ?auto_18655 - INSTRUMENT
      ?auto_18657 - SATELLITE
      ?auto_18656 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18655 ?auto_18657 ) ( SUPPORTS ?auto_18655 ?auto_18654 ) ( POINTING ?auto_18657 ?auto_18656 ) ( not ( = ?auto_18653 ?auto_18656 ) ) ( HAVE_IMAGE ?auto_18650 ?auto_18649 ) ( not ( = ?auto_18650 ?auto_18653 ) ) ( not ( = ?auto_18650 ?auto_18656 ) ) ( not ( = ?auto_18649 ?auto_18654 ) ) ( CALIBRATION_TARGET ?auto_18655 ?auto_18656 ) ( POWER_AVAIL ?auto_18657 ) ( HAVE_IMAGE ?auto_18650 ?auto_18651 ) ( HAVE_IMAGE ?auto_18652 ?auto_18649 ) ( not ( = ?auto_18650 ?auto_18652 ) ) ( not ( = ?auto_18651 ?auto_18649 ) ) ( not ( = ?auto_18651 ?auto_18654 ) ) ( not ( = ?auto_18652 ?auto_18653 ) ) ( not ( = ?auto_18652 ?auto_18656 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18650 ?auto_18649 ?auto_18653 ?auto_18654 )
      ( GET-3IMAGE-VERIFY ?auto_18650 ?auto_18651 ?auto_18652 ?auto_18649 ?auto_18653 ?auto_18654 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18659 - DIRECTION
      ?auto_18660 - MODE
      ?auto_18661 - DIRECTION
      ?auto_18658 - MODE
      ?auto_18662 - DIRECTION
      ?auto_18663 - MODE
    )
    :vars
    (
      ?auto_18664 - INSTRUMENT
      ?auto_18666 - SATELLITE
      ?auto_18665 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18664 ?auto_18666 ) ( SUPPORTS ?auto_18664 ?auto_18658 ) ( POINTING ?auto_18666 ?auto_18665 ) ( not ( = ?auto_18661 ?auto_18665 ) ) ( HAVE_IMAGE ?auto_18659 ?auto_18663 ) ( not ( = ?auto_18659 ?auto_18661 ) ) ( not ( = ?auto_18659 ?auto_18665 ) ) ( not ( = ?auto_18663 ?auto_18658 ) ) ( CALIBRATION_TARGET ?auto_18664 ?auto_18665 ) ( POWER_AVAIL ?auto_18666 ) ( HAVE_IMAGE ?auto_18659 ?auto_18660 ) ( HAVE_IMAGE ?auto_18662 ?auto_18663 ) ( not ( = ?auto_18659 ?auto_18662 ) ) ( not ( = ?auto_18660 ?auto_18658 ) ) ( not ( = ?auto_18660 ?auto_18663 ) ) ( not ( = ?auto_18661 ?auto_18662 ) ) ( not ( = ?auto_18662 ?auto_18665 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18659 ?auto_18663 ?auto_18661 ?auto_18658 )
      ( GET-3IMAGE-VERIFY ?auto_18659 ?auto_18660 ?auto_18661 ?auto_18658 ?auto_18662 ?auto_18663 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18677 - DIRECTION
      ?auto_18678 - MODE
      ?auto_18679 - DIRECTION
      ?auto_18676 - MODE
      ?auto_18680 - DIRECTION
      ?auto_18681 - MODE
    )
    :vars
    (
      ?auto_18682 - INSTRUMENT
      ?auto_18684 - SATELLITE
      ?auto_18683 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18682 ?auto_18684 ) ( SUPPORTS ?auto_18682 ?auto_18678 ) ( POINTING ?auto_18684 ?auto_18683 ) ( not ( = ?auto_18677 ?auto_18683 ) ) ( HAVE_IMAGE ?auto_18679 ?auto_18676 ) ( not ( = ?auto_18679 ?auto_18677 ) ) ( not ( = ?auto_18679 ?auto_18683 ) ) ( not ( = ?auto_18676 ?auto_18678 ) ) ( CALIBRATION_TARGET ?auto_18682 ?auto_18683 ) ( POWER_AVAIL ?auto_18684 ) ( HAVE_IMAGE ?auto_18680 ?auto_18681 ) ( not ( = ?auto_18677 ?auto_18680 ) ) ( not ( = ?auto_18678 ?auto_18681 ) ) ( not ( = ?auto_18679 ?auto_18680 ) ) ( not ( = ?auto_18676 ?auto_18681 ) ) ( not ( = ?auto_18680 ?auto_18683 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18679 ?auto_18676 ?auto_18677 ?auto_18678 )
      ( GET-3IMAGE-VERIFY ?auto_18677 ?auto_18678 ?auto_18679 ?auto_18676 ?auto_18680 ?auto_18681 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18714 - DIRECTION
      ?auto_18715 - MODE
    )
    :vars
    (
      ?auto_18718 - INSTRUMENT
      ?auto_18720 - SATELLITE
      ?auto_18719 - DIRECTION
      ?auto_18716 - DIRECTION
      ?auto_18717 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_18718 ?auto_18720 ) ( SUPPORTS ?auto_18718 ?auto_18715 ) ( not ( = ?auto_18714 ?auto_18719 ) ) ( HAVE_IMAGE ?auto_18716 ?auto_18717 ) ( not ( = ?auto_18716 ?auto_18714 ) ) ( not ( = ?auto_18716 ?auto_18719 ) ) ( not ( = ?auto_18717 ?auto_18715 ) ) ( CALIBRATION_TARGET ?auto_18718 ?auto_18719 ) ( POWER_AVAIL ?auto_18720 ) ( POINTING ?auto_18720 ?auto_18716 ) )
    :subtasks
    ( ( !TURN_TO ?auto_18720 ?auto_18719 ?auto_18716 )
      ( GET-2IMAGE ?auto_18716 ?auto_18717 ?auto_18714 ?auto_18715 )
      ( GET-1IMAGE-VERIFY ?auto_18714 ?auto_18715 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18722 - DIRECTION
      ?auto_18723 - MODE
      ?auto_18724 - DIRECTION
      ?auto_18721 - MODE
    )
    :vars
    (
      ?auto_18726 - INSTRUMENT
      ?auto_18727 - SATELLITE
      ?auto_18725 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18726 ?auto_18727 ) ( SUPPORTS ?auto_18726 ?auto_18721 ) ( not ( = ?auto_18724 ?auto_18725 ) ) ( HAVE_IMAGE ?auto_18722 ?auto_18723 ) ( not ( = ?auto_18722 ?auto_18724 ) ) ( not ( = ?auto_18722 ?auto_18725 ) ) ( not ( = ?auto_18723 ?auto_18721 ) ) ( CALIBRATION_TARGET ?auto_18726 ?auto_18725 ) ( POWER_AVAIL ?auto_18727 ) ( POINTING ?auto_18727 ?auto_18722 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18724 ?auto_18721 )
      ( GET-2IMAGE-VERIFY ?auto_18722 ?auto_18723 ?auto_18724 ?auto_18721 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18729 - DIRECTION
      ?auto_18730 - MODE
      ?auto_18731 - DIRECTION
      ?auto_18728 - MODE
    )
    :vars
    (
      ?auto_18734 - INSTRUMENT
      ?auto_18732 - SATELLITE
      ?auto_18733 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18734 ?auto_18732 ) ( SUPPORTS ?auto_18734 ?auto_18730 ) ( not ( = ?auto_18729 ?auto_18733 ) ) ( HAVE_IMAGE ?auto_18731 ?auto_18728 ) ( not ( = ?auto_18731 ?auto_18729 ) ) ( not ( = ?auto_18731 ?auto_18733 ) ) ( not ( = ?auto_18728 ?auto_18730 ) ) ( CALIBRATION_TARGET ?auto_18734 ?auto_18733 ) ( POWER_AVAIL ?auto_18732 ) ( POINTING ?auto_18732 ?auto_18731 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18731 ?auto_18728 ?auto_18729 ?auto_18730 )
      ( GET-2IMAGE-VERIFY ?auto_18729 ?auto_18730 ?auto_18731 ?auto_18728 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18745 - DIRECTION
      ?auto_18746 - MODE
      ?auto_18747 - DIRECTION
      ?auto_18744 - MODE
      ?auto_18748 - DIRECTION
      ?auto_18749 - MODE
    )
    :vars
    (
      ?auto_18752 - INSTRUMENT
      ?auto_18750 - SATELLITE
      ?auto_18751 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18752 ?auto_18750 ) ( SUPPORTS ?auto_18752 ?auto_18749 ) ( not ( = ?auto_18748 ?auto_18751 ) ) ( HAVE_IMAGE ?auto_18747 ?auto_18746 ) ( not ( = ?auto_18747 ?auto_18748 ) ) ( not ( = ?auto_18747 ?auto_18751 ) ) ( not ( = ?auto_18746 ?auto_18749 ) ) ( CALIBRATION_TARGET ?auto_18752 ?auto_18751 ) ( POWER_AVAIL ?auto_18750 ) ( POINTING ?auto_18750 ?auto_18747 ) ( HAVE_IMAGE ?auto_18745 ?auto_18746 ) ( HAVE_IMAGE ?auto_18747 ?auto_18744 ) ( not ( = ?auto_18745 ?auto_18747 ) ) ( not ( = ?auto_18745 ?auto_18748 ) ) ( not ( = ?auto_18745 ?auto_18751 ) ) ( not ( = ?auto_18746 ?auto_18744 ) ) ( not ( = ?auto_18744 ?auto_18749 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18747 ?auto_18746 ?auto_18748 ?auto_18749 )
      ( GET-3IMAGE-VERIFY ?auto_18745 ?auto_18746 ?auto_18747 ?auto_18744 ?auto_18748 ?auto_18749 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18754 - DIRECTION
      ?auto_18755 - MODE
      ?auto_18756 - DIRECTION
      ?auto_18753 - MODE
      ?auto_18757 - DIRECTION
      ?auto_18758 - MODE
    )
    :vars
    (
      ?auto_18761 - INSTRUMENT
      ?auto_18759 - SATELLITE
      ?auto_18760 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18761 ?auto_18759 ) ( SUPPORTS ?auto_18761 ?auto_18753 ) ( not ( = ?auto_18756 ?auto_18760 ) ) ( HAVE_IMAGE ?auto_18757 ?auto_18758 ) ( not ( = ?auto_18757 ?auto_18756 ) ) ( not ( = ?auto_18757 ?auto_18760 ) ) ( not ( = ?auto_18758 ?auto_18753 ) ) ( CALIBRATION_TARGET ?auto_18761 ?auto_18760 ) ( POWER_AVAIL ?auto_18759 ) ( POINTING ?auto_18759 ?auto_18757 ) ( HAVE_IMAGE ?auto_18754 ?auto_18755 ) ( not ( = ?auto_18754 ?auto_18756 ) ) ( not ( = ?auto_18754 ?auto_18757 ) ) ( not ( = ?auto_18754 ?auto_18760 ) ) ( not ( = ?auto_18755 ?auto_18753 ) ) ( not ( = ?auto_18755 ?auto_18758 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18757 ?auto_18758 ?auto_18756 ?auto_18753 )
      ( GET-3IMAGE-VERIFY ?auto_18754 ?auto_18755 ?auto_18756 ?auto_18753 ?auto_18757 ?auto_18758 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18772 - DIRECTION
      ?auto_18773 - MODE
      ?auto_18774 - DIRECTION
      ?auto_18771 - MODE
      ?auto_18775 - DIRECTION
      ?auto_18776 - MODE
    )
    :vars
    (
      ?auto_18779 - INSTRUMENT
      ?auto_18777 - SATELLITE
      ?auto_18778 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_18779 ?auto_18777 ) ( SUPPORTS ?auto_18779 ?auto_18773 ) ( not ( = ?auto_18772 ?auto_18778 ) ) ( HAVE_IMAGE ?auto_18775 ?auto_18776 ) ( not ( = ?auto_18775 ?auto_18772 ) ) ( not ( = ?auto_18775 ?auto_18778 ) ) ( not ( = ?auto_18776 ?auto_18773 ) ) ( CALIBRATION_TARGET ?auto_18779 ?auto_18778 ) ( POWER_AVAIL ?auto_18777 ) ( POINTING ?auto_18777 ?auto_18775 ) ( HAVE_IMAGE ?auto_18774 ?auto_18771 ) ( not ( = ?auto_18772 ?auto_18774 ) ) ( not ( = ?auto_18773 ?auto_18771 ) ) ( not ( = ?auto_18774 ?auto_18775 ) ) ( not ( = ?auto_18774 ?auto_18778 ) ) ( not ( = ?auto_18771 ?auto_18776 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18775 ?auto_18776 ?auto_18772 ?auto_18773 )
      ( GET-3IMAGE-VERIFY ?auto_18772 ?auto_18773 ?auto_18774 ?auto_18771 ?auto_18775 ?auto_18776 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18809 - DIRECTION
      ?auto_18810 - MODE
    )
    :vars
    (
      ?auto_18815 - INSTRUMENT
      ?auto_18811 - SATELLITE
      ?auto_18812 - DIRECTION
      ?auto_18814 - DIRECTION
      ?auto_18813 - MODE
      ?auto_18816 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18815 ?auto_18811 ) ( SUPPORTS ?auto_18815 ?auto_18810 ) ( not ( = ?auto_18809 ?auto_18812 ) ) ( HAVE_IMAGE ?auto_18814 ?auto_18813 ) ( not ( = ?auto_18814 ?auto_18809 ) ) ( not ( = ?auto_18814 ?auto_18812 ) ) ( not ( = ?auto_18813 ?auto_18810 ) ) ( CALIBRATION_TARGET ?auto_18815 ?auto_18812 ) ( POINTING ?auto_18811 ?auto_18814 ) ( ON_BOARD ?auto_18816 ?auto_18811 ) ( POWER_ON ?auto_18816 ) ( not ( = ?auto_18815 ?auto_18816 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_18816 ?auto_18811 )
      ( GET-2IMAGE ?auto_18814 ?auto_18813 ?auto_18809 ?auto_18810 )
      ( GET-1IMAGE-VERIFY ?auto_18809 ?auto_18810 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18818 - DIRECTION
      ?auto_18819 - MODE
      ?auto_18820 - DIRECTION
      ?auto_18817 - MODE
    )
    :vars
    (
      ?auto_18824 - INSTRUMENT
      ?auto_18822 - SATELLITE
      ?auto_18823 - DIRECTION
      ?auto_18821 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18824 ?auto_18822 ) ( SUPPORTS ?auto_18824 ?auto_18817 ) ( not ( = ?auto_18820 ?auto_18823 ) ) ( HAVE_IMAGE ?auto_18818 ?auto_18819 ) ( not ( = ?auto_18818 ?auto_18820 ) ) ( not ( = ?auto_18818 ?auto_18823 ) ) ( not ( = ?auto_18819 ?auto_18817 ) ) ( CALIBRATION_TARGET ?auto_18824 ?auto_18823 ) ( POINTING ?auto_18822 ?auto_18818 ) ( ON_BOARD ?auto_18821 ?auto_18822 ) ( POWER_ON ?auto_18821 ) ( not ( = ?auto_18824 ?auto_18821 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18820 ?auto_18817 )
      ( GET-2IMAGE-VERIFY ?auto_18818 ?auto_18819 ?auto_18820 ?auto_18817 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18826 - DIRECTION
      ?auto_18827 - MODE
      ?auto_18828 - DIRECTION
      ?auto_18825 - MODE
    )
    :vars
    (
      ?auto_18831 - INSTRUMENT
      ?auto_18830 - SATELLITE
      ?auto_18829 - DIRECTION
      ?auto_18832 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18831 ?auto_18830 ) ( SUPPORTS ?auto_18831 ?auto_18827 ) ( not ( = ?auto_18826 ?auto_18829 ) ) ( HAVE_IMAGE ?auto_18828 ?auto_18825 ) ( not ( = ?auto_18828 ?auto_18826 ) ) ( not ( = ?auto_18828 ?auto_18829 ) ) ( not ( = ?auto_18825 ?auto_18827 ) ) ( CALIBRATION_TARGET ?auto_18831 ?auto_18829 ) ( POINTING ?auto_18830 ?auto_18828 ) ( ON_BOARD ?auto_18832 ?auto_18830 ) ( POWER_ON ?auto_18832 ) ( not ( = ?auto_18831 ?auto_18832 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18828 ?auto_18825 ?auto_18826 ?auto_18827 )
      ( GET-2IMAGE-VERIFY ?auto_18826 ?auto_18827 ?auto_18828 ?auto_18825 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18844 - DIRECTION
      ?auto_18845 - MODE
      ?auto_18846 - DIRECTION
      ?auto_18843 - MODE
      ?auto_18847 - DIRECTION
      ?auto_18848 - MODE
    )
    :vars
    (
      ?auto_18851 - INSTRUMENT
      ?auto_18850 - SATELLITE
      ?auto_18849 - DIRECTION
      ?auto_18852 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18851 ?auto_18850 ) ( SUPPORTS ?auto_18851 ?auto_18848 ) ( not ( = ?auto_18847 ?auto_18849 ) ) ( HAVE_IMAGE ?auto_18846 ?auto_18843 ) ( not ( = ?auto_18846 ?auto_18847 ) ) ( not ( = ?auto_18846 ?auto_18849 ) ) ( not ( = ?auto_18843 ?auto_18848 ) ) ( CALIBRATION_TARGET ?auto_18851 ?auto_18849 ) ( POINTING ?auto_18850 ?auto_18846 ) ( ON_BOARD ?auto_18852 ?auto_18850 ) ( POWER_ON ?auto_18852 ) ( not ( = ?auto_18851 ?auto_18852 ) ) ( HAVE_IMAGE ?auto_18844 ?auto_18845 ) ( not ( = ?auto_18844 ?auto_18846 ) ) ( not ( = ?auto_18844 ?auto_18847 ) ) ( not ( = ?auto_18844 ?auto_18849 ) ) ( not ( = ?auto_18845 ?auto_18843 ) ) ( not ( = ?auto_18845 ?auto_18848 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18846 ?auto_18843 ?auto_18847 ?auto_18848 )
      ( GET-3IMAGE-VERIFY ?auto_18844 ?auto_18845 ?auto_18846 ?auto_18843 ?auto_18847 ?auto_18848 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18854 - DIRECTION
      ?auto_18855 - MODE
      ?auto_18856 - DIRECTION
      ?auto_18853 - MODE
      ?auto_18857 - DIRECTION
      ?auto_18858 - MODE
    )
    :vars
    (
      ?auto_18861 - INSTRUMENT
      ?auto_18860 - SATELLITE
      ?auto_18859 - DIRECTION
      ?auto_18862 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18861 ?auto_18860 ) ( SUPPORTS ?auto_18861 ?auto_18853 ) ( not ( = ?auto_18856 ?auto_18859 ) ) ( HAVE_IMAGE ?auto_18857 ?auto_18855 ) ( not ( = ?auto_18857 ?auto_18856 ) ) ( not ( = ?auto_18857 ?auto_18859 ) ) ( not ( = ?auto_18855 ?auto_18853 ) ) ( CALIBRATION_TARGET ?auto_18861 ?auto_18859 ) ( POINTING ?auto_18860 ?auto_18857 ) ( ON_BOARD ?auto_18862 ?auto_18860 ) ( POWER_ON ?auto_18862 ) ( not ( = ?auto_18861 ?auto_18862 ) ) ( HAVE_IMAGE ?auto_18854 ?auto_18855 ) ( HAVE_IMAGE ?auto_18857 ?auto_18858 ) ( not ( = ?auto_18854 ?auto_18856 ) ) ( not ( = ?auto_18854 ?auto_18857 ) ) ( not ( = ?auto_18854 ?auto_18859 ) ) ( not ( = ?auto_18855 ?auto_18858 ) ) ( not ( = ?auto_18853 ?auto_18858 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18857 ?auto_18855 ?auto_18856 ?auto_18853 )
      ( GET-3IMAGE-VERIFY ?auto_18854 ?auto_18855 ?auto_18856 ?auto_18853 ?auto_18857 ?auto_18858 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18874 - DIRECTION
      ?auto_18875 - MODE
      ?auto_18876 - DIRECTION
      ?auto_18873 - MODE
      ?auto_18877 - DIRECTION
      ?auto_18878 - MODE
    )
    :vars
    (
      ?auto_18881 - INSTRUMENT
      ?auto_18880 - SATELLITE
      ?auto_18879 - DIRECTION
      ?auto_18882 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18881 ?auto_18880 ) ( SUPPORTS ?auto_18881 ?auto_18875 ) ( not ( = ?auto_18874 ?auto_18879 ) ) ( HAVE_IMAGE ?auto_18877 ?auto_18873 ) ( not ( = ?auto_18877 ?auto_18874 ) ) ( not ( = ?auto_18877 ?auto_18879 ) ) ( not ( = ?auto_18873 ?auto_18875 ) ) ( CALIBRATION_TARGET ?auto_18881 ?auto_18879 ) ( POINTING ?auto_18880 ?auto_18877 ) ( ON_BOARD ?auto_18882 ?auto_18880 ) ( POWER_ON ?auto_18882 ) ( not ( = ?auto_18881 ?auto_18882 ) ) ( HAVE_IMAGE ?auto_18876 ?auto_18873 ) ( HAVE_IMAGE ?auto_18877 ?auto_18878 ) ( not ( = ?auto_18874 ?auto_18876 ) ) ( not ( = ?auto_18875 ?auto_18878 ) ) ( not ( = ?auto_18876 ?auto_18877 ) ) ( not ( = ?auto_18876 ?auto_18879 ) ) ( not ( = ?auto_18873 ?auto_18878 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18877 ?auto_18873 ?auto_18874 ?auto_18875 )
      ( GET-3IMAGE-VERIFY ?auto_18874 ?auto_18875 ?auto_18876 ?auto_18873 ?auto_18877 ?auto_18878 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18915 - DIRECTION
      ?auto_18916 - MODE
    )
    :vars
    (
      ?auto_18919 - INSTRUMENT
      ?auto_18918 - SATELLITE
      ?auto_18917 - DIRECTION
      ?auto_18921 - DIRECTION
      ?auto_18922 - MODE
      ?auto_18920 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18919 ?auto_18918 ) ( SUPPORTS ?auto_18919 ?auto_18916 ) ( not ( = ?auto_18915 ?auto_18917 ) ) ( not ( = ?auto_18921 ?auto_18915 ) ) ( not ( = ?auto_18921 ?auto_18917 ) ) ( not ( = ?auto_18922 ?auto_18916 ) ) ( CALIBRATION_TARGET ?auto_18919 ?auto_18917 ) ( POINTING ?auto_18918 ?auto_18921 ) ( ON_BOARD ?auto_18920 ?auto_18918 ) ( POWER_ON ?auto_18920 ) ( not ( = ?auto_18919 ?auto_18920 ) ) ( CALIBRATED ?auto_18920 ) ( SUPPORTS ?auto_18920 ?auto_18922 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18921 ?auto_18922 )
      ( GET-2IMAGE ?auto_18921 ?auto_18922 ?auto_18915 ?auto_18916 )
      ( GET-1IMAGE-VERIFY ?auto_18915 ?auto_18916 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18924 - DIRECTION
      ?auto_18925 - MODE
      ?auto_18926 - DIRECTION
      ?auto_18923 - MODE
    )
    :vars
    (
      ?auto_18929 - INSTRUMENT
      ?auto_18930 - SATELLITE
      ?auto_18927 - DIRECTION
      ?auto_18928 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18929 ?auto_18930 ) ( SUPPORTS ?auto_18929 ?auto_18923 ) ( not ( = ?auto_18926 ?auto_18927 ) ) ( not ( = ?auto_18924 ?auto_18926 ) ) ( not ( = ?auto_18924 ?auto_18927 ) ) ( not ( = ?auto_18925 ?auto_18923 ) ) ( CALIBRATION_TARGET ?auto_18929 ?auto_18927 ) ( POINTING ?auto_18930 ?auto_18924 ) ( ON_BOARD ?auto_18928 ?auto_18930 ) ( POWER_ON ?auto_18928 ) ( not ( = ?auto_18929 ?auto_18928 ) ) ( CALIBRATED ?auto_18928 ) ( SUPPORTS ?auto_18928 ?auto_18925 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18926 ?auto_18923 )
      ( GET-2IMAGE-VERIFY ?auto_18924 ?auto_18925 ?auto_18926 ?auto_18923 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18932 - DIRECTION
      ?auto_18933 - MODE
      ?auto_18934 - DIRECTION
      ?auto_18931 - MODE
    )
    :vars
    (
      ?auto_18935 - INSTRUMENT
      ?auto_18936 - SATELLITE
      ?auto_18937 - DIRECTION
      ?auto_18938 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18935 ?auto_18936 ) ( SUPPORTS ?auto_18935 ?auto_18933 ) ( not ( = ?auto_18932 ?auto_18937 ) ) ( not ( = ?auto_18934 ?auto_18932 ) ) ( not ( = ?auto_18934 ?auto_18937 ) ) ( not ( = ?auto_18931 ?auto_18933 ) ) ( CALIBRATION_TARGET ?auto_18935 ?auto_18937 ) ( POINTING ?auto_18936 ?auto_18934 ) ( ON_BOARD ?auto_18938 ?auto_18936 ) ( POWER_ON ?auto_18938 ) ( not ( = ?auto_18935 ?auto_18938 ) ) ( CALIBRATED ?auto_18938 ) ( SUPPORTS ?auto_18938 ?auto_18931 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18934 ?auto_18931 ?auto_18932 ?auto_18933 )
      ( GET-2IMAGE-VERIFY ?auto_18932 ?auto_18933 ?auto_18934 ?auto_18931 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_19021 - DIRECTION
      ?auto_19022 - MODE
    )
    :vars
    (
      ?auto_19025 - INSTRUMENT
      ?auto_19026 - SATELLITE
      ?auto_19027 - DIRECTION
      ?auto_19023 - DIRECTION
      ?auto_19024 - MODE
      ?auto_19028 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19025 ?auto_19026 ) ( SUPPORTS ?auto_19025 ?auto_19022 ) ( not ( = ?auto_19021 ?auto_19027 ) ) ( not ( = ?auto_19023 ?auto_19021 ) ) ( not ( = ?auto_19023 ?auto_19027 ) ) ( not ( = ?auto_19024 ?auto_19022 ) ) ( CALIBRATION_TARGET ?auto_19025 ?auto_19027 ) ( ON_BOARD ?auto_19028 ?auto_19026 ) ( POWER_ON ?auto_19028 ) ( not ( = ?auto_19025 ?auto_19028 ) ) ( CALIBRATED ?auto_19028 ) ( SUPPORTS ?auto_19028 ?auto_19024 ) ( POINTING ?auto_19026 ?auto_19027 ) )
    :subtasks
    ( ( !TURN_TO ?auto_19026 ?auto_19023 ?auto_19027 )
      ( GET-2IMAGE ?auto_19023 ?auto_19024 ?auto_19021 ?auto_19022 )
      ( GET-1IMAGE-VERIFY ?auto_19021 ?auto_19022 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19030 - DIRECTION
      ?auto_19031 - MODE
      ?auto_19032 - DIRECTION
      ?auto_19029 - MODE
    )
    :vars
    (
      ?auto_19036 - INSTRUMENT
      ?auto_19034 - SATELLITE
      ?auto_19033 - DIRECTION
      ?auto_19035 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19036 ?auto_19034 ) ( SUPPORTS ?auto_19036 ?auto_19029 ) ( not ( = ?auto_19032 ?auto_19033 ) ) ( not ( = ?auto_19030 ?auto_19032 ) ) ( not ( = ?auto_19030 ?auto_19033 ) ) ( not ( = ?auto_19031 ?auto_19029 ) ) ( CALIBRATION_TARGET ?auto_19036 ?auto_19033 ) ( ON_BOARD ?auto_19035 ?auto_19034 ) ( POWER_ON ?auto_19035 ) ( not ( = ?auto_19036 ?auto_19035 ) ) ( CALIBRATED ?auto_19035 ) ( SUPPORTS ?auto_19035 ?auto_19031 ) ( POINTING ?auto_19034 ?auto_19033 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_19032 ?auto_19029 )
      ( GET-2IMAGE-VERIFY ?auto_19030 ?auto_19031 ?auto_19032 ?auto_19029 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19038 - DIRECTION
      ?auto_19039 - MODE
      ?auto_19040 - DIRECTION
      ?auto_19037 - MODE
    )
    :vars
    (
      ?auto_19043 - INSTRUMENT
      ?auto_19041 - SATELLITE
      ?auto_19044 - DIRECTION
      ?auto_19042 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19043 ?auto_19041 ) ( SUPPORTS ?auto_19043 ?auto_19039 ) ( not ( = ?auto_19038 ?auto_19044 ) ) ( not ( = ?auto_19040 ?auto_19038 ) ) ( not ( = ?auto_19040 ?auto_19044 ) ) ( not ( = ?auto_19037 ?auto_19039 ) ) ( CALIBRATION_TARGET ?auto_19043 ?auto_19044 ) ( ON_BOARD ?auto_19042 ?auto_19041 ) ( POWER_ON ?auto_19042 ) ( not ( = ?auto_19043 ?auto_19042 ) ) ( CALIBRATED ?auto_19042 ) ( SUPPORTS ?auto_19042 ?auto_19037 ) ( POINTING ?auto_19041 ?auto_19044 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19040 ?auto_19037 ?auto_19038 ?auto_19039 )
      ( GET-2IMAGE-VERIFY ?auto_19038 ?auto_19039 ?auto_19040 ?auto_19037 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_19127 - DIRECTION
      ?auto_19128 - MODE
    )
    :vars
    (
      ?auto_19133 - INSTRUMENT
      ?auto_19130 - SATELLITE
      ?auto_19134 - DIRECTION
      ?auto_19132 - DIRECTION
      ?auto_19129 - MODE
      ?auto_19131 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19133 ?auto_19130 ) ( SUPPORTS ?auto_19133 ?auto_19128 ) ( not ( = ?auto_19127 ?auto_19134 ) ) ( not ( = ?auto_19132 ?auto_19127 ) ) ( not ( = ?auto_19132 ?auto_19134 ) ) ( not ( = ?auto_19129 ?auto_19128 ) ) ( CALIBRATION_TARGET ?auto_19133 ?auto_19134 ) ( ON_BOARD ?auto_19131 ?auto_19130 ) ( POWER_ON ?auto_19131 ) ( not ( = ?auto_19133 ?auto_19131 ) ) ( SUPPORTS ?auto_19131 ?auto_19129 ) ( POINTING ?auto_19130 ?auto_19134 ) ( CALIBRATION_TARGET ?auto_19131 ?auto_19134 ) ( NOT_CALIBRATED ?auto_19131 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_19130 ?auto_19131 ?auto_19134 )
      ( GET-2IMAGE ?auto_19132 ?auto_19129 ?auto_19127 ?auto_19128 )
      ( GET-1IMAGE-VERIFY ?auto_19127 ?auto_19128 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19136 - DIRECTION
      ?auto_19137 - MODE
      ?auto_19138 - DIRECTION
      ?auto_19135 - MODE
    )
    :vars
    (
      ?auto_19142 - INSTRUMENT
      ?auto_19139 - SATELLITE
      ?auto_19141 - DIRECTION
      ?auto_19140 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19142 ?auto_19139 ) ( SUPPORTS ?auto_19142 ?auto_19135 ) ( not ( = ?auto_19138 ?auto_19141 ) ) ( not ( = ?auto_19136 ?auto_19138 ) ) ( not ( = ?auto_19136 ?auto_19141 ) ) ( not ( = ?auto_19137 ?auto_19135 ) ) ( CALIBRATION_TARGET ?auto_19142 ?auto_19141 ) ( ON_BOARD ?auto_19140 ?auto_19139 ) ( POWER_ON ?auto_19140 ) ( not ( = ?auto_19142 ?auto_19140 ) ) ( SUPPORTS ?auto_19140 ?auto_19137 ) ( POINTING ?auto_19139 ?auto_19141 ) ( CALIBRATION_TARGET ?auto_19140 ?auto_19141 ) ( NOT_CALIBRATED ?auto_19140 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_19138 ?auto_19135 )
      ( GET-2IMAGE-VERIFY ?auto_19136 ?auto_19137 ?auto_19138 ?auto_19135 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19144 - DIRECTION
      ?auto_19145 - MODE
      ?auto_19146 - DIRECTION
      ?auto_19143 - MODE
    )
    :vars
    (
      ?auto_19147 - INSTRUMENT
      ?auto_19149 - SATELLITE
      ?auto_19150 - DIRECTION
      ?auto_19148 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19147 ?auto_19149 ) ( SUPPORTS ?auto_19147 ?auto_19145 ) ( not ( = ?auto_19144 ?auto_19150 ) ) ( not ( = ?auto_19146 ?auto_19144 ) ) ( not ( = ?auto_19146 ?auto_19150 ) ) ( not ( = ?auto_19143 ?auto_19145 ) ) ( CALIBRATION_TARGET ?auto_19147 ?auto_19150 ) ( ON_BOARD ?auto_19148 ?auto_19149 ) ( POWER_ON ?auto_19148 ) ( not ( = ?auto_19147 ?auto_19148 ) ) ( SUPPORTS ?auto_19148 ?auto_19143 ) ( POINTING ?auto_19149 ?auto_19150 ) ( CALIBRATION_TARGET ?auto_19148 ?auto_19150 ) ( NOT_CALIBRATED ?auto_19148 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19146 ?auto_19143 ?auto_19144 ?auto_19145 )
      ( GET-2IMAGE-VERIFY ?auto_19144 ?auto_19145 ?auto_19146 ?auto_19143 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19773 - DIRECTION
      ?auto_19774 - MODE
      ?auto_19775 - DIRECTION
      ?auto_19772 - MODE
      ?auto_19776 - DIRECTION
      ?auto_19777 - MODE
    )
    :vars
    (
      ?auto_19779 - INSTRUMENT
      ?auto_19780 - SATELLITE
      ?auto_19778 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_19779 ) ( ON_BOARD ?auto_19779 ?auto_19780 ) ( SUPPORTS ?auto_19779 ?auto_19772 ) ( POWER_ON ?auto_19779 ) ( POINTING ?auto_19780 ?auto_19778 ) ( not ( = ?auto_19775 ?auto_19778 ) ) ( HAVE_IMAGE ?auto_19773 ?auto_19774 ) ( not ( = ?auto_19773 ?auto_19775 ) ) ( not ( = ?auto_19773 ?auto_19778 ) ) ( not ( = ?auto_19774 ?auto_19772 ) ) ( HAVE_IMAGE ?auto_19776 ?auto_19777 ) ( not ( = ?auto_19773 ?auto_19776 ) ) ( not ( = ?auto_19774 ?auto_19777 ) ) ( not ( = ?auto_19775 ?auto_19776 ) ) ( not ( = ?auto_19772 ?auto_19777 ) ) ( not ( = ?auto_19776 ?auto_19778 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19773 ?auto_19774 ?auto_19775 ?auto_19772 )
      ( GET-3IMAGE-VERIFY ?auto_19773 ?auto_19774 ?auto_19775 ?auto_19772 ?auto_19776 ?auto_19777 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19803 - DIRECTION
      ?auto_19804 - MODE
      ?auto_19805 - DIRECTION
      ?auto_19802 - MODE
      ?auto_19806 - DIRECTION
      ?auto_19807 - MODE
    )
    :vars
    (
      ?auto_19811 - INSTRUMENT
      ?auto_19812 - SATELLITE
      ?auto_19810 - DIRECTION
      ?auto_19809 - DIRECTION
      ?auto_19808 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_19811 ) ( ON_BOARD ?auto_19811 ?auto_19812 ) ( SUPPORTS ?auto_19811 ?auto_19807 ) ( POWER_ON ?auto_19811 ) ( POINTING ?auto_19812 ?auto_19810 ) ( not ( = ?auto_19806 ?auto_19810 ) ) ( HAVE_IMAGE ?auto_19809 ?auto_19808 ) ( not ( = ?auto_19809 ?auto_19806 ) ) ( not ( = ?auto_19809 ?auto_19810 ) ) ( not ( = ?auto_19808 ?auto_19807 ) ) ( HAVE_IMAGE ?auto_19803 ?auto_19804 ) ( HAVE_IMAGE ?auto_19805 ?auto_19802 ) ( not ( = ?auto_19803 ?auto_19805 ) ) ( not ( = ?auto_19803 ?auto_19806 ) ) ( not ( = ?auto_19803 ?auto_19810 ) ) ( not ( = ?auto_19803 ?auto_19809 ) ) ( not ( = ?auto_19804 ?auto_19802 ) ) ( not ( = ?auto_19804 ?auto_19807 ) ) ( not ( = ?auto_19804 ?auto_19808 ) ) ( not ( = ?auto_19805 ?auto_19806 ) ) ( not ( = ?auto_19805 ?auto_19810 ) ) ( not ( = ?auto_19805 ?auto_19809 ) ) ( not ( = ?auto_19802 ?auto_19807 ) ) ( not ( = ?auto_19802 ?auto_19808 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19809 ?auto_19808 ?auto_19806 ?auto_19807 )
      ( GET-3IMAGE-VERIFY ?auto_19803 ?auto_19804 ?auto_19805 ?auto_19802 ?auto_19806 ?auto_19807 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19820 - DIRECTION
      ?auto_19821 - MODE
      ?auto_19822 - DIRECTION
      ?auto_19819 - MODE
      ?auto_19823 - DIRECTION
      ?auto_19824 - MODE
    )
    :vars
    (
      ?auto_19828 - INSTRUMENT
      ?auto_19829 - SATELLITE
      ?auto_19827 - DIRECTION
      ?auto_19826 - DIRECTION
      ?auto_19825 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_19828 ) ( ON_BOARD ?auto_19828 ?auto_19829 ) ( SUPPORTS ?auto_19828 ?auto_19819 ) ( POWER_ON ?auto_19828 ) ( POINTING ?auto_19829 ?auto_19827 ) ( not ( = ?auto_19822 ?auto_19827 ) ) ( HAVE_IMAGE ?auto_19826 ?auto_19825 ) ( not ( = ?auto_19826 ?auto_19822 ) ) ( not ( = ?auto_19826 ?auto_19827 ) ) ( not ( = ?auto_19825 ?auto_19819 ) ) ( HAVE_IMAGE ?auto_19820 ?auto_19821 ) ( HAVE_IMAGE ?auto_19823 ?auto_19824 ) ( not ( = ?auto_19820 ?auto_19822 ) ) ( not ( = ?auto_19820 ?auto_19823 ) ) ( not ( = ?auto_19820 ?auto_19827 ) ) ( not ( = ?auto_19820 ?auto_19826 ) ) ( not ( = ?auto_19821 ?auto_19819 ) ) ( not ( = ?auto_19821 ?auto_19824 ) ) ( not ( = ?auto_19821 ?auto_19825 ) ) ( not ( = ?auto_19822 ?auto_19823 ) ) ( not ( = ?auto_19819 ?auto_19824 ) ) ( not ( = ?auto_19823 ?auto_19827 ) ) ( not ( = ?auto_19823 ?auto_19826 ) ) ( not ( = ?auto_19824 ?auto_19825 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19826 ?auto_19825 ?auto_19822 ?auto_19819 )
      ( GET-3IMAGE-VERIFY ?auto_19820 ?auto_19821 ?auto_19822 ?auto_19819 ?auto_19823 ?auto_19824 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19842 - DIRECTION
      ?auto_19843 - MODE
      ?auto_19844 - DIRECTION
      ?auto_19841 - MODE
      ?auto_19845 - DIRECTION
      ?auto_19846 - MODE
    )
    :vars
    (
      ?auto_19848 - INSTRUMENT
      ?auto_19849 - SATELLITE
      ?auto_19847 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_19848 ) ( ON_BOARD ?auto_19848 ?auto_19849 ) ( SUPPORTS ?auto_19848 ?auto_19843 ) ( POWER_ON ?auto_19848 ) ( POINTING ?auto_19849 ?auto_19847 ) ( not ( = ?auto_19842 ?auto_19847 ) ) ( HAVE_IMAGE ?auto_19844 ?auto_19841 ) ( not ( = ?auto_19844 ?auto_19842 ) ) ( not ( = ?auto_19844 ?auto_19847 ) ) ( not ( = ?auto_19841 ?auto_19843 ) ) ( HAVE_IMAGE ?auto_19845 ?auto_19846 ) ( not ( = ?auto_19842 ?auto_19845 ) ) ( not ( = ?auto_19843 ?auto_19846 ) ) ( not ( = ?auto_19844 ?auto_19845 ) ) ( not ( = ?auto_19841 ?auto_19846 ) ) ( not ( = ?auto_19845 ?auto_19847 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19844 ?auto_19841 ?auto_19842 ?auto_19843 )
      ( GET-3IMAGE-VERIFY ?auto_19842 ?auto_19843 ?auto_19844 ?auto_19841 ?auto_19845 ?auto_19846 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19872 - DIRECTION
      ?auto_19873 - MODE
      ?auto_19874 - DIRECTION
      ?auto_19871 - MODE
      ?auto_19875 - DIRECTION
      ?auto_19876 - MODE
    )
    :vars
    (
      ?auto_19880 - INSTRUMENT
      ?auto_19881 - SATELLITE
      ?auto_19879 - DIRECTION
      ?auto_19878 - DIRECTION
      ?auto_19877 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_19880 ) ( ON_BOARD ?auto_19880 ?auto_19881 ) ( SUPPORTS ?auto_19880 ?auto_19873 ) ( POWER_ON ?auto_19880 ) ( POINTING ?auto_19881 ?auto_19879 ) ( not ( = ?auto_19872 ?auto_19879 ) ) ( HAVE_IMAGE ?auto_19878 ?auto_19877 ) ( not ( = ?auto_19878 ?auto_19872 ) ) ( not ( = ?auto_19878 ?auto_19879 ) ) ( not ( = ?auto_19877 ?auto_19873 ) ) ( HAVE_IMAGE ?auto_19874 ?auto_19871 ) ( HAVE_IMAGE ?auto_19875 ?auto_19876 ) ( not ( = ?auto_19872 ?auto_19874 ) ) ( not ( = ?auto_19872 ?auto_19875 ) ) ( not ( = ?auto_19873 ?auto_19871 ) ) ( not ( = ?auto_19873 ?auto_19876 ) ) ( not ( = ?auto_19874 ?auto_19875 ) ) ( not ( = ?auto_19874 ?auto_19879 ) ) ( not ( = ?auto_19874 ?auto_19878 ) ) ( not ( = ?auto_19871 ?auto_19876 ) ) ( not ( = ?auto_19871 ?auto_19877 ) ) ( not ( = ?auto_19875 ?auto_19879 ) ) ( not ( = ?auto_19875 ?auto_19878 ) ) ( not ( = ?auto_19876 ?auto_19877 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19878 ?auto_19877 ?auto_19872 ?auto_19873 )
      ( GET-3IMAGE-VERIFY ?auto_19872 ?auto_19873 ?auto_19874 ?auto_19871 ?auto_19875 ?auto_19876 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19963 - DIRECTION
      ?auto_19964 - MODE
      ?auto_19965 - DIRECTION
      ?auto_19962 - MODE
      ?auto_19966 - DIRECTION
      ?auto_19967 - MODE
    )
    :vars
    (
      ?auto_19969 - INSTRUMENT
      ?auto_19970 - SATELLITE
      ?auto_19968 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19969 ?auto_19970 ) ( SUPPORTS ?auto_19969 ?auto_19967 ) ( POWER_ON ?auto_19969 ) ( POINTING ?auto_19970 ?auto_19968 ) ( not ( = ?auto_19966 ?auto_19968 ) ) ( HAVE_IMAGE ?auto_19963 ?auto_19962 ) ( not ( = ?auto_19963 ?auto_19966 ) ) ( not ( = ?auto_19963 ?auto_19968 ) ) ( not ( = ?auto_19962 ?auto_19967 ) ) ( CALIBRATION_TARGET ?auto_19969 ?auto_19968 ) ( NOT_CALIBRATED ?auto_19969 ) ( HAVE_IMAGE ?auto_19963 ?auto_19964 ) ( HAVE_IMAGE ?auto_19965 ?auto_19962 ) ( not ( = ?auto_19963 ?auto_19965 ) ) ( not ( = ?auto_19964 ?auto_19962 ) ) ( not ( = ?auto_19964 ?auto_19967 ) ) ( not ( = ?auto_19965 ?auto_19966 ) ) ( not ( = ?auto_19965 ?auto_19968 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19963 ?auto_19962 ?auto_19966 ?auto_19967 )
      ( GET-3IMAGE-VERIFY ?auto_19963 ?auto_19964 ?auto_19965 ?auto_19962 ?auto_19966 ?auto_19967 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19972 - DIRECTION
      ?auto_19973 - MODE
      ?auto_19974 - DIRECTION
      ?auto_19971 - MODE
      ?auto_19975 - DIRECTION
      ?auto_19976 - MODE
    )
    :vars
    (
      ?auto_19978 - INSTRUMENT
      ?auto_19979 - SATELLITE
      ?auto_19977 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19978 ?auto_19979 ) ( SUPPORTS ?auto_19978 ?auto_19976 ) ( POWER_ON ?auto_19978 ) ( POINTING ?auto_19979 ?auto_19977 ) ( not ( = ?auto_19975 ?auto_19977 ) ) ( HAVE_IMAGE ?auto_19972 ?auto_19973 ) ( not ( = ?auto_19972 ?auto_19975 ) ) ( not ( = ?auto_19972 ?auto_19977 ) ) ( not ( = ?auto_19973 ?auto_19976 ) ) ( CALIBRATION_TARGET ?auto_19978 ?auto_19977 ) ( NOT_CALIBRATED ?auto_19978 ) ( HAVE_IMAGE ?auto_19974 ?auto_19971 ) ( not ( = ?auto_19972 ?auto_19974 ) ) ( not ( = ?auto_19973 ?auto_19971 ) ) ( not ( = ?auto_19974 ?auto_19975 ) ) ( not ( = ?auto_19974 ?auto_19977 ) ) ( not ( = ?auto_19971 ?auto_19976 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19972 ?auto_19973 ?auto_19975 ?auto_19976 )
      ( GET-3IMAGE-VERIFY ?auto_19972 ?auto_19973 ?auto_19974 ?auto_19971 ?auto_19975 ?auto_19976 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19981 - DIRECTION
      ?auto_19982 - MODE
      ?auto_19983 - DIRECTION
      ?auto_19980 - MODE
      ?auto_19984 - DIRECTION
      ?auto_19985 - MODE
    )
    :vars
    (
      ?auto_19987 - INSTRUMENT
      ?auto_19988 - SATELLITE
      ?auto_19986 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19987 ?auto_19988 ) ( SUPPORTS ?auto_19987 ?auto_19980 ) ( POWER_ON ?auto_19987 ) ( POINTING ?auto_19988 ?auto_19986 ) ( not ( = ?auto_19983 ?auto_19986 ) ) ( HAVE_IMAGE ?auto_19984 ?auto_19985 ) ( not ( = ?auto_19984 ?auto_19983 ) ) ( not ( = ?auto_19984 ?auto_19986 ) ) ( not ( = ?auto_19985 ?auto_19980 ) ) ( CALIBRATION_TARGET ?auto_19987 ?auto_19986 ) ( NOT_CALIBRATED ?auto_19987 ) ( HAVE_IMAGE ?auto_19981 ?auto_19982 ) ( not ( = ?auto_19981 ?auto_19983 ) ) ( not ( = ?auto_19981 ?auto_19984 ) ) ( not ( = ?auto_19981 ?auto_19986 ) ) ( not ( = ?auto_19982 ?auto_19980 ) ) ( not ( = ?auto_19982 ?auto_19985 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19984 ?auto_19985 ?auto_19983 ?auto_19980 )
      ( GET-3IMAGE-VERIFY ?auto_19981 ?auto_19982 ?auto_19983 ?auto_19980 ?auto_19984 ?auto_19985 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20011 - DIRECTION
      ?auto_20012 - MODE
      ?auto_20013 - DIRECTION
      ?auto_20010 - MODE
      ?auto_20014 - DIRECTION
      ?auto_20015 - MODE
    )
    :vars
    (
      ?auto_20017 - INSTRUMENT
      ?auto_20018 - SATELLITE
      ?auto_20016 - DIRECTION
      ?auto_20019 - DIRECTION
      ?auto_20020 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_20017 ?auto_20018 ) ( SUPPORTS ?auto_20017 ?auto_20015 ) ( POWER_ON ?auto_20017 ) ( POINTING ?auto_20018 ?auto_20016 ) ( not ( = ?auto_20014 ?auto_20016 ) ) ( HAVE_IMAGE ?auto_20019 ?auto_20020 ) ( not ( = ?auto_20019 ?auto_20014 ) ) ( not ( = ?auto_20019 ?auto_20016 ) ) ( not ( = ?auto_20020 ?auto_20015 ) ) ( CALIBRATION_TARGET ?auto_20017 ?auto_20016 ) ( NOT_CALIBRATED ?auto_20017 ) ( HAVE_IMAGE ?auto_20011 ?auto_20012 ) ( HAVE_IMAGE ?auto_20013 ?auto_20010 ) ( not ( = ?auto_20011 ?auto_20013 ) ) ( not ( = ?auto_20011 ?auto_20014 ) ) ( not ( = ?auto_20011 ?auto_20016 ) ) ( not ( = ?auto_20011 ?auto_20019 ) ) ( not ( = ?auto_20012 ?auto_20010 ) ) ( not ( = ?auto_20012 ?auto_20015 ) ) ( not ( = ?auto_20012 ?auto_20020 ) ) ( not ( = ?auto_20013 ?auto_20014 ) ) ( not ( = ?auto_20013 ?auto_20016 ) ) ( not ( = ?auto_20013 ?auto_20019 ) ) ( not ( = ?auto_20010 ?auto_20015 ) ) ( not ( = ?auto_20010 ?auto_20020 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20019 ?auto_20020 ?auto_20014 ?auto_20015 )
      ( GET-3IMAGE-VERIFY ?auto_20011 ?auto_20012 ?auto_20013 ?auto_20010 ?auto_20014 ?auto_20015 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20028 - DIRECTION
      ?auto_20029 - MODE
      ?auto_20030 - DIRECTION
      ?auto_20027 - MODE
      ?auto_20031 - DIRECTION
      ?auto_20032 - MODE
    )
    :vars
    (
      ?auto_20034 - INSTRUMENT
      ?auto_20035 - SATELLITE
      ?auto_20033 - DIRECTION
      ?auto_20036 - DIRECTION
      ?auto_20037 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_20034 ?auto_20035 ) ( SUPPORTS ?auto_20034 ?auto_20027 ) ( POWER_ON ?auto_20034 ) ( POINTING ?auto_20035 ?auto_20033 ) ( not ( = ?auto_20030 ?auto_20033 ) ) ( HAVE_IMAGE ?auto_20036 ?auto_20037 ) ( not ( = ?auto_20036 ?auto_20030 ) ) ( not ( = ?auto_20036 ?auto_20033 ) ) ( not ( = ?auto_20037 ?auto_20027 ) ) ( CALIBRATION_TARGET ?auto_20034 ?auto_20033 ) ( NOT_CALIBRATED ?auto_20034 ) ( HAVE_IMAGE ?auto_20028 ?auto_20029 ) ( HAVE_IMAGE ?auto_20031 ?auto_20032 ) ( not ( = ?auto_20028 ?auto_20030 ) ) ( not ( = ?auto_20028 ?auto_20031 ) ) ( not ( = ?auto_20028 ?auto_20033 ) ) ( not ( = ?auto_20028 ?auto_20036 ) ) ( not ( = ?auto_20029 ?auto_20027 ) ) ( not ( = ?auto_20029 ?auto_20032 ) ) ( not ( = ?auto_20029 ?auto_20037 ) ) ( not ( = ?auto_20030 ?auto_20031 ) ) ( not ( = ?auto_20027 ?auto_20032 ) ) ( not ( = ?auto_20031 ?auto_20033 ) ) ( not ( = ?auto_20031 ?auto_20036 ) ) ( not ( = ?auto_20032 ?auto_20037 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20036 ?auto_20037 ?auto_20030 ?auto_20027 )
      ( GET-3IMAGE-VERIFY ?auto_20028 ?auto_20029 ?auto_20030 ?auto_20027 ?auto_20031 ?auto_20032 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20050 - DIRECTION
      ?auto_20051 - MODE
      ?auto_20052 - DIRECTION
      ?auto_20049 - MODE
      ?auto_20053 - DIRECTION
      ?auto_20054 - MODE
    )
    :vars
    (
      ?auto_20056 - INSTRUMENT
      ?auto_20057 - SATELLITE
      ?auto_20055 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20056 ?auto_20057 ) ( SUPPORTS ?auto_20056 ?auto_20051 ) ( POWER_ON ?auto_20056 ) ( POINTING ?auto_20057 ?auto_20055 ) ( not ( = ?auto_20050 ?auto_20055 ) ) ( HAVE_IMAGE ?auto_20052 ?auto_20054 ) ( not ( = ?auto_20052 ?auto_20050 ) ) ( not ( = ?auto_20052 ?auto_20055 ) ) ( not ( = ?auto_20054 ?auto_20051 ) ) ( CALIBRATION_TARGET ?auto_20056 ?auto_20055 ) ( NOT_CALIBRATED ?auto_20056 ) ( HAVE_IMAGE ?auto_20052 ?auto_20049 ) ( HAVE_IMAGE ?auto_20053 ?auto_20054 ) ( not ( = ?auto_20050 ?auto_20053 ) ) ( not ( = ?auto_20051 ?auto_20049 ) ) ( not ( = ?auto_20052 ?auto_20053 ) ) ( not ( = ?auto_20049 ?auto_20054 ) ) ( not ( = ?auto_20053 ?auto_20055 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20052 ?auto_20054 ?auto_20050 ?auto_20051 )
      ( GET-3IMAGE-VERIFY ?auto_20050 ?auto_20051 ?auto_20052 ?auto_20049 ?auto_20053 ?auto_20054 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20083 - DIRECTION
      ?auto_20084 - MODE
      ?auto_20085 - DIRECTION
      ?auto_20082 - MODE
      ?auto_20086 - DIRECTION
      ?auto_20087 - MODE
    )
    :vars
    (
      ?auto_20089 - INSTRUMENT
      ?auto_20090 - SATELLITE
      ?auto_20088 - DIRECTION
      ?auto_20091 - DIRECTION
      ?auto_20092 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_20089 ?auto_20090 ) ( SUPPORTS ?auto_20089 ?auto_20084 ) ( POWER_ON ?auto_20089 ) ( POINTING ?auto_20090 ?auto_20088 ) ( not ( = ?auto_20083 ?auto_20088 ) ) ( HAVE_IMAGE ?auto_20091 ?auto_20092 ) ( not ( = ?auto_20091 ?auto_20083 ) ) ( not ( = ?auto_20091 ?auto_20088 ) ) ( not ( = ?auto_20092 ?auto_20084 ) ) ( CALIBRATION_TARGET ?auto_20089 ?auto_20088 ) ( NOT_CALIBRATED ?auto_20089 ) ( HAVE_IMAGE ?auto_20085 ?auto_20082 ) ( HAVE_IMAGE ?auto_20086 ?auto_20087 ) ( not ( = ?auto_20083 ?auto_20085 ) ) ( not ( = ?auto_20083 ?auto_20086 ) ) ( not ( = ?auto_20084 ?auto_20082 ) ) ( not ( = ?auto_20084 ?auto_20087 ) ) ( not ( = ?auto_20085 ?auto_20086 ) ) ( not ( = ?auto_20085 ?auto_20088 ) ) ( not ( = ?auto_20085 ?auto_20091 ) ) ( not ( = ?auto_20082 ?auto_20087 ) ) ( not ( = ?auto_20082 ?auto_20092 ) ) ( not ( = ?auto_20086 ?auto_20088 ) ) ( not ( = ?auto_20086 ?auto_20091 ) ) ( not ( = ?auto_20087 ?auto_20092 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20091 ?auto_20092 ?auto_20083 ?auto_20084 )
      ( GET-3IMAGE-VERIFY ?auto_20083 ?auto_20084 ?auto_20085 ?auto_20082 ?auto_20086 ?auto_20087 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20174 - DIRECTION
      ?auto_20175 - MODE
      ?auto_20176 - DIRECTION
      ?auto_20173 - MODE
      ?auto_20177 - DIRECTION
      ?auto_20178 - MODE
    )
    :vars
    (
      ?auto_20181 - INSTRUMENT
      ?auto_20180 - SATELLITE
      ?auto_20179 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20181 ?auto_20180 ) ( SUPPORTS ?auto_20181 ?auto_20178 ) ( POINTING ?auto_20180 ?auto_20179 ) ( not ( = ?auto_20177 ?auto_20179 ) ) ( HAVE_IMAGE ?auto_20174 ?auto_20175 ) ( not ( = ?auto_20174 ?auto_20177 ) ) ( not ( = ?auto_20174 ?auto_20179 ) ) ( not ( = ?auto_20175 ?auto_20178 ) ) ( CALIBRATION_TARGET ?auto_20181 ?auto_20179 ) ( POWER_AVAIL ?auto_20180 ) ( HAVE_IMAGE ?auto_20176 ?auto_20173 ) ( not ( = ?auto_20174 ?auto_20176 ) ) ( not ( = ?auto_20175 ?auto_20173 ) ) ( not ( = ?auto_20176 ?auto_20177 ) ) ( not ( = ?auto_20176 ?auto_20179 ) ) ( not ( = ?auto_20173 ?auto_20178 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20174 ?auto_20175 ?auto_20177 ?auto_20178 )
      ( GET-3IMAGE-VERIFY ?auto_20174 ?auto_20175 ?auto_20176 ?auto_20173 ?auto_20177 ?auto_20178 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20189 - DIRECTION
      ?auto_20190 - MODE
      ?auto_20191 - DIRECTION
      ?auto_20188 - MODE
      ?auto_20192 - DIRECTION
      ?auto_20193 - MODE
    )
    :vars
    (
      ?auto_20196 - INSTRUMENT
      ?auto_20195 - SATELLITE
      ?auto_20194 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20196 ?auto_20195 ) ( SUPPORTS ?auto_20196 ?auto_20188 ) ( POINTING ?auto_20195 ?auto_20194 ) ( not ( = ?auto_20191 ?auto_20194 ) ) ( HAVE_IMAGE ?auto_20192 ?auto_20190 ) ( not ( = ?auto_20192 ?auto_20191 ) ) ( not ( = ?auto_20192 ?auto_20194 ) ) ( not ( = ?auto_20190 ?auto_20188 ) ) ( CALIBRATION_TARGET ?auto_20196 ?auto_20194 ) ( POWER_AVAIL ?auto_20195 ) ( HAVE_IMAGE ?auto_20189 ?auto_20190 ) ( HAVE_IMAGE ?auto_20192 ?auto_20193 ) ( not ( = ?auto_20189 ?auto_20191 ) ) ( not ( = ?auto_20189 ?auto_20192 ) ) ( not ( = ?auto_20189 ?auto_20194 ) ) ( not ( = ?auto_20190 ?auto_20193 ) ) ( not ( = ?auto_20188 ?auto_20193 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20192 ?auto_20190 ?auto_20191 ?auto_20188 )
      ( GET-3IMAGE-VERIFY ?auto_20189 ?auto_20190 ?auto_20191 ?auto_20188 ?auto_20192 ?auto_20193 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20198 - DIRECTION
      ?auto_20199 - MODE
      ?auto_20200 - DIRECTION
      ?auto_20197 - MODE
      ?auto_20201 - DIRECTION
      ?auto_20202 - MODE
    )
    :vars
    (
      ?auto_20205 - INSTRUMENT
      ?auto_20204 - SATELLITE
      ?auto_20203 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20205 ?auto_20204 ) ( SUPPORTS ?auto_20205 ?auto_20197 ) ( POINTING ?auto_20204 ?auto_20203 ) ( not ( = ?auto_20200 ?auto_20203 ) ) ( HAVE_IMAGE ?auto_20198 ?auto_20199 ) ( not ( = ?auto_20198 ?auto_20200 ) ) ( not ( = ?auto_20198 ?auto_20203 ) ) ( not ( = ?auto_20199 ?auto_20197 ) ) ( CALIBRATION_TARGET ?auto_20205 ?auto_20203 ) ( POWER_AVAIL ?auto_20204 ) ( HAVE_IMAGE ?auto_20201 ?auto_20202 ) ( not ( = ?auto_20198 ?auto_20201 ) ) ( not ( = ?auto_20199 ?auto_20202 ) ) ( not ( = ?auto_20200 ?auto_20201 ) ) ( not ( = ?auto_20197 ?auto_20202 ) ) ( not ( = ?auto_20201 ?auto_20203 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20198 ?auto_20199 ?auto_20200 ?auto_20197 )
      ( GET-3IMAGE-VERIFY ?auto_20198 ?auto_20199 ?auto_20200 ?auto_20197 ?auto_20201 ?auto_20202 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20222 - DIRECTION
      ?auto_20223 - MODE
      ?auto_20224 - DIRECTION
      ?auto_20221 - MODE
      ?auto_20225 - DIRECTION
      ?auto_20226 - MODE
    )
    :vars
    (
      ?auto_20230 - INSTRUMENT
      ?auto_20229 - SATELLITE
      ?auto_20228 - DIRECTION
      ?auto_20231 - DIRECTION
      ?auto_20227 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_20230 ?auto_20229 ) ( SUPPORTS ?auto_20230 ?auto_20226 ) ( POINTING ?auto_20229 ?auto_20228 ) ( not ( = ?auto_20225 ?auto_20228 ) ) ( HAVE_IMAGE ?auto_20231 ?auto_20227 ) ( not ( = ?auto_20231 ?auto_20225 ) ) ( not ( = ?auto_20231 ?auto_20228 ) ) ( not ( = ?auto_20227 ?auto_20226 ) ) ( CALIBRATION_TARGET ?auto_20230 ?auto_20228 ) ( POWER_AVAIL ?auto_20229 ) ( HAVE_IMAGE ?auto_20222 ?auto_20223 ) ( HAVE_IMAGE ?auto_20224 ?auto_20221 ) ( not ( = ?auto_20222 ?auto_20224 ) ) ( not ( = ?auto_20222 ?auto_20225 ) ) ( not ( = ?auto_20222 ?auto_20228 ) ) ( not ( = ?auto_20222 ?auto_20231 ) ) ( not ( = ?auto_20223 ?auto_20221 ) ) ( not ( = ?auto_20223 ?auto_20226 ) ) ( not ( = ?auto_20223 ?auto_20227 ) ) ( not ( = ?auto_20224 ?auto_20225 ) ) ( not ( = ?auto_20224 ?auto_20228 ) ) ( not ( = ?auto_20224 ?auto_20231 ) ) ( not ( = ?auto_20221 ?auto_20226 ) ) ( not ( = ?auto_20221 ?auto_20227 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20231 ?auto_20227 ?auto_20225 ?auto_20226 )
      ( GET-3IMAGE-VERIFY ?auto_20222 ?auto_20223 ?auto_20224 ?auto_20221 ?auto_20225 ?auto_20226 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20239 - DIRECTION
      ?auto_20240 - MODE
      ?auto_20241 - DIRECTION
      ?auto_20238 - MODE
      ?auto_20242 - DIRECTION
      ?auto_20243 - MODE
    )
    :vars
    (
      ?auto_20247 - INSTRUMENT
      ?auto_20246 - SATELLITE
      ?auto_20245 - DIRECTION
      ?auto_20248 - DIRECTION
      ?auto_20244 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_20247 ?auto_20246 ) ( SUPPORTS ?auto_20247 ?auto_20238 ) ( POINTING ?auto_20246 ?auto_20245 ) ( not ( = ?auto_20241 ?auto_20245 ) ) ( HAVE_IMAGE ?auto_20248 ?auto_20244 ) ( not ( = ?auto_20248 ?auto_20241 ) ) ( not ( = ?auto_20248 ?auto_20245 ) ) ( not ( = ?auto_20244 ?auto_20238 ) ) ( CALIBRATION_TARGET ?auto_20247 ?auto_20245 ) ( POWER_AVAIL ?auto_20246 ) ( HAVE_IMAGE ?auto_20239 ?auto_20240 ) ( HAVE_IMAGE ?auto_20242 ?auto_20243 ) ( not ( = ?auto_20239 ?auto_20241 ) ) ( not ( = ?auto_20239 ?auto_20242 ) ) ( not ( = ?auto_20239 ?auto_20245 ) ) ( not ( = ?auto_20239 ?auto_20248 ) ) ( not ( = ?auto_20240 ?auto_20238 ) ) ( not ( = ?auto_20240 ?auto_20243 ) ) ( not ( = ?auto_20240 ?auto_20244 ) ) ( not ( = ?auto_20241 ?auto_20242 ) ) ( not ( = ?auto_20238 ?auto_20243 ) ) ( not ( = ?auto_20242 ?auto_20245 ) ) ( not ( = ?auto_20242 ?auto_20248 ) ) ( not ( = ?auto_20243 ?auto_20244 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20248 ?auto_20244 ?auto_20241 ?auto_20238 )
      ( GET-3IMAGE-VERIFY ?auto_20239 ?auto_20240 ?auto_20241 ?auto_20238 ?auto_20242 ?auto_20243 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20291 - DIRECTION
      ?auto_20292 - MODE
      ?auto_20293 - DIRECTION
      ?auto_20290 - MODE
      ?auto_20294 - DIRECTION
      ?auto_20295 - MODE
    )
    :vars
    (
      ?auto_20299 - INSTRUMENT
      ?auto_20298 - SATELLITE
      ?auto_20297 - DIRECTION
      ?auto_20300 - DIRECTION
      ?auto_20296 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_20299 ?auto_20298 ) ( SUPPORTS ?auto_20299 ?auto_20292 ) ( POINTING ?auto_20298 ?auto_20297 ) ( not ( = ?auto_20291 ?auto_20297 ) ) ( HAVE_IMAGE ?auto_20300 ?auto_20296 ) ( not ( = ?auto_20300 ?auto_20291 ) ) ( not ( = ?auto_20300 ?auto_20297 ) ) ( not ( = ?auto_20296 ?auto_20292 ) ) ( CALIBRATION_TARGET ?auto_20299 ?auto_20297 ) ( POWER_AVAIL ?auto_20298 ) ( HAVE_IMAGE ?auto_20293 ?auto_20290 ) ( HAVE_IMAGE ?auto_20294 ?auto_20295 ) ( not ( = ?auto_20291 ?auto_20293 ) ) ( not ( = ?auto_20291 ?auto_20294 ) ) ( not ( = ?auto_20292 ?auto_20290 ) ) ( not ( = ?auto_20292 ?auto_20295 ) ) ( not ( = ?auto_20293 ?auto_20294 ) ) ( not ( = ?auto_20293 ?auto_20297 ) ) ( not ( = ?auto_20293 ?auto_20300 ) ) ( not ( = ?auto_20290 ?auto_20295 ) ) ( not ( = ?auto_20290 ?auto_20296 ) ) ( not ( = ?auto_20294 ?auto_20297 ) ) ( not ( = ?auto_20294 ?auto_20300 ) ) ( not ( = ?auto_20295 ?auto_20296 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20300 ?auto_20296 ?auto_20291 ?auto_20292 )
      ( GET-3IMAGE-VERIFY ?auto_20291 ?auto_20292 ?auto_20293 ?auto_20290 ?auto_20294 ?auto_20295 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20343 - DIRECTION
      ?auto_20344 - MODE
    )
    :vars
    (
      ?auto_20348 - INSTRUMENT
      ?auto_20347 - SATELLITE
      ?auto_20346 - DIRECTION
      ?auto_20349 - DIRECTION
      ?auto_20345 - MODE
      ?auto_20350 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20348 ?auto_20347 ) ( SUPPORTS ?auto_20348 ?auto_20344 ) ( not ( = ?auto_20343 ?auto_20346 ) ) ( HAVE_IMAGE ?auto_20349 ?auto_20345 ) ( not ( = ?auto_20349 ?auto_20343 ) ) ( not ( = ?auto_20349 ?auto_20346 ) ) ( not ( = ?auto_20345 ?auto_20344 ) ) ( CALIBRATION_TARGET ?auto_20348 ?auto_20346 ) ( POWER_AVAIL ?auto_20347 ) ( POINTING ?auto_20347 ?auto_20350 ) ( not ( = ?auto_20346 ?auto_20350 ) ) ( not ( = ?auto_20343 ?auto_20350 ) ) ( not ( = ?auto_20349 ?auto_20350 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_20347 ?auto_20346 ?auto_20350 )
      ( GET-2IMAGE ?auto_20349 ?auto_20345 ?auto_20343 ?auto_20344 )
      ( GET-1IMAGE-VERIFY ?auto_20343 ?auto_20344 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20352 - DIRECTION
      ?auto_20353 - MODE
      ?auto_20354 - DIRECTION
      ?auto_20351 - MODE
    )
    :vars
    (
      ?auto_20357 - INSTRUMENT
      ?auto_20358 - SATELLITE
      ?auto_20356 - DIRECTION
      ?auto_20355 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20357 ?auto_20358 ) ( SUPPORTS ?auto_20357 ?auto_20351 ) ( not ( = ?auto_20354 ?auto_20356 ) ) ( HAVE_IMAGE ?auto_20352 ?auto_20353 ) ( not ( = ?auto_20352 ?auto_20354 ) ) ( not ( = ?auto_20352 ?auto_20356 ) ) ( not ( = ?auto_20353 ?auto_20351 ) ) ( CALIBRATION_TARGET ?auto_20357 ?auto_20356 ) ( POWER_AVAIL ?auto_20358 ) ( POINTING ?auto_20358 ?auto_20355 ) ( not ( = ?auto_20356 ?auto_20355 ) ) ( not ( = ?auto_20354 ?auto_20355 ) ) ( not ( = ?auto_20352 ?auto_20355 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_20354 ?auto_20351 )
      ( GET-2IMAGE-VERIFY ?auto_20352 ?auto_20353 ?auto_20354 ?auto_20351 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20360 - DIRECTION
      ?auto_20361 - MODE
      ?auto_20362 - DIRECTION
      ?auto_20359 - MODE
    )
    :vars
    (
      ?auto_20366 - INSTRUMENT
      ?auto_20367 - SATELLITE
      ?auto_20365 - DIRECTION
      ?auto_20363 - DIRECTION
      ?auto_20364 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_20366 ?auto_20367 ) ( SUPPORTS ?auto_20366 ?auto_20359 ) ( not ( = ?auto_20362 ?auto_20365 ) ) ( HAVE_IMAGE ?auto_20363 ?auto_20364 ) ( not ( = ?auto_20363 ?auto_20362 ) ) ( not ( = ?auto_20363 ?auto_20365 ) ) ( not ( = ?auto_20364 ?auto_20359 ) ) ( CALIBRATION_TARGET ?auto_20366 ?auto_20365 ) ( POWER_AVAIL ?auto_20367 ) ( POINTING ?auto_20367 ?auto_20360 ) ( not ( = ?auto_20365 ?auto_20360 ) ) ( not ( = ?auto_20362 ?auto_20360 ) ) ( not ( = ?auto_20363 ?auto_20360 ) ) ( HAVE_IMAGE ?auto_20360 ?auto_20361 ) ( not ( = ?auto_20361 ?auto_20359 ) ) ( not ( = ?auto_20361 ?auto_20364 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20363 ?auto_20364 ?auto_20362 ?auto_20359 )
      ( GET-2IMAGE-VERIFY ?auto_20360 ?auto_20361 ?auto_20362 ?auto_20359 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20369 - DIRECTION
      ?auto_20370 - MODE
      ?auto_20371 - DIRECTION
      ?auto_20368 - MODE
    )
    :vars
    (
      ?auto_20373 - INSTRUMENT
      ?auto_20374 - SATELLITE
      ?auto_20372 - DIRECTION
      ?auto_20375 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20373 ?auto_20374 ) ( SUPPORTS ?auto_20373 ?auto_20370 ) ( not ( = ?auto_20369 ?auto_20372 ) ) ( HAVE_IMAGE ?auto_20371 ?auto_20368 ) ( not ( = ?auto_20371 ?auto_20369 ) ) ( not ( = ?auto_20371 ?auto_20372 ) ) ( not ( = ?auto_20368 ?auto_20370 ) ) ( CALIBRATION_TARGET ?auto_20373 ?auto_20372 ) ( POWER_AVAIL ?auto_20374 ) ( POINTING ?auto_20374 ?auto_20375 ) ( not ( = ?auto_20372 ?auto_20375 ) ) ( not ( = ?auto_20369 ?auto_20375 ) ) ( not ( = ?auto_20371 ?auto_20375 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20371 ?auto_20368 ?auto_20369 ?auto_20370 )
      ( GET-2IMAGE-VERIFY ?auto_20369 ?auto_20370 ?auto_20371 ?auto_20368 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20377 - DIRECTION
      ?auto_20378 - MODE
      ?auto_20379 - DIRECTION
      ?auto_20376 - MODE
    )
    :vars
    (
      ?auto_20383 - INSTRUMENT
      ?auto_20384 - SATELLITE
      ?auto_20382 - DIRECTION
      ?auto_20380 - DIRECTION
      ?auto_20381 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_20383 ?auto_20384 ) ( SUPPORTS ?auto_20383 ?auto_20378 ) ( not ( = ?auto_20377 ?auto_20382 ) ) ( HAVE_IMAGE ?auto_20380 ?auto_20381 ) ( not ( = ?auto_20380 ?auto_20377 ) ) ( not ( = ?auto_20380 ?auto_20382 ) ) ( not ( = ?auto_20381 ?auto_20378 ) ) ( CALIBRATION_TARGET ?auto_20383 ?auto_20382 ) ( POWER_AVAIL ?auto_20384 ) ( POINTING ?auto_20384 ?auto_20379 ) ( not ( = ?auto_20382 ?auto_20379 ) ) ( not ( = ?auto_20377 ?auto_20379 ) ) ( not ( = ?auto_20380 ?auto_20379 ) ) ( HAVE_IMAGE ?auto_20379 ?auto_20376 ) ( not ( = ?auto_20378 ?auto_20376 ) ) ( not ( = ?auto_20376 ?auto_20381 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20380 ?auto_20381 ?auto_20377 ?auto_20378 )
      ( GET-2IMAGE-VERIFY ?auto_20377 ?auto_20378 ?auto_20379 ?auto_20376 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20396 - DIRECTION
      ?auto_20397 - MODE
      ?auto_20398 - DIRECTION
      ?auto_20395 - MODE
      ?auto_20399 - DIRECTION
      ?auto_20400 - MODE
    )
    :vars
    (
      ?auto_20402 - INSTRUMENT
      ?auto_20403 - SATELLITE
      ?auto_20401 - DIRECTION
      ?auto_20404 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20402 ?auto_20403 ) ( SUPPORTS ?auto_20402 ?auto_20400 ) ( not ( = ?auto_20399 ?auto_20401 ) ) ( HAVE_IMAGE ?auto_20398 ?auto_20395 ) ( not ( = ?auto_20398 ?auto_20399 ) ) ( not ( = ?auto_20398 ?auto_20401 ) ) ( not ( = ?auto_20395 ?auto_20400 ) ) ( CALIBRATION_TARGET ?auto_20402 ?auto_20401 ) ( POWER_AVAIL ?auto_20403 ) ( POINTING ?auto_20403 ?auto_20404 ) ( not ( = ?auto_20401 ?auto_20404 ) ) ( not ( = ?auto_20399 ?auto_20404 ) ) ( not ( = ?auto_20398 ?auto_20404 ) ) ( HAVE_IMAGE ?auto_20396 ?auto_20397 ) ( not ( = ?auto_20396 ?auto_20398 ) ) ( not ( = ?auto_20396 ?auto_20399 ) ) ( not ( = ?auto_20396 ?auto_20401 ) ) ( not ( = ?auto_20396 ?auto_20404 ) ) ( not ( = ?auto_20397 ?auto_20395 ) ) ( not ( = ?auto_20397 ?auto_20400 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20398 ?auto_20395 ?auto_20399 ?auto_20400 )
      ( GET-3IMAGE-VERIFY ?auto_20396 ?auto_20397 ?auto_20398 ?auto_20395 ?auto_20399 ?auto_20400 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20406 - DIRECTION
      ?auto_20407 - MODE
      ?auto_20408 - DIRECTION
      ?auto_20405 - MODE
      ?auto_20409 - DIRECTION
      ?auto_20410 - MODE
    )
    :vars
    (
      ?auto_20412 - INSTRUMENT
      ?auto_20413 - SATELLITE
      ?auto_20411 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20412 ?auto_20413 ) ( SUPPORTS ?auto_20412 ?auto_20410 ) ( not ( = ?auto_20409 ?auto_20411 ) ) ( HAVE_IMAGE ?auto_20406 ?auto_20407 ) ( not ( = ?auto_20406 ?auto_20409 ) ) ( not ( = ?auto_20406 ?auto_20411 ) ) ( not ( = ?auto_20407 ?auto_20410 ) ) ( CALIBRATION_TARGET ?auto_20412 ?auto_20411 ) ( POWER_AVAIL ?auto_20413 ) ( POINTING ?auto_20413 ?auto_20408 ) ( not ( = ?auto_20411 ?auto_20408 ) ) ( not ( = ?auto_20409 ?auto_20408 ) ) ( not ( = ?auto_20406 ?auto_20408 ) ) ( HAVE_IMAGE ?auto_20408 ?auto_20405 ) ( not ( = ?auto_20407 ?auto_20405 ) ) ( not ( = ?auto_20405 ?auto_20410 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20406 ?auto_20407 ?auto_20409 ?auto_20410 )
      ( GET-3IMAGE-VERIFY ?auto_20406 ?auto_20407 ?auto_20408 ?auto_20405 ?auto_20409 ?auto_20410 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20415 - DIRECTION
      ?auto_20416 - MODE
      ?auto_20417 - DIRECTION
      ?auto_20414 - MODE
      ?auto_20418 - DIRECTION
      ?auto_20419 - MODE
    )
    :vars
    (
      ?auto_20421 - INSTRUMENT
      ?auto_20422 - SATELLITE
      ?auto_20420 - DIRECTION
      ?auto_20423 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20421 ?auto_20422 ) ( SUPPORTS ?auto_20421 ?auto_20414 ) ( not ( = ?auto_20417 ?auto_20420 ) ) ( HAVE_IMAGE ?auto_20418 ?auto_20419 ) ( not ( = ?auto_20418 ?auto_20417 ) ) ( not ( = ?auto_20418 ?auto_20420 ) ) ( not ( = ?auto_20419 ?auto_20414 ) ) ( CALIBRATION_TARGET ?auto_20421 ?auto_20420 ) ( POWER_AVAIL ?auto_20422 ) ( POINTING ?auto_20422 ?auto_20423 ) ( not ( = ?auto_20420 ?auto_20423 ) ) ( not ( = ?auto_20417 ?auto_20423 ) ) ( not ( = ?auto_20418 ?auto_20423 ) ) ( HAVE_IMAGE ?auto_20415 ?auto_20416 ) ( not ( = ?auto_20415 ?auto_20417 ) ) ( not ( = ?auto_20415 ?auto_20418 ) ) ( not ( = ?auto_20415 ?auto_20420 ) ) ( not ( = ?auto_20415 ?auto_20423 ) ) ( not ( = ?auto_20416 ?auto_20414 ) ) ( not ( = ?auto_20416 ?auto_20419 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20418 ?auto_20419 ?auto_20417 ?auto_20414 )
      ( GET-3IMAGE-VERIFY ?auto_20415 ?auto_20416 ?auto_20417 ?auto_20414 ?auto_20418 ?auto_20419 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20425 - DIRECTION
      ?auto_20426 - MODE
      ?auto_20427 - DIRECTION
      ?auto_20424 - MODE
      ?auto_20428 - DIRECTION
      ?auto_20429 - MODE
    )
    :vars
    (
      ?auto_20431 - INSTRUMENT
      ?auto_20432 - SATELLITE
      ?auto_20430 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20431 ?auto_20432 ) ( SUPPORTS ?auto_20431 ?auto_20424 ) ( not ( = ?auto_20427 ?auto_20430 ) ) ( HAVE_IMAGE ?auto_20425 ?auto_20426 ) ( not ( = ?auto_20425 ?auto_20427 ) ) ( not ( = ?auto_20425 ?auto_20430 ) ) ( not ( = ?auto_20426 ?auto_20424 ) ) ( CALIBRATION_TARGET ?auto_20431 ?auto_20430 ) ( POWER_AVAIL ?auto_20432 ) ( POINTING ?auto_20432 ?auto_20428 ) ( not ( = ?auto_20430 ?auto_20428 ) ) ( not ( = ?auto_20427 ?auto_20428 ) ) ( not ( = ?auto_20425 ?auto_20428 ) ) ( HAVE_IMAGE ?auto_20428 ?auto_20429 ) ( not ( = ?auto_20426 ?auto_20429 ) ) ( not ( = ?auto_20424 ?auto_20429 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20425 ?auto_20426 ?auto_20427 ?auto_20424 )
      ( GET-3IMAGE-VERIFY ?auto_20425 ?auto_20426 ?auto_20427 ?auto_20424 ?auto_20428 ?auto_20429 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20444 - DIRECTION
      ?auto_20445 - MODE
      ?auto_20446 - DIRECTION
      ?auto_20443 - MODE
      ?auto_20447 - DIRECTION
      ?auto_20448 - MODE
    )
    :vars
    (
      ?auto_20450 - INSTRUMENT
      ?auto_20451 - SATELLITE
      ?auto_20449 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20450 ?auto_20451 ) ( SUPPORTS ?auto_20450 ?auto_20448 ) ( not ( = ?auto_20447 ?auto_20449 ) ) ( HAVE_IMAGE ?auto_20446 ?auto_20443 ) ( not ( = ?auto_20446 ?auto_20447 ) ) ( not ( = ?auto_20446 ?auto_20449 ) ) ( not ( = ?auto_20443 ?auto_20448 ) ) ( CALIBRATION_TARGET ?auto_20450 ?auto_20449 ) ( POWER_AVAIL ?auto_20451 ) ( POINTING ?auto_20451 ?auto_20444 ) ( not ( = ?auto_20449 ?auto_20444 ) ) ( not ( = ?auto_20447 ?auto_20444 ) ) ( not ( = ?auto_20446 ?auto_20444 ) ) ( HAVE_IMAGE ?auto_20444 ?auto_20445 ) ( not ( = ?auto_20445 ?auto_20443 ) ) ( not ( = ?auto_20445 ?auto_20448 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20446 ?auto_20443 ?auto_20447 ?auto_20448 )
      ( GET-3IMAGE-VERIFY ?auto_20444 ?auto_20445 ?auto_20446 ?auto_20443 ?auto_20447 ?auto_20448 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20453 - DIRECTION
      ?auto_20454 - MODE
      ?auto_20455 - DIRECTION
      ?auto_20452 - MODE
      ?auto_20456 - DIRECTION
      ?auto_20457 - MODE
    )
    :vars
    (
      ?auto_20461 - INSTRUMENT
      ?auto_20462 - SATELLITE
      ?auto_20460 - DIRECTION
      ?auto_20458 - DIRECTION
      ?auto_20459 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_20461 ?auto_20462 ) ( SUPPORTS ?auto_20461 ?auto_20457 ) ( not ( = ?auto_20456 ?auto_20460 ) ) ( HAVE_IMAGE ?auto_20458 ?auto_20459 ) ( not ( = ?auto_20458 ?auto_20456 ) ) ( not ( = ?auto_20458 ?auto_20460 ) ) ( not ( = ?auto_20459 ?auto_20457 ) ) ( CALIBRATION_TARGET ?auto_20461 ?auto_20460 ) ( POWER_AVAIL ?auto_20462 ) ( POINTING ?auto_20462 ?auto_20453 ) ( not ( = ?auto_20460 ?auto_20453 ) ) ( not ( = ?auto_20456 ?auto_20453 ) ) ( not ( = ?auto_20458 ?auto_20453 ) ) ( HAVE_IMAGE ?auto_20453 ?auto_20454 ) ( HAVE_IMAGE ?auto_20455 ?auto_20452 ) ( not ( = ?auto_20453 ?auto_20455 ) ) ( not ( = ?auto_20454 ?auto_20452 ) ) ( not ( = ?auto_20454 ?auto_20457 ) ) ( not ( = ?auto_20454 ?auto_20459 ) ) ( not ( = ?auto_20455 ?auto_20456 ) ) ( not ( = ?auto_20455 ?auto_20460 ) ) ( not ( = ?auto_20455 ?auto_20458 ) ) ( not ( = ?auto_20452 ?auto_20457 ) ) ( not ( = ?auto_20452 ?auto_20459 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20458 ?auto_20459 ?auto_20456 ?auto_20457 )
      ( GET-3IMAGE-VERIFY ?auto_20453 ?auto_20454 ?auto_20455 ?auto_20452 ?auto_20456 ?auto_20457 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20464 - DIRECTION
      ?auto_20465 - MODE
      ?auto_20466 - DIRECTION
      ?auto_20463 - MODE
      ?auto_20467 - DIRECTION
      ?auto_20468 - MODE
    )
    :vars
    (
      ?auto_20470 - INSTRUMENT
      ?auto_20471 - SATELLITE
      ?auto_20469 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20470 ?auto_20471 ) ( SUPPORTS ?auto_20470 ?auto_20463 ) ( not ( = ?auto_20466 ?auto_20469 ) ) ( HAVE_IMAGE ?auto_20467 ?auto_20468 ) ( not ( = ?auto_20467 ?auto_20466 ) ) ( not ( = ?auto_20467 ?auto_20469 ) ) ( not ( = ?auto_20468 ?auto_20463 ) ) ( CALIBRATION_TARGET ?auto_20470 ?auto_20469 ) ( POWER_AVAIL ?auto_20471 ) ( POINTING ?auto_20471 ?auto_20464 ) ( not ( = ?auto_20469 ?auto_20464 ) ) ( not ( = ?auto_20466 ?auto_20464 ) ) ( not ( = ?auto_20467 ?auto_20464 ) ) ( HAVE_IMAGE ?auto_20464 ?auto_20465 ) ( not ( = ?auto_20465 ?auto_20463 ) ) ( not ( = ?auto_20465 ?auto_20468 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20467 ?auto_20468 ?auto_20466 ?auto_20463 )
      ( GET-3IMAGE-VERIFY ?auto_20464 ?auto_20465 ?auto_20466 ?auto_20463 ?auto_20467 ?auto_20468 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20473 - DIRECTION
      ?auto_20474 - MODE
      ?auto_20475 - DIRECTION
      ?auto_20472 - MODE
      ?auto_20476 - DIRECTION
      ?auto_20477 - MODE
    )
    :vars
    (
      ?auto_20481 - INSTRUMENT
      ?auto_20482 - SATELLITE
      ?auto_20480 - DIRECTION
      ?auto_20478 - DIRECTION
      ?auto_20479 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_20481 ?auto_20482 ) ( SUPPORTS ?auto_20481 ?auto_20472 ) ( not ( = ?auto_20475 ?auto_20480 ) ) ( HAVE_IMAGE ?auto_20478 ?auto_20479 ) ( not ( = ?auto_20478 ?auto_20475 ) ) ( not ( = ?auto_20478 ?auto_20480 ) ) ( not ( = ?auto_20479 ?auto_20472 ) ) ( CALIBRATION_TARGET ?auto_20481 ?auto_20480 ) ( POWER_AVAIL ?auto_20482 ) ( POINTING ?auto_20482 ?auto_20473 ) ( not ( = ?auto_20480 ?auto_20473 ) ) ( not ( = ?auto_20475 ?auto_20473 ) ) ( not ( = ?auto_20478 ?auto_20473 ) ) ( HAVE_IMAGE ?auto_20473 ?auto_20474 ) ( HAVE_IMAGE ?auto_20476 ?auto_20477 ) ( not ( = ?auto_20473 ?auto_20476 ) ) ( not ( = ?auto_20474 ?auto_20472 ) ) ( not ( = ?auto_20474 ?auto_20477 ) ) ( not ( = ?auto_20474 ?auto_20479 ) ) ( not ( = ?auto_20475 ?auto_20476 ) ) ( not ( = ?auto_20472 ?auto_20477 ) ) ( not ( = ?auto_20476 ?auto_20480 ) ) ( not ( = ?auto_20476 ?auto_20478 ) ) ( not ( = ?auto_20477 ?auto_20479 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20478 ?auto_20479 ?auto_20475 ?auto_20472 )
      ( GET-3IMAGE-VERIFY ?auto_20473 ?auto_20474 ?auto_20475 ?auto_20472 ?auto_20476 ?auto_20477 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20495 - DIRECTION
      ?auto_20496 - MODE
      ?auto_20497 - DIRECTION
      ?auto_20494 - MODE
      ?auto_20498 - DIRECTION
      ?auto_20499 - MODE
    )
    :vars
    (
      ?auto_20501 - INSTRUMENT
      ?auto_20502 - SATELLITE
      ?auto_20500 - DIRECTION
      ?auto_20503 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20501 ?auto_20502 ) ( SUPPORTS ?auto_20501 ?auto_20496 ) ( not ( = ?auto_20495 ?auto_20500 ) ) ( HAVE_IMAGE ?auto_20497 ?auto_20499 ) ( not ( = ?auto_20497 ?auto_20495 ) ) ( not ( = ?auto_20497 ?auto_20500 ) ) ( not ( = ?auto_20499 ?auto_20496 ) ) ( CALIBRATION_TARGET ?auto_20501 ?auto_20500 ) ( POWER_AVAIL ?auto_20502 ) ( POINTING ?auto_20502 ?auto_20503 ) ( not ( = ?auto_20500 ?auto_20503 ) ) ( not ( = ?auto_20495 ?auto_20503 ) ) ( not ( = ?auto_20497 ?auto_20503 ) ) ( HAVE_IMAGE ?auto_20497 ?auto_20494 ) ( HAVE_IMAGE ?auto_20498 ?auto_20499 ) ( not ( = ?auto_20495 ?auto_20498 ) ) ( not ( = ?auto_20496 ?auto_20494 ) ) ( not ( = ?auto_20497 ?auto_20498 ) ) ( not ( = ?auto_20494 ?auto_20499 ) ) ( not ( = ?auto_20498 ?auto_20500 ) ) ( not ( = ?auto_20498 ?auto_20503 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20497 ?auto_20499 ?auto_20495 ?auto_20496 )
      ( GET-3IMAGE-VERIFY ?auto_20495 ?auto_20496 ?auto_20497 ?auto_20494 ?auto_20498 ?auto_20499 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20505 - DIRECTION
      ?auto_20506 - MODE
      ?auto_20507 - DIRECTION
      ?auto_20504 - MODE
      ?auto_20508 - DIRECTION
      ?auto_20509 - MODE
    )
    :vars
    (
      ?auto_20511 - INSTRUMENT
      ?auto_20512 - SATELLITE
      ?auto_20510 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20511 ?auto_20512 ) ( SUPPORTS ?auto_20511 ?auto_20506 ) ( not ( = ?auto_20505 ?auto_20510 ) ) ( HAVE_IMAGE ?auto_20507 ?auto_20504 ) ( not ( = ?auto_20507 ?auto_20505 ) ) ( not ( = ?auto_20507 ?auto_20510 ) ) ( not ( = ?auto_20504 ?auto_20506 ) ) ( CALIBRATION_TARGET ?auto_20511 ?auto_20510 ) ( POWER_AVAIL ?auto_20512 ) ( POINTING ?auto_20512 ?auto_20508 ) ( not ( = ?auto_20510 ?auto_20508 ) ) ( not ( = ?auto_20505 ?auto_20508 ) ) ( not ( = ?auto_20507 ?auto_20508 ) ) ( HAVE_IMAGE ?auto_20508 ?auto_20509 ) ( not ( = ?auto_20506 ?auto_20509 ) ) ( not ( = ?auto_20504 ?auto_20509 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20507 ?auto_20504 ?auto_20505 ?auto_20506 )
      ( GET-3IMAGE-VERIFY ?auto_20505 ?auto_20506 ?auto_20507 ?auto_20504 ?auto_20508 ?auto_20509 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20524 - DIRECTION
      ?auto_20525 - MODE
      ?auto_20526 - DIRECTION
      ?auto_20523 - MODE
      ?auto_20527 - DIRECTION
      ?auto_20528 - MODE
    )
    :vars
    (
      ?auto_20530 - INSTRUMENT
      ?auto_20531 - SATELLITE
      ?auto_20529 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20530 ?auto_20531 ) ( SUPPORTS ?auto_20530 ?auto_20525 ) ( not ( = ?auto_20524 ?auto_20529 ) ) ( HAVE_IMAGE ?auto_20527 ?auto_20528 ) ( not ( = ?auto_20527 ?auto_20524 ) ) ( not ( = ?auto_20527 ?auto_20529 ) ) ( not ( = ?auto_20528 ?auto_20525 ) ) ( CALIBRATION_TARGET ?auto_20530 ?auto_20529 ) ( POWER_AVAIL ?auto_20531 ) ( POINTING ?auto_20531 ?auto_20526 ) ( not ( = ?auto_20529 ?auto_20526 ) ) ( not ( = ?auto_20524 ?auto_20526 ) ) ( not ( = ?auto_20527 ?auto_20526 ) ) ( HAVE_IMAGE ?auto_20526 ?auto_20523 ) ( not ( = ?auto_20525 ?auto_20523 ) ) ( not ( = ?auto_20523 ?auto_20528 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20527 ?auto_20528 ?auto_20524 ?auto_20525 )
      ( GET-3IMAGE-VERIFY ?auto_20524 ?auto_20525 ?auto_20526 ?auto_20523 ?auto_20527 ?auto_20528 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20533 - DIRECTION
      ?auto_20534 - MODE
      ?auto_20535 - DIRECTION
      ?auto_20532 - MODE
      ?auto_20536 - DIRECTION
      ?auto_20537 - MODE
    )
    :vars
    (
      ?auto_20541 - INSTRUMENT
      ?auto_20542 - SATELLITE
      ?auto_20540 - DIRECTION
      ?auto_20538 - DIRECTION
      ?auto_20539 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_20541 ?auto_20542 ) ( SUPPORTS ?auto_20541 ?auto_20534 ) ( not ( = ?auto_20533 ?auto_20540 ) ) ( HAVE_IMAGE ?auto_20538 ?auto_20539 ) ( not ( = ?auto_20538 ?auto_20533 ) ) ( not ( = ?auto_20538 ?auto_20540 ) ) ( not ( = ?auto_20539 ?auto_20534 ) ) ( CALIBRATION_TARGET ?auto_20541 ?auto_20540 ) ( POWER_AVAIL ?auto_20542 ) ( POINTING ?auto_20542 ?auto_20536 ) ( not ( = ?auto_20540 ?auto_20536 ) ) ( not ( = ?auto_20533 ?auto_20536 ) ) ( not ( = ?auto_20538 ?auto_20536 ) ) ( HAVE_IMAGE ?auto_20535 ?auto_20532 ) ( HAVE_IMAGE ?auto_20536 ?auto_20537 ) ( not ( = ?auto_20533 ?auto_20535 ) ) ( not ( = ?auto_20534 ?auto_20532 ) ) ( not ( = ?auto_20534 ?auto_20537 ) ) ( not ( = ?auto_20535 ?auto_20536 ) ) ( not ( = ?auto_20535 ?auto_20540 ) ) ( not ( = ?auto_20535 ?auto_20538 ) ) ( not ( = ?auto_20532 ?auto_20537 ) ) ( not ( = ?auto_20532 ?auto_20539 ) ) ( not ( = ?auto_20537 ?auto_20539 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20538 ?auto_20539 ?auto_20533 ?auto_20534 )
      ( GET-3IMAGE-VERIFY ?auto_20533 ?auto_20534 ?auto_20535 ?auto_20532 ?auto_20536 ?auto_20537 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20587 - DIRECTION
      ?auto_20588 - MODE
    )
    :vars
    (
      ?auto_20592 - INSTRUMENT
      ?auto_20593 - SATELLITE
      ?auto_20591 - DIRECTION
      ?auto_20589 - DIRECTION
      ?auto_20590 - MODE
      ?auto_20594 - DIRECTION
      ?auto_20595 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20592 ?auto_20593 ) ( SUPPORTS ?auto_20592 ?auto_20588 ) ( not ( = ?auto_20587 ?auto_20591 ) ) ( HAVE_IMAGE ?auto_20589 ?auto_20590 ) ( not ( = ?auto_20589 ?auto_20587 ) ) ( not ( = ?auto_20589 ?auto_20591 ) ) ( not ( = ?auto_20590 ?auto_20588 ) ) ( CALIBRATION_TARGET ?auto_20592 ?auto_20591 ) ( POINTING ?auto_20593 ?auto_20594 ) ( not ( = ?auto_20591 ?auto_20594 ) ) ( not ( = ?auto_20587 ?auto_20594 ) ) ( not ( = ?auto_20589 ?auto_20594 ) ) ( ON_BOARD ?auto_20595 ?auto_20593 ) ( POWER_ON ?auto_20595 ) ( not ( = ?auto_20592 ?auto_20595 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_20595 ?auto_20593 )
      ( GET-2IMAGE ?auto_20589 ?auto_20590 ?auto_20587 ?auto_20588 )
      ( GET-1IMAGE-VERIFY ?auto_20587 ?auto_20588 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20597 - DIRECTION
      ?auto_20598 - MODE
      ?auto_20599 - DIRECTION
      ?auto_20596 - MODE
    )
    :vars
    (
      ?auto_20601 - INSTRUMENT
      ?auto_20604 - SATELLITE
      ?auto_20600 - DIRECTION
      ?auto_20602 - DIRECTION
      ?auto_20603 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20601 ?auto_20604 ) ( SUPPORTS ?auto_20601 ?auto_20596 ) ( not ( = ?auto_20599 ?auto_20600 ) ) ( HAVE_IMAGE ?auto_20597 ?auto_20598 ) ( not ( = ?auto_20597 ?auto_20599 ) ) ( not ( = ?auto_20597 ?auto_20600 ) ) ( not ( = ?auto_20598 ?auto_20596 ) ) ( CALIBRATION_TARGET ?auto_20601 ?auto_20600 ) ( POINTING ?auto_20604 ?auto_20602 ) ( not ( = ?auto_20600 ?auto_20602 ) ) ( not ( = ?auto_20599 ?auto_20602 ) ) ( not ( = ?auto_20597 ?auto_20602 ) ) ( ON_BOARD ?auto_20603 ?auto_20604 ) ( POWER_ON ?auto_20603 ) ( not ( = ?auto_20601 ?auto_20603 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_20599 ?auto_20596 )
      ( GET-2IMAGE-VERIFY ?auto_20597 ?auto_20598 ?auto_20599 ?auto_20596 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20606 - DIRECTION
      ?auto_20607 - MODE
      ?auto_20608 - DIRECTION
      ?auto_20605 - MODE
    )
    :vars
    (
      ?auto_20611 - INSTRUMENT
      ?auto_20610 - SATELLITE
      ?auto_20609 - DIRECTION
      ?auto_20614 - DIRECTION
      ?auto_20613 - MODE
      ?auto_20612 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20611 ?auto_20610 ) ( SUPPORTS ?auto_20611 ?auto_20605 ) ( not ( = ?auto_20608 ?auto_20609 ) ) ( HAVE_IMAGE ?auto_20614 ?auto_20613 ) ( not ( = ?auto_20614 ?auto_20608 ) ) ( not ( = ?auto_20614 ?auto_20609 ) ) ( not ( = ?auto_20613 ?auto_20605 ) ) ( CALIBRATION_TARGET ?auto_20611 ?auto_20609 ) ( POINTING ?auto_20610 ?auto_20606 ) ( not ( = ?auto_20609 ?auto_20606 ) ) ( not ( = ?auto_20608 ?auto_20606 ) ) ( not ( = ?auto_20614 ?auto_20606 ) ) ( ON_BOARD ?auto_20612 ?auto_20610 ) ( POWER_ON ?auto_20612 ) ( not ( = ?auto_20611 ?auto_20612 ) ) ( HAVE_IMAGE ?auto_20606 ?auto_20607 ) ( not ( = ?auto_20607 ?auto_20605 ) ) ( not ( = ?auto_20607 ?auto_20613 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20614 ?auto_20613 ?auto_20608 ?auto_20605 )
      ( GET-2IMAGE-VERIFY ?auto_20606 ?auto_20607 ?auto_20608 ?auto_20605 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20616 - DIRECTION
      ?auto_20617 - MODE
      ?auto_20618 - DIRECTION
      ?auto_20615 - MODE
    )
    :vars
    (
      ?auto_20622 - INSTRUMENT
      ?auto_20620 - SATELLITE
      ?auto_20619 - DIRECTION
      ?auto_20621 - DIRECTION
      ?auto_20623 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20622 ?auto_20620 ) ( SUPPORTS ?auto_20622 ?auto_20617 ) ( not ( = ?auto_20616 ?auto_20619 ) ) ( HAVE_IMAGE ?auto_20618 ?auto_20615 ) ( not ( = ?auto_20618 ?auto_20616 ) ) ( not ( = ?auto_20618 ?auto_20619 ) ) ( not ( = ?auto_20615 ?auto_20617 ) ) ( CALIBRATION_TARGET ?auto_20622 ?auto_20619 ) ( POINTING ?auto_20620 ?auto_20621 ) ( not ( = ?auto_20619 ?auto_20621 ) ) ( not ( = ?auto_20616 ?auto_20621 ) ) ( not ( = ?auto_20618 ?auto_20621 ) ) ( ON_BOARD ?auto_20623 ?auto_20620 ) ( POWER_ON ?auto_20623 ) ( not ( = ?auto_20622 ?auto_20623 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20618 ?auto_20615 ?auto_20616 ?auto_20617 )
      ( GET-2IMAGE-VERIFY ?auto_20616 ?auto_20617 ?auto_20618 ?auto_20615 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20625 - DIRECTION
      ?auto_20626 - MODE
      ?auto_20627 - DIRECTION
      ?auto_20624 - MODE
    )
    :vars
    (
      ?auto_20630 - INSTRUMENT
      ?auto_20629 - SATELLITE
      ?auto_20628 - DIRECTION
      ?auto_20633 - DIRECTION
      ?auto_20632 - MODE
      ?auto_20631 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20630 ?auto_20629 ) ( SUPPORTS ?auto_20630 ?auto_20626 ) ( not ( = ?auto_20625 ?auto_20628 ) ) ( HAVE_IMAGE ?auto_20633 ?auto_20632 ) ( not ( = ?auto_20633 ?auto_20625 ) ) ( not ( = ?auto_20633 ?auto_20628 ) ) ( not ( = ?auto_20632 ?auto_20626 ) ) ( CALIBRATION_TARGET ?auto_20630 ?auto_20628 ) ( POINTING ?auto_20629 ?auto_20627 ) ( not ( = ?auto_20628 ?auto_20627 ) ) ( not ( = ?auto_20625 ?auto_20627 ) ) ( not ( = ?auto_20633 ?auto_20627 ) ) ( ON_BOARD ?auto_20631 ?auto_20629 ) ( POWER_ON ?auto_20631 ) ( not ( = ?auto_20630 ?auto_20631 ) ) ( HAVE_IMAGE ?auto_20627 ?auto_20624 ) ( not ( = ?auto_20626 ?auto_20624 ) ) ( not ( = ?auto_20624 ?auto_20632 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20633 ?auto_20632 ?auto_20625 ?auto_20626 )
      ( GET-2IMAGE-VERIFY ?auto_20625 ?auto_20626 ?auto_20627 ?auto_20624 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20646 - DIRECTION
      ?auto_20647 - MODE
      ?auto_20648 - DIRECTION
      ?auto_20645 - MODE
      ?auto_20649 - DIRECTION
      ?auto_20650 - MODE
    )
    :vars
    (
      ?auto_20654 - INSTRUMENT
      ?auto_20652 - SATELLITE
      ?auto_20651 - DIRECTION
      ?auto_20653 - DIRECTION
      ?auto_20655 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20654 ?auto_20652 ) ( SUPPORTS ?auto_20654 ?auto_20650 ) ( not ( = ?auto_20649 ?auto_20651 ) ) ( HAVE_IMAGE ?auto_20646 ?auto_20645 ) ( not ( = ?auto_20646 ?auto_20649 ) ) ( not ( = ?auto_20646 ?auto_20651 ) ) ( not ( = ?auto_20645 ?auto_20650 ) ) ( CALIBRATION_TARGET ?auto_20654 ?auto_20651 ) ( POINTING ?auto_20652 ?auto_20653 ) ( not ( = ?auto_20651 ?auto_20653 ) ) ( not ( = ?auto_20649 ?auto_20653 ) ) ( not ( = ?auto_20646 ?auto_20653 ) ) ( ON_BOARD ?auto_20655 ?auto_20652 ) ( POWER_ON ?auto_20655 ) ( not ( = ?auto_20654 ?auto_20655 ) ) ( HAVE_IMAGE ?auto_20646 ?auto_20647 ) ( HAVE_IMAGE ?auto_20648 ?auto_20645 ) ( not ( = ?auto_20646 ?auto_20648 ) ) ( not ( = ?auto_20647 ?auto_20645 ) ) ( not ( = ?auto_20647 ?auto_20650 ) ) ( not ( = ?auto_20648 ?auto_20649 ) ) ( not ( = ?auto_20648 ?auto_20651 ) ) ( not ( = ?auto_20648 ?auto_20653 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20646 ?auto_20645 ?auto_20649 ?auto_20650 )
      ( GET-3IMAGE-VERIFY ?auto_20646 ?auto_20647 ?auto_20648 ?auto_20645 ?auto_20649 ?auto_20650 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20657 - DIRECTION
      ?auto_20658 - MODE
      ?auto_20659 - DIRECTION
      ?auto_20656 - MODE
      ?auto_20660 - DIRECTION
      ?auto_20661 - MODE
    )
    :vars
    (
      ?auto_20664 - INSTRUMENT
      ?auto_20663 - SATELLITE
      ?auto_20662 - DIRECTION
      ?auto_20665 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20664 ?auto_20663 ) ( SUPPORTS ?auto_20664 ?auto_20661 ) ( not ( = ?auto_20660 ?auto_20662 ) ) ( HAVE_IMAGE ?auto_20657 ?auto_20658 ) ( not ( = ?auto_20657 ?auto_20660 ) ) ( not ( = ?auto_20657 ?auto_20662 ) ) ( not ( = ?auto_20658 ?auto_20661 ) ) ( CALIBRATION_TARGET ?auto_20664 ?auto_20662 ) ( POINTING ?auto_20663 ?auto_20659 ) ( not ( = ?auto_20662 ?auto_20659 ) ) ( not ( = ?auto_20660 ?auto_20659 ) ) ( not ( = ?auto_20657 ?auto_20659 ) ) ( ON_BOARD ?auto_20665 ?auto_20663 ) ( POWER_ON ?auto_20665 ) ( not ( = ?auto_20664 ?auto_20665 ) ) ( HAVE_IMAGE ?auto_20659 ?auto_20656 ) ( not ( = ?auto_20658 ?auto_20656 ) ) ( not ( = ?auto_20656 ?auto_20661 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20657 ?auto_20658 ?auto_20660 ?auto_20661 )
      ( GET-3IMAGE-VERIFY ?auto_20657 ?auto_20658 ?auto_20659 ?auto_20656 ?auto_20660 ?auto_20661 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20667 - DIRECTION
      ?auto_20668 - MODE
      ?auto_20669 - DIRECTION
      ?auto_20666 - MODE
      ?auto_20670 - DIRECTION
      ?auto_20671 - MODE
    )
    :vars
    (
      ?auto_20675 - INSTRUMENT
      ?auto_20673 - SATELLITE
      ?auto_20672 - DIRECTION
      ?auto_20674 - DIRECTION
      ?auto_20676 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20675 ?auto_20673 ) ( SUPPORTS ?auto_20675 ?auto_20666 ) ( not ( = ?auto_20669 ?auto_20672 ) ) ( HAVE_IMAGE ?auto_20670 ?auto_20671 ) ( not ( = ?auto_20670 ?auto_20669 ) ) ( not ( = ?auto_20670 ?auto_20672 ) ) ( not ( = ?auto_20671 ?auto_20666 ) ) ( CALIBRATION_TARGET ?auto_20675 ?auto_20672 ) ( POINTING ?auto_20673 ?auto_20674 ) ( not ( = ?auto_20672 ?auto_20674 ) ) ( not ( = ?auto_20669 ?auto_20674 ) ) ( not ( = ?auto_20670 ?auto_20674 ) ) ( ON_BOARD ?auto_20676 ?auto_20673 ) ( POWER_ON ?auto_20676 ) ( not ( = ?auto_20675 ?auto_20676 ) ) ( HAVE_IMAGE ?auto_20667 ?auto_20668 ) ( not ( = ?auto_20667 ?auto_20669 ) ) ( not ( = ?auto_20667 ?auto_20670 ) ) ( not ( = ?auto_20667 ?auto_20672 ) ) ( not ( = ?auto_20667 ?auto_20674 ) ) ( not ( = ?auto_20668 ?auto_20666 ) ) ( not ( = ?auto_20668 ?auto_20671 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20670 ?auto_20671 ?auto_20669 ?auto_20666 )
      ( GET-3IMAGE-VERIFY ?auto_20667 ?auto_20668 ?auto_20669 ?auto_20666 ?auto_20670 ?auto_20671 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20678 - DIRECTION
      ?auto_20679 - MODE
      ?auto_20680 - DIRECTION
      ?auto_20677 - MODE
      ?auto_20681 - DIRECTION
      ?auto_20682 - MODE
    )
    :vars
    (
      ?auto_20685 - INSTRUMENT
      ?auto_20684 - SATELLITE
      ?auto_20683 - DIRECTION
      ?auto_20686 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20685 ?auto_20684 ) ( SUPPORTS ?auto_20685 ?auto_20677 ) ( not ( = ?auto_20680 ?auto_20683 ) ) ( HAVE_IMAGE ?auto_20678 ?auto_20679 ) ( not ( = ?auto_20678 ?auto_20680 ) ) ( not ( = ?auto_20678 ?auto_20683 ) ) ( not ( = ?auto_20679 ?auto_20677 ) ) ( CALIBRATION_TARGET ?auto_20685 ?auto_20683 ) ( POINTING ?auto_20684 ?auto_20681 ) ( not ( = ?auto_20683 ?auto_20681 ) ) ( not ( = ?auto_20680 ?auto_20681 ) ) ( not ( = ?auto_20678 ?auto_20681 ) ) ( ON_BOARD ?auto_20686 ?auto_20684 ) ( POWER_ON ?auto_20686 ) ( not ( = ?auto_20685 ?auto_20686 ) ) ( HAVE_IMAGE ?auto_20681 ?auto_20682 ) ( not ( = ?auto_20679 ?auto_20682 ) ) ( not ( = ?auto_20677 ?auto_20682 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20678 ?auto_20679 ?auto_20680 ?auto_20677 )
      ( GET-3IMAGE-VERIFY ?auto_20678 ?auto_20679 ?auto_20680 ?auto_20677 ?auto_20681 ?auto_20682 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20699 - DIRECTION
      ?auto_20700 - MODE
      ?auto_20701 - DIRECTION
      ?auto_20698 - MODE
      ?auto_20702 - DIRECTION
      ?auto_20703 - MODE
    )
    :vars
    (
      ?auto_20706 - INSTRUMENT
      ?auto_20705 - SATELLITE
      ?auto_20704 - DIRECTION
      ?auto_20707 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20706 ?auto_20705 ) ( SUPPORTS ?auto_20706 ?auto_20703 ) ( not ( = ?auto_20702 ?auto_20704 ) ) ( HAVE_IMAGE ?auto_20701 ?auto_20698 ) ( not ( = ?auto_20701 ?auto_20702 ) ) ( not ( = ?auto_20701 ?auto_20704 ) ) ( not ( = ?auto_20698 ?auto_20703 ) ) ( CALIBRATION_TARGET ?auto_20706 ?auto_20704 ) ( POINTING ?auto_20705 ?auto_20699 ) ( not ( = ?auto_20704 ?auto_20699 ) ) ( not ( = ?auto_20702 ?auto_20699 ) ) ( not ( = ?auto_20701 ?auto_20699 ) ) ( ON_BOARD ?auto_20707 ?auto_20705 ) ( POWER_ON ?auto_20707 ) ( not ( = ?auto_20706 ?auto_20707 ) ) ( HAVE_IMAGE ?auto_20699 ?auto_20700 ) ( not ( = ?auto_20700 ?auto_20698 ) ) ( not ( = ?auto_20700 ?auto_20703 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20701 ?auto_20698 ?auto_20702 ?auto_20703 )
      ( GET-3IMAGE-VERIFY ?auto_20699 ?auto_20700 ?auto_20701 ?auto_20698 ?auto_20702 ?auto_20703 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20709 - DIRECTION
      ?auto_20710 - MODE
      ?auto_20711 - DIRECTION
      ?auto_20708 - MODE
      ?auto_20712 - DIRECTION
      ?auto_20713 - MODE
    )
    :vars
    (
      ?auto_20716 - INSTRUMENT
      ?auto_20715 - SATELLITE
      ?auto_20714 - DIRECTION
      ?auto_20719 - DIRECTION
      ?auto_20718 - MODE
      ?auto_20717 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20716 ?auto_20715 ) ( SUPPORTS ?auto_20716 ?auto_20713 ) ( not ( = ?auto_20712 ?auto_20714 ) ) ( HAVE_IMAGE ?auto_20719 ?auto_20718 ) ( not ( = ?auto_20719 ?auto_20712 ) ) ( not ( = ?auto_20719 ?auto_20714 ) ) ( not ( = ?auto_20718 ?auto_20713 ) ) ( CALIBRATION_TARGET ?auto_20716 ?auto_20714 ) ( POINTING ?auto_20715 ?auto_20711 ) ( not ( = ?auto_20714 ?auto_20711 ) ) ( not ( = ?auto_20712 ?auto_20711 ) ) ( not ( = ?auto_20719 ?auto_20711 ) ) ( ON_BOARD ?auto_20717 ?auto_20715 ) ( POWER_ON ?auto_20717 ) ( not ( = ?auto_20716 ?auto_20717 ) ) ( HAVE_IMAGE ?auto_20709 ?auto_20710 ) ( HAVE_IMAGE ?auto_20711 ?auto_20708 ) ( not ( = ?auto_20709 ?auto_20711 ) ) ( not ( = ?auto_20709 ?auto_20712 ) ) ( not ( = ?auto_20709 ?auto_20714 ) ) ( not ( = ?auto_20709 ?auto_20719 ) ) ( not ( = ?auto_20710 ?auto_20708 ) ) ( not ( = ?auto_20710 ?auto_20713 ) ) ( not ( = ?auto_20710 ?auto_20718 ) ) ( not ( = ?auto_20708 ?auto_20713 ) ) ( not ( = ?auto_20708 ?auto_20718 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20719 ?auto_20718 ?auto_20712 ?auto_20713 )
      ( GET-3IMAGE-VERIFY ?auto_20709 ?auto_20710 ?auto_20711 ?auto_20708 ?auto_20712 ?auto_20713 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20721 - DIRECTION
      ?auto_20722 - MODE
      ?auto_20723 - DIRECTION
      ?auto_20720 - MODE
      ?auto_20724 - DIRECTION
      ?auto_20725 - MODE
    )
    :vars
    (
      ?auto_20728 - INSTRUMENT
      ?auto_20727 - SATELLITE
      ?auto_20726 - DIRECTION
      ?auto_20729 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20728 ?auto_20727 ) ( SUPPORTS ?auto_20728 ?auto_20720 ) ( not ( = ?auto_20723 ?auto_20726 ) ) ( HAVE_IMAGE ?auto_20724 ?auto_20725 ) ( not ( = ?auto_20724 ?auto_20723 ) ) ( not ( = ?auto_20724 ?auto_20726 ) ) ( not ( = ?auto_20725 ?auto_20720 ) ) ( CALIBRATION_TARGET ?auto_20728 ?auto_20726 ) ( POINTING ?auto_20727 ?auto_20721 ) ( not ( = ?auto_20726 ?auto_20721 ) ) ( not ( = ?auto_20723 ?auto_20721 ) ) ( not ( = ?auto_20724 ?auto_20721 ) ) ( ON_BOARD ?auto_20729 ?auto_20727 ) ( POWER_ON ?auto_20729 ) ( not ( = ?auto_20728 ?auto_20729 ) ) ( HAVE_IMAGE ?auto_20721 ?auto_20722 ) ( not ( = ?auto_20722 ?auto_20720 ) ) ( not ( = ?auto_20722 ?auto_20725 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20724 ?auto_20725 ?auto_20723 ?auto_20720 )
      ( GET-3IMAGE-VERIFY ?auto_20721 ?auto_20722 ?auto_20723 ?auto_20720 ?auto_20724 ?auto_20725 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20731 - DIRECTION
      ?auto_20732 - MODE
      ?auto_20733 - DIRECTION
      ?auto_20730 - MODE
      ?auto_20734 - DIRECTION
      ?auto_20735 - MODE
    )
    :vars
    (
      ?auto_20738 - INSTRUMENT
      ?auto_20737 - SATELLITE
      ?auto_20736 - DIRECTION
      ?auto_20741 - DIRECTION
      ?auto_20740 - MODE
      ?auto_20739 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20738 ?auto_20737 ) ( SUPPORTS ?auto_20738 ?auto_20730 ) ( not ( = ?auto_20733 ?auto_20736 ) ) ( HAVE_IMAGE ?auto_20741 ?auto_20740 ) ( not ( = ?auto_20741 ?auto_20733 ) ) ( not ( = ?auto_20741 ?auto_20736 ) ) ( not ( = ?auto_20740 ?auto_20730 ) ) ( CALIBRATION_TARGET ?auto_20738 ?auto_20736 ) ( POINTING ?auto_20737 ?auto_20731 ) ( not ( = ?auto_20736 ?auto_20731 ) ) ( not ( = ?auto_20733 ?auto_20731 ) ) ( not ( = ?auto_20741 ?auto_20731 ) ) ( ON_BOARD ?auto_20739 ?auto_20737 ) ( POWER_ON ?auto_20739 ) ( not ( = ?auto_20738 ?auto_20739 ) ) ( HAVE_IMAGE ?auto_20731 ?auto_20732 ) ( HAVE_IMAGE ?auto_20734 ?auto_20735 ) ( not ( = ?auto_20731 ?auto_20734 ) ) ( not ( = ?auto_20732 ?auto_20730 ) ) ( not ( = ?auto_20732 ?auto_20735 ) ) ( not ( = ?auto_20732 ?auto_20740 ) ) ( not ( = ?auto_20733 ?auto_20734 ) ) ( not ( = ?auto_20730 ?auto_20735 ) ) ( not ( = ?auto_20734 ?auto_20736 ) ) ( not ( = ?auto_20734 ?auto_20741 ) ) ( not ( = ?auto_20735 ?auto_20740 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20741 ?auto_20740 ?auto_20733 ?auto_20730 )
      ( GET-3IMAGE-VERIFY ?auto_20731 ?auto_20732 ?auto_20733 ?auto_20730 ?auto_20734 ?auto_20735 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20755 - DIRECTION
      ?auto_20756 - MODE
      ?auto_20757 - DIRECTION
      ?auto_20754 - MODE
      ?auto_20758 - DIRECTION
      ?auto_20759 - MODE
    )
    :vars
    (
      ?auto_20763 - INSTRUMENT
      ?auto_20761 - SATELLITE
      ?auto_20760 - DIRECTION
      ?auto_20762 - DIRECTION
      ?auto_20764 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20763 ?auto_20761 ) ( SUPPORTS ?auto_20763 ?auto_20756 ) ( not ( = ?auto_20755 ?auto_20760 ) ) ( HAVE_IMAGE ?auto_20758 ?auto_20759 ) ( not ( = ?auto_20758 ?auto_20755 ) ) ( not ( = ?auto_20758 ?auto_20760 ) ) ( not ( = ?auto_20759 ?auto_20756 ) ) ( CALIBRATION_TARGET ?auto_20763 ?auto_20760 ) ( POINTING ?auto_20761 ?auto_20762 ) ( not ( = ?auto_20760 ?auto_20762 ) ) ( not ( = ?auto_20755 ?auto_20762 ) ) ( not ( = ?auto_20758 ?auto_20762 ) ) ( ON_BOARD ?auto_20764 ?auto_20761 ) ( POWER_ON ?auto_20764 ) ( not ( = ?auto_20763 ?auto_20764 ) ) ( HAVE_IMAGE ?auto_20757 ?auto_20754 ) ( not ( = ?auto_20755 ?auto_20757 ) ) ( not ( = ?auto_20756 ?auto_20754 ) ) ( not ( = ?auto_20757 ?auto_20758 ) ) ( not ( = ?auto_20757 ?auto_20760 ) ) ( not ( = ?auto_20757 ?auto_20762 ) ) ( not ( = ?auto_20754 ?auto_20759 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20758 ?auto_20759 ?auto_20755 ?auto_20756 )
      ( GET-3IMAGE-VERIFY ?auto_20755 ?auto_20756 ?auto_20757 ?auto_20754 ?auto_20758 ?auto_20759 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20766 - DIRECTION
      ?auto_20767 - MODE
      ?auto_20768 - DIRECTION
      ?auto_20765 - MODE
      ?auto_20769 - DIRECTION
      ?auto_20770 - MODE
    )
    :vars
    (
      ?auto_20773 - INSTRUMENT
      ?auto_20772 - SATELLITE
      ?auto_20771 - DIRECTION
      ?auto_20774 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20773 ?auto_20772 ) ( SUPPORTS ?auto_20773 ?auto_20767 ) ( not ( = ?auto_20766 ?auto_20771 ) ) ( HAVE_IMAGE ?auto_20768 ?auto_20765 ) ( not ( = ?auto_20768 ?auto_20766 ) ) ( not ( = ?auto_20768 ?auto_20771 ) ) ( not ( = ?auto_20765 ?auto_20767 ) ) ( CALIBRATION_TARGET ?auto_20773 ?auto_20771 ) ( POINTING ?auto_20772 ?auto_20769 ) ( not ( = ?auto_20771 ?auto_20769 ) ) ( not ( = ?auto_20766 ?auto_20769 ) ) ( not ( = ?auto_20768 ?auto_20769 ) ) ( ON_BOARD ?auto_20774 ?auto_20772 ) ( POWER_ON ?auto_20774 ) ( not ( = ?auto_20773 ?auto_20774 ) ) ( HAVE_IMAGE ?auto_20769 ?auto_20770 ) ( not ( = ?auto_20767 ?auto_20770 ) ) ( not ( = ?auto_20765 ?auto_20770 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20768 ?auto_20765 ?auto_20766 ?auto_20767 )
      ( GET-3IMAGE-VERIFY ?auto_20766 ?auto_20767 ?auto_20768 ?auto_20765 ?auto_20769 ?auto_20770 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20787 - DIRECTION
      ?auto_20788 - MODE
      ?auto_20789 - DIRECTION
      ?auto_20786 - MODE
      ?auto_20790 - DIRECTION
      ?auto_20791 - MODE
    )
    :vars
    (
      ?auto_20794 - INSTRUMENT
      ?auto_20793 - SATELLITE
      ?auto_20792 - DIRECTION
      ?auto_20795 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20794 ?auto_20793 ) ( SUPPORTS ?auto_20794 ?auto_20788 ) ( not ( = ?auto_20787 ?auto_20792 ) ) ( HAVE_IMAGE ?auto_20790 ?auto_20791 ) ( not ( = ?auto_20790 ?auto_20787 ) ) ( not ( = ?auto_20790 ?auto_20792 ) ) ( not ( = ?auto_20791 ?auto_20788 ) ) ( CALIBRATION_TARGET ?auto_20794 ?auto_20792 ) ( POINTING ?auto_20793 ?auto_20789 ) ( not ( = ?auto_20792 ?auto_20789 ) ) ( not ( = ?auto_20787 ?auto_20789 ) ) ( not ( = ?auto_20790 ?auto_20789 ) ) ( ON_BOARD ?auto_20795 ?auto_20793 ) ( POWER_ON ?auto_20795 ) ( not ( = ?auto_20794 ?auto_20795 ) ) ( HAVE_IMAGE ?auto_20789 ?auto_20786 ) ( not ( = ?auto_20788 ?auto_20786 ) ) ( not ( = ?auto_20786 ?auto_20791 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20790 ?auto_20791 ?auto_20787 ?auto_20788 )
      ( GET-3IMAGE-VERIFY ?auto_20787 ?auto_20788 ?auto_20789 ?auto_20786 ?auto_20790 ?auto_20791 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20797 - DIRECTION
      ?auto_20798 - MODE
      ?auto_20799 - DIRECTION
      ?auto_20796 - MODE
      ?auto_20800 - DIRECTION
      ?auto_20801 - MODE
    )
    :vars
    (
      ?auto_20804 - INSTRUMENT
      ?auto_20803 - SATELLITE
      ?auto_20802 - DIRECTION
      ?auto_20807 - DIRECTION
      ?auto_20806 - MODE
      ?auto_20805 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20804 ?auto_20803 ) ( SUPPORTS ?auto_20804 ?auto_20798 ) ( not ( = ?auto_20797 ?auto_20802 ) ) ( HAVE_IMAGE ?auto_20807 ?auto_20806 ) ( not ( = ?auto_20807 ?auto_20797 ) ) ( not ( = ?auto_20807 ?auto_20802 ) ) ( not ( = ?auto_20806 ?auto_20798 ) ) ( CALIBRATION_TARGET ?auto_20804 ?auto_20802 ) ( POINTING ?auto_20803 ?auto_20799 ) ( not ( = ?auto_20802 ?auto_20799 ) ) ( not ( = ?auto_20797 ?auto_20799 ) ) ( not ( = ?auto_20807 ?auto_20799 ) ) ( ON_BOARD ?auto_20805 ?auto_20803 ) ( POWER_ON ?auto_20805 ) ( not ( = ?auto_20804 ?auto_20805 ) ) ( HAVE_IMAGE ?auto_20799 ?auto_20796 ) ( HAVE_IMAGE ?auto_20800 ?auto_20801 ) ( not ( = ?auto_20797 ?auto_20800 ) ) ( not ( = ?auto_20798 ?auto_20796 ) ) ( not ( = ?auto_20798 ?auto_20801 ) ) ( not ( = ?auto_20799 ?auto_20800 ) ) ( not ( = ?auto_20796 ?auto_20801 ) ) ( not ( = ?auto_20796 ?auto_20806 ) ) ( not ( = ?auto_20800 ?auto_20802 ) ) ( not ( = ?auto_20800 ?auto_20807 ) ) ( not ( = ?auto_20801 ?auto_20806 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20807 ?auto_20806 ?auto_20797 ?auto_20798 )
      ( GET-3IMAGE-VERIFY ?auto_20797 ?auto_20798 ?auto_20799 ?auto_20796 ?auto_20800 ?auto_20801 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20919 - DIRECTION
      ?auto_20920 - MODE
      ?auto_20921 - DIRECTION
      ?auto_20918 - MODE
      ?auto_20922 - DIRECTION
      ?auto_20923 - MODE
    )
    :vars
    (
      ?auto_20925 - INSTRUMENT
      ?auto_20926 - SATELLITE
      ?auto_20927 - DIRECTION
      ?auto_20924 - DIRECTION
      ?auto_20928 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20925 ?auto_20926 ) ( SUPPORTS ?auto_20925 ?auto_20918 ) ( not ( = ?auto_20921 ?auto_20927 ) ) ( HAVE_IMAGE ?auto_20919 ?auto_20920 ) ( not ( = ?auto_20919 ?auto_20921 ) ) ( not ( = ?auto_20919 ?auto_20927 ) ) ( not ( = ?auto_20920 ?auto_20918 ) ) ( CALIBRATION_TARGET ?auto_20925 ?auto_20927 ) ( POINTING ?auto_20926 ?auto_20924 ) ( not ( = ?auto_20927 ?auto_20924 ) ) ( not ( = ?auto_20921 ?auto_20924 ) ) ( not ( = ?auto_20919 ?auto_20924 ) ) ( ON_BOARD ?auto_20928 ?auto_20926 ) ( POWER_ON ?auto_20928 ) ( not ( = ?auto_20925 ?auto_20928 ) ) ( HAVE_IMAGE ?auto_20922 ?auto_20923 ) ( not ( = ?auto_20919 ?auto_20922 ) ) ( not ( = ?auto_20920 ?auto_20923 ) ) ( not ( = ?auto_20921 ?auto_20922 ) ) ( not ( = ?auto_20918 ?auto_20923 ) ) ( not ( = ?auto_20922 ?auto_20927 ) ) ( not ( = ?auto_20922 ?auto_20924 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20919 ?auto_20920 ?auto_20921 ?auto_20918 )
      ( GET-3IMAGE-VERIFY ?auto_20919 ?auto_20920 ?auto_20921 ?auto_20918 ?auto_20922 ?auto_20923 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21007 - DIRECTION
      ?auto_21008 - MODE
      ?auto_21009 - DIRECTION
      ?auto_21006 - MODE
      ?auto_21010 - DIRECTION
      ?auto_21011 - MODE
    )
    :vars
    (
      ?auto_21013 - INSTRUMENT
      ?auto_21014 - SATELLITE
      ?auto_21015 - DIRECTION
      ?auto_21012 - DIRECTION
      ?auto_21016 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21013 ?auto_21014 ) ( SUPPORTS ?auto_21013 ?auto_21008 ) ( not ( = ?auto_21007 ?auto_21015 ) ) ( HAVE_IMAGE ?auto_21009 ?auto_21006 ) ( not ( = ?auto_21009 ?auto_21007 ) ) ( not ( = ?auto_21009 ?auto_21015 ) ) ( not ( = ?auto_21006 ?auto_21008 ) ) ( CALIBRATION_TARGET ?auto_21013 ?auto_21015 ) ( POINTING ?auto_21014 ?auto_21012 ) ( not ( = ?auto_21015 ?auto_21012 ) ) ( not ( = ?auto_21007 ?auto_21012 ) ) ( not ( = ?auto_21009 ?auto_21012 ) ) ( ON_BOARD ?auto_21016 ?auto_21014 ) ( POWER_ON ?auto_21016 ) ( not ( = ?auto_21013 ?auto_21016 ) ) ( HAVE_IMAGE ?auto_21010 ?auto_21011 ) ( not ( = ?auto_21007 ?auto_21010 ) ) ( not ( = ?auto_21008 ?auto_21011 ) ) ( not ( = ?auto_21009 ?auto_21010 ) ) ( not ( = ?auto_21006 ?auto_21011 ) ) ( not ( = ?auto_21010 ?auto_21015 ) ) ( not ( = ?auto_21010 ?auto_21012 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21009 ?auto_21006 ?auto_21007 ?auto_21008 )
      ( GET-3IMAGE-VERIFY ?auto_21007 ?auto_21008 ?auto_21009 ?auto_21006 ?auto_21010 ?auto_21011 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_21108 - DIRECTION
      ?auto_21109 - MODE
    )
    :vars
    (
      ?auto_21112 - INSTRUMENT
      ?auto_21113 - SATELLITE
      ?auto_21114 - DIRECTION
      ?auto_21110 - DIRECTION
      ?auto_21115 - MODE
      ?auto_21111 - DIRECTION
      ?auto_21116 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21112 ?auto_21113 ) ( SUPPORTS ?auto_21112 ?auto_21109 ) ( not ( = ?auto_21108 ?auto_21114 ) ) ( HAVE_IMAGE ?auto_21110 ?auto_21115 ) ( not ( = ?auto_21110 ?auto_21108 ) ) ( not ( = ?auto_21110 ?auto_21114 ) ) ( not ( = ?auto_21115 ?auto_21109 ) ) ( CALIBRATION_TARGET ?auto_21112 ?auto_21114 ) ( not ( = ?auto_21114 ?auto_21111 ) ) ( not ( = ?auto_21108 ?auto_21111 ) ) ( not ( = ?auto_21110 ?auto_21111 ) ) ( ON_BOARD ?auto_21116 ?auto_21113 ) ( POWER_ON ?auto_21116 ) ( not ( = ?auto_21112 ?auto_21116 ) ) ( POINTING ?auto_21113 ?auto_21114 ) )
    :subtasks
    ( ( !TURN_TO ?auto_21113 ?auto_21111 ?auto_21114 )
      ( GET-2IMAGE ?auto_21110 ?auto_21115 ?auto_21108 ?auto_21109 )
      ( GET-1IMAGE-VERIFY ?auto_21108 ?auto_21109 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21118 - DIRECTION
      ?auto_21119 - MODE
      ?auto_21120 - DIRECTION
      ?auto_21117 - MODE
    )
    :vars
    (
      ?auto_21122 - INSTRUMENT
      ?auto_21121 - SATELLITE
      ?auto_21123 - DIRECTION
      ?auto_21124 - DIRECTION
      ?auto_21125 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21122 ?auto_21121 ) ( SUPPORTS ?auto_21122 ?auto_21117 ) ( not ( = ?auto_21120 ?auto_21123 ) ) ( HAVE_IMAGE ?auto_21118 ?auto_21119 ) ( not ( = ?auto_21118 ?auto_21120 ) ) ( not ( = ?auto_21118 ?auto_21123 ) ) ( not ( = ?auto_21119 ?auto_21117 ) ) ( CALIBRATION_TARGET ?auto_21122 ?auto_21123 ) ( not ( = ?auto_21123 ?auto_21124 ) ) ( not ( = ?auto_21120 ?auto_21124 ) ) ( not ( = ?auto_21118 ?auto_21124 ) ) ( ON_BOARD ?auto_21125 ?auto_21121 ) ( POWER_ON ?auto_21125 ) ( not ( = ?auto_21122 ?auto_21125 ) ) ( POINTING ?auto_21121 ?auto_21123 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21120 ?auto_21117 )
      ( GET-2IMAGE-VERIFY ?auto_21118 ?auto_21119 ?auto_21120 ?auto_21117 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21137 - DIRECTION
      ?auto_21138 - MODE
      ?auto_21139 - DIRECTION
      ?auto_21136 - MODE
    )
    :vars
    (
      ?auto_21141 - INSTRUMENT
      ?auto_21142 - SATELLITE
      ?auto_21143 - DIRECTION
      ?auto_21140 - DIRECTION
      ?auto_21144 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21141 ?auto_21142 ) ( SUPPORTS ?auto_21141 ?auto_21138 ) ( not ( = ?auto_21137 ?auto_21143 ) ) ( HAVE_IMAGE ?auto_21139 ?auto_21136 ) ( not ( = ?auto_21139 ?auto_21137 ) ) ( not ( = ?auto_21139 ?auto_21143 ) ) ( not ( = ?auto_21136 ?auto_21138 ) ) ( CALIBRATION_TARGET ?auto_21141 ?auto_21143 ) ( not ( = ?auto_21143 ?auto_21140 ) ) ( not ( = ?auto_21137 ?auto_21140 ) ) ( not ( = ?auto_21139 ?auto_21140 ) ) ( ON_BOARD ?auto_21144 ?auto_21142 ) ( POWER_ON ?auto_21144 ) ( not ( = ?auto_21141 ?auto_21144 ) ) ( POINTING ?auto_21142 ?auto_21143 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21139 ?auto_21136 ?auto_21137 ?auto_21138 )
      ( GET-2IMAGE-VERIFY ?auto_21137 ?auto_21138 ?auto_21139 ?auto_21136 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21167 - DIRECTION
      ?auto_21168 - MODE
      ?auto_21169 - DIRECTION
      ?auto_21166 - MODE
      ?auto_21170 - DIRECTION
      ?auto_21171 - MODE
    )
    :vars
    (
      ?auto_21173 - INSTRUMENT
      ?auto_21174 - SATELLITE
      ?auto_21175 - DIRECTION
      ?auto_21172 - DIRECTION
      ?auto_21176 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21173 ?auto_21174 ) ( SUPPORTS ?auto_21173 ?auto_21171 ) ( not ( = ?auto_21170 ?auto_21175 ) ) ( HAVE_IMAGE ?auto_21167 ?auto_21166 ) ( not ( = ?auto_21167 ?auto_21170 ) ) ( not ( = ?auto_21167 ?auto_21175 ) ) ( not ( = ?auto_21166 ?auto_21171 ) ) ( CALIBRATION_TARGET ?auto_21173 ?auto_21175 ) ( not ( = ?auto_21175 ?auto_21172 ) ) ( not ( = ?auto_21170 ?auto_21172 ) ) ( not ( = ?auto_21167 ?auto_21172 ) ) ( ON_BOARD ?auto_21176 ?auto_21174 ) ( POWER_ON ?auto_21176 ) ( not ( = ?auto_21173 ?auto_21176 ) ) ( POINTING ?auto_21174 ?auto_21175 ) ( HAVE_IMAGE ?auto_21167 ?auto_21168 ) ( HAVE_IMAGE ?auto_21169 ?auto_21166 ) ( not ( = ?auto_21167 ?auto_21169 ) ) ( not ( = ?auto_21168 ?auto_21166 ) ) ( not ( = ?auto_21168 ?auto_21171 ) ) ( not ( = ?auto_21169 ?auto_21170 ) ) ( not ( = ?auto_21169 ?auto_21175 ) ) ( not ( = ?auto_21169 ?auto_21172 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21167 ?auto_21166 ?auto_21170 ?auto_21171 )
      ( GET-3IMAGE-VERIFY ?auto_21167 ?auto_21168 ?auto_21169 ?auto_21166 ?auto_21170 ?auto_21171 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21188 - DIRECTION
      ?auto_21189 - MODE
      ?auto_21190 - DIRECTION
      ?auto_21187 - MODE
      ?auto_21191 - DIRECTION
      ?auto_21192 - MODE
    )
    :vars
    (
      ?auto_21194 - INSTRUMENT
      ?auto_21195 - SATELLITE
      ?auto_21196 - DIRECTION
      ?auto_21193 - DIRECTION
      ?auto_21197 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21194 ?auto_21195 ) ( SUPPORTS ?auto_21194 ?auto_21187 ) ( not ( = ?auto_21190 ?auto_21196 ) ) ( HAVE_IMAGE ?auto_21191 ?auto_21189 ) ( not ( = ?auto_21191 ?auto_21190 ) ) ( not ( = ?auto_21191 ?auto_21196 ) ) ( not ( = ?auto_21189 ?auto_21187 ) ) ( CALIBRATION_TARGET ?auto_21194 ?auto_21196 ) ( not ( = ?auto_21196 ?auto_21193 ) ) ( not ( = ?auto_21190 ?auto_21193 ) ) ( not ( = ?auto_21191 ?auto_21193 ) ) ( ON_BOARD ?auto_21197 ?auto_21195 ) ( POWER_ON ?auto_21197 ) ( not ( = ?auto_21194 ?auto_21197 ) ) ( POINTING ?auto_21195 ?auto_21196 ) ( HAVE_IMAGE ?auto_21188 ?auto_21189 ) ( HAVE_IMAGE ?auto_21191 ?auto_21192 ) ( not ( = ?auto_21188 ?auto_21190 ) ) ( not ( = ?auto_21188 ?auto_21191 ) ) ( not ( = ?auto_21188 ?auto_21196 ) ) ( not ( = ?auto_21188 ?auto_21193 ) ) ( not ( = ?auto_21189 ?auto_21192 ) ) ( not ( = ?auto_21187 ?auto_21192 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21191 ?auto_21189 ?auto_21190 ?auto_21187 )
      ( GET-3IMAGE-VERIFY ?auto_21188 ?auto_21189 ?auto_21190 ?auto_21187 ?auto_21191 ?auto_21192 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21276 - DIRECTION
      ?auto_21277 - MODE
      ?auto_21278 - DIRECTION
      ?auto_21275 - MODE
      ?auto_21279 - DIRECTION
      ?auto_21280 - MODE
    )
    :vars
    (
      ?auto_21282 - INSTRUMENT
      ?auto_21283 - SATELLITE
      ?auto_21284 - DIRECTION
      ?auto_21281 - DIRECTION
      ?auto_21285 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21282 ?auto_21283 ) ( SUPPORTS ?auto_21282 ?auto_21277 ) ( not ( = ?auto_21276 ?auto_21284 ) ) ( HAVE_IMAGE ?auto_21278 ?auto_21275 ) ( not ( = ?auto_21278 ?auto_21276 ) ) ( not ( = ?auto_21278 ?auto_21284 ) ) ( not ( = ?auto_21275 ?auto_21277 ) ) ( CALIBRATION_TARGET ?auto_21282 ?auto_21284 ) ( not ( = ?auto_21284 ?auto_21281 ) ) ( not ( = ?auto_21276 ?auto_21281 ) ) ( not ( = ?auto_21278 ?auto_21281 ) ) ( ON_BOARD ?auto_21285 ?auto_21283 ) ( POWER_ON ?auto_21285 ) ( not ( = ?auto_21282 ?auto_21285 ) ) ( POINTING ?auto_21283 ?auto_21284 ) ( HAVE_IMAGE ?auto_21279 ?auto_21280 ) ( not ( = ?auto_21276 ?auto_21279 ) ) ( not ( = ?auto_21277 ?auto_21280 ) ) ( not ( = ?auto_21278 ?auto_21279 ) ) ( not ( = ?auto_21275 ?auto_21280 ) ) ( not ( = ?auto_21279 ?auto_21284 ) ) ( not ( = ?auto_21279 ?auto_21281 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21278 ?auto_21275 ?auto_21276 ?auto_21277 )
      ( GET-3IMAGE-VERIFY ?auto_21276 ?auto_21277 ?auto_21278 ?auto_21275 ?auto_21279 ?auto_21280 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21702 - DIRECTION
      ?auto_21703 - MODE
      ?auto_21704 - DIRECTION
      ?auto_21701 - MODE
      ?auto_21705 - DIRECTION
      ?auto_21706 - MODE
    )
    :vars
    (
      ?auto_21708 - INSTRUMENT
      ?auto_21707 - SATELLITE
      ?auto_21709 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21708 ?auto_21707 ) ( SUPPORTS ?auto_21708 ?auto_21701 ) ( POINTING ?auto_21707 ?auto_21709 ) ( not ( = ?auto_21704 ?auto_21709 ) ) ( HAVE_IMAGE ?auto_21705 ?auto_21706 ) ( not ( = ?auto_21705 ?auto_21704 ) ) ( not ( = ?auto_21705 ?auto_21709 ) ) ( not ( = ?auto_21706 ?auto_21701 ) ) ( CALIBRATION_TARGET ?auto_21708 ?auto_21709 ) ( POWER_AVAIL ?auto_21707 ) ( HAVE_IMAGE ?auto_21702 ?auto_21703 ) ( not ( = ?auto_21702 ?auto_21704 ) ) ( not ( = ?auto_21702 ?auto_21705 ) ) ( not ( = ?auto_21702 ?auto_21709 ) ) ( not ( = ?auto_21703 ?auto_21701 ) ) ( not ( = ?auto_21703 ?auto_21706 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21705 ?auto_21706 ?auto_21704 ?auto_21701 )
      ( GET-3IMAGE-VERIFY ?auto_21702 ?auto_21703 ?auto_21704 ?auto_21701 ?auto_21705 ?auto_21706 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21780 - DIRECTION
      ?auto_21781 - MODE
      ?auto_21782 - DIRECTION
      ?auto_21779 - MODE
      ?auto_21783 - DIRECTION
      ?auto_21784 - MODE
    )
    :vars
    (
      ?auto_21786 - INSTRUMENT
      ?auto_21785 - SATELLITE
      ?auto_21787 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21786 ?auto_21785 ) ( SUPPORTS ?auto_21786 ?auto_21781 ) ( POINTING ?auto_21785 ?auto_21787 ) ( not ( = ?auto_21780 ?auto_21787 ) ) ( HAVE_IMAGE ?auto_21783 ?auto_21784 ) ( not ( = ?auto_21783 ?auto_21780 ) ) ( not ( = ?auto_21783 ?auto_21787 ) ) ( not ( = ?auto_21784 ?auto_21781 ) ) ( CALIBRATION_TARGET ?auto_21786 ?auto_21787 ) ( POWER_AVAIL ?auto_21785 ) ( HAVE_IMAGE ?auto_21782 ?auto_21779 ) ( not ( = ?auto_21780 ?auto_21782 ) ) ( not ( = ?auto_21781 ?auto_21779 ) ) ( not ( = ?auto_21782 ?auto_21783 ) ) ( not ( = ?auto_21782 ?auto_21787 ) ) ( not ( = ?auto_21779 ?auto_21784 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21783 ?auto_21784 ?auto_21780 ?auto_21781 )
      ( GET-3IMAGE-VERIFY ?auto_21780 ?auto_21781 ?auto_21782 ?auto_21779 ?auto_21783 ?auto_21784 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21906 - DIRECTION
      ?auto_21907 - MODE
      ?auto_21908 - DIRECTION
      ?auto_21905 - MODE
      ?auto_21909 - DIRECTION
      ?auto_21910 - MODE
    )
    :vars
    (
      ?auto_21911 - INSTRUMENT
      ?auto_21913 - SATELLITE
      ?auto_21912 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21911 ?auto_21913 ) ( SUPPORTS ?auto_21911 ?auto_21910 ) ( not ( = ?auto_21909 ?auto_21912 ) ) ( HAVE_IMAGE ?auto_21906 ?auto_21905 ) ( not ( = ?auto_21906 ?auto_21909 ) ) ( not ( = ?auto_21906 ?auto_21912 ) ) ( not ( = ?auto_21905 ?auto_21910 ) ) ( CALIBRATION_TARGET ?auto_21911 ?auto_21912 ) ( POWER_AVAIL ?auto_21913 ) ( POINTING ?auto_21913 ?auto_21906 ) ( HAVE_IMAGE ?auto_21906 ?auto_21907 ) ( HAVE_IMAGE ?auto_21908 ?auto_21905 ) ( not ( = ?auto_21906 ?auto_21908 ) ) ( not ( = ?auto_21907 ?auto_21905 ) ) ( not ( = ?auto_21907 ?auto_21910 ) ) ( not ( = ?auto_21908 ?auto_21909 ) ) ( not ( = ?auto_21908 ?auto_21912 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21906 ?auto_21905 ?auto_21909 ?auto_21910 )
      ( GET-3IMAGE-VERIFY ?auto_21906 ?auto_21907 ?auto_21908 ?auto_21905 ?auto_21909 ?auto_21910 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22002 - DIRECTION
      ?auto_22003 - MODE
      ?auto_22004 - DIRECTION
      ?auto_22001 - MODE
      ?auto_22005 - DIRECTION
      ?auto_22006 - MODE
    )
    :vars
    (
      ?auto_22007 - INSTRUMENT
      ?auto_22009 - SATELLITE
      ?auto_22008 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22007 ?auto_22009 ) ( SUPPORTS ?auto_22007 ?auto_22003 ) ( not ( = ?auto_22002 ?auto_22008 ) ) ( HAVE_IMAGE ?auto_22004 ?auto_22001 ) ( not ( = ?auto_22004 ?auto_22002 ) ) ( not ( = ?auto_22004 ?auto_22008 ) ) ( not ( = ?auto_22001 ?auto_22003 ) ) ( CALIBRATION_TARGET ?auto_22007 ?auto_22008 ) ( POWER_AVAIL ?auto_22009 ) ( POINTING ?auto_22009 ?auto_22004 ) ( HAVE_IMAGE ?auto_22005 ?auto_22006 ) ( not ( = ?auto_22002 ?auto_22005 ) ) ( not ( = ?auto_22003 ?auto_22006 ) ) ( not ( = ?auto_22004 ?auto_22005 ) ) ( not ( = ?auto_22001 ?auto_22006 ) ) ( not ( = ?auto_22005 ?auto_22008 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22004 ?auto_22001 ?auto_22002 ?auto_22003 )
      ( GET-3IMAGE-VERIFY ?auto_22002 ?auto_22003 ?auto_22004 ?auto_22001 ?auto_22005 ?auto_22006 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22131 - DIRECTION
      ?auto_22132 - MODE
      ?auto_22133 - DIRECTION
      ?auto_22130 - MODE
      ?auto_22134 - DIRECTION
      ?auto_22135 - MODE
    )
    :vars
    (
      ?auto_22136 - INSTRUMENT
      ?auto_22139 - SATELLITE
      ?auto_22137 - DIRECTION
      ?auto_22138 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_22136 ?auto_22139 ) ( SUPPORTS ?auto_22136 ?auto_22135 ) ( not ( = ?auto_22134 ?auto_22137 ) ) ( HAVE_IMAGE ?auto_22131 ?auto_22130 ) ( not ( = ?auto_22131 ?auto_22134 ) ) ( not ( = ?auto_22131 ?auto_22137 ) ) ( not ( = ?auto_22130 ?auto_22135 ) ) ( CALIBRATION_TARGET ?auto_22136 ?auto_22137 ) ( POINTING ?auto_22139 ?auto_22131 ) ( ON_BOARD ?auto_22138 ?auto_22139 ) ( POWER_ON ?auto_22138 ) ( not ( = ?auto_22136 ?auto_22138 ) ) ( HAVE_IMAGE ?auto_22131 ?auto_22132 ) ( HAVE_IMAGE ?auto_22133 ?auto_22130 ) ( not ( = ?auto_22131 ?auto_22133 ) ) ( not ( = ?auto_22132 ?auto_22130 ) ) ( not ( = ?auto_22132 ?auto_22135 ) ) ( not ( = ?auto_22133 ?auto_22134 ) ) ( not ( = ?auto_22133 ?auto_22137 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22131 ?auto_22130 ?auto_22134 ?auto_22135 )
      ( GET-3IMAGE-VERIFY ?auto_22131 ?auto_22132 ?auto_22133 ?auto_22130 ?auto_22134 ?auto_22135 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22151 - DIRECTION
      ?auto_22152 - MODE
      ?auto_22153 - DIRECTION
      ?auto_22150 - MODE
      ?auto_22154 - DIRECTION
      ?auto_22155 - MODE
    )
    :vars
    (
      ?auto_22156 - INSTRUMENT
      ?auto_22159 - SATELLITE
      ?auto_22157 - DIRECTION
      ?auto_22158 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_22156 ?auto_22159 ) ( SUPPORTS ?auto_22156 ?auto_22150 ) ( not ( = ?auto_22153 ?auto_22157 ) ) ( HAVE_IMAGE ?auto_22151 ?auto_22155 ) ( not ( = ?auto_22151 ?auto_22153 ) ) ( not ( = ?auto_22151 ?auto_22157 ) ) ( not ( = ?auto_22155 ?auto_22150 ) ) ( CALIBRATION_TARGET ?auto_22156 ?auto_22157 ) ( POINTING ?auto_22159 ?auto_22151 ) ( ON_BOARD ?auto_22158 ?auto_22159 ) ( POWER_ON ?auto_22158 ) ( not ( = ?auto_22156 ?auto_22158 ) ) ( HAVE_IMAGE ?auto_22151 ?auto_22152 ) ( HAVE_IMAGE ?auto_22154 ?auto_22155 ) ( not ( = ?auto_22151 ?auto_22154 ) ) ( not ( = ?auto_22152 ?auto_22150 ) ) ( not ( = ?auto_22152 ?auto_22155 ) ) ( not ( = ?auto_22153 ?auto_22154 ) ) ( not ( = ?auto_22154 ?auto_22157 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22151 ?auto_22155 ?auto_22153 ?auto_22150 )
      ( GET-3IMAGE-VERIFY ?auto_22151 ?auto_22152 ?auto_22153 ?auto_22150 ?auto_22154 ?auto_22155 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22237 - DIRECTION
      ?auto_22238 - MODE
      ?auto_22239 - DIRECTION
      ?auto_22236 - MODE
      ?auto_22240 - DIRECTION
      ?auto_22241 - MODE
    )
    :vars
    (
      ?auto_22242 - INSTRUMENT
      ?auto_22245 - SATELLITE
      ?auto_22243 - DIRECTION
      ?auto_22244 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_22242 ?auto_22245 ) ( SUPPORTS ?auto_22242 ?auto_22238 ) ( not ( = ?auto_22237 ?auto_22243 ) ) ( HAVE_IMAGE ?auto_22239 ?auto_22236 ) ( not ( = ?auto_22239 ?auto_22237 ) ) ( not ( = ?auto_22239 ?auto_22243 ) ) ( not ( = ?auto_22236 ?auto_22238 ) ) ( CALIBRATION_TARGET ?auto_22242 ?auto_22243 ) ( POINTING ?auto_22245 ?auto_22239 ) ( ON_BOARD ?auto_22244 ?auto_22245 ) ( POWER_ON ?auto_22244 ) ( not ( = ?auto_22242 ?auto_22244 ) ) ( HAVE_IMAGE ?auto_22240 ?auto_22241 ) ( not ( = ?auto_22237 ?auto_22240 ) ) ( not ( = ?auto_22238 ?auto_22241 ) ) ( not ( = ?auto_22239 ?auto_22240 ) ) ( not ( = ?auto_22236 ?auto_22241 ) ) ( not ( = ?auto_22240 ?auto_22243 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22239 ?auto_22236 ?auto_22237 ?auto_22238 )
      ( GET-3IMAGE-VERIFY ?auto_22237 ?auto_22238 ?auto_22239 ?auto_22236 ?auto_22240 ?auto_22241 ) )
  )

)

