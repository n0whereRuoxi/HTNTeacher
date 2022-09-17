( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir431 - direction
    dir555 - direction
    dir678 - direction
    dir414 - direction
    dir811 - direction
    dir71 - direction
    dir359 - direction
    dir826 - direction
    dir443 - direction
    dir270 - direction
    dir326 - direction
    dir173 - direction
    dir963 - direction
    dir525 - direction
    dir251 - direction
    dir222 - direction
    dir936 - direction
    dir463 - direction
    mode519 - mode
    inst519 - instrument
    mode494 - mode
    inst494 - instrument
    mode277 - mode
    inst277 - instrument
    mode876 - mode
    inst876 - instrument
    mode253 - mode
    inst253 - instrument
    mode155 - mode
    inst155 - instrument
    mode555 - mode
    inst555 - instrument
    mode749 - mode
    inst749 - instrument
    mode205 - mode
    inst205 - instrument
    mode548 - mode
    inst548 - instrument
    mode434 - mode
    inst434 - instrument
    mode442 - mode
    inst442 - instrument
    mode725 - mode
    inst725 - instrument
    mode697 - mode
    inst697 - instrument
    mode979 - mode
    inst979 - instrument
    mode211 - mode
    inst211 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir431 )
    ( on_board inst519 sat000 )
    ( supports inst519 mode519 )
    ( calibration_target inst519 dir555 )
    ( not_calibrated inst519 )
    ( on_board inst494 sat000 )
    ( supports inst494 mode494 )
    ( calibration_target inst494 dir555 )
    ( not_calibrated inst494 )
    ( on_board inst277 sat000 )
    ( supports inst277 mode277 )
    ( calibration_target inst277 dir555 )
    ( not_calibrated inst277 )
    ( on_board inst876 sat000 )
    ( supports inst876 mode876 )
    ( calibration_target inst876 dir555 )
    ( not_calibrated inst876 )
    ( on_board inst253 sat000 )
    ( supports inst253 mode253 )
    ( calibration_target inst253 dir555 )
    ( not_calibrated inst253 )
    ( on_board inst155 sat000 )
    ( supports inst155 mode155 )
    ( calibration_target inst155 dir555 )
    ( not_calibrated inst155 )
    ( on_board inst555 sat000 )
    ( supports inst555 mode555 )
    ( calibration_target inst555 dir555 )
    ( not_calibrated inst555 )
    ( on_board inst749 sat000 )
    ( supports inst749 mode749 )
    ( calibration_target inst749 dir555 )
    ( not_calibrated inst749 )
    ( on_board inst205 sat000 )
    ( supports inst205 mode205 )
    ( calibration_target inst205 dir555 )
    ( not_calibrated inst205 )
    ( on_board inst548 sat000 )
    ( supports inst548 mode548 )
    ( calibration_target inst548 dir555 )
    ( not_calibrated inst548 )
    ( on_board inst434 sat000 )
    ( supports inst434 mode434 )
    ( calibration_target inst434 dir555 )
    ( not_calibrated inst434 )
    ( on_board inst442 sat000 )
    ( supports inst442 mode442 )
    ( calibration_target inst442 dir555 )
    ( not_calibrated inst442 )
    ( on_board inst725 sat000 )
    ( supports inst725 mode725 )
    ( calibration_target inst725 dir555 )
    ( not_calibrated inst725 )
    ( on_board inst697 sat000 )
    ( supports inst697 mode697 )
    ( calibration_target inst697 dir555 )
    ( not_calibrated inst697 )
    ( on_board inst979 sat000 )
    ( supports inst979 mode979 )
    ( calibration_target inst979 dir555 )
    ( not_calibrated inst979 )
    ( on_board inst211 sat000 )
    ( supports inst211 mode211 )
    ( calibration_target inst211 dir555 )
    ( not_calibrated inst211 )
  )
  ( :tasks
    ( Get-16Image dir678 mode519 dir414 mode494 dir811 mode277 dir71 mode876 dir359 mode253 dir826 mode155 dir443 mode555 dir270 mode749 dir326 mode205 dir173 mode548 dir963 mode434 dir525 mode442 dir251 mode725 dir222 mode697 dir936 mode979 dir463 mode211 )
  )
)
