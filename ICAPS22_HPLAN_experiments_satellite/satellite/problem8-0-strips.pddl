( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir749 - direction
    dir291 - direction
    dir272 - direction
    dir738 - direction
    dir993 - direction
    dir499 - direction
    dir332 - direction
    dir365 - direction
    dir634 - direction
    dir894 - direction
    mode448 - mode
    inst448 - instrument
    mode14 - mode
    inst14 - instrument
    mode404 - mode
    inst404 - instrument
    mode24 - mode
    inst24 - instrument
    mode43 - mode
    inst43 - instrument
    mode785 - mode
    inst785 - instrument
    mode137 - mode
    inst137 - instrument
    mode258 - mode
    inst258 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir749 )
    ( on_board inst448 sat000 )
    ( supports inst448 mode448 )
    ( calibration_target inst448 dir291 )
    ( not_calibrated inst448 )
    ( on_board inst14 sat000 )
    ( supports inst14 mode14 )
    ( calibration_target inst14 dir291 )
    ( not_calibrated inst14 )
    ( on_board inst404 sat000 )
    ( supports inst404 mode404 )
    ( calibration_target inst404 dir291 )
    ( not_calibrated inst404 )
    ( on_board inst24 sat000 )
    ( supports inst24 mode24 )
    ( calibration_target inst24 dir291 )
    ( not_calibrated inst24 )
    ( on_board inst43 sat000 )
    ( supports inst43 mode43 )
    ( calibration_target inst43 dir291 )
    ( not_calibrated inst43 )
    ( on_board inst785 sat000 )
    ( supports inst785 mode785 )
    ( calibration_target inst785 dir291 )
    ( not_calibrated inst785 )
    ( on_board inst137 sat000 )
    ( supports inst137 mode137 )
    ( calibration_target inst137 dir291 )
    ( not_calibrated inst137 )
    ( on_board inst258 sat000 )
    ( supports inst258 mode258 )
    ( calibration_target inst258 dir291 )
    ( not_calibrated inst258 )
  )
  ( :goal
    ( and
      ( have_image dir272 mode448 )
      ( have_image dir738 mode14 )
      ( have_image dir993 mode404 )
      ( have_image dir499 mode24 )
      ( have_image dir332 mode43 )
      ( have_image dir365 mode785 )
      ( have_image dir634 mode137 )
      ( have_image dir894 mode258 )
    )
  )
)
