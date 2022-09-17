( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city35 - city
    city137 - city
    city525 - city
    city697 - city
    city575 - city
    person549 - person
    person81 - person
    person693 - person
    person995 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person549 city35 )
    ( person-at person81 city137 )
    ( person-at person693 city137 )
    ( person-at person995 city525 )
  )
  ( :goal
    ( and
      ( person-at person549 city000 )
      ( person-at person81 city000 )
      ( person-at person693 city000 )
      ( person-at person995 city000 )
    )
  )
)
