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
      ?auto_5062 - SURFACE
      ?auto_5063 - SURFACE
    )
    :vars
    (
      ?auto_5064 - HOIST
      ?auto_5065 - PLACE
      ?auto_5067 - PLACE
      ?auto_5068 - HOIST
      ?auto_5069 - SURFACE
      ?auto_5066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5064 ?auto_5065 ) ( SURFACE-AT ?auto_5063 ?auto_5065 ) ( CLEAR ?auto_5063 ) ( IS-CRATE ?auto_5062 ) ( AVAILABLE ?auto_5064 ) ( not ( = ?auto_5067 ?auto_5065 ) ) ( HOIST-AT ?auto_5068 ?auto_5067 ) ( AVAILABLE ?auto_5068 ) ( SURFACE-AT ?auto_5062 ?auto_5067 ) ( ON ?auto_5062 ?auto_5069 ) ( CLEAR ?auto_5062 ) ( TRUCK-AT ?auto_5066 ?auto_5065 ) ( not ( = ?auto_5062 ?auto_5063 ) ) ( not ( = ?auto_5062 ?auto_5069 ) ) ( not ( = ?auto_5063 ?auto_5069 ) ) ( not ( = ?auto_5064 ?auto_5068 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5066 ?auto_5065 ?auto_5067 )
      ( !LIFT ?auto_5068 ?auto_5062 ?auto_5069 ?auto_5067 )
      ( !LOAD ?auto_5068 ?auto_5062 ?auto_5066 ?auto_5067 )
      ( !DRIVE ?auto_5066 ?auto_5067 ?auto_5065 )
      ( !UNLOAD ?auto_5064 ?auto_5062 ?auto_5066 ?auto_5065 )
      ( !DROP ?auto_5064 ?auto_5062 ?auto_5063 ?auto_5065 )
      ( MAKE-ON-VERIFY ?auto_5062 ?auto_5063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5072 - SURFACE
      ?auto_5073 - SURFACE
    )
    :vars
    (
      ?auto_5074 - HOIST
      ?auto_5075 - PLACE
      ?auto_5077 - PLACE
      ?auto_5078 - HOIST
      ?auto_5079 - SURFACE
      ?auto_5076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5074 ?auto_5075 ) ( SURFACE-AT ?auto_5073 ?auto_5075 ) ( CLEAR ?auto_5073 ) ( IS-CRATE ?auto_5072 ) ( AVAILABLE ?auto_5074 ) ( not ( = ?auto_5077 ?auto_5075 ) ) ( HOIST-AT ?auto_5078 ?auto_5077 ) ( AVAILABLE ?auto_5078 ) ( SURFACE-AT ?auto_5072 ?auto_5077 ) ( ON ?auto_5072 ?auto_5079 ) ( CLEAR ?auto_5072 ) ( TRUCK-AT ?auto_5076 ?auto_5075 ) ( not ( = ?auto_5072 ?auto_5073 ) ) ( not ( = ?auto_5072 ?auto_5079 ) ) ( not ( = ?auto_5073 ?auto_5079 ) ) ( not ( = ?auto_5074 ?auto_5078 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5076 ?auto_5075 ?auto_5077 )
      ( !LIFT ?auto_5078 ?auto_5072 ?auto_5079 ?auto_5077 )
      ( !LOAD ?auto_5078 ?auto_5072 ?auto_5076 ?auto_5077 )
      ( !DRIVE ?auto_5076 ?auto_5077 ?auto_5075 )
      ( !UNLOAD ?auto_5074 ?auto_5072 ?auto_5076 ?auto_5075 )
      ( !DROP ?auto_5074 ?auto_5072 ?auto_5073 ?auto_5075 )
      ( MAKE-ON-VERIFY ?auto_5072 ?auto_5073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5082 - SURFACE
      ?auto_5083 - SURFACE
    )
    :vars
    (
      ?auto_5084 - HOIST
      ?auto_5085 - PLACE
      ?auto_5087 - PLACE
      ?auto_5088 - HOIST
      ?auto_5089 - SURFACE
      ?auto_5086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5084 ?auto_5085 ) ( SURFACE-AT ?auto_5083 ?auto_5085 ) ( CLEAR ?auto_5083 ) ( IS-CRATE ?auto_5082 ) ( AVAILABLE ?auto_5084 ) ( not ( = ?auto_5087 ?auto_5085 ) ) ( HOIST-AT ?auto_5088 ?auto_5087 ) ( AVAILABLE ?auto_5088 ) ( SURFACE-AT ?auto_5082 ?auto_5087 ) ( ON ?auto_5082 ?auto_5089 ) ( CLEAR ?auto_5082 ) ( TRUCK-AT ?auto_5086 ?auto_5085 ) ( not ( = ?auto_5082 ?auto_5083 ) ) ( not ( = ?auto_5082 ?auto_5089 ) ) ( not ( = ?auto_5083 ?auto_5089 ) ) ( not ( = ?auto_5084 ?auto_5088 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5086 ?auto_5085 ?auto_5087 )
      ( !LIFT ?auto_5088 ?auto_5082 ?auto_5089 ?auto_5087 )
      ( !LOAD ?auto_5088 ?auto_5082 ?auto_5086 ?auto_5087 )
      ( !DRIVE ?auto_5086 ?auto_5087 ?auto_5085 )
      ( !UNLOAD ?auto_5084 ?auto_5082 ?auto_5086 ?auto_5085 )
      ( !DROP ?auto_5084 ?auto_5082 ?auto_5083 ?auto_5085 )
      ( MAKE-ON-VERIFY ?auto_5082 ?auto_5083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5092 - SURFACE
      ?auto_5093 - SURFACE
    )
    :vars
    (
      ?auto_5094 - HOIST
      ?auto_5095 - PLACE
      ?auto_5097 - PLACE
      ?auto_5098 - HOIST
      ?auto_5099 - SURFACE
      ?auto_5096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5094 ?auto_5095 ) ( SURFACE-AT ?auto_5093 ?auto_5095 ) ( CLEAR ?auto_5093 ) ( IS-CRATE ?auto_5092 ) ( AVAILABLE ?auto_5094 ) ( not ( = ?auto_5097 ?auto_5095 ) ) ( HOIST-AT ?auto_5098 ?auto_5097 ) ( AVAILABLE ?auto_5098 ) ( SURFACE-AT ?auto_5092 ?auto_5097 ) ( ON ?auto_5092 ?auto_5099 ) ( CLEAR ?auto_5092 ) ( TRUCK-AT ?auto_5096 ?auto_5095 ) ( not ( = ?auto_5092 ?auto_5093 ) ) ( not ( = ?auto_5092 ?auto_5099 ) ) ( not ( = ?auto_5093 ?auto_5099 ) ) ( not ( = ?auto_5094 ?auto_5098 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5096 ?auto_5095 ?auto_5097 )
      ( !LIFT ?auto_5098 ?auto_5092 ?auto_5099 ?auto_5097 )
      ( !LOAD ?auto_5098 ?auto_5092 ?auto_5096 ?auto_5097 )
      ( !DRIVE ?auto_5096 ?auto_5097 ?auto_5095 )
      ( !UNLOAD ?auto_5094 ?auto_5092 ?auto_5096 ?auto_5095 )
      ( !DROP ?auto_5094 ?auto_5092 ?auto_5093 ?auto_5095 )
      ( MAKE-ON-VERIFY ?auto_5092 ?auto_5093 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5102 - SURFACE
      ?auto_5103 - SURFACE
    )
    :vars
    (
      ?auto_5104 - HOIST
      ?auto_5105 - PLACE
      ?auto_5107 - PLACE
      ?auto_5108 - HOIST
      ?auto_5109 - SURFACE
      ?auto_5106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5104 ?auto_5105 ) ( SURFACE-AT ?auto_5103 ?auto_5105 ) ( CLEAR ?auto_5103 ) ( IS-CRATE ?auto_5102 ) ( AVAILABLE ?auto_5104 ) ( not ( = ?auto_5107 ?auto_5105 ) ) ( HOIST-AT ?auto_5108 ?auto_5107 ) ( AVAILABLE ?auto_5108 ) ( SURFACE-AT ?auto_5102 ?auto_5107 ) ( ON ?auto_5102 ?auto_5109 ) ( CLEAR ?auto_5102 ) ( TRUCK-AT ?auto_5106 ?auto_5105 ) ( not ( = ?auto_5102 ?auto_5103 ) ) ( not ( = ?auto_5102 ?auto_5109 ) ) ( not ( = ?auto_5103 ?auto_5109 ) ) ( not ( = ?auto_5104 ?auto_5108 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5106 ?auto_5105 ?auto_5107 )
      ( !LIFT ?auto_5108 ?auto_5102 ?auto_5109 ?auto_5107 )
      ( !LOAD ?auto_5108 ?auto_5102 ?auto_5106 ?auto_5107 )
      ( !DRIVE ?auto_5106 ?auto_5107 ?auto_5105 )
      ( !UNLOAD ?auto_5104 ?auto_5102 ?auto_5106 ?auto_5105 )
      ( !DROP ?auto_5104 ?auto_5102 ?auto_5103 ?auto_5105 )
      ( MAKE-ON-VERIFY ?auto_5102 ?auto_5103 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5112 - SURFACE
      ?auto_5113 - SURFACE
    )
    :vars
    (
      ?auto_5114 - HOIST
      ?auto_5115 - PLACE
      ?auto_5117 - PLACE
      ?auto_5118 - HOIST
      ?auto_5119 - SURFACE
      ?auto_5116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5114 ?auto_5115 ) ( SURFACE-AT ?auto_5113 ?auto_5115 ) ( CLEAR ?auto_5113 ) ( IS-CRATE ?auto_5112 ) ( AVAILABLE ?auto_5114 ) ( not ( = ?auto_5117 ?auto_5115 ) ) ( HOIST-AT ?auto_5118 ?auto_5117 ) ( AVAILABLE ?auto_5118 ) ( SURFACE-AT ?auto_5112 ?auto_5117 ) ( ON ?auto_5112 ?auto_5119 ) ( CLEAR ?auto_5112 ) ( TRUCK-AT ?auto_5116 ?auto_5115 ) ( not ( = ?auto_5112 ?auto_5113 ) ) ( not ( = ?auto_5112 ?auto_5119 ) ) ( not ( = ?auto_5113 ?auto_5119 ) ) ( not ( = ?auto_5114 ?auto_5118 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5116 ?auto_5115 ?auto_5117 )
      ( !LIFT ?auto_5118 ?auto_5112 ?auto_5119 ?auto_5117 )
      ( !LOAD ?auto_5118 ?auto_5112 ?auto_5116 ?auto_5117 )
      ( !DRIVE ?auto_5116 ?auto_5117 ?auto_5115 )
      ( !UNLOAD ?auto_5114 ?auto_5112 ?auto_5116 ?auto_5115 )
      ( !DROP ?auto_5114 ?auto_5112 ?auto_5113 ?auto_5115 )
      ( MAKE-ON-VERIFY ?auto_5112 ?auto_5113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5122 - SURFACE
      ?auto_5123 - SURFACE
    )
    :vars
    (
      ?auto_5124 - HOIST
      ?auto_5125 - PLACE
      ?auto_5127 - PLACE
      ?auto_5128 - HOIST
      ?auto_5129 - SURFACE
      ?auto_5126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5124 ?auto_5125 ) ( SURFACE-AT ?auto_5123 ?auto_5125 ) ( CLEAR ?auto_5123 ) ( IS-CRATE ?auto_5122 ) ( AVAILABLE ?auto_5124 ) ( not ( = ?auto_5127 ?auto_5125 ) ) ( HOIST-AT ?auto_5128 ?auto_5127 ) ( AVAILABLE ?auto_5128 ) ( SURFACE-AT ?auto_5122 ?auto_5127 ) ( ON ?auto_5122 ?auto_5129 ) ( CLEAR ?auto_5122 ) ( TRUCK-AT ?auto_5126 ?auto_5125 ) ( not ( = ?auto_5122 ?auto_5123 ) ) ( not ( = ?auto_5122 ?auto_5129 ) ) ( not ( = ?auto_5123 ?auto_5129 ) ) ( not ( = ?auto_5124 ?auto_5128 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5126 ?auto_5125 ?auto_5127 )
      ( !LIFT ?auto_5128 ?auto_5122 ?auto_5129 ?auto_5127 )
      ( !LOAD ?auto_5128 ?auto_5122 ?auto_5126 ?auto_5127 )
      ( !DRIVE ?auto_5126 ?auto_5127 ?auto_5125 )
      ( !UNLOAD ?auto_5124 ?auto_5122 ?auto_5126 ?auto_5125 )
      ( !DROP ?auto_5124 ?auto_5122 ?auto_5123 ?auto_5125 )
      ( MAKE-ON-VERIFY ?auto_5122 ?auto_5123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5132 - SURFACE
      ?auto_5133 - SURFACE
    )
    :vars
    (
      ?auto_5134 - HOIST
      ?auto_5135 - PLACE
      ?auto_5137 - PLACE
      ?auto_5138 - HOIST
      ?auto_5139 - SURFACE
      ?auto_5136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5134 ?auto_5135 ) ( SURFACE-AT ?auto_5133 ?auto_5135 ) ( CLEAR ?auto_5133 ) ( IS-CRATE ?auto_5132 ) ( AVAILABLE ?auto_5134 ) ( not ( = ?auto_5137 ?auto_5135 ) ) ( HOIST-AT ?auto_5138 ?auto_5137 ) ( AVAILABLE ?auto_5138 ) ( SURFACE-AT ?auto_5132 ?auto_5137 ) ( ON ?auto_5132 ?auto_5139 ) ( CLEAR ?auto_5132 ) ( TRUCK-AT ?auto_5136 ?auto_5135 ) ( not ( = ?auto_5132 ?auto_5133 ) ) ( not ( = ?auto_5132 ?auto_5139 ) ) ( not ( = ?auto_5133 ?auto_5139 ) ) ( not ( = ?auto_5134 ?auto_5138 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5136 ?auto_5135 ?auto_5137 )
      ( !LIFT ?auto_5138 ?auto_5132 ?auto_5139 ?auto_5137 )
      ( !LOAD ?auto_5138 ?auto_5132 ?auto_5136 ?auto_5137 )
      ( !DRIVE ?auto_5136 ?auto_5137 ?auto_5135 )
      ( !UNLOAD ?auto_5134 ?auto_5132 ?auto_5136 ?auto_5135 )
      ( !DROP ?auto_5134 ?auto_5132 ?auto_5133 ?auto_5135 )
      ( MAKE-ON-VERIFY ?auto_5132 ?auto_5133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5142 - SURFACE
      ?auto_5143 - SURFACE
    )
    :vars
    (
      ?auto_5144 - HOIST
      ?auto_5145 - PLACE
      ?auto_5147 - PLACE
      ?auto_5148 - HOIST
      ?auto_5149 - SURFACE
      ?auto_5146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5144 ?auto_5145 ) ( SURFACE-AT ?auto_5143 ?auto_5145 ) ( CLEAR ?auto_5143 ) ( IS-CRATE ?auto_5142 ) ( AVAILABLE ?auto_5144 ) ( not ( = ?auto_5147 ?auto_5145 ) ) ( HOIST-AT ?auto_5148 ?auto_5147 ) ( AVAILABLE ?auto_5148 ) ( SURFACE-AT ?auto_5142 ?auto_5147 ) ( ON ?auto_5142 ?auto_5149 ) ( CLEAR ?auto_5142 ) ( TRUCK-AT ?auto_5146 ?auto_5145 ) ( not ( = ?auto_5142 ?auto_5143 ) ) ( not ( = ?auto_5142 ?auto_5149 ) ) ( not ( = ?auto_5143 ?auto_5149 ) ) ( not ( = ?auto_5144 ?auto_5148 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5146 ?auto_5145 ?auto_5147 )
      ( !LIFT ?auto_5148 ?auto_5142 ?auto_5149 ?auto_5147 )
      ( !LOAD ?auto_5148 ?auto_5142 ?auto_5146 ?auto_5147 )
      ( !DRIVE ?auto_5146 ?auto_5147 ?auto_5145 )
      ( !UNLOAD ?auto_5144 ?auto_5142 ?auto_5146 ?auto_5145 )
      ( !DROP ?auto_5144 ?auto_5142 ?auto_5143 ?auto_5145 )
      ( MAKE-ON-VERIFY ?auto_5142 ?auto_5143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5152 - SURFACE
      ?auto_5153 - SURFACE
    )
    :vars
    (
      ?auto_5154 - HOIST
      ?auto_5155 - PLACE
      ?auto_5157 - PLACE
      ?auto_5158 - HOIST
      ?auto_5159 - SURFACE
      ?auto_5156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5154 ?auto_5155 ) ( SURFACE-AT ?auto_5153 ?auto_5155 ) ( CLEAR ?auto_5153 ) ( IS-CRATE ?auto_5152 ) ( AVAILABLE ?auto_5154 ) ( not ( = ?auto_5157 ?auto_5155 ) ) ( HOIST-AT ?auto_5158 ?auto_5157 ) ( AVAILABLE ?auto_5158 ) ( SURFACE-AT ?auto_5152 ?auto_5157 ) ( ON ?auto_5152 ?auto_5159 ) ( CLEAR ?auto_5152 ) ( TRUCK-AT ?auto_5156 ?auto_5155 ) ( not ( = ?auto_5152 ?auto_5153 ) ) ( not ( = ?auto_5152 ?auto_5159 ) ) ( not ( = ?auto_5153 ?auto_5159 ) ) ( not ( = ?auto_5154 ?auto_5158 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5156 ?auto_5155 ?auto_5157 )
      ( !LIFT ?auto_5158 ?auto_5152 ?auto_5159 ?auto_5157 )
      ( !LOAD ?auto_5158 ?auto_5152 ?auto_5156 ?auto_5157 )
      ( !DRIVE ?auto_5156 ?auto_5157 ?auto_5155 )
      ( !UNLOAD ?auto_5154 ?auto_5152 ?auto_5156 ?auto_5155 )
      ( !DROP ?auto_5154 ?auto_5152 ?auto_5153 ?auto_5155 )
      ( MAKE-ON-VERIFY ?auto_5152 ?auto_5153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5162 - SURFACE
      ?auto_5163 - SURFACE
    )
    :vars
    (
      ?auto_5164 - HOIST
      ?auto_5165 - PLACE
      ?auto_5167 - PLACE
      ?auto_5168 - HOIST
      ?auto_5169 - SURFACE
      ?auto_5166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5164 ?auto_5165 ) ( SURFACE-AT ?auto_5163 ?auto_5165 ) ( CLEAR ?auto_5163 ) ( IS-CRATE ?auto_5162 ) ( AVAILABLE ?auto_5164 ) ( not ( = ?auto_5167 ?auto_5165 ) ) ( HOIST-AT ?auto_5168 ?auto_5167 ) ( AVAILABLE ?auto_5168 ) ( SURFACE-AT ?auto_5162 ?auto_5167 ) ( ON ?auto_5162 ?auto_5169 ) ( CLEAR ?auto_5162 ) ( TRUCK-AT ?auto_5166 ?auto_5165 ) ( not ( = ?auto_5162 ?auto_5163 ) ) ( not ( = ?auto_5162 ?auto_5169 ) ) ( not ( = ?auto_5163 ?auto_5169 ) ) ( not ( = ?auto_5164 ?auto_5168 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5166 ?auto_5165 ?auto_5167 )
      ( !LIFT ?auto_5168 ?auto_5162 ?auto_5169 ?auto_5167 )
      ( !LOAD ?auto_5168 ?auto_5162 ?auto_5166 ?auto_5167 )
      ( !DRIVE ?auto_5166 ?auto_5167 ?auto_5165 )
      ( !UNLOAD ?auto_5164 ?auto_5162 ?auto_5166 ?auto_5165 )
      ( !DROP ?auto_5164 ?auto_5162 ?auto_5163 ?auto_5165 )
      ( MAKE-ON-VERIFY ?auto_5162 ?auto_5163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5172 - SURFACE
      ?auto_5173 - SURFACE
    )
    :vars
    (
      ?auto_5174 - HOIST
      ?auto_5175 - PLACE
      ?auto_5177 - PLACE
      ?auto_5178 - HOIST
      ?auto_5179 - SURFACE
      ?auto_5176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5174 ?auto_5175 ) ( SURFACE-AT ?auto_5173 ?auto_5175 ) ( CLEAR ?auto_5173 ) ( IS-CRATE ?auto_5172 ) ( AVAILABLE ?auto_5174 ) ( not ( = ?auto_5177 ?auto_5175 ) ) ( HOIST-AT ?auto_5178 ?auto_5177 ) ( AVAILABLE ?auto_5178 ) ( SURFACE-AT ?auto_5172 ?auto_5177 ) ( ON ?auto_5172 ?auto_5179 ) ( CLEAR ?auto_5172 ) ( TRUCK-AT ?auto_5176 ?auto_5175 ) ( not ( = ?auto_5172 ?auto_5173 ) ) ( not ( = ?auto_5172 ?auto_5179 ) ) ( not ( = ?auto_5173 ?auto_5179 ) ) ( not ( = ?auto_5174 ?auto_5178 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5176 ?auto_5175 ?auto_5177 )
      ( !LIFT ?auto_5178 ?auto_5172 ?auto_5179 ?auto_5177 )
      ( !LOAD ?auto_5178 ?auto_5172 ?auto_5176 ?auto_5177 )
      ( !DRIVE ?auto_5176 ?auto_5177 ?auto_5175 )
      ( !UNLOAD ?auto_5174 ?auto_5172 ?auto_5176 ?auto_5175 )
      ( !DROP ?auto_5174 ?auto_5172 ?auto_5173 ?auto_5175 )
      ( MAKE-ON-VERIFY ?auto_5172 ?auto_5173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5182 - SURFACE
      ?auto_5183 - SURFACE
    )
    :vars
    (
      ?auto_5184 - HOIST
      ?auto_5185 - PLACE
      ?auto_5187 - PLACE
      ?auto_5188 - HOIST
      ?auto_5189 - SURFACE
      ?auto_5186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5184 ?auto_5185 ) ( SURFACE-AT ?auto_5183 ?auto_5185 ) ( CLEAR ?auto_5183 ) ( IS-CRATE ?auto_5182 ) ( AVAILABLE ?auto_5184 ) ( not ( = ?auto_5187 ?auto_5185 ) ) ( HOIST-AT ?auto_5188 ?auto_5187 ) ( AVAILABLE ?auto_5188 ) ( SURFACE-AT ?auto_5182 ?auto_5187 ) ( ON ?auto_5182 ?auto_5189 ) ( CLEAR ?auto_5182 ) ( TRUCK-AT ?auto_5186 ?auto_5185 ) ( not ( = ?auto_5182 ?auto_5183 ) ) ( not ( = ?auto_5182 ?auto_5189 ) ) ( not ( = ?auto_5183 ?auto_5189 ) ) ( not ( = ?auto_5184 ?auto_5188 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5186 ?auto_5185 ?auto_5187 )
      ( !LIFT ?auto_5188 ?auto_5182 ?auto_5189 ?auto_5187 )
      ( !LOAD ?auto_5188 ?auto_5182 ?auto_5186 ?auto_5187 )
      ( !DRIVE ?auto_5186 ?auto_5187 ?auto_5185 )
      ( !UNLOAD ?auto_5184 ?auto_5182 ?auto_5186 ?auto_5185 )
      ( !DROP ?auto_5184 ?auto_5182 ?auto_5183 ?auto_5185 )
      ( MAKE-ON-VERIFY ?auto_5182 ?auto_5183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5192 - SURFACE
      ?auto_5193 - SURFACE
    )
    :vars
    (
      ?auto_5194 - HOIST
      ?auto_5195 - PLACE
      ?auto_5197 - PLACE
      ?auto_5198 - HOIST
      ?auto_5199 - SURFACE
      ?auto_5196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5194 ?auto_5195 ) ( SURFACE-AT ?auto_5193 ?auto_5195 ) ( CLEAR ?auto_5193 ) ( IS-CRATE ?auto_5192 ) ( AVAILABLE ?auto_5194 ) ( not ( = ?auto_5197 ?auto_5195 ) ) ( HOIST-AT ?auto_5198 ?auto_5197 ) ( AVAILABLE ?auto_5198 ) ( SURFACE-AT ?auto_5192 ?auto_5197 ) ( ON ?auto_5192 ?auto_5199 ) ( CLEAR ?auto_5192 ) ( TRUCK-AT ?auto_5196 ?auto_5195 ) ( not ( = ?auto_5192 ?auto_5193 ) ) ( not ( = ?auto_5192 ?auto_5199 ) ) ( not ( = ?auto_5193 ?auto_5199 ) ) ( not ( = ?auto_5194 ?auto_5198 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5196 ?auto_5195 ?auto_5197 )
      ( !LIFT ?auto_5198 ?auto_5192 ?auto_5199 ?auto_5197 )
      ( !LOAD ?auto_5198 ?auto_5192 ?auto_5196 ?auto_5197 )
      ( !DRIVE ?auto_5196 ?auto_5197 ?auto_5195 )
      ( !UNLOAD ?auto_5194 ?auto_5192 ?auto_5196 ?auto_5195 )
      ( !DROP ?auto_5194 ?auto_5192 ?auto_5193 ?auto_5195 )
      ( MAKE-ON-VERIFY ?auto_5192 ?auto_5193 ) )
  )

)

