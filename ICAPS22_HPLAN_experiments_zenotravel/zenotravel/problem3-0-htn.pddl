( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city477 - city
    city609 - city
    city13 - city
    city972 - city
    person141 - person
    person503 - person
    person640 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person141 city972 )
    ( person-at person503 city13 )
    ( person-at person640 city609 )
  )
  ( :tasks
    ( Fly-3Ppl person141 person503 person640 city000 )
  )
)
