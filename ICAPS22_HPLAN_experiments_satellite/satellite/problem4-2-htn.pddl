( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir585 - direction
    dir693 - direction
    dir44 - direction
    dir697 - direction
    dir250 - direction
    dir460 - direction
    mode637 - mode
    inst637 - instrument
    mode248 - mode
    inst248 - instrument
    mode51 - mode
    inst51 - instrument
    mode2 - mode
    inst2 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir585 )
    ( on_board inst637 sat000 )
    ( supports inst637 mode637 )
    ( calibration_target inst637 dir693 )
    ( not_calibrated inst637 )
    ( on_board inst248 sat000 )
    ( supports inst248 mode248 )
    ( calibration_target inst248 dir693 )
    ( not_calibrated inst248 )
    ( on_board inst51 sat000 )
    ( supports inst51 mode51 )
    ( calibration_target inst51 dir693 )
    ( not_calibrated inst51 )
    ( on_board inst2 sat000 )
    ( supports inst2 mode2 )
    ( calibration_target inst2 dir693 )
    ( not_calibrated inst2 )
  )
  ( :tasks
    ( Get-4Image dir44 mode637 dir697 mode248 dir250 mode51 dir460 mode2 )
  )
)
