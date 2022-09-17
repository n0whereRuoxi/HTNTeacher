( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city933 - city
    city960 - city
    person135 - person
    person21 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person135 city960 )
    ( person-at person21 city960 )
  )
  ( :goal
    ( and
      ( person-at person135 city000 )
      ( person-at person21 city000 )
    )
  )
)
