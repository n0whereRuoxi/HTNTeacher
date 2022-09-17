( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir190 - direction
    dir569 - direction
    dir51 - direction
    dir431 - direction
    dir347 - direction
    dir229 - direction
    dir45 - direction
    dir971 - direction
    dir529 - direction
    mode521 - mode
    inst521 - instrument
    mode145 - mode
    inst145 - instrument
    mode126 - mode
    inst126 - instrument
    mode288 - mode
    inst288 - instrument
    mode540 - mode
    inst540 - instrument
    mode993 - mode
    inst993 - instrument
    mode374 - mode
    inst374 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir190 )
    ( on_board inst521 sat000 )
    ( supports inst521 mode521 )
    ( calibration_target inst521 dir569 )
    ( not_calibrated inst521 )
    ( on_board inst145 sat000 )
    ( supports inst145 mode145 )
    ( calibration_target inst145 dir569 )
    ( not_calibrated inst145 )
    ( on_board inst126 sat000 )
    ( supports inst126 mode126 )
    ( calibration_target inst126 dir569 )
    ( not_calibrated inst126 )
    ( on_board inst288 sat000 )
    ( supports inst288 mode288 )
    ( calibration_target inst288 dir569 )
    ( not_calibrated inst288 )
    ( on_board inst540 sat000 )
    ( supports inst540 mode540 )
    ( calibration_target inst540 dir569 )
    ( not_calibrated inst540 )
    ( on_board inst993 sat000 )
    ( supports inst993 mode993 )
    ( calibration_target inst993 dir569 )
    ( not_calibrated inst993 )
    ( on_board inst374 sat000 )
    ( supports inst374 mode374 )
    ( calibration_target inst374 dir569 )
    ( not_calibrated inst374 )
  )
  ( :goal
    ( and
      ( have_image dir51 mode521 )
      ( have_image dir431 mode145 )
      ( have_image dir347 mode126 )
      ( have_image dir229 mode288 )
      ( have_image dir45 mode540 )
      ( have_image dir971 mode993 )
      ( have_image dir529 mode374 )
    )
  )
)
