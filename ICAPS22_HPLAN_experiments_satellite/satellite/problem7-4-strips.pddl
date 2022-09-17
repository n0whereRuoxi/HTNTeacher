( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir156 - direction
    dir610 - direction
    dir370 - direction
    dir314 - direction
    dir8 - direction
    dir889 - direction
    dir3 - direction
    dir943 - direction
    dir706 - direction
    mode438 - mode
    inst438 - instrument
    mode240 - mode
    inst240 - instrument
    mode419 - mode
    inst419 - instrument
    mode660 - mode
    inst660 - instrument
    mode256 - mode
    inst256 - instrument
    mode215 - mode
    inst215 - instrument
    mode123 - mode
    inst123 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir156 )
    ( on_board inst438 sat000 )
    ( supports inst438 mode438 )
    ( calibration_target inst438 dir610 )
    ( not_calibrated inst438 )
    ( on_board inst240 sat000 )
    ( supports inst240 mode240 )
    ( calibration_target inst240 dir610 )
    ( not_calibrated inst240 )
    ( on_board inst419 sat000 )
    ( supports inst419 mode419 )
    ( calibration_target inst419 dir610 )
    ( not_calibrated inst419 )
    ( on_board inst660 sat000 )
    ( supports inst660 mode660 )
    ( calibration_target inst660 dir610 )
    ( not_calibrated inst660 )
    ( on_board inst256 sat000 )
    ( supports inst256 mode256 )
    ( calibration_target inst256 dir610 )
    ( not_calibrated inst256 )
    ( on_board inst215 sat000 )
    ( supports inst215 mode215 )
    ( calibration_target inst215 dir610 )
    ( not_calibrated inst215 )
    ( on_board inst123 sat000 )
    ( supports inst123 mode123 )
    ( calibration_target inst123 dir610 )
    ( not_calibrated inst123 )
  )
  ( :goal
    ( and
      ( have_image dir370 mode438 )
      ( have_image dir314 mode240 )
      ( have_image dir8 mode419 )
      ( have_image dir889 mode660 )
      ( have_image dir3 mode256 )
      ( have_image dir943 mode215 )
      ( have_image dir706 mode123 )
    )
  )
)
