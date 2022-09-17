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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6855 - OBJ
      ?auto_6854 - LOCATION
    )
    :vars
    (
      ?auto_6856 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6856 ?auto_6854 ) ( IN-TRUCK ?auto_6855 ?auto_6856 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_6855 ?auto_6856 ?auto_6854 )
      ( DELIVER-1PKG-VERIFY ?auto_6855 ?auto_6854 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6867 - OBJ
      ?auto_6866 - LOCATION
    )
    :vars
    (
      ?auto_6868 - TRUCK
      ?auto_6869 - LOCATION
      ?auto_6870 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6867 ?auto_6868 ) ( TRUCK-AT ?auto_6868 ?auto_6869 ) ( IN-CITY ?auto_6869 ?auto_6870 ) ( IN-CITY ?auto_6866 ?auto_6870 ) ( not ( = ?auto_6866 ?auto_6869 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6868 ?auto_6869 ?auto_6866 ?auto_6870 )
      ( DELIVER-1PKG ?auto_6867 ?auto_6866 )
      ( DELIVER-1PKG-VERIFY ?auto_6867 ?auto_6866 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6885 - OBJ
      ?auto_6884 - LOCATION
    )
    :vars
    (
      ?auto_6888 - TRUCK
      ?auto_6887 - LOCATION
      ?auto_6886 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6888 ?auto_6887 ) ( IN-CITY ?auto_6887 ?auto_6886 ) ( IN-CITY ?auto_6884 ?auto_6886 ) ( not ( = ?auto_6884 ?auto_6887 ) ) ( OBJ-AT ?auto_6885 ?auto_6887 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6885 ?auto_6888 ?auto_6887 )
      ( DELIVER-1PKG ?auto_6885 ?auto_6884 )
      ( DELIVER-1PKG-VERIFY ?auto_6885 ?auto_6884 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6903 - OBJ
      ?auto_6902 - LOCATION
    )
    :vars
    (
      ?auto_6905 - LOCATION
      ?auto_6904 - CITY
      ?auto_6906 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6905 ?auto_6904 ) ( IN-CITY ?auto_6902 ?auto_6904 ) ( not ( = ?auto_6902 ?auto_6905 ) ) ( OBJ-AT ?auto_6903 ?auto_6905 ) ( TRUCK-AT ?auto_6906 ?auto_6902 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6906 ?auto_6902 ?auto_6905 ?auto_6904 )
      ( DELIVER-1PKG ?auto_6903 ?auto_6902 )
      ( DELIVER-1PKG-VERIFY ?auto_6903 ?auto_6902 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6963 - OBJ
      ?auto_6964 - OBJ
      ?auto_6962 - LOCATION
    )
    :vars
    (
      ?auto_6965 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6964 ?auto_6963 ) ) ( TRUCK-AT ?auto_6965 ?auto_6962 ) ( IN-TRUCK ?auto_6964 ?auto_6965 ) ( OBJ-AT ?auto_6963 ?auto_6962 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6964 ?auto_6962 )
      ( DELIVER-2PKG-VERIFY ?auto_6963 ?auto_6964 ?auto_6962 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6967 - OBJ
      ?auto_6968 - OBJ
      ?auto_6966 - LOCATION
    )
    :vars
    (
      ?auto_6969 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6968 ?auto_6967 ) ) ( TRUCK-AT ?auto_6969 ?auto_6966 ) ( IN-TRUCK ?auto_6967 ?auto_6969 ) ( OBJ-AT ?auto_6968 ?auto_6966 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6967 ?auto_6966 )
      ( DELIVER-2PKG-VERIFY ?auto_6967 ?auto_6968 ?auto_6966 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7015 - OBJ
      ?auto_7016 - OBJ
      ?auto_7014 - LOCATION
    )
    :vars
    (
      ?auto_7019 - TRUCK
      ?auto_7018 - LOCATION
      ?auto_7017 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_7016 ?auto_7015 ) ) ( IN-TRUCK ?auto_7016 ?auto_7019 ) ( TRUCK-AT ?auto_7019 ?auto_7018 ) ( IN-CITY ?auto_7018 ?auto_7017 ) ( IN-CITY ?auto_7014 ?auto_7017 ) ( not ( = ?auto_7014 ?auto_7018 ) ) ( OBJ-AT ?auto_7015 ?auto_7014 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7016 ?auto_7014 )
      ( DELIVER-2PKG-VERIFY ?auto_7015 ?auto_7016 ?auto_7014 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7021 - OBJ
      ?auto_7022 - OBJ
      ?auto_7020 - LOCATION
    )
    :vars
    (
      ?auto_7024 - TRUCK
      ?auto_7025 - LOCATION
      ?auto_7023 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_7022 ?auto_7021 ) ) ( IN-TRUCK ?auto_7021 ?auto_7024 ) ( TRUCK-AT ?auto_7024 ?auto_7025 ) ( IN-CITY ?auto_7025 ?auto_7023 ) ( IN-CITY ?auto_7020 ?auto_7023 ) ( not ( = ?auto_7020 ?auto_7025 ) ) ( OBJ-AT ?auto_7022 ?auto_7020 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7022 ?auto_7021 ?auto_7020 )
      ( DELIVER-2PKG-VERIFY ?auto_7021 ?auto_7022 ?auto_7020 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7084 - OBJ
      ?auto_7083 - LOCATION
    )
    :vars
    (
      ?auto_7087 - OBJ
      ?auto_7086 - TRUCK
      ?auto_7088 - LOCATION
      ?auto_7085 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_7084 ?auto_7087 ) ) ( TRUCK-AT ?auto_7086 ?auto_7088 ) ( IN-CITY ?auto_7088 ?auto_7085 ) ( IN-CITY ?auto_7083 ?auto_7085 ) ( not ( = ?auto_7083 ?auto_7088 ) ) ( OBJ-AT ?auto_7087 ?auto_7083 ) ( OBJ-AT ?auto_7084 ?auto_7088 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7084 ?auto_7086 ?auto_7088 )
      ( DELIVER-2PKG ?auto_7087 ?auto_7084 ?auto_7083 )
      ( DELIVER-1PKG-VERIFY ?auto_7084 ?auto_7083 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7090 - OBJ
      ?auto_7091 - OBJ
      ?auto_7089 - LOCATION
    )
    :vars
    (
      ?auto_7094 - TRUCK
      ?auto_7092 - LOCATION
      ?auto_7093 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_7091 ?auto_7090 ) ) ( TRUCK-AT ?auto_7094 ?auto_7092 ) ( IN-CITY ?auto_7092 ?auto_7093 ) ( IN-CITY ?auto_7089 ?auto_7093 ) ( not ( = ?auto_7089 ?auto_7092 ) ) ( OBJ-AT ?auto_7090 ?auto_7089 ) ( OBJ-AT ?auto_7091 ?auto_7092 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7091 ?auto_7089 )
      ( DELIVER-2PKG-VERIFY ?auto_7090 ?auto_7091 ?auto_7089 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7096 - OBJ
      ?auto_7097 - OBJ
      ?auto_7095 - LOCATION
    )
    :vars
    (
      ?auto_7100 - TRUCK
      ?auto_7099 - LOCATION
      ?auto_7098 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_7097 ?auto_7096 ) ) ( TRUCK-AT ?auto_7100 ?auto_7099 ) ( IN-CITY ?auto_7099 ?auto_7098 ) ( IN-CITY ?auto_7095 ?auto_7098 ) ( not ( = ?auto_7095 ?auto_7099 ) ) ( OBJ-AT ?auto_7097 ?auto_7095 ) ( OBJ-AT ?auto_7096 ?auto_7099 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7097 ?auto_7096 ?auto_7095 )
      ( DELIVER-2PKG-VERIFY ?auto_7096 ?auto_7097 ?auto_7095 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7159 - OBJ
      ?auto_7158 - LOCATION
    )
    :vars
    (
      ?auto_7163 - OBJ
      ?auto_7161 - LOCATION
      ?auto_7160 - CITY
      ?auto_7162 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7159 ?auto_7163 ) ) ( IN-CITY ?auto_7161 ?auto_7160 ) ( IN-CITY ?auto_7158 ?auto_7160 ) ( not ( = ?auto_7158 ?auto_7161 ) ) ( OBJ-AT ?auto_7163 ?auto_7158 ) ( OBJ-AT ?auto_7159 ?auto_7161 ) ( TRUCK-AT ?auto_7162 ?auto_7158 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7162 ?auto_7158 ?auto_7161 ?auto_7160 )
      ( DELIVER-2PKG ?auto_7163 ?auto_7159 ?auto_7158 )
      ( DELIVER-1PKG-VERIFY ?auto_7159 ?auto_7158 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7165 - OBJ
      ?auto_7166 - OBJ
      ?auto_7164 - LOCATION
    )
    :vars
    (
      ?auto_7168 - LOCATION
      ?auto_7169 - CITY
      ?auto_7167 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7166 ?auto_7165 ) ) ( IN-CITY ?auto_7168 ?auto_7169 ) ( IN-CITY ?auto_7164 ?auto_7169 ) ( not ( = ?auto_7164 ?auto_7168 ) ) ( OBJ-AT ?auto_7165 ?auto_7164 ) ( OBJ-AT ?auto_7166 ?auto_7168 ) ( TRUCK-AT ?auto_7167 ?auto_7164 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7166 ?auto_7164 )
      ( DELIVER-2PKG-VERIFY ?auto_7165 ?auto_7166 ?auto_7164 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7171 - OBJ
      ?auto_7172 - OBJ
      ?auto_7170 - LOCATION
    )
    :vars
    (
      ?auto_7175 - LOCATION
      ?auto_7173 - CITY
      ?auto_7174 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7172 ?auto_7171 ) ) ( IN-CITY ?auto_7175 ?auto_7173 ) ( IN-CITY ?auto_7170 ?auto_7173 ) ( not ( = ?auto_7170 ?auto_7175 ) ) ( OBJ-AT ?auto_7172 ?auto_7170 ) ( OBJ-AT ?auto_7171 ?auto_7175 ) ( TRUCK-AT ?auto_7174 ?auto_7170 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7172 ?auto_7171 ?auto_7170 )
      ( DELIVER-2PKG-VERIFY ?auto_7171 ?auto_7172 ?auto_7170 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7234 - OBJ
      ?auto_7233 - LOCATION
    )
    :vars
    (
      ?auto_7235 - OBJ
      ?auto_7238 - LOCATION
      ?auto_7236 - CITY
      ?auto_7237 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7234 ?auto_7235 ) ) ( IN-CITY ?auto_7238 ?auto_7236 ) ( IN-CITY ?auto_7233 ?auto_7236 ) ( not ( = ?auto_7233 ?auto_7238 ) ) ( OBJ-AT ?auto_7234 ?auto_7238 ) ( TRUCK-AT ?auto_7237 ?auto_7233 ) ( IN-TRUCK ?auto_7235 ?auto_7237 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7235 ?auto_7233 )
      ( DELIVER-2PKG ?auto_7235 ?auto_7234 ?auto_7233 )
      ( DELIVER-1PKG-VERIFY ?auto_7234 ?auto_7233 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7240 - OBJ
      ?auto_7241 - OBJ
      ?auto_7239 - LOCATION
    )
    :vars
    (
      ?auto_7243 - LOCATION
      ?auto_7244 - CITY
      ?auto_7242 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7241 ?auto_7240 ) ) ( IN-CITY ?auto_7243 ?auto_7244 ) ( IN-CITY ?auto_7239 ?auto_7244 ) ( not ( = ?auto_7239 ?auto_7243 ) ) ( OBJ-AT ?auto_7241 ?auto_7243 ) ( TRUCK-AT ?auto_7242 ?auto_7239 ) ( IN-TRUCK ?auto_7240 ?auto_7242 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7241 ?auto_7239 )
      ( DELIVER-2PKG-VERIFY ?auto_7240 ?auto_7241 ?auto_7239 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7246 - OBJ
      ?auto_7247 - OBJ
      ?auto_7245 - LOCATION
    )
    :vars
    (
      ?auto_7249 - LOCATION
      ?auto_7250 - CITY
      ?auto_7248 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7247 ?auto_7246 ) ) ( IN-CITY ?auto_7249 ?auto_7250 ) ( IN-CITY ?auto_7245 ?auto_7250 ) ( not ( = ?auto_7245 ?auto_7249 ) ) ( OBJ-AT ?auto_7246 ?auto_7249 ) ( TRUCK-AT ?auto_7248 ?auto_7245 ) ( IN-TRUCK ?auto_7247 ?auto_7248 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7247 ?auto_7246 ?auto_7245 )
      ( DELIVER-2PKG-VERIFY ?auto_7246 ?auto_7247 ?auto_7245 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7309 - OBJ
      ?auto_7308 - LOCATION
    )
    :vars
    (
      ?auto_7312 - OBJ
      ?auto_7311 - LOCATION
      ?auto_7313 - CITY
      ?auto_7310 - TRUCK
      ?auto_7314 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7309 ?auto_7312 ) ) ( IN-CITY ?auto_7311 ?auto_7313 ) ( IN-CITY ?auto_7308 ?auto_7313 ) ( not ( = ?auto_7308 ?auto_7311 ) ) ( OBJ-AT ?auto_7309 ?auto_7311 ) ( IN-TRUCK ?auto_7312 ?auto_7310 ) ( TRUCK-AT ?auto_7310 ?auto_7314 ) ( IN-CITY ?auto_7314 ?auto_7313 ) ( not ( = ?auto_7308 ?auto_7314 ) ) ( not ( = ?auto_7311 ?auto_7314 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7310 ?auto_7314 ?auto_7308 ?auto_7313 )
      ( DELIVER-2PKG ?auto_7312 ?auto_7309 ?auto_7308 )
      ( DELIVER-1PKG-VERIFY ?auto_7309 ?auto_7308 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7316 - OBJ
      ?auto_7317 - OBJ
      ?auto_7315 - LOCATION
    )
    :vars
    (
      ?auto_7319 - LOCATION
      ?auto_7320 - CITY
      ?auto_7321 - TRUCK
      ?auto_7318 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7317 ?auto_7316 ) ) ( IN-CITY ?auto_7319 ?auto_7320 ) ( IN-CITY ?auto_7315 ?auto_7320 ) ( not ( = ?auto_7315 ?auto_7319 ) ) ( OBJ-AT ?auto_7317 ?auto_7319 ) ( IN-TRUCK ?auto_7316 ?auto_7321 ) ( TRUCK-AT ?auto_7321 ?auto_7318 ) ( IN-CITY ?auto_7318 ?auto_7320 ) ( not ( = ?auto_7315 ?auto_7318 ) ) ( not ( = ?auto_7319 ?auto_7318 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7317 ?auto_7315 )
      ( DELIVER-2PKG-VERIFY ?auto_7316 ?auto_7317 ?auto_7315 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7323 - OBJ
      ?auto_7324 - OBJ
      ?auto_7322 - LOCATION
    )
    :vars
    (
      ?auto_7325 - LOCATION
      ?auto_7326 - CITY
      ?auto_7328 - TRUCK
      ?auto_7327 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7324 ?auto_7323 ) ) ( IN-CITY ?auto_7325 ?auto_7326 ) ( IN-CITY ?auto_7322 ?auto_7326 ) ( not ( = ?auto_7322 ?auto_7325 ) ) ( OBJ-AT ?auto_7323 ?auto_7325 ) ( IN-TRUCK ?auto_7324 ?auto_7328 ) ( TRUCK-AT ?auto_7328 ?auto_7327 ) ( IN-CITY ?auto_7327 ?auto_7326 ) ( not ( = ?auto_7322 ?auto_7327 ) ) ( not ( = ?auto_7325 ?auto_7327 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7324 ?auto_7323 ?auto_7322 )
      ( DELIVER-2PKG-VERIFY ?auto_7323 ?auto_7324 ?auto_7322 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7395 - OBJ
      ?auto_7394 - LOCATION
    )
    :vars
    (
      ?auto_7399 - OBJ
      ?auto_7396 - LOCATION
      ?auto_7397 - CITY
      ?auto_7400 - TRUCK
      ?auto_7398 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7395 ?auto_7399 ) ) ( IN-CITY ?auto_7396 ?auto_7397 ) ( IN-CITY ?auto_7394 ?auto_7397 ) ( not ( = ?auto_7394 ?auto_7396 ) ) ( OBJ-AT ?auto_7395 ?auto_7396 ) ( TRUCK-AT ?auto_7400 ?auto_7398 ) ( IN-CITY ?auto_7398 ?auto_7397 ) ( not ( = ?auto_7394 ?auto_7398 ) ) ( not ( = ?auto_7396 ?auto_7398 ) ) ( OBJ-AT ?auto_7399 ?auto_7398 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7399 ?auto_7400 ?auto_7398 )
      ( DELIVER-2PKG ?auto_7399 ?auto_7395 ?auto_7394 )
      ( DELIVER-1PKG-VERIFY ?auto_7395 ?auto_7394 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7402 - OBJ
      ?auto_7403 - OBJ
      ?auto_7401 - LOCATION
    )
    :vars
    (
      ?auto_7407 - LOCATION
      ?auto_7405 - CITY
      ?auto_7406 - TRUCK
      ?auto_7404 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7403 ?auto_7402 ) ) ( IN-CITY ?auto_7407 ?auto_7405 ) ( IN-CITY ?auto_7401 ?auto_7405 ) ( not ( = ?auto_7401 ?auto_7407 ) ) ( OBJ-AT ?auto_7403 ?auto_7407 ) ( TRUCK-AT ?auto_7406 ?auto_7404 ) ( IN-CITY ?auto_7404 ?auto_7405 ) ( not ( = ?auto_7401 ?auto_7404 ) ) ( not ( = ?auto_7407 ?auto_7404 ) ) ( OBJ-AT ?auto_7402 ?auto_7404 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7403 ?auto_7401 )
      ( DELIVER-2PKG-VERIFY ?auto_7402 ?auto_7403 ?auto_7401 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7409 - OBJ
      ?auto_7410 - OBJ
      ?auto_7408 - LOCATION
    )
    :vars
    (
      ?auto_7412 - LOCATION
      ?auto_7414 - CITY
      ?auto_7411 - TRUCK
      ?auto_7413 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7410 ?auto_7409 ) ) ( IN-CITY ?auto_7412 ?auto_7414 ) ( IN-CITY ?auto_7408 ?auto_7414 ) ( not ( = ?auto_7408 ?auto_7412 ) ) ( OBJ-AT ?auto_7409 ?auto_7412 ) ( TRUCK-AT ?auto_7411 ?auto_7413 ) ( IN-CITY ?auto_7413 ?auto_7414 ) ( not ( = ?auto_7408 ?auto_7413 ) ) ( not ( = ?auto_7412 ?auto_7413 ) ) ( OBJ-AT ?auto_7410 ?auto_7413 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7410 ?auto_7409 ?auto_7408 )
      ( DELIVER-2PKG-VERIFY ?auto_7409 ?auto_7410 ?auto_7408 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7669 - OBJ
      ?auto_7670 - OBJ
      ?auto_7671 - OBJ
      ?auto_7668 - LOCATION
    )
    :vars
    (
      ?auto_7672 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7670 ?auto_7669 ) ) ( not ( = ?auto_7671 ?auto_7669 ) ) ( not ( = ?auto_7671 ?auto_7670 ) ) ( TRUCK-AT ?auto_7672 ?auto_7668 ) ( IN-TRUCK ?auto_7671 ?auto_7672 ) ( OBJ-AT ?auto_7669 ?auto_7668 ) ( OBJ-AT ?auto_7670 ?auto_7668 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7671 ?auto_7668 )
      ( DELIVER-3PKG-VERIFY ?auto_7669 ?auto_7670 ?auto_7671 ?auto_7668 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7679 - OBJ
      ?auto_7680 - OBJ
      ?auto_7681 - OBJ
      ?auto_7678 - LOCATION
    )
    :vars
    (
      ?auto_7682 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7680 ?auto_7679 ) ) ( not ( = ?auto_7681 ?auto_7679 ) ) ( not ( = ?auto_7681 ?auto_7680 ) ) ( TRUCK-AT ?auto_7682 ?auto_7678 ) ( IN-TRUCK ?auto_7680 ?auto_7682 ) ( OBJ-AT ?auto_7679 ?auto_7678 ) ( OBJ-AT ?auto_7681 ?auto_7678 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7680 ?auto_7678 )
      ( DELIVER-3PKG-VERIFY ?auto_7679 ?auto_7680 ?auto_7681 ?auto_7678 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7717 - OBJ
      ?auto_7718 - OBJ
      ?auto_7719 - OBJ
      ?auto_7716 - LOCATION
    )
    :vars
    (
      ?auto_7720 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7718 ?auto_7717 ) ) ( not ( = ?auto_7719 ?auto_7717 ) ) ( not ( = ?auto_7719 ?auto_7718 ) ) ( TRUCK-AT ?auto_7720 ?auto_7716 ) ( IN-TRUCK ?auto_7717 ?auto_7720 ) ( OBJ-AT ?auto_7718 ?auto_7716 ) ( OBJ-AT ?auto_7719 ?auto_7716 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7717 ?auto_7716 )
      ( DELIVER-3PKG-VERIFY ?auto_7717 ?auto_7718 ?auto_7719 ?auto_7716 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7793 - OBJ
      ?auto_7794 - OBJ
      ?auto_7795 - OBJ
      ?auto_7792 - LOCATION
    )
    :vars
    (
      ?auto_7797 - TRUCK
      ?auto_7796 - LOCATION
      ?auto_7798 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_7794 ?auto_7793 ) ) ( not ( = ?auto_7795 ?auto_7793 ) ) ( not ( = ?auto_7795 ?auto_7794 ) ) ( IN-TRUCK ?auto_7795 ?auto_7797 ) ( TRUCK-AT ?auto_7797 ?auto_7796 ) ( IN-CITY ?auto_7796 ?auto_7798 ) ( IN-CITY ?auto_7792 ?auto_7798 ) ( not ( = ?auto_7792 ?auto_7796 ) ) ( OBJ-AT ?auto_7793 ?auto_7792 ) ( OBJ-AT ?auto_7794 ?auto_7792 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7793 ?auto_7795 ?auto_7792 )
      ( DELIVER-3PKG-VERIFY ?auto_7793 ?auto_7794 ?auto_7795 ?auto_7792 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7807 - OBJ
      ?auto_7808 - OBJ
      ?auto_7809 - OBJ
      ?auto_7806 - LOCATION
    )
    :vars
    (
      ?auto_7811 - TRUCK
      ?auto_7810 - LOCATION
      ?auto_7812 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_7808 ?auto_7807 ) ) ( not ( = ?auto_7809 ?auto_7807 ) ) ( not ( = ?auto_7809 ?auto_7808 ) ) ( IN-TRUCK ?auto_7808 ?auto_7811 ) ( TRUCK-AT ?auto_7811 ?auto_7810 ) ( IN-CITY ?auto_7810 ?auto_7812 ) ( IN-CITY ?auto_7806 ?auto_7812 ) ( not ( = ?auto_7806 ?auto_7810 ) ) ( OBJ-AT ?auto_7807 ?auto_7806 ) ( OBJ-AT ?auto_7809 ?auto_7806 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7807 ?auto_7808 ?auto_7806 )
      ( DELIVER-3PKG-VERIFY ?auto_7807 ?auto_7808 ?auto_7809 ?auto_7806 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7860 - OBJ
      ?auto_7861 - OBJ
      ?auto_7862 - OBJ
      ?auto_7859 - LOCATION
    )
    :vars
    (
      ?auto_7864 - TRUCK
      ?auto_7863 - LOCATION
      ?auto_7865 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_7861 ?auto_7860 ) ) ( not ( = ?auto_7862 ?auto_7860 ) ) ( not ( = ?auto_7862 ?auto_7861 ) ) ( IN-TRUCK ?auto_7860 ?auto_7864 ) ( TRUCK-AT ?auto_7864 ?auto_7863 ) ( IN-CITY ?auto_7863 ?auto_7865 ) ( IN-CITY ?auto_7859 ?auto_7865 ) ( not ( = ?auto_7859 ?auto_7863 ) ) ( OBJ-AT ?auto_7861 ?auto_7859 ) ( OBJ-AT ?auto_7862 ?auto_7859 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7861 ?auto_7860 ?auto_7859 )
      ( DELIVER-3PKG-VERIFY ?auto_7860 ?auto_7861 ?auto_7862 ?auto_7859 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7955 - OBJ
      ?auto_7956 - OBJ
      ?auto_7957 - OBJ
      ?auto_7954 - LOCATION
    )
    :vars
    (
      ?auto_7960 - TRUCK
      ?auto_7959 - LOCATION
      ?auto_7958 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_7956 ?auto_7955 ) ) ( not ( = ?auto_7957 ?auto_7955 ) ) ( not ( = ?auto_7957 ?auto_7956 ) ) ( TRUCK-AT ?auto_7960 ?auto_7959 ) ( IN-CITY ?auto_7959 ?auto_7958 ) ( IN-CITY ?auto_7954 ?auto_7958 ) ( not ( = ?auto_7954 ?auto_7959 ) ) ( OBJ-AT ?auto_7955 ?auto_7954 ) ( OBJ-AT ?auto_7957 ?auto_7959 ) ( OBJ-AT ?auto_7956 ?auto_7954 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7955 ?auto_7957 ?auto_7954 )
      ( DELIVER-3PKG-VERIFY ?auto_7955 ?auto_7956 ?auto_7957 ?auto_7954 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7969 - OBJ
      ?auto_7970 - OBJ
      ?auto_7971 - OBJ
      ?auto_7968 - LOCATION
    )
    :vars
    (
      ?auto_7974 - TRUCK
      ?auto_7973 - LOCATION
      ?auto_7972 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_7970 ?auto_7969 ) ) ( not ( = ?auto_7971 ?auto_7969 ) ) ( not ( = ?auto_7971 ?auto_7970 ) ) ( TRUCK-AT ?auto_7974 ?auto_7973 ) ( IN-CITY ?auto_7973 ?auto_7972 ) ( IN-CITY ?auto_7968 ?auto_7972 ) ( not ( = ?auto_7968 ?auto_7973 ) ) ( OBJ-AT ?auto_7969 ?auto_7968 ) ( OBJ-AT ?auto_7970 ?auto_7973 ) ( OBJ-AT ?auto_7971 ?auto_7968 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7969 ?auto_7970 ?auto_7968 )
      ( DELIVER-3PKG-VERIFY ?auto_7969 ?auto_7970 ?auto_7971 ?auto_7968 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8022 - OBJ
      ?auto_8023 - OBJ
      ?auto_8024 - OBJ
      ?auto_8021 - LOCATION
    )
    :vars
    (
      ?auto_8027 - TRUCK
      ?auto_8026 - LOCATION
      ?auto_8025 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8023 ?auto_8022 ) ) ( not ( = ?auto_8024 ?auto_8022 ) ) ( not ( = ?auto_8024 ?auto_8023 ) ) ( TRUCK-AT ?auto_8027 ?auto_8026 ) ( IN-CITY ?auto_8026 ?auto_8025 ) ( IN-CITY ?auto_8021 ?auto_8025 ) ( not ( = ?auto_8021 ?auto_8026 ) ) ( OBJ-AT ?auto_8023 ?auto_8021 ) ( OBJ-AT ?auto_8022 ?auto_8026 ) ( OBJ-AT ?auto_8024 ?auto_8021 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8023 ?auto_8022 ?auto_8021 )
      ( DELIVER-3PKG-VERIFY ?auto_8022 ?auto_8023 ?auto_8024 ?auto_8021 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8117 - OBJ
      ?auto_8118 - OBJ
      ?auto_8119 - OBJ
      ?auto_8116 - LOCATION
    )
    :vars
    (
      ?auto_8122 - LOCATION
      ?auto_8120 - CITY
      ?auto_8121 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8118 ?auto_8117 ) ) ( not ( = ?auto_8119 ?auto_8117 ) ) ( not ( = ?auto_8119 ?auto_8118 ) ) ( IN-CITY ?auto_8122 ?auto_8120 ) ( IN-CITY ?auto_8116 ?auto_8120 ) ( not ( = ?auto_8116 ?auto_8122 ) ) ( OBJ-AT ?auto_8117 ?auto_8116 ) ( OBJ-AT ?auto_8119 ?auto_8122 ) ( TRUCK-AT ?auto_8121 ?auto_8116 ) ( OBJ-AT ?auto_8118 ?auto_8116 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8117 ?auto_8119 ?auto_8116 )
      ( DELIVER-3PKG-VERIFY ?auto_8117 ?auto_8118 ?auto_8119 ?auto_8116 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8131 - OBJ
      ?auto_8132 - OBJ
      ?auto_8133 - OBJ
      ?auto_8130 - LOCATION
    )
    :vars
    (
      ?auto_8136 - LOCATION
      ?auto_8134 - CITY
      ?auto_8135 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8132 ?auto_8131 ) ) ( not ( = ?auto_8133 ?auto_8131 ) ) ( not ( = ?auto_8133 ?auto_8132 ) ) ( IN-CITY ?auto_8136 ?auto_8134 ) ( IN-CITY ?auto_8130 ?auto_8134 ) ( not ( = ?auto_8130 ?auto_8136 ) ) ( OBJ-AT ?auto_8131 ?auto_8130 ) ( OBJ-AT ?auto_8132 ?auto_8136 ) ( TRUCK-AT ?auto_8135 ?auto_8130 ) ( OBJ-AT ?auto_8133 ?auto_8130 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8131 ?auto_8132 ?auto_8130 )
      ( DELIVER-3PKG-VERIFY ?auto_8131 ?auto_8132 ?auto_8133 ?auto_8130 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8184 - OBJ
      ?auto_8185 - OBJ
      ?auto_8186 - OBJ
      ?auto_8183 - LOCATION
    )
    :vars
    (
      ?auto_8189 - LOCATION
      ?auto_8187 - CITY
      ?auto_8188 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8185 ?auto_8184 ) ) ( not ( = ?auto_8186 ?auto_8184 ) ) ( not ( = ?auto_8186 ?auto_8185 ) ) ( IN-CITY ?auto_8189 ?auto_8187 ) ( IN-CITY ?auto_8183 ?auto_8187 ) ( not ( = ?auto_8183 ?auto_8189 ) ) ( OBJ-AT ?auto_8185 ?auto_8183 ) ( OBJ-AT ?auto_8184 ?auto_8189 ) ( TRUCK-AT ?auto_8188 ?auto_8183 ) ( OBJ-AT ?auto_8186 ?auto_8183 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8185 ?auto_8184 ?auto_8183 )
      ( DELIVER-3PKG-VERIFY ?auto_8184 ?auto_8185 ?auto_8186 ?auto_8183 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8410 - OBJ
      ?auto_8409 - LOCATION
    )
    :vars
    (
      ?auto_8413 - OBJ
      ?auto_8412 - LOCATION
      ?auto_8411 - CITY
      ?auto_8414 - TRUCK
      ?auto_8415 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_8410 ?auto_8413 ) ) ( IN-CITY ?auto_8412 ?auto_8411 ) ( IN-CITY ?auto_8409 ?auto_8411 ) ( not ( = ?auto_8409 ?auto_8412 ) ) ( OBJ-AT ?auto_8413 ?auto_8409 ) ( OBJ-AT ?auto_8410 ?auto_8412 ) ( TRUCK-AT ?auto_8414 ?auto_8415 ) ( IN-CITY ?auto_8415 ?auto_8411 ) ( not ( = ?auto_8409 ?auto_8415 ) ) ( not ( = ?auto_8412 ?auto_8415 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8414 ?auto_8415 ?auto_8409 ?auto_8411 )
      ( DELIVER-2PKG ?auto_8413 ?auto_8410 ?auto_8409 )
      ( DELIVER-1PKG-VERIFY ?auto_8410 ?auto_8409 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8417 - OBJ
      ?auto_8418 - OBJ
      ?auto_8416 - LOCATION
    )
    :vars
    (
      ?auto_8420 - LOCATION
      ?auto_8421 - CITY
      ?auto_8419 - TRUCK
      ?auto_8422 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_8418 ?auto_8417 ) ) ( IN-CITY ?auto_8420 ?auto_8421 ) ( IN-CITY ?auto_8416 ?auto_8421 ) ( not ( = ?auto_8416 ?auto_8420 ) ) ( OBJ-AT ?auto_8417 ?auto_8416 ) ( OBJ-AT ?auto_8418 ?auto_8420 ) ( TRUCK-AT ?auto_8419 ?auto_8422 ) ( IN-CITY ?auto_8422 ?auto_8421 ) ( not ( = ?auto_8416 ?auto_8422 ) ) ( not ( = ?auto_8420 ?auto_8422 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8418 ?auto_8416 )
      ( DELIVER-2PKG-VERIFY ?auto_8417 ?auto_8418 ?auto_8416 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8432 - OBJ
      ?auto_8433 - OBJ
      ?auto_8431 - LOCATION
    )
    :vars
    (
      ?auto_8435 - LOCATION
      ?auto_8436 - CITY
      ?auto_8434 - TRUCK
      ?auto_8437 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_8433 ?auto_8432 ) ) ( IN-CITY ?auto_8435 ?auto_8436 ) ( IN-CITY ?auto_8431 ?auto_8436 ) ( not ( = ?auto_8431 ?auto_8435 ) ) ( OBJ-AT ?auto_8433 ?auto_8431 ) ( OBJ-AT ?auto_8432 ?auto_8435 ) ( TRUCK-AT ?auto_8434 ?auto_8437 ) ( IN-CITY ?auto_8437 ?auto_8436 ) ( not ( = ?auto_8431 ?auto_8437 ) ) ( not ( = ?auto_8435 ?auto_8437 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8433 ?auto_8432 ?auto_8431 )
      ( DELIVER-2PKG-VERIFY ?auto_8432 ?auto_8433 ?auto_8431 ) )
  )

)

