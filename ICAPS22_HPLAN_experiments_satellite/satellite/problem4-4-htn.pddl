( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir223 - direction
    dir454 - direction
    dir590 - direction
    dir807 - direction
    dir896 - direction
    dir925 - direction
    mode119 - mode
    inst119 - instrument
    mode903 - mode
    inst903 - instrument
    mode541 - mode
    inst541 - instrument
    mode854 - mode
    inst854 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir223 )
    ( on_board inst119 sat000 )
    ( supports inst119 mode119 )
    ( calibration_target inst119 dir454 )
    ( not_calibrated inst119 )
    ( on_board inst903 sat000 )
    ( supports inst903 mode903 )
    ( calibration_target inst903 dir454 )
    ( not_calibrated inst903 )
    ( on_board inst541 sat000 )
    ( supports inst541 mode541 )
    ( calibration_target inst541 dir454 )
    ( not_calibrated inst541 )
    ( on_board inst854 sat000 )
    ( supports inst854 mode854 )
    ( calibration_target inst854 dir454 )
    ( not_calibrated inst854 )
  )
  ( :tasks
    ( Get-4Image dir590 mode119 dir807 mode903 dir896 mode541 dir925 mode854 )
  )
)
