( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir821 - direction
    dir822 - direction
    dir647 - direction
    dir609 - direction
    dir716 - direction
    dir529 - direction
    dir585 - direction
    dir478 - direction
    dir914 - direction
    dir152 - direction
    dir161 - direction
    dir187 - direction
    dir566 - direction
    dir410 - direction
    mode423 - mode
    inst423 - instrument
    mode167 - mode
    inst167 - instrument
    mode635 - mode
    inst635 - instrument
    mode946 - mode
    inst946 - instrument
    mode812 - mode
    inst812 - instrument
    mode208 - mode
    inst208 - instrument
    mode896 - mode
    inst896 - instrument
    mode250 - mode
    inst250 - instrument
    mode357 - mode
    inst357 - instrument
    mode253 - mode
    inst253 - instrument
    mode861 - mode
    inst861 - instrument
    mode33 - mode
    inst33 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir821 )
    ( on_board inst423 sat000 )
    ( supports inst423 mode423 )
    ( calibration_target inst423 dir822 )
    ( not_calibrated inst423 )
    ( on_board inst167 sat000 )
    ( supports inst167 mode167 )
    ( calibration_target inst167 dir822 )
    ( not_calibrated inst167 )
    ( on_board inst635 sat000 )
    ( supports inst635 mode635 )
    ( calibration_target inst635 dir822 )
    ( not_calibrated inst635 )
    ( on_board inst946 sat000 )
    ( supports inst946 mode946 )
    ( calibration_target inst946 dir822 )
    ( not_calibrated inst946 )
    ( on_board inst812 sat000 )
    ( supports inst812 mode812 )
    ( calibration_target inst812 dir822 )
    ( not_calibrated inst812 )
    ( on_board inst208 sat000 )
    ( supports inst208 mode208 )
    ( calibration_target inst208 dir822 )
    ( not_calibrated inst208 )
    ( on_board inst896 sat000 )
    ( supports inst896 mode896 )
    ( calibration_target inst896 dir822 )
    ( not_calibrated inst896 )
    ( on_board inst250 sat000 )
    ( supports inst250 mode250 )
    ( calibration_target inst250 dir822 )
    ( not_calibrated inst250 )
    ( on_board inst357 sat000 )
    ( supports inst357 mode357 )
    ( calibration_target inst357 dir822 )
    ( not_calibrated inst357 )
    ( on_board inst253 sat000 )
    ( supports inst253 mode253 )
    ( calibration_target inst253 dir822 )
    ( not_calibrated inst253 )
    ( on_board inst861 sat000 )
    ( supports inst861 mode861 )
    ( calibration_target inst861 dir822 )
    ( not_calibrated inst861 )
    ( on_board inst33 sat000 )
    ( supports inst33 mode33 )
    ( calibration_target inst33 dir822 )
    ( not_calibrated inst33 )
  )
  ( :goal
    ( and
      ( have_image dir647 mode423 )
      ( have_image dir609 mode167 )
      ( have_image dir716 mode635 )
      ( have_image dir529 mode946 )
      ( have_image dir585 mode812 )
      ( have_image dir478 mode208 )
      ( have_image dir914 mode896 )
      ( have_image dir152 mode250 )
      ( have_image dir161 mode357 )
      ( have_image dir187 mode253 )
      ( have_image dir566 mode861 )
      ( have_image dir410 mode33 )
    )
  )
)
