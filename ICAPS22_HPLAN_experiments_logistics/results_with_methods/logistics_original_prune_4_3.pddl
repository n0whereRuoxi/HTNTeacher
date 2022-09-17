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
      ?auto_135871 - OBJ
      ?auto_135870 - LOCATION
    )
    :vars
    (
      ?auto_135872 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135872 ?auto_135870 ) ( IN-TRUCK ?auto_135871 ?auto_135872 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_135871 ?auto_135872 ?auto_135870 )
      ( DELIVER-1PKG-VERIFY ?auto_135871 ?auto_135870 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135889 - OBJ
      ?auto_135888 - LOCATION
    )
    :vars
    (
      ?auto_135890 - TRUCK
      ?auto_135891 - LOCATION
      ?auto_135892 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135889 ?auto_135890 ) ( TRUCK-AT ?auto_135890 ?auto_135891 ) ( IN-CITY ?auto_135891 ?auto_135892 ) ( IN-CITY ?auto_135888 ?auto_135892 ) ( not ( = ?auto_135888 ?auto_135891 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_135890 ?auto_135891 ?auto_135888 ?auto_135892 )
      ( DELIVER-1PKG ?auto_135889 ?auto_135888 )
      ( DELIVER-1PKG-VERIFY ?auto_135889 ?auto_135888 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135915 - OBJ
      ?auto_135914 - LOCATION
    )
    :vars
    (
      ?auto_135917 - TRUCK
      ?auto_135916 - LOCATION
      ?auto_135918 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135917 ?auto_135916 ) ( IN-CITY ?auto_135916 ?auto_135918 ) ( IN-CITY ?auto_135914 ?auto_135918 ) ( not ( = ?auto_135914 ?auto_135916 ) ) ( OBJ-AT ?auto_135915 ?auto_135916 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_135915 ?auto_135917 ?auto_135916 )
      ( DELIVER-1PKG ?auto_135915 ?auto_135914 )
      ( DELIVER-1PKG-VERIFY ?auto_135915 ?auto_135914 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135941 - OBJ
      ?auto_135940 - LOCATION
    )
    :vars
    (
      ?auto_135943 - LOCATION
      ?auto_135944 - CITY
      ?auto_135942 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135943 ?auto_135944 ) ( IN-CITY ?auto_135940 ?auto_135944 ) ( not ( = ?auto_135940 ?auto_135943 ) ) ( OBJ-AT ?auto_135941 ?auto_135943 ) ( TRUCK-AT ?auto_135942 ?auto_135940 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_135942 ?auto_135940 ?auto_135943 ?auto_135944 )
      ( DELIVER-1PKG ?auto_135941 ?auto_135940 )
      ( DELIVER-1PKG-VERIFY ?auto_135941 ?auto_135940 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136084 - OBJ
      ?auto_136085 - OBJ
      ?auto_136083 - LOCATION
    )
    :vars
    (
      ?auto_136086 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136086 ?auto_136083 ) ( IN-TRUCK ?auto_136085 ?auto_136086 ) ( OBJ-AT ?auto_136084 ?auto_136083 ) ( not ( = ?auto_136084 ?auto_136085 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136085 ?auto_136083 )
      ( DELIVER-2PKG-VERIFY ?auto_136084 ?auto_136085 ?auto_136083 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136088 - OBJ
      ?auto_136089 - OBJ
      ?auto_136087 - LOCATION
    )
    :vars
    (
      ?auto_136090 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136090 ?auto_136087 ) ( IN-TRUCK ?auto_136088 ?auto_136090 ) ( OBJ-AT ?auto_136089 ?auto_136087 ) ( not ( = ?auto_136088 ?auto_136089 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136088 ?auto_136087 )
      ( DELIVER-2PKG-VERIFY ?auto_136088 ?auto_136089 ?auto_136087 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136096 - OBJ
      ?auto_136097 - OBJ
      ?auto_136098 - OBJ
      ?auto_136095 - LOCATION
    )
    :vars
    (
      ?auto_136099 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136099 ?auto_136095 ) ( IN-TRUCK ?auto_136098 ?auto_136099 ) ( OBJ-AT ?auto_136096 ?auto_136095 ) ( OBJ-AT ?auto_136097 ?auto_136095 ) ( not ( = ?auto_136096 ?auto_136097 ) ) ( not ( = ?auto_136096 ?auto_136098 ) ) ( not ( = ?auto_136097 ?auto_136098 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136098 ?auto_136095 )
      ( DELIVER-3PKG-VERIFY ?auto_136096 ?auto_136097 ?auto_136098 ?auto_136095 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136101 - OBJ
      ?auto_136102 - OBJ
      ?auto_136103 - OBJ
      ?auto_136100 - LOCATION
    )
    :vars
    (
      ?auto_136104 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136104 ?auto_136100 ) ( IN-TRUCK ?auto_136102 ?auto_136104 ) ( OBJ-AT ?auto_136101 ?auto_136100 ) ( OBJ-AT ?auto_136103 ?auto_136100 ) ( not ( = ?auto_136101 ?auto_136102 ) ) ( not ( = ?auto_136101 ?auto_136103 ) ) ( not ( = ?auto_136102 ?auto_136103 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136102 ?auto_136100 )
      ( DELIVER-3PKG-VERIFY ?auto_136101 ?auto_136102 ?auto_136103 ?auto_136100 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136111 - OBJ
      ?auto_136112 - OBJ
      ?auto_136113 - OBJ
      ?auto_136110 - LOCATION
    )
    :vars
    (
      ?auto_136114 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136114 ?auto_136110 ) ( IN-TRUCK ?auto_136111 ?auto_136114 ) ( OBJ-AT ?auto_136112 ?auto_136110 ) ( OBJ-AT ?auto_136113 ?auto_136110 ) ( not ( = ?auto_136111 ?auto_136112 ) ) ( not ( = ?auto_136111 ?auto_136113 ) ) ( not ( = ?auto_136112 ?auto_136113 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136111 ?auto_136110 )
      ( DELIVER-3PKG-VERIFY ?auto_136111 ?auto_136112 ?auto_136113 ?auto_136110 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136131 - OBJ
      ?auto_136132 - OBJ
      ?auto_136134 - OBJ
      ?auto_136133 - OBJ
      ?auto_136130 - LOCATION
    )
    :vars
    (
      ?auto_136135 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136135 ?auto_136130 ) ( IN-TRUCK ?auto_136133 ?auto_136135 ) ( OBJ-AT ?auto_136131 ?auto_136130 ) ( OBJ-AT ?auto_136132 ?auto_136130 ) ( OBJ-AT ?auto_136134 ?auto_136130 ) ( not ( = ?auto_136131 ?auto_136132 ) ) ( not ( = ?auto_136131 ?auto_136134 ) ) ( not ( = ?auto_136131 ?auto_136133 ) ) ( not ( = ?auto_136132 ?auto_136134 ) ) ( not ( = ?auto_136132 ?auto_136133 ) ) ( not ( = ?auto_136134 ?auto_136133 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136133 ?auto_136130 )
      ( DELIVER-4PKG-VERIFY ?auto_136131 ?auto_136132 ?auto_136134 ?auto_136133 ?auto_136130 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136137 - OBJ
      ?auto_136138 - OBJ
      ?auto_136140 - OBJ
      ?auto_136139 - OBJ
      ?auto_136136 - LOCATION
    )
    :vars
    (
      ?auto_136141 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136141 ?auto_136136 ) ( IN-TRUCK ?auto_136140 ?auto_136141 ) ( OBJ-AT ?auto_136137 ?auto_136136 ) ( OBJ-AT ?auto_136138 ?auto_136136 ) ( OBJ-AT ?auto_136139 ?auto_136136 ) ( not ( = ?auto_136137 ?auto_136138 ) ) ( not ( = ?auto_136137 ?auto_136140 ) ) ( not ( = ?auto_136137 ?auto_136139 ) ) ( not ( = ?auto_136138 ?auto_136140 ) ) ( not ( = ?auto_136138 ?auto_136139 ) ) ( not ( = ?auto_136140 ?auto_136139 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136140 ?auto_136136 )
      ( DELIVER-4PKG-VERIFY ?auto_136137 ?auto_136138 ?auto_136140 ?auto_136139 ?auto_136136 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136149 - OBJ
      ?auto_136150 - OBJ
      ?auto_136152 - OBJ
      ?auto_136151 - OBJ
      ?auto_136148 - LOCATION
    )
    :vars
    (
      ?auto_136153 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136153 ?auto_136148 ) ( IN-TRUCK ?auto_136150 ?auto_136153 ) ( OBJ-AT ?auto_136149 ?auto_136148 ) ( OBJ-AT ?auto_136152 ?auto_136148 ) ( OBJ-AT ?auto_136151 ?auto_136148 ) ( not ( = ?auto_136149 ?auto_136150 ) ) ( not ( = ?auto_136149 ?auto_136152 ) ) ( not ( = ?auto_136149 ?auto_136151 ) ) ( not ( = ?auto_136150 ?auto_136152 ) ) ( not ( = ?auto_136150 ?auto_136151 ) ) ( not ( = ?auto_136152 ?auto_136151 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136150 ?auto_136148 )
      ( DELIVER-4PKG-VERIFY ?auto_136149 ?auto_136150 ?auto_136152 ?auto_136151 ?auto_136148 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136173 - OBJ
      ?auto_136174 - OBJ
      ?auto_136176 - OBJ
      ?auto_136175 - OBJ
      ?auto_136172 - LOCATION
    )
    :vars
    (
      ?auto_136177 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136177 ?auto_136172 ) ( IN-TRUCK ?auto_136173 ?auto_136177 ) ( OBJ-AT ?auto_136174 ?auto_136172 ) ( OBJ-AT ?auto_136176 ?auto_136172 ) ( OBJ-AT ?auto_136175 ?auto_136172 ) ( not ( = ?auto_136173 ?auto_136174 ) ) ( not ( = ?auto_136173 ?auto_136176 ) ) ( not ( = ?auto_136173 ?auto_136175 ) ) ( not ( = ?auto_136174 ?auto_136176 ) ) ( not ( = ?auto_136174 ?auto_136175 ) ) ( not ( = ?auto_136176 ?auto_136175 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136173 ?auto_136172 )
      ( DELIVER-4PKG-VERIFY ?auto_136173 ?auto_136174 ?auto_136176 ?auto_136175 ?auto_136172 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136226 - OBJ
      ?auto_136227 - OBJ
      ?auto_136225 - LOCATION
    )
    :vars
    (
      ?auto_136228 - TRUCK
      ?auto_136229 - LOCATION
      ?auto_136230 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136227 ?auto_136228 ) ( TRUCK-AT ?auto_136228 ?auto_136229 ) ( IN-CITY ?auto_136229 ?auto_136230 ) ( IN-CITY ?auto_136225 ?auto_136230 ) ( not ( = ?auto_136225 ?auto_136229 ) ) ( OBJ-AT ?auto_136226 ?auto_136225 ) ( not ( = ?auto_136226 ?auto_136227 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136227 ?auto_136225 )
      ( DELIVER-2PKG-VERIFY ?auto_136226 ?auto_136227 ?auto_136225 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136232 - OBJ
      ?auto_136233 - OBJ
      ?auto_136231 - LOCATION
    )
    :vars
    (
      ?auto_136235 - TRUCK
      ?auto_136236 - LOCATION
      ?auto_136234 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136232 ?auto_136235 ) ( TRUCK-AT ?auto_136235 ?auto_136236 ) ( IN-CITY ?auto_136236 ?auto_136234 ) ( IN-CITY ?auto_136231 ?auto_136234 ) ( not ( = ?auto_136231 ?auto_136236 ) ) ( OBJ-AT ?auto_136233 ?auto_136231 ) ( not ( = ?auto_136233 ?auto_136232 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136233 ?auto_136232 ?auto_136231 )
      ( DELIVER-2PKG-VERIFY ?auto_136232 ?auto_136233 ?auto_136231 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136245 - OBJ
      ?auto_136246 - OBJ
      ?auto_136247 - OBJ
      ?auto_136244 - LOCATION
    )
    :vars
    (
      ?auto_136249 - TRUCK
      ?auto_136250 - LOCATION
      ?auto_136248 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136247 ?auto_136249 ) ( TRUCK-AT ?auto_136249 ?auto_136250 ) ( IN-CITY ?auto_136250 ?auto_136248 ) ( IN-CITY ?auto_136244 ?auto_136248 ) ( not ( = ?auto_136244 ?auto_136250 ) ) ( OBJ-AT ?auto_136245 ?auto_136244 ) ( not ( = ?auto_136245 ?auto_136247 ) ) ( OBJ-AT ?auto_136246 ?auto_136244 ) ( not ( = ?auto_136245 ?auto_136246 ) ) ( not ( = ?auto_136246 ?auto_136247 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136245 ?auto_136247 ?auto_136244 )
      ( DELIVER-3PKG-VERIFY ?auto_136245 ?auto_136246 ?auto_136247 ?auto_136244 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136252 - OBJ
      ?auto_136253 - OBJ
      ?auto_136254 - OBJ
      ?auto_136251 - LOCATION
    )
    :vars
    (
      ?auto_136256 - TRUCK
      ?auto_136257 - LOCATION
      ?auto_136255 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136253 ?auto_136256 ) ( TRUCK-AT ?auto_136256 ?auto_136257 ) ( IN-CITY ?auto_136257 ?auto_136255 ) ( IN-CITY ?auto_136251 ?auto_136255 ) ( not ( = ?auto_136251 ?auto_136257 ) ) ( OBJ-AT ?auto_136254 ?auto_136251 ) ( not ( = ?auto_136254 ?auto_136253 ) ) ( OBJ-AT ?auto_136252 ?auto_136251 ) ( not ( = ?auto_136252 ?auto_136253 ) ) ( not ( = ?auto_136252 ?auto_136254 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136254 ?auto_136253 ?auto_136251 )
      ( DELIVER-3PKG-VERIFY ?auto_136252 ?auto_136253 ?auto_136254 ?auto_136251 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136266 - OBJ
      ?auto_136267 - OBJ
      ?auto_136268 - OBJ
      ?auto_136265 - LOCATION
    )
    :vars
    (
      ?auto_136270 - TRUCK
      ?auto_136271 - LOCATION
      ?auto_136269 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136266 ?auto_136270 ) ( TRUCK-AT ?auto_136270 ?auto_136271 ) ( IN-CITY ?auto_136271 ?auto_136269 ) ( IN-CITY ?auto_136265 ?auto_136269 ) ( not ( = ?auto_136265 ?auto_136271 ) ) ( OBJ-AT ?auto_136268 ?auto_136265 ) ( not ( = ?auto_136268 ?auto_136266 ) ) ( OBJ-AT ?auto_136267 ?auto_136265 ) ( not ( = ?auto_136266 ?auto_136267 ) ) ( not ( = ?auto_136267 ?auto_136268 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136268 ?auto_136266 ?auto_136265 )
      ( DELIVER-3PKG-VERIFY ?auto_136266 ?auto_136267 ?auto_136268 ?auto_136265 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136295 - OBJ
      ?auto_136296 - OBJ
      ?auto_136298 - OBJ
      ?auto_136297 - OBJ
      ?auto_136294 - LOCATION
    )
    :vars
    (
      ?auto_136300 - TRUCK
      ?auto_136301 - LOCATION
      ?auto_136299 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136297 ?auto_136300 ) ( TRUCK-AT ?auto_136300 ?auto_136301 ) ( IN-CITY ?auto_136301 ?auto_136299 ) ( IN-CITY ?auto_136294 ?auto_136299 ) ( not ( = ?auto_136294 ?auto_136301 ) ) ( OBJ-AT ?auto_136298 ?auto_136294 ) ( not ( = ?auto_136298 ?auto_136297 ) ) ( OBJ-AT ?auto_136295 ?auto_136294 ) ( OBJ-AT ?auto_136296 ?auto_136294 ) ( not ( = ?auto_136295 ?auto_136296 ) ) ( not ( = ?auto_136295 ?auto_136298 ) ) ( not ( = ?auto_136295 ?auto_136297 ) ) ( not ( = ?auto_136296 ?auto_136298 ) ) ( not ( = ?auto_136296 ?auto_136297 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136298 ?auto_136297 ?auto_136294 )
      ( DELIVER-4PKG-VERIFY ?auto_136295 ?auto_136296 ?auto_136298 ?auto_136297 ?auto_136294 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136303 - OBJ
      ?auto_136304 - OBJ
      ?auto_136306 - OBJ
      ?auto_136305 - OBJ
      ?auto_136302 - LOCATION
    )
    :vars
    (
      ?auto_136308 - TRUCK
      ?auto_136309 - LOCATION
      ?auto_136307 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136306 ?auto_136308 ) ( TRUCK-AT ?auto_136308 ?auto_136309 ) ( IN-CITY ?auto_136309 ?auto_136307 ) ( IN-CITY ?auto_136302 ?auto_136307 ) ( not ( = ?auto_136302 ?auto_136309 ) ) ( OBJ-AT ?auto_136304 ?auto_136302 ) ( not ( = ?auto_136304 ?auto_136306 ) ) ( OBJ-AT ?auto_136303 ?auto_136302 ) ( OBJ-AT ?auto_136305 ?auto_136302 ) ( not ( = ?auto_136303 ?auto_136304 ) ) ( not ( = ?auto_136303 ?auto_136306 ) ) ( not ( = ?auto_136303 ?auto_136305 ) ) ( not ( = ?auto_136304 ?auto_136305 ) ) ( not ( = ?auto_136306 ?auto_136305 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136304 ?auto_136306 ?auto_136302 )
      ( DELIVER-4PKG-VERIFY ?auto_136303 ?auto_136304 ?auto_136306 ?auto_136305 ?auto_136302 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136319 - OBJ
      ?auto_136320 - OBJ
      ?auto_136322 - OBJ
      ?auto_136321 - OBJ
      ?auto_136318 - LOCATION
    )
    :vars
    (
      ?auto_136324 - TRUCK
      ?auto_136325 - LOCATION
      ?auto_136323 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136320 ?auto_136324 ) ( TRUCK-AT ?auto_136324 ?auto_136325 ) ( IN-CITY ?auto_136325 ?auto_136323 ) ( IN-CITY ?auto_136318 ?auto_136323 ) ( not ( = ?auto_136318 ?auto_136325 ) ) ( OBJ-AT ?auto_136322 ?auto_136318 ) ( not ( = ?auto_136322 ?auto_136320 ) ) ( OBJ-AT ?auto_136319 ?auto_136318 ) ( OBJ-AT ?auto_136321 ?auto_136318 ) ( not ( = ?auto_136319 ?auto_136320 ) ) ( not ( = ?auto_136319 ?auto_136322 ) ) ( not ( = ?auto_136319 ?auto_136321 ) ) ( not ( = ?auto_136320 ?auto_136321 ) ) ( not ( = ?auto_136322 ?auto_136321 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136322 ?auto_136320 ?auto_136318 )
      ( DELIVER-4PKG-VERIFY ?auto_136319 ?auto_136320 ?auto_136322 ?auto_136321 ?auto_136318 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136351 - OBJ
      ?auto_136352 - OBJ
      ?auto_136354 - OBJ
      ?auto_136353 - OBJ
      ?auto_136350 - LOCATION
    )
    :vars
    (
      ?auto_136356 - TRUCK
      ?auto_136357 - LOCATION
      ?auto_136355 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136351 ?auto_136356 ) ( TRUCK-AT ?auto_136356 ?auto_136357 ) ( IN-CITY ?auto_136357 ?auto_136355 ) ( IN-CITY ?auto_136350 ?auto_136355 ) ( not ( = ?auto_136350 ?auto_136357 ) ) ( OBJ-AT ?auto_136352 ?auto_136350 ) ( not ( = ?auto_136352 ?auto_136351 ) ) ( OBJ-AT ?auto_136354 ?auto_136350 ) ( OBJ-AT ?auto_136353 ?auto_136350 ) ( not ( = ?auto_136351 ?auto_136354 ) ) ( not ( = ?auto_136351 ?auto_136353 ) ) ( not ( = ?auto_136352 ?auto_136354 ) ) ( not ( = ?auto_136352 ?auto_136353 ) ) ( not ( = ?auto_136354 ?auto_136353 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136352 ?auto_136351 ?auto_136350 )
      ( DELIVER-4PKG-VERIFY ?auto_136351 ?auto_136352 ?auto_136354 ?auto_136353 ?auto_136350 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136416 - OBJ
      ?auto_136415 - LOCATION
    )
    :vars
    (
      ?auto_136418 - TRUCK
      ?auto_136419 - LOCATION
      ?auto_136417 - CITY
      ?auto_136420 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136418 ?auto_136419 ) ( IN-CITY ?auto_136419 ?auto_136417 ) ( IN-CITY ?auto_136415 ?auto_136417 ) ( not ( = ?auto_136415 ?auto_136419 ) ) ( OBJ-AT ?auto_136420 ?auto_136415 ) ( not ( = ?auto_136420 ?auto_136416 ) ) ( OBJ-AT ?auto_136416 ?auto_136419 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_136416 ?auto_136418 ?auto_136419 )
      ( DELIVER-2PKG ?auto_136420 ?auto_136416 ?auto_136415 )
      ( DELIVER-1PKG-VERIFY ?auto_136416 ?auto_136415 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136422 - OBJ
      ?auto_136423 - OBJ
      ?auto_136421 - LOCATION
    )
    :vars
    (
      ?auto_136425 - TRUCK
      ?auto_136424 - LOCATION
      ?auto_136426 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136425 ?auto_136424 ) ( IN-CITY ?auto_136424 ?auto_136426 ) ( IN-CITY ?auto_136421 ?auto_136426 ) ( not ( = ?auto_136421 ?auto_136424 ) ) ( OBJ-AT ?auto_136422 ?auto_136421 ) ( not ( = ?auto_136422 ?auto_136423 ) ) ( OBJ-AT ?auto_136423 ?auto_136424 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136423 ?auto_136421 )
      ( DELIVER-2PKG-VERIFY ?auto_136422 ?auto_136423 ?auto_136421 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136428 - OBJ
      ?auto_136429 - OBJ
      ?auto_136427 - LOCATION
    )
    :vars
    (
      ?auto_136430 - TRUCK
      ?auto_136432 - LOCATION
      ?auto_136431 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136430 ?auto_136432 ) ( IN-CITY ?auto_136432 ?auto_136431 ) ( IN-CITY ?auto_136427 ?auto_136431 ) ( not ( = ?auto_136427 ?auto_136432 ) ) ( OBJ-AT ?auto_136429 ?auto_136427 ) ( not ( = ?auto_136429 ?auto_136428 ) ) ( OBJ-AT ?auto_136428 ?auto_136432 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136429 ?auto_136428 ?auto_136427 )
      ( DELIVER-2PKG-VERIFY ?auto_136428 ?auto_136429 ?auto_136427 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136441 - OBJ
      ?auto_136442 - OBJ
      ?auto_136443 - OBJ
      ?auto_136440 - LOCATION
    )
    :vars
    (
      ?auto_136444 - TRUCK
      ?auto_136446 - LOCATION
      ?auto_136445 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136444 ?auto_136446 ) ( IN-CITY ?auto_136446 ?auto_136445 ) ( IN-CITY ?auto_136440 ?auto_136445 ) ( not ( = ?auto_136440 ?auto_136446 ) ) ( OBJ-AT ?auto_136442 ?auto_136440 ) ( not ( = ?auto_136442 ?auto_136443 ) ) ( OBJ-AT ?auto_136443 ?auto_136446 ) ( OBJ-AT ?auto_136441 ?auto_136440 ) ( not ( = ?auto_136441 ?auto_136442 ) ) ( not ( = ?auto_136441 ?auto_136443 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136442 ?auto_136443 ?auto_136440 )
      ( DELIVER-3PKG-VERIFY ?auto_136441 ?auto_136442 ?auto_136443 ?auto_136440 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136448 - OBJ
      ?auto_136449 - OBJ
      ?auto_136450 - OBJ
      ?auto_136447 - LOCATION
    )
    :vars
    (
      ?auto_136451 - TRUCK
      ?auto_136453 - LOCATION
      ?auto_136452 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136451 ?auto_136453 ) ( IN-CITY ?auto_136453 ?auto_136452 ) ( IN-CITY ?auto_136447 ?auto_136452 ) ( not ( = ?auto_136447 ?auto_136453 ) ) ( OBJ-AT ?auto_136450 ?auto_136447 ) ( not ( = ?auto_136450 ?auto_136449 ) ) ( OBJ-AT ?auto_136449 ?auto_136453 ) ( OBJ-AT ?auto_136448 ?auto_136447 ) ( not ( = ?auto_136448 ?auto_136449 ) ) ( not ( = ?auto_136448 ?auto_136450 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136450 ?auto_136449 ?auto_136447 )
      ( DELIVER-3PKG-VERIFY ?auto_136448 ?auto_136449 ?auto_136450 ?auto_136447 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136462 - OBJ
      ?auto_136463 - OBJ
      ?auto_136464 - OBJ
      ?auto_136461 - LOCATION
    )
    :vars
    (
      ?auto_136465 - TRUCK
      ?auto_136467 - LOCATION
      ?auto_136466 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136465 ?auto_136467 ) ( IN-CITY ?auto_136467 ?auto_136466 ) ( IN-CITY ?auto_136461 ?auto_136466 ) ( not ( = ?auto_136461 ?auto_136467 ) ) ( OBJ-AT ?auto_136463 ?auto_136461 ) ( not ( = ?auto_136463 ?auto_136462 ) ) ( OBJ-AT ?auto_136462 ?auto_136467 ) ( OBJ-AT ?auto_136464 ?auto_136461 ) ( not ( = ?auto_136462 ?auto_136464 ) ) ( not ( = ?auto_136463 ?auto_136464 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136463 ?auto_136462 ?auto_136461 )
      ( DELIVER-3PKG-VERIFY ?auto_136462 ?auto_136463 ?auto_136464 ?auto_136461 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136491 - OBJ
      ?auto_136492 - OBJ
      ?auto_136494 - OBJ
      ?auto_136493 - OBJ
      ?auto_136490 - LOCATION
    )
    :vars
    (
      ?auto_136495 - TRUCK
      ?auto_136497 - LOCATION
      ?auto_136496 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136495 ?auto_136497 ) ( IN-CITY ?auto_136497 ?auto_136496 ) ( IN-CITY ?auto_136490 ?auto_136496 ) ( not ( = ?auto_136490 ?auto_136497 ) ) ( OBJ-AT ?auto_136494 ?auto_136490 ) ( not ( = ?auto_136494 ?auto_136493 ) ) ( OBJ-AT ?auto_136493 ?auto_136497 ) ( OBJ-AT ?auto_136491 ?auto_136490 ) ( OBJ-AT ?auto_136492 ?auto_136490 ) ( not ( = ?auto_136491 ?auto_136492 ) ) ( not ( = ?auto_136491 ?auto_136494 ) ) ( not ( = ?auto_136491 ?auto_136493 ) ) ( not ( = ?auto_136492 ?auto_136494 ) ) ( not ( = ?auto_136492 ?auto_136493 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136494 ?auto_136493 ?auto_136490 )
      ( DELIVER-4PKG-VERIFY ?auto_136491 ?auto_136492 ?auto_136494 ?auto_136493 ?auto_136490 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136499 - OBJ
      ?auto_136500 - OBJ
      ?auto_136502 - OBJ
      ?auto_136501 - OBJ
      ?auto_136498 - LOCATION
    )
    :vars
    (
      ?auto_136503 - TRUCK
      ?auto_136505 - LOCATION
      ?auto_136504 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136503 ?auto_136505 ) ( IN-CITY ?auto_136505 ?auto_136504 ) ( IN-CITY ?auto_136498 ?auto_136504 ) ( not ( = ?auto_136498 ?auto_136505 ) ) ( OBJ-AT ?auto_136499 ?auto_136498 ) ( not ( = ?auto_136499 ?auto_136502 ) ) ( OBJ-AT ?auto_136502 ?auto_136505 ) ( OBJ-AT ?auto_136500 ?auto_136498 ) ( OBJ-AT ?auto_136501 ?auto_136498 ) ( not ( = ?auto_136499 ?auto_136500 ) ) ( not ( = ?auto_136499 ?auto_136501 ) ) ( not ( = ?auto_136500 ?auto_136502 ) ) ( not ( = ?auto_136500 ?auto_136501 ) ) ( not ( = ?auto_136502 ?auto_136501 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136499 ?auto_136502 ?auto_136498 )
      ( DELIVER-4PKG-VERIFY ?auto_136499 ?auto_136500 ?auto_136502 ?auto_136501 ?auto_136498 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136515 - OBJ
      ?auto_136516 - OBJ
      ?auto_136518 - OBJ
      ?auto_136517 - OBJ
      ?auto_136514 - LOCATION
    )
    :vars
    (
      ?auto_136519 - TRUCK
      ?auto_136521 - LOCATION
      ?auto_136520 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136519 ?auto_136521 ) ( IN-CITY ?auto_136521 ?auto_136520 ) ( IN-CITY ?auto_136514 ?auto_136520 ) ( not ( = ?auto_136514 ?auto_136521 ) ) ( OBJ-AT ?auto_136518 ?auto_136514 ) ( not ( = ?auto_136518 ?auto_136516 ) ) ( OBJ-AT ?auto_136516 ?auto_136521 ) ( OBJ-AT ?auto_136515 ?auto_136514 ) ( OBJ-AT ?auto_136517 ?auto_136514 ) ( not ( = ?auto_136515 ?auto_136516 ) ) ( not ( = ?auto_136515 ?auto_136518 ) ) ( not ( = ?auto_136515 ?auto_136517 ) ) ( not ( = ?auto_136516 ?auto_136517 ) ) ( not ( = ?auto_136518 ?auto_136517 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136518 ?auto_136516 ?auto_136514 )
      ( DELIVER-4PKG-VERIFY ?auto_136515 ?auto_136516 ?auto_136518 ?auto_136517 ?auto_136514 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136547 - OBJ
      ?auto_136548 - OBJ
      ?auto_136550 - OBJ
      ?auto_136549 - OBJ
      ?auto_136546 - LOCATION
    )
    :vars
    (
      ?auto_136551 - TRUCK
      ?auto_136553 - LOCATION
      ?auto_136552 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136551 ?auto_136553 ) ( IN-CITY ?auto_136553 ?auto_136552 ) ( IN-CITY ?auto_136546 ?auto_136552 ) ( not ( = ?auto_136546 ?auto_136553 ) ) ( OBJ-AT ?auto_136549 ?auto_136546 ) ( not ( = ?auto_136549 ?auto_136547 ) ) ( OBJ-AT ?auto_136547 ?auto_136553 ) ( OBJ-AT ?auto_136548 ?auto_136546 ) ( OBJ-AT ?auto_136550 ?auto_136546 ) ( not ( = ?auto_136547 ?auto_136548 ) ) ( not ( = ?auto_136547 ?auto_136550 ) ) ( not ( = ?auto_136548 ?auto_136550 ) ) ( not ( = ?auto_136548 ?auto_136549 ) ) ( not ( = ?auto_136550 ?auto_136549 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136549 ?auto_136547 ?auto_136546 )
      ( DELIVER-4PKG-VERIFY ?auto_136547 ?auto_136548 ?auto_136550 ?auto_136549 ?auto_136546 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136612 - OBJ
      ?auto_136611 - LOCATION
    )
    :vars
    (
      ?auto_136616 - LOCATION
      ?auto_136614 - CITY
      ?auto_136615 - OBJ
      ?auto_136613 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136616 ?auto_136614 ) ( IN-CITY ?auto_136611 ?auto_136614 ) ( not ( = ?auto_136611 ?auto_136616 ) ) ( OBJ-AT ?auto_136615 ?auto_136611 ) ( not ( = ?auto_136615 ?auto_136612 ) ) ( OBJ-AT ?auto_136612 ?auto_136616 ) ( TRUCK-AT ?auto_136613 ?auto_136611 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_136613 ?auto_136611 ?auto_136616 ?auto_136614 )
      ( DELIVER-2PKG ?auto_136615 ?auto_136612 ?auto_136611 )
      ( DELIVER-1PKG-VERIFY ?auto_136612 ?auto_136611 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136618 - OBJ
      ?auto_136619 - OBJ
      ?auto_136617 - LOCATION
    )
    :vars
    (
      ?auto_136620 - LOCATION
      ?auto_136622 - CITY
      ?auto_136621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136620 ?auto_136622 ) ( IN-CITY ?auto_136617 ?auto_136622 ) ( not ( = ?auto_136617 ?auto_136620 ) ) ( OBJ-AT ?auto_136618 ?auto_136617 ) ( not ( = ?auto_136618 ?auto_136619 ) ) ( OBJ-AT ?auto_136619 ?auto_136620 ) ( TRUCK-AT ?auto_136621 ?auto_136617 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136619 ?auto_136617 )
      ( DELIVER-2PKG-VERIFY ?auto_136618 ?auto_136619 ?auto_136617 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136624 - OBJ
      ?auto_136625 - OBJ
      ?auto_136623 - LOCATION
    )
    :vars
    (
      ?auto_136626 - LOCATION
      ?auto_136628 - CITY
      ?auto_136627 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136626 ?auto_136628 ) ( IN-CITY ?auto_136623 ?auto_136628 ) ( not ( = ?auto_136623 ?auto_136626 ) ) ( OBJ-AT ?auto_136625 ?auto_136623 ) ( not ( = ?auto_136625 ?auto_136624 ) ) ( OBJ-AT ?auto_136624 ?auto_136626 ) ( TRUCK-AT ?auto_136627 ?auto_136623 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136625 ?auto_136624 ?auto_136623 )
      ( DELIVER-2PKG-VERIFY ?auto_136624 ?auto_136625 ?auto_136623 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136637 - OBJ
      ?auto_136638 - OBJ
      ?auto_136639 - OBJ
      ?auto_136636 - LOCATION
    )
    :vars
    (
      ?auto_136640 - LOCATION
      ?auto_136642 - CITY
      ?auto_136641 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136640 ?auto_136642 ) ( IN-CITY ?auto_136636 ?auto_136642 ) ( not ( = ?auto_136636 ?auto_136640 ) ) ( OBJ-AT ?auto_136637 ?auto_136636 ) ( not ( = ?auto_136637 ?auto_136639 ) ) ( OBJ-AT ?auto_136639 ?auto_136640 ) ( TRUCK-AT ?auto_136641 ?auto_136636 ) ( OBJ-AT ?auto_136638 ?auto_136636 ) ( not ( = ?auto_136637 ?auto_136638 ) ) ( not ( = ?auto_136638 ?auto_136639 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136637 ?auto_136639 ?auto_136636 )
      ( DELIVER-3PKG-VERIFY ?auto_136637 ?auto_136638 ?auto_136639 ?auto_136636 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136644 - OBJ
      ?auto_136645 - OBJ
      ?auto_136646 - OBJ
      ?auto_136643 - LOCATION
    )
    :vars
    (
      ?auto_136647 - LOCATION
      ?auto_136649 - CITY
      ?auto_136648 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136647 ?auto_136649 ) ( IN-CITY ?auto_136643 ?auto_136649 ) ( not ( = ?auto_136643 ?auto_136647 ) ) ( OBJ-AT ?auto_136644 ?auto_136643 ) ( not ( = ?auto_136644 ?auto_136645 ) ) ( OBJ-AT ?auto_136645 ?auto_136647 ) ( TRUCK-AT ?auto_136648 ?auto_136643 ) ( OBJ-AT ?auto_136646 ?auto_136643 ) ( not ( = ?auto_136644 ?auto_136646 ) ) ( not ( = ?auto_136645 ?auto_136646 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136644 ?auto_136645 ?auto_136643 )
      ( DELIVER-3PKG-VERIFY ?auto_136644 ?auto_136645 ?auto_136646 ?auto_136643 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136658 - OBJ
      ?auto_136659 - OBJ
      ?auto_136660 - OBJ
      ?auto_136657 - LOCATION
    )
    :vars
    (
      ?auto_136661 - LOCATION
      ?auto_136663 - CITY
      ?auto_136662 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136661 ?auto_136663 ) ( IN-CITY ?auto_136657 ?auto_136663 ) ( not ( = ?auto_136657 ?auto_136661 ) ) ( OBJ-AT ?auto_136660 ?auto_136657 ) ( not ( = ?auto_136660 ?auto_136658 ) ) ( OBJ-AT ?auto_136658 ?auto_136661 ) ( TRUCK-AT ?auto_136662 ?auto_136657 ) ( OBJ-AT ?auto_136659 ?auto_136657 ) ( not ( = ?auto_136658 ?auto_136659 ) ) ( not ( = ?auto_136659 ?auto_136660 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136660 ?auto_136658 ?auto_136657 )
      ( DELIVER-3PKG-VERIFY ?auto_136658 ?auto_136659 ?auto_136660 ?auto_136657 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136687 - OBJ
      ?auto_136688 - OBJ
      ?auto_136690 - OBJ
      ?auto_136689 - OBJ
      ?auto_136686 - LOCATION
    )
    :vars
    (
      ?auto_136691 - LOCATION
      ?auto_136693 - CITY
      ?auto_136692 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136691 ?auto_136693 ) ( IN-CITY ?auto_136686 ?auto_136693 ) ( not ( = ?auto_136686 ?auto_136691 ) ) ( OBJ-AT ?auto_136687 ?auto_136686 ) ( not ( = ?auto_136687 ?auto_136689 ) ) ( OBJ-AT ?auto_136689 ?auto_136691 ) ( TRUCK-AT ?auto_136692 ?auto_136686 ) ( OBJ-AT ?auto_136688 ?auto_136686 ) ( OBJ-AT ?auto_136690 ?auto_136686 ) ( not ( = ?auto_136687 ?auto_136688 ) ) ( not ( = ?auto_136687 ?auto_136690 ) ) ( not ( = ?auto_136688 ?auto_136690 ) ) ( not ( = ?auto_136688 ?auto_136689 ) ) ( not ( = ?auto_136690 ?auto_136689 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136687 ?auto_136689 ?auto_136686 )
      ( DELIVER-4PKG-VERIFY ?auto_136687 ?auto_136688 ?auto_136690 ?auto_136689 ?auto_136686 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136695 - OBJ
      ?auto_136696 - OBJ
      ?auto_136698 - OBJ
      ?auto_136697 - OBJ
      ?auto_136694 - LOCATION
    )
    :vars
    (
      ?auto_136699 - LOCATION
      ?auto_136701 - CITY
      ?auto_136700 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136699 ?auto_136701 ) ( IN-CITY ?auto_136694 ?auto_136701 ) ( not ( = ?auto_136694 ?auto_136699 ) ) ( OBJ-AT ?auto_136695 ?auto_136694 ) ( not ( = ?auto_136695 ?auto_136698 ) ) ( OBJ-AT ?auto_136698 ?auto_136699 ) ( TRUCK-AT ?auto_136700 ?auto_136694 ) ( OBJ-AT ?auto_136696 ?auto_136694 ) ( OBJ-AT ?auto_136697 ?auto_136694 ) ( not ( = ?auto_136695 ?auto_136696 ) ) ( not ( = ?auto_136695 ?auto_136697 ) ) ( not ( = ?auto_136696 ?auto_136698 ) ) ( not ( = ?auto_136696 ?auto_136697 ) ) ( not ( = ?auto_136698 ?auto_136697 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136695 ?auto_136698 ?auto_136694 )
      ( DELIVER-4PKG-VERIFY ?auto_136695 ?auto_136696 ?auto_136698 ?auto_136697 ?auto_136694 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136711 - OBJ
      ?auto_136712 - OBJ
      ?auto_136714 - OBJ
      ?auto_136713 - OBJ
      ?auto_136710 - LOCATION
    )
    :vars
    (
      ?auto_136715 - LOCATION
      ?auto_136717 - CITY
      ?auto_136716 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136715 ?auto_136717 ) ( IN-CITY ?auto_136710 ?auto_136717 ) ( not ( = ?auto_136710 ?auto_136715 ) ) ( OBJ-AT ?auto_136713 ?auto_136710 ) ( not ( = ?auto_136713 ?auto_136712 ) ) ( OBJ-AT ?auto_136712 ?auto_136715 ) ( TRUCK-AT ?auto_136716 ?auto_136710 ) ( OBJ-AT ?auto_136711 ?auto_136710 ) ( OBJ-AT ?auto_136714 ?auto_136710 ) ( not ( = ?auto_136711 ?auto_136712 ) ) ( not ( = ?auto_136711 ?auto_136714 ) ) ( not ( = ?auto_136711 ?auto_136713 ) ) ( not ( = ?auto_136712 ?auto_136714 ) ) ( not ( = ?auto_136714 ?auto_136713 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136713 ?auto_136712 ?auto_136710 )
      ( DELIVER-4PKG-VERIFY ?auto_136711 ?auto_136712 ?auto_136714 ?auto_136713 ?auto_136710 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136743 - OBJ
      ?auto_136744 - OBJ
      ?auto_136746 - OBJ
      ?auto_136745 - OBJ
      ?auto_136742 - LOCATION
    )
    :vars
    (
      ?auto_136747 - LOCATION
      ?auto_136749 - CITY
      ?auto_136748 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136747 ?auto_136749 ) ( IN-CITY ?auto_136742 ?auto_136749 ) ( not ( = ?auto_136742 ?auto_136747 ) ) ( OBJ-AT ?auto_136746 ?auto_136742 ) ( not ( = ?auto_136746 ?auto_136743 ) ) ( OBJ-AT ?auto_136743 ?auto_136747 ) ( TRUCK-AT ?auto_136748 ?auto_136742 ) ( OBJ-AT ?auto_136744 ?auto_136742 ) ( OBJ-AT ?auto_136745 ?auto_136742 ) ( not ( = ?auto_136743 ?auto_136744 ) ) ( not ( = ?auto_136743 ?auto_136745 ) ) ( not ( = ?auto_136744 ?auto_136746 ) ) ( not ( = ?auto_136744 ?auto_136745 ) ) ( not ( = ?auto_136746 ?auto_136745 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136746 ?auto_136743 ?auto_136742 )
      ( DELIVER-4PKG-VERIFY ?auto_136743 ?auto_136744 ?auto_136746 ?auto_136745 ?auto_136742 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136808 - OBJ
      ?auto_136807 - LOCATION
    )
    :vars
    (
      ?auto_136810 - LOCATION
      ?auto_136812 - CITY
      ?auto_136809 - OBJ
      ?auto_136811 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136810 ?auto_136812 ) ( IN-CITY ?auto_136807 ?auto_136812 ) ( not ( = ?auto_136807 ?auto_136810 ) ) ( not ( = ?auto_136809 ?auto_136808 ) ) ( OBJ-AT ?auto_136808 ?auto_136810 ) ( TRUCK-AT ?auto_136811 ?auto_136807 ) ( IN-TRUCK ?auto_136809 ?auto_136811 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136809 ?auto_136807 )
      ( DELIVER-2PKG ?auto_136809 ?auto_136808 ?auto_136807 )
      ( DELIVER-1PKG-VERIFY ?auto_136808 ?auto_136807 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136814 - OBJ
      ?auto_136815 - OBJ
      ?auto_136813 - LOCATION
    )
    :vars
    (
      ?auto_136818 - LOCATION
      ?auto_136817 - CITY
      ?auto_136816 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136818 ?auto_136817 ) ( IN-CITY ?auto_136813 ?auto_136817 ) ( not ( = ?auto_136813 ?auto_136818 ) ) ( not ( = ?auto_136814 ?auto_136815 ) ) ( OBJ-AT ?auto_136815 ?auto_136818 ) ( TRUCK-AT ?auto_136816 ?auto_136813 ) ( IN-TRUCK ?auto_136814 ?auto_136816 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136815 ?auto_136813 )
      ( DELIVER-2PKG-VERIFY ?auto_136814 ?auto_136815 ?auto_136813 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136820 - OBJ
      ?auto_136821 - OBJ
      ?auto_136819 - LOCATION
    )
    :vars
    (
      ?auto_136824 - LOCATION
      ?auto_136822 - CITY
      ?auto_136823 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136824 ?auto_136822 ) ( IN-CITY ?auto_136819 ?auto_136822 ) ( not ( = ?auto_136819 ?auto_136824 ) ) ( not ( = ?auto_136821 ?auto_136820 ) ) ( OBJ-AT ?auto_136820 ?auto_136824 ) ( TRUCK-AT ?auto_136823 ?auto_136819 ) ( IN-TRUCK ?auto_136821 ?auto_136823 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136821 ?auto_136820 ?auto_136819 )
      ( DELIVER-2PKG-VERIFY ?auto_136820 ?auto_136821 ?auto_136819 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_137004 - OBJ
      ?auto_137003 - LOCATION
    )
    :vars
    (
      ?auto_137008 - LOCATION
      ?auto_137006 - CITY
      ?auto_137005 - OBJ
      ?auto_137007 - TRUCK
      ?auto_137009 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_137008 ?auto_137006 ) ( IN-CITY ?auto_137003 ?auto_137006 ) ( not ( = ?auto_137003 ?auto_137008 ) ) ( not ( = ?auto_137005 ?auto_137004 ) ) ( OBJ-AT ?auto_137004 ?auto_137008 ) ( IN-TRUCK ?auto_137005 ?auto_137007 ) ( TRUCK-AT ?auto_137007 ?auto_137009 ) ( IN-CITY ?auto_137009 ?auto_137006 ) ( not ( = ?auto_137003 ?auto_137009 ) ) ( not ( = ?auto_137008 ?auto_137009 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_137007 ?auto_137009 ?auto_137003 ?auto_137006 )
      ( DELIVER-2PKG ?auto_137005 ?auto_137004 ?auto_137003 )
      ( DELIVER-1PKG-VERIFY ?auto_137004 ?auto_137003 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137011 - OBJ
      ?auto_137012 - OBJ
      ?auto_137010 - LOCATION
    )
    :vars
    (
      ?auto_137014 - LOCATION
      ?auto_137013 - CITY
      ?auto_137015 - TRUCK
      ?auto_137016 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_137014 ?auto_137013 ) ( IN-CITY ?auto_137010 ?auto_137013 ) ( not ( = ?auto_137010 ?auto_137014 ) ) ( not ( = ?auto_137011 ?auto_137012 ) ) ( OBJ-AT ?auto_137012 ?auto_137014 ) ( IN-TRUCK ?auto_137011 ?auto_137015 ) ( TRUCK-AT ?auto_137015 ?auto_137016 ) ( IN-CITY ?auto_137016 ?auto_137013 ) ( not ( = ?auto_137010 ?auto_137016 ) ) ( not ( = ?auto_137014 ?auto_137016 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_137012 ?auto_137010 )
      ( DELIVER-2PKG-VERIFY ?auto_137011 ?auto_137012 ?auto_137010 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137018 - OBJ
      ?auto_137019 - OBJ
      ?auto_137017 - LOCATION
    )
    :vars
    (
      ?auto_137020 - LOCATION
      ?auto_137023 - CITY
      ?auto_137021 - TRUCK
      ?auto_137022 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_137020 ?auto_137023 ) ( IN-CITY ?auto_137017 ?auto_137023 ) ( not ( = ?auto_137017 ?auto_137020 ) ) ( not ( = ?auto_137019 ?auto_137018 ) ) ( OBJ-AT ?auto_137018 ?auto_137020 ) ( IN-TRUCK ?auto_137019 ?auto_137021 ) ( TRUCK-AT ?auto_137021 ?auto_137022 ) ( IN-CITY ?auto_137022 ?auto_137023 ) ( not ( = ?auto_137017 ?auto_137022 ) ) ( not ( = ?auto_137020 ?auto_137022 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137019 ?auto_137018 ?auto_137017 )
      ( DELIVER-2PKG-VERIFY ?auto_137018 ?auto_137019 ?auto_137017 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_137226 - OBJ
      ?auto_137225 - LOCATION
    )
    :vars
    (
      ?auto_137227 - LOCATION
      ?auto_137231 - CITY
      ?auto_137229 - OBJ
      ?auto_137228 - TRUCK
      ?auto_137230 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_137227 ?auto_137231 ) ( IN-CITY ?auto_137225 ?auto_137231 ) ( not ( = ?auto_137225 ?auto_137227 ) ) ( not ( = ?auto_137229 ?auto_137226 ) ) ( OBJ-AT ?auto_137226 ?auto_137227 ) ( TRUCK-AT ?auto_137228 ?auto_137230 ) ( IN-CITY ?auto_137230 ?auto_137231 ) ( not ( = ?auto_137225 ?auto_137230 ) ) ( not ( = ?auto_137227 ?auto_137230 ) ) ( OBJ-AT ?auto_137229 ?auto_137230 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_137229 ?auto_137228 ?auto_137230 )
      ( DELIVER-2PKG ?auto_137229 ?auto_137226 ?auto_137225 )
      ( DELIVER-1PKG-VERIFY ?auto_137226 ?auto_137225 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137233 - OBJ
      ?auto_137234 - OBJ
      ?auto_137232 - LOCATION
    )
    :vars
    (
      ?auto_137236 - LOCATION
      ?auto_137238 - CITY
      ?auto_137237 - TRUCK
      ?auto_137235 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_137236 ?auto_137238 ) ( IN-CITY ?auto_137232 ?auto_137238 ) ( not ( = ?auto_137232 ?auto_137236 ) ) ( not ( = ?auto_137233 ?auto_137234 ) ) ( OBJ-AT ?auto_137234 ?auto_137236 ) ( TRUCK-AT ?auto_137237 ?auto_137235 ) ( IN-CITY ?auto_137235 ?auto_137238 ) ( not ( = ?auto_137232 ?auto_137235 ) ) ( not ( = ?auto_137236 ?auto_137235 ) ) ( OBJ-AT ?auto_137233 ?auto_137235 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_137234 ?auto_137232 )
      ( DELIVER-2PKG-VERIFY ?auto_137233 ?auto_137234 ?auto_137232 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137240 - OBJ
      ?auto_137241 - OBJ
      ?auto_137239 - LOCATION
    )
    :vars
    (
      ?auto_137244 - LOCATION
      ?auto_137242 - CITY
      ?auto_137245 - TRUCK
      ?auto_137243 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_137244 ?auto_137242 ) ( IN-CITY ?auto_137239 ?auto_137242 ) ( not ( = ?auto_137239 ?auto_137244 ) ) ( not ( = ?auto_137241 ?auto_137240 ) ) ( OBJ-AT ?auto_137240 ?auto_137244 ) ( TRUCK-AT ?auto_137245 ?auto_137243 ) ( IN-CITY ?auto_137243 ?auto_137242 ) ( not ( = ?auto_137239 ?auto_137243 ) ) ( not ( = ?auto_137244 ?auto_137243 ) ) ( OBJ-AT ?auto_137241 ?auto_137243 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137241 ?auto_137240 ?auto_137239 )
      ( DELIVER-2PKG-VERIFY ?auto_137240 ?auto_137241 ?auto_137239 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138596 - OBJ
      ?auto_138597 - OBJ
      ?auto_138598 - OBJ
      ?auto_138595 - LOCATION
    )
    :vars
    (
      ?auto_138601 - TRUCK
      ?auto_138600 - LOCATION
      ?auto_138599 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138597 ?auto_138601 ) ( TRUCK-AT ?auto_138601 ?auto_138600 ) ( IN-CITY ?auto_138600 ?auto_138599 ) ( IN-CITY ?auto_138595 ?auto_138599 ) ( not ( = ?auto_138595 ?auto_138600 ) ) ( OBJ-AT ?auto_138596 ?auto_138595 ) ( not ( = ?auto_138596 ?auto_138597 ) ) ( OBJ-AT ?auto_138598 ?auto_138595 ) ( not ( = ?auto_138596 ?auto_138598 ) ) ( not ( = ?auto_138597 ?auto_138598 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138596 ?auto_138597 ?auto_138595 )
      ( DELIVER-3PKG-VERIFY ?auto_138596 ?auto_138597 ?auto_138598 ?auto_138595 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138618 - OBJ
      ?auto_138619 - OBJ
      ?auto_138620 - OBJ
      ?auto_138617 - LOCATION
    )
    :vars
    (
      ?auto_138624 - TRUCK
      ?auto_138623 - LOCATION
      ?auto_138622 - CITY
      ?auto_138621 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138620 ?auto_138624 ) ( TRUCK-AT ?auto_138624 ?auto_138623 ) ( IN-CITY ?auto_138623 ?auto_138622 ) ( IN-CITY ?auto_138617 ?auto_138622 ) ( not ( = ?auto_138617 ?auto_138623 ) ) ( OBJ-AT ?auto_138621 ?auto_138617 ) ( not ( = ?auto_138621 ?auto_138620 ) ) ( OBJ-AT ?auto_138618 ?auto_138617 ) ( OBJ-AT ?auto_138619 ?auto_138617 ) ( not ( = ?auto_138618 ?auto_138619 ) ) ( not ( = ?auto_138618 ?auto_138620 ) ) ( not ( = ?auto_138618 ?auto_138621 ) ) ( not ( = ?auto_138619 ?auto_138620 ) ) ( not ( = ?auto_138619 ?auto_138621 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138621 ?auto_138620 ?auto_138617 )
      ( DELIVER-3PKG-VERIFY ?auto_138618 ?auto_138619 ?auto_138620 ?auto_138617 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138630 - OBJ
      ?auto_138631 - OBJ
      ?auto_138632 - OBJ
      ?auto_138629 - LOCATION
    )
    :vars
    (
      ?auto_138636 - TRUCK
      ?auto_138635 - LOCATION
      ?auto_138634 - CITY
      ?auto_138633 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138631 ?auto_138636 ) ( TRUCK-AT ?auto_138636 ?auto_138635 ) ( IN-CITY ?auto_138635 ?auto_138634 ) ( IN-CITY ?auto_138629 ?auto_138634 ) ( not ( = ?auto_138629 ?auto_138635 ) ) ( OBJ-AT ?auto_138633 ?auto_138629 ) ( not ( = ?auto_138633 ?auto_138631 ) ) ( OBJ-AT ?auto_138630 ?auto_138629 ) ( OBJ-AT ?auto_138632 ?auto_138629 ) ( not ( = ?auto_138630 ?auto_138631 ) ) ( not ( = ?auto_138630 ?auto_138632 ) ) ( not ( = ?auto_138630 ?auto_138633 ) ) ( not ( = ?auto_138631 ?auto_138632 ) ) ( not ( = ?auto_138632 ?auto_138633 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138633 ?auto_138631 ?auto_138629 )
      ( DELIVER-3PKG-VERIFY ?auto_138630 ?auto_138631 ?auto_138632 ?auto_138629 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138668 - OBJ
      ?auto_138669 - OBJ
      ?auto_138670 - OBJ
      ?auto_138667 - LOCATION
    )
    :vars
    (
      ?auto_138674 - TRUCK
      ?auto_138673 - LOCATION
      ?auto_138672 - CITY
      ?auto_138671 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138668 ?auto_138674 ) ( TRUCK-AT ?auto_138674 ?auto_138673 ) ( IN-CITY ?auto_138673 ?auto_138672 ) ( IN-CITY ?auto_138667 ?auto_138672 ) ( not ( = ?auto_138667 ?auto_138673 ) ) ( OBJ-AT ?auto_138671 ?auto_138667 ) ( not ( = ?auto_138671 ?auto_138668 ) ) ( OBJ-AT ?auto_138669 ?auto_138667 ) ( OBJ-AT ?auto_138670 ?auto_138667 ) ( not ( = ?auto_138668 ?auto_138669 ) ) ( not ( = ?auto_138668 ?auto_138670 ) ) ( not ( = ?auto_138669 ?auto_138670 ) ) ( not ( = ?auto_138669 ?auto_138671 ) ) ( not ( = ?auto_138670 ?auto_138671 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138671 ?auto_138668 ?auto_138667 )
      ( DELIVER-3PKG-VERIFY ?auto_138668 ?auto_138669 ?auto_138670 ?auto_138667 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138707 - OBJ
      ?auto_138708 - OBJ
      ?auto_138710 - OBJ
      ?auto_138709 - OBJ
      ?auto_138706 - LOCATION
    )
    :vars
    (
      ?auto_138713 - TRUCK
      ?auto_138712 - LOCATION
      ?auto_138711 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138709 ?auto_138713 ) ( TRUCK-AT ?auto_138713 ?auto_138712 ) ( IN-CITY ?auto_138712 ?auto_138711 ) ( IN-CITY ?auto_138706 ?auto_138711 ) ( not ( = ?auto_138706 ?auto_138712 ) ) ( OBJ-AT ?auto_138708 ?auto_138706 ) ( not ( = ?auto_138708 ?auto_138709 ) ) ( OBJ-AT ?auto_138707 ?auto_138706 ) ( OBJ-AT ?auto_138710 ?auto_138706 ) ( not ( = ?auto_138707 ?auto_138708 ) ) ( not ( = ?auto_138707 ?auto_138710 ) ) ( not ( = ?auto_138707 ?auto_138709 ) ) ( not ( = ?auto_138708 ?auto_138710 ) ) ( not ( = ?auto_138710 ?auto_138709 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138708 ?auto_138709 ?auto_138706 )
      ( DELIVER-4PKG-VERIFY ?auto_138707 ?auto_138708 ?auto_138710 ?auto_138709 ?auto_138706 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138715 - OBJ
      ?auto_138716 - OBJ
      ?auto_138718 - OBJ
      ?auto_138717 - OBJ
      ?auto_138714 - LOCATION
    )
    :vars
    (
      ?auto_138721 - TRUCK
      ?auto_138720 - LOCATION
      ?auto_138719 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138717 ?auto_138721 ) ( TRUCK-AT ?auto_138721 ?auto_138720 ) ( IN-CITY ?auto_138720 ?auto_138719 ) ( IN-CITY ?auto_138714 ?auto_138719 ) ( not ( = ?auto_138714 ?auto_138720 ) ) ( OBJ-AT ?auto_138715 ?auto_138714 ) ( not ( = ?auto_138715 ?auto_138717 ) ) ( OBJ-AT ?auto_138716 ?auto_138714 ) ( OBJ-AT ?auto_138718 ?auto_138714 ) ( not ( = ?auto_138715 ?auto_138716 ) ) ( not ( = ?auto_138715 ?auto_138718 ) ) ( not ( = ?auto_138716 ?auto_138718 ) ) ( not ( = ?auto_138716 ?auto_138717 ) ) ( not ( = ?auto_138718 ?auto_138717 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138715 ?auto_138717 ?auto_138714 )
      ( DELIVER-4PKG-VERIFY ?auto_138715 ?auto_138716 ?auto_138718 ?auto_138717 ?auto_138714 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138763 - OBJ
      ?auto_138764 - OBJ
      ?auto_138766 - OBJ
      ?auto_138765 - OBJ
      ?auto_138762 - LOCATION
    )
    :vars
    (
      ?auto_138769 - TRUCK
      ?auto_138768 - LOCATION
      ?auto_138767 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138766 ?auto_138769 ) ( TRUCK-AT ?auto_138769 ?auto_138768 ) ( IN-CITY ?auto_138768 ?auto_138767 ) ( IN-CITY ?auto_138762 ?auto_138767 ) ( not ( = ?auto_138762 ?auto_138768 ) ) ( OBJ-AT ?auto_138765 ?auto_138762 ) ( not ( = ?auto_138765 ?auto_138766 ) ) ( OBJ-AT ?auto_138763 ?auto_138762 ) ( OBJ-AT ?auto_138764 ?auto_138762 ) ( not ( = ?auto_138763 ?auto_138764 ) ) ( not ( = ?auto_138763 ?auto_138766 ) ) ( not ( = ?auto_138763 ?auto_138765 ) ) ( not ( = ?auto_138764 ?auto_138766 ) ) ( not ( = ?auto_138764 ?auto_138765 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138765 ?auto_138766 ?auto_138762 )
      ( DELIVER-4PKG-VERIFY ?auto_138763 ?auto_138764 ?auto_138766 ?auto_138765 ?auto_138762 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138771 - OBJ
      ?auto_138772 - OBJ
      ?auto_138774 - OBJ
      ?auto_138773 - OBJ
      ?auto_138770 - LOCATION
    )
    :vars
    (
      ?auto_138777 - TRUCK
      ?auto_138776 - LOCATION
      ?auto_138775 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138774 ?auto_138777 ) ( TRUCK-AT ?auto_138777 ?auto_138776 ) ( IN-CITY ?auto_138776 ?auto_138775 ) ( IN-CITY ?auto_138770 ?auto_138775 ) ( not ( = ?auto_138770 ?auto_138776 ) ) ( OBJ-AT ?auto_138771 ?auto_138770 ) ( not ( = ?auto_138771 ?auto_138774 ) ) ( OBJ-AT ?auto_138772 ?auto_138770 ) ( OBJ-AT ?auto_138773 ?auto_138770 ) ( not ( = ?auto_138771 ?auto_138772 ) ) ( not ( = ?auto_138771 ?auto_138773 ) ) ( not ( = ?auto_138772 ?auto_138774 ) ) ( not ( = ?auto_138772 ?auto_138773 ) ) ( not ( = ?auto_138774 ?auto_138773 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138771 ?auto_138774 ?auto_138770 )
      ( DELIVER-4PKG-VERIFY ?auto_138771 ?auto_138772 ?auto_138774 ?auto_138773 ?auto_138770 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138795 - OBJ
      ?auto_138796 - OBJ
      ?auto_138798 - OBJ
      ?auto_138797 - OBJ
      ?auto_138794 - LOCATION
    )
    :vars
    (
      ?auto_138801 - TRUCK
      ?auto_138800 - LOCATION
      ?auto_138799 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138796 ?auto_138801 ) ( TRUCK-AT ?auto_138801 ?auto_138800 ) ( IN-CITY ?auto_138800 ?auto_138799 ) ( IN-CITY ?auto_138794 ?auto_138799 ) ( not ( = ?auto_138794 ?auto_138800 ) ) ( OBJ-AT ?auto_138795 ?auto_138794 ) ( not ( = ?auto_138795 ?auto_138796 ) ) ( OBJ-AT ?auto_138798 ?auto_138794 ) ( OBJ-AT ?auto_138797 ?auto_138794 ) ( not ( = ?auto_138795 ?auto_138798 ) ) ( not ( = ?auto_138795 ?auto_138797 ) ) ( not ( = ?auto_138796 ?auto_138798 ) ) ( not ( = ?auto_138796 ?auto_138797 ) ) ( not ( = ?auto_138798 ?auto_138797 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138795 ?auto_138796 ?auto_138794 )
      ( DELIVER-4PKG-VERIFY ?auto_138795 ?auto_138796 ?auto_138798 ?auto_138797 ?auto_138794 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138907 - OBJ
      ?auto_138908 - OBJ
      ?auto_138910 - OBJ
      ?auto_138909 - OBJ
      ?auto_138906 - LOCATION
    )
    :vars
    (
      ?auto_138914 - TRUCK
      ?auto_138913 - LOCATION
      ?auto_138912 - CITY
      ?auto_138911 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138909 ?auto_138914 ) ( TRUCK-AT ?auto_138914 ?auto_138913 ) ( IN-CITY ?auto_138913 ?auto_138912 ) ( IN-CITY ?auto_138906 ?auto_138912 ) ( not ( = ?auto_138906 ?auto_138913 ) ) ( OBJ-AT ?auto_138911 ?auto_138906 ) ( not ( = ?auto_138911 ?auto_138909 ) ) ( OBJ-AT ?auto_138907 ?auto_138906 ) ( OBJ-AT ?auto_138908 ?auto_138906 ) ( OBJ-AT ?auto_138910 ?auto_138906 ) ( not ( = ?auto_138907 ?auto_138908 ) ) ( not ( = ?auto_138907 ?auto_138910 ) ) ( not ( = ?auto_138907 ?auto_138909 ) ) ( not ( = ?auto_138907 ?auto_138911 ) ) ( not ( = ?auto_138908 ?auto_138910 ) ) ( not ( = ?auto_138908 ?auto_138909 ) ) ( not ( = ?auto_138908 ?auto_138911 ) ) ( not ( = ?auto_138910 ?auto_138909 ) ) ( not ( = ?auto_138910 ?auto_138911 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138911 ?auto_138909 ?auto_138906 )
      ( DELIVER-4PKG-VERIFY ?auto_138907 ?auto_138908 ?auto_138910 ?auto_138909 ?auto_138906 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138924 - OBJ
      ?auto_138925 - OBJ
      ?auto_138927 - OBJ
      ?auto_138926 - OBJ
      ?auto_138923 - LOCATION
    )
    :vars
    (
      ?auto_138931 - TRUCK
      ?auto_138930 - LOCATION
      ?auto_138929 - CITY
      ?auto_138928 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138927 ?auto_138931 ) ( TRUCK-AT ?auto_138931 ?auto_138930 ) ( IN-CITY ?auto_138930 ?auto_138929 ) ( IN-CITY ?auto_138923 ?auto_138929 ) ( not ( = ?auto_138923 ?auto_138930 ) ) ( OBJ-AT ?auto_138928 ?auto_138923 ) ( not ( = ?auto_138928 ?auto_138927 ) ) ( OBJ-AT ?auto_138924 ?auto_138923 ) ( OBJ-AT ?auto_138925 ?auto_138923 ) ( OBJ-AT ?auto_138926 ?auto_138923 ) ( not ( = ?auto_138924 ?auto_138925 ) ) ( not ( = ?auto_138924 ?auto_138927 ) ) ( not ( = ?auto_138924 ?auto_138926 ) ) ( not ( = ?auto_138924 ?auto_138928 ) ) ( not ( = ?auto_138925 ?auto_138927 ) ) ( not ( = ?auto_138925 ?auto_138926 ) ) ( not ( = ?auto_138925 ?auto_138928 ) ) ( not ( = ?auto_138927 ?auto_138926 ) ) ( not ( = ?auto_138926 ?auto_138928 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138928 ?auto_138927 ?auto_138923 )
      ( DELIVER-4PKG-VERIFY ?auto_138924 ?auto_138925 ?auto_138927 ?auto_138926 ?auto_138923 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138966 - OBJ
      ?auto_138967 - OBJ
      ?auto_138969 - OBJ
      ?auto_138968 - OBJ
      ?auto_138965 - LOCATION
    )
    :vars
    (
      ?auto_138972 - TRUCK
      ?auto_138971 - LOCATION
      ?auto_138970 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138967 ?auto_138972 ) ( TRUCK-AT ?auto_138972 ?auto_138971 ) ( IN-CITY ?auto_138971 ?auto_138970 ) ( IN-CITY ?auto_138965 ?auto_138970 ) ( not ( = ?auto_138965 ?auto_138971 ) ) ( OBJ-AT ?auto_138968 ?auto_138965 ) ( not ( = ?auto_138968 ?auto_138967 ) ) ( OBJ-AT ?auto_138966 ?auto_138965 ) ( OBJ-AT ?auto_138969 ?auto_138965 ) ( not ( = ?auto_138966 ?auto_138967 ) ) ( not ( = ?auto_138966 ?auto_138969 ) ) ( not ( = ?auto_138966 ?auto_138968 ) ) ( not ( = ?auto_138967 ?auto_138969 ) ) ( not ( = ?auto_138969 ?auto_138968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138968 ?auto_138967 ?auto_138965 )
      ( DELIVER-4PKG-VERIFY ?auto_138966 ?auto_138967 ?auto_138969 ?auto_138968 ?auto_138965 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138974 - OBJ
      ?auto_138975 - OBJ
      ?auto_138977 - OBJ
      ?auto_138976 - OBJ
      ?auto_138973 - LOCATION
    )
    :vars
    (
      ?auto_138981 - TRUCK
      ?auto_138980 - LOCATION
      ?auto_138979 - CITY
      ?auto_138978 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138975 ?auto_138981 ) ( TRUCK-AT ?auto_138981 ?auto_138980 ) ( IN-CITY ?auto_138980 ?auto_138979 ) ( IN-CITY ?auto_138973 ?auto_138979 ) ( not ( = ?auto_138973 ?auto_138980 ) ) ( OBJ-AT ?auto_138978 ?auto_138973 ) ( not ( = ?auto_138978 ?auto_138975 ) ) ( OBJ-AT ?auto_138974 ?auto_138973 ) ( OBJ-AT ?auto_138977 ?auto_138973 ) ( OBJ-AT ?auto_138976 ?auto_138973 ) ( not ( = ?auto_138974 ?auto_138975 ) ) ( not ( = ?auto_138974 ?auto_138977 ) ) ( not ( = ?auto_138974 ?auto_138976 ) ) ( not ( = ?auto_138974 ?auto_138978 ) ) ( not ( = ?auto_138975 ?auto_138977 ) ) ( not ( = ?auto_138975 ?auto_138976 ) ) ( not ( = ?auto_138977 ?auto_138976 ) ) ( not ( = ?auto_138977 ?auto_138978 ) ) ( not ( = ?auto_138976 ?auto_138978 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138978 ?auto_138975 ?auto_138973 )
      ( DELIVER-4PKG-VERIFY ?auto_138974 ?auto_138975 ?auto_138977 ?auto_138976 ?auto_138973 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139018 - OBJ
      ?auto_139019 - OBJ
      ?auto_139021 - OBJ
      ?auto_139020 - OBJ
      ?auto_139017 - LOCATION
    )
    :vars
    (
      ?auto_139024 - TRUCK
      ?auto_139023 - LOCATION
      ?auto_139022 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139018 ?auto_139024 ) ( TRUCK-AT ?auto_139024 ?auto_139023 ) ( IN-CITY ?auto_139023 ?auto_139022 ) ( IN-CITY ?auto_139017 ?auto_139022 ) ( not ( = ?auto_139017 ?auto_139023 ) ) ( OBJ-AT ?auto_139020 ?auto_139017 ) ( not ( = ?auto_139020 ?auto_139018 ) ) ( OBJ-AT ?auto_139019 ?auto_139017 ) ( OBJ-AT ?auto_139021 ?auto_139017 ) ( not ( = ?auto_139018 ?auto_139019 ) ) ( not ( = ?auto_139018 ?auto_139021 ) ) ( not ( = ?auto_139019 ?auto_139021 ) ) ( not ( = ?auto_139019 ?auto_139020 ) ) ( not ( = ?auto_139021 ?auto_139020 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139020 ?auto_139018 ?auto_139017 )
      ( DELIVER-4PKG-VERIFY ?auto_139018 ?auto_139019 ?auto_139021 ?auto_139020 ?auto_139017 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139026 - OBJ
      ?auto_139027 - OBJ
      ?auto_139029 - OBJ
      ?auto_139028 - OBJ
      ?auto_139025 - LOCATION
    )
    :vars
    (
      ?auto_139032 - TRUCK
      ?auto_139031 - LOCATION
      ?auto_139030 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139026 ?auto_139032 ) ( TRUCK-AT ?auto_139032 ?auto_139031 ) ( IN-CITY ?auto_139031 ?auto_139030 ) ( IN-CITY ?auto_139025 ?auto_139030 ) ( not ( = ?auto_139025 ?auto_139031 ) ) ( OBJ-AT ?auto_139029 ?auto_139025 ) ( not ( = ?auto_139029 ?auto_139026 ) ) ( OBJ-AT ?auto_139027 ?auto_139025 ) ( OBJ-AT ?auto_139028 ?auto_139025 ) ( not ( = ?auto_139026 ?auto_139027 ) ) ( not ( = ?auto_139026 ?auto_139028 ) ) ( not ( = ?auto_139027 ?auto_139029 ) ) ( not ( = ?auto_139027 ?auto_139028 ) ) ( not ( = ?auto_139029 ?auto_139028 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139029 ?auto_139026 ?auto_139025 )
      ( DELIVER-4PKG-VERIFY ?auto_139026 ?auto_139027 ?auto_139029 ?auto_139028 ?auto_139025 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139122 - OBJ
      ?auto_139123 - OBJ
      ?auto_139125 - OBJ
      ?auto_139124 - OBJ
      ?auto_139121 - LOCATION
    )
    :vars
    (
      ?auto_139129 - TRUCK
      ?auto_139128 - LOCATION
      ?auto_139127 - CITY
      ?auto_139126 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139122 ?auto_139129 ) ( TRUCK-AT ?auto_139129 ?auto_139128 ) ( IN-CITY ?auto_139128 ?auto_139127 ) ( IN-CITY ?auto_139121 ?auto_139127 ) ( not ( = ?auto_139121 ?auto_139128 ) ) ( OBJ-AT ?auto_139126 ?auto_139121 ) ( not ( = ?auto_139126 ?auto_139122 ) ) ( OBJ-AT ?auto_139123 ?auto_139121 ) ( OBJ-AT ?auto_139125 ?auto_139121 ) ( OBJ-AT ?auto_139124 ?auto_139121 ) ( not ( = ?auto_139122 ?auto_139123 ) ) ( not ( = ?auto_139122 ?auto_139125 ) ) ( not ( = ?auto_139122 ?auto_139124 ) ) ( not ( = ?auto_139123 ?auto_139125 ) ) ( not ( = ?auto_139123 ?auto_139124 ) ) ( not ( = ?auto_139123 ?auto_139126 ) ) ( not ( = ?auto_139125 ?auto_139124 ) ) ( not ( = ?auto_139125 ?auto_139126 ) ) ( not ( = ?auto_139124 ?auto_139126 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139126 ?auto_139122 ?auto_139121 )
      ( DELIVER-4PKG-VERIFY ?auto_139122 ?auto_139123 ?auto_139125 ?auto_139124 ?auto_139121 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139284 - OBJ
      ?auto_139285 - OBJ
      ?auto_139286 - OBJ
      ?auto_139283 - LOCATION
    )
    :vars
    (
      ?auto_139288 - TRUCK
      ?auto_139287 - LOCATION
      ?auto_139289 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139288 ?auto_139287 ) ( IN-CITY ?auto_139287 ?auto_139289 ) ( IN-CITY ?auto_139283 ?auto_139289 ) ( not ( = ?auto_139283 ?auto_139287 ) ) ( OBJ-AT ?auto_139284 ?auto_139283 ) ( not ( = ?auto_139284 ?auto_139285 ) ) ( OBJ-AT ?auto_139285 ?auto_139287 ) ( OBJ-AT ?auto_139286 ?auto_139283 ) ( not ( = ?auto_139284 ?auto_139286 ) ) ( not ( = ?auto_139285 ?auto_139286 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139284 ?auto_139285 ?auto_139283 )
      ( DELIVER-3PKG-VERIFY ?auto_139284 ?auto_139285 ?auto_139286 ?auto_139283 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139306 - OBJ
      ?auto_139307 - OBJ
      ?auto_139308 - OBJ
      ?auto_139305 - LOCATION
    )
    :vars
    (
      ?auto_139311 - TRUCK
      ?auto_139310 - LOCATION
      ?auto_139312 - CITY
      ?auto_139309 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139311 ?auto_139310 ) ( IN-CITY ?auto_139310 ?auto_139312 ) ( IN-CITY ?auto_139305 ?auto_139312 ) ( not ( = ?auto_139305 ?auto_139310 ) ) ( OBJ-AT ?auto_139309 ?auto_139305 ) ( not ( = ?auto_139309 ?auto_139308 ) ) ( OBJ-AT ?auto_139308 ?auto_139310 ) ( OBJ-AT ?auto_139306 ?auto_139305 ) ( OBJ-AT ?auto_139307 ?auto_139305 ) ( not ( = ?auto_139306 ?auto_139307 ) ) ( not ( = ?auto_139306 ?auto_139308 ) ) ( not ( = ?auto_139306 ?auto_139309 ) ) ( not ( = ?auto_139307 ?auto_139308 ) ) ( not ( = ?auto_139307 ?auto_139309 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139309 ?auto_139308 ?auto_139305 )
      ( DELIVER-3PKG-VERIFY ?auto_139306 ?auto_139307 ?auto_139308 ?auto_139305 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139318 - OBJ
      ?auto_139319 - OBJ
      ?auto_139320 - OBJ
      ?auto_139317 - LOCATION
    )
    :vars
    (
      ?auto_139323 - TRUCK
      ?auto_139322 - LOCATION
      ?auto_139324 - CITY
      ?auto_139321 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139323 ?auto_139322 ) ( IN-CITY ?auto_139322 ?auto_139324 ) ( IN-CITY ?auto_139317 ?auto_139324 ) ( not ( = ?auto_139317 ?auto_139322 ) ) ( OBJ-AT ?auto_139321 ?auto_139317 ) ( not ( = ?auto_139321 ?auto_139319 ) ) ( OBJ-AT ?auto_139319 ?auto_139322 ) ( OBJ-AT ?auto_139318 ?auto_139317 ) ( OBJ-AT ?auto_139320 ?auto_139317 ) ( not ( = ?auto_139318 ?auto_139319 ) ) ( not ( = ?auto_139318 ?auto_139320 ) ) ( not ( = ?auto_139318 ?auto_139321 ) ) ( not ( = ?auto_139319 ?auto_139320 ) ) ( not ( = ?auto_139320 ?auto_139321 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139321 ?auto_139319 ?auto_139317 )
      ( DELIVER-3PKG-VERIFY ?auto_139318 ?auto_139319 ?auto_139320 ?auto_139317 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139356 - OBJ
      ?auto_139357 - OBJ
      ?auto_139358 - OBJ
      ?auto_139355 - LOCATION
    )
    :vars
    (
      ?auto_139361 - TRUCK
      ?auto_139360 - LOCATION
      ?auto_139362 - CITY
      ?auto_139359 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139361 ?auto_139360 ) ( IN-CITY ?auto_139360 ?auto_139362 ) ( IN-CITY ?auto_139355 ?auto_139362 ) ( not ( = ?auto_139355 ?auto_139360 ) ) ( OBJ-AT ?auto_139359 ?auto_139355 ) ( not ( = ?auto_139359 ?auto_139356 ) ) ( OBJ-AT ?auto_139356 ?auto_139360 ) ( OBJ-AT ?auto_139357 ?auto_139355 ) ( OBJ-AT ?auto_139358 ?auto_139355 ) ( not ( = ?auto_139356 ?auto_139357 ) ) ( not ( = ?auto_139356 ?auto_139358 ) ) ( not ( = ?auto_139357 ?auto_139358 ) ) ( not ( = ?auto_139357 ?auto_139359 ) ) ( not ( = ?auto_139358 ?auto_139359 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139359 ?auto_139356 ?auto_139355 )
      ( DELIVER-3PKG-VERIFY ?auto_139356 ?auto_139357 ?auto_139358 ?auto_139355 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139395 - OBJ
      ?auto_139396 - OBJ
      ?auto_139398 - OBJ
      ?auto_139397 - OBJ
      ?auto_139394 - LOCATION
    )
    :vars
    (
      ?auto_139400 - TRUCK
      ?auto_139399 - LOCATION
      ?auto_139401 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139400 ?auto_139399 ) ( IN-CITY ?auto_139399 ?auto_139401 ) ( IN-CITY ?auto_139394 ?auto_139401 ) ( not ( = ?auto_139394 ?auto_139399 ) ) ( OBJ-AT ?auto_139395 ?auto_139394 ) ( not ( = ?auto_139395 ?auto_139397 ) ) ( OBJ-AT ?auto_139397 ?auto_139399 ) ( OBJ-AT ?auto_139396 ?auto_139394 ) ( OBJ-AT ?auto_139398 ?auto_139394 ) ( not ( = ?auto_139395 ?auto_139396 ) ) ( not ( = ?auto_139395 ?auto_139398 ) ) ( not ( = ?auto_139396 ?auto_139398 ) ) ( not ( = ?auto_139396 ?auto_139397 ) ) ( not ( = ?auto_139398 ?auto_139397 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139395 ?auto_139397 ?auto_139394 )
      ( DELIVER-4PKG-VERIFY ?auto_139395 ?auto_139396 ?auto_139398 ?auto_139397 ?auto_139394 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139483 - OBJ
      ?auto_139484 - OBJ
      ?auto_139486 - OBJ
      ?auto_139485 - OBJ
      ?auto_139482 - LOCATION
    )
    :vars
    (
      ?auto_139488 - TRUCK
      ?auto_139487 - LOCATION
      ?auto_139489 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139488 ?auto_139487 ) ( IN-CITY ?auto_139487 ?auto_139489 ) ( IN-CITY ?auto_139482 ?auto_139489 ) ( not ( = ?auto_139482 ?auto_139487 ) ) ( OBJ-AT ?auto_139483 ?auto_139482 ) ( not ( = ?auto_139483 ?auto_139484 ) ) ( OBJ-AT ?auto_139484 ?auto_139487 ) ( OBJ-AT ?auto_139486 ?auto_139482 ) ( OBJ-AT ?auto_139485 ?auto_139482 ) ( not ( = ?auto_139483 ?auto_139486 ) ) ( not ( = ?auto_139483 ?auto_139485 ) ) ( not ( = ?auto_139484 ?auto_139486 ) ) ( not ( = ?auto_139484 ?auto_139485 ) ) ( not ( = ?auto_139486 ?auto_139485 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139483 ?auto_139484 ?auto_139482 )
      ( DELIVER-4PKG-VERIFY ?auto_139483 ?auto_139484 ?auto_139486 ?auto_139485 ?auto_139482 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139499 - OBJ
      ?auto_139500 - OBJ
      ?auto_139502 - OBJ
      ?auto_139501 - OBJ
      ?auto_139498 - LOCATION
    )
    :vars
    (
      ?auto_139504 - TRUCK
      ?auto_139503 - LOCATION
      ?auto_139505 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139504 ?auto_139503 ) ( IN-CITY ?auto_139503 ?auto_139505 ) ( IN-CITY ?auto_139498 ?auto_139505 ) ( not ( = ?auto_139498 ?auto_139503 ) ) ( OBJ-AT ?auto_139501 ?auto_139498 ) ( not ( = ?auto_139501 ?auto_139500 ) ) ( OBJ-AT ?auto_139500 ?auto_139503 ) ( OBJ-AT ?auto_139499 ?auto_139498 ) ( OBJ-AT ?auto_139502 ?auto_139498 ) ( not ( = ?auto_139499 ?auto_139500 ) ) ( not ( = ?auto_139499 ?auto_139502 ) ) ( not ( = ?auto_139499 ?auto_139501 ) ) ( not ( = ?auto_139500 ?auto_139502 ) ) ( not ( = ?auto_139502 ?auto_139501 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139501 ?auto_139500 ?auto_139498 )
      ( DELIVER-4PKG-VERIFY ?auto_139499 ?auto_139500 ?auto_139502 ?auto_139501 ?auto_139498 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139555 - OBJ
      ?auto_139556 - OBJ
      ?auto_139558 - OBJ
      ?auto_139557 - OBJ
      ?auto_139554 - LOCATION
    )
    :vars
    (
      ?auto_139560 - TRUCK
      ?auto_139559 - LOCATION
      ?auto_139561 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139560 ?auto_139559 ) ( IN-CITY ?auto_139559 ?auto_139561 ) ( IN-CITY ?auto_139554 ?auto_139561 ) ( not ( = ?auto_139554 ?auto_139559 ) ) ( OBJ-AT ?auto_139556 ?auto_139554 ) ( not ( = ?auto_139556 ?auto_139557 ) ) ( OBJ-AT ?auto_139557 ?auto_139559 ) ( OBJ-AT ?auto_139555 ?auto_139554 ) ( OBJ-AT ?auto_139558 ?auto_139554 ) ( not ( = ?auto_139555 ?auto_139556 ) ) ( not ( = ?auto_139555 ?auto_139558 ) ) ( not ( = ?auto_139555 ?auto_139557 ) ) ( not ( = ?auto_139556 ?auto_139558 ) ) ( not ( = ?auto_139558 ?auto_139557 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139556 ?auto_139557 ?auto_139554 )
      ( DELIVER-4PKG-VERIFY ?auto_139555 ?auto_139556 ?auto_139558 ?auto_139557 ?auto_139554 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139563 - OBJ
      ?auto_139564 - OBJ
      ?auto_139566 - OBJ
      ?auto_139565 - OBJ
      ?auto_139562 - LOCATION
    )
    :vars
    (
      ?auto_139568 - TRUCK
      ?auto_139567 - LOCATION
      ?auto_139569 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139568 ?auto_139567 ) ( IN-CITY ?auto_139567 ?auto_139569 ) ( IN-CITY ?auto_139562 ?auto_139569 ) ( not ( = ?auto_139562 ?auto_139567 ) ) ( OBJ-AT ?auto_139564 ?auto_139562 ) ( not ( = ?auto_139564 ?auto_139566 ) ) ( OBJ-AT ?auto_139566 ?auto_139567 ) ( OBJ-AT ?auto_139563 ?auto_139562 ) ( OBJ-AT ?auto_139565 ?auto_139562 ) ( not ( = ?auto_139563 ?auto_139564 ) ) ( not ( = ?auto_139563 ?auto_139566 ) ) ( not ( = ?auto_139563 ?auto_139565 ) ) ( not ( = ?auto_139564 ?auto_139565 ) ) ( not ( = ?auto_139566 ?auto_139565 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139564 ?auto_139566 ?auto_139562 )
      ( DELIVER-4PKG-VERIFY ?auto_139563 ?auto_139564 ?auto_139566 ?auto_139565 ?auto_139562 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139595 - OBJ
      ?auto_139596 - OBJ
      ?auto_139598 - OBJ
      ?auto_139597 - OBJ
      ?auto_139594 - LOCATION
    )
    :vars
    (
      ?auto_139601 - TRUCK
      ?auto_139600 - LOCATION
      ?auto_139602 - CITY
      ?auto_139599 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139601 ?auto_139600 ) ( IN-CITY ?auto_139600 ?auto_139602 ) ( IN-CITY ?auto_139594 ?auto_139602 ) ( not ( = ?auto_139594 ?auto_139600 ) ) ( OBJ-AT ?auto_139599 ?auto_139594 ) ( not ( = ?auto_139599 ?auto_139597 ) ) ( OBJ-AT ?auto_139597 ?auto_139600 ) ( OBJ-AT ?auto_139595 ?auto_139594 ) ( OBJ-AT ?auto_139596 ?auto_139594 ) ( OBJ-AT ?auto_139598 ?auto_139594 ) ( not ( = ?auto_139595 ?auto_139596 ) ) ( not ( = ?auto_139595 ?auto_139598 ) ) ( not ( = ?auto_139595 ?auto_139597 ) ) ( not ( = ?auto_139595 ?auto_139599 ) ) ( not ( = ?auto_139596 ?auto_139598 ) ) ( not ( = ?auto_139596 ?auto_139597 ) ) ( not ( = ?auto_139596 ?auto_139599 ) ) ( not ( = ?auto_139598 ?auto_139597 ) ) ( not ( = ?auto_139598 ?auto_139599 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139599 ?auto_139597 ?auto_139594 )
      ( DELIVER-4PKG-VERIFY ?auto_139595 ?auto_139596 ?auto_139598 ?auto_139597 ?auto_139594 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139604 - OBJ
      ?auto_139605 - OBJ
      ?auto_139607 - OBJ
      ?auto_139606 - OBJ
      ?auto_139603 - LOCATION
    )
    :vars
    (
      ?auto_139609 - TRUCK
      ?auto_139608 - LOCATION
      ?auto_139610 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139609 ?auto_139608 ) ( IN-CITY ?auto_139608 ?auto_139610 ) ( IN-CITY ?auto_139603 ?auto_139610 ) ( not ( = ?auto_139603 ?auto_139608 ) ) ( OBJ-AT ?auto_139606 ?auto_139603 ) ( not ( = ?auto_139606 ?auto_139607 ) ) ( OBJ-AT ?auto_139607 ?auto_139608 ) ( OBJ-AT ?auto_139604 ?auto_139603 ) ( OBJ-AT ?auto_139605 ?auto_139603 ) ( not ( = ?auto_139604 ?auto_139605 ) ) ( not ( = ?auto_139604 ?auto_139607 ) ) ( not ( = ?auto_139604 ?auto_139606 ) ) ( not ( = ?auto_139605 ?auto_139607 ) ) ( not ( = ?auto_139605 ?auto_139606 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139606 ?auto_139607 ?auto_139603 )
      ( DELIVER-4PKG-VERIFY ?auto_139604 ?auto_139605 ?auto_139607 ?auto_139606 ?auto_139603 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139612 - OBJ
      ?auto_139613 - OBJ
      ?auto_139615 - OBJ
      ?auto_139614 - OBJ
      ?auto_139611 - LOCATION
    )
    :vars
    (
      ?auto_139618 - TRUCK
      ?auto_139617 - LOCATION
      ?auto_139619 - CITY
      ?auto_139616 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139618 ?auto_139617 ) ( IN-CITY ?auto_139617 ?auto_139619 ) ( IN-CITY ?auto_139611 ?auto_139619 ) ( not ( = ?auto_139611 ?auto_139617 ) ) ( OBJ-AT ?auto_139616 ?auto_139611 ) ( not ( = ?auto_139616 ?auto_139615 ) ) ( OBJ-AT ?auto_139615 ?auto_139617 ) ( OBJ-AT ?auto_139612 ?auto_139611 ) ( OBJ-AT ?auto_139613 ?auto_139611 ) ( OBJ-AT ?auto_139614 ?auto_139611 ) ( not ( = ?auto_139612 ?auto_139613 ) ) ( not ( = ?auto_139612 ?auto_139615 ) ) ( not ( = ?auto_139612 ?auto_139614 ) ) ( not ( = ?auto_139612 ?auto_139616 ) ) ( not ( = ?auto_139613 ?auto_139615 ) ) ( not ( = ?auto_139613 ?auto_139614 ) ) ( not ( = ?auto_139613 ?auto_139616 ) ) ( not ( = ?auto_139615 ?auto_139614 ) ) ( not ( = ?auto_139614 ?auto_139616 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139616 ?auto_139615 ?auto_139611 )
      ( DELIVER-4PKG-VERIFY ?auto_139612 ?auto_139613 ?auto_139615 ?auto_139614 ?auto_139611 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139662 - OBJ
      ?auto_139663 - OBJ
      ?auto_139665 - OBJ
      ?auto_139664 - OBJ
      ?auto_139661 - LOCATION
    )
    :vars
    (
      ?auto_139668 - TRUCK
      ?auto_139667 - LOCATION
      ?auto_139669 - CITY
      ?auto_139666 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139668 ?auto_139667 ) ( IN-CITY ?auto_139667 ?auto_139669 ) ( IN-CITY ?auto_139661 ?auto_139669 ) ( not ( = ?auto_139661 ?auto_139667 ) ) ( OBJ-AT ?auto_139666 ?auto_139661 ) ( not ( = ?auto_139666 ?auto_139663 ) ) ( OBJ-AT ?auto_139663 ?auto_139667 ) ( OBJ-AT ?auto_139662 ?auto_139661 ) ( OBJ-AT ?auto_139665 ?auto_139661 ) ( OBJ-AT ?auto_139664 ?auto_139661 ) ( not ( = ?auto_139662 ?auto_139663 ) ) ( not ( = ?auto_139662 ?auto_139665 ) ) ( not ( = ?auto_139662 ?auto_139664 ) ) ( not ( = ?auto_139662 ?auto_139666 ) ) ( not ( = ?auto_139663 ?auto_139665 ) ) ( not ( = ?auto_139663 ?auto_139664 ) ) ( not ( = ?auto_139665 ?auto_139664 ) ) ( not ( = ?auto_139665 ?auto_139666 ) ) ( not ( = ?auto_139664 ?auto_139666 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139666 ?auto_139663 ?auto_139661 )
      ( DELIVER-4PKG-VERIFY ?auto_139662 ?auto_139663 ?auto_139665 ?auto_139664 ?auto_139661 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139714 - OBJ
      ?auto_139715 - OBJ
      ?auto_139717 - OBJ
      ?auto_139716 - OBJ
      ?auto_139713 - LOCATION
    )
    :vars
    (
      ?auto_139719 - TRUCK
      ?auto_139718 - LOCATION
      ?auto_139720 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139719 ?auto_139718 ) ( IN-CITY ?auto_139718 ?auto_139720 ) ( IN-CITY ?auto_139713 ?auto_139720 ) ( not ( = ?auto_139713 ?auto_139718 ) ) ( OBJ-AT ?auto_139715 ?auto_139713 ) ( not ( = ?auto_139715 ?auto_139714 ) ) ( OBJ-AT ?auto_139714 ?auto_139718 ) ( OBJ-AT ?auto_139717 ?auto_139713 ) ( OBJ-AT ?auto_139716 ?auto_139713 ) ( not ( = ?auto_139714 ?auto_139717 ) ) ( not ( = ?auto_139714 ?auto_139716 ) ) ( not ( = ?auto_139715 ?auto_139717 ) ) ( not ( = ?auto_139715 ?auto_139716 ) ) ( not ( = ?auto_139717 ?auto_139716 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139715 ?auto_139714 ?auto_139713 )
      ( DELIVER-4PKG-VERIFY ?auto_139714 ?auto_139715 ?auto_139717 ?auto_139716 ?auto_139713 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139778 - OBJ
      ?auto_139779 - OBJ
      ?auto_139781 - OBJ
      ?auto_139780 - OBJ
      ?auto_139777 - LOCATION
    )
    :vars
    (
      ?auto_139783 - TRUCK
      ?auto_139782 - LOCATION
      ?auto_139784 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139783 ?auto_139782 ) ( IN-CITY ?auto_139782 ?auto_139784 ) ( IN-CITY ?auto_139777 ?auto_139784 ) ( not ( = ?auto_139777 ?auto_139782 ) ) ( OBJ-AT ?auto_139781 ?auto_139777 ) ( not ( = ?auto_139781 ?auto_139778 ) ) ( OBJ-AT ?auto_139778 ?auto_139782 ) ( OBJ-AT ?auto_139779 ?auto_139777 ) ( OBJ-AT ?auto_139780 ?auto_139777 ) ( not ( = ?auto_139778 ?auto_139779 ) ) ( not ( = ?auto_139778 ?auto_139780 ) ) ( not ( = ?auto_139779 ?auto_139781 ) ) ( not ( = ?auto_139779 ?auto_139780 ) ) ( not ( = ?auto_139781 ?auto_139780 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139781 ?auto_139778 ?auto_139777 )
      ( DELIVER-4PKG-VERIFY ?auto_139778 ?auto_139779 ?auto_139781 ?auto_139780 ?auto_139777 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139810 - OBJ
      ?auto_139811 - OBJ
      ?auto_139813 - OBJ
      ?auto_139812 - OBJ
      ?auto_139809 - LOCATION
    )
    :vars
    (
      ?auto_139816 - TRUCK
      ?auto_139815 - LOCATION
      ?auto_139817 - CITY
      ?auto_139814 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139816 ?auto_139815 ) ( IN-CITY ?auto_139815 ?auto_139817 ) ( IN-CITY ?auto_139809 ?auto_139817 ) ( not ( = ?auto_139809 ?auto_139815 ) ) ( OBJ-AT ?auto_139814 ?auto_139809 ) ( not ( = ?auto_139814 ?auto_139810 ) ) ( OBJ-AT ?auto_139810 ?auto_139815 ) ( OBJ-AT ?auto_139811 ?auto_139809 ) ( OBJ-AT ?auto_139813 ?auto_139809 ) ( OBJ-AT ?auto_139812 ?auto_139809 ) ( not ( = ?auto_139810 ?auto_139811 ) ) ( not ( = ?auto_139810 ?auto_139813 ) ) ( not ( = ?auto_139810 ?auto_139812 ) ) ( not ( = ?auto_139811 ?auto_139813 ) ) ( not ( = ?auto_139811 ?auto_139812 ) ) ( not ( = ?auto_139811 ?auto_139814 ) ) ( not ( = ?auto_139813 ?auto_139812 ) ) ( not ( = ?auto_139813 ?auto_139814 ) ) ( not ( = ?auto_139812 ?auto_139814 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139814 ?auto_139810 ?auto_139809 )
      ( DELIVER-4PKG-VERIFY ?auto_139810 ?auto_139811 ?auto_139813 ?auto_139812 ?auto_139809 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139961 - OBJ
      ?auto_139962 - OBJ
      ?auto_139963 - OBJ
      ?auto_139960 - LOCATION
    )
    :vars
    (
      ?auto_139965 - LOCATION
      ?auto_139964 - CITY
      ?auto_139966 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139965 ?auto_139964 ) ( IN-CITY ?auto_139960 ?auto_139964 ) ( not ( = ?auto_139960 ?auto_139965 ) ) ( OBJ-AT ?auto_139962 ?auto_139960 ) ( not ( = ?auto_139962 ?auto_139963 ) ) ( OBJ-AT ?auto_139963 ?auto_139965 ) ( TRUCK-AT ?auto_139966 ?auto_139960 ) ( OBJ-AT ?auto_139961 ?auto_139960 ) ( not ( = ?auto_139961 ?auto_139962 ) ) ( not ( = ?auto_139961 ?auto_139963 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139962 ?auto_139963 ?auto_139960 )
      ( DELIVER-3PKG-VERIFY ?auto_139961 ?auto_139962 ?auto_139963 ?auto_139960 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139972 - OBJ
      ?auto_139973 - OBJ
      ?auto_139974 - OBJ
      ?auto_139971 - LOCATION
    )
    :vars
    (
      ?auto_139976 - LOCATION
      ?auto_139975 - CITY
      ?auto_139977 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139976 ?auto_139975 ) ( IN-CITY ?auto_139971 ?auto_139975 ) ( not ( = ?auto_139971 ?auto_139976 ) ) ( OBJ-AT ?auto_139974 ?auto_139971 ) ( not ( = ?auto_139974 ?auto_139973 ) ) ( OBJ-AT ?auto_139973 ?auto_139976 ) ( TRUCK-AT ?auto_139977 ?auto_139971 ) ( OBJ-AT ?auto_139972 ?auto_139971 ) ( not ( = ?auto_139972 ?auto_139973 ) ) ( not ( = ?auto_139972 ?auto_139974 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139974 ?auto_139973 ?auto_139971 )
      ( DELIVER-3PKG-VERIFY ?auto_139972 ?auto_139973 ?auto_139974 ?auto_139971 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139994 - OBJ
      ?auto_139995 - OBJ
      ?auto_139996 - OBJ
      ?auto_139993 - LOCATION
    )
    :vars
    (
      ?auto_139999 - LOCATION
      ?auto_139998 - CITY
      ?auto_139997 - OBJ
      ?auto_140000 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139999 ?auto_139998 ) ( IN-CITY ?auto_139993 ?auto_139998 ) ( not ( = ?auto_139993 ?auto_139999 ) ) ( OBJ-AT ?auto_139997 ?auto_139993 ) ( not ( = ?auto_139997 ?auto_139996 ) ) ( OBJ-AT ?auto_139996 ?auto_139999 ) ( TRUCK-AT ?auto_140000 ?auto_139993 ) ( OBJ-AT ?auto_139994 ?auto_139993 ) ( OBJ-AT ?auto_139995 ?auto_139993 ) ( not ( = ?auto_139994 ?auto_139995 ) ) ( not ( = ?auto_139994 ?auto_139996 ) ) ( not ( = ?auto_139994 ?auto_139997 ) ) ( not ( = ?auto_139995 ?auto_139996 ) ) ( not ( = ?auto_139995 ?auto_139997 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139997 ?auto_139996 ?auto_139993 )
      ( DELIVER-3PKG-VERIFY ?auto_139994 ?auto_139995 ?auto_139996 ?auto_139993 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140006 - OBJ
      ?auto_140007 - OBJ
      ?auto_140008 - OBJ
      ?auto_140005 - LOCATION
    )
    :vars
    (
      ?auto_140011 - LOCATION
      ?auto_140010 - CITY
      ?auto_140009 - OBJ
      ?auto_140012 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140011 ?auto_140010 ) ( IN-CITY ?auto_140005 ?auto_140010 ) ( not ( = ?auto_140005 ?auto_140011 ) ) ( OBJ-AT ?auto_140009 ?auto_140005 ) ( not ( = ?auto_140009 ?auto_140007 ) ) ( OBJ-AT ?auto_140007 ?auto_140011 ) ( TRUCK-AT ?auto_140012 ?auto_140005 ) ( OBJ-AT ?auto_140006 ?auto_140005 ) ( OBJ-AT ?auto_140008 ?auto_140005 ) ( not ( = ?auto_140006 ?auto_140007 ) ) ( not ( = ?auto_140006 ?auto_140008 ) ) ( not ( = ?auto_140006 ?auto_140009 ) ) ( not ( = ?auto_140007 ?auto_140008 ) ) ( not ( = ?auto_140008 ?auto_140009 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140009 ?auto_140007 ?auto_140005 )
      ( DELIVER-3PKG-VERIFY ?auto_140006 ?auto_140007 ?auto_140008 ?auto_140005 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140022 - OBJ
      ?auto_140023 - OBJ
      ?auto_140024 - OBJ
      ?auto_140021 - LOCATION
    )
    :vars
    (
      ?auto_140026 - LOCATION
      ?auto_140025 - CITY
      ?auto_140027 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140026 ?auto_140025 ) ( IN-CITY ?auto_140021 ?auto_140025 ) ( not ( = ?auto_140021 ?auto_140026 ) ) ( OBJ-AT ?auto_140023 ?auto_140021 ) ( not ( = ?auto_140023 ?auto_140022 ) ) ( OBJ-AT ?auto_140022 ?auto_140026 ) ( TRUCK-AT ?auto_140027 ?auto_140021 ) ( OBJ-AT ?auto_140024 ?auto_140021 ) ( not ( = ?auto_140022 ?auto_140024 ) ) ( not ( = ?auto_140023 ?auto_140024 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140023 ?auto_140022 ?auto_140021 )
      ( DELIVER-3PKG-VERIFY ?auto_140022 ?auto_140023 ?auto_140024 ?auto_140021 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140044 - OBJ
      ?auto_140045 - OBJ
      ?auto_140046 - OBJ
      ?auto_140043 - LOCATION
    )
    :vars
    (
      ?auto_140049 - LOCATION
      ?auto_140048 - CITY
      ?auto_140047 - OBJ
      ?auto_140050 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140049 ?auto_140048 ) ( IN-CITY ?auto_140043 ?auto_140048 ) ( not ( = ?auto_140043 ?auto_140049 ) ) ( OBJ-AT ?auto_140047 ?auto_140043 ) ( not ( = ?auto_140047 ?auto_140044 ) ) ( OBJ-AT ?auto_140044 ?auto_140049 ) ( TRUCK-AT ?auto_140050 ?auto_140043 ) ( OBJ-AT ?auto_140045 ?auto_140043 ) ( OBJ-AT ?auto_140046 ?auto_140043 ) ( not ( = ?auto_140044 ?auto_140045 ) ) ( not ( = ?auto_140044 ?auto_140046 ) ) ( not ( = ?auto_140045 ?auto_140046 ) ) ( not ( = ?auto_140045 ?auto_140047 ) ) ( not ( = ?auto_140046 ?auto_140047 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140047 ?auto_140044 ?auto_140043 )
      ( DELIVER-3PKG-VERIFY ?auto_140044 ?auto_140045 ?auto_140046 ?auto_140043 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140083 - OBJ
      ?auto_140084 - OBJ
      ?auto_140086 - OBJ
      ?auto_140085 - OBJ
      ?auto_140082 - LOCATION
    )
    :vars
    (
      ?auto_140088 - LOCATION
      ?auto_140087 - CITY
      ?auto_140089 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140088 ?auto_140087 ) ( IN-CITY ?auto_140082 ?auto_140087 ) ( not ( = ?auto_140082 ?auto_140088 ) ) ( OBJ-AT ?auto_140084 ?auto_140082 ) ( not ( = ?auto_140084 ?auto_140085 ) ) ( OBJ-AT ?auto_140085 ?auto_140088 ) ( TRUCK-AT ?auto_140089 ?auto_140082 ) ( OBJ-AT ?auto_140083 ?auto_140082 ) ( OBJ-AT ?auto_140086 ?auto_140082 ) ( not ( = ?auto_140083 ?auto_140084 ) ) ( not ( = ?auto_140083 ?auto_140086 ) ) ( not ( = ?auto_140083 ?auto_140085 ) ) ( not ( = ?auto_140084 ?auto_140086 ) ) ( not ( = ?auto_140086 ?auto_140085 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140084 ?auto_140085 ?auto_140082 )
      ( DELIVER-4PKG-VERIFY ?auto_140083 ?auto_140084 ?auto_140086 ?auto_140085 ?auto_140082 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140123 - OBJ
      ?auto_140124 - OBJ
      ?auto_140126 - OBJ
      ?auto_140125 - OBJ
      ?auto_140122 - LOCATION
    )
    :vars
    (
      ?auto_140128 - LOCATION
      ?auto_140127 - CITY
      ?auto_140129 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140128 ?auto_140127 ) ( IN-CITY ?auto_140122 ?auto_140127 ) ( not ( = ?auto_140122 ?auto_140128 ) ) ( OBJ-AT ?auto_140126 ?auto_140122 ) ( not ( = ?auto_140126 ?auto_140125 ) ) ( OBJ-AT ?auto_140125 ?auto_140128 ) ( TRUCK-AT ?auto_140129 ?auto_140122 ) ( OBJ-AT ?auto_140123 ?auto_140122 ) ( OBJ-AT ?auto_140124 ?auto_140122 ) ( not ( = ?auto_140123 ?auto_140124 ) ) ( not ( = ?auto_140123 ?auto_140126 ) ) ( not ( = ?auto_140123 ?auto_140125 ) ) ( not ( = ?auto_140124 ?auto_140126 ) ) ( not ( = ?auto_140124 ?auto_140125 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140126 ?auto_140125 ?auto_140122 )
      ( DELIVER-4PKG-VERIFY ?auto_140123 ?auto_140124 ?auto_140126 ?auto_140125 ?auto_140122 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140171 - OBJ
      ?auto_140172 - OBJ
      ?auto_140174 - OBJ
      ?auto_140173 - OBJ
      ?auto_140170 - LOCATION
    )
    :vars
    (
      ?auto_140176 - LOCATION
      ?auto_140175 - CITY
      ?auto_140177 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140176 ?auto_140175 ) ( IN-CITY ?auto_140170 ?auto_140175 ) ( not ( = ?auto_140170 ?auto_140176 ) ) ( OBJ-AT ?auto_140171 ?auto_140170 ) ( not ( = ?auto_140171 ?auto_140172 ) ) ( OBJ-AT ?auto_140172 ?auto_140176 ) ( TRUCK-AT ?auto_140177 ?auto_140170 ) ( OBJ-AT ?auto_140174 ?auto_140170 ) ( OBJ-AT ?auto_140173 ?auto_140170 ) ( not ( = ?auto_140171 ?auto_140174 ) ) ( not ( = ?auto_140171 ?auto_140173 ) ) ( not ( = ?auto_140172 ?auto_140174 ) ) ( not ( = ?auto_140172 ?auto_140173 ) ) ( not ( = ?auto_140174 ?auto_140173 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140171 ?auto_140172 ?auto_140170 )
      ( DELIVER-4PKG-VERIFY ?auto_140171 ?auto_140172 ?auto_140174 ?auto_140173 ?auto_140170 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140251 - OBJ
      ?auto_140252 - OBJ
      ?auto_140254 - OBJ
      ?auto_140253 - OBJ
      ?auto_140250 - LOCATION
    )
    :vars
    (
      ?auto_140256 - LOCATION
      ?auto_140255 - CITY
      ?auto_140257 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140256 ?auto_140255 ) ( IN-CITY ?auto_140250 ?auto_140255 ) ( not ( = ?auto_140250 ?auto_140256 ) ) ( OBJ-AT ?auto_140252 ?auto_140250 ) ( not ( = ?auto_140252 ?auto_140254 ) ) ( OBJ-AT ?auto_140254 ?auto_140256 ) ( TRUCK-AT ?auto_140257 ?auto_140250 ) ( OBJ-AT ?auto_140251 ?auto_140250 ) ( OBJ-AT ?auto_140253 ?auto_140250 ) ( not ( = ?auto_140251 ?auto_140252 ) ) ( not ( = ?auto_140251 ?auto_140254 ) ) ( not ( = ?auto_140251 ?auto_140253 ) ) ( not ( = ?auto_140252 ?auto_140253 ) ) ( not ( = ?auto_140254 ?auto_140253 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140252 ?auto_140254 ?auto_140250 )
      ( DELIVER-4PKG-VERIFY ?auto_140251 ?auto_140252 ?auto_140254 ?auto_140253 ?auto_140250 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140283 - OBJ
      ?auto_140284 - OBJ
      ?auto_140286 - OBJ
      ?auto_140285 - OBJ
      ?auto_140282 - LOCATION
    )
    :vars
    (
      ?auto_140289 - LOCATION
      ?auto_140288 - CITY
      ?auto_140287 - OBJ
      ?auto_140290 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140289 ?auto_140288 ) ( IN-CITY ?auto_140282 ?auto_140288 ) ( not ( = ?auto_140282 ?auto_140289 ) ) ( OBJ-AT ?auto_140287 ?auto_140282 ) ( not ( = ?auto_140287 ?auto_140285 ) ) ( OBJ-AT ?auto_140285 ?auto_140289 ) ( TRUCK-AT ?auto_140290 ?auto_140282 ) ( OBJ-AT ?auto_140283 ?auto_140282 ) ( OBJ-AT ?auto_140284 ?auto_140282 ) ( OBJ-AT ?auto_140286 ?auto_140282 ) ( not ( = ?auto_140283 ?auto_140284 ) ) ( not ( = ?auto_140283 ?auto_140286 ) ) ( not ( = ?auto_140283 ?auto_140285 ) ) ( not ( = ?auto_140283 ?auto_140287 ) ) ( not ( = ?auto_140284 ?auto_140286 ) ) ( not ( = ?auto_140284 ?auto_140285 ) ) ( not ( = ?auto_140284 ?auto_140287 ) ) ( not ( = ?auto_140286 ?auto_140285 ) ) ( not ( = ?auto_140286 ?auto_140287 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140287 ?auto_140285 ?auto_140282 )
      ( DELIVER-4PKG-VERIFY ?auto_140283 ?auto_140284 ?auto_140286 ?auto_140285 ?auto_140282 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140292 - OBJ
      ?auto_140293 - OBJ
      ?auto_140295 - OBJ
      ?auto_140294 - OBJ
      ?auto_140291 - LOCATION
    )
    :vars
    (
      ?auto_140297 - LOCATION
      ?auto_140296 - CITY
      ?auto_140298 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140297 ?auto_140296 ) ( IN-CITY ?auto_140291 ?auto_140296 ) ( not ( = ?auto_140291 ?auto_140297 ) ) ( OBJ-AT ?auto_140294 ?auto_140291 ) ( not ( = ?auto_140294 ?auto_140295 ) ) ( OBJ-AT ?auto_140295 ?auto_140297 ) ( TRUCK-AT ?auto_140298 ?auto_140291 ) ( OBJ-AT ?auto_140292 ?auto_140291 ) ( OBJ-AT ?auto_140293 ?auto_140291 ) ( not ( = ?auto_140292 ?auto_140293 ) ) ( not ( = ?auto_140292 ?auto_140295 ) ) ( not ( = ?auto_140292 ?auto_140294 ) ) ( not ( = ?auto_140293 ?auto_140295 ) ) ( not ( = ?auto_140293 ?auto_140294 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140294 ?auto_140295 ?auto_140291 )
      ( DELIVER-4PKG-VERIFY ?auto_140292 ?auto_140293 ?auto_140295 ?auto_140294 ?auto_140291 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140300 - OBJ
      ?auto_140301 - OBJ
      ?auto_140303 - OBJ
      ?auto_140302 - OBJ
      ?auto_140299 - LOCATION
    )
    :vars
    (
      ?auto_140306 - LOCATION
      ?auto_140305 - CITY
      ?auto_140304 - OBJ
      ?auto_140307 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140306 ?auto_140305 ) ( IN-CITY ?auto_140299 ?auto_140305 ) ( not ( = ?auto_140299 ?auto_140306 ) ) ( OBJ-AT ?auto_140304 ?auto_140299 ) ( not ( = ?auto_140304 ?auto_140303 ) ) ( OBJ-AT ?auto_140303 ?auto_140306 ) ( TRUCK-AT ?auto_140307 ?auto_140299 ) ( OBJ-AT ?auto_140300 ?auto_140299 ) ( OBJ-AT ?auto_140301 ?auto_140299 ) ( OBJ-AT ?auto_140302 ?auto_140299 ) ( not ( = ?auto_140300 ?auto_140301 ) ) ( not ( = ?auto_140300 ?auto_140303 ) ) ( not ( = ?auto_140300 ?auto_140302 ) ) ( not ( = ?auto_140300 ?auto_140304 ) ) ( not ( = ?auto_140301 ?auto_140303 ) ) ( not ( = ?auto_140301 ?auto_140302 ) ) ( not ( = ?auto_140301 ?auto_140304 ) ) ( not ( = ?auto_140303 ?auto_140302 ) ) ( not ( = ?auto_140302 ?auto_140304 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140304 ?auto_140303 ?auto_140299 )
      ( DELIVER-4PKG-VERIFY ?auto_140300 ?auto_140301 ?auto_140303 ?auto_140302 ?auto_140299 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140318 - OBJ
      ?auto_140319 - OBJ
      ?auto_140321 - OBJ
      ?auto_140320 - OBJ
      ?auto_140317 - LOCATION
    )
    :vars
    (
      ?auto_140323 - LOCATION
      ?auto_140322 - CITY
      ?auto_140324 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140323 ?auto_140322 ) ( IN-CITY ?auto_140317 ?auto_140322 ) ( not ( = ?auto_140317 ?auto_140323 ) ) ( OBJ-AT ?auto_140321 ?auto_140317 ) ( not ( = ?auto_140321 ?auto_140319 ) ) ( OBJ-AT ?auto_140319 ?auto_140323 ) ( TRUCK-AT ?auto_140324 ?auto_140317 ) ( OBJ-AT ?auto_140318 ?auto_140317 ) ( OBJ-AT ?auto_140320 ?auto_140317 ) ( not ( = ?auto_140318 ?auto_140319 ) ) ( not ( = ?auto_140318 ?auto_140321 ) ) ( not ( = ?auto_140318 ?auto_140320 ) ) ( not ( = ?auto_140319 ?auto_140320 ) ) ( not ( = ?auto_140321 ?auto_140320 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140321 ?auto_140319 ?auto_140317 )
      ( DELIVER-4PKG-VERIFY ?auto_140318 ?auto_140319 ?auto_140321 ?auto_140320 ?auto_140317 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140350 - OBJ
      ?auto_140351 - OBJ
      ?auto_140353 - OBJ
      ?auto_140352 - OBJ
      ?auto_140349 - LOCATION
    )
    :vars
    (
      ?auto_140356 - LOCATION
      ?auto_140355 - CITY
      ?auto_140354 - OBJ
      ?auto_140357 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140356 ?auto_140355 ) ( IN-CITY ?auto_140349 ?auto_140355 ) ( not ( = ?auto_140349 ?auto_140356 ) ) ( OBJ-AT ?auto_140354 ?auto_140349 ) ( not ( = ?auto_140354 ?auto_140351 ) ) ( OBJ-AT ?auto_140351 ?auto_140356 ) ( TRUCK-AT ?auto_140357 ?auto_140349 ) ( OBJ-AT ?auto_140350 ?auto_140349 ) ( OBJ-AT ?auto_140353 ?auto_140349 ) ( OBJ-AT ?auto_140352 ?auto_140349 ) ( not ( = ?auto_140350 ?auto_140351 ) ) ( not ( = ?auto_140350 ?auto_140353 ) ) ( not ( = ?auto_140350 ?auto_140352 ) ) ( not ( = ?auto_140350 ?auto_140354 ) ) ( not ( = ?auto_140351 ?auto_140353 ) ) ( not ( = ?auto_140351 ?auto_140352 ) ) ( not ( = ?auto_140353 ?auto_140352 ) ) ( not ( = ?auto_140353 ?auto_140354 ) ) ( not ( = ?auto_140352 ?auto_140354 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140354 ?auto_140351 ?auto_140349 )
      ( DELIVER-4PKG-VERIFY ?auto_140350 ?auto_140351 ?auto_140353 ?auto_140352 ?auto_140349 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140394 - OBJ
      ?auto_140395 - OBJ
      ?auto_140397 - OBJ
      ?auto_140396 - OBJ
      ?auto_140393 - LOCATION
    )
    :vars
    (
      ?auto_140399 - LOCATION
      ?auto_140398 - CITY
      ?auto_140400 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140399 ?auto_140398 ) ( IN-CITY ?auto_140393 ?auto_140398 ) ( not ( = ?auto_140393 ?auto_140399 ) ) ( OBJ-AT ?auto_140396 ?auto_140393 ) ( not ( = ?auto_140396 ?auto_140394 ) ) ( OBJ-AT ?auto_140394 ?auto_140399 ) ( TRUCK-AT ?auto_140400 ?auto_140393 ) ( OBJ-AT ?auto_140395 ?auto_140393 ) ( OBJ-AT ?auto_140397 ?auto_140393 ) ( not ( = ?auto_140394 ?auto_140395 ) ) ( not ( = ?auto_140394 ?auto_140397 ) ) ( not ( = ?auto_140395 ?auto_140397 ) ) ( not ( = ?auto_140395 ?auto_140396 ) ) ( not ( = ?auto_140397 ?auto_140396 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140396 ?auto_140394 ?auto_140393 )
      ( DELIVER-4PKG-VERIFY ?auto_140394 ?auto_140395 ?auto_140397 ?auto_140396 ?auto_140393 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140426 - OBJ
      ?auto_140427 - OBJ
      ?auto_140429 - OBJ
      ?auto_140428 - OBJ
      ?auto_140425 - LOCATION
    )
    :vars
    (
      ?auto_140431 - LOCATION
      ?auto_140430 - CITY
      ?auto_140432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140431 ?auto_140430 ) ( IN-CITY ?auto_140425 ?auto_140430 ) ( not ( = ?auto_140425 ?auto_140431 ) ) ( OBJ-AT ?auto_140427 ?auto_140425 ) ( not ( = ?auto_140427 ?auto_140426 ) ) ( OBJ-AT ?auto_140426 ?auto_140431 ) ( TRUCK-AT ?auto_140432 ?auto_140425 ) ( OBJ-AT ?auto_140429 ?auto_140425 ) ( OBJ-AT ?auto_140428 ?auto_140425 ) ( not ( = ?auto_140426 ?auto_140429 ) ) ( not ( = ?auto_140426 ?auto_140428 ) ) ( not ( = ?auto_140427 ?auto_140429 ) ) ( not ( = ?auto_140427 ?auto_140428 ) ) ( not ( = ?auto_140429 ?auto_140428 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140427 ?auto_140426 ?auto_140425 )
      ( DELIVER-4PKG-VERIFY ?auto_140426 ?auto_140427 ?auto_140429 ?auto_140428 ?auto_140425 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140498 - OBJ
      ?auto_140499 - OBJ
      ?auto_140501 - OBJ
      ?auto_140500 - OBJ
      ?auto_140497 - LOCATION
    )
    :vars
    (
      ?auto_140504 - LOCATION
      ?auto_140503 - CITY
      ?auto_140502 - OBJ
      ?auto_140505 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140504 ?auto_140503 ) ( IN-CITY ?auto_140497 ?auto_140503 ) ( not ( = ?auto_140497 ?auto_140504 ) ) ( OBJ-AT ?auto_140502 ?auto_140497 ) ( not ( = ?auto_140502 ?auto_140498 ) ) ( OBJ-AT ?auto_140498 ?auto_140504 ) ( TRUCK-AT ?auto_140505 ?auto_140497 ) ( OBJ-AT ?auto_140499 ?auto_140497 ) ( OBJ-AT ?auto_140501 ?auto_140497 ) ( OBJ-AT ?auto_140500 ?auto_140497 ) ( not ( = ?auto_140498 ?auto_140499 ) ) ( not ( = ?auto_140498 ?auto_140501 ) ) ( not ( = ?auto_140498 ?auto_140500 ) ) ( not ( = ?auto_140499 ?auto_140501 ) ) ( not ( = ?auto_140499 ?auto_140500 ) ) ( not ( = ?auto_140499 ?auto_140502 ) ) ( not ( = ?auto_140501 ?auto_140500 ) ) ( not ( = ?auto_140501 ?auto_140502 ) ) ( not ( = ?auto_140500 ?auto_140502 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140502 ?auto_140498 ?auto_140497 )
      ( DELIVER-4PKG-VERIFY ?auto_140498 ?auto_140499 ?auto_140501 ?auto_140500 ?auto_140497 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_141322 - OBJ
      ?auto_141321 - LOCATION
    )
    :vars
    (
      ?auto_141326 - LOCATION
      ?auto_141324 - CITY
      ?auto_141323 - OBJ
      ?auto_141325 - TRUCK
      ?auto_141327 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141326 ?auto_141324 ) ( IN-CITY ?auto_141321 ?auto_141324 ) ( not ( = ?auto_141321 ?auto_141326 ) ) ( OBJ-AT ?auto_141323 ?auto_141321 ) ( not ( = ?auto_141323 ?auto_141322 ) ) ( OBJ-AT ?auto_141322 ?auto_141326 ) ( TRUCK-AT ?auto_141325 ?auto_141327 ) ( IN-CITY ?auto_141327 ?auto_141324 ) ( not ( = ?auto_141321 ?auto_141327 ) ) ( not ( = ?auto_141326 ?auto_141327 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_141325 ?auto_141327 ?auto_141321 ?auto_141324 )
      ( DELIVER-2PKG ?auto_141323 ?auto_141322 ?auto_141321 )
      ( DELIVER-1PKG-VERIFY ?auto_141322 ?auto_141321 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_141329 - OBJ
      ?auto_141330 - OBJ
      ?auto_141328 - LOCATION
    )
    :vars
    (
      ?auto_141332 - LOCATION
      ?auto_141334 - CITY
      ?auto_141331 - TRUCK
      ?auto_141333 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141332 ?auto_141334 ) ( IN-CITY ?auto_141328 ?auto_141334 ) ( not ( = ?auto_141328 ?auto_141332 ) ) ( OBJ-AT ?auto_141329 ?auto_141328 ) ( not ( = ?auto_141329 ?auto_141330 ) ) ( OBJ-AT ?auto_141330 ?auto_141332 ) ( TRUCK-AT ?auto_141331 ?auto_141333 ) ( IN-CITY ?auto_141333 ?auto_141334 ) ( not ( = ?auto_141328 ?auto_141333 ) ) ( not ( = ?auto_141332 ?auto_141333 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_141330 ?auto_141328 )
      ( DELIVER-2PKG-VERIFY ?auto_141329 ?auto_141330 ?auto_141328 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_141344 - OBJ
      ?auto_141345 - OBJ
      ?auto_141343 - LOCATION
    )
    :vars
    (
      ?auto_141346 - LOCATION
      ?auto_141349 - CITY
      ?auto_141347 - TRUCK
      ?auto_141348 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141346 ?auto_141349 ) ( IN-CITY ?auto_141343 ?auto_141349 ) ( not ( = ?auto_141343 ?auto_141346 ) ) ( OBJ-AT ?auto_141345 ?auto_141343 ) ( not ( = ?auto_141345 ?auto_141344 ) ) ( OBJ-AT ?auto_141344 ?auto_141346 ) ( TRUCK-AT ?auto_141347 ?auto_141348 ) ( IN-CITY ?auto_141348 ?auto_141349 ) ( not ( = ?auto_141343 ?auto_141348 ) ) ( not ( = ?auto_141346 ?auto_141348 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141345 ?auto_141344 ?auto_141343 )
      ( DELIVER-2PKG-VERIFY ?auto_141344 ?auto_141345 ?auto_141343 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_141367 - OBJ
      ?auto_141368 - OBJ
      ?auto_141369 - OBJ
      ?auto_141366 - LOCATION
    )
    :vars
    (
      ?auto_141370 - LOCATION
      ?auto_141373 - CITY
      ?auto_141371 - TRUCK
      ?auto_141372 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141370 ?auto_141373 ) ( IN-CITY ?auto_141366 ?auto_141373 ) ( not ( = ?auto_141366 ?auto_141370 ) ) ( OBJ-AT ?auto_141368 ?auto_141366 ) ( not ( = ?auto_141368 ?auto_141369 ) ) ( OBJ-AT ?auto_141369 ?auto_141370 ) ( TRUCK-AT ?auto_141371 ?auto_141372 ) ( IN-CITY ?auto_141372 ?auto_141373 ) ( not ( = ?auto_141366 ?auto_141372 ) ) ( not ( = ?auto_141370 ?auto_141372 ) ) ( OBJ-AT ?auto_141367 ?auto_141366 ) ( not ( = ?auto_141367 ?auto_141368 ) ) ( not ( = ?auto_141367 ?auto_141369 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141368 ?auto_141369 ?auto_141366 )
      ( DELIVER-3PKG-VERIFY ?auto_141367 ?auto_141368 ?auto_141369 ?auto_141366 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_141383 - OBJ
      ?auto_141384 - OBJ
      ?auto_141385 - OBJ
      ?auto_141382 - LOCATION
    )
    :vars
    (
      ?auto_141386 - LOCATION
      ?auto_141389 - CITY
      ?auto_141387 - TRUCK
      ?auto_141388 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141386 ?auto_141389 ) ( IN-CITY ?auto_141382 ?auto_141389 ) ( not ( = ?auto_141382 ?auto_141386 ) ) ( OBJ-AT ?auto_141385 ?auto_141382 ) ( not ( = ?auto_141385 ?auto_141384 ) ) ( OBJ-AT ?auto_141384 ?auto_141386 ) ( TRUCK-AT ?auto_141387 ?auto_141388 ) ( IN-CITY ?auto_141388 ?auto_141389 ) ( not ( = ?auto_141382 ?auto_141388 ) ) ( not ( = ?auto_141386 ?auto_141388 ) ) ( OBJ-AT ?auto_141383 ?auto_141382 ) ( not ( = ?auto_141383 ?auto_141384 ) ) ( not ( = ?auto_141383 ?auto_141385 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141385 ?auto_141384 ?auto_141382 )
      ( DELIVER-3PKG-VERIFY ?auto_141383 ?auto_141384 ?auto_141385 ?auto_141382 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_141450 - OBJ
      ?auto_141451 - OBJ
      ?auto_141452 - OBJ
      ?auto_141449 - LOCATION
    )
    :vars
    (
      ?auto_141453 - LOCATION
      ?auto_141456 - CITY
      ?auto_141454 - TRUCK
      ?auto_141455 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141453 ?auto_141456 ) ( IN-CITY ?auto_141449 ?auto_141456 ) ( not ( = ?auto_141449 ?auto_141453 ) ) ( OBJ-AT ?auto_141452 ?auto_141449 ) ( not ( = ?auto_141452 ?auto_141450 ) ) ( OBJ-AT ?auto_141450 ?auto_141453 ) ( TRUCK-AT ?auto_141454 ?auto_141455 ) ( IN-CITY ?auto_141455 ?auto_141456 ) ( not ( = ?auto_141449 ?auto_141455 ) ) ( not ( = ?auto_141453 ?auto_141455 ) ) ( OBJ-AT ?auto_141451 ?auto_141449 ) ( not ( = ?auto_141450 ?auto_141451 ) ) ( not ( = ?auto_141451 ?auto_141452 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141452 ?auto_141450 ?auto_141449 )
      ( DELIVER-3PKG-VERIFY ?auto_141450 ?auto_141451 ?auto_141452 ?auto_141449 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141526 - OBJ
      ?auto_141527 - OBJ
      ?auto_141529 - OBJ
      ?auto_141528 - OBJ
      ?auto_141525 - LOCATION
    )
    :vars
    (
      ?auto_141530 - LOCATION
      ?auto_141533 - CITY
      ?auto_141531 - TRUCK
      ?auto_141532 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141530 ?auto_141533 ) ( IN-CITY ?auto_141525 ?auto_141533 ) ( not ( = ?auto_141525 ?auto_141530 ) ) ( OBJ-AT ?auto_141526 ?auto_141525 ) ( not ( = ?auto_141526 ?auto_141528 ) ) ( OBJ-AT ?auto_141528 ?auto_141530 ) ( TRUCK-AT ?auto_141531 ?auto_141532 ) ( IN-CITY ?auto_141532 ?auto_141533 ) ( not ( = ?auto_141525 ?auto_141532 ) ) ( not ( = ?auto_141530 ?auto_141532 ) ) ( OBJ-AT ?auto_141527 ?auto_141525 ) ( OBJ-AT ?auto_141529 ?auto_141525 ) ( not ( = ?auto_141526 ?auto_141527 ) ) ( not ( = ?auto_141526 ?auto_141529 ) ) ( not ( = ?auto_141527 ?auto_141529 ) ) ( not ( = ?auto_141527 ?auto_141528 ) ) ( not ( = ?auto_141529 ?auto_141528 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141526 ?auto_141528 ?auto_141525 )
      ( DELIVER-4PKG-VERIFY ?auto_141526 ?auto_141527 ?auto_141529 ?auto_141528 ?auto_141525 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141544 - OBJ
      ?auto_141545 - OBJ
      ?auto_141547 - OBJ
      ?auto_141546 - OBJ
      ?auto_141543 - LOCATION
    )
    :vars
    (
      ?auto_141548 - LOCATION
      ?auto_141551 - CITY
      ?auto_141549 - TRUCK
      ?auto_141550 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141548 ?auto_141551 ) ( IN-CITY ?auto_141543 ?auto_141551 ) ( not ( = ?auto_141543 ?auto_141548 ) ) ( OBJ-AT ?auto_141546 ?auto_141543 ) ( not ( = ?auto_141546 ?auto_141547 ) ) ( OBJ-AT ?auto_141547 ?auto_141548 ) ( TRUCK-AT ?auto_141549 ?auto_141550 ) ( IN-CITY ?auto_141550 ?auto_141551 ) ( not ( = ?auto_141543 ?auto_141550 ) ) ( not ( = ?auto_141548 ?auto_141550 ) ) ( OBJ-AT ?auto_141544 ?auto_141543 ) ( OBJ-AT ?auto_141545 ?auto_141543 ) ( not ( = ?auto_141544 ?auto_141545 ) ) ( not ( = ?auto_141544 ?auto_141547 ) ) ( not ( = ?auto_141544 ?auto_141546 ) ) ( not ( = ?auto_141545 ?auto_141547 ) ) ( not ( = ?auto_141545 ?auto_141546 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141546 ?auto_141547 ?auto_141543 )
      ( DELIVER-4PKG-VERIFY ?auto_141544 ?auto_141545 ?auto_141547 ?auto_141546 ?auto_141543 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141616 - OBJ
      ?auto_141617 - OBJ
      ?auto_141619 - OBJ
      ?auto_141618 - OBJ
      ?auto_141615 - LOCATION
    )
    :vars
    (
      ?auto_141620 - LOCATION
      ?auto_141623 - CITY
      ?auto_141621 - TRUCK
      ?auto_141622 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141620 ?auto_141623 ) ( IN-CITY ?auto_141615 ?auto_141623 ) ( not ( = ?auto_141615 ?auto_141620 ) ) ( OBJ-AT ?auto_141616 ?auto_141615 ) ( not ( = ?auto_141616 ?auto_141617 ) ) ( OBJ-AT ?auto_141617 ?auto_141620 ) ( TRUCK-AT ?auto_141621 ?auto_141622 ) ( IN-CITY ?auto_141622 ?auto_141623 ) ( not ( = ?auto_141615 ?auto_141622 ) ) ( not ( = ?auto_141620 ?auto_141622 ) ) ( OBJ-AT ?auto_141619 ?auto_141615 ) ( OBJ-AT ?auto_141618 ?auto_141615 ) ( not ( = ?auto_141616 ?auto_141619 ) ) ( not ( = ?auto_141616 ?auto_141618 ) ) ( not ( = ?auto_141617 ?auto_141619 ) ) ( not ( = ?auto_141617 ?auto_141618 ) ) ( not ( = ?auto_141619 ?auto_141618 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141616 ?auto_141617 ?auto_141615 )
      ( DELIVER-4PKG-VERIFY ?auto_141616 ?auto_141617 ?auto_141619 ?auto_141618 ?auto_141615 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141875 - OBJ
      ?auto_141876 - OBJ
      ?auto_141878 - OBJ
      ?auto_141877 - OBJ
      ?auto_141874 - LOCATION
    )
    :vars
    (
      ?auto_141879 - LOCATION
      ?auto_141882 - CITY
      ?auto_141880 - TRUCK
      ?auto_141881 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141879 ?auto_141882 ) ( IN-CITY ?auto_141874 ?auto_141882 ) ( not ( = ?auto_141874 ?auto_141879 ) ) ( OBJ-AT ?auto_141877 ?auto_141874 ) ( not ( = ?auto_141877 ?auto_141875 ) ) ( OBJ-AT ?auto_141875 ?auto_141879 ) ( TRUCK-AT ?auto_141880 ?auto_141881 ) ( IN-CITY ?auto_141881 ?auto_141882 ) ( not ( = ?auto_141874 ?auto_141881 ) ) ( not ( = ?auto_141879 ?auto_141881 ) ) ( OBJ-AT ?auto_141876 ?auto_141874 ) ( OBJ-AT ?auto_141878 ?auto_141874 ) ( not ( = ?auto_141875 ?auto_141876 ) ) ( not ( = ?auto_141875 ?auto_141878 ) ) ( not ( = ?auto_141876 ?auto_141878 ) ) ( not ( = ?auto_141876 ?auto_141877 ) ) ( not ( = ?auto_141878 ?auto_141877 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141877 ?auto_141875 ?auto_141874 )
      ( DELIVER-4PKG-VERIFY ?auto_141875 ?auto_141876 ?auto_141878 ?auto_141877 ?auto_141874 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_142158 - OBJ
      ?auto_142159 - OBJ
      ?auto_142160 - OBJ
      ?auto_142157 - LOCATION
    )
    :vars
    (
      ?auto_142163 - LOCATION
      ?auto_142164 - CITY
      ?auto_142162 - TRUCK
      ?auto_142161 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_142163 ?auto_142164 ) ( IN-CITY ?auto_142157 ?auto_142164 ) ( not ( = ?auto_142157 ?auto_142163 ) ) ( OBJ-AT ?auto_142158 ?auto_142157 ) ( not ( = ?auto_142158 ?auto_142160 ) ) ( OBJ-AT ?auto_142160 ?auto_142163 ) ( TRUCK-AT ?auto_142162 ?auto_142161 ) ( IN-CITY ?auto_142161 ?auto_142164 ) ( not ( = ?auto_142157 ?auto_142161 ) ) ( not ( = ?auto_142163 ?auto_142161 ) ) ( OBJ-AT ?auto_142159 ?auto_142157 ) ( not ( = ?auto_142158 ?auto_142159 ) ) ( not ( = ?auto_142159 ?auto_142160 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_142158 ?auto_142160 ?auto_142157 )
      ( DELIVER-3PKG-VERIFY ?auto_142158 ?auto_142159 ?auto_142160 ?auto_142157 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_142241 - OBJ
      ?auto_142242 - OBJ
      ?auto_142243 - OBJ
      ?auto_142240 - LOCATION
    )
    :vars
    (
      ?auto_142246 - LOCATION
      ?auto_142247 - CITY
      ?auto_142245 - TRUCK
      ?auto_142244 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_142246 ?auto_142247 ) ( IN-CITY ?auto_142240 ?auto_142247 ) ( not ( = ?auto_142240 ?auto_142246 ) ) ( OBJ-AT ?auto_142242 ?auto_142240 ) ( not ( = ?auto_142242 ?auto_142241 ) ) ( OBJ-AT ?auto_142241 ?auto_142246 ) ( TRUCK-AT ?auto_142245 ?auto_142244 ) ( IN-CITY ?auto_142244 ?auto_142247 ) ( not ( = ?auto_142240 ?auto_142244 ) ) ( not ( = ?auto_142246 ?auto_142244 ) ) ( OBJ-AT ?auto_142243 ?auto_142240 ) ( not ( = ?auto_142241 ?auto_142243 ) ) ( not ( = ?auto_142242 ?auto_142243 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_142242 ?auto_142241 ?auto_142240 )
      ( DELIVER-3PKG-VERIFY ?auto_142241 ?auto_142242 ?auto_142243 ?auto_142240 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_142666 - OBJ
      ?auto_142667 - OBJ
      ?auto_142669 - OBJ
      ?auto_142668 - OBJ
      ?auto_142665 - LOCATION
    )
    :vars
    (
      ?auto_142672 - LOCATION
      ?auto_142673 - CITY
      ?auto_142671 - TRUCK
      ?auto_142670 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_142672 ?auto_142673 ) ( IN-CITY ?auto_142665 ?auto_142673 ) ( not ( = ?auto_142665 ?auto_142672 ) ) ( OBJ-AT ?auto_142667 ?auto_142665 ) ( not ( = ?auto_142667 ?auto_142666 ) ) ( OBJ-AT ?auto_142666 ?auto_142672 ) ( TRUCK-AT ?auto_142671 ?auto_142670 ) ( IN-CITY ?auto_142670 ?auto_142673 ) ( not ( = ?auto_142665 ?auto_142670 ) ) ( not ( = ?auto_142672 ?auto_142670 ) ) ( OBJ-AT ?auto_142669 ?auto_142665 ) ( OBJ-AT ?auto_142668 ?auto_142665 ) ( not ( = ?auto_142666 ?auto_142669 ) ) ( not ( = ?auto_142666 ?auto_142668 ) ) ( not ( = ?auto_142667 ?auto_142669 ) ) ( not ( = ?auto_142667 ?auto_142668 ) ) ( not ( = ?auto_142669 ?auto_142668 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_142667 ?auto_142666 ?auto_142665 )
      ( DELIVER-4PKG-VERIFY ?auto_142666 ?auto_142667 ?auto_142669 ?auto_142668 ?auto_142665 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_148894 - OBJ
      ?auto_148895 - OBJ
      ?auto_148896 - OBJ
      ?auto_148893 - LOCATION
    )
    :vars
    (
      ?auto_148897 - TRUCK
      ?auto_148898 - LOCATION
      ?auto_148899 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_148896 ?auto_148897 ) ( TRUCK-AT ?auto_148897 ?auto_148898 ) ( IN-CITY ?auto_148898 ?auto_148899 ) ( IN-CITY ?auto_148893 ?auto_148899 ) ( not ( = ?auto_148893 ?auto_148898 ) ) ( OBJ-AT ?auto_148895 ?auto_148893 ) ( not ( = ?auto_148895 ?auto_148896 ) ) ( OBJ-AT ?auto_148894 ?auto_148893 ) ( not ( = ?auto_148894 ?auto_148895 ) ) ( not ( = ?auto_148894 ?auto_148896 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_148895 ?auto_148896 ?auto_148893 )
      ( DELIVER-3PKG-VERIFY ?auto_148894 ?auto_148895 ?auto_148896 ?auto_148893 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_150542 - OBJ
      ?auto_150543 - OBJ
      ?auto_150544 - OBJ
      ?auto_150541 - LOCATION
    )
    :vars
    (
      ?auto_150546 - TRUCK
      ?auto_150547 - LOCATION
      ?auto_150545 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_150546 ?auto_150547 ) ( IN-CITY ?auto_150547 ?auto_150545 ) ( IN-CITY ?auto_150541 ?auto_150545 ) ( not ( = ?auto_150541 ?auto_150547 ) ) ( OBJ-AT ?auto_150542 ?auto_150541 ) ( not ( = ?auto_150542 ?auto_150544 ) ) ( OBJ-AT ?auto_150544 ?auto_150547 ) ( OBJ-AT ?auto_150543 ?auto_150541 ) ( not ( = ?auto_150542 ?auto_150543 ) ) ( not ( = ?auto_150543 ?auto_150544 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_150542 ?auto_150544 ?auto_150541 )
      ( DELIVER-3PKG-VERIFY ?auto_150542 ?auto_150543 ?auto_150544 ?auto_150541 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155632 - OBJ
      ?auto_155633 - OBJ
      ?auto_155634 - OBJ
      ?auto_155631 - LOCATION
    )
    :vars
    (
      ?auto_155636 - LOCATION
      ?auto_155635 - CITY
      ?auto_155637 - TRUCK
      ?auto_155638 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155636 ?auto_155635 ) ( IN-CITY ?auto_155631 ?auto_155635 ) ( not ( = ?auto_155631 ?auto_155636 ) ) ( OBJ-AT ?auto_155632 ?auto_155631 ) ( not ( = ?auto_155632 ?auto_155633 ) ) ( OBJ-AT ?auto_155633 ?auto_155636 ) ( TRUCK-AT ?auto_155637 ?auto_155638 ) ( IN-CITY ?auto_155638 ?auto_155635 ) ( not ( = ?auto_155631 ?auto_155638 ) ) ( not ( = ?auto_155636 ?auto_155638 ) ) ( OBJ-AT ?auto_155634 ?auto_155631 ) ( not ( = ?auto_155632 ?auto_155634 ) ) ( not ( = ?auto_155633 ?auto_155634 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155632 ?auto_155633 ?auto_155631 )
      ( DELIVER-3PKG-VERIFY ?auto_155632 ?auto_155633 ?auto_155634 ?auto_155631 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155664 - OBJ
      ?auto_155665 - OBJ
      ?auto_155666 - OBJ
      ?auto_155663 - LOCATION
    )
    :vars
    (
      ?auto_155669 - LOCATION
      ?auto_155667 - CITY
      ?auto_155668 - OBJ
      ?auto_155670 - TRUCK
      ?auto_155671 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155669 ?auto_155667 ) ( IN-CITY ?auto_155663 ?auto_155667 ) ( not ( = ?auto_155663 ?auto_155669 ) ) ( OBJ-AT ?auto_155668 ?auto_155663 ) ( not ( = ?auto_155668 ?auto_155666 ) ) ( OBJ-AT ?auto_155666 ?auto_155669 ) ( TRUCK-AT ?auto_155670 ?auto_155671 ) ( IN-CITY ?auto_155671 ?auto_155667 ) ( not ( = ?auto_155663 ?auto_155671 ) ) ( not ( = ?auto_155669 ?auto_155671 ) ) ( OBJ-AT ?auto_155664 ?auto_155663 ) ( OBJ-AT ?auto_155665 ?auto_155663 ) ( not ( = ?auto_155664 ?auto_155665 ) ) ( not ( = ?auto_155664 ?auto_155666 ) ) ( not ( = ?auto_155664 ?auto_155668 ) ) ( not ( = ?auto_155665 ?auto_155666 ) ) ( not ( = ?auto_155665 ?auto_155668 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155668 ?auto_155666 ?auto_155663 )
      ( DELIVER-3PKG-VERIFY ?auto_155664 ?auto_155665 ?auto_155666 ?auto_155663 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155686 - OBJ
      ?auto_155687 - OBJ
      ?auto_155688 - OBJ
      ?auto_155685 - LOCATION
    )
    :vars
    (
      ?auto_155691 - LOCATION
      ?auto_155689 - CITY
      ?auto_155690 - OBJ
      ?auto_155692 - TRUCK
      ?auto_155693 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155691 ?auto_155689 ) ( IN-CITY ?auto_155685 ?auto_155689 ) ( not ( = ?auto_155685 ?auto_155691 ) ) ( OBJ-AT ?auto_155690 ?auto_155685 ) ( not ( = ?auto_155690 ?auto_155687 ) ) ( OBJ-AT ?auto_155687 ?auto_155691 ) ( TRUCK-AT ?auto_155692 ?auto_155693 ) ( IN-CITY ?auto_155693 ?auto_155689 ) ( not ( = ?auto_155685 ?auto_155693 ) ) ( not ( = ?auto_155691 ?auto_155693 ) ) ( OBJ-AT ?auto_155686 ?auto_155685 ) ( OBJ-AT ?auto_155688 ?auto_155685 ) ( not ( = ?auto_155686 ?auto_155687 ) ) ( not ( = ?auto_155686 ?auto_155688 ) ) ( not ( = ?auto_155686 ?auto_155690 ) ) ( not ( = ?auto_155687 ?auto_155688 ) ) ( not ( = ?auto_155688 ?auto_155690 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155690 ?auto_155687 ?auto_155685 )
      ( DELIVER-3PKG-VERIFY ?auto_155686 ?auto_155687 ?auto_155688 ?auto_155685 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155806 - OBJ
      ?auto_155807 - OBJ
      ?auto_155808 - OBJ
      ?auto_155805 - LOCATION
    )
    :vars
    (
      ?auto_155811 - LOCATION
      ?auto_155809 - CITY
      ?auto_155810 - OBJ
      ?auto_155812 - TRUCK
      ?auto_155813 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155811 ?auto_155809 ) ( IN-CITY ?auto_155805 ?auto_155809 ) ( not ( = ?auto_155805 ?auto_155811 ) ) ( OBJ-AT ?auto_155810 ?auto_155805 ) ( not ( = ?auto_155810 ?auto_155806 ) ) ( OBJ-AT ?auto_155806 ?auto_155811 ) ( TRUCK-AT ?auto_155812 ?auto_155813 ) ( IN-CITY ?auto_155813 ?auto_155809 ) ( not ( = ?auto_155805 ?auto_155813 ) ) ( not ( = ?auto_155811 ?auto_155813 ) ) ( OBJ-AT ?auto_155807 ?auto_155805 ) ( OBJ-AT ?auto_155808 ?auto_155805 ) ( not ( = ?auto_155806 ?auto_155807 ) ) ( not ( = ?auto_155806 ?auto_155808 ) ) ( not ( = ?auto_155807 ?auto_155808 ) ) ( not ( = ?auto_155807 ?auto_155810 ) ) ( not ( = ?auto_155808 ?auto_155810 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155810 ?auto_155806 ?auto_155805 )
      ( DELIVER-3PKG-VERIFY ?auto_155806 ?auto_155807 ?auto_155808 ?auto_155805 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155903 - OBJ
      ?auto_155904 - OBJ
      ?auto_155906 - OBJ
      ?auto_155905 - OBJ
      ?auto_155902 - LOCATION
    )
    :vars
    (
      ?auto_155908 - LOCATION
      ?auto_155907 - CITY
      ?auto_155909 - TRUCK
      ?auto_155910 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155908 ?auto_155907 ) ( IN-CITY ?auto_155902 ?auto_155907 ) ( not ( = ?auto_155902 ?auto_155908 ) ) ( OBJ-AT ?auto_155904 ?auto_155902 ) ( not ( = ?auto_155904 ?auto_155905 ) ) ( OBJ-AT ?auto_155905 ?auto_155908 ) ( TRUCK-AT ?auto_155909 ?auto_155910 ) ( IN-CITY ?auto_155910 ?auto_155907 ) ( not ( = ?auto_155902 ?auto_155910 ) ) ( not ( = ?auto_155908 ?auto_155910 ) ) ( OBJ-AT ?auto_155903 ?auto_155902 ) ( OBJ-AT ?auto_155906 ?auto_155902 ) ( not ( = ?auto_155903 ?auto_155904 ) ) ( not ( = ?auto_155903 ?auto_155906 ) ) ( not ( = ?auto_155903 ?auto_155905 ) ) ( not ( = ?auto_155904 ?auto_155906 ) ) ( not ( = ?auto_155906 ?auto_155905 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155904 ?auto_155905 ?auto_155902 )
      ( DELIVER-4PKG-VERIFY ?auto_155903 ?auto_155904 ?auto_155906 ?auto_155905 ?auto_155902 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155939 - OBJ
      ?auto_155940 - OBJ
      ?auto_155942 - OBJ
      ?auto_155941 - OBJ
      ?auto_155938 - LOCATION
    )
    :vars
    (
      ?auto_155944 - LOCATION
      ?auto_155943 - CITY
      ?auto_155945 - TRUCK
      ?auto_155946 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155944 ?auto_155943 ) ( IN-CITY ?auto_155938 ?auto_155943 ) ( not ( = ?auto_155938 ?auto_155944 ) ) ( OBJ-AT ?auto_155940 ?auto_155938 ) ( not ( = ?auto_155940 ?auto_155942 ) ) ( OBJ-AT ?auto_155942 ?auto_155944 ) ( TRUCK-AT ?auto_155945 ?auto_155946 ) ( IN-CITY ?auto_155946 ?auto_155943 ) ( not ( = ?auto_155938 ?auto_155946 ) ) ( not ( = ?auto_155944 ?auto_155946 ) ) ( OBJ-AT ?auto_155939 ?auto_155938 ) ( OBJ-AT ?auto_155941 ?auto_155938 ) ( not ( = ?auto_155939 ?auto_155940 ) ) ( not ( = ?auto_155939 ?auto_155942 ) ) ( not ( = ?auto_155939 ?auto_155941 ) ) ( not ( = ?auto_155940 ?auto_155941 ) ) ( not ( = ?auto_155942 ?auto_155941 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155940 ?auto_155942 ?auto_155938 )
      ( DELIVER-4PKG-VERIFY ?auto_155939 ?auto_155940 ?auto_155942 ?auto_155941 ?auto_155938 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156002 - OBJ
      ?auto_156003 - OBJ
      ?auto_156005 - OBJ
      ?auto_156004 - OBJ
      ?auto_156001 - LOCATION
    )
    :vars
    (
      ?auto_156007 - LOCATION
      ?auto_156006 - CITY
      ?auto_156008 - TRUCK
      ?auto_156009 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156007 ?auto_156006 ) ( IN-CITY ?auto_156001 ?auto_156006 ) ( not ( = ?auto_156001 ?auto_156007 ) ) ( OBJ-AT ?auto_156002 ?auto_156001 ) ( not ( = ?auto_156002 ?auto_156005 ) ) ( OBJ-AT ?auto_156005 ?auto_156007 ) ( TRUCK-AT ?auto_156008 ?auto_156009 ) ( IN-CITY ?auto_156009 ?auto_156006 ) ( not ( = ?auto_156001 ?auto_156009 ) ) ( not ( = ?auto_156007 ?auto_156009 ) ) ( OBJ-AT ?auto_156003 ?auto_156001 ) ( OBJ-AT ?auto_156004 ?auto_156001 ) ( not ( = ?auto_156002 ?auto_156003 ) ) ( not ( = ?auto_156002 ?auto_156004 ) ) ( not ( = ?auto_156003 ?auto_156005 ) ) ( not ( = ?auto_156003 ?auto_156004 ) ) ( not ( = ?auto_156005 ?auto_156004 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156002 ?auto_156005 ?auto_156001 )
      ( DELIVER-4PKG-VERIFY ?auto_156002 ?auto_156003 ?auto_156005 ?auto_156004 ?auto_156001 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156101 - OBJ
      ?auto_156102 - OBJ
      ?auto_156104 - OBJ
      ?auto_156103 - OBJ
      ?auto_156100 - LOCATION
    )
    :vars
    (
      ?auto_156106 - LOCATION
      ?auto_156105 - CITY
      ?auto_156107 - TRUCK
      ?auto_156108 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156106 ?auto_156105 ) ( IN-CITY ?auto_156100 ?auto_156105 ) ( not ( = ?auto_156100 ?auto_156106 ) ) ( OBJ-AT ?auto_156104 ?auto_156100 ) ( not ( = ?auto_156104 ?auto_156102 ) ) ( OBJ-AT ?auto_156102 ?auto_156106 ) ( TRUCK-AT ?auto_156107 ?auto_156108 ) ( IN-CITY ?auto_156108 ?auto_156105 ) ( not ( = ?auto_156100 ?auto_156108 ) ) ( not ( = ?auto_156106 ?auto_156108 ) ) ( OBJ-AT ?auto_156101 ?auto_156100 ) ( OBJ-AT ?auto_156103 ?auto_156100 ) ( not ( = ?auto_156101 ?auto_156102 ) ) ( not ( = ?auto_156101 ?auto_156104 ) ) ( not ( = ?auto_156101 ?auto_156103 ) ) ( not ( = ?auto_156102 ?auto_156103 ) ) ( not ( = ?auto_156104 ?auto_156103 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156104 ?auto_156102 ?auto_156100 )
      ( DELIVER-4PKG-VERIFY ?auto_156101 ?auto_156102 ?auto_156104 ?auto_156103 ?auto_156100 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156128 - OBJ
      ?auto_156129 - OBJ
      ?auto_156131 - OBJ
      ?auto_156130 - OBJ
      ?auto_156127 - LOCATION
    )
    :vars
    (
      ?auto_156133 - LOCATION
      ?auto_156132 - CITY
      ?auto_156134 - TRUCK
      ?auto_156135 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156133 ?auto_156132 ) ( IN-CITY ?auto_156127 ?auto_156132 ) ( not ( = ?auto_156127 ?auto_156133 ) ) ( OBJ-AT ?auto_156130 ?auto_156127 ) ( not ( = ?auto_156130 ?auto_156129 ) ) ( OBJ-AT ?auto_156129 ?auto_156133 ) ( TRUCK-AT ?auto_156134 ?auto_156135 ) ( IN-CITY ?auto_156135 ?auto_156132 ) ( not ( = ?auto_156127 ?auto_156135 ) ) ( not ( = ?auto_156133 ?auto_156135 ) ) ( OBJ-AT ?auto_156128 ?auto_156127 ) ( OBJ-AT ?auto_156131 ?auto_156127 ) ( not ( = ?auto_156128 ?auto_156129 ) ) ( not ( = ?auto_156128 ?auto_156131 ) ) ( not ( = ?auto_156128 ?auto_156130 ) ) ( not ( = ?auto_156129 ?auto_156131 ) ) ( not ( = ?auto_156131 ?auto_156130 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156130 ?auto_156129 ?auto_156127 )
      ( DELIVER-4PKG-VERIFY ?auto_156128 ?auto_156129 ?auto_156131 ?auto_156130 ?auto_156127 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156236 - OBJ
      ?auto_156237 - OBJ
      ?auto_156239 - OBJ
      ?auto_156238 - OBJ
      ?auto_156235 - LOCATION
    )
    :vars
    (
      ?auto_156241 - LOCATION
      ?auto_156240 - CITY
      ?auto_156242 - TRUCK
      ?auto_156243 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156241 ?auto_156240 ) ( IN-CITY ?auto_156235 ?auto_156240 ) ( not ( = ?auto_156235 ?auto_156241 ) ) ( OBJ-AT ?auto_156239 ?auto_156235 ) ( not ( = ?auto_156239 ?auto_156238 ) ) ( OBJ-AT ?auto_156238 ?auto_156241 ) ( TRUCK-AT ?auto_156242 ?auto_156243 ) ( IN-CITY ?auto_156243 ?auto_156240 ) ( not ( = ?auto_156235 ?auto_156243 ) ) ( not ( = ?auto_156241 ?auto_156243 ) ) ( OBJ-AT ?auto_156236 ?auto_156235 ) ( OBJ-AT ?auto_156237 ?auto_156235 ) ( not ( = ?auto_156236 ?auto_156237 ) ) ( not ( = ?auto_156236 ?auto_156239 ) ) ( not ( = ?auto_156236 ?auto_156238 ) ) ( not ( = ?auto_156237 ?auto_156239 ) ) ( not ( = ?auto_156237 ?auto_156238 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156239 ?auto_156238 ?auto_156235 )
      ( DELIVER-4PKG-VERIFY ?auto_156236 ?auto_156237 ?auto_156239 ?auto_156238 ?auto_156235 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156308 - OBJ
      ?auto_156309 - OBJ
      ?auto_156311 - OBJ
      ?auto_156310 - OBJ
      ?auto_156307 - LOCATION
    )
    :vars
    (
      ?auto_156314 - LOCATION
      ?auto_156312 - CITY
      ?auto_156313 - OBJ
      ?auto_156315 - TRUCK
      ?auto_156316 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156314 ?auto_156312 ) ( IN-CITY ?auto_156307 ?auto_156312 ) ( not ( = ?auto_156307 ?auto_156314 ) ) ( OBJ-AT ?auto_156313 ?auto_156307 ) ( not ( = ?auto_156313 ?auto_156310 ) ) ( OBJ-AT ?auto_156310 ?auto_156314 ) ( TRUCK-AT ?auto_156315 ?auto_156316 ) ( IN-CITY ?auto_156316 ?auto_156312 ) ( not ( = ?auto_156307 ?auto_156316 ) ) ( not ( = ?auto_156314 ?auto_156316 ) ) ( OBJ-AT ?auto_156308 ?auto_156307 ) ( OBJ-AT ?auto_156309 ?auto_156307 ) ( OBJ-AT ?auto_156311 ?auto_156307 ) ( not ( = ?auto_156308 ?auto_156309 ) ) ( not ( = ?auto_156308 ?auto_156311 ) ) ( not ( = ?auto_156308 ?auto_156310 ) ) ( not ( = ?auto_156308 ?auto_156313 ) ) ( not ( = ?auto_156309 ?auto_156311 ) ) ( not ( = ?auto_156309 ?auto_156310 ) ) ( not ( = ?auto_156309 ?auto_156313 ) ) ( not ( = ?auto_156311 ?auto_156310 ) ) ( not ( = ?auto_156311 ?auto_156313 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156313 ?auto_156310 ?auto_156307 )
      ( DELIVER-4PKG-VERIFY ?auto_156308 ?auto_156309 ?auto_156311 ?auto_156310 ?auto_156307 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156337 - OBJ
      ?auto_156338 - OBJ
      ?auto_156340 - OBJ
      ?auto_156339 - OBJ
      ?auto_156336 - LOCATION
    )
    :vars
    (
      ?auto_156343 - LOCATION
      ?auto_156341 - CITY
      ?auto_156342 - OBJ
      ?auto_156344 - TRUCK
      ?auto_156345 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156343 ?auto_156341 ) ( IN-CITY ?auto_156336 ?auto_156341 ) ( not ( = ?auto_156336 ?auto_156343 ) ) ( OBJ-AT ?auto_156342 ?auto_156336 ) ( not ( = ?auto_156342 ?auto_156340 ) ) ( OBJ-AT ?auto_156340 ?auto_156343 ) ( TRUCK-AT ?auto_156344 ?auto_156345 ) ( IN-CITY ?auto_156345 ?auto_156341 ) ( not ( = ?auto_156336 ?auto_156345 ) ) ( not ( = ?auto_156343 ?auto_156345 ) ) ( OBJ-AT ?auto_156337 ?auto_156336 ) ( OBJ-AT ?auto_156338 ?auto_156336 ) ( OBJ-AT ?auto_156339 ?auto_156336 ) ( not ( = ?auto_156337 ?auto_156338 ) ) ( not ( = ?auto_156337 ?auto_156340 ) ) ( not ( = ?auto_156337 ?auto_156339 ) ) ( not ( = ?auto_156337 ?auto_156342 ) ) ( not ( = ?auto_156338 ?auto_156340 ) ) ( not ( = ?auto_156338 ?auto_156339 ) ) ( not ( = ?auto_156338 ?auto_156342 ) ) ( not ( = ?auto_156340 ?auto_156339 ) ) ( not ( = ?auto_156339 ?auto_156342 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156342 ?auto_156340 ?auto_156336 )
      ( DELIVER-4PKG-VERIFY ?auto_156337 ?auto_156338 ?auto_156340 ?auto_156339 ?auto_156336 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156480 - OBJ
      ?auto_156481 - OBJ
      ?auto_156483 - OBJ
      ?auto_156482 - OBJ
      ?auto_156479 - LOCATION
    )
    :vars
    (
      ?auto_156486 - LOCATION
      ?auto_156484 - CITY
      ?auto_156485 - OBJ
      ?auto_156487 - TRUCK
      ?auto_156488 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156486 ?auto_156484 ) ( IN-CITY ?auto_156479 ?auto_156484 ) ( not ( = ?auto_156479 ?auto_156486 ) ) ( OBJ-AT ?auto_156485 ?auto_156479 ) ( not ( = ?auto_156485 ?auto_156481 ) ) ( OBJ-AT ?auto_156481 ?auto_156486 ) ( TRUCK-AT ?auto_156487 ?auto_156488 ) ( IN-CITY ?auto_156488 ?auto_156484 ) ( not ( = ?auto_156479 ?auto_156488 ) ) ( not ( = ?auto_156486 ?auto_156488 ) ) ( OBJ-AT ?auto_156480 ?auto_156479 ) ( OBJ-AT ?auto_156483 ?auto_156479 ) ( OBJ-AT ?auto_156482 ?auto_156479 ) ( not ( = ?auto_156480 ?auto_156481 ) ) ( not ( = ?auto_156480 ?auto_156483 ) ) ( not ( = ?auto_156480 ?auto_156482 ) ) ( not ( = ?auto_156480 ?auto_156485 ) ) ( not ( = ?auto_156481 ?auto_156483 ) ) ( not ( = ?auto_156481 ?auto_156482 ) ) ( not ( = ?auto_156483 ?auto_156482 ) ) ( not ( = ?auto_156483 ?auto_156485 ) ) ( not ( = ?auto_156482 ?auto_156485 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156485 ?auto_156481 ?auto_156479 )
      ( DELIVER-4PKG-VERIFY ?auto_156480 ?auto_156481 ?auto_156483 ?auto_156482 ?auto_156479 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156949 - OBJ
      ?auto_156950 - OBJ
      ?auto_156952 - OBJ
      ?auto_156951 - OBJ
      ?auto_156948 - LOCATION
    )
    :vars
    (
      ?auto_156954 - LOCATION
      ?auto_156953 - CITY
      ?auto_156955 - TRUCK
      ?auto_156956 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156954 ?auto_156953 ) ( IN-CITY ?auto_156948 ?auto_156953 ) ( not ( = ?auto_156948 ?auto_156954 ) ) ( OBJ-AT ?auto_156952 ?auto_156948 ) ( not ( = ?auto_156952 ?auto_156949 ) ) ( OBJ-AT ?auto_156949 ?auto_156954 ) ( TRUCK-AT ?auto_156955 ?auto_156956 ) ( IN-CITY ?auto_156956 ?auto_156953 ) ( not ( = ?auto_156948 ?auto_156956 ) ) ( not ( = ?auto_156954 ?auto_156956 ) ) ( OBJ-AT ?auto_156950 ?auto_156948 ) ( OBJ-AT ?auto_156951 ?auto_156948 ) ( not ( = ?auto_156949 ?auto_156950 ) ) ( not ( = ?auto_156949 ?auto_156951 ) ) ( not ( = ?auto_156950 ?auto_156952 ) ) ( not ( = ?auto_156950 ?auto_156951 ) ) ( not ( = ?auto_156952 ?auto_156951 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156952 ?auto_156949 ?auto_156948 )
      ( DELIVER-4PKG-VERIFY ?auto_156949 ?auto_156950 ?auto_156952 ?auto_156951 ?auto_156948 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_157129 - OBJ
      ?auto_157130 - OBJ
      ?auto_157132 - OBJ
      ?auto_157131 - OBJ
      ?auto_157128 - LOCATION
    )
    :vars
    (
      ?auto_157135 - LOCATION
      ?auto_157133 - CITY
      ?auto_157134 - OBJ
      ?auto_157136 - TRUCK
      ?auto_157137 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_157135 ?auto_157133 ) ( IN-CITY ?auto_157128 ?auto_157133 ) ( not ( = ?auto_157128 ?auto_157135 ) ) ( OBJ-AT ?auto_157134 ?auto_157128 ) ( not ( = ?auto_157134 ?auto_157129 ) ) ( OBJ-AT ?auto_157129 ?auto_157135 ) ( TRUCK-AT ?auto_157136 ?auto_157137 ) ( IN-CITY ?auto_157137 ?auto_157133 ) ( not ( = ?auto_157128 ?auto_157137 ) ) ( not ( = ?auto_157135 ?auto_157137 ) ) ( OBJ-AT ?auto_157130 ?auto_157128 ) ( OBJ-AT ?auto_157132 ?auto_157128 ) ( OBJ-AT ?auto_157131 ?auto_157128 ) ( not ( = ?auto_157129 ?auto_157130 ) ) ( not ( = ?auto_157129 ?auto_157132 ) ) ( not ( = ?auto_157129 ?auto_157131 ) ) ( not ( = ?auto_157130 ?auto_157132 ) ) ( not ( = ?auto_157130 ?auto_157131 ) ) ( not ( = ?auto_157130 ?auto_157134 ) ) ( not ( = ?auto_157132 ?auto_157131 ) ) ( not ( = ?auto_157132 ?auto_157134 ) ) ( not ( = ?auto_157131 ?auto_157134 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157134 ?auto_157129 ?auto_157128 )
      ( DELIVER-4PKG-VERIFY ?auto_157129 ?auto_157130 ?auto_157132 ?auto_157131 ?auto_157128 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_170636 - OBJ
      ?auto_170635 - LOCATION
    )
    :vars
    (
      ?auto_170640 - LOCATION
      ?auto_170638 - CITY
      ?auto_170637 - OBJ
      ?auto_170639 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170640 ?auto_170638 ) ( IN-CITY ?auto_170635 ?auto_170638 ) ( not ( = ?auto_170635 ?auto_170640 ) ) ( not ( = ?auto_170637 ?auto_170636 ) ) ( OBJ-AT ?auto_170636 ?auto_170640 ) ( IN-TRUCK ?auto_170637 ?auto_170639 ) ( TRUCK-AT ?auto_170639 ?auto_170640 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_170639 ?auto_170640 ?auto_170635 ?auto_170638 )
      ( DELIVER-2PKG ?auto_170637 ?auto_170636 ?auto_170635 )
      ( DELIVER-1PKG-VERIFY ?auto_170636 ?auto_170635 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_170642 - OBJ
      ?auto_170643 - OBJ
      ?auto_170641 - LOCATION
    )
    :vars
    (
      ?auto_170646 - LOCATION
      ?auto_170644 - CITY
      ?auto_170645 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170646 ?auto_170644 ) ( IN-CITY ?auto_170641 ?auto_170644 ) ( not ( = ?auto_170641 ?auto_170646 ) ) ( not ( = ?auto_170642 ?auto_170643 ) ) ( OBJ-AT ?auto_170643 ?auto_170646 ) ( IN-TRUCK ?auto_170642 ?auto_170645 ) ( TRUCK-AT ?auto_170645 ?auto_170646 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_170643 ?auto_170641 )
      ( DELIVER-2PKG-VERIFY ?auto_170642 ?auto_170643 ?auto_170641 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_170662 - OBJ
      ?auto_170663 - OBJ
      ?auto_170661 - LOCATION
    )
    :vars
    (
      ?auto_170665 - LOCATION
      ?auto_170666 - CITY
      ?auto_170664 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170665 ?auto_170666 ) ( IN-CITY ?auto_170661 ?auto_170666 ) ( not ( = ?auto_170661 ?auto_170665 ) ) ( not ( = ?auto_170663 ?auto_170662 ) ) ( OBJ-AT ?auto_170662 ?auto_170665 ) ( IN-TRUCK ?auto_170663 ?auto_170664 ) ( TRUCK-AT ?auto_170664 ?auto_170665 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170663 ?auto_170662 ?auto_170661 )
      ( DELIVER-2PKG-VERIFY ?auto_170662 ?auto_170663 ?auto_170661 ) )
  )

)

