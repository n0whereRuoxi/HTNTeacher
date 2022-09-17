( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir246 - direction
    dir110 - direction
    dir890 - direction
    dir408 - direction
    dir226 - direction
    dir97 - direction
    dir164 - direction
    dir757 - direction
    dir281 - direction
    dir884 - direction
    dir10 - direction
    dir237 - direction
    dir67 - direction
    dir669 - direction
    dir680 - direction
    mode402 - mode
    inst402 - instrument
    mode124 - mode
    inst124 - instrument
    mode396 - mode
    inst396 - instrument
    mode849 - mode
    inst849 - instrument
    mode689 - mode
    inst689 - instrument
    mode170 - mode
    inst170 - instrument
    mode196 - mode
    inst196 - instrument
    mode929 - mode
    inst929 - instrument
    mode995 - mode
    inst995 - instrument
    mode47 - mode
    inst47 - instrument
    mode779 - mode
    inst779 - instrument
    mode666 - mode
    inst666 - instrument
    mode831 - mode
    inst831 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir246 )
    ( on_board inst402 sat000 )
    ( supports inst402 mode402 )
    ( calibration_target inst402 dir110 )
    ( not_calibrated inst402 )
    ( on_board inst124 sat000 )
    ( supports inst124 mode124 )
    ( calibration_target inst124 dir110 )
    ( not_calibrated inst124 )
    ( on_board inst396 sat000 )
    ( supports inst396 mode396 )
    ( calibration_target inst396 dir110 )
    ( not_calibrated inst396 )
    ( on_board inst849 sat000 )
    ( supports inst849 mode849 )
    ( calibration_target inst849 dir110 )
    ( not_calibrated inst849 )
    ( on_board inst689 sat000 )
    ( supports inst689 mode689 )
    ( calibration_target inst689 dir110 )
    ( not_calibrated inst689 )
    ( on_board inst170 sat000 )
    ( supports inst170 mode170 )
    ( calibration_target inst170 dir110 )
    ( not_calibrated inst170 )
    ( on_board inst196 sat000 )
    ( supports inst196 mode196 )
    ( calibration_target inst196 dir110 )
    ( not_calibrated inst196 )
    ( on_board inst929 sat000 )
    ( supports inst929 mode929 )
    ( calibration_target inst929 dir110 )
    ( not_calibrated inst929 )
    ( on_board inst995 sat000 )
    ( supports inst995 mode995 )
    ( calibration_target inst995 dir110 )
    ( not_calibrated inst995 )
    ( on_board inst47 sat000 )
    ( supports inst47 mode47 )
    ( calibration_target inst47 dir110 )
    ( not_calibrated inst47 )
    ( on_board inst779 sat000 )
    ( supports inst779 mode779 )
    ( calibration_target inst779 dir110 )
    ( not_calibrated inst779 )
    ( on_board inst666 sat000 )
    ( supports inst666 mode666 )
    ( calibration_target inst666 dir110 )
    ( not_calibrated inst666 )
    ( on_board inst831 sat000 )
    ( supports inst831 mode831 )
    ( calibration_target inst831 dir110 )
    ( not_calibrated inst831 )
  )
  ( :goal
    ( and
      ( have_image dir890 mode402 )
      ( have_image dir408 mode124 )
      ( have_image dir226 mode396 )
      ( have_image dir97 mode849 )
      ( have_image dir164 mode689 )
      ( have_image dir757 mode170 )
      ( have_image dir281 mode196 )
      ( have_image dir884 mode929 )
      ( have_image dir10 mode995 )
      ( have_image dir237 mode47 )
      ( have_image dir67 mode779 )
      ( have_image dir669 mode666 )
      ( have_image dir680 mode831 )
    )
  )
)
