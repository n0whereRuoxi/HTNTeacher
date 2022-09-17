( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir325 - direction
    dir306 - direction
    dir962 - direction
    dir771 - direction
    dir297 - direction
    dir305 - direction
    dir261 - direction
    dir195 - direction
    dir798 - direction
    dir748 - direction
    dir773 - direction
    dir573 - direction
    dir436 - direction
    dir46 - direction
    dir807 - direction
    dir32 - direction
    dir116 - direction
    mode737 - mode
    inst737 - instrument
    mode670 - mode
    inst670 - instrument
    mode663 - mode
    inst663 - instrument
    mode625 - mode
    inst625 - instrument
    mode230 - mode
    inst230 - instrument
    mode253 - mode
    inst253 - instrument
    mode192 - mode
    inst192 - instrument
    mode348 - mode
    inst348 - instrument
    mode852 - mode
    inst852 - instrument
    mode280 - mode
    inst280 - instrument
    mode386 - mode
    inst386 - instrument
    mode700 - mode
    inst700 - instrument
    mode246 - mode
    inst246 - instrument
    mode208 - mode
    inst208 - instrument
    mode917 - mode
    inst917 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir325 )
    ( on_board inst737 sat000 )
    ( supports inst737 mode737 )
    ( calibration_target inst737 dir306 )
    ( not_calibrated inst737 )
    ( on_board inst670 sat000 )
    ( supports inst670 mode670 )
    ( calibration_target inst670 dir306 )
    ( not_calibrated inst670 )
    ( on_board inst663 sat000 )
    ( supports inst663 mode663 )
    ( calibration_target inst663 dir306 )
    ( not_calibrated inst663 )
    ( on_board inst625 sat000 )
    ( supports inst625 mode625 )
    ( calibration_target inst625 dir306 )
    ( not_calibrated inst625 )
    ( on_board inst230 sat000 )
    ( supports inst230 mode230 )
    ( calibration_target inst230 dir306 )
    ( not_calibrated inst230 )
    ( on_board inst253 sat000 )
    ( supports inst253 mode253 )
    ( calibration_target inst253 dir306 )
    ( not_calibrated inst253 )
    ( on_board inst192 sat000 )
    ( supports inst192 mode192 )
    ( calibration_target inst192 dir306 )
    ( not_calibrated inst192 )
    ( on_board inst348 sat000 )
    ( supports inst348 mode348 )
    ( calibration_target inst348 dir306 )
    ( not_calibrated inst348 )
    ( on_board inst852 sat000 )
    ( supports inst852 mode852 )
    ( calibration_target inst852 dir306 )
    ( not_calibrated inst852 )
    ( on_board inst280 sat000 )
    ( supports inst280 mode280 )
    ( calibration_target inst280 dir306 )
    ( not_calibrated inst280 )
    ( on_board inst386 sat000 )
    ( supports inst386 mode386 )
    ( calibration_target inst386 dir306 )
    ( not_calibrated inst386 )
    ( on_board inst700 sat000 )
    ( supports inst700 mode700 )
    ( calibration_target inst700 dir306 )
    ( not_calibrated inst700 )
    ( on_board inst246 sat000 )
    ( supports inst246 mode246 )
    ( calibration_target inst246 dir306 )
    ( not_calibrated inst246 )
    ( on_board inst208 sat000 )
    ( supports inst208 mode208 )
    ( calibration_target inst208 dir306 )
    ( not_calibrated inst208 )
    ( on_board inst917 sat000 )
    ( supports inst917 mode917 )
    ( calibration_target inst917 dir306 )
    ( not_calibrated inst917 )
  )
  ( :tasks
    ( Get-15Image dir962 mode737 dir771 mode670 dir297 mode663 dir305 mode625 dir261 mode230 dir195 mode253 dir798 mode192 dir748 mode348 dir773 mode852 dir573 mode280 dir436 mode386 dir46 mode700 dir807 mode246 dir32 mode208 dir116 mode917 )
  )
)
