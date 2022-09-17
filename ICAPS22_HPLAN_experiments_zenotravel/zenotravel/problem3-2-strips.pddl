( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city718 - city
    city186 - city
    person325 - person
    person588 - person
    person395 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person325 city186 )
    ( person-at person588 city718 )
    ( person-at person395 city718 )
  )
  ( :goal
    ( and
      ( person-at person325 city000 )
      ( person-at person588 city000 )
      ( person-at person395 city000 )
    )
  )
)
