( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city302 - city
    city308 - city
    city224 - city
    city854 - city
    city244 - city
    city692 - city
    city627 - city
    city290 - city
    city671 - city
    city54 - city
    person321 - person
    person121 - person
    person856 - person
    person57 - person
    person434 - person
    person895 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person321 city854 )
    ( person-at person121 city244 )
    ( person-at person856 city290 )
    ( person-at person57 city54 )
    ( person-at person434 city302 )
    ( person-at person895 city854 )
  )
  ( :tasks
    ( Fly-6Ppl person321 person121 person856 person57 person434 person895 city000 )
  )
)
