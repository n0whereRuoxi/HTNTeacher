( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir565 - direction
    dir688 - direction
    dir695 - direction
    mode628 - mode
    inst628 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir565 )
    ( on_board inst628 sat000 )
    ( supports inst628 mode628 )
    ( calibration_target inst628 dir688 )
    ( not_calibrated inst628 )
  )
  ( :tasks
    ( Get-1Image dir695 mode628 )
  )
)
