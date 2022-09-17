( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir851 - direction
    dir235 - direction
    dir277 - direction
    dir979 - direction
    dir950 - direction
    dir594 - direction
    dir399 - direction
    dir478 - direction
    dir735 - direction
    dir662 - direction
    dir7 - direction
    dir477 - direction
    dir696 - direction
    dir888 - direction
    dir599 - direction
    mode829 - mode
    inst829 - instrument
    mode975 - mode
    inst975 - instrument
    mode924 - mode
    inst924 - instrument
    mode238 - mode
    inst238 - instrument
    mode770 - mode
    inst770 - instrument
    mode316 - mode
    inst316 - instrument
    mode943 - mode
    inst943 - instrument
    mode532 - mode
    inst532 - instrument
    mode929 - mode
    inst929 - instrument
    mode607 - mode
    inst607 - instrument
    mode10 - mode
    inst10 - instrument
    mode473 - mode
    inst473 - instrument
    mode520 - mode
    inst520 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir851 )
    ( on_board inst829 sat000 )
    ( supports inst829 mode829 )
    ( calibration_target inst829 dir235 )
    ( not_calibrated inst829 )
    ( on_board inst975 sat000 )
    ( supports inst975 mode975 )
    ( calibration_target inst975 dir235 )
    ( not_calibrated inst975 )
    ( on_board inst924 sat000 )
    ( supports inst924 mode924 )
    ( calibration_target inst924 dir235 )
    ( not_calibrated inst924 )
    ( on_board inst238 sat000 )
    ( supports inst238 mode238 )
    ( calibration_target inst238 dir235 )
    ( not_calibrated inst238 )
    ( on_board inst770 sat000 )
    ( supports inst770 mode770 )
    ( calibration_target inst770 dir235 )
    ( not_calibrated inst770 )
    ( on_board inst316 sat000 )
    ( supports inst316 mode316 )
    ( calibration_target inst316 dir235 )
    ( not_calibrated inst316 )
    ( on_board inst943 sat000 )
    ( supports inst943 mode943 )
    ( calibration_target inst943 dir235 )
    ( not_calibrated inst943 )
    ( on_board inst532 sat000 )
    ( supports inst532 mode532 )
    ( calibration_target inst532 dir235 )
    ( not_calibrated inst532 )
    ( on_board inst929 sat000 )
    ( supports inst929 mode929 )
    ( calibration_target inst929 dir235 )
    ( not_calibrated inst929 )
    ( on_board inst607 sat000 )
    ( supports inst607 mode607 )
    ( calibration_target inst607 dir235 )
    ( not_calibrated inst607 )
    ( on_board inst10 sat000 )
    ( supports inst10 mode10 )
    ( calibration_target inst10 dir235 )
    ( not_calibrated inst10 )
    ( on_board inst473 sat000 )
    ( supports inst473 mode473 )
    ( calibration_target inst473 dir235 )
    ( not_calibrated inst473 )
    ( on_board inst520 sat000 )
    ( supports inst520 mode520 )
    ( calibration_target inst520 dir235 )
    ( not_calibrated inst520 )
  )
  ( :goal
    ( and
      ( have_image dir277 mode829 )
      ( have_image dir979 mode975 )
      ( have_image dir950 mode924 )
      ( have_image dir594 mode238 )
      ( have_image dir399 mode770 )
      ( have_image dir478 mode316 )
      ( have_image dir735 mode943 )
      ( have_image dir662 mode532 )
      ( have_image dir7 mode929 )
      ( have_image dir477 mode607 )
      ( have_image dir696 mode10 )
      ( have_image dir888 mode473 )
      ( have_image dir599 mode520 )
    )
  )
)
