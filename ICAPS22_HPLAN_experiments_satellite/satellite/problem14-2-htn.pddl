( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir730 - direction
    dir612 - direction
    dir162 - direction
    dir280 - direction
    dir541 - direction
    dir485 - direction
    dir504 - direction
    dir568 - direction
    dir729 - direction
    dir212 - direction
    dir706 - direction
    dir743 - direction
    dir444 - direction
    dir17 - direction
    dir592 - direction
    dir235 - direction
    mode894 - mode
    inst894 - instrument
    mode113 - mode
    inst113 - instrument
    mode745 - mode
    inst745 - instrument
    mode830 - mode
    inst830 - instrument
    mode783 - mode
    inst783 - instrument
    mode576 - mode
    inst576 - instrument
    mode338 - mode
    inst338 - instrument
    mode651 - mode
    inst651 - instrument
    mode414 - mode
    inst414 - instrument
    mode518 - mode
    inst518 - instrument
    mode421 - mode
    inst421 - instrument
    mode556 - mode
    inst556 - instrument
    mode907 - mode
    inst907 - instrument
    mode279 - mode
    inst279 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir730 )
    ( on_board inst894 sat000 )
    ( supports inst894 mode894 )
    ( calibration_target inst894 dir612 )
    ( not_calibrated inst894 )
    ( on_board inst113 sat000 )
    ( supports inst113 mode113 )
    ( calibration_target inst113 dir612 )
    ( not_calibrated inst113 )
    ( on_board inst745 sat000 )
    ( supports inst745 mode745 )
    ( calibration_target inst745 dir612 )
    ( not_calibrated inst745 )
    ( on_board inst830 sat000 )
    ( supports inst830 mode830 )
    ( calibration_target inst830 dir612 )
    ( not_calibrated inst830 )
    ( on_board inst783 sat000 )
    ( supports inst783 mode783 )
    ( calibration_target inst783 dir612 )
    ( not_calibrated inst783 )
    ( on_board inst576 sat000 )
    ( supports inst576 mode576 )
    ( calibration_target inst576 dir612 )
    ( not_calibrated inst576 )
    ( on_board inst338 sat000 )
    ( supports inst338 mode338 )
    ( calibration_target inst338 dir612 )
    ( not_calibrated inst338 )
    ( on_board inst651 sat000 )
    ( supports inst651 mode651 )
    ( calibration_target inst651 dir612 )
    ( not_calibrated inst651 )
    ( on_board inst414 sat000 )
    ( supports inst414 mode414 )
    ( calibration_target inst414 dir612 )
    ( not_calibrated inst414 )
    ( on_board inst518 sat000 )
    ( supports inst518 mode518 )
    ( calibration_target inst518 dir612 )
    ( not_calibrated inst518 )
    ( on_board inst421 sat000 )
    ( supports inst421 mode421 )
    ( calibration_target inst421 dir612 )
    ( not_calibrated inst421 )
    ( on_board inst556 sat000 )
    ( supports inst556 mode556 )
    ( calibration_target inst556 dir612 )
    ( not_calibrated inst556 )
    ( on_board inst907 sat000 )
    ( supports inst907 mode907 )
    ( calibration_target inst907 dir612 )
    ( not_calibrated inst907 )
    ( on_board inst279 sat000 )
    ( supports inst279 mode279 )
    ( calibration_target inst279 dir612 )
    ( not_calibrated inst279 )
  )
  ( :tasks
    ( Get-14Image dir162 mode894 dir280 mode113 dir541 mode745 dir485 mode830 dir504 mode783 dir568 mode576 dir729 mode338 dir212 mode651 dir706 mode414 dir743 mode518 dir444 mode421 dir17 mode556 dir592 mode907 dir235 mode279 )
  )
)
