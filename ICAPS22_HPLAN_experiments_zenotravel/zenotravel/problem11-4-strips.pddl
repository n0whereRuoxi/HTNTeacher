( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city12 - city
    city31 - city
    city84 - city
    city137 - city
    city243 - city
    city190 - city
    city683 - city
    city642 - city
    city651 - city
    person610 - person
    person858 - person
    person128 - person
    person169 - person
    person640 - person
    person377 - person
    person201 - person
    person357 - person
    person723 - person
    person230 - person
    person912 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person610 city683 )
    ( person-at person858 city642 )
    ( person-at person128 city190 )
    ( person-at person169 city642 )
    ( person-at person640 city190 )
    ( person-at person377 city137 )
    ( person-at person201 city190 )
    ( person-at person357 city12 )
    ( person-at person723 city31 )
    ( person-at person230 city84 )
    ( person-at person912 city190 )
  )
  ( :goal
    ( and
      ( person-at person610 city000 )
      ( person-at person858 city000 )
      ( person-at person128 city000 )
      ( person-at person169 city000 )
      ( person-at person640 city000 )
      ( person-at person377 city000 )
      ( person-at person201 city000 )
      ( person-at person357 city000 )
      ( person-at person723 city000 )
      ( person-at person230 city000 )
      ( person-at person912 city000 )
    )
  )
)
