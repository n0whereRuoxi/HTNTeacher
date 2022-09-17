( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    aircraft000 - aircraft
    city476 - city
    city592 - city
    city233 - city
    city354 - city
    city339 - city
    city810 - city
    city874 - city
    city806 - city
    city646 - city
    city651 - city
    city379 - city
    city198 - city
    city704 - city
    city77 - city
    city529 - city
    city725 - city
    city926 - city
    city555 - city
    city611 - city
    city739 - city
    city377 - city
    city924 - city
    city904 - city
    city674 - city
    city410 - city
    city867 - city
    person432 - person
    person421 - person
    person85 - person
    person87 - person
    person750 - person
    person311 - person
    person653 - person
    person320 - person
    person707 - person
    person365 - person
    person924 - person
    person571 - person
    person158 - person
  )
  ( :init
    ( next level000 level001 )
    ( airport l000-000 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person432 city592 )
    ( person-at person421 city198 )
    ( person-at person85 city739 )
    ( person-at person87 city867 )
    ( person-at person750 city810 )
    ( person-at person311 city646 )
    ( person-at person653 city198 )
    ( person-at person320 city379 )
    ( person-at person707 city651 )
    ( person-at person365 city555 )
    ( person-at person924 city806 )
    ( person-at person571 city611 )
    ( person-at person158 city725 )
  )
  ( :goal
    ( and
      ( person-at person432 city000 )
      ( person-at person421 city000 )
      ( person-at person85 city000 )
      ( person-at person87 city000 )
      ( person-at person750 city000 )
      ( person-at person311 city000 )
      ( person-at person653 city000 )
      ( person-at person320 city000 )
      ( person-at person707 city000 )
      ( person-at person365 city000 )
      ( person-at person924 city000 )
      ( person-at person571 city000 )
      ( person-at person158 city000 )
    )
  )
)
