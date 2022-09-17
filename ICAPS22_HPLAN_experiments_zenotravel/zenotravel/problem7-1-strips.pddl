( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city520 - city
    city206 - city
    city640 - city
    city14 - city
    city335 - city
    city344 - city
    person774 - person
    person466 - person
    person718 - person
    person348 - person
    person985 - person
    person41 - person
    person683 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person774 city520 )
    ( person-at person466 city520 )
    ( person-at person718 city335 )
    ( person-at person348 city335 )
    ( person-at person985 city206 )
    ( person-at person41 city640 )
    ( person-at person683 city206 )
  )
  ( :goal
    ( and
      ( person-at person774 city000 )
      ( person-at person466 city000 )
      ( person-at person718 city000 )
      ( person-at person348 city000 )
      ( person-at person985 city000 )
      ( person-at person41 city000 )
      ( person-at person683 city000 )
    )
  )
)
