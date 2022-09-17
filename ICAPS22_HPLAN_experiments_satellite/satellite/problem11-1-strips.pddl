( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir709 - direction
    dir9 - direction
    dir279 - direction
    dir346 - direction
    dir298 - direction
    dir958 - direction
    dir76 - direction
    dir781 - direction
    dir154 - direction
    dir261 - direction
    dir270 - direction
    dir99 - direction
    dir602 - direction
    mode91 - mode
    inst91 - instrument
    mode794 - mode
    inst794 - instrument
    mode394 - mode
    inst394 - instrument
    mode547 - mode
    inst547 - instrument
    mode497 - mode
    inst497 - instrument
    mode590 - mode
    inst590 - instrument
    mode769 - mode
    inst769 - instrument
    mode86 - mode
    inst86 - instrument
    mode663 - mode
    inst663 - instrument
    mode579 - mode
    inst579 - instrument
    mode612 - mode
    inst612 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir709 )
    ( on_board inst91 sat000 )
    ( supports inst91 mode91 )
    ( calibration_target inst91 dir9 )
    ( not_calibrated inst91 )
    ( on_board inst794 sat000 )
    ( supports inst794 mode794 )
    ( calibration_target inst794 dir9 )
    ( not_calibrated inst794 )
    ( on_board inst394 sat000 )
    ( supports inst394 mode394 )
    ( calibration_target inst394 dir9 )
    ( not_calibrated inst394 )
    ( on_board inst547 sat000 )
    ( supports inst547 mode547 )
    ( calibration_target inst547 dir9 )
    ( not_calibrated inst547 )
    ( on_board inst497 sat000 )
    ( supports inst497 mode497 )
    ( calibration_target inst497 dir9 )
    ( not_calibrated inst497 )
    ( on_board inst590 sat000 )
    ( supports inst590 mode590 )
    ( calibration_target inst590 dir9 )
    ( not_calibrated inst590 )
    ( on_board inst769 sat000 )
    ( supports inst769 mode769 )
    ( calibration_target inst769 dir9 )
    ( not_calibrated inst769 )
    ( on_board inst86 sat000 )
    ( supports inst86 mode86 )
    ( calibration_target inst86 dir9 )
    ( not_calibrated inst86 )
    ( on_board inst663 sat000 )
    ( supports inst663 mode663 )
    ( calibration_target inst663 dir9 )
    ( not_calibrated inst663 )
    ( on_board inst579 sat000 )
    ( supports inst579 mode579 )
    ( calibration_target inst579 dir9 )
    ( not_calibrated inst579 )
    ( on_board inst612 sat000 )
    ( supports inst612 mode612 )
    ( calibration_target inst612 dir9 )
    ( not_calibrated inst612 )
  )
  ( :goal
    ( and
      ( have_image dir279 mode91 )
      ( have_image dir346 mode794 )
      ( have_image dir298 mode394 )
      ( have_image dir958 mode547 )
      ( have_image dir76 mode497 )
      ( have_image dir781 mode590 )
      ( have_image dir154 mode769 )
      ( have_image dir261 mode86 )
      ( have_image dir270 mode663 )
      ( have_image dir99 mode579 )
      ( have_image dir602 mode612 )
    )
  )
)
