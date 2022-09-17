( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir975 - direction
    dir762 - direction
    dir271 - direction
    dir193 - direction
    dir249 - direction
    dir194 - direction
    dir749 - direction
    dir381 - direction
    dir516 - direction
    dir284 - direction
    mode17 - mode
    inst17 - instrument
    mode796 - mode
    inst796 - instrument
    mode998 - mode
    inst998 - instrument
    mode786 - mode
    inst786 - instrument
    mode566 - mode
    inst566 - instrument
    mode635 - mode
    inst635 - instrument
    mode575 - mode
    inst575 - instrument
    mode752 - mode
    inst752 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir975 )
    ( on_board inst17 sat000 )
    ( supports inst17 mode17 )
    ( calibration_target inst17 dir762 )
    ( not_calibrated inst17 )
    ( on_board inst796 sat000 )
    ( supports inst796 mode796 )
    ( calibration_target inst796 dir762 )
    ( not_calibrated inst796 )
    ( on_board inst998 sat000 )
    ( supports inst998 mode998 )
    ( calibration_target inst998 dir762 )
    ( not_calibrated inst998 )
    ( on_board inst786 sat000 )
    ( supports inst786 mode786 )
    ( calibration_target inst786 dir762 )
    ( not_calibrated inst786 )
    ( on_board inst566 sat000 )
    ( supports inst566 mode566 )
    ( calibration_target inst566 dir762 )
    ( not_calibrated inst566 )
    ( on_board inst635 sat000 )
    ( supports inst635 mode635 )
    ( calibration_target inst635 dir762 )
    ( not_calibrated inst635 )
    ( on_board inst575 sat000 )
    ( supports inst575 mode575 )
    ( calibration_target inst575 dir762 )
    ( not_calibrated inst575 )
    ( on_board inst752 sat000 )
    ( supports inst752 mode752 )
    ( calibration_target inst752 dir762 )
    ( not_calibrated inst752 )
  )
  ( :goal
    ( and
      ( have_image dir271 mode17 )
      ( have_image dir193 mode796 )
      ( have_image dir249 mode998 )
      ( have_image dir194 mode786 )
      ( have_image dir749 mode566 )
      ( have_image dir381 mode635 )
      ( have_image dir516 mode575 )
      ( have_image dir284 mode752 )
    )
  )
)
