( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir473 - direction
    dir921 - direction
    dir149 - direction
    dir932 - direction
    dir699 - direction
    dir499 - direction
    dir429 - direction
    dir735 - direction
    dir858 - direction
    dir465 - direction
    dir598 - direction
    dir299 - direction
    dir216 - direction
    dir297 - direction
    dir275 - direction
    mode954 - mode
    inst954 - instrument
    mode420 - mode
    inst420 - instrument
    mode960 - mode
    inst960 - instrument
    mode183 - mode
    inst183 - instrument
    mode744 - mode
    inst744 - instrument
    mode242 - mode
    inst242 - instrument
    mode935 - mode
    inst935 - instrument
    mode62 - mode
    inst62 - instrument
    mode173 - mode
    inst173 - instrument
    mode616 - mode
    inst616 - instrument
    mode942 - mode
    inst942 - instrument
    mode379 - mode
    inst379 - instrument
    mode377 - mode
    inst377 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir473 )
    ( on_board inst954 sat000 )
    ( supports inst954 mode954 )
    ( calibration_target inst954 dir921 )
    ( not_calibrated inst954 )
    ( on_board inst420 sat000 )
    ( supports inst420 mode420 )
    ( calibration_target inst420 dir921 )
    ( not_calibrated inst420 )
    ( on_board inst960 sat000 )
    ( supports inst960 mode960 )
    ( calibration_target inst960 dir921 )
    ( not_calibrated inst960 )
    ( on_board inst183 sat000 )
    ( supports inst183 mode183 )
    ( calibration_target inst183 dir921 )
    ( not_calibrated inst183 )
    ( on_board inst744 sat000 )
    ( supports inst744 mode744 )
    ( calibration_target inst744 dir921 )
    ( not_calibrated inst744 )
    ( on_board inst242 sat000 )
    ( supports inst242 mode242 )
    ( calibration_target inst242 dir921 )
    ( not_calibrated inst242 )
    ( on_board inst935 sat000 )
    ( supports inst935 mode935 )
    ( calibration_target inst935 dir921 )
    ( not_calibrated inst935 )
    ( on_board inst62 sat000 )
    ( supports inst62 mode62 )
    ( calibration_target inst62 dir921 )
    ( not_calibrated inst62 )
    ( on_board inst173 sat000 )
    ( supports inst173 mode173 )
    ( calibration_target inst173 dir921 )
    ( not_calibrated inst173 )
    ( on_board inst616 sat000 )
    ( supports inst616 mode616 )
    ( calibration_target inst616 dir921 )
    ( not_calibrated inst616 )
    ( on_board inst942 sat000 )
    ( supports inst942 mode942 )
    ( calibration_target inst942 dir921 )
    ( not_calibrated inst942 )
    ( on_board inst379 sat000 )
    ( supports inst379 mode379 )
    ( calibration_target inst379 dir921 )
    ( not_calibrated inst379 )
    ( on_board inst377 sat000 )
    ( supports inst377 mode377 )
    ( calibration_target inst377 dir921 )
    ( not_calibrated inst377 )
  )
  ( :goal
    ( and
      ( have_image dir149 mode954 )
      ( have_image dir932 mode420 )
      ( have_image dir699 mode960 )
      ( have_image dir499 mode183 )
      ( have_image dir429 mode744 )
      ( have_image dir735 mode242 )
      ( have_image dir858 mode935 )
      ( have_image dir465 mode62 )
      ( have_image dir598 mode173 )
      ( have_image dir299 mode616 )
      ( have_image dir216 mode942 )
      ( have_image dir297 mode379 )
      ( have_image dir275 mode377 )
    )
  )
)
