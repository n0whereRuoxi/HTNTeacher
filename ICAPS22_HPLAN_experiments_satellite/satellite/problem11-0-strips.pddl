( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir673 - direction
    dir99 - direction
    dir287 - direction
    dir658 - direction
    dir508 - direction
    dir535 - direction
    dir860 - direction
    dir684 - direction
    dir951 - direction
    dir995 - direction
    dir35 - direction
    dir33 - direction
    dir848 - direction
    mode101 - mode
    inst101 - instrument
    mode28 - mode
    inst28 - instrument
    mode648 - mode
    inst648 - instrument
    mode5 - mode
    inst5 - instrument
    mode116 - mode
    inst116 - instrument
    mode138 - mode
    inst138 - instrument
    mode715 - mode
    inst715 - instrument
    mode560 - mode
    inst560 - instrument
    mode435 - mode
    inst435 - instrument
    mode859 - mode
    inst859 - instrument
    mode126 - mode
    inst126 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir673 )
    ( on_board inst101 sat000 )
    ( supports inst101 mode101 )
    ( calibration_target inst101 dir99 )
    ( not_calibrated inst101 )
    ( on_board inst28 sat000 )
    ( supports inst28 mode28 )
    ( calibration_target inst28 dir99 )
    ( not_calibrated inst28 )
    ( on_board inst648 sat000 )
    ( supports inst648 mode648 )
    ( calibration_target inst648 dir99 )
    ( not_calibrated inst648 )
    ( on_board inst5 sat000 )
    ( supports inst5 mode5 )
    ( calibration_target inst5 dir99 )
    ( not_calibrated inst5 )
    ( on_board inst116 sat000 )
    ( supports inst116 mode116 )
    ( calibration_target inst116 dir99 )
    ( not_calibrated inst116 )
    ( on_board inst138 sat000 )
    ( supports inst138 mode138 )
    ( calibration_target inst138 dir99 )
    ( not_calibrated inst138 )
    ( on_board inst715 sat000 )
    ( supports inst715 mode715 )
    ( calibration_target inst715 dir99 )
    ( not_calibrated inst715 )
    ( on_board inst560 sat000 )
    ( supports inst560 mode560 )
    ( calibration_target inst560 dir99 )
    ( not_calibrated inst560 )
    ( on_board inst435 sat000 )
    ( supports inst435 mode435 )
    ( calibration_target inst435 dir99 )
    ( not_calibrated inst435 )
    ( on_board inst859 sat000 )
    ( supports inst859 mode859 )
    ( calibration_target inst859 dir99 )
    ( not_calibrated inst859 )
    ( on_board inst126 sat000 )
    ( supports inst126 mode126 )
    ( calibration_target inst126 dir99 )
    ( not_calibrated inst126 )
  )
  ( :goal
    ( and
      ( have_image dir287 mode101 )
      ( have_image dir658 mode28 )
      ( have_image dir508 mode648 )
      ( have_image dir535 mode5 )
      ( have_image dir860 mode116 )
      ( have_image dir684 mode138 )
      ( have_image dir951 mode715 )
      ( have_image dir995 mode560 )
      ( have_image dir35 mode435 )
      ( have_image dir33 mode859 )
      ( have_image dir848 mode126 )
    )
  )
)
