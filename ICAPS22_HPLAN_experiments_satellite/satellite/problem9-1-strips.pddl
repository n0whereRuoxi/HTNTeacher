( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir370 - direction
    dir559 - direction
    dir99 - direction
    dir965 - direction
    dir589 - direction
    dir481 - direction
    dir382 - direction
    dir92 - direction
    dir76 - direction
    dir645 - direction
    dir785 - direction
    mode66 - mode
    inst66 - instrument
    mode363 - mode
    inst363 - instrument
    mode696 - mode
    inst696 - instrument
    mode545 - mode
    inst545 - instrument
    mode188 - mode
    inst188 - instrument
    mode780 - mode
    inst780 - instrument
    mode577 - mode
    inst577 - instrument
    mode929 - mode
    inst929 - instrument
    mode44 - mode
    inst44 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir370 )
    ( on_board inst66 sat000 )
    ( supports inst66 mode66 )
    ( calibration_target inst66 dir559 )
    ( not_calibrated inst66 )
    ( on_board inst363 sat000 )
    ( supports inst363 mode363 )
    ( calibration_target inst363 dir559 )
    ( not_calibrated inst363 )
    ( on_board inst696 sat000 )
    ( supports inst696 mode696 )
    ( calibration_target inst696 dir559 )
    ( not_calibrated inst696 )
    ( on_board inst545 sat000 )
    ( supports inst545 mode545 )
    ( calibration_target inst545 dir559 )
    ( not_calibrated inst545 )
    ( on_board inst188 sat000 )
    ( supports inst188 mode188 )
    ( calibration_target inst188 dir559 )
    ( not_calibrated inst188 )
    ( on_board inst780 sat000 )
    ( supports inst780 mode780 )
    ( calibration_target inst780 dir559 )
    ( not_calibrated inst780 )
    ( on_board inst577 sat000 )
    ( supports inst577 mode577 )
    ( calibration_target inst577 dir559 )
    ( not_calibrated inst577 )
    ( on_board inst929 sat000 )
    ( supports inst929 mode929 )
    ( calibration_target inst929 dir559 )
    ( not_calibrated inst929 )
    ( on_board inst44 sat000 )
    ( supports inst44 mode44 )
    ( calibration_target inst44 dir559 )
    ( not_calibrated inst44 )
  )
  ( :goal
    ( and
      ( have_image dir99 mode66 )
      ( have_image dir965 mode363 )
      ( have_image dir589 mode696 )
      ( have_image dir481 mode545 )
      ( have_image dir382 mode188 )
      ( have_image dir92 mode780 )
      ( have_image dir76 mode577 )
      ( have_image dir645 mode929 )
      ( have_image dir785 mode44 )
    )
  )
)
