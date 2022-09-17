( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir438 - direction
    dir165 - direction
    dir248 - direction
    mode587 - mode
    inst587 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir438 )
    ( on_board inst587 sat000 )
    ( supports inst587 mode587 )
    ( calibration_target inst587 dir165 )
    ( not_calibrated inst587 )
  )
  ( :tasks
    ( Get-1Image dir248 mode587 )
  )
)
