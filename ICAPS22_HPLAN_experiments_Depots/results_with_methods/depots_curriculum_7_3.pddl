( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1212 - SURFACE
      ?auto_1213 - SURFACE
    )
    :vars
    (
      ?auto_1214 - HOIST
      ?auto_1215 - PLACE
      ?auto_1217 - PLACE
      ?auto_1218 - HOIST
      ?auto_1219 - SURFACE
      ?auto_1216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1214 ?auto_1215 ) ( SURFACE-AT ?auto_1213 ?auto_1215 ) ( CLEAR ?auto_1213 ) ( IS-CRATE ?auto_1212 ) ( AVAILABLE ?auto_1214 ) ( not ( = ?auto_1217 ?auto_1215 ) ) ( HOIST-AT ?auto_1218 ?auto_1217 ) ( AVAILABLE ?auto_1218 ) ( SURFACE-AT ?auto_1212 ?auto_1217 ) ( ON ?auto_1212 ?auto_1219 ) ( CLEAR ?auto_1212 ) ( TRUCK-AT ?auto_1216 ?auto_1215 ) ( not ( = ?auto_1212 ?auto_1213 ) ) ( not ( = ?auto_1212 ?auto_1219 ) ) ( not ( = ?auto_1213 ?auto_1219 ) ) ( not ( = ?auto_1214 ?auto_1218 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1216 ?auto_1215 ?auto_1217 )
      ( !LIFT ?auto_1218 ?auto_1212 ?auto_1219 ?auto_1217 )
      ( !LOAD ?auto_1218 ?auto_1212 ?auto_1216 ?auto_1217 )
      ( !DRIVE ?auto_1216 ?auto_1217 ?auto_1215 )
      ( !UNLOAD ?auto_1214 ?auto_1212 ?auto_1216 ?auto_1215 )
      ( !DROP ?auto_1214 ?auto_1212 ?auto_1213 ?auto_1215 )
      ( MAKE-ON-VERIFY ?auto_1212 ?auto_1213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1222 - SURFACE
      ?auto_1223 - SURFACE
    )
    :vars
    (
      ?auto_1224 - HOIST
      ?auto_1225 - PLACE
      ?auto_1227 - PLACE
      ?auto_1228 - HOIST
      ?auto_1229 - SURFACE
      ?auto_1226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1224 ?auto_1225 ) ( SURFACE-AT ?auto_1223 ?auto_1225 ) ( CLEAR ?auto_1223 ) ( IS-CRATE ?auto_1222 ) ( AVAILABLE ?auto_1224 ) ( not ( = ?auto_1227 ?auto_1225 ) ) ( HOIST-AT ?auto_1228 ?auto_1227 ) ( AVAILABLE ?auto_1228 ) ( SURFACE-AT ?auto_1222 ?auto_1227 ) ( ON ?auto_1222 ?auto_1229 ) ( CLEAR ?auto_1222 ) ( TRUCK-AT ?auto_1226 ?auto_1225 ) ( not ( = ?auto_1222 ?auto_1223 ) ) ( not ( = ?auto_1222 ?auto_1229 ) ) ( not ( = ?auto_1223 ?auto_1229 ) ) ( not ( = ?auto_1224 ?auto_1228 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1226 ?auto_1225 ?auto_1227 )
      ( !LIFT ?auto_1228 ?auto_1222 ?auto_1229 ?auto_1227 )
      ( !LOAD ?auto_1228 ?auto_1222 ?auto_1226 ?auto_1227 )
      ( !DRIVE ?auto_1226 ?auto_1227 ?auto_1225 )
      ( !UNLOAD ?auto_1224 ?auto_1222 ?auto_1226 ?auto_1225 )
      ( !DROP ?auto_1224 ?auto_1222 ?auto_1223 ?auto_1225 )
      ( MAKE-ON-VERIFY ?auto_1222 ?auto_1223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1232 - SURFACE
      ?auto_1233 - SURFACE
    )
    :vars
    (
      ?auto_1234 - HOIST
      ?auto_1235 - PLACE
      ?auto_1237 - PLACE
      ?auto_1238 - HOIST
      ?auto_1239 - SURFACE
      ?auto_1236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1234 ?auto_1235 ) ( SURFACE-AT ?auto_1233 ?auto_1235 ) ( CLEAR ?auto_1233 ) ( IS-CRATE ?auto_1232 ) ( AVAILABLE ?auto_1234 ) ( not ( = ?auto_1237 ?auto_1235 ) ) ( HOIST-AT ?auto_1238 ?auto_1237 ) ( AVAILABLE ?auto_1238 ) ( SURFACE-AT ?auto_1232 ?auto_1237 ) ( ON ?auto_1232 ?auto_1239 ) ( CLEAR ?auto_1232 ) ( TRUCK-AT ?auto_1236 ?auto_1235 ) ( not ( = ?auto_1232 ?auto_1233 ) ) ( not ( = ?auto_1232 ?auto_1239 ) ) ( not ( = ?auto_1233 ?auto_1239 ) ) ( not ( = ?auto_1234 ?auto_1238 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1236 ?auto_1235 ?auto_1237 )
      ( !LIFT ?auto_1238 ?auto_1232 ?auto_1239 ?auto_1237 )
      ( !LOAD ?auto_1238 ?auto_1232 ?auto_1236 ?auto_1237 )
      ( !DRIVE ?auto_1236 ?auto_1237 ?auto_1235 )
      ( !UNLOAD ?auto_1234 ?auto_1232 ?auto_1236 ?auto_1235 )
      ( !DROP ?auto_1234 ?auto_1232 ?auto_1233 ?auto_1235 )
      ( MAKE-ON-VERIFY ?auto_1232 ?auto_1233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1242 - SURFACE
      ?auto_1243 - SURFACE
    )
    :vars
    (
      ?auto_1244 - HOIST
      ?auto_1245 - PLACE
      ?auto_1247 - PLACE
      ?auto_1248 - HOIST
      ?auto_1249 - SURFACE
      ?auto_1246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1244 ?auto_1245 ) ( SURFACE-AT ?auto_1243 ?auto_1245 ) ( CLEAR ?auto_1243 ) ( IS-CRATE ?auto_1242 ) ( AVAILABLE ?auto_1244 ) ( not ( = ?auto_1247 ?auto_1245 ) ) ( HOIST-AT ?auto_1248 ?auto_1247 ) ( AVAILABLE ?auto_1248 ) ( SURFACE-AT ?auto_1242 ?auto_1247 ) ( ON ?auto_1242 ?auto_1249 ) ( CLEAR ?auto_1242 ) ( TRUCK-AT ?auto_1246 ?auto_1245 ) ( not ( = ?auto_1242 ?auto_1243 ) ) ( not ( = ?auto_1242 ?auto_1249 ) ) ( not ( = ?auto_1243 ?auto_1249 ) ) ( not ( = ?auto_1244 ?auto_1248 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1246 ?auto_1245 ?auto_1247 )
      ( !LIFT ?auto_1248 ?auto_1242 ?auto_1249 ?auto_1247 )
      ( !LOAD ?auto_1248 ?auto_1242 ?auto_1246 ?auto_1247 )
      ( !DRIVE ?auto_1246 ?auto_1247 ?auto_1245 )
      ( !UNLOAD ?auto_1244 ?auto_1242 ?auto_1246 ?auto_1245 )
      ( !DROP ?auto_1244 ?auto_1242 ?auto_1243 ?auto_1245 )
      ( MAKE-ON-VERIFY ?auto_1242 ?auto_1243 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1252 - SURFACE
      ?auto_1253 - SURFACE
    )
    :vars
    (
      ?auto_1254 - HOIST
      ?auto_1255 - PLACE
      ?auto_1257 - PLACE
      ?auto_1258 - HOIST
      ?auto_1259 - SURFACE
      ?auto_1256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1254 ?auto_1255 ) ( SURFACE-AT ?auto_1253 ?auto_1255 ) ( CLEAR ?auto_1253 ) ( IS-CRATE ?auto_1252 ) ( AVAILABLE ?auto_1254 ) ( not ( = ?auto_1257 ?auto_1255 ) ) ( HOIST-AT ?auto_1258 ?auto_1257 ) ( AVAILABLE ?auto_1258 ) ( SURFACE-AT ?auto_1252 ?auto_1257 ) ( ON ?auto_1252 ?auto_1259 ) ( CLEAR ?auto_1252 ) ( TRUCK-AT ?auto_1256 ?auto_1255 ) ( not ( = ?auto_1252 ?auto_1253 ) ) ( not ( = ?auto_1252 ?auto_1259 ) ) ( not ( = ?auto_1253 ?auto_1259 ) ) ( not ( = ?auto_1254 ?auto_1258 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1256 ?auto_1255 ?auto_1257 )
      ( !LIFT ?auto_1258 ?auto_1252 ?auto_1259 ?auto_1257 )
      ( !LOAD ?auto_1258 ?auto_1252 ?auto_1256 ?auto_1257 )
      ( !DRIVE ?auto_1256 ?auto_1257 ?auto_1255 )
      ( !UNLOAD ?auto_1254 ?auto_1252 ?auto_1256 ?auto_1255 )
      ( !DROP ?auto_1254 ?auto_1252 ?auto_1253 ?auto_1255 )
      ( MAKE-ON-VERIFY ?auto_1252 ?auto_1253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1262 - SURFACE
      ?auto_1263 - SURFACE
    )
    :vars
    (
      ?auto_1264 - HOIST
      ?auto_1265 - PLACE
      ?auto_1267 - PLACE
      ?auto_1268 - HOIST
      ?auto_1269 - SURFACE
      ?auto_1266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1264 ?auto_1265 ) ( SURFACE-AT ?auto_1263 ?auto_1265 ) ( CLEAR ?auto_1263 ) ( IS-CRATE ?auto_1262 ) ( AVAILABLE ?auto_1264 ) ( not ( = ?auto_1267 ?auto_1265 ) ) ( HOIST-AT ?auto_1268 ?auto_1267 ) ( AVAILABLE ?auto_1268 ) ( SURFACE-AT ?auto_1262 ?auto_1267 ) ( ON ?auto_1262 ?auto_1269 ) ( CLEAR ?auto_1262 ) ( TRUCK-AT ?auto_1266 ?auto_1265 ) ( not ( = ?auto_1262 ?auto_1263 ) ) ( not ( = ?auto_1262 ?auto_1269 ) ) ( not ( = ?auto_1263 ?auto_1269 ) ) ( not ( = ?auto_1264 ?auto_1268 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1266 ?auto_1265 ?auto_1267 )
      ( !LIFT ?auto_1268 ?auto_1262 ?auto_1269 ?auto_1267 )
      ( !LOAD ?auto_1268 ?auto_1262 ?auto_1266 ?auto_1267 )
      ( !DRIVE ?auto_1266 ?auto_1267 ?auto_1265 )
      ( !UNLOAD ?auto_1264 ?auto_1262 ?auto_1266 ?auto_1265 )
      ( !DROP ?auto_1264 ?auto_1262 ?auto_1263 ?auto_1265 )
      ( MAKE-ON-VERIFY ?auto_1262 ?auto_1263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1272 - SURFACE
      ?auto_1273 - SURFACE
    )
    :vars
    (
      ?auto_1274 - HOIST
      ?auto_1275 - PLACE
      ?auto_1277 - PLACE
      ?auto_1278 - HOIST
      ?auto_1279 - SURFACE
      ?auto_1276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1274 ?auto_1275 ) ( SURFACE-AT ?auto_1273 ?auto_1275 ) ( CLEAR ?auto_1273 ) ( IS-CRATE ?auto_1272 ) ( AVAILABLE ?auto_1274 ) ( not ( = ?auto_1277 ?auto_1275 ) ) ( HOIST-AT ?auto_1278 ?auto_1277 ) ( AVAILABLE ?auto_1278 ) ( SURFACE-AT ?auto_1272 ?auto_1277 ) ( ON ?auto_1272 ?auto_1279 ) ( CLEAR ?auto_1272 ) ( TRUCK-AT ?auto_1276 ?auto_1275 ) ( not ( = ?auto_1272 ?auto_1273 ) ) ( not ( = ?auto_1272 ?auto_1279 ) ) ( not ( = ?auto_1273 ?auto_1279 ) ) ( not ( = ?auto_1274 ?auto_1278 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1276 ?auto_1275 ?auto_1277 )
      ( !LIFT ?auto_1278 ?auto_1272 ?auto_1279 ?auto_1277 )
      ( !LOAD ?auto_1278 ?auto_1272 ?auto_1276 ?auto_1277 )
      ( !DRIVE ?auto_1276 ?auto_1277 ?auto_1275 )
      ( !UNLOAD ?auto_1274 ?auto_1272 ?auto_1276 ?auto_1275 )
      ( !DROP ?auto_1274 ?auto_1272 ?auto_1273 ?auto_1275 )
      ( MAKE-ON-VERIFY ?auto_1272 ?auto_1273 ) )
  )

)

