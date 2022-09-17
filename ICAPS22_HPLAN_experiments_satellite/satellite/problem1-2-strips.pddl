( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir798 - direction
    dir596 - direction
    dir264 - direction
    mode321 - mode
    inst321 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir798 )
    ( on_board inst321 sat000 )
    ( supports inst321 mode321 )
    ( calibration_target inst321 dir596 )
    ( not_calibrated inst321 )
  )
  ( :goal
    ( and
      ( have_image dir264 mode321 )
    )
  )
)
