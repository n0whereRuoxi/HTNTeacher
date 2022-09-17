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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1104 - SURFACE
      ?auto_1105 - SURFACE
    )
    :vars
    (
      ?auto_1106 - HOIST
      ?auto_1107 - PLACE
      ?auto_1109 - PLACE
      ?auto_1110 - HOIST
      ?auto_1111 - SURFACE
      ?auto_1108 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1106 ?auto_1107 ) ( SURFACE-AT ?auto_1104 ?auto_1107 ) ( CLEAR ?auto_1104 ) ( IS-CRATE ?auto_1105 ) ( AVAILABLE ?auto_1106 ) ( not ( = ?auto_1109 ?auto_1107 ) ) ( HOIST-AT ?auto_1110 ?auto_1109 ) ( AVAILABLE ?auto_1110 ) ( SURFACE-AT ?auto_1105 ?auto_1109 ) ( ON ?auto_1105 ?auto_1111 ) ( CLEAR ?auto_1105 ) ( TRUCK-AT ?auto_1108 ?auto_1107 ) ( not ( = ?auto_1104 ?auto_1105 ) ) ( not ( = ?auto_1104 ?auto_1111 ) ) ( not ( = ?auto_1105 ?auto_1111 ) ) ( not ( = ?auto_1106 ?auto_1110 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1108 ?auto_1107 ?auto_1109 )
      ( !LIFT ?auto_1110 ?auto_1105 ?auto_1111 ?auto_1109 )
      ( !LOAD ?auto_1110 ?auto_1105 ?auto_1108 ?auto_1109 )
      ( !DRIVE ?auto_1108 ?auto_1109 ?auto_1107 )
      ( !UNLOAD ?auto_1106 ?auto_1105 ?auto_1108 ?auto_1107 )
      ( !DROP ?auto_1106 ?auto_1105 ?auto_1104 ?auto_1107 )
      ( MAKE-1CRATE-VERIFY ?auto_1104 ?auto_1105 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1125 - SURFACE
      ?auto_1126 - SURFACE
      ?auto_1127 - SURFACE
    )
    :vars
    (
      ?auto_1128 - HOIST
      ?auto_1133 - PLACE
      ?auto_1129 - PLACE
      ?auto_1130 - HOIST
      ?auto_1131 - SURFACE
      ?auto_1135 - PLACE
      ?auto_1136 - HOIST
      ?auto_1134 - SURFACE
      ?auto_1132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128 ?auto_1133 ) ( IS-CRATE ?auto_1127 ) ( not ( = ?auto_1129 ?auto_1133 ) ) ( HOIST-AT ?auto_1130 ?auto_1129 ) ( AVAILABLE ?auto_1130 ) ( SURFACE-AT ?auto_1127 ?auto_1129 ) ( ON ?auto_1127 ?auto_1131 ) ( CLEAR ?auto_1127 ) ( not ( = ?auto_1126 ?auto_1127 ) ) ( not ( = ?auto_1126 ?auto_1131 ) ) ( not ( = ?auto_1127 ?auto_1131 ) ) ( not ( = ?auto_1128 ?auto_1130 ) ) ( SURFACE-AT ?auto_1125 ?auto_1133 ) ( CLEAR ?auto_1125 ) ( IS-CRATE ?auto_1126 ) ( AVAILABLE ?auto_1128 ) ( not ( = ?auto_1135 ?auto_1133 ) ) ( HOIST-AT ?auto_1136 ?auto_1135 ) ( AVAILABLE ?auto_1136 ) ( SURFACE-AT ?auto_1126 ?auto_1135 ) ( ON ?auto_1126 ?auto_1134 ) ( CLEAR ?auto_1126 ) ( TRUCK-AT ?auto_1132 ?auto_1133 ) ( not ( = ?auto_1125 ?auto_1126 ) ) ( not ( = ?auto_1125 ?auto_1134 ) ) ( not ( = ?auto_1126 ?auto_1134 ) ) ( not ( = ?auto_1128 ?auto_1136 ) ) ( not ( = ?auto_1125 ?auto_1127 ) ) ( not ( = ?auto_1125 ?auto_1131 ) ) ( not ( = ?auto_1127 ?auto_1134 ) ) ( not ( = ?auto_1129 ?auto_1135 ) ) ( not ( = ?auto_1130 ?auto_1136 ) ) ( not ( = ?auto_1131 ?auto_1134 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1125 ?auto_1126 )
      ( MAKE-1CRATE ?auto_1126 ?auto_1127 )
      ( MAKE-2CRATE-VERIFY ?auto_1125 ?auto_1126 ?auto_1127 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1151 - SURFACE
      ?auto_1152 - SURFACE
      ?auto_1153 - SURFACE
      ?auto_1154 - SURFACE
    )
    :vars
    (
      ?auto_1160 - HOIST
      ?auto_1157 - PLACE
      ?auto_1159 - PLACE
      ?auto_1155 - HOIST
      ?auto_1158 - SURFACE
      ?auto_1162 - PLACE
      ?auto_1163 - HOIST
      ?auto_1161 - SURFACE
      ?auto_1166 - PLACE
      ?auto_1164 - HOIST
      ?auto_1165 - SURFACE
      ?auto_1156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1160 ?auto_1157 ) ( IS-CRATE ?auto_1154 ) ( not ( = ?auto_1159 ?auto_1157 ) ) ( HOIST-AT ?auto_1155 ?auto_1159 ) ( AVAILABLE ?auto_1155 ) ( SURFACE-AT ?auto_1154 ?auto_1159 ) ( ON ?auto_1154 ?auto_1158 ) ( CLEAR ?auto_1154 ) ( not ( = ?auto_1153 ?auto_1154 ) ) ( not ( = ?auto_1153 ?auto_1158 ) ) ( not ( = ?auto_1154 ?auto_1158 ) ) ( not ( = ?auto_1160 ?auto_1155 ) ) ( IS-CRATE ?auto_1153 ) ( not ( = ?auto_1162 ?auto_1157 ) ) ( HOIST-AT ?auto_1163 ?auto_1162 ) ( AVAILABLE ?auto_1163 ) ( SURFACE-AT ?auto_1153 ?auto_1162 ) ( ON ?auto_1153 ?auto_1161 ) ( CLEAR ?auto_1153 ) ( not ( = ?auto_1152 ?auto_1153 ) ) ( not ( = ?auto_1152 ?auto_1161 ) ) ( not ( = ?auto_1153 ?auto_1161 ) ) ( not ( = ?auto_1160 ?auto_1163 ) ) ( SURFACE-AT ?auto_1151 ?auto_1157 ) ( CLEAR ?auto_1151 ) ( IS-CRATE ?auto_1152 ) ( AVAILABLE ?auto_1160 ) ( not ( = ?auto_1166 ?auto_1157 ) ) ( HOIST-AT ?auto_1164 ?auto_1166 ) ( AVAILABLE ?auto_1164 ) ( SURFACE-AT ?auto_1152 ?auto_1166 ) ( ON ?auto_1152 ?auto_1165 ) ( CLEAR ?auto_1152 ) ( TRUCK-AT ?auto_1156 ?auto_1157 ) ( not ( = ?auto_1151 ?auto_1152 ) ) ( not ( = ?auto_1151 ?auto_1165 ) ) ( not ( = ?auto_1152 ?auto_1165 ) ) ( not ( = ?auto_1160 ?auto_1164 ) ) ( not ( = ?auto_1151 ?auto_1153 ) ) ( not ( = ?auto_1151 ?auto_1161 ) ) ( not ( = ?auto_1153 ?auto_1165 ) ) ( not ( = ?auto_1162 ?auto_1166 ) ) ( not ( = ?auto_1163 ?auto_1164 ) ) ( not ( = ?auto_1161 ?auto_1165 ) ) ( not ( = ?auto_1151 ?auto_1154 ) ) ( not ( = ?auto_1151 ?auto_1158 ) ) ( not ( = ?auto_1152 ?auto_1154 ) ) ( not ( = ?auto_1152 ?auto_1158 ) ) ( not ( = ?auto_1154 ?auto_1161 ) ) ( not ( = ?auto_1154 ?auto_1165 ) ) ( not ( = ?auto_1159 ?auto_1162 ) ) ( not ( = ?auto_1159 ?auto_1166 ) ) ( not ( = ?auto_1155 ?auto_1163 ) ) ( not ( = ?auto_1155 ?auto_1164 ) ) ( not ( = ?auto_1158 ?auto_1161 ) ) ( not ( = ?auto_1158 ?auto_1165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1151 ?auto_1152 ?auto_1153 )
      ( MAKE-1CRATE ?auto_1153 ?auto_1154 )
      ( MAKE-3CRATE-VERIFY ?auto_1151 ?auto_1152 ?auto_1153 ?auto_1154 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1182 - SURFACE
      ?auto_1183 - SURFACE
      ?auto_1184 - SURFACE
      ?auto_1185 - SURFACE
      ?auto_1186 - SURFACE
    )
    :vars
    (
      ?auto_1190 - HOIST
      ?auto_1192 - PLACE
      ?auto_1191 - PLACE
      ?auto_1187 - HOIST
      ?auto_1189 - SURFACE
      ?auto_1199 - SURFACE
      ?auto_1194 - PLACE
      ?auto_1196 - HOIST
      ?auto_1193 - SURFACE
      ?auto_1195 - PLACE
      ?auto_1198 - HOIST
      ?auto_1197 - SURFACE
      ?auto_1188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1190 ?auto_1192 ) ( IS-CRATE ?auto_1186 ) ( not ( = ?auto_1191 ?auto_1192 ) ) ( HOIST-AT ?auto_1187 ?auto_1191 ) ( SURFACE-AT ?auto_1186 ?auto_1191 ) ( ON ?auto_1186 ?auto_1189 ) ( CLEAR ?auto_1186 ) ( not ( = ?auto_1185 ?auto_1186 ) ) ( not ( = ?auto_1185 ?auto_1189 ) ) ( not ( = ?auto_1186 ?auto_1189 ) ) ( not ( = ?auto_1190 ?auto_1187 ) ) ( IS-CRATE ?auto_1185 ) ( AVAILABLE ?auto_1187 ) ( SURFACE-AT ?auto_1185 ?auto_1191 ) ( ON ?auto_1185 ?auto_1199 ) ( CLEAR ?auto_1185 ) ( not ( = ?auto_1184 ?auto_1185 ) ) ( not ( = ?auto_1184 ?auto_1199 ) ) ( not ( = ?auto_1185 ?auto_1199 ) ) ( IS-CRATE ?auto_1184 ) ( not ( = ?auto_1194 ?auto_1192 ) ) ( HOIST-AT ?auto_1196 ?auto_1194 ) ( AVAILABLE ?auto_1196 ) ( SURFACE-AT ?auto_1184 ?auto_1194 ) ( ON ?auto_1184 ?auto_1193 ) ( CLEAR ?auto_1184 ) ( not ( = ?auto_1183 ?auto_1184 ) ) ( not ( = ?auto_1183 ?auto_1193 ) ) ( not ( = ?auto_1184 ?auto_1193 ) ) ( not ( = ?auto_1190 ?auto_1196 ) ) ( SURFACE-AT ?auto_1182 ?auto_1192 ) ( CLEAR ?auto_1182 ) ( IS-CRATE ?auto_1183 ) ( AVAILABLE ?auto_1190 ) ( not ( = ?auto_1195 ?auto_1192 ) ) ( HOIST-AT ?auto_1198 ?auto_1195 ) ( AVAILABLE ?auto_1198 ) ( SURFACE-AT ?auto_1183 ?auto_1195 ) ( ON ?auto_1183 ?auto_1197 ) ( CLEAR ?auto_1183 ) ( TRUCK-AT ?auto_1188 ?auto_1192 ) ( not ( = ?auto_1182 ?auto_1183 ) ) ( not ( = ?auto_1182 ?auto_1197 ) ) ( not ( = ?auto_1183 ?auto_1197 ) ) ( not ( = ?auto_1190 ?auto_1198 ) ) ( not ( = ?auto_1182 ?auto_1184 ) ) ( not ( = ?auto_1182 ?auto_1193 ) ) ( not ( = ?auto_1184 ?auto_1197 ) ) ( not ( = ?auto_1194 ?auto_1195 ) ) ( not ( = ?auto_1196 ?auto_1198 ) ) ( not ( = ?auto_1193 ?auto_1197 ) ) ( not ( = ?auto_1182 ?auto_1185 ) ) ( not ( = ?auto_1182 ?auto_1199 ) ) ( not ( = ?auto_1183 ?auto_1185 ) ) ( not ( = ?auto_1183 ?auto_1199 ) ) ( not ( = ?auto_1185 ?auto_1193 ) ) ( not ( = ?auto_1185 ?auto_1197 ) ) ( not ( = ?auto_1191 ?auto_1194 ) ) ( not ( = ?auto_1191 ?auto_1195 ) ) ( not ( = ?auto_1187 ?auto_1196 ) ) ( not ( = ?auto_1187 ?auto_1198 ) ) ( not ( = ?auto_1199 ?auto_1193 ) ) ( not ( = ?auto_1199 ?auto_1197 ) ) ( not ( = ?auto_1182 ?auto_1186 ) ) ( not ( = ?auto_1182 ?auto_1189 ) ) ( not ( = ?auto_1183 ?auto_1186 ) ) ( not ( = ?auto_1183 ?auto_1189 ) ) ( not ( = ?auto_1184 ?auto_1186 ) ) ( not ( = ?auto_1184 ?auto_1189 ) ) ( not ( = ?auto_1186 ?auto_1199 ) ) ( not ( = ?auto_1186 ?auto_1193 ) ) ( not ( = ?auto_1186 ?auto_1197 ) ) ( not ( = ?auto_1189 ?auto_1199 ) ) ( not ( = ?auto_1189 ?auto_1193 ) ) ( not ( = ?auto_1189 ?auto_1197 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1182 ?auto_1183 ?auto_1184 ?auto_1185 )
      ( MAKE-1CRATE ?auto_1185 ?auto_1186 )
      ( MAKE-4CRATE-VERIFY ?auto_1182 ?auto_1183 ?auto_1184 ?auto_1185 ?auto_1186 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1216 - SURFACE
      ?auto_1217 - SURFACE
      ?auto_1218 - SURFACE
      ?auto_1219 - SURFACE
      ?auto_1220 - SURFACE
      ?auto_1221 - SURFACE
    )
    :vars
    (
      ?auto_1227 - HOIST
      ?auto_1223 - PLACE
      ?auto_1225 - PLACE
      ?auto_1224 - HOIST
      ?auto_1222 - SURFACE
      ?auto_1237 - PLACE
      ?auto_1229 - HOIST
      ?auto_1234 - SURFACE
      ?auto_1233 - SURFACE
      ?auto_1230 - PLACE
      ?auto_1232 - HOIST
      ?auto_1235 - SURFACE
      ?auto_1236 - PLACE
      ?auto_1228 - HOIST
      ?auto_1231 - SURFACE
      ?auto_1226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1227 ?auto_1223 ) ( IS-CRATE ?auto_1221 ) ( not ( = ?auto_1225 ?auto_1223 ) ) ( HOIST-AT ?auto_1224 ?auto_1225 ) ( AVAILABLE ?auto_1224 ) ( SURFACE-AT ?auto_1221 ?auto_1225 ) ( ON ?auto_1221 ?auto_1222 ) ( CLEAR ?auto_1221 ) ( not ( = ?auto_1220 ?auto_1221 ) ) ( not ( = ?auto_1220 ?auto_1222 ) ) ( not ( = ?auto_1221 ?auto_1222 ) ) ( not ( = ?auto_1227 ?auto_1224 ) ) ( IS-CRATE ?auto_1220 ) ( not ( = ?auto_1237 ?auto_1223 ) ) ( HOIST-AT ?auto_1229 ?auto_1237 ) ( SURFACE-AT ?auto_1220 ?auto_1237 ) ( ON ?auto_1220 ?auto_1234 ) ( CLEAR ?auto_1220 ) ( not ( = ?auto_1219 ?auto_1220 ) ) ( not ( = ?auto_1219 ?auto_1234 ) ) ( not ( = ?auto_1220 ?auto_1234 ) ) ( not ( = ?auto_1227 ?auto_1229 ) ) ( IS-CRATE ?auto_1219 ) ( AVAILABLE ?auto_1229 ) ( SURFACE-AT ?auto_1219 ?auto_1237 ) ( ON ?auto_1219 ?auto_1233 ) ( CLEAR ?auto_1219 ) ( not ( = ?auto_1218 ?auto_1219 ) ) ( not ( = ?auto_1218 ?auto_1233 ) ) ( not ( = ?auto_1219 ?auto_1233 ) ) ( IS-CRATE ?auto_1218 ) ( not ( = ?auto_1230 ?auto_1223 ) ) ( HOIST-AT ?auto_1232 ?auto_1230 ) ( AVAILABLE ?auto_1232 ) ( SURFACE-AT ?auto_1218 ?auto_1230 ) ( ON ?auto_1218 ?auto_1235 ) ( CLEAR ?auto_1218 ) ( not ( = ?auto_1217 ?auto_1218 ) ) ( not ( = ?auto_1217 ?auto_1235 ) ) ( not ( = ?auto_1218 ?auto_1235 ) ) ( not ( = ?auto_1227 ?auto_1232 ) ) ( SURFACE-AT ?auto_1216 ?auto_1223 ) ( CLEAR ?auto_1216 ) ( IS-CRATE ?auto_1217 ) ( AVAILABLE ?auto_1227 ) ( not ( = ?auto_1236 ?auto_1223 ) ) ( HOIST-AT ?auto_1228 ?auto_1236 ) ( AVAILABLE ?auto_1228 ) ( SURFACE-AT ?auto_1217 ?auto_1236 ) ( ON ?auto_1217 ?auto_1231 ) ( CLEAR ?auto_1217 ) ( TRUCK-AT ?auto_1226 ?auto_1223 ) ( not ( = ?auto_1216 ?auto_1217 ) ) ( not ( = ?auto_1216 ?auto_1231 ) ) ( not ( = ?auto_1217 ?auto_1231 ) ) ( not ( = ?auto_1227 ?auto_1228 ) ) ( not ( = ?auto_1216 ?auto_1218 ) ) ( not ( = ?auto_1216 ?auto_1235 ) ) ( not ( = ?auto_1218 ?auto_1231 ) ) ( not ( = ?auto_1230 ?auto_1236 ) ) ( not ( = ?auto_1232 ?auto_1228 ) ) ( not ( = ?auto_1235 ?auto_1231 ) ) ( not ( = ?auto_1216 ?auto_1219 ) ) ( not ( = ?auto_1216 ?auto_1233 ) ) ( not ( = ?auto_1217 ?auto_1219 ) ) ( not ( = ?auto_1217 ?auto_1233 ) ) ( not ( = ?auto_1219 ?auto_1235 ) ) ( not ( = ?auto_1219 ?auto_1231 ) ) ( not ( = ?auto_1237 ?auto_1230 ) ) ( not ( = ?auto_1237 ?auto_1236 ) ) ( not ( = ?auto_1229 ?auto_1232 ) ) ( not ( = ?auto_1229 ?auto_1228 ) ) ( not ( = ?auto_1233 ?auto_1235 ) ) ( not ( = ?auto_1233 ?auto_1231 ) ) ( not ( = ?auto_1216 ?auto_1220 ) ) ( not ( = ?auto_1216 ?auto_1234 ) ) ( not ( = ?auto_1217 ?auto_1220 ) ) ( not ( = ?auto_1217 ?auto_1234 ) ) ( not ( = ?auto_1218 ?auto_1220 ) ) ( not ( = ?auto_1218 ?auto_1234 ) ) ( not ( = ?auto_1220 ?auto_1233 ) ) ( not ( = ?auto_1220 ?auto_1235 ) ) ( not ( = ?auto_1220 ?auto_1231 ) ) ( not ( = ?auto_1234 ?auto_1233 ) ) ( not ( = ?auto_1234 ?auto_1235 ) ) ( not ( = ?auto_1234 ?auto_1231 ) ) ( not ( = ?auto_1216 ?auto_1221 ) ) ( not ( = ?auto_1216 ?auto_1222 ) ) ( not ( = ?auto_1217 ?auto_1221 ) ) ( not ( = ?auto_1217 ?auto_1222 ) ) ( not ( = ?auto_1218 ?auto_1221 ) ) ( not ( = ?auto_1218 ?auto_1222 ) ) ( not ( = ?auto_1219 ?auto_1221 ) ) ( not ( = ?auto_1219 ?auto_1222 ) ) ( not ( = ?auto_1221 ?auto_1234 ) ) ( not ( = ?auto_1221 ?auto_1233 ) ) ( not ( = ?auto_1221 ?auto_1235 ) ) ( not ( = ?auto_1221 ?auto_1231 ) ) ( not ( = ?auto_1225 ?auto_1237 ) ) ( not ( = ?auto_1225 ?auto_1230 ) ) ( not ( = ?auto_1225 ?auto_1236 ) ) ( not ( = ?auto_1224 ?auto_1229 ) ) ( not ( = ?auto_1224 ?auto_1232 ) ) ( not ( = ?auto_1224 ?auto_1228 ) ) ( not ( = ?auto_1222 ?auto_1234 ) ) ( not ( = ?auto_1222 ?auto_1233 ) ) ( not ( = ?auto_1222 ?auto_1235 ) ) ( not ( = ?auto_1222 ?auto_1231 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1216 ?auto_1217 ?auto_1218 ?auto_1219 ?auto_1220 )
      ( MAKE-1CRATE ?auto_1220 ?auto_1221 )
      ( MAKE-5CRATE-VERIFY ?auto_1216 ?auto_1217 ?auto_1218 ?auto_1219 ?auto_1220 ?auto_1221 ) )
  )

)

