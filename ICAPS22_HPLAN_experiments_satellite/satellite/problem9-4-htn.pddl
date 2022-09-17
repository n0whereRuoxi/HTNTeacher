( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir91 - direction
    dir580 - direction
    dir641 - direction
    dir749 - direction
    dir252 - direction
    dir295 - direction
    dir620 - direction
    dir95 - direction
    dir489 - direction
    dir704 - direction
    dir539 - direction
    mode67 - mode
    inst67 - instrument
    mode309 - mode
    inst309 - instrument
    mode46 - mode
    inst46 - instrument
    mode256 - mode
    inst256 - instrument
    mode162 - mode
    inst162 - instrument
    mode746 - mode
    inst746 - instrument
    mode889 - mode
    inst889 - instrument
    mode312 - mode
    inst312 - instrument
    mode244 - mode
    inst244 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir91 )
    ( on_board inst67 sat000 )
    ( supports inst67 mode67 )
    ( calibration_target inst67 dir580 )
    ( not_calibrated inst67 )
    ( on_board inst309 sat000 )
    ( supports inst309 mode309 )
    ( calibration_target inst309 dir580 )
    ( not_calibrated inst309 )
    ( on_board inst46 sat000 )
    ( supports inst46 mode46 )
    ( calibration_target inst46 dir580 )
    ( not_calibrated inst46 )
    ( on_board inst256 sat000 )
    ( supports inst256 mode256 )
    ( calibration_target inst256 dir580 )
    ( not_calibrated inst256 )
    ( on_board inst162 sat000 )
    ( supports inst162 mode162 )
    ( calibration_target inst162 dir580 )
    ( not_calibrated inst162 )
    ( on_board inst746 sat000 )
    ( supports inst746 mode746 )
    ( calibration_target inst746 dir580 )
    ( not_calibrated inst746 )
    ( on_board inst889 sat000 )
    ( supports inst889 mode889 )
    ( calibration_target inst889 dir580 )
    ( not_calibrated inst889 )
    ( on_board inst312 sat000 )
    ( supports inst312 mode312 )
    ( calibration_target inst312 dir580 )
    ( not_calibrated inst312 )
    ( on_board inst244 sat000 )
    ( supports inst244 mode244 )
    ( calibration_target inst244 dir580 )
    ( not_calibrated inst244 )
  )
  ( :tasks
    ( Get-9Image dir641 mode67 dir749 mode309 dir252 mode46 dir295 mode256 dir620 mode162 dir95 mode746 dir489 mode889 dir704 mode312 dir539 mode244 )
  )
)
