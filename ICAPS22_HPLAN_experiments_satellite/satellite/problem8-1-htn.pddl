( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir869 - direction
    dir112 - direction
    dir891 - direction
    dir384 - direction
    dir907 - direction
    dir940 - direction
    dir64 - direction
    dir108 - direction
    dir173 - direction
    dir433 - direction
    mode82 - mode
    inst82 - instrument
    mode349 - mode
    inst349 - instrument
    mode424 - mode
    inst424 - instrument
    mode863 - mode
    inst863 - instrument
    mode480 - mode
    inst480 - instrument
    mode921 - mode
    inst921 - instrument
    mode180 - mode
    inst180 - instrument
    mode111 - mode
    inst111 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir869 )
    ( on_board inst82 sat000 )
    ( supports inst82 mode82 )
    ( calibration_target inst82 dir112 )
    ( not_calibrated inst82 )
    ( on_board inst349 sat000 )
    ( supports inst349 mode349 )
    ( calibration_target inst349 dir112 )
    ( not_calibrated inst349 )
    ( on_board inst424 sat000 )
    ( supports inst424 mode424 )
    ( calibration_target inst424 dir112 )
    ( not_calibrated inst424 )
    ( on_board inst863 sat000 )
    ( supports inst863 mode863 )
    ( calibration_target inst863 dir112 )
    ( not_calibrated inst863 )
    ( on_board inst480 sat000 )
    ( supports inst480 mode480 )
    ( calibration_target inst480 dir112 )
    ( not_calibrated inst480 )
    ( on_board inst921 sat000 )
    ( supports inst921 mode921 )
    ( calibration_target inst921 dir112 )
    ( not_calibrated inst921 )
    ( on_board inst180 sat000 )
    ( supports inst180 mode180 )
    ( calibration_target inst180 dir112 )
    ( not_calibrated inst180 )
    ( on_board inst111 sat000 )
    ( supports inst111 mode111 )
    ( calibration_target inst111 dir112 )
    ( not_calibrated inst111 )
  )
  ( :tasks
    ( Get-8Image dir891 mode82 dir384 mode349 dir907 mode424 dir940 mode863 dir64 mode480 dir108 mode921 dir173 mode180 dir433 mode111 )
  )
)
