( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir46 - direction
    dir355 - direction
    dir380 - direction
    dir741 - direction
    dir708 - direction
    dir316 - direction
    dir874 - direction
    mode640 - mode
    inst640 - instrument
    mode393 - mode
    inst393 - instrument
    mode684 - mode
    inst684 - instrument
    mode457 - mode
    inst457 - instrument
    mode1 - mode
    inst1 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir46 )
    ( on_board inst640 sat000 )
    ( supports inst640 mode640 )
    ( calibration_target inst640 dir355 )
    ( not_calibrated inst640 )
    ( on_board inst393 sat000 )
    ( supports inst393 mode393 )
    ( calibration_target inst393 dir355 )
    ( not_calibrated inst393 )
    ( on_board inst684 sat000 )
    ( supports inst684 mode684 )
    ( calibration_target inst684 dir355 )
    ( not_calibrated inst684 )
    ( on_board inst457 sat000 )
    ( supports inst457 mode457 )
    ( calibration_target inst457 dir355 )
    ( not_calibrated inst457 )
    ( on_board inst1 sat000 )
    ( supports inst1 mode1 )
    ( calibration_target inst1 dir355 )
    ( not_calibrated inst1 )
  )
  ( :goal
    ( and
      ( have_image dir380 mode640 )
      ( have_image dir741 mode393 )
      ( have_image dir708 mode684 )
      ( have_image dir316 mode457 )
      ( have_image dir874 mode1 )
    )
  )
)
