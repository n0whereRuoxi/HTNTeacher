( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir38 - direction
    dir759 - direction
    dir882 - direction
    dir886 - direction
    mode802 - mode
    inst802 - instrument
    mode691 - mode
    inst691 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir38 )
    ( on_board inst802 sat000 )
    ( supports inst802 mode802 )
    ( calibration_target inst802 dir759 )
    ( not_calibrated inst802 )
    ( on_board inst691 sat000 )
    ( supports inst691 mode691 )
    ( calibration_target inst691 dir759 )
    ( not_calibrated inst691 )
  )
  ( :tasks
    ( Get-2Image dir882 mode802 dir886 mode691 )
  )
)
