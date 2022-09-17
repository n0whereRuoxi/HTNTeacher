( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir358 - direction
    dir500 - direction
    dir145 - direction
    dir597 - direction
    dir287 - direction
    dir939 - direction
    dir91 - direction
    dir20 - direction
    mode407 - mode
    inst407 - instrument
    mode998 - mode
    inst998 - instrument
    mode126 - mode
    inst126 - instrument
    mode796 - mode
    inst796 - instrument
    mode947 - mode
    inst947 - instrument
    mode59 - mode
    inst59 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir358 )
    ( on_board inst407 sat000 )
    ( supports inst407 mode407 )
    ( calibration_target inst407 dir500 )
    ( not_calibrated inst407 )
    ( on_board inst998 sat000 )
    ( supports inst998 mode998 )
    ( calibration_target inst998 dir500 )
    ( not_calibrated inst998 )
    ( on_board inst126 sat000 )
    ( supports inst126 mode126 )
    ( calibration_target inst126 dir500 )
    ( not_calibrated inst126 )
    ( on_board inst796 sat000 )
    ( supports inst796 mode796 )
    ( calibration_target inst796 dir500 )
    ( not_calibrated inst796 )
    ( on_board inst947 sat000 )
    ( supports inst947 mode947 )
    ( calibration_target inst947 dir500 )
    ( not_calibrated inst947 )
    ( on_board inst59 sat000 )
    ( supports inst59 mode59 )
    ( calibration_target inst59 dir500 )
    ( not_calibrated inst59 )
  )
  ( :goal
    ( and
      ( have_image dir145 mode407 )
      ( have_image dir597 mode998 )
      ( have_image dir287 mode126 )
      ( have_image dir939 mode796 )
      ( have_image dir91 mode947 )
      ( have_image dir20 mode59 )
    )
  )
)
