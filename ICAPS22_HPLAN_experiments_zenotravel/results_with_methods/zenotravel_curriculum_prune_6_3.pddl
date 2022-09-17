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
      ?auto_2424516 - PERSON
      ?auto_2424515 - CITY
    )
    :vars
    (
      ?auto_2424519 - FLEVEL
      ?auto_2424518 - FLEVEL
      ?auto_2424520 - CITY
      ?auto_2424517 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2424519 ?auto_2424518 ) ( PERSON-AT ?auto_2424516 ?auto_2424520 ) ( AIRCRAFT-AT ?auto_2424517 ?auto_2424515 ) ( FUEL-LEVEL ?auto_2424517 ?auto_2424519 ) ( not ( = ?auto_2424515 ?auto_2424520 ) ) ( not ( = ?auto_2424519 ?auto_2424518 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_2424517 ?auto_2424515 ?auto_2424519 ?auto_2424518 )
      ( !FLY ?auto_2424517 ?auto_2424515 ?auto_2424520 ?auto_2424518 ?auto_2424519 )
      ( !REFUEL ?auto_2424517 ?auto_2424520 ?auto_2424519 ?auto_2424518 )
      ( !BOARD ?auto_2424516 ?auto_2424517 ?auto_2424520 )
      ( !FLY ?auto_2424517 ?auto_2424520 ?auto_2424515 ?auto_2424518 ?auto_2424519 )
      ( !DEBARK ?auto_2424516 ?auto_2424517 ?auto_2424515 )
      ( FLY-1PPL-VERIFY ?auto_2424516 ?auto_2424515 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2424539 - PERSON
      ?auto_2424540 - PERSON
      ?auto_2424538 - CITY
    )
    :vars
    (
      ?auto_2424541 - FLEVEL
      ?auto_2424543 - FLEVEL
      ?auto_2424542 - CITY
      ?auto_2424545 - CITY
      ?auto_2424544 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2424541 ?auto_2424543 ) ( PERSON-AT ?auto_2424540 ?auto_2424542 ) ( not ( = ?auto_2424538 ?auto_2424542 ) ) ( not ( = ?auto_2424541 ?auto_2424543 ) ) ( PERSON-AT ?auto_2424539 ?auto_2424545 ) ( AIRCRAFT-AT ?auto_2424544 ?auto_2424538 ) ( FUEL-LEVEL ?auto_2424544 ?auto_2424541 ) ( not ( = ?auto_2424538 ?auto_2424545 ) ) ( not ( = ?auto_2424539 ?auto_2424540 ) ) ( not ( = ?auto_2424542 ?auto_2424545 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2424539 ?auto_2424538 )
      ( FLY-1PPL ?auto_2424540 ?auto_2424538 )
      ( FLY-2PPL-VERIFY ?auto_2424539 ?auto_2424540 ?auto_2424538 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2424653 - PERSON
      ?auto_2424654 - PERSON
      ?auto_2424655 - PERSON
      ?auto_2424652 - CITY
    )
    :vars
    (
      ?auto_2424657 - FLEVEL
      ?auto_2424659 - FLEVEL
      ?auto_2424656 - CITY
      ?auto_2424660 - CITY
      ?auto_2424658 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2424657 ?auto_2424659 ) ( PERSON-AT ?auto_2424655 ?auto_2424656 ) ( not ( = ?auto_2424652 ?auto_2424656 ) ) ( not ( = ?auto_2424657 ?auto_2424659 ) ) ( PERSON-AT ?auto_2424654 ?auto_2424660 ) ( not ( = ?auto_2424652 ?auto_2424660 ) ) ( PERSON-AT ?auto_2424653 ?auto_2424656 ) ( AIRCRAFT-AT ?auto_2424658 ?auto_2424652 ) ( FUEL-LEVEL ?auto_2424658 ?auto_2424657 ) ( not ( = ?auto_2424653 ?auto_2424654 ) ) ( not ( = ?auto_2424660 ?auto_2424656 ) ) ( not ( = ?auto_2424653 ?auto_2424655 ) ) ( not ( = ?auto_2424654 ?auto_2424655 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2424653 ?auto_2424654 ?auto_2424652 )
      ( FLY-1PPL ?auto_2424655 ?auto_2424652 )
      ( FLY-3PPL-VERIFY ?auto_2424653 ?auto_2424654 ?auto_2424655 ?auto_2424652 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2424672 - PERSON
      ?auto_2424673 - PERSON
      ?auto_2424674 - PERSON
      ?auto_2424671 - CITY
    )
    :vars
    (
      ?auto_2424677 - FLEVEL
      ?auto_2424676 - FLEVEL
      ?auto_2424679 - CITY
      ?auto_2424675 - CITY
      ?auto_2424678 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2424677 ?auto_2424676 ) ( PERSON-AT ?auto_2424673 ?auto_2424679 ) ( not ( = ?auto_2424671 ?auto_2424679 ) ) ( not ( = ?auto_2424677 ?auto_2424676 ) ) ( PERSON-AT ?auto_2424674 ?auto_2424675 ) ( not ( = ?auto_2424671 ?auto_2424675 ) ) ( PERSON-AT ?auto_2424672 ?auto_2424679 ) ( AIRCRAFT-AT ?auto_2424678 ?auto_2424671 ) ( FUEL-LEVEL ?auto_2424678 ?auto_2424677 ) ( not ( = ?auto_2424672 ?auto_2424674 ) ) ( not ( = ?auto_2424675 ?auto_2424679 ) ) ( not ( = ?auto_2424672 ?auto_2424673 ) ) ( not ( = ?auto_2424674 ?auto_2424673 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_2424672 ?auto_2424674 ?auto_2424673 ?auto_2424671 )
      ( FLY-3PPL-VERIFY ?auto_2424672 ?auto_2424673 ?auto_2424674 ?auto_2424671 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2424691 - PERSON
      ?auto_2424692 - PERSON
      ?auto_2424693 - PERSON
      ?auto_2424690 - CITY
    )
    :vars
    (
      ?auto_2424695 - FLEVEL
      ?auto_2424698 - FLEVEL
      ?auto_2424696 - CITY
      ?auto_2424697 - CITY
      ?auto_2424694 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2424695 ?auto_2424698 ) ( PERSON-AT ?auto_2424693 ?auto_2424696 ) ( not ( = ?auto_2424690 ?auto_2424696 ) ) ( not ( = ?auto_2424695 ?auto_2424698 ) ) ( PERSON-AT ?auto_2424691 ?auto_2424697 ) ( not ( = ?auto_2424690 ?auto_2424697 ) ) ( PERSON-AT ?auto_2424692 ?auto_2424696 ) ( AIRCRAFT-AT ?auto_2424694 ?auto_2424690 ) ( FUEL-LEVEL ?auto_2424694 ?auto_2424695 ) ( not ( = ?auto_2424692 ?auto_2424691 ) ) ( not ( = ?auto_2424697 ?auto_2424696 ) ) ( not ( = ?auto_2424692 ?auto_2424693 ) ) ( not ( = ?auto_2424691 ?auto_2424693 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_2424692 ?auto_2424693 ?auto_2424691 ?auto_2424690 )
      ( FLY-3PPL-VERIFY ?auto_2424691 ?auto_2424692 ?auto_2424693 ?auto_2424690 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_2425807 - PERSON
      ?auto_2425808 - PERSON
      ?auto_2425809 - PERSON
      ?auto_2425810 - PERSON
      ?auto_2425806 - CITY
    )
    :vars
    (
      ?auto_2425814 - FLEVEL
      ?auto_2425811 - FLEVEL
      ?auto_2425813 - CITY
      ?auto_2425815 - CITY
      ?auto_2425816 - CITY
      ?auto_2425812 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2425814 ?auto_2425811 ) ( PERSON-AT ?auto_2425810 ?auto_2425813 ) ( not ( = ?auto_2425806 ?auto_2425813 ) ) ( not ( = ?auto_2425814 ?auto_2425811 ) ) ( PERSON-AT ?auto_2425809 ?auto_2425815 ) ( not ( = ?auto_2425806 ?auto_2425815 ) ) ( PERSON-AT ?auto_2425808 ?auto_2425816 ) ( not ( = ?auto_2425806 ?auto_2425816 ) ) ( PERSON-AT ?auto_2425807 ?auto_2425815 ) ( AIRCRAFT-AT ?auto_2425812 ?auto_2425806 ) ( FUEL-LEVEL ?auto_2425812 ?auto_2425814 ) ( not ( = ?auto_2425807 ?auto_2425808 ) ) ( not ( = ?auto_2425816 ?auto_2425815 ) ) ( not ( = ?auto_2425807 ?auto_2425809 ) ) ( not ( = ?auto_2425808 ?auto_2425809 ) ) ( not ( = ?auto_2425807 ?auto_2425810 ) ) ( not ( = ?auto_2425808 ?auto_2425810 ) ) ( not ( = ?auto_2425809 ?auto_2425810 ) ) ( not ( = ?auto_2425813 ?auto_2425815 ) ) ( not ( = ?auto_2425813 ?auto_2425816 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_2425807 ?auto_2425809 ?auto_2425808 ?auto_2425806 )
      ( FLY-1PPL ?auto_2425810 ?auto_2425806 )
      ( FLY-4PPL-VERIFY ?auto_2425807 ?auto_2425808 ?auto_2425809 ?auto_2425810 ?auto_2425806 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_2425842 - PERSON
      ?auto_2425843 - PERSON
      ?auto_2425844 - PERSON
      ?auto_2425845 - PERSON
      ?auto_2425841 - CITY
    )
    :vars
    (
      ?auto_2425850 - FLEVEL
      ?auto_2425848 - FLEVEL
      ?auto_2425851 - CITY
      ?auto_2425847 - CITY
      ?auto_2425849 - CITY
      ?auto_2425846 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2425850 ?auto_2425848 ) ( PERSON-AT ?auto_2425844 ?auto_2425851 ) ( not ( = ?auto_2425841 ?auto_2425851 ) ) ( not ( = ?auto_2425850 ?auto_2425848 ) ) ( PERSON-AT ?auto_2425845 ?auto_2425847 ) ( not ( = ?auto_2425841 ?auto_2425847 ) ) ( PERSON-AT ?auto_2425843 ?auto_2425849 ) ( not ( = ?auto_2425841 ?auto_2425849 ) ) ( PERSON-AT ?auto_2425842 ?auto_2425847 ) ( AIRCRAFT-AT ?auto_2425846 ?auto_2425841 ) ( FUEL-LEVEL ?auto_2425846 ?auto_2425850 ) ( not ( = ?auto_2425842 ?auto_2425843 ) ) ( not ( = ?auto_2425849 ?auto_2425847 ) ) ( not ( = ?auto_2425842 ?auto_2425845 ) ) ( not ( = ?auto_2425843 ?auto_2425845 ) ) ( not ( = ?auto_2425842 ?auto_2425844 ) ) ( not ( = ?auto_2425843 ?auto_2425844 ) ) ( not ( = ?auto_2425845 ?auto_2425844 ) ) ( not ( = ?auto_2425851 ?auto_2425847 ) ) ( not ( = ?auto_2425851 ?auto_2425849 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_2425842 ?auto_2425843 ?auto_2425845 ?auto_2425844 ?auto_2425841 )
      ( FLY-4PPL-VERIFY ?auto_2425842 ?auto_2425843 ?auto_2425844 ?auto_2425845 ?auto_2425841 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_2425877 - PERSON
      ?auto_2425878 - PERSON
      ?auto_2425879 - PERSON
      ?auto_2425880 - PERSON
      ?auto_2425876 - CITY
    )
    :vars
    (
      ?auto_2425883 - FLEVEL
      ?auto_2425885 - FLEVEL
      ?auto_2425884 - CITY
      ?auto_2425881 - CITY
      ?auto_2425886 - CITY
      ?auto_2425882 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2425883 ?auto_2425885 ) ( PERSON-AT ?auto_2425880 ?auto_2425884 ) ( not ( = ?auto_2425876 ?auto_2425884 ) ) ( not ( = ?auto_2425883 ?auto_2425885 ) ) ( PERSON-AT ?auto_2425878 ?auto_2425881 ) ( not ( = ?auto_2425876 ?auto_2425881 ) ) ( PERSON-AT ?auto_2425879 ?auto_2425886 ) ( not ( = ?auto_2425876 ?auto_2425886 ) ) ( PERSON-AT ?auto_2425877 ?auto_2425881 ) ( AIRCRAFT-AT ?auto_2425882 ?auto_2425876 ) ( FUEL-LEVEL ?auto_2425882 ?auto_2425883 ) ( not ( = ?auto_2425877 ?auto_2425879 ) ) ( not ( = ?auto_2425886 ?auto_2425881 ) ) ( not ( = ?auto_2425877 ?auto_2425878 ) ) ( not ( = ?auto_2425879 ?auto_2425878 ) ) ( not ( = ?auto_2425877 ?auto_2425880 ) ) ( not ( = ?auto_2425879 ?auto_2425880 ) ) ( not ( = ?auto_2425878 ?auto_2425880 ) ) ( not ( = ?auto_2425884 ?auto_2425881 ) ) ( not ( = ?auto_2425884 ?auto_2425886 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_2425877 ?auto_2425879 ?auto_2425880 ?auto_2425878 ?auto_2425876 )
      ( FLY-4PPL-VERIFY ?auto_2425877 ?auto_2425878 ?auto_2425879 ?auto_2425880 ?auto_2425876 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_2426147 - PERSON
      ?auto_2426148 - PERSON
      ?auto_2426149 - PERSON
      ?auto_2426150 - PERSON
      ?auto_2426146 - CITY
    )
    :vars
    (
      ?auto_2426153 - FLEVEL
      ?auto_2426155 - FLEVEL
      ?auto_2426154 - CITY
      ?auto_2426151 - CITY
      ?auto_2426156 - CITY
      ?auto_2426152 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2426153 ?auto_2426155 ) ( PERSON-AT ?auto_2426150 ?auto_2426154 ) ( not ( = ?auto_2426146 ?auto_2426154 ) ) ( not ( = ?auto_2426153 ?auto_2426155 ) ) ( PERSON-AT ?auto_2426149 ?auto_2426151 ) ( not ( = ?auto_2426146 ?auto_2426151 ) ) ( PERSON-AT ?auto_2426147 ?auto_2426156 ) ( not ( = ?auto_2426146 ?auto_2426156 ) ) ( PERSON-AT ?auto_2426148 ?auto_2426151 ) ( AIRCRAFT-AT ?auto_2426152 ?auto_2426146 ) ( FUEL-LEVEL ?auto_2426152 ?auto_2426153 ) ( not ( = ?auto_2426148 ?auto_2426147 ) ) ( not ( = ?auto_2426156 ?auto_2426151 ) ) ( not ( = ?auto_2426148 ?auto_2426149 ) ) ( not ( = ?auto_2426147 ?auto_2426149 ) ) ( not ( = ?auto_2426148 ?auto_2426150 ) ) ( not ( = ?auto_2426147 ?auto_2426150 ) ) ( not ( = ?auto_2426149 ?auto_2426150 ) ) ( not ( = ?auto_2426154 ?auto_2426151 ) ) ( not ( = ?auto_2426154 ?auto_2426156 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_2426148 ?auto_2426147 ?auto_2426150 ?auto_2426149 ?auto_2426146 )
      ( FLY-4PPL-VERIFY ?auto_2426147 ?auto_2426148 ?auto_2426149 ?auto_2426150 ?auto_2426146 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_2426182 - PERSON
      ?auto_2426183 - PERSON
      ?auto_2426184 - PERSON
      ?auto_2426185 - PERSON
      ?auto_2426181 - CITY
    )
    :vars
    (
      ?auto_2426188 - FLEVEL
      ?auto_2426190 - FLEVEL
      ?auto_2426189 - CITY
      ?auto_2426186 - CITY
      ?auto_2426191 - CITY
      ?auto_2426187 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2426188 ?auto_2426190 ) ( PERSON-AT ?auto_2426184 ?auto_2426189 ) ( not ( = ?auto_2426181 ?auto_2426189 ) ) ( not ( = ?auto_2426188 ?auto_2426190 ) ) ( PERSON-AT ?auto_2426185 ?auto_2426186 ) ( not ( = ?auto_2426181 ?auto_2426186 ) ) ( PERSON-AT ?auto_2426182 ?auto_2426191 ) ( not ( = ?auto_2426181 ?auto_2426191 ) ) ( PERSON-AT ?auto_2426183 ?auto_2426186 ) ( AIRCRAFT-AT ?auto_2426187 ?auto_2426181 ) ( FUEL-LEVEL ?auto_2426187 ?auto_2426188 ) ( not ( = ?auto_2426183 ?auto_2426182 ) ) ( not ( = ?auto_2426191 ?auto_2426186 ) ) ( not ( = ?auto_2426183 ?auto_2426185 ) ) ( not ( = ?auto_2426182 ?auto_2426185 ) ) ( not ( = ?auto_2426183 ?auto_2426184 ) ) ( not ( = ?auto_2426182 ?auto_2426184 ) ) ( not ( = ?auto_2426185 ?auto_2426184 ) ) ( not ( = ?auto_2426189 ?auto_2426186 ) ) ( not ( = ?auto_2426189 ?auto_2426191 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_2426183 ?auto_2426182 ?auto_2426184 ?auto_2426185 ?auto_2426181 )
      ( FLY-4PPL-VERIFY ?auto_2426182 ?auto_2426183 ?auto_2426184 ?auto_2426185 ?auto_2426181 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_2426386 - PERSON
      ?auto_2426387 - PERSON
      ?auto_2426388 - PERSON
      ?auto_2426389 - PERSON
      ?auto_2426385 - CITY
    )
    :vars
    (
      ?auto_2426392 - FLEVEL
      ?auto_2426394 - FLEVEL
      ?auto_2426393 - CITY
      ?auto_2426390 - CITY
      ?auto_2426395 - CITY
      ?auto_2426391 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2426392 ?auto_2426394 ) ( PERSON-AT ?auto_2426387 ?auto_2426393 ) ( not ( = ?auto_2426385 ?auto_2426393 ) ) ( not ( = ?auto_2426392 ?auto_2426394 ) ) ( PERSON-AT ?auto_2426389 ?auto_2426390 ) ( not ( = ?auto_2426385 ?auto_2426390 ) ) ( PERSON-AT ?auto_2426386 ?auto_2426395 ) ( not ( = ?auto_2426385 ?auto_2426395 ) ) ( PERSON-AT ?auto_2426388 ?auto_2426390 ) ( AIRCRAFT-AT ?auto_2426391 ?auto_2426385 ) ( FUEL-LEVEL ?auto_2426391 ?auto_2426392 ) ( not ( = ?auto_2426388 ?auto_2426386 ) ) ( not ( = ?auto_2426395 ?auto_2426390 ) ) ( not ( = ?auto_2426388 ?auto_2426389 ) ) ( not ( = ?auto_2426386 ?auto_2426389 ) ) ( not ( = ?auto_2426388 ?auto_2426387 ) ) ( not ( = ?auto_2426386 ?auto_2426387 ) ) ( not ( = ?auto_2426389 ?auto_2426387 ) ) ( not ( = ?auto_2426393 ?auto_2426390 ) ) ( not ( = ?auto_2426393 ?auto_2426395 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_2426388 ?auto_2426386 ?auto_2426387 ?auto_2426389 ?auto_2426385 )
      ( FLY-4PPL-VERIFY ?auto_2426386 ?auto_2426387 ?auto_2426388 ?auto_2426389 ?auto_2426385 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_2441530 - PERSON
      ?auto_2441531 - PERSON
      ?auto_2441532 - PERSON
      ?auto_2441533 - PERSON
      ?auto_2441534 - PERSON
      ?auto_2441529 - CITY
    )
    :vars
    (
      ?auto_2441537 - FLEVEL
      ?auto_2441538 - FLEVEL
      ?auto_2441535 - CITY
      ?auto_2441540 - CITY
      ?auto_2441539 - CITY
      ?auto_2441541 - CITY
      ?auto_2441536 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2441537 ?auto_2441538 ) ( PERSON-AT ?auto_2441534 ?auto_2441535 ) ( not ( = ?auto_2441529 ?auto_2441535 ) ) ( not ( = ?auto_2441537 ?auto_2441538 ) ) ( PERSON-AT ?auto_2441533 ?auto_2441540 ) ( not ( = ?auto_2441529 ?auto_2441540 ) ) ( PERSON-AT ?auto_2441532 ?auto_2441539 ) ( not ( = ?auto_2441529 ?auto_2441539 ) ) ( PERSON-AT ?auto_2441531 ?auto_2441541 ) ( not ( = ?auto_2441529 ?auto_2441541 ) ) ( PERSON-AT ?auto_2441530 ?auto_2441539 ) ( AIRCRAFT-AT ?auto_2441536 ?auto_2441529 ) ( FUEL-LEVEL ?auto_2441536 ?auto_2441537 ) ( not ( = ?auto_2441530 ?auto_2441531 ) ) ( not ( = ?auto_2441541 ?auto_2441539 ) ) ( not ( = ?auto_2441530 ?auto_2441532 ) ) ( not ( = ?auto_2441531 ?auto_2441532 ) ) ( not ( = ?auto_2441530 ?auto_2441533 ) ) ( not ( = ?auto_2441531 ?auto_2441533 ) ) ( not ( = ?auto_2441532 ?auto_2441533 ) ) ( not ( = ?auto_2441540 ?auto_2441539 ) ) ( not ( = ?auto_2441540 ?auto_2441541 ) ) ( not ( = ?auto_2441530 ?auto_2441534 ) ) ( not ( = ?auto_2441531 ?auto_2441534 ) ) ( not ( = ?auto_2441532 ?auto_2441534 ) ) ( not ( = ?auto_2441533 ?auto_2441534 ) ) ( not ( = ?auto_2441535 ?auto_2441540 ) ) ( not ( = ?auto_2441535 ?auto_2441539 ) ) ( not ( = ?auto_2441535 ?auto_2441541 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_2441530 ?auto_2441531 ?auto_2441533 ?auto_2441532 ?auto_2441529 )
      ( FLY-1PPL ?auto_2441534 ?auto_2441529 )
      ( FLY-5PPL-VERIFY ?auto_2441530 ?auto_2441531 ?auto_2441532 ?auto_2441533 ?auto_2441534 ?auto_2441529 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_2441633 - PERSON
      ?auto_2441634 - PERSON
      ?auto_2441635 - PERSON
      ?auto_2441636 - PERSON
      ?auto_2441637 - PERSON
      ?auto_2441632 - CITY
    )
    :vars
    (
      ?auto_2441642 - FLEVEL
      ?auto_2441638 - FLEVEL
      ?auto_2441640 - CITY
      ?auto_2441639 - CITY
      ?auto_2441641 - CITY
      ?auto_2441643 - CITY
      ?auto_2441644 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2441642 ?auto_2441638 ) ( PERSON-AT ?auto_2441637 ?auto_2441640 ) ( not ( = ?auto_2441632 ?auto_2441640 ) ) ( not ( = ?auto_2441642 ?auto_2441638 ) ) ( PERSON-AT ?auto_2441635 ?auto_2441639 ) ( not ( = ?auto_2441632 ?auto_2441639 ) ) ( PERSON-AT ?auto_2441636 ?auto_2441641 ) ( not ( = ?auto_2441632 ?auto_2441641 ) ) ( PERSON-AT ?auto_2441634 ?auto_2441643 ) ( not ( = ?auto_2441632 ?auto_2441643 ) ) ( PERSON-AT ?auto_2441633 ?auto_2441641 ) ( AIRCRAFT-AT ?auto_2441644 ?auto_2441632 ) ( FUEL-LEVEL ?auto_2441644 ?auto_2441642 ) ( not ( = ?auto_2441633 ?auto_2441634 ) ) ( not ( = ?auto_2441643 ?auto_2441641 ) ) ( not ( = ?auto_2441633 ?auto_2441636 ) ) ( not ( = ?auto_2441634 ?auto_2441636 ) ) ( not ( = ?auto_2441633 ?auto_2441635 ) ) ( not ( = ?auto_2441634 ?auto_2441635 ) ) ( not ( = ?auto_2441636 ?auto_2441635 ) ) ( not ( = ?auto_2441639 ?auto_2441641 ) ) ( not ( = ?auto_2441639 ?auto_2441643 ) ) ( not ( = ?auto_2441633 ?auto_2441637 ) ) ( not ( = ?auto_2441634 ?auto_2441637 ) ) ( not ( = ?auto_2441636 ?auto_2441637 ) ) ( not ( = ?auto_2441635 ?auto_2441637 ) ) ( not ( = ?auto_2441640 ?auto_2441639 ) ) ( not ( = ?auto_2441640 ?auto_2441641 ) ) ( not ( = ?auto_2441640 ?auto_2441643 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_2441633 ?auto_2441634 ?auto_2441636 ?auto_2441635 ?auto_2441637 ?auto_2441632 )
      ( FLY-5PPL-VERIFY ?auto_2441633 ?auto_2441634 ?auto_2441635 ?auto_2441636 ?auto_2441637 ?auto_2441632 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_2441688 - PERSON
      ?auto_2441689 - PERSON
      ?auto_2441690 - PERSON
      ?auto_2441691 - PERSON
      ?auto_2441692 - PERSON
      ?auto_2441687 - CITY
    )
    :vars
    (
      ?auto_2441698 - FLEVEL
      ?auto_2441697 - FLEVEL
      ?auto_2441696 - CITY
      ?auto_2441695 - CITY
      ?auto_2441694 - CITY
      ?auto_2441693 - CITY
      ?auto_2441699 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2441698 ?auto_2441697 ) ( PERSON-AT ?auto_2441691 ?auto_2441696 ) ( not ( = ?auto_2441687 ?auto_2441696 ) ) ( not ( = ?auto_2441698 ?auto_2441697 ) ) ( PERSON-AT ?auto_2441690 ?auto_2441695 ) ( not ( = ?auto_2441687 ?auto_2441695 ) ) ( PERSON-AT ?auto_2441692 ?auto_2441694 ) ( not ( = ?auto_2441687 ?auto_2441694 ) ) ( PERSON-AT ?auto_2441689 ?auto_2441693 ) ( not ( = ?auto_2441687 ?auto_2441693 ) ) ( PERSON-AT ?auto_2441688 ?auto_2441694 ) ( AIRCRAFT-AT ?auto_2441699 ?auto_2441687 ) ( FUEL-LEVEL ?auto_2441699 ?auto_2441698 ) ( not ( = ?auto_2441688 ?auto_2441689 ) ) ( not ( = ?auto_2441693 ?auto_2441694 ) ) ( not ( = ?auto_2441688 ?auto_2441692 ) ) ( not ( = ?auto_2441689 ?auto_2441692 ) ) ( not ( = ?auto_2441688 ?auto_2441690 ) ) ( not ( = ?auto_2441689 ?auto_2441690 ) ) ( not ( = ?auto_2441692 ?auto_2441690 ) ) ( not ( = ?auto_2441695 ?auto_2441694 ) ) ( not ( = ?auto_2441695 ?auto_2441693 ) ) ( not ( = ?auto_2441688 ?auto_2441691 ) ) ( not ( = ?auto_2441689 ?auto_2441691 ) ) ( not ( = ?auto_2441692 ?auto_2441691 ) ) ( not ( = ?auto_2441690 ?auto_2441691 ) ) ( not ( = ?auto_2441696 ?auto_2441695 ) ) ( not ( = ?auto_2441696 ?auto_2441694 ) ) ( not ( = ?auto_2441696 ?auto_2441693 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_2441688 ?auto_2441689 ?auto_2441690 ?auto_2441692 ?auto_2441691 ?auto_2441687 )
      ( FLY-5PPL-VERIFY ?auto_2441688 ?auto_2441689 ?auto_2441690 ?auto_2441691 ?auto_2441692 ?auto_2441687 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_2442245 - PERSON
      ?auto_2442246 - PERSON
      ?auto_2442247 - PERSON
      ?auto_2442248 - PERSON
      ?auto_2442249 - PERSON
      ?auto_2442244 - CITY
    )
    :vars
    (
      ?auto_2442255 - FLEVEL
      ?auto_2442254 - FLEVEL
      ?auto_2442253 - CITY
      ?auto_2442252 - CITY
      ?auto_2442251 - CITY
      ?auto_2442250 - CITY
      ?auto_2442256 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2442255 ?auto_2442254 ) ( PERSON-AT ?auto_2442249 ?auto_2442253 ) ( not ( = ?auto_2442244 ?auto_2442253 ) ) ( not ( = ?auto_2442255 ?auto_2442254 ) ) ( PERSON-AT ?auto_2442248 ?auto_2442252 ) ( not ( = ?auto_2442244 ?auto_2442252 ) ) ( PERSON-AT ?auto_2442246 ?auto_2442251 ) ( not ( = ?auto_2442244 ?auto_2442251 ) ) ( PERSON-AT ?auto_2442247 ?auto_2442250 ) ( not ( = ?auto_2442244 ?auto_2442250 ) ) ( PERSON-AT ?auto_2442245 ?auto_2442251 ) ( AIRCRAFT-AT ?auto_2442256 ?auto_2442244 ) ( FUEL-LEVEL ?auto_2442256 ?auto_2442255 ) ( not ( = ?auto_2442245 ?auto_2442247 ) ) ( not ( = ?auto_2442250 ?auto_2442251 ) ) ( not ( = ?auto_2442245 ?auto_2442246 ) ) ( not ( = ?auto_2442247 ?auto_2442246 ) ) ( not ( = ?auto_2442245 ?auto_2442248 ) ) ( not ( = ?auto_2442247 ?auto_2442248 ) ) ( not ( = ?auto_2442246 ?auto_2442248 ) ) ( not ( = ?auto_2442252 ?auto_2442251 ) ) ( not ( = ?auto_2442252 ?auto_2442250 ) ) ( not ( = ?auto_2442245 ?auto_2442249 ) ) ( not ( = ?auto_2442247 ?auto_2442249 ) ) ( not ( = ?auto_2442246 ?auto_2442249 ) ) ( not ( = ?auto_2442248 ?auto_2442249 ) ) ( not ( = ?auto_2442253 ?auto_2442252 ) ) ( not ( = ?auto_2442253 ?auto_2442251 ) ) ( not ( = ?auto_2442253 ?auto_2442250 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_2442245 ?auto_2442247 ?auto_2442248 ?auto_2442246 ?auto_2442249 ?auto_2442244 )
      ( FLY-5PPL-VERIFY ?auto_2442245 ?auto_2442246 ?auto_2442247 ?auto_2442248 ?auto_2442249 ?auto_2442244 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_2445808 - PERSON
      ?auto_2445809 - PERSON
      ?auto_2445810 - PERSON
      ?auto_2445811 - PERSON
      ?auto_2445812 - PERSON
      ?auto_2445807 - CITY
    )
    :vars
    (
      ?auto_2445818 - FLEVEL
      ?auto_2445817 - FLEVEL
      ?auto_2445816 - CITY
      ?auto_2445815 - CITY
      ?auto_2445814 - CITY
      ?auto_2445813 - CITY
      ?auto_2445819 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2445818 ?auto_2445817 ) ( PERSON-AT ?auto_2445812 ?auto_2445816 ) ( not ( = ?auto_2445807 ?auto_2445816 ) ) ( not ( = ?auto_2445818 ?auto_2445817 ) ) ( PERSON-AT ?auto_2445811 ?auto_2445815 ) ( not ( = ?auto_2445807 ?auto_2445815 ) ) ( PERSON-AT ?auto_2445810 ?auto_2445814 ) ( not ( = ?auto_2445807 ?auto_2445814 ) ) ( PERSON-AT ?auto_2445808 ?auto_2445813 ) ( not ( = ?auto_2445807 ?auto_2445813 ) ) ( PERSON-AT ?auto_2445809 ?auto_2445814 ) ( AIRCRAFT-AT ?auto_2445819 ?auto_2445807 ) ( FUEL-LEVEL ?auto_2445819 ?auto_2445818 ) ( not ( = ?auto_2445809 ?auto_2445808 ) ) ( not ( = ?auto_2445813 ?auto_2445814 ) ) ( not ( = ?auto_2445809 ?auto_2445810 ) ) ( not ( = ?auto_2445808 ?auto_2445810 ) ) ( not ( = ?auto_2445809 ?auto_2445811 ) ) ( not ( = ?auto_2445808 ?auto_2445811 ) ) ( not ( = ?auto_2445810 ?auto_2445811 ) ) ( not ( = ?auto_2445815 ?auto_2445814 ) ) ( not ( = ?auto_2445815 ?auto_2445813 ) ) ( not ( = ?auto_2445809 ?auto_2445812 ) ) ( not ( = ?auto_2445808 ?auto_2445812 ) ) ( not ( = ?auto_2445810 ?auto_2445812 ) ) ( not ( = ?auto_2445811 ?auto_2445812 ) ) ( not ( = ?auto_2445816 ?auto_2445815 ) ) ( not ( = ?auto_2445816 ?auto_2445814 ) ) ( not ( = ?auto_2445816 ?auto_2445813 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_2445809 ?auto_2445808 ?auto_2445811 ?auto_2445810 ?auto_2445812 ?auto_2445807 )
      ( FLY-5PPL-VERIFY ?auto_2445808 ?auto_2445809 ?auto_2445810 ?auto_2445811 ?auto_2445812 ?auto_2445807 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_2445911 - PERSON
      ?auto_2445912 - PERSON
      ?auto_2445913 - PERSON
      ?auto_2445914 - PERSON
      ?auto_2445915 - PERSON
      ?auto_2445910 - CITY
    )
    :vars
    (
      ?auto_2445921 - FLEVEL
      ?auto_2445920 - FLEVEL
      ?auto_2445919 - CITY
      ?auto_2445918 - CITY
      ?auto_2445917 - CITY
      ?auto_2445916 - CITY
      ?auto_2445922 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2445921 ?auto_2445920 ) ( PERSON-AT ?auto_2445915 ?auto_2445919 ) ( not ( = ?auto_2445910 ?auto_2445919 ) ) ( not ( = ?auto_2445921 ?auto_2445920 ) ) ( PERSON-AT ?auto_2445913 ?auto_2445918 ) ( not ( = ?auto_2445910 ?auto_2445918 ) ) ( PERSON-AT ?auto_2445914 ?auto_2445917 ) ( not ( = ?auto_2445910 ?auto_2445917 ) ) ( PERSON-AT ?auto_2445911 ?auto_2445916 ) ( not ( = ?auto_2445910 ?auto_2445916 ) ) ( PERSON-AT ?auto_2445912 ?auto_2445917 ) ( AIRCRAFT-AT ?auto_2445922 ?auto_2445910 ) ( FUEL-LEVEL ?auto_2445922 ?auto_2445921 ) ( not ( = ?auto_2445912 ?auto_2445911 ) ) ( not ( = ?auto_2445916 ?auto_2445917 ) ) ( not ( = ?auto_2445912 ?auto_2445914 ) ) ( not ( = ?auto_2445911 ?auto_2445914 ) ) ( not ( = ?auto_2445912 ?auto_2445913 ) ) ( not ( = ?auto_2445911 ?auto_2445913 ) ) ( not ( = ?auto_2445914 ?auto_2445913 ) ) ( not ( = ?auto_2445918 ?auto_2445917 ) ) ( not ( = ?auto_2445918 ?auto_2445916 ) ) ( not ( = ?auto_2445912 ?auto_2445915 ) ) ( not ( = ?auto_2445911 ?auto_2445915 ) ) ( not ( = ?auto_2445914 ?auto_2445915 ) ) ( not ( = ?auto_2445913 ?auto_2445915 ) ) ( not ( = ?auto_2445919 ?auto_2445918 ) ) ( not ( = ?auto_2445919 ?auto_2445917 ) ) ( not ( = ?auto_2445919 ?auto_2445916 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_2445912 ?auto_2445911 ?auto_2445913 ?auto_2445914 ?auto_2445915 ?auto_2445910 )
      ( FLY-5PPL-VERIFY ?auto_2445911 ?auto_2445912 ?auto_2445913 ?auto_2445914 ?auto_2445915 ?auto_2445910 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_2445966 - PERSON
      ?auto_2445967 - PERSON
      ?auto_2445968 - PERSON
      ?auto_2445969 - PERSON
      ?auto_2445970 - PERSON
      ?auto_2445965 - CITY
    )
    :vars
    (
      ?auto_2445976 - FLEVEL
      ?auto_2445975 - FLEVEL
      ?auto_2445974 - CITY
      ?auto_2445973 - CITY
      ?auto_2445972 - CITY
      ?auto_2445971 - CITY
      ?auto_2445977 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2445976 ?auto_2445975 ) ( PERSON-AT ?auto_2445969 ?auto_2445974 ) ( not ( = ?auto_2445965 ?auto_2445974 ) ) ( not ( = ?auto_2445976 ?auto_2445975 ) ) ( PERSON-AT ?auto_2445968 ?auto_2445973 ) ( not ( = ?auto_2445965 ?auto_2445973 ) ) ( PERSON-AT ?auto_2445970 ?auto_2445972 ) ( not ( = ?auto_2445965 ?auto_2445972 ) ) ( PERSON-AT ?auto_2445966 ?auto_2445971 ) ( not ( = ?auto_2445965 ?auto_2445971 ) ) ( PERSON-AT ?auto_2445967 ?auto_2445972 ) ( AIRCRAFT-AT ?auto_2445977 ?auto_2445965 ) ( FUEL-LEVEL ?auto_2445977 ?auto_2445976 ) ( not ( = ?auto_2445967 ?auto_2445966 ) ) ( not ( = ?auto_2445971 ?auto_2445972 ) ) ( not ( = ?auto_2445967 ?auto_2445970 ) ) ( not ( = ?auto_2445966 ?auto_2445970 ) ) ( not ( = ?auto_2445967 ?auto_2445968 ) ) ( not ( = ?auto_2445966 ?auto_2445968 ) ) ( not ( = ?auto_2445970 ?auto_2445968 ) ) ( not ( = ?auto_2445973 ?auto_2445972 ) ) ( not ( = ?auto_2445973 ?auto_2445971 ) ) ( not ( = ?auto_2445967 ?auto_2445969 ) ) ( not ( = ?auto_2445966 ?auto_2445969 ) ) ( not ( = ?auto_2445970 ?auto_2445969 ) ) ( not ( = ?auto_2445968 ?auto_2445969 ) ) ( not ( = ?auto_2445974 ?auto_2445973 ) ) ( not ( = ?auto_2445974 ?auto_2445972 ) ) ( not ( = ?auto_2445974 ?auto_2445971 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_2445967 ?auto_2445966 ?auto_2445968 ?auto_2445970 ?auto_2445969 ?auto_2445965 )
      ( FLY-5PPL-VERIFY ?auto_2445966 ?auto_2445967 ?auto_2445968 ?auto_2445969 ?auto_2445970 ?auto_2445965 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_2448107 - PERSON
      ?auto_2448108 - PERSON
      ?auto_2448109 - PERSON
      ?auto_2448110 - PERSON
      ?auto_2448111 - PERSON
      ?auto_2448106 - CITY
    )
    :vars
    (
      ?auto_2448117 - FLEVEL
      ?auto_2448116 - FLEVEL
      ?auto_2448115 - CITY
      ?auto_2448114 - CITY
      ?auto_2448113 - CITY
      ?auto_2448112 - CITY
      ?auto_2448118 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2448117 ?auto_2448116 ) ( PERSON-AT ?auto_2448111 ?auto_2448115 ) ( not ( = ?auto_2448106 ?auto_2448115 ) ) ( not ( = ?auto_2448117 ?auto_2448116 ) ) ( PERSON-AT ?auto_2448108 ?auto_2448114 ) ( not ( = ?auto_2448106 ?auto_2448114 ) ) ( PERSON-AT ?auto_2448110 ?auto_2448113 ) ( not ( = ?auto_2448106 ?auto_2448113 ) ) ( PERSON-AT ?auto_2448107 ?auto_2448112 ) ( not ( = ?auto_2448106 ?auto_2448112 ) ) ( PERSON-AT ?auto_2448109 ?auto_2448113 ) ( AIRCRAFT-AT ?auto_2448118 ?auto_2448106 ) ( FUEL-LEVEL ?auto_2448118 ?auto_2448117 ) ( not ( = ?auto_2448109 ?auto_2448107 ) ) ( not ( = ?auto_2448112 ?auto_2448113 ) ) ( not ( = ?auto_2448109 ?auto_2448110 ) ) ( not ( = ?auto_2448107 ?auto_2448110 ) ) ( not ( = ?auto_2448109 ?auto_2448108 ) ) ( not ( = ?auto_2448107 ?auto_2448108 ) ) ( not ( = ?auto_2448110 ?auto_2448108 ) ) ( not ( = ?auto_2448114 ?auto_2448113 ) ) ( not ( = ?auto_2448114 ?auto_2448112 ) ) ( not ( = ?auto_2448109 ?auto_2448111 ) ) ( not ( = ?auto_2448107 ?auto_2448111 ) ) ( not ( = ?auto_2448110 ?auto_2448111 ) ) ( not ( = ?auto_2448108 ?auto_2448111 ) ) ( not ( = ?auto_2448115 ?auto_2448114 ) ) ( not ( = ?auto_2448115 ?auto_2448113 ) ) ( not ( = ?auto_2448115 ?auto_2448112 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_2448109 ?auto_2448107 ?auto_2448108 ?auto_2448110 ?auto_2448111 ?auto_2448106 )
      ( FLY-5PPL-VERIFY ?auto_2448107 ?auto_2448108 ?auto_2448109 ?auto_2448110 ?auto_2448111 ?auto_2448106 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_2448162 - PERSON
      ?auto_2448163 - PERSON
      ?auto_2448164 - PERSON
      ?auto_2448165 - PERSON
      ?auto_2448166 - PERSON
      ?auto_2448161 - CITY
    )
    :vars
    (
      ?auto_2448172 - FLEVEL
      ?auto_2448171 - FLEVEL
      ?auto_2448170 - CITY
      ?auto_2448169 - CITY
      ?auto_2448168 - CITY
      ?auto_2448167 - CITY
      ?auto_2448173 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2448172 ?auto_2448171 ) ( PERSON-AT ?auto_2448165 ?auto_2448170 ) ( not ( = ?auto_2448161 ?auto_2448170 ) ) ( not ( = ?auto_2448172 ?auto_2448171 ) ) ( PERSON-AT ?auto_2448163 ?auto_2448169 ) ( not ( = ?auto_2448161 ?auto_2448169 ) ) ( PERSON-AT ?auto_2448166 ?auto_2448168 ) ( not ( = ?auto_2448161 ?auto_2448168 ) ) ( PERSON-AT ?auto_2448162 ?auto_2448167 ) ( not ( = ?auto_2448161 ?auto_2448167 ) ) ( PERSON-AT ?auto_2448164 ?auto_2448168 ) ( AIRCRAFT-AT ?auto_2448173 ?auto_2448161 ) ( FUEL-LEVEL ?auto_2448173 ?auto_2448172 ) ( not ( = ?auto_2448164 ?auto_2448162 ) ) ( not ( = ?auto_2448167 ?auto_2448168 ) ) ( not ( = ?auto_2448164 ?auto_2448166 ) ) ( not ( = ?auto_2448162 ?auto_2448166 ) ) ( not ( = ?auto_2448164 ?auto_2448163 ) ) ( not ( = ?auto_2448162 ?auto_2448163 ) ) ( not ( = ?auto_2448166 ?auto_2448163 ) ) ( not ( = ?auto_2448169 ?auto_2448168 ) ) ( not ( = ?auto_2448169 ?auto_2448167 ) ) ( not ( = ?auto_2448164 ?auto_2448165 ) ) ( not ( = ?auto_2448162 ?auto_2448165 ) ) ( not ( = ?auto_2448166 ?auto_2448165 ) ) ( not ( = ?auto_2448163 ?auto_2448165 ) ) ( not ( = ?auto_2448170 ?auto_2448169 ) ) ( not ( = ?auto_2448170 ?auto_2448168 ) ) ( not ( = ?auto_2448170 ?auto_2448167 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_2448164 ?auto_2448162 ?auto_2448163 ?auto_2448166 ?auto_2448165 ?auto_2448161 )
      ( FLY-5PPL-VERIFY ?auto_2448162 ?auto_2448163 ?auto_2448164 ?auto_2448165 ?auto_2448166 ?auto_2448161 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_2448603 - PERSON
      ?auto_2448604 - PERSON
      ?auto_2448605 - PERSON
      ?auto_2448606 - PERSON
      ?auto_2448607 - PERSON
      ?auto_2448602 - CITY
    )
    :vars
    (
      ?auto_2448613 - FLEVEL
      ?auto_2448612 - FLEVEL
      ?auto_2448611 - CITY
      ?auto_2448610 - CITY
      ?auto_2448609 - CITY
      ?auto_2448608 - CITY
      ?auto_2448614 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2448613 ?auto_2448612 ) ( PERSON-AT ?auto_2448605 ?auto_2448611 ) ( not ( = ?auto_2448602 ?auto_2448611 ) ) ( not ( = ?auto_2448613 ?auto_2448612 ) ) ( PERSON-AT ?auto_2448604 ?auto_2448610 ) ( not ( = ?auto_2448602 ?auto_2448610 ) ) ( PERSON-AT ?auto_2448607 ?auto_2448609 ) ( not ( = ?auto_2448602 ?auto_2448609 ) ) ( PERSON-AT ?auto_2448603 ?auto_2448608 ) ( not ( = ?auto_2448602 ?auto_2448608 ) ) ( PERSON-AT ?auto_2448606 ?auto_2448609 ) ( AIRCRAFT-AT ?auto_2448614 ?auto_2448602 ) ( FUEL-LEVEL ?auto_2448614 ?auto_2448613 ) ( not ( = ?auto_2448606 ?auto_2448603 ) ) ( not ( = ?auto_2448608 ?auto_2448609 ) ) ( not ( = ?auto_2448606 ?auto_2448607 ) ) ( not ( = ?auto_2448603 ?auto_2448607 ) ) ( not ( = ?auto_2448606 ?auto_2448604 ) ) ( not ( = ?auto_2448603 ?auto_2448604 ) ) ( not ( = ?auto_2448607 ?auto_2448604 ) ) ( not ( = ?auto_2448610 ?auto_2448609 ) ) ( not ( = ?auto_2448610 ?auto_2448608 ) ) ( not ( = ?auto_2448606 ?auto_2448605 ) ) ( not ( = ?auto_2448603 ?auto_2448605 ) ) ( not ( = ?auto_2448607 ?auto_2448605 ) ) ( not ( = ?auto_2448604 ?auto_2448605 ) ) ( not ( = ?auto_2448611 ?auto_2448610 ) ) ( not ( = ?auto_2448611 ?auto_2448609 ) ) ( not ( = ?auto_2448611 ?auto_2448608 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_2448606 ?auto_2448603 ?auto_2448604 ?auto_2448607 ?auto_2448605 ?auto_2448602 )
      ( FLY-5PPL-VERIFY ?auto_2448603 ?auto_2448604 ?auto_2448605 ?auto_2448606 ?auto_2448607 ?auto_2448602 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2701574 - PERSON
      ?auto_2701575 - PERSON
      ?auto_2701576 - PERSON
      ?auto_2701577 - PERSON
      ?auto_2701578 - PERSON
      ?auto_2701579 - PERSON
      ?auto_2701573 - CITY
    )
    :vars
    (
      ?auto_2701580 - FLEVEL
      ?auto_2701583 - FLEVEL
      ?auto_2701582 - CITY
      ?auto_2701586 - CITY
      ?auto_2701585 - CITY
      ?auto_2701584 - CITY
      ?auto_2701581 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2701580 ?auto_2701583 ) ( PERSON-AT ?auto_2701579 ?auto_2701582 ) ( not ( = ?auto_2701573 ?auto_2701582 ) ) ( not ( = ?auto_2701580 ?auto_2701583 ) ) ( PERSON-AT ?auto_2701578 ?auto_2701586 ) ( not ( = ?auto_2701573 ?auto_2701586 ) ) ( PERSON-AT ?auto_2701577 ?auto_2701582 ) ( PERSON-AT ?auto_2701576 ?auto_2701585 ) ( not ( = ?auto_2701573 ?auto_2701585 ) ) ( PERSON-AT ?auto_2701575 ?auto_2701584 ) ( not ( = ?auto_2701573 ?auto_2701584 ) ) ( PERSON-AT ?auto_2701574 ?auto_2701585 ) ( AIRCRAFT-AT ?auto_2701581 ?auto_2701573 ) ( FUEL-LEVEL ?auto_2701581 ?auto_2701580 ) ( not ( = ?auto_2701574 ?auto_2701575 ) ) ( not ( = ?auto_2701584 ?auto_2701585 ) ) ( not ( = ?auto_2701574 ?auto_2701576 ) ) ( not ( = ?auto_2701575 ?auto_2701576 ) ) ( not ( = ?auto_2701574 ?auto_2701577 ) ) ( not ( = ?auto_2701575 ?auto_2701577 ) ) ( not ( = ?auto_2701576 ?auto_2701577 ) ) ( not ( = ?auto_2701582 ?auto_2701585 ) ) ( not ( = ?auto_2701582 ?auto_2701584 ) ) ( not ( = ?auto_2701574 ?auto_2701578 ) ) ( not ( = ?auto_2701575 ?auto_2701578 ) ) ( not ( = ?auto_2701576 ?auto_2701578 ) ) ( not ( = ?auto_2701577 ?auto_2701578 ) ) ( not ( = ?auto_2701586 ?auto_2701582 ) ) ( not ( = ?auto_2701586 ?auto_2701585 ) ) ( not ( = ?auto_2701586 ?auto_2701584 ) ) ( not ( = ?auto_2701574 ?auto_2701579 ) ) ( not ( = ?auto_2701575 ?auto_2701579 ) ) ( not ( = ?auto_2701576 ?auto_2701579 ) ) ( not ( = ?auto_2701577 ?auto_2701579 ) ) ( not ( = ?auto_2701578 ?auto_2701579 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_2701574 ?auto_2701575 ?auto_2701577 ?auto_2701576 ?auto_2701578 ?auto_2701573 )
      ( FLY-1PPL ?auto_2701579 ?auto_2701573 )
      ( FLY-6PPL-VERIFY ?auto_2701574 ?auto_2701575 ?auto_2701576 ?auto_2701577 ?auto_2701578 ?auto_2701579 ?auto_2701573 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2701648 - PERSON
      ?auto_2701649 - PERSON
      ?auto_2701650 - PERSON
      ?auto_2701651 - PERSON
      ?auto_2701652 - PERSON
      ?auto_2701653 - PERSON
      ?auto_2701647 - CITY
    )
    :vars
    (
      ?auto_2701656 - FLEVEL
      ?auto_2701654 - FLEVEL
      ?auto_2701659 - CITY
      ?auto_2701658 - CITY
      ?auto_2701655 - CITY
      ?auto_2701660 - CITY
      ?auto_2701657 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2701656 ?auto_2701654 ) ( PERSON-AT ?auto_2701652 ?auto_2701659 ) ( not ( = ?auto_2701647 ?auto_2701659 ) ) ( not ( = ?auto_2701656 ?auto_2701654 ) ) ( PERSON-AT ?auto_2701653 ?auto_2701658 ) ( not ( = ?auto_2701647 ?auto_2701658 ) ) ( PERSON-AT ?auto_2701651 ?auto_2701659 ) ( PERSON-AT ?auto_2701650 ?auto_2701655 ) ( not ( = ?auto_2701647 ?auto_2701655 ) ) ( PERSON-AT ?auto_2701649 ?auto_2701660 ) ( not ( = ?auto_2701647 ?auto_2701660 ) ) ( PERSON-AT ?auto_2701648 ?auto_2701655 ) ( AIRCRAFT-AT ?auto_2701657 ?auto_2701647 ) ( FUEL-LEVEL ?auto_2701657 ?auto_2701656 ) ( not ( = ?auto_2701648 ?auto_2701649 ) ) ( not ( = ?auto_2701660 ?auto_2701655 ) ) ( not ( = ?auto_2701648 ?auto_2701650 ) ) ( not ( = ?auto_2701649 ?auto_2701650 ) ) ( not ( = ?auto_2701648 ?auto_2701651 ) ) ( not ( = ?auto_2701649 ?auto_2701651 ) ) ( not ( = ?auto_2701650 ?auto_2701651 ) ) ( not ( = ?auto_2701659 ?auto_2701655 ) ) ( not ( = ?auto_2701659 ?auto_2701660 ) ) ( not ( = ?auto_2701648 ?auto_2701653 ) ) ( not ( = ?auto_2701649 ?auto_2701653 ) ) ( not ( = ?auto_2701650 ?auto_2701653 ) ) ( not ( = ?auto_2701651 ?auto_2701653 ) ) ( not ( = ?auto_2701658 ?auto_2701659 ) ) ( not ( = ?auto_2701658 ?auto_2701655 ) ) ( not ( = ?auto_2701658 ?auto_2701660 ) ) ( not ( = ?auto_2701648 ?auto_2701652 ) ) ( not ( = ?auto_2701649 ?auto_2701652 ) ) ( not ( = ?auto_2701650 ?auto_2701652 ) ) ( not ( = ?auto_2701651 ?auto_2701652 ) ) ( not ( = ?auto_2701653 ?auto_2701652 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2701648 ?auto_2701649 ?auto_2701650 ?auto_2701651 ?auto_2701653 ?auto_2701652 ?auto_2701647 )
      ( FLY-6PPL-VERIFY ?auto_2701648 ?auto_2701649 ?auto_2701650 ?auto_2701651 ?auto_2701652 ?auto_2701653 ?auto_2701647 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2701722 - PERSON
      ?auto_2701723 - PERSON
      ?auto_2701724 - PERSON
      ?auto_2701725 - PERSON
      ?auto_2701726 - PERSON
      ?auto_2701727 - PERSON
      ?auto_2701721 - CITY
    )
    :vars
    (
      ?auto_2701733 - FLEVEL
      ?auto_2701730 - FLEVEL
      ?auto_2701728 - CITY
      ?auto_2701731 - CITY
      ?auto_2701729 - CITY
      ?auto_2701732 - CITY
      ?auto_2701734 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2701733 ?auto_2701730 ) ( PERSON-AT ?auto_2701727 ?auto_2701728 ) ( not ( = ?auto_2701721 ?auto_2701728 ) ) ( not ( = ?auto_2701733 ?auto_2701730 ) ) ( PERSON-AT ?auto_2701725 ?auto_2701731 ) ( not ( = ?auto_2701721 ?auto_2701731 ) ) ( PERSON-AT ?auto_2701726 ?auto_2701728 ) ( PERSON-AT ?auto_2701724 ?auto_2701729 ) ( not ( = ?auto_2701721 ?auto_2701729 ) ) ( PERSON-AT ?auto_2701723 ?auto_2701732 ) ( not ( = ?auto_2701721 ?auto_2701732 ) ) ( PERSON-AT ?auto_2701722 ?auto_2701729 ) ( AIRCRAFT-AT ?auto_2701734 ?auto_2701721 ) ( FUEL-LEVEL ?auto_2701734 ?auto_2701733 ) ( not ( = ?auto_2701722 ?auto_2701723 ) ) ( not ( = ?auto_2701732 ?auto_2701729 ) ) ( not ( = ?auto_2701722 ?auto_2701724 ) ) ( not ( = ?auto_2701723 ?auto_2701724 ) ) ( not ( = ?auto_2701722 ?auto_2701726 ) ) ( not ( = ?auto_2701723 ?auto_2701726 ) ) ( not ( = ?auto_2701724 ?auto_2701726 ) ) ( not ( = ?auto_2701728 ?auto_2701729 ) ) ( not ( = ?auto_2701728 ?auto_2701732 ) ) ( not ( = ?auto_2701722 ?auto_2701725 ) ) ( not ( = ?auto_2701723 ?auto_2701725 ) ) ( not ( = ?auto_2701724 ?auto_2701725 ) ) ( not ( = ?auto_2701726 ?auto_2701725 ) ) ( not ( = ?auto_2701731 ?auto_2701728 ) ) ( not ( = ?auto_2701731 ?auto_2701729 ) ) ( not ( = ?auto_2701731 ?auto_2701732 ) ) ( not ( = ?auto_2701722 ?auto_2701727 ) ) ( not ( = ?auto_2701723 ?auto_2701727 ) ) ( not ( = ?auto_2701724 ?auto_2701727 ) ) ( not ( = ?auto_2701726 ?auto_2701727 ) ) ( not ( = ?auto_2701725 ?auto_2701727 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2701722 ?auto_2701723 ?auto_2701724 ?auto_2701726 ?auto_2701727 ?auto_2701725 ?auto_2701721 )
      ( FLY-6PPL-VERIFY ?auto_2701722 ?auto_2701723 ?auto_2701724 ?auto_2701725 ?auto_2701726 ?auto_2701727 ?auto_2701721 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2702777 - PERSON
      ?auto_2702778 - PERSON
      ?auto_2702779 - PERSON
      ?auto_2702780 - PERSON
      ?auto_2702781 - PERSON
      ?auto_2702782 - PERSON
      ?auto_2702776 - CITY
    )
    :vars
    (
      ?auto_2702788 - FLEVEL
      ?auto_2702785 - FLEVEL
      ?auto_2702783 - CITY
      ?auto_2702786 - CITY
      ?auto_2702784 - CITY
      ?auto_2702787 - CITY
      ?auto_2702789 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2702788 ?auto_2702785 ) ( PERSON-AT ?auto_2702782 ?auto_2702783 ) ( not ( = ?auto_2702776 ?auto_2702783 ) ) ( not ( = ?auto_2702788 ?auto_2702785 ) ) ( PERSON-AT ?auto_2702781 ?auto_2702786 ) ( not ( = ?auto_2702776 ?auto_2702786 ) ) ( PERSON-AT ?auto_2702779 ?auto_2702783 ) ( PERSON-AT ?auto_2702780 ?auto_2702784 ) ( not ( = ?auto_2702776 ?auto_2702784 ) ) ( PERSON-AT ?auto_2702778 ?auto_2702787 ) ( not ( = ?auto_2702776 ?auto_2702787 ) ) ( PERSON-AT ?auto_2702777 ?auto_2702784 ) ( AIRCRAFT-AT ?auto_2702789 ?auto_2702776 ) ( FUEL-LEVEL ?auto_2702789 ?auto_2702788 ) ( not ( = ?auto_2702777 ?auto_2702778 ) ) ( not ( = ?auto_2702787 ?auto_2702784 ) ) ( not ( = ?auto_2702777 ?auto_2702780 ) ) ( not ( = ?auto_2702778 ?auto_2702780 ) ) ( not ( = ?auto_2702777 ?auto_2702779 ) ) ( not ( = ?auto_2702778 ?auto_2702779 ) ) ( not ( = ?auto_2702780 ?auto_2702779 ) ) ( not ( = ?auto_2702783 ?auto_2702784 ) ) ( not ( = ?auto_2702783 ?auto_2702787 ) ) ( not ( = ?auto_2702777 ?auto_2702781 ) ) ( not ( = ?auto_2702778 ?auto_2702781 ) ) ( not ( = ?auto_2702780 ?auto_2702781 ) ) ( not ( = ?auto_2702779 ?auto_2702781 ) ) ( not ( = ?auto_2702786 ?auto_2702783 ) ) ( not ( = ?auto_2702786 ?auto_2702784 ) ) ( not ( = ?auto_2702786 ?auto_2702787 ) ) ( not ( = ?auto_2702777 ?auto_2702782 ) ) ( not ( = ?auto_2702778 ?auto_2702782 ) ) ( not ( = ?auto_2702780 ?auto_2702782 ) ) ( not ( = ?auto_2702779 ?auto_2702782 ) ) ( not ( = ?auto_2702781 ?auto_2702782 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2702777 ?auto_2702778 ?auto_2702780 ?auto_2702779 ?auto_2702782 ?auto_2702781 ?auto_2702776 )
      ( FLY-6PPL-VERIFY ?auto_2702777 ?auto_2702778 ?auto_2702779 ?auto_2702780 ?auto_2702781 ?auto_2702782 ?auto_2702776 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2702851 - PERSON
      ?auto_2702852 - PERSON
      ?auto_2702853 - PERSON
      ?auto_2702854 - PERSON
      ?auto_2702855 - PERSON
      ?auto_2702856 - PERSON
      ?auto_2702850 - CITY
    )
    :vars
    (
      ?auto_2702862 - FLEVEL
      ?auto_2702859 - FLEVEL
      ?auto_2702857 - CITY
      ?auto_2702860 - CITY
      ?auto_2702858 - CITY
      ?auto_2702861 - CITY
      ?auto_2702863 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2702862 ?auto_2702859 ) ( PERSON-AT ?auto_2702855 ?auto_2702857 ) ( not ( = ?auto_2702850 ?auto_2702857 ) ) ( not ( = ?auto_2702862 ?auto_2702859 ) ) ( PERSON-AT ?auto_2702856 ?auto_2702860 ) ( not ( = ?auto_2702850 ?auto_2702860 ) ) ( PERSON-AT ?auto_2702853 ?auto_2702857 ) ( PERSON-AT ?auto_2702854 ?auto_2702858 ) ( not ( = ?auto_2702850 ?auto_2702858 ) ) ( PERSON-AT ?auto_2702852 ?auto_2702861 ) ( not ( = ?auto_2702850 ?auto_2702861 ) ) ( PERSON-AT ?auto_2702851 ?auto_2702858 ) ( AIRCRAFT-AT ?auto_2702863 ?auto_2702850 ) ( FUEL-LEVEL ?auto_2702863 ?auto_2702862 ) ( not ( = ?auto_2702851 ?auto_2702852 ) ) ( not ( = ?auto_2702861 ?auto_2702858 ) ) ( not ( = ?auto_2702851 ?auto_2702854 ) ) ( not ( = ?auto_2702852 ?auto_2702854 ) ) ( not ( = ?auto_2702851 ?auto_2702853 ) ) ( not ( = ?auto_2702852 ?auto_2702853 ) ) ( not ( = ?auto_2702854 ?auto_2702853 ) ) ( not ( = ?auto_2702857 ?auto_2702858 ) ) ( not ( = ?auto_2702857 ?auto_2702861 ) ) ( not ( = ?auto_2702851 ?auto_2702856 ) ) ( not ( = ?auto_2702852 ?auto_2702856 ) ) ( not ( = ?auto_2702854 ?auto_2702856 ) ) ( not ( = ?auto_2702853 ?auto_2702856 ) ) ( not ( = ?auto_2702860 ?auto_2702857 ) ) ( not ( = ?auto_2702860 ?auto_2702858 ) ) ( not ( = ?auto_2702860 ?auto_2702861 ) ) ( not ( = ?auto_2702851 ?auto_2702855 ) ) ( not ( = ?auto_2702852 ?auto_2702855 ) ) ( not ( = ?auto_2702854 ?auto_2702855 ) ) ( not ( = ?auto_2702853 ?auto_2702855 ) ) ( not ( = ?auto_2702856 ?auto_2702855 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2702851 ?auto_2702852 ?auto_2702854 ?auto_2702853 ?auto_2702855 ?auto_2702856 ?auto_2702850 )
      ( FLY-6PPL-VERIFY ?auto_2702851 ?auto_2702852 ?auto_2702853 ?auto_2702854 ?auto_2702855 ?auto_2702856 ?auto_2702850 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2703082 - PERSON
      ?auto_2703083 - PERSON
      ?auto_2703084 - PERSON
      ?auto_2703085 - PERSON
      ?auto_2703086 - PERSON
      ?auto_2703087 - PERSON
      ?auto_2703081 - CITY
    )
    :vars
    (
      ?auto_2703093 - FLEVEL
      ?auto_2703090 - FLEVEL
      ?auto_2703088 - CITY
      ?auto_2703091 - CITY
      ?auto_2703089 - CITY
      ?auto_2703092 - CITY
      ?auto_2703094 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2703093 ?auto_2703090 ) ( PERSON-AT ?auto_2703087 ?auto_2703088 ) ( not ( = ?auto_2703081 ?auto_2703088 ) ) ( not ( = ?auto_2703093 ?auto_2703090 ) ) ( PERSON-AT ?auto_2703085 ?auto_2703091 ) ( not ( = ?auto_2703081 ?auto_2703091 ) ) ( PERSON-AT ?auto_2703084 ?auto_2703088 ) ( PERSON-AT ?auto_2703086 ?auto_2703089 ) ( not ( = ?auto_2703081 ?auto_2703089 ) ) ( PERSON-AT ?auto_2703083 ?auto_2703092 ) ( not ( = ?auto_2703081 ?auto_2703092 ) ) ( PERSON-AT ?auto_2703082 ?auto_2703089 ) ( AIRCRAFT-AT ?auto_2703094 ?auto_2703081 ) ( FUEL-LEVEL ?auto_2703094 ?auto_2703093 ) ( not ( = ?auto_2703082 ?auto_2703083 ) ) ( not ( = ?auto_2703092 ?auto_2703089 ) ) ( not ( = ?auto_2703082 ?auto_2703086 ) ) ( not ( = ?auto_2703083 ?auto_2703086 ) ) ( not ( = ?auto_2703082 ?auto_2703084 ) ) ( not ( = ?auto_2703083 ?auto_2703084 ) ) ( not ( = ?auto_2703086 ?auto_2703084 ) ) ( not ( = ?auto_2703088 ?auto_2703089 ) ) ( not ( = ?auto_2703088 ?auto_2703092 ) ) ( not ( = ?auto_2703082 ?auto_2703085 ) ) ( not ( = ?auto_2703083 ?auto_2703085 ) ) ( not ( = ?auto_2703086 ?auto_2703085 ) ) ( not ( = ?auto_2703084 ?auto_2703085 ) ) ( not ( = ?auto_2703091 ?auto_2703088 ) ) ( not ( = ?auto_2703091 ?auto_2703089 ) ) ( not ( = ?auto_2703091 ?auto_2703092 ) ) ( not ( = ?auto_2703082 ?auto_2703087 ) ) ( not ( = ?auto_2703083 ?auto_2703087 ) ) ( not ( = ?auto_2703086 ?auto_2703087 ) ) ( not ( = ?auto_2703084 ?auto_2703087 ) ) ( not ( = ?auto_2703085 ?auto_2703087 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2703082 ?auto_2703083 ?auto_2703086 ?auto_2703084 ?auto_2703087 ?auto_2703085 ?auto_2703081 )
      ( FLY-6PPL-VERIFY ?auto_2703082 ?auto_2703083 ?auto_2703084 ?auto_2703085 ?auto_2703086 ?auto_2703087 ?auto_2703081 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2703156 - PERSON
      ?auto_2703157 - PERSON
      ?auto_2703158 - PERSON
      ?auto_2703159 - PERSON
      ?auto_2703160 - PERSON
      ?auto_2703161 - PERSON
      ?auto_2703155 - CITY
    )
    :vars
    (
      ?auto_2703167 - FLEVEL
      ?auto_2703164 - FLEVEL
      ?auto_2703162 - CITY
      ?auto_2703165 - CITY
      ?auto_2703163 - CITY
      ?auto_2703166 - CITY
      ?auto_2703168 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2703167 ?auto_2703164 ) ( PERSON-AT ?auto_2703160 ?auto_2703162 ) ( not ( = ?auto_2703155 ?auto_2703162 ) ) ( not ( = ?auto_2703167 ?auto_2703164 ) ) ( PERSON-AT ?auto_2703159 ?auto_2703165 ) ( not ( = ?auto_2703155 ?auto_2703165 ) ) ( PERSON-AT ?auto_2703158 ?auto_2703162 ) ( PERSON-AT ?auto_2703161 ?auto_2703163 ) ( not ( = ?auto_2703155 ?auto_2703163 ) ) ( PERSON-AT ?auto_2703157 ?auto_2703166 ) ( not ( = ?auto_2703155 ?auto_2703166 ) ) ( PERSON-AT ?auto_2703156 ?auto_2703163 ) ( AIRCRAFT-AT ?auto_2703168 ?auto_2703155 ) ( FUEL-LEVEL ?auto_2703168 ?auto_2703167 ) ( not ( = ?auto_2703156 ?auto_2703157 ) ) ( not ( = ?auto_2703166 ?auto_2703163 ) ) ( not ( = ?auto_2703156 ?auto_2703161 ) ) ( not ( = ?auto_2703157 ?auto_2703161 ) ) ( not ( = ?auto_2703156 ?auto_2703158 ) ) ( not ( = ?auto_2703157 ?auto_2703158 ) ) ( not ( = ?auto_2703161 ?auto_2703158 ) ) ( not ( = ?auto_2703162 ?auto_2703163 ) ) ( not ( = ?auto_2703162 ?auto_2703166 ) ) ( not ( = ?auto_2703156 ?auto_2703159 ) ) ( not ( = ?auto_2703157 ?auto_2703159 ) ) ( not ( = ?auto_2703161 ?auto_2703159 ) ) ( not ( = ?auto_2703158 ?auto_2703159 ) ) ( not ( = ?auto_2703165 ?auto_2703162 ) ) ( not ( = ?auto_2703165 ?auto_2703163 ) ) ( not ( = ?auto_2703165 ?auto_2703166 ) ) ( not ( = ?auto_2703156 ?auto_2703160 ) ) ( not ( = ?auto_2703157 ?auto_2703160 ) ) ( not ( = ?auto_2703161 ?auto_2703160 ) ) ( not ( = ?auto_2703158 ?auto_2703160 ) ) ( not ( = ?auto_2703159 ?auto_2703160 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2703156 ?auto_2703157 ?auto_2703161 ?auto_2703158 ?auto_2703160 ?auto_2703159 ?auto_2703155 )
      ( FLY-6PPL-VERIFY ?auto_2703156 ?auto_2703157 ?auto_2703158 ?auto_2703159 ?auto_2703160 ?auto_2703161 ?auto_2703155 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2703463 - PERSON
      ?auto_2703464 - PERSON
      ?auto_2703465 - PERSON
      ?auto_2703466 - PERSON
      ?auto_2703467 - PERSON
      ?auto_2703468 - PERSON
      ?auto_2703462 - CITY
    )
    :vars
    (
      ?auto_2703474 - FLEVEL
      ?auto_2703471 - FLEVEL
      ?auto_2703469 - CITY
      ?auto_2703472 - CITY
      ?auto_2703470 - CITY
      ?auto_2703473 - CITY
      ?auto_2703475 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2703474 ?auto_2703471 ) ( PERSON-AT ?auto_2703466 ?auto_2703469 ) ( not ( = ?auto_2703462 ?auto_2703469 ) ) ( not ( = ?auto_2703474 ?auto_2703471 ) ) ( PERSON-AT ?auto_2703468 ?auto_2703472 ) ( not ( = ?auto_2703462 ?auto_2703472 ) ) ( PERSON-AT ?auto_2703465 ?auto_2703469 ) ( PERSON-AT ?auto_2703467 ?auto_2703470 ) ( not ( = ?auto_2703462 ?auto_2703470 ) ) ( PERSON-AT ?auto_2703464 ?auto_2703473 ) ( not ( = ?auto_2703462 ?auto_2703473 ) ) ( PERSON-AT ?auto_2703463 ?auto_2703470 ) ( AIRCRAFT-AT ?auto_2703475 ?auto_2703462 ) ( FUEL-LEVEL ?auto_2703475 ?auto_2703474 ) ( not ( = ?auto_2703463 ?auto_2703464 ) ) ( not ( = ?auto_2703473 ?auto_2703470 ) ) ( not ( = ?auto_2703463 ?auto_2703467 ) ) ( not ( = ?auto_2703464 ?auto_2703467 ) ) ( not ( = ?auto_2703463 ?auto_2703465 ) ) ( not ( = ?auto_2703464 ?auto_2703465 ) ) ( not ( = ?auto_2703467 ?auto_2703465 ) ) ( not ( = ?auto_2703469 ?auto_2703470 ) ) ( not ( = ?auto_2703469 ?auto_2703473 ) ) ( not ( = ?auto_2703463 ?auto_2703468 ) ) ( not ( = ?auto_2703464 ?auto_2703468 ) ) ( not ( = ?auto_2703467 ?auto_2703468 ) ) ( not ( = ?auto_2703465 ?auto_2703468 ) ) ( not ( = ?auto_2703472 ?auto_2703469 ) ) ( not ( = ?auto_2703472 ?auto_2703470 ) ) ( not ( = ?auto_2703472 ?auto_2703473 ) ) ( not ( = ?auto_2703463 ?auto_2703466 ) ) ( not ( = ?auto_2703464 ?auto_2703466 ) ) ( not ( = ?auto_2703467 ?auto_2703466 ) ) ( not ( = ?auto_2703465 ?auto_2703466 ) ) ( not ( = ?auto_2703468 ?auto_2703466 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2703463 ?auto_2703464 ?auto_2703467 ?auto_2703465 ?auto_2703466 ?auto_2703468 ?auto_2703462 )
      ( FLY-6PPL-VERIFY ?auto_2703463 ?auto_2703464 ?auto_2703465 ?auto_2703466 ?auto_2703467 ?auto_2703468 ?auto_2703462 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2703616 - PERSON
      ?auto_2703617 - PERSON
      ?auto_2703618 - PERSON
      ?auto_2703619 - PERSON
      ?auto_2703620 - PERSON
      ?auto_2703621 - PERSON
      ?auto_2703615 - CITY
    )
    :vars
    (
      ?auto_2703627 - FLEVEL
      ?auto_2703624 - FLEVEL
      ?auto_2703622 - CITY
      ?auto_2703625 - CITY
      ?auto_2703623 - CITY
      ?auto_2703626 - CITY
      ?auto_2703628 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2703627 ?auto_2703624 ) ( PERSON-AT ?auto_2703619 ?auto_2703622 ) ( not ( = ?auto_2703615 ?auto_2703622 ) ) ( not ( = ?auto_2703627 ?auto_2703624 ) ) ( PERSON-AT ?auto_2703620 ?auto_2703625 ) ( not ( = ?auto_2703615 ?auto_2703625 ) ) ( PERSON-AT ?auto_2703618 ?auto_2703622 ) ( PERSON-AT ?auto_2703621 ?auto_2703623 ) ( not ( = ?auto_2703615 ?auto_2703623 ) ) ( PERSON-AT ?auto_2703617 ?auto_2703626 ) ( not ( = ?auto_2703615 ?auto_2703626 ) ) ( PERSON-AT ?auto_2703616 ?auto_2703623 ) ( AIRCRAFT-AT ?auto_2703628 ?auto_2703615 ) ( FUEL-LEVEL ?auto_2703628 ?auto_2703627 ) ( not ( = ?auto_2703616 ?auto_2703617 ) ) ( not ( = ?auto_2703626 ?auto_2703623 ) ) ( not ( = ?auto_2703616 ?auto_2703621 ) ) ( not ( = ?auto_2703617 ?auto_2703621 ) ) ( not ( = ?auto_2703616 ?auto_2703618 ) ) ( not ( = ?auto_2703617 ?auto_2703618 ) ) ( not ( = ?auto_2703621 ?auto_2703618 ) ) ( not ( = ?auto_2703622 ?auto_2703623 ) ) ( not ( = ?auto_2703622 ?auto_2703626 ) ) ( not ( = ?auto_2703616 ?auto_2703620 ) ) ( not ( = ?auto_2703617 ?auto_2703620 ) ) ( not ( = ?auto_2703621 ?auto_2703620 ) ) ( not ( = ?auto_2703618 ?auto_2703620 ) ) ( not ( = ?auto_2703625 ?auto_2703622 ) ) ( not ( = ?auto_2703625 ?auto_2703623 ) ) ( not ( = ?auto_2703625 ?auto_2703626 ) ) ( not ( = ?auto_2703616 ?auto_2703619 ) ) ( not ( = ?auto_2703617 ?auto_2703619 ) ) ( not ( = ?auto_2703621 ?auto_2703619 ) ) ( not ( = ?auto_2703618 ?auto_2703619 ) ) ( not ( = ?auto_2703620 ?auto_2703619 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2703616 ?auto_2703617 ?auto_2703621 ?auto_2703618 ?auto_2703619 ?auto_2703620 ?auto_2703615 )
      ( FLY-6PPL-VERIFY ?auto_2703616 ?auto_2703617 ?auto_2703618 ?auto_2703619 ?auto_2703620 ?auto_2703621 ?auto_2703615 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2704158 - PERSON
      ?auto_2704159 - PERSON
      ?auto_2704160 - PERSON
      ?auto_2704161 - PERSON
      ?auto_2704162 - PERSON
      ?auto_2704163 - PERSON
      ?auto_2704157 - CITY
    )
    :vars
    (
      ?auto_2704169 - FLEVEL
      ?auto_2704166 - FLEVEL
      ?auto_2704164 - CITY
      ?auto_2704167 - CITY
      ?auto_2704165 - CITY
      ?auto_2704168 - CITY
      ?auto_2704170 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2704169 ?auto_2704166 ) ( PERSON-AT ?auto_2704163 ?auto_2704164 ) ( not ( = ?auto_2704157 ?auto_2704164 ) ) ( not ( = ?auto_2704169 ?auto_2704166 ) ) ( PERSON-AT ?auto_2704160 ?auto_2704167 ) ( not ( = ?auto_2704157 ?auto_2704167 ) ) ( PERSON-AT ?auto_2704162 ?auto_2704164 ) ( PERSON-AT ?auto_2704161 ?auto_2704165 ) ( not ( = ?auto_2704157 ?auto_2704165 ) ) ( PERSON-AT ?auto_2704159 ?auto_2704168 ) ( not ( = ?auto_2704157 ?auto_2704168 ) ) ( PERSON-AT ?auto_2704158 ?auto_2704165 ) ( AIRCRAFT-AT ?auto_2704170 ?auto_2704157 ) ( FUEL-LEVEL ?auto_2704170 ?auto_2704169 ) ( not ( = ?auto_2704158 ?auto_2704159 ) ) ( not ( = ?auto_2704168 ?auto_2704165 ) ) ( not ( = ?auto_2704158 ?auto_2704161 ) ) ( not ( = ?auto_2704159 ?auto_2704161 ) ) ( not ( = ?auto_2704158 ?auto_2704162 ) ) ( not ( = ?auto_2704159 ?auto_2704162 ) ) ( not ( = ?auto_2704161 ?auto_2704162 ) ) ( not ( = ?auto_2704164 ?auto_2704165 ) ) ( not ( = ?auto_2704164 ?auto_2704168 ) ) ( not ( = ?auto_2704158 ?auto_2704160 ) ) ( not ( = ?auto_2704159 ?auto_2704160 ) ) ( not ( = ?auto_2704161 ?auto_2704160 ) ) ( not ( = ?auto_2704162 ?auto_2704160 ) ) ( not ( = ?auto_2704167 ?auto_2704164 ) ) ( not ( = ?auto_2704167 ?auto_2704165 ) ) ( not ( = ?auto_2704167 ?auto_2704168 ) ) ( not ( = ?auto_2704158 ?auto_2704163 ) ) ( not ( = ?auto_2704159 ?auto_2704163 ) ) ( not ( = ?auto_2704161 ?auto_2704163 ) ) ( not ( = ?auto_2704162 ?auto_2704163 ) ) ( not ( = ?auto_2704160 ?auto_2704163 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2704158 ?auto_2704159 ?auto_2704161 ?auto_2704162 ?auto_2704163 ?auto_2704160 ?auto_2704157 )
      ( FLY-6PPL-VERIFY ?auto_2704158 ?auto_2704159 ?auto_2704160 ?auto_2704161 ?auto_2704162 ?auto_2704163 ?auto_2704157 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2704299 - PERSON
      ?auto_2704300 - PERSON
      ?auto_2704301 - PERSON
      ?auto_2704302 - PERSON
      ?auto_2704303 - PERSON
      ?auto_2704304 - PERSON
      ?auto_2704298 - CITY
    )
    :vars
    (
      ?auto_2704310 - FLEVEL
      ?auto_2704307 - FLEVEL
      ?auto_2704305 - CITY
      ?auto_2704308 - CITY
      ?auto_2704306 - CITY
      ?auto_2704309 - CITY
      ?auto_2704311 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2704310 ?auto_2704307 ) ( PERSON-AT ?auto_2704304 ?auto_2704305 ) ( not ( = ?auto_2704298 ?auto_2704305 ) ) ( not ( = ?auto_2704310 ?auto_2704307 ) ) ( PERSON-AT ?auto_2704301 ?auto_2704308 ) ( not ( = ?auto_2704298 ?auto_2704308 ) ) ( PERSON-AT ?auto_2704302 ?auto_2704305 ) ( PERSON-AT ?auto_2704303 ?auto_2704306 ) ( not ( = ?auto_2704298 ?auto_2704306 ) ) ( PERSON-AT ?auto_2704300 ?auto_2704309 ) ( not ( = ?auto_2704298 ?auto_2704309 ) ) ( PERSON-AT ?auto_2704299 ?auto_2704306 ) ( AIRCRAFT-AT ?auto_2704311 ?auto_2704298 ) ( FUEL-LEVEL ?auto_2704311 ?auto_2704310 ) ( not ( = ?auto_2704299 ?auto_2704300 ) ) ( not ( = ?auto_2704309 ?auto_2704306 ) ) ( not ( = ?auto_2704299 ?auto_2704303 ) ) ( not ( = ?auto_2704300 ?auto_2704303 ) ) ( not ( = ?auto_2704299 ?auto_2704302 ) ) ( not ( = ?auto_2704300 ?auto_2704302 ) ) ( not ( = ?auto_2704303 ?auto_2704302 ) ) ( not ( = ?auto_2704305 ?auto_2704306 ) ) ( not ( = ?auto_2704305 ?auto_2704309 ) ) ( not ( = ?auto_2704299 ?auto_2704301 ) ) ( not ( = ?auto_2704300 ?auto_2704301 ) ) ( not ( = ?auto_2704303 ?auto_2704301 ) ) ( not ( = ?auto_2704302 ?auto_2704301 ) ) ( not ( = ?auto_2704308 ?auto_2704305 ) ) ( not ( = ?auto_2704308 ?auto_2704306 ) ) ( not ( = ?auto_2704308 ?auto_2704309 ) ) ( not ( = ?auto_2704299 ?auto_2704304 ) ) ( not ( = ?auto_2704300 ?auto_2704304 ) ) ( not ( = ?auto_2704303 ?auto_2704304 ) ) ( not ( = ?auto_2704302 ?auto_2704304 ) ) ( not ( = ?auto_2704301 ?auto_2704304 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2704299 ?auto_2704300 ?auto_2704303 ?auto_2704302 ?auto_2704304 ?auto_2704301 ?auto_2704298 )
      ( FLY-6PPL-VERIFY ?auto_2704299 ?auto_2704300 ?auto_2704301 ?auto_2704302 ?auto_2704303 ?auto_2704304 ?auto_2704298 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2704373 - PERSON
      ?auto_2704374 - PERSON
      ?auto_2704375 - PERSON
      ?auto_2704376 - PERSON
      ?auto_2704377 - PERSON
      ?auto_2704378 - PERSON
      ?auto_2704372 - CITY
    )
    :vars
    (
      ?auto_2704384 - FLEVEL
      ?auto_2704381 - FLEVEL
      ?auto_2704379 - CITY
      ?auto_2704382 - CITY
      ?auto_2704380 - CITY
      ?auto_2704383 - CITY
      ?auto_2704385 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2704384 ?auto_2704381 ) ( PERSON-AT ?auto_2704377 ?auto_2704379 ) ( not ( = ?auto_2704372 ?auto_2704379 ) ) ( not ( = ?auto_2704384 ?auto_2704381 ) ) ( PERSON-AT ?auto_2704375 ?auto_2704382 ) ( not ( = ?auto_2704372 ?auto_2704382 ) ) ( PERSON-AT ?auto_2704376 ?auto_2704379 ) ( PERSON-AT ?auto_2704378 ?auto_2704380 ) ( not ( = ?auto_2704372 ?auto_2704380 ) ) ( PERSON-AT ?auto_2704374 ?auto_2704383 ) ( not ( = ?auto_2704372 ?auto_2704383 ) ) ( PERSON-AT ?auto_2704373 ?auto_2704380 ) ( AIRCRAFT-AT ?auto_2704385 ?auto_2704372 ) ( FUEL-LEVEL ?auto_2704385 ?auto_2704384 ) ( not ( = ?auto_2704373 ?auto_2704374 ) ) ( not ( = ?auto_2704383 ?auto_2704380 ) ) ( not ( = ?auto_2704373 ?auto_2704378 ) ) ( not ( = ?auto_2704374 ?auto_2704378 ) ) ( not ( = ?auto_2704373 ?auto_2704376 ) ) ( not ( = ?auto_2704374 ?auto_2704376 ) ) ( not ( = ?auto_2704378 ?auto_2704376 ) ) ( not ( = ?auto_2704379 ?auto_2704380 ) ) ( not ( = ?auto_2704379 ?auto_2704383 ) ) ( not ( = ?auto_2704373 ?auto_2704375 ) ) ( not ( = ?auto_2704374 ?auto_2704375 ) ) ( not ( = ?auto_2704378 ?auto_2704375 ) ) ( not ( = ?auto_2704376 ?auto_2704375 ) ) ( not ( = ?auto_2704382 ?auto_2704379 ) ) ( not ( = ?auto_2704382 ?auto_2704380 ) ) ( not ( = ?auto_2704382 ?auto_2704383 ) ) ( not ( = ?auto_2704373 ?auto_2704377 ) ) ( not ( = ?auto_2704374 ?auto_2704377 ) ) ( not ( = ?auto_2704378 ?auto_2704377 ) ) ( not ( = ?auto_2704376 ?auto_2704377 ) ) ( not ( = ?auto_2704375 ?auto_2704377 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2704373 ?auto_2704374 ?auto_2704378 ?auto_2704376 ?auto_2704377 ?auto_2704375 ?auto_2704372 )
      ( FLY-6PPL-VERIFY ?auto_2704373 ?auto_2704374 ?auto_2704375 ?auto_2704376 ?auto_2704377 ?auto_2704378 ?auto_2704372 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2710534 - PERSON
      ?auto_2710535 - PERSON
      ?auto_2710536 - PERSON
      ?auto_2710537 - PERSON
      ?auto_2710538 - PERSON
      ?auto_2710539 - PERSON
      ?auto_2710533 - CITY
    )
    :vars
    (
      ?auto_2710545 - FLEVEL
      ?auto_2710542 - FLEVEL
      ?auto_2710540 - CITY
      ?auto_2710543 - CITY
      ?auto_2710541 - CITY
      ?auto_2710544 - CITY
      ?auto_2710546 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2710545 ?auto_2710542 ) ( PERSON-AT ?auto_2710539 ?auto_2710540 ) ( not ( = ?auto_2710533 ?auto_2710540 ) ) ( not ( = ?auto_2710545 ?auto_2710542 ) ) ( PERSON-AT ?auto_2710538 ?auto_2710543 ) ( not ( = ?auto_2710533 ?auto_2710543 ) ) ( PERSON-AT ?auto_2710537 ?auto_2710540 ) ( PERSON-AT ?auto_2710535 ?auto_2710541 ) ( not ( = ?auto_2710533 ?auto_2710541 ) ) ( PERSON-AT ?auto_2710536 ?auto_2710544 ) ( not ( = ?auto_2710533 ?auto_2710544 ) ) ( PERSON-AT ?auto_2710534 ?auto_2710541 ) ( AIRCRAFT-AT ?auto_2710546 ?auto_2710533 ) ( FUEL-LEVEL ?auto_2710546 ?auto_2710545 ) ( not ( = ?auto_2710534 ?auto_2710536 ) ) ( not ( = ?auto_2710544 ?auto_2710541 ) ) ( not ( = ?auto_2710534 ?auto_2710535 ) ) ( not ( = ?auto_2710536 ?auto_2710535 ) ) ( not ( = ?auto_2710534 ?auto_2710537 ) ) ( not ( = ?auto_2710536 ?auto_2710537 ) ) ( not ( = ?auto_2710535 ?auto_2710537 ) ) ( not ( = ?auto_2710540 ?auto_2710541 ) ) ( not ( = ?auto_2710540 ?auto_2710544 ) ) ( not ( = ?auto_2710534 ?auto_2710538 ) ) ( not ( = ?auto_2710536 ?auto_2710538 ) ) ( not ( = ?auto_2710535 ?auto_2710538 ) ) ( not ( = ?auto_2710537 ?auto_2710538 ) ) ( not ( = ?auto_2710543 ?auto_2710540 ) ) ( not ( = ?auto_2710543 ?auto_2710541 ) ) ( not ( = ?auto_2710543 ?auto_2710544 ) ) ( not ( = ?auto_2710534 ?auto_2710539 ) ) ( not ( = ?auto_2710536 ?auto_2710539 ) ) ( not ( = ?auto_2710535 ?auto_2710539 ) ) ( not ( = ?auto_2710537 ?auto_2710539 ) ) ( not ( = ?auto_2710538 ?auto_2710539 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2710534 ?auto_2710536 ?auto_2710535 ?auto_2710537 ?auto_2710539 ?auto_2710538 ?auto_2710533 )
      ( FLY-6PPL-VERIFY ?auto_2710534 ?auto_2710535 ?auto_2710536 ?auto_2710537 ?auto_2710538 ?auto_2710539 ?auto_2710533 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2710608 - PERSON
      ?auto_2710609 - PERSON
      ?auto_2710610 - PERSON
      ?auto_2710611 - PERSON
      ?auto_2710612 - PERSON
      ?auto_2710613 - PERSON
      ?auto_2710607 - CITY
    )
    :vars
    (
      ?auto_2710619 - FLEVEL
      ?auto_2710616 - FLEVEL
      ?auto_2710614 - CITY
      ?auto_2710617 - CITY
      ?auto_2710615 - CITY
      ?auto_2710618 - CITY
      ?auto_2710620 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2710619 ?auto_2710616 ) ( PERSON-AT ?auto_2710612 ?auto_2710614 ) ( not ( = ?auto_2710607 ?auto_2710614 ) ) ( not ( = ?auto_2710619 ?auto_2710616 ) ) ( PERSON-AT ?auto_2710613 ?auto_2710617 ) ( not ( = ?auto_2710607 ?auto_2710617 ) ) ( PERSON-AT ?auto_2710611 ?auto_2710614 ) ( PERSON-AT ?auto_2710609 ?auto_2710615 ) ( not ( = ?auto_2710607 ?auto_2710615 ) ) ( PERSON-AT ?auto_2710610 ?auto_2710618 ) ( not ( = ?auto_2710607 ?auto_2710618 ) ) ( PERSON-AT ?auto_2710608 ?auto_2710615 ) ( AIRCRAFT-AT ?auto_2710620 ?auto_2710607 ) ( FUEL-LEVEL ?auto_2710620 ?auto_2710619 ) ( not ( = ?auto_2710608 ?auto_2710610 ) ) ( not ( = ?auto_2710618 ?auto_2710615 ) ) ( not ( = ?auto_2710608 ?auto_2710609 ) ) ( not ( = ?auto_2710610 ?auto_2710609 ) ) ( not ( = ?auto_2710608 ?auto_2710611 ) ) ( not ( = ?auto_2710610 ?auto_2710611 ) ) ( not ( = ?auto_2710609 ?auto_2710611 ) ) ( not ( = ?auto_2710614 ?auto_2710615 ) ) ( not ( = ?auto_2710614 ?auto_2710618 ) ) ( not ( = ?auto_2710608 ?auto_2710613 ) ) ( not ( = ?auto_2710610 ?auto_2710613 ) ) ( not ( = ?auto_2710609 ?auto_2710613 ) ) ( not ( = ?auto_2710611 ?auto_2710613 ) ) ( not ( = ?auto_2710617 ?auto_2710614 ) ) ( not ( = ?auto_2710617 ?auto_2710615 ) ) ( not ( = ?auto_2710617 ?auto_2710618 ) ) ( not ( = ?auto_2710608 ?auto_2710612 ) ) ( not ( = ?auto_2710610 ?auto_2710612 ) ) ( not ( = ?auto_2710609 ?auto_2710612 ) ) ( not ( = ?auto_2710611 ?auto_2710612 ) ) ( not ( = ?auto_2710613 ?auto_2710612 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2710608 ?auto_2710610 ?auto_2710609 ?auto_2710611 ?auto_2710612 ?auto_2710613 ?auto_2710607 )
      ( FLY-6PPL-VERIFY ?auto_2710608 ?auto_2710609 ?auto_2710610 ?auto_2710611 ?auto_2710612 ?auto_2710613 ?auto_2710607 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2710682 - PERSON
      ?auto_2710683 - PERSON
      ?auto_2710684 - PERSON
      ?auto_2710685 - PERSON
      ?auto_2710686 - PERSON
      ?auto_2710687 - PERSON
      ?auto_2710681 - CITY
    )
    :vars
    (
      ?auto_2710693 - FLEVEL
      ?auto_2710690 - FLEVEL
      ?auto_2710688 - CITY
      ?auto_2710691 - CITY
      ?auto_2710689 - CITY
      ?auto_2710692 - CITY
      ?auto_2710694 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2710693 ?auto_2710690 ) ( PERSON-AT ?auto_2710687 ?auto_2710688 ) ( not ( = ?auto_2710681 ?auto_2710688 ) ) ( not ( = ?auto_2710693 ?auto_2710690 ) ) ( PERSON-AT ?auto_2710685 ?auto_2710691 ) ( not ( = ?auto_2710681 ?auto_2710691 ) ) ( PERSON-AT ?auto_2710686 ?auto_2710688 ) ( PERSON-AT ?auto_2710683 ?auto_2710689 ) ( not ( = ?auto_2710681 ?auto_2710689 ) ) ( PERSON-AT ?auto_2710684 ?auto_2710692 ) ( not ( = ?auto_2710681 ?auto_2710692 ) ) ( PERSON-AT ?auto_2710682 ?auto_2710689 ) ( AIRCRAFT-AT ?auto_2710694 ?auto_2710681 ) ( FUEL-LEVEL ?auto_2710694 ?auto_2710693 ) ( not ( = ?auto_2710682 ?auto_2710684 ) ) ( not ( = ?auto_2710692 ?auto_2710689 ) ) ( not ( = ?auto_2710682 ?auto_2710683 ) ) ( not ( = ?auto_2710684 ?auto_2710683 ) ) ( not ( = ?auto_2710682 ?auto_2710686 ) ) ( not ( = ?auto_2710684 ?auto_2710686 ) ) ( not ( = ?auto_2710683 ?auto_2710686 ) ) ( not ( = ?auto_2710688 ?auto_2710689 ) ) ( not ( = ?auto_2710688 ?auto_2710692 ) ) ( not ( = ?auto_2710682 ?auto_2710685 ) ) ( not ( = ?auto_2710684 ?auto_2710685 ) ) ( not ( = ?auto_2710683 ?auto_2710685 ) ) ( not ( = ?auto_2710686 ?auto_2710685 ) ) ( not ( = ?auto_2710691 ?auto_2710688 ) ) ( not ( = ?auto_2710691 ?auto_2710689 ) ) ( not ( = ?auto_2710691 ?auto_2710692 ) ) ( not ( = ?auto_2710682 ?auto_2710687 ) ) ( not ( = ?auto_2710684 ?auto_2710687 ) ) ( not ( = ?auto_2710683 ?auto_2710687 ) ) ( not ( = ?auto_2710686 ?auto_2710687 ) ) ( not ( = ?auto_2710685 ?auto_2710687 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2710682 ?auto_2710684 ?auto_2710683 ?auto_2710686 ?auto_2710687 ?auto_2710685 ?auto_2710681 )
      ( FLY-6PPL-VERIFY ?auto_2710682 ?auto_2710683 ?auto_2710684 ?auto_2710685 ?auto_2710686 ?auto_2710687 ?auto_2710681 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2713022 - PERSON
      ?auto_2713023 - PERSON
      ?auto_2713024 - PERSON
      ?auto_2713025 - PERSON
      ?auto_2713026 - PERSON
      ?auto_2713027 - PERSON
      ?auto_2713021 - CITY
    )
    :vars
    (
      ?auto_2713033 - FLEVEL
      ?auto_2713030 - FLEVEL
      ?auto_2713028 - CITY
      ?auto_2713031 - CITY
      ?auto_2713029 - CITY
      ?auto_2713032 - CITY
      ?auto_2713034 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2713033 ?auto_2713030 ) ( PERSON-AT ?auto_2713027 ?auto_2713028 ) ( not ( = ?auto_2713021 ?auto_2713028 ) ) ( not ( = ?auto_2713033 ?auto_2713030 ) ) ( PERSON-AT ?auto_2713026 ?auto_2713031 ) ( not ( = ?auto_2713021 ?auto_2713031 ) ) ( PERSON-AT ?auto_2713024 ?auto_2713028 ) ( PERSON-AT ?auto_2713023 ?auto_2713029 ) ( not ( = ?auto_2713021 ?auto_2713029 ) ) ( PERSON-AT ?auto_2713025 ?auto_2713032 ) ( not ( = ?auto_2713021 ?auto_2713032 ) ) ( PERSON-AT ?auto_2713022 ?auto_2713029 ) ( AIRCRAFT-AT ?auto_2713034 ?auto_2713021 ) ( FUEL-LEVEL ?auto_2713034 ?auto_2713033 ) ( not ( = ?auto_2713022 ?auto_2713025 ) ) ( not ( = ?auto_2713032 ?auto_2713029 ) ) ( not ( = ?auto_2713022 ?auto_2713023 ) ) ( not ( = ?auto_2713025 ?auto_2713023 ) ) ( not ( = ?auto_2713022 ?auto_2713024 ) ) ( not ( = ?auto_2713025 ?auto_2713024 ) ) ( not ( = ?auto_2713023 ?auto_2713024 ) ) ( not ( = ?auto_2713028 ?auto_2713029 ) ) ( not ( = ?auto_2713028 ?auto_2713032 ) ) ( not ( = ?auto_2713022 ?auto_2713026 ) ) ( not ( = ?auto_2713025 ?auto_2713026 ) ) ( not ( = ?auto_2713023 ?auto_2713026 ) ) ( not ( = ?auto_2713024 ?auto_2713026 ) ) ( not ( = ?auto_2713031 ?auto_2713028 ) ) ( not ( = ?auto_2713031 ?auto_2713029 ) ) ( not ( = ?auto_2713031 ?auto_2713032 ) ) ( not ( = ?auto_2713022 ?auto_2713027 ) ) ( not ( = ?auto_2713025 ?auto_2713027 ) ) ( not ( = ?auto_2713023 ?auto_2713027 ) ) ( not ( = ?auto_2713024 ?auto_2713027 ) ) ( not ( = ?auto_2713026 ?auto_2713027 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2713022 ?auto_2713025 ?auto_2713023 ?auto_2713024 ?auto_2713027 ?auto_2713026 ?auto_2713021 )
      ( FLY-6PPL-VERIFY ?auto_2713022 ?auto_2713023 ?auto_2713024 ?auto_2713025 ?auto_2713026 ?auto_2713027 ?auto_2713021 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2713096 - PERSON
      ?auto_2713097 - PERSON
      ?auto_2713098 - PERSON
      ?auto_2713099 - PERSON
      ?auto_2713100 - PERSON
      ?auto_2713101 - PERSON
      ?auto_2713095 - CITY
    )
    :vars
    (
      ?auto_2713107 - FLEVEL
      ?auto_2713104 - FLEVEL
      ?auto_2713102 - CITY
      ?auto_2713105 - CITY
      ?auto_2713103 - CITY
      ?auto_2713106 - CITY
      ?auto_2713108 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2713107 ?auto_2713104 ) ( PERSON-AT ?auto_2713100 ?auto_2713102 ) ( not ( = ?auto_2713095 ?auto_2713102 ) ) ( not ( = ?auto_2713107 ?auto_2713104 ) ) ( PERSON-AT ?auto_2713101 ?auto_2713105 ) ( not ( = ?auto_2713095 ?auto_2713105 ) ) ( PERSON-AT ?auto_2713098 ?auto_2713102 ) ( PERSON-AT ?auto_2713097 ?auto_2713103 ) ( not ( = ?auto_2713095 ?auto_2713103 ) ) ( PERSON-AT ?auto_2713099 ?auto_2713106 ) ( not ( = ?auto_2713095 ?auto_2713106 ) ) ( PERSON-AT ?auto_2713096 ?auto_2713103 ) ( AIRCRAFT-AT ?auto_2713108 ?auto_2713095 ) ( FUEL-LEVEL ?auto_2713108 ?auto_2713107 ) ( not ( = ?auto_2713096 ?auto_2713099 ) ) ( not ( = ?auto_2713106 ?auto_2713103 ) ) ( not ( = ?auto_2713096 ?auto_2713097 ) ) ( not ( = ?auto_2713099 ?auto_2713097 ) ) ( not ( = ?auto_2713096 ?auto_2713098 ) ) ( not ( = ?auto_2713099 ?auto_2713098 ) ) ( not ( = ?auto_2713097 ?auto_2713098 ) ) ( not ( = ?auto_2713102 ?auto_2713103 ) ) ( not ( = ?auto_2713102 ?auto_2713106 ) ) ( not ( = ?auto_2713096 ?auto_2713101 ) ) ( not ( = ?auto_2713099 ?auto_2713101 ) ) ( not ( = ?auto_2713097 ?auto_2713101 ) ) ( not ( = ?auto_2713098 ?auto_2713101 ) ) ( not ( = ?auto_2713105 ?auto_2713102 ) ) ( not ( = ?auto_2713105 ?auto_2713103 ) ) ( not ( = ?auto_2713105 ?auto_2713106 ) ) ( not ( = ?auto_2713096 ?auto_2713100 ) ) ( not ( = ?auto_2713099 ?auto_2713100 ) ) ( not ( = ?auto_2713097 ?auto_2713100 ) ) ( not ( = ?auto_2713098 ?auto_2713100 ) ) ( not ( = ?auto_2713101 ?auto_2713100 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2713096 ?auto_2713099 ?auto_2713097 ?auto_2713098 ?auto_2713100 ?auto_2713101 ?auto_2713095 )
      ( FLY-6PPL-VERIFY ?auto_2713096 ?auto_2713097 ?auto_2713098 ?auto_2713099 ?auto_2713100 ?auto_2713101 ?auto_2713095 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2713772 - PERSON
      ?auto_2713773 - PERSON
      ?auto_2713774 - PERSON
      ?auto_2713775 - PERSON
      ?auto_2713776 - PERSON
      ?auto_2713777 - PERSON
      ?auto_2713771 - CITY
    )
    :vars
    (
      ?auto_2713783 - FLEVEL
      ?auto_2713780 - FLEVEL
      ?auto_2713778 - CITY
      ?auto_2713781 - CITY
      ?auto_2713779 - CITY
      ?auto_2713782 - CITY
      ?auto_2713784 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2713783 ?auto_2713780 ) ( PERSON-AT ?auto_2713775 ?auto_2713778 ) ( not ( = ?auto_2713771 ?auto_2713778 ) ) ( not ( = ?auto_2713783 ?auto_2713780 ) ) ( PERSON-AT ?auto_2713777 ?auto_2713781 ) ( not ( = ?auto_2713771 ?auto_2713781 ) ) ( PERSON-AT ?auto_2713774 ?auto_2713778 ) ( PERSON-AT ?auto_2713773 ?auto_2713779 ) ( not ( = ?auto_2713771 ?auto_2713779 ) ) ( PERSON-AT ?auto_2713776 ?auto_2713782 ) ( not ( = ?auto_2713771 ?auto_2713782 ) ) ( PERSON-AT ?auto_2713772 ?auto_2713779 ) ( AIRCRAFT-AT ?auto_2713784 ?auto_2713771 ) ( FUEL-LEVEL ?auto_2713784 ?auto_2713783 ) ( not ( = ?auto_2713772 ?auto_2713776 ) ) ( not ( = ?auto_2713782 ?auto_2713779 ) ) ( not ( = ?auto_2713772 ?auto_2713773 ) ) ( not ( = ?auto_2713776 ?auto_2713773 ) ) ( not ( = ?auto_2713772 ?auto_2713774 ) ) ( not ( = ?auto_2713776 ?auto_2713774 ) ) ( not ( = ?auto_2713773 ?auto_2713774 ) ) ( not ( = ?auto_2713778 ?auto_2713779 ) ) ( not ( = ?auto_2713778 ?auto_2713782 ) ) ( not ( = ?auto_2713772 ?auto_2713777 ) ) ( not ( = ?auto_2713776 ?auto_2713777 ) ) ( not ( = ?auto_2713773 ?auto_2713777 ) ) ( not ( = ?auto_2713774 ?auto_2713777 ) ) ( not ( = ?auto_2713781 ?auto_2713778 ) ) ( not ( = ?auto_2713781 ?auto_2713779 ) ) ( not ( = ?auto_2713781 ?auto_2713782 ) ) ( not ( = ?auto_2713772 ?auto_2713775 ) ) ( not ( = ?auto_2713776 ?auto_2713775 ) ) ( not ( = ?auto_2713773 ?auto_2713775 ) ) ( not ( = ?auto_2713774 ?auto_2713775 ) ) ( not ( = ?auto_2713777 ?auto_2713775 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2713772 ?auto_2713776 ?auto_2713773 ?auto_2713774 ?auto_2713775 ?auto_2713777 ?auto_2713771 )
      ( FLY-6PPL-VERIFY ?auto_2713772 ?auto_2713773 ?auto_2713774 ?auto_2713775 ?auto_2713776 ?auto_2713777 ?auto_2713771 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2720737 - PERSON
      ?auto_2720738 - PERSON
      ?auto_2720739 - PERSON
      ?auto_2720740 - PERSON
      ?auto_2720741 - PERSON
      ?auto_2720742 - PERSON
      ?auto_2720736 - CITY
    )
    :vars
    (
      ?auto_2720748 - FLEVEL
      ?auto_2720745 - FLEVEL
      ?auto_2720743 - CITY
      ?auto_2720746 - CITY
      ?auto_2720744 - CITY
      ?auto_2720747 - CITY
      ?auto_2720749 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2720748 ?auto_2720745 ) ( PERSON-AT ?auto_2720742 ?auto_2720743 ) ( not ( = ?auto_2720736 ?auto_2720743 ) ) ( not ( = ?auto_2720748 ?auto_2720745 ) ) ( PERSON-AT ?auto_2720741 ?auto_2720746 ) ( not ( = ?auto_2720736 ?auto_2720746 ) ) ( PERSON-AT ?auto_2720738 ?auto_2720743 ) ( PERSON-AT ?auto_2720740 ?auto_2720744 ) ( not ( = ?auto_2720736 ?auto_2720744 ) ) ( PERSON-AT ?auto_2720739 ?auto_2720747 ) ( not ( = ?auto_2720736 ?auto_2720747 ) ) ( PERSON-AT ?auto_2720737 ?auto_2720744 ) ( AIRCRAFT-AT ?auto_2720749 ?auto_2720736 ) ( FUEL-LEVEL ?auto_2720749 ?auto_2720748 ) ( not ( = ?auto_2720737 ?auto_2720739 ) ) ( not ( = ?auto_2720747 ?auto_2720744 ) ) ( not ( = ?auto_2720737 ?auto_2720740 ) ) ( not ( = ?auto_2720739 ?auto_2720740 ) ) ( not ( = ?auto_2720737 ?auto_2720738 ) ) ( not ( = ?auto_2720739 ?auto_2720738 ) ) ( not ( = ?auto_2720740 ?auto_2720738 ) ) ( not ( = ?auto_2720743 ?auto_2720744 ) ) ( not ( = ?auto_2720743 ?auto_2720747 ) ) ( not ( = ?auto_2720737 ?auto_2720741 ) ) ( not ( = ?auto_2720739 ?auto_2720741 ) ) ( not ( = ?auto_2720740 ?auto_2720741 ) ) ( not ( = ?auto_2720738 ?auto_2720741 ) ) ( not ( = ?auto_2720746 ?auto_2720743 ) ) ( not ( = ?auto_2720746 ?auto_2720744 ) ) ( not ( = ?auto_2720746 ?auto_2720747 ) ) ( not ( = ?auto_2720737 ?auto_2720742 ) ) ( not ( = ?auto_2720739 ?auto_2720742 ) ) ( not ( = ?auto_2720740 ?auto_2720742 ) ) ( not ( = ?auto_2720738 ?auto_2720742 ) ) ( not ( = ?auto_2720741 ?auto_2720742 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2720737 ?auto_2720739 ?auto_2720740 ?auto_2720738 ?auto_2720742 ?auto_2720741 ?auto_2720736 )
      ( FLY-6PPL-VERIFY ?auto_2720737 ?auto_2720738 ?auto_2720739 ?auto_2720740 ?auto_2720741 ?auto_2720742 ?auto_2720736 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2720811 - PERSON
      ?auto_2720812 - PERSON
      ?auto_2720813 - PERSON
      ?auto_2720814 - PERSON
      ?auto_2720815 - PERSON
      ?auto_2720816 - PERSON
      ?auto_2720810 - CITY
    )
    :vars
    (
      ?auto_2720822 - FLEVEL
      ?auto_2720819 - FLEVEL
      ?auto_2720817 - CITY
      ?auto_2720820 - CITY
      ?auto_2720818 - CITY
      ?auto_2720821 - CITY
      ?auto_2720823 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2720822 ?auto_2720819 ) ( PERSON-AT ?auto_2720815 ?auto_2720817 ) ( not ( = ?auto_2720810 ?auto_2720817 ) ) ( not ( = ?auto_2720822 ?auto_2720819 ) ) ( PERSON-AT ?auto_2720816 ?auto_2720820 ) ( not ( = ?auto_2720810 ?auto_2720820 ) ) ( PERSON-AT ?auto_2720812 ?auto_2720817 ) ( PERSON-AT ?auto_2720814 ?auto_2720818 ) ( not ( = ?auto_2720810 ?auto_2720818 ) ) ( PERSON-AT ?auto_2720813 ?auto_2720821 ) ( not ( = ?auto_2720810 ?auto_2720821 ) ) ( PERSON-AT ?auto_2720811 ?auto_2720818 ) ( AIRCRAFT-AT ?auto_2720823 ?auto_2720810 ) ( FUEL-LEVEL ?auto_2720823 ?auto_2720822 ) ( not ( = ?auto_2720811 ?auto_2720813 ) ) ( not ( = ?auto_2720821 ?auto_2720818 ) ) ( not ( = ?auto_2720811 ?auto_2720814 ) ) ( not ( = ?auto_2720813 ?auto_2720814 ) ) ( not ( = ?auto_2720811 ?auto_2720812 ) ) ( not ( = ?auto_2720813 ?auto_2720812 ) ) ( not ( = ?auto_2720814 ?auto_2720812 ) ) ( not ( = ?auto_2720817 ?auto_2720818 ) ) ( not ( = ?auto_2720817 ?auto_2720821 ) ) ( not ( = ?auto_2720811 ?auto_2720816 ) ) ( not ( = ?auto_2720813 ?auto_2720816 ) ) ( not ( = ?auto_2720814 ?auto_2720816 ) ) ( not ( = ?auto_2720812 ?auto_2720816 ) ) ( not ( = ?auto_2720820 ?auto_2720817 ) ) ( not ( = ?auto_2720820 ?auto_2720818 ) ) ( not ( = ?auto_2720820 ?auto_2720821 ) ) ( not ( = ?auto_2720811 ?auto_2720815 ) ) ( not ( = ?auto_2720813 ?auto_2720815 ) ) ( not ( = ?auto_2720814 ?auto_2720815 ) ) ( not ( = ?auto_2720812 ?auto_2720815 ) ) ( not ( = ?auto_2720816 ?auto_2720815 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2720811 ?auto_2720813 ?auto_2720814 ?auto_2720812 ?auto_2720815 ?auto_2720816 ?auto_2720810 )
      ( FLY-6PPL-VERIFY ?auto_2720811 ?auto_2720812 ?auto_2720813 ?auto_2720814 ?auto_2720815 ?auto_2720816 ?auto_2720810 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2721042 - PERSON
      ?auto_2721043 - PERSON
      ?auto_2721044 - PERSON
      ?auto_2721045 - PERSON
      ?auto_2721046 - PERSON
      ?auto_2721047 - PERSON
      ?auto_2721041 - CITY
    )
    :vars
    (
      ?auto_2721053 - FLEVEL
      ?auto_2721050 - FLEVEL
      ?auto_2721048 - CITY
      ?auto_2721051 - CITY
      ?auto_2721049 - CITY
      ?auto_2721052 - CITY
      ?auto_2721054 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2721053 ?auto_2721050 ) ( PERSON-AT ?auto_2721047 ?auto_2721048 ) ( not ( = ?auto_2721041 ?auto_2721048 ) ) ( not ( = ?auto_2721053 ?auto_2721050 ) ) ( PERSON-AT ?auto_2721045 ?auto_2721051 ) ( not ( = ?auto_2721041 ?auto_2721051 ) ) ( PERSON-AT ?auto_2721043 ?auto_2721048 ) ( PERSON-AT ?auto_2721046 ?auto_2721049 ) ( not ( = ?auto_2721041 ?auto_2721049 ) ) ( PERSON-AT ?auto_2721044 ?auto_2721052 ) ( not ( = ?auto_2721041 ?auto_2721052 ) ) ( PERSON-AT ?auto_2721042 ?auto_2721049 ) ( AIRCRAFT-AT ?auto_2721054 ?auto_2721041 ) ( FUEL-LEVEL ?auto_2721054 ?auto_2721053 ) ( not ( = ?auto_2721042 ?auto_2721044 ) ) ( not ( = ?auto_2721052 ?auto_2721049 ) ) ( not ( = ?auto_2721042 ?auto_2721046 ) ) ( not ( = ?auto_2721044 ?auto_2721046 ) ) ( not ( = ?auto_2721042 ?auto_2721043 ) ) ( not ( = ?auto_2721044 ?auto_2721043 ) ) ( not ( = ?auto_2721046 ?auto_2721043 ) ) ( not ( = ?auto_2721048 ?auto_2721049 ) ) ( not ( = ?auto_2721048 ?auto_2721052 ) ) ( not ( = ?auto_2721042 ?auto_2721045 ) ) ( not ( = ?auto_2721044 ?auto_2721045 ) ) ( not ( = ?auto_2721046 ?auto_2721045 ) ) ( not ( = ?auto_2721043 ?auto_2721045 ) ) ( not ( = ?auto_2721051 ?auto_2721048 ) ) ( not ( = ?auto_2721051 ?auto_2721049 ) ) ( not ( = ?auto_2721051 ?auto_2721052 ) ) ( not ( = ?auto_2721042 ?auto_2721047 ) ) ( not ( = ?auto_2721044 ?auto_2721047 ) ) ( not ( = ?auto_2721046 ?auto_2721047 ) ) ( not ( = ?auto_2721043 ?auto_2721047 ) ) ( not ( = ?auto_2721045 ?auto_2721047 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2721042 ?auto_2721044 ?auto_2721046 ?auto_2721043 ?auto_2721047 ?auto_2721045 ?auto_2721041 )
      ( FLY-6PPL-VERIFY ?auto_2721042 ?auto_2721043 ?auto_2721044 ?auto_2721045 ?auto_2721046 ?auto_2721047 ?auto_2721041 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2721116 - PERSON
      ?auto_2721117 - PERSON
      ?auto_2721118 - PERSON
      ?auto_2721119 - PERSON
      ?auto_2721120 - PERSON
      ?auto_2721121 - PERSON
      ?auto_2721115 - CITY
    )
    :vars
    (
      ?auto_2721127 - FLEVEL
      ?auto_2721124 - FLEVEL
      ?auto_2721122 - CITY
      ?auto_2721125 - CITY
      ?auto_2721123 - CITY
      ?auto_2721126 - CITY
      ?auto_2721128 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2721127 ?auto_2721124 ) ( PERSON-AT ?auto_2721120 ?auto_2721122 ) ( not ( = ?auto_2721115 ?auto_2721122 ) ) ( not ( = ?auto_2721127 ?auto_2721124 ) ) ( PERSON-AT ?auto_2721119 ?auto_2721125 ) ( not ( = ?auto_2721115 ?auto_2721125 ) ) ( PERSON-AT ?auto_2721117 ?auto_2721122 ) ( PERSON-AT ?auto_2721121 ?auto_2721123 ) ( not ( = ?auto_2721115 ?auto_2721123 ) ) ( PERSON-AT ?auto_2721118 ?auto_2721126 ) ( not ( = ?auto_2721115 ?auto_2721126 ) ) ( PERSON-AT ?auto_2721116 ?auto_2721123 ) ( AIRCRAFT-AT ?auto_2721128 ?auto_2721115 ) ( FUEL-LEVEL ?auto_2721128 ?auto_2721127 ) ( not ( = ?auto_2721116 ?auto_2721118 ) ) ( not ( = ?auto_2721126 ?auto_2721123 ) ) ( not ( = ?auto_2721116 ?auto_2721121 ) ) ( not ( = ?auto_2721118 ?auto_2721121 ) ) ( not ( = ?auto_2721116 ?auto_2721117 ) ) ( not ( = ?auto_2721118 ?auto_2721117 ) ) ( not ( = ?auto_2721121 ?auto_2721117 ) ) ( not ( = ?auto_2721122 ?auto_2721123 ) ) ( not ( = ?auto_2721122 ?auto_2721126 ) ) ( not ( = ?auto_2721116 ?auto_2721119 ) ) ( not ( = ?auto_2721118 ?auto_2721119 ) ) ( not ( = ?auto_2721121 ?auto_2721119 ) ) ( not ( = ?auto_2721117 ?auto_2721119 ) ) ( not ( = ?auto_2721125 ?auto_2721122 ) ) ( not ( = ?auto_2721125 ?auto_2721123 ) ) ( not ( = ?auto_2721125 ?auto_2721126 ) ) ( not ( = ?auto_2721116 ?auto_2721120 ) ) ( not ( = ?auto_2721118 ?auto_2721120 ) ) ( not ( = ?auto_2721121 ?auto_2721120 ) ) ( not ( = ?auto_2721117 ?auto_2721120 ) ) ( not ( = ?auto_2721119 ?auto_2721120 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2721116 ?auto_2721118 ?auto_2721121 ?auto_2721117 ?auto_2721120 ?auto_2721119 ?auto_2721115 )
      ( FLY-6PPL-VERIFY ?auto_2721116 ?auto_2721117 ?auto_2721118 ?auto_2721119 ?auto_2721120 ?auto_2721121 ?auto_2721115 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2721423 - PERSON
      ?auto_2721424 - PERSON
      ?auto_2721425 - PERSON
      ?auto_2721426 - PERSON
      ?auto_2721427 - PERSON
      ?auto_2721428 - PERSON
      ?auto_2721422 - CITY
    )
    :vars
    (
      ?auto_2721434 - FLEVEL
      ?auto_2721431 - FLEVEL
      ?auto_2721429 - CITY
      ?auto_2721432 - CITY
      ?auto_2721430 - CITY
      ?auto_2721433 - CITY
      ?auto_2721435 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2721434 ?auto_2721431 ) ( PERSON-AT ?auto_2721426 ?auto_2721429 ) ( not ( = ?auto_2721422 ?auto_2721429 ) ) ( not ( = ?auto_2721434 ?auto_2721431 ) ) ( PERSON-AT ?auto_2721428 ?auto_2721432 ) ( not ( = ?auto_2721422 ?auto_2721432 ) ) ( PERSON-AT ?auto_2721424 ?auto_2721429 ) ( PERSON-AT ?auto_2721427 ?auto_2721430 ) ( not ( = ?auto_2721422 ?auto_2721430 ) ) ( PERSON-AT ?auto_2721425 ?auto_2721433 ) ( not ( = ?auto_2721422 ?auto_2721433 ) ) ( PERSON-AT ?auto_2721423 ?auto_2721430 ) ( AIRCRAFT-AT ?auto_2721435 ?auto_2721422 ) ( FUEL-LEVEL ?auto_2721435 ?auto_2721434 ) ( not ( = ?auto_2721423 ?auto_2721425 ) ) ( not ( = ?auto_2721433 ?auto_2721430 ) ) ( not ( = ?auto_2721423 ?auto_2721427 ) ) ( not ( = ?auto_2721425 ?auto_2721427 ) ) ( not ( = ?auto_2721423 ?auto_2721424 ) ) ( not ( = ?auto_2721425 ?auto_2721424 ) ) ( not ( = ?auto_2721427 ?auto_2721424 ) ) ( not ( = ?auto_2721429 ?auto_2721430 ) ) ( not ( = ?auto_2721429 ?auto_2721433 ) ) ( not ( = ?auto_2721423 ?auto_2721428 ) ) ( not ( = ?auto_2721425 ?auto_2721428 ) ) ( not ( = ?auto_2721427 ?auto_2721428 ) ) ( not ( = ?auto_2721424 ?auto_2721428 ) ) ( not ( = ?auto_2721432 ?auto_2721429 ) ) ( not ( = ?auto_2721432 ?auto_2721430 ) ) ( not ( = ?auto_2721432 ?auto_2721433 ) ) ( not ( = ?auto_2721423 ?auto_2721426 ) ) ( not ( = ?auto_2721425 ?auto_2721426 ) ) ( not ( = ?auto_2721427 ?auto_2721426 ) ) ( not ( = ?auto_2721424 ?auto_2721426 ) ) ( not ( = ?auto_2721428 ?auto_2721426 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2721423 ?auto_2721425 ?auto_2721427 ?auto_2721424 ?auto_2721426 ?auto_2721428 ?auto_2721422 )
      ( FLY-6PPL-VERIFY ?auto_2721423 ?auto_2721424 ?auto_2721425 ?auto_2721426 ?auto_2721427 ?auto_2721428 ?auto_2721422 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2721576 - PERSON
      ?auto_2721577 - PERSON
      ?auto_2721578 - PERSON
      ?auto_2721579 - PERSON
      ?auto_2721580 - PERSON
      ?auto_2721581 - PERSON
      ?auto_2721575 - CITY
    )
    :vars
    (
      ?auto_2721587 - FLEVEL
      ?auto_2721584 - FLEVEL
      ?auto_2721582 - CITY
      ?auto_2721585 - CITY
      ?auto_2721583 - CITY
      ?auto_2721586 - CITY
      ?auto_2721588 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2721587 ?auto_2721584 ) ( PERSON-AT ?auto_2721579 ?auto_2721582 ) ( not ( = ?auto_2721575 ?auto_2721582 ) ) ( not ( = ?auto_2721587 ?auto_2721584 ) ) ( PERSON-AT ?auto_2721580 ?auto_2721585 ) ( not ( = ?auto_2721575 ?auto_2721585 ) ) ( PERSON-AT ?auto_2721577 ?auto_2721582 ) ( PERSON-AT ?auto_2721581 ?auto_2721583 ) ( not ( = ?auto_2721575 ?auto_2721583 ) ) ( PERSON-AT ?auto_2721578 ?auto_2721586 ) ( not ( = ?auto_2721575 ?auto_2721586 ) ) ( PERSON-AT ?auto_2721576 ?auto_2721583 ) ( AIRCRAFT-AT ?auto_2721588 ?auto_2721575 ) ( FUEL-LEVEL ?auto_2721588 ?auto_2721587 ) ( not ( = ?auto_2721576 ?auto_2721578 ) ) ( not ( = ?auto_2721586 ?auto_2721583 ) ) ( not ( = ?auto_2721576 ?auto_2721581 ) ) ( not ( = ?auto_2721578 ?auto_2721581 ) ) ( not ( = ?auto_2721576 ?auto_2721577 ) ) ( not ( = ?auto_2721578 ?auto_2721577 ) ) ( not ( = ?auto_2721581 ?auto_2721577 ) ) ( not ( = ?auto_2721582 ?auto_2721583 ) ) ( not ( = ?auto_2721582 ?auto_2721586 ) ) ( not ( = ?auto_2721576 ?auto_2721580 ) ) ( not ( = ?auto_2721578 ?auto_2721580 ) ) ( not ( = ?auto_2721581 ?auto_2721580 ) ) ( not ( = ?auto_2721577 ?auto_2721580 ) ) ( not ( = ?auto_2721585 ?auto_2721582 ) ) ( not ( = ?auto_2721585 ?auto_2721583 ) ) ( not ( = ?auto_2721585 ?auto_2721586 ) ) ( not ( = ?auto_2721576 ?auto_2721579 ) ) ( not ( = ?auto_2721578 ?auto_2721579 ) ) ( not ( = ?auto_2721581 ?auto_2721579 ) ) ( not ( = ?auto_2721577 ?auto_2721579 ) ) ( not ( = ?auto_2721580 ?auto_2721579 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2721576 ?auto_2721578 ?auto_2721581 ?auto_2721577 ?auto_2721579 ?auto_2721580 ?auto_2721575 )
      ( FLY-6PPL-VERIFY ?auto_2721576 ?auto_2721577 ?auto_2721578 ?auto_2721579 ?auto_2721580 ?auto_2721581 ?auto_2721575 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2721961 - PERSON
      ?auto_2721962 - PERSON
      ?auto_2721963 - PERSON
      ?auto_2721964 - PERSON
      ?auto_2721965 - PERSON
      ?auto_2721966 - PERSON
      ?auto_2721960 - CITY
    )
    :vars
    (
      ?auto_2721972 - FLEVEL
      ?auto_2721969 - FLEVEL
      ?auto_2721967 - CITY
      ?auto_2721970 - CITY
      ?auto_2721968 - CITY
      ?auto_2721971 - CITY
      ?auto_2721973 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2721972 ?auto_2721969 ) ( PERSON-AT ?auto_2721966 ?auto_2721967 ) ( not ( = ?auto_2721960 ?auto_2721967 ) ) ( not ( = ?auto_2721972 ?auto_2721969 ) ) ( PERSON-AT ?auto_2721965 ?auto_2721970 ) ( not ( = ?auto_2721960 ?auto_2721970 ) ) ( PERSON-AT ?auto_2721962 ?auto_2721967 ) ( PERSON-AT ?auto_2721963 ?auto_2721968 ) ( not ( = ?auto_2721960 ?auto_2721968 ) ) ( PERSON-AT ?auto_2721964 ?auto_2721971 ) ( not ( = ?auto_2721960 ?auto_2721971 ) ) ( PERSON-AT ?auto_2721961 ?auto_2721968 ) ( AIRCRAFT-AT ?auto_2721973 ?auto_2721960 ) ( FUEL-LEVEL ?auto_2721973 ?auto_2721972 ) ( not ( = ?auto_2721961 ?auto_2721964 ) ) ( not ( = ?auto_2721971 ?auto_2721968 ) ) ( not ( = ?auto_2721961 ?auto_2721963 ) ) ( not ( = ?auto_2721964 ?auto_2721963 ) ) ( not ( = ?auto_2721961 ?auto_2721962 ) ) ( not ( = ?auto_2721964 ?auto_2721962 ) ) ( not ( = ?auto_2721963 ?auto_2721962 ) ) ( not ( = ?auto_2721967 ?auto_2721968 ) ) ( not ( = ?auto_2721967 ?auto_2721971 ) ) ( not ( = ?auto_2721961 ?auto_2721965 ) ) ( not ( = ?auto_2721964 ?auto_2721965 ) ) ( not ( = ?auto_2721963 ?auto_2721965 ) ) ( not ( = ?auto_2721962 ?auto_2721965 ) ) ( not ( = ?auto_2721970 ?auto_2721967 ) ) ( not ( = ?auto_2721970 ?auto_2721968 ) ) ( not ( = ?auto_2721970 ?auto_2721971 ) ) ( not ( = ?auto_2721961 ?auto_2721966 ) ) ( not ( = ?auto_2721964 ?auto_2721966 ) ) ( not ( = ?auto_2721963 ?auto_2721966 ) ) ( not ( = ?auto_2721962 ?auto_2721966 ) ) ( not ( = ?auto_2721965 ?auto_2721966 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2721961 ?auto_2721964 ?auto_2721963 ?auto_2721962 ?auto_2721966 ?auto_2721965 ?auto_2721960 )
      ( FLY-6PPL-VERIFY ?auto_2721961 ?auto_2721962 ?auto_2721963 ?auto_2721964 ?auto_2721965 ?auto_2721966 ?auto_2721960 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2722035 - PERSON
      ?auto_2722036 - PERSON
      ?auto_2722037 - PERSON
      ?auto_2722038 - PERSON
      ?auto_2722039 - PERSON
      ?auto_2722040 - PERSON
      ?auto_2722034 - CITY
    )
    :vars
    (
      ?auto_2722046 - FLEVEL
      ?auto_2722043 - FLEVEL
      ?auto_2722041 - CITY
      ?auto_2722044 - CITY
      ?auto_2722042 - CITY
      ?auto_2722045 - CITY
      ?auto_2722047 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2722046 ?auto_2722043 ) ( PERSON-AT ?auto_2722039 ?auto_2722041 ) ( not ( = ?auto_2722034 ?auto_2722041 ) ) ( not ( = ?auto_2722046 ?auto_2722043 ) ) ( PERSON-AT ?auto_2722040 ?auto_2722044 ) ( not ( = ?auto_2722034 ?auto_2722044 ) ) ( PERSON-AT ?auto_2722036 ?auto_2722041 ) ( PERSON-AT ?auto_2722037 ?auto_2722042 ) ( not ( = ?auto_2722034 ?auto_2722042 ) ) ( PERSON-AT ?auto_2722038 ?auto_2722045 ) ( not ( = ?auto_2722034 ?auto_2722045 ) ) ( PERSON-AT ?auto_2722035 ?auto_2722042 ) ( AIRCRAFT-AT ?auto_2722047 ?auto_2722034 ) ( FUEL-LEVEL ?auto_2722047 ?auto_2722046 ) ( not ( = ?auto_2722035 ?auto_2722038 ) ) ( not ( = ?auto_2722045 ?auto_2722042 ) ) ( not ( = ?auto_2722035 ?auto_2722037 ) ) ( not ( = ?auto_2722038 ?auto_2722037 ) ) ( not ( = ?auto_2722035 ?auto_2722036 ) ) ( not ( = ?auto_2722038 ?auto_2722036 ) ) ( not ( = ?auto_2722037 ?auto_2722036 ) ) ( not ( = ?auto_2722041 ?auto_2722042 ) ) ( not ( = ?auto_2722041 ?auto_2722045 ) ) ( not ( = ?auto_2722035 ?auto_2722040 ) ) ( not ( = ?auto_2722038 ?auto_2722040 ) ) ( not ( = ?auto_2722037 ?auto_2722040 ) ) ( not ( = ?auto_2722036 ?auto_2722040 ) ) ( not ( = ?auto_2722044 ?auto_2722041 ) ) ( not ( = ?auto_2722044 ?auto_2722042 ) ) ( not ( = ?auto_2722044 ?auto_2722045 ) ) ( not ( = ?auto_2722035 ?auto_2722039 ) ) ( not ( = ?auto_2722038 ?auto_2722039 ) ) ( not ( = ?auto_2722037 ?auto_2722039 ) ) ( not ( = ?auto_2722036 ?auto_2722039 ) ) ( not ( = ?auto_2722040 ?auto_2722039 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2722035 ?auto_2722038 ?auto_2722037 ?auto_2722036 ?auto_2722039 ?auto_2722040 ?auto_2722034 )
      ( FLY-6PPL-VERIFY ?auto_2722035 ?auto_2722036 ?auto_2722037 ?auto_2722038 ?auto_2722039 ?auto_2722040 ?auto_2722034 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2722711 - PERSON
      ?auto_2722712 - PERSON
      ?auto_2722713 - PERSON
      ?auto_2722714 - PERSON
      ?auto_2722715 - PERSON
      ?auto_2722716 - PERSON
      ?auto_2722710 - CITY
    )
    :vars
    (
      ?auto_2722722 - FLEVEL
      ?auto_2722719 - FLEVEL
      ?auto_2722717 - CITY
      ?auto_2722720 - CITY
      ?auto_2722718 - CITY
      ?auto_2722721 - CITY
      ?auto_2722723 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2722722 ?auto_2722719 ) ( PERSON-AT ?auto_2722714 ?auto_2722717 ) ( not ( = ?auto_2722710 ?auto_2722717 ) ) ( not ( = ?auto_2722722 ?auto_2722719 ) ) ( PERSON-AT ?auto_2722716 ?auto_2722720 ) ( not ( = ?auto_2722710 ?auto_2722720 ) ) ( PERSON-AT ?auto_2722712 ?auto_2722717 ) ( PERSON-AT ?auto_2722713 ?auto_2722718 ) ( not ( = ?auto_2722710 ?auto_2722718 ) ) ( PERSON-AT ?auto_2722715 ?auto_2722721 ) ( not ( = ?auto_2722710 ?auto_2722721 ) ) ( PERSON-AT ?auto_2722711 ?auto_2722718 ) ( AIRCRAFT-AT ?auto_2722723 ?auto_2722710 ) ( FUEL-LEVEL ?auto_2722723 ?auto_2722722 ) ( not ( = ?auto_2722711 ?auto_2722715 ) ) ( not ( = ?auto_2722721 ?auto_2722718 ) ) ( not ( = ?auto_2722711 ?auto_2722713 ) ) ( not ( = ?auto_2722715 ?auto_2722713 ) ) ( not ( = ?auto_2722711 ?auto_2722712 ) ) ( not ( = ?auto_2722715 ?auto_2722712 ) ) ( not ( = ?auto_2722713 ?auto_2722712 ) ) ( not ( = ?auto_2722717 ?auto_2722718 ) ) ( not ( = ?auto_2722717 ?auto_2722721 ) ) ( not ( = ?auto_2722711 ?auto_2722716 ) ) ( not ( = ?auto_2722715 ?auto_2722716 ) ) ( not ( = ?auto_2722713 ?auto_2722716 ) ) ( not ( = ?auto_2722712 ?auto_2722716 ) ) ( not ( = ?auto_2722720 ?auto_2722717 ) ) ( not ( = ?auto_2722720 ?auto_2722718 ) ) ( not ( = ?auto_2722720 ?auto_2722721 ) ) ( not ( = ?auto_2722711 ?auto_2722714 ) ) ( not ( = ?auto_2722715 ?auto_2722714 ) ) ( not ( = ?auto_2722713 ?auto_2722714 ) ) ( not ( = ?auto_2722712 ?auto_2722714 ) ) ( not ( = ?auto_2722716 ?auto_2722714 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2722711 ?auto_2722715 ?auto_2722713 ?auto_2722712 ?auto_2722714 ?auto_2722716 ?auto_2722710 )
      ( FLY-6PPL-VERIFY ?auto_2722711 ?auto_2722712 ?auto_2722713 ?auto_2722714 ?auto_2722715 ?auto_2722716 ?auto_2722710 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2726742 - PERSON
      ?auto_2726743 - PERSON
      ?auto_2726744 - PERSON
      ?auto_2726745 - PERSON
      ?auto_2726746 - PERSON
      ?auto_2726747 - PERSON
      ?auto_2726741 - CITY
    )
    :vars
    (
      ?auto_2726753 - FLEVEL
      ?auto_2726750 - FLEVEL
      ?auto_2726748 - CITY
      ?auto_2726751 - CITY
      ?auto_2726749 - CITY
      ?auto_2726752 - CITY
      ?auto_2726754 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2726753 ?auto_2726750 ) ( PERSON-AT ?auto_2726744 ?auto_2726748 ) ( not ( = ?auto_2726741 ?auto_2726748 ) ) ( not ( = ?auto_2726753 ?auto_2726750 ) ) ( PERSON-AT ?auto_2726747 ?auto_2726751 ) ( not ( = ?auto_2726741 ?auto_2726751 ) ) ( PERSON-AT ?auto_2726743 ?auto_2726748 ) ( PERSON-AT ?auto_2726746 ?auto_2726749 ) ( not ( = ?auto_2726741 ?auto_2726749 ) ) ( PERSON-AT ?auto_2726745 ?auto_2726752 ) ( not ( = ?auto_2726741 ?auto_2726752 ) ) ( PERSON-AT ?auto_2726742 ?auto_2726749 ) ( AIRCRAFT-AT ?auto_2726754 ?auto_2726741 ) ( FUEL-LEVEL ?auto_2726754 ?auto_2726753 ) ( not ( = ?auto_2726742 ?auto_2726745 ) ) ( not ( = ?auto_2726752 ?auto_2726749 ) ) ( not ( = ?auto_2726742 ?auto_2726746 ) ) ( not ( = ?auto_2726745 ?auto_2726746 ) ) ( not ( = ?auto_2726742 ?auto_2726743 ) ) ( not ( = ?auto_2726745 ?auto_2726743 ) ) ( not ( = ?auto_2726746 ?auto_2726743 ) ) ( not ( = ?auto_2726748 ?auto_2726749 ) ) ( not ( = ?auto_2726748 ?auto_2726752 ) ) ( not ( = ?auto_2726742 ?auto_2726747 ) ) ( not ( = ?auto_2726745 ?auto_2726747 ) ) ( not ( = ?auto_2726746 ?auto_2726747 ) ) ( not ( = ?auto_2726743 ?auto_2726747 ) ) ( not ( = ?auto_2726751 ?auto_2726748 ) ) ( not ( = ?auto_2726751 ?auto_2726749 ) ) ( not ( = ?auto_2726751 ?auto_2726752 ) ) ( not ( = ?auto_2726742 ?auto_2726744 ) ) ( not ( = ?auto_2726745 ?auto_2726744 ) ) ( not ( = ?auto_2726746 ?auto_2726744 ) ) ( not ( = ?auto_2726743 ?auto_2726744 ) ) ( not ( = ?auto_2726747 ?auto_2726744 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2726742 ?auto_2726745 ?auto_2726746 ?auto_2726743 ?auto_2726744 ?auto_2726747 ?auto_2726741 )
      ( FLY-6PPL-VERIFY ?auto_2726742 ?auto_2726743 ?auto_2726744 ?auto_2726745 ?auto_2726746 ?auto_2726747 ?auto_2726741 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2726895 - PERSON
      ?auto_2726896 - PERSON
      ?auto_2726897 - PERSON
      ?auto_2726898 - PERSON
      ?auto_2726899 - PERSON
      ?auto_2726900 - PERSON
      ?auto_2726894 - CITY
    )
    :vars
    (
      ?auto_2726906 - FLEVEL
      ?auto_2726903 - FLEVEL
      ?auto_2726901 - CITY
      ?auto_2726904 - CITY
      ?auto_2726902 - CITY
      ?auto_2726905 - CITY
      ?auto_2726907 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2726906 ?auto_2726903 ) ( PERSON-AT ?auto_2726897 ?auto_2726901 ) ( not ( = ?auto_2726894 ?auto_2726901 ) ) ( not ( = ?auto_2726906 ?auto_2726903 ) ) ( PERSON-AT ?auto_2726899 ?auto_2726904 ) ( not ( = ?auto_2726894 ?auto_2726904 ) ) ( PERSON-AT ?auto_2726896 ?auto_2726901 ) ( PERSON-AT ?auto_2726900 ?auto_2726902 ) ( not ( = ?auto_2726894 ?auto_2726902 ) ) ( PERSON-AT ?auto_2726898 ?auto_2726905 ) ( not ( = ?auto_2726894 ?auto_2726905 ) ) ( PERSON-AT ?auto_2726895 ?auto_2726902 ) ( AIRCRAFT-AT ?auto_2726907 ?auto_2726894 ) ( FUEL-LEVEL ?auto_2726907 ?auto_2726906 ) ( not ( = ?auto_2726895 ?auto_2726898 ) ) ( not ( = ?auto_2726905 ?auto_2726902 ) ) ( not ( = ?auto_2726895 ?auto_2726900 ) ) ( not ( = ?auto_2726898 ?auto_2726900 ) ) ( not ( = ?auto_2726895 ?auto_2726896 ) ) ( not ( = ?auto_2726898 ?auto_2726896 ) ) ( not ( = ?auto_2726900 ?auto_2726896 ) ) ( not ( = ?auto_2726901 ?auto_2726902 ) ) ( not ( = ?auto_2726901 ?auto_2726905 ) ) ( not ( = ?auto_2726895 ?auto_2726899 ) ) ( not ( = ?auto_2726898 ?auto_2726899 ) ) ( not ( = ?auto_2726900 ?auto_2726899 ) ) ( not ( = ?auto_2726896 ?auto_2726899 ) ) ( not ( = ?auto_2726904 ?auto_2726901 ) ) ( not ( = ?auto_2726904 ?auto_2726902 ) ) ( not ( = ?auto_2726904 ?auto_2726905 ) ) ( not ( = ?auto_2726895 ?auto_2726897 ) ) ( not ( = ?auto_2726898 ?auto_2726897 ) ) ( not ( = ?auto_2726900 ?auto_2726897 ) ) ( not ( = ?auto_2726896 ?auto_2726897 ) ) ( not ( = ?auto_2726899 ?auto_2726897 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2726895 ?auto_2726898 ?auto_2726900 ?auto_2726896 ?auto_2726897 ?auto_2726899 ?auto_2726894 )
      ( FLY-6PPL-VERIFY ?auto_2726895 ?auto_2726896 ?auto_2726897 ?auto_2726898 ?auto_2726899 ?auto_2726900 ?auto_2726894 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2727202 - PERSON
      ?auto_2727203 - PERSON
      ?auto_2727204 - PERSON
      ?auto_2727205 - PERSON
      ?auto_2727206 - PERSON
      ?auto_2727207 - PERSON
      ?auto_2727201 - CITY
    )
    :vars
    (
      ?auto_2727213 - FLEVEL
      ?auto_2727210 - FLEVEL
      ?auto_2727208 - CITY
      ?auto_2727211 - CITY
      ?auto_2727209 - CITY
      ?auto_2727212 - CITY
      ?auto_2727214 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2727213 ?auto_2727210 ) ( PERSON-AT ?auto_2727204 ?auto_2727208 ) ( not ( = ?auto_2727201 ?auto_2727208 ) ) ( not ( = ?auto_2727213 ?auto_2727210 ) ) ( PERSON-AT ?auto_2727207 ?auto_2727211 ) ( not ( = ?auto_2727201 ?auto_2727211 ) ) ( PERSON-AT ?auto_2727203 ?auto_2727208 ) ( PERSON-AT ?auto_2727205 ?auto_2727209 ) ( not ( = ?auto_2727201 ?auto_2727209 ) ) ( PERSON-AT ?auto_2727206 ?auto_2727212 ) ( not ( = ?auto_2727201 ?auto_2727212 ) ) ( PERSON-AT ?auto_2727202 ?auto_2727209 ) ( AIRCRAFT-AT ?auto_2727214 ?auto_2727201 ) ( FUEL-LEVEL ?auto_2727214 ?auto_2727213 ) ( not ( = ?auto_2727202 ?auto_2727206 ) ) ( not ( = ?auto_2727212 ?auto_2727209 ) ) ( not ( = ?auto_2727202 ?auto_2727205 ) ) ( not ( = ?auto_2727206 ?auto_2727205 ) ) ( not ( = ?auto_2727202 ?auto_2727203 ) ) ( not ( = ?auto_2727206 ?auto_2727203 ) ) ( not ( = ?auto_2727205 ?auto_2727203 ) ) ( not ( = ?auto_2727208 ?auto_2727209 ) ) ( not ( = ?auto_2727208 ?auto_2727212 ) ) ( not ( = ?auto_2727202 ?auto_2727207 ) ) ( not ( = ?auto_2727206 ?auto_2727207 ) ) ( not ( = ?auto_2727205 ?auto_2727207 ) ) ( not ( = ?auto_2727203 ?auto_2727207 ) ) ( not ( = ?auto_2727211 ?auto_2727208 ) ) ( not ( = ?auto_2727211 ?auto_2727209 ) ) ( not ( = ?auto_2727211 ?auto_2727212 ) ) ( not ( = ?auto_2727202 ?auto_2727204 ) ) ( not ( = ?auto_2727206 ?auto_2727204 ) ) ( not ( = ?auto_2727205 ?auto_2727204 ) ) ( not ( = ?auto_2727203 ?auto_2727204 ) ) ( not ( = ?auto_2727207 ?auto_2727204 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2727202 ?auto_2727206 ?auto_2727205 ?auto_2727203 ?auto_2727204 ?auto_2727207 ?auto_2727201 )
      ( FLY-6PPL-VERIFY ?auto_2727202 ?auto_2727203 ?auto_2727204 ?auto_2727205 ?auto_2727206 ?auto_2727207 ?auto_2727201 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2763592 - PERSON
      ?auto_2763593 - PERSON
      ?auto_2763594 - PERSON
      ?auto_2763595 - PERSON
      ?auto_2763596 - PERSON
      ?auto_2763597 - PERSON
      ?auto_2763591 - CITY
    )
    :vars
    (
      ?auto_2763603 - FLEVEL
      ?auto_2763600 - FLEVEL
      ?auto_2763598 - CITY
      ?auto_2763601 - CITY
      ?auto_2763599 - CITY
      ?auto_2763602 - CITY
      ?auto_2763604 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2763603 ?auto_2763600 ) ( PERSON-AT ?auto_2763597 ?auto_2763598 ) ( not ( = ?auto_2763591 ?auto_2763598 ) ) ( not ( = ?auto_2763603 ?auto_2763600 ) ) ( PERSON-AT ?auto_2763596 ?auto_2763601 ) ( not ( = ?auto_2763591 ?auto_2763601 ) ) ( PERSON-AT ?auto_2763595 ?auto_2763598 ) ( PERSON-AT ?auto_2763594 ?auto_2763599 ) ( not ( = ?auto_2763591 ?auto_2763599 ) ) ( PERSON-AT ?auto_2763592 ?auto_2763602 ) ( not ( = ?auto_2763591 ?auto_2763602 ) ) ( PERSON-AT ?auto_2763593 ?auto_2763599 ) ( AIRCRAFT-AT ?auto_2763604 ?auto_2763591 ) ( FUEL-LEVEL ?auto_2763604 ?auto_2763603 ) ( not ( = ?auto_2763593 ?auto_2763592 ) ) ( not ( = ?auto_2763602 ?auto_2763599 ) ) ( not ( = ?auto_2763593 ?auto_2763594 ) ) ( not ( = ?auto_2763592 ?auto_2763594 ) ) ( not ( = ?auto_2763593 ?auto_2763595 ) ) ( not ( = ?auto_2763592 ?auto_2763595 ) ) ( not ( = ?auto_2763594 ?auto_2763595 ) ) ( not ( = ?auto_2763598 ?auto_2763599 ) ) ( not ( = ?auto_2763598 ?auto_2763602 ) ) ( not ( = ?auto_2763593 ?auto_2763596 ) ) ( not ( = ?auto_2763592 ?auto_2763596 ) ) ( not ( = ?auto_2763594 ?auto_2763596 ) ) ( not ( = ?auto_2763595 ?auto_2763596 ) ) ( not ( = ?auto_2763601 ?auto_2763598 ) ) ( not ( = ?auto_2763601 ?auto_2763599 ) ) ( not ( = ?auto_2763601 ?auto_2763602 ) ) ( not ( = ?auto_2763593 ?auto_2763597 ) ) ( not ( = ?auto_2763592 ?auto_2763597 ) ) ( not ( = ?auto_2763594 ?auto_2763597 ) ) ( not ( = ?auto_2763595 ?auto_2763597 ) ) ( not ( = ?auto_2763596 ?auto_2763597 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2763593 ?auto_2763592 ?auto_2763594 ?auto_2763595 ?auto_2763597 ?auto_2763596 ?auto_2763591 )
      ( FLY-6PPL-VERIFY ?auto_2763592 ?auto_2763593 ?auto_2763594 ?auto_2763595 ?auto_2763596 ?auto_2763597 ?auto_2763591 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2763666 - PERSON
      ?auto_2763667 - PERSON
      ?auto_2763668 - PERSON
      ?auto_2763669 - PERSON
      ?auto_2763670 - PERSON
      ?auto_2763671 - PERSON
      ?auto_2763665 - CITY
    )
    :vars
    (
      ?auto_2763677 - FLEVEL
      ?auto_2763674 - FLEVEL
      ?auto_2763672 - CITY
      ?auto_2763675 - CITY
      ?auto_2763673 - CITY
      ?auto_2763676 - CITY
      ?auto_2763678 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2763677 ?auto_2763674 ) ( PERSON-AT ?auto_2763670 ?auto_2763672 ) ( not ( = ?auto_2763665 ?auto_2763672 ) ) ( not ( = ?auto_2763677 ?auto_2763674 ) ) ( PERSON-AT ?auto_2763671 ?auto_2763675 ) ( not ( = ?auto_2763665 ?auto_2763675 ) ) ( PERSON-AT ?auto_2763669 ?auto_2763672 ) ( PERSON-AT ?auto_2763668 ?auto_2763673 ) ( not ( = ?auto_2763665 ?auto_2763673 ) ) ( PERSON-AT ?auto_2763666 ?auto_2763676 ) ( not ( = ?auto_2763665 ?auto_2763676 ) ) ( PERSON-AT ?auto_2763667 ?auto_2763673 ) ( AIRCRAFT-AT ?auto_2763678 ?auto_2763665 ) ( FUEL-LEVEL ?auto_2763678 ?auto_2763677 ) ( not ( = ?auto_2763667 ?auto_2763666 ) ) ( not ( = ?auto_2763676 ?auto_2763673 ) ) ( not ( = ?auto_2763667 ?auto_2763668 ) ) ( not ( = ?auto_2763666 ?auto_2763668 ) ) ( not ( = ?auto_2763667 ?auto_2763669 ) ) ( not ( = ?auto_2763666 ?auto_2763669 ) ) ( not ( = ?auto_2763668 ?auto_2763669 ) ) ( not ( = ?auto_2763672 ?auto_2763673 ) ) ( not ( = ?auto_2763672 ?auto_2763676 ) ) ( not ( = ?auto_2763667 ?auto_2763671 ) ) ( not ( = ?auto_2763666 ?auto_2763671 ) ) ( not ( = ?auto_2763668 ?auto_2763671 ) ) ( not ( = ?auto_2763669 ?auto_2763671 ) ) ( not ( = ?auto_2763675 ?auto_2763672 ) ) ( not ( = ?auto_2763675 ?auto_2763673 ) ) ( not ( = ?auto_2763675 ?auto_2763676 ) ) ( not ( = ?auto_2763667 ?auto_2763670 ) ) ( not ( = ?auto_2763666 ?auto_2763670 ) ) ( not ( = ?auto_2763668 ?auto_2763670 ) ) ( not ( = ?auto_2763669 ?auto_2763670 ) ) ( not ( = ?auto_2763671 ?auto_2763670 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2763667 ?auto_2763666 ?auto_2763668 ?auto_2763669 ?auto_2763670 ?auto_2763671 ?auto_2763665 )
      ( FLY-6PPL-VERIFY ?auto_2763666 ?auto_2763667 ?auto_2763668 ?auto_2763669 ?auto_2763670 ?auto_2763671 ?auto_2763665 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2763740 - PERSON
      ?auto_2763741 - PERSON
      ?auto_2763742 - PERSON
      ?auto_2763743 - PERSON
      ?auto_2763744 - PERSON
      ?auto_2763745 - PERSON
      ?auto_2763739 - CITY
    )
    :vars
    (
      ?auto_2763751 - FLEVEL
      ?auto_2763748 - FLEVEL
      ?auto_2763746 - CITY
      ?auto_2763749 - CITY
      ?auto_2763747 - CITY
      ?auto_2763750 - CITY
      ?auto_2763752 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2763751 ?auto_2763748 ) ( PERSON-AT ?auto_2763745 ?auto_2763746 ) ( not ( = ?auto_2763739 ?auto_2763746 ) ) ( not ( = ?auto_2763751 ?auto_2763748 ) ) ( PERSON-AT ?auto_2763743 ?auto_2763749 ) ( not ( = ?auto_2763739 ?auto_2763749 ) ) ( PERSON-AT ?auto_2763744 ?auto_2763746 ) ( PERSON-AT ?auto_2763742 ?auto_2763747 ) ( not ( = ?auto_2763739 ?auto_2763747 ) ) ( PERSON-AT ?auto_2763740 ?auto_2763750 ) ( not ( = ?auto_2763739 ?auto_2763750 ) ) ( PERSON-AT ?auto_2763741 ?auto_2763747 ) ( AIRCRAFT-AT ?auto_2763752 ?auto_2763739 ) ( FUEL-LEVEL ?auto_2763752 ?auto_2763751 ) ( not ( = ?auto_2763741 ?auto_2763740 ) ) ( not ( = ?auto_2763750 ?auto_2763747 ) ) ( not ( = ?auto_2763741 ?auto_2763742 ) ) ( not ( = ?auto_2763740 ?auto_2763742 ) ) ( not ( = ?auto_2763741 ?auto_2763744 ) ) ( not ( = ?auto_2763740 ?auto_2763744 ) ) ( not ( = ?auto_2763742 ?auto_2763744 ) ) ( not ( = ?auto_2763746 ?auto_2763747 ) ) ( not ( = ?auto_2763746 ?auto_2763750 ) ) ( not ( = ?auto_2763741 ?auto_2763743 ) ) ( not ( = ?auto_2763740 ?auto_2763743 ) ) ( not ( = ?auto_2763742 ?auto_2763743 ) ) ( not ( = ?auto_2763744 ?auto_2763743 ) ) ( not ( = ?auto_2763749 ?auto_2763746 ) ) ( not ( = ?auto_2763749 ?auto_2763747 ) ) ( not ( = ?auto_2763749 ?auto_2763750 ) ) ( not ( = ?auto_2763741 ?auto_2763745 ) ) ( not ( = ?auto_2763740 ?auto_2763745 ) ) ( not ( = ?auto_2763742 ?auto_2763745 ) ) ( not ( = ?auto_2763744 ?auto_2763745 ) ) ( not ( = ?auto_2763743 ?auto_2763745 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2763741 ?auto_2763740 ?auto_2763742 ?auto_2763744 ?auto_2763745 ?auto_2763743 ?auto_2763739 )
      ( FLY-6PPL-VERIFY ?auto_2763740 ?auto_2763741 ?auto_2763742 ?auto_2763743 ?auto_2763744 ?auto_2763745 ?auto_2763739 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2764795 - PERSON
      ?auto_2764796 - PERSON
      ?auto_2764797 - PERSON
      ?auto_2764798 - PERSON
      ?auto_2764799 - PERSON
      ?auto_2764800 - PERSON
      ?auto_2764794 - CITY
    )
    :vars
    (
      ?auto_2764806 - FLEVEL
      ?auto_2764803 - FLEVEL
      ?auto_2764801 - CITY
      ?auto_2764804 - CITY
      ?auto_2764802 - CITY
      ?auto_2764805 - CITY
      ?auto_2764807 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2764806 ?auto_2764803 ) ( PERSON-AT ?auto_2764800 ?auto_2764801 ) ( not ( = ?auto_2764794 ?auto_2764801 ) ) ( not ( = ?auto_2764806 ?auto_2764803 ) ) ( PERSON-AT ?auto_2764799 ?auto_2764804 ) ( not ( = ?auto_2764794 ?auto_2764804 ) ) ( PERSON-AT ?auto_2764797 ?auto_2764801 ) ( PERSON-AT ?auto_2764798 ?auto_2764802 ) ( not ( = ?auto_2764794 ?auto_2764802 ) ) ( PERSON-AT ?auto_2764795 ?auto_2764805 ) ( not ( = ?auto_2764794 ?auto_2764805 ) ) ( PERSON-AT ?auto_2764796 ?auto_2764802 ) ( AIRCRAFT-AT ?auto_2764807 ?auto_2764794 ) ( FUEL-LEVEL ?auto_2764807 ?auto_2764806 ) ( not ( = ?auto_2764796 ?auto_2764795 ) ) ( not ( = ?auto_2764805 ?auto_2764802 ) ) ( not ( = ?auto_2764796 ?auto_2764798 ) ) ( not ( = ?auto_2764795 ?auto_2764798 ) ) ( not ( = ?auto_2764796 ?auto_2764797 ) ) ( not ( = ?auto_2764795 ?auto_2764797 ) ) ( not ( = ?auto_2764798 ?auto_2764797 ) ) ( not ( = ?auto_2764801 ?auto_2764802 ) ) ( not ( = ?auto_2764801 ?auto_2764805 ) ) ( not ( = ?auto_2764796 ?auto_2764799 ) ) ( not ( = ?auto_2764795 ?auto_2764799 ) ) ( not ( = ?auto_2764798 ?auto_2764799 ) ) ( not ( = ?auto_2764797 ?auto_2764799 ) ) ( not ( = ?auto_2764804 ?auto_2764801 ) ) ( not ( = ?auto_2764804 ?auto_2764802 ) ) ( not ( = ?auto_2764804 ?auto_2764805 ) ) ( not ( = ?auto_2764796 ?auto_2764800 ) ) ( not ( = ?auto_2764795 ?auto_2764800 ) ) ( not ( = ?auto_2764798 ?auto_2764800 ) ) ( not ( = ?auto_2764797 ?auto_2764800 ) ) ( not ( = ?auto_2764799 ?auto_2764800 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2764796 ?auto_2764795 ?auto_2764798 ?auto_2764797 ?auto_2764800 ?auto_2764799 ?auto_2764794 )
      ( FLY-6PPL-VERIFY ?auto_2764795 ?auto_2764796 ?auto_2764797 ?auto_2764798 ?auto_2764799 ?auto_2764800 ?auto_2764794 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2764869 - PERSON
      ?auto_2764870 - PERSON
      ?auto_2764871 - PERSON
      ?auto_2764872 - PERSON
      ?auto_2764873 - PERSON
      ?auto_2764874 - PERSON
      ?auto_2764868 - CITY
    )
    :vars
    (
      ?auto_2764880 - FLEVEL
      ?auto_2764877 - FLEVEL
      ?auto_2764875 - CITY
      ?auto_2764878 - CITY
      ?auto_2764876 - CITY
      ?auto_2764879 - CITY
      ?auto_2764881 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2764880 ?auto_2764877 ) ( PERSON-AT ?auto_2764873 ?auto_2764875 ) ( not ( = ?auto_2764868 ?auto_2764875 ) ) ( not ( = ?auto_2764880 ?auto_2764877 ) ) ( PERSON-AT ?auto_2764874 ?auto_2764878 ) ( not ( = ?auto_2764868 ?auto_2764878 ) ) ( PERSON-AT ?auto_2764871 ?auto_2764875 ) ( PERSON-AT ?auto_2764872 ?auto_2764876 ) ( not ( = ?auto_2764868 ?auto_2764876 ) ) ( PERSON-AT ?auto_2764869 ?auto_2764879 ) ( not ( = ?auto_2764868 ?auto_2764879 ) ) ( PERSON-AT ?auto_2764870 ?auto_2764876 ) ( AIRCRAFT-AT ?auto_2764881 ?auto_2764868 ) ( FUEL-LEVEL ?auto_2764881 ?auto_2764880 ) ( not ( = ?auto_2764870 ?auto_2764869 ) ) ( not ( = ?auto_2764879 ?auto_2764876 ) ) ( not ( = ?auto_2764870 ?auto_2764872 ) ) ( not ( = ?auto_2764869 ?auto_2764872 ) ) ( not ( = ?auto_2764870 ?auto_2764871 ) ) ( not ( = ?auto_2764869 ?auto_2764871 ) ) ( not ( = ?auto_2764872 ?auto_2764871 ) ) ( not ( = ?auto_2764875 ?auto_2764876 ) ) ( not ( = ?auto_2764875 ?auto_2764879 ) ) ( not ( = ?auto_2764870 ?auto_2764874 ) ) ( not ( = ?auto_2764869 ?auto_2764874 ) ) ( not ( = ?auto_2764872 ?auto_2764874 ) ) ( not ( = ?auto_2764871 ?auto_2764874 ) ) ( not ( = ?auto_2764878 ?auto_2764875 ) ) ( not ( = ?auto_2764878 ?auto_2764876 ) ) ( not ( = ?auto_2764878 ?auto_2764879 ) ) ( not ( = ?auto_2764870 ?auto_2764873 ) ) ( not ( = ?auto_2764869 ?auto_2764873 ) ) ( not ( = ?auto_2764872 ?auto_2764873 ) ) ( not ( = ?auto_2764871 ?auto_2764873 ) ) ( not ( = ?auto_2764874 ?auto_2764873 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2764870 ?auto_2764869 ?auto_2764872 ?auto_2764871 ?auto_2764873 ?auto_2764874 ?auto_2764868 )
      ( FLY-6PPL-VERIFY ?auto_2764869 ?auto_2764870 ?auto_2764871 ?auto_2764872 ?auto_2764873 ?auto_2764874 ?auto_2764868 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2765100 - PERSON
      ?auto_2765101 - PERSON
      ?auto_2765102 - PERSON
      ?auto_2765103 - PERSON
      ?auto_2765104 - PERSON
      ?auto_2765105 - PERSON
      ?auto_2765099 - CITY
    )
    :vars
    (
      ?auto_2765111 - FLEVEL
      ?auto_2765108 - FLEVEL
      ?auto_2765106 - CITY
      ?auto_2765109 - CITY
      ?auto_2765107 - CITY
      ?auto_2765110 - CITY
      ?auto_2765112 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2765111 ?auto_2765108 ) ( PERSON-AT ?auto_2765105 ?auto_2765106 ) ( not ( = ?auto_2765099 ?auto_2765106 ) ) ( not ( = ?auto_2765111 ?auto_2765108 ) ) ( PERSON-AT ?auto_2765103 ?auto_2765109 ) ( not ( = ?auto_2765099 ?auto_2765109 ) ) ( PERSON-AT ?auto_2765102 ?auto_2765106 ) ( PERSON-AT ?auto_2765104 ?auto_2765107 ) ( not ( = ?auto_2765099 ?auto_2765107 ) ) ( PERSON-AT ?auto_2765100 ?auto_2765110 ) ( not ( = ?auto_2765099 ?auto_2765110 ) ) ( PERSON-AT ?auto_2765101 ?auto_2765107 ) ( AIRCRAFT-AT ?auto_2765112 ?auto_2765099 ) ( FUEL-LEVEL ?auto_2765112 ?auto_2765111 ) ( not ( = ?auto_2765101 ?auto_2765100 ) ) ( not ( = ?auto_2765110 ?auto_2765107 ) ) ( not ( = ?auto_2765101 ?auto_2765104 ) ) ( not ( = ?auto_2765100 ?auto_2765104 ) ) ( not ( = ?auto_2765101 ?auto_2765102 ) ) ( not ( = ?auto_2765100 ?auto_2765102 ) ) ( not ( = ?auto_2765104 ?auto_2765102 ) ) ( not ( = ?auto_2765106 ?auto_2765107 ) ) ( not ( = ?auto_2765106 ?auto_2765110 ) ) ( not ( = ?auto_2765101 ?auto_2765103 ) ) ( not ( = ?auto_2765100 ?auto_2765103 ) ) ( not ( = ?auto_2765104 ?auto_2765103 ) ) ( not ( = ?auto_2765102 ?auto_2765103 ) ) ( not ( = ?auto_2765109 ?auto_2765106 ) ) ( not ( = ?auto_2765109 ?auto_2765107 ) ) ( not ( = ?auto_2765109 ?auto_2765110 ) ) ( not ( = ?auto_2765101 ?auto_2765105 ) ) ( not ( = ?auto_2765100 ?auto_2765105 ) ) ( not ( = ?auto_2765104 ?auto_2765105 ) ) ( not ( = ?auto_2765102 ?auto_2765105 ) ) ( not ( = ?auto_2765103 ?auto_2765105 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2765101 ?auto_2765100 ?auto_2765104 ?auto_2765102 ?auto_2765105 ?auto_2765103 ?auto_2765099 )
      ( FLY-6PPL-VERIFY ?auto_2765100 ?auto_2765101 ?auto_2765102 ?auto_2765103 ?auto_2765104 ?auto_2765105 ?auto_2765099 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2765174 - PERSON
      ?auto_2765175 - PERSON
      ?auto_2765176 - PERSON
      ?auto_2765177 - PERSON
      ?auto_2765178 - PERSON
      ?auto_2765179 - PERSON
      ?auto_2765173 - CITY
    )
    :vars
    (
      ?auto_2765185 - FLEVEL
      ?auto_2765182 - FLEVEL
      ?auto_2765180 - CITY
      ?auto_2765183 - CITY
      ?auto_2765181 - CITY
      ?auto_2765184 - CITY
      ?auto_2765186 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2765185 ?auto_2765182 ) ( PERSON-AT ?auto_2765178 ?auto_2765180 ) ( not ( = ?auto_2765173 ?auto_2765180 ) ) ( not ( = ?auto_2765185 ?auto_2765182 ) ) ( PERSON-AT ?auto_2765177 ?auto_2765183 ) ( not ( = ?auto_2765173 ?auto_2765183 ) ) ( PERSON-AT ?auto_2765176 ?auto_2765180 ) ( PERSON-AT ?auto_2765179 ?auto_2765181 ) ( not ( = ?auto_2765173 ?auto_2765181 ) ) ( PERSON-AT ?auto_2765174 ?auto_2765184 ) ( not ( = ?auto_2765173 ?auto_2765184 ) ) ( PERSON-AT ?auto_2765175 ?auto_2765181 ) ( AIRCRAFT-AT ?auto_2765186 ?auto_2765173 ) ( FUEL-LEVEL ?auto_2765186 ?auto_2765185 ) ( not ( = ?auto_2765175 ?auto_2765174 ) ) ( not ( = ?auto_2765184 ?auto_2765181 ) ) ( not ( = ?auto_2765175 ?auto_2765179 ) ) ( not ( = ?auto_2765174 ?auto_2765179 ) ) ( not ( = ?auto_2765175 ?auto_2765176 ) ) ( not ( = ?auto_2765174 ?auto_2765176 ) ) ( not ( = ?auto_2765179 ?auto_2765176 ) ) ( not ( = ?auto_2765180 ?auto_2765181 ) ) ( not ( = ?auto_2765180 ?auto_2765184 ) ) ( not ( = ?auto_2765175 ?auto_2765177 ) ) ( not ( = ?auto_2765174 ?auto_2765177 ) ) ( not ( = ?auto_2765179 ?auto_2765177 ) ) ( not ( = ?auto_2765176 ?auto_2765177 ) ) ( not ( = ?auto_2765183 ?auto_2765180 ) ) ( not ( = ?auto_2765183 ?auto_2765181 ) ) ( not ( = ?auto_2765183 ?auto_2765184 ) ) ( not ( = ?auto_2765175 ?auto_2765178 ) ) ( not ( = ?auto_2765174 ?auto_2765178 ) ) ( not ( = ?auto_2765179 ?auto_2765178 ) ) ( not ( = ?auto_2765176 ?auto_2765178 ) ) ( not ( = ?auto_2765177 ?auto_2765178 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2765175 ?auto_2765174 ?auto_2765179 ?auto_2765176 ?auto_2765178 ?auto_2765177 ?auto_2765173 )
      ( FLY-6PPL-VERIFY ?auto_2765174 ?auto_2765175 ?auto_2765176 ?auto_2765177 ?auto_2765178 ?auto_2765179 ?auto_2765173 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2765481 - PERSON
      ?auto_2765482 - PERSON
      ?auto_2765483 - PERSON
      ?auto_2765484 - PERSON
      ?auto_2765485 - PERSON
      ?auto_2765486 - PERSON
      ?auto_2765480 - CITY
    )
    :vars
    (
      ?auto_2765492 - FLEVEL
      ?auto_2765489 - FLEVEL
      ?auto_2765487 - CITY
      ?auto_2765490 - CITY
      ?auto_2765488 - CITY
      ?auto_2765491 - CITY
      ?auto_2765493 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2765492 ?auto_2765489 ) ( PERSON-AT ?auto_2765484 ?auto_2765487 ) ( not ( = ?auto_2765480 ?auto_2765487 ) ) ( not ( = ?auto_2765492 ?auto_2765489 ) ) ( PERSON-AT ?auto_2765486 ?auto_2765490 ) ( not ( = ?auto_2765480 ?auto_2765490 ) ) ( PERSON-AT ?auto_2765483 ?auto_2765487 ) ( PERSON-AT ?auto_2765485 ?auto_2765488 ) ( not ( = ?auto_2765480 ?auto_2765488 ) ) ( PERSON-AT ?auto_2765481 ?auto_2765491 ) ( not ( = ?auto_2765480 ?auto_2765491 ) ) ( PERSON-AT ?auto_2765482 ?auto_2765488 ) ( AIRCRAFT-AT ?auto_2765493 ?auto_2765480 ) ( FUEL-LEVEL ?auto_2765493 ?auto_2765492 ) ( not ( = ?auto_2765482 ?auto_2765481 ) ) ( not ( = ?auto_2765491 ?auto_2765488 ) ) ( not ( = ?auto_2765482 ?auto_2765485 ) ) ( not ( = ?auto_2765481 ?auto_2765485 ) ) ( not ( = ?auto_2765482 ?auto_2765483 ) ) ( not ( = ?auto_2765481 ?auto_2765483 ) ) ( not ( = ?auto_2765485 ?auto_2765483 ) ) ( not ( = ?auto_2765487 ?auto_2765488 ) ) ( not ( = ?auto_2765487 ?auto_2765491 ) ) ( not ( = ?auto_2765482 ?auto_2765486 ) ) ( not ( = ?auto_2765481 ?auto_2765486 ) ) ( not ( = ?auto_2765485 ?auto_2765486 ) ) ( not ( = ?auto_2765483 ?auto_2765486 ) ) ( not ( = ?auto_2765490 ?auto_2765487 ) ) ( not ( = ?auto_2765490 ?auto_2765488 ) ) ( not ( = ?auto_2765490 ?auto_2765491 ) ) ( not ( = ?auto_2765482 ?auto_2765484 ) ) ( not ( = ?auto_2765481 ?auto_2765484 ) ) ( not ( = ?auto_2765485 ?auto_2765484 ) ) ( not ( = ?auto_2765483 ?auto_2765484 ) ) ( not ( = ?auto_2765486 ?auto_2765484 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2765482 ?auto_2765481 ?auto_2765485 ?auto_2765483 ?auto_2765484 ?auto_2765486 ?auto_2765480 )
      ( FLY-6PPL-VERIFY ?auto_2765481 ?auto_2765482 ?auto_2765483 ?auto_2765484 ?auto_2765485 ?auto_2765486 ?auto_2765480 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2765634 - PERSON
      ?auto_2765635 - PERSON
      ?auto_2765636 - PERSON
      ?auto_2765637 - PERSON
      ?auto_2765638 - PERSON
      ?auto_2765639 - PERSON
      ?auto_2765633 - CITY
    )
    :vars
    (
      ?auto_2765645 - FLEVEL
      ?auto_2765642 - FLEVEL
      ?auto_2765640 - CITY
      ?auto_2765643 - CITY
      ?auto_2765641 - CITY
      ?auto_2765644 - CITY
      ?auto_2765646 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2765645 ?auto_2765642 ) ( PERSON-AT ?auto_2765637 ?auto_2765640 ) ( not ( = ?auto_2765633 ?auto_2765640 ) ) ( not ( = ?auto_2765645 ?auto_2765642 ) ) ( PERSON-AT ?auto_2765638 ?auto_2765643 ) ( not ( = ?auto_2765633 ?auto_2765643 ) ) ( PERSON-AT ?auto_2765636 ?auto_2765640 ) ( PERSON-AT ?auto_2765639 ?auto_2765641 ) ( not ( = ?auto_2765633 ?auto_2765641 ) ) ( PERSON-AT ?auto_2765634 ?auto_2765644 ) ( not ( = ?auto_2765633 ?auto_2765644 ) ) ( PERSON-AT ?auto_2765635 ?auto_2765641 ) ( AIRCRAFT-AT ?auto_2765646 ?auto_2765633 ) ( FUEL-LEVEL ?auto_2765646 ?auto_2765645 ) ( not ( = ?auto_2765635 ?auto_2765634 ) ) ( not ( = ?auto_2765644 ?auto_2765641 ) ) ( not ( = ?auto_2765635 ?auto_2765639 ) ) ( not ( = ?auto_2765634 ?auto_2765639 ) ) ( not ( = ?auto_2765635 ?auto_2765636 ) ) ( not ( = ?auto_2765634 ?auto_2765636 ) ) ( not ( = ?auto_2765639 ?auto_2765636 ) ) ( not ( = ?auto_2765640 ?auto_2765641 ) ) ( not ( = ?auto_2765640 ?auto_2765644 ) ) ( not ( = ?auto_2765635 ?auto_2765638 ) ) ( not ( = ?auto_2765634 ?auto_2765638 ) ) ( not ( = ?auto_2765639 ?auto_2765638 ) ) ( not ( = ?auto_2765636 ?auto_2765638 ) ) ( not ( = ?auto_2765643 ?auto_2765640 ) ) ( not ( = ?auto_2765643 ?auto_2765641 ) ) ( not ( = ?auto_2765643 ?auto_2765644 ) ) ( not ( = ?auto_2765635 ?auto_2765637 ) ) ( not ( = ?auto_2765634 ?auto_2765637 ) ) ( not ( = ?auto_2765639 ?auto_2765637 ) ) ( not ( = ?auto_2765636 ?auto_2765637 ) ) ( not ( = ?auto_2765638 ?auto_2765637 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2765635 ?auto_2765634 ?auto_2765639 ?auto_2765636 ?auto_2765637 ?auto_2765638 ?auto_2765633 )
      ( FLY-6PPL-VERIFY ?auto_2765634 ?auto_2765635 ?auto_2765636 ?auto_2765637 ?auto_2765638 ?auto_2765639 ?auto_2765633 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2766176 - PERSON
      ?auto_2766177 - PERSON
      ?auto_2766178 - PERSON
      ?auto_2766179 - PERSON
      ?auto_2766180 - PERSON
      ?auto_2766181 - PERSON
      ?auto_2766175 - CITY
    )
    :vars
    (
      ?auto_2766187 - FLEVEL
      ?auto_2766184 - FLEVEL
      ?auto_2766182 - CITY
      ?auto_2766185 - CITY
      ?auto_2766183 - CITY
      ?auto_2766186 - CITY
      ?auto_2766188 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2766187 ?auto_2766184 ) ( PERSON-AT ?auto_2766181 ?auto_2766182 ) ( not ( = ?auto_2766175 ?auto_2766182 ) ) ( not ( = ?auto_2766187 ?auto_2766184 ) ) ( PERSON-AT ?auto_2766178 ?auto_2766185 ) ( not ( = ?auto_2766175 ?auto_2766185 ) ) ( PERSON-AT ?auto_2766180 ?auto_2766182 ) ( PERSON-AT ?auto_2766179 ?auto_2766183 ) ( not ( = ?auto_2766175 ?auto_2766183 ) ) ( PERSON-AT ?auto_2766176 ?auto_2766186 ) ( not ( = ?auto_2766175 ?auto_2766186 ) ) ( PERSON-AT ?auto_2766177 ?auto_2766183 ) ( AIRCRAFT-AT ?auto_2766188 ?auto_2766175 ) ( FUEL-LEVEL ?auto_2766188 ?auto_2766187 ) ( not ( = ?auto_2766177 ?auto_2766176 ) ) ( not ( = ?auto_2766186 ?auto_2766183 ) ) ( not ( = ?auto_2766177 ?auto_2766179 ) ) ( not ( = ?auto_2766176 ?auto_2766179 ) ) ( not ( = ?auto_2766177 ?auto_2766180 ) ) ( not ( = ?auto_2766176 ?auto_2766180 ) ) ( not ( = ?auto_2766179 ?auto_2766180 ) ) ( not ( = ?auto_2766182 ?auto_2766183 ) ) ( not ( = ?auto_2766182 ?auto_2766186 ) ) ( not ( = ?auto_2766177 ?auto_2766178 ) ) ( not ( = ?auto_2766176 ?auto_2766178 ) ) ( not ( = ?auto_2766179 ?auto_2766178 ) ) ( not ( = ?auto_2766180 ?auto_2766178 ) ) ( not ( = ?auto_2766185 ?auto_2766182 ) ) ( not ( = ?auto_2766185 ?auto_2766183 ) ) ( not ( = ?auto_2766185 ?auto_2766186 ) ) ( not ( = ?auto_2766177 ?auto_2766181 ) ) ( not ( = ?auto_2766176 ?auto_2766181 ) ) ( not ( = ?auto_2766179 ?auto_2766181 ) ) ( not ( = ?auto_2766180 ?auto_2766181 ) ) ( not ( = ?auto_2766178 ?auto_2766181 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2766177 ?auto_2766176 ?auto_2766179 ?auto_2766180 ?auto_2766181 ?auto_2766178 ?auto_2766175 )
      ( FLY-6PPL-VERIFY ?auto_2766176 ?auto_2766177 ?auto_2766178 ?auto_2766179 ?auto_2766180 ?auto_2766181 ?auto_2766175 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2766317 - PERSON
      ?auto_2766318 - PERSON
      ?auto_2766319 - PERSON
      ?auto_2766320 - PERSON
      ?auto_2766321 - PERSON
      ?auto_2766322 - PERSON
      ?auto_2766316 - CITY
    )
    :vars
    (
      ?auto_2766328 - FLEVEL
      ?auto_2766325 - FLEVEL
      ?auto_2766323 - CITY
      ?auto_2766326 - CITY
      ?auto_2766324 - CITY
      ?auto_2766327 - CITY
      ?auto_2766329 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2766328 ?auto_2766325 ) ( PERSON-AT ?auto_2766322 ?auto_2766323 ) ( not ( = ?auto_2766316 ?auto_2766323 ) ) ( not ( = ?auto_2766328 ?auto_2766325 ) ) ( PERSON-AT ?auto_2766319 ?auto_2766326 ) ( not ( = ?auto_2766316 ?auto_2766326 ) ) ( PERSON-AT ?auto_2766320 ?auto_2766323 ) ( PERSON-AT ?auto_2766321 ?auto_2766324 ) ( not ( = ?auto_2766316 ?auto_2766324 ) ) ( PERSON-AT ?auto_2766317 ?auto_2766327 ) ( not ( = ?auto_2766316 ?auto_2766327 ) ) ( PERSON-AT ?auto_2766318 ?auto_2766324 ) ( AIRCRAFT-AT ?auto_2766329 ?auto_2766316 ) ( FUEL-LEVEL ?auto_2766329 ?auto_2766328 ) ( not ( = ?auto_2766318 ?auto_2766317 ) ) ( not ( = ?auto_2766327 ?auto_2766324 ) ) ( not ( = ?auto_2766318 ?auto_2766321 ) ) ( not ( = ?auto_2766317 ?auto_2766321 ) ) ( not ( = ?auto_2766318 ?auto_2766320 ) ) ( not ( = ?auto_2766317 ?auto_2766320 ) ) ( not ( = ?auto_2766321 ?auto_2766320 ) ) ( not ( = ?auto_2766323 ?auto_2766324 ) ) ( not ( = ?auto_2766323 ?auto_2766327 ) ) ( not ( = ?auto_2766318 ?auto_2766319 ) ) ( not ( = ?auto_2766317 ?auto_2766319 ) ) ( not ( = ?auto_2766321 ?auto_2766319 ) ) ( not ( = ?auto_2766320 ?auto_2766319 ) ) ( not ( = ?auto_2766326 ?auto_2766323 ) ) ( not ( = ?auto_2766326 ?auto_2766324 ) ) ( not ( = ?auto_2766326 ?auto_2766327 ) ) ( not ( = ?auto_2766318 ?auto_2766322 ) ) ( not ( = ?auto_2766317 ?auto_2766322 ) ) ( not ( = ?auto_2766321 ?auto_2766322 ) ) ( not ( = ?auto_2766320 ?auto_2766322 ) ) ( not ( = ?auto_2766319 ?auto_2766322 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2766318 ?auto_2766317 ?auto_2766321 ?auto_2766320 ?auto_2766322 ?auto_2766319 ?auto_2766316 )
      ( FLY-6PPL-VERIFY ?auto_2766317 ?auto_2766318 ?auto_2766319 ?auto_2766320 ?auto_2766321 ?auto_2766322 ?auto_2766316 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2766391 - PERSON
      ?auto_2766392 - PERSON
      ?auto_2766393 - PERSON
      ?auto_2766394 - PERSON
      ?auto_2766395 - PERSON
      ?auto_2766396 - PERSON
      ?auto_2766390 - CITY
    )
    :vars
    (
      ?auto_2766402 - FLEVEL
      ?auto_2766399 - FLEVEL
      ?auto_2766397 - CITY
      ?auto_2766400 - CITY
      ?auto_2766398 - CITY
      ?auto_2766401 - CITY
      ?auto_2766403 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2766402 ?auto_2766399 ) ( PERSON-AT ?auto_2766395 ?auto_2766397 ) ( not ( = ?auto_2766390 ?auto_2766397 ) ) ( not ( = ?auto_2766402 ?auto_2766399 ) ) ( PERSON-AT ?auto_2766393 ?auto_2766400 ) ( not ( = ?auto_2766390 ?auto_2766400 ) ) ( PERSON-AT ?auto_2766394 ?auto_2766397 ) ( PERSON-AT ?auto_2766396 ?auto_2766398 ) ( not ( = ?auto_2766390 ?auto_2766398 ) ) ( PERSON-AT ?auto_2766391 ?auto_2766401 ) ( not ( = ?auto_2766390 ?auto_2766401 ) ) ( PERSON-AT ?auto_2766392 ?auto_2766398 ) ( AIRCRAFT-AT ?auto_2766403 ?auto_2766390 ) ( FUEL-LEVEL ?auto_2766403 ?auto_2766402 ) ( not ( = ?auto_2766392 ?auto_2766391 ) ) ( not ( = ?auto_2766401 ?auto_2766398 ) ) ( not ( = ?auto_2766392 ?auto_2766396 ) ) ( not ( = ?auto_2766391 ?auto_2766396 ) ) ( not ( = ?auto_2766392 ?auto_2766394 ) ) ( not ( = ?auto_2766391 ?auto_2766394 ) ) ( not ( = ?auto_2766396 ?auto_2766394 ) ) ( not ( = ?auto_2766397 ?auto_2766398 ) ) ( not ( = ?auto_2766397 ?auto_2766401 ) ) ( not ( = ?auto_2766392 ?auto_2766393 ) ) ( not ( = ?auto_2766391 ?auto_2766393 ) ) ( not ( = ?auto_2766396 ?auto_2766393 ) ) ( not ( = ?auto_2766394 ?auto_2766393 ) ) ( not ( = ?auto_2766400 ?auto_2766397 ) ) ( not ( = ?auto_2766400 ?auto_2766398 ) ) ( not ( = ?auto_2766400 ?auto_2766401 ) ) ( not ( = ?auto_2766392 ?auto_2766395 ) ) ( not ( = ?auto_2766391 ?auto_2766395 ) ) ( not ( = ?auto_2766396 ?auto_2766395 ) ) ( not ( = ?auto_2766394 ?auto_2766395 ) ) ( not ( = ?auto_2766393 ?auto_2766395 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2766392 ?auto_2766391 ?auto_2766396 ?auto_2766394 ?auto_2766395 ?auto_2766393 ?auto_2766390 )
      ( FLY-6PPL-VERIFY ?auto_2766391 ?auto_2766392 ?auto_2766393 ?auto_2766394 ?auto_2766395 ?auto_2766396 ?auto_2766390 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2802444 - PERSON
      ?auto_2802445 - PERSON
      ?auto_2802446 - PERSON
      ?auto_2802447 - PERSON
      ?auto_2802448 - PERSON
      ?auto_2802449 - PERSON
      ?auto_2802443 - CITY
    )
    :vars
    (
      ?auto_2802455 - FLEVEL
      ?auto_2802452 - FLEVEL
      ?auto_2802450 - CITY
      ?auto_2802453 - CITY
      ?auto_2802451 - CITY
      ?auto_2802454 - CITY
      ?auto_2802456 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2802455 ?auto_2802452 ) ( PERSON-AT ?auto_2802449 ?auto_2802450 ) ( not ( = ?auto_2802443 ?auto_2802450 ) ) ( not ( = ?auto_2802455 ?auto_2802452 ) ) ( PERSON-AT ?auto_2802445 ?auto_2802453 ) ( not ( = ?auto_2802443 ?auto_2802453 ) ) ( PERSON-AT ?auto_2802448 ?auto_2802450 ) ( PERSON-AT ?auto_2802447 ?auto_2802451 ) ( not ( = ?auto_2802443 ?auto_2802451 ) ) ( PERSON-AT ?auto_2802444 ?auto_2802454 ) ( not ( = ?auto_2802443 ?auto_2802454 ) ) ( PERSON-AT ?auto_2802446 ?auto_2802451 ) ( AIRCRAFT-AT ?auto_2802456 ?auto_2802443 ) ( FUEL-LEVEL ?auto_2802456 ?auto_2802455 ) ( not ( = ?auto_2802446 ?auto_2802444 ) ) ( not ( = ?auto_2802454 ?auto_2802451 ) ) ( not ( = ?auto_2802446 ?auto_2802447 ) ) ( not ( = ?auto_2802444 ?auto_2802447 ) ) ( not ( = ?auto_2802446 ?auto_2802448 ) ) ( not ( = ?auto_2802444 ?auto_2802448 ) ) ( not ( = ?auto_2802447 ?auto_2802448 ) ) ( not ( = ?auto_2802450 ?auto_2802451 ) ) ( not ( = ?auto_2802450 ?auto_2802454 ) ) ( not ( = ?auto_2802446 ?auto_2802445 ) ) ( not ( = ?auto_2802444 ?auto_2802445 ) ) ( not ( = ?auto_2802447 ?auto_2802445 ) ) ( not ( = ?auto_2802448 ?auto_2802445 ) ) ( not ( = ?auto_2802453 ?auto_2802450 ) ) ( not ( = ?auto_2802453 ?auto_2802451 ) ) ( not ( = ?auto_2802453 ?auto_2802454 ) ) ( not ( = ?auto_2802446 ?auto_2802449 ) ) ( not ( = ?auto_2802444 ?auto_2802449 ) ) ( not ( = ?auto_2802447 ?auto_2802449 ) ) ( not ( = ?auto_2802448 ?auto_2802449 ) ) ( not ( = ?auto_2802445 ?auto_2802449 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2802446 ?auto_2802444 ?auto_2802447 ?auto_2802448 ?auto_2802449 ?auto_2802445 ?auto_2802443 )
      ( FLY-6PPL-VERIFY ?auto_2802444 ?auto_2802445 ?auto_2802446 ?auto_2802447 ?auto_2802448 ?auto_2802449 ?auto_2802443 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2802585 - PERSON
      ?auto_2802586 - PERSON
      ?auto_2802587 - PERSON
      ?auto_2802588 - PERSON
      ?auto_2802589 - PERSON
      ?auto_2802590 - PERSON
      ?auto_2802584 - CITY
    )
    :vars
    (
      ?auto_2802596 - FLEVEL
      ?auto_2802593 - FLEVEL
      ?auto_2802591 - CITY
      ?auto_2802594 - CITY
      ?auto_2802592 - CITY
      ?auto_2802595 - CITY
      ?auto_2802597 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2802596 ?auto_2802593 ) ( PERSON-AT ?auto_2802590 ?auto_2802591 ) ( not ( = ?auto_2802584 ?auto_2802591 ) ) ( not ( = ?auto_2802596 ?auto_2802593 ) ) ( PERSON-AT ?auto_2802586 ?auto_2802594 ) ( not ( = ?auto_2802584 ?auto_2802594 ) ) ( PERSON-AT ?auto_2802588 ?auto_2802591 ) ( PERSON-AT ?auto_2802589 ?auto_2802592 ) ( not ( = ?auto_2802584 ?auto_2802592 ) ) ( PERSON-AT ?auto_2802585 ?auto_2802595 ) ( not ( = ?auto_2802584 ?auto_2802595 ) ) ( PERSON-AT ?auto_2802587 ?auto_2802592 ) ( AIRCRAFT-AT ?auto_2802597 ?auto_2802584 ) ( FUEL-LEVEL ?auto_2802597 ?auto_2802596 ) ( not ( = ?auto_2802587 ?auto_2802585 ) ) ( not ( = ?auto_2802595 ?auto_2802592 ) ) ( not ( = ?auto_2802587 ?auto_2802589 ) ) ( not ( = ?auto_2802585 ?auto_2802589 ) ) ( not ( = ?auto_2802587 ?auto_2802588 ) ) ( not ( = ?auto_2802585 ?auto_2802588 ) ) ( not ( = ?auto_2802589 ?auto_2802588 ) ) ( not ( = ?auto_2802591 ?auto_2802592 ) ) ( not ( = ?auto_2802591 ?auto_2802595 ) ) ( not ( = ?auto_2802587 ?auto_2802586 ) ) ( not ( = ?auto_2802585 ?auto_2802586 ) ) ( not ( = ?auto_2802589 ?auto_2802586 ) ) ( not ( = ?auto_2802588 ?auto_2802586 ) ) ( not ( = ?auto_2802594 ?auto_2802591 ) ) ( not ( = ?auto_2802594 ?auto_2802592 ) ) ( not ( = ?auto_2802594 ?auto_2802595 ) ) ( not ( = ?auto_2802587 ?auto_2802590 ) ) ( not ( = ?auto_2802585 ?auto_2802590 ) ) ( not ( = ?auto_2802589 ?auto_2802590 ) ) ( not ( = ?auto_2802588 ?auto_2802590 ) ) ( not ( = ?auto_2802586 ?auto_2802590 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2802587 ?auto_2802585 ?auto_2802589 ?auto_2802588 ?auto_2802590 ?auto_2802586 ?auto_2802584 )
      ( FLY-6PPL-VERIFY ?auto_2802585 ?auto_2802586 ?auto_2802587 ?auto_2802588 ?auto_2802589 ?auto_2802590 ?auto_2802584 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_2802659 - PERSON
      ?auto_2802660 - PERSON
      ?auto_2802661 - PERSON
      ?auto_2802662 - PERSON
      ?auto_2802663 - PERSON
      ?auto_2802664 - PERSON
      ?auto_2802658 - CITY
    )
    :vars
    (
      ?auto_2802670 - FLEVEL
      ?auto_2802667 - FLEVEL
      ?auto_2802665 - CITY
      ?auto_2802668 - CITY
      ?auto_2802666 - CITY
      ?auto_2802669 - CITY
      ?auto_2802671 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2802670 ?auto_2802667 ) ( PERSON-AT ?auto_2802663 ?auto_2802665 ) ( not ( = ?auto_2802658 ?auto_2802665 ) ) ( not ( = ?auto_2802670 ?auto_2802667 ) ) ( PERSON-AT ?auto_2802660 ?auto_2802668 ) ( not ( = ?auto_2802658 ?auto_2802668 ) ) ( PERSON-AT ?auto_2802662 ?auto_2802665 ) ( PERSON-AT ?auto_2802664 ?auto_2802666 ) ( not ( = ?auto_2802658 ?auto_2802666 ) ) ( PERSON-AT ?auto_2802659 ?auto_2802669 ) ( not ( = ?auto_2802658 ?auto_2802669 ) ) ( PERSON-AT ?auto_2802661 ?auto_2802666 ) ( AIRCRAFT-AT ?auto_2802671 ?auto_2802658 ) ( FUEL-LEVEL ?auto_2802671 ?auto_2802670 ) ( not ( = ?auto_2802661 ?auto_2802659 ) ) ( not ( = ?auto_2802669 ?auto_2802666 ) ) ( not ( = ?auto_2802661 ?auto_2802664 ) ) ( not ( = ?auto_2802659 ?auto_2802664 ) ) ( not ( = ?auto_2802661 ?auto_2802662 ) ) ( not ( = ?auto_2802659 ?auto_2802662 ) ) ( not ( = ?auto_2802664 ?auto_2802662 ) ) ( not ( = ?auto_2802665 ?auto_2802666 ) ) ( not ( = ?auto_2802665 ?auto_2802669 ) ) ( not ( = ?auto_2802661 ?auto_2802660 ) ) ( not ( = ?auto_2802659 ?auto_2802660 ) ) ( not ( = ?auto_2802664 ?auto_2802660 ) ) ( not ( = ?auto_2802662 ?auto_2802660 ) ) ( not ( = ?auto_2802668 ?auto_2802665 ) ) ( not ( = ?auto_2802668 ?auto_2802666 ) ) ( not ( = ?auto_2802668 ?auto_2802669 ) ) ( not ( = ?auto_2802661 ?auto_2802663 ) ) ( not ( = ?auto_2802659 ?auto_2802663 ) ) ( not ( = ?auto_2802664 ?auto_2802663 ) ) ( not ( = ?auto_2802662 ?auto_2802663 ) ) ( not ( = ?auto_2802660 ?auto_2802663 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_2802661 ?auto_2802659 ?auto_2802664 ?auto_2802662 ?auto_2802663 ?auto_2802660 ?auto_2802658 )
      ( FLY-6PPL-VERIFY ?auto_2802659 ?auto_2802660 ?auto_2802661 ?auto_2802662 ?auto_2802663 ?auto_2802664 ?auto_2802658 ) )
  )

)

