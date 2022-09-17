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
      ?auto_10607 - OBJ
      ?auto_10606 - LOCATION
    )
    :vars
    (
      ?auto_10609 - LOCATION
      ?auto_10610 - CITY
      ?auto_10608 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10609 ?auto_10610 ) ( IN-CITY ?auto_10606 ?auto_10610 ) ( not ( = ?auto_10606 ?auto_10609 ) ) ( OBJ-AT ?auto_10607 ?auto_10609 ) ( TRUCK-AT ?auto_10608 ?auto_10606 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10608 ?auto_10606 ?auto_10609 ?auto_10610 )
      ( !LOAD-TRUCK ?auto_10607 ?auto_10608 ?auto_10609 )
      ( !DRIVE-TRUCK ?auto_10608 ?auto_10609 ?auto_10606 ?auto_10610 )
      ( !UNLOAD-TRUCK ?auto_10607 ?auto_10608 ?auto_10606 )
      ( DELIVER-1PKG-VERIFY ?auto_10607 ?auto_10606 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10628 - OBJ
      ?auto_10629 - OBJ
      ?auto_10627 - LOCATION
    )
    :vars
    (
      ?auto_10630 - LOCATION
      ?auto_10631 - CITY
      ?auto_10633 - LOCATION
      ?auto_10632 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10630 ?auto_10631 ) ( IN-CITY ?auto_10627 ?auto_10631 ) ( not ( = ?auto_10627 ?auto_10630 ) ) ( OBJ-AT ?auto_10629 ?auto_10630 ) ( IN-CITY ?auto_10633 ?auto_10631 ) ( not ( = ?auto_10627 ?auto_10633 ) ) ( OBJ-AT ?auto_10628 ?auto_10633 ) ( TRUCK-AT ?auto_10632 ?auto_10627 ) ( not ( = ?auto_10628 ?auto_10629 ) ) ( not ( = ?auto_10630 ?auto_10633 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10628 ?auto_10627 )
      ( DELIVER-1PKG ?auto_10629 ?auto_10627 )
      ( DELIVER-2PKG-VERIFY ?auto_10628 ?auto_10629 ?auto_10627 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10738 - OBJ
      ?auto_10739 - OBJ
      ?auto_10740 - OBJ
      ?auto_10737 - LOCATION
    )
    :vars
    (
      ?auto_10743 - LOCATION
      ?auto_10741 - CITY
      ?auto_10744 - LOCATION
      ?auto_10742 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10743 ?auto_10741 ) ( IN-CITY ?auto_10737 ?auto_10741 ) ( not ( = ?auto_10737 ?auto_10743 ) ) ( OBJ-AT ?auto_10740 ?auto_10743 ) ( IN-CITY ?auto_10744 ?auto_10741 ) ( not ( = ?auto_10737 ?auto_10744 ) ) ( OBJ-AT ?auto_10739 ?auto_10744 ) ( OBJ-AT ?auto_10738 ?auto_10743 ) ( TRUCK-AT ?auto_10742 ?auto_10737 ) ( not ( = ?auto_10738 ?auto_10739 ) ) ( not ( = ?auto_10744 ?auto_10743 ) ) ( not ( = ?auto_10738 ?auto_10740 ) ) ( not ( = ?auto_10739 ?auto_10740 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10738 ?auto_10739 ?auto_10737 )
      ( DELIVER-1PKG ?auto_10740 ?auto_10737 )
      ( DELIVER-3PKG-VERIFY ?auto_10738 ?auto_10739 ?auto_10740 ?auto_10737 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10755 - OBJ
      ?auto_10756 - OBJ
      ?auto_10757 - OBJ
      ?auto_10754 - LOCATION
    )
    :vars
    (
      ?auto_10761 - LOCATION
      ?auto_10760 - CITY
      ?auto_10758 - LOCATION
      ?auto_10759 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10761 ?auto_10760 ) ( IN-CITY ?auto_10754 ?auto_10760 ) ( not ( = ?auto_10754 ?auto_10761 ) ) ( OBJ-AT ?auto_10756 ?auto_10761 ) ( IN-CITY ?auto_10758 ?auto_10760 ) ( not ( = ?auto_10754 ?auto_10758 ) ) ( OBJ-AT ?auto_10757 ?auto_10758 ) ( OBJ-AT ?auto_10755 ?auto_10761 ) ( TRUCK-AT ?auto_10759 ?auto_10754 ) ( not ( = ?auto_10755 ?auto_10757 ) ) ( not ( = ?auto_10758 ?auto_10761 ) ) ( not ( = ?auto_10755 ?auto_10756 ) ) ( not ( = ?auto_10757 ?auto_10756 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_10755 ?auto_10757 ?auto_10756 ?auto_10754 )
      ( DELIVER-3PKG-VERIFY ?auto_10755 ?auto_10756 ?auto_10757 ?auto_10754 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10772 - OBJ
      ?auto_10773 - OBJ
      ?auto_10774 - OBJ
      ?auto_10771 - LOCATION
    )
    :vars
    (
      ?auto_10777 - LOCATION
      ?auto_10776 - CITY
      ?auto_10778 - LOCATION
      ?auto_10775 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10777 ?auto_10776 ) ( IN-CITY ?auto_10771 ?auto_10776 ) ( not ( = ?auto_10771 ?auto_10777 ) ) ( OBJ-AT ?auto_10774 ?auto_10777 ) ( IN-CITY ?auto_10778 ?auto_10776 ) ( not ( = ?auto_10771 ?auto_10778 ) ) ( OBJ-AT ?auto_10772 ?auto_10778 ) ( OBJ-AT ?auto_10773 ?auto_10777 ) ( TRUCK-AT ?auto_10775 ?auto_10771 ) ( not ( = ?auto_10773 ?auto_10772 ) ) ( not ( = ?auto_10778 ?auto_10777 ) ) ( not ( = ?auto_10773 ?auto_10774 ) ) ( not ( = ?auto_10772 ?auto_10774 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_10773 ?auto_10774 ?auto_10772 ?auto_10771 )
      ( DELIVER-3PKG-VERIFY ?auto_10772 ?auto_10773 ?auto_10774 ?auto_10771 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_11858 - OBJ
      ?auto_11859 - OBJ
      ?auto_11860 - OBJ
      ?auto_11861 - OBJ
      ?auto_11857 - LOCATION
    )
    :vars
    (
      ?auto_11862 - LOCATION
      ?auto_11863 - CITY
      ?auto_11865 - LOCATION
      ?auto_11864 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11862 ?auto_11863 ) ( IN-CITY ?auto_11857 ?auto_11863 ) ( not ( = ?auto_11857 ?auto_11862 ) ) ( OBJ-AT ?auto_11861 ?auto_11862 ) ( IN-CITY ?auto_11865 ?auto_11863 ) ( not ( = ?auto_11857 ?auto_11865 ) ) ( OBJ-AT ?auto_11860 ?auto_11865 ) ( OBJ-AT ?auto_11859 ?auto_11862 ) ( OBJ-AT ?auto_11858 ?auto_11865 ) ( TRUCK-AT ?auto_11864 ?auto_11857 ) ( not ( = ?auto_11858 ?auto_11859 ) ) ( not ( = ?auto_11862 ?auto_11865 ) ) ( not ( = ?auto_11858 ?auto_11860 ) ) ( not ( = ?auto_11859 ?auto_11860 ) ) ( not ( = ?auto_11858 ?auto_11861 ) ) ( not ( = ?auto_11859 ?auto_11861 ) ) ( not ( = ?auto_11860 ?auto_11861 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_11858 ?auto_11860 ?auto_11859 ?auto_11857 )
      ( DELIVER-1PKG ?auto_11861 ?auto_11857 )
      ( DELIVER-4PKG-VERIFY ?auto_11858 ?auto_11859 ?auto_11860 ?auto_11861 ?auto_11857 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_11887 - OBJ
      ?auto_11888 - OBJ
      ?auto_11889 - OBJ
      ?auto_11890 - OBJ
      ?auto_11886 - LOCATION
    )
    :vars
    (
      ?auto_11893 - LOCATION
      ?auto_11891 - CITY
      ?auto_11894 - LOCATION
      ?auto_11892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11893 ?auto_11891 ) ( IN-CITY ?auto_11886 ?auto_11891 ) ( not ( = ?auto_11886 ?auto_11893 ) ) ( OBJ-AT ?auto_11889 ?auto_11893 ) ( IN-CITY ?auto_11894 ?auto_11891 ) ( not ( = ?auto_11886 ?auto_11894 ) ) ( OBJ-AT ?auto_11890 ?auto_11894 ) ( OBJ-AT ?auto_11888 ?auto_11893 ) ( OBJ-AT ?auto_11887 ?auto_11894 ) ( TRUCK-AT ?auto_11892 ?auto_11886 ) ( not ( = ?auto_11887 ?auto_11888 ) ) ( not ( = ?auto_11893 ?auto_11894 ) ) ( not ( = ?auto_11887 ?auto_11890 ) ) ( not ( = ?auto_11888 ?auto_11890 ) ) ( not ( = ?auto_11887 ?auto_11889 ) ) ( not ( = ?auto_11888 ?auto_11889 ) ) ( not ( = ?auto_11890 ?auto_11889 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_11887 ?auto_11888 ?auto_11890 ?auto_11889 ?auto_11886 )
      ( DELIVER-4PKG-VERIFY ?auto_11887 ?auto_11888 ?auto_11889 ?auto_11890 ?auto_11886 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_11916 - OBJ
      ?auto_11917 - OBJ
      ?auto_11918 - OBJ
      ?auto_11919 - OBJ
      ?auto_11915 - LOCATION
    )
    :vars
    (
      ?auto_11923 - LOCATION
      ?auto_11920 - CITY
      ?auto_11921 - LOCATION
      ?auto_11922 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11923 ?auto_11920 ) ( IN-CITY ?auto_11915 ?auto_11920 ) ( not ( = ?auto_11915 ?auto_11923 ) ) ( OBJ-AT ?auto_11919 ?auto_11923 ) ( IN-CITY ?auto_11921 ?auto_11920 ) ( not ( = ?auto_11915 ?auto_11921 ) ) ( OBJ-AT ?auto_11917 ?auto_11921 ) ( OBJ-AT ?auto_11918 ?auto_11923 ) ( OBJ-AT ?auto_11916 ?auto_11921 ) ( TRUCK-AT ?auto_11922 ?auto_11915 ) ( not ( = ?auto_11916 ?auto_11918 ) ) ( not ( = ?auto_11923 ?auto_11921 ) ) ( not ( = ?auto_11916 ?auto_11917 ) ) ( not ( = ?auto_11918 ?auto_11917 ) ) ( not ( = ?auto_11916 ?auto_11919 ) ) ( not ( = ?auto_11918 ?auto_11919 ) ) ( not ( = ?auto_11917 ?auto_11919 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_11916 ?auto_11918 ?auto_11919 ?auto_11917 ?auto_11915 )
      ( DELIVER-4PKG-VERIFY ?auto_11916 ?auto_11917 ?auto_11918 ?auto_11919 ?auto_11915 ) )
  )

)

