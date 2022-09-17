( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
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
  ( :goal
    ( and
      ( person-at person586 city000 )
      ( person-at person479 city000 )
      ( person-at person990 city000 )
    )
  )
)
