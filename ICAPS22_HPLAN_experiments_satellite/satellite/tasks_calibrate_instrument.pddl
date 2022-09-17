( define
  ( tasks Satellite-tasks )
  ( :task Calibrate_Inst
    :parameters
    (
      ?i - instrument
    )
    :precondition
    (
    )
    :effect
    ( and
      ( calibrated ?i)
    )
  )
)
