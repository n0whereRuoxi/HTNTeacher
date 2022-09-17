( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city718 - city
    city186 - city
    person325 - person
    person588 - person
    person395 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person325 city186 )
    ( person-at person588 city718 )
    ( person-at person395 city718 )
  )
  ( :tasks
    ( Fly-3Ppl person325 person588 person395 city000 )
  )
)
