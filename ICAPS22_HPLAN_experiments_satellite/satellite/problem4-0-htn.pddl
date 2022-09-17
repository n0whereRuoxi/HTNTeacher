( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir392 - direction
    dir80 - direction
    dir542 - direction
    dir33 - direction
    dir704 - direction
    dir186 - direction
    mode101 - mode
    inst101 - instrument
    mode393 - mode
    inst393 - instrument
    mode92 - mode
    inst92 - instrument
    mode382 - mode
    inst382 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir392 )
    ( on_board inst101 sat000 )
    ( supports inst101 mode101 )
    ( calibration_target inst101 dir80 )
    ( not_calibrated inst101 )
    ( on_board inst393 sat000 )
    ( supports inst393 mode393 )
    ( calibration_target inst393 dir80 )
    ( not_calibrated inst393 )
    ( on_board inst92 sat000 )
    ( supports inst92 mode92 )
    ( calibration_target inst92 dir80 )
    ( not_calibrated inst92 )
    ( on_board inst382 sat000 )
    ( supports inst382 mode382 )
    ( calibration_target inst382 dir80 )
    ( not_calibrated inst382 )
  )
  ( :tasks
    ( Get-4Image dir542 mode101 dir33 mode393 dir704 mode92 dir186 mode382 )
  )
)
