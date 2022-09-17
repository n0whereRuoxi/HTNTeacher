( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir429 - direction
    dir669 - direction
    dir503 - direction
    dir44 - direction
    dir625 - direction
    dir747 - direction
    mode359 - mode
    inst359 - instrument
    mode93 - mode
    inst93 - instrument
    mode762 - mode
    inst762 - instrument
    mode214 - mode
    inst214 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir429 )
    ( on_board inst359 sat000 )
    ( supports inst359 mode359 )
    ( calibration_target inst359 dir669 )
    ( not_calibrated inst359 )
    ( on_board inst93 sat000 )
    ( supports inst93 mode93 )
    ( calibration_target inst93 dir669 )
    ( not_calibrated inst93 )
    ( on_board inst762 sat000 )
    ( supports inst762 mode762 )
    ( calibration_target inst762 dir669 )
    ( not_calibrated inst762 )
    ( on_board inst214 sat000 )
    ( supports inst214 mode214 )
    ( calibration_target inst214 dir669 )
    ( not_calibrated inst214 )
  )
  ( :goal
    ( and
      ( have_image dir503 mode359 )
      ( have_image dir44 mode93 )
      ( have_image dir625 mode762 )
      ( have_image dir747 mode214 )
    )
  )
)
