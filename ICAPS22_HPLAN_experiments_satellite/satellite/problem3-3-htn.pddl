( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir562 - direction
    dir277 - direction
    dir927 - direction
    dir802 - direction
    dir440 - direction
    mode938 - mode
    inst938 - instrument
    mode608 - mode
    inst608 - instrument
    mode987 - mode
    inst987 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir562 )
    ( on_board inst938 sat000 )
    ( supports inst938 mode938 )
    ( calibration_target inst938 dir277 )
    ( not_calibrated inst938 )
    ( on_board inst608 sat000 )
    ( supports inst608 mode608 )
    ( calibration_target inst608 dir277 )
    ( not_calibrated inst608 )
    ( on_board inst987 sat000 )
    ( supports inst987 mode987 )
    ( calibration_target inst987 dir277 )
    ( not_calibrated inst987 )
  )
  ( :tasks
    ( Get-3Image dir927 mode938 dir802 mode608 dir440 mode987 )
  )
)
