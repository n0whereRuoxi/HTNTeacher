( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir305 - direction
    dir16 - direction
    dir513 - direction
    dir91 - direction
    dir5 - direction
    dir406 - direction
    dir157 - direction
    dir449 - direction
    dir419 - direction
    dir297 - direction
    dir21 - direction
    dir549 - direction
    dir528 - direction
    dir591 - direction
    dir781 - direction
    dir6 - direction
    mode547 - mode
    inst547 - instrument
    mode324 - mode
    inst324 - instrument
    mode497 - mode
    inst497 - instrument
    mode26 - mode
    inst26 - instrument
    mode62 - mode
    inst62 - instrument
    mode946 - mode
    inst946 - instrument
    mode403 - mode
    inst403 - instrument
    mode526 - mode
    inst526 - instrument
    mode631 - mode
    inst631 - instrument
    mode696 - mode
    inst696 - instrument
    mode585 - mode
    inst585 - instrument
    mode854 - mode
    inst854 - instrument
    mode290 - mode
    inst290 - instrument
    mode757 - mode
    inst757 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir305 )
    ( on_board inst547 sat000 )
    ( supports inst547 mode547 )
    ( calibration_target inst547 dir16 )
    ( not_calibrated inst547 )
    ( on_board inst324 sat000 )
    ( supports inst324 mode324 )
    ( calibration_target inst324 dir16 )
    ( not_calibrated inst324 )
    ( on_board inst497 sat000 )
    ( supports inst497 mode497 )
    ( calibration_target inst497 dir16 )
    ( not_calibrated inst497 )
    ( on_board inst26 sat000 )
    ( supports inst26 mode26 )
    ( calibration_target inst26 dir16 )
    ( not_calibrated inst26 )
    ( on_board inst62 sat000 )
    ( supports inst62 mode62 )
    ( calibration_target inst62 dir16 )
    ( not_calibrated inst62 )
    ( on_board inst946 sat000 )
    ( supports inst946 mode946 )
    ( calibration_target inst946 dir16 )
    ( not_calibrated inst946 )
    ( on_board inst403 sat000 )
    ( supports inst403 mode403 )
    ( calibration_target inst403 dir16 )
    ( not_calibrated inst403 )
    ( on_board inst526 sat000 )
    ( supports inst526 mode526 )
    ( calibration_target inst526 dir16 )
    ( not_calibrated inst526 )
    ( on_board inst631 sat000 )
    ( supports inst631 mode631 )
    ( calibration_target inst631 dir16 )
    ( not_calibrated inst631 )
    ( on_board inst696 sat000 )
    ( supports inst696 mode696 )
    ( calibration_target inst696 dir16 )
    ( not_calibrated inst696 )
    ( on_board inst585 sat000 )
    ( supports inst585 mode585 )
    ( calibration_target inst585 dir16 )
    ( not_calibrated inst585 )
    ( on_board inst854 sat000 )
    ( supports inst854 mode854 )
    ( calibration_target inst854 dir16 )
    ( not_calibrated inst854 )
    ( on_board inst290 sat000 )
    ( supports inst290 mode290 )
    ( calibration_target inst290 dir16 )
    ( not_calibrated inst290 )
    ( on_board inst757 sat000 )
    ( supports inst757 mode757 )
    ( calibration_target inst757 dir16 )
    ( not_calibrated inst757 )
  )
  ( :tasks
    ( Get-14Image dir513 mode547 dir91 mode324 dir5 mode497 dir406 mode26 dir157 mode62 dir449 mode946 dir419 mode403 dir297 mode526 dir21 mode631 dir549 mode696 dir528 mode585 dir591 mode854 dir781 mode290 dir6 mode757 )
  )
)
