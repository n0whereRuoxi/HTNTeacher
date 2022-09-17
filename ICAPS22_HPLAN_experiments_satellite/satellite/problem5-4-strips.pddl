( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir903 - direction
    dir939 - direction
    dir509 - direction
    dir455 - direction
    dir954 - direction
    dir9 - direction
    dir108 - direction
    mode558 - mode
    inst558 - instrument
    mode147 - mode
    inst147 - instrument
    mode763 - mode
    inst763 - instrument
    mode6 - mode
    inst6 - instrument
    mode968 - mode
    inst968 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir903 )
    ( on_board inst558 sat000 )
    ( supports inst558 mode558 )
    ( calibration_target inst558 dir939 )
    ( not_calibrated inst558 )
    ( on_board inst147 sat000 )
    ( supports inst147 mode147 )
    ( calibration_target inst147 dir939 )
    ( not_calibrated inst147 )
    ( on_board inst763 sat000 )
    ( supports inst763 mode763 )
    ( calibration_target inst763 dir939 )
    ( not_calibrated inst763 )
    ( on_board inst6 sat000 )
    ( supports inst6 mode6 )
    ( calibration_target inst6 dir939 )
    ( not_calibrated inst6 )
    ( on_board inst968 sat000 )
    ( supports inst968 mode968 )
    ( calibration_target inst968 dir939 )
    ( not_calibrated inst968 )
  )
  ( :goal
    ( and
      ( have_image dir509 mode558 )
      ( have_image dir455 mode147 )
      ( have_image dir954 mode763 )
      ( have_image dir9 mode6 )
      ( have_image dir108 mode968 )
    )
  )
)
