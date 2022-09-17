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
      ?auto_7813 - OBJ
      ?auto_7812 - LOCATION
    )
    :vars
    (
      ?auto_7815 - LOCATION
      ?auto_7816 - CITY
      ?auto_7814 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7815 ?auto_7816 ) ( IN-CITY ?auto_7812 ?auto_7816 ) ( not ( = ?auto_7812 ?auto_7815 ) ) ( OBJ-AT ?auto_7813 ?auto_7815 ) ( TRUCK-AT ?auto_7814 ?auto_7812 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7814 ?auto_7812 ?auto_7815 ?auto_7816 )
      ( !LOAD-TRUCK ?auto_7813 ?auto_7814 ?auto_7815 )
      ( !DRIVE-TRUCK ?auto_7814 ?auto_7815 ?auto_7812 ?auto_7816 )
      ( !UNLOAD-TRUCK ?auto_7813 ?auto_7814 ?auto_7812 )
      ( DELIVER-1PKG-VERIFY ?auto_7813 ?auto_7812 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7820 - OBJ
      ?auto_7819 - LOCATION
    )
    :vars
    (
      ?auto_7822 - LOCATION
      ?auto_7823 - CITY
      ?auto_7821 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7822 ?auto_7823 ) ( IN-CITY ?auto_7819 ?auto_7823 ) ( not ( = ?auto_7819 ?auto_7822 ) ) ( OBJ-AT ?auto_7820 ?auto_7822 ) ( TRUCK-AT ?auto_7821 ?auto_7819 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7821 ?auto_7819 ?auto_7822 ?auto_7823 )
      ( !LOAD-TRUCK ?auto_7820 ?auto_7821 ?auto_7822 )
      ( !DRIVE-TRUCK ?auto_7821 ?auto_7822 ?auto_7819 ?auto_7823 )
      ( !UNLOAD-TRUCK ?auto_7820 ?auto_7821 ?auto_7819 )
      ( DELIVER-1PKG-VERIFY ?auto_7820 ?auto_7819 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7834 - OBJ
      ?auto_7835 - OBJ
      ?auto_7833 - LOCATION
    )
    :vars
    (
      ?auto_7837 - LOCATION
      ?auto_7838 - CITY
      ?auto_7839 - LOCATION
      ?auto_7836 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7837 ?auto_7838 ) ( IN-CITY ?auto_7833 ?auto_7838 ) ( not ( = ?auto_7833 ?auto_7837 ) ) ( OBJ-AT ?auto_7835 ?auto_7837 ) ( IN-CITY ?auto_7839 ?auto_7838 ) ( not ( = ?auto_7833 ?auto_7839 ) ) ( OBJ-AT ?auto_7834 ?auto_7839 ) ( TRUCK-AT ?auto_7836 ?auto_7833 ) ( not ( = ?auto_7834 ?auto_7835 ) ) ( not ( = ?auto_7837 ?auto_7839 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7834 ?auto_7833 )
      ( DELIVER-1PKG ?auto_7835 ?auto_7833 )
      ( DELIVER-2PKG-VERIFY ?auto_7834 ?auto_7835 ?auto_7833 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7841 - OBJ
      ?auto_7842 - OBJ
      ?auto_7840 - LOCATION
    )
    :vars
    (
      ?auto_7844 - LOCATION
      ?auto_7845 - CITY
      ?auto_7846 - LOCATION
      ?auto_7843 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7844 ?auto_7845 ) ( IN-CITY ?auto_7840 ?auto_7845 ) ( not ( = ?auto_7840 ?auto_7844 ) ) ( OBJ-AT ?auto_7841 ?auto_7844 ) ( IN-CITY ?auto_7846 ?auto_7845 ) ( not ( = ?auto_7840 ?auto_7846 ) ) ( OBJ-AT ?auto_7842 ?auto_7846 ) ( TRUCK-AT ?auto_7843 ?auto_7840 ) ( not ( = ?auto_7842 ?auto_7841 ) ) ( not ( = ?auto_7844 ?auto_7846 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7842 ?auto_7841 ?auto_7840 )
      ( DELIVER-2PKG-VERIFY ?auto_7841 ?auto_7842 ?auto_7840 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7858 - OBJ
      ?auto_7857 - LOCATION
    )
    :vars
    (
      ?auto_7860 - LOCATION
      ?auto_7861 - CITY
      ?auto_7859 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7860 ?auto_7861 ) ( IN-CITY ?auto_7857 ?auto_7861 ) ( not ( = ?auto_7857 ?auto_7860 ) ) ( OBJ-AT ?auto_7858 ?auto_7860 ) ( TRUCK-AT ?auto_7859 ?auto_7857 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7859 ?auto_7857 ?auto_7860 ?auto_7861 )
      ( !LOAD-TRUCK ?auto_7858 ?auto_7859 ?auto_7860 )
      ( !DRIVE-TRUCK ?auto_7859 ?auto_7860 ?auto_7857 ?auto_7861 )
      ( !UNLOAD-TRUCK ?auto_7858 ?auto_7859 ?auto_7857 )
      ( DELIVER-1PKG-VERIFY ?auto_7858 ?auto_7857 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7949 - OBJ
      ?auto_7950 - OBJ
      ?auto_7951 - OBJ
      ?auto_7948 - LOCATION
    )
    :vars
    (
      ?auto_7952 - LOCATION
      ?auto_7954 - CITY
      ?auto_7956 - LOCATION
      ?auto_7955 - LOCATION
      ?auto_7953 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7952 ?auto_7954 ) ( IN-CITY ?auto_7948 ?auto_7954 ) ( not ( = ?auto_7948 ?auto_7952 ) ) ( OBJ-AT ?auto_7951 ?auto_7952 ) ( IN-CITY ?auto_7956 ?auto_7954 ) ( not ( = ?auto_7948 ?auto_7956 ) ) ( OBJ-AT ?auto_7950 ?auto_7956 ) ( IN-CITY ?auto_7955 ?auto_7954 ) ( not ( = ?auto_7948 ?auto_7955 ) ) ( OBJ-AT ?auto_7949 ?auto_7955 ) ( TRUCK-AT ?auto_7953 ?auto_7948 ) ( not ( = ?auto_7949 ?auto_7950 ) ) ( not ( = ?auto_7956 ?auto_7955 ) ) ( not ( = ?auto_7949 ?auto_7951 ) ) ( not ( = ?auto_7950 ?auto_7951 ) ) ( not ( = ?auto_7952 ?auto_7956 ) ) ( not ( = ?auto_7952 ?auto_7955 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7950 ?auto_7949 ?auto_7948 )
      ( DELIVER-1PKG ?auto_7951 ?auto_7948 )
      ( DELIVER-3PKG-VERIFY ?auto_7949 ?auto_7950 ?auto_7951 ?auto_7948 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7968 - OBJ
      ?auto_7969 - OBJ
      ?auto_7970 - OBJ
      ?auto_7967 - LOCATION
    )
    :vars
    (
      ?auto_7975 - LOCATION
      ?auto_7973 - CITY
      ?auto_7972 - LOCATION
      ?auto_7974 - LOCATION
      ?auto_7971 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7975 ?auto_7973 ) ( IN-CITY ?auto_7967 ?auto_7973 ) ( not ( = ?auto_7967 ?auto_7975 ) ) ( OBJ-AT ?auto_7969 ?auto_7975 ) ( IN-CITY ?auto_7972 ?auto_7973 ) ( not ( = ?auto_7967 ?auto_7972 ) ) ( OBJ-AT ?auto_7970 ?auto_7972 ) ( IN-CITY ?auto_7974 ?auto_7973 ) ( not ( = ?auto_7967 ?auto_7974 ) ) ( OBJ-AT ?auto_7968 ?auto_7974 ) ( TRUCK-AT ?auto_7971 ?auto_7967 ) ( not ( = ?auto_7968 ?auto_7970 ) ) ( not ( = ?auto_7972 ?auto_7974 ) ) ( not ( = ?auto_7968 ?auto_7969 ) ) ( not ( = ?auto_7970 ?auto_7969 ) ) ( not ( = ?auto_7975 ?auto_7972 ) ) ( not ( = ?auto_7975 ?auto_7974 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_7968 ?auto_7970 ?auto_7969 ?auto_7967 )
      ( DELIVER-3PKG-VERIFY ?auto_7968 ?auto_7969 ?auto_7970 ?auto_7967 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7987 - OBJ
      ?auto_7988 - OBJ
      ?auto_7989 - OBJ
      ?auto_7986 - LOCATION
    )
    :vars
    (
      ?auto_7992 - LOCATION
      ?auto_7991 - CITY
      ?auto_7990 - LOCATION
      ?auto_7994 - LOCATION
      ?auto_7993 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7992 ?auto_7991 ) ( IN-CITY ?auto_7986 ?auto_7991 ) ( not ( = ?auto_7986 ?auto_7992 ) ) ( OBJ-AT ?auto_7989 ?auto_7992 ) ( IN-CITY ?auto_7990 ?auto_7991 ) ( not ( = ?auto_7986 ?auto_7990 ) ) ( OBJ-AT ?auto_7987 ?auto_7990 ) ( IN-CITY ?auto_7994 ?auto_7991 ) ( not ( = ?auto_7986 ?auto_7994 ) ) ( OBJ-AT ?auto_7988 ?auto_7994 ) ( TRUCK-AT ?auto_7993 ?auto_7986 ) ( not ( = ?auto_7988 ?auto_7987 ) ) ( not ( = ?auto_7990 ?auto_7994 ) ) ( not ( = ?auto_7988 ?auto_7989 ) ) ( not ( = ?auto_7987 ?auto_7989 ) ) ( not ( = ?auto_7992 ?auto_7990 ) ) ( not ( = ?auto_7992 ?auto_7994 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_7988 ?auto_7989 ?auto_7987 ?auto_7986 )
      ( DELIVER-3PKG-VERIFY ?auto_7987 ?auto_7988 ?auto_7989 ?auto_7986 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8006 - OBJ
      ?auto_8007 - OBJ
      ?auto_8008 - OBJ
      ?auto_8005 - LOCATION
    )
    :vars
    (
      ?auto_8011 - LOCATION
      ?auto_8010 - CITY
      ?auto_8009 - LOCATION
      ?auto_8013 - LOCATION
      ?auto_8012 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8011 ?auto_8010 ) ( IN-CITY ?auto_8005 ?auto_8010 ) ( not ( = ?auto_8005 ?auto_8011 ) ) ( OBJ-AT ?auto_8007 ?auto_8011 ) ( IN-CITY ?auto_8009 ?auto_8010 ) ( not ( = ?auto_8005 ?auto_8009 ) ) ( OBJ-AT ?auto_8006 ?auto_8009 ) ( IN-CITY ?auto_8013 ?auto_8010 ) ( not ( = ?auto_8005 ?auto_8013 ) ) ( OBJ-AT ?auto_8008 ?auto_8013 ) ( TRUCK-AT ?auto_8012 ?auto_8005 ) ( not ( = ?auto_8008 ?auto_8006 ) ) ( not ( = ?auto_8009 ?auto_8013 ) ) ( not ( = ?auto_8008 ?auto_8007 ) ) ( not ( = ?auto_8006 ?auto_8007 ) ) ( not ( = ?auto_8011 ?auto_8009 ) ) ( not ( = ?auto_8011 ?auto_8013 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_8008 ?auto_8007 ?auto_8006 ?auto_8005 )
      ( DELIVER-3PKG-VERIFY ?auto_8006 ?auto_8007 ?auto_8008 ?auto_8005 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8045 - OBJ
      ?auto_8046 - OBJ
      ?auto_8047 - OBJ
      ?auto_8044 - LOCATION
    )
    :vars
    (
      ?auto_8050 - LOCATION
      ?auto_8049 - CITY
      ?auto_8048 - LOCATION
      ?auto_8052 - LOCATION
      ?auto_8051 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8050 ?auto_8049 ) ( IN-CITY ?auto_8044 ?auto_8049 ) ( not ( = ?auto_8044 ?auto_8050 ) ) ( OBJ-AT ?auto_8045 ?auto_8050 ) ( IN-CITY ?auto_8048 ?auto_8049 ) ( not ( = ?auto_8044 ?auto_8048 ) ) ( OBJ-AT ?auto_8047 ?auto_8048 ) ( IN-CITY ?auto_8052 ?auto_8049 ) ( not ( = ?auto_8044 ?auto_8052 ) ) ( OBJ-AT ?auto_8046 ?auto_8052 ) ( TRUCK-AT ?auto_8051 ?auto_8044 ) ( not ( = ?auto_8046 ?auto_8047 ) ) ( not ( = ?auto_8048 ?auto_8052 ) ) ( not ( = ?auto_8046 ?auto_8045 ) ) ( not ( = ?auto_8047 ?auto_8045 ) ) ( not ( = ?auto_8050 ?auto_8048 ) ) ( not ( = ?auto_8050 ?auto_8052 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_8046 ?auto_8045 ?auto_8047 ?auto_8044 )
      ( DELIVER-3PKG-VERIFY ?auto_8045 ?auto_8046 ?auto_8047 ?auto_8044 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8064 - OBJ
      ?auto_8065 - OBJ
      ?auto_8066 - OBJ
      ?auto_8063 - LOCATION
    )
    :vars
    (
      ?auto_8069 - LOCATION
      ?auto_8068 - CITY
      ?auto_8067 - LOCATION
      ?auto_8071 - LOCATION
      ?auto_8070 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8069 ?auto_8068 ) ( IN-CITY ?auto_8063 ?auto_8068 ) ( not ( = ?auto_8063 ?auto_8069 ) ) ( OBJ-AT ?auto_8064 ?auto_8069 ) ( IN-CITY ?auto_8067 ?auto_8068 ) ( not ( = ?auto_8063 ?auto_8067 ) ) ( OBJ-AT ?auto_8065 ?auto_8067 ) ( IN-CITY ?auto_8071 ?auto_8068 ) ( not ( = ?auto_8063 ?auto_8071 ) ) ( OBJ-AT ?auto_8066 ?auto_8071 ) ( TRUCK-AT ?auto_8070 ?auto_8063 ) ( not ( = ?auto_8066 ?auto_8065 ) ) ( not ( = ?auto_8067 ?auto_8071 ) ) ( not ( = ?auto_8066 ?auto_8064 ) ) ( not ( = ?auto_8065 ?auto_8064 ) ) ( not ( = ?auto_8069 ?auto_8067 ) ) ( not ( = ?auto_8069 ?auto_8071 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_8066 ?auto_8064 ?auto_8065 ?auto_8063 )
      ( DELIVER-3PKG-VERIFY ?auto_8064 ?auto_8065 ?auto_8066 ?auto_8063 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8126 - OBJ
      ?auto_8125 - LOCATION
    )
    :vars
    (
      ?auto_8128 - LOCATION
      ?auto_8129 - CITY
      ?auto_8127 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8128 ?auto_8129 ) ( IN-CITY ?auto_8125 ?auto_8129 ) ( not ( = ?auto_8125 ?auto_8128 ) ) ( OBJ-AT ?auto_8126 ?auto_8128 ) ( TRUCK-AT ?auto_8127 ?auto_8125 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8127 ?auto_8125 ?auto_8128 ?auto_8129 )
      ( !LOAD-TRUCK ?auto_8126 ?auto_8127 ?auto_8128 )
      ( !DRIVE-TRUCK ?auto_8127 ?auto_8128 ?auto_8125 ?auto_8129 )
      ( !UNLOAD-TRUCK ?auto_8126 ?auto_8127 ?auto_8125 )
      ( DELIVER-1PKG-VERIFY ?auto_8126 ?auto_8125 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9117 - OBJ
      ?auto_9118 - OBJ
      ?auto_9119 - OBJ
      ?auto_9120 - OBJ
      ?auto_9116 - LOCATION
    )
    :vars
    (
      ?auto_9123 - LOCATION
      ?auto_9122 - CITY
      ?auto_9125 - LOCATION
      ?auto_9124 - LOCATION
      ?auto_9126 - LOCATION
      ?auto_9121 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9123 ?auto_9122 ) ( IN-CITY ?auto_9116 ?auto_9122 ) ( not ( = ?auto_9116 ?auto_9123 ) ) ( OBJ-AT ?auto_9120 ?auto_9123 ) ( IN-CITY ?auto_9125 ?auto_9122 ) ( not ( = ?auto_9116 ?auto_9125 ) ) ( OBJ-AT ?auto_9119 ?auto_9125 ) ( IN-CITY ?auto_9124 ?auto_9122 ) ( not ( = ?auto_9116 ?auto_9124 ) ) ( OBJ-AT ?auto_9118 ?auto_9124 ) ( IN-CITY ?auto_9126 ?auto_9122 ) ( not ( = ?auto_9116 ?auto_9126 ) ) ( OBJ-AT ?auto_9117 ?auto_9126 ) ( TRUCK-AT ?auto_9121 ?auto_9116 ) ( not ( = ?auto_9117 ?auto_9118 ) ) ( not ( = ?auto_9124 ?auto_9126 ) ) ( not ( = ?auto_9117 ?auto_9119 ) ) ( not ( = ?auto_9118 ?auto_9119 ) ) ( not ( = ?auto_9125 ?auto_9124 ) ) ( not ( = ?auto_9125 ?auto_9126 ) ) ( not ( = ?auto_9117 ?auto_9120 ) ) ( not ( = ?auto_9118 ?auto_9120 ) ) ( not ( = ?auto_9119 ?auto_9120 ) ) ( not ( = ?auto_9123 ?auto_9125 ) ) ( not ( = ?auto_9123 ?auto_9124 ) ) ( not ( = ?auto_9123 ?auto_9126 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_9117 ?auto_9119 ?auto_9118 ?auto_9116 )
      ( DELIVER-1PKG ?auto_9120 ?auto_9116 )
      ( DELIVER-4PKG-VERIFY ?auto_9117 ?auto_9118 ?auto_9119 ?auto_9120 ?auto_9116 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9152 - OBJ
      ?auto_9153 - OBJ
      ?auto_9154 - OBJ
      ?auto_9155 - OBJ
      ?auto_9151 - LOCATION
    )
    :vars
    (
      ?auto_9159 - LOCATION
      ?auto_9160 - CITY
      ?auto_9161 - LOCATION
      ?auto_9156 - LOCATION
      ?auto_9157 - LOCATION
      ?auto_9158 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9159 ?auto_9160 ) ( IN-CITY ?auto_9151 ?auto_9160 ) ( not ( = ?auto_9151 ?auto_9159 ) ) ( OBJ-AT ?auto_9154 ?auto_9159 ) ( IN-CITY ?auto_9161 ?auto_9160 ) ( not ( = ?auto_9151 ?auto_9161 ) ) ( OBJ-AT ?auto_9155 ?auto_9161 ) ( IN-CITY ?auto_9156 ?auto_9160 ) ( not ( = ?auto_9151 ?auto_9156 ) ) ( OBJ-AT ?auto_9153 ?auto_9156 ) ( IN-CITY ?auto_9157 ?auto_9160 ) ( not ( = ?auto_9151 ?auto_9157 ) ) ( OBJ-AT ?auto_9152 ?auto_9157 ) ( TRUCK-AT ?auto_9158 ?auto_9151 ) ( not ( = ?auto_9152 ?auto_9153 ) ) ( not ( = ?auto_9156 ?auto_9157 ) ) ( not ( = ?auto_9152 ?auto_9155 ) ) ( not ( = ?auto_9153 ?auto_9155 ) ) ( not ( = ?auto_9161 ?auto_9156 ) ) ( not ( = ?auto_9161 ?auto_9157 ) ) ( not ( = ?auto_9152 ?auto_9154 ) ) ( not ( = ?auto_9153 ?auto_9154 ) ) ( not ( = ?auto_9155 ?auto_9154 ) ) ( not ( = ?auto_9159 ?auto_9161 ) ) ( not ( = ?auto_9159 ?auto_9156 ) ) ( not ( = ?auto_9159 ?auto_9157 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9152 ?auto_9153 ?auto_9155 ?auto_9154 ?auto_9151 )
      ( DELIVER-4PKG-VERIFY ?auto_9152 ?auto_9153 ?auto_9154 ?auto_9155 ?auto_9151 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9187 - OBJ
      ?auto_9188 - OBJ
      ?auto_9189 - OBJ
      ?auto_9190 - OBJ
      ?auto_9186 - LOCATION
    )
    :vars
    (
      ?auto_9196 - LOCATION
      ?auto_9194 - CITY
      ?auto_9193 - LOCATION
      ?auto_9191 - LOCATION
      ?auto_9192 - LOCATION
      ?auto_9195 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9196 ?auto_9194 ) ( IN-CITY ?auto_9186 ?auto_9194 ) ( not ( = ?auto_9186 ?auto_9196 ) ) ( OBJ-AT ?auto_9190 ?auto_9196 ) ( IN-CITY ?auto_9193 ?auto_9194 ) ( not ( = ?auto_9186 ?auto_9193 ) ) ( OBJ-AT ?auto_9188 ?auto_9193 ) ( IN-CITY ?auto_9191 ?auto_9194 ) ( not ( = ?auto_9186 ?auto_9191 ) ) ( OBJ-AT ?auto_9189 ?auto_9191 ) ( IN-CITY ?auto_9192 ?auto_9194 ) ( not ( = ?auto_9186 ?auto_9192 ) ) ( OBJ-AT ?auto_9187 ?auto_9192 ) ( TRUCK-AT ?auto_9195 ?auto_9186 ) ( not ( = ?auto_9187 ?auto_9189 ) ) ( not ( = ?auto_9191 ?auto_9192 ) ) ( not ( = ?auto_9187 ?auto_9188 ) ) ( not ( = ?auto_9189 ?auto_9188 ) ) ( not ( = ?auto_9193 ?auto_9191 ) ) ( not ( = ?auto_9193 ?auto_9192 ) ) ( not ( = ?auto_9187 ?auto_9190 ) ) ( not ( = ?auto_9189 ?auto_9190 ) ) ( not ( = ?auto_9188 ?auto_9190 ) ) ( not ( = ?auto_9196 ?auto_9193 ) ) ( not ( = ?auto_9196 ?auto_9191 ) ) ( not ( = ?auto_9196 ?auto_9192 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9187 ?auto_9189 ?auto_9190 ?auto_9188 ?auto_9186 )
      ( DELIVER-4PKG-VERIFY ?auto_9187 ?auto_9188 ?auto_9189 ?auto_9190 ?auto_9186 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9222 - OBJ
      ?auto_9223 - OBJ
      ?auto_9224 - OBJ
      ?auto_9225 - OBJ
      ?auto_9221 - LOCATION
    )
    :vars
    (
      ?auto_9231 - LOCATION
      ?auto_9229 - CITY
      ?auto_9228 - LOCATION
      ?auto_9226 - LOCATION
      ?auto_9227 - LOCATION
      ?auto_9230 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9231 ?auto_9229 ) ( IN-CITY ?auto_9221 ?auto_9229 ) ( not ( = ?auto_9221 ?auto_9231 ) ) ( OBJ-AT ?auto_9224 ?auto_9231 ) ( IN-CITY ?auto_9228 ?auto_9229 ) ( not ( = ?auto_9221 ?auto_9228 ) ) ( OBJ-AT ?auto_9223 ?auto_9228 ) ( IN-CITY ?auto_9226 ?auto_9229 ) ( not ( = ?auto_9221 ?auto_9226 ) ) ( OBJ-AT ?auto_9225 ?auto_9226 ) ( IN-CITY ?auto_9227 ?auto_9229 ) ( not ( = ?auto_9221 ?auto_9227 ) ) ( OBJ-AT ?auto_9222 ?auto_9227 ) ( TRUCK-AT ?auto_9230 ?auto_9221 ) ( not ( = ?auto_9222 ?auto_9225 ) ) ( not ( = ?auto_9226 ?auto_9227 ) ) ( not ( = ?auto_9222 ?auto_9223 ) ) ( not ( = ?auto_9225 ?auto_9223 ) ) ( not ( = ?auto_9228 ?auto_9226 ) ) ( not ( = ?auto_9228 ?auto_9227 ) ) ( not ( = ?auto_9222 ?auto_9224 ) ) ( not ( = ?auto_9225 ?auto_9224 ) ) ( not ( = ?auto_9223 ?auto_9224 ) ) ( not ( = ?auto_9231 ?auto_9228 ) ) ( not ( = ?auto_9231 ?auto_9226 ) ) ( not ( = ?auto_9231 ?auto_9227 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9222 ?auto_9225 ?auto_9224 ?auto_9223 ?auto_9221 )
      ( DELIVER-4PKG-VERIFY ?auto_9222 ?auto_9223 ?auto_9224 ?auto_9225 ?auto_9221 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9331 - OBJ
      ?auto_9332 - OBJ
      ?auto_9333 - OBJ
      ?auto_9334 - OBJ
      ?auto_9330 - LOCATION
    )
    :vars
    (
      ?auto_9340 - LOCATION
      ?auto_9338 - CITY
      ?auto_9337 - LOCATION
      ?auto_9335 - LOCATION
      ?auto_9336 - LOCATION
      ?auto_9339 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9340 ?auto_9338 ) ( IN-CITY ?auto_9330 ?auto_9338 ) ( not ( = ?auto_9330 ?auto_9340 ) ) ( OBJ-AT ?auto_9332 ?auto_9340 ) ( IN-CITY ?auto_9337 ?auto_9338 ) ( not ( = ?auto_9330 ?auto_9337 ) ) ( OBJ-AT ?auto_9334 ?auto_9337 ) ( IN-CITY ?auto_9335 ?auto_9338 ) ( not ( = ?auto_9330 ?auto_9335 ) ) ( OBJ-AT ?auto_9333 ?auto_9335 ) ( IN-CITY ?auto_9336 ?auto_9338 ) ( not ( = ?auto_9330 ?auto_9336 ) ) ( OBJ-AT ?auto_9331 ?auto_9336 ) ( TRUCK-AT ?auto_9339 ?auto_9330 ) ( not ( = ?auto_9331 ?auto_9333 ) ) ( not ( = ?auto_9335 ?auto_9336 ) ) ( not ( = ?auto_9331 ?auto_9334 ) ) ( not ( = ?auto_9333 ?auto_9334 ) ) ( not ( = ?auto_9337 ?auto_9335 ) ) ( not ( = ?auto_9337 ?auto_9336 ) ) ( not ( = ?auto_9331 ?auto_9332 ) ) ( not ( = ?auto_9333 ?auto_9332 ) ) ( not ( = ?auto_9334 ?auto_9332 ) ) ( not ( = ?auto_9340 ?auto_9337 ) ) ( not ( = ?auto_9340 ?auto_9335 ) ) ( not ( = ?auto_9340 ?auto_9336 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9331 ?auto_9333 ?auto_9332 ?auto_9334 ?auto_9330 )
      ( DELIVER-4PKG-VERIFY ?auto_9331 ?auto_9332 ?auto_9333 ?auto_9334 ?auto_9330 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9366 - OBJ
      ?auto_9367 - OBJ
      ?auto_9368 - OBJ
      ?auto_9369 - OBJ
      ?auto_9365 - LOCATION
    )
    :vars
    (
      ?auto_9375 - LOCATION
      ?auto_9373 - CITY
      ?auto_9372 - LOCATION
      ?auto_9370 - LOCATION
      ?auto_9371 - LOCATION
      ?auto_9374 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9375 ?auto_9373 ) ( IN-CITY ?auto_9365 ?auto_9373 ) ( not ( = ?auto_9365 ?auto_9375 ) ) ( OBJ-AT ?auto_9367 ?auto_9375 ) ( IN-CITY ?auto_9372 ?auto_9373 ) ( not ( = ?auto_9365 ?auto_9372 ) ) ( OBJ-AT ?auto_9368 ?auto_9372 ) ( IN-CITY ?auto_9370 ?auto_9373 ) ( not ( = ?auto_9365 ?auto_9370 ) ) ( OBJ-AT ?auto_9369 ?auto_9370 ) ( IN-CITY ?auto_9371 ?auto_9373 ) ( not ( = ?auto_9365 ?auto_9371 ) ) ( OBJ-AT ?auto_9366 ?auto_9371 ) ( TRUCK-AT ?auto_9374 ?auto_9365 ) ( not ( = ?auto_9366 ?auto_9369 ) ) ( not ( = ?auto_9370 ?auto_9371 ) ) ( not ( = ?auto_9366 ?auto_9368 ) ) ( not ( = ?auto_9369 ?auto_9368 ) ) ( not ( = ?auto_9372 ?auto_9370 ) ) ( not ( = ?auto_9372 ?auto_9371 ) ) ( not ( = ?auto_9366 ?auto_9367 ) ) ( not ( = ?auto_9369 ?auto_9367 ) ) ( not ( = ?auto_9368 ?auto_9367 ) ) ( not ( = ?auto_9375 ?auto_9372 ) ) ( not ( = ?auto_9375 ?auto_9370 ) ) ( not ( = ?auto_9375 ?auto_9371 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9366 ?auto_9369 ?auto_9367 ?auto_9368 ?auto_9365 )
      ( DELIVER-4PKG-VERIFY ?auto_9366 ?auto_9367 ?auto_9368 ?auto_9369 ?auto_9365 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9475 - OBJ
      ?auto_9476 - OBJ
      ?auto_9477 - OBJ
      ?auto_9478 - OBJ
      ?auto_9474 - LOCATION
    )
    :vars
    (
      ?auto_9484 - LOCATION
      ?auto_9482 - CITY
      ?auto_9481 - LOCATION
      ?auto_9479 - LOCATION
      ?auto_9480 - LOCATION
      ?auto_9483 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9484 ?auto_9482 ) ( IN-CITY ?auto_9474 ?auto_9482 ) ( not ( = ?auto_9474 ?auto_9484 ) ) ( OBJ-AT ?auto_9478 ?auto_9484 ) ( IN-CITY ?auto_9481 ?auto_9482 ) ( not ( = ?auto_9474 ?auto_9481 ) ) ( OBJ-AT ?auto_9477 ?auto_9481 ) ( IN-CITY ?auto_9479 ?auto_9482 ) ( not ( = ?auto_9474 ?auto_9479 ) ) ( OBJ-AT ?auto_9475 ?auto_9479 ) ( IN-CITY ?auto_9480 ?auto_9482 ) ( not ( = ?auto_9474 ?auto_9480 ) ) ( OBJ-AT ?auto_9476 ?auto_9480 ) ( TRUCK-AT ?auto_9483 ?auto_9474 ) ( not ( = ?auto_9476 ?auto_9475 ) ) ( not ( = ?auto_9479 ?auto_9480 ) ) ( not ( = ?auto_9476 ?auto_9477 ) ) ( not ( = ?auto_9475 ?auto_9477 ) ) ( not ( = ?auto_9481 ?auto_9479 ) ) ( not ( = ?auto_9481 ?auto_9480 ) ) ( not ( = ?auto_9476 ?auto_9478 ) ) ( not ( = ?auto_9475 ?auto_9478 ) ) ( not ( = ?auto_9477 ?auto_9478 ) ) ( not ( = ?auto_9484 ?auto_9481 ) ) ( not ( = ?auto_9484 ?auto_9479 ) ) ( not ( = ?auto_9484 ?auto_9480 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9476 ?auto_9475 ?auto_9478 ?auto_9477 ?auto_9474 )
      ( DELIVER-4PKG-VERIFY ?auto_9475 ?auto_9476 ?auto_9477 ?auto_9478 ?auto_9474 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9510 - OBJ
      ?auto_9511 - OBJ
      ?auto_9512 - OBJ
      ?auto_9513 - OBJ
      ?auto_9509 - LOCATION
    )
    :vars
    (
      ?auto_9519 - LOCATION
      ?auto_9517 - CITY
      ?auto_9516 - LOCATION
      ?auto_9514 - LOCATION
      ?auto_9515 - LOCATION
      ?auto_9518 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9519 ?auto_9517 ) ( IN-CITY ?auto_9509 ?auto_9517 ) ( not ( = ?auto_9509 ?auto_9519 ) ) ( OBJ-AT ?auto_9512 ?auto_9519 ) ( IN-CITY ?auto_9516 ?auto_9517 ) ( not ( = ?auto_9509 ?auto_9516 ) ) ( OBJ-AT ?auto_9513 ?auto_9516 ) ( IN-CITY ?auto_9514 ?auto_9517 ) ( not ( = ?auto_9509 ?auto_9514 ) ) ( OBJ-AT ?auto_9510 ?auto_9514 ) ( IN-CITY ?auto_9515 ?auto_9517 ) ( not ( = ?auto_9509 ?auto_9515 ) ) ( OBJ-AT ?auto_9511 ?auto_9515 ) ( TRUCK-AT ?auto_9518 ?auto_9509 ) ( not ( = ?auto_9511 ?auto_9510 ) ) ( not ( = ?auto_9514 ?auto_9515 ) ) ( not ( = ?auto_9511 ?auto_9513 ) ) ( not ( = ?auto_9510 ?auto_9513 ) ) ( not ( = ?auto_9516 ?auto_9514 ) ) ( not ( = ?auto_9516 ?auto_9515 ) ) ( not ( = ?auto_9511 ?auto_9512 ) ) ( not ( = ?auto_9510 ?auto_9512 ) ) ( not ( = ?auto_9513 ?auto_9512 ) ) ( not ( = ?auto_9519 ?auto_9516 ) ) ( not ( = ?auto_9519 ?auto_9514 ) ) ( not ( = ?auto_9519 ?auto_9515 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9511 ?auto_9510 ?auto_9512 ?auto_9513 ?auto_9509 )
      ( DELIVER-4PKG-VERIFY ?auto_9510 ?auto_9511 ?auto_9512 ?auto_9513 ?auto_9509 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9620 - OBJ
      ?auto_9621 - OBJ
      ?auto_9622 - OBJ
      ?auto_9623 - OBJ
      ?auto_9619 - LOCATION
    )
    :vars
    (
      ?auto_9629 - LOCATION
      ?auto_9627 - CITY
      ?auto_9626 - LOCATION
      ?auto_9624 - LOCATION
      ?auto_9625 - LOCATION
      ?auto_9628 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9629 ?auto_9627 ) ( IN-CITY ?auto_9619 ?auto_9627 ) ( not ( = ?auto_9619 ?auto_9629 ) ) ( OBJ-AT ?auto_9623 ?auto_9629 ) ( IN-CITY ?auto_9626 ?auto_9627 ) ( not ( = ?auto_9619 ?auto_9626 ) ) ( OBJ-AT ?auto_9621 ?auto_9626 ) ( IN-CITY ?auto_9624 ?auto_9627 ) ( not ( = ?auto_9619 ?auto_9624 ) ) ( OBJ-AT ?auto_9620 ?auto_9624 ) ( IN-CITY ?auto_9625 ?auto_9627 ) ( not ( = ?auto_9619 ?auto_9625 ) ) ( OBJ-AT ?auto_9622 ?auto_9625 ) ( TRUCK-AT ?auto_9628 ?auto_9619 ) ( not ( = ?auto_9622 ?auto_9620 ) ) ( not ( = ?auto_9624 ?auto_9625 ) ) ( not ( = ?auto_9622 ?auto_9621 ) ) ( not ( = ?auto_9620 ?auto_9621 ) ) ( not ( = ?auto_9626 ?auto_9624 ) ) ( not ( = ?auto_9626 ?auto_9625 ) ) ( not ( = ?auto_9622 ?auto_9623 ) ) ( not ( = ?auto_9620 ?auto_9623 ) ) ( not ( = ?auto_9621 ?auto_9623 ) ) ( not ( = ?auto_9629 ?auto_9626 ) ) ( not ( = ?auto_9629 ?auto_9624 ) ) ( not ( = ?auto_9629 ?auto_9625 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9622 ?auto_9620 ?auto_9623 ?auto_9621 ?auto_9619 )
      ( DELIVER-4PKG-VERIFY ?auto_9620 ?auto_9621 ?auto_9622 ?auto_9623 ?auto_9619 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9655 - OBJ
      ?auto_9656 - OBJ
      ?auto_9657 - OBJ
      ?auto_9658 - OBJ
      ?auto_9654 - LOCATION
    )
    :vars
    (
      ?auto_9664 - LOCATION
      ?auto_9662 - CITY
      ?auto_9661 - LOCATION
      ?auto_9659 - LOCATION
      ?auto_9660 - LOCATION
      ?auto_9663 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9664 ?auto_9662 ) ( IN-CITY ?auto_9654 ?auto_9662 ) ( not ( = ?auto_9654 ?auto_9664 ) ) ( OBJ-AT ?auto_9657 ?auto_9664 ) ( IN-CITY ?auto_9661 ?auto_9662 ) ( not ( = ?auto_9654 ?auto_9661 ) ) ( OBJ-AT ?auto_9656 ?auto_9661 ) ( IN-CITY ?auto_9659 ?auto_9662 ) ( not ( = ?auto_9654 ?auto_9659 ) ) ( OBJ-AT ?auto_9655 ?auto_9659 ) ( IN-CITY ?auto_9660 ?auto_9662 ) ( not ( = ?auto_9654 ?auto_9660 ) ) ( OBJ-AT ?auto_9658 ?auto_9660 ) ( TRUCK-AT ?auto_9663 ?auto_9654 ) ( not ( = ?auto_9658 ?auto_9655 ) ) ( not ( = ?auto_9659 ?auto_9660 ) ) ( not ( = ?auto_9658 ?auto_9656 ) ) ( not ( = ?auto_9655 ?auto_9656 ) ) ( not ( = ?auto_9661 ?auto_9659 ) ) ( not ( = ?auto_9661 ?auto_9660 ) ) ( not ( = ?auto_9658 ?auto_9657 ) ) ( not ( = ?auto_9655 ?auto_9657 ) ) ( not ( = ?auto_9656 ?auto_9657 ) ) ( not ( = ?auto_9664 ?auto_9661 ) ) ( not ( = ?auto_9664 ?auto_9659 ) ) ( not ( = ?auto_9664 ?auto_9660 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9658 ?auto_9655 ?auto_9657 ?auto_9656 ?auto_9654 )
      ( DELIVER-4PKG-VERIFY ?auto_9655 ?auto_9656 ?auto_9657 ?auto_9658 ?auto_9654 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9726 - OBJ
      ?auto_9727 - OBJ
      ?auto_9728 - OBJ
      ?auto_9729 - OBJ
      ?auto_9725 - LOCATION
    )
    :vars
    (
      ?auto_9735 - LOCATION
      ?auto_9733 - CITY
      ?auto_9732 - LOCATION
      ?auto_9730 - LOCATION
      ?auto_9731 - LOCATION
      ?auto_9734 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9735 ?auto_9733 ) ( IN-CITY ?auto_9725 ?auto_9733 ) ( not ( = ?auto_9725 ?auto_9735 ) ) ( OBJ-AT ?auto_9727 ?auto_9735 ) ( IN-CITY ?auto_9732 ?auto_9733 ) ( not ( = ?auto_9725 ?auto_9732 ) ) ( OBJ-AT ?auto_9729 ?auto_9732 ) ( IN-CITY ?auto_9730 ?auto_9733 ) ( not ( = ?auto_9725 ?auto_9730 ) ) ( OBJ-AT ?auto_9726 ?auto_9730 ) ( IN-CITY ?auto_9731 ?auto_9733 ) ( not ( = ?auto_9725 ?auto_9731 ) ) ( OBJ-AT ?auto_9728 ?auto_9731 ) ( TRUCK-AT ?auto_9734 ?auto_9725 ) ( not ( = ?auto_9728 ?auto_9726 ) ) ( not ( = ?auto_9730 ?auto_9731 ) ) ( not ( = ?auto_9728 ?auto_9729 ) ) ( not ( = ?auto_9726 ?auto_9729 ) ) ( not ( = ?auto_9732 ?auto_9730 ) ) ( not ( = ?auto_9732 ?auto_9731 ) ) ( not ( = ?auto_9728 ?auto_9727 ) ) ( not ( = ?auto_9726 ?auto_9727 ) ) ( not ( = ?auto_9729 ?auto_9727 ) ) ( not ( = ?auto_9735 ?auto_9732 ) ) ( not ( = ?auto_9735 ?auto_9730 ) ) ( not ( = ?auto_9735 ?auto_9731 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9728 ?auto_9726 ?auto_9727 ?auto_9729 ?auto_9725 )
      ( DELIVER-4PKG-VERIFY ?auto_9726 ?auto_9727 ?auto_9728 ?auto_9729 ?auto_9725 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9799 - OBJ
      ?auto_9800 - OBJ
      ?auto_9801 - OBJ
      ?auto_9802 - OBJ
      ?auto_9798 - LOCATION
    )
    :vars
    (
      ?auto_9808 - LOCATION
      ?auto_9806 - CITY
      ?auto_9805 - LOCATION
      ?auto_9803 - LOCATION
      ?auto_9804 - LOCATION
      ?auto_9807 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9808 ?auto_9806 ) ( IN-CITY ?auto_9798 ?auto_9806 ) ( not ( = ?auto_9798 ?auto_9808 ) ) ( OBJ-AT ?auto_9800 ?auto_9808 ) ( IN-CITY ?auto_9805 ?auto_9806 ) ( not ( = ?auto_9798 ?auto_9805 ) ) ( OBJ-AT ?auto_9801 ?auto_9805 ) ( IN-CITY ?auto_9803 ?auto_9806 ) ( not ( = ?auto_9798 ?auto_9803 ) ) ( OBJ-AT ?auto_9799 ?auto_9803 ) ( IN-CITY ?auto_9804 ?auto_9806 ) ( not ( = ?auto_9798 ?auto_9804 ) ) ( OBJ-AT ?auto_9802 ?auto_9804 ) ( TRUCK-AT ?auto_9807 ?auto_9798 ) ( not ( = ?auto_9802 ?auto_9799 ) ) ( not ( = ?auto_9803 ?auto_9804 ) ) ( not ( = ?auto_9802 ?auto_9801 ) ) ( not ( = ?auto_9799 ?auto_9801 ) ) ( not ( = ?auto_9805 ?auto_9803 ) ) ( not ( = ?auto_9805 ?auto_9804 ) ) ( not ( = ?auto_9802 ?auto_9800 ) ) ( not ( = ?auto_9799 ?auto_9800 ) ) ( not ( = ?auto_9801 ?auto_9800 ) ) ( not ( = ?auto_9808 ?auto_9805 ) ) ( not ( = ?auto_9808 ?auto_9803 ) ) ( not ( = ?auto_9808 ?auto_9804 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9802 ?auto_9799 ?auto_9800 ?auto_9801 ?auto_9798 )
      ( DELIVER-4PKG-VERIFY ?auto_9799 ?auto_9800 ?auto_9801 ?auto_9802 ?auto_9798 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9908 - OBJ
      ?auto_9909 - OBJ
      ?auto_9910 - OBJ
      ?auto_9911 - OBJ
      ?auto_9907 - LOCATION
    )
    :vars
    (
      ?auto_9917 - LOCATION
      ?auto_9915 - CITY
      ?auto_9914 - LOCATION
      ?auto_9912 - LOCATION
      ?auto_9913 - LOCATION
      ?auto_9916 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9917 ?auto_9915 ) ( IN-CITY ?auto_9907 ?auto_9915 ) ( not ( = ?auto_9907 ?auto_9917 ) ) ( OBJ-AT ?auto_9911 ?auto_9917 ) ( IN-CITY ?auto_9914 ?auto_9915 ) ( not ( = ?auto_9907 ?auto_9914 ) ) ( OBJ-AT ?auto_9908 ?auto_9914 ) ( IN-CITY ?auto_9912 ?auto_9915 ) ( not ( = ?auto_9907 ?auto_9912 ) ) ( OBJ-AT ?auto_9910 ?auto_9912 ) ( IN-CITY ?auto_9913 ?auto_9915 ) ( not ( = ?auto_9907 ?auto_9913 ) ) ( OBJ-AT ?auto_9909 ?auto_9913 ) ( TRUCK-AT ?auto_9916 ?auto_9907 ) ( not ( = ?auto_9909 ?auto_9910 ) ) ( not ( = ?auto_9912 ?auto_9913 ) ) ( not ( = ?auto_9909 ?auto_9908 ) ) ( not ( = ?auto_9910 ?auto_9908 ) ) ( not ( = ?auto_9914 ?auto_9912 ) ) ( not ( = ?auto_9914 ?auto_9913 ) ) ( not ( = ?auto_9909 ?auto_9911 ) ) ( not ( = ?auto_9910 ?auto_9911 ) ) ( not ( = ?auto_9908 ?auto_9911 ) ) ( not ( = ?auto_9917 ?auto_9914 ) ) ( not ( = ?auto_9917 ?auto_9912 ) ) ( not ( = ?auto_9917 ?auto_9913 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9909 ?auto_9910 ?auto_9911 ?auto_9908 ?auto_9907 )
      ( DELIVER-4PKG-VERIFY ?auto_9908 ?auto_9909 ?auto_9910 ?auto_9911 ?auto_9907 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9943 - OBJ
      ?auto_9944 - OBJ
      ?auto_9945 - OBJ
      ?auto_9946 - OBJ
      ?auto_9942 - LOCATION
    )
    :vars
    (
      ?auto_9952 - LOCATION
      ?auto_9950 - CITY
      ?auto_9949 - LOCATION
      ?auto_9947 - LOCATION
      ?auto_9948 - LOCATION
      ?auto_9951 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9952 ?auto_9950 ) ( IN-CITY ?auto_9942 ?auto_9950 ) ( not ( = ?auto_9942 ?auto_9952 ) ) ( OBJ-AT ?auto_9945 ?auto_9952 ) ( IN-CITY ?auto_9949 ?auto_9950 ) ( not ( = ?auto_9942 ?auto_9949 ) ) ( OBJ-AT ?auto_9943 ?auto_9949 ) ( IN-CITY ?auto_9947 ?auto_9950 ) ( not ( = ?auto_9942 ?auto_9947 ) ) ( OBJ-AT ?auto_9946 ?auto_9947 ) ( IN-CITY ?auto_9948 ?auto_9950 ) ( not ( = ?auto_9942 ?auto_9948 ) ) ( OBJ-AT ?auto_9944 ?auto_9948 ) ( TRUCK-AT ?auto_9951 ?auto_9942 ) ( not ( = ?auto_9944 ?auto_9946 ) ) ( not ( = ?auto_9947 ?auto_9948 ) ) ( not ( = ?auto_9944 ?auto_9943 ) ) ( not ( = ?auto_9946 ?auto_9943 ) ) ( not ( = ?auto_9949 ?auto_9947 ) ) ( not ( = ?auto_9949 ?auto_9948 ) ) ( not ( = ?auto_9944 ?auto_9945 ) ) ( not ( = ?auto_9946 ?auto_9945 ) ) ( not ( = ?auto_9943 ?auto_9945 ) ) ( not ( = ?auto_9952 ?auto_9949 ) ) ( not ( = ?auto_9952 ?auto_9947 ) ) ( not ( = ?auto_9952 ?auto_9948 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9944 ?auto_9946 ?auto_9945 ?auto_9943 ?auto_9942 )
      ( DELIVER-4PKG-VERIFY ?auto_9943 ?auto_9944 ?auto_9945 ?auto_9946 ?auto_9942 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9978 - OBJ
      ?auto_9979 - OBJ
      ?auto_9980 - OBJ
      ?auto_9981 - OBJ
      ?auto_9977 - LOCATION
    )
    :vars
    (
      ?auto_9987 - LOCATION
      ?auto_9985 - CITY
      ?auto_9984 - LOCATION
      ?auto_9982 - LOCATION
      ?auto_9983 - LOCATION
      ?auto_9986 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9987 ?auto_9985 ) ( IN-CITY ?auto_9977 ?auto_9985 ) ( not ( = ?auto_9977 ?auto_9987 ) ) ( OBJ-AT ?auto_9981 ?auto_9987 ) ( IN-CITY ?auto_9984 ?auto_9985 ) ( not ( = ?auto_9977 ?auto_9984 ) ) ( OBJ-AT ?auto_9978 ?auto_9984 ) ( IN-CITY ?auto_9982 ?auto_9985 ) ( not ( = ?auto_9977 ?auto_9982 ) ) ( OBJ-AT ?auto_9979 ?auto_9982 ) ( IN-CITY ?auto_9983 ?auto_9985 ) ( not ( = ?auto_9977 ?auto_9983 ) ) ( OBJ-AT ?auto_9980 ?auto_9983 ) ( TRUCK-AT ?auto_9986 ?auto_9977 ) ( not ( = ?auto_9980 ?auto_9979 ) ) ( not ( = ?auto_9982 ?auto_9983 ) ) ( not ( = ?auto_9980 ?auto_9978 ) ) ( not ( = ?auto_9979 ?auto_9978 ) ) ( not ( = ?auto_9984 ?auto_9982 ) ) ( not ( = ?auto_9984 ?auto_9983 ) ) ( not ( = ?auto_9980 ?auto_9981 ) ) ( not ( = ?auto_9979 ?auto_9981 ) ) ( not ( = ?auto_9978 ?auto_9981 ) ) ( not ( = ?auto_9987 ?auto_9984 ) ) ( not ( = ?auto_9987 ?auto_9982 ) ) ( not ( = ?auto_9987 ?auto_9983 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9980 ?auto_9979 ?auto_9981 ?auto_9978 ?auto_9977 )
      ( DELIVER-4PKG-VERIFY ?auto_9978 ?auto_9979 ?auto_9980 ?auto_9981 ?auto_9977 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10013 - OBJ
      ?auto_10014 - OBJ
      ?auto_10015 - OBJ
      ?auto_10016 - OBJ
      ?auto_10012 - LOCATION
    )
    :vars
    (
      ?auto_10022 - LOCATION
      ?auto_10020 - CITY
      ?auto_10019 - LOCATION
      ?auto_10017 - LOCATION
      ?auto_10018 - LOCATION
      ?auto_10021 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10022 ?auto_10020 ) ( IN-CITY ?auto_10012 ?auto_10020 ) ( not ( = ?auto_10012 ?auto_10022 ) ) ( OBJ-AT ?auto_10015 ?auto_10022 ) ( IN-CITY ?auto_10019 ?auto_10020 ) ( not ( = ?auto_10012 ?auto_10019 ) ) ( OBJ-AT ?auto_10013 ?auto_10019 ) ( IN-CITY ?auto_10017 ?auto_10020 ) ( not ( = ?auto_10012 ?auto_10017 ) ) ( OBJ-AT ?auto_10014 ?auto_10017 ) ( IN-CITY ?auto_10018 ?auto_10020 ) ( not ( = ?auto_10012 ?auto_10018 ) ) ( OBJ-AT ?auto_10016 ?auto_10018 ) ( TRUCK-AT ?auto_10021 ?auto_10012 ) ( not ( = ?auto_10016 ?auto_10014 ) ) ( not ( = ?auto_10017 ?auto_10018 ) ) ( not ( = ?auto_10016 ?auto_10013 ) ) ( not ( = ?auto_10014 ?auto_10013 ) ) ( not ( = ?auto_10019 ?auto_10017 ) ) ( not ( = ?auto_10019 ?auto_10018 ) ) ( not ( = ?auto_10016 ?auto_10015 ) ) ( not ( = ?auto_10014 ?auto_10015 ) ) ( not ( = ?auto_10013 ?auto_10015 ) ) ( not ( = ?auto_10022 ?auto_10019 ) ) ( not ( = ?auto_10022 ?auto_10017 ) ) ( not ( = ?auto_10022 ?auto_10018 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10016 ?auto_10014 ?auto_10015 ?auto_10013 ?auto_10012 )
      ( DELIVER-4PKG-VERIFY ?auto_10013 ?auto_10014 ?auto_10015 ?auto_10016 ?auto_10012 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10159 - OBJ
      ?auto_10160 - OBJ
      ?auto_10161 - OBJ
      ?auto_10162 - OBJ
      ?auto_10158 - LOCATION
    )
    :vars
    (
      ?auto_10168 - LOCATION
      ?auto_10166 - CITY
      ?auto_10165 - LOCATION
      ?auto_10163 - LOCATION
      ?auto_10164 - LOCATION
      ?auto_10167 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10168 ?auto_10166 ) ( IN-CITY ?auto_10158 ?auto_10166 ) ( not ( = ?auto_10158 ?auto_10168 ) ) ( OBJ-AT ?auto_10160 ?auto_10168 ) ( IN-CITY ?auto_10165 ?auto_10166 ) ( not ( = ?auto_10158 ?auto_10165 ) ) ( OBJ-AT ?auto_10159 ?auto_10165 ) ( IN-CITY ?auto_10163 ?auto_10166 ) ( not ( = ?auto_10158 ?auto_10163 ) ) ( OBJ-AT ?auto_10162 ?auto_10163 ) ( IN-CITY ?auto_10164 ?auto_10166 ) ( not ( = ?auto_10158 ?auto_10164 ) ) ( OBJ-AT ?auto_10161 ?auto_10164 ) ( TRUCK-AT ?auto_10167 ?auto_10158 ) ( not ( = ?auto_10161 ?auto_10162 ) ) ( not ( = ?auto_10163 ?auto_10164 ) ) ( not ( = ?auto_10161 ?auto_10159 ) ) ( not ( = ?auto_10162 ?auto_10159 ) ) ( not ( = ?auto_10165 ?auto_10163 ) ) ( not ( = ?auto_10165 ?auto_10164 ) ) ( not ( = ?auto_10161 ?auto_10160 ) ) ( not ( = ?auto_10162 ?auto_10160 ) ) ( not ( = ?auto_10159 ?auto_10160 ) ) ( not ( = ?auto_10168 ?auto_10165 ) ) ( not ( = ?auto_10168 ?auto_10163 ) ) ( not ( = ?auto_10168 ?auto_10164 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10161 ?auto_10162 ?auto_10160 ?auto_10159 ?auto_10158 )
      ( DELIVER-4PKG-VERIFY ?auto_10159 ?auto_10160 ?auto_10161 ?auto_10162 ?auto_10158 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10194 - OBJ
      ?auto_10195 - OBJ
      ?auto_10196 - OBJ
      ?auto_10197 - OBJ
      ?auto_10193 - LOCATION
    )
    :vars
    (
      ?auto_10203 - LOCATION
      ?auto_10201 - CITY
      ?auto_10200 - LOCATION
      ?auto_10198 - LOCATION
      ?auto_10199 - LOCATION
      ?auto_10202 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10203 ?auto_10201 ) ( IN-CITY ?auto_10193 ?auto_10201 ) ( not ( = ?auto_10193 ?auto_10203 ) ) ( OBJ-AT ?auto_10195 ?auto_10203 ) ( IN-CITY ?auto_10200 ?auto_10201 ) ( not ( = ?auto_10193 ?auto_10200 ) ) ( OBJ-AT ?auto_10194 ?auto_10200 ) ( IN-CITY ?auto_10198 ?auto_10201 ) ( not ( = ?auto_10193 ?auto_10198 ) ) ( OBJ-AT ?auto_10196 ?auto_10198 ) ( IN-CITY ?auto_10199 ?auto_10201 ) ( not ( = ?auto_10193 ?auto_10199 ) ) ( OBJ-AT ?auto_10197 ?auto_10199 ) ( TRUCK-AT ?auto_10202 ?auto_10193 ) ( not ( = ?auto_10197 ?auto_10196 ) ) ( not ( = ?auto_10198 ?auto_10199 ) ) ( not ( = ?auto_10197 ?auto_10194 ) ) ( not ( = ?auto_10196 ?auto_10194 ) ) ( not ( = ?auto_10200 ?auto_10198 ) ) ( not ( = ?auto_10200 ?auto_10199 ) ) ( not ( = ?auto_10197 ?auto_10195 ) ) ( not ( = ?auto_10196 ?auto_10195 ) ) ( not ( = ?auto_10194 ?auto_10195 ) ) ( not ( = ?auto_10203 ?auto_10200 ) ) ( not ( = ?auto_10203 ?auto_10198 ) ) ( not ( = ?auto_10203 ?auto_10199 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10197 ?auto_10196 ?auto_10195 ?auto_10194 ?auto_10193 )
      ( DELIVER-4PKG-VERIFY ?auto_10194 ?auto_10195 ?auto_10196 ?auto_10197 ?auto_10193 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10415 - OBJ
      ?auto_10416 - OBJ
      ?auto_10417 - OBJ
      ?auto_10418 - OBJ
      ?auto_10414 - LOCATION
    )
    :vars
    (
      ?auto_10424 - LOCATION
      ?auto_10422 - CITY
      ?auto_10421 - LOCATION
      ?auto_10419 - LOCATION
      ?auto_10420 - LOCATION
      ?auto_10423 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10424 ?auto_10422 ) ( IN-CITY ?auto_10414 ?auto_10422 ) ( not ( = ?auto_10414 ?auto_10424 ) ) ( OBJ-AT ?auto_10415 ?auto_10424 ) ( IN-CITY ?auto_10421 ?auto_10422 ) ( not ( = ?auto_10414 ?auto_10421 ) ) ( OBJ-AT ?auto_10418 ?auto_10421 ) ( IN-CITY ?auto_10419 ?auto_10422 ) ( not ( = ?auto_10414 ?auto_10419 ) ) ( OBJ-AT ?auto_10417 ?auto_10419 ) ( IN-CITY ?auto_10420 ?auto_10422 ) ( not ( = ?auto_10414 ?auto_10420 ) ) ( OBJ-AT ?auto_10416 ?auto_10420 ) ( TRUCK-AT ?auto_10423 ?auto_10414 ) ( not ( = ?auto_10416 ?auto_10417 ) ) ( not ( = ?auto_10419 ?auto_10420 ) ) ( not ( = ?auto_10416 ?auto_10418 ) ) ( not ( = ?auto_10417 ?auto_10418 ) ) ( not ( = ?auto_10421 ?auto_10419 ) ) ( not ( = ?auto_10421 ?auto_10420 ) ) ( not ( = ?auto_10416 ?auto_10415 ) ) ( not ( = ?auto_10417 ?auto_10415 ) ) ( not ( = ?auto_10418 ?auto_10415 ) ) ( not ( = ?auto_10424 ?auto_10421 ) ) ( not ( = ?auto_10424 ?auto_10419 ) ) ( not ( = ?auto_10424 ?auto_10420 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10416 ?auto_10417 ?auto_10415 ?auto_10418 ?auto_10414 )
      ( DELIVER-4PKG-VERIFY ?auto_10415 ?auto_10416 ?auto_10417 ?auto_10418 ?auto_10414 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10450 - OBJ
      ?auto_10451 - OBJ
      ?auto_10452 - OBJ
      ?auto_10453 - OBJ
      ?auto_10449 - LOCATION
    )
    :vars
    (
      ?auto_10459 - LOCATION
      ?auto_10457 - CITY
      ?auto_10456 - LOCATION
      ?auto_10454 - LOCATION
      ?auto_10455 - LOCATION
      ?auto_10458 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10459 ?auto_10457 ) ( IN-CITY ?auto_10449 ?auto_10457 ) ( not ( = ?auto_10449 ?auto_10459 ) ) ( OBJ-AT ?auto_10450 ?auto_10459 ) ( IN-CITY ?auto_10456 ?auto_10457 ) ( not ( = ?auto_10449 ?auto_10456 ) ) ( OBJ-AT ?auto_10452 ?auto_10456 ) ( IN-CITY ?auto_10454 ?auto_10457 ) ( not ( = ?auto_10449 ?auto_10454 ) ) ( OBJ-AT ?auto_10453 ?auto_10454 ) ( IN-CITY ?auto_10455 ?auto_10457 ) ( not ( = ?auto_10449 ?auto_10455 ) ) ( OBJ-AT ?auto_10451 ?auto_10455 ) ( TRUCK-AT ?auto_10458 ?auto_10449 ) ( not ( = ?auto_10451 ?auto_10453 ) ) ( not ( = ?auto_10454 ?auto_10455 ) ) ( not ( = ?auto_10451 ?auto_10452 ) ) ( not ( = ?auto_10453 ?auto_10452 ) ) ( not ( = ?auto_10456 ?auto_10454 ) ) ( not ( = ?auto_10456 ?auto_10455 ) ) ( not ( = ?auto_10451 ?auto_10450 ) ) ( not ( = ?auto_10453 ?auto_10450 ) ) ( not ( = ?auto_10452 ?auto_10450 ) ) ( not ( = ?auto_10459 ?auto_10456 ) ) ( not ( = ?auto_10459 ?auto_10454 ) ) ( not ( = ?auto_10459 ?auto_10455 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10451 ?auto_10453 ?auto_10450 ?auto_10452 ?auto_10449 )
      ( DELIVER-4PKG-VERIFY ?auto_10450 ?auto_10451 ?auto_10452 ?auto_10453 ?auto_10449 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10559 - OBJ
      ?auto_10560 - OBJ
      ?auto_10561 - OBJ
      ?auto_10562 - OBJ
      ?auto_10558 - LOCATION
    )
    :vars
    (
      ?auto_10568 - LOCATION
      ?auto_10566 - CITY
      ?auto_10565 - LOCATION
      ?auto_10563 - LOCATION
      ?auto_10564 - LOCATION
      ?auto_10567 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10568 ?auto_10566 ) ( IN-CITY ?auto_10558 ?auto_10566 ) ( not ( = ?auto_10558 ?auto_10568 ) ) ( OBJ-AT ?auto_10559 ?auto_10568 ) ( IN-CITY ?auto_10565 ?auto_10566 ) ( not ( = ?auto_10558 ?auto_10565 ) ) ( OBJ-AT ?auto_10562 ?auto_10565 ) ( IN-CITY ?auto_10563 ?auto_10566 ) ( not ( = ?auto_10558 ?auto_10563 ) ) ( OBJ-AT ?auto_10560 ?auto_10563 ) ( IN-CITY ?auto_10564 ?auto_10566 ) ( not ( = ?auto_10558 ?auto_10564 ) ) ( OBJ-AT ?auto_10561 ?auto_10564 ) ( TRUCK-AT ?auto_10567 ?auto_10558 ) ( not ( = ?auto_10561 ?auto_10560 ) ) ( not ( = ?auto_10563 ?auto_10564 ) ) ( not ( = ?auto_10561 ?auto_10562 ) ) ( not ( = ?auto_10560 ?auto_10562 ) ) ( not ( = ?auto_10565 ?auto_10563 ) ) ( not ( = ?auto_10565 ?auto_10564 ) ) ( not ( = ?auto_10561 ?auto_10559 ) ) ( not ( = ?auto_10560 ?auto_10559 ) ) ( not ( = ?auto_10562 ?auto_10559 ) ) ( not ( = ?auto_10568 ?auto_10565 ) ) ( not ( = ?auto_10568 ?auto_10563 ) ) ( not ( = ?auto_10568 ?auto_10564 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10561 ?auto_10560 ?auto_10559 ?auto_10562 ?auto_10558 )
      ( DELIVER-4PKG-VERIFY ?auto_10559 ?auto_10560 ?auto_10561 ?auto_10562 ?auto_10558 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10632 - OBJ
      ?auto_10633 - OBJ
      ?auto_10634 - OBJ
      ?auto_10635 - OBJ
      ?auto_10631 - LOCATION
    )
    :vars
    (
      ?auto_10641 - LOCATION
      ?auto_10639 - CITY
      ?auto_10638 - LOCATION
      ?auto_10636 - LOCATION
      ?auto_10637 - LOCATION
      ?auto_10640 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10641 ?auto_10639 ) ( IN-CITY ?auto_10631 ?auto_10639 ) ( not ( = ?auto_10631 ?auto_10641 ) ) ( OBJ-AT ?auto_10632 ?auto_10641 ) ( IN-CITY ?auto_10638 ?auto_10639 ) ( not ( = ?auto_10631 ?auto_10638 ) ) ( OBJ-AT ?auto_10634 ?auto_10638 ) ( IN-CITY ?auto_10636 ?auto_10639 ) ( not ( = ?auto_10631 ?auto_10636 ) ) ( OBJ-AT ?auto_10633 ?auto_10636 ) ( IN-CITY ?auto_10637 ?auto_10639 ) ( not ( = ?auto_10631 ?auto_10637 ) ) ( OBJ-AT ?auto_10635 ?auto_10637 ) ( TRUCK-AT ?auto_10640 ?auto_10631 ) ( not ( = ?auto_10635 ?auto_10633 ) ) ( not ( = ?auto_10636 ?auto_10637 ) ) ( not ( = ?auto_10635 ?auto_10634 ) ) ( not ( = ?auto_10633 ?auto_10634 ) ) ( not ( = ?auto_10638 ?auto_10636 ) ) ( not ( = ?auto_10638 ?auto_10637 ) ) ( not ( = ?auto_10635 ?auto_10632 ) ) ( not ( = ?auto_10633 ?auto_10632 ) ) ( not ( = ?auto_10634 ?auto_10632 ) ) ( not ( = ?auto_10641 ?auto_10638 ) ) ( not ( = ?auto_10641 ?auto_10636 ) ) ( not ( = ?auto_10641 ?auto_10637 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10635 ?auto_10633 ?auto_10632 ?auto_10634 ?auto_10631 )
      ( DELIVER-4PKG-VERIFY ?auto_10632 ?auto_10633 ?auto_10634 ?auto_10635 ?auto_10631 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10741 - OBJ
      ?auto_10742 - OBJ
      ?auto_10743 - OBJ
      ?auto_10744 - OBJ
      ?auto_10740 - LOCATION
    )
    :vars
    (
      ?auto_10750 - LOCATION
      ?auto_10748 - CITY
      ?auto_10747 - LOCATION
      ?auto_10745 - LOCATION
      ?auto_10746 - LOCATION
      ?auto_10749 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10750 ?auto_10748 ) ( IN-CITY ?auto_10740 ?auto_10748 ) ( not ( = ?auto_10740 ?auto_10750 ) ) ( OBJ-AT ?auto_10741 ?auto_10750 ) ( IN-CITY ?auto_10747 ?auto_10748 ) ( not ( = ?auto_10740 ?auto_10747 ) ) ( OBJ-AT ?auto_10742 ?auto_10747 ) ( IN-CITY ?auto_10745 ?auto_10748 ) ( not ( = ?auto_10740 ?auto_10745 ) ) ( OBJ-AT ?auto_10744 ?auto_10745 ) ( IN-CITY ?auto_10746 ?auto_10748 ) ( not ( = ?auto_10740 ?auto_10746 ) ) ( OBJ-AT ?auto_10743 ?auto_10746 ) ( TRUCK-AT ?auto_10749 ?auto_10740 ) ( not ( = ?auto_10743 ?auto_10744 ) ) ( not ( = ?auto_10745 ?auto_10746 ) ) ( not ( = ?auto_10743 ?auto_10742 ) ) ( not ( = ?auto_10744 ?auto_10742 ) ) ( not ( = ?auto_10747 ?auto_10745 ) ) ( not ( = ?auto_10747 ?auto_10746 ) ) ( not ( = ?auto_10743 ?auto_10741 ) ) ( not ( = ?auto_10744 ?auto_10741 ) ) ( not ( = ?auto_10742 ?auto_10741 ) ) ( not ( = ?auto_10750 ?auto_10747 ) ) ( not ( = ?auto_10750 ?auto_10745 ) ) ( not ( = ?auto_10750 ?auto_10746 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10743 ?auto_10744 ?auto_10741 ?auto_10742 ?auto_10740 )
      ( DELIVER-4PKG-VERIFY ?auto_10741 ?auto_10742 ?auto_10743 ?auto_10744 ?auto_10740 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10776 - OBJ
      ?auto_10777 - OBJ
      ?auto_10778 - OBJ
      ?auto_10779 - OBJ
      ?auto_10775 - LOCATION
    )
    :vars
    (
      ?auto_10785 - LOCATION
      ?auto_10783 - CITY
      ?auto_10782 - LOCATION
      ?auto_10780 - LOCATION
      ?auto_10781 - LOCATION
      ?auto_10784 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10785 ?auto_10783 ) ( IN-CITY ?auto_10775 ?auto_10783 ) ( not ( = ?auto_10775 ?auto_10785 ) ) ( OBJ-AT ?auto_10776 ?auto_10785 ) ( IN-CITY ?auto_10782 ?auto_10783 ) ( not ( = ?auto_10775 ?auto_10782 ) ) ( OBJ-AT ?auto_10777 ?auto_10782 ) ( IN-CITY ?auto_10780 ?auto_10783 ) ( not ( = ?auto_10775 ?auto_10780 ) ) ( OBJ-AT ?auto_10778 ?auto_10780 ) ( IN-CITY ?auto_10781 ?auto_10783 ) ( not ( = ?auto_10775 ?auto_10781 ) ) ( OBJ-AT ?auto_10779 ?auto_10781 ) ( TRUCK-AT ?auto_10784 ?auto_10775 ) ( not ( = ?auto_10779 ?auto_10778 ) ) ( not ( = ?auto_10780 ?auto_10781 ) ) ( not ( = ?auto_10779 ?auto_10777 ) ) ( not ( = ?auto_10778 ?auto_10777 ) ) ( not ( = ?auto_10782 ?auto_10780 ) ) ( not ( = ?auto_10782 ?auto_10781 ) ) ( not ( = ?auto_10779 ?auto_10776 ) ) ( not ( = ?auto_10778 ?auto_10776 ) ) ( not ( = ?auto_10777 ?auto_10776 ) ) ( not ( = ?auto_10785 ?auto_10782 ) ) ( not ( = ?auto_10785 ?auto_10780 ) ) ( not ( = ?auto_10785 ?auto_10781 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10779 ?auto_10778 ?auto_10776 ?auto_10777 ?auto_10775 )
      ( DELIVER-4PKG-VERIFY ?auto_10776 ?auto_10777 ?auto_10778 ?auto_10779 ?auto_10775 ) )
  )

)

