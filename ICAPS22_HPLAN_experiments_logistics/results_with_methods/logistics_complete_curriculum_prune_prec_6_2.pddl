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

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11895 - OBJ
      ?auto_11896 - LOCATION
    )
    :vars
    (
      ?auto_11897 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11897 ?auto_11896 ) ( IN-TRUCK ?auto_11895 ?auto_11897 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_11895 ?auto_11897 ?auto_11896 )
      ( DELIVER-1PKG-VERIFY ?auto_11895 ?auto_11896 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11900 - OBJ
      ?auto_11901 - LOCATION
    )
    :vars
    (
      ?auto_11902 - TRUCK
      ?auto_11903 - LOCATION
      ?auto_11904 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11900 ?auto_11902 ) ( TRUCK-AT ?auto_11902 ?auto_11903 ) ( IN-CITY ?auto_11903 ?auto_11904 ) ( IN-CITY ?auto_11901 ?auto_11904 ) ( not ( = ?auto_11901 ?auto_11903 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11902 ?auto_11903 ?auto_11901 ?auto_11904 )
      ( DELIVER-1PKG ?auto_11900 ?auto_11901 )
      ( DELIVER-1PKG-VERIFY ?auto_11900 ?auto_11901 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11907 - OBJ
      ?auto_11908 - LOCATION
    )
    :vars
    (
      ?auto_11909 - TRUCK
      ?auto_11911 - LOCATION
      ?auto_11910 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11909 ?auto_11911 ) ( IN-CITY ?auto_11911 ?auto_11910 ) ( IN-CITY ?auto_11908 ?auto_11910 ) ( not ( = ?auto_11908 ?auto_11911 ) ) ( OBJ-AT ?auto_11907 ?auto_11911 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11907 ?auto_11909 ?auto_11911 )
      ( DELIVER-1PKG ?auto_11907 ?auto_11908 )
      ( DELIVER-1PKG-VERIFY ?auto_11907 ?auto_11908 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11914 - OBJ
      ?auto_11915 - LOCATION
    )
    :vars
    (
      ?auto_11918 - LOCATION
      ?auto_11917 - CITY
      ?auto_11916 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11918 ?auto_11917 ) ( IN-CITY ?auto_11915 ?auto_11917 ) ( not ( = ?auto_11915 ?auto_11918 ) ) ( OBJ-AT ?auto_11914 ?auto_11918 ) ( TRUCK-AT ?auto_11916 ?auto_11915 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11916 ?auto_11915 ?auto_11918 ?auto_11917 )
      ( DELIVER-1PKG ?auto_11914 ?auto_11915 )
      ( DELIVER-1PKG-VERIFY ?auto_11914 ?auto_11915 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11948 - OBJ
      ?auto_11950 - OBJ
      ?auto_11949 - LOCATION
    )
    :vars
    (
      ?auto_11951 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11950 ?auto_11948 ) ( TRUCK-AT ?auto_11951 ?auto_11949 ) ( IN-TRUCK ?auto_11950 ?auto_11951 ) ( OBJ-AT ?auto_11948 ?auto_11949 ) ( not ( = ?auto_11948 ?auto_11950 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11950 ?auto_11949 )
      ( DELIVER-2PKG-VERIFY ?auto_11948 ?auto_11950 ?auto_11949 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11955 - OBJ
      ?auto_11957 - OBJ
      ?auto_11956 - LOCATION
    )
    :vars
    (
      ?auto_11960 - TRUCK
      ?auto_11959 - LOCATION
      ?auto_11958 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11957 ?auto_11955 ) ( IN-TRUCK ?auto_11957 ?auto_11960 ) ( TRUCK-AT ?auto_11960 ?auto_11959 ) ( IN-CITY ?auto_11959 ?auto_11958 ) ( IN-CITY ?auto_11956 ?auto_11958 ) ( not ( = ?auto_11956 ?auto_11959 ) ) ( OBJ-AT ?auto_11955 ?auto_11956 ) ( not ( = ?auto_11955 ?auto_11957 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11957 ?auto_11956 )
      ( DELIVER-2PKG-VERIFY ?auto_11955 ?auto_11957 ?auto_11956 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11964 - OBJ
      ?auto_11966 - OBJ
      ?auto_11965 - LOCATION
    )
    :vars
    (
      ?auto_11967 - TRUCK
      ?auto_11969 - LOCATION
      ?auto_11968 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11966 ?auto_11964 ) ( TRUCK-AT ?auto_11967 ?auto_11969 ) ( IN-CITY ?auto_11969 ?auto_11968 ) ( IN-CITY ?auto_11965 ?auto_11968 ) ( not ( = ?auto_11965 ?auto_11969 ) ) ( OBJ-AT ?auto_11966 ?auto_11969 ) ( OBJ-AT ?auto_11964 ?auto_11965 ) ( not ( = ?auto_11964 ?auto_11966 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11966 ?auto_11965 )
      ( DELIVER-2PKG-VERIFY ?auto_11964 ?auto_11966 ?auto_11965 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11973 - OBJ
      ?auto_11975 - OBJ
      ?auto_11974 - LOCATION
    )
    :vars
    (
      ?auto_11978 - LOCATION
      ?auto_11977 - CITY
      ?auto_11976 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11975 ?auto_11973 ) ( IN-CITY ?auto_11978 ?auto_11977 ) ( IN-CITY ?auto_11974 ?auto_11977 ) ( not ( = ?auto_11974 ?auto_11978 ) ) ( OBJ-AT ?auto_11975 ?auto_11978 ) ( TRUCK-AT ?auto_11976 ?auto_11974 ) ( OBJ-AT ?auto_11973 ?auto_11974 ) ( not ( = ?auto_11973 ?auto_11975 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11975 ?auto_11974 )
      ( DELIVER-2PKG-VERIFY ?auto_11973 ?auto_11975 ?auto_11974 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11982 - OBJ
      ?auto_11984 - OBJ
      ?auto_11983 - LOCATION
    )
    :vars
    (
      ?auto_11985 - LOCATION
      ?auto_11986 - CITY
      ?auto_11987 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11984 ?auto_11982 ) ( IN-CITY ?auto_11985 ?auto_11986 ) ( IN-CITY ?auto_11983 ?auto_11986 ) ( not ( = ?auto_11983 ?auto_11985 ) ) ( OBJ-AT ?auto_11984 ?auto_11985 ) ( TRUCK-AT ?auto_11987 ?auto_11983 ) ( not ( = ?auto_11982 ?auto_11984 ) ) ( IN-TRUCK ?auto_11982 ?auto_11987 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11982 ?auto_11983 )
      ( DELIVER-2PKG ?auto_11982 ?auto_11984 ?auto_11983 )
      ( DELIVER-2PKG-VERIFY ?auto_11982 ?auto_11984 ?auto_11983 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11991 - OBJ
      ?auto_11993 - OBJ
      ?auto_11992 - LOCATION
    )
    :vars
    (
      ?auto_11995 - LOCATION
      ?auto_11996 - CITY
      ?auto_11994 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11993 ?auto_11991 ) ( IN-CITY ?auto_11995 ?auto_11996 ) ( IN-CITY ?auto_11992 ?auto_11996 ) ( not ( = ?auto_11992 ?auto_11995 ) ) ( OBJ-AT ?auto_11993 ?auto_11995 ) ( not ( = ?auto_11991 ?auto_11993 ) ) ( IN-TRUCK ?auto_11991 ?auto_11994 ) ( TRUCK-AT ?auto_11994 ?auto_11995 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11994 ?auto_11995 ?auto_11992 ?auto_11996 )
      ( DELIVER-2PKG ?auto_11991 ?auto_11993 ?auto_11992 )
      ( DELIVER-2PKG-VERIFY ?auto_11991 ?auto_11993 ?auto_11992 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12000 - OBJ
      ?auto_12002 - OBJ
      ?auto_12001 - LOCATION
    )
    :vars
    (
      ?auto_12005 - LOCATION
      ?auto_12004 - CITY
      ?auto_12003 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12002 ?auto_12000 ) ( IN-CITY ?auto_12005 ?auto_12004 ) ( IN-CITY ?auto_12001 ?auto_12004 ) ( not ( = ?auto_12001 ?auto_12005 ) ) ( OBJ-AT ?auto_12002 ?auto_12005 ) ( not ( = ?auto_12000 ?auto_12002 ) ) ( TRUCK-AT ?auto_12003 ?auto_12005 ) ( OBJ-AT ?auto_12000 ?auto_12005 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12000 ?auto_12003 ?auto_12005 )
      ( DELIVER-2PKG ?auto_12000 ?auto_12002 ?auto_12001 )
      ( DELIVER-2PKG-VERIFY ?auto_12000 ?auto_12002 ?auto_12001 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12009 - OBJ
      ?auto_12011 - OBJ
      ?auto_12010 - LOCATION
    )
    :vars
    (
      ?auto_12014 - LOCATION
      ?auto_12013 - CITY
      ?auto_12012 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12011 ?auto_12009 ) ( IN-CITY ?auto_12014 ?auto_12013 ) ( IN-CITY ?auto_12010 ?auto_12013 ) ( not ( = ?auto_12010 ?auto_12014 ) ) ( OBJ-AT ?auto_12011 ?auto_12014 ) ( not ( = ?auto_12009 ?auto_12011 ) ) ( OBJ-AT ?auto_12009 ?auto_12014 ) ( TRUCK-AT ?auto_12012 ?auto_12010 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12012 ?auto_12010 ?auto_12014 ?auto_12013 )
      ( DELIVER-2PKG ?auto_12009 ?auto_12011 ?auto_12010 )
      ( DELIVER-2PKG-VERIFY ?auto_12009 ?auto_12011 ?auto_12010 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12045 - OBJ
      ?auto_12047 - OBJ
      ?auto_12048 - OBJ
      ?auto_12046 - LOCATION
    )
    :vars
    (
      ?auto_12049 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12047 ?auto_12045 ) ( GREATER-THAN ?auto_12048 ?auto_12045 ) ( GREATER-THAN ?auto_12048 ?auto_12047 ) ( TRUCK-AT ?auto_12049 ?auto_12046 ) ( IN-TRUCK ?auto_12048 ?auto_12049 ) ( OBJ-AT ?auto_12045 ?auto_12046 ) ( OBJ-AT ?auto_12047 ?auto_12046 ) ( not ( = ?auto_12045 ?auto_12047 ) ) ( not ( = ?auto_12045 ?auto_12048 ) ) ( not ( = ?auto_12047 ?auto_12048 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12048 ?auto_12046 )
      ( DELIVER-3PKG-VERIFY ?auto_12045 ?auto_12047 ?auto_12048 ?auto_12046 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12054 - OBJ
      ?auto_12056 - OBJ
      ?auto_12057 - OBJ
      ?auto_12055 - LOCATION
    )
    :vars
    (
      ?auto_12060 - TRUCK
      ?auto_12059 - LOCATION
      ?auto_12058 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12056 ?auto_12054 ) ( GREATER-THAN ?auto_12057 ?auto_12054 ) ( GREATER-THAN ?auto_12057 ?auto_12056 ) ( IN-TRUCK ?auto_12057 ?auto_12060 ) ( TRUCK-AT ?auto_12060 ?auto_12059 ) ( IN-CITY ?auto_12059 ?auto_12058 ) ( IN-CITY ?auto_12055 ?auto_12058 ) ( not ( = ?auto_12055 ?auto_12059 ) ) ( OBJ-AT ?auto_12054 ?auto_12055 ) ( OBJ-AT ?auto_12056 ?auto_12055 ) ( not ( = ?auto_12054 ?auto_12056 ) ) ( not ( = ?auto_12054 ?auto_12057 ) ) ( not ( = ?auto_12056 ?auto_12057 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12057 ?auto_12055 )
      ( DELIVER-3PKG-VERIFY ?auto_12054 ?auto_12056 ?auto_12057 ?auto_12055 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12065 - OBJ
      ?auto_12067 - OBJ
      ?auto_12068 - OBJ
      ?auto_12066 - LOCATION
    )
    :vars
    (
      ?auto_12069 - TRUCK
      ?auto_12070 - LOCATION
      ?auto_12071 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12067 ?auto_12065 ) ( GREATER-THAN ?auto_12068 ?auto_12065 ) ( GREATER-THAN ?auto_12068 ?auto_12067 ) ( TRUCK-AT ?auto_12069 ?auto_12070 ) ( IN-CITY ?auto_12070 ?auto_12071 ) ( IN-CITY ?auto_12066 ?auto_12071 ) ( not ( = ?auto_12066 ?auto_12070 ) ) ( OBJ-AT ?auto_12068 ?auto_12070 ) ( OBJ-AT ?auto_12065 ?auto_12066 ) ( OBJ-AT ?auto_12067 ?auto_12066 ) ( not ( = ?auto_12065 ?auto_12067 ) ) ( not ( = ?auto_12065 ?auto_12068 ) ) ( not ( = ?auto_12067 ?auto_12068 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12068 ?auto_12066 )
      ( DELIVER-3PKG-VERIFY ?auto_12065 ?auto_12067 ?auto_12068 ?auto_12066 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12076 - OBJ
      ?auto_12078 - OBJ
      ?auto_12079 - OBJ
      ?auto_12077 - LOCATION
    )
    :vars
    (
      ?auto_12082 - LOCATION
      ?auto_12080 - CITY
      ?auto_12081 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12078 ?auto_12076 ) ( GREATER-THAN ?auto_12079 ?auto_12076 ) ( GREATER-THAN ?auto_12079 ?auto_12078 ) ( IN-CITY ?auto_12082 ?auto_12080 ) ( IN-CITY ?auto_12077 ?auto_12080 ) ( not ( = ?auto_12077 ?auto_12082 ) ) ( OBJ-AT ?auto_12079 ?auto_12082 ) ( TRUCK-AT ?auto_12081 ?auto_12077 ) ( OBJ-AT ?auto_12076 ?auto_12077 ) ( OBJ-AT ?auto_12078 ?auto_12077 ) ( not ( = ?auto_12076 ?auto_12078 ) ) ( not ( = ?auto_12076 ?auto_12079 ) ) ( not ( = ?auto_12078 ?auto_12079 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12079 ?auto_12077 )
      ( DELIVER-3PKG-VERIFY ?auto_12076 ?auto_12078 ?auto_12079 ?auto_12077 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12087 - OBJ
      ?auto_12089 - OBJ
      ?auto_12090 - OBJ
      ?auto_12088 - LOCATION
    )
    :vars
    (
      ?auto_12091 - LOCATION
      ?auto_12092 - CITY
      ?auto_12093 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12089 ?auto_12087 ) ( GREATER-THAN ?auto_12090 ?auto_12087 ) ( GREATER-THAN ?auto_12090 ?auto_12089 ) ( IN-CITY ?auto_12091 ?auto_12092 ) ( IN-CITY ?auto_12088 ?auto_12092 ) ( not ( = ?auto_12088 ?auto_12091 ) ) ( OBJ-AT ?auto_12090 ?auto_12091 ) ( TRUCK-AT ?auto_12093 ?auto_12088 ) ( OBJ-AT ?auto_12087 ?auto_12088 ) ( not ( = ?auto_12087 ?auto_12089 ) ) ( not ( = ?auto_12087 ?auto_12090 ) ) ( not ( = ?auto_12089 ?auto_12090 ) ) ( IN-TRUCK ?auto_12089 ?auto_12093 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12089 ?auto_12088 )
      ( DELIVER-3PKG ?auto_12087 ?auto_12089 ?auto_12090 ?auto_12088 )
      ( DELIVER-3PKG-VERIFY ?auto_12087 ?auto_12089 ?auto_12090 ?auto_12088 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12098 - OBJ
      ?auto_12100 - OBJ
      ?auto_12101 - OBJ
      ?auto_12099 - LOCATION
    )
    :vars
    (
      ?auto_12104 - LOCATION
      ?auto_12102 - CITY
      ?auto_12103 - TRUCK
      ?auto_12105 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12100 ?auto_12098 ) ( GREATER-THAN ?auto_12101 ?auto_12098 ) ( GREATER-THAN ?auto_12101 ?auto_12100 ) ( IN-CITY ?auto_12104 ?auto_12102 ) ( IN-CITY ?auto_12099 ?auto_12102 ) ( not ( = ?auto_12099 ?auto_12104 ) ) ( OBJ-AT ?auto_12101 ?auto_12104 ) ( OBJ-AT ?auto_12098 ?auto_12099 ) ( not ( = ?auto_12098 ?auto_12100 ) ) ( not ( = ?auto_12098 ?auto_12101 ) ) ( not ( = ?auto_12100 ?auto_12101 ) ) ( IN-TRUCK ?auto_12100 ?auto_12103 ) ( TRUCK-AT ?auto_12103 ?auto_12105 ) ( IN-CITY ?auto_12105 ?auto_12102 ) ( not ( = ?auto_12099 ?auto_12105 ) ) ( not ( = ?auto_12104 ?auto_12105 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12103 ?auto_12105 ?auto_12099 ?auto_12102 )
      ( DELIVER-3PKG ?auto_12098 ?auto_12100 ?auto_12101 ?auto_12099 )
      ( DELIVER-3PKG-VERIFY ?auto_12098 ?auto_12100 ?auto_12101 ?auto_12099 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12110 - OBJ
      ?auto_12112 - OBJ
      ?auto_12113 - OBJ
      ?auto_12111 - LOCATION
    )
    :vars
    (
      ?auto_12116 - LOCATION
      ?auto_12115 - CITY
      ?auto_12114 - TRUCK
      ?auto_12117 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12112 ?auto_12110 ) ( GREATER-THAN ?auto_12113 ?auto_12110 ) ( GREATER-THAN ?auto_12113 ?auto_12112 ) ( IN-CITY ?auto_12116 ?auto_12115 ) ( IN-CITY ?auto_12111 ?auto_12115 ) ( not ( = ?auto_12111 ?auto_12116 ) ) ( OBJ-AT ?auto_12113 ?auto_12116 ) ( OBJ-AT ?auto_12110 ?auto_12111 ) ( not ( = ?auto_12110 ?auto_12112 ) ) ( not ( = ?auto_12110 ?auto_12113 ) ) ( not ( = ?auto_12112 ?auto_12113 ) ) ( TRUCK-AT ?auto_12114 ?auto_12117 ) ( IN-CITY ?auto_12117 ?auto_12115 ) ( not ( = ?auto_12111 ?auto_12117 ) ) ( not ( = ?auto_12116 ?auto_12117 ) ) ( OBJ-AT ?auto_12112 ?auto_12117 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12112 ?auto_12114 ?auto_12117 )
      ( DELIVER-3PKG ?auto_12110 ?auto_12112 ?auto_12113 ?auto_12111 )
      ( DELIVER-3PKG-VERIFY ?auto_12110 ?auto_12112 ?auto_12113 ?auto_12111 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12122 - OBJ
      ?auto_12124 - OBJ
      ?auto_12125 - OBJ
      ?auto_12123 - LOCATION
    )
    :vars
    (
      ?auto_12128 - LOCATION
      ?auto_12126 - CITY
      ?auto_12129 - LOCATION
      ?auto_12127 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12124 ?auto_12122 ) ( GREATER-THAN ?auto_12125 ?auto_12122 ) ( GREATER-THAN ?auto_12125 ?auto_12124 ) ( IN-CITY ?auto_12128 ?auto_12126 ) ( IN-CITY ?auto_12123 ?auto_12126 ) ( not ( = ?auto_12123 ?auto_12128 ) ) ( OBJ-AT ?auto_12125 ?auto_12128 ) ( OBJ-AT ?auto_12122 ?auto_12123 ) ( not ( = ?auto_12122 ?auto_12124 ) ) ( not ( = ?auto_12122 ?auto_12125 ) ) ( not ( = ?auto_12124 ?auto_12125 ) ) ( IN-CITY ?auto_12129 ?auto_12126 ) ( not ( = ?auto_12123 ?auto_12129 ) ) ( not ( = ?auto_12128 ?auto_12129 ) ) ( OBJ-AT ?auto_12124 ?auto_12129 ) ( TRUCK-AT ?auto_12127 ?auto_12123 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12127 ?auto_12123 ?auto_12129 ?auto_12126 )
      ( DELIVER-3PKG ?auto_12122 ?auto_12124 ?auto_12125 ?auto_12123 )
      ( DELIVER-3PKG-VERIFY ?auto_12122 ?auto_12124 ?auto_12125 ?auto_12123 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12134 - OBJ
      ?auto_12136 - OBJ
      ?auto_12137 - OBJ
      ?auto_12135 - LOCATION
    )
    :vars
    (
      ?auto_12140 - LOCATION
      ?auto_12138 - CITY
      ?auto_12141 - LOCATION
      ?auto_12139 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12136 ?auto_12134 ) ( GREATER-THAN ?auto_12137 ?auto_12134 ) ( GREATER-THAN ?auto_12137 ?auto_12136 ) ( IN-CITY ?auto_12140 ?auto_12138 ) ( IN-CITY ?auto_12135 ?auto_12138 ) ( not ( = ?auto_12135 ?auto_12140 ) ) ( OBJ-AT ?auto_12137 ?auto_12140 ) ( not ( = ?auto_12134 ?auto_12136 ) ) ( not ( = ?auto_12134 ?auto_12137 ) ) ( not ( = ?auto_12136 ?auto_12137 ) ) ( IN-CITY ?auto_12141 ?auto_12138 ) ( not ( = ?auto_12135 ?auto_12141 ) ) ( not ( = ?auto_12140 ?auto_12141 ) ) ( OBJ-AT ?auto_12136 ?auto_12141 ) ( TRUCK-AT ?auto_12139 ?auto_12135 ) ( IN-TRUCK ?auto_12134 ?auto_12139 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12134 ?auto_12135 )
      ( DELIVER-3PKG ?auto_12134 ?auto_12136 ?auto_12137 ?auto_12135 )
      ( DELIVER-3PKG-VERIFY ?auto_12134 ?auto_12136 ?auto_12137 ?auto_12135 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12146 - OBJ
      ?auto_12148 - OBJ
      ?auto_12149 - OBJ
      ?auto_12147 - LOCATION
    )
    :vars
    (
      ?auto_12152 - LOCATION
      ?auto_12153 - CITY
      ?auto_12151 - LOCATION
      ?auto_12150 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12148 ?auto_12146 ) ( GREATER-THAN ?auto_12149 ?auto_12146 ) ( GREATER-THAN ?auto_12149 ?auto_12148 ) ( IN-CITY ?auto_12152 ?auto_12153 ) ( IN-CITY ?auto_12147 ?auto_12153 ) ( not ( = ?auto_12147 ?auto_12152 ) ) ( OBJ-AT ?auto_12149 ?auto_12152 ) ( not ( = ?auto_12146 ?auto_12148 ) ) ( not ( = ?auto_12146 ?auto_12149 ) ) ( not ( = ?auto_12148 ?auto_12149 ) ) ( IN-CITY ?auto_12151 ?auto_12153 ) ( not ( = ?auto_12147 ?auto_12151 ) ) ( not ( = ?auto_12152 ?auto_12151 ) ) ( OBJ-AT ?auto_12148 ?auto_12151 ) ( IN-TRUCK ?auto_12146 ?auto_12150 ) ( TRUCK-AT ?auto_12150 ?auto_12151 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12150 ?auto_12151 ?auto_12147 ?auto_12153 )
      ( DELIVER-3PKG ?auto_12146 ?auto_12148 ?auto_12149 ?auto_12147 )
      ( DELIVER-3PKG-VERIFY ?auto_12146 ?auto_12148 ?auto_12149 ?auto_12147 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12158 - OBJ
      ?auto_12160 - OBJ
      ?auto_12161 - OBJ
      ?auto_12159 - LOCATION
    )
    :vars
    (
      ?auto_12162 - LOCATION
      ?auto_12163 - CITY
      ?auto_12164 - LOCATION
      ?auto_12165 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12160 ?auto_12158 ) ( GREATER-THAN ?auto_12161 ?auto_12158 ) ( GREATER-THAN ?auto_12161 ?auto_12160 ) ( IN-CITY ?auto_12162 ?auto_12163 ) ( IN-CITY ?auto_12159 ?auto_12163 ) ( not ( = ?auto_12159 ?auto_12162 ) ) ( OBJ-AT ?auto_12161 ?auto_12162 ) ( not ( = ?auto_12158 ?auto_12160 ) ) ( not ( = ?auto_12158 ?auto_12161 ) ) ( not ( = ?auto_12160 ?auto_12161 ) ) ( IN-CITY ?auto_12164 ?auto_12163 ) ( not ( = ?auto_12159 ?auto_12164 ) ) ( not ( = ?auto_12162 ?auto_12164 ) ) ( OBJ-AT ?auto_12160 ?auto_12164 ) ( TRUCK-AT ?auto_12165 ?auto_12164 ) ( OBJ-AT ?auto_12158 ?auto_12164 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12158 ?auto_12165 ?auto_12164 )
      ( DELIVER-3PKG ?auto_12158 ?auto_12160 ?auto_12161 ?auto_12159 )
      ( DELIVER-3PKG-VERIFY ?auto_12158 ?auto_12160 ?auto_12161 ?auto_12159 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12170 - OBJ
      ?auto_12172 - OBJ
      ?auto_12173 - OBJ
      ?auto_12171 - LOCATION
    )
    :vars
    (
      ?auto_12175 - LOCATION
      ?auto_12174 - CITY
      ?auto_12176 - LOCATION
      ?auto_12177 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12172 ?auto_12170 ) ( GREATER-THAN ?auto_12173 ?auto_12170 ) ( GREATER-THAN ?auto_12173 ?auto_12172 ) ( IN-CITY ?auto_12175 ?auto_12174 ) ( IN-CITY ?auto_12171 ?auto_12174 ) ( not ( = ?auto_12171 ?auto_12175 ) ) ( OBJ-AT ?auto_12173 ?auto_12175 ) ( not ( = ?auto_12170 ?auto_12172 ) ) ( not ( = ?auto_12170 ?auto_12173 ) ) ( not ( = ?auto_12172 ?auto_12173 ) ) ( IN-CITY ?auto_12176 ?auto_12174 ) ( not ( = ?auto_12171 ?auto_12176 ) ) ( not ( = ?auto_12175 ?auto_12176 ) ) ( OBJ-AT ?auto_12172 ?auto_12176 ) ( OBJ-AT ?auto_12170 ?auto_12176 ) ( TRUCK-AT ?auto_12177 ?auto_12171 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12177 ?auto_12171 ?auto_12176 ?auto_12174 )
      ( DELIVER-3PKG ?auto_12170 ?auto_12172 ?auto_12173 ?auto_12171 )
      ( DELIVER-3PKG-VERIFY ?auto_12170 ?auto_12172 ?auto_12173 ?auto_12171 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12209 - OBJ
      ?auto_12211 - OBJ
      ?auto_12212 - OBJ
      ?auto_12213 - OBJ
      ?auto_12210 - LOCATION
    )
    :vars
    (
      ?auto_12214 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12211 ?auto_12209 ) ( GREATER-THAN ?auto_12212 ?auto_12209 ) ( GREATER-THAN ?auto_12212 ?auto_12211 ) ( GREATER-THAN ?auto_12213 ?auto_12209 ) ( GREATER-THAN ?auto_12213 ?auto_12211 ) ( GREATER-THAN ?auto_12213 ?auto_12212 ) ( TRUCK-AT ?auto_12214 ?auto_12210 ) ( IN-TRUCK ?auto_12213 ?auto_12214 ) ( OBJ-AT ?auto_12209 ?auto_12210 ) ( OBJ-AT ?auto_12211 ?auto_12210 ) ( OBJ-AT ?auto_12212 ?auto_12210 ) ( not ( = ?auto_12209 ?auto_12211 ) ) ( not ( = ?auto_12209 ?auto_12212 ) ) ( not ( = ?auto_12209 ?auto_12213 ) ) ( not ( = ?auto_12211 ?auto_12212 ) ) ( not ( = ?auto_12211 ?auto_12213 ) ) ( not ( = ?auto_12212 ?auto_12213 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12213 ?auto_12210 )
      ( DELIVER-4PKG-VERIFY ?auto_12209 ?auto_12211 ?auto_12212 ?auto_12213 ?auto_12210 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12220 - OBJ
      ?auto_12222 - OBJ
      ?auto_12223 - OBJ
      ?auto_12224 - OBJ
      ?auto_12221 - LOCATION
    )
    :vars
    (
      ?auto_12227 - TRUCK
      ?auto_12225 - LOCATION
      ?auto_12226 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12222 ?auto_12220 ) ( GREATER-THAN ?auto_12223 ?auto_12220 ) ( GREATER-THAN ?auto_12223 ?auto_12222 ) ( GREATER-THAN ?auto_12224 ?auto_12220 ) ( GREATER-THAN ?auto_12224 ?auto_12222 ) ( GREATER-THAN ?auto_12224 ?auto_12223 ) ( IN-TRUCK ?auto_12224 ?auto_12227 ) ( TRUCK-AT ?auto_12227 ?auto_12225 ) ( IN-CITY ?auto_12225 ?auto_12226 ) ( IN-CITY ?auto_12221 ?auto_12226 ) ( not ( = ?auto_12221 ?auto_12225 ) ) ( OBJ-AT ?auto_12220 ?auto_12221 ) ( OBJ-AT ?auto_12222 ?auto_12221 ) ( OBJ-AT ?auto_12223 ?auto_12221 ) ( not ( = ?auto_12220 ?auto_12222 ) ) ( not ( = ?auto_12220 ?auto_12223 ) ) ( not ( = ?auto_12220 ?auto_12224 ) ) ( not ( = ?auto_12222 ?auto_12223 ) ) ( not ( = ?auto_12222 ?auto_12224 ) ) ( not ( = ?auto_12223 ?auto_12224 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12224 ?auto_12221 )
      ( DELIVER-4PKG-VERIFY ?auto_12220 ?auto_12222 ?auto_12223 ?auto_12224 ?auto_12221 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12233 - OBJ
      ?auto_12235 - OBJ
      ?auto_12236 - OBJ
      ?auto_12237 - OBJ
      ?auto_12234 - LOCATION
    )
    :vars
    (
      ?auto_12239 - TRUCK
      ?auto_12238 - LOCATION
      ?auto_12240 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12235 ?auto_12233 ) ( GREATER-THAN ?auto_12236 ?auto_12233 ) ( GREATER-THAN ?auto_12236 ?auto_12235 ) ( GREATER-THAN ?auto_12237 ?auto_12233 ) ( GREATER-THAN ?auto_12237 ?auto_12235 ) ( GREATER-THAN ?auto_12237 ?auto_12236 ) ( TRUCK-AT ?auto_12239 ?auto_12238 ) ( IN-CITY ?auto_12238 ?auto_12240 ) ( IN-CITY ?auto_12234 ?auto_12240 ) ( not ( = ?auto_12234 ?auto_12238 ) ) ( OBJ-AT ?auto_12237 ?auto_12238 ) ( OBJ-AT ?auto_12233 ?auto_12234 ) ( OBJ-AT ?auto_12235 ?auto_12234 ) ( OBJ-AT ?auto_12236 ?auto_12234 ) ( not ( = ?auto_12233 ?auto_12235 ) ) ( not ( = ?auto_12233 ?auto_12236 ) ) ( not ( = ?auto_12233 ?auto_12237 ) ) ( not ( = ?auto_12235 ?auto_12236 ) ) ( not ( = ?auto_12235 ?auto_12237 ) ) ( not ( = ?auto_12236 ?auto_12237 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12237 ?auto_12234 )
      ( DELIVER-4PKG-VERIFY ?auto_12233 ?auto_12235 ?auto_12236 ?auto_12237 ?auto_12234 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12246 - OBJ
      ?auto_12248 - OBJ
      ?auto_12249 - OBJ
      ?auto_12250 - OBJ
      ?auto_12247 - LOCATION
    )
    :vars
    (
      ?auto_12253 - LOCATION
      ?auto_12252 - CITY
      ?auto_12251 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12248 ?auto_12246 ) ( GREATER-THAN ?auto_12249 ?auto_12246 ) ( GREATER-THAN ?auto_12249 ?auto_12248 ) ( GREATER-THAN ?auto_12250 ?auto_12246 ) ( GREATER-THAN ?auto_12250 ?auto_12248 ) ( GREATER-THAN ?auto_12250 ?auto_12249 ) ( IN-CITY ?auto_12253 ?auto_12252 ) ( IN-CITY ?auto_12247 ?auto_12252 ) ( not ( = ?auto_12247 ?auto_12253 ) ) ( OBJ-AT ?auto_12250 ?auto_12253 ) ( TRUCK-AT ?auto_12251 ?auto_12247 ) ( OBJ-AT ?auto_12246 ?auto_12247 ) ( OBJ-AT ?auto_12248 ?auto_12247 ) ( OBJ-AT ?auto_12249 ?auto_12247 ) ( not ( = ?auto_12246 ?auto_12248 ) ) ( not ( = ?auto_12246 ?auto_12249 ) ) ( not ( = ?auto_12246 ?auto_12250 ) ) ( not ( = ?auto_12248 ?auto_12249 ) ) ( not ( = ?auto_12248 ?auto_12250 ) ) ( not ( = ?auto_12249 ?auto_12250 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12250 ?auto_12247 )
      ( DELIVER-4PKG-VERIFY ?auto_12246 ?auto_12248 ?auto_12249 ?auto_12250 ?auto_12247 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12259 - OBJ
      ?auto_12261 - OBJ
      ?auto_12262 - OBJ
      ?auto_12263 - OBJ
      ?auto_12260 - LOCATION
    )
    :vars
    (
      ?auto_12265 - LOCATION
      ?auto_12266 - CITY
      ?auto_12264 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12261 ?auto_12259 ) ( GREATER-THAN ?auto_12262 ?auto_12259 ) ( GREATER-THAN ?auto_12262 ?auto_12261 ) ( GREATER-THAN ?auto_12263 ?auto_12259 ) ( GREATER-THAN ?auto_12263 ?auto_12261 ) ( GREATER-THAN ?auto_12263 ?auto_12262 ) ( IN-CITY ?auto_12265 ?auto_12266 ) ( IN-CITY ?auto_12260 ?auto_12266 ) ( not ( = ?auto_12260 ?auto_12265 ) ) ( OBJ-AT ?auto_12263 ?auto_12265 ) ( TRUCK-AT ?auto_12264 ?auto_12260 ) ( OBJ-AT ?auto_12259 ?auto_12260 ) ( OBJ-AT ?auto_12261 ?auto_12260 ) ( not ( = ?auto_12259 ?auto_12261 ) ) ( not ( = ?auto_12259 ?auto_12262 ) ) ( not ( = ?auto_12259 ?auto_12263 ) ) ( not ( = ?auto_12261 ?auto_12262 ) ) ( not ( = ?auto_12261 ?auto_12263 ) ) ( not ( = ?auto_12262 ?auto_12263 ) ) ( IN-TRUCK ?auto_12262 ?auto_12264 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12262 ?auto_12260 )
      ( DELIVER-4PKG ?auto_12259 ?auto_12261 ?auto_12262 ?auto_12263 ?auto_12260 )
      ( DELIVER-4PKG-VERIFY ?auto_12259 ?auto_12261 ?auto_12262 ?auto_12263 ?auto_12260 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12272 - OBJ
      ?auto_12274 - OBJ
      ?auto_12275 - OBJ
      ?auto_12276 - OBJ
      ?auto_12273 - LOCATION
    )
    :vars
    (
      ?auto_12277 - LOCATION
      ?auto_12278 - CITY
      ?auto_12279 - TRUCK
      ?auto_12280 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12274 ?auto_12272 ) ( GREATER-THAN ?auto_12275 ?auto_12272 ) ( GREATER-THAN ?auto_12275 ?auto_12274 ) ( GREATER-THAN ?auto_12276 ?auto_12272 ) ( GREATER-THAN ?auto_12276 ?auto_12274 ) ( GREATER-THAN ?auto_12276 ?auto_12275 ) ( IN-CITY ?auto_12277 ?auto_12278 ) ( IN-CITY ?auto_12273 ?auto_12278 ) ( not ( = ?auto_12273 ?auto_12277 ) ) ( OBJ-AT ?auto_12276 ?auto_12277 ) ( OBJ-AT ?auto_12272 ?auto_12273 ) ( OBJ-AT ?auto_12274 ?auto_12273 ) ( not ( = ?auto_12272 ?auto_12274 ) ) ( not ( = ?auto_12272 ?auto_12275 ) ) ( not ( = ?auto_12272 ?auto_12276 ) ) ( not ( = ?auto_12274 ?auto_12275 ) ) ( not ( = ?auto_12274 ?auto_12276 ) ) ( not ( = ?auto_12275 ?auto_12276 ) ) ( IN-TRUCK ?auto_12275 ?auto_12279 ) ( TRUCK-AT ?auto_12279 ?auto_12280 ) ( IN-CITY ?auto_12280 ?auto_12278 ) ( not ( = ?auto_12273 ?auto_12280 ) ) ( not ( = ?auto_12277 ?auto_12280 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12279 ?auto_12280 ?auto_12273 ?auto_12278 )
      ( DELIVER-4PKG ?auto_12272 ?auto_12274 ?auto_12275 ?auto_12276 ?auto_12273 )
      ( DELIVER-4PKG-VERIFY ?auto_12272 ?auto_12274 ?auto_12275 ?auto_12276 ?auto_12273 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12286 - OBJ
      ?auto_12288 - OBJ
      ?auto_12289 - OBJ
      ?auto_12290 - OBJ
      ?auto_12287 - LOCATION
    )
    :vars
    (
      ?auto_12293 - LOCATION
      ?auto_12294 - CITY
      ?auto_12291 - TRUCK
      ?auto_12292 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12288 ?auto_12286 ) ( GREATER-THAN ?auto_12289 ?auto_12286 ) ( GREATER-THAN ?auto_12289 ?auto_12288 ) ( GREATER-THAN ?auto_12290 ?auto_12286 ) ( GREATER-THAN ?auto_12290 ?auto_12288 ) ( GREATER-THAN ?auto_12290 ?auto_12289 ) ( IN-CITY ?auto_12293 ?auto_12294 ) ( IN-CITY ?auto_12287 ?auto_12294 ) ( not ( = ?auto_12287 ?auto_12293 ) ) ( OBJ-AT ?auto_12290 ?auto_12293 ) ( OBJ-AT ?auto_12286 ?auto_12287 ) ( OBJ-AT ?auto_12288 ?auto_12287 ) ( not ( = ?auto_12286 ?auto_12288 ) ) ( not ( = ?auto_12286 ?auto_12289 ) ) ( not ( = ?auto_12286 ?auto_12290 ) ) ( not ( = ?auto_12288 ?auto_12289 ) ) ( not ( = ?auto_12288 ?auto_12290 ) ) ( not ( = ?auto_12289 ?auto_12290 ) ) ( TRUCK-AT ?auto_12291 ?auto_12292 ) ( IN-CITY ?auto_12292 ?auto_12294 ) ( not ( = ?auto_12287 ?auto_12292 ) ) ( not ( = ?auto_12293 ?auto_12292 ) ) ( OBJ-AT ?auto_12289 ?auto_12292 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12289 ?auto_12291 ?auto_12292 )
      ( DELIVER-4PKG ?auto_12286 ?auto_12288 ?auto_12289 ?auto_12290 ?auto_12287 )
      ( DELIVER-4PKG-VERIFY ?auto_12286 ?auto_12288 ?auto_12289 ?auto_12290 ?auto_12287 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12300 - OBJ
      ?auto_12302 - OBJ
      ?auto_12303 - OBJ
      ?auto_12304 - OBJ
      ?auto_12301 - LOCATION
    )
    :vars
    (
      ?auto_12306 - LOCATION
      ?auto_12305 - CITY
      ?auto_12308 - LOCATION
      ?auto_12307 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12302 ?auto_12300 ) ( GREATER-THAN ?auto_12303 ?auto_12300 ) ( GREATER-THAN ?auto_12303 ?auto_12302 ) ( GREATER-THAN ?auto_12304 ?auto_12300 ) ( GREATER-THAN ?auto_12304 ?auto_12302 ) ( GREATER-THAN ?auto_12304 ?auto_12303 ) ( IN-CITY ?auto_12306 ?auto_12305 ) ( IN-CITY ?auto_12301 ?auto_12305 ) ( not ( = ?auto_12301 ?auto_12306 ) ) ( OBJ-AT ?auto_12304 ?auto_12306 ) ( OBJ-AT ?auto_12300 ?auto_12301 ) ( OBJ-AT ?auto_12302 ?auto_12301 ) ( not ( = ?auto_12300 ?auto_12302 ) ) ( not ( = ?auto_12300 ?auto_12303 ) ) ( not ( = ?auto_12300 ?auto_12304 ) ) ( not ( = ?auto_12302 ?auto_12303 ) ) ( not ( = ?auto_12302 ?auto_12304 ) ) ( not ( = ?auto_12303 ?auto_12304 ) ) ( IN-CITY ?auto_12308 ?auto_12305 ) ( not ( = ?auto_12301 ?auto_12308 ) ) ( not ( = ?auto_12306 ?auto_12308 ) ) ( OBJ-AT ?auto_12303 ?auto_12308 ) ( TRUCK-AT ?auto_12307 ?auto_12301 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12307 ?auto_12301 ?auto_12308 ?auto_12305 )
      ( DELIVER-4PKG ?auto_12300 ?auto_12302 ?auto_12303 ?auto_12304 ?auto_12301 )
      ( DELIVER-4PKG-VERIFY ?auto_12300 ?auto_12302 ?auto_12303 ?auto_12304 ?auto_12301 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12314 - OBJ
      ?auto_12316 - OBJ
      ?auto_12317 - OBJ
      ?auto_12318 - OBJ
      ?auto_12315 - LOCATION
    )
    :vars
    (
      ?auto_12320 - LOCATION
      ?auto_12322 - CITY
      ?auto_12321 - LOCATION
      ?auto_12319 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12316 ?auto_12314 ) ( GREATER-THAN ?auto_12317 ?auto_12314 ) ( GREATER-THAN ?auto_12317 ?auto_12316 ) ( GREATER-THAN ?auto_12318 ?auto_12314 ) ( GREATER-THAN ?auto_12318 ?auto_12316 ) ( GREATER-THAN ?auto_12318 ?auto_12317 ) ( IN-CITY ?auto_12320 ?auto_12322 ) ( IN-CITY ?auto_12315 ?auto_12322 ) ( not ( = ?auto_12315 ?auto_12320 ) ) ( OBJ-AT ?auto_12318 ?auto_12320 ) ( OBJ-AT ?auto_12314 ?auto_12315 ) ( not ( = ?auto_12314 ?auto_12316 ) ) ( not ( = ?auto_12314 ?auto_12317 ) ) ( not ( = ?auto_12314 ?auto_12318 ) ) ( not ( = ?auto_12316 ?auto_12317 ) ) ( not ( = ?auto_12316 ?auto_12318 ) ) ( not ( = ?auto_12317 ?auto_12318 ) ) ( IN-CITY ?auto_12321 ?auto_12322 ) ( not ( = ?auto_12315 ?auto_12321 ) ) ( not ( = ?auto_12320 ?auto_12321 ) ) ( OBJ-AT ?auto_12317 ?auto_12321 ) ( TRUCK-AT ?auto_12319 ?auto_12315 ) ( IN-TRUCK ?auto_12316 ?auto_12319 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12316 ?auto_12315 )
      ( DELIVER-4PKG ?auto_12314 ?auto_12316 ?auto_12317 ?auto_12318 ?auto_12315 )
      ( DELIVER-4PKG-VERIFY ?auto_12314 ?auto_12316 ?auto_12317 ?auto_12318 ?auto_12315 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12328 - OBJ
      ?auto_12330 - OBJ
      ?auto_12331 - OBJ
      ?auto_12332 - OBJ
      ?auto_12329 - LOCATION
    )
    :vars
    (
      ?auto_12336 - LOCATION
      ?auto_12335 - CITY
      ?auto_12334 - LOCATION
      ?auto_12333 - TRUCK
      ?auto_12337 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12330 ?auto_12328 ) ( GREATER-THAN ?auto_12331 ?auto_12328 ) ( GREATER-THAN ?auto_12331 ?auto_12330 ) ( GREATER-THAN ?auto_12332 ?auto_12328 ) ( GREATER-THAN ?auto_12332 ?auto_12330 ) ( GREATER-THAN ?auto_12332 ?auto_12331 ) ( IN-CITY ?auto_12336 ?auto_12335 ) ( IN-CITY ?auto_12329 ?auto_12335 ) ( not ( = ?auto_12329 ?auto_12336 ) ) ( OBJ-AT ?auto_12332 ?auto_12336 ) ( OBJ-AT ?auto_12328 ?auto_12329 ) ( not ( = ?auto_12328 ?auto_12330 ) ) ( not ( = ?auto_12328 ?auto_12331 ) ) ( not ( = ?auto_12328 ?auto_12332 ) ) ( not ( = ?auto_12330 ?auto_12331 ) ) ( not ( = ?auto_12330 ?auto_12332 ) ) ( not ( = ?auto_12331 ?auto_12332 ) ) ( IN-CITY ?auto_12334 ?auto_12335 ) ( not ( = ?auto_12329 ?auto_12334 ) ) ( not ( = ?auto_12336 ?auto_12334 ) ) ( OBJ-AT ?auto_12331 ?auto_12334 ) ( IN-TRUCK ?auto_12330 ?auto_12333 ) ( TRUCK-AT ?auto_12333 ?auto_12337 ) ( IN-CITY ?auto_12337 ?auto_12335 ) ( not ( = ?auto_12329 ?auto_12337 ) ) ( not ( = ?auto_12336 ?auto_12337 ) ) ( not ( = ?auto_12334 ?auto_12337 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12333 ?auto_12337 ?auto_12329 ?auto_12335 )
      ( DELIVER-4PKG ?auto_12328 ?auto_12330 ?auto_12331 ?auto_12332 ?auto_12329 )
      ( DELIVER-4PKG-VERIFY ?auto_12328 ?auto_12330 ?auto_12331 ?auto_12332 ?auto_12329 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12343 - OBJ
      ?auto_12345 - OBJ
      ?auto_12346 - OBJ
      ?auto_12347 - OBJ
      ?auto_12344 - LOCATION
    )
    :vars
    (
      ?auto_12348 - LOCATION
      ?auto_12351 - CITY
      ?auto_12352 - LOCATION
      ?auto_12349 - TRUCK
      ?auto_12350 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12345 ?auto_12343 ) ( GREATER-THAN ?auto_12346 ?auto_12343 ) ( GREATER-THAN ?auto_12346 ?auto_12345 ) ( GREATER-THAN ?auto_12347 ?auto_12343 ) ( GREATER-THAN ?auto_12347 ?auto_12345 ) ( GREATER-THAN ?auto_12347 ?auto_12346 ) ( IN-CITY ?auto_12348 ?auto_12351 ) ( IN-CITY ?auto_12344 ?auto_12351 ) ( not ( = ?auto_12344 ?auto_12348 ) ) ( OBJ-AT ?auto_12347 ?auto_12348 ) ( OBJ-AT ?auto_12343 ?auto_12344 ) ( not ( = ?auto_12343 ?auto_12345 ) ) ( not ( = ?auto_12343 ?auto_12346 ) ) ( not ( = ?auto_12343 ?auto_12347 ) ) ( not ( = ?auto_12345 ?auto_12346 ) ) ( not ( = ?auto_12345 ?auto_12347 ) ) ( not ( = ?auto_12346 ?auto_12347 ) ) ( IN-CITY ?auto_12352 ?auto_12351 ) ( not ( = ?auto_12344 ?auto_12352 ) ) ( not ( = ?auto_12348 ?auto_12352 ) ) ( OBJ-AT ?auto_12346 ?auto_12352 ) ( TRUCK-AT ?auto_12349 ?auto_12350 ) ( IN-CITY ?auto_12350 ?auto_12351 ) ( not ( = ?auto_12344 ?auto_12350 ) ) ( not ( = ?auto_12348 ?auto_12350 ) ) ( not ( = ?auto_12352 ?auto_12350 ) ) ( OBJ-AT ?auto_12345 ?auto_12350 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12345 ?auto_12349 ?auto_12350 )
      ( DELIVER-4PKG ?auto_12343 ?auto_12345 ?auto_12346 ?auto_12347 ?auto_12344 )
      ( DELIVER-4PKG-VERIFY ?auto_12343 ?auto_12345 ?auto_12346 ?auto_12347 ?auto_12344 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12358 - OBJ
      ?auto_12360 - OBJ
      ?auto_12361 - OBJ
      ?auto_12362 - OBJ
      ?auto_12359 - LOCATION
    )
    :vars
    (
      ?auto_12364 - LOCATION
      ?auto_12365 - CITY
      ?auto_12363 - LOCATION
      ?auto_12367 - LOCATION
      ?auto_12366 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12360 ?auto_12358 ) ( GREATER-THAN ?auto_12361 ?auto_12358 ) ( GREATER-THAN ?auto_12361 ?auto_12360 ) ( GREATER-THAN ?auto_12362 ?auto_12358 ) ( GREATER-THAN ?auto_12362 ?auto_12360 ) ( GREATER-THAN ?auto_12362 ?auto_12361 ) ( IN-CITY ?auto_12364 ?auto_12365 ) ( IN-CITY ?auto_12359 ?auto_12365 ) ( not ( = ?auto_12359 ?auto_12364 ) ) ( OBJ-AT ?auto_12362 ?auto_12364 ) ( OBJ-AT ?auto_12358 ?auto_12359 ) ( not ( = ?auto_12358 ?auto_12360 ) ) ( not ( = ?auto_12358 ?auto_12361 ) ) ( not ( = ?auto_12358 ?auto_12362 ) ) ( not ( = ?auto_12360 ?auto_12361 ) ) ( not ( = ?auto_12360 ?auto_12362 ) ) ( not ( = ?auto_12361 ?auto_12362 ) ) ( IN-CITY ?auto_12363 ?auto_12365 ) ( not ( = ?auto_12359 ?auto_12363 ) ) ( not ( = ?auto_12364 ?auto_12363 ) ) ( OBJ-AT ?auto_12361 ?auto_12363 ) ( IN-CITY ?auto_12367 ?auto_12365 ) ( not ( = ?auto_12359 ?auto_12367 ) ) ( not ( = ?auto_12364 ?auto_12367 ) ) ( not ( = ?auto_12363 ?auto_12367 ) ) ( OBJ-AT ?auto_12360 ?auto_12367 ) ( TRUCK-AT ?auto_12366 ?auto_12359 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12366 ?auto_12359 ?auto_12367 ?auto_12365 )
      ( DELIVER-4PKG ?auto_12358 ?auto_12360 ?auto_12361 ?auto_12362 ?auto_12359 )
      ( DELIVER-4PKG-VERIFY ?auto_12358 ?auto_12360 ?auto_12361 ?auto_12362 ?auto_12359 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12373 - OBJ
      ?auto_12375 - OBJ
      ?auto_12376 - OBJ
      ?auto_12377 - OBJ
      ?auto_12374 - LOCATION
    )
    :vars
    (
      ?auto_12378 - LOCATION
      ?auto_12381 - CITY
      ?auto_12382 - LOCATION
      ?auto_12380 - LOCATION
      ?auto_12379 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12375 ?auto_12373 ) ( GREATER-THAN ?auto_12376 ?auto_12373 ) ( GREATER-THAN ?auto_12376 ?auto_12375 ) ( GREATER-THAN ?auto_12377 ?auto_12373 ) ( GREATER-THAN ?auto_12377 ?auto_12375 ) ( GREATER-THAN ?auto_12377 ?auto_12376 ) ( IN-CITY ?auto_12378 ?auto_12381 ) ( IN-CITY ?auto_12374 ?auto_12381 ) ( not ( = ?auto_12374 ?auto_12378 ) ) ( OBJ-AT ?auto_12377 ?auto_12378 ) ( not ( = ?auto_12373 ?auto_12375 ) ) ( not ( = ?auto_12373 ?auto_12376 ) ) ( not ( = ?auto_12373 ?auto_12377 ) ) ( not ( = ?auto_12375 ?auto_12376 ) ) ( not ( = ?auto_12375 ?auto_12377 ) ) ( not ( = ?auto_12376 ?auto_12377 ) ) ( IN-CITY ?auto_12382 ?auto_12381 ) ( not ( = ?auto_12374 ?auto_12382 ) ) ( not ( = ?auto_12378 ?auto_12382 ) ) ( OBJ-AT ?auto_12376 ?auto_12382 ) ( IN-CITY ?auto_12380 ?auto_12381 ) ( not ( = ?auto_12374 ?auto_12380 ) ) ( not ( = ?auto_12378 ?auto_12380 ) ) ( not ( = ?auto_12382 ?auto_12380 ) ) ( OBJ-AT ?auto_12375 ?auto_12380 ) ( TRUCK-AT ?auto_12379 ?auto_12374 ) ( IN-TRUCK ?auto_12373 ?auto_12379 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12373 ?auto_12374 )
      ( DELIVER-4PKG ?auto_12373 ?auto_12375 ?auto_12376 ?auto_12377 ?auto_12374 )
      ( DELIVER-4PKG-VERIFY ?auto_12373 ?auto_12375 ?auto_12376 ?auto_12377 ?auto_12374 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12388 - OBJ
      ?auto_12390 - OBJ
      ?auto_12391 - OBJ
      ?auto_12392 - OBJ
      ?auto_12389 - LOCATION
    )
    :vars
    (
      ?auto_12393 - LOCATION
      ?auto_12395 - CITY
      ?auto_12397 - LOCATION
      ?auto_12396 - LOCATION
      ?auto_12394 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12390 ?auto_12388 ) ( GREATER-THAN ?auto_12391 ?auto_12388 ) ( GREATER-THAN ?auto_12391 ?auto_12390 ) ( GREATER-THAN ?auto_12392 ?auto_12388 ) ( GREATER-THAN ?auto_12392 ?auto_12390 ) ( GREATER-THAN ?auto_12392 ?auto_12391 ) ( IN-CITY ?auto_12393 ?auto_12395 ) ( IN-CITY ?auto_12389 ?auto_12395 ) ( not ( = ?auto_12389 ?auto_12393 ) ) ( OBJ-AT ?auto_12392 ?auto_12393 ) ( not ( = ?auto_12388 ?auto_12390 ) ) ( not ( = ?auto_12388 ?auto_12391 ) ) ( not ( = ?auto_12388 ?auto_12392 ) ) ( not ( = ?auto_12390 ?auto_12391 ) ) ( not ( = ?auto_12390 ?auto_12392 ) ) ( not ( = ?auto_12391 ?auto_12392 ) ) ( IN-CITY ?auto_12397 ?auto_12395 ) ( not ( = ?auto_12389 ?auto_12397 ) ) ( not ( = ?auto_12393 ?auto_12397 ) ) ( OBJ-AT ?auto_12391 ?auto_12397 ) ( IN-CITY ?auto_12396 ?auto_12395 ) ( not ( = ?auto_12389 ?auto_12396 ) ) ( not ( = ?auto_12393 ?auto_12396 ) ) ( not ( = ?auto_12397 ?auto_12396 ) ) ( OBJ-AT ?auto_12390 ?auto_12396 ) ( IN-TRUCK ?auto_12388 ?auto_12394 ) ( TRUCK-AT ?auto_12394 ?auto_12396 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12394 ?auto_12396 ?auto_12389 ?auto_12395 )
      ( DELIVER-4PKG ?auto_12388 ?auto_12390 ?auto_12391 ?auto_12392 ?auto_12389 )
      ( DELIVER-4PKG-VERIFY ?auto_12388 ?auto_12390 ?auto_12391 ?auto_12392 ?auto_12389 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12403 - OBJ
      ?auto_12405 - OBJ
      ?auto_12406 - OBJ
      ?auto_12407 - OBJ
      ?auto_12404 - LOCATION
    )
    :vars
    (
      ?auto_12412 - LOCATION
      ?auto_12409 - CITY
      ?auto_12410 - LOCATION
      ?auto_12408 - LOCATION
      ?auto_12411 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12405 ?auto_12403 ) ( GREATER-THAN ?auto_12406 ?auto_12403 ) ( GREATER-THAN ?auto_12406 ?auto_12405 ) ( GREATER-THAN ?auto_12407 ?auto_12403 ) ( GREATER-THAN ?auto_12407 ?auto_12405 ) ( GREATER-THAN ?auto_12407 ?auto_12406 ) ( IN-CITY ?auto_12412 ?auto_12409 ) ( IN-CITY ?auto_12404 ?auto_12409 ) ( not ( = ?auto_12404 ?auto_12412 ) ) ( OBJ-AT ?auto_12407 ?auto_12412 ) ( not ( = ?auto_12403 ?auto_12405 ) ) ( not ( = ?auto_12403 ?auto_12406 ) ) ( not ( = ?auto_12403 ?auto_12407 ) ) ( not ( = ?auto_12405 ?auto_12406 ) ) ( not ( = ?auto_12405 ?auto_12407 ) ) ( not ( = ?auto_12406 ?auto_12407 ) ) ( IN-CITY ?auto_12410 ?auto_12409 ) ( not ( = ?auto_12404 ?auto_12410 ) ) ( not ( = ?auto_12412 ?auto_12410 ) ) ( OBJ-AT ?auto_12406 ?auto_12410 ) ( IN-CITY ?auto_12408 ?auto_12409 ) ( not ( = ?auto_12404 ?auto_12408 ) ) ( not ( = ?auto_12412 ?auto_12408 ) ) ( not ( = ?auto_12410 ?auto_12408 ) ) ( OBJ-AT ?auto_12405 ?auto_12408 ) ( TRUCK-AT ?auto_12411 ?auto_12408 ) ( OBJ-AT ?auto_12403 ?auto_12408 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12403 ?auto_12411 ?auto_12408 )
      ( DELIVER-4PKG ?auto_12403 ?auto_12405 ?auto_12406 ?auto_12407 ?auto_12404 )
      ( DELIVER-4PKG-VERIFY ?auto_12403 ?auto_12405 ?auto_12406 ?auto_12407 ?auto_12404 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12418 - OBJ
      ?auto_12420 - OBJ
      ?auto_12421 - OBJ
      ?auto_12422 - OBJ
      ?auto_12419 - LOCATION
    )
    :vars
    (
      ?auto_12424 - LOCATION
      ?auto_12427 - CITY
      ?auto_12426 - LOCATION
      ?auto_12423 - LOCATION
      ?auto_12425 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12420 ?auto_12418 ) ( GREATER-THAN ?auto_12421 ?auto_12418 ) ( GREATER-THAN ?auto_12421 ?auto_12420 ) ( GREATER-THAN ?auto_12422 ?auto_12418 ) ( GREATER-THAN ?auto_12422 ?auto_12420 ) ( GREATER-THAN ?auto_12422 ?auto_12421 ) ( IN-CITY ?auto_12424 ?auto_12427 ) ( IN-CITY ?auto_12419 ?auto_12427 ) ( not ( = ?auto_12419 ?auto_12424 ) ) ( OBJ-AT ?auto_12422 ?auto_12424 ) ( not ( = ?auto_12418 ?auto_12420 ) ) ( not ( = ?auto_12418 ?auto_12421 ) ) ( not ( = ?auto_12418 ?auto_12422 ) ) ( not ( = ?auto_12420 ?auto_12421 ) ) ( not ( = ?auto_12420 ?auto_12422 ) ) ( not ( = ?auto_12421 ?auto_12422 ) ) ( IN-CITY ?auto_12426 ?auto_12427 ) ( not ( = ?auto_12419 ?auto_12426 ) ) ( not ( = ?auto_12424 ?auto_12426 ) ) ( OBJ-AT ?auto_12421 ?auto_12426 ) ( IN-CITY ?auto_12423 ?auto_12427 ) ( not ( = ?auto_12419 ?auto_12423 ) ) ( not ( = ?auto_12424 ?auto_12423 ) ) ( not ( = ?auto_12426 ?auto_12423 ) ) ( OBJ-AT ?auto_12420 ?auto_12423 ) ( OBJ-AT ?auto_12418 ?auto_12423 ) ( TRUCK-AT ?auto_12425 ?auto_12419 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12425 ?auto_12419 ?auto_12423 ?auto_12427 )
      ( DELIVER-4PKG ?auto_12418 ?auto_12420 ?auto_12421 ?auto_12422 ?auto_12419 )
      ( DELIVER-4PKG-VERIFY ?auto_12418 ?auto_12420 ?auto_12421 ?auto_12422 ?auto_12419 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12460 - OBJ
      ?auto_12462 - OBJ
      ?auto_12463 - OBJ
      ?auto_12464 - OBJ
      ?auto_12465 - OBJ
      ?auto_12461 - LOCATION
    )
    :vars
    (
      ?auto_12466 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12462 ?auto_12460 ) ( GREATER-THAN ?auto_12463 ?auto_12460 ) ( GREATER-THAN ?auto_12463 ?auto_12462 ) ( GREATER-THAN ?auto_12464 ?auto_12460 ) ( GREATER-THAN ?auto_12464 ?auto_12462 ) ( GREATER-THAN ?auto_12464 ?auto_12463 ) ( GREATER-THAN ?auto_12465 ?auto_12460 ) ( GREATER-THAN ?auto_12465 ?auto_12462 ) ( GREATER-THAN ?auto_12465 ?auto_12463 ) ( GREATER-THAN ?auto_12465 ?auto_12464 ) ( TRUCK-AT ?auto_12466 ?auto_12461 ) ( IN-TRUCK ?auto_12465 ?auto_12466 ) ( OBJ-AT ?auto_12460 ?auto_12461 ) ( OBJ-AT ?auto_12462 ?auto_12461 ) ( OBJ-AT ?auto_12463 ?auto_12461 ) ( OBJ-AT ?auto_12464 ?auto_12461 ) ( not ( = ?auto_12460 ?auto_12462 ) ) ( not ( = ?auto_12460 ?auto_12463 ) ) ( not ( = ?auto_12460 ?auto_12464 ) ) ( not ( = ?auto_12460 ?auto_12465 ) ) ( not ( = ?auto_12462 ?auto_12463 ) ) ( not ( = ?auto_12462 ?auto_12464 ) ) ( not ( = ?auto_12462 ?auto_12465 ) ) ( not ( = ?auto_12463 ?auto_12464 ) ) ( not ( = ?auto_12463 ?auto_12465 ) ) ( not ( = ?auto_12464 ?auto_12465 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12465 ?auto_12461 )
      ( DELIVER-5PKG-VERIFY ?auto_12460 ?auto_12462 ?auto_12463 ?auto_12464 ?auto_12465 ?auto_12461 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12473 - OBJ
      ?auto_12475 - OBJ
      ?auto_12476 - OBJ
      ?auto_12477 - OBJ
      ?auto_12478 - OBJ
      ?auto_12474 - LOCATION
    )
    :vars
    (
      ?auto_12480 - TRUCK
      ?auto_12479 - LOCATION
      ?auto_12481 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12475 ?auto_12473 ) ( GREATER-THAN ?auto_12476 ?auto_12473 ) ( GREATER-THAN ?auto_12476 ?auto_12475 ) ( GREATER-THAN ?auto_12477 ?auto_12473 ) ( GREATER-THAN ?auto_12477 ?auto_12475 ) ( GREATER-THAN ?auto_12477 ?auto_12476 ) ( GREATER-THAN ?auto_12478 ?auto_12473 ) ( GREATER-THAN ?auto_12478 ?auto_12475 ) ( GREATER-THAN ?auto_12478 ?auto_12476 ) ( GREATER-THAN ?auto_12478 ?auto_12477 ) ( IN-TRUCK ?auto_12478 ?auto_12480 ) ( TRUCK-AT ?auto_12480 ?auto_12479 ) ( IN-CITY ?auto_12479 ?auto_12481 ) ( IN-CITY ?auto_12474 ?auto_12481 ) ( not ( = ?auto_12474 ?auto_12479 ) ) ( OBJ-AT ?auto_12473 ?auto_12474 ) ( OBJ-AT ?auto_12475 ?auto_12474 ) ( OBJ-AT ?auto_12476 ?auto_12474 ) ( OBJ-AT ?auto_12477 ?auto_12474 ) ( not ( = ?auto_12473 ?auto_12475 ) ) ( not ( = ?auto_12473 ?auto_12476 ) ) ( not ( = ?auto_12473 ?auto_12477 ) ) ( not ( = ?auto_12473 ?auto_12478 ) ) ( not ( = ?auto_12475 ?auto_12476 ) ) ( not ( = ?auto_12475 ?auto_12477 ) ) ( not ( = ?auto_12475 ?auto_12478 ) ) ( not ( = ?auto_12476 ?auto_12477 ) ) ( not ( = ?auto_12476 ?auto_12478 ) ) ( not ( = ?auto_12477 ?auto_12478 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12478 ?auto_12474 )
      ( DELIVER-5PKG-VERIFY ?auto_12473 ?auto_12475 ?auto_12476 ?auto_12477 ?auto_12478 ?auto_12474 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12488 - OBJ
      ?auto_12490 - OBJ
      ?auto_12491 - OBJ
      ?auto_12492 - OBJ
      ?auto_12493 - OBJ
      ?auto_12489 - LOCATION
    )
    :vars
    (
      ?auto_12494 - TRUCK
      ?auto_12496 - LOCATION
      ?auto_12495 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12490 ?auto_12488 ) ( GREATER-THAN ?auto_12491 ?auto_12488 ) ( GREATER-THAN ?auto_12491 ?auto_12490 ) ( GREATER-THAN ?auto_12492 ?auto_12488 ) ( GREATER-THAN ?auto_12492 ?auto_12490 ) ( GREATER-THAN ?auto_12492 ?auto_12491 ) ( GREATER-THAN ?auto_12493 ?auto_12488 ) ( GREATER-THAN ?auto_12493 ?auto_12490 ) ( GREATER-THAN ?auto_12493 ?auto_12491 ) ( GREATER-THAN ?auto_12493 ?auto_12492 ) ( TRUCK-AT ?auto_12494 ?auto_12496 ) ( IN-CITY ?auto_12496 ?auto_12495 ) ( IN-CITY ?auto_12489 ?auto_12495 ) ( not ( = ?auto_12489 ?auto_12496 ) ) ( OBJ-AT ?auto_12493 ?auto_12496 ) ( OBJ-AT ?auto_12488 ?auto_12489 ) ( OBJ-AT ?auto_12490 ?auto_12489 ) ( OBJ-AT ?auto_12491 ?auto_12489 ) ( OBJ-AT ?auto_12492 ?auto_12489 ) ( not ( = ?auto_12488 ?auto_12490 ) ) ( not ( = ?auto_12488 ?auto_12491 ) ) ( not ( = ?auto_12488 ?auto_12492 ) ) ( not ( = ?auto_12488 ?auto_12493 ) ) ( not ( = ?auto_12490 ?auto_12491 ) ) ( not ( = ?auto_12490 ?auto_12492 ) ) ( not ( = ?auto_12490 ?auto_12493 ) ) ( not ( = ?auto_12491 ?auto_12492 ) ) ( not ( = ?auto_12491 ?auto_12493 ) ) ( not ( = ?auto_12492 ?auto_12493 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12493 ?auto_12489 )
      ( DELIVER-5PKG-VERIFY ?auto_12488 ?auto_12490 ?auto_12491 ?auto_12492 ?auto_12493 ?auto_12489 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12503 - OBJ
      ?auto_12505 - OBJ
      ?auto_12506 - OBJ
      ?auto_12507 - OBJ
      ?auto_12508 - OBJ
      ?auto_12504 - LOCATION
    )
    :vars
    (
      ?auto_12510 - LOCATION
      ?auto_12509 - CITY
      ?auto_12511 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12505 ?auto_12503 ) ( GREATER-THAN ?auto_12506 ?auto_12503 ) ( GREATER-THAN ?auto_12506 ?auto_12505 ) ( GREATER-THAN ?auto_12507 ?auto_12503 ) ( GREATER-THAN ?auto_12507 ?auto_12505 ) ( GREATER-THAN ?auto_12507 ?auto_12506 ) ( GREATER-THAN ?auto_12508 ?auto_12503 ) ( GREATER-THAN ?auto_12508 ?auto_12505 ) ( GREATER-THAN ?auto_12508 ?auto_12506 ) ( GREATER-THAN ?auto_12508 ?auto_12507 ) ( IN-CITY ?auto_12510 ?auto_12509 ) ( IN-CITY ?auto_12504 ?auto_12509 ) ( not ( = ?auto_12504 ?auto_12510 ) ) ( OBJ-AT ?auto_12508 ?auto_12510 ) ( TRUCK-AT ?auto_12511 ?auto_12504 ) ( OBJ-AT ?auto_12503 ?auto_12504 ) ( OBJ-AT ?auto_12505 ?auto_12504 ) ( OBJ-AT ?auto_12506 ?auto_12504 ) ( OBJ-AT ?auto_12507 ?auto_12504 ) ( not ( = ?auto_12503 ?auto_12505 ) ) ( not ( = ?auto_12503 ?auto_12506 ) ) ( not ( = ?auto_12503 ?auto_12507 ) ) ( not ( = ?auto_12503 ?auto_12508 ) ) ( not ( = ?auto_12505 ?auto_12506 ) ) ( not ( = ?auto_12505 ?auto_12507 ) ) ( not ( = ?auto_12505 ?auto_12508 ) ) ( not ( = ?auto_12506 ?auto_12507 ) ) ( not ( = ?auto_12506 ?auto_12508 ) ) ( not ( = ?auto_12507 ?auto_12508 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12508 ?auto_12504 )
      ( DELIVER-5PKG-VERIFY ?auto_12503 ?auto_12505 ?auto_12506 ?auto_12507 ?auto_12508 ?auto_12504 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12518 - OBJ
      ?auto_12520 - OBJ
      ?auto_12521 - OBJ
      ?auto_12522 - OBJ
      ?auto_12523 - OBJ
      ?auto_12519 - LOCATION
    )
    :vars
    (
      ?auto_12526 - LOCATION
      ?auto_12524 - CITY
      ?auto_12525 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12520 ?auto_12518 ) ( GREATER-THAN ?auto_12521 ?auto_12518 ) ( GREATER-THAN ?auto_12521 ?auto_12520 ) ( GREATER-THAN ?auto_12522 ?auto_12518 ) ( GREATER-THAN ?auto_12522 ?auto_12520 ) ( GREATER-THAN ?auto_12522 ?auto_12521 ) ( GREATER-THAN ?auto_12523 ?auto_12518 ) ( GREATER-THAN ?auto_12523 ?auto_12520 ) ( GREATER-THAN ?auto_12523 ?auto_12521 ) ( GREATER-THAN ?auto_12523 ?auto_12522 ) ( IN-CITY ?auto_12526 ?auto_12524 ) ( IN-CITY ?auto_12519 ?auto_12524 ) ( not ( = ?auto_12519 ?auto_12526 ) ) ( OBJ-AT ?auto_12523 ?auto_12526 ) ( TRUCK-AT ?auto_12525 ?auto_12519 ) ( OBJ-AT ?auto_12518 ?auto_12519 ) ( OBJ-AT ?auto_12520 ?auto_12519 ) ( OBJ-AT ?auto_12521 ?auto_12519 ) ( not ( = ?auto_12518 ?auto_12520 ) ) ( not ( = ?auto_12518 ?auto_12521 ) ) ( not ( = ?auto_12518 ?auto_12522 ) ) ( not ( = ?auto_12518 ?auto_12523 ) ) ( not ( = ?auto_12520 ?auto_12521 ) ) ( not ( = ?auto_12520 ?auto_12522 ) ) ( not ( = ?auto_12520 ?auto_12523 ) ) ( not ( = ?auto_12521 ?auto_12522 ) ) ( not ( = ?auto_12521 ?auto_12523 ) ) ( not ( = ?auto_12522 ?auto_12523 ) ) ( IN-TRUCK ?auto_12522 ?auto_12525 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12522 ?auto_12519 )
      ( DELIVER-5PKG ?auto_12518 ?auto_12520 ?auto_12521 ?auto_12522 ?auto_12523 ?auto_12519 )
      ( DELIVER-5PKG-VERIFY ?auto_12518 ?auto_12520 ?auto_12521 ?auto_12522 ?auto_12523 ?auto_12519 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12533 - OBJ
      ?auto_12535 - OBJ
      ?auto_12536 - OBJ
      ?auto_12537 - OBJ
      ?auto_12538 - OBJ
      ?auto_12534 - LOCATION
    )
    :vars
    (
      ?auto_12541 - LOCATION
      ?auto_12540 - CITY
      ?auto_12539 - TRUCK
      ?auto_12542 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12535 ?auto_12533 ) ( GREATER-THAN ?auto_12536 ?auto_12533 ) ( GREATER-THAN ?auto_12536 ?auto_12535 ) ( GREATER-THAN ?auto_12537 ?auto_12533 ) ( GREATER-THAN ?auto_12537 ?auto_12535 ) ( GREATER-THAN ?auto_12537 ?auto_12536 ) ( GREATER-THAN ?auto_12538 ?auto_12533 ) ( GREATER-THAN ?auto_12538 ?auto_12535 ) ( GREATER-THAN ?auto_12538 ?auto_12536 ) ( GREATER-THAN ?auto_12538 ?auto_12537 ) ( IN-CITY ?auto_12541 ?auto_12540 ) ( IN-CITY ?auto_12534 ?auto_12540 ) ( not ( = ?auto_12534 ?auto_12541 ) ) ( OBJ-AT ?auto_12538 ?auto_12541 ) ( OBJ-AT ?auto_12533 ?auto_12534 ) ( OBJ-AT ?auto_12535 ?auto_12534 ) ( OBJ-AT ?auto_12536 ?auto_12534 ) ( not ( = ?auto_12533 ?auto_12535 ) ) ( not ( = ?auto_12533 ?auto_12536 ) ) ( not ( = ?auto_12533 ?auto_12537 ) ) ( not ( = ?auto_12533 ?auto_12538 ) ) ( not ( = ?auto_12535 ?auto_12536 ) ) ( not ( = ?auto_12535 ?auto_12537 ) ) ( not ( = ?auto_12535 ?auto_12538 ) ) ( not ( = ?auto_12536 ?auto_12537 ) ) ( not ( = ?auto_12536 ?auto_12538 ) ) ( not ( = ?auto_12537 ?auto_12538 ) ) ( IN-TRUCK ?auto_12537 ?auto_12539 ) ( TRUCK-AT ?auto_12539 ?auto_12542 ) ( IN-CITY ?auto_12542 ?auto_12540 ) ( not ( = ?auto_12534 ?auto_12542 ) ) ( not ( = ?auto_12541 ?auto_12542 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12539 ?auto_12542 ?auto_12534 ?auto_12540 )
      ( DELIVER-5PKG ?auto_12533 ?auto_12535 ?auto_12536 ?auto_12537 ?auto_12538 ?auto_12534 )
      ( DELIVER-5PKG-VERIFY ?auto_12533 ?auto_12535 ?auto_12536 ?auto_12537 ?auto_12538 ?auto_12534 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12549 - OBJ
      ?auto_12551 - OBJ
      ?auto_12552 - OBJ
      ?auto_12553 - OBJ
      ?auto_12554 - OBJ
      ?auto_12550 - LOCATION
    )
    :vars
    (
      ?auto_12558 - LOCATION
      ?auto_12555 - CITY
      ?auto_12556 - TRUCK
      ?auto_12557 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12551 ?auto_12549 ) ( GREATER-THAN ?auto_12552 ?auto_12549 ) ( GREATER-THAN ?auto_12552 ?auto_12551 ) ( GREATER-THAN ?auto_12553 ?auto_12549 ) ( GREATER-THAN ?auto_12553 ?auto_12551 ) ( GREATER-THAN ?auto_12553 ?auto_12552 ) ( GREATER-THAN ?auto_12554 ?auto_12549 ) ( GREATER-THAN ?auto_12554 ?auto_12551 ) ( GREATER-THAN ?auto_12554 ?auto_12552 ) ( GREATER-THAN ?auto_12554 ?auto_12553 ) ( IN-CITY ?auto_12558 ?auto_12555 ) ( IN-CITY ?auto_12550 ?auto_12555 ) ( not ( = ?auto_12550 ?auto_12558 ) ) ( OBJ-AT ?auto_12554 ?auto_12558 ) ( OBJ-AT ?auto_12549 ?auto_12550 ) ( OBJ-AT ?auto_12551 ?auto_12550 ) ( OBJ-AT ?auto_12552 ?auto_12550 ) ( not ( = ?auto_12549 ?auto_12551 ) ) ( not ( = ?auto_12549 ?auto_12552 ) ) ( not ( = ?auto_12549 ?auto_12553 ) ) ( not ( = ?auto_12549 ?auto_12554 ) ) ( not ( = ?auto_12551 ?auto_12552 ) ) ( not ( = ?auto_12551 ?auto_12553 ) ) ( not ( = ?auto_12551 ?auto_12554 ) ) ( not ( = ?auto_12552 ?auto_12553 ) ) ( not ( = ?auto_12552 ?auto_12554 ) ) ( not ( = ?auto_12553 ?auto_12554 ) ) ( TRUCK-AT ?auto_12556 ?auto_12557 ) ( IN-CITY ?auto_12557 ?auto_12555 ) ( not ( = ?auto_12550 ?auto_12557 ) ) ( not ( = ?auto_12558 ?auto_12557 ) ) ( OBJ-AT ?auto_12553 ?auto_12557 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12553 ?auto_12556 ?auto_12557 )
      ( DELIVER-5PKG ?auto_12549 ?auto_12551 ?auto_12552 ?auto_12553 ?auto_12554 ?auto_12550 )
      ( DELIVER-5PKG-VERIFY ?auto_12549 ?auto_12551 ?auto_12552 ?auto_12553 ?auto_12554 ?auto_12550 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12565 - OBJ
      ?auto_12567 - OBJ
      ?auto_12568 - OBJ
      ?auto_12569 - OBJ
      ?auto_12570 - OBJ
      ?auto_12566 - LOCATION
    )
    :vars
    (
      ?auto_12572 - LOCATION
      ?auto_12573 - CITY
      ?auto_12571 - LOCATION
      ?auto_12574 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12567 ?auto_12565 ) ( GREATER-THAN ?auto_12568 ?auto_12565 ) ( GREATER-THAN ?auto_12568 ?auto_12567 ) ( GREATER-THAN ?auto_12569 ?auto_12565 ) ( GREATER-THAN ?auto_12569 ?auto_12567 ) ( GREATER-THAN ?auto_12569 ?auto_12568 ) ( GREATER-THAN ?auto_12570 ?auto_12565 ) ( GREATER-THAN ?auto_12570 ?auto_12567 ) ( GREATER-THAN ?auto_12570 ?auto_12568 ) ( GREATER-THAN ?auto_12570 ?auto_12569 ) ( IN-CITY ?auto_12572 ?auto_12573 ) ( IN-CITY ?auto_12566 ?auto_12573 ) ( not ( = ?auto_12566 ?auto_12572 ) ) ( OBJ-AT ?auto_12570 ?auto_12572 ) ( OBJ-AT ?auto_12565 ?auto_12566 ) ( OBJ-AT ?auto_12567 ?auto_12566 ) ( OBJ-AT ?auto_12568 ?auto_12566 ) ( not ( = ?auto_12565 ?auto_12567 ) ) ( not ( = ?auto_12565 ?auto_12568 ) ) ( not ( = ?auto_12565 ?auto_12569 ) ) ( not ( = ?auto_12565 ?auto_12570 ) ) ( not ( = ?auto_12567 ?auto_12568 ) ) ( not ( = ?auto_12567 ?auto_12569 ) ) ( not ( = ?auto_12567 ?auto_12570 ) ) ( not ( = ?auto_12568 ?auto_12569 ) ) ( not ( = ?auto_12568 ?auto_12570 ) ) ( not ( = ?auto_12569 ?auto_12570 ) ) ( IN-CITY ?auto_12571 ?auto_12573 ) ( not ( = ?auto_12566 ?auto_12571 ) ) ( not ( = ?auto_12572 ?auto_12571 ) ) ( OBJ-AT ?auto_12569 ?auto_12571 ) ( TRUCK-AT ?auto_12574 ?auto_12566 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12574 ?auto_12566 ?auto_12571 ?auto_12573 )
      ( DELIVER-5PKG ?auto_12565 ?auto_12567 ?auto_12568 ?auto_12569 ?auto_12570 ?auto_12566 )
      ( DELIVER-5PKG-VERIFY ?auto_12565 ?auto_12567 ?auto_12568 ?auto_12569 ?auto_12570 ?auto_12566 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12581 - OBJ
      ?auto_12583 - OBJ
      ?auto_12584 - OBJ
      ?auto_12585 - OBJ
      ?auto_12586 - OBJ
      ?auto_12582 - LOCATION
    )
    :vars
    (
      ?auto_12587 - LOCATION
      ?auto_12589 - CITY
      ?auto_12588 - LOCATION
      ?auto_12590 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12583 ?auto_12581 ) ( GREATER-THAN ?auto_12584 ?auto_12581 ) ( GREATER-THAN ?auto_12584 ?auto_12583 ) ( GREATER-THAN ?auto_12585 ?auto_12581 ) ( GREATER-THAN ?auto_12585 ?auto_12583 ) ( GREATER-THAN ?auto_12585 ?auto_12584 ) ( GREATER-THAN ?auto_12586 ?auto_12581 ) ( GREATER-THAN ?auto_12586 ?auto_12583 ) ( GREATER-THAN ?auto_12586 ?auto_12584 ) ( GREATER-THAN ?auto_12586 ?auto_12585 ) ( IN-CITY ?auto_12587 ?auto_12589 ) ( IN-CITY ?auto_12582 ?auto_12589 ) ( not ( = ?auto_12582 ?auto_12587 ) ) ( OBJ-AT ?auto_12586 ?auto_12587 ) ( OBJ-AT ?auto_12581 ?auto_12582 ) ( OBJ-AT ?auto_12583 ?auto_12582 ) ( not ( = ?auto_12581 ?auto_12583 ) ) ( not ( = ?auto_12581 ?auto_12584 ) ) ( not ( = ?auto_12581 ?auto_12585 ) ) ( not ( = ?auto_12581 ?auto_12586 ) ) ( not ( = ?auto_12583 ?auto_12584 ) ) ( not ( = ?auto_12583 ?auto_12585 ) ) ( not ( = ?auto_12583 ?auto_12586 ) ) ( not ( = ?auto_12584 ?auto_12585 ) ) ( not ( = ?auto_12584 ?auto_12586 ) ) ( not ( = ?auto_12585 ?auto_12586 ) ) ( IN-CITY ?auto_12588 ?auto_12589 ) ( not ( = ?auto_12582 ?auto_12588 ) ) ( not ( = ?auto_12587 ?auto_12588 ) ) ( OBJ-AT ?auto_12585 ?auto_12588 ) ( TRUCK-AT ?auto_12590 ?auto_12582 ) ( IN-TRUCK ?auto_12584 ?auto_12590 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12584 ?auto_12582 )
      ( DELIVER-5PKG ?auto_12581 ?auto_12583 ?auto_12584 ?auto_12585 ?auto_12586 ?auto_12582 )
      ( DELIVER-5PKG-VERIFY ?auto_12581 ?auto_12583 ?auto_12584 ?auto_12585 ?auto_12586 ?auto_12582 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12597 - OBJ
      ?auto_12599 - OBJ
      ?auto_12600 - OBJ
      ?auto_12601 - OBJ
      ?auto_12602 - OBJ
      ?auto_12598 - LOCATION
    )
    :vars
    (
      ?auto_12606 - LOCATION
      ?auto_12604 - CITY
      ?auto_12603 - LOCATION
      ?auto_12605 - TRUCK
      ?auto_12607 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12599 ?auto_12597 ) ( GREATER-THAN ?auto_12600 ?auto_12597 ) ( GREATER-THAN ?auto_12600 ?auto_12599 ) ( GREATER-THAN ?auto_12601 ?auto_12597 ) ( GREATER-THAN ?auto_12601 ?auto_12599 ) ( GREATER-THAN ?auto_12601 ?auto_12600 ) ( GREATER-THAN ?auto_12602 ?auto_12597 ) ( GREATER-THAN ?auto_12602 ?auto_12599 ) ( GREATER-THAN ?auto_12602 ?auto_12600 ) ( GREATER-THAN ?auto_12602 ?auto_12601 ) ( IN-CITY ?auto_12606 ?auto_12604 ) ( IN-CITY ?auto_12598 ?auto_12604 ) ( not ( = ?auto_12598 ?auto_12606 ) ) ( OBJ-AT ?auto_12602 ?auto_12606 ) ( OBJ-AT ?auto_12597 ?auto_12598 ) ( OBJ-AT ?auto_12599 ?auto_12598 ) ( not ( = ?auto_12597 ?auto_12599 ) ) ( not ( = ?auto_12597 ?auto_12600 ) ) ( not ( = ?auto_12597 ?auto_12601 ) ) ( not ( = ?auto_12597 ?auto_12602 ) ) ( not ( = ?auto_12599 ?auto_12600 ) ) ( not ( = ?auto_12599 ?auto_12601 ) ) ( not ( = ?auto_12599 ?auto_12602 ) ) ( not ( = ?auto_12600 ?auto_12601 ) ) ( not ( = ?auto_12600 ?auto_12602 ) ) ( not ( = ?auto_12601 ?auto_12602 ) ) ( IN-CITY ?auto_12603 ?auto_12604 ) ( not ( = ?auto_12598 ?auto_12603 ) ) ( not ( = ?auto_12606 ?auto_12603 ) ) ( OBJ-AT ?auto_12601 ?auto_12603 ) ( IN-TRUCK ?auto_12600 ?auto_12605 ) ( TRUCK-AT ?auto_12605 ?auto_12607 ) ( IN-CITY ?auto_12607 ?auto_12604 ) ( not ( = ?auto_12598 ?auto_12607 ) ) ( not ( = ?auto_12606 ?auto_12607 ) ) ( not ( = ?auto_12603 ?auto_12607 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12605 ?auto_12607 ?auto_12598 ?auto_12604 )
      ( DELIVER-5PKG ?auto_12597 ?auto_12599 ?auto_12600 ?auto_12601 ?auto_12602 ?auto_12598 )
      ( DELIVER-5PKG-VERIFY ?auto_12597 ?auto_12599 ?auto_12600 ?auto_12601 ?auto_12602 ?auto_12598 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12614 - OBJ
      ?auto_12616 - OBJ
      ?auto_12617 - OBJ
      ?auto_12618 - OBJ
      ?auto_12619 - OBJ
      ?auto_12615 - LOCATION
    )
    :vars
    (
      ?auto_12623 - LOCATION
      ?auto_12624 - CITY
      ?auto_12620 - LOCATION
      ?auto_12621 - TRUCK
      ?auto_12622 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12616 ?auto_12614 ) ( GREATER-THAN ?auto_12617 ?auto_12614 ) ( GREATER-THAN ?auto_12617 ?auto_12616 ) ( GREATER-THAN ?auto_12618 ?auto_12614 ) ( GREATER-THAN ?auto_12618 ?auto_12616 ) ( GREATER-THAN ?auto_12618 ?auto_12617 ) ( GREATER-THAN ?auto_12619 ?auto_12614 ) ( GREATER-THAN ?auto_12619 ?auto_12616 ) ( GREATER-THAN ?auto_12619 ?auto_12617 ) ( GREATER-THAN ?auto_12619 ?auto_12618 ) ( IN-CITY ?auto_12623 ?auto_12624 ) ( IN-CITY ?auto_12615 ?auto_12624 ) ( not ( = ?auto_12615 ?auto_12623 ) ) ( OBJ-AT ?auto_12619 ?auto_12623 ) ( OBJ-AT ?auto_12614 ?auto_12615 ) ( OBJ-AT ?auto_12616 ?auto_12615 ) ( not ( = ?auto_12614 ?auto_12616 ) ) ( not ( = ?auto_12614 ?auto_12617 ) ) ( not ( = ?auto_12614 ?auto_12618 ) ) ( not ( = ?auto_12614 ?auto_12619 ) ) ( not ( = ?auto_12616 ?auto_12617 ) ) ( not ( = ?auto_12616 ?auto_12618 ) ) ( not ( = ?auto_12616 ?auto_12619 ) ) ( not ( = ?auto_12617 ?auto_12618 ) ) ( not ( = ?auto_12617 ?auto_12619 ) ) ( not ( = ?auto_12618 ?auto_12619 ) ) ( IN-CITY ?auto_12620 ?auto_12624 ) ( not ( = ?auto_12615 ?auto_12620 ) ) ( not ( = ?auto_12623 ?auto_12620 ) ) ( OBJ-AT ?auto_12618 ?auto_12620 ) ( TRUCK-AT ?auto_12621 ?auto_12622 ) ( IN-CITY ?auto_12622 ?auto_12624 ) ( not ( = ?auto_12615 ?auto_12622 ) ) ( not ( = ?auto_12623 ?auto_12622 ) ) ( not ( = ?auto_12620 ?auto_12622 ) ) ( OBJ-AT ?auto_12617 ?auto_12622 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12617 ?auto_12621 ?auto_12622 )
      ( DELIVER-5PKG ?auto_12614 ?auto_12616 ?auto_12617 ?auto_12618 ?auto_12619 ?auto_12615 )
      ( DELIVER-5PKG-VERIFY ?auto_12614 ?auto_12616 ?auto_12617 ?auto_12618 ?auto_12619 ?auto_12615 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12631 - OBJ
      ?auto_12633 - OBJ
      ?auto_12634 - OBJ
      ?auto_12635 - OBJ
      ?auto_12636 - OBJ
      ?auto_12632 - LOCATION
    )
    :vars
    (
      ?auto_12639 - LOCATION
      ?auto_12637 - CITY
      ?auto_12638 - LOCATION
      ?auto_12640 - LOCATION
      ?auto_12641 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12633 ?auto_12631 ) ( GREATER-THAN ?auto_12634 ?auto_12631 ) ( GREATER-THAN ?auto_12634 ?auto_12633 ) ( GREATER-THAN ?auto_12635 ?auto_12631 ) ( GREATER-THAN ?auto_12635 ?auto_12633 ) ( GREATER-THAN ?auto_12635 ?auto_12634 ) ( GREATER-THAN ?auto_12636 ?auto_12631 ) ( GREATER-THAN ?auto_12636 ?auto_12633 ) ( GREATER-THAN ?auto_12636 ?auto_12634 ) ( GREATER-THAN ?auto_12636 ?auto_12635 ) ( IN-CITY ?auto_12639 ?auto_12637 ) ( IN-CITY ?auto_12632 ?auto_12637 ) ( not ( = ?auto_12632 ?auto_12639 ) ) ( OBJ-AT ?auto_12636 ?auto_12639 ) ( OBJ-AT ?auto_12631 ?auto_12632 ) ( OBJ-AT ?auto_12633 ?auto_12632 ) ( not ( = ?auto_12631 ?auto_12633 ) ) ( not ( = ?auto_12631 ?auto_12634 ) ) ( not ( = ?auto_12631 ?auto_12635 ) ) ( not ( = ?auto_12631 ?auto_12636 ) ) ( not ( = ?auto_12633 ?auto_12634 ) ) ( not ( = ?auto_12633 ?auto_12635 ) ) ( not ( = ?auto_12633 ?auto_12636 ) ) ( not ( = ?auto_12634 ?auto_12635 ) ) ( not ( = ?auto_12634 ?auto_12636 ) ) ( not ( = ?auto_12635 ?auto_12636 ) ) ( IN-CITY ?auto_12638 ?auto_12637 ) ( not ( = ?auto_12632 ?auto_12638 ) ) ( not ( = ?auto_12639 ?auto_12638 ) ) ( OBJ-AT ?auto_12635 ?auto_12638 ) ( IN-CITY ?auto_12640 ?auto_12637 ) ( not ( = ?auto_12632 ?auto_12640 ) ) ( not ( = ?auto_12639 ?auto_12640 ) ) ( not ( = ?auto_12638 ?auto_12640 ) ) ( OBJ-AT ?auto_12634 ?auto_12640 ) ( TRUCK-AT ?auto_12641 ?auto_12632 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12641 ?auto_12632 ?auto_12640 ?auto_12637 )
      ( DELIVER-5PKG ?auto_12631 ?auto_12633 ?auto_12634 ?auto_12635 ?auto_12636 ?auto_12632 )
      ( DELIVER-5PKG-VERIFY ?auto_12631 ?auto_12633 ?auto_12634 ?auto_12635 ?auto_12636 ?auto_12632 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12648 - OBJ
      ?auto_12650 - OBJ
      ?auto_12651 - OBJ
      ?auto_12652 - OBJ
      ?auto_12653 - OBJ
      ?auto_12649 - LOCATION
    )
    :vars
    (
      ?auto_12654 - LOCATION
      ?auto_12656 - CITY
      ?auto_12658 - LOCATION
      ?auto_12657 - LOCATION
      ?auto_12655 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12650 ?auto_12648 ) ( GREATER-THAN ?auto_12651 ?auto_12648 ) ( GREATER-THAN ?auto_12651 ?auto_12650 ) ( GREATER-THAN ?auto_12652 ?auto_12648 ) ( GREATER-THAN ?auto_12652 ?auto_12650 ) ( GREATER-THAN ?auto_12652 ?auto_12651 ) ( GREATER-THAN ?auto_12653 ?auto_12648 ) ( GREATER-THAN ?auto_12653 ?auto_12650 ) ( GREATER-THAN ?auto_12653 ?auto_12651 ) ( GREATER-THAN ?auto_12653 ?auto_12652 ) ( IN-CITY ?auto_12654 ?auto_12656 ) ( IN-CITY ?auto_12649 ?auto_12656 ) ( not ( = ?auto_12649 ?auto_12654 ) ) ( OBJ-AT ?auto_12653 ?auto_12654 ) ( OBJ-AT ?auto_12648 ?auto_12649 ) ( not ( = ?auto_12648 ?auto_12650 ) ) ( not ( = ?auto_12648 ?auto_12651 ) ) ( not ( = ?auto_12648 ?auto_12652 ) ) ( not ( = ?auto_12648 ?auto_12653 ) ) ( not ( = ?auto_12650 ?auto_12651 ) ) ( not ( = ?auto_12650 ?auto_12652 ) ) ( not ( = ?auto_12650 ?auto_12653 ) ) ( not ( = ?auto_12651 ?auto_12652 ) ) ( not ( = ?auto_12651 ?auto_12653 ) ) ( not ( = ?auto_12652 ?auto_12653 ) ) ( IN-CITY ?auto_12658 ?auto_12656 ) ( not ( = ?auto_12649 ?auto_12658 ) ) ( not ( = ?auto_12654 ?auto_12658 ) ) ( OBJ-AT ?auto_12652 ?auto_12658 ) ( IN-CITY ?auto_12657 ?auto_12656 ) ( not ( = ?auto_12649 ?auto_12657 ) ) ( not ( = ?auto_12654 ?auto_12657 ) ) ( not ( = ?auto_12658 ?auto_12657 ) ) ( OBJ-AT ?auto_12651 ?auto_12657 ) ( TRUCK-AT ?auto_12655 ?auto_12649 ) ( IN-TRUCK ?auto_12650 ?auto_12655 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12650 ?auto_12649 )
      ( DELIVER-5PKG ?auto_12648 ?auto_12650 ?auto_12651 ?auto_12652 ?auto_12653 ?auto_12649 )
      ( DELIVER-5PKG-VERIFY ?auto_12648 ?auto_12650 ?auto_12651 ?auto_12652 ?auto_12653 ?auto_12649 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12665 - OBJ
      ?auto_12667 - OBJ
      ?auto_12668 - OBJ
      ?auto_12669 - OBJ
      ?auto_12670 - OBJ
      ?auto_12666 - LOCATION
    )
    :vars
    (
      ?auto_12671 - LOCATION
      ?auto_12672 - CITY
      ?auto_12675 - LOCATION
      ?auto_12674 - LOCATION
      ?auto_12673 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12667 ?auto_12665 ) ( GREATER-THAN ?auto_12668 ?auto_12665 ) ( GREATER-THAN ?auto_12668 ?auto_12667 ) ( GREATER-THAN ?auto_12669 ?auto_12665 ) ( GREATER-THAN ?auto_12669 ?auto_12667 ) ( GREATER-THAN ?auto_12669 ?auto_12668 ) ( GREATER-THAN ?auto_12670 ?auto_12665 ) ( GREATER-THAN ?auto_12670 ?auto_12667 ) ( GREATER-THAN ?auto_12670 ?auto_12668 ) ( GREATER-THAN ?auto_12670 ?auto_12669 ) ( IN-CITY ?auto_12671 ?auto_12672 ) ( IN-CITY ?auto_12666 ?auto_12672 ) ( not ( = ?auto_12666 ?auto_12671 ) ) ( OBJ-AT ?auto_12670 ?auto_12671 ) ( OBJ-AT ?auto_12665 ?auto_12666 ) ( not ( = ?auto_12665 ?auto_12667 ) ) ( not ( = ?auto_12665 ?auto_12668 ) ) ( not ( = ?auto_12665 ?auto_12669 ) ) ( not ( = ?auto_12665 ?auto_12670 ) ) ( not ( = ?auto_12667 ?auto_12668 ) ) ( not ( = ?auto_12667 ?auto_12669 ) ) ( not ( = ?auto_12667 ?auto_12670 ) ) ( not ( = ?auto_12668 ?auto_12669 ) ) ( not ( = ?auto_12668 ?auto_12670 ) ) ( not ( = ?auto_12669 ?auto_12670 ) ) ( IN-CITY ?auto_12675 ?auto_12672 ) ( not ( = ?auto_12666 ?auto_12675 ) ) ( not ( = ?auto_12671 ?auto_12675 ) ) ( OBJ-AT ?auto_12669 ?auto_12675 ) ( IN-CITY ?auto_12674 ?auto_12672 ) ( not ( = ?auto_12666 ?auto_12674 ) ) ( not ( = ?auto_12671 ?auto_12674 ) ) ( not ( = ?auto_12675 ?auto_12674 ) ) ( OBJ-AT ?auto_12668 ?auto_12674 ) ( IN-TRUCK ?auto_12667 ?auto_12673 ) ( TRUCK-AT ?auto_12673 ?auto_12671 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12673 ?auto_12671 ?auto_12666 ?auto_12672 )
      ( DELIVER-5PKG ?auto_12665 ?auto_12667 ?auto_12668 ?auto_12669 ?auto_12670 ?auto_12666 )
      ( DELIVER-5PKG-VERIFY ?auto_12665 ?auto_12667 ?auto_12668 ?auto_12669 ?auto_12670 ?auto_12666 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12682 - OBJ
      ?auto_12684 - OBJ
      ?auto_12685 - OBJ
      ?auto_12686 - OBJ
      ?auto_12687 - OBJ
      ?auto_12683 - LOCATION
    )
    :vars
    (
      ?auto_12689 - LOCATION
      ?auto_12688 - CITY
      ?auto_12690 - LOCATION
      ?auto_12691 - LOCATION
      ?auto_12692 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12684 ?auto_12682 ) ( GREATER-THAN ?auto_12685 ?auto_12682 ) ( GREATER-THAN ?auto_12685 ?auto_12684 ) ( GREATER-THAN ?auto_12686 ?auto_12682 ) ( GREATER-THAN ?auto_12686 ?auto_12684 ) ( GREATER-THAN ?auto_12686 ?auto_12685 ) ( GREATER-THAN ?auto_12687 ?auto_12682 ) ( GREATER-THAN ?auto_12687 ?auto_12684 ) ( GREATER-THAN ?auto_12687 ?auto_12685 ) ( GREATER-THAN ?auto_12687 ?auto_12686 ) ( IN-CITY ?auto_12689 ?auto_12688 ) ( IN-CITY ?auto_12683 ?auto_12688 ) ( not ( = ?auto_12683 ?auto_12689 ) ) ( OBJ-AT ?auto_12687 ?auto_12689 ) ( OBJ-AT ?auto_12682 ?auto_12683 ) ( not ( = ?auto_12682 ?auto_12684 ) ) ( not ( = ?auto_12682 ?auto_12685 ) ) ( not ( = ?auto_12682 ?auto_12686 ) ) ( not ( = ?auto_12682 ?auto_12687 ) ) ( not ( = ?auto_12684 ?auto_12685 ) ) ( not ( = ?auto_12684 ?auto_12686 ) ) ( not ( = ?auto_12684 ?auto_12687 ) ) ( not ( = ?auto_12685 ?auto_12686 ) ) ( not ( = ?auto_12685 ?auto_12687 ) ) ( not ( = ?auto_12686 ?auto_12687 ) ) ( IN-CITY ?auto_12690 ?auto_12688 ) ( not ( = ?auto_12683 ?auto_12690 ) ) ( not ( = ?auto_12689 ?auto_12690 ) ) ( OBJ-AT ?auto_12686 ?auto_12690 ) ( IN-CITY ?auto_12691 ?auto_12688 ) ( not ( = ?auto_12683 ?auto_12691 ) ) ( not ( = ?auto_12689 ?auto_12691 ) ) ( not ( = ?auto_12690 ?auto_12691 ) ) ( OBJ-AT ?auto_12685 ?auto_12691 ) ( TRUCK-AT ?auto_12692 ?auto_12689 ) ( OBJ-AT ?auto_12684 ?auto_12689 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12684 ?auto_12692 ?auto_12689 )
      ( DELIVER-5PKG ?auto_12682 ?auto_12684 ?auto_12685 ?auto_12686 ?auto_12687 ?auto_12683 )
      ( DELIVER-5PKG-VERIFY ?auto_12682 ?auto_12684 ?auto_12685 ?auto_12686 ?auto_12687 ?auto_12683 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12699 - OBJ
      ?auto_12701 - OBJ
      ?auto_12702 - OBJ
      ?auto_12703 - OBJ
      ?auto_12704 - OBJ
      ?auto_12700 - LOCATION
    )
    :vars
    (
      ?auto_12707 - LOCATION
      ?auto_12706 - CITY
      ?auto_12705 - LOCATION
      ?auto_12708 - LOCATION
      ?auto_12709 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12701 ?auto_12699 ) ( GREATER-THAN ?auto_12702 ?auto_12699 ) ( GREATER-THAN ?auto_12702 ?auto_12701 ) ( GREATER-THAN ?auto_12703 ?auto_12699 ) ( GREATER-THAN ?auto_12703 ?auto_12701 ) ( GREATER-THAN ?auto_12703 ?auto_12702 ) ( GREATER-THAN ?auto_12704 ?auto_12699 ) ( GREATER-THAN ?auto_12704 ?auto_12701 ) ( GREATER-THAN ?auto_12704 ?auto_12702 ) ( GREATER-THAN ?auto_12704 ?auto_12703 ) ( IN-CITY ?auto_12707 ?auto_12706 ) ( IN-CITY ?auto_12700 ?auto_12706 ) ( not ( = ?auto_12700 ?auto_12707 ) ) ( OBJ-AT ?auto_12704 ?auto_12707 ) ( OBJ-AT ?auto_12699 ?auto_12700 ) ( not ( = ?auto_12699 ?auto_12701 ) ) ( not ( = ?auto_12699 ?auto_12702 ) ) ( not ( = ?auto_12699 ?auto_12703 ) ) ( not ( = ?auto_12699 ?auto_12704 ) ) ( not ( = ?auto_12701 ?auto_12702 ) ) ( not ( = ?auto_12701 ?auto_12703 ) ) ( not ( = ?auto_12701 ?auto_12704 ) ) ( not ( = ?auto_12702 ?auto_12703 ) ) ( not ( = ?auto_12702 ?auto_12704 ) ) ( not ( = ?auto_12703 ?auto_12704 ) ) ( IN-CITY ?auto_12705 ?auto_12706 ) ( not ( = ?auto_12700 ?auto_12705 ) ) ( not ( = ?auto_12707 ?auto_12705 ) ) ( OBJ-AT ?auto_12703 ?auto_12705 ) ( IN-CITY ?auto_12708 ?auto_12706 ) ( not ( = ?auto_12700 ?auto_12708 ) ) ( not ( = ?auto_12707 ?auto_12708 ) ) ( not ( = ?auto_12705 ?auto_12708 ) ) ( OBJ-AT ?auto_12702 ?auto_12708 ) ( OBJ-AT ?auto_12701 ?auto_12707 ) ( TRUCK-AT ?auto_12709 ?auto_12700 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12709 ?auto_12700 ?auto_12707 ?auto_12706 )
      ( DELIVER-5PKG ?auto_12699 ?auto_12701 ?auto_12702 ?auto_12703 ?auto_12704 ?auto_12700 )
      ( DELIVER-5PKG-VERIFY ?auto_12699 ?auto_12701 ?auto_12702 ?auto_12703 ?auto_12704 ?auto_12700 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12716 - OBJ
      ?auto_12718 - OBJ
      ?auto_12719 - OBJ
      ?auto_12720 - OBJ
      ?auto_12721 - OBJ
      ?auto_12717 - LOCATION
    )
    :vars
    (
      ?auto_12723 - LOCATION
      ?auto_12722 - CITY
      ?auto_12725 - LOCATION
      ?auto_12724 - LOCATION
      ?auto_12726 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12718 ?auto_12716 ) ( GREATER-THAN ?auto_12719 ?auto_12716 ) ( GREATER-THAN ?auto_12719 ?auto_12718 ) ( GREATER-THAN ?auto_12720 ?auto_12716 ) ( GREATER-THAN ?auto_12720 ?auto_12718 ) ( GREATER-THAN ?auto_12720 ?auto_12719 ) ( GREATER-THAN ?auto_12721 ?auto_12716 ) ( GREATER-THAN ?auto_12721 ?auto_12718 ) ( GREATER-THAN ?auto_12721 ?auto_12719 ) ( GREATER-THAN ?auto_12721 ?auto_12720 ) ( IN-CITY ?auto_12723 ?auto_12722 ) ( IN-CITY ?auto_12717 ?auto_12722 ) ( not ( = ?auto_12717 ?auto_12723 ) ) ( OBJ-AT ?auto_12721 ?auto_12723 ) ( not ( = ?auto_12716 ?auto_12718 ) ) ( not ( = ?auto_12716 ?auto_12719 ) ) ( not ( = ?auto_12716 ?auto_12720 ) ) ( not ( = ?auto_12716 ?auto_12721 ) ) ( not ( = ?auto_12718 ?auto_12719 ) ) ( not ( = ?auto_12718 ?auto_12720 ) ) ( not ( = ?auto_12718 ?auto_12721 ) ) ( not ( = ?auto_12719 ?auto_12720 ) ) ( not ( = ?auto_12719 ?auto_12721 ) ) ( not ( = ?auto_12720 ?auto_12721 ) ) ( IN-CITY ?auto_12725 ?auto_12722 ) ( not ( = ?auto_12717 ?auto_12725 ) ) ( not ( = ?auto_12723 ?auto_12725 ) ) ( OBJ-AT ?auto_12720 ?auto_12725 ) ( IN-CITY ?auto_12724 ?auto_12722 ) ( not ( = ?auto_12717 ?auto_12724 ) ) ( not ( = ?auto_12723 ?auto_12724 ) ) ( not ( = ?auto_12725 ?auto_12724 ) ) ( OBJ-AT ?auto_12719 ?auto_12724 ) ( OBJ-AT ?auto_12718 ?auto_12723 ) ( TRUCK-AT ?auto_12726 ?auto_12717 ) ( IN-TRUCK ?auto_12716 ?auto_12726 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12716 ?auto_12717 )
      ( DELIVER-5PKG ?auto_12716 ?auto_12718 ?auto_12719 ?auto_12720 ?auto_12721 ?auto_12717 )
      ( DELIVER-5PKG-VERIFY ?auto_12716 ?auto_12718 ?auto_12719 ?auto_12720 ?auto_12721 ?auto_12717 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12733 - OBJ
      ?auto_12735 - OBJ
      ?auto_12736 - OBJ
      ?auto_12737 - OBJ
      ?auto_12738 - OBJ
      ?auto_12734 - LOCATION
    )
    :vars
    (
      ?auto_12739 - LOCATION
      ?auto_12742 - CITY
      ?auto_12741 - LOCATION
      ?auto_12743 - LOCATION
      ?auto_12740 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12735 ?auto_12733 ) ( GREATER-THAN ?auto_12736 ?auto_12733 ) ( GREATER-THAN ?auto_12736 ?auto_12735 ) ( GREATER-THAN ?auto_12737 ?auto_12733 ) ( GREATER-THAN ?auto_12737 ?auto_12735 ) ( GREATER-THAN ?auto_12737 ?auto_12736 ) ( GREATER-THAN ?auto_12738 ?auto_12733 ) ( GREATER-THAN ?auto_12738 ?auto_12735 ) ( GREATER-THAN ?auto_12738 ?auto_12736 ) ( GREATER-THAN ?auto_12738 ?auto_12737 ) ( IN-CITY ?auto_12739 ?auto_12742 ) ( IN-CITY ?auto_12734 ?auto_12742 ) ( not ( = ?auto_12734 ?auto_12739 ) ) ( OBJ-AT ?auto_12738 ?auto_12739 ) ( not ( = ?auto_12733 ?auto_12735 ) ) ( not ( = ?auto_12733 ?auto_12736 ) ) ( not ( = ?auto_12733 ?auto_12737 ) ) ( not ( = ?auto_12733 ?auto_12738 ) ) ( not ( = ?auto_12735 ?auto_12736 ) ) ( not ( = ?auto_12735 ?auto_12737 ) ) ( not ( = ?auto_12735 ?auto_12738 ) ) ( not ( = ?auto_12736 ?auto_12737 ) ) ( not ( = ?auto_12736 ?auto_12738 ) ) ( not ( = ?auto_12737 ?auto_12738 ) ) ( IN-CITY ?auto_12741 ?auto_12742 ) ( not ( = ?auto_12734 ?auto_12741 ) ) ( not ( = ?auto_12739 ?auto_12741 ) ) ( OBJ-AT ?auto_12737 ?auto_12741 ) ( IN-CITY ?auto_12743 ?auto_12742 ) ( not ( = ?auto_12734 ?auto_12743 ) ) ( not ( = ?auto_12739 ?auto_12743 ) ) ( not ( = ?auto_12741 ?auto_12743 ) ) ( OBJ-AT ?auto_12736 ?auto_12743 ) ( OBJ-AT ?auto_12735 ?auto_12739 ) ( IN-TRUCK ?auto_12733 ?auto_12740 ) ( TRUCK-AT ?auto_12740 ?auto_12739 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12740 ?auto_12739 ?auto_12734 ?auto_12742 )
      ( DELIVER-5PKG ?auto_12733 ?auto_12735 ?auto_12736 ?auto_12737 ?auto_12738 ?auto_12734 )
      ( DELIVER-5PKG-VERIFY ?auto_12733 ?auto_12735 ?auto_12736 ?auto_12737 ?auto_12738 ?auto_12734 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12750 - OBJ
      ?auto_12752 - OBJ
      ?auto_12753 - OBJ
      ?auto_12754 - OBJ
      ?auto_12755 - OBJ
      ?auto_12751 - LOCATION
    )
    :vars
    (
      ?auto_12758 - LOCATION
      ?auto_12756 - CITY
      ?auto_12760 - LOCATION
      ?auto_12757 - LOCATION
      ?auto_12759 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12752 ?auto_12750 ) ( GREATER-THAN ?auto_12753 ?auto_12750 ) ( GREATER-THAN ?auto_12753 ?auto_12752 ) ( GREATER-THAN ?auto_12754 ?auto_12750 ) ( GREATER-THAN ?auto_12754 ?auto_12752 ) ( GREATER-THAN ?auto_12754 ?auto_12753 ) ( GREATER-THAN ?auto_12755 ?auto_12750 ) ( GREATER-THAN ?auto_12755 ?auto_12752 ) ( GREATER-THAN ?auto_12755 ?auto_12753 ) ( GREATER-THAN ?auto_12755 ?auto_12754 ) ( IN-CITY ?auto_12758 ?auto_12756 ) ( IN-CITY ?auto_12751 ?auto_12756 ) ( not ( = ?auto_12751 ?auto_12758 ) ) ( OBJ-AT ?auto_12755 ?auto_12758 ) ( not ( = ?auto_12750 ?auto_12752 ) ) ( not ( = ?auto_12750 ?auto_12753 ) ) ( not ( = ?auto_12750 ?auto_12754 ) ) ( not ( = ?auto_12750 ?auto_12755 ) ) ( not ( = ?auto_12752 ?auto_12753 ) ) ( not ( = ?auto_12752 ?auto_12754 ) ) ( not ( = ?auto_12752 ?auto_12755 ) ) ( not ( = ?auto_12753 ?auto_12754 ) ) ( not ( = ?auto_12753 ?auto_12755 ) ) ( not ( = ?auto_12754 ?auto_12755 ) ) ( IN-CITY ?auto_12760 ?auto_12756 ) ( not ( = ?auto_12751 ?auto_12760 ) ) ( not ( = ?auto_12758 ?auto_12760 ) ) ( OBJ-AT ?auto_12754 ?auto_12760 ) ( IN-CITY ?auto_12757 ?auto_12756 ) ( not ( = ?auto_12751 ?auto_12757 ) ) ( not ( = ?auto_12758 ?auto_12757 ) ) ( not ( = ?auto_12760 ?auto_12757 ) ) ( OBJ-AT ?auto_12753 ?auto_12757 ) ( OBJ-AT ?auto_12752 ?auto_12758 ) ( TRUCK-AT ?auto_12759 ?auto_12758 ) ( OBJ-AT ?auto_12750 ?auto_12758 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12750 ?auto_12759 ?auto_12758 )
      ( DELIVER-5PKG ?auto_12750 ?auto_12752 ?auto_12753 ?auto_12754 ?auto_12755 ?auto_12751 )
      ( DELIVER-5PKG-VERIFY ?auto_12750 ?auto_12752 ?auto_12753 ?auto_12754 ?auto_12755 ?auto_12751 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_12767 - OBJ
      ?auto_12769 - OBJ
      ?auto_12770 - OBJ
      ?auto_12771 - OBJ
      ?auto_12772 - OBJ
      ?auto_12768 - LOCATION
    )
    :vars
    (
      ?auto_12775 - LOCATION
      ?auto_12777 - CITY
      ?auto_12774 - LOCATION
      ?auto_12776 - LOCATION
      ?auto_12773 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12769 ?auto_12767 ) ( GREATER-THAN ?auto_12770 ?auto_12767 ) ( GREATER-THAN ?auto_12770 ?auto_12769 ) ( GREATER-THAN ?auto_12771 ?auto_12767 ) ( GREATER-THAN ?auto_12771 ?auto_12769 ) ( GREATER-THAN ?auto_12771 ?auto_12770 ) ( GREATER-THAN ?auto_12772 ?auto_12767 ) ( GREATER-THAN ?auto_12772 ?auto_12769 ) ( GREATER-THAN ?auto_12772 ?auto_12770 ) ( GREATER-THAN ?auto_12772 ?auto_12771 ) ( IN-CITY ?auto_12775 ?auto_12777 ) ( IN-CITY ?auto_12768 ?auto_12777 ) ( not ( = ?auto_12768 ?auto_12775 ) ) ( OBJ-AT ?auto_12772 ?auto_12775 ) ( not ( = ?auto_12767 ?auto_12769 ) ) ( not ( = ?auto_12767 ?auto_12770 ) ) ( not ( = ?auto_12767 ?auto_12771 ) ) ( not ( = ?auto_12767 ?auto_12772 ) ) ( not ( = ?auto_12769 ?auto_12770 ) ) ( not ( = ?auto_12769 ?auto_12771 ) ) ( not ( = ?auto_12769 ?auto_12772 ) ) ( not ( = ?auto_12770 ?auto_12771 ) ) ( not ( = ?auto_12770 ?auto_12772 ) ) ( not ( = ?auto_12771 ?auto_12772 ) ) ( IN-CITY ?auto_12774 ?auto_12777 ) ( not ( = ?auto_12768 ?auto_12774 ) ) ( not ( = ?auto_12775 ?auto_12774 ) ) ( OBJ-AT ?auto_12771 ?auto_12774 ) ( IN-CITY ?auto_12776 ?auto_12777 ) ( not ( = ?auto_12768 ?auto_12776 ) ) ( not ( = ?auto_12775 ?auto_12776 ) ) ( not ( = ?auto_12774 ?auto_12776 ) ) ( OBJ-AT ?auto_12770 ?auto_12776 ) ( OBJ-AT ?auto_12769 ?auto_12775 ) ( OBJ-AT ?auto_12767 ?auto_12775 ) ( TRUCK-AT ?auto_12773 ?auto_12768 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12773 ?auto_12768 ?auto_12775 ?auto_12777 )
      ( DELIVER-5PKG ?auto_12767 ?auto_12769 ?auto_12770 ?auto_12771 ?auto_12772 ?auto_12768 )
      ( DELIVER-5PKG-VERIFY ?auto_12767 ?auto_12769 ?auto_12770 ?auto_12771 ?auto_12772 ?auto_12768 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_12811 - OBJ
      ?auto_12813 - OBJ
      ?auto_12815 - OBJ
      ?auto_12816 - OBJ
      ?auto_12817 - OBJ
      ?auto_12814 - OBJ
      ?auto_12812 - LOCATION
    )
    :vars
    (
      ?auto_12818 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12813 ?auto_12811 ) ( GREATER-THAN ?auto_12815 ?auto_12811 ) ( GREATER-THAN ?auto_12815 ?auto_12813 ) ( GREATER-THAN ?auto_12816 ?auto_12811 ) ( GREATER-THAN ?auto_12816 ?auto_12813 ) ( GREATER-THAN ?auto_12816 ?auto_12815 ) ( GREATER-THAN ?auto_12817 ?auto_12811 ) ( GREATER-THAN ?auto_12817 ?auto_12813 ) ( GREATER-THAN ?auto_12817 ?auto_12815 ) ( GREATER-THAN ?auto_12817 ?auto_12816 ) ( GREATER-THAN ?auto_12814 ?auto_12811 ) ( GREATER-THAN ?auto_12814 ?auto_12813 ) ( GREATER-THAN ?auto_12814 ?auto_12815 ) ( GREATER-THAN ?auto_12814 ?auto_12816 ) ( GREATER-THAN ?auto_12814 ?auto_12817 ) ( TRUCK-AT ?auto_12818 ?auto_12812 ) ( IN-TRUCK ?auto_12814 ?auto_12818 ) ( OBJ-AT ?auto_12811 ?auto_12812 ) ( OBJ-AT ?auto_12813 ?auto_12812 ) ( OBJ-AT ?auto_12815 ?auto_12812 ) ( OBJ-AT ?auto_12816 ?auto_12812 ) ( OBJ-AT ?auto_12817 ?auto_12812 ) ( not ( = ?auto_12811 ?auto_12813 ) ) ( not ( = ?auto_12811 ?auto_12815 ) ) ( not ( = ?auto_12811 ?auto_12816 ) ) ( not ( = ?auto_12811 ?auto_12817 ) ) ( not ( = ?auto_12811 ?auto_12814 ) ) ( not ( = ?auto_12813 ?auto_12815 ) ) ( not ( = ?auto_12813 ?auto_12816 ) ) ( not ( = ?auto_12813 ?auto_12817 ) ) ( not ( = ?auto_12813 ?auto_12814 ) ) ( not ( = ?auto_12815 ?auto_12816 ) ) ( not ( = ?auto_12815 ?auto_12817 ) ) ( not ( = ?auto_12815 ?auto_12814 ) ) ( not ( = ?auto_12816 ?auto_12817 ) ) ( not ( = ?auto_12816 ?auto_12814 ) ) ( not ( = ?auto_12817 ?auto_12814 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12814 ?auto_12812 )
      ( DELIVER-6PKG-VERIFY ?auto_12811 ?auto_12813 ?auto_12815 ?auto_12816 ?auto_12817 ?auto_12814 ?auto_12812 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_12826 - OBJ
      ?auto_12828 - OBJ
      ?auto_12830 - OBJ
      ?auto_12831 - OBJ
      ?auto_12832 - OBJ
      ?auto_12829 - OBJ
      ?auto_12827 - LOCATION
    )
    :vars
    (
      ?auto_12834 - TRUCK
      ?auto_12833 - LOCATION
      ?auto_12835 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12828 ?auto_12826 ) ( GREATER-THAN ?auto_12830 ?auto_12826 ) ( GREATER-THAN ?auto_12830 ?auto_12828 ) ( GREATER-THAN ?auto_12831 ?auto_12826 ) ( GREATER-THAN ?auto_12831 ?auto_12828 ) ( GREATER-THAN ?auto_12831 ?auto_12830 ) ( GREATER-THAN ?auto_12832 ?auto_12826 ) ( GREATER-THAN ?auto_12832 ?auto_12828 ) ( GREATER-THAN ?auto_12832 ?auto_12830 ) ( GREATER-THAN ?auto_12832 ?auto_12831 ) ( GREATER-THAN ?auto_12829 ?auto_12826 ) ( GREATER-THAN ?auto_12829 ?auto_12828 ) ( GREATER-THAN ?auto_12829 ?auto_12830 ) ( GREATER-THAN ?auto_12829 ?auto_12831 ) ( GREATER-THAN ?auto_12829 ?auto_12832 ) ( IN-TRUCK ?auto_12829 ?auto_12834 ) ( TRUCK-AT ?auto_12834 ?auto_12833 ) ( IN-CITY ?auto_12833 ?auto_12835 ) ( IN-CITY ?auto_12827 ?auto_12835 ) ( not ( = ?auto_12827 ?auto_12833 ) ) ( OBJ-AT ?auto_12826 ?auto_12827 ) ( OBJ-AT ?auto_12828 ?auto_12827 ) ( OBJ-AT ?auto_12830 ?auto_12827 ) ( OBJ-AT ?auto_12831 ?auto_12827 ) ( OBJ-AT ?auto_12832 ?auto_12827 ) ( not ( = ?auto_12826 ?auto_12828 ) ) ( not ( = ?auto_12826 ?auto_12830 ) ) ( not ( = ?auto_12826 ?auto_12831 ) ) ( not ( = ?auto_12826 ?auto_12832 ) ) ( not ( = ?auto_12826 ?auto_12829 ) ) ( not ( = ?auto_12828 ?auto_12830 ) ) ( not ( = ?auto_12828 ?auto_12831 ) ) ( not ( = ?auto_12828 ?auto_12832 ) ) ( not ( = ?auto_12828 ?auto_12829 ) ) ( not ( = ?auto_12830 ?auto_12831 ) ) ( not ( = ?auto_12830 ?auto_12832 ) ) ( not ( = ?auto_12830 ?auto_12829 ) ) ( not ( = ?auto_12831 ?auto_12832 ) ) ( not ( = ?auto_12831 ?auto_12829 ) ) ( not ( = ?auto_12832 ?auto_12829 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12829 ?auto_12827 )
      ( DELIVER-6PKG-VERIFY ?auto_12826 ?auto_12828 ?auto_12830 ?auto_12831 ?auto_12832 ?auto_12829 ?auto_12827 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_12843 - OBJ
      ?auto_12845 - OBJ
      ?auto_12847 - OBJ
      ?auto_12848 - OBJ
      ?auto_12849 - OBJ
      ?auto_12846 - OBJ
      ?auto_12844 - LOCATION
    )
    :vars
    (
      ?auto_12850 - TRUCK
      ?auto_12851 - LOCATION
      ?auto_12852 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12845 ?auto_12843 ) ( GREATER-THAN ?auto_12847 ?auto_12843 ) ( GREATER-THAN ?auto_12847 ?auto_12845 ) ( GREATER-THAN ?auto_12848 ?auto_12843 ) ( GREATER-THAN ?auto_12848 ?auto_12845 ) ( GREATER-THAN ?auto_12848 ?auto_12847 ) ( GREATER-THAN ?auto_12849 ?auto_12843 ) ( GREATER-THAN ?auto_12849 ?auto_12845 ) ( GREATER-THAN ?auto_12849 ?auto_12847 ) ( GREATER-THAN ?auto_12849 ?auto_12848 ) ( GREATER-THAN ?auto_12846 ?auto_12843 ) ( GREATER-THAN ?auto_12846 ?auto_12845 ) ( GREATER-THAN ?auto_12846 ?auto_12847 ) ( GREATER-THAN ?auto_12846 ?auto_12848 ) ( GREATER-THAN ?auto_12846 ?auto_12849 ) ( TRUCK-AT ?auto_12850 ?auto_12851 ) ( IN-CITY ?auto_12851 ?auto_12852 ) ( IN-CITY ?auto_12844 ?auto_12852 ) ( not ( = ?auto_12844 ?auto_12851 ) ) ( OBJ-AT ?auto_12846 ?auto_12851 ) ( OBJ-AT ?auto_12843 ?auto_12844 ) ( OBJ-AT ?auto_12845 ?auto_12844 ) ( OBJ-AT ?auto_12847 ?auto_12844 ) ( OBJ-AT ?auto_12848 ?auto_12844 ) ( OBJ-AT ?auto_12849 ?auto_12844 ) ( not ( = ?auto_12843 ?auto_12845 ) ) ( not ( = ?auto_12843 ?auto_12847 ) ) ( not ( = ?auto_12843 ?auto_12848 ) ) ( not ( = ?auto_12843 ?auto_12849 ) ) ( not ( = ?auto_12843 ?auto_12846 ) ) ( not ( = ?auto_12845 ?auto_12847 ) ) ( not ( = ?auto_12845 ?auto_12848 ) ) ( not ( = ?auto_12845 ?auto_12849 ) ) ( not ( = ?auto_12845 ?auto_12846 ) ) ( not ( = ?auto_12847 ?auto_12848 ) ) ( not ( = ?auto_12847 ?auto_12849 ) ) ( not ( = ?auto_12847 ?auto_12846 ) ) ( not ( = ?auto_12848 ?auto_12849 ) ) ( not ( = ?auto_12848 ?auto_12846 ) ) ( not ( = ?auto_12849 ?auto_12846 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12846 ?auto_12844 )
      ( DELIVER-6PKG-VERIFY ?auto_12843 ?auto_12845 ?auto_12847 ?auto_12848 ?auto_12849 ?auto_12846 ?auto_12844 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_12860 - OBJ
      ?auto_12862 - OBJ
      ?auto_12864 - OBJ
      ?auto_12865 - OBJ
      ?auto_12866 - OBJ
      ?auto_12863 - OBJ
      ?auto_12861 - LOCATION
    )
    :vars
    (
      ?auto_12867 - LOCATION
      ?auto_12869 - CITY
      ?auto_12868 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12862 ?auto_12860 ) ( GREATER-THAN ?auto_12864 ?auto_12860 ) ( GREATER-THAN ?auto_12864 ?auto_12862 ) ( GREATER-THAN ?auto_12865 ?auto_12860 ) ( GREATER-THAN ?auto_12865 ?auto_12862 ) ( GREATER-THAN ?auto_12865 ?auto_12864 ) ( GREATER-THAN ?auto_12866 ?auto_12860 ) ( GREATER-THAN ?auto_12866 ?auto_12862 ) ( GREATER-THAN ?auto_12866 ?auto_12864 ) ( GREATER-THAN ?auto_12866 ?auto_12865 ) ( GREATER-THAN ?auto_12863 ?auto_12860 ) ( GREATER-THAN ?auto_12863 ?auto_12862 ) ( GREATER-THAN ?auto_12863 ?auto_12864 ) ( GREATER-THAN ?auto_12863 ?auto_12865 ) ( GREATER-THAN ?auto_12863 ?auto_12866 ) ( IN-CITY ?auto_12867 ?auto_12869 ) ( IN-CITY ?auto_12861 ?auto_12869 ) ( not ( = ?auto_12861 ?auto_12867 ) ) ( OBJ-AT ?auto_12863 ?auto_12867 ) ( TRUCK-AT ?auto_12868 ?auto_12861 ) ( OBJ-AT ?auto_12860 ?auto_12861 ) ( OBJ-AT ?auto_12862 ?auto_12861 ) ( OBJ-AT ?auto_12864 ?auto_12861 ) ( OBJ-AT ?auto_12865 ?auto_12861 ) ( OBJ-AT ?auto_12866 ?auto_12861 ) ( not ( = ?auto_12860 ?auto_12862 ) ) ( not ( = ?auto_12860 ?auto_12864 ) ) ( not ( = ?auto_12860 ?auto_12865 ) ) ( not ( = ?auto_12860 ?auto_12866 ) ) ( not ( = ?auto_12860 ?auto_12863 ) ) ( not ( = ?auto_12862 ?auto_12864 ) ) ( not ( = ?auto_12862 ?auto_12865 ) ) ( not ( = ?auto_12862 ?auto_12866 ) ) ( not ( = ?auto_12862 ?auto_12863 ) ) ( not ( = ?auto_12864 ?auto_12865 ) ) ( not ( = ?auto_12864 ?auto_12866 ) ) ( not ( = ?auto_12864 ?auto_12863 ) ) ( not ( = ?auto_12865 ?auto_12866 ) ) ( not ( = ?auto_12865 ?auto_12863 ) ) ( not ( = ?auto_12866 ?auto_12863 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12863 ?auto_12861 )
      ( DELIVER-6PKG-VERIFY ?auto_12860 ?auto_12862 ?auto_12864 ?auto_12865 ?auto_12866 ?auto_12863 ?auto_12861 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_12877 - OBJ
      ?auto_12879 - OBJ
      ?auto_12881 - OBJ
      ?auto_12882 - OBJ
      ?auto_12883 - OBJ
      ?auto_12880 - OBJ
      ?auto_12878 - LOCATION
    )
    :vars
    (
      ?auto_12884 - LOCATION
      ?auto_12886 - CITY
      ?auto_12885 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12879 ?auto_12877 ) ( GREATER-THAN ?auto_12881 ?auto_12877 ) ( GREATER-THAN ?auto_12881 ?auto_12879 ) ( GREATER-THAN ?auto_12882 ?auto_12877 ) ( GREATER-THAN ?auto_12882 ?auto_12879 ) ( GREATER-THAN ?auto_12882 ?auto_12881 ) ( GREATER-THAN ?auto_12883 ?auto_12877 ) ( GREATER-THAN ?auto_12883 ?auto_12879 ) ( GREATER-THAN ?auto_12883 ?auto_12881 ) ( GREATER-THAN ?auto_12883 ?auto_12882 ) ( GREATER-THAN ?auto_12880 ?auto_12877 ) ( GREATER-THAN ?auto_12880 ?auto_12879 ) ( GREATER-THAN ?auto_12880 ?auto_12881 ) ( GREATER-THAN ?auto_12880 ?auto_12882 ) ( GREATER-THAN ?auto_12880 ?auto_12883 ) ( IN-CITY ?auto_12884 ?auto_12886 ) ( IN-CITY ?auto_12878 ?auto_12886 ) ( not ( = ?auto_12878 ?auto_12884 ) ) ( OBJ-AT ?auto_12880 ?auto_12884 ) ( TRUCK-AT ?auto_12885 ?auto_12878 ) ( OBJ-AT ?auto_12877 ?auto_12878 ) ( OBJ-AT ?auto_12879 ?auto_12878 ) ( OBJ-AT ?auto_12881 ?auto_12878 ) ( OBJ-AT ?auto_12882 ?auto_12878 ) ( not ( = ?auto_12877 ?auto_12879 ) ) ( not ( = ?auto_12877 ?auto_12881 ) ) ( not ( = ?auto_12877 ?auto_12882 ) ) ( not ( = ?auto_12877 ?auto_12883 ) ) ( not ( = ?auto_12877 ?auto_12880 ) ) ( not ( = ?auto_12879 ?auto_12881 ) ) ( not ( = ?auto_12879 ?auto_12882 ) ) ( not ( = ?auto_12879 ?auto_12883 ) ) ( not ( = ?auto_12879 ?auto_12880 ) ) ( not ( = ?auto_12881 ?auto_12882 ) ) ( not ( = ?auto_12881 ?auto_12883 ) ) ( not ( = ?auto_12881 ?auto_12880 ) ) ( not ( = ?auto_12882 ?auto_12883 ) ) ( not ( = ?auto_12882 ?auto_12880 ) ) ( not ( = ?auto_12883 ?auto_12880 ) ) ( IN-TRUCK ?auto_12883 ?auto_12885 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12883 ?auto_12878 )
      ( DELIVER-6PKG ?auto_12877 ?auto_12879 ?auto_12881 ?auto_12882 ?auto_12883 ?auto_12880 ?auto_12878 )
      ( DELIVER-6PKG-VERIFY ?auto_12877 ?auto_12879 ?auto_12881 ?auto_12882 ?auto_12883 ?auto_12880 ?auto_12878 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_12894 - OBJ
      ?auto_12896 - OBJ
      ?auto_12898 - OBJ
      ?auto_12899 - OBJ
      ?auto_12900 - OBJ
      ?auto_12897 - OBJ
      ?auto_12895 - LOCATION
    )
    :vars
    (
      ?auto_12902 - LOCATION
      ?auto_12901 - CITY
      ?auto_12903 - TRUCK
      ?auto_12904 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12896 ?auto_12894 ) ( GREATER-THAN ?auto_12898 ?auto_12894 ) ( GREATER-THAN ?auto_12898 ?auto_12896 ) ( GREATER-THAN ?auto_12899 ?auto_12894 ) ( GREATER-THAN ?auto_12899 ?auto_12896 ) ( GREATER-THAN ?auto_12899 ?auto_12898 ) ( GREATER-THAN ?auto_12900 ?auto_12894 ) ( GREATER-THAN ?auto_12900 ?auto_12896 ) ( GREATER-THAN ?auto_12900 ?auto_12898 ) ( GREATER-THAN ?auto_12900 ?auto_12899 ) ( GREATER-THAN ?auto_12897 ?auto_12894 ) ( GREATER-THAN ?auto_12897 ?auto_12896 ) ( GREATER-THAN ?auto_12897 ?auto_12898 ) ( GREATER-THAN ?auto_12897 ?auto_12899 ) ( GREATER-THAN ?auto_12897 ?auto_12900 ) ( IN-CITY ?auto_12902 ?auto_12901 ) ( IN-CITY ?auto_12895 ?auto_12901 ) ( not ( = ?auto_12895 ?auto_12902 ) ) ( OBJ-AT ?auto_12897 ?auto_12902 ) ( OBJ-AT ?auto_12894 ?auto_12895 ) ( OBJ-AT ?auto_12896 ?auto_12895 ) ( OBJ-AT ?auto_12898 ?auto_12895 ) ( OBJ-AT ?auto_12899 ?auto_12895 ) ( not ( = ?auto_12894 ?auto_12896 ) ) ( not ( = ?auto_12894 ?auto_12898 ) ) ( not ( = ?auto_12894 ?auto_12899 ) ) ( not ( = ?auto_12894 ?auto_12900 ) ) ( not ( = ?auto_12894 ?auto_12897 ) ) ( not ( = ?auto_12896 ?auto_12898 ) ) ( not ( = ?auto_12896 ?auto_12899 ) ) ( not ( = ?auto_12896 ?auto_12900 ) ) ( not ( = ?auto_12896 ?auto_12897 ) ) ( not ( = ?auto_12898 ?auto_12899 ) ) ( not ( = ?auto_12898 ?auto_12900 ) ) ( not ( = ?auto_12898 ?auto_12897 ) ) ( not ( = ?auto_12899 ?auto_12900 ) ) ( not ( = ?auto_12899 ?auto_12897 ) ) ( not ( = ?auto_12900 ?auto_12897 ) ) ( IN-TRUCK ?auto_12900 ?auto_12903 ) ( TRUCK-AT ?auto_12903 ?auto_12904 ) ( IN-CITY ?auto_12904 ?auto_12901 ) ( not ( = ?auto_12895 ?auto_12904 ) ) ( not ( = ?auto_12902 ?auto_12904 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12903 ?auto_12904 ?auto_12895 ?auto_12901 )
      ( DELIVER-6PKG ?auto_12894 ?auto_12896 ?auto_12898 ?auto_12899 ?auto_12900 ?auto_12897 ?auto_12895 )
      ( DELIVER-6PKG-VERIFY ?auto_12894 ?auto_12896 ?auto_12898 ?auto_12899 ?auto_12900 ?auto_12897 ?auto_12895 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_12912 - OBJ
      ?auto_12914 - OBJ
      ?auto_12916 - OBJ
      ?auto_12917 - OBJ
      ?auto_12918 - OBJ
      ?auto_12915 - OBJ
      ?auto_12913 - LOCATION
    )
    :vars
    (
      ?auto_12922 - LOCATION
      ?auto_12921 - CITY
      ?auto_12920 - TRUCK
      ?auto_12919 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12914 ?auto_12912 ) ( GREATER-THAN ?auto_12916 ?auto_12912 ) ( GREATER-THAN ?auto_12916 ?auto_12914 ) ( GREATER-THAN ?auto_12917 ?auto_12912 ) ( GREATER-THAN ?auto_12917 ?auto_12914 ) ( GREATER-THAN ?auto_12917 ?auto_12916 ) ( GREATER-THAN ?auto_12918 ?auto_12912 ) ( GREATER-THAN ?auto_12918 ?auto_12914 ) ( GREATER-THAN ?auto_12918 ?auto_12916 ) ( GREATER-THAN ?auto_12918 ?auto_12917 ) ( GREATER-THAN ?auto_12915 ?auto_12912 ) ( GREATER-THAN ?auto_12915 ?auto_12914 ) ( GREATER-THAN ?auto_12915 ?auto_12916 ) ( GREATER-THAN ?auto_12915 ?auto_12917 ) ( GREATER-THAN ?auto_12915 ?auto_12918 ) ( IN-CITY ?auto_12922 ?auto_12921 ) ( IN-CITY ?auto_12913 ?auto_12921 ) ( not ( = ?auto_12913 ?auto_12922 ) ) ( OBJ-AT ?auto_12915 ?auto_12922 ) ( OBJ-AT ?auto_12912 ?auto_12913 ) ( OBJ-AT ?auto_12914 ?auto_12913 ) ( OBJ-AT ?auto_12916 ?auto_12913 ) ( OBJ-AT ?auto_12917 ?auto_12913 ) ( not ( = ?auto_12912 ?auto_12914 ) ) ( not ( = ?auto_12912 ?auto_12916 ) ) ( not ( = ?auto_12912 ?auto_12917 ) ) ( not ( = ?auto_12912 ?auto_12918 ) ) ( not ( = ?auto_12912 ?auto_12915 ) ) ( not ( = ?auto_12914 ?auto_12916 ) ) ( not ( = ?auto_12914 ?auto_12917 ) ) ( not ( = ?auto_12914 ?auto_12918 ) ) ( not ( = ?auto_12914 ?auto_12915 ) ) ( not ( = ?auto_12916 ?auto_12917 ) ) ( not ( = ?auto_12916 ?auto_12918 ) ) ( not ( = ?auto_12916 ?auto_12915 ) ) ( not ( = ?auto_12917 ?auto_12918 ) ) ( not ( = ?auto_12917 ?auto_12915 ) ) ( not ( = ?auto_12918 ?auto_12915 ) ) ( TRUCK-AT ?auto_12920 ?auto_12919 ) ( IN-CITY ?auto_12919 ?auto_12921 ) ( not ( = ?auto_12913 ?auto_12919 ) ) ( not ( = ?auto_12922 ?auto_12919 ) ) ( OBJ-AT ?auto_12918 ?auto_12919 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12918 ?auto_12920 ?auto_12919 )
      ( DELIVER-6PKG ?auto_12912 ?auto_12914 ?auto_12916 ?auto_12917 ?auto_12918 ?auto_12915 ?auto_12913 )
      ( DELIVER-6PKG-VERIFY ?auto_12912 ?auto_12914 ?auto_12916 ?auto_12917 ?auto_12918 ?auto_12915 ?auto_12913 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_12930 - OBJ
      ?auto_12932 - OBJ
      ?auto_12934 - OBJ
      ?auto_12935 - OBJ
      ?auto_12936 - OBJ
      ?auto_12933 - OBJ
      ?auto_12931 - LOCATION
    )
    :vars
    (
      ?auto_12938 - LOCATION
      ?auto_12940 - CITY
      ?auto_12937 - LOCATION
      ?auto_12939 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12932 ?auto_12930 ) ( GREATER-THAN ?auto_12934 ?auto_12930 ) ( GREATER-THAN ?auto_12934 ?auto_12932 ) ( GREATER-THAN ?auto_12935 ?auto_12930 ) ( GREATER-THAN ?auto_12935 ?auto_12932 ) ( GREATER-THAN ?auto_12935 ?auto_12934 ) ( GREATER-THAN ?auto_12936 ?auto_12930 ) ( GREATER-THAN ?auto_12936 ?auto_12932 ) ( GREATER-THAN ?auto_12936 ?auto_12934 ) ( GREATER-THAN ?auto_12936 ?auto_12935 ) ( GREATER-THAN ?auto_12933 ?auto_12930 ) ( GREATER-THAN ?auto_12933 ?auto_12932 ) ( GREATER-THAN ?auto_12933 ?auto_12934 ) ( GREATER-THAN ?auto_12933 ?auto_12935 ) ( GREATER-THAN ?auto_12933 ?auto_12936 ) ( IN-CITY ?auto_12938 ?auto_12940 ) ( IN-CITY ?auto_12931 ?auto_12940 ) ( not ( = ?auto_12931 ?auto_12938 ) ) ( OBJ-AT ?auto_12933 ?auto_12938 ) ( OBJ-AT ?auto_12930 ?auto_12931 ) ( OBJ-AT ?auto_12932 ?auto_12931 ) ( OBJ-AT ?auto_12934 ?auto_12931 ) ( OBJ-AT ?auto_12935 ?auto_12931 ) ( not ( = ?auto_12930 ?auto_12932 ) ) ( not ( = ?auto_12930 ?auto_12934 ) ) ( not ( = ?auto_12930 ?auto_12935 ) ) ( not ( = ?auto_12930 ?auto_12936 ) ) ( not ( = ?auto_12930 ?auto_12933 ) ) ( not ( = ?auto_12932 ?auto_12934 ) ) ( not ( = ?auto_12932 ?auto_12935 ) ) ( not ( = ?auto_12932 ?auto_12936 ) ) ( not ( = ?auto_12932 ?auto_12933 ) ) ( not ( = ?auto_12934 ?auto_12935 ) ) ( not ( = ?auto_12934 ?auto_12936 ) ) ( not ( = ?auto_12934 ?auto_12933 ) ) ( not ( = ?auto_12935 ?auto_12936 ) ) ( not ( = ?auto_12935 ?auto_12933 ) ) ( not ( = ?auto_12936 ?auto_12933 ) ) ( IN-CITY ?auto_12937 ?auto_12940 ) ( not ( = ?auto_12931 ?auto_12937 ) ) ( not ( = ?auto_12938 ?auto_12937 ) ) ( OBJ-AT ?auto_12936 ?auto_12937 ) ( TRUCK-AT ?auto_12939 ?auto_12931 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12939 ?auto_12931 ?auto_12937 ?auto_12940 )
      ( DELIVER-6PKG ?auto_12930 ?auto_12932 ?auto_12934 ?auto_12935 ?auto_12936 ?auto_12933 ?auto_12931 )
      ( DELIVER-6PKG-VERIFY ?auto_12930 ?auto_12932 ?auto_12934 ?auto_12935 ?auto_12936 ?auto_12933 ?auto_12931 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_12948 - OBJ
      ?auto_12950 - OBJ
      ?auto_12952 - OBJ
      ?auto_12953 - OBJ
      ?auto_12954 - OBJ
      ?auto_12951 - OBJ
      ?auto_12949 - LOCATION
    )
    :vars
    (
      ?auto_12958 - LOCATION
      ?auto_12956 - CITY
      ?auto_12957 - LOCATION
      ?auto_12955 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12950 ?auto_12948 ) ( GREATER-THAN ?auto_12952 ?auto_12948 ) ( GREATER-THAN ?auto_12952 ?auto_12950 ) ( GREATER-THAN ?auto_12953 ?auto_12948 ) ( GREATER-THAN ?auto_12953 ?auto_12950 ) ( GREATER-THAN ?auto_12953 ?auto_12952 ) ( GREATER-THAN ?auto_12954 ?auto_12948 ) ( GREATER-THAN ?auto_12954 ?auto_12950 ) ( GREATER-THAN ?auto_12954 ?auto_12952 ) ( GREATER-THAN ?auto_12954 ?auto_12953 ) ( GREATER-THAN ?auto_12951 ?auto_12948 ) ( GREATER-THAN ?auto_12951 ?auto_12950 ) ( GREATER-THAN ?auto_12951 ?auto_12952 ) ( GREATER-THAN ?auto_12951 ?auto_12953 ) ( GREATER-THAN ?auto_12951 ?auto_12954 ) ( IN-CITY ?auto_12958 ?auto_12956 ) ( IN-CITY ?auto_12949 ?auto_12956 ) ( not ( = ?auto_12949 ?auto_12958 ) ) ( OBJ-AT ?auto_12951 ?auto_12958 ) ( OBJ-AT ?auto_12948 ?auto_12949 ) ( OBJ-AT ?auto_12950 ?auto_12949 ) ( OBJ-AT ?auto_12952 ?auto_12949 ) ( not ( = ?auto_12948 ?auto_12950 ) ) ( not ( = ?auto_12948 ?auto_12952 ) ) ( not ( = ?auto_12948 ?auto_12953 ) ) ( not ( = ?auto_12948 ?auto_12954 ) ) ( not ( = ?auto_12948 ?auto_12951 ) ) ( not ( = ?auto_12950 ?auto_12952 ) ) ( not ( = ?auto_12950 ?auto_12953 ) ) ( not ( = ?auto_12950 ?auto_12954 ) ) ( not ( = ?auto_12950 ?auto_12951 ) ) ( not ( = ?auto_12952 ?auto_12953 ) ) ( not ( = ?auto_12952 ?auto_12954 ) ) ( not ( = ?auto_12952 ?auto_12951 ) ) ( not ( = ?auto_12953 ?auto_12954 ) ) ( not ( = ?auto_12953 ?auto_12951 ) ) ( not ( = ?auto_12954 ?auto_12951 ) ) ( IN-CITY ?auto_12957 ?auto_12956 ) ( not ( = ?auto_12949 ?auto_12957 ) ) ( not ( = ?auto_12958 ?auto_12957 ) ) ( OBJ-AT ?auto_12954 ?auto_12957 ) ( TRUCK-AT ?auto_12955 ?auto_12949 ) ( IN-TRUCK ?auto_12953 ?auto_12955 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12953 ?auto_12949 )
      ( DELIVER-6PKG ?auto_12948 ?auto_12950 ?auto_12952 ?auto_12953 ?auto_12954 ?auto_12951 ?auto_12949 )
      ( DELIVER-6PKG-VERIFY ?auto_12948 ?auto_12950 ?auto_12952 ?auto_12953 ?auto_12954 ?auto_12951 ?auto_12949 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_12966 - OBJ
      ?auto_12968 - OBJ
      ?auto_12970 - OBJ
      ?auto_12971 - OBJ
      ?auto_12972 - OBJ
      ?auto_12969 - OBJ
      ?auto_12967 - LOCATION
    )
    :vars
    (
      ?auto_12974 - LOCATION
      ?auto_12975 - CITY
      ?auto_12973 - LOCATION
      ?auto_12976 - TRUCK
      ?auto_12977 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12968 ?auto_12966 ) ( GREATER-THAN ?auto_12970 ?auto_12966 ) ( GREATER-THAN ?auto_12970 ?auto_12968 ) ( GREATER-THAN ?auto_12971 ?auto_12966 ) ( GREATER-THAN ?auto_12971 ?auto_12968 ) ( GREATER-THAN ?auto_12971 ?auto_12970 ) ( GREATER-THAN ?auto_12972 ?auto_12966 ) ( GREATER-THAN ?auto_12972 ?auto_12968 ) ( GREATER-THAN ?auto_12972 ?auto_12970 ) ( GREATER-THAN ?auto_12972 ?auto_12971 ) ( GREATER-THAN ?auto_12969 ?auto_12966 ) ( GREATER-THAN ?auto_12969 ?auto_12968 ) ( GREATER-THAN ?auto_12969 ?auto_12970 ) ( GREATER-THAN ?auto_12969 ?auto_12971 ) ( GREATER-THAN ?auto_12969 ?auto_12972 ) ( IN-CITY ?auto_12974 ?auto_12975 ) ( IN-CITY ?auto_12967 ?auto_12975 ) ( not ( = ?auto_12967 ?auto_12974 ) ) ( OBJ-AT ?auto_12969 ?auto_12974 ) ( OBJ-AT ?auto_12966 ?auto_12967 ) ( OBJ-AT ?auto_12968 ?auto_12967 ) ( OBJ-AT ?auto_12970 ?auto_12967 ) ( not ( = ?auto_12966 ?auto_12968 ) ) ( not ( = ?auto_12966 ?auto_12970 ) ) ( not ( = ?auto_12966 ?auto_12971 ) ) ( not ( = ?auto_12966 ?auto_12972 ) ) ( not ( = ?auto_12966 ?auto_12969 ) ) ( not ( = ?auto_12968 ?auto_12970 ) ) ( not ( = ?auto_12968 ?auto_12971 ) ) ( not ( = ?auto_12968 ?auto_12972 ) ) ( not ( = ?auto_12968 ?auto_12969 ) ) ( not ( = ?auto_12970 ?auto_12971 ) ) ( not ( = ?auto_12970 ?auto_12972 ) ) ( not ( = ?auto_12970 ?auto_12969 ) ) ( not ( = ?auto_12971 ?auto_12972 ) ) ( not ( = ?auto_12971 ?auto_12969 ) ) ( not ( = ?auto_12972 ?auto_12969 ) ) ( IN-CITY ?auto_12973 ?auto_12975 ) ( not ( = ?auto_12967 ?auto_12973 ) ) ( not ( = ?auto_12974 ?auto_12973 ) ) ( OBJ-AT ?auto_12972 ?auto_12973 ) ( IN-TRUCK ?auto_12971 ?auto_12976 ) ( TRUCK-AT ?auto_12976 ?auto_12977 ) ( IN-CITY ?auto_12977 ?auto_12975 ) ( not ( = ?auto_12967 ?auto_12977 ) ) ( not ( = ?auto_12974 ?auto_12977 ) ) ( not ( = ?auto_12973 ?auto_12977 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12976 ?auto_12977 ?auto_12967 ?auto_12975 )
      ( DELIVER-6PKG ?auto_12966 ?auto_12968 ?auto_12970 ?auto_12971 ?auto_12972 ?auto_12969 ?auto_12967 )
      ( DELIVER-6PKG-VERIFY ?auto_12966 ?auto_12968 ?auto_12970 ?auto_12971 ?auto_12972 ?auto_12969 ?auto_12967 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_12985 - OBJ
      ?auto_12987 - OBJ
      ?auto_12989 - OBJ
      ?auto_12990 - OBJ
      ?auto_12991 - OBJ
      ?auto_12988 - OBJ
      ?auto_12986 - LOCATION
    )
    :vars
    (
      ?auto_12995 - LOCATION
      ?auto_12996 - CITY
      ?auto_12992 - LOCATION
      ?auto_12993 - TRUCK
      ?auto_12994 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12987 ?auto_12985 ) ( GREATER-THAN ?auto_12989 ?auto_12985 ) ( GREATER-THAN ?auto_12989 ?auto_12987 ) ( GREATER-THAN ?auto_12990 ?auto_12985 ) ( GREATER-THAN ?auto_12990 ?auto_12987 ) ( GREATER-THAN ?auto_12990 ?auto_12989 ) ( GREATER-THAN ?auto_12991 ?auto_12985 ) ( GREATER-THAN ?auto_12991 ?auto_12987 ) ( GREATER-THAN ?auto_12991 ?auto_12989 ) ( GREATER-THAN ?auto_12991 ?auto_12990 ) ( GREATER-THAN ?auto_12988 ?auto_12985 ) ( GREATER-THAN ?auto_12988 ?auto_12987 ) ( GREATER-THAN ?auto_12988 ?auto_12989 ) ( GREATER-THAN ?auto_12988 ?auto_12990 ) ( GREATER-THAN ?auto_12988 ?auto_12991 ) ( IN-CITY ?auto_12995 ?auto_12996 ) ( IN-CITY ?auto_12986 ?auto_12996 ) ( not ( = ?auto_12986 ?auto_12995 ) ) ( OBJ-AT ?auto_12988 ?auto_12995 ) ( OBJ-AT ?auto_12985 ?auto_12986 ) ( OBJ-AT ?auto_12987 ?auto_12986 ) ( OBJ-AT ?auto_12989 ?auto_12986 ) ( not ( = ?auto_12985 ?auto_12987 ) ) ( not ( = ?auto_12985 ?auto_12989 ) ) ( not ( = ?auto_12985 ?auto_12990 ) ) ( not ( = ?auto_12985 ?auto_12991 ) ) ( not ( = ?auto_12985 ?auto_12988 ) ) ( not ( = ?auto_12987 ?auto_12989 ) ) ( not ( = ?auto_12987 ?auto_12990 ) ) ( not ( = ?auto_12987 ?auto_12991 ) ) ( not ( = ?auto_12987 ?auto_12988 ) ) ( not ( = ?auto_12989 ?auto_12990 ) ) ( not ( = ?auto_12989 ?auto_12991 ) ) ( not ( = ?auto_12989 ?auto_12988 ) ) ( not ( = ?auto_12990 ?auto_12991 ) ) ( not ( = ?auto_12990 ?auto_12988 ) ) ( not ( = ?auto_12991 ?auto_12988 ) ) ( IN-CITY ?auto_12992 ?auto_12996 ) ( not ( = ?auto_12986 ?auto_12992 ) ) ( not ( = ?auto_12995 ?auto_12992 ) ) ( OBJ-AT ?auto_12991 ?auto_12992 ) ( TRUCK-AT ?auto_12993 ?auto_12994 ) ( IN-CITY ?auto_12994 ?auto_12996 ) ( not ( = ?auto_12986 ?auto_12994 ) ) ( not ( = ?auto_12995 ?auto_12994 ) ) ( not ( = ?auto_12992 ?auto_12994 ) ) ( OBJ-AT ?auto_12990 ?auto_12994 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12990 ?auto_12993 ?auto_12994 )
      ( DELIVER-6PKG ?auto_12985 ?auto_12987 ?auto_12989 ?auto_12990 ?auto_12991 ?auto_12988 ?auto_12986 )
      ( DELIVER-6PKG-VERIFY ?auto_12985 ?auto_12987 ?auto_12989 ?auto_12990 ?auto_12991 ?auto_12988 ?auto_12986 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_13004 - OBJ
      ?auto_13006 - OBJ
      ?auto_13008 - OBJ
      ?auto_13009 - OBJ
      ?auto_13010 - OBJ
      ?auto_13007 - OBJ
      ?auto_13005 - LOCATION
    )
    :vars
    (
      ?auto_13013 - LOCATION
      ?auto_13015 - CITY
      ?auto_13012 - LOCATION
      ?auto_13011 - LOCATION
      ?auto_13014 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13006 ?auto_13004 ) ( GREATER-THAN ?auto_13008 ?auto_13004 ) ( GREATER-THAN ?auto_13008 ?auto_13006 ) ( GREATER-THAN ?auto_13009 ?auto_13004 ) ( GREATER-THAN ?auto_13009 ?auto_13006 ) ( GREATER-THAN ?auto_13009 ?auto_13008 ) ( GREATER-THAN ?auto_13010 ?auto_13004 ) ( GREATER-THAN ?auto_13010 ?auto_13006 ) ( GREATER-THAN ?auto_13010 ?auto_13008 ) ( GREATER-THAN ?auto_13010 ?auto_13009 ) ( GREATER-THAN ?auto_13007 ?auto_13004 ) ( GREATER-THAN ?auto_13007 ?auto_13006 ) ( GREATER-THAN ?auto_13007 ?auto_13008 ) ( GREATER-THAN ?auto_13007 ?auto_13009 ) ( GREATER-THAN ?auto_13007 ?auto_13010 ) ( IN-CITY ?auto_13013 ?auto_13015 ) ( IN-CITY ?auto_13005 ?auto_13015 ) ( not ( = ?auto_13005 ?auto_13013 ) ) ( OBJ-AT ?auto_13007 ?auto_13013 ) ( OBJ-AT ?auto_13004 ?auto_13005 ) ( OBJ-AT ?auto_13006 ?auto_13005 ) ( OBJ-AT ?auto_13008 ?auto_13005 ) ( not ( = ?auto_13004 ?auto_13006 ) ) ( not ( = ?auto_13004 ?auto_13008 ) ) ( not ( = ?auto_13004 ?auto_13009 ) ) ( not ( = ?auto_13004 ?auto_13010 ) ) ( not ( = ?auto_13004 ?auto_13007 ) ) ( not ( = ?auto_13006 ?auto_13008 ) ) ( not ( = ?auto_13006 ?auto_13009 ) ) ( not ( = ?auto_13006 ?auto_13010 ) ) ( not ( = ?auto_13006 ?auto_13007 ) ) ( not ( = ?auto_13008 ?auto_13009 ) ) ( not ( = ?auto_13008 ?auto_13010 ) ) ( not ( = ?auto_13008 ?auto_13007 ) ) ( not ( = ?auto_13009 ?auto_13010 ) ) ( not ( = ?auto_13009 ?auto_13007 ) ) ( not ( = ?auto_13010 ?auto_13007 ) ) ( IN-CITY ?auto_13012 ?auto_13015 ) ( not ( = ?auto_13005 ?auto_13012 ) ) ( not ( = ?auto_13013 ?auto_13012 ) ) ( OBJ-AT ?auto_13010 ?auto_13012 ) ( IN-CITY ?auto_13011 ?auto_13015 ) ( not ( = ?auto_13005 ?auto_13011 ) ) ( not ( = ?auto_13013 ?auto_13011 ) ) ( not ( = ?auto_13012 ?auto_13011 ) ) ( OBJ-AT ?auto_13009 ?auto_13011 ) ( TRUCK-AT ?auto_13014 ?auto_13005 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13014 ?auto_13005 ?auto_13011 ?auto_13015 )
      ( DELIVER-6PKG ?auto_13004 ?auto_13006 ?auto_13008 ?auto_13009 ?auto_13010 ?auto_13007 ?auto_13005 )
      ( DELIVER-6PKG-VERIFY ?auto_13004 ?auto_13006 ?auto_13008 ?auto_13009 ?auto_13010 ?auto_13007 ?auto_13005 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_13023 - OBJ
      ?auto_13025 - OBJ
      ?auto_13027 - OBJ
      ?auto_13028 - OBJ
      ?auto_13029 - OBJ
      ?auto_13026 - OBJ
      ?auto_13024 - LOCATION
    )
    :vars
    (
      ?auto_13033 - LOCATION
      ?auto_13031 - CITY
      ?auto_13030 - LOCATION
      ?auto_13034 - LOCATION
      ?auto_13032 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13025 ?auto_13023 ) ( GREATER-THAN ?auto_13027 ?auto_13023 ) ( GREATER-THAN ?auto_13027 ?auto_13025 ) ( GREATER-THAN ?auto_13028 ?auto_13023 ) ( GREATER-THAN ?auto_13028 ?auto_13025 ) ( GREATER-THAN ?auto_13028 ?auto_13027 ) ( GREATER-THAN ?auto_13029 ?auto_13023 ) ( GREATER-THAN ?auto_13029 ?auto_13025 ) ( GREATER-THAN ?auto_13029 ?auto_13027 ) ( GREATER-THAN ?auto_13029 ?auto_13028 ) ( GREATER-THAN ?auto_13026 ?auto_13023 ) ( GREATER-THAN ?auto_13026 ?auto_13025 ) ( GREATER-THAN ?auto_13026 ?auto_13027 ) ( GREATER-THAN ?auto_13026 ?auto_13028 ) ( GREATER-THAN ?auto_13026 ?auto_13029 ) ( IN-CITY ?auto_13033 ?auto_13031 ) ( IN-CITY ?auto_13024 ?auto_13031 ) ( not ( = ?auto_13024 ?auto_13033 ) ) ( OBJ-AT ?auto_13026 ?auto_13033 ) ( OBJ-AT ?auto_13023 ?auto_13024 ) ( OBJ-AT ?auto_13025 ?auto_13024 ) ( not ( = ?auto_13023 ?auto_13025 ) ) ( not ( = ?auto_13023 ?auto_13027 ) ) ( not ( = ?auto_13023 ?auto_13028 ) ) ( not ( = ?auto_13023 ?auto_13029 ) ) ( not ( = ?auto_13023 ?auto_13026 ) ) ( not ( = ?auto_13025 ?auto_13027 ) ) ( not ( = ?auto_13025 ?auto_13028 ) ) ( not ( = ?auto_13025 ?auto_13029 ) ) ( not ( = ?auto_13025 ?auto_13026 ) ) ( not ( = ?auto_13027 ?auto_13028 ) ) ( not ( = ?auto_13027 ?auto_13029 ) ) ( not ( = ?auto_13027 ?auto_13026 ) ) ( not ( = ?auto_13028 ?auto_13029 ) ) ( not ( = ?auto_13028 ?auto_13026 ) ) ( not ( = ?auto_13029 ?auto_13026 ) ) ( IN-CITY ?auto_13030 ?auto_13031 ) ( not ( = ?auto_13024 ?auto_13030 ) ) ( not ( = ?auto_13033 ?auto_13030 ) ) ( OBJ-AT ?auto_13029 ?auto_13030 ) ( IN-CITY ?auto_13034 ?auto_13031 ) ( not ( = ?auto_13024 ?auto_13034 ) ) ( not ( = ?auto_13033 ?auto_13034 ) ) ( not ( = ?auto_13030 ?auto_13034 ) ) ( OBJ-AT ?auto_13028 ?auto_13034 ) ( TRUCK-AT ?auto_13032 ?auto_13024 ) ( IN-TRUCK ?auto_13027 ?auto_13032 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13027 ?auto_13024 )
      ( DELIVER-6PKG ?auto_13023 ?auto_13025 ?auto_13027 ?auto_13028 ?auto_13029 ?auto_13026 ?auto_13024 )
      ( DELIVER-6PKG-VERIFY ?auto_13023 ?auto_13025 ?auto_13027 ?auto_13028 ?auto_13029 ?auto_13026 ?auto_13024 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_13042 - OBJ
      ?auto_13044 - OBJ
      ?auto_13046 - OBJ
      ?auto_13047 - OBJ
      ?auto_13048 - OBJ
      ?auto_13045 - OBJ
      ?auto_13043 - LOCATION
    )
    :vars
    (
      ?auto_13050 - LOCATION
      ?auto_13051 - CITY
      ?auto_13052 - LOCATION
      ?auto_13053 - LOCATION
      ?auto_13049 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13044 ?auto_13042 ) ( GREATER-THAN ?auto_13046 ?auto_13042 ) ( GREATER-THAN ?auto_13046 ?auto_13044 ) ( GREATER-THAN ?auto_13047 ?auto_13042 ) ( GREATER-THAN ?auto_13047 ?auto_13044 ) ( GREATER-THAN ?auto_13047 ?auto_13046 ) ( GREATER-THAN ?auto_13048 ?auto_13042 ) ( GREATER-THAN ?auto_13048 ?auto_13044 ) ( GREATER-THAN ?auto_13048 ?auto_13046 ) ( GREATER-THAN ?auto_13048 ?auto_13047 ) ( GREATER-THAN ?auto_13045 ?auto_13042 ) ( GREATER-THAN ?auto_13045 ?auto_13044 ) ( GREATER-THAN ?auto_13045 ?auto_13046 ) ( GREATER-THAN ?auto_13045 ?auto_13047 ) ( GREATER-THAN ?auto_13045 ?auto_13048 ) ( IN-CITY ?auto_13050 ?auto_13051 ) ( IN-CITY ?auto_13043 ?auto_13051 ) ( not ( = ?auto_13043 ?auto_13050 ) ) ( OBJ-AT ?auto_13045 ?auto_13050 ) ( OBJ-AT ?auto_13042 ?auto_13043 ) ( OBJ-AT ?auto_13044 ?auto_13043 ) ( not ( = ?auto_13042 ?auto_13044 ) ) ( not ( = ?auto_13042 ?auto_13046 ) ) ( not ( = ?auto_13042 ?auto_13047 ) ) ( not ( = ?auto_13042 ?auto_13048 ) ) ( not ( = ?auto_13042 ?auto_13045 ) ) ( not ( = ?auto_13044 ?auto_13046 ) ) ( not ( = ?auto_13044 ?auto_13047 ) ) ( not ( = ?auto_13044 ?auto_13048 ) ) ( not ( = ?auto_13044 ?auto_13045 ) ) ( not ( = ?auto_13046 ?auto_13047 ) ) ( not ( = ?auto_13046 ?auto_13048 ) ) ( not ( = ?auto_13046 ?auto_13045 ) ) ( not ( = ?auto_13047 ?auto_13048 ) ) ( not ( = ?auto_13047 ?auto_13045 ) ) ( not ( = ?auto_13048 ?auto_13045 ) ) ( IN-CITY ?auto_13052 ?auto_13051 ) ( not ( = ?auto_13043 ?auto_13052 ) ) ( not ( = ?auto_13050 ?auto_13052 ) ) ( OBJ-AT ?auto_13048 ?auto_13052 ) ( IN-CITY ?auto_13053 ?auto_13051 ) ( not ( = ?auto_13043 ?auto_13053 ) ) ( not ( = ?auto_13050 ?auto_13053 ) ) ( not ( = ?auto_13052 ?auto_13053 ) ) ( OBJ-AT ?auto_13047 ?auto_13053 ) ( IN-TRUCK ?auto_13046 ?auto_13049 ) ( TRUCK-AT ?auto_13049 ?auto_13050 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13049 ?auto_13050 ?auto_13043 ?auto_13051 )
      ( DELIVER-6PKG ?auto_13042 ?auto_13044 ?auto_13046 ?auto_13047 ?auto_13048 ?auto_13045 ?auto_13043 )
      ( DELIVER-6PKG-VERIFY ?auto_13042 ?auto_13044 ?auto_13046 ?auto_13047 ?auto_13048 ?auto_13045 ?auto_13043 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_13061 - OBJ
      ?auto_13063 - OBJ
      ?auto_13065 - OBJ
      ?auto_13066 - OBJ
      ?auto_13067 - OBJ
      ?auto_13064 - OBJ
      ?auto_13062 - LOCATION
    )
    :vars
    (
      ?auto_13072 - LOCATION
      ?auto_13069 - CITY
      ?auto_13071 - LOCATION
      ?auto_13070 - LOCATION
      ?auto_13068 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13063 ?auto_13061 ) ( GREATER-THAN ?auto_13065 ?auto_13061 ) ( GREATER-THAN ?auto_13065 ?auto_13063 ) ( GREATER-THAN ?auto_13066 ?auto_13061 ) ( GREATER-THAN ?auto_13066 ?auto_13063 ) ( GREATER-THAN ?auto_13066 ?auto_13065 ) ( GREATER-THAN ?auto_13067 ?auto_13061 ) ( GREATER-THAN ?auto_13067 ?auto_13063 ) ( GREATER-THAN ?auto_13067 ?auto_13065 ) ( GREATER-THAN ?auto_13067 ?auto_13066 ) ( GREATER-THAN ?auto_13064 ?auto_13061 ) ( GREATER-THAN ?auto_13064 ?auto_13063 ) ( GREATER-THAN ?auto_13064 ?auto_13065 ) ( GREATER-THAN ?auto_13064 ?auto_13066 ) ( GREATER-THAN ?auto_13064 ?auto_13067 ) ( IN-CITY ?auto_13072 ?auto_13069 ) ( IN-CITY ?auto_13062 ?auto_13069 ) ( not ( = ?auto_13062 ?auto_13072 ) ) ( OBJ-AT ?auto_13064 ?auto_13072 ) ( OBJ-AT ?auto_13061 ?auto_13062 ) ( OBJ-AT ?auto_13063 ?auto_13062 ) ( not ( = ?auto_13061 ?auto_13063 ) ) ( not ( = ?auto_13061 ?auto_13065 ) ) ( not ( = ?auto_13061 ?auto_13066 ) ) ( not ( = ?auto_13061 ?auto_13067 ) ) ( not ( = ?auto_13061 ?auto_13064 ) ) ( not ( = ?auto_13063 ?auto_13065 ) ) ( not ( = ?auto_13063 ?auto_13066 ) ) ( not ( = ?auto_13063 ?auto_13067 ) ) ( not ( = ?auto_13063 ?auto_13064 ) ) ( not ( = ?auto_13065 ?auto_13066 ) ) ( not ( = ?auto_13065 ?auto_13067 ) ) ( not ( = ?auto_13065 ?auto_13064 ) ) ( not ( = ?auto_13066 ?auto_13067 ) ) ( not ( = ?auto_13066 ?auto_13064 ) ) ( not ( = ?auto_13067 ?auto_13064 ) ) ( IN-CITY ?auto_13071 ?auto_13069 ) ( not ( = ?auto_13062 ?auto_13071 ) ) ( not ( = ?auto_13072 ?auto_13071 ) ) ( OBJ-AT ?auto_13067 ?auto_13071 ) ( IN-CITY ?auto_13070 ?auto_13069 ) ( not ( = ?auto_13062 ?auto_13070 ) ) ( not ( = ?auto_13072 ?auto_13070 ) ) ( not ( = ?auto_13071 ?auto_13070 ) ) ( OBJ-AT ?auto_13066 ?auto_13070 ) ( TRUCK-AT ?auto_13068 ?auto_13072 ) ( OBJ-AT ?auto_13065 ?auto_13072 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13065 ?auto_13068 ?auto_13072 )
      ( DELIVER-6PKG ?auto_13061 ?auto_13063 ?auto_13065 ?auto_13066 ?auto_13067 ?auto_13064 ?auto_13062 )
      ( DELIVER-6PKG-VERIFY ?auto_13061 ?auto_13063 ?auto_13065 ?auto_13066 ?auto_13067 ?auto_13064 ?auto_13062 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_13080 - OBJ
      ?auto_13082 - OBJ
      ?auto_13084 - OBJ
      ?auto_13085 - OBJ
      ?auto_13086 - OBJ
      ?auto_13083 - OBJ
      ?auto_13081 - LOCATION
    )
    :vars
    (
      ?auto_13089 - LOCATION
      ?auto_13087 - CITY
      ?auto_13091 - LOCATION
      ?auto_13090 - LOCATION
      ?auto_13088 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13082 ?auto_13080 ) ( GREATER-THAN ?auto_13084 ?auto_13080 ) ( GREATER-THAN ?auto_13084 ?auto_13082 ) ( GREATER-THAN ?auto_13085 ?auto_13080 ) ( GREATER-THAN ?auto_13085 ?auto_13082 ) ( GREATER-THAN ?auto_13085 ?auto_13084 ) ( GREATER-THAN ?auto_13086 ?auto_13080 ) ( GREATER-THAN ?auto_13086 ?auto_13082 ) ( GREATER-THAN ?auto_13086 ?auto_13084 ) ( GREATER-THAN ?auto_13086 ?auto_13085 ) ( GREATER-THAN ?auto_13083 ?auto_13080 ) ( GREATER-THAN ?auto_13083 ?auto_13082 ) ( GREATER-THAN ?auto_13083 ?auto_13084 ) ( GREATER-THAN ?auto_13083 ?auto_13085 ) ( GREATER-THAN ?auto_13083 ?auto_13086 ) ( IN-CITY ?auto_13089 ?auto_13087 ) ( IN-CITY ?auto_13081 ?auto_13087 ) ( not ( = ?auto_13081 ?auto_13089 ) ) ( OBJ-AT ?auto_13083 ?auto_13089 ) ( OBJ-AT ?auto_13080 ?auto_13081 ) ( OBJ-AT ?auto_13082 ?auto_13081 ) ( not ( = ?auto_13080 ?auto_13082 ) ) ( not ( = ?auto_13080 ?auto_13084 ) ) ( not ( = ?auto_13080 ?auto_13085 ) ) ( not ( = ?auto_13080 ?auto_13086 ) ) ( not ( = ?auto_13080 ?auto_13083 ) ) ( not ( = ?auto_13082 ?auto_13084 ) ) ( not ( = ?auto_13082 ?auto_13085 ) ) ( not ( = ?auto_13082 ?auto_13086 ) ) ( not ( = ?auto_13082 ?auto_13083 ) ) ( not ( = ?auto_13084 ?auto_13085 ) ) ( not ( = ?auto_13084 ?auto_13086 ) ) ( not ( = ?auto_13084 ?auto_13083 ) ) ( not ( = ?auto_13085 ?auto_13086 ) ) ( not ( = ?auto_13085 ?auto_13083 ) ) ( not ( = ?auto_13086 ?auto_13083 ) ) ( IN-CITY ?auto_13091 ?auto_13087 ) ( not ( = ?auto_13081 ?auto_13091 ) ) ( not ( = ?auto_13089 ?auto_13091 ) ) ( OBJ-AT ?auto_13086 ?auto_13091 ) ( IN-CITY ?auto_13090 ?auto_13087 ) ( not ( = ?auto_13081 ?auto_13090 ) ) ( not ( = ?auto_13089 ?auto_13090 ) ) ( not ( = ?auto_13091 ?auto_13090 ) ) ( OBJ-AT ?auto_13085 ?auto_13090 ) ( OBJ-AT ?auto_13084 ?auto_13089 ) ( TRUCK-AT ?auto_13088 ?auto_13081 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13088 ?auto_13081 ?auto_13089 ?auto_13087 )
      ( DELIVER-6PKG ?auto_13080 ?auto_13082 ?auto_13084 ?auto_13085 ?auto_13086 ?auto_13083 ?auto_13081 )
      ( DELIVER-6PKG-VERIFY ?auto_13080 ?auto_13082 ?auto_13084 ?auto_13085 ?auto_13086 ?auto_13083 ?auto_13081 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_13099 - OBJ
      ?auto_13101 - OBJ
      ?auto_13103 - OBJ
      ?auto_13104 - OBJ
      ?auto_13105 - OBJ
      ?auto_13102 - OBJ
      ?auto_13100 - LOCATION
    )
    :vars
    (
      ?auto_13106 - LOCATION
      ?auto_13110 - CITY
      ?auto_13108 - LOCATION
      ?auto_13107 - LOCATION
      ?auto_13109 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13101 ?auto_13099 ) ( GREATER-THAN ?auto_13103 ?auto_13099 ) ( GREATER-THAN ?auto_13103 ?auto_13101 ) ( GREATER-THAN ?auto_13104 ?auto_13099 ) ( GREATER-THAN ?auto_13104 ?auto_13101 ) ( GREATER-THAN ?auto_13104 ?auto_13103 ) ( GREATER-THAN ?auto_13105 ?auto_13099 ) ( GREATER-THAN ?auto_13105 ?auto_13101 ) ( GREATER-THAN ?auto_13105 ?auto_13103 ) ( GREATER-THAN ?auto_13105 ?auto_13104 ) ( GREATER-THAN ?auto_13102 ?auto_13099 ) ( GREATER-THAN ?auto_13102 ?auto_13101 ) ( GREATER-THAN ?auto_13102 ?auto_13103 ) ( GREATER-THAN ?auto_13102 ?auto_13104 ) ( GREATER-THAN ?auto_13102 ?auto_13105 ) ( IN-CITY ?auto_13106 ?auto_13110 ) ( IN-CITY ?auto_13100 ?auto_13110 ) ( not ( = ?auto_13100 ?auto_13106 ) ) ( OBJ-AT ?auto_13102 ?auto_13106 ) ( OBJ-AT ?auto_13099 ?auto_13100 ) ( not ( = ?auto_13099 ?auto_13101 ) ) ( not ( = ?auto_13099 ?auto_13103 ) ) ( not ( = ?auto_13099 ?auto_13104 ) ) ( not ( = ?auto_13099 ?auto_13105 ) ) ( not ( = ?auto_13099 ?auto_13102 ) ) ( not ( = ?auto_13101 ?auto_13103 ) ) ( not ( = ?auto_13101 ?auto_13104 ) ) ( not ( = ?auto_13101 ?auto_13105 ) ) ( not ( = ?auto_13101 ?auto_13102 ) ) ( not ( = ?auto_13103 ?auto_13104 ) ) ( not ( = ?auto_13103 ?auto_13105 ) ) ( not ( = ?auto_13103 ?auto_13102 ) ) ( not ( = ?auto_13104 ?auto_13105 ) ) ( not ( = ?auto_13104 ?auto_13102 ) ) ( not ( = ?auto_13105 ?auto_13102 ) ) ( IN-CITY ?auto_13108 ?auto_13110 ) ( not ( = ?auto_13100 ?auto_13108 ) ) ( not ( = ?auto_13106 ?auto_13108 ) ) ( OBJ-AT ?auto_13105 ?auto_13108 ) ( IN-CITY ?auto_13107 ?auto_13110 ) ( not ( = ?auto_13100 ?auto_13107 ) ) ( not ( = ?auto_13106 ?auto_13107 ) ) ( not ( = ?auto_13108 ?auto_13107 ) ) ( OBJ-AT ?auto_13104 ?auto_13107 ) ( OBJ-AT ?auto_13103 ?auto_13106 ) ( TRUCK-AT ?auto_13109 ?auto_13100 ) ( IN-TRUCK ?auto_13101 ?auto_13109 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13101 ?auto_13100 )
      ( DELIVER-6PKG ?auto_13099 ?auto_13101 ?auto_13103 ?auto_13104 ?auto_13105 ?auto_13102 ?auto_13100 )
      ( DELIVER-6PKG-VERIFY ?auto_13099 ?auto_13101 ?auto_13103 ?auto_13104 ?auto_13105 ?auto_13102 ?auto_13100 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_13118 - OBJ
      ?auto_13120 - OBJ
      ?auto_13122 - OBJ
      ?auto_13123 - OBJ
      ?auto_13124 - OBJ
      ?auto_13121 - OBJ
      ?auto_13119 - LOCATION
    )
    :vars
    (
      ?auto_13129 - LOCATION
      ?auto_13126 - CITY
      ?auto_13125 - LOCATION
      ?auto_13128 - LOCATION
      ?auto_13127 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13120 ?auto_13118 ) ( GREATER-THAN ?auto_13122 ?auto_13118 ) ( GREATER-THAN ?auto_13122 ?auto_13120 ) ( GREATER-THAN ?auto_13123 ?auto_13118 ) ( GREATER-THAN ?auto_13123 ?auto_13120 ) ( GREATER-THAN ?auto_13123 ?auto_13122 ) ( GREATER-THAN ?auto_13124 ?auto_13118 ) ( GREATER-THAN ?auto_13124 ?auto_13120 ) ( GREATER-THAN ?auto_13124 ?auto_13122 ) ( GREATER-THAN ?auto_13124 ?auto_13123 ) ( GREATER-THAN ?auto_13121 ?auto_13118 ) ( GREATER-THAN ?auto_13121 ?auto_13120 ) ( GREATER-THAN ?auto_13121 ?auto_13122 ) ( GREATER-THAN ?auto_13121 ?auto_13123 ) ( GREATER-THAN ?auto_13121 ?auto_13124 ) ( IN-CITY ?auto_13129 ?auto_13126 ) ( IN-CITY ?auto_13119 ?auto_13126 ) ( not ( = ?auto_13119 ?auto_13129 ) ) ( OBJ-AT ?auto_13121 ?auto_13129 ) ( OBJ-AT ?auto_13118 ?auto_13119 ) ( not ( = ?auto_13118 ?auto_13120 ) ) ( not ( = ?auto_13118 ?auto_13122 ) ) ( not ( = ?auto_13118 ?auto_13123 ) ) ( not ( = ?auto_13118 ?auto_13124 ) ) ( not ( = ?auto_13118 ?auto_13121 ) ) ( not ( = ?auto_13120 ?auto_13122 ) ) ( not ( = ?auto_13120 ?auto_13123 ) ) ( not ( = ?auto_13120 ?auto_13124 ) ) ( not ( = ?auto_13120 ?auto_13121 ) ) ( not ( = ?auto_13122 ?auto_13123 ) ) ( not ( = ?auto_13122 ?auto_13124 ) ) ( not ( = ?auto_13122 ?auto_13121 ) ) ( not ( = ?auto_13123 ?auto_13124 ) ) ( not ( = ?auto_13123 ?auto_13121 ) ) ( not ( = ?auto_13124 ?auto_13121 ) ) ( IN-CITY ?auto_13125 ?auto_13126 ) ( not ( = ?auto_13119 ?auto_13125 ) ) ( not ( = ?auto_13129 ?auto_13125 ) ) ( OBJ-AT ?auto_13124 ?auto_13125 ) ( IN-CITY ?auto_13128 ?auto_13126 ) ( not ( = ?auto_13119 ?auto_13128 ) ) ( not ( = ?auto_13129 ?auto_13128 ) ) ( not ( = ?auto_13125 ?auto_13128 ) ) ( OBJ-AT ?auto_13123 ?auto_13128 ) ( OBJ-AT ?auto_13122 ?auto_13129 ) ( IN-TRUCK ?auto_13120 ?auto_13127 ) ( TRUCK-AT ?auto_13127 ?auto_13125 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13127 ?auto_13125 ?auto_13119 ?auto_13126 )
      ( DELIVER-6PKG ?auto_13118 ?auto_13120 ?auto_13122 ?auto_13123 ?auto_13124 ?auto_13121 ?auto_13119 )
      ( DELIVER-6PKG-VERIFY ?auto_13118 ?auto_13120 ?auto_13122 ?auto_13123 ?auto_13124 ?auto_13121 ?auto_13119 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_13137 - OBJ
      ?auto_13139 - OBJ
      ?auto_13141 - OBJ
      ?auto_13142 - OBJ
      ?auto_13143 - OBJ
      ?auto_13140 - OBJ
      ?auto_13138 - LOCATION
    )
    :vars
    (
      ?auto_13148 - LOCATION
      ?auto_13146 - CITY
      ?auto_13144 - LOCATION
      ?auto_13145 - LOCATION
      ?auto_13147 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13139 ?auto_13137 ) ( GREATER-THAN ?auto_13141 ?auto_13137 ) ( GREATER-THAN ?auto_13141 ?auto_13139 ) ( GREATER-THAN ?auto_13142 ?auto_13137 ) ( GREATER-THAN ?auto_13142 ?auto_13139 ) ( GREATER-THAN ?auto_13142 ?auto_13141 ) ( GREATER-THAN ?auto_13143 ?auto_13137 ) ( GREATER-THAN ?auto_13143 ?auto_13139 ) ( GREATER-THAN ?auto_13143 ?auto_13141 ) ( GREATER-THAN ?auto_13143 ?auto_13142 ) ( GREATER-THAN ?auto_13140 ?auto_13137 ) ( GREATER-THAN ?auto_13140 ?auto_13139 ) ( GREATER-THAN ?auto_13140 ?auto_13141 ) ( GREATER-THAN ?auto_13140 ?auto_13142 ) ( GREATER-THAN ?auto_13140 ?auto_13143 ) ( IN-CITY ?auto_13148 ?auto_13146 ) ( IN-CITY ?auto_13138 ?auto_13146 ) ( not ( = ?auto_13138 ?auto_13148 ) ) ( OBJ-AT ?auto_13140 ?auto_13148 ) ( OBJ-AT ?auto_13137 ?auto_13138 ) ( not ( = ?auto_13137 ?auto_13139 ) ) ( not ( = ?auto_13137 ?auto_13141 ) ) ( not ( = ?auto_13137 ?auto_13142 ) ) ( not ( = ?auto_13137 ?auto_13143 ) ) ( not ( = ?auto_13137 ?auto_13140 ) ) ( not ( = ?auto_13139 ?auto_13141 ) ) ( not ( = ?auto_13139 ?auto_13142 ) ) ( not ( = ?auto_13139 ?auto_13143 ) ) ( not ( = ?auto_13139 ?auto_13140 ) ) ( not ( = ?auto_13141 ?auto_13142 ) ) ( not ( = ?auto_13141 ?auto_13143 ) ) ( not ( = ?auto_13141 ?auto_13140 ) ) ( not ( = ?auto_13142 ?auto_13143 ) ) ( not ( = ?auto_13142 ?auto_13140 ) ) ( not ( = ?auto_13143 ?auto_13140 ) ) ( IN-CITY ?auto_13144 ?auto_13146 ) ( not ( = ?auto_13138 ?auto_13144 ) ) ( not ( = ?auto_13148 ?auto_13144 ) ) ( OBJ-AT ?auto_13143 ?auto_13144 ) ( IN-CITY ?auto_13145 ?auto_13146 ) ( not ( = ?auto_13138 ?auto_13145 ) ) ( not ( = ?auto_13148 ?auto_13145 ) ) ( not ( = ?auto_13144 ?auto_13145 ) ) ( OBJ-AT ?auto_13142 ?auto_13145 ) ( OBJ-AT ?auto_13141 ?auto_13148 ) ( TRUCK-AT ?auto_13147 ?auto_13144 ) ( OBJ-AT ?auto_13139 ?auto_13144 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13139 ?auto_13147 ?auto_13144 )
      ( DELIVER-6PKG ?auto_13137 ?auto_13139 ?auto_13141 ?auto_13142 ?auto_13143 ?auto_13140 ?auto_13138 )
      ( DELIVER-6PKG-VERIFY ?auto_13137 ?auto_13139 ?auto_13141 ?auto_13142 ?auto_13143 ?auto_13140 ?auto_13138 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_13156 - OBJ
      ?auto_13158 - OBJ
      ?auto_13160 - OBJ
      ?auto_13161 - OBJ
      ?auto_13162 - OBJ
      ?auto_13159 - OBJ
      ?auto_13157 - LOCATION
    )
    :vars
    (
      ?auto_13163 - LOCATION
      ?auto_13166 - CITY
      ?auto_13165 - LOCATION
      ?auto_13164 - LOCATION
      ?auto_13167 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13158 ?auto_13156 ) ( GREATER-THAN ?auto_13160 ?auto_13156 ) ( GREATER-THAN ?auto_13160 ?auto_13158 ) ( GREATER-THAN ?auto_13161 ?auto_13156 ) ( GREATER-THAN ?auto_13161 ?auto_13158 ) ( GREATER-THAN ?auto_13161 ?auto_13160 ) ( GREATER-THAN ?auto_13162 ?auto_13156 ) ( GREATER-THAN ?auto_13162 ?auto_13158 ) ( GREATER-THAN ?auto_13162 ?auto_13160 ) ( GREATER-THAN ?auto_13162 ?auto_13161 ) ( GREATER-THAN ?auto_13159 ?auto_13156 ) ( GREATER-THAN ?auto_13159 ?auto_13158 ) ( GREATER-THAN ?auto_13159 ?auto_13160 ) ( GREATER-THAN ?auto_13159 ?auto_13161 ) ( GREATER-THAN ?auto_13159 ?auto_13162 ) ( IN-CITY ?auto_13163 ?auto_13166 ) ( IN-CITY ?auto_13157 ?auto_13166 ) ( not ( = ?auto_13157 ?auto_13163 ) ) ( OBJ-AT ?auto_13159 ?auto_13163 ) ( OBJ-AT ?auto_13156 ?auto_13157 ) ( not ( = ?auto_13156 ?auto_13158 ) ) ( not ( = ?auto_13156 ?auto_13160 ) ) ( not ( = ?auto_13156 ?auto_13161 ) ) ( not ( = ?auto_13156 ?auto_13162 ) ) ( not ( = ?auto_13156 ?auto_13159 ) ) ( not ( = ?auto_13158 ?auto_13160 ) ) ( not ( = ?auto_13158 ?auto_13161 ) ) ( not ( = ?auto_13158 ?auto_13162 ) ) ( not ( = ?auto_13158 ?auto_13159 ) ) ( not ( = ?auto_13160 ?auto_13161 ) ) ( not ( = ?auto_13160 ?auto_13162 ) ) ( not ( = ?auto_13160 ?auto_13159 ) ) ( not ( = ?auto_13161 ?auto_13162 ) ) ( not ( = ?auto_13161 ?auto_13159 ) ) ( not ( = ?auto_13162 ?auto_13159 ) ) ( IN-CITY ?auto_13165 ?auto_13166 ) ( not ( = ?auto_13157 ?auto_13165 ) ) ( not ( = ?auto_13163 ?auto_13165 ) ) ( OBJ-AT ?auto_13162 ?auto_13165 ) ( IN-CITY ?auto_13164 ?auto_13166 ) ( not ( = ?auto_13157 ?auto_13164 ) ) ( not ( = ?auto_13163 ?auto_13164 ) ) ( not ( = ?auto_13165 ?auto_13164 ) ) ( OBJ-AT ?auto_13161 ?auto_13164 ) ( OBJ-AT ?auto_13160 ?auto_13163 ) ( OBJ-AT ?auto_13158 ?auto_13165 ) ( TRUCK-AT ?auto_13167 ?auto_13157 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13167 ?auto_13157 ?auto_13165 ?auto_13166 )
      ( DELIVER-6PKG ?auto_13156 ?auto_13158 ?auto_13160 ?auto_13161 ?auto_13162 ?auto_13159 ?auto_13157 )
      ( DELIVER-6PKG-VERIFY ?auto_13156 ?auto_13158 ?auto_13160 ?auto_13161 ?auto_13162 ?auto_13159 ?auto_13157 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_13175 - OBJ
      ?auto_13177 - OBJ
      ?auto_13179 - OBJ
      ?auto_13180 - OBJ
      ?auto_13181 - OBJ
      ?auto_13178 - OBJ
      ?auto_13176 - LOCATION
    )
    :vars
    (
      ?auto_13184 - LOCATION
      ?auto_13183 - CITY
      ?auto_13182 - LOCATION
      ?auto_13186 - LOCATION
      ?auto_13185 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13177 ?auto_13175 ) ( GREATER-THAN ?auto_13179 ?auto_13175 ) ( GREATER-THAN ?auto_13179 ?auto_13177 ) ( GREATER-THAN ?auto_13180 ?auto_13175 ) ( GREATER-THAN ?auto_13180 ?auto_13177 ) ( GREATER-THAN ?auto_13180 ?auto_13179 ) ( GREATER-THAN ?auto_13181 ?auto_13175 ) ( GREATER-THAN ?auto_13181 ?auto_13177 ) ( GREATER-THAN ?auto_13181 ?auto_13179 ) ( GREATER-THAN ?auto_13181 ?auto_13180 ) ( GREATER-THAN ?auto_13178 ?auto_13175 ) ( GREATER-THAN ?auto_13178 ?auto_13177 ) ( GREATER-THAN ?auto_13178 ?auto_13179 ) ( GREATER-THAN ?auto_13178 ?auto_13180 ) ( GREATER-THAN ?auto_13178 ?auto_13181 ) ( IN-CITY ?auto_13184 ?auto_13183 ) ( IN-CITY ?auto_13176 ?auto_13183 ) ( not ( = ?auto_13176 ?auto_13184 ) ) ( OBJ-AT ?auto_13178 ?auto_13184 ) ( not ( = ?auto_13175 ?auto_13177 ) ) ( not ( = ?auto_13175 ?auto_13179 ) ) ( not ( = ?auto_13175 ?auto_13180 ) ) ( not ( = ?auto_13175 ?auto_13181 ) ) ( not ( = ?auto_13175 ?auto_13178 ) ) ( not ( = ?auto_13177 ?auto_13179 ) ) ( not ( = ?auto_13177 ?auto_13180 ) ) ( not ( = ?auto_13177 ?auto_13181 ) ) ( not ( = ?auto_13177 ?auto_13178 ) ) ( not ( = ?auto_13179 ?auto_13180 ) ) ( not ( = ?auto_13179 ?auto_13181 ) ) ( not ( = ?auto_13179 ?auto_13178 ) ) ( not ( = ?auto_13180 ?auto_13181 ) ) ( not ( = ?auto_13180 ?auto_13178 ) ) ( not ( = ?auto_13181 ?auto_13178 ) ) ( IN-CITY ?auto_13182 ?auto_13183 ) ( not ( = ?auto_13176 ?auto_13182 ) ) ( not ( = ?auto_13184 ?auto_13182 ) ) ( OBJ-AT ?auto_13181 ?auto_13182 ) ( IN-CITY ?auto_13186 ?auto_13183 ) ( not ( = ?auto_13176 ?auto_13186 ) ) ( not ( = ?auto_13184 ?auto_13186 ) ) ( not ( = ?auto_13182 ?auto_13186 ) ) ( OBJ-AT ?auto_13180 ?auto_13186 ) ( OBJ-AT ?auto_13179 ?auto_13184 ) ( OBJ-AT ?auto_13177 ?auto_13182 ) ( TRUCK-AT ?auto_13185 ?auto_13176 ) ( IN-TRUCK ?auto_13175 ?auto_13185 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13175 ?auto_13176 )
      ( DELIVER-6PKG ?auto_13175 ?auto_13177 ?auto_13179 ?auto_13180 ?auto_13181 ?auto_13178 ?auto_13176 )
      ( DELIVER-6PKG-VERIFY ?auto_13175 ?auto_13177 ?auto_13179 ?auto_13180 ?auto_13181 ?auto_13178 ?auto_13176 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_13194 - OBJ
      ?auto_13196 - OBJ
      ?auto_13198 - OBJ
      ?auto_13199 - OBJ
      ?auto_13200 - OBJ
      ?auto_13197 - OBJ
      ?auto_13195 - LOCATION
    )
    :vars
    (
      ?auto_13205 - LOCATION
      ?auto_13201 - CITY
      ?auto_13202 - LOCATION
      ?auto_13204 - LOCATION
      ?auto_13203 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13196 ?auto_13194 ) ( GREATER-THAN ?auto_13198 ?auto_13194 ) ( GREATER-THAN ?auto_13198 ?auto_13196 ) ( GREATER-THAN ?auto_13199 ?auto_13194 ) ( GREATER-THAN ?auto_13199 ?auto_13196 ) ( GREATER-THAN ?auto_13199 ?auto_13198 ) ( GREATER-THAN ?auto_13200 ?auto_13194 ) ( GREATER-THAN ?auto_13200 ?auto_13196 ) ( GREATER-THAN ?auto_13200 ?auto_13198 ) ( GREATER-THAN ?auto_13200 ?auto_13199 ) ( GREATER-THAN ?auto_13197 ?auto_13194 ) ( GREATER-THAN ?auto_13197 ?auto_13196 ) ( GREATER-THAN ?auto_13197 ?auto_13198 ) ( GREATER-THAN ?auto_13197 ?auto_13199 ) ( GREATER-THAN ?auto_13197 ?auto_13200 ) ( IN-CITY ?auto_13205 ?auto_13201 ) ( IN-CITY ?auto_13195 ?auto_13201 ) ( not ( = ?auto_13195 ?auto_13205 ) ) ( OBJ-AT ?auto_13197 ?auto_13205 ) ( not ( = ?auto_13194 ?auto_13196 ) ) ( not ( = ?auto_13194 ?auto_13198 ) ) ( not ( = ?auto_13194 ?auto_13199 ) ) ( not ( = ?auto_13194 ?auto_13200 ) ) ( not ( = ?auto_13194 ?auto_13197 ) ) ( not ( = ?auto_13196 ?auto_13198 ) ) ( not ( = ?auto_13196 ?auto_13199 ) ) ( not ( = ?auto_13196 ?auto_13200 ) ) ( not ( = ?auto_13196 ?auto_13197 ) ) ( not ( = ?auto_13198 ?auto_13199 ) ) ( not ( = ?auto_13198 ?auto_13200 ) ) ( not ( = ?auto_13198 ?auto_13197 ) ) ( not ( = ?auto_13199 ?auto_13200 ) ) ( not ( = ?auto_13199 ?auto_13197 ) ) ( not ( = ?auto_13200 ?auto_13197 ) ) ( IN-CITY ?auto_13202 ?auto_13201 ) ( not ( = ?auto_13195 ?auto_13202 ) ) ( not ( = ?auto_13205 ?auto_13202 ) ) ( OBJ-AT ?auto_13200 ?auto_13202 ) ( IN-CITY ?auto_13204 ?auto_13201 ) ( not ( = ?auto_13195 ?auto_13204 ) ) ( not ( = ?auto_13205 ?auto_13204 ) ) ( not ( = ?auto_13202 ?auto_13204 ) ) ( OBJ-AT ?auto_13199 ?auto_13204 ) ( OBJ-AT ?auto_13198 ?auto_13205 ) ( OBJ-AT ?auto_13196 ?auto_13202 ) ( IN-TRUCK ?auto_13194 ?auto_13203 ) ( TRUCK-AT ?auto_13203 ?auto_13202 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13203 ?auto_13202 ?auto_13195 ?auto_13201 )
      ( DELIVER-6PKG ?auto_13194 ?auto_13196 ?auto_13198 ?auto_13199 ?auto_13200 ?auto_13197 ?auto_13195 )
      ( DELIVER-6PKG-VERIFY ?auto_13194 ?auto_13196 ?auto_13198 ?auto_13199 ?auto_13200 ?auto_13197 ?auto_13195 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_13213 - OBJ
      ?auto_13215 - OBJ
      ?auto_13217 - OBJ
      ?auto_13218 - OBJ
      ?auto_13219 - OBJ
      ?auto_13216 - OBJ
      ?auto_13214 - LOCATION
    )
    :vars
    (
      ?auto_13221 - LOCATION
      ?auto_13223 - CITY
      ?auto_13220 - LOCATION
      ?auto_13222 - LOCATION
      ?auto_13224 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13215 ?auto_13213 ) ( GREATER-THAN ?auto_13217 ?auto_13213 ) ( GREATER-THAN ?auto_13217 ?auto_13215 ) ( GREATER-THAN ?auto_13218 ?auto_13213 ) ( GREATER-THAN ?auto_13218 ?auto_13215 ) ( GREATER-THAN ?auto_13218 ?auto_13217 ) ( GREATER-THAN ?auto_13219 ?auto_13213 ) ( GREATER-THAN ?auto_13219 ?auto_13215 ) ( GREATER-THAN ?auto_13219 ?auto_13217 ) ( GREATER-THAN ?auto_13219 ?auto_13218 ) ( GREATER-THAN ?auto_13216 ?auto_13213 ) ( GREATER-THAN ?auto_13216 ?auto_13215 ) ( GREATER-THAN ?auto_13216 ?auto_13217 ) ( GREATER-THAN ?auto_13216 ?auto_13218 ) ( GREATER-THAN ?auto_13216 ?auto_13219 ) ( IN-CITY ?auto_13221 ?auto_13223 ) ( IN-CITY ?auto_13214 ?auto_13223 ) ( not ( = ?auto_13214 ?auto_13221 ) ) ( OBJ-AT ?auto_13216 ?auto_13221 ) ( not ( = ?auto_13213 ?auto_13215 ) ) ( not ( = ?auto_13213 ?auto_13217 ) ) ( not ( = ?auto_13213 ?auto_13218 ) ) ( not ( = ?auto_13213 ?auto_13219 ) ) ( not ( = ?auto_13213 ?auto_13216 ) ) ( not ( = ?auto_13215 ?auto_13217 ) ) ( not ( = ?auto_13215 ?auto_13218 ) ) ( not ( = ?auto_13215 ?auto_13219 ) ) ( not ( = ?auto_13215 ?auto_13216 ) ) ( not ( = ?auto_13217 ?auto_13218 ) ) ( not ( = ?auto_13217 ?auto_13219 ) ) ( not ( = ?auto_13217 ?auto_13216 ) ) ( not ( = ?auto_13218 ?auto_13219 ) ) ( not ( = ?auto_13218 ?auto_13216 ) ) ( not ( = ?auto_13219 ?auto_13216 ) ) ( IN-CITY ?auto_13220 ?auto_13223 ) ( not ( = ?auto_13214 ?auto_13220 ) ) ( not ( = ?auto_13221 ?auto_13220 ) ) ( OBJ-AT ?auto_13219 ?auto_13220 ) ( IN-CITY ?auto_13222 ?auto_13223 ) ( not ( = ?auto_13214 ?auto_13222 ) ) ( not ( = ?auto_13221 ?auto_13222 ) ) ( not ( = ?auto_13220 ?auto_13222 ) ) ( OBJ-AT ?auto_13218 ?auto_13222 ) ( OBJ-AT ?auto_13217 ?auto_13221 ) ( OBJ-AT ?auto_13215 ?auto_13220 ) ( TRUCK-AT ?auto_13224 ?auto_13220 ) ( OBJ-AT ?auto_13213 ?auto_13220 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13213 ?auto_13224 ?auto_13220 )
      ( DELIVER-6PKG ?auto_13213 ?auto_13215 ?auto_13217 ?auto_13218 ?auto_13219 ?auto_13216 ?auto_13214 )
      ( DELIVER-6PKG-VERIFY ?auto_13213 ?auto_13215 ?auto_13217 ?auto_13218 ?auto_13219 ?auto_13216 ?auto_13214 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_13232 - OBJ
      ?auto_13234 - OBJ
      ?auto_13236 - OBJ
      ?auto_13237 - OBJ
      ?auto_13238 - OBJ
      ?auto_13235 - OBJ
      ?auto_13233 - LOCATION
    )
    :vars
    (
      ?auto_13240 - LOCATION
      ?auto_13241 - CITY
      ?auto_13242 - LOCATION
      ?auto_13239 - LOCATION
      ?auto_13243 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13234 ?auto_13232 ) ( GREATER-THAN ?auto_13236 ?auto_13232 ) ( GREATER-THAN ?auto_13236 ?auto_13234 ) ( GREATER-THAN ?auto_13237 ?auto_13232 ) ( GREATER-THAN ?auto_13237 ?auto_13234 ) ( GREATER-THAN ?auto_13237 ?auto_13236 ) ( GREATER-THAN ?auto_13238 ?auto_13232 ) ( GREATER-THAN ?auto_13238 ?auto_13234 ) ( GREATER-THAN ?auto_13238 ?auto_13236 ) ( GREATER-THAN ?auto_13238 ?auto_13237 ) ( GREATER-THAN ?auto_13235 ?auto_13232 ) ( GREATER-THAN ?auto_13235 ?auto_13234 ) ( GREATER-THAN ?auto_13235 ?auto_13236 ) ( GREATER-THAN ?auto_13235 ?auto_13237 ) ( GREATER-THAN ?auto_13235 ?auto_13238 ) ( IN-CITY ?auto_13240 ?auto_13241 ) ( IN-CITY ?auto_13233 ?auto_13241 ) ( not ( = ?auto_13233 ?auto_13240 ) ) ( OBJ-AT ?auto_13235 ?auto_13240 ) ( not ( = ?auto_13232 ?auto_13234 ) ) ( not ( = ?auto_13232 ?auto_13236 ) ) ( not ( = ?auto_13232 ?auto_13237 ) ) ( not ( = ?auto_13232 ?auto_13238 ) ) ( not ( = ?auto_13232 ?auto_13235 ) ) ( not ( = ?auto_13234 ?auto_13236 ) ) ( not ( = ?auto_13234 ?auto_13237 ) ) ( not ( = ?auto_13234 ?auto_13238 ) ) ( not ( = ?auto_13234 ?auto_13235 ) ) ( not ( = ?auto_13236 ?auto_13237 ) ) ( not ( = ?auto_13236 ?auto_13238 ) ) ( not ( = ?auto_13236 ?auto_13235 ) ) ( not ( = ?auto_13237 ?auto_13238 ) ) ( not ( = ?auto_13237 ?auto_13235 ) ) ( not ( = ?auto_13238 ?auto_13235 ) ) ( IN-CITY ?auto_13242 ?auto_13241 ) ( not ( = ?auto_13233 ?auto_13242 ) ) ( not ( = ?auto_13240 ?auto_13242 ) ) ( OBJ-AT ?auto_13238 ?auto_13242 ) ( IN-CITY ?auto_13239 ?auto_13241 ) ( not ( = ?auto_13233 ?auto_13239 ) ) ( not ( = ?auto_13240 ?auto_13239 ) ) ( not ( = ?auto_13242 ?auto_13239 ) ) ( OBJ-AT ?auto_13237 ?auto_13239 ) ( OBJ-AT ?auto_13236 ?auto_13240 ) ( OBJ-AT ?auto_13234 ?auto_13242 ) ( OBJ-AT ?auto_13232 ?auto_13242 ) ( TRUCK-AT ?auto_13243 ?auto_13233 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13243 ?auto_13233 ?auto_13242 ?auto_13241 )
      ( DELIVER-6PKG ?auto_13232 ?auto_13234 ?auto_13236 ?auto_13237 ?auto_13238 ?auto_13235 ?auto_13233 )
      ( DELIVER-6PKG-VERIFY ?auto_13232 ?auto_13234 ?auto_13236 ?auto_13237 ?auto_13238 ?auto_13235 ?auto_13233 ) )
  )

)

