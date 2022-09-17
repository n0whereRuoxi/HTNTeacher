( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir253 - direction
    dir565 - direction
    dir815 - direction
    dir134 - direction
    dir137 - direction
    dir745 - direction
    dir655 - direction
    dir493 - direction
    dir623 - direction
    dir119 - direction
    dir558 - direction
    mode895 - mode
    inst895 - instrument
    mode358 - mode
    inst358 - instrument
    mode948 - mode
    inst948 - instrument
    mode768 - mode
    inst768 - instrument
    mode492 - mode
    inst492 - instrument
    mode607 - mode
    inst607 - instrument
    mode250 - mode
    inst250 - instrument
    mode880 - mode
    inst880 - instrument
    mode801 - mode
    inst801 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir253 )
    ( on_board inst895 sat000 )
    ( supports inst895 mode895 )
    ( calibration_target inst895 dir565 )
    ( not_calibrated inst895 )
    ( on_board inst358 sat000 )
    ( supports inst358 mode358 )
    ( calibration_target inst358 dir565 )
    ( not_calibrated inst358 )
    ( on_board inst948 sat000 )
    ( supports inst948 mode948 )
    ( calibration_target inst948 dir565 )
    ( not_calibrated inst948 )
    ( on_board inst768 sat000 )
    ( supports inst768 mode768 )
    ( calibration_target inst768 dir565 )
    ( not_calibrated inst768 )
    ( on_board inst492 sat000 )
    ( supports inst492 mode492 )
    ( calibration_target inst492 dir565 )
    ( not_calibrated inst492 )
    ( on_board inst607 sat000 )
    ( supports inst607 mode607 )
    ( calibration_target inst607 dir565 )
    ( not_calibrated inst607 )
    ( on_board inst250 sat000 )
    ( supports inst250 mode250 )
    ( calibration_target inst250 dir565 )
    ( not_calibrated inst250 )
    ( on_board inst880 sat000 )
    ( supports inst880 mode880 )
    ( calibration_target inst880 dir565 )
    ( not_calibrated inst880 )
    ( on_board inst801 sat000 )
    ( supports inst801 mode801 )
    ( calibration_target inst801 dir565 )
    ( not_calibrated inst801 )
  )
  ( :goal
    ( and
      ( have_image dir815 mode895 )
      ( have_image dir134 mode358 )
      ( have_image dir137 mode948 )
      ( have_image dir745 mode768 )
      ( have_image dir655 mode492 )
      ( have_image dir493 mode607 )
      ( have_image dir623 mode250 )
      ( have_image dir119 mode880 )
      ( have_image dir558 mode801 )
    )
  )
)
