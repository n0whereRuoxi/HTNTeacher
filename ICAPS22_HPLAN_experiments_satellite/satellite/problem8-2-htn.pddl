( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir140 - direction
    dir129 - direction
    dir203 - direction
    dir43 - direction
    dir874 - direction
    dir55 - direction
    dir333 - direction
    dir204 - direction
    dir731 - direction
    dir699 - direction
    mode128 - mode
    inst128 - instrument
    mode577 - mode
    inst577 - instrument
    mode750 - mode
    inst750 - instrument
    mode77 - mode
    inst77 - instrument
    mode760 - mode
    inst760 - instrument
    mode428 - mode
    inst428 - instrument
    mode109 - mode
    inst109 - instrument
    mode903 - mode
    inst903 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir140 )
    ( on_board inst128 sat000 )
    ( supports inst128 mode128 )
    ( calibration_target inst128 dir129 )
    ( not_calibrated inst128 )
    ( on_board inst577 sat000 )
    ( supports inst577 mode577 )
    ( calibration_target inst577 dir129 )
    ( not_calibrated inst577 )
    ( on_board inst750 sat000 )
    ( supports inst750 mode750 )
    ( calibration_target inst750 dir129 )
    ( not_calibrated inst750 )
    ( on_board inst77 sat000 )
    ( supports inst77 mode77 )
    ( calibration_target inst77 dir129 )
    ( not_calibrated inst77 )
    ( on_board inst760 sat000 )
    ( supports inst760 mode760 )
    ( calibration_target inst760 dir129 )
    ( not_calibrated inst760 )
    ( on_board inst428 sat000 )
    ( supports inst428 mode428 )
    ( calibration_target inst428 dir129 )
    ( not_calibrated inst428 )
    ( on_board inst109 sat000 )
    ( supports inst109 mode109 )
    ( calibration_target inst109 dir129 )
    ( not_calibrated inst109 )
    ( on_board inst903 sat000 )
    ( supports inst903 mode903 )
    ( calibration_target inst903 dir129 )
    ( not_calibrated inst903 )
  )
  ( :tasks
    ( Get-8Image dir203 mode128 dir43 mode577 dir874 mode750 dir55 mode77 dir333 mode760 dir204 mode428 dir731 mode109 dir699 mode903 )
  )
)
