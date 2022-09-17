( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city511 - city
    city144 - city
    city590 - city
    city376 - city
    city840 - city
    person352 - person
    person603 - person
    person473 - person
    person558 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person352 city840 )
    ( person-at person603 city840 )
    ( person-at person473 city590 )
    ( person-at person558 city144 )
  )
  ( :tasks
    ( Fly-4Ppl person352 person603 person473 person558 city000 )
  )
)
