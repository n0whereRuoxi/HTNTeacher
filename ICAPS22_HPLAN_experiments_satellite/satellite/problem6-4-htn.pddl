( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir984 - direction
    dir271 - direction
    dir899 - direction
    dir430 - direction
    dir482 - direction
    dir258 - direction
    dir661 - direction
    dir549 - direction
    mode884 - mode
    inst884 - instrument
    mode314 - mode
    inst314 - instrument
    mode113 - mode
    inst113 - instrument
    mode356 - mode
    inst356 - instrument
    mode661 - mode
    inst661 - instrument
    mode185 - mode
    inst185 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir984 )
    ( on_board inst884 sat000 )
    ( supports inst884 mode884 )
    ( calibration_target inst884 dir271 )
    ( not_calibrated inst884 )
    ( on_board inst314 sat000 )
    ( supports inst314 mode314 )
    ( calibration_target inst314 dir271 )
    ( not_calibrated inst314 )
    ( on_board inst113 sat000 )
    ( supports inst113 mode113 )
    ( calibration_target inst113 dir271 )
    ( not_calibrated inst113 )
    ( on_board inst356 sat000 )
    ( supports inst356 mode356 )
    ( calibration_target inst356 dir271 )
    ( not_calibrated inst356 )
    ( on_board inst661 sat000 )
    ( supports inst661 mode661 )
    ( calibration_target inst661 dir271 )
    ( not_calibrated inst661 )
    ( on_board inst185 sat000 )
    ( supports inst185 mode185 )
    ( calibration_target inst185 dir271 )
    ( not_calibrated inst185 )
  )
  ( :tasks
    ( Get-6Image dir899 mode884 dir430 mode314 dir482 mode113 dir258 mode356 dir661 mode661 dir549 mode185 )
  )
)
