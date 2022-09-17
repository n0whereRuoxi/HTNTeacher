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
      ?auto_3174570 - PERSON
      ?auto_3174569 - CITY
    )
    :vars
    (
      ?auto_3174573 - FLEVEL
      ?auto_3174572 - FLEVEL
      ?auto_3174574 - CITY
      ?auto_3174571 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3174573 ?auto_3174572 ) ( PERSON-AT ?auto_3174570 ?auto_3174574 ) ( AIRCRAFT-AT ?auto_3174571 ?auto_3174569 ) ( FUEL-LEVEL ?auto_3174571 ?auto_3174573 ) ( not ( = ?auto_3174569 ?auto_3174574 ) ) ( not ( = ?auto_3174573 ?auto_3174572 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_3174571 ?auto_3174569 ?auto_3174573 ?auto_3174572 )
      ( !FLY ?auto_3174571 ?auto_3174569 ?auto_3174574 ?auto_3174572 ?auto_3174573 )
      ( !REFUEL ?auto_3174571 ?auto_3174574 ?auto_3174573 ?auto_3174572 )
      ( !BOARD ?auto_3174570 ?auto_3174571 ?auto_3174574 )
      ( !FLY ?auto_3174571 ?auto_3174574 ?auto_3174569 ?auto_3174572 ?auto_3174573 )
      ( !DEBARK ?auto_3174570 ?auto_3174571 ?auto_3174569 )
      ( FLY-1PPL-VERIFY ?auto_3174570 ?auto_3174569 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3174593 - PERSON
      ?auto_3174594 - PERSON
      ?auto_3174592 - CITY
    )
    :vars
    (
      ?auto_3174596 - FLEVEL
      ?auto_3174597 - FLEVEL
      ?auto_3174595 - CITY
      ?auto_3174599 - CITY
      ?auto_3174598 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3174596 ?auto_3174597 ) ( PERSON-AT ?auto_3174594 ?auto_3174595 ) ( not ( = ?auto_3174592 ?auto_3174595 ) ) ( not ( = ?auto_3174596 ?auto_3174597 ) ) ( PERSON-AT ?auto_3174593 ?auto_3174599 ) ( AIRCRAFT-AT ?auto_3174598 ?auto_3174592 ) ( FUEL-LEVEL ?auto_3174598 ?auto_3174596 ) ( not ( = ?auto_3174592 ?auto_3174599 ) ) ( not ( = ?auto_3174593 ?auto_3174594 ) ) ( not ( = ?auto_3174595 ?auto_3174599 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3174593 ?auto_3174592 )
      ( FLY-1PPL ?auto_3174594 ?auto_3174592 )
      ( FLY-2PPL-VERIFY ?auto_3174593 ?auto_3174594 ?auto_3174592 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3174708 - PERSON
      ?auto_3174709 - PERSON
      ?auto_3174710 - PERSON
      ?auto_3174707 - CITY
    )
    :vars
    (
      ?auto_3174713 - FLEVEL
      ?auto_3174714 - FLEVEL
      ?auto_3174711 - CITY
      ?auto_3174716 - CITY
      ?auto_3174715 - CITY
      ?auto_3174712 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3174713 ?auto_3174714 ) ( PERSON-AT ?auto_3174710 ?auto_3174711 ) ( not ( = ?auto_3174707 ?auto_3174711 ) ) ( not ( = ?auto_3174713 ?auto_3174714 ) ) ( PERSON-AT ?auto_3174709 ?auto_3174716 ) ( not ( = ?auto_3174707 ?auto_3174716 ) ) ( PERSON-AT ?auto_3174708 ?auto_3174715 ) ( AIRCRAFT-AT ?auto_3174712 ?auto_3174707 ) ( FUEL-LEVEL ?auto_3174712 ?auto_3174713 ) ( not ( = ?auto_3174707 ?auto_3174715 ) ) ( not ( = ?auto_3174708 ?auto_3174709 ) ) ( not ( = ?auto_3174716 ?auto_3174715 ) ) ( not ( = ?auto_3174708 ?auto_3174710 ) ) ( not ( = ?auto_3174709 ?auto_3174710 ) ) ( not ( = ?auto_3174711 ?auto_3174716 ) ) ( not ( = ?auto_3174711 ?auto_3174715 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3174708 ?auto_3174709 ?auto_3174707 )
      ( FLY-1PPL ?auto_3174710 ?auto_3174707 )
      ( FLY-3PPL-VERIFY ?auto_3174708 ?auto_3174709 ?auto_3174710 ?auto_3174707 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_3175874 - PERSON
      ?auto_3175875 - PERSON
      ?auto_3175876 - PERSON
      ?auto_3175877 - PERSON
      ?auto_3175873 - CITY
    )
    :vars
    (
      ?auto_3175880 - FLEVEL
      ?auto_3175881 - FLEVEL
      ?auto_3175878 - CITY
      ?auto_3175883 - CITY
      ?auto_3175882 - CITY
      ?auto_3175884 - CITY
      ?auto_3175879 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3175880 ?auto_3175881 ) ( PERSON-AT ?auto_3175877 ?auto_3175878 ) ( not ( = ?auto_3175873 ?auto_3175878 ) ) ( not ( = ?auto_3175880 ?auto_3175881 ) ) ( PERSON-AT ?auto_3175876 ?auto_3175883 ) ( not ( = ?auto_3175873 ?auto_3175883 ) ) ( PERSON-AT ?auto_3175875 ?auto_3175882 ) ( not ( = ?auto_3175873 ?auto_3175882 ) ) ( PERSON-AT ?auto_3175874 ?auto_3175884 ) ( AIRCRAFT-AT ?auto_3175879 ?auto_3175873 ) ( FUEL-LEVEL ?auto_3175879 ?auto_3175880 ) ( not ( = ?auto_3175873 ?auto_3175884 ) ) ( not ( = ?auto_3175874 ?auto_3175875 ) ) ( not ( = ?auto_3175882 ?auto_3175884 ) ) ( not ( = ?auto_3175874 ?auto_3175876 ) ) ( not ( = ?auto_3175875 ?auto_3175876 ) ) ( not ( = ?auto_3175883 ?auto_3175882 ) ) ( not ( = ?auto_3175883 ?auto_3175884 ) ) ( not ( = ?auto_3175874 ?auto_3175877 ) ) ( not ( = ?auto_3175875 ?auto_3175877 ) ) ( not ( = ?auto_3175876 ?auto_3175877 ) ) ( not ( = ?auto_3175878 ?auto_3175883 ) ) ( not ( = ?auto_3175878 ?auto_3175882 ) ) ( not ( = ?auto_3175878 ?auto_3175884 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_3175874 ?auto_3175875 ?auto_3175876 ?auto_3175873 )
      ( FLY-1PPL ?auto_3175877 ?auto_3175873 )
      ( FLY-4PPL-VERIFY ?auto_3175874 ?auto_3175875 ?auto_3175876 ?auto_3175877 ?auto_3175873 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_3191792 - PERSON
      ?auto_3191793 - PERSON
      ?auto_3191794 - PERSON
      ?auto_3191795 - PERSON
      ?auto_3191796 - PERSON
      ?auto_3191791 - CITY
    )
    :vars
    (
      ?auto_3191800 - FLEVEL
      ?auto_3191799 - FLEVEL
      ?auto_3191797 - CITY
      ?auto_3191804 - CITY
      ?auto_3191802 - CITY
      ?auto_3191803 - CITY
      ?auto_3191801 - CITY
      ?auto_3191798 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3191800 ?auto_3191799 ) ( PERSON-AT ?auto_3191796 ?auto_3191797 ) ( not ( = ?auto_3191791 ?auto_3191797 ) ) ( not ( = ?auto_3191800 ?auto_3191799 ) ) ( PERSON-AT ?auto_3191795 ?auto_3191804 ) ( not ( = ?auto_3191791 ?auto_3191804 ) ) ( PERSON-AT ?auto_3191794 ?auto_3191802 ) ( not ( = ?auto_3191791 ?auto_3191802 ) ) ( PERSON-AT ?auto_3191793 ?auto_3191803 ) ( not ( = ?auto_3191791 ?auto_3191803 ) ) ( PERSON-AT ?auto_3191792 ?auto_3191801 ) ( AIRCRAFT-AT ?auto_3191798 ?auto_3191791 ) ( FUEL-LEVEL ?auto_3191798 ?auto_3191800 ) ( not ( = ?auto_3191791 ?auto_3191801 ) ) ( not ( = ?auto_3191792 ?auto_3191793 ) ) ( not ( = ?auto_3191803 ?auto_3191801 ) ) ( not ( = ?auto_3191792 ?auto_3191794 ) ) ( not ( = ?auto_3191793 ?auto_3191794 ) ) ( not ( = ?auto_3191802 ?auto_3191803 ) ) ( not ( = ?auto_3191802 ?auto_3191801 ) ) ( not ( = ?auto_3191792 ?auto_3191795 ) ) ( not ( = ?auto_3191793 ?auto_3191795 ) ) ( not ( = ?auto_3191794 ?auto_3191795 ) ) ( not ( = ?auto_3191804 ?auto_3191802 ) ) ( not ( = ?auto_3191804 ?auto_3191803 ) ) ( not ( = ?auto_3191804 ?auto_3191801 ) ) ( not ( = ?auto_3191792 ?auto_3191796 ) ) ( not ( = ?auto_3191793 ?auto_3191796 ) ) ( not ( = ?auto_3191794 ?auto_3191796 ) ) ( not ( = ?auto_3191795 ?auto_3191796 ) ) ( not ( = ?auto_3191797 ?auto_3191804 ) ) ( not ( = ?auto_3191797 ?auto_3191802 ) ) ( not ( = ?auto_3191797 ?auto_3191803 ) ) ( not ( = ?auto_3191797 ?auto_3191801 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_3191792 ?auto_3191793 ?auto_3191794 ?auto_3191795 ?auto_3191791 )
      ( FLY-1PPL ?auto_3191796 ?auto_3191791 )
      ( FLY-5PPL-VERIFY ?auto_3191792 ?auto_3191793 ?auto_3191794 ?auto_3191795 ?auto_3191796 ?auto_3191791 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_3454563 - PERSON
      ?auto_3454564 - PERSON
      ?auto_3454565 - PERSON
      ?auto_3454566 - PERSON
      ?auto_3454567 - PERSON
      ?auto_3454568 - PERSON
      ?auto_3454562 - CITY
    )
    :vars
    (
      ?auto_3454569 - FLEVEL
      ?auto_3454572 - FLEVEL
      ?auto_3454571 - CITY
      ?auto_3454573 - CITY
      ?auto_3454576 - CITY
      ?auto_3454575 - CITY
      ?auto_3454574 - CITY
      ?auto_3454570 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3454569 ?auto_3454572 ) ( PERSON-AT ?auto_3454568 ?auto_3454571 ) ( not ( = ?auto_3454562 ?auto_3454571 ) ) ( not ( = ?auto_3454569 ?auto_3454572 ) ) ( PERSON-AT ?auto_3454567 ?auto_3454573 ) ( not ( = ?auto_3454562 ?auto_3454573 ) ) ( PERSON-AT ?auto_3454566 ?auto_3454576 ) ( not ( = ?auto_3454562 ?auto_3454576 ) ) ( PERSON-AT ?auto_3454565 ?auto_3454575 ) ( not ( = ?auto_3454562 ?auto_3454575 ) ) ( PERSON-AT ?auto_3454564 ?auto_3454574 ) ( not ( = ?auto_3454562 ?auto_3454574 ) ) ( PERSON-AT ?auto_3454563 ?auto_3454571 ) ( AIRCRAFT-AT ?auto_3454570 ?auto_3454562 ) ( FUEL-LEVEL ?auto_3454570 ?auto_3454569 ) ( not ( = ?auto_3454563 ?auto_3454564 ) ) ( not ( = ?auto_3454574 ?auto_3454571 ) ) ( not ( = ?auto_3454563 ?auto_3454565 ) ) ( not ( = ?auto_3454564 ?auto_3454565 ) ) ( not ( = ?auto_3454575 ?auto_3454574 ) ) ( not ( = ?auto_3454575 ?auto_3454571 ) ) ( not ( = ?auto_3454563 ?auto_3454566 ) ) ( not ( = ?auto_3454564 ?auto_3454566 ) ) ( not ( = ?auto_3454565 ?auto_3454566 ) ) ( not ( = ?auto_3454576 ?auto_3454575 ) ) ( not ( = ?auto_3454576 ?auto_3454574 ) ) ( not ( = ?auto_3454576 ?auto_3454571 ) ) ( not ( = ?auto_3454563 ?auto_3454567 ) ) ( not ( = ?auto_3454564 ?auto_3454567 ) ) ( not ( = ?auto_3454565 ?auto_3454567 ) ) ( not ( = ?auto_3454566 ?auto_3454567 ) ) ( not ( = ?auto_3454573 ?auto_3454576 ) ) ( not ( = ?auto_3454573 ?auto_3454575 ) ) ( not ( = ?auto_3454573 ?auto_3454574 ) ) ( not ( = ?auto_3454573 ?auto_3454571 ) ) ( not ( = ?auto_3454563 ?auto_3454568 ) ) ( not ( = ?auto_3454564 ?auto_3454568 ) ) ( not ( = ?auto_3454565 ?auto_3454568 ) ) ( not ( = ?auto_3454566 ?auto_3454568 ) ) ( not ( = ?auto_3454567 ?auto_3454568 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_3454563 ?auto_3454564 ?auto_3454565 ?auto_3454566 ?auto_3454567 ?auto_3454562 )
      ( FLY-1PPL ?auto_3454568 ?auto_3454562 )
      ( FLY-6PPL-VERIFY ?auto_3454563 ?auto_3454564 ?auto_3454565 ?auto_3454566 ?auto_3454567 ?auto_3454568 ?auto_3454562 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_3454642 - PERSON
      ?auto_3454643 - PERSON
      ?auto_3454644 - PERSON
      ?auto_3454645 - PERSON
      ?auto_3454646 - PERSON
      ?auto_3454647 - PERSON
      ?auto_3454641 - CITY
    )
    :vars
    (
      ?auto_3454655 - FLEVEL
      ?auto_3454651 - FLEVEL
      ?auto_3454653 - CITY
      ?auto_3454654 - CITY
      ?auto_3454648 - CITY
      ?auto_3454649 - CITY
      ?auto_3454652 - CITY
      ?auto_3454650 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3454655 ?auto_3454651 ) ( PERSON-AT ?auto_3454646 ?auto_3454653 ) ( not ( = ?auto_3454641 ?auto_3454653 ) ) ( not ( = ?auto_3454655 ?auto_3454651 ) ) ( PERSON-AT ?auto_3454647 ?auto_3454654 ) ( not ( = ?auto_3454641 ?auto_3454654 ) ) ( PERSON-AT ?auto_3454645 ?auto_3454648 ) ( not ( = ?auto_3454641 ?auto_3454648 ) ) ( PERSON-AT ?auto_3454644 ?auto_3454649 ) ( not ( = ?auto_3454641 ?auto_3454649 ) ) ( PERSON-AT ?auto_3454643 ?auto_3454652 ) ( not ( = ?auto_3454641 ?auto_3454652 ) ) ( PERSON-AT ?auto_3454642 ?auto_3454653 ) ( AIRCRAFT-AT ?auto_3454650 ?auto_3454641 ) ( FUEL-LEVEL ?auto_3454650 ?auto_3454655 ) ( not ( = ?auto_3454642 ?auto_3454643 ) ) ( not ( = ?auto_3454652 ?auto_3454653 ) ) ( not ( = ?auto_3454642 ?auto_3454644 ) ) ( not ( = ?auto_3454643 ?auto_3454644 ) ) ( not ( = ?auto_3454649 ?auto_3454652 ) ) ( not ( = ?auto_3454649 ?auto_3454653 ) ) ( not ( = ?auto_3454642 ?auto_3454645 ) ) ( not ( = ?auto_3454643 ?auto_3454645 ) ) ( not ( = ?auto_3454644 ?auto_3454645 ) ) ( not ( = ?auto_3454648 ?auto_3454649 ) ) ( not ( = ?auto_3454648 ?auto_3454652 ) ) ( not ( = ?auto_3454648 ?auto_3454653 ) ) ( not ( = ?auto_3454642 ?auto_3454647 ) ) ( not ( = ?auto_3454643 ?auto_3454647 ) ) ( not ( = ?auto_3454644 ?auto_3454647 ) ) ( not ( = ?auto_3454645 ?auto_3454647 ) ) ( not ( = ?auto_3454654 ?auto_3454648 ) ) ( not ( = ?auto_3454654 ?auto_3454649 ) ) ( not ( = ?auto_3454654 ?auto_3454652 ) ) ( not ( = ?auto_3454654 ?auto_3454653 ) ) ( not ( = ?auto_3454642 ?auto_3454646 ) ) ( not ( = ?auto_3454643 ?auto_3454646 ) ) ( not ( = ?auto_3454644 ?auto_3454646 ) ) ( not ( = ?auto_3454645 ?auto_3454646 ) ) ( not ( = ?auto_3454647 ?auto_3454646 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_3454642 ?auto_3454643 ?auto_3454644 ?auto_3454645 ?auto_3454647 ?auto_3454646 ?auto_3454641 )
      ( FLY-6PPL-VERIFY ?auto_3454642 ?auto_3454643 ?auto_3454644 ?auto_3454645 ?auto_3454646 ?auto_3454647 ?auto_3454641 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_3455195 - PERSON
      ?auto_3455196 - PERSON
      ?auto_3455197 - PERSON
      ?auto_3455198 - PERSON
      ?auto_3455199 - PERSON
      ?auto_3455200 - PERSON
      ?auto_3455194 - CITY
    )
    :vars
    (
      ?auto_3455204 - FLEVEL
      ?auto_3455202 - FLEVEL
      ?auto_3455207 - CITY
      ?auto_3455206 - CITY
      ?auto_3455208 - CITY
      ?auto_3455203 - CITY
      ?auto_3455201 - CITY
      ?auto_3455205 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3455204 ?auto_3455202 ) ( PERSON-AT ?auto_3455198 ?auto_3455207 ) ( not ( = ?auto_3455194 ?auto_3455207 ) ) ( not ( = ?auto_3455204 ?auto_3455202 ) ) ( PERSON-AT ?auto_3455200 ?auto_3455206 ) ( not ( = ?auto_3455194 ?auto_3455206 ) ) ( PERSON-AT ?auto_3455199 ?auto_3455208 ) ( not ( = ?auto_3455194 ?auto_3455208 ) ) ( PERSON-AT ?auto_3455197 ?auto_3455203 ) ( not ( = ?auto_3455194 ?auto_3455203 ) ) ( PERSON-AT ?auto_3455196 ?auto_3455201 ) ( not ( = ?auto_3455194 ?auto_3455201 ) ) ( PERSON-AT ?auto_3455195 ?auto_3455207 ) ( AIRCRAFT-AT ?auto_3455205 ?auto_3455194 ) ( FUEL-LEVEL ?auto_3455205 ?auto_3455204 ) ( not ( = ?auto_3455195 ?auto_3455196 ) ) ( not ( = ?auto_3455201 ?auto_3455207 ) ) ( not ( = ?auto_3455195 ?auto_3455197 ) ) ( not ( = ?auto_3455196 ?auto_3455197 ) ) ( not ( = ?auto_3455203 ?auto_3455201 ) ) ( not ( = ?auto_3455203 ?auto_3455207 ) ) ( not ( = ?auto_3455195 ?auto_3455199 ) ) ( not ( = ?auto_3455196 ?auto_3455199 ) ) ( not ( = ?auto_3455197 ?auto_3455199 ) ) ( not ( = ?auto_3455208 ?auto_3455203 ) ) ( not ( = ?auto_3455208 ?auto_3455201 ) ) ( not ( = ?auto_3455208 ?auto_3455207 ) ) ( not ( = ?auto_3455195 ?auto_3455200 ) ) ( not ( = ?auto_3455196 ?auto_3455200 ) ) ( not ( = ?auto_3455197 ?auto_3455200 ) ) ( not ( = ?auto_3455199 ?auto_3455200 ) ) ( not ( = ?auto_3455206 ?auto_3455208 ) ) ( not ( = ?auto_3455206 ?auto_3455203 ) ) ( not ( = ?auto_3455206 ?auto_3455201 ) ) ( not ( = ?auto_3455206 ?auto_3455207 ) ) ( not ( = ?auto_3455195 ?auto_3455198 ) ) ( not ( = ?auto_3455196 ?auto_3455198 ) ) ( not ( = ?auto_3455197 ?auto_3455198 ) ) ( not ( = ?auto_3455199 ?auto_3455198 ) ) ( not ( = ?auto_3455200 ?auto_3455198 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_3455195 ?auto_3455196 ?auto_3455197 ?auto_3455199 ?auto_3455198 ?auto_3455200 ?auto_3455194 )
      ( FLY-6PPL-VERIFY ?auto_3455195 ?auto_3455196 ?auto_3455197 ?auto_3455198 ?auto_3455199 ?auto_3455200 ?auto_3455194 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_3459885 - PERSON
      ?auto_3459886 - PERSON
      ?auto_3459887 - PERSON
      ?auto_3459888 - PERSON
      ?auto_3459889 - PERSON
      ?auto_3459890 - PERSON
      ?auto_3459884 - CITY
    )
    :vars
    (
      ?auto_3459894 - FLEVEL
      ?auto_3459892 - FLEVEL
      ?auto_3459897 - CITY
      ?auto_3459896 - CITY
      ?auto_3459898 - CITY
      ?auto_3459893 - CITY
      ?auto_3459891 - CITY
      ?auto_3459895 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3459894 ?auto_3459892 ) ( PERSON-AT ?auto_3459887 ?auto_3459897 ) ( not ( = ?auto_3459884 ?auto_3459897 ) ) ( not ( = ?auto_3459894 ?auto_3459892 ) ) ( PERSON-AT ?auto_3459890 ?auto_3459896 ) ( not ( = ?auto_3459884 ?auto_3459896 ) ) ( PERSON-AT ?auto_3459889 ?auto_3459898 ) ( not ( = ?auto_3459884 ?auto_3459898 ) ) ( PERSON-AT ?auto_3459888 ?auto_3459893 ) ( not ( = ?auto_3459884 ?auto_3459893 ) ) ( PERSON-AT ?auto_3459886 ?auto_3459891 ) ( not ( = ?auto_3459884 ?auto_3459891 ) ) ( PERSON-AT ?auto_3459885 ?auto_3459897 ) ( AIRCRAFT-AT ?auto_3459895 ?auto_3459884 ) ( FUEL-LEVEL ?auto_3459895 ?auto_3459894 ) ( not ( = ?auto_3459885 ?auto_3459886 ) ) ( not ( = ?auto_3459891 ?auto_3459897 ) ) ( not ( = ?auto_3459885 ?auto_3459888 ) ) ( not ( = ?auto_3459886 ?auto_3459888 ) ) ( not ( = ?auto_3459893 ?auto_3459891 ) ) ( not ( = ?auto_3459893 ?auto_3459897 ) ) ( not ( = ?auto_3459885 ?auto_3459889 ) ) ( not ( = ?auto_3459886 ?auto_3459889 ) ) ( not ( = ?auto_3459888 ?auto_3459889 ) ) ( not ( = ?auto_3459898 ?auto_3459893 ) ) ( not ( = ?auto_3459898 ?auto_3459891 ) ) ( not ( = ?auto_3459898 ?auto_3459897 ) ) ( not ( = ?auto_3459885 ?auto_3459890 ) ) ( not ( = ?auto_3459886 ?auto_3459890 ) ) ( not ( = ?auto_3459888 ?auto_3459890 ) ) ( not ( = ?auto_3459889 ?auto_3459890 ) ) ( not ( = ?auto_3459896 ?auto_3459898 ) ) ( not ( = ?auto_3459896 ?auto_3459893 ) ) ( not ( = ?auto_3459896 ?auto_3459891 ) ) ( not ( = ?auto_3459896 ?auto_3459897 ) ) ( not ( = ?auto_3459885 ?auto_3459887 ) ) ( not ( = ?auto_3459886 ?auto_3459887 ) ) ( not ( = ?auto_3459888 ?auto_3459887 ) ) ( not ( = ?auto_3459889 ?auto_3459887 ) ) ( not ( = ?auto_3459890 ?auto_3459887 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_3459885 ?auto_3459886 ?auto_3459888 ?auto_3459889 ?auto_3459887 ?auto_3459890 ?auto_3459884 )
      ( FLY-6PPL-VERIFY ?auto_3459885 ?auto_3459886 ?auto_3459887 ?auto_3459888 ?auto_3459889 ?auto_3459890 ?auto_3459884 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_3500140 - PERSON
      ?auto_3500141 - PERSON
      ?auto_3500142 - PERSON
      ?auto_3500143 - PERSON
      ?auto_3500144 - PERSON
      ?auto_3500145 - PERSON
      ?auto_3500139 - CITY
    )
    :vars
    (
      ?auto_3500149 - FLEVEL
      ?auto_3500147 - FLEVEL
      ?auto_3500152 - CITY
      ?auto_3500151 - CITY
      ?auto_3500153 - CITY
      ?auto_3500148 - CITY
      ?auto_3500146 - CITY
      ?auto_3500150 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3500149 ?auto_3500147 ) ( PERSON-AT ?auto_3500141 ?auto_3500152 ) ( not ( = ?auto_3500139 ?auto_3500152 ) ) ( not ( = ?auto_3500149 ?auto_3500147 ) ) ( PERSON-AT ?auto_3500145 ?auto_3500151 ) ( not ( = ?auto_3500139 ?auto_3500151 ) ) ( PERSON-AT ?auto_3500144 ?auto_3500153 ) ( not ( = ?auto_3500139 ?auto_3500153 ) ) ( PERSON-AT ?auto_3500143 ?auto_3500148 ) ( not ( = ?auto_3500139 ?auto_3500148 ) ) ( PERSON-AT ?auto_3500142 ?auto_3500146 ) ( not ( = ?auto_3500139 ?auto_3500146 ) ) ( PERSON-AT ?auto_3500140 ?auto_3500152 ) ( AIRCRAFT-AT ?auto_3500150 ?auto_3500139 ) ( FUEL-LEVEL ?auto_3500150 ?auto_3500149 ) ( not ( = ?auto_3500140 ?auto_3500142 ) ) ( not ( = ?auto_3500146 ?auto_3500152 ) ) ( not ( = ?auto_3500140 ?auto_3500143 ) ) ( not ( = ?auto_3500142 ?auto_3500143 ) ) ( not ( = ?auto_3500148 ?auto_3500146 ) ) ( not ( = ?auto_3500148 ?auto_3500152 ) ) ( not ( = ?auto_3500140 ?auto_3500144 ) ) ( not ( = ?auto_3500142 ?auto_3500144 ) ) ( not ( = ?auto_3500143 ?auto_3500144 ) ) ( not ( = ?auto_3500153 ?auto_3500148 ) ) ( not ( = ?auto_3500153 ?auto_3500146 ) ) ( not ( = ?auto_3500153 ?auto_3500152 ) ) ( not ( = ?auto_3500140 ?auto_3500145 ) ) ( not ( = ?auto_3500142 ?auto_3500145 ) ) ( not ( = ?auto_3500143 ?auto_3500145 ) ) ( not ( = ?auto_3500144 ?auto_3500145 ) ) ( not ( = ?auto_3500151 ?auto_3500153 ) ) ( not ( = ?auto_3500151 ?auto_3500148 ) ) ( not ( = ?auto_3500151 ?auto_3500146 ) ) ( not ( = ?auto_3500151 ?auto_3500152 ) ) ( not ( = ?auto_3500140 ?auto_3500141 ) ) ( not ( = ?auto_3500142 ?auto_3500141 ) ) ( not ( = ?auto_3500143 ?auto_3500141 ) ) ( not ( = ?auto_3500144 ?auto_3500141 ) ) ( not ( = ?auto_3500145 ?auto_3500141 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_3500140 ?auto_3500142 ?auto_3500143 ?auto_3500144 ?auto_3500141 ?auto_3500145 ?auto_3500139 )
      ( FLY-6PPL-VERIFY ?auto_3500140 ?auto_3500141 ?auto_3500142 ?auto_3500143 ?auto_3500144 ?auto_3500145 ?auto_3500139 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_3520271 - PERSON
      ?auto_3520272 - PERSON
      ?auto_3520273 - PERSON
      ?auto_3520274 - PERSON
      ?auto_3520275 - PERSON
      ?auto_3520276 - PERSON
      ?auto_3520270 - CITY
    )
    :vars
    (
      ?auto_3520280 - FLEVEL
      ?auto_3520278 - FLEVEL
      ?auto_3520283 - CITY
      ?auto_3520282 - CITY
      ?auto_3520284 - CITY
      ?auto_3520279 - CITY
      ?auto_3520277 - CITY
      ?auto_3520281 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3520280 ?auto_3520278 ) ( PERSON-AT ?auto_3520276 ?auto_3520283 ) ( not ( = ?auto_3520270 ?auto_3520283 ) ) ( not ( = ?auto_3520280 ?auto_3520278 ) ) ( PERSON-AT ?auto_3520275 ?auto_3520282 ) ( not ( = ?auto_3520270 ?auto_3520282 ) ) ( PERSON-AT ?auto_3520274 ?auto_3520284 ) ( not ( = ?auto_3520270 ?auto_3520284 ) ) ( PERSON-AT ?auto_3520273 ?auto_3520279 ) ( not ( = ?auto_3520270 ?auto_3520279 ) ) ( PERSON-AT ?auto_3520271 ?auto_3520277 ) ( not ( = ?auto_3520270 ?auto_3520277 ) ) ( PERSON-AT ?auto_3520272 ?auto_3520283 ) ( AIRCRAFT-AT ?auto_3520281 ?auto_3520270 ) ( FUEL-LEVEL ?auto_3520281 ?auto_3520280 ) ( not ( = ?auto_3520272 ?auto_3520271 ) ) ( not ( = ?auto_3520277 ?auto_3520283 ) ) ( not ( = ?auto_3520272 ?auto_3520273 ) ) ( not ( = ?auto_3520271 ?auto_3520273 ) ) ( not ( = ?auto_3520279 ?auto_3520277 ) ) ( not ( = ?auto_3520279 ?auto_3520283 ) ) ( not ( = ?auto_3520272 ?auto_3520274 ) ) ( not ( = ?auto_3520271 ?auto_3520274 ) ) ( not ( = ?auto_3520273 ?auto_3520274 ) ) ( not ( = ?auto_3520284 ?auto_3520279 ) ) ( not ( = ?auto_3520284 ?auto_3520277 ) ) ( not ( = ?auto_3520284 ?auto_3520283 ) ) ( not ( = ?auto_3520272 ?auto_3520275 ) ) ( not ( = ?auto_3520271 ?auto_3520275 ) ) ( not ( = ?auto_3520273 ?auto_3520275 ) ) ( not ( = ?auto_3520274 ?auto_3520275 ) ) ( not ( = ?auto_3520282 ?auto_3520284 ) ) ( not ( = ?auto_3520282 ?auto_3520279 ) ) ( not ( = ?auto_3520282 ?auto_3520277 ) ) ( not ( = ?auto_3520282 ?auto_3520283 ) ) ( not ( = ?auto_3520272 ?auto_3520276 ) ) ( not ( = ?auto_3520271 ?auto_3520276 ) ) ( not ( = ?auto_3520273 ?auto_3520276 ) ) ( not ( = ?auto_3520274 ?auto_3520276 ) ) ( not ( = ?auto_3520275 ?auto_3520276 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_3520272 ?auto_3520271 ?auto_3520273 ?auto_3520274 ?auto_3520276 ?auto_3520275 ?auto_3520270 )
      ( FLY-6PPL-VERIFY ?auto_3520271 ?auto_3520272 ?auto_3520273 ?auto_3520274 ?auto_3520275 ?auto_3520276 ?auto_3520270 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_3520350 - PERSON
      ?auto_3520351 - PERSON
      ?auto_3520352 - PERSON
      ?auto_3520353 - PERSON
      ?auto_3520354 - PERSON
      ?auto_3520355 - PERSON
      ?auto_3520349 - CITY
    )
    :vars
    (
      ?auto_3520359 - FLEVEL
      ?auto_3520357 - FLEVEL
      ?auto_3520362 - CITY
      ?auto_3520361 - CITY
      ?auto_3520363 - CITY
      ?auto_3520358 - CITY
      ?auto_3520356 - CITY
      ?auto_3520360 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3520359 ?auto_3520357 ) ( PERSON-AT ?auto_3520354 ?auto_3520362 ) ( not ( = ?auto_3520349 ?auto_3520362 ) ) ( not ( = ?auto_3520359 ?auto_3520357 ) ) ( PERSON-AT ?auto_3520355 ?auto_3520361 ) ( not ( = ?auto_3520349 ?auto_3520361 ) ) ( PERSON-AT ?auto_3520353 ?auto_3520363 ) ( not ( = ?auto_3520349 ?auto_3520363 ) ) ( PERSON-AT ?auto_3520352 ?auto_3520358 ) ( not ( = ?auto_3520349 ?auto_3520358 ) ) ( PERSON-AT ?auto_3520350 ?auto_3520356 ) ( not ( = ?auto_3520349 ?auto_3520356 ) ) ( PERSON-AT ?auto_3520351 ?auto_3520362 ) ( AIRCRAFT-AT ?auto_3520360 ?auto_3520349 ) ( FUEL-LEVEL ?auto_3520360 ?auto_3520359 ) ( not ( = ?auto_3520351 ?auto_3520350 ) ) ( not ( = ?auto_3520356 ?auto_3520362 ) ) ( not ( = ?auto_3520351 ?auto_3520352 ) ) ( not ( = ?auto_3520350 ?auto_3520352 ) ) ( not ( = ?auto_3520358 ?auto_3520356 ) ) ( not ( = ?auto_3520358 ?auto_3520362 ) ) ( not ( = ?auto_3520351 ?auto_3520353 ) ) ( not ( = ?auto_3520350 ?auto_3520353 ) ) ( not ( = ?auto_3520352 ?auto_3520353 ) ) ( not ( = ?auto_3520363 ?auto_3520358 ) ) ( not ( = ?auto_3520363 ?auto_3520356 ) ) ( not ( = ?auto_3520363 ?auto_3520362 ) ) ( not ( = ?auto_3520351 ?auto_3520355 ) ) ( not ( = ?auto_3520350 ?auto_3520355 ) ) ( not ( = ?auto_3520352 ?auto_3520355 ) ) ( not ( = ?auto_3520353 ?auto_3520355 ) ) ( not ( = ?auto_3520361 ?auto_3520363 ) ) ( not ( = ?auto_3520361 ?auto_3520358 ) ) ( not ( = ?auto_3520361 ?auto_3520356 ) ) ( not ( = ?auto_3520361 ?auto_3520362 ) ) ( not ( = ?auto_3520351 ?auto_3520354 ) ) ( not ( = ?auto_3520350 ?auto_3520354 ) ) ( not ( = ?auto_3520352 ?auto_3520354 ) ) ( not ( = ?auto_3520353 ?auto_3520354 ) ) ( not ( = ?auto_3520355 ?auto_3520354 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_3520351 ?auto_3520350 ?auto_3520352 ?auto_3520353 ?auto_3520354 ?auto_3520355 ?auto_3520349 )
      ( FLY-6PPL-VERIFY ?auto_3520350 ?auto_3520351 ?auto_3520352 ?auto_3520353 ?auto_3520354 ?auto_3520355 ?auto_3520349 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_3520903 - PERSON
      ?auto_3520904 - PERSON
      ?auto_3520905 - PERSON
      ?auto_3520906 - PERSON
      ?auto_3520907 - PERSON
      ?auto_3520908 - PERSON
      ?auto_3520902 - CITY
    )
    :vars
    (
      ?auto_3520912 - FLEVEL
      ?auto_3520910 - FLEVEL
      ?auto_3520915 - CITY
      ?auto_3520914 - CITY
      ?auto_3520916 - CITY
      ?auto_3520911 - CITY
      ?auto_3520909 - CITY
      ?auto_3520913 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3520912 ?auto_3520910 ) ( PERSON-AT ?auto_3520906 ?auto_3520915 ) ( not ( = ?auto_3520902 ?auto_3520915 ) ) ( not ( = ?auto_3520912 ?auto_3520910 ) ) ( PERSON-AT ?auto_3520908 ?auto_3520914 ) ( not ( = ?auto_3520902 ?auto_3520914 ) ) ( PERSON-AT ?auto_3520907 ?auto_3520916 ) ( not ( = ?auto_3520902 ?auto_3520916 ) ) ( PERSON-AT ?auto_3520905 ?auto_3520911 ) ( not ( = ?auto_3520902 ?auto_3520911 ) ) ( PERSON-AT ?auto_3520903 ?auto_3520909 ) ( not ( = ?auto_3520902 ?auto_3520909 ) ) ( PERSON-AT ?auto_3520904 ?auto_3520915 ) ( AIRCRAFT-AT ?auto_3520913 ?auto_3520902 ) ( FUEL-LEVEL ?auto_3520913 ?auto_3520912 ) ( not ( = ?auto_3520904 ?auto_3520903 ) ) ( not ( = ?auto_3520909 ?auto_3520915 ) ) ( not ( = ?auto_3520904 ?auto_3520905 ) ) ( not ( = ?auto_3520903 ?auto_3520905 ) ) ( not ( = ?auto_3520911 ?auto_3520909 ) ) ( not ( = ?auto_3520911 ?auto_3520915 ) ) ( not ( = ?auto_3520904 ?auto_3520907 ) ) ( not ( = ?auto_3520903 ?auto_3520907 ) ) ( not ( = ?auto_3520905 ?auto_3520907 ) ) ( not ( = ?auto_3520916 ?auto_3520911 ) ) ( not ( = ?auto_3520916 ?auto_3520909 ) ) ( not ( = ?auto_3520916 ?auto_3520915 ) ) ( not ( = ?auto_3520904 ?auto_3520908 ) ) ( not ( = ?auto_3520903 ?auto_3520908 ) ) ( not ( = ?auto_3520905 ?auto_3520908 ) ) ( not ( = ?auto_3520907 ?auto_3520908 ) ) ( not ( = ?auto_3520914 ?auto_3520916 ) ) ( not ( = ?auto_3520914 ?auto_3520911 ) ) ( not ( = ?auto_3520914 ?auto_3520909 ) ) ( not ( = ?auto_3520914 ?auto_3520915 ) ) ( not ( = ?auto_3520904 ?auto_3520906 ) ) ( not ( = ?auto_3520903 ?auto_3520906 ) ) ( not ( = ?auto_3520905 ?auto_3520906 ) ) ( not ( = ?auto_3520907 ?auto_3520906 ) ) ( not ( = ?auto_3520908 ?auto_3520906 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_3520904 ?auto_3520903 ?auto_3520905 ?auto_3520907 ?auto_3520906 ?auto_3520908 ?auto_3520902 )
      ( FLY-6PPL-VERIFY ?auto_3520903 ?auto_3520904 ?auto_3520905 ?auto_3520906 ?auto_3520907 ?auto_3520908 ?auto_3520902 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_3525593 - PERSON
      ?auto_3525594 - PERSON
      ?auto_3525595 - PERSON
      ?auto_3525596 - PERSON
      ?auto_3525597 - PERSON
      ?auto_3525598 - PERSON
      ?auto_3525592 - CITY
    )
    :vars
    (
      ?auto_3525602 - FLEVEL
      ?auto_3525600 - FLEVEL
      ?auto_3525605 - CITY
      ?auto_3525604 - CITY
      ?auto_3525606 - CITY
      ?auto_3525601 - CITY
      ?auto_3525599 - CITY
      ?auto_3525603 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3525602 ?auto_3525600 ) ( PERSON-AT ?auto_3525595 ?auto_3525605 ) ( not ( = ?auto_3525592 ?auto_3525605 ) ) ( not ( = ?auto_3525602 ?auto_3525600 ) ) ( PERSON-AT ?auto_3525598 ?auto_3525604 ) ( not ( = ?auto_3525592 ?auto_3525604 ) ) ( PERSON-AT ?auto_3525597 ?auto_3525606 ) ( not ( = ?auto_3525592 ?auto_3525606 ) ) ( PERSON-AT ?auto_3525596 ?auto_3525601 ) ( not ( = ?auto_3525592 ?auto_3525601 ) ) ( PERSON-AT ?auto_3525593 ?auto_3525599 ) ( not ( = ?auto_3525592 ?auto_3525599 ) ) ( PERSON-AT ?auto_3525594 ?auto_3525605 ) ( AIRCRAFT-AT ?auto_3525603 ?auto_3525592 ) ( FUEL-LEVEL ?auto_3525603 ?auto_3525602 ) ( not ( = ?auto_3525594 ?auto_3525593 ) ) ( not ( = ?auto_3525599 ?auto_3525605 ) ) ( not ( = ?auto_3525594 ?auto_3525596 ) ) ( not ( = ?auto_3525593 ?auto_3525596 ) ) ( not ( = ?auto_3525601 ?auto_3525599 ) ) ( not ( = ?auto_3525601 ?auto_3525605 ) ) ( not ( = ?auto_3525594 ?auto_3525597 ) ) ( not ( = ?auto_3525593 ?auto_3525597 ) ) ( not ( = ?auto_3525596 ?auto_3525597 ) ) ( not ( = ?auto_3525606 ?auto_3525601 ) ) ( not ( = ?auto_3525606 ?auto_3525599 ) ) ( not ( = ?auto_3525606 ?auto_3525605 ) ) ( not ( = ?auto_3525594 ?auto_3525598 ) ) ( not ( = ?auto_3525593 ?auto_3525598 ) ) ( not ( = ?auto_3525596 ?auto_3525598 ) ) ( not ( = ?auto_3525597 ?auto_3525598 ) ) ( not ( = ?auto_3525604 ?auto_3525606 ) ) ( not ( = ?auto_3525604 ?auto_3525601 ) ) ( not ( = ?auto_3525604 ?auto_3525599 ) ) ( not ( = ?auto_3525604 ?auto_3525605 ) ) ( not ( = ?auto_3525594 ?auto_3525595 ) ) ( not ( = ?auto_3525593 ?auto_3525595 ) ) ( not ( = ?auto_3525596 ?auto_3525595 ) ) ( not ( = ?auto_3525597 ?auto_3525595 ) ) ( not ( = ?auto_3525598 ?auto_3525595 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_3525594 ?auto_3525593 ?auto_3525596 ?auto_3525597 ?auto_3525595 ?auto_3525598 ?auto_3525592 )
      ( FLY-6PPL-VERIFY ?auto_3525593 ?auto_3525594 ?auto_3525595 ?auto_3525596 ?auto_3525597 ?auto_3525598 ?auto_3525592 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_3539728 - PERSON
      ?auto_3539729 - PERSON
      ?auto_3539730 - PERSON
      ?auto_3539731 - PERSON
      ?auto_3539732 - PERSON
      ?auto_3539733 - PERSON
      ?auto_3539727 - CITY
    )
    :vars
    (
      ?auto_3539737 - FLEVEL
      ?auto_3539735 - FLEVEL
      ?auto_3539740 - CITY
      ?auto_3539739 - CITY
      ?auto_3539741 - CITY
      ?auto_3539736 - CITY
      ?auto_3539734 - CITY
      ?auto_3539738 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3539737 ?auto_3539735 ) ( PERSON-AT ?auto_3539733 ?auto_3539740 ) ( not ( = ?auto_3539727 ?auto_3539740 ) ) ( not ( = ?auto_3539737 ?auto_3539735 ) ) ( PERSON-AT ?auto_3539732 ?auto_3539739 ) ( not ( = ?auto_3539727 ?auto_3539739 ) ) ( PERSON-AT ?auto_3539731 ?auto_3539741 ) ( not ( = ?auto_3539727 ?auto_3539741 ) ) ( PERSON-AT ?auto_3539729 ?auto_3539736 ) ( not ( = ?auto_3539727 ?auto_3539736 ) ) ( PERSON-AT ?auto_3539728 ?auto_3539734 ) ( not ( = ?auto_3539727 ?auto_3539734 ) ) ( PERSON-AT ?auto_3539730 ?auto_3539740 ) ( AIRCRAFT-AT ?auto_3539738 ?auto_3539727 ) ( FUEL-LEVEL ?auto_3539738 ?auto_3539737 ) ( not ( = ?auto_3539730 ?auto_3539728 ) ) ( not ( = ?auto_3539734 ?auto_3539740 ) ) ( not ( = ?auto_3539730 ?auto_3539729 ) ) ( not ( = ?auto_3539728 ?auto_3539729 ) ) ( not ( = ?auto_3539736 ?auto_3539734 ) ) ( not ( = ?auto_3539736 ?auto_3539740 ) ) ( not ( = ?auto_3539730 ?auto_3539731 ) ) ( not ( = ?auto_3539728 ?auto_3539731 ) ) ( not ( = ?auto_3539729 ?auto_3539731 ) ) ( not ( = ?auto_3539741 ?auto_3539736 ) ) ( not ( = ?auto_3539741 ?auto_3539734 ) ) ( not ( = ?auto_3539741 ?auto_3539740 ) ) ( not ( = ?auto_3539730 ?auto_3539732 ) ) ( not ( = ?auto_3539728 ?auto_3539732 ) ) ( not ( = ?auto_3539729 ?auto_3539732 ) ) ( not ( = ?auto_3539731 ?auto_3539732 ) ) ( not ( = ?auto_3539739 ?auto_3539741 ) ) ( not ( = ?auto_3539739 ?auto_3539736 ) ) ( not ( = ?auto_3539739 ?auto_3539734 ) ) ( not ( = ?auto_3539739 ?auto_3539740 ) ) ( not ( = ?auto_3539730 ?auto_3539733 ) ) ( not ( = ?auto_3539728 ?auto_3539733 ) ) ( not ( = ?auto_3539729 ?auto_3539733 ) ) ( not ( = ?auto_3539731 ?auto_3539733 ) ) ( not ( = ?auto_3539732 ?auto_3539733 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_3539730 ?auto_3539728 ?auto_3539729 ?auto_3539731 ?auto_3539733 ?auto_3539732 ?auto_3539727 )
      ( FLY-6PPL-VERIFY ?auto_3539728 ?auto_3539729 ?auto_3539730 ?auto_3539731 ?auto_3539732 ?auto_3539733 ?auto_3539727 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_3539807 - PERSON
      ?auto_3539808 - PERSON
      ?auto_3539809 - PERSON
      ?auto_3539810 - PERSON
      ?auto_3539811 - PERSON
      ?auto_3539812 - PERSON
      ?auto_3539806 - CITY
    )
    :vars
    (
      ?auto_3539816 - FLEVEL
      ?auto_3539814 - FLEVEL
      ?auto_3539819 - CITY
      ?auto_3539818 - CITY
      ?auto_3539820 - CITY
      ?auto_3539815 - CITY
      ?auto_3539813 - CITY
      ?auto_3539817 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3539816 ?auto_3539814 ) ( PERSON-AT ?auto_3539811 ?auto_3539819 ) ( not ( = ?auto_3539806 ?auto_3539819 ) ) ( not ( = ?auto_3539816 ?auto_3539814 ) ) ( PERSON-AT ?auto_3539812 ?auto_3539818 ) ( not ( = ?auto_3539806 ?auto_3539818 ) ) ( PERSON-AT ?auto_3539810 ?auto_3539820 ) ( not ( = ?auto_3539806 ?auto_3539820 ) ) ( PERSON-AT ?auto_3539808 ?auto_3539815 ) ( not ( = ?auto_3539806 ?auto_3539815 ) ) ( PERSON-AT ?auto_3539807 ?auto_3539813 ) ( not ( = ?auto_3539806 ?auto_3539813 ) ) ( PERSON-AT ?auto_3539809 ?auto_3539819 ) ( AIRCRAFT-AT ?auto_3539817 ?auto_3539806 ) ( FUEL-LEVEL ?auto_3539817 ?auto_3539816 ) ( not ( = ?auto_3539809 ?auto_3539807 ) ) ( not ( = ?auto_3539813 ?auto_3539819 ) ) ( not ( = ?auto_3539809 ?auto_3539808 ) ) ( not ( = ?auto_3539807 ?auto_3539808 ) ) ( not ( = ?auto_3539815 ?auto_3539813 ) ) ( not ( = ?auto_3539815 ?auto_3539819 ) ) ( not ( = ?auto_3539809 ?auto_3539810 ) ) ( not ( = ?auto_3539807 ?auto_3539810 ) ) ( not ( = ?auto_3539808 ?auto_3539810 ) ) ( not ( = ?auto_3539820 ?auto_3539815 ) ) ( not ( = ?auto_3539820 ?auto_3539813 ) ) ( not ( = ?auto_3539820 ?auto_3539819 ) ) ( not ( = ?auto_3539809 ?auto_3539812 ) ) ( not ( = ?auto_3539807 ?auto_3539812 ) ) ( not ( = ?auto_3539808 ?auto_3539812 ) ) ( not ( = ?auto_3539810 ?auto_3539812 ) ) ( not ( = ?auto_3539818 ?auto_3539820 ) ) ( not ( = ?auto_3539818 ?auto_3539815 ) ) ( not ( = ?auto_3539818 ?auto_3539813 ) ) ( not ( = ?auto_3539818 ?auto_3539819 ) ) ( not ( = ?auto_3539809 ?auto_3539811 ) ) ( not ( = ?auto_3539807 ?auto_3539811 ) ) ( not ( = ?auto_3539808 ?auto_3539811 ) ) ( not ( = ?auto_3539810 ?auto_3539811 ) ) ( not ( = ?auto_3539812 ?auto_3539811 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_3539809 ?auto_3539807 ?auto_3539808 ?auto_3539810 ?auto_3539811 ?auto_3539812 ?auto_3539806 )
      ( FLY-6PPL-VERIFY ?auto_3539807 ?auto_3539808 ?auto_3539809 ?auto_3539810 ?auto_3539811 ?auto_3539812 ?auto_3539806 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_3540360 - PERSON
      ?auto_3540361 - PERSON
      ?auto_3540362 - PERSON
      ?auto_3540363 - PERSON
      ?auto_3540364 - PERSON
      ?auto_3540365 - PERSON
      ?auto_3540359 - CITY
    )
    :vars
    (
      ?auto_3540369 - FLEVEL
      ?auto_3540367 - FLEVEL
      ?auto_3540372 - CITY
      ?auto_3540371 - CITY
      ?auto_3540373 - CITY
      ?auto_3540368 - CITY
      ?auto_3540366 - CITY
      ?auto_3540370 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3540369 ?auto_3540367 ) ( PERSON-AT ?auto_3540363 ?auto_3540372 ) ( not ( = ?auto_3540359 ?auto_3540372 ) ) ( not ( = ?auto_3540369 ?auto_3540367 ) ) ( PERSON-AT ?auto_3540365 ?auto_3540371 ) ( not ( = ?auto_3540359 ?auto_3540371 ) ) ( PERSON-AT ?auto_3540364 ?auto_3540373 ) ( not ( = ?auto_3540359 ?auto_3540373 ) ) ( PERSON-AT ?auto_3540361 ?auto_3540368 ) ( not ( = ?auto_3540359 ?auto_3540368 ) ) ( PERSON-AT ?auto_3540360 ?auto_3540366 ) ( not ( = ?auto_3540359 ?auto_3540366 ) ) ( PERSON-AT ?auto_3540362 ?auto_3540372 ) ( AIRCRAFT-AT ?auto_3540370 ?auto_3540359 ) ( FUEL-LEVEL ?auto_3540370 ?auto_3540369 ) ( not ( = ?auto_3540362 ?auto_3540360 ) ) ( not ( = ?auto_3540366 ?auto_3540372 ) ) ( not ( = ?auto_3540362 ?auto_3540361 ) ) ( not ( = ?auto_3540360 ?auto_3540361 ) ) ( not ( = ?auto_3540368 ?auto_3540366 ) ) ( not ( = ?auto_3540368 ?auto_3540372 ) ) ( not ( = ?auto_3540362 ?auto_3540364 ) ) ( not ( = ?auto_3540360 ?auto_3540364 ) ) ( not ( = ?auto_3540361 ?auto_3540364 ) ) ( not ( = ?auto_3540373 ?auto_3540368 ) ) ( not ( = ?auto_3540373 ?auto_3540366 ) ) ( not ( = ?auto_3540373 ?auto_3540372 ) ) ( not ( = ?auto_3540362 ?auto_3540365 ) ) ( not ( = ?auto_3540360 ?auto_3540365 ) ) ( not ( = ?auto_3540361 ?auto_3540365 ) ) ( not ( = ?auto_3540364 ?auto_3540365 ) ) ( not ( = ?auto_3540371 ?auto_3540373 ) ) ( not ( = ?auto_3540371 ?auto_3540368 ) ) ( not ( = ?auto_3540371 ?auto_3540366 ) ) ( not ( = ?auto_3540371 ?auto_3540372 ) ) ( not ( = ?auto_3540362 ?auto_3540363 ) ) ( not ( = ?auto_3540360 ?auto_3540363 ) ) ( not ( = ?auto_3540361 ?auto_3540363 ) ) ( not ( = ?auto_3540364 ?auto_3540363 ) ) ( not ( = ?auto_3540365 ?auto_3540363 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_3540362 ?auto_3540360 ?auto_3540361 ?auto_3540364 ?auto_3540363 ?auto_3540365 ?auto_3540359 )
      ( FLY-6PPL-VERIFY ?auto_3540360 ?auto_3540361 ?auto_3540362 ?auto_3540363 ?auto_3540364 ?auto_3540365 ?auto_3540359 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_3543738 - PERSON
      ?auto_3543739 - PERSON
      ?auto_3543740 - PERSON
      ?auto_3543741 - PERSON
      ?auto_3543742 - PERSON
      ?auto_3543743 - PERSON
      ?auto_3543737 - CITY
    )
    :vars
    (
      ?auto_3543747 - FLEVEL
      ?auto_3543745 - FLEVEL
      ?auto_3543750 - CITY
      ?auto_3543749 - CITY
      ?auto_3543751 - CITY
      ?auto_3543746 - CITY
      ?auto_3543744 - CITY
      ?auto_3543748 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3543747 ?auto_3543745 ) ( PERSON-AT ?auto_3543743 ?auto_3543750 ) ( not ( = ?auto_3543737 ?auto_3543750 ) ) ( not ( = ?auto_3543747 ?auto_3543745 ) ) ( PERSON-AT ?auto_3543742 ?auto_3543749 ) ( not ( = ?auto_3543737 ?auto_3543749 ) ) ( PERSON-AT ?auto_3543740 ?auto_3543751 ) ( not ( = ?auto_3543737 ?auto_3543751 ) ) ( PERSON-AT ?auto_3543739 ?auto_3543746 ) ( not ( = ?auto_3543737 ?auto_3543746 ) ) ( PERSON-AT ?auto_3543738 ?auto_3543744 ) ( not ( = ?auto_3543737 ?auto_3543744 ) ) ( PERSON-AT ?auto_3543741 ?auto_3543750 ) ( AIRCRAFT-AT ?auto_3543748 ?auto_3543737 ) ( FUEL-LEVEL ?auto_3543748 ?auto_3543747 ) ( not ( = ?auto_3543741 ?auto_3543738 ) ) ( not ( = ?auto_3543744 ?auto_3543750 ) ) ( not ( = ?auto_3543741 ?auto_3543739 ) ) ( not ( = ?auto_3543738 ?auto_3543739 ) ) ( not ( = ?auto_3543746 ?auto_3543744 ) ) ( not ( = ?auto_3543746 ?auto_3543750 ) ) ( not ( = ?auto_3543741 ?auto_3543740 ) ) ( not ( = ?auto_3543738 ?auto_3543740 ) ) ( not ( = ?auto_3543739 ?auto_3543740 ) ) ( not ( = ?auto_3543751 ?auto_3543746 ) ) ( not ( = ?auto_3543751 ?auto_3543744 ) ) ( not ( = ?auto_3543751 ?auto_3543750 ) ) ( not ( = ?auto_3543741 ?auto_3543742 ) ) ( not ( = ?auto_3543738 ?auto_3543742 ) ) ( not ( = ?auto_3543739 ?auto_3543742 ) ) ( not ( = ?auto_3543740 ?auto_3543742 ) ) ( not ( = ?auto_3543749 ?auto_3543751 ) ) ( not ( = ?auto_3543749 ?auto_3543746 ) ) ( not ( = ?auto_3543749 ?auto_3543744 ) ) ( not ( = ?auto_3543749 ?auto_3543750 ) ) ( not ( = ?auto_3543741 ?auto_3543743 ) ) ( not ( = ?auto_3543738 ?auto_3543743 ) ) ( not ( = ?auto_3543739 ?auto_3543743 ) ) ( not ( = ?auto_3543740 ?auto_3543743 ) ) ( not ( = ?auto_3543742 ?auto_3543743 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_3543741 ?auto_3543738 ?auto_3543739 ?auto_3543740 ?auto_3543743 ?auto_3543742 ?auto_3543737 )
      ( FLY-6PPL-VERIFY ?auto_3543738 ?auto_3543739 ?auto_3543740 ?auto_3543741 ?auto_3543742 ?auto_3543743 ?auto_3543737 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_3543817 - PERSON
      ?auto_3543818 - PERSON
      ?auto_3543819 - PERSON
      ?auto_3543820 - PERSON
      ?auto_3543821 - PERSON
      ?auto_3543822 - PERSON
      ?auto_3543816 - CITY
    )
    :vars
    (
      ?auto_3543826 - FLEVEL
      ?auto_3543824 - FLEVEL
      ?auto_3543829 - CITY
      ?auto_3543828 - CITY
      ?auto_3543830 - CITY
      ?auto_3543825 - CITY
      ?auto_3543823 - CITY
      ?auto_3543827 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3543826 ?auto_3543824 ) ( PERSON-AT ?auto_3543821 ?auto_3543829 ) ( not ( = ?auto_3543816 ?auto_3543829 ) ) ( not ( = ?auto_3543826 ?auto_3543824 ) ) ( PERSON-AT ?auto_3543822 ?auto_3543828 ) ( not ( = ?auto_3543816 ?auto_3543828 ) ) ( PERSON-AT ?auto_3543819 ?auto_3543830 ) ( not ( = ?auto_3543816 ?auto_3543830 ) ) ( PERSON-AT ?auto_3543818 ?auto_3543825 ) ( not ( = ?auto_3543816 ?auto_3543825 ) ) ( PERSON-AT ?auto_3543817 ?auto_3543823 ) ( not ( = ?auto_3543816 ?auto_3543823 ) ) ( PERSON-AT ?auto_3543820 ?auto_3543829 ) ( AIRCRAFT-AT ?auto_3543827 ?auto_3543816 ) ( FUEL-LEVEL ?auto_3543827 ?auto_3543826 ) ( not ( = ?auto_3543820 ?auto_3543817 ) ) ( not ( = ?auto_3543823 ?auto_3543829 ) ) ( not ( = ?auto_3543820 ?auto_3543818 ) ) ( not ( = ?auto_3543817 ?auto_3543818 ) ) ( not ( = ?auto_3543825 ?auto_3543823 ) ) ( not ( = ?auto_3543825 ?auto_3543829 ) ) ( not ( = ?auto_3543820 ?auto_3543819 ) ) ( not ( = ?auto_3543817 ?auto_3543819 ) ) ( not ( = ?auto_3543818 ?auto_3543819 ) ) ( not ( = ?auto_3543830 ?auto_3543825 ) ) ( not ( = ?auto_3543830 ?auto_3543823 ) ) ( not ( = ?auto_3543830 ?auto_3543829 ) ) ( not ( = ?auto_3543820 ?auto_3543822 ) ) ( not ( = ?auto_3543817 ?auto_3543822 ) ) ( not ( = ?auto_3543818 ?auto_3543822 ) ) ( not ( = ?auto_3543819 ?auto_3543822 ) ) ( not ( = ?auto_3543828 ?auto_3543830 ) ) ( not ( = ?auto_3543828 ?auto_3543825 ) ) ( not ( = ?auto_3543828 ?auto_3543823 ) ) ( not ( = ?auto_3543828 ?auto_3543829 ) ) ( not ( = ?auto_3543820 ?auto_3543821 ) ) ( not ( = ?auto_3543817 ?auto_3543821 ) ) ( not ( = ?auto_3543818 ?auto_3543821 ) ) ( not ( = ?auto_3543819 ?auto_3543821 ) ) ( not ( = ?auto_3543822 ?auto_3543821 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_3543820 ?auto_3543817 ?auto_3543818 ?auto_3543819 ?auto_3543821 ?auto_3543822 ?auto_3543816 )
      ( FLY-6PPL-VERIFY ?auto_3543817 ?auto_3543818 ?auto_3543819 ?auto_3543820 ?auto_3543821 ?auto_3543822 ?auto_3543816 ) )
  )

  ( :method FLY-6PPL
    :parameters
    (
      ?auto_3544397 - PERSON
      ?auto_3544398 - PERSON
      ?auto_3544399 - PERSON
      ?auto_3544400 - PERSON
      ?auto_3544401 - PERSON
      ?auto_3544402 - PERSON
      ?auto_3544396 - CITY
    )
    :vars
    (
      ?auto_3544406 - FLEVEL
      ?auto_3544404 - FLEVEL
      ?auto_3544409 - CITY
      ?auto_3544408 - CITY
      ?auto_3544410 - CITY
      ?auto_3544405 - CITY
      ?auto_3544403 - CITY
      ?auto_3544407 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3544406 ?auto_3544404 ) ( PERSON-AT ?auto_3544402 ?auto_3544409 ) ( not ( = ?auto_3544396 ?auto_3544409 ) ) ( not ( = ?auto_3544406 ?auto_3544404 ) ) ( PERSON-AT ?auto_3544400 ?auto_3544408 ) ( not ( = ?auto_3544396 ?auto_3544408 ) ) ( PERSON-AT ?auto_3544399 ?auto_3544410 ) ( not ( = ?auto_3544396 ?auto_3544410 ) ) ( PERSON-AT ?auto_3544398 ?auto_3544405 ) ( not ( = ?auto_3544396 ?auto_3544405 ) ) ( PERSON-AT ?auto_3544397 ?auto_3544403 ) ( not ( = ?auto_3544396 ?auto_3544403 ) ) ( PERSON-AT ?auto_3544401 ?auto_3544409 ) ( AIRCRAFT-AT ?auto_3544407 ?auto_3544396 ) ( FUEL-LEVEL ?auto_3544407 ?auto_3544406 ) ( not ( = ?auto_3544401 ?auto_3544397 ) ) ( not ( = ?auto_3544403 ?auto_3544409 ) ) ( not ( = ?auto_3544401 ?auto_3544398 ) ) ( not ( = ?auto_3544397 ?auto_3544398 ) ) ( not ( = ?auto_3544405 ?auto_3544403 ) ) ( not ( = ?auto_3544405 ?auto_3544409 ) ) ( not ( = ?auto_3544401 ?auto_3544399 ) ) ( not ( = ?auto_3544397 ?auto_3544399 ) ) ( not ( = ?auto_3544398 ?auto_3544399 ) ) ( not ( = ?auto_3544410 ?auto_3544405 ) ) ( not ( = ?auto_3544410 ?auto_3544403 ) ) ( not ( = ?auto_3544410 ?auto_3544409 ) ) ( not ( = ?auto_3544401 ?auto_3544400 ) ) ( not ( = ?auto_3544397 ?auto_3544400 ) ) ( not ( = ?auto_3544398 ?auto_3544400 ) ) ( not ( = ?auto_3544399 ?auto_3544400 ) ) ( not ( = ?auto_3544408 ?auto_3544410 ) ) ( not ( = ?auto_3544408 ?auto_3544405 ) ) ( not ( = ?auto_3544408 ?auto_3544403 ) ) ( not ( = ?auto_3544408 ?auto_3544409 ) ) ( not ( = ?auto_3544401 ?auto_3544402 ) ) ( not ( = ?auto_3544397 ?auto_3544402 ) ) ( not ( = ?auto_3544398 ?auto_3544402 ) ) ( not ( = ?auto_3544399 ?auto_3544402 ) ) ( not ( = ?auto_3544400 ?auto_3544402 ) ) )
    :subtasks
    ( ( FLY-6PPL ?auto_3544401 ?auto_3544397 ?auto_3544398 ?auto_3544399 ?auto_3544402 ?auto_3544400 ?auto_3544396 )
      ( FLY-6PPL-VERIFY ?auto_3544397 ?auto_3544398 ?auto_3544399 ?auto_3544400 ?auto_3544401 ?auto_3544402 ?auto_3544396 ) )
  )

)

