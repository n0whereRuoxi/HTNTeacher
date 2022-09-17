( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir335 - direction
    dir495 - direction
    dir757 - direction
    dir932 - direction
    mode828 - mode
    inst828 - instrument
    mode58 - mode
    inst58 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir335 )
    ( on_board inst828 sat000 )
    ( supports inst828 mode828 )
    ( calibration_target inst828 dir495 )
    ( not_calibrated inst828 )
    ( on_board inst58 sat000 )
    ( supports inst58 mode58 )
    ( calibration_target inst58 dir495 )
    ( not_calibrated inst58 )
  )
  ( :goal
    ( and
      ( have_image dir757 mode828 )
      ( have_image dir932 mode58 )
    )
  )
)
