( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir660 - direction
    dir890 - direction
    dir916 - direction
    dir213 - direction
    dir978 - direction
    dir624 - direction
    dir532 - direction
    dir958 - direction
    dir761 - direction
    dir377 - direction
    dir33 - direction
    dir849 - direction
    dir485 - direction
    dir236 - direction
    dir628 - direction
    dir778 - direction
    dir434 - direction
    mode258 - mode
    inst258 - instrument
    mode256 - mode
    inst256 - instrument
    mode428 - mode
    inst428 - instrument
    mode360 - mode
    inst360 - instrument
    mode739 - mode
    inst739 - instrument
    mode453 - mode
    inst453 - instrument
    mode687 - mode
    inst687 - instrument
    mode933 - mode
    inst933 - instrument
    mode838 - mode
    inst838 - instrument
    mode48 - mode
    inst48 - instrument
    mode869 - mode
    inst869 - instrument
    mode827 - mode
    inst827 - instrument
    mode378 - mode
    inst378 - instrument
    mode817 - mode
    inst817 - instrument
    mode613 - mode
    inst613 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir660 )
    ( on_board inst258 sat000 )
    ( supports inst258 mode258 )
    ( calibration_target inst258 dir890 )
    ( not_calibrated inst258 )
    ( on_board inst256 sat000 )
    ( supports inst256 mode256 )
    ( calibration_target inst256 dir890 )
    ( not_calibrated inst256 )
    ( on_board inst428 sat000 )
    ( supports inst428 mode428 )
    ( calibration_target inst428 dir890 )
    ( not_calibrated inst428 )
    ( on_board inst360 sat000 )
    ( supports inst360 mode360 )
    ( calibration_target inst360 dir890 )
    ( not_calibrated inst360 )
    ( on_board inst739 sat000 )
    ( supports inst739 mode739 )
    ( calibration_target inst739 dir890 )
    ( not_calibrated inst739 )
    ( on_board inst453 sat000 )
    ( supports inst453 mode453 )
    ( calibration_target inst453 dir890 )
    ( not_calibrated inst453 )
    ( on_board inst687 sat000 )
    ( supports inst687 mode687 )
    ( calibration_target inst687 dir890 )
    ( not_calibrated inst687 )
    ( on_board inst933 sat000 )
    ( supports inst933 mode933 )
    ( calibration_target inst933 dir890 )
    ( not_calibrated inst933 )
    ( on_board inst838 sat000 )
    ( supports inst838 mode838 )
    ( calibration_target inst838 dir890 )
    ( not_calibrated inst838 )
    ( on_board inst48 sat000 )
    ( supports inst48 mode48 )
    ( calibration_target inst48 dir890 )
    ( not_calibrated inst48 )
    ( on_board inst869 sat000 )
    ( supports inst869 mode869 )
    ( calibration_target inst869 dir890 )
    ( not_calibrated inst869 )
    ( on_board inst827 sat000 )
    ( supports inst827 mode827 )
    ( calibration_target inst827 dir890 )
    ( not_calibrated inst827 )
    ( on_board inst378 sat000 )
    ( supports inst378 mode378 )
    ( calibration_target inst378 dir890 )
    ( not_calibrated inst378 )
    ( on_board inst817 sat000 )
    ( supports inst817 mode817 )
    ( calibration_target inst817 dir890 )
    ( not_calibrated inst817 )
    ( on_board inst613 sat000 )
    ( supports inst613 mode613 )
    ( calibration_target inst613 dir890 )
    ( not_calibrated inst613 )
  )
  ( :tasks
    ( Get-15Image dir916 mode258 dir213 mode256 dir978 mode428 dir624 mode360 dir532 mode739 dir958 mode453 dir761 mode687 dir377 mode933 dir33 mode838 dir849 mode48 dir485 mode869 dir236 mode827 dir628 mode378 dir778 mode817 dir434 mode613 )
  )
)
