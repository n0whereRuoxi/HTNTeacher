( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir421 - direction
    dir387 - direction
    dir267 - direction
    dir365 - direction
    dir393 - direction
    dir88 - direction
    dir773 - direction
    dir984 - direction
    dir921 - direction
    dir457 - direction
    dir257 - direction
    dir150 - direction
    dir62 - direction
    dir546 - direction
    mode1 - mode
    inst1 - instrument
    mode837 - mode
    inst837 - instrument
    mode718 - mode
    inst718 - instrument
    mode172 - mode
    inst172 - instrument
    mode665 - mode
    inst665 - instrument
    mode699 - mode
    inst699 - instrument
    mode579 - mode
    inst579 - instrument
    mode16 - mode
    inst16 - instrument
    mode649 - mode
    inst649 - instrument
    mode980 - mode
    inst980 - instrument
    mode931 - mode
    inst931 - instrument
    mode58 - mode
    inst58 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir421 )
    ( on_board inst1 sat000 )
    ( supports inst1 mode1 )
    ( calibration_target inst1 dir387 )
    ( not_calibrated inst1 )
    ( on_board inst837 sat000 )
    ( supports inst837 mode837 )
    ( calibration_target inst837 dir387 )
    ( not_calibrated inst837 )
    ( on_board inst718 sat000 )
    ( supports inst718 mode718 )
    ( calibration_target inst718 dir387 )
    ( not_calibrated inst718 )
    ( on_board inst172 sat000 )
    ( supports inst172 mode172 )
    ( calibration_target inst172 dir387 )
    ( not_calibrated inst172 )
    ( on_board inst665 sat000 )
    ( supports inst665 mode665 )
    ( calibration_target inst665 dir387 )
    ( not_calibrated inst665 )
    ( on_board inst699 sat000 )
    ( supports inst699 mode699 )
    ( calibration_target inst699 dir387 )
    ( not_calibrated inst699 )
    ( on_board inst579 sat000 )
    ( supports inst579 mode579 )
    ( calibration_target inst579 dir387 )
    ( not_calibrated inst579 )
    ( on_board inst16 sat000 )
    ( supports inst16 mode16 )
    ( calibration_target inst16 dir387 )
    ( not_calibrated inst16 )
    ( on_board inst649 sat000 )
    ( supports inst649 mode649 )
    ( calibration_target inst649 dir387 )
    ( not_calibrated inst649 )
    ( on_board inst980 sat000 )
    ( supports inst980 mode980 )
    ( calibration_target inst980 dir387 )
    ( not_calibrated inst980 )
    ( on_board inst931 sat000 )
    ( supports inst931 mode931 )
    ( calibration_target inst931 dir387 )
    ( not_calibrated inst931 )
    ( on_board inst58 sat000 )
    ( supports inst58 mode58 )
    ( calibration_target inst58 dir387 )
    ( not_calibrated inst58 )
  )
  ( :goal
    ( and
      ( have_image dir267 mode1 )
      ( have_image dir365 mode837 )
      ( have_image dir393 mode718 )
      ( have_image dir88 mode172 )
      ( have_image dir773 mode665 )
      ( have_image dir984 mode699 )
      ( have_image dir921 mode579 )
      ( have_image dir457 mode16 )
      ( have_image dir257 mode649 )
      ( have_image dir150 mode980 )
      ( have_image dir62 mode931 )
      ( have_image dir546 mode58 )
    )
  )
)
