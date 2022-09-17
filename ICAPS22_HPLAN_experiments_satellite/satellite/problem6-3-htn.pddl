( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir625 - direction
    dir154 - direction
    dir677 - direction
    dir498 - direction
    dir396 - direction
    dir394 - direction
    dir378 - direction
    dir160 - direction
    mode43 - mode
    inst43 - instrument
    mode429 - mode
    inst429 - instrument
    mode49 - mode
    inst49 - instrument
    mode492 - mode
    inst492 - instrument
    mode519 - mode
    inst519 - instrument
    mode549 - mode
    inst549 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir625 )
    ( on_board inst43 sat000 )
    ( supports inst43 mode43 )
    ( calibration_target inst43 dir154 )
    ( not_calibrated inst43 )
    ( on_board inst429 sat000 )
    ( supports inst429 mode429 )
    ( calibration_target inst429 dir154 )
    ( not_calibrated inst429 )
    ( on_board inst49 sat000 )
    ( supports inst49 mode49 )
    ( calibration_target inst49 dir154 )
    ( not_calibrated inst49 )
    ( on_board inst492 sat000 )
    ( supports inst492 mode492 )
    ( calibration_target inst492 dir154 )
    ( not_calibrated inst492 )
    ( on_board inst519 sat000 )
    ( supports inst519 mode519 )
    ( calibration_target inst519 dir154 )
    ( not_calibrated inst519 )
    ( on_board inst549 sat000 )
    ( supports inst549 mode549 )
    ( calibration_target inst549 dir154 )
    ( not_calibrated inst549 )
  )
  ( :tasks
    ( Get-6Image dir677 mode43 dir498 mode429 dir396 mode49 dir394 mode492 dir378 mode519 dir160 mode549 )
  )
)
