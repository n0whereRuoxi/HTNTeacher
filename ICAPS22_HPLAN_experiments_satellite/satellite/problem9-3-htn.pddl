( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir689 - direction
    dir632 - direction
    dir531 - direction
    dir944 - direction
    dir887 - direction
    dir986 - direction
    dir571 - direction
    dir651 - direction
    dir311 - direction
    dir911 - direction
    dir833 - direction
    mode392 - mode
    inst392 - instrument
    mode830 - mode
    inst830 - instrument
    mode527 - mode
    inst527 - instrument
    mode926 - mode
    inst926 - instrument
    mode89 - mode
    inst89 - instrument
    mode187 - mode
    inst187 - instrument
    mode379 - mode
    inst379 - instrument
    mode850 - mode
    inst850 - instrument
    mode281 - mode
    inst281 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir689 )
    ( on_board inst392 sat000 )
    ( supports inst392 mode392 )
    ( calibration_target inst392 dir632 )
    ( not_calibrated inst392 )
    ( on_board inst830 sat000 )
    ( supports inst830 mode830 )
    ( calibration_target inst830 dir632 )
    ( not_calibrated inst830 )
    ( on_board inst527 sat000 )
    ( supports inst527 mode527 )
    ( calibration_target inst527 dir632 )
    ( not_calibrated inst527 )
    ( on_board inst926 sat000 )
    ( supports inst926 mode926 )
    ( calibration_target inst926 dir632 )
    ( not_calibrated inst926 )
    ( on_board inst89 sat000 )
    ( supports inst89 mode89 )
    ( calibration_target inst89 dir632 )
    ( not_calibrated inst89 )
    ( on_board inst187 sat000 )
    ( supports inst187 mode187 )
    ( calibration_target inst187 dir632 )
    ( not_calibrated inst187 )
    ( on_board inst379 sat000 )
    ( supports inst379 mode379 )
    ( calibration_target inst379 dir632 )
    ( not_calibrated inst379 )
    ( on_board inst850 sat000 )
    ( supports inst850 mode850 )
    ( calibration_target inst850 dir632 )
    ( not_calibrated inst850 )
    ( on_board inst281 sat000 )
    ( supports inst281 mode281 )
    ( calibration_target inst281 dir632 )
    ( not_calibrated inst281 )
  )
  ( :tasks
    ( Get-9Image dir531 mode392 dir944 mode830 dir887 mode527 dir986 mode926 dir571 mode89 dir651 mode187 dir311 mode379 dir911 mode850 dir833 mode281 )
  )
)
