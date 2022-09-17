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

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_149792 - PERSON
      ?auto_149791 - CITY
    )
    :vars
    (
      ?auto_149795 - FLEVEL
      ?auto_149794 - FLEVEL
      ?auto_149796 - CITY
      ?auto_149793 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_149795 ?auto_149794 ) ( PERSON-AT ?auto_149792 ?auto_149796 ) ( AIRCRAFT-AT ?auto_149793 ?auto_149791 ) ( FUEL-LEVEL ?auto_149793 ?auto_149795 ) ( not ( = ?auto_149791 ?auto_149796 ) ) ( not ( = ?auto_149795 ?auto_149794 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_149793 ?auto_149791 ?auto_149795 ?auto_149794 )
      ( !FLY ?auto_149793 ?auto_149791 ?auto_149796 ?auto_149794 ?auto_149795 )
      ( !REFUEL ?auto_149793 ?auto_149796 ?auto_149795 ?auto_149794 )
      ( !BOARD ?auto_149792 ?auto_149793 ?auto_149796 )
      ( !FLY ?auto_149793 ?auto_149796 ?auto_149791 ?auto_149794 ?auto_149795 )
      ( !DEBARK ?auto_149792 ?auto_149793 ?auto_149791 )
      ( FLY-1PPL-VERIFY ?auto_149792 ?auto_149791 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_149815 - PERSON
      ?auto_149816 - PERSON
      ?auto_149814 - CITY
    )
    :vars
    (
      ?auto_149818 - FLEVEL
      ?auto_149819 - FLEVEL
      ?auto_149820 - CITY
      ?auto_149821 - CITY
      ?auto_149817 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_149818 ?auto_149819 ) ( PERSON-AT ?auto_149816 ?auto_149820 ) ( not ( = ?auto_149814 ?auto_149820 ) ) ( not ( = ?auto_149818 ?auto_149819 ) ) ( PERSON-AT ?auto_149815 ?auto_149821 ) ( AIRCRAFT-AT ?auto_149817 ?auto_149814 ) ( FUEL-LEVEL ?auto_149817 ?auto_149818 ) ( not ( = ?auto_149814 ?auto_149821 ) ) ( not ( = ?auto_149815 ?auto_149816 ) ) ( not ( = ?auto_149820 ?auto_149821 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_149815 ?auto_149814 )
      ( FLY-1PPL ?auto_149816 ?auto_149814 )
      ( FLY-2PPL-VERIFY ?auto_149815 ?auto_149816 ?auto_149814 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_149930 - PERSON
      ?auto_149931 - PERSON
      ?auto_149932 - PERSON
      ?auto_149929 - CITY
    )
    :vars
    (
      ?auto_149933 - FLEVEL
      ?auto_149936 - FLEVEL
      ?auto_149935 - CITY
      ?auto_149938 - CITY
      ?auto_149937 - CITY
      ?auto_149934 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_149933 ?auto_149936 ) ( PERSON-AT ?auto_149932 ?auto_149935 ) ( not ( = ?auto_149929 ?auto_149935 ) ) ( not ( = ?auto_149933 ?auto_149936 ) ) ( PERSON-AT ?auto_149931 ?auto_149938 ) ( not ( = ?auto_149929 ?auto_149938 ) ) ( PERSON-AT ?auto_149930 ?auto_149937 ) ( AIRCRAFT-AT ?auto_149934 ?auto_149929 ) ( FUEL-LEVEL ?auto_149934 ?auto_149933 ) ( not ( = ?auto_149929 ?auto_149937 ) ) ( not ( = ?auto_149930 ?auto_149931 ) ) ( not ( = ?auto_149938 ?auto_149937 ) ) ( not ( = ?auto_149930 ?auto_149932 ) ) ( not ( = ?auto_149931 ?auto_149932 ) ) ( not ( = ?auto_149935 ?auto_149938 ) ) ( not ( = ?auto_149935 ?auto_149937 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_149930 ?auto_149931 ?auto_149929 )
      ( FLY-1PPL ?auto_149932 ?auto_149929 )
      ( FLY-3PPL-VERIFY ?auto_149930 ?auto_149931 ?auto_149932 ?auto_149929 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_151096 - PERSON
      ?auto_151097 - PERSON
      ?auto_151098 - PERSON
      ?auto_151099 - PERSON
      ?auto_151095 - CITY
    )
    :vars
    (
      ?auto_151103 - FLEVEL
      ?auto_151102 - FLEVEL
      ?auto_151101 - CITY
      ?auto_151104 - CITY
      ?auto_151105 - CITY
      ?auto_151106 - CITY
      ?auto_151100 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_151103 ?auto_151102 ) ( PERSON-AT ?auto_151099 ?auto_151101 ) ( not ( = ?auto_151095 ?auto_151101 ) ) ( not ( = ?auto_151103 ?auto_151102 ) ) ( PERSON-AT ?auto_151098 ?auto_151104 ) ( not ( = ?auto_151095 ?auto_151104 ) ) ( PERSON-AT ?auto_151097 ?auto_151105 ) ( not ( = ?auto_151095 ?auto_151105 ) ) ( PERSON-AT ?auto_151096 ?auto_151106 ) ( AIRCRAFT-AT ?auto_151100 ?auto_151095 ) ( FUEL-LEVEL ?auto_151100 ?auto_151103 ) ( not ( = ?auto_151095 ?auto_151106 ) ) ( not ( = ?auto_151096 ?auto_151097 ) ) ( not ( = ?auto_151105 ?auto_151106 ) ) ( not ( = ?auto_151096 ?auto_151098 ) ) ( not ( = ?auto_151097 ?auto_151098 ) ) ( not ( = ?auto_151104 ?auto_151105 ) ) ( not ( = ?auto_151104 ?auto_151106 ) ) ( not ( = ?auto_151096 ?auto_151099 ) ) ( not ( = ?auto_151097 ?auto_151099 ) ) ( not ( = ?auto_151098 ?auto_151099 ) ) ( not ( = ?auto_151101 ?auto_151104 ) ) ( not ( = ?auto_151101 ?auto_151105 ) ) ( not ( = ?auto_151101 ?auto_151106 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_151096 ?auto_151097 ?auto_151098 ?auto_151095 )
      ( FLY-1PPL ?auto_151099 ?auto_151095 )
      ( FLY-4PPL-VERIFY ?auto_151096 ?auto_151097 ?auto_151098 ?auto_151099 ?auto_151095 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_166932 - PERSON
      ?auto_166933 - PERSON
      ?auto_166934 - PERSON
      ?auto_166935 - PERSON
      ?auto_166936 - PERSON
      ?auto_166931 - CITY
    )
    :vars
    (
      ?auto_166938 - FLEVEL
      ?auto_166937 - FLEVEL
      ?auto_166939 - CITY
      ?auto_166941 - CITY
      ?auto_166943 - CITY
      ?auto_166942 - CITY
      ?auto_166940 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_166938 ?auto_166937 ) ( PERSON-AT ?auto_166936 ?auto_166939 ) ( not ( = ?auto_166931 ?auto_166939 ) ) ( not ( = ?auto_166938 ?auto_166937 ) ) ( PERSON-AT ?auto_166935 ?auto_166939 ) ( PERSON-AT ?auto_166934 ?auto_166941 ) ( not ( = ?auto_166931 ?auto_166941 ) ) ( PERSON-AT ?auto_166933 ?auto_166943 ) ( not ( = ?auto_166931 ?auto_166943 ) ) ( PERSON-AT ?auto_166932 ?auto_166942 ) ( AIRCRAFT-AT ?auto_166940 ?auto_166931 ) ( FUEL-LEVEL ?auto_166940 ?auto_166938 ) ( not ( = ?auto_166931 ?auto_166942 ) ) ( not ( = ?auto_166932 ?auto_166933 ) ) ( not ( = ?auto_166943 ?auto_166942 ) ) ( not ( = ?auto_166932 ?auto_166934 ) ) ( not ( = ?auto_166933 ?auto_166934 ) ) ( not ( = ?auto_166941 ?auto_166943 ) ) ( not ( = ?auto_166941 ?auto_166942 ) ) ( not ( = ?auto_166932 ?auto_166935 ) ) ( not ( = ?auto_166933 ?auto_166935 ) ) ( not ( = ?auto_166934 ?auto_166935 ) ) ( not ( = ?auto_166939 ?auto_166941 ) ) ( not ( = ?auto_166939 ?auto_166943 ) ) ( not ( = ?auto_166939 ?auto_166942 ) ) ( not ( = ?auto_166932 ?auto_166936 ) ) ( not ( = ?auto_166933 ?auto_166936 ) ) ( not ( = ?auto_166934 ?auto_166936 ) ) ( not ( = ?auto_166935 ?auto_166936 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_166932 ?auto_166933 ?auto_166934 ?auto_166935 ?auto_166931 )
      ( FLY-1PPL ?auto_166936 ?auto_166931 )
      ( FLY-5PPL-VERIFY ?auto_166932 ?auto_166933 ?auto_166934 ?auto_166935 ?auto_166936 ?auto_166931 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_167035 - PERSON
      ?auto_167036 - PERSON
      ?auto_167037 - PERSON
      ?auto_167038 - PERSON
      ?auto_167039 - PERSON
      ?auto_167034 - CITY
    )
    :vars
    (
      ?auto_167040 - FLEVEL
      ?auto_167042 - FLEVEL
      ?auto_167044 - CITY
      ?auto_167041 - CITY
      ?auto_167046 - CITY
      ?auto_167045 - CITY
      ?auto_167043 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_167040 ?auto_167042 ) ( PERSON-AT ?auto_167039 ?auto_167044 ) ( not ( = ?auto_167034 ?auto_167044 ) ) ( not ( = ?auto_167040 ?auto_167042 ) ) ( PERSON-AT ?auto_167037 ?auto_167044 ) ( PERSON-AT ?auto_167038 ?auto_167041 ) ( not ( = ?auto_167034 ?auto_167041 ) ) ( PERSON-AT ?auto_167036 ?auto_167046 ) ( not ( = ?auto_167034 ?auto_167046 ) ) ( PERSON-AT ?auto_167035 ?auto_167045 ) ( AIRCRAFT-AT ?auto_167043 ?auto_167034 ) ( FUEL-LEVEL ?auto_167043 ?auto_167040 ) ( not ( = ?auto_167034 ?auto_167045 ) ) ( not ( = ?auto_167035 ?auto_167036 ) ) ( not ( = ?auto_167046 ?auto_167045 ) ) ( not ( = ?auto_167035 ?auto_167038 ) ) ( not ( = ?auto_167036 ?auto_167038 ) ) ( not ( = ?auto_167041 ?auto_167046 ) ) ( not ( = ?auto_167041 ?auto_167045 ) ) ( not ( = ?auto_167035 ?auto_167037 ) ) ( not ( = ?auto_167036 ?auto_167037 ) ) ( not ( = ?auto_167038 ?auto_167037 ) ) ( not ( = ?auto_167044 ?auto_167041 ) ) ( not ( = ?auto_167044 ?auto_167046 ) ) ( not ( = ?auto_167044 ?auto_167045 ) ) ( not ( = ?auto_167035 ?auto_167039 ) ) ( not ( = ?auto_167036 ?auto_167039 ) ) ( not ( = ?auto_167038 ?auto_167039 ) ) ( not ( = ?auto_167037 ?auto_167039 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_167035 ?auto_167036 ?auto_167038 ?auto_167037 ?auto_167039 ?auto_167034 )
      ( FLY-5PPL-VERIFY ?auto_167035 ?auto_167036 ?auto_167037 ?auto_167038 ?auto_167039 ?auto_167034 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_167090 - PERSON
      ?auto_167091 - PERSON
      ?auto_167092 - PERSON
      ?auto_167093 - PERSON
      ?auto_167094 - PERSON
      ?auto_167089 - CITY
    )
    :vars
    (
      ?auto_167099 - FLEVEL
      ?auto_167100 - FLEVEL
      ?auto_167101 - CITY
      ?auto_167097 - CITY
      ?auto_167095 - CITY
      ?auto_167096 - CITY
      ?auto_167098 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_167099 ?auto_167100 ) ( PERSON-AT ?auto_167093 ?auto_167101 ) ( not ( = ?auto_167089 ?auto_167101 ) ) ( not ( = ?auto_167099 ?auto_167100 ) ) ( PERSON-AT ?auto_167092 ?auto_167101 ) ( PERSON-AT ?auto_167094 ?auto_167097 ) ( not ( = ?auto_167089 ?auto_167097 ) ) ( PERSON-AT ?auto_167091 ?auto_167095 ) ( not ( = ?auto_167089 ?auto_167095 ) ) ( PERSON-AT ?auto_167090 ?auto_167096 ) ( AIRCRAFT-AT ?auto_167098 ?auto_167089 ) ( FUEL-LEVEL ?auto_167098 ?auto_167099 ) ( not ( = ?auto_167089 ?auto_167096 ) ) ( not ( = ?auto_167090 ?auto_167091 ) ) ( not ( = ?auto_167095 ?auto_167096 ) ) ( not ( = ?auto_167090 ?auto_167094 ) ) ( not ( = ?auto_167091 ?auto_167094 ) ) ( not ( = ?auto_167097 ?auto_167095 ) ) ( not ( = ?auto_167097 ?auto_167096 ) ) ( not ( = ?auto_167090 ?auto_167092 ) ) ( not ( = ?auto_167091 ?auto_167092 ) ) ( not ( = ?auto_167094 ?auto_167092 ) ) ( not ( = ?auto_167101 ?auto_167097 ) ) ( not ( = ?auto_167101 ?auto_167095 ) ) ( not ( = ?auto_167101 ?auto_167096 ) ) ( not ( = ?auto_167090 ?auto_167093 ) ) ( not ( = ?auto_167091 ?auto_167093 ) ) ( not ( = ?auto_167094 ?auto_167093 ) ) ( not ( = ?auto_167092 ?auto_167093 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_167090 ?auto_167091 ?auto_167092 ?auto_167094 ?auto_167093 ?auto_167089 )
      ( FLY-5PPL-VERIFY ?auto_167090 ?auto_167091 ?auto_167092 ?auto_167093 ?auto_167094 ?auto_167089 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_168458 - PERSON
      ?auto_168459 - PERSON
      ?auto_168460 - PERSON
      ?auto_168461 - PERSON
      ?auto_168462 - PERSON
      ?auto_168457 - CITY
    )
    :vars
    (
      ?auto_168467 - FLEVEL
      ?auto_168468 - FLEVEL
      ?auto_168469 - CITY
      ?auto_168465 - CITY
      ?auto_168463 - CITY
      ?auto_168464 - CITY
      ?auto_168466 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_168467 ?auto_168468 ) ( PERSON-AT ?auto_168462 ?auto_168469 ) ( not ( = ?auto_168457 ?auto_168469 ) ) ( not ( = ?auto_168467 ?auto_168468 ) ) ( PERSON-AT ?auto_168459 ?auto_168469 ) ( PERSON-AT ?auto_168461 ?auto_168465 ) ( not ( = ?auto_168457 ?auto_168465 ) ) ( PERSON-AT ?auto_168460 ?auto_168463 ) ( not ( = ?auto_168457 ?auto_168463 ) ) ( PERSON-AT ?auto_168458 ?auto_168464 ) ( AIRCRAFT-AT ?auto_168466 ?auto_168457 ) ( FUEL-LEVEL ?auto_168466 ?auto_168467 ) ( not ( = ?auto_168457 ?auto_168464 ) ) ( not ( = ?auto_168458 ?auto_168460 ) ) ( not ( = ?auto_168463 ?auto_168464 ) ) ( not ( = ?auto_168458 ?auto_168461 ) ) ( not ( = ?auto_168460 ?auto_168461 ) ) ( not ( = ?auto_168465 ?auto_168463 ) ) ( not ( = ?auto_168465 ?auto_168464 ) ) ( not ( = ?auto_168458 ?auto_168459 ) ) ( not ( = ?auto_168460 ?auto_168459 ) ) ( not ( = ?auto_168461 ?auto_168459 ) ) ( not ( = ?auto_168469 ?auto_168465 ) ) ( not ( = ?auto_168469 ?auto_168463 ) ) ( not ( = ?auto_168469 ?auto_168464 ) ) ( not ( = ?auto_168458 ?auto_168462 ) ) ( not ( = ?auto_168460 ?auto_168462 ) ) ( not ( = ?auto_168461 ?auto_168462 ) ) ( not ( = ?auto_168459 ?auto_168462 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_168458 ?auto_168460 ?auto_168459 ?auto_168461 ?auto_168462 ?auto_168457 )
      ( FLY-5PPL-VERIFY ?auto_168458 ?auto_168459 ?auto_168460 ?auto_168461 ?auto_168462 ?auto_168457 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_168513 - PERSON
      ?auto_168514 - PERSON
      ?auto_168515 - PERSON
      ?auto_168516 - PERSON
      ?auto_168517 - PERSON
      ?auto_168512 - CITY
    )
    :vars
    (
      ?auto_168522 - FLEVEL
      ?auto_168523 - FLEVEL
      ?auto_168524 - CITY
      ?auto_168520 - CITY
      ?auto_168518 - CITY
      ?auto_168519 - CITY
      ?auto_168521 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_168522 ?auto_168523 ) ( PERSON-AT ?auto_168516 ?auto_168524 ) ( not ( = ?auto_168512 ?auto_168524 ) ) ( not ( = ?auto_168522 ?auto_168523 ) ) ( PERSON-AT ?auto_168514 ?auto_168524 ) ( PERSON-AT ?auto_168517 ?auto_168520 ) ( not ( = ?auto_168512 ?auto_168520 ) ) ( PERSON-AT ?auto_168515 ?auto_168518 ) ( not ( = ?auto_168512 ?auto_168518 ) ) ( PERSON-AT ?auto_168513 ?auto_168519 ) ( AIRCRAFT-AT ?auto_168521 ?auto_168512 ) ( FUEL-LEVEL ?auto_168521 ?auto_168522 ) ( not ( = ?auto_168512 ?auto_168519 ) ) ( not ( = ?auto_168513 ?auto_168515 ) ) ( not ( = ?auto_168518 ?auto_168519 ) ) ( not ( = ?auto_168513 ?auto_168517 ) ) ( not ( = ?auto_168515 ?auto_168517 ) ) ( not ( = ?auto_168520 ?auto_168518 ) ) ( not ( = ?auto_168520 ?auto_168519 ) ) ( not ( = ?auto_168513 ?auto_168514 ) ) ( not ( = ?auto_168515 ?auto_168514 ) ) ( not ( = ?auto_168517 ?auto_168514 ) ) ( not ( = ?auto_168524 ?auto_168520 ) ) ( not ( = ?auto_168524 ?auto_168518 ) ) ( not ( = ?auto_168524 ?auto_168519 ) ) ( not ( = ?auto_168513 ?auto_168516 ) ) ( not ( = ?auto_168515 ?auto_168516 ) ) ( not ( = ?auto_168517 ?auto_168516 ) ) ( not ( = ?auto_168514 ?auto_168516 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_168513 ?auto_168515 ?auto_168514 ?auto_168517 ?auto_168516 ?auto_168512 )
      ( FLY-5PPL-VERIFY ?auto_168513 ?auto_168514 ?auto_168515 ?auto_168516 ?auto_168517 ?auto_168512 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_168896 - PERSON
      ?auto_168897 - PERSON
      ?auto_168898 - PERSON
      ?auto_168899 - PERSON
      ?auto_168900 - PERSON
      ?auto_168895 - CITY
    )
    :vars
    (
      ?auto_168905 - FLEVEL
      ?auto_168906 - FLEVEL
      ?auto_168907 - CITY
      ?auto_168903 - CITY
      ?auto_168901 - CITY
      ?auto_168902 - CITY
      ?auto_168904 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_168905 ?auto_168906 ) ( PERSON-AT ?auto_168898 ?auto_168907 ) ( not ( = ?auto_168895 ?auto_168907 ) ) ( not ( = ?auto_168905 ?auto_168906 ) ) ( PERSON-AT ?auto_168897 ?auto_168907 ) ( PERSON-AT ?auto_168900 ?auto_168903 ) ( not ( = ?auto_168895 ?auto_168903 ) ) ( PERSON-AT ?auto_168899 ?auto_168901 ) ( not ( = ?auto_168895 ?auto_168901 ) ) ( PERSON-AT ?auto_168896 ?auto_168902 ) ( AIRCRAFT-AT ?auto_168904 ?auto_168895 ) ( FUEL-LEVEL ?auto_168904 ?auto_168905 ) ( not ( = ?auto_168895 ?auto_168902 ) ) ( not ( = ?auto_168896 ?auto_168899 ) ) ( not ( = ?auto_168901 ?auto_168902 ) ) ( not ( = ?auto_168896 ?auto_168900 ) ) ( not ( = ?auto_168899 ?auto_168900 ) ) ( not ( = ?auto_168903 ?auto_168901 ) ) ( not ( = ?auto_168903 ?auto_168902 ) ) ( not ( = ?auto_168896 ?auto_168897 ) ) ( not ( = ?auto_168899 ?auto_168897 ) ) ( not ( = ?auto_168900 ?auto_168897 ) ) ( not ( = ?auto_168907 ?auto_168903 ) ) ( not ( = ?auto_168907 ?auto_168901 ) ) ( not ( = ?auto_168907 ?auto_168902 ) ) ( not ( = ?auto_168896 ?auto_168898 ) ) ( not ( = ?auto_168899 ?auto_168898 ) ) ( not ( = ?auto_168900 ?auto_168898 ) ) ( not ( = ?auto_168897 ?auto_168898 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_168896 ?auto_168899 ?auto_168897 ?auto_168900 ?auto_168898 ?auto_168895 )
      ( FLY-5PPL-VERIFY ?auto_168896 ?auto_168897 ?auto_168898 ?auto_168899 ?auto_168900 ?auto_168895 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_181387 - PERSON
      ?auto_181388 - PERSON
      ?auto_181389 - PERSON
      ?auto_181390 - PERSON
      ?auto_181391 - PERSON
      ?auto_181386 - CITY
    )
    :vars
    (
      ?auto_181396 - FLEVEL
      ?auto_181397 - FLEVEL
      ?auto_181398 - CITY
      ?auto_181394 - CITY
      ?auto_181392 - CITY
      ?auto_181393 - CITY
      ?auto_181395 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_181396 ?auto_181397 ) ( PERSON-AT ?auto_181391 ?auto_181398 ) ( not ( = ?auto_181386 ?auto_181398 ) ) ( not ( = ?auto_181396 ?auto_181397 ) ) ( PERSON-AT ?auto_181387 ?auto_181398 ) ( PERSON-AT ?auto_181390 ?auto_181394 ) ( not ( = ?auto_181386 ?auto_181394 ) ) ( PERSON-AT ?auto_181389 ?auto_181392 ) ( not ( = ?auto_181386 ?auto_181392 ) ) ( PERSON-AT ?auto_181388 ?auto_181393 ) ( AIRCRAFT-AT ?auto_181395 ?auto_181386 ) ( FUEL-LEVEL ?auto_181395 ?auto_181396 ) ( not ( = ?auto_181386 ?auto_181393 ) ) ( not ( = ?auto_181388 ?auto_181389 ) ) ( not ( = ?auto_181392 ?auto_181393 ) ) ( not ( = ?auto_181388 ?auto_181390 ) ) ( not ( = ?auto_181389 ?auto_181390 ) ) ( not ( = ?auto_181394 ?auto_181392 ) ) ( not ( = ?auto_181394 ?auto_181393 ) ) ( not ( = ?auto_181388 ?auto_181387 ) ) ( not ( = ?auto_181389 ?auto_181387 ) ) ( not ( = ?auto_181390 ?auto_181387 ) ) ( not ( = ?auto_181398 ?auto_181394 ) ) ( not ( = ?auto_181398 ?auto_181392 ) ) ( not ( = ?auto_181398 ?auto_181393 ) ) ( not ( = ?auto_181388 ?auto_181391 ) ) ( not ( = ?auto_181389 ?auto_181391 ) ) ( not ( = ?auto_181390 ?auto_181391 ) ) ( not ( = ?auto_181387 ?auto_181391 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_181388 ?auto_181389 ?auto_181387 ?auto_181390 ?auto_181391 ?auto_181386 )
      ( FLY-5PPL-VERIFY ?auto_181387 ?auto_181388 ?auto_181389 ?auto_181390 ?auto_181391 ?auto_181386 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_181442 - PERSON
      ?auto_181443 - PERSON
      ?auto_181444 - PERSON
      ?auto_181445 - PERSON
      ?auto_181446 - PERSON
      ?auto_181441 - CITY
    )
    :vars
    (
      ?auto_181451 - FLEVEL
      ?auto_181452 - FLEVEL
      ?auto_181453 - CITY
      ?auto_181449 - CITY
      ?auto_181447 - CITY
      ?auto_181448 - CITY
      ?auto_181450 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_181451 ?auto_181452 ) ( PERSON-AT ?auto_181445 ?auto_181453 ) ( not ( = ?auto_181441 ?auto_181453 ) ) ( not ( = ?auto_181451 ?auto_181452 ) ) ( PERSON-AT ?auto_181442 ?auto_181453 ) ( PERSON-AT ?auto_181446 ?auto_181449 ) ( not ( = ?auto_181441 ?auto_181449 ) ) ( PERSON-AT ?auto_181444 ?auto_181447 ) ( not ( = ?auto_181441 ?auto_181447 ) ) ( PERSON-AT ?auto_181443 ?auto_181448 ) ( AIRCRAFT-AT ?auto_181450 ?auto_181441 ) ( FUEL-LEVEL ?auto_181450 ?auto_181451 ) ( not ( = ?auto_181441 ?auto_181448 ) ) ( not ( = ?auto_181443 ?auto_181444 ) ) ( not ( = ?auto_181447 ?auto_181448 ) ) ( not ( = ?auto_181443 ?auto_181446 ) ) ( not ( = ?auto_181444 ?auto_181446 ) ) ( not ( = ?auto_181449 ?auto_181447 ) ) ( not ( = ?auto_181449 ?auto_181448 ) ) ( not ( = ?auto_181443 ?auto_181442 ) ) ( not ( = ?auto_181444 ?auto_181442 ) ) ( not ( = ?auto_181446 ?auto_181442 ) ) ( not ( = ?auto_181453 ?auto_181449 ) ) ( not ( = ?auto_181453 ?auto_181447 ) ) ( not ( = ?auto_181453 ?auto_181448 ) ) ( not ( = ?auto_181443 ?auto_181445 ) ) ( not ( = ?auto_181444 ?auto_181445 ) ) ( not ( = ?auto_181446 ?auto_181445 ) ) ( not ( = ?auto_181442 ?auto_181445 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_181443 ?auto_181444 ?auto_181442 ?auto_181446 ?auto_181445 ?auto_181441 )
      ( FLY-5PPL-VERIFY ?auto_181442 ?auto_181443 ?auto_181444 ?auto_181445 ?auto_181446 ?auto_181441 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_181825 - PERSON
      ?auto_181826 - PERSON
      ?auto_181827 - PERSON
      ?auto_181828 - PERSON
      ?auto_181829 - PERSON
      ?auto_181824 - CITY
    )
    :vars
    (
      ?auto_181834 - FLEVEL
      ?auto_181835 - FLEVEL
      ?auto_181836 - CITY
      ?auto_181832 - CITY
      ?auto_181830 - CITY
      ?auto_181831 - CITY
      ?auto_181833 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_181834 ?auto_181835 ) ( PERSON-AT ?auto_181827 ?auto_181836 ) ( not ( = ?auto_181824 ?auto_181836 ) ) ( not ( = ?auto_181834 ?auto_181835 ) ) ( PERSON-AT ?auto_181825 ?auto_181836 ) ( PERSON-AT ?auto_181829 ?auto_181832 ) ( not ( = ?auto_181824 ?auto_181832 ) ) ( PERSON-AT ?auto_181828 ?auto_181830 ) ( not ( = ?auto_181824 ?auto_181830 ) ) ( PERSON-AT ?auto_181826 ?auto_181831 ) ( AIRCRAFT-AT ?auto_181833 ?auto_181824 ) ( FUEL-LEVEL ?auto_181833 ?auto_181834 ) ( not ( = ?auto_181824 ?auto_181831 ) ) ( not ( = ?auto_181826 ?auto_181828 ) ) ( not ( = ?auto_181830 ?auto_181831 ) ) ( not ( = ?auto_181826 ?auto_181829 ) ) ( not ( = ?auto_181828 ?auto_181829 ) ) ( not ( = ?auto_181832 ?auto_181830 ) ) ( not ( = ?auto_181832 ?auto_181831 ) ) ( not ( = ?auto_181826 ?auto_181825 ) ) ( not ( = ?auto_181828 ?auto_181825 ) ) ( not ( = ?auto_181829 ?auto_181825 ) ) ( not ( = ?auto_181836 ?auto_181832 ) ) ( not ( = ?auto_181836 ?auto_181830 ) ) ( not ( = ?auto_181836 ?auto_181831 ) ) ( not ( = ?auto_181826 ?auto_181827 ) ) ( not ( = ?auto_181828 ?auto_181827 ) ) ( not ( = ?auto_181829 ?auto_181827 ) ) ( not ( = ?auto_181825 ?auto_181827 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_181826 ?auto_181828 ?auto_181825 ?auto_181829 ?auto_181827 ?auto_181824 )
      ( FLY-5PPL-VERIFY ?auto_181825 ?auto_181826 ?auto_181827 ?auto_181828 ?auto_181829 ?auto_181824 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_184729 - PERSON
      ?auto_184730 - PERSON
      ?auto_184731 - PERSON
      ?auto_184732 - PERSON
      ?auto_184733 - PERSON
      ?auto_184728 - CITY
    )
    :vars
    (
      ?auto_184738 - FLEVEL
      ?auto_184739 - FLEVEL
      ?auto_184740 - CITY
      ?auto_184736 - CITY
      ?auto_184734 - CITY
      ?auto_184735 - CITY
      ?auto_184737 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_184738 ?auto_184739 ) ( PERSON-AT ?auto_184730 ?auto_184740 ) ( not ( = ?auto_184728 ?auto_184740 ) ) ( not ( = ?auto_184738 ?auto_184739 ) ) ( PERSON-AT ?auto_184729 ?auto_184740 ) ( PERSON-AT ?auto_184733 ?auto_184736 ) ( not ( = ?auto_184728 ?auto_184736 ) ) ( PERSON-AT ?auto_184732 ?auto_184734 ) ( not ( = ?auto_184728 ?auto_184734 ) ) ( PERSON-AT ?auto_184731 ?auto_184735 ) ( AIRCRAFT-AT ?auto_184737 ?auto_184728 ) ( FUEL-LEVEL ?auto_184737 ?auto_184738 ) ( not ( = ?auto_184728 ?auto_184735 ) ) ( not ( = ?auto_184731 ?auto_184732 ) ) ( not ( = ?auto_184734 ?auto_184735 ) ) ( not ( = ?auto_184731 ?auto_184733 ) ) ( not ( = ?auto_184732 ?auto_184733 ) ) ( not ( = ?auto_184736 ?auto_184734 ) ) ( not ( = ?auto_184736 ?auto_184735 ) ) ( not ( = ?auto_184731 ?auto_184729 ) ) ( not ( = ?auto_184732 ?auto_184729 ) ) ( not ( = ?auto_184733 ?auto_184729 ) ) ( not ( = ?auto_184740 ?auto_184736 ) ) ( not ( = ?auto_184740 ?auto_184734 ) ) ( not ( = ?auto_184740 ?auto_184735 ) ) ( not ( = ?auto_184731 ?auto_184730 ) ) ( not ( = ?auto_184732 ?auto_184730 ) ) ( not ( = ?auto_184733 ?auto_184730 ) ) ( not ( = ?auto_184729 ?auto_184730 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_184731 ?auto_184732 ?auto_184729 ?auto_184733 ?auto_184730 ?auto_184728 )
      ( FLY-5PPL-VERIFY ?auto_184729 ?auto_184730 ?auto_184731 ?auto_184732 ?auto_184733 ?auto_184728 ) )
  )

)

