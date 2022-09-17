( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir594 - direction
    dir196 - direction
    dir411 - direction
    dir291 - direction
    dir547 - direction
    dir113 - direction
    dir77 - direction
    dir99 - direction
    dir360 - direction
    dir159 - direction
    dir864 - direction
    dir419 - direction
    dir503 - direction
    dir194 - direction
    dir495 - direction
    dir329 - direction
    mode770 - mode
    inst770 - instrument
    mode109 - mode
    inst109 - instrument
    mode924 - mode
    inst924 - instrument
    mode497 - mode
    inst497 - instrument
    mode124 - mode
    inst124 - instrument
    mode767 - mode
    inst767 - instrument
    mode195 - mode
    inst195 - instrument
    mode512 - mode
    inst512 - instrument
    mode914 - mode
    inst914 - instrument
    mode612 - mode
    inst612 - instrument
    mode317 - mode
    inst317 - instrument
    mode82 - mode
    inst82 - instrument
    mode295 - mode
    inst295 - instrument
    mode500 - mode
    inst500 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir594 )
    ( on_board inst770 sat000 )
    ( supports inst770 mode770 )
    ( calibration_target inst770 dir196 )
    ( not_calibrated inst770 )
    ( on_board inst109 sat000 )
    ( supports inst109 mode109 )
    ( calibration_target inst109 dir196 )
    ( not_calibrated inst109 )
    ( on_board inst924 sat000 )
    ( supports inst924 mode924 )
    ( calibration_target inst924 dir196 )
    ( not_calibrated inst924 )
    ( on_board inst497 sat000 )
    ( supports inst497 mode497 )
    ( calibration_target inst497 dir196 )
    ( not_calibrated inst497 )
    ( on_board inst124 sat000 )
    ( supports inst124 mode124 )
    ( calibration_target inst124 dir196 )
    ( not_calibrated inst124 )
    ( on_board inst767 sat000 )
    ( supports inst767 mode767 )
    ( calibration_target inst767 dir196 )
    ( not_calibrated inst767 )
    ( on_board inst195 sat000 )
    ( supports inst195 mode195 )
    ( calibration_target inst195 dir196 )
    ( not_calibrated inst195 )
    ( on_board inst512 sat000 )
    ( supports inst512 mode512 )
    ( calibration_target inst512 dir196 )
    ( not_calibrated inst512 )
    ( on_board inst914 sat000 )
    ( supports inst914 mode914 )
    ( calibration_target inst914 dir196 )
    ( not_calibrated inst914 )
    ( on_board inst612 sat000 )
    ( supports inst612 mode612 )
    ( calibration_target inst612 dir196 )
    ( not_calibrated inst612 )
    ( on_board inst317 sat000 )
    ( supports inst317 mode317 )
    ( calibration_target inst317 dir196 )
    ( not_calibrated inst317 )
    ( on_board inst82 sat000 )
    ( supports inst82 mode82 )
    ( calibration_target inst82 dir196 )
    ( not_calibrated inst82 )
    ( on_board inst295 sat000 )
    ( supports inst295 mode295 )
    ( calibration_target inst295 dir196 )
    ( not_calibrated inst295 )
    ( on_board inst500 sat000 )
    ( supports inst500 mode500 )
    ( calibration_target inst500 dir196 )
    ( not_calibrated inst500 )
  )
  ( :goal
    ( and
      ( have_image dir411 mode770 )
      ( have_image dir291 mode109 )
      ( have_image dir547 mode924 )
      ( have_image dir113 mode497 )
      ( have_image dir77 mode124 )
      ( have_image dir99 mode767 )
      ( have_image dir360 mode195 )
      ( have_image dir159 mode512 )
      ( have_image dir864 mode914 )
      ( have_image dir419 mode612 )
      ( have_image dir503 mode317 )
      ( have_image dir194 mode82 )
      ( have_image dir495 mode295 )
      ( have_image dir329 mode500 )
    )
  )
)
