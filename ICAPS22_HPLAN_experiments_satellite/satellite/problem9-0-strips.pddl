( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir382 - direction
    dir123 - direction
    dir746 - direction
    dir655 - direction
    dir198 - direction
    dir118 - direction
    dir31 - direction
    dir91 - direction
    dir297 - direction
    dir693 - direction
    dir740 - direction
    mode968 - mode
    inst968 - instrument
    mode77 - mode
    inst77 - instrument
    mode945 - mode
    inst945 - instrument
    mode536 - mode
    inst536 - instrument
    mode608 - mode
    inst608 - instrument
    mode391 - mode
    inst391 - instrument
    mode806 - mode
    inst806 - instrument
    mode217 - mode
    inst217 - instrument
    mode321 - mode
    inst321 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir382 )
    ( on_board inst968 sat000 )
    ( supports inst968 mode968 )
    ( calibration_target inst968 dir123 )
    ( not_calibrated inst968 )
    ( on_board inst77 sat000 )
    ( supports inst77 mode77 )
    ( calibration_target inst77 dir123 )
    ( not_calibrated inst77 )
    ( on_board inst945 sat000 )
    ( supports inst945 mode945 )
    ( calibration_target inst945 dir123 )
    ( not_calibrated inst945 )
    ( on_board inst536 sat000 )
    ( supports inst536 mode536 )
    ( calibration_target inst536 dir123 )
    ( not_calibrated inst536 )
    ( on_board inst608 sat000 )
    ( supports inst608 mode608 )
    ( calibration_target inst608 dir123 )
    ( not_calibrated inst608 )
    ( on_board inst391 sat000 )
    ( supports inst391 mode391 )
    ( calibration_target inst391 dir123 )
    ( not_calibrated inst391 )
    ( on_board inst806 sat000 )
    ( supports inst806 mode806 )
    ( calibration_target inst806 dir123 )
    ( not_calibrated inst806 )
    ( on_board inst217 sat000 )
    ( supports inst217 mode217 )
    ( calibration_target inst217 dir123 )
    ( not_calibrated inst217 )
    ( on_board inst321 sat000 )
    ( supports inst321 mode321 )
    ( calibration_target inst321 dir123 )
    ( not_calibrated inst321 )
  )
  ( :goal
    ( and
      ( have_image dir746 mode968 )
      ( have_image dir655 mode77 )
      ( have_image dir198 mode945 )
      ( have_image dir118 mode536 )
      ( have_image dir31 mode608 )
      ( have_image dir91 mode391 )
      ( have_image dir297 mode806 )
      ( have_image dir693 mode217 )
      ( have_image dir740 mode321 )
    )
  )
)
