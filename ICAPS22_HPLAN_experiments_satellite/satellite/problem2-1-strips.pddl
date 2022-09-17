( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir219 - direction
    dir903 - direction
    dir756 - direction
    dir915 - direction
    mode499 - mode
    inst499 - instrument
    mode239 - mode
    inst239 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir219 )
    ( on_board inst499 sat000 )
    ( supports inst499 mode499 )
    ( calibration_target inst499 dir903 )
    ( not_calibrated inst499 )
    ( on_board inst239 sat000 )
    ( supports inst239 mode239 )
    ( calibration_target inst239 dir903 )
    ( not_calibrated inst239 )
  )
  ( :goal
    ( and
      ( have_image dir756 mode499 )
      ( have_image dir915 mode239 )
    )
  )
)
