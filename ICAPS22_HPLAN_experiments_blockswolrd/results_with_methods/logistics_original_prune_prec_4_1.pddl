( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55118 - OBJ
      ?auto_55117 - LOCATION
    )
    :vars
    (
      ?auto_55119 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55119 ?auto_55117 ) ( IN-TRUCK ?auto_55118 ?auto_55119 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_55118 ?auto_55119 ?auto_55117 )
      ( DELIVER-1PKG-VERIFY ?auto_55118 ?auto_55117 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55136 - OBJ
      ?auto_55135 - LOCATION
    )
    :vars
    (
      ?auto_55137 - TRUCK
      ?auto_55138 - LOCATION
      ?auto_55139 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55136 ?auto_55137 ) ( TRUCK-AT ?auto_55137 ?auto_55138 ) ( IN-CITY ?auto_55138 ?auto_55139 ) ( IN-CITY ?auto_55135 ?auto_55139 ) ( not ( = ?auto_55135 ?auto_55138 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_55137 ?auto_55138 ?auto_55135 ?auto_55139 )
      ( DELIVER-1PKG ?auto_55136 ?auto_55135 )
      ( DELIVER-1PKG-VERIFY ?auto_55136 ?auto_55135 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55162 - OBJ
      ?auto_55161 - LOCATION
    )
    :vars
    (
      ?auto_55165 - TRUCK
      ?auto_55163 - LOCATION
      ?auto_55164 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55165 ?auto_55163 ) ( IN-CITY ?auto_55163 ?auto_55164 ) ( IN-CITY ?auto_55161 ?auto_55164 ) ( not ( = ?auto_55161 ?auto_55163 ) ) ( OBJ-AT ?auto_55162 ?auto_55163 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_55162 ?auto_55165 ?auto_55163 )
      ( DELIVER-1PKG ?auto_55162 ?auto_55161 )
      ( DELIVER-1PKG-VERIFY ?auto_55162 ?auto_55161 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55188 - OBJ
      ?auto_55187 - LOCATION
    )
    :vars
    (
      ?auto_55190 - LOCATION
      ?auto_55189 - CITY
      ?auto_55191 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55190 ?auto_55189 ) ( IN-CITY ?auto_55187 ?auto_55189 ) ( not ( = ?auto_55187 ?auto_55190 ) ) ( OBJ-AT ?auto_55188 ?auto_55190 ) ( TRUCK-AT ?auto_55191 ?auto_55187 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_55191 ?auto_55187 ?auto_55190 ?auto_55189 )
      ( DELIVER-1PKG ?auto_55188 ?auto_55187 )
      ( DELIVER-1PKG-VERIFY ?auto_55188 ?auto_55187 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55331 - OBJ
      ?auto_55332 - OBJ
      ?auto_55330 - LOCATION
    )
    :vars
    (
      ?auto_55333 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55332 ?auto_55331 ) ) ( TRUCK-AT ?auto_55333 ?auto_55330 ) ( IN-TRUCK ?auto_55332 ?auto_55333 ) ( OBJ-AT ?auto_55331 ?auto_55330 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55332 ?auto_55330 )
      ( DELIVER-2PKG-VERIFY ?auto_55331 ?auto_55332 ?auto_55330 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55335 - OBJ
      ?auto_55336 - OBJ
      ?auto_55334 - LOCATION
    )
    :vars
    (
      ?auto_55337 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55336 ?auto_55335 ) ) ( TRUCK-AT ?auto_55337 ?auto_55334 ) ( IN-TRUCK ?auto_55335 ?auto_55337 ) ( OBJ-AT ?auto_55336 ?auto_55334 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55335 ?auto_55334 )
      ( DELIVER-2PKG-VERIFY ?auto_55335 ?auto_55336 ?auto_55334 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55473 - OBJ
      ?auto_55474 - OBJ
      ?auto_55472 - LOCATION
    )
    :vars
    (
      ?auto_55476 - TRUCK
      ?auto_55475 - LOCATION
      ?auto_55477 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_55474 ?auto_55473 ) ) ( IN-TRUCK ?auto_55474 ?auto_55476 ) ( TRUCK-AT ?auto_55476 ?auto_55475 ) ( IN-CITY ?auto_55475 ?auto_55477 ) ( IN-CITY ?auto_55472 ?auto_55477 ) ( not ( = ?auto_55472 ?auto_55475 ) ) ( OBJ-AT ?auto_55473 ?auto_55472 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55474 ?auto_55472 )
      ( DELIVER-2PKG-VERIFY ?auto_55473 ?auto_55474 ?auto_55472 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55479 - OBJ
      ?auto_55480 - OBJ
      ?auto_55478 - LOCATION
    )
    :vars
    (
      ?auto_55481 - TRUCK
      ?auto_55483 - LOCATION
      ?auto_55482 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_55480 ?auto_55479 ) ) ( IN-TRUCK ?auto_55479 ?auto_55481 ) ( TRUCK-AT ?auto_55481 ?auto_55483 ) ( IN-CITY ?auto_55483 ?auto_55482 ) ( IN-CITY ?auto_55478 ?auto_55482 ) ( not ( = ?auto_55478 ?auto_55483 ) ) ( OBJ-AT ?auto_55480 ?auto_55478 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55480 ?auto_55479 ?auto_55478 )
      ( DELIVER-2PKG-VERIFY ?auto_55479 ?auto_55480 ?auto_55478 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55663 - OBJ
      ?auto_55662 - LOCATION
    )
    :vars
    (
      ?auto_55664 - OBJ
      ?auto_55665 - TRUCK
      ?auto_55667 - LOCATION
      ?auto_55666 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_55663 ?auto_55664 ) ) ( TRUCK-AT ?auto_55665 ?auto_55667 ) ( IN-CITY ?auto_55667 ?auto_55666 ) ( IN-CITY ?auto_55662 ?auto_55666 ) ( not ( = ?auto_55662 ?auto_55667 ) ) ( OBJ-AT ?auto_55664 ?auto_55662 ) ( OBJ-AT ?auto_55663 ?auto_55667 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_55663 ?auto_55665 ?auto_55667 )
      ( DELIVER-2PKG ?auto_55664 ?auto_55663 ?auto_55662 )
      ( DELIVER-1PKG-VERIFY ?auto_55663 ?auto_55662 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55669 - OBJ
      ?auto_55670 - OBJ
      ?auto_55668 - LOCATION
    )
    :vars
    (
      ?auto_55673 - TRUCK
      ?auto_55672 - LOCATION
      ?auto_55671 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_55670 ?auto_55669 ) ) ( TRUCK-AT ?auto_55673 ?auto_55672 ) ( IN-CITY ?auto_55672 ?auto_55671 ) ( IN-CITY ?auto_55668 ?auto_55671 ) ( not ( = ?auto_55668 ?auto_55672 ) ) ( OBJ-AT ?auto_55669 ?auto_55668 ) ( OBJ-AT ?auto_55670 ?auto_55672 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55670 ?auto_55668 )
      ( DELIVER-2PKG-VERIFY ?auto_55669 ?auto_55670 ?auto_55668 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55675 - OBJ
      ?auto_55676 - OBJ
      ?auto_55674 - LOCATION
    )
    :vars
    (
      ?auto_55678 - TRUCK
      ?auto_55677 - LOCATION
      ?auto_55679 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_55676 ?auto_55675 ) ) ( TRUCK-AT ?auto_55678 ?auto_55677 ) ( IN-CITY ?auto_55677 ?auto_55679 ) ( IN-CITY ?auto_55674 ?auto_55679 ) ( not ( = ?auto_55674 ?auto_55677 ) ) ( OBJ-AT ?auto_55676 ?auto_55674 ) ( OBJ-AT ?auto_55675 ?auto_55677 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55676 ?auto_55675 ?auto_55674 )
      ( DELIVER-2PKG-VERIFY ?auto_55675 ?auto_55676 ?auto_55674 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55859 - OBJ
      ?auto_55858 - LOCATION
    )
    :vars
    (
      ?auto_55860 - OBJ
      ?auto_55861 - LOCATION
      ?auto_55863 - CITY
      ?auto_55862 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55859 ?auto_55860 ) ) ( IN-CITY ?auto_55861 ?auto_55863 ) ( IN-CITY ?auto_55858 ?auto_55863 ) ( not ( = ?auto_55858 ?auto_55861 ) ) ( OBJ-AT ?auto_55860 ?auto_55858 ) ( OBJ-AT ?auto_55859 ?auto_55861 ) ( TRUCK-AT ?auto_55862 ?auto_55858 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_55862 ?auto_55858 ?auto_55861 ?auto_55863 )
      ( DELIVER-2PKG ?auto_55860 ?auto_55859 ?auto_55858 )
      ( DELIVER-1PKG-VERIFY ?auto_55859 ?auto_55858 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55865 - OBJ
      ?auto_55866 - OBJ
      ?auto_55864 - LOCATION
    )
    :vars
    (
      ?auto_55867 - LOCATION
      ?auto_55868 - CITY
      ?auto_55869 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55866 ?auto_55865 ) ) ( IN-CITY ?auto_55867 ?auto_55868 ) ( IN-CITY ?auto_55864 ?auto_55868 ) ( not ( = ?auto_55864 ?auto_55867 ) ) ( OBJ-AT ?auto_55865 ?auto_55864 ) ( OBJ-AT ?auto_55866 ?auto_55867 ) ( TRUCK-AT ?auto_55869 ?auto_55864 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55866 ?auto_55864 )
      ( DELIVER-2PKG-VERIFY ?auto_55865 ?auto_55866 ?auto_55864 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55871 - OBJ
      ?auto_55872 - OBJ
      ?auto_55870 - LOCATION
    )
    :vars
    (
      ?auto_55875 - LOCATION
      ?auto_55874 - CITY
      ?auto_55873 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55872 ?auto_55871 ) ) ( IN-CITY ?auto_55875 ?auto_55874 ) ( IN-CITY ?auto_55870 ?auto_55874 ) ( not ( = ?auto_55870 ?auto_55875 ) ) ( OBJ-AT ?auto_55872 ?auto_55870 ) ( OBJ-AT ?auto_55871 ?auto_55875 ) ( TRUCK-AT ?auto_55873 ?auto_55870 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55872 ?auto_55871 ?auto_55870 )
      ( DELIVER-2PKG-VERIFY ?auto_55871 ?auto_55872 ?auto_55870 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56055 - OBJ
      ?auto_56054 - LOCATION
    )
    :vars
    (
      ?auto_56056 - OBJ
      ?auto_56059 - LOCATION
      ?auto_56058 - CITY
      ?auto_56057 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56055 ?auto_56056 ) ) ( IN-CITY ?auto_56059 ?auto_56058 ) ( IN-CITY ?auto_56054 ?auto_56058 ) ( not ( = ?auto_56054 ?auto_56059 ) ) ( OBJ-AT ?auto_56055 ?auto_56059 ) ( TRUCK-AT ?auto_56057 ?auto_56054 ) ( IN-TRUCK ?auto_56056 ?auto_56057 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56056 ?auto_56054 )
      ( DELIVER-2PKG ?auto_56056 ?auto_56055 ?auto_56054 )
      ( DELIVER-1PKG-VERIFY ?auto_56055 ?auto_56054 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56061 - OBJ
      ?auto_56062 - OBJ
      ?auto_56060 - LOCATION
    )
    :vars
    (
      ?auto_56063 - LOCATION
      ?auto_56065 - CITY
      ?auto_56064 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56062 ?auto_56061 ) ) ( IN-CITY ?auto_56063 ?auto_56065 ) ( IN-CITY ?auto_56060 ?auto_56065 ) ( not ( = ?auto_56060 ?auto_56063 ) ) ( OBJ-AT ?auto_56062 ?auto_56063 ) ( TRUCK-AT ?auto_56064 ?auto_56060 ) ( IN-TRUCK ?auto_56061 ?auto_56064 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56062 ?auto_56060 )
      ( DELIVER-2PKG-VERIFY ?auto_56061 ?auto_56062 ?auto_56060 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56067 - OBJ
      ?auto_56068 - OBJ
      ?auto_56066 - LOCATION
    )
    :vars
    (
      ?auto_56070 - LOCATION
      ?auto_56069 - CITY
      ?auto_56071 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56068 ?auto_56067 ) ) ( IN-CITY ?auto_56070 ?auto_56069 ) ( IN-CITY ?auto_56066 ?auto_56069 ) ( not ( = ?auto_56066 ?auto_56070 ) ) ( OBJ-AT ?auto_56067 ?auto_56070 ) ( TRUCK-AT ?auto_56071 ?auto_56066 ) ( IN-TRUCK ?auto_56068 ?auto_56071 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56068 ?auto_56067 ?auto_56066 )
      ( DELIVER-2PKG-VERIFY ?auto_56067 ?auto_56068 ?auto_56066 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56251 - OBJ
      ?auto_56250 - LOCATION
    )
    :vars
    (
      ?auto_56253 - OBJ
      ?auto_56254 - LOCATION
      ?auto_56252 - CITY
      ?auto_56255 - TRUCK
      ?auto_56256 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_56251 ?auto_56253 ) ) ( IN-CITY ?auto_56254 ?auto_56252 ) ( IN-CITY ?auto_56250 ?auto_56252 ) ( not ( = ?auto_56250 ?auto_56254 ) ) ( OBJ-AT ?auto_56251 ?auto_56254 ) ( IN-TRUCK ?auto_56253 ?auto_56255 ) ( TRUCK-AT ?auto_56255 ?auto_56256 ) ( IN-CITY ?auto_56256 ?auto_56252 ) ( not ( = ?auto_56250 ?auto_56256 ) ) ( not ( = ?auto_56254 ?auto_56256 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56255 ?auto_56256 ?auto_56250 ?auto_56252 )
      ( DELIVER-2PKG ?auto_56253 ?auto_56251 ?auto_56250 )
      ( DELIVER-1PKG-VERIFY ?auto_56251 ?auto_56250 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56258 - OBJ
      ?auto_56259 - OBJ
      ?auto_56257 - LOCATION
    )
    :vars
    (
      ?auto_56263 - LOCATION
      ?auto_56261 - CITY
      ?auto_56260 - TRUCK
      ?auto_56262 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_56259 ?auto_56258 ) ) ( IN-CITY ?auto_56263 ?auto_56261 ) ( IN-CITY ?auto_56257 ?auto_56261 ) ( not ( = ?auto_56257 ?auto_56263 ) ) ( OBJ-AT ?auto_56259 ?auto_56263 ) ( IN-TRUCK ?auto_56258 ?auto_56260 ) ( TRUCK-AT ?auto_56260 ?auto_56262 ) ( IN-CITY ?auto_56262 ?auto_56261 ) ( not ( = ?auto_56257 ?auto_56262 ) ) ( not ( = ?auto_56263 ?auto_56262 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56259 ?auto_56257 )
      ( DELIVER-2PKG-VERIFY ?auto_56258 ?auto_56259 ?auto_56257 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56265 - OBJ
      ?auto_56266 - OBJ
      ?auto_56264 - LOCATION
    )
    :vars
    (
      ?auto_56270 - LOCATION
      ?auto_56268 - CITY
      ?auto_56269 - TRUCK
      ?auto_56267 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_56266 ?auto_56265 ) ) ( IN-CITY ?auto_56270 ?auto_56268 ) ( IN-CITY ?auto_56264 ?auto_56268 ) ( not ( = ?auto_56264 ?auto_56270 ) ) ( OBJ-AT ?auto_56265 ?auto_56270 ) ( IN-TRUCK ?auto_56266 ?auto_56269 ) ( TRUCK-AT ?auto_56269 ?auto_56267 ) ( IN-CITY ?auto_56267 ?auto_56268 ) ( not ( = ?auto_56264 ?auto_56267 ) ) ( not ( = ?auto_56270 ?auto_56267 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56266 ?auto_56265 ?auto_56264 )
      ( DELIVER-2PKG-VERIFY ?auto_56265 ?auto_56266 ?auto_56264 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56473 - OBJ
      ?auto_56472 - LOCATION
    )
    :vars
    (
      ?auto_56477 - OBJ
      ?auto_56478 - LOCATION
      ?auto_56475 - CITY
      ?auto_56476 - TRUCK
      ?auto_56474 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_56473 ?auto_56477 ) ) ( IN-CITY ?auto_56478 ?auto_56475 ) ( IN-CITY ?auto_56472 ?auto_56475 ) ( not ( = ?auto_56472 ?auto_56478 ) ) ( OBJ-AT ?auto_56473 ?auto_56478 ) ( TRUCK-AT ?auto_56476 ?auto_56474 ) ( IN-CITY ?auto_56474 ?auto_56475 ) ( not ( = ?auto_56472 ?auto_56474 ) ) ( not ( = ?auto_56478 ?auto_56474 ) ) ( OBJ-AT ?auto_56477 ?auto_56474 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_56477 ?auto_56476 ?auto_56474 )
      ( DELIVER-2PKG ?auto_56477 ?auto_56473 ?auto_56472 )
      ( DELIVER-1PKG-VERIFY ?auto_56473 ?auto_56472 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56480 - OBJ
      ?auto_56481 - OBJ
      ?auto_56479 - LOCATION
    )
    :vars
    (
      ?auto_56484 - LOCATION
      ?auto_56483 - CITY
      ?auto_56482 - TRUCK
      ?auto_56485 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_56481 ?auto_56480 ) ) ( IN-CITY ?auto_56484 ?auto_56483 ) ( IN-CITY ?auto_56479 ?auto_56483 ) ( not ( = ?auto_56479 ?auto_56484 ) ) ( OBJ-AT ?auto_56481 ?auto_56484 ) ( TRUCK-AT ?auto_56482 ?auto_56485 ) ( IN-CITY ?auto_56485 ?auto_56483 ) ( not ( = ?auto_56479 ?auto_56485 ) ) ( not ( = ?auto_56484 ?auto_56485 ) ) ( OBJ-AT ?auto_56480 ?auto_56485 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56481 ?auto_56479 )
      ( DELIVER-2PKG-VERIFY ?auto_56480 ?auto_56481 ?auto_56479 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56487 - OBJ
      ?auto_56488 - OBJ
      ?auto_56486 - LOCATION
    )
    :vars
    (
      ?auto_56489 - LOCATION
      ?auto_56491 - CITY
      ?auto_56490 - TRUCK
      ?auto_56492 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_56488 ?auto_56487 ) ) ( IN-CITY ?auto_56489 ?auto_56491 ) ( IN-CITY ?auto_56486 ?auto_56491 ) ( not ( = ?auto_56486 ?auto_56489 ) ) ( OBJ-AT ?auto_56487 ?auto_56489 ) ( TRUCK-AT ?auto_56490 ?auto_56492 ) ( IN-CITY ?auto_56492 ?auto_56491 ) ( not ( = ?auto_56486 ?auto_56492 ) ) ( not ( = ?auto_56489 ?auto_56492 ) ) ( OBJ-AT ?auto_56488 ?auto_56492 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56488 ?auto_56487 ?auto_56486 )
      ( DELIVER-2PKG-VERIFY ?auto_56487 ?auto_56488 ?auto_56486 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57328 - OBJ
      ?auto_57329 - OBJ
      ?auto_57330 - OBJ
      ?auto_57327 - LOCATION
    )
    :vars
    (
      ?auto_57331 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57329 ?auto_57328 ) ) ( not ( = ?auto_57330 ?auto_57328 ) ) ( not ( = ?auto_57330 ?auto_57329 ) ) ( TRUCK-AT ?auto_57331 ?auto_57327 ) ( IN-TRUCK ?auto_57330 ?auto_57331 ) ( OBJ-AT ?auto_57328 ?auto_57327 ) ( OBJ-AT ?auto_57329 ?auto_57327 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_57330 ?auto_57327 )
      ( DELIVER-3PKG-VERIFY ?auto_57328 ?auto_57329 ?auto_57330 ?auto_57327 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57338 - OBJ
      ?auto_57339 - OBJ
      ?auto_57340 - OBJ
      ?auto_57337 - LOCATION
    )
    :vars
    (
      ?auto_57341 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57339 ?auto_57338 ) ) ( not ( = ?auto_57340 ?auto_57338 ) ) ( not ( = ?auto_57340 ?auto_57339 ) ) ( TRUCK-AT ?auto_57341 ?auto_57337 ) ( IN-TRUCK ?auto_57339 ?auto_57341 ) ( OBJ-AT ?auto_57338 ?auto_57337 ) ( OBJ-AT ?auto_57340 ?auto_57337 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_57339 ?auto_57337 )
      ( DELIVER-3PKG-VERIFY ?auto_57338 ?auto_57339 ?auto_57340 ?auto_57337 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57376 - OBJ
      ?auto_57377 - OBJ
      ?auto_57378 - OBJ
      ?auto_57375 - LOCATION
    )
    :vars
    (
      ?auto_57379 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57377 ?auto_57376 ) ) ( not ( = ?auto_57378 ?auto_57376 ) ) ( not ( = ?auto_57378 ?auto_57377 ) ) ( TRUCK-AT ?auto_57379 ?auto_57375 ) ( IN-TRUCK ?auto_57376 ?auto_57379 ) ( OBJ-AT ?auto_57377 ?auto_57375 ) ( OBJ-AT ?auto_57378 ?auto_57375 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_57376 ?auto_57375 )
      ( DELIVER-3PKG-VERIFY ?auto_57376 ?auto_57377 ?auto_57378 ?auto_57375 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57842 - OBJ
      ?auto_57843 - OBJ
      ?auto_57844 - OBJ
      ?auto_57841 - LOCATION
    )
    :vars
    (
      ?auto_57845 - TRUCK
      ?auto_57846 - LOCATION
      ?auto_57847 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_57843 ?auto_57842 ) ) ( not ( = ?auto_57844 ?auto_57842 ) ) ( not ( = ?auto_57844 ?auto_57843 ) ) ( IN-TRUCK ?auto_57844 ?auto_57845 ) ( TRUCK-AT ?auto_57845 ?auto_57846 ) ( IN-CITY ?auto_57846 ?auto_57847 ) ( IN-CITY ?auto_57841 ?auto_57847 ) ( not ( = ?auto_57841 ?auto_57846 ) ) ( OBJ-AT ?auto_57842 ?auto_57841 ) ( OBJ-AT ?auto_57843 ?auto_57841 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57842 ?auto_57844 ?auto_57841 )
      ( DELIVER-3PKG-VERIFY ?auto_57842 ?auto_57843 ?auto_57844 ?auto_57841 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57856 - OBJ
      ?auto_57857 - OBJ
      ?auto_57858 - OBJ
      ?auto_57855 - LOCATION
    )
    :vars
    (
      ?auto_57859 - TRUCK
      ?auto_57860 - LOCATION
      ?auto_57861 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_57857 ?auto_57856 ) ) ( not ( = ?auto_57858 ?auto_57856 ) ) ( not ( = ?auto_57858 ?auto_57857 ) ) ( IN-TRUCK ?auto_57857 ?auto_57859 ) ( TRUCK-AT ?auto_57859 ?auto_57860 ) ( IN-CITY ?auto_57860 ?auto_57861 ) ( IN-CITY ?auto_57855 ?auto_57861 ) ( not ( = ?auto_57855 ?auto_57860 ) ) ( OBJ-AT ?auto_57856 ?auto_57855 ) ( OBJ-AT ?auto_57858 ?auto_57855 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57856 ?auto_57857 ?auto_57855 )
      ( DELIVER-3PKG-VERIFY ?auto_57856 ?auto_57857 ?auto_57858 ?auto_57855 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57909 - OBJ
      ?auto_57910 - OBJ
      ?auto_57911 - OBJ
      ?auto_57908 - LOCATION
    )
    :vars
    (
      ?auto_57912 - TRUCK
      ?auto_57913 - LOCATION
      ?auto_57914 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_57910 ?auto_57909 ) ) ( not ( = ?auto_57911 ?auto_57909 ) ) ( not ( = ?auto_57911 ?auto_57910 ) ) ( IN-TRUCK ?auto_57909 ?auto_57912 ) ( TRUCK-AT ?auto_57912 ?auto_57913 ) ( IN-CITY ?auto_57913 ?auto_57914 ) ( IN-CITY ?auto_57908 ?auto_57914 ) ( not ( = ?auto_57908 ?auto_57913 ) ) ( OBJ-AT ?auto_57910 ?auto_57908 ) ( OBJ-AT ?auto_57911 ?auto_57908 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57910 ?auto_57909 ?auto_57908 )
      ( DELIVER-3PKG-VERIFY ?auto_57909 ?auto_57910 ?auto_57911 ?auto_57908 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58539 - OBJ
      ?auto_58540 - OBJ
      ?auto_58541 - OBJ
      ?auto_58538 - LOCATION
    )
    :vars
    (
      ?auto_58542 - TRUCK
      ?auto_58543 - LOCATION
      ?auto_58544 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_58540 ?auto_58539 ) ) ( not ( = ?auto_58541 ?auto_58539 ) ) ( not ( = ?auto_58541 ?auto_58540 ) ) ( TRUCK-AT ?auto_58542 ?auto_58543 ) ( IN-CITY ?auto_58543 ?auto_58544 ) ( IN-CITY ?auto_58538 ?auto_58544 ) ( not ( = ?auto_58538 ?auto_58543 ) ) ( OBJ-AT ?auto_58539 ?auto_58538 ) ( OBJ-AT ?auto_58541 ?auto_58543 ) ( OBJ-AT ?auto_58540 ?auto_58538 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58539 ?auto_58541 ?auto_58538 )
      ( DELIVER-3PKG-VERIFY ?auto_58539 ?auto_58540 ?auto_58541 ?auto_58538 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58553 - OBJ
      ?auto_58554 - OBJ
      ?auto_58555 - OBJ
      ?auto_58552 - LOCATION
    )
    :vars
    (
      ?auto_58556 - TRUCK
      ?auto_58557 - LOCATION
      ?auto_58558 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_58554 ?auto_58553 ) ) ( not ( = ?auto_58555 ?auto_58553 ) ) ( not ( = ?auto_58555 ?auto_58554 ) ) ( TRUCK-AT ?auto_58556 ?auto_58557 ) ( IN-CITY ?auto_58557 ?auto_58558 ) ( IN-CITY ?auto_58552 ?auto_58558 ) ( not ( = ?auto_58552 ?auto_58557 ) ) ( OBJ-AT ?auto_58553 ?auto_58552 ) ( OBJ-AT ?auto_58554 ?auto_58557 ) ( OBJ-AT ?auto_58555 ?auto_58552 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58553 ?auto_58554 ?auto_58552 )
      ( DELIVER-3PKG-VERIFY ?auto_58553 ?auto_58554 ?auto_58555 ?auto_58552 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58606 - OBJ
      ?auto_58607 - OBJ
      ?auto_58608 - OBJ
      ?auto_58605 - LOCATION
    )
    :vars
    (
      ?auto_58609 - TRUCK
      ?auto_58610 - LOCATION
      ?auto_58611 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_58607 ?auto_58606 ) ) ( not ( = ?auto_58608 ?auto_58606 ) ) ( not ( = ?auto_58608 ?auto_58607 ) ) ( TRUCK-AT ?auto_58609 ?auto_58610 ) ( IN-CITY ?auto_58610 ?auto_58611 ) ( IN-CITY ?auto_58605 ?auto_58611 ) ( not ( = ?auto_58605 ?auto_58610 ) ) ( OBJ-AT ?auto_58607 ?auto_58605 ) ( OBJ-AT ?auto_58606 ?auto_58610 ) ( OBJ-AT ?auto_58608 ?auto_58605 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58607 ?auto_58606 ?auto_58605 )
      ( DELIVER-3PKG-VERIFY ?auto_58606 ?auto_58607 ?auto_58608 ?auto_58605 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59236 - OBJ
      ?auto_59237 - OBJ
      ?auto_59238 - OBJ
      ?auto_59235 - LOCATION
    )
    :vars
    (
      ?auto_59240 - LOCATION
      ?auto_59239 - CITY
      ?auto_59241 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59237 ?auto_59236 ) ) ( not ( = ?auto_59238 ?auto_59236 ) ) ( not ( = ?auto_59238 ?auto_59237 ) ) ( IN-CITY ?auto_59240 ?auto_59239 ) ( IN-CITY ?auto_59235 ?auto_59239 ) ( not ( = ?auto_59235 ?auto_59240 ) ) ( OBJ-AT ?auto_59236 ?auto_59235 ) ( OBJ-AT ?auto_59238 ?auto_59240 ) ( TRUCK-AT ?auto_59241 ?auto_59235 ) ( OBJ-AT ?auto_59237 ?auto_59235 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59236 ?auto_59238 ?auto_59235 )
      ( DELIVER-3PKG-VERIFY ?auto_59236 ?auto_59237 ?auto_59238 ?auto_59235 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59250 - OBJ
      ?auto_59251 - OBJ
      ?auto_59252 - OBJ
      ?auto_59249 - LOCATION
    )
    :vars
    (
      ?auto_59254 - LOCATION
      ?auto_59253 - CITY
      ?auto_59255 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59251 ?auto_59250 ) ) ( not ( = ?auto_59252 ?auto_59250 ) ) ( not ( = ?auto_59252 ?auto_59251 ) ) ( IN-CITY ?auto_59254 ?auto_59253 ) ( IN-CITY ?auto_59249 ?auto_59253 ) ( not ( = ?auto_59249 ?auto_59254 ) ) ( OBJ-AT ?auto_59250 ?auto_59249 ) ( OBJ-AT ?auto_59251 ?auto_59254 ) ( TRUCK-AT ?auto_59255 ?auto_59249 ) ( OBJ-AT ?auto_59252 ?auto_59249 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59250 ?auto_59251 ?auto_59249 )
      ( DELIVER-3PKG-VERIFY ?auto_59250 ?auto_59251 ?auto_59252 ?auto_59249 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59303 - OBJ
      ?auto_59304 - OBJ
      ?auto_59305 - OBJ
      ?auto_59302 - LOCATION
    )
    :vars
    (
      ?auto_59307 - LOCATION
      ?auto_59306 - CITY
      ?auto_59308 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59304 ?auto_59303 ) ) ( not ( = ?auto_59305 ?auto_59303 ) ) ( not ( = ?auto_59305 ?auto_59304 ) ) ( IN-CITY ?auto_59307 ?auto_59306 ) ( IN-CITY ?auto_59302 ?auto_59306 ) ( not ( = ?auto_59302 ?auto_59307 ) ) ( OBJ-AT ?auto_59304 ?auto_59302 ) ( OBJ-AT ?auto_59303 ?auto_59307 ) ( TRUCK-AT ?auto_59308 ?auto_59302 ) ( OBJ-AT ?auto_59305 ?auto_59302 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59304 ?auto_59303 ?auto_59302 )
      ( DELIVER-3PKG-VERIFY ?auto_59303 ?auto_59304 ?auto_59305 ?auto_59302 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_60599 - OBJ
      ?auto_60598 - LOCATION
    )
    :vars
    (
      ?auto_60601 - OBJ
      ?auto_60600 - LOCATION
      ?auto_60603 - CITY
      ?auto_60602 - TRUCK
      ?auto_60604 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_60599 ?auto_60601 ) ) ( IN-CITY ?auto_60600 ?auto_60603 ) ( IN-CITY ?auto_60598 ?auto_60603 ) ( not ( = ?auto_60598 ?auto_60600 ) ) ( OBJ-AT ?auto_60601 ?auto_60598 ) ( OBJ-AT ?auto_60599 ?auto_60600 ) ( TRUCK-AT ?auto_60602 ?auto_60604 ) ( IN-CITY ?auto_60604 ?auto_60603 ) ( not ( = ?auto_60598 ?auto_60604 ) ) ( not ( = ?auto_60600 ?auto_60604 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_60602 ?auto_60604 ?auto_60598 ?auto_60603 )
      ( DELIVER-2PKG ?auto_60601 ?auto_60599 ?auto_60598 )
      ( DELIVER-1PKG-VERIFY ?auto_60599 ?auto_60598 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_60606 - OBJ
      ?auto_60607 - OBJ
      ?auto_60605 - LOCATION
    )
    :vars
    (
      ?auto_60610 - LOCATION
      ?auto_60609 - CITY
      ?auto_60608 - TRUCK
      ?auto_60611 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_60607 ?auto_60606 ) ) ( IN-CITY ?auto_60610 ?auto_60609 ) ( IN-CITY ?auto_60605 ?auto_60609 ) ( not ( = ?auto_60605 ?auto_60610 ) ) ( OBJ-AT ?auto_60606 ?auto_60605 ) ( OBJ-AT ?auto_60607 ?auto_60610 ) ( TRUCK-AT ?auto_60608 ?auto_60611 ) ( IN-CITY ?auto_60611 ?auto_60609 ) ( not ( = ?auto_60605 ?auto_60611 ) ) ( not ( = ?auto_60610 ?auto_60611 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_60607 ?auto_60605 )
      ( DELIVER-2PKG-VERIFY ?auto_60606 ?auto_60607 ?auto_60605 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_60621 - OBJ
      ?auto_60622 - OBJ
      ?auto_60620 - LOCATION
    )
    :vars
    (
      ?auto_60625 - LOCATION
      ?auto_60626 - CITY
      ?auto_60623 - TRUCK
      ?auto_60624 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_60622 ?auto_60621 ) ) ( IN-CITY ?auto_60625 ?auto_60626 ) ( IN-CITY ?auto_60620 ?auto_60626 ) ( not ( = ?auto_60620 ?auto_60625 ) ) ( OBJ-AT ?auto_60622 ?auto_60620 ) ( OBJ-AT ?auto_60621 ?auto_60625 ) ( TRUCK-AT ?auto_60623 ?auto_60624 ) ( IN-CITY ?auto_60624 ?auto_60626 ) ( not ( = ?auto_60620 ?auto_60624 ) ) ( not ( = ?auto_60625 ?auto_60624 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60622 ?auto_60621 ?auto_60620 )
      ( DELIVER-2PKG-VERIFY ?auto_60621 ?auto_60622 ?auto_60620 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_67166 - OBJ
      ?auto_67167 - OBJ
      ?auto_67168 - OBJ
      ?auto_67169 - OBJ
      ?auto_67165 - LOCATION
    )
    :vars
    (
      ?auto_67170 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_67167 ?auto_67166 ) ) ( not ( = ?auto_67168 ?auto_67166 ) ) ( not ( = ?auto_67168 ?auto_67167 ) ) ( not ( = ?auto_67169 ?auto_67166 ) ) ( not ( = ?auto_67169 ?auto_67167 ) ) ( not ( = ?auto_67169 ?auto_67168 ) ) ( TRUCK-AT ?auto_67170 ?auto_67165 ) ( IN-TRUCK ?auto_67169 ?auto_67170 ) ( OBJ-AT ?auto_67166 ?auto_67165 ) ( OBJ-AT ?auto_67167 ?auto_67165 ) ( OBJ-AT ?auto_67168 ?auto_67165 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_67169 ?auto_67165 )
      ( DELIVER-4PKG-VERIFY ?auto_67166 ?auto_67167 ?auto_67168 ?auto_67169 ?auto_67165 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_67184 - OBJ
      ?auto_67185 - OBJ
      ?auto_67186 - OBJ
      ?auto_67187 - OBJ
      ?auto_67183 - LOCATION
    )
    :vars
    (
      ?auto_67188 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_67185 ?auto_67184 ) ) ( not ( = ?auto_67186 ?auto_67184 ) ) ( not ( = ?auto_67186 ?auto_67185 ) ) ( not ( = ?auto_67187 ?auto_67184 ) ) ( not ( = ?auto_67187 ?auto_67185 ) ) ( not ( = ?auto_67187 ?auto_67186 ) ) ( TRUCK-AT ?auto_67188 ?auto_67183 ) ( IN-TRUCK ?auto_67186 ?auto_67188 ) ( OBJ-AT ?auto_67184 ?auto_67183 ) ( OBJ-AT ?auto_67185 ?auto_67183 ) ( OBJ-AT ?auto_67187 ?auto_67183 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_67186 ?auto_67183 )
      ( DELIVER-4PKG-VERIFY ?auto_67184 ?auto_67185 ?auto_67186 ?auto_67187 ?auto_67183 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_67272 - OBJ
      ?auto_67273 - OBJ
      ?auto_67274 - OBJ
      ?auto_67275 - OBJ
      ?auto_67271 - LOCATION
    )
    :vars
    (
      ?auto_67276 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_67273 ?auto_67272 ) ) ( not ( = ?auto_67274 ?auto_67272 ) ) ( not ( = ?auto_67274 ?auto_67273 ) ) ( not ( = ?auto_67275 ?auto_67272 ) ) ( not ( = ?auto_67275 ?auto_67273 ) ) ( not ( = ?auto_67275 ?auto_67274 ) ) ( TRUCK-AT ?auto_67276 ?auto_67271 ) ( IN-TRUCK ?auto_67273 ?auto_67276 ) ( OBJ-AT ?auto_67272 ?auto_67271 ) ( OBJ-AT ?auto_67274 ?auto_67271 ) ( OBJ-AT ?auto_67275 ?auto_67271 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_67273 ?auto_67271 )
      ( DELIVER-4PKG-VERIFY ?auto_67272 ?auto_67273 ?auto_67274 ?auto_67275 ?auto_67271 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_67799 - OBJ
      ?auto_67800 - OBJ
      ?auto_67801 - OBJ
      ?auto_67802 - OBJ
      ?auto_67798 - LOCATION
    )
    :vars
    (
      ?auto_67803 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_67800 ?auto_67799 ) ) ( not ( = ?auto_67801 ?auto_67799 ) ) ( not ( = ?auto_67801 ?auto_67800 ) ) ( not ( = ?auto_67802 ?auto_67799 ) ) ( not ( = ?auto_67802 ?auto_67800 ) ) ( not ( = ?auto_67802 ?auto_67801 ) ) ( TRUCK-AT ?auto_67803 ?auto_67798 ) ( IN-TRUCK ?auto_67799 ?auto_67803 ) ( OBJ-AT ?auto_67800 ?auto_67798 ) ( OBJ-AT ?auto_67801 ?auto_67798 ) ( OBJ-AT ?auto_67802 ?auto_67798 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_67799 ?auto_67798 )
      ( DELIVER-4PKG-VERIFY ?auto_67799 ?auto_67800 ?auto_67801 ?auto_67802 ?auto_67798 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_68477 - OBJ
      ?auto_68478 - OBJ
      ?auto_68479 - OBJ
      ?auto_68480 - OBJ
      ?auto_68476 - LOCATION
    )
    :vars
    (
      ?auto_68481 - TRUCK
      ?auto_68483 - LOCATION
      ?auto_68482 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_68478 ?auto_68477 ) ) ( not ( = ?auto_68479 ?auto_68477 ) ) ( not ( = ?auto_68479 ?auto_68478 ) ) ( not ( = ?auto_68480 ?auto_68477 ) ) ( not ( = ?auto_68480 ?auto_68478 ) ) ( not ( = ?auto_68480 ?auto_68479 ) ) ( IN-TRUCK ?auto_68480 ?auto_68481 ) ( TRUCK-AT ?auto_68481 ?auto_68483 ) ( IN-CITY ?auto_68483 ?auto_68482 ) ( IN-CITY ?auto_68476 ?auto_68482 ) ( not ( = ?auto_68476 ?auto_68483 ) ) ( OBJ-AT ?auto_68477 ?auto_68476 ) ( OBJ-AT ?auto_68478 ?auto_68476 ) ( OBJ-AT ?auto_68479 ?auto_68476 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_68477 ?auto_68480 ?auto_68476 )
      ( DELIVER-4PKG-VERIFY ?auto_68477 ?auto_68478 ?auto_68479 ?auto_68480 ?auto_68476 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_68501 - OBJ
      ?auto_68502 - OBJ
      ?auto_68503 - OBJ
      ?auto_68504 - OBJ
      ?auto_68500 - LOCATION
    )
    :vars
    (
      ?auto_68505 - TRUCK
      ?auto_68507 - LOCATION
      ?auto_68506 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_68502 ?auto_68501 ) ) ( not ( = ?auto_68503 ?auto_68501 ) ) ( not ( = ?auto_68503 ?auto_68502 ) ) ( not ( = ?auto_68504 ?auto_68501 ) ) ( not ( = ?auto_68504 ?auto_68502 ) ) ( not ( = ?auto_68504 ?auto_68503 ) ) ( IN-TRUCK ?auto_68503 ?auto_68505 ) ( TRUCK-AT ?auto_68505 ?auto_68507 ) ( IN-CITY ?auto_68507 ?auto_68506 ) ( IN-CITY ?auto_68500 ?auto_68506 ) ( not ( = ?auto_68500 ?auto_68507 ) ) ( OBJ-AT ?auto_68501 ?auto_68500 ) ( OBJ-AT ?auto_68502 ?auto_68500 ) ( OBJ-AT ?auto_68504 ?auto_68500 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_68501 ?auto_68503 ?auto_68500 )
      ( DELIVER-4PKG-VERIFY ?auto_68501 ?auto_68502 ?auto_68503 ?auto_68504 ?auto_68500 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_68615 - OBJ
      ?auto_68616 - OBJ
      ?auto_68617 - OBJ
      ?auto_68618 - OBJ
      ?auto_68614 - LOCATION
    )
    :vars
    (
      ?auto_68619 - TRUCK
      ?auto_68621 - LOCATION
      ?auto_68620 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_68616 ?auto_68615 ) ) ( not ( = ?auto_68617 ?auto_68615 ) ) ( not ( = ?auto_68617 ?auto_68616 ) ) ( not ( = ?auto_68618 ?auto_68615 ) ) ( not ( = ?auto_68618 ?auto_68616 ) ) ( not ( = ?auto_68618 ?auto_68617 ) ) ( IN-TRUCK ?auto_68616 ?auto_68619 ) ( TRUCK-AT ?auto_68619 ?auto_68621 ) ( IN-CITY ?auto_68621 ?auto_68620 ) ( IN-CITY ?auto_68614 ?auto_68620 ) ( not ( = ?auto_68614 ?auto_68621 ) ) ( OBJ-AT ?auto_68615 ?auto_68614 ) ( OBJ-AT ?auto_68617 ?auto_68614 ) ( OBJ-AT ?auto_68618 ?auto_68614 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_68615 ?auto_68616 ?auto_68614 )
      ( DELIVER-4PKG-VERIFY ?auto_68615 ?auto_68616 ?auto_68617 ?auto_68618 ?auto_68614 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_69334 - OBJ
      ?auto_69335 - OBJ
      ?auto_69336 - OBJ
      ?auto_69337 - OBJ
      ?auto_69333 - LOCATION
    )
    :vars
    (
      ?auto_69338 - TRUCK
      ?auto_69340 - LOCATION
      ?auto_69339 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_69335 ?auto_69334 ) ) ( not ( = ?auto_69336 ?auto_69334 ) ) ( not ( = ?auto_69336 ?auto_69335 ) ) ( not ( = ?auto_69337 ?auto_69334 ) ) ( not ( = ?auto_69337 ?auto_69335 ) ) ( not ( = ?auto_69337 ?auto_69336 ) ) ( IN-TRUCK ?auto_69334 ?auto_69338 ) ( TRUCK-AT ?auto_69338 ?auto_69340 ) ( IN-CITY ?auto_69340 ?auto_69339 ) ( IN-CITY ?auto_69333 ?auto_69339 ) ( not ( = ?auto_69333 ?auto_69340 ) ) ( OBJ-AT ?auto_69335 ?auto_69333 ) ( OBJ-AT ?auto_69336 ?auto_69333 ) ( OBJ-AT ?auto_69337 ?auto_69333 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69335 ?auto_69334 ?auto_69333 )
      ( DELIVER-4PKG-VERIFY ?auto_69334 ?auto_69335 ?auto_69336 ?auto_69337 ?auto_69333 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_70146 - OBJ
      ?auto_70147 - OBJ
      ?auto_70148 - OBJ
      ?auto_70149 - OBJ
      ?auto_70145 - LOCATION
    )
    :vars
    (
      ?auto_70152 - TRUCK
      ?auto_70150 - LOCATION
      ?auto_70151 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_70147 ?auto_70146 ) ) ( not ( = ?auto_70148 ?auto_70146 ) ) ( not ( = ?auto_70148 ?auto_70147 ) ) ( not ( = ?auto_70149 ?auto_70146 ) ) ( not ( = ?auto_70149 ?auto_70147 ) ) ( not ( = ?auto_70149 ?auto_70148 ) ) ( TRUCK-AT ?auto_70152 ?auto_70150 ) ( IN-CITY ?auto_70150 ?auto_70151 ) ( IN-CITY ?auto_70145 ?auto_70151 ) ( not ( = ?auto_70145 ?auto_70150 ) ) ( OBJ-AT ?auto_70146 ?auto_70145 ) ( OBJ-AT ?auto_70149 ?auto_70150 ) ( OBJ-AT ?auto_70147 ?auto_70145 ) ( OBJ-AT ?auto_70148 ?auto_70145 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70146 ?auto_70149 ?auto_70145 )
      ( DELIVER-4PKG-VERIFY ?auto_70146 ?auto_70147 ?auto_70148 ?auto_70149 ?auto_70145 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_70170 - OBJ
      ?auto_70171 - OBJ
      ?auto_70172 - OBJ
      ?auto_70173 - OBJ
      ?auto_70169 - LOCATION
    )
    :vars
    (
      ?auto_70176 - TRUCK
      ?auto_70174 - LOCATION
      ?auto_70175 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_70171 ?auto_70170 ) ) ( not ( = ?auto_70172 ?auto_70170 ) ) ( not ( = ?auto_70172 ?auto_70171 ) ) ( not ( = ?auto_70173 ?auto_70170 ) ) ( not ( = ?auto_70173 ?auto_70171 ) ) ( not ( = ?auto_70173 ?auto_70172 ) ) ( TRUCK-AT ?auto_70176 ?auto_70174 ) ( IN-CITY ?auto_70174 ?auto_70175 ) ( IN-CITY ?auto_70169 ?auto_70175 ) ( not ( = ?auto_70169 ?auto_70174 ) ) ( OBJ-AT ?auto_70170 ?auto_70169 ) ( OBJ-AT ?auto_70172 ?auto_70174 ) ( OBJ-AT ?auto_70171 ?auto_70169 ) ( OBJ-AT ?auto_70173 ?auto_70169 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70170 ?auto_70172 ?auto_70169 )
      ( DELIVER-4PKG-VERIFY ?auto_70170 ?auto_70171 ?auto_70172 ?auto_70173 ?auto_70169 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_70284 - OBJ
      ?auto_70285 - OBJ
      ?auto_70286 - OBJ
      ?auto_70287 - OBJ
      ?auto_70283 - LOCATION
    )
    :vars
    (
      ?auto_70290 - TRUCK
      ?auto_70288 - LOCATION
      ?auto_70289 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_70285 ?auto_70284 ) ) ( not ( = ?auto_70286 ?auto_70284 ) ) ( not ( = ?auto_70286 ?auto_70285 ) ) ( not ( = ?auto_70287 ?auto_70284 ) ) ( not ( = ?auto_70287 ?auto_70285 ) ) ( not ( = ?auto_70287 ?auto_70286 ) ) ( TRUCK-AT ?auto_70290 ?auto_70288 ) ( IN-CITY ?auto_70288 ?auto_70289 ) ( IN-CITY ?auto_70283 ?auto_70289 ) ( not ( = ?auto_70283 ?auto_70288 ) ) ( OBJ-AT ?auto_70284 ?auto_70283 ) ( OBJ-AT ?auto_70285 ?auto_70288 ) ( OBJ-AT ?auto_70286 ?auto_70283 ) ( OBJ-AT ?auto_70287 ?auto_70283 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70284 ?auto_70285 ?auto_70283 )
      ( DELIVER-4PKG-VERIFY ?auto_70284 ?auto_70285 ?auto_70286 ?auto_70287 ?auto_70283 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_71003 - OBJ
      ?auto_71004 - OBJ
      ?auto_71005 - OBJ
      ?auto_71006 - OBJ
      ?auto_71002 - LOCATION
    )
    :vars
    (
      ?auto_71009 - TRUCK
      ?auto_71007 - LOCATION
      ?auto_71008 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_71004 ?auto_71003 ) ) ( not ( = ?auto_71005 ?auto_71003 ) ) ( not ( = ?auto_71005 ?auto_71004 ) ) ( not ( = ?auto_71006 ?auto_71003 ) ) ( not ( = ?auto_71006 ?auto_71004 ) ) ( not ( = ?auto_71006 ?auto_71005 ) ) ( TRUCK-AT ?auto_71009 ?auto_71007 ) ( IN-CITY ?auto_71007 ?auto_71008 ) ( IN-CITY ?auto_71002 ?auto_71008 ) ( not ( = ?auto_71002 ?auto_71007 ) ) ( OBJ-AT ?auto_71004 ?auto_71002 ) ( OBJ-AT ?auto_71003 ?auto_71007 ) ( OBJ-AT ?auto_71005 ?auto_71002 ) ( OBJ-AT ?auto_71006 ?auto_71002 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_71004 ?auto_71003 ?auto_71002 )
      ( DELIVER-4PKG-VERIFY ?auto_71003 ?auto_71004 ?auto_71005 ?auto_71006 ?auto_71002 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_71815 - OBJ
      ?auto_71816 - OBJ
      ?auto_71817 - OBJ
      ?auto_71818 - OBJ
      ?auto_71814 - LOCATION
    )
    :vars
    (
      ?auto_71821 - LOCATION
      ?auto_71820 - CITY
      ?auto_71819 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_71816 ?auto_71815 ) ) ( not ( = ?auto_71817 ?auto_71815 ) ) ( not ( = ?auto_71817 ?auto_71816 ) ) ( not ( = ?auto_71818 ?auto_71815 ) ) ( not ( = ?auto_71818 ?auto_71816 ) ) ( not ( = ?auto_71818 ?auto_71817 ) ) ( IN-CITY ?auto_71821 ?auto_71820 ) ( IN-CITY ?auto_71814 ?auto_71820 ) ( not ( = ?auto_71814 ?auto_71821 ) ) ( OBJ-AT ?auto_71815 ?auto_71814 ) ( OBJ-AT ?auto_71818 ?auto_71821 ) ( TRUCK-AT ?auto_71819 ?auto_71814 ) ( OBJ-AT ?auto_71816 ?auto_71814 ) ( OBJ-AT ?auto_71817 ?auto_71814 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_71815 ?auto_71818 ?auto_71814 )
      ( DELIVER-4PKG-VERIFY ?auto_71815 ?auto_71816 ?auto_71817 ?auto_71818 ?auto_71814 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_71839 - OBJ
      ?auto_71840 - OBJ
      ?auto_71841 - OBJ
      ?auto_71842 - OBJ
      ?auto_71838 - LOCATION
    )
    :vars
    (
      ?auto_71845 - LOCATION
      ?auto_71844 - CITY
      ?auto_71843 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_71840 ?auto_71839 ) ) ( not ( = ?auto_71841 ?auto_71839 ) ) ( not ( = ?auto_71841 ?auto_71840 ) ) ( not ( = ?auto_71842 ?auto_71839 ) ) ( not ( = ?auto_71842 ?auto_71840 ) ) ( not ( = ?auto_71842 ?auto_71841 ) ) ( IN-CITY ?auto_71845 ?auto_71844 ) ( IN-CITY ?auto_71838 ?auto_71844 ) ( not ( = ?auto_71838 ?auto_71845 ) ) ( OBJ-AT ?auto_71839 ?auto_71838 ) ( OBJ-AT ?auto_71841 ?auto_71845 ) ( TRUCK-AT ?auto_71843 ?auto_71838 ) ( OBJ-AT ?auto_71840 ?auto_71838 ) ( OBJ-AT ?auto_71842 ?auto_71838 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_71839 ?auto_71841 ?auto_71838 )
      ( DELIVER-4PKG-VERIFY ?auto_71839 ?auto_71840 ?auto_71841 ?auto_71842 ?auto_71838 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_71953 - OBJ
      ?auto_71954 - OBJ
      ?auto_71955 - OBJ
      ?auto_71956 - OBJ
      ?auto_71952 - LOCATION
    )
    :vars
    (
      ?auto_71959 - LOCATION
      ?auto_71958 - CITY
      ?auto_71957 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_71954 ?auto_71953 ) ) ( not ( = ?auto_71955 ?auto_71953 ) ) ( not ( = ?auto_71955 ?auto_71954 ) ) ( not ( = ?auto_71956 ?auto_71953 ) ) ( not ( = ?auto_71956 ?auto_71954 ) ) ( not ( = ?auto_71956 ?auto_71955 ) ) ( IN-CITY ?auto_71959 ?auto_71958 ) ( IN-CITY ?auto_71952 ?auto_71958 ) ( not ( = ?auto_71952 ?auto_71959 ) ) ( OBJ-AT ?auto_71953 ?auto_71952 ) ( OBJ-AT ?auto_71954 ?auto_71959 ) ( TRUCK-AT ?auto_71957 ?auto_71952 ) ( OBJ-AT ?auto_71955 ?auto_71952 ) ( OBJ-AT ?auto_71956 ?auto_71952 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_71953 ?auto_71954 ?auto_71952 )
      ( DELIVER-4PKG-VERIFY ?auto_71953 ?auto_71954 ?auto_71955 ?auto_71956 ?auto_71952 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_72672 - OBJ
      ?auto_72673 - OBJ
      ?auto_72674 - OBJ
      ?auto_72675 - OBJ
      ?auto_72671 - LOCATION
    )
    :vars
    (
      ?auto_72678 - LOCATION
      ?auto_72677 - CITY
      ?auto_72676 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_72673 ?auto_72672 ) ) ( not ( = ?auto_72674 ?auto_72672 ) ) ( not ( = ?auto_72674 ?auto_72673 ) ) ( not ( = ?auto_72675 ?auto_72672 ) ) ( not ( = ?auto_72675 ?auto_72673 ) ) ( not ( = ?auto_72675 ?auto_72674 ) ) ( IN-CITY ?auto_72678 ?auto_72677 ) ( IN-CITY ?auto_72671 ?auto_72677 ) ( not ( = ?auto_72671 ?auto_72678 ) ) ( OBJ-AT ?auto_72673 ?auto_72671 ) ( OBJ-AT ?auto_72672 ?auto_72678 ) ( TRUCK-AT ?auto_72676 ?auto_72671 ) ( OBJ-AT ?auto_72674 ?auto_72671 ) ( OBJ-AT ?auto_72675 ?auto_72671 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_72673 ?auto_72672 ?auto_72671 )
      ( DELIVER-4PKG-VERIFY ?auto_72672 ?auto_72673 ?auto_72674 ?auto_72675 ?auto_72671 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_74967 - OBJ
      ?auto_74968 - OBJ
      ?auto_74969 - OBJ
      ?auto_74966 - LOCATION
    )
    :vars
    (
      ?auto_74971 - LOCATION
      ?auto_74972 - CITY
      ?auto_74973 - TRUCK
      ?auto_74970 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_74968 ?auto_74967 ) ) ( not ( = ?auto_74969 ?auto_74967 ) ) ( not ( = ?auto_74969 ?auto_74968 ) ) ( IN-CITY ?auto_74971 ?auto_74972 ) ( IN-CITY ?auto_74966 ?auto_74972 ) ( not ( = ?auto_74966 ?auto_74971 ) ) ( OBJ-AT ?auto_74967 ?auto_74966 ) ( OBJ-AT ?auto_74969 ?auto_74971 ) ( TRUCK-AT ?auto_74973 ?auto_74970 ) ( IN-CITY ?auto_74970 ?auto_74972 ) ( not ( = ?auto_74966 ?auto_74970 ) ) ( not ( = ?auto_74971 ?auto_74970 ) ) ( OBJ-AT ?auto_74968 ?auto_74966 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74967 ?auto_74969 ?auto_74966 )
      ( DELIVER-3PKG-VERIFY ?auto_74967 ?auto_74968 ?auto_74969 ?auto_74966 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_74991 - OBJ
      ?auto_74992 - OBJ
      ?auto_74993 - OBJ
      ?auto_74990 - LOCATION
    )
    :vars
    (
      ?auto_74995 - LOCATION
      ?auto_74996 - CITY
      ?auto_74997 - TRUCK
      ?auto_74994 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_74992 ?auto_74991 ) ) ( not ( = ?auto_74993 ?auto_74991 ) ) ( not ( = ?auto_74993 ?auto_74992 ) ) ( IN-CITY ?auto_74995 ?auto_74996 ) ( IN-CITY ?auto_74990 ?auto_74996 ) ( not ( = ?auto_74990 ?auto_74995 ) ) ( OBJ-AT ?auto_74991 ?auto_74990 ) ( OBJ-AT ?auto_74992 ?auto_74995 ) ( TRUCK-AT ?auto_74997 ?auto_74994 ) ( IN-CITY ?auto_74994 ?auto_74996 ) ( not ( = ?auto_74990 ?auto_74994 ) ) ( not ( = ?auto_74995 ?auto_74994 ) ) ( OBJ-AT ?auto_74993 ?auto_74990 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74991 ?auto_74992 ?auto_74990 )
      ( DELIVER-3PKG-VERIFY ?auto_74991 ?auto_74992 ?auto_74993 ?auto_74990 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75137 - OBJ
      ?auto_75138 - OBJ
      ?auto_75139 - OBJ
      ?auto_75136 - LOCATION
    )
    :vars
    (
      ?auto_75141 - LOCATION
      ?auto_75142 - CITY
      ?auto_75143 - TRUCK
      ?auto_75140 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_75138 ?auto_75137 ) ) ( not ( = ?auto_75139 ?auto_75137 ) ) ( not ( = ?auto_75139 ?auto_75138 ) ) ( IN-CITY ?auto_75141 ?auto_75142 ) ( IN-CITY ?auto_75136 ?auto_75142 ) ( not ( = ?auto_75136 ?auto_75141 ) ) ( OBJ-AT ?auto_75138 ?auto_75136 ) ( OBJ-AT ?auto_75137 ?auto_75141 ) ( TRUCK-AT ?auto_75143 ?auto_75140 ) ( IN-CITY ?auto_75140 ?auto_75142 ) ( not ( = ?auto_75136 ?auto_75140 ) ) ( not ( = ?auto_75141 ?auto_75140 ) ) ( OBJ-AT ?auto_75139 ?auto_75136 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75138 ?auto_75137 ?auto_75136 )
      ( DELIVER-3PKG-VERIFY ?auto_75137 ?auto_75138 ?auto_75139 ?auto_75136 ) )
  )

)

