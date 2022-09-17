( define ( problem probname )
  ( :domain satellite )
  ( :requirements :strips :typing :equality )
  ( :objects
    sat000 - satellite
    dir912 - direction
    dir660 - direction
    dir813 - direction
    dir604 - direction
    dir919 - direction
    dir783 - direction
    dir258 - direction
    dir887 - direction
    dir613 - direction
    dir978 - direction
    dir314 - direction
    dir349 - direction
    mode356 - mode
    inst356 - instrument
    mode778 - mode
    inst778 - instrument
    mode677 - mode
    inst677 - instrument
    mode574 - mode
    inst574 - instrument
    mode273 - mode
    inst273 - instrument
    mode92 - mode
    inst92 - instrument
    mode478 - mode
    inst478 - instrument
    mode962 - mode
    inst962 - instrument
    mode47 - mode
    inst47 - instrument
    mode762 - mode
    inst762 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir912 )
    ( on_board inst356 sat000 )
    ( supports inst356 mode356 )
    ( calibration_target inst356 dir660 )
    ( not_calibrated inst356 )
    ( on_board inst778 sat000 )
    ( supports inst778 mode778 )
    ( calibration_target inst778 dir660 )
    ( not_calibrated inst778 )
    ( on_board inst677 sat000 )
    ( supports inst677 mode677 )
    ( calibration_target inst677 dir660 )
    ( not_calibrated inst677 )
    ( on_board inst574 sat000 )
    ( supports inst574 mode574 )
    ( calibration_target inst574 dir660 )
    ( not_calibrated inst574 )
    ( on_board inst273 sat000 )
    ( supports inst273 mode273 )
    ( calibration_target inst273 dir660 )
    ( not_calibrated inst273 )
    ( on_board inst92 sat000 )
    ( supports inst92 mode92 )
    ( calibration_target inst92 dir660 )
    ( not_calibrated inst92 )
    ( on_board inst478 sat000 )
    ( supports inst478 mode478 )
    ( calibration_target inst478 dir660 )
    ( not_calibrated inst478 )
    ( on_board inst962 sat000 )
    ( supports inst962 mode962 )
    ( calibration_target inst962 dir660 )
    ( not_calibrated inst962 )
    ( on_board inst47 sat000 )
    ( supports inst47 mode47 )
    ( calibration_target inst47 dir660 )
    ( not_calibrated inst47 )
    ( on_board inst762 sat000 )
    ( supports inst762 mode762 )
    ( calibration_target inst762 dir660 )
    ( not_calibrated inst762 )
  )
  ( :goal
    ( and
      ( have_image dir813 mode356 )
      ( have_image dir604 mode778 )
      ( have_image dir919 mode677 )
      ( have_image dir783 mode574 )
      ( have_image dir258 mode273 )
      ( have_image dir887 mode92 )
      ( have_image dir613 mode478 )
      ( have_image dir978 mode962 )
      ( have_image dir314 mode47 )
      ( have_image dir349 mode762 )
    )
  )
)
