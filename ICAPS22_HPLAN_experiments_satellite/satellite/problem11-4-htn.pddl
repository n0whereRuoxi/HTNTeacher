( define ( htn-problem probname )
  ( :domain satellite )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    sat000 - satellite
    dir951 - direction
    dir87 - direction
    dir119 - direction
    dir23 - direction
    dir532 - direction
    dir258 - direction
    dir52 - direction
    dir632 - direction
    dir409 - direction
    dir756 - direction
    dir871 - direction
    dir629 - direction
    dir719 - direction
    mode847 - mode
    inst847 - instrument
    mode503 - mode
    inst503 - instrument
    mode681 - mode
    inst681 - instrument
    mode274 - mode
    inst274 - instrument
    mode816 - mode
    inst816 - instrument
    mode721 - mode
    inst721 - instrument
    mode708 - mode
    inst708 - instrument
    mode284 - mode
    inst284 - instrument
    mode628 - mode
    inst628 - instrument
    mode936 - mode
    inst936 - instrument
    mode891 - mode
    inst891 - instrument
  )
  ( :init
  ( power_avail sat000 )
    ( pointing sat000 dir951 )
    ( on_board inst847 sat000 )
    ( supports inst847 mode847 )
    ( calibration_target inst847 dir87 )
    ( not_calibrated inst847 )
    ( on_board inst503 sat000 )
    ( supports inst503 mode503 )
    ( calibration_target inst503 dir87 )
    ( not_calibrated inst503 )
    ( on_board inst681 sat000 )
    ( supports inst681 mode681 )
    ( calibration_target inst681 dir87 )
    ( not_calibrated inst681 )
    ( on_board inst274 sat000 )
    ( supports inst274 mode274 )
    ( calibration_target inst274 dir87 )
    ( not_calibrated inst274 )
    ( on_board inst816 sat000 )
    ( supports inst816 mode816 )
    ( calibration_target inst816 dir87 )
    ( not_calibrated inst816 )
    ( on_board inst721 sat000 )
    ( supports inst721 mode721 )
    ( calibration_target inst721 dir87 )
    ( not_calibrated inst721 )
    ( on_board inst708 sat000 )
    ( supports inst708 mode708 )
    ( calibration_target inst708 dir87 )
    ( not_calibrated inst708 )
    ( on_board inst284 sat000 )
    ( supports inst284 mode284 )
    ( calibration_target inst284 dir87 )
    ( not_calibrated inst284 )
    ( on_board inst628 sat000 )
    ( supports inst628 mode628 )
    ( calibration_target inst628 dir87 )
    ( not_calibrated inst628 )
    ( on_board inst936 sat000 )
    ( supports inst936 mode936 )
    ( calibration_target inst936 dir87 )
    ( not_calibrated inst936 )
    ( on_board inst891 sat000 )
    ( supports inst891 mode891 )
    ( calibration_target inst891 dir87 )
    ( not_calibrated inst891 )
  )
  ( :tasks
    ( Get-11Image dir119 mode847 dir23 mode503 dir532 mode681 dir258 mode274 dir52 mode816 dir632 mode721 dir409 mode708 dir756 mode284 dir871 mode628 dir629 mode936 dir719 mode891 )
  )
)
