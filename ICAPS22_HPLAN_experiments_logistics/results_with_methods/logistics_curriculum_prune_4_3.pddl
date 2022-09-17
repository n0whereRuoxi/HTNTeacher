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
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
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
      ?auto_10593 - OBJ
      ?auto_10592 - LOCATION
    )
    :vars
    (
      ?auto_10595 - LOCATION
      ?auto_10596 - CITY
      ?auto_10594 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10595 ?auto_10596 ) ( IN-CITY ?auto_10592 ?auto_10596 ) ( not ( = ?auto_10592 ?auto_10595 ) ) ( OBJ-AT ?auto_10593 ?auto_10595 ) ( TRUCK-AT ?auto_10594 ?auto_10592 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10594 ?auto_10592 ?auto_10595 ?auto_10596 )
      ( !LOAD-TRUCK ?auto_10593 ?auto_10594 ?auto_10595 )
      ( !DRIVE-TRUCK ?auto_10594 ?auto_10595 ?auto_10592 ?auto_10596 )
      ( !UNLOAD-TRUCK ?auto_10593 ?auto_10594 ?auto_10592 )
      ( DELIVER-1PKG-VERIFY ?auto_10593 ?auto_10592 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10614 - OBJ
      ?auto_10615 - OBJ
      ?auto_10613 - LOCATION
    )
    :vars
    (
      ?auto_10617 - LOCATION
      ?auto_10616 - CITY
      ?auto_10619 - LOCATION
      ?auto_10618 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10617 ?auto_10616 ) ( IN-CITY ?auto_10613 ?auto_10616 ) ( not ( = ?auto_10613 ?auto_10617 ) ) ( OBJ-AT ?auto_10615 ?auto_10617 ) ( IN-CITY ?auto_10619 ?auto_10616 ) ( not ( = ?auto_10613 ?auto_10619 ) ) ( OBJ-AT ?auto_10614 ?auto_10619 ) ( TRUCK-AT ?auto_10618 ?auto_10613 ) ( not ( = ?auto_10614 ?auto_10615 ) ) ( not ( = ?auto_10617 ?auto_10619 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10614 ?auto_10613 )
      ( DELIVER-1PKG ?auto_10615 ?auto_10613 )
      ( DELIVER-2PKG-VERIFY ?auto_10614 ?auto_10615 ?auto_10613 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10725 - OBJ
      ?auto_10726 - OBJ
      ?auto_10727 - OBJ
      ?auto_10724 - LOCATION
    )
    :vars
    (
      ?auto_10728 - LOCATION
      ?auto_10730 - CITY
      ?auto_10732 - LOCATION
      ?auto_10731 - LOCATION
      ?auto_10729 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10728 ?auto_10730 ) ( IN-CITY ?auto_10724 ?auto_10730 ) ( not ( = ?auto_10724 ?auto_10728 ) ) ( OBJ-AT ?auto_10727 ?auto_10728 ) ( IN-CITY ?auto_10732 ?auto_10730 ) ( not ( = ?auto_10724 ?auto_10732 ) ) ( OBJ-AT ?auto_10726 ?auto_10732 ) ( IN-CITY ?auto_10731 ?auto_10730 ) ( not ( = ?auto_10724 ?auto_10731 ) ) ( OBJ-AT ?auto_10725 ?auto_10731 ) ( TRUCK-AT ?auto_10729 ?auto_10724 ) ( not ( = ?auto_10725 ?auto_10726 ) ) ( not ( = ?auto_10732 ?auto_10731 ) ) ( not ( = ?auto_10725 ?auto_10727 ) ) ( not ( = ?auto_10726 ?auto_10727 ) ) ( not ( = ?auto_10728 ?auto_10732 ) ) ( not ( = ?auto_10728 ?auto_10731 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10725 ?auto_10726 ?auto_10724 )
      ( DELIVER-1PKG ?auto_10727 ?auto_10724 )
      ( DELIVER-3PKG-VERIFY ?auto_10725 ?auto_10726 ?auto_10727 ?auto_10724 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_11859 - OBJ
      ?auto_11860 - OBJ
      ?auto_11861 - OBJ
      ?auto_11862 - OBJ
      ?auto_11858 - LOCATION
    )
    :vars
    (
      ?auto_11864 - LOCATION
      ?auto_11865 - CITY
      ?auto_11866 - LOCATION
      ?auto_11867 - LOCATION
      ?auto_11863 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11864 ?auto_11865 ) ( IN-CITY ?auto_11858 ?auto_11865 ) ( not ( = ?auto_11858 ?auto_11864 ) ) ( OBJ-AT ?auto_11862 ?auto_11864 ) ( IN-CITY ?auto_11866 ?auto_11865 ) ( not ( = ?auto_11858 ?auto_11866 ) ) ( OBJ-AT ?auto_11861 ?auto_11866 ) ( IN-CITY ?auto_11867 ?auto_11865 ) ( not ( = ?auto_11858 ?auto_11867 ) ) ( OBJ-AT ?auto_11860 ?auto_11867 ) ( OBJ-AT ?auto_11859 ?auto_11864 ) ( TRUCK-AT ?auto_11863 ?auto_11858 ) ( not ( = ?auto_11859 ?auto_11860 ) ) ( not ( = ?auto_11867 ?auto_11864 ) ) ( not ( = ?auto_11859 ?auto_11861 ) ) ( not ( = ?auto_11860 ?auto_11861 ) ) ( not ( = ?auto_11866 ?auto_11867 ) ) ( not ( = ?auto_11866 ?auto_11864 ) ) ( not ( = ?auto_11859 ?auto_11862 ) ) ( not ( = ?auto_11860 ?auto_11862 ) ) ( not ( = ?auto_11861 ?auto_11862 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_11859 ?auto_11860 ?auto_11861 ?auto_11858 )
      ( DELIVER-1PKG ?auto_11862 ?auto_11858 )
      ( DELIVER-4PKG-VERIFY ?auto_11859 ?auto_11860 ?auto_11861 ?auto_11862 ?auto_11858 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_11891 - OBJ
      ?auto_11892 - OBJ
      ?auto_11893 - OBJ
      ?auto_11894 - OBJ
      ?auto_11890 - LOCATION
    )
    :vars
    (
      ?auto_11898 - LOCATION
      ?auto_11895 - CITY
      ?auto_11897 - LOCATION
      ?auto_11899 - LOCATION
      ?auto_11896 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11898 ?auto_11895 ) ( IN-CITY ?auto_11890 ?auto_11895 ) ( not ( = ?auto_11890 ?auto_11898 ) ) ( OBJ-AT ?auto_11893 ?auto_11898 ) ( IN-CITY ?auto_11897 ?auto_11895 ) ( not ( = ?auto_11890 ?auto_11897 ) ) ( OBJ-AT ?auto_11894 ?auto_11897 ) ( IN-CITY ?auto_11899 ?auto_11895 ) ( not ( = ?auto_11890 ?auto_11899 ) ) ( OBJ-AT ?auto_11892 ?auto_11899 ) ( OBJ-AT ?auto_11891 ?auto_11898 ) ( TRUCK-AT ?auto_11896 ?auto_11890 ) ( not ( = ?auto_11891 ?auto_11892 ) ) ( not ( = ?auto_11899 ?auto_11898 ) ) ( not ( = ?auto_11891 ?auto_11894 ) ) ( not ( = ?auto_11892 ?auto_11894 ) ) ( not ( = ?auto_11897 ?auto_11899 ) ) ( not ( = ?auto_11897 ?auto_11898 ) ) ( not ( = ?auto_11891 ?auto_11893 ) ) ( not ( = ?auto_11892 ?auto_11893 ) ) ( not ( = ?auto_11894 ?auto_11893 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_11891 ?auto_11892 ?auto_11894 ?auto_11893 ?auto_11890 )
      ( DELIVER-4PKG-VERIFY ?auto_11891 ?auto_11892 ?auto_11893 ?auto_11894 ?auto_11890 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12045 - OBJ
      ?auto_12046 - OBJ
      ?auto_12047 - OBJ
      ?auto_12048 - OBJ
      ?auto_12044 - LOCATION
    )
    :vars
    (
      ?auto_12052 - LOCATION
      ?auto_12053 - CITY
      ?auto_12051 - LOCATION
      ?auto_12049 - LOCATION
      ?auto_12050 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12052 ?auto_12053 ) ( IN-CITY ?auto_12044 ?auto_12053 ) ( not ( = ?auto_12044 ?auto_12052 ) ) ( OBJ-AT ?auto_12046 ?auto_12052 ) ( IN-CITY ?auto_12051 ?auto_12053 ) ( not ( = ?auto_12044 ?auto_12051 ) ) ( OBJ-AT ?auto_12048 ?auto_12051 ) ( IN-CITY ?auto_12049 ?auto_12053 ) ( not ( = ?auto_12044 ?auto_12049 ) ) ( OBJ-AT ?auto_12047 ?auto_12049 ) ( OBJ-AT ?auto_12045 ?auto_12052 ) ( TRUCK-AT ?auto_12050 ?auto_12044 ) ( not ( = ?auto_12045 ?auto_12047 ) ) ( not ( = ?auto_12049 ?auto_12052 ) ) ( not ( = ?auto_12045 ?auto_12048 ) ) ( not ( = ?auto_12047 ?auto_12048 ) ) ( not ( = ?auto_12051 ?auto_12049 ) ) ( not ( = ?auto_12051 ?auto_12052 ) ) ( not ( = ?auto_12045 ?auto_12046 ) ) ( not ( = ?auto_12047 ?auto_12046 ) ) ( not ( = ?auto_12048 ?auto_12046 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12045 ?auto_12047 ?auto_12046 ?auto_12048 ?auto_12044 )
      ( DELIVER-4PKG-VERIFY ?auto_12045 ?auto_12046 ?auto_12047 ?auto_12048 ?auto_12044 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12172 - OBJ
      ?auto_12173 - OBJ
      ?auto_12174 - OBJ
      ?auto_12175 - OBJ
      ?auto_12171 - LOCATION
    )
    :vars
    (
      ?auto_12179 - LOCATION
      ?auto_12180 - CITY
      ?auto_12178 - LOCATION
      ?auto_12176 - LOCATION
      ?auto_12177 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12179 ?auto_12180 ) ( IN-CITY ?auto_12171 ?auto_12180 ) ( not ( = ?auto_12171 ?auto_12179 ) ) ( OBJ-AT ?auto_12175 ?auto_12179 ) ( IN-CITY ?auto_12178 ?auto_12180 ) ( not ( = ?auto_12171 ?auto_12178 ) ) ( OBJ-AT ?auto_12174 ?auto_12178 ) ( IN-CITY ?auto_12176 ?auto_12180 ) ( not ( = ?auto_12171 ?auto_12176 ) ) ( OBJ-AT ?auto_12172 ?auto_12176 ) ( OBJ-AT ?auto_12173 ?auto_12179 ) ( TRUCK-AT ?auto_12177 ?auto_12171 ) ( not ( = ?auto_12173 ?auto_12172 ) ) ( not ( = ?auto_12176 ?auto_12179 ) ) ( not ( = ?auto_12173 ?auto_12174 ) ) ( not ( = ?auto_12172 ?auto_12174 ) ) ( not ( = ?auto_12178 ?auto_12176 ) ) ( not ( = ?auto_12178 ?auto_12179 ) ) ( not ( = ?auto_12173 ?auto_12175 ) ) ( not ( = ?auto_12172 ?auto_12175 ) ) ( not ( = ?auto_12174 ?auto_12175 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12173 ?auto_12172 ?auto_12175 ?auto_12174 ?auto_12171 )
      ( DELIVER-4PKG-VERIFY ?auto_12172 ?auto_12173 ?auto_12174 ?auto_12175 ?auto_12171 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12204 - OBJ
      ?auto_12205 - OBJ
      ?auto_12206 - OBJ
      ?auto_12207 - OBJ
      ?auto_12203 - LOCATION
    )
    :vars
    (
      ?auto_12211 - LOCATION
      ?auto_12212 - CITY
      ?auto_12210 - LOCATION
      ?auto_12208 - LOCATION
      ?auto_12209 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12211 ?auto_12212 ) ( IN-CITY ?auto_12203 ?auto_12212 ) ( not ( = ?auto_12203 ?auto_12211 ) ) ( OBJ-AT ?auto_12206 ?auto_12211 ) ( IN-CITY ?auto_12210 ?auto_12212 ) ( not ( = ?auto_12203 ?auto_12210 ) ) ( OBJ-AT ?auto_12207 ?auto_12210 ) ( IN-CITY ?auto_12208 ?auto_12212 ) ( not ( = ?auto_12203 ?auto_12208 ) ) ( OBJ-AT ?auto_12204 ?auto_12208 ) ( OBJ-AT ?auto_12205 ?auto_12211 ) ( TRUCK-AT ?auto_12209 ?auto_12203 ) ( not ( = ?auto_12205 ?auto_12204 ) ) ( not ( = ?auto_12208 ?auto_12211 ) ) ( not ( = ?auto_12205 ?auto_12207 ) ) ( not ( = ?auto_12204 ?auto_12207 ) ) ( not ( = ?auto_12210 ?auto_12208 ) ) ( not ( = ?auto_12210 ?auto_12211 ) ) ( not ( = ?auto_12205 ?auto_12206 ) ) ( not ( = ?auto_12204 ?auto_12206 ) ) ( not ( = ?auto_12207 ?auto_12206 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12205 ?auto_12204 ?auto_12206 ?auto_12207 ?auto_12203 )
      ( DELIVER-4PKG-VERIFY ?auto_12204 ?auto_12205 ?auto_12206 ?auto_12207 ?auto_12203 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12305 - OBJ
      ?auto_12306 - OBJ
      ?auto_12307 - OBJ
      ?auto_12308 - OBJ
      ?auto_12304 - LOCATION
    )
    :vars
    (
      ?auto_12312 - LOCATION
      ?auto_12313 - CITY
      ?auto_12311 - LOCATION
      ?auto_12309 - LOCATION
      ?auto_12310 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12312 ?auto_12313 ) ( IN-CITY ?auto_12304 ?auto_12313 ) ( not ( = ?auto_12304 ?auto_12312 ) ) ( OBJ-AT ?auto_12308 ?auto_12312 ) ( IN-CITY ?auto_12311 ?auto_12313 ) ( not ( = ?auto_12304 ?auto_12311 ) ) ( OBJ-AT ?auto_12306 ?auto_12311 ) ( IN-CITY ?auto_12309 ?auto_12313 ) ( not ( = ?auto_12304 ?auto_12309 ) ) ( OBJ-AT ?auto_12305 ?auto_12309 ) ( OBJ-AT ?auto_12307 ?auto_12312 ) ( TRUCK-AT ?auto_12310 ?auto_12304 ) ( not ( = ?auto_12307 ?auto_12305 ) ) ( not ( = ?auto_12309 ?auto_12312 ) ) ( not ( = ?auto_12307 ?auto_12306 ) ) ( not ( = ?auto_12305 ?auto_12306 ) ) ( not ( = ?auto_12311 ?auto_12309 ) ) ( not ( = ?auto_12311 ?auto_12312 ) ) ( not ( = ?auto_12307 ?auto_12308 ) ) ( not ( = ?auto_12305 ?auto_12308 ) ) ( not ( = ?auto_12306 ?auto_12308 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12307 ?auto_12305 ?auto_12308 ?auto_12306 ?auto_12304 )
      ( DELIVER-4PKG-VERIFY ?auto_12305 ?auto_12306 ?auto_12307 ?auto_12308 ?auto_12304 ) )
  )

)

