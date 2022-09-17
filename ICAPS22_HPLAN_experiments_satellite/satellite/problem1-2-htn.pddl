( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir798 - direction
    dir596 - direction
    dir264 - direction
    mode321 - mode
    inst321 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir798 )
    ( on_board inst321 sat000 )
    ( supports inst321 mode321 )
    ( calibration_target inst321 dir596 )
    ( not_calibrated inst321 )
  )
  ( :tasks
    ( Get-1Image dir264 mode321 )
  )
)
