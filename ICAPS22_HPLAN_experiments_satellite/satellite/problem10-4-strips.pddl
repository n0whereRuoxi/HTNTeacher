( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir279 - direction
    dir916 - direction
    dir662 - direction
    dir114 - direction
    dir983 - direction
    dir134 - direction
    dir120 - direction
    dir262 - direction
    dir789 - direction
    dir194 - direction
    dir155 - direction
    dir522 - direction
    mode67 - mode
    inst67 - instrument
    mode417 - mode
    inst417 - instrument
    mode820 - mode
    inst820 - instrument
    mode752 - mode
    inst752 - instrument
    mode172 - mode
    inst172 - instrument
    mode826 - mode
    inst826 - instrument
    mode343 - mode
    inst343 - instrument
    mode530 - mode
    inst530 - instrument
    mode400 - mode
    inst400 - instrument
    mode972 - mode
    inst972 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir279 )
    ( on_board inst67 sat000 )
    ( supports inst67 mode67 )
    ( calibration_target inst67 dir916 )
    ( not_calibrated inst67 )
    ( on_board inst417 sat000 )
    ( supports inst417 mode417 )
    ( calibration_target inst417 dir916 )
    ( not_calibrated inst417 )
    ( on_board inst820 sat000 )
    ( supports inst820 mode820 )
    ( calibration_target inst820 dir916 )
    ( not_calibrated inst820 )
    ( on_board inst752 sat000 )
    ( supports inst752 mode752 )
    ( calibration_target inst752 dir916 )
    ( not_calibrated inst752 )
    ( on_board inst172 sat000 )
    ( supports inst172 mode172 )
    ( calibration_target inst172 dir916 )
    ( not_calibrated inst172 )
    ( on_board inst826 sat000 )
    ( supports inst826 mode826 )
    ( calibration_target inst826 dir916 )
    ( not_calibrated inst826 )
    ( on_board inst343 sat000 )
    ( supports inst343 mode343 )
    ( calibration_target inst343 dir916 )
    ( not_calibrated inst343 )
    ( on_board inst530 sat000 )
    ( supports inst530 mode530 )
    ( calibration_target inst530 dir916 )
    ( not_calibrated inst530 )
    ( on_board inst400 sat000 )
    ( supports inst400 mode400 )
    ( calibration_target inst400 dir916 )
    ( not_calibrated inst400 )
    ( on_board inst972 sat000 )
    ( supports inst972 mode972 )
    ( calibration_target inst972 dir916 )
    ( not_calibrated inst972 )
  )
  ( :goal
    ( and
      ( have_image dir662 mode67 )
      ( have_image dir114 mode417 )
      ( have_image dir983 mode820 )
      ( have_image dir134 mode752 )
      ( have_image dir120 mode172 )
      ( have_image dir262 mode826 )
      ( have_image dir789 mode343 )
      ( have_image dir194 mode530 )
      ( have_image dir155 mode400 )
      ( have_image dir522 mode972 )
    )
  )
)
