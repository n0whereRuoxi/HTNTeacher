( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir127 - direction
    dir265 - direction
    dir50 - direction
    dir240 - direction
    dir789 - direction
    dir677 - direction
    dir864 - direction
    dir798 - direction
    dir608 - direction
    dir300 - direction
    dir336 - direction
    dir676 - direction
    dir381 - direction
    dir437 - direction
    dir732 - direction
    mode884 - mode
    inst884 - instrument
    mode588 - mode
    inst588 - instrument
    mode609 - mode
    inst609 - instrument
    mode800 - mode
    inst800 - instrument
    mode894 - mode
    inst894 - instrument
    mode915 - mode
    inst915 - instrument
    mode823 - mode
    inst823 - instrument
    mode968 - mode
    inst968 - instrument
    mode847 - mode
    inst847 - instrument
    mode775 - mode
    inst775 - instrument
    mode212 - mode
    inst212 - instrument
    mode254 - mode
    inst254 - instrument
    mode95 - mode
    inst95 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir127 )
    ( on_board inst884 sat000 )
    ( supports inst884 mode884 )
    ( calibration_target inst884 dir265 )
    ( not_calibrated inst884 )
    ( on_board inst588 sat000 )
    ( supports inst588 mode588 )
    ( calibration_target inst588 dir265 )
    ( not_calibrated inst588 )
    ( on_board inst609 sat000 )
    ( supports inst609 mode609 )
    ( calibration_target inst609 dir265 )
    ( not_calibrated inst609 )
    ( on_board inst800 sat000 )
    ( supports inst800 mode800 )
    ( calibration_target inst800 dir265 )
    ( not_calibrated inst800 )
    ( on_board inst894 sat000 )
    ( supports inst894 mode894 )
    ( calibration_target inst894 dir265 )
    ( not_calibrated inst894 )
    ( on_board inst915 sat000 )
    ( supports inst915 mode915 )
    ( calibration_target inst915 dir265 )
    ( not_calibrated inst915 )
    ( on_board inst823 sat000 )
    ( supports inst823 mode823 )
    ( calibration_target inst823 dir265 )
    ( not_calibrated inst823 )
    ( on_board inst968 sat000 )
    ( supports inst968 mode968 )
    ( calibration_target inst968 dir265 )
    ( not_calibrated inst968 )
    ( on_board inst847 sat000 )
    ( supports inst847 mode847 )
    ( calibration_target inst847 dir265 )
    ( not_calibrated inst847 )
    ( on_board inst775 sat000 )
    ( supports inst775 mode775 )
    ( calibration_target inst775 dir265 )
    ( not_calibrated inst775 )
    ( on_board inst212 sat000 )
    ( supports inst212 mode212 )
    ( calibration_target inst212 dir265 )
    ( not_calibrated inst212 )
    ( on_board inst254 sat000 )
    ( supports inst254 mode254 )
    ( calibration_target inst254 dir265 )
    ( not_calibrated inst254 )
    ( on_board inst95 sat000 )
    ( supports inst95 mode95 )
    ( calibration_target inst95 dir265 )
    ( not_calibrated inst95 )
  )
  ( :goal
    ( and
      ( have_image dir50 mode884 )
      ( have_image dir240 mode588 )
      ( have_image dir789 mode609 )
      ( have_image dir677 mode800 )
      ( have_image dir864 mode894 )
      ( have_image dir798 mode915 )
      ( have_image dir608 mode823 )
      ( have_image dir300 mode968 )
      ( have_image dir336 mode847 )
      ( have_image dir676 mode775 )
      ( have_image dir381 mode212 )
      ( have_image dir437 mode254 )
      ( have_image dir732 mode95 )
    )
  )
)
