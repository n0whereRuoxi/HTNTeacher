( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir803 - direction
    dir119 - direction
    dir710 - direction
    dir248 - direction
    dir272 - direction
    dir333 - direction
    dir551 - direction
    dir346 - direction
    dir982 - direction
    dir740 - direction
    dir155 - direction
    dir437 - direction
    mode352 - mode
    inst352 - instrument
    mode829 - mode
    inst829 - instrument
    mode652 - mode
    inst652 - instrument
    mode16 - mode
    inst16 - instrument
    mode268 - mode
    inst268 - instrument
    mode30 - mode
    inst30 - instrument
    mode573 - mode
    inst573 - instrument
    mode975 - mode
    inst975 - instrument
    mode496 - mode
    inst496 - instrument
    mode197 - mode
    inst197 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir803 )
    ( on_board inst352 sat000 )
    ( supports inst352 mode352 )
    ( calibration_target inst352 dir119 )
    ( not_calibrated inst352 )
    ( on_board inst829 sat000 )
    ( supports inst829 mode829 )
    ( calibration_target inst829 dir119 )
    ( not_calibrated inst829 )
    ( on_board inst652 sat000 )
    ( supports inst652 mode652 )
    ( calibration_target inst652 dir119 )
    ( not_calibrated inst652 )
    ( on_board inst16 sat000 )
    ( supports inst16 mode16 )
    ( calibration_target inst16 dir119 )
    ( not_calibrated inst16 )
    ( on_board inst268 sat000 )
    ( supports inst268 mode268 )
    ( calibration_target inst268 dir119 )
    ( not_calibrated inst268 )
    ( on_board inst30 sat000 )
    ( supports inst30 mode30 )
    ( calibration_target inst30 dir119 )
    ( not_calibrated inst30 )
    ( on_board inst573 sat000 )
    ( supports inst573 mode573 )
    ( calibration_target inst573 dir119 )
    ( not_calibrated inst573 )
    ( on_board inst975 sat000 )
    ( supports inst975 mode975 )
    ( calibration_target inst975 dir119 )
    ( not_calibrated inst975 )
    ( on_board inst496 sat000 )
    ( supports inst496 mode496 )
    ( calibration_target inst496 dir119 )
    ( not_calibrated inst496 )
    ( on_board inst197 sat000 )
    ( supports inst197 mode197 )
    ( calibration_target inst197 dir119 )
    ( not_calibrated inst197 )
  )
  ( :tasks
    ( Get-10Image dir710 mode352 dir248 mode829 dir272 mode652 dir333 mode16 dir551 mode268 dir346 mode30 dir982 mode573 dir740 mode975 dir155 mode496 dir437 mode197 )
  )
)
