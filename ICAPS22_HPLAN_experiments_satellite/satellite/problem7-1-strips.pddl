( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir898 - direction
    dir111 - direction
    dir320 - direction
    dir37 - direction
    dir449 - direction
    dir784 - direction
    dir106 - direction
    dir740 - direction
    dir965 - direction
    mode935 - mode
    inst935 - instrument
    mode149 - mode
    inst149 - instrument
    mode327 - mode
    inst327 - instrument
    mode37 - mode
    inst37 - instrument
    mode969 - mode
    inst969 - instrument
    mode30 - mode
    inst30 - instrument
    mode936 - mode
    inst936 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir898 )
    ( on_board inst935 sat000 )
    ( supports inst935 mode935 )
    ( calibration_target inst935 dir111 )
    ( not_calibrated inst935 )
    ( on_board inst149 sat000 )
    ( supports inst149 mode149 )
    ( calibration_target inst149 dir111 )
    ( not_calibrated inst149 )
    ( on_board inst327 sat000 )
    ( supports inst327 mode327 )
    ( calibration_target inst327 dir111 )
    ( not_calibrated inst327 )
    ( on_board inst37 sat000 )
    ( supports inst37 mode37 )
    ( calibration_target inst37 dir111 )
    ( not_calibrated inst37 )
    ( on_board inst969 sat000 )
    ( supports inst969 mode969 )
    ( calibration_target inst969 dir111 )
    ( not_calibrated inst969 )
    ( on_board inst30 sat000 )
    ( supports inst30 mode30 )
    ( calibration_target inst30 dir111 )
    ( not_calibrated inst30 )
    ( on_board inst936 sat000 )
    ( supports inst936 mode936 )
    ( calibration_target inst936 dir111 )
    ( not_calibrated inst936 )
  )
  ( :goal
    ( and
      ( have_image dir320 mode935 )
      ( have_image dir37 mode149 )
      ( have_image dir449 mode327 )
      ( have_image dir784 mode37 )
      ( have_image dir106 mode969 )
      ( have_image dir740 mode30 )
      ( have_image dir965 mode936 )
    )
  )
)
