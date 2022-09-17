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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1114 - SURFACE
      ?auto_1115 - SURFACE
    )
    :vars
    (
      ?auto_1116 - HOIST
      ?auto_1117 - PLACE
      ?auto_1119 - PLACE
      ?auto_1120 - HOIST
      ?auto_1121 - SURFACE
      ?auto_1118 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1116 ?auto_1117 ) ( SURFACE-AT ?auto_1114 ?auto_1117 ) ( CLEAR ?auto_1114 ) ( IS-CRATE ?auto_1115 ) ( AVAILABLE ?auto_1116 ) ( not ( = ?auto_1119 ?auto_1117 ) ) ( HOIST-AT ?auto_1120 ?auto_1119 ) ( AVAILABLE ?auto_1120 ) ( SURFACE-AT ?auto_1115 ?auto_1119 ) ( ON ?auto_1115 ?auto_1121 ) ( CLEAR ?auto_1115 ) ( TRUCK-AT ?auto_1118 ?auto_1117 ) ( not ( = ?auto_1114 ?auto_1115 ) ) ( not ( = ?auto_1114 ?auto_1121 ) ) ( not ( = ?auto_1115 ?auto_1121 ) ) ( not ( = ?auto_1116 ?auto_1120 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1118 ?auto_1117 ?auto_1119 )
      ( !LIFT ?auto_1120 ?auto_1115 ?auto_1121 ?auto_1119 )
      ( !LOAD ?auto_1120 ?auto_1115 ?auto_1118 ?auto_1119 )
      ( !DRIVE ?auto_1118 ?auto_1119 ?auto_1117 )
      ( !UNLOAD ?auto_1116 ?auto_1115 ?auto_1118 ?auto_1117 )
      ( !DROP ?auto_1116 ?auto_1115 ?auto_1114 ?auto_1117 )
      ( MAKE-1CRATE-VERIFY ?auto_1114 ?auto_1115 ) )
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
      ?auto_1129 - HOIST
      ?auto_1132 - PLACE
      ?auto_1130 - PLACE
      ?auto_1133 - HOIST
      ?auto_1131 - SURFACE
      ?auto_1135 - PLACE
      ?auto_1136 - HOIST
      ?auto_1134 - SURFACE
      ?auto_1128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129 ?auto_1132 ) ( IS-CRATE ?auto_1127 ) ( not ( = ?auto_1130 ?auto_1132 ) ) ( HOIST-AT ?auto_1133 ?auto_1130 ) ( AVAILABLE ?auto_1133 ) ( SURFACE-AT ?auto_1127 ?auto_1130 ) ( ON ?auto_1127 ?auto_1131 ) ( CLEAR ?auto_1127 ) ( not ( = ?auto_1126 ?auto_1127 ) ) ( not ( = ?auto_1126 ?auto_1131 ) ) ( not ( = ?auto_1127 ?auto_1131 ) ) ( not ( = ?auto_1129 ?auto_1133 ) ) ( SURFACE-AT ?auto_1125 ?auto_1132 ) ( CLEAR ?auto_1125 ) ( IS-CRATE ?auto_1126 ) ( AVAILABLE ?auto_1129 ) ( not ( = ?auto_1135 ?auto_1132 ) ) ( HOIST-AT ?auto_1136 ?auto_1135 ) ( AVAILABLE ?auto_1136 ) ( SURFACE-AT ?auto_1126 ?auto_1135 ) ( ON ?auto_1126 ?auto_1134 ) ( CLEAR ?auto_1126 ) ( TRUCK-AT ?auto_1128 ?auto_1132 ) ( not ( = ?auto_1125 ?auto_1126 ) ) ( not ( = ?auto_1125 ?auto_1134 ) ) ( not ( = ?auto_1126 ?auto_1134 ) ) ( not ( = ?auto_1129 ?auto_1136 ) ) ( not ( = ?auto_1125 ?auto_1127 ) ) ( not ( = ?auto_1125 ?auto_1131 ) ) ( not ( = ?auto_1127 ?auto_1134 ) ) ( not ( = ?auto_1130 ?auto_1135 ) ) ( not ( = ?auto_1133 ?auto_1136 ) ) ( not ( = ?auto_1131 ?auto_1134 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1125 ?auto_1126 )
      ( MAKE-1CRATE ?auto_1126 ?auto_1127 )
      ( MAKE-2CRATE-VERIFY ?auto_1125 ?auto_1126 ?auto_1127 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1139 - SURFACE
      ?auto_1140 - SURFACE
    )
    :vars
    (
      ?auto_1141 - HOIST
      ?auto_1142 - PLACE
      ?auto_1144 - PLACE
      ?auto_1145 - HOIST
      ?auto_1146 - SURFACE
      ?auto_1143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1141 ?auto_1142 ) ( SURFACE-AT ?auto_1139 ?auto_1142 ) ( CLEAR ?auto_1139 ) ( IS-CRATE ?auto_1140 ) ( AVAILABLE ?auto_1141 ) ( not ( = ?auto_1144 ?auto_1142 ) ) ( HOIST-AT ?auto_1145 ?auto_1144 ) ( AVAILABLE ?auto_1145 ) ( SURFACE-AT ?auto_1140 ?auto_1144 ) ( ON ?auto_1140 ?auto_1146 ) ( CLEAR ?auto_1140 ) ( TRUCK-AT ?auto_1143 ?auto_1142 ) ( not ( = ?auto_1139 ?auto_1140 ) ) ( not ( = ?auto_1139 ?auto_1146 ) ) ( not ( = ?auto_1140 ?auto_1146 ) ) ( not ( = ?auto_1141 ?auto_1145 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1143 ?auto_1142 ?auto_1144 )
      ( !LIFT ?auto_1145 ?auto_1140 ?auto_1146 ?auto_1144 )
      ( !LOAD ?auto_1145 ?auto_1140 ?auto_1143 ?auto_1144 )
      ( !DRIVE ?auto_1143 ?auto_1144 ?auto_1142 )
      ( !UNLOAD ?auto_1141 ?auto_1140 ?auto_1143 ?auto_1142 )
      ( !DROP ?auto_1141 ?auto_1140 ?auto_1139 ?auto_1142 )
      ( MAKE-1CRATE-VERIFY ?auto_1139 ?auto_1140 ) )
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
      ?auto_1156 - HOIST
      ?auto_1158 - PLACE
      ?auto_1155 - PLACE
      ?auto_1159 - HOIST
      ?auto_1160 - SURFACE
      ?auto_1166 - PLACE
      ?auto_1164 - HOIST
      ?auto_1162 - SURFACE
      ?auto_1163 - PLACE
      ?auto_1165 - HOIST
      ?auto_1161 - SURFACE
      ?auto_1157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1156 ?auto_1158 ) ( IS-CRATE ?auto_1154 ) ( not ( = ?auto_1155 ?auto_1158 ) ) ( HOIST-AT ?auto_1159 ?auto_1155 ) ( AVAILABLE ?auto_1159 ) ( SURFACE-AT ?auto_1154 ?auto_1155 ) ( ON ?auto_1154 ?auto_1160 ) ( CLEAR ?auto_1154 ) ( not ( = ?auto_1153 ?auto_1154 ) ) ( not ( = ?auto_1153 ?auto_1160 ) ) ( not ( = ?auto_1154 ?auto_1160 ) ) ( not ( = ?auto_1156 ?auto_1159 ) ) ( IS-CRATE ?auto_1153 ) ( not ( = ?auto_1166 ?auto_1158 ) ) ( HOIST-AT ?auto_1164 ?auto_1166 ) ( AVAILABLE ?auto_1164 ) ( SURFACE-AT ?auto_1153 ?auto_1166 ) ( ON ?auto_1153 ?auto_1162 ) ( CLEAR ?auto_1153 ) ( not ( = ?auto_1152 ?auto_1153 ) ) ( not ( = ?auto_1152 ?auto_1162 ) ) ( not ( = ?auto_1153 ?auto_1162 ) ) ( not ( = ?auto_1156 ?auto_1164 ) ) ( SURFACE-AT ?auto_1151 ?auto_1158 ) ( CLEAR ?auto_1151 ) ( IS-CRATE ?auto_1152 ) ( AVAILABLE ?auto_1156 ) ( not ( = ?auto_1163 ?auto_1158 ) ) ( HOIST-AT ?auto_1165 ?auto_1163 ) ( AVAILABLE ?auto_1165 ) ( SURFACE-AT ?auto_1152 ?auto_1163 ) ( ON ?auto_1152 ?auto_1161 ) ( CLEAR ?auto_1152 ) ( TRUCK-AT ?auto_1157 ?auto_1158 ) ( not ( = ?auto_1151 ?auto_1152 ) ) ( not ( = ?auto_1151 ?auto_1161 ) ) ( not ( = ?auto_1152 ?auto_1161 ) ) ( not ( = ?auto_1156 ?auto_1165 ) ) ( not ( = ?auto_1151 ?auto_1153 ) ) ( not ( = ?auto_1151 ?auto_1162 ) ) ( not ( = ?auto_1153 ?auto_1161 ) ) ( not ( = ?auto_1166 ?auto_1163 ) ) ( not ( = ?auto_1164 ?auto_1165 ) ) ( not ( = ?auto_1162 ?auto_1161 ) ) ( not ( = ?auto_1151 ?auto_1154 ) ) ( not ( = ?auto_1151 ?auto_1160 ) ) ( not ( = ?auto_1152 ?auto_1154 ) ) ( not ( = ?auto_1152 ?auto_1160 ) ) ( not ( = ?auto_1154 ?auto_1162 ) ) ( not ( = ?auto_1154 ?auto_1161 ) ) ( not ( = ?auto_1155 ?auto_1166 ) ) ( not ( = ?auto_1155 ?auto_1163 ) ) ( not ( = ?auto_1159 ?auto_1164 ) ) ( not ( = ?auto_1159 ?auto_1165 ) ) ( not ( = ?auto_1160 ?auto_1162 ) ) ( not ( = ?auto_1160 ?auto_1161 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1151 ?auto_1152 ?auto_1153 )
      ( MAKE-1CRATE ?auto_1153 ?auto_1154 )
      ( MAKE-3CRATE-VERIFY ?auto_1151 ?auto_1152 ?auto_1153 ?auto_1154 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1169 - SURFACE
      ?auto_1170 - SURFACE
    )
    :vars
    (
      ?auto_1171 - HOIST
      ?auto_1172 - PLACE
      ?auto_1174 - PLACE
      ?auto_1175 - HOIST
      ?auto_1176 - SURFACE
      ?auto_1173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1171 ?auto_1172 ) ( SURFACE-AT ?auto_1169 ?auto_1172 ) ( CLEAR ?auto_1169 ) ( IS-CRATE ?auto_1170 ) ( AVAILABLE ?auto_1171 ) ( not ( = ?auto_1174 ?auto_1172 ) ) ( HOIST-AT ?auto_1175 ?auto_1174 ) ( AVAILABLE ?auto_1175 ) ( SURFACE-AT ?auto_1170 ?auto_1174 ) ( ON ?auto_1170 ?auto_1176 ) ( CLEAR ?auto_1170 ) ( TRUCK-AT ?auto_1173 ?auto_1172 ) ( not ( = ?auto_1169 ?auto_1170 ) ) ( not ( = ?auto_1169 ?auto_1176 ) ) ( not ( = ?auto_1170 ?auto_1176 ) ) ( not ( = ?auto_1171 ?auto_1175 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1173 ?auto_1172 ?auto_1174 )
      ( !LIFT ?auto_1175 ?auto_1170 ?auto_1176 ?auto_1174 )
      ( !LOAD ?auto_1175 ?auto_1170 ?auto_1173 ?auto_1174 )
      ( !DRIVE ?auto_1173 ?auto_1174 ?auto_1172 )
      ( !UNLOAD ?auto_1171 ?auto_1170 ?auto_1173 ?auto_1172 )
      ( !DROP ?auto_1171 ?auto_1170 ?auto_1169 ?auto_1172 )
      ( MAKE-1CRATE-VERIFY ?auto_1169 ?auto_1170 ) )
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
      ?auto_1187 - HOIST
      ?auto_1190 - PLACE
      ?auto_1191 - PLACE
      ?auto_1189 - HOIST
      ?auto_1188 - SURFACE
      ?auto_1198 - SURFACE
      ?auto_1195 - PLACE
      ?auto_1199 - HOIST
      ?auto_1197 - SURFACE
      ?auto_1194 - PLACE
      ?auto_1193 - HOIST
      ?auto_1196 - SURFACE
      ?auto_1192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1187 ?auto_1190 ) ( IS-CRATE ?auto_1186 ) ( not ( = ?auto_1191 ?auto_1190 ) ) ( HOIST-AT ?auto_1189 ?auto_1191 ) ( SURFACE-AT ?auto_1186 ?auto_1191 ) ( ON ?auto_1186 ?auto_1188 ) ( CLEAR ?auto_1186 ) ( not ( = ?auto_1185 ?auto_1186 ) ) ( not ( = ?auto_1185 ?auto_1188 ) ) ( not ( = ?auto_1186 ?auto_1188 ) ) ( not ( = ?auto_1187 ?auto_1189 ) ) ( IS-CRATE ?auto_1185 ) ( AVAILABLE ?auto_1189 ) ( SURFACE-AT ?auto_1185 ?auto_1191 ) ( ON ?auto_1185 ?auto_1198 ) ( CLEAR ?auto_1185 ) ( not ( = ?auto_1184 ?auto_1185 ) ) ( not ( = ?auto_1184 ?auto_1198 ) ) ( not ( = ?auto_1185 ?auto_1198 ) ) ( IS-CRATE ?auto_1184 ) ( not ( = ?auto_1195 ?auto_1190 ) ) ( HOIST-AT ?auto_1199 ?auto_1195 ) ( AVAILABLE ?auto_1199 ) ( SURFACE-AT ?auto_1184 ?auto_1195 ) ( ON ?auto_1184 ?auto_1197 ) ( CLEAR ?auto_1184 ) ( not ( = ?auto_1183 ?auto_1184 ) ) ( not ( = ?auto_1183 ?auto_1197 ) ) ( not ( = ?auto_1184 ?auto_1197 ) ) ( not ( = ?auto_1187 ?auto_1199 ) ) ( SURFACE-AT ?auto_1182 ?auto_1190 ) ( CLEAR ?auto_1182 ) ( IS-CRATE ?auto_1183 ) ( AVAILABLE ?auto_1187 ) ( not ( = ?auto_1194 ?auto_1190 ) ) ( HOIST-AT ?auto_1193 ?auto_1194 ) ( AVAILABLE ?auto_1193 ) ( SURFACE-AT ?auto_1183 ?auto_1194 ) ( ON ?auto_1183 ?auto_1196 ) ( CLEAR ?auto_1183 ) ( TRUCK-AT ?auto_1192 ?auto_1190 ) ( not ( = ?auto_1182 ?auto_1183 ) ) ( not ( = ?auto_1182 ?auto_1196 ) ) ( not ( = ?auto_1183 ?auto_1196 ) ) ( not ( = ?auto_1187 ?auto_1193 ) ) ( not ( = ?auto_1182 ?auto_1184 ) ) ( not ( = ?auto_1182 ?auto_1197 ) ) ( not ( = ?auto_1184 ?auto_1196 ) ) ( not ( = ?auto_1195 ?auto_1194 ) ) ( not ( = ?auto_1199 ?auto_1193 ) ) ( not ( = ?auto_1197 ?auto_1196 ) ) ( not ( = ?auto_1182 ?auto_1185 ) ) ( not ( = ?auto_1182 ?auto_1198 ) ) ( not ( = ?auto_1183 ?auto_1185 ) ) ( not ( = ?auto_1183 ?auto_1198 ) ) ( not ( = ?auto_1185 ?auto_1197 ) ) ( not ( = ?auto_1185 ?auto_1196 ) ) ( not ( = ?auto_1191 ?auto_1195 ) ) ( not ( = ?auto_1191 ?auto_1194 ) ) ( not ( = ?auto_1189 ?auto_1199 ) ) ( not ( = ?auto_1189 ?auto_1193 ) ) ( not ( = ?auto_1198 ?auto_1197 ) ) ( not ( = ?auto_1198 ?auto_1196 ) ) ( not ( = ?auto_1182 ?auto_1186 ) ) ( not ( = ?auto_1182 ?auto_1188 ) ) ( not ( = ?auto_1183 ?auto_1186 ) ) ( not ( = ?auto_1183 ?auto_1188 ) ) ( not ( = ?auto_1184 ?auto_1186 ) ) ( not ( = ?auto_1184 ?auto_1188 ) ) ( not ( = ?auto_1186 ?auto_1198 ) ) ( not ( = ?auto_1186 ?auto_1197 ) ) ( not ( = ?auto_1186 ?auto_1196 ) ) ( not ( = ?auto_1188 ?auto_1198 ) ) ( not ( = ?auto_1188 ?auto_1197 ) ) ( not ( = ?auto_1188 ?auto_1196 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1182 ?auto_1183 ?auto_1184 ?auto_1185 )
      ( MAKE-1CRATE ?auto_1185 ?auto_1186 )
      ( MAKE-4CRATE-VERIFY ?auto_1182 ?auto_1183 ?auto_1184 ?auto_1185 ?auto_1186 ) )
  )

  ( :method MAKE-1CRATE
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
    ( and ( HOIST-AT ?auto_1204 ?auto_1205 ) ( SURFACE-AT ?auto_1202 ?auto_1205 ) ( CLEAR ?auto_1202 ) ( IS-CRATE ?auto_1203 ) ( AVAILABLE ?auto_1204 ) ( not ( = ?auto_1207 ?auto_1205 ) ) ( HOIST-AT ?auto_1208 ?auto_1207 ) ( AVAILABLE ?auto_1208 ) ( SURFACE-AT ?auto_1203 ?auto_1207 ) ( ON ?auto_1203 ?auto_1209 ) ( CLEAR ?auto_1203 ) ( TRUCK-AT ?auto_1206 ?auto_1205 ) ( not ( = ?auto_1202 ?auto_1203 ) ) ( not ( = ?auto_1202 ?auto_1209 ) ) ( not ( = ?auto_1203 ?auto_1209 ) ) ( not ( = ?auto_1204 ?auto_1208 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1206 ?auto_1205 ?auto_1207 )
      ( !LIFT ?auto_1208 ?auto_1203 ?auto_1209 ?auto_1207 )
      ( !LOAD ?auto_1208 ?auto_1203 ?auto_1206 ?auto_1207 )
      ( !DRIVE ?auto_1206 ?auto_1207 ?auto_1205 )
      ( !UNLOAD ?auto_1204 ?auto_1203 ?auto_1206 ?auto_1205 )
      ( !DROP ?auto_1204 ?auto_1203 ?auto_1202 ?auto_1205 )
      ( MAKE-1CRATE-VERIFY ?auto_1202 ?auto_1203 ) )
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
      ?auto_1222 - HOIST
      ?auto_1224 - PLACE
      ?auto_1225 - PLACE
      ?auto_1223 - HOIST
      ?auto_1226 - SURFACE
      ?auto_1230 - PLACE
      ?auto_1235 - HOIST
      ?auto_1228 - SURFACE
      ?auto_1237 - SURFACE
      ?auto_1233 - PLACE
      ?auto_1229 - HOIST
      ?auto_1236 - SURFACE
      ?auto_1231 - PLACE
      ?auto_1234 - HOIST
      ?auto_1232 - SURFACE
      ?auto_1227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1222 ?auto_1224 ) ( IS-CRATE ?auto_1221 ) ( not ( = ?auto_1225 ?auto_1224 ) ) ( HOIST-AT ?auto_1223 ?auto_1225 ) ( AVAILABLE ?auto_1223 ) ( SURFACE-AT ?auto_1221 ?auto_1225 ) ( ON ?auto_1221 ?auto_1226 ) ( CLEAR ?auto_1221 ) ( not ( = ?auto_1220 ?auto_1221 ) ) ( not ( = ?auto_1220 ?auto_1226 ) ) ( not ( = ?auto_1221 ?auto_1226 ) ) ( not ( = ?auto_1222 ?auto_1223 ) ) ( IS-CRATE ?auto_1220 ) ( not ( = ?auto_1230 ?auto_1224 ) ) ( HOIST-AT ?auto_1235 ?auto_1230 ) ( SURFACE-AT ?auto_1220 ?auto_1230 ) ( ON ?auto_1220 ?auto_1228 ) ( CLEAR ?auto_1220 ) ( not ( = ?auto_1219 ?auto_1220 ) ) ( not ( = ?auto_1219 ?auto_1228 ) ) ( not ( = ?auto_1220 ?auto_1228 ) ) ( not ( = ?auto_1222 ?auto_1235 ) ) ( IS-CRATE ?auto_1219 ) ( AVAILABLE ?auto_1235 ) ( SURFACE-AT ?auto_1219 ?auto_1230 ) ( ON ?auto_1219 ?auto_1237 ) ( CLEAR ?auto_1219 ) ( not ( = ?auto_1218 ?auto_1219 ) ) ( not ( = ?auto_1218 ?auto_1237 ) ) ( not ( = ?auto_1219 ?auto_1237 ) ) ( IS-CRATE ?auto_1218 ) ( not ( = ?auto_1233 ?auto_1224 ) ) ( HOIST-AT ?auto_1229 ?auto_1233 ) ( AVAILABLE ?auto_1229 ) ( SURFACE-AT ?auto_1218 ?auto_1233 ) ( ON ?auto_1218 ?auto_1236 ) ( CLEAR ?auto_1218 ) ( not ( = ?auto_1217 ?auto_1218 ) ) ( not ( = ?auto_1217 ?auto_1236 ) ) ( not ( = ?auto_1218 ?auto_1236 ) ) ( not ( = ?auto_1222 ?auto_1229 ) ) ( SURFACE-AT ?auto_1216 ?auto_1224 ) ( CLEAR ?auto_1216 ) ( IS-CRATE ?auto_1217 ) ( AVAILABLE ?auto_1222 ) ( not ( = ?auto_1231 ?auto_1224 ) ) ( HOIST-AT ?auto_1234 ?auto_1231 ) ( AVAILABLE ?auto_1234 ) ( SURFACE-AT ?auto_1217 ?auto_1231 ) ( ON ?auto_1217 ?auto_1232 ) ( CLEAR ?auto_1217 ) ( TRUCK-AT ?auto_1227 ?auto_1224 ) ( not ( = ?auto_1216 ?auto_1217 ) ) ( not ( = ?auto_1216 ?auto_1232 ) ) ( not ( = ?auto_1217 ?auto_1232 ) ) ( not ( = ?auto_1222 ?auto_1234 ) ) ( not ( = ?auto_1216 ?auto_1218 ) ) ( not ( = ?auto_1216 ?auto_1236 ) ) ( not ( = ?auto_1218 ?auto_1232 ) ) ( not ( = ?auto_1233 ?auto_1231 ) ) ( not ( = ?auto_1229 ?auto_1234 ) ) ( not ( = ?auto_1236 ?auto_1232 ) ) ( not ( = ?auto_1216 ?auto_1219 ) ) ( not ( = ?auto_1216 ?auto_1237 ) ) ( not ( = ?auto_1217 ?auto_1219 ) ) ( not ( = ?auto_1217 ?auto_1237 ) ) ( not ( = ?auto_1219 ?auto_1236 ) ) ( not ( = ?auto_1219 ?auto_1232 ) ) ( not ( = ?auto_1230 ?auto_1233 ) ) ( not ( = ?auto_1230 ?auto_1231 ) ) ( not ( = ?auto_1235 ?auto_1229 ) ) ( not ( = ?auto_1235 ?auto_1234 ) ) ( not ( = ?auto_1237 ?auto_1236 ) ) ( not ( = ?auto_1237 ?auto_1232 ) ) ( not ( = ?auto_1216 ?auto_1220 ) ) ( not ( = ?auto_1216 ?auto_1228 ) ) ( not ( = ?auto_1217 ?auto_1220 ) ) ( not ( = ?auto_1217 ?auto_1228 ) ) ( not ( = ?auto_1218 ?auto_1220 ) ) ( not ( = ?auto_1218 ?auto_1228 ) ) ( not ( = ?auto_1220 ?auto_1237 ) ) ( not ( = ?auto_1220 ?auto_1236 ) ) ( not ( = ?auto_1220 ?auto_1232 ) ) ( not ( = ?auto_1228 ?auto_1237 ) ) ( not ( = ?auto_1228 ?auto_1236 ) ) ( not ( = ?auto_1228 ?auto_1232 ) ) ( not ( = ?auto_1216 ?auto_1221 ) ) ( not ( = ?auto_1216 ?auto_1226 ) ) ( not ( = ?auto_1217 ?auto_1221 ) ) ( not ( = ?auto_1217 ?auto_1226 ) ) ( not ( = ?auto_1218 ?auto_1221 ) ) ( not ( = ?auto_1218 ?auto_1226 ) ) ( not ( = ?auto_1219 ?auto_1221 ) ) ( not ( = ?auto_1219 ?auto_1226 ) ) ( not ( = ?auto_1221 ?auto_1228 ) ) ( not ( = ?auto_1221 ?auto_1237 ) ) ( not ( = ?auto_1221 ?auto_1236 ) ) ( not ( = ?auto_1221 ?auto_1232 ) ) ( not ( = ?auto_1225 ?auto_1230 ) ) ( not ( = ?auto_1225 ?auto_1233 ) ) ( not ( = ?auto_1225 ?auto_1231 ) ) ( not ( = ?auto_1223 ?auto_1235 ) ) ( not ( = ?auto_1223 ?auto_1229 ) ) ( not ( = ?auto_1223 ?auto_1234 ) ) ( not ( = ?auto_1226 ?auto_1228 ) ) ( not ( = ?auto_1226 ?auto_1237 ) ) ( not ( = ?auto_1226 ?auto_1236 ) ) ( not ( = ?auto_1226 ?auto_1232 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1216 ?auto_1217 ?auto_1218 ?auto_1219 ?auto_1220 )
      ( MAKE-1CRATE ?auto_1220 ?auto_1221 )
      ( MAKE-5CRATE-VERIFY ?auto_1216 ?auto_1217 ?auto_1218 ?auto_1219 ?auto_1220 ?auto_1221 ) )
  )

)

