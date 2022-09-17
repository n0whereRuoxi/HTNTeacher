( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir598 - direction
    dir415 - direction
    dir159 - direction
    dir265 - direction
    dir858 - direction
    dir136 - direction
    dir783 - direction
    dir606 - direction
    dir18 - direction
    dir663 - direction
    dir516 - direction
    dir93 - direction
    dir465 - direction
    dir777 - direction
    dir139 - direction
    mode259 - mode
    inst259 - instrument
    mode687 - mode
    inst687 - instrument
    mode55 - mode
    inst55 - instrument
    mode969 - mode
    inst969 - instrument
    mode704 - mode
    inst704 - instrument
    mode914 - mode
    inst914 - instrument
    mode87 - mode
    inst87 - instrument
    mode732 - mode
    inst732 - instrument
    mode484 - mode
    inst484 - instrument
    mode436 - mode
    inst436 - instrument
    mode237 - mode
    inst237 - instrument
    mode809 - mode
    inst809 - instrument
    mode662 - mode
    inst662 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir598 )
    ( on_board inst259 sat000 )
    ( supports inst259 mode259 )
    ( calibration_target inst259 dir415 )
    ( not_calibrated inst259 )
    ( on_board inst687 sat000 )
    ( supports inst687 mode687 )
    ( calibration_target inst687 dir415 )
    ( not_calibrated inst687 )
    ( on_board inst55 sat000 )
    ( supports inst55 mode55 )
    ( calibration_target inst55 dir415 )
    ( not_calibrated inst55 )
    ( on_board inst969 sat000 )
    ( supports inst969 mode969 )
    ( calibration_target inst969 dir415 )
    ( not_calibrated inst969 )
    ( on_board inst704 sat000 )
    ( supports inst704 mode704 )
    ( calibration_target inst704 dir415 )
    ( not_calibrated inst704 )
    ( on_board inst914 sat000 )
    ( supports inst914 mode914 )
    ( calibration_target inst914 dir415 )
    ( not_calibrated inst914 )
    ( on_board inst87 sat000 )
    ( supports inst87 mode87 )
    ( calibration_target inst87 dir415 )
    ( not_calibrated inst87 )
    ( on_board inst732 sat000 )
    ( supports inst732 mode732 )
    ( calibration_target inst732 dir415 )
    ( not_calibrated inst732 )
    ( on_board inst484 sat000 )
    ( supports inst484 mode484 )
    ( calibration_target inst484 dir415 )
    ( not_calibrated inst484 )
    ( on_board inst436 sat000 )
    ( supports inst436 mode436 )
    ( calibration_target inst436 dir415 )
    ( not_calibrated inst436 )
    ( on_board inst237 sat000 )
    ( supports inst237 mode237 )
    ( calibration_target inst237 dir415 )
    ( not_calibrated inst237 )
    ( on_board inst809 sat000 )
    ( supports inst809 mode809 )
    ( calibration_target inst809 dir415 )
    ( not_calibrated inst809 )
    ( on_board inst662 sat000 )
    ( supports inst662 mode662 )
    ( calibration_target inst662 dir415 )
    ( not_calibrated inst662 )
  )
  ( :tasks
    ( Get-13Image dir159 mode259 dir265 mode687 dir858 mode55 dir136 mode969 dir783 mode704 dir606 mode914 dir18 mode87 dir663 mode732 dir516 mode484 dir93 mode436 dir465 mode237 dir777 mode809 dir139 mode662 )
  )
)
