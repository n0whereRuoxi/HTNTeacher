( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city686 - city
    city513 - city
    city8 - city
    city526 - city
    city491 - city
    person248 - person
    person471 - person
    person810 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person248 city526 )
    ( person-at person471 city513 )
    ( person-at person810 city491 )
  )
  ( :tasks
    ( Fly-3Ppl person248 person471 person810 city000 )
  )
)
