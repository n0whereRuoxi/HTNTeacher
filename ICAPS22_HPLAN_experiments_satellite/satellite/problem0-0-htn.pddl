( define ( htn-problem probname )
  ( :domain Satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir000 - direction
    dir001 - direction
    dir002 - direction
    mode000 - mode
    inst000-000 - instrument
  )

  ( :init
    ( pointing sat000 dir000 )
    ( power_avail sat000 )
    ( on_board inst000-000 sat000 )
    ( supports inst000-000 mode000 )
    ( calibration_target inst000-000 dir001 )
    ( not_calibrated inst000-000 )
  )
  ( :tasks
    ( GET_IMAGE dir002 mode000 )
  )
)


