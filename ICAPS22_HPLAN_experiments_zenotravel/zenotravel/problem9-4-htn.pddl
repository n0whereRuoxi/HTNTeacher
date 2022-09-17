( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city965 - city
    city369 - city
    city594 - city
    city299 - city
    city962 - city
    city271 - city
    person415 - person
    person603 - person
    person546 - person
    person793 - person
    person121 - person
    person539 - person
    person756 - person
    person813 - person
    person287 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person415 city962 )
    ( person-at person603 city962 )
    ( person-at person546 city299 )
    ( person-at person793 city369 )
    ( person-at person121 city299 )
    ( person-at person539 city369 )
    ( person-at person756 city271 )
    ( person-at person813 city271 )
    ( person-at person287 city965 )
  )
  ( :tasks
    ( Fly-9Ppl person415 person603 person546 person793 person121 person539 person756 person813 person287 city000 )
  )
)
