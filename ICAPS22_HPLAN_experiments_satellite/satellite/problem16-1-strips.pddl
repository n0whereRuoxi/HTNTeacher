( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir371 - direction
    dir776 - direction
    dir566 - direction
    dir748 - direction
    dir938 - direction
    dir817 - direction
    dir879 - direction
    dir918 - direction
    dir836 - direction
    dir279 - direction
    dir288 - direction
    dir30 - direction
    dir109 - direction
    dir315 - direction
    dir148 - direction
    dir503 - direction
    dir36 - direction
    dir87 - direction
    mode310 - mode
    inst310 - instrument
    mode40 - mode
    inst40 - instrument
    mode616 - mode
    inst616 - instrument
    mode649 - mode
    inst649 - instrument
    mode327 - mode
    inst327 - instrument
    mode304 - mode
    inst304 - instrument
    mode492 - mode
    inst492 - instrument
    mode928 - mode
    inst928 - instrument
    mode23 - mode
    inst23 - instrument
    mode626 - mode
    inst626 - instrument
    mode295 - mode
    inst295 - instrument
    mode826 - mode
    inst826 - instrument
    mode438 - mode
    inst438 - instrument
    mode53 - mode
    inst53 - instrument
    mode617 - mode
    inst617 - instrument
    mode168 - mode
    inst168 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir371 )
    ( on_board inst310 sat000 )
    ( supports inst310 mode310 )
    ( calibration_target inst310 dir776 )
    ( not_calibrated inst310 )
    ( on_board inst40 sat000 )
    ( supports inst40 mode40 )
    ( calibration_target inst40 dir776 )
    ( not_calibrated inst40 )
    ( on_board inst616 sat000 )
    ( supports inst616 mode616 )
    ( calibration_target inst616 dir776 )
    ( not_calibrated inst616 )
    ( on_board inst649 sat000 )
    ( supports inst649 mode649 )
    ( calibration_target inst649 dir776 )
    ( not_calibrated inst649 )
    ( on_board inst327 sat000 )
    ( supports inst327 mode327 )
    ( calibration_target inst327 dir776 )
    ( not_calibrated inst327 )
    ( on_board inst304 sat000 )
    ( supports inst304 mode304 )
    ( calibration_target inst304 dir776 )
    ( not_calibrated inst304 )
    ( on_board inst492 sat000 )
    ( supports inst492 mode492 )
    ( calibration_target inst492 dir776 )
    ( not_calibrated inst492 )
    ( on_board inst928 sat000 )
    ( supports inst928 mode928 )
    ( calibration_target inst928 dir776 )
    ( not_calibrated inst928 )
    ( on_board inst23 sat000 )
    ( supports inst23 mode23 )
    ( calibration_target inst23 dir776 )
    ( not_calibrated inst23 )
    ( on_board inst626 sat000 )
    ( supports inst626 mode626 )
    ( calibration_target inst626 dir776 )
    ( not_calibrated inst626 )
    ( on_board inst295 sat000 )
    ( supports inst295 mode295 )
    ( calibration_target inst295 dir776 )
    ( not_calibrated inst295 )
    ( on_board inst826 sat000 )
    ( supports inst826 mode826 )
    ( calibration_target inst826 dir776 )
    ( not_calibrated inst826 )
    ( on_board inst438 sat000 )
    ( supports inst438 mode438 )
    ( calibration_target inst438 dir776 )
    ( not_calibrated inst438 )
    ( on_board inst53 sat000 )
    ( supports inst53 mode53 )
    ( calibration_target inst53 dir776 )
    ( not_calibrated inst53 )
    ( on_board inst617 sat000 )
    ( supports inst617 mode617 )
    ( calibration_target inst617 dir776 )
    ( not_calibrated inst617 )
    ( on_board inst168 sat000 )
    ( supports inst168 mode168 )
    ( calibration_target inst168 dir776 )
    ( not_calibrated inst168 )
  )
  ( :goal
    ( and
      ( have_image dir566 mode310 )
      ( have_image dir748 mode40 )
      ( have_image dir938 mode616 )
      ( have_image dir817 mode649 )
      ( have_image dir879 mode327 )
      ( have_image dir918 mode304 )
      ( have_image dir836 mode492 )
      ( have_image dir279 mode928 )
      ( have_image dir288 mode23 )
      ( have_image dir30 mode626 )
      ( have_image dir109 mode295 )
      ( have_image dir315 mode826 )
      ( have_image dir148 mode438 )
      ( have_image dir503 mode53 )
      ( have_image dir36 mode617 )
      ( have_image dir87 mode168 )
    )
  )
)
