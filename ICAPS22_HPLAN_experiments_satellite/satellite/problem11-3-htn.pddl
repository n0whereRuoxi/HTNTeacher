( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir135 - direction
    dir453 - direction
    dir94 - direction
    dir622 - direction
    dir233 - direction
    dir213 - direction
    dir957 - direction
    dir393 - direction
    dir547 - direction
    dir525 - direction
    dir599 - direction
    dir691 - direction
    dir101 - direction
    mode572 - mode
    inst572 - instrument
    mode443 - mode
    inst443 - instrument
    mode92 - mode
    inst92 - instrument
    mode661 - mode
    inst661 - instrument
    mode691 - mode
    inst691 - instrument
    mode80 - mode
    inst80 - instrument
    mode71 - mode
    inst71 - instrument
    mode540 - mode
    inst540 - instrument
    mode645 - mode
    inst645 - instrument
    mode60 - mode
    inst60 - instrument
    mode490 - mode
    inst490 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir135 )
    ( on_board inst572 sat000 )
    ( supports inst572 mode572 )
    ( calibration_target inst572 dir453 )
    ( not_calibrated inst572 )
    ( on_board inst443 sat000 )
    ( supports inst443 mode443 )
    ( calibration_target inst443 dir453 )
    ( not_calibrated inst443 )
    ( on_board inst92 sat000 )
    ( supports inst92 mode92 )
    ( calibration_target inst92 dir453 )
    ( not_calibrated inst92 )
    ( on_board inst661 sat000 )
    ( supports inst661 mode661 )
    ( calibration_target inst661 dir453 )
    ( not_calibrated inst661 )
    ( on_board inst691 sat000 )
    ( supports inst691 mode691 )
    ( calibration_target inst691 dir453 )
    ( not_calibrated inst691 )
    ( on_board inst80 sat000 )
    ( supports inst80 mode80 )
    ( calibration_target inst80 dir453 )
    ( not_calibrated inst80 )
    ( on_board inst71 sat000 )
    ( supports inst71 mode71 )
    ( calibration_target inst71 dir453 )
    ( not_calibrated inst71 )
    ( on_board inst540 sat000 )
    ( supports inst540 mode540 )
    ( calibration_target inst540 dir453 )
    ( not_calibrated inst540 )
    ( on_board inst645 sat000 )
    ( supports inst645 mode645 )
    ( calibration_target inst645 dir453 )
    ( not_calibrated inst645 )
    ( on_board inst60 sat000 )
    ( supports inst60 mode60 )
    ( calibration_target inst60 dir453 )
    ( not_calibrated inst60 )
    ( on_board inst490 sat000 )
    ( supports inst490 mode490 )
    ( calibration_target inst490 dir453 )
    ( not_calibrated inst490 )
  )
  ( :tasks
    ( Get-11Image dir94 mode572 dir622 mode443 dir233 mode92 dir213 mode661 dir957 mode691 dir393 mode80 dir547 mode71 dir525 mode540 dir599 mode645 dir691 mode60 dir101 mode490 )
  )
)
