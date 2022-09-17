( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir339 - direction
    dir362 - direction
    dir394 - direction
    dir503 - direction
    dir609 - direction
    dir722 - direction
    dir64 - direction
    dir393 - direction
    mode872 - mode
    inst872 - instrument
    mode486 - mode
    inst486 - instrument
    mode796 - mode
    inst796 - instrument
    mode756 - mode
    inst756 - instrument
    mode473 - mode
    inst473 - instrument
    mode722 - mode
    inst722 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir339 )
    ( on_board inst872 sat000 )
    ( supports inst872 mode872 )
    ( calibration_target inst872 dir362 )
    ( not_calibrated inst872 )
    ( on_board inst486 sat000 )
    ( supports inst486 mode486 )
    ( calibration_target inst486 dir362 )
    ( not_calibrated inst486 )
    ( on_board inst796 sat000 )
    ( supports inst796 mode796 )
    ( calibration_target inst796 dir362 )
    ( not_calibrated inst796 )
    ( on_board inst756 sat000 )
    ( supports inst756 mode756 )
    ( calibration_target inst756 dir362 )
    ( not_calibrated inst756 )
    ( on_board inst473 sat000 )
    ( supports inst473 mode473 )
    ( calibration_target inst473 dir362 )
    ( not_calibrated inst473 )
    ( on_board inst722 sat000 )
    ( supports inst722 mode722 )
    ( calibration_target inst722 dir362 )
    ( not_calibrated inst722 )
  )
  ( :tasks
    ( Get-6Image dir394 mode872 dir503 mode486 dir609 mode796 dir722 mode756 dir64 mode473 dir393 mode722 )
  )
)
