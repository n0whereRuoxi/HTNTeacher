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
      ?auto_15920 - PERSON
      ?auto_15919 - CITY
    )
    :vars
    (
      ?auto_15921 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_15920 ?auto_15921 ) ( AIRCRAFT-AT ?auto_15921 ?auto_15919 ) )
    :subtasks
    ( ( !DEBARK ?auto_15920 ?auto_15921 ?auto_15919 )
      ( FLY-1PPL-VERIFY ?auto_15920 ?auto_15919 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_15932 - PERSON
      ?auto_15931 - CITY
    )
    :vars
    (
      ?auto_15933 - AIRCRAFT
      ?auto_15936 - CITY
      ?auto_15934 - FLEVEL
      ?auto_15935 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_15932 ?auto_15933 ) ( AIRCRAFT-AT ?auto_15933 ?auto_15936 ) ( FUEL-LEVEL ?auto_15933 ?auto_15934 ) ( NEXT ?auto_15935 ?auto_15934 ) ( not ( = ?auto_15931 ?auto_15936 ) ) ( not ( = ?auto_15934 ?auto_15935 ) ) )
    :subtasks
    ( ( !FLY ?auto_15933 ?auto_15936 ?auto_15931 ?auto_15934 ?auto_15935 )
      ( FLY-1PPL ?auto_15932 ?auto_15931 )
      ( FLY-1PPL-VERIFY ?auto_15932 ?auto_15931 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_15953 - PERSON
      ?auto_15952 - CITY
    )
    :vars
    (
      ?auto_15955 - AIRCRAFT
      ?auto_15956 - CITY
      ?auto_15954 - FLEVEL
      ?auto_15957 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_15955 ?auto_15956 ) ( FUEL-LEVEL ?auto_15955 ?auto_15954 ) ( NEXT ?auto_15957 ?auto_15954 ) ( not ( = ?auto_15952 ?auto_15956 ) ) ( not ( = ?auto_15954 ?auto_15957 ) ) ( PERSON-AT ?auto_15953 ?auto_15956 ) )
    :subtasks
    ( ( !BOARD ?auto_15953 ?auto_15955 ?auto_15956 )
      ( FLY-1PPL ?auto_15953 ?auto_15952 )
      ( FLY-1PPL-VERIFY ?auto_15953 ?auto_15952 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_15974 - PERSON
      ?auto_15973 - CITY
    )
    :vars
    (
      ?auto_15978 - AIRCRAFT
      ?auto_15975 - CITY
      ?auto_15976 - FLEVEL
      ?auto_15977 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_15978 ?auto_15975 ) ( NEXT ?auto_15976 ?auto_15977 ) ( not ( = ?auto_15973 ?auto_15975 ) ) ( not ( = ?auto_15977 ?auto_15976 ) ) ( PERSON-AT ?auto_15974 ?auto_15975 ) ( FUEL-LEVEL ?auto_15978 ?auto_15976 ) )
    :subtasks
    ( ( !REFUEL ?auto_15978 ?auto_15975 ?auto_15976 ?auto_15977 )
      ( FLY-1PPL ?auto_15974 ?auto_15973 )
      ( FLY-1PPL-VERIFY ?auto_15974 ?auto_15973 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_15995 - PERSON
      ?auto_15994 - CITY
    )
    :vars
    (
      ?auto_15996 - FLEVEL
      ?auto_15998 - FLEVEL
      ?auto_15997 - CITY
      ?auto_15999 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15996 ?auto_15998 ) ( not ( = ?auto_15994 ?auto_15997 ) ) ( not ( = ?auto_15998 ?auto_15996 ) ) ( PERSON-AT ?auto_15995 ?auto_15997 ) ( AIRCRAFT-AT ?auto_15999 ?auto_15994 ) ( FUEL-LEVEL ?auto_15999 ?auto_15998 ) )
    :subtasks
    ( ( !FLY ?auto_15999 ?auto_15994 ?auto_15997 ?auto_15998 ?auto_15996 )
      ( FLY-1PPL ?auto_15995 ?auto_15994 )
      ( FLY-1PPL-VERIFY ?auto_15995 ?auto_15994 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_16016 - PERSON
      ?auto_16015 - CITY
    )
    :vars
    (
      ?auto_16019 - FLEVEL
      ?auto_16020 - FLEVEL
      ?auto_16018 - CITY
      ?auto_16017 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16019 ?auto_16020 ) ( not ( = ?auto_16015 ?auto_16018 ) ) ( not ( = ?auto_16020 ?auto_16019 ) ) ( PERSON-AT ?auto_16016 ?auto_16018 ) ( AIRCRAFT-AT ?auto_16017 ?auto_16015 ) ( FUEL-LEVEL ?auto_16017 ?auto_16019 ) )
    :subtasks
    ( ( !REFUEL ?auto_16017 ?auto_16015 ?auto_16019 ?auto_16020 )
      ( FLY-1PPL ?auto_16016 ?auto_16015 )
      ( FLY-1PPL-VERIFY ?auto_16016 ?auto_16015 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16079 - PERSON
      ?auto_16080 - PERSON
      ?auto_16078 - CITY
    )
    :vars
    (
      ?auto_16081 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_16080 ?auto_16081 ) ( AIRCRAFT-AT ?auto_16081 ?auto_16078 ) ( PERSON-AT ?auto_16079 ?auto_16078 ) ( not ( = ?auto_16079 ?auto_16080 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16080 ?auto_16078 )
      ( FLY-2PPL-VERIFY ?auto_16079 ?auto_16080 ?auto_16078 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16083 - PERSON
      ?auto_16084 - PERSON
      ?auto_16082 - CITY
    )
    :vars
    (
      ?auto_16085 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_16083 ?auto_16085 ) ( AIRCRAFT-AT ?auto_16085 ?auto_16082 ) ( PERSON-AT ?auto_16084 ?auto_16082 ) ( not ( = ?auto_16083 ?auto_16084 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16083 ?auto_16082 )
      ( FLY-2PPL-VERIFY ?auto_16083 ?auto_16084 ?auto_16082 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16091 - PERSON
      ?auto_16092 - PERSON
      ?auto_16093 - PERSON
      ?auto_16090 - CITY
    )
    :vars
    (
      ?auto_16094 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_16093 ?auto_16094 ) ( AIRCRAFT-AT ?auto_16094 ?auto_16090 ) ( PERSON-AT ?auto_16091 ?auto_16090 ) ( PERSON-AT ?auto_16092 ?auto_16090 ) ( not ( = ?auto_16091 ?auto_16092 ) ) ( not ( = ?auto_16091 ?auto_16093 ) ) ( not ( = ?auto_16092 ?auto_16093 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16093 ?auto_16090 )
      ( FLY-3PPL-VERIFY ?auto_16091 ?auto_16092 ?auto_16093 ?auto_16090 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16096 - PERSON
      ?auto_16097 - PERSON
      ?auto_16098 - PERSON
      ?auto_16095 - CITY
    )
    :vars
    (
      ?auto_16099 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_16097 ?auto_16099 ) ( AIRCRAFT-AT ?auto_16099 ?auto_16095 ) ( PERSON-AT ?auto_16096 ?auto_16095 ) ( PERSON-AT ?auto_16098 ?auto_16095 ) ( not ( = ?auto_16096 ?auto_16097 ) ) ( not ( = ?auto_16096 ?auto_16098 ) ) ( not ( = ?auto_16097 ?auto_16098 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16097 ?auto_16095 )
      ( FLY-3PPL-VERIFY ?auto_16096 ?auto_16097 ?auto_16098 ?auto_16095 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16106 - PERSON
      ?auto_16107 - PERSON
      ?auto_16108 - PERSON
      ?auto_16105 - CITY
    )
    :vars
    (
      ?auto_16109 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_16106 ?auto_16109 ) ( AIRCRAFT-AT ?auto_16109 ?auto_16105 ) ( PERSON-AT ?auto_16107 ?auto_16105 ) ( PERSON-AT ?auto_16108 ?auto_16105 ) ( not ( = ?auto_16106 ?auto_16107 ) ) ( not ( = ?auto_16106 ?auto_16108 ) ) ( not ( = ?auto_16107 ?auto_16108 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16106 ?auto_16105 )
      ( FLY-3PPL-VERIFY ?auto_16106 ?auto_16107 ?auto_16108 ?auto_16105 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16132 - PERSON
      ?auto_16133 - PERSON
      ?auto_16131 - CITY
    )
    :vars
    (
      ?auto_16137 - AIRCRAFT
      ?auto_16134 - CITY
      ?auto_16136 - FLEVEL
      ?auto_16135 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_16133 ?auto_16137 ) ( AIRCRAFT-AT ?auto_16137 ?auto_16134 ) ( FUEL-LEVEL ?auto_16137 ?auto_16136 ) ( NEXT ?auto_16135 ?auto_16136 ) ( not ( = ?auto_16131 ?auto_16134 ) ) ( not ( = ?auto_16136 ?auto_16135 ) ) ( PERSON-AT ?auto_16132 ?auto_16131 ) ( not ( = ?auto_16132 ?auto_16133 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16133 ?auto_16131 )
      ( FLY-2PPL-VERIFY ?auto_16132 ?auto_16133 ?auto_16131 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16139 - PERSON
      ?auto_16140 - PERSON
      ?auto_16138 - CITY
    )
    :vars
    (
      ?auto_16141 - AIRCRAFT
      ?auto_16144 - CITY
      ?auto_16143 - FLEVEL
      ?auto_16142 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_16139 ?auto_16141 ) ( AIRCRAFT-AT ?auto_16141 ?auto_16144 ) ( FUEL-LEVEL ?auto_16141 ?auto_16143 ) ( NEXT ?auto_16142 ?auto_16143 ) ( not ( = ?auto_16138 ?auto_16144 ) ) ( not ( = ?auto_16143 ?auto_16142 ) ) ( PERSON-AT ?auto_16140 ?auto_16138 ) ( not ( = ?auto_16140 ?auto_16139 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16140 ?auto_16139 ?auto_16138 )
      ( FLY-2PPL-VERIFY ?auto_16139 ?auto_16140 ?auto_16138 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16154 - PERSON
      ?auto_16155 - PERSON
      ?auto_16156 - PERSON
      ?auto_16153 - CITY
    )
    :vars
    (
      ?auto_16157 - AIRCRAFT
      ?auto_16160 - CITY
      ?auto_16159 - FLEVEL
      ?auto_16158 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_16156 ?auto_16157 ) ( AIRCRAFT-AT ?auto_16157 ?auto_16160 ) ( FUEL-LEVEL ?auto_16157 ?auto_16159 ) ( NEXT ?auto_16158 ?auto_16159 ) ( not ( = ?auto_16153 ?auto_16160 ) ) ( not ( = ?auto_16159 ?auto_16158 ) ) ( PERSON-AT ?auto_16155 ?auto_16153 ) ( not ( = ?auto_16155 ?auto_16156 ) ) ( PERSON-AT ?auto_16154 ?auto_16153 ) ( not ( = ?auto_16154 ?auto_16155 ) ) ( not ( = ?auto_16154 ?auto_16156 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16155 ?auto_16156 ?auto_16153 )
      ( FLY-3PPL-VERIFY ?auto_16154 ?auto_16155 ?auto_16156 ?auto_16153 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16162 - PERSON
      ?auto_16163 - PERSON
      ?auto_16164 - PERSON
      ?auto_16161 - CITY
    )
    :vars
    (
      ?auto_16165 - AIRCRAFT
      ?auto_16168 - CITY
      ?auto_16167 - FLEVEL
      ?auto_16166 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_16163 ?auto_16165 ) ( AIRCRAFT-AT ?auto_16165 ?auto_16168 ) ( FUEL-LEVEL ?auto_16165 ?auto_16167 ) ( NEXT ?auto_16166 ?auto_16167 ) ( not ( = ?auto_16161 ?auto_16168 ) ) ( not ( = ?auto_16167 ?auto_16166 ) ) ( PERSON-AT ?auto_16164 ?auto_16161 ) ( not ( = ?auto_16164 ?auto_16163 ) ) ( PERSON-AT ?auto_16162 ?auto_16161 ) ( not ( = ?auto_16162 ?auto_16163 ) ) ( not ( = ?auto_16162 ?auto_16164 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16164 ?auto_16163 ?auto_16161 )
      ( FLY-3PPL-VERIFY ?auto_16162 ?auto_16163 ?auto_16164 ?auto_16161 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16178 - PERSON
      ?auto_16179 - PERSON
      ?auto_16180 - PERSON
      ?auto_16177 - CITY
    )
    :vars
    (
      ?auto_16181 - AIRCRAFT
      ?auto_16184 - CITY
      ?auto_16183 - FLEVEL
      ?auto_16182 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_16178 ?auto_16181 ) ( AIRCRAFT-AT ?auto_16181 ?auto_16184 ) ( FUEL-LEVEL ?auto_16181 ?auto_16183 ) ( NEXT ?auto_16182 ?auto_16183 ) ( not ( = ?auto_16177 ?auto_16184 ) ) ( not ( = ?auto_16183 ?auto_16182 ) ) ( PERSON-AT ?auto_16179 ?auto_16177 ) ( not ( = ?auto_16179 ?auto_16178 ) ) ( PERSON-AT ?auto_16180 ?auto_16177 ) ( not ( = ?auto_16178 ?auto_16180 ) ) ( not ( = ?auto_16179 ?auto_16180 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16179 ?auto_16178 ?auto_16177 )
      ( FLY-3PPL-VERIFY ?auto_16178 ?auto_16179 ?auto_16180 ?auto_16177 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_16211 - PERSON
      ?auto_16210 - CITY
    )
    :vars
    (
      ?auto_16213 - AIRCRAFT
      ?auto_16216 - CITY
      ?auto_16215 - FLEVEL
      ?auto_16214 - FLEVEL
      ?auto_16212 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_16213 ?auto_16216 ) ( FUEL-LEVEL ?auto_16213 ?auto_16215 ) ( NEXT ?auto_16214 ?auto_16215 ) ( not ( = ?auto_16210 ?auto_16216 ) ) ( not ( = ?auto_16215 ?auto_16214 ) ) ( PERSON-AT ?auto_16212 ?auto_16210 ) ( not ( = ?auto_16212 ?auto_16211 ) ) ( PERSON-AT ?auto_16211 ?auto_16216 ) )
    :subtasks
    ( ( !BOARD ?auto_16211 ?auto_16213 ?auto_16216 )
      ( FLY-2PPL ?auto_16212 ?auto_16211 ?auto_16210 )
      ( FLY-1PPL-VERIFY ?auto_16211 ?auto_16210 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16218 - PERSON
      ?auto_16219 - PERSON
      ?auto_16217 - CITY
    )
    :vars
    (
      ?auto_16221 - AIRCRAFT
      ?auto_16220 - CITY
      ?auto_16222 - FLEVEL
      ?auto_16223 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_16221 ?auto_16220 ) ( FUEL-LEVEL ?auto_16221 ?auto_16222 ) ( NEXT ?auto_16223 ?auto_16222 ) ( not ( = ?auto_16217 ?auto_16220 ) ) ( not ( = ?auto_16222 ?auto_16223 ) ) ( PERSON-AT ?auto_16218 ?auto_16217 ) ( not ( = ?auto_16218 ?auto_16219 ) ) ( PERSON-AT ?auto_16219 ?auto_16220 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16219 ?auto_16217 )
      ( FLY-2PPL-VERIFY ?auto_16218 ?auto_16219 ?auto_16217 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16225 - PERSON
      ?auto_16226 - PERSON
      ?auto_16224 - CITY
    )
    :vars
    (
      ?auto_16227 - AIRCRAFT
      ?auto_16230 - CITY
      ?auto_16229 - FLEVEL
      ?auto_16228 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_16227 ?auto_16230 ) ( FUEL-LEVEL ?auto_16227 ?auto_16229 ) ( NEXT ?auto_16228 ?auto_16229 ) ( not ( = ?auto_16224 ?auto_16230 ) ) ( not ( = ?auto_16229 ?auto_16228 ) ) ( PERSON-AT ?auto_16226 ?auto_16224 ) ( not ( = ?auto_16226 ?auto_16225 ) ) ( PERSON-AT ?auto_16225 ?auto_16230 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16226 ?auto_16225 ?auto_16224 )
      ( FLY-2PPL-VERIFY ?auto_16225 ?auto_16226 ?auto_16224 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16240 - PERSON
      ?auto_16241 - PERSON
      ?auto_16242 - PERSON
      ?auto_16239 - CITY
    )
    :vars
    (
      ?auto_16243 - AIRCRAFT
      ?auto_16246 - CITY
      ?auto_16245 - FLEVEL
      ?auto_16244 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_16243 ?auto_16246 ) ( FUEL-LEVEL ?auto_16243 ?auto_16245 ) ( NEXT ?auto_16244 ?auto_16245 ) ( not ( = ?auto_16239 ?auto_16246 ) ) ( not ( = ?auto_16245 ?auto_16244 ) ) ( PERSON-AT ?auto_16240 ?auto_16239 ) ( not ( = ?auto_16240 ?auto_16242 ) ) ( PERSON-AT ?auto_16242 ?auto_16246 ) ( PERSON-AT ?auto_16241 ?auto_16239 ) ( not ( = ?auto_16240 ?auto_16241 ) ) ( not ( = ?auto_16241 ?auto_16242 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16240 ?auto_16242 ?auto_16239 )
      ( FLY-3PPL-VERIFY ?auto_16240 ?auto_16241 ?auto_16242 ?auto_16239 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16248 - PERSON
      ?auto_16249 - PERSON
      ?auto_16250 - PERSON
      ?auto_16247 - CITY
    )
    :vars
    (
      ?auto_16251 - AIRCRAFT
      ?auto_16254 - CITY
      ?auto_16253 - FLEVEL
      ?auto_16252 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_16251 ?auto_16254 ) ( FUEL-LEVEL ?auto_16251 ?auto_16253 ) ( NEXT ?auto_16252 ?auto_16253 ) ( not ( = ?auto_16247 ?auto_16254 ) ) ( not ( = ?auto_16253 ?auto_16252 ) ) ( PERSON-AT ?auto_16248 ?auto_16247 ) ( not ( = ?auto_16248 ?auto_16249 ) ) ( PERSON-AT ?auto_16249 ?auto_16254 ) ( PERSON-AT ?auto_16250 ?auto_16247 ) ( not ( = ?auto_16248 ?auto_16250 ) ) ( not ( = ?auto_16249 ?auto_16250 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16248 ?auto_16249 ?auto_16247 )
      ( FLY-3PPL-VERIFY ?auto_16248 ?auto_16249 ?auto_16250 ?auto_16247 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16264 - PERSON
      ?auto_16265 - PERSON
      ?auto_16266 - PERSON
      ?auto_16263 - CITY
    )
    :vars
    (
      ?auto_16267 - AIRCRAFT
      ?auto_16270 - CITY
      ?auto_16269 - FLEVEL
      ?auto_16268 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_16267 ?auto_16270 ) ( FUEL-LEVEL ?auto_16267 ?auto_16269 ) ( NEXT ?auto_16268 ?auto_16269 ) ( not ( = ?auto_16263 ?auto_16270 ) ) ( not ( = ?auto_16269 ?auto_16268 ) ) ( PERSON-AT ?auto_16265 ?auto_16263 ) ( not ( = ?auto_16265 ?auto_16264 ) ) ( PERSON-AT ?auto_16264 ?auto_16270 ) ( PERSON-AT ?auto_16266 ?auto_16263 ) ( not ( = ?auto_16264 ?auto_16266 ) ) ( not ( = ?auto_16265 ?auto_16266 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16265 ?auto_16264 ?auto_16263 )
      ( FLY-3PPL-VERIFY ?auto_16264 ?auto_16265 ?auto_16266 ?auto_16263 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_16297 - PERSON
      ?auto_16296 - CITY
    )
    :vars
    (
      ?auto_16298 - AIRCRAFT
      ?auto_16302 - CITY
      ?auto_16299 - FLEVEL
      ?auto_16301 - FLEVEL
      ?auto_16300 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_16298 ?auto_16302 ) ( NEXT ?auto_16299 ?auto_16301 ) ( not ( = ?auto_16296 ?auto_16302 ) ) ( not ( = ?auto_16301 ?auto_16299 ) ) ( PERSON-AT ?auto_16300 ?auto_16296 ) ( not ( = ?auto_16300 ?auto_16297 ) ) ( PERSON-AT ?auto_16297 ?auto_16302 ) ( FUEL-LEVEL ?auto_16298 ?auto_16299 ) )
    :subtasks
    ( ( !REFUEL ?auto_16298 ?auto_16302 ?auto_16299 ?auto_16301 )
      ( FLY-2PPL ?auto_16300 ?auto_16297 ?auto_16296 )
      ( FLY-1PPL-VERIFY ?auto_16297 ?auto_16296 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16304 - PERSON
      ?auto_16305 - PERSON
      ?auto_16303 - CITY
    )
    :vars
    (
      ?auto_16307 - AIRCRAFT
      ?auto_16308 - CITY
      ?auto_16309 - FLEVEL
      ?auto_16306 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_16307 ?auto_16308 ) ( NEXT ?auto_16309 ?auto_16306 ) ( not ( = ?auto_16303 ?auto_16308 ) ) ( not ( = ?auto_16306 ?auto_16309 ) ) ( PERSON-AT ?auto_16304 ?auto_16303 ) ( not ( = ?auto_16304 ?auto_16305 ) ) ( PERSON-AT ?auto_16305 ?auto_16308 ) ( FUEL-LEVEL ?auto_16307 ?auto_16309 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16305 ?auto_16303 )
      ( FLY-2PPL-VERIFY ?auto_16304 ?auto_16305 ?auto_16303 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16311 - PERSON
      ?auto_16312 - PERSON
      ?auto_16310 - CITY
    )
    :vars
    (
      ?auto_16315 - AIRCRAFT
      ?auto_16314 - CITY
      ?auto_16316 - FLEVEL
      ?auto_16313 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_16315 ?auto_16314 ) ( NEXT ?auto_16316 ?auto_16313 ) ( not ( = ?auto_16310 ?auto_16314 ) ) ( not ( = ?auto_16313 ?auto_16316 ) ) ( PERSON-AT ?auto_16312 ?auto_16310 ) ( not ( = ?auto_16312 ?auto_16311 ) ) ( PERSON-AT ?auto_16311 ?auto_16314 ) ( FUEL-LEVEL ?auto_16315 ?auto_16316 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16312 ?auto_16311 ?auto_16310 )
      ( FLY-2PPL-VERIFY ?auto_16311 ?auto_16312 ?auto_16310 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16326 - PERSON
      ?auto_16327 - PERSON
      ?auto_16328 - PERSON
      ?auto_16325 - CITY
    )
    :vars
    (
      ?auto_16331 - AIRCRAFT
      ?auto_16330 - CITY
      ?auto_16332 - FLEVEL
      ?auto_16329 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_16331 ?auto_16330 ) ( NEXT ?auto_16332 ?auto_16329 ) ( not ( = ?auto_16325 ?auto_16330 ) ) ( not ( = ?auto_16329 ?auto_16332 ) ) ( PERSON-AT ?auto_16326 ?auto_16325 ) ( not ( = ?auto_16326 ?auto_16328 ) ) ( PERSON-AT ?auto_16328 ?auto_16330 ) ( FUEL-LEVEL ?auto_16331 ?auto_16332 ) ( PERSON-AT ?auto_16327 ?auto_16325 ) ( not ( = ?auto_16326 ?auto_16327 ) ) ( not ( = ?auto_16327 ?auto_16328 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16326 ?auto_16328 ?auto_16325 )
      ( FLY-3PPL-VERIFY ?auto_16326 ?auto_16327 ?auto_16328 ?auto_16325 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16334 - PERSON
      ?auto_16335 - PERSON
      ?auto_16336 - PERSON
      ?auto_16333 - CITY
    )
    :vars
    (
      ?auto_16339 - AIRCRAFT
      ?auto_16338 - CITY
      ?auto_16340 - FLEVEL
      ?auto_16337 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_16339 ?auto_16338 ) ( NEXT ?auto_16340 ?auto_16337 ) ( not ( = ?auto_16333 ?auto_16338 ) ) ( not ( = ?auto_16337 ?auto_16340 ) ) ( PERSON-AT ?auto_16336 ?auto_16333 ) ( not ( = ?auto_16336 ?auto_16335 ) ) ( PERSON-AT ?auto_16335 ?auto_16338 ) ( FUEL-LEVEL ?auto_16339 ?auto_16340 ) ( PERSON-AT ?auto_16334 ?auto_16333 ) ( not ( = ?auto_16334 ?auto_16335 ) ) ( not ( = ?auto_16334 ?auto_16336 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16336 ?auto_16335 ?auto_16333 )
      ( FLY-3PPL-VERIFY ?auto_16334 ?auto_16335 ?auto_16336 ?auto_16333 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16350 - PERSON
      ?auto_16351 - PERSON
      ?auto_16352 - PERSON
      ?auto_16349 - CITY
    )
    :vars
    (
      ?auto_16355 - AIRCRAFT
      ?auto_16354 - CITY
      ?auto_16356 - FLEVEL
      ?auto_16353 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_16355 ?auto_16354 ) ( NEXT ?auto_16356 ?auto_16353 ) ( not ( = ?auto_16349 ?auto_16354 ) ) ( not ( = ?auto_16353 ?auto_16356 ) ) ( PERSON-AT ?auto_16351 ?auto_16349 ) ( not ( = ?auto_16351 ?auto_16350 ) ) ( PERSON-AT ?auto_16350 ?auto_16354 ) ( FUEL-LEVEL ?auto_16355 ?auto_16356 ) ( PERSON-AT ?auto_16352 ?auto_16349 ) ( not ( = ?auto_16350 ?auto_16352 ) ) ( not ( = ?auto_16351 ?auto_16352 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16351 ?auto_16350 ?auto_16349 )
      ( FLY-3PPL-VERIFY ?auto_16350 ?auto_16351 ?auto_16352 ?auto_16349 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_16383 - PERSON
      ?auto_16382 - CITY
    )
    :vars
    (
      ?auto_16388 - FLEVEL
      ?auto_16384 - FLEVEL
      ?auto_16385 - CITY
      ?auto_16386 - PERSON
      ?auto_16387 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16388 ?auto_16384 ) ( not ( = ?auto_16382 ?auto_16385 ) ) ( not ( = ?auto_16384 ?auto_16388 ) ) ( PERSON-AT ?auto_16386 ?auto_16382 ) ( not ( = ?auto_16386 ?auto_16383 ) ) ( PERSON-AT ?auto_16383 ?auto_16385 ) ( AIRCRAFT-AT ?auto_16387 ?auto_16382 ) ( FUEL-LEVEL ?auto_16387 ?auto_16384 ) )
    :subtasks
    ( ( !FLY ?auto_16387 ?auto_16382 ?auto_16385 ?auto_16384 ?auto_16388 )
      ( FLY-2PPL ?auto_16386 ?auto_16383 ?auto_16382 )
      ( FLY-1PPL-VERIFY ?auto_16383 ?auto_16382 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16390 - PERSON
      ?auto_16391 - PERSON
      ?auto_16389 - CITY
    )
    :vars
    (
      ?auto_16393 - FLEVEL
      ?auto_16394 - FLEVEL
      ?auto_16392 - CITY
      ?auto_16395 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16393 ?auto_16394 ) ( not ( = ?auto_16389 ?auto_16392 ) ) ( not ( = ?auto_16394 ?auto_16393 ) ) ( PERSON-AT ?auto_16390 ?auto_16389 ) ( not ( = ?auto_16390 ?auto_16391 ) ) ( PERSON-AT ?auto_16391 ?auto_16392 ) ( AIRCRAFT-AT ?auto_16395 ?auto_16389 ) ( FUEL-LEVEL ?auto_16395 ?auto_16394 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16391 ?auto_16389 )
      ( FLY-2PPL-VERIFY ?auto_16390 ?auto_16391 ?auto_16389 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16397 - PERSON
      ?auto_16398 - PERSON
      ?auto_16396 - CITY
    )
    :vars
    (
      ?auto_16399 - FLEVEL
      ?auto_16401 - FLEVEL
      ?auto_16400 - CITY
      ?auto_16402 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16399 ?auto_16401 ) ( not ( = ?auto_16396 ?auto_16400 ) ) ( not ( = ?auto_16401 ?auto_16399 ) ) ( PERSON-AT ?auto_16398 ?auto_16396 ) ( not ( = ?auto_16398 ?auto_16397 ) ) ( PERSON-AT ?auto_16397 ?auto_16400 ) ( AIRCRAFT-AT ?auto_16402 ?auto_16396 ) ( FUEL-LEVEL ?auto_16402 ?auto_16401 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16398 ?auto_16397 ?auto_16396 )
      ( FLY-2PPL-VERIFY ?auto_16397 ?auto_16398 ?auto_16396 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16412 - PERSON
      ?auto_16413 - PERSON
      ?auto_16414 - PERSON
      ?auto_16411 - CITY
    )
    :vars
    (
      ?auto_16415 - FLEVEL
      ?auto_16417 - FLEVEL
      ?auto_16416 - CITY
      ?auto_16418 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16415 ?auto_16417 ) ( not ( = ?auto_16411 ?auto_16416 ) ) ( not ( = ?auto_16417 ?auto_16415 ) ) ( PERSON-AT ?auto_16412 ?auto_16411 ) ( not ( = ?auto_16412 ?auto_16414 ) ) ( PERSON-AT ?auto_16414 ?auto_16416 ) ( AIRCRAFT-AT ?auto_16418 ?auto_16411 ) ( FUEL-LEVEL ?auto_16418 ?auto_16417 ) ( PERSON-AT ?auto_16413 ?auto_16411 ) ( not ( = ?auto_16412 ?auto_16413 ) ) ( not ( = ?auto_16413 ?auto_16414 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16412 ?auto_16414 ?auto_16411 )
      ( FLY-3PPL-VERIFY ?auto_16412 ?auto_16413 ?auto_16414 ?auto_16411 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16420 - PERSON
      ?auto_16421 - PERSON
      ?auto_16422 - PERSON
      ?auto_16419 - CITY
    )
    :vars
    (
      ?auto_16423 - FLEVEL
      ?auto_16425 - FLEVEL
      ?auto_16424 - CITY
      ?auto_16426 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16423 ?auto_16425 ) ( not ( = ?auto_16419 ?auto_16424 ) ) ( not ( = ?auto_16425 ?auto_16423 ) ) ( PERSON-AT ?auto_16420 ?auto_16419 ) ( not ( = ?auto_16420 ?auto_16421 ) ) ( PERSON-AT ?auto_16421 ?auto_16424 ) ( AIRCRAFT-AT ?auto_16426 ?auto_16419 ) ( FUEL-LEVEL ?auto_16426 ?auto_16425 ) ( PERSON-AT ?auto_16422 ?auto_16419 ) ( not ( = ?auto_16420 ?auto_16422 ) ) ( not ( = ?auto_16421 ?auto_16422 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16420 ?auto_16421 ?auto_16419 )
      ( FLY-3PPL-VERIFY ?auto_16420 ?auto_16421 ?auto_16422 ?auto_16419 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16436 - PERSON
      ?auto_16437 - PERSON
      ?auto_16438 - PERSON
      ?auto_16435 - CITY
    )
    :vars
    (
      ?auto_16439 - FLEVEL
      ?auto_16441 - FLEVEL
      ?auto_16440 - CITY
      ?auto_16442 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16439 ?auto_16441 ) ( not ( = ?auto_16435 ?auto_16440 ) ) ( not ( = ?auto_16441 ?auto_16439 ) ) ( PERSON-AT ?auto_16438 ?auto_16435 ) ( not ( = ?auto_16438 ?auto_16436 ) ) ( PERSON-AT ?auto_16436 ?auto_16440 ) ( AIRCRAFT-AT ?auto_16442 ?auto_16435 ) ( FUEL-LEVEL ?auto_16442 ?auto_16441 ) ( PERSON-AT ?auto_16437 ?auto_16435 ) ( not ( = ?auto_16436 ?auto_16437 ) ) ( not ( = ?auto_16437 ?auto_16438 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16438 ?auto_16436 ?auto_16435 )
      ( FLY-3PPL-VERIFY ?auto_16436 ?auto_16437 ?auto_16438 ?auto_16435 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_16469 - PERSON
      ?auto_16468 - CITY
    )
    :vars
    (
      ?auto_16470 - FLEVEL
      ?auto_16473 - FLEVEL
      ?auto_16472 - CITY
      ?auto_16471 - PERSON
      ?auto_16474 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16470 ?auto_16473 ) ( not ( = ?auto_16468 ?auto_16472 ) ) ( not ( = ?auto_16473 ?auto_16470 ) ) ( PERSON-AT ?auto_16471 ?auto_16468 ) ( not ( = ?auto_16471 ?auto_16469 ) ) ( PERSON-AT ?auto_16469 ?auto_16472 ) ( AIRCRAFT-AT ?auto_16474 ?auto_16468 ) ( FUEL-LEVEL ?auto_16474 ?auto_16470 ) )
    :subtasks
    ( ( !REFUEL ?auto_16474 ?auto_16468 ?auto_16470 ?auto_16473 )
      ( FLY-2PPL ?auto_16471 ?auto_16469 ?auto_16468 )
      ( FLY-1PPL-VERIFY ?auto_16469 ?auto_16468 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16476 - PERSON
      ?auto_16477 - PERSON
      ?auto_16475 - CITY
    )
    :vars
    (
      ?auto_16481 - FLEVEL
      ?auto_16480 - FLEVEL
      ?auto_16479 - CITY
      ?auto_16478 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16481 ?auto_16480 ) ( not ( = ?auto_16475 ?auto_16479 ) ) ( not ( = ?auto_16480 ?auto_16481 ) ) ( PERSON-AT ?auto_16476 ?auto_16475 ) ( not ( = ?auto_16476 ?auto_16477 ) ) ( PERSON-AT ?auto_16477 ?auto_16479 ) ( AIRCRAFT-AT ?auto_16478 ?auto_16475 ) ( FUEL-LEVEL ?auto_16478 ?auto_16481 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16477 ?auto_16475 )
      ( FLY-2PPL-VERIFY ?auto_16476 ?auto_16477 ?auto_16475 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16483 - PERSON
      ?auto_16484 - PERSON
      ?auto_16482 - CITY
    )
    :vars
    (
      ?auto_16485 - FLEVEL
      ?auto_16488 - FLEVEL
      ?auto_16487 - CITY
      ?auto_16486 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16485 ?auto_16488 ) ( not ( = ?auto_16482 ?auto_16487 ) ) ( not ( = ?auto_16488 ?auto_16485 ) ) ( PERSON-AT ?auto_16484 ?auto_16482 ) ( not ( = ?auto_16484 ?auto_16483 ) ) ( PERSON-AT ?auto_16483 ?auto_16487 ) ( AIRCRAFT-AT ?auto_16486 ?auto_16482 ) ( FUEL-LEVEL ?auto_16486 ?auto_16485 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16484 ?auto_16483 ?auto_16482 )
      ( FLY-2PPL-VERIFY ?auto_16483 ?auto_16484 ?auto_16482 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16498 - PERSON
      ?auto_16499 - PERSON
      ?auto_16500 - PERSON
      ?auto_16497 - CITY
    )
    :vars
    (
      ?auto_16501 - FLEVEL
      ?auto_16504 - FLEVEL
      ?auto_16503 - CITY
      ?auto_16502 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16501 ?auto_16504 ) ( not ( = ?auto_16497 ?auto_16503 ) ) ( not ( = ?auto_16504 ?auto_16501 ) ) ( PERSON-AT ?auto_16498 ?auto_16497 ) ( not ( = ?auto_16498 ?auto_16500 ) ) ( PERSON-AT ?auto_16500 ?auto_16503 ) ( AIRCRAFT-AT ?auto_16502 ?auto_16497 ) ( FUEL-LEVEL ?auto_16502 ?auto_16501 ) ( PERSON-AT ?auto_16499 ?auto_16497 ) ( not ( = ?auto_16498 ?auto_16499 ) ) ( not ( = ?auto_16499 ?auto_16500 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16498 ?auto_16500 ?auto_16497 )
      ( FLY-3PPL-VERIFY ?auto_16498 ?auto_16499 ?auto_16500 ?auto_16497 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16506 - PERSON
      ?auto_16507 - PERSON
      ?auto_16508 - PERSON
      ?auto_16505 - CITY
    )
    :vars
    (
      ?auto_16509 - FLEVEL
      ?auto_16512 - FLEVEL
      ?auto_16511 - CITY
      ?auto_16510 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16509 ?auto_16512 ) ( not ( = ?auto_16505 ?auto_16511 ) ) ( not ( = ?auto_16512 ?auto_16509 ) ) ( PERSON-AT ?auto_16508 ?auto_16505 ) ( not ( = ?auto_16508 ?auto_16507 ) ) ( PERSON-AT ?auto_16507 ?auto_16511 ) ( AIRCRAFT-AT ?auto_16510 ?auto_16505 ) ( FUEL-LEVEL ?auto_16510 ?auto_16509 ) ( PERSON-AT ?auto_16506 ?auto_16505 ) ( not ( = ?auto_16506 ?auto_16507 ) ) ( not ( = ?auto_16506 ?auto_16508 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16508 ?auto_16507 ?auto_16505 )
      ( FLY-3PPL-VERIFY ?auto_16506 ?auto_16507 ?auto_16508 ?auto_16505 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16522 - PERSON
      ?auto_16523 - PERSON
      ?auto_16524 - PERSON
      ?auto_16521 - CITY
    )
    :vars
    (
      ?auto_16525 - FLEVEL
      ?auto_16528 - FLEVEL
      ?auto_16527 - CITY
      ?auto_16526 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16525 ?auto_16528 ) ( not ( = ?auto_16521 ?auto_16527 ) ) ( not ( = ?auto_16528 ?auto_16525 ) ) ( PERSON-AT ?auto_16523 ?auto_16521 ) ( not ( = ?auto_16523 ?auto_16522 ) ) ( PERSON-AT ?auto_16522 ?auto_16527 ) ( AIRCRAFT-AT ?auto_16526 ?auto_16521 ) ( FUEL-LEVEL ?auto_16526 ?auto_16525 ) ( PERSON-AT ?auto_16524 ?auto_16521 ) ( not ( = ?auto_16522 ?auto_16524 ) ) ( not ( = ?auto_16523 ?auto_16524 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16523 ?auto_16522 ?auto_16521 )
      ( FLY-3PPL-VERIFY ?auto_16522 ?auto_16523 ?auto_16524 ?auto_16521 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_16555 - PERSON
      ?auto_16554 - CITY
    )
    :vars
    (
      ?auto_16556 - FLEVEL
      ?auto_16559 - FLEVEL
      ?auto_16558 - CITY
      ?auto_16560 - PERSON
      ?auto_16557 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16556 ?auto_16559 ) ( not ( = ?auto_16554 ?auto_16558 ) ) ( not ( = ?auto_16559 ?auto_16556 ) ) ( not ( = ?auto_16560 ?auto_16555 ) ) ( PERSON-AT ?auto_16555 ?auto_16558 ) ( AIRCRAFT-AT ?auto_16557 ?auto_16554 ) ( FUEL-LEVEL ?auto_16557 ?auto_16556 ) ( IN ?auto_16560 ?auto_16557 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16560 ?auto_16554 )
      ( FLY-2PPL ?auto_16560 ?auto_16555 ?auto_16554 )
      ( FLY-1PPL-VERIFY ?auto_16555 ?auto_16554 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16562 - PERSON
      ?auto_16563 - PERSON
      ?auto_16561 - CITY
    )
    :vars
    (
      ?auto_16567 - FLEVEL
      ?auto_16564 - FLEVEL
      ?auto_16566 - CITY
      ?auto_16565 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16567 ?auto_16564 ) ( not ( = ?auto_16561 ?auto_16566 ) ) ( not ( = ?auto_16564 ?auto_16567 ) ) ( not ( = ?auto_16562 ?auto_16563 ) ) ( PERSON-AT ?auto_16563 ?auto_16566 ) ( AIRCRAFT-AT ?auto_16565 ?auto_16561 ) ( FUEL-LEVEL ?auto_16565 ?auto_16567 ) ( IN ?auto_16562 ?auto_16565 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16563 ?auto_16561 )
      ( FLY-2PPL-VERIFY ?auto_16562 ?auto_16563 ?auto_16561 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16569 - PERSON
      ?auto_16570 - PERSON
      ?auto_16568 - CITY
    )
    :vars
    (
      ?auto_16574 - FLEVEL
      ?auto_16572 - FLEVEL
      ?auto_16571 - CITY
      ?auto_16573 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16574 ?auto_16572 ) ( not ( = ?auto_16568 ?auto_16571 ) ) ( not ( = ?auto_16572 ?auto_16574 ) ) ( not ( = ?auto_16570 ?auto_16569 ) ) ( PERSON-AT ?auto_16569 ?auto_16571 ) ( AIRCRAFT-AT ?auto_16573 ?auto_16568 ) ( FUEL-LEVEL ?auto_16573 ?auto_16574 ) ( IN ?auto_16570 ?auto_16573 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16570 ?auto_16569 ?auto_16568 )
      ( FLY-2PPL-VERIFY ?auto_16569 ?auto_16570 ?auto_16568 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_16641 - PERSON
      ?auto_16640 - CITY
    )
    :vars
    (
      ?auto_16646 - FLEVEL
      ?auto_16644 - FLEVEL
      ?auto_16643 - CITY
      ?auto_16642 - PERSON
      ?auto_16645 - AIRCRAFT
      ?auto_16647 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16646 ?auto_16644 ) ( not ( = ?auto_16640 ?auto_16643 ) ) ( not ( = ?auto_16644 ?auto_16646 ) ) ( not ( = ?auto_16642 ?auto_16641 ) ) ( PERSON-AT ?auto_16641 ?auto_16643 ) ( IN ?auto_16642 ?auto_16645 ) ( AIRCRAFT-AT ?auto_16645 ?auto_16647 ) ( FUEL-LEVEL ?auto_16645 ?auto_16644 ) ( not ( = ?auto_16640 ?auto_16647 ) ) ( not ( = ?auto_16643 ?auto_16647 ) ) )
    :subtasks
    ( ( !FLY ?auto_16645 ?auto_16647 ?auto_16640 ?auto_16644 ?auto_16646 )
      ( FLY-2PPL ?auto_16642 ?auto_16641 ?auto_16640 )
      ( FLY-1PPL-VERIFY ?auto_16641 ?auto_16640 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16649 - PERSON
      ?auto_16650 - PERSON
      ?auto_16648 - CITY
    )
    :vars
    (
      ?auto_16654 - FLEVEL
      ?auto_16655 - FLEVEL
      ?auto_16653 - CITY
      ?auto_16651 - AIRCRAFT
      ?auto_16652 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16654 ?auto_16655 ) ( not ( = ?auto_16648 ?auto_16653 ) ) ( not ( = ?auto_16655 ?auto_16654 ) ) ( not ( = ?auto_16649 ?auto_16650 ) ) ( PERSON-AT ?auto_16650 ?auto_16653 ) ( IN ?auto_16649 ?auto_16651 ) ( AIRCRAFT-AT ?auto_16651 ?auto_16652 ) ( FUEL-LEVEL ?auto_16651 ?auto_16655 ) ( not ( = ?auto_16648 ?auto_16652 ) ) ( not ( = ?auto_16653 ?auto_16652 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16650 ?auto_16648 )
      ( FLY-2PPL-VERIFY ?auto_16649 ?auto_16650 ?auto_16648 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16657 - PERSON
      ?auto_16658 - PERSON
      ?auto_16656 - CITY
    )
    :vars
    (
      ?auto_16660 - FLEVEL
      ?auto_16663 - FLEVEL
      ?auto_16661 - CITY
      ?auto_16659 - AIRCRAFT
      ?auto_16662 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16660 ?auto_16663 ) ( not ( = ?auto_16656 ?auto_16661 ) ) ( not ( = ?auto_16663 ?auto_16660 ) ) ( not ( = ?auto_16658 ?auto_16657 ) ) ( PERSON-AT ?auto_16657 ?auto_16661 ) ( IN ?auto_16658 ?auto_16659 ) ( AIRCRAFT-AT ?auto_16659 ?auto_16662 ) ( FUEL-LEVEL ?auto_16659 ?auto_16663 ) ( not ( = ?auto_16656 ?auto_16662 ) ) ( not ( = ?auto_16661 ?auto_16662 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16658 ?auto_16657 ?auto_16656 )
      ( FLY-2PPL-VERIFY ?auto_16657 ?auto_16658 ?auto_16656 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_16738 - PERSON
      ?auto_16737 - CITY
    )
    :vars
    (
      ?auto_16740 - FLEVEL
      ?auto_16744 - FLEVEL
      ?auto_16742 - CITY
      ?auto_16741 - PERSON
      ?auto_16739 - AIRCRAFT
      ?auto_16743 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16740 ?auto_16744 ) ( not ( = ?auto_16737 ?auto_16742 ) ) ( not ( = ?auto_16744 ?auto_16740 ) ) ( not ( = ?auto_16741 ?auto_16738 ) ) ( PERSON-AT ?auto_16738 ?auto_16742 ) ( AIRCRAFT-AT ?auto_16739 ?auto_16743 ) ( FUEL-LEVEL ?auto_16739 ?auto_16744 ) ( not ( = ?auto_16737 ?auto_16743 ) ) ( not ( = ?auto_16742 ?auto_16743 ) ) ( PERSON-AT ?auto_16741 ?auto_16743 ) )
    :subtasks
    ( ( !BOARD ?auto_16741 ?auto_16739 ?auto_16743 )
      ( FLY-2PPL ?auto_16741 ?auto_16738 ?auto_16737 )
      ( FLY-1PPL-VERIFY ?auto_16738 ?auto_16737 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16746 - PERSON
      ?auto_16747 - PERSON
      ?auto_16745 - CITY
    )
    :vars
    (
      ?auto_16748 - FLEVEL
      ?auto_16751 - FLEVEL
      ?auto_16752 - CITY
      ?auto_16750 - AIRCRAFT
      ?auto_16749 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16748 ?auto_16751 ) ( not ( = ?auto_16745 ?auto_16752 ) ) ( not ( = ?auto_16751 ?auto_16748 ) ) ( not ( = ?auto_16746 ?auto_16747 ) ) ( PERSON-AT ?auto_16747 ?auto_16752 ) ( AIRCRAFT-AT ?auto_16750 ?auto_16749 ) ( FUEL-LEVEL ?auto_16750 ?auto_16751 ) ( not ( = ?auto_16745 ?auto_16749 ) ) ( not ( = ?auto_16752 ?auto_16749 ) ) ( PERSON-AT ?auto_16746 ?auto_16749 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16747 ?auto_16745 )
      ( FLY-2PPL-VERIFY ?auto_16746 ?auto_16747 ?auto_16745 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16754 - PERSON
      ?auto_16755 - PERSON
      ?auto_16753 - CITY
    )
    :vars
    (
      ?auto_16760 - FLEVEL
      ?auto_16758 - FLEVEL
      ?auto_16756 - CITY
      ?auto_16757 - AIRCRAFT
      ?auto_16759 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16760 ?auto_16758 ) ( not ( = ?auto_16753 ?auto_16756 ) ) ( not ( = ?auto_16758 ?auto_16760 ) ) ( not ( = ?auto_16755 ?auto_16754 ) ) ( PERSON-AT ?auto_16754 ?auto_16756 ) ( AIRCRAFT-AT ?auto_16757 ?auto_16759 ) ( FUEL-LEVEL ?auto_16757 ?auto_16758 ) ( not ( = ?auto_16753 ?auto_16759 ) ) ( not ( = ?auto_16756 ?auto_16759 ) ) ( PERSON-AT ?auto_16755 ?auto_16759 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16755 ?auto_16754 ?auto_16753 )
      ( FLY-2PPL-VERIFY ?auto_16754 ?auto_16755 ?auto_16753 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_16835 - PERSON
      ?auto_16834 - CITY
    )
    :vars
    (
      ?auto_16841 - FLEVEL
      ?auto_16839 - FLEVEL
      ?auto_16836 - CITY
      ?auto_16838 - PERSON
      ?auto_16837 - AIRCRAFT
      ?auto_16840 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16841 ?auto_16839 ) ( not ( = ?auto_16834 ?auto_16836 ) ) ( not ( = ?auto_16839 ?auto_16841 ) ) ( not ( = ?auto_16838 ?auto_16835 ) ) ( PERSON-AT ?auto_16835 ?auto_16836 ) ( AIRCRAFT-AT ?auto_16837 ?auto_16840 ) ( not ( = ?auto_16834 ?auto_16840 ) ) ( not ( = ?auto_16836 ?auto_16840 ) ) ( PERSON-AT ?auto_16838 ?auto_16840 ) ( FUEL-LEVEL ?auto_16837 ?auto_16841 ) )
    :subtasks
    ( ( !REFUEL ?auto_16837 ?auto_16840 ?auto_16841 ?auto_16839 )
      ( FLY-2PPL ?auto_16838 ?auto_16835 ?auto_16834 )
      ( FLY-1PPL-VERIFY ?auto_16835 ?auto_16834 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16843 - PERSON
      ?auto_16844 - PERSON
      ?auto_16842 - CITY
    )
    :vars
    (
      ?auto_16848 - FLEVEL
      ?auto_16846 - FLEVEL
      ?auto_16847 - CITY
      ?auto_16845 - AIRCRAFT
      ?auto_16849 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16848 ?auto_16846 ) ( not ( = ?auto_16842 ?auto_16847 ) ) ( not ( = ?auto_16846 ?auto_16848 ) ) ( not ( = ?auto_16843 ?auto_16844 ) ) ( PERSON-AT ?auto_16844 ?auto_16847 ) ( AIRCRAFT-AT ?auto_16845 ?auto_16849 ) ( not ( = ?auto_16842 ?auto_16849 ) ) ( not ( = ?auto_16847 ?auto_16849 ) ) ( PERSON-AT ?auto_16843 ?auto_16849 ) ( FUEL-LEVEL ?auto_16845 ?auto_16848 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16844 ?auto_16842 )
      ( FLY-2PPL-VERIFY ?auto_16843 ?auto_16844 ?auto_16842 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16851 - PERSON
      ?auto_16852 - PERSON
      ?auto_16850 - CITY
    )
    :vars
    (
      ?auto_16856 - FLEVEL
      ?auto_16853 - FLEVEL
      ?auto_16855 - CITY
      ?auto_16854 - AIRCRAFT
      ?auto_16857 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16856 ?auto_16853 ) ( not ( = ?auto_16850 ?auto_16855 ) ) ( not ( = ?auto_16853 ?auto_16856 ) ) ( not ( = ?auto_16852 ?auto_16851 ) ) ( PERSON-AT ?auto_16851 ?auto_16855 ) ( AIRCRAFT-AT ?auto_16854 ?auto_16857 ) ( not ( = ?auto_16850 ?auto_16857 ) ) ( not ( = ?auto_16855 ?auto_16857 ) ) ( PERSON-AT ?auto_16852 ?auto_16857 ) ( FUEL-LEVEL ?auto_16854 ?auto_16856 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16852 ?auto_16851 ?auto_16850 )
      ( FLY-2PPL-VERIFY ?auto_16851 ?auto_16852 ?auto_16850 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17363 - PERSON
      ?auto_17364 - PERSON
      ?auto_17365 - PERSON
      ?auto_17362 - CITY
    )
    :vars
    (
      ?auto_17366 - AIRCRAFT
      ?auto_17370 - CITY
      ?auto_17369 - FLEVEL
      ?auto_17367 - FLEVEL
      ?auto_17368 - PERSON
    )
    :precondition
    ( and ( IN ?auto_17365 ?auto_17366 ) ( AIRCRAFT-AT ?auto_17366 ?auto_17370 ) ( FUEL-LEVEL ?auto_17366 ?auto_17369 ) ( NEXT ?auto_17367 ?auto_17369 ) ( not ( = ?auto_17362 ?auto_17370 ) ) ( not ( = ?auto_17369 ?auto_17367 ) ) ( PERSON-AT ?auto_17368 ?auto_17362 ) ( not ( = ?auto_17368 ?auto_17365 ) ) ( PERSON-AT ?auto_17363 ?auto_17362 ) ( PERSON-AT ?auto_17364 ?auto_17362 ) ( not ( = ?auto_17363 ?auto_17364 ) ) ( not ( = ?auto_17363 ?auto_17365 ) ) ( not ( = ?auto_17363 ?auto_17368 ) ) ( not ( = ?auto_17364 ?auto_17365 ) ) ( not ( = ?auto_17364 ?auto_17368 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17368 ?auto_17365 ?auto_17362 )
      ( FLY-3PPL-VERIFY ?auto_17363 ?auto_17364 ?auto_17365 ?auto_17362 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17376 - PERSON
      ?auto_17377 - PERSON
      ?auto_17378 - PERSON
      ?auto_17375 - CITY
    )
    :vars
    (
      ?auto_17379 - AIRCRAFT
      ?auto_17383 - CITY
      ?auto_17382 - FLEVEL
      ?auto_17380 - FLEVEL
      ?auto_17381 - PERSON
    )
    :precondition
    ( and ( IN ?auto_17377 ?auto_17379 ) ( AIRCRAFT-AT ?auto_17379 ?auto_17383 ) ( FUEL-LEVEL ?auto_17379 ?auto_17382 ) ( NEXT ?auto_17380 ?auto_17382 ) ( not ( = ?auto_17375 ?auto_17383 ) ) ( not ( = ?auto_17382 ?auto_17380 ) ) ( PERSON-AT ?auto_17381 ?auto_17375 ) ( not ( = ?auto_17381 ?auto_17377 ) ) ( PERSON-AT ?auto_17376 ?auto_17375 ) ( PERSON-AT ?auto_17378 ?auto_17375 ) ( not ( = ?auto_17376 ?auto_17377 ) ) ( not ( = ?auto_17376 ?auto_17378 ) ) ( not ( = ?auto_17376 ?auto_17381 ) ) ( not ( = ?auto_17377 ?auto_17378 ) ) ( not ( = ?auto_17378 ?auto_17381 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17381 ?auto_17377 ?auto_17375 )
      ( FLY-3PPL-VERIFY ?auto_17376 ?auto_17377 ?auto_17378 ?auto_17375 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17394 - PERSON
      ?auto_17395 - PERSON
      ?auto_17396 - PERSON
      ?auto_17393 - CITY
    )
    :vars
    (
      ?auto_17397 - AIRCRAFT
      ?auto_17400 - CITY
      ?auto_17399 - FLEVEL
      ?auto_17398 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_17394 ?auto_17397 ) ( AIRCRAFT-AT ?auto_17397 ?auto_17400 ) ( FUEL-LEVEL ?auto_17397 ?auto_17399 ) ( NEXT ?auto_17398 ?auto_17399 ) ( not ( = ?auto_17393 ?auto_17400 ) ) ( not ( = ?auto_17399 ?auto_17398 ) ) ( PERSON-AT ?auto_17396 ?auto_17393 ) ( not ( = ?auto_17396 ?auto_17394 ) ) ( PERSON-AT ?auto_17395 ?auto_17393 ) ( not ( = ?auto_17394 ?auto_17395 ) ) ( not ( = ?auto_17395 ?auto_17396 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17396 ?auto_17394 ?auto_17393 )
      ( FLY-3PPL-VERIFY ?auto_17394 ?auto_17395 ?auto_17396 ?auto_17393 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17418 - PERSON
      ?auto_17419 - PERSON
      ?auto_17420 - PERSON
      ?auto_17417 - CITY
    )
    :vars
    (
      ?auto_17421 - AIRCRAFT
      ?auto_17425 - CITY
      ?auto_17424 - FLEVEL
      ?auto_17422 - FLEVEL
      ?auto_17423 - PERSON
    )
    :precondition
    ( and ( IN ?auto_17418 ?auto_17421 ) ( AIRCRAFT-AT ?auto_17421 ?auto_17425 ) ( FUEL-LEVEL ?auto_17421 ?auto_17424 ) ( NEXT ?auto_17422 ?auto_17424 ) ( not ( = ?auto_17417 ?auto_17425 ) ) ( not ( = ?auto_17424 ?auto_17422 ) ) ( PERSON-AT ?auto_17423 ?auto_17417 ) ( not ( = ?auto_17423 ?auto_17418 ) ) ( PERSON-AT ?auto_17419 ?auto_17417 ) ( PERSON-AT ?auto_17420 ?auto_17417 ) ( not ( = ?auto_17418 ?auto_17419 ) ) ( not ( = ?auto_17418 ?auto_17420 ) ) ( not ( = ?auto_17419 ?auto_17420 ) ) ( not ( = ?auto_17419 ?auto_17423 ) ) ( not ( = ?auto_17420 ?auto_17423 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17423 ?auto_17418 ?auto_17417 )
      ( FLY-3PPL-VERIFY ?auto_17418 ?auto_17419 ?auto_17420 ?auto_17417 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17497 - PERSON
      ?auto_17498 - PERSON
      ?auto_17499 - PERSON
      ?auto_17496 - CITY
    )
    :vars
    (
      ?auto_17502 - AIRCRAFT
      ?auto_17503 - CITY
      ?auto_17500 - FLEVEL
      ?auto_17501 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_17502 ?auto_17503 ) ( FUEL-LEVEL ?auto_17502 ?auto_17500 ) ( NEXT ?auto_17501 ?auto_17500 ) ( not ( = ?auto_17496 ?auto_17503 ) ) ( not ( = ?auto_17500 ?auto_17501 ) ) ( PERSON-AT ?auto_17498 ?auto_17496 ) ( not ( = ?auto_17498 ?auto_17499 ) ) ( PERSON-AT ?auto_17499 ?auto_17503 ) ( PERSON-AT ?auto_17497 ?auto_17496 ) ( not ( = ?auto_17497 ?auto_17498 ) ) ( not ( = ?auto_17497 ?auto_17499 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17498 ?auto_17499 ?auto_17496 )
      ( FLY-3PPL-VERIFY ?auto_17497 ?auto_17498 ?auto_17499 ?auto_17496 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17533 - PERSON
      ?auto_17534 - PERSON
      ?auto_17535 - PERSON
      ?auto_17532 - CITY
    )
    :vars
    (
      ?auto_17539 - AIRCRAFT
      ?auto_17540 - CITY
      ?auto_17537 - FLEVEL
      ?auto_17538 - FLEVEL
      ?auto_17536 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_17539 ?auto_17540 ) ( FUEL-LEVEL ?auto_17539 ?auto_17537 ) ( NEXT ?auto_17538 ?auto_17537 ) ( not ( = ?auto_17532 ?auto_17540 ) ) ( not ( = ?auto_17537 ?auto_17538 ) ) ( PERSON-AT ?auto_17536 ?auto_17532 ) ( not ( = ?auto_17536 ?auto_17535 ) ) ( PERSON-AT ?auto_17535 ?auto_17540 ) ( PERSON-AT ?auto_17533 ?auto_17532 ) ( PERSON-AT ?auto_17534 ?auto_17532 ) ( not ( = ?auto_17533 ?auto_17534 ) ) ( not ( = ?auto_17533 ?auto_17535 ) ) ( not ( = ?auto_17533 ?auto_17536 ) ) ( not ( = ?auto_17534 ?auto_17535 ) ) ( not ( = ?auto_17534 ?auto_17536 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17536 ?auto_17535 ?auto_17532 )
      ( FLY-3PPL-VERIFY ?auto_17533 ?auto_17534 ?auto_17535 ?auto_17532 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17546 - PERSON
      ?auto_17547 - PERSON
      ?auto_17548 - PERSON
      ?auto_17545 - CITY
    )
    :vars
    (
      ?auto_17552 - AIRCRAFT
      ?auto_17553 - CITY
      ?auto_17550 - FLEVEL
      ?auto_17551 - FLEVEL
      ?auto_17549 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_17552 ?auto_17553 ) ( FUEL-LEVEL ?auto_17552 ?auto_17550 ) ( NEXT ?auto_17551 ?auto_17550 ) ( not ( = ?auto_17545 ?auto_17553 ) ) ( not ( = ?auto_17550 ?auto_17551 ) ) ( PERSON-AT ?auto_17549 ?auto_17545 ) ( not ( = ?auto_17549 ?auto_17547 ) ) ( PERSON-AT ?auto_17547 ?auto_17553 ) ( PERSON-AT ?auto_17546 ?auto_17545 ) ( PERSON-AT ?auto_17548 ?auto_17545 ) ( not ( = ?auto_17546 ?auto_17547 ) ) ( not ( = ?auto_17546 ?auto_17548 ) ) ( not ( = ?auto_17546 ?auto_17549 ) ) ( not ( = ?auto_17547 ?auto_17548 ) ) ( not ( = ?auto_17548 ?auto_17549 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17549 ?auto_17547 ?auto_17545 )
      ( FLY-3PPL-VERIFY ?auto_17546 ?auto_17547 ?auto_17548 ?auto_17545 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17564 - PERSON
      ?auto_17565 - PERSON
      ?auto_17566 - PERSON
      ?auto_17563 - CITY
    )
    :vars
    (
      ?auto_17569 - AIRCRAFT
      ?auto_17570 - CITY
      ?auto_17567 - FLEVEL
      ?auto_17568 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_17569 ?auto_17570 ) ( FUEL-LEVEL ?auto_17569 ?auto_17567 ) ( NEXT ?auto_17568 ?auto_17567 ) ( not ( = ?auto_17563 ?auto_17570 ) ) ( not ( = ?auto_17567 ?auto_17568 ) ) ( PERSON-AT ?auto_17566 ?auto_17563 ) ( not ( = ?auto_17566 ?auto_17564 ) ) ( PERSON-AT ?auto_17564 ?auto_17570 ) ( PERSON-AT ?auto_17565 ?auto_17563 ) ( not ( = ?auto_17564 ?auto_17565 ) ) ( not ( = ?auto_17565 ?auto_17566 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17566 ?auto_17564 ?auto_17563 )
      ( FLY-3PPL-VERIFY ?auto_17564 ?auto_17565 ?auto_17566 ?auto_17563 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17588 - PERSON
      ?auto_17589 - PERSON
      ?auto_17590 - PERSON
      ?auto_17587 - CITY
    )
    :vars
    (
      ?auto_17594 - AIRCRAFT
      ?auto_17595 - CITY
      ?auto_17592 - FLEVEL
      ?auto_17593 - FLEVEL
      ?auto_17591 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_17594 ?auto_17595 ) ( FUEL-LEVEL ?auto_17594 ?auto_17592 ) ( NEXT ?auto_17593 ?auto_17592 ) ( not ( = ?auto_17587 ?auto_17595 ) ) ( not ( = ?auto_17592 ?auto_17593 ) ) ( PERSON-AT ?auto_17591 ?auto_17587 ) ( not ( = ?auto_17591 ?auto_17588 ) ) ( PERSON-AT ?auto_17588 ?auto_17595 ) ( PERSON-AT ?auto_17589 ?auto_17587 ) ( PERSON-AT ?auto_17590 ?auto_17587 ) ( not ( = ?auto_17588 ?auto_17589 ) ) ( not ( = ?auto_17588 ?auto_17590 ) ) ( not ( = ?auto_17589 ?auto_17590 ) ) ( not ( = ?auto_17589 ?auto_17591 ) ) ( not ( = ?auto_17590 ?auto_17591 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17591 ?auto_17588 ?auto_17587 )
      ( FLY-3PPL-VERIFY ?auto_17588 ?auto_17589 ?auto_17590 ?auto_17587 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17667 - PERSON
      ?auto_17668 - PERSON
      ?auto_17669 - PERSON
      ?auto_17666 - CITY
    )
    :vars
    (
      ?auto_17670 - AIRCRAFT
      ?auto_17672 - CITY
      ?auto_17673 - FLEVEL
      ?auto_17671 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_17670 ?auto_17672 ) ( NEXT ?auto_17673 ?auto_17671 ) ( not ( = ?auto_17666 ?auto_17672 ) ) ( not ( = ?auto_17671 ?auto_17673 ) ) ( PERSON-AT ?auto_17668 ?auto_17666 ) ( not ( = ?auto_17668 ?auto_17669 ) ) ( PERSON-AT ?auto_17669 ?auto_17672 ) ( FUEL-LEVEL ?auto_17670 ?auto_17673 ) ( PERSON-AT ?auto_17667 ?auto_17666 ) ( not ( = ?auto_17667 ?auto_17668 ) ) ( not ( = ?auto_17667 ?auto_17669 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17668 ?auto_17669 ?auto_17666 )
      ( FLY-3PPL-VERIFY ?auto_17667 ?auto_17668 ?auto_17669 ?auto_17666 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17679 - PERSON
      ?auto_17680 - PERSON
      ?auto_17681 - PERSON
      ?auto_17678 - CITY
    )
    :vars
    (
      ?auto_17682 - AIRCRAFT
      ?auto_17684 - CITY
      ?auto_17685 - FLEVEL
      ?auto_17683 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_17682 ?auto_17684 ) ( NEXT ?auto_17685 ?auto_17683 ) ( not ( = ?auto_17678 ?auto_17684 ) ) ( not ( = ?auto_17683 ?auto_17685 ) ) ( PERSON-AT ?auto_17679 ?auto_17678 ) ( not ( = ?auto_17679 ?auto_17680 ) ) ( PERSON-AT ?auto_17680 ?auto_17684 ) ( FUEL-LEVEL ?auto_17682 ?auto_17685 ) ( PERSON-AT ?auto_17681 ?auto_17678 ) ( not ( = ?auto_17679 ?auto_17681 ) ) ( not ( = ?auto_17680 ?auto_17681 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17679 ?auto_17680 ?auto_17678 )
      ( FLY-3PPL-VERIFY ?auto_17679 ?auto_17680 ?auto_17681 ?auto_17678 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17703 - PERSON
      ?auto_17704 - PERSON
      ?auto_17705 - PERSON
      ?auto_17702 - CITY
    )
    :vars
    (
      ?auto_17706 - AIRCRAFT
      ?auto_17708 - CITY
      ?auto_17710 - FLEVEL
      ?auto_17707 - FLEVEL
      ?auto_17709 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_17706 ?auto_17708 ) ( NEXT ?auto_17710 ?auto_17707 ) ( not ( = ?auto_17702 ?auto_17708 ) ) ( not ( = ?auto_17707 ?auto_17710 ) ) ( PERSON-AT ?auto_17709 ?auto_17702 ) ( not ( = ?auto_17709 ?auto_17705 ) ) ( PERSON-AT ?auto_17705 ?auto_17708 ) ( FUEL-LEVEL ?auto_17706 ?auto_17710 ) ( PERSON-AT ?auto_17703 ?auto_17702 ) ( PERSON-AT ?auto_17704 ?auto_17702 ) ( not ( = ?auto_17703 ?auto_17704 ) ) ( not ( = ?auto_17703 ?auto_17705 ) ) ( not ( = ?auto_17703 ?auto_17709 ) ) ( not ( = ?auto_17704 ?auto_17705 ) ) ( not ( = ?auto_17704 ?auto_17709 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17709 ?auto_17705 ?auto_17702 )
      ( FLY-3PPL-VERIFY ?auto_17703 ?auto_17704 ?auto_17705 ?auto_17702 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17716 - PERSON
      ?auto_17717 - PERSON
      ?auto_17718 - PERSON
      ?auto_17715 - CITY
    )
    :vars
    (
      ?auto_17719 - AIRCRAFT
      ?auto_17721 - CITY
      ?auto_17723 - FLEVEL
      ?auto_17720 - FLEVEL
      ?auto_17722 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_17719 ?auto_17721 ) ( NEXT ?auto_17723 ?auto_17720 ) ( not ( = ?auto_17715 ?auto_17721 ) ) ( not ( = ?auto_17720 ?auto_17723 ) ) ( PERSON-AT ?auto_17722 ?auto_17715 ) ( not ( = ?auto_17722 ?auto_17717 ) ) ( PERSON-AT ?auto_17717 ?auto_17721 ) ( FUEL-LEVEL ?auto_17719 ?auto_17723 ) ( PERSON-AT ?auto_17716 ?auto_17715 ) ( PERSON-AT ?auto_17718 ?auto_17715 ) ( not ( = ?auto_17716 ?auto_17717 ) ) ( not ( = ?auto_17716 ?auto_17718 ) ) ( not ( = ?auto_17716 ?auto_17722 ) ) ( not ( = ?auto_17717 ?auto_17718 ) ) ( not ( = ?auto_17718 ?auto_17722 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17722 ?auto_17717 ?auto_17715 )
      ( FLY-3PPL-VERIFY ?auto_17716 ?auto_17717 ?auto_17718 ?auto_17715 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17758 - PERSON
      ?auto_17759 - PERSON
      ?auto_17760 - PERSON
      ?auto_17757 - CITY
    )
    :vars
    (
      ?auto_17761 - AIRCRAFT
      ?auto_17763 - CITY
      ?auto_17765 - FLEVEL
      ?auto_17762 - FLEVEL
      ?auto_17764 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_17761 ?auto_17763 ) ( NEXT ?auto_17765 ?auto_17762 ) ( not ( = ?auto_17757 ?auto_17763 ) ) ( not ( = ?auto_17762 ?auto_17765 ) ) ( PERSON-AT ?auto_17764 ?auto_17757 ) ( not ( = ?auto_17764 ?auto_17758 ) ) ( PERSON-AT ?auto_17758 ?auto_17763 ) ( FUEL-LEVEL ?auto_17761 ?auto_17765 ) ( PERSON-AT ?auto_17759 ?auto_17757 ) ( PERSON-AT ?auto_17760 ?auto_17757 ) ( not ( = ?auto_17758 ?auto_17759 ) ) ( not ( = ?auto_17758 ?auto_17760 ) ) ( not ( = ?auto_17759 ?auto_17760 ) ) ( not ( = ?auto_17759 ?auto_17764 ) ) ( not ( = ?auto_17760 ?auto_17764 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17764 ?auto_17758 ?auto_17757 )
      ( FLY-3PPL-VERIFY ?auto_17758 ?auto_17759 ?auto_17760 ?auto_17757 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17837 - PERSON
      ?auto_17838 - PERSON
      ?auto_17839 - PERSON
      ?auto_17836 - CITY
    )
    :vars
    (
      ?auto_17841 - FLEVEL
      ?auto_17840 - FLEVEL
      ?auto_17842 - CITY
      ?auto_17843 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17841 ?auto_17840 ) ( not ( = ?auto_17836 ?auto_17842 ) ) ( not ( = ?auto_17840 ?auto_17841 ) ) ( PERSON-AT ?auto_17838 ?auto_17836 ) ( not ( = ?auto_17838 ?auto_17839 ) ) ( PERSON-AT ?auto_17839 ?auto_17842 ) ( AIRCRAFT-AT ?auto_17843 ?auto_17836 ) ( FUEL-LEVEL ?auto_17843 ?auto_17840 ) ( PERSON-AT ?auto_17837 ?auto_17836 ) ( not ( = ?auto_17837 ?auto_17838 ) ) ( not ( = ?auto_17837 ?auto_17839 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17838 ?auto_17839 ?auto_17836 )
      ( FLY-3PPL-VERIFY ?auto_17837 ?auto_17838 ?auto_17839 ?auto_17836 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17873 - PERSON
      ?auto_17874 - PERSON
      ?auto_17875 - PERSON
      ?auto_17872 - CITY
    )
    :vars
    (
      ?auto_17877 - FLEVEL
      ?auto_17876 - FLEVEL
      ?auto_17878 - CITY
      ?auto_17879 - PERSON
      ?auto_17880 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17877 ?auto_17876 ) ( not ( = ?auto_17872 ?auto_17878 ) ) ( not ( = ?auto_17876 ?auto_17877 ) ) ( PERSON-AT ?auto_17879 ?auto_17872 ) ( not ( = ?auto_17879 ?auto_17875 ) ) ( PERSON-AT ?auto_17875 ?auto_17878 ) ( AIRCRAFT-AT ?auto_17880 ?auto_17872 ) ( FUEL-LEVEL ?auto_17880 ?auto_17876 ) ( PERSON-AT ?auto_17873 ?auto_17872 ) ( PERSON-AT ?auto_17874 ?auto_17872 ) ( not ( = ?auto_17873 ?auto_17874 ) ) ( not ( = ?auto_17873 ?auto_17875 ) ) ( not ( = ?auto_17873 ?auto_17879 ) ) ( not ( = ?auto_17874 ?auto_17875 ) ) ( not ( = ?auto_17874 ?auto_17879 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17879 ?auto_17875 ?auto_17872 )
      ( FLY-3PPL-VERIFY ?auto_17873 ?auto_17874 ?auto_17875 ?auto_17872 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17886 - PERSON
      ?auto_17887 - PERSON
      ?auto_17888 - PERSON
      ?auto_17885 - CITY
    )
    :vars
    (
      ?auto_17890 - FLEVEL
      ?auto_17889 - FLEVEL
      ?auto_17891 - CITY
      ?auto_17892 - PERSON
      ?auto_17893 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17890 ?auto_17889 ) ( not ( = ?auto_17885 ?auto_17891 ) ) ( not ( = ?auto_17889 ?auto_17890 ) ) ( PERSON-AT ?auto_17892 ?auto_17885 ) ( not ( = ?auto_17892 ?auto_17887 ) ) ( PERSON-AT ?auto_17887 ?auto_17891 ) ( AIRCRAFT-AT ?auto_17893 ?auto_17885 ) ( FUEL-LEVEL ?auto_17893 ?auto_17889 ) ( PERSON-AT ?auto_17886 ?auto_17885 ) ( PERSON-AT ?auto_17888 ?auto_17885 ) ( not ( = ?auto_17886 ?auto_17887 ) ) ( not ( = ?auto_17886 ?auto_17888 ) ) ( not ( = ?auto_17886 ?auto_17892 ) ) ( not ( = ?auto_17887 ?auto_17888 ) ) ( not ( = ?auto_17888 ?auto_17892 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17892 ?auto_17887 ?auto_17885 )
      ( FLY-3PPL-VERIFY ?auto_17886 ?auto_17887 ?auto_17888 ?auto_17885 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17928 - PERSON
      ?auto_17929 - PERSON
      ?auto_17930 - PERSON
      ?auto_17927 - CITY
    )
    :vars
    (
      ?auto_17932 - FLEVEL
      ?auto_17931 - FLEVEL
      ?auto_17933 - CITY
      ?auto_17934 - PERSON
      ?auto_17935 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17932 ?auto_17931 ) ( not ( = ?auto_17927 ?auto_17933 ) ) ( not ( = ?auto_17931 ?auto_17932 ) ) ( PERSON-AT ?auto_17934 ?auto_17927 ) ( not ( = ?auto_17934 ?auto_17928 ) ) ( PERSON-AT ?auto_17928 ?auto_17933 ) ( AIRCRAFT-AT ?auto_17935 ?auto_17927 ) ( FUEL-LEVEL ?auto_17935 ?auto_17931 ) ( PERSON-AT ?auto_17929 ?auto_17927 ) ( PERSON-AT ?auto_17930 ?auto_17927 ) ( not ( = ?auto_17928 ?auto_17929 ) ) ( not ( = ?auto_17928 ?auto_17930 ) ) ( not ( = ?auto_17929 ?auto_17930 ) ) ( not ( = ?auto_17929 ?auto_17934 ) ) ( not ( = ?auto_17930 ?auto_17934 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17934 ?auto_17928 ?auto_17927 )
      ( FLY-3PPL-VERIFY ?auto_17928 ?auto_17929 ?auto_17930 ?auto_17927 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18019 - PERSON
      ?auto_18020 - PERSON
      ?auto_18021 - PERSON
      ?auto_18018 - CITY
    )
    :vars
    (
      ?auto_18024 - FLEVEL
      ?auto_18022 - FLEVEL
      ?auto_18023 - CITY
      ?auto_18025 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18024 ?auto_18022 ) ( not ( = ?auto_18018 ?auto_18023 ) ) ( not ( = ?auto_18022 ?auto_18024 ) ) ( PERSON-AT ?auto_18019 ?auto_18018 ) ( not ( = ?auto_18019 ?auto_18020 ) ) ( PERSON-AT ?auto_18020 ?auto_18023 ) ( AIRCRAFT-AT ?auto_18025 ?auto_18018 ) ( FUEL-LEVEL ?auto_18025 ?auto_18024 ) ( PERSON-AT ?auto_18021 ?auto_18018 ) ( not ( = ?auto_18019 ?auto_18021 ) ) ( not ( = ?auto_18020 ?auto_18021 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18019 ?auto_18020 ?auto_18018 )
      ( FLY-3PPL-VERIFY ?auto_18019 ?auto_18020 ?auto_18021 ?auto_18018 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18043 - PERSON
      ?auto_18044 - PERSON
      ?auto_18045 - PERSON
      ?auto_18042 - CITY
    )
    :vars
    (
      ?auto_18049 - FLEVEL
      ?auto_18046 - FLEVEL
      ?auto_18048 - CITY
      ?auto_18047 - PERSON
      ?auto_18050 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18049 ?auto_18046 ) ( not ( = ?auto_18042 ?auto_18048 ) ) ( not ( = ?auto_18046 ?auto_18049 ) ) ( PERSON-AT ?auto_18047 ?auto_18042 ) ( not ( = ?auto_18047 ?auto_18045 ) ) ( PERSON-AT ?auto_18045 ?auto_18048 ) ( AIRCRAFT-AT ?auto_18050 ?auto_18042 ) ( FUEL-LEVEL ?auto_18050 ?auto_18049 ) ( PERSON-AT ?auto_18043 ?auto_18042 ) ( PERSON-AT ?auto_18044 ?auto_18042 ) ( not ( = ?auto_18043 ?auto_18044 ) ) ( not ( = ?auto_18043 ?auto_18045 ) ) ( not ( = ?auto_18043 ?auto_18047 ) ) ( not ( = ?auto_18044 ?auto_18045 ) ) ( not ( = ?auto_18044 ?auto_18047 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18047 ?auto_18045 ?auto_18042 )
      ( FLY-3PPL-VERIFY ?auto_18043 ?auto_18044 ?auto_18045 ?auto_18042 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18056 - PERSON
      ?auto_18057 - PERSON
      ?auto_18058 - PERSON
      ?auto_18055 - CITY
    )
    :vars
    (
      ?auto_18062 - FLEVEL
      ?auto_18059 - FLEVEL
      ?auto_18061 - CITY
      ?auto_18060 - PERSON
      ?auto_18063 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18062 ?auto_18059 ) ( not ( = ?auto_18055 ?auto_18061 ) ) ( not ( = ?auto_18059 ?auto_18062 ) ) ( PERSON-AT ?auto_18060 ?auto_18055 ) ( not ( = ?auto_18060 ?auto_18057 ) ) ( PERSON-AT ?auto_18057 ?auto_18061 ) ( AIRCRAFT-AT ?auto_18063 ?auto_18055 ) ( FUEL-LEVEL ?auto_18063 ?auto_18062 ) ( PERSON-AT ?auto_18056 ?auto_18055 ) ( PERSON-AT ?auto_18058 ?auto_18055 ) ( not ( = ?auto_18056 ?auto_18057 ) ) ( not ( = ?auto_18056 ?auto_18058 ) ) ( not ( = ?auto_18056 ?auto_18060 ) ) ( not ( = ?auto_18057 ?auto_18058 ) ) ( not ( = ?auto_18058 ?auto_18060 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18060 ?auto_18057 ?auto_18055 )
      ( FLY-3PPL-VERIFY ?auto_18056 ?auto_18057 ?auto_18058 ?auto_18055 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18098 - PERSON
      ?auto_18099 - PERSON
      ?auto_18100 - PERSON
      ?auto_18097 - CITY
    )
    :vars
    (
      ?auto_18104 - FLEVEL
      ?auto_18101 - FLEVEL
      ?auto_18103 - CITY
      ?auto_18102 - PERSON
      ?auto_18105 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18104 ?auto_18101 ) ( not ( = ?auto_18097 ?auto_18103 ) ) ( not ( = ?auto_18101 ?auto_18104 ) ) ( PERSON-AT ?auto_18102 ?auto_18097 ) ( not ( = ?auto_18102 ?auto_18098 ) ) ( PERSON-AT ?auto_18098 ?auto_18103 ) ( AIRCRAFT-AT ?auto_18105 ?auto_18097 ) ( FUEL-LEVEL ?auto_18105 ?auto_18104 ) ( PERSON-AT ?auto_18099 ?auto_18097 ) ( PERSON-AT ?auto_18100 ?auto_18097 ) ( not ( = ?auto_18098 ?auto_18099 ) ) ( not ( = ?auto_18098 ?auto_18100 ) ) ( not ( = ?auto_18099 ?auto_18100 ) ) ( not ( = ?auto_18099 ?auto_18102 ) ) ( not ( = ?auto_18100 ?auto_18102 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18102 ?auto_18098 ?auto_18097 )
      ( FLY-3PPL-VERIFY ?auto_18098 ?auto_18099 ?auto_18100 ?auto_18097 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18257 - PERSON
      ?auto_18258 - PERSON
      ?auto_18259 - PERSON
      ?auto_18256 - CITY
    )
    :vars
    (
      ?auto_18260 - FLEVEL
      ?auto_18261 - FLEVEL
      ?auto_18263 - CITY
      ?auto_18262 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18260 ?auto_18261 ) ( not ( = ?auto_18256 ?auto_18263 ) ) ( not ( = ?auto_18261 ?auto_18260 ) ) ( PERSON-AT ?auto_18259 ?auto_18256 ) ( not ( = ?auto_18259 ?auto_18257 ) ) ( PERSON-AT ?auto_18257 ?auto_18263 ) ( AIRCRAFT-AT ?auto_18262 ?auto_18256 ) ( FUEL-LEVEL ?auto_18262 ?auto_18260 ) ( PERSON-AT ?auto_18258 ?auto_18256 ) ( not ( = ?auto_18257 ?auto_18258 ) ) ( not ( = ?auto_18258 ?auto_18259 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18259 ?auto_18257 ?auto_18256 )
      ( FLY-3PPL-VERIFY ?auto_18257 ?auto_18258 ?auto_18259 ?auto_18256 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_18333 - PERSON
      ?auto_18332 - CITY
    )
    :vars
    (
      ?auto_18334 - FLEVEL
      ?auto_18336 - FLEVEL
      ?auto_18338 - CITY
      ?auto_18335 - PERSON
      ?auto_18337 - AIRCRAFT
      ?auto_18339 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18334 ?auto_18336 ) ( not ( = ?auto_18332 ?auto_18338 ) ) ( not ( = ?auto_18336 ?auto_18334 ) ) ( PERSON-AT ?auto_18335 ?auto_18332 ) ( not ( = ?auto_18335 ?auto_18333 ) ) ( PERSON-AT ?auto_18333 ?auto_18338 ) ( AIRCRAFT-AT ?auto_18337 ?auto_18339 ) ( FUEL-LEVEL ?auto_18337 ?auto_18336 ) ( not ( = ?auto_18332 ?auto_18339 ) ) ( not ( = ?auto_18338 ?auto_18339 ) ) )
    :subtasks
    ( ( !FLY ?auto_18337 ?auto_18339 ?auto_18332 ?auto_18336 ?auto_18334 )
      ( FLY-2PPL ?auto_18335 ?auto_18333 ?auto_18332 )
      ( FLY-1PPL-VERIFY ?auto_18333 ?auto_18332 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18341 - PERSON
      ?auto_18342 - PERSON
      ?auto_18340 - CITY
    )
    :vars
    (
      ?auto_18346 - FLEVEL
      ?auto_18347 - FLEVEL
      ?auto_18343 - CITY
      ?auto_18344 - AIRCRAFT
      ?auto_18345 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18346 ?auto_18347 ) ( not ( = ?auto_18340 ?auto_18343 ) ) ( not ( = ?auto_18347 ?auto_18346 ) ) ( PERSON-AT ?auto_18341 ?auto_18340 ) ( not ( = ?auto_18341 ?auto_18342 ) ) ( PERSON-AT ?auto_18342 ?auto_18343 ) ( AIRCRAFT-AT ?auto_18344 ?auto_18345 ) ( FUEL-LEVEL ?auto_18344 ?auto_18347 ) ( not ( = ?auto_18340 ?auto_18345 ) ) ( not ( = ?auto_18343 ?auto_18345 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18342 ?auto_18340 )
      ( FLY-2PPL-VERIFY ?auto_18341 ?auto_18342 ?auto_18340 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18358 - PERSON
      ?auto_18359 - PERSON
      ?auto_18357 - CITY
    )
    :vars
    (
      ?auto_18360 - FLEVEL
      ?auto_18362 - FLEVEL
      ?auto_18364 - CITY
      ?auto_18363 - AIRCRAFT
      ?auto_18361 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18360 ?auto_18362 ) ( not ( = ?auto_18357 ?auto_18364 ) ) ( not ( = ?auto_18362 ?auto_18360 ) ) ( PERSON-AT ?auto_18359 ?auto_18357 ) ( not ( = ?auto_18359 ?auto_18358 ) ) ( PERSON-AT ?auto_18358 ?auto_18364 ) ( AIRCRAFT-AT ?auto_18363 ?auto_18361 ) ( FUEL-LEVEL ?auto_18363 ?auto_18362 ) ( not ( = ?auto_18357 ?auto_18361 ) ) ( not ( = ?auto_18364 ?auto_18361 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18359 ?auto_18358 ?auto_18357 )
      ( FLY-2PPL-VERIFY ?auto_18358 ?auto_18359 ?auto_18357 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18384 - PERSON
      ?auto_18385 - PERSON
      ?auto_18386 - PERSON
      ?auto_18383 - CITY
    )
    :vars
    (
      ?auto_18387 - FLEVEL
      ?auto_18389 - FLEVEL
      ?auto_18391 - CITY
      ?auto_18390 - AIRCRAFT
      ?auto_18388 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18387 ?auto_18389 ) ( not ( = ?auto_18383 ?auto_18391 ) ) ( not ( = ?auto_18389 ?auto_18387 ) ) ( PERSON-AT ?auto_18385 ?auto_18383 ) ( not ( = ?auto_18385 ?auto_18386 ) ) ( PERSON-AT ?auto_18386 ?auto_18391 ) ( AIRCRAFT-AT ?auto_18390 ?auto_18388 ) ( FUEL-LEVEL ?auto_18390 ?auto_18389 ) ( not ( = ?auto_18383 ?auto_18388 ) ) ( not ( = ?auto_18391 ?auto_18388 ) ) ( PERSON-AT ?auto_18384 ?auto_18383 ) ( not ( = ?auto_18384 ?auto_18385 ) ) ( not ( = ?auto_18384 ?auto_18386 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18385 ?auto_18386 ?auto_18383 )
      ( FLY-3PPL-VERIFY ?auto_18384 ?auto_18385 ?auto_18386 ?auto_18383 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18402 - PERSON
      ?auto_18403 - PERSON
      ?auto_18404 - PERSON
      ?auto_18401 - CITY
    )
    :vars
    (
      ?auto_18405 - FLEVEL
      ?auto_18407 - FLEVEL
      ?auto_18409 - CITY
      ?auto_18408 - AIRCRAFT
      ?auto_18406 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18405 ?auto_18407 ) ( not ( = ?auto_18401 ?auto_18409 ) ) ( not ( = ?auto_18407 ?auto_18405 ) ) ( PERSON-AT ?auto_18402 ?auto_18401 ) ( not ( = ?auto_18402 ?auto_18403 ) ) ( PERSON-AT ?auto_18403 ?auto_18409 ) ( AIRCRAFT-AT ?auto_18408 ?auto_18406 ) ( FUEL-LEVEL ?auto_18408 ?auto_18407 ) ( not ( = ?auto_18401 ?auto_18406 ) ) ( not ( = ?auto_18409 ?auto_18406 ) ) ( PERSON-AT ?auto_18404 ?auto_18401 ) ( not ( = ?auto_18402 ?auto_18404 ) ) ( not ( = ?auto_18403 ?auto_18404 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18402 ?auto_18403 ?auto_18401 )
      ( FLY-3PPL-VERIFY ?auto_18402 ?auto_18403 ?auto_18404 ?auto_18401 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18477 - PERSON
      ?auto_18478 - PERSON
      ?auto_18479 - PERSON
      ?auto_18476 - CITY
    )
    :vars
    (
      ?auto_18480 - FLEVEL
      ?auto_18482 - FLEVEL
      ?auto_18484 - CITY
      ?auto_18483 - AIRCRAFT
      ?auto_18481 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18480 ?auto_18482 ) ( not ( = ?auto_18476 ?auto_18484 ) ) ( not ( = ?auto_18482 ?auto_18480 ) ) ( PERSON-AT ?auto_18478 ?auto_18476 ) ( not ( = ?auto_18478 ?auto_18477 ) ) ( PERSON-AT ?auto_18477 ?auto_18484 ) ( AIRCRAFT-AT ?auto_18483 ?auto_18481 ) ( FUEL-LEVEL ?auto_18483 ?auto_18482 ) ( not ( = ?auto_18476 ?auto_18481 ) ) ( not ( = ?auto_18484 ?auto_18481 ) ) ( PERSON-AT ?auto_18479 ?auto_18476 ) ( not ( = ?auto_18477 ?auto_18479 ) ) ( not ( = ?auto_18478 ?auto_18479 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18478 ?auto_18477 ?auto_18476 )
      ( FLY-3PPL-VERIFY ?auto_18477 ?auto_18478 ?auto_18479 ?auto_18476 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18597 - PERSON
      ?auto_18598 - PERSON
      ?auto_18599 - PERSON
      ?auto_18596 - CITY
    )
    :vars
    (
      ?auto_18601 - FLEVEL
      ?auto_18604 - FLEVEL
      ?auto_18600 - CITY
      ?auto_18602 - AIRCRAFT
      ?auto_18603 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18601 ?auto_18604 ) ( not ( = ?auto_18596 ?auto_18600 ) ) ( not ( = ?auto_18604 ?auto_18601 ) ) ( PERSON-AT ?auto_18597 ?auto_18596 ) ( not ( = ?auto_18597 ?auto_18599 ) ) ( PERSON-AT ?auto_18599 ?auto_18600 ) ( AIRCRAFT-AT ?auto_18602 ?auto_18603 ) ( FUEL-LEVEL ?auto_18602 ?auto_18604 ) ( not ( = ?auto_18596 ?auto_18603 ) ) ( not ( = ?auto_18600 ?auto_18603 ) ) ( PERSON-AT ?auto_18598 ?auto_18596 ) ( not ( = ?auto_18597 ?auto_18598 ) ) ( not ( = ?auto_18598 ?auto_18599 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18597 ?auto_18599 ?auto_18596 )
      ( FLY-3PPL-VERIFY ?auto_18597 ?auto_18598 ?auto_18599 ?auto_18596 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18615 - PERSON
      ?auto_18616 - PERSON
      ?auto_18617 - PERSON
      ?auto_18614 - CITY
    )
    :vars
    (
      ?auto_18619 - FLEVEL
      ?auto_18622 - FLEVEL
      ?auto_18618 - CITY
      ?auto_18620 - AIRCRAFT
      ?auto_18621 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18619 ?auto_18622 ) ( not ( = ?auto_18614 ?auto_18618 ) ) ( not ( = ?auto_18622 ?auto_18619 ) ) ( PERSON-AT ?auto_18617 ?auto_18614 ) ( not ( = ?auto_18617 ?auto_18616 ) ) ( PERSON-AT ?auto_18616 ?auto_18618 ) ( AIRCRAFT-AT ?auto_18620 ?auto_18621 ) ( FUEL-LEVEL ?auto_18620 ?auto_18622 ) ( not ( = ?auto_18614 ?auto_18621 ) ) ( not ( = ?auto_18618 ?auto_18621 ) ) ( PERSON-AT ?auto_18615 ?auto_18614 ) ( not ( = ?auto_18615 ?auto_18616 ) ) ( not ( = ?auto_18615 ?auto_18617 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18617 ?auto_18616 ?auto_18614 )
      ( FLY-3PPL-VERIFY ?auto_18615 ?auto_18616 ?auto_18617 ?auto_18614 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18690 - PERSON
      ?auto_18691 - PERSON
      ?auto_18692 - PERSON
      ?auto_18689 - CITY
    )
    :vars
    (
      ?auto_18694 - FLEVEL
      ?auto_18697 - FLEVEL
      ?auto_18693 - CITY
      ?auto_18695 - AIRCRAFT
      ?auto_18696 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18694 ?auto_18697 ) ( not ( = ?auto_18689 ?auto_18693 ) ) ( not ( = ?auto_18697 ?auto_18694 ) ) ( PERSON-AT ?auto_18692 ?auto_18689 ) ( not ( = ?auto_18692 ?auto_18690 ) ) ( PERSON-AT ?auto_18690 ?auto_18693 ) ( AIRCRAFT-AT ?auto_18695 ?auto_18696 ) ( FUEL-LEVEL ?auto_18695 ?auto_18697 ) ( not ( = ?auto_18689 ?auto_18696 ) ) ( not ( = ?auto_18693 ?auto_18696 ) ) ( PERSON-AT ?auto_18691 ?auto_18689 ) ( not ( = ?auto_18690 ?auto_18691 ) ) ( not ( = ?auto_18691 ?auto_18692 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18692 ?auto_18690 ?auto_18689 )
      ( FLY-3PPL-VERIFY ?auto_18690 ?auto_18691 ?auto_18692 ?auto_18689 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_18775 - PERSON
      ?auto_18774 - CITY
    )
    :vars
    (
      ?auto_18777 - FLEVEL
      ?auto_18781 - FLEVEL
      ?auto_18776 - CITY
      ?auto_18778 - PERSON
      ?auto_18779 - AIRCRAFT
      ?auto_18780 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18777 ?auto_18781 ) ( not ( = ?auto_18774 ?auto_18776 ) ) ( not ( = ?auto_18781 ?auto_18777 ) ) ( PERSON-AT ?auto_18778 ?auto_18774 ) ( not ( = ?auto_18778 ?auto_18775 ) ) ( PERSON-AT ?auto_18775 ?auto_18776 ) ( AIRCRAFT-AT ?auto_18779 ?auto_18780 ) ( not ( = ?auto_18774 ?auto_18780 ) ) ( not ( = ?auto_18776 ?auto_18780 ) ) ( FUEL-LEVEL ?auto_18779 ?auto_18777 ) )
    :subtasks
    ( ( !REFUEL ?auto_18779 ?auto_18780 ?auto_18777 ?auto_18781 )
      ( FLY-2PPL ?auto_18778 ?auto_18775 ?auto_18774 )
      ( FLY-1PPL-VERIFY ?auto_18775 ?auto_18774 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18783 - PERSON
      ?auto_18784 - PERSON
      ?auto_18782 - CITY
    )
    :vars
    (
      ?auto_18786 - FLEVEL
      ?auto_18785 - FLEVEL
      ?auto_18787 - CITY
      ?auto_18789 - AIRCRAFT
      ?auto_18788 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18786 ?auto_18785 ) ( not ( = ?auto_18782 ?auto_18787 ) ) ( not ( = ?auto_18785 ?auto_18786 ) ) ( PERSON-AT ?auto_18783 ?auto_18782 ) ( not ( = ?auto_18783 ?auto_18784 ) ) ( PERSON-AT ?auto_18784 ?auto_18787 ) ( AIRCRAFT-AT ?auto_18789 ?auto_18788 ) ( not ( = ?auto_18782 ?auto_18788 ) ) ( not ( = ?auto_18787 ?auto_18788 ) ) ( FUEL-LEVEL ?auto_18789 ?auto_18786 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18784 ?auto_18782 )
      ( FLY-2PPL-VERIFY ?auto_18783 ?auto_18784 ?auto_18782 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18800 - PERSON
      ?auto_18801 - PERSON
      ?auto_18799 - CITY
    )
    :vars
    (
      ?auto_18804 - FLEVEL
      ?auto_18802 - FLEVEL
      ?auto_18803 - CITY
      ?auto_18805 - AIRCRAFT
      ?auto_18806 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18804 ?auto_18802 ) ( not ( = ?auto_18799 ?auto_18803 ) ) ( not ( = ?auto_18802 ?auto_18804 ) ) ( PERSON-AT ?auto_18801 ?auto_18799 ) ( not ( = ?auto_18801 ?auto_18800 ) ) ( PERSON-AT ?auto_18800 ?auto_18803 ) ( AIRCRAFT-AT ?auto_18805 ?auto_18806 ) ( not ( = ?auto_18799 ?auto_18806 ) ) ( not ( = ?auto_18803 ?auto_18806 ) ) ( FUEL-LEVEL ?auto_18805 ?auto_18804 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18801 ?auto_18800 ?auto_18799 )
      ( FLY-2PPL-VERIFY ?auto_18800 ?auto_18801 ?auto_18799 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18826 - PERSON
      ?auto_18827 - PERSON
      ?auto_18828 - PERSON
      ?auto_18825 - CITY
    )
    :vars
    (
      ?auto_18831 - FLEVEL
      ?auto_18829 - FLEVEL
      ?auto_18830 - CITY
      ?auto_18832 - AIRCRAFT
      ?auto_18833 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18831 ?auto_18829 ) ( not ( = ?auto_18825 ?auto_18830 ) ) ( not ( = ?auto_18829 ?auto_18831 ) ) ( PERSON-AT ?auto_18827 ?auto_18825 ) ( not ( = ?auto_18827 ?auto_18828 ) ) ( PERSON-AT ?auto_18828 ?auto_18830 ) ( AIRCRAFT-AT ?auto_18832 ?auto_18833 ) ( not ( = ?auto_18825 ?auto_18833 ) ) ( not ( = ?auto_18830 ?auto_18833 ) ) ( FUEL-LEVEL ?auto_18832 ?auto_18831 ) ( PERSON-AT ?auto_18826 ?auto_18825 ) ( not ( = ?auto_18826 ?auto_18827 ) ) ( not ( = ?auto_18826 ?auto_18828 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18827 ?auto_18828 ?auto_18825 )
      ( FLY-3PPL-VERIFY ?auto_18826 ?auto_18827 ?auto_18828 ?auto_18825 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18844 - PERSON
      ?auto_18845 - PERSON
      ?auto_18846 - PERSON
      ?auto_18843 - CITY
    )
    :vars
    (
      ?auto_18849 - FLEVEL
      ?auto_18847 - FLEVEL
      ?auto_18848 - CITY
      ?auto_18850 - AIRCRAFT
      ?auto_18851 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18849 ?auto_18847 ) ( not ( = ?auto_18843 ?auto_18848 ) ) ( not ( = ?auto_18847 ?auto_18849 ) ) ( PERSON-AT ?auto_18844 ?auto_18843 ) ( not ( = ?auto_18844 ?auto_18845 ) ) ( PERSON-AT ?auto_18845 ?auto_18848 ) ( AIRCRAFT-AT ?auto_18850 ?auto_18851 ) ( not ( = ?auto_18843 ?auto_18851 ) ) ( not ( = ?auto_18848 ?auto_18851 ) ) ( FUEL-LEVEL ?auto_18850 ?auto_18849 ) ( PERSON-AT ?auto_18846 ?auto_18843 ) ( not ( = ?auto_18844 ?auto_18846 ) ) ( not ( = ?auto_18845 ?auto_18846 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18844 ?auto_18845 ?auto_18843 )
      ( FLY-3PPL-VERIFY ?auto_18844 ?auto_18845 ?auto_18846 ?auto_18843 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18919 - PERSON
      ?auto_18920 - PERSON
      ?auto_18921 - PERSON
      ?auto_18918 - CITY
    )
    :vars
    (
      ?auto_18924 - FLEVEL
      ?auto_18922 - FLEVEL
      ?auto_18923 - CITY
      ?auto_18925 - AIRCRAFT
      ?auto_18926 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18924 ?auto_18922 ) ( not ( = ?auto_18918 ?auto_18923 ) ) ( not ( = ?auto_18922 ?auto_18924 ) ) ( PERSON-AT ?auto_18920 ?auto_18918 ) ( not ( = ?auto_18920 ?auto_18919 ) ) ( PERSON-AT ?auto_18919 ?auto_18923 ) ( AIRCRAFT-AT ?auto_18925 ?auto_18926 ) ( not ( = ?auto_18918 ?auto_18926 ) ) ( not ( = ?auto_18923 ?auto_18926 ) ) ( FUEL-LEVEL ?auto_18925 ?auto_18924 ) ( PERSON-AT ?auto_18921 ?auto_18918 ) ( not ( = ?auto_18919 ?auto_18921 ) ) ( not ( = ?auto_18920 ?auto_18921 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18920 ?auto_18919 ?auto_18918 )
      ( FLY-3PPL-VERIFY ?auto_18919 ?auto_18920 ?auto_18921 ?auto_18918 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19052 - PERSON
      ?auto_19053 - PERSON
      ?auto_19054 - PERSON
      ?auto_19051 - CITY
    )
    :vars
    (
      ?auto_19055 - FLEVEL
      ?auto_19058 - FLEVEL
      ?auto_19057 - CITY
      ?auto_19056 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_19055 ?auto_19058 ) ( not ( = ?auto_19051 ?auto_19057 ) ) ( not ( = ?auto_19058 ?auto_19055 ) ) ( PERSON-AT ?auto_19054 ?auto_19051 ) ( not ( = ?auto_19054 ?auto_19053 ) ) ( PERSON-AT ?auto_19053 ?auto_19057 ) ( AIRCRAFT-AT ?auto_19056 ?auto_19051 ) ( FUEL-LEVEL ?auto_19056 ?auto_19058 ) ( PERSON-AT ?auto_19052 ?auto_19051 ) ( not ( = ?auto_19052 ?auto_19053 ) ) ( not ( = ?auto_19052 ?auto_19054 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19054 ?auto_19053 ?auto_19051 )
      ( FLY-3PPL-VERIFY ?auto_19052 ?auto_19053 ?auto_19054 ?auto_19051 ) )
  )

)

