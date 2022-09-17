( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir979 - direction
    dir50 - direction
    dir381 - direction
    dir554 - direction
    dir352 - direction
    dir835 - direction
    dir664 - direction
    dir862 - direction
    dir235 - direction
    dir604 - direction
    dir439 - direction
    dir365 - direction
    dir62 - direction
    dir827 - direction
    mode196 - mode
    inst196 - instrument
    mode280 - mode
    inst280 - instrument
    mode232 - mode
    inst232 - instrument
    mode859 - mode
    inst859 - instrument
    mode313 - mode
    inst313 - instrument
    mode39 - mode
    inst39 - instrument
    mode210 - mode
    inst210 - instrument
    mode267 - mode
    inst267 - instrument
    mode529 - mode
    inst529 - instrument
    mode745 - mode
    inst745 - instrument
    mode393 - mode
    inst393 - instrument
    mode198 - mode
    inst198 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir979 )
    ( on_board inst196 sat000 )
    ( supports inst196 mode196 )
    ( calibration_target inst196 dir50 )
    ( not_calibrated inst196 )
    ( on_board inst280 sat000 )
    ( supports inst280 mode280 )
    ( calibration_target inst280 dir50 )
    ( not_calibrated inst280 )
    ( on_board inst232 sat000 )
    ( supports inst232 mode232 )
    ( calibration_target inst232 dir50 )
    ( not_calibrated inst232 )
    ( on_board inst859 sat000 )
    ( supports inst859 mode859 )
    ( calibration_target inst859 dir50 )
    ( not_calibrated inst859 )
    ( on_board inst313 sat000 )
    ( supports inst313 mode313 )
    ( calibration_target inst313 dir50 )
    ( not_calibrated inst313 )
    ( on_board inst39 sat000 )
    ( supports inst39 mode39 )
    ( calibration_target inst39 dir50 )
    ( not_calibrated inst39 )
    ( on_board inst210 sat000 )
    ( supports inst210 mode210 )
    ( calibration_target inst210 dir50 )
    ( not_calibrated inst210 )
    ( on_board inst267 sat000 )
    ( supports inst267 mode267 )
    ( calibration_target inst267 dir50 )
    ( not_calibrated inst267 )
    ( on_board inst529 sat000 )
    ( supports inst529 mode529 )
    ( calibration_target inst529 dir50 )
    ( not_calibrated inst529 )
    ( on_board inst745 sat000 )
    ( supports inst745 mode745 )
    ( calibration_target inst745 dir50 )
    ( not_calibrated inst745 )
    ( on_board inst393 sat000 )
    ( supports inst393 mode393 )
    ( calibration_target inst393 dir50 )
    ( not_calibrated inst393 )
    ( on_board inst198 sat000 )
    ( supports inst198 mode198 )
    ( calibration_target inst198 dir50 )
    ( not_calibrated inst198 )
  )
  ( :goal
    ( and
      ( have_image dir381 mode196 )
      ( have_image dir554 mode280 )
      ( have_image dir352 mode232 )
      ( have_image dir835 mode859 )
      ( have_image dir664 mode313 )
      ( have_image dir862 mode39 )
      ( have_image dir235 mode210 )
      ( have_image dir604 mode267 )
      ( have_image dir439 mode529 )
      ( have_image dir365 mode745 )
      ( have_image dir62 mode393 )
      ( have_image dir827 mode198 )
    )
  )
)
