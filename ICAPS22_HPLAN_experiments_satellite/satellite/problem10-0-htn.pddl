( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir548 - direction
    dir678 - direction
    dir425 - direction
    dir999 - direction
    dir253 - direction
    dir517 - direction
    dir859 - direction
    dir585 - direction
    dir439 - direction
    dir56 - direction
    dir907 - direction
    dir941 - direction
    mode714 - mode
    inst714 - instrument
    mode408 - mode
    inst408 - instrument
    mode838 - mode
    inst838 - instrument
    mode562 - mode
    inst562 - instrument
    mode67 - mode
    inst67 - instrument
    mode212 - mode
    inst212 - instrument
    mode832 - mode
    inst832 - instrument
    mode549 - mode
    inst549 - instrument
    mode622 - mode
    inst622 - instrument
    mode12 - mode
    inst12 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir548 )
    ( on_board inst714 sat000 )
    ( supports inst714 mode714 )
    ( calibration_target inst714 dir678 )
    ( not_calibrated inst714 )
    ( on_board inst408 sat000 )
    ( supports inst408 mode408 )
    ( calibration_target inst408 dir678 )
    ( not_calibrated inst408 )
    ( on_board inst838 sat000 )
    ( supports inst838 mode838 )
    ( calibration_target inst838 dir678 )
    ( not_calibrated inst838 )
    ( on_board inst562 sat000 )
    ( supports inst562 mode562 )
    ( calibration_target inst562 dir678 )
    ( not_calibrated inst562 )
    ( on_board inst67 sat000 )
    ( supports inst67 mode67 )
    ( calibration_target inst67 dir678 )
    ( not_calibrated inst67 )
    ( on_board inst212 sat000 )
    ( supports inst212 mode212 )
    ( calibration_target inst212 dir678 )
    ( not_calibrated inst212 )
    ( on_board inst832 sat000 )
    ( supports inst832 mode832 )
    ( calibration_target inst832 dir678 )
    ( not_calibrated inst832 )
    ( on_board inst549 sat000 )
    ( supports inst549 mode549 )
    ( calibration_target inst549 dir678 )
    ( not_calibrated inst549 )
    ( on_board inst622 sat000 )
    ( supports inst622 mode622 )
    ( calibration_target inst622 dir678 )
    ( not_calibrated inst622 )
    ( on_board inst12 sat000 )
    ( supports inst12 mode12 )
    ( calibration_target inst12 dir678 )
    ( not_calibrated inst12 )
  )
  ( :tasks
    ( Get-10Image dir425 mode714 dir999 mode408 dir253 mode838 dir517 mode562 dir859 mode67 dir585 mode212 dir439 mode832 dir56 mode549 dir907 mode622 dir941 mode12 )
  )
)
