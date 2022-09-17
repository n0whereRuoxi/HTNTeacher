( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city425 - city
    city400 - city
    city190 - city
    city825 - city
    city864 - city
    person345 - person
    person750 - person
    person621 - person
    person391 - person
    person170 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person345 city190 )
    ( person-at person750 city190 )
    ( person-at person621 city400 )
    ( person-at person391 city190 )
    ( person-at person170 city425 )
  )
  ( :tasks
    ( Fly-5Ppl person345 person750 person621 person391 person170 city000 )
  )
)
