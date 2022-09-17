( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir872 - direction
    dir993 - direction
    dir331 - direction
    dir311 - direction
    dir516 - direction
    mode895 - mode
    inst895 - instrument
    mode210 - mode
    inst210 - instrument
    mode355 - mode
    inst355 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir872 )
    ( on_board inst895 sat000 )
    ( supports inst895 mode895 )
    ( calibration_target inst895 dir993 )
    ( not_calibrated inst895 )
    ( on_board inst210 sat000 )
    ( supports inst210 mode210 )
    ( calibration_target inst210 dir993 )
    ( not_calibrated inst210 )
    ( on_board inst355 sat000 )
    ( supports inst355 mode355 )
    ( calibration_target inst355 dir993 )
    ( not_calibrated inst355 )
  )
  ( :tasks
    ( Get-3Image dir331 mode895 dir311 mode210 dir516 mode355 )
  )
)
