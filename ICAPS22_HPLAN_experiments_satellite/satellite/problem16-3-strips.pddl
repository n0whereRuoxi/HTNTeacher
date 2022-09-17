( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir608 - direction
    dir611 - direction
    dir989 - direction
    dir921 - direction
    dir520 - direction
    dir854 - direction
    dir101 - direction
    dir720 - direction
    dir712 - direction
    dir240 - direction
    dir780 - direction
    dir956 - direction
    dir675 - direction
    dir235 - direction
    dir537 - direction
    dir21 - direction
    dir426 - direction
    dir790 - direction
    mode258 - mode
    inst258 - instrument
    mode483 - mode
    inst483 - instrument
    mode253 - mode
    inst253 - instrument
    mode493 - mode
    inst493 - instrument
    mode437 - mode
    inst437 - instrument
    mode569 - mode
    inst569 - instrument
    mode741 - mode
    inst741 - instrument
    mode399 - mode
    inst399 - instrument
    mode595 - mode
    inst595 - instrument
    mode273 - mode
    inst273 - instrument
    mode303 - mode
    inst303 - instrument
    mode643 - mode
    inst643 - instrument
    mode915 - mode
    inst915 - instrument
    mode676 - mode
    inst676 - instrument
    mode165 - mode
    inst165 - instrument
    mode91 - mode
    inst91 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir608 )
    ( on_board inst258 sat000 )
    ( supports inst258 mode258 )
    ( calibration_target inst258 dir611 )
    ( not_calibrated inst258 )
    ( on_board inst483 sat000 )
    ( supports inst483 mode483 )
    ( calibration_target inst483 dir611 )
    ( not_calibrated inst483 )
    ( on_board inst253 sat000 )
    ( supports inst253 mode253 )
    ( calibration_target inst253 dir611 )
    ( not_calibrated inst253 )
    ( on_board inst493 sat000 )
    ( supports inst493 mode493 )
    ( calibration_target inst493 dir611 )
    ( not_calibrated inst493 )
    ( on_board inst437 sat000 )
    ( supports inst437 mode437 )
    ( calibration_target inst437 dir611 )
    ( not_calibrated inst437 )
    ( on_board inst569 sat000 )
    ( supports inst569 mode569 )
    ( calibration_target inst569 dir611 )
    ( not_calibrated inst569 )
    ( on_board inst741 sat000 )
    ( supports inst741 mode741 )
    ( calibration_target inst741 dir611 )
    ( not_calibrated inst741 )
    ( on_board inst399 sat000 )
    ( supports inst399 mode399 )
    ( calibration_target inst399 dir611 )
    ( not_calibrated inst399 )
    ( on_board inst595 sat000 )
    ( supports inst595 mode595 )
    ( calibration_target inst595 dir611 )
    ( not_calibrated inst595 )
    ( on_board inst273 sat000 )
    ( supports inst273 mode273 )
    ( calibration_target inst273 dir611 )
    ( not_calibrated inst273 )
    ( on_board inst303 sat000 )
    ( supports inst303 mode303 )
    ( calibration_target inst303 dir611 )
    ( not_calibrated inst303 )
    ( on_board inst643 sat000 )
    ( supports inst643 mode643 )
    ( calibration_target inst643 dir611 )
    ( not_calibrated inst643 )
    ( on_board inst915 sat000 )
    ( supports inst915 mode915 )
    ( calibration_target inst915 dir611 )
    ( not_calibrated inst915 )
    ( on_board inst676 sat000 )
    ( supports inst676 mode676 )
    ( calibration_target inst676 dir611 )
    ( not_calibrated inst676 )
    ( on_board inst165 sat000 )
    ( supports inst165 mode165 )
    ( calibration_target inst165 dir611 )
    ( not_calibrated inst165 )
    ( on_board inst91 sat000 )
    ( supports inst91 mode91 )
    ( calibration_target inst91 dir611 )
    ( not_calibrated inst91 )
  )
  ( :goal
    ( and
      ( have_image dir989 mode258 )
      ( have_image dir921 mode483 )
      ( have_image dir520 mode253 )
      ( have_image dir854 mode493 )
      ( have_image dir101 mode437 )
      ( have_image dir720 mode569 )
      ( have_image dir712 mode741 )
      ( have_image dir240 mode399 )
      ( have_image dir780 mode595 )
      ( have_image dir956 mode273 )
      ( have_image dir675 mode303 )
      ( have_image dir235 mode643 )
      ( have_image dir537 mode915 )
      ( have_image dir21 mode676 )
      ( have_image dir426 mode165 )
      ( have_image dir790 mode91 )
    )
  )
)
