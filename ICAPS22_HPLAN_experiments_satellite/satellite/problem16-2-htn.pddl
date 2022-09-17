( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir341 - direction
    dir164 - direction
    dir735 - direction
    dir883 - direction
    dir389 - direction
    dir983 - direction
    dir219 - direction
    dir481 - direction
    dir758 - direction
    dir407 - direction
    dir751 - direction
    dir78 - direction
    dir737 - direction
    dir940 - direction
    dir480 - direction
    dir421 - direction
    dir381 - direction
    dir764 - direction
    mode527 - mode
    inst527 - instrument
    mode728 - mode
    inst728 - instrument
    mode657 - mode
    inst657 - instrument
    mode989 - mode
    inst989 - instrument
    mode480 - mode
    inst480 - instrument
    mode895 - mode
    inst895 - instrument
    mode185 - mode
    inst185 - instrument
    mode326 - mode
    inst326 - instrument
    mode898 - mode
    inst898 - instrument
    mode303 - mode
    inst303 - instrument
    mode719 - mode
    inst719 - instrument
    mode7 - mode
    inst7 - instrument
    mode706 - mode
    inst706 - instrument
    mode92 - mode
    inst92 - instrument
    mode809 - mode
    inst809 - instrument
    mode178 - mode
    inst178 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir341 )
    ( on_board inst527 sat000 )
    ( supports inst527 mode527 )
    ( calibration_target inst527 dir164 )
    ( not_calibrated inst527 )
    ( on_board inst728 sat000 )
    ( supports inst728 mode728 )
    ( calibration_target inst728 dir164 )
    ( not_calibrated inst728 )
    ( on_board inst657 sat000 )
    ( supports inst657 mode657 )
    ( calibration_target inst657 dir164 )
    ( not_calibrated inst657 )
    ( on_board inst989 sat000 )
    ( supports inst989 mode989 )
    ( calibration_target inst989 dir164 )
    ( not_calibrated inst989 )
    ( on_board inst480 sat000 )
    ( supports inst480 mode480 )
    ( calibration_target inst480 dir164 )
    ( not_calibrated inst480 )
    ( on_board inst895 sat000 )
    ( supports inst895 mode895 )
    ( calibration_target inst895 dir164 )
    ( not_calibrated inst895 )
    ( on_board inst185 sat000 )
    ( supports inst185 mode185 )
    ( calibration_target inst185 dir164 )
    ( not_calibrated inst185 )
    ( on_board inst326 sat000 )
    ( supports inst326 mode326 )
    ( calibration_target inst326 dir164 )
    ( not_calibrated inst326 )
    ( on_board inst898 sat000 )
    ( supports inst898 mode898 )
    ( calibration_target inst898 dir164 )
    ( not_calibrated inst898 )
    ( on_board inst303 sat000 )
    ( supports inst303 mode303 )
    ( calibration_target inst303 dir164 )
    ( not_calibrated inst303 )
    ( on_board inst719 sat000 )
    ( supports inst719 mode719 )
    ( calibration_target inst719 dir164 )
    ( not_calibrated inst719 )
    ( on_board inst7 sat000 )
    ( supports inst7 mode7 )
    ( calibration_target inst7 dir164 )
    ( not_calibrated inst7 )
    ( on_board inst706 sat000 )
    ( supports inst706 mode706 )
    ( calibration_target inst706 dir164 )
    ( not_calibrated inst706 )
    ( on_board inst92 sat000 )
    ( supports inst92 mode92 )
    ( calibration_target inst92 dir164 )
    ( not_calibrated inst92 )
    ( on_board inst809 sat000 )
    ( supports inst809 mode809 )
    ( calibration_target inst809 dir164 )
    ( not_calibrated inst809 )
    ( on_board inst178 sat000 )
    ( supports inst178 mode178 )
    ( calibration_target inst178 dir164 )
    ( not_calibrated inst178 )
  )
  ( :tasks
    ( Get-16Image dir735 mode527 dir883 mode728 dir389 mode657 dir983 mode989 dir219 mode480 dir481 mode895 dir758 mode185 dir407 mode326 dir751 mode898 dir78 mode303 dir737 mode719 dir940 mode7 dir480 mode706 dir421 mode92 dir381 mode809 dir764 mode178 )
  )
)
