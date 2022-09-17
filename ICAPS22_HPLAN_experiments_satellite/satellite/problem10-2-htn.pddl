( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir245 - direction
    dir384 - direction
    dir980 - direction
    dir679 - direction
    dir152 - direction
    dir567 - direction
    dir624 - direction
    dir696 - direction
    dir272 - direction
    dir203 - direction
    dir363 - direction
    dir895 - direction
    mode165 - mode
    inst165 - instrument
    mode103 - mode
    inst103 - instrument
    mode557 - mode
    inst557 - instrument
    mode296 - mode
    inst296 - instrument
    mode431 - mode
    inst431 - instrument
    mode171 - mode
    inst171 - instrument
    mode42 - mode
    inst42 - instrument
    mode150 - mode
    inst150 - instrument
    mode539 - mode
    inst539 - instrument
    mode229 - mode
    inst229 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir245 )
    ( on_board inst165 sat000 )
    ( supports inst165 mode165 )
    ( calibration_target inst165 dir384 )
    ( not_calibrated inst165 )
    ( on_board inst103 sat000 )
    ( supports inst103 mode103 )
    ( calibration_target inst103 dir384 )
    ( not_calibrated inst103 )
    ( on_board inst557 sat000 )
    ( supports inst557 mode557 )
    ( calibration_target inst557 dir384 )
    ( not_calibrated inst557 )
    ( on_board inst296 sat000 )
    ( supports inst296 mode296 )
    ( calibration_target inst296 dir384 )
    ( not_calibrated inst296 )
    ( on_board inst431 sat000 )
    ( supports inst431 mode431 )
    ( calibration_target inst431 dir384 )
    ( not_calibrated inst431 )
    ( on_board inst171 sat000 )
    ( supports inst171 mode171 )
    ( calibration_target inst171 dir384 )
    ( not_calibrated inst171 )
    ( on_board inst42 sat000 )
    ( supports inst42 mode42 )
    ( calibration_target inst42 dir384 )
    ( not_calibrated inst42 )
    ( on_board inst150 sat000 )
    ( supports inst150 mode150 )
    ( calibration_target inst150 dir384 )
    ( not_calibrated inst150 )
    ( on_board inst539 sat000 )
    ( supports inst539 mode539 )
    ( calibration_target inst539 dir384 )
    ( not_calibrated inst539 )
    ( on_board inst229 sat000 )
    ( supports inst229 mode229 )
    ( calibration_target inst229 dir384 )
    ( not_calibrated inst229 )
  )
  ( :tasks
    ( Get-10Image dir980 mode165 dir679 mode103 dir152 mode557 dir567 mode296 dir624 mode431 dir696 mode171 dir272 mode42 dir203 mode150 dir363 mode539 dir895 mode229 )
  )
)
