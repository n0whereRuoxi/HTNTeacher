( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city504 - city
    city313 - city
    person213 - person
    person688 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person213 city313 )
    ( person-at person688 city504 )
  )
  ( :tasks
    ( Fly-2Ppl person213 person688 city000 )
  )
)
