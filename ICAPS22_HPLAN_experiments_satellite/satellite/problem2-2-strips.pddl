( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir193 - direction
    dir735 - direction
    dir297 - direction
    dir414 - direction
    mode58 - mode
    inst58 - instrument
    mode748 - mode
    inst748 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir193 )
    ( on_board inst58 sat000 )
    ( supports inst58 mode58 )
    ( calibration_target inst58 dir735 )
    ( not_calibrated inst58 )
    ( on_board inst748 sat000 )
    ( supports inst748 mode748 )
    ( calibration_target inst748 dir735 )
    ( not_calibrated inst748 )
  )
  ( :goal
    ( and
      ( have_image dir297 mode58 )
      ( have_image dir414 mode748 )
    )
  )
)
