( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-3PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-4PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-5PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?p5 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) ( PERSON-AT ?p5 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-6PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?p5 - PERSON
      ?p6 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) ( PERSON-AT ?p5 ?c ) ( PERSON-AT ?p6 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_238708 - PERSON
      ?auto_238707 - CITY
    )
    :vars
    (
      ?auto_238711 - FLEVEL
      ?auto_238710 - FLEVEL
      ?auto_238712 - CITY
      ?auto_238709 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_238711 ?auto_238710 ) ( PERSON-AT ?auto_238708 ?auto_238712 ) ( AIRCRAFT-AT ?auto_238709 ?auto_238707 ) ( FUEL-LEVEL ?auto_238709 ?auto_238711 ) ( not ( = ?auto_238707 ?auto_238712 ) ) ( not ( = ?auto_238711 ?auto_238710 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_238709 ?auto_238707 ?auto_238711 ?auto_238710 )
      ( !FLY ?auto_238709 ?auto_238707 ?auto_238712 ?auto_238710 ?auto_238711 )
      ( !REFUEL ?auto_238709 ?auto_238712 ?auto_238711 ?auto_238710 )
      ( !BOARD ?auto_238708 ?auto_238709 ?auto_238712 )
      ( !FLY ?auto_238709 ?auto_238712 ?auto_238707 ?auto_238710 ?auto_238711 )
      ( !DEBARK ?auto_238708 ?auto_238709 ?auto_238707 )
      ( FLY-1PPL-VERIFY ?auto_238708 ?auto_238707 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_238731 - PERSON
      ?auto_238732 - PERSON
      ?auto_238730 - CITY
    )
    :vars
    (
      ?auto_238734 - FLEVEL
      ?auto_238735 - FLEVEL
      ?auto_238736 - CITY
      ?auto_238737 - CITY
      ?auto_238733 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_238734 ?auto_238735 ) ( PERSON-AT ?auto_238732 ?auto_238736 ) ( not ( = ?auto_238730 ?auto_238736 ) ) ( not ( = ?auto_238734 ?auto_238735 ) ) ( PERSON-AT ?auto_238731 ?auto_238737 ) ( AIRCRAFT-AT ?auto_238733 ?auto_238730 ) ( FUEL-LEVEL ?auto_238733 ?auto_238734 ) ( not ( = ?auto_238730 ?auto_238737 ) ) ( not ( = ?auto_238731 ?auto_238732 ) ) ( not ( = ?auto_238736 ?auto_238737 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_238731 ?auto_238730 )
      ( FLY-1PPL ?auto_238732 ?auto_238730 )
      ( FLY-2PPL-VERIFY ?auto_238731 ?auto_238732 ?auto_238730 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_238845 - PERSON
      ?auto_238846 - PERSON
      ?auto_238847 - PERSON
      ?auto_238844 - CITY
    )
    :vars
    (
      ?auto_238849 - FLEVEL
      ?auto_238848 - FLEVEL
      ?auto_238851 - CITY
      ?auto_238852 - CITY
      ?auto_238850 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_238849 ?auto_238848 ) ( PERSON-AT ?auto_238847 ?auto_238851 ) ( not ( = ?auto_238844 ?auto_238851 ) ) ( not ( = ?auto_238849 ?auto_238848 ) ) ( PERSON-AT ?auto_238846 ?auto_238851 ) ( PERSON-AT ?auto_238845 ?auto_238852 ) ( AIRCRAFT-AT ?auto_238850 ?auto_238844 ) ( FUEL-LEVEL ?auto_238850 ?auto_238849 ) ( not ( = ?auto_238844 ?auto_238852 ) ) ( not ( = ?auto_238845 ?auto_238846 ) ) ( not ( = ?auto_238851 ?auto_238852 ) ) ( not ( = ?auto_238845 ?auto_238847 ) ) ( not ( = ?auto_238846 ?auto_238847 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_238845 ?auto_238846 ?auto_238844 )
      ( FLY-1PPL ?auto_238847 ?auto_238844 )
      ( FLY-3PPL-VERIFY ?auto_238845 ?auto_238846 ?auto_238847 ?auto_238844 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_238878 - PERSON
      ?auto_238879 - PERSON
      ?auto_238880 - PERSON
      ?auto_238877 - CITY
    )
    :vars
    (
      ?auto_238882 - FLEVEL
      ?auto_238883 - FLEVEL
      ?auto_238881 - CITY
      ?auto_238884 - CITY
      ?auto_238885 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_238882 ?auto_238883 ) ( PERSON-AT ?auto_238880 ?auto_238881 ) ( not ( = ?auto_238877 ?auto_238881 ) ) ( not ( = ?auto_238882 ?auto_238883 ) ) ( PERSON-AT ?auto_238878 ?auto_238881 ) ( PERSON-AT ?auto_238879 ?auto_238884 ) ( AIRCRAFT-AT ?auto_238885 ?auto_238877 ) ( FUEL-LEVEL ?auto_238885 ?auto_238882 ) ( not ( = ?auto_238877 ?auto_238884 ) ) ( not ( = ?auto_238879 ?auto_238878 ) ) ( not ( = ?auto_238881 ?auto_238884 ) ) ( not ( = ?auto_238879 ?auto_238880 ) ) ( not ( = ?auto_238878 ?auto_238880 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_238879 ?auto_238878 ?auto_238880 ?auto_238877 )
      ( FLY-3PPL-VERIFY ?auto_238878 ?auto_238879 ?auto_238880 ?auto_238877 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_238897 - PERSON
      ?auto_238898 - PERSON
      ?auto_238899 - PERSON
      ?auto_238896 - CITY
    )
    :vars
    (
      ?auto_238903 - FLEVEL
      ?auto_238900 - FLEVEL
      ?auto_238904 - CITY
      ?auto_238902 - CITY
      ?auto_238901 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_238903 ?auto_238900 ) ( PERSON-AT ?auto_238898 ?auto_238904 ) ( not ( = ?auto_238896 ?auto_238904 ) ) ( not ( = ?auto_238903 ?auto_238900 ) ) ( PERSON-AT ?auto_238897 ?auto_238904 ) ( PERSON-AT ?auto_238899 ?auto_238902 ) ( AIRCRAFT-AT ?auto_238901 ?auto_238896 ) ( FUEL-LEVEL ?auto_238901 ?auto_238903 ) ( not ( = ?auto_238896 ?auto_238902 ) ) ( not ( = ?auto_238899 ?auto_238897 ) ) ( not ( = ?auto_238904 ?auto_238902 ) ) ( not ( = ?auto_238899 ?auto_238898 ) ) ( not ( = ?auto_238897 ?auto_238898 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_238897 ?auto_238899 ?auto_238898 ?auto_238896 )
      ( FLY-3PPL-VERIFY ?auto_238897 ?auto_238898 ?auto_238899 ?auto_238896 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_239999 - PERSON
      ?auto_240000 - PERSON
      ?auto_240001 - PERSON
      ?auto_240002 - PERSON
      ?auto_239998 - CITY
    )
    :vars
    (
      ?auto_240005 - FLEVEL
      ?auto_240003 - FLEVEL
      ?auto_240004 - CITY
      ?auto_240008 - CITY
      ?auto_240007 - CITY
      ?auto_240006 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_240005 ?auto_240003 ) ( PERSON-AT ?auto_240002 ?auto_240004 ) ( not ( = ?auto_239998 ?auto_240004 ) ) ( not ( = ?auto_240005 ?auto_240003 ) ) ( PERSON-AT ?auto_240001 ?auto_240008 ) ( not ( = ?auto_239998 ?auto_240008 ) ) ( PERSON-AT ?auto_240000 ?auto_240008 ) ( PERSON-AT ?auto_239999 ?auto_240007 ) ( AIRCRAFT-AT ?auto_240006 ?auto_239998 ) ( FUEL-LEVEL ?auto_240006 ?auto_240005 ) ( not ( = ?auto_239998 ?auto_240007 ) ) ( not ( = ?auto_239999 ?auto_240000 ) ) ( not ( = ?auto_240008 ?auto_240007 ) ) ( not ( = ?auto_239999 ?auto_240001 ) ) ( not ( = ?auto_240000 ?auto_240001 ) ) ( not ( = ?auto_239999 ?auto_240002 ) ) ( not ( = ?auto_240000 ?auto_240002 ) ) ( not ( = ?auto_240001 ?auto_240002 ) ) ( not ( = ?auto_240004 ?auto_240008 ) ) ( not ( = ?auto_240004 ?auto_240007 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_240000 ?auto_239999 ?auto_240001 ?auto_239998 )
      ( FLY-1PPL ?auto_240002 ?auto_239998 )
      ( FLY-4PPL-VERIFY ?auto_239999 ?auto_240000 ?auto_240001 ?auto_240002 ?auto_239998 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_240034 - PERSON
      ?auto_240035 - PERSON
      ?auto_240036 - PERSON
      ?auto_240037 - PERSON
      ?auto_240033 - CITY
    )
    :vars
    (
      ?auto_240039 - FLEVEL
      ?auto_240043 - FLEVEL
      ?auto_240038 - CITY
      ?auto_240040 - CITY
      ?auto_240041 - CITY
      ?auto_240042 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_240039 ?auto_240043 ) ( PERSON-AT ?auto_240036 ?auto_240038 ) ( not ( = ?auto_240033 ?auto_240038 ) ) ( not ( = ?auto_240039 ?auto_240043 ) ) ( PERSON-AT ?auto_240037 ?auto_240040 ) ( not ( = ?auto_240033 ?auto_240040 ) ) ( PERSON-AT ?auto_240035 ?auto_240040 ) ( PERSON-AT ?auto_240034 ?auto_240041 ) ( AIRCRAFT-AT ?auto_240042 ?auto_240033 ) ( FUEL-LEVEL ?auto_240042 ?auto_240039 ) ( not ( = ?auto_240033 ?auto_240041 ) ) ( not ( = ?auto_240034 ?auto_240035 ) ) ( not ( = ?auto_240040 ?auto_240041 ) ) ( not ( = ?auto_240034 ?auto_240037 ) ) ( not ( = ?auto_240035 ?auto_240037 ) ) ( not ( = ?auto_240034 ?auto_240036 ) ) ( not ( = ?auto_240035 ?auto_240036 ) ) ( not ( = ?auto_240037 ?auto_240036 ) ) ( not ( = ?auto_240038 ?auto_240040 ) ) ( not ( = ?auto_240038 ?auto_240041 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_240034 ?auto_240035 ?auto_240037 ?auto_240036 ?auto_240033 )
      ( FLY-4PPL-VERIFY ?auto_240034 ?auto_240035 ?auto_240036 ?auto_240037 ?auto_240033 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_240201 - PERSON
      ?auto_240202 - PERSON
      ?auto_240203 - PERSON
      ?auto_240204 - PERSON
      ?auto_240200 - CITY
    )
    :vars
    (
      ?auto_240209 - FLEVEL
      ?auto_240206 - FLEVEL
      ?auto_240207 - CITY
      ?auto_240208 - CITY
      ?auto_240210 - CITY
      ?auto_240205 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_240209 ?auto_240206 ) ( PERSON-AT ?auto_240202 ?auto_240207 ) ( not ( = ?auto_240200 ?auto_240207 ) ) ( not ( = ?auto_240209 ?auto_240206 ) ) ( PERSON-AT ?auto_240204 ?auto_240208 ) ( not ( = ?auto_240200 ?auto_240208 ) ) ( PERSON-AT ?auto_240203 ?auto_240208 ) ( PERSON-AT ?auto_240201 ?auto_240210 ) ( AIRCRAFT-AT ?auto_240205 ?auto_240200 ) ( FUEL-LEVEL ?auto_240205 ?auto_240209 ) ( not ( = ?auto_240200 ?auto_240210 ) ) ( not ( = ?auto_240201 ?auto_240203 ) ) ( not ( = ?auto_240208 ?auto_240210 ) ) ( not ( = ?auto_240201 ?auto_240204 ) ) ( not ( = ?auto_240203 ?auto_240204 ) ) ( not ( = ?auto_240201 ?auto_240202 ) ) ( not ( = ?auto_240203 ?auto_240202 ) ) ( not ( = ?auto_240204 ?auto_240202 ) ) ( not ( = ?auto_240207 ?auto_240208 ) ) ( not ( = ?auto_240207 ?auto_240210 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_240201 ?auto_240203 ?auto_240202 ?auto_240204 ?auto_240200 )
      ( FLY-4PPL-VERIFY ?auto_240201 ?auto_240202 ?auto_240203 ?auto_240204 ?auto_240200 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_240339 - PERSON
      ?auto_240340 - PERSON
      ?auto_240341 - PERSON
      ?auto_240342 - PERSON
      ?auto_240338 - CITY
    )
    :vars
    (
      ?auto_240347 - FLEVEL
      ?auto_240344 - FLEVEL
      ?auto_240345 - CITY
      ?auto_240346 - CITY
      ?auto_240348 - CITY
      ?auto_240343 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_240347 ?auto_240344 ) ( PERSON-AT ?auto_240342 ?auto_240345 ) ( not ( = ?auto_240338 ?auto_240345 ) ) ( not ( = ?auto_240347 ?auto_240344 ) ) ( PERSON-AT ?auto_240341 ?auto_240346 ) ( not ( = ?auto_240338 ?auto_240346 ) ) ( PERSON-AT ?auto_240339 ?auto_240346 ) ( PERSON-AT ?auto_240340 ?auto_240348 ) ( AIRCRAFT-AT ?auto_240343 ?auto_240338 ) ( FUEL-LEVEL ?auto_240343 ?auto_240347 ) ( not ( = ?auto_240338 ?auto_240348 ) ) ( not ( = ?auto_240340 ?auto_240339 ) ) ( not ( = ?auto_240346 ?auto_240348 ) ) ( not ( = ?auto_240340 ?auto_240341 ) ) ( not ( = ?auto_240339 ?auto_240341 ) ) ( not ( = ?auto_240340 ?auto_240342 ) ) ( not ( = ?auto_240339 ?auto_240342 ) ) ( not ( = ?auto_240341 ?auto_240342 ) ) ( not ( = ?auto_240345 ?auto_240346 ) ) ( not ( = ?auto_240345 ?auto_240348 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_240340 ?auto_240339 ?auto_240342 ?auto_240341 ?auto_240338 )
      ( FLY-4PPL-VERIFY ?auto_240339 ?auto_240340 ?auto_240341 ?auto_240342 ?auto_240338 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_240374 - PERSON
      ?auto_240375 - PERSON
      ?auto_240376 - PERSON
      ?auto_240377 - PERSON
      ?auto_240373 - CITY
    )
    :vars
    (
      ?auto_240382 - FLEVEL
      ?auto_240379 - FLEVEL
      ?auto_240380 - CITY
      ?auto_240381 - CITY
      ?auto_240383 - CITY
      ?auto_240378 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_240382 ?auto_240379 ) ( PERSON-AT ?auto_240376 ?auto_240380 ) ( not ( = ?auto_240373 ?auto_240380 ) ) ( not ( = ?auto_240382 ?auto_240379 ) ) ( PERSON-AT ?auto_240377 ?auto_240381 ) ( not ( = ?auto_240373 ?auto_240381 ) ) ( PERSON-AT ?auto_240374 ?auto_240381 ) ( PERSON-AT ?auto_240375 ?auto_240383 ) ( AIRCRAFT-AT ?auto_240378 ?auto_240373 ) ( FUEL-LEVEL ?auto_240378 ?auto_240382 ) ( not ( = ?auto_240373 ?auto_240383 ) ) ( not ( = ?auto_240375 ?auto_240374 ) ) ( not ( = ?auto_240381 ?auto_240383 ) ) ( not ( = ?auto_240375 ?auto_240377 ) ) ( not ( = ?auto_240374 ?auto_240377 ) ) ( not ( = ?auto_240375 ?auto_240376 ) ) ( not ( = ?auto_240374 ?auto_240376 ) ) ( not ( = ?auto_240377 ?auto_240376 ) ) ( not ( = ?auto_240380 ?auto_240381 ) ) ( not ( = ?auto_240380 ?auto_240383 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_240375 ?auto_240374 ?auto_240376 ?auto_240377 ?auto_240373 )
      ( FLY-4PPL-VERIFY ?auto_240374 ?auto_240375 ?auto_240376 ?auto_240377 ?auto_240373 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_240484 - PERSON
      ?auto_240485 - PERSON
      ?auto_240486 - PERSON
      ?auto_240487 - PERSON
      ?auto_240483 - CITY
    )
    :vars
    (
      ?auto_240492 - FLEVEL
      ?auto_240489 - FLEVEL
      ?auto_240490 - CITY
      ?auto_240491 - CITY
      ?auto_240493 - CITY
      ?auto_240488 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_240492 ?auto_240489 ) ( PERSON-AT ?auto_240487 ?auto_240490 ) ( not ( = ?auto_240483 ?auto_240490 ) ) ( not ( = ?auto_240492 ?auto_240489 ) ) ( PERSON-AT ?auto_240485 ?auto_240491 ) ( not ( = ?auto_240483 ?auto_240491 ) ) ( PERSON-AT ?auto_240484 ?auto_240491 ) ( PERSON-AT ?auto_240486 ?auto_240493 ) ( AIRCRAFT-AT ?auto_240488 ?auto_240483 ) ( FUEL-LEVEL ?auto_240488 ?auto_240492 ) ( not ( = ?auto_240483 ?auto_240493 ) ) ( not ( = ?auto_240486 ?auto_240484 ) ) ( not ( = ?auto_240491 ?auto_240493 ) ) ( not ( = ?auto_240486 ?auto_240485 ) ) ( not ( = ?auto_240484 ?auto_240485 ) ) ( not ( = ?auto_240486 ?auto_240487 ) ) ( not ( = ?auto_240484 ?auto_240487 ) ) ( not ( = ?auto_240485 ?auto_240487 ) ) ( not ( = ?auto_240490 ?auto_240491 ) ) ( not ( = ?auto_240490 ?auto_240493 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_240486 ?auto_240484 ?auto_240487 ?auto_240485 ?auto_240483 )
      ( FLY-4PPL-VERIFY ?auto_240484 ?auto_240485 ?auto_240486 ?auto_240487 ?auto_240483 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_255640 - PERSON
      ?auto_255641 - PERSON
      ?auto_255642 - PERSON
      ?auto_255643 - PERSON
      ?auto_255644 - PERSON
      ?auto_255639 - CITY
    )
    :vars
    (
      ?auto_255645 - FLEVEL
      ?auto_255647 - FLEVEL
      ?auto_255648 - CITY
      ?auto_255649 - CITY
      ?auto_255650 - CITY
      ?auto_255646 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_255645 ?auto_255647 ) ( PERSON-AT ?auto_255644 ?auto_255648 ) ( not ( = ?auto_255639 ?auto_255648 ) ) ( not ( = ?auto_255645 ?auto_255647 ) ) ( PERSON-AT ?auto_255643 ?auto_255649 ) ( not ( = ?auto_255639 ?auto_255649 ) ) ( PERSON-AT ?auto_255642 ?auto_255648 ) ( PERSON-AT ?auto_255641 ?auto_255648 ) ( PERSON-AT ?auto_255640 ?auto_255650 ) ( AIRCRAFT-AT ?auto_255646 ?auto_255639 ) ( FUEL-LEVEL ?auto_255646 ?auto_255645 ) ( not ( = ?auto_255639 ?auto_255650 ) ) ( not ( = ?auto_255640 ?auto_255641 ) ) ( not ( = ?auto_255648 ?auto_255650 ) ) ( not ( = ?auto_255640 ?auto_255642 ) ) ( not ( = ?auto_255641 ?auto_255642 ) ) ( not ( = ?auto_255640 ?auto_255643 ) ) ( not ( = ?auto_255641 ?auto_255643 ) ) ( not ( = ?auto_255642 ?auto_255643 ) ) ( not ( = ?auto_255649 ?auto_255648 ) ) ( not ( = ?auto_255649 ?auto_255650 ) ) ( not ( = ?auto_255640 ?auto_255644 ) ) ( not ( = ?auto_255641 ?auto_255644 ) ) ( not ( = ?auto_255642 ?auto_255644 ) ) ( not ( = ?auto_255643 ?auto_255644 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_255640 ?auto_255641 ?auto_255643 ?auto_255642 ?auto_255639 )
      ( FLY-1PPL ?auto_255644 ?auto_255639 )
      ( FLY-5PPL-VERIFY ?auto_255640 ?auto_255641 ?auto_255642 ?auto_255643 ?auto_255644 ?auto_255639 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_255691 - PERSON
      ?auto_255692 - PERSON
      ?auto_255693 - PERSON
      ?auto_255694 - PERSON
      ?auto_255695 - PERSON
      ?auto_255690 - CITY
    )
    :vars
    (
      ?auto_255698 - FLEVEL
      ?auto_255700 - FLEVEL
      ?auto_255696 - CITY
      ?auto_255701 - CITY
      ?auto_255697 - CITY
      ?auto_255699 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_255698 ?auto_255700 ) ( PERSON-AT ?auto_255694 ?auto_255696 ) ( not ( = ?auto_255690 ?auto_255696 ) ) ( not ( = ?auto_255698 ?auto_255700 ) ) ( PERSON-AT ?auto_255695 ?auto_255701 ) ( not ( = ?auto_255690 ?auto_255701 ) ) ( PERSON-AT ?auto_255693 ?auto_255696 ) ( PERSON-AT ?auto_255692 ?auto_255696 ) ( PERSON-AT ?auto_255691 ?auto_255697 ) ( AIRCRAFT-AT ?auto_255699 ?auto_255690 ) ( FUEL-LEVEL ?auto_255699 ?auto_255698 ) ( not ( = ?auto_255690 ?auto_255697 ) ) ( not ( = ?auto_255691 ?auto_255692 ) ) ( not ( = ?auto_255696 ?auto_255697 ) ) ( not ( = ?auto_255691 ?auto_255693 ) ) ( not ( = ?auto_255692 ?auto_255693 ) ) ( not ( = ?auto_255691 ?auto_255695 ) ) ( not ( = ?auto_255692 ?auto_255695 ) ) ( not ( = ?auto_255693 ?auto_255695 ) ) ( not ( = ?auto_255701 ?auto_255696 ) ) ( not ( = ?auto_255701 ?auto_255697 ) ) ( not ( = ?auto_255691 ?auto_255694 ) ) ( not ( = ?auto_255692 ?auto_255694 ) ) ( not ( = ?auto_255693 ?auto_255694 ) ) ( not ( = ?auto_255695 ?auto_255694 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_255691 ?auto_255692 ?auto_255693 ?auto_255695 ?auto_255694 ?auto_255690 )
      ( FLY-5PPL-VERIFY ?auto_255691 ?auto_255692 ?auto_255693 ?auto_255694 ?auto_255695 ?auto_255690 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_255742 - PERSON
      ?auto_255743 - PERSON
      ?auto_255744 - PERSON
      ?auto_255745 - PERSON
      ?auto_255746 - PERSON
      ?auto_255741 - CITY
    )
    :vars
    (
      ?auto_255751 - FLEVEL
      ?auto_255752 - FLEVEL
      ?auto_255748 - CITY
      ?auto_255750 - CITY
      ?auto_255747 - CITY
      ?auto_255749 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_255751 ?auto_255752 ) ( PERSON-AT ?auto_255746 ?auto_255748 ) ( not ( = ?auto_255741 ?auto_255748 ) ) ( not ( = ?auto_255751 ?auto_255752 ) ) ( PERSON-AT ?auto_255744 ?auto_255750 ) ( not ( = ?auto_255741 ?auto_255750 ) ) ( PERSON-AT ?auto_255745 ?auto_255748 ) ( PERSON-AT ?auto_255743 ?auto_255748 ) ( PERSON-AT ?auto_255742 ?auto_255747 ) ( AIRCRAFT-AT ?auto_255749 ?auto_255741 ) ( FUEL-LEVEL ?auto_255749 ?auto_255751 ) ( not ( = ?auto_255741 ?auto_255747 ) ) ( not ( = ?auto_255742 ?auto_255743 ) ) ( not ( = ?auto_255748 ?auto_255747 ) ) ( not ( = ?auto_255742 ?auto_255745 ) ) ( not ( = ?auto_255743 ?auto_255745 ) ) ( not ( = ?auto_255742 ?auto_255744 ) ) ( not ( = ?auto_255743 ?auto_255744 ) ) ( not ( = ?auto_255745 ?auto_255744 ) ) ( not ( = ?auto_255750 ?auto_255748 ) ) ( not ( = ?auto_255750 ?auto_255747 ) ) ( not ( = ?auto_255742 ?auto_255746 ) ) ( not ( = ?auto_255743 ?auto_255746 ) ) ( not ( = ?auto_255745 ?auto_255746 ) ) ( not ( = ?auto_255744 ?auto_255746 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_255742 ?auto_255743 ?auto_255745 ?auto_255746 ?auto_255744 ?auto_255741 )
      ( FLY-5PPL-VERIFY ?auto_255742 ?auto_255743 ?auto_255744 ?auto_255745 ?auto_255746 ?auto_255741 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_257063 - PERSON
      ?auto_257064 - PERSON
      ?auto_257065 - PERSON
      ?auto_257066 - PERSON
      ?auto_257067 - PERSON
      ?auto_257062 - CITY
    )
    :vars
    (
      ?auto_257072 - FLEVEL
      ?auto_257073 - FLEVEL
      ?auto_257069 - CITY
      ?auto_257071 - CITY
      ?auto_257068 - CITY
      ?auto_257070 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_257072 ?auto_257073 ) ( PERSON-AT ?auto_257067 ?auto_257069 ) ( not ( = ?auto_257062 ?auto_257069 ) ) ( not ( = ?auto_257072 ?auto_257073 ) ) ( PERSON-AT ?auto_257064 ?auto_257071 ) ( not ( = ?auto_257062 ?auto_257071 ) ) ( PERSON-AT ?auto_257066 ?auto_257069 ) ( PERSON-AT ?auto_257065 ?auto_257069 ) ( PERSON-AT ?auto_257063 ?auto_257068 ) ( AIRCRAFT-AT ?auto_257070 ?auto_257062 ) ( FUEL-LEVEL ?auto_257070 ?auto_257072 ) ( not ( = ?auto_257062 ?auto_257068 ) ) ( not ( = ?auto_257063 ?auto_257065 ) ) ( not ( = ?auto_257069 ?auto_257068 ) ) ( not ( = ?auto_257063 ?auto_257066 ) ) ( not ( = ?auto_257065 ?auto_257066 ) ) ( not ( = ?auto_257063 ?auto_257064 ) ) ( not ( = ?auto_257065 ?auto_257064 ) ) ( not ( = ?auto_257066 ?auto_257064 ) ) ( not ( = ?auto_257071 ?auto_257069 ) ) ( not ( = ?auto_257071 ?auto_257068 ) ) ( not ( = ?auto_257063 ?auto_257067 ) ) ( not ( = ?auto_257065 ?auto_257067 ) ) ( not ( = ?auto_257066 ?auto_257067 ) ) ( not ( = ?auto_257064 ?auto_257067 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_257063 ?auto_257065 ?auto_257066 ?auto_257067 ?auto_257064 ?auto_257062 )
      ( FLY-5PPL-VERIFY ?auto_257063 ?auto_257064 ?auto_257065 ?auto_257066 ?auto_257067 ?auto_257062 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_259630 - PERSON
      ?auto_259631 - PERSON
      ?auto_259632 - PERSON
      ?auto_259633 - PERSON
      ?auto_259634 - PERSON
      ?auto_259629 - CITY
    )
    :vars
    (
      ?auto_259639 - FLEVEL
      ?auto_259640 - FLEVEL
      ?auto_259636 - CITY
      ?auto_259638 - CITY
      ?auto_259635 - CITY
      ?auto_259637 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_259639 ?auto_259640 ) ( PERSON-AT ?auto_259634 ?auto_259636 ) ( not ( = ?auto_259629 ?auto_259636 ) ) ( not ( = ?auto_259639 ?auto_259640 ) ) ( PERSON-AT ?auto_259633 ?auto_259638 ) ( not ( = ?auto_259629 ?auto_259638 ) ) ( PERSON-AT ?auto_259632 ?auto_259636 ) ( PERSON-AT ?auto_259630 ?auto_259636 ) ( PERSON-AT ?auto_259631 ?auto_259635 ) ( AIRCRAFT-AT ?auto_259637 ?auto_259629 ) ( FUEL-LEVEL ?auto_259637 ?auto_259639 ) ( not ( = ?auto_259629 ?auto_259635 ) ) ( not ( = ?auto_259631 ?auto_259630 ) ) ( not ( = ?auto_259636 ?auto_259635 ) ) ( not ( = ?auto_259631 ?auto_259632 ) ) ( not ( = ?auto_259630 ?auto_259632 ) ) ( not ( = ?auto_259631 ?auto_259633 ) ) ( not ( = ?auto_259630 ?auto_259633 ) ) ( not ( = ?auto_259632 ?auto_259633 ) ) ( not ( = ?auto_259638 ?auto_259636 ) ) ( not ( = ?auto_259638 ?auto_259635 ) ) ( not ( = ?auto_259631 ?auto_259634 ) ) ( not ( = ?auto_259630 ?auto_259634 ) ) ( not ( = ?auto_259632 ?auto_259634 ) ) ( not ( = ?auto_259633 ?auto_259634 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_259631 ?auto_259630 ?auto_259632 ?auto_259634 ?auto_259633 ?auto_259629 )
      ( FLY-5PPL-VERIFY ?auto_259630 ?auto_259631 ?auto_259632 ?auto_259633 ?auto_259634 ?auto_259629 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_259681 - PERSON
      ?auto_259682 - PERSON
      ?auto_259683 - PERSON
      ?auto_259684 - PERSON
      ?auto_259685 - PERSON
      ?auto_259680 - CITY
    )
    :vars
    (
      ?auto_259690 - FLEVEL
      ?auto_259691 - FLEVEL
      ?auto_259687 - CITY
      ?auto_259689 - CITY
      ?auto_259686 - CITY
      ?auto_259688 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_259690 ?auto_259691 ) ( PERSON-AT ?auto_259684 ?auto_259687 ) ( not ( = ?auto_259680 ?auto_259687 ) ) ( not ( = ?auto_259690 ?auto_259691 ) ) ( PERSON-AT ?auto_259685 ?auto_259689 ) ( not ( = ?auto_259680 ?auto_259689 ) ) ( PERSON-AT ?auto_259683 ?auto_259687 ) ( PERSON-AT ?auto_259681 ?auto_259687 ) ( PERSON-AT ?auto_259682 ?auto_259686 ) ( AIRCRAFT-AT ?auto_259688 ?auto_259680 ) ( FUEL-LEVEL ?auto_259688 ?auto_259690 ) ( not ( = ?auto_259680 ?auto_259686 ) ) ( not ( = ?auto_259682 ?auto_259681 ) ) ( not ( = ?auto_259687 ?auto_259686 ) ) ( not ( = ?auto_259682 ?auto_259683 ) ) ( not ( = ?auto_259681 ?auto_259683 ) ) ( not ( = ?auto_259682 ?auto_259685 ) ) ( not ( = ?auto_259681 ?auto_259685 ) ) ( not ( = ?auto_259683 ?auto_259685 ) ) ( not ( = ?auto_259689 ?auto_259687 ) ) ( not ( = ?auto_259689 ?auto_259686 ) ) ( not ( = ?auto_259682 ?auto_259684 ) ) ( not ( = ?auto_259681 ?auto_259684 ) ) ( not ( = ?auto_259683 ?auto_259684 ) ) ( not ( = ?auto_259685 ?auto_259684 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_259682 ?auto_259681 ?auto_259683 ?auto_259684 ?auto_259685 ?auto_259680 )
      ( FLY-5PPL-VERIFY ?auto_259681 ?auto_259682 ?auto_259683 ?auto_259684 ?auto_259685 ?auto_259680 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_259732 - PERSON
      ?auto_259733 - PERSON
      ?auto_259734 - PERSON
      ?auto_259735 - PERSON
      ?auto_259736 - PERSON
      ?auto_259731 - CITY
    )
    :vars
    (
      ?auto_259741 - FLEVEL
      ?auto_259742 - FLEVEL
      ?auto_259738 - CITY
      ?auto_259740 - CITY
      ?auto_259737 - CITY
      ?auto_259739 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_259741 ?auto_259742 ) ( PERSON-AT ?auto_259736 ?auto_259738 ) ( not ( = ?auto_259731 ?auto_259738 ) ) ( not ( = ?auto_259741 ?auto_259742 ) ) ( PERSON-AT ?auto_259734 ?auto_259740 ) ( not ( = ?auto_259731 ?auto_259740 ) ) ( PERSON-AT ?auto_259735 ?auto_259738 ) ( PERSON-AT ?auto_259732 ?auto_259738 ) ( PERSON-AT ?auto_259733 ?auto_259737 ) ( AIRCRAFT-AT ?auto_259739 ?auto_259731 ) ( FUEL-LEVEL ?auto_259739 ?auto_259741 ) ( not ( = ?auto_259731 ?auto_259737 ) ) ( not ( = ?auto_259733 ?auto_259732 ) ) ( not ( = ?auto_259738 ?auto_259737 ) ) ( not ( = ?auto_259733 ?auto_259735 ) ) ( not ( = ?auto_259732 ?auto_259735 ) ) ( not ( = ?auto_259733 ?auto_259734 ) ) ( not ( = ?auto_259732 ?auto_259734 ) ) ( not ( = ?auto_259735 ?auto_259734 ) ) ( not ( = ?auto_259740 ?auto_259738 ) ) ( not ( = ?auto_259740 ?auto_259737 ) ) ( not ( = ?auto_259733 ?auto_259736 ) ) ( not ( = ?auto_259732 ?auto_259736 ) ) ( not ( = ?auto_259735 ?auto_259736 ) ) ( not ( = ?auto_259734 ?auto_259736 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_259733 ?auto_259732 ?auto_259735 ?auto_259736 ?auto_259734 ?auto_259731 )
      ( FLY-5PPL-VERIFY ?auto_259732 ?auto_259733 ?auto_259734 ?auto_259735 ?auto_259736 ?auto_259731 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_261017 - PERSON
      ?auto_261018 - PERSON
      ?auto_261019 - PERSON
      ?auto_261020 - PERSON
      ?auto_261021 - PERSON
      ?auto_261016 - CITY
    )
    :vars
    (
      ?auto_261026 - FLEVEL
      ?auto_261027 - FLEVEL
      ?auto_261023 - CITY
      ?auto_261025 - CITY
      ?auto_261022 - CITY
      ?auto_261024 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_261026 ?auto_261027 ) ( PERSON-AT ?auto_261021 ?auto_261023 ) ( not ( = ?auto_261016 ?auto_261023 ) ) ( not ( = ?auto_261026 ?auto_261027 ) ) ( PERSON-AT ?auto_261020 ?auto_261025 ) ( not ( = ?auto_261016 ?auto_261025 ) ) ( PERSON-AT ?auto_261018 ?auto_261023 ) ( PERSON-AT ?auto_261017 ?auto_261023 ) ( PERSON-AT ?auto_261019 ?auto_261022 ) ( AIRCRAFT-AT ?auto_261024 ?auto_261016 ) ( FUEL-LEVEL ?auto_261024 ?auto_261026 ) ( not ( = ?auto_261016 ?auto_261022 ) ) ( not ( = ?auto_261019 ?auto_261017 ) ) ( not ( = ?auto_261023 ?auto_261022 ) ) ( not ( = ?auto_261019 ?auto_261018 ) ) ( not ( = ?auto_261017 ?auto_261018 ) ) ( not ( = ?auto_261019 ?auto_261020 ) ) ( not ( = ?auto_261017 ?auto_261020 ) ) ( not ( = ?auto_261018 ?auto_261020 ) ) ( not ( = ?auto_261025 ?auto_261023 ) ) ( not ( = ?auto_261025 ?auto_261022 ) ) ( not ( = ?auto_261019 ?auto_261021 ) ) ( not ( = ?auto_261017 ?auto_261021 ) ) ( not ( = ?auto_261018 ?auto_261021 ) ) ( not ( = ?auto_261020 ?auto_261021 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_261019 ?auto_261017 ?auto_261018 ?auto_261021 ?auto_261020 ?auto_261016 )
      ( FLY-5PPL-VERIFY ?auto_261017 ?auto_261018 ?auto_261019 ?auto_261020 ?auto_261021 ?auto_261016 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_261068 - PERSON
      ?auto_261069 - PERSON
      ?auto_261070 - PERSON
      ?auto_261071 - PERSON
      ?auto_261072 - PERSON
      ?auto_261067 - CITY
    )
    :vars
    (
      ?auto_261077 - FLEVEL
      ?auto_261078 - FLEVEL
      ?auto_261074 - CITY
      ?auto_261076 - CITY
      ?auto_261073 - CITY
      ?auto_261075 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_261077 ?auto_261078 ) ( PERSON-AT ?auto_261071 ?auto_261074 ) ( not ( = ?auto_261067 ?auto_261074 ) ) ( not ( = ?auto_261077 ?auto_261078 ) ) ( PERSON-AT ?auto_261072 ?auto_261076 ) ( not ( = ?auto_261067 ?auto_261076 ) ) ( PERSON-AT ?auto_261069 ?auto_261074 ) ( PERSON-AT ?auto_261068 ?auto_261074 ) ( PERSON-AT ?auto_261070 ?auto_261073 ) ( AIRCRAFT-AT ?auto_261075 ?auto_261067 ) ( FUEL-LEVEL ?auto_261075 ?auto_261077 ) ( not ( = ?auto_261067 ?auto_261073 ) ) ( not ( = ?auto_261070 ?auto_261068 ) ) ( not ( = ?auto_261074 ?auto_261073 ) ) ( not ( = ?auto_261070 ?auto_261069 ) ) ( not ( = ?auto_261068 ?auto_261069 ) ) ( not ( = ?auto_261070 ?auto_261072 ) ) ( not ( = ?auto_261068 ?auto_261072 ) ) ( not ( = ?auto_261069 ?auto_261072 ) ) ( not ( = ?auto_261076 ?auto_261074 ) ) ( not ( = ?auto_261076 ?auto_261073 ) ) ( not ( = ?auto_261070 ?auto_261071 ) ) ( not ( = ?auto_261068 ?auto_261071 ) ) ( not ( = ?auto_261069 ?auto_261071 ) ) ( not ( = ?auto_261072 ?auto_261071 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_261070 ?auto_261068 ?auto_261069 ?auto_261071 ?auto_261072 ?auto_261067 )
      ( FLY-5PPL-VERIFY ?auto_261068 ?auto_261069 ?auto_261070 ?auto_261071 ?auto_261072 ?auto_261067 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_261479 - PERSON
      ?auto_261480 - PERSON
      ?auto_261481 - PERSON
      ?auto_261482 - PERSON
      ?auto_261483 - PERSON
      ?auto_261478 - CITY
    )
    :vars
    (
      ?auto_261488 - FLEVEL
      ?auto_261489 - FLEVEL
      ?auto_261485 - CITY
      ?auto_261487 - CITY
      ?auto_261484 - CITY
      ?auto_261486 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_261488 ?auto_261489 ) ( PERSON-AT ?auto_261481 ?auto_261485 ) ( not ( = ?auto_261478 ?auto_261485 ) ) ( not ( = ?auto_261488 ?auto_261489 ) ) ( PERSON-AT ?auto_261483 ?auto_261487 ) ( not ( = ?auto_261478 ?auto_261487 ) ) ( PERSON-AT ?auto_261480 ?auto_261485 ) ( PERSON-AT ?auto_261479 ?auto_261485 ) ( PERSON-AT ?auto_261482 ?auto_261484 ) ( AIRCRAFT-AT ?auto_261486 ?auto_261478 ) ( FUEL-LEVEL ?auto_261486 ?auto_261488 ) ( not ( = ?auto_261478 ?auto_261484 ) ) ( not ( = ?auto_261482 ?auto_261479 ) ) ( not ( = ?auto_261485 ?auto_261484 ) ) ( not ( = ?auto_261482 ?auto_261480 ) ) ( not ( = ?auto_261479 ?auto_261480 ) ) ( not ( = ?auto_261482 ?auto_261483 ) ) ( not ( = ?auto_261479 ?auto_261483 ) ) ( not ( = ?auto_261480 ?auto_261483 ) ) ( not ( = ?auto_261487 ?auto_261485 ) ) ( not ( = ?auto_261487 ?auto_261484 ) ) ( not ( = ?auto_261482 ?auto_261481 ) ) ( not ( = ?auto_261479 ?auto_261481 ) ) ( not ( = ?auto_261480 ?auto_261481 ) ) ( not ( = ?auto_261483 ?auto_261481 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_261482 ?auto_261479 ?auto_261480 ?auto_261481 ?auto_261483 ?auto_261478 )
      ( FLY-5PPL-VERIFY ?auto_261479 ?auto_261480 ?auto_261481 ?auto_261482 ?auto_261483 ?auto_261478 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_512885 - PERSON
      ?auto_512886 - PERSON
      ?auto_512887 - PERSON
      ?auto_512888 - PERSON
      ?auto_512889 - PERSON
      ?auto_512890 - PERSON
      ?auto_512884 - CITY
    )
    :vars
    (
      ?auto_512893 - FLEVEL
      ?auto_512892 - FLEVEL
      ?auto_512894 - CITY
      ?auto_512896 - CITY
      ?auto_512895 - CITY
      ?auto_512891 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_512893 ?auto_512892 ) ( PERSON-AT ?auto_512890 ?auto_512894 ) ( not ( = ?auto_512884 ?auto_512894 ) ) ( not ( = ?auto_512893 ?auto_512892 ) ) ( PERSON-AT ?auto_512889 ?auto_512896 ) ( not ( = ?auto_512884 ?auto_512896 ) ) ( PERSON-AT ?auto_512888 ?auto_512894 ) ( PERSON-AT ?auto_512887 ?auto_512896 ) ( PERSON-AT ?auto_512886 ?auto_512896 ) ( PERSON-AT ?auto_512885 ?auto_512895 ) ( AIRCRAFT-AT ?auto_512891 ?auto_512884 ) ( FUEL-LEVEL ?auto_512891 ?auto_512893 ) ( not ( = ?auto_512884 ?auto_512895 ) ) ( not ( = ?auto_512885 ?auto_512886 ) ) ( not ( = ?auto_512896 ?auto_512895 ) ) ( not ( = ?auto_512885 ?auto_512887 ) ) ( not ( = ?auto_512886 ?auto_512887 ) ) ( not ( = ?auto_512885 ?auto_512888 ) ) ( not ( = ?auto_512886 ?auto_512888 ) ) ( not ( = ?auto_512887 ?auto_512888 ) ) ( not ( = ?auto_512894 ?auto_512896 ) ) ( not ( = ?auto_512894 ?auto_512895 ) ) ( not ( = ?auto_512885 ?auto_512889 ) ) ( not ( = ?auto_512886 ?auto_512889 ) ) ( not ( = ?auto_512887 ?auto_512889 ) ) ( not ( = ?auto_512888 ?auto_512889 ) ) ( not ( = ?auto_512885 ?auto_512890 ) ) ( not ( = ?auto_512886 ?auto_512890 ) ) ( not ( = ?auto_512887 ?auto_512890 ) ) ( not ( = ?auto_512888 ?auto_512890 ) ) ( not ( = ?auto_512889 ?auto_512890 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_512885 ?auto_512886 ?auto_512887 ?auto_512889 ?auto_512888 ?auto_512884 )
      ( FLY-1PPL ?auto_512890 ?auto_512884 )
      ( FLY-6PPL-VERIFY ?auto_512885 ?auto_512886 ?auto_512887 ?auto_512888 ?auto_512889 ?auto_512890 ?auto_512884 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_512954 - PERSON
      ?auto_512955 - PERSON
      ?auto_512956 - PERSON
      ?auto_512957 - PERSON
      ?auto_512958 - PERSON
      ?auto_512959 - PERSON
      ?auto_512953 - CITY
    )
    :vars
    (
      ?auto_512961 - FLEVEL
      ?auto_512963 - FLEVEL
      ?auto_512964 - CITY
      ?auto_512962 - CITY
      ?auto_512965 - CITY
      ?auto_512960 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_512961 ?auto_512963 ) ( PERSON-AT ?auto_512958 ?auto_512964 ) ( not ( = ?auto_512953 ?auto_512964 ) ) ( not ( = ?auto_512961 ?auto_512963 ) ) ( PERSON-AT ?auto_512959 ?auto_512962 ) ( not ( = ?auto_512953 ?auto_512962 ) ) ( PERSON-AT ?auto_512957 ?auto_512964 ) ( PERSON-AT ?auto_512956 ?auto_512962 ) ( PERSON-AT ?auto_512955 ?auto_512962 ) ( PERSON-AT ?auto_512954 ?auto_512965 ) ( AIRCRAFT-AT ?auto_512960 ?auto_512953 ) ( FUEL-LEVEL ?auto_512960 ?auto_512961 ) ( not ( = ?auto_512953 ?auto_512965 ) ) ( not ( = ?auto_512954 ?auto_512955 ) ) ( not ( = ?auto_512962 ?auto_512965 ) ) ( not ( = ?auto_512954 ?auto_512956 ) ) ( not ( = ?auto_512955 ?auto_512956 ) ) ( not ( = ?auto_512954 ?auto_512957 ) ) ( not ( = ?auto_512955 ?auto_512957 ) ) ( not ( = ?auto_512956 ?auto_512957 ) ) ( not ( = ?auto_512964 ?auto_512962 ) ) ( not ( = ?auto_512964 ?auto_512965 ) ) ( not ( = ?auto_512954 ?auto_512959 ) ) ( not ( = ?auto_512955 ?auto_512959 ) ) ( not ( = ?auto_512956 ?auto_512959 ) ) ( not ( = ?auto_512957 ?auto_512959 ) ) ( not ( = ?auto_512954 ?auto_512958 ) ) ( not ( = ?auto_512955 ?auto_512958 ) ) ( not ( = ?auto_512956 ?auto_512958 ) ) ( not ( = ?auto_512957 ?auto_512958 ) ) ( not ( = ?auto_512959 ?auto_512958 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_512954 ?auto_512955 ?auto_512956 ?auto_512957 ?auto_512959 ?auto_512958 ?auto_512953 )
      ( FLY-6PPL-VERIFY ?auto_512954 ?auto_512955 ?auto_512956 ?auto_512957 ?auto_512958 ?auto_512959 ?auto_512953 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_513023 - PERSON
      ?auto_513024 - PERSON
      ?auto_513025 - PERSON
      ?auto_513026 - PERSON
      ?auto_513027 - PERSON
      ?auto_513028 - PERSON
      ?auto_513022 - CITY
    )
    :vars
    (
      ?auto_513033 - FLEVEL
      ?auto_513032 - FLEVEL
      ?auto_513031 - CITY
      ?auto_513029 - CITY
      ?auto_513034 - CITY
      ?auto_513030 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_513033 ?auto_513032 ) ( PERSON-AT ?auto_513028 ?auto_513031 ) ( not ( = ?auto_513022 ?auto_513031 ) ) ( not ( = ?auto_513033 ?auto_513032 ) ) ( PERSON-AT ?auto_513026 ?auto_513029 ) ( not ( = ?auto_513022 ?auto_513029 ) ) ( PERSON-AT ?auto_513027 ?auto_513031 ) ( PERSON-AT ?auto_513025 ?auto_513029 ) ( PERSON-AT ?auto_513024 ?auto_513029 ) ( PERSON-AT ?auto_513023 ?auto_513034 ) ( AIRCRAFT-AT ?auto_513030 ?auto_513022 ) ( FUEL-LEVEL ?auto_513030 ?auto_513033 ) ( not ( = ?auto_513022 ?auto_513034 ) ) ( not ( = ?auto_513023 ?auto_513024 ) ) ( not ( = ?auto_513029 ?auto_513034 ) ) ( not ( = ?auto_513023 ?auto_513025 ) ) ( not ( = ?auto_513024 ?auto_513025 ) ) ( not ( = ?auto_513023 ?auto_513027 ) ) ( not ( = ?auto_513024 ?auto_513027 ) ) ( not ( = ?auto_513025 ?auto_513027 ) ) ( not ( = ?auto_513031 ?auto_513029 ) ) ( not ( = ?auto_513031 ?auto_513034 ) ) ( not ( = ?auto_513023 ?auto_513026 ) ) ( not ( = ?auto_513024 ?auto_513026 ) ) ( not ( = ?auto_513025 ?auto_513026 ) ) ( not ( = ?auto_513027 ?auto_513026 ) ) ( not ( = ?auto_513023 ?auto_513028 ) ) ( not ( = ?auto_513024 ?auto_513028 ) ) ( not ( = ?auto_513025 ?auto_513028 ) ) ( not ( = ?auto_513027 ?auto_513028 ) ) ( not ( = ?auto_513026 ?auto_513028 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_513023 ?auto_513024 ?auto_513025 ?auto_513027 ?auto_513028 ?auto_513026 ?auto_513022 )
      ( FLY-6PPL-VERIFY ?auto_513023 ?auto_513024 ?auto_513025 ?auto_513026 ?auto_513027 ?auto_513028 ?auto_513022 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_514011 - PERSON
      ?auto_514012 - PERSON
      ?auto_514013 - PERSON
      ?auto_514014 - PERSON
      ?auto_514015 - PERSON
      ?auto_514016 - PERSON
      ?auto_514010 - CITY
    )
    :vars
    (
      ?auto_514021 - FLEVEL
      ?auto_514020 - FLEVEL
      ?auto_514019 - CITY
      ?auto_514017 - CITY
      ?auto_514022 - CITY
      ?auto_514018 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_514021 ?auto_514020 ) ( PERSON-AT ?auto_514016 ?auto_514019 ) ( not ( = ?auto_514010 ?auto_514019 ) ) ( not ( = ?auto_514021 ?auto_514020 ) ) ( PERSON-AT ?auto_514015 ?auto_514017 ) ( not ( = ?auto_514010 ?auto_514017 ) ) ( PERSON-AT ?auto_514013 ?auto_514019 ) ( PERSON-AT ?auto_514014 ?auto_514017 ) ( PERSON-AT ?auto_514012 ?auto_514017 ) ( PERSON-AT ?auto_514011 ?auto_514022 ) ( AIRCRAFT-AT ?auto_514018 ?auto_514010 ) ( FUEL-LEVEL ?auto_514018 ?auto_514021 ) ( not ( = ?auto_514010 ?auto_514022 ) ) ( not ( = ?auto_514011 ?auto_514012 ) ) ( not ( = ?auto_514017 ?auto_514022 ) ) ( not ( = ?auto_514011 ?auto_514014 ) ) ( not ( = ?auto_514012 ?auto_514014 ) ) ( not ( = ?auto_514011 ?auto_514013 ) ) ( not ( = ?auto_514012 ?auto_514013 ) ) ( not ( = ?auto_514014 ?auto_514013 ) ) ( not ( = ?auto_514019 ?auto_514017 ) ) ( not ( = ?auto_514019 ?auto_514022 ) ) ( not ( = ?auto_514011 ?auto_514015 ) ) ( not ( = ?auto_514012 ?auto_514015 ) ) ( not ( = ?auto_514014 ?auto_514015 ) ) ( not ( = ?auto_514013 ?auto_514015 ) ) ( not ( = ?auto_514011 ?auto_514016 ) ) ( not ( = ?auto_514012 ?auto_514016 ) ) ( not ( = ?auto_514014 ?auto_514016 ) ) ( not ( = ?auto_514013 ?auto_514016 ) ) ( not ( = ?auto_514015 ?auto_514016 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_514011 ?auto_514012 ?auto_514014 ?auto_514013 ?auto_514016 ?auto_514015 ?auto_514010 )
      ( FLY-6PPL-VERIFY ?auto_514011 ?auto_514012 ?auto_514013 ?auto_514014 ?auto_514015 ?auto_514016 ?auto_514010 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_514080 - PERSON
      ?auto_514081 - PERSON
      ?auto_514082 - PERSON
      ?auto_514083 - PERSON
      ?auto_514084 - PERSON
      ?auto_514085 - PERSON
      ?auto_514079 - CITY
    )
    :vars
    (
      ?auto_514090 - FLEVEL
      ?auto_514089 - FLEVEL
      ?auto_514088 - CITY
      ?auto_514086 - CITY
      ?auto_514091 - CITY
      ?auto_514087 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_514090 ?auto_514089 ) ( PERSON-AT ?auto_514084 ?auto_514088 ) ( not ( = ?auto_514079 ?auto_514088 ) ) ( not ( = ?auto_514090 ?auto_514089 ) ) ( PERSON-AT ?auto_514085 ?auto_514086 ) ( not ( = ?auto_514079 ?auto_514086 ) ) ( PERSON-AT ?auto_514082 ?auto_514088 ) ( PERSON-AT ?auto_514083 ?auto_514086 ) ( PERSON-AT ?auto_514081 ?auto_514086 ) ( PERSON-AT ?auto_514080 ?auto_514091 ) ( AIRCRAFT-AT ?auto_514087 ?auto_514079 ) ( FUEL-LEVEL ?auto_514087 ?auto_514090 ) ( not ( = ?auto_514079 ?auto_514091 ) ) ( not ( = ?auto_514080 ?auto_514081 ) ) ( not ( = ?auto_514086 ?auto_514091 ) ) ( not ( = ?auto_514080 ?auto_514083 ) ) ( not ( = ?auto_514081 ?auto_514083 ) ) ( not ( = ?auto_514080 ?auto_514082 ) ) ( not ( = ?auto_514081 ?auto_514082 ) ) ( not ( = ?auto_514083 ?auto_514082 ) ) ( not ( = ?auto_514088 ?auto_514086 ) ) ( not ( = ?auto_514088 ?auto_514091 ) ) ( not ( = ?auto_514080 ?auto_514085 ) ) ( not ( = ?auto_514081 ?auto_514085 ) ) ( not ( = ?auto_514083 ?auto_514085 ) ) ( not ( = ?auto_514082 ?auto_514085 ) ) ( not ( = ?auto_514080 ?auto_514084 ) ) ( not ( = ?auto_514081 ?auto_514084 ) ) ( not ( = ?auto_514083 ?auto_514084 ) ) ( not ( = ?auto_514082 ?auto_514084 ) ) ( not ( = ?auto_514085 ?auto_514084 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_514080 ?auto_514081 ?auto_514083 ?auto_514082 ?auto_514084 ?auto_514085 ?auto_514079 )
      ( FLY-6PPL-VERIFY ?auto_514080 ?auto_514081 ?auto_514082 ?auto_514083 ?auto_514084 ?auto_514085 ?auto_514079 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_514640 - PERSON
      ?auto_514641 - PERSON
      ?auto_514642 - PERSON
      ?auto_514643 - PERSON
      ?auto_514644 - PERSON
      ?auto_514645 - PERSON
      ?auto_514639 - CITY
    )
    :vars
    (
      ?auto_514650 - FLEVEL
      ?auto_514649 - FLEVEL
      ?auto_514648 - CITY
      ?auto_514646 - CITY
      ?auto_514651 - CITY
      ?auto_514647 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_514650 ?auto_514649 ) ( PERSON-AT ?auto_514643 ?auto_514648 ) ( not ( = ?auto_514639 ?auto_514648 ) ) ( not ( = ?auto_514650 ?auto_514649 ) ) ( PERSON-AT ?auto_514645 ?auto_514646 ) ( not ( = ?auto_514639 ?auto_514646 ) ) ( PERSON-AT ?auto_514642 ?auto_514648 ) ( PERSON-AT ?auto_514644 ?auto_514646 ) ( PERSON-AT ?auto_514641 ?auto_514646 ) ( PERSON-AT ?auto_514640 ?auto_514651 ) ( AIRCRAFT-AT ?auto_514647 ?auto_514639 ) ( FUEL-LEVEL ?auto_514647 ?auto_514650 ) ( not ( = ?auto_514639 ?auto_514651 ) ) ( not ( = ?auto_514640 ?auto_514641 ) ) ( not ( = ?auto_514646 ?auto_514651 ) ) ( not ( = ?auto_514640 ?auto_514644 ) ) ( not ( = ?auto_514641 ?auto_514644 ) ) ( not ( = ?auto_514640 ?auto_514642 ) ) ( not ( = ?auto_514641 ?auto_514642 ) ) ( not ( = ?auto_514644 ?auto_514642 ) ) ( not ( = ?auto_514648 ?auto_514646 ) ) ( not ( = ?auto_514648 ?auto_514651 ) ) ( not ( = ?auto_514640 ?auto_514645 ) ) ( not ( = ?auto_514641 ?auto_514645 ) ) ( not ( = ?auto_514644 ?auto_514645 ) ) ( not ( = ?auto_514642 ?auto_514645 ) ) ( not ( = ?auto_514640 ?auto_514643 ) ) ( not ( = ?auto_514641 ?auto_514643 ) ) ( not ( = ?auto_514644 ?auto_514643 ) ) ( not ( = ?auto_514642 ?auto_514643 ) ) ( not ( = ?auto_514645 ?auto_514643 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_514640 ?auto_514641 ?auto_514644 ?auto_514642 ?auto_514643 ?auto_514645 ?auto_514639 )
      ( FLY-6PPL-VERIFY ?auto_514640 ?auto_514641 ?auto_514642 ?auto_514643 ?auto_514644 ?auto_514645 ?auto_514639 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_530766 - PERSON
      ?auto_530767 - PERSON
      ?auto_530768 - PERSON
      ?auto_530769 - PERSON
      ?auto_530770 - PERSON
      ?auto_530771 - PERSON
      ?auto_530765 - CITY
    )
    :vars
    (
      ?auto_530776 - FLEVEL
      ?auto_530775 - FLEVEL
      ?auto_530774 - CITY
      ?auto_530772 - CITY
      ?auto_530777 - CITY
      ?auto_530773 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_530776 ?auto_530775 ) ( PERSON-AT ?auto_530771 ?auto_530774 ) ( not ( = ?auto_530765 ?auto_530774 ) ) ( not ( = ?auto_530776 ?auto_530775 ) ) ( PERSON-AT ?auto_530770 ?auto_530772 ) ( not ( = ?auto_530765 ?auto_530772 ) ) ( PERSON-AT ?auto_530767 ?auto_530774 ) ( PERSON-AT ?auto_530769 ?auto_530772 ) ( PERSON-AT ?auto_530768 ?auto_530772 ) ( PERSON-AT ?auto_530766 ?auto_530777 ) ( AIRCRAFT-AT ?auto_530773 ?auto_530765 ) ( FUEL-LEVEL ?auto_530773 ?auto_530776 ) ( not ( = ?auto_530765 ?auto_530777 ) ) ( not ( = ?auto_530766 ?auto_530768 ) ) ( not ( = ?auto_530772 ?auto_530777 ) ) ( not ( = ?auto_530766 ?auto_530769 ) ) ( not ( = ?auto_530768 ?auto_530769 ) ) ( not ( = ?auto_530766 ?auto_530767 ) ) ( not ( = ?auto_530768 ?auto_530767 ) ) ( not ( = ?auto_530769 ?auto_530767 ) ) ( not ( = ?auto_530774 ?auto_530772 ) ) ( not ( = ?auto_530774 ?auto_530777 ) ) ( not ( = ?auto_530766 ?auto_530770 ) ) ( not ( = ?auto_530768 ?auto_530770 ) ) ( not ( = ?auto_530769 ?auto_530770 ) ) ( not ( = ?auto_530767 ?auto_530770 ) ) ( not ( = ?auto_530766 ?auto_530771 ) ) ( not ( = ?auto_530768 ?auto_530771 ) ) ( not ( = ?auto_530769 ?auto_530771 ) ) ( not ( = ?auto_530767 ?auto_530771 ) ) ( not ( = ?auto_530770 ?auto_530771 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_530766 ?auto_530768 ?auto_530769 ?auto_530767 ?auto_530771 ?auto_530770 ?auto_530765 )
      ( FLY-6PPL-VERIFY ?auto_530766 ?auto_530767 ?auto_530768 ?auto_530769 ?auto_530770 ?auto_530771 ?auto_530765 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_530835 - PERSON
      ?auto_530836 - PERSON
      ?auto_530837 - PERSON
      ?auto_530838 - PERSON
      ?auto_530839 - PERSON
      ?auto_530840 - PERSON
      ?auto_530834 - CITY
    )
    :vars
    (
      ?auto_530845 - FLEVEL
      ?auto_530844 - FLEVEL
      ?auto_530843 - CITY
      ?auto_530841 - CITY
      ?auto_530846 - CITY
      ?auto_530842 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_530845 ?auto_530844 ) ( PERSON-AT ?auto_530839 ?auto_530843 ) ( not ( = ?auto_530834 ?auto_530843 ) ) ( not ( = ?auto_530845 ?auto_530844 ) ) ( PERSON-AT ?auto_530840 ?auto_530841 ) ( not ( = ?auto_530834 ?auto_530841 ) ) ( PERSON-AT ?auto_530836 ?auto_530843 ) ( PERSON-AT ?auto_530838 ?auto_530841 ) ( PERSON-AT ?auto_530837 ?auto_530841 ) ( PERSON-AT ?auto_530835 ?auto_530846 ) ( AIRCRAFT-AT ?auto_530842 ?auto_530834 ) ( FUEL-LEVEL ?auto_530842 ?auto_530845 ) ( not ( = ?auto_530834 ?auto_530846 ) ) ( not ( = ?auto_530835 ?auto_530837 ) ) ( not ( = ?auto_530841 ?auto_530846 ) ) ( not ( = ?auto_530835 ?auto_530838 ) ) ( not ( = ?auto_530837 ?auto_530838 ) ) ( not ( = ?auto_530835 ?auto_530836 ) ) ( not ( = ?auto_530837 ?auto_530836 ) ) ( not ( = ?auto_530838 ?auto_530836 ) ) ( not ( = ?auto_530843 ?auto_530841 ) ) ( not ( = ?auto_530843 ?auto_530846 ) ) ( not ( = ?auto_530835 ?auto_530840 ) ) ( not ( = ?auto_530837 ?auto_530840 ) ) ( not ( = ?auto_530838 ?auto_530840 ) ) ( not ( = ?auto_530836 ?auto_530840 ) ) ( not ( = ?auto_530835 ?auto_530839 ) ) ( not ( = ?auto_530837 ?auto_530839 ) ) ( not ( = ?auto_530838 ?auto_530839 ) ) ( not ( = ?auto_530836 ?auto_530839 ) ) ( not ( = ?auto_530840 ?auto_530839 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_530835 ?auto_530837 ?auto_530838 ?auto_530836 ?auto_530839 ?auto_530840 ?auto_530834 )
      ( FLY-6PPL-VERIFY ?auto_530835 ?auto_530836 ?auto_530837 ?auto_530838 ?auto_530839 ?auto_530840 ?auto_530834 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_531395 - PERSON
      ?auto_531396 - PERSON
      ?auto_531397 - PERSON
      ?auto_531398 - PERSON
      ?auto_531399 - PERSON
      ?auto_531400 - PERSON
      ?auto_531394 - CITY
    )
    :vars
    (
      ?auto_531405 - FLEVEL
      ?auto_531404 - FLEVEL
      ?auto_531403 - CITY
      ?auto_531401 - CITY
      ?auto_531406 - CITY
      ?auto_531402 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_531405 ?auto_531404 ) ( PERSON-AT ?auto_531398 ?auto_531403 ) ( not ( = ?auto_531394 ?auto_531403 ) ) ( not ( = ?auto_531405 ?auto_531404 ) ) ( PERSON-AT ?auto_531400 ?auto_531401 ) ( not ( = ?auto_531394 ?auto_531401 ) ) ( PERSON-AT ?auto_531396 ?auto_531403 ) ( PERSON-AT ?auto_531399 ?auto_531401 ) ( PERSON-AT ?auto_531397 ?auto_531401 ) ( PERSON-AT ?auto_531395 ?auto_531406 ) ( AIRCRAFT-AT ?auto_531402 ?auto_531394 ) ( FUEL-LEVEL ?auto_531402 ?auto_531405 ) ( not ( = ?auto_531394 ?auto_531406 ) ) ( not ( = ?auto_531395 ?auto_531397 ) ) ( not ( = ?auto_531401 ?auto_531406 ) ) ( not ( = ?auto_531395 ?auto_531399 ) ) ( not ( = ?auto_531397 ?auto_531399 ) ) ( not ( = ?auto_531395 ?auto_531396 ) ) ( not ( = ?auto_531397 ?auto_531396 ) ) ( not ( = ?auto_531399 ?auto_531396 ) ) ( not ( = ?auto_531403 ?auto_531401 ) ) ( not ( = ?auto_531403 ?auto_531406 ) ) ( not ( = ?auto_531395 ?auto_531400 ) ) ( not ( = ?auto_531397 ?auto_531400 ) ) ( not ( = ?auto_531399 ?auto_531400 ) ) ( not ( = ?auto_531396 ?auto_531400 ) ) ( not ( = ?auto_531395 ?auto_531398 ) ) ( not ( = ?auto_531397 ?auto_531398 ) ) ( not ( = ?auto_531399 ?auto_531398 ) ) ( not ( = ?auto_531396 ?auto_531398 ) ) ( not ( = ?auto_531400 ?auto_531398 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_531395 ?auto_531397 ?auto_531399 ?auto_531396 ?auto_531398 ?auto_531400 ?auto_531394 )
      ( FLY-6PPL-VERIFY ?auto_531395 ?auto_531396 ?auto_531397 ?auto_531398 ?auto_531399 ?auto_531400 ?auto_531394 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_536354 - PERSON
      ?auto_536355 - PERSON
      ?auto_536356 - PERSON
      ?auto_536357 - PERSON
      ?auto_536358 - PERSON
      ?auto_536359 - PERSON
      ?auto_536353 - CITY
    )
    :vars
    (
      ?auto_536364 - FLEVEL
      ?auto_536363 - FLEVEL
      ?auto_536362 - CITY
      ?auto_536360 - CITY
      ?auto_536365 - CITY
      ?auto_536361 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_536364 ?auto_536363 ) ( PERSON-AT ?auto_536356 ?auto_536362 ) ( not ( = ?auto_536353 ?auto_536362 ) ) ( not ( = ?auto_536364 ?auto_536363 ) ) ( PERSON-AT ?auto_536359 ?auto_536360 ) ( not ( = ?auto_536353 ?auto_536360 ) ) ( PERSON-AT ?auto_536355 ?auto_536362 ) ( PERSON-AT ?auto_536358 ?auto_536360 ) ( PERSON-AT ?auto_536357 ?auto_536360 ) ( PERSON-AT ?auto_536354 ?auto_536365 ) ( AIRCRAFT-AT ?auto_536361 ?auto_536353 ) ( FUEL-LEVEL ?auto_536361 ?auto_536364 ) ( not ( = ?auto_536353 ?auto_536365 ) ) ( not ( = ?auto_536354 ?auto_536357 ) ) ( not ( = ?auto_536360 ?auto_536365 ) ) ( not ( = ?auto_536354 ?auto_536358 ) ) ( not ( = ?auto_536357 ?auto_536358 ) ) ( not ( = ?auto_536354 ?auto_536355 ) ) ( not ( = ?auto_536357 ?auto_536355 ) ) ( not ( = ?auto_536358 ?auto_536355 ) ) ( not ( = ?auto_536362 ?auto_536360 ) ) ( not ( = ?auto_536362 ?auto_536365 ) ) ( not ( = ?auto_536354 ?auto_536359 ) ) ( not ( = ?auto_536357 ?auto_536359 ) ) ( not ( = ?auto_536358 ?auto_536359 ) ) ( not ( = ?auto_536355 ?auto_536359 ) ) ( not ( = ?auto_536354 ?auto_536356 ) ) ( not ( = ?auto_536357 ?auto_536356 ) ) ( not ( = ?auto_536358 ?auto_536356 ) ) ( not ( = ?auto_536355 ?auto_536356 ) ) ( not ( = ?auto_536359 ?auto_536356 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_536354 ?auto_536357 ?auto_536358 ?auto_536355 ?auto_536356 ?auto_536359 ?auto_536353 )
      ( FLY-6PPL-VERIFY ?auto_536354 ?auto_536355 ?auto_536356 ?auto_536357 ?auto_536358 ?auto_536359 ?auto_536353 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_570893 - PERSON
      ?auto_570894 - PERSON
      ?auto_570895 - PERSON
      ?auto_570896 - PERSON
      ?auto_570897 - PERSON
      ?auto_570898 - PERSON
      ?auto_570892 - CITY
    )
    :vars
    (
      ?auto_570903 - FLEVEL
      ?auto_570902 - FLEVEL
      ?auto_570901 - CITY
      ?auto_570899 - CITY
      ?auto_570904 - CITY
      ?auto_570900 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_570903 ?auto_570902 ) ( PERSON-AT ?auto_570898 ?auto_570901 ) ( not ( = ?auto_570892 ?auto_570901 ) ) ( not ( = ?auto_570903 ?auto_570902 ) ) ( PERSON-AT ?auto_570897 ?auto_570899 ) ( not ( = ?auto_570892 ?auto_570899 ) ) ( PERSON-AT ?auto_570896 ?auto_570901 ) ( PERSON-AT ?auto_570895 ?auto_570899 ) ( PERSON-AT ?auto_570893 ?auto_570899 ) ( PERSON-AT ?auto_570894 ?auto_570904 ) ( AIRCRAFT-AT ?auto_570900 ?auto_570892 ) ( FUEL-LEVEL ?auto_570900 ?auto_570903 ) ( not ( = ?auto_570892 ?auto_570904 ) ) ( not ( = ?auto_570894 ?auto_570893 ) ) ( not ( = ?auto_570899 ?auto_570904 ) ) ( not ( = ?auto_570894 ?auto_570895 ) ) ( not ( = ?auto_570893 ?auto_570895 ) ) ( not ( = ?auto_570894 ?auto_570896 ) ) ( not ( = ?auto_570893 ?auto_570896 ) ) ( not ( = ?auto_570895 ?auto_570896 ) ) ( not ( = ?auto_570901 ?auto_570899 ) ) ( not ( = ?auto_570901 ?auto_570904 ) ) ( not ( = ?auto_570894 ?auto_570897 ) ) ( not ( = ?auto_570893 ?auto_570897 ) ) ( not ( = ?auto_570895 ?auto_570897 ) ) ( not ( = ?auto_570896 ?auto_570897 ) ) ( not ( = ?auto_570894 ?auto_570898 ) ) ( not ( = ?auto_570893 ?auto_570898 ) ) ( not ( = ?auto_570895 ?auto_570898 ) ) ( not ( = ?auto_570896 ?auto_570898 ) ) ( not ( = ?auto_570897 ?auto_570898 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_570894 ?auto_570893 ?auto_570895 ?auto_570896 ?auto_570898 ?auto_570897 ?auto_570892 )
      ( FLY-6PPL-VERIFY ?auto_570893 ?auto_570894 ?auto_570895 ?auto_570896 ?auto_570897 ?auto_570898 ?auto_570892 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_570962 - PERSON
      ?auto_570963 - PERSON
      ?auto_570964 - PERSON
      ?auto_570965 - PERSON
      ?auto_570966 - PERSON
      ?auto_570967 - PERSON
      ?auto_570961 - CITY
    )
    :vars
    (
      ?auto_570972 - FLEVEL
      ?auto_570971 - FLEVEL
      ?auto_570970 - CITY
      ?auto_570968 - CITY
      ?auto_570973 - CITY
      ?auto_570969 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_570972 ?auto_570971 ) ( PERSON-AT ?auto_570966 ?auto_570970 ) ( not ( = ?auto_570961 ?auto_570970 ) ) ( not ( = ?auto_570972 ?auto_570971 ) ) ( PERSON-AT ?auto_570967 ?auto_570968 ) ( not ( = ?auto_570961 ?auto_570968 ) ) ( PERSON-AT ?auto_570965 ?auto_570970 ) ( PERSON-AT ?auto_570964 ?auto_570968 ) ( PERSON-AT ?auto_570962 ?auto_570968 ) ( PERSON-AT ?auto_570963 ?auto_570973 ) ( AIRCRAFT-AT ?auto_570969 ?auto_570961 ) ( FUEL-LEVEL ?auto_570969 ?auto_570972 ) ( not ( = ?auto_570961 ?auto_570973 ) ) ( not ( = ?auto_570963 ?auto_570962 ) ) ( not ( = ?auto_570968 ?auto_570973 ) ) ( not ( = ?auto_570963 ?auto_570964 ) ) ( not ( = ?auto_570962 ?auto_570964 ) ) ( not ( = ?auto_570963 ?auto_570965 ) ) ( not ( = ?auto_570962 ?auto_570965 ) ) ( not ( = ?auto_570964 ?auto_570965 ) ) ( not ( = ?auto_570970 ?auto_570968 ) ) ( not ( = ?auto_570970 ?auto_570973 ) ) ( not ( = ?auto_570963 ?auto_570967 ) ) ( not ( = ?auto_570962 ?auto_570967 ) ) ( not ( = ?auto_570964 ?auto_570967 ) ) ( not ( = ?auto_570965 ?auto_570967 ) ) ( not ( = ?auto_570963 ?auto_570966 ) ) ( not ( = ?auto_570962 ?auto_570966 ) ) ( not ( = ?auto_570964 ?auto_570966 ) ) ( not ( = ?auto_570965 ?auto_570966 ) ) ( not ( = ?auto_570967 ?auto_570966 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_570963 ?auto_570962 ?auto_570964 ?auto_570965 ?auto_570966 ?auto_570967 ?auto_570961 )
      ( FLY-6PPL-VERIFY ?auto_570962 ?auto_570963 ?auto_570964 ?auto_570965 ?auto_570966 ?auto_570967 ?auto_570961 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_571031 - PERSON
      ?auto_571032 - PERSON
      ?auto_571033 - PERSON
      ?auto_571034 - PERSON
      ?auto_571035 - PERSON
      ?auto_571036 - PERSON
      ?auto_571030 - CITY
    )
    :vars
    (
      ?auto_571041 - FLEVEL
      ?auto_571040 - FLEVEL
      ?auto_571039 - CITY
      ?auto_571037 - CITY
      ?auto_571042 - CITY
      ?auto_571038 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_571041 ?auto_571040 ) ( PERSON-AT ?auto_571036 ?auto_571039 ) ( not ( = ?auto_571030 ?auto_571039 ) ) ( not ( = ?auto_571041 ?auto_571040 ) ) ( PERSON-AT ?auto_571034 ?auto_571037 ) ( not ( = ?auto_571030 ?auto_571037 ) ) ( PERSON-AT ?auto_571035 ?auto_571039 ) ( PERSON-AT ?auto_571033 ?auto_571037 ) ( PERSON-AT ?auto_571031 ?auto_571037 ) ( PERSON-AT ?auto_571032 ?auto_571042 ) ( AIRCRAFT-AT ?auto_571038 ?auto_571030 ) ( FUEL-LEVEL ?auto_571038 ?auto_571041 ) ( not ( = ?auto_571030 ?auto_571042 ) ) ( not ( = ?auto_571032 ?auto_571031 ) ) ( not ( = ?auto_571037 ?auto_571042 ) ) ( not ( = ?auto_571032 ?auto_571033 ) ) ( not ( = ?auto_571031 ?auto_571033 ) ) ( not ( = ?auto_571032 ?auto_571035 ) ) ( not ( = ?auto_571031 ?auto_571035 ) ) ( not ( = ?auto_571033 ?auto_571035 ) ) ( not ( = ?auto_571039 ?auto_571037 ) ) ( not ( = ?auto_571039 ?auto_571042 ) ) ( not ( = ?auto_571032 ?auto_571034 ) ) ( not ( = ?auto_571031 ?auto_571034 ) ) ( not ( = ?auto_571033 ?auto_571034 ) ) ( not ( = ?auto_571035 ?auto_571034 ) ) ( not ( = ?auto_571032 ?auto_571036 ) ) ( not ( = ?auto_571031 ?auto_571036 ) ) ( not ( = ?auto_571033 ?auto_571036 ) ) ( not ( = ?auto_571035 ?auto_571036 ) ) ( not ( = ?auto_571034 ?auto_571036 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_571032 ?auto_571031 ?auto_571033 ?auto_571035 ?auto_571036 ?auto_571034 ?auto_571030 )
      ( FLY-6PPL-VERIFY ?auto_571031 ?auto_571032 ?auto_571033 ?auto_571034 ?auto_571035 ?auto_571036 ?auto_571030 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_572019 - PERSON
      ?auto_572020 - PERSON
      ?auto_572021 - PERSON
      ?auto_572022 - PERSON
      ?auto_572023 - PERSON
      ?auto_572024 - PERSON
      ?auto_572018 - CITY
    )
    :vars
    (
      ?auto_572029 - FLEVEL
      ?auto_572028 - FLEVEL
      ?auto_572027 - CITY
      ?auto_572025 - CITY
      ?auto_572030 - CITY
      ?auto_572026 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_572029 ?auto_572028 ) ( PERSON-AT ?auto_572024 ?auto_572027 ) ( not ( = ?auto_572018 ?auto_572027 ) ) ( not ( = ?auto_572029 ?auto_572028 ) ) ( PERSON-AT ?auto_572023 ?auto_572025 ) ( not ( = ?auto_572018 ?auto_572025 ) ) ( PERSON-AT ?auto_572021 ?auto_572027 ) ( PERSON-AT ?auto_572022 ?auto_572025 ) ( PERSON-AT ?auto_572019 ?auto_572025 ) ( PERSON-AT ?auto_572020 ?auto_572030 ) ( AIRCRAFT-AT ?auto_572026 ?auto_572018 ) ( FUEL-LEVEL ?auto_572026 ?auto_572029 ) ( not ( = ?auto_572018 ?auto_572030 ) ) ( not ( = ?auto_572020 ?auto_572019 ) ) ( not ( = ?auto_572025 ?auto_572030 ) ) ( not ( = ?auto_572020 ?auto_572022 ) ) ( not ( = ?auto_572019 ?auto_572022 ) ) ( not ( = ?auto_572020 ?auto_572021 ) ) ( not ( = ?auto_572019 ?auto_572021 ) ) ( not ( = ?auto_572022 ?auto_572021 ) ) ( not ( = ?auto_572027 ?auto_572025 ) ) ( not ( = ?auto_572027 ?auto_572030 ) ) ( not ( = ?auto_572020 ?auto_572023 ) ) ( not ( = ?auto_572019 ?auto_572023 ) ) ( not ( = ?auto_572022 ?auto_572023 ) ) ( not ( = ?auto_572021 ?auto_572023 ) ) ( not ( = ?auto_572020 ?auto_572024 ) ) ( not ( = ?auto_572019 ?auto_572024 ) ) ( not ( = ?auto_572022 ?auto_572024 ) ) ( not ( = ?auto_572021 ?auto_572024 ) ) ( not ( = ?auto_572023 ?auto_572024 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_572020 ?auto_572019 ?auto_572022 ?auto_572021 ?auto_572024 ?auto_572023 ?auto_572018 )
      ( FLY-6PPL-VERIFY ?auto_572019 ?auto_572020 ?auto_572021 ?auto_572022 ?auto_572023 ?auto_572024 ?auto_572018 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_572088 - PERSON
      ?auto_572089 - PERSON
      ?auto_572090 - PERSON
      ?auto_572091 - PERSON
      ?auto_572092 - PERSON
      ?auto_572093 - PERSON
      ?auto_572087 - CITY
    )
    :vars
    (
      ?auto_572098 - FLEVEL
      ?auto_572097 - FLEVEL
      ?auto_572096 - CITY
      ?auto_572094 - CITY
      ?auto_572099 - CITY
      ?auto_572095 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_572098 ?auto_572097 ) ( PERSON-AT ?auto_572092 ?auto_572096 ) ( not ( = ?auto_572087 ?auto_572096 ) ) ( not ( = ?auto_572098 ?auto_572097 ) ) ( PERSON-AT ?auto_572093 ?auto_572094 ) ( not ( = ?auto_572087 ?auto_572094 ) ) ( PERSON-AT ?auto_572090 ?auto_572096 ) ( PERSON-AT ?auto_572091 ?auto_572094 ) ( PERSON-AT ?auto_572088 ?auto_572094 ) ( PERSON-AT ?auto_572089 ?auto_572099 ) ( AIRCRAFT-AT ?auto_572095 ?auto_572087 ) ( FUEL-LEVEL ?auto_572095 ?auto_572098 ) ( not ( = ?auto_572087 ?auto_572099 ) ) ( not ( = ?auto_572089 ?auto_572088 ) ) ( not ( = ?auto_572094 ?auto_572099 ) ) ( not ( = ?auto_572089 ?auto_572091 ) ) ( not ( = ?auto_572088 ?auto_572091 ) ) ( not ( = ?auto_572089 ?auto_572090 ) ) ( not ( = ?auto_572088 ?auto_572090 ) ) ( not ( = ?auto_572091 ?auto_572090 ) ) ( not ( = ?auto_572096 ?auto_572094 ) ) ( not ( = ?auto_572096 ?auto_572099 ) ) ( not ( = ?auto_572089 ?auto_572093 ) ) ( not ( = ?auto_572088 ?auto_572093 ) ) ( not ( = ?auto_572091 ?auto_572093 ) ) ( not ( = ?auto_572090 ?auto_572093 ) ) ( not ( = ?auto_572089 ?auto_572092 ) ) ( not ( = ?auto_572088 ?auto_572092 ) ) ( not ( = ?auto_572091 ?auto_572092 ) ) ( not ( = ?auto_572090 ?auto_572092 ) ) ( not ( = ?auto_572093 ?auto_572092 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_572089 ?auto_572088 ?auto_572091 ?auto_572090 ?auto_572092 ?auto_572093 ?auto_572087 )
      ( FLY-6PPL-VERIFY ?auto_572088 ?auto_572089 ?auto_572090 ?auto_572091 ?auto_572092 ?auto_572093 ?auto_572087 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_572648 - PERSON
      ?auto_572649 - PERSON
      ?auto_572650 - PERSON
      ?auto_572651 - PERSON
      ?auto_572652 - PERSON
      ?auto_572653 - PERSON
      ?auto_572647 - CITY
    )
    :vars
    (
      ?auto_572658 - FLEVEL
      ?auto_572657 - FLEVEL
      ?auto_572656 - CITY
      ?auto_572654 - CITY
      ?auto_572659 - CITY
      ?auto_572655 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_572658 ?auto_572657 ) ( PERSON-AT ?auto_572651 ?auto_572656 ) ( not ( = ?auto_572647 ?auto_572656 ) ) ( not ( = ?auto_572658 ?auto_572657 ) ) ( PERSON-AT ?auto_572653 ?auto_572654 ) ( not ( = ?auto_572647 ?auto_572654 ) ) ( PERSON-AT ?auto_572650 ?auto_572656 ) ( PERSON-AT ?auto_572652 ?auto_572654 ) ( PERSON-AT ?auto_572648 ?auto_572654 ) ( PERSON-AT ?auto_572649 ?auto_572659 ) ( AIRCRAFT-AT ?auto_572655 ?auto_572647 ) ( FUEL-LEVEL ?auto_572655 ?auto_572658 ) ( not ( = ?auto_572647 ?auto_572659 ) ) ( not ( = ?auto_572649 ?auto_572648 ) ) ( not ( = ?auto_572654 ?auto_572659 ) ) ( not ( = ?auto_572649 ?auto_572652 ) ) ( not ( = ?auto_572648 ?auto_572652 ) ) ( not ( = ?auto_572649 ?auto_572650 ) ) ( not ( = ?auto_572648 ?auto_572650 ) ) ( not ( = ?auto_572652 ?auto_572650 ) ) ( not ( = ?auto_572656 ?auto_572654 ) ) ( not ( = ?auto_572656 ?auto_572659 ) ) ( not ( = ?auto_572649 ?auto_572653 ) ) ( not ( = ?auto_572648 ?auto_572653 ) ) ( not ( = ?auto_572652 ?auto_572653 ) ) ( not ( = ?auto_572650 ?auto_572653 ) ) ( not ( = ?auto_572649 ?auto_572651 ) ) ( not ( = ?auto_572648 ?auto_572651 ) ) ( not ( = ?auto_572652 ?auto_572651 ) ) ( not ( = ?auto_572650 ?auto_572651 ) ) ( not ( = ?auto_572653 ?auto_572651 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_572649 ?auto_572648 ?auto_572652 ?auto_572650 ?auto_572651 ?auto_572653 ?auto_572647 )
      ( FLY-6PPL-VERIFY ?auto_572648 ?auto_572649 ?auto_572650 ?auto_572651 ?auto_572652 ?auto_572653 ?auto_572647 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_588082 - PERSON
      ?auto_588083 - PERSON
      ?auto_588084 - PERSON
      ?auto_588085 - PERSON
      ?auto_588086 - PERSON
      ?auto_588087 - PERSON
      ?auto_588081 - CITY
    )
    :vars
    (
      ?auto_588092 - FLEVEL
      ?auto_588091 - FLEVEL
      ?auto_588090 - CITY
      ?auto_588088 - CITY
      ?auto_588093 - CITY
      ?auto_588089 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_588092 ?auto_588091 ) ( PERSON-AT ?auto_588087 ?auto_588090 ) ( not ( = ?auto_588081 ?auto_588090 ) ) ( not ( = ?auto_588092 ?auto_588091 ) ) ( PERSON-AT ?auto_588086 ?auto_588088 ) ( not ( = ?auto_588081 ?auto_588088 ) ) ( PERSON-AT ?auto_588085 ?auto_588090 ) ( PERSON-AT ?auto_588083 ?auto_588088 ) ( PERSON-AT ?auto_588082 ?auto_588088 ) ( PERSON-AT ?auto_588084 ?auto_588093 ) ( AIRCRAFT-AT ?auto_588089 ?auto_588081 ) ( FUEL-LEVEL ?auto_588089 ?auto_588092 ) ( not ( = ?auto_588081 ?auto_588093 ) ) ( not ( = ?auto_588084 ?auto_588082 ) ) ( not ( = ?auto_588088 ?auto_588093 ) ) ( not ( = ?auto_588084 ?auto_588083 ) ) ( not ( = ?auto_588082 ?auto_588083 ) ) ( not ( = ?auto_588084 ?auto_588085 ) ) ( not ( = ?auto_588082 ?auto_588085 ) ) ( not ( = ?auto_588083 ?auto_588085 ) ) ( not ( = ?auto_588090 ?auto_588088 ) ) ( not ( = ?auto_588090 ?auto_588093 ) ) ( not ( = ?auto_588084 ?auto_588086 ) ) ( not ( = ?auto_588082 ?auto_588086 ) ) ( not ( = ?auto_588083 ?auto_588086 ) ) ( not ( = ?auto_588085 ?auto_588086 ) ) ( not ( = ?auto_588084 ?auto_588087 ) ) ( not ( = ?auto_588082 ?auto_588087 ) ) ( not ( = ?auto_588083 ?auto_588087 ) ) ( not ( = ?auto_588085 ?auto_588087 ) ) ( not ( = ?auto_588086 ?auto_588087 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_588084 ?auto_588082 ?auto_588083 ?auto_588085 ?auto_588087 ?auto_588086 ?auto_588081 )
      ( FLY-6PPL-VERIFY ?auto_588082 ?auto_588083 ?auto_588084 ?auto_588085 ?auto_588086 ?auto_588087 ?auto_588081 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_588151 - PERSON
      ?auto_588152 - PERSON
      ?auto_588153 - PERSON
      ?auto_588154 - PERSON
      ?auto_588155 - PERSON
      ?auto_588156 - PERSON
      ?auto_588150 - CITY
    )
    :vars
    (
      ?auto_588161 - FLEVEL
      ?auto_588160 - FLEVEL
      ?auto_588159 - CITY
      ?auto_588157 - CITY
      ?auto_588162 - CITY
      ?auto_588158 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_588161 ?auto_588160 ) ( PERSON-AT ?auto_588155 ?auto_588159 ) ( not ( = ?auto_588150 ?auto_588159 ) ) ( not ( = ?auto_588161 ?auto_588160 ) ) ( PERSON-AT ?auto_588156 ?auto_588157 ) ( not ( = ?auto_588150 ?auto_588157 ) ) ( PERSON-AT ?auto_588154 ?auto_588159 ) ( PERSON-AT ?auto_588152 ?auto_588157 ) ( PERSON-AT ?auto_588151 ?auto_588157 ) ( PERSON-AT ?auto_588153 ?auto_588162 ) ( AIRCRAFT-AT ?auto_588158 ?auto_588150 ) ( FUEL-LEVEL ?auto_588158 ?auto_588161 ) ( not ( = ?auto_588150 ?auto_588162 ) ) ( not ( = ?auto_588153 ?auto_588151 ) ) ( not ( = ?auto_588157 ?auto_588162 ) ) ( not ( = ?auto_588153 ?auto_588152 ) ) ( not ( = ?auto_588151 ?auto_588152 ) ) ( not ( = ?auto_588153 ?auto_588154 ) ) ( not ( = ?auto_588151 ?auto_588154 ) ) ( not ( = ?auto_588152 ?auto_588154 ) ) ( not ( = ?auto_588159 ?auto_588157 ) ) ( not ( = ?auto_588159 ?auto_588162 ) ) ( not ( = ?auto_588153 ?auto_588156 ) ) ( not ( = ?auto_588151 ?auto_588156 ) ) ( not ( = ?auto_588152 ?auto_588156 ) ) ( not ( = ?auto_588154 ?auto_588156 ) ) ( not ( = ?auto_588153 ?auto_588155 ) ) ( not ( = ?auto_588151 ?auto_588155 ) ) ( not ( = ?auto_588152 ?auto_588155 ) ) ( not ( = ?auto_588154 ?auto_588155 ) ) ( not ( = ?auto_588156 ?auto_588155 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_588153 ?auto_588151 ?auto_588152 ?auto_588154 ?auto_588155 ?auto_588156 ?auto_588150 )
      ( FLY-6PPL-VERIFY ?auto_588151 ?auto_588152 ?auto_588153 ?auto_588154 ?auto_588155 ?auto_588156 ?auto_588150 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_588220 - PERSON
      ?auto_588221 - PERSON
      ?auto_588222 - PERSON
      ?auto_588223 - PERSON
      ?auto_588224 - PERSON
      ?auto_588225 - PERSON
      ?auto_588219 - CITY
    )
    :vars
    (
      ?auto_588230 - FLEVEL
      ?auto_588229 - FLEVEL
      ?auto_588228 - CITY
      ?auto_588226 - CITY
      ?auto_588231 - CITY
      ?auto_588227 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_588230 ?auto_588229 ) ( PERSON-AT ?auto_588225 ?auto_588228 ) ( not ( = ?auto_588219 ?auto_588228 ) ) ( not ( = ?auto_588230 ?auto_588229 ) ) ( PERSON-AT ?auto_588223 ?auto_588226 ) ( not ( = ?auto_588219 ?auto_588226 ) ) ( PERSON-AT ?auto_588224 ?auto_588228 ) ( PERSON-AT ?auto_588221 ?auto_588226 ) ( PERSON-AT ?auto_588220 ?auto_588226 ) ( PERSON-AT ?auto_588222 ?auto_588231 ) ( AIRCRAFT-AT ?auto_588227 ?auto_588219 ) ( FUEL-LEVEL ?auto_588227 ?auto_588230 ) ( not ( = ?auto_588219 ?auto_588231 ) ) ( not ( = ?auto_588222 ?auto_588220 ) ) ( not ( = ?auto_588226 ?auto_588231 ) ) ( not ( = ?auto_588222 ?auto_588221 ) ) ( not ( = ?auto_588220 ?auto_588221 ) ) ( not ( = ?auto_588222 ?auto_588224 ) ) ( not ( = ?auto_588220 ?auto_588224 ) ) ( not ( = ?auto_588221 ?auto_588224 ) ) ( not ( = ?auto_588228 ?auto_588226 ) ) ( not ( = ?auto_588228 ?auto_588231 ) ) ( not ( = ?auto_588222 ?auto_588223 ) ) ( not ( = ?auto_588220 ?auto_588223 ) ) ( not ( = ?auto_588221 ?auto_588223 ) ) ( not ( = ?auto_588224 ?auto_588223 ) ) ( not ( = ?auto_588222 ?auto_588225 ) ) ( not ( = ?auto_588220 ?auto_588225 ) ) ( not ( = ?auto_588221 ?auto_588225 ) ) ( not ( = ?auto_588224 ?auto_588225 ) ) ( not ( = ?auto_588223 ?auto_588225 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_588222 ?auto_588220 ?auto_588221 ?auto_588224 ?auto_588225 ?auto_588223 ?auto_588219 )
      ( FLY-6PPL-VERIFY ?auto_588220 ?auto_588221 ?auto_588222 ?auto_588223 ?auto_588224 ?auto_588225 ?auto_588219 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_591618 - PERSON
      ?auto_591619 - PERSON
      ?auto_591620 - PERSON
      ?auto_591621 - PERSON
      ?auto_591622 - PERSON
      ?auto_591623 - PERSON
      ?auto_591617 - CITY
    )
    :vars
    (
      ?auto_591628 - FLEVEL
      ?auto_591627 - FLEVEL
      ?auto_591626 - CITY
      ?auto_591624 - CITY
      ?auto_591629 - CITY
      ?auto_591625 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_591628 ?auto_591627 ) ( PERSON-AT ?auto_591623 ?auto_591626 ) ( not ( = ?auto_591617 ?auto_591626 ) ) ( not ( = ?auto_591628 ?auto_591627 ) ) ( PERSON-AT ?auto_591622 ?auto_591624 ) ( not ( = ?auto_591617 ?auto_591624 ) ) ( PERSON-AT ?auto_591620 ?auto_591626 ) ( PERSON-AT ?auto_591619 ?auto_591624 ) ( PERSON-AT ?auto_591618 ?auto_591624 ) ( PERSON-AT ?auto_591621 ?auto_591629 ) ( AIRCRAFT-AT ?auto_591625 ?auto_591617 ) ( FUEL-LEVEL ?auto_591625 ?auto_591628 ) ( not ( = ?auto_591617 ?auto_591629 ) ) ( not ( = ?auto_591621 ?auto_591618 ) ) ( not ( = ?auto_591624 ?auto_591629 ) ) ( not ( = ?auto_591621 ?auto_591619 ) ) ( not ( = ?auto_591618 ?auto_591619 ) ) ( not ( = ?auto_591621 ?auto_591620 ) ) ( not ( = ?auto_591618 ?auto_591620 ) ) ( not ( = ?auto_591619 ?auto_591620 ) ) ( not ( = ?auto_591626 ?auto_591624 ) ) ( not ( = ?auto_591626 ?auto_591629 ) ) ( not ( = ?auto_591621 ?auto_591622 ) ) ( not ( = ?auto_591618 ?auto_591622 ) ) ( not ( = ?auto_591619 ?auto_591622 ) ) ( not ( = ?auto_591620 ?auto_591622 ) ) ( not ( = ?auto_591621 ?auto_591623 ) ) ( not ( = ?auto_591618 ?auto_591623 ) ) ( not ( = ?auto_591619 ?auto_591623 ) ) ( not ( = ?auto_591620 ?auto_591623 ) ) ( not ( = ?auto_591622 ?auto_591623 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_591621 ?auto_591618 ?auto_591619 ?auto_591620 ?auto_591623 ?auto_591622 ?auto_591617 )
      ( FLY-6PPL-VERIFY ?auto_591618 ?auto_591619 ?auto_591620 ?auto_591621 ?auto_591622 ?auto_591623 ?auto_591617 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_591687 - PERSON
      ?auto_591688 - PERSON
      ?auto_591689 - PERSON
      ?auto_591690 - PERSON
      ?auto_591691 - PERSON
      ?auto_591692 - PERSON
      ?auto_591686 - CITY
    )
    :vars
    (
      ?auto_591697 - FLEVEL
      ?auto_591696 - FLEVEL
      ?auto_591695 - CITY
      ?auto_591693 - CITY
      ?auto_591698 - CITY
      ?auto_591694 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_591697 ?auto_591696 ) ( PERSON-AT ?auto_591691 ?auto_591695 ) ( not ( = ?auto_591686 ?auto_591695 ) ) ( not ( = ?auto_591697 ?auto_591696 ) ) ( PERSON-AT ?auto_591692 ?auto_591693 ) ( not ( = ?auto_591686 ?auto_591693 ) ) ( PERSON-AT ?auto_591689 ?auto_591695 ) ( PERSON-AT ?auto_591688 ?auto_591693 ) ( PERSON-AT ?auto_591687 ?auto_591693 ) ( PERSON-AT ?auto_591690 ?auto_591698 ) ( AIRCRAFT-AT ?auto_591694 ?auto_591686 ) ( FUEL-LEVEL ?auto_591694 ?auto_591697 ) ( not ( = ?auto_591686 ?auto_591698 ) ) ( not ( = ?auto_591690 ?auto_591687 ) ) ( not ( = ?auto_591693 ?auto_591698 ) ) ( not ( = ?auto_591690 ?auto_591688 ) ) ( not ( = ?auto_591687 ?auto_591688 ) ) ( not ( = ?auto_591690 ?auto_591689 ) ) ( not ( = ?auto_591687 ?auto_591689 ) ) ( not ( = ?auto_591688 ?auto_591689 ) ) ( not ( = ?auto_591695 ?auto_591693 ) ) ( not ( = ?auto_591695 ?auto_591698 ) ) ( not ( = ?auto_591690 ?auto_591692 ) ) ( not ( = ?auto_591687 ?auto_591692 ) ) ( not ( = ?auto_591688 ?auto_591692 ) ) ( not ( = ?auto_591689 ?auto_591692 ) ) ( not ( = ?auto_591690 ?auto_591691 ) ) ( not ( = ?auto_591687 ?auto_591691 ) ) ( not ( = ?auto_591688 ?auto_591691 ) ) ( not ( = ?auto_591689 ?auto_591691 ) ) ( not ( = ?auto_591692 ?auto_591691 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_591690 ?auto_591687 ?auto_591688 ?auto_591689 ?auto_591691 ?auto_591692 ?auto_591686 )
      ( FLY-6PPL-VERIFY ?auto_591687 ?auto_591688 ?auto_591689 ?auto_591690 ?auto_591691 ?auto_591692 ?auto_591686 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_592197 - PERSON
      ?auto_592198 - PERSON
      ?auto_592199 - PERSON
      ?auto_592200 - PERSON
      ?auto_592201 - PERSON
      ?auto_592202 - PERSON
      ?auto_592196 - CITY
    )
    :vars
    (
      ?auto_592207 - FLEVEL
      ?auto_592206 - FLEVEL
      ?auto_592205 - CITY
      ?auto_592203 - CITY
      ?auto_592208 - CITY
      ?auto_592204 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_592207 ?auto_592206 ) ( PERSON-AT ?auto_592202 ?auto_592205 ) ( not ( = ?auto_592196 ?auto_592205 ) ) ( not ( = ?auto_592207 ?auto_592206 ) ) ( PERSON-AT ?auto_592200 ?auto_592203 ) ( not ( = ?auto_592196 ?auto_592203 ) ) ( PERSON-AT ?auto_592199 ?auto_592205 ) ( PERSON-AT ?auto_592198 ?auto_592203 ) ( PERSON-AT ?auto_592197 ?auto_592203 ) ( PERSON-AT ?auto_592201 ?auto_592208 ) ( AIRCRAFT-AT ?auto_592204 ?auto_592196 ) ( FUEL-LEVEL ?auto_592204 ?auto_592207 ) ( not ( = ?auto_592196 ?auto_592208 ) ) ( not ( = ?auto_592201 ?auto_592197 ) ) ( not ( = ?auto_592203 ?auto_592208 ) ) ( not ( = ?auto_592201 ?auto_592198 ) ) ( not ( = ?auto_592197 ?auto_592198 ) ) ( not ( = ?auto_592201 ?auto_592199 ) ) ( not ( = ?auto_592197 ?auto_592199 ) ) ( not ( = ?auto_592198 ?auto_592199 ) ) ( not ( = ?auto_592205 ?auto_592203 ) ) ( not ( = ?auto_592205 ?auto_592208 ) ) ( not ( = ?auto_592201 ?auto_592200 ) ) ( not ( = ?auto_592197 ?auto_592200 ) ) ( not ( = ?auto_592198 ?auto_592200 ) ) ( not ( = ?auto_592199 ?auto_592200 ) ) ( not ( = ?auto_592201 ?auto_592202 ) ) ( not ( = ?auto_592197 ?auto_592202 ) ) ( not ( = ?auto_592198 ?auto_592202 ) ) ( not ( = ?auto_592199 ?auto_592202 ) ) ( not ( = ?auto_592200 ?auto_592202 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_592201 ?auto_592197 ?auto_592198 ?auto_592199 ?auto_592202 ?auto_592200 ?auto_592196 )
      ( FLY-6PPL-VERIFY ?auto_592197 ?auto_592198 ?auto_592199 ?auto_592200 ?auto_592201 ?auto_592202 ?auto_592196 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_592266 - PERSON
      ?auto_592267 - PERSON
      ?auto_592268 - PERSON
      ?auto_592269 - PERSON
      ?auto_592270 - PERSON
      ?auto_592271 - PERSON
      ?auto_592265 - CITY
    )
    :vars
    (
      ?auto_592276 - FLEVEL
      ?auto_592275 - FLEVEL
      ?auto_592274 - CITY
      ?auto_592272 - CITY
      ?auto_592277 - CITY
      ?auto_592273 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_592276 ?auto_592275 ) ( PERSON-AT ?auto_592270 ?auto_592274 ) ( not ( = ?auto_592265 ?auto_592274 ) ) ( not ( = ?auto_592276 ?auto_592275 ) ) ( PERSON-AT ?auto_592269 ?auto_592272 ) ( not ( = ?auto_592265 ?auto_592272 ) ) ( PERSON-AT ?auto_592268 ?auto_592274 ) ( PERSON-AT ?auto_592267 ?auto_592272 ) ( PERSON-AT ?auto_592266 ?auto_592272 ) ( PERSON-AT ?auto_592271 ?auto_592277 ) ( AIRCRAFT-AT ?auto_592273 ?auto_592265 ) ( FUEL-LEVEL ?auto_592273 ?auto_592276 ) ( not ( = ?auto_592265 ?auto_592277 ) ) ( not ( = ?auto_592271 ?auto_592266 ) ) ( not ( = ?auto_592272 ?auto_592277 ) ) ( not ( = ?auto_592271 ?auto_592267 ) ) ( not ( = ?auto_592266 ?auto_592267 ) ) ( not ( = ?auto_592271 ?auto_592268 ) ) ( not ( = ?auto_592266 ?auto_592268 ) ) ( not ( = ?auto_592267 ?auto_592268 ) ) ( not ( = ?auto_592274 ?auto_592272 ) ) ( not ( = ?auto_592274 ?auto_592277 ) ) ( not ( = ?auto_592271 ?auto_592269 ) ) ( not ( = ?auto_592266 ?auto_592269 ) ) ( not ( = ?auto_592267 ?auto_592269 ) ) ( not ( = ?auto_592268 ?auto_592269 ) ) ( not ( = ?auto_592271 ?auto_592270 ) ) ( not ( = ?auto_592266 ?auto_592270 ) ) ( not ( = ?auto_592267 ?auto_592270 ) ) ( not ( = ?auto_592268 ?auto_592270 ) ) ( not ( = ?auto_592269 ?auto_592270 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_592271 ?auto_592266 ?auto_592267 ?auto_592268 ?auto_592270 ?auto_592269 ?auto_592265 )
      ( FLY-6PPL-VERIFY ?auto_592266 ?auto_592267 ?auto_592268 ?auto_592269 ?auto_592270 ?auto_592271 ?auto_592265 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_592405 - PERSON
      ?auto_592406 - PERSON
      ?auto_592407 - PERSON
      ?auto_592408 - PERSON
      ?auto_592409 - PERSON
      ?auto_592410 - PERSON
      ?auto_592404 - CITY
    )
    :vars
    (
      ?auto_592415 - FLEVEL
      ?auto_592414 - FLEVEL
      ?auto_592413 - CITY
      ?auto_592411 - CITY
      ?auto_592416 - CITY
      ?auto_592412 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_592415 ?auto_592414 ) ( PERSON-AT ?auto_592408 ?auto_592413 ) ( not ( = ?auto_592404 ?auto_592413 ) ) ( not ( = ?auto_592415 ?auto_592414 ) ) ( PERSON-AT ?auto_592410 ?auto_592411 ) ( not ( = ?auto_592404 ?auto_592411 ) ) ( PERSON-AT ?auto_592407 ?auto_592413 ) ( PERSON-AT ?auto_592406 ?auto_592411 ) ( PERSON-AT ?auto_592405 ?auto_592411 ) ( PERSON-AT ?auto_592409 ?auto_592416 ) ( AIRCRAFT-AT ?auto_592412 ?auto_592404 ) ( FUEL-LEVEL ?auto_592412 ?auto_592415 ) ( not ( = ?auto_592404 ?auto_592416 ) ) ( not ( = ?auto_592409 ?auto_592405 ) ) ( not ( = ?auto_592411 ?auto_592416 ) ) ( not ( = ?auto_592409 ?auto_592406 ) ) ( not ( = ?auto_592405 ?auto_592406 ) ) ( not ( = ?auto_592409 ?auto_592407 ) ) ( not ( = ?auto_592405 ?auto_592407 ) ) ( not ( = ?auto_592406 ?auto_592407 ) ) ( not ( = ?auto_592413 ?auto_592411 ) ) ( not ( = ?auto_592413 ?auto_592416 ) ) ( not ( = ?auto_592409 ?auto_592410 ) ) ( not ( = ?auto_592405 ?auto_592410 ) ) ( not ( = ?auto_592406 ?auto_592410 ) ) ( not ( = ?auto_592407 ?auto_592410 ) ) ( not ( = ?auto_592409 ?auto_592408 ) ) ( not ( = ?auto_592405 ?auto_592408 ) ) ( not ( = ?auto_592406 ?auto_592408 ) ) ( not ( = ?auto_592407 ?auto_592408 ) ) ( not ( = ?auto_592410 ?auto_592408 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_592409 ?auto_592405 ?auto_592406 ?auto_592407 ?auto_592408 ?auto_592410 ?auto_592404 )
      ( FLY-6PPL-VERIFY ?auto_592405 ?auto_592406 ?auto_592407 ?auto_592408 ?auto_592409 ?auto_592410 ?auto_592404 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_592696 - PERSON
      ?auto_592697 - PERSON
      ?auto_592698 - PERSON
      ?auto_592699 - PERSON
      ?auto_592700 - PERSON
      ?auto_592701 - PERSON
      ?auto_592695 - CITY
    )
    :vars
    (
      ?auto_592706 - FLEVEL
      ?auto_592705 - FLEVEL
      ?auto_592704 - CITY
      ?auto_592702 - CITY
      ?auto_592707 - CITY
      ?auto_592703 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_592706 ?auto_592705 ) ( PERSON-AT ?auto_592699 ?auto_592704 ) ( not ( = ?auto_592695 ?auto_592704 ) ) ( not ( = ?auto_592706 ?auto_592705 ) ) ( PERSON-AT ?auto_592700 ?auto_592702 ) ( not ( = ?auto_592695 ?auto_592702 ) ) ( PERSON-AT ?auto_592698 ?auto_592704 ) ( PERSON-AT ?auto_592697 ?auto_592702 ) ( PERSON-AT ?auto_592696 ?auto_592702 ) ( PERSON-AT ?auto_592701 ?auto_592707 ) ( AIRCRAFT-AT ?auto_592703 ?auto_592695 ) ( FUEL-LEVEL ?auto_592703 ?auto_592706 ) ( not ( = ?auto_592695 ?auto_592707 ) ) ( not ( = ?auto_592701 ?auto_592696 ) ) ( not ( = ?auto_592702 ?auto_592707 ) ) ( not ( = ?auto_592701 ?auto_592697 ) ) ( not ( = ?auto_592696 ?auto_592697 ) ) ( not ( = ?auto_592701 ?auto_592698 ) ) ( not ( = ?auto_592696 ?auto_592698 ) ) ( not ( = ?auto_592697 ?auto_592698 ) ) ( not ( = ?auto_592704 ?auto_592702 ) ) ( not ( = ?auto_592704 ?auto_592707 ) ) ( not ( = ?auto_592701 ?auto_592700 ) ) ( not ( = ?auto_592696 ?auto_592700 ) ) ( not ( = ?auto_592697 ?auto_592700 ) ) ( not ( = ?auto_592698 ?auto_592700 ) ) ( not ( = ?auto_592701 ?auto_592699 ) ) ( not ( = ?auto_592696 ?auto_592699 ) ) ( not ( = ?auto_592697 ?auto_592699 ) ) ( not ( = ?auto_592698 ?auto_592699 ) ) ( not ( = ?auto_592700 ?auto_592699 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_592701 ?auto_592696 ?auto_592697 ?auto_592698 ?auto_592699 ?auto_592700 ?auto_592695 )
      ( FLY-6PPL-VERIFY ?auto_592696 ?auto_592697 ?auto_592698 ?auto_592699 ?auto_592700 ?auto_592701 ?auto_592695 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_592909 - PERSON
      ?auto_592910 - PERSON
      ?auto_592911 - PERSON
      ?auto_592912 - PERSON
      ?auto_592913 - PERSON
      ?auto_592914 - PERSON
      ?auto_592908 - CITY
    )
    :vars
    (
      ?auto_592919 - FLEVEL
      ?auto_592918 - FLEVEL
      ?auto_592917 - CITY
      ?auto_592915 - CITY
      ?auto_592920 - CITY
      ?auto_592916 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_592919 ?auto_592918 ) ( PERSON-AT ?auto_592914 ?auto_592917 ) ( not ( = ?auto_592908 ?auto_592917 ) ) ( not ( = ?auto_592919 ?auto_592918 ) ) ( PERSON-AT ?auto_592911 ?auto_592915 ) ( not ( = ?auto_592908 ?auto_592915 ) ) ( PERSON-AT ?auto_592913 ?auto_592917 ) ( PERSON-AT ?auto_592910 ?auto_592915 ) ( PERSON-AT ?auto_592909 ?auto_592915 ) ( PERSON-AT ?auto_592912 ?auto_592920 ) ( AIRCRAFT-AT ?auto_592916 ?auto_592908 ) ( FUEL-LEVEL ?auto_592916 ?auto_592919 ) ( not ( = ?auto_592908 ?auto_592920 ) ) ( not ( = ?auto_592912 ?auto_592909 ) ) ( not ( = ?auto_592915 ?auto_592920 ) ) ( not ( = ?auto_592912 ?auto_592910 ) ) ( not ( = ?auto_592909 ?auto_592910 ) ) ( not ( = ?auto_592912 ?auto_592913 ) ) ( not ( = ?auto_592909 ?auto_592913 ) ) ( not ( = ?auto_592910 ?auto_592913 ) ) ( not ( = ?auto_592917 ?auto_592915 ) ) ( not ( = ?auto_592917 ?auto_592920 ) ) ( not ( = ?auto_592912 ?auto_592911 ) ) ( not ( = ?auto_592909 ?auto_592911 ) ) ( not ( = ?auto_592910 ?auto_592911 ) ) ( not ( = ?auto_592913 ?auto_592911 ) ) ( not ( = ?auto_592912 ?auto_592914 ) ) ( not ( = ?auto_592909 ?auto_592914 ) ) ( not ( = ?auto_592910 ?auto_592914 ) ) ( not ( = ?auto_592913 ?auto_592914 ) ) ( not ( = ?auto_592911 ?auto_592914 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_592912 ?auto_592909 ?auto_592910 ?auto_592913 ?auto_592914 ?auto_592911 ?auto_592908 )
      ( FLY-6PPL-VERIFY ?auto_592909 ?auto_592910 ?auto_592911 ?auto_592912 ?auto_592913 ?auto_592914 ?auto_592908 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_593335 - PERSON
      ?auto_593336 - PERSON
      ?auto_593337 - PERSON
      ?auto_593338 - PERSON
      ?auto_593339 - PERSON
      ?auto_593340 - PERSON
      ?auto_593334 - CITY
    )
    :vars
    (
      ?auto_593345 - FLEVEL
      ?auto_593344 - FLEVEL
      ?auto_593343 - CITY
      ?auto_593341 - CITY
      ?auto_593346 - CITY
      ?auto_593342 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_593345 ?auto_593344 ) ( PERSON-AT ?auto_593340 ?auto_593343 ) ( not ( = ?auto_593334 ?auto_593343 ) ) ( not ( = ?auto_593345 ?auto_593344 ) ) ( PERSON-AT ?auto_593337 ?auto_593341 ) ( not ( = ?auto_593334 ?auto_593341 ) ) ( PERSON-AT ?auto_593338 ?auto_593343 ) ( PERSON-AT ?auto_593336 ?auto_593341 ) ( PERSON-AT ?auto_593335 ?auto_593341 ) ( PERSON-AT ?auto_593339 ?auto_593346 ) ( AIRCRAFT-AT ?auto_593342 ?auto_593334 ) ( FUEL-LEVEL ?auto_593342 ?auto_593345 ) ( not ( = ?auto_593334 ?auto_593346 ) ) ( not ( = ?auto_593339 ?auto_593335 ) ) ( not ( = ?auto_593341 ?auto_593346 ) ) ( not ( = ?auto_593339 ?auto_593336 ) ) ( not ( = ?auto_593335 ?auto_593336 ) ) ( not ( = ?auto_593339 ?auto_593338 ) ) ( not ( = ?auto_593335 ?auto_593338 ) ) ( not ( = ?auto_593336 ?auto_593338 ) ) ( not ( = ?auto_593343 ?auto_593341 ) ) ( not ( = ?auto_593343 ?auto_593346 ) ) ( not ( = ?auto_593339 ?auto_593337 ) ) ( not ( = ?auto_593335 ?auto_593337 ) ) ( not ( = ?auto_593336 ?auto_593337 ) ) ( not ( = ?auto_593338 ?auto_593337 ) ) ( not ( = ?auto_593339 ?auto_593340 ) ) ( not ( = ?auto_593335 ?auto_593340 ) ) ( not ( = ?auto_593336 ?auto_593340 ) ) ( not ( = ?auto_593338 ?auto_593340 ) ) ( not ( = ?auto_593337 ?auto_593340 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_593339 ?auto_593335 ?auto_593336 ?auto_593338 ?auto_593340 ?auto_593337 ?auto_593334 )
      ( FLY-6PPL-VERIFY ?auto_593335 ?auto_593336 ?auto_593337 ?auto_593338 ?auto_593339 ?auto_593340 ?auto_593334 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_593404 - PERSON
      ?auto_593405 - PERSON
      ?auto_593406 - PERSON
      ?auto_593407 - PERSON
      ?auto_593408 - PERSON
      ?auto_593409 - PERSON
      ?auto_593403 - CITY
    )
    :vars
    (
      ?auto_593414 - FLEVEL
      ?auto_593413 - FLEVEL
      ?auto_593412 - CITY
      ?auto_593410 - CITY
      ?auto_593415 - CITY
      ?auto_593411 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_593414 ?auto_593413 ) ( PERSON-AT ?auto_593408 ?auto_593412 ) ( not ( = ?auto_593403 ?auto_593412 ) ) ( not ( = ?auto_593414 ?auto_593413 ) ) ( PERSON-AT ?auto_593406 ?auto_593410 ) ( not ( = ?auto_593403 ?auto_593410 ) ) ( PERSON-AT ?auto_593407 ?auto_593412 ) ( PERSON-AT ?auto_593405 ?auto_593410 ) ( PERSON-AT ?auto_593404 ?auto_593410 ) ( PERSON-AT ?auto_593409 ?auto_593415 ) ( AIRCRAFT-AT ?auto_593411 ?auto_593403 ) ( FUEL-LEVEL ?auto_593411 ?auto_593414 ) ( not ( = ?auto_593403 ?auto_593415 ) ) ( not ( = ?auto_593409 ?auto_593404 ) ) ( not ( = ?auto_593410 ?auto_593415 ) ) ( not ( = ?auto_593409 ?auto_593405 ) ) ( not ( = ?auto_593404 ?auto_593405 ) ) ( not ( = ?auto_593409 ?auto_593407 ) ) ( not ( = ?auto_593404 ?auto_593407 ) ) ( not ( = ?auto_593405 ?auto_593407 ) ) ( not ( = ?auto_593412 ?auto_593410 ) ) ( not ( = ?auto_593412 ?auto_593415 ) ) ( not ( = ?auto_593409 ?auto_593406 ) ) ( not ( = ?auto_593404 ?auto_593406 ) ) ( not ( = ?auto_593405 ?auto_593406 ) ) ( not ( = ?auto_593407 ?auto_593406 ) ) ( not ( = ?auto_593409 ?auto_593408 ) ) ( not ( = ?auto_593404 ?auto_593408 ) ) ( not ( = ?auto_593405 ?auto_593408 ) ) ( not ( = ?auto_593407 ?auto_593408 ) ) ( not ( = ?auto_593406 ?auto_593408 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_593409 ?auto_593404 ?auto_593405 ?auto_593407 ?auto_593408 ?auto_593406 ?auto_593403 )
      ( FLY-6PPL-VERIFY ?auto_593404 ?auto_593405 ?auto_593406 ?auto_593407 ?auto_593408 ?auto_593409 ?auto_593403 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_597679 - PERSON
      ?auto_597680 - PERSON
      ?auto_597681 - PERSON
      ?auto_597682 - PERSON
      ?auto_597683 - PERSON
      ?auto_597684 - PERSON
      ?auto_597678 - CITY
    )
    :vars
    (
      ?auto_597689 - FLEVEL
      ?auto_597688 - FLEVEL
      ?auto_597687 - CITY
      ?auto_597685 - CITY
      ?auto_597690 - CITY
      ?auto_597686 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_597689 ?auto_597688 ) ( PERSON-AT ?auto_597684 ?auto_597687 ) ( not ( = ?auto_597678 ?auto_597687 ) ) ( not ( = ?auto_597689 ?auto_597688 ) ) ( PERSON-AT ?auto_597683 ?auto_597685 ) ( not ( = ?auto_597678 ?auto_597685 ) ) ( PERSON-AT ?auto_597680 ?auto_597687 ) ( PERSON-AT ?auto_597682 ?auto_597685 ) ( PERSON-AT ?auto_597679 ?auto_597685 ) ( PERSON-AT ?auto_597681 ?auto_597690 ) ( AIRCRAFT-AT ?auto_597686 ?auto_597678 ) ( FUEL-LEVEL ?auto_597686 ?auto_597689 ) ( not ( = ?auto_597678 ?auto_597690 ) ) ( not ( = ?auto_597681 ?auto_597679 ) ) ( not ( = ?auto_597685 ?auto_597690 ) ) ( not ( = ?auto_597681 ?auto_597682 ) ) ( not ( = ?auto_597679 ?auto_597682 ) ) ( not ( = ?auto_597681 ?auto_597680 ) ) ( not ( = ?auto_597679 ?auto_597680 ) ) ( not ( = ?auto_597682 ?auto_597680 ) ) ( not ( = ?auto_597687 ?auto_597685 ) ) ( not ( = ?auto_597687 ?auto_597690 ) ) ( not ( = ?auto_597681 ?auto_597683 ) ) ( not ( = ?auto_597679 ?auto_597683 ) ) ( not ( = ?auto_597682 ?auto_597683 ) ) ( not ( = ?auto_597680 ?auto_597683 ) ) ( not ( = ?auto_597681 ?auto_597684 ) ) ( not ( = ?auto_597679 ?auto_597684 ) ) ( not ( = ?auto_597682 ?auto_597684 ) ) ( not ( = ?auto_597680 ?auto_597684 ) ) ( not ( = ?auto_597683 ?auto_597684 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_597681 ?auto_597679 ?auto_597682 ?auto_597680 ?auto_597684 ?auto_597683 ?auto_597678 )
      ( FLY-6PPL-VERIFY ?auto_597679 ?auto_597680 ?auto_597681 ?auto_597682 ?auto_597683 ?auto_597684 ?auto_597678 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_597748 - PERSON
      ?auto_597749 - PERSON
      ?auto_597750 - PERSON
      ?auto_597751 - PERSON
      ?auto_597752 - PERSON
      ?auto_597753 - PERSON
      ?auto_597747 - CITY
    )
    :vars
    (
      ?auto_597758 - FLEVEL
      ?auto_597757 - FLEVEL
      ?auto_597756 - CITY
      ?auto_597754 - CITY
      ?auto_597759 - CITY
      ?auto_597755 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_597758 ?auto_597757 ) ( PERSON-AT ?auto_597752 ?auto_597756 ) ( not ( = ?auto_597747 ?auto_597756 ) ) ( not ( = ?auto_597758 ?auto_597757 ) ) ( PERSON-AT ?auto_597753 ?auto_597754 ) ( not ( = ?auto_597747 ?auto_597754 ) ) ( PERSON-AT ?auto_597749 ?auto_597756 ) ( PERSON-AT ?auto_597751 ?auto_597754 ) ( PERSON-AT ?auto_597748 ?auto_597754 ) ( PERSON-AT ?auto_597750 ?auto_597759 ) ( AIRCRAFT-AT ?auto_597755 ?auto_597747 ) ( FUEL-LEVEL ?auto_597755 ?auto_597758 ) ( not ( = ?auto_597747 ?auto_597759 ) ) ( not ( = ?auto_597750 ?auto_597748 ) ) ( not ( = ?auto_597754 ?auto_597759 ) ) ( not ( = ?auto_597750 ?auto_597751 ) ) ( not ( = ?auto_597748 ?auto_597751 ) ) ( not ( = ?auto_597750 ?auto_597749 ) ) ( not ( = ?auto_597748 ?auto_597749 ) ) ( not ( = ?auto_597751 ?auto_597749 ) ) ( not ( = ?auto_597756 ?auto_597754 ) ) ( not ( = ?auto_597756 ?auto_597759 ) ) ( not ( = ?auto_597750 ?auto_597753 ) ) ( not ( = ?auto_597748 ?auto_597753 ) ) ( not ( = ?auto_597751 ?auto_597753 ) ) ( not ( = ?auto_597749 ?auto_597753 ) ) ( not ( = ?auto_597750 ?auto_597752 ) ) ( not ( = ?auto_597748 ?auto_597752 ) ) ( not ( = ?auto_597751 ?auto_597752 ) ) ( not ( = ?auto_597749 ?auto_597752 ) ) ( not ( = ?auto_597753 ?auto_597752 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_597750 ?auto_597748 ?auto_597751 ?auto_597749 ?auto_597752 ?auto_597753 ?auto_597747 )
      ( FLY-6PPL-VERIFY ?auto_597748 ?auto_597749 ?auto_597750 ?auto_597751 ?auto_597752 ?auto_597753 ?auto_597747 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_598308 - PERSON
      ?auto_598309 - PERSON
      ?auto_598310 - PERSON
      ?auto_598311 - PERSON
      ?auto_598312 - PERSON
      ?auto_598313 - PERSON
      ?auto_598307 - CITY
    )
    :vars
    (
      ?auto_598318 - FLEVEL
      ?auto_598317 - FLEVEL
      ?auto_598316 - CITY
      ?auto_598314 - CITY
      ?auto_598319 - CITY
      ?auto_598315 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_598318 ?auto_598317 ) ( PERSON-AT ?auto_598311 ?auto_598316 ) ( not ( = ?auto_598307 ?auto_598316 ) ) ( not ( = ?auto_598318 ?auto_598317 ) ) ( PERSON-AT ?auto_598313 ?auto_598314 ) ( not ( = ?auto_598307 ?auto_598314 ) ) ( PERSON-AT ?auto_598309 ?auto_598316 ) ( PERSON-AT ?auto_598312 ?auto_598314 ) ( PERSON-AT ?auto_598308 ?auto_598314 ) ( PERSON-AT ?auto_598310 ?auto_598319 ) ( AIRCRAFT-AT ?auto_598315 ?auto_598307 ) ( FUEL-LEVEL ?auto_598315 ?auto_598318 ) ( not ( = ?auto_598307 ?auto_598319 ) ) ( not ( = ?auto_598310 ?auto_598308 ) ) ( not ( = ?auto_598314 ?auto_598319 ) ) ( not ( = ?auto_598310 ?auto_598312 ) ) ( not ( = ?auto_598308 ?auto_598312 ) ) ( not ( = ?auto_598310 ?auto_598309 ) ) ( not ( = ?auto_598308 ?auto_598309 ) ) ( not ( = ?auto_598312 ?auto_598309 ) ) ( not ( = ?auto_598316 ?auto_598314 ) ) ( not ( = ?auto_598316 ?auto_598319 ) ) ( not ( = ?auto_598310 ?auto_598313 ) ) ( not ( = ?auto_598308 ?auto_598313 ) ) ( not ( = ?auto_598312 ?auto_598313 ) ) ( not ( = ?auto_598309 ?auto_598313 ) ) ( not ( = ?auto_598310 ?auto_598311 ) ) ( not ( = ?auto_598308 ?auto_598311 ) ) ( not ( = ?auto_598312 ?auto_598311 ) ) ( not ( = ?auto_598309 ?auto_598311 ) ) ( not ( = ?auto_598313 ?auto_598311 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_598310 ?auto_598308 ?auto_598312 ?auto_598309 ?auto_598311 ?auto_598313 ?auto_598307 )
      ( FLY-6PPL-VERIFY ?auto_598308 ?auto_598309 ?auto_598310 ?auto_598311 ?auto_598312 ?auto_598313 ?auto_598307 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_600010 - PERSON
      ?auto_600011 - PERSON
      ?auto_600012 - PERSON
      ?auto_600013 - PERSON
      ?auto_600014 - PERSON
      ?auto_600015 - PERSON
      ?auto_600009 - CITY
    )
    :vars
    (
      ?auto_600020 - FLEVEL
      ?auto_600019 - FLEVEL
      ?auto_600018 - CITY
      ?auto_600016 - CITY
      ?auto_600021 - CITY
      ?auto_600017 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_600020 ?auto_600019 ) ( PERSON-AT ?auto_600015 ?auto_600018 ) ( not ( = ?auto_600009 ?auto_600018 ) ) ( not ( = ?auto_600020 ?auto_600019 ) ) ( PERSON-AT ?auto_600014 ?auto_600016 ) ( not ( = ?auto_600009 ?auto_600016 ) ) ( PERSON-AT ?auto_600011 ?auto_600018 ) ( PERSON-AT ?auto_600012 ?auto_600016 ) ( PERSON-AT ?auto_600010 ?auto_600016 ) ( PERSON-AT ?auto_600013 ?auto_600021 ) ( AIRCRAFT-AT ?auto_600017 ?auto_600009 ) ( FUEL-LEVEL ?auto_600017 ?auto_600020 ) ( not ( = ?auto_600009 ?auto_600021 ) ) ( not ( = ?auto_600013 ?auto_600010 ) ) ( not ( = ?auto_600016 ?auto_600021 ) ) ( not ( = ?auto_600013 ?auto_600012 ) ) ( not ( = ?auto_600010 ?auto_600012 ) ) ( not ( = ?auto_600013 ?auto_600011 ) ) ( not ( = ?auto_600010 ?auto_600011 ) ) ( not ( = ?auto_600012 ?auto_600011 ) ) ( not ( = ?auto_600018 ?auto_600016 ) ) ( not ( = ?auto_600018 ?auto_600021 ) ) ( not ( = ?auto_600013 ?auto_600014 ) ) ( not ( = ?auto_600010 ?auto_600014 ) ) ( not ( = ?auto_600012 ?auto_600014 ) ) ( not ( = ?auto_600011 ?auto_600014 ) ) ( not ( = ?auto_600013 ?auto_600015 ) ) ( not ( = ?auto_600010 ?auto_600015 ) ) ( not ( = ?auto_600012 ?auto_600015 ) ) ( not ( = ?auto_600011 ?auto_600015 ) ) ( not ( = ?auto_600014 ?auto_600015 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_600013 ?auto_600010 ?auto_600012 ?auto_600011 ?auto_600015 ?auto_600014 ?auto_600009 )
      ( FLY-6PPL-VERIFY ?auto_600010 ?auto_600011 ?auto_600012 ?auto_600013 ?auto_600014 ?auto_600015 ?auto_600009 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_600079 - PERSON
      ?auto_600080 - PERSON
      ?auto_600081 - PERSON
      ?auto_600082 - PERSON
      ?auto_600083 - PERSON
      ?auto_600084 - PERSON
      ?auto_600078 - CITY
    )
    :vars
    (
      ?auto_600089 - FLEVEL
      ?auto_600088 - FLEVEL
      ?auto_600087 - CITY
      ?auto_600085 - CITY
      ?auto_600090 - CITY
      ?auto_600086 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_600089 ?auto_600088 ) ( PERSON-AT ?auto_600083 ?auto_600087 ) ( not ( = ?auto_600078 ?auto_600087 ) ) ( not ( = ?auto_600089 ?auto_600088 ) ) ( PERSON-AT ?auto_600084 ?auto_600085 ) ( not ( = ?auto_600078 ?auto_600085 ) ) ( PERSON-AT ?auto_600080 ?auto_600087 ) ( PERSON-AT ?auto_600081 ?auto_600085 ) ( PERSON-AT ?auto_600079 ?auto_600085 ) ( PERSON-AT ?auto_600082 ?auto_600090 ) ( AIRCRAFT-AT ?auto_600086 ?auto_600078 ) ( FUEL-LEVEL ?auto_600086 ?auto_600089 ) ( not ( = ?auto_600078 ?auto_600090 ) ) ( not ( = ?auto_600082 ?auto_600079 ) ) ( not ( = ?auto_600085 ?auto_600090 ) ) ( not ( = ?auto_600082 ?auto_600081 ) ) ( not ( = ?auto_600079 ?auto_600081 ) ) ( not ( = ?auto_600082 ?auto_600080 ) ) ( not ( = ?auto_600079 ?auto_600080 ) ) ( not ( = ?auto_600081 ?auto_600080 ) ) ( not ( = ?auto_600087 ?auto_600085 ) ) ( not ( = ?auto_600087 ?auto_600090 ) ) ( not ( = ?auto_600082 ?auto_600084 ) ) ( not ( = ?auto_600079 ?auto_600084 ) ) ( not ( = ?auto_600081 ?auto_600084 ) ) ( not ( = ?auto_600080 ?auto_600084 ) ) ( not ( = ?auto_600082 ?auto_600083 ) ) ( not ( = ?auto_600079 ?auto_600083 ) ) ( not ( = ?auto_600081 ?auto_600083 ) ) ( not ( = ?auto_600080 ?auto_600083 ) ) ( not ( = ?auto_600084 ?auto_600083 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_600082 ?auto_600079 ?auto_600081 ?auto_600080 ?auto_600083 ?auto_600084 ?auto_600078 )
      ( FLY-6PPL-VERIFY ?auto_600079 ?auto_600080 ?auto_600081 ?auto_600082 ?auto_600083 ?auto_600084 ?auto_600078 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_600589 - PERSON
      ?auto_600590 - PERSON
      ?auto_600591 - PERSON
      ?auto_600592 - PERSON
      ?auto_600593 - PERSON
      ?auto_600594 - PERSON
      ?auto_600588 - CITY
    )
    :vars
    (
      ?auto_600599 - FLEVEL
      ?auto_600598 - FLEVEL
      ?auto_600597 - CITY
      ?auto_600595 - CITY
      ?auto_600600 - CITY
      ?auto_600596 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_600599 ?auto_600598 ) ( PERSON-AT ?auto_600594 ?auto_600597 ) ( not ( = ?auto_600588 ?auto_600597 ) ) ( not ( = ?auto_600599 ?auto_600598 ) ) ( PERSON-AT ?auto_600592 ?auto_600595 ) ( not ( = ?auto_600588 ?auto_600595 ) ) ( PERSON-AT ?auto_600590 ?auto_600597 ) ( PERSON-AT ?auto_600591 ?auto_600595 ) ( PERSON-AT ?auto_600589 ?auto_600595 ) ( PERSON-AT ?auto_600593 ?auto_600600 ) ( AIRCRAFT-AT ?auto_600596 ?auto_600588 ) ( FUEL-LEVEL ?auto_600596 ?auto_600599 ) ( not ( = ?auto_600588 ?auto_600600 ) ) ( not ( = ?auto_600593 ?auto_600589 ) ) ( not ( = ?auto_600595 ?auto_600600 ) ) ( not ( = ?auto_600593 ?auto_600591 ) ) ( not ( = ?auto_600589 ?auto_600591 ) ) ( not ( = ?auto_600593 ?auto_600590 ) ) ( not ( = ?auto_600589 ?auto_600590 ) ) ( not ( = ?auto_600591 ?auto_600590 ) ) ( not ( = ?auto_600597 ?auto_600595 ) ) ( not ( = ?auto_600597 ?auto_600600 ) ) ( not ( = ?auto_600593 ?auto_600592 ) ) ( not ( = ?auto_600589 ?auto_600592 ) ) ( not ( = ?auto_600591 ?auto_600592 ) ) ( not ( = ?auto_600590 ?auto_600592 ) ) ( not ( = ?auto_600593 ?auto_600594 ) ) ( not ( = ?auto_600589 ?auto_600594 ) ) ( not ( = ?auto_600591 ?auto_600594 ) ) ( not ( = ?auto_600590 ?auto_600594 ) ) ( not ( = ?auto_600592 ?auto_600594 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_600593 ?auto_600589 ?auto_600591 ?auto_600590 ?auto_600594 ?auto_600592 ?auto_600588 )
      ( FLY-6PPL-VERIFY ?auto_600589 ?auto_600590 ?auto_600591 ?auto_600592 ?auto_600593 ?auto_600594 ?auto_600588 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_600658 - PERSON
      ?auto_600659 - PERSON
      ?auto_600660 - PERSON
      ?auto_600661 - PERSON
      ?auto_600662 - PERSON
      ?auto_600663 - PERSON
      ?auto_600657 - CITY
    )
    :vars
    (
      ?auto_600668 - FLEVEL
      ?auto_600667 - FLEVEL
      ?auto_600666 - CITY
      ?auto_600664 - CITY
      ?auto_600669 - CITY
      ?auto_600665 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_600668 ?auto_600667 ) ( PERSON-AT ?auto_600662 ?auto_600666 ) ( not ( = ?auto_600657 ?auto_600666 ) ) ( not ( = ?auto_600668 ?auto_600667 ) ) ( PERSON-AT ?auto_600661 ?auto_600664 ) ( not ( = ?auto_600657 ?auto_600664 ) ) ( PERSON-AT ?auto_600659 ?auto_600666 ) ( PERSON-AT ?auto_600660 ?auto_600664 ) ( PERSON-AT ?auto_600658 ?auto_600664 ) ( PERSON-AT ?auto_600663 ?auto_600669 ) ( AIRCRAFT-AT ?auto_600665 ?auto_600657 ) ( FUEL-LEVEL ?auto_600665 ?auto_600668 ) ( not ( = ?auto_600657 ?auto_600669 ) ) ( not ( = ?auto_600663 ?auto_600658 ) ) ( not ( = ?auto_600664 ?auto_600669 ) ) ( not ( = ?auto_600663 ?auto_600660 ) ) ( not ( = ?auto_600658 ?auto_600660 ) ) ( not ( = ?auto_600663 ?auto_600659 ) ) ( not ( = ?auto_600658 ?auto_600659 ) ) ( not ( = ?auto_600660 ?auto_600659 ) ) ( not ( = ?auto_600666 ?auto_600664 ) ) ( not ( = ?auto_600666 ?auto_600669 ) ) ( not ( = ?auto_600663 ?auto_600661 ) ) ( not ( = ?auto_600658 ?auto_600661 ) ) ( not ( = ?auto_600660 ?auto_600661 ) ) ( not ( = ?auto_600659 ?auto_600661 ) ) ( not ( = ?auto_600663 ?auto_600662 ) ) ( not ( = ?auto_600658 ?auto_600662 ) ) ( not ( = ?auto_600660 ?auto_600662 ) ) ( not ( = ?auto_600659 ?auto_600662 ) ) ( not ( = ?auto_600661 ?auto_600662 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_600663 ?auto_600658 ?auto_600660 ?auto_600659 ?auto_600662 ?auto_600661 ?auto_600657 )
      ( FLY-6PPL-VERIFY ?auto_600658 ?auto_600659 ?auto_600660 ?auto_600661 ?auto_600662 ?auto_600663 ?auto_600657 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_600797 - PERSON
      ?auto_600798 - PERSON
      ?auto_600799 - PERSON
      ?auto_600800 - PERSON
      ?auto_600801 - PERSON
      ?auto_600802 - PERSON
      ?auto_600796 - CITY
    )
    :vars
    (
      ?auto_600807 - FLEVEL
      ?auto_600806 - FLEVEL
      ?auto_600805 - CITY
      ?auto_600803 - CITY
      ?auto_600808 - CITY
      ?auto_600804 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_600807 ?auto_600806 ) ( PERSON-AT ?auto_600800 ?auto_600805 ) ( not ( = ?auto_600796 ?auto_600805 ) ) ( not ( = ?auto_600807 ?auto_600806 ) ) ( PERSON-AT ?auto_600802 ?auto_600803 ) ( not ( = ?auto_600796 ?auto_600803 ) ) ( PERSON-AT ?auto_600798 ?auto_600805 ) ( PERSON-AT ?auto_600799 ?auto_600803 ) ( PERSON-AT ?auto_600797 ?auto_600803 ) ( PERSON-AT ?auto_600801 ?auto_600808 ) ( AIRCRAFT-AT ?auto_600804 ?auto_600796 ) ( FUEL-LEVEL ?auto_600804 ?auto_600807 ) ( not ( = ?auto_600796 ?auto_600808 ) ) ( not ( = ?auto_600801 ?auto_600797 ) ) ( not ( = ?auto_600803 ?auto_600808 ) ) ( not ( = ?auto_600801 ?auto_600799 ) ) ( not ( = ?auto_600797 ?auto_600799 ) ) ( not ( = ?auto_600801 ?auto_600798 ) ) ( not ( = ?auto_600797 ?auto_600798 ) ) ( not ( = ?auto_600799 ?auto_600798 ) ) ( not ( = ?auto_600805 ?auto_600803 ) ) ( not ( = ?auto_600805 ?auto_600808 ) ) ( not ( = ?auto_600801 ?auto_600802 ) ) ( not ( = ?auto_600797 ?auto_600802 ) ) ( not ( = ?auto_600799 ?auto_600802 ) ) ( not ( = ?auto_600798 ?auto_600802 ) ) ( not ( = ?auto_600801 ?auto_600800 ) ) ( not ( = ?auto_600797 ?auto_600800 ) ) ( not ( = ?auto_600799 ?auto_600800 ) ) ( not ( = ?auto_600798 ?auto_600800 ) ) ( not ( = ?auto_600802 ?auto_600800 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_600801 ?auto_600797 ?auto_600799 ?auto_600798 ?auto_600800 ?auto_600802 ?auto_600796 )
      ( FLY-6PPL-VERIFY ?auto_600797 ?auto_600798 ?auto_600799 ?auto_600800 ?auto_600801 ?auto_600802 ?auto_600796 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_601088 - PERSON
      ?auto_601089 - PERSON
      ?auto_601090 - PERSON
      ?auto_601091 - PERSON
      ?auto_601092 - PERSON
      ?auto_601093 - PERSON
      ?auto_601087 - CITY
    )
    :vars
    (
      ?auto_601098 - FLEVEL
      ?auto_601097 - FLEVEL
      ?auto_601096 - CITY
      ?auto_601094 - CITY
      ?auto_601099 - CITY
      ?auto_601095 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_601098 ?auto_601097 ) ( PERSON-AT ?auto_601091 ?auto_601096 ) ( not ( = ?auto_601087 ?auto_601096 ) ) ( not ( = ?auto_601098 ?auto_601097 ) ) ( PERSON-AT ?auto_601092 ?auto_601094 ) ( not ( = ?auto_601087 ?auto_601094 ) ) ( PERSON-AT ?auto_601089 ?auto_601096 ) ( PERSON-AT ?auto_601090 ?auto_601094 ) ( PERSON-AT ?auto_601088 ?auto_601094 ) ( PERSON-AT ?auto_601093 ?auto_601099 ) ( AIRCRAFT-AT ?auto_601095 ?auto_601087 ) ( FUEL-LEVEL ?auto_601095 ?auto_601098 ) ( not ( = ?auto_601087 ?auto_601099 ) ) ( not ( = ?auto_601093 ?auto_601088 ) ) ( not ( = ?auto_601094 ?auto_601099 ) ) ( not ( = ?auto_601093 ?auto_601090 ) ) ( not ( = ?auto_601088 ?auto_601090 ) ) ( not ( = ?auto_601093 ?auto_601089 ) ) ( not ( = ?auto_601088 ?auto_601089 ) ) ( not ( = ?auto_601090 ?auto_601089 ) ) ( not ( = ?auto_601096 ?auto_601094 ) ) ( not ( = ?auto_601096 ?auto_601099 ) ) ( not ( = ?auto_601093 ?auto_601092 ) ) ( not ( = ?auto_601088 ?auto_601092 ) ) ( not ( = ?auto_601090 ?auto_601092 ) ) ( not ( = ?auto_601089 ?auto_601092 ) ) ( not ( = ?auto_601093 ?auto_601091 ) ) ( not ( = ?auto_601088 ?auto_601091 ) ) ( not ( = ?auto_601090 ?auto_601091 ) ) ( not ( = ?auto_601089 ?auto_601091 ) ) ( not ( = ?auto_601092 ?auto_601091 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_601093 ?auto_601088 ?auto_601090 ?auto_601089 ?auto_601091 ?auto_601092 ?auto_601087 )
      ( FLY-6PPL-VERIFY ?auto_601088 ?auto_601089 ?auto_601090 ?auto_601091 ?auto_601092 ?auto_601093 ?auto_601087 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_604126 - PERSON
      ?auto_604127 - PERSON
      ?auto_604128 - PERSON
      ?auto_604129 - PERSON
      ?auto_604130 - PERSON
      ?auto_604131 - PERSON
      ?auto_604125 - CITY
    )
    :vars
    (
      ?auto_604136 - FLEVEL
      ?auto_604135 - FLEVEL
      ?auto_604134 - CITY
      ?auto_604132 - CITY
      ?auto_604137 - CITY
      ?auto_604133 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_604136 ?auto_604135 ) ( PERSON-AT ?auto_604128 ?auto_604134 ) ( not ( = ?auto_604125 ?auto_604134 ) ) ( not ( = ?auto_604136 ?auto_604135 ) ) ( PERSON-AT ?auto_604131 ?auto_604132 ) ( not ( = ?auto_604125 ?auto_604132 ) ) ( PERSON-AT ?auto_604127 ?auto_604134 ) ( PERSON-AT ?auto_604130 ?auto_604132 ) ( PERSON-AT ?auto_604126 ?auto_604132 ) ( PERSON-AT ?auto_604129 ?auto_604137 ) ( AIRCRAFT-AT ?auto_604133 ?auto_604125 ) ( FUEL-LEVEL ?auto_604133 ?auto_604136 ) ( not ( = ?auto_604125 ?auto_604137 ) ) ( not ( = ?auto_604129 ?auto_604126 ) ) ( not ( = ?auto_604132 ?auto_604137 ) ) ( not ( = ?auto_604129 ?auto_604130 ) ) ( not ( = ?auto_604126 ?auto_604130 ) ) ( not ( = ?auto_604129 ?auto_604127 ) ) ( not ( = ?auto_604126 ?auto_604127 ) ) ( not ( = ?auto_604130 ?auto_604127 ) ) ( not ( = ?auto_604134 ?auto_604132 ) ) ( not ( = ?auto_604134 ?auto_604137 ) ) ( not ( = ?auto_604129 ?auto_604131 ) ) ( not ( = ?auto_604126 ?auto_604131 ) ) ( not ( = ?auto_604130 ?auto_604131 ) ) ( not ( = ?auto_604127 ?auto_604131 ) ) ( not ( = ?auto_604129 ?auto_604128 ) ) ( not ( = ?auto_604126 ?auto_604128 ) ) ( not ( = ?auto_604130 ?auto_604128 ) ) ( not ( = ?auto_604127 ?auto_604128 ) ) ( not ( = ?auto_604131 ?auto_604128 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_604129 ?auto_604126 ?auto_604130 ?auto_604127 ?auto_604128 ?auto_604131 ?auto_604125 )
      ( FLY-6PPL-VERIFY ?auto_604126 ?auto_604127 ?auto_604128 ?auto_604129 ?auto_604130 ?auto_604131 ?auto_604125 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_605005 - PERSON
      ?auto_605006 - PERSON
      ?auto_605007 - PERSON
      ?auto_605008 - PERSON
      ?auto_605009 - PERSON
      ?auto_605010 - PERSON
      ?auto_605004 - CITY
    )
    :vars
    (
      ?auto_605015 - FLEVEL
      ?auto_605014 - FLEVEL
      ?auto_605013 - CITY
      ?auto_605011 - CITY
      ?auto_605016 - CITY
      ?auto_605012 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_605015 ?auto_605014 ) ( PERSON-AT ?auto_605007 ?auto_605013 ) ( not ( = ?auto_605004 ?auto_605013 ) ) ( not ( = ?auto_605015 ?auto_605014 ) ) ( PERSON-AT ?auto_605010 ?auto_605011 ) ( not ( = ?auto_605004 ?auto_605011 ) ) ( PERSON-AT ?auto_605006 ?auto_605013 ) ( PERSON-AT ?auto_605008 ?auto_605011 ) ( PERSON-AT ?auto_605005 ?auto_605011 ) ( PERSON-AT ?auto_605009 ?auto_605016 ) ( AIRCRAFT-AT ?auto_605012 ?auto_605004 ) ( FUEL-LEVEL ?auto_605012 ?auto_605015 ) ( not ( = ?auto_605004 ?auto_605016 ) ) ( not ( = ?auto_605009 ?auto_605005 ) ) ( not ( = ?auto_605011 ?auto_605016 ) ) ( not ( = ?auto_605009 ?auto_605008 ) ) ( not ( = ?auto_605005 ?auto_605008 ) ) ( not ( = ?auto_605009 ?auto_605006 ) ) ( not ( = ?auto_605005 ?auto_605006 ) ) ( not ( = ?auto_605008 ?auto_605006 ) ) ( not ( = ?auto_605013 ?auto_605011 ) ) ( not ( = ?auto_605013 ?auto_605016 ) ) ( not ( = ?auto_605009 ?auto_605010 ) ) ( not ( = ?auto_605005 ?auto_605010 ) ) ( not ( = ?auto_605008 ?auto_605010 ) ) ( not ( = ?auto_605006 ?auto_605010 ) ) ( not ( = ?auto_605009 ?auto_605007 ) ) ( not ( = ?auto_605005 ?auto_605007 ) ) ( not ( = ?auto_605008 ?auto_605007 ) ) ( not ( = ?auto_605006 ?auto_605007 ) ) ( not ( = ?auto_605010 ?auto_605007 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_605009 ?auto_605005 ?auto_605008 ?auto_605006 ?auto_605007 ?auto_605010 ?auto_605004 )
      ( FLY-6PPL-VERIFY ?auto_605005 ?auto_605006 ?auto_605007 ?auto_605008 ?auto_605009 ?auto_605010 ?auto_605004 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_605296 - PERSON
      ?auto_605297 - PERSON
      ?auto_605298 - PERSON
      ?auto_605299 - PERSON
      ?auto_605300 - PERSON
      ?auto_605301 - PERSON
      ?auto_605295 - CITY
    )
    :vars
    (
      ?auto_605306 - FLEVEL
      ?auto_605305 - FLEVEL
      ?auto_605304 - CITY
      ?auto_605302 - CITY
      ?auto_605307 - CITY
      ?auto_605303 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_605306 ?auto_605305 ) ( PERSON-AT ?auto_605298 ?auto_605304 ) ( not ( = ?auto_605295 ?auto_605304 ) ) ( not ( = ?auto_605306 ?auto_605305 ) ) ( PERSON-AT ?auto_605300 ?auto_605302 ) ( not ( = ?auto_605295 ?auto_605302 ) ) ( PERSON-AT ?auto_605297 ?auto_605304 ) ( PERSON-AT ?auto_605299 ?auto_605302 ) ( PERSON-AT ?auto_605296 ?auto_605302 ) ( PERSON-AT ?auto_605301 ?auto_605307 ) ( AIRCRAFT-AT ?auto_605303 ?auto_605295 ) ( FUEL-LEVEL ?auto_605303 ?auto_605306 ) ( not ( = ?auto_605295 ?auto_605307 ) ) ( not ( = ?auto_605301 ?auto_605296 ) ) ( not ( = ?auto_605302 ?auto_605307 ) ) ( not ( = ?auto_605301 ?auto_605299 ) ) ( not ( = ?auto_605296 ?auto_605299 ) ) ( not ( = ?auto_605301 ?auto_605297 ) ) ( not ( = ?auto_605296 ?auto_605297 ) ) ( not ( = ?auto_605299 ?auto_605297 ) ) ( not ( = ?auto_605304 ?auto_605302 ) ) ( not ( = ?auto_605304 ?auto_605307 ) ) ( not ( = ?auto_605301 ?auto_605300 ) ) ( not ( = ?auto_605296 ?auto_605300 ) ) ( not ( = ?auto_605299 ?auto_605300 ) ) ( not ( = ?auto_605297 ?auto_605300 ) ) ( not ( = ?auto_605301 ?auto_605298 ) ) ( not ( = ?auto_605296 ?auto_605298 ) ) ( not ( = ?auto_605299 ?auto_605298 ) ) ( not ( = ?auto_605297 ?auto_605298 ) ) ( not ( = ?auto_605300 ?auto_605298 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_605301 ?auto_605296 ?auto_605299 ?auto_605297 ?auto_605298 ?auto_605300 ?auto_605295 )
      ( FLY-6PPL-VERIFY ?auto_605296 ?auto_605297 ?auto_605298 ?auto_605299 ?auto_605300 ?auto_605301 ?auto_605295 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_705840 - PERSON
      ?auto_705841 - PERSON
      ?auto_705842 - PERSON
      ?auto_705843 - PERSON
      ?auto_705844 - PERSON
      ?auto_705845 - PERSON
      ?auto_705839 - CITY
    )
    :vars
    (
      ?auto_705850 - FLEVEL
      ?auto_705849 - FLEVEL
      ?auto_705848 - CITY
      ?auto_705846 - CITY
      ?auto_705851 - CITY
      ?auto_705847 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_705850 ?auto_705849 ) ( PERSON-AT ?auto_705845 ?auto_705848 ) ( not ( = ?auto_705839 ?auto_705848 ) ) ( not ( = ?auto_705850 ?auto_705849 ) ) ( PERSON-AT ?auto_705844 ?auto_705846 ) ( not ( = ?auto_705839 ?auto_705846 ) ) ( PERSON-AT ?auto_705840 ?auto_705848 ) ( PERSON-AT ?auto_705843 ?auto_705846 ) ( PERSON-AT ?auto_705842 ?auto_705846 ) ( PERSON-AT ?auto_705841 ?auto_705851 ) ( AIRCRAFT-AT ?auto_705847 ?auto_705839 ) ( FUEL-LEVEL ?auto_705847 ?auto_705850 ) ( not ( = ?auto_705839 ?auto_705851 ) ) ( not ( = ?auto_705841 ?auto_705842 ) ) ( not ( = ?auto_705846 ?auto_705851 ) ) ( not ( = ?auto_705841 ?auto_705843 ) ) ( not ( = ?auto_705842 ?auto_705843 ) ) ( not ( = ?auto_705841 ?auto_705840 ) ) ( not ( = ?auto_705842 ?auto_705840 ) ) ( not ( = ?auto_705843 ?auto_705840 ) ) ( not ( = ?auto_705848 ?auto_705846 ) ) ( not ( = ?auto_705848 ?auto_705851 ) ) ( not ( = ?auto_705841 ?auto_705844 ) ) ( not ( = ?auto_705842 ?auto_705844 ) ) ( not ( = ?auto_705843 ?auto_705844 ) ) ( not ( = ?auto_705840 ?auto_705844 ) ) ( not ( = ?auto_705841 ?auto_705845 ) ) ( not ( = ?auto_705842 ?auto_705845 ) ) ( not ( = ?auto_705843 ?auto_705845 ) ) ( not ( = ?auto_705840 ?auto_705845 ) ) ( not ( = ?auto_705844 ?auto_705845 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_705841 ?auto_705842 ?auto_705843 ?auto_705840 ?auto_705845 ?auto_705844 ?auto_705839 )
      ( FLY-6PPL-VERIFY ?auto_705840 ?auto_705841 ?auto_705842 ?auto_705843 ?auto_705844 ?auto_705845 ?auto_705839 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_705909 - PERSON
      ?auto_705910 - PERSON
      ?auto_705911 - PERSON
      ?auto_705912 - PERSON
      ?auto_705913 - PERSON
      ?auto_705914 - PERSON
      ?auto_705908 - CITY
    )
    :vars
    (
      ?auto_705919 - FLEVEL
      ?auto_705918 - FLEVEL
      ?auto_705917 - CITY
      ?auto_705915 - CITY
      ?auto_705920 - CITY
      ?auto_705916 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_705919 ?auto_705918 ) ( PERSON-AT ?auto_705913 ?auto_705917 ) ( not ( = ?auto_705908 ?auto_705917 ) ) ( not ( = ?auto_705919 ?auto_705918 ) ) ( PERSON-AT ?auto_705914 ?auto_705915 ) ( not ( = ?auto_705908 ?auto_705915 ) ) ( PERSON-AT ?auto_705909 ?auto_705917 ) ( PERSON-AT ?auto_705912 ?auto_705915 ) ( PERSON-AT ?auto_705911 ?auto_705915 ) ( PERSON-AT ?auto_705910 ?auto_705920 ) ( AIRCRAFT-AT ?auto_705916 ?auto_705908 ) ( FUEL-LEVEL ?auto_705916 ?auto_705919 ) ( not ( = ?auto_705908 ?auto_705920 ) ) ( not ( = ?auto_705910 ?auto_705911 ) ) ( not ( = ?auto_705915 ?auto_705920 ) ) ( not ( = ?auto_705910 ?auto_705912 ) ) ( not ( = ?auto_705911 ?auto_705912 ) ) ( not ( = ?auto_705910 ?auto_705909 ) ) ( not ( = ?auto_705911 ?auto_705909 ) ) ( not ( = ?auto_705912 ?auto_705909 ) ) ( not ( = ?auto_705917 ?auto_705915 ) ) ( not ( = ?auto_705917 ?auto_705920 ) ) ( not ( = ?auto_705910 ?auto_705914 ) ) ( not ( = ?auto_705911 ?auto_705914 ) ) ( not ( = ?auto_705912 ?auto_705914 ) ) ( not ( = ?auto_705909 ?auto_705914 ) ) ( not ( = ?auto_705910 ?auto_705913 ) ) ( not ( = ?auto_705911 ?auto_705913 ) ) ( not ( = ?auto_705912 ?auto_705913 ) ) ( not ( = ?auto_705909 ?auto_705913 ) ) ( not ( = ?auto_705914 ?auto_705913 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_705910 ?auto_705911 ?auto_705912 ?auto_705909 ?auto_705913 ?auto_705914 ?auto_705908 )
      ( FLY-6PPL-VERIFY ?auto_705909 ?auto_705910 ?auto_705911 ?auto_705912 ?auto_705913 ?auto_705914 ?auto_705908 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_706469 - PERSON
      ?auto_706470 - PERSON
      ?auto_706471 - PERSON
      ?auto_706472 - PERSON
      ?auto_706473 - PERSON
      ?auto_706474 - PERSON
      ?auto_706468 - CITY
    )
    :vars
    (
      ?auto_706479 - FLEVEL
      ?auto_706478 - FLEVEL
      ?auto_706477 - CITY
      ?auto_706475 - CITY
      ?auto_706480 - CITY
      ?auto_706476 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_706479 ?auto_706478 ) ( PERSON-AT ?auto_706472 ?auto_706477 ) ( not ( = ?auto_706468 ?auto_706477 ) ) ( not ( = ?auto_706479 ?auto_706478 ) ) ( PERSON-AT ?auto_706474 ?auto_706475 ) ( not ( = ?auto_706468 ?auto_706475 ) ) ( PERSON-AT ?auto_706469 ?auto_706477 ) ( PERSON-AT ?auto_706473 ?auto_706475 ) ( PERSON-AT ?auto_706471 ?auto_706475 ) ( PERSON-AT ?auto_706470 ?auto_706480 ) ( AIRCRAFT-AT ?auto_706476 ?auto_706468 ) ( FUEL-LEVEL ?auto_706476 ?auto_706479 ) ( not ( = ?auto_706468 ?auto_706480 ) ) ( not ( = ?auto_706470 ?auto_706471 ) ) ( not ( = ?auto_706475 ?auto_706480 ) ) ( not ( = ?auto_706470 ?auto_706473 ) ) ( not ( = ?auto_706471 ?auto_706473 ) ) ( not ( = ?auto_706470 ?auto_706469 ) ) ( not ( = ?auto_706471 ?auto_706469 ) ) ( not ( = ?auto_706473 ?auto_706469 ) ) ( not ( = ?auto_706477 ?auto_706475 ) ) ( not ( = ?auto_706477 ?auto_706480 ) ) ( not ( = ?auto_706470 ?auto_706474 ) ) ( not ( = ?auto_706471 ?auto_706474 ) ) ( not ( = ?auto_706473 ?auto_706474 ) ) ( not ( = ?auto_706469 ?auto_706474 ) ) ( not ( = ?auto_706470 ?auto_706472 ) ) ( not ( = ?auto_706471 ?auto_706472 ) ) ( not ( = ?auto_706473 ?auto_706472 ) ) ( not ( = ?auto_706469 ?auto_706472 ) ) ( not ( = ?auto_706474 ?auto_706472 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_706470 ?auto_706471 ?auto_706473 ?auto_706469 ?auto_706472 ?auto_706474 ?auto_706468 )
      ( FLY-6PPL-VERIFY ?auto_706469 ?auto_706470 ?auto_706471 ?auto_706472 ?auto_706473 ?auto_706474 ?auto_706468 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_711428 - PERSON
      ?auto_711429 - PERSON
      ?auto_711430 - PERSON
      ?auto_711431 - PERSON
      ?auto_711432 - PERSON
      ?auto_711433 - PERSON
      ?auto_711427 - CITY
    )
    :vars
    (
      ?auto_711438 - FLEVEL
      ?auto_711437 - FLEVEL
      ?auto_711436 - CITY
      ?auto_711434 - CITY
      ?auto_711439 - CITY
      ?auto_711435 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_711438 ?auto_711437 ) ( PERSON-AT ?auto_711430 ?auto_711436 ) ( not ( = ?auto_711427 ?auto_711436 ) ) ( not ( = ?auto_711438 ?auto_711437 ) ) ( PERSON-AT ?auto_711433 ?auto_711434 ) ( not ( = ?auto_711427 ?auto_711434 ) ) ( PERSON-AT ?auto_711428 ?auto_711436 ) ( PERSON-AT ?auto_711432 ?auto_711434 ) ( PERSON-AT ?auto_711431 ?auto_711434 ) ( PERSON-AT ?auto_711429 ?auto_711439 ) ( AIRCRAFT-AT ?auto_711435 ?auto_711427 ) ( FUEL-LEVEL ?auto_711435 ?auto_711438 ) ( not ( = ?auto_711427 ?auto_711439 ) ) ( not ( = ?auto_711429 ?auto_711431 ) ) ( not ( = ?auto_711434 ?auto_711439 ) ) ( not ( = ?auto_711429 ?auto_711432 ) ) ( not ( = ?auto_711431 ?auto_711432 ) ) ( not ( = ?auto_711429 ?auto_711428 ) ) ( not ( = ?auto_711431 ?auto_711428 ) ) ( not ( = ?auto_711432 ?auto_711428 ) ) ( not ( = ?auto_711436 ?auto_711434 ) ) ( not ( = ?auto_711436 ?auto_711439 ) ) ( not ( = ?auto_711429 ?auto_711433 ) ) ( not ( = ?auto_711431 ?auto_711433 ) ) ( not ( = ?auto_711432 ?auto_711433 ) ) ( not ( = ?auto_711428 ?auto_711433 ) ) ( not ( = ?auto_711429 ?auto_711430 ) ) ( not ( = ?auto_711431 ?auto_711430 ) ) ( not ( = ?auto_711432 ?auto_711430 ) ) ( not ( = ?auto_711428 ?auto_711430 ) ) ( not ( = ?auto_711433 ?auto_711430 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_711429 ?auto_711431 ?auto_711432 ?auto_711428 ?auto_711430 ?auto_711433 ?auto_711427 )
      ( FLY-6PPL-VERIFY ?auto_711428 ?auto_711429 ?auto_711430 ?auto_711431 ?auto_711432 ?auto_711433 ?auto_711427 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_714184 - PERSON
      ?auto_714185 - PERSON
      ?auto_714186 - PERSON
      ?auto_714187 - PERSON
      ?auto_714188 - PERSON
      ?auto_714189 - PERSON
      ?auto_714183 - CITY
    )
    :vars
    (
      ?auto_714194 - FLEVEL
      ?auto_714193 - FLEVEL
      ?auto_714192 - CITY
      ?auto_714190 - CITY
      ?auto_714195 - CITY
      ?auto_714191 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_714194 ?auto_714193 ) ( PERSON-AT ?auto_714189 ?auto_714192 ) ( not ( = ?auto_714183 ?auto_714192 ) ) ( not ( = ?auto_714194 ?auto_714193 ) ) ( PERSON-AT ?auto_714188 ?auto_714190 ) ( not ( = ?auto_714183 ?auto_714190 ) ) ( PERSON-AT ?auto_714184 ?auto_714192 ) ( PERSON-AT ?auto_714187 ?auto_714190 ) ( PERSON-AT ?auto_714185 ?auto_714190 ) ( PERSON-AT ?auto_714186 ?auto_714195 ) ( AIRCRAFT-AT ?auto_714191 ?auto_714183 ) ( FUEL-LEVEL ?auto_714191 ?auto_714194 ) ( not ( = ?auto_714183 ?auto_714195 ) ) ( not ( = ?auto_714186 ?auto_714185 ) ) ( not ( = ?auto_714190 ?auto_714195 ) ) ( not ( = ?auto_714186 ?auto_714187 ) ) ( not ( = ?auto_714185 ?auto_714187 ) ) ( not ( = ?auto_714186 ?auto_714184 ) ) ( not ( = ?auto_714185 ?auto_714184 ) ) ( not ( = ?auto_714187 ?auto_714184 ) ) ( not ( = ?auto_714192 ?auto_714190 ) ) ( not ( = ?auto_714192 ?auto_714195 ) ) ( not ( = ?auto_714186 ?auto_714188 ) ) ( not ( = ?auto_714185 ?auto_714188 ) ) ( not ( = ?auto_714187 ?auto_714188 ) ) ( not ( = ?auto_714184 ?auto_714188 ) ) ( not ( = ?auto_714186 ?auto_714189 ) ) ( not ( = ?auto_714185 ?auto_714189 ) ) ( not ( = ?auto_714187 ?auto_714189 ) ) ( not ( = ?auto_714184 ?auto_714189 ) ) ( not ( = ?auto_714188 ?auto_714189 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_714186 ?auto_714185 ?auto_714187 ?auto_714184 ?auto_714189 ?auto_714188 ?auto_714183 )
      ( FLY-6PPL-VERIFY ?auto_714184 ?auto_714185 ?auto_714186 ?auto_714187 ?auto_714188 ?auto_714189 ?auto_714183 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_714253 - PERSON
      ?auto_714254 - PERSON
      ?auto_714255 - PERSON
      ?auto_714256 - PERSON
      ?auto_714257 - PERSON
      ?auto_714258 - PERSON
      ?auto_714252 - CITY
    )
    :vars
    (
      ?auto_714263 - FLEVEL
      ?auto_714262 - FLEVEL
      ?auto_714261 - CITY
      ?auto_714259 - CITY
      ?auto_714264 - CITY
      ?auto_714260 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_714263 ?auto_714262 ) ( PERSON-AT ?auto_714257 ?auto_714261 ) ( not ( = ?auto_714252 ?auto_714261 ) ) ( not ( = ?auto_714263 ?auto_714262 ) ) ( PERSON-AT ?auto_714258 ?auto_714259 ) ( not ( = ?auto_714252 ?auto_714259 ) ) ( PERSON-AT ?auto_714253 ?auto_714261 ) ( PERSON-AT ?auto_714256 ?auto_714259 ) ( PERSON-AT ?auto_714254 ?auto_714259 ) ( PERSON-AT ?auto_714255 ?auto_714264 ) ( AIRCRAFT-AT ?auto_714260 ?auto_714252 ) ( FUEL-LEVEL ?auto_714260 ?auto_714263 ) ( not ( = ?auto_714252 ?auto_714264 ) ) ( not ( = ?auto_714255 ?auto_714254 ) ) ( not ( = ?auto_714259 ?auto_714264 ) ) ( not ( = ?auto_714255 ?auto_714256 ) ) ( not ( = ?auto_714254 ?auto_714256 ) ) ( not ( = ?auto_714255 ?auto_714253 ) ) ( not ( = ?auto_714254 ?auto_714253 ) ) ( not ( = ?auto_714256 ?auto_714253 ) ) ( not ( = ?auto_714261 ?auto_714259 ) ) ( not ( = ?auto_714261 ?auto_714264 ) ) ( not ( = ?auto_714255 ?auto_714258 ) ) ( not ( = ?auto_714254 ?auto_714258 ) ) ( not ( = ?auto_714256 ?auto_714258 ) ) ( not ( = ?auto_714253 ?auto_714258 ) ) ( not ( = ?auto_714255 ?auto_714257 ) ) ( not ( = ?auto_714254 ?auto_714257 ) ) ( not ( = ?auto_714256 ?auto_714257 ) ) ( not ( = ?auto_714253 ?auto_714257 ) ) ( not ( = ?auto_714258 ?auto_714257 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_714255 ?auto_714254 ?auto_714256 ?auto_714253 ?auto_714257 ?auto_714258 ?auto_714252 )
      ( FLY-6PPL-VERIFY ?auto_714253 ?auto_714254 ?auto_714255 ?auto_714256 ?auto_714257 ?auto_714258 ?auto_714252 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_714813 - PERSON
      ?auto_714814 - PERSON
      ?auto_714815 - PERSON
      ?auto_714816 - PERSON
      ?auto_714817 - PERSON
      ?auto_714818 - PERSON
      ?auto_714812 - CITY
    )
    :vars
    (
      ?auto_714823 - FLEVEL
      ?auto_714822 - FLEVEL
      ?auto_714821 - CITY
      ?auto_714819 - CITY
      ?auto_714824 - CITY
      ?auto_714820 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_714823 ?auto_714822 ) ( PERSON-AT ?auto_714816 ?auto_714821 ) ( not ( = ?auto_714812 ?auto_714821 ) ) ( not ( = ?auto_714823 ?auto_714822 ) ) ( PERSON-AT ?auto_714818 ?auto_714819 ) ( not ( = ?auto_714812 ?auto_714819 ) ) ( PERSON-AT ?auto_714813 ?auto_714821 ) ( PERSON-AT ?auto_714817 ?auto_714819 ) ( PERSON-AT ?auto_714814 ?auto_714819 ) ( PERSON-AT ?auto_714815 ?auto_714824 ) ( AIRCRAFT-AT ?auto_714820 ?auto_714812 ) ( FUEL-LEVEL ?auto_714820 ?auto_714823 ) ( not ( = ?auto_714812 ?auto_714824 ) ) ( not ( = ?auto_714815 ?auto_714814 ) ) ( not ( = ?auto_714819 ?auto_714824 ) ) ( not ( = ?auto_714815 ?auto_714817 ) ) ( not ( = ?auto_714814 ?auto_714817 ) ) ( not ( = ?auto_714815 ?auto_714813 ) ) ( not ( = ?auto_714814 ?auto_714813 ) ) ( not ( = ?auto_714817 ?auto_714813 ) ) ( not ( = ?auto_714821 ?auto_714819 ) ) ( not ( = ?auto_714821 ?auto_714824 ) ) ( not ( = ?auto_714815 ?auto_714818 ) ) ( not ( = ?auto_714814 ?auto_714818 ) ) ( not ( = ?auto_714817 ?auto_714818 ) ) ( not ( = ?auto_714813 ?auto_714818 ) ) ( not ( = ?auto_714815 ?auto_714816 ) ) ( not ( = ?auto_714814 ?auto_714816 ) ) ( not ( = ?auto_714817 ?auto_714816 ) ) ( not ( = ?auto_714813 ?auto_714816 ) ) ( not ( = ?auto_714818 ?auto_714816 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_714815 ?auto_714814 ?auto_714817 ?auto_714813 ?auto_714816 ?auto_714818 ?auto_714812 )
      ( FLY-6PPL-VERIFY ?auto_714813 ?auto_714814 ?auto_714815 ?auto_714816 ?auto_714817 ?auto_714818 ?auto_714812 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_716515 - PERSON
      ?auto_716516 - PERSON
      ?auto_716517 - PERSON
      ?auto_716518 - PERSON
      ?auto_716519 - PERSON
      ?auto_716520 - PERSON
      ?auto_716514 - CITY
    )
    :vars
    (
      ?auto_716525 - FLEVEL
      ?auto_716524 - FLEVEL
      ?auto_716523 - CITY
      ?auto_716521 - CITY
      ?auto_716526 - CITY
      ?auto_716522 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_716525 ?auto_716524 ) ( PERSON-AT ?auto_716520 ?auto_716523 ) ( not ( = ?auto_716514 ?auto_716523 ) ) ( not ( = ?auto_716525 ?auto_716524 ) ) ( PERSON-AT ?auto_716519 ?auto_716521 ) ( not ( = ?auto_716514 ?auto_716521 ) ) ( PERSON-AT ?auto_716515 ?auto_716523 ) ( PERSON-AT ?auto_716517 ?auto_716521 ) ( PERSON-AT ?auto_716516 ?auto_716521 ) ( PERSON-AT ?auto_716518 ?auto_716526 ) ( AIRCRAFT-AT ?auto_716522 ?auto_716514 ) ( FUEL-LEVEL ?auto_716522 ?auto_716525 ) ( not ( = ?auto_716514 ?auto_716526 ) ) ( not ( = ?auto_716518 ?auto_716516 ) ) ( not ( = ?auto_716521 ?auto_716526 ) ) ( not ( = ?auto_716518 ?auto_716517 ) ) ( not ( = ?auto_716516 ?auto_716517 ) ) ( not ( = ?auto_716518 ?auto_716515 ) ) ( not ( = ?auto_716516 ?auto_716515 ) ) ( not ( = ?auto_716517 ?auto_716515 ) ) ( not ( = ?auto_716523 ?auto_716521 ) ) ( not ( = ?auto_716523 ?auto_716526 ) ) ( not ( = ?auto_716518 ?auto_716519 ) ) ( not ( = ?auto_716516 ?auto_716519 ) ) ( not ( = ?auto_716517 ?auto_716519 ) ) ( not ( = ?auto_716515 ?auto_716519 ) ) ( not ( = ?auto_716518 ?auto_716520 ) ) ( not ( = ?auto_716516 ?auto_716520 ) ) ( not ( = ?auto_716517 ?auto_716520 ) ) ( not ( = ?auto_716515 ?auto_716520 ) ) ( not ( = ?auto_716519 ?auto_716520 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_716518 ?auto_716516 ?auto_716517 ?auto_716515 ?auto_716520 ?auto_716519 ?auto_716514 )
      ( FLY-6PPL-VERIFY ?auto_716515 ?auto_716516 ?auto_716517 ?auto_716518 ?auto_716519 ?auto_716520 ?auto_716514 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_716584 - PERSON
      ?auto_716585 - PERSON
      ?auto_716586 - PERSON
      ?auto_716587 - PERSON
      ?auto_716588 - PERSON
      ?auto_716589 - PERSON
      ?auto_716583 - CITY
    )
    :vars
    (
      ?auto_716594 - FLEVEL
      ?auto_716593 - FLEVEL
      ?auto_716592 - CITY
      ?auto_716590 - CITY
      ?auto_716595 - CITY
      ?auto_716591 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_716594 ?auto_716593 ) ( PERSON-AT ?auto_716588 ?auto_716592 ) ( not ( = ?auto_716583 ?auto_716592 ) ) ( not ( = ?auto_716594 ?auto_716593 ) ) ( PERSON-AT ?auto_716589 ?auto_716590 ) ( not ( = ?auto_716583 ?auto_716590 ) ) ( PERSON-AT ?auto_716584 ?auto_716592 ) ( PERSON-AT ?auto_716586 ?auto_716590 ) ( PERSON-AT ?auto_716585 ?auto_716590 ) ( PERSON-AT ?auto_716587 ?auto_716595 ) ( AIRCRAFT-AT ?auto_716591 ?auto_716583 ) ( FUEL-LEVEL ?auto_716591 ?auto_716594 ) ( not ( = ?auto_716583 ?auto_716595 ) ) ( not ( = ?auto_716587 ?auto_716585 ) ) ( not ( = ?auto_716590 ?auto_716595 ) ) ( not ( = ?auto_716587 ?auto_716586 ) ) ( not ( = ?auto_716585 ?auto_716586 ) ) ( not ( = ?auto_716587 ?auto_716584 ) ) ( not ( = ?auto_716585 ?auto_716584 ) ) ( not ( = ?auto_716586 ?auto_716584 ) ) ( not ( = ?auto_716592 ?auto_716590 ) ) ( not ( = ?auto_716592 ?auto_716595 ) ) ( not ( = ?auto_716587 ?auto_716589 ) ) ( not ( = ?auto_716585 ?auto_716589 ) ) ( not ( = ?auto_716586 ?auto_716589 ) ) ( not ( = ?auto_716584 ?auto_716589 ) ) ( not ( = ?auto_716587 ?auto_716588 ) ) ( not ( = ?auto_716585 ?auto_716588 ) ) ( not ( = ?auto_716586 ?auto_716588 ) ) ( not ( = ?auto_716584 ?auto_716588 ) ) ( not ( = ?auto_716589 ?auto_716588 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_716587 ?auto_716585 ?auto_716586 ?auto_716584 ?auto_716588 ?auto_716589 ?auto_716583 )
      ( FLY-6PPL-VERIFY ?auto_716584 ?auto_716585 ?auto_716586 ?auto_716587 ?auto_716588 ?auto_716589 ?auto_716583 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_717094 - PERSON
      ?auto_717095 - PERSON
      ?auto_717096 - PERSON
      ?auto_717097 - PERSON
      ?auto_717098 - PERSON
      ?auto_717099 - PERSON
      ?auto_717093 - CITY
    )
    :vars
    (
      ?auto_717104 - FLEVEL
      ?auto_717103 - FLEVEL
      ?auto_717102 - CITY
      ?auto_717100 - CITY
      ?auto_717105 - CITY
      ?auto_717101 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_717104 ?auto_717103 ) ( PERSON-AT ?auto_717099 ?auto_717102 ) ( not ( = ?auto_717093 ?auto_717102 ) ) ( not ( = ?auto_717104 ?auto_717103 ) ) ( PERSON-AT ?auto_717097 ?auto_717100 ) ( not ( = ?auto_717093 ?auto_717100 ) ) ( PERSON-AT ?auto_717094 ?auto_717102 ) ( PERSON-AT ?auto_717096 ?auto_717100 ) ( PERSON-AT ?auto_717095 ?auto_717100 ) ( PERSON-AT ?auto_717098 ?auto_717105 ) ( AIRCRAFT-AT ?auto_717101 ?auto_717093 ) ( FUEL-LEVEL ?auto_717101 ?auto_717104 ) ( not ( = ?auto_717093 ?auto_717105 ) ) ( not ( = ?auto_717098 ?auto_717095 ) ) ( not ( = ?auto_717100 ?auto_717105 ) ) ( not ( = ?auto_717098 ?auto_717096 ) ) ( not ( = ?auto_717095 ?auto_717096 ) ) ( not ( = ?auto_717098 ?auto_717094 ) ) ( not ( = ?auto_717095 ?auto_717094 ) ) ( not ( = ?auto_717096 ?auto_717094 ) ) ( not ( = ?auto_717102 ?auto_717100 ) ) ( not ( = ?auto_717102 ?auto_717105 ) ) ( not ( = ?auto_717098 ?auto_717097 ) ) ( not ( = ?auto_717095 ?auto_717097 ) ) ( not ( = ?auto_717096 ?auto_717097 ) ) ( not ( = ?auto_717094 ?auto_717097 ) ) ( not ( = ?auto_717098 ?auto_717099 ) ) ( not ( = ?auto_717095 ?auto_717099 ) ) ( not ( = ?auto_717096 ?auto_717099 ) ) ( not ( = ?auto_717094 ?auto_717099 ) ) ( not ( = ?auto_717097 ?auto_717099 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_717098 ?auto_717095 ?auto_717096 ?auto_717094 ?auto_717099 ?auto_717097 ?auto_717093 )
      ( FLY-6PPL-VERIFY ?auto_717094 ?auto_717095 ?auto_717096 ?auto_717097 ?auto_717098 ?auto_717099 ?auto_717093 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_717163 - PERSON
      ?auto_717164 - PERSON
      ?auto_717165 - PERSON
      ?auto_717166 - PERSON
      ?auto_717167 - PERSON
      ?auto_717168 - PERSON
      ?auto_717162 - CITY
    )
    :vars
    (
      ?auto_717173 - FLEVEL
      ?auto_717172 - FLEVEL
      ?auto_717171 - CITY
      ?auto_717169 - CITY
      ?auto_717174 - CITY
      ?auto_717170 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_717173 ?auto_717172 ) ( PERSON-AT ?auto_717167 ?auto_717171 ) ( not ( = ?auto_717162 ?auto_717171 ) ) ( not ( = ?auto_717173 ?auto_717172 ) ) ( PERSON-AT ?auto_717166 ?auto_717169 ) ( not ( = ?auto_717162 ?auto_717169 ) ) ( PERSON-AT ?auto_717163 ?auto_717171 ) ( PERSON-AT ?auto_717165 ?auto_717169 ) ( PERSON-AT ?auto_717164 ?auto_717169 ) ( PERSON-AT ?auto_717168 ?auto_717174 ) ( AIRCRAFT-AT ?auto_717170 ?auto_717162 ) ( FUEL-LEVEL ?auto_717170 ?auto_717173 ) ( not ( = ?auto_717162 ?auto_717174 ) ) ( not ( = ?auto_717168 ?auto_717164 ) ) ( not ( = ?auto_717169 ?auto_717174 ) ) ( not ( = ?auto_717168 ?auto_717165 ) ) ( not ( = ?auto_717164 ?auto_717165 ) ) ( not ( = ?auto_717168 ?auto_717163 ) ) ( not ( = ?auto_717164 ?auto_717163 ) ) ( not ( = ?auto_717165 ?auto_717163 ) ) ( not ( = ?auto_717171 ?auto_717169 ) ) ( not ( = ?auto_717171 ?auto_717174 ) ) ( not ( = ?auto_717168 ?auto_717166 ) ) ( not ( = ?auto_717164 ?auto_717166 ) ) ( not ( = ?auto_717165 ?auto_717166 ) ) ( not ( = ?auto_717163 ?auto_717166 ) ) ( not ( = ?auto_717168 ?auto_717167 ) ) ( not ( = ?auto_717164 ?auto_717167 ) ) ( not ( = ?auto_717165 ?auto_717167 ) ) ( not ( = ?auto_717163 ?auto_717167 ) ) ( not ( = ?auto_717166 ?auto_717167 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_717168 ?auto_717164 ?auto_717165 ?auto_717163 ?auto_717167 ?auto_717166 ?auto_717162 )
      ( FLY-6PPL-VERIFY ?auto_717163 ?auto_717164 ?auto_717165 ?auto_717166 ?auto_717167 ?auto_717168 ?auto_717162 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_717302 - PERSON
      ?auto_717303 - PERSON
      ?auto_717304 - PERSON
      ?auto_717305 - PERSON
      ?auto_717306 - PERSON
      ?auto_717307 - PERSON
      ?auto_717301 - CITY
    )
    :vars
    (
      ?auto_717312 - FLEVEL
      ?auto_717311 - FLEVEL
      ?auto_717310 - CITY
      ?auto_717308 - CITY
      ?auto_717313 - CITY
      ?auto_717309 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_717312 ?auto_717311 ) ( PERSON-AT ?auto_717305 ?auto_717310 ) ( not ( = ?auto_717301 ?auto_717310 ) ) ( not ( = ?auto_717312 ?auto_717311 ) ) ( PERSON-AT ?auto_717307 ?auto_717308 ) ( not ( = ?auto_717301 ?auto_717308 ) ) ( PERSON-AT ?auto_717302 ?auto_717310 ) ( PERSON-AT ?auto_717304 ?auto_717308 ) ( PERSON-AT ?auto_717303 ?auto_717308 ) ( PERSON-AT ?auto_717306 ?auto_717313 ) ( AIRCRAFT-AT ?auto_717309 ?auto_717301 ) ( FUEL-LEVEL ?auto_717309 ?auto_717312 ) ( not ( = ?auto_717301 ?auto_717313 ) ) ( not ( = ?auto_717306 ?auto_717303 ) ) ( not ( = ?auto_717308 ?auto_717313 ) ) ( not ( = ?auto_717306 ?auto_717304 ) ) ( not ( = ?auto_717303 ?auto_717304 ) ) ( not ( = ?auto_717306 ?auto_717302 ) ) ( not ( = ?auto_717303 ?auto_717302 ) ) ( not ( = ?auto_717304 ?auto_717302 ) ) ( not ( = ?auto_717310 ?auto_717308 ) ) ( not ( = ?auto_717310 ?auto_717313 ) ) ( not ( = ?auto_717306 ?auto_717307 ) ) ( not ( = ?auto_717303 ?auto_717307 ) ) ( not ( = ?auto_717304 ?auto_717307 ) ) ( not ( = ?auto_717302 ?auto_717307 ) ) ( not ( = ?auto_717306 ?auto_717305 ) ) ( not ( = ?auto_717303 ?auto_717305 ) ) ( not ( = ?auto_717304 ?auto_717305 ) ) ( not ( = ?auto_717302 ?auto_717305 ) ) ( not ( = ?auto_717307 ?auto_717305 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_717306 ?auto_717303 ?auto_717304 ?auto_717302 ?auto_717305 ?auto_717307 ?auto_717301 )
      ( FLY-6PPL-VERIFY ?auto_717302 ?auto_717303 ?auto_717304 ?auto_717305 ?auto_717306 ?auto_717307 ?auto_717301 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_717593 - PERSON
      ?auto_717594 - PERSON
      ?auto_717595 - PERSON
      ?auto_717596 - PERSON
      ?auto_717597 - PERSON
      ?auto_717598 - PERSON
      ?auto_717592 - CITY
    )
    :vars
    (
      ?auto_717603 - FLEVEL
      ?auto_717602 - FLEVEL
      ?auto_717601 - CITY
      ?auto_717599 - CITY
      ?auto_717604 - CITY
      ?auto_717600 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_717603 ?auto_717602 ) ( PERSON-AT ?auto_717596 ?auto_717601 ) ( not ( = ?auto_717592 ?auto_717601 ) ) ( not ( = ?auto_717603 ?auto_717602 ) ) ( PERSON-AT ?auto_717597 ?auto_717599 ) ( not ( = ?auto_717592 ?auto_717599 ) ) ( PERSON-AT ?auto_717593 ?auto_717601 ) ( PERSON-AT ?auto_717595 ?auto_717599 ) ( PERSON-AT ?auto_717594 ?auto_717599 ) ( PERSON-AT ?auto_717598 ?auto_717604 ) ( AIRCRAFT-AT ?auto_717600 ?auto_717592 ) ( FUEL-LEVEL ?auto_717600 ?auto_717603 ) ( not ( = ?auto_717592 ?auto_717604 ) ) ( not ( = ?auto_717598 ?auto_717594 ) ) ( not ( = ?auto_717599 ?auto_717604 ) ) ( not ( = ?auto_717598 ?auto_717595 ) ) ( not ( = ?auto_717594 ?auto_717595 ) ) ( not ( = ?auto_717598 ?auto_717593 ) ) ( not ( = ?auto_717594 ?auto_717593 ) ) ( not ( = ?auto_717595 ?auto_717593 ) ) ( not ( = ?auto_717601 ?auto_717599 ) ) ( not ( = ?auto_717601 ?auto_717604 ) ) ( not ( = ?auto_717598 ?auto_717597 ) ) ( not ( = ?auto_717594 ?auto_717597 ) ) ( not ( = ?auto_717595 ?auto_717597 ) ) ( not ( = ?auto_717593 ?auto_717597 ) ) ( not ( = ?auto_717598 ?auto_717596 ) ) ( not ( = ?auto_717594 ?auto_717596 ) ) ( not ( = ?auto_717595 ?auto_717596 ) ) ( not ( = ?auto_717593 ?auto_717596 ) ) ( not ( = ?auto_717597 ?auto_717596 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_717598 ?auto_717594 ?auto_717595 ?auto_717593 ?auto_717596 ?auto_717597 ?auto_717592 )
      ( FLY-6PPL-VERIFY ?auto_717593 ?auto_717594 ?auto_717595 ?auto_717596 ?auto_717597 ?auto_717598 ?auto_717592 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_720631 - PERSON
      ?auto_720632 - PERSON
      ?auto_720633 - PERSON
      ?auto_720634 - PERSON
      ?auto_720635 - PERSON
      ?auto_720636 - PERSON
      ?auto_720630 - CITY
    )
    :vars
    (
      ?auto_720641 - FLEVEL
      ?auto_720640 - FLEVEL
      ?auto_720639 - CITY
      ?auto_720637 - CITY
      ?auto_720642 - CITY
      ?auto_720638 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_720641 ?auto_720640 ) ( PERSON-AT ?auto_720633 ?auto_720639 ) ( not ( = ?auto_720630 ?auto_720639 ) ) ( not ( = ?auto_720641 ?auto_720640 ) ) ( PERSON-AT ?auto_720636 ?auto_720637 ) ( not ( = ?auto_720630 ?auto_720637 ) ) ( PERSON-AT ?auto_720631 ?auto_720639 ) ( PERSON-AT ?auto_720635 ?auto_720637 ) ( PERSON-AT ?auto_720632 ?auto_720637 ) ( PERSON-AT ?auto_720634 ?auto_720642 ) ( AIRCRAFT-AT ?auto_720638 ?auto_720630 ) ( FUEL-LEVEL ?auto_720638 ?auto_720641 ) ( not ( = ?auto_720630 ?auto_720642 ) ) ( not ( = ?auto_720634 ?auto_720632 ) ) ( not ( = ?auto_720637 ?auto_720642 ) ) ( not ( = ?auto_720634 ?auto_720635 ) ) ( not ( = ?auto_720632 ?auto_720635 ) ) ( not ( = ?auto_720634 ?auto_720631 ) ) ( not ( = ?auto_720632 ?auto_720631 ) ) ( not ( = ?auto_720635 ?auto_720631 ) ) ( not ( = ?auto_720639 ?auto_720637 ) ) ( not ( = ?auto_720639 ?auto_720642 ) ) ( not ( = ?auto_720634 ?auto_720636 ) ) ( not ( = ?auto_720632 ?auto_720636 ) ) ( not ( = ?auto_720635 ?auto_720636 ) ) ( not ( = ?auto_720631 ?auto_720636 ) ) ( not ( = ?auto_720634 ?auto_720633 ) ) ( not ( = ?auto_720632 ?auto_720633 ) ) ( not ( = ?auto_720635 ?auto_720633 ) ) ( not ( = ?auto_720631 ?auto_720633 ) ) ( not ( = ?auto_720636 ?auto_720633 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_720634 ?auto_720632 ?auto_720635 ?auto_720631 ?auto_720633 ?auto_720636 ?auto_720630 )
      ( FLY-6PPL-VERIFY ?auto_720631 ?auto_720632 ?auto_720633 ?auto_720634 ?auto_720635 ?auto_720636 ?auto_720630 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_721510 - PERSON
      ?auto_721511 - PERSON
      ?auto_721512 - PERSON
      ?auto_721513 - PERSON
      ?auto_721514 - PERSON
      ?auto_721515 - PERSON
      ?auto_721509 - CITY
    )
    :vars
    (
      ?auto_721520 - FLEVEL
      ?auto_721519 - FLEVEL
      ?auto_721518 - CITY
      ?auto_721516 - CITY
      ?auto_721521 - CITY
      ?auto_721517 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_721520 ?auto_721519 ) ( PERSON-AT ?auto_721512 ?auto_721518 ) ( not ( = ?auto_721509 ?auto_721518 ) ) ( not ( = ?auto_721520 ?auto_721519 ) ) ( PERSON-AT ?auto_721515 ?auto_721516 ) ( not ( = ?auto_721509 ?auto_721516 ) ) ( PERSON-AT ?auto_721510 ?auto_721518 ) ( PERSON-AT ?auto_721513 ?auto_721516 ) ( PERSON-AT ?auto_721511 ?auto_721516 ) ( PERSON-AT ?auto_721514 ?auto_721521 ) ( AIRCRAFT-AT ?auto_721517 ?auto_721509 ) ( FUEL-LEVEL ?auto_721517 ?auto_721520 ) ( not ( = ?auto_721509 ?auto_721521 ) ) ( not ( = ?auto_721514 ?auto_721511 ) ) ( not ( = ?auto_721516 ?auto_721521 ) ) ( not ( = ?auto_721514 ?auto_721513 ) ) ( not ( = ?auto_721511 ?auto_721513 ) ) ( not ( = ?auto_721514 ?auto_721510 ) ) ( not ( = ?auto_721511 ?auto_721510 ) ) ( not ( = ?auto_721513 ?auto_721510 ) ) ( not ( = ?auto_721518 ?auto_721516 ) ) ( not ( = ?auto_721518 ?auto_721521 ) ) ( not ( = ?auto_721514 ?auto_721515 ) ) ( not ( = ?auto_721511 ?auto_721515 ) ) ( not ( = ?auto_721513 ?auto_721515 ) ) ( not ( = ?auto_721510 ?auto_721515 ) ) ( not ( = ?auto_721514 ?auto_721512 ) ) ( not ( = ?auto_721511 ?auto_721512 ) ) ( not ( = ?auto_721513 ?auto_721512 ) ) ( not ( = ?auto_721510 ?auto_721512 ) ) ( not ( = ?auto_721515 ?auto_721512 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_721514 ?auto_721511 ?auto_721513 ?auto_721510 ?auto_721512 ?auto_721515 ?auto_721509 )
      ( FLY-6PPL-VERIFY ?auto_721510 ?auto_721511 ?auto_721512 ?auto_721513 ?auto_721514 ?auto_721515 ?auto_721509 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_721801 - PERSON
      ?auto_721802 - PERSON
      ?auto_721803 - PERSON
      ?auto_721804 - PERSON
      ?auto_721805 - PERSON
      ?auto_721806 - PERSON
      ?auto_721800 - CITY
    )
    :vars
    (
      ?auto_721811 - FLEVEL
      ?auto_721810 - FLEVEL
      ?auto_721809 - CITY
      ?auto_721807 - CITY
      ?auto_721812 - CITY
      ?auto_721808 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_721811 ?auto_721810 ) ( PERSON-AT ?auto_721803 ?auto_721809 ) ( not ( = ?auto_721800 ?auto_721809 ) ) ( not ( = ?auto_721811 ?auto_721810 ) ) ( PERSON-AT ?auto_721805 ?auto_721807 ) ( not ( = ?auto_721800 ?auto_721807 ) ) ( PERSON-AT ?auto_721801 ?auto_721809 ) ( PERSON-AT ?auto_721804 ?auto_721807 ) ( PERSON-AT ?auto_721802 ?auto_721807 ) ( PERSON-AT ?auto_721806 ?auto_721812 ) ( AIRCRAFT-AT ?auto_721808 ?auto_721800 ) ( FUEL-LEVEL ?auto_721808 ?auto_721811 ) ( not ( = ?auto_721800 ?auto_721812 ) ) ( not ( = ?auto_721806 ?auto_721802 ) ) ( not ( = ?auto_721807 ?auto_721812 ) ) ( not ( = ?auto_721806 ?auto_721804 ) ) ( not ( = ?auto_721802 ?auto_721804 ) ) ( not ( = ?auto_721806 ?auto_721801 ) ) ( not ( = ?auto_721802 ?auto_721801 ) ) ( not ( = ?auto_721804 ?auto_721801 ) ) ( not ( = ?auto_721809 ?auto_721807 ) ) ( not ( = ?auto_721809 ?auto_721812 ) ) ( not ( = ?auto_721806 ?auto_721805 ) ) ( not ( = ?auto_721802 ?auto_721805 ) ) ( not ( = ?auto_721804 ?auto_721805 ) ) ( not ( = ?auto_721801 ?auto_721805 ) ) ( not ( = ?auto_721806 ?auto_721803 ) ) ( not ( = ?auto_721802 ?auto_721803 ) ) ( not ( = ?auto_721804 ?auto_721803 ) ) ( not ( = ?auto_721801 ?auto_721803 ) ) ( not ( = ?auto_721805 ?auto_721803 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_721806 ?auto_721802 ?auto_721804 ?auto_721801 ?auto_721803 ?auto_721805 ?auto_721800 )
      ( FLY-6PPL-VERIFY ?auto_721801 ?auto_721802 ?auto_721803 ?auto_721804 ?auto_721805 ?auto_721806 ?auto_721800 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_753910 - PERSON
      ?auto_753911 - PERSON
      ?auto_753912 - PERSON
      ?auto_753913 - PERSON
      ?auto_753914 - PERSON
      ?auto_753915 - PERSON
      ?auto_753909 - CITY
    )
    :vars
    (
      ?auto_753920 - FLEVEL
      ?auto_753919 - FLEVEL
      ?auto_753918 - CITY
      ?auto_753916 - CITY
      ?auto_753921 - CITY
      ?auto_753917 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_753920 ?auto_753919 ) ( PERSON-AT ?auto_753911 ?auto_753918 ) ( not ( = ?auto_753909 ?auto_753918 ) ) ( not ( = ?auto_753920 ?auto_753919 ) ) ( PERSON-AT ?auto_753915 ?auto_753916 ) ( not ( = ?auto_753909 ?auto_753916 ) ) ( PERSON-AT ?auto_753910 ?auto_753918 ) ( PERSON-AT ?auto_753914 ?auto_753916 ) ( PERSON-AT ?auto_753913 ?auto_753916 ) ( PERSON-AT ?auto_753912 ?auto_753921 ) ( AIRCRAFT-AT ?auto_753917 ?auto_753909 ) ( FUEL-LEVEL ?auto_753917 ?auto_753920 ) ( not ( = ?auto_753909 ?auto_753921 ) ) ( not ( = ?auto_753912 ?auto_753913 ) ) ( not ( = ?auto_753916 ?auto_753921 ) ) ( not ( = ?auto_753912 ?auto_753914 ) ) ( not ( = ?auto_753913 ?auto_753914 ) ) ( not ( = ?auto_753912 ?auto_753910 ) ) ( not ( = ?auto_753913 ?auto_753910 ) ) ( not ( = ?auto_753914 ?auto_753910 ) ) ( not ( = ?auto_753918 ?auto_753916 ) ) ( not ( = ?auto_753918 ?auto_753921 ) ) ( not ( = ?auto_753912 ?auto_753915 ) ) ( not ( = ?auto_753913 ?auto_753915 ) ) ( not ( = ?auto_753914 ?auto_753915 ) ) ( not ( = ?auto_753910 ?auto_753915 ) ) ( not ( = ?auto_753912 ?auto_753911 ) ) ( not ( = ?auto_753913 ?auto_753911 ) ) ( not ( = ?auto_753914 ?auto_753911 ) ) ( not ( = ?auto_753910 ?auto_753911 ) ) ( not ( = ?auto_753915 ?auto_753911 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_753912 ?auto_753913 ?auto_753914 ?auto_753910 ?auto_753911 ?auto_753915 ?auto_753909 )
      ( FLY-6PPL-VERIFY ?auto_753910 ?auto_753911 ?auto_753912 ?auto_753913 ?auto_753914 ?auto_753915 ?auto_753909 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_756520 - PERSON
      ?auto_756521 - PERSON
      ?auto_756522 - PERSON
      ?auto_756523 - PERSON
      ?auto_756524 - PERSON
      ?auto_756525 - PERSON
      ?auto_756519 - CITY
    )
    :vars
    (
      ?auto_756530 - FLEVEL
      ?auto_756529 - FLEVEL
      ?auto_756528 - CITY
      ?auto_756526 - CITY
      ?auto_756531 - CITY
      ?auto_756527 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_756530 ?auto_756529 ) ( PERSON-AT ?auto_756521 ?auto_756528 ) ( not ( = ?auto_756519 ?auto_756528 ) ) ( not ( = ?auto_756530 ?auto_756529 ) ) ( PERSON-AT ?auto_756525 ?auto_756526 ) ( not ( = ?auto_756519 ?auto_756526 ) ) ( PERSON-AT ?auto_756520 ?auto_756528 ) ( PERSON-AT ?auto_756524 ?auto_756526 ) ( PERSON-AT ?auto_756522 ?auto_756526 ) ( PERSON-AT ?auto_756523 ?auto_756531 ) ( AIRCRAFT-AT ?auto_756527 ?auto_756519 ) ( FUEL-LEVEL ?auto_756527 ?auto_756530 ) ( not ( = ?auto_756519 ?auto_756531 ) ) ( not ( = ?auto_756523 ?auto_756522 ) ) ( not ( = ?auto_756526 ?auto_756531 ) ) ( not ( = ?auto_756523 ?auto_756524 ) ) ( not ( = ?auto_756522 ?auto_756524 ) ) ( not ( = ?auto_756523 ?auto_756520 ) ) ( not ( = ?auto_756522 ?auto_756520 ) ) ( not ( = ?auto_756524 ?auto_756520 ) ) ( not ( = ?auto_756528 ?auto_756526 ) ) ( not ( = ?auto_756528 ?auto_756531 ) ) ( not ( = ?auto_756523 ?auto_756525 ) ) ( not ( = ?auto_756522 ?auto_756525 ) ) ( not ( = ?auto_756524 ?auto_756525 ) ) ( not ( = ?auto_756520 ?auto_756525 ) ) ( not ( = ?auto_756523 ?auto_756521 ) ) ( not ( = ?auto_756522 ?auto_756521 ) ) ( not ( = ?auto_756524 ?auto_756521 ) ) ( not ( = ?auto_756520 ?auto_756521 ) ) ( not ( = ?auto_756525 ?auto_756521 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_756523 ?auto_756522 ?auto_756524 ?auto_756520 ?auto_756521 ?auto_756525 ?auto_756519 )
      ( FLY-6PPL-VERIFY ?auto_756520 ?auto_756521 ?auto_756522 ?auto_756523 ?auto_756524 ?auto_756525 ?auto_756519 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_757399 - PERSON
      ?auto_757400 - PERSON
      ?auto_757401 - PERSON
      ?auto_757402 - PERSON
      ?auto_757403 - PERSON
      ?auto_757404 - PERSON
      ?auto_757398 - CITY
    )
    :vars
    (
      ?auto_757409 - FLEVEL
      ?auto_757408 - FLEVEL
      ?auto_757407 - CITY
      ?auto_757405 - CITY
      ?auto_757410 - CITY
      ?auto_757406 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_757409 ?auto_757408 ) ( PERSON-AT ?auto_757400 ?auto_757407 ) ( not ( = ?auto_757398 ?auto_757407 ) ) ( not ( = ?auto_757409 ?auto_757408 ) ) ( PERSON-AT ?auto_757404 ?auto_757405 ) ( not ( = ?auto_757398 ?auto_757405 ) ) ( PERSON-AT ?auto_757399 ?auto_757407 ) ( PERSON-AT ?auto_757402 ?auto_757405 ) ( PERSON-AT ?auto_757401 ?auto_757405 ) ( PERSON-AT ?auto_757403 ?auto_757410 ) ( AIRCRAFT-AT ?auto_757406 ?auto_757398 ) ( FUEL-LEVEL ?auto_757406 ?auto_757409 ) ( not ( = ?auto_757398 ?auto_757410 ) ) ( not ( = ?auto_757403 ?auto_757401 ) ) ( not ( = ?auto_757405 ?auto_757410 ) ) ( not ( = ?auto_757403 ?auto_757402 ) ) ( not ( = ?auto_757401 ?auto_757402 ) ) ( not ( = ?auto_757403 ?auto_757399 ) ) ( not ( = ?auto_757401 ?auto_757399 ) ) ( not ( = ?auto_757402 ?auto_757399 ) ) ( not ( = ?auto_757407 ?auto_757405 ) ) ( not ( = ?auto_757407 ?auto_757410 ) ) ( not ( = ?auto_757403 ?auto_757404 ) ) ( not ( = ?auto_757401 ?auto_757404 ) ) ( not ( = ?auto_757402 ?auto_757404 ) ) ( not ( = ?auto_757399 ?auto_757404 ) ) ( not ( = ?auto_757403 ?auto_757400 ) ) ( not ( = ?auto_757401 ?auto_757400 ) ) ( not ( = ?auto_757402 ?auto_757400 ) ) ( not ( = ?auto_757399 ?auto_757400 ) ) ( not ( = ?auto_757404 ?auto_757400 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_757403 ?auto_757401 ?auto_757402 ?auto_757399 ?auto_757400 ?auto_757404 ?auto_757398 )
      ( FLY-6PPL-VERIFY ?auto_757399 ?auto_757400 ?auto_757401 ?auto_757402 ?auto_757403 ?auto_757404 ?auto_757398 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_757690 - PERSON
      ?auto_757691 - PERSON
      ?auto_757692 - PERSON
      ?auto_757693 - PERSON
      ?auto_757694 - PERSON
      ?auto_757695 - PERSON
      ?auto_757689 - CITY
    )
    :vars
    (
      ?auto_757700 - FLEVEL
      ?auto_757699 - FLEVEL
      ?auto_757698 - CITY
      ?auto_757696 - CITY
      ?auto_757701 - CITY
      ?auto_757697 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_757700 ?auto_757699 ) ( PERSON-AT ?auto_757691 ?auto_757698 ) ( not ( = ?auto_757689 ?auto_757698 ) ) ( not ( = ?auto_757700 ?auto_757699 ) ) ( PERSON-AT ?auto_757694 ?auto_757696 ) ( not ( = ?auto_757689 ?auto_757696 ) ) ( PERSON-AT ?auto_757690 ?auto_757698 ) ( PERSON-AT ?auto_757693 ?auto_757696 ) ( PERSON-AT ?auto_757692 ?auto_757696 ) ( PERSON-AT ?auto_757695 ?auto_757701 ) ( AIRCRAFT-AT ?auto_757697 ?auto_757689 ) ( FUEL-LEVEL ?auto_757697 ?auto_757700 ) ( not ( = ?auto_757689 ?auto_757701 ) ) ( not ( = ?auto_757695 ?auto_757692 ) ) ( not ( = ?auto_757696 ?auto_757701 ) ) ( not ( = ?auto_757695 ?auto_757693 ) ) ( not ( = ?auto_757692 ?auto_757693 ) ) ( not ( = ?auto_757695 ?auto_757690 ) ) ( not ( = ?auto_757692 ?auto_757690 ) ) ( not ( = ?auto_757693 ?auto_757690 ) ) ( not ( = ?auto_757698 ?auto_757696 ) ) ( not ( = ?auto_757698 ?auto_757701 ) ) ( not ( = ?auto_757695 ?auto_757694 ) ) ( not ( = ?auto_757692 ?auto_757694 ) ) ( not ( = ?auto_757693 ?auto_757694 ) ) ( not ( = ?auto_757690 ?auto_757694 ) ) ( not ( = ?auto_757695 ?auto_757691 ) ) ( not ( = ?auto_757692 ?auto_757691 ) ) ( not ( = ?auto_757693 ?auto_757691 ) ) ( not ( = ?auto_757690 ?auto_757691 ) ) ( not ( = ?auto_757694 ?auto_757691 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_757695 ?auto_757692 ?auto_757693 ?auto_757690 ?auto_757691 ?auto_757694 ?auto_757689 )
      ( FLY-6PPL-VERIFY ?auto_757690 ?auto_757691 ?auto_757692 ?auto_757693 ?auto_757694 ?auto_757695 ?auto_757689 ) )
  )

)

