( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir23 - direction
    dir698 - direction
    dir207 - direction
    dir288 - direction
    dir235 - direction
    dir667 - direction
    dir953 - direction
    mode21 - mode
    inst21 - instrument
    mode926 - mode
    inst926 - instrument
    mode930 - mode
    inst930 - instrument
    mode225 - mode
    inst225 - instrument
    mode807 - mode
    inst807 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir23 )
    ( on_board inst21 sat000 )
    ( supports inst21 mode21 )
    ( calibration_target inst21 dir698 )
    ( not_calibrated inst21 )
    ( on_board inst926 sat000 )
    ( supports inst926 mode926 )
    ( calibration_target inst926 dir698 )
    ( not_calibrated inst926 )
    ( on_board inst930 sat000 )
    ( supports inst930 mode930 )
    ( calibration_target inst930 dir698 )
    ( not_calibrated inst930 )
    ( on_board inst225 sat000 )
    ( supports inst225 mode225 )
    ( calibration_target inst225 dir698 )
    ( not_calibrated inst225 )
    ( on_board inst807 sat000 )
    ( supports inst807 mode807 )
    ( calibration_target inst807 dir698 )
    ( not_calibrated inst807 )
  )
  ( :goal
    ( and
      ( have_image dir207 mode21 )
      ( have_image dir288 mode926 )
      ( have_image dir235 mode930 )
      ( have_image dir667 mode225 )
      ( have_image dir953 mode807 )
    )
  )
)
