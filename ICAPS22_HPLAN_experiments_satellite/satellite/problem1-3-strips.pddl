( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir487 - direction
    dir737 - direction
    dir730 - direction
    mode141 - mode
    inst141 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir487 )
    ( on_board inst141 sat000 )
    ( supports inst141 mode141 )
    ( calibration_target inst141 dir737 )
    ( not_calibrated inst141 )
  )
  ( :goal
    ( and
      ( have_image dir730 mode141 )
    )
  )
)
