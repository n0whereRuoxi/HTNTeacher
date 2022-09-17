( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir244 - direction
    dir560 - direction
    dir307 - direction
    dir643 - direction
    dir996 - direction
    dir192 - direction
    dir428 - direction
    dir546 - direction
    dir746 - direction
    mode438 - mode
    inst438 - instrument
    mode190 - mode
    inst190 - instrument
    mode297 - mode
    inst297 - instrument
    mode383 - mode
    inst383 - instrument
    mode991 - mode
    inst991 - instrument
    mode347 - mode
    inst347 - instrument
    mode573 - mode
    inst573 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir244 )
    ( on_board inst438 sat000 )
    ( supports inst438 mode438 )
    ( calibration_target inst438 dir560 )
    ( not_calibrated inst438 )
    ( on_board inst190 sat000 )
    ( supports inst190 mode190 )
    ( calibration_target inst190 dir560 )
    ( not_calibrated inst190 )
    ( on_board inst297 sat000 )
    ( supports inst297 mode297 )
    ( calibration_target inst297 dir560 )
    ( not_calibrated inst297 )
    ( on_board inst383 sat000 )
    ( supports inst383 mode383 )
    ( calibration_target inst383 dir560 )
    ( not_calibrated inst383 )
    ( on_board inst991 sat000 )
    ( supports inst991 mode991 )
    ( calibration_target inst991 dir560 )
    ( not_calibrated inst991 )
    ( on_board inst347 sat000 )
    ( supports inst347 mode347 )
    ( calibration_target inst347 dir560 )
    ( not_calibrated inst347 )
    ( on_board inst573 sat000 )
    ( supports inst573 mode573 )
    ( calibration_target inst573 dir560 )
    ( not_calibrated inst573 )
  )
  ( :tasks
    ( Get-7Image dir307 mode438 dir643 mode190 dir996 mode297 dir192 mode383 dir428 mode991 dir546 mode347 dir746 mode573 )
  )
)
