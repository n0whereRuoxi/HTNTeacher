( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir177 - direction
    dir208 - direction
    dir13 - direction
    dir846 - direction
    dir806 - direction
    dir748 - direction
    dir844 - direction
    dir71 - direction
    dir245 - direction
    mode644 - mode
    inst644 - instrument
    mode388 - mode
    inst388 - instrument
    mode512 - mode
    inst512 - instrument
    mode135 - mode
    inst135 - instrument
    mode531 - mode
    inst531 - instrument
    mode930 - mode
    inst930 - instrument
    mode11 - mode
    inst11 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir177 )
    ( on_board inst644 sat000 )
    ( supports inst644 mode644 )
    ( calibration_target inst644 dir208 )
    ( not_calibrated inst644 )
    ( on_board inst388 sat000 )
    ( supports inst388 mode388 )
    ( calibration_target inst388 dir208 )
    ( not_calibrated inst388 )
    ( on_board inst512 sat000 )
    ( supports inst512 mode512 )
    ( calibration_target inst512 dir208 )
    ( not_calibrated inst512 )
    ( on_board inst135 sat000 )
    ( supports inst135 mode135 )
    ( calibration_target inst135 dir208 )
    ( not_calibrated inst135 )
    ( on_board inst531 sat000 )
    ( supports inst531 mode531 )
    ( calibration_target inst531 dir208 )
    ( not_calibrated inst531 )
    ( on_board inst930 sat000 )
    ( supports inst930 mode930 )
    ( calibration_target inst930 dir208 )
    ( not_calibrated inst930 )
    ( on_board inst11 sat000 )
    ( supports inst11 mode11 )
    ( calibration_target inst11 dir208 )
    ( not_calibrated inst11 )
  )
  ( :goal
    ( and
      ( have_image dir13 mode644 )
      ( have_image dir846 mode388 )
      ( have_image dir806 mode512 )
      ( have_image dir748 mode135 )
      ( have_image dir844 mode531 )
      ( have_image dir71 mode930 )
      ( have_image dir245 mode11 )
    )
  )
)
