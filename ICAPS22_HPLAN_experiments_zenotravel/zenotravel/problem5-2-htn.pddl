( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city21 - city
    city80 - city
    city587 - city
    city356 - city
    city216 - city
    city555 - city
    city566 - city
    person503 - person
    person303 - person
    person651 - person
    person224 - person
    person159 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person503 city356 )
    ( person-at person303 city587 )
    ( person-at person651 city356 )
    ( person-at person224 city356 )
    ( person-at person159 city80 )
  )
  ( :tasks
    ( Fly-5Ppl person503 person303 person651 person224 person159 city000 )
  )
)
