( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city524 - city
    city826 - city
    city410 - city
    city210 - city
    person689 - person
    person752 - person
    person371 - person
    person842 - person
    person222 - person
    person335 - person
    person25 - person
    person6 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person689 city826 )
    ( person-at person752 city410 )
    ( person-at person371 city826 )
    ( person-at person842 city826 )
    ( person-at person222 city410 )
    ( person-at person335 city410 )
    ( person-at person25 city210 )
    ( person-at person6 city524 )
  )
  ( :goal
    ( and
      ( person-at person689 city000 )
      ( person-at person752 city000 )
      ( person-at person371 city000 )
      ( person-at person842 city000 )
      ( person-at person222 city000 )
      ( person-at person335 city000 )
      ( person-at person25 city000 )
      ( person-at person6 city000 )
    )
  )
)
