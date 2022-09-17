( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir163 - direction
    dir860 - direction
    dir345 - direction
    dir379 - direction
    dir601 - direction
    dir639 - direction
    dir509 - direction
    dir157 - direction
    dir797 - direction
    dir821 - direction
    dir665 - direction
    dir839 - direction
    dir859 - direction
    dir65 - direction
    dir599 - direction
    dir503 - direction
    dir351 - direction
    mode63 - mode
    inst63 - instrument
    mode706 - mode
    inst706 - instrument
    mode553 - mode
    inst553 - instrument
    mode43 - mode
    inst43 - instrument
    mode611 - mode
    inst611 - instrument
    mode329 - mode
    inst329 - instrument
    mode888 - mode
    inst888 - instrument
    mode119 - mode
    inst119 - instrument
    mode983 - mode
    inst983 - instrument
    mode366 - mode
    inst366 - instrument
    mode172 - mode
    inst172 - instrument
    mode968 - mode
    inst968 - instrument
    mode264 - mode
    inst264 - instrument
    mode207 - mode
    inst207 - instrument
    mode116 - mode
    inst116 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir163 )
    ( on_board inst63 sat000 )
    ( supports inst63 mode63 )
    ( calibration_target inst63 dir860 )
    ( not_calibrated inst63 )
    ( on_board inst706 sat000 )
    ( supports inst706 mode706 )
    ( calibration_target inst706 dir860 )
    ( not_calibrated inst706 )
    ( on_board inst553 sat000 )
    ( supports inst553 mode553 )
    ( calibration_target inst553 dir860 )
    ( not_calibrated inst553 )
    ( on_board inst43 sat000 )
    ( supports inst43 mode43 )
    ( calibration_target inst43 dir860 )
    ( not_calibrated inst43 )
    ( on_board inst611 sat000 )
    ( supports inst611 mode611 )
    ( calibration_target inst611 dir860 )
    ( not_calibrated inst611 )
    ( on_board inst329 sat000 )
    ( supports inst329 mode329 )
    ( calibration_target inst329 dir860 )
    ( not_calibrated inst329 )
    ( on_board inst888 sat000 )
    ( supports inst888 mode888 )
    ( calibration_target inst888 dir860 )
    ( not_calibrated inst888 )
    ( on_board inst119 sat000 )
    ( supports inst119 mode119 )
    ( calibration_target inst119 dir860 )
    ( not_calibrated inst119 )
    ( on_board inst983 sat000 )
    ( supports inst983 mode983 )
    ( calibration_target inst983 dir860 )
    ( not_calibrated inst983 )
    ( on_board inst366 sat000 )
    ( supports inst366 mode366 )
    ( calibration_target inst366 dir860 )
    ( not_calibrated inst366 )
    ( on_board inst172 sat000 )
    ( supports inst172 mode172 )
    ( calibration_target inst172 dir860 )
    ( not_calibrated inst172 )
    ( on_board inst968 sat000 )
    ( supports inst968 mode968 )
    ( calibration_target inst968 dir860 )
    ( not_calibrated inst968 )
    ( on_board inst264 sat000 )
    ( supports inst264 mode264 )
    ( calibration_target inst264 dir860 )
    ( not_calibrated inst264 )
    ( on_board inst207 sat000 )
    ( supports inst207 mode207 )
    ( calibration_target inst207 dir860 )
    ( not_calibrated inst207 )
    ( on_board inst116 sat000 )
    ( supports inst116 mode116 )
    ( calibration_target inst116 dir860 )
    ( not_calibrated inst116 )
  )
  ( :goal
    ( and
      ( have_image dir345 mode63 )
      ( have_image dir379 mode706 )
      ( have_image dir601 mode553 )
      ( have_image dir639 mode43 )
      ( have_image dir509 mode611 )
      ( have_image dir157 mode329 )
      ( have_image dir797 mode888 )
      ( have_image dir821 mode119 )
      ( have_image dir665 mode983 )
      ( have_image dir839 mode366 )
      ( have_image dir859 mode172 )
      ( have_image dir65 mode968 )
      ( have_image dir599 mode264 )
      ( have_image dir503 mode207 )
      ( have_image dir351 mode116 )
    )
  )
)
