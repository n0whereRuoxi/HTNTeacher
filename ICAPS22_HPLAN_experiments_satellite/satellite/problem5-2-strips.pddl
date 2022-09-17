( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir323 - direction
    dir488 - direction
    dir69 - direction
    dir388 - direction
    dir351 - direction
    dir989 - direction
    dir889 - direction
    mode576 - mode
    inst576 - instrument
    mode747 - mode
    inst747 - instrument
    mode310 - mode
    inst310 - instrument
    mode767 - mode
    inst767 - instrument
    mode577 - mode
    inst577 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir323 )
    ( on_board inst576 sat000 )
    ( supports inst576 mode576 )
    ( calibration_target inst576 dir488 )
    ( not_calibrated inst576 )
    ( on_board inst747 sat000 )
    ( supports inst747 mode747 )
    ( calibration_target inst747 dir488 )
    ( not_calibrated inst747 )
    ( on_board inst310 sat000 )
    ( supports inst310 mode310 )
    ( calibration_target inst310 dir488 )
    ( not_calibrated inst310 )
    ( on_board inst767 sat000 )
    ( supports inst767 mode767 )
    ( calibration_target inst767 dir488 )
    ( not_calibrated inst767 )
    ( on_board inst577 sat000 )
    ( supports inst577 mode577 )
    ( calibration_target inst577 dir488 )
    ( not_calibrated inst577 )
  )
  ( :goal
    ( and
      ( have_image dir69 mode576 )
      ( have_image dir388 mode747 )
      ( have_image dir351 mode310 )
      ( have_image dir989 mode767 )
      ( have_image dir889 mode577 )
    )
  )
)
