( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir457 - direction
    dir974 - direction
    dir378 - direction
    dir308 - direction
    dir346 - direction
    dir272 - direction
    dir817 - direction
    dir916 - direction
    dir739 - direction
    dir62 - direction
    dir603 - direction
    dir597 - direction
    dir264 - direction
    dir407 - direction
    mode153 - mode
    inst153 - instrument
    mode296 - mode
    inst296 - instrument
    mode197 - mode
    inst197 - instrument
    mode70 - mode
    inst70 - instrument
    mode126 - mode
    inst126 - instrument
    mode482 - mode
    inst482 - instrument
    mode790 - mode
    inst790 - instrument
    mode966 - mode
    inst966 - instrument
    mode627 - mode
    inst627 - instrument
    mode94 - mode
    inst94 - instrument
    mode555 - mode
    inst555 - instrument
    mode426 - mode
    inst426 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir457 )
    ( on_board inst153 sat000 )
    ( supports inst153 mode153 )
    ( calibration_target inst153 dir974 )
    ( not_calibrated inst153 )
    ( on_board inst296 sat000 )
    ( supports inst296 mode296 )
    ( calibration_target inst296 dir974 )
    ( not_calibrated inst296 )
    ( on_board inst197 sat000 )
    ( supports inst197 mode197 )
    ( calibration_target inst197 dir974 )
    ( not_calibrated inst197 )
    ( on_board inst70 sat000 )
    ( supports inst70 mode70 )
    ( calibration_target inst70 dir974 )
    ( not_calibrated inst70 )
    ( on_board inst126 sat000 )
    ( supports inst126 mode126 )
    ( calibration_target inst126 dir974 )
    ( not_calibrated inst126 )
    ( on_board inst482 sat000 )
    ( supports inst482 mode482 )
    ( calibration_target inst482 dir974 )
    ( not_calibrated inst482 )
    ( on_board inst790 sat000 )
    ( supports inst790 mode790 )
    ( calibration_target inst790 dir974 )
    ( not_calibrated inst790 )
    ( on_board inst966 sat000 )
    ( supports inst966 mode966 )
    ( calibration_target inst966 dir974 )
    ( not_calibrated inst966 )
    ( on_board inst627 sat000 )
    ( supports inst627 mode627 )
    ( calibration_target inst627 dir974 )
    ( not_calibrated inst627 )
    ( on_board inst94 sat000 )
    ( supports inst94 mode94 )
    ( calibration_target inst94 dir974 )
    ( not_calibrated inst94 )
    ( on_board inst555 sat000 )
    ( supports inst555 mode555 )
    ( calibration_target inst555 dir974 )
    ( not_calibrated inst555 )
    ( on_board inst426 sat000 )
    ( supports inst426 mode426 )
    ( calibration_target inst426 dir974 )
    ( not_calibrated inst426 )
  )
  ( :goal
    ( and
      ( have_image dir378 mode153 )
      ( have_image dir308 mode296 )
      ( have_image dir346 mode197 )
      ( have_image dir272 mode70 )
      ( have_image dir817 mode126 )
      ( have_image dir916 mode482 )
      ( have_image dir739 mode790 )
      ( have_image dir62 mode966 )
      ( have_image dir603 mode627 )
      ( have_image dir597 mode94 )
      ( have_image dir264 mode555 )
      ( have_image dir407 mode426 )
    )
  )
)
