( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city467 - city
    city926 - city
    city555 - city
    city172 - city
    city897 - city
    city838 - city
    person209 - person
    person527 - person
    person94 - person
    person391 - person
    person455 - person
    person900 - person
    person511 - person
    person896 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person209 city467 )
    ( person-at person527 city838 )
    ( person-at person94 city555 )
    ( person-at person391 city926 )
    ( person-at person455 city838 )
    ( person-at person900 city467 )
    ( person-at person511 city926 )
    ( person-at person896 city926 )
  )
  ( :goal
    ( and
      ( person-at person209 city000 )
      ( person-at person527 city000 )
      ( person-at person94 city000 )
      ( person-at person391 city000 )
      ( person-at person455 city000 )
      ( person-at person900 city000 )
      ( person-at person511 city000 )
      ( person-at person896 city000 )
    )
  )
)
