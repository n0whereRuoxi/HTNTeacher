( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir980 - direction
    dir732 - direction
    dir674 - direction
    dir486 - direction
    dir511 - direction
    mode571 - mode
    inst571 - instrument
    mode670 - mode
    inst670 - instrument
    mode128 - mode
    inst128 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir980 )
    ( on_board inst571 sat000 )
    ( supports inst571 mode571 )
    ( calibration_target inst571 dir732 )
    ( not_calibrated inst571 )
    ( on_board inst670 sat000 )
    ( supports inst670 mode670 )
    ( calibration_target inst670 dir732 )
    ( not_calibrated inst670 )
    ( on_board inst128 sat000 )
    ( supports inst128 mode128 )
    ( calibration_target inst128 dir732 )
    ( not_calibrated inst128 )
  )
  ( :tasks
    ( Get-3Image dir674 mode571 dir486 mode670 dir511 mode128 )
  )
)
