( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir178 - direction
    dir624 - direction
    dir759 - direction
    dir808 - direction
    dir847 - direction
    dir686 - direction
    dir532 - direction
    dir108 - direction
    dir784 - direction
    dir412 - direction
    dir812 - direction
    dir469 - direction
    dir605 - direction
    dir39 - direction
    dir33 - direction
    dir712 - direction
    mode314 - mode
    inst314 - instrument
    mode315 - mode
    inst315 - instrument
    mode884 - mode
    inst884 - instrument
    mode64 - mode
    inst64 - instrument
    mode136 - mode
    inst136 - instrument
    mode520 - mode
    inst520 - instrument
    mode730 - mode
    inst730 - instrument
    mode434 - mode
    inst434 - instrument
    mode236 - mode
    inst236 - instrument
    mode381 - mode
    inst381 - instrument
    mode571 - mode
    inst571 - instrument
    mode704 - mode
    inst704 - instrument
    mode459 - mode
    inst459 - instrument
    mode48 - mode
    inst48 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir178 )
    ( on_board inst314 sat000 )
    ( supports inst314 mode314 )
    ( calibration_target inst314 dir624 )
    ( not_calibrated inst314 )
    ( on_board inst315 sat000 )
    ( supports inst315 mode315 )
    ( calibration_target inst315 dir624 )
    ( not_calibrated inst315 )
    ( on_board inst884 sat000 )
    ( supports inst884 mode884 )
    ( calibration_target inst884 dir624 )
    ( not_calibrated inst884 )
    ( on_board inst64 sat000 )
    ( supports inst64 mode64 )
    ( calibration_target inst64 dir624 )
    ( not_calibrated inst64 )
    ( on_board inst136 sat000 )
    ( supports inst136 mode136 )
    ( calibration_target inst136 dir624 )
    ( not_calibrated inst136 )
    ( on_board inst520 sat000 )
    ( supports inst520 mode520 )
    ( calibration_target inst520 dir624 )
    ( not_calibrated inst520 )
    ( on_board inst730 sat000 )
    ( supports inst730 mode730 )
    ( calibration_target inst730 dir624 )
    ( not_calibrated inst730 )
    ( on_board inst434 sat000 )
    ( supports inst434 mode434 )
    ( calibration_target inst434 dir624 )
    ( not_calibrated inst434 )
    ( on_board inst236 sat000 )
    ( supports inst236 mode236 )
    ( calibration_target inst236 dir624 )
    ( not_calibrated inst236 )
    ( on_board inst381 sat000 )
    ( supports inst381 mode381 )
    ( calibration_target inst381 dir624 )
    ( not_calibrated inst381 )
    ( on_board inst571 sat000 )
    ( supports inst571 mode571 )
    ( calibration_target inst571 dir624 )
    ( not_calibrated inst571 )
    ( on_board inst704 sat000 )
    ( supports inst704 mode704 )
    ( calibration_target inst704 dir624 )
    ( not_calibrated inst704 )
    ( on_board inst459 sat000 )
    ( supports inst459 mode459 )
    ( calibration_target inst459 dir624 )
    ( not_calibrated inst459 )
    ( on_board inst48 sat000 )
    ( supports inst48 mode48 )
    ( calibration_target inst48 dir624 )
    ( not_calibrated inst48 )
  )
  ( :tasks
    ( Get-14Image dir759 mode314 dir808 mode315 dir847 mode884 dir686 mode64 dir532 mode136 dir108 mode520 dir784 mode730 dir412 mode434 dir812 mode236 dir469 mode381 dir605 mode571 dir39 mode704 dir33 mode459 dir712 mode48 )
  )
)
