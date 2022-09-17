( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city552 - city
    city244 - city
    city830 - city
    person673 - person
    person444 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person673 city552 )
    ( person-at person444 city244 )
  )
  ( :tasks
    ( Fly-2Ppl person673 person444 city000 )
  )
)
