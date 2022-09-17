( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir535 - direction
    dir191 - direction
    dir547 - direction
    dir678 - direction
    dir829 - direction
    dir447 - direction
    dir280 - direction
    mode618 - mode
    inst618 - instrument
    mode472 - mode
    inst472 - instrument
    mode34 - mode
    inst34 - instrument
    mode323 - mode
    inst323 - instrument
    mode917 - mode
    inst917 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir535 )
    ( on_board inst618 sat000 )
    ( supports inst618 mode618 )
    ( calibration_target inst618 dir191 )
    ( not_calibrated inst618 )
    ( on_board inst472 sat000 )
    ( supports inst472 mode472 )
    ( calibration_target inst472 dir191 )
    ( not_calibrated inst472 )
    ( on_board inst34 sat000 )
    ( supports inst34 mode34 )
    ( calibration_target inst34 dir191 )
    ( not_calibrated inst34 )
    ( on_board inst323 sat000 )
    ( supports inst323 mode323 )
    ( calibration_target inst323 dir191 )
    ( not_calibrated inst323 )
    ( on_board inst917 sat000 )
    ( supports inst917 mode917 )
    ( calibration_target inst917 dir191 )
    ( not_calibrated inst917 )
  )
  ( :goal
    ( and
      ( have_image dir547 mode618 )
      ( have_image dir678 mode472 )
      ( have_image dir829 mode34 )
      ( have_image dir447 mode323 )
      ( have_image dir280 mode917 )
    )
  )
)
