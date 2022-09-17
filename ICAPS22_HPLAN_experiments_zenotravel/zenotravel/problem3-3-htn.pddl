( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city105 - city
    city66 - city
    city902 - city
    city172 - city
    city411 - city
    person586 - person
    person479 - person
    person990 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person586 city66 )
    ( person-at person479 city105 )
    ( person-at person990 city902 )
  )
  ( :tasks
    ( Fly-3Ppl person586 person479 person990 city000 )
  )
)
