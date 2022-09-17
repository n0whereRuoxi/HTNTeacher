( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir423 - direction
    dir306 - direction
    dir640 - direction
    dir494 - direction
    dir149 - direction
    mode289 - mode
    inst289 - instrument
    mode572 - mode
    inst572 - instrument
    mode632 - mode
    inst632 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir423 )
    ( on_board inst289 sat000 )
    ( supports inst289 mode289 )
    ( calibration_target inst289 dir306 )
    ( not_calibrated inst289 )
    ( on_board inst572 sat000 )
    ( supports inst572 mode572 )
    ( calibration_target inst572 dir306 )
    ( not_calibrated inst572 )
    ( on_board inst632 sat000 )
    ( supports inst632 mode632 )
    ( calibration_target inst632 dir306 )
    ( not_calibrated inst632 )
  )
  ( :goal
    ( and
      ( have_image dir640 mode289 )
      ( have_image dir494 mode572 )
      ( have_image dir149 mode632 )
    )
  )
)
