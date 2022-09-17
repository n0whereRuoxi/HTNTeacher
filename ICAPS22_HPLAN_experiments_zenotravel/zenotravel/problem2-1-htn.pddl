( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city576 - city
    city85 - city
    city395 - city
    city446 - city
    person158 - person
    person295 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person158 city446 )
    ( person-at person295 city395 )
  )
  ( :tasks
    ( Fly-2Ppl person158 person295 city000 )
  )
)
