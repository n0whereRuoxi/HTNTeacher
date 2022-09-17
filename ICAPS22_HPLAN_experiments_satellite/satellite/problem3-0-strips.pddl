( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir884 - direction
    dir130 - direction
    dir199 - direction
    dir768 - direction
    dir797 - direction
    mode734 - mode
    inst734 - instrument
    mode377 - mode
    inst377 - instrument
    mode402 - mode
    inst402 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir884 )
    ( on_board inst734 sat000 )
    ( supports inst734 mode734 )
    ( calibration_target inst734 dir130 )
    ( not_calibrated inst734 )
    ( on_board inst377 sat000 )
    ( supports inst377 mode377 )
    ( calibration_target inst377 dir130 )
    ( not_calibrated inst377 )
    ( on_board inst402 sat000 )
    ( supports inst402 mode402 )
    ( calibration_target inst402 dir130 )
    ( not_calibrated inst402 )
  )
  ( :goal
    ( and
      ( have_image dir199 mode734 )
      ( have_image dir768 mode377 )
      ( have_image dir797 mode402 )
    )
  )
)
