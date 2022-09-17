( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city529 - city
    city486 - city
    city859 - city
    city221 - city
    person20 - person
    person989 - person
    person447 - person
    person801 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person20 city859 )
    ( person-at person989 city859 )
    ( person-at person447 city529 )
    ( person-at person801 city529 )
  )
  ( :tasks
    ( Fly-4Ppl person20 person989 person447 person801 city000 )
  )
)
