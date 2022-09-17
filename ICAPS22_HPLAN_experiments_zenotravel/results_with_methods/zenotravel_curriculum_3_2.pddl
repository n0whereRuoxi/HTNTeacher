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

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_904 - PERSON
      ?auto_903 - CITY
    )
    :vars
    (
      ?auto_907 - FLEVEL
      ?auto_906 - FLEVEL
      ?auto_908 - CITY
      ?auto_905 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_907 ?auto_906 ) ( PERSON-AT ?auto_904 ?auto_908 ) ( AIRCRAFT-AT ?auto_905 ?auto_903 ) ( FUEL-LEVEL ?auto_905 ?auto_907 ) ( not ( = ?auto_903 ?auto_908 ) ) ( not ( = ?auto_907 ?auto_906 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_905 ?auto_903 ?auto_907 ?auto_906 )
      ( !FLY ?auto_905 ?auto_903 ?auto_908 ?auto_906 ?auto_907 )
      ( !REFUEL ?auto_905 ?auto_908 ?auto_907 ?auto_906 )
      ( !BOARD ?auto_904 ?auto_905 ?auto_908 )
      ( !FLY ?auto_905 ?auto_908 ?auto_903 ?auto_906 ?auto_907 )
      ( !DEBARK ?auto_904 ?auto_905 ?auto_903 )
      ( FLY-1PPL-VERIFY ?auto_904 ?auto_903 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_912 - PERSON
      ?auto_911 - CITY
    )
    :vars
    (
      ?auto_915 - FLEVEL
      ?auto_914 - FLEVEL
      ?auto_916 - CITY
      ?auto_913 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_915 ?auto_914 ) ( PERSON-AT ?auto_912 ?auto_916 ) ( AIRCRAFT-AT ?auto_913 ?auto_911 ) ( FUEL-LEVEL ?auto_913 ?auto_915 ) ( not ( = ?auto_911 ?auto_916 ) ) ( not ( = ?auto_915 ?auto_914 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_913 ?auto_911 ?auto_915 ?auto_914 )
      ( !FLY ?auto_913 ?auto_911 ?auto_916 ?auto_914 ?auto_915 )
      ( !REFUEL ?auto_913 ?auto_916 ?auto_915 ?auto_914 )
      ( !BOARD ?auto_912 ?auto_913 ?auto_916 )
      ( !FLY ?auto_913 ?auto_916 ?auto_911 ?auto_914 ?auto_915 )
      ( !DEBARK ?auto_912 ?auto_913 ?auto_911 )
      ( FLY-1PPL-VERIFY ?auto_912 ?auto_911 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_927 - PERSON
      ?auto_928 - PERSON
      ?auto_926 - CITY
    )
    :vars
    (
      ?auto_931 - FLEVEL
      ?auto_929 - FLEVEL
      ?auto_932 - CITY
      ?auto_933 - CITY
      ?auto_930 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_931 ?auto_929 ) ( PERSON-AT ?auto_928 ?auto_932 ) ( not ( = ?auto_926 ?auto_932 ) ) ( not ( = ?auto_931 ?auto_929 ) ) ( PERSON-AT ?auto_927 ?auto_933 ) ( AIRCRAFT-AT ?auto_930 ?auto_926 ) ( FUEL-LEVEL ?auto_930 ?auto_931 ) ( not ( = ?auto_926 ?auto_933 ) ) ( not ( = ?auto_927 ?auto_928 ) ) ( not ( = ?auto_932 ?auto_933 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_927 ?auto_926 )
      ( FLY-1PPL ?auto_928 ?auto_926 )
      ( FLY-2PPL-VERIFY ?auto_927 ?auto_928 ?auto_926 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_935 - PERSON
      ?auto_936 - PERSON
      ?auto_934 - CITY
    )
    :vars
    (
      ?auto_938 - FLEVEL
      ?auto_940 - FLEVEL
      ?auto_939 - CITY
      ?auto_937 - CITY
      ?auto_941 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_938 ?auto_940 ) ( PERSON-AT ?auto_935 ?auto_939 ) ( not ( = ?auto_934 ?auto_939 ) ) ( not ( = ?auto_938 ?auto_940 ) ) ( PERSON-AT ?auto_936 ?auto_937 ) ( AIRCRAFT-AT ?auto_941 ?auto_934 ) ( FUEL-LEVEL ?auto_941 ?auto_938 ) ( not ( = ?auto_934 ?auto_937 ) ) ( not ( = ?auto_936 ?auto_935 ) ) ( not ( = ?auto_939 ?auto_937 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_936 ?auto_935 ?auto_934 )
      ( FLY-2PPL-VERIFY ?auto_935 ?auto_936 ?auto_934 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_954 - PERSON
      ?auto_953 - CITY
    )
    :vars
    (
      ?auto_957 - FLEVEL
      ?auto_956 - FLEVEL
      ?auto_958 - CITY
      ?auto_955 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_957 ?auto_956 ) ( PERSON-AT ?auto_954 ?auto_958 ) ( AIRCRAFT-AT ?auto_955 ?auto_953 ) ( FUEL-LEVEL ?auto_955 ?auto_957 ) ( not ( = ?auto_953 ?auto_958 ) ) ( not ( = ?auto_957 ?auto_956 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_955 ?auto_953 ?auto_957 ?auto_956 )
      ( !FLY ?auto_955 ?auto_953 ?auto_958 ?auto_956 ?auto_957 )
      ( !REFUEL ?auto_955 ?auto_958 ?auto_957 ?auto_956 )
      ( !BOARD ?auto_954 ?auto_955 ?auto_958 )
      ( !FLY ?auto_955 ?auto_958 ?auto_953 ?auto_956 ?auto_957 )
      ( !DEBARK ?auto_954 ?auto_955 ?auto_953 )
      ( FLY-1PPL-VERIFY ?auto_954 ?auto_953 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1046 - PERSON
      ?auto_1047 - PERSON
      ?auto_1048 - PERSON
      ?auto_1045 - CITY
    )
    :vars
    (
      ?auto_1050 - FLEVEL
      ?auto_1051 - FLEVEL
      ?auto_1049 - CITY
      ?auto_1053 - CITY
      ?auto_1052 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1050 ?auto_1051 ) ( PERSON-AT ?auto_1048 ?auto_1049 ) ( not ( = ?auto_1045 ?auto_1049 ) ) ( not ( = ?auto_1050 ?auto_1051 ) ) ( PERSON-AT ?auto_1047 ?auto_1049 ) ( PERSON-AT ?auto_1046 ?auto_1053 ) ( AIRCRAFT-AT ?auto_1052 ?auto_1045 ) ( FUEL-LEVEL ?auto_1052 ?auto_1050 ) ( not ( = ?auto_1045 ?auto_1053 ) ) ( not ( = ?auto_1046 ?auto_1047 ) ) ( not ( = ?auto_1049 ?auto_1053 ) ) ( not ( = ?auto_1046 ?auto_1048 ) ) ( not ( = ?auto_1047 ?auto_1048 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1047 ?auto_1046 ?auto_1045 )
      ( FLY-1PPL ?auto_1048 ?auto_1045 )
      ( FLY-3PPL-VERIFY ?auto_1046 ?auto_1047 ?auto_1048 ?auto_1045 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1065 - PERSON
      ?auto_1066 - PERSON
      ?auto_1067 - PERSON
      ?auto_1064 - CITY
    )
    :vars
    (
      ?auto_1070 - FLEVEL
      ?auto_1071 - FLEVEL
      ?auto_1068 - CITY
      ?auto_1069 - CITY
      ?auto_1072 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1070 ?auto_1071 ) ( PERSON-AT ?auto_1066 ?auto_1068 ) ( not ( = ?auto_1064 ?auto_1068 ) ) ( not ( = ?auto_1070 ?auto_1071 ) ) ( PERSON-AT ?auto_1067 ?auto_1068 ) ( PERSON-AT ?auto_1065 ?auto_1069 ) ( AIRCRAFT-AT ?auto_1072 ?auto_1064 ) ( FUEL-LEVEL ?auto_1072 ?auto_1070 ) ( not ( = ?auto_1064 ?auto_1069 ) ) ( not ( = ?auto_1065 ?auto_1067 ) ) ( not ( = ?auto_1068 ?auto_1069 ) ) ( not ( = ?auto_1065 ?auto_1066 ) ) ( not ( = ?auto_1067 ?auto_1066 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1065 ?auto_1067 ?auto_1066 ?auto_1064 )
      ( FLY-3PPL-VERIFY ?auto_1065 ?auto_1066 ?auto_1067 ?auto_1064 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1084 - PERSON
      ?auto_1085 - PERSON
      ?auto_1086 - PERSON
      ?auto_1083 - CITY
    )
    :vars
    (
      ?auto_1088 - FLEVEL
      ?auto_1090 - FLEVEL
      ?auto_1089 - CITY
      ?auto_1087 - CITY
      ?auto_1091 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1088 ?auto_1090 ) ( PERSON-AT ?auto_1086 ?auto_1089 ) ( not ( = ?auto_1083 ?auto_1089 ) ) ( not ( = ?auto_1088 ?auto_1090 ) ) ( PERSON-AT ?auto_1084 ?auto_1089 ) ( PERSON-AT ?auto_1085 ?auto_1087 ) ( AIRCRAFT-AT ?auto_1091 ?auto_1083 ) ( FUEL-LEVEL ?auto_1091 ?auto_1088 ) ( not ( = ?auto_1083 ?auto_1087 ) ) ( not ( = ?auto_1085 ?auto_1084 ) ) ( not ( = ?auto_1089 ?auto_1087 ) ) ( not ( = ?auto_1085 ?auto_1086 ) ) ( not ( = ?auto_1084 ?auto_1086 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1085 ?auto_1086 ?auto_1084 ?auto_1083 )
      ( FLY-3PPL-VERIFY ?auto_1084 ?auto_1085 ?auto_1086 ?auto_1083 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1103 - PERSON
      ?auto_1104 - PERSON
      ?auto_1105 - PERSON
      ?auto_1102 - CITY
    )
    :vars
    (
      ?auto_1107 - FLEVEL
      ?auto_1109 - FLEVEL
      ?auto_1108 - CITY
      ?auto_1106 - CITY
      ?auto_1110 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1107 ?auto_1109 ) ( PERSON-AT ?auto_1104 ?auto_1108 ) ( not ( = ?auto_1102 ?auto_1108 ) ) ( not ( = ?auto_1107 ?auto_1109 ) ) ( PERSON-AT ?auto_1103 ?auto_1108 ) ( PERSON-AT ?auto_1105 ?auto_1106 ) ( AIRCRAFT-AT ?auto_1110 ?auto_1102 ) ( FUEL-LEVEL ?auto_1110 ?auto_1107 ) ( not ( = ?auto_1102 ?auto_1106 ) ) ( not ( = ?auto_1105 ?auto_1103 ) ) ( not ( = ?auto_1108 ?auto_1106 ) ) ( not ( = ?auto_1105 ?auto_1104 ) ) ( not ( = ?auto_1103 ?auto_1104 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1105 ?auto_1104 ?auto_1103 ?auto_1102 )
      ( FLY-3PPL-VERIFY ?auto_1103 ?auto_1104 ?auto_1105 ?auto_1102 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1142 - PERSON
      ?auto_1143 - PERSON
      ?auto_1144 - PERSON
      ?auto_1141 - CITY
    )
    :vars
    (
      ?auto_1146 - FLEVEL
      ?auto_1148 - FLEVEL
      ?auto_1147 - CITY
      ?auto_1145 - CITY
      ?auto_1149 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1146 ?auto_1148 ) ( PERSON-AT ?auto_1142 ?auto_1147 ) ( not ( = ?auto_1141 ?auto_1147 ) ) ( not ( = ?auto_1146 ?auto_1148 ) ) ( PERSON-AT ?auto_1144 ?auto_1147 ) ( PERSON-AT ?auto_1143 ?auto_1145 ) ( AIRCRAFT-AT ?auto_1149 ?auto_1141 ) ( FUEL-LEVEL ?auto_1149 ?auto_1146 ) ( not ( = ?auto_1141 ?auto_1145 ) ) ( not ( = ?auto_1143 ?auto_1144 ) ) ( not ( = ?auto_1147 ?auto_1145 ) ) ( not ( = ?auto_1143 ?auto_1142 ) ) ( not ( = ?auto_1144 ?auto_1142 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1143 ?auto_1142 ?auto_1144 ?auto_1141 )
      ( FLY-3PPL-VERIFY ?auto_1142 ?auto_1143 ?auto_1144 ?auto_1141 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1161 - PERSON
      ?auto_1162 - PERSON
      ?auto_1163 - PERSON
      ?auto_1160 - CITY
    )
    :vars
    (
      ?auto_1165 - FLEVEL
      ?auto_1167 - FLEVEL
      ?auto_1166 - CITY
      ?auto_1164 - CITY
      ?auto_1168 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1165 ?auto_1167 ) ( PERSON-AT ?auto_1161 ?auto_1166 ) ( not ( = ?auto_1160 ?auto_1166 ) ) ( not ( = ?auto_1165 ?auto_1167 ) ) ( PERSON-AT ?auto_1162 ?auto_1166 ) ( PERSON-AT ?auto_1163 ?auto_1164 ) ( AIRCRAFT-AT ?auto_1168 ?auto_1160 ) ( FUEL-LEVEL ?auto_1168 ?auto_1165 ) ( not ( = ?auto_1160 ?auto_1164 ) ) ( not ( = ?auto_1163 ?auto_1162 ) ) ( not ( = ?auto_1166 ?auto_1164 ) ) ( not ( = ?auto_1163 ?auto_1161 ) ) ( not ( = ?auto_1162 ?auto_1161 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1163 ?auto_1161 ?auto_1162 ?auto_1160 )
      ( FLY-3PPL-VERIFY ?auto_1161 ?auto_1162 ?auto_1163 ?auto_1160 ) )
  )

)

