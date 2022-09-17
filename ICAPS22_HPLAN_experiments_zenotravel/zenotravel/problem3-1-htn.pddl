( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city278 - city
    city77 - city
    city716 - city
    person612 - person
    person237 - person
    person772 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person612 city278 )
    ( person-at person237 city716 )
    ( person-at person772 city716 )
  )
  ( :tasks
    ( Fly-3Ppl person612 person237 person772 city000 )
  )
)