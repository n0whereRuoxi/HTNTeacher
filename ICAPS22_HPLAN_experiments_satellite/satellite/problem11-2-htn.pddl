( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir87 - direction
    dir134 - direction
    dir634 - direction
    dir521 - direction
    dir155 - direction
    dir655 - direction
    dir62 - direction
    dir555 - direction
    dir641 - direction
    dir297 - direction
    dir734 - direction
    dir150 - direction
    dir504 - direction
    mode50 - mode
    inst50 - instrument
    mode241 - mode
    inst241 - instrument
    mode667 - mode
    inst667 - instrument
    mode155 - mode
    inst155 - instrument
    mode818 - mode
    inst818 - instrument
    mode877 - mode
    inst877 - instrument
    mode351 - mode
    inst351 - instrument
    mode646 - mode
    inst646 - instrument
    mode52 - mode
    inst52 - instrument
    mode126 - mode
    inst126 - instrument
    mode318 - mode
    inst318 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir87 )
    ( on_board inst50 sat000 )
    ( supports inst50 mode50 )
    ( calibration_target inst50 dir134 )
    ( not_calibrated inst50 )
    ( on_board inst241 sat000 )
    ( supports inst241 mode241 )
    ( calibration_target inst241 dir134 )
    ( not_calibrated inst241 )
    ( on_board inst667 sat000 )
    ( supports inst667 mode667 )
    ( calibration_target inst667 dir134 )
    ( not_calibrated inst667 )
    ( on_board inst155 sat000 )
    ( supports inst155 mode155 )
    ( calibration_target inst155 dir134 )
    ( not_calibrated inst155 )
    ( on_board inst818 sat000 )
    ( supports inst818 mode818 )
    ( calibration_target inst818 dir134 )
    ( not_calibrated inst818 )
    ( on_board inst877 sat000 )
    ( supports inst877 mode877 )
    ( calibration_target inst877 dir134 )
    ( not_calibrated inst877 )
    ( on_board inst351 sat000 )
    ( supports inst351 mode351 )
    ( calibration_target inst351 dir134 )
    ( not_calibrated inst351 )
    ( on_board inst646 sat000 )
    ( supports inst646 mode646 )
    ( calibration_target inst646 dir134 )
    ( not_calibrated inst646 )
    ( on_board inst52 sat000 )
    ( supports inst52 mode52 )
    ( calibration_target inst52 dir134 )
    ( not_calibrated inst52 )
    ( on_board inst126 sat000 )
    ( supports inst126 mode126 )
    ( calibration_target inst126 dir134 )
    ( not_calibrated inst126 )
    ( on_board inst318 sat000 )
    ( supports inst318 mode318 )
    ( calibration_target inst318 dir134 )
    ( not_calibrated inst318 )
  )
  ( :tasks
    ( Get-11Image dir634 mode50 dir521 mode241 dir155 mode667 dir655 mode155 dir62 mode818 dir555 mode877 dir641 mode351 dir297 mode646 dir734 mode52 dir150 mode126 dir504 mode318 )
  )
)
