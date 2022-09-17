( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir90 - direction
    dir994 - direction
    dir662 - direction
    dir671 - direction
    mode136 - mode
    inst136 - instrument
    mode781 - mode
    inst781 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir90 )
    ( on_board inst136 sat000 )
    ( supports inst136 mode136 )
    ( calibration_target inst136 dir994 )
    ( not_calibrated inst136 )
    ( on_board inst781 sat000 )
    ( supports inst781 mode781 )
    ( calibration_target inst781 dir994 )
    ( not_calibrated inst781 )
  )
  ( :tasks
    ( Get-2Image dir662 mode136 dir671 mode781 )
  )
)
