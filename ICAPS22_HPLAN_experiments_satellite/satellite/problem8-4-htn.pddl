( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir303 - direction
    dir412 - direction
    dir838 - direction
    dir4 - direction
    dir748 - direction
    dir982 - direction
    dir996 - direction
    dir734 - direction
    dir913 - direction
    dir408 - direction
    mode578 - mode
    inst578 - instrument
    mode30 - mode
    inst30 - instrument
    mode998 - mode
    inst998 - instrument
    mode197 - mode
    inst197 - instrument
    mode301 - mode
    inst301 - instrument
    mode488 - mode
    inst488 - instrument
    mode160 - mode
    inst160 - instrument
    mode757 - mode
    inst757 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir303 )
    ( on_board inst578 sat000 )
    ( supports inst578 mode578 )
    ( calibration_target inst578 dir412 )
    ( not_calibrated inst578 )
    ( on_board inst30 sat000 )
    ( supports inst30 mode30 )
    ( calibration_target inst30 dir412 )
    ( not_calibrated inst30 )
    ( on_board inst998 sat000 )
    ( supports inst998 mode998 )
    ( calibration_target inst998 dir412 )
    ( not_calibrated inst998 )
    ( on_board inst197 sat000 )
    ( supports inst197 mode197 )
    ( calibration_target inst197 dir412 )
    ( not_calibrated inst197 )
    ( on_board inst301 sat000 )
    ( supports inst301 mode301 )
    ( calibration_target inst301 dir412 )
    ( not_calibrated inst301 )
    ( on_board inst488 sat000 )
    ( supports inst488 mode488 )
    ( calibration_target inst488 dir412 )
    ( not_calibrated inst488 )
    ( on_board inst160 sat000 )
    ( supports inst160 mode160 )
    ( calibration_target inst160 dir412 )
    ( not_calibrated inst160 )
    ( on_board inst757 sat000 )
    ( supports inst757 mode757 )
    ( calibration_target inst757 dir412 )
    ( not_calibrated inst757 )
  )
  ( :tasks
    ( Get-8Image dir838 mode578 dir4 mode30 dir748 mode998 dir982 mode197 dir996 mode301 dir734 mode488 dir913 mode160 dir408 mode757 )
  )
)
