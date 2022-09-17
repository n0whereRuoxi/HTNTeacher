( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city487 - city
    city221 - city
    city40 - city
    city187 - city
    person206 - person
    person438 - person
    person884 - person
    person763 - person
    person344 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person206 city487 )
    ( person-at person438 city221 )
    ( person-at person884 city487 )
    ( person-at person763 city40 )
    ( person-at person344 city221 )
  )
  ( :goal
    ( and
      ( person-at person206 city000 )
      ( person-at person438 city000 )
      ( person-at person884 city000 )
      ( person-at person763 city000 )
      ( person-at person344 city000 )
    )
  )
)
