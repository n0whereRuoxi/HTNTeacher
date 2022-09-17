( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir44 - direction
    dir584 - direction
    dir577 - direction
    dir984 - direction
    dir837 - direction
    dir900 - direction
    dir276 - direction
    dir137 - direction
    dir54 - direction
    dir320 - direction
    dir466 - direction
    dir488 - direction
    dir154 - direction
    dir515 - direction
    dir555 - direction
    dir94 - direction
    dir975 - direction
    dir409 - direction
    mode411 - mode
    inst411 - instrument
    mode409 - mode
    inst409 - instrument
    mode209 - mode
    inst209 - instrument
    mode31 - mode
    inst31 - instrument
    mode956 - mode
    inst956 - instrument
    mode299 - mode
    inst299 - instrument
    mode133 - mode
    inst133 - instrument
    mode441 - mode
    inst441 - instrument
    mode125 - mode
    inst125 - instrument
    mode277 - mode
    inst277 - instrument
    mode62 - mode
    inst62 - instrument
    mode598 - mode
    inst598 - instrument
    mode404 - mode
    inst404 - instrument
    mode34 - mode
    inst34 - instrument
    mode479 - mode
    inst479 - instrument
    mode56 - mode
    inst56 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir44 )
    ( on_board inst411 sat000 )
    ( supports inst411 mode411 )
    ( calibration_target inst411 dir584 )
    ( not_calibrated inst411 )
    ( on_board inst409 sat000 )
    ( supports inst409 mode409 )
    ( calibration_target inst409 dir584 )
    ( not_calibrated inst409 )
    ( on_board inst209 sat000 )
    ( supports inst209 mode209 )
    ( calibration_target inst209 dir584 )
    ( not_calibrated inst209 )
    ( on_board inst31 sat000 )
    ( supports inst31 mode31 )
    ( calibration_target inst31 dir584 )
    ( not_calibrated inst31 )
    ( on_board inst956 sat000 )
    ( supports inst956 mode956 )
    ( calibration_target inst956 dir584 )
    ( not_calibrated inst956 )
    ( on_board inst299 sat000 )
    ( supports inst299 mode299 )
    ( calibration_target inst299 dir584 )
    ( not_calibrated inst299 )
    ( on_board inst133 sat000 )
    ( supports inst133 mode133 )
    ( calibration_target inst133 dir584 )
    ( not_calibrated inst133 )
    ( on_board inst441 sat000 )
    ( supports inst441 mode441 )
    ( calibration_target inst441 dir584 )
    ( not_calibrated inst441 )
    ( on_board inst125 sat000 )
    ( supports inst125 mode125 )
    ( calibration_target inst125 dir584 )
    ( not_calibrated inst125 )
    ( on_board inst277 sat000 )
    ( supports inst277 mode277 )
    ( calibration_target inst277 dir584 )
    ( not_calibrated inst277 )
    ( on_board inst62 sat000 )
    ( supports inst62 mode62 )
    ( calibration_target inst62 dir584 )
    ( not_calibrated inst62 )
    ( on_board inst598 sat000 )
    ( supports inst598 mode598 )
    ( calibration_target inst598 dir584 )
    ( not_calibrated inst598 )
    ( on_board inst404 sat000 )
    ( supports inst404 mode404 )
    ( calibration_target inst404 dir584 )
    ( not_calibrated inst404 )
    ( on_board inst34 sat000 )
    ( supports inst34 mode34 )
    ( calibration_target inst34 dir584 )
    ( not_calibrated inst34 )
    ( on_board inst479 sat000 )
    ( supports inst479 mode479 )
    ( calibration_target inst479 dir584 )
    ( not_calibrated inst479 )
    ( on_board inst56 sat000 )
    ( supports inst56 mode56 )
    ( calibration_target inst56 dir584 )
    ( not_calibrated inst56 )
  )
  ( :goal
    ( and
      ( have_image dir577 mode411 )
      ( have_image dir984 mode409 )
      ( have_image dir837 mode209 )
      ( have_image dir900 mode31 )
      ( have_image dir276 mode956 )
      ( have_image dir137 mode299 )
      ( have_image dir54 mode133 )
      ( have_image dir320 mode441 )
      ( have_image dir466 mode125 )
      ( have_image dir488 mode277 )
      ( have_image dir154 mode62 )
      ( have_image dir515 mode598 )
      ( have_image dir555 mode404 )
      ( have_image dir94 mode34 )
      ( have_image dir975 mode479 )
      ( have_image dir409 mode56 )
    )
  )
)
