( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city896 - city
    city560 - city
    city323 - city
    city287 - city
    person870 - person
    person841 - person
    person569 - person
    person265 - person
    person752 - person
    person664 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person870 city896 )
    ( person-at person841 city560 )
    ( person-at person569 city896 )
    ( person-at person265 city287 )
    ( person-at person752 city323 )
    ( person-at person664 city287 )
  )
  ( :goal
    ( and
      ( person-at person870 city000 )
      ( person-at person841 city000 )
      ( person-at person569 city000 )
      ( person-at person265 city000 )
      ( person-at person752 city000 )
      ( person-at person664 city000 )
    )
  )
)
