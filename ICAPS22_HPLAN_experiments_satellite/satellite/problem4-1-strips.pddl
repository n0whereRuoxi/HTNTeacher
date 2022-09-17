( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir27 - direction
    dir630 - direction
    dir333 - direction
    dir688 - direction
    dir377 - direction
    dir512 - direction
    mode822 - mode
    inst822 - instrument
    mode480 - mode
    inst480 - instrument
    mode40 - mode
    inst40 - instrument
    mode742 - mode
    inst742 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir27 )
    ( on_board inst822 sat000 )
    ( supports inst822 mode822 )
    ( calibration_target inst822 dir630 )
    ( not_calibrated inst822 )
    ( on_board inst480 sat000 )
    ( supports inst480 mode480 )
    ( calibration_target inst480 dir630 )
    ( not_calibrated inst480 )
    ( on_board inst40 sat000 )
    ( supports inst40 mode40 )
    ( calibration_target inst40 dir630 )
    ( not_calibrated inst40 )
    ( on_board inst742 sat000 )
    ( supports inst742 mode742 )
    ( calibration_target inst742 dir630 )
    ( not_calibrated inst742 )
  )
  ( :goal
    ( and
      ( have_image dir333 mode822 )
      ( have_image dir688 mode480 )
      ( have_image dir377 mode40 )
      ( have_image dir512 mode742 )
    )
  )
)
