( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir331 - direction
    dir918 - direction
    dir653 - direction
    dir369 - direction
    dir40 - direction
    dir63 - direction
    dir400 - direction
    dir866 - direction
    dir795 - direction
    dir217 - direction
    dir365 - direction
    dir924 - direction
    dir25 - direction
    dir726 - direction
    mode8 - mode
    inst8 - instrument
    mode296 - mode
    inst296 - instrument
    mode145 - mode
    inst145 - instrument
    mode690 - mode
    inst690 - instrument
    mode417 - mode
    inst417 - instrument
    mode437 - mode
    inst437 - instrument
    mode510 - mode
    inst510 - instrument
    mode982 - mode
    inst982 - instrument
    mode604 - mode
    inst604 - instrument
    mode749 - mode
    inst749 - instrument
    mode442 - mode
    inst442 - instrument
    mode258 - mode
    inst258 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir331 )
    ( on_board inst8 sat000 )
    ( supports inst8 mode8 )
    ( calibration_target inst8 dir918 )
    ( not_calibrated inst8 )
    ( on_board inst296 sat000 )
    ( supports inst296 mode296 )
    ( calibration_target inst296 dir918 )
    ( not_calibrated inst296 )
    ( on_board inst145 sat000 )
    ( supports inst145 mode145 )
    ( calibration_target inst145 dir918 )
    ( not_calibrated inst145 )
    ( on_board inst690 sat000 )
    ( supports inst690 mode690 )
    ( calibration_target inst690 dir918 )
    ( not_calibrated inst690 )
    ( on_board inst417 sat000 )
    ( supports inst417 mode417 )
    ( calibration_target inst417 dir918 )
    ( not_calibrated inst417 )
    ( on_board inst437 sat000 )
    ( supports inst437 mode437 )
    ( calibration_target inst437 dir918 )
    ( not_calibrated inst437 )
    ( on_board inst510 sat000 )
    ( supports inst510 mode510 )
    ( calibration_target inst510 dir918 )
    ( not_calibrated inst510 )
    ( on_board inst982 sat000 )
    ( supports inst982 mode982 )
    ( calibration_target inst982 dir918 )
    ( not_calibrated inst982 )
    ( on_board inst604 sat000 )
    ( supports inst604 mode604 )
    ( calibration_target inst604 dir918 )
    ( not_calibrated inst604 )
    ( on_board inst749 sat000 )
    ( supports inst749 mode749 )
    ( calibration_target inst749 dir918 )
    ( not_calibrated inst749 )
    ( on_board inst442 sat000 )
    ( supports inst442 mode442 )
    ( calibration_target inst442 dir918 )
    ( not_calibrated inst442 )
    ( on_board inst258 sat000 )
    ( supports inst258 mode258 )
    ( calibration_target inst258 dir918 )
    ( not_calibrated inst258 )
  )
  ( :goal
    ( and
      ( have_image dir653 mode8 )
      ( have_image dir369 mode296 )
      ( have_image dir40 mode145 )
      ( have_image dir63 mode690 )
      ( have_image dir400 mode417 )
      ( have_image dir866 mode437 )
      ( have_image dir795 mode510 )
      ( have_image dir217 mode982 )
      ( have_image dir365 mode604 )
      ( have_image dir924 mode749 )
      ( have_image dir25 mode442 )
      ( have_image dir726 mode258 )
    )
  )
)
