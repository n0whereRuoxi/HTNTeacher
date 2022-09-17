( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir578 - direction
    dir207 - direction
    dir141 - direction
    dir159 - direction
    dir219 - direction
    dir190 - direction
    dir997 - direction
    dir633 - direction
    dir576 - direction
    dir862 - direction
    dir408 - direction
    dir642 - direction
    dir69 - direction
    dir483 - direction
    dir925 - direction
    dir708 - direction
    mode797 - mode
    inst797 - instrument
    mode14 - mode
    inst14 - instrument
    mode996 - mode
    inst996 - instrument
    mode784 - mode
    inst784 - instrument
    mode590 - mode
    inst590 - instrument
    mode910 - mode
    inst910 - instrument
    mode658 - mode
    inst658 - instrument
    mode115 - mode
    inst115 - instrument
    mode843 - mode
    inst843 - instrument
    mode276 - mode
    inst276 - instrument
    mode851 - mode
    inst851 - instrument
    mode894 - mode
    inst894 - instrument
    mode919 - mode
    inst919 - instrument
    mode441 - mode
    inst441 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir578 )
    ( on_board inst797 sat000 )
    ( supports inst797 mode797 )
    ( calibration_target inst797 dir207 )
    ( not_calibrated inst797 )
    ( on_board inst14 sat000 )
    ( supports inst14 mode14 )
    ( calibration_target inst14 dir207 )
    ( not_calibrated inst14 )
    ( on_board inst996 sat000 )
    ( supports inst996 mode996 )
    ( calibration_target inst996 dir207 )
    ( not_calibrated inst996 )
    ( on_board inst784 sat000 )
    ( supports inst784 mode784 )
    ( calibration_target inst784 dir207 )
    ( not_calibrated inst784 )
    ( on_board inst590 sat000 )
    ( supports inst590 mode590 )
    ( calibration_target inst590 dir207 )
    ( not_calibrated inst590 )
    ( on_board inst910 sat000 )
    ( supports inst910 mode910 )
    ( calibration_target inst910 dir207 )
    ( not_calibrated inst910 )
    ( on_board inst658 sat000 )
    ( supports inst658 mode658 )
    ( calibration_target inst658 dir207 )
    ( not_calibrated inst658 )
    ( on_board inst115 sat000 )
    ( supports inst115 mode115 )
    ( calibration_target inst115 dir207 )
    ( not_calibrated inst115 )
    ( on_board inst843 sat000 )
    ( supports inst843 mode843 )
    ( calibration_target inst843 dir207 )
    ( not_calibrated inst843 )
    ( on_board inst276 sat000 )
    ( supports inst276 mode276 )
    ( calibration_target inst276 dir207 )
    ( not_calibrated inst276 )
    ( on_board inst851 sat000 )
    ( supports inst851 mode851 )
    ( calibration_target inst851 dir207 )
    ( not_calibrated inst851 )
    ( on_board inst894 sat000 )
    ( supports inst894 mode894 )
    ( calibration_target inst894 dir207 )
    ( not_calibrated inst894 )
    ( on_board inst919 sat000 )
    ( supports inst919 mode919 )
    ( calibration_target inst919 dir207 )
    ( not_calibrated inst919 )
    ( on_board inst441 sat000 )
    ( supports inst441 mode441 )
    ( calibration_target inst441 dir207 )
    ( not_calibrated inst441 )
  )
  ( :tasks
    ( Get-14Image dir141 mode797 dir159 mode14 dir219 mode996 dir190 mode784 dir997 mode590 dir633 mode910 dir576 mode658 dir862 mode115 dir408 mode843 dir642 mode276 dir69 mode851 dir483 mode894 dir925 mode919 dir708 mode441 )
  )
)
