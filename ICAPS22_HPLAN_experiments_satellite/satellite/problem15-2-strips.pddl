( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir362 - direction
    dir666 - direction
    dir739 - direction
    dir783 - direction
    dir136 - direction
    dir345 - direction
    dir157 - direction
    dir212 - direction
    dir561 - direction
    dir416 - direction
    dir968 - direction
    dir442 - direction
    dir632 - direction
    dir536 - direction
    dir455 - direction
    dir36 - direction
    dir627 - direction
    mode876 - mode
    inst876 - instrument
    mode1 - mode
    inst1 - instrument
    mode845 - mode
    inst845 - instrument
    mode681 - mode
    inst681 - instrument
    mode261 - mode
    inst261 - instrument
    mode523 - mode
    inst523 - instrument
    mode728 - mode
    inst728 - instrument
    mode197 - mode
    inst197 - instrument
    mode67 - mode
    inst67 - instrument
    mode415 - mode
    inst415 - instrument
    mode86 - mode
    inst86 - instrument
    mode775 - mode
    inst775 - instrument
    mode701 - mode
    inst701 - instrument
    mode713 - mode
    inst713 - instrument
    mode620 - mode
    inst620 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir362 )
    ( on_board inst876 sat000 )
    ( supports inst876 mode876 )
    ( calibration_target inst876 dir666 )
    ( not_calibrated inst876 )
    ( on_board inst1 sat000 )
    ( supports inst1 mode1 )
    ( calibration_target inst1 dir666 )
    ( not_calibrated inst1 )
    ( on_board inst845 sat000 )
    ( supports inst845 mode845 )
    ( calibration_target inst845 dir666 )
    ( not_calibrated inst845 )
    ( on_board inst681 sat000 )
    ( supports inst681 mode681 )
    ( calibration_target inst681 dir666 )
    ( not_calibrated inst681 )
    ( on_board inst261 sat000 )
    ( supports inst261 mode261 )
    ( calibration_target inst261 dir666 )
    ( not_calibrated inst261 )
    ( on_board inst523 sat000 )
    ( supports inst523 mode523 )
    ( calibration_target inst523 dir666 )
    ( not_calibrated inst523 )
    ( on_board inst728 sat000 )
    ( supports inst728 mode728 )
    ( calibration_target inst728 dir666 )
    ( not_calibrated inst728 )
    ( on_board inst197 sat000 )
    ( supports inst197 mode197 )
    ( calibration_target inst197 dir666 )
    ( not_calibrated inst197 )
    ( on_board inst67 sat000 )
    ( supports inst67 mode67 )
    ( calibration_target inst67 dir666 )
    ( not_calibrated inst67 )
    ( on_board inst415 sat000 )
    ( supports inst415 mode415 )
    ( calibration_target inst415 dir666 )
    ( not_calibrated inst415 )
    ( on_board inst86 sat000 )
    ( supports inst86 mode86 )
    ( calibration_target inst86 dir666 )
    ( not_calibrated inst86 )
    ( on_board inst775 sat000 )
    ( supports inst775 mode775 )
    ( calibration_target inst775 dir666 )
    ( not_calibrated inst775 )
    ( on_board inst701 sat000 )
    ( supports inst701 mode701 )
    ( calibration_target inst701 dir666 )
    ( not_calibrated inst701 )
    ( on_board inst713 sat000 )
    ( supports inst713 mode713 )
    ( calibration_target inst713 dir666 )
    ( not_calibrated inst713 )
    ( on_board inst620 sat000 )
    ( supports inst620 mode620 )
    ( calibration_target inst620 dir666 )
    ( not_calibrated inst620 )
  )
  ( :goal
    ( and
      ( have_image dir739 mode876 )
      ( have_image dir783 mode1 )
      ( have_image dir136 mode845 )
      ( have_image dir345 mode681 )
      ( have_image dir157 mode261 )
      ( have_image dir212 mode523 )
      ( have_image dir561 mode728 )
      ( have_image dir416 mode197 )
      ( have_image dir968 mode67 )
      ( have_image dir442 mode415 )
      ( have_image dir632 mode86 )
      ( have_image dir536 mode775 )
      ( have_image dir455 mode701 )
      ( have_image dir36 mode713 )
      ( have_image dir627 mode620 )
    )
  )
)
