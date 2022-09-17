( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir55 - direction
    dir181 - direction
    dir582 - direction
    mode644 - mode
    inst644 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir55 )
    ( on_board inst644 sat000 )
    ( supports inst644 mode644 )
    ( calibration_target inst644 dir181 )
    ( not_calibrated inst644 )
  )
  ( :tasks
    ( Get-1Image dir582 mode644 )
  )
)
