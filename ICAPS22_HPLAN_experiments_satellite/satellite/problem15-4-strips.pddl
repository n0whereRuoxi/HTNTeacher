( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir286 - direction
    dir83 - direction
    dir130 - direction
    dir407 - direction
    dir843 - direction
    dir581 - direction
    dir942 - direction
    dir977 - direction
    dir662 - direction
    dir135 - direction
    dir776 - direction
    dir162 - direction
    dir883 - direction
    dir655 - direction
    dir564 - direction
    dir645 - direction
    dir538 - direction
    mode205 - mode
    inst205 - instrument
    mode11 - mode
    inst11 - instrument
    mode275 - mode
    inst275 - instrument
    mode334 - mode
    inst334 - instrument
    mode57 - mode
    inst57 - instrument
    mode660 - mode
    inst660 - instrument
    mode554 - mode
    inst554 - instrument
    mode768 - mode
    inst768 - instrument
    mode974 - mode
    inst974 - instrument
    mode64 - mode
    inst64 - instrument
    mode458 - mode
    inst458 - instrument
    mode288 - mode
    inst288 - instrument
    mode644 - mode
    inst644 - instrument
    mode187 - mode
    inst187 - instrument
    mode937 - mode
    inst937 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir286 )
    ( on_board inst205 sat000 )
    ( supports inst205 mode205 )
    ( calibration_target inst205 dir83 )
    ( not_calibrated inst205 )
    ( on_board inst11 sat000 )
    ( supports inst11 mode11 )
    ( calibration_target inst11 dir83 )
    ( not_calibrated inst11 )
    ( on_board inst275 sat000 )
    ( supports inst275 mode275 )
    ( calibration_target inst275 dir83 )
    ( not_calibrated inst275 )
    ( on_board inst334 sat000 )
    ( supports inst334 mode334 )
    ( calibration_target inst334 dir83 )
    ( not_calibrated inst334 )
    ( on_board inst57 sat000 )
    ( supports inst57 mode57 )
    ( calibration_target inst57 dir83 )
    ( not_calibrated inst57 )
    ( on_board inst660 sat000 )
    ( supports inst660 mode660 )
    ( calibration_target inst660 dir83 )
    ( not_calibrated inst660 )
    ( on_board inst554 sat000 )
    ( supports inst554 mode554 )
    ( calibration_target inst554 dir83 )
    ( not_calibrated inst554 )
    ( on_board inst768 sat000 )
    ( supports inst768 mode768 )
    ( calibration_target inst768 dir83 )
    ( not_calibrated inst768 )
    ( on_board inst974 sat000 )
    ( supports inst974 mode974 )
    ( calibration_target inst974 dir83 )
    ( not_calibrated inst974 )
    ( on_board inst64 sat000 )
    ( supports inst64 mode64 )
    ( calibration_target inst64 dir83 )
    ( not_calibrated inst64 )
    ( on_board inst458 sat000 )
    ( supports inst458 mode458 )
    ( calibration_target inst458 dir83 )
    ( not_calibrated inst458 )
    ( on_board inst288 sat000 )
    ( supports inst288 mode288 )
    ( calibration_target inst288 dir83 )
    ( not_calibrated inst288 )
    ( on_board inst644 sat000 )
    ( supports inst644 mode644 )
    ( calibration_target inst644 dir83 )
    ( not_calibrated inst644 )
    ( on_board inst187 sat000 )
    ( supports inst187 mode187 )
    ( calibration_target inst187 dir83 )
    ( not_calibrated inst187 )
    ( on_board inst937 sat000 )
    ( supports inst937 mode937 )
    ( calibration_target inst937 dir83 )
    ( not_calibrated inst937 )
  )
  ( :goal
    ( and
      ( have_image dir130 mode205 )
      ( have_image dir407 mode11 )
      ( have_image dir843 mode275 )
      ( have_image dir581 mode334 )
      ( have_image dir942 mode57 )
      ( have_image dir977 mode660 )
      ( have_image dir662 mode554 )
      ( have_image dir135 mode768 )
      ( have_image dir776 mode974 )
      ( have_image dir162 mode64 )
      ( have_image dir883 mode458 )
      ( have_image dir655 mode288 )
      ( have_image dir564 mode644 )
      ( have_image dir645 mode187 )
      ( have_image dir538 mode937 )
    )
  )
)
