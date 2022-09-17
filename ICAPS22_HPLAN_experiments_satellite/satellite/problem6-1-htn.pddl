( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir372 - direction
    dir18 - direction
    dir918 - direction
    dir150 - direction
    dir482 - direction
    dir456 - direction
    dir394 - direction
    dir508 - direction
    mode973 - mode
    inst973 - instrument
    mode280 - mode
    inst280 - instrument
    mode60 - mode
    inst60 - instrument
    mode660 - mode
    inst660 - instrument
    mode215 - mode
    inst215 - instrument
    mode613 - mode
    inst613 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir372 )
    ( on_board inst973 sat000 )
    ( supports inst973 mode973 )
    ( calibration_target inst973 dir18 )
    ( not_calibrated inst973 )
    ( on_board inst280 sat000 )
    ( supports inst280 mode280 )
    ( calibration_target inst280 dir18 )
    ( not_calibrated inst280 )
    ( on_board inst60 sat000 )
    ( supports inst60 mode60 )
    ( calibration_target inst60 dir18 )
    ( not_calibrated inst60 )
    ( on_board inst660 sat000 )
    ( supports inst660 mode660 )
    ( calibration_target inst660 dir18 )
    ( not_calibrated inst660 )
    ( on_board inst215 sat000 )
    ( supports inst215 mode215 )
    ( calibration_target inst215 dir18 )
    ( not_calibrated inst215 )
    ( on_board inst613 sat000 )
    ( supports inst613 mode613 )
    ( calibration_target inst613 dir18 )
    ( not_calibrated inst613 )
  )
  ( :tasks
    ( Get-6Image dir918 mode973 dir150 mode280 dir482 mode60 dir456 mode660 dir394 mode215 dir508 mode613 )
  )
)
