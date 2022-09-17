( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city892 - city
    city30 - city
    city829 - city
    city915 - city
    city521 - city
    city635 - city
    city861 - city
    city743 - city
    city587 - city
    city297 - city
    city459 - city
    person290 - person
    person988 - person
    person253 - person
    person144 - person
    person70 - person
    person304 - person
    person305 - person
    person471 - person
    person727 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person290 city297 )
    ( person-at person988 city459 )
    ( person-at person253 city459 )
    ( person-at person144 city829 )
    ( person-at person70 city459 )
    ( person-at person304 city743 )
    ( person-at person305 city635 )
    ( person-at person471 city743 )
    ( person-at person727 city892 )
  )
  ( :goal
    ( and
      ( person-at person290 city000 )
      ( person-at person988 city000 )
      ( person-at person253 city000 )
      ( person-at person144 city000 )
      ( person-at person70 city000 )
      ( person-at person304 city000 )
      ( person-at person305 city000 )
      ( person-at person471 city000 )
      ( person-at person727 city000 )
    )
  )
)
