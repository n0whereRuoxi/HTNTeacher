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
      ?auto_1142 - SURFACE
      ?auto_1143 - SURFACE
    )
    :vars
    (
      ?auto_1144 - HOIST
      ?auto_1145 - PLACE
      ?auto_1147 - PLACE
      ?auto_1148 - HOIST
      ?auto_1149 - SURFACE
      ?auto_1146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1144 ?auto_1145 ) ( SURFACE-AT ?auto_1143 ?auto_1145 ) ( CLEAR ?auto_1143 ) ( IS-CRATE ?auto_1142 ) ( AVAILABLE ?auto_1144 ) ( not ( = ?auto_1147 ?auto_1145 ) ) ( HOIST-AT ?auto_1148 ?auto_1147 ) ( AVAILABLE ?auto_1148 ) ( SURFACE-AT ?auto_1142 ?auto_1147 ) ( ON ?auto_1142 ?auto_1149 ) ( CLEAR ?auto_1142 ) ( TRUCK-AT ?auto_1146 ?auto_1145 ) ( not ( = ?auto_1142 ?auto_1143 ) ) ( not ( = ?auto_1142 ?auto_1149 ) ) ( not ( = ?auto_1143 ?auto_1149 ) ) ( not ( = ?auto_1144 ?auto_1148 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1146 ?auto_1145 ?auto_1147 )
      ( !LIFT ?auto_1148 ?auto_1142 ?auto_1149 ?auto_1147 )
      ( !LOAD ?auto_1148 ?auto_1142 ?auto_1146 ?auto_1147 )
      ( !DRIVE ?auto_1146 ?auto_1147 ?auto_1145 )
      ( !UNLOAD ?auto_1144 ?auto_1142 ?auto_1146 ?auto_1145 )
      ( !DROP ?auto_1144 ?auto_1142 ?auto_1143 ?auto_1145 )
      ( MAKE-ON-VERIFY ?auto_1142 ?auto_1143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1152 - SURFACE
      ?auto_1153 - SURFACE
    )
    :vars
    (
      ?auto_1154 - HOIST
      ?auto_1155 - PLACE
      ?auto_1157 - PLACE
      ?auto_1158 - HOIST
      ?auto_1159 - SURFACE
      ?auto_1156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1154 ?auto_1155 ) ( SURFACE-AT ?auto_1153 ?auto_1155 ) ( CLEAR ?auto_1153 ) ( IS-CRATE ?auto_1152 ) ( AVAILABLE ?auto_1154 ) ( not ( = ?auto_1157 ?auto_1155 ) ) ( HOIST-AT ?auto_1158 ?auto_1157 ) ( AVAILABLE ?auto_1158 ) ( SURFACE-AT ?auto_1152 ?auto_1157 ) ( ON ?auto_1152 ?auto_1159 ) ( CLEAR ?auto_1152 ) ( TRUCK-AT ?auto_1156 ?auto_1155 ) ( not ( = ?auto_1152 ?auto_1153 ) ) ( not ( = ?auto_1152 ?auto_1159 ) ) ( not ( = ?auto_1153 ?auto_1159 ) ) ( not ( = ?auto_1154 ?auto_1158 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1156 ?auto_1155 ?auto_1157 )
      ( !LIFT ?auto_1158 ?auto_1152 ?auto_1159 ?auto_1157 )
      ( !LOAD ?auto_1158 ?auto_1152 ?auto_1156 ?auto_1157 )
      ( !DRIVE ?auto_1156 ?auto_1157 ?auto_1155 )
      ( !UNLOAD ?auto_1154 ?auto_1152 ?auto_1156 ?auto_1155 )
      ( !DROP ?auto_1154 ?auto_1152 ?auto_1153 ?auto_1155 )
      ( MAKE-ON-VERIFY ?auto_1152 ?auto_1153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1162 - SURFACE
      ?auto_1163 - SURFACE
    )
    :vars
    (
      ?auto_1164 - HOIST
      ?auto_1165 - PLACE
      ?auto_1167 - PLACE
      ?auto_1168 - HOIST
      ?auto_1169 - SURFACE
      ?auto_1166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1164 ?auto_1165 ) ( SURFACE-AT ?auto_1163 ?auto_1165 ) ( CLEAR ?auto_1163 ) ( IS-CRATE ?auto_1162 ) ( AVAILABLE ?auto_1164 ) ( not ( = ?auto_1167 ?auto_1165 ) ) ( HOIST-AT ?auto_1168 ?auto_1167 ) ( AVAILABLE ?auto_1168 ) ( SURFACE-AT ?auto_1162 ?auto_1167 ) ( ON ?auto_1162 ?auto_1169 ) ( CLEAR ?auto_1162 ) ( TRUCK-AT ?auto_1166 ?auto_1165 ) ( not ( = ?auto_1162 ?auto_1163 ) ) ( not ( = ?auto_1162 ?auto_1169 ) ) ( not ( = ?auto_1163 ?auto_1169 ) ) ( not ( = ?auto_1164 ?auto_1168 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1166 ?auto_1165 ?auto_1167 )
      ( !LIFT ?auto_1168 ?auto_1162 ?auto_1169 ?auto_1167 )
      ( !LOAD ?auto_1168 ?auto_1162 ?auto_1166 ?auto_1167 )
      ( !DRIVE ?auto_1166 ?auto_1167 ?auto_1165 )
      ( !UNLOAD ?auto_1164 ?auto_1162 ?auto_1166 ?auto_1165 )
      ( !DROP ?auto_1164 ?auto_1162 ?auto_1163 ?auto_1165 )
      ( MAKE-ON-VERIFY ?auto_1162 ?auto_1163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1172 - SURFACE
      ?auto_1173 - SURFACE
    )
    :vars
    (
      ?auto_1174 - HOIST
      ?auto_1175 - PLACE
      ?auto_1177 - PLACE
      ?auto_1178 - HOIST
      ?auto_1179 - SURFACE
      ?auto_1176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174 ?auto_1175 ) ( SURFACE-AT ?auto_1173 ?auto_1175 ) ( CLEAR ?auto_1173 ) ( IS-CRATE ?auto_1172 ) ( AVAILABLE ?auto_1174 ) ( not ( = ?auto_1177 ?auto_1175 ) ) ( HOIST-AT ?auto_1178 ?auto_1177 ) ( AVAILABLE ?auto_1178 ) ( SURFACE-AT ?auto_1172 ?auto_1177 ) ( ON ?auto_1172 ?auto_1179 ) ( CLEAR ?auto_1172 ) ( TRUCK-AT ?auto_1176 ?auto_1175 ) ( not ( = ?auto_1172 ?auto_1173 ) ) ( not ( = ?auto_1172 ?auto_1179 ) ) ( not ( = ?auto_1173 ?auto_1179 ) ) ( not ( = ?auto_1174 ?auto_1178 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1176 ?auto_1175 ?auto_1177 )
      ( !LIFT ?auto_1178 ?auto_1172 ?auto_1179 ?auto_1177 )
      ( !LOAD ?auto_1178 ?auto_1172 ?auto_1176 ?auto_1177 )
      ( !DRIVE ?auto_1176 ?auto_1177 ?auto_1175 )
      ( !UNLOAD ?auto_1174 ?auto_1172 ?auto_1176 ?auto_1175 )
      ( !DROP ?auto_1174 ?auto_1172 ?auto_1173 ?auto_1175 )
      ( MAKE-ON-VERIFY ?auto_1172 ?auto_1173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1182 - SURFACE
      ?auto_1183 - SURFACE
    )
    :vars
    (
      ?auto_1184 - HOIST
      ?auto_1185 - PLACE
      ?auto_1187 - PLACE
      ?auto_1188 - HOIST
      ?auto_1189 - SURFACE
      ?auto_1186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1184 ?auto_1185 ) ( SURFACE-AT ?auto_1183 ?auto_1185 ) ( CLEAR ?auto_1183 ) ( IS-CRATE ?auto_1182 ) ( AVAILABLE ?auto_1184 ) ( not ( = ?auto_1187 ?auto_1185 ) ) ( HOIST-AT ?auto_1188 ?auto_1187 ) ( AVAILABLE ?auto_1188 ) ( SURFACE-AT ?auto_1182 ?auto_1187 ) ( ON ?auto_1182 ?auto_1189 ) ( CLEAR ?auto_1182 ) ( TRUCK-AT ?auto_1186 ?auto_1185 ) ( not ( = ?auto_1182 ?auto_1183 ) ) ( not ( = ?auto_1182 ?auto_1189 ) ) ( not ( = ?auto_1183 ?auto_1189 ) ) ( not ( = ?auto_1184 ?auto_1188 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1186 ?auto_1185 ?auto_1187 )
      ( !LIFT ?auto_1188 ?auto_1182 ?auto_1189 ?auto_1187 )
      ( !LOAD ?auto_1188 ?auto_1182 ?auto_1186 ?auto_1187 )
      ( !DRIVE ?auto_1186 ?auto_1187 ?auto_1185 )
      ( !UNLOAD ?auto_1184 ?auto_1182 ?auto_1186 ?auto_1185 )
      ( !DROP ?auto_1184 ?auto_1182 ?auto_1183 ?auto_1185 )
      ( MAKE-ON-VERIFY ?auto_1182 ?auto_1183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1192 - SURFACE
      ?auto_1193 - SURFACE
    )
    :vars
    (
      ?auto_1194 - HOIST
      ?auto_1195 - PLACE
      ?auto_1197 - PLACE
      ?auto_1198 - HOIST
      ?auto_1199 - SURFACE
      ?auto_1196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194 ?auto_1195 ) ( SURFACE-AT ?auto_1193 ?auto_1195 ) ( CLEAR ?auto_1193 ) ( IS-CRATE ?auto_1192 ) ( AVAILABLE ?auto_1194 ) ( not ( = ?auto_1197 ?auto_1195 ) ) ( HOIST-AT ?auto_1198 ?auto_1197 ) ( AVAILABLE ?auto_1198 ) ( SURFACE-AT ?auto_1192 ?auto_1197 ) ( ON ?auto_1192 ?auto_1199 ) ( CLEAR ?auto_1192 ) ( TRUCK-AT ?auto_1196 ?auto_1195 ) ( not ( = ?auto_1192 ?auto_1193 ) ) ( not ( = ?auto_1192 ?auto_1199 ) ) ( not ( = ?auto_1193 ?auto_1199 ) ) ( not ( = ?auto_1194 ?auto_1198 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1196 ?auto_1195 ?auto_1197 )
      ( !LIFT ?auto_1198 ?auto_1192 ?auto_1199 ?auto_1197 )
      ( !LOAD ?auto_1198 ?auto_1192 ?auto_1196 ?auto_1197 )
      ( !DRIVE ?auto_1196 ?auto_1197 ?auto_1195 )
      ( !UNLOAD ?auto_1194 ?auto_1192 ?auto_1196 ?auto_1195 )
      ( !DROP ?auto_1194 ?auto_1192 ?auto_1193 ?auto_1195 )
      ( MAKE-ON-VERIFY ?auto_1192 ?auto_1193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1202 - SURFACE
      ?auto_1203 - SURFACE
    )
    :vars
    (
      ?auto_1204 - HOIST
      ?auto_1205 - PLACE
      ?auto_1207 - PLACE
      ?auto_1208 - HOIST
      ?auto_1209 - SURFACE
      ?auto_1206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1204 ?auto_1205 ) ( SURFACE-AT ?auto_1203 ?auto_1205 ) ( CLEAR ?auto_1203 ) ( IS-CRATE ?auto_1202 ) ( AVAILABLE ?auto_1204 ) ( not ( = ?auto_1207 ?auto_1205 ) ) ( HOIST-AT ?auto_1208 ?auto_1207 ) ( AVAILABLE ?auto_1208 ) ( SURFACE-AT ?auto_1202 ?auto_1207 ) ( ON ?auto_1202 ?auto_1209 ) ( CLEAR ?auto_1202 ) ( TRUCK-AT ?auto_1206 ?auto_1205 ) ( not ( = ?auto_1202 ?auto_1203 ) ) ( not ( = ?auto_1202 ?auto_1209 ) ) ( not ( = ?auto_1203 ?auto_1209 ) ) ( not ( = ?auto_1204 ?auto_1208 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1206 ?auto_1205 ?auto_1207 )
      ( !LIFT ?auto_1208 ?auto_1202 ?auto_1209 ?auto_1207 )
      ( !LOAD ?auto_1208 ?auto_1202 ?auto_1206 ?auto_1207 )
      ( !DRIVE ?auto_1206 ?auto_1207 ?auto_1205 )
      ( !UNLOAD ?auto_1204 ?auto_1202 ?auto_1206 ?auto_1205 )
      ( !DROP ?auto_1204 ?auto_1202 ?auto_1203 ?auto_1205 )
      ( MAKE-ON-VERIFY ?auto_1202 ?auto_1203 ) )
  )

)

